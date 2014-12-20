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
-3.11413, -0.9621175, -1.146309, 1, 0, 0, 1,
-2.879241, -0.2137874, -2.472598, 1, 0.007843138, 0, 1,
-2.677228, -1.021235, -2.622746, 1, 0.01176471, 0, 1,
-2.617905, -0.3861305, -3.111518, 1, 0.01960784, 0, 1,
-2.561028, -0.316916, -2.546655, 1, 0.02352941, 0, 1,
-2.465277, 0.9263472, 1.229703, 1, 0.03137255, 0, 1,
-2.413468, 1.704541, -1.075951, 1, 0.03529412, 0, 1,
-2.350533, -0.5587242, -3.69541, 1, 0.04313726, 0, 1,
-2.330419, 1.303183, -0.3172732, 1, 0.04705882, 0, 1,
-2.264367, 0.1740961, -1.991128, 1, 0.05490196, 0, 1,
-2.258371, 0.8154256, -1.583891, 1, 0.05882353, 0, 1,
-2.184571, -0.02871125, -1.48866, 1, 0.06666667, 0, 1,
-2.137451, 0.5459327, -2.190356, 1, 0.07058824, 0, 1,
-2.108819, 0.6546739, -0.2119844, 1, 0.07843138, 0, 1,
-2.088484, 1.472761, 0.2961057, 1, 0.08235294, 0, 1,
-2.087593, -0.6205103, -0.181811, 1, 0.09019608, 0, 1,
-2.077148, -0.5011818, -2.530849, 1, 0.09411765, 0, 1,
-2.057178, 1.42154, -1.493415, 1, 0.1019608, 0, 1,
-2.049956, -0.5499236, 0.116611, 1, 0.1098039, 0, 1,
-2.045444, 0.3808645, -1.734894, 1, 0.1137255, 0, 1,
-2.036131, -1.337587, -2.026839, 1, 0.1215686, 0, 1,
-2.000949, 2.084261, 0.4816605, 1, 0.1254902, 0, 1,
-1.996811, 0.2789832, -2.045997, 1, 0.1333333, 0, 1,
-1.99589, -0.003414354, -1.441086, 1, 0.1372549, 0, 1,
-1.983941, 0.4147743, -2.187538, 1, 0.145098, 0, 1,
-1.977587, -1.445711, -2.203188, 1, 0.1490196, 0, 1,
-1.972041, -0.2319831, -3.085691, 1, 0.1568628, 0, 1,
-1.968491, 2.195018, -1.075455, 1, 0.1607843, 0, 1,
-1.960719, -0.6958608, -4.124234, 1, 0.1686275, 0, 1,
-1.937184, -0.7363818, -2.153378, 1, 0.172549, 0, 1,
-1.931415, -1.289426, -3.840087, 1, 0.1803922, 0, 1,
-1.924163, -0.5399224, -1.97104, 1, 0.1843137, 0, 1,
-1.919223, -0.5075137, -2.323455, 1, 0.1921569, 0, 1,
-1.911429, -0.1260659, -1.789003, 1, 0.1960784, 0, 1,
-1.896736, -1.797976, -0.9868668, 1, 0.2039216, 0, 1,
-1.837809, -1.291357, -1.442917, 1, 0.2117647, 0, 1,
-1.823487, -0.5524149, -3.301699, 1, 0.2156863, 0, 1,
-1.822702, -0.4703376, -2.303704, 1, 0.2235294, 0, 1,
-1.798594, -1.00773, -2.305186, 1, 0.227451, 0, 1,
-1.79283, -0.6791978, -3.18468, 1, 0.2352941, 0, 1,
-1.78025, -1.046248, -2.27437, 1, 0.2392157, 0, 1,
-1.771089, 0.9368445, -1.098152, 1, 0.2470588, 0, 1,
-1.755905, -0.150547, -1.464164, 1, 0.2509804, 0, 1,
-1.725947, 2.203083, 0.01719329, 1, 0.2588235, 0, 1,
-1.715537, -0.6019914, -3.328257, 1, 0.2627451, 0, 1,
-1.711284, 0.7500618, -0.3925751, 1, 0.2705882, 0, 1,
-1.694426, -0.2691754, -4.129895, 1, 0.2745098, 0, 1,
-1.678912, -0.2622721, -3.693783, 1, 0.282353, 0, 1,
-1.673329, 0.272834, -2.175213, 1, 0.2862745, 0, 1,
-1.651247, 2.816253, 0.6883205, 1, 0.2941177, 0, 1,
-1.64782, 0.04359523, -1.754978, 1, 0.3019608, 0, 1,
-1.633876, 0.7715853, -1.464206, 1, 0.3058824, 0, 1,
-1.626497, -0.4510738, -1.490569, 1, 0.3137255, 0, 1,
-1.62501, -1.238762, -1.49564, 1, 0.3176471, 0, 1,
-1.611866, 0.2938549, 0.07961693, 1, 0.3254902, 0, 1,
-1.610662, 0.05941479, -1.0118, 1, 0.3294118, 0, 1,
-1.609876, -0.7062207, -2.651629, 1, 0.3372549, 0, 1,
-1.587423, 1.002979, -0.3761301, 1, 0.3411765, 0, 1,
-1.579002, -0.9670561, -2.066554, 1, 0.3490196, 0, 1,
-1.568918, -0.1296444, -2.141524, 1, 0.3529412, 0, 1,
-1.533867, 0.773625, -0.8659929, 1, 0.3607843, 0, 1,
-1.530563, 0.8102946, -0.3808096, 1, 0.3647059, 0, 1,
-1.530357, 0.2099229, -0.3900441, 1, 0.372549, 0, 1,
-1.527115, -1.843529, -2.592492, 1, 0.3764706, 0, 1,
-1.525442, -0.1489192, -2.960754, 1, 0.3843137, 0, 1,
-1.523408, 0.01034029, -3.559877, 1, 0.3882353, 0, 1,
-1.519706, 0.3511451, -1.355467, 1, 0.3960784, 0, 1,
-1.518387, 0.2644944, -1.356472, 1, 0.4039216, 0, 1,
-1.51456, -0.1440036, -1.767307, 1, 0.4078431, 0, 1,
-1.507649, -0.9631057, -2.788703, 1, 0.4156863, 0, 1,
-1.50756, -0.8416259, -3.10261, 1, 0.4196078, 0, 1,
-1.498451, -1.070403, -2.192482, 1, 0.427451, 0, 1,
-1.494769, 0.05779782, -1.264441, 1, 0.4313726, 0, 1,
-1.490379, 0.1970855, -0.7263433, 1, 0.4392157, 0, 1,
-1.464335, -1.31833, -2.117051, 1, 0.4431373, 0, 1,
-1.462049, -1.624542, -3.036581, 1, 0.4509804, 0, 1,
-1.452907, 0.6675025, -2.15067, 1, 0.454902, 0, 1,
-1.438692, 1.131896, -1.277902, 1, 0.4627451, 0, 1,
-1.43839, 1.142166, -0.8854194, 1, 0.4666667, 0, 1,
-1.437984, -0.7045988, -1.62246, 1, 0.4745098, 0, 1,
-1.429572, -0.9628583, -4.184669, 1, 0.4784314, 0, 1,
-1.428023, 0.3490376, -1.797539, 1, 0.4862745, 0, 1,
-1.426003, 0.9176864, -1.206002, 1, 0.4901961, 0, 1,
-1.422928, 0.190496, -1.164129, 1, 0.4980392, 0, 1,
-1.422654, -1.028698, -2.581967, 1, 0.5058824, 0, 1,
-1.418161, -1.275407, -3.816393, 1, 0.509804, 0, 1,
-1.403962, -1.115101, -3.757685, 1, 0.5176471, 0, 1,
-1.403132, 0.7286679, -1.100712, 1, 0.5215687, 0, 1,
-1.402919, -1.329464, -3.427634, 1, 0.5294118, 0, 1,
-1.37932, -0.8642858, -2.154089, 1, 0.5333334, 0, 1,
-1.360545, -0.3329141, -2.366119, 1, 0.5411765, 0, 1,
-1.356812, 2.987397, -0.2092321, 1, 0.5450981, 0, 1,
-1.356057, 0.2075386, -1.630564, 1, 0.5529412, 0, 1,
-1.354692, 0.3928817, -0.165865, 1, 0.5568628, 0, 1,
-1.344046, 0.5067761, -1.690716, 1, 0.5647059, 0, 1,
-1.341226, -0.09560575, -0.2830363, 1, 0.5686275, 0, 1,
-1.332019, 1.423921, -0.0594437, 1, 0.5764706, 0, 1,
-1.330273, 1.720285, 1.760843, 1, 0.5803922, 0, 1,
-1.326983, 0.5397176, -1.322617, 1, 0.5882353, 0, 1,
-1.320938, -0.7027184, -3.571033, 1, 0.5921569, 0, 1,
-1.319855, 0.4797079, -2.467705, 1, 0.6, 0, 1,
-1.319298, -0.1900526, -1.684164, 1, 0.6078432, 0, 1,
-1.31731, 1.539773, -1.212797, 1, 0.6117647, 0, 1,
-1.315656, -0.3153544, -2.031409, 1, 0.6196079, 0, 1,
-1.309803, -1.458996, -2.62488, 1, 0.6235294, 0, 1,
-1.308001, -0.07713532, -0.7218283, 1, 0.6313726, 0, 1,
-1.305276, 1.415317, -0.3719358, 1, 0.6352941, 0, 1,
-1.297014, 0.8571562, -0.2159899, 1, 0.6431373, 0, 1,
-1.29398, -0.6294378, -2.434703, 1, 0.6470588, 0, 1,
-1.28538, 1.250894, 0.9030871, 1, 0.654902, 0, 1,
-1.277485, -0.7020832, -2.721072, 1, 0.6588235, 0, 1,
-1.252154, 1.580873, -0.9904805, 1, 0.6666667, 0, 1,
-1.22192, 0.2896221, -0.440578, 1, 0.6705883, 0, 1,
-1.207884, 3.364454, 0.05866035, 1, 0.6784314, 0, 1,
-1.206939, -0.5342845, -2.798548, 1, 0.682353, 0, 1,
-1.202414, -0.4141518, -1.384674, 1, 0.6901961, 0, 1,
-1.199966, 0.3421957, -2.246279, 1, 0.6941177, 0, 1,
-1.197891, -2.480608, -2.184847, 1, 0.7019608, 0, 1,
-1.196541, 0.2392283, 0.6158658, 1, 0.7098039, 0, 1,
-1.178835, 0.683544, -2.135134, 1, 0.7137255, 0, 1,
-1.175981, -0.755224, -1.113539, 1, 0.7215686, 0, 1,
-1.172597, -0.7240285, -2.296971, 1, 0.7254902, 0, 1,
-1.165667, -0.4189441, -3.028099, 1, 0.7333333, 0, 1,
-1.15499, -0.6253101, -1.245583, 1, 0.7372549, 0, 1,
-1.147046, -0.04543895, -1.507777, 1, 0.7450981, 0, 1,
-1.143643, 1.190318, -0.6964156, 1, 0.7490196, 0, 1,
-1.141935, 0.1219916, 0.108142, 1, 0.7568628, 0, 1,
-1.133883, -1.509559, -1.560226, 1, 0.7607843, 0, 1,
-1.131901, 0.8463948, -1.616226, 1, 0.7686275, 0, 1,
-1.131322, 0.1041023, -0.1694533, 1, 0.772549, 0, 1,
-1.126695, 0.1672305, -0.9761701, 1, 0.7803922, 0, 1,
-1.122824, 1.525952, -0.9677423, 1, 0.7843137, 0, 1,
-1.114769, -1.472797, -2.937677, 1, 0.7921569, 0, 1,
-1.108433, 0.5388777, -0.02269045, 1, 0.7960784, 0, 1,
-1.105777, -0.5459971, -3.490582, 1, 0.8039216, 0, 1,
-1.102371, 1.032603, -1.762426, 1, 0.8117647, 0, 1,
-1.10196, -0.4048797, -0.6093041, 1, 0.8156863, 0, 1,
-1.100079, -0.1849421, -0.4321909, 1, 0.8235294, 0, 1,
-1.099701, 1.021361, -1.478421, 1, 0.827451, 0, 1,
-1.095067, 1.34089, -3.096714, 1, 0.8352941, 0, 1,
-1.090841, 0.004582456, -3.32563, 1, 0.8392157, 0, 1,
-1.087957, -0.5723061, -3.922426, 1, 0.8470588, 0, 1,
-1.087856, -0.2345969, -1.474453, 1, 0.8509804, 0, 1,
-1.083123, 0.2613722, -3.285182, 1, 0.8588235, 0, 1,
-1.083003, 0.9896138, -1.617221, 1, 0.8627451, 0, 1,
-1.080984, 0.7259089, -0.9683894, 1, 0.8705882, 0, 1,
-1.078239, -1.406659, 0.4760446, 1, 0.8745098, 0, 1,
-1.078058, 1.590221, 1.264146, 1, 0.8823529, 0, 1,
-1.068798, -0.09727181, -0.822849, 1, 0.8862745, 0, 1,
-1.06395, -0.966494, -2.392546, 1, 0.8941177, 0, 1,
-1.063903, 1.765475, 0.7918957, 1, 0.8980392, 0, 1,
-1.06334, 0.9187953, 0.1137429, 1, 0.9058824, 0, 1,
-1.060199, -0.7720048, -3.249521, 1, 0.9137255, 0, 1,
-1.05218, 0.5802973, -2.099641, 1, 0.9176471, 0, 1,
-1.05008, 0.6489484, -2.035405, 1, 0.9254902, 0, 1,
-1.048403, -0.2841318, 0.7331843, 1, 0.9294118, 0, 1,
-1.04573, -0.01586322, -2.133524, 1, 0.9372549, 0, 1,
-1.044537, -0.8472087, -1.956255, 1, 0.9411765, 0, 1,
-1.043967, -0.4815637, -0.2388702, 1, 0.9490196, 0, 1,
-1.043013, 0.4060517, 0.1797859, 1, 0.9529412, 0, 1,
-1.031879, 0.5745446, -1.038956, 1, 0.9607843, 0, 1,
-1.029373, -0.4899157, -2.594424, 1, 0.9647059, 0, 1,
-1.025517, -0.4026819, -2.996943, 1, 0.972549, 0, 1,
-1.024553, -0.08706571, -1.251547, 1, 0.9764706, 0, 1,
-1.020034, 1.173893, -0.1941666, 1, 0.9843137, 0, 1,
-1.017237, -0.5959902, -2.679464, 1, 0.9882353, 0, 1,
-1.016769, -1.674272, -1.11104, 1, 0.9960784, 0, 1,
-1.013947, 0.04814908, -2.240177, 0.9960784, 1, 0, 1,
-1.012626, 1.960972, -0.09945646, 0.9921569, 1, 0, 1,
-1.008567, -1.232227, -2.808405, 0.9843137, 1, 0, 1,
-1.007446, -0.2621116, -1.551207, 0.9803922, 1, 0, 1,
-1.001152, 0.3341783, -1.616096, 0.972549, 1, 0, 1,
-0.9972733, 0.5554968, -3.295651, 0.9686275, 1, 0, 1,
-0.9968074, 0.3011082, -1.706328, 0.9607843, 1, 0, 1,
-0.9958323, -2.043974, -3.966743, 0.9568627, 1, 0, 1,
-0.9923064, 1.12959, 0.9437606, 0.9490196, 1, 0, 1,
-0.9919424, 0.48015, -0.2778161, 0.945098, 1, 0, 1,
-0.9878186, 0.6497911, -0.996659, 0.9372549, 1, 0, 1,
-0.9801261, -0.02464405, -2.083808, 0.9333333, 1, 0, 1,
-0.9737533, -1.154264, -2.093275, 0.9254902, 1, 0, 1,
-0.9733224, -1.45542, -3.433823, 0.9215686, 1, 0, 1,
-0.9612455, -0.6420352, -2.311583, 0.9137255, 1, 0, 1,
-0.9583939, -2.05087, -3.682831, 0.9098039, 1, 0, 1,
-0.9523115, 1.206178, -0.5125993, 0.9019608, 1, 0, 1,
-0.9522457, 0.6819677, -2.517452, 0.8941177, 1, 0, 1,
-0.95202, 1.873898, -1.349974, 0.8901961, 1, 0, 1,
-0.9518769, 0.3452128, -0.3481118, 0.8823529, 1, 0, 1,
-0.9492594, 1.475248, 1.453468, 0.8784314, 1, 0, 1,
-0.9467539, 0.3699008, -1.697631, 0.8705882, 1, 0, 1,
-0.9461322, 0.6384981, -2.000811, 0.8666667, 1, 0, 1,
-0.9432302, -0.5574659, -1.33272, 0.8588235, 1, 0, 1,
-0.9361591, 0.5776494, -1.478922, 0.854902, 1, 0, 1,
-0.9335954, 0.5751463, -0.6220787, 0.8470588, 1, 0, 1,
-0.9327503, -0.5010769, -2.679333, 0.8431373, 1, 0, 1,
-0.9288424, 0.483254, -1.942633, 0.8352941, 1, 0, 1,
-0.9178221, -0.5280879, -1.584459, 0.8313726, 1, 0, 1,
-0.9091393, -1.846746, -2.711985, 0.8235294, 1, 0, 1,
-0.904688, -0.04776675, -1.533071, 0.8196079, 1, 0, 1,
-0.9039339, -1.711465, -2.928884, 0.8117647, 1, 0, 1,
-0.9023721, 1.14321, -1.086261, 0.8078431, 1, 0, 1,
-0.8993812, 0.4051378, 0.5630698, 0.8, 1, 0, 1,
-0.8977483, 0.9099663, -0.9263933, 0.7921569, 1, 0, 1,
-0.8913938, -0.4523302, -1.90427, 0.7882353, 1, 0, 1,
-0.8911461, 1.781047, 0.005326035, 0.7803922, 1, 0, 1,
-0.8902711, 0.6464919, -1.383872, 0.7764706, 1, 0, 1,
-0.8858767, 0.8740013, -3.389484, 0.7686275, 1, 0, 1,
-0.8813525, -0.1922484, -1.736798, 0.7647059, 1, 0, 1,
-0.878148, 0.1832757, -1.368597, 0.7568628, 1, 0, 1,
-0.8767612, 0.449421, -0.3837112, 0.7529412, 1, 0, 1,
-0.8766381, 0.4539835, -1.558859, 0.7450981, 1, 0, 1,
-0.8687035, -0.7629152, -3.385666, 0.7411765, 1, 0, 1,
-0.864799, -1.31979, -4.729419, 0.7333333, 1, 0, 1,
-0.8617858, -2.142539, -4.934534, 0.7294118, 1, 0, 1,
-0.859349, -0.8690419, -3.183332, 0.7215686, 1, 0, 1,
-0.8513795, -1.017652, -1.932389, 0.7176471, 1, 0, 1,
-0.8504422, 0.2169324, -0.5200351, 0.7098039, 1, 0, 1,
-0.8445839, -0.7186268, -1.993821, 0.7058824, 1, 0, 1,
-0.8441558, 0.3790952, 0.2261021, 0.6980392, 1, 0, 1,
-0.8413725, -1.28712, -3.849794, 0.6901961, 1, 0, 1,
-0.8404912, -1.823652, -2.931337, 0.6862745, 1, 0, 1,
-0.8375245, -0.6858077, -0.5223038, 0.6784314, 1, 0, 1,
-0.8361982, -0.6513122, -2.791148, 0.6745098, 1, 0, 1,
-0.8261145, -0.6223223, -0.9671842, 0.6666667, 1, 0, 1,
-0.825769, -0.9160896, -2.805877, 0.6627451, 1, 0, 1,
-0.823427, 1.392262, 1.188731, 0.654902, 1, 0, 1,
-0.8213063, -0.5683801, -2.167014, 0.6509804, 1, 0, 1,
-0.8211959, -0.5152798, -2.736051, 0.6431373, 1, 0, 1,
-0.8207303, -0.6093824, -0.8287652, 0.6392157, 1, 0, 1,
-0.8157346, -0.6476222, -3.118658, 0.6313726, 1, 0, 1,
-0.8146681, 0.1422617, -2.99044, 0.627451, 1, 0, 1,
-0.8115637, 0.5148096, -0.9839079, 0.6196079, 1, 0, 1,
-0.8112333, 2.013949, -0.618184, 0.6156863, 1, 0, 1,
-0.8054105, -0.03402368, -1.459498, 0.6078432, 1, 0, 1,
-0.801697, 1.48772, -2.416473, 0.6039216, 1, 0, 1,
-0.7965913, 1.627512, -1.046784, 0.5960785, 1, 0, 1,
-0.7918128, -1.134988, -2.148102, 0.5882353, 1, 0, 1,
-0.7867306, 0.9511424, 0.001099426, 0.5843138, 1, 0, 1,
-0.7864618, 0.8999261, -2.272297, 0.5764706, 1, 0, 1,
-0.7792743, 0.5604471, 0.4826387, 0.572549, 1, 0, 1,
-0.7785105, -2.055235, -2.522187, 0.5647059, 1, 0, 1,
-0.7760661, 0.1231422, -2.014378, 0.5607843, 1, 0, 1,
-0.7622386, -1.825883, -5.11079, 0.5529412, 1, 0, 1,
-0.7607134, -0.255141, -2.015336, 0.5490196, 1, 0, 1,
-0.7603841, 0.8566292, -0.5888528, 0.5411765, 1, 0, 1,
-0.7542425, 0.6811434, 0.2595951, 0.5372549, 1, 0, 1,
-0.7530082, -0.5345847, -1.683129, 0.5294118, 1, 0, 1,
-0.7509278, 0.1864369, -1.954888, 0.5254902, 1, 0, 1,
-0.7497107, -0.3137488, -1.950631, 0.5176471, 1, 0, 1,
-0.7470766, -0.4794315, -0.9022929, 0.5137255, 1, 0, 1,
-0.7410567, -1.812383, -4.249632, 0.5058824, 1, 0, 1,
-0.739413, 0.277406, -1.54742, 0.5019608, 1, 0, 1,
-0.7318879, 0.03248408, -1.869056, 0.4941176, 1, 0, 1,
-0.7249817, -0.2245043, -2.134982, 0.4862745, 1, 0, 1,
-0.7231544, -0.4289246, -2.012213, 0.4823529, 1, 0, 1,
-0.7229812, 0.1532829, 1.060121, 0.4745098, 1, 0, 1,
-0.7224317, -0.2859731, -2.41482, 0.4705882, 1, 0, 1,
-0.7169035, -1.094697, -3.172679, 0.4627451, 1, 0, 1,
-0.7157299, -0.8128325, -1.874529, 0.4588235, 1, 0, 1,
-0.7079127, 1.29683, 0.05951273, 0.4509804, 1, 0, 1,
-0.7043651, 0.7404488, -1.160231, 0.4470588, 1, 0, 1,
-0.7037913, 0.08813267, -2.248527, 0.4392157, 1, 0, 1,
-0.7037425, -0.8411741, -3.487549, 0.4352941, 1, 0, 1,
-0.6986387, -0.02770584, -1.94225, 0.427451, 1, 0, 1,
-0.6983847, -0.7183015, -2.068542, 0.4235294, 1, 0, 1,
-0.6965465, -0.7475917, -1.148429, 0.4156863, 1, 0, 1,
-0.6955327, 0.8009836, -0.7073394, 0.4117647, 1, 0, 1,
-0.6914116, -1.133268, -4.708714, 0.4039216, 1, 0, 1,
-0.6896104, -0.9287044, -2.455394, 0.3960784, 1, 0, 1,
-0.6874143, 0.469377, 0.3053912, 0.3921569, 1, 0, 1,
-0.6853776, -0.7808158, -2.800566, 0.3843137, 1, 0, 1,
-0.6823851, 0.1457063, -2.658932, 0.3803922, 1, 0, 1,
-0.6777788, -0.4090097, -1.641326, 0.372549, 1, 0, 1,
-0.6761493, 2.412939, -0.8772817, 0.3686275, 1, 0, 1,
-0.6755314, 0.5221549, -0.7701743, 0.3607843, 1, 0, 1,
-0.6752784, -1.541337, -1.921673, 0.3568628, 1, 0, 1,
-0.6721537, -2.102802, -2.265007, 0.3490196, 1, 0, 1,
-0.6689555, 1.104318, -1.24804, 0.345098, 1, 0, 1,
-0.6623144, 0.0162863, -0.5975645, 0.3372549, 1, 0, 1,
-0.6609327, -1.771219, -3.012641, 0.3333333, 1, 0, 1,
-0.6608073, 1.244287, -0.8414904, 0.3254902, 1, 0, 1,
-0.6502522, 0.8568762, 1.529423, 0.3215686, 1, 0, 1,
-0.6500458, 1.54468, 0.2959634, 0.3137255, 1, 0, 1,
-0.6479028, 0.5943744, -1.579971, 0.3098039, 1, 0, 1,
-0.6445541, 0.7451545, -1.433641, 0.3019608, 1, 0, 1,
-0.6444231, 0.5127193, -0.2251419, 0.2941177, 1, 0, 1,
-0.6382608, -0.7935048, -2.767601, 0.2901961, 1, 0, 1,
-0.6357739, -1.338127, -2.829334, 0.282353, 1, 0, 1,
-0.6348099, -0.6609367, -1.777279, 0.2784314, 1, 0, 1,
-0.6344444, -0.5598108, -2.636182, 0.2705882, 1, 0, 1,
-0.6335155, -0.865405, -2.932696, 0.2666667, 1, 0, 1,
-0.6316227, 0.6322246, 1.168007, 0.2588235, 1, 0, 1,
-0.6277066, 0.06315124, -1.900803, 0.254902, 1, 0, 1,
-0.6261712, -2.407438, -4.127133, 0.2470588, 1, 0, 1,
-0.6246682, 0.7931188, 1.769756, 0.2431373, 1, 0, 1,
-0.6245959, -0.935574, -1.610164, 0.2352941, 1, 0, 1,
-0.6217468, -1.831697, -3.688162, 0.2313726, 1, 0, 1,
-0.6113887, 0.3482442, -0.8069686, 0.2235294, 1, 0, 1,
-0.6088866, 0.04776135, -0.6172731, 0.2196078, 1, 0, 1,
-0.6080273, 1.07399, -1.662777, 0.2117647, 1, 0, 1,
-0.6079664, -0.6439664, -1.002812, 0.2078431, 1, 0, 1,
-0.6068839, -2.323263, -2.487266, 0.2, 1, 0, 1,
-0.6054766, 1.572532, -1.714118, 0.1921569, 1, 0, 1,
-0.6044872, -0.8421327, -1.565139, 0.1882353, 1, 0, 1,
-0.601727, 0.2673212, -1.86016, 0.1803922, 1, 0, 1,
-0.5946899, -0.2716606, -3.408082, 0.1764706, 1, 0, 1,
-0.582277, 2.45824, -1.011795, 0.1686275, 1, 0, 1,
-0.5810779, -0.8559022, -2.842669, 0.1647059, 1, 0, 1,
-0.5810497, 0.9641053, -1.616064, 0.1568628, 1, 0, 1,
-0.566194, -0.7473872, -1.960673, 0.1529412, 1, 0, 1,
-0.5578972, -0.2277768, -2.61511, 0.145098, 1, 0, 1,
-0.557065, -0.5607706, -1.643322, 0.1411765, 1, 0, 1,
-0.5550135, -0.4902883, -4.191735, 0.1333333, 1, 0, 1,
-0.5542527, -0.9447495, -3.002526, 0.1294118, 1, 0, 1,
-0.5527621, -1.750647, -1.064099, 0.1215686, 1, 0, 1,
-0.5510393, -0.8465279, -2.35748, 0.1176471, 1, 0, 1,
-0.5509025, -0.8582646, -2.765067, 0.1098039, 1, 0, 1,
-0.5472344, 1.672584, 0.5620226, 0.1058824, 1, 0, 1,
-0.5457351, -0.6090234, -2.757608, 0.09803922, 1, 0, 1,
-0.5453829, 1.202757, 0.9036887, 0.09019608, 1, 0, 1,
-0.5443702, 0.006248889, -2.770642, 0.08627451, 1, 0, 1,
-0.5425219, 0.4668686, -2.221781, 0.07843138, 1, 0, 1,
-0.5416296, -0.07928386, -2.476714, 0.07450981, 1, 0, 1,
-0.5405803, 1.673211, 0.988755, 0.06666667, 1, 0, 1,
-0.534008, -1.097423, -1.860435, 0.0627451, 1, 0, 1,
-0.5321935, -0.2412259, -1.690271, 0.05490196, 1, 0, 1,
-0.5287091, 1.005422, -2.513821, 0.05098039, 1, 0, 1,
-0.5213946, -0.2707921, -1.599799, 0.04313726, 1, 0, 1,
-0.5213096, -2.290432, -4.269864, 0.03921569, 1, 0, 1,
-0.5166458, 0.7764727, 0.539049, 0.03137255, 1, 0, 1,
-0.5163617, -2.294735, -3.633677, 0.02745098, 1, 0, 1,
-0.513609, 0.04247977, -2.140198, 0.01960784, 1, 0, 1,
-0.5128703, 0.08080728, -2.146921, 0.01568628, 1, 0, 1,
-0.5082635, -0.5614401, -2.693488, 0.007843138, 1, 0, 1,
-0.5065905, -1.122843, -1.288524, 0.003921569, 1, 0, 1,
-0.5054785, 0.4619452, 2.390237, 0, 1, 0.003921569, 1,
-0.5052569, -1.12831, -3.535179, 0, 1, 0.01176471, 1,
-0.5002237, 2.574547, 1.18383, 0, 1, 0.01568628, 1,
-0.4872841, 1.166604, 0.6012486, 0, 1, 0.02352941, 1,
-0.4871754, 0.9482401, -0.8473521, 0, 1, 0.02745098, 1,
-0.4850297, -1.159411, -0.8526496, 0, 1, 0.03529412, 1,
-0.4836491, 2.031052, 0.6898481, 0, 1, 0.03921569, 1,
-0.4813099, 0.9789422, 0.6257979, 0, 1, 0.04705882, 1,
-0.4695955, -0.5192193, -2.421236, 0, 1, 0.05098039, 1,
-0.4673909, 0.8716719, -2.208046, 0, 1, 0.05882353, 1,
-0.4631188, 0.4471155, -0.9880181, 0, 1, 0.0627451, 1,
-0.4626941, 1.317445, -0.2578033, 0, 1, 0.07058824, 1,
-0.4619546, -0.9090455, -2.26079, 0, 1, 0.07450981, 1,
-0.4600996, 0.1529378, -2.067932, 0, 1, 0.08235294, 1,
-0.4574108, -2.162246, -4.479078, 0, 1, 0.08627451, 1,
-0.4569103, -0.7501901, -3.244204, 0, 1, 0.09411765, 1,
-0.4551581, -1.593107, -2.800513, 0, 1, 0.1019608, 1,
-0.4535951, 0.2775781, 0.2982513, 0, 1, 0.1058824, 1,
-0.4509218, -0.5640929, -2.753155, 0, 1, 0.1137255, 1,
-0.4456832, -1.100235, -3.963193, 0, 1, 0.1176471, 1,
-0.4338669, -0.8295761, -2.027888, 0, 1, 0.1254902, 1,
-0.4293856, 1.210737, -0.3634011, 0, 1, 0.1294118, 1,
-0.4251506, 0.6058368, 1.054461, 0, 1, 0.1372549, 1,
-0.4203421, 0.225045, -2.680777, 0, 1, 0.1411765, 1,
-0.41798, -0.4882589, -2.687614, 0, 1, 0.1490196, 1,
-0.4158301, -1.904697, -4.15948, 0, 1, 0.1529412, 1,
-0.4145927, 0.924352, -0.5502444, 0, 1, 0.1607843, 1,
-0.4110983, -0.3585462, -2.014226, 0, 1, 0.1647059, 1,
-0.4109631, -1.196021, -1.185674, 0, 1, 0.172549, 1,
-0.4056889, -0.4764712, -1.660199, 0, 1, 0.1764706, 1,
-0.4046525, 0.2430182, -0.1512119, 0, 1, 0.1843137, 1,
-0.4029877, 0.6148019, -0.1329536, 0, 1, 0.1882353, 1,
-0.4016988, -0.93626, -1.696045, 0, 1, 0.1960784, 1,
-0.3976854, -0.4030464, -1.099122, 0, 1, 0.2039216, 1,
-0.3947061, 1.251818, 1.105989, 0, 1, 0.2078431, 1,
-0.3937025, 0.3200715, -1.384104, 0, 1, 0.2156863, 1,
-0.3904428, -2.306369, -3.122519, 0, 1, 0.2196078, 1,
-0.3888687, 0.3652841, -1.670049, 0, 1, 0.227451, 1,
-0.3862161, -0.4946071, -1.036238, 0, 1, 0.2313726, 1,
-0.3849053, -0.5869747, -1.553284, 0, 1, 0.2392157, 1,
-0.3837927, -1.831262, -2.178983, 0, 1, 0.2431373, 1,
-0.3764911, -0.6901697, -2.990608, 0, 1, 0.2509804, 1,
-0.3739642, -1.031304, -1.660705, 0, 1, 0.254902, 1,
-0.3739347, -0.2800556, -3.856112, 0, 1, 0.2627451, 1,
-0.3738025, 1.948113, -0.3022861, 0, 1, 0.2666667, 1,
-0.3707737, -0.4520003, -1.378272, 0, 1, 0.2745098, 1,
-0.3687147, 0.5550778, -0.7865419, 0, 1, 0.2784314, 1,
-0.3682572, 0.1036552, -2.1232, 0, 1, 0.2862745, 1,
-0.3676031, -0.4125493, -1.736863, 0, 1, 0.2901961, 1,
-0.3640659, 0.3570018, 0.9173613, 0, 1, 0.2980392, 1,
-0.3613622, -0.8423422, -3.115727, 0, 1, 0.3058824, 1,
-0.3590558, -0.795948, -3.507543, 0, 1, 0.3098039, 1,
-0.3576857, -0.900961, -3.248759, 0, 1, 0.3176471, 1,
-0.356254, -0.3164417, -2.665348, 0, 1, 0.3215686, 1,
-0.3480199, -2.09279, -1.802953, 0, 1, 0.3294118, 1,
-0.3461544, -0.4749306, -1.874944, 0, 1, 0.3333333, 1,
-0.342514, -0.6301268, -2.660566, 0, 1, 0.3411765, 1,
-0.3423594, 0.6342891, 0.5765793, 0, 1, 0.345098, 1,
-0.3396063, 0.05254629, -0.2569849, 0, 1, 0.3529412, 1,
-0.3383792, -0.5154361, -0.3610764, 0, 1, 0.3568628, 1,
-0.3336022, -0.1984062, -1.751637, 0, 1, 0.3647059, 1,
-0.3321831, -1.147082, -1.33271, 0, 1, 0.3686275, 1,
-0.3289463, 1.129123, -0.1089964, 0, 1, 0.3764706, 1,
-0.3252928, 0.1340711, -1.14339, 0, 1, 0.3803922, 1,
-0.3217468, 0.7739177, -2.153422, 0, 1, 0.3882353, 1,
-0.3195156, 1.434944, -1.918941, 0, 1, 0.3921569, 1,
-0.3153497, -1.691144, -3.342127, 0, 1, 0.4, 1,
-0.3086537, 1.790083, -0.191162, 0, 1, 0.4078431, 1,
-0.3077005, 0.605555, -0.7109309, 0, 1, 0.4117647, 1,
-0.297713, -0.3476414, -2.306708, 0, 1, 0.4196078, 1,
-0.2971985, 0.9735312, -0.7346708, 0, 1, 0.4235294, 1,
-0.2959051, 0.7023294, 0.4205921, 0, 1, 0.4313726, 1,
-0.2921294, 0.6505041, -0.3535821, 0, 1, 0.4352941, 1,
-0.2920544, 1.695415, -0.5674684, 0, 1, 0.4431373, 1,
-0.2920391, -0.4201445, -2.417891, 0, 1, 0.4470588, 1,
-0.2917251, -2.498659, -2.476828, 0, 1, 0.454902, 1,
-0.2833891, -1.986301, -1.434436, 0, 1, 0.4588235, 1,
-0.2752454, -1.752621, -4.004874, 0, 1, 0.4666667, 1,
-0.2728507, 0.1888908, -2.32138, 0, 1, 0.4705882, 1,
-0.2721861, -0.8860977, -2.164213, 0, 1, 0.4784314, 1,
-0.2708952, 1.0165, -0.2882085, 0, 1, 0.4823529, 1,
-0.2692856, -0.50567, -0.8124739, 0, 1, 0.4901961, 1,
-0.2675754, 1.151087, 1.556692, 0, 1, 0.4941176, 1,
-0.2650194, 0.4359684, -0.9249428, 0, 1, 0.5019608, 1,
-0.2641096, -0.3578857, -1.941936, 0, 1, 0.509804, 1,
-0.2639859, -0.06860236, -2.84903, 0, 1, 0.5137255, 1,
-0.2600907, -0.8627424, -2.025418, 0, 1, 0.5215687, 1,
-0.2580145, -1.541708, -3.200339, 0, 1, 0.5254902, 1,
-0.2548423, -1.165936, -2.869272, 0, 1, 0.5333334, 1,
-0.2509402, 0.5303679, -2.352248, 0, 1, 0.5372549, 1,
-0.2467748, 1.483282, 0.1068008, 0, 1, 0.5450981, 1,
-0.2424224, -0.9617038, -3.472272, 0, 1, 0.5490196, 1,
-0.2420013, 0.6572024, -1.10055, 0, 1, 0.5568628, 1,
-0.2373283, -1.079574, -1.197462, 0, 1, 0.5607843, 1,
-0.2357164, -0.9209217, -3.592401, 0, 1, 0.5686275, 1,
-0.230592, -0.9665051, -3.784323, 0, 1, 0.572549, 1,
-0.227359, 1.306553, 0.1755472, 0, 1, 0.5803922, 1,
-0.2262378, -0.194242, -3.972575, 0, 1, 0.5843138, 1,
-0.2260809, -0.6507649, -4.62826, 0, 1, 0.5921569, 1,
-0.2241053, 0.2837892, -0.4084548, 0, 1, 0.5960785, 1,
-0.2178272, -0.08428086, -2.876467, 0, 1, 0.6039216, 1,
-0.2175813, 2.732329, -1.843338, 0, 1, 0.6117647, 1,
-0.2171526, 0.2347536, 0.3496181, 0, 1, 0.6156863, 1,
-0.2145845, -0.9427826, -3.133106, 0, 1, 0.6235294, 1,
-0.2057822, -1.060458, -2.199655, 0, 1, 0.627451, 1,
-0.2001862, -0.313716, -3.718163, 0, 1, 0.6352941, 1,
-0.1968853, 0.1762996, -1.234376, 0, 1, 0.6392157, 1,
-0.1951891, 1.764936, 0.5479578, 0, 1, 0.6470588, 1,
-0.1948895, -0.8933232, -3.699767, 0, 1, 0.6509804, 1,
-0.1941672, 0.4571033, 0.6824765, 0, 1, 0.6588235, 1,
-0.1940366, -0.01443201, -0.8347504, 0, 1, 0.6627451, 1,
-0.1875018, 0.2651193, -0.2159677, 0, 1, 0.6705883, 1,
-0.1860522, -0.2757614, -2.788292, 0, 1, 0.6745098, 1,
-0.1810294, 2.054003, -1.143199, 0, 1, 0.682353, 1,
-0.1799422, 1.496245, -0.06882581, 0, 1, 0.6862745, 1,
-0.1794194, -0.9603902, -3.751139, 0, 1, 0.6941177, 1,
-0.1732698, -0.8471142, -3.512345, 0, 1, 0.7019608, 1,
-0.1718716, -0.6605027, -2.839406, 0, 1, 0.7058824, 1,
-0.1714388, -0.8575867, -2.107596, 0, 1, 0.7137255, 1,
-0.1674914, 1.334525, 0.259071, 0, 1, 0.7176471, 1,
-0.1542256, 0.5136827, 2.22517, 0, 1, 0.7254902, 1,
-0.1511951, 2.28204, 0.6140927, 0, 1, 0.7294118, 1,
-0.1497899, -1.49351, -3.391333, 0, 1, 0.7372549, 1,
-0.146907, -1.431343, -3.446832, 0, 1, 0.7411765, 1,
-0.1465119, -0.3979332, -2.780247, 0, 1, 0.7490196, 1,
-0.1362835, -0.9692566, -2.79336, 0, 1, 0.7529412, 1,
-0.1304174, -0.2121672, -2.871674, 0, 1, 0.7607843, 1,
-0.1297003, 0.5186446, -0.9947956, 0, 1, 0.7647059, 1,
-0.1285804, -0.1174083, -2.072843, 0, 1, 0.772549, 1,
-0.1249465, -0.3988502, -2.096939, 0, 1, 0.7764706, 1,
-0.124728, 1.576469, -1.357068, 0, 1, 0.7843137, 1,
-0.1245609, 0.7640467, 2.18233, 0, 1, 0.7882353, 1,
-0.1156183, -0.5158406, -4.146972, 0, 1, 0.7960784, 1,
-0.113566, 0.2588044, -0.2685983, 0, 1, 0.8039216, 1,
-0.1133523, 0.3168688, -0.1962656, 0, 1, 0.8078431, 1,
-0.1110864, 0.2500353, -0.5869259, 0, 1, 0.8156863, 1,
-0.1109129, 0.5609068, 0.5300958, 0, 1, 0.8196079, 1,
-0.106247, -0.4277956, -3.030713, 0, 1, 0.827451, 1,
-0.1053393, 0.322711, 0.3686547, 0, 1, 0.8313726, 1,
-0.1021832, 1.027092, -0.5618205, 0, 1, 0.8392157, 1,
-0.1013997, 0.1434099, 0.6767193, 0, 1, 0.8431373, 1,
-0.09804674, -0.103757, -1.552775, 0, 1, 0.8509804, 1,
-0.09617046, -0.2559598, -3.282772, 0, 1, 0.854902, 1,
-0.0959303, 1.136859, 0.1660553, 0, 1, 0.8627451, 1,
-0.09589285, -1.599651, -2.822251, 0, 1, 0.8666667, 1,
-0.08887794, 0.5753921, -2.934729, 0, 1, 0.8745098, 1,
-0.08572865, 0.5007108, -0.00588874, 0, 1, 0.8784314, 1,
-0.08461773, 1.044735, 1.005868, 0, 1, 0.8862745, 1,
-0.07982819, 0.8628775, 0.7470488, 0, 1, 0.8901961, 1,
-0.07407377, -0.3697338, -3.540335, 0, 1, 0.8980392, 1,
-0.06918568, -1.565104, -2.947773, 0, 1, 0.9058824, 1,
-0.06541713, -0.7423681, -3.592279, 0, 1, 0.9098039, 1,
-0.06452819, -1.47086, -2.392243, 0, 1, 0.9176471, 1,
-0.06259082, 0.8694471, 0.5810506, 0, 1, 0.9215686, 1,
-0.05806695, 0.2514536, -0.8027965, 0, 1, 0.9294118, 1,
-0.05378123, -0.9274176, -3.922554, 0, 1, 0.9333333, 1,
-0.05214947, -1.326656, -1.940626, 0, 1, 0.9411765, 1,
-0.0501184, 1.785686, -0.3104784, 0, 1, 0.945098, 1,
-0.04951578, -1.221749, -2.449685, 0, 1, 0.9529412, 1,
-0.04829059, -0.4572996, -2.235383, 0, 1, 0.9568627, 1,
-0.04754567, 0.3157206, 0.09139246, 0, 1, 0.9647059, 1,
-0.04608802, -0.2745761, -3.433678, 0, 1, 0.9686275, 1,
-0.04506999, -0.9107565, -4.31316, 0, 1, 0.9764706, 1,
-0.04268532, -1.375017, -3.066869, 0, 1, 0.9803922, 1,
-0.0401721, -0.731164, -3.798736, 0, 1, 0.9882353, 1,
-0.03904277, 0.2236005, 0.3920818, 0, 1, 0.9921569, 1,
-0.03816061, -0.590588, -2.056274, 0, 1, 1, 1,
-0.03738794, 1.570868, -1.889386, 0, 0.9921569, 1, 1,
-0.03640524, -0.01828759, -1.099483, 0, 0.9882353, 1, 1,
-0.02903697, -0.4509051, -1.173729, 0, 0.9803922, 1, 1,
-0.02813935, -1.286858, -1.919416, 0, 0.9764706, 1, 1,
-0.02385152, -0.8653522, -3.374465, 0, 0.9686275, 1, 1,
-0.02050232, 0.1787316, -1.102699, 0, 0.9647059, 1, 1,
-0.01903772, 0.1101809, -0.1693754, 0, 0.9568627, 1, 1,
-0.01419799, -0.07594129, -4.868722, 0, 0.9529412, 1, 1,
-0.00758976, 0.9546651, -1.599995, 0, 0.945098, 1, 1,
-0.006167571, -0.02471242, -2.354559, 0, 0.9411765, 1, 1,
-0.004060065, -0.03878789, -1.847996, 0, 0.9333333, 1, 1,
0.0007830549, -0.4182122, 3.516947, 0, 0.9294118, 1, 1,
0.0009623746, -0.7129002, 2.416799, 0, 0.9215686, 1, 1,
0.001612756, 0.1965342, 1.153607, 0, 0.9176471, 1, 1,
0.003028206, -0.208688, 2.139071, 0, 0.9098039, 1, 1,
0.01262995, -1.699366, 3.99665, 0, 0.9058824, 1, 1,
0.01466416, 0.4482851, 0.2905596, 0, 0.8980392, 1, 1,
0.01579462, -0.8148237, 3.619114, 0, 0.8901961, 1, 1,
0.02280765, 0.5375096, -1.37939, 0, 0.8862745, 1, 1,
0.02581749, 0.3954276, 0.02382757, 0, 0.8784314, 1, 1,
0.02750383, 0.2308271, -0.227481, 0, 0.8745098, 1, 1,
0.02786085, -1.128094, 2.595127, 0, 0.8666667, 1, 1,
0.02856627, 0.08408578, 0.5997175, 0, 0.8627451, 1, 1,
0.03024836, 0.2086182, 0.4885678, 0, 0.854902, 1, 1,
0.03074299, 0.07348577, -0.6555552, 0, 0.8509804, 1, 1,
0.03672684, -1.379639, 2.805535, 0, 0.8431373, 1, 1,
0.04482972, 1.353433, 0.3998976, 0, 0.8392157, 1, 1,
0.05150906, -2.372631, 2.566319, 0, 0.8313726, 1, 1,
0.05393799, 0.9607481, -0.8310558, 0, 0.827451, 1, 1,
0.05447141, 0.7952133, 0.4776971, 0, 0.8196079, 1, 1,
0.05463181, 0.817612, -0.08145665, 0, 0.8156863, 1, 1,
0.05801896, -0.3106333, 2.888235, 0, 0.8078431, 1, 1,
0.06291743, 0.4559678, 0.3535973, 0, 0.8039216, 1, 1,
0.06465086, -0.6350282, 3.081456, 0, 0.7960784, 1, 1,
0.06533396, -0.9800301, 2.527108, 0, 0.7882353, 1, 1,
0.06596199, 0.3852563, 1.575932, 0, 0.7843137, 1, 1,
0.06928188, -1.304781, 1.562307, 0, 0.7764706, 1, 1,
0.07147904, 0.4942453, 0.8813153, 0, 0.772549, 1, 1,
0.07231833, 0.2602215, -0.4017478, 0, 0.7647059, 1, 1,
0.08112485, 0.5943359, -0.7258415, 0, 0.7607843, 1, 1,
0.08186062, 1.759423, 0.6470355, 0, 0.7529412, 1, 1,
0.09491888, -0.7558907, 0.8546773, 0, 0.7490196, 1, 1,
0.09562314, 2.507364, 1.175256, 0, 0.7411765, 1, 1,
0.09677507, -1.133443, 2.962368, 0, 0.7372549, 1, 1,
0.09795873, 1.61658, 0.1321183, 0, 0.7294118, 1, 1,
0.1001834, -0.0426606, -0.2826144, 0, 0.7254902, 1, 1,
0.1062321, 0.8006734, 0.9859774, 0, 0.7176471, 1, 1,
0.106721, -0.02060601, 2.108545, 0, 0.7137255, 1, 1,
0.1069487, -1.310087, 2.780617, 0, 0.7058824, 1, 1,
0.1074507, 0.4183624, -0.1540586, 0, 0.6980392, 1, 1,
0.1089797, -0.05425216, 1.513907, 0, 0.6941177, 1, 1,
0.1122963, -1.265804, 2.699134, 0, 0.6862745, 1, 1,
0.1151393, -1.493509, 3.019079, 0, 0.682353, 1, 1,
0.1153984, 0.7607527, -1.741932, 0, 0.6745098, 1, 1,
0.1174618, -1.654463, 4.798307, 0, 0.6705883, 1, 1,
0.1178043, -0.0621189, 2.725039, 0, 0.6627451, 1, 1,
0.1224678, -0.1124503, 1.654579, 0, 0.6588235, 1, 1,
0.126513, 0.8820644, -1.205532, 0, 0.6509804, 1, 1,
0.1293487, -0.6593206, 2.581683, 0, 0.6470588, 1, 1,
0.1313789, -0.04113797, 0.8109257, 0, 0.6392157, 1, 1,
0.1319583, -0.3804301, 2.577857, 0, 0.6352941, 1, 1,
0.1324321, -1.026281, 0.7551429, 0, 0.627451, 1, 1,
0.1354365, -1.131083, 5.275055, 0, 0.6235294, 1, 1,
0.1359518, -0.9571023, 2.944274, 0, 0.6156863, 1, 1,
0.1372464, 0.8397467, -0.1623879, 0, 0.6117647, 1, 1,
0.1450913, 0.5920444, 0.708735, 0, 0.6039216, 1, 1,
0.1452631, 0.9068965, 0.6167243, 0, 0.5960785, 1, 1,
0.156003, -0.4369359, 2.002283, 0, 0.5921569, 1, 1,
0.1568839, 0.277006, 0.3957092, 0, 0.5843138, 1, 1,
0.1589493, -0.9992073, 3.063502, 0, 0.5803922, 1, 1,
0.1629279, -0.1750731, 2.979496, 0, 0.572549, 1, 1,
0.1659418, -0.4723253, 2.423094, 0, 0.5686275, 1, 1,
0.1675194, -0.4748804, 4.737195, 0, 0.5607843, 1, 1,
0.1702328, -1.46225, 1.646914, 0, 0.5568628, 1, 1,
0.1839766, -0.1836652, 2.256797, 0, 0.5490196, 1, 1,
0.1889308, 1.230216, -1.456741, 0, 0.5450981, 1, 1,
0.1889458, -0.5119236, 3.048038, 0, 0.5372549, 1, 1,
0.1909435, 0.3743849, -0.3060434, 0, 0.5333334, 1, 1,
0.2000093, 0.06697923, 0.4708614, 0, 0.5254902, 1, 1,
0.2009324, 1.030934, -0.6589922, 0, 0.5215687, 1, 1,
0.2028712, 0.7455526, -0.9690145, 0, 0.5137255, 1, 1,
0.203061, 0.2126121, 1.184577, 0, 0.509804, 1, 1,
0.2095836, -0.9101911, 2.233246, 0, 0.5019608, 1, 1,
0.2154959, 0.06446818, 0.7741454, 0, 0.4941176, 1, 1,
0.2168928, 0.7487716, 0.5766777, 0, 0.4901961, 1, 1,
0.2211097, 0.465904, 0.4252569, 0, 0.4823529, 1, 1,
0.2292555, -0.7447569, 1.253619, 0, 0.4784314, 1, 1,
0.2326912, 0.1325279, 1.664531, 0, 0.4705882, 1, 1,
0.2338967, 0.3333596, 0.623693, 0, 0.4666667, 1, 1,
0.2383761, 0.005888421, 1.293476, 0, 0.4588235, 1, 1,
0.2406109, -0.6450809, 3.346732, 0, 0.454902, 1, 1,
0.2437615, 1.416527, -0.8136567, 0, 0.4470588, 1, 1,
0.2437816, -0.1410193, 1.156983, 0, 0.4431373, 1, 1,
0.2443225, 1.117463, 1.175348, 0, 0.4352941, 1, 1,
0.2454958, -0.2559212, 1.266109, 0, 0.4313726, 1, 1,
0.2473807, 0.2221142, 0.765115, 0, 0.4235294, 1, 1,
0.247553, -0.9063807, 1.254719, 0, 0.4196078, 1, 1,
0.2497523, 1.362391, 0.3106709, 0, 0.4117647, 1, 1,
0.2543948, -0.1964682, 2.875172, 0, 0.4078431, 1, 1,
0.2672049, -0.7597159, 2.513036, 0, 0.4, 1, 1,
0.2678933, -1.018523, 2.165041, 0, 0.3921569, 1, 1,
0.2707412, 0.1361485, 0.2355527, 0, 0.3882353, 1, 1,
0.2783124, 0.7960916, 0.07816526, 0, 0.3803922, 1, 1,
0.2797954, -0.7051975, 4.233003, 0, 0.3764706, 1, 1,
0.2847856, -0.4778143, 1.989598, 0, 0.3686275, 1, 1,
0.2895517, -0.4590006, 4.323848, 0, 0.3647059, 1, 1,
0.2953177, 1.34808, 0.0356157, 0, 0.3568628, 1, 1,
0.2954907, -1.77308, 2.521013, 0, 0.3529412, 1, 1,
0.2984028, 0.4149824, 1.915641, 0, 0.345098, 1, 1,
0.3087552, 2.010723, 0.00451329, 0, 0.3411765, 1, 1,
0.3125632, -0.8191558, 3.317782, 0, 0.3333333, 1, 1,
0.3207186, -1.003142, 3.169958, 0, 0.3294118, 1, 1,
0.3238232, 1.652046, 0.4604747, 0, 0.3215686, 1, 1,
0.3241782, -1.240663, 1.155236, 0, 0.3176471, 1, 1,
0.3314391, 0.06799113, 1.424031, 0, 0.3098039, 1, 1,
0.3320983, 0.3740255, 1.412074, 0, 0.3058824, 1, 1,
0.3324933, 0.1551937, 0.9878903, 0, 0.2980392, 1, 1,
0.3347374, 1.194559, 0.287902, 0, 0.2901961, 1, 1,
0.3381496, 0.2782559, 1.23032, 0, 0.2862745, 1, 1,
0.3447888, 0.8320845, -0.8437377, 0, 0.2784314, 1, 1,
0.3476398, 0.0749335, 1.72285, 0, 0.2745098, 1, 1,
0.3478243, 2.068812, 0.6789899, 0, 0.2666667, 1, 1,
0.3500129, -1.01613, 2.773341, 0, 0.2627451, 1, 1,
0.3523549, 0.3267066, 0.2315045, 0, 0.254902, 1, 1,
0.3637705, 0.479663, 1.014727, 0, 0.2509804, 1, 1,
0.3669529, 1.66113, 0.5335835, 0, 0.2431373, 1, 1,
0.3675392, 0.495529, 2.345402, 0, 0.2392157, 1, 1,
0.3776493, -0.08335572, 0.4416342, 0, 0.2313726, 1, 1,
0.3797855, 0.9076221, 0.8863125, 0, 0.227451, 1, 1,
0.3803864, -1.196909, 3.378505, 0, 0.2196078, 1, 1,
0.3812052, -1.443459, 2.957726, 0, 0.2156863, 1, 1,
0.389756, -1.183612, 2.227172, 0, 0.2078431, 1, 1,
0.3937958, 1.861709, 1.292892, 0, 0.2039216, 1, 1,
0.3943365, -0.04059928, 1.791554, 0, 0.1960784, 1, 1,
0.4002592, 0.3499021, -1.525307, 0, 0.1882353, 1, 1,
0.4006802, 1.610124, 0.3133585, 0, 0.1843137, 1, 1,
0.4025443, -0.01092278, 1.048362, 0, 0.1764706, 1, 1,
0.4044408, -0.7347792, 4.431044, 0, 0.172549, 1, 1,
0.4091416, -0.3057131, 2.747171, 0, 0.1647059, 1, 1,
0.4107216, -0.5263917, 2.461854, 0, 0.1607843, 1, 1,
0.4122537, 1.118025, -0.3560693, 0, 0.1529412, 1, 1,
0.4193113, 0.7868738, 0.4412031, 0, 0.1490196, 1, 1,
0.4209003, 1.092374, -0.1565628, 0, 0.1411765, 1, 1,
0.4233474, -0.8913068, 3.349985, 0, 0.1372549, 1, 1,
0.4241063, 1.265066, -0.5901707, 0, 0.1294118, 1, 1,
0.4266572, -0.8087086, 2.065507, 0, 0.1254902, 1, 1,
0.427257, 0.4382279, 1.791827, 0, 0.1176471, 1, 1,
0.4395007, 2.499533, -1.803299, 0, 0.1137255, 1, 1,
0.4402773, 1.494795, -0.03327212, 0, 0.1058824, 1, 1,
0.4443167, 0.7927977, 1.299946, 0, 0.09803922, 1, 1,
0.4445715, 0.5414459, 1.448932, 0, 0.09411765, 1, 1,
0.4452331, -1.217121, 4.319688, 0, 0.08627451, 1, 1,
0.4468372, 0.8299701, -0.2136255, 0, 0.08235294, 1, 1,
0.4483629, -2.248014, 3.747306, 0, 0.07450981, 1, 1,
0.459401, 2.792824, 0.5141956, 0, 0.07058824, 1, 1,
0.4601923, -2.146691, 3.639591, 0, 0.0627451, 1, 1,
0.4622296, 0.9003501, 0.9926256, 0, 0.05882353, 1, 1,
0.4624218, -2.22438, 3.247076, 0, 0.05098039, 1, 1,
0.4633372, -1.814017, 3.141657, 0, 0.04705882, 1, 1,
0.4697548, -0.6947179, 4.543859, 0, 0.03921569, 1, 1,
0.4749973, -0.5603426, 1.766179, 0, 0.03529412, 1, 1,
0.4760613, -0.4104228, 2.224141, 0, 0.02745098, 1, 1,
0.4771758, 0.001900027, -0.3779281, 0, 0.02352941, 1, 1,
0.4774386, -0.03612505, 1.387014, 0, 0.01568628, 1, 1,
0.4795017, 0.9264699, -0.7962298, 0, 0.01176471, 1, 1,
0.4827651, -0.3736715, 1.491989, 0, 0.003921569, 1, 1,
0.484752, -0.1014065, 2.160209, 0.003921569, 0, 1, 1,
0.4849689, -2.045373, 2.322202, 0.007843138, 0, 1, 1,
0.4855109, 1.338896, -0.9357578, 0.01568628, 0, 1, 1,
0.4857789, 1.778553, -0.3688691, 0.01960784, 0, 1, 1,
0.4908167, -0.1279006, 4.28827, 0.02745098, 0, 1, 1,
0.4909803, -0.6004351, 4.419186, 0.03137255, 0, 1, 1,
0.4947382, 1.64915, -1.305653, 0.03921569, 0, 1, 1,
0.4958362, 0.2740067, 1.274913, 0.04313726, 0, 1, 1,
0.4962336, 1.12467, 2.647366, 0.05098039, 0, 1, 1,
0.4965181, 0.78284, 0.9569443, 0.05490196, 0, 1, 1,
0.4968342, 0.4112947, 3.51588, 0.0627451, 0, 1, 1,
0.5009243, -0.7585051, 2.620687, 0.06666667, 0, 1, 1,
0.5033758, 0.07934623, 0.6898078, 0.07450981, 0, 1, 1,
0.5039216, -0.05069138, 1.755767, 0.07843138, 0, 1, 1,
0.5056798, -0.01503974, 1.898154, 0.08627451, 0, 1, 1,
0.5074662, -0.3139491, 2.25048, 0.09019608, 0, 1, 1,
0.5077888, -0.6969714, 3.511715, 0.09803922, 0, 1, 1,
0.5082669, -1.131594, 1.717446, 0.1058824, 0, 1, 1,
0.5083498, 0.7164859, 0.07959622, 0.1098039, 0, 1, 1,
0.5148821, -1.33902, 3.1121, 0.1176471, 0, 1, 1,
0.5158826, 1.732702, -1.508138, 0.1215686, 0, 1, 1,
0.5238633, 0.8076084, 0.2651895, 0.1294118, 0, 1, 1,
0.5263789, -0.06809845, -0.08362118, 0.1333333, 0, 1, 1,
0.5278111, -0.362985, 1.788847, 0.1411765, 0, 1, 1,
0.5290912, 0.5640135, 2.455569, 0.145098, 0, 1, 1,
0.532014, 0.2452161, 2.362619, 0.1529412, 0, 1, 1,
0.5389194, -1.118819, 3.037997, 0.1568628, 0, 1, 1,
0.5400071, -0.1002299, 1.042964, 0.1647059, 0, 1, 1,
0.5406114, 0.5057054, -1.8765, 0.1686275, 0, 1, 1,
0.5447422, 0.7785587, -0.6223766, 0.1764706, 0, 1, 1,
0.5577196, -0.7279425, 0.5789467, 0.1803922, 0, 1, 1,
0.5601544, -2.257143, 3.074815, 0.1882353, 0, 1, 1,
0.561229, 0.9196084, -0.05913009, 0.1921569, 0, 1, 1,
0.5655248, 0.6246644, 2.571693, 0.2, 0, 1, 1,
0.5675604, 0.06658882, 2.833872, 0.2078431, 0, 1, 1,
0.5716536, -0.7815201, 1.798903, 0.2117647, 0, 1, 1,
0.573446, -1.054802, 1.956935, 0.2196078, 0, 1, 1,
0.576751, 1.027923, -1.760187, 0.2235294, 0, 1, 1,
0.5768633, 1.064546, -2.61009, 0.2313726, 0, 1, 1,
0.5813578, 0.8528351, 0.5182201, 0.2352941, 0, 1, 1,
0.584411, 0.1422842, 0.6883941, 0.2431373, 0, 1, 1,
0.5885401, -1.117346, 1.842722, 0.2470588, 0, 1, 1,
0.5923758, 0.02347033, 2.50279, 0.254902, 0, 1, 1,
0.5985515, 1.112695, 0.9107259, 0.2588235, 0, 1, 1,
0.6042491, 1.832658, -0.4038422, 0.2666667, 0, 1, 1,
0.6069922, 1.058952, 2.645833, 0.2705882, 0, 1, 1,
0.6073879, -0.08509704, 0.2976483, 0.2784314, 0, 1, 1,
0.6083602, -1.868764, 1.923217, 0.282353, 0, 1, 1,
0.6098072, -1.68354, 1.665, 0.2901961, 0, 1, 1,
0.6105571, 0.2840473, 1.545562, 0.2941177, 0, 1, 1,
0.6122987, -0.2341022, 2.358404, 0.3019608, 0, 1, 1,
0.6124033, -0.9833681, 4.137522, 0.3098039, 0, 1, 1,
0.6142899, -0.7649388, 2.329023, 0.3137255, 0, 1, 1,
0.6172574, -0.7793282, 2.459514, 0.3215686, 0, 1, 1,
0.620943, 0.8190772, 0.8717044, 0.3254902, 0, 1, 1,
0.6298314, 0.8973111, -0.2844278, 0.3333333, 0, 1, 1,
0.635698, 0.5409876, -0.3798724, 0.3372549, 0, 1, 1,
0.6462161, -0.6086366, 1.723075, 0.345098, 0, 1, 1,
0.6478683, 0.1719424, 2.784381, 0.3490196, 0, 1, 1,
0.6486861, -0.6186852, 3.085986, 0.3568628, 0, 1, 1,
0.650583, 1.042362, 0.2654517, 0.3607843, 0, 1, 1,
0.6506097, -0.4472051, 1.895235, 0.3686275, 0, 1, 1,
0.65128, -0.7721526, 2.475198, 0.372549, 0, 1, 1,
0.6546065, -0.759303, 1.725934, 0.3803922, 0, 1, 1,
0.663033, 0.4708903, -0.0790133, 0.3843137, 0, 1, 1,
0.6713104, -0.3193291, 1.434857, 0.3921569, 0, 1, 1,
0.6721907, -1.351549, 1.766392, 0.3960784, 0, 1, 1,
0.6749433, 1.131748, 0.568603, 0.4039216, 0, 1, 1,
0.6758882, 0.4201457, 0.4933674, 0.4117647, 0, 1, 1,
0.6759953, 0.3274077, 0.6894801, 0.4156863, 0, 1, 1,
0.6771056, -0.2197137, 0.8598852, 0.4235294, 0, 1, 1,
0.6788917, 1.022877, 0.5048336, 0.427451, 0, 1, 1,
0.6820537, -0.2129359, 1.34574, 0.4352941, 0, 1, 1,
0.6863307, 0.3765691, 0.2965779, 0.4392157, 0, 1, 1,
0.6896499, -0.4170416, 3.199188, 0.4470588, 0, 1, 1,
0.6938628, -1.957583, 1.347478, 0.4509804, 0, 1, 1,
0.6970151, 0.2771435, 2.958435, 0.4588235, 0, 1, 1,
0.6998112, 0.05422524, 2.641421, 0.4627451, 0, 1, 1,
0.700003, 0.3191399, 0.8398213, 0.4705882, 0, 1, 1,
0.7026097, 1.163927, 2.1568, 0.4745098, 0, 1, 1,
0.7068196, -0.5014884, 1.896857, 0.4823529, 0, 1, 1,
0.7198117, -1.168076, 3.519846, 0.4862745, 0, 1, 1,
0.7224734, 2.374417, 0.1105609, 0.4941176, 0, 1, 1,
0.7290643, 1.520787, 0.5644287, 0.5019608, 0, 1, 1,
0.7320801, -2.190419, 2.571647, 0.5058824, 0, 1, 1,
0.7323834, 0.06458559, 1.197864, 0.5137255, 0, 1, 1,
0.7347409, -1.241975, 3.887506, 0.5176471, 0, 1, 1,
0.7402394, 0.7759548, 0.3896913, 0.5254902, 0, 1, 1,
0.740256, 1.248333, 0.8251055, 0.5294118, 0, 1, 1,
0.7408748, -0.1931539, 1.491468, 0.5372549, 0, 1, 1,
0.7430126, -0.8642198, 2.619609, 0.5411765, 0, 1, 1,
0.746915, 0.1326385, 2.686029, 0.5490196, 0, 1, 1,
0.7504894, -0.01509655, 2.003091, 0.5529412, 0, 1, 1,
0.7517121, 1.43787, 1.271461, 0.5607843, 0, 1, 1,
0.7519951, -1.648131, 2.040579, 0.5647059, 0, 1, 1,
0.7592326, -0.5010559, 1.549257, 0.572549, 0, 1, 1,
0.760527, -1.508868, 2.235272, 0.5764706, 0, 1, 1,
0.7606639, 1.020194, 0.7500872, 0.5843138, 0, 1, 1,
0.7614164, 0.01967684, 0.8515604, 0.5882353, 0, 1, 1,
0.7658197, 0.2567188, 1.461154, 0.5960785, 0, 1, 1,
0.7675076, 0.1391001, 0.708168, 0.6039216, 0, 1, 1,
0.7691489, -0.2411988, 2.211673, 0.6078432, 0, 1, 1,
0.7692288, 0.5918497, 0.6090346, 0.6156863, 0, 1, 1,
0.7706618, -0.4687638, 2.003652, 0.6196079, 0, 1, 1,
0.7758343, -0.7082638, 1.752614, 0.627451, 0, 1, 1,
0.783063, 1.673711, 0.3998837, 0.6313726, 0, 1, 1,
0.7971018, 0.5396758, 0.692969, 0.6392157, 0, 1, 1,
0.8007235, -1.412992, 2.859314, 0.6431373, 0, 1, 1,
0.8145642, 0.2380108, -0.003748716, 0.6509804, 0, 1, 1,
0.8152709, -0.6992772, 3.427468, 0.654902, 0, 1, 1,
0.8168706, -0.2924329, 3.485801, 0.6627451, 0, 1, 1,
0.8282256, -0.2220004, 0.1255226, 0.6666667, 0, 1, 1,
0.8296778, -0.7972576, 3.285571, 0.6745098, 0, 1, 1,
0.8386125, 1.538278, 1.074419, 0.6784314, 0, 1, 1,
0.8486513, -0.9724154, 1.862042, 0.6862745, 0, 1, 1,
0.8540112, -0.09151606, 3.779118, 0.6901961, 0, 1, 1,
0.8567774, 0.4113957, 1.458399, 0.6980392, 0, 1, 1,
0.8572906, -0.7572355, 1.515279, 0.7058824, 0, 1, 1,
0.8594112, -0.5569969, 1.565325, 0.7098039, 0, 1, 1,
0.8662689, 1.320922, -0.005507667, 0.7176471, 0, 1, 1,
0.8678215, -0.9822292, 1.913478, 0.7215686, 0, 1, 1,
0.8766527, 1.472117, 1.454356, 0.7294118, 0, 1, 1,
0.8807359, -0.4166934, 2.82901, 0.7333333, 0, 1, 1,
0.8848151, -0.7840528, 2.846431, 0.7411765, 0, 1, 1,
0.8957983, -0.5541547, 2.259602, 0.7450981, 0, 1, 1,
0.8977906, -0.4200172, 2.442081, 0.7529412, 0, 1, 1,
0.9057734, -0.2843482, 2.065397, 0.7568628, 0, 1, 1,
0.9093341, 0.9662287, 0.3417352, 0.7647059, 0, 1, 1,
0.9134942, 1.052681, 1.181335, 0.7686275, 0, 1, 1,
0.9291539, 1.980182, -0.2144659, 0.7764706, 0, 1, 1,
0.930631, 0.08270316, 1.312806, 0.7803922, 0, 1, 1,
0.938875, -1.209711, 0.4439565, 0.7882353, 0, 1, 1,
0.9396066, 1.588775, 1.685749, 0.7921569, 0, 1, 1,
0.9397323, -0.8310264, 3.377469, 0.8, 0, 1, 1,
0.9407899, -0.8116668, 2.53169, 0.8078431, 0, 1, 1,
0.9419904, -1.681341, 3.225706, 0.8117647, 0, 1, 1,
0.9447109, 0.1469086, 0.3612975, 0.8196079, 0, 1, 1,
0.9493958, 0.8918707, 0.5019376, 0.8235294, 0, 1, 1,
0.9643704, -1.127712, 2.963109, 0.8313726, 0, 1, 1,
0.9668058, -0.8916388, 2.612948, 0.8352941, 0, 1, 1,
0.9688099, -0.9015425, 2.013102, 0.8431373, 0, 1, 1,
0.9715437, 1.271597, 0.005749174, 0.8470588, 0, 1, 1,
0.9718838, 0.005806773, 2.506691, 0.854902, 0, 1, 1,
0.9737084, -1.992453, 2.861036, 0.8588235, 0, 1, 1,
0.9751201, -1.252178, 2.69844, 0.8666667, 0, 1, 1,
0.979201, -0.7529026, 2.066205, 0.8705882, 0, 1, 1,
0.9851406, -1.370555, 2.016029, 0.8784314, 0, 1, 1,
0.9872863, 0.428707, 0.966382, 0.8823529, 0, 1, 1,
0.9874814, -0.9484125, 4.139985, 0.8901961, 0, 1, 1,
0.9967477, -0.5032533, 1.33788, 0.8941177, 0, 1, 1,
1.000604, -0.2483805, 0.9802689, 0.9019608, 0, 1, 1,
1.002706, -0.01236961, 0.5525012, 0.9098039, 0, 1, 1,
1.007629, -0.6875554, 3.386453, 0.9137255, 0, 1, 1,
1.008924, 0.7901804, 0.06185188, 0.9215686, 0, 1, 1,
1.013205, 1.493759, -0.4172541, 0.9254902, 0, 1, 1,
1.015255, -0.3393226, 2.758155, 0.9333333, 0, 1, 1,
1.02392, 0.2458263, 4.348888, 0.9372549, 0, 1, 1,
1.027074, 0.2666814, 1.384063, 0.945098, 0, 1, 1,
1.027791, -0.390894, 1.069593, 0.9490196, 0, 1, 1,
1.028859, -1.161819, 1.139787, 0.9568627, 0, 1, 1,
1.028981, 0.5751466, 0.5105446, 0.9607843, 0, 1, 1,
1.029148, -1.010922, 1.716297, 0.9686275, 0, 1, 1,
1.032378, -0.3209634, 0.7875257, 0.972549, 0, 1, 1,
1.035324, -2.804885, 5.108223, 0.9803922, 0, 1, 1,
1.036164, -1.99229, 0.5341724, 0.9843137, 0, 1, 1,
1.037006, 1.072907, 0.6697387, 0.9921569, 0, 1, 1,
1.043925, 0.4072971, 1.838399, 0.9960784, 0, 1, 1,
1.059556, -1.071258, 2.665655, 1, 0, 0.9960784, 1,
1.06005, -0.223263, 1.799664, 1, 0, 0.9882353, 1,
1.067128, 0.6879244, 0.1983845, 1, 0, 0.9843137, 1,
1.067311, -0.04495126, 0.940154, 1, 0, 0.9764706, 1,
1.067319, 0.3674251, 2.218023, 1, 0, 0.972549, 1,
1.068238, -1.341571, 2.331256, 1, 0, 0.9647059, 1,
1.07185, 0.04394614, 0.7090708, 1, 0, 0.9607843, 1,
1.093414, 0.8654642, -0.2284798, 1, 0, 0.9529412, 1,
1.098413, 1.211241, -0.4022602, 1, 0, 0.9490196, 1,
1.107308, 0.1385249, 2.189911, 1, 0, 0.9411765, 1,
1.112236, 0.9710454, 0.8482395, 1, 0, 0.9372549, 1,
1.115288, 0.2114464, 1.823251, 1, 0, 0.9294118, 1,
1.122095, -0.4248688, 2.336506, 1, 0, 0.9254902, 1,
1.12607, 2.034677, -0.316388, 1, 0, 0.9176471, 1,
1.129836, -0.315666, 1.759967, 1, 0, 0.9137255, 1,
1.134392, 0.4487666, 0.2638946, 1, 0, 0.9058824, 1,
1.136005, 1.093048, 2.014326, 1, 0, 0.9019608, 1,
1.144665, 1.502643, 0.1894353, 1, 0, 0.8941177, 1,
1.149384, -0.05338005, 0.2819263, 1, 0, 0.8862745, 1,
1.150537, -1.29537, 2.542123, 1, 0, 0.8823529, 1,
1.151106, 0.5886038, 0.6551787, 1, 0, 0.8745098, 1,
1.151712, -0.1749799, 2.785282, 1, 0, 0.8705882, 1,
1.151769, 0.7767347, 1.584701, 1, 0, 0.8627451, 1,
1.15229, -1.47863, 1.523949, 1, 0, 0.8588235, 1,
1.158559, 0.2370726, 2.041544, 1, 0, 0.8509804, 1,
1.162692, 0.8239062, 1.526318, 1, 0, 0.8470588, 1,
1.164075, -0.5474314, -0.18728, 1, 0, 0.8392157, 1,
1.164143, -0.6537153, 0.4396342, 1, 0, 0.8352941, 1,
1.167276, -0.2445916, 1.114548, 1, 0, 0.827451, 1,
1.168392, 0.5593093, 1.374755, 1, 0, 0.8235294, 1,
1.169589, 2.095681, 3.80581, 1, 0, 0.8156863, 1,
1.176986, 1.380033, 1.799194, 1, 0, 0.8117647, 1,
1.178597, 0.1697649, 1.648488, 1, 0, 0.8039216, 1,
1.193218, 1.756567, -1.734089, 1, 0, 0.7960784, 1,
1.196063, 0.8604945, 0.5248746, 1, 0, 0.7921569, 1,
1.208433, -1.51216, 0.8013517, 1, 0, 0.7843137, 1,
1.209967, 0.9581313, 1.303833, 1, 0, 0.7803922, 1,
1.212818, -0.9905099, 2.187858, 1, 0, 0.772549, 1,
1.213192, 2.023078, 1.650271, 1, 0, 0.7686275, 1,
1.214742, -0.4984512, 1.696675, 1, 0, 0.7607843, 1,
1.220875, -1.006288, 2.216587, 1, 0, 0.7568628, 1,
1.226566, 0.3201527, 0.9039175, 1, 0, 0.7490196, 1,
1.226588, -0.2324842, 1.746249, 1, 0, 0.7450981, 1,
1.226589, 1.080827, -0.07489724, 1, 0, 0.7372549, 1,
1.229711, -1.337416, 3.450819, 1, 0, 0.7333333, 1,
1.232555, -0.4402083, 2.950635, 1, 0, 0.7254902, 1,
1.232876, -0.7968817, 1.107328, 1, 0, 0.7215686, 1,
1.233564, -0.2805112, 1.607745, 1, 0, 0.7137255, 1,
1.238755, -0.4095693, 1.228341, 1, 0, 0.7098039, 1,
1.238965, 1.186232, 0.1744364, 1, 0, 0.7019608, 1,
1.239845, 0.8957602, 0.3395922, 1, 0, 0.6941177, 1,
1.244707, -0.909141, 4.444684, 1, 0, 0.6901961, 1,
1.24943, 0.2799953, 0.01972652, 1, 0, 0.682353, 1,
1.250182, 0.03858359, 2.546206, 1, 0, 0.6784314, 1,
1.25378, -1.014548, 2.85502, 1, 0, 0.6705883, 1,
1.255168, 0.5950412, -1.009191, 1, 0, 0.6666667, 1,
1.255664, -1.858567, 2.527352, 1, 0, 0.6588235, 1,
1.259089, -1.335338, 3.146612, 1, 0, 0.654902, 1,
1.261041, 0.1205162, 3.280079, 1, 0, 0.6470588, 1,
1.263327, -0.9185893, 3.92258, 1, 0, 0.6431373, 1,
1.279617, 0.5682151, 0.9526863, 1, 0, 0.6352941, 1,
1.280273, -1.090036, 3.807571, 1, 0, 0.6313726, 1,
1.28343, -3.05233, 4.71754, 1, 0, 0.6235294, 1,
1.287266, -0.2473539, 1.812964, 1, 0, 0.6196079, 1,
1.295842, 0.6070464, 0.9358283, 1, 0, 0.6117647, 1,
1.322376, -0.007395882, 1.972112, 1, 0, 0.6078432, 1,
1.329754, 1.562278, 1.962446, 1, 0, 0.6, 1,
1.330266, -0.08510838, 0.5343948, 1, 0, 0.5921569, 1,
1.330628, 1.315172, 0.9137268, 1, 0, 0.5882353, 1,
1.333201, 0.6269115, 0.1087933, 1, 0, 0.5803922, 1,
1.357208, 1.003672, 0.428876, 1, 0, 0.5764706, 1,
1.369727, 0.08741265, 1.131649, 1, 0, 0.5686275, 1,
1.371764, -1.078674, 3.440776, 1, 0, 0.5647059, 1,
1.378615, 1.864924, 1.75176, 1, 0, 0.5568628, 1,
1.385573, -0.8764728, 2.871545, 1, 0, 0.5529412, 1,
1.389902, -0.4212999, 3.002598, 1, 0, 0.5450981, 1,
1.390784, -0.3478838, 2.132854, 1, 0, 0.5411765, 1,
1.391006, 0.793537, 0.8274777, 1, 0, 0.5333334, 1,
1.392184, -1.25393, 2.3963, 1, 0, 0.5294118, 1,
1.394343, 0.4541534, 1.787111, 1, 0, 0.5215687, 1,
1.40116, 1.018568, 1.178648, 1, 0, 0.5176471, 1,
1.41152, -0.6046901, 1.687545, 1, 0, 0.509804, 1,
1.412288, 0.526001, 1.829339, 1, 0, 0.5058824, 1,
1.416605, 1.446266, 2.201829, 1, 0, 0.4980392, 1,
1.419331, -0.2540466, 0.9203818, 1, 0, 0.4901961, 1,
1.427709, -0.1576698, 2.607735, 1, 0, 0.4862745, 1,
1.438119, -1.574004, 2.164676, 1, 0, 0.4784314, 1,
1.441195, 0.5481354, 1.71177, 1, 0, 0.4745098, 1,
1.453486, -1.434501, 3.936344, 1, 0, 0.4666667, 1,
1.460113, -1.97354, 2.04147, 1, 0, 0.4627451, 1,
1.466281, -0.8522913, 1.317089, 1, 0, 0.454902, 1,
1.467784, -0.2953027, 3.520089, 1, 0, 0.4509804, 1,
1.471715, 2.196754, -0.2480455, 1, 0, 0.4431373, 1,
1.481411, 0.443483, 0.3967114, 1, 0, 0.4392157, 1,
1.481835, -0.4018964, -0.5179219, 1, 0, 0.4313726, 1,
1.489732, 0.743963, -0.4468365, 1, 0, 0.427451, 1,
1.493662, -0.47258, 0.3667855, 1, 0, 0.4196078, 1,
1.505237, -1.731572, 3.543009, 1, 0, 0.4156863, 1,
1.508784, 1.187657, -0.7282263, 1, 0, 0.4078431, 1,
1.511082, 0.0458857, 0.5589217, 1, 0, 0.4039216, 1,
1.516205, -0.04552023, 1.004705, 1, 0, 0.3960784, 1,
1.518566, 0.6804753, 2.043335, 1, 0, 0.3882353, 1,
1.520889, 0.5595535, 0.8056083, 1, 0, 0.3843137, 1,
1.529057, -0.3530542, 3.165375, 1, 0, 0.3764706, 1,
1.530743, 1.027744, 1.389384, 1, 0, 0.372549, 1,
1.540792, 1.417088, 0.8949761, 1, 0, 0.3647059, 1,
1.542892, -2.708958, 3.248753, 1, 0, 0.3607843, 1,
1.575693, 0.01418493, 1.330213, 1, 0, 0.3529412, 1,
1.606097, 0.3338149, 0.4085801, 1, 0, 0.3490196, 1,
1.611276, 1.125061, -0.6684123, 1, 0, 0.3411765, 1,
1.61715, 0.696864, 0.2318749, 1, 0, 0.3372549, 1,
1.622054, -0.1910164, -0.4061293, 1, 0, 0.3294118, 1,
1.626862, 1.247946, 0.571498, 1, 0, 0.3254902, 1,
1.634371, -1.771661, 1.743131, 1, 0, 0.3176471, 1,
1.645352, -0.3779926, 2.739317, 1, 0, 0.3137255, 1,
1.648505, 0.006129528, 3.033385, 1, 0, 0.3058824, 1,
1.668584, -0.08535802, 2.856262, 1, 0, 0.2980392, 1,
1.668699, -0.205806, 2.626678, 1, 0, 0.2941177, 1,
1.68755, -0.4384339, 1.86, 1, 0, 0.2862745, 1,
1.701779, -0.0216521, 0.2346839, 1, 0, 0.282353, 1,
1.71126, 2.174741, 1.013483, 1, 0, 0.2745098, 1,
1.717504, -0.3373043, 1.12539, 1, 0, 0.2705882, 1,
1.725298, -2.525513, 2.544529, 1, 0, 0.2627451, 1,
1.74709, -0.5739234, 2.002772, 1, 0, 0.2588235, 1,
1.747527, -0.08863842, 1.847216, 1, 0, 0.2509804, 1,
1.74921, 0.8965241, 2.574781, 1, 0, 0.2470588, 1,
1.756907, 2.645061, 1.749439, 1, 0, 0.2392157, 1,
1.761687, 0.16964, 3.072243, 1, 0, 0.2352941, 1,
1.764659, -0.528824, 2.98662, 1, 0, 0.227451, 1,
1.767909, 1.774852, -0.1407728, 1, 0, 0.2235294, 1,
1.770348, 0.7893676, -0.07300264, 1, 0, 0.2156863, 1,
1.788071, 1.900084, 1.895854, 1, 0, 0.2117647, 1,
1.788099, 1.765997, 3.21547, 1, 0, 0.2039216, 1,
1.808186, 0.3128967, 0.8473271, 1, 0, 0.1960784, 1,
1.815862, 1.157676, 1.699096, 1, 0, 0.1921569, 1,
1.816893, -0.6087501, 3.495721, 1, 0, 0.1843137, 1,
1.828155, -0.8528426, 2.00316, 1, 0, 0.1803922, 1,
1.854256, 0.7922758, 1.499976, 1, 0, 0.172549, 1,
1.879132, -1.068852, 2.262829, 1, 0, 0.1686275, 1,
1.891474, -3.158781, 4.298208, 1, 0, 0.1607843, 1,
1.923319, 1.121855, 1.407352, 1, 0, 0.1568628, 1,
1.923443, 0.01852418, 1.076201, 1, 0, 0.1490196, 1,
1.929786, -0.02355214, 1.879364, 1, 0, 0.145098, 1,
1.93546, 0.3783992, 1.266741, 1, 0, 0.1372549, 1,
1.999282, 0.7158468, 1.617582, 1, 0, 0.1333333, 1,
2.045439, 0.3973024, 0.9833398, 1, 0, 0.1254902, 1,
2.114043, -1.630779, 2.113685, 1, 0, 0.1215686, 1,
2.138837, 0.08995475, 1.614683, 1, 0, 0.1137255, 1,
2.170781, -0.1963131, 4.170527, 1, 0, 0.1098039, 1,
2.173221, -0.05576893, 0.9658575, 1, 0, 0.1019608, 1,
2.199997, 0.7833359, 1.535135, 1, 0, 0.09411765, 1,
2.207553, -1.921605, 2.282943, 1, 0, 0.09019608, 1,
2.234825, 1.757486, 0.6137851, 1, 0, 0.08235294, 1,
2.271093, -0.2049994, 1.830119, 1, 0, 0.07843138, 1,
2.296055, 1.402659, 2.300931, 1, 0, 0.07058824, 1,
2.298796, -0.6853777, 0.7183722, 1, 0, 0.06666667, 1,
2.458879, 0.6023585, 1.47587, 1, 0, 0.05882353, 1,
2.483106, -1.118144, 1.202981, 1, 0, 0.05490196, 1,
2.497884, 0.557513, 0.5598732, 1, 0, 0.04705882, 1,
2.511667, -0.2908692, -0.1980375, 1, 0, 0.04313726, 1,
2.56154, 0.3057693, 1.663438, 1, 0, 0.03529412, 1,
2.562398, 0.4954319, 1.9586, 1, 0, 0.03137255, 1,
2.609008, -0.7526225, 1.387045, 1, 0, 0.02352941, 1,
2.772767, 0.03876184, 0.7662392, 1, 0, 0.01960784, 1,
2.871742, -0.6948257, 1.083487, 1, 0, 0.01176471, 1,
3.213699, 3.54757, 1.794998, 1, 0, 0.007843138, 1
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
0.04978454, -4.295508, -6.871191, 0, -0.5, 0.5, 0.5,
0.04978454, -4.295508, -6.871191, 1, -0.5, 0.5, 0.5,
0.04978454, -4.295508, -6.871191, 1, 1.5, 0.5, 0.5,
0.04978454, -4.295508, -6.871191, 0, 1.5, 0.5, 0.5
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
-4.186697, 0.1943942, -6.871191, 0, -0.5, 0.5, 0.5,
-4.186697, 0.1943942, -6.871191, 1, -0.5, 0.5, 0.5,
-4.186697, 0.1943942, -6.871191, 1, 1.5, 0.5, 0.5,
-4.186697, 0.1943942, -6.871191, 0, 1.5, 0.5, 0.5
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
-4.186697, -4.295508, 0.08213234, 0, -0.5, 0.5, 0.5,
-4.186697, -4.295508, 0.08213234, 1, -0.5, 0.5, 0.5,
-4.186697, -4.295508, 0.08213234, 1, 1.5, 0.5, 0.5,
-4.186697, -4.295508, 0.08213234, 0, 1.5, 0.5, 0.5
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
-3, -3.259377, -5.266578,
3, -3.259377, -5.266578,
-3, -3.259377, -5.266578,
-3, -3.432065, -5.534013,
-2, -3.259377, -5.266578,
-2, -3.432065, -5.534013,
-1, -3.259377, -5.266578,
-1, -3.432065, -5.534013,
0, -3.259377, -5.266578,
0, -3.432065, -5.534013,
1, -3.259377, -5.266578,
1, -3.432065, -5.534013,
2, -3.259377, -5.266578,
2, -3.432065, -5.534013,
3, -3.259377, -5.266578,
3, -3.432065, -5.534013
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
-3, -3.777442, -6.068884, 0, -0.5, 0.5, 0.5,
-3, -3.777442, -6.068884, 1, -0.5, 0.5, 0.5,
-3, -3.777442, -6.068884, 1, 1.5, 0.5, 0.5,
-3, -3.777442, -6.068884, 0, 1.5, 0.5, 0.5,
-2, -3.777442, -6.068884, 0, -0.5, 0.5, 0.5,
-2, -3.777442, -6.068884, 1, -0.5, 0.5, 0.5,
-2, -3.777442, -6.068884, 1, 1.5, 0.5, 0.5,
-2, -3.777442, -6.068884, 0, 1.5, 0.5, 0.5,
-1, -3.777442, -6.068884, 0, -0.5, 0.5, 0.5,
-1, -3.777442, -6.068884, 1, -0.5, 0.5, 0.5,
-1, -3.777442, -6.068884, 1, 1.5, 0.5, 0.5,
-1, -3.777442, -6.068884, 0, 1.5, 0.5, 0.5,
0, -3.777442, -6.068884, 0, -0.5, 0.5, 0.5,
0, -3.777442, -6.068884, 1, -0.5, 0.5, 0.5,
0, -3.777442, -6.068884, 1, 1.5, 0.5, 0.5,
0, -3.777442, -6.068884, 0, 1.5, 0.5, 0.5,
1, -3.777442, -6.068884, 0, -0.5, 0.5, 0.5,
1, -3.777442, -6.068884, 1, -0.5, 0.5, 0.5,
1, -3.777442, -6.068884, 1, 1.5, 0.5, 0.5,
1, -3.777442, -6.068884, 0, 1.5, 0.5, 0.5,
2, -3.777442, -6.068884, 0, -0.5, 0.5, 0.5,
2, -3.777442, -6.068884, 1, -0.5, 0.5, 0.5,
2, -3.777442, -6.068884, 1, 1.5, 0.5, 0.5,
2, -3.777442, -6.068884, 0, 1.5, 0.5, 0.5,
3, -3.777442, -6.068884, 0, -0.5, 0.5, 0.5,
3, -3.777442, -6.068884, 1, -0.5, 0.5, 0.5,
3, -3.777442, -6.068884, 1, 1.5, 0.5, 0.5,
3, -3.777442, -6.068884, 0, 1.5, 0.5, 0.5
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
-3.209048, -3, -5.266578,
-3.209048, 3, -5.266578,
-3.209048, -3, -5.266578,
-3.371989, -3, -5.534013,
-3.209048, -2, -5.266578,
-3.371989, -2, -5.534013,
-3.209048, -1, -5.266578,
-3.371989, -1, -5.534013,
-3.209048, 0, -5.266578,
-3.371989, 0, -5.534013,
-3.209048, 1, -5.266578,
-3.371989, 1, -5.534013,
-3.209048, 2, -5.266578,
-3.371989, 2, -5.534013,
-3.209048, 3, -5.266578,
-3.371989, 3, -5.534013
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
-3.697872, -3, -6.068884, 0, -0.5, 0.5, 0.5,
-3.697872, -3, -6.068884, 1, -0.5, 0.5, 0.5,
-3.697872, -3, -6.068884, 1, 1.5, 0.5, 0.5,
-3.697872, -3, -6.068884, 0, 1.5, 0.5, 0.5,
-3.697872, -2, -6.068884, 0, -0.5, 0.5, 0.5,
-3.697872, -2, -6.068884, 1, -0.5, 0.5, 0.5,
-3.697872, -2, -6.068884, 1, 1.5, 0.5, 0.5,
-3.697872, -2, -6.068884, 0, 1.5, 0.5, 0.5,
-3.697872, -1, -6.068884, 0, -0.5, 0.5, 0.5,
-3.697872, -1, -6.068884, 1, -0.5, 0.5, 0.5,
-3.697872, -1, -6.068884, 1, 1.5, 0.5, 0.5,
-3.697872, -1, -6.068884, 0, 1.5, 0.5, 0.5,
-3.697872, 0, -6.068884, 0, -0.5, 0.5, 0.5,
-3.697872, 0, -6.068884, 1, -0.5, 0.5, 0.5,
-3.697872, 0, -6.068884, 1, 1.5, 0.5, 0.5,
-3.697872, 0, -6.068884, 0, 1.5, 0.5, 0.5,
-3.697872, 1, -6.068884, 0, -0.5, 0.5, 0.5,
-3.697872, 1, -6.068884, 1, -0.5, 0.5, 0.5,
-3.697872, 1, -6.068884, 1, 1.5, 0.5, 0.5,
-3.697872, 1, -6.068884, 0, 1.5, 0.5, 0.5,
-3.697872, 2, -6.068884, 0, -0.5, 0.5, 0.5,
-3.697872, 2, -6.068884, 1, -0.5, 0.5, 0.5,
-3.697872, 2, -6.068884, 1, 1.5, 0.5, 0.5,
-3.697872, 2, -6.068884, 0, 1.5, 0.5, 0.5,
-3.697872, 3, -6.068884, 0, -0.5, 0.5, 0.5,
-3.697872, 3, -6.068884, 1, -0.5, 0.5, 0.5,
-3.697872, 3, -6.068884, 1, 1.5, 0.5, 0.5,
-3.697872, 3, -6.068884, 0, 1.5, 0.5, 0.5
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
-3.209048, -3.259377, -4,
-3.209048, -3.259377, 4,
-3.209048, -3.259377, -4,
-3.371989, -3.432065, -4,
-3.209048, -3.259377, -2,
-3.371989, -3.432065, -2,
-3.209048, -3.259377, 0,
-3.371989, -3.432065, 0,
-3.209048, -3.259377, 2,
-3.371989, -3.432065, 2,
-3.209048, -3.259377, 4,
-3.371989, -3.432065, 4
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
-3.697872, -3.777442, -4, 0, -0.5, 0.5, 0.5,
-3.697872, -3.777442, -4, 1, -0.5, 0.5, 0.5,
-3.697872, -3.777442, -4, 1, 1.5, 0.5, 0.5,
-3.697872, -3.777442, -4, 0, 1.5, 0.5, 0.5,
-3.697872, -3.777442, -2, 0, -0.5, 0.5, 0.5,
-3.697872, -3.777442, -2, 1, -0.5, 0.5, 0.5,
-3.697872, -3.777442, -2, 1, 1.5, 0.5, 0.5,
-3.697872, -3.777442, -2, 0, 1.5, 0.5, 0.5,
-3.697872, -3.777442, 0, 0, -0.5, 0.5, 0.5,
-3.697872, -3.777442, 0, 1, -0.5, 0.5, 0.5,
-3.697872, -3.777442, 0, 1, 1.5, 0.5, 0.5,
-3.697872, -3.777442, 0, 0, 1.5, 0.5, 0.5,
-3.697872, -3.777442, 2, 0, -0.5, 0.5, 0.5,
-3.697872, -3.777442, 2, 1, -0.5, 0.5, 0.5,
-3.697872, -3.777442, 2, 1, 1.5, 0.5, 0.5,
-3.697872, -3.777442, 2, 0, 1.5, 0.5, 0.5,
-3.697872, -3.777442, 4, 0, -0.5, 0.5, 0.5,
-3.697872, -3.777442, 4, 1, -0.5, 0.5, 0.5,
-3.697872, -3.777442, 4, 1, 1.5, 0.5, 0.5,
-3.697872, -3.777442, 4, 0, 1.5, 0.5, 0.5
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
-3.209048, -3.259377, -5.266578,
-3.209048, 3.648165, -5.266578,
-3.209048, -3.259377, 5.430842,
-3.209048, 3.648165, 5.430842,
-3.209048, -3.259377, -5.266578,
-3.209048, -3.259377, 5.430842,
-3.209048, 3.648165, -5.266578,
-3.209048, 3.648165, 5.430842,
-3.209048, -3.259377, -5.266578,
3.308617, -3.259377, -5.266578,
-3.209048, -3.259377, 5.430842,
3.308617, -3.259377, 5.430842,
-3.209048, 3.648165, -5.266578,
3.308617, 3.648165, -5.266578,
-3.209048, 3.648165, 5.430842,
3.308617, 3.648165, 5.430842,
3.308617, -3.259377, -5.266578,
3.308617, 3.648165, -5.266578,
3.308617, -3.259377, 5.430842,
3.308617, 3.648165, 5.430842,
3.308617, -3.259377, -5.266578,
3.308617, -3.259377, 5.430842,
3.308617, 3.648165, -5.266578,
3.308617, 3.648165, 5.430842
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
var radius = 7.638515;
var distance = 33.98461;
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
mvMatrix.translate( -0.04978454, -0.1943942, -0.08213234 );
mvMatrix.scale( 1.267158, 1.195637, 0.772047 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.98461);
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
Phenoxypropionate<-read.table("Phenoxypropionate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenoxypropionate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
```

```r
y<-Phenoxypropionate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
```

```r
z<-Phenoxypropionate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
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
-3.11413, -0.9621175, -1.146309, 0, 0, 1, 1, 1,
-2.879241, -0.2137874, -2.472598, 1, 0, 0, 1, 1,
-2.677228, -1.021235, -2.622746, 1, 0, 0, 1, 1,
-2.617905, -0.3861305, -3.111518, 1, 0, 0, 1, 1,
-2.561028, -0.316916, -2.546655, 1, 0, 0, 1, 1,
-2.465277, 0.9263472, 1.229703, 1, 0, 0, 1, 1,
-2.413468, 1.704541, -1.075951, 0, 0, 0, 1, 1,
-2.350533, -0.5587242, -3.69541, 0, 0, 0, 1, 1,
-2.330419, 1.303183, -0.3172732, 0, 0, 0, 1, 1,
-2.264367, 0.1740961, -1.991128, 0, 0, 0, 1, 1,
-2.258371, 0.8154256, -1.583891, 0, 0, 0, 1, 1,
-2.184571, -0.02871125, -1.48866, 0, 0, 0, 1, 1,
-2.137451, 0.5459327, -2.190356, 0, 0, 0, 1, 1,
-2.108819, 0.6546739, -0.2119844, 1, 1, 1, 1, 1,
-2.088484, 1.472761, 0.2961057, 1, 1, 1, 1, 1,
-2.087593, -0.6205103, -0.181811, 1, 1, 1, 1, 1,
-2.077148, -0.5011818, -2.530849, 1, 1, 1, 1, 1,
-2.057178, 1.42154, -1.493415, 1, 1, 1, 1, 1,
-2.049956, -0.5499236, 0.116611, 1, 1, 1, 1, 1,
-2.045444, 0.3808645, -1.734894, 1, 1, 1, 1, 1,
-2.036131, -1.337587, -2.026839, 1, 1, 1, 1, 1,
-2.000949, 2.084261, 0.4816605, 1, 1, 1, 1, 1,
-1.996811, 0.2789832, -2.045997, 1, 1, 1, 1, 1,
-1.99589, -0.003414354, -1.441086, 1, 1, 1, 1, 1,
-1.983941, 0.4147743, -2.187538, 1, 1, 1, 1, 1,
-1.977587, -1.445711, -2.203188, 1, 1, 1, 1, 1,
-1.972041, -0.2319831, -3.085691, 1, 1, 1, 1, 1,
-1.968491, 2.195018, -1.075455, 1, 1, 1, 1, 1,
-1.960719, -0.6958608, -4.124234, 0, 0, 1, 1, 1,
-1.937184, -0.7363818, -2.153378, 1, 0, 0, 1, 1,
-1.931415, -1.289426, -3.840087, 1, 0, 0, 1, 1,
-1.924163, -0.5399224, -1.97104, 1, 0, 0, 1, 1,
-1.919223, -0.5075137, -2.323455, 1, 0, 0, 1, 1,
-1.911429, -0.1260659, -1.789003, 1, 0, 0, 1, 1,
-1.896736, -1.797976, -0.9868668, 0, 0, 0, 1, 1,
-1.837809, -1.291357, -1.442917, 0, 0, 0, 1, 1,
-1.823487, -0.5524149, -3.301699, 0, 0, 0, 1, 1,
-1.822702, -0.4703376, -2.303704, 0, 0, 0, 1, 1,
-1.798594, -1.00773, -2.305186, 0, 0, 0, 1, 1,
-1.79283, -0.6791978, -3.18468, 0, 0, 0, 1, 1,
-1.78025, -1.046248, -2.27437, 0, 0, 0, 1, 1,
-1.771089, 0.9368445, -1.098152, 1, 1, 1, 1, 1,
-1.755905, -0.150547, -1.464164, 1, 1, 1, 1, 1,
-1.725947, 2.203083, 0.01719329, 1, 1, 1, 1, 1,
-1.715537, -0.6019914, -3.328257, 1, 1, 1, 1, 1,
-1.711284, 0.7500618, -0.3925751, 1, 1, 1, 1, 1,
-1.694426, -0.2691754, -4.129895, 1, 1, 1, 1, 1,
-1.678912, -0.2622721, -3.693783, 1, 1, 1, 1, 1,
-1.673329, 0.272834, -2.175213, 1, 1, 1, 1, 1,
-1.651247, 2.816253, 0.6883205, 1, 1, 1, 1, 1,
-1.64782, 0.04359523, -1.754978, 1, 1, 1, 1, 1,
-1.633876, 0.7715853, -1.464206, 1, 1, 1, 1, 1,
-1.626497, -0.4510738, -1.490569, 1, 1, 1, 1, 1,
-1.62501, -1.238762, -1.49564, 1, 1, 1, 1, 1,
-1.611866, 0.2938549, 0.07961693, 1, 1, 1, 1, 1,
-1.610662, 0.05941479, -1.0118, 1, 1, 1, 1, 1,
-1.609876, -0.7062207, -2.651629, 0, 0, 1, 1, 1,
-1.587423, 1.002979, -0.3761301, 1, 0, 0, 1, 1,
-1.579002, -0.9670561, -2.066554, 1, 0, 0, 1, 1,
-1.568918, -0.1296444, -2.141524, 1, 0, 0, 1, 1,
-1.533867, 0.773625, -0.8659929, 1, 0, 0, 1, 1,
-1.530563, 0.8102946, -0.3808096, 1, 0, 0, 1, 1,
-1.530357, 0.2099229, -0.3900441, 0, 0, 0, 1, 1,
-1.527115, -1.843529, -2.592492, 0, 0, 0, 1, 1,
-1.525442, -0.1489192, -2.960754, 0, 0, 0, 1, 1,
-1.523408, 0.01034029, -3.559877, 0, 0, 0, 1, 1,
-1.519706, 0.3511451, -1.355467, 0, 0, 0, 1, 1,
-1.518387, 0.2644944, -1.356472, 0, 0, 0, 1, 1,
-1.51456, -0.1440036, -1.767307, 0, 0, 0, 1, 1,
-1.507649, -0.9631057, -2.788703, 1, 1, 1, 1, 1,
-1.50756, -0.8416259, -3.10261, 1, 1, 1, 1, 1,
-1.498451, -1.070403, -2.192482, 1, 1, 1, 1, 1,
-1.494769, 0.05779782, -1.264441, 1, 1, 1, 1, 1,
-1.490379, 0.1970855, -0.7263433, 1, 1, 1, 1, 1,
-1.464335, -1.31833, -2.117051, 1, 1, 1, 1, 1,
-1.462049, -1.624542, -3.036581, 1, 1, 1, 1, 1,
-1.452907, 0.6675025, -2.15067, 1, 1, 1, 1, 1,
-1.438692, 1.131896, -1.277902, 1, 1, 1, 1, 1,
-1.43839, 1.142166, -0.8854194, 1, 1, 1, 1, 1,
-1.437984, -0.7045988, -1.62246, 1, 1, 1, 1, 1,
-1.429572, -0.9628583, -4.184669, 1, 1, 1, 1, 1,
-1.428023, 0.3490376, -1.797539, 1, 1, 1, 1, 1,
-1.426003, 0.9176864, -1.206002, 1, 1, 1, 1, 1,
-1.422928, 0.190496, -1.164129, 1, 1, 1, 1, 1,
-1.422654, -1.028698, -2.581967, 0, 0, 1, 1, 1,
-1.418161, -1.275407, -3.816393, 1, 0, 0, 1, 1,
-1.403962, -1.115101, -3.757685, 1, 0, 0, 1, 1,
-1.403132, 0.7286679, -1.100712, 1, 0, 0, 1, 1,
-1.402919, -1.329464, -3.427634, 1, 0, 0, 1, 1,
-1.37932, -0.8642858, -2.154089, 1, 0, 0, 1, 1,
-1.360545, -0.3329141, -2.366119, 0, 0, 0, 1, 1,
-1.356812, 2.987397, -0.2092321, 0, 0, 0, 1, 1,
-1.356057, 0.2075386, -1.630564, 0, 0, 0, 1, 1,
-1.354692, 0.3928817, -0.165865, 0, 0, 0, 1, 1,
-1.344046, 0.5067761, -1.690716, 0, 0, 0, 1, 1,
-1.341226, -0.09560575, -0.2830363, 0, 0, 0, 1, 1,
-1.332019, 1.423921, -0.0594437, 0, 0, 0, 1, 1,
-1.330273, 1.720285, 1.760843, 1, 1, 1, 1, 1,
-1.326983, 0.5397176, -1.322617, 1, 1, 1, 1, 1,
-1.320938, -0.7027184, -3.571033, 1, 1, 1, 1, 1,
-1.319855, 0.4797079, -2.467705, 1, 1, 1, 1, 1,
-1.319298, -0.1900526, -1.684164, 1, 1, 1, 1, 1,
-1.31731, 1.539773, -1.212797, 1, 1, 1, 1, 1,
-1.315656, -0.3153544, -2.031409, 1, 1, 1, 1, 1,
-1.309803, -1.458996, -2.62488, 1, 1, 1, 1, 1,
-1.308001, -0.07713532, -0.7218283, 1, 1, 1, 1, 1,
-1.305276, 1.415317, -0.3719358, 1, 1, 1, 1, 1,
-1.297014, 0.8571562, -0.2159899, 1, 1, 1, 1, 1,
-1.29398, -0.6294378, -2.434703, 1, 1, 1, 1, 1,
-1.28538, 1.250894, 0.9030871, 1, 1, 1, 1, 1,
-1.277485, -0.7020832, -2.721072, 1, 1, 1, 1, 1,
-1.252154, 1.580873, -0.9904805, 1, 1, 1, 1, 1,
-1.22192, 0.2896221, -0.440578, 0, 0, 1, 1, 1,
-1.207884, 3.364454, 0.05866035, 1, 0, 0, 1, 1,
-1.206939, -0.5342845, -2.798548, 1, 0, 0, 1, 1,
-1.202414, -0.4141518, -1.384674, 1, 0, 0, 1, 1,
-1.199966, 0.3421957, -2.246279, 1, 0, 0, 1, 1,
-1.197891, -2.480608, -2.184847, 1, 0, 0, 1, 1,
-1.196541, 0.2392283, 0.6158658, 0, 0, 0, 1, 1,
-1.178835, 0.683544, -2.135134, 0, 0, 0, 1, 1,
-1.175981, -0.755224, -1.113539, 0, 0, 0, 1, 1,
-1.172597, -0.7240285, -2.296971, 0, 0, 0, 1, 1,
-1.165667, -0.4189441, -3.028099, 0, 0, 0, 1, 1,
-1.15499, -0.6253101, -1.245583, 0, 0, 0, 1, 1,
-1.147046, -0.04543895, -1.507777, 0, 0, 0, 1, 1,
-1.143643, 1.190318, -0.6964156, 1, 1, 1, 1, 1,
-1.141935, 0.1219916, 0.108142, 1, 1, 1, 1, 1,
-1.133883, -1.509559, -1.560226, 1, 1, 1, 1, 1,
-1.131901, 0.8463948, -1.616226, 1, 1, 1, 1, 1,
-1.131322, 0.1041023, -0.1694533, 1, 1, 1, 1, 1,
-1.126695, 0.1672305, -0.9761701, 1, 1, 1, 1, 1,
-1.122824, 1.525952, -0.9677423, 1, 1, 1, 1, 1,
-1.114769, -1.472797, -2.937677, 1, 1, 1, 1, 1,
-1.108433, 0.5388777, -0.02269045, 1, 1, 1, 1, 1,
-1.105777, -0.5459971, -3.490582, 1, 1, 1, 1, 1,
-1.102371, 1.032603, -1.762426, 1, 1, 1, 1, 1,
-1.10196, -0.4048797, -0.6093041, 1, 1, 1, 1, 1,
-1.100079, -0.1849421, -0.4321909, 1, 1, 1, 1, 1,
-1.099701, 1.021361, -1.478421, 1, 1, 1, 1, 1,
-1.095067, 1.34089, -3.096714, 1, 1, 1, 1, 1,
-1.090841, 0.004582456, -3.32563, 0, 0, 1, 1, 1,
-1.087957, -0.5723061, -3.922426, 1, 0, 0, 1, 1,
-1.087856, -0.2345969, -1.474453, 1, 0, 0, 1, 1,
-1.083123, 0.2613722, -3.285182, 1, 0, 0, 1, 1,
-1.083003, 0.9896138, -1.617221, 1, 0, 0, 1, 1,
-1.080984, 0.7259089, -0.9683894, 1, 0, 0, 1, 1,
-1.078239, -1.406659, 0.4760446, 0, 0, 0, 1, 1,
-1.078058, 1.590221, 1.264146, 0, 0, 0, 1, 1,
-1.068798, -0.09727181, -0.822849, 0, 0, 0, 1, 1,
-1.06395, -0.966494, -2.392546, 0, 0, 0, 1, 1,
-1.063903, 1.765475, 0.7918957, 0, 0, 0, 1, 1,
-1.06334, 0.9187953, 0.1137429, 0, 0, 0, 1, 1,
-1.060199, -0.7720048, -3.249521, 0, 0, 0, 1, 1,
-1.05218, 0.5802973, -2.099641, 1, 1, 1, 1, 1,
-1.05008, 0.6489484, -2.035405, 1, 1, 1, 1, 1,
-1.048403, -0.2841318, 0.7331843, 1, 1, 1, 1, 1,
-1.04573, -0.01586322, -2.133524, 1, 1, 1, 1, 1,
-1.044537, -0.8472087, -1.956255, 1, 1, 1, 1, 1,
-1.043967, -0.4815637, -0.2388702, 1, 1, 1, 1, 1,
-1.043013, 0.4060517, 0.1797859, 1, 1, 1, 1, 1,
-1.031879, 0.5745446, -1.038956, 1, 1, 1, 1, 1,
-1.029373, -0.4899157, -2.594424, 1, 1, 1, 1, 1,
-1.025517, -0.4026819, -2.996943, 1, 1, 1, 1, 1,
-1.024553, -0.08706571, -1.251547, 1, 1, 1, 1, 1,
-1.020034, 1.173893, -0.1941666, 1, 1, 1, 1, 1,
-1.017237, -0.5959902, -2.679464, 1, 1, 1, 1, 1,
-1.016769, -1.674272, -1.11104, 1, 1, 1, 1, 1,
-1.013947, 0.04814908, -2.240177, 1, 1, 1, 1, 1,
-1.012626, 1.960972, -0.09945646, 0, 0, 1, 1, 1,
-1.008567, -1.232227, -2.808405, 1, 0, 0, 1, 1,
-1.007446, -0.2621116, -1.551207, 1, 0, 0, 1, 1,
-1.001152, 0.3341783, -1.616096, 1, 0, 0, 1, 1,
-0.9972733, 0.5554968, -3.295651, 1, 0, 0, 1, 1,
-0.9968074, 0.3011082, -1.706328, 1, 0, 0, 1, 1,
-0.9958323, -2.043974, -3.966743, 0, 0, 0, 1, 1,
-0.9923064, 1.12959, 0.9437606, 0, 0, 0, 1, 1,
-0.9919424, 0.48015, -0.2778161, 0, 0, 0, 1, 1,
-0.9878186, 0.6497911, -0.996659, 0, 0, 0, 1, 1,
-0.9801261, -0.02464405, -2.083808, 0, 0, 0, 1, 1,
-0.9737533, -1.154264, -2.093275, 0, 0, 0, 1, 1,
-0.9733224, -1.45542, -3.433823, 0, 0, 0, 1, 1,
-0.9612455, -0.6420352, -2.311583, 1, 1, 1, 1, 1,
-0.9583939, -2.05087, -3.682831, 1, 1, 1, 1, 1,
-0.9523115, 1.206178, -0.5125993, 1, 1, 1, 1, 1,
-0.9522457, 0.6819677, -2.517452, 1, 1, 1, 1, 1,
-0.95202, 1.873898, -1.349974, 1, 1, 1, 1, 1,
-0.9518769, 0.3452128, -0.3481118, 1, 1, 1, 1, 1,
-0.9492594, 1.475248, 1.453468, 1, 1, 1, 1, 1,
-0.9467539, 0.3699008, -1.697631, 1, 1, 1, 1, 1,
-0.9461322, 0.6384981, -2.000811, 1, 1, 1, 1, 1,
-0.9432302, -0.5574659, -1.33272, 1, 1, 1, 1, 1,
-0.9361591, 0.5776494, -1.478922, 1, 1, 1, 1, 1,
-0.9335954, 0.5751463, -0.6220787, 1, 1, 1, 1, 1,
-0.9327503, -0.5010769, -2.679333, 1, 1, 1, 1, 1,
-0.9288424, 0.483254, -1.942633, 1, 1, 1, 1, 1,
-0.9178221, -0.5280879, -1.584459, 1, 1, 1, 1, 1,
-0.9091393, -1.846746, -2.711985, 0, 0, 1, 1, 1,
-0.904688, -0.04776675, -1.533071, 1, 0, 0, 1, 1,
-0.9039339, -1.711465, -2.928884, 1, 0, 0, 1, 1,
-0.9023721, 1.14321, -1.086261, 1, 0, 0, 1, 1,
-0.8993812, 0.4051378, 0.5630698, 1, 0, 0, 1, 1,
-0.8977483, 0.9099663, -0.9263933, 1, 0, 0, 1, 1,
-0.8913938, -0.4523302, -1.90427, 0, 0, 0, 1, 1,
-0.8911461, 1.781047, 0.005326035, 0, 0, 0, 1, 1,
-0.8902711, 0.6464919, -1.383872, 0, 0, 0, 1, 1,
-0.8858767, 0.8740013, -3.389484, 0, 0, 0, 1, 1,
-0.8813525, -0.1922484, -1.736798, 0, 0, 0, 1, 1,
-0.878148, 0.1832757, -1.368597, 0, 0, 0, 1, 1,
-0.8767612, 0.449421, -0.3837112, 0, 0, 0, 1, 1,
-0.8766381, 0.4539835, -1.558859, 1, 1, 1, 1, 1,
-0.8687035, -0.7629152, -3.385666, 1, 1, 1, 1, 1,
-0.864799, -1.31979, -4.729419, 1, 1, 1, 1, 1,
-0.8617858, -2.142539, -4.934534, 1, 1, 1, 1, 1,
-0.859349, -0.8690419, -3.183332, 1, 1, 1, 1, 1,
-0.8513795, -1.017652, -1.932389, 1, 1, 1, 1, 1,
-0.8504422, 0.2169324, -0.5200351, 1, 1, 1, 1, 1,
-0.8445839, -0.7186268, -1.993821, 1, 1, 1, 1, 1,
-0.8441558, 0.3790952, 0.2261021, 1, 1, 1, 1, 1,
-0.8413725, -1.28712, -3.849794, 1, 1, 1, 1, 1,
-0.8404912, -1.823652, -2.931337, 1, 1, 1, 1, 1,
-0.8375245, -0.6858077, -0.5223038, 1, 1, 1, 1, 1,
-0.8361982, -0.6513122, -2.791148, 1, 1, 1, 1, 1,
-0.8261145, -0.6223223, -0.9671842, 1, 1, 1, 1, 1,
-0.825769, -0.9160896, -2.805877, 1, 1, 1, 1, 1,
-0.823427, 1.392262, 1.188731, 0, 0, 1, 1, 1,
-0.8213063, -0.5683801, -2.167014, 1, 0, 0, 1, 1,
-0.8211959, -0.5152798, -2.736051, 1, 0, 0, 1, 1,
-0.8207303, -0.6093824, -0.8287652, 1, 0, 0, 1, 1,
-0.8157346, -0.6476222, -3.118658, 1, 0, 0, 1, 1,
-0.8146681, 0.1422617, -2.99044, 1, 0, 0, 1, 1,
-0.8115637, 0.5148096, -0.9839079, 0, 0, 0, 1, 1,
-0.8112333, 2.013949, -0.618184, 0, 0, 0, 1, 1,
-0.8054105, -0.03402368, -1.459498, 0, 0, 0, 1, 1,
-0.801697, 1.48772, -2.416473, 0, 0, 0, 1, 1,
-0.7965913, 1.627512, -1.046784, 0, 0, 0, 1, 1,
-0.7918128, -1.134988, -2.148102, 0, 0, 0, 1, 1,
-0.7867306, 0.9511424, 0.001099426, 0, 0, 0, 1, 1,
-0.7864618, 0.8999261, -2.272297, 1, 1, 1, 1, 1,
-0.7792743, 0.5604471, 0.4826387, 1, 1, 1, 1, 1,
-0.7785105, -2.055235, -2.522187, 1, 1, 1, 1, 1,
-0.7760661, 0.1231422, -2.014378, 1, 1, 1, 1, 1,
-0.7622386, -1.825883, -5.11079, 1, 1, 1, 1, 1,
-0.7607134, -0.255141, -2.015336, 1, 1, 1, 1, 1,
-0.7603841, 0.8566292, -0.5888528, 1, 1, 1, 1, 1,
-0.7542425, 0.6811434, 0.2595951, 1, 1, 1, 1, 1,
-0.7530082, -0.5345847, -1.683129, 1, 1, 1, 1, 1,
-0.7509278, 0.1864369, -1.954888, 1, 1, 1, 1, 1,
-0.7497107, -0.3137488, -1.950631, 1, 1, 1, 1, 1,
-0.7470766, -0.4794315, -0.9022929, 1, 1, 1, 1, 1,
-0.7410567, -1.812383, -4.249632, 1, 1, 1, 1, 1,
-0.739413, 0.277406, -1.54742, 1, 1, 1, 1, 1,
-0.7318879, 0.03248408, -1.869056, 1, 1, 1, 1, 1,
-0.7249817, -0.2245043, -2.134982, 0, 0, 1, 1, 1,
-0.7231544, -0.4289246, -2.012213, 1, 0, 0, 1, 1,
-0.7229812, 0.1532829, 1.060121, 1, 0, 0, 1, 1,
-0.7224317, -0.2859731, -2.41482, 1, 0, 0, 1, 1,
-0.7169035, -1.094697, -3.172679, 1, 0, 0, 1, 1,
-0.7157299, -0.8128325, -1.874529, 1, 0, 0, 1, 1,
-0.7079127, 1.29683, 0.05951273, 0, 0, 0, 1, 1,
-0.7043651, 0.7404488, -1.160231, 0, 0, 0, 1, 1,
-0.7037913, 0.08813267, -2.248527, 0, 0, 0, 1, 1,
-0.7037425, -0.8411741, -3.487549, 0, 0, 0, 1, 1,
-0.6986387, -0.02770584, -1.94225, 0, 0, 0, 1, 1,
-0.6983847, -0.7183015, -2.068542, 0, 0, 0, 1, 1,
-0.6965465, -0.7475917, -1.148429, 0, 0, 0, 1, 1,
-0.6955327, 0.8009836, -0.7073394, 1, 1, 1, 1, 1,
-0.6914116, -1.133268, -4.708714, 1, 1, 1, 1, 1,
-0.6896104, -0.9287044, -2.455394, 1, 1, 1, 1, 1,
-0.6874143, 0.469377, 0.3053912, 1, 1, 1, 1, 1,
-0.6853776, -0.7808158, -2.800566, 1, 1, 1, 1, 1,
-0.6823851, 0.1457063, -2.658932, 1, 1, 1, 1, 1,
-0.6777788, -0.4090097, -1.641326, 1, 1, 1, 1, 1,
-0.6761493, 2.412939, -0.8772817, 1, 1, 1, 1, 1,
-0.6755314, 0.5221549, -0.7701743, 1, 1, 1, 1, 1,
-0.6752784, -1.541337, -1.921673, 1, 1, 1, 1, 1,
-0.6721537, -2.102802, -2.265007, 1, 1, 1, 1, 1,
-0.6689555, 1.104318, -1.24804, 1, 1, 1, 1, 1,
-0.6623144, 0.0162863, -0.5975645, 1, 1, 1, 1, 1,
-0.6609327, -1.771219, -3.012641, 1, 1, 1, 1, 1,
-0.6608073, 1.244287, -0.8414904, 1, 1, 1, 1, 1,
-0.6502522, 0.8568762, 1.529423, 0, 0, 1, 1, 1,
-0.6500458, 1.54468, 0.2959634, 1, 0, 0, 1, 1,
-0.6479028, 0.5943744, -1.579971, 1, 0, 0, 1, 1,
-0.6445541, 0.7451545, -1.433641, 1, 0, 0, 1, 1,
-0.6444231, 0.5127193, -0.2251419, 1, 0, 0, 1, 1,
-0.6382608, -0.7935048, -2.767601, 1, 0, 0, 1, 1,
-0.6357739, -1.338127, -2.829334, 0, 0, 0, 1, 1,
-0.6348099, -0.6609367, -1.777279, 0, 0, 0, 1, 1,
-0.6344444, -0.5598108, -2.636182, 0, 0, 0, 1, 1,
-0.6335155, -0.865405, -2.932696, 0, 0, 0, 1, 1,
-0.6316227, 0.6322246, 1.168007, 0, 0, 0, 1, 1,
-0.6277066, 0.06315124, -1.900803, 0, 0, 0, 1, 1,
-0.6261712, -2.407438, -4.127133, 0, 0, 0, 1, 1,
-0.6246682, 0.7931188, 1.769756, 1, 1, 1, 1, 1,
-0.6245959, -0.935574, -1.610164, 1, 1, 1, 1, 1,
-0.6217468, -1.831697, -3.688162, 1, 1, 1, 1, 1,
-0.6113887, 0.3482442, -0.8069686, 1, 1, 1, 1, 1,
-0.6088866, 0.04776135, -0.6172731, 1, 1, 1, 1, 1,
-0.6080273, 1.07399, -1.662777, 1, 1, 1, 1, 1,
-0.6079664, -0.6439664, -1.002812, 1, 1, 1, 1, 1,
-0.6068839, -2.323263, -2.487266, 1, 1, 1, 1, 1,
-0.6054766, 1.572532, -1.714118, 1, 1, 1, 1, 1,
-0.6044872, -0.8421327, -1.565139, 1, 1, 1, 1, 1,
-0.601727, 0.2673212, -1.86016, 1, 1, 1, 1, 1,
-0.5946899, -0.2716606, -3.408082, 1, 1, 1, 1, 1,
-0.582277, 2.45824, -1.011795, 1, 1, 1, 1, 1,
-0.5810779, -0.8559022, -2.842669, 1, 1, 1, 1, 1,
-0.5810497, 0.9641053, -1.616064, 1, 1, 1, 1, 1,
-0.566194, -0.7473872, -1.960673, 0, 0, 1, 1, 1,
-0.5578972, -0.2277768, -2.61511, 1, 0, 0, 1, 1,
-0.557065, -0.5607706, -1.643322, 1, 0, 0, 1, 1,
-0.5550135, -0.4902883, -4.191735, 1, 0, 0, 1, 1,
-0.5542527, -0.9447495, -3.002526, 1, 0, 0, 1, 1,
-0.5527621, -1.750647, -1.064099, 1, 0, 0, 1, 1,
-0.5510393, -0.8465279, -2.35748, 0, 0, 0, 1, 1,
-0.5509025, -0.8582646, -2.765067, 0, 0, 0, 1, 1,
-0.5472344, 1.672584, 0.5620226, 0, 0, 0, 1, 1,
-0.5457351, -0.6090234, -2.757608, 0, 0, 0, 1, 1,
-0.5453829, 1.202757, 0.9036887, 0, 0, 0, 1, 1,
-0.5443702, 0.006248889, -2.770642, 0, 0, 0, 1, 1,
-0.5425219, 0.4668686, -2.221781, 0, 0, 0, 1, 1,
-0.5416296, -0.07928386, -2.476714, 1, 1, 1, 1, 1,
-0.5405803, 1.673211, 0.988755, 1, 1, 1, 1, 1,
-0.534008, -1.097423, -1.860435, 1, 1, 1, 1, 1,
-0.5321935, -0.2412259, -1.690271, 1, 1, 1, 1, 1,
-0.5287091, 1.005422, -2.513821, 1, 1, 1, 1, 1,
-0.5213946, -0.2707921, -1.599799, 1, 1, 1, 1, 1,
-0.5213096, -2.290432, -4.269864, 1, 1, 1, 1, 1,
-0.5166458, 0.7764727, 0.539049, 1, 1, 1, 1, 1,
-0.5163617, -2.294735, -3.633677, 1, 1, 1, 1, 1,
-0.513609, 0.04247977, -2.140198, 1, 1, 1, 1, 1,
-0.5128703, 0.08080728, -2.146921, 1, 1, 1, 1, 1,
-0.5082635, -0.5614401, -2.693488, 1, 1, 1, 1, 1,
-0.5065905, -1.122843, -1.288524, 1, 1, 1, 1, 1,
-0.5054785, 0.4619452, 2.390237, 1, 1, 1, 1, 1,
-0.5052569, -1.12831, -3.535179, 1, 1, 1, 1, 1,
-0.5002237, 2.574547, 1.18383, 0, 0, 1, 1, 1,
-0.4872841, 1.166604, 0.6012486, 1, 0, 0, 1, 1,
-0.4871754, 0.9482401, -0.8473521, 1, 0, 0, 1, 1,
-0.4850297, -1.159411, -0.8526496, 1, 0, 0, 1, 1,
-0.4836491, 2.031052, 0.6898481, 1, 0, 0, 1, 1,
-0.4813099, 0.9789422, 0.6257979, 1, 0, 0, 1, 1,
-0.4695955, -0.5192193, -2.421236, 0, 0, 0, 1, 1,
-0.4673909, 0.8716719, -2.208046, 0, 0, 0, 1, 1,
-0.4631188, 0.4471155, -0.9880181, 0, 0, 0, 1, 1,
-0.4626941, 1.317445, -0.2578033, 0, 0, 0, 1, 1,
-0.4619546, -0.9090455, -2.26079, 0, 0, 0, 1, 1,
-0.4600996, 0.1529378, -2.067932, 0, 0, 0, 1, 1,
-0.4574108, -2.162246, -4.479078, 0, 0, 0, 1, 1,
-0.4569103, -0.7501901, -3.244204, 1, 1, 1, 1, 1,
-0.4551581, -1.593107, -2.800513, 1, 1, 1, 1, 1,
-0.4535951, 0.2775781, 0.2982513, 1, 1, 1, 1, 1,
-0.4509218, -0.5640929, -2.753155, 1, 1, 1, 1, 1,
-0.4456832, -1.100235, -3.963193, 1, 1, 1, 1, 1,
-0.4338669, -0.8295761, -2.027888, 1, 1, 1, 1, 1,
-0.4293856, 1.210737, -0.3634011, 1, 1, 1, 1, 1,
-0.4251506, 0.6058368, 1.054461, 1, 1, 1, 1, 1,
-0.4203421, 0.225045, -2.680777, 1, 1, 1, 1, 1,
-0.41798, -0.4882589, -2.687614, 1, 1, 1, 1, 1,
-0.4158301, -1.904697, -4.15948, 1, 1, 1, 1, 1,
-0.4145927, 0.924352, -0.5502444, 1, 1, 1, 1, 1,
-0.4110983, -0.3585462, -2.014226, 1, 1, 1, 1, 1,
-0.4109631, -1.196021, -1.185674, 1, 1, 1, 1, 1,
-0.4056889, -0.4764712, -1.660199, 1, 1, 1, 1, 1,
-0.4046525, 0.2430182, -0.1512119, 0, 0, 1, 1, 1,
-0.4029877, 0.6148019, -0.1329536, 1, 0, 0, 1, 1,
-0.4016988, -0.93626, -1.696045, 1, 0, 0, 1, 1,
-0.3976854, -0.4030464, -1.099122, 1, 0, 0, 1, 1,
-0.3947061, 1.251818, 1.105989, 1, 0, 0, 1, 1,
-0.3937025, 0.3200715, -1.384104, 1, 0, 0, 1, 1,
-0.3904428, -2.306369, -3.122519, 0, 0, 0, 1, 1,
-0.3888687, 0.3652841, -1.670049, 0, 0, 0, 1, 1,
-0.3862161, -0.4946071, -1.036238, 0, 0, 0, 1, 1,
-0.3849053, -0.5869747, -1.553284, 0, 0, 0, 1, 1,
-0.3837927, -1.831262, -2.178983, 0, 0, 0, 1, 1,
-0.3764911, -0.6901697, -2.990608, 0, 0, 0, 1, 1,
-0.3739642, -1.031304, -1.660705, 0, 0, 0, 1, 1,
-0.3739347, -0.2800556, -3.856112, 1, 1, 1, 1, 1,
-0.3738025, 1.948113, -0.3022861, 1, 1, 1, 1, 1,
-0.3707737, -0.4520003, -1.378272, 1, 1, 1, 1, 1,
-0.3687147, 0.5550778, -0.7865419, 1, 1, 1, 1, 1,
-0.3682572, 0.1036552, -2.1232, 1, 1, 1, 1, 1,
-0.3676031, -0.4125493, -1.736863, 1, 1, 1, 1, 1,
-0.3640659, 0.3570018, 0.9173613, 1, 1, 1, 1, 1,
-0.3613622, -0.8423422, -3.115727, 1, 1, 1, 1, 1,
-0.3590558, -0.795948, -3.507543, 1, 1, 1, 1, 1,
-0.3576857, -0.900961, -3.248759, 1, 1, 1, 1, 1,
-0.356254, -0.3164417, -2.665348, 1, 1, 1, 1, 1,
-0.3480199, -2.09279, -1.802953, 1, 1, 1, 1, 1,
-0.3461544, -0.4749306, -1.874944, 1, 1, 1, 1, 1,
-0.342514, -0.6301268, -2.660566, 1, 1, 1, 1, 1,
-0.3423594, 0.6342891, 0.5765793, 1, 1, 1, 1, 1,
-0.3396063, 0.05254629, -0.2569849, 0, 0, 1, 1, 1,
-0.3383792, -0.5154361, -0.3610764, 1, 0, 0, 1, 1,
-0.3336022, -0.1984062, -1.751637, 1, 0, 0, 1, 1,
-0.3321831, -1.147082, -1.33271, 1, 0, 0, 1, 1,
-0.3289463, 1.129123, -0.1089964, 1, 0, 0, 1, 1,
-0.3252928, 0.1340711, -1.14339, 1, 0, 0, 1, 1,
-0.3217468, 0.7739177, -2.153422, 0, 0, 0, 1, 1,
-0.3195156, 1.434944, -1.918941, 0, 0, 0, 1, 1,
-0.3153497, -1.691144, -3.342127, 0, 0, 0, 1, 1,
-0.3086537, 1.790083, -0.191162, 0, 0, 0, 1, 1,
-0.3077005, 0.605555, -0.7109309, 0, 0, 0, 1, 1,
-0.297713, -0.3476414, -2.306708, 0, 0, 0, 1, 1,
-0.2971985, 0.9735312, -0.7346708, 0, 0, 0, 1, 1,
-0.2959051, 0.7023294, 0.4205921, 1, 1, 1, 1, 1,
-0.2921294, 0.6505041, -0.3535821, 1, 1, 1, 1, 1,
-0.2920544, 1.695415, -0.5674684, 1, 1, 1, 1, 1,
-0.2920391, -0.4201445, -2.417891, 1, 1, 1, 1, 1,
-0.2917251, -2.498659, -2.476828, 1, 1, 1, 1, 1,
-0.2833891, -1.986301, -1.434436, 1, 1, 1, 1, 1,
-0.2752454, -1.752621, -4.004874, 1, 1, 1, 1, 1,
-0.2728507, 0.1888908, -2.32138, 1, 1, 1, 1, 1,
-0.2721861, -0.8860977, -2.164213, 1, 1, 1, 1, 1,
-0.2708952, 1.0165, -0.2882085, 1, 1, 1, 1, 1,
-0.2692856, -0.50567, -0.8124739, 1, 1, 1, 1, 1,
-0.2675754, 1.151087, 1.556692, 1, 1, 1, 1, 1,
-0.2650194, 0.4359684, -0.9249428, 1, 1, 1, 1, 1,
-0.2641096, -0.3578857, -1.941936, 1, 1, 1, 1, 1,
-0.2639859, -0.06860236, -2.84903, 1, 1, 1, 1, 1,
-0.2600907, -0.8627424, -2.025418, 0, 0, 1, 1, 1,
-0.2580145, -1.541708, -3.200339, 1, 0, 0, 1, 1,
-0.2548423, -1.165936, -2.869272, 1, 0, 0, 1, 1,
-0.2509402, 0.5303679, -2.352248, 1, 0, 0, 1, 1,
-0.2467748, 1.483282, 0.1068008, 1, 0, 0, 1, 1,
-0.2424224, -0.9617038, -3.472272, 1, 0, 0, 1, 1,
-0.2420013, 0.6572024, -1.10055, 0, 0, 0, 1, 1,
-0.2373283, -1.079574, -1.197462, 0, 0, 0, 1, 1,
-0.2357164, -0.9209217, -3.592401, 0, 0, 0, 1, 1,
-0.230592, -0.9665051, -3.784323, 0, 0, 0, 1, 1,
-0.227359, 1.306553, 0.1755472, 0, 0, 0, 1, 1,
-0.2262378, -0.194242, -3.972575, 0, 0, 0, 1, 1,
-0.2260809, -0.6507649, -4.62826, 0, 0, 0, 1, 1,
-0.2241053, 0.2837892, -0.4084548, 1, 1, 1, 1, 1,
-0.2178272, -0.08428086, -2.876467, 1, 1, 1, 1, 1,
-0.2175813, 2.732329, -1.843338, 1, 1, 1, 1, 1,
-0.2171526, 0.2347536, 0.3496181, 1, 1, 1, 1, 1,
-0.2145845, -0.9427826, -3.133106, 1, 1, 1, 1, 1,
-0.2057822, -1.060458, -2.199655, 1, 1, 1, 1, 1,
-0.2001862, -0.313716, -3.718163, 1, 1, 1, 1, 1,
-0.1968853, 0.1762996, -1.234376, 1, 1, 1, 1, 1,
-0.1951891, 1.764936, 0.5479578, 1, 1, 1, 1, 1,
-0.1948895, -0.8933232, -3.699767, 1, 1, 1, 1, 1,
-0.1941672, 0.4571033, 0.6824765, 1, 1, 1, 1, 1,
-0.1940366, -0.01443201, -0.8347504, 1, 1, 1, 1, 1,
-0.1875018, 0.2651193, -0.2159677, 1, 1, 1, 1, 1,
-0.1860522, -0.2757614, -2.788292, 1, 1, 1, 1, 1,
-0.1810294, 2.054003, -1.143199, 1, 1, 1, 1, 1,
-0.1799422, 1.496245, -0.06882581, 0, 0, 1, 1, 1,
-0.1794194, -0.9603902, -3.751139, 1, 0, 0, 1, 1,
-0.1732698, -0.8471142, -3.512345, 1, 0, 0, 1, 1,
-0.1718716, -0.6605027, -2.839406, 1, 0, 0, 1, 1,
-0.1714388, -0.8575867, -2.107596, 1, 0, 0, 1, 1,
-0.1674914, 1.334525, 0.259071, 1, 0, 0, 1, 1,
-0.1542256, 0.5136827, 2.22517, 0, 0, 0, 1, 1,
-0.1511951, 2.28204, 0.6140927, 0, 0, 0, 1, 1,
-0.1497899, -1.49351, -3.391333, 0, 0, 0, 1, 1,
-0.146907, -1.431343, -3.446832, 0, 0, 0, 1, 1,
-0.1465119, -0.3979332, -2.780247, 0, 0, 0, 1, 1,
-0.1362835, -0.9692566, -2.79336, 0, 0, 0, 1, 1,
-0.1304174, -0.2121672, -2.871674, 0, 0, 0, 1, 1,
-0.1297003, 0.5186446, -0.9947956, 1, 1, 1, 1, 1,
-0.1285804, -0.1174083, -2.072843, 1, 1, 1, 1, 1,
-0.1249465, -0.3988502, -2.096939, 1, 1, 1, 1, 1,
-0.124728, 1.576469, -1.357068, 1, 1, 1, 1, 1,
-0.1245609, 0.7640467, 2.18233, 1, 1, 1, 1, 1,
-0.1156183, -0.5158406, -4.146972, 1, 1, 1, 1, 1,
-0.113566, 0.2588044, -0.2685983, 1, 1, 1, 1, 1,
-0.1133523, 0.3168688, -0.1962656, 1, 1, 1, 1, 1,
-0.1110864, 0.2500353, -0.5869259, 1, 1, 1, 1, 1,
-0.1109129, 0.5609068, 0.5300958, 1, 1, 1, 1, 1,
-0.106247, -0.4277956, -3.030713, 1, 1, 1, 1, 1,
-0.1053393, 0.322711, 0.3686547, 1, 1, 1, 1, 1,
-0.1021832, 1.027092, -0.5618205, 1, 1, 1, 1, 1,
-0.1013997, 0.1434099, 0.6767193, 1, 1, 1, 1, 1,
-0.09804674, -0.103757, -1.552775, 1, 1, 1, 1, 1,
-0.09617046, -0.2559598, -3.282772, 0, 0, 1, 1, 1,
-0.0959303, 1.136859, 0.1660553, 1, 0, 0, 1, 1,
-0.09589285, -1.599651, -2.822251, 1, 0, 0, 1, 1,
-0.08887794, 0.5753921, -2.934729, 1, 0, 0, 1, 1,
-0.08572865, 0.5007108, -0.00588874, 1, 0, 0, 1, 1,
-0.08461773, 1.044735, 1.005868, 1, 0, 0, 1, 1,
-0.07982819, 0.8628775, 0.7470488, 0, 0, 0, 1, 1,
-0.07407377, -0.3697338, -3.540335, 0, 0, 0, 1, 1,
-0.06918568, -1.565104, -2.947773, 0, 0, 0, 1, 1,
-0.06541713, -0.7423681, -3.592279, 0, 0, 0, 1, 1,
-0.06452819, -1.47086, -2.392243, 0, 0, 0, 1, 1,
-0.06259082, 0.8694471, 0.5810506, 0, 0, 0, 1, 1,
-0.05806695, 0.2514536, -0.8027965, 0, 0, 0, 1, 1,
-0.05378123, -0.9274176, -3.922554, 1, 1, 1, 1, 1,
-0.05214947, -1.326656, -1.940626, 1, 1, 1, 1, 1,
-0.0501184, 1.785686, -0.3104784, 1, 1, 1, 1, 1,
-0.04951578, -1.221749, -2.449685, 1, 1, 1, 1, 1,
-0.04829059, -0.4572996, -2.235383, 1, 1, 1, 1, 1,
-0.04754567, 0.3157206, 0.09139246, 1, 1, 1, 1, 1,
-0.04608802, -0.2745761, -3.433678, 1, 1, 1, 1, 1,
-0.04506999, -0.9107565, -4.31316, 1, 1, 1, 1, 1,
-0.04268532, -1.375017, -3.066869, 1, 1, 1, 1, 1,
-0.0401721, -0.731164, -3.798736, 1, 1, 1, 1, 1,
-0.03904277, 0.2236005, 0.3920818, 1, 1, 1, 1, 1,
-0.03816061, -0.590588, -2.056274, 1, 1, 1, 1, 1,
-0.03738794, 1.570868, -1.889386, 1, 1, 1, 1, 1,
-0.03640524, -0.01828759, -1.099483, 1, 1, 1, 1, 1,
-0.02903697, -0.4509051, -1.173729, 1, 1, 1, 1, 1,
-0.02813935, -1.286858, -1.919416, 0, 0, 1, 1, 1,
-0.02385152, -0.8653522, -3.374465, 1, 0, 0, 1, 1,
-0.02050232, 0.1787316, -1.102699, 1, 0, 0, 1, 1,
-0.01903772, 0.1101809, -0.1693754, 1, 0, 0, 1, 1,
-0.01419799, -0.07594129, -4.868722, 1, 0, 0, 1, 1,
-0.00758976, 0.9546651, -1.599995, 1, 0, 0, 1, 1,
-0.006167571, -0.02471242, -2.354559, 0, 0, 0, 1, 1,
-0.004060065, -0.03878789, -1.847996, 0, 0, 0, 1, 1,
0.0007830549, -0.4182122, 3.516947, 0, 0, 0, 1, 1,
0.0009623746, -0.7129002, 2.416799, 0, 0, 0, 1, 1,
0.001612756, 0.1965342, 1.153607, 0, 0, 0, 1, 1,
0.003028206, -0.208688, 2.139071, 0, 0, 0, 1, 1,
0.01262995, -1.699366, 3.99665, 0, 0, 0, 1, 1,
0.01466416, 0.4482851, 0.2905596, 1, 1, 1, 1, 1,
0.01579462, -0.8148237, 3.619114, 1, 1, 1, 1, 1,
0.02280765, 0.5375096, -1.37939, 1, 1, 1, 1, 1,
0.02581749, 0.3954276, 0.02382757, 1, 1, 1, 1, 1,
0.02750383, 0.2308271, -0.227481, 1, 1, 1, 1, 1,
0.02786085, -1.128094, 2.595127, 1, 1, 1, 1, 1,
0.02856627, 0.08408578, 0.5997175, 1, 1, 1, 1, 1,
0.03024836, 0.2086182, 0.4885678, 1, 1, 1, 1, 1,
0.03074299, 0.07348577, -0.6555552, 1, 1, 1, 1, 1,
0.03672684, -1.379639, 2.805535, 1, 1, 1, 1, 1,
0.04482972, 1.353433, 0.3998976, 1, 1, 1, 1, 1,
0.05150906, -2.372631, 2.566319, 1, 1, 1, 1, 1,
0.05393799, 0.9607481, -0.8310558, 1, 1, 1, 1, 1,
0.05447141, 0.7952133, 0.4776971, 1, 1, 1, 1, 1,
0.05463181, 0.817612, -0.08145665, 1, 1, 1, 1, 1,
0.05801896, -0.3106333, 2.888235, 0, 0, 1, 1, 1,
0.06291743, 0.4559678, 0.3535973, 1, 0, 0, 1, 1,
0.06465086, -0.6350282, 3.081456, 1, 0, 0, 1, 1,
0.06533396, -0.9800301, 2.527108, 1, 0, 0, 1, 1,
0.06596199, 0.3852563, 1.575932, 1, 0, 0, 1, 1,
0.06928188, -1.304781, 1.562307, 1, 0, 0, 1, 1,
0.07147904, 0.4942453, 0.8813153, 0, 0, 0, 1, 1,
0.07231833, 0.2602215, -0.4017478, 0, 0, 0, 1, 1,
0.08112485, 0.5943359, -0.7258415, 0, 0, 0, 1, 1,
0.08186062, 1.759423, 0.6470355, 0, 0, 0, 1, 1,
0.09491888, -0.7558907, 0.8546773, 0, 0, 0, 1, 1,
0.09562314, 2.507364, 1.175256, 0, 0, 0, 1, 1,
0.09677507, -1.133443, 2.962368, 0, 0, 0, 1, 1,
0.09795873, 1.61658, 0.1321183, 1, 1, 1, 1, 1,
0.1001834, -0.0426606, -0.2826144, 1, 1, 1, 1, 1,
0.1062321, 0.8006734, 0.9859774, 1, 1, 1, 1, 1,
0.106721, -0.02060601, 2.108545, 1, 1, 1, 1, 1,
0.1069487, -1.310087, 2.780617, 1, 1, 1, 1, 1,
0.1074507, 0.4183624, -0.1540586, 1, 1, 1, 1, 1,
0.1089797, -0.05425216, 1.513907, 1, 1, 1, 1, 1,
0.1122963, -1.265804, 2.699134, 1, 1, 1, 1, 1,
0.1151393, -1.493509, 3.019079, 1, 1, 1, 1, 1,
0.1153984, 0.7607527, -1.741932, 1, 1, 1, 1, 1,
0.1174618, -1.654463, 4.798307, 1, 1, 1, 1, 1,
0.1178043, -0.0621189, 2.725039, 1, 1, 1, 1, 1,
0.1224678, -0.1124503, 1.654579, 1, 1, 1, 1, 1,
0.126513, 0.8820644, -1.205532, 1, 1, 1, 1, 1,
0.1293487, -0.6593206, 2.581683, 1, 1, 1, 1, 1,
0.1313789, -0.04113797, 0.8109257, 0, 0, 1, 1, 1,
0.1319583, -0.3804301, 2.577857, 1, 0, 0, 1, 1,
0.1324321, -1.026281, 0.7551429, 1, 0, 0, 1, 1,
0.1354365, -1.131083, 5.275055, 1, 0, 0, 1, 1,
0.1359518, -0.9571023, 2.944274, 1, 0, 0, 1, 1,
0.1372464, 0.8397467, -0.1623879, 1, 0, 0, 1, 1,
0.1450913, 0.5920444, 0.708735, 0, 0, 0, 1, 1,
0.1452631, 0.9068965, 0.6167243, 0, 0, 0, 1, 1,
0.156003, -0.4369359, 2.002283, 0, 0, 0, 1, 1,
0.1568839, 0.277006, 0.3957092, 0, 0, 0, 1, 1,
0.1589493, -0.9992073, 3.063502, 0, 0, 0, 1, 1,
0.1629279, -0.1750731, 2.979496, 0, 0, 0, 1, 1,
0.1659418, -0.4723253, 2.423094, 0, 0, 0, 1, 1,
0.1675194, -0.4748804, 4.737195, 1, 1, 1, 1, 1,
0.1702328, -1.46225, 1.646914, 1, 1, 1, 1, 1,
0.1839766, -0.1836652, 2.256797, 1, 1, 1, 1, 1,
0.1889308, 1.230216, -1.456741, 1, 1, 1, 1, 1,
0.1889458, -0.5119236, 3.048038, 1, 1, 1, 1, 1,
0.1909435, 0.3743849, -0.3060434, 1, 1, 1, 1, 1,
0.2000093, 0.06697923, 0.4708614, 1, 1, 1, 1, 1,
0.2009324, 1.030934, -0.6589922, 1, 1, 1, 1, 1,
0.2028712, 0.7455526, -0.9690145, 1, 1, 1, 1, 1,
0.203061, 0.2126121, 1.184577, 1, 1, 1, 1, 1,
0.2095836, -0.9101911, 2.233246, 1, 1, 1, 1, 1,
0.2154959, 0.06446818, 0.7741454, 1, 1, 1, 1, 1,
0.2168928, 0.7487716, 0.5766777, 1, 1, 1, 1, 1,
0.2211097, 0.465904, 0.4252569, 1, 1, 1, 1, 1,
0.2292555, -0.7447569, 1.253619, 1, 1, 1, 1, 1,
0.2326912, 0.1325279, 1.664531, 0, 0, 1, 1, 1,
0.2338967, 0.3333596, 0.623693, 1, 0, 0, 1, 1,
0.2383761, 0.005888421, 1.293476, 1, 0, 0, 1, 1,
0.2406109, -0.6450809, 3.346732, 1, 0, 0, 1, 1,
0.2437615, 1.416527, -0.8136567, 1, 0, 0, 1, 1,
0.2437816, -0.1410193, 1.156983, 1, 0, 0, 1, 1,
0.2443225, 1.117463, 1.175348, 0, 0, 0, 1, 1,
0.2454958, -0.2559212, 1.266109, 0, 0, 0, 1, 1,
0.2473807, 0.2221142, 0.765115, 0, 0, 0, 1, 1,
0.247553, -0.9063807, 1.254719, 0, 0, 0, 1, 1,
0.2497523, 1.362391, 0.3106709, 0, 0, 0, 1, 1,
0.2543948, -0.1964682, 2.875172, 0, 0, 0, 1, 1,
0.2672049, -0.7597159, 2.513036, 0, 0, 0, 1, 1,
0.2678933, -1.018523, 2.165041, 1, 1, 1, 1, 1,
0.2707412, 0.1361485, 0.2355527, 1, 1, 1, 1, 1,
0.2783124, 0.7960916, 0.07816526, 1, 1, 1, 1, 1,
0.2797954, -0.7051975, 4.233003, 1, 1, 1, 1, 1,
0.2847856, -0.4778143, 1.989598, 1, 1, 1, 1, 1,
0.2895517, -0.4590006, 4.323848, 1, 1, 1, 1, 1,
0.2953177, 1.34808, 0.0356157, 1, 1, 1, 1, 1,
0.2954907, -1.77308, 2.521013, 1, 1, 1, 1, 1,
0.2984028, 0.4149824, 1.915641, 1, 1, 1, 1, 1,
0.3087552, 2.010723, 0.00451329, 1, 1, 1, 1, 1,
0.3125632, -0.8191558, 3.317782, 1, 1, 1, 1, 1,
0.3207186, -1.003142, 3.169958, 1, 1, 1, 1, 1,
0.3238232, 1.652046, 0.4604747, 1, 1, 1, 1, 1,
0.3241782, -1.240663, 1.155236, 1, 1, 1, 1, 1,
0.3314391, 0.06799113, 1.424031, 1, 1, 1, 1, 1,
0.3320983, 0.3740255, 1.412074, 0, 0, 1, 1, 1,
0.3324933, 0.1551937, 0.9878903, 1, 0, 0, 1, 1,
0.3347374, 1.194559, 0.287902, 1, 0, 0, 1, 1,
0.3381496, 0.2782559, 1.23032, 1, 0, 0, 1, 1,
0.3447888, 0.8320845, -0.8437377, 1, 0, 0, 1, 1,
0.3476398, 0.0749335, 1.72285, 1, 0, 0, 1, 1,
0.3478243, 2.068812, 0.6789899, 0, 0, 0, 1, 1,
0.3500129, -1.01613, 2.773341, 0, 0, 0, 1, 1,
0.3523549, 0.3267066, 0.2315045, 0, 0, 0, 1, 1,
0.3637705, 0.479663, 1.014727, 0, 0, 0, 1, 1,
0.3669529, 1.66113, 0.5335835, 0, 0, 0, 1, 1,
0.3675392, 0.495529, 2.345402, 0, 0, 0, 1, 1,
0.3776493, -0.08335572, 0.4416342, 0, 0, 0, 1, 1,
0.3797855, 0.9076221, 0.8863125, 1, 1, 1, 1, 1,
0.3803864, -1.196909, 3.378505, 1, 1, 1, 1, 1,
0.3812052, -1.443459, 2.957726, 1, 1, 1, 1, 1,
0.389756, -1.183612, 2.227172, 1, 1, 1, 1, 1,
0.3937958, 1.861709, 1.292892, 1, 1, 1, 1, 1,
0.3943365, -0.04059928, 1.791554, 1, 1, 1, 1, 1,
0.4002592, 0.3499021, -1.525307, 1, 1, 1, 1, 1,
0.4006802, 1.610124, 0.3133585, 1, 1, 1, 1, 1,
0.4025443, -0.01092278, 1.048362, 1, 1, 1, 1, 1,
0.4044408, -0.7347792, 4.431044, 1, 1, 1, 1, 1,
0.4091416, -0.3057131, 2.747171, 1, 1, 1, 1, 1,
0.4107216, -0.5263917, 2.461854, 1, 1, 1, 1, 1,
0.4122537, 1.118025, -0.3560693, 1, 1, 1, 1, 1,
0.4193113, 0.7868738, 0.4412031, 1, 1, 1, 1, 1,
0.4209003, 1.092374, -0.1565628, 1, 1, 1, 1, 1,
0.4233474, -0.8913068, 3.349985, 0, 0, 1, 1, 1,
0.4241063, 1.265066, -0.5901707, 1, 0, 0, 1, 1,
0.4266572, -0.8087086, 2.065507, 1, 0, 0, 1, 1,
0.427257, 0.4382279, 1.791827, 1, 0, 0, 1, 1,
0.4395007, 2.499533, -1.803299, 1, 0, 0, 1, 1,
0.4402773, 1.494795, -0.03327212, 1, 0, 0, 1, 1,
0.4443167, 0.7927977, 1.299946, 0, 0, 0, 1, 1,
0.4445715, 0.5414459, 1.448932, 0, 0, 0, 1, 1,
0.4452331, -1.217121, 4.319688, 0, 0, 0, 1, 1,
0.4468372, 0.8299701, -0.2136255, 0, 0, 0, 1, 1,
0.4483629, -2.248014, 3.747306, 0, 0, 0, 1, 1,
0.459401, 2.792824, 0.5141956, 0, 0, 0, 1, 1,
0.4601923, -2.146691, 3.639591, 0, 0, 0, 1, 1,
0.4622296, 0.9003501, 0.9926256, 1, 1, 1, 1, 1,
0.4624218, -2.22438, 3.247076, 1, 1, 1, 1, 1,
0.4633372, -1.814017, 3.141657, 1, 1, 1, 1, 1,
0.4697548, -0.6947179, 4.543859, 1, 1, 1, 1, 1,
0.4749973, -0.5603426, 1.766179, 1, 1, 1, 1, 1,
0.4760613, -0.4104228, 2.224141, 1, 1, 1, 1, 1,
0.4771758, 0.001900027, -0.3779281, 1, 1, 1, 1, 1,
0.4774386, -0.03612505, 1.387014, 1, 1, 1, 1, 1,
0.4795017, 0.9264699, -0.7962298, 1, 1, 1, 1, 1,
0.4827651, -0.3736715, 1.491989, 1, 1, 1, 1, 1,
0.484752, -0.1014065, 2.160209, 1, 1, 1, 1, 1,
0.4849689, -2.045373, 2.322202, 1, 1, 1, 1, 1,
0.4855109, 1.338896, -0.9357578, 1, 1, 1, 1, 1,
0.4857789, 1.778553, -0.3688691, 1, 1, 1, 1, 1,
0.4908167, -0.1279006, 4.28827, 1, 1, 1, 1, 1,
0.4909803, -0.6004351, 4.419186, 0, 0, 1, 1, 1,
0.4947382, 1.64915, -1.305653, 1, 0, 0, 1, 1,
0.4958362, 0.2740067, 1.274913, 1, 0, 0, 1, 1,
0.4962336, 1.12467, 2.647366, 1, 0, 0, 1, 1,
0.4965181, 0.78284, 0.9569443, 1, 0, 0, 1, 1,
0.4968342, 0.4112947, 3.51588, 1, 0, 0, 1, 1,
0.5009243, -0.7585051, 2.620687, 0, 0, 0, 1, 1,
0.5033758, 0.07934623, 0.6898078, 0, 0, 0, 1, 1,
0.5039216, -0.05069138, 1.755767, 0, 0, 0, 1, 1,
0.5056798, -0.01503974, 1.898154, 0, 0, 0, 1, 1,
0.5074662, -0.3139491, 2.25048, 0, 0, 0, 1, 1,
0.5077888, -0.6969714, 3.511715, 0, 0, 0, 1, 1,
0.5082669, -1.131594, 1.717446, 0, 0, 0, 1, 1,
0.5083498, 0.7164859, 0.07959622, 1, 1, 1, 1, 1,
0.5148821, -1.33902, 3.1121, 1, 1, 1, 1, 1,
0.5158826, 1.732702, -1.508138, 1, 1, 1, 1, 1,
0.5238633, 0.8076084, 0.2651895, 1, 1, 1, 1, 1,
0.5263789, -0.06809845, -0.08362118, 1, 1, 1, 1, 1,
0.5278111, -0.362985, 1.788847, 1, 1, 1, 1, 1,
0.5290912, 0.5640135, 2.455569, 1, 1, 1, 1, 1,
0.532014, 0.2452161, 2.362619, 1, 1, 1, 1, 1,
0.5389194, -1.118819, 3.037997, 1, 1, 1, 1, 1,
0.5400071, -0.1002299, 1.042964, 1, 1, 1, 1, 1,
0.5406114, 0.5057054, -1.8765, 1, 1, 1, 1, 1,
0.5447422, 0.7785587, -0.6223766, 1, 1, 1, 1, 1,
0.5577196, -0.7279425, 0.5789467, 1, 1, 1, 1, 1,
0.5601544, -2.257143, 3.074815, 1, 1, 1, 1, 1,
0.561229, 0.9196084, -0.05913009, 1, 1, 1, 1, 1,
0.5655248, 0.6246644, 2.571693, 0, 0, 1, 1, 1,
0.5675604, 0.06658882, 2.833872, 1, 0, 0, 1, 1,
0.5716536, -0.7815201, 1.798903, 1, 0, 0, 1, 1,
0.573446, -1.054802, 1.956935, 1, 0, 0, 1, 1,
0.576751, 1.027923, -1.760187, 1, 0, 0, 1, 1,
0.5768633, 1.064546, -2.61009, 1, 0, 0, 1, 1,
0.5813578, 0.8528351, 0.5182201, 0, 0, 0, 1, 1,
0.584411, 0.1422842, 0.6883941, 0, 0, 0, 1, 1,
0.5885401, -1.117346, 1.842722, 0, 0, 0, 1, 1,
0.5923758, 0.02347033, 2.50279, 0, 0, 0, 1, 1,
0.5985515, 1.112695, 0.9107259, 0, 0, 0, 1, 1,
0.6042491, 1.832658, -0.4038422, 0, 0, 0, 1, 1,
0.6069922, 1.058952, 2.645833, 0, 0, 0, 1, 1,
0.6073879, -0.08509704, 0.2976483, 1, 1, 1, 1, 1,
0.6083602, -1.868764, 1.923217, 1, 1, 1, 1, 1,
0.6098072, -1.68354, 1.665, 1, 1, 1, 1, 1,
0.6105571, 0.2840473, 1.545562, 1, 1, 1, 1, 1,
0.6122987, -0.2341022, 2.358404, 1, 1, 1, 1, 1,
0.6124033, -0.9833681, 4.137522, 1, 1, 1, 1, 1,
0.6142899, -0.7649388, 2.329023, 1, 1, 1, 1, 1,
0.6172574, -0.7793282, 2.459514, 1, 1, 1, 1, 1,
0.620943, 0.8190772, 0.8717044, 1, 1, 1, 1, 1,
0.6298314, 0.8973111, -0.2844278, 1, 1, 1, 1, 1,
0.635698, 0.5409876, -0.3798724, 1, 1, 1, 1, 1,
0.6462161, -0.6086366, 1.723075, 1, 1, 1, 1, 1,
0.6478683, 0.1719424, 2.784381, 1, 1, 1, 1, 1,
0.6486861, -0.6186852, 3.085986, 1, 1, 1, 1, 1,
0.650583, 1.042362, 0.2654517, 1, 1, 1, 1, 1,
0.6506097, -0.4472051, 1.895235, 0, 0, 1, 1, 1,
0.65128, -0.7721526, 2.475198, 1, 0, 0, 1, 1,
0.6546065, -0.759303, 1.725934, 1, 0, 0, 1, 1,
0.663033, 0.4708903, -0.0790133, 1, 0, 0, 1, 1,
0.6713104, -0.3193291, 1.434857, 1, 0, 0, 1, 1,
0.6721907, -1.351549, 1.766392, 1, 0, 0, 1, 1,
0.6749433, 1.131748, 0.568603, 0, 0, 0, 1, 1,
0.6758882, 0.4201457, 0.4933674, 0, 0, 0, 1, 1,
0.6759953, 0.3274077, 0.6894801, 0, 0, 0, 1, 1,
0.6771056, -0.2197137, 0.8598852, 0, 0, 0, 1, 1,
0.6788917, 1.022877, 0.5048336, 0, 0, 0, 1, 1,
0.6820537, -0.2129359, 1.34574, 0, 0, 0, 1, 1,
0.6863307, 0.3765691, 0.2965779, 0, 0, 0, 1, 1,
0.6896499, -0.4170416, 3.199188, 1, 1, 1, 1, 1,
0.6938628, -1.957583, 1.347478, 1, 1, 1, 1, 1,
0.6970151, 0.2771435, 2.958435, 1, 1, 1, 1, 1,
0.6998112, 0.05422524, 2.641421, 1, 1, 1, 1, 1,
0.700003, 0.3191399, 0.8398213, 1, 1, 1, 1, 1,
0.7026097, 1.163927, 2.1568, 1, 1, 1, 1, 1,
0.7068196, -0.5014884, 1.896857, 1, 1, 1, 1, 1,
0.7198117, -1.168076, 3.519846, 1, 1, 1, 1, 1,
0.7224734, 2.374417, 0.1105609, 1, 1, 1, 1, 1,
0.7290643, 1.520787, 0.5644287, 1, 1, 1, 1, 1,
0.7320801, -2.190419, 2.571647, 1, 1, 1, 1, 1,
0.7323834, 0.06458559, 1.197864, 1, 1, 1, 1, 1,
0.7347409, -1.241975, 3.887506, 1, 1, 1, 1, 1,
0.7402394, 0.7759548, 0.3896913, 1, 1, 1, 1, 1,
0.740256, 1.248333, 0.8251055, 1, 1, 1, 1, 1,
0.7408748, -0.1931539, 1.491468, 0, 0, 1, 1, 1,
0.7430126, -0.8642198, 2.619609, 1, 0, 0, 1, 1,
0.746915, 0.1326385, 2.686029, 1, 0, 0, 1, 1,
0.7504894, -0.01509655, 2.003091, 1, 0, 0, 1, 1,
0.7517121, 1.43787, 1.271461, 1, 0, 0, 1, 1,
0.7519951, -1.648131, 2.040579, 1, 0, 0, 1, 1,
0.7592326, -0.5010559, 1.549257, 0, 0, 0, 1, 1,
0.760527, -1.508868, 2.235272, 0, 0, 0, 1, 1,
0.7606639, 1.020194, 0.7500872, 0, 0, 0, 1, 1,
0.7614164, 0.01967684, 0.8515604, 0, 0, 0, 1, 1,
0.7658197, 0.2567188, 1.461154, 0, 0, 0, 1, 1,
0.7675076, 0.1391001, 0.708168, 0, 0, 0, 1, 1,
0.7691489, -0.2411988, 2.211673, 0, 0, 0, 1, 1,
0.7692288, 0.5918497, 0.6090346, 1, 1, 1, 1, 1,
0.7706618, -0.4687638, 2.003652, 1, 1, 1, 1, 1,
0.7758343, -0.7082638, 1.752614, 1, 1, 1, 1, 1,
0.783063, 1.673711, 0.3998837, 1, 1, 1, 1, 1,
0.7971018, 0.5396758, 0.692969, 1, 1, 1, 1, 1,
0.8007235, -1.412992, 2.859314, 1, 1, 1, 1, 1,
0.8145642, 0.2380108, -0.003748716, 1, 1, 1, 1, 1,
0.8152709, -0.6992772, 3.427468, 1, 1, 1, 1, 1,
0.8168706, -0.2924329, 3.485801, 1, 1, 1, 1, 1,
0.8282256, -0.2220004, 0.1255226, 1, 1, 1, 1, 1,
0.8296778, -0.7972576, 3.285571, 1, 1, 1, 1, 1,
0.8386125, 1.538278, 1.074419, 1, 1, 1, 1, 1,
0.8486513, -0.9724154, 1.862042, 1, 1, 1, 1, 1,
0.8540112, -0.09151606, 3.779118, 1, 1, 1, 1, 1,
0.8567774, 0.4113957, 1.458399, 1, 1, 1, 1, 1,
0.8572906, -0.7572355, 1.515279, 0, 0, 1, 1, 1,
0.8594112, -0.5569969, 1.565325, 1, 0, 0, 1, 1,
0.8662689, 1.320922, -0.005507667, 1, 0, 0, 1, 1,
0.8678215, -0.9822292, 1.913478, 1, 0, 0, 1, 1,
0.8766527, 1.472117, 1.454356, 1, 0, 0, 1, 1,
0.8807359, -0.4166934, 2.82901, 1, 0, 0, 1, 1,
0.8848151, -0.7840528, 2.846431, 0, 0, 0, 1, 1,
0.8957983, -0.5541547, 2.259602, 0, 0, 0, 1, 1,
0.8977906, -0.4200172, 2.442081, 0, 0, 0, 1, 1,
0.9057734, -0.2843482, 2.065397, 0, 0, 0, 1, 1,
0.9093341, 0.9662287, 0.3417352, 0, 0, 0, 1, 1,
0.9134942, 1.052681, 1.181335, 0, 0, 0, 1, 1,
0.9291539, 1.980182, -0.2144659, 0, 0, 0, 1, 1,
0.930631, 0.08270316, 1.312806, 1, 1, 1, 1, 1,
0.938875, -1.209711, 0.4439565, 1, 1, 1, 1, 1,
0.9396066, 1.588775, 1.685749, 1, 1, 1, 1, 1,
0.9397323, -0.8310264, 3.377469, 1, 1, 1, 1, 1,
0.9407899, -0.8116668, 2.53169, 1, 1, 1, 1, 1,
0.9419904, -1.681341, 3.225706, 1, 1, 1, 1, 1,
0.9447109, 0.1469086, 0.3612975, 1, 1, 1, 1, 1,
0.9493958, 0.8918707, 0.5019376, 1, 1, 1, 1, 1,
0.9643704, -1.127712, 2.963109, 1, 1, 1, 1, 1,
0.9668058, -0.8916388, 2.612948, 1, 1, 1, 1, 1,
0.9688099, -0.9015425, 2.013102, 1, 1, 1, 1, 1,
0.9715437, 1.271597, 0.005749174, 1, 1, 1, 1, 1,
0.9718838, 0.005806773, 2.506691, 1, 1, 1, 1, 1,
0.9737084, -1.992453, 2.861036, 1, 1, 1, 1, 1,
0.9751201, -1.252178, 2.69844, 1, 1, 1, 1, 1,
0.979201, -0.7529026, 2.066205, 0, 0, 1, 1, 1,
0.9851406, -1.370555, 2.016029, 1, 0, 0, 1, 1,
0.9872863, 0.428707, 0.966382, 1, 0, 0, 1, 1,
0.9874814, -0.9484125, 4.139985, 1, 0, 0, 1, 1,
0.9967477, -0.5032533, 1.33788, 1, 0, 0, 1, 1,
1.000604, -0.2483805, 0.9802689, 1, 0, 0, 1, 1,
1.002706, -0.01236961, 0.5525012, 0, 0, 0, 1, 1,
1.007629, -0.6875554, 3.386453, 0, 0, 0, 1, 1,
1.008924, 0.7901804, 0.06185188, 0, 0, 0, 1, 1,
1.013205, 1.493759, -0.4172541, 0, 0, 0, 1, 1,
1.015255, -0.3393226, 2.758155, 0, 0, 0, 1, 1,
1.02392, 0.2458263, 4.348888, 0, 0, 0, 1, 1,
1.027074, 0.2666814, 1.384063, 0, 0, 0, 1, 1,
1.027791, -0.390894, 1.069593, 1, 1, 1, 1, 1,
1.028859, -1.161819, 1.139787, 1, 1, 1, 1, 1,
1.028981, 0.5751466, 0.5105446, 1, 1, 1, 1, 1,
1.029148, -1.010922, 1.716297, 1, 1, 1, 1, 1,
1.032378, -0.3209634, 0.7875257, 1, 1, 1, 1, 1,
1.035324, -2.804885, 5.108223, 1, 1, 1, 1, 1,
1.036164, -1.99229, 0.5341724, 1, 1, 1, 1, 1,
1.037006, 1.072907, 0.6697387, 1, 1, 1, 1, 1,
1.043925, 0.4072971, 1.838399, 1, 1, 1, 1, 1,
1.059556, -1.071258, 2.665655, 1, 1, 1, 1, 1,
1.06005, -0.223263, 1.799664, 1, 1, 1, 1, 1,
1.067128, 0.6879244, 0.1983845, 1, 1, 1, 1, 1,
1.067311, -0.04495126, 0.940154, 1, 1, 1, 1, 1,
1.067319, 0.3674251, 2.218023, 1, 1, 1, 1, 1,
1.068238, -1.341571, 2.331256, 1, 1, 1, 1, 1,
1.07185, 0.04394614, 0.7090708, 0, 0, 1, 1, 1,
1.093414, 0.8654642, -0.2284798, 1, 0, 0, 1, 1,
1.098413, 1.211241, -0.4022602, 1, 0, 0, 1, 1,
1.107308, 0.1385249, 2.189911, 1, 0, 0, 1, 1,
1.112236, 0.9710454, 0.8482395, 1, 0, 0, 1, 1,
1.115288, 0.2114464, 1.823251, 1, 0, 0, 1, 1,
1.122095, -0.4248688, 2.336506, 0, 0, 0, 1, 1,
1.12607, 2.034677, -0.316388, 0, 0, 0, 1, 1,
1.129836, -0.315666, 1.759967, 0, 0, 0, 1, 1,
1.134392, 0.4487666, 0.2638946, 0, 0, 0, 1, 1,
1.136005, 1.093048, 2.014326, 0, 0, 0, 1, 1,
1.144665, 1.502643, 0.1894353, 0, 0, 0, 1, 1,
1.149384, -0.05338005, 0.2819263, 0, 0, 0, 1, 1,
1.150537, -1.29537, 2.542123, 1, 1, 1, 1, 1,
1.151106, 0.5886038, 0.6551787, 1, 1, 1, 1, 1,
1.151712, -0.1749799, 2.785282, 1, 1, 1, 1, 1,
1.151769, 0.7767347, 1.584701, 1, 1, 1, 1, 1,
1.15229, -1.47863, 1.523949, 1, 1, 1, 1, 1,
1.158559, 0.2370726, 2.041544, 1, 1, 1, 1, 1,
1.162692, 0.8239062, 1.526318, 1, 1, 1, 1, 1,
1.164075, -0.5474314, -0.18728, 1, 1, 1, 1, 1,
1.164143, -0.6537153, 0.4396342, 1, 1, 1, 1, 1,
1.167276, -0.2445916, 1.114548, 1, 1, 1, 1, 1,
1.168392, 0.5593093, 1.374755, 1, 1, 1, 1, 1,
1.169589, 2.095681, 3.80581, 1, 1, 1, 1, 1,
1.176986, 1.380033, 1.799194, 1, 1, 1, 1, 1,
1.178597, 0.1697649, 1.648488, 1, 1, 1, 1, 1,
1.193218, 1.756567, -1.734089, 1, 1, 1, 1, 1,
1.196063, 0.8604945, 0.5248746, 0, 0, 1, 1, 1,
1.208433, -1.51216, 0.8013517, 1, 0, 0, 1, 1,
1.209967, 0.9581313, 1.303833, 1, 0, 0, 1, 1,
1.212818, -0.9905099, 2.187858, 1, 0, 0, 1, 1,
1.213192, 2.023078, 1.650271, 1, 0, 0, 1, 1,
1.214742, -0.4984512, 1.696675, 1, 0, 0, 1, 1,
1.220875, -1.006288, 2.216587, 0, 0, 0, 1, 1,
1.226566, 0.3201527, 0.9039175, 0, 0, 0, 1, 1,
1.226588, -0.2324842, 1.746249, 0, 0, 0, 1, 1,
1.226589, 1.080827, -0.07489724, 0, 0, 0, 1, 1,
1.229711, -1.337416, 3.450819, 0, 0, 0, 1, 1,
1.232555, -0.4402083, 2.950635, 0, 0, 0, 1, 1,
1.232876, -0.7968817, 1.107328, 0, 0, 0, 1, 1,
1.233564, -0.2805112, 1.607745, 1, 1, 1, 1, 1,
1.238755, -0.4095693, 1.228341, 1, 1, 1, 1, 1,
1.238965, 1.186232, 0.1744364, 1, 1, 1, 1, 1,
1.239845, 0.8957602, 0.3395922, 1, 1, 1, 1, 1,
1.244707, -0.909141, 4.444684, 1, 1, 1, 1, 1,
1.24943, 0.2799953, 0.01972652, 1, 1, 1, 1, 1,
1.250182, 0.03858359, 2.546206, 1, 1, 1, 1, 1,
1.25378, -1.014548, 2.85502, 1, 1, 1, 1, 1,
1.255168, 0.5950412, -1.009191, 1, 1, 1, 1, 1,
1.255664, -1.858567, 2.527352, 1, 1, 1, 1, 1,
1.259089, -1.335338, 3.146612, 1, 1, 1, 1, 1,
1.261041, 0.1205162, 3.280079, 1, 1, 1, 1, 1,
1.263327, -0.9185893, 3.92258, 1, 1, 1, 1, 1,
1.279617, 0.5682151, 0.9526863, 1, 1, 1, 1, 1,
1.280273, -1.090036, 3.807571, 1, 1, 1, 1, 1,
1.28343, -3.05233, 4.71754, 0, 0, 1, 1, 1,
1.287266, -0.2473539, 1.812964, 1, 0, 0, 1, 1,
1.295842, 0.6070464, 0.9358283, 1, 0, 0, 1, 1,
1.322376, -0.007395882, 1.972112, 1, 0, 0, 1, 1,
1.329754, 1.562278, 1.962446, 1, 0, 0, 1, 1,
1.330266, -0.08510838, 0.5343948, 1, 0, 0, 1, 1,
1.330628, 1.315172, 0.9137268, 0, 0, 0, 1, 1,
1.333201, 0.6269115, 0.1087933, 0, 0, 0, 1, 1,
1.357208, 1.003672, 0.428876, 0, 0, 0, 1, 1,
1.369727, 0.08741265, 1.131649, 0, 0, 0, 1, 1,
1.371764, -1.078674, 3.440776, 0, 0, 0, 1, 1,
1.378615, 1.864924, 1.75176, 0, 0, 0, 1, 1,
1.385573, -0.8764728, 2.871545, 0, 0, 0, 1, 1,
1.389902, -0.4212999, 3.002598, 1, 1, 1, 1, 1,
1.390784, -0.3478838, 2.132854, 1, 1, 1, 1, 1,
1.391006, 0.793537, 0.8274777, 1, 1, 1, 1, 1,
1.392184, -1.25393, 2.3963, 1, 1, 1, 1, 1,
1.394343, 0.4541534, 1.787111, 1, 1, 1, 1, 1,
1.40116, 1.018568, 1.178648, 1, 1, 1, 1, 1,
1.41152, -0.6046901, 1.687545, 1, 1, 1, 1, 1,
1.412288, 0.526001, 1.829339, 1, 1, 1, 1, 1,
1.416605, 1.446266, 2.201829, 1, 1, 1, 1, 1,
1.419331, -0.2540466, 0.9203818, 1, 1, 1, 1, 1,
1.427709, -0.1576698, 2.607735, 1, 1, 1, 1, 1,
1.438119, -1.574004, 2.164676, 1, 1, 1, 1, 1,
1.441195, 0.5481354, 1.71177, 1, 1, 1, 1, 1,
1.453486, -1.434501, 3.936344, 1, 1, 1, 1, 1,
1.460113, -1.97354, 2.04147, 1, 1, 1, 1, 1,
1.466281, -0.8522913, 1.317089, 0, 0, 1, 1, 1,
1.467784, -0.2953027, 3.520089, 1, 0, 0, 1, 1,
1.471715, 2.196754, -0.2480455, 1, 0, 0, 1, 1,
1.481411, 0.443483, 0.3967114, 1, 0, 0, 1, 1,
1.481835, -0.4018964, -0.5179219, 1, 0, 0, 1, 1,
1.489732, 0.743963, -0.4468365, 1, 0, 0, 1, 1,
1.493662, -0.47258, 0.3667855, 0, 0, 0, 1, 1,
1.505237, -1.731572, 3.543009, 0, 0, 0, 1, 1,
1.508784, 1.187657, -0.7282263, 0, 0, 0, 1, 1,
1.511082, 0.0458857, 0.5589217, 0, 0, 0, 1, 1,
1.516205, -0.04552023, 1.004705, 0, 0, 0, 1, 1,
1.518566, 0.6804753, 2.043335, 0, 0, 0, 1, 1,
1.520889, 0.5595535, 0.8056083, 0, 0, 0, 1, 1,
1.529057, -0.3530542, 3.165375, 1, 1, 1, 1, 1,
1.530743, 1.027744, 1.389384, 1, 1, 1, 1, 1,
1.540792, 1.417088, 0.8949761, 1, 1, 1, 1, 1,
1.542892, -2.708958, 3.248753, 1, 1, 1, 1, 1,
1.575693, 0.01418493, 1.330213, 1, 1, 1, 1, 1,
1.606097, 0.3338149, 0.4085801, 1, 1, 1, 1, 1,
1.611276, 1.125061, -0.6684123, 1, 1, 1, 1, 1,
1.61715, 0.696864, 0.2318749, 1, 1, 1, 1, 1,
1.622054, -0.1910164, -0.4061293, 1, 1, 1, 1, 1,
1.626862, 1.247946, 0.571498, 1, 1, 1, 1, 1,
1.634371, -1.771661, 1.743131, 1, 1, 1, 1, 1,
1.645352, -0.3779926, 2.739317, 1, 1, 1, 1, 1,
1.648505, 0.006129528, 3.033385, 1, 1, 1, 1, 1,
1.668584, -0.08535802, 2.856262, 1, 1, 1, 1, 1,
1.668699, -0.205806, 2.626678, 1, 1, 1, 1, 1,
1.68755, -0.4384339, 1.86, 0, 0, 1, 1, 1,
1.701779, -0.0216521, 0.2346839, 1, 0, 0, 1, 1,
1.71126, 2.174741, 1.013483, 1, 0, 0, 1, 1,
1.717504, -0.3373043, 1.12539, 1, 0, 0, 1, 1,
1.725298, -2.525513, 2.544529, 1, 0, 0, 1, 1,
1.74709, -0.5739234, 2.002772, 1, 0, 0, 1, 1,
1.747527, -0.08863842, 1.847216, 0, 0, 0, 1, 1,
1.74921, 0.8965241, 2.574781, 0, 0, 0, 1, 1,
1.756907, 2.645061, 1.749439, 0, 0, 0, 1, 1,
1.761687, 0.16964, 3.072243, 0, 0, 0, 1, 1,
1.764659, -0.528824, 2.98662, 0, 0, 0, 1, 1,
1.767909, 1.774852, -0.1407728, 0, 0, 0, 1, 1,
1.770348, 0.7893676, -0.07300264, 0, 0, 0, 1, 1,
1.788071, 1.900084, 1.895854, 1, 1, 1, 1, 1,
1.788099, 1.765997, 3.21547, 1, 1, 1, 1, 1,
1.808186, 0.3128967, 0.8473271, 1, 1, 1, 1, 1,
1.815862, 1.157676, 1.699096, 1, 1, 1, 1, 1,
1.816893, -0.6087501, 3.495721, 1, 1, 1, 1, 1,
1.828155, -0.8528426, 2.00316, 1, 1, 1, 1, 1,
1.854256, 0.7922758, 1.499976, 1, 1, 1, 1, 1,
1.879132, -1.068852, 2.262829, 1, 1, 1, 1, 1,
1.891474, -3.158781, 4.298208, 1, 1, 1, 1, 1,
1.923319, 1.121855, 1.407352, 1, 1, 1, 1, 1,
1.923443, 0.01852418, 1.076201, 1, 1, 1, 1, 1,
1.929786, -0.02355214, 1.879364, 1, 1, 1, 1, 1,
1.93546, 0.3783992, 1.266741, 1, 1, 1, 1, 1,
1.999282, 0.7158468, 1.617582, 1, 1, 1, 1, 1,
2.045439, 0.3973024, 0.9833398, 1, 1, 1, 1, 1,
2.114043, -1.630779, 2.113685, 0, 0, 1, 1, 1,
2.138837, 0.08995475, 1.614683, 1, 0, 0, 1, 1,
2.170781, -0.1963131, 4.170527, 1, 0, 0, 1, 1,
2.173221, -0.05576893, 0.9658575, 1, 0, 0, 1, 1,
2.199997, 0.7833359, 1.535135, 1, 0, 0, 1, 1,
2.207553, -1.921605, 2.282943, 1, 0, 0, 1, 1,
2.234825, 1.757486, 0.6137851, 0, 0, 0, 1, 1,
2.271093, -0.2049994, 1.830119, 0, 0, 0, 1, 1,
2.296055, 1.402659, 2.300931, 0, 0, 0, 1, 1,
2.298796, -0.6853777, 0.7183722, 0, 0, 0, 1, 1,
2.458879, 0.6023585, 1.47587, 0, 0, 0, 1, 1,
2.483106, -1.118144, 1.202981, 0, 0, 0, 1, 1,
2.497884, 0.557513, 0.5598732, 0, 0, 0, 1, 1,
2.511667, -0.2908692, -0.1980375, 1, 1, 1, 1, 1,
2.56154, 0.3057693, 1.663438, 1, 1, 1, 1, 1,
2.562398, 0.4954319, 1.9586, 1, 1, 1, 1, 1,
2.609008, -0.7526225, 1.387045, 1, 1, 1, 1, 1,
2.772767, 0.03876184, 0.7662392, 1, 1, 1, 1, 1,
2.871742, -0.6948257, 1.083487, 1, 1, 1, 1, 1,
3.213699, 3.54757, 1.794998, 1, 1, 1, 1, 1
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
var radius = 9.503428;
var distance = 33.38039;
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
mvMatrix.translate( -0.04978466, -0.1943944, -0.08213234 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38039);
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
