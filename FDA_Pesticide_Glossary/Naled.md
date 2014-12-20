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
-3.828168, -1.271751, 0.6792953, 1, 0, 0, 1,
-3.738828, -0.5484786, -1.04498, 1, 0.007843138, 0, 1,
-3.158058, -1.839546, -2.158438, 1, 0.01176471, 0, 1,
-3.047779, -0.213414, -2.649104, 1, 0.01960784, 0, 1,
-2.89337, -0.3511142, -4.173479, 1, 0.02352941, 0, 1,
-2.808301, 2.657671, -1.033337, 1, 0.03137255, 0, 1,
-2.804845, 0.4664495, -1.22874, 1, 0.03529412, 0, 1,
-2.616642, -0.4527447, -3.127863, 1, 0.04313726, 0, 1,
-2.594235, 1.058486, 0.4355719, 1, 0.04705882, 0, 1,
-2.522789, 0.1717684, -1.302797, 1, 0.05490196, 0, 1,
-2.470269, -2.157314, -0.9111471, 1, 0.05882353, 0, 1,
-2.421886, -1.696327, -1.717634, 1, 0.06666667, 0, 1,
-2.40029, 0.2337145, -0.7207247, 1, 0.07058824, 0, 1,
-2.367455, -0.0256036, -2.719322, 1, 0.07843138, 0, 1,
-2.35526, -1.552427, -1.60894, 1, 0.08235294, 0, 1,
-2.296429, -0.5667081, -2.037403, 1, 0.09019608, 0, 1,
-2.11289, 0.3231992, -0.1875432, 1, 0.09411765, 0, 1,
-2.09303, -0.3177716, -0.2406269, 1, 0.1019608, 0, 1,
-2.064641, -0.317121, -2.612127, 1, 0.1098039, 0, 1,
-2.062484, -0.06550013, -3.139227, 1, 0.1137255, 0, 1,
-2.006925, -0.8957412, -2.910015, 1, 0.1215686, 0, 1,
-1.993399, -1.306307, -2.966415, 1, 0.1254902, 0, 1,
-1.927667, -0.8865666, -2.405785, 1, 0.1333333, 0, 1,
-1.922023, 0.8101805, -0.8496122, 1, 0.1372549, 0, 1,
-1.914901, -0.5666273, -2.207642, 1, 0.145098, 0, 1,
-1.838888, 0.1629969, -2.393337, 1, 0.1490196, 0, 1,
-1.838106, -0.6154583, -1.586787, 1, 0.1568628, 0, 1,
-1.815449, 2.034777, -2.744778, 1, 0.1607843, 0, 1,
-1.80847, 2.276803, -1.761465, 1, 0.1686275, 0, 1,
-1.803473, -0.1113703, -2.111797, 1, 0.172549, 0, 1,
-1.797676, -0.2536317, -1.452729, 1, 0.1803922, 0, 1,
-1.795259, 0.5742478, 0.8822743, 1, 0.1843137, 0, 1,
-1.764753, 1.38272, -3.273731, 1, 0.1921569, 0, 1,
-1.761702, -0.4032122, -0.569223, 1, 0.1960784, 0, 1,
-1.717947, -0.3154556, -1.244867, 1, 0.2039216, 0, 1,
-1.716409, -1.085779, -0.9997671, 1, 0.2117647, 0, 1,
-1.70859, 0.9003615, -2.329276, 1, 0.2156863, 0, 1,
-1.689053, -0.5210189, -2.822652, 1, 0.2235294, 0, 1,
-1.671449, -1.73626, -2.746464, 1, 0.227451, 0, 1,
-1.664646, 1.360547, -1.84648, 1, 0.2352941, 0, 1,
-1.656168, -0.1942464, -2.130569, 1, 0.2392157, 0, 1,
-1.652389, -1.257587, -4.166301, 1, 0.2470588, 0, 1,
-1.648604, -0.423704, -2.244586, 1, 0.2509804, 0, 1,
-1.647619, -1.427472, -2.808619, 1, 0.2588235, 0, 1,
-1.64542, 0.4838728, 0.7306837, 1, 0.2627451, 0, 1,
-1.612469, -0.3856087, -0.2753291, 1, 0.2705882, 0, 1,
-1.609207, 0.2707891, -2.635262, 1, 0.2745098, 0, 1,
-1.607386, 0.1093557, -2.041165, 1, 0.282353, 0, 1,
-1.605825, -0.1053893, -0.6007755, 1, 0.2862745, 0, 1,
-1.60483, -1.727444, -4.198288, 1, 0.2941177, 0, 1,
-1.59604, -1.588354, -0.9446389, 1, 0.3019608, 0, 1,
-1.591384, 0.5562897, -2.05554, 1, 0.3058824, 0, 1,
-1.590614, -1.378691, -2.118158, 1, 0.3137255, 0, 1,
-1.562776, 0.1822114, -0.8051858, 1, 0.3176471, 0, 1,
-1.54878, 0.3836178, -2.542909, 1, 0.3254902, 0, 1,
-1.548769, 0.745412, -0.7079617, 1, 0.3294118, 0, 1,
-1.534531, 0.05355594, -1.116494, 1, 0.3372549, 0, 1,
-1.532463, -1.813921, -0.5752127, 1, 0.3411765, 0, 1,
-1.532308, -0.9218016, -1.05923, 1, 0.3490196, 0, 1,
-1.520853, -0.1051553, -0.6780084, 1, 0.3529412, 0, 1,
-1.517701, -0.5596328, -3.274323, 1, 0.3607843, 0, 1,
-1.507645, 0.9820586, -1.434013, 1, 0.3647059, 0, 1,
-1.501275, -0.1430649, -3.205235, 1, 0.372549, 0, 1,
-1.495403, -0.1398099, -1.435025, 1, 0.3764706, 0, 1,
-1.492552, 0.7787408, -0.4929395, 1, 0.3843137, 0, 1,
-1.492193, 2.326921, -0.3193211, 1, 0.3882353, 0, 1,
-1.487046, -0.3041919, -2.10979, 1, 0.3960784, 0, 1,
-1.485676, 0.9740607, 0.01307955, 1, 0.4039216, 0, 1,
-1.478538, -1.951033, -1.955518, 1, 0.4078431, 0, 1,
-1.466833, 0.8792564, -1.75797, 1, 0.4156863, 0, 1,
-1.461603, -0.1834354, -4.325246, 1, 0.4196078, 0, 1,
-1.452855, -1.086626, -2.657689, 1, 0.427451, 0, 1,
-1.41053, 0.1133858, -2.258152, 1, 0.4313726, 0, 1,
-1.402569, -0.1470203, -1.456685, 1, 0.4392157, 0, 1,
-1.399384, 0.2714169, -2.330542, 1, 0.4431373, 0, 1,
-1.384548, -2.266034, -1.785821, 1, 0.4509804, 0, 1,
-1.352006, -1.11854, -1.243987, 1, 0.454902, 0, 1,
-1.345785, 1.76636, -0.7517097, 1, 0.4627451, 0, 1,
-1.344849, 0.1106178, -1.160408, 1, 0.4666667, 0, 1,
-1.332657, 0.2835018, 0.2088012, 1, 0.4745098, 0, 1,
-1.3309, -0.320696, -2.555731, 1, 0.4784314, 0, 1,
-1.328606, -1.88616, -2.893711, 1, 0.4862745, 0, 1,
-1.325399, 2.247932, -1.268374, 1, 0.4901961, 0, 1,
-1.325123, 0.09885327, -3.296161, 1, 0.4980392, 0, 1,
-1.324248, -0.8666118, -2.993695, 1, 0.5058824, 0, 1,
-1.322233, -0.9964062, -1.407425, 1, 0.509804, 0, 1,
-1.320203, 1.478738, -1.50368, 1, 0.5176471, 0, 1,
-1.319684, 0.2998134, -1.082021, 1, 0.5215687, 0, 1,
-1.305272, 0.940275, 0.6048207, 1, 0.5294118, 0, 1,
-1.30006, -1.125562, -3.010723, 1, 0.5333334, 0, 1,
-1.298696, 0.8096879, -1.124615, 1, 0.5411765, 0, 1,
-1.296541, 1.548665, -2.010312, 1, 0.5450981, 0, 1,
-1.295192, -1.747046, -3.072641, 1, 0.5529412, 0, 1,
-1.291319, -0.05390488, -2.479057, 1, 0.5568628, 0, 1,
-1.290077, -0.1747495, -1.148355, 1, 0.5647059, 0, 1,
-1.279432, -1.674073, -2.500361, 1, 0.5686275, 0, 1,
-1.266835, -0.9859624, -3.031932, 1, 0.5764706, 0, 1,
-1.25915, -0.6410502, -1.80138, 1, 0.5803922, 0, 1,
-1.257205, 0.4430155, -0.4091369, 1, 0.5882353, 0, 1,
-1.254516, -0.4005039, -2.704849, 1, 0.5921569, 0, 1,
-1.253967, -0.9173513, -2.351288, 1, 0.6, 0, 1,
-1.250982, 0.4878199, -0.1600169, 1, 0.6078432, 0, 1,
-1.249625, 0.9710087, -1.034352, 1, 0.6117647, 0, 1,
-1.246519, 0.4774517, -2.267391, 1, 0.6196079, 0, 1,
-1.243423, -0.05415808, -2.469628, 1, 0.6235294, 0, 1,
-1.233216, 0.2115113, -1.885019, 1, 0.6313726, 0, 1,
-1.2277, 0.4323724, -1.472511, 1, 0.6352941, 0, 1,
-1.227351, 1.091441, -0.5860971, 1, 0.6431373, 0, 1,
-1.22619, 0.285123, -2.813897, 1, 0.6470588, 0, 1,
-1.226026, 0.6443967, 0.6344373, 1, 0.654902, 0, 1,
-1.192752, 0.7799053, -1.501782, 1, 0.6588235, 0, 1,
-1.191194, 0.9220949, -0.1492386, 1, 0.6666667, 0, 1,
-1.190116, -1.899128, -2.812454, 1, 0.6705883, 0, 1,
-1.185631, 0.8867428, -3.537357, 1, 0.6784314, 0, 1,
-1.185061, 0.009920661, -1.645687, 1, 0.682353, 0, 1,
-1.184012, -1.040142, -1.77768, 1, 0.6901961, 0, 1,
-1.182532, 1.83566, -2.292958, 1, 0.6941177, 0, 1,
-1.181396, -0.1279865, -2.140704, 1, 0.7019608, 0, 1,
-1.180686, 0.9311214, -1.507681, 1, 0.7098039, 0, 1,
-1.164713, 0.6714882, -1.066015, 1, 0.7137255, 0, 1,
-1.16437, -1.572577, -2.787321, 1, 0.7215686, 0, 1,
-1.15738, -0.7343676, -1.307678, 1, 0.7254902, 0, 1,
-1.156297, 2.143393, -0.8177866, 1, 0.7333333, 0, 1,
-1.15406, -1.140318, -2.642894, 1, 0.7372549, 0, 1,
-1.151622, -0.6446705, -1.768122, 1, 0.7450981, 0, 1,
-1.150776, 0.3483288, -0.5581343, 1, 0.7490196, 0, 1,
-1.146833, -1.612337, -2.029815, 1, 0.7568628, 0, 1,
-1.14553, 0.2759374, -2.147053, 1, 0.7607843, 0, 1,
-1.134219, -1.440005, -2.708633, 1, 0.7686275, 0, 1,
-1.125312, 1.364948, -0.8483453, 1, 0.772549, 0, 1,
-1.121357, -0.8473366, -0.9274066, 1, 0.7803922, 0, 1,
-1.117479, -0.4831059, -2.182157, 1, 0.7843137, 0, 1,
-1.116884, -0.2161758, -3.046602, 1, 0.7921569, 0, 1,
-1.112224, -1.453131, -3.456151, 1, 0.7960784, 0, 1,
-1.103134, -0.6892307, -2.085987, 1, 0.8039216, 0, 1,
-1.098941, 0.9398318, -0.1100696, 1, 0.8117647, 0, 1,
-1.088224, 0.4504784, 0.3261847, 1, 0.8156863, 0, 1,
-1.085441, -1.274519, -1.502292, 1, 0.8235294, 0, 1,
-1.073986, 1.551641, -0.6553516, 1, 0.827451, 0, 1,
-1.070875, 0.6750797, -0.3848554, 1, 0.8352941, 0, 1,
-1.058184, 0.8236339, -1.907501, 1, 0.8392157, 0, 1,
-1.052938, -0.4577769, -0.8438969, 1, 0.8470588, 0, 1,
-1.051876, 0.6866949, -0.5435626, 1, 0.8509804, 0, 1,
-1.048879, -1.6636, -1.716781, 1, 0.8588235, 0, 1,
-1.039523, 1.463059, 0.5426295, 1, 0.8627451, 0, 1,
-1.030716, -0.0754711, -0.9272807, 1, 0.8705882, 0, 1,
-1.014808, -0.7143601, -1.07377, 1, 0.8745098, 0, 1,
-1.012037, 0.3097676, -2.161699, 1, 0.8823529, 0, 1,
-1.006794, -1.378071, -1.895018, 1, 0.8862745, 0, 1,
-1.006288, -0.2795295, -2.274806, 1, 0.8941177, 0, 1,
-1.005205, -1.434464, -1.410547, 1, 0.8980392, 0, 1,
-1.004094, 0.563071, -0.004881397, 1, 0.9058824, 0, 1,
-0.9975184, 1.1224, -1.230793, 1, 0.9137255, 0, 1,
-0.9953759, -0.2809818, -2.871713, 1, 0.9176471, 0, 1,
-0.9926524, 2.408211, 1.626642, 1, 0.9254902, 0, 1,
-0.9906605, -0.83347, -1.428349, 1, 0.9294118, 0, 1,
-0.989302, 2.344115, -0.9996687, 1, 0.9372549, 0, 1,
-0.9814549, -0.1532587, -0.07527616, 1, 0.9411765, 0, 1,
-0.9772264, 0.04335836, -2.337847, 1, 0.9490196, 0, 1,
-0.9672719, 1.362751, -0.9049871, 1, 0.9529412, 0, 1,
-0.9656647, 0.3965622, -2.164122, 1, 0.9607843, 0, 1,
-0.965102, 1.66011, -1.725991, 1, 0.9647059, 0, 1,
-0.96363, 0.7299446, -0.4609459, 1, 0.972549, 0, 1,
-0.959109, -0.9584047, -2.529674, 1, 0.9764706, 0, 1,
-0.9573134, 0.03161678, -1.090865, 1, 0.9843137, 0, 1,
-0.9493936, 1.019484, -0.3968382, 1, 0.9882353, 0, 1,
-0.9481251, -0.4468509, -1.239993, 1, 0.9960784, 0, 1,
-0.9450046, 1.355329, 0.5938658, 0.9960784, 1, 0, 1,
-0.9416276, 0.9452494, -0.0962799, 0.9921569, 1, 0, 1,
-0.932416, 0.793629, -1.410746, 0.9843137, 1, 0, 1,
-0.9323606, 0.7107307, -0.8579595, 0.9803922, 1, 0, 1,
-0.929893, 1.376434, 0.915391, 0.972549, 1, 0, 1,
-0.9154055, -0.1738218, -0.3314524, 0.9686275, 1, 0, 1,
-0.9064215, 1.734306, 0.9284096, 0.9607843, 1, 0, 1,
-0.9050784, -0.5286231, 0.2375994, 0.9568627, 1, 0, 1,
-0.9046468, 1.180657, -0.03954661, 0.9490196, 1, 0, 1,
-0.9038476, -0.01093744, -1.914221, 0.945098, 1, 0, 1,
-0.8891443, -1.123135, -1.833333, 0.9372549, 1, 0, 1,
-0.8847541, -1.95899, -3.686244, 0.9333333, 1, 0, 1,
-0.8846731, -0.9613144, -5.266389, 0.9254902, 1, 0, 1,
-0.8836999, -1.279145, -2.462586, 0.9215686, 1, 0, 1,
-0.8833993, -0.5763945, -0.7931867, 0.9137255, 1, 0, 1,
-0.8826104, 0.5732846, -1.132542, 0.9098039, 1, 0, 1,
-0.8809788, 0.1805845, -1.239314, 0.9019608, 1, 0, 1,
-0.8804638, -0.3705196, -4.200155, 0.8941177, 1, 0, 1,
-0.8786742, 0.8002693, 0.7042413, 0.8901961, 1, 0, 1,
-0.8780922, -0.2748226, -2.477654, 0.8823529, 1, 0, 1,
-0.872506, -1.096246, -2.798671, 0.8784314, 1, 0, 1,
-0.8588502, -0.2689991, -1.642357, 0.8705882, 1, 0, 1,
-0.8531412, -0.05625016, -2.293881, 0.8666667, 1, 0, 1,
-0.8528914, -0.9178095, -2.581633, 0.8588235, 1, 0, 1,
-0.8514206, 1.783451, 1.183938, 0.854902, 1, 0, 1,
-0.8508032, -0.5798779, -1.077162, 0.8470588, 1, 0, 1,
-0.8476847, 1.20552, -3.210028, 0.8431373, 1, 0, 1,
-0.8476241, 0.1973849, -2.184817, 0.8352941, 1, 0, 1,
-0.847608, -0.9545335, -3.295956, 0.8313726, 1, 0, 1,
-0.8382413, -0.4047782, -3.257143, 0.8235294, 1, 0, 1,
-0.8367186, 0.5072215, -0.7464144, 0.8196079, 1, 0, 1,
-0.8360149, -0.8783077, -2.922023, 0.8117647, 1, 0, 1,
-0.8320453, 1.298656, -0.5879206, 0.8078431, 1, 0, 1,
-0.8280421, -0.1364245, -2.534499, 0.8, 1, 0, 1,
-0.8216592, -0.1839176, -3.596149, 0.7921569, 1, 0, 1,
-0.8160325, 1.439422, -2.208045, 0.7882353, 1, 0, 1,
-0.8092301, -0.1928665, -1.169718, 0.7803922, 1, 0, 1,
-0.8072199, -0.3846334, -1.921893, 0.7764706, 1, 0, 1,
-0.8021306, -1.102184, -2.516463, 0.7686275, 1, 0, 1,
-0.7988224, -0.6822553, -2.841184, 0.7647059, 1, 0, 1,
-0.7959294, 1.297388, -0.9416147, 0.7568628, 1, 0, 1,
-0.7937816, -0.5768527, -0.3090698, 0.7529412, 1, 0, 1,
-0.791715, -0.7193183, -3.325868, 0.7450981, 1, 0, 1,
-0.7902676, 0.1414767, -0.1064314, 0.7411765, 1, 0, 1,
-0.7885976, 1.262247, -1.801066, 0.7333333, 1, 0, 1,
-0.7870093, 1.822942, -0.3394095, 0.7294118, 1, 0, 1,
-0.7847105, -2.051054, -2.426203, 0.7215686, 1, 0, 1,
-0.7842634, 1.227657, -1.385721, 0.7176471, 1, 0, 1,
-0.7825813, -2.494905, -3.810937, 0.7098039, 1, 0, 1,
-0.7723855, 1.617044, -1.791098, 0.7058824, 1, 0, 1,
-0.7657978, -0.5961626, -3.363999, 0.6980392, 1, 0, 1,
-0.7657462, 0.2671967, -2.408486, 0.6901961, 1, 0, 1,
-0.7640833, -0.1163893, -1.995214, 0.6862745, 1, 0, 1,
-0.7569639, 0.128806, -2.904986, 0.6784314, 1, 0, 1,
-0.7526126, -2.573071, -3.119338, 0.6745098, 1, 0, 1,
-0.749245, -1.412146, -2.426174, 0.6666667, 1, 0, 1,
-0.7477902, 0.8814429, -0.7757995, 0.6627451, 1, 0, 1,
-0.7392043, 1.66256, -1.939163, 0.654902, 1, 0, 1,
-0.7372666, 0.3335407, -1.977026, 0.6509804, 1, 0, 1,
-0.7315589, -0.3123618, -0.5638974, 0.6431373, 1, 0, 1,
-0.7300683, -1.778568, -3.16484, 0.6392157, 1, 0, 1,
-0.729018, 1.417138, -0.6375262, 0.6313726, 1, 0, 1,
-0.7229518, 0.07768255, 0.4977826, 0.627451, 1, 0, 1,
-0.7205092, 0.162626, -1.530381, 0.6196079, 1, 0, 1,
-0.7204385, -1.246722, -2.432299, 0.6156863, 1, 0, 1,
-0.7170513, 1.388977, -0.6139645, 0.6078432, 1, 0, 1,
-0.7156036, -0.1242855, -2.246464, 0.6039216, 1, 0, 1,
-0.7133502, -0.8424194, -3.41055, 0.5960785, 1, 0, 1,
-0.7108449, -0.3822168, -1.814913, 0.5882353, 1, 0, 1,
-0.709042, 0.7304828, -1.643826, 0.5843138, 1, 0, 1,
-0.7034107, -0.5534688, -3.591754, 0.5764706, 1, 0, 1,
-0.7021133, 1.372836, -0.7506641, 0.572549, 1, 0, 1,
-0.6998031, -0.9151754, -3.493939, 0.5647059, 1, 0, 1,
-0.6988988, 1.273248, 0.2222696, 0.5607843, 1, 0, 1,
-0.6966633, 1.123345, 0.1538799, 0.5529412, 1, 0, 1,
-0.6943192, -1.047537, -4.297158, 0.5490196, 1, 0, 1,
-0.6933808, 0.4784367, -1.615331, 0.5411765, 1, 0, 1,
-0.6868734, -1.694883, -4.680826, 0.5372549, 1, 0, 1,
-0.6866741, -1.88071, -3.202481, 0.5294118, 1, 0, 1,
-0.6814292, 0.445126, -2.102785, 0.5254902, 1, 0, 1,
-0.6768932, -0.8268578, -3.150246, 0.5176471, 1, 0, 1,
-0.6755425, 1.350988, -0.6303584, 0.5137255, 1, 0, 1,
-0.6677543, 1.68619, 0.1086143, 0.5058824, 1, 0, 1,
-0.6640234, -0.7801024, -3.466974, 0.5019608, 1, 0, 1,
-0.661417, -0.6568047, -2.659132, 0.4941176, 1, 0, 1,
-0.6602409, 0.4069844, -1.82779, 0.4862745, 1, 0, 1,
-0.6521966, 0.3444321, -1.124321, 0.4823529, 1, 0, 1,
-0.6496364, 0.7882048, -3.4197, 0.4745098, 1, 0, 1,
-0.6460575, 0.883594, -0.2994642, 0.4705882, 1, 0, 1,
-0.6440747, 0.08913513, -0.02206527, 0.4627451, 1, 0, 1,
-0.6403487, 0.2905145, -1.350752, 0.4588235, 1, 0, 1,
-0.6373472, -0.7477788, -0.8453259, 0.4509804, 1, 0, 1,
-0.6307951, -1.723941, -3.717195, 0.4470588, 1, 0, 1,
-0.6300638, 0.008251408, -1.14608, 0.4392157, 1, 0, 1,
-0.6295612, 0.07760116, -1.717137, 0.4352941, 1, 0, 1,
-0.6197185, 0.06579261, 0.2202511, 0.427451, 1, 0, 1,
-0.6173294, -0.02420946, -2.311842, 0.4235294, 1, 0, 1,
-0.6098929, -0.6700226, -4.148377, 0.4156863, 1, 0, 1,
-0.6082903, -0.1895738, -0.9374129, 0.4117647, 1, 0, 1,
-0.6070803, -0.5685885, -2.244905, 0.4039216, 1, 0, 1,
-0.6030445, 1.286032, -0.6531287, 0.3960784, 1, 0, 1,
-0.6004998, -1.631069, -2.072582, 0.3921569, 1, 0, 1,
-0.5931671, -1.082864, -2.919501, 0.3843137, 1, 0, 1,
-0.5920299, 0.3737569, -1.397759, 0.3803922, 1, 0, 1,
-0.5914156, 0.0119183, -2.89011, 0.372549, 1, 0, 1,
-0.5877177, -0.281824, -2.260864, 0.3686275, 1, 0, 1,
-0.5858615, 0.1943224, -1.195507, 0.3607843, 1, 0, 1,
-0.5834434, 0.04313102, -2.922153, 0.3568628, 1, 0, 1,
-0.582798, -0.2714517, -2.064096, 0.3490196, 1, 0, 1,
-0.5715554, -0.009240422, -1.540952, 0.345098, 1, 0, 1,
-0.5678523, -0.7731524, -2.675765, 0.3372549, 1, 0, 1,
-0.5657607, 1.622291, 0.163514, 0.3333333, 1, 0, 1,
-0.5621001, 0.7285342, -0.83047, 0.3254902, 1, 0, 1,
-0.5592943, 2.285356, 2.076484, 0.3215686, 1, 0, 1,
-0.5589293, -0.9254116, -3.106269, 0.3137255, 1, 0, 1,
-0.5554303, 1.165245, -0.6777487, 0.3098039, 1, 0, 1,
-0.5500128, 0.1243948, -1.883003, 0.3019608, 1, 0, 1,
-0.5463257, -2.347329, -3.585926, 0.2941177, 1, 0, 1,
-0.5458567, 1.209354, 1.123415, 0.2901961, 1, 0, 1,
-0.5428516, -0.1785298, -3.046694, 0.282353, 1, 0, 1,
-0.538361, 0.9362534, -0.7769544, 0.2784314, 1, 0, 1,
-0.5322466, 0.03464868, -3.195565, 0.2705882, 1, 0, 1,
-0.525818, 0.4751998, -0.740177, 0.2666667, 1, 0, 1,
-0.5199701, -0.4886539, -2.075023, 0.2588235, 1, 0, 1,
-0.5189289, -0.510596, -1.412631, 0.254902, 1, 0, 1,
-0.5160156, -0.8143829, -1.673463, 0.2470588, 1, 0, 1,
-0.5128626, -1.937102, -3.572448, 0.2431373, 1, 0, 1,
-0.5124791, 0.5433227, -1.011086, 0.2352941, 1, 0, 1,
-0.5108616, -0.3335166, -1.828011, 0.2313726, 1, 0, 1,
-0.5093879, 0.4741627, 0.9671924, 0.2235294, 1, 0, 1,
-0.5088054, -0.8248327, -2.612883, 0.2196078, 1, 0, 1,
-0.5082477, 0.9843457, 1.105147, 0.2117647, 1, 0, 1,
-0.5060729, -0.07470305, -2.184847, 0.2078431, 1, 0, 1,
-0.5028694, 0.04330959, -1.935308, 0.2, 1, 0, 1,
-0.5028044, -0.9178693, -1.75015, 0.1921569, 1, 0, 1,
-0.502678, -2.024256, -1.724392, 0.1882353, 1, 0, 1,
-0.4990908, -0.5901208, -1.985953, 0.1803922, 1, 0, 1,
-0.4985522, 0.8663505, 0.892806, 0.1764706, 1, 0, 1,
-0.4980384, -2.102499, -1.48667, 0.1686275, 1, 0, 1,
-0.4914799, 0.2947896, -1.363519, 0.1647059, 1, 0, 1,
-0.4835186, -1.724397, -1.160717, 0.1568628, 1, 0, 1,
-0.4758446, 0.4198658, 0.001155007, 0.1529412, 1, 0, 1,
-0.475661, 2.149738, -0.3030663, 0.145098, 1, 0, 1,
-0.4747007, 0.2646198, -0.2869439, 0.1411765, 1, 0, 1,
-0.4718533, -1.315325, -3.023714, 0.1333333, 1, 0, 1,
-0.4714647, -1.554555, -2.107383, 0.1294118, 1, 0, 1,
-0.4689492, 0.91709, -0.02717147, 0.1215686, 1, 0, 1,
-0.4681533, 1.560741, 1.705331, 0.1176471, 1, 0, 1,
-0.4675637, -0.07482865, -0.09179381, 0.1098039, 1, 0, 1,
-0.467413, -1.887448, -3.192493, 0.1058824, 1, 0, 1,
-0.4668377, -1.410906, -3.355685, 0.09803922, 1, 0, 1,
-0.4649572, -0.3755516, -2.731521, 0.09019608, 1, 0, 1,
-0.4594726, -1.44747, -2.854083, 0.08627451, 1, 0, 1,
-0.4566976, -0.7876596, -2.13254, 0.07843138, 1, 0, 1,
-0.4545994, -0.3746263, -3.83311, 0.07450981, 1, 0, 1,
-0.4497468, 0.173261, -1.442706, 0.06666667, 1, 0, 1,
-0.4458336, -1.542985, -3.474697, 0.0627451, 1, 0, 1,
-0.438888, -0.5762461, -3.838685, 0.05490196, 1, 0, 1,
-0.4350153, 0.6835062, -0.3516248, 0.05098039, 1, 0, 1,
-0.4295477, 0.1374256, -1.150098, 0.04313726, 1, 0, 1,
-0.4232911, -2.090239, -3.389724, 0.03921569, 1, 0, 1,
-0.4228959, -0.03645734, -1.902225, 0.03137255, 1, 0, 1,
-0.4199367, -1.308164, -3.469421, 0.02745098, 1, 0, 1,
-0.4177325, -0.3347297, -2.899793, 0.01960784, 1, 0, 1,
-0.4170546, 1.183271, -1.880775, 0.01568628, 1, 0, 1,
-0.412947, -0.7609878, -2.877777, 0.007843138, 1, 0, 1,
-0.4123769, 0.09342472, -2.780086, 0.003921569, 1, 0, 1,
-0.4072382, 1.359212, -1.250641, 0, 1, 0.003921569, 1,
-0.4051628, 1.164163, -0.05194008, 0, 1, 0.01176471, 1,
-0.4045909, -1.998711, -3.199356, 0, 1, 0.01568628, 1,
-0.4015396, 2.084418, -0.08580608, 0, 1, 0.02352941, 1,
-0.398186, 0.03837337, -1.670868, 0, 1, 0.02745098, 1,
-0.3963839, -0.386239, -1.667693, 0, 1, 0.03529412, 1,
-0.3941219, -0.8064402, -2.604604, 0, 1, 0.03921569, 1,
-0.3930565, -0.2735311, -3.884422, 0, 1, 0.04705882, 1,
-0.3866536, 0.1321089, -0.2526218, 0, 1, 0.05098039, 1,
-0.3841477, -0.5852282, -2.556011, 0, 1, 0.05882353, 1,
-0.3834411, -1.138589, -2.021909, 0, 1, 0.0627451, 1,
-0.3803461, 0.3697441, -2.10371, 0, 1, 0.07058824, 1,
-0.3642391, -0.6685469, -2.034612, 0, 1, 0.07450981, 1,
-0.3641546, -0.2862215, -3.234523, 0, 1, 0.08235294, 1,
-0.3625583, 1.107127, 1.064192, 0, 1, 0.08627451, 1,
-0.3613041, -0.2488374, -2.743297, 0, 1, 0.09411765, 1,
-0.3608643, 0.7604025, -0.4495417, 0, 1, 0.1019608, 1,
-0.3586126, -0.8834658, -2.262105, 0, 1, 0.1058824, 1,
-0.3510286, 0.3841113, -0.6028077, 0, 1, 0.1137255, 1,
-0.3509325, 0.8162363, 1.113729, 0, 1, 0.1176471, 1,
-0.3496622, 1.451722, -0.3547646, 0, 1, 0.1254902, 1,
-0.3476835, -1.340348, -3.078274, 0, 1, 0.1294118, 1,
-0.345367, 0.01725488, -1.86413, 0, 1, 0.1372549, 1,
-0.3418403, -0.4903732, -3.526546, 0, 1, 0.1411765, 1,
-0.3392471, -1.968776, -2.333951, 0, 1, 0.1490196, 1,
-0.3372409, 0.5947734, -0.07122319, 0, 1, 0.1529412, 1,
-0.3302809, 0.1188842, 1.27765, 0, 1, 0.1607843, 1,
-0.3201463, -0.8079202, -1.746317, 0, 1, 0.1647059, 1,
-0.3182703, 0.1160414, -0.3791268, 0, 1, 0.172549, 1,
-0.3177525, -0.4074628, -2.451211, 0, 1, 0.1764706, 1,
-0.315369, -1.029941, -1.857573, 0, 1, 0.1843137, 1,
-0.3115467, -0.3852335, -3.168943, 0, 1, 0.1882353, 1,
-0.3102209, 0.8517128, -1.260675, 0, 1, 0.1960784, 1,
-0.3087421, -1.740818, -1.873747, 0, 1, 0.2039216, 1,
-0.3077922, -1.552382, -0.9300592, 0, 1, 0.2078431, 1,
-0.3070197, 0.731733, -1.835482, 0, 1, 0.2156863, 1,
-0.3047876, -0.9732274, -3.382985, 0, 1, 0.2196078, 1,
-0.3028851, 1.074244, -0.9259851, 0, 1, 0.227451, 1,
-0.3018587, -1.526744, -3.317317, 0, 1, 0.2313726, 1,
-0.2985858, -0.1011765, -3.363057, 0, 1, 0.2392157, 1,
-0.29788, 1.464752, -0.02564768, 0, 1, 0.2431373, 1,
-0.2978652, -0.09069534, -2.705807, 0, 1, 0.2509804, 1,
-0.2918234, 0.2582612, -1.457201, 0, 1, 0.254902, 1,
-0.2912532, 0.3850008, 0.5322165, 0, 1, 0.2627451, 1,
-0.2908233, 0.0414057, 1.189389, 0, 1, 0.2666667, 1,
-0.2839526, -0.05543919, -1.788125, 0, 1, 0.2745098, 1,
-0.2832242, -0.2793089, -2.527606, 0, 1, 0.2784314, 1,
-0.2777593, 1.302569, -0.4154372, 0, 1, 0.2862745, 1,
-0.2772064, 0.1546778, -1.320299, 0, 1, 0.2901961, 1,
-0.2726285, -0.05715815, -0.4493893, 0, 1, 0.2980392, 1,
-0.2689094, 0.1531458, -1.123025, 0, 1, 0.3058824, 1,
-0.2661463, 1.487939, -0.4769347, 0, 1, 0.3098039, 1,
-0.2549486, -0.5981706, -4.067335, 0, 1, 0.3176471, 1,
-0.2518299, -0.1316881, -2.050262, 0, 1, 0.3215686, 1,
-0.2494778, -0.8390437, -3.593343, 0, 1, 0.3294118, 1,
-0.248734, -0.7778727, -2.944001, 0, 1, 0.3333333, 1,
-0.2476071, 0.122579, -0.9296905, 0, 1, 0.3411765, 1,
-0.2378124, 0.8643057, 0.8275699, 0, 1, 0.345098, 1,
-0.2376187, -2.092773, -1.403183, 0, 1, 0.3529412, 1,
-0.2374944, -0.2050824, -1.957541, 0, 1, 0.3568628, 1,
-0.2370343, 0.2098303, -1.686618, 0, 1, 0.3647059, 1,
-0.2354155, -0.4750672, -2.844557, 0, 1, 0.3686275, 1,
-0.2316116, 0.3828551, -1.859556, 0, 1, 0.3764706, 1,
-0.2286297, 0.03248881, -1.59779, 0, 1, 0.3803922, 1,
-0.2285084, -1.638525, -3.05845, 0, 1, 0.3882353, 1,
-0.2271529, -1.329861, -1.885401, 0, 1, 0.3921569, 1,
-0.2258589, -0.06836945, -2.774905, 0, 1, 0.4, 1,
-0.2228957, -0.1909835, -3.060843, 0, 1, 0.4078431, 1,
-0.2160996, 1.385028, -0.6036432, 0, 1, 0.4117647, 1,
-0.2151267, -0.1952187, -1.718935, 0, 1, 0.4196078, 1,
-0.2144197, -0.2899356, -3.531989, 0, 1, 0.4235294, 1,
-0.2094578, -0.03695165, -1.902452, 0, 1, 0.4313726, 1,
-0.2046739, 0.7716919, -2.526344, 0, 1, 0.4352941, 1,
-0.2019563, 1.016838, -2.390006, 0, 1, 0.4431373, 1,
-0.1975064, -1.003715, -2.652434, 0, 1, 0.4470588, 1,
-0.1947125, -0.3921037, -2.34905, 0, 1, 0.454902, 1,
-0.1913511, 1.091453, 0.7663548, 0, 1, 0.4588235, 1,
-0.1890475, 0.7184931, 0.2686411, 0, 1, 0.4666667, 1,
-0.1853754, 0.9183404, 2.229224, 0, 1, 0.4705882, 1,
-0.1850272, -0.8866447, -2.867546, 0, 1, 0.4784314, 1,
-0.1832277, -1.349043, -3.901202, 0, 1, 0.4823529, 1,
-0.1727129, 0.9494743, -1.484224, 0, 1, 0.4901961, 1,
-0.1688237, -0.3573166, -2.713769, 0, 1, 0.4941176, 1,
-0.1657228, -0.9211128, -5.567167, 0, 1, 0.5019608, 1,
-0.1647208, 0.8971585, -0.9829126, 0, 1, 0.509804, 1,
-0.1594467, -0.6551617, -3.520334, 0, 1, 0.5137255, 1,
-0.1564591, 0.4978647, -0.4935622, 0, 1, 0.5215687, 1,
-0.1561465, -0.2110044, -4.011936, 0, 1, 0.5254902, 1,
-0.1559972, 0.3784049, -1.069253, 0, 1, 0.5333334, 1,
-0.1521122, -0.0009347461, -0.5190948, 0, 1, 0.5372549, 1,
-0.1515644, -0.1388939, -1.417082, 0, 1, 0.5450981, 1,
-0.1478776, 1.15238, 0.8384913, 0, 1, 0.5490196, 1,
-0.1470864, 0.1103259, -3.13132, 0, 1, 0.5568628, 1,
-0.1464433, 0.7226437, -1.349587, 0, 1, 0.5607843, 1,
-0.1452749, -0.4097802, -2.963214, 0, 1, 0.5686275, 1,
-0.1418339, -0.6335271, -3.276277, 0, 1, 0.572549, 1,
-0.1397686, -0.523524, -3.135148, 0, 1, 0.5803922, 1,
-0.1318521, -0.8373336, -4.271563, 0, 1, 0.5843138, 1,
-0.1310504, 0.2088901, -0.5137974, 0, 1, 0.5921569, 1,
-0.1303689, 0.6296071, -0.1005157, 0, 1, 0.5960785, 1,
-0.1277198, 0.8482248, 1.003515, 0, 1, 0.6039216, 1,
-0.1177911, -0.5498434, -2.537274, 0, 1, 0.6117647, 1,
-0.1169498, 1.318179, 0.3936155, 0, 1, 0.6156863, 1,
-0.1118696, -0.4950655, -1.040951, 0, 1, 0.6235294, 1,
-0.1093772, 2.833658, -0.6176611, 0, 1, 0.627451, 1,
-0.1086761, 0.294897, -0.8693465, 0, 1, 0.6352941, 1,
-0.1085071, 1.145538, 0.03267287, 0, 1, 0.6392157, 1,
-0.1064019, -1.071471, -4.116735, 0, 1, 0.6470588, 1,
-0.1052217, 0.1787197, -0.434132, 0, 1, 0.6509804, 1,
-0.1034159, 0.1536294, -2.720351, 0, 1, 0.6588235, 1,
-0.1028296, -0.4534898, -1.248135, 0, 1, 0.6627451, 1,
-0.1018137, -0.04546259, -1.868933, 0, 1, 0.6705883, 1,
-0.1016027, 0.476035, 0.4008081, 0, 1, 0.6745098, 1,
-0.09985218, 0.2994056, -0.5144064, 0, 1, 0.682353, 1,
-0.09524914, -1.032981, -4.692594, 0, 1, 0.6862745, 1,
-0.09457673, -0.4192229, -3.12993, 0, 1, 0.6941177, 1,
-0.09421666, -0.2726295, -1.258341, 0, 1, 0.7019608, 1,
-0.09386948, -0.7531383, -2.393607, 0, 1, 0.7058824, 1,
-0.09350895, 0.6558801, -0.5277072, 0, 1, 0.7137255, 1,
-0.09334101, -0.0230901, -2.212749, 0, 1, 0.7176471, 1,
-0.08763493, 2.017892, 0.343387, 0, 1, 0.7254902, 1,
-0.08692118, 1.82544, -1.648225, 0, 1, 0.7294118, 1,
-0.082746, 1.859431, -0.6488274, 0, 1, 0.7372549, 1,
-0.08223116, 2.299004, -2.195581, 0, 1, 0.7411765, 1,
-0.08203667, -0.03837726, -2.256957, 0, 1, 0.7490196, 1,
-0.06831864, -0.9210353, -1.477609, 0, 1, 0.7529412, 1,
-0.06822914, -2.39881, -4.216645, 0, 1, 0.7607843, 1,
-0.06815322, 0.09821742, -1.246742, 0, 1, 0.7647059, 1,
-0.06054183, -2.067627, -3.847702, 0, 1, 0.772549, 1,
-0.06017373, -1.993564, -4.438984, 0, 1, 0.7764706, 1,
-0.05906405, -0.9915738, -1.851184, 0, 1, 0.7843137, 1,
-0.05843497, -0.6388041, -3.211204, 0, 1, 0.7882353, 1,
-0.05471546, -1.406044, -2.020115, 0, 1, 0.7960784, 1,
-0.05325851, 0.01068934, -2.550771, 0, 1, 0.8039216, 1,
-0.04605345, 3.27343, -1.238861, 0, 1, 0.8078431, 1,
-0.04579703, 0.7783238, 0.08222993, 0, 1, 0.8156863, 1,
-0.04563798, 0.6564135, -1.528348, 0, 1, 0.8196079, 1,
-0.03998636, -1.905083, -3.277115, 0, 1, 0.827451, 1,
-0.03755188, -1.394233, -2.333295, 0, 1, 0.8313726, 1,
-0.03690088, 0.3072602, 0.2558526, 0, 1, 0.8392157, 1,
-0.03478075, 0.2505522, -0.4127468, 0, 1, 0.8431373, 1,
-0.02940379, -0.2234135, -3.965094, 0, 1, 0.8509804, 1,
-0.02806376, 0.8526424, -0.5062765, 0, 1, 0.854902, 1,
-0.02755873, 0.6512334, 0.01184732, 0, 1, 0.8627451, 1,
-0.02185293, -0.4360539, -4.210336, 0, 1, 0.8666667, 1,
-0.0203772, -0.6027839, -1.547348, 0, 1, 0.8745098, 1,
-0.01780593, 0.4731936, -0.6048582, 0, 1, 0.8784314, 1,
-0.01729161, -0.8185281, -4.346021, 0, 1, 0.8862745, 1,
-0.01316093, -1.769385, -3.480342, 0, 1, 0.8901961, 1,
-0.01121807, 0.599145, -0.2073295, 0, 1, 0.8980392, 1,
-0.001672672, -0.6665702, -2.490822, 0, 1, 0.9058824, 1,
0.002842103, 0.1276876, 0.4415843, 0, 1, 0.9098039, 1,
0.01264232, -0.3589322, 3.764914, 0, 1, 0.9176471, 1,
0.01340371, 0.9753976, 0.6819478, 0, 1, 0.9215686, 1,
0.01501272, -0.1615814, 2.070095, 0, 1, 0.9294118, 1,
0.01514568, 1.01814, -1.285826, 0, 1, 0.9333333, 1,
0.01862136, -0.3010761, 1.861592, 0, 1, 0.9411765, 1,
0.01942106, -0.2956078, 2.740182, 0, 1, 0.945098, 1,
0.02065373, 0.1762005, 0.2811354, 0, 1, 0.9529412, 1,
0.02668563, 0.6708654, 0.1398471, 0, 1, 0.9568627, 1,
0.02727275, -1.290375, 2.904617, 0, 1, 0.9647059, 1,
0.04121092, -0.7032974, 2.513052, 0, 1, 0.9686275, 1,
0.04168775, -0.8076379, 3.992355, 0, 1, 0.9764706, 1,
0.0443606, -0.2522081, 3.349985, 0, 1, 0.9803922, 1,
0.04640606, 1.387012, -0.667991, 0, 1, 0.9882353, 1,
0.0482629, 0.7361891, 1.334454, 0, 1, 0.9921569, 1,
0.04980767, -1.281707, 2.080158, 0, 1, 1, 1,
0.0505202, -0.8289145, 2.224098, 0, 0.9921569, 1, 1,
0.0569347, -0.9044623, 2.806499, 0, 0.9882353, 1, 1,
0.05827503, 0.5156783, -1.33236, 0, 0.9803922, 1, 1,
0.06053454, 0.4294036, -0.2642163, 0, 0.9764706, 1, 1,
0.06491586, -1.307584, 4.510334, 0, 0.9686275, 1, 1,
0.06868251, 0.3551633, -0.528544, 0, 0.9647059, 1, 1,
0.06873313, 2.091059, 0.7287319, 0, 0.9568627, 1, 1,
0.07372354, -0.6219795, 3.401393, 0, 0.9529412, 1, 1,
0.07373707, 1.024836, 0.6731671, 0, 0.945098, 1, 1,
0.07399335, -0.8368575, 1.446809, 0, 0.9411765, 1, 1,
0.07721538, -0.876808, 3.466897, 0, 0.9333333, 1, 1,
0.08034837, -1.62175, 2.702608, 0, 0.9294118, 1, 1,
0.08380643, -0.9087228, 2.137899, 0, 0.9215686, 1, 1,
0.0880495, 1.347253, -0.4668679, 0, 0.9176471, 1, 1,
0.08880416, -1.058187, 4.284005, 0, 0.9098039, 1, 1,
0.08925078, -0.1902049, 1.810459, 0, 0.9058824, 1, 1,
0.0906513, 0.6684365, 0.08652428, 0, 0.8980392, 1, 1,
0.09823463, -1.214037, 2.203941, 0, 0.8901961, 1, 1,
0.09837443, -0.2741867, 3.427948, 0, 0.8862745, 1, 1,
0.1030391, 1.886768, 0.3011273, 0, 0.8784314, 1, 1,
0.1037267, -0.6767681, 2.663968, 0, 0.8745098, 1, 1,
0.1039746, -0.1213466, 3.536308, 0, 0.8666667, 1, 1,
0.1042227, -1.226394, 1.852849, 0, 0.8627451, 1, 1,
0.1067031, -0.1980934, 0.3815821, 0, 0.854902, 1, 1,
0.1108928, 0.1456027, 0.1252642, 0, 0.8509804, 1, 1,
0.1119467, -2.035426, 3.910516, 0, 0.8431373, 1, 1,
0.1123151, 0.1230995, 1.992427, 0, 0.8392157, 1, 1,
0.1127771, 0.03640671, 0.4478304, 0, 0.8313726, 1, 1,
0.1142203, -1.982734, 2.121307, 0, 0.827451, 1, 1,
0.1217969, 1.377413, -0.1671004, 0, 0.8196079, 1, 1,
0.1218267, 2.255331, -0.186239, 0, 0.8156863, 1, 1,
0.1243902, 0.9880923, 0.859651, 0, 0.8078431, 1, 1,
0.1258069, -0.6188154, 2.848429, 0, 0.8039216, 1, 1,
0.1260956, -0.8441755, 1.589185, 0, 0.7960784, 1, 1,
0.1272943, 2.725373, -0.1382605, 0, 0.7882353, 1, 1,
0.1286452, 1.924469, 0.1642169, 0, 0.7843137, 1, 1,
0.1292603, -0.3517391, 0.6839955, 0, 0.7764706, 1, 1,
0.1380522, 0.4174248, 0.8098994, 0, 0.772549, 1, 1,
0.1401597, 0.6663653, -0.5069526, 0, 0.7647059, 1, 1,
0.1404023, 0.5941898, 0.7937862, 0, 0.7607843, 1, 1,
0.1439008, 0.8905456, 0.2443508, 0, 0.7529412, 1, 1,
0.1521897, 0.6896352, -0.1082949, 0, 0.7490196, 1, 1,
0.1553592, 0.4166358, 0.9215987, 0, 0.7411765, 1, 1,
0.1556747, 0.9104232, 1.479039, 0, 0.7372549, 1, 1,
0.1589342, 0.0636996, 0.2500782, 0, 0.7294118, 1, 1,
0.1606727, 0.27552, 1.431612, 0, 0.7254902, 1, 1,
0.1613355, -1.359112, 2.83204, 0, 0.7176471, 1, 1,
0.1637927, 0.09610751, 2.246805, 0, 0.7137255, 1, 1,
0.1693363, 0.6019698, 0.1497015, 0, 0.7058824, 1, 1,
0.1738489, 0.521314, 2.354067, 0, 0.6980392, 1, 1,
0.1779091, 0.5002395, 2.688666, 0, 0.6941177, 1, 1,
0.1786885, 0.2186239, 1.424143, 0, 0.6862745, 1, 1,
0.179692, 0.1149923, 2.316983, 0, 0.682353, 1, 1,
0.1810303, 0.8818022, 0.196517, 0, 0.6745098, 1, 1,
0.18113, -1.591928, 1.950303, 0, 0.6705883, 1, 1,
0.1828998, -0.339352, 3.279441, 0, 0.6627451, 1, 1,
0.1876725, 0.9122863, 0.5062459, 0, 0.6588235, 1, 1,
0.1888585, 0.2891313, 0.1414775, 0, 0.6509804, 1, 1,
0.1938917, -0.8277931, 4.602674, 0, 0.6470588, 1, 1,
0.19525, -1.261753, 3.02138, 0, 0.6392157, 1, 1,
0.2007485, 0.4434239, 1.028948, 0, 0.6352941, 1, 1,
0.2008806, 0.3541976, -0.03731845, 0, 0.627451, 1, 1,
0.2069472, -0.9410709, 2.251738, 0, 0.6235294, 1, 1,
0.2070569, -0.9086716, 2.598462, 0, 0.6156863, 1, 1,
0.2081145, -0.6854434, 3.9185, 0, 0.6117647, 1, 1,
0.2112317, -0.7132431, 2.92737, 0, 0.6039216, 1, 1,
0.2156694, -0.4870587, 2.262318, 0, 0.5960785, 1, 1,
0.2185147, 1.524536, -1.586276, 0, 0.5921569, 1, 1,
0.2193718, 0.1428607, -0.1446643, 0, 0.5843138, 1, 1,
0.2214166, -0.6994503, 2.124486, 0, 0.5803922, 1, 1,
0.2237774, 0.7131281, -0.2625129, 0, 0.572549, 1, 1,
0.2240825, -0.4522861, 3.629453, 0, 0.5686275, 1, 1,
0.2252209, 1.242594, 0.05983055, 0, 0.5607843, 1, 1,
0.2267651, -0.4965126, 5.251297, 0, 0.5568628, 1, 1,
0.228297, 1.089873, 1.944172, 0, 0.5490196, 1, 1,
0.2320599, 1.036047, -0.2244741, 0, 0.5450981, 1, 1,
0.2345209, 0.4248175, 2.085761, 0, 0.5372549, 1, 1,
0.2402098, 0.7159259, 1.326008, 0, 0.5333334, 1, 1,
0.2406134, -0.3518036, 1.192771, 0, 0.5254902, 1, 1,
0.2413941, -2.470045, 3.167115, 0, 0.5215687, 1, 1,
0.2414131, 1.624716, -0.643888, 0, 0.5137255, 1, 1,
0.2427852, -0.09884662, 2.843601, 0, 0.509804, 1, 1,
0.2439028, 0.3859116, 1.204022, 0, 0.5019608, 1, 1,
0.245323, -0.8433213, 2.517219, 0, 0.4941176, 1, 1,
0.2453513, -0.8274671, 3.786379, 0, 0.4901961, 1, 1,
0.257116, 0.5612517, 1.72535, 0, 0.4823529, 1, 1,
0.2589654, 0.4673533, -0.6330009, 0, 0.4784314, 1, 1,
0.2618817, -0.09029636, 2.041147, 0, 0.4705882, 1, 1,
0.2671323, -0.3946429, 3.154069, 0, 0.4666667, 1, 1,
0.2688271, 0.6584557, 1.036832, 0, 0.4588235, 1, 1,
0.2732882, 0.5544342, -0.3080634, 0, 0.454902, 1, 1,
0.2773263, 0.7475123, 1.307382, 0, 0.4470588, 1, 1,
0.2789397, -0.6021844, 2.037762, 0, 0.4431373, 1, 1,
0.279512, 0.1916163, 0.3540808, 0, 0.4352941, 1, 1,
0.2840984, 0.8449698, -0.279144, 0, 0.4313726, 1, 1,
0.2854482, -0.1519762, 2.918035, 0, 0.4235294, 1, 1,
0.2939027, 0.4869244, 0.9373704, 0, 0.4196078, 1, 1,
0.2939554, -1.429736, 2.183362, 0, 0.4117647, 1, 1,
0.2939657, 0.8307014, 0.9012887, 0, 0.4078431, 1, 1,
0.3007626, -1.771992, 2.911543, 0, 0.4, 1, 1,
0.3009489, 1.593395, 0.4954535, 0, 0.3921569, 1, 1,
0.3043347, -0.2631339, 1.804092, 0, 0.3882353, 1, 1,
0.312964, -0.7197823, 1.298205, 0, 0.3803922, 1, 1,
0.3134761, 0.8578776, 1.362298, 0, 0.3764706, 1, 1,
0.3145367, 1.276929, 0.7838839, 0, 0.3686275, 1, 1,
0.3148955, 0.9529209, -1.975853, 0, 0.3647059, 1, 1,
0.3175843, -1.074505, 1.415578, 0, 0.3568628, 1, 1,
0.3183544, 0.6490774, 0.04365349, 0, 0.3529412, 1, 1,
0.3200094, 0.5857714, -0.3046759, 0, 0.345098, 1, 1,
0.3201541, 2.418135, -0.7697824, 0, 0.3411765, 1, 1,
0.3216131, -2.348578, 2.552797, 0, 0.3333333, 1, 1,
0.3231088, 1.031179, 0.8101257, 0, 0.3294118, 1, 1,
0.3262222, 0.6507183, -0.3457515, 0, 0.3215686, 1, 1,
0.3276271, -0.723336, 3.127044, 0, 0.3176471, 1, 1,
0.3295251, 1.098018, 2.203078, 0, 0.3098039, 1, 1,
0.3439887, -0.6442918, 3.20359, 0, 0.3058824, 1, 1,
0.344978, -0.6958333, 2.02593, 0, 0.2980392, 1, 1,
0.3455681, -0.0476137, 2.06409, 0, 0.2901961, 1, 1,
0.345621, 0.2078405, 1.403951, 0, 0.2862745, 1, 1,
0.3471832, -0.9490407, 4.019828, 0, 0.2784314, 1, 1,
0.349422, -0.3899961, 3.233353, 0, 0.2745098, 1, 1,
0.3532473, 0.5634968, -0.3290025, 0, 0.2666667, 1, 1,
0.3555214, -1.092715, 4.478388, 0, 0.2627451, 1, 1,
0.361552, -0.2944045, 2.430565, 0, 0.254902, 1, 1,
0.3628135, 0.7946019, 0.3757456, 0, 0.2509804, 1, 1,
0.3644091, -0.2273873, 0.512924, 0, 0.2431373, 1, 1,
0.3649014, 0.3955783, 1.70094, 0, 0.2392157, 1, 1,
0.3658105, 1.754503, -0.2962003, 0, 0.2313726, 1, 1,
0.3687674, 1.157259, -0.7946315, 0, 0.227451, 1, 1,
0.3774284, -0.8235701, 1.603288, 0, 0.2196078, 1, 1,
0.3790282, -0.04827604, 1.637097, 0, 0.2156863, 1, 1,
0.3816693, 1.115099, 1.385524, 0, 0.2078431, 1, 1,
0.3890612, -0.6572467, 3.296082, 0, 0.2039216, 1, 1,
0.3946228, -1.683608, 3.71543, 0, 0.1960784, 1, 1,
0.3984683, -1.556873, 3.097742, 0, 0.1882353, 1, 1,
0.3998278, 0.8856714, 0.5447612, 0, 0.1843137, 1, 1,
0.4007725, 0.04868074, 1.190958, 0, 0.1764706, 1, 1,
0.4022719, 1.006163, -0.8849085, 0, 0.172549, 1, 1,
0.402305, -0.9204063, 3.224006, 0, 0.1647059, 1, 1,
0.404822, 0.5502794, -0.09886172, 0, 0.1607843, 1, 1,
0.4095165, 1.10635, -1.157197, 0, 0.1529412, 1, 1,
0.4147633, -0.56736, 2.846359, 0, 0.1490196, 1, 1,
0.4196717, -0.7589846, 1.964392, 0, 0.1411765, 1, 1,
0.4232292, 0.3843698, 2.389862, 0, 0.1372549, 1, 1,
0.4246745, 0.5703022, 1.759404, 0, 0.1294118, 1, 1,
0.4263224, 1.460624, 0.6198248, 0, 0.1254902, 1, 1,
0.4276786, 2.107136, -1.708936, 0, 0.1176471, 1, 1,
0.4363036, -0.5798651, 4.566009, 0, 0.1137255, 1, 1,
0.4369941, 0.3808517, 1.337181, 0, 0.1058824, 1, 1,
0.442173, -1.260273, 2.864659, 0, 0.09803922, 1, 1,
0.4483472, -0.2770769, 3.572894, 0, 0.09411765, 1, 1,
0.4502035, -0.4364148, 3.138864, 0, 0.08627451, 1, 1,
0.4518466, -0.1553046, 0.3799753, 0, 0.08235294, 1, 1,
0.4521738, 0.4325127, 0.9477425, 0, 0.07450981, 1, 1,
0.4534454, -0.3109601, 2.969948, 0, 0.07058824, 1, 1,
0.4546912, -0.6468788, -0.3949406, 0, 0.0627451, 1, 1,
0.4569552, 0.1776631, 1.953408, 0, 0.05882353, 1, 1,
0.4624844, 1.771275, 0.1811737, 0, 0.05098039, 1, 1,
0.4634449, -0.3922975, 2.708157, 0, 0.04705882, 1, 1,
0.4657247, -0.1194902, 2.79701, 0, 0.03921569, 1, 1,
0.4733811, 0.247902, 0.02482796, 0, 0.03529412, 1, 1,
0.4782757, -1.262248, 1.960645, 0, 0.02745098, 1, 1,
0.4829504, 2.541964, -0.3438927, 0, 0.02352941, 1, 1,
0.4853798, 0.4210522, 1.69794, 0, 0.01568628, 1, 1,
0.4953522, 0.6672243, 2.088836, 0, 0.01176471, 1, 1,
0.4956791, -0.2968334, 2.298119, 0, 0.003921569, 1, 1,
0.4965163, 2.339034, 0.4654881, 0.003921569, 0, 1, 1,
0.4968921, -0.7023991, 1.045319, 0.007843138, 0, 1, 1,
0.5027662, -0.2949113, 2.483915, 0.01568628, 0, 1, 1,
0.5030454, -0.87159, 2.682334, 0.01960784, 0, 1, 1,
0.5111378, 0.2494018, 0.7741991, 0.02745098, 0, 1, 1,
0.5143768, 0.2555731, -1.034493, 0.03137255, 0, 1, 1,
0.514882, 1.066263, -0.9614415, 0.03921569, 0, 1, 1,
0.5150242, 0.7896593, 1.305475, 0.04313726, 0, 1, 1,
0.5207527, 1.578632, 2.207455, 0.05098039, 0, 1, 1,
0.5216646, 0.06761391, 2.04118, 0.05490196, 0, 1, 1,
0.5250089, 0.2060227, 1.196888, 0.0627451, 0, 1, 1,
0.5252958, -0.9367009, 1.929654, 0.06666667, 0, 1, 1,
0.5289008, 0.1625501, 1.945062, 0.07450981, 0, 1, 1,
0.5332965, 2.532843, 0.7825462, 0.07843138, 0, 1, 1,
0.5335016, 0.7077903, 2.112145, 0.08627451, 0, 1, 1,
0.5337372, 0.04036452, 0.5806987, 0.09019608, 0, 1, 1,
0.537358, -1.029015, 2.766326, 0.09803922, 0, 1, 1,
0.5380569, 1.275959, 2.131765, 0.1058824, 0, 1, 1,
0.5475529, -0.3545614, 2.729171, 0.1098039, 0, 1, 1,
0.5519284, -0.03129054, 3.478199, 0.1176471, 0, 1, 1,
0.5533486, -0.6103877, 1.67934, 0.1215686, 0, 1, 1,
0.5539501, -1.268551, 3.938499, 0.1294118, 0, 1, 1,
0.5610279, 1.532921, 1.041573, 0.1333333, 0, 1, 1,
0.5647773, -0.1383869, 1.99894, 0.1411765, 0, 1, 1,
0.5657712, 1.08199, 1.498554, 0.145098, 0, 1, 1,
0.5660228, -0.3285922, 1.02808, 0.1529412, 0, 1, 1,
0.5665044, -1.225706, 3.111502, 0.1568628, 0, 1, 1,
0.5722595, 0.008708268, 0.606811, 0.1647059, 0, 1, 1,
0.5777624, -0.3331787, 1.595957, 0.1686275, 0, 1, 1,
0.5789431, 0.6319561, 0.9017701, 0.1764706, 0, 1, 1,
0.5790973, -0.9254307, 2.196309, 0.1803922, 0, 1, 1,
0.5792723, 1.034699, 1.577833, 0.1882353, 0, 1, 1,
0.5804992, -0.5967446, 1.757666, 0.1921569, 0, 1, 1,
0.5807813, -1.147214, 2.533187, 0.2, 0, 1, 1,
0.5825788, -0.6333162, 3.054292, 0.2078431, 0, 1, 1,
0.5870043, -0.6183563, 3.171547, 0.2117647, 0, 1, 1,
0.5887558, 0.8251062, 2.223575, 0.2196078, 0, 1, 1,
0.5988486, 0.6919596, -0.01456238, 0.2235294, 0, 1, 1,
0.5996459, -0.307895, 1.542233, 0.2313726, 0, 1, 1,
0.6004596, -0.6561801, 1.859438, 0.2352941, 0, 1, 1,
0.6010954, -0.5673212, 1.189525, 0.2431373, 0, 1, 1,
0.6013574, -2.541706, 2.089396, 0.2470588, 0, 1, 1,
0.6065242, 0.4289959, 1.293043, 0.254902, 0, 1, 1,
0.6113575, 0.8808647, 0.9059185, 0.2588235, 0, 1, 1,
0.6134766, 0.9592968, -2.278708, 0.2666667, 0, 1, 1,
0.6145216, 0.9984028, 2.110121, 0.2705882, 0, 1, 1,
0.6156306, 0.2624354, 2.84849, 0.2784314, 0, 1, 1,
0.6170207, 1.791616, 1.355216, 0.282353, 0, 1, 1,
0.6189356, 0.6318673, 0.7576705, 0.2901961, 0, 1, 1,
0.6207449, -1.199029, 3.967986, 0.2941177, 0, 1, 1,
0.6222499, 0.3615415, 1.909755, 0.3019608, 0, 1, 1,
0.6228795, -0.2908865, 1.192625, 0.3098039, 0, 1, 1,
0.6294152, -0.6941472, 1.560792, 0.3137255, 0, 1, 1,
0.633776, -0.3878042, 3.2905, 0.3215686, 0, 1, 1,
0.6374026, -1.285613, 2.234628, 0.3254902, 0, 1, 1,
0.6386351, 0.2957356, -0.6446086, 0.3333333, 0, 1, 1,
0.6410335, 0.6293, 0.8188713, 0.3372549, 0, 1, 1,
0.6421851, 0.1827744, 1.425776, 0.345098, 0, 1, 1,
0.6447537, -0.4460611, 2.389231, 0.3490196, 0, 1, 1,
0.653984, -1.424772, 3.64879, 0.3568628, 0, 1, 1,
0.6543172, 1.123058, -0.3502828, 0.3607843, 0, 1, 1,
0.6562073, -0.8186734, 1.76115, 0.3686275, 0, 1, 1,
0.6615365, -0.1412373, 1.391006, 0.372549, 0, 1, 1,
0.661657, 0.3290038, 0.4879242, 0.3803922, 0, 1, 1,
0.6618912, 0.02660195, 1.662756, 0.3843137, 0, 1, 1,
0.6629614, 0.2291903, -0.7283683, 0.3921569, 0, 1, 1,
0.6681494, 0.8490519, 1.550592, 0.3960784, 0, 1, 1,
0.6725674, 1.831891, 0.1887776, 0.4039216, 0, 1, 1,
0.6726031, 0.1057703, 1.22054, 0.4117647, 0, 1, 1,
0.6850876, -0.3898797, 1.018636, 0.4156863, 0, 1, 1,
0.6884322, 1.02625, 2.064929, 0.4235294, 0, 1, 1,
0.6886706, -1.281314, 0.9703382, 0.427451, 0, 1, 1,
0.6920089, -0.1863431, 1.768832, 0.4352941, 0, 1, 1,
0.6932659, -0.3191974, 2.081425, 0.4392157, 0, 1, 1,
0.6987653, 0.480244, 2.392108, 0.4470588, 0, 1, 1,
0.7026014, -0.833439, 3.180115, 0.4509804, 0, 1, 1,
0.7051402, 0.4721428, -0.03643379, 0.4588235, 0, 1, 1,
0.708376, 0.2126287, 0.8821456, 0.4627451, 0, 1, 1,
0.7115242, -1.391248, 0.9422179, 0.4705882, 0, 1, 1,
0.7130288, -0.6920044, 1.191656, 0.4745098, 0, 1, 1,
0.7130908, -0.8996991, 4.053727, 0.4823529, 0, 1, 1,
0.7156246, 0.07703758, 0.8927867, 0.4862745, 0, 1, 1,
0.7188439, -1.322875, 2.449739, 0.4941176, 0, 1, 1,
0.7281702, -1.266578, 0.6436229, 0.5019608, 0, 1, 1,
0.7315146, -1.367213, 3.246047, 0.5058824, 0, 1, 1,
0.7321023, 1.256333, 1.472217, 0.5137255, 0, 1, 1,
0.7350467, 0.331932, 0.5121369, 0.5176471, 0, 1, 1,
0.741148, -1.6009, 3.232244, 0.5254902, 0, 1, 1,
0.74325, 0.2631229, 2.920866, 0.5294118, 0, 1, 1,
0.7433779, 1.049868, 0.7965406, 0.5372549, 0, 1, 1,
0.7520961, -0.971817, 4.931573, 0.5411765, 0, 1, 1,
0.7714122, 1.06751, -0.189965, 0.5490196, 0, 1, 1,
0.7731652, -2.671712, 0.6350276, 0.5529412, 0, 1, 1,
0.7784864, -0.7023632, 1.770983, 0.5607843, 0, 1, 1,
0.7953212, 1.36448, -0.2236799, 0.5647059, 0, 1, 1,
0.7995609, -0.03619157, 0.8043529, 0.572549, 0, 1, 1,
0.8064958, -2.057465, 3.313766, 0.5764706, 0, 1, 1,
0.8075209, -0.3287845, 3.107222, 0.5843138, 0, 1, 1,
0.8085593, 0.2663729, 0.7629076, 0.5882353, 0, 1, 1,
0.8093042, -0.5518698, 2.524926, 0.5960785, 0, 1, 1,
0.8108576, -1.19993, 1.012951, 0.6039216, 0, 1, 1,
0.8117553, -1.615359, 2.72912, 0.6078432, 0, 1, 1,
0.8143632, 2.31353, 0.9124342, 0.6156863, 0, 1, 1,
0.8214319, 0.5199805, 0.6945686, 0.6196079, 0, 1, 1,
0.8217624, 1.003277, 1.624641, 0.627451, 0, 1, 1,
0.8236911, 1.425377, -0.2690081, 0.6313726, 0, 1, 1,
0.8306442, 0.08016539, 1.226245, 0.6392157, 0, 1, 1,
0.8400605, -1.012741, 3.367927, 0.6431373, 0, 1, 1,
0.8414348, -0.6294319, 3.250538, 0.6509804, 0, 1, 1,
0.845286, 0.3677972, 0.01986693, 0.654902, 0, 1, 1,
0.8466678, 0.5822402, 1.532499, 0.6627451, 0, 1, 1,
0.8468985, -0.3779181, 4.743338, 0.6666667, 0, 1, 1,
0.8469264, 0.4601767, -1.031292, 0.6745098, 0, 1, 1,
0.8510375, -0.04126962, -0.7173714, 0.6784314, 0, 1, 1,
0.8513155, -3.002828, 5.015932, 0.6862745, 0, 1, 1,
0.8540413, -0.3628973, 1.590984, 0.6901961, 0, 1, 1,
0.8547678, 2.988326, -0.1056577, 0.6980392, 0, 1, 1,
0.8559026, -1.278485, 1.769527, 0.7058824, 0, 1, 1,
0.8561077, 1.235412, 0.3424829, 0.7098039, 0, 1, 1,
0.8586062, 0.3334623, 1.208691, 0.7176471, 0, 1, 1,
0.8738097, 0.4425894, 2.068017, 0.7215686, 0, 1, 1,
0.8745954, 1.730561, 1.069497, 0.7294118, 0, 1, 1,
0.875452, 0.1576764, 0.8508752, 0.7333333, 0, 1, 1,
0.8759218, 0.5487538, 2.1839, 0.7411765, 0, 1, 1,
0.877775, 0.11933, 2.135233, 0.7450981, 0, 1, 1,
0.8874874, 1.192189, 2.577543, 0.7529412, 0, 1, 1,
0.8934736, 0.1882438, 0.3435509, 0.7568628, 0, 1, 1,
0.8941395, -0.3570398, 1.942499, 0.7647059, 0, 1, 1,
0.9052619, 0.7208993, 0.3943874, 0.7686275, 0, 1, 1,
0.9091114, 0.5263839, -2.392883, 0.7764706, 0, 1, 1,
0.9132859, 0.2560896, 1.840151, 0.7803922, 0, 1, 1,
0.9133379, 0.01836883, 1.907559, 0.7882353, 0, 1, 1,
0.9141842, -0.1461082, 0.7103356, 0.7921569, 0, 1, 1,
0.9168397, 0.674221, 2.454017, 0.8, 0, 1, 1,
0.9230942, -0.4063882, 2.772042, 0.8078431, 0, 1, 1,
0.9245167, -0.8106397, 4.116623, 0.8117647, 0, 1, 1,
0.9425849, -0.1049217, 2.137067, 0.8196079, 0, 1, 1,
0.9433261, -1.029846, 3.991327, 0.8235294, 0, 1, 1,
0.9650312, 0.7977425, 0.4683654, 0.8313726, 0, 1, 1,
0.9650911, -1.488277, 4.131075, 0.8352941, 0, 1, 1,
0.9653999, 0.277043, 2.243772, 0.8431373, 0, 1, 1,
0.974071, -0.65101, 1.608321, 0.8470588, 0, 1, 1,
0.9790354, -0.8954371, 1.679515, 0.854902, 0, 1, 1,
0.9803677, 0.299094, 1.562136, 0.8588235, 0, 1, 1,
0.9814076, -1.114688, 4.495296, 0.8666667, 0, 1, 1,
0.9816214, 0.8668129, 0.3242256, 0.8705882, 0, 1, 1,
0.9830472, -0.217377, 2.927279, 0.8784314, 0, 1, 1,
0.9833648, 1.426281, 0.2705656, 0.8823529, 0, 1, 1,
0.9879128, -0.525287, 2.245926, 0.8901961, 0, 1, 1,
0.9928754, -1.965224, 2.968161, 0.8941177, 0, 1, 1,
0.9954832, -1.543686, 2.761296, 0.9019608, 0, 1, 1,
1.001833, 0.6765252, 1.297006, 0.9098039, 0, 1, 1,
1.007994, 0.4221231, 1.497952, 0.9137255, 0, 1, 1,
1.009942, 0.5257051, -1.030555, 0.9215686, 0, 1, 1,
1.010379, -1.315659, 1.988384, 0.9254902, 0, 1, 1,
1.010844, -0.4653227, 2.937423, 0.9333333, 0, 1, 1,
1.012758, 0.7211705, 2.772413, 0.9372549, 0, 1, 1,
1.024803, -1.370374, 2.562395, 0.945098, 0, 1, 1,
1.030326, 0.7291592, 1.205835, 0.9490196, 0, 1, 1,
1.032598, -0.3142221, 2.297192, 0.9568627, 0, 1, 1,
1.03549, 1.442194, 0.1105439, 0.9607843, 0, 1, 1,
1.038478, 1.024609, 2.179608, 0.9686275, 0, 1, 1,
1.03984, 0.02054792, -0.03505134, 0.972549, 0, 1, 1,
1.044039, -0.9465489, 2.726636, 0.9803922, 0, 1, 1,
1.052109, 0.6844199, -0.1101932, 0.9843137, 0, 1, 1,
1.05233, 2.949433, -1.404879, 0.9921569, 0, 1, 1,
1.053376, 0.5647318, 1.430921, 0.9960784, 0, 1, 1,
1.059759, -1.422733, 4.440719, 1, 0, 0.9960784, 1,
1.066927, 1.029688, 2.590261, 1, 0, 0.9882353, 1,
1.07601, 0.03810564, 1.586312, 1, 0, 0.9843137, 1,
1.076584, 0.5521443, -1.604612, 1, 0, 0.9764706, 1,
1.079973, -1.657658, 1.892051, 1, 0, 0.972549, 1,
1.081536, -0.7829214, 1.840175, 1, 0, 0.9647059, 1,
1.083109, 0.7566259, -0.2289914, 1, 0, 0.9607843, 1,
1.087251, 0.5767353, 2.462757, 1, 0, 0.9529412, 1,
1.09251, 0.8791716, 2.289108, 1, 0, 0.9490196, 1,
1.098532, 0.8534533, 2.092797, 1, 0, 0.9411765, 1,
1.112273, -0.9088578, 1.348206, 1, 0, 0.9372549, 1,
1.112714, -1.71471, 4.382677, 1, 0, 0.9294118, 1,
1.113744, 0.0584431, 0.7297977, 1, 0, 0.9254902, 1,
1.120738, 0.7916077, 1.121637, 1, 0, 0.9176471, 1,
1.129317, 0.006621412, 0.6641425, 1, 0, 0.9137255, 1,
1.132837, 1.080291, 1.625888, 1, 0, 0.9058824, 1,
1.133119, -0.7875698, 3.447844, 1, 0, 0.9019608, 1,
1.133412, 0.1013491, 3.321658, 1, 0, 0.8941177, 1,
1.137359, -0.6034607, 2.696016, 1, 0, 0.8862745, 1,
1.138634, 0.7751555, -0.8728491, 1, 0, 0.8823529, 1,
1.138763, -1.398308, 0.9006975, 1, 0, 0.8745098, 1,
1.142234, 1.299271, 0.7993302, 1, 0, 0.8705882, 1,
1.151166, 1.092449, 0.1006566, 1, 0, 0.8627451, 1,
1.154696, 1.51618, 1.051168, 1, 0, 0.8588235, 1,
1.159929, -2.033548, 3.19711, 1, 0, 0.8509804, 1,
1.175162, -0.5490825, 2.261833, 1, 0, 0.8470588, 1,
1.176836, -0.982564, 1.705722, 1, 0, 0.8392157, 1,
1.192057, 0.9741465, 1.659691, 1, 0, 0.8352941, 1,
1.192109, 1.830256, 0.00536895, 1, 0, 0.827451, 1,
1.194661, -0.5434458, 2.122063, 1, 0, 0.8235294, 1,
1.200499, -0.1753953, 2.770331, 1, 0, 0.8156863, 1,
1.212734, -0.2679621, 1.141331, 1, 0, 0.8117647, 1,
1.220705, -0.3519786, 0.5317996, 1, 0, 0.8039216, 1,
1.222798, -0.6163138, 3.62995, 1, 0, 0.7960784, 1,
1.226808, -0.5622788, 3.108026, 1, 0, 0.7921569, 1,
1.229717, 1.49929, 1.672375, 1, 0, 0.7843137, 1,
1.231821, 1.679422, 0.8614976, 1, 0, 0.7803922, 1,
1.234205, -0.1895171, 1.168368, 1, 0, 0.772549, 1,
1.252503, -0.5637999, 1.592877, 1, 0, 0.7686275, 1,
1.256238, 0.3985383, 1.636751, 1, 0, 0.7607843, 1,
1.258164, 1.194138, 2.961063, 1, 0, 0.7568628, 1,
1.259824, 1.361476, 1.218078, 1, 0, 0.7490196, 1,
1.260163, -0.07247812, 1.140317, 1, 0, 0.7450981, 1,
1.262861, -0.5476496, 2.698519, 1, 0, 0.7372549, 1,
1.267738, -0.9879449, 1.71222, 1, 0, 0.7333333, 1,
1.270133, 1.936231, 0.05943867, 1, 0, 0.7254902, 1,
1.282883, -0.09686681, 1.928192, 1, 0, 0.7215686, 1,
1.293421, 0.2689549, 1.974002, 1, 0, 0.7137255, 1,
1.294726, -0.03646489, 2.475623, 1, 0, 0.7098039, 1,
1.295524, 0.02483741, 2.133355, 1, 0, 0.7019608, 1,
1.297249, -0.8897786, 1.385626, 1, 0, 0.6941177, 1,
1.33162, -0.1758841, 0.9209639, 1, 0, 0.6901961, 1,
1.335418, -1.92427, 1.723746, 1, 0, 0.682353, 1,
1.337025, -0.8088072, 4.894019, 1, 0, 0.6784314, 1,
1.337303, -0.6329494, 2.443955, 1, 0, 0.6705883, 1,
1.338791, 0.2776744, 0.420401, 1, 0, 0.6666667, 1,
1.339196, 1.091644, 3.134444, 1, 0, 0.6588235, 1,
1.343254, 0.6670882, 1.29071, 1, 0, 0.654902, 1,
1.351241, -0.4125666, 1.706978, 1, 0, 0.6470588, 1,
1.351728, -0.6038049, 2.7102, 1, 0, 0.6431373, 1,
1.353137, -0.2413384, 0.9782628, 1, 0, 0.6352941, 1,
1.354431, 1.75274, 2.13646, 1, 0, 0.6313726, 1,
1.356157, 0.1902232, 0.5841891, 1, 0, 0.6235294, 1,
1.358328, -0.6552009, 1.864459, 1, 0, 0.6196079, 1,
1.359198, -1.054309, 1.881934, 1, 0, 0.6117647, 1,
1.37358, -0.9600012, 3.097137, 1, 0, 0.6078432, 1,
1.382572, -2.045789, 4.617776, 1, 0, 0.6, 1,
1.385754, 0.487432, 0.6232843, 1, 0, 0.5921569, 1,
1.389995, -0.1659358, 1.392374, 1, 0, 0.5882353, 1,
1.395351, 0.08723389, 0.8249224, 1, 0, 0.5803922, 1,
1.402179, -0.1367211, 2.241438, 1, 0, 0.5764706, 1,
1.404558, -2.148756, 1.744588, 1, 0, 0.5686275, 1,
1.409554, 0.6035625, 1.971062, 1, 0, 0.5647059, 1,
1.422873, -0.638171, 2.690322, 1, 0, 0.5568628, 1,
1.42476, -0.3224194, 1.37865, 1, 0, 0.5529412, 1,
1.429314, 1.984153, -0.3241681, 1, 0, 0.5450981, 1,
1.433891, 0.9196069, 1.029191, 1, 0, 0.5411765, 1,
1.434079, -1.374042, 1.175608, 1, 0, 0.5333334, 1,
1.435115, 0.3133741, 1.525253, 1, 0, 0.5294118, 1,
1.443463, 1.047758, 0.1712357, 1, 0, 0.5215687, 1,
1.449357, -0.5459738, 1.035566, 1, 0, 0.5176471, 1,
1.456227, -0.6867373, 3.139133, 1, 0, 0.509804, 1,
1.457365, -1.152828, 1.049868, 1, 0, 0.5058824, 1,
1.462562, 0.1706955, 0.4704456, 1, 0, 0.4980392, 1,
1.463655, -0.1216254, 0.6947569, 1, 0, 0.4901961, 1,
1.465401, 0.1087828, -0.01192028, 1, 0, 0.4862745, 1,
1.476616, 0.657777, 0.6281135, 1, 0, 0.4784314, 1,
1.481905, -1.756186, 1.56775, 1, 0, 0.4745098, 1,
1.499783, 0.1047658, 1.892282, 1, 0, 0.4666667, 1,
1.508514, 0.286108, 3.393577, 1, 0, 0.4627451, 1,
1.519721, -0.2774547, 2.025472, 1, 0, 0.454902, 1,
1.528046, -0.5351354, 1.960379, 1, 0, 0.4509804, 1,
1.536233, -0.9678486, 2.252561, 1, 0, 0.4431373, 1,
1.538114, 1.642523, 2.064401, 1, 0, 0.4392157, 1,
1.551963, 1.506891, 0.2232556, 1, 0, 0.4313726, 1,
1.554605, -1.243846, 3.142111, 1, 0, 0.427451, 1,
1.575528, -0.5919305, 0.8899462, 1, 0, 0.4196078, 1,
1.579715, -0.4766418, 0.4162317, 1, 0, 0.4156863, 1,
1.589596, -0.9752837, 1.715684, 1, 0, 0.4078431, 1,
1.616198, -0.37806, 2.781316, 1, 0, 0.4039216, 1,
1.618606, 0.882315, 0.4257445, 1, 0, 0.3960784, 1,
1.621835, -0.6468807, 1.727879, 1, 0, 0.3882353, 1,
1.632415, -0.6912457, 0.004251502, 1, 0, 0.3843137, 1,
1.641376, -0.858981, 3.946469, 1, 0, 0.3764706, 1,
1.665656, 1.258519, 0.2816079, 1, 0, 0.372549, 1,
1.704851, -0.392089, 3.073638, 1, 0, 0.3647059, 1,
1.706066, 0.2497871, 1.584612, 1, 0, 0.3607843, 1,
1.716071, 0.454069, 0.6575679, 1, 0, 0.3529412, 1,
1.716346, 0.6480553, 2.669472, 1, 0, 0.3490196, 1,
1.750898, 1.869343, -0.530207, 1, 0, 0.3411765, 1,
1.760955, -1.051324, 0.2524641, 1, 0, 0.3372549, 1,
1.762241, -0.8715948, 1.48942, 1, 0, 0.3294118, 1,
1.772564, 0.3442482, 0.3446148, 1, 0, 0.3254902, 1,
1.793246, -0.7407116, 0.7820104, 1, 0, 0.3176471, 1,
1.80131, -0.03643721, 3.176869, 1, 0, 0.3137255, 1,
1.806582, 1.193635, 3.028606, 1, 0, 0.3058824, 1,
1.829214, -0.07682889, 1.073723, 1, 0, 0.2980392, 1,
1.830187, -0.8529092, 2.244474, 1, 0, 0.2941177, 1,
1.835604, -1.006692, 3.572179, 1, 0, 0.2862745, 1,
1.845728, 0.8607514, 2.418769, 1, 0, 0.282353, 1,
1.851683, 0.1624224, 0.7388152, 1, 0, 0.2745098, 1,
1.856797, -0.7186441, -0.2719464, 1, 0, 0.2705882, 1,
1.867334, 0.02883234, 2.057612, 1, 0, 0.2627451, 1,
1.869669, -0.547088, 1.270117, 1, 0, 0.2588235, 1,
1.870113, 1.015727, 2.224633, 1, 0, 0.2509804, 1,
1.870737, 1.064603, -0.0782569, 1, 0, 0.2470588, 1,
1.876529, 0.2305795, 2.274362, 1, 0, 0.2392157, 1,
1.904531, 0.1948003, 2.764364, 1, 0, 0.2352941, 1,
1.90746, -0.5119456, 4.121912, 1, 0, 0.227451, 1,
1.909634, -0.3762354, 2.198856, 1, 0, 0.2235294, 1,
1.937266, 0.2091969, 0.6150598, 1, 0, 0.2156863, 1,
1.943074, 0.1962346, 1.945973, 1, 0, 0.2117647, 1,
1.943817, 0.5975121, 4.136325, 1, 0, 0.2039216, 1,
1.954713, -1.865382, 2.930585, 1, 0, 0.1960784, 1,
1.96594, 0.9928292, 2.341544, 1, 0, 0.1921569, 1,
1.96881, -0.721369, 1.925389, 1, 0, 0.1843137, 1,
1.986396, -0.1243091, 0.798512, 1, 0, 0.1803922, 1,
1.99317, 1.791906, 2.493196, 1, 0, 0.172549, 1,
2.002546, 0.5869836, -0.5105031, 1, 0, 0.1686275, 1,
2.012472, 1.289545, 0.239599, 1, 0, 0.1607843, 1,
2.01985, -0.6409491, 3.253087, 1, 0, 0.1568628, 1,
2.022057, -1.419747, 1.716486, 1, 0, 0.1490196, 1,
2.03309, -0.780652, 2.263835, 1, 0, 0.145098, 1,
2.078842, -0.2522556, 0.9080452, 1, 0, 0.1372549, 1,
2.126065, -0.8625922, 2.297474, 1, 0, 0.1333333, 1,
2.13562, -0.6501226, 1.135777, 1, 0, 0.1254902, 1,
2.161124, 0.768219, 1.145704, 1, 0, 0.1215686, 1,
2.177856, 0.2428461, 1.531465, 1, 0, 0.1137255, 1,
2.21035, -1.828983, 0.6811065, 1, 0, 0.1098039, 1,
2.261216, -0.3718164, 1.922569, 1, 0, 0.1019608, 1,
2.272305, -0.5801585, 4.458893, 1, 0, 0.09411765, 1,
2.336359, 0.4494419, 2.203401, 1, 0, 0.09019608, 1,
2.351949, 0.3009188, 2.567004, 1, 0, 0.08235294, 1,
2.383304, -0.622463, 1.868413, 1, 0, 0.07843138, 1,
2.446708, -2.712495, 1.292533, 1, 0, 0.07058824, 1,
2.511477, 0.05843052, 1.607954, 1, 0, 0.06666667, 1,
2.650922, 0.3751948, 1.541952, 1, 0, 0.05882353, 1,
2.657169, 0.1377844, 2.518643, 1, 0, 0.05490196, 1,
2.68115, -1.29393, 1.705412, 1, 0, 0.04705882, 1,
2.718172, -0.8189557, 0.6103308, 1, 0, 0.04313726, 1,
2.791432, 1.368443, -0.346312, 1, 0, 0.03529412, 1,
2.862809, -0.9534828, 0.5933253, 1, 0, 0.03137255, 1,
2.95517, 0.9014925, 0.02884461, 1, 0, 0.02352941, 1,
3.110493, -0.08000426, 2.727134, 1, 0, 0.01960784, 1,
3.192662, 2.260403, 0.540549, 1, 0, 0.01176471, 1,
3.44503, 0.9443765, 0.6462847, 1, 0, 0.007843138, 1
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
-0.1915692, -4.066654, -7.400897, 0, -0.5, 0.5, 0.5,
-0.1915692, -4.066654, -7.400897, 1, -0.5, 0.5, 0.5,
-0.1915692, -4.066654, -7.400897, 1, 1.5, 0.5, 0.5,
-0.1915692, -4.066654, -7.400897, 0, 1.5, 0.5, 0.5
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
-5.060976, 0.1353009, -7.400897, 0, -0.5, 0.5, 0.5,
-5.060976, 0.1353009, -7.400897, 1, -0.5, 0.5, 0.5,
-5.060976, 0.1353009, -7.400897, 1, 1.5, 0.5, 0.5,
-5.060976, 0.1353009, -7.400897, 0, 1.5, 0.5, 0.5
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
-5.060976, -4.066654, -0.1579349, 0, -0.5, 0.5, 0.5,
-5.060976, -4.066654, -0.1579349, 1, -0.5, 0.5, 0.5,
-5.060976, -4.066654, -0.1579349, 1, 1.5, 0.5, 0.5,
-5.060976, -4.066654, -0.1579349, 0, 1.5, 0.5, 0.5
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
-2, -3.096972, -5.729444,
2, -3.096972, -5.729444,
-2, -3.096972, -5.729444,
-2, -3.258586, -6.00802,
0, -3.096972, -5.729444,
0, -3.258586, -6.00802,
2, -3.096972, -5.729444,
2, -3.258586, -6.00802
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
-2, -3.581813, -6.565171, 0, -0.5, 0.5, 0.5,
-2, -3.581813, -6.565171, 1, -0.5, 0.5, 0.5,
-2, -3.581813, -6.565171, 1, 1.5, 0.5, 0.5,
-2, -3.581813, -6.565171, 0, 1.5, 0.5, 0.5,
0, -3.581813, -6.565171, 0, -0.5, 0.5, 0.5,
0, -3.581813, -6.565171, 1, -0.5, 0.5, 0.5,
0, -3.581813, -6.565171, 1, 1.5, 0.5, 0.5,
0, -3.581813, -6.565171, 0, 1.5, 0.5, 0.5,
2, -3.581813, -6.565171, 0, -0.5, 0.5, 0.5,
2, -3.581813, -6.565171, 1, -0.5, 0.5, 0.5,
2, -3.581813, -6.565171, 1, 1.5, 0.5, 0.5,
2, -3.581813, -6.565171, 0, 1.5, 0.5, 0.5
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
-3.937266, -3, -5.729444,
-3.937266, 3, -5.729444,
-3.937266, -3, -5.729444,
-4.124551, -3, -6.00802,
-3.937266, -2, -5.729444,
-4.124551, -2, -6.00802,
-3.937266, -1, -5.729444,
-4.124551, -1, -6.00802,
-3.937266, 0, -5.729444,
-4.124551, 0, -6.00802,
-3.937266, 1, -5.729444,
-4.124551, 1, -6.00802,
-3.937266, 2, -5.729444,
-4.124551, 2, -6.00802,
-3.937266, 3, -5.729444,
-4.124551, 3, -6.00802
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-4.499121, -3, -6.565171, 0, -0.5, 0.5, 0.5,
-4.499121, -3, -6.565171, 1, -0.5, 0.5, 0.5,
-4.499121, -3, -6.565171, 1, 1.5, 0.5, 0.5,
-4.499121, -3, -6.565171, 0, 1.5, 0.5, 0.5,
-4.499121, -2, -6.565171, 0, -0.5, 0.5, 0.5,
-4.499121, -2, -6.565171, 1, -0.5, 0.5, 0.5,
-4.499121, -2, -6.565171, 1, 1.5, 0.5, 0.5,
-4.499121, -2, -6.565171, 0, 1.5, 0.5, 0.5,
-4.499121, -1, -6.565171, 0, -0.5, 0.5, 0.5,
-4.499121, -1, -6.565171, 1, -0.5, 0.5, 0.5,
-4.499121, -1, -6.565171, 1, 1.5, 0.5, 0.5,
-4.499121, -1, -6.565171, 0, 1.5, 0.5, 0.5,
-4.499121, 0, -6.565171, 0, -0.5, 0.5, 0.5,
-4.499121, 0, -6.565171, 1, -0.5, 0.5, 0.5,
-4.499121, 0, -6.565171, 1, 1.5, 0.5, 0.5,
-4.499121, 0, -6.565171, 0, 1.5, 0.5, 0.5,
-4.499121, 1, -6.565171, 0, -0.5, 0.5, 0.5,
-4.499121, 1, -6.565171, 1, -0.5, 0.5, 0.5,
-4.499121, 1, -6.565171, 1, 1.5, 0.5, 0.5,
-4.499121, 1, -6.565171, 0, 1.5, 0.5, 0.5,
-4.499121, 2, -6.565171, 0, -0.5, 0.5, 0.5,
-4.499121, 2, -6.565171, 1, -0.5, 0.5, 0.5,
-4.499121, 2, -6.565171, 1, 1.5, 0.5, 0.5,
-4.499121, 2, -6.565171, 0, 1.5, 0.5, 0.5,
-4.499121, 3, -6.565171, 0, -0.5, 0.5, 0.5,
-4.499121, 3, -6.565171, 1, -0.5, 0.5, 0.5,
-4.499121, 3, -6.565171, 1, 1.5, 0.5, 0.5,
-4.499121, 3, -6.565171, 0, 1.5, 0.5, 0.5
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
-3.937266, -3.096972, -4,
-3.937266, -3.096972, 4,
-3.937266, -3.096972, -4,
-4.124551, -3.258586, -4,
-3.937266, -3.096972, -2,
-4.124551, -3.258586, -2,
-3.937266, -3.096972, 0,
-4.124551, -3.258586, 0,
-3.937266, -3.096972, 2,
-4.124551, -3.258586, 2,
-3.937266, -3.096972, 4,
-4.124551, -3.258586, 4
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
-4.499121, -3.581813, -4, 0, -0.5, 0.5, 0.5,
-4.499121, -3.581813, -4, 1, -0.5, 0.5, 0.5,
-4.499121, -3.581813, -4, 1, 1.5, 0.5, 0.5,
-4.499121, -3.581813, -4, 0, 1.5, 0.5, 0.5,
-4.499121, -3.581813, -2, 0, -0.5, 0.5, 0.5,
-4.499121, -3.581813, -2, 1, -0.5, 0.5, 0.5,
-4.499121, -3.581813, -2, 1, 1.5, 0.5, 0.5,
-4.499121, -3.581813, -2, 0, 1.5, 0.5, 0.5,
-4.499121, -3.581813, 0, 0, -0.5, 0.5, 0.5,
-4.499121, -3.581813, 0, 1, -0.5, 0.5, 0.5,
-4.499121, -3.581813, 0, 1, 1.5, 0.5, 0.5,
-4.499121, -3.581813, 0, 0, 1.5, 0.5, 0.5,
-4.499121, -3.581813, 2, 0, -0.5, 0.5, 0.5,
-4.499121, -3.581813, 2, 1, -0.5, 0.5, 0.5,
-4.499121, -3.581813, 2, 1, 1.5, 0.5, 0.5,
-4.499121, -3.581813, 2, 0, 1.5, 0.5, 0.5,
-4.499121, -3.581813, 4, 0, -0.5, 0.5, 0.5,
-4.499121, -3.581813, 4, 1, -0.5, 0.5, 0.5,
-4.499121, -3.581813, 4, 1, 1.5, 0.5, 0.5,
-4.499121, -3.581813, 4, 0, 1.5, 0.5, 0.5
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
-3.937266, -3.096972, -5.729444,
-3.937266, 3.367574, -5.729444,
-3.937266, -3.096972, 5.413574,
-3.937266, 3.367574, 5.413574,
-3.937266, -3.096972, -5.729444,
-3.937266, -3.096972, 5.413574,
-3.937266, 3.367574, -5.729444,
-3.937266, 3.367574, 5.413574,
-3.937266, -3.096972, -5.729444,
3.554128, -3.096972, -5.729444,
-3.937266, -3.096972, 5.413574,
3.554128, -3.096972, 5.413574,
-3.937266, 3.367574, -5.729444,
3.554128, 3.367574, -5.729444,
-3.937266, 3.367574, 5.413574,
3.554128, 3.367574, 5.413574,
3.554128, -3.096972, -5.729444,
3.554128, 3.367574, -5.729444,
3.554128, -3.096972, 5.413574,
3.554128, 3.367574, 5.413574,
3.554128, -3.096972, -5.729444,
3.554128, -3.096972, 5.413574,
3.554128, 3.367574, -5.729444,
3.554128, 3.367574, 5.413574
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
var radius = 7.957533;
var distance = 35.40396;
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
mvMatrix.translate( 0.1915692, -0.1353009, 0.1579349 );
mvMatrix.scale( 1.148497, 1.330927, 0.7721283 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.40396);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Naled<-read.table("Naled.xyz")
```

```
## Error in read.table("Naled.xyz"): no lines available in input
```

```r
x<-Naled$V2
```

```
## Error in eval(expr, envir, enclos): object 'Naled' not found
```

```r
y<-Naled$V3
```

```
## Error in eval(expr, envir, enclos): object 'Naled' not found
```

```r
z<-Naled$V4
```

```
## Error in eval(expr, envir, enclos): object 'Naled' not found
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
-3.828168, -1.271751, 0.6792953, 0, 0, 1, 1, 1,
-3.738828, -0.5484786, -1.04498, 1, 0, 0, 1, 1,
-3.158058, -1.839546, -2.158438, 1, 0, 0, 1, 1,
-3.047779, -0.213414, -2.649104, 1, 0, 0, 1, 1,
-2.89337, -0.3511142, -4.173479, 1, 0, 0, 1, 1,
-2.808301, 2.657671, -1.033337, 1, 0, 0, 1, 1,
-2.804845, 0.4664495, -1.22874, 0, 0, 0, 1, 1,
-2.616642, -0.4527447, -3.127863, 0, 0, 0, 1, 1,
-2.594235, 1.058486, 0.4355719, 0, 0, 0, 1, 1,
-2.522789, 0.1717684, -1.302797, 0, 0, 0, 1, 1,
-2.470269, -2.157314, -0.9111471, 0, 0, 0, 1, 1,
-2.421886, -1.696327, -1.717634, 0, 0, 0, 1, 1,
-2.40029, 0.2337145, -0.7207247, 0, 0, 0, 1, 1,
-2.367455, -0.0256036, -2.719322, 1, 1, 1, 1, 1,
-2.35526, -1.552427, -1.60894, 1, 1, 1, 1, 1,
-2.296429, -0.5667081, -2.037403, 1, 1, 1, 1, 1,
-2.11289, 0.3231992, -0.1875432, 1, 1, 1, 1, 1,
-2.09303, -0.3177716, -0.2406269, 1, 1, 1, 1, 1,
-2.064641, -0.317121, -2.612127, 1, 1, 1, 1, 1,
-2.062484, -0.06550013, -3.139227, 1, 1, 1, 1, 1,
-2.006925, -0.8957412, -2.910015, 1, 1, 1, 1, 1,
-1.993399, -1.306307, -2.966415, 1, 1, 1, 1, 1,
-1.927667, -0.8865666, -2.405785, 1, 1, 1, 1, 1,
-1.922023, 0.8101805, -0.8496122, 1, 1, 1, 1, 1,
-1.914901, -0.5666273, -2.207642, 1, 1, 1, 1, 1,
-1.838888, 0.1629969, -2.393337, 1, 1, 1, 1, 1,
-1.838106, -0.6154583, -1.586787, 1, 1, 1, 1, 1,
-1.815449, 2.034777, -2.744778, 1, 1, 1, 1, 1,
-1.80847, 2.276803, -1.761465, 0, 0, 1, 1, 1,
-1.803473, -0.1113703, -2.111797, 1, 0, 0, 1, 1,
-1.797676, -0.2536317, -1.452729, 1, 0, 0, 1, 1,
-1.795259, 0.5742478, 0.8822743, 1, 0, 0, 1, 1,
-1.764753, 1.38272, -3.273731, 1, 0, 0, 1, 1,
-1.761702, -0.4032122, -0.569223, 1, 0, 0, 1, 1,
-1.717947, -0.3154556, -1.244867, 0, 0, 0, 1, 1,
-1.716409, -1.085779, -0.9997671, 0, 0, 0, 1, 1,
-1.70859, 0.9003615, -2.329276, 0, 0, 0, 1, 1,
-1.689053, -0.5210189, -2.822652, 0, 0, 0, 1, 1,
-1.671449, -1.73626, -2.746464, 0, 0, 0, 1, 1,
-1.664646, 1.360547, -1.84648, 0, 0, 0, 1, 1,
-1.656168, -0.1942464, -2.130569, 0, 0, 0, 1, 1,
-1.652389, -1.257587, -4.166301, 1, 1, 1, 1, 1,
-1.648604, -0.423704, -2.244586, 1, 1, 1, 1, 1,
-1.647619, -1.427472, -2.808619, 1, 1, 1, 1, 1,
-1.64542, 0.4838728, 0.7306837, 1, 1, 1, 1, 1,
-1.612469, -0.3856087, -0.2753291, 1, 1, 1, 1, 1,
-1.609207, 0.2707891, -2.635262, 1, 1, 1, 1, 1,
-1.607386, 0.1093557, -2.041165, 1, 1, 1, 1, 1,
-1.605825, -0.1053893, -0.6007755, 1, 1, 1, 1, 1,
-1.60483, -1.727444, -4.198288, 1, 1, 1, 1, 1,
-1.59604, -1.588354, -0.9446389, 1, 1, 1, 1, 1,
-1.591384, 0.5562897, -2.05554, 1, 1, 1, 1, 1,
-1.590614, -1.378691, -2.118158, 1, 1, 1, 1, 1,
-1.562776, 0.1822114, -0.8051858, 1, 1, 1, 1, 1,
-1.54878, 0.3836178, -2.542909, 1, 1, 1, 1, 1,
-1.548769, 0.745412, -0.7079617, 1, 1, 1, 1, 1,
-1.534531, 0.05355594, -1.116494, 0, 0, 1, 1, 1,
-1.532463, -1.813921, -0.5752127, 1, 0, 0, 1, 1,
-1.532308, -0.9218016, -1.05923, 1, 0, 0, 1, 1,
-1.520853, -0.1051553, -0.6780084, 1, 0, 0, 1, 1,
-1.517701, -0.5596328, -3.274323, 1, 0, 0, 1, 1,
-1.507645, 0.9820586, -1.434013, 1, 0, 0, 1, 1,
-1.501275, -0.1430649, -3.205235, 0, 0, 0, 1, 1,
-1.495403, -0.1398099, -1.435025, 0, 0, 0, 1, 1,
-1.492552, 0.7787408, -0.4929395, 0, 0, 0, 1, 1,
-1.492193, 2.326921, -0.3193211, 0, 0, 0, 1, 1,
-1.487046, -0.3041919, -2.10979, 0, 0, 0, 1, 1,
-1.485676, 0.9740607, 0.01307955, 0, 0, 0, 1, 1,
-1.478538, -1.951033, -1.955518, 0, 0, 0, 1, 1,
-1.466833, 0.8792564, -1.75797, 1, 1, 1, 1, 1,
-1.461603, -0.1834354, -4.325246, 1, 1, 1, 1, 1,
-1.452855, -1.086626, -2.657689, 1, 1, 1, 1, 1,
-1.41053, 0.1133858, -2.258152, 1, 1, 1, 1, 1,
-1.402569, -0.1470203, -1.456685, 1, 1, 1, 1, 1,
-1.399384, 0.2714169, -2.330542, 1, 1, 1, 1, 1,
-1.384548, -2.266034, -1.785821, 1, 1, 1, 1, 1,
-1.352006, -1.11854, -1.243987, 1, 1, 1, 1, 1,
-1.345785, 1.76636, -0.7517097, 1, 1, 1, 1, 1,
-1.344849, 0.1106178, -1.160408, 1, 1, 1, 1, 1,
-1.332657, 0.2835018, 0.2088012, 1, 1, 1, 1, 1,
-1.3309, -0.320696, -2.555731, 1, 1, 1, 1, 1,
-1.328606, -1.88616, -2.893711, 1, 1, 1, 1, 1,
-1.325399, 2.247932, -1.268374, 1, 1, 1, 1, 1,
-1.325123, 0.09885327, -3.296161, 1, 1, 1, 1, 1,
-1.324248, -0.8666118, -2.993695, 0, 0, 1, 1, 1,
-1.322233, -0.9964062, -1.407425, 1, 0, 0, 1, 1,
-1.320203, 1.478738, -1.50368, 1, 0, 0, 1, 1,
-1.319684, 0.2998134, -1.082021, 1, 0, 0, 1, 1,
-1.305272, 0.940275, 0.6048207, 1, 0, 0, 1, 1,
-1.30006, -1.125562, -3.010723, 1, 0, 0, 1, 1,
-1.298696, 0.8096879, -1.124615, 0, 0, 0, 1, 1,
-1.296541, 1.548665, -2.010312, 0, 0, 0, 1, 1,
-1.295192, -1.747046, -3.072641, 0, 0, 0, 1, 1,
-1.291319, -0.05390488, -2.479057, 0, 0, 0, 1, 1,
-1.290077, -0.1747495, -1.148355, 0, 0, 0, 1, 1,
-1.279432, -1.674073, -2.500361, 0, 0, 0, 1, 1,
-1.266835, -0.9859624, -3.031932, 0, 0, 0, 1, 1,
-1.25915, -0.6410502, -1.80138, 1, 1, 1, 1, 1,
-1.257205, 0.4430155, -0.4091369, 1, 1, 1, 1, 1,
-1.254516, -0.4005039, -2.704849, 1, 1, 1, 1, 1,
-1.253967, -0.9173513, -2.351288, 1, 1, 1, 1, 1,
-1.250982, 0.4878199, -0.1600169, 1, 1, 1, 1, 1,
-1.249625, 0.9710087, -1.034352, 1, 1, 1, 1, 1,
-1.246519, 0.4774517, -2.267391, 1, 1, 1, 1, 1,
-1.243423, -0.05415808, -2.469628, 1, 1, 1, 1, 1,
-1.233216, 0.2115113, -1.885019, 1, 1, 1, 1, 1,
-1.2277, 0.4323724, -1.472511, 1, 1, 1, 1, 1,
-1.227351, 1.091441, -0.5860971, 1, 1, 1, 1, 1,
-1.22619, 0.285123, -2.813897, 1, 1, 1, 1, 1,
-1.226026, 0.6443967, 0.6344373, 1, 1, 1, 1, 1,
-1.192752, 0.7799053, -1.501782, 1, 1, 1, 1, 1,
-1.191194, 0.9220949, -0.1492386, 1, 1, 1, 1, 1,
-1.190116, -1.899128, -2.812454, 0, 0, 1, 1, 1,
-1.185631, 0.8867428, -3.537357, 1, 0, 0, 1, 1,
-1.185061, 0.009920661, -1.645687, 1, 0, 0, 1, 1,
-1.184012, -1.040142, -1.77768, 1, 0, 0, 1, 1,
-1.182532, 1.83566, -2.292958, 1, 0, 0, 1, 1,
-1.181396, -0.1279865, -2.140704, 1, 0, 0, 1, 1,
-1.180686, 0.9311214, -1.507681, 0, 0, 0, 1, 1,
-1.164713, 0.6714882, -1.066015, 0, 0, 0, 1, 1,
-1.16437, -1.572577, -2.787321, 0, 0, 0, 1, 1,
-1.15738, -0.7343676, -1.307678, 0, 0, 0, 1, 1,
-1.156297, 2.143393, -0.8177866, 0, 0, 0, 1, 1,
-1.15406, -1.140318, -2.642894, 0, 0, 0, 1, 1,
-1.151622, -0.6446705, -1.768122, 0, 0, 0, 1, 1,
-1.150776, 0.3483288, -0.5581343, 1, 1, 1, 1, 1,
-1.146833, -1.612337, -2.029815, 1, 1, 1, 1, 1,
-1.14553, 0.2759374, -2.147053, 1, 1, 1, 1, 1,
-1.134219, -1.440005, -2.708633, 1, 1, 1, 1, 1,
-1.125312, 1.364948, -0.8483453, 1, 1, 1, 1, 1,
-1.121357, -0.8473366, -0.9274066, 1, 1, 1, 1, 1,
-1.117479, -0.4831059, -2.182157, 1, 1, 1, 1, 1,
-1.116884, -0.2161758, -3.046602, 1, 1, 1, 1, 1,
-1.112224, -1.453131, -3.456151, 1, 1, 1, 1, 1,
-1.103134, -0.6892307, -2.085987, 1, 1, 1, 1, 1,
-1.098941, 0.9398318, -0.1100696, 1, 1, 1, 1, 1,
-1.088224, 0.4504784, 0.3261847, 1, 1, 1, 1, 1,
-1.085441, -1.274519, -1.502292, 1, 1, 1, 1, 1,
-1.073986, 1.551641, -0.6553516, 1, 1, 1, 1, 1,
-1.070875, 0.6750797, -0.3848554, 1, 1, 1, 1, 1,
-1.058184, 0.8236339, -1.907501, 0, 0, 1, 1, 1,
-1.052938, -0.4577769, -0.8438969, 1, 0, 0, 1, 1,
-1.051876, 0.6866949, -0.5435626, 1, 0, 0, 1, 1,
-1.048879, -1.6636, -1.716781, 1, 0, 0, 1, 1,
-1.039523, 1.463059, 0.5426295, 1, 0, 0, 1, 1,
-1.030716, -0.0754711, -0.9272807, 1, 0, 0, 1, 1,
-1.014808, -0.7143601, -1.07377, 0, 0, 0, 1, 1,
-1.012037, 0.3097676, -2.161699, 0, 0, 0, 1, 1,
-1.006794, -1.378071, -1.895018, 0, 0, 0, 1, 1,
-1.006288, -0.2795295, -2.274806, 0, 0, 0, 1, 1,
-1.005205, -1.434464, -1.410547, 0, 0, 0, 1, 1,
-1.004094, 0.563071, -0.004881397, 0, 0, 0, 1, 1,
-0.9975184, 1.1224, -1.230793, 0, 0, 0, 1, 1,
-0.9953759, -0.2809818, -2.871713, 1, 1, 1, 1, 1,
-0.9926524, 2.408211, 1.626642, 1, 1, 1, 1, 1,
-0.9906605, -0.83347, -1.428349, 1, 1, 1, 1, 1,
-0.989302, 2.344115, -0.9996687, 1, 1, 1, 1, 1,
-0.9814549, -0.1532587, -0.07527616, 1, 1, 1, 1, 1,
-0.9772264, 0.04335836, -2.337847, 1, 1, 1, 1, 1,
-0.9672719, 1.362751, -0.9049871, 1, 1, 1, 1, 1,
-0.9656647, 0.3965622, -2.164122, 1, 1, 1, 1, 1,
-0.965102, 1.66011, -1.725991, 1, 1, 1, 1, 1,
-0.96363, 0.7299446, -0.4609459, 1, 1, 1, 1, 1,
-0.959109, -0.9584047, -2.529674, 1, 1, 1, 1, 1,
-0.9573134, 0.03161678, -1.090865, 1, 1, 1, 1, 1,
-0.9493936, 1.019484, -0.3968382, 1, 1, 1, 1, 1,
-0.9481251, -0.4468509, -1.239993, 1, 1, 1, 1, 1,
-0.9450046, 1.355329, 0.5938658, 1, 1, 1, 1, 1,
-0.9416276, 0.9452494, -0.0962799, 0, 0, 1, 1, 1,
-0.932416, 0.793629, -1.410746, 1, 0, 0, 1, 1,
-0.9323606, 0.7107307, -0.8579595, 1, 0, 0, 1, 1,
-0.929893, 1.376434, 0.915391, 1, 0, 0, 1, 1,
-0.9154055, -0.1738218, -0.3314524, 1, 0, 0, 1, 1,
-0.9064215, 1.734306, 0.9284096, 1, 0, 0, 1, 1,
-0.9050784, -0.5286231, 0.2375994, 0, 0, 0, 1, 1,
-0.9046468, 1.180657, -0.03954661, 0, 0, 0, 1, 1,
-0.9038476, -0.01093744, -1.914221, 0, 0, 0, 1, 1,
-0.8891443, -1.123135, -1.833333, 0, 0, 0, 1, 1,
-0.8847541, -1.95899, -3.686244, 0, 0, 0, 1, 1,
-0.8846731, -0.9613144, -5.266389, 0, 0, 0, 1, 1,
-0.8836999, -1.279145, -2.462586, 0, 0, 0, 1, 1,
-0.8833993, -0.5763945, -0.7931867, 1, 1, 1, 1, 1,
-0.8826104, 0.5732846, -1.132542, 1, 1, 1, 1, 1,
-0.8809788, 0.1805845, -1.239314, 1, 1, 1, 1, 1,
-0.8804638, -0.3705196, -4.200155, 1, 1, 1, 1, 1,
-0.8786742, 0.8002693, 0.7042413, 1, 1, 1, 1, 1,
-0.8780922, -0.2748226, -2.477654, 1, 1, 1, 1, 1,
-0.872506, -1.096246, -2.798671, 1, 1, 1, 1, 1,
-0.8588502, -0.2689991, -1.642357, 1, 1, 1, 1, 1,
-0.8531412, -0.05625016, -2.293881, 1, 1, 1, 1, 1,
-0.8528914, -0.9178095, -2.581633, 1, 1, 1, 1, 1,
-0.8514206, 1.783451, 1.183938, 1, 1, 1, 1, 1,
-0.8508032, -0.5798779, -1.077162, 1, 1, 1, 1, 1,
-0.8476847, 1.20552, -3.210028, 1, 1, 1, 1, 1,
-0.8476241, 0.1973849, -2.184817, 1, 1, 1, 1, 1,
-0.847608, -0.9545335, -3.295956, 1, 1, 1, 1, 1,
-0.8382413, -0.4047782, -3.257143, 0, 0, 1, 1, 1,
-0.8367186, 0.5072215, -0.7464144, 1, 0, 0, 1, 1,
-0.8360149, -0.8783077, -2.922023, 1, 0, 0, 1, 1,
-0.8320453, 1.298656, -0.5879206, 1, 0, 0, 1, 1,
-0.8280421, -0.1364245, -2.534499, 1, 0, 0, 1, 1,
-0.8216592, -0.1839176, -3.596149, 1, 0, 0, 1, 1,
-0.8160325, 1.439422, -2.208045, 0, 0, 0, 1, 1,
-0.8092301, -0.1928665, -1.169718, 0, 0, 0, 1, 1,
-0.8072199, -0.3846334, -1.921893, 0, 0, 0, 1, 1,
-0.8021306, -1.102184, -2.516463, 0, 0, 0, 1, 1,
-0.7988224, -0.6822553, -2.841184, 0, 0, 0, 1, 1,
-0.7959294, 1.297388, -0.9416147, 0, 0, 0, 1, 1,
-0.7937816, -0.5768527, -0.3090698, 0, 0, 0, 1, 1,
-0.791715, -0.7193183, -3.325868, 1, 1, 1, 1, 1,
-0.7902676, 0.1414767, -0.1064314, 1, 1, 1, 1, 1,
-0.7885976, 1.262247, -1.801066, 1, 1, 1, 1, 1,
-0.7870093, 1.822942, -0.3394095, 1, 1, 1, 1, 1,
-0.7847105, -2.051054, -2.426203, 1, 1, 1, 1, 1,
-0.7842634, 1.227657, -1.385721, 1, 1, 1, 1, 1,
-0.7825813, -2.494905, -3.810937, 1, 1, 1, 1, 1,
-0.7723855, 1.617044, -1.791098, 1, 1, 1, 1, 1,
-0.7657978, -0.5961626, -3.363999, 1, 1, 1, 1, 1,
-0.7657462, 0.2671967, -2.408486, 1, 1, 1, 1, 1,
-0.7640833, -0.1163893, -1.995214, 1, 1, 1, 1, 1,
-0.7569639, 0.128806, -2.904986, 1, 1, 1, 1, 1,
-0.7526126, -2.573071, -3.119338, 1, 1, 1, 1, 1,
-0.749245, -1.412146, -2.426174, 1, 1, 1, 1, 1,
-0.7477902, 0.8814429, -0.7757995, 1, 1, 1, 1, 1,
-0.7392043, 1.66256, -1.939163, 0, 0, 1, 1, 1,
-0.7372666, 0.3335407, -1.977026, 1, 0, 0, 1, 1,
-0.7315589, -0.3123618, -0.5638974, 1, 0, 0, 1, 1,
-0.7300683, -1.778568, -3.16484, 1, 0, 0, 1, 1,
-0.729018, 1.417138, -0.6375262, 1, 0, 0, 1, 1,
-0.7229518, 0.07768255, 0.4977826, 1, 0, 0, 1, 1,
-0.7205092, 0.162626, -1.530381, 0, 0, 0, 1, 1,
-0.7204385, -1.246722, -2.432299, 0, 0, 0, 1, 1,
-0.7170513, 1.388977, -0.6139645, 0, 0, 0, 1, 1,
-0.7156036, -0.1242855, -2.246464, 0, 0, 0, 1, 1,
-0.7133502, -0.8424194, -3.41055, 0, 0, 0, 1, 1,
-0.7108449, -0.3822168, -1.814913, 0, 0, 0, 1, 1,
-0.709042, 0.7304828, -1.643826, 0, 0, 0, 1, 1,
-0.7034107, -0.5534688, -3.591754, 1, 1, 1, 1, 1,
-0.7021133, 1.372836, -0.7506641, 1, 1, 1, 1, 1,
-0.6998031, -0.9151754, -3.493939, 1, 1, 1, 1, 1,
-0.6988988, 1.273248, 0.2222696, 1, 1, 1, 1, 1,
-0.6966633, 1.123345, 0.1538799, 1, 1, 1, 1, 1,
-0.6943192, -1.047537, -4.297158, 1, 1, 1, 1, 1,
-0.6933808, 0.4784367, -1.615331, 1, 1, 1, 1, 1,
-0.6868734, -1.694883, -4.680826, 1, 1, 1, 1, 1,
-0.6866741, -1.88071, -3.202481, 1, 1, 1, 1, 1,
-0.6814292, 0.445126, -2.102785, 1, 1, 1, 1, 1,
-0.6768932, -0.8268578, -3.150246, 1, 1, 1, 1, 1,
-0.6755425, 1.350988, -0.6303584, 1, 1, 1, 1, 1,
-0.6677543, 1.68619, 0.1086143, 1, 1, 1, 1, 1,
-0.6640234, -0.7801024, -3.466974, 1, 1, 1, 1, 1,
-0.661417, -0.6568047, -2.659132, 1, 1, 1, 1, 1,
-0.6602409, 0.4069844, -1.82779, 0, 0, 1, 1, 1,
-0.6521966, 0.3444321, -1.124321, 1, 0, 0, 1, 1,
-0.6496364, 0.7882048, -3.4197, 1, 0, 0, 1, 1,
-0.6460575, 0.883594, -0.2994642, 1, 0, 0, 1, 1,
-0.6440747, 0.08913513, -0.02206527, 1, 0, 0, 1, 1,
-0.6403487, 0.2905145, -1.350752, 1, 0, 0, 1, 1,
-0.6373472, -0.7477788, -0.8453259, 0, 0, 0, 1, 1,
-0.6307951, -1.723941, -3.717195, 0, 0, 0, 1, 1,
-0.6300638, 0.008251408, -1.14608, 0, 0, 0, 1, 1,
-0.6295612, 0.07760116, -1.717137, 0, 0, 0, 1, 1,
-0.6197185, 0.06579261, 0.2202511, 0, 0, 0, 1, 1,
-0.6173294, -0.02420946, -2.311842, 0, 0, 0, 1, 1,
-0.6098929, -0.6700226, -4.148377, 0, 0, 0, 1, 1,
-0.6082903, -0.1895738, -0.9374129, 1, 1, 1, 1, 1,
-0.6070803, -0.5685885, -2.244905, 1, 1, 1, 1, 1,
-0.6030445, 1.286032, -0.6531287, 1, 1, 1, 1, 1,
-0.6004998, -1.631069, -2.072582, 1, 1, 1, 1, 1,
-0.5931671, -1.082864, -2.919501, 1, 1, 1, 1, 1,
-0.5920299, 0.3737569, -1.397759, 1, 1, 1, 1, 1,
-0.5914156, 0.0119183, -2.89011, 1, 1, 1, 1, 1,
-0.5877177, -0.281824, -2.260864, 1, 1, 1, 1, 1,
-0.5858615, 0.1943224, -1.195507, 1, 1, 1, 1, 1,
-0.5834434, 0.04313102, -2.922153, 1, 1, 1, 1, 1,
-0.582798, -0.2714517, -2.064096, 1, 1, 1, 1, 1,
-0.5715554, -0.009240422, -1.540952, 1, 1, 1, 1, 1,
-0.5678523, -0.7731524, -2.675765, 1, 1, 1, 1, 1,
-0.5657607, 1.622291, 0.163514, 1, 1, 1, 1, 1,
-0.5621001, 0.7285342, -0.83047, 1, 1, 1, 1, 1,
-0.5592943, 2.285356, 2.076484, 0, 0, 1, 1, 1,
-0.5589293, -0.9254116, -3.106269, 1, 0, 0, 1, 1,
-0.5554303, 1.165245, -0.6777487, 1, 0, 0, 1, 1,
-0.5500128, 0.1243948, -1.883003, 1, 0, 0, 1, 1,
-0.5463257, -2.347329, -3.585926, 1, 0, 0, 1, 1,
-0.5458567, 1.209354, 1.123415, 1, 0, 0, 1, 1,
-0.5428516, -0.1785298, -3.046694, 0, 0, 0, 1, 1,
-0.538361, 0.9362534, -0.7769544, 0, 0, 0, 1, 1,
-0.5322466, 0.03464868, -3.195565, 0, 0, 0, 1, 1,
-0.525818, 0.4751998, -0.740177, 0, 0, 0, 1, 1,
-0.5199701, -0.4886539, -2.075023, 0, 0, 0, 1, 1,
-0.5189289, -0.510596, -1.412631, 0, 0, 0, 1, 1,
-0.5160156, -0.8143829, -1.673463, 0, 0, 0, 1, 1,
-0.5128626, -1.937102, -3.572448, 1, 1, 1, 1, 1,
-0.5124791, 0.5433227, -1.011086, 1, 1, 1, 1, 1,
-0.5108616, -0.3335166, -1.828011, 1, 1, 1, 1, 1,
-0.5093879, 0.4741627, 0.9671924, 1, 1, 1, 1, 1,
-0.5088054, -0.8248327, -2.612883, 1, 1, 1, 1, 1,
-0.5082477, 0.9843457, 1.105147, 1, 1, 1, 1, 1,
-0.5060729, -0.07470305, -2.184847, 1, 1, 1, 1, 1,
-0.5028694, 0.04330959, -1.935308, 1, 1, 1, 1, 1,
-0.5028044, -0.9178693, -1.75015, 1, 1, 1, 1, 1,
-0.502678, -2.024256, -1.724392, 1, 1, 1, 1, 1,
-0.4990908, -0.5901208, -1.985953, 1, 1, 1, 1, 1,
-0.4985522, 0.8663505, 0.892806, 1, 1, 1, 1, 1,
-0.4980384, -2.102499, -1.48667, 1, 1, 1, 1, 1,
-0.4914799, 0.2947896, -1.363519, 1, 1, 1, 1, 1,
-0.4835186, -1.724397, -1.160717, 1, 1, 1, 1, 1,
-0.4758446, 0.4198658, 0.001155007, 0, 0, 1, 1, 1,
-0.475661, 2.149738, -0.3030663, 1, 0, 0, 1, 1,
-0.4747007, 0.2646198, -0.2869439, 1, 0, 0, 1, 1,
-0.4718533, -1.315325, -3.023714, 1, 0, 0, 1, 1,
-0.4714647, -1.554555, -2.107383, 1, 0, 0, 1, 1,
-0.4689492, 0.91709, -0.02717147, 1, 0, 0, 1, 1,
-0.4681533, 1.560741, 1.705331, 0, 0, 0, 1, 1,
-0.4675637, -0.07482865, -0.09179381, 0, 0, 0, 1, 1,
-0.467413, -1.887448, -3.192493, 0, 0, 0, 1, 1,
-0.4668377, -1.410906, -3.355685, 0, 0, 0, 1, 1,
-0.4649572, -0.3755516, -2.731521, 0, 0, 0, 1, 1,
-0.4594726, -1.44747, -2.854083, 0, 0, 0, 1, 1,
-0.4566976, -0.7876596, -2.13254, 0, 0, 0, 1, 1,
-0.4545994, -0.3746263, -3.83311, 1, 1, 1, 1, 1,
-0.4497468, 0.173261, -1.442706, 1, 1, 1, 1, 1,
-0.4458336, -1.542985, -3.474697, 1, 1, 1, 1, 1,
-0.438888, -0.5762461, -3.838685, 1, 1, 1, 1, 1,
-0.4350153, 0.6835062, -0.3516248, 1, 1, 1, 1, 1,
-0.4295477, 0.1374256, -1.150098, 1, 1, 1, 1, 1,
-0.4232911, -2.090239, -3.389724, 1, 1, 1, 1, 1,
-0.4228959, -0.03645734, -1.902225, 1, 1, 1, 1, 1,
-0.4199367, -1.308164, -3.469421, 1, 1, 1, 1, 1,
-0.4177325, -0.3347297, -2.899793, 1, 1, 1, 1, 1,
-0.4170546, 1.183271, -1.880775, 1, 1, 1, 1, 1,
-0.412947, -0.7609878, -2.877777, 1, 1, 1, 1, 1,
-0.4123769, 0.09342472, -2.780086, 1, 1, 1, 1, 1,
-0.4072382, 1.359212, -1.250641, 1, 1, 1, 1, 1,
-0.4051628, 1.164163, -0.05194008, 1, 1, 1, 1, 1,
-0.4045909, -1.998711, -3.199356, 0, 0, 1, 1, 1,
-0.4015396, 2.084418, -0.08580608, 1, 0, 0, 1, 1,
-0.398186, 0.03837337, -1.670868, 1, 0, 0, 1, 1,
-0.3963839, -0.386239, -1.667693, 1, 0, 0, 1, 1,
-0.3941219, -0.8064402, -2.604604, 1, 0, 0, 1, 1,
-0.3930565, -0.2735311, -3.884422, 1, 0, 0, 1, 1,
-0.3866536, 0.1321089, -0.2526218, 0, 0, 0, 1, 1,
-0.3841477, -0.5852282, -2.556011, 0, 0, 0, 1, 1,
-0.3834411, -1.138589, -2.021909, 0, 0, 0, 1, 1,
-0.3803461, 0.3697441, -2.10371, 0, 0, 0, 1, 1,
-0.3642391, -0.6685469, -2.034612, 0, 0, 0, 1, 1,
-0.3641546, -0.2862215, -3.234523, 0, 0, 0, 1, 1,
-0.3625583, 1.107127, 1.064192, 0, 0, 0, 1, 1,
-0.3613041, -0.2488374, -2.743297, 1, 1, 1, 1, 1,
-0.3608643, 0.7604025, -0.4495417, 1, 1, 1, 1, 1,
-0.3586126, -0.8834658, -2.262105, 1, 1, 1, 1, 1,
-0.3510286, 0.3841113, -0.6028077, 1, 1, 1, 1, 1,
-0.3509325, 0.8162363, 1.113729, 1, 1, 1, 1, 1,
-0.3496622, 1.451722, -0.3547646, 1, 1, 1, 1, 1,
-0.3476835, -1.340348, -3.078274, 1, 1, 1, 1, 1,
-0.345367, 0.01725488, -1.86413, 1, 1, 1, 1, 1,
-0.3418403, -0.4903732, -3.526546, 1, 1, 1, 1, 1,
-0.3392471, -1.968776, -2.333951, 1, 1, 1, 1, 1,
-0.3372409, 0.5947734, -0.07122319, 1, 1, 1, 1, 1,
-0.3302809, 0.1188842, 1.27765, 1, 1, 1, 1, 1,
-0.3201463, -0.8079202, -1.746317, 1, 1, 1, 1, 1,
-0.3182703, 0.1160414, -0.3791268, 1, 1, 1, 1, 1,
-0.3177525, -0.4074628, -2.451211, 1, 1, 1, 1, 1,
-0.315369, -1.029941, -1.857573, 0, 0, 1, 1, 1,
-0.3115467, -0.3852335, -3.168943, 1, 0, 0, 1, 1,
-0.3102209, 0.8517128, -1.260675, 1, 0, 0, 1, 1,
-0.3087421, -1.740818, -1.873747, 1, 0, 0, 1, 1,
-0.3077922, -1.552382, -0.9300592, 1, 0, 0, 1, 1,
-0.3070197, 0.731733, -1.835482, 1, 0, 0, 1, 1,
-0.3047876, -0.9732274, -3.382985, 0, 0, 0, 1, 1,
-0.3028851, 1.074244, -0.9259851, 0, 0, 0, 1, 1,
-0.3018587, -1.526744, -3.317317, 0, 0, 0, 1, 1,
-0.2985858, -0.1011765, -3.363057, 0, 0, 0, 1, 1,
-0.29788, 1.464752, -0.02564768, 0, 0, 0, 1, 1,
-0.2978652, -0.09069534, -2.705807, 0, 0, 0, 1, 1,
-0.2918234, 0.2582612, -1.457201, 0, 0, 0, 1, 1,
-0.2912532, 0.3850008, 0.5322165, 1, 1, 1, 1, 1,
-0.2908233, 0.0414057, 1.189389, 1, 1, 1, 1, 1,
-0.2839526, -0.05543919, -1.788125, 1, 1, 1, 1, 1,
-0.2832242, -0.2793089, -2.527606, 1, 1, 1, 1, 1,
-0.2777593, 1.302569, -0.4154372, 1, 1, 1, 1, 1,
-0.2772064, 0.1546778, -1.320299, 1, 1, 1, 1, 1,
-0.2726285, -0.05715815, -0.4493893, 1, 1, 1, 1, 1,
-0.2689094, 0.1531458, -1.123025, 1, 1, 1, 1, 1,
-0.2661463, 1.487939, -0.4769347, 1, 1, 1, 1, 1,
-0.2549486, -0.5981706, -4.067335, 1, 1, 1, 1, 1,
-0.2518299, -0.1316881, -2.050262, 1, 1, 1, 1, 1,
-0.2494778, -0.8390437, -3.593343, 1, 1, 1, 1, 1,
-0.248734, -0.7778727, -2.944001, 1, 1, 1, 1, 1,
-0.2476071, 0.122579, -0.9296905, 1, 1, 1, 1, 1,
-0.2378124, 0.8643057, 0.8275699, 1, 1, 1, 1, 1,
-0.2376187, -2.092773, -1.403183, 0, 0, 1, 1, 1,
-0.2374944, -0.2050824, -1.957541, 1, 0, 0, 1, 1,
-0.2370343, 0.2098303, -1.686618, 1, 0, 0, 1, 1,
-0.2354155, -0.4750672, -2.844557, 1, 0, 0, 1, 1,
-0.2316116, 0.3828551, -1.859556, 1, 0, 0, 1, 1,
-0.2286297, 0.03248881, -1.59779, 1, 0, 0, 1, 1,
-0.2285084, -1.638525, -3.05845, 0, 0, 0, 1, 1,
-0.2271529, -1.329861, -1.885401, 0, 0, 0, 1, 1,
-0.2258589, -0.06836945, -2.774905, 0, 0, 0, 1, 1,
-0.2228957, -0.1909835, -3.060843, 0, 0, 0, 1, 1,
-0.2160996, 1.385028, -0.6036432, 0, 0, 0, 1, 1,
-0.2151267, -0.1952187, -1.718935, 0, 0, 0, 1, 1,
-0.2144197, -0.2899356, -3.531989, 0, 0, 0, 1, 1,
-0.2094578, -0.03695165, -1.902452, 1, 1, 1, 1, 1,
-0.2046739, 0.7716919, -2.526344, 1, 1, 1, 1, 1,
-0.2019563, 1.016838, -2.390006, 1, 1, 1, 1, 1,
-0.1975064, -1.003715, -2.652434, 1, 1, 1, 1, 1,
-0.1947125, -0.3921037, -2.34905, 1, 1, 1, 1, 1,
-0.1913511, 1.091453, 0.7663548, 1, 1, 1, 1, 1,
-0.1890475, 0.7184931, 0.2686411, 1, 1, 1, 1, 1,
-0.1853754, 0.9183404, 2.229224, 1, 1, 1, 1, 1,
-0.1850272, -0.8866447, -2.867546, 1, 1, 1, 1, 1,
-0.1832277, -1.349043, -3.901202, 1, 1, 1, 1, 1,
-0.1727129, 0.9494743, -1.484224, 1, 1, 1, 1, 1,
-0.1688237, -0.3573166, -2.713769, 1, 1, 1, 1, 1,
-0.1657228, -0.9211128, -5.567167, 1, 1, 1, 1, 1,
-0.1647208, 0.8971585, -0.9829126, 1, 1, 1, 1, 1,
-0.1594467, -0.6551617, -3.520334, 1, 1, 1, 1, 1,
-0.1564591, 0.4978647, -0.4935622, 0, 0, 1, 1, 1,
-0.1561465, -0.2110044, -4.011936, 1, 0, 0, 1, 1,
-0.1559972, 0.3784049, -1.069253, 1, 0, 0, 1, 1,
-0.1521122, -0.0009347461, -0.5190948, 1, 0, 0, 1, 1,
-0.1515644, -0.1388939, -1.417082, 1, 0, 0, 1, 1,
-0.1478776, 1.15238, 0.8384913, 1, 0, 0, 1, 1,
-0.1470864, 0.1103259, -3.13132, 0, 0, 0, 1, 1,
-0.1464433, 0.7226437, -1.349587, 0, 0, 0, 1, 1,
-0.1452749, -0.4097802, -2.963214, 0, 0, 0, 1, 1,
-0.1418339, -0.6335271, -3.276277, 0, 0, 0, 1, 1,
-0.1397686, -0.523524, -3.135148, 0, 0, 0, 1, 1,
-0.1318521, -0.8373336, -4.271563, 0, 0, 0, 1, 1,
-0.1310504, 0.2088901, -0.5137974, 0, 0, 0, 1, 1,
-0.1303689, 0.6296071, -0.1005157, 1, 1, 1, 1, 1,
-0.1277198, 0.8482248, 1.003515, 1, 1, 1, 1, 1,
-0.1177911, -0.5498434, -2.537274, 1, 1, 1, 1, 1,
-0.1169498, 1.318179, 0.3936155, 1, 1, 1, 1, 1,
-0.1118696, -0.4950655, -1.040951, 1, 1, 1, 1, 1,
-0.1093772, 2.833658, -0.6176611, 1, 1, 1, 1, 1,
-0.1086761, 0.294897, -0.8693465, 1, 1, 1, 1, 1,
-0.1085071, 1.145538, 0.03267287, 1, 1, 1, 1, 1,
-0.1064019, -1.071471, -4.116735, 1, 1, 1, 1, 1,
-0.1052217, 0.1787197, -0.434132, 1, 1, 1, 1, 1,
-0.1034159, 0.1536294, -2.720351, 1, 1, 1, 1, 1,
-0.1028296, -0.4534898, -1.248135, 1, 1, 1, 1, 1,
-0.1018137, -0.04546259, -1.868933, 1, 1, 1, 1, 1,
-0.1016027, 0.476035, 0.4008081, 1, 1, 1, 1, 1,
-0.09985218, 0.2994056, -0.5144064, 1, 1, 1, 1, 1,
-0.09524914, -1.032981, -4.692594, 0, 0, 1, 1, 1,
-0.09457673, -0.4192229, -3.12993, 1, 0, 0, 1, 1,
-0.09421666, -0.2726295, -1.258341, 1, 0, 0, 1, 1,
-0.09386948, -0.7531383, -2.393607, 1, 0, 0, 1, 1,
-0.09350895, 0.6558801, -0.5277072, 1, 0, 0, 1, 1,
-0.09334101, -0.0230901, -2.212749, 1, 0, 0, 1, 1,
-0.08763493, 2.017892, 0.343387, 0, 0, 0, 1, 1,
-0.08692118, 1.82544, -1.648225, 0, 0, 0, 1, 1,
-0.082746, 1.859431, -0.6488274, 0, 0, 0, 1, 1,
-0.08223116, 2.299004, -2.195581, 0, 0, 0, 1, 1,
-0.08203667, -0.03837726, -2.256957, 0, 0, 0, 1, 1,
-0.06831864, -0.9210353, -1.477609, 0, 0, 0, 1, 1,
-0.06822914, -2.39881, -4.216645, 0, 0, 0, 1, 1,
-0.06815322, 0.09821742, -1.246742, 1, 1, 1, 1, 1,
-0.06054183, -2.067627, -3.847702, 1, 1, 1, 1, 1,
-0.06017373, -1.993564, -4.438984, 1, 1, 1, 1, 1,
-0.05906405, -0.9915738, -1.851184, 1, 1, 1, 1, 1,
-0.05843497, -0.6388041, -3.211204, 1, 1, 1, 1, 1,
-0.05471546, -1.406044, -2.020115, 1, 1, 1, 1, 1,
-0.05325851, 0.01068934, -2.550771, 1, 1, 1, 1, 1,
-0.04605345, 3.27343, -1.238861, 1, 1, 1, 1, 1,
-0.04579703, 0.7783238, 0.08222993, 1, 1, 1, 1, 1,
-0.04563798, 0.6564135, -1.528348, 1, 1, 1, 1, 1,
-0.03998636, -1.905083, -3.277115, 1, 1, 1, 1, 1,
-0.03755188, -1.394233, -2.333295, 1, 1, 1, 1, 1,
-0.03690088, 0.3072602, 0.2558526, 1, 1, 1, 1, 1,
-0.03478075, 0.2505522, -0.4127468, 1, 1, 1, 1, 1,
-0.02940379, -0.2234135, -3.965094, 1, 1, 1, 1, 1,
-0.02806376, 0.8526424, -0.5062765, 0, 0, 1, 1, 1,
-0.02755873, 0.6512334, 0.01184732, 1, 0, 0, 1, 1,
-0.02185293, -0.4360539, -4.210336, 1, 0, 0, 1, 1,
-0.0203772, -0.6027839, -1.547348, 1, 0, 0, 1, 1,
-0.01780593, 0.4731936, -0.6048582, 1, 0, 0, 1, 1,
-0.01729161, -0.8185281, -4.346021, 1, 0, 0, 1, 1,
-0.01316093, -1.769385, -3.480342, 0, 0, 0, 1, 1,
-0.01121807, 0.599145, -0.2073295, 0, 0, 0, 1, 1,
-0.001672672, -0.6665702, -2.490822, 0, 0, 0, 1, 1,
0.002842103, 0.1276876, 0.4415843, 0, 0, 0, 1, 1,
0.01264232, -0.3589322, 3.764914, 0, 0, 0, 1, 1,
0.01340371, 0.9753976, 0.6819478, 0, 0, 0, 1, 1,
0.01501272, -0.1615814, 2.070095, 0, 0, 0, 1, 1,
0.01514568, 1.01814, -1.285826, 1, 1, 1, 1, 1,
0.01862136, -0.3010761, 1.861592, 1, 1, 1, 1, 1,
0.01942106, -0.2956078, 2.740182, 1, 1, 1, 1, 1,
0.02065373, 0.1762005, 0.2811354, 1, 1, 1, 1, 1,
0.02668563, 0.6708654, 0.1398471, 1, 1, 1, 1, 1,
0.02727275, -1.290375, 2.904617, 1, 1, 1, 1, 1,
0.04121092, -0.7032974, 2.513052, 1, 1, 1, 1, 1,
0.04168775, -0.8076379, 3.992355, 1, 1, 1, 1, 1,
0.0443606, -0.2522081, 3.349985, 1, 1, 1, 1, 1,
0.04640606, 1.387012, -0.667991, 1, 1, 1, 1, 1,
0.0482629, 0.7361891, 1.334454, 1, 1, 1, 1, 1,
0.04980767, -1.281707, 2.080158, 1, 1, 1, 1, 1,
0.0505202, -0.8289145, 2.224098, 1, 1, 1, 1, 1,
0.0569347, -0.9044623, 2.806499, 1, 1, 1, 1, 1,
0.05827503, 0.5156783, -1.33236, 1, 1, 1, 1, 1,
0.06053454, 0.4294036, -0.2642163, 0, 0, 1, 1, 1,
0.06491586, -1.307584, 4.510334, 1, 0, 0, 1, 1,
0.06868251, 0.3551633, -0.528544, 1, 0, 0, 1, 1,
0.06873313, 2.091059, 0.7287319, 1, 0, 0, 1, 1,
0.07372354, -0.6219795, 3.401393, 1, 0, 0, 1, 1,
0.07373707, 1.024836, 0.6731671, 1, 0, 0, 1, 1,
0.07399335, -0.8368575, 1.446809, 0, 0, 0, 1, 1,
0.07721538, -0.876808, 3.466897, 0, 0, 0, 1, 1,
0.08034837, -1.62175, 2.702608, 0, 0, 0, 1, 1,
0.08380643, -0.9087228, 2.137899, 0, 0, 0, 1, 1,
0.0880495, 1.347253, -0.4668679, 0, 0, 0, 1, 1,
0.08880416, -1.058187, 4.284005, 0, 0, 0, 1, 1,
0.08925078, -0.1902049, 1.810459, 0, 0, 0, 1, 1,
0.0906513, 0.6684365, 0.08652428, 1, 1, 1, 1, 1,
0.09823463, -1.214037, 2.203941, 1, 1, 1, 1, 1,
0.09837443, -0.2741867, 3.427948, 1, 1, 1, 1, 1,
0.1030391, 1.886768, 0.3011273, 1, 1, 1, 1, 1,
0.1037267, -0.6767681, 2.663968, 1, 1, 1, 1, 1,
0.1039746, -0.1213466, 3.536308, 1, 1, 1, 1, 1,
0.1042227, -1.226394, 1.852849, 1, 1, 1, 1, 1,
0.1067031, -0.1980934, 0.3815821, 1, 1, 1, 1, 1,
0.1108928, 0.1456027, 0.1252642, 1, 1, 1, 1, 1,
0.1119467, -2.035426, 3.910516, 1, 1, 1, 1, 1,
0.1123151, 0.1230995, 1.992427, 1, 1, 1, 1, 1,
0.1127771, 0.03640671, 0.4478304, 1, 1, 1, 1, 1,
0.1142203, -1.982734, 2.121307, 1, 1, 1, 1, 1,
0.1217969, 1.377413, -0.1671004, 1, 1, 1, 1, 1,
0.1218267, 2.255331, -0.186239, 1, 1, 1, 1, 1,
0.1243902, 0.9880923, 0.859651, 0, 0, 1, 1, 1,
0.1258069, -0.6188154, 2.848429, 1, 0, 0, 1, 1,
0.1260956, -0.8441755, 1.589185, 1, 0, 0, 1, 1,
0.1272943, 2.725373, -0.1382605, 1, 0, 0, 1, 1,
0.1286452, 1.924469, 0.1642169, 1, 0, 0, 1, 1,
0.1292603, -0.3517391, 0.6839955, 1, 0, 0, 1, 1,
0.1380522, 0.4174248, 0.8098994, 0, 0, 0, 1, 1,
0.1401597, 0.6663653, -0.5069526, 0, 0, 0, 1, 1,
0.1404023, 0.5941898, 0.7937862, 0, 0, 0, 1, 1,
0.1439008, 0.8905456, 0.2443508, 0, 0, 0, 1, 1,
0.1521897, 0.6896352, -0.1082949, 0, 0, 0, 1, 1,
0.1553592, 0.4166358, 0.9215987, 0, 0, 0, 1, 1,
0.1556747, 0.9104232, 1.479039, 0, 0, 0, 1, 1,
0.1589342, 0.0636996, 0.2500782, 1, 1, 1, 1, 1,
0.1606727, 0.27552, 1.431612, 1, 1, 1, 1, 1,
0.1613355, -1.359112, 2.83204, 1, 1, 1, 1, 1,
0.1637927, 0.09610751, 2.246805, 1, 1, 1, 1, 1,
0.1693363, 0.6019698, 0.1497015, 1, 1, 1, 1, 1,
0.1738489, 0.521314, 2.354067, 1, 1, 1, 1, 1,
0.1779091, 0.5002395, 2.688666, 1, 1, 1, 1, 1,
0.1786885, 0.2186239, 1.424143, 1, 1, 1, 1, 1,
0.179692, 0.1149923, 2.316983, 1, 1, 1, 1, 1,
0.1810303, 0.8818022, 0.196517, 1, 1, 1, 1, 1,
0.18113, -1.591928, 1.950303, 1, 1, 1, 1, 1,
0.1828998, -0.339352, 3.279441, 1, 1, 1, 1, 1,
0.1876725, 0.9122863, 0.5062459, 1, 1, 1, 1, 1,
0.1888585, 0.2891313, 0.1414775, 1, 1, 1, 1, 1,
0.1938917, -0.8277931, 4.602674, 1, 1, 1, 1, 1,
0.19525, -1.261753, 3.02138, 0, 0, 1, 1, 1,
0.2007485, 0.4434239, 1.028948, 1, 0, 0, 1, 1,
0.2008806, 0.3541976, -0.03731845, 1, 0, 0, 1, 1,
0.2069472, -0.9410709, 2.251738, 1, 0, 0, 1, 1,
0.2070569, -0.9086716, 2.598462, 1, 0, 0, 1, 1,
0.2081145, -0.6854434, 3.9185, 1, 0, 0, 1, 1,
0.2112317, -0.7132431, 2.92737, 0, 0, 0, 1, 1,
0.2156694, -0.4870587, 2.262318, 0, 0, 0, 1, 1,
0.2185147, 1.524536, -1.586276, 0, 0, 0, 1, 1,
0.2193718, 0.1428607, -0.1446643, 0, 0, 0, 1, 1,
0.2214166, -0.6994503, 2.124486, 0, 0, 0, 1, 1,
0.2237774, 0.7131281, -0.2625129, 0, 0, 0, 1, 1,
0.2240825, -0.4522861, 3.629453, 0, 0, 0, 1, 1,
0.2252209, 1.242594, 0.05983055, 1, 1, 1, 1, 1,
0.2267651, -0.4965126, 5.251297, 1, 1, 1, 1, 1,
0.228297, 1.089873, 1.944172, 1, 1, 1, 1, 1,
0.2320599, 1.036047, -0.2244741, 1, 1, 1, 1, 1,
0.2345209, 0.4248175, 2.085761, 1, 1, 1, 1, 1,
0.2402098, 0.7159259, 1.326008, 1, 1, 1, 1, 1,
0.2406134, -0.3518036, 1.192771, 1, 1, 1, 1, 1,
0.2413941, -2.470045, 3.167115, 1, 1, 1, 1, 1,
0.2414131, 1.624716, -0.643888, 1, 1, 1, 1, 1,
0.2427852, -0.09884662, 2.843601, 1, 1, 1, 1, 1,
0.2439028, 0.3859116, 1.204022, 1, 1, 1, 1, 1,
0.245323, -0.8433213, 2.517219, 1, 1, 1, 1, 1,
0.2453513, -0.8274671, 3.786379, 1, 1, 1, 1, 1,
0.257116, 0.5612517, 1.72535, 1, 1, 1, 1, 1,
0.2589654, 0.4673533, -0.6330009, 1, 1, 1, 1, 1,
0.2618817, -0.09029636, 2.041147, 0, 0, 1, 1, 1,
0.2671323, -0.3946429, 3.154069, 1, 0, 0, 1, 1,
0.2688271, 0.6584557, 1.036832, 1, 0, 0, 1, 1,
0.2732882, 0.5544342, -0.3080634, 1, 0, 0, 1, 1,
0.2773263, 0.7475123, 1.307382, 1, 0, 0, 1, 1,
0.2789397, -0.6021844, 2.037762, 1, 0, 0, 1, 1,
0.279512, 0.1916163, 0.3540808, 0, 0, 0, 1, 1,
0.2840984, 0.8449698, -0.279144, 0, 0, 0, 1, 1,
0.2854482, -0.1519762, 2.918035, 0, 0, 0, 1, 1,
0.2939027, 0.4869244, 0.9373704, 0, 0, 0, 1, 1,
0.2939554, -1.429736, 2.183362, 0, 0, 0, 1, 1,
0.2939657, 0.8307014, 0.9012887, 0, 0, 0, 1, 1,
0.3007626, -1.771992, 2.911543, 0, 0, 0, 1, 1,
0.3009489, 1.593395, 0.4954535, 1, 1, 1, 1, 1,
0.3043347, -0.2631339, 1.804092, 1, 1, 1, 1, 1,
0.312964, -0.7197823, 1.298205, 1, 1, 1, 1, 1,
0.3134761, 0.8578776, 1.362298, 1, 1, 1, 1, 1,
0.3145367, 1.276929, 0.7838839, 1, 1, 1, 1, 1,
0.3148955, 0.9529209, -1.975853, 1, 1, 1, 1, 1,
0.3175843, -1.074505, 1.415578, 1, 1, 1, 1, 1,
0.3183544, 0.6490774, 0.04365349, 1, 1, 1, 1, 1,
0.3200094, 0.5857714, -0.3046759, 1, 1, 1, 1, 1,
0.3201541, 2.418135, -0.7697824, 1, 1, 1, 1, 1,
0.3216131, -2.348578, 2.552797, 1, 1, 1, 1, 1,
0.3231088, 1.031179, 0.8101257, 1, 1, 1, 1, 1,
0.3262222, 0.6507183, -0.3457515, 1, 1, 1, 1, 1,
0.3276271, -0.723336, 3.127044, 1, 1, 1, 1, 1,
0.3295251, 1.098018, 2.203078, 1, 1, 1, 1, 1,
0.3439887, -0.6442918, 3.20359, 0, 0, 1, 1, 1,
0.344978, -0.6958333, 2.02593, 1, 0, 0, 1, 1,
0.3455681, -0.0476137, 2.06409, 1, 0, 0, 1, 1,
0.345621, 0.2078405, 1.403951, 1, 0, 0, 1, 1,
0.3471832, -0.9490407, 4.019828, 1, 0, 0, 1, 1,
0.349422, -0.3899961, 3.233353, 1, 0, 0, 1, 1,
0.3532473, 0.5634968, -0.3290025, 0, 0, 0, 1, 1,
0.3555214, -1.092715, 4.478388, 0, 0, 0, 1, 1,
0.361552, -0.2944045, 2.430565, 0, 0, 0, 1, 1,
0.3628135, 0.7946019, 0.3757456, 0, 0, 0, 1, 1,
0.3644091, -0.2273873, 0.512924, 0, 0, 0, 1, 1,
0.3649014, 0.3955783, 1.70094, 0, 0, 0, 1, 1,
0.3658105, 1.754503, -0.2962003, 0, 0, 0, 1, 1,
0.3687674, 1.157259, -0.7946315, 1, 1, 1, 1, 1,
0.3774284, -0.8235701, 1.603288, 1, 1, 1, 1, 1,
0.3790282, -0.04827604, 1.637097, 1, 1, 1, 1, 1,
0.3816693, 1.115099, 1.385524, 1, 1, 1, 1, 1,
0.3890612, -0.6572467, 3.296082, 1, 1, 1, 1, 1,
0.3946228, -1.683608, 3.71543, 1, 1, 1, 1, 1,
0.3984683, -1.556873, 3.097742, 1, 1, 1, 1, 1,
0.3998278, 0.8856714, 0.5447612, 1, 1, 1, 1, 1,
0.4007725, 0.04868074, 1.190958, 1, 1, 1, 1, 1,
0.4022719, 1.006163, -0.8849085, 1, 1, 1, 1, 1,
0.402305, -0.9204063, 3.224006, 1, 1, 1, 1, 1,
0.404822, 0.5502794, -0.09886172, 1, 1, 1, 1, 1,
0.4095165, 1.10635, -1.157197, 1, 1, 1, 1, 1,
0.4147633, -0.56736, 2.846359, 1, 1, 1, 1, 1,
0.4196717, -0.7589846, 1.964392, 1, 1, 1, 1, 1,
0.4232292, 0.3843698, 2.389862, 0, 0, 1, 1, 1,
0.4246745, 0.5703022, 1.759404, 1, 0, 0, 1, 1,
0.4263224, 1.460624, 0.6198248, 1, 0, 0, 1, 1,
0.4276786, 2.107136, -1.708936, 1, 0, 0, 1, 1,
0.4363036, -0.5798651, 4.566009, 1, 0, 0, 1, 1,
0.4369941, 0.3808517, 1.337181, 1, 0, 0, 1, 1,
0.442173, -1.260273, 2.864659, 0, 0, 0, 1, 1,
0.4483472, -0.2770769, 3.572894, 0, 0, 0, 1, 1,
0.4502035, -0.4364148, 3.138864, 0, 0, 0, 1, 1,
0.4518466, -0.1553046, 0.3799753, 0, 0, 0, 1, 1,
0.4521738, 0.4325127, 0.9477425, 0, 0, 0, 1, 1,
0.4534454, -0.3109601, 2.969948, 0, 0, 0, 1, 1,
0.4546912, -0.6468788, -0.3949406, 0, 0, 0, 1, 1,
0.4569552, 0.1776631, 1.953408, 1, 1, 1, 1, 1,
0.4624844, 1.771275, 0.1811737, 1, 1, 1, 1, 1,
0.4634449, -0.3922975, 2.708157, 1, 1, 1, 1, 1,
0.4657247, -0.1194902, 2.79701, 1, 1, 1, 1, 1,
0.4733811, 0.247902, 0.02482796, 1, 1, 1, 1, 1,
0.4782757, -1.262248, 1.960645, 1, 1, 1, 1, 1,
0.4829504, 2.541964, -0.3438927, 1, 1, 1, 1, 1,
0.4853798, 0.4210522, 1.69794, 1, 1, 1, 1, 1,
0.4953522, 0.6672243, 2.088836, 1, 1, 1, 1, 1,
0.4956791, -0.2968334, 2.298119, 1, 1, 1, 1, 1,
0.4965163, 2.339034, 0.4654881, 1, 1, 1, 1, 1,
0.4968921, -0.7023991, 1.045319, 1, 1, 1, 1, 1,
0.5027662, -0.2949113, 2.483915, 1, 1, 1, 1, 1,
0.5030454, -0.87159, 2.682334, 1, 1, 1, 1, 1,
0.5111378, 0.2494018, 0.7741991, 1, 1, 1, 1, 1,
0.5143768, 0.2555731, -1.034493, 0, 0, 1, 1, 1,
0.514882, 1.066263, -0.9614415, 1, 0, 0, 1, 1,
0.5150242, 0.7896593, 1.305475, 1, 0, 0, 1, 1,
0.5207527, 1.578632, 2.207455, 1, 0, 0, 1, 1,
0.5216646, 0.06761391, 2.04118, 1, 0, 0, 1, 1,
0.5250089, 0.2060227, 1.196888, 1, 0, 0, 1, 1,
0.5252958, -0.9367009, 1.929654, 0, 0, 0, 1, 1,
0.5289008, 0.1625501, 1.945062, 0, 0, 0, 1, 1,
0.5332965, 2.532843, 0.7825462, 0, 0, 0, 1, 1,
0.5335016, 0.7077903, 2.112145, 0, 0, 0, 1, 1,
0.5337372, 0.04036452, 0.5806987, 0, 0, 0, 1, 1,
0.537358, -1.029015, 2.766326, 0, 0, 0, 1, 1,
0.5380569, 1.275959, 2.131765, 0, 0, 0, 1, 1,
0.5475529, -0.3545614, 2.729171, 1, 1, 1, 1, 1,
0.5519284, -0.03129054, 3.478199, 1, 1, 1, 1, 1,
0.5533486, -0.6103877, 1.67934, 1, 1, 1, 1, 1,
0.5539501, -1.268551, 3.938499, 1, 1, 1, 1, 1,
0.5610279, 1.532921, 1.041573, 1, 1, 1, 1, 1,
0.5647773, -0.1383869, 1.99894, 1, 1, 1, 1, 1,
0.5657712, 1.08199, 1.498554, 1, 1, 1, 1, 1,
0.5660228, -0.3285922, 1.02808, 1, 1, 1, 1, 1,
0.5665044, -1.225706, 3.111502, 1, 1, 1, 1, 1,
0.5722595, 0.008708268, 0.606811, 1, 1, 1, 1, 1,
0.5777624, -0.3331787, 1.595957, 1, 1, 1, 1, 1,
0.5789431, 0.6319561, 0.9017701, 1, 1, 1, 1, 1,
0.5790973, -0.9254307, 2.196309, 1, 1, 1, 1, 1,
0.5792723, 1.034699, 1.577833, 1, 1, 1, 1, 1,
0.5804992, -0.5967446, 1.757666, 1, 1, 1, 1, 1,
0.5807813, -1.147214, 2.533187, 0, 0, 1, 1, 1,
0.5825788, -0.6333162, 3.054292, 1, 0, 0, 1, 1,
0.5870043, -0.6183563, 3.171547, 1, 0, 0, 1, 1,
0.5887558, 0.8251062, 2.223575, 1, 0, 0, 1, 1,
0.5988486, 0.6919596, -0.01456238, 1, 0, 0, 1, 1,
0.5996459, -0.307895, 1.542233, 1, 0, 0, 1, 1,
0.6004596, -0.6561801, 1.859438, 0, 0, 0, 1, 1,
0.6010954, -0.5673212, 1.189525, 0, 0, 0, 1, 1,
0.6013574, -2.541706, 2.089396, 0, 0, 0, 1, 1,
0.6065242, 0.4289959, 1.293043, 0, 0, 0, 1, 1,
0.6113575, 0.8808647, 0.9059185, 0, 0, 0, 1, 1,
0.6134766, 0.9592968, -2.278708, 0, 0, 0, 1, 1,
0.6145216, 0.9984028, 2.110121, 0, 0, 0, 1, 1,
0.6156306, 0.2624354, 2.84849, 1, 1, 1, 1, 1,
0.6170207, 1.791616, 1.355216, 1, 1, 1, 1, 1,
0.6189356, 0.6318673, 0.7576705, 1, 1, 1, 1, 1,
0.6207449, -1.199029, 3.967986, 1, 1, 1, 1, 1,
0.6222499, 0.3615415, 1.909755, 1, 1, 1, 1, 1,
0.6228795, -0.2908865, 1.192625, 1, 1, 1, 1, 1,
0.6294152, -0.6941472, 1.560792, 1, 1, 1, 1, 1,
0.633776, -0.3878042, 3.2905, 1, 1, 1, 1, 1,
0.6374026, -1.285613, 2.234628, 1, 1, 1, 1, 1,
0.6386351, 0.2957356, -0.6446086, 1, 1, 1, 1, 1,
0.6410335, 0.6293, 0.8188713, 1, 1, 1, 1, 1,
0.6421851, 0.1827744, 1.425776, 1, 1, 1, 1, 1,
0.6447537, -0.4460611, 2.389231, 1, 1, 1, 1, 1,
0.653984, -1.424772, 3.64879, 1, 1, 1, 1, 1,
0.6543172, 1.123058, -0.3502828, 1, 1, 1, 1, 1,
0.6562073, -0.8186734, 1.76115, 0, 0, 1, 1, 1,
0.6615365, -0.1412373, 1.391006, 1, 0, 0, 1, 1,
0.661657, 0.3290038, 0.4879242, 1, 0, 0, 1, 1,
0.6618912, 0.02660195, 1.662756, 1, 0, 0, 1, 1,
0.6629614, 0.2291903, -0.7283683, 1, 0, 0, 1, 1,
0.6681494, 0.8490519, 1.550592, 1, 0, 0, 1, 1,
0.6725674, 1.831891, 0.1887776, 0, 0, 0, 1, 1,
0.6726031, 0.1057703, 1.22054, 0, 0, 0, 1, 1,
0.6850876, -0.3898797, 1.018636, 0, 0, 0, 1, 1,
0.6884322, 1.02625, 2.064929, 0, 0, 0, 1, 1,
0.6886706, -1.281314, 0.9703382, 0, 0, 0, 1, 1,
0.6920089, -0.1863431, 1.768832, 0, 0, 0, 1, 1,
0.6932659, -0.3191974, 2.081425, 0, 0, 0, 1, 1,
0.6987653, 0.480244, 2.392108, 1, 1, 1, 1, 1,
0.7026014, -0.833439, 3.180115, 1, 1, 1, 1, 1,
0.7051402, 0.4721428, -0.03643379, 1, 1, 1, 1, 1,
0.708376, 0.2126287, 0.8821456, 1, 1, 1, 1, 1,
0.7115242, -1.391248, 0.9422179, 1, 1, 1, 1, 1,
0.7130288, -0.6920044, 1.191656, 1, 1, 1, 1, 1,
0.7130908, -0.8996991, 4.053727, 1, 1, 1, 1, 1,
0.7156246, 0.07703758, 0.8927867, 1, 1, 1, 1, 1,
0.7188439, -1.322875, 2.449739, 1, 1, 1, 1, 1,
0.7281702, -1.266578, 0.6436229, 1, 1, 1, 1, 1,
0.7315146, -1.367213, 3.246047, 1, 1, 1, 1, 1,
0.7321023, 1.256333, 1.472217, 1, 1, 1, 1, 1,
0.7350467, 0.331932, 0.5121369, 1, 1, 1, 1, 1,
0.741148, -1.6009, 3.232244, 1, 1, 1, 1, 1,
0.74325, 0.2631229, 2.920866, 1, 1, 1, 1, 1,
0.7433779, 1.049868, 0.7965406, 0, 0, 1, 1, 1,
0.7520961, -0.971817, 4.931573, 1, 0, 0, 1, 1,
0.7714122, 1.06751, -0.189965, 1, 0, 0, 1, 1,
0.7731652, -2.671712, 0.6350276, 1, 0, 0, 1, 1,
0.7784864, -0.7023632, 1.770983, 1, 0, 0, 1, 1,
0.7953212, 1.36448, -0.2236799, 1, 0, 0, 1, 1,
0.7995609, -0.03619157, 0.8043529, 0, 0, 0, 1, 1,
0.8064958, -2.057465, 3.313766, 0, 0, 0, 1, 1,
0.8075209, -0.3287845, 3.107222, 0, 0, 0, 1, 1,
0.8085593, 0.2663729, 0.7629076, 0, 0, 0, 1, 1,
0.8093042, -0.5518698, 2.524926, 0, 0, 0, 1, 1,
0.8108576, -1.19993, 1.012951, 0, 0, 0, 1, 1,
0.8117553, -1.615359, 2.72912, 0, 0, 0, 1, 1,
0.8143632, 2.31353, 0.9124342, 1, 1, 1, 1, 1,
0.8214319, 0.5199805, 0.6945686, 1, 1, 1, 1, 1,
0.8217624, 1.003277, 1.624641, 1, 1, 1, 1, 1,
0.8236911, 1.425377, -0.2690081, 1, 1, 1, 1, 1,
0.8306442, 0.08016539, 1.226245, 1, 1, 1, 1, 1,
0.8400605, -1.012741, 3.367927, 1, 1, 1, 1, 1,
0.8414348, -0.6294319, 3.250538, 1, 1, 1, 1, 1,
0.845286, 0.3677972, 0.01986693, 1, 1, 1, 1, 1,
0.8466678, 0.5822402, 1.532499, 1, 1, 1, 1, 1,
0.8468985, -0.3779181, 4.743338, 1, 1, 1, 1, 1,
0.8469264, 0.4601767, -1.031292, 1, 1, 1, 1, 1,
0.8510375, -0.04126962, -0.7173714, 1, 1, 1, 1, 1,
0.8513155, -3.002828, 5.015932, 1, 1, 1, 1, 1,
0.8540413, -0.3628973, 1.590984, 1, 1, 1, 1, 1,
0.8547678, 2.988326, -0.1056577, 1, 1, 1, 1, 1,
0.8559026, -1.278485, 1.769527, 0, 0, 1, 1, 1,
0.8561077, 1.235412, 0.3424829, 1, 0, 0, 1, 1,
0.8586062, 0.3334623, 1.208691, 1, 0, 0, 1, 1,
0.8738097, 0.4425894, 2.068017, 1, 0, 0, 1, 1,
0.8745954, 1.730561, 1.069497, 1, 0, 0, 1, 1,
0.875452, 0.1576764, 0.8508752, 1, 0, 0, 1, 1,
0.8759218, 0.5487538, 2.1839, 0, 0, 0, 1, 1,
0.877775, 0.11933, 2.135233, 0, 0, 0, 1, 1,
0.8874874, 1.192189, 2.577543, 0, 0, 0, 1, 1,
0.8934736, 0.1882438, 0.3435509, 0, 0, 0, 1, 1,
0.8941395, -0.3570398, 1.942499, 0, 0, 0, 1, 1,
0.9052619, 0.7208993, 0.3943874, 0, 0, 0, 1, 1,
0.9091114, 0.5263839, -2.392883, 0, 0, 0, 1, 1,
0.9132859, 0.2560896, 1.840151, 1, 1, 1, 1, 1,
0.9133379, 0.01836883, 1.907559, 1, 1, 1, 1, 1,
0.9141842, -0.1461082, 0.7103356, 1, 1, 1, 1, 1,
0.9168397, 0.674221, 2.454017, 1, 1, 1, 1, 1,
0.9230942, -0.4063882, 2.772042, 1, 1, 1, 1, 1,
0.9245167, -0.8106397, 4.116623, 1, 1, 1, 1, 1,
0.9425849, -0.1049217, 2.137067, 1, 1, 1, 1, 1,
0.9433261, -1.029846, 3.991327, 1, 1, 1, 1, 1,
0.9650312, 0.7977425, 0.4683654, 1, 1, 1, 1, 1,
0.9650911, -1.488277, 4.131075, 1, 1, 1, 1, 1,
0.9653999, 0.277043, 2.243772, 1, 1, 1, 1, 1,
0.974071, -0.65101, 1.608321, 1, 1, 1, 1, 1,
0.9790354, -0.8954371, 1.679515, 1, 1, 1, 1, 1,
0.9803677, 0.299094, 1.562136, 1, 1, 1, 1, 1,
0.9814076, -1.114688, 4.495296, 1, 1, 1, 1, 1,
0.9816214, 0.8668129, 0.3242256, 0, 0, 1, 1, 1,
0.9830472, -0.217377, 2.927279, 1, 0, 0, 1, 1,
0.9833648, 1.426281, 0.2705656, 1, 0, 0, 1, 1,
0.9879128, -0.525287, 2.245926, 1, 0, 0, 1, 1,
0.9928754, -1.965224, 2.968161, 1, 0, 0, 1, 1,
0.9954832, -1.543686, 2.761296, 1, 0, 0, 1, 1,
1.001833, 0.6765252, 1.297006, 0, 0, 0, 1, 1,
1.007994, 0.4221231, 1.497952, 0, 0, 0, 1, 1,
1.009942, 0.5257051, -1.030555, 0, 0, 0, 1, 1,
1.010379, -1.315659, 1.988384, 0, 0, 0, 1, 1,
1.010844, -0.4653227, 2.937423, 0, 0, 0, 1, 1,
1.012758, 0.7211705, 2.772413, 0, 0, 0, 1, 1,
1.024803, -1.370374, 2.562395, 0, 0, 0, 1, 1,
1.030326, 0.7291592, 1.205835, 1, 1, 1, 1, 1,
1.032598, -0.3142221, 2.297192, 1, 1, 1, 1, 1,
1.03549, 1.442194, 0.1105439, 1, 1, 1, 1, 1,
1.038478, 1.024609, 2.179608, 1, 1, 1, 1, 1,
1.03984, 0.02054792, -0.03505134, 1, 1, 1, 1, 1,
1.044039, -0.9465489, 2.726636, 1, 1, 1, 1, 1,
1.052109, 0.6844199, -0.1101932, 1, 1, 1, 1, 1,
1.05233, 2.949433, -1.404879, 1, 1, 1, 1, 1,
1.053376, 0.5647318, 1.430921, 1, 1, 1, 1, 1,
1.059759, -1.422733, 4.440719, 1, 1, 1, 1, 1,
1.066927, 1.029688, 2.590261, 1, 1, 1, 1, 1,
1.07601, 0.03810564, 1.586312, 1, 1, 1, 1, 1,
1.076584, 0.5521443, -1.604612, 1, 1, 1, 1, 1,
1.079973, -1.657658, 1.892051, 1, 1, 1, 1, 1,
1.081536, -0.7829214, 1.840175, 1, 1, 1, 1, 1,
1.083109, 0.7566259, -0.2289914, 0, 0, 1, 1, 1,
1.087251, 0.5767353, 2.462757, 1, 0, 0, 1, 1,
1.09251, 0.8791716, 2.289108, 1, 0, 0, 1, 1,
1.098532, 0.8534533, 2.092797, 1, 0, 0, 1, 1,
1.112273, -0.9088578, 1.348206, 1, 0, 0, 1, 1,
1.112714, -1.71471, 4.382677, 1, 0, 0, 1, 1,
1.113744, 0.0584431, 0.7297977, 0, 0, 0, 1, 1,
1.120738, 0.7916077, 1.121637, 0, 0, 0, 1, 1,
1.129317, 0.006621412, 0.6641425, 0, 0, 0, 1, 1,
1.132837, 1.080291, 1.625888, 0, 0, 0, 1, 1,
1.133119, -0.7875698, 3.447844, 0, 0, 0, 1, 1,
1.133412, 0.1013491, 3.321658, 0, 0, 0, 1, 1,
1.137359, -0.6034607, 2.696016, 0, 0, 0, 1, 1,
1.138634, 0.7751555, -0.8728491, 1, 1, 1, 1, 1,
1.138763, -1.398308, 0.9006975, 1, 1, 1, 1, 1,
1.142234, 1.299271, 0.7993302, 1, 1, 1, 1, 1,
1.151166, 1.092449, 0.1006566, 1, 1, 1, 1, 1,
1.154696, 1.51618, 1.051168, 1, 1, 1, 1, 1,
1.159929, -2.033548, 3.19711, 1, 1, 1, 1, 1,
1.175162, -0.5490825, 2.261833, 1, 1, 1, 1, 1,
1.176836, -0.982564, 1.705722, 1, 1, 1, 1, 1,
1.192057, 0.9741465, 1.659691, 1, 1, 1, 1, 1,
1.192109, 1.830256, 0.00536895, 1, 1, 1, 1, 1,
1.194661, -0.5434458, 2.122063, 1, 1, 1, 1, 1,
1.200499, -0.1753953, 2.770331, 1, 1, 1, 1, 1,
1.212734, -0.2679621, 1.141331, 1, 1, 1, 1, 1,
1.220705, -0.3519786, 0.5317996, 1, 1, 1, 1, 1,
1.222798, -0.6163138, 3.62995, 1, 1, 1, 1, 1,
1.226808, -0.5622788, 3.108026, 0, 0, 1, 1, 1,
1.229717, 1.49929, 1.672375, 1, 0, 0, 1, 1,
1.231821, 1.679422, 0.8614976, 1, 0, 0, 1, 1,
1.234205, -0.1895171, 1.168368, 1, 0, 0, 1, 1,
1.252503, -0.5637999, 1.592877, 1, 0, 0, 1, 1,
1.256238, 0.3985383, 1.636751, 1, 0, 0, 1, 1,
1.258164, 1.194138, 2.961063, 0, 0, 0, 1, 1,
1.259824, 1.361476, 1.218078, 0, 0, 0, 1, 1,
1.260163, -0.07247812, 1.140317, 0, 0, 0, 1, 1,
1.262861, -0.5476496, 2.698519, 0, 0, 0, 1, 1,
1.267738, -0.9879449, 1.71222, 0, 0, 0, 1, 1,
1.270133, 1.936231, 0.05943867, 0, 0, 0, 1, 1,
1.282883, -0.09686681, 1.928192, 0, 0, 0, 1, 1,
1.293421, 0.2689549, 1.974002, 1, 1, 1, 1, 1,
1.294726, -0.03646489, 2.475623, 1, 1, 1, 1, 1,
1.295524, 0.02483741, 2.133355, 1, 1, 1, 1, 1,
1.297249, -0.8897786, 1.385626, 1, 1, 1, 1, 1,
1.33162, -0.1758841, 0.9209639, 1, 1, 1, 1, 1,
1.335418, -1.92427, 1.723746, 1, 1, 1, 1, 1,
1.337025, -0.8088072, 4.894019, 1, 1, 1, 1, 1,
1.337303, -0.6329494, 2.443955, 1, 1, 1, 1, 1,
1.338791, 0.2776744, 0.420401, 1, 1, 1, 1, 1,
1.339196, 1.091644, 3.134444, 1, 1, 1, 1, 1,
1.343254, 0.6670882, 1.29071, 1, 1, 1, 1, 1,
1.351241, -0.4125666, 1.706978, 1, 1, 1, 1, 1,
1.351728, -0.6038049, 2.7102, 1, 1, 1, 1, 1,
1.353137, -0.2413384, 0.9782628, 1, 1, 1, 1, 1,
1.354431, 1.75274, 2.13646, 1, 1, 1, 1, 1,
1.356157, 0.1902232, 0.5841891, 0, 0, 1, 1, 1,
1.358328, -0.6552009, 1.864459, 1, 0, 0, 1, 1,
1.359198, -1.054309, 1.881934, 1, 0, 0, 1, 1,
1.37358, -0.9600012, 3.097137, 1, 0, 0, 1, 1,
1.382572, -2.045789, 4.617776, 1, 0, 0, 1, 1,
1.385754, 0.487432, 0.6232843, 1, 0, 0, 1, 1,
1.389995, -0.1659358, 1.392374, 0, 0, 0, 1, 1,
1.395351, 0.08723389, 0.8249224, 0, 0, 0, 1, 1,
1.402179, -0.1367211, 2.241438, 0, 0, 0, 1, 1,
1.404558, -2.148756, 1.744588, 0, 0, 0, 1, 1,
1.409554, 0.6035625, 1.971062, 0, 0, 0, 1, 1,
1.422873, -0.638171, 2.690322, 0, 0, 0, 1, 1,
1.42476, -0.3224194, 1.37865, 0, 0, 0, 1, 1,
1.429314, 1.984153, -0.3241681, 1, 1, 1, 1, 1,
1.433891, 0.9196069, 1.029191, 1, 1, 1, 1, 1,
1.434079, -1.374042, 1.175608, 1, 1, 1, 1, 1,
1.435115, 0.3133741, 1.525253, 1, 1, 1, 1, 1,
1.443463, 1.047758, 0.1712357, 1, 1, 1, 1, 1,
1.449357, -0.5459738, 1.035566, 1, 1, 1, 1, 1,
1.456227, -0.6867373, 3.139133, 1, 1, 1, 1, 1,
1.457365, -1.152828, 1.049868, 1, 1, 1, 1, 1,
1.462562, 0.1706955, 0.4704456, 1, 1, 1, 1, 1,
1.463655, -0.1216254, 0.6947569, 1, 1, 1, 1, 1,
1.465401, 0.1087828, -0.01192028, 1, 1, 1, 1, 1,
1.476616, 0.657777, 0.6281135, 1, 1, 1, 1, 1,
1.481905, -1.756186, 1.56775, 1, 1, 1, 1, 1,
1.499783, 0.1047658, 1.892282, 1, 1, 1, 1, 1,
1.508514, 0.286108, 3.393577, 1, 1, 1, 1, 1,
1.519721, -0.2774547, 2.025472, 0, 0, 1, 1, 1,
1.528046, -0.5351354, 1.960379, 1, 0, 0, 1, 1,
1.536233, -0.9678486, 2.252561, 1, 0, 0, 1, 1,
1.538114, 1.642523, 2.064401, 1, 0, 0, 1, 1,
1.551963, 1.506891, 0.2232556, 1, 0, 0, 1, 1,
1.554605, -1.243846, 3.142111, 1, 0, 0, 1, 1,
1.575528, -0.5919305, 0.8899462, 0, 0, 0, 1, 1,
1.579715, -0.4766418, 0.4162317, 0, 0, 0, 1, 1,
1.589596, -0.9752837, 1.715684, 0, 0, 0, 1, 1,
1.616198, -0.37806, 2.781316, 0, 0, 0, 1, 1,
1.618606, 0.882315, 0.4257445, 0, 0, 0, 1, 1,
1.621835, -0.6468807, 1.727879, 0, 0, 0, 1, 1,
1.632415, -0.6912457, 0.004251502, 0, 0, 0, 1, 1,
1.641376, -0.858981, 3.946469, 1, 1, 1, 1, 1,
1.665656, 1.258519, 0.2816079, 1, 1, 1, 1, 1,
1.704851, -0.392089, 3.073638, 1, 1, 1, 1, 1,
1.706066, 0.2497871, 1.584612, 1, 1, 1, 1, 1,
1.716071, 0.454069, 0.6575679, 1, 1, 1, 1, 1,
1.716346, 0.6480553, 2.669472, 1, 1, 1, 1, 1,
1.750898, 1.869343, -0.530207, 1, 1, 1, 1, 1,
1.760955, -1.051324, 0.2524641, 1, 1, 1, 1, 1,
1.762241, -0.8715948, 1.48942, 1, 1, 1, 1, 1,
1.772564, 0.3442482, 0.3446148, 1, 1, 1, 1, 1,
1.793246, -0.7407116, 0.7820104, 1, 1, 1, 1, 1,
1.80131, -0.03643721, 3.176869, 1, 1, 1, 1, 1,
1.806582, 1.193635, 3.028606, 1, 1, 1, 1, 1,
1.829214, -0.07682889, 1.073723, 1, 1, 1, 1, 1,
1.830187, -0.8529092, 2.244474, 1, 1, 1, 1, 1,
1.835604, -1.006692, 3.572179, 0, 0, 1, 1, 1,
1.845728, 0.8607514, 2.418769, 1, 0, 0, 1, 1,
1.851683, 0.1624224, 0.7388152, 1, 0, 0, 1, 1,
1.856797, -0.7186441, -0.2719464, 1, 0, 0, 1, 1,
1.867334, 0.02883234, 2.057612, 1, 0, 0, 1, 1,
1.869669, -0.547088, 1.270117, 1, 0, 0, 1, 1,
1.870113, 1.015727, 2.224633, 0, 0, 0, 1, 1,
1.870737, 1.064603, -0.0782569, 0, 0, 0, 1, 1,
1.876529, 0.2305795, 2.274362, 0, 0, 0, 1, 1,
1.904531, 0.1948003, 2.764364, 0, 0, 0, 1, 1,
1.90746, -0.5119456, 4.121912, 0, 0, 0, 1, 1,
1.909634, -0.3762354, 2.198856, 0, 0, 0, 1, 1,
1.937266, 0.2091969, 0.6150598, 0, 0, 0, 1, 1,
1.943074, 0.1962346, 1.945973, 1, 1, 1, 1, 1,
1.943817, 0.5975121, 4.136325, 1, 1, 1, 1, 1,
1.954713, -1.865382, 2.930585, 1, 1, 1, 1, 1,
1.96594, 0.9928292, 2.341544, 1, 1, 1, 1, 1,
1.96881, -0.721369, 1.925389, 1, 1, 1, 1, 1,
1.986396, -0.1243091, 0.798512, 1, 1, 1, 1, 1,
1.99317, 1.791906, 2.493196, 1, 1, 1, 1, 1,
2.002546, 0.5869836, -0.5105031, 1, 1, 1, 1, 1,
2.012472, 1.289545, 0.239599, 1, 1, 1, 1, 1,
2.01985, -0.6409491, 3.253087, 1, 1, 1, 1, 1,
2.022057, -1.419747, 1.716486, 1, 1, 1, 1, 1,
2.03309, -0.780652, 2.263835, 1, 1, 1, 1, 1,
2.078842, -0.2522556, 0.9080452, 1, 1, 1, 1, 1,
2.126065, -0.8625922, 2.297474, 1, 1, 1, 1, 1,
2.13562, -0.6501226, 1.135777, 1, 1, 1, 1, 1,
2.161124, 0.768219, 1.145704, 0, 0, 1, 1, 1,
2.177856, 0.2428461, 1.531465, 1, 0, 0, 1, 1,
2.21035, -1.828983, 0.6811065, 1, 0, 0, 1, 1,
2.261216, -0.3718164, 1.922569, 1, 0, 0, 1, 1,
2.272305, -0.5801585, 4.458893, 1, 0, 0, 1, 1,
2.336359, 0.4494419, 2.203401, 1, 0, 0, 1, 1,
2.351949, 0.3009188, 2.567004, 0, 0, 0, 1, 1,
2.383304, -0.622463, 1.868413, 0, 0, 0, 1, 1,
2.446708, -2.712495, 1.292533, 0, 0, 0, 1, 1,
2.511477, 0.05843052, 1.607954, 0, 0, 0, 1, 1,
2.650922, 0.3751948, 1.541952, 0, 0, 0, 1, 1,
2.657169, 0.1377844, 2.518643, 0, 0, 0, 1, 1,
2.68115, -1.29393, 1.705412, 0, 0, 0, 1, 1,
2.718172, -0.8189557, 0.6103308, 1, 1, 1, 1, 1,
2.791432, 1.368443, -0.346312, 1, 1, 1, 1, 1,
2.862809, -0.9534828, 0.5933253, 1, 1, 1, 1, 1,
2.95517, 0.9014925, 0.02884461, 1, 1, 1, 1, 1,
3.110493, -0.08000426, 2.727134, 1, 1, 1, 1, 1,
3.192662, 2.260403, 0.540549, 1, 1, 1, 1, 1,
3.44503, 0.9443765, 0.6462847, 1, 1, 1, 1, 1
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
var radius = 9.82026;
var distance = 34.49325;
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
mvMatrix.translate( 0.1915691, -0.1353009, 0.1579349 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.49325);
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
