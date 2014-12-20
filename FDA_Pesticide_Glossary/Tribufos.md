---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.333594, -0.570239, -1.228204, 1, 0, 0, 1,
-2.966939, -0.8772933, -1.891762, 1, 0.007843138, 0, 1,
-2.965798, 0.6195021, -0.3671054, 1, 0.01176471, 0, 1,
-2.835738, -1.146661, -2.233838, 1, 0.01960784, 0, 1,
-2.774683, 0.6751535, -1.400562, 1, 0.02352941, 0, 1,
-2.574847, -0.3657161, -1.006492, 1, 0.03137255, 0, 1,
-2.574012, 0.1778201, -1.542166, 1, 0.03529412, 0, 1,
-2.541747, 0.3508506, -3.343544, 1, 0.04313726, 0, 1,
-2.503786, -0.9961391, -0.009698092, 1, 0.04705882, 0, 1,
-2.483003, 1.092452, -1.054294, 1, 0.05490196, 0, 1,
-2.479593, -0.02639401, -3.600204, 1, 0.05882353, 0, 1,
-2.433297, 1.493611, -0.9236034, 1, 0.06666667, 0, 1,
-2.402809, 0.2281987, -1.90766, 1, 0.07058824, 0, 1,
-2.3506, -1.175683, -2.718665, 1, 0.07843138, 0, 1,
-2.321621, 1.204192, -1.366586, 1, 0.08235294, 0, 1,
-2.289647, 0.7183423, -0.2645095, 1, 0.09019608, 0, 1,
-2.201038, -0.4247779, -2.019439, 1, 0.09411765, 0, 1,
-2.194, -2.477536, -2.598199, 1, 0.1019608, 0, 1,
-2.130095, -0.2918599, 0.7003067, 1, 0.1098039, 0, 1,
-2.117915, -0.6628098, -2.560688, 1, 0.1137255, 0, 1,
-2.113002, 1.435257, -0.08949964, 1, 0.1215686, 0, 1,
-2.110573, -0.9562126, -1.404736, 1, 0.1254902, 0, 1,
-2.090571, 0.5482912, -2.215545, 1, 0.1333333, 0, 1,
-2.04973, -0.2136176, -1.486129, 1, 0.1372549, 0, 1,
-2.047749, -1.321962, -2.574671, 1, 0.145098, 0, 1,
-2.011518, 0.1582744, -1.240922, 1, 0.1490196, 0, 1,
-2.007317, -1.401783, -0.880505, 1, 0.1568628, 0, 1,
-1.970634, -0.7552844, -2.667685, 1, 0.1607843, 0, 1,
-1.96804, -0.580894, -1.248586, 1, 0.1686275, 0, 1,
-1.965954, -1.384896, -2.817871, 1, 0.172549, 0, 1,
-1.948402, 0.4832585, -1.015216, 1, 0.1803922, 0, 1,
-1.935526, -2.099812, -3.004604, 1, 0.1843137, 0, 1,
-1.900508, 0.8065301, -2.66211, 1, 0.1921569, 0, 1,
-1.897151, -0.8729434, -1.576653, 1, 0.1960784, 0, 1,
-1.882365, 0.2881365, -0.8439574, 1, 0.2039216, 0, 1,
-1.868329, 0.839924, -1.106417, 1, 0.2117647, 0, 1,
-1.865817, -1.242892, -1.879087, 1, 0.2156863, 0, 1,
-1.862378, -1.208822, -1.940709, 1, 0.2235294, 0, 1,
-1.841624, -0.6397433, -2.861636, 1, 0.227451, 0, 1,
-1.840344, 0.5031107, 0.3757532, 1, 0.2352941, 0, 1,
-1.82407, 1.462998, -0.01984821, 1, 0.2392157, 0, 1,
-1.767094, 0.8833087, -0.3157059, 1, 0.2470588, 0, 1,
-1.737273, -0.2554031, -1.189302, 1, 0.2509804, 0, 1,
-1.733478, -0.1709919, -1.022689, 1, 0.2588235, 0, 1,
-1.723102, 1.090167, -1.046307, 1, 0.2627451, 0, 1,
-1.720306, -0.7669395, -2.458443, 1, 0.2705882, 0, 1,
-1.714017, 0.2216421, -3.371943, 1, 0.2745098, 0, 1,
-1.703892, 0.7350881, -1.173798, 1, 0.282353, 0, 1,
-1.7021, 0.03680571, -0.3944582, 1, 0.2862745, 0, 1,
-1.666756, -0.314599, -0.7877275, 1, 0.2941177, 0, 1,
-1.662056, 1.000648, -1.465436, 1, 0.3019608, 0, 1,
-1.654224, 0.5537301, -0.2758913, 1, 0.3058824, 0, 1,
-1.653121, 0.1545219, -0.8370943, 1, 0.3137255, 0, 1,
-1.644819, -0.01085122, -0.7591087, 1, 0.3176471, 0, 1,
-1.628012, 1.267012, 0.04346405, 1, 0.3254902, 0, 1,
-1.614183, -0.02333757, -3.646015, 1, 0.3294118, 0, 1,
-1.595623, 8.793842e-05, -1.388283, 1, 0.3372549, 0, 1,
-1.585327, 0.5084935, -2.936179, 1, 0.3411765, 0, 1,
-1.577027, -0.3446165, -2.274774, 1, 0.3490196, 0, 1,
-1.573943, 0.7311814, 0.787864, 1, 0.3529412, 0, 1,
-1.573251, -0.5483667, -1.431489, 1, 0.3607843, 0, 1,
-1.567865, -0.8827016, -2.256414, 1, 0.3647059, 0, 1,
-1.561878, -0.2548598, -1.805367, 1, 0.372549, 0, 1,
-1.559724, 0.4245498, -2.315945, 1, 0.3764706, 0, 1,
-1.550663, -0.7300181, -2.669353, 1, 0.3843137, 0, 1,
-1.545249, -3.212233, -2.426203, 1, 0.3882353, 0, 1,
-1.53337, -1.095847, -2.606135, 1, 0.3960784, 0, 1,
-1.53266, -0.1974415, -3.341718, 1, 0.4039216, 0, 1,
-1.520661, -0.8338898, -2.613794, 1, 0.4078431, 0, 1,
-1.518459, -0.8396085, -2.426997, 1, 0.4156863, 0, 1,
-1.498159, 0.6807166, -1.768441, 1, 0.4196078, 0, 1,
-1.495916, 0.7683241, -1.345925, 1, 0.427451, 0, 1,
-1.487669, -0.7461758, -2.702233, 1, 0.4313726, 0, 1,
-1.466029, -0.9454956, -1.688351, 1, 0.4392157, 0, 1,
-1.447245, 0.1177869, -1.651801, 1, 0.4431373, 0, 1,
-1.437907, 1.221247, -1.15014, 1, 0.4509804, 0, 1,
-1.436849, 1.107591, -1.448807, 1, 0.454902, 0, 1,
-1.416283, -0.4898723, -2.706319, 1, 0.4627451, 0, 1,
-1.412511, -0.3236659, -1.385622, 1, 0.4666667, 0, 1,
-1.408913, -0.8534369, -2.782612, 1, 0.4745098, 0, 1,
-1.392819, 0.4011868, -1.503455, 1, 0.4784314, 0, 1,
-1.383587, 0.1479593, -0.2117759, 1, 0.4862745, 0, 1,
-1.377617, 0.8692465, -1.575189, 1, 0.4901961, 0, 1,
-1.377598, 0.4208837, -1.420687, 1, 0.4980392, 0, 1,
-1.372801, 0.1364215, -0.5900186, 1, 0.5058824, 0, 1,
-1.364073, -0.867596, 0.1085886, 1, 0.509804, 0, 1,
-1.363498, 1.248813, -1.198705, 1, 0.5176471, 0, 1,
-1.361378, 0.03775395, -0.6716093, 1, 0.5215687, 0, 1,
-1.345232, -1.338599, -3.359698, 1, 0.5294118, 0, 1,
-1.344265, 0.1230479, -2.338157, 1, 0.5333334, 0, 1,
-1.334392, 0.7172355, -1.850701, 1, 0.5411765, 0, 1,
-1.334017, -0.2966331, -0.8535913, 1, 0.5450981, 0, 1,
-1.327988, -1.245986, -2.709949, 1, 0.5529412, 0, 1,
-1.324574, -2.201147, -1.755844, 1, 0.5568628, 0, 1,
-1.320558, 1.90626, -0.3781645, 1, 0.5647059, 0, 1,
-1.30445, -1.751393, -3.951508, 1, 0.5686275, 0, 1,
-1.303703, -1.403797, -2.56626, 1, 0.5764706, 0, 1,
-1.30008, -0.9556544, -1.438023, 1, 0.5803922, 0, 1,
-1.29798, -0.875522, -1.312584, 1, 0.5882353, 0, 1,
-1.291311, -0.6072669, -1.319466, 1, 0.5921569, 0, 1,
-1.284834, 0.9961446, 0.4420304, 1, 0.6, 0, 1,
-1.280627, 2.174671, -0.206507, 1, 0.6078432, 0, 1,
-1.277102, -0.1061872, -1.514005, 1, 0.6117647, 0, 1,
-1.259866, 0.6538791, -2.606269, 1, 0.6196079, 0, 1,
-1.253766, -0.1573653, -2.063564, 1, 0.6235294, 0, 1,
-1.244833, 0.6200629, -1.037188, 1, 0.6313726, 0, 1,
-1.244832, -0.9904195, -1.125329, 1, 0.6352941, 0, 1,
-1.241408, -1.539922, -1.28607, 1, 0.6431373, 0, 1,
-1.239021, 0.2801599, -1.447547, 1, 0.6470588, 0, 1,
-1.224826, 2.729283, 1.160179, 1, 0.654902, 0, 1,
-1.21412, 2.4033, 0.1798326, 1, 0.6588235, 0, 1,
-1.209628, 1.379647, -1.372416, 1, 0.6666667, 0, 1,
-1.207598, 0.295943, -1.212565, 1, 0.6705883, 0, 1,
-1.205994, -0.1687954, -1.900053, 1, 0.6784314, 0, 1,
-1.204688, 2.096303, 0.6805463, 1, 0.682353, 0, 1,
-1.202602, 0.204906, -1.021403, 1, 0.6901961, 0, 1,
-1.202419, -1.188948, -2.957823, 1, 0.6941177, 0, 1,
-1.198459, 1.192954, -0.7007249, 1, 0.7019608, 0, 1,
-1.187804, -0.4321672, -2.238398, 1, 0.7098039, 0, 1,
-1.187433, 1.185387, 0.03873953, 1, 0.7137255, 0, 1,
-1.185856, 0.7927954, 0.2246628, 1, 0.7215686, 0, 1,
-1.182315, -0.01611993, -2.622537, 1, 0.7254902, 0, 1,
-1.176991, 0.268424, -3.515814, 1, 0.7333333, 0, 1,
-1.175583, -1.808598, -2.090829, 1, 0.7372549, 0, 1,
-1.175525, 0.84826, -1.166978, 1, 0.7450981, 0, 1,
-1.173635, -0.03175057, 0.6455399, 1, 0.7490196, 0, 1,
-1.171675, 0.8423746, -0.8628336, 1, 0.7568628, 0, 1,
-1.171382, -0.86453, -1.651679, 1, 0.7607843, 0, 1,
-1.170591, 0.07874002, -0.6428472, 1, 0.7686275, 0, 1,
-1.170549, 0.8799557, 0.1081311, 1, 0.772549, 0, 1,
-1.156124, -0.3151819, -1.577622, 1, 0.7803922, 0, 1,
-1.140438, -0.8346267, -3.201117, 1, 0.7843137, 0, 1,
-1.120395, 0.6820037, -0.8249084, 1, 0.7921569, 0, 1,
-1.120276, -2.447568, -2.117145, 1, 0.7960784, 0, 1,
-1.115462, -1.44876, -2.525269, 1, 0.8039216, 0, 1,
-1.111307, 1.273613, -1.022913, 1, 0.8117647, 0, 1,
-1.109237, 1.378918, -1.338289, 1, 0.8156863, 0, 1,
-1.102696, -0.1760504, -0.723323, 1, 0.8235294, 0, 1,
-1.093935, -0.7312971, -2.942113, 1, 0.827451, 0, 1,
-1.093531, 2.545433, -1.677666, 1, 0.8352941, 0, 1,
-1.091404, 1.87452, -0.9692945, 1, 0.8392157, 0, 1,
-1.089403, -1.464058, -1.815864, 1, 0.8470588, 0, 1,
-1.086462, -0.2512419, -3.192185, 1, 0.8509804, 0, 1,
-1.084307, -1.788055, -2.984004, 1, 0.8588235, 0, 1,
-1.072422, -1.177046, -1.518655, 1, 0.8627451, 0, 1,
-1.071282, -0.9031528, -1.913265, 1, 0.8705882, 0, 1,
-1.069561, 1.373578, 0.6193376, 1, 0.8745098, 0, 1,
-1.065804, -0.9175193, -1.34946, 1, 0.8823529, 0, 1,
-1.064243, -0.499628, -1.401626, 1, 0.8862745, 0, 1,
-1.053308, -0.2476349, -1.779353, 1, 0.8941177, 0, 1,
-1.051916, -1.10338, -2.486948, 1, 0.8980392, 0, 1,
-1.04799, 0.5648782, -0.711062, 1, 0.9058824, 0, 1,
-1.045446, -1.039013, -2.657513, 1, 0.9137255, 0, 1,
-1.041723, -0.5741318, -2.492187, 1, 0.9176471, 0, 1,
-1.037453, 1.381407, -0.02397896, 1, 0.9254902, 0, 1,
-1.031618, 0.864426, -0.4071431, 1, 0.9294118, 0, 1,
-1.026546, -0.07168338, -2.376727, 1, 0.9372549, 0, 1,
-1.012754, 1.909298, -0.612198, 1, 0.9411765, 0, 1,
-1.009189, -1.021367, -1.864952, 1, 0.9490196, 0, 1,
-1.005625, 2.07215, 0.2223348, 1, 0.9529412, 0, 1,
-1.0004, -1.024585, -2.52675, 1, 0.9607843, 0, 1,
-0.9914631, -1.759632, -3.380484, 1, 0.9647059, 0, 1,
-0.9869961, 1.739884, -2.204137, 1, 0.972549, 0, 1,
-0.985092, 1.553802, -1.405608, 1, 0.9764706, 0, 1,
-0.9821246, 0.3704406, 0.05462777, 1, 0.9843137, 0, 1,
-0.979664, 1.126462, -2.336674, 1, 0.9882353, 0, 1,
-0.9763587, 0.5784991, -0.1507348, 1, 0.9960784, 0, 1,
-0.9757909, 1.189382, -2.284123, 0.9960784, 1, 0, 1,
-0.9750304, -0.5709062, -2.688406, 0.9921569, 1, 0, 1,
-0.9624698, 1.605026, -1.417062, 0.9843137, 1, 0, 1,
-0.9573476, 0.4150182, -1.739729, 0.9803922, 1, 0, 1,
-0.951727, -0.3959437, -2.375426, 0.972549, 1, 0, 1,
-0.9478151, 0.05974188, -0.3210309, 0.9686275, 1, 0, 1,
-0.9452966, 0.6879704, -2.837729, 0.9607843, 1, 0, 1,
-0.9385753, 1.614744, -2.054862, 0.9568627, 1, 0, 1,
-0.9354758, 0.7468506, -0.1159706, 0.9490196, 1, 0, 1,
-0.93347, -1.103286, -2.676019, 0.945098, 1, 0, 1,
-0.9295239, -0.5381552, -1.851002, 0.9372549, 1, 0, 1,
-0.926024, 0.09021699, -1.693637, 0.9333333, 1, 0, 1,
-0.9233158, 0.2209414, -1.597214, 0.9254902, 1, 0, 1,
-0.9229814, -1.048197, -0.473652, 0.9215686, 1, 0, 1,
-0.910933, 1.157594, -0.4334227, 0.9137255, 1, 0, 1,
-0.907635, 0.1660046, -0.7929569, 0.9098039, 1, 0, 1,
-0.9018277, 0.8985177, -0.3534801, 0.9019608, 1, 0, 1,
-0.8986297, 0.1612423, -1.615171, 0.8941177, 1, 0, 1,
-0.8976232, -0.2607502, -1.637287, 0.8901961, 1, 0, 1,
-0.8965932, -1.485379, -1.98657, 0.8823529, 1, 0, 1,
-0.8965233, 0.06704912, -2.90557, 0.8784314, 1, 0, 1,
-0.8948237, -0.9659024, -0.75738, 0.8705882, 1, 0, 1,
-0.8873281, -1.207298, -2.103124, 0.8666667, 1, 0, 1,
-0.8834792, -1.098648, -3.066495, 0.8588235, 1, 0, 1,
-0.8832805, 0.3181064, -0.0885445, 0.854902, 1, 0, 1,
-0.8787668, 0.9359257, -0.837403, 0.8470588, 1, 0, 1,
-0.8768515, 0.9173218, -1.186458, 0.8431373, 1, 0, 1,
-0.8734862, 0.7871572, -0.5504242, 0.8352941, 1, 0, 1,
-0.8731269, 0.971024, -0.4501206, 0.8313726, 1, 0, 1,
-0.872613, 0.4474356, -2.165656, 0.8235294, 1, 0, 1,
-0.8724552, 1.556623, -3.453774, 0.8196079, 1, 0, 1,
-0.8687635, -0.02501318, -2.35719, 0.8117647, 1, 0, 1,
-0.8677816, 0.7726792, -1.829901, 0.8078431, 1, 0, 1,
-0.8645115, 0.3164617, -1.276964, 0.8, 1, 0, 1,
-0.8641595, -0.2813081, -2.593743, 0.7921569, 1, 0, 1,
-0.8599567, 1.582466, 0.3351338, 0.7882353, 1, 0, 1,
-0.8566856, 0.9222175, -0.8521886, 0.7803922, 1, 0, 1,
-0.8565664, -0.7949685, -2.294141, 0.7764706, 1, 0, 1,
-0.8564917, -0.4078073, -1.322998, 0.7686275, 1, 0, 1,
-0.8547834, -0.3018051, -2.034104, 0.7647059, 1, 0, 1,
-0.8516853, -1.464658, -1.08559, 0.7568628, 1, 0, 1,
-0.8408272, 0.3739429, -0.838406, 0.7529412, 1, 0, 1,
-0.8291805, 1.28008, -0.3902195, 0.7450981, 1, 0, 1,
-0.8175561, -0.6909204, -2.734749, 0.7411765, 1, 0, 1,
-0.8170016, -1.803154, -2.599475, 0.7333333, 1, 0, 1,
-0.8137562, -0.8199617, -2.476787, 0.7294118, 1, 0, 1,
-0.8116113, -0.1844437, -0.7592139, 0.7215686, 1, 0, 1,
-0.8113695, 0.1037923, -3.015265, 0.7176471, 1, 0, 1,
-0.8061285, 0.6947941, -0.4514661, 0.7098039, 1, 0, 1,
-0.805178, -0.02531198, -1.507917, 0.7058824, 1, 0, 1,
-0.7985894, -0.7675595, -2.654906, 0.6980392, 1, 0, 1,
-0.7985794, -0.6773903, -2.666686, 0.6901961, 1, 0, 1,
-0.7984941, -1.103036, -2.647437, 0.6862745, 1, 0, 1,
-0.7887269, -3.484581, -3.123242, 0.6784314, 1, 0, 1,
-0.7847296, 1.229117, 0.6050314, 0.6745098, 1, 0, 1,
-0.7763681, 0.2178413, 1.063803, 0.6666667, 1, 0, 1,
-0.7734138, -0.9068413, -2.64803, 0.6627451, 1, 0, 1,
-0.7721993, 0.01806954, -1.163522, 0.654902, 1, 0, 1,
-0.7652101, -0.9841257, -0.1114235, 0.6509804, 1, 0, 1,
-0.7637866, 0.9813139, -2.855904, 0.6431373, 1, 0, 1,
-0.7608496, 2.248762, -0.3491936, 0.6392157, 1, 0, 1,
-0.7604719, -1.527115, -4.032704, 0.6313726, 1, 0, 1,
-0.7591828, -2.25198, -2.865248, 0.627451, 1, 0, 1,
-0.7568071, -0.7877672, -2.583905, 0.6196079, 1, 0, 1,
-0.7554995, 0.8051201, 1.001919, 0.6156863, 1, 0, 1,
-0.7492302, 0.5407577, -1.170282, 0.6078432, 1, 0, 1,
-0.7459767, 0.06686333, -1.62392, 0.6039216, 1, 0, 1,
-0.7402815, -1.606203, -0.9337767, 0.5960785, 1, 0, 1,
-0.7372802, 0.2483617, -1.175893, 0.5882353, 1, 0, 1,
-0.7296742, 0.5338751, 0.8444992, 0.5843138, 1, 0, 1,
-0.7258952, 0.3536959, -1.843466, 0.5764706, 1, 0, 1,
-0.7253878, 0.2676084, -2.182975, 0.572549, 1, 0, 1,
-0.7229816, 1.203933, -0.9720697, 0.5647059, 1, 0, 1,
-0.7187726, 0.002193962, 0.1562509, 0.5607843, 1, 0, 1,
-0.7147209, 0.5872737, 0.2022158, 0.5529412, 1, 0, 1,
-0.7071711, 0.3836187, -1.193742, 0.5490196, 1, 0, 1,
-0.7041391, 0.8970188, -2.263411, 0.5411765, 1, 0, 1,
-0.7024352, 0.7332605, -0.4625229, 0.5372549, 1, 0, 1,
-0.6990759, 0.8401672, -2.177207, 0.5294118, 1, 0, 1,
-0.6949819, -0.2742572, -0.7698703, 0.5254902, 1, 0, 1,
-0.6946145, 1.903339, -0.6239574, 0.5176471, 1, 0, 1,
-0.6923705, 0.4897408, -1.119341, 0.5137255, 1, 0, 1,
-0.6896034, 0.9460841, 0.9240199, 0.5058824, 1, 0, 1,
-0.6842982, -2.486751, -3.190318, 0.5019608, 1, 0, 1,
-0.6812369, 0.4526143, -2.048257, 0.4941176, 1, 0, 1,
-0.6798114, -2.473221, -3.727946, 0.4862745, 1, 0, 1,
-0.6774077, 0.2181105, -1.68161, 0.4823529, 1, 0, 1,
-0.6759677, 0.9132589, -1.667461, 0.4745098, 1, 0, 1,
-0.6747363, -0.06306426, -0.1629951, 0.4705882, 1, 0, 1,
-0.6639214, 0.3483472, -2.49764, 0.4627451, 1, 0, 1,
-0.6634467, -0.7922607, -3.542642, 0.4588235, 1, 0, 1,
-0.663312, 1.106439, -1.020814, 0.4509804, 1, 0, 1,
-0.6620837, -0.2986166, -1.969915, 0.4470588, 1, 0, 1,
-0.6614779, 1.108086, 0.02526685, 0.4392157, 1, 0, 1,
-0.6597053, -0.2655824, -3.099346, 0.4352941, 1, 0, 1,
-0.6573307, -0.1742027, -3.208691, 0.427451, 1, 0, 1,
-0.6555162, 2.248269, -2.01002, 0.4235294, 1, 0, 1,
-0.6521093, 1.215951, -1.688051, 0.4156863, 1, 0, 1,
-0.6518285, -1.62971, -3.391034, 0.4117647, 1, 0, 1,
-0.6509096, 0.01791113, -2.215384, 0.4039216, 1, 0, 1,
-0.6461402, 0.2758809, -0.07274865, 0.3960784, 1, 0, 1,
-0.6449484, -0.3561807, -1.761697, 0.3921569, 1, 0, 1,
-0.6439524, 0.3662159, -2.408062, 0.3843137, 1, 0, 1,
-0.6421771, -0.6800714, -4.021876, 0.3803922, 1, 0, 1,
-0.6413565, 1.39071, -0.6953033, 0.372549, 1, 0, 1,
-0.637877, 0.5239248, -0.7262838, 0.3686275, 1, 0, 1,
-0.6346694, -0.03902315, -2.414282, 0.3607843, 1, 0, 1,
-0.6345569, 1.30997, -2.474885, 0.3568628, 1, 0, 1,
-0.6328222, -0.3641011, -3.720225, 0.3490196, 1, 0, 1,
-0.6314355, 1.639407, -0.2957637, 0.345098, 1, 0, 1,
-0.6309935, 0.2160893, -1.668615, 0.3372549, 1, 0, 1,
-0.6303558, -0.3073795, -2.565369, 0.3333333, 1, 0, 1,
-0.6292589, 0.5163341, -0.9784147, 0.3254902, 1, 0, 1,
-0.6183335, 0.6603121, -1.527179, 0.3215686, 1, 0, 1,
-0.6180544, 0.64012, -0.8672495, 0.3137255, 1, 0, 1,
-0.6143772, 0.2073135, -3.722406, 0.3098039, 1, 0, 1,
-0.5936741, 0.2791472, -2.606895, 0.3019608, 1, 0, 1,
-0.5930757, 1.916951, 1.67781, 0.2941177, 1, 0, 1,
-0.592858, 0.8176714, -0.0801651, 0.2901961, 1, 0, 1,
-0.5911862, -0.06267197, -2.03451, 0.282353, 1, 0, 1,
-0.5848312, 0.05115641, -1.69456, 0.2784314, 1, 0, 1,
-0.5788666, -1.169489, -4.542204, 0.2705882, 1, 0, 1,
-0.5769089, 0.6583637, -1.432252, 0.2666667, 1, 0, 1,
-0.5651646, -1.130444, -2.115919, 0.2588235, 1, 0, 1,
-0.5648594, -0.2763459, -2.21657, 0.254902, 1, 0, 1,
-0.5583572, 0.03893844, -3.380591, 0.2470588, 1, 0, 1,
-0.5423634, 0.8450595, -2.636267, 0.2431373, 1, 0, 1,
-0.5349082, 1.639998, -0.2107842, 0.2352941, 1, 0, 1,
-0.5321231, -0.5585964, -1.417171, 0.2313726, 1, 0, 1,
-0.5300538, 0.7027696, 0.5819391, 0.2235294, 1, 0, 1,
-0.5276401, 1.244698, -0.8447732, 0.2196078, 1, 0, 1,
-0.5171545, 0.390628, -1.764289, 0.2117647, 1, 0, 1,
-0.5155631, -1.065148, -1.652705, 0.2078431, 1, 0, 1,
-0.5144606, -0.06685974, -3.604832, 0.2, 1, 0, 1,
-0.5057788, 0.2105683, -2.346218, 0.1921569, 1, 0, 1,
-0.5040846, 1.295312, -1.219018, 0.1882353, 1, 0, 1,
-0.5032711, -0.02493016, -1.365023, 0.1803922, 1, 0, 1,
-0.5017742, 0.3430748, 0.5793614, 0.1764706, 1, 0, 1,
-0.5016184, -0.7784642, -0.9994687, 0.1686275, 1, 0, 1,
-0.4961665, 2.110734, 2.015134, 0.1647059, 1, 0, 1,
-0.4937466, 0.5908028, -0.4998231, 0.1568628, 1, 0, 1,
-0.4934328, -1.34153, -2.109557, 0.1529412, 1, 0, 1,
-0.4905424, 0.2121006, -0.5381622, 0.145098, 1, 0, 1,
-0.4862258, -0.9621983, -3.189068, 0.1411765, 1, 0, 1,
-0.4856707, -1.584404, -3.196644, 0.1333333, 1, 0, 1,
-0.4850221, -0.3018458, -1.585266, 0.1294118, 1, 0, 1,
-0.4848558, 1.905303, 0.3479629, 0.1215686, 1, 0, 1,
-0.4816848, -0.6065778, -0.49764, 0.1176471, 1, 0, 1,
-0.4759159, -0.9524711, -2.202656, 0.1098039, 1, 0, 1,
-0.4726244, -0.114008, -1.919536, 0.1058824, 1, 0, 1,
-0.4722354, 1.181527, -0.1413318, 0.09803922, 1, 0, 1,
-0.4703088, -0.4426567, -2.608651, 0.09019608, 1, 0, 1,
-0.4677121, -0.7465499, -2.346219, 0.08627451, 1, 0, 1,
-0.4663884, -0.8439215, -2.359008, 0.07843138, 1, 0, 1,
-0.4619076, 0.3493556, -2.503993, 0.07450981, 1, 0, 1,
-0.4588635, 0.3740147, -2.191239, 0.06666667, 1, 0, 1,
-0.458284, -0.1407792, -1.840919, 0.0627451, 1, 0, 1,
-0.4548052, 0.3998359, -0.6277218, 0.05490196, 1, 0, 1,
-0.4529595, -0.001725939, -1.832366, 0.05098039, 1, 0, 1,
-0.4521784, 0.7019464, -1.009718, 0.04313726, 1, 0, 1,
-0.4518625, 1.120262, -0.5879981, 0.03921569, 1, 0, 1,
-0.4500806, -0.02854273, -0.4250943, 0.03137255, 1, 0, 1,
-0.4484315, 0.7216253, 0.8494422, 0.02745098, 1, 0, 1,
-0.4482574, -0.5344993, -2.009082, 0.01960784, 1, 0, 1,
-0.4376596, -0.9464849, -1.201971, 0.01568628, 1, 0, 1,
-0.4365033, 0.63682, -0.8486391, 0.007843138, 1, 0, 1,
-0.4361561, -0.7128669, -2.761805, 0.003921569, 1, 0, 1,
-0.4315824, -1.293275, -2.171273, 0, 1, 0.003921569, 1,
-0.4296, -0.3867316, -1.157686, 0, 1, 0.01176471, 1,
-0.4249832, -2.23506, -2.205587, 0, 1, 0.01568628, 1,
-0.423748, 0.7794998, -0.2975579, 0, 1, 0.02352941, 1,
-0.4226299, 1.733552, 1.812326, 0, 1, 0.02745098, 1,
-0.4193603, 0.8226765, -0.2400969, 0, 1, 0.03529412, 1,
-0.4155728, -2.66448, -3.143411, 0, 1, 0.03921569, 1,
-0.4152835, -0.5214582, -2.910475, 0, 1, 0.04705882, 1,
-0.4142481, 1.58169, 1.333253, 0, 1, 0.05098039, 1,
-0.4102724, 1.499811, -0.6619358, 0, 1, 0.05882353, 1,
-0.4090017, 1.271078, -1.136189, 0, 1, 0.0627451, 1,
-0.4089968, 0.851836, -1.628068, 0, 1, 0.07058824, 1,
-0.3997446, -0.4183964, -1.820397, 0, 1, 0.07450981, 1,
-0.3993118, -0.6944547, -1.256087, 0, 1, 0.08235294, 1,
-0.3958539, -0.1765659, -2.472826, 0, 1, 0.08627451, 1,
-0.3916104, -1.303417, -4.27707, 0, 1, 0.09411765, 1,
-0.3902026, -2.01406, -4.610684, 0, 1, 0.1019608, 1,
-0.3882195, -0.3182896, -2.986614, 0, 1, 0.1058824, 1,
-0.3851167, -1.406239, -4.811195, 0, 1, 0.1137255, 1,
-0.3831191, -0.02647372, -1.71816, 0, 1, 0.1176471, 1,
-0.3831065, 0.1832756, -1.421679, 0, 1, 0.1254902, 1,
-0.3770598, 0.4161114, 0.5117595, 0, 1, 0.1294118, 1,
-0.3744585, -0.3861493, -2.797094, 0, 1, 0.1372549, 1,
-0.3724481, 1.409677, -0.1556908, 0, 1, 0.1411765, 1,
-0.3722383, -0.6484089, -3.31423, 0, 1, 0.1490196, 1,
-0.3722073, 0.1665629, -0.8415203, 0, 1, 0.1529412, 1,
-0.3699139, 1.118238, -1.27925, 0, 1, 0.1607843, 1,
-0.3664856, 0.4082981, -0.7227207, 0, 1, 0.1647059, 1,
-0.3639292, -0.8183803, -2.494118, 0, 1, 0.172549, 1,
-0.3572824, 2.062747, 1.32999, 0, 1, 0.1764706, 1,
-0.3569176, 1.239916, 0.5004519, 0, 1, 0.1843137, 1,
-0.3512495, 0.3354775, -0.1019447, 0, 1, 0.1882353, 1,
-0.3504719, 0.2264756, 0.1082018, 0, 1, 0.1960784, 1,
-0.347679, 0.7736841, -0.996268, 0, 1, 0.2039216, 1,
-0.3471428, 1.929212, 0.4688714, 0, 1, 0.2078431, 1,
-0.3465876, -0.4732646, -2.089461, 0, 1, 0.2156863, 1,
-0.3422742, -0.01320133, -1.230239, 0, 1, 0.2196078, 1,
-0.3400388, -0.8184535, -2.436867, 0, 1, 0.227451, 1,
-0.3345965, 0.3943996, 0.1417668, 0, 1, 0.2313726, 1,
-0.3330845, -1.108662, -3.695952, 0, 1, 0.2392157, 1,
-0.3305791, -0.09034446, -2.09426, 0, 1, 0.2431373, 1,
-0.3298482, 1.627831, 0.681997, 0, 1, 0.2509804, 1,
-0.3291178, 0.9315199, 0.9790922, 0, 1, 0.254902, 1,
-0.3284159, 0.1724442, -0.3470463, 0, 1, 0.2627451, 1,
-0.3186762, 0.477149, -1.81441, 0, 1, 0.2666667, 1,
-0.3131714, 2.078616, -0.750568, 0, 1, 0.2745098, 1,
-0.3074529, -0.2081465, 0.424896, 0, 1, 0.2784314, 1,
-0.3052432, 1.787495, 0.5435081, 0, 1, 0.2862745, 1,
-0.304072, -1.155872, -3.753807, 0, 1, 0.2901961, 1,
-0.3012154, -0.2171429, -1.879553, 0, 1, 0.2980392, 1,
-0.3009218, -0.7159685, -1.985553, 0, 1, 0.3058824, 1,
-0.29919, -0.32152, -2.646646, 0, 1, 0.3098039, 1,
-0.2982072, -1.822441, -1.684359, 0, 1, 0.3176471, 1,
-0.2972574, 0.4041905, 0.1799369, 0, 1, 0.3215686, 1,
-0.2931495, -0.8313158, -3.259851, 0, 1, 0.3294118, 1,
-0.2929714, -1.351753, -3.552295, 0, 1, 0.3333333, 1,
-0.2845984, 0.1523328, -0.2463993, 0, 1, 0.3411765, 1,
-0.2832074, 1.136518, 0.1137393, 0, 1, 0.345098, 1,
-0.2821352, -0.8010097, -3.462323, 0, 1, 0.3529412, 1,
-0.2757877, -1.191644, -3.591546, 0, 1, 0.3568628, 1,
-0.2752991, 0.6726398, -1.594809, 0, 1, 0.3647059, 1,
-0.2656537, -0.3361692, -4.833221, 0, 1, 0.3686275, 1,
-0.261827, 0.813643, 0.5682397, 0, 1, 0.3764706, 1,
-0.2610413, -0.2842901, -1.496635, 0, 1, 0.3803922, 1,
-0.260595, 0.3004808, -1.01012, 0, 1, 0.3882353, 1,
-0.2580224, -1.510974, -1.360252, 0, 1, 0.3921569, 1,
-0.2498475, -0.3714063, -2.73985, 0, 1, 0.4, 1,
-0.2442645, 0.4450955, -0.7752678, 0, 1, 0.4078431, 1,
-0.2395128, 0.1108871, -1.409592, 0, 1, 0.4117647, 1,
-0.2389665, 1.513412, 0.7824658, 0, 1, 0.4196078, 1,
-0.2325282, -0.1825844, -2.607889, 0, 1, 0.4235294, 1,
-0.2306403, -0.389909, -2.677228, 0, 1, 0.4313726, 1,
-0.2224756, -0.1058413, -1.037139, 0, 1, 0.4352941, 1,
-0.2198578, 0.4456499, -0.1626146, 0, 1, 0.4431373, 1,
-0.2187459, -0.3451265, -3.201795, 0, 1, 0.4470588, 1,
-0.2163897, -0.6465597, -3.221765, 0, 1, 0.454902, 1,
-0.2152763, -0.5674322, -3.500433, 0, 1, 0.4588235, 1,
-0.2122486, 1.569845, 1.257712, 0, 1, 0.4666667, 1,
-0.2115284, -0.343479, -2.015032, 0, 1, 0.4705882, 1,
-0.2041784, -0.7825749, -2.13307, 0, 1, 0.4784314, 1,
-0.2027623, 0.4663929, -0.9379, 0, 1, 0.4823529, 1,
-0.2017493, 0.127591, -2.383028, 0, 1, 0.4901961, 1,
-0.2011834, 1.312548, -0.483243, 0, 1, 0.4941176, 1,
-0.1975048, -0.6427157, -4.247036, 0, 1, 0.5019608, 1,
-0.1900147, -1.358097, -4.240937, 0, 1, 0.509804, 1,
-0.1894455, 1.216372, 0.8874662, 0, 1, 0.5137255, 1,
-0.1868284, 0.01084606, -1.354911, 0, 1, 0.5215687, 1,
-0.1857228, -0.2191775, -2.927298, 0, 1, 0.5254902, 1,
-0.1829758, -1.163803, -4.079679, 0, 1, 0.5333334, 1,
-0.1807187, -1.33922, -2.689122, 0, 1, 0.5372549, 1,
-0.1766615, 1.098696, 1.105425, 0, 1, 0.5450981, 1,
-0.173824, 0.8951511, -0.4378709, 0, 1, 0.5490196, 1,
-0.1721172, -0.8535774, -3.512483, 0, 1, 0.5568628, 1,
-0.1686295, -1.406437, -1.553936, 0, 1, 0.5607843, 1,
-0.1670505, -1.307182, -2.45333, 0, 1, 0.5686275, 1,
-0.1648885, 0.4026738, 1.022296, 0, 1, 0.572549, 1,
-0.1627605, 0.3987196, 1.491821, 0, 1, 0.5803922, 1,
-0.1601019, -1.915202, -1.905936, 0, 1, 0.5843138, 1,
-0.1592055, -2.838735, -3.152269, 0, 1, 0.5921569, 1,
-0.1560493, 0.6131844, 1.186326, 0, 1, 0.5960785, 1,
-0.1556004, 1.166719, 0.01056071, 0, 1, 0.6039216, 1,
-0.1555549, -0.889134, -3.657916, 0, 1, 0.6117647, 1,
-0.1526283, -0.5726765, -2.198842, 0, 1, 0.6156863, 1,
-0.1491943, 1.202688, -1.429327, 0, 1, 0.6235294, 1,
-0.1418525, -0.5777802, -3.680672, 0, 1, 0.627451, 1,
-0.1405929, -0.2428884, -4.814831, 0, 1, 0.6352941, 1,
-0.1334222, -0.8463709, -4.608422, 0, 1, 0.6392157, 1,
-0.1329841, -1.010164, -2.758534, 0, 1, 0.6470588, 1,
-0.1324719, 0.8155231, -3.943083, 0, 1, 0.6509804, 1,
-0.1294944, 0.1311199, -1.770399, 0, 1, 0.6588235, 1,
-0.1284078, 0.8310287, -1.31689, 0, 1, 0.6627451, 1,
-0.1283811, 0.144837, -0.8870478, 0, 1, 0.6705883, 1,
-0.1247089, 0.9665747, -0.7677313, 0, 1, 0.6745098, 1,
-0.1243337, -1.079229, -3.526426, 0, 1, 0.682353, 1,
-0.1229134, 0.1186769, -0.9213096, 0, 1, 0.6862745, 1,
-0.122393, -0.0408111, -2.099988, 0, 1, 0.6941177, 1,
-0.1191162, 0.4812932, 1.051457, 0, 1, 0.7019608, 1,
-0.1171492, 0.4045077, 3.043364, 0, 1, 0.7058824, 1,
-0.1171479, -0.9785524, -3.686955, 0, 1, 0.7137255, 1,
-0.1155196, 0.9130723, 0.986378, 0, 1, 0.7176471, 1,
-0.1054016, 0.6782818, -1.394045, 0, 1, 0.7254902, 1,
-0.1052017, -0.895166, -4.226992, 0, 1, 0.7294118, 1,
-0.1045023, 1.015188, 0.1197186, 0, 1, 0.7372549, 1,
-0.104482, -0.5654188, -3.891816, 0, 1, 0.7411765, 1,
-0.1015512, -0.6479428, -3.844132, 0, 1, 0.7490196, 1,
-0.09960478, -1.73737, -2.087612, 0, 1, 0.7529412, 1,
-0.09909289, 0.744278, 1.018317, 0, 1, 0.7607843, 1,
-0.09088494, -1.353821, -3.613299, 0, 1, 0.7647059, 1,
-0.09084667, 0.6587303, -0.6784113, 0, 1, 0.772549, 1,
-0.08455018, -0.3993226, -3.421099, 0, 1, 0.7764706, 1,
-0.08356927, -2.23966, -2.76048, 0, 1, 0.7843137, 1,
-0.08202875, 0.8428011, 0.6071165, 0, 1, 0.7882353, 1,
-0.0806388, -0.5840294, -4.062718, 0, 1, 0.7960784, 1,
-0.07997369, -0.1291245, -1.951864, 0, 1, 0.8039216, 1,
-0.07581097, 0.3261483, -0.3184138, 0, 1, 0.8078431, 1,
-0.07524843, -1.216057, -4.263916, 0, 1, 0.8156863, 1,
-0.07316045, -1.387636, -2.738832, 0, 1, 0.8196079, 1,
-0.0649904, 0.1763287, -0.3929593, 0, 1, 0.827451, 1,
-0.06491689, -1.218717, -3.047305, 0, 1, 0.8313726, 1,
-0.06255471, -1.426054, -3.34147, 0, 1, 0.8392157, 1,
-0.06222701, 0.2011634, -1.615864, 0, 1, 0.8431373, 1,
-0.06167237, 0.750887, -0.9524522, 0, 1, 0.8509804, 1,
-0.05818005, 0.6591295, -1.453377, 0, 1, 0.854902, 1,
-0.05719959, 0.9388816, -0.5225084, 0, 1, 0.8627451, 1,
-0.05696987, -1.606556, -3.894502, 0, 1, 0.8666667, 1,
-0.05582361, 1.726539, 1.150696, 0, 1, 0.8745098, 1,
-0.0553316, -0.2099688, -3.756112, 0, 1, 0.8784314, 1,
-0.0530934, -0.234657, -3.105535, 0, 1, 0.8862745, 1,
-0.04732046, 0.3222234, 1.272872, 0, 1, 0.8901961, 1,
-0.04364889, -0.07563002, -1.387239, 0, 1, 0.8980392, 1,
-0.04316955, -0.2981666, -3.284093, 0, 1, 0.9058824, 1,
-0.03904412, 0.02665016, -2.281451, 0, 1, 0.9098039, 1,
-0.03894443, -1.965463, -2.999527, 0, 1, 0.9176471, 1,
-0.0297245, 1.528529, 0.1189239, 0, 1, 0.9215686, 1,
-0.02859811, -0.7846516, -3.394306, 0, 1, 0.9294118, 1,
-0.02388032, 1.329471, -0.4834041, 0, 1, 0.9333333, 1,
-0.02365116, 0.7937943, -0.5371524, 0, 1, 0.9411765, 1,
-0.02176188, 0.2144709, -2.291187, 0, 1, 0.945098, 1,
-0.01844699, -1.574728, -3.573086, 0, 1, 0.9529412, 1,
-0.01587046, 0.1511952, 1.161948, 0, 1, 0.9568627, 1,
-0.01064949, -2.667239, -4.988235, 0, 1, 0.9647059, 1,
-0.005739524, 0.2653129, -0.6569518, 0, 1, 0.9686275, 1,
0.0007778413, 0.2699523, -1.307673, 0, 1, 0.9764706, 1,
0.001066934, -0.9379796, 1.623902, 0, 1, 0.9803922, 1,
0.001761783, -0.4540004, 2.559615, 0, 1, 0.9882353, 1,
0.001797708, 0.2401027, 0.6982787, 0, 1, 0.9921569, 1,
0.003364879, 0.7680029, 0.2569948, 0, 1, 1, 1,
0.007196602, -1.060644, 0.7875826, 0, 0.9921569, 1, 1,
0.01219905, -0.03954364, 4.946585, 0, 0.9882353, 1, 1,
0.01627422, 0.3986485, 1.063829, 0, 0.9803922, 1, 1,
0.01702444, 1.00538, -0.1693946, 0, 0.9764706, 1, 1,
0.01811583, 2.488105, -0.4649816, 0, 0.9686275, 1, 1,
0.02001041, 1.479828, -0.594825, 0, 0.9647059, 1, 1,
0.02538545, 0.3075009, -0.4236197, 0, 0.9568627, 1, 1,
0.02737532, -1.732224, 3.093456, 0, 0.9529412, 1, 1,
0.03943176, -1.427094, 4.040904, 0, 0.945098, 1, 1,
0.04005497, -0.04650602, 2.070416, 0, 0.9411765, 1, 1,
0.0413699, 1.689293, -0.3638614, 0, 0.9333333, 1, 1,
0.04150902, 0.100705, 0.696914, 0, 0.9294118, 1, 1,
0.04380219, 0.7516373, 0.5020584, 0, 0.9215686, 1, 1,
0.04467251, 0.5937583, -0.6096201, 0, 0.9176471, 1, 1,
0.04644508, -0.3718644, 4.041969, 0, 0.9098039, 1, 1,
0.04650163, -0.2760913, 4.393868, 0, 0.9058824, 1, 1,
0.05200258, -0.2592542, 3.688497, 0, 0.8980392, 1, 1,
0.05669836, -0.5875008, 1.875451, 0, 0.8901961, 1, 1,
0.06206624, 0.6910691, -0.2431444, 0, 0.8862745, 1, 1,
0.06546741, 0.312628, -0.1572724, 0, 0.8784314, 1, 1,
0.06570134, -0.6254952, 1.076601, 0, 0.8745098, 1, 1,
0.06714647, -0.4633156, 1.365415, 0, 0.8666667, 1, 1,
0.07030831, -0.2382281, 2.249628, 0, 0.8627451, 1, 1,
0.07230676, -2.072378, 2.256297, 0, 0.854902, 1, 1,
0.07467608, 0.8837053, -0.1742224, 0, 0.8509804, 1, 1,
0.08156931, 0.6672222, 1.225505, 0, 0.8431373, 1, 1,
0.08400439, -1.265801, 2.987219, 0, 0.8392157, 1, 1,
0.08419804, -1.379689, 3.224615, 0, 0.8313726, 1, 1,
0.08562801, 0.04289971, 1.857109, 0, 0.827451, 1, 1,
0.08607313, -0.5640225, 2.949793, 0, 0.8196079, 1, 1,
0.08965763, -0.3043402, 1.828524, 0, 0.8156863, 1, 1,
0.09249192, 0.3316026, 1.313597, 0, 0.8078431, 1, 1,
0.09637182, 0.7211223, -2.832729, 0, 0.8039216, 1, 1,
0.09999759, -0.8281206, 2.800012, 0, 0.7960784, 1, 1,
0.1006364, 1.412496, 0.3774389, 0, 0.7882353, 1, 1,
0.1030222, 0.247345, 0.4622749, 0, 0.7843137, 1, 1,
0.1055946, 1.307053, 1.294149, 0, 0.7764706, 1, 1,
0.1096328, -1.347919, 4.36079, 0, 0.772549, 1, 1,
0.1111225, 2.154395, -2.057299, 0, 0.7647059, 1, 1,
0.1134942, 0.5933636, -0.5150185, 0, 0.7607843, 1, 1,
0.1146395, 1.211169, -0.5862044, 0, 0.7529412, 1, 1,
0.1161374, -0.3489125, 2.604597, 0, 0.7490196, 1, 1,
0.1202442, 0.1991548, -0.2836221, 0, 0.7411765, 1, 1,
0.1240855, -0.4919811, 1.926112, 0, 0.7372549, 1, 1,
0.1263655, -2.591921, 2.722705, 0, 0.7294118, 1, 1,
0.1271638, -1.634125, 2.748061, 0, 0.7254902, 1, 1,
0.1281205, -0.2937849, 2.697445, 0, 0.7176471, 1, 1,
0.1284588, 0.1034206, 0.9411376, 0, 0.7137255, 1, 1,
0.1310617, -0.4343326, 3.376409, 0, 0.7058824, 1, 1,
0.1336085, 0.1808173, 0.6934721, 0, 0.6980392, 1, 1,
0.1350876, 0.5052737, 2.742635, 0, 0.6941177, 1, 1,
0.1355367, 0.61343, 1.092092, 0, 0.6862745, 1, 1,
0.1381368, -1.625095, 3.068347, 0, 0.682353, 1, 1,
0.1385277, 0.3057368, 1.878275, 0, 0.6745098, 1, 1,
0.1419889, -2.932953, 3.091457, 0, 0.6705883, 1, 1,
0.1432496, 0.3140917, 1.204327, 0, 0.6627451, 1, 1,
0.1470955, 1.269212, -0.6970532, 0, 0.6588235, 1, 1,
0.1479486, -0.5704427, 2.928721, 0, 0.6509804, 1, 1,
0.152669, -0.6042398, 3.422388, 0, 0.6470588, 1, 1,
0.1586964, 1.100799, -0.3387129, 0, 0.6392157, 1, 1,
0.1589459, -0.1288839, 2.393963, 0, 0.6352941, 1, 1,
0.1601929, -0.2188727, 3.144824, 0, 0.627451, 1, 1,
0.1616999, 0.2086314, 2.135072, 0, 0.6235294, 1, 1,
0.1648529, -1.267423, 3.387644, 0, 0.6156863, 1, 1,
0.1651328, -0.6495997, 3.862412, 0, 0.6117647, 1, 1,
0.1694045, -0.0999587, 1.562479, 0, 0.6039216, 1, 1,
0.1704047, 0.5924108, 0.3729041, 0, 0.5960785, 1, 1,
0.1722346, -0.1181145, 2.51914, 0, 0.5921569, 1, 1,
0.1797452, 0.6149876, 0.6423552, 0, 0.5843138, 1, 1,
0.183701, 1.208141, 1.343273, 0, 0.5803922, 1, 1,
0.1854391, 0.1844086, 0.4078482, 0, 0.572549, 1, 1,
0.1855784, -1.102659, 3.76813, 0, 0.5686275, 1, 1,
0.1886649, -1.508997, 2.588697, 0, 0.5607843, 1, 1,
0.1893273, -0.2951673, 1.308134, 0, 0.5568628, 1, 1,
0.1898199, -0.3220823, 2.849145, 0, 0.5490196, 1, 1,
0.1910434, -1.561073, 2.560812, 0, 0.5450981, 1, 1,
0.1924436, -2.155437, 3.61249, 0, 0.5372549, 1, 1,
0.197724, -1.106454, 3.885576, 0, 0.5333334, 1, 1,
0.1993403, -2.089793, 5.264735, 0, 0.5254902, 1, 1,
0.1993851, -1.333511, 2.507972, 0, 0.5215687, 1, 1,
0.2004092, 2.847018, 0.8082841, 0, 0.5137255, 1, 1,
0.2010232, 0.4504919, -0.1006695, 0, 0.509804, 1, 1,
0.2019064, -1.000051, 2.821379, 0, 0.5019608, 1, 1,
0.2060495, -1.085037, 2.62766, 0, 0.4941176, 1, 1,
0.2063069, -1.911538, 2.887908, 0, 0.4901961, 1, 1,
0.2081337, 1.101853, 0.3276676, 0, 0.4823529, 1, 1,
0.2102066, 0.855359, 0.8874373, 0, 0.4784314, 1, 1,
0.2105799, 0.5991173, 2.675437, 0, 0.4705882, 1, 1,
0.2116804, -0.06545421, 1.458809, 0, 0.4666667, 1, 1,
0.215521, -0.09988921, 0.4021553, 0, 0.4588235, 1, 1,
0.2169406, -0.20175, 1.704038, 0, 0.454902, 1, 1,
0.2256177, -0.2585345, 3.30175, 0, 0.4470588, 1, 1,
0.2257004, -0.3325087, 2.035472, 0, 0.4431373, 1, 1,
0.2269981, 0.3116108, -0.2266708, 0, 0.4352941, 1, 1,
0.2285831, -0.610636, 1.614005, 0, 0.4313726, 1, 1,
0.2291654, 1.036437, 0.5178477, 0, 0.4235294, 1, 1,
0.2295633, 1.268019, 0.257874, 0, 0.4196078, 1, 1,
0.2311572, 0.0740886, 1.559899, 0, 0.4117647, 1, 1,
0.2321681, 1.048147, 0.7612419, 0, 0.4078431, 1, 1,
0.2434762, 0.8855725, 0.03390228, 0, 0.4, 1, 1,
0.2461956, -0.8403134, 2.564433, 0, 0.3921569, 1, 1,
0.2493258, -0.7912072, 0.7075404, 0, 0.3882353, 1, 1,
0.2510692, 0.4475389, 2.13452, 0, 0.3803922, 1, 1,
0.2519352, -1.594218, 1.71892, 0, 0.3764706, 1, 1,
0.2548353, 0.8149261, 1.111795, 0, 0.3686275, 1, 1,
0.2603861, -0.6373169, 3.00357, 0, 0.3647059, 1, 1,
0.2623039, 0.08003095, 1.878888, 0, 0.3568628, 1, 1,
0.2635757, -1.534691, 3.011414, 0, 0.3529412, 1, 1,
0.2666672, 0.4303867, 0.1005776, 0, 0.345098, 1, 1,
0.2696157, -2.19337, 1.672829, 0, 0.3411765, 1, 1,
0.2746783, -1.347272, 3.884517, 0, 0.3333333, 1, 1,
0.2749758, -0.2582094, 0.8356422, 0, 0.3294118, 1, 1,
0.2775742, 1.043785, 2.296681, 0, 0.3215686, 1, 1,
0.282181, -3.499901, 2.212323, 0, 0.3176471, 1, 1,
0.2842634, 1.727595, 0.3557805, 0, 0.3098039, 1, 1,
0.2964377, -1.748274, 3.563225, 0, 0.3058824, 1, 1,
0.299022, 0.7904152, -0.8088149, 0, 0.2980392, 1, 1,
0.3073978, 0.1918919, 2.350253, 0, 0.2901961, 1, 1,
0.3074115, 0.2983626, -0.1476417, 0, 0.2862745, 1, 1,
0.3104881, -0.1088316, 1.674716, 0, 0.2784314, 1, 1,
0.3113773, 0.1200482, 0.5717632, 0, 0.2745098, 1, 1,
0.3130449, -0.6357827, 0.971831, 0, 0.2666667, 1, 1,
0.3152794, -0.4159177, 3.599809, 0, 0.2627451, 1, 1,
0.3153763, -1.135685, 3.740217, 0, 0.254902, 1, 1,
0.3234988, -0.6432237, 2.699654, 0, 0.2509804, 1, 1,
0.3247487, 0.1738876, 1.373276, 0, 0.2431373, 1, 1,
0.326638, -1.158866, 2.275352, 0, 0.2392157, 1, 1,
0.327408, -0.0775653, 0.8519388, 0, 0.2313726, 1, 1,
0.3284398, 1.544251, 0.9609043, 0, 0.227451, 1, 1,
0.3288815, -1.591115, 3.603214, 0, 0.2196078, 1, 1,
0.33394, 0.598121, 0.9865838, 0, 0.2156863, 1, 1,
0.3356777, -0.9660892, 3.905472, 0, 0.2078431, 1, 1,
0.3377271, 0.1087355, 1.240294, 0, 0.2039216, 1, 1,
0.3412927, 1.029648, -0.2374336, 0, 0.1960784, 1, 1,
0.341359, -1.0773, 1.90363, 0, 0.1882353, 1, 1,
0.3435641, -0.7473111, 3.228478, 0, 0.1843137, 1, 1,
0.3450576, -0.1989481, 1.499662, 0, 0.1764706, 1, 1,
0.346688, -0.2728357, 2.901571, 0, 0.172549, 1, 1,
0.3467361, -1.131312, 3.945555, 0, 0.1647059, 1, 1,
0.3471041, 0.9765645, -2.715693, 0, 0.1607843, 1, 1,
0.3487518, 0.3123492, 0.342462, 0, 0.1529412, 1, 1,
0.3498738, -1.611057, 1.966543, 0, 0.1490196, 1, 1,
0.3517178, 0.1253139, 2.923576, 0, 0.1411765, 1, 1,
0.3531932, 2.329296, -0.3627642, 0, 0.1372549, 1, 1,
0.3577853, -0.4514152, 2.272286, 0, 0.1294118, 1, 1,
0.3673943, 0.8634357, 0.4765774, 0, 0.1254902, 1, 1,
0.3719549, 1.815279, 0.5768721, 0, 0.1176471, 1, 1,
0.3751638, 0.05477926, 1.684444, 0, 0.1137255, 1, 1,
0.3771688, 0.3403137, 1.249549, 0, 0.1058824, 1, 1,
0.3783544, -0.5886891, 2.928881, 0, 0.09803922, 1, 1,
0.3796132, -0.4195122, 3.308985, 0, 0.09411765, 1, 1,
0.3817826, 0.3052634, 2.513055, 0, 0.08627451, 1, 1,
0.3823259, 1.130519, 1.552768, 0, 0.08235294, 1, 1,
0.3828236, -0.2185542, 2.015985, 0, 0.07450981, 1, 1,
0.3835612, 1.80539, 1.383658, 0, 0.07058824, 1, 1,
0.3836589, -0.2146267, 2.113787, 0, 0.0627451, 1, 1,
0.3871651, 0.5309126, 2.197668, 0, 0.05882353, 1, 1,
0.3880624, -0.1094859, 3.212406, 0, 0.05098039, 1, 1,
0.388837, 1.489265, 2.953134, 0, 0.04705882, 1, 1,
0.3890749, -0.4132945, 1.781841, 0, 0.03921569, 1, 1,
0.3910386, 0.622209, 0.5696313, 0, 0.03529412, 1, 1,
0.3972144, -0.7746406, 3.284642, 0, 0.02745098, 1, 1,
0.3982285, -0.05145565, 2.289833, 0, 0.02352941, 1, 1,
0.4019975, 1.105405, -0.2669534, 0, 0.01568628, 1, 1,
0.4035703, 0.7286362, 2.465264, 0, 0.01176471, 1, 1,
0.4051433, -0.8749061, 3.418329, 0, 0.003921569, 1, 1,
0.4053681, 0.5629685, -1.039071, 0.003921569, 0, 1, 1,
0.405974, -0.193687, 2.143416, 0.007843138, 0, 1, 1,
0.4079739, 0.6594438, -0.9808795, 0.01568628, 0, 1, 1,
0.4104884, -1.614752, 2.919861, 0.01960784, 0, 1, 1,
0.411863, 0.6293999, 1.858043, 0.02745098, 0, 1, 1,
0.4199864, 0.1830333, 0.6051861, 0.03137255, 0, 1, 1,
0.4263238, -0.648311, 1.444601, 0.03921569, 0, 1, 1,
0.4332372, 1.519461, 0.5620759, 0.04313726, 0, 1, 1,
0.4365945, 0.9726773, -0.6190008, 0.05098039, 0, 1, 1,
0.4391129, -0.4493657, 2.147536, 0.05490196, 0, 1, 1,
0.4447652, 1.595925, 1.21088, 0.0627451, 0, 1, 1,
0.4516873, -0.9875566, 1.589733, 0.06666667, 0, 1, 1,
0.4526526, -2.851332, 4.373525, 0.07450981, 0, 1, 1,
0.4626192, -0.5274586, 1.765775, 0.07843138, 0, 1, 1,
0.4648421, 0.9840149, 1.559353, 0.08627451, 0, 1, 1,
0.4649147, 0.2635112, 0.8694792, 0.09019608, 0, 1, 1,
0.4655254, 0.3654198, 1.505276, 0.09803922, 0, 1, 1,
0.471305, -0.2616541, 2.339503, 0.1058824, 0, 1, 1,
0.4725807, -1.073677, 2.548808, 0.1098039, 0, 1, 1,
0.473773, -0.6840504, 1.992767, 0.1176471, 0, 1, 1,
0.4746263, 1.411498, 0.1017248, 0.1215686, 0, 1, 1,
0.4804014, 0.4149143, -0.2580333, 0.1294118, 0, 1, 1,
0.4838662, -0.4104379, 2.74258, 0.1333333, 0, 1, 1,
0.4863288, 0.5496319, 0.776392, 0.1411765, 0, 1, 1,
0.4867712, -0.5637307, 2.458731, 0.145098, 0, 1, 1,
0.4899191, -0.9413891, 3.012847, 0.1529412, 0, 1, 1,
0.4906301, -0.3823811, 2.849256, 0.1568628, 0, 1, 1,
0.4943229, -0.3797475, 2.002337, 0.1647059, 0, 1, 1,
0.4949304, -0.4545576, 3.403202, 0.1686275, 0, 1, 1,
0.4971701, -0.01365045, 0.7941917, 0.1764706, 0, 1, 1,
0.5000604, -0.8688918, 3.558382, 0.1803922, 0, 1, 1,
0.5052714, -1.335872, 1.67185, 0.1882353, 0, 1, 1,
0.5064673, 1.807577, 1.748248, 0.1921569, 0, 1, 1,
0.5079327, -0.5560348, 3.471434, 0.2, 0, 1, 1,
0.51116, 2.612695, 0.2589452, 0.2078431, 0, 1, 1,
0.511788, 0.7037977, 1.597453, 0.2117647, 0, 1, 1,
0.5138596, 0.7003438, 0.7878567, 0.2196078, 0, 1, 1,
0.5144389, 0.7275794, 2.067197, 0.2235294, 0, 1, 1,
0.5153527, 1.16736, 0.7994371, 0.2313726, 0, 1, 1,
0.5156955, -1.027613, 1.832328, 0.2352941, 0, 1, 1,
0.5165904, 1.717382, 1.648503, 0.2431373, 0, 1, 1,
0.5167921, 0.5990237, 1.535966, 0.2470588, 0, 1, 1,
0.5207573, 0.5621845, -0.776175, 0.254902, 0, 1, 1,
0.5224552, 0.6674978, 0.2419027, 0.2588235, 0, 1, 1,
0.525789, -1.398068, 0.7171648, 0.2666667, 0, 1, 1,
0.5360962, 2.005544, 0.4404241, 0.2705882, 0, 1, 1,
0.5362224, -0.3469306, 1.981904, 0.2784314, 0, 1, 1,
0.5472942, 0.2778695, 0.8004083, 0.282353, 0, 1, 1,
0.5484783, 0.06263876, 2.806471, 0.2901961, 0, 1, 1,
0.5499064, 0.4989503, 2.5265, 0.2941177, 0, 1, 1,
0.5639472, 0.5988107, 0.6650879, 0.3019608, 0, 1, 1,
0.5643401, -0.275275, 1.963263, 0.3098039, 0, 1, 1,
0.5655391, -0.1784108, 1.406531, 0.3137255, 0, 1, 1,
0.5732134, 1.338232, -0.5703997, 0.3215686, 0, 1, 1,
0.5786456, -0.562362, 1.955252, 0.3254902, 0, 1, 1,
0.579183, 0.1215303, 2.07525, 0.3333333, 0, 1, 1,
0.5815695, 0.6465729, 1.187375, 0.3372549, 0, 1, 1,
0.584491, -1.974294, 1.689634, 0.345098, 0, 1, 1,
0.5847397, 0.3262039, 2.292689, 0.3490196, 0, 1, 1,
0.5863131, -0.04662519, 2.936639, 0.3568628, 0, 1, 1,
0.5871875, -0.7539486, 1.446743, 0.3607843, 0, 1, 1,
0.5901246, -0.8980917, 1.612517, 0.3686275, 0, 1, 1,
0.5901518, 0.04651165, 0.7480161, 0.372549, 0, 1, 1,
0.5908293, 0.8063338, 2.154667, 0.3803922, 0, 1, 1,
0.5940632, 1.176557, 0.9629131, 0.3843137, 0, 1, 1,
0.594583, -1.900956, 3.174637, 0.3921569, 0, 1, 1,
0.5960263, -0.02027626, 2.963679, 0.3960784, 0, 1, 1,
0.6035627, 0.7891276, -0.3102061, 0.4039216, 0, 1, 1,
0.6044953, -1.499345, 3.923252, 0.4117647, 0, 1, 1,
0.6058186, 0.3033283, 0.8192824, 0.4156863, 0, 1, 1,
0.6086095, 0.1700687, 0.5216504, 0.4235294, 0, 1, 1,
0.6095188, -0.3123197, 1.113281, 0.427451, 0, 1, 1,
0.6205185, -0.02426336, 2.607176, 0.4352941, 0, 1, 1,
0.6245687, -1.036131, 3.058199, 0.4392157, 0, 1, 1,
0.6261004, 0.3609526, 2.115387, 0.4470588, 0, 1, 1,
0.6280036, 1.14766, 1.244362, 0.4509804, 0, 1, 1,
0.6302087, 0.5086323, 0.328142, 0.4588235, 0, 1, 1,
0.6308004, 1.125932, 0.7369609, 0.4627451, 0, 1, 1,
0.6337019, 0.7957059, 1.308697, 0.4705882, 0, 1, 1,
0.6355664, 0.4277079, 0.03319623, 0.4745098, 0, 1, 1,
0.6372325, -0.1956526, 2.761647, 0.4823529, 0, 1, 1,
0.6444299, -0.3210453, 1.91218, 0.4862745, 0, 1, 1,
0.6513017, -1.159374, 3.431342, 0.4941176, 0, 1, 1,
0.6565546, -0.3665931, 1.634465, 0.5019608, 0, 1, 1,
0.6571624, -0.1585579, 1.961434, 0.5058824, 0, 1, 1,
0.6591977, 0.3272857, 1.569972, 0.5137255, 0, 1, 1,
0.6624112, 0.6463595, -0.9009175, 0.5176471, 0, 1, 1,
0.6630996, -0.4376385, 2.746958, 0.5254902, 0, 1, 1,
0.6657023, 0.1440977, 2.118646, 0.5294118, 0, 1, 1,
0.6679167, 0.6083112, 0.7285573, 0.5372549, 0, 1, 1,
0.6852654, 0.5389395, 1.597911, 0.5411765, 0, 1, 1,
0.6908133, -0.6115298, -0.0743648, 0.5490196, 0, 1, 1,
0.6925399, -0.7414301, 3.757865, 0.5529412, 0, 1, 1,
0.6962633, 0.08787695, 2.079624, 0.5607843, 0, 1, 1,
0.6998626, -1.467216, 3.632889, 0.5647059, 0, 1, 1,
0.7000103, -0.421998, 1.902742, 0.572549, 0, 1, 1,
0.7012304, -1.33462, 3.837991, 0.5764706, 0, 1, 1,
0.7013206, 0.4707354, 0.09596252, 0.5843138, 0, 1, 1,
0.7037181, -3.212008, 5.304222, 0.5882353, 0, 1, 1,
0.7037876, -0.6119379, 1.870929, 0.5960785, 0, 1, 1,
0.7221069, 1.498269, -0.3257061, 0.6039216, 0, 1, 1,
0.722282, -2.080405, 2.324671, 0.6078432, 0, 1, 1,
0.7228556, -1.110977, 2.599245, 0.6156863, 0, 1, 1,
0.7259936, -0.3070062, 1.43735, 0.6196079, 0, 1, 1,
0.7334042, -0.6995856, 1.020891, 0.627451, 0, 1, 1,
0.7372286, 0.04577454, 2.11295, 0.6313726, 0, 1, 1,
0.7393096, -1.089581, 2.711406, 0.6392157, 0, 1, 1,
0.7530656, 0.01664127, 1.979742, 0.6431373, 0, 1, 1,
0.7531738, -1.270485, 3.463497, 0.6509804, 0, 1, 1,
0.755596, 0.3454219, 1.406425, 0.654902, 0, 1, 1,
0.75894, -0.006597425, 1.543954, 0.6627451, 0, 1, 1,
0.7605478, 0.1528579, 0.6078266, 0.6666667, 0, 1, 1,
0.764757, 0.2336626, 1.578397, 0.6745098, 0, 1, 1,
0.7660929, 0.04107112, 2.15265, 0.6784314, 0, 1, 1,
0.7670358, 0.6192226, -0.06133404, 0.6862745, 0, 1, 1,
0.7677859, -0.1424995, 0.9351841, 0.6901961, 0, 1, 1,
0.7731642, 0.02615811, 2.638268, 0.6980392, 0, 1, 1,
0.7801203, -0.3571245, 2.187686, 0.7058824, 0, 1, 1,
0.7890813, -0.6003209, 3.697993, 0.7098039, 0, 1, 1,
0.7898434, 1.241142, 0.763822, 0.7176471, 0, 1, 1,
0.7925885, -1.432896, 2.412034, 0.7215686, 0, 1, 1,
0.7945099, 0.6990449, 1.103352, 0.7294118, 0, 1, 1,
0.7959337, -0.1415904, 2.680648, 0.7333333, 0, 1, 1,
0.7973742, -0.4837584, 2.770344, 0.7411765, 0, 1, 1,
0.7998276, 1.227275, 1.400226, 0.7450981, 0, 1, 1,
0.8082881, 0.6821687, -0.5430709, 0.7529412, 0, 1, 1,
0.8091525, -0.9974928, 2.18099, 0.7568628, 0, 1, 1,
0.8107672, -1.311424, 1.551264, 0.7647059, 0, 1, 1,
0.8168563, 0.3992866, 1.023774, 0.7686275, 0, 1, 1,
0.8182412, 1.070866, 1.138003, 0.7764706, 0, 1, 1,
0.8204264, -0.0221575, 1.452908, 0.7803922, 0, 1, 1,
0.8206562, -0.3136382, 3.623066, 0.7882353, 0, 1, 1,
0.8223263, -0.02469998, 2.514359, 0.7921569, 0, 1, 1,
0.823051, 0.7373742, 2.124865, 0.8, 0, 1, 1,
0.8254952, -1.170154, 2.492896, 0.8078431, 0, 1, 1,
0.8314578, 0.2986779, 1.449689, 0.8117647, 0, 1, 1,
0.8370988, 0.3382782, 0.6175416, 0.8196079, 0, 1, 1,
0.840392, 0.373758, 1.109688, 0.8235294, 0, 1, 1,
0.8412814, 0.0495913, 2.590129, 0.8313726, 0, 1, 1,
0.8440292, 3.399103, -0.6782346, 0.8352941, 0, 1, 1,
0.8441095, 1.641285, 0.8105156, 0.8431373, 0, 1, 1,
0.8467972, 0.4843521, 1.696079, 0.8470588, 0, 1, 1,
0.8495293, 0.03811342, 1.990888, 0.854902, 0, 1, 1,
0.8518044, 0.4368148, 1.229394, 0.8588235, 0, 1, 1,
0.8523627, 0.7108278, -0.326714, 0.8666667, 0, 1, 1,
0.8682412, -1.903836, 2.473344, 0.8705882, 0, 1, 1,
0.8741763, -0.09496551, 0.1920393, 0.8784314, 0, 1, 1,
0.8755469, 0.4908938, 1.068909, 0.8823529, 0, 1, 1,
0.8791348, -1.326419, 4.136308, 0.8901961, 0, 1, 1,
0.8795363, -1.306819, 2.880126, 0.8941177, 0, 1, 1,
0.8864552, -1.609149, 1.981966, 0.9019608, 0, 1, 1,
0.8886959, -0.3753212, 1.997079, 0.9098039, 0, 1, 1,
0.8889754, -0.05618081, 1.630421, 0.9137255, 0, 1, 1,
0.8914718, -0.05895191, 0.7049875, 0.9215686, 0, 1, 1,
0.8920906, 0.4132072, -0.7710555, 0.9254902, 0, 1, 1,
0.8941747, 0.1434975, 0.9100096, 0.9333333, 0, 1, 1,
0.8991569, -0.3667192, 3.055971, 0.9372549, 0, 1, 1,
0.8998537, -0.3677169, 3.148643, 0.945098, 0, 1, 1,
0.9012529, 0.06568269, 2.454998, 0.9490196, 0, 1, 1,
0.9084525, 1.405455, 1.415845, 0.9568627, 0, 1, 1,
0.910641, -0.9117541, 2.605668, 0.9607843, 0, 1, 1,
0.9172959, -0.2326818, 1.360034, 0.9686275, 0, 1, 1,
0.9222975, -0.8860622, 1.689942, 0.972549, 0, 1, 1,
0.9293768, 1.338651, 0.6449563, 0.9803922, 0, 1, 1,
0.931735, 0.03425043, 1.267461, 0.9843137, 0, 1, 1,
0.9347794, -1.42886, 1.827294, 0.9921569, 0, 1, 1,
0.9376261, 0.3547686, 1.302428, 0.9960784, 0, 1, 1,
0.9385536, -0.03989069, 3.771162, 1, 0, 0.9960784, 1,
0.946411, 0.5928501, -0.2573905, 1, 0, 0.9882353, 1,
0.9504987, 0.8213785, 2.505069, 1, 0, 0.9843137, 1,
0.9527726, -0.6908166, 3.73121, 1, 0, 0.9764706, 1,
0.9575776, -0.084216, 2.703064, 1, 0, 0.972549, 1,
0.9653756, 0.457491, 1.720783, 1, 0, 0.9647059, 1,
0.9691077, 0.367102, 0.5011412, 1, 0, 0.9607843, 1,
0.972773, -0.8821862, 2.84102, 1, 0, 0.9529412, 1,
0.973024, -0.9378292, 2.920459, 1, 0, 0.9490196, 1,
0.9749371, -0.04592999, 0.1005706, 1, 0, 0.9411765, 1,
0.9751356, -0.2038718, 1.026993, 1, 0, 0.9372549, 1,
0.9782073, 0.06963005, 0.9280007, 1, 0, 0.9294118, 1,
0.9786721, 1.329721, 0.2097564, 1, 0, 0.9254902, 1,
0.9798418, 1.074297, 0.6195535, 1, 0, 0.9176471, 1,
0.9799947, -0.1393637, 3.079835, 1, 0, 0.9137255, 1,
0.9809202, 0.4629323, 3.541206, 1, 0, 0.9058824, 1,
0.9816357, -0.4621017, 1.989603, 1, 0, 0.9019608, 1,
0.9959069, 0.3642186, 0.5116822, 1, 0, 0.8941177, 1,
0.9975713, -0.6833937, 2.202346, 1, 0, 0.8862745, 1,
0.9982932, 0.5384474, 0.182501, 1, 0, 0.8823529, 1,
1.003777, 1.464347, 0.005365321, 1, 0, 0.8745098, 1,
1.008248, 2.632462, 0.7649311, 1, 0, 0.8705882, 1,
1.010097, -0.02532983, 3.418634, 1, 0, 0.8627451, 1,
1.014123, 2.088912, 0.6781417, 1, 0, 0.8588235, 1,
1.017268, 0.08091369, 0.6318687, 1, 0, 0.8509804, 1,
1.027555, -0.5169234, 3.039173, 1, 0, 0.8470588, 1,
1.028837, 0.304658, 1.079415, 1, 0, 0.8392157, 1,
1.033191, -0.8774396, 3.235653, 1, 0, 0.8352941, 1,
1.033854, -0.002044541, 3.257415, 1, 0, 0.827451, 1,
1.034297, 0.2522058, 1.758671, 1, 0, 0.8235294, 1,
1.03602, -1.303393, 2.695548, 1, 0, 0.8156863, 1,
1.043723, 1.559523, 2.532607, 1, 0, 0.8117647, 1,
1.045721, -0.2161505, 2.048066, 1, 0, 0.8039216, 1,
1.046075, -0.1186317, 2.484651, 1, 0, 0.7960784, 1,
1.046769, -0.3114147, 3.650007, 1, 0, 0.7921569, 1,
1.05545, 1.09792, 1.99745, 1, 0, 0.7843137, 1,
1.059127, -0.532298, 1.438905, 1, 0, 0.7803922, 1,
1.061361, -2.096922, 2.987247, 1, 0, 0.772549, 1,
1.073247, -0.3841986, 3.099855, 1, 0, 0.7686275, 1,
1.076746, -0.3129755, 3.307636, 1, 0, 0.7607843, 1,
1.081785, 1.836777, 0.2387195, 1, 0, 0.7568628, 1,
1.082962, 0.7646622, 2.141788, 1, 0, 0.7490196, 1,
1.111649, -0.8516655, 2.522247, 1, 0, 0.7450981, 1,
1.113361, -1.361879, 1.649707, 1, 0, 0.7372549, 1,
1.117274, -0.6297601, 2.334595, 1, 0, 0.7333333, 1,
1.125133, -0.7403753, 3.822166, 1, 0, 0.7254902, 1,
1.131603, 0.8219195, 0.6890273, 1, 0, 0.7215686, 1,
1.138541, -0.2647379, 1.965455, 1, 0, 0.7137255, 1,
1.139656, -0.5010459, 0.2316599, 1, 0, 0.7098039, 1,
1.141509, 0.185103, 1.063696, 1, 0, 0.7019608, 1,
1.143584, 0.5245567, 0.59491, 1, 0, 0.6941177, 1,
1.149076, 0.5071486, 1.095664, 1, 0, 0.6901961, 1,
1.154775, -1.204789, 2.179013, 1, 0, 0.682353, 1,
1.156889, -1.951268, 4.702584, 1, 0, 0.6784314, 1,
1.168435, 0.1782485, 0.8490192, 1, 0, 0.6705883, 1,
1.169624, -0.5315076, 1.774709, 1, 0, 0.6666667, 1,
1.176977, -0.3027308, 0.108901, 1, 0, 0.6588235, 1,
1.178148, -0.7705953, 1.623695, 1, 0, 0.654902, 1,
1.185211, -0.5221945, 1.904161, 1, 0, 0.6470588, 1,
1.191345, -0.6271713, 0.7285777, 1, 0, 0.6431373, 1,
1.192823, -1.10387, 0.6676565, 1, 0, 0.6352941, 1,
1.196667, -0.9105847, 2.391408, 1, 0, 0.6313726, 1,
1.196952, -0.5578635, 2.370544, 1, 0, 0.6235294, 1,
1.198162, -0.4603411, 3.958239, 1, 0, 0.6196079, 1,
1.221047, -0.1228337, 1.60614, 1, 0, 0.6117647, 1,
1.222455, -0.6448225, 1.680526, 1, 0, 0.6078432, 1,
1.226543, 1.040483, -0.80963, 1, 0, 0.6, 1,
1.229405, -0.4906123, 3.47752, 1, 0, 0.5921569, 1,
1.232556, -1.236482, 2.060518, 1, 0, 0.5882353, 1,
1.236461, 0.1238148, 1.462857, 1, 0, 0.5803922, 1,
1.237056, 1.140558, -0.6180788, 1, 0, 0.5764706, 1,
1.239548, 0.4159617, 1.527353, 1, 0, 0.5686275, 1,
1.252483, 1.1212, 0.5397761, 1, 0, 0.5647059, 1,
1.257008, -1.624838, 2.793389, 1, 0, 0.5568628, 1,
1.25898, -0.6889522, 0.8559358, 1, 0, 0.5529412, 1,
1.259005, 0.2868127, 0.3224434, 1, 0, 0.5450981, 1,
1.264012, -1.169576, 3.111694, 1, 0, 0.5411765, 1,
1.266265, -0.516533, 0.9235454, 1, 0, 0.5333334, 1,
1.266457, 0.3264609, 2.400174, 1, 0, 0.5294118, 1,
1.266697, 0.2561298, 0.9399698, 1, 0, 0.5215687, 1,
1.268005, -0.08671241, 0.03999145, 1, 0, 0.5176471, 1,
1.269642, 1.978469, -0.5076255, 1, 0, 0.509804, 1,
1.279605, 0.4238248, 1.667857, 1, 0, 0.5058824, 1,
1.279824, -0.08269201, 1.782357, 1, 0, 0.4980392, 1,
1.282734, -0.4678862, 2.807901, 1, 0, 0.4901961, 1,
1.29382, -0.481514, 1.389842, 1, 0, 0.4862745, 1,
1.293873, -0.2175698, 2.180354, 1, 0, 0.4784314, 1,
1.304136, -0.008748956, 1.630043, 1, 0, 0.4745098, 1,
1.314153, 0.4414496, 0.4651242, 1, 0, 0.4666667, 1,
1.325279, -0.2922587, 1.51045, 1, 0, 0.4627451, 1,
1.32858, -1.718529, 1.141468, 1, 0, 0.454902, 1,
1.341394, -0.6047505, 1.904851, 1, 0, 0.4509804, 1,
1.341524, -0.5279052, 3.742756, 1, 0, 0.4431373, 1,
1.343118, -2.084228, 2.70104, 1, 0, 0.4392157, 1,
1.359527, -0.8675643, 2.708032, 1, 0, 0.4313726, 1,
1.373897, 0.05036059, 1.553279, 1, 0, 0.427451, 1,
1.375016, 1.29056, 1.205862, 1, 0, 0.4196078, 1,
1.382921, -0.9163525, 2.051142, 1, 0, 0.4156863, 1,
1.38532, -0.1785769, 1.056935, 1, 0, 0.4078431, 1,
1.386069, 0.2153253, 1.735626, 1, 0, 0.4039216, 1,
1.39063, -0.3814607, 1.580314, 1, 0, 0.3960784, 1,
1.400464, -0.376799, 1.295833, 1, 0, 0.3882353, 1,
1.414896, -0.2140653, 0.4525076, 1, 0, 0.3843137, 1,
1.428527, 0.39902, 0.7712613, 1, 0, 0.3764706, 1,
1.452212, 0.563946, 0.7504948, 1, 0, 0.372549, 1,
1.47034, 0.4246412, 0.8125457, 1, 0, 0.3647059, 1,
1.471404, 0.5464562, 1.277315, 1, 0, 0.3607843, 1,
1.490092, 0.8156032, 1.606996, 1, 0, 0.3529412, 1,
1.530382, -0.2833671, 1.647645, 1, 0, 0.3490196, 1,
1.539278, -0.8376051, 2.548095, 1, 0, 0.3411765, 1,
1.545462, -0.2613431, 1.872858, 1, 0, 0.3372549, 1,
1.571684, 0.5015172, 1.145787, 1, 0, 0.3294118, 1,
1.571784, -0.5950899, -0.325027, 1, 0, 0.3254902, 1,
1.585052, -1.587273, 2.909493, 1, 0, 0.3176471, 1,
1.594464, 1.145754, 0.9029868, 1, 0, 0.3137255, 1,
1.595836, 1.398301, 2.417431, 1, 0, 0.3058824, 1,
1.645015, -0.9801654, 2.458024, 1, 0, 0.2980392, 1,
1.647261, 0.1702398, 1.667838, 1, 0, 0.2941177, 1,
1.65519, -0.348075, 2.47261, 1, 0, 0.2862745, 1,
1.669053, 2.687781, -0.3580111, 1, 0, 0.282353, 1,
1.706954, -1.385337, 1.055658, 1, 0, 0.2745098, 1,
1.718079, 1.906612, 1.728406, 1, 0, 0.2705882, 1,
1.72963, -1.913199, 2.2045, 1, 0, 0.2627451, 1,
1.733057, 0.8491875, 1.835833, 1, 0, 0.2588235, 1,
1.736244, 1.630531, 0.95584, 1, 0, 0.2509804, 1,
1.745542, -1.237643, 0.9399459, 1, 0, 0.2470588, 1,
1.758237, 1.358009, -0.349757, 1, 0, 0.2392157, 1,
1.770216, -0.1511215, 0.9615918, 1, 0, 0.2352941, 1,
1.772881, -0.3073285, 3.163452, 1, 0, 0.227451, 1,
1.798925, -0.8836462, -0.6331434, 1, 0, 0.2235294, 1,
1.833074, -0.8024294, 1.408854, 1, 0, 0.2156863, 1,
1.852896, 0.6544649, 0.06585537, 1, 0, 0.2117647, 1,
1.863407, 0.7283292, 1.933568, 1, 0, 0.2039216, 1,
1.867152, 0.2045428, 1.936193, 1, 0, 0.1960784, 1,
1.886385, 0.3361296, 2.558392, 1, 0, 0.1921569, 1,
1.905224, 1.799813, 0.4559113, 1, 0, 0.1843137, 1,
1.906345, -2.108813, 1.299437, 1, 0, 0.1803922, 1,
1.968084, 0.8804206, 1.888234, 1, 0, 0.172549, 1,
1.975679, 0.5565535, 0.7195753, 1, 0, 0.1686275, 1,
1.976352, -0.2679272, 2.216559, 1, 0, 0.1607843, 1,
1.991723, 0.4627066, 1.130837, 1, 0, 0.1568628, 1,
2.005848, 0.4128976, 1.238631, 1, 0, 0.1490196, 1,
2.014394, 0.4555485, 0.4866602, 1, 0, 0.145098, 1,
2.083579, 0.9791285, 1.171904, 1, 0, 0.1372549, 1,
2.084585, -1.795267, 3.09438, 1, 0, 0.1333333, 1,
2.094277, 0.6083569, 0.2744818, 1, 0, 0.1254902, 1,
2.125954, 1.012932, 0.2520705, 1, 0, 0.1215686, 1,
2.150056, 1.12808, 2.03682, 1, 0, 0.1137255, 1,
2.152418, -0.04637519, 1.272465, 1, 0, 0.1098039, 1,
2.205705, 1.091905, 2.628037, 1, 0, 0.1019608, 1,
2.211271, -0.5751945, 2.821964, 1, 0, 0.09411765, 1,
2.215234, -0.4893382, 1.623367, 1, 0, 0.09019608, 1,
2.280058, 0.401271, 3.153136, 1, 0, 0.08235294, 1,
2.29333, 0.3034842, 2.709835, 1, 0, 0.07843138, 1,
2.301617, -0.5199006, 2.055895, 1, 0, 0.07058824, 1,
2.333244, 2.784167, 0.868109, 1, 0, 0.06666667, 1,
2.341818, -0.9435841, 3.158586, 1, 0, 0.05882353, 1,
2.541925, -0.9269462, 1.163009, 1, 0, 0.05490196, 1,
2.591835, -0.5666616, 1.706621, 1, 0, 0.04705882, 1,
2.63861, 0.6288679, -1.0949, 1, 0, 0.04313726, 1,
2.678263, -0.1306926, 1.766699, 1, 0, 0.03529412, 1,
2.68254, 0.1919175, 0.6552771, 1, 0, 0.03137255, 1,
2.722903, 0.8061158, -0.1195027, 1, 0, 0.02352941, 1,
2.80813, -1.340096, 1.330896, 1, 0, 0.01960784, 1,
2.848055, 0.9888359, 1.148253, 1, 0, 0.01176471, 1,
3.071797, 3.537536, 0.7363348, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.1308984, -4.692746, -6.732807, 0, -0.5, 0.5, 0.5,
-0.1308984, -4.692746, -6.732807, 1, -0.5, 0.5, 0.5,
-0.1308984, -4.692746, -6.732807, 1, 1.5, 0.5, 0.5,
-0.1308984, -4.692746, -6.732807, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.419308, 0.01881742, -6.732807, 0, -0.5, 0.5, 0.5,
-4.419308, 0.01881742, -6.732807, 1, -0.5, 0.5, 0.5,
-4.419308, 0.01881742, -6.732807, 1, 1.5, 0.5, 0.5,
-4.419308, 0.01881742, -6.732807, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.419308, -4.692746, 0.1579931, 0, -0.5, 0.5, 0.5,
-4.419308, -4.692746, 0.1579931, 1, -0.5, 0.5, 0.5,
-4.419308, -4.692746, 0.1579931, 1, 1.5, 0.5, 0.5,
-4.419308, -4.692746, 0.1579931, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.605462, -5.142622,
3, -3.605462, -5.142622,
-3, -3.605462, -5.142622,
-3, -3.786676, -5.407653,
-2, -3.605462, -5.142622,
-2, -3.786676, -5.407653,
-1, -3.605462, -5.142622,
-1, -3.786676, -5.407653,
0, -3.605462, -5.142622,
0, -3.786676, -5.407653,
1, -3.605462, -5.142622,
1, -3.786676, -5.407653,
2, -3.605462, -5.142622,
2, -3.786676, -5.407653,
3, -3.605462, -5.142622,
3, -3.786676, -5.407653
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.149104, -5.937715, 0, -0.5, 0.5, 0.5,
-3, -4.149104, -5.937715, 1, -0.5, 0.5, 0.5,
-3, -4.149104, -5.937715, 1, 1.5, 0.5, 0.5,
-3, -4.149104, -5.937715, 0, 1.5, 0.5, 0.5,
-2, -4.149104, -5.937715, 0, -0.5, 0.5, 0.5,
-2, -4.149104, -5.937715, 1, -0.5, 0.5, 0.5,
-2, -4.149104, -5.937715, 1, 1.5, 0.5, 0.5,
-2, -4.149104, -5.937715, 0, 1.5, 0.5, 0.5,
-1, -4.149104, -5.937715, 0, -0.5, 0.5, 0.5,
-1, -4.149104, -5.937715, 1, -0.5, 0.5, 0.5,
-1, -4.149104, -5.937715, 1, 1.5, 0.5, 0.5,
-1, -4.149104, -5.937715, 0, 1.5, 0.5, 0.5,
0, -4.149104, -5.937715, 0, -0.5, 0.5, 0.5,
0, -4.149104, -5.937715, 1, -0.5, 0.5, 0.5,
0, -4.149104, -5.937715, 1, 1.5, 0.5, 0.5,
0, -4.149104, -5.937715, 0, 1.5, 0.5, 0.5,
1, -4.149104, -5.937715, 0, -0.5, 0.5, 0.5,
1, -4.149104, -5.937715, 1, -0.5, 0.5, 0.5,
1, -4.149104, -5.937715, 1, 1.5, 0.5, 0.5,
1, -4.149104, -5.937715, 0, 1.5, 0.5, 0.5,
2, -4.149104, -5.937715, 0, -0.5, 0.5, 0.5,
2, -4.149104, -5.937715, 1, -0.5, 0.5, 0.5,
2, -4.149104, -5.937715, 1, 1.5, 0.5, 0.5,
2, -4.149104, -5.937715, 0, 1.5, 0.5, 0.5,
3, -4.149104, -5.937715, 0, -0.5, 0.5, 0.5,
3, -4.149104, -5.937715, 1, -0.5, 0.5, 0.5,
3, -4.149104, -5.937715, 1, 1.5, 0.5, 0.5,
3, -4.149104, -5.937715, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.429675, -2, -5.142622,
-3.429675, 2, -5.142622,
-3.429675, -2, -5.142622,
-3.594614, -2, -5.407653,
-3.429675, 0, -5.142622,
-3.594614, 0, -5.407653,
-3.429675, 2, -5.142622,
-3.594614, 2, -5.407653
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.924491, -2, -5.937715, 0, -0.5, 0.5, 0.5,
-3.924491, -2, -5.937715, 1, -0.5, 0.5, 0.5,
-3.924491, -2, -5.937715, 1, 1.5, 0.5, 0.5,
-3.924491, -2, -5.937715, 0, 1.5, 0.5, 0.5,
-3.924491, 0, -5.937715, 0, -0.5, 0.5, 0.5,
-3.924491, 0, -5.937715, 1, -0.5, 0.5, 0.5,
-3.924491, 0, -5.937715, 1, 1.5, 0.5, 0.5,
-3.924491, 0, -5.937715, 0, 1.5, 0.5, 0.5,
-3.924491, 2, -5.937715, 0, -0.5, 0.5, 0.5,
-3.924491, 2, -5.937715, 1, -0.5, 0.5, 0.5,
-3.924491, 2, -5.937715, 1, 1.5, 0.5, 0.5,
-3.924491, 2, -5.937715, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.429675, -3.605462, -4,
-3.429675, -3.605462, 4,
-3.429675, -3.605462, -4,
-3.594614, -3.786676, -4,
-3.429675, -3.605462, -2,
-3.594614, -3.786676, -2,
-3.429675, -3.605462, 0,
-3.594614, -3.786676, 0,
-3.429675, -3.605462, 2,
-3.594614, -3.786676, 2,
-3.429675, -3.605462, 4,
-3.594614, -3.786676, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.924491, -4.149104, -4, 0, -0.5, 0.5, 0.5,
-3.924491, -4.149104, -4, 1, -0.5, 0.5, 0.5,
-3.924491, -4.149104, -4, 1, 1.5, 0.5, 0.5,
-3.924491, -4.149104, -4, 0, 1.5, 0.5, 0.5,
-3.924491, -4.149104, -2, 0, -0.5, 0.5, 0.5,
-3.924491, -4.149104, -2, 1, -0.5, 0.5, 0.5,
-3.924491, -4.149104, -2, 1, 1.5, 0.5, 0.5,
-3.924491, -4.149104, -2, 0, 1.5, 0.5, 0.5,
-3.924491, -4.149104, 0, 0, -0.5, 0.5, 0.5,
-3.924491, -4.149104, 0, 1, -0.5, 0.5, 0.5,
-3.924491, -4.149104, 0, 1, 1.5, 0.5, 0.5,
-3.924491, -4.149104, 0, 0, 1.5, 0.5, 0.5,
-3.924491, -4.149104, 2, 0, -0.5, 0.5, 0.5,
-3.924491, -4.149104, 2, 1, -0.5, 0.5, 0.5,
-3.924491, -4.149104, 2, 1, 1.5, 0.5, 0.5,
-3.924491, -4.149104, 2, 0, 1.5, 0.5, 0.5,
-3.924491, -4.149104, 4, 0, -0.5, 0.5, 0.5,
-3.924491, -4.149104, 4, 1, -0.5, 0.5, 0.5,
-3.924491, -4.149104, 4, 1, 1.5, 0.5, 0.5,
-3.924491, -4.149104, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.429675, -3.605462, -5.142622,
-3.429675, 3.643097, -5.142622,
-3.429675, -3.605462, 5.458609,
-3.429675, 3.643097, 5.458609,
-3.429675, -3.605462, -5.142622,
-3.429675, -3.605462, 5.458609,
-3.429675, 3.643097, -5.142622,
-3.429675, 3.643097, 5.458609,
-3.429675, -3.605462, -5.142622,
3.167878, -3.605462, -5.142622,
-3.429675, -3.605462, 5.458609,
3.167878, -3.605462, 5.458609,
-3.429675, 3.643097, -5.142622,
3.167878, 3.643097, -5.142622,
-3.429675, 3.643097, 5.458609,
3.167878, 3.643097, 5.458609,
3.167878, -3.605462, -5.142622,
3.167878, 3.643097, -5.142622,
3.167878, -3.605462, 5.458609,
3.167878, 3.643097, 5.458609,
3.167878, -3.605462, -5.142622,
3.167878, -3.605462, 5.458609,
3.167878, 3.643097, -5.142622,
3.167878, 3.643097, 5.458609
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.709604;
var distance = 34.3009;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1308984, -0.01881742, -0.1579931 );
mvMatrix.scale( 1.263465, 1.14999, 0.7863025 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3009);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Tribufos<-read.table("Tribufos.xyz")
```

```
## Error in read.table("Tribufos.xyz"): no lines available in input
```

```r
x<-Tribufos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
```

```r
y<-Tribufos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
```

```r
z<-Tribufos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.333594, -0.570239, -1.228204, 0, 0, 1, 1, 1,
-2.966939, -0.8772933, -1.891762, 1, 0, 0, 1, 1,
-2.965798, 0.6195021, -0.3671054, 1, 0, 0, 1, 1,
-2.835738, -1.146661, -2.233838, 1, 0, 0, 1, 1,
-2.774683, 0.6751535, -1.400562, 1, 0, 0, 1, 1,
-2.574847, -0.3657161, -1.006492, 1, 0, 0, 1, 1,
-2.574012, 0.1778201, -1.542166, 0, 0, 0, 1, 1,
-2.541747, 0.3508506, -3.343544, 0, 0, 0, 1, 1,
-2.503786, -0.9961391, -0.009698092, 0, 0, 0, 1, 1,
-2.483003, 1.092452, -1.054294, 0, 0, 0, 1, 1,
-2.479593, -0.02639401, -3.600204, 0, 0, 0, 1, 1,
-2.433297, 1.493611, -0.9236034, 0, 0, 0, 1, 1,
-2.402809, 0.2281987, -1.90766, 0, 0, 0, 1, 1,
-2.3506, -1.175683, -2.718665, 1, 1, 1, 1, 1,
-2.321621, 1.204192, -1.366586, 1, 1, 1, 1, 1,
-2.289647, 0.7183423, -0.2645095, 1, 1, 1, 1, 1,
-2.201038, -0.4247779, -2.019439, 1, 1, 1, 1, 1,
-2.194, -2.477536, -2.598199, 1, 1, 1, 1, 1,
-2.130095, -0.2918599, 0.7003067, 1, 1, 1, 1, 1,
-2.117915, -0.6628098, -2.560688, 1, 1, 1, 1, 1,
-2.113002, 1.435257, -0.08949964, 1, 1, 1, 1, 1,
-2.110573, -0.9562126, -1.404736, 1, 1, 1, 1, 1,
-2.090571, 0.5482912, -2.215545, 1, 1, 1, 1, 1,
-2.04973, -0.2136176, -1.486129, 1, 1, 1, 1, 1,
-2.047749, -1.321962, -2.574671, 1, 1, 1, 1, 1,
-2.011518, 0.1582744, -1.240922, 1, 1, 1, 1, 1,
-2.007317, -1.401783, -0.880505, 1, 1, 1, 1, 1,
-1.970634, -0.7552844, -2.667685, 1, 1, 1, 1, 1,
-1.96804, -0.580894, -1.248586, 0, 0, 1, 1, 1,
-1.965954, -1.384896, -2.817871, 1, 0, 0, 1, 1,
-1.948402, 0.4832585, -1.015216, 1, 0, 0, 1, 1,
-1.935526, -2.099812, -3.004604, 1, 0, 0, 1, 1,
-1.900508, 0.8065301, -2.66211, 1, 0, 0, 1, 1,
-1.897151, -0.8729434, -1.576653, 1, 0, 0, 1, 1,
-1.882365, 0.2881365, -0.8439574, 0, 0, 0, 1, 1,
-1.868329, 0.839924, -1.106417, 0, 0, 0, 1, 1,
-1.865817, -1.242892, -1.879087, 0, 0, 0, 1, 1,
-1.862378, -1.208822, -1.940709, 0, 0, 0, 1, 1,
-1.841624, -0.6397433, -2.861636, 0, 0, 0, 1, 1,
-1.840344, 0.5031107, 0.3757532, 0, 0, 0, 1, 1,
-1.82407, 1.462998, -0.01984821, 0, 0, 0, 1, 1,
-1.767094, 0.8833087, -0.3157059, 1, 1, 1, 1, 1,
-1.737273, -0.2554031, -1.189302, 1, 1, 1, 1, 1,
-1.733478, -0.1709919, -1.022689, 1, 1, 1, 1, 1,
-1.723102, 1.090167, -1.046307, 1, 1, 1, 1, 1,
-1.720306, -0.7669395, -2.458443, 1, 1, 1, 1, 1,
-1.714017, 0.2216421, -3.371943, 1, 1, 1, 1, 1,
-1.703892, 0.7350881, -1.173798, 1, 1, 1, 1, 1,
-1.7021, 0.03680571, -0.3944582, 1, 1, 1, 1, 1,
-1.666756, -0.314599, -0.7877275, 1, 1, 1, 1, 1,
-1.662056, 1.000648, -1.465436, 1, 1, 1, 1, 1,
-1.654224, 0.5537301, -0.2758913, 1, 1, 1, 1, 1,
-1.653121, 0.1545219, -0.8370943, 1, 1, 1, 1, 1,
-1.644819, -0.01085122, -0.7591087, 1, 1, 1, 1, 1,
-1.628012, 1.267012, 0.04346405, 1, 1, 1, 1, 1,
-1.614183, -0.02333757, -3.646015, 1, 1, 1, 1, 1,
-1.595623, 8.793842e-05, -1.388283, 0, 0, 1, 1, 1,
-1.585327, 0.5084935, -2.936179, 1, 0, 0, 1, 1,
-1.577027, -0.3446165, -2.274774, 1, 0, 0, 1, 1,
-1.573943, 0.7311814, 0.787864, 1, 0, 0, 1, 1,
-1.573251, -0.5483667, -1.431489, 1, 0, 0, 1, 1,
-1.567865, -0.8827016, -2.256414, 1, 0, 0, 1, 1,
-1.561878, -0.2548598, -1.805367, 0, 0, 0, 1, 1,
-1.559724, 0.4245498, -2.315945, 0, 0, 0, 1, 1,
-1.550663, -0.7300181, -2.669353, 0, 0, 0, 1, 1,
-1.545249, -3.212233, -2.426203, 0, 0, 0, 1, 1,
-1.53337, -1.095847, -2.606135, 0, 0, 0, 1, 1,
-1.53266, -0.1974415, -3.341718, 0, 0, 0, 1, 1,
-1.520661, -0.8338898, -2.613794, 0, 0, 0, 1, 1,
-1.518459, -0.8396085, -2.426997, 1, 1, 1, 1, 1,
-1.498159, 0.6807166, -1.768441, 1, 1, 1, 1, 1,
-1.495916, 0.7683241, -1.345925, 1, 1, 1, 1, 1,
-1.487669, -0.7461758, -2.702233, 1, 1, 1, 1, 1,
-1.466029, -0.9454956, -1.688351, 1, 1, 1, 1, 1,
-1.447245, 0.1177869, -1.651801, 1, 1, 1, 1, 1,
-1.437907, 1.221247, -1.15014, 1, 1, 1, 1, 1,
-1.436849, 1.107591, -1.448807, 1, 1, 1, 1, 1,
-1.416283, -0.4898723, -2.706319, 1, 1, 1, 1, 1,
-1.412511, -0.3236659, -1.385622, 1, 1, 1, 1, 1,
-1.408913, -0.8534369, -2.782612, 1, 1, 1, 1, 1,
-1.392819, 0.4011868, -1.503455, 1, 1, 1, 1, 1,
-1.383587, 0.1479593, -0.2117759, 1, 1, 1, 1, 1,
-1.377617, 0.8692465, -1.575189, 1, 1, 1, 1, 1,
-1.377598, 0.4208837, -1.420687, 1, 1, 1, 1, 1,
-1.372801, 0.1364215, -0.5900186, 0, 0, 1, 1, 1,
-1.364073, -0.867596, 0.1085886, 1, 0, 0, 1, 1,
-1.363498, 1.248813, -1.198705, 1, 0, 0, 1, 1,
-1.361378, 0.03775395, -0.6716093, 1, 0, 0, 1, 1,
-1.345232, -1.338599, -3.359698, 1, 0, 0, 1, 1,
-1.344265, 0.1230479, -2.338157, 1, 0, 0, 1, 1,
-1.334392, 0.7172355, -1.850701, 0, 0, 0, 1, 1,
-1.334017, -0.2966331, -0.8535913, 0, 0, 0, 1, 1,
-1.327988, -1.245986, -2.709949, 0, 0, 0, 1, 1,
-1.324574, -2.201147, -1.755844, 0, 0, 0, 1, 1,
-1.320558, 1.90626, -0.3781645, 0, 0, 0, 1, 1,
-1.30445, -1.751393, -3.951508, 0, 0, 0, 1, 1,
-1.303703, -1.403797, -2.56626, 0, 0, 0, 1, 1,
-1.30008, -0.9556544, -1.438023, 1, 1, 1, 1, 1,
-1.29798, -0.875522, -1.312584, 1, 1, 1, 1, 1,
-1.291311, -0.6072669, -1.319466, 1, 1, 1, 1, 1,
-1.284834, 0.9961446, 0.4420304, 1, 1, 1, 1, 1,
-1.280627, 2.174671, -0.206507, 1, 1, 1, 1, 1,
-1.277102, -0.1061872, -1.514005, 1, 1, 1, 1, 1,
-1.259866, 0.6538791, -2.606269, 1, 1, 1, 1, 1,
-1.253766, -0.1573653, -2.063564, 1, 1, 1, 1, 1,
-1.244833, 0.6200629, -1.037188, 1, 1, 1, 1, 1,
-1.244832, -0.9904195, -1.125329, 1, 1, 1, 1, 1,
-1.241408, -1.539922, -1.28607, 1, 1, 1, 1, 1,
-1.239021, 0.2801599, -1.447547, 1, 1, 1, 1, 1,
-1.224826, 2.729283, 1.160179, 1, 1, 1, 1, 1,
-1.21412, 2.4033, 0.1798326, 1, 1, 1, 1, 1,
-1.209628, 1.379647, -1.372416, 1, 1, 1, 1, 1,
-1.207598, 0.295943, -1.212565, 0, 0, 1, 1, 1,
-1.205994, -0.1687954, -1.900053, 1, 0, 0, 1, 1,
-1.204688, 2.096303, 0.6805463, 1, 0, 0, 1, 1,
-1.202602, 0.204906, -1.021403, 1, 0, 0, 1, 1,
-1.202419, -1.188948, -2.957823, 1, 0, 0, 1, 1,
-1.198459, 1.192954, -0.7007249, 1, 0, 0, 1, 1,
-1.187804, -0.4321672, -2.238398, 0, 0, 0, 1, 1,
-1.187433, 1.185387, 0.03873953, 0, 0, 0, 1, 1,
-1.185856, 0.7927954, 0.2246628, 0, 0, 0, 1, 1,
-1.182315, -0.01611993, -2.622537, 0, 0, 0, 1, 1,
-1.176991, 0.268424, -3.515814, 0, 0, 0, 1, 1,
-1.175583, -1.808598, -2.090829, 0, 0, 0, 1, 1,
-1.175525, 0.84826, -1.166978, 0, 0, 0, 1, 1,
-1.173635, -0.03175057, 0.6455399, 1, 1, 1, 1, 1,
-1.171675, 0.8423746, -0.8628336, 1, 1, 1, 1, 1,
-1.171382, -0.86453, -1.651679, 1, 1, 1, 1, 1,
-1.170591, 0.07874002, -0.6428472, 1, 1, 1, 1, 1,
-1.170549, 0.8799557, 0.1081311, 1, 1, 1, 1, 1,
-1.156124, -0.3151819, -1.577622, 1, 1, 1, 1, 1,
-1.140438, -0.8346267, -3.201117, 1, 1, 1, 1, 1,
-1.120395, 0.6820037, -0.8249084, 1, 1, 1, 1, 1,
-1.120276, -2.447568, -2.117145, 1, 1, 1, 1, 1,
-1.115462, -1.44876, -2.525269, 1, 1, 1, 1, 1,
-1.111307, 1.273613, -1.022913, 1, 1, 1, 1, 1,
-1.109237, 1.378918, -1.338289, 1, 1, 1, 1, 1,
-1.102696, -0.1760504, -0.723323, 1, 1, 1, 1, 1,
-1.093935, -0.7312971, -2.942113, 1, 1, 1, 1, 1,
-1.093531, 2.545433, -1.677666, 1, 1, 1, 1, 1,
-1.091404, 1.87452, -0.9692945, 0, 0, 1, 1, 1,
-1.089403, -1.464058, -1.815864, 1, 0, 0, 1, 1,
-1.086462, -0.2512419, -3.192185, 1, 0, 0, 1, 1,
-1.084307, -1.788055, -2.984004, 1, 0, 0, 1, 1,
-1.072422, -1.177046, -1.518655, 1, 0, 0, 1, 1,
-1.071282, -0.9031528, -1.913265, 1, 0, 0, 1, 1,
-1.069561, 1.373578, 0.6193376, 0, 0, 0, 1, 1,
-1.065804, -0.9175193, -1.34946, 0, 0, 0, 1, 1,
-1.064243, -0.499628, -1.401626, 0, 0, 0, 1, 1,
-1.053308, -0.2476349, -1.779353, 0, 0, 0, 1, 1,
-1.051916, -1.10338, -2.486948, 0, 0, 0, 1, 1,
-1.04799, 0.5648782, -0.711062, 0, 0, 0, 1, 1,
-1.045446, -1.039013, -2.657513, 0, 0, 0, 1, 1,
-1.041723, -0.5741318, -2.492187, 1, 1, 1, 1, 1,
-1.037453, 1.381407, -0.02397896, 1, 1, 1, 1, 1,
-1.031618, 0.864426, -0.4071431, 1, 1, 1, 1, 1,
-1.026546, -0.07168338, -2.376727, 1, 1, 1, 1, 1,
-1.012754, 1.909298, -0.612198, 1, 1, 1, 1, 1,
-1.009189, -1.021367, -1.864952, 1, 1, 1, 1, 1,
-1.005625, 2.07215, 0.2223348, 1, 1, 1, 1, 1,
-1.0004, -1.024585, -2.52675, 1, 1, 1, 1, 1,
-0.9914631, -1.759632, -3.380484, 1, 1, 1, 1, 1,
-0.9869961, 1.739884, -2.204137, 1, 1, 1, 1, 1,
-0.985092, 1.553802, -1.405608, 1, 1, 1, 1, 1,
-0.9821246, 0.3704406, 0.05462777, 1, 1, 1, 1, 1,
-0.979664, 1.126462, -2.336674, 1, 1, 1, 1, 1,
-0.9763587, 0.5784991, -0.1507348, 1, 1, 1, 1, 1,
-0.9757909, 1.189382, -2.284123, 1, 1, 1, 1, 1,
-0.9750304, -0.5709062, -2.688406, 0, 0, 1, 1, 1,
-0.9624698, 1.605026, -1.417062, 1, 0, 0, 1, 1,
-0.9573476, 0.4150182, -1.739729, 1, 0, 0, 1, 1,
-0.951727, -0.3959437, -2.375426, 1, 0, 0, 1, 1,
-0.9478151, 0.05974188, -0.3210309, 1, 0, 0, 1, 1,
-0.9452966, 0.6879704, -2.837729, 1, 0, 0, 1, 1,
-0.9385753, 1.614744, -2.054862, 0, 0, 0, 1, 1,
-0.9354758, 0.7468506, -0.1159706, 0, 0, 0, 1, 1,
-0.93347, -1.103286, -2.676019, 0, 0, 0, 1, 1,
-0.9295239, -0.5381552, -1.851002, 0, 0, 0, 1, 1,
-0.926024, 0.09021699, -1.693637, 0, 0, 0, 1, 1,
-0.9233158, 0.2209414, -1.597214, 0, 0, 0, 1, 1,
-0.9229814, -1.048197, -0.473652, 0, 0, 0, 1, 1,
-0.910933, 1.157594, -0.4334227, 1, 1, 1, 1, 1,
-0.907635, 0.1660046, -0.7929569, 1, 1, 1, 1, 1,
-0.9018277, 0.8985177, -0.3534801, 1, 1, 1, 1, 1,
-0.8986297, 0.1612423, -1.615171, 1, 1, 1, 1, 1,
-0.8976232, -0.2607502, -1.637287, 1, 1, 1, 1, 1,
-0.8965932, -1.485379, -1.98657, 1, 1, 1, 1, 1,
-0.8965233, 0.06704912, -2.90557, 1, 1, 1, 1, 1,
-0.8948237, -0.9659024, -0.75738, 1, 1, 1, 1, 1,
-0.8873281, -1.207298, -2.103124, 1, 1, 1, 1, 1,
-0.8834792, -1.098648, -3.066495, 1, 1, 1, 1, 1,
-0.8832805, 0.3181064, -0.0885445, 1, 1, 1, 1, 1,
-0.8787668, 0.9359257, -0.837403, 1, 1, 1, 1, 1,
-0.8768515, 0.9173218, -1.186458, 1, 1, 1, 1, 1,
-0.8734862, 0.7871572, -0.5504242, 1, 1, 1, 1, 1,
-0.8731269, 0.971024, -0.4501206, 1, 1, 1, 1, 1,
-0.872613, 0.4474356, -2.165656, 0, 0, 1, 1, 1,
-0.8724552, 1.556623, -3.453774, 1, 0, 0, 1, 1,
-0.8687635, -0.02501318, -2.35719, 1, 0, 0, 1, 1,
-0.8677816, 0.7726792, -1.829901, 1, 0, 0, 1, 1,
-0.8645115, 0.3164617, -1.276964, 1, 0, 0, 1, 1,
-0.8641595, -0.2813081, -2.593743, 1, 0, 0, 1, 1,
-0.8599567, 1.582466, 0.3351338, 0, 0, 0, 1, 1,
-0.8566856, 0.9222175, -0.8521886, 0, 0, 0, 1, 1,
-0.8565664, -0.7949685, -2.294141, 0, 0, 0, 1, 1,
-0.8564917, -0.4078073, -1.322998, 0, 0, 0, 1, 1,
-0.8547834, -0.3018051, -2.034104, 0, 0, 0, 1, 1,
-0.8516853, -1.464658, -1.08559, 0, 0, 0, 1, 1,
-0.8408272, 0.3739429, -0.838406, 0, 0, 0, 1, 1,
-0.8291805, 1.28008, -0.3902195, 1, 1, 1, 1, 1,
-0.8175561, -0.6909204, -2.734749, 1, 1, 1, 1, 1,
-0.8170016, -1.803154, -2.599475, 1, 1, 1, 1, 1,
-0.8137562, -0.8199617, -2.476787, 1, 1, 1, 1, 1,
-0.8116113, -0.1844437, -0.7592139, 1, 1, 1, 1, 1,
-0.8113695, 0.1037923, -3.015265, 1, 1, 1, 1, 1,
-0.8061285, 0.6947941, -0.4514661, 1, 1, 1, 1, 1,
-0.805178, -0.02531198, -1.507917, 1, 1, 1, 1, 1,
-0.7985894, -0.7675595, -2.654906, 1, 1, 1, 1, 1,
-0.7985794, -0.6773903, -2.666686, 1, 1, 1, 1, 1,
-0.7984941, -1.103036, -2.647437, 1, 1, 1, 1, 1,
-0.7887269, -3.484581, -3.123242, 1, 1, 1, 1, 1,
-0.7847296, 1.229117, 0.6050314, 1, 1, 1, 1, 1,
-0.7763681, 0.2178413, 1.063803, 1, 1, 1, 1, 1,
-0.7734138, -0.9068413, -2.64803, 1, 1, 1, 1, 1,
-0.7721993, 0.01806954, -1.163522, 0, 0, 1, 1, 1,
-0.7652101, -0.9841257, -0.1114235, 1, 0, 0, 1, 1,
-0.7637866, 0.9813139, -2.855904, 1, 0, 0, 1, 1,
-0.7608496, 2.248762, -0.3491936, 1, 0, 0, 1, 1,
-0.7604719, -1.527115, -4.032704, 1, 0, 0, 1, 1,
-0.7591828, -2.25198, -2.865248, 1, 0, 0, 1, 1,
-0.7568071, -0.7877672, -2.583905, 0, 0, 0, 1, 1,
-0.7554995, 0.8051201, 1.001919, 0, 0, 0, 1, 1,
-0.7492302, 0.5407577, -1.170282, 0, 0, 0, 1, 1,
-0.7459767, 0.06686333, -1.62392, 0, 0, 0, 1, 1,
-0.7402815, -1.606203, -0.9337767, 0, 0, 0, 1, 1,
-0.7372802, 0.2483617, -1.175893, 0, 0, 0, 1, 1,
-0.7296742, 0.5338751, 0.8444992, 0, 0, 0, 1, 1,
-0.7258952, 0.3536959, -1.843466, 1, 1, 1, 1, 1,
-0.7253878, 0.2676084, -2.182975, 1, 1, 1, 1, 1,
-0.7229816, 1.203933, -0.9720697, 1, 1, 1, 1, 1,
-0.7187726, 0.002193962, 0.1562509, 1, 1, 1, 1, 1,
-0.7147209, 0.5872737, 0.2022158, 1, 1, 1, 1, 1,
-0.7071711, 0.3836187, -1.193742, 1, 1, 1, 1, 1,
-0.7041391, 0.8970188, -2.263411, 1, 1, 1, 1, 1,
-0.7024352, 0.7332605, -0.4625229, 1, 1, 1, 1, 1,
-0.6990759, 0.8401672, -2.177207, 1, 1, 1, 1, 1,
-0.6949819, -0.2742572, -0.7698703, 1, 1, 1, 1, 1,
-0.6946145, 1.903339, -0.6239574, 1, 1, 1, 1, 1,
-0.6923705, 0.4897408, -1.119341, 1, 1, 1, 1, 1,
-0.6896034, 0.9460841, 0.9240199, 1, 1, 1, 1, 1,
-0.6842982, -2.486751, -3.190318, 1, 1, 1, 1, 1,
-0.6812369, 0.4526143, -2.048257, 1, 1, 1, 1, 1,
-0.6798114, -2.473221, -3.727946, 0, 0, 1, 1, 1,
-0.6774077, 0.2181105, -1.68161, 1, 0, 0, 1, 1,
-0.6759677, 0.9132589, -1.667461, 1, 0, 0, 1, 1,
-0.6747363, -0.06306426, -0.1629951, 1, 0, 0, 1, 1,
-0.6639214, 0.3483472, -2.49764, 1, 0, 0, 1, 1,
-0.6634467, -0.7922607, -3.542642, 1, 0, 0, 1, 1,
-0.663312, 1.106439, -1.020814, 0, 0, 0, 1, 1,
-0.6620837, -0.2986166, -1.969915, 0, 0, 0, 1, 1,
-0.6614779, 1.108086, 0.02526685, 0, 0, 0, 1, 1,
-0.6597053, -0.2655824, -3.099346, 0, 0, 0, 1, 1,
-0.6573307, -0.1742027, -3.208691, 0, 0, 0, 1, 1,
-0.6555162, 2.248269, -2.01002, 0, 0, 0, 1, 1,
-0.6521093, 1.215951, -1.688051, 0, 0, 0, 1, 1,
-0.6518285, -1.62971, -3.391034, 1, 1, 1, 1, 1,
-0.6509096, 0.01791113, -2.215384, 1, 1, 1, 1, 1,
-0.6461402, 0.2758809, -0.07274865, 1, 1, 1, 1, 1,
-0.6449484, -0.3561807, -1.761697, 1, 1, 1, 1, 1,
-0.6439524, 0.3662159, -2.408062, 1, 1, 1, 1, 1,
-0.6421771, -0.6800714, -4.021876, 1, 1, 1, 1, 1,
-0.6413565, 1.39071, -0.6953033, 1, 1, 1, 1, 1,
-0.637877, 0.5239248, -0.7262838, 1, 1, 1, 1, 1,
-0.6346694, -0.03902315, -2.414282, 1, 1, 1, 1, 1,
-0.6345569, 1.30997, -2.474885, 1, 1, 1, 1, 1,
-0.6328222, -0.3641011, -3.720225, 1, 1, 1, 1, 1,
-0.6314355, 1.639407, -0.2957637, 1, 1, 1, 1, 1,
-0.6309935, 0.2160893, -1.668615, 1, 1, 1, 1, 1,
-0.6303558, -0.3073795, -2.565369, 1, 1, 1, 1, 1,
-0.6292589, 0.5163341, -0.9784147, 1, 1, 1, 1, 1,
-0.6183335, 0.6603121, -1.527179, 0, 0, 1, 1, 1,
-0.6180544, 0.64012, -0.8672495, 1, 0, 0, 1, 1,
-0.6143772, 0.2073135, -3.722406, 1, 0, 0, 1, 1,
-0.5936741, 0.2791472, -2.606895, 1, 0, 0, 1, 1,
-0.5930757, 1.916951, 1.67781, 1, 0, 0, 1, 1,
-0.592858, 0.8176714, -0.0801651, 1, 0, 0, 1, 1,
-0.5911862, -0.06267197, -2.03451, 0, 0, 0, 1, 1,
-0.5848312, 0.05115641, -1.69456, 0, 0, 0, 1, 1,
-0.5788666, -1.169489, -4.542204, 0, 0, 0, 1, 1,
-0.5769089, 0.6583637, -1.432252, 0, 0, 0, 1, 1,
-0.5651646, -1.130444, -2.115919, 0, 0, 0, 1, 1,
-0.5648594, -0.2763459, -2.21657, 0, 0, 0, 1, 1,
-0.5583572, 0.03893844, -3.380591, 0, 0, 0, 1, 1,
-0.5423634, 0.8450595, -2.636267, 1, 1, 1, 1, 1,
-0.5349082, 1.639998, -0.2107842, 1, 1, 1, 1, 1,
-0.5321231, -0.5585964, -1.417171, 1, 1, 1, 1, 1,
-0.5300538, 0.7027696, 0.5819391, 1, 1, 1, 1, 1,
-0.5276401, 1.244698, -0.8447732, 1, 1, 1, 1, 1,
-0.5171545, 0.390628, -1.764289, 1, 1, 1, 1, 1,
-0.5155631, -1.065148, -1.652705, 1, 1, 1, 1, 1,
-0.5144606, -0.06685974, -3.604832, 1, 1, 1, 1, 1,
-0.5057788, 0.2105683, -2.346218, 1, 1, 1, 1, 1,
-0.5040846, 1.295312, -1.219018, 1, 1, 1, 1, 1,
-0.5032711, -0.02493016, -1.365023, 1, 1, 1, 1, 1,
-0.5017742, 0.3430748, 0.5793614, 1, 1, 1, 1, 1,
-0.5016184, -0.7784642, -0.9994687, 1, 1, 1, 1, 1,
-0.4961665, 2.110734, 2.015134, 1, 1, 1, 1, 1,
-0.4937466, 0.5908028, -0.4998231, 1, 1, 1, 1, 1,
-0.4934328, -1.34153, -2.109557, 0, 0, 1, 1, 1,
-0.4905424, 0.2121006, -0.5381622, 1, 0, 0, 1, 1,
-0.4862258, -0.9621983, -3.189068, 1, 0, 0, 1, 1,
-0.4856707, -1.584404, -3.196644, 1, 0, 0, 1, 1,
-0.4850221, -0.3018458, -1.585266, 1, 0, 0, 1, 1,
-0.4848558, 1.905303, 0.3479629, 1, 0, 0, 1, 1,
-0.4816848, -0.6065778, -0.49764, 0, 0, 0, 1, 1,
-0.4759159, -0.9524711, -2.202656, 0, 0, 0, 1, 1,
-0.4726244, -0.114008, -1.919536, 0, 0, 0, 1, 1,
-0.4722354, 1.181527, -0.1413318, 0, 0, 0, 1, 1,
-0.4703088, -0.4426567, -2.608651, 0, 0, 0, 1, 1,
-0.4677121, -0.7465499, -2.346219, 0, 0, 0, 1, 1,
-0.4663884, -0.8439215, -2.359008, 0, 0, 0, 1, 1,
-0.4619076, 0.3493556, -2.503993, 1, 1, 1, 1, 1,
-0.4588635, 0.3740147, -2.191239, 1, 1, 1, 1, 1,
-0.458284, -0.1407792, -1.840919, 1, 1, 1, 1, 1,
-0.4548052, 0.3998359, -0.6277218, 1, 1, 1, 1, 1,
-0.4529595, -0.001725939, -1.832366, 1, 1, 1, 1, 1,
-0.4521784, 0.7019464, -1.009718, 1, 1, 1, 1, 1,
-0.4518625, 1.120262, -0.5879981, 1, 1, 1, 1, 1,
-0.4500806, -0.02854273, -0.4250943, 1, 1, 1, 1, 1,
-0.4484315, 0.7216253, 0.8494422, 1, 1, 1, 1, 1,
-0.4482574, -0.5344993, -2.009082, 1, 1, 1, 1, 1,
-0.4376596, -0.9464849, -1.201971, 1, 1, 1, 1, 1,
-0.4365033, 0.63682, -0.8486391, 1, 1, 1, 1, 1,
-0.4361561, -0.7128669, -2.761805, 1, 1, 1, 1, 1,
-0.4315824, -1.293275, -2.171273, 1, 1, 1, 1, 1,
-0.4296, -0.3867316, -1.157686, 1, 1, 1, 1, 1,
-0.4249832, -2.23506, -2.205587, 0, 0, 1, 1, 1,
-0.423748, 0.7794998, -0.2975579, 1, 0, 0, 1, 1,
-0.4226299, 1.733552, 1.812326, 1, 0, 0, 1, 1,
-0.4193603, 0.8226765, -0.2400969, 1, 0, 0, 1, 1,
-0.4155728, -2.66448, -3.143411, 1, 0, 0, 1, 1,
-0.4152835, -0.5214582, -2.910475, 1, 0, 0, 1, 1,
-0.4142481, 1.58169, 1.333253, 0, 0, 0, 1, 1,
-0.4102724, 1.499811, -0.6619358, 0, 0, 0, 1, 1,
-0.4090017, 1.271078, -1.136189, 0, 0, 0, 1, 1,
-0.4089968, 0.851836, -1.628068, 0, 0, 0, 1, 1,
-0.3997446, -0.4183964, -1.820397, 0, 0, 0, 1, 1,
-0.3993118, -0.6944547, -1.256087, 0, 0, 0, 1, 1,
-0.3958539, -0.1765659, -2.472826, 0, 0, 0, 1, 1,
-0.3916104, -1.303417, -4.27707, 1, 1, 1, 1, 1,
-0.3902026, -2.01406, -4.610684, 1, 1, 1, 1, 1,
-0.3882195, -0.3182896, -2.986614, 1, 1, 1, 1, 1,
-0.3851167, -1.406239, -4.811195, 1, 1, 1, 1, 1,
-0.3831191, -0.02647372, -1.71816, 1, 1, 1, 1, 1,
-0.3831065, 0.1832756, -1.421679, 1, 1, 1, 1, 1,
-0.3770598, 0.4161114, 0.5117595, 1, 1, 1, 1, 1,
-0.3744585, -0.3861493, -2.797094, 1, 1, 1, 1, 1,
-0.3724481, 1.409677, -0.1556908, 1, 1, 1, 1, 1,
-0.3722383, -0.6484089, -3.31423, 1, 1, 1, 1, 1,
-0.3722073, 0.1665629, -0.8415203, 1, 1, 1, 1, 1,
-0.3699139, 1.118238, -1.27925, 1, 1, 1, 1, 1,
-0.3664856, 0.4082981, -0.7227207, 1, 1, 1, 1, 1,
-0.3639292, -0.8183803, -2.494118, 1, 1, 1, 1, 1,
-0.3572824, 2.062747, 1.32999, 1, 1, 1, 1, 1,
-0.3569176, 1.239916, 0.5004519, 0, 0, 1, 1, 1,
-0.3512495, 0.3354775, -0.1019447, 1, 0, 0, 1, 1,
-0.3504719, 0.2264756, 0.1082018, 1, 0, 0, 1, 1,
-0.347679, 0.7736841, -0.996268, 1, 0, 0, 1, 1,
-0.3471428, 1.929212, 0.4688714, 1, 0, 0, 1, 1,
-0.3465876, -0.4732646, -2.089461, 1, 0, 0, 1, 1,
-0.3422742, -0.01320133, -1.230239, 0, 0, 0, 1, 1,
-0.3400388, -0.8184535, -2.436867, 0, 0, 0, 1, 1,
-0.3345965, 0.3943996, 0.1417668, 0, 0, 0, 1, 1,
-0.3330845, -1.108662, -3.695952, 0, 0, 0, 1, 1,
-0.3305791, -0.09034446, -2.09426, 0, 0, 0, 1, 1,
-0.3298482, 1.627831, 0.681997, 0, 0, 0, 1, 1,
-0.3291178, 0.9315199, 0.9790922, 0, 0, 0, 1, 1,
-0.3284159, 0.1724442, -0.3470463, 1, 1, 1, 1, 1,
-0.3186762, 0.477149, -1.81441, 1, 1, 1, 1, 1,
-0.3131714, 2.078616, -0.750568, 1, 1, 1, 1, 1,
-0.3074529, -0.2081465, 0.424896, 1, 1, 1, 1, 1,
-0.3052432, 1.787495, 0.5435081, 1, 1, 1, 1, 1,
-0.304072, -1.155872, -3.753807, 1, 1, 1, 1, 1,
-0.3012154, -0.2171429, -1.879553, 1, 1, 1, 1, 1,
-0.3009218, -0.7159685, -1.985553, 1, 1, 1, 1, 1,
-0.29919, -0.32152, -2.646646, 1, 1, 1, 1, 1,
-0.2982072, -1.822441, -1.684359, 1, 1, 1, 1, 1,
-0.2972574, 0.4041905, 0.1799369, 1, 1, 1, 1, 1,
-0.2931495, -0.8313158, -3.259851, 1, 1, 1, 1, 1,
-0.2929714, -1.351753, -3.552295, 1, 1, 1, 1, 1,
-0.2845984, 0.1523328, -0.2463993, 1, 1, 1, 1, 1,
-0.2832074, 1.136518, 0.1137393, 1, 1, 1, 1, 1,
-0.2821352, -0.8010097, -3.462323, 0, 0, 1, 1, 1,
-0.2757877, -1.191644, -3.591546, 1, 0, 0, 1, 1,
-0.2752991, 0.6726398, -1.594809, 1, 0, 0, 1, 1,
-0.2656537, -0.3361692, -4.833221, 1, 0, 0, 1, 1,
-0.261827, 0.813643, 0.5682397, 1, 0, 0, 1, 1,
-0.2610413, -0.2842901, -1.496635, 1, 0, 0, 1, 1,
-0.260595, 0.3004808, -1.01012, 0, 0, 0, 1, 1,
-0.2580224, -1.510974, -1.360252, 0, 0, 0, 1, 1,
-0.2498475, -0.3714063, -2.73985, 0, 0, 0, 1, 1,
-0.2442645, 0.4450955, -0.7752678, 0, 0, 0, 1, 1,
-0.2395128, 0.1108871, -1.409592, 0, 0, 0, 1, 1,
-0.2389665, 1.513412, 0.7824658, 0, 0, 0, 1, 1,
-0.2325282, -0.1825844, -2.607889, 0, 0, 0, 1, 1,
-0.2306403, -0.389909, -2.677228, 1, 1, 1, 1, 1,
-0.2224756, -0.1058413, -1.037139, 1, 1, 1, 1, 1,
-0.2198578, 0.4456499, -0.1626146, 1, 1, 1, 1, 1,
-0.2187459, -0.3451265, -3.201795, 1, 1, 1, 1, 1,
-0.2163897, -0.6465597, -3.221765, 1, 1, 1, 1, 1,
-0.2152763, -0.5674322, -3.500433, 1, 1, 1, 1, 1,
-0.2122486, 1.569845, 1.257712, 1, 1, 1, 1, 1,
-0.2115284, -0.343479, -2.015032, 1, 1, 1, 1, 1,
-0.2041784, -0.7825749, -2.13307, 1, 1, 1, 1, 1,
-0.2027623, 0.4663929, -0.9379, 1, 1, 1, 1, 1,
-0.2017493, 0.127591, -2.383028, 1, 1, 1, 1, 1,
-0.2011834, 1.312548, -0.483243, 1, 1, 1, 1, 1,
-0.1975048, -0.6427157, -4.247036, 1, 1, 1, 1, 1,
-0.1900147, -1.358097, -4.240937, 1, 1, 1, 1, 1,
-0.1894455, 1.216372, 0.8874662, 1, 1, 1, 1, 1,
-0.1868284, 0.01084606, -1.354911, 0, 0, 1, 1, 1,
-0.1857228, -0.2191775, -2.927298, 1, 0, 0, 1, 1,
-0.1829758, -1.163803, -4.079679, 1, 0, 0, 1, 1,
-0.1807187, -1.33922, -2.689122, 1, 0, 0, 1, 1,
-0.1766615, 1.098696, 1.105425, 1, 0, 0, 1, 1,
-0.173824, 0.8951511, -0.4378709, 1, 0, 0, 1, 1,
-0.1721172, -0.8535774, -3.512483, 0, 0, 0, 1, 1,
-0.1686295, -1.406437, -1.553936, 0, 0, 0, 1, 1,
-0.1670505, -1.307182, -2.45333, 0, 0, 0, 1, 1,
-0.1648885, 0.4026738, 1.022296, 0, 0, 0, 1, 1,
-0.1627605, 0.3987196, 1.491821, 0, 0, 0, 1, 1,
-0.1601019, -1.915202, -1.905936, 0, 0, 0, 1, 1,
-0.1592055, -2.838735, -3.152269, 0, 0, 0, 1, 1,
-0.1560493, 0.6131844, 1.186326, 1, 1, 1, 1, 1,
-0.1556004, 1.166719, 0.01056071, 1, 1, 1, 1, 1,
-0.1555549, -0.889134, -3.657916, 1, 1, 1, 1, 1,
-0.1526283, -0.5726765, -2.198842, 1, 1, 1, 1, 1,
-0.1491943, 1.202688, -1.429327, 1, 1, 1, 1, 1,
-0.1418525, -0.5777802, -3.680672, 1, 1, 1, 1, 1,
-0.1405929, -0.2428884, -4.814831, 1, 1, 1, 1, 1,
-0.1334222, -0.8463709, -4.608422, 1, 1, 1, 1, 1,
-0.1329841, -1.010164, -2.758534, 1, 1, 1, 1, 1,
-0.1324719, 0.8155231, -3.943083, 1, 1, 1, 1, 1,
-0.1294944, 0.1311199, -1.770399, 1, 1, 1, 1, 1,
-0.1284078, 0.8310287, -1.31689, 1, 1, 1, 1, 1,
-0.1283811, 0.144837, -0.8870478, 1, 1, 1, 1, 1,
-0.1247089, 0.9665747, -0.7677313, 1, 1, 1, 1, 1,
-0.1243337, -1.079229, -3.526426, 1, 1, 1, 1, 1,
-0.1229134, 0.1186769, -0.9213096, 0, 0, 1, 1, 1,
-0.122393, -0.0408111, -2.099988, 1, 0, 0, 1, 1,
-0.1191162, 0.4812932, 1.051457, 1, 0, 0, 1, 1,
-0.1171492, 0.4045077, 3.043364, 1, 0, 0, 1, 1,
-0.1171479, -0.9785524, -3.686955, 1, 0, 0, 1, 1,
-0.1155196, 0.9130723, 0.986378, 1, 0, 0, 1, 1,
-0.1054016, 0.6782818, -1.394045, 0, 0, 0, 1, 1,
-0.1052017, -0.895166, -4.226992, 0, 0, 0, 1, 1,
-0.1045023, 1.015188, 0.1197186, 0, 0, 0, 1, 1,
-0.104482, -0.5654188, -3.891816, 0, 0, 0, 1, 1,
-0.1015512, -0.6479428, -3.844132, 0, 0, 0, 1, 1,
-0.09960478, -1.73737, -2.087612, 0, 0, 0, 1, 1,
-0.09909289, 0.744278, 1.018317, 0, 0, 0, 1, 1,
-0.09088494, -1.353821, -3.613299, 1, 1, 1, 1, 1,
-0.09084667, 0.6587303, -0.6784113, 1, 1, 1, 1, 1,
-0.08455018, -0.3993226, -3.421099, 1, 1, 1, 1, 1,
-0.08356927, -2.23966, -2.76048, 1, 1, 1, 1, 1,
-0.08202875, 0.8428011, 0.6071165, 1, 1, 1, 1, 1,
-0.0806388, -0.5840294, -4.062718, 1, 1, 1, 1, 1,
-0.07997369, -0.1291245, -1.951864, 1, 1, 1, 1, 1,
-0.07581097, 0.3261483, -0.3184138, 1, 1, 1, 1, 1,
-0.07524843, -1.216057, -4.263916, 1, 1, 1, 1, 1,
-0.07316045, -1.387636, -2.738832, 1, 1, 1, 1, 1,
-0.0649904, 0.1763287, -0.3929593, 1, 1, 1, 1, 1,
-0.06491689, -1.218717, -3.047305, 1, 1, 1, 1, 1,
-0.06255471, -1.426054, -3.34147, 1, 1, 1, 1, 1,
-0.06222701, 0.2011634, -1.615864, 1, 1, 1, 1, 1,
-0.06167237, 0.750887, -0.9524522, 1, 1, 1, 1, 1,
-0.05818005, 0.6591295, -1.453377, 0, 0, 1, 1, 1,
-0.05719959, 0.9388816, -0.5225084, 1, 0, 0, 1, 1,
-0.05696987, -1.606556, -3.894502, 1, 0, 0, 1, 1,
-0.05582361, 1.726539, 1.150696, 1, 0, 0, 1, 1,
-0.0553316, -0.2099688, -3.756112, 1, 0, 0, 1, 1,
-0.0530934, -0.234657, -3.105535, 1, 0, 0, 1, 1,
-0.04732046, 0.3222234, 1.272872, 0, 0, 0, 1, 1,
-0.04364889, -0.07563002, -1.387239, 0, 0, 0, 1, 1,
-0.04316955, -0.2981666, -3.284093, 0, 0, 0, 1, 1,
-0.03904412, 0.02665016, -2.281451, 0, 0, 0, 1, 1,
-0.03894443, -1.965463, -2.999527, 0, 0, 0, 1, 1,
-0.0297245, 1.528529, 0.1189239, 0, 0, 0, 1, 1,
-0.02859811, -0.7846516, -3.394306, 0, 0, 0, 1, 1,
-0.02388032, 1.329471, -0.4834041, 1, 1, 1, 1, 1,
-0.02365116, 0.7937943, -0.5371524, 1, 1, 1, 1, 1,
-0.02176188, 0.2144709, -2.291187, 1, 1, 1, 1, 1,
-0.01844699, -1.574728, -3.573086, 1, 1, 1, 1, 1,
-0.01587046, 0.1511952, 1.161948, 1, 1, 1, 1, 1,
-0.01064949, -2.667239, -4.988235, 1, 1, 1, 1, 1,
-0.005739524, 0.2653129, -0.6569518, 1, 1, 1, 1, 1,
0.0007778413, 0.2699523, -1.307673, 1, 1, 1, 1, 1,
0.001066934, -0.9379796, 1.623902, 1, 1, 1, 1, 1,
0.001761783, -0.4540004, 2.559615, 1, 1, 1, 1, 1,
0.001797708, 0.2401027, 0.6982787, 1, 1, 1, 1, 1,
0.003364879, 0.7680029, 0.2569948, 1, 1, 1, 1, 1,
0.007196602, -1.060644, 0.7875826, 1, 1, 1, 1, 1,
0.01219905, -0.03954364, 4.946585, 1, 1, 1, 1, 1,
0.01627422, 0.3986485, 1.063829, 1, 1, 1, 1, 1,
0.01702444, 1.00538, -0.1693946, 0, 0, 1, 1, 1,
0.01811583, 2.488105, -0.4649816, 1, 0, 0, 1, 1,
0.02001041, 1.479828, -0.594825, 1, 0, 0, 1, 1,
0.02538545, 0.3075009, -0.4236197, 1, 0, 0, 1, 1,
0.02737532, -1.732224, 3.093456, 1, 0, 0, 1, 1,
0.03943176, -1.427094, 4.040904, 1, 0, 0, 1, 1,
0.04005497, -0.04650602, 2.070416, 0, 0, 0, 1, 1,
0.0413699, 1.689293, -0.3638614, 0, 0, 0, 1, 1,
0.04150902, 0.100705, 0.696914, 0, 0, 0, 1, 1,
0.04380219, 0.7516373, 0.5020584, 0, 0, 0, 1, 1,
0.04467251, 0.5937583, -0.6096201, 0, 0, 0, 1, 1,
0.04644508, -0.3718644, 4.041969, 0, 0, 0, 1, 1,
0.04650163, -0.2760913, 4.393868, 0, 0, 0, 1, 1,
0.05200258, -0.2592542, 3.688497, 1, 1, 1, 1, 1,
0.05669836, -0.5875008, 1.875451, 1, 1, 1, 1, 1,
0.06206624, 0.6910691, -0.2431444, 1, 1, 1, 1, 1,
0.06546741, 0.312628, -0.1572724, 1, 1, 1, 1, 1,
0.06570134, -0.6254952, 1.076601, 1, 1, 1, 1, 1,
0.06714647, -0.4633156, 1.365415, 1, 1, 1, 1, 1,
0.07030831, -0.2382281, 2.249628, 1, 1, 1, 1, 1,
0.07230676, -2.072378, 2.256297, 1, 1, 1, 1, 1,
0.07467608, 0.8837053, -0.1742224, 1, 1, 1, 1, 1,
0.08156931, 0.6672222, 1.225505, 1, 1, 1, 1, 1,
0.08400439, -1.265801, 2.987219, 1, 1, 1, 1, 1,
0.08419804, -1.379689, 3.224615, 1, 1, 1, 1, 1,
0.08562801, 0.04289971, 1.857109, 1, 1, 1, 1, 1,
0.08607313, -0.5640225, 2.949793, 1, 1, 1, 1, 1,
0.08965763, -0.3043402, 1.828524, 1, 1, 1, 1, 1,
0.09249192, 0.3316026, 1.313597, 0, 0, 1, 1, 1,
0.09637182, 0.7211223, -2.832729, 1, 0, 0, 1, 1,
0.09999759, -0.8281206, 2.800012, 1, 0, 0, 1, 1,
0.1006364, 1.412496, 0.3774389, 1, 0, 0, 1, 1,
0.1030222, 0.247345, 0.4622749, 1, 0, 0, 1, 1,
0.1055946, 1.307053, 1.294149, 1, 0, 0, 1, 1,
0.1096328, -1.347919, 4.36079, 0, 0, 0, 1, 1,
0.1111225, 2.154395, -2.057299, 0, 0, 0, 1, 1,
0.1134942, 0.5933636, -0.5150185, 0, 0, 0, 1, 1,
0.1146395, 1.211169, -0.5862044, 0, 0, 0, 1, 1,
0.1161374, -0.3489125, 2.604597, 0, 0, 0, 1, 1,
0.1202442, 0.1991548, -0.2836221, 0, 0, 0, 1, 1,
0.1240855, -0.4919811, 1.926112, 0, 0, 0, 1, 1,
0.1263655, -2.591921, 2.722705, 1, 1, 1, 1, 1,
0.1271638, -1.634125, 2.748061, 1, 1, 1, 1, 1,
0.1281205, -0.2937849, 2.697445, 1, 1, 1, 1, 1,
0.1284588, 0.1034206, 0.9411376, 1, 1, 1, 1, 1,
0.1310617, -0.4343326, 3.376409, 1, 1, 1, 1, 1,
0.1336085, 0.1808173, 0.6934721, 1, 1, 1, 1, 1,
0.1350876, 0.5052737, 2.742635, 1, 1, 1, 1, 1,
0.1355367, 0.61343, 1.092092, 1, 1, 1, 1, 1,
0.1381368, -1.625095, 3.068347, 1, 1, 1, 1, 1,
0.1385277, 0.3057368, 1.878275, 1, 1, 1, 1, 1,
0.1419889, -2.932953, 3.091457, 1, 1, 1, 1, 1,
0.1432496, 0.3140917, 1.204327, 1, 1, 1, 1, 1,
0.1470955, 1.269212, -0.6970532, 1, 1, 1, 1, 1,
0.1479486, -0.5704427, 2.928721, 1, 1, 1, 1, 1,
0.152669, -0.6042398, 3.422388, 1, 1, 1, 1, 1,
0.1586964, 1.100799, -0.3387129, 0, 0, 1, 1, 1,
0.1589459, -0.1288839, 2.393963, 1, 0, 0, 1, 1,
0.1601929, -0.2188727, 3.144824, 1, 0, 0, 1, 1,
0.1616999, 0.2086314, 2.135072, 1, 0, 0, 1, 1,
0.1648529, -1.267423, 3.387644, 1, 0, 0, 1, 1,
0.1651328, -0.6495997, 3.862412, 1, 0, 0, 1, 1,
0.1694045, -0.0999587, 1.562479, 0, 0, 0, 1, 1,
0.1704047, 0.5924108, 0.3729041, 0, 0, 0, 1, 1,
0.1722346, -0.1181145, 2.51914, 0, 0, 0, 1, 1,
0.1797452, 0.6149876, 0.6423552, 0, 0, 0, 1, 1,
0.183701, 1.208141, 1.343273, 0, 0, 0, 1, 1,
0.1854391, 0.1844086, 0.4078482, 0, 0, 0, 1, 1,
0.1855784, -1.102659, 3.76813, 0, 0, 0, 1, 1,
0.1886649, -1.508997, 2.588697, 1, 1, 1, 1, 1,
0.1893273, -0.2951673, 1.308134, 1, 1, 1, 1, 1,
0.1898199, -0.3220823, 2.849145, 1, 1, 1, 1, 1,
0.1910434, -1.561073, 2.560812, 1, 1, 1, 1, 1,
0.1924436, -2.155437, 3.61249, 1, 1, 1, 1, 1,
0.197724, -1.106454, 3.885576, 1, 1, 1, 1, 1,
0.1993403, -2.089793, 5.264735, 1, 1, 1, 1, 1,
0.1993851, -1.333511, 2.507972, 1, 1, 1, 1, 1,
0.2004092, 2.847018, 0.8082841, 1, 1, 1, 1, 1,
0.2010232, 0.4504919, -0.1006695, 1, 1, 1, 1, 1,
0.2019064, -1.000051, 2.821379, 1, 1, 1, 1, 1,
0.2060495, -1.085037, 2.62766, 1, 1, 1, 1, 1,
0.2063069, -1.911538, 2.887908, 1, 1, 1, 1, 1,
0.2081337, 1.101853, 0.3276676, 1, 1, 1, 1, 1,
0.2102066, 0.855359, 0.8874373, 1, 1, 1, 1, 1,
0.2105799, 0.5991173, 2.675437, 0, 0, 1, 1, 1,
0.2116804, -0.06545421, 1.458809, 1, 0, 0, 1, 1,
0.215521, -0.09988921, 0.4021553, 1, 0, 0, 1, 1,
0.2169406, -0.20175, 1.704038, 1, 0, 0, 1, 1,
0.2256177, -0.2585345, 3.30175, 1, 0, 0, 1, 1,
0.2257004, -0.3325087, 2.035472, 1, 0, 0, 1, 1,
0.2269981, 0.3116108, -0.2266708, 0, 0, 0, 1, 1,
0.2285831, -0.610636, 1.614005, 0, 0, 0, 1, 1,
0.2291654, 1.036437, 0.5178477, 0, 0, 0, 1, 1,
0.2295633, 1.268019, 0.257874, 0, 0, 0, 1, 1,
0.2311572, 0.0740886, 1.559899, 0, 0, 0, 1, 1,
0.2321681, 1.048147, 0.7612419, 0, 0, 0, 1, 1,
0.2434762, 0.8855725, 0.03390228, 0, 0, 0, 1, 1,
0.2461956, -0.8403134, 2.564433, 1, 1, 1, 1, 1,
0.2493258, -0.7912072, 0.7075404, 1, 1, 1, 1, 1,
0.2510692, 0.4475389, 2.13452, 1, 1, 1, 1, 1,
0.2519352, -1.594218, 1.71892, 1, 1, 1, 1, 1,
0.2548353, 0.8149261, 1.111795, 1, 1, 1, 1, 1,
0.2603861, -0.6373169, 3.00357, 1, 1, 1, 1, 1,
0.2623039, 0.08003095, 1.878888, 1, 1, 1, 1, 1,
0.2635757, -1.534691, 3.011414, 1, 1, 1, 1, 1,
0.2666672, 0.4303867, 0.1005776, 1, 1, 1, 1, 1,
0.2696157, -2.19337, 1.672829, 1, 1, 1, 1, 1,
0.2746783, -1.347272, 3.884517, 1, 1, 1, 1, 1,
0.2749758, -0.2582094, 0.8356422, 1, 1, 1, 1, 1,
0.2775742, 1.043785, 2.296681, 1, 1, 1, 1, 1,
0.282181, -3.499901, 2.212323, 1, 1, 1, 1, 1,
0.2842634, 1.727595, 0.3557805, 1, 1, 1, 1, 1,
0.2964377, -1.748274, 3.563225, 0, 0, 1, 1, 1,
0.299022, 0.7904152, -0.8088149, 1, 0, 0, 1, 1,
0.3073978, 0.1918919, 2.350253, 1, 0, 0, 1, 1,
0.3074115, 0.2983626, -0.1476417, 1, 0, 0, 1, 1,
0.3104881, -0.1088316, 1.674716, 1, 0, 0, 1, 1,
0.3113773, 0.1200482, 0.5717632, 1, 0, 0, 1, 1,
0.3130449, -0.6357827, 0.971831, 0, 0, 0, 1, 1,
0.3152794, -0.4159177, 3.599809, 0, 0, 0, 1, 1,
0.3153763, -1.135685, 3.740217, 0, 0, 0, 1, 1,
0.3234988, -0.6432237, 2.699654, 0, 0, 0, 1, 1,
0.3247487, 0.1738876, 1.373276, 0, 0, 0, 1, 1,
0.326638, -1.158866, 2.275352, 0, 0, 0, 1, 1,
0.327408, -0.0775653, 0.8519388, 0, 0, 0, 1, 1,
0.3284398, 1.544251, 0.9609043, 1, 1, 1, 1, 1,
0.3288815, -1.591115, 3.603214, 1, 1, 1, 1, 1,
0.33394, 0.598121, 0.9865838, 1, 1, 1, 1, 1,
0.3356777, -0.9660892, 3.905472, 1, 1, 1, 1, 1,
0.3377271, 0.1087355, 1.240294, 1, 1, 1, 1, 1,
0.3412927, 1.029648, -0.2374336, 1, 1, 1, 1, 1,
0.341359, -1.0773, 1.90363, 1, 1, 1, 1, 1,
0.3435641, -0.7473111, 3.228478, 1, 1, 1, 1, 1,
0.3450576, -0.1989481, 1.499662, 1, 1, 1, 1, 1,
0.346688, -0.2728357, 2.901571, 1, 1, 1, 1, 1,
0.3467361, -1.131312, 3.945555, 1, 1, 1, 1, 1,
0.3471041, 0.9765645, -2.715693, 1, 1, 1, 1, 1,
0.3487518, 0.3123492, 0.342462, 1, 1, 1, 1, 1,
0.3498738, -1.611057, 1.966543, 1, 1, 1, 1, 1,
0.3517178, 0.1253139, 2.923576, 1, 1, 1, 1, 1,
0.3531932, 2.329296, -0.3627642, 0, 0, 1, 1, 1,
0.3577853, -0.4514152, 2.272286, 1, 0, 0, 1, 1,
0.3673943, 0.8634357, 0.4765774, 1, 0, 0, 1, 1,
0.3719549, 1.815279, 0.5768721, 1, 0, 0, 1, 1,
0.3751638, 0.05477926, 1.684444, 1, 0, 0, 1, 1,
0.3771688, 0.3403137, 1.249549, 1, 0, 0, 1, 1,
0.3783544, -0.5886891, 2.928881, 0, 0, 0, 1, 1,
0.3796132, -0.4195122, 3.308985, 0, 0, 0, 1, 1,
0.3817826, 0.3052634, 2.513055, 0, 0, 0, 1, 1,
0.3823259, 1.130519, 1.552768, 0, 0, 0, 1, 1,
0.3828236, -0.2185542, 2.015985, 0, 0, 0, 1, 1,
0.3835612, 1.80539, 1.383658, 0, 0, 0, 1, 1,
0.3836589, -0.2146267, 2.113787, 0, 0, 0, 1, 1,
0.3871651, 0.5309126, 2.197668, 1, 1, 1, 1, 1,
0.3880624, -0.1094859, 3.212406, 1, 1, 1, 1, 1,
0.388837, 1.489265, 2.953134, 1, 1, 1, 1, 1,
0.3890749, -0.4132945, 1.781841, 1, 1, 1, 1, 1,
0.3910386, 0.622209, 0.5696313, 1, 1, 1, 1, 1,
0.3972144, -0.7746406, 3.284642, 1, 1, 1, 1, 1,
0.3982285, -0.05145565, 2.289833, 1, 1, 1, 1, 1,
0.4019975, 1.105405, -0.2669534, 1, 1, 1, 1, 1,
0.4035703, 0.7286362, 2.465264, 1, 1, 1, 1, 1,
0.4051433, -0.8749061, 3.418329, 1, 1, 1, 1, 1,
0.4053681, 0.5629685, -1.039071, 1, 1, 1, 1, 1,
0.405974, -0.193687, 2.143416, 1, 1, 1, 1, 1,
0.4079739, 0.6594438, -0.9808795, 1, 1, 1, 1, 1,
0.4104884, -1.614752, 2.919861, 1, 1, 1, 1, 1,
0.411863, 0.6293999, 1.858043, 1, 1, 1, 1, 1,
0.4199864, 0.1830333, 0.6051861, 0, 0, 1, 1, 1,
0.4263238, -0.648311, 1.444601, 1, 0, 0, 1, 1,
0.4332372, 1.519461, 0.5620759, 1, 0, 0, 1, 1,
0.4365945, 0.9726773, -0.6190008, 1, 0, 0, 1, 1,
0.4391129, -0.4493657, 2.147536, 1, 0, 0, 1, 1,
0.4447652, 1.595925, 1.21088, 1, 0, 0, 1, 1,
0.4516873, -0.9875566, 1.589733, 0, 0, 0, 1, 1,
0.4526526, -2.851332, 4.373525, 0, 0, 0, 1, 1,
0.4626192, -0.5274586, 1.765775, 0, 0, 0, 1, 1,
0.4648421, 0.9840149, 1.559353, 0, 0, 0, 1, 1,
0.4649147, 0.2635112, 0.8694792, 0, 0, 0, 1, 1,
0.4655254, 0.3654198, 1.505276, 0, 0, 0, 1, 1,
0.471305, -0.2616541, 2.339503, 0, 0, 0, 1, 1,
0.4725807, -1.073677, 2.548808, 1, 1, 1, 1, 1,
0.473773, -0.6840504, 1.992767, 1, 1, 1, 1, 1,
0.4746263, 1.411498, 0.1017248, 1, 1, 1, 1, 1,
0.4804014, 0.4149143, -0.2580333, 1, 1, 1, 1, 1,
0.4838662, -0.4104379, 2.74258, 1, 1, 1, 1, 1,
0.4863288, 0.5496319, 0.776392, 1, 1, 1, 1, 1,
0.4867712, -0.5637307, 2.458731, 1, 1, 1, 1, 1,
0.4899191, -0.9413891, 3.012847, 1, 1, 1, 1, 1,
0.4906301, -0.3823811, 2.849256, 1, 1, 1, 1, 1,
0.4943229, -0.3797475, 2.002337, 1, 1, 1, 1, 1,
0.4949304, -0.4545576, 3.403202, 1, 1, 1, 1, 1,
0.4971701, -0.01365045, 0.7941917, 1, 1, 1, 1, 1,
0.5000604, -0.8688918, 3.558382, 1, 1, 1, 1, 1,
0.5052714, -1.335872, 1.67185, 1, 1, 1, 1, 1,
0.5064673, 1.807577, 1.748248, 1, 1, 1, 1, 1,
0.5079327, -0.5560348, 3.471434, 0, 0, 1, 1, 1,
0.51116, 2.612695, 0.2589452, 1, 0, 0, 1, 1,
0.511788, 0.7037977, 1.597453, 1, 0, 0, 1, 1,
0.5138596, 0.7003438, 0.7878567, 1, 0, 0, 1, 1,
0.5144389, 0.7275794, 2.067197, 1, 0, 0, 1, 1,
0.5153527, 1.16736, 0.7994371, 1, 0, 0, 1, 1,
0.5156955, -1.027613, 1.832328, 0, 0, 0, 1, 1,
0.5165904, 1.717382, 1.648503, 0, 0, 0, 1, 1,
0.5167921, 0.5990237, 1.535966, 0, 0, 0, 1, 1,
0.5207573, 0.5621845, -0.776175, 0, 0, 0, 1, 1,
0.5224552, 0.6674978, 0.2419027, 0, 0, 0, 1, 1,
0.525789, -1.398068, 0.7171648, 0, 0, 0, 1, 1,
0.5360962, 2.005544, 0.4404241, 0, 0, 0, 1, 1,
0.5362224, -0.3469306, 1.981904, 1, 1, 1, 1, 1,
0.5472942, 0.2778695, 0.8004083, 1, 1, 1, 1, 1,
0.5484783, 0.06263876, 2.806471, 1, 1, 1, 1, 1,
0.5499064, 0.4989503, 2.5265, 1, 1, 1, 1, 1,
0.5639472, 0.5988107, 0.6650879, 1, 1, 1, 1, 1,
0.5643401, -0.275275, 1.963263, 1, 1, 1, 1, 1,
0.5655391, -0.1784108, 1.406531, 1, 1, 1, 1, 1,
0.5732134, 1.338232, -0.5703997, 1, 1, 1, 1, 1,
0.5786456, -0.562362, 1.955252, 1, 1, 1, 1, 1,
0.579183, 0.1215303, 2.07525, 1, 1, 1, 1, 1,
0.5815695, 0.6465729, 1.187375, 1, 1, 1, 1, 1,
0.584491, -1.974294, 1.689634, 1, 1, 1, 1, 1,
0.5847397, 0.3262039, 2.292689, 1, 1, 1, 1, 1,
0.5863131, -0.04662519, 2.936639, 1, 1, 1, 1, 1,
0.5871875, -0.7539486, 1.446743, 1, 1, 1, 1, 1,
0.5901246, -0.8980917, 1.612517, 0, 0, 1, 1, 1,
0.5901518, 0.04651165, 0.7480161, 1, 0, 0, 1, 1,
0.5908293, 0.8063338, 2.154667, 1, 0, 0, 1, 1,
0.5940632, 1.176557, 0.9629131, 1, 0, 0, 1, 1,
0.594583, -1.900956, 3.174637, 1, 0, 0, 1, 1,
0.5960263, -0.02027626, 2.963679, 1, 0, 0, 1, 1,
0.6035627, 0.7891276, -0.3102061, 0, 0, 0, 1, 1,
0.6044953, -1.499345, 3.923252, 0, 0, 0, 1, 1,
0.6058186, 0.3033283, 0.8192824, 0, 0, 0, 1, 1,
0.6086095, 0.1700687, 0.5216504, 0, 0, 0, 1, 1,
0.6095188, -0.3123197, 1.113281, 0, 0, 0, 1, 1,
0.6205185, -0.02426336, 2.607176, 0, 0, 0, 1, 1,
0.6245687, -1.036131, 3.058199, 0, 0, 0, 1, 1,
0.6261004, 0.3609526, 2.115387, 1, 1, 1, 1, 1,
0.6280036, 1.14766, 1.244362, 1, 1, 1, 1, 1,
0.6302087, 0.5086323, 0.328142, 1, 1, 1, 1, 1,
0.6308004, 1.125932, 0.7369609, 1, 1, 1, 1, 1,
0.6337019, 0.7957059, 1.308697, 1, 1, 1, 1, 1,
0.6355664, 0.4277079, 0.03319623, 1, 1, 1, 1, 1,
0.6372325, -0.1956526, 2.761647, 1, 1, 1, 1, 1,
0.6444299, -0.3210453, 1.91218, 1, 1, 1, 1, 1,
0.6513017, -1.159374, 3.431342, 1, 1, 1, 1, 1,
0.6565546, -0.3665931, 1.634465, 1, 1, 1, 1, 1,
0.6571624, -0.1585579, 1.961434, 1, 1, 1, 1, 1,
0.6591977, 0.3272857, 1.569972, 1, 1, 1, 1, 1,
0.6624112, 0.6463595, -0.9009175, 1, 1, 1, 1, 1,
0.6630996, -0.4376385, 2.746958, 1, 1, 1, 1, 1,
0.6657023, 0.1440977, 2.118646, 1, 1, 1, 1, 1,
0.6679167, 0.6083112, 0.7285573, 0, 0, 1, 1, 1,
0.6852654, 0.5389395, 1.597911, 1, 0, 0, 1, 1,
0.6908133, -0.6115298, -0.0743648, 1, 0, 0, 1, 1,
0.6925399, -0.7414301, 3.757865, 1, 0, 0, 1, 1,
0.6962633, 0.08787695, 2.079624, 1, 0, 0, 1, 1,
0.6998626, -1.467216, 3.632889, 1, 0, 0, 1, 1,
0.7000103, -0.421998, 1.902742, 0, 0, 0, 1, 1,
0.7012304, -1.33462, 3.837991, 0, 0, 0, 1, 1,
0.7013206, 0.4707354, 0.09596252, 0, 0, 0, 1, 1,
0.7037181, -3.212008, 5.304222, 0, 0, 0, 1, 1,
0.7037876, -0.6119379, 1.870929, 0, 0, 0, 1, 1,
0.7221069, 1.498269, -0.3257061, 0, 0, 0, 1, 1,
0.722282, -2.080405, 2.324671, 0, 0, 0, 1, 1,
0.7228556, -1.110977, 2.599245, 1, 1, 1, 1, 1,
0.7259936, -0.3070062, 1.43735, 1, 1, 1, 1, 1,
0.7334042, -0.6995856, 1.020891, 1, 1, 1, 1, 1,
0.7372286, 0.04577454, 2.11295, 1, 1, 1, 1, 1,
0.7393096, -1.089581, 2.711406, 1, 1, 1, 1, 1,
0.7530656, 0.01664127, 1.979742, 1, 1, 1, 1, 1,
0.7531738, -1.270485, 3.463497, 1, 1, 1, 1, 1,
0.755596, 0.3454219, 1.406425, 1, 1, 1, 1, 1,
0.75894, -0.006597425, 1.543954, 1, 1, 1, 1, 1,
0.7605478, 0.1528579, 0.6078266, 1, 1, 1, 1, 1,
0.764757, 0.2336626, 1.578397, 1, 1, 1, 1, 1,
0.7660929, 0.04107112, 2.15265, 1, 1, 1, 1, 1,
0.7670358, 0.6192226, -0.06133404, 1, 1, 1, 1, 1,
0.7677859, -0.1424995, 0.9351841, 1, 1, 1, 1, 1,
0.7731642, 0.02615811, 2.638268, 1, 1, 1, 1, 1,
0.7801203, -0.3571245, 2.187686, 0, 0, 1, 1, 1,
0.7890813, -0.6003209, 3.697993, 1, 0, 0, 1, 1,
0.7898434, 1.241142, 0.763822, 1, 0, 0, 1, 1,
0.7925885, -1.432896, 2.412034, 1, 0, 0, 1, 1,
0.7945099, 0.6990449, 1.103352, 1, 0, 0, 1, 1,
0.7959337, -0.1415904, 2.680648, 1, 0, 0, 1, 1,
0.7973742, -0.4837584, 2.770344, 0, 0, 0, 1, 1,
0.7998276, 1.227275, 1.400226, 0, 0, 0, 1, 1,
0.8082881, 0.6821687, -0.5430709, 0, 0, 0, 1, 1,
0.8091525, -0.9974928, 2.18099, 0, 0, 0, 1, 1,
0.8107672, -1.311424, 1.551264, 0, 0, 0, 1, 1,
0.8168563, 0.3992866, 1.023774, 0, 0, 0, 1, 1,
0.8182412, 1.070866, 1.138003, 0, 0, 0, 1, 1,
0.8204264, -0.0221575, 1.452908, 1, 1, 1, 1, 1,
0.8206562, -0.3136382, 3.623066, 1, 1, 1, 1, 1,
0.8223263, -0.02469998, 2.514359, 1, 1, 1, 1, 1,
0.823051, 0.7373742, 2.124865, 1, 1, 1, 1, 1,
0.8254952, -1.170154, 2.492896, 1, 1, 1, 1, 1,
0.8314578, 0.2986779, 1.449689, 1, 1, 1, 1, 1,
0.8370988, 0.3382782, 0.6175416, 1, 1, 1, 1, 1,
0.840392, 0.373758, 1.109688, 1, 1, 1, 1, 1,
0.8412814, 0.0495913, 2.590129, 1, 1, 1, 1, 1,
0.8440292, 3.399103, -0.6782346, 1, 1, 1, 1, 1,
0.8441095, 1.641285, 0.8105156, 1, 1, 1, 1, 1,
0.8467972, 0.4843521, 1.696079, 1, 1, 1, 1, 1,
0.8495293, 0.03811342, 1.990888, 1, 1, 1, 1, 1,
0.8518044, 0.4368148, 1.229394, 1, 1, 1, 1, 1,
0.8523627, 0.7108278, -0.326714, 1, 1, 1, 1, 1,
0.8682412, -1.903836, 2.473344, 0, 0, 1, 1, 1,
0.8741763, -0.09496551, 0.1920393, 1, 0, 0, 1, 1,
0.8755469, 0.4908938, 1.068909, 1, 0, 0, 1, 1,
0.8791348, -1.326419, 4.136308, 1, 0, 0, 1, 1,
0.8795363, -1.306819, 2.880126, 1, 0, 0, 1, 1,
0.8864552, -1.609149, 1.981966, 1, 0, 0, 1, 1,
0.8886959, -0.3753212, 1.997079, 0, 0, 0, 1, 1,
0.8889754, -0.05618081, 1.630421, 0, 0, 0, 1, 1,
0.8914718, -0.05895191, 0.7049875, 0, 0, 0, 1, 1,
0.8920906, 0.4132072, -0.7710555, 0, 0, 0, 1, 1,
0.8941747, 0.1434975, 0.9100096, 0, 0, 0, 1, 1,
0.8991569, -0.3667192, 3.055971, 0, 0, 0, 1, 1,
0.8998537, -0.3677169, 3.148643, 0, 0, 0, 1, 1,
0.9012529, 0.06568269, 2.454998, 1, 1, 1, 1, 1,
0.9084525, 1.405455, 1.415845, 1, 1, 1, 1, 1,
0.910641, -0.9117541, 2.605668, 1, 1, 1, 1, 1,
0.9172959, -0.2326818, 1.360034, 1, 1, 1, 1, 1,
0.9222975, -0.8860622, 1.689942, 1, 1, 1, 1, 1,
0.9293768, 1.338651, 0.6449563, 1, 1, 1, 1, 1,
0.931735, 0.03425043, 1.267461, 1, 1, 1, 1, 1,
0.9347794, -1.42886, 1.827294, 1, 1, 1, 1, 1,
0.9376261, 0.3547686, 1.302428, 1, 1, 1, 1, 1,
0.9385536, -0.03989069, 3.771162, 1, 1, 1, 1, 1,
0.946411, 0.5928501, -0.2573905, 1, 1, 1, 1, 1,
0.9504987, 0.8213785, 2.505069, 1, 1, 1, 1, 1,
0.9527726, -0.6908166, 3.73121, 1, 1, 1, 1, 1,
0.9575776, -0.084216, 2.703064, 1, 1, 1, 1, 1,
0.9653756, 0.457491, 1.720783, 1, 1, 1, 1, 1,
0.9691077, 0.367102, 0.5011412, 0, 0, 1, 1, 1,
0.972773, -0.8821862, 2.84102, 1, 0, 0, 1, 1,
0.973024, -0.9378292, 2.920459, 1, 0, 0, 1, 1,
0.9749371, -0.04592999, 0.1005706, 1, 0, 0, 1, 1,
0.9751356, -0.2038718, 1.026993, 1, 0, 0, 1, 1,
0.9782073, 0.06963005, 0.9280007, 1, 0, 0, 1, 1,
0.9786721, 1.329721, 0.2097564, 0, 0, 0, 1, 1,
0.9798418, 1.074297, 0.6195535, 0, 0, 0, 1, 1,
0.9799947, -0.1393637, 3.079835, 0, 0, 0, 1, 1,
0.9809202, 0.4629323, 3.541206, 0, 0, 0, 1, 1,
0.9816357, -0.4621017, 1.989603, 0, 0, 0, 1, 1,
0.9959069, 0.3642186, 0.5116822, 0, 0, 0, 1, 1,
0.9975713, -0.6833937, 2.202346, 0, 0, 0, 1, 1,
0.9982932, 0.5384474, 0.182501, 1, 1, 1, 1, 1,
1.003777, 1.464347, 0.005365321, 1, 1, 1, 1, 1,
1.008248, 2.632462, 0.7649311, 1, 1, 1, 1, 1,
1.010097, -0.02532983, 3.418634, 1, 1, 1, 1, 1,
1.014123, 2.088912, 0.6781417, 1, 1, 1, 1, 1,
1.017268, 0.08091369, 0.6318687, 1, 1, 1, 1, 1,
1.027555, -0.5169234, 3.039173, 1, 1, 1, 1, 1,
1.028837, 0.304658, 1.079415, 1, 1, 1, 1, 1,
1.033191, -0.8774396, 3.235653, 1, 1, 1, 1, 1,
1.033854, -0.002044541, 3.257415, 1, 1, 1, 1, 1,
1.034297, 0.2522058, 1.758671, 1, 1, 1, 1, 1,
1.03602, -1.303393, 2.695548, 1, 1, 1, 1, 1,
1.043723, 1.559523, 2.532607, 1, 1, 1, 1, 1,
1.045721, -0.2161505, 2.048066, 1, 1, 1, 1, 1,
1.046075, -0.1186317, 2.484651, 1, 1, 1, 1, 1,
1.046769, -0.3114147, 3.650007, 0, 0, 1, 1, 1,
1.05545, 1.09792, 1.99745, 1, 0, 0, 1, 1,
1.059127, -0.532298, 1.438905, 1, 0, 0, 1, 1,
1.061361, -2.096922, 2.987247, 1, 0, 0, 1, 1,
1.073247, -0.3841986, 3.099855, 1, 0, 0, 1, 1,
1.076746, -0.3129755, 3.307636, 1, 0, 0, 1, 1,
1.081785, 1.836777, 0.2387195, 0, 0, 0, 1, 1,
1.082962, 0.7646622, 2.141788, 0, 0, 0, 1, 1,
1.111649, -0.8516655, 2.522247, 0, 0, 0, 1, 1,
1.113361, -1.361879, 1.649707, 0, 0, 0, 1, 1,
1.117274, -0.6297601, 2.334595, 0, 0, 0, 1, 1,
1.125133, -0.7403753, 3.822166, 0, 0, 0, 1, 1,
1.131603, 0.8219195, 0.6890273, 0, 0, 0, 1, 1,
1.138541, -0.2647379, 1.965455, 1, 1, 1, 1, 1,
1.139656, -0.5010459, 0.2316599, 1, 1, 1, 1, 1,
1.141509, 0.185103, 1.063696, 1, 1, 1, 1, 1,
1.143584, 0.5245567, 0.59491, 1, 1, 1, 1, 1,
1.149076, 0.5071486, 1.095664, 1, 1, 1, 1, 1,
1.154775, -1.204789, 2.179013, 1, 1, 1, 1, 1,
1.156889, -1.951268, 4.702584, 1, 1, 1, 1, 1,
1.168435, 0.1782485, 0.8490192, 1, 1, 1, 1, 1,
1.169624, -0.5315076, 1.774709, 1, 1, 1, 1, 1,
1.176977, -0.3027308, 0.108901, 1, 1, 1, 1, 1,
1.178148, -0.7705953, 1.623695, 1, 1, 1, 1, 1,
1.185211, -0.5221945, 1.904161, 1, 1, 1, 1, 1,
1.191345, -0.6271713, 0.7285777, 1, 1, 1, 1, 1,
1.192823, -1.10387, 0.6676565, 1, 1, 1, 1, 1,
1.196667, -0.9105847, 2.391408, 1, 1, 1, 1, 1,
1.196952, -0.5578635, 2.370544, 0, 0, 1, 1, 1,
1.198162, -0.4603411, 3.958239, 1, 0, 0, 1, 1,
1.221047, -0.1228337, 1.60614, 1, 0, 0, 1, 1,
1.222455, -0.6448225, 1.680526, 1, 0, 0, 1, 1,
1.226543, 1.040483, -0.80963, 1, 0, 0, 1, 1,
1.229405, -0.4906123, 3.47752, 1, 0, 0, 1, 1,
1.232556, -1.236482, 2.060518, 0, 0, 0, 1, 1,
1.236461, 0.1238148, 1.462857, 0, 0, 0, 1, 1,
1.237056, 1.140558, -0.6180788, 0, 0, 0, 1, 1,
1.239548, 0.4159617, 1.527353, 0, 0, 0, 1, 1,
1.252483, 1.1212, 0.5397761, 0, 0, 0, 1, 1,
1.257008, -1.624838, 2.793389, 0, 0, 0, 1, 1,
1.25898, -0.6889522, 0.8559358, 0, 0, 0, 1, 1,
1.259005, 0.2868127, 0.3224434, 1, 1, 1, 1, 1,
1.264012, -1.169576, 3.111694, 1, 1, 1, 1, 1,
1.266265, -0.516533, 0.9235454, 1, 1, 1, 1, 1,
1.266457, 0.3264609, 2.400174, 1, 1, 1, 1, 1,
1.266697, 0.2561298, 0.9399698, 1, 1, 1, 1, 1,
1.268005, -0.08671241, 0.03999145, 1, 1, 1, 1, 1,
1.269642, 1.978469, -0.5076255, 1, 1, 1, 1, 1,
1.279605, 0.4238248, 1.667857, 1, 1, 1, 1, 1,
1.279824, -0.08269201, 1.782357, 1, 1, 1, 1, 1,
1.282734, -0.4678862, 2.807901, 1, 1, 1, 1, 1,
1.29382, -0.481514, 1.389842, 1, 1, 1, 1, 1,
1.293873, -0.2175698, 2.180354, 1, 1, 1, 1, 1,
1.304136, -0.008748956, 1.630043, 1, 1, 1, 1, 1,
1.314153, 0.4414496, 0.4651242, 1, 1, 1, 1, 1,
1.325279, -0.2922587, 1.51045, 1, 1, 1, 1, 1,
1.32858, -1.718529, 1.141468, 0, 0, 1, 1, 1,
1.341394, -0.6047505, 1.904851, 1, 0, 0, 1, 1,
1.341524, -0.5279052, 3.742756, 1, 0, 0, 1, 1,
1.343118, -2.084228, 2.70104, 1, 0, 0, 1, 1,
1.359527, -0.8675643, 2.708032, 1, 0, 0, 1, 1,
1.373897, 0.05036059, 1.553279, 1, 0, 0, 1, 1,
1.375016, 1.29056, 1.205862, 0, 0, 0, 1, 1,
1.382921, -0.9163525, 2.051142, 0, 0, 0, 1, 1,
1.38532, -0.1785769, 1.056935, 0, 0, 0, 1, 1,
1.386069, 0.2153253, 1.735626, 0, 0, 0, 1, 1,
1.39063, -0.3814607, 1.580314, 0, 0, 0, 1, 1,
1.400464, -0.376799, 1.295833, 0, 0, 0, 1, 1,
1.414896, -0.2140653, 0.4525076, 0, 0, 0, 1, 1,
1.428527, 0.39902, 0.7712613, 1, 1, 1, 1, 1,
1.452212, 0.563946, 0.7504948, 1, 1, 1, 1, 1,
1.47034, 0.4246412, 0.8125457, 1, 1, 1, 1, 1,
1.471404, 0.5464562, 1.277315, 1, 1, 1, 1, 1,
1.490092, 0.8156032, 1.606996, 1, 1, 1, 1, 1,
1.530382, -0.2833671, 1.647645, 1, 1, 1, 1, 1,
1.539278, -0.8376051, 2.548095, 1, 1, 1, 1, 1,
1.545462, -0.2613431, 1.872858, 1, 1, 1, 1, 1,
1.571684, 0.5015172, 1.145787, 1, 1, 1, 1, 1,
1.571784, -0.5950899, -0.325027, 1, 1, 1, 1, 1,
1.585052, -1.587273, 2.909493, 1, 1, 1, 1, 1,
1.594464, 1.145754, 0.9029868, 1, 1, 1, 1, 1,
1.595836, 1.398301, 2.417431, 1, 1, 1, 1, 1,
1.645015, -0.9801654, 2.458024, 1, 1, 1, 1, 1,
1.647261, 0.1702398, 1.667838, 1, 1, 1, 1, 1,
1.65519, -0.348075, 2.47261, 0, 0, 1, 1, 1,
1.669053, 2.687781, -0.3580111, 1, 0, 0, 1, 1,
1.706954, -1.385337, 1.055658, 1, 0, 0, 1, 1,
1.718079, 1.906612, 1.728406, 1, 0, 0, 1, 1,
1.72963, -1.913199, 2.2045, 1, 0, 0, 1, 1,
1.733057, 0.8491875, 1.835833, 1, 0, 0, 1, 1,
1.736244, 1.630531, 0.95584, 0, 0, 0, 1, 1,
1.745542, -1.237643, 0.9399459, 0, 0, 0, 1, 1,
1.758237, 1.358009, -0.349757, 0, 0, 0, 1, 1,
1.770216, -0.1511215, 0.9615918, 0, 0, 0, 1, 1,
1.772881, -0.3073285, 3.163452, 0, 0, 0, 1, 1,
1.798925, -0.8836462, -0.6331434, 0, 0, 0, 1, 1,
1.833074, -0.8024294, 1.408854, 0, 0, 0, 1, 1,
1.852896, 0.6544649, 0.06585537, 1, 1, 1, 1, 1,
1.863407, 0.7283292, 1.933568, 1, 1, 1, 1, 1,
1.867152, 0.2045428, 1.936193, 1, 1, 1, 1, 1,
1.886385, 0.3361296, 2.558392, 1, 1, 1, 1, 1,
1.905224, 1.799813, 0.4559113, 1, 1, 1, 1, 1,
1.906345, -2.108813, 1.299437, 1, 1, 1, 1, 1,
1.968084, 0.8804206, 1.888234, 1, 1, 1, 1, 1,
1.975679, 0.5565535, 0.7195753, 1, 1, 1, 1, 1,
1.976352, -0.2679272, 2.216559, 1, 1, 1, 1, 1,
1.991723, 0.4627066, 1.130837, 1, 1, 1, 1, 1,
2.005848, 0.4128976, 1.238631, 1, 1, 1, 1, 1,
2.014394, 0.4555485, 0.4866602, 1, 1, 1, 1, 1,
2.083579, 0.9791285, 1.171904, 1, 1, 1, 1, 1,
2.084585, -1.795267, 3.09438, 1, 1, 1, 1, 1,
2.094277, 0.6083569, 0.2744818, 1, 1, 1, 1, 1,
2.125954, 1.012932, 0.2520705, 0, 0, 1, 1, 1,
2.150056, 1.12808, 2.03682, 1, 0, 0, 1, 1,
2.152418, -0.04637519, 1.272465, 1, 0, 0, 1, 1,
2.205705, 1.091905, 2.628037, 1, 0, 0, 1, 1,
2.211271, -0.5751945, 2.821964, 1, 0, 0, 1, 1,
2.215234, -0.4893382, 1.623367, 1, 0, 0, 1, 1,
2.280058, 0.401271, 3.153136, 0, 0, 0, 1, 1,
2.29333, 0.3034842, 2.709835, 0, 0, 0, 1, 1,
2.301617, -0.5199006, 2.055895, 0, 0, 0, 1, 1,
2.333244, 2.784167, 0.868109, 0, 0, 0, 1, 1,
2.341818, -0.9435841, 3.158586, 0, 0, 0, 1, 1,
2.541925, -0.9269462, 1.163009, 0, 0, 0, 1, 1,
2.591835, -0.5666616, 1.706621, 0, 0, 0, 1, 1,
2.63861, 0.6288679, -1.0949, 1, 1, 1, 1, 1,
2.678263, -0.1306926, 1.766699, 1, 1, 1, 1, 1,
2.68254, 0.1919175, 0.6552771, 1, 1, 1, 1, 1,
2.722903, 0.8061158, -0.1195027, 1, 1, 1, 1, 1,
2.80813, -1.340096, 1.330896, 1, 1, 1, 1, 1,
2.848055, 0.9888359, 1.148253, 1, 1, 1, 1, 1,
3.071797, 3.537536, 0.7363348, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.580589;
var distance = 33.65141;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1308982, -0.01881742, -0.1579931 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.65141);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
