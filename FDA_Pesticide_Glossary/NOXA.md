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
-4.109351, -0.2335904, -0.8559208, 1, 0, 0, 1,
-2.919139, -0.7029966, -1.913227, 1, 0.007843138, 0, 1,
-2.887899, -1.380728, -1.146847, 1, 0.01176471, 0, 1,
-2.668059, -1.068287, -1.531846, 1, 0.01960784, 0, 1,
-2.573846, 2.25354, -3.009933, 1, 0.02352941, 0, 1,
-2.375729, 0.8395644, -0.2365651, 1, 0.03137255, 0, 1,
-2.366851, 0.9511339, -2.550496, 1, 0.03529412, 0, 1,
-2.276299, -0.2337713, -2.235271, 1, 0.04313726, 0, 1,
-2.224838, 1.360068, -0.5443184, 1, 0.04705882, 0, 1,
-2.204353, 0.5732422, -2.49622, 1, 0.05490196, 0, 1,
-2.197161, 1.383118, -0.1721863, 1, 0.05882353, 0, 1,
-2.195877, 0.04488997, -2.917206, 1, 0.06666667, 0, 1,
-2.170931, 1.331999, -0.5757649, 1, 0.07058824, 0, 1,
-2.170576, -0.05413431, 0.03205769, 1, 0.07843138, 0, 1,
-2.157277, -0.4381304, -2.288188, 1, 0.08235294, 0, 1,
-2.045901, -1.140359, -1.475229, 1, 0.09019608, 0, 1,
-2.01801, -0.9104839, -2.067902, 1, 0.09411765, 0, 1,
-1.966581, -0.5726791, -1.205927, 1, 0.1019608, 0, 1,
-1.944427, 0.4135777, -1.445412, 1, 0.1098039, 0, 1,
-1.91275, -0.8230084, -1.471794, 1, 0.1137255, 0, 1,
-1.909694, 0.8561614, -0.8560985, 1, 0.1215686, 0, 1,
-1.848879, -0.2803783, -1.777676, 1, 0.1254902, 0, 1,
-1.840769, 0.4731982, -1.898993, 1, 0.1333333, 0, 1,
-1.82813, 0.5979826, -1.419032, 1, 0.1372549, 0, 1,
-1.82336, 0.3057775, -1.558746, 1, 0.145098, 0, 1,
-1.816863, -1.557745, -2.165688, 1, 0.1490196, 0, 1,
-1.772671, -0.3268169, -1.340284, 1, 0.1568628, 0, 1,
-1.760718, 1.810756, -2.020204, 1, 0.1607843, 0, 1,
-1.75962, -0.4334441, -2.079255, 1, 0.1686275, 0, 1,
-1.756186, -0.07831652, -0.205915, 1, 0.172549, 0, 1,
-1.725484, -1.102136, -1.510451, 1, 0.1803922, 0, 1,
-1.710098, 0.4711346, 0.2422561, 1, 0.1843137, 0, 1,
-1.692287, -0.9001651, -0.5385942, 1, 0.1921569, 0, 1,
-1.68565, 0.4011112, 0.3142405, 1, 0.1960784, 0, 1,
-1.679873, 0.9386021, -1.700835, 1, 0.2039216, 0, 1,
-1.666796, -0.1849563, -1.277165, 1, 0.2117647, 0, 1,
-1.664055, -1.508564, -0.9854206, 1, 0.2156863, 0, 1,
-1.658262, 1.024836, -0.6058767, 1, 0.2235294, 0, 1,
-1.649363, -0.2515276, -2.096723, 1, 0.227451, 0, 1,
-1.638317, -1.313416, -3.279046, 1, 0.2352941, 0, 1,
-1.637398, 0.0738425, -2.000016, 1, 0.2392157, 0, 1,
-1.620236, 0.2477854, -0.5577699, 1, 0.2470588, 0, 1,
-1.593847, 0.670515, -1.811619, 1, 0.2509804, 0, 1,
-1.566071, 1.013232, 0.956928, 1, 0.2588235, 0, 1,
-1.559389, 0.8277586, -1.54395, 1, 0.2627451, 0, 1,
-1.558347, -0.1297302, -0.9724571, 1, 0.2705882, 0, 1,
-1.530646, -1.485844, -2.857038, 1, 0.2745098, 0, 1,
-1.526681, 0.8794426, -0.9860551, 1, 0.282353, 0, 1,
-1.524965, 0.4210591, -0.8451374, 1, 0.2862745, 0, 1,
-1.514133, -0.2952413, -2.394501, 1, 0.2941177, 0, 1,
-1.512801, -0.7893755, -3.569744, 1, 0.3019608, 0, 1,
-1.507738, -0.3400827, -1.238758, 1, 0.3058824, 0, 1,
-1.503858, 0.9986559, -2.336296, 1, 0.3137255, 0, 1,
-1.490034, 0.2119321, -2.095459, 1, 0.3176471, 0, 1,
-1.488346, 0.7932894, -1.579176, 1, 0.3254902, 0, 1,
-1.483001, 0.02740482, -3.430929, 1, 0.3294118, 0, 1,
-1.46781, -0.457104, -1.217957, 1, 0.3372549, 0, 1,
-1.466448, -0.3494352, 0.5152187, 1, 0.3411765, 0, 1,
-1.445583, 0.8824739, -0.8884882, 1, 0.3490196, 0, 1,
-1.431988, -0.4429596, -0.4583684, 1, 0.3529412, 0, 1,
-1.422243, -0.399427, -1.434647, 1, 0.3607843, 0, 1,
-1.421966, -0.8901064, -2.119661, 1, 0.3647059, 0, 1,
-1.416613, -0.5101827, -3.45651, 1, 0.372549, 0, 1,
-1.399849, -0.01245393, -3.970319, 1, 0.3764706, 0, 1,
-1.397634, 0.9115276, -2.709812, 1, 0.3843137, 0, 1,
-1.39213, -0.8770105, -2.01707, 1, 0.3882353, 0, 1,
-1.391251, -1.836412, -3.755982, 1, 0.3960784, 0, 1,
-1.378881, -1.103492, -1.83169, 1, 0.4039216, 0, 1,
-1.377874, 0.4306484, -2.095423, 1, 0.4078431, 0, 1,
-1.370605, -0.2989288, -1.541532, 1, 0.4156863, 0, 1,
-1.367687, -2.021594, -2.372292, 1, 0.4196078, 0, 1,
-1.365221, -0.7886556, -1.823494, 1, 0.427451, 0, 1,
-1.362246, -1.206759, -2.606773, 1, 0.4313726, 0, 1,
-1.359978, -0.6679832, -3.024197, 1, 0.4392157, 0, 1,
-1.358416, 1.784428, -1.998484, 1, 0.4431373, 0, 1,
-1.353152, -0.168531, -0.1245442, 1, 0.4509804, 0, 1,
-1.343183, 0.3984248, -1.976231, 1, 0.454902, 0, 1,
-1.34036, 0.9561706, -2.258153, 1, 0.4627451, 0, 1,
-1.338834, -0.704435, -1.913201, 1, 0.4666667, 0, 1,
-1.330753, -1.753415, -2.173129, 1, 0.4745098, 0, 1,
-1.330724, 0.9251804, -2.1045, 1, 0.4784314, 0, 1,
-1.325496, -0.5356432, -1.89073, 1, 0.4862745, 0, 1,
-1.324842, 0.4394596, -2.818687, 1, 0.4901961, 0, 1,
-1.324041, 1.55891, -1.183831, 1, 0.4980392, 0, 1,
-1.321291, 0.06100805, -0.4339578, 1, 0.5058824, 0, 1,
-1.301064, -1.089603, -0.9128416, 1, 0.509804, 0, 1,
-1.299602, 0.2505834, -2.588864, 1, 0.5176471, 0, 1,
-1.296066, 0.02410033, -0.9715497, 1, 0.5215687, 0, 1,
-1.295919, -0.1487162, -3.026217, 1, 0.5294118, 0, 1,
-1.289715, -0.4792005, -3.285641, 1, 0.5333334, 0, 1,
-1.280535, 0.2784134, -1.044677, 1, 0.5411765, 0, 1,
-1.272625, -1.121954, -2.977949, 1, 0.5450981, 0, 1,
-1.271584, 0.01405529, -1.468324, 1, 0.5529412, 0, 1,
-1.266914, 0.7738343, -1.815673, 1, 0.5568628, 0, 1,
-1.26222, -0.1823008, -0.1008488, 1, 0.5647059, 0, 1,
-1.241379, -1.578022, -0.6243438, 1, 0.5686275, 0, 1,
-1.241206, -0.936816, -2.469276, 1, 0.5764706, 0, 1,
-1.22105, 1.145049, -0.6628655, 1, 0.5803922, 0, 1,
-1.212912, 0.2169794, -0.08934999, 1, 0.5882353, 0, 1,
-1.212726, 1.239129, -1.154038, 1, 0.5921569, 0, 1,
-1.202469, 0.4710249, -1.505427, 1, 0.6, 0, 1,
-1.19911, 0.6915945, -0.3489489, 1, 0.6078432, 0, 1,
-1.195094, -0.7247902, -1.868328, 1, 0.6117647, 0, 1,
-1.194142, -0.0359539, -0.1347316, 1, 0.6196079, 0, 1,
-1.193286, -0.1302856, -0.4375354, 1, 0.6235294, 0, 1,
-1.188496, -0.3057391, -1.572491, 1, 0.6313726, 0, 1,
-1.188003, 0.2173132, -2.746797, 1, 0.6352941, 0, 1,
-1.184704, -0.295626, -1.797315, 1, 0.6431373, 0, 1,
-1.181816, 0.2534221, -1.602046, 1, 0.6470588, 0, 1,
-1.17828, -0.7805716, -2.812865, 1, 0.654902, 0, 1,
-1.175468, -0.4262445, -2.097301, 1, 0.6588235, 0, 1,
-1.172227, 2.197707, -0.3461173, 1, 0.6666667, 0, 1,
-1.166831, -0.7728425, -2.240975, 1, 0.6705883, 0, 1,
-1.165083, 0.6398951, -1.573805, 1, 0.6784314, 0, 1,
-1.163858, 0.3254396, -1.994044, 1, 0.682353, 0, 1,
-1.161577, -0.5387616, -2.856624, 1, 0.6901961, 0, 1,
-1.158615, -0.7380214, -2.158965, 1, 0.6941177, 0, 1,
-1.139151, 0.668194, -2.458313, 1, 0.7019608, 0, 1,
-1.13308, -0.6731213, -2.860519, 1, 0.7098039, 0, 1,
-1.124081, 0.9868242, -2.996384, 1, 0.7137255, 0, 1,
-1.119982, 1.718378, 0.01535422, 1, 0.7215686, 0, 1,
-1.113392, 0.9264763, -1.536291, 1, 0.7254902, 0, 1,
-1.112577, 0.03099832, -0.7192721, 1, 0.7333333, 0, 1,
-1.104497, 0.31492, -1.751807, 1, 0.7372549, 0, 1,
-1.100493, 0.9560004, -1.191863, 1, 0.7450981, 0, 1,
-1.098637, 0.6176911, 0.3752292, 1, 0.7490196, 0, 1,
-1.094132, -0.5125751, -1.973443, 1, 0.7568628, 0, 1,
-1.091069, -0.6777226, -1.525826, 1, 0.7607843, 0, 1,
-1.085029, -0.7733685, -1.888906, 1, 0.7686275, 0, 1,
-1.082914, -1.258841, -1.961591, 1, 0.772549, 0, 1,
-1.08234, 0.4562185, -1.24214, 1, 0.7803922, 0, 1,
-1.080935, -1.589178, -3.841252, 1, 0.7843137, 0, 1,
-1.079409, 1.833162, -1.089296, 1, 0.7921569, 0, 1,
-1.078584, 2.086812, -1.533373, 1, 0.7960784, 0, 1,
-1.078185, 0.362075, 1.02136, 1, 0.8039216, 0, 1,
-1.066727, -0.2424423, -1.507873, 1, 0.8117647, 0, 1,
-1.066161, 0.24294, -0.9131302, 1, 0.8156863, 0, 1,
-1.062639, 0.1214248, -0.3385223, 1, 0.8235294, 0, 1,
-1.053643, -1.347658, -2.273939, 1, 0.827451, 0, 1,
-1.050047, 0.5524951, -1.366063, 1, 0.8352941, 0, 1,
-1.049935, -1.659248, -1.686337, 1, 0.8392157, 0, 1,
-1.049388, 1.208264, 0.5060901, 1, 0.8470588, 0, 1,
-1.045716, 1.728171, -0.1146619, 1, 0.8509804, 0, 1,
-1.045382, -1.006954, -2.967901, 1, 0.8588235, 0, 1,
-1.040197, 1.188846, -1.813389, 1, 0.8627451, 0, 1,
-1.034095, 0.1690045, -1.545531, 1, 0.8705882, 0, 1,
-1.031457, 0.6386298, -3.357804, 1, 0.8745098, 0, 1,
-1.025464, -0.476028, -1.108459, 1, 0.8823529, 0, 1,
-1.024732, 1.306154, -1.650851, 1, 0.8862745, 0, 1,
-1.024034, -0.6933267, -2.099081, 1, 0.8941177, 0, 1,
-1.023692, 0.5146613, -0.05196388, 1, 0.8980392, 0, 1,
-1.023552, 0.5384154, -1.478161, 1, 0.9058824, 0, 1,
-1.02313, 0.575914, -2.768052, 1, 0.9137255, 0, 1,
-1.023042, 0.09355222, -2.132949, 1, 0.9176471, 0, 1,
-1.022538, -1.369123, -2.434019, 1, 0.9254902, 0, 1,
-1.020624, -0.1973983, -3.05441, 1, 0.9294118, 0, 1,
-1.019572, 0.2061237, -1.623341, 1, 0.9372549, 0, 1,
-1.01655, -0.4111487, -0.467584, 1, 0.9411765, 0, 1,
-1.01377, 1.788992, 0.4466542, 1, 0.9490196, 0, 1,
-1.013184, -0.8948755, -3.559323, 1, 0.9529412, 0, 1,
-1.012281, 0.950035, -0.4868246, 1, 0.9607843, 0, 1,
-1.010794, 0.614261, -1.244836, 1, 0.9647059, 0, 1,
-1.001555, -0.01706823, -3.153645, 1, 0.972549, 0, 1,
-1.001042, 0.2043806, -2.073055, 1, 0.9764706, 0, 1,
-0.9943493, -0.6534777, -0.4462451, 1, 0.9843137, 0, 1,
-0.9932442, -0.8721477, -2.672115, 1, 0.9882353, 0, 1,
-0.9923456, 1.021583, -2.14309, 1, 0.9960784, 0, 1,
-0.9921761, -0.8562764, -3.976755, 0.9960784, 1, 0, 1,
-0.9827066, 0.7576781, -2.292819, 0.9921569, 1, 0, 1,
-0.9763103, 0.1298583, -0.1670931, 0.9843137, 1, 0, 1,
-0.9743314, -0.005156542, -1.888855, 0.9803922, 1, 0, 1,
-0.9738695, 1.915189, -0.4843572, 0.972549, 1, 0, 1,
-0.9724107, 1.71352, -0.1906921, 0.9686275, 1, 0, 1,
-0.9681281, 0.6958975, 0.2020034, 0.9607843, 1, 0, 1,
-0.9674235, 0.2222571, -0.07473321, 0.9568627, 1, 0, 1,
-0.9643875, 0.7183522, -0.9007686, 0.9490196, 1, 0, 1,
-0.953771, -0.1596722, -1.595354, 0.945098, 1, 0, 1,
-0.9498576, 0.6528797, -1.324582, 0.9372549, 1, 0, 1,
-0.9481049, 0.3671779, -2.055338, 0.9333333, 1, 0, 1,
-0.9471327, 0.12142, -2.688778, 0.9254902, 1, 0, 1,
-0.9426532, 0.9923227, -1.804316, 0.9215686, 1, 0, 1,
-0.9362413, 1.809045, 2.141527, 0.9137255, 1, 0, 1,
-0.9345545, -1.370557, -2.981134, 0.9098039, 1, 0, 1,
-0.9184919, -0.3026247, -1.42127, 0.9019608, 1, 0, 1,
-0.9180623, -1.219189, -3.009836, 0.8941177, 1, 0, 1,
-0.9142157, -0.3921171, -1.202982, 0.8901961, 1, 0, 1,
-0.9111176, 1.059571, -0.5974982, 0.8823529, 1, 0, 1,
-0.9073275, -1.155672, -2.500921, 0.8784314, 1, 0, 1,
-0.9045458, -0.9673332, -2.782507, 0.8705882, 1, 0, 1,
-0.8973004, 0.02646693, -1.308894, 0.8666667, 1, 0, 1,
-0.8966466, -0.4210438, -1.808246, 0.8588235, 1, 0, 1,
-0.8954628, 0.6511311, 0.353974, 0.854902, 1, 0, 1,
-0.8917781, -1.067822, -1.965177, 0.8470588, 1, 0, 1,
-0.8895126, 0.5664898, -0.253094, 0.8431373, 1, 0, 1,
-0.8849322, 0.2276565, -0.4540307, 0.8352941, 1, 0, 1,
-0.8811508, 1.263544, -0.9928889, 0.8313726, 1, 0, 1,
-0.8790259, 1.686108, -0.1647195, 0.8235294, 1, 0, 1,
-0.8767607, 0.3470901, -1.781436, 0.8196079, 1, 0, 1,
-0.8749127, 0.232747, -0.8433751, 0.8117647, 1, 0, 1,
-0.8742194, 1.047021, -0.8013493, 0.8078431, 1, 0, 1,
-0.8692665, -0.7104678, -1.61949, 0.8, 1, 0, 1,
-0.8646631, 0.07131899, -1.211645, 0.7921569, 1, 0, 1,
-0.861129, 1.996016, 1.286973, 0.7882353, 1, 0, 1,
-0.8587486, 1.302332, -1.460666, 0.7803922, 1, 0, 1,
-0.8584673, 0.1008238, 0.05196583, 0.7764706, 1, 0, 1,
-0.8579074, 0.765761, -1.940027, 0.7686275, 1, 0, 1,
-0.8549972, -0.2275292, -1.767482, 0.7647059, 1, 0, 1,
-0.8538097, -0.7486881, -3.569356, 0.7568628, 1, 0, 1,
-0.8491123, -0.1681584, -0.5703368, 0.7529412, 1, 0, 1,
-0.8475633, 1.082357, -1.156825, 0.7450981, 1, 0, 1,
-0.8473007, -0.4509252, -2.732943, 0.7411765, 1, 0, 1,
-0.8396454, 2.303806, -1.9026, 0.7333333, 1, 0, 1,
-0.8365043, 0.7082893, -0.8872085, 0.7294118, 1, 0, 1,
-0.8364582, 0.1250668, -0.4542747, 0.7215686, 1, 0, 1,
-0.8341843, -0.9433397, -1.22228, 0.7176471, 1, 0, 1,
-0.8220884, 0.2537646, -1.974817, 0.7098039, 1, 0, 1,
-0.8008009, 1.471653, -0.7036859, 0.7058824, 1, 0, 1,
-0.7954925, 1.486254, 0.5400575, 0.6980392, 1, 0, 1,
-0.785331, -0.9971663, -3.084904, 0.6901961, 1, 0, 1,
-0.7835448, -0.9100175, -1.924075, 0.6862745, 1, 0, 1,
-0.7818175, -0.09023243, -2.658863, 0.6784314, 1, 0, 1,
-0.7804776, -1.192462, -1.534221, 0.6745098, 1, 0, 1,
-0.7767767, -0.5933357, -0.7398648, 0.6666667, 1, 0, 1,
-0.7728261, 0.3216443, 0.2876033, 0.6627451, 1, 0, 1,
-0.7649105, -0.1006337, -1.966584, 0.654902, 1, 0, 1,
-0.7638112, 0.06748167, -0.5780232, 0.6509804, 1, 0, 1,
-0.7612207, 0.2680515, -1.841899, 0.6431373, 1, 0, 1,
-0.7570643, -0.9079263, -3.531801, 0.6392157, 1, 0, 1,
-0.7541272, -0.1987205, -3.922373, 0.6313726, 1, 0, 1,
-0.7456052, -1.472656, -1.559397, 0.627451, 1, 0, 1,
-0.744141, -0.4674874, -2.989511, 0.6196079, 1, 0, 1,
-0.7434422, -0.8699124, -2.951599, 0.6156863, 1, 0, 1,
-0.7424161, 0.1366909, -3.705038, 0.6078432, 1, 0, 1,
-0.740555, -0.365027, -1.049145, 0.6039216, 1, 0, 1,
-0.7348278, 0.1334043, -1.372323, 0.5960785, 1, 0, 1,
-0.729462, -0.3064153, -1.80855, 0.5882353, 1, 0, 1,
-0.7286936, -0.78991, -0.6402456, 0.5843138, 1, 0, 1,
-0.7269131, 0.5709533, -1.969079, 0.5764706, 1, 0, 1,
-0.7239357, 2.17498, 0.0765888, 0.572549, 1, 0, 1,
-0.7236237, -0.08751946, -1.268724, 0.5647059, 1, 0, 1,
-0.7205704, 0.1104597, -1.786051, 0.5607843, 1, 0, 1,
-0.7152275, 1.570121, -0.4325712, 0.5529412, 1, 0, 1,
-0.7107464, 1.901345, -0.6391309, 0.5490196, 1, 0, 1,
-0.7103199, 1.198852, -1.195668, 0.5411765, 1, 0, 1,
-0.7059143, 1.340718, -0.5060467, 0.5372549, 1, 0, 1,
-0.7051378, 0.4272262, 0.8322759, 0.5294118, 1, 0, 1,
-0.7045569, 0.2001757, -0.6747932, 0.5254902, 1, 0, 1,
-0.7027479, -0.6009114, -1.788711, 0.5176471, 1, 0, 1,
-0.7007573, 0.6225362, -0.05906603, 0.5137255, 1, 0, 1,
-0.6965195, -0.6405075, -2.132399, 0.5058824, 1, 0, 1,
-0.6883894, -0.9640294, -2.466389, 0.5019608, 1, 0, 1,
-0.6855999, 0.2556725, -2.107227, 0.4941176, 1, 0, 1,
-0.6854108, 0.7574965, -0.8843369, 0.4862745, 1, 0, 1,
-0.6851318, 0.3115729, 0.06973204, 0.4823529, 1, 0, 1,
-0.6846918, 0.7823197, 0.5818715, 0.4745098, 1, 0, 1,
-0.6824687, -1.75528, -1.76126, 0.4705882, 1, 0, 1,
-0.6783143, -0.3573546, -2.7404, 0.4627451, 1, 0, 1,
-0.6780685, 0.5744078, 0.7789359, 0.4588235, 1, 0, 1,
-0.6726779, -0.5544096, -0.7035716, 0.4509804, 1, 0, 1,
-0.672141, 0.8764198, -0.7735379, 0.4470588, 1, 0, 1,
-0.6690885, 0.2257288, -0.9809988, 0.4392157, 1, 0, 1,
-0.6653682, -1.482248, -2.359491, 0.4352941, 1, 0, 1,
-0.665048, 0.5238366, -1.68768, 0.427451, 1, 0, 1,
-0.6584659, -1.273641, -3.553273, 0.4235294, 1, 0, 1,
-0.6564476, 0.8261685, -1.570743, 0.4156863, 1, 0, 1,
-0.6490361, -1.7337, -1.546981, 0.4117647, 1, 0, 1,
-0.6431904, -0.03355718, -1.410718, 0.4039216, 1, 0, 1,
-0.6392082, 0.8751535, 0.4257512, 0.3960784, 1, 0, 1,
-0.633297, 0.7355611, -2.126736, 0.3921569, 1, 0, 1,
-0.6315722, 0.4666457, -0.1939741, 0.3843137, 1, 0, 1,
-0.6294273, 0.1798182, -0.8948754, 0.3803922, 1, 0, 1,
-0.6272838, 1.176091, -2.268519, 0.372549, 1, 0, 1,
-0.6221772, -0.3457448, -0.8292183, 0.3686275, 1, 0, 1,
-0.6211271, -0.6343338, -1.110955, 0.3607843, 1, 0, 1,
-0.6199714, -1.558716, -2.894999, 0.3568628, 1, 0, 1,
-0.6174567, -1.160957, -3.172842, 0.3490196, 1, 0, 1,
-0.6121841, -0.6205807, 0.4221161, 0.345098, 1, 0, 1,
-0.6033685, 0.1503388, -0.8610034, 0.3372549, 1, 0, 1,
-0.6011661, 1.310154, 0.03358028, 0.3333333, 1, 0, 1,
-0.5981762, 1.200411, -0.1036162, 0.3254902, 1, 0, 1,
-0.5972909, 0.1908541, -0.4825373, 0.3215686, 1, 0, 1,
-0.5914442, -0.2768676, -1.674013, 0.3137255, 1, 0, 1,
-0.5900934, -1.785478, -3.432553, 0.3098039, 1, 0, 1,
-0.5885869, -0.4940836, -1.670907, 0.3019608, 1, 0, 1,
-0.5864475, -1.659549, -3.202613, 0.2941177, 1, 0, 1,
-0.5862036, 1.902568, -1.497474, 0.2901961, 1, 0, 1,
-0.582015, -1.711877, -2.931228, 0.282353, 1, 0, 1,
-0.5769399, 0.5784115, -1.564192, 0.2784314, 1, 0, 1,
-0.5708942, 1.839844, 0.5307627, 0.2705882, 1, 0, 1,
-0.5708342, 0.3723298, -0.5568683, 0.2666667, 1, 0, 1,
-0.570595, -0.2771217, -2.412937, 0.2588235, 1, 0, 1,
-0.5688702, -1.273848, -1.825701, 0.254902, 1, 0, 1,
-0.5610314, -2.700153, -2.661905, 0.2470588, 1, 0, 1,
-0.5528715, -0.5394235, -2.487436, 0.2431373, 1, 0, 1,
-0.5518703, -1.577015, -2.537775, 0.2352941, 1, 0, 1,
-0.5385748, -0.3577023, -2.327992, 0.2313726, 1, 0, 1,
-0.5384529, -0.8914874, -3.005838, 0.2235294, 1, 0, 1,
-0.5379967, -0.6817936, -2.050625, 0.2196078, 1, 0, 1,
-0.5332965, -1.025364, -4.449608, 0.2117647, 1, 0, 1,
-0.5332503, -0.907941, -3.691543, 0.2078431, 1, 0, 1,
-0.5237866, 0.2413066, -1.525974, 0.2, 1, 0, 1,
-0.5225201, -1.321746, -2.736798, 0.1921569, 1, 0, 1,
-0.5201162, -0.04815611, -0.7756072, 0.1882353, 1, 0, 1,
-0.5200295, 1.132766, -0.5225562, 0.1803922, 1, 0, 1,
-0.5197898, 0.8799507, 0.08330009, 0.1764706, 1, 0, 1,
-0.5169467, -0.6958944, -3.089793, 0.1686275, 1, 0, 1,
-0.5158678, -1.45313, -1.776572, 0.1647059, 1, 0, 1,
-0.5156965, 0.4049934, 0.9920028, 0.1568628, 1, 0, 1,
-0.504608, 0.03804298, -1.063775, 0.1529412, 1, 0, 1,
-0.5021007, 1.24937, 0.1098506, 0.145098, 1, 0, 1,
-0.5012328, 0.665057, 0.03408149, 0.1411765, 1, 0, 1,
-0.5008767, 1.180747, 0.4369219, 0.1333333, 1, 0, 1,
-0.4986007, -0.2219655, -2.354469, 0.1294118, 1, 0, 1,
-0.4933148, 1.815069, -0.5977409, 0.1215686, 1, 0, 1,
-0.4927424, 1.397811, -0.2798759, 0.1176471, 1, 0, 1,
-0.4894837, -0.3349972, -2.630692, 0.1098039, 1, 0, 1,
-0.4887661, 0.628002, -0.5266321, 0.1058824, 1, 0, 1,
-0.4797107, -0.2358216, -1.496599, 0.09803922, 1, 0, 1,
-0.4785227, -1.077535, -2.232781, 0.09019608, 1, 0, 1,
-0.4776455, 0.8832319, -0.1035594, 0.08627451, 1, 0, 1,
-0.4722293, 0.3643305, -0.01479642, 0.07843138, 1, 0, 1,
-0.4606974, 0.5724032, -1.818266, 0.07450981, 1, 0, 1,
-0.46026, -1.423787, -3.252928, 0.06666667, 1, 0, 1,
-0.4597034, 1.274549, -0.8427269, 0.0627451, 1, 0, 1,
-0.458378, 0.3040234, -0.6625831, 0.05490196, 1, 0, 1,
-0.4508027, 0.1317411, -0.815419, 0.05098039, 1, 0, 1,
-0.4468488, -1.040437, -2.021917, 0.04313726, 1, 0, 1,
-0.4462753, -1.960892, -2.447014, 0.03921569, 1, 0, 1,
-0.4373145, -0.8705236, -5.457928, 0.03137255, 1, 0, 1,
-0.4362819, -0.4605148, -1.388949, 0.02745098, 1, 0, 1,
-0.436149, 0.3045213, -1.518217, 0.01960784, 1, 0, 1,
-0.4226319, 0.1103486, 0.0005375583, 0.01568628, 1, 0, 1,
-0.4103409, 0.2013773, -0.6659313, 0.007843138, 1, 0, 1,
-0.4079942, -0.1908025, -1.371272, 0.003921569, 1, 0, 1,
-0.4057025, 0.5602615, 0.7854871, 0, 1, 0.003921569, 1,
-0.4055474, -0.6000232, -2.334709, 0, 1, 0.01176471, 1,
-0.3960742, -1.525695, -2.667195, 0, 1, 0.01568628, 1,
-0.3903532, 0.6351029, 1.359138, 0, 1, 0.02352941, 1,
-0.3888379, 0.1129709, -0.9458964, 0, 1, 0.02745098, 1,
-0.3888172, 0.4274402, -1.555004, 0, 1, 0.03529412, 1,
-0.3831568, -0.3821366, -1.600322, 0, 1, 0.03921569, 1,
-0.3812954, -1.46175, -2.855607, 0, 1, 0.04705882, 1,
-0.3774985, -0.1914598, -1.954199, 0, 1, 0.05098039, 1,
-0.3753724, 0.4862665, -1.633817, 0, 1, 0.05882353, 1,
-0.372274, 1.140609, 0.5631268, 0, 1, 0.0627451, 1,
-0.3670231, -0.07954257, 0.02053853, 0, 1, 0.07058824, 1,
-0.3615004, -0.322826, -1.402088, 0, 1, 0.07450981, 1,
-0.3580715, -0.1154735, -3.696247, 0, 1, 0.08235294, 1,
-0.3580424, -0.828982, -3.220134, 0, 1, 0.08627451, 1,
-0.3517433, 1.986391, -0.7085079, 0, 1, 0.09411765, 1,
-0.3455196, 0.3698462, -2.483582, 0, 1, 0.1019608, 1,
-0.3417961, -0.125942, -1.787744, 0, 1, 0.1058824, 1,
-0.3412766, -0.7018453, -0.833688, 0, 1, 0.1137255, 1,
-0.3407887, -2.164231, -1.935029, 0, 1, 0.1176471, 1,
-0.3405578, -0.3335616, -2.252385, 0, 1, 0.1254902, 1,
-0.3356021, 1.523903, -1.489855, 0, 1, 0.1294118, 1,
-0.3347014, 0.4760426, 0.5702283, 0, 1, 0.1372549, 1,
-0.3321162, 0.3180626, 0.1489284, 0, 1, 0.1411765, 1,
-0.3306691, 0.6740738, -0.4620661, 0, 1, 0.1490196, 1,
-0.3255428, 1.08457, -0.6083885, 0, 1, 0.1529412, 1,
-0.3233039, 0.8662759, -0.5631468, 0, 1, 0.1607843, 1,
-0.3221269, -1.2446, -2.02226, 0, 1, 0.1647059, 1,
-0.3215924, -0.3593745, -2.114895, 0, 1, 0.172549, 1,
-0.310048, 0.3594233, -0.9476013, 0, 1, 0.1764706, 1,
-0.3092248, -0.1700352, -2.033438, 0, 1, 0.1843137, 1,
-0.3031203, -0.2809049, -2.597219, 0, 1, 0.1882353, 1,
-0.2999048, -0.6867065, -3.165875, 0, 1, 0.1960784, 1,
-0.2966201, 0.2345071, -2.147682, 0, 1, 0.2039216, 1,
-0.2960526, 0.9302785, 0.2666686, 0, 1, 0.2078431, 1,
-0.2918973, 0.7839639, 0.7255273, 0, 1, 0.2156863, 1,
-0.2868007, 0.3505218, -0.4992002, 0, 1, 0.2196078, 1,
-0.2858088, -2.398062, -2.922767, 0, 1, 0.227451, 1,
-0.2852281, 0.157203, -1.935634, 0, 1, 0.2313726, 1,
-0.2834266, -0.3194148, -3.502529, 0, 1, 0.2392157, 1,
-0.2816205, -1.753559, -2.194435, 0, 1, 0.2431373, 1,
-0.2715907, 0.7660298, -1.252721, 0, 1, 0.2509804, 1,
-0.2711287, -0.307579, -4.778678, 0, 1, 0.254902, 1,
-0.2695106, -0.2042851, -1.806119, 0, 1, 0.2627451, 1,
-0.2653495, 1.5928, 1.792878, 0, 1, 0.2666667, 1,
-0.2626869, -0.4450352, -3.935218, 0, 1, 0.2745098, 1,
-0.2598599, 0.8968192, 0.9417559, 0, 1, 0.2784314, 1,
-0.2590402, 0.4528885, 1.246031, 0, 1, 0.2862745, 1,
-0.246516, 0.5629345, -0.9743356, 0, 1, 0.2901961, 1,
-0.2452048, -0.2823924, -3.408582, 0, 1, 0.2980392, 1,
-0.2431413, -1.495144, -1.597062, 0, 1, 0.3058824, 1,
-0.2424529, -0.225326, -1.448529, 0, 1, 0.3098039, 1,
-0.2400182, -0.1664365, -2.811456, 0, 1, 0.3176471, 1,
-0.2384518, -0.02370119, -1.804229, 0, 1, 0.3215686, 1,
-0.2374419, 0.6393175, 0.9051982, 0, 1, 0.3294118, 1,
-0.2369656, -0.1190314, -1.971804, 0, 1, 0.3333333, 1,
-0.2328459, 0.3473791, -0.987958, 0, 1, 0.3411765, 1,
-0.2291669, -0.4486302, -1.465716, 0, 1, 0.345098, 1,
-0.2267807, -0.06288046, -2.050724, 0, 1, 0.3529412, 1,
-0.2229347, -0.9697755, -2.578583, 0, 1, 0.3568628, 1,
-0.2135191, -0.0889754, -3.342187, 0, 1, 0.3647059, 1,
-0.2134677, 0.1366172, -1.000931, 0, 1, 0.3686275, 1,
-0.2113007, 0.07442513, -1.91418, 0, 1, 0.3764706, 1,
-0.2079076, -0.9147938, -0.8193532, 0, 1, 0.3803922, 1,
-0.2033377, -1.560451, -3.03437, 0, 1, 0.3882353, 1,
-0.2016443, -0.1763401, -3.750996, 0, 1, 0.3921569, 1,
-0.1949975, 1.648386, -0.3681565, 0, 1, 0.4, 1,
-0.1935953, 0.06064756, -0.3489664, 0, 1, 0.4078431, 1,
-0.1923718, 1.675766, -0.357884, 0, 1, 0.4117647, 1,
-0.190052, -0.4676799, -2.398941, 0, 1, 0.4196078, 1,
-0.1850065, -2.404241, -2.025363, 0, 1, 0.4235294, 1,
-0.1807295, 0.9362751, -1.108566, 0, 1, 0.4313726, 1,
-0.1806627, 0.003611972, -2.850239, 0, 1, 0.4352941, 1,
-0.1782524, -0.826364, -3.820556, 0, 1, 0.4431373, 1,
-0.171976, -0.6783132, -3.853758, 0, 1, 0.4470588, 1,
-0.1713034, -0.9596068, -1.337221, 0, 1, 0.454902, 1,
-0.166737, 0.1989791, 1.088251, 0, 1, 0.4588235, 1,
-0.1652741, -0.9232038, -3.352033, 0, 1, 0.4666667, 1,
-0.1595101, -0.4954148, -2.52402, 0, 1, 0.4705882, 1,
-0.1589607, 0.2321911, 0.9579409, 0, 1, 0.4784314, 1,
-0.1588852, -0.4498192, -2.733444, 0, 1, 0.4823529, 1,
-0.1584403, 0.1427792, -1.80496, 0, 1, 0.4901961, 1,
-0.1568678, -0.8748794, -3.046285, 0, 1, 0.4941176, 1,
-0.1551687, 0.2196379, -1.03583, 0, 1, 0.5019608, 1,
-0.1549356, 0.6500718, 0.6371248, 0, 1, 0.509804, 1,
-0.1495171, -0.06475722, -3.454963, 0, 1, 0.5137255, 1,
-0.1467004, 2.06301, -0.0386327, 0, 1, 0.5215687, 1,
-0.1463052, -1.281038, -1.984505, 0, 1, 0.5254902, 1,
-0.1425226, -0.1930185, -2.311514, 0, 1, 0.5333334, 1,
-0.1369372, -0.4176578, -1.546661, 0, 1, 0.5372549, 1,
-0.1364689, 0.224955, -0.9074668, 0, 1, 0.5450981, 1,
-0.1362626, -0.1200461, -1.493101, 0, 1, 0.5490196, 1,
-0.1335046, 0.4190051, -0.7324502, 0, 1, 0.5568628, 1,
-0.1333083, 1.234679, -1.930411, 0, 1, 0.5607843, 1,
-0.1328688, -0.5835698, -2.635524, 0, 1, 0.5686275, 1,
-0.1310373, 0.14856, -3.134353, 0, 1, 0.572549, 1,
-0.1232364, -0.09228875, -2.695127, 0, 1, 0.5803922, 1,
-0.1214974, -1.929612, -2.3549, 0, 1, 0.5843138, 1,
-0.1189343, -0.5627847, -3.116715, 0, 1, 0.5921569, 1,
-0.1154727, -1.035019, -1.247496, 0, 1, 0.5960785, 1,
-0.1149319, 0.0988775, -2.72165, 0, 1, 0.6039216, 1,
-0.1140185, -0.8075334, -2.197992, 0, 1, 0.6117647, 1,
-0.1137073, -0.6831928, -3.528279, 0, 1, 0.6156863, 1,
-0.1102165, -1.006045, -2.658476, 0, 1, 0.6235294, 1,
-0.1055165, -0.4556276, -3.2079, 0, 1, 0.627451, 1,
-0.1008554, -0.5002654, -3.453463, 0, 1, 0.6352941, 1,
-0.1007013, 0.5458006, -1.157887, 0, 1, 0.6392157, 1,
-0.0993054, -1.084317, -2.736647, 0, 1, 0.6470588, 1,
-0.096716, -1.159297, -4.266413, 0, 1, 0.6509804, 1,
-0.09335537, 0.4140677, -1.659308, 0, 1, 0.6588235, 1,
-0.09171667, 0.1601097, -0.6170149, 0, 1, 0.6627451, 1,
-0.08958226, -0.6272982, -3.465844, 0, 1, 0.6705883, 1,
-0.08726892, 0.3567455, 0.8057761, 0, 1, 0.6745098, 1,
-0.08641987, 0.6588942, 0.3400682, 0, 1, 0.682353, 1,
-0.08019862, 1.305275, -0.8565369, 0, 1, 0.6862745, 1,
-0.07198521, 0.4878766, -0.7911678, 0, 1, 0.6941177, 1,
-0.07154819, 1.314368, -0.1510884, 0, 1, 0.7019608, 1,
-0.06204527, -0.4262204, -3.066858, 0, 1, 0.7058824, 1,
-0.06044651, 0.6073478, -0.307378, 0, 1, 0.7137255, 1,
-0.06024503, -1.0691, -0.8458265, 0, 1, 0.7176471, 1,
-0.05903304, 1.783826, -1.268432, 0, 1, 0.7254902, 1,
-0.04228423, 0.8224207, 1.037465, 0, 1, 0.7294118, 1,
-0.03955365, 0.2990628, 0.09687889, 0, 1, 0.7372549, 1,
-0.03926065, 0.3091689, -0.1007082, 0, 1, 0.7411765, 1,
-0.03709847, 1.082508, -1.039351, 0, 1, 0.7490196, 1,
-0.03345557, 0.6205072, -0.1913518, 0, 1, 0.7529412, 1,
-0.03193866, 0.001901804, -1.728832, 0, 1, 0.7607843, 1,
-0.0248455, 1.88236, -0.4182464, 0, 1, 0.7647059, 1,
-0.02031521, 0.1322051, -1.402491, 0, 1, 0.772549, 1,
-0.01894853, 1.586292, 0.01911221, 0, 1, 0.7764706, 1,
-0.01793768, -0.663721, -2.260656, 0, 1, 0.7843137, 1,
-0.01653973, -0.03180867, -2.131293, 0, 1, 0.7882353, 1,
-0.01472501, -0.4424133, -2.506908, 0, 1, 0.7960784, 1,
-0.006889618, 0.8768168, 0.870722, 0, 1, 0.8039216, 1,
-0.004062044, 1.473743, 0.02129652, 0, 1, 0.8078431, 1,
-0.004014593, -0.8240948, -3.821586, 0, 1, 0.8156863, 1,
0.00237742, 0.9569572, 0.8650081, 0, 1, 0.8196079, 1,
0.004070839, 0.04097964, 0.02057301, 0, 1, 0.827451, 1,
0.006054823, 0.466585, -0.3847679, 0, 1, 0.8313726, 1,
0.007296873, 0.9573311, 0.132979, 0, 1, 0.8392157, 1,
0.01339953, -0.6978276, 1.956739, 0, 1, 0.8431373, 1,
0.01469492, 0.2152167, 1.85515, 0, 1, 0.8509804, 1,
0.01667976, -0.3577177, 2.854308, 0, 1, 0.854902, 1,
0.01847018, -0.7401367, 2.349151, 0, 1, 0.8627451, 1,
0.01870091, 0.5694283, -0.1037529, 0, 1, 0.8666667, 1,
0.01924558, 0.4947239, -0.7470064, 0, 1, 0.8745098, 1,
0.01952499, 0.3739966, 0.2759958, 0, 1, 0.8784314, 1,
0.02089188, 0.01104255, 0.3386477, 0, 1, 0.8862745, 1,
0.02311851, 1.420646, -0.7014782, 0, 1, 0.8901961, 1,
0.02370621, -0.1027262, 1.750572, 0, 1, 0.8980392, 1,
0.02870704, -1.087975, 2.316838, 0, 1, 0.9058824, 1,
0.03269929, 1.290698, -0.7385871, 0, 1, 0.9098039, 1,
0.03529624, 0.2318306, 0.3757043, 0, 1, 0.9176471, 1,
0.03753838, 1.288222, -1.751414, 0, 1, 0.9215686, 1,
0.0376115, -1.379683, 4.228777, 0, 1, 0.9294118, 1,
0.04222653, -1.018037, 2.535969, 0, 1, 0.9333333, 1,
0.04466113, 0.01537475, 1.92531, 0, 1, 0.9411765, 1,
0.04762362, 0.9309543, 1.162236, 0, 1, 0.945098, 1,
0.0478892, 0.8406181, -1.3409, 0, 1, 0.9529412, 1,
0.04791565, 1.539641, -0.3910144, 0, 1, 0.9568627, 1,
0.04822138, 0.8577062, -0.3095012, 0, 1, 0.9647059, 1,
0.04922831, 0.2188469, 0.2397879, 0, 1, 0.9686275, 1,
0.05144356, -0.2911767, 1.699571, 0, 1, 0.9764706, 1,
0.05618978, -1.185724, 3.469665, 0, 1, 0.9803922, 1,
0.0573496, 0.547172, 0.9633443, 0, 1, 0.9882353, 1,
0.05768874, -1.147399, 4.286883, 0, 1, 0.9921569, 1,
0.06563156, 1.148299, 0.2515297, 0, 1, 1, 1,
0.06573953, -1.013523, 2.994216, 0, 0.9921569, 1, 1,
0.06938746, -0.3097517, 3.340656, 0, 0.9882353, 1, 1,
0.07093767, -1.961345, 3.226904, 0, 0.9803922, 1, 1,
0.07115514, -1.126645, 2.515198, 0, 0.9764706, 1, 1,
0.07392935, 0.9167336, -0.501822, 0, 0.9686275, 1, 1,
0.0799979, 2.237717, -0.9207129, 0, 0.9647059, 1, 1,
0.08178003, -0.09018774, 0.7776946, 0, 0.9568627, 1, 1,
0.08337319, 0.4067149, 1.978194, 0, 0.9529412, 1, 1,
0.08511803, -1.048213, 3.49129, 0, 0.945098, 1, 1,
0.08722764, 0.1805784, -0.6170355, 0, 0.9411765, 1, 1,
0.0904887, -0.6354541, 2.437771, 0, 0.9333333, 1, 1,
0.0918491, -1.164586, 2.789244, 0, 0.9294118, 1, 1,
0.0936786, -0.4185296, 3.782115, 0, 0.9215686, 1, 1,
0.09555538, -0.375077, 3.580032, 0, 0.9176471, 1, 1,
0.1114666, 0.3479461, -0.3696131, 0, 0.9098039, 1, 1,
0.1129704, -1.424085, 3.677396, 0, 0.9058824, 1, 1,
0.1225227, 1.458249, 0.3353288, 0, 0.8980392, 1, 1,
0.1236257, -0.3766207, 3.492981, 0, 0.8901961, 1, 1,
0.1249756, 0.7709368, 1.005171, 0, 0.8862745, 1, 1,
0.1285917, 0.762463, 2.170863, 0, 0.8784314, 1, 1,
0.1307494, 0.907756, 0.5175025, 0, 0.8745098, 1, 1,
0.1312996, -1.292574, 6.640666, 0, 0.8666667, 1, 1,
0.1330163, -0.6710692, 3.505398, 0, 0.8627451, 1, 1,
0.13874, -1.36525, 1.421168, 0, 0.854902, 1, 1,
0.1415942, -0.4767299, 3.176765, 0, 0.8509804, 1, 1,
0.1419002, 1.443467, 0.6281301, 0, 0.8431373, 1, 1,
0.142004, 2.30916, 0.2295499, 0, 0.8392157, 1, 1,
0.1425966, 0.2768407, 1.16786, 0, 0.8313726, 1, 1,
0.1436708, 0.406701, 1.100076, 0, 0.827451, 1, 1,
0.1449863, 0.8379661, 1.096582, 0, 0.8196079, 1, 1,
0.1461538, -0.7829762, 2.536029, 0, 0.8156863, 1, 1,
0.1461782, 1.110897, -1.289997, 0, 0.8078431, 1, 1,
0.1582497, -2.250756, 2.614108, 0, 0.8039216, 1, 1,
0.160042, 0.6208344, -0.00486719, 0, 0.7960784, 1, 1,
0.1615655, -1.307573, 3.776251, 0, 0.7882353, 1, 1,
0.1685001, 1.038573, 0.05697336, 0, 0.7843137, 1, 1,
0.1686249, -0.5527456, 1.618347, 0, 0.7764706, 1, 1,
0.1718842, 0.03029263, 1.279478, 0, 0.772549, 1, 1,
0.1728019, -0.02100821, 2.965534, 0, 0.7647059, 1, 1,
0.1773251, -0.5599286, 2.441771, 0, 0.7607843, 1, 1,
0.1787032, 0.7104386, -0.1605523, 0, 0.7529412, 1, 1,
0.180436, 0.2365026, -1.494612, 0, 0.7490196, 1, 1,
0.1809662, -0.06179213, 1.873994, 0, 0.7411765, 1, 1,
0.1813652, -0.1047058, 1.599945, 0, 0.7372549, 1, 1,
0.1828685, 0.3139663, 0.6908755, 0, 0.7294118, 1, 1,
0.183296, 0.7896438, 0.808655, 0, 0.7254902, 1, 1,
0.1836333, 0.002711566, 1.485401, 0, 0.7176471, 1, 1,
0.1847562, 0.3359419, 0.1261875, 0, 0.7137255, 1, 1,
0.1863647, 1.357191, 0.9916078, 0, 0.7058824, 1, 1,
0.1920088, 1.019336, -0.9779409, 0, 0.6980392, 1, 1,
0.1952324, 0.2866008, 0.6086919, 0, 0.6941177, 1, 1,
0.1954393, 1.012881, -0.2739444, 0, 0.6862745, 1, 1,
0.1960589, -0.7381033, 2.176833, 0, 0.682353, 1, 1,
0.1981654, 0.1994477, 0.5123463, 0, 0.6745098, 1, 1,
0.199083, -1.14464, 3.047664, 0, 0.6705883, 1, 1,
0.2001377, -1.075384, 1.573315, 0, 0.6627451, 1, 1,
0.2025202, -1.061081, 1.810824, 0, 0.6588235, 1, 1,
0.2036525, 0.04561678, 0.704973, 0, 0.6509804, 1, 1,
0.2065183, 1.632688, 1.369332, 0, 0.6470588, 1, 1,
0.2085297, 1.079037, -1.101469, 0, 0.6392157, 1, 1,
0.2091345, 0.3636493, -1.379658, 0, 0.6352941, 1, 1,
0.2103159, 0.443612, 0.04422291, 0, 0.627451, 1, 1,
0.2120982, 0.456939, 0.09055447, 0, 0.6235294, 1, 1,
0.2131269, 1.04211, -0.7063803, 0, 0.6156863, 1, 1,
0.2147257, 0.09969366, 0.255057, 0, 0.6117647, 1, 1,
0.2176657, 1.253242, -1.540137, 0, 0.6039216, 1, 1,
0.2220401, 0.4454555, -0.5084292, 0, 0.5960785, 1, 1,
0.2267351, 0.9485604, -0.9407107, 0, 0.5921569, 1, 1,
0.2295803, -0.03323946, 1.191141, 0, 0.5843138, 1, 1,
0.2296096, 0.6443799, -0.8219556, 0, 0.5803922, 1, 1,
0.2321547, -1.553941, 2.465951, 0, 0.572549, 1, 1,
0.2343865, -0.8311142, 0.8817842, 0, 0.5686275, 1, 1,
0.2380974, 0.6584224, 0.1178092, 0, 0.5607843, 1, 1,
0.2395609, 0.7338585, 0.9104829, 0, 0.5568628, 1, 1,
0.2397268, -0.4926468, 1.49674, 0, 0.5490196, 1, 1,
0.2445141, -0.07461664, 2.0182, 0, 0.5450981, 1, 1,
0.2470997, 0.2387435, 0.6832527, 0, 0.5372549, 1, 1,
0.2486854, 0.3545938, 0.975679, 0, 0.5333334, 1, 1,
0.2510549, -1.059211, 3.418638, 0, 0.5254902, 1, 1,
0.2540046, 0.2775346, 0.4449272, 0, 0.5215687, 1, 1,
0.2546834, -0.9213022, 1.197793, 0, 0.5137255, 1, 1,
0.2569564, 0.5052418, -0.07456314, 0, 0.509804, 1, 1,
0.2570305, -1.061268, 2.74331, 0, 0.5019608, 1, 1,
0.2619629, 1.432733, 0.9387617, 0, 0.4941176, 1, 1,
0.2625982, 0.1742966, 2.21024, 0, 0.4901961, 1, 1,
0.2646431, -0.8382002, 2.367193, 0, 0.4823529, 1, 1,
0.265485, 0.4043405, 0.2641514, 0, 0.4784314, 1, 1,
0.2665791, 0.6226061, -0.3636239, 0, 0.4705882, 1, 1,
0.2734343, -1.255019, 2.584686, 0, 0.4666667, 1, 1,
0.2794648, 1.562839, 0.07025388, 0, 0.4588235, 1, 1,
0.2847715, 0.7008744, -0.001067592, 0, 0.454902, 1, 1,
0.2848109, 2.240086, -0.8394183, 0, 0.4470588, 1, 1,
0.2854213, -0.2311955, 2.996236, 0, 0.4431373, 1, 1,
0.2895253, -0.05930876, 0.9840341, 0, 0.4352941, 1, 1,
0.2896828, -1.138126, 2.164118, 0, 0.4313726, 1, 1,
0.291032, -0.9491672, 2.17374, 0, 0.4235294, 1, 1,
0.2949274, -0.7653849, 4.450336, 0, 0.4196078, 1, 1,
0.295324, -1.487355, 3.658621, 0, 0.4117647, 1, 1,
0.3031673, 1.027194, 0.8369867, 0, 0.4078431, 1, 1,
0.3037271, 0.258734, 0.399466, 0, 0.4, 1, 1,
0.3067026, -1.982834, 2.716621, 0, 0.3921569, 1, 1,
0.3073464, -0.2320783, 1.756777, 0, 0.3882353, 1, 1,
0.3085198, -0.1139153, 2.121956, 0, 0.3803922, 1, 1,
0.3113007, 0.2044296, 0.855768, 0, 0.3764706, 1, 1,
0.3137575, 0.7776521, -0.6501798, 0, 0.3686275, 1, 1,
0.313976, 0.7086346, 1.049853, 0, 0.3647059, 1, 1,
0.3166396, -0.3134883, 1.674251, 0, 0.3568628, 1, 1,
0.3181463, -0.9590095, 3.128788, 0, 0.3529412, 1, 1,
0.3203197, 0.261253, 2.819749, 0, 0.345098, 1, 1,
0.3210917, 0.6054885, -0.445247, 0, 0.3411765, 1, 1,
0.3221311, 0.7403885, 0.7393432, 0, 0.3333333, 1, 1,
0.3240881, 0.3449885, 1.018439, 0, 0.3294118, 1, 1,
0.3279649, 0.9524347, -0.704969, 0, 0.3215686, 1, 1,
0.3287053, 0.7589136, 0.4037444, 0, 0.3176471, 1, 1,
0.3349748, -0.3404906, 0.7098684, 0, 0.3098039, 1, 1,
0.3354799, 0.4983891, 0.02190967, 0, 0.3058824, 1, 1,
0.3484762, 1.097595, 0.8505334, 0, 0.2980392, 1, 1,
0.3492828, 0.06372607, 2.590026, 0, 0.2901961, 1, 1,
0.3506298, -0.09224939, 0.9444295, 0, 0.2862745, 1, 1,
0.3516881, 0.2072167, -0.2871084, 0, 0.2784314, 1, 1,
0.3530471, -0.6410395, 2.970082, 0, 0.2745098, 1, 1,
0.3563903, -1.36023, 1.786901, 0, 0.2666667, 1, 1,
0.3584355, 0.08809206, 0.5589546, 0, 0.2627451, 1, 1,
0.3607752, 0.1529606, -0.01961608, 0, 0.254902, 1, 1,
0.3634717, -0.08283203, -0.4509137, 0, 0.2509804, 1, 1,
0.3677538, -1.412214, 2.965256, 0, 0.2431373, 1, 1,
0.3726673, -1.613724, 3.411671, 0, 0.2392157, 1, 1,
0.3741202, -0.7915682, 2.804613, 0, 0.2313726, 1, 1,
0.3753985, -0.07587173, 1.509893, 0, 0.227451, 1, 1,
0.3766234, 0.4780957, 0.3606935, 0, 0.2196078, 1, 1,
0.39062, -0.3254605, 2.120757, 0, 0.2156863, 1, 1,
0.3976059, -1.00342, 2.201632, 0, 0.2078431, 1, 1,
0.3977822, -1.505603, 2.594853, 0, 0.2039216, 1, 1,
0.3980847, -0.572512, 3.465964, 0, 0.1960784, 1, 1,
0.4015658, -1.760925, 3.565195, 0, 0.1882353, 1, 1,
0.4048842, 1.441298, 0.8616043, 0, 0.1843137, 1, 1,
0.4055993, -0.8593376, 3.508827, 0, 0.1764706, 1, 1,
0.4101641, 0.6066956, 1.520588, 0, 0.172549, 1, 1,
0.4109223, 1.289445, 2.703456, 0, 0.1647059, 1, 1,
0.4156563, 0.1775382, 0.8537102, 0, 0.1607843, 1, 1,
0.4157693, -0.1148823, 1.222553, 0, 0.1529412, 1, 1,
0.4185584, -0.3934537, 2.949463, 0, 0.1490196, 1, 1,
0.4187611, 0.1583881, 1.269878, 0, 0.1411765, 1, 1,
0.4201735, 0.2439547, 2.509155, 0, 0.1372549, 1, 1,
0.4209324, -1.007576, 3.404231, 0, 0.1294118, 1, 1,
0.4279886, 0.424453, 1.557586, 0, 0.1254902, 1, 1,
0.4372885, -0.5110536, 1.92868, 0, 0.1176471, 1, 1,
0.4386756, 0.6508812, 0.4038408, 0, 0.1137255, 1, 1,
0.4458862, -1.186116, 2.216999, 0, 0.1058824, 1, 1,
0.4461783, 1.178148, 0.9842736, 0, 0.09803922, 1, 1,
0.4469498, -0.2534265, 2.590869, 0, 0.09411765, 1, 1,
0.4473668, -1.370013, 2.651024, 0, 0.08627451, 1, 1,
0.4480641, -1.117867, 2.990439, 0, 0.08235294, 1, 1,
0.4485076, 0.4814351, -0.5689648, 0, 0.07450981, 1, 1,
0.4569127, 0.8335444, 1.929496, 0, 0.07058824, 1, 1,
0.4570096, 0.1904718, 2.575056, 0, 0.0627451, 1, 1,
0.4590816, 1.221897, 0.09573078, 0, 0.05882353, 1, 1,
0.4592313, -0.863257, 2.462739, 0, 0.05098039, 1, 1,
0.4594009, 0.6835055, 1.359422, 0, 0.04705882, 1, 1,
0.4621226, -0.3831626, 2.809733, 0, 0.03921569, 1, 1,
0.4625873, 0.8626202, 1.388421, 0, 0.03529412, 1, 1,
0.4650573, 0.8531244, 0.1566082, 0, 0.02745098, 1, 1,
0.4670267, -0.8549811, 2.718726, 0, 0.02352941, 1, 1,
0.4692643, -0.2322104, 2.649127, 0, 0.01568628, 1, 1,
0.469994, -0.2780509, 3.020377, 0, 0.01176471, 1, 1,
0.4731695, -0.2532733, 2.587283, 0, 0.003921569, 1, 1,
0.4747519, 1.349248, 0.04982284, 0.003921569, 0, 1, 1,
0.4758781, -0.4126846, 2.132735, 0.007843138, 0, 1, 1,
0.4766269, -1.04581, 2.831882, 0.01568628, 0, 1, 1,
0.4778385, -0.630043, 2.297614, 0.01960784, 0, 1, 1,
0.4792467, 1.052124, 0.9546788, 0.02745098, 0, 1, 1,
0.4841551, 0.3076797, 0.7446638, 0.03137255, 0, 1, 1,
0.4892158, -0.3518369, 2.882659, 0.03921569, 0, 1, 1,
0.4905512, -0.8875414, 4.151853, 0.04313726, 0, 1, 1,
0.4915774, -0.3835204, 1.500885, 0.05098039, 0, 1, 1,
0.4947822, -0.6785845, 2.772132, 0.05490196, 0, 1, 1,
0.505425, 0.6073513, -1.240926, 0.0627451, 0, 1, 1,
0.5060304, -0.8667786, 1.890735, 0.06666667, 0, 1, 1,
0.507223, 0.3479402, 1.051151, 0.07450981, 0, 1, 1,
0.5081759, -0.008277175, 3.348874, 0.07843138, 0, 1, 1,
0.5087489, 0.96334, 0.07566534, 0.08627451, 0, 1, 1,
0.5129938, -0.3260464, 2.149291, 0.09019608, 0, 1, 1,
0.5148245, -1.259933, 3.098272, 0.09803922, 0, 1, 1,
0.5167508, 1.720518, 0.7956596, 0.1058824, 0, 1, 1,
0.5204404, 1.493231, 0.9071028, 0.1098039, 0, 1, 1,
0.5224773, -0.5099637, 0.01102497, 0.1176471, 0, 1, 1,
0.5255347, 0.1047473, 0.9952371, 0.1215686, 0, 1, 1,
0.5286077, 1.899025, -1.369378, 0.1294118, 0, 1, 1,
0.5336729, -0.5915878, 1.833309, 0.1333333, 0, 1, 1,
0.5374164, 0.9280856, 1.580966, 0.1411765, 0, 1, 1,
0.5390539, 1.236879, 1.02476, 0.145098, 0, 1, 1,
0.5409181, 0.2878636, -0.5378918, 0.1529412, 0, 1, 1,
0.541059, -1.183262, 3.524964, 0.1568628, 0, 1, 1,
0.5445596, -1.434535, 3.890421, 0.1647059, 0, 1, 1,
0.5485492, 1.141617, 1.374242, 0.1686275, 0, 1, 1,
0.5494456, -1.425991, 2.823134, 0.1764706, 0, 1, 1,
0.5510439, 1.464349, 0.8638636, 0.1803922, 0, 1, 1,
0.5526462, -0.7113332, 4.503406, 0.1882353, 0, 1, 1,
0.5550171, -0.2486115, 3.18409, 0.1921569, 0, 1, 1,
0.5566578, -0.9666544, 1.368873, 0.2, 0, 1, 1,
0.5656456, -1.530454, 2.6113, 0.2078431, 0, 1, 1,
0.5662459, -0.9168409, 1.2429, 0.2117647, 0, 1, 1,
0.5693046, -1.000307, 2.38684, 0.2196078, 0, 1, 1,
0.5723876, 0.8861232, 1.38897, 0.2235294, 0, 1, 1,
0.5740234, 0.09599737, 3.803435, 0.2313726, 0, 1, 1,
0.5846686, 1.352144, 0.2357851, 0.2352941, 0, 1, 1,
0.5880624, 0.6191297, 2.330954, 0.2431373, 0, 1, 1,
0.5899761, -0.9485326, 2.358515, 0.2470588, 0, 1, 1,
0.5922031, 1.829686, 0.06018578, 0.254902, 0, 1, 1,
0.5951451, -0.7653161, 2.217199, 0.2588235, 0, 1, 1,
0.6026858, -1.344919, 0.8732011, 0.2666667, 0, 1, 1,
0.619568, 0.5156801, 1.818389, 0.2705882, 0, 1, 1,
0.6210027, -0.1831193, -0.399783, 0.2784314, 0, 1, 1,
0.6224182, 1.101772, 0.5773812, 0.282353, 0, 1, 1,
0.6248803, -0.8997188, 4.454092, 0.2901961, 0, 1, 1,
0.6305355, 0.4665993, 1.627069, 0.2941177, 0, 1, 1,
0.6314154, -0.4127765, 2.302997, 0.3019608, 0, 1, 1,
0.6316005, 1.409054, -1.452778, 0.3098039, 0, 1, 1,
0.6334456, 0.106902, 1.136739, 0.3137255, 0, 1, 1,
0.6346039, 0.8685954, -1.007488, 0.3215686, 0, 1, 1,
0.6381986, -1.793426, 2.448901, 0.3254902, 0, 1, 1,
0.6400427, 0.6883478, 0.7543709, 0.3333333, 0, 1, 1,
0.6478105, -1.54083, 3.343941, 0.3372549, 0, 1, 1,
0.65549, 1.199077, 1.219428, 0.345098, 0, 1, 1,
0.655994, -1.150995, 3.13432, 0.3490196, 0, 1, 1,
0.6591581, -0.4385358, 2.67919, 0.3568628, 0, 1, 1,
0.6608098, -0.4273557, 2.306098, 0.3607843, 0, 1, 1,
0.6642445, -0.7851657, 1.560781, 0.3686275, 0, 1, 1,
0.6644295, 1.947696, -0.8996694, 0.372549, 0, 1, 1,
0.6661001, -1.460129, 2.618415, 0.3803922, 0, 1, 1,
0.6682341, -0.7809318, 3.485915, 0.3843137, 0, 1, 1,
0.6687971, -0.2628683, 0.9895133, 0.3921569, 0, 1, 1,
0.6755235, -1.908656, 3.102194, 0.3960784, 0, 1, 1,
0.6780968, 0.3508423, 2.964717, 0.4039216, 0, 1, 1,
0.6813073, 0.03427918, 2.18922, 0.4117647, 0, 1, 1,
0.681873, -0.04308221, 0.2127081, 0.4156863, 0, 1, 1,
0.6828839, -0.9819188, 1.491379, 0.4235294, 0, 1, 1,
0.6831286, 1.124895, 1.774966, 0.427451, 0, 1, 1,
0.683777, 0.9207481, 0.5438704, 0.4352941, 0, 1, 1,
0.6857297, 1.108473, 0.5598023, 0.4392157, 0, 1, 1,
0.6870207, -0.5058919, 2.624991, 0.4470588, 0, 1, 1,
0.6921198, -0.6658606, 3.650486, 0.4509804, 0, 1, 1,
0.6922962, 0.6143253, 2.170925, 0.4588235, 0, 1, 1,
0.6935375, -0.5240358, 1.464488, 0.4627451, 0, 1, 1,
0.6959366, -2.035293, 2.976777, 0.4705882, 0, 1, 1,
0.6967522, -2.911323, 2.894722, 0.4745098, 0, 1, 1,
0.7026585, 0.5217651, 0.8181418, 0.4823529, 0, 1, 1,
0.7030373, 0.1807689, 0.504357, 0.4862745, 0, 1, 1,
0.7055561, 1.457963, -0.13695, 0.4941176, 0, 1, 1,
0.7066061, 1.043411, 1.089369, 0.5019608, 0, 1, 1,
0.7079208, -1.305352, 2.168567, 0.5058824, 0, 1, 1,
0.7180833, 0.9871525, 1.427271, 0.5137255, 0, 1, 1,
0.7182517, 0.8602692, -0.715073, 0.5176471, 0, 1, 1,
0.718672, 0.3943804, 0.4096327, 0.5254902, 0, 1, 1,
0.722682, 1.205271, -0.6517091, 0.5294118, 0, 1, 1,
0.7259325, 0.8421816, 0.2470274, 0.5372549, 0, 1, 1,
0.7266592, -1.798036, 1.080188, 0.5411765, 0, 1, 1,
0.7281936, -1.198585, 3.916633, 0.5490196, 0, 1, 1,
0.7373089, -0.07950965, 1.667814, 0.5529412, 0, 1, 1,
0.7373291, 0.8820317, 1.480835, 0.5607843, 0, 1, 1,
0.7383338, 0.5759203, 0.2492554, 0.5647059, 0, 1, 1,
0.7459902, -0.5220491, 3.575821, 0.572549, 0, 1, 1,
0.7466893, -1.454151, 3.601524, 0.5764706, 0, 1, 1,
0.7531322, -0.2123197, 2.463516, 0.5843138, 0, 1, 1,
0.7538406, -0.3055328, 0.8857044, 0.5882353, 0, 1, 1,
0.7581182, -0.5641596, 2.195456, 0.5960785, 0, 1, 1,
0.7630036, 0.3359101, 0.8573598, 0.6039216, 0, 1, 1,
0.7651571, -0.6347129, 2.526251, 0.6078432, 0, 1, 1,
0.766538, 0.3023633, 2.135522, 0.6156863, 0, 1, 1,
0.7670464, -2.005026, 3.371026, 0.6196079, 0, 1, 1,
0.7708666, 0.03065956, 1.640521, 0.627451, 0, 1, 1,
0.779453, 2.509904, -0.08103845, 0.6313726, 0, 1, 1,
0.7804304, -0.4552257, 1.897775, 0.6392157, 0, 1, 1,
0.7813427, -1.508681, 0.657859, 0.6431373, 0, 1, 1,
0.7958072, -2.145163, 2.804147, 0.6509804, 0, 1, 1,
0.7970092, 0.04135013, 1.930626, 0.654902, 0, 1, 1,
0.8086666, -0.2096273, 1.227595, 0.6627451, 0, 1, 1,
0.8125772, -0.8539073, 3.460782, 0.6666667, 0, 1, 1,
0.8179178, 0.5285441, 0.9468343, 0.6745098, 0, 1, 1,
0.8210531, 0.377182, 1.219255, 0.6784314, 0, 1, 1,
0.8264381, 0.808032, 0.2560575, 0.6862745, 0, 1, 1,
0.830305, 0.06974088, 0.6262186, 0.6901961, 0, 1, 1,
0.8322548, 0.2638949, 2.344352, 0.6980392, 0, 1, 1,
0.8333828, -0.3277591, 2.911612, 0.7058824, 0, 1, 1,
0.8342984, -1.38201, 0.9321394, 0.7098039, 0, 1, 1,
0.8347963, -0.2555204, -0.5323363, 0.7176471, 0, 1, 1,
0.8365061, 0.3116057, 0.3626724, 0.7215686, 0, 1, 1,
0.8368077, 0.03104914, 1.670197, 0.7294118, 0, 1, 1,
0.8394729, 0.7521999, 0.6113461, 0.7333333, 0, 1, 1,
0.8530116, 1.604784, 2.932849, 0.7411765, 0, 1, 1,
0.8553777, -0.5002167, 2.268591, 0.7450981, 0, 1, 1,
0.8560176, -0.3363797, 2.308877, 0.7529412, 0, 1, 1,
0.8582641, -0.04706373, 0.729869, 0.7568628, 0, 1, 1,
0.8587503, -0.2989785, 2.69633, 0.7647059, 0, 1, 1,
0.8661313, -0.07945193, 1.550547, 0.7686275, 0, 1, 1,
0.8727057, -0.2903476, 3.149779, 0.7764706, 0, 1, 1,
0.8739271, 1.03072, 2.081331, 0.7803922, 0, 1, 1,
0.877421, 1.725328, 0.1707976, 0.7882353, 0, 1, 1,
0.8791993, 2.234887, -0.3567912, 0.7921569, 0, 1, 1,
0.8799084, 1.701967, 0.1523579, 0.8, 0, 1, 1,
0.8824748, 1.158681, 2.581136, 0.8078431, 0, 1, 1,
0.8940856, 0.8644037, -0.03448285, 0.8117647, 0, 1, 1,
0.8956797, -0.5228572, 1.913243, 0.8196079, 0, 1, 1,
0.8972985, -1.361989, 0.6918495, 0.8235294, 0, 1, 1,
0.9036395, -1.049754, 1.845136, 0.8313726, 0, 1, 1,
0.9072886, 0.4783355, 1.524529, 0.8352941, 0, 1, 1,
0.9159946, 0.8527876, -0.3687006, 0.8431373, 0, 1, 1,
0.9203033, -0.6821545, 0.7312416, 0.8470588, 0, 1, 1,
0.9330796, -0.2191354, 1.089623, 0.854902, 0, 1, 1,
0.9332438, 1.119678, -0.2601126, 0.8588235, 0, 1, 1,
0.9347332, -0.1751366, 1.47931, 0.8666667, 0, 1, 1,
0.9351978, -0.3728158, 2.081061, 0.8705882, 0, 1, 1,
0.9364625, 0.745288, 1.708864, 0.8784314, 0, 1, 1,
0.9426893, 0.3102353, -0.117282, 0.8823529, 0, 1, 1,
0.9430144, 1.431568, 2.051182, 0.8901961, 0, 1, 1,
0.9435957, 0.8006976, -0.07979297, 0.8941177, 0, 1, 1,
0.9438378, 0.3918991, 0.9641552, 0.9019608, 0, 1, 1,
0.9445605, 0.5794101, -0.07166877, 0.9098039, 0, 1, 1,
0.9451291, -0.6257808, 0.3897145, 0.9137255, 0, 1, 1,
0.946907, 2.182717, -1.570412, 0.9215686, 0, 1, 1,
0.9595416, 0.543603, 2.147736, 0.9254902, 0, 1, 1,
0.9623116, 0.8473699, -0.1106466, 0.9333333, 0, 1, 1,
0.9637665, 0.2628329, 2.053342, 0.9372549, 0, 1, 1,
0.9673985, 1.370964, -0.6787795, 0.945098, 0, 1, 1,
0.9692596, -1.030647, 0.05435195, 0.9490196, 0, 1, 1,
0.9713059, -0.2784245, 0.5874757, 0.9568627, 0, 1, 1,
0.9783904, 0.5643727, -0.7589116, 0.9607843, 0, 1, 1,
0.9831313, 0.4401574, 1.624315, 0.9686275, 0, 1, 1,
0.9918075, -0.4857372, 1.240335, 0.972549, 0, 1, 1,
0.9939904, -0.7259672, 2.02898, 0.9803922, 0, 1, 1,
0.9972324, 0.1493317, 1.933172, 0.9843137, 0, 1, 1,
0.9999437, 0.3996477, -0.02835112, 0.9921569, 0, 1, 1,
1.000608, -2.774441, 2.065169, 0.9960784, 0, 1, 1,
1.002791, -0.7595843, 1.831588, 1, 0, 0.9960784, 1,
1.004617, -0.750709, 1.714887, 1, 0, 0.9882353, 1,
1.008044, 0.1231473, 1.442537, 1, 0, 0.9843137, 1,
1.008818, -0.7946119, 3.332068, 1, 0, 0.9764706, 1,
1.011787, -0.8957198, 4.03728, 1, 0, 0.972549, 1,
1.01774, 1.191381, 1.575874, 1, 0, 0.9647059, 1,
1.023804, -0.5467649, 3.677087, 1, 0, 0.9607843, 1,
1.025678, -0.02054709, 0.5771306, 1, 0, 0.9529412, 1,
1.026952, -0.9094561, 3.177227, 1, 0, 0.9490196, 1,
1.027843, -1.80667, 3.560675, 1, 0, 0.9411765, 1,
1.028443, 0.159457, 1.164259, 1, 0, 0.9372549, 1,
1.028725, -0.2109013, 2.080171, 1, 0, 0.9294118, 1,
1.034624, -0.6951308, 1.279582, 1, 0, 0.9254902, 1,
1.042021, -1.435349, 1.42711, 1, 0, 0.9176471, 1,
1.047293, -0.1013772, 1.646446, 1, 0, 0.9137255, 1,
1.048888, 1.330541, 1.572877, 1, 0, 0.9058824, 1,
1.055934, -1.198703, 2.933591, 1, 0, 0.9019608, 1,
1.058018, 0.3972551, -0.5280892, 1, 0, 0.8941177, 1,
1.061516, -0.05448843, 1.828176, 1, 0, 0.8862745, 1,
1.068063, -0.2562776, 2.610455, 1, 0, 0.8823529, 1,
1.071058, 0.2335475, 1.808632, 1, 0, 0.8745098, 1,
1.074702, 1.181181, 1.449476, 1, 0, 0.8705882, 1,
1.077049, -0.186621, 1.15582, 1, 0, 0.8627451, 1,
1.077086, -0.126901, 1.793495, 1, 0, 0.8588235, 1,
1.078873, -0.4851528, 1.936721, 1, 0, 0.8509804, 1,
1.08153, 0.8964993, 1.275936, 1, 0, 0.8470588, 1,
1.084409, -0.5895071, 2.390121, 1, 0, 0.8392157, 1,
1.089534, 0.3531848, 2.23237, 1, 0, 0.8352941, 1,
1.092639, -0.964197, 3.349614, 1, 0, 0.827451, 1,
1.094455, -1.465081, 3.039529, 1, 0, 0.8235294, 1,
1.094774, -0.578076, 2.067204, 1, 0, 0.8156863, 1,
1.098353, -1.327785, 2.547811, 1, 0, 0.8117647, 1,
1.102744, -0.1466566, 2.047807, 1, 0, 0.8039216, 1,
1.103711, 0.04652344, 4.298217, 1, 0, 0.7960784, 1,
1.109039, 0.9852101, 0.163741, 1, 0, 0.7921569, 1,
1.109918, 0.1151664, -0.7740622, 1, 0, 0.7843137, 1,
1.110646, 0.9504798, 0.1977084, 1, 0, 0.7803922, 1,
1.112952, 0.4230245, -0.3533961, 1, 0, 0.772549, 1,
1.12431, -0.3173604, 1.707992, 1, 0, 0.7686275, 1,
1.127705, -0.456588, 2.793721, 1, 0, 0.7607843, 1,
1.129755, -0.6679287, 1.552388, 1, 0, 0.7568628, 1,
1.131358, -1.42712, 3.250895, 1, 0, 0.7490196, 1,
1.135219, -0.9160524, 1.195374, 1, 0, 0.7450981, 1,
1.142655, -0.5717968, 1.911072, 1, 0, 0.7372549, 1,
1.143519, -0.8742222, 2.562015, 1, 0, 0.7333333, 1,
1.145307, -0.3012633, 1.20901, 1, 0, 0.7254902, 1,
1.146397, 0.2484396, -0.370003, 1, 0, 0.7215686, 1,
1.148062, 2.243065, 0.08495898, 1, 0, 0.7137255, 1,
1.148062, 0.37734, 2.499464, 1, 0, 0.7098039, 1,
1.152861, 1.398425, 0.6331198, 1, 0, 0.7019608, 1,
1.153701, -0.9854461, 2.835058, 1, 0, 0.6941177, 1,
1.15667, -1.218603, 4.623295, 1, 0, 0.6901961, 1,
1.161754, -1.219184, 2.62459, 1, 0, 0.682353, 1,
1.163721, -1.363558, 3.025043, 1, 0, 0.6784314, 1,
1.168197, 1.424651, -0.0399554, 1, 0, 0.6705883, 1,
1.172628, -0.1463288, 2.869483, 1, 0, 0.6666667, 1,
1.174112, -0.1604313, 1.688504, 1, 0, 0.6588235, 1,
1.176383, -2.569849, 0.9103762, 1, 0, 0.654902, 1,
1.180814, 0.7169388, 2.21231, 1, 0, 0.6470588, 1,
1.183368, 0.2530254, 4.072074, 1, 0, 0.6431373, 1,
1.188154, -0.3907773, 2.279602, 1, 0, 0.6352941, 1,
1.194222, -1.506664, 2.898395, 1, 0, 0.6313726, 1,
1.197478, 0.4712548, 0.9047756, 1, 0, 0.6235294, 1,
1.199054, -1.792923, 2.632247, 1, 0, 0.6196079, 1,
1.200891, -1.131819, 0.05806499, 1, 0, 0.6117647, 1,
1.206202, 0.4699353, 1.034381, 1, 0, 0.6078432, 1,
1.20967, -0.8590401, 1.825359, 1, 0, 0.6, 1,
1.222181, -0.6265278, 1.129114, 1, 0, 0.5921569, 1,
1.224249, 0.1662231, 1.55113, 1, 0, 0.5882353, 1,
1.22845, -0.6833887, 1.2901, 1, 0, 0.5803922, 1,
1.230744, -1.08342, 3.846642, 1, 0, 0.5764706, 1,
1.232211, 0.6791093, 2.516384, 1, 0, 0.5686275, 1,
1.255991, -0.4726736, 2.645196, 1, 0, 0.5647059, 1,
1.256581, -1.945847, 3.520884, 1, 0, 0.5568628, 1,
1.260442, -1.055314, 2.845894, 1, 0, 0.5529412, 1,
1.267509, -1.360882, 2.172525, 1, 0, 0.5450981, 1,
1.27087, -0.6311451, 1.126583, 1, 0, 0.5411765, 1,
1.275552, -0.458584, 3.161484, 1, 0, 0.5333334, 1,
1.275932, -0.3725314, 1.239524, 1, 0, 0.5294118, 1,
1.278557, 0.8748432, 1.043199, 1, 0, 0.5215687, 1,
1.281465, -0.5967321, 2.220489, 1, 0, 0.5176471, 1,
1.294482, -0.6355633, 0.6568457, 1, 0, 0.509804, 1,
1.29514, 1.579981, -0.6396574, 1, 0, 0.5058824, 1,
1.312906, -0.7994344, 3.242532, 1, 0, 0.4980392, 1,
1.317119, 0.2065717, 1.45284, 1, 0, 0.4901961, 1,
1.321072, 1.382269, 1.770858, 1, 0, 0.4862745, 1,
1.323823, 0.04836126, 2.183818, 1, 0, 0.4784314, 1,
1.324545, -1.200798, 4.83771, 1, 0, 0.4745098, 1,
1.325253, -2.794905, 2.82201, 1, 0, 0.4666667, 1,
1.326618, 0.9556345, -0.8051494, 1, 0, 0.4627451, 1,
1.331041, 1.839638, 0.8169078, 1, 0, 0.454902, 1,
1.341149, -0.2721786, 1.699911, 1, 0, 0.4509804, 1,
1.344431, -1.288846, 2.6886, 1, 0, 0.4431373, 1,
1.349932, -1.310542, 2.598523, 1, 0, 0.4392157, 1,
1.352298, -0.124609, 3.344633, 1, 0, 0.4313726, 1,
1.354852, -0.5366055, 3.407769, 1, 0, 0.427451, 1,
1.359837, -0.6861757, 1.969131, 1, 0, 0.4196078, 1,
1.361807, 1.087284, 0.9562758, 1, 0, 0.4156863, 1,
1.372907, -2.115405, 2.331182, 1, 0, 0.4078431, 1,
1.37385, 0.7248846, -0.1168314, 1, 0, 0.4039216, 1,
1.376384, 1.377236, 2.391542, 1, 0, 0.3960784, 1,
1.376467, 0.7293621, 0.8954334, 1, 0, 0.3882353, 1,
1.393652, -0.5674282, 0.8344107, 1, 0, 0.3843137, 1,
1.395187, 1.183509, 1.092086, 1, 0, 0.3764706, 1,
1.39966, 0.1157625, 1.035802, 1, 0, 0.372549, 1,
1.412914, -1.252348, 0.3523184, 1, 0, 0.3647059, 1,
1.415651, -0.580139, 1.737281, 1, 0, 0.3607843, 1,
1.431007, 0.7205499, 0.6874827, 1, 0, 0.3529412, 1,
1.437145, -2.130996, 2.362837, 1, 0, 0.3490196, 1,
1.43773, 1.405736, 1.331826, 1, 0, 0.3411765, 1,
1.438462, 1.48849, 1.240676, 1, 0, 0.3372549, 1,
1.463024, 0.07667424, 2.260568, 1, 0, 0.3294118, 1,
1.484162, -0.5281023, 2.125866, 1, 0, 0.3254902, 1,
1.484799, 1.320657, 0.923825, 1, 0, 0.3176471, 1,
1.500995, -1.756119, 3.337013, 1, 0, 0.3137255, 1,
1.502148, 0.008633948, 2.168339, 1, 0, 0.3058824, 1,
1.504416, 0.1832589, 1.488694, 1, 0, 0.2980392, 1,
1.519816, 0.4582197, 2.149498, 1, 0, 0.2941177, 1,
1.524305, 0.3357855, 1.564393, 1, 0, 0.2862745, 1,
1.54065, 1.107208, 1.8355, 1, 0, 0.282353, 1,
1.543585, 1.011479, -0.1829912, 1, 0, 0.2745098, 1,
1.563032, 0.271947, 1.837816, 1, 0, 0.2705882, 1,
1.568438, 0.6665633, 0.1737248, 1, 0, 0.2627451, 1,
1.569787, 1.538152, 2.853392, 1, 0, 0.2588235, 1,
1.569875, 0.1089721, 1.984839, 1, 0, 0.2509804, 1,
1.572185, -1.626348, 2.309774, 1, 0, 0.2470588, 1,
1.577166, 0.8389254, 0.7251725, 1, 0, 0.2392157, 1,
1.581141, -0.5645289, 1.608509, 1, 0, 0.2352941, 1,
1.60987, 0.640018, 1.874741, 1, 0, 0.227451, 1,
1.613625, 1.762917, 1.41711, 1, 0, 0.2235294, 1,
1.639037, -0.4136842, 0.4471304, 1, 0, 0.2156863, 1,
1.697611, 0.7357838, 1.994466, 1, 0, 0.2117647, 1,
1.704849, 0.3099391, 1.276199, 1, 0, 0.2039216, 1,
1.729701, 0.2939285, 0.009849506, 1, 0, 0.1960784, 1,
1.748082, -0.7804121, 1.254072, 1, 0, 0.1921569, 1,
1.761188, -1.33944, 1.980339, 1, 0, 0.1843137, 1,
1.769472, -1.17983, 1.539182, 1, 0, 0.1803922, 1,
1.855639, 1.255539, 1.071604, 1, 0, 0.172549, 1,
1.903076, -0.0284042, 1.655308, 1, 0, 0.1686275, 1,
1.905778, -1.465807, 3.04683, 1, 0, 0.1607843, 1,
1.917323, -0.2798861, 0.8702369, 1, 0, 0.1568628, 1,
1.928709, 0.4971755, 2.484471, 1, 0, 0.1490196, 1,
1.945567, 0.3320441, 1.664959, 1, 0, 0.145098, 1,
1.952276, -0.3586328, 2.063503, 1, 0, 0.1372549, 1,
1.962441, 0.6284762, 3.424141, 1, 0, 0.1333333, 1,
1.978497, 2.014605, 0.7052979, 1, 0, 0.1254902, 1,
1.995753, 1.231837, 0.3648781, 1, 0, 0.1215686, 1,
2.000151, -0.4536102, 1.827434, 1, 0, 0.1137255, 1,
2.009982, 1.353075, 0.3946727, 1, 0, 0.1098039, 1,
2.016459, 1.130659, -0.7219708, 1, 0, 0.1019608, 1,
2.026423, -1.251619, 2.559215, 1, 0, 0.09411765, 1,
2.068729, -0.3425919, 2.462337, 1, 0, 0.09019608, 1,
2.130847, 1.669379, 1.451031, 1, 0, 0.08235294, 1,
2.179555, 0.6453602, 1.557582, 1, 0, 0.07843138, 1,
2.225039, -0.7380693, 3.323982, 1, 0, 0.07058824, 1,
2.267212, 1.021616, 2.092939, 1, 0, 0.06666667, 1,
2.27123, 0.9644586, 1.267952, 1, 0, 0.05882353, 1,
2.305703, -0.02946414, 3.132627, 1, 0, 0.05490196, 1,
2.338969, -0.3760641, 2.558463, 1, 0, 0.04705882, 1,
2.372747, 0.5410765, -0.5094745, 1, 0, 0.04313726, 1,
2.426508, -0.08675627, 0.742599, 1, 0, 0.03529412, 1,
2.440161, 0.3877511, 0.8556277, 1, 0, 0.03137255, 1,
2.444031, -0.4592927, 2.885093, 1, 0, 0.02352941, 1,
2.589727, -1.441301, 2.728387, 1, 0, 0.01960784, 1,
2.59112, 1.367901, 1.095181, 1, 0, 0.01176471, 1,
2.978634, -0.1968187, 2.923199, 1, 0, 0.007843138, 1
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
-0.5653588, -3.830221, -7.508639, 0, -0.5, 0.5, 0.5,
-0.5653588, -3.830221, -7.508639, 1, -0.5, 0.5, 0.5,
-0.5653588, -3.830221, -7.508639, 1, 1.5, 0.5, 0.5,
-0.5653588, -3.830221, -7.508639, 0, 1.5, 0.5, 0.5
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
-5.310765, -0.2007096, -7.508639, 0, -0.5, 0.5, 0.5,
-5.310765, -0.2007096, -7.508639, 1, -0.5, 0.5, 0.5,
-5.310765, -0.2007096, -7.508639, 1, 1.5, 0.5, 0.5,
-5.310765, -0.2007096, -7.508639, 0, 1.5, 0.5, 0.5
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
-5.310765, -3.830221, 0.5913692, 0, -0.5, 0.5, 0.5,
-5.310765, -3.830221, 0.5913692, 1, -0.5, 0.5, 0.5,
-5.310765, -3.830221, 0.5913692, 1, 1.5, 0.5, 0.5,
-5.310765, -3.830221, 0.5913692, 0, 1.5, 0.5, 0.5
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
-4, -2.992641, -5.639407,
2, -2.992641, -5.639407,
-4, -2.992641, -5.639407,
-4, -3.132238, -5.950945,
-2, -2.992641, -5.639407,
-2, -3.132238, -5.950945,
0, -2.992641, -5.639407,
0, -3.132238, -5.950945,
2, -2.992641, -5.639407,
2, -3.132238, -5.950945
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
"-4",
"-2",
"0",
"2"
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
-4, -3.411431, -6.574023, 0, -0.5, 0.5, 0.5,
-4, -3.411431, -6.574023, 1, -0.5, 0.5, 0.5,
-4, -3.411431, -6.574023, 1, 1.5, 0.5, 0.5,
-4, -3.411431, -6.574023, 0, 1.5, 0.5, 0.5,
-2, -3.411431, -6.574023, 0, -0.5, 0.5, 0.5,
-2, -3.411431, -6.574023, 1, -0.5, 0.5, 0.5,
-2, -3.411431, -6.574023, 1, 1.5, 0.5, 0.5,
-2, -3.411431, -6.574023, 0, 1.5, 0.5, 0.5,
0, -3.411431, -6.574023, 0, -0.5, 0.5, 0.5,
0, -3.411431, -6.574023, 1, -0.5, 0.5, 0.5,
0, -3.411431, -6.574023, 1, 1.5, 0.5, 0.5,
0, -3.411431, -6.574023, 0, 1.5, 0.5, 0.5,
2, -3.411431, -6.574023, 0, -0.5, 0.5, 0.5,
2, -3.411431, -6.574023, 1, -0.5, 0.5, 0.5,
2, -3.411431, -6.574023, 1, 1.5, 0.5, 0.5,
2, -3.411431, -6.574023, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.215671, -2, -5.639407,
-4.215671, 2, -5.639407,
-4.215671, -2, -5.639407,
-4.398187, -2, -5.950945,
-4.215671, -1, -5.639407,
-4.398187, -1, -5.950945,
-4.215671, 0, -5.639407,
-4.398187, 0, -5.950945,
-4.215671, 1, -5.639407,
-4.398187, 1, -5.950945,
-4.215671, 2, -5.639407,
-4.398187, 2, -5.950945
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
"-1",
"0",
"1",
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
-4.763218, -2, -6.574023, 0, -0.5, 0.5, 0.5,
-4.763218, -2, -6.574023, 1, -0.5, 0.5, 0.5,
-4.763218, -2, -6.574023, 1, 1.5, 0.5, 0.5,
-4.763218, -2, -6.574023, 0, 1.5, 0.5, 0.5,
-4.763218, -1, -6.574023, 0, -0.5, 0.5, 0.5,
-4.763218, -1, -6.574023, 1, -0.5, 0.5, 0.5,
-4.763218, -1, -6.574023, 1, 1.5, 0.5, 0.5,
-4.763218, -1, -6.574023, 0, 1.5, 0.5, 0.5,
-4.763218, 0, -6.574023, 0, -0.5, 0.5, 0.5,
-4.763218, 0, -6.574023, 1, -0.5, 0.5, 0.5,
-4.763218, 0, -6.574023, 1, 1.5, 0.5, 0.5,
-4.763218, 0, -6.574023, 0, 1.5, 0.5, 0.5,
-4.763218, 1, -6.574023, 0, -0.5, 0.5, 0.5,
-4.763218, 1, -6.574023, 1, -0.5, 0.5, 0.5,
-4.763218, 1, -6.574023, 1, 1.5, 0.5, 0.5,
-4.763218, 1, -6.574023, 0, 1.5, 0.5, 0.5,
-4.763218, 2, -6.574023, 0, -0.5, 0.5, 0.5,
-4.763218, 2, -6.574023, 1, -0.5, 0.5, 0.5,
-4.763218, 2, -6.574023, 1, 1.5, 0.5, 0.5,
-4.763218, 2, -6.574023, 0, 1.5, 0.5, 0.5
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
-4.215671, -2.992641, -4,
-4.215671, -2.992641, 6,
-4.215671, -2.992641, -4,
-4.398187, -3.132238, -4,
-4.215671, -2.992641, -2,
-4.398187, -3.132238, -2,
-4.215671, -2.992641, 0,
-4.398187, -3.132238, 0,
-4.215671, -2.992641, 2,
-4.398187, -3.132238, 2,
-4.215671, -2.992641, 4,
-4.398187, -3.132238, 4,
-4.215671, -2.992641, 6,
-4.398187, -3.132238, 6
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
"4",
"6"
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
-4.763218, -3.411431, -4, 0, -0.5, 0.5, 0.5,
-4.763218, -3.411431, -4, 1, -0.5, 0.5, 0.5,
-4.763218, -3.411431, -4, 1, 1.5, 0.5, 0.5,
-4.763218, -3.411431, -4, 0, 1.5, 0.5, 0.5,
-4.763218, -3.411431, -2, 0, -0.5, 0.5, 0.5,
-4.763218, -3.411431, -2, 1, -0.5, 0.5, 0.5,
-4.763218, -3.411431, -2, 1, 1.5, 0.5, 0.5,
-4.763218, -3.411431, -2, 0, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 0, 0, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 0, 1, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 0, 1, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 0, 0, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 2, 0, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 2, 1, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 2, 1, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 2, 0, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 4, 0, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 4, 1, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 4, 1, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 4, 0, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 6, 0, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 6, 1, -0.5, 0.5, 0.5,
-4.763218, -3.411431, 6, 1, 1.5, 0.5, 0.5,
-4.763218, -3.411431, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-4.215671, -2.992641, -5.639407,
-4.215671, 2.591222, -5.639407,
-4.215671, -2.992641, 6.822145,
-4.215671, 2.591222, 6.822145,
-4.215671, -2.992641, -5.639407,
-4.215671, -2.992641, 6.822145,
-4.215671, 2.591222, -5.639407,
-4.215671, 2.591222, 6.822145,
-4.215671, -2.992641, -5.639407,
3.084953, -2.992641, -5.639407,
-4.215671, -2.992641, 6.822145,
3.084953, -2.992641, 6.822145,
-4.215671, 2.591222, -5.639407,
3.084953, 2.591222, -5.639407,
-4.215671, 2.591222, 6.822145,
3.084953, 2.591222, 6.822145,
3.084953, -2.992641, -5.639407,
3.084953, 2.591222, -5.639407,
3.084953, -2.992641, 6.822145,
3.084953, 2.591222, 6.822145,
3.084953, -2.992641, -5.639407,
3.084953, -2.992641, 6.822145,
3.084953, 2.591222, -5.639407,
3.084953, 2.591222, 6.822145
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
var radius = 8.268408;
var distance = 36.78708;
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
mvMatrix.translate( 0.5653588, 0.2007096, -0.5913692 );
mvMatrix.scale( 1.224548, 1.601036, 0.7174038 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.78708);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
NOXA<-read.table("NOXA.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-NOXA$V2
```

```
## Error in eval(expr, envir, enclos): object 'NOXA' not found
```

```r
y<-NOXA$V3
```

```
## Error in eval(expr, envir, enclos): object 'NOXA' not found
```

```r
z<-NOXA$V4
```

```
## Error in eval(expr, envir, enclos): object 'NOXA' not found
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
-4.109351, -0.2335904, -0.8559208, 0, 0, 1, 1, 1,
-2.919139, -0.7029966, -1.913227, 1, 0, 0, 1, 1,
-2.887899, -1.380728, -1.146847, 1, 0, 0, 1, 1,
-2.668059, -1.068287, -1.531846, 1, 0, 0, 1, 1,
-2.573846, 2.25354, -3.009933, 1, 0, 0, 1, 1,
-2.375729, 0.8395644, -0.2365651, 1, 0, 0, 1, 1,
-2.366851, 0.9511339, -2.550496, 0, 0, 0, 1, 1,
-2.276299, -0.2337713, -2.235271, 0, 0, 0, 1, 1,
-2.224838, 1.360068, -0.5443184, 0, 0, 0, 1, 1,
-2.204353, 0.5732422, -2.49622, 0, 0, 0, 1, 1,
-2.197161, 1.383118, -0.1721863, 0, 0, 0, 1, 1,
-2.195877, 0.04488997, -2.917206, 0, 0, 0, 1, 1,
-2.170931, 1.331999, -0.5757649, 0, 0, 0, 1, 1,
-2.170576, -0.05413431, 0.03205769, 1, 1, 1, 1, 1,
-2.157277, -0.4381304, -2.288188, 1, 1, 1, 1, 1,
-2.045901, -1.140359, -1.475229, 1, 1, 1, 1, 1,
-2.01801, -0.9104839, -2.067902, 1, 1, 1, 1, 1,
-1.966581, -0.5726791, -1.205927, 1, 1, 1, 1, 1,
-1.944427, 0.4135777, -1.445412, 1, 1, 1, 1, 1,
-1.91275, -0.8230084, -1.471794, 1, 1, 1, 1, 1,
-1.909694, 0.8561614, -0.8560985, 1, 1, 1, 1, 1,
-1.848879, -0.2803783, -1.777676, 1, 1, 1, 1, 1,
-1.840769, 0.4731982, -1.898993, 1, 1, 1, 1, 1,
-1.82813, 0.5979826, -1.419032, 1, 1, 1, 1, 1,
-1.82336, 0.3057775, -1.558746, 1, 1, 1, 1, 1,
-1.816863, -1.557745, -2.165688, 1, 1, 1, 1, 1,
-1.772671, -0.3268169, -1.340284, 1, 1, 1, 1, 1,
-1.760718, 1.810756, -2.020204, 1, 1, 1, 1, 1,
-1.75962, -0.4334441, -2.079255, 0, 0, 1, 1, 1,
-1.756186, -0.07831652, -0.205915, 1, 0, 0, 1, 1,
-1.725484, -1.102136, -1.510451, 1, 0, 0, 1, 1,
-1.710098, 0.4711346, 0.2422561, 1, 0, 0, 1, 1,
-1.692287, -0.9001651, -0.5385942, 1, 0, 0, 1, 1,
-1.68565, 0.4011112, 0.3142405, 1, 0, 0, 1, 1,
-1.679873, 0.9386021, -1.700835, 0, 0, 0, 1, 1,
-1.666796, -0.1849563, -1.277165, 0, 0, 0, 1, 1,
-1.664055, -1.508564, -0.9854206, 0, 0, 0, 1, 1,
-1.658262, 1.024836, -0.6058767, 0, 0, 0, 1, 1,
-1.649363, -0.2515276, -2.096723, 0, 0, 0, 1, 1,
-1.638317, -1.313416, -3.279046, 0, 0, 0, 1, 1,
-1.637398, 0.0738425, -2.000016, 0, 0, 0, 1, 1,
-1.620236, 0.2477854, -0.5577699, 1, 1, 1, 1, 1,
-1.593847, 0.670515, -1.811619, 1, 1, 1, 1, 1,
-1.566071, 1.013232, 0.956928, 1, 1, 1, 1, 1,
-1.559389, 0.8277586, -1.54395, 1, 1, 1, 1, 1,
-1.558347, -0.1297302, -0.9724571, 1, 1, 1, 1, 1,
-1.530646, -1.485844, -2.857038, 1, 1, 1, 1, 1,
-1.526681, 0.8794426, -0.9860551, 1, 1, 1, 1, 1,
-1.524965, 0.4210591, -0.8451374, 1, 1, 1, 1, 1,
-1.514133, -0.2952413, -2.394501, 1, 1, 1, 1, 1,
-1.512801, -0.7893755, -3.569744, 1, 1, 1, 1, 1,
-1.507738, -0.3400827, -1.238758, 1, 1, 1, 1, 1,
-1.503858, 0.9986559, -2.336296, 1, 1, 1, 1, 1,
-1.490034, 0.2119321, -2.095459, 1, 1, 1, 1, 1,
-1.488346, 0.7932894, -1.579176, 1, 1, 1, 1, 1,
-1.483001, 0.02740482, -3.430929, 1, 1, 1, 1, 1,
-1.46781, -0.457104, -1.217957, 0, 0, 1, 1, 1,
-1.466448, -0.3494352, 0.5152187, 1, 0, 0, 1, 1,
-1.445583, 0.8824739, -0.8884882, 1, 0, 0, 1, 1,
-1.431988, -0.4429596, -0.4583684, 1, 0, 0, 1, 1,
-1.422243, -0.399427, -1.434647, 1, 0, 0, 1, 1,
-1.421966, -0.8901064, -2.119661, 1, 0, 0, 1, 1,
-1.416613, -0.5101827, -3.45651, 0, 0, 0, 1, 1,
-1.399849, -0.01245393, -3.970319, 0, 0, 0, 1, 1,
-1.397634, 0.9115276, -2.709812, 0, 0, 0, 1, 1,
-1.39213, -0.8770105, -2.01707, 0, 0, 0, 1, 1,
-1.391251, -1.836412, -3.755982, 0, 0, 0, 1, 1,
-1.378881, -1.103492, -1.83169, 0, 0, 0, 1, 1,
-1.377874, 0.4306484, -2.095423, 0, 0, 0, 1, 1,
-1.370605, -0.2989288, -1.541532, 1, 1, 1, 1, 1,
-1.367687, -2.021594, -2.372292, 1, 1, 1, 1, 1,
-1.365221, -0.7886556, -1.823494, 1, 1, 1, 1, 1,
-1.362246, -1.206759, -2.606773, 1, 1, 1, 1, 1,
-1.359978, -0.6679832, -3.024197, 1, 1, 1, 1, 1,
-1.358416, 1.784428, -1.998484, 1, 1, 1, 1, 1,
-1.353152, -0.168531, -0.1245442, 1, 1, 1, 1, 1,
-1.343183, 0.3984248, -1.976231, 1, 1, 1, 1, 1,
-1.34036, 0.9561706, -2.258153, 1, 1, 1, 1, 1,
-1.338834, -0.704435, -1.913201, 1, 1, 1, 1, 1,
-1.330753, -1.753415, -2.173129, 1, 1, 1, 1, 1,
-1.330724, 0.9251804, -2.1045, 1, 1, 1, 1, 1,
-1.325496, -0.5356432, -1.89073, 1, 1, 1, 1, 1,
-1.324842, 0.4394596, -2.818687, 1, 1, 1, 1, 1,
-1.324041, 1.55891, -1.183831, 1, 1, 1, 1, 1,
-1.321291, 0.06100805, -0.4339578, 0, 0, 1, 1, 1,
-1.301064, -1.089603, -0.9128416, 1, 0, 0, 1, 1,
-1.299602, 0.2505834, -2.588864, 1, 0, 0, 1, 1,
-1.296066, 0.02410033, -0.9715497, 1, 0, 0, 1, 1,
-1.295919, -0.1487162, -3.026217, 1, 0, 0, 1, 1,
-1.289715, -0.4792005, -3.285641, 1, 0, 0, 1, 1,
-1.280535, 0.2784134, -1.044677, 0, 0, 0, 1, 1,
-1.272625, -1.121954, -2.977949, 0, 0, 0, 1, 1,
-1.271584, 0.01405529, -1.468324, 0, 0, 0, 1, 1,
-1.266914, 0.7738343, -1.815673, 0, 0, 0, 1, 1,
-1.26222, -0.1823008, -0.1008488, 0, 0, 0, 1, 1,
-1.241379, -1.578022, -0.6243438, 0, 0, 0, 1, 1,
-1.241206, -0.936816, -2.469276, 0, 0, 0, 1, 1,
-1.22105, 1.145049, -0.6628655, 1, 1, 1, 1, 1,
-1.212912, 0.2169794, -0.08934999, 1, 1, 1, 1, 1,
-1.212726, 1.239129, -1.154038, 1, 1, 1, 1, 1,
-1.202469, 0.4710249, -1.505427, 1, 1, 1, 1, 1,
-1.19911, 0.6915945, -0.3489489, 1, 1, 1, 1, 1,
-1.195094, -0.7247902, -1.868328, 1, 1, 1, 1, 1,
-1.194142, -0.0359539, -0.1347316, 1, 1, 1, 1, 1,
-1.193286, -0.1302856, -0.4375354, 1, 1, 1, 1, 1,
-1.188496, -0.3057391, -1.572491, 1, 1, 1, 1, 1,
-1.188003, 0.2173132, -2.746797, 1, 1, 1, 1, 1,
-1.184704, -0.295626, -1.797315, 1, 1, 1, 1, 1,
-1.181816, 0.2534221, -1.602046, 1, 1, 1, 1, 1,
-1.17828, -0.7805716, -2.812865, 1, 1, 1, 1, 1,
-1.175468, -0.4262445, -2.097301, 1, 1, 1, 1, 1,
-1.172227, 2.197707, -0.3461173, 1, 1, 1, 1, 1,
-1.166831, -0.7728425, -2.240975, 0, 0, 1, 1, 1,
-1.165083, 0.6398951, -1.573805, 1, 0, 0, 1, 1,
-1.163858, 0.3254396, -1.994044, 1, 0, 0, 1, 1,
-1.161577, -0.5387616, -2.856624, 1, 0, 0, 1, 1,
-1.158615, -0.7380214, -2.158965, 1, 0, 0, 1, 1,
-1.139151, 0.668194, -2.458313, 1, 0, 0, 1, 1,
-1.13308, -0.6731213, -2.860519, 0, 0, 0, 1, 1,
-1.124081, 0.9868242, -2.996384, 0, 0, 0, 1, 1,
-1.119982, 1.718378, 0.01535422, 0, 0, 0, 1, 1,
-1.113392, 0.9264763, -1.536291, 0, 0, 0, 1, 1,
-1.112577, 0.03099832, -0.7192721, 0, 0, 0, 1, 1,
-1.104497, 0.31492, -1.751807, 0, 0, 0, 1, 1,
-1.100493, 0.9560004, -1.191863, 0, 0, 0, 1, 1,
-1.098637, 0.6176911, 0.3752292, 1, 1, 1, 1, 1,
-1.094132, -0.5125751, -1.973443, 1, 1, 1, 1, 1,
-1.091069, -0.6777226, -1.525826, 1, 1, 1, 1, 1,
-1.085029, -0.7733685, -1.888906, 1, 1, 1, 1, 1,
-1.082914, -1.258841, -1.961591, 1, 1, 1, 1, 1,
-1.08234, 0.4562185, -1.24214, 1, 1, 1, 1, 1,
-1.080935, -1.589178, -3.841252, 1, 1, 1, 1, 1,
-1.079409, 1.833162, -1.089296, 1, 1, 1, 1, 1,
-1.078584, 2.086812, -1.533373, 1, 1, 1, 1, 1,
-1.078185, 0.362075, 1.02136, 1, 1, 1, 1, 1,
-1.066727, -0.2424423, -1.507873, 1, 1, 1, 1, 1,
-1.066161, 0.24294, -0.9131302, 1, 1, 1, 1, 1,
-1.062639, 0.1214248, -0.3385223, 1, 1, 1, 1, 1,
-1.053643, -1.347658, -2.273939, 1, 1, 1, 1, 1,
-1.050047, 0.5524951, -1.366063, 1, 1, 1, 1, 1,
-1.049935, -1.659248, -1.686337, 0, 0, 1, 1, 1,
-1.049388, 1.208264, 0.5060901, 1, 0, 0, 1, 1,
-1.045716, 1.728171, -0.1146619, 1, 0, 0, 1, 1,
-1.045382, -1.006954, -2.967901, 1, 0, 0, 1, 1,
-1.040197, 1.188846, -1.813389, 1, 0, 0, 1, 1,
-1.034095, 0.1690045, -1.545531, 1, 0, 0, 1, 1,
-1.031457, 0.6386298, -3.357804, 0, 0, 0, 1, 1,
-1.025464, -0.476028, -1.108459, 0, 0, 0, 1, 1,
-1.024732, 1.306154, -1.650851, 0, 0, 0, 1, 1,
-1.024034, -0.6933267, -2.099081, 0, 0, 0, 1, 1,
-1.023692, 0.5146613, -0.05196388, 0, 0, 0, 1, 1,
-1.023552, 0.5384154, -1.478161, 0, 0, 0, 1, 1,
-1.02313, 0.575914, -2.768052, 0, 0, 0, 1, 1,
-1.023042, 0.09355222, -2.132949, 1, 1, 1, 1, 1,
-1.022538, -1.369123, -2.434019, 1, 1, 1, 1, 1,
-1.020624, -0.1973983, -3.05441, 1, 1, 1, 1, 1,
-1.019572, 0.2061237, -1.623341, 1, 1, 1, 1, 1,
-1.01655, -0.4111487, -0.467584, 1, 1, 1, 1, 1,
-1.01377, 1.788992, 0.4466542, 1, 1, 1, 1, 1,
-1.013184, -0.8948755, -3.559323, 1, 1, 1, 1, 1,
-1.012281, 0.950035, -0.4868246, 1, 1, 1, 1, 1,
-1.010794, 0.614261, -1.244836, 1, 1, 1, 1, 1,
-1.001555, -0.01706823, -3.153645, 1, 1, 1, 1, 1,
-1.001042, 0.2043806, -2.073055, 1, 1, 1, 1, 1,
-0.9943493, -0.6534777, -0.4462451, 1, 1, 1, 1, 1,
-0.9932442, -0.8721477, -2.672115, 1, 1, 1, 1, 1,
-0.9923456, 1.021583, -2.14309, 1, 1, 1, 1, 1,
-0.9921761, -0.8562764, -3.976755, 1, 1, 1, 1, 1,
-0.9827066, 0.7576781, -2.292819, 0, 0, 1, 1, 1,
-0.9763103, 0.1298583, -0.1670931, 1, 0, 0, 1, 1,
-0.9743314, -0.005156542, -1.888855, 1, 0, 0, 1, 1,
-0.9738695, 1.915189, -0.4843572, 1, 0, 0, 1, 1,
-0.9724107, 1.71352, -0.1906921, 1, 0, 0, 1, 1,
-0.9681281, 0.6958975, 0.2020034, 1, 0, 0, 1, 1,
-0.9674235, 0.2222571, -0.07473321, 0, 0, 0, 1, 1,
-0.9643875, 0.7183522, -0.9007686, 0, 0, 0, 1, 1,
-0.953771, -0.1596722, -1.595354, 0, 0, 0, 1, 1,
-0.9498576, 0.6528797, -1.324582, 0, 0, 0, 1, 1,
-0.9481049, 0.3671779, -2.055338, 0, 0, 0, 1, 1,
-0.9471327, 0.12142, -2.688778, 0, 0, 0, 1, 1,
-0.9426532, 0.9923227, -1.804316, 0, 0, 0, 1, 1,
-0.9362413, 1.809045, 2.141527, 1, 1, 1, 1, 1,
-0.9345545, -1.370557, -2.981134, 1, 1, 1, 1, 1,
-0.9184919, -0.3026247, -1.42127, 1, 1, 1, 1, 1,
-0.9180623, -1.219189, -3.009836, 1, 1, 1, 1, 1,
-0.9142157, -0.3921171, -1.202982, 1, 1, 1, 1, 1,
-0.9111176, 1.059571, -0.5974982, 1, 1, 1, 1, 1,
-0.9073275, -1.155672, -2.500921, 1, 1, 1, 1, 1,
-0.9045458, -0.9673332, -2.782507, 1, 1, 1, 1, 1,
-0.8973004, 0.02646693, -1.308894, 1, 1, 1, 1, 1,
-0.8966466, -0.4210438, -1.808246, 1, 1, 1, 1, 1,
-0.8954628, 0.6511311, 0.353974, 1, 1, 1, 1, 1,
-0.8917781, -1.067822, -1.965177, 1, 1, 1, 1, 1,
-0.8895126, 0.5664898, -0.253094, 1, 1, 1, 1, 1,
-0.8849322, 0.2276565, -0.4540307, 1, 1, 1, 1, 1,
-0.8811508, 1.263544, -0.9928889, 1, 1, 1, 1, 1,
-0.8790259, 1.686108, -0.1647195, 0, 0, 1, 1, 1,
-0.8767607, 0.3470901, -1.781436, 1, 0, 0, 1, 1,
-0.8749127, 0.232747, -0.8433751, 1, 0, 0, 1, 1,
-0.8742194, 1.047021, -0.8013493, 1, 0, 0, 1, 1,
-0.8692665, -0.7104678, -1.61949, 1, 0, 0, 1, 1,
-0.8646631, 0.07131899, -1.211645, 1, 0, 0, 1, 1,
-0.861129, 1.996016, 1.286973, 0, 0, 0, 1, 1,
-0.8587486, 1.302332, -1.460666, 0, 0, 0, 1, 1,
-0.8584673, 0.1008238, 0.05196583, 0, 0, 0, 1, 1,
-0.8579074, 0.765761, -1.940027, 0, 0, 0, 1, 1,
-0.8549972, -0.2275292, -1.767482, 0, 0, 0, 1, 1,
-0.8538097, -0.7486881, -3.569356, 0, 0, 0, 1, 1,
-0.8491123, -0.1681584, -0.5703368, 0, 0, 0, 1, 1,
-0.8475633, 1.082357, -1.156825, 1, 1, 1, 1, 1,
-0.8473007, -0.4509252, -2.732943, 1, 1, 1, 1, 1,
-0.8396454, 2.303806, -1.9026, 1, 1, 1, 1, 1,
-0.8365043, 0.7082893, -0.8872085, 1, 1, 1, 1, 1,
-0.8364582, 0.1250668, -0.4542747, 1, 1, 1, 1, 1,
-0.8341843, -0.9433397, -1.22228, 1, 1, 1, 1, 1,
-0.8220884, 0.2537646, -1.974817, 1, 1, 1, 1, 1,
-0.8008009, 1.471653, -0.7036859, 1, 1, 1, 1, 1,
-0.7954925, 1.486254, 0.5400575, 1, 1, 1, 1, 1,
-0.785331, -0.9971663, -3.084904, 1, 1, 1, 1, 1,
-0.7835448, -0.9100175, -1.924075, 1, 1, 1, 1, 1,
-0.7818175, -0.09023243, -2.658863, 1, 1, 1, 1, 1,
-0.7804776, -1.192462, -1.534221, 1, 1, 1, 1, 1,
-0.7767767, -0.5933357, -0.7398648, 1, 1, 1, 1, 1,
-0.7728261, 0.3216443, 0.2876033, 1, 1, 1, 1, 1,
-0.7649105, -0.1006337, -1.966584, 0, 0, 1, 1, 1,
-0.7638112, 0.06748167, -0.5780232, 1, 0, 0, 1, 1,
-0.7612207, 0.2680515, -1.841899, 1, 0, 0, 1, 1,
-0.7570643, -0.9079263, -3.531801, 1, 0, 0, 1, 1,
-0.7541272, -0.1987205, -3.922373, 1, 0, 0, 1, 1,
-0.7456052, -1.472656, -1.559397, 1, 0, 0, 1, 1,
-0.744141, -0.4674874, -2.989511, 0, 0, 0, 1, 1,
-0.7434422, -0.8699124, -2.951599, 0, 0, 0, 1, 1,
-0.7424161, 0.1366909, -3.705038, 0, 0, 0, 1, 1,
-0.740555, -0.365027, -1.049145, 0, 0, 0, 1, 1,
-0.7348278, 0.1334043, -1.372323, 0, 0, 0, 1, 1,
-0.729462, -0.3064153, -1.80855, 0, 0, 0, 1, 1,
-0.7286936, -0.78991, -0.6402456, 0, 0, 0, 1, 1,
-0.7269131, 0.5709533, -1.969079, 1, 1, 1, 1, 1,
-0.7239357, 2.17498, 0.0765888, 1, 1, 1, 1, 1,
-0.7236237, -0.08751946, -1.268724, 1, 1, 1, 1, 1,
-0.7205704, 0.1104597, -1.786051, 1, 1, 1, 1, 1,
-0.7152275, 1.570121, -0.4325712, 1, 1, 1, 1, 1,
-0.7107464, 1.901345, -0.6391309, 1, 1, 1, 1, 1,
-0.7103199, 1.198852, -1.195668, 1, 1, 1, 1, 1,
-0.7059143, 1.340718, -0.5060467, 1, 1, 1, 1, 1,
-0.7051378, 0.4272262, 0.8322759, 1, 1, 1, 1, 1,
-0.7045569, 0.2001757, -0.6747932, 1, 1, 1, 1, 1,
-0.7027479, -0.6009114, -1.788711, 1, 1, 1, 1, 1,
-0.7007573, 0.6225362, -0.05906603, 1, 1, 1, 1, 1,
-0.6965195, -0.6405075, -2.132399, 1, 1, 1, 1, 1,
-0.6883894, -0.9640294, -2.466389, 1, 1, 1, 1, 1,
-0.6855999, 0.2556725, -2.107227, 1, 1, 1, 1, 1,
-0.6854108, 0.7574965, -0.8843369, 0, 0, 1, 1, 1,
-0.6851318, 0.3115729, 0.06973204, 1, 0, 0, 1, 1,
-0.6846918, 0.7823197, 0.5818715, 1, 0, 0, 1, 1,
-0.6824687, -1.75528, -1.76126, 1, 0, 0, 1, 1,
-0.6783143, -0.3573546, -2.7404, 1, 0, 0, 1, 1,
-0.6780685, 0.5744078, 0.7789359, 1, 0, 0, 1, 1,
-0.6726779, -0.5544096, -0.7035716, 0, 0, 0, 1, 1,
-0.672141, 0.8764198, -0.7735379, 0, 0, 0, 1, 1,
-0.6690885, 0.2257288, -0.9809988, 0, 0, 0, 1, 1,
-0.6653682, -1.482248, -2.359491, 0, 0, 0, 1, 1,
-0.665048, 0.5238366, -1.68768, 0, 0, 0, 1, 1,
-0.6584659, -1.273641, -3.553273, 0, 0, 0, 1, 1,
-0.6564476, 0.8261685, -1.570743, 0, 0, 0, 1, 1,
-0.6490361, -1.7337, -1.546981, 1, 1, 1, 1, 1,
-0.6431904, -0.03355718, -1.410718, 1, 1, 1, 1, 1,
-0.6392082, 0.8751535, 0.4257512, 1, 1, 1, 1, 1,
-0.633297, 0.7355611, -2.126736, 1, 1, 1, 1, 1,
-0.6315722, 0.4666457, -0.1939741, 1, 1, 1, 1, 1,
-0.6294273, 0.1798182, -0.8948754, 1, 1, 1, 1, 1,
-0.6272838, 1.176091, -2.268519, 1, 1, 1, 1, 1,
-0.6221772, -0.3457448, -0.8292183, 1, 1, 1, 1, 1,
-0.6211271, -0.6343338, -1.110955, 1, 1, 1, 1, 1,
-0.6199714, -1.558716, -2.894999, 1, 1, 1, 1, 1,
-0.6174567, -1.160957, -3.172842, 1, 1, 1, 1, 1,
-0.6121841, -0.6205807, 0.4221161, 1, 1, 1, 1, 1,
-0.6033685, 0.1503388, -0.8610034, 1, 1, 1, 1, 1,
-0.6011661, 1.310154, 0.03358028, 1, 1, 1, 1, 1,
-0.5981762, 1.200411, -0.1036162, 1, 1, 1, 1, 1,
-0.5972909, 0.1908541, -0.4825373, 0, 0, 1, 1, 1,
-0.5914442, -0.2768676, -1.674013, 1, 0, 0, 1, 1,
-0.5900934, -1.785478, -3.432553, 1, 0, 0, 1, 1,
-0.5885869, -0.4940836, -1.670907, 1, 0, 0, 1, 1,
-0.5864475, -1.659549, -3.202613, 1, 0, 0, 1, 1,
-0.5862036, 1.902568, -1.497474, 1, 0, 0, 1, 1,
-0.582015, -1.711877, -2.931228, 0, 0, 0, 1, 1,
-0.5769399, 0.5784115, -1.564192, 0, 0, 0, 1, 1,
-0.5708942, 1.839844, 0.5307627, 0, 0, 0, 1, 1,
-0.5708342, 0.3723298, -0.5568683, 0, 0, 0, 1, 1,
-0.570595, -0.2771217, -2.412937, 0, 0, 0, 1, 1,
-0.5688702, -1.273848, -1.825701, 0, 0, 0, 1, 1,
-0.5610314, -2.700153, -2.661905, 0, 0, 0, 1, 1,
-0.5528715, -0.5394235, -2.487436, 1, 1, 1, 1, 1,
-0.5518703, -1.577015, -2.537775, 1, 1, 1, 1, 1,
-0.5385748, -0.3577023, -2.327992, 1, 1, 1, 1, 1,
-0.5384529, -0.8914874, -3.005838, 1, 1, 1, 1, 1,
-0.5379967, -0.6817936, -2.050625, 1, 1, 1, 1, 1,
-0.5332965, -1.025364, -4.449608, 1, 1, 1, 1, 1,
-0.5332503, -0.907941, -3.691543, 1, 1, 1, 1, 1,
-0.5237866, 0.2413066, -1.525974, 1, 1, 1, 1, 1,
-0.5225201, -1.321746, -2.736798, 1, 1, 1, 1, 1,
-0.5201162, -0.04815611, -0.7756072, 1, 1, 1, 1, 1,
-0.5200295, 1.132766, -0.5225562, 1, 1, 1, 1, 1,
-0.5197898, 0.8799507, 0.08330009, 1, 1, 1, 1, 1,
-0.5169467, -0.6958944, -3.089793, 1, 1, 1, 1, 1,
-0.5158678, -1.45313, -1.776572, 1, 1, 1, 1, 1,
-0.5156965, 0.4049934, 0.9920028, 1, 1, 1, 1, 1,
-0.504608, 0.03804298, -1.063775, 0, 0, 1, 1, 1,
-0.5021007, 1.24937, 0.1098506, 1, 0, 0, 1, 1,
-0.5012328, 0.665057, 0.03408149, 1, 0, 0, 1, 1,
-0.5008767, 1.180747, 0.4369219, 1, 0, 0, 1, 1,
-0.4986007, -0.2219655, -2.354469, 1, 0, 0, 1, 1,
-0.4933148, 1.815069, -0.5977409, 1, 0, 0, 1, 1,
-0.4927424, 1.397811, -0.2798759, 0, 0, 0, 1, 1,
-0.4894837, -0.3349972, -2.630692, 0, 0, 0, 1, 1,
-0.4887661, 0.628002, -0.5266321, 0, 0, 0, 1, 1,
-0.4797107, -0.2358216, -1.496599, 0, 0, 0, 1, 1,
-0.4785227, -1.077535, -2.232781, 0, 0, 0, 1, 1,
-0.4776455, 0.8832319, -0.1035594, 0, 0, 0, 1, 1,
-0.4722293, 0.3643305, -0.01479642, 0, 0, 0, 1, 1,
-0.4606974, 0.5724032, -1.818266, 1, 1, 1, 1, 1,
-0.46026, -1.423787, -3.252928, 1, 1, 1, 1, 1,
-0.4597034, 1.274549, -0.8427269, 1, 1, 1, 1, 1,
-0.458378, 0.3040234, -0.6625831, 1, 1, 1, 1, 1,
-0.4508027, 0.1317411, -0.815419, 1, 1, 1, 1, 1,
-0.4468488, -1.040437, -2.021917, 1, 1, 1, 1, 1,
-0.4462753, -1.960892, -2.447014, 1, 1, 1, 1, 1,
-0.4373145, -0.8705236, -5.457928, 1, 1, 1, 1, 1,
-0.4362819, -0.4605148, -1.388949, 1, 1, 1, 1, 1,
-0.436149, 0.3045213, -1.518217, 1, 1, 1, 1, 1,
-0.4226319, 0.1103486, 0.0005375583, 1, 1, 1, 1, 1,
-0.4103409, 0.2013773, -0.6659313, 1, 1, 1, 1, 1,
-0.4079942, -0.1908025, -1.371272, 1, 1, 1, 1, 1,
-0.4057025, 0.5602615, 0.7854871, 1, 1, 1, 1, 1,
-0.4055474, -0.6000232, -2.334709, 1, 1, 1, 1, 1,
-0.3960742, -1.525695, -2.667195, 0, 0, 1, 1, 1,
-0.3903532, 0.6351029, 1.359138, 1, 0, 0, 1, 1,
-0.3888379, 0.1129709, -0.9458964, 1, 0, 0, 1, 1,
-0.3888172, 0.4274402, -1.555004, 1, 0, 0, 1, 1,
-0.3831568, -0.3821366, -1.600322, 1, 0, 0, 1, 1,
-0.3812954, -1.46175, -2.855607, 1, 0, 0, 1, 1,
-0.3774985, -0.1914598, -1.954199, 0, 0, 0, 1, 1,
-0.3753724, 0.4862665, -1.633817, 0, 0, 0, 1, 1,
-0.372274, 1.140609, 0.5631268, 0, 0, 0, 1, 1,
-0.3670231, -0.07954257, 0.02053853, 0, 0, 0, 1, 1,
-0.3615004, -0.322826, -1.402088, 0, 0, 0, 1, 1,
-0.3580715, -0.1154735, -3.696247, 0, 0, 0, 1, 1,
-0.3580424, -0.828982, -3.220134, 0, 0, 0, 1, 1,
-0.3517433, 1.986391, -0.7085079, 1, 1, 1, 1, 1,
-0.3455196, 0.3698462, -2.483582, 1, 1, 1, 1, 1,
-0.3417961, -0.125942, -1.787744, 1, 1, 1, 1, 1,
-0.3412766, -0.7018453, -0.833688, 1, 1, 1, 1, 1,
-0.3407887, -2.164231, -1.935029, 1, 1, 1, 1, 1,
-0.3405578, -0.3335616, -2.252385, 1, 1, 1, 1, 1,
-0.3356021, 1.523903, -1.489855, 1, 1, 1, 1, 1,
-0.3347014, 0.4760426, 0.5702283, 1, 1, 1, 1, 1,
-0.3321162, 0.3180626, 0.1489284, 1, 1, 1, 1, 1,
-0.3306691, 0.6740738, -0.4620661, 1, 1, 1, 1, 1,
-0.3255428, 1.08457, -0.6083885, 1, 1, 1, 1, 1,
-0.3233039, 0.8662759, -0.5631468, 1, 1, 1, 1, 1,
-0.3221269, -1.2446, -2.02226, 1, 1, 1, 1, 1,
-0.3215924, -0.3593745, -2.114895, 1, 1, 1, 1, 1,
-0.310048, 0.3594233, -0.9476013, 1, 1, 1, 1, 1,
-0.3092248, -0.1700352, -2.033438, 0, 0, 1, 1, 1,
-0.3031203, -0.2809049, -2.597219, 1, 0, 0, 1, 1,
-0.2999048, -0.6867065, -3.165875, 1, 0, 0, 1, 1,
-0.2966201, 0.2345071, -2.147682, 1, 0, 0, 1, 1,
-0.2960526, 0.9302785, 0.2666686, 1, 0, 0, 1, 1,
-0.2918973, 0.7839639, 0.7255273, 1, 0, 0, 1, 1,
-0.2868007, 0.3505218, -0.4992002, 0, 0, 0, 1, 1,
-0.2858088, -2.398062, -2.922767, 0, 0, 0, 1, 1,
-0.2852281, 0.157203, -1.935634, 0, 0, 0, 1, 1,
-0.2834266, -0.3194148, -3.502529, 0, 0, 0, 1, 1,
-0.2816205, -1.753559, -2.194435, 0, 0, 0, 1, 1,
-0.2715907, 0.7660298, -1.252721, 0, 0, 0, 1, 1,
-0.2711287, -0.307579, -4.778678, 0, 0, 0, 1, 1,
-0.2695106, -0.2042851, -1.806119, 1, 1, 1, 1, 1,
-0.2653495, 1.5928, 1.792878, 1, 1, 1, 1, 1,
-0.2626869, -0.4450352, -3.935218, 1, 1, 1, 1, 1,
-0.2598599, 0.8968192, 0.9417559, 1, 1, 1, 1, 1,
-0.2590402, 0.4528885, 1.246031, 1, 1, 1, 1, 1,
-0.246516, 0.5629345, -0.9743356, 1, 1, 1, 1, 1,
-0.2452048, -0.2823924, -3.408582, 1, 1, 1, 1, 1,
-0.2431413, -1.495144, -1.597062, 1, 1, 1, 1, 1,
-0.2424529, -0.225326, -1.448529, 1, 1, 1, 1, 1,
-0.2400182, -0.1664365, -2.811456, 1, 1, 1, 1, 1,
-0.2384518, -0.02370119, -1.804229, 1, 1, 1, 1, 1,
-0.2374419, 0.6393175, 0.9051982, 1, 1, 1, 1, 1,
-0.2369656, -0.1190314, -1.971804, 1, 1, 1, 1, 1,
-0.2328459, 0.3473791, -0.987958, 1, 1, 1, 1, 1,
-0.2291669, -0.4486302, -1.465716, 1, 1, 1, 1, 1,
-0.2267807, -0.06288046, -2.050724, 0, 0, 1, 1, 1,
-0.2229347, -0.9697755, -2.578583, 1, 0, 0, 1, 1,
-0.2135191, -0.0889754, -3.342187, 1, 0, 0, 1, 1,
-0.2134677, 0.1366172, -1.000931, 1, 0, 0, 1, 1,
-0.2113007, 0.07442513, -1.91418, 1, 0, 0, 1, 1,
-0.2079076, -0.9147938, -0.8193532, 1, 0, 0, 1, 1,
-0.2033377, -1.560451, -3.03437, 0, 0, 0, 1, 1,
-0.2016443, -0.1763401, -3.750996, 0, 0, 0, 1, 1,
-0.1949975, 1.648386, -0.3681565, 0, 0, 0, 1, 1,
-0.1935953, 0.06064756, -0.3489664, 0, 0, 0, 1, 1,
-0.1923718, 1.675766, -0.357884, 0, 0, 0, 1, 1,
-0.190052, -0.4676799, -2.398941, 0, 0, 0, 1, 1,
-0.1850065, -2.404241, -2.025363, 0, 0, 0, 1, 1,
-0.1807295, 0.9362751, -1.108566, 1, 1, 1, 1, 1,
-0.1806627, 0.003611972, -2.850239, 1, 1, 1, 1, 1,
-0.1782524, -0.826364, -3.820556, 1, 1, 1, 1, 1,
-0.171976, -0.6783132, -3.853758, 1, 1, 1, 1, 1,
-0.1713034, -0.9596068, -1.337221, 1, 1, 1, 1, 1,
-0.166737, 0.1989791, 1.088251, 1, 1, 1, 1, 1,
-0.1652741, -0.9232038, -3.352033, 1, 1, 1, 1, 1,
-0.1595101, -0.4954148, -2.52402, 1, 1, 1, 1, 1,
-0.1589607, 0.2321911, 0.9579409, 1, 1, 1, 1, 1,
-0.1588852, -0.4498192, -2.733444, 1, 1, 1, 1, 1,
-0.1584403, 0.1427792, -1.80496, 1, 1, 1, 1, 1,
-0.1568678, -0.8748794, -3.046285, 1, 1, 1, 1, 1,
-0.1551687, 0.2196379, -1.03583, 1, 1, 1, 1, 1,
-0.1549356, 0.6500718, 0.6371248, 1, 1, 1, 1, 1,
-0.1495171, -0.06475722, -3.454963, 1, 1, 1, 1, 1,
-0.1467004, 2.06301, -0.0386327, 0, 0, 1, 1, 1,
-0.1463052, -1.281038, -1.984505, 1, 0, 0, 1, 1,
-0.1425226, -0.1930185, -2.311514, 1, 0, 0, 1, 1,
-0.1369372, -0.4176578, -1.546661, 1, 0, 0, 1, 1,
-0.1364689, 0.224955, -0.9074668, 1, 0, 0, 1, 1,
-0.1362626, -0.1200461, -1.493101, 1, 0, 0, 1, 1,
-0.1335046, 0.4190051, -0.7324502, 0, 0, 0, 1, 1,
-0.1333083, 1.234679, -1.930411, 0, 0, 0, 1, 1,
-0.1328688, -0.5835698, -2.635524, 0, 0, 0, 1, 1,
-0.1310373, 0.14856, -3.134353, 0, 0, 0, 1, 1,
-0.1232364, -0.09228875, -2.695127, 0, 0, 0, 1, 1,
-0.1214974, -1.929612, -2.3549, 0, 0, 0, 1, 1,
-0.1189343, -0.5627847, -3.116715, 0, 0, 0, 1, 1,
-0.1154727, -1.035019, -1.247496, 1, 1, 1, 1, 1,
-0.1149319, 0.0988775, -2.72165, 1, 1, 1, 1, 1,
-0.1140185, -0.8075334, -2.197992, 1, 1, 1, 1, 1,
-0.1137073, -0.6831928, -3.528279, 1, 1, 1, 1, 1,
-0.1102165, -1.006045, -2.658476, 1, 1, 1, 1, 1,
-0.1055165, -0.4556276, -3.2079, 1, 1, 1, 1, 1,
-0.1008554, -0.5002654, -3.453463, 1, 1, 1, 1, 1,
-0.1007013, 0.5458006, -1.157887, 1, 1, 1, 1, 1,
-0.0993054, -1.084317, -2.736647, 1, 1, 1, 1, 1,
-0.096716, -1.159297, -4.266413, 1, 1, 1, 1, 1,
-0.09335537, 0.4140677, -1.659308, 1, 1, 1, 1, 1,
-0.09171667, 0.1601097, -0.6170149, 1, 1, 1, 1, 1,
-0.08958226, -0.6272982, -3.465844, 1, 1, 1, 1, 1,
-0.08726892, 0.3567455, 0.8057761, 1, 1, 1, 1, 1,
-0.08641987, 0.6588942, 0.3400682, 1, 1, 1, 1, 1,
-0.08019862, 1.305275, -0.8565369, 0, 0, 1, 1, 1,
-0.07198521, 0.4878766, -0.7911678, 1, 0, 0, 1, 1,
-0.07154819, 1.314368, -0.1510884, 1, 0, 0, 1, 1,
-0.06204527, -0.4262204, -3.066858, 1, 0, 0, 1, 1,
-0.06044651, 0.6073478, -0.307378, 1, 0, 0, 1, 1,
-0.06024503, -1.0691, -0.8458265, 1, 0, 0, 1, 1,
-0.05903304, 1.783826, -1.268432, 0, 0, 0, 1, 1,
-0.04228423, 0.8224207, 1.037465, 0, 0, 0, 1, 1,
-0.03955365, 0.2990628, 0.09687889, 0, 0, 0, 1, 1,
-0.03926065, 0.3091689, -0.1007082, 0, 0, 0, 1, 1,
-0.03709847, 1.082508, -1.039351, 0, 0, 0, 1, 1,
-0.03345557, 0.6205072, -0.1913518, 0, 0, 0, 1, 1,
-0.03193866, 0.001901804, -1.728832, 0, 0, 0, 1, 1,
-0.0248455, 1.88236, -0.4182464, 1, 1, 1, 1, 1,
-0.02031521, 0.1322051, -1.402491, 1, 1, 1, 1, 1,
-0.01894853, 1.586292, 0.01911221, 1, 1, 1, 1, 1,
-0.01793768, -0.663721, -2.260656, 1, 1, 1, 1, 1,
-0.01653973, -0.03180867, -2.131293, 1, 1, 1, 1, 1,
-0.01472501, -0.4424133, -2.506908, 1, 1, 1, 1, 1,
-0.006889618, 0.8768168, 0.870722, 1, 1, 1, 1, 1,
-0.004062044, 1.473743, 0.02129652, 1, 1, 1, 1, 1,
-0.004014593, -0.8240948, -3.821586, 1, 1, 1, 1, 1,
0.00237742, 0.9569572, 0.8650081, 1, 1, 1, 1, 1,
0.004070839, 0.04097964, 0.02057301, 1, 1, 1, 1, 1,
0.006054823, 0.466585, -0.3847679, 1, 1, 1, 1, 1,
0.007296873, 0.9573311, 0.132979, 1, 1, 1, 1, 1,
0.01339953, -0.6978276, 1.956739, 1, 1, 1, 1, 1,
0.01469492, 0.2152167, 1.85515, 1, 1, 1, 1, 1,
0.01667976, -0.3577177, 2.854308, 0, 0, 1, 1, 1,
0.01847018, -0.7401367, 2.349151, 1, 0, 0, 1, 1,
0.01870091, 0.5694283, -0.1037529, 1, 0, 0, 1, 1,
0.01924558, 0.4947239, -0.7470064, 1, 0, 0, 1, 1,
0.01952499, 0.3739966, 0.2759958, 1, 0, 0, 1, 1,
0.02089188, 0.01104255, 0.3386477, 1, 0, 0, 1, 1,
0.02311851, 1.420646, -0.7014782, 0, 0, 0, 1, 1,
0.02370621, -0.1027262, 1.750572, 0, 0, 0, 1, 1,
0.02870704, -1.087975, 2.316838, 0, 0, 0, 1, 1,
0.03269929, 1.290698, -0.7385871, 0, 0, 0, 1, 1,
0.03529624, 0.2318306, 0.3757043, 0, 0, 0, 1, 1,
0.03753838, 1.288222, -1.751414, 0, 0, 0, 1, 1,
0.0376115, -1.379683, 4.228777, 0, 0, 0, 1, 1,
0.04222653, -1.018037, 2.535969, 1, 1, 1, 1, 1,
0.04466113, 0.01537475, 1.92531, 1, 1, 1, 1, 1,
0.04762362, 0.9309543, 1.162236, 1, 1, 1, 1, 1,
0.0478892, 0.8406181, -1.3409, 1, 1, 1, 1, 1,
0.04791565, 1.539641, -0.3910144, 1, 1, 1, 1, 1,
0.04822138, 0.8577062, -0.3095012, 1, 1, 1, 1, 1,
0.04922831, 0.2188469, 0.2397879, 1, 1, 1, 1, 1,
0.05144356, -0.2911767, 1.699571, 1, 1, 1, 1, 1,
0.05618978, -1.185724, 3.469665, 1, 1, 1, 1, 1,
0.0573496, 0.547172, 0.9633443, 1, 1, 1, 1, 1,
0.05768874, -1.147399, 4.286883, 1, 1, 1, 1, 1,
0.06563156, 1.148299, 0.2515297, 1, 1, 1, 1, 1,
0.06573953, -1.013523, 2.994216, 1, 1, 1, 1, 1,
0.06938746, -0.3097517, 3.340656, 1, 1, 1, 1, 1,
0.07093767, -1.961345, 3.226904, 1, 1, 1, 1, 1,
0.07115514, -1.126645, 2.515198, 0, 0, 1, 1, 1,
0.07392935, 0.9167336, -0.501822, 1, 0, 0, 1, 1,
0.0799979, 2.237717, -0.9207129, 1, 0, 0, 1, 1,
0.08178003, -0.09018774, 0.7776946, 1, 0, 0, 1, 1,
0.08337319, 0.4067149, 1.978194, 1, 0, 0, 1, 1,
0.08511803, -1.048213, 3.49129, 1, 0, 0, 1, 1,
0.08722764, 0.1805784, -0.6170355, 0, 0, 0, 1, 1,
0.0904887, -0.6354541, 2.437771, 0, 0, 0, 1, 1,
0.0918491, -1.164586, 2.789244, 0, 0, 0, 1, 1,
0.0936786, -0.4185296, 3.782115, 0, 0, 0, 1, 1,
0.09555538, -0.375077, 3.580032, 0, 0, 0, 1, 1,
0.1114666, 0.3479461, -0.3696131, 0, 0, 0, 1, 1,
0.1129704, -1.424085, 3.677396, 0, 0, 0, 1, 1,
0.1225227, 1.458249, 0.3353288, 1, 1, 1, 1, 1,
0.1236257, -0.3766207, 3.492981, 1, 1, 1, 1, 1,
0.1249756, 0.7709368, 1.005171, 1, 1, 1, 1, 1,
0.1285917, 0.762463, 2.170863, 1, 1, 1, 1, 1,
0.1307494, 0.907756, 0.5175025, 1, 1, 1, 1, 1,
0.1312996, -1.292574, 6.640666, 1, 1, 1, 1, 1,
0.1330163, -0.6710692, 3.505398, 1, 1, 1, 1, 1,
0.13874, -1.36525, 1.421168, 1, 1, 1, 1, 1,
0.1415942, -0.4767299, 3.176765, 1, 1, 1, 1, 1,
0.1419002, 1.443467, 0.6281301, 1, 1, 1, 1, 1,
0.142004, 2.30916, 0.2295499, 1, 1, 1, 1, 1,
0.1425966, 0.2768407, 1.16786, 1, 1, 1, 1, 1,
0.1436708, 0.406701, 1.100076, 1, 1, 1, 1, 1,
0.1449863, 0.8379661, 1.096582, 1, 1, 1, 1, 1,
0.1461538, -0.7829762, 2.536029, 1, 1, 1, 1, 1,
0.1461782, 1.110897, -1.289997, 0, 0, 1, 1, 1,
0.1582497, -2.250756, 2.614108, 1, 0, 0, 1, 1,
0.160042, 0.6208344, -0.00486719, 1, 0, 0, 1, 1,
0.1615655, -1.307573, 3.776251, 1, 0, 0, 1, 1,
0.1685001, 1.038573, 0.05697336, 1, 0, 0, 1, 1,
0.1686249, -0.5527456, 1.618347, 1, 0, 0, 1, 1,
0.1718842, 0.03029263, 1.279478, 0, 0, 0, 1, 1,
0.1728019, -0.02100821, 2.965534, 0, 0, 0, 1, 1,
0.1773251, -0.5599286, 2.441771, 0, 0, 0, 1, 1,
0.1787032, 0.7104386, -0.1605523, 0, 0, 0, 1, 1,
0.180436, 0.2365026, -1.494612, 0, 0, 0, 1, 1,
0.1809662, -0.06179213, 1.873994, 0, 0, 0, 1, 1,
0.1813652, -0.1047058, 1.599945, 0, 0, 0, 1, 1,
0.1828685, 0.3139663, 0.6908755, 1, 1, 1, 1, 1,
0.183296, 0.7896438, 0.808655, 1, 1, 1, 1, 1,
0.1836333, 0.002711566, 1.485401, 1, 1, 1, 1, 1,
0.1847562, 0.3359419, 0.1261875, 1, 1, 1, 1, 1,
0.1863647, 1.357191, 0.9916078, 1, 1, 1, 1, 1,
0.1920088, 1.019336, -0.9779409, 1, 1, 1, 1, 1,
0.1952324, 0.2866008, 0.6086919, 1, 1, 1, 1, 1,
0.1954393, 1.012881, -0.2739444, 1, 1, 1, 1, 1,
0.1960589, -0.7381033, 2.176833, 1, 1, 1, 1, 1,
0.1981654, 0.1994477, 0.5123463, 1, 1, 1, 1, 1,
0.199083, -1.14464, 3.047664, 1, 1, 1, 1, 1,
0.2001377, -1.075384, 1.573315, 1, 1, 1, 1, 1,
0.2025202, -1.061081, 1.810824, 1, 1, 1, 1, 1,
0.2036525, 0.04561678, 0.704973, 1, 1, 1, 1, 1,
0.2065183, 1.632688, 1.369332, 1, 1, 1, 1, 1,
0.2085297, 1.079037, -1.101469, 0, 0, 1, 1, 1,
0.2091345, 0.3636493, -1.379658, 1, 0, 0, 1, 1,
0.2103159, 0.443612, 0.04422291, 1, 0, 0, 1, 1,
0.2120982, 0.456939, 0.09055447, 1, 0, 0, 1, 1,
0.2131269, 1.04211, -0.7063803, 1, 0, 0, 1, 1,
0.2147257, 0.09969366, 0.255057, 1, 0, 0, 1, 1,
0.2176657, 1.253242, -1.540137, 0, 0, 0, 1, 1,
0.2220401, 0.4454555, -0.5084292, 0, 0, 0, 1, 1,
0.2267351, 0.9485604, -0.9407107, 0, 0, 0, 1, 1,
0.2295803, -0.03323946, 1.191141, 0, 0, 0, 1, 1,
0.2296096, 0.6443799, -0.8219556, 0, 0, 0, 1, 1,
0.2321547, -1.553941, 2.465951, 0, 0, 0, 1, 1,
0.2343865, -0.8311142, 0.8817842, 0, 0, 0, 1, 1,
0.2380974, 0.6584224, 0.1178092, 1, 1, 1, 1, 1,
0.2395609, 0.7338585, 0.9104829, 1, 1, 1, 1, 1,
0.2397268, -0.4926468, 1.49674, 1, 1, 1, 1, 1,
0.2445141, -0.07461664, 2.0182, 1, 1, 1, 1, 1,
0.2470997, 0.2387435, 0.6832527, 1, 1, 1, 1, 1,
0.2486854, 0.3545938, 0.975679, 1, 1, 1, 1, 1,
0.2510549, -1.059211, 3.418638, 1, 1, 1, 1, 1,
0.2540046, 0.2775346, 0.4449272, 1, 1, 1, 1, 1,
0.2546834, -0.9213022, 1.197793, 1, 1, 1, 1, 1,
0.2569564, 0.5052418, -0.07456314, 1, 1, 1, 1, 1,
0.2570305, -1.061268, 2.74331, 1, 1, 1, 1, 1,
0.2619629, 1.432733, 0.9387617, 1, 1, 1, 1, 1,
0.2625982, 0.1742966, 2.21024, 1, 1, 1, 1, 1,
0.2646431, -0.8382002, 2.367193, 1, 1, 1, 1, 1,
0.265485, 0.4043405, 0.2641514, 1, 1, 1, 1, 1,
0.2665791, 0.6226061, -0.3636239, 0, 0, 1, 1, 1,
0.2734343, -1.255019, 2.584686, 1, 0, 0, 1, 1,
0.2794648, 1.562839, 0.07025388, 1, 0, 0, 1, 1,
0.2847715, 0.7008744, -0.001067592, 1, 0, 0, 1, 1,
0.2848109, 2.240086, -0.8394183, 1, 0, 0, 1, 1,
0.2854213, -0.2311955, 2.996236, 1, 0, 0, 1, 1,
0.2895253, -0.05930876, 0.9840341, 0, 0, 0, 1, 1,
0.2896828, -1.138126, 2.164118, 0, 0, 0, 1, 1,
0.291032, -0.9491672, 2.17374, 0, 0, 0, 1, 1,
0.2949274, -0.7653849, 4.450336, 0, 0, 0, 1, 1,
0.295324, -1.487355, 3.658621, 0, 0, 0, 1, 1,
0.3031673, 1.027194, 0.8369867, 0, 0, 0, 1, 1,
0.3037271, 0.258734, 0.399466, 0, 0, 0, 1, 1,
0.3067026, -1.982834, 2.716621, 1, 1, 1, 1, 1,
0.3073464, -0.2320783, 1.756777, 1, 1, 1, 1, 1,
0.3085198, -0.1139153, 2.121956, 1, 1, 1, 1, 1,
0.3113007, 0.2044296, 0.855768, 1, 1, 1, 1, 1,
0.3137575, 0.7776521, -0.6501798, 1, 1, 1, 1, 1,
0.313976, 0.7086346, 1.049853, 1, 1, 1, 1, 1,
0.3166396, -0.3134883, 1.674251, 1, 1, 1, 1, 1,
0.3181463, -0.9590095, 3.128788, 1, 1, 1, 1, 1,
0.3203197, 0.261253, 2.819749, 1, 1, 1, 1, 1,
0.3210917, 0.6054885, -0.445247, 1, 1, 1, 1, 1,
0.3221311, 0.7403885, 0.7393432, 1, 1, 1, 1, 1,
0.3240881, 0.3449885, 1.018439, 1, 1, 1, 1, 1,
0.3279649, 0.9524347, -0.704969, 1, 1, 1, 1, 1,
0.3287053, 0.7589136, 0.4037444, 1, 1, 1, 1, 1,
0.3349748, -0.3404906, 0.7098684, 1, 1, 1, 1, 1,
0.3354799, 0.4983891, 0.02190967, 0, 0, 1, 1, 1,
0.3484762, 1.097595, 0.8505334, 1, 0, 0, 1, 1,
0.3492828, 0.06372607, 2.590026, 1, 0, 0, 1, 1,
0.3506298, -0.09224939, 0.9444295, 1, 0, 0, 1, 1,
0.3516881, 0.2072167, -0.2871084, 1, 0, 0, 1, 1,
0.3530471, -0.6410395, 2.970082, 1, 0, 0, 1, 1,
0.3563903, -1.36023, 1.786901, 0, 0, 0, 1, 1,
0.3584355, 0.08809206, 0.5589546, 0, 0, 0, 1, 1,
0.3607752, 0.1529606, -0.01961608, 0, 0, 0, 1, 1,
0.3634717, -0.08283203, -0.4509137, 0, 0, 0, 1, 1,
0.3677538, -1.412214, 2.965256, 0, 0, 0, 1, 1,
0.3726673, -1.613724, 3.411671, 0, 0, 0, 1, 1,
0.3741202, -0.7915682, 2.804613, 0, 0, 0, 1, 1,
0.3753985, -0.07587173, 1.509893, 1, 1, 1, 1, 1,
0.3766234, 0.4780957, 0.3606935, 1, 1, 1, 1, 1,
0.39062, -0.3254605, 2.120757, 1, 1, 1, 1, 1,
0.3976059, -1.00342, 2.201632, 1, 1, 1, 1, 1,
0.3977822, -1.505603, 2.594853, 1, 1, 1, 1, 1,
0.3980847, -0.572512, 3.465964, 1, 1, 1, 1, 1,
0.4015658, -1.760925, 3.565195, 1, 1, 1, 1, 1,
0.4048842, 1.441298, 0.8616043, 1, 1, 1, 1, 1,
0.4055993, -0.8593376, 3.508827, 1, 1, 1, 1, 1,
0.4101641, 0.6066956, 1.520588, 1, 1, 1, 1, 1,
0.4109223, 1.289445, 2.703456, 1, 1, 1, 1, 1,
0.4156563, 0.1775382, 0.8537102, 1, 1, 1, 1, 1,
0.4157693, -0.1148823, 1.222553, 1, 1, 1, 1, 1,
0.4185584, -0.3934537, 2.949463, 1, 1, 1, 1, 1,
0.4187611, 0.1583881, 1.269878, 1, 1, 1, 1, 1,
0.4201735, 0.2439547, 2.509155, 0, 0, 1, 1, 1,
0.4209324, -1.007576, 3.404231, 1, 0, 0, 1, 1,
0.4279886, 0.424453, 1.557586, 1, 0, 0, 1, 1,
0.4372885, -0.5110536, 1.92868, 1, 0, 0, 1, 1,
0.4386756, 0.6508812, 0.4038408, 1, 0, 0, 1, 1,
0.4458862, -1.186116, 2.216999, 1, 0, 0, 1, 1,
0.4461783, 1.178148, 0.9842736, 0, 0, 0, 1, 1,
0.4469498, -0.2534265, 2.590869, 0, 0, 0, 1, 1,
0.4473668, -1.370013, 2.651024, 0, 0, 0, 1, 1,
0.4480641, -1.117867, 2.990439, 0, 0, 0, 1, 1,
0.4485076, 0.4814351, -0.5689648, 0, 0, 0, 1, 1,
0.4569127, 0.8335444, 1.929496, 0, 0, 0, 1, 1,
0.4570096, 0.1904718, 2.575056, 0, 0, 0, 1, 1,
0.4590816, 1.221897, 0.09573078, 1, 1, 1, 1, 1,
0.4592313, -0.863257, 2.462739, 1, 1, 1, 1, 1,
0.4594009, 0.6835055, 1.359422, 1, 1, 1, 1, 1,
0.4621226, -0.3831626, 2.809733, 1, 1, 1, 1, 1,
0.4625873, 0.8626202, 1.388421, 1, 1, 1, 1, 1,
0.4650573, 0.8531244, 0.1566082, 1, 1, 1, 1, 1,
0.4670267, -0.8549811, 2.718726, 1, 1, 1, 1, 1,
0.4692643, -0.2322104, 2.649127, 1, 1, 1, 1, 1,
0.469994, -0.2780509, 3.020377, 1, 1, 1, 1, 1,
0.4731695, -0.2532733, 2.587283, 1, 1, 1, 1, 1,
0.4747519, 1.349248, 0.04982284, 1, 1, 1, 1, 1,
0.4758781, -0.4126846, 2.132735, 1, 1, 1, 1, 1,
0.4766269, -1.04581, 2.831882, 1, 1, 1, 1, 1,
0.4778385, -0.630043, 2.297614, 1, 1, 1, 1, 1,
0.4792467, 1.052124, 0.9546788, 1, 1, 1, 1, 1,
0.4841551, 0.3076797, 0.7446638, 0, 0, 1, 1, 1,
0.4892158, -0.3518369, 2.882659, 1, 0, 0, 1, 1,
0.4905512, -0.8875414, 4.151853, 1, 0, 0, 1, 1,
0.4915774, -0.3835204, 1.500885, 1, 0, 0, 1, 1,
0.4947822, -0.6785845, 2.772132, 1, 0, 0, 1, 1,
0.505425, 0.6073513, -1.240926, 1, 0, 0, 1, 1,
0.5060304, -0.8667786, 1.890735, 0, 0, 0, 1, 1,
0.507223, 0.3479402, 1.051151, 0, 0, 0, 1, 1,
0.5081759, -0.008277175, 3.348874, 0, 0, 0, 1, 1,
0.5087489, 0.96334, 0.07566534, 0, 0, 0, 1, 1,
0.5129938, -0.3260464, 2.149291, 0, 0, 0, 1, 1,
0.5148245, -1.259933, 3.098272, 0, 0, 0, 1, 1,
0.5167508, 1.720518, 0.7956596, 0, 0, 0, 1, 1,
0.5204404, 1.493231, 0.9071028, 1, 1, 1, 1, 1,
0.5224773, -0.5099637, 0.01102497, 1, 1, 1, 1, 1,
0.5255347, 0.1047473, 0.9952371, 1, 1, 1, 1, 1,
0.5286077, 1.899025, -1.369378, 1, 1, 1, 1, 1,
0.5336729, -0.5915878, 1.833309, 1, 1, 1, 1, 1,
0.5374164, 0.9280856, 1.580966, 1, 1, 1, 1, 1,
0.5390539, 1.236879, 1.02476, 1, 1, 1, 1, 1,
0.5409181, 0.2878636, -0.5378918, 1, 1, 1, 1, 1,
0.541059, -1.183262, 3.524964, 1, 1, 1, 1, 1,
0.5445596, -1.434535, 3.890421, 1, 1, 1, 1, 1,
0.5485492, 1.141617, 1.374242, 1, 1, 1, 1, 1,
0.5494456, -1.425991, 2.823134, 1, 1, 1, 1, 1,
0.5510439, 1.464349, 0.8638636, 1, 1, 1, 1, 1,
0.5526462, -0.7113332, 4.503406, 1, 1, 1, 1, 1,
0.5550171, -0.2486115, 3.18409, 1, 1, 1, 1, 1,
0.5566578, -0.9666544, 1.368873, 0, 0, 1, 1, 1,
0.5656456, -1.530454, 2.6113, 1, 0, 0, 1, 1,
0.5662459, -0.9168409, 1.2429, 1, 0, 0, 1, 1,
0.5693046, -1.000307, 2.38684, 1, 0, 0, 1, 1,
0.5723876, 0.8861232, 1.38897, 1, 0, 0, 1, 1,
0.5740234, 0.09599737, 3.803435, 1, 0, 0, 1, 1,
0.5846686, 1.352144, 0.2357851, 0, 0, 0, 1, 1,
0.5880624, 0.6191297, 2.330954, 0, 0, 0, 1, 1,
0.5899761, -0.9485326, 2.358515, 0, 0, 0, 1, 1,
0.5922031, 1.829686, 0.06018578, 0, 0, 0, 1, 1,
0.5951451, -0.7653161, 2.217199, 0, 0, 0, 1, 1,
0.6026858, -1.344919, 0.8732011, 0, 0, 0, 1, 1,
0.619568, 0.5156801, 1.818389, 0, 0, 0, 1, 1,
0.6210027, -0.1831193, -0.399783, 1, 1, 1, 1, 1,
0.6224182, 1.101772, 0.5773812, 1, 1, 1, 1, 1,
0.6248803, -0.8997188, 4.454092, 1, 1, 1, 1, 1,
0.6305355, 0.4665993, 1.627069, 1, 1, 1, 1, 1,
0.6314154, -0.4127765, 2.302997, 1, 1, 1, 1, 1,
0.6316005, 1.409054, -1.452778, 1, 1, 1, 1, 1,
0.6334456, 0.106902, 1.136739, 1, 1, 1, 1, 1,
0.6346039, 0.8685954, -1.007488, 1, 1, 1, 1, 1,
0.6381986, -1.793426, 2.448901, 1, 1, 1, 1, 1,
0.6400427, 0.6883478, 0.7543709, 1, 1, 1, 1, 1,
0.6478105, -1.54083, 3.343941, 1, 1, 1, 1, 1,
0.65549, 1.199077, 1.219428, 1, 1, 1, 1, 1,
0.655994, -1.150995, 3.13432, 1, 1, 1, 1, 1,
0.6591581, -0.4385358, 2.67919, 1, 1, 1, 1, 1,
0.6608098, -0.4273557, 2.306098, 1, 1, 1, 1, 1,
0.6642445, -0.7851657, 1.560781, 0, 0, 1, 1, 1,
0.6644295, 1.947696, -0.8996694, 1, 0, 0, 1, 1,
0.6661001, -1.460129, 2.618415, 1, 0, 0, 1, 1,
0.6682341, -0.7809318, 3.485915, 1, 0, 0, 1, 1,
0.6687971, -0.2628683, 0.9895133, 1, 0, 0, 1, 1,
0.6755235, -1.908656, 3.102194, 1, 0, 0, 1, 1,
0.6780968, 0.3508423, 2.964717, 0, 0, 0, 1, 1,
0.6813073, 0.03427918, 2.18922, 0, 0, 0, 1, 1,
0.681873, -0.04308221, 0.2127081, 0, 0, 0, 1, 1,
0.6828839, -0.9819188, 1.491379, 0, 0, 0, 1, 1,
0.6831286, 1.124895, 1.774966, 0, 0, 0, 1, 1,
0.683777, 0.9207481, 0.5438704, 0, 0, 0, 1, 1,
0.6857297, 1.108473, 0.5598023, 0, 0, 0, 1, 1,
0.6870207, -0.5058919, 2.624991, 1, 1, 1, 1, 1,
0.6921198, -0.6658606, 3.650486, 1, 1, 1, 1, 1,
0.6922962, 0.6143253, 2.170925, 1, 1, 1, 1, 1,
0.6935375, -0.5240358, 1.464488, 1, 1, 1, 1, 1,
0.6959366, -2.035293, 2.976777, 1, 1, 1, 1, 1,
0.6967522, -2.911323, 2.894722, 1, 1, 1, 1, 1,
0.7026585, 0.5217651, 0.8181418, 1, 1, 1, 1, 1,
0.7030373, 0.1807689, 0.504357, 1, 1, 1, 1, 1,
0.7055561, 1.457963, -0.13695, 1, 1, 1, 1, 1,
0.7066061, 1.043411, 1.089369, 1, 1, 1, 1, 1,
0.7079208, -1.305352, 2.168567, 1, 1, 1, 1, 1,
0.7180833, 0.9871525, 1.427271, 1, 1, 1, 1, 1,
0.7182517, 0.8602692, -0.715073, 1, 1, 1, 1, 1,
0.718672, 0.3943804, 0.4096327, 1, 1, 1, 1, 1,
0.722682, 1.205271, -0.6517091, 1, 1, 1, 1, 1,
0.7259325, 0.8421816, 0.2470274, 0, 0, 1, 1, 1,
0.7266592, -1.798036, 1.080188, 1, 0, 0, 1, 1,
0.7281936, -1.198585, 3.916633, 1, 0, 0, 1, 1,
0.7373089, -0.07950965, 1.667814, 1, 0, 0, 1, 1,
0.7373291, 0.8820317, 1.480835, 1, 0, 0, 1, 1,
0.7383338, 0.5759203, 0.2492554, 1, 0, 0, 1, 1,
0.7459902, -0.5220491, 3.575821, 0, 0, 0, 1, 1,
0.7466893, -1.454151, 3.601524, 0, 0, 0, 1, 1,
0.7531322, -0.2123197, 2.463516, 0, 0, 0, 1, 1,
0.7538406, -0.3055328, 0.8857044, 0, 0, 0, 1, 1,
0.7581182, -0.5641596, 2.195456, 0, 0, 0, 1, 1,
0.7630036, 0.3359101, 0.8573598, 0, 0, 0, 1, 1,
0.7651571, -0.6347129, 2.526251, 0, 0, 0, 1, 1,
0.766538, 0.3023633, 2.135522, 1, 1, 1, 1, 1,
0.7670464, -2.005026, 3.371026, 1, 1, 1, 1, 1,
0.7708666, 0.03065956, 1.640521, 1, 1, 1, 1, 1,
0.779453, 2.509904, -0.08103845, 1, 1, 1, 1, 1,
0.7804304, -0.4552257, 1.897775, 1, 1, 1, 1, 1,
0.7813427, -1.508681, 0.657859, 1, 1, 1, 1, 1,
0.7958072, -2.145163, 2.804147, 1, 1, 1, 1, 1,
0.7970092, 0.04135013, 1.930626, 1, 1, 1, 1, 1,
0.8086666, -0.2096273, 1.227595, 1, 1, 1, 1, 1,
0.8125772, -0.8539073, 3.460782, 1, 1, 1, 1, 1,
0.8179178, 0.5285441, 0.9468343, 1, 1, 1, 1, 1,
0.8210531, 0.377182, 1.219255, 1, 1, 1, 1, 1,
0.8264381, 0.808032, 0.2560575, 1, 1, 1, 1, 1,
0.830305, 0.06974088, 0.6262186, 1, 1, 1, 1, 1,
0.8322548, 0.2638949, 2.344352, 1, 1, 1, 1, 1,
0.8333828, -0.3277591, 2.911612, 0, 0, 1, 1, 1,
0.8342984, -1.38201, 0.9321394, 1, 0, 0, 1, 1,
0.8347963, -0.2555204, -0.5323363, 1, 0, 0, 1, 1,
0.8365061, 0.3116057, 0.3626724, 1, 0, 0, 1, 1,
0.8368077, 0.03104914, 1.670197, 1, 0, 0, 1, 1,
0.8394729, 0.7521999, 0.6113461, 1, 0, 0, 1, 1,
0.8530116, 1.604784, 2.932849, 0, 0, 0, 1, 1,
0.8553777, -0.5002167, 2.268591, 0, 0, 0, 1, 1,
0.8560176, -0.3363797, 2.308877, 0, 0, 0, 1, 1,
0.8582641, -0.04706373, 0.729869, 0, 0, 0, 1, 1,
0.8587503, -0.2989785, 2.69633, 0, 0, 0, 1, 1,
0.8661313, -0.07945193, 1.550547, 0, 0, 0, 1, 1,
0.8727057, -0.2903476, 3.149779, 0, 0, 0, 1, 1,
0.8739271, 1.03072, 2.081331, 1, 1, 1, 1, 1,
0.877421, 1.725328, 0.1707976, 1, 1, 1, 1, 1,
0.8791993, 2.234887, -0.3567912, 1, 1, 1, 1, 1,
0.8799084, 1.701967, 0.1523579, 1, 1, 1, 1, 1,
0.8824748, 1.158681, 2.581136, 1, 1, 1, 1, 1,
0.8940856, 0.8644037, -0.03448285, 1, 1, 1, 1, 1,
0.8956797, -0.5228572, 1.913243, 1, 1, 1, 1, 1,
0.8972985, -1.361989, 0.6918495, 1, 1, 1, 1, 1,
0.9036395, -1.049754, 1.845136, 1, 1, 1, 1, 1,
0.9072886, 0.4783355, 1.524529, 1, 1, 1, 1, 1,
0.9159946, 0.8527876, -0.3687006, 1, 1, 1, 1, 1,
0.9203033, -0.6821545, 0.7312416, 1, 1, 1, 1, 1,
0.9330796, -0.2191354, 1.089623, 1, 1, 1, 1, 1,
0.9332438, 1.119678, -0.2601126, 1, 1, 1, 1, 1,
0.9347332, -0.1751366, 1.47931, 1, 1, 1, 1, 1,
0.9351978, -0.3728158, 2.081061, 0, 0, 1, 1, 1,
0.9364625, 0.745288, 1.708864, 1, 0, 0, 1, 1,
0.9426893, 0.3102353, -0.117282, 1, 0, 0, 1, 1,
0.9430144, 1.431568, 2.051182, 1, 0, 0, 1, 1,
0.9435957, 0.8006976, -0.07979297, 1, 0, 0, 1, 1,
0.9438378, 0.3918991, 0.9641552, 1, 0, 0, 1, 1,
0.9445605, 0.5794101, -0.07166877, 0, 0, 0, 1, 1,
0.9451291, -0.6257808, 0.3897145, 0, 0, 0, 1, 1,
0.946907, 2.182717, -1.570412, 0, 0, 0, 1, 1,
0.9595416, 0.543603, 2.147736, 0, 0, 0, 1, 1,
0.9623116, 0.8473699, -0.1106466, 0, 0, 0, 1, 1,
0.9637665, 0.2628329, 2.053342, 0, 0, 0, 1, 1,
0.9673985, 1.370964, -0.6787795, 0, 0, 0, 1, 1,
0.9692596, -1.030647, 0.05435195, 1, 1, 1, 1, 1,
0.9713059, -0.2784245, 0.5874757, 1, 1, 1, 1, 1,
0.9783904, 0.5643727, -0.7589116, 1, 1, 1, 1, 1,
0.9831313, 0.4401574, 1.624315, 1, 1, 1, 1, 1,
0.9918075, -0.4857372, 1.240335, 1, 1, 1, 1, 1,
0.9939904, -0.7259672, 2.02898, 1, 1, 1, 1, 1,
0.9972324, 0.1493317, 1.933172, 1, 1, 1, 1, 1,
0.9999437, 0.3996477, -0.02835112, 1, 1, 1, 1, 1,
1.000608, -2.774441, 2.065169, 1, 1, 1, 1, 1,
1.002791, -0.7595843, 1.831588, 1, 1, 1, 1, 1,
1.004617, -0.750709, 1.714887, 1, 1, 1, 1, 1,
1.008044, 0.1231473, 1.442537, 1, 1, 1, 1, 1,
1.008818, -0.7946119, 3.332068, 1, 1, 1, 1, 1,
1.011787, -0.8957198, 4.03728, 1, 1, 1, 1, 1,
1.01774, 1.191381, 1.575874, 1, 1, 1, 1, 1,
1.023804, -0.5467649, 3.677087, 0, 0, 1, 1, 1,
1.025678, -0.02054709, 0.5771306, 1, 0, 0, 1, 1,
1.026952, -0.9094561, 3.177227, 1, 0, 0, 1, 1,
1.027843, -1.80667, 3.560675, 1, 0, 0, 1, 1,
1.028443, 0.159457, 1.164259, 1, 0, 0, 1, 1,
1.028725, -0.2109013, 2.080171, 1, 0, 0, 1, 1,
1.034624, -0.6951308, 1.279582, 0, 0, 0, 1, 1,
1.042021, -1.435349, 1.42711, 0, 0, 0, 1, 1,
1.047293, -0.1013772, 1.646446, 0, 0, 0, 1, 1,
1.048888, 1.330541, 1.572877, 0, 0, 0, 1, 1,
1.055934, -1.198703, 2.933591, 0, 0, 0, 1, 1,
1.058018, 0.3972551, -0.5280892, 0, 0, 0, 1, 1,
1.061516, -0.05448843, 1.828176, 0, 0, 0, 1, 1,
1.068063, -0.2562776, 2.610455, 1, 1, 1, 1, 1,
1.071058, 0.2335475, 1.808632, 1, 1, 1, 1, 1,
1.074702, 1.181181, 1.449476, 1, 1, 1, 1, 1,
1.077049, -0.186621, 1.15582, 1, 1, 1, 1, 1,
1.077086, -0.126901, 1.793495, 1, 1, 1, 1, 1,
1.078873, -0.4851528, 1.936721, 1, 1, 1, 1, 1,
1.08153, 0.8964993, 1.275936, 1, 1, 1, 1, 1,
1.084409, -0.5895071, 2.390121, 1, 1, 1, 1, 1,
1.089534, 0.3531848, 2.23237, 1, 1, 1, 1, 1,
1.092639, -0.964197, 3.349614, 1, 1, 1, 1, 1,
1.094455, -1.465081, 3.039529, 1, 1, 1, 1, 1,
1.094774, -0.578076, 2.067204, 1, 1, 1, 1, 1,
1.098353, -1.327785, 2.547811, 1, 1, 1, 1, 1,
1.102744, -0.1466566, 2.047807, 1, 1, 1, 1, 1,
1.103711, 0.04652344, 4.298217, 1, 1, 1, 1, 1,
1.109039, 0.9852101, 0.163741, 0, 0, 1, 1, 1,
1.109918, 0.1151664, -0.7740622, 1, 0, 0, 1, 1,
1.110646, 0.9504798, 0.1977084, 1, 0, 0, 1, 1,
1.112952, 0.4230245, -0.3533961, 1, 0, 0, 1, 1,
1.12431, -0.3173604, 1.707992, 1, 0, 0, 1, 1,
1.127705, -0.456588, 2.793721, 1, 0, 0, 1, 1,
1.129755, -0.6679287, 1.552388, 0, 0, 0, 1, 1,
1.131358, -1.42712, 3.250895, 0, 0, 0, 1, 1,
1.135219, -0.9160524, 1.195374, 0, 0, 0, 1, 1,
1.142655, -0.5717968, 1.911072, 0, 0, 0, 1, 1,
1.143519, -0.8742222, 2.562015, 0, 0, 0, 1, 1,
1.145307, -0.3012633, 1.20901, 0, 0, 0, 1, 1,
1.146397, 0.2484396, -0.370003, 0, 0, 0, 1, 1,
1.148062, 2.243065, 0.08495898, 1, 1, 1, 1, 1,
1.148062, 0.37734, 2.499464, 1, 1, 1, 1, 1,
1.152861, 1.398425, 0.6331198, 1, 1, 1, 1, 1,
1.153701, -0.9854461, 2.835058, 1, 1, 1, 1, 1,
1.15667, -1.218603, 4.623295, 1, 1, 1, 1, 1,
1.161754, -1.219184, 2.62459, 1, 1, 1, 1, 1,
1.163721, -1.363558, 3.025043, 1, 1, 1, 1, 1,
1.168197, 1.424651, -0.0399554, 1, 1, 1, 1, 1,
1.172628, -0.1463288, 2.869483, 1, 1, 1, 1, 1,
1.174112, -0.1604313, 1.688504, 1, 1, 1, 1, 1,
1.176383, -2.569849, 0.9103762, 1, 1, 1, 1, 1,
1.180814, 0.7169388, 2.21231, 1, 1, 1, 1, 1,
1.183368, 0.2530254, 4.072074, 1, 1, 1, 1, 1,
1.188154, -0.3907773, 2.279602, 1, 1, 1, 1, 1,
1.194222, -1.506664, 2.898395, 1, 1, 1, 1, 1,
1.197478, 0.4712548, 0.9047756, 0, 0, 1, 1, 1,
1.199054, -1.792923, 2.632247, 1, 0, 0, 1, 1,
1.200891, -1.131819, 0.05806499, 1, 0, 0, 1, 1,
1.206202, 0.4699353, 1.034381, 1, 0, 0, 1, 1,
1.20967, -0.8590401, 1.825359, 1, 0, 0, 1, 1,
1.222181, -0.6265278, 1.129114, 1, 0, 0, 1, 1,
1.224249, 0.1662231, 1.55113, 0, 0, 0, 1, 1,
1.22845, -0.6833887, 1.2901, 0, 0, 0, 1, 1,
1.230744, -1.08342, 3.846642, 0, 0, 0, 1, 1,
1.232211, 0.6791093, 2.516384, 0, 0, 0, 1, 1,
1.255991, -0.4726736, 2.645196, 0, 0, 0, 1, 1,
1.256581, -1.945847, 3.520884, 0, 0, 0, 1, 1,
1.260442, -1.055314, 2.845894, 0, 0, 0, 1, 1,
1.267509, -1.360882, 2.172525, 1, 1, 1, 1, 1,
1.27087, -0.6311451, 1.126583, 1, 1, 1, 1, 1,
1.275552, -0.458584, 3.161484, 1, 1, 1, 1, 1,
1.275932, -0.3725314, 1.239524, 1, 1, 1, 1, 1,
1.278557, 0.8748432, 1.043199, 1, 1, 1, 1, 1,
1.281465, -0.5967321, 2.220489, 1, 1, 1, 1, 1,
1.294482, -0.6355633, 0.6568457, 1, 1, 1, 1, 1,
1.29514, 1.579981, -0.6396574, 1, 1, 1, 1, 1,
1.312906, -0.7994344, 3.242532, 1, 1, 1, 1, 1,
1.317119, 0.2065717, 1.45284, 1, 1, 1, 1, 1,
1.321072, 1.382269, 1.770858, 1, 1, 1, 1, 1,
1.323823, 0.04836126, 2.183818, 1, 1, 1, 1, 1,
1.324545, -1.200798, 4.83771, 1, 1, 1, 1, 1,
1.325253, -2.794905, 2.82201, 1, 1, 1, 1, 1,
1.326618, 0.9556345, -0.8051494, 1, 1, 1, 1, 1,
1.331041, 1.839638, 0.8169078, 0, 0, 1, 1, 1,
1.341149, -0.2721786, 1.699911, 1, 0, 0, 1, 1,
1.344431, -1.288846, 2.6886, 1, 0, 0, 1, 1,
1.349932, -1.310542, 2.598523, 1, 0, 0, 1, 1,
1.352298, -0.124609, 3.344633, 1, 0, 0, 1, 1,
1.354852, -0.5366055, 3.407769, 1, 0, 0, 1, 1,
1.359837, -0.6861757, 1.969131, 0, 0, 0, 1, 1,
1.361807, 1.087284, 0.9562758, 0, 0, 0, 1, 1,
1.372907, -2.115405, 2.331182, 0, 0, 0, 1, 1,
1.37385, 0.7248846, -0.1168314, 0, 0, 0, 1, 1,
1.376384, 1.377236, 2.391542, 0, 0, 0, 1, 1,
1.376467, 0.7293621, 0.8954334, 0, 0, 0, 1, 1,
1.393652, -0.5674282, 0.8344107, 0, 0, 0, 1, 1,
1.395187, 1.183509, 1.092086, 1, 1, 1, 1, 1,
1.39966, 0.1157625, 1.035802, 1, 1, 1, 1, 1,
1.412914, -1.252348, 0.3523184, 1, 1, 1, 1, 1,
1.415651, -0.580139, 1.737281, 1, 1, 1, 1, 1,
1.431007, 0.7205499, 0.6874827, 1, 1, 1, 1, 1,
1.437145, -2.130996, 2.362837, 1, 1, 1, 1, 1,
1.43773, 1.405736, 1.331826, 1, 1, 1, 1, 1,
1.438462, 1.48849, 1.240676, 1, 1, 1, 1, 1,
1.463024, 0.07667424, 2.260568, 1, 1, 1, 1, 1,
1.484162, -0.5281023, 2.125866, 1, 1, 1, 1, 1,
1.484799, 1.320657, 0.923825, 1, 1, 1, 1, 1,
1.500995, -1.756119, 3.337013, 1, 1, 1, 1, 1,
1.502148, 0.008633948, 2.168339, 1, 1, 1, 1, 1,
1.504416, 0.1832589, 1.488694, 1, 1, 1, 1, 1,
1.519816, 0.4582197, 2.149498, 1, 1, 1, 1, 1,
1.524305, 0.3357855, 1.564393, 0, 0, 1, 1, 1,
1.54065, 1.107208, 1.8355, 1, 0, 0, 1, 1,
1.543585, 1.011479, -0.1829912, 1, 0, 0, 1, 1,
1.563032, 0.271947, 1.837816, 1, 0, 0, 1, 1,
1.568438, 0.6665633, 0.1737248, 1, 0, 0, 1, 1,
1.569787, 1.538152, 2.853392, 1, 0, 0, 1, 1,
1.569875, 0.1089721, 1.984839, 0, 0, 0, 1, 1,
1.572185, -1.626348, 2.309774, 0, 0, 0, 1, 1,
1.577166, 0.8389254, 0.7251725, 0, 0, 0, 1, 1,
1.581141, -0.5645289, 1.608509, 0, 0, 0, 1, 1,
1.60987, 0.640018, 1.874741, 0, 0, 0, 1, 1,
1.613625, 1.762917, 1.41711, 0, 0, 0, 1, 1,
1.639037, -0.4136842, 0.4471304, 0, 0, 0, 1, 1,
1.697611, 0.7357838, 1.994466, 1, 1, 1, 1, 1,
1.704849, 0.3099391, 1.276199, 1, 1, 1, 1, 1,
1.729701, 0.2939285, 0.009849506, 1, 1, 1, 1, 1,
1.748082, -0.7804121, 1.254072, 1, 1, 1, 1, 1,
1.761188, -1.33944, 1.980339, 1, 1, 1, 1, 1,
1.769472, -1.17983, 1.539182, 1, 1, 1, 1, 1,
1.855639, 1.255539, 1.071604, 1, 1, 1, 1, 1,
1.903076, -0.0284042, 1.655308, 1, 1, 1, 1, 1,
1.905778, -1.465807, 3.04683, 1, 1, 1, 1, 1,
1.917323, -0.2798861, 0.8702369, 1, 1, 1, 1, 1,
1.928709, 0.4971755, 2.484471, 1, 1, 1, 1, 1,
1.945567, 0.3320441, 1.664959, 1, 1, 1, 1, 1,
1.952276, -0.3586328, 2.063503, 1, 1, 1, 1, 1,
1.962441, 0.6284762, 3.424141, 1, 1, 1, 1, 1,
1.978497, 2.014605, 0.7052979, 1, 1, 1, 1, 1,
1.995753, 1.231837, 0.3648781, 0, 0, 1, 1, 1,
2.000151, -0.4536102, 1.827434, 1, 0, 0, 1, 1,
2.009982, 1.353075, 0.3946727, 1, 0, 0, 1, 1,
2.016459, 1.130659, -0.7219708, 1, 0, 0, 1, 1,
2.026423, -1.251619, 2.559215, 1, 0, 0, 1, 1,
2.068729, -0.3425919, 2.462337, 1, 0, 0, 1, 1,
2.130847, 1.669379, 1.451031, 0, 0, 0, 1, 1,
2.179555, 0.6453602, 1.557582, 0, 0, 0, 1, 1,
2.225039, -0.7380693, 3.323982, 0, 0, 0, 1, 1,
2.267212, 1.021616, 2.092939, 0, 0, 0, 1, 1,
2.27123, 0.9644586, 1.267952, 0, 0, 0, 1, 1,
2.305703, -0.02946414, 3.132627, 0, 0, 0, 1, 1,
2.338969, -0.3760641, 2.558463, 0, 0, 0, 1, 1,
2.372747, 0.5410765, -0.5094745, 1, 1, 1, 1, 1,
2.426508, -0.08675627, 0.742599, 1, 1, 1, 1, 1,
2.440161, 0.3877511, 0.8556277, 1, 1, 1, 1, 1,
2.444031, -0.4592927, 2.885093, 1, 1, 1, 1, 1,
2.589727, -1.441301, 2.728387, 1, 1, 1, 1, 1,
2.59112, 1.367901, 1.095181, 1, 1, 1, 1, 1,
2.978634, -0.1968187, 2.923199, 1, 1, 1, 1, 1
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
var radius = 10.08821;
var distance = 35.43441;
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
mvMatrix.translate( 0.5653588, 0.2007096, -0.5913692 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.43441);
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
