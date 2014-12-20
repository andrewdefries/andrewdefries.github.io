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
-3.101296, -0.9463413, -2.452564, 1, 0, 0, 1,
-2.917471, -0.5348265, -1.298587, 1, 0.007843138, 0, 1,
-2.722324, 1.370542, -0.866982, 1, 0.01176471, 0, 1,
-2.600339, -1.361039, -1.268588, 1, 0.01960784, 0, 1,
-2.542888, -1.04679, -1.660023, 1, 0.02352941, 0, 1,
-2.496015, 0.1697076, -2.721943, 1, 0.03137255, 0, 1,
-2.385654, -1.924565, -2.310097, 1, 0.03529412, 0, 1,
-2.354732, -0.2552137, -3.345136, 1, 0.04313726, 0, 1,
-2.271068, -0.1243494, -1.857018, 1, 0.04705882, 0, 1,
-2.215753, -0.2034024, -1.189182, 1, 0.05490196, 0, 1,
-2.200392, 0.04835801, 0.2667157, 1, 0.05882353, 0, 1,
-2.184392, 0.2621047, -1.810151, 1, 0.06666667, 0, 1,
-2.153746, 0.7853978, -1.989876, 1, 0.07058824, 0, 1,
-2.153449, 0.5688533, -2.335907, 1, 0.07843138, 0, 1,
-2.148059, 0.07027432, -0.1102137, 1, 0.08235294, 0, 1,
-2.110519, 1.254663, -1.446997, 1, 0.09019608, 0, 1,
-2.109276, 0.5864423, -2.273294, 1, 0.09411765, 0, 1,
-2.067457, 1.298095, 0.403558, 1, 0.1019608, 0, 1,
-2.057899, 1.221453, -0.3932713, 1, 0.1098039, 0, 1,
-2.043976, -0.2850158, -1.320146, 1, 0.1137255, 0, 1,
-2.036639, 0.5824945, -1.663513, 1, 0.1215686, 0, 1,
-2.030218, 2.125379, -0.5461158, 1, 0.1254902, 0, 1,
-2.023165, 0.09694138, -0.9130338, 1, 0.1333333, 0, 1,
-1.992036, -0.4736342, -1.263584, 1, 0.1372549, 0, 1,
-1.973161, -1.193785, -1.296508, 1, 0.145098, 0, 1,
-1.968519, -0.1925568, -2.169133, 1, 0.1490196, 0, 1,
-1.947491, 0.9914519, -0.3716232, 1, 0.1568628, 0, 1,
-1.931995, -0.9014417, -1.781729, 1, 0.1607843, 0, 1,
-1.916678, 1.5502, -1.038904, 1, 0.1686275, 0, 1,
-1.91005, 1.694413, -0.2104312, 1, 0.172549, 0, 1,
-1.878248, -0.5469685, -3.251145, 1, 0.1803922, 0, 1,
-1.828765, -0.06882909, -2.768027, 1, 0.1843137, 0, 1,
-1.821769, -0.1192361, -1.40282, 1, 0.1921569, 0, 1,
-1.793161, 1.363437, -1.103852, 1, 0.1960784, 0, 1,
-1.768859, -0.3610097, -2.509962, 1, 0.2039216, 0, 1,
-1.761841, 1.179836, -2.366702, 1, 0.2117647, 0, 1,
-1.744496, 0.05440148, -1.369025, 1, 0.2156863, 0, 1,
-1.740984, -0.5573978, -2.458084, 1, 0.2235294, 0, 1,
-1.712367, -0.9109914, -3.697182, 1, 0.227451, 0, 1,
-1.698909, -1.066795, -3.344007, 1, 0.2352941, 0, 1,
-1.684119, 1.807017, -0.08158685, 1, 0.2392157, 0, 1,
-1.682372, 0.04251266, -3.010854, 1, 0.2470588, 0, 1,
-1.638806, -0.8088161, -1.412321, 1, 0.2509804, 0, 1,
-1.637889, -0.6062728, -1.857521, 1, 0.2588235, 0, 1,
-1.625816, -0.5258964, -2.671484, 1, 0.2627451, 0, 1,
-1.600417, 0.9174116, -2.302126, 1, 0.2705882, 0, 1,
-1.588894, 0.1679519, -0.4424241, 1, 0.2745098, 0, 1,
-1.568887, -1.431067, -2.667832, 1, 0.282353, 0, 1,
-1.550311, -0.8049006, -3.050873, 1, 0.2862745, 0, 1,
-1.538465, -0.964927, -2.578505, 1, 0.2941177, 0, 1,
-1.524719, 1.07641, 0.8771048, 1, 0.3019608, 0, 1,
-1.501131, 0.5674731, -1.826816, 1, 0.3058824, 0, 1,
-1.496976, -2.702079, -1.863325, 1, 0.3137255, 0, 1,
-1.482625, -2.468996, -2.839586, 1, 0.3176471, 0, 1,
-1.478557, -1.042957, -3.101251, 1, 0.3254902, 0, 1,
-1.471975, -0.8835848, -1.118998, 1, 0.3294118, 0, 1,
-1.461795, -0.3679143, -2.008749, 1, 0.3372549, 0, 1,
-1.447927, -1.310712, -2.576931, 1, 0.3411765, 0, 1,
-1.44589, 0.9385159, -0.550404, 1, 0.3490196, 0, 1,
-1.444057, 0.1282341, -0.2585808, 1, 0.3529412, 0, 1,
-1.436987, -0.189813, -1.077789, 1, 0.3607843, 0, 1,
-1.431477, -0.03187278, -0.9956874, 1, 0.3647059, 0, 1,
-1.424487, 1.099556, -1.590755, 1, 0.372549, 0, 1,
-1.422758, -0.0212739, -1.725116, 1, 0.3764706, 0, 1,
-1.415863, 0.2616466, -2.062184, 1, 0.3843137, 0, 1,
-1.4112, 0.884975, 0.0205044, 1, 0.3882353, 0, 1,
-1.395637, -1.426814, -3.920646, 1, 0.3960784, 0, 1,
-1.392826, -0.6499789, -2.171003, 1, 0.4039216, 0, 1,
-1.392125, -1.55048, -2.874437, 1, 0.4078431, 0, 1,
-1.390795, -0.6540812, -1.520405, 1, 0.4156863, 0, 1,
-1.387337, 0.5838754, -2.563303, 1, 0.4196078, 0, 1,
-1.384399, -0.3425468, -1.879211, 1, 0.427451, 0, 1,
-1.37358, 0.3000389, -0.9649856, 1, 0.4313726, 0, 1,
-1.366748, -0.27915, 0.032604, 1, 0.4392157, 0, 1,
-1.364019, 0.3230935, -0.855926, 1, 0.4431373, 0, 1,
-1.363913, -0.2709321, -1.750181, 1, 0.4509804, 0, 1,
-1.360185, -0.3372773, 0.2678376, 1, 0.454902, 0, 1,
-1.359052, -1.428895, -1.046058, 1, 0.4627451, 0, 1,
-1.35296, -0.8687358, -2.372411, 1, 0.4666667, 0, 1,
-1.346905, -0.8140584, -3.896044, 1, 0.4745098, 0, 1,
-1.346575, 0.1810254, -2.750163, 1, 0.4784314, 0, 1,
-1.342503, 2.866773, -1.463027, 1, 0.4862745, 0, 1,
-1.341859, -0.9609317, -0.6687153, 1, 0.4901961, 0, 1,
-1.332806, -0.2430983, -1.287625, 1, 0.4980392, 0, 1,
-1.322808, 1.284574, -1.802506, 1, 0.5058824, 0, 1,
-1.313056, 0.8474582, -0.9109191, 1, 0.509804, 0, 1,
-1.310475, -0.1613278, -3.796969, 1, 0.5176471, 0, 1,
-1.293805, 0.9540554, -1.827876, 1, 0.5215687, 0, 1,
-1.290959, -0.1257484, -2.82628, 1, 0.5294118, 0, 1,
-1.281184, -0.02500795, -3.397001, 1, 0.5333334, 0, 1,
-1.272698, -0.7898114, -1.197302, 1, 0.5411765, 0, 1,
-1.267622, 0.8397408, 0.05595104, 1, 0.5450981, 0, 1,
-1.255361, 1.715341, -1.038032, 1, 0.5529412, 0, 1,
-1.254425, 0.6936307, -2.488352, 1, 0.5568628, 0, 1,
-1.246633, 0.06194028, -1.799263, 1, 0.5647059, 0, 1,
-1.243304, 3.066816, -0.1472005, 1, 0.5686275, 0, 1,
-1.240229, -0.01216786, -1.57455, 1, 0.5764706, 0, 1,
-1.232492, 1.086051, -1.286178, 1, 0.5803922, 0, 1,
-1.232411, -0.5694641, -3.17164, 1, 0.5882353, 0, 1,
-1.220731, -0.7831463, -2.755029, 1, 0.5921569, 0, 1,
-1.220219, -0.7889074, -2.707615, 1, 0.6, 0, 1,
-1.214122, -0.2546187, -2.017179, 1, 0.6078432, 0, 1,
-1.211877, 3.287855, -0.8873845, 1, 0.6117647, 0, 1,
-1.181692, 1.679515, -2.108754, 1, 0.6196079, 0, 1,
-1.167377, -0.9425456, -2.423192, 1, 0.6235294, 0, 1,
-1.156027, 0.2836276, -1.988683, 1, 0.6313726, 0, 1,
-1.149994, 2.008965, -1.271517, 1, 0.6352941, 0, 1,
-1.147593, -0.4705767, -2.022835, 1, 0.6431373, 0, 1,
-1.146, 1.959414, -0.3974301, 1, 0.6470588, 0, 1,
-1.143991, 1.61367, -0.09710594, 1, 0.654902, 0, 1,
-1.139274, 0.6007165, -2.208761, 1, 0.6588235, 0, 1,
-1.137642, 0.5137603, -2.325372, 1, 0.6666667, 0, 1,
-1.137584, 0.57434, -1.186706, 1, 0.6705883, 0, 1,
-1.133315, 0.5072558, -0.5088245, 1, 0.6784314, 0, 1,
-1.132267, -0.04424126, 0.125854, 1, 0.682353, 0, 1,
-1.132241, 0.5565609, -0.5332688, 1, 0.6901961, 0, 1,
-1.124286, 1.119302, -0.9962977, 1, 0.6941177, 0, 1,
-1.115394, 0.3235557, -1.750138, 1, 0.7019608, 0, 1,
-1.106926, -0.3587546, -3.115409, 1, 0.7098039, 0, 1,
-1.098292, 0.40351, -1.962725, 1, 0.7137255, 0, 1,
-1.09473, 0.5262871, -0.2749849, 1, 0.7215686, 0, 1,
-1.093256, -0.1476993, -1.831168, 1, 0.7254902, 0, 1,
-1.092998, -1.97921, -3.00962, 1, 0.7333333, 0, 1,
-1.092875, 0.4727413, -1.428745, 1, 0.7372549, 0, 1,
-1.088212, 0.4030167, -1.832575, 1, 0.7450981, 0, 1,
-1.083502, -0.9549837, -3.05609, 1, 0.7490196, 0, 1,
-1.074633, 1.954921, -1.444297, 1, 0.7568628, 0, 1,
-1.073285, 0.6897501, -2.74532, 1, 0.7607843, 0, 1,
-1.071202, -1.464334, -3.610978, 1, 0.7686275, 0, 1,
-1.0671, 0.4880954, -0.3489701, 1, 0.772549, 0, 1,
-1.063792, -0.0247674, -0.1137958, 1, 0.7803922, 0, 1,
-1.060584, 0.8905352, -1.096342, 1, 0.7843137, 0, 1,
-1.050733, -0.8403779, -1.56967, 1, 0.7921569, 0, 1,
-1.048463, 0.7162905, -1.799795, 1, 0.7960784, 0, 1,
-1.035597, -0.2150032, -1.548402, 1, 0.8039216, 0, 1,
-1.033476, 1.521081, 0.3134088, 1, 0.8117647, 0, 1,
-1.028757, -0.09543916, -2.3036, 1, 0.8156863, 0, 1,
-1.026805, 1.119786, -0.7145175, 1, 0.8235294, 0, 1,
-1.004002, -1.139424, -1.768385, 1, 0.827451, 0, 1,
-0.9924655, -1.749081, -1.14094, 1, 0.8352941, 0, 1,
-0.9900925, 1.421453, 0.05238949, 1, 0.8392157, 0, 1,
-0.9856359, 0.7783089, -1.250465, 1, 0.8470588, 0, 1,
-0.9701602, 0.34208, 1.020488, 1, 0.8509804, 0, 1,
-0.9679079, 2.097872, 0.6908712, 1, 0.8588235, 0, 1,
-0.9648649, -0.1575713, -0.4101367, 1, 0.8627451, 0, 1,
-0.9630854, 0.7822137, -2.007163, 1, 0.8705882, 0, 1,
-0.9623303, 0.108357, -0.3450902, 1, 0.8745098, 0, 1,
-0.9587808, 1.900448, -0.590981, 1, 0.8823529, 0, 1,
-0.9526614, 0.8738536, -0.7874107, 1, 0.8862745, 0, 1,
-0.9513863, -0.4204794, -2.20073, 1, 0.8941177, 0, 1,
-0.950116, -0.8993831, -2.190251, 1, 0.8980392, 0, 1,
-0.9481688, -0.4814664, -1.205205, 1, 0.9058824, 0, 1,
-0.9449467, -0.3790047, -2.231525, 1, 0.9137255, 0, 1,
-0.9382545, 0.1574911, 0.4644492, 1, 0.9176471, 0, 1,
-0.9380338, 0.1583675, -1.69375, 1, 0.9254902, 0, 1,
-0.9354905, -1.007511, -3.657167, 1, 0.9294118, 0, 1,
-0.92897, 0.2358124, -0.0329152, 1, 0.9372549, 0, 1,
-0.9282374, -1.237139, -4.263644, 1, 0.9411765, 0, 1,
-0.9273369, -0.1683625, -1.403973, 1, 0.9490196, 0, 1,
-0.9232227, -1.403752, -4.199216, 1, 0.9529412, 0, 1,
-0.9225886, -1.642878, -3.853929, 1, 0.9607843, 0, 1,
-0.9190747, -0.4748658, -1.492495, 1, 0.9647059, 0, 1,
-0.9162793, -0.1027975, -1.599422, 1, 0.972549, 0, 1,
-0.9102657, 2.614242, 0.05291405, 1, 0.9764706, 0, 1,
-0.9069515, 0.9762616, -0.08899472, 1, 0.9843137, 0, 1,
-0.9050019, -0.4912558, -1.154945, 1, 0.9882353, 0, 1,
-0.9027998, -0.2466789, -0.84716, 1, 0.9960784, 0, 1,
-0.8978868, -2.275508, -1.805452, 0.9960784, 1, 0, 1,
-0.8929572, -0.5829007, -3.723239, 0.9921569, 1, 0, 1,
-0.8926436, -2.233032, -2.795145, 0.9843137, 1, 0, 1,
-0.8922563, 0.6180677, -1.404422, 0.9803922, 1, 0, 1,
-0.8852843, 0.03512619, -0.6929759, 0.972549, 1, 0, 1,
-0.884737, -0.5218603, -2.928167, 0.9686275, 1, 0, 1,
-0.8837298, -1.504374, -1.122178, 0.9607843, 1, 0, 1,
-0.8830656, -0.0523863, -1.13274, 0.9568627, 1, 0, 1,
-0.8781546, -0.4646957, -1.546988, 0.9490196, 1, 0, 1,
-0.8741679, -0.442036, 1.168041, 0.945098, 1, 0, 1,
-0.8689275, -0.2572886, -1.490071, 0.9372549, 1, 0, 1,
-0.8558735, -0.5990204, -2.113081, 0.9333333, 1, 0, 1,
-0.8551303, -1.294631, -1.984996, 0.9254902, 1, 0, 1,
-0.8545846, 0.9124486, 0.594557, 0.9215686, 1, 0, 1,
-0.8537397, -0.03693079, -1.271112, 0.9137255, 1, 0, 1,
-0.8462846, 0.8490692, -0.1754827, 0.9098039, 1, 0, 1,
-0.8439657, -1.172607, -2.768533, 0.9019608, 1, 0, 1,
-0.8385345, 0.3603562, -1.682477, 0.8941177, 1, 0, 1,
-0.8371749, 0.3041309, 1.095857, 0.8901961, 1, 0, 1,
-0.8369196, 0.3939145, -0.5294476, 0.8823529, 1, 0, 1,
-0.8348528, -0.5360224, -1.816246, 0.8784314, 1, 0, 1,
-0.8269949, 0.7961557, -0.8752298, 0.8705882, 1, 0, 1,
-0.8181837, -0.415306, -1.326986, 0.8666667, 1, 0, 1,
-0.8103394, -0.7288126, -2.879076, 0.8588235, 1, 0, 1,
-0.8083517, -0.8536325, -2.260725, 0.854902, 1, 0, 1,
-0.8049975, 0.1546165, -1.230314, 0.8470588, 1, 0, 1,
-0.803468, 0.3917707, -0.6121545, 0.8431373, 1, 0, 1,
-0.8026037, -1.869269, -1.173797, 0.8352941, 1, 0, 1,
-0.7928691, -0.5499527, -1.041373, 0.8313726, 1, 0, 1,
-0.7859694, 1.462586, -1.587873, 0.8235294, 1, 0, 1,
-0.7818738, -0.2045062, -1.427754, 0.8196079, 1, 0, 1,
-0.7781026, -1.88054, -1.892183, 0.8117647, 1, 0, 1,
-0.7776182, -0.3755383, -1.913968, 0.8078431, 1, 0, 1,
-0.7756963, -0.1161218, -2.241117, 0.8, 1, 0, 1,
-0.7744731, 1.301172, -1.572018, 0.7921569, 1, 0, 1,
-0.7744004, -1.003898, -2.421664, 0.7882353, 1, 0, 1,
-0.773163, -0.02921396, -1.309344, 0.7803922, 1, 0, 1,
-0.772873, 1.142788, -1.100338, 0.7764706, 1, 0, 1,
-0.7716838, -0.07063425, -1.669464, 0.7686275, 1, 0, 1,
-0.7716572, 0.3371778, -0.5054197, 0.7647059, 1, 0, 1,
-0.7673883, -1.558825, -1.803827, 0.7568628, 1, 0, 1,
-0.7637135, -0.1428658, -3.845398, 0.7529412, 1, 0, 1,
-0.7572886, -0.9790515, -2.033587, 0.7450981, 1, 0, 1,
-0.7548692, -0.4574147, -2.769429, 0.7411765, 1, 0, 1,
-0.7524018, -1.233182, -3.38077, 0.7333333, 1, 0, 1,
-0.743364, -0.2284421, -2.434364, 0.7294118, 1, 0, 1,
-0.7419639, 1.892848, 0.1102916, 0.7215686, 1, 0, 1,
-0.7379054, 1.598135, 1.143799, 0.7176471, 1, 0, 1,
-0.7350301, 0.1796654, -0.8363597, 0.7098039, 1, 0, 1,
-0.7317836, -0.02485264, -3.389404, 0.7058824, 1, 0, 1,
-0.7307232, 1.105103, -0.06542244, 0.6980392, 1, 0, 1,
-0.724085, -1.711713, -3.222883, 0.6901961, 1, 0, 1,
-0.7227519, -0.3047384, -1.512332, 0.6862745, 1, 0, 1,
-0.7226162, -0.2676754, -2.880385, 0.6784314, 1, 0, 1,
-0.7221421, -1.211813, -3.927221, 0.6745098, 1, 0, 1,
-0.7162681, -0.1161229, -2.068898, 0.6666667, 1, 0, 1,
-0.7129943, -0.4789602, -1.49897, 0.6627451, 1, 0, 1,
-0.70715, 0.1427218, 0.2381715, 0.654902, 1, 0, 1,
-0.7011829, -1.099505, -0.6798964, 0.6509804, 1, 0, 1,
-0.6939973, 0.6892782, -1.198509, 0.6431373, 1, 0, 1,
-0.6932164, 0.8987582, -1.623286, 0.6392157, 1, 0, 1,
-0.6895078, 0.2388689, -0.8398582, 0.6313726, 1, 0, 1,
-0.6879712, -0.5887487, -1.709252, 0.627451, 1, 0, 1,
-0.6873223, 0.6163662, -0.2207824, 0.6196079, 1, 0, 1,
-0.6831759, -0.1852899, -2.882231, 0.6156863, 1, 0, 1,
-0.6790802, -0.09089339, -3.073128, 0.6078432, 1, 0, 1,
-0.678148, 0.7854351, -1.166555, 0.6039216, 1, 0, 1,
-0.6745715, -1.410324, -2.316846, 0.5960785, 1, 0, 1,
-0.674342, 0.5666241, -0.9516423, 0.5882353, 1, 0, 1,
-0.67273, 0.7454015, -0.6298674, 0.5843138, 1, 0, 1,
-0.6725694, 0.8475675, -0.2914216, 0.5764706, 1, 0, 1,
-0.6716336, 0.03524811, -3.728822, 0.572549, 1, 0, 1,
-0.6702896, 0.02686547, -1.663215, 0.5647059, 1, 0, 1,
-0.6676171, 0.9610612, -0.2266292, 0.5607843, 1, 0, 1,
-0.6618503, 1.62948, -0.5482887, 0.5529412, 1, 0, 1,
-0.6586702, 0.4688978, -1.11126, 0.5490196, 1, 0, 1,
-0.6557265, 0.4094472, -1.432949, 0.5411765, 1, 0, 1,
-0.6547034, 1.232253, -0.6675594, 0.5372549, 1, 0, 1,
-0.6502538, -0.9316892, -3.22859, 0.5294118, 1, 0, 1,
-0.6495283, 1.417077, -1.299776, 0.5254902, 1, 0, 1,
-0.6427906, 1.084386, -2.778904, 0.5176471, 1, 0, 1,
-0.6387415, 0.449691, 0.4071203, 0.5137255, 1, 0, 1,
-0.6382223, 0.2136604, -1.263229, 0.5058824, 1, 0, 1,
-0.6380454, 0.2953772, 0.01555712, 0.5019608, 1, 0, 1,
-0.6349204, -0.8471319, -2.302057, 0.4941176, 1, 0, 1,
-0.6336932, -1.201089, -2.330648, 0.4862745, 1, 0, 1,
-0.6322432, -0.2101684, -1.875814, 0.4823529, 1, 0, 1,
-0.6286418, -0.1743417, -1.873469, 0.4745098, 1, 0, 1,
-0.6277537, -0.192383, -1.694635, 0.4705882, 1, 0, 1,
-0.6266621, 0.7639338, -1.468966, 0.4627451, 1, 0, 1,
-0.6259522, -0.3231166, -2.633846, 0.4588235, 1, 0, 1,
-0.6256701, -0.6869023, -1.287226, 0.4509804, 1, 0, 1,
-0.6255239, -0.04423547, -2.101456, 0.4470588, 1, 0, 1,
-0.6254987, -0.6359766, -0.5270844, 0.4392157, 1, 0, 1,
-0.6247643, -1.042064, -3.284434, 0.4352941, 1, 0, 1,
-0.6230216, -0.06848969, -1.216947, 0.427451, 1, 0, 1,
-0.615424, 0.07464496, -0.7372837, 0.4235294, 1, 0, 1,
-0.6069121, 0.2614092, -0.1050678, 0.4156863, 1, 0, 1,
-0.6064469, 0.5357715, 0.25703, 0.4117647, 1, 0, 1,
-0.6058506, 0.6728715, -0.4902046, 0.4039216, 1, 0, 1,
-0.6001295, 0.5073712, -0.1770995, 0.3960784, 1, 0, 1,
-0.5984652, 1.562195, -1.053463, 0.3921569, 1, 0, 1,
-0.5953485, 0.3995026, -2.393641, 0.3843137, 1, 0, 1,
-0.5923842, 1.627091, 0.6649486, 0.3803922, 1, 0, 1,
-0.5871629, -0.429679, -3.941499, 0.372549, 1, 0, 1,
-0.5843251, -0.7586432, -1.853937, 0.3686275, 1, 0, 1,
-0.581257, 0.8075823, 0.4180165, 0.3607843, 1, 0, 1,
-0.5798439, 0.9933366, 0.6846563, 0.3568628, 1, 0, 1,
-0.5783611, 0.05681373, -0.9236819, 0.3490196, 1, 0, 1,
-0.5758087, -0.03841594, -1.581008, 0.345098, 1, 0, 1,
-0.5749325, -0.8296866, -3.024383, 0.3372549, 1, 0, 1,
-0.5714423, 2.154784, -0.07249325, 0.3333333, 1, 0, 1,
-0.5703958, 0.3956418, -1.047783, 0.3254902, 1, 0, 1,
-0.5657846, -0.5075139, -2.599074, 0.3215686, 1, 0, 1,
-0.5652462, -1.592496, -2.65584, 0.3137255, 1, 0, 1,
-0.5649058, 0.3029457, -1.189751, 0.3098039, 1, 0, 1,
-0.5636606, 0.04526176, -0.5531346, 0.3019608, 1, 0, 1,
-0.5634516, -0.3984819, -2.579506, 0.2941177, 1, 0, 1,
-0.5623792, 1.283597, -0.2042239, 0.2901961, 1, 0, 1,
-0.5614215, -1.314314, -3.286807, 0.282353, 1, 0, 1,
-0.5586807, 2.169265, -0.005598811, 0.2784314, 1, 0, 1,
-0.5539053, 0.1741906, -0.141813, 0.2705882, 1, 0, 1,
-0.5451302, -1.560985, -1.353973, 0.2666667, 1, 0, 1,
-0.5387966, 1.308941, -0.717962, 0.2588235, 1, 0, 1,
-0.5373983, 0.2676447, -2.009245, 0.254902, 1, 0, 1,
-0.5332337, 0.6134046, -1.159147, 0.2470588, 1, 0, 1,
-0.5320472, -0.299304, -1.512226, 0.2431373, 1, 0, 1,
-0.5318484, 0.793829, -0.7981073, 0.2352941, 1, 0, 1,
-0.5314136, -1.195076, -3.198059, 0.2313726, 1, 0, 1,
-0.5311962, 1.012191, -0.4028767, 0.2235294, 1, 0, 1,
-0.5250822, 0.07931545, -0.4092442, 0.2196078, 1, 0, 1,
-0.5216823, -0.8404099, -2.657086, 0.2117647, 1, 0, 1,
-0.5190161, -0.7164244, -3.257002, 0.2078431, 1, 0, 1,
-0.5174019, -2.081759, -1.722757, 0.2, 1, 0, 1,
-0.5116879, -2.011991, -2.349217, 0.1921569, 1, 0, 1,
-0.506218, 0.4028788, -0.9014521, 0.1882353, 1, 0, 1,
-0.5028521, 1.261696, -0.5807975, 0.1803922, 1, 0, 1,
-0.5025238, 0.2330839, -0.7194777, 0.1764706, 1, 0, 1,
-0.499651, -1.274736, -2.763583, 0.1686275, 1, 0, 1,
-0.494773, -1.083281, -3.462706, 0.1647059, 1, 0, 1,
-0.4947469, -0.09209143, -1.264465, 0.1568628, 1, 0, 1,
-0.4883471, 0.1178911, -2.250758, 0.1529412, 1, 0, 1,
-0.4877217, -2.540518, -1.714319, 0.145098, 1, 0, 1,
-0.4814613, -2.107755, -3.899446, 0.1411765, 1, 0, 1,
-0.4798441, 2.423865, 0.9406348, 0.1333333, 1, 0, 1,
-0.4777101, -0.2707244, -2.331976, 0.1294118, 1, 0, 1,
-0.4759969, 0.1879949, -1.334113, 0.1215686, 1, 0, 1,
-0.473788, -1.808225, -0.4946812, 0.1176471, 1, 0, 1,
-0.4726457, -1.212443, -3.794904, 0.1098039, 1, 0, 1,
-0.4711932, -2.313978, -2.15841, 0.1058824, 1, 0, 1,
-0.463562, 0.7769918, 0.4126436, 0.09803922, 1, 0, 1,
-0.4625657, 0.8318001, 0.3840659, 0.09019608, 1, 0, 1,
-0.461987, -0.6266642, -3.02313, 0.08627451, 1, 0, 1,
-0.4580457, 1.864461, -1.194567, 0.07843138, 1, 0, 1,
-0.4571104, -2.235613, -2.869333, 0.07450981, 1, 0, 1,
-0.4534523, -0.5227643, -1.916588, 0.06666667, 1, 0, 1,
-0.4470551, -1.513399, -2.981906, 0.0627451, 1, 0, 1,
-0.443839, 0.7378519, -0.763077, 0.05490196, 1, 0, 1,
-0.4378262, -0.1256957, -0.3354132, 0.05098039, 1, 0, 1,
-0.4376723, 2.422622, -0.1569046, 0.04313726, 1, 0, 1,
-0.4340607, 0.5904137, -1.355507, 0.03921569, 1, 0, 1,
-0.4338743, 0.6896412, 0.02401655, 0.03137255, 1, 0, 1,
-0.4272032, -0.46632, -1.427973, 0.02745098, 1, 0, 1,
-0.4266947, 0.242396, -1.754488, 0.01960784, 1, 0, 1,
-0.4182747, 0.3603806, 0.689342, 0.01568628, 1, 0, 1,
-0.4175136, 0.00690937, -0.9722827, 0.007843138, 1, 0, 1,
-0.4156646, -0.8793153, -1.042324, 0.003921569, 1, 0, 1,
-0.4153257, 1.323803, -0.7647422, 0, 1, 0.003921569, 1,
-0.4147517, -0.7822015, -3.659075, 0, 1, 0.01176471, 1,
-0.4146019, -0.9318427, -3.813234, 0, 1, 0.01568628, 1,
-0.4128884, 0.6450198, -0.9019737, 0, 1, 0.02352941, 1,
-0.4022158, 0.409306, -0.9202036, 0, 1, 0.02745098, 1,
-0.4015656, -1.965936, -2.895001, 0, 1, 0.03529412, 1,
-0.3954768, 1.288314, -0.610159, 0, 1, 0.03921569, 1,
-0.3939752, -0.24796, -1.17049, 0, 1, 0.04705882, 1,
-0.3901744, 0.3702096, -1.010772, 0, 1, 0.05098039, 1,
-0.3873223, 0.3387811, -0.9299419, 0, 1, 0.05882353, 1,
-0.3831016, -0.2551402, -3.00668, 0, 1, 0.0627451, 1,
-0.3827292, 2.195963, 1.039182, 0, 1, 0.07058824, 1,
-0.3824705, 0.199313, 0.08116261, 0, 1, 0.07450981, 1,
-0.3727516, -0.2232889, -2.557628, 0, 1, 0.08235294, 1,
-0.3653001, -1.387283, -2.512249, 0, 1, 0.08627451, 1,
-0.3615678, 1.478746, -0.5747406, 0, 1, 0.09411765, 1,
-0.3565015, -0.424882, -0.3522611, 0, 1, 0.1019608, 1,
-0.3559565, -0.4011595, -3.42406, 0, 1, 0.1058824, 1,
-0.3548841, -0.79693, -2.391926, 0, 1, 0.1137255, 1,
-0.3515193, 0.08642874, -2.186293, 0, 1, 0.1176471, 1,
-0.3509814, -1.698817, -3.354328, 0, 1, 0.1254902, 1,
-0.3445925, 1.6113, -0.2905985, 0, 1, 0.1294118, 1,
-0.3442162, -0.8785653, -1.552381, 0, 1, 0.1372549, 1,
-0.3424759, 0.6760566, -3.578484, 0, 1, 0.1411765, 1,
-0.3422447, 1.518759, -0.9338354, 0, 1, 0.1490196, 1,
-0.3383768, -1.419498, -3.060983, 0, 1, 0.1529412, 1,
-0.3379355, -1.299705, -1.744772, 0, 1, 0.1607843, 1,
-0.3337785, -0.7433297, -3.427127, 0, 1, 0.1647059, 1,
-0.332763, -0.4830796, -2.83865, 0, 1, 0.172549, 1,
-0.3254964, -0.5980833, -2.099351, 0, 1, 0.1764706, 1,
-0.324654, 0.6049919, -0.3117657, 0, 1, 0.1843137, 1,
-0.324623, 0.0166808, 0.04851211, 0, 1, 0.1882353, 1,
-0.3219865, -0.9669089, -3.341422, 0, 1, 0.1960784, 1,
-0.3179557, -0.1531632, -0.6711639, 0, 1, 0.2039216, 1,
-0.3162496, 0.2035276, -0.3050146, 0, 1, 0.2078431, 1,
-0.314056, -1.335105, -4.260196, 0, 1, 0.2156863, 1,
-0.3138273, -0.3861308, -0.7703992, 0, 1, 0.2196078, 1,
-0.3082412, -0.4709128, -2.430529, 0, 1, 0.227451, 1,
-0.3035575, 0.03382172, -1.121042, 0, 1, 0.2313726, 1,
-0.2985424, 0.1036775, -2.736981, 0, 1, 0.2392157, 1,
-0.2984065, 2.326087, -0.9907668, 0, 1, 0.2431373, 1,
-0.2979698, 0.9386528, -0.6419319, 0, 1, 0.2509804, 1,
-0.2975566, -0.9096683, -3.068298, 0, 1, 0.254902, 1,
-0.2967372, 1.42838, 0.3680762, 0, 1, 0.2627451, 1,
-0.2959402, 0.7404004, -1.006229, 0, 1, 0.2666667, 1,
-0.2909159, -0.7932682, -2.477093, 0, 1, 0.2745098, 1,
-0.2873199, -0.8033955, -1.217492, 0, 1, 0.2784314, 1,
-0.2866263, -0.8747966, -2.337741, 0, 1, 0.2862745, 1,
-0.2787724, -0.6551028, -3.464514, 0, 1, 0.2901961, 1,
-0.2765275, -0.3943377, -2.082978, 0, 1, 0.2980392, 1,
-0.2762955, -0.5845321, -1.6681, 0, 1, 0.3058824, 1,
-0.2732206, -0.8772738, -1.807501, 0, 1, 0.3098039, 1,
-0.2709006, 0.9744245, 1.286051, 0, 1, 0.3176471, 1,
-0.2609339, 1.437628, -0.943948, 0, 1, 0.3215686, 1,
-0.256234, -0.35666, -0.450356, 0, 1, 0.3294118, 1,
-0.2547466, -0.9507185, -1.976374, 0, 1, 0.3333333, 1,
-0.2435629, -0.3749894, -2.093893, 0, 1, 0.3411765, 1,
-0.2434563, -1.597035, -2.678355, 0, 1, 0.345098, 1,
-0.2409378, 0.03221962, 0.5383627, 0, 1, 0.3529412, 1,
-0.2376779, 0.3525045, -0.5309075, 0, 1, 0.3568628, 1,
-0.2367682, 0.3509311, 0.1998473, 0, 1, 0.3647059, 1,
-0.2365146, 0.5657941, -0.1581838, 0, 1, 0.3686275, 1,
-0.2345157, -1.25649, -3.534148, 0, 1, 0.3764706, 1,
-0.2339571, 0.3537115, -1.90901, 0, 1, 0.3803922, 1,
-0.2328874, -0.4806425, -1.318645, 0, 1, 0.3882353, 1,
-0.2284155, 1.092068, -0.6502783, 0, 1, 0.3921569, 1,
-0.224939, 0.2901054, -1.109142, 0, 1, 0.4, 1,
-0.223663, 0.3388147, -0.9376059, 0, 1, 0.4078431, 1,
-0.2229738, -1.65339, -3.091549, 0, 1, 0.4117647, 1,
-0.219976, -0.08404587, -1.088935, 0, 1, 0.4196078, 1,
-0.219038, -1.559732, -1.756553, 0, 1, 0.4235294, 1,
-0.2119348, -1.222442, -5.061816, 0, 1, 0.4313726, 1,
-0.2055018, 1.012474, 0.303818, 0, 1, 0.4352941, 1,
-0.2042996, -0.7799154, -2.999086, 0, 1, 0.4431373, 1,
-0.1991878, 1.517163, -0.2437543, 0, 1, 0.4470588, 1,
-0.1982839, 0.4782189, -0.7217051, 0, 1, 0.454902, 1,
-0.1957927, -2.224555, -4.867958, 0, 1, 0.4588235, 1,
-0.1931044, -0.6899617, -4.507037, 0, 1, 0.4666667, 1,
-0.1907979, 0.8669608, 0.4247535, 0, 1, 0.4705882, 1,
-0.1851655, 1.309328, -1.204861, 0, 1, 0.4784314, 1,
-0.18479, 0.03011067, -1.808057, 0, 1, 0.4823529, 1,
-0.1829107, 0.1340815, -0.7437688, 0, 1, 0.4901961, 1,
-0.1821196, 0.5773513, 1.454392, 0, 1, 0.4941176, 1,
-0.1812568, 0.3081926, 0.2026829, 0, 1, 0.5019608, 1,
-0.1802956, -0.03894525, -2.472083, 0, 1, 0.509804, 1,
-0.1794632, 0.6275371, -0.3794678, 0, 1, 0.5137255, 1,
-0.1789471, -0.4440186, -3.377943, 0, 1, 0.5215687, 1,
-0.1786611, -0.6777749, -1.978168, 0, 1, 0.5254902, 1,
-0.1734792, 1.492633, -0.9547592, 0, 1, 0.5333334, 1,
-0.1716833, -0.04803305, -1.992398, 0, 1, 0.5372549, 1,
-0.171588, 0.8566037, 1.379178, 0, 1, 0.5450981, 1,
-0.1697514, 0.5874867, -0.256221, 0, 1, 0.5490196, 1,
-0.1665868, -0.713107, -3.635686, 0, 1, 0.5568628, 1,
-0.1636216, 0.8552873, 0.02801921, 0, 1, 0.5607843, 1,
-0.1621556, 0.7058741, -0.7602031, 0, 1, 0.5686275, 1,
-0.1582605, -0.2610502, -3.890616, 0, 1, 0.572549, 1,
-0.1580711, 0.03900763, 0.4349972, 0, 1, 0.5803922, 1,
-0.1559124, -1.298287, -2.0315, 0, 1, 0.5843138, 1,
-0.148707, -1.05796, -2.710019, 0, 1, 0.5921569, 1,
-0.1480675, 1.071837, -0.2822289, 0, 1, 0.5960785, 1,
-0.1473403, -0.2197699, -2.405015, 0, 1, 0.6039216, 1,
-0.1367312, 0.3512707, -0.84844, 0, 1, 0.6117647, 1,
-0.1356522, 1.516548, 1.482738, 0, 1, 0.6156863, 1,
-0.1329852, -1.133718, -4.248815, 0, 1, 0.6235294, 1,
-0.1321569, -0.2123318, -3.807498, 0, 1, 0.627451, 1,
-0.1290394, 2.56719, -1.451194, 0, 1, 0.6352941, 1,
-0.1266253, 0.8256779, -0.8746125, 0, 1, 0.6392157, 1,
-0.1257042, 1.574864, -1.546257, 0, 1, 0.6470588, 1,
-0.1228796, 1.330024, 0.7411943, 0, 1, 0.6509804, 1,
-0.1210017, -0.4430836, -2.618425, 0, 1, 0.6588235, 1,
-0.1201455, -1.189598, -2.062841, 0, 1, 0.6627451, 1,
-0.1177438, 0.6826113, -0.1177174, 0, 1, 0.6705883, 1,
-0.1112569, -0.2231862, -2.962327, 0, 1, 0.6745098, 1,
-0.1067245, -0.142507, -3.896778, 0, 1, 0.682353, 1,
-0.1063966, 1.24024, 0.1304363, 0, 1, 0.6862745, 1,
-0.103566, -1.435235, -2.075542, 0, 1, 0.6941177, 1,
-0.09923167, 2.842048, 0.1202549, 0, 1, 0.7019608, 1,
-0.09847969, -0.7042999, -3.71128, 0, 1, 0.7058824, 1,
-0.09468596, 1.680799, -0.1936576, 0, 1, 0.7137255, 1,
-0.09270075, -0.2750902, -4.013048, 0, 1, 0.7176471, 1,
-0.09091558, 2.464483, 0.5006998, 0, 1, 0.7254902, 1,
-0.08920482, 1.380583, 0.6367023, 0, 1, 0.7294118, 1,
-0.08884753, 1.146212, -0.3092262, 0, 1, 0.7372549, 1,
-0.0845432, -0.04031336, -1.665249, 0, 1, 0.7411765, 1,
-0.07580474, -0.1491408, -4.183733, 0, 1, 0.7490196, 1,
-0.07516073, -0.2125685, -1.405502, 0, 1, 0.7529412, 1,
-0.07336928, 0.1684428, -1.040362, 0, 1, 0.7607843, 1,
-0.07290906, 0.4165439, -1.742664, 0, 1, 0.7647059, 1,
-0.07251889, 0.9907662, -1.877014, 0, 1, 0.772549, 1,
-0.0722902, 1.376446, -0.255788, 0, 1, 0.7764706, 1,
-0.07210003, -1.223902, -3.742649, 0, 1, 0.7843137, 1,
-0.07064462, 1.339295, 0.8245696, 0, 1, 0.7882353, 1,
-0.07062163, -1.931696, -3.376793, 0, 1, 0.7960784, 1,
-0.06852313, -0.9620479, -3.537889, 0, 1, 0.8039216, 1,
-0.06421843, -0.1026158, -2.435113, 0, 1, 0.8078431, 1,
-0.06333542, 1.602913, 0.6889386, 0, 1, 0.8156863, 1,
-0.06218512, 0.5032225, -0.8230629, 0, 1, 0.8196079, 1,
-0.0593178, -0.002787769, -1.049951, 0, 1, 0.827451, 1,
-0.05671237, -0.2732063, -2.977382, 0, 1, 0.8313726, 1,
-0.05491587, -0.3888114, -3.650909, 0, 1, 0.8392157, 1,
-0.0485496, 0.1689778, -0.493297, 0, 1, 0.8431373, 1,
-0.04457657, 0.971486, 0.5843495, 0, 1, 0.8509804, 1,
-0.03666784, -0.04859969, -0.9274803, 0, 1, 0.854902, 1,
-0.03576857, 0.6406086, 0.880694, 0, 1, 0.8627451, 1,
-0.03467739, -1.340678, -3.011828, 0, 1, 0.8666667, 1,
-0.03094539, -1.685632, -3.315426, 0, 1, 0.8745098, 1,
-0.02998806, 1.89046, -0.3270421, 0, 1, 0.8784314, 1,
-0.02552269, -0.1272095, -0.555752, 0, 1, 0.8862745, 1,
-0.02185029, 0.08095206, -2.176988, 0, 1, 0.8901961, 1,
-0.01705497, 0.1164979, 0.05825473, 0, 1, 0.8980392, 1,
-0.01652571, 1.17607, 0.9631003, 0, 1, 0.9058824, 1,
-0.0155314, 0.8199115, -1.894531, 0, 1, 0.9098039, 1,
-0.01464596, -0.3262675, -2.46642, 0, 1, 0.9176471, 1,
-0.01182217, 0.31684, 0.7112827, 0, 1, 0.9215686, 1,
-0.007644231, 0.5318138, -0.1342472, 0, 1, 0.9294118, 1,
-0.005548792, 1.718878, 0.7106907, 0, 1, 0.9333333, 1,
-0.00423694, 1.405839, -0.823526, 0, 1, 0.9411765, 1,
-0.00142836, -0.792156, -2.230823, 0, 1, 0.945098, 1,
0.0003122179, 0.4296949, -1.259066, 0, 1, 0.9529412, 1,
0.004294392, -0.5188469, 3.196214, 0, 1, 0.9568627, 1,
0.005727855, -0.06250001, 2.461212, 0, 1, 0.9647059, 1,
0.006647459, 0.9110474, -0.3038903, 0, 1, 0.9686275, 1,
0.01005166, -1.475533, 3.8353, 0, 1, 0.9764706, 1,
0.01194513, 0.6304584, 0.65437, 0, 1, 0.9803922, 1,
0.01353508, -0.2805707, 2.165106, 0, 1, 0.9882353, 1,
0.01414305, -0.02592017, 3.098781, 0, 1, 0.9921569, 1,
0.01705791, 0.4941459, -0.6346144, 0, 1, 1, 1,
0.02442821, -1.798319, 2.365193, 0, 0.9921569, 1, 1,
0.02773914, -0.5433609, 4.569229, 0, 0.9882353, 1, 1,
0.02781704, 0.8689212, 2.250551, 0, 0.9803922, 1, 1,
0.03224474, -0.5367069, 3.668401, 0, 0.9764706, 1, 1,
0.03290078, 0.6196735, -1.552681, 0, 0.9686275, 1, 1,
0.03756269, -1.503453, 3.289074, 0, 0.9647059, 1, 1,
0.04182167, 1.608874, 1.894038, 0, 0.9568627, 1, 1,
0.04263385, 2.032492, -0.4228192, 0, 0.9529412, 1, 1,
0.0454066, 0.7747828, 0.0270382, 0, 0.945098, 1, 1,
0.04719489, -0.2429171, 3.168643, 0, 0.9411765, 1, 1,
0.04726642, 1.948732, 0.5624435, 0, 0.9333333, 1, 1,
0.04840026, -1.214477, 3.16925, 0, 0.9294118, 1, 1,
0.05134608, 0.6047289, 0.8800749, 0, 0.9215686, 1, 1,
0.05486827, -1.573504, 3.473923, 0, 0.9176471, 1, 1,
0.05947048, -1.755989, 1.47971, 0, 0.9098039, 1, 1,
0.06470925, 0.05036241, -0.6731295, 0, 0.9058824, 1, 1,
0.06566301, -0.2639121, 4.879307, 0, 0.8980392, 1, 1,
0.06755047, -1.69146, 2.219465, 0, 0.8901961, 1, 1,
0.06849854, 0.2173902, 0.6588894, 0, 0.8862745, 1, 1,
0.07193793, -0.433755, 0.8938141, 0, 0.8784314, 1, 1,
0.07263888, -0.878013, 1.895899, 0, 0.8745098, 1, 1,
0.07369478, -0.4252317, 0.3941376, 0, 0.8666667, 1, 1,
0.08220291, -2.499845, 3.252228, 0, 0.8627451, 1, 1,
0.08795331, -0.414025, 3.502665, 0, 0.854902, 1, 1,
0.0884055, -0.7427067, 2.043319, 0, 0.8509804, 1, 1,
0.08879604, 0.6105365, 0.2782445, 0, 0.8431373, 1, 1,
0.09010804, -0.773113, 2.438817, 0, 0.8392157, 1, 1,
0.09880267, -0.1592513, 2.63915, 0, 0.8313726, 1, 1,
0.1000722, -0.9659874, 3.744385, 0, 0.827451, 1, 1,
0.1009478, -1.565593, 1.854499, 0, 0.8196079, 1, 1,
0.1029752, -1.055048, 3.256321, 0, 0.8156863, 1, 1,
0.1030481, -1.247564, 3.766085, 0, 0.8078431, 1, 1,
0.103992, -0.4456624, 3.094652, 0, 0.8039216, 1, 1,
0.1103932, 1.36331, -1.973194, 0, 0.7960784, 1, 1,
0.1117901, -0.7104359, 4.818746, 0, 0.7882353, 1, 1,
0.1125964, 1.288082, 2.104453, 0, 0.7843137, 1, 1,
0.1131295, 0.4989485, -1.853554, 0, 0.7764706, 1, 1,
0.1137021, 0.1303894, 0.5836079, 0, 0.772549, 1, 1,
0.1140144, 0.6280239, -0.591804, 0, 0.7647059, 1, 1,
0.1248558, 0.8932456, -0.02243822, 0, 0.7607843, 1, 1,
0.1260718, -0.1708611, 3.129139, 0, 0.7529412, 1, 1,
0.1305769, 1.143644, 0.08671547, 0, 0.7490196, 1, 1,
0.1322628, 2.087024, 2.534045, 0, 0.7411765, 1, 1,
0.132685, -0.5777982, 3.724223, 0, 0.7372549, 1, 1,
0.1372612, 1.40368, -1.538344, 0, 0.7294118, 1, 1,
0.1374436, 0.5940948, -0.4032908, 0, 0.7254902, 1, 1,
0.1377389, -0.01906572, 0.8070989, 0, 0.7176471, 1, 1,
0.1425816, -0.4530601, 2.607193, 0, 0.7137255, 1, 1,
0.1427551, 1.186259, 0.5145347, 0, 0.7058824, 1, 1,
0.1441664, -1.614382, 3.152695, 0, 0.6980392, 1, 1,
0.1482305, 1.517507, -0.594605, 0, 0.6941177, 1, 1,
0.1525707, 0.2954029, 2.135899, 0, 0.6862745, 1, 1,
0.1552275, -0.5397643, 3.694033, 0, 0.682353, 1, 1,
0.1556032, 0.2991144, 0.8276598, 0, 0.6745098, 1, 1,
0.1610303, 0.8148555, 0.363366, 0, 0.6705883, 1, 1,
0.1622976, 0.3737048, 2.131777, 0, 0.6627451, 1, 1,
0.1635653, 0.4726935, -0.8196355, 0, 0.6588235, 1, 1,
0.1679194, 0.2087158, -0.481802, 0, 0.6509804, 1, 1,
0.1696447, 0.2304006, 0.5596484, 0, 0.6470588, 1, 1,
0.1705992, -1.315112, 3.861916, 0, 0.6392157, 1, 1,
0.1732733, 0.7443129, 0.5077952, 0, 0.6352941, 1, 1,
0.1738101, 0.3608575, -0.07738025, 0, 0.627451, 1, 1,
0.1755562, -0.2439906, 3.12371, 0, 0.6235294, 1, 1,
0.1760195, -0.9853985, 5.138436, 0, 0.6156863, 1, 1,
0.1875488, -0.5662547, 1.792524, 0, 0.6117647, 1, 1,
0.189334, 0.3687356, 0.7718562, 0, 0.6039216, 1, 1,
0.1910838, -0.2521618, 2.6829, 0, 0.5960785, 1, 1,
0.1978533, -0.8884384, 0.9513448, 0, 0.5921569, 1, 1,
0.1987557, 0.6009522, 0.9248307, 0, 0.5843138, 1, 1,
0.1988963, -1.468205, 1.906965, 0, 0.5803922, 1, 1,
0.2087598, -0.8676332, 4.221117, 0, 0.572549, 1, 1,
0.2097339, -0.5188987, 3.835711, 0, 0.5686275, 1, 1,
0.2142572, 1.262017, -2.208904, 0, 0.5607843, 1, 1,
0.2156141, -0.3672267, 2.762661, 0, 0.5568628, 1, 1,
0.2167047, 1.657781, -2.657453, 0, 0.5490196, 1, 1,
0.2215481, 0.8787671, 0.4878793, 0, 0.5450981, 1, 1,
0.222252, -0.5389239, 4.653075, 0, 0.5372549, 1, 1,
0.222952, 0.9297916, -1.3776, 0, 0.5333334, 1, 1,
0.223383, -0.5849922, 2.993994, 0, 0.5254902, 1, 1,
0.2257979, -1.874908, 2.885216, 0, 0.5215687, 1, 1,
0.230094, -0.9612696, 2.630322, 0, 0.5137255, 1, 1,
0.2320743, 0.5471639, 0.3533761, 0, 0.509804, 1, 1,
0.2344278, 0.4778571, -0.2241679, 0, 0.5019608, 1, 1,
0.2350453, -1.14283, 2.398979, 0, 0.4941176, 1, 1,
0.2362437, 1.325291, 0.2514721, 0, 0.4901961, 1, 1,
0.2363452, -0.01509228, 2.169028, 0, 0.4823529, 1, 1,
0.2488826, -2.412868, 4.21223, 0, 0.4784314, 1, 1,
0.2548205, 0.751028, 1.163834, 0, 0.4705882, 1, 1,
0.2561013, 0.657993, 0.6011013, 0, 0.4666667, 1, 1,
0.2573469, -1.056253, 3.990093, 0, 0.4588235, 1, 1,
0.2637027, -0.3547089, 5.091081, 0, 0.454902, 1, 1,
0.2661152, -1.191061, 2.95977, 0, 0.4470588, 1, 1,
0.2758598, -1.286034, 1.573732, 0, 0.4431373, 1, 1,
0.2776864, 0.03116138, 1.041658, 0, 0.4352941, 1, 1,
0.2790566, -1.408374, 2.810805, 0, 0.4313726, 1, 1,
0.2798345, -0.1297684, 3.969867, 0, 0.4235294, 1, 1,
0.2850614, -0.4000434, 4.496337, 0, 0.4196078, 1, 1,
0.2888921, 0.6044077, 0.6984106, 0, 0.4117647, 1, 1,
0.2935158, -1.46538, 3.136209, 0, 0.4078431, 1, 1,
0.2945753, 1.255898, 1.627062, 0, 0.4, 1, 1,
0.2946711, 0.03550332, 0.5406457, 0, 0.3921569, 1, 1,
0.2959218, 0.5010237, 1.03905, 0, 0.3882353, 1, 1,
0.2976591, -0.09554414, 1.116513, 0, 0.3803922, 1, 1,
0.3064117, 1.307678, 0.4096082, 0, 0.3764706, 1, 1,
0.3107987, 1.316598, 0.8795519, 0, 0.3686275, 1, 1,
0.3110497, -0.1230871, 1.30949, 0, 0.3647059, 1, 1,
0.311767, -0.2042159, 1.089621, 0, 0.3568628, 1, 1,
0.314602, -0.8306841, 1.651792, 0, 0.3529412, 1, 1,
0.3148236, -0.06452533, 2.983758, 0, 0.345098, 1, 1,
0.317908, 0.1039357, 2.353955, 0, 0.3411765, 1, 1,
0.3193431, -0.6438007, 2.631523, 0, 0.3333333, 1, 1,
0.3196641, -0.03228077, 2.453909, 0, 0.3294118, 1, 1,
0.3203541, 2.103952, -0.106065, 0, 0.3215686, 1, 1,
0.3226329, 0.8168773, 1.363787, 0, 0.3176471, 1, 1,
0.3232011, 0.294387, 1.060282, 0, 0.3098039, 1, 1,
0.3243576, 0.2201389, 0.2765324, 0, 0.3058824, 1, 1,
0.3289337, -0.02998101, 0.5626571, 0, 0.2980392, 1, 1,
0.3320133, -0.394146, 2.35409, 0, 0.2901961, 1, 1,
0.3336667, 0.7086312, 0.442186, 0, 0.2862745, 1, 1,
0.334815, -0.6885687, 3.646953, 0, 0.2784314, 1, 1,
0.3389271, 1.255449, 0.04315763, 0, 0.2745098, 1, 1,
0.3403365, 0.03418841, 2.250695, 0, 0.2666667, 1, 1,
0.3403626, 1.705163, -0.9764328, 0, 0.2627451, 1, 1,
0.3429598, 0.5040364, 0.4417319, 0, 0.254902, 1, 1,
0.347476, -0.001393741, 2.818868, 0, 0.2509804, 1, 1,
0.3629496, -2.801939, 2.859158, 0, 0.2431373, 1, 1,
0.363687, -1.536959, 1.99308, 0, 0.2392157, 1, 1,
0.3652858, -1.511772, 2.01681, 0, 0.2313726, 1, 1,
0.3665882, 1.371454, 1.572862, 0, 0.227451, 1, 1,
0.3674346, -0.2130093, 1.802856, 0, 0.2196078, 1, 1,
0.3686095, 1.421297, 3.534459, 0, 0.2156863, 1, 1,
0.3691602, 0.8021573, 0.3473861, 0, 0.2078431, 1, 1,
0.3691996, 1.460094, 1.235244, 0, 0.2039216, 1, 1,
0.3706618, -0.307501, 1.735457, 0, 0.1960784, 1, 1,
0.3709204, -0.6244978, 2.927419, 0, 0.1882353, 1, 1,
0.3709531, -2.112458, 1.374595, 0, 0.1843137, 1, 1,
0.3716838, -0.6848657, 3.591683, 0, 0.1764706, 1, 1,
0.3725424, 1.012807, 1.768754, 0, 0.172549, 1, 1,
0.373619, 0.2116439, -0.02992645, 0, 0.1647059, 1, 1,
0.375502, -1.700361, 3.616775, 0, 0.1607843, 1, 1,
0.3765429, 0.01514273, 1.433647, 0, 0.1529412, 1, 1,
0.3818953, 1.730134, 1.759628, 0, 0.1490196, 1, 1,
0.3824565, 0.609506, 0.2187447, 0, 0.1411765, 1, 1,
0.3835283, -0.2655434, 2.38262, 0, 0.1372549, 1, 1,
0.3842631, 0.4765304, 0.4148518, 0, 0.1294118, 1, 1,
0.3860086, -1.326193, 1.614518, 0, 0.1254902, 1, 1,
0.3881169, 0.3573681, -1.204839, 0, 0.1176471, 1, 1,
0.3883185, 1.302175, 2.121217, 0, 0.1137255, 1, 1,
0.3950101, 0.2562187, 0.8657067, 0, 0.1058824, 1, 1,
0.3962022, 0.6940343, 1.787485, 0, 0.09803922, 1, 1,
0.4063078, 0.2180425, 2.276914, 0, 0.09411765, 1, 1,
0.4069153, -0.02429581, 2.916926, 0, 0.08627451, 1, 1,
0.4074086, 0.8549857, 0.09828467, 0, 0.08235294, 1, 1,
0.4095518, -0.8144981, 2.455351, 0, 0.07450981, 1, 1,
0.4112677, -0.5745811, 3.111136, 0, 0.07058824, 1, 1,
0.4132981, 1.021113, 0.06875559, 0, 0.0627451, 1, 1,
0.4145656, 1.016209, 0.4891253, 0, 0.05882353, 1, 1,
0.4182663, 0.5206323, 2.77956, 0, 0.05098039, 1, 1,
0.4224524, 1.05723, -0.6488219, 0, 0.04705882, 1, 1,
0.4338887, 0.1500849, 0.5186749, 0, 0.03921569, 1, 1,
0.434312, -0.07670769, -0.1131157, 0, 0.03529412, 1, 1,
0.4344051, -3.416099, 1.627401, 0, 0.02745098, 1, 1,
0.4358121, -0.6660267, 3.627266, 0, 0.02352941, 1, 1,
0.4408114, 0.5505409, 0.4580563, 0, 0.01568628, 1, 1,
0.4420818, -0.5470268, 1.898703, 0, 0.01176471, 1, 1,
0.4614549, -0.8108203, 4.306054, 0, 0.003921569, 1, 1,
0.461537, -0.1429674, 2.116646, 0.003921569, 0, 1, 1,
0.4622396, 0.7386765, 1.432433, 0.007843138, 0, 1, 1,
0.4657849, 0.4343997, 1.741186, 0.01568628, 0, 1, 1,
0.4662477, -0.8814505, 2.14466, 0.01960784, 0, 1, 1,
0.4699236, 1.168555, -0.009205544, 0.02745098, 0, 1, 1,
0.474584, -1.002933, 4.732197, 0.03137255, 0, 1, 1,
0.4769694, 1.261481, 0.8118497, 0.03921569, 0, 1, 1,
0.4806732, -1.271287, 4.07617, 0.04313726, 0, 1, 1,
0.4835257, -0.4712538, 3.354963, 0.05098039, 0, 1, 1,
0.4835688, 0.008335629, 2.578136, 0.05490196, 0, 1, 1,
0.4835741, 0.003005667, 2.787165, 0.0627451, 0, 1, 1,
0.4862047, -0.08000304, 0.754541, 0.06666667, 0, 1, 1,
0.4919268, -0.7787442, 3.015528, 0.07450981, 0, 1, 1,
0.499111, -0.852753, 3.011799, 0.07843138, 0, 1, 1,
0.5032921, -0.144803, 1.722578, 0.08627451, 0, 1, 1,
0.5120993, -0.3356388, 3.369588, 0.09019608, 0, 1, 1,
0.5127283, 0.6167718, 1.122064, 0.09803922, 0, 1, 1,
0.5128926, -0.5856839, 1.690678, 0.1058824, 0, 1, 1,
0.5152187, 0.5020654, 0.7685244, 0.1098039, 0, 1, 1,
0.5162187, -0.4614449, 2.236108, 0.1176471, 0, 1, 1,
0.5264055, -0.3283856, 1.503655, 0.1215686, 0, 1, 1,
0.5350531, 0.7872238, 0.5325965, 0.1294118, 0, 1, 1,
0.537092, 0.8058857, 0.1387445, 0.1333333, 0, 1, 1,
0.5373982, 0.03266875, 1.972446, 0.1411765, 0, 1, 1,
0.5419119, -0.2304783, 1.663218, 0.145098, 0, 1, 1,
0.5422415, -0.8842876, 2.4847, 0.1529412, 0, 1, 1,
0.5442692, 0.2898927, 0.8070576, 0.1568628, 0, 1, 1,
0.5459725, -0.4877866, 2.685352, 0.1647059, 0, 1, 1,
0.5463519, -1.004507, 1.362893, 0.1686275, 0, 1, 1,
0.5469791, -0.255064, 1.689623, 0.1764706, 0, 1, 1,
0.5519162, 0.3112557, 2.09551, 0.1803922, 0, 1, 1,
0.5521575, -2.564987, 3.730289, 0.1882353, 0, 1, 1,
0.5545791, 0.6564344, 1.968354, 0.1921569, 0, 1, 1,
0.5553995, -0.151142, 0.922614, 0.2, 0, 1, 1,
0.5564209, -0.9952919, 1.604763, 0.2078431, 0, 1, 1,
0.5628735, 1.983096, 0.5460548, 0.2117647, 0, 1, 1,
0.5679804, -0.1758974, 0.8283334, 0.2196078, 0, 1, 1,
0.5685489, -0.823774, 3.39161, 0.2235294, 0, 1, 1,
0.5748066, 0.3353234, 0.5167691, 0.2313726, 0, 1, 1,
0.5800902, -0.449099, 1.423946, 0.2352941, 0, 1, 1,
0.5876541, 1.139113, 1.290631, 0.2431373, 0, 1, 1,
0.591805, -1.322475, 3.956369, 0.2470588, 0, 1, 1,
0.5939035, 0.7249833, 1.982348, 0.254902, 0, 1, 1,
0.6012759, 1.483093, -0.1355769, 0.2588235, 0, 1, 1,
0.6047143, -1.844494, 1.766742, 0.2666667, 0, 1, 1,
0.6072214, -1.82592, 2.939259, 0.2705882, 0, 1, 1,
0.6137323, -1.358645, 0.6671427, 0.2784314, 0, 1, 1,
0.6151053, 0.7557308, 0.9891401, 0.282353, 0, 1, 1,
0.6188086, 0.5818686, 2.11435, 0.2901961, 0, 1, 1,
0.6225381, -0.4626727, 2.948931, 0.2941177, 0, 1, 1,
0.6232974, 0.06488064, 2.221241, 0.3019608, 0, 1, 1,
0.624912, -0.7807407, 2.94452, 0.3098039, 0, 1, 1,
0.628204, 0.8398439, -0.05585303, 0.3137255, 0, 1, 1,
0.6299453, -2.224798, 3.260223, 0.3215686, 0, 1, 1,
0.6308919, 0.9905354, 2.658992, 0.3254902, 0, 1, 1,
0.6358936, -0.6101876, 1.894323, 0.3333333, 0, 1, 1,
0.6396431, -1.082485, 1.68842, 0.3372549, 0, 1, 1,
0.6464648, -0.5672219, 2.565999, 0.345098, 0, 1, 1,
0.646673, 0.3383131, 2.114842, 0.3490196, 0, 1, 1,
0.6492393, -2.033943, 0.0888122, 0.3568628, 0, 1, 1,
0.6554953, -0.4917986, 3.105578, 0.3607843, 0, 1, 1,
0.6574454, 0.9112146, -1.973216, 0.3686275, 0, 1, 1,
0.6575737, 1.299824, 2.777284, 0.372549, 0, 1, 1,
0.6630213, 0.8077041, 0.639905, 0.3803922, 0, 1, 1,
0.6635584, -2.559112, 2.184272, 0.3843137, 0, 1, 1,
0.6637788, 0.5287752, -0.03470199, 0.3921569, 0, 1, 1,
0.6642953, 1.52899, -0.1090464, 0.3960784, 0, 1, 1,
0.6647952, 0.42735, 0.6140056, 0.4039216, 0, 1, 1,
0.6666407, -0.8593107, 3.095823, 0.4117647, 0, 1, 1,
0.669396, -0.2846304, 2.24899, 0.4156863, 0, 1, 1,
0.6743072, -1.425057, 1.330033, 0.4235294, 0, 1, 1,
0.674343, 1.951365, -0.2653705, 0.427451, 0, 1, 1,
0.6850281, -0.06371841, 0.9665326, 0.4352941, 0, 1, 1,
0.6852904, 1.738016, 1.371179, 0.4392157, 0, 1, 1,
0.6858903, 0.8532345, -1.335284, 0.4470588, 0, 1, 1,
0.6861839, 0.2231225, 0.8931515, 0.4509804, 0, 1, 1,
0.689332, 0.358314, 0.9497397, 0.4588235, 0, 1, 1,
0.6897397, -0.3459383, 2.030276, 0.4627451, 0, 1, 1,
0.6926252, 0.7264926, 1.277395, 0.4705882, 0, 1, 1,
0.6950304, 0.5192022, 0.8345196, 0.4745098, 0, 1, 1,
0.6980701, 0.9466837, 2.186079, 0.4823529, 0, 1, 1,
0.7014288, -0.9141902, 3.256876, 0.4862745, 0, 1, 1,
0.7056621, 0.003798647, 1.217193, 0.4941176, 0, 1, 1,
0.7086377, 0.6879119, 0.1112102, 0.5019608, 0, 1, 1,
0.7175549, 0.2785652, 0.3673273, 0.5058824, 0, 1, 1,
0.7190561, 0.4509585, 2.300018, 0.5137255, 0, 1, 1,
0.7235687, -0.2720123, 1.855418, 0.5176471, 0, 1, 1,
0.7241275, 1.388735, 0.03963558, 0.5254902, 0, 1, 1,
0.7249429, -2.149151, 4.363145, 0.5294118, 0, 1, 1,
0.7250362, -0.9833768, 0.6708988, 0.5372549, 0, 1, 1,
0.7285309, -0.4626276, 3.136948, 0.5411765, 0, 1, 1,
0.7317488, -0.5741485, 3.08126, 0.5490196, 0, 1, 1,
0.7335408, -0.2000857, 2.842247, 0.5529412, 0, 1, 1,
0.7360299, -1.705031, 3.748085, 0.5607843, 0, 1, 1,
0.7414625, 1.450436, 0.5872722, 0.5647059, 0, 1, 1,
0.7464265, -1.262585, 2.886348, 0.572549, 0, 1, 1,
0.746765, 1.653779, -0.1499245, 0.5764706, 0, 1, 1,
0.7469227, 0.9262474, -0.235884, 0.5843138, 0, 1, 1,
0.7489597, -0.9807183, 1.7585, 0.5882353, 0, 1, 1,
0.7502317, 1.542438, 2.623733, 0.5960785, 0, 1, 1,
0.7555264, 1.111818, 0.5540758, 0.6039216, 0, 1, 1,
0.7557746, 0.6001419, 1.76148, 0.6078432, 0, 1, 1,
0.7671288, -0.4550305, 2.799425, 0.6156863, 0, 1, 1,
0.7674526, 0.5576211, 1.532799, 0.6196079, 0, 1, 1,
0.7797377, -0.2173987, 3.657664, 0.627451, 0, 1, 1,
0.7827343, -0.4871108, 2.063574, 0.6313726, 0, 1, 1,
0.7828523, -0.664799, 2.840628, 0.6392157, 0, 1, 1,
0.7859029, -0.009642043, 1.712131, 0.6431373, 0, 1, 1,
0.7862675, 0.5904057, 0.9597764, 0.6509804, 0, 1, 1,
0.7930447, -1.297838, 3.911101, 0.654902, 0, 1, 1,
0.7949437, -1.817229, 1.530867, 0.6627451, 0, 1, 1,
0.7978246, -0.6002433, 2.189792, 0.6666667, 0, 1, 1,
0.8003477, 0.6288019, 0.5349237, 0.6745098, 0, 1, 1,
0.8049911, -0.8724377, 3.512257, 0.6784314, 0, 1, 1,
0.805465, 1.192949, 0.4822709, 0.6862745, 0, 1, 1,
0.8063458, -0.191088, 2.922, 0.6901961, 0, 1, 1,
0.8071612, 2.113559, 0.4370486, 0.6980392, 0, 1, 1,
0.8132728, -0.3753671, 0.09345984, 0.7058824, 0, 1, 1,
0.8135322, 0.8187704, 1.546618, 0.7098039, 0, 1, 1,
0.8144675, 0.6181971, -0.06983924, 0.7176471, 0, 1, 1,
0.8160298, -0.1349521, 0.9734812, 0.7215686, 0, 1, 1,
0.8174058, -0.2442091, 2.127702, 0.7294118, 0, 1, 1,
0.8229549, -0.3490049, 1.727053, 0.7333333, 0, 1, 1,
0.8237717, -0.08347957, 3.164455, 0.7411765, 0, 1, 1,
0.8266836, 1.054085, 1.144205, 0.7450981, 0, 1, 1,
0.8301144, -0.4464022, 1.221678, 0.7529412, 0, 1, 1,
0.8323233, -0.6994663, 1.277741, 0.7568628, 0, 1, 1,
0.8337737, -1.10598, 4.709867, 0.7647059, 0, 1, 1,
0.8355736, 0.4899926, -0.765107, 0.7686275, 0, 1, 1,
0.8376057, -0.07388716, 2.036575, 0.7764706, 0, 1, 1,
0.8387726, 1.700711, 0.3421474, 0.7803922, 0, 1, 1,
0.8390015, 1.280312, 0.1347072, 0.7882353, 0, 1, 1,
0.843543, -0.3664642, 1.192589, 0.7921569, 0, 1, 1,
0.8479124, 0.3375336, 0.6294202, 0.8, 0, 1, 1,
0.8541328, 0.8334457, -0.0202744, 0.8078431, 0, 1, 1,
0.8565508, -0.1648825, 2.218392, 0.8117647, 0, 1, 1,
0.8578641, 1.421668, 0.374942, 0.8196079, 0, 1, 1,
0.8608034, -2.294088, 2.925666, 0.8235294, 0, 1, 1,
0.861302, -0.3616787, 3.74954, 0.8313726, 0, 1, 1,
0.8615896, -1.035441, 1.912034, 0.8352941, 0, 1, 1,
0.8632026, 0.9259103, 2.363678, 0.8431373, 0, 1, 1,
0.8637685, 0.3139244, 0.8582653, 0.8470588, 0, 1, 1,
0.8660016, 0.6165651, 0.9217368, 0.854902, 0, 1, 1,
0.8707127, -1.203975, 2.929385, 0.8588235, 0, 1, 1,
0.8724056, 1.207039, 0.6667492, 0.8666667, 0, 1, 1,
0.8731987, -0.3164828, 2.489202, 0.8705882, 0, 1, 1,
0.8773143, -0.1328312, -0.4643924, 0.8784314, 0, 1, 1,
0.8798298, 0.6925805, 1.174257, 0.8823529, 0, 1, 1,
0.8824916, 2.831328, -0.1342557, 0.8901961, 0, 1, 1,
0.888049, -0.4260032, 1.397755, 0.8941177, 0, 1, 1,
0.8960982, -0.4441061, 2.468085, 0.9019608, 0, 1, 1,
0.8995905, -0.7835596, 3.107972, 0.9098039, 0, 1, 1,
0.9065548, -1.230522, 3.946205, 0.9137255, 0, 1, 1,
0.9091876, -1.284637, 2.73855, 0.9215686, 0, 1, 1,
0.9122831, 0.543905, 0.9223224, 0.9254902, 0, 1, 1,
0.9150256, 0.1705038, 0.7440069, 0.9333333, 0, 1, 1,
0.9198998, -1.790731, 0.801367, 0.9372549, 0, 1, 1,
0.9231527, 0.6802161, 0.2712333, 0.945098, 0, 1, 1,
0.9260994, 0.8578129, 0.9058599, 0.9490196, 0, 1, 1,
0.9328823, -0.9738027, 2.142472, 0.9568627, 0, 1, 1,
0.9344077, -0.290708, 1.807424, 0.9607843, 0, 1, 1,
0.935523, 0.1816562, 2.262463, 0.9686275, 0, 1, 1,
0.93748, -0.2607161, 1.917675, 0.972549, 0, 1, 1,
0.9390134, -1.016065, 1.317723, 0.9803922, 0, 1, 1,
0.9406714, 0.5456842, 0.02629091, 0.9843137, 0, 1, 1,
0.9462549, 0.0200717, 1.206088, 0.9921569, 0, 1, 1,
0.9495217, 0.541499, 1.308773, 0.9960784, 0, 1, 1,
0.9550332, 0.2739391, -0.04368723, 1, 0, 0.9960784, 1,
0.9557192, 0.3512593, 1.377919, 1, 0, 0.9882353, 1,
0.9561605, -0.3160292, 0.7170365, 1, 0, 0.9843137, 1,
0.9608219, -0.08824037, 0.8349672, 1, 0, 0.9764706, 1,
0.9648297, -0.299104, 1.425332, 1, 0, 0.972549, 1,
0.9652999, -0.1009203, 1.701119, 1, 0, 0.9647059, 1,
0.9778699, -0.4060661, 2.269413, 1, 0, 0.9607843, 1,
0.9808977, -0.4713528, 2.391636, 1, 0, 0.9529412, 1,
0.9819265, -0.2649264, 1.177229, 1, 0, 0.9490196, 1,
0.9885911, -1.091822, 1.026244, 1, 0, 0.9411765, 1,
0.9894964, 0.2671927, 0.6691334, 1, 0, 0.9372549, 1,
0.9946566, 0.686904, 0.4334925, 1, 0, 0.9294118, 1,
1.003342, 0.03544523, 2.803917, 1, 0, 0.9254902, 1,
1.010845, 2.186578, 0.9469156, 1, 0, 0.9176471, 1,
1.011877, 1.745388, 1.094597, 1, 0, 0.9137255, 1,
1.017658, -0.3584249, -0.03904449, 1, 0, 0.9058824, 1,
1.020398, 0.3967994, -0.9533708, 1, 0, 0.9019608, 1,
1.03065, -2.14778, 1.391715, 1, 0, 0.8941177, 1,
1.031121, -0.8808761, 2.018553, 1, 0, 0.8862745, 1,
1.031664, -0.2189978, 2.689946, 1, 0, 0.8823529, 1,
1.033438, 1.241513, 1.379581, 1, 0, 0.8745098, 1,
1.033777, -0.4202521, 5.696123, 1, 0, 0.8705882, 1,
1.047688, 1.019768, -0.4950166, 1, 0, 0.8627451, 1,
1.048379, -0.5575514, 1.164538, 1, 0, 0.8588235, 1,
1.048879, -2.234797, 1.725841, 1, 0, 0.8509804, 1,
1.051668, 1.023231, 0.4956545, 1, 0, 0.8470588, 1,
1.059298, -0.2973899, 2.388092, 1, 0, 0.8392157, 1,
1.059925, 0.06076309, 2.070371, 1, 0, 0.8352941, 1,
1.079267, -0.1322159, 2.097948, 1, 0, 0.827451, 1,
1.080658, -0.8373116, 1.578009, 1, 0, 0.8235294, 1,
1.084788, 0.3303389, 1.619055, 1, 0, 0.8156863, 1,
1.089495, -1.551155, 2.736151, 1, 0, 0.8117647, 1,
1.096891, -0.7310309, 3.631115, 1, 0, 0.8039216, 1,
1.100284, -0.629, 4.032292, 1, 0, 0.7960784, 1,
1.101719, -1.621578, 3.167733, 1, 0, 0.7921569, 1,
1.103302, -0.2529283, 1.63563, 1, 0, 0.7843137, 1,
1.103601, 1.21223, 1.852227, 1, 0, 0.7803922, 1,
1.105868, 0.199717, -1.173735, 1, 0, 0.772549, 1,
1.10708, -0.4575129, 2.648419, 1, 0, 0.7686275, 1,
1.116107, 1.158331, 1.275858, 1, 0, 0.7607843, 1,
1.119997, 1.085363, 3.599017, 1, 0, 0.7568628, 1,
1.121222, -1.02263, 1.787362, 1, 0, 0.7490196, 1,
1.125879, 0.1446323, -0.1322531, 1, 0, 0.7450981, 1,
1.134997, -1.391083, 3.167733, 1, 0, 0.7372549, 1,
1.137034, 1.475722, 0.7696671, 1, 0, 0.7333333, 1,
1.138477, -0.1758176, 2.79879, 1, 0, 0.7254902, 1,
1.151343, 0.2094761, 2.48492, 1, 0, 0.7215686, 1,
1.154636, -0.1066961, 2.383771, 1, 0, 0.7137255, 1,
1.161126, 0.6096832, 1.057165, 1, 0, 0.7098039, 1,
1.161943, -0.03250586, 2.426201, 1, 0, 0.7019608, 1,
1.164275, -1.101347, 3.141446, 1, 0, 0.6941177, 1,
1.177236, 0.4206985, 1.125598, 1, 0, 0.6901961, 1,
1.17863, -0.02855114, -0.2263405, 1, 0, 0.682353, 1,
1.181981, 0.2808413, 0.9463618, 1, 0, 0.6784314, 1,
1.185731, 1.110319, 0.9817659, 1, 0, 0.6705883, 1,
1.192918, 0.8962817, 1.118558, 1, 0, 0.6666667, 1,
1.196055, 1.013512, 0.3882965, 1, 0, 0.6588235, 1,
1.207525, -0.7069319, 3.265179, 1, 0, 0.654902, 1,
1.207729, -0.1147324, 2.423654, 1, 0, 0.6470588, 1,
1.214504, 1.507635, 0.8357279, 1, 0, 0.6431373, 1,
1.232715, -1.330923, 2.194394, 1, 0, 0.6352941, 1,
1.239854, 0.6569259, 1.907028, 1, 0, 0.6313726, 1,
1.254588, -0.3849049, 1.12953, 1, 0, 0.6235294, 1,
1.26237, 0.2172751, 2.086209, 1, 0, 0.6196079, 1,
1.270334, 0.6657834, 0.5154521, 1, 0, 0.6117647, 1,
1.279725, -1.356398, 1.550013, 1, 0, 0.6078432, 1,
1.282049, 0.216074, 2.619176, 1, 0, 0.6, 1,
1.285994, -0.9858004, 0.8140036, 1, 0, 0.5921569, 1,
1.289628, 0.7218628, 1.334548, 1, 0, 0.5882353, 1,
1.292329, 2.258032, -1.181855, 1, 0, 0.5803922, 1,
1.301089, -1.027898, 1.791958, 1, 0, 0.5764706, 1,
1.301386, -0.5288578, 2.344635, 1, 0, 0.5686275, 1,
1.308736, -1.930966, 2.616985, 1, 0, 0.5647059, 1,
1.318778, 0.6529637, 0.833981, 1, 0, 0.5568628, 1,
1.320115, 0.2743434, 1.050005, 1, 0, 0.5529412, 1,
1.321088, -0.4702777, 2.686931, 1, 0, 0.5450981, 1,
1.323841, 1.623173, 0.4644771, 1, 0, 0.5411765, 1,
1.326199, -0.271211, 0.4465213, 1, 0, 0.5333334, 1,
1.326201, -0.6893987, 0.339803, 1, 0, 0.5294118, 1,
1.32743, 0.1197459, 0.5275543, 1, 0, 0.5215687, 1,
1.328182, 0.6657742, -1.011599, 1, 0, 0.5176471, 1,
1.332227, -1.900647, 1.915347, 1, 0, 0.509804, 1,
1.335156, -0.05235621, 0.9638306, 1, 0, 0.5058824, 1,
1.338515, -0.3889997, 1.702229, 1, 0, 0.4980392, 1,
1.343462, -0.8139521, 1.173328, 1, 0, 0.4901961, 1,
1.350988, -0.1340061, 2.1787, 1, 0, 0.4862745, 1,
1.356568, -0.02350961, 2.18384, 1, 0, 0.4784314, 1,
1.365366, 0.1311002, 1.678142, 1, 0, 0.4745098, 1,
1.365694, 2.037154, 1.362187, 1, 0, 0.4666667, 1,
1.373093, 1.772211, -1.853485, 1, 0, 0.4627451, 1,
1.387095, -0.5483229, 1.894727, 1, 0, 0.454902, 1,
1.396631, 1.094117, -0.2399801, 1, 0, 0.4509804, 1,
1.406978, 1.359635, 1.232682, 1, 0, 0.4431373, 1,
1.416882, 0.2425229, 0.8068296, 1, 0, 0.4392157, 1,
1.428614, 1.605028, 0.8501244, 1, 0, 0.4313726, 1,
1.429013, 0.151399, 0.4783699, 1, 0, 0.427451, 1,
1.432886, -0.3971488, 0.3770828, 1, 0, 0.4196078, 1,
1.438463, -1.138841, 3.909963, 1, 0, 0.4156863, 1,
1.443992, 0.2868961, 0.6220807, 1, 0, 0.4078431, 1,
1.460955, 0.2177174, 1.317942, 1, 0, 0.4039216, 1,
1.48017, 0.4377814, 1.448006, 1, 0, 0.3960784, 1,
1.482695, 0.8696164, 0.01946722, 1, 0, 0.3882353, 1,
1.487235, -1.746354, 3.289843, 1, 0, 0.3843137, 1,
1.491831, 0.9419274, 0.6193151, 1, 0, 0.3764706, 1,
1.494261, 0.3695276, -0.574981, 1, 0, 0.372549, 1,
1.501816, -1.424604, 1.223839, 1, 0, 0.3647059, 1,
1.506734, -0.7699108, 0.410376, 1, 0, 0.3607843, 1,
1.517009, -0.270944, 1.291476, 1, 0, 0.3529412, 1,
1.520482, 0.3384016, 1.109647, 1, 0, 0.3490196, 1,
1.561487, -0.07178342, 1.705537, 1, 0, 0.3411765, 1,
1.576194, 1.478863, -0.1635484, 1, 0, 0.3372549, 1,
1.577668, -2.09095, 1.58346, 1, 0, 0.3294118, 1,
1.580329, -0.5515585, 2.449394, 1, 0, 0.3254902, 1,
1.589785, 1.373105, 1.824355, 1, 0, 0.3176471, 1,
1.589978, -0.9462, 1.699832, 1, 0, 0.3137255, 1,
1.592603, -1.196963, 3.0137, 1, 0, 0.3058824, 1,
1.594912, 0.03585184, 3.236227, 1, 0, 0.2980392, 1,
1.617824, -0.5461395, 2.16415, 1, 0, 0.2941177, 1,
1.619797, -0.1126672, 1.427734, 1, 0, 0.2862745, 1,
1.641843, -0.07220826, 2.498875, 1, 0, 0.282353, 1,
1.644757, -0.6685052, 1.773653, 1, 0, 0.2745098, 1,
1.705942, -1.023967, 3.777945, 1, 0, 0.2705882, 1,
1.716985, -1.911662, 1.694851, 1, 0, 0.2627451, 1,
1.718212, -0.07676917, 1.111836, 1, 0, 0.2588235, 1,
1.759903, 1.098617, -1.17948, 1, 0, 0.2509804, 1,
1.770764, -0.3005153, 1.247346, 1, 0, 0.2470588, 1,
1.781159, 0.1165749, 0.7521142, 1, 0, 0.2392157, 1,
1.786073, 1.091311, 1.387136, 1, 0, 0.2352941, 1,
1.80801, -0.4738571, 0.931906, 1, 0, 0.227451, 1,
1.823207, 1.966458, 0.2567506, 1, 0, 0.2235294, 1,
1.86524, 0.6524073, 2.253022, 1, 0, 0.2156863, 1,
1.884371, 0.3148003, 0.3329147, 1, 0, 0.2117647, 1,
1.910498, -1.285872, 2.254853, 1, 0, 0.2039216, 1,
1.91142, 0.7859268, 3.107762, 1, 0, 0.1960784, 1,
1.92324, -1.254137, 1.748079, 1, 0, 0.1921569, 1,
1.932173, -0.5771051, 1.670679, 1, 0, 0.1843137, 1,
1.983433, 0.1028558, 0.9874422, 1, 0, 0.1803922, 1,
2.012897, 0.08771933, 0.9831535, 1, 0, 0.172549, 1,
2.019244, -1.211754, 2.437328, 1, 0, 0.1686275, 1,
2.031796, -0.2501527, 0.9950922, 1, 0, 0.1607843, 1,
2.058023, -1.335824, 2.621924, 1, 0, 0.1568628, 1,
2.059434, -1.568185, 1.891073, 1, 0, 0.1490196, 1,
2.098495, -0.1823298, 3.209203, 1, 0, 0.145098, 1,
2.102134, -0.8000732, 2.052104, 1, 0, 0.1372549, 1,
2.125758, -0.8207694, 2.778556, 1, 0, 0.1333333, 1,
2.15296, -0.3409748, 1.926778, 1, 0, 0.1254902, 1,
2.169325, 0.1238533, 1.484359, 1, 0, 0.1215686, 1,
2.189555, 0.6810071, 0.1805376, 1, 0, 0.1137255, 1,
2.203839, -0.8651081, 0.7617281, 1, 0, 0.1098039, 1,
2.29034, 0.4641848, 1.664178, 1, 0, 0.1019608, 1,
2.350785, -0.6774694, 1.892799, 1, 0, 0.09411765, 1,
2.368348, -0.2539747, 2.890298, 1, 0, 0.09019608, 1,
2.390592, 0.3930135, 1.264551, 1, 0, 0.08235294, 1,
2.473583, 0.4190485, 2.301975, 1, 0, 0.07843138, 1,
2.495111, 0.6500518, -0.9581307, 1, 0, 0.07058824, 1,
2.542073, 0.9183965, 1.654079, 1, 0, 0.06666667, 1,
2.676666, -0.1918296, -0.2034294, 1, 0, 0.05882353, 1,
2.696872, 1.032203, 0.436088, 1, 0, 0.05490196, 1,
2.791753, 0.8491701, 1.387201, 1, 0, 0.04705882, 1,
2.792984, 0.5962572, 0.8185079, 1, 0, 0.04313726, 1,
2.940793, -1.726209, 2.470467, 1, 0, 0.03529412, 1,
2.949495, 0.6641397, 0.1036884, 1, 0, 0.03137255, 1,
3.016065, -0.1671001, -0.9232741, 1, 0, 0.02352941, 1,
3.0933, 0.0594702, 0.5284095, 1, 0, 0.01960784, 1,
3.222739, -0.4060315, 2.261741, 1, 0, 0.01176471, 1,
3.415819, -2.119647, 1.422214, 1, 0, 0.007843138, 1
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
0.1572617, -4.552419, -6.885287, 0, -0.5, 0.5, 0.5,
0.1572617, -4.552419, -6.885287, 1, -0.5, 0.5, 0.5,
0.1572617, -4.552419, -6.885287, 1, 1.5, 0.5, 0.5,
0.1572617, -4.552419, -6.885287, 0, 1.5, 0.5, 0.5
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
-4.205946, -0.06412196, -6.885287, 0, -0.5, 0.5, 0.5,
-4.205946, -0.06412196, -6.885287, 1, -0.5, 0.5, 0.5,
-4.205946, -0.06412196, -6.885287, 1, 1.5, 0.5, 0.5,
-4.205946, -0.06412196, -6.885287, 0, 1.5, 0.5, 0.5
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
-4.205946, -4.552419, 0.3171532, 0, -0.5, 0.5, 0.5,
-4.205946, -4.552419, 0.3171532, 1, -0.5, 0.5, 0.5,
-4.205946, -4.552419, 0.3171532, 1, 1.5, 0.5, 0.5,
-4.205946, -4.552419, 0.3171532, 0, 1.5, 0.5, 0.5
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
-3, -3.516658, -5.223185,
3, -3.516658, -5.223185,
-3, -3.516658, -5.223185,
-3, -3.689285, -5.500202,
-2, -3.516658, -5.223185,
-2, -3.689285, -5.500202,
-1, -3.516658, -5.223185,
-1, -3.689285, -5.500202,
0, -3.516658, -5.223185,
0, -3.689285, -5.500202,
1, -3.516658, -5.223185,
1, -3.689285, -5.500202,
2, -3.516658, -5.223185,
2, -3.689285, -5.500202,
3, -3.516658, -5.223185,
3, -3.689285, -5.500202
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
-3, -4.034539, -6.054236, 0, -0.5, 0.5, 0.5,
-3, -4.034539, -6.054236, 1, -0.5, 0.5, 0.5,
-3, -4.034539, -6.054236, 1, 1.5, 0.5, 0.5,
-3, -4.034539, -6.054236, 0, 1.5, 0.5, 0.5,
-2, -4.034539, -6.054236, 0, -0.5, 0.5, 0.5,
-2, -4.034539, -6.054236, 1, -0.5, 0.5, 0.5,
-2, -4.034539, -6.054236, 1, 1.5, 0.5, 0.5,
-2, -4.034539, -6.054236, 0, 1.5, 0.5, 0.5,
-1, -4.034539, -6.054236, 0, -0.5, 0.5, 0.5,
-1, -4.034539, -6.054236, 1, -0.5, 0.5, 0.5,
-1, -4.034539, -6.054236, 1, 1.5, 0.5, 0.5,
-1, -4.034539, -6.054236, 0, 1.5, 0.5, 0.5,
0, -4.034539, -6.054236, 0, -0.5, 0.5, 0.5,
0, -4.034539, -6.054236, 1, -0.5, 0.5, 0.5,
0, -4.034539, -6.054236, 1, 1.5, 0.5, 0.5,
0, -4.034539, -6.054236, 0, 1.5, 0.5, 0.5,
1, -4.034539, -6.054236, 0, -0.5, 0.5, 0.5,
1, -4.034539, -6.054236, 1, -0.5, 0.5, 0.5,
1, -4.034539, -6.054236, 1, 1.5, 0.5, 0.5,
1, -4.034539, -6.054236, 0, 1.5, 0.5, 0.5,
2, -4.034539, -6.054236, 0, -0.5, 0.5, 0.5,
2, -4.034539, -6.054236, 1, -0.5, 0.5, 0.5,
2, -4.034539, -6.054236, 1, 1.5, 0.5, 0.5,
2, -4.034539, -6.054236, 0, 1.5, 0.5, 0.5,
3, -4.034539, -6.054236, 0, -0.5, 0.5, 0.5,
3, -4.034539, -6.054236, 1, -0.5, 0.5, 0.5,
3, -4.034539, -6.054236, 1, 1.5, 0.5, 0.5,
3, -4.034539, -6.054236, 0, 1.5, 0.5, 0.5
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
-3.199052, -3, -5.223185,
-3.199052, 3, -5.223185,
-3.199052, -3, -5.223185,
-3.366868, -3, -5.500202,
-3.199052, -2, -5.223185,
-3.366868, -2, -5.500202,
-3.199052, -1, -5.223185,
-3.366868, -1, -5.500202,
-3.199052, 0, -5.223185,
-3.366868, 0, -5.500202,
-3.199052, 1, -5.223185,
-3.366868, 1, -5.500202,
-3.199052, 2, -5.223185,
-3.366868, 2, -5.500202,
-3.199052, 3, -5.223185,
-3.366868, 3, -5.500202
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
-3.7025, -3, -6.054236, 0, -0.5, 0.5, 0.5,
-3.7025, -3, -6.054236, 1, -0.5, 0.5, 0.5,
-3.7025, -3, -6.054236, 1, 1.5, 0.5, 0.5,
-3.7025, -3, -6.054236, 0, 1.5, 0.5, 0.5,
-3.7025, -2, -6.054236, 0, -0.5, 0.5, 0.5,
-3.7025, -2, -6.054236, 1, -0.5, 0.5, 0.5,
-3.7025, -2, -6.054236, 1, 1.5, 0.5, 0.5,
-3.7025, -2, -6.054236, 0, 1.5, 0.5, 0.5,
-3.7025, -1, -6.054236, 0, -0.5, 0.5, 0.5,
-3.7025, -1, -6.054236, 1, -0.5, 0.5, 0.5,
-3.7025, -1, -6.054236, 1, 1.5, 0.5, 0.5,
-3.7025, -1, -6.054236, 0, 1.5, 0.5, 0.5,
-3.7025, 0, -6.054236, 0, -0.5, 0.5, 0.5,
-3.7025, 0, -6.054236, 1, -0.5, 0.5, 0.5,
-3.7025, 0, -6.054236, 1, 1.5, 0.5, 0.5,
-3.7025, 0, -6.054236, 0, 1.5, 0.5, 0.5,
-3.7025, 1, -6.054236, 0, -0.5, 0.5, 0.5,
-3.7025, 1, -6.054236, 1, -0.5, 0.5, 0.5,
-3.7025, 1, -6.054236, 1, 1.5, 0.5, 0.5,
-3.7025, 1, -6.054236, 0, 1.5, 0.5, 0.5,
-3.7025, 2, -6.054236, 0, -0.5, 0.5, 0.5,
-3.7025, 2, -6.054236, 1, -0.5, 0.5, 0.5,
-3.7025, 2, -6.054236, 1, 1.5, 0.5, 0.5,
-3.7025, 2, -6.054236, 0, 1.5, 0.5, 0.5,
-3.7025, 3, -6.054236, 0, -0.5, 0.5, 0.5,
-3.7025, 3, -6.054236, 1, -0.5, 0.5, 0.5,
-3.7025, 3, -6.054236, 1, 1.5, 0.5, 0.5,
-3.7025, 3, -6.054236, 0, 1.5, 0.5, 0.5
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
-3.199052, -3.516658, -4,
-3.199052, -3.516658, 4,
-3.199052, -3.516658, -4,
-3.366868, -3.689285, -4,
-3.199052, -3.516658, -2,
-3.366868, -3.689285, -2,
-3.199052, -3.516658, 0,
-3.366868, -3.689285, 0,
-3.199052, -3.516658, 2,
-3.366868, -3.689285, 2,
-3.199052, -3.516658, 4,
-3.366868, -3.689285, 4
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
-3.7025, -4.034539, -4, 0, -0.5, 0.5, 0.5,
-3.7025, -4.034539, -4, 1, -0.5, 0.5, 0.5,
-3.7025, -4.034539, -4, 1, 1.5, 0.5, 0.5,
-3.7025, -4.034539, -4, 0, 1.5, 0.5, 0.5,
-3.7025, -4.034539, -2, 0, -0.5, 0.5, 0.5,
-3.7025, -4.034539, -2, 1, -0.5, 0.5, 0.5,
-3.7025, -4.034539, -2, 1, 1.5, 0.5, 0.5,
-3.7025, -4.034539, -2, 0, 1.5, 0.5, 0.5,
-3.7025, -4.034539, 0, 0, -0.5, 0.5, 0.5,
-3.7025, -4.034539, 0, 1, -0.5, 0.5, 0.5,
-3.7025, -4.034539, 0, 1, 1.5, 0.5, 0.5,
-3.7025, -4.034539, 0, 0, 1.5, 0.5, 0.5,
-3.7025, -4.034539, 2, 0, -0.5, 0.5, 0.5,
-3.7025, -4.034539, 2, 1, -0.5, 0.5, 0.5,
-3.7025, -4.034539, 2, 1, 1.5, 0.5, 0.5,
-3.7025, -4.034539, 2, 0, 1.5, 0.5, 0.5,
-3.7025, -4.034539, 4, 0, -0.5, 0.5, 0.5,
-3.7025, -4.034539, 4, 1, -0.5, 0.5, 0.5,
-3.7025, -4.034539, 4, 1, 1.5, 0.5, 0.5,
-3.7025, -4.034539, 4, 0, 1.5, 0.5, 0.5
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
-3.199052, -3.516658, -5.223185,
-3.199052, 3.388414, -5.223185,
-3.199052, -3.516658, 5.857491,
-3.199052, 3.388414, 5.857491,
-3.199052, -3.516658, -5.223185,
-3.199052, -3.516658, 5.857491,
-3.199052, 3.388414, -5.223185,
-3.199052, 3.388414, 5.857491,
-3.199052, -3.516658, -5.223185,
3.513576, -3.516658, -5.223185,
-3.199052, -3.516658, 5.857491,
3.513576, -3.516658, 5.857491,
-3.199052, 3.388414, -5.223185,
3.513576, 3.388414, -5.223185,
-3.199052, 3.388414, 5.857491,
3.513576, 3.388414, 5.857491,
3.513576, -3.516658, -5.223185,
3.513576, 3.388414, -5.223185,
3.513576, -3.516658, 5.857491,
3.513576, 3.388414, 5.857491,
3.513576, -3.516658, -5.223185,
3.513576, -3.516658, 5.857491,
3.513576, 3.388414, -5.223185,
3.513576, 3.388414, 5.857491
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
var radius = 7.83917;
var distance = 34.87735;
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
mvMatrix.translate( -0.1572617, 0.06412196, -0.3171532 );
mvMatrix.scale( 1.262674, 1.227484, 0.7649229 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.87735);
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
Ossian<-read.table("Ossian.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ossian$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
```

```r
y<-Ossian$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
```

```r
z<-Ossian$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
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
-3.101296, -0.9463413, -2.452564, 0, 0, 1, 1, 1,
-2.917471, -0.5348265, -1.298587, 1, 0, 0, 1, 1,
-2.722324, 1.370542, -0.866982, 1, 0, 0, 1, 1,
-2.600339, -1.361039, -1.268588, 1, 0, 0, 1, 1,
-2.542888, -1.04679, -1.660023, 1, 0, 0, 1, 1,
-2.496015, 0.1697076, -2.721943, 1, 0, 0, 1, 1,
-2.385654, -1.924565, -2.310097, 0, 0, 0, 1, 1,
-2.354732, -0.2552137, -3.345136, 0, 0, 0, 1, 1,
-2.271068, -0.1243494, -1.857018, 0, 0, 0, 1, 1,
-2.215753, -0.2034024, -1.189182, 0, 0, 0, 1, 1,
-2.200392, 0.04835801, 0.2667157, 0, 0, 0, 1, 1,
-2.184392, 0.2621047, -1.810151, 0, 0, 0, 1, 1,
-2.153746, 0.7853978, -1.989876, 0, 0, 0, 1, 1,
-2.153449, 0.5688533, -2.335907, 1, 1, 1, 1, 1,
-2.148059, 0.07027432, -0.1102137, 1, 1, 1, 1, 1,
-2.110519, 1.254663, -1.446997, 1, 1, 1, 1, 1,
-2.109276, 0.5864423, -2.273294, 1, 1, 1, 1, 1,
-2.067457, 1.298095, 0.403558, 1, 1, 1, 1, 1,
-2.057899, 1.221453, -0.3932713, 1, 1, 1, 1, 1,
-2.043976, -0.2850158, -1.320146, 1, 1, 1, 1, 1,
-2.036639, 0.5824945, -1.663513, 1, 1, 1, 1, 1,
-2.030218, 2.125379, -0.5461158, 1, 1, 1, 1, 1,
-2.023165, 0.09694138, -0.9130338, 1, 1, 1, 1, 1,
-1.992036, -0.4736342, -1.263584, 1, 1, 1, 1, 1,
-1.973161, -1.193785, -1.296508, 1, 1, 1, 1, 1,
-1.968519, -0.1925568, -2.169133, 1, 1, 1, 1, 1,
-1.947491, 0.9914519, -0.3716232, 1, 1, 1, 1, 1,
-1.931995, -0.9014417, -1.781729, 1, 1, 1, 1, 1,
-1.916678, 1.5502, -1.038904, 0, 0, 1, 1, 1,
-1.91005, 1.694413, -0.2104312, 1, 0, 0, 1, 1,
-1.878248, -0.5469685, -3.251145, 1, 0, 0, 1, 1,
-1.828765, -0.06882909, -2.768027, 1, 0, 0, 1, 1,
-1.821769, -0.1192361, -1.40282, 1, 0, 0, 1, 1,
-1.793161, 1.363437, -1.103852, 1, 0, 0, 1, 1,
-1.768859, -0.3610097, -2.509962, 0, 0, 0, 1, 1,
-1.761841, 1.179836, -2.366702, 0, 0, 0, 1, 1,
-1.744496, 0.05440148, -1.369025, 0, 0, 0, 1, 1,
-1.740984, -0.5573978, -2.458084, 0, 0, 0, 1, 1,
-1.712367, -0.9109914, -3.697182, 0, 0, 0, 1, 1,
-1.698909, -1.066795, -3.344007, 0, 0, 0, 1, 1,
-1.684119, 1.807017, -0.08158685, 0, 0, 0, 1, 1,
-1.682372, 0.04251266, -3.010854, 1, 1, 1, 1, 1,
-1.638806, -0.8088161, -1.412321, 1, 1, 1, 1, 1,
-1.637889, -0.6062728, -1.857521, 1, 1, 1, 1, 1,
-1.625816, -0.5258964, -2.671484, 1, 1, 1, 1, 1,
-1.600417, 0.9174116, -2.302126, 1, 1, 1, 1, 1,
-1.588894, 0.1679519, -0.4424241, 1, 1, 1, 1, 1,
-1.568887, -1.431067, -2.667832, 1, 1, 1, 1, 1,
-1.550311, -0.8049006, -3.050873, 1, 1, 1, 1, 1,
-1.538465, -0.964927, -2.578505, 1, 1, 1, 1, 1,
-1.524719, 1.07641, 0.8771048, 1, 1, 1, 1, 1,
-1.501131, 0.5674731, -1.826816, 1, 1, 1, 1, 1,
-1.496976, -2.702079, -1.863325, 1, 1, 1, 1, 1,
-1.482625, -2.468996, -2.839586, 1, 1, 1, 1, 1,
-1.478557, -1.042957, -3.101251, 1, 1, 1, 1, 1,
-1.471975, -0.8835848, -1.118998, 1, 1, 1, 1, 1,
-1.461795, -0.3679143, -2.008749, 0, 0, 1, 1, 1,
-1.447927, -1.310712, -2.576931, 1, 0, 0, 1, 1,
-1.44589, 0.9385159, -0.550404, 1, 0, 0, 1, 1,
-1.444057, 0.1282341, -0.2585808, 1, 0, 0, 1, 1,
-1.436987, -0.189813, -1.077789, 1, 0, 0, 1, 1,
-1.431477, -0.03187278, -0.9956874, 1, 0, 0, 1, 1,
-1.424487, 1.099556, -1.590755, 0, 0, 0, 1, 1,
-1.422758, -0.0212739, -1.725116, 0, 0, 0, 1, 1,
-1.415863, 0.2616466, -2.062184, 0, 0, 0, 1, 1,
-1.4112, 0.884975, 0.0205044, 0, 0, 0, 1, 1,
-1.395637, -1.426814, -3.920646, 0, 0, 0, 1, 1,
-1.392826, -0.6499789, -2.171003, 0, 0, 0, 1, 1,
-1.392125, -1.55048, -2.874437, 0, 0, 0, 1, 1,
-1.390795, -0.6540812, -1.520405, 1, 1, 1, 1, 1,
-1.387337, 0.5838754, -2.563303, 1, 1, 1, 1, 1,
-1.384399, -0.3425468, -1.879211, 1, 1, 1, 1, 1,
-1.37358, 0.3000389, -0.9649856, 1, 1, 1, 1, 1,
-1.366748, -0.27915, 0.032604, 1, 1, 1, 1, 1,
-1.364019, 0.3230935, -0.855926, 1, 1, 1, 1, 1,
-1.363913, -0.2709321, -1.750181, 1, 1, 1, 1, 1,
-1.360185, -0.3372773, 0.2678376, 1, 1, 1, 1, 1,
-1.359052, -1.428895, -1.046058, 1, 1, 1, 1, 1,
-1.35296, -0.8687358, -2.372411, 1, 1, 1, 1, 1,
-1.346905, -0.8140584, -3.896044, 1, 1, 1, 1, 1,
-1.346575, 0.1810254, -2.750163, 1, 1, 1, 1, 1,
-1.342503, 2.866773, -1.463027, 1, 1, 1, 1, 1,
-1.341859, -0.9609317, -0.6687153, 1, 1, 1, 1, 1,
-1.332806, -0.2430983, -1.287625, 1, 1, 1, 1, 1,
-1.322808, 1.284574, -1.802506, 0, 0, 1, 1, 1,
-1.313056, 0.8474582, -0.9109191, 1, 0, 0, 1, 1,
-1.310475, -0.1613278, -3.796969, 1, 0, 0, 1, 1,
-1.293805, 0.9540554, -1.827876, 1, 0, 0, 1, 1,
-1.290959, -0.1257484, -2.82628, 1, 0, 0, 1, 1,
-1.281184, -0.02500795, -3.397001, 1, 0, 0, 1, 1,
-1.272698, -0.7898114, -1.197302, 0, 0, 0, 1, 1,
-1.267622, 0.8397408, 0.05595104, 0, 0, 0, 1, 1,
-1.255361, 1.715341, -1.038032, 0, 0, 0, 1, 1,
-1.254425, 0.6936307, -2.488352, 0, 0, 0, 1, 1,
-1.246633, 0.06194028, -1.799263, 0, 0, 0, 1, 1,
-1.243304, 3.066816, -0.1472005, 0, 0, 0, 1, 1,
-1.240229, -0.01216786, -1.57455, 0, 0, 0, 1, 1,
-1.232492, 1.086051, -1.286178, 1, 1, 1, 1, 1,
-1.232411, -0.5694641, -3.17164, 1, 1, 1, 1, 1,
-1.220731, -0.7831463, -2.755029, 1, 1, 1, 1, 1,
-1.220219, -0.7889074, -2.707615, 1, 1, 1, 1, 1,
-1.214122, -0.2546187, -2.017179, 1, 1, 1, 1, 1,
-1.211877, 3.287855, -0.8873845, 1, 1, 1, 1, 1,
-1.181692, 1.679515, -2.108754, 1, 1, 1, 1, 1,
-1.167377, -0.9425456, -2.423192, 1, 1, 1, 1, 1,
-1.156027, 0.2836276, -1.988683, 1, 1, 1, 1, 1,
-1.149994, 2.008965, -1.271517, 1, 1, 1, 1, 1,
-1.147593, -0.4705767, -2.022835, 1, 1, 1, 1, 1,
-1.146, 1.959414, -0.3974301, 1, 1, 1, 1, 1,
-1.143991, 1.61367, -0.09710594, 1, 1, 1, 1, 1,
-1.139274, 0.6007165, -2.208761, 1, 1, 1, 1, 1,
-1.137642, 0.5137603, -2.325372, 1, 1, 1, 1, 1,
-1.137584, 0.57434, -1.186706, 0, 0, 1, 1, 1,
-1.133315, 0.5072558, -0.5088245, 1, 0, 0, 1, 1,
-1.132267, -0.04424126, 0.125854, 1, 0, 0, 1, 1,
-1.132241, 0.5565609, -0.5332688, 1, 0, 0, 1, 1,
-1.124286, 1.119302, -0.9962977, 1, 0, 0, 1, 1,
-1.115394, 0.3235557, -1.750138, 1, 0, 0, 1, 1,
-1.106926, -0.3587546, -3.115409, 0, 0, 0, 1, 1,
-1.098292, 0.40351, -1.962725, 0, 0, 0, 1, 1,
-1.09473, 0.5262871, -0.2749849, 0, 0, 0, 1, 1,
-1.093256, -0.1476993, -1.831168, 0, 0, 0, 1, 1,
-1.092998, -1.97921, -3.00962, 0, 0, 0, 1, 1,
-1.092875, 0.4727413, -1.428745, 0, 0, 0, 1, 1,
-1.088212, 0.4030167, -1.832575, 0, 0, 0, 1, 1,
-1.083502, -0.9549837, -3.05609, 1, 1, 1, 1, 1,
-1.074633, 1.954921, -1.444297, 1, 1, 1, 1, 1,
-1.073285, 0.6897501, -2.74532, 1, 1, 1, 1, 1,
-1.071202, -1.464334, -3.610978, 1, 1, 1, 1, 1,
-1.0671, 0.4880954, -0.3489701, 1, 1, 1, 1, 1,
-1.063792, -0.0247674, -0.1137958, 1, 1, 1, 1, 1,
-1.060584, 0.8905352, -1.096342, 1, 1, 1, 1, 1,
-1.050733, -0.8403779, -1.56967, 1, 1, 1, 1, 1,
-1.048463, 0.7162905, -1.799795, 1, 1, 1, 1, 1,
-1.035597, -0.2150032, -1.548402, 1, 1, 1, 1, 1,
-1.033476, 1.521081, 0.3134088, 1, 1, 1, 1, 1,
-1.028757, -0.09543916, -2.3036, 1, 1, 1, 1, 1,
-1.026805, 1.119786, -0.7145175, 1, 1, 1, 1, 1,
-1.004002, -1.139424, -1.768385, 1, 1, 1, 1, 1,
-0.9924655, -1.749081, -1.14094, 1, 1, 1, 1, 1,
-0.9900925, 1.421453, 0.05238949, 0, 0, 1, 1, 1,
-0.9856359, 0.7783089, -1.250465, 1, 0, 0, 1, 1,
-0.9701602, 0.34208, 1.020488, 1, 0, 0, 1, 1,
-0.9679079, 2.097872, 0.6908712, 1, 0, 0, 1, 1,
-0.9648649, -0.1575713, -0.4101367, 1, 0, 0, 1, 1,
-0.9630854, 0.7822137, -2.007163, 1, 0, 0, 1, 1,
-0.9623303, 0.108357, -0.3450902, 0, 0, 0, 1, 1,
-0.9587808, 1.900448, -0.590981, 0, 0, 0, 1, 1,
-0.9526614, 0.8738536, -0.7874107, 0, 0, 0, 1, 1,
-0.9513863, -0.4204794, -2.20073, 0, 0, 0, 1, 1,
-0.950116, -0.8993831, -2.190251, 0, 0, 0, 1, 1,
-0.9481688, -0.4814664, -1.205205, 0, 0, 0, 1, 1,
-0.9449467, -0.3790047, -2.231525, 0, 0, 0, 1, 1,
-0.9382545, 0.1574911, 0.4644492, 1, 1, 1, 1, 1,
-0.9380338, 0.1583675, -1.69375, 1, 1, 1, 1, 1,
-0.9354905, -1.007511, -3.657167, 1, 1, 1, 1, 1,
-0.92897, 0.2358124, -0.0329152, 1, 1, 1, 1, 1,
-0.9282374, -1.237139, -4.263644, 1, 1, 1, 1, 1,
-0.9273369, -0.1683625, -1.403973, 1, 1, 1, 1, 1,
-0.9232227, -1.403752, -4.199216, 1, 1, 1, 1, 1,
-0.9225886, -1.642878, -3.853929, 1, 1, 1, 1, 1,
-0.9190747, -0.4748658, -1.492495, 1, 1, 1, 1, 1,
-0.9162793, -0.1027975, -1.599422, 1, 1, 1, 1, 1,
-0.9102657, 2.614242, 0.05291405, 1, 1, 1, 1, 1,
-0.9069515, 0.9762616, -0.08899472, 1, 1, 1, 1, 1,
-0.9050019, -0.4912558, -1.154945, 1, 1, 1, 1, 1,
-0.9027998, -0.2466789, -0.84716, 1, 1, 1, 1, 1,
-0.8978868, -2.275508, -1.805452, 1, 1, 1, 1, 1,
-0.8929572, -0.5829007, -3.723239, 0, 0, 1, 1, 1,
-0.8926436, -2.233032, -2.795145, 1, 0, 0, 1, 1,
-0.8922563, 0.6180677, -1.404422, 1, 0, 0, 1, 1,
-0.8852843, 0.03512619, -0.6929759, 1, 0, 0, 1, 1,
-0.884737, -0.5218603, -2.928167, 1, 0, 0, 1, 1,
-0.8837298, -1.504374, -1.122178, 1, 0, 0, 1, 1,
-0.8830656, -0.0523863, -1.13274, 0, 0, 0, 1, 1,
-0.8781546, -0.4646957, -1.546988, 0, 0, 0, 1, 1,
-0.8741679, -0.442036, 1.168041, 0, 0, 0, 1, 1,
-0.8689275, -0.2572886, -1.490071, 0, 0, 0, 1, 1,
-0.8558735, -0.5990204, -2.113081, 0, 0, 0, 1, 1,
-0.8551303, -1.294631, -1.984996, 0, 0, 0, 1, 1,
-0.8545846, 0.9124486, 0.594557, 0, 0, 0, 1, 1,
-0.8537397, -0.03693079, -1.271112, 1, 1, 1, 1, 1,
-0.8462846, 0.8490692, -0.1754827, 1, 1, 1, 1, 1,
-0.8439657, -1.172607, -2.768533, 1, 1, 1, 1, 1,
-0.8385345, 0.3603562, -1.682477, 1, 1, 1, 1, 1,
-0.8371749, 0.3041309, 1.095857, 1, 1, 1, 1, 1,
-0.8369196, 0.3939145, -0.5294476, 1, 1, 1, 1, 1,
-0.8348528, -0.5360224, -1.816246, 1, 1, 1, 1, 1,
-0.8269949, 0.7961557, -0.8752298, 1, 1, 1, 1, 1,
-0.8181837, -0.415306, -1.326986, 1, 1, 1, 1, 1,
-0.8103394, -0.7288126, -2.879076, 1, 1, 1, 1, 1,
-0.8083517, -0.8536325, -2.260725, 1, 1, 1, 1, 1,
-0.8049975, 0.1546165, -1.230314, 1, 1, 1, 1, 1,
-0.803468, 0.3917707, -0.6121545, 1, 1, 1, 1, 1,
-0.8026037, -1.869269, -1.173797, 1, 1, 1, 1, 1,
-0.7928691, -0.5499527, -1.041373, 1, 1, 1, 1, 1,
-0.7859694, 1.462586, -1.587873, 0, 0, 1, 1, 1,
-0.7818738, -0.2045062, -1.427754, 1, 0, 0, 1, 1,
-0.7781026, -1.88054, -1.892183, 1, 0, 0, 1, 1,
-0.7776182, -0.3755383, -1.913968, 1, 0, 0, 1, 1,
-0.7756963, -0.1161218, -2.241117, 1, 0, 0, 1, 1,
-0.7744731, 1.301172, -1.572018, 1, 0, 0, 1, 1,
-0.7744004, -1.003898, -2.421664, 0, 0, 0, 1, 1,
-0.773163, -0.02921396, -1.309344, 0, 0, 0, 1, 1,
-0.772873, 1.142788, -1.100338, 0, 0, 0, 1, 1,
-0.7716838, -0.07063425, -1.669464, 0, 0, 0, 1, 1,
-0.7716572, 0.3371778, -0.5054197, 0, 0, 0, 1, 1,
-0.7673883, -1.558825, -1.803827, 0, 0, 0, 1, 1,
-0.7637135, -0.1428658, -3.845398, 0, 0, 0, 1, 1,
-0.7572886, -0.9790515, -2.033587, 1, 1, 1, 1, 1,
-0.7548692, -0.4574147, -2.769429, 1, 1, 1, 1, 1,
-0.7524018, -1.233182, -3.38077, 1, 1, 1, 1, 1,
-0.743364, -0.2284421, -2.434364, 1, 1, 1, 1, 1,
-0.7419639, 1.892848, 0.1102916, 1, 1, 1, 1, 1,
-0.7379054, 1.598135, 1.143799, 1, 1, 1, 1, 1,
-0.7350301, 0.1796654, -0.8363597, 1, 1, 1, 1, 1,
-0.7317836, -0.02485264, -3.389404, 1, 1, 1, 1, 1,
-0.7307232, 1.105103, -0.06542244, 1, 1, 1, 1, 1,
-0.724085, -1.711713, -3.222883, 1, 1, 1, 1, 1,
-0.7227519, -0.3047384, -1.512332, 1, 1, 1, 1, 1,
-0.7226162, -0.2676754, -2.880385, 1, 1, 1, 1, 1,
-0.7221421, -1.211813, -3.927221, 1, 1, 1, 1, 1,
-0.7162681, -0.1161229, -2.068898, 1, 1, 1, 1, 1,
-0.7129943, -0.4789602, -1.49897, 1, 1, 1, 1, 1,
-0.70715, 0.1427218, 0.2381715, 0, 0, 1, 1, 1,
-0.7011829, -1.099505, -0.6798964, 1, 0, 0, 1, 1,
-0.6939973, 0.6892782, -1.198509, 1, 0, 0, 1, 1,
-0.6932164, 0.8987582, -1.623286, 1, 0, 0, 1, 1,
-0.6895078, 0.2388689, -0.8398582, 1, 0, 0, 1, 1,
-0.6879712, -0.5887487, -1.709252, 1, 0, 0, 1, 1,
-0.6873223, 0.6163662, -0.2207824, 0, 0, 0, 1, 1,
-0.6831759, -0.1852899, -2.882231, 0, 0, 0, 1, 1,
-0.6790802, -0.09089339, -3.073128, 0, 0, 0, 1, 1,
-0.678148, 0.7854351, -1.166555, 0, 0, 0, 1, 1,
-0.6745715, -1.410324, -2.316846, 0, 0, 0, 1, 1,
-0.674342, 0.5666241, -0.9516423, 0, 0, 0, 1, 1,
-0.67273, 0.7454015, -0.6298674, 0, 0, 0, 1, 1,
-0.6725694, 0.8475675, -0.2914216, 1, 1, 1, 1, 1,
-0.6716336, 0.03524811, -3.728822, 1, 1, 1, 1, 1,
-0.6702896, 0.02686547, -1.663215, 1, 1, 1, 1, 1,
-0.6676171, 0.9610612, -0.2266292, 1, 1, 1, 1, 1,
-0.6618503, 1.62948, -0.5482887, 1, 1, 1, 1, 1,
-0.6586702, 0.4688978, -1.11126, 1, 1, 1, 1, 1,
-0.6557265, 0.4094472, -1.432949, 1, 1, 1, 1, 1,
-0.6547034, 1.232253, -0.6675594, 1, 1, 1, 1, 1,
-0.6502538, -0.9316892, -3.22859, 1, 1, 1, 1, 1,
-0.6495283, 1.417077, -1.299776, 1, 1, 1, 1, 1,
-0.6427906, 1.084386, -2.778904, 1, 1, 1, 1, 1,
-0.6387415, 0.449691, 0.4071203, 1, 1, 1, 1, 1,
-0.6382223, 0.2136604, -1.263229, 1, 1, 1, 1, 1,
-0.6380454, 0.2953772, 0.01555712, 1, 1, 1, 1, 1,
-0.6349204, -0.8471319, -2.302057, 1, 1, 1, 1, 1,
-0.6336932, -1.201089, -2.330648, 0, 0, 1, 1, 1,
-0.6322432, -0.2101684, -1.875814, 1, 0, 0, 1, 1,
-0.6286418, -0.1743417, -1.873469, 1, 0, 0, 1, 1,
-0.6277537, -0.192383, -1.694635, 1, 0, 0, 1, 1,
-0.6266621, 0.7639338, -1.468966, 1, 0, 0, 1, 1,
-0.6259522, -0.3231166, -2.633846, 1, 0, 0, 1, 1,
-0.6256701, -0.6869023, -1.287226, 0, 0, 0, 1, 1,
-0.6255239, -0.04423547, -2.101456, 0, 0, 0, 1, 1,
-0.6254987, -0.6359766, -0.5270844, 0, 0, 0, 1, 1,
-0.6247643, -1.042064, -3.284434, 0, 0, 0, 1, 1,
-0.6230216, -0.06848969, -1.216947, 0, 0, 0, 1, 1,
-0.615424, 0.07464496, -0.7372837, 0, 0, 0, 1, 1,
-0.6069121, 0.2614092, -0.1050678, 0, 0, 0, 1, 1,
-0.6064469, 0.5357715, 0.25703, 1, 1, 1, 1, 1,
-0.6058506, 0.6728715, -0.4902046, 1, 1, 1, 1, 1,
-0.6001295, 0.5073712, -0.1770995, 1, 1, 1, 1, 1,
-0.5984652, 1.562195, -1.053463, 1, 1, 1, 1, 1,
-0.5953485, 0.3995026, -2.393641, 1, 1, 1, 1, 1,
-0.5923842, 1.627091, 0.6649486, 1, 1, 1, 1, 1,
-0.5871629, -0.429679, -3.941499, 1, 1, 1, 1, 1,
-0.5843251, -0.7586432, -1.853937, 1, 1, 1, 1, 1,
-0.581257, 0.8075823, 0.4180165, 1, 1, 1, 1, 1,
-0.5798439, 0.9933366, 0.6846563, 1, 1, 1, 1, 1,
-0.5783611, 0.05681373, -0.9236819, 1, 1, 1, 1, 1,
-0.5758087, -0.03841594, -1.581008, 1, 1, 1, 1, 1,
-0.5749325, -0.8296866, -3.024383, 1, 1, 1, 1, 1,
-0.5714423, 2.154784, -0.07249325, 1, 1, 1, 1, 1,
-0.5703958, 0.3956418, -1.047783, 1, 1, 1, 1, 1,
-0.5657846, -0.5075139, -2.599074, 0, 0, 1, 1, 1,
-0.5652462, -1.592496, -2.65584, 1, 0, 0, 1, 1,
-0.5649058, 0.3029457, -1.189751, 1, 0, 0, 1, 1,
-0.5636606, 0.04526176, -0.5531346, 1, 0, 0, 1, 1,
-0.5634516, -0.3984819, -2.579506, 1, 0, 0, 1, 1,
-0.5623792, 1.283597, -0.2042239, 1, 0, 0, 1, 1,
-0.5614215, -1.314314, -3.286807, 0, 0, 0, 1, 1,
-0.5586807, 2.169265, -0.005598811, 0, 0, 0, 1, 1,
-0.5539053, 0.1741906, -0.141813, 0, 0, 0, 1, 1,
-0.5451302, -1.560985, -1.353973, 0, 0, 0, 1, 1,
-0.5387966, 1.308941, -0.717962, 0, 0, 0, 1, 1,
-0.5373983, 0.2676447, -2.009245, 0, 0, 0, 1, 1,
-0.5332337, 0.6134046, -1.159147, 0, 0, 0, 1, 1,
-0.5320472, -0.299304, -1.512226, 1, 1, 1, 1, 1,
-0.5318484, 0.793829, -0.7981073, 1, 1, 1, 1, 1,
-0.5314136, -1.195076, -3.198059, 1, 1, 1, 1, 1,
-0.5311962, 1.012191, -0.4028767, 1, 1, 1, 1, 1,
-0.5250822, 0.07931545, -0.4092442, 1, 1, 1, 1, 1,
-0.5216823, -0.8404099, -2.657086, 1, 1, 1, 1, 1,
-0.5190161, -0.7164244, -3.257002, 1, 1, 1, 1, 1,
-0.5174019, -2.081759, -1.722757, 1, 1, 1, 1, 1,
-0.5116879, -2.011991, -2.349217, 1, 1, 1, 1, 1,
-0.506218, 0.4028788, -0.9014521, 1, 1, 1, 1, 1,
-0.5028521, 1.261696, -0.5807975, 1, 1, 1, 1, 1,
-0.5025238, 0.2330839, -0.7194777, 1, 1, 1, 1, 1,
-0.499651, -1.274736, -2.763583, 1, 1, 1, 1, 1,
-0.494773, -1.083281, -3.462706, 1, 1, 1, 1, 1,
-0.4947469, -0.09209143, -1.264465, 1, 1, 1, 1, 1,
-0.4883471, 0.1178911, -2.250758, 0, 0, 1, 1, 1,
-0.4877217, -2.540518, -1.714319, 1, 0, 0, 1, 1,
-0.4814613, -2.107755, -3.899446, 1, 0, 0, 1, 1,
-0.4798441, 2.423865, 0.9406348, 1, 0, 0, 1, 1,
-0.4777101, -0.2707244, -2.331976, 1, 0, 0, 1, 1,
-0.4759969, 0.1879949, -1.334113, 1, 0, 0, 1, 1,
-0.473788, -1.808225, -0.4946812, 0, 0, 0, 1, 1,
-0.4726457, -1.212443, -3.794904, 0, 0, 0, 1, 1,
-0.4711932, -2.313978, -2.15841, 0, 0, 0, 1, 1,
-0.463562, 0.7769918, 0.4126436, 0, 0, 0, 1, 1,
-0.4625657, 0.8318001, 0.3840659, 0, 0, 0, 1, 1,
-0.461987, -0.6266642, -3.02313, 0, 0, 0, 1, 1,
-0.4580457, 1.864461, -1.194567, 0, 0, 0, 1, 1,
-0.4571104, -2.235613, -2.869333, 1, 1, 1, 1, 1,
-0.4534523, -0.5227643, -1.916588, 1, 1, 1, 1, 1,
-0.4470551, -1.513399, -2.981906, 1, 1, 1, 1, 1,
-0.443839, 0.7378519, -0.763077, 1, 1, 1, 1, 1,
-0.4378262, -0.1256957, -0.3354132, 1, 1, 1, 1, 1,
-0.4376723, 2.422622, -0.1569046, 1, 1, 1, 1, 1,
-0.4340607, 0.5904137, -1.355507, 1, 1, 1, 1, 1,
-0.4338743, 0.6896412, 0.02401655, 1, 1, 1, 1, 1,
-0.4272032, -0.46632, -1.427973, 1, 1, 1, 1, 1,
-0.4266947, 0.242396, -1.754488, 1, 1, 1, 1, 1,
-0.4182747, 0.3603806, 0.689342, 1, 1, 1, 1, 1,
-0.4175136, 0.00690937, -0.9722827, 1, 1, 1, 1, 1,
-0.4156646, -0.8793153, -1.042324, 1, 1, 1, 1, 1,
-0.4153257, 1.323803, -0.7647422, 1, 1, 1, 1, 1,
-0.4147517, -0.7822015, -3.659075, 1, 1, 1, 1, 1,
-0.4146019, -0.9318427, -3.813234, 0, 0, 1, 1, 1,
-0.4128884, 0.6450198, -0.9019737, 1, 0, 0, 1, 1,
-0.4022158, 0.409306, -0.9202036, 1, 0, 0, 1, 1,
-0.4015656, -1.965936, -2.895001, 1, 0, 0, 1, 1,
-0.3954768, 1.288314, -0.610159, 1, 0, 0, 1, 1,
-0.3939752, -0.24796, -1.17049, 1, 0, 0, 1, 1,
-0.3901744, 0.3702096, -1.010772, 0, 0, 0, 1, 1,
-0.3873223, 0.3387811, -0.9299419, 0, 0, 0, 1, 1,
-0.3831016, -0.2551402, -3.00668, 0, 0, 0, 1, 1,
-0.3827292, 2.195963, 1.039182, 0, 0, 0, 1, 1,
-0.3824705, 0.199313, 0.08116261, 0, 0, 0, 1, 1,
-0.3727516, -0.2232889, -2.557628, 0, 0, 0, 1, 1,
-0.3653001, -1.387283, -2.512249, 0, 0, 0, 1, 1,
-0.3615678, 1.478746, -0.5747406, 1, 1, 1, 1, 1,
-0.3565015, -0.424882, -0.3522611, 1, 1, 1, 1, 1,
-0.3559565, -0.4011595, -3.42406, 1, 1, 1, 1, 1,
-0.3548841, -0.79693, -2.391926, 1, 1, 1, 1, 1,
-0.3515193, 0.08642874, -2.186293, 1, 1, 1, 1, 1,
-0.3509814, -1.698817, -3.354328, 1, 1, 1, 1, 1,
-0.3445925, 1.6113, -0.2905985, 1, 1, 1, 1, 1,
-0.3442162, -0.8785653, -1.552381, 1, 1, 1, 1, 1,
-0.3424759, 0.6760566, -3.578484, 1, 1, 1, 1, 1,
-0.3422447, 1.518759, -0.9338354, 1, 1, 1, 1, 1,
-0.3383768, -1.419498, -3.060983, 1, 1, 1, 1, 1,
-0.3379355, -1.299705, -1.744772, 1, 1, 1, 1, 1,
-0.3337785, -0.7433297, -3.427127, 1, 1, 1, 1, 1,
-0.332763, -0.4830796, -2.83865, 1, 1, 1, 1, 1,
-0.3254964, -0.5980833, -2.099351, 1, 1, 1, 1, 1,
-0.324654, 0.6049919, -0.3117657, 0, 0, 1, 1, 1,
-0.324623, 0.0166808, 0.04851211, 1, 0, 0, 1, 1,
-0.3219865, -0.9669089, -3.341422, 1, 0, 0, 1, 1,
-0.3179557, -0.1531632, -0.6711639, 1, 0, 0, 1, 1,
-0.3162496, 0.2035276, -0.3050146, 1, 0, 0, 1, 1,
-0.314056, -1.335105, -4.260196, 1, 0, 0, 1, 1,
-0.3138273, -0.3861308, -0.7703992, 0, 0, 0, 1, 1,
-0.3082412, -0.4709128, -2.430529, 0, 0, 0, 1, 1,
-0.3035575, 0.03382172, -1.121042, 0, 0, 0, 1, 1,
-0.2985424, 0.1036775, -2.736981, 0, 0, 0, 1, 1,
-0.2984065, 2.326087, -0.9907668, 0, 0, 0, 1, 1,
-0.2979698, 0.9386528, -0.6419319, 0, 0, 0, 1, 1,
-0.2975566, -0.9096683, -3.068298, 0, 0, 0, 1, 1,
-0.2967372, 1.42838, 0.3680762, 1, 1, 1, 1, 1,
-0.2959402, 0.7404004, -1.006229, 1, 1, 1, 1, 1,
-0.2909159, -0.7932682, -2.477093, 1, 1, 1, 1, 1,
-0.2873199, -0.8033955, -1.217492, 1, 1, 1, 1, 1,
-0.2866263, -0.8747966, -2.337741, 1, 1, 1, 1, 1,
-0.2787724, -0.6551028, -3.464514, 1, 1, 1, 1, 1,
-0.2765275, -0.3943377, -2.082978, 1, 1, 1, 1, 1,
-0.2762955, -0.5845321, -1.6681, 1, 1, 1, 1, 1,
-0.2732206, -0.8772738, -1.807501, 1, 1, 1, 1, 1,
-0.2709006, 0.9744245, 1.286051, 1, 1, 1, 1, 1,
-0.2609339, 1.437628, -0.943948, 1, 1, 1, 1, 1,
-0.256234, -0.35666, -0.450356, 1, 1, 1, 1, 1,
-0.2547466, -0.9507185, -1.976374, 1, 1, 1, 1, 1,
-0.2435629, -0.3749894, -2.093893, 1, 1, 1, 1, 1,
-0.2434563, -1.597035, -2.678355, 1, 1, 1, 1, 1,
-0.2409378, 0.03221962, 0.5383627, 0, 0, 1, 1, 1,
-0.2376779, 0.3525045, -0.5309075, 1, 0, 0, 1, 1,
-0.2367682, 0.3509311, 0.1998473, 1, 0, 0, 1, 1,
-0.2365146, 0.5657941, -0.1581838, 1, 0, 0, 1, 1,
-0.2345157, -1.25649, -3.534148, 1, 0, 0, 1, 1,
-0.2339571, 0.3537115, -1.90901, 1, 0, 0, 1, 1,
-0.2328874, -0.4806425, -1.318645, 0, 0, 0, 1, 1,
-0.2284155, 1.092068, -0.6502783, 0, 0, 0, 1, 1,
-0.224939, 0.2901054, -1.109142, 0, 0, 0, 1, 1,
-0.223663, 0.3388147, -0.9376059, 0, 0, 0, 1, 1,
-0.2229738, -1.65339, -3.091549, 0, 0, 0, 1, 1,
-0.219976, -0.08404587, -1.088935, 0, 0, 0, 1, 1,
-0.219038, -1.559732, -1.756553, 0, 0, 0, 1, 1,
-0.2119348, -1.222442, -5.061816, 1, 1, 1, 1, 1,
-0.2055018, 1.012474, 0.303818, 1, 1, 1, 1, 1,
-0.2042996, -0.7799154, -2.999086, 1, 1, 1, 1, 1,
-0.1991878, 1.517163, -0.2437543, 1, 1, 1, 1, 1,
-0.1982839, 0.4782189, -0.7217051, 1, 1, 1, 1, 1,
-0.1957927, -2.224555, -4.867958, 1, 1, 1, 1, 1,
-0.1931044, -0.6899617, -4.507037, 1, 1, 1, 1, 1,
-0.1907979, 0.8669608, 0.4247535, 1, 1, 1, 1, 1,
-0.1851655, 1.309328, -1.204861, 1, 1, 1, 1, 1,
-0.18479, 0.03011067, -1.808057, 1, 1, 1, 1, 1,
-0.1829107, 0.1340815, -0.7437688, 1, 1, 1, 1, 1,
-0.1821196, 0.5773513, 1.454392, 1, 1, 1, 1, 1,
-0.1812568, 0.3081926, 0.2026829, 1, 1, 1, 1, 1,
-0.1802956, -0.03894525, -2.472083, 1, 1, 1, 1, 1,
-0.1794632, 0.6275371, -0.3794678, 1, 1, 1, 1, 1,
-0.1789471, -0.4440186, -3.377943, 0, 0, 1, 1, 1,
-0.1786611, -0.6777749, -1.978168, 1, 0, 0, 1, 1,
-0.1734792, 1.492633, -0.9547592, 1, 0, 0, 1, 1,
-0.1716833, -0.04803305, -1.992398, 1, 0, 0, 1, 1,
-0.171588, 0.8566037, 1.379178, 1, 0, 0, 1, 1,
-0.1697514, 0.5874867, -0.256221, 1, 0, 0, 1, 1,
-0.1665868, -0.713107, -3.635686, 0, 0, 0, 1, 1,
-0.1636216, 0.8552873, 0.02801921, 0, 0, 0, 1, 1,
-0.1621556, 0.7058741, -0.7602031, 0, 0, 0, 1, 1,
-0.1582605, -0.2610502, -3.890616, 0, 0, 0, 1, 1,
-0.1580711, 0.03900763, 0.4349972, 0, 0, 0, 1, 1,
-0.1559124, -1.298287, -2.0315, 0, 0, 0, 1, 1,
-0.148707, -1.05796, -2.710019, 0, 0, 0, 1, 1,
-0.1480675, 1.071837, -0.2822289, 1, 1, 1, 1, 1,
-0.1473403, -0.2197699, -2.405015, 1, 1, 1, 1, 1,
-0.1367312, 0.3512707, -0.84844, 1, 1, 1, 1, 1,
-0.1356522, 1.516548, 1.482738, 1, 1, 1, 1, 1,
-0.1329852, -1.133718, -4.248815, 1, 1, 1, 1, 1,
-0.1321569, -0.2123318, -3.807498, 1, 1, 1, 1, 1,
-0.1290394, 2.56719, -1.451194, 1, 1, 1, 1, 1,
-0.1266253, 0.8256779, -0.8746125, 1, 1, 1, 1, 1,
-0.1257042, 1.574864, -1.546257, 1, 1, 1, 1, 1,
-0.1228796, 1.330024, 0.7411943, 1, 1, 1, 1, 1,
-0.1210017, -0.4430836, -2.618425, 1, 1, 1, 1, 1,
-0.1201455, -1.189598, -2.062841, 1, 1, 1, 1, 1,
-0.1177438, 0.6826113, -0.1177174, 1, 1, 1, 1, 1,
-0.1112569, -0.2231862, -2.962327, 1, 1, 1, 1, 1,
-0.1067245, -0.142507, -3.896778, 1, 1, 1, 1, 1,
-0.1063966, 1.24024, 0.1304363, 0, 0, 1, 1, 1,
-0.103566, -1.435235, -2.075542, 1, 0, 0, 1, 1,
-0.09923167, 2.842048, 0.1202549, 1, 0, 0, 1, 1,
-0.09847969, -0.7042999, -3.71128, 1, 0, 0, 1, 1,
-0.09468596, 1.680799, -0.1936576, 1, 0, 0, 1, 1,
-0.09270075, -0.2750902, -4.013048, 1, 0, 0, 1, 1,
-0.09091558, 2.464483, 0.5006998, 0, 0, 0, 1, 1,
-0.08920482, 1.380583, 0.6367023, 0, 0, 0, 1, 1,
-0.08884753, 1.146212, -0.3092262, 0, 0, 0, 1, 1,
-0.0845432, -0.04031336, -1.665249, 0, 0, 0, 1, 1,
-0.07580474, -0.1491408, -4.183733, 0, 0, 0, 1, 1,
-0.07516073, -0.2125685, -1.405502, 0, 0, 0, 1, 1,
-0.07336928, 0.1684428, -1.040362, 0, 0, 0, 1, 1,
-0.07290906, 0.4165439, -1.742664, 1, 1, 1, 1, 1,
-0.07251889, 0.9907662, -1.877014, 1, 1, 1, 1, 1,
-0.0722902, 1.376446, -0.255788, 1, 1, 1, 1, 1,
-0.07210003, -1.223902, -3.742649, 1, 1, 1, 1, 1,
-0.07064462, 1.339295, 0.8245696, 1, 1, 1, 1, 1,
-0.07062163, -1.931696, -3.376793, 1, 1, 1, 1, 1,
-0.06852313, -0.9620479, -3.537889, 1, 1, 1, 1, 1,
-0.06421843, -0.1026158, -2.435113, 1, 1, 1, 1, 1,
-0.06333542, 1.602913, 0.6889386, 1, 1, 1, 1, 1,
-0.06218512, 0.5032225, -0.8230629, 1, 1, 1, 1, 1,
-0.0593178, -0.002787769, -1.049951, 1, 1, 1, 1, 1,
-0.05671237, -0.2732063, -2.977382, 1, 1, 1, 1, 1,
-0.05491587, -0.3888114, -3.650909, 1, 1, 1, 1, 1,
-0.0485496, 0.1689778, -0.493297, 1, 1, 1, 1, 1,
-0.04457657, 0.971486, 0.5843495, 1, 1, 1, 1, 1,
-0.03666784, -0.04859969, -0.9274803, 0, 0, 1, 1, 1,
-0.03576857, 0.6406086, 0.880694, 1, 0, 0, 1, 1,
-0.03467739, -1.340678, -3.011828, 1, 0, 0, 1, 1,
-0.03094539, -1.685632, -3.315426, 1, 0, 0, 1, 1,
-0.02998806, 1.89046, -0.3270421, 1, 0, 0, 1, 1,
-0.02552269, -0.1272095, -0.555752, 1, 0, 0, 1, 1,
-0.02185029, 0.08095206, -2.176988, 0, 0, 0, 1, 1,
-0.01705497, 0.1164979, 0.05825473, 0, 0, 0, 1, 1,
-0.01652571, 1.17607, 0.9631003, 0, 0, 0, 1, 1,
-0.0155314, 0.8199115, -1.894531, 0, 0, 0, 1, 1,
-0.01464596, -0.3262675, -2.46642, 0, 0, 0, 1, 1,
-0.01182217, 0.31684, 0.7112827, 0, 0, 0, 1, 1,
-0.007644231, 0.5318138, -0.1342472, 0, 0, 0, 1, 1,
-0.005548792, 1.718878, 0.7106907, 1, 1, 1, 1, 1,
-0.00423694, 1.405839, -0.823526, 1, 1, 1, 1, 1,
-0.00142836, -0.792156, -2.230823, 1, 1, 1, 1, 1,
0.0003122179, 0.4296949, -1.259066, 1, 1, 1, 1, 1,
0.004294392, -0.5188469, 3.196214, 1, 1, 1, 1, 1,
0.005727855, -0.06250001, 2.461212, 1, 1, 1, 1, 1,
0.006647459, 0.9110474, -0.3038903, 1, 1, 1, 1, 1,
0.01005166, -1.475533, 3.8353, 1, 1, 1, 1, 1,
0.01194513, 0.6304584, 0.65437, 1, 1, 1, 1, 1,
0.01353508, -0.2805707, 2.165106, 1, 1, 1, 1, 1,
0.01414305, -0.02592017, 3.098781, 1, 1, 1, 1, 1,
0.01705791, 0.4941459, -0.6346144, 1, 1, 1, 1, 1,
0.02442821, -1.798319, 2.365193, 1, 1, 1, 1, 1,
0.02773914, -0.5433609, 4.569229, 1, 1, 1, 1, 1,
0.02781704, 0.8689212, 2.250551, 1, 1, 1, 1, 1,
0.03224474, -0.5367069, 3.668401, 0, 0, 1, 1, 1,
0.03290078, 0.6196735, -1.552681, 1, 0, 0, 1, 1,
0.03756269, -1.503453, 3.289074, 1, 0, 0, 1, 1,
0.04182167, 1.608874, 1.894038, 1, 0, 0, 1, 1,
0.04263385, 2.032492, -0.4228192, 1, 0, 0, 1, 1,
0.0454066, 0.7747828, 0.0270382, 1, 0, 0, 1, 1,
0.04719489, -0.2429171, 3.168643, 0, 0, 0, 1, 1,
0.04726642, 1.948732, 0.5624435, 0, 0, 0, 1, 1,
0.04840026, -1.214477, 3.16925, 0, 0, 0, 1, 1,
0.05134608, 0.6047289, 0.8800749, 0, 0, 0, 1, 1,
0.05486827, -1.573504, 3.473923, 0, 0, 0, 1, 1,
0.05947048, -1.755989, 1.47971, 0, 0, 0, 1, 1,
0.06470925, 0.05036241, -0.6731295, 0, 0, 0, 1, 1,
0.06566301, -0.2639121, 4.879307, 1, 1, 1, 1, 1,
0.06755047, -1.69146, 2.219465, 1, 1, 1, 1, 1,
0.06849854, 0.2173902, 0.6588894, 1, 1, 1, 1, 1,
0.07193793, -0.433755, 0.8938141, 1, 1, 1, 1, 1,
0.07263888, -0.878013, 1.895899, 1, 1, 1, 1, 1,
0.07369478, -0.4252317, 0.3941376, 1, 1, 1, 1, 1,
0.08220291, -2.499845, 3.252228, 1, 1, 1, 1, 1,
0.08795331, -0.414025, 3.502665, 1, 1, 1, 1, 1,
0.0884055, -0.7427067, 2.043319, 1, 1, 1, 1, 1,
0.08879604, 0.6105365, 0.2782445, 1, 1, 1, 1, 1,
0.09010804, -0.773113, 2.438817, 1, 1, 1, 1, 1,
0.09880267, -0.1592513, 2.63915, 1, 1, 1, 1, 1,
0.1000722, -0.9659874, 3.744385, 1, 1, 1, 1, 1,
0.1009478, -1.565593, 1.854499, 1, 1, 1, 1, 1,
0.1029752, -1.055048, 3.256321, 1, 1, 1, 1, 1,
0.1030481, -1.247564, 3.766085, 0, 0, 1, 1, 1,
0.103992, -0.4456624, 3.094652, 1, 0, 0, 1, 1,
0.1103932, 1.36331, -1.973194, 1, 0, 0, 1, 1,
0.1117901, -0.7104359, 4.818746, 1, 0, 0, 1, 1,
0.1125964, 1.288082, 2.104453, 1, 0, 0, 1, 1,
0.1131295, 0.4989485, -1.853554, 1, 0, 0, 1, 1,
0.1137021, 0.1303894, 0.5836079, 0, 0, 0, 1, 1,
0.1140144, 0.6280239, -0.591804, 0, 0, 0, 1, 1,
0.1248558, 0.8932456, -0.02243822, 0, 0, 0, 1, 1,
0.1260718, -0.1708611, 3.129139, 0, 0, 0, 1, 1,
0.1305769, 1.143644, 0.08671547, 0, 0, 0, 1, 1,
0.1322628, 2.087024, 2.534045, 0, 0, 0, 1, 1,
0.132685, -0.5777982, 3.724223, 0, 0, 0, 1, 1,
0.1372612, 1.40368, -1.538344, 1, 1, 1, 1, 1,
0.1374436, 0.5940948, -0.4032908, 1, 1, 1, 1, 1,
0.1377389, -0.01906572, 0.8070989, 1, 1, 1, 1, 1,
0.1425816, -0.4530601, 2.607193, 1, 1, 1, 1, 1,
0.1427551, 1.186259, 0.5145347, 1, 1, 1, 1, 1,
0.1441664, -1.614382, 3.152695, 1, 1, 1, 1, 1,
0.1482305, 1.517507, -0.594605, 1, 1, 1, 1, 1,
0.1525707, 0.2954029, 2.135899, 1, 1, 1, 1, 1,
0.1552275, -0.5397643, 3.694033, 1, 1, 1, 1, 1,
0.1556032, 0.2991144, 0.8276598, 1, 1, 1, 1, 1,
0.1610303, 0.8148555, 0.363366, 1, 1, 1, 1, 1,
0.1622976, 0.3737048, 2.131777, 1, 1, 1, 1, 1,
0.1635653, 0.4726935, -0.8196355, 1, 1, 1, 1, 1,
0.1679194, 0.2087158, -0.481802, 1, 1, 1, 1, 1,
0.1696447, 0.2304006, 0.5596484, 1, 1, 1, 1, 1,
0.1705992, -1.315112, 3.861916, 0, 0, 1, 1, 1,
0.1732733, 0.7443129, 0.5077952, 1, 0, 0, 1, 1,
0.1738101, 0.3608575, -0.07738025, 1, 0, 0, 1, 1,
0.1755562, -0.2439906, 3.12371, 1, 0, 0, 1, 1,
0.1760195, -0.9853985, 5.138436, 1, 0, 0, 1, 1,
0.1875488, -0.5662547, 1.792524, 1, 0, 0, 1, 1,
0.189334, 0.3687356, 0.7718562, 0, 0, 0, 1, 1,
0.1910838, -0.2521618, 2.6829, 0, 0, 0, 1, 1,
0.1978533, -0.8884384, 0.9513448, 0, 0, 0, 1, 1,
0.1987557, 0.6009522, 0.9248307, 0, 0, 0, 1, 1,
0.1988963, -1.468205, 1.906965, 0, 0, 0, 1, 1,
0.2087598, -0.8676332, 4.221117, 0, 0, 0, 1, 1,
0.2097339, -0.5188987, 3.835711, 0, 0, 0, 1, 1,
0.2142572, 1.262017, -2.208904, 1, 1, 1, 1, 1,
0.2156141, -0.3672267, 2.762661, 1, 1, 1, 1, 1,
0.2167047, 1.657781, -2.657453, 1, 1, 1, 1, 1,
0.2215481, 0.8787671, 0.4878793, 1, 1, 1, 1, 1,
0.222252, -0.5389239, 4.653075, 1, 1, 1, 1, 1,
0.222952, 0.9297916, -1.3776, 1, 1, 1, 1, 1,
0.223383, -0.5849922, 2.993994, 1, 1, 1, 1, 1,
0.2257979, -1.874908, 2.885216, 1, 1, 1, 1, 1,
0.230094, -0.9612696, 2.630322, 1, 1, 1, 1, 1,
0.2320743, 0.5471639, 0.3533761, 1, 1, 1, 1, 1,
0.2344278, 0.4778571, -0.2241679, 1, 1, 1, 1, 1,
0.2350453, -1.14283, 2.398979, 1, 1, 1, 1, 1,
0.2362437, 1.325291, 0.2514721, 1, 1, 1, 1, 1,
0.2363452, -0.01509228, 2.169028, 1, 1, 1, 1, 1,
0.2488826, -2.412868, 4.21223, 1, 1, 1, 1, 1,
0.2548205, 0.751028, 1.163834, 0, 0, 1, 1, 1,
0.2561013, 0.657993, 0.6011013, 1, 0, 0, 1, 1,
0.2573469, -1.056253, 3.990093, 1, 0, 0, 1, 1,
0.2637027, -0.3547089, 5.091081, 1, 0, 0, 1, 1,
0.2661152, -1.191061, 2.95977, 1, 0, 0, 1, 1,
0.2758598, -1.286034, 1.573732, 1, 0, 0, 1, 1,
0.2776864, 0.03116138, 1.041658, 0, 0, 0, 1, 1,
0.2790566, -1.408374, 2.810805, 0, 0, 0, 1, 1,
0.2798345, -0.1297684, 3.969867, 0, 0, 0, 1, 1,
0.2850614, -0.4000434, 4.496337, 0, 0, 0, 1, 1,
0.2888921, 0.6044077, 0.6984106, 0, 0, 0, 1, 1,
0.2935158, -1.46538, 3.136209, 0, 0, 0, 1, 1,
0.2945753, 1.255898, 1.627062, 0, 0, 0, 1, 1,
0.2946711, 0.03550332, 0.5406457, 1, 1, 1, 1, 1,
0.2959218, 0.5010237, 1.03905, 1, 1, 1, 1, 1,
0.2976591, -0.09554414, 1.116513, 1, 1, 1, 1, 1,
0.3064117, 1.307678, 0.4096082, 1, 1, 1, 1, 1,
0.3107987, 1.316598, 0.8795519, 1, 1, 1, 1, 1,
0.3110497, -0.1230871, 1.30949, 1, 1, 1, 1, 1,
0.311767, -0.2042159, 1.089621, 1, 1, 1, 1, 1,
0.314602, -0.8306841, 1.651792, 1, 1, 1, 1, 1,
0.3148236, -0.06452533, 2.983758, 1, 1, 1, 1, 1,
0.317908, 0.1039357, 2.353955, 1, 1, 1, 1, 1,
0.3193431, -0.6438007, 2.631523, 1, 1, 1, 1, 1,
0.3196641, -0.03228077, 2.453909, 1, 1, 1, 1, 1,
0.3203541, 2.103952, -0.106065, 1, 1, 1, 1, 1,
0.3226329, 0.8168773, 1.363787, 1, 1, 1, 1, 1,
0.3232011, 0.294387, 1.060282, 1, 1, 1, 1, 1,
0.3243576, 0.2201389, 0.2765324, 0, 0, 1, 1, 1,
0.3289337, -0.02998101, 0.5626571, 1, 0, 0, 1, 1,
0.3320133, -0.394146, 2.35409, 1, 0, 0, 1, 1,
0.3336667, 0.7086312, 0.442186, 1, 0, 0, 1, 1,
0.334815, -0.6885687, 3.646953, 1, 0, 0, 1, 1,
0.3389271, 1.255449, 0.04315763, 1, 0, 0, 1, 1,
0.3403365, 0.03418841, 2.250695, 0, 0, 0, 1, 1,
0.3403626, 1.705163, -0.9764328, 0, 0, 0, 1, 1,
0.3429598, 0.5040364, 0.4417319, 0, 0, 0, 1, 1,
0.347476, -0.001393741, 2.818868, 0, 0, 0, 1, 1,
0.3629496, -2.801939, 2.859158, 0, 0, 0, 1, 1,
0.363687, -1.536959, 1.99308, 0, 0, 0, 1, 1,
0.3652858, -1.511772, 2.01681, 0, 0, 0, 1, 1,
0.3665882, 1.371454, 1.572862, 1, 1, 1, 1, 1,
0.3674346, -0.2130093, 1.802856, 1, 1, 1, 1, 1,
0.3686095, 1.421297, 3.534459, 1, 1, 1, 1, 1,
0.3691602, 0.8021573, 0.3473861, 1, 1, 1, 1, 1,
0.3691996, 1.460094, 1.235244, 1, 1, 1, 1, 1,
0.3706618, -0.307501, 1.735457, 1, 1, 1, 1, 1,
0.3709204, -0.6244978, 2.927419, 1, 1, 1, 1, 1,
0.3709531, -2.112458, 1.374595, 1, 1, 1, 1, 1,
0.3716838, -0.6848657, 3.591683, 1, 1, 1, 1, 1,
0.3725424, 1.012807, 1.768754, 1, 1, 1, 1, 1,
0.373619, 0.2116439, -0.02992645, 1, 1, 1, 1, 1,
0.375502, -1.700361, 3.616775, 1, 1, 1, 1, 1,
0.3765429, 0.01514273, 1.433647, 1, 1, 1, 1, 1,
0.3818953, 1.730134, 1.759628, 1, 1, 1, 1, 1,
0.3824565, 0.609506, 0.2187447, 1, 1, 1, 1, 1,
0.3835283, -0.2655434, 2.38262, 0, 0, 1, 1, 1,
0.3842631, 0.4765304, 0.4148518, 1, 0, 0, 1, 1,
0.3860086, -1.326193, 1.614518, 1, 0, 0, 1, 1,
0.3881169, 0.3573681, -1.204839, 1, 0, 0, 1, 1,
0.3883185, 1.302175, 2.121217, 1, 0, 0, 1, 1,
0.3950101, 0.2562187, 0.8657067, 1, 0, 0, 1, 1,
0.3962022, 0.6940343, 1.787485, 0, 0, 0, 1, 1,
0.4063078, 0.2180425, 2.276914, 0, 0, 0, 1, 1,
0.4069153, -0.02429581, 2.916926, 0, 0, 0, 1, 1,
0.4074086, 0.8549857, 0.09828467, 0, 0, 0, 1, 1,
0.4095518, -0.8144981, 2.455351, 0, 0, 0, 1, 1,
0.4112677, -0.5745811, 3.111136, 0, 0, 0, 1, 1,
0.4132981, 1.021113, 0.06875559, 0, 0, 0, 1, 1,
0.4145656, 1.016209, 0.4891253, 1, 1, 1, 1, 1,
0.4182663, 0.5206323, 2.77956, 1, 1, 1, 1, 1,
0.4224524, 1.05723, -0.6488219, 1, 1, 1, 1, 1,
0.4338887, 0.1500849, 0.5186749, 1, 1, 1, 1, 1,
0.434312, -0.07670769, -0.1131157, 1, 1, 1, 1, 1,
0.4344051, -3.416099, 1.627401, 1, 1, 1, 1, 1,
0.4358121, -0.6660267, 3.627266, 1, 1, 1, 1, 1,
0.4408114, 0.5505409, 0.4580563, 1, 1, 1, 1, 1,
0.4420818, -0.5470268, 1.898703, 1, 1, 1, 1, 1,
0.4614549, -0.8108203, 4.306054, 1, 1, 1, 1, 1,
0.461537, -0.1429674, 2.116646, 1, 1, 1, 1, 1,
0.4622396, 0.7386765, 1.432433, 1, 1, 1, 1, 1,
0.4657849, 0.4343997, 1.741186, 1, 1, 1, 1, 1,
0.4662477, -0.8814505, 2.14466, 1, 1, 1, 1, 1,
0.4699236, 1.168555, -0.009205544, 1, 1, 1, 1, 1,
0.474584, -1.002933, 4.732197, 0, 0, 1, 1, 1,
0.4769694, 1.261481, 0.8118497, 1, 0, 0, 1, 1,
0.4806732, -1.271287, 4.07617, 1, 0, 0, 1, 1,
0.4835257, -0.4712538, 3.354963, 1, 0, 0, 1, 1,
0.4835688, 0.008335629, 2.578136, 1, 0, 0, 1, 1,
0.4835741, 0.003005667, 2.787165, 1, 0, 0, 1, 1,
0.4862047, -0.08000304, 0.754541, 0, 0, 0, 1, 1,
0.4919268, -0.7787442, 3.015528, 0, 0, 0, 1, 1,
0.499111, -0.852753, 3.011799, 0, 0, 0, 1, 1,
0.5032921, -0.144803, 1.722578, 0, 0, 0, 1, 1,
0.5120993, -0.3356388, 3.369588, 0, 0, 0, 1, 1,
0.5127283, 0.6167718, 1.122064, 0, 0, 0, 1, 1,
0.5128926, -0.5856839, 1.690678, 0, 0, 0, 1, 1,
0.5152187, 0.5020654, 0.7685244, 1, 1, 1, 1, 1,
0.5162187, -0.4614449, 2.236108, 1, 1, 1, 1, 1,
0.5264055, -0.3283856, 1.503655, 1, 1, 1, 1, 1,
0.5350531, 0.7872238, 0.5325965, 1, 1, 1, 1, 1,
0.537092, 0.8058857, 0.1387445, 1, 1, 1, 1, 1,
0.5373982, 0.03266875, 1.972446, 1, 1, 1, 1, 1,
0.5419119, -0.2304783, 1.663218, 1, 1, 1, 1, 1,
0.5422415, -0.8842876, 2.4847, 1, 1, 1, 1, 1,
0.5442692, 0.2898927, 0.8070576, 1, 1, 1, 1, 1,
0.5459725, -0.4877866, 2.685352, 1, 1, 1, 1, 1,
0.5463519, -1.004507, 1.362893, 1, 1, 1, 1, 1,
0.5469791, -0.255064, 1.689623, 1, 1, 1, 1, 1,
0.5519162, 0.3112557, 2.09551, 1, 1, 1, 1, 1,
0.5521575, -2.564987, 3.730289, 1, 1, 1, 1, 1,
0.5545791, 0.6564344, 1.968354, 1, 1, 1, 1, 1,
0.5553995, -0.151142, 0.922614, 0, 0, 1, 1, 1,
0.5564209, -0.9952919, 1.604763, 1, 0, 0, 1, 1,
0.5628735, 1.983096, 0.5460548, 1, 0, 0, 1, 1,
0.5679804, -0.1758974, 0.8283334, 1, 0, 0, 1, 1,
0.5685489, -0.823774, 3.39161, 1, 0, 0, 1, 1,
0.5748066, 0.3353234, 0.5167691, 1, 0, 0, 1, 1,
0.5800902, -0.449099, 1.423946, 0, 0, 0, 1, 1,
0.5876541, 1.139113, 1.290631, 0, 0, 0, 1, 1,
0.591805, -1.322475, 3.956369, 0, 0, 0, 1, 1,
0.5939035, 0.7249833, 1.982348, 0, 0, 0, 1, 1,
0.6012759, 1.483093, -0.1355769, 0, 0, 0, 1, 1,
0.6047143, -1.844494, 1.766742, 0, 0, 0, 1, 1,
0.6072214, -1.82592, 2.939259, 0, 0, 0, 1, 1,
0.6137323, -1.358645, 0.6671427, 1, 1, 1, 1, 1,
0.6151053, 0.7557308, 0.9891401, 1, 1, 1, 1, 1,
0.6188086, 0.5818686, 2.11435, 1, 1, 1, 1, 1,
0.6225381, -0.4626727, 2.948931, 1, 1, 1, 1, 1,
0.6232974, 0.06488064, 2.221241, 1, 1, 1, 1, 1,
0.624912, -0.7807407, 2.94452, 1, 1, 1, 1, 1,
0.628204, 0.8398439, -0.05585303, 1, 1, 1, 1, 1,
0.6299453, -2.224798, 3.260223, 1, 1, 1, 1, 1,
0.6308919, 0.9905354, 2.658992, 1, 1, 1, 1, 1,
0.6358936, -0.6101876, 1.894323, 1, 1, 1, 1, 1,
0.6396431, -1.082485, 1.68842, 1, 1, 1, 1, 1,
0.6464648, -0.5672219, 2.565999, 1, 1, 1, 1, 1,
0.646673, 0.3383131, 2.114842, 1, 1, 1, 1, 1,
0.6492393, -2.033943, 0.0888122, 1, 1, 1, 1, 1,
0.6554953, -0.4917986, 3.105578, 1, 1, 1, 1, 1,
0.6574454, 0.9112146, -1.973216, 0, 0, 1, 1, 1,
0.6575737, 1.299824, 2.777284, 1, 0, 0, 1, 1,
0.6630213, 0.8077041, 0.639905, 1, 0, 0, 1, 1,
0.6635584, -2.559112, 2.184272, 1, 0, 0, 1, 1,
0.6637788, 0.5287752, -0.03470199, 1, 0, 0, 1, 1,
0.6642953, 1.52899, -0.1090464, 1, 0, 0, 1, 1,
0.6647952, 0.42735, 0.6140056, 0, 0, 0, 1, 1,
0.6666407, -0.8593107, 3.095823, 0, 0, 0, 1, 1,
0.669396, -0.2846304, 2.24899, 0, 0, 0, 1, 1,
0.6743072, -1.425057, 1.330033, 0, 0, 0, 1, 1,
0.674343, 1.951365, -0.2653705, 0, 0, 0, 1, 1,
0.6850281, -0.06371841, 0.9665326, 0, 0, 0, 1, 1,
0.6852904, 1.738016, 1.371179, 0, 0, 0, 1, 1,
0.6858903, 0.8532345, -1.335284, 1, 1, 1, 1, 1,
0.6861839, 0.2231225, 0.8931515, 1, 1, 1, 1, 1,
0.689332, 0.358314, 0.9497397, 1, 1, 1, 1, 1,
0.6897397, -0.3459383, 2.030276, 1, 1, 1, 1, 1,
0.6926252, 0.7264926, 1.277395, 1, 1, 1, 1, 1,
0.6950304, 0.5192022, 0.8345196, 1, 1, 1, 1, 1,
0.6980701, 0.9466837, 2.186079, 1, 1, 1, 1, 1,
0.7014288, -0.9141902, 3.256876, 1, 1, 1, 1, 1,
0.7056621, 0.003798647, 1.217193, 1, 1, 1, 1, 1,
0.7086377, 0.6879119, 0.1112102, 1, 1, 1, 1, 1,
0.7175549, 0.2785652, 0.3673273, 1, 1, 1, 1, 1,
0.7190561, 0.4509585, 2.300018, 1, 1, 1, 1, 1,
0.7235687, -0.2720123, 1.855418, 1, 1, 1, 1, 1,
0.7241275, 1.388735, 0.03963558, 1, 1, 1, 1, 1,
0.7249429, -2.149151, 4.363145, 1, 1, 1, 1, 1,
0.7250362, -0.9833768, 0.6708988, 0, 0, 1, 1, 1,
0.7285309, -0.4626276, 3.136948, 1, 0, 0, 1, 1,
0.7317488, -0.5741485, 3.08126, 1, 0, 0, 1, 1,
0.7335408, -0.2000857, 2.842247, 1, 0, 0, 1, 1,
0.7360299, -1.705031, 3.748085, 1, 0, 0, 1, 1,
0.7414625, 1.450436, 0.5872722, 1, 0, 0, 1, 1,
0.7464265, -1.262585, 2.886348, 0, 0, 0, 1, 1,
0.746765, 1.653779, -0.1499245, 0, 0, 0, 1, 1,
0.7469227, 0.9262474, -0.235884, 0, 0, 0, 1, 1,
0.7489597, -0.9807183, 1.7585, 0, 0, 0, 1, 1,
0.7502317, 1.542438, 2.623733, 0, 0, 0, 1, 1,
0.7555264, 1.111818, 0.5540758, 0, 0, 0, 1, 1,
0.7557746, 0.6001419, 1.76148, 0, 0, 0, 1, 1,
0.7671288, -0.4550305, 2.799425, 1, 1, 1, 1, 1,
0.7674526, 0.5576211, 1.532799, 1, 1, 1, 1, 1,
0.7797377, -0.2173987, 3.657664, 1, 1, 1, 1, 1,
0.7827343, -0.4871108, 2.063574, 1, 1, 1, 1, 1,
0.7828523, -0.664799, 2.840628, 1, 1, 1, 1, 1,
0.7859029, -0.009642043, 1.712131, 1, 1, 1, 1, 1,
0.7862675, 0.5904057, 0.9597764, 1, 1, 1, 1, 1,
0.7930447, -1.297838, 3.911101, 1, 1, 1, 1, 1,
0.7949437, -1.817229, 1.530867, 1, 1, 1, 1, 1,
0.7978246, -0.6002433, 2.189792, 1, 1, 1, 1, 1,
0.8003477, 0.6288019, 0.5349237, 1, 1, 1, 1, 1,
0.8049911, -0.8724377, 3.512257, 1, 1, 1, 1, 1,
0.805465, 1.192949, 0.4822709, 1, 1, 1, 1, 1,
0.8063458, -0.191088, 2.922, 1, 1, 1, 1, 1,
0.8071612, 2.113559, 0.4370486, 1, 1, 1, 1, 1,
0.8132728, -0.3753671, 0.09345984, 0, 0, 1, 1, 1,
0.8135322, 0.8187704, 1.546618, 1, 0, 0, 1, 1,
0.8144675, 0.6181971, -0.06983924, 1, 0, 0, 1, 1,
0.8160298, -0.1349521, 0.9734812, 1, 0, 0, 1, 1,
0.8174058, -0.2442091, 2.127702, 1, 0, 0, 1, 1,
0.8229549, -0.3490049, 1.727053, 1, 0, 0, 1, 1,
0.8237717, -0.08347957, 3.164455, 0, 0, 0, 1, 1,
0.8266836, 1.054085, 1.144205, 0, 0, 0, 1, 1,
0.8301144, -0.4464022, 1.221678, 0, 0, 0, 1, 1,
0.8323233, -0.6994663, 1.277741, 0, 0, 0, 1, 1,
0.8337737, -1.10598, 4.709867, 0, 0, 0, 1, 1,
0.8355736, 0.4899926, -0.765107, 0, 0, 0, 1, 1,
0.8376057, -0.07388716, 2.036575, 0, 0, 0, 1, 1,
0.8387726, 1.700711, 0.3421474, 1, 1, 1, 1, 1,
0.8390015, 1.280312, 0.1347072, 1, 1, 1, 1, 1,
0.843543, -0.3664642, 1.192589, 1, 1, 1, 1, 1,
0.8479124, 0.3375336, 0.6294202, 1, 1, 1, 1, 1,
0.8541328, 0.8334457, -0.0202744, 1, 1, 1, 1, 1,
0.8565508, -0.1648825, 2.218392, 1, 1, 1, 1, 1,
0.8578641, 1.421668, 0.374942, 1, 1, 1, 1, 1,
0.8608034, -2.294088, 2.925666, 1, 1, 1, 1, 1,
0.861302, -0.3616787, 3.74954, 1, 1, 1, 1, 1,
0.8615896, -1.035441, 1.912034, 1, 1, 1, 1, 1,
0.8632026, 0.9259103, 2.363678, 1, 1, 1, 1, 1,
0.8637685, 0.3139244, 0.8582653, 1, 1, 1, 1, 1,
0.8660016, 0.6165651, 0.9217368, 1, 1, 1, 1, 1,
0.8707127, -1.203975, 2.929385, 1, 1, 1, 1, 1,
0.8724056, 1.207039, 0.6667492, 1, 1, 1, 1, 1,
0.8731987, -0.3164828, 2.489202, 0, 0, 1, 1, 1,
0.8773143, -0.1328312, -0.4643924, 1, 0, 0, 1, 1,
0.8798298, 0.6925805, 1.174257, 1, 0, 0, 1, 1,
0.8824916, 2.831328, -0.1342557, 1, 0, 0, 1, 1,
0.888049, -0.4260032, 1.397755, 1, 0, 0, 1, 1,
0.8960982, -0.4441061, 2.468085, 1, 0, 0, 1, 1,
0.8995905, -0.7835596, 3.107972, 0, 0, 0, 1, 1,
0.9065548, -1.230522, 3.946205, 0, 0, 0, 1, 1,
0.9091876, -1.284637, 2.73855, 0, 0, 0, 1, 1,
0.9122831, 0.543905, 0.9223224, 0, 0, 0, 1, 1,
0.9150256, 0.1705038, 0.7440069, 0, 0, 0, 1, 1,
0.9198998, -1.790731, 0.801367, 0, 0, 0, 1, 1,
0.9231527, 0.6802161, 0.2712333, 0, 0, 0, 1, 1,
0.9260994, 0.8578129, 0.9058599, 1, 1, 1, 1, 1,
0.9328823, -0.9738027, 2.142472, 1, 1, 1, 1, 1,
0.9344077, -0.290708, 1.807424, 1, 1, 1, 1, 1,
0.935523, 0.1816562, 2.262463, 1, 1, 1, 1, 1,
0.93748, -0.2607161, 1.917675, 1, 1, 1, 1, 1,
0.9390134, -1.016065, 1.317723, 1, 1, 1, 1, 1,
0.9406714, 0.5456842, 0.02629091, 1, 1, 1, 1, 1,
0.9462549, 0.0200717, 1.206088, 1, 1, 1, 1, 1,
0.9495217, 0.541499, 1.308773, 1, 1, 1, 1, 1,
0.9550332, 0.2739391, -0.04368723, 1, 1, 1, 1, 1,
0.9557192, 0.3512593, 1.377919, 1, 1, 1, 1, 1,
0.9561605, -0.3160292, 0.7170365, 1, 1, 1, 1, 1,
0.9608219, -0.08824037, 0.8349672, 1, 1, 1, 1, 1,
0.9648297, -0.299104, 1.425332, 1, 1, 1, 1, 1,
0.9652999, -0.1009203, 1.701119, 1, 1, 1, 1, 1,
0.9778699, -0.4060661, 2.269413, 0, 0, 1, 1, 1,
0.9808977, -0.4713528, 2.391636, 1, 0, 0, 1, 1,
0.9819265, -0.2649264, 1.177229, 1, 0, 0, 1, 1,
0.9885911, -1.091822, 1.026244, 1, 0, 0, 1, 1,
0.9894964, 0.2671927, 0.6691334, 1, 0, 0, 1, 1,
0.9946566, 0.686904, 0.4334925, 1, 0, 0, 1, 1,
1.003342, 0.03544523, 2.803917, 0, 0, 0, 1, 1,
1.010845, 2.186578, 0.9469156, 0, 0, 0, 1, 1,
1.011877, 1.745388, 1.094597, 0, 0, 0, 1, 1,
1.017658, -0.3584249, -0.03904449, 0, 0, 0, 1, 1,
1.020398, 0.3967994, -0.9533708, 0, 0, 0, 1, 1,
1.03065, -2.14778, 1.391715, 0, 0, 0, 1, 1,
1.031121, -0.8808761, 2.018553, 0, 0, 0, 1, 1,
1.031664, -0.2189978, 2.689946, 1, 1, 1, 1, 1,
1.033438, 1.241513, 1.379581, 1, 1, 1, 1, 1,
1.033777, -0.4202521, 5.696123, 1, 1, 1, 1, 1,
1.047688, 1.019768, -0.4950166, 1, 1, 1, 1, 1,
1.048379, -0.5575514, 1.164538, 1, 1, 1, 1, 1,
1.048879, -2.234797, 1.725841, 1, 1, 1, 1, 1,
1.051668, 1.023231, 0.4956545, 1, 1, 1, 1, 1,
1.059298, -0.2973899, 2.388092, 1, 1, 1, 1, 1,
1.059925, 0.06076309, 2.070371, 1, 1, 1, 1, 1,
1.079267, -0.1322159, 2.097948, 1, 1, 1, 1, 1,
1.080658, -0.8373116, 1.578009, 1, 1, 1, 1, 1,
1.084788, 0.3303389, 1.619055, 1, 1, 1, 1, 1,
1.089495, -1.551155, 2.736151, 1, 1, 1, 1, 1,
1.096891, -0.7310309, 3.631115, 1, 1, 1, 1, 1,
1.100284, -0.629, 4.032292, 1, 1, 1, 1, 1,
1.101719, -1.621578, 3.167733, 0, 0, 1, 1, 1,
1.103302, -0.2529283, 1.63563, 1, 0, 0, 1, 1,
1.103601, 1.21223, 1.852227, 1, 0, 0, 1, 1,
1.105868, 0.199717, -1.173735, 1, 0, 0, 1, 1,
1.10708, -0.4575129, 2.648419, 1, 0, 0, 1, 1,
1.116107, 1.158331, 1.275858, 1, 0, 0, 1, 1,
1.119997, 1.085363, 3.599017, 0, 0, 0, 1, 1,
1.121222, -1.02263, 1.787362, 0, 0, 0, 1, 1,
1.125879, 0.1446323, -0.1322531, 0, 0, 0, 1, 1,
1.134997, -1.391083, 3.167733, 0, 0, 0, 1, 1,
1.137034, 1.475722, 0.7696671, 0, 0, 0, 1, 1,
1.138477, -0.1758176, 2.79879, 0, 0, 0, 1, 1,
1.151343, 0.2094761, 2.48492, 0, 0, 0, 1, 1,
1.154636, -0.1066961, 2.383771, 1, 1, 1, 1, 1,
1.161126, 0.6096832, 1.057165, 1, 1, 1, 1, 1,
1.161943, -0.03250586, 2.426201, 1, 1, 1, 1, 1,
1.164275, -1.101347, 3.141446, 1, 1, 1, 1, 1,
1.177236, 0.4206985, 1.125598, 1, 1, 1, 1, 1,
1.17863, -0.02855114, -0.2263405, 1, 1, 1, 1, 1,
1.181981, 0.2808413, 0.9463618, 1, 1, 1, 1, 1,
1.185731, 1.110319, 0.9817659, 1, 1, 1, 1, 1,
1.192918, 0.8962817, 1.118558, 1, 1, 1, 1, 1,
1.196055, 1.013512, 0.3882965, 1, 1, 1, 1, 1,
1.207525, -0.7069319, 3.265179, 1, 1, 1, 1, 1,
1.207729, -0.1147324, 2.423654, 1, 1, 1, 1, 1,
1.214504, 1.507635, 0.8357279, 1, 1, 1, 1, 1,
1.232715, -1.330923, 2.194394, 1, 1, 1, 1, 1,
1.239854, 0.6569259, 1.907028, 1, 1, 1, 1, 1,
1.254588, -0.3849049, 1.12953, 0, 0, 1, 1, 1,
1.26237, 0.2172751, 2.086209, 1, 0, 0, 1, 1,
1.270334, 0.6657834, 0.5154521, 1, 0, 0, 1, 1,
1.279725, -1.356398, 1.550013, 1, 0, 0, 1, 1,
1.282049, 0.216074, 2.619176, 1, 0, 0, 1, 1,
1.285994, -0.9858004, 0.8140036, 1, 0, 0, 1, 1,
1.289628, 0.7218628, 1.334548, 0, 0, 0, 1, 1,
1.292329, 2.258032, -1.181855, 0, 0, 0, 1, 1,
1.301089, -1.027898, 1.791958, 0, 0, 0, 1, 1,
1.301386, -0.5288578, 2.344635, 0, 0, 0, 1, 1,
1.308736, -1.930966, 2.616985, 0, 0, 0, 1, 1,
1.318778, 0.6529637, 0.833981, 0, 0, 0, 1, 1,
1.320115, 0.2743434, 1.050005, 0, 0, 0, 1, 1,
1.321088, -0.4702777, 2.686931, 1, 1, 1, 1, 1,
1.323841, 1.623173, 0.4644771, 1, 1, 1, 1, 1,
1.326199, -0.271211, 0.4465213, 1, 1, 1, 1, 1,
1.326201, -0.6893987, 0.339803, 1, 1, 1, 1, 1,
1.32743, 0.1197459, 0.5275543, 1, 1, 1, 1, 1,
1.328182, 0.6657742, -1.011599, 1, 1, 1, 1, 1,
1.332227, -1.900647, 1.915347, 1, 1, 1, 1, 1,
1.335156, -0.05235621, 0.9638306, 1, 1, 1, 1, 1,
1.338515, -0.3889997, 1.702229, 1, 1, 1, 1, 1,
1.343462, -0.8139521, 1.173328, 1, 1, 1, 1, 1,
1.350988, -0.1340061, 2.1787, 1, 1, 1, 1, 1,
1.356568, -0.02350961, 2.18384, 1, 1, 1, 1, 1,
1.365366, 0.1311002, 1.678142, 1, 1, 1, 1, 1,
1.365694, 2.037154, 1.362187, 1, 1, 1, 1, 1,
1.373093, 1.772211, -1.853485, 1, 1, 1, 1, 1,
1.387095, -0.5483229, 1.894727, 0, 0, 1, 1, 1,
1.396631, 1.094117, -0.2399801, 1, 0, 0, 1, 1,
1.406978, 1.359635, 1.232682, 1, 0, 0, 1, 1,
1.416882, 0.2425229, 0.8068296, 1, 0, 0, 1, 1,
1.428614, 1.605028, 0.8501244, 1, 0, 0, 1, 1,
1.429013, 0.151399, 0.4783699, 1, 0, 0, 1, 1,
1.432886, -0.3971488, 0.3770828, 0, 0, 0, 1, 1,
1.438463, -1.138841, 3.909963, 0, 0, 0, 1, 1,
1.443992, 0.2868961, 0.6220807, 0, 0, 0, 1, 1,
1.460955, 0.2177174, 1.317942, 0, 0, 0, 1, 1,
1.48017, 0.4377814, 1.448006, 0, 0, 0, 1, 1,
1.482695, 0.8696164, 0.01946722, 0, 0, 0, 1, 1,
1.487235, -1.746354, 3.289843, 0, 0, 0, 1, 1,
1.491831, 0.9419274, 0.6193151, 1, 1, 1, 1, 1,
1.494261, 0.3695276, -0.574981, 1, 1, 1, 1, 1,
1.501816, -1.424604, 1.223839, 1, 1, 1, 1, 1,
1.506734, -0.7699108, 0.410376, 1, 1, 1, 1, 1,
1.517009, -0.270944, 1.291476, 1, 1, 1, 1, 1,
1.520482, 0.3384016, 1.109647, 1, 1, 1, 1, 1,
1.561487, -0.07178342, 1.705537, 1, 1, 1, 1, 1,
1.576194, 1.478863, -0.1635484, 1, 1, 1, 1, 1,
1.577668, -2.09095, 1.58346, 1, 1, 1, 1, 1,
1.580329, -0.5515585, 2.449394, 1, 1, 1, 1, 1,
1.589785, 1.373105, 1.824355, 1, 1, 1, 1, 1,
1.589978, -0.9462, 1.699832, 1, 1, 1, 1, 1,
1.592603, -1.196963, 3.0137, 1, 1, 1, 1, 1,
1.594912, 0.03585184, 3.236227, 1, 1, 1, 1, 1,
1.617824, -0.5461395, 2.16415, 1, 1, 1, 1, 1,
1.619797, -0.1126672, 1.427734, 0, 0, 1, 1, 1,
1.641843, -0.07220826, 2.498875, 1, 0, 0, 1, 1,
1.644757, -0.6685052, 1.773653, 1, 0, 0, 1, 1,
1.705942, -1.023967, 3.777945, 1, 0, 0, 1, 1,
1.716985, -1.911662, 1.694851, 1, 0, 0, 1, 1,
1.718212, -0.07676917, 1.111836, 1, 0, 0, 1, 1,
1.759903, 1.098617, -1.17948, 0, 0, 0, 1, 1,
1.770764, -0.3005153, 1.247346, 0, 0, 0, 1, 1,
1.781159, 0.1165749, 0.7521142, 0, 0, 0, 1, 1,
1.786073, 1.091311, 1.387136, 0, 0, 0, 1, 1,
1.80801, -0.4738571, 0.931906, 0, 0, 0, 1, 1,
1.823207, 1.966458, 0.2567506, 0, 0, 0, 1, 1,
1.86524, 0.6524073, 2.253022, 0, 0, 0, 1, 1,
1.884371, 0.3148003, 0.3329147, 1, 1, 1, 1, 1,
1.910498, -1.285872, 2.254853, 1, 1, 1, 1, 1,
1.91142, 0.7859268, 3.107762, 1, 1, 1, 1, 1,
1.92324, -1.254137, 1.748079, 1, 1, 1, 1, 1,
1.932173, -0.5771051, 1.670679, 1, 1, 1, 1, 1,
1.983433, 0.1028558, 0.9874422, 1, 1, 1, 1, 1,
2.012897, 0.08771933, 0.9831535, 1, 1, 1, 1, 1,
2.019244, -1.211754, 2.437328, 1, 1, 1, 1, 1,
2.031796, -0.2501527, 0.9950922, 1, 1, 1, 1, 1,
2.058023, -1.335824, 2.621924, 1, 1, 1, 1, 1,
2.059434, -1.568185, 1.891073, 1, 1, 1, 1, 1,
2.098495, -0.1823298, 3.209203, 1, 1, 1, 1, 1,
2.102134, -0.8000732, 2.052104, 1, 1, 1, 1, 1,
2.125758, -0.8207694, 2.778556, 1, 1, 1, 1, 1,
2.15296, -0.3409748, 1.926778, 1, 1, 1, 1, 1,
2.169325, 0.1238533, 1.484359, 0, 0, 1, 1, 1,
2.189555, 0.6810071, 0.1805376, 1, 0, 0, 1, 1,
2.203839, -0.8651081, 0.7617281, 1, 0, 0, 1, 1,
2.29034, 0.4641848, 1.664178, 1, 0, 0, 1, 1,
2.350785, -0.6774694, 1.892799, 1, 0, 0, 1, 1,
2.368348, -0.2539747, 2.890298, 1, 0, 0, 1, 1,
2.390592, 0.3930135, 1.264551, 0, 0, 0, 1, 1,
2.473583, 0.4190485, 2.301975, 0, 0, 0, 1, 1,
2.495111, 0.6500518, -0.9581307, 0, 0, 0, 1, 1,
2.542073, 0.9183965, 1.654079, 0, 0, 0, 1, 1,
2.676666, -0.1918296, -0.2034294, 0, 0, 0, 1, 1,
2.696872, 1.032203, 0.436088, 0, 0, 0, 1, 1,
2.791753, 0.8491701, 1.387201, 0, 0, 0, 1, 1,
2.792984, 0.5962572, 0.8185079, 1, 1, 1, 1, 1,
2.940793, -1.726209, 2.470467, 1, 1, 1, 1, 1,
2.949495, 0.6641397, 0.1036884, 1, 1, 1, 1, 1,
3.016065, -0.1671001, -0.9232741, 1, 1, 1, 1, 1,
3.0933, 0.0594702, 0.5284095, 1, 1, 1, 1, 1,
3.222739, -0.4060315, 2.261741, 1, 1, 1, 1, 1,
3.415819, -2.119647, 1.422214, 1, 1, 1, 1, 1
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
var radius = 9.70037;
var distance = 34.07214;
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
mvMatrix.translate( -0.1572618, 0.06412172, -0.3171532 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07214);
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
