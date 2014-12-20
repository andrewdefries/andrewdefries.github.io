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
-3.375045, 0.600293, -0.9588181, 1, 0, 0, 1,
-2.900913, 0.3280796, -1.495828, 1, 0.007843138, 0, 1,
-2.800729, -0.3703182, -1.961991, 1, 0.01176471, 0, 1,
-2.724296, 0.8084664, -0.1972782, 1, 0.01960784, 0, 1,
-2.517942, 0.5541525, -1.184856, 1, 0.02352941, 0, 1,
-2.500089, -2.426519, -4.277763, 1, 0.03137255, 0, 1,
-2.380105, 0.1357217, -2.862307, 1, 0.03529412, 0, 1,
-2.371988, 1.054636, -2.008583, 1, 0.04313726, 0, 1,
-2.371919, 1.682679, -1.634196, 1, 0.04705882, 0, 1,
-2.357464, -0.9245958, -2.54171, 1, 0.05490196, 0, 1,
-2.344495, -0.2270719, -0.9562731, 1, 0.05882353, 0, 1,
-2.321218, -0.6294465, -1.35318, 1, 0.06666667, 0, 1,
-2.296266, 0.4986485, -0.5585733, 1, 0.07058824, 0, 1,
-2.288792, -0.6348719, -0.2458572, 1, 0.07843138, 0, 1,
-2.179783, -1.219152, -2.4393, 1, 0.08235294, 0, 1,
-2.141563, -2.322127, -3.173444, 1, 0.09019608, 0, 1,
-2.13969, 1.15691, -0.7814305, 1, 0.09411765, 0, 1,
-2.120059, 0.778485, -2.970263, 1, 0.1019608, 0, 1,
-2.112707, 0.1836422, -2.165599, 1, 0.1098039, 0, 1,
-2.101084, -0.2838238, -1.719283, 1, 0.1137255, 0, 1,
-2.096547, 0.6384206, -1.934235, 1, 0.1215686, 0, 1,
-2.07908, 0.4567256, -0.4247158, 1, 0.1254902, 0, 1,
-2.059707, -0.7759919, -0.8976865, 1, 0.1333333, 0, 1,
-2.048496, -0.7790532, -3.111731, 1, 0.1372549, 0, 1,
-2.033778, -0.8565006, -1.327546, 1, 0.145098, 0, 1,
-2.025787, 1.027041, -3.132731, 1, 0.1490196, 0, 1,
-2.009118, -0.03717823, -1.135374, 1, 0.1568628, 0, 1,
-1.993224, 0.6045603, -1.596521, 1, 0.1607843, 0, 1,
-1.944961, -0.2558675, -0.336251, 1, 0.1686275, 0, 1,
-1.928027, 0.3532882, -1.416605, 1, 0.172549, 0, 1,
-1.921319, 1.26633, -0.2767632, 1, 0.1803922, 0, 1,
-1.917095, 0.1196557, -1.999476, 1, 0.1843137, 0, 1,
-1.916965, -0.6341746, -2.427938, 1, 0.1921569, 0, 1,
-1.902909, -0.3353332, -1.147748, 1, 0.1960784, 0, 1,
-1.895622, 0.6034813, 1.337598, 1, 0.2039216, 0, 1,
-1.876275, 0.3623828, -1.616494, 1, 0.2117647, 0, 1,
-1.866074, -0.9357505, -1.809198, 1, 0.2156863, 0, 1,
-1.832273, 1.194683, -0.7782702, 1, 0.2235294, 0, 1,
-1.827057, -0.1707903, -0.9440697, 1, 0.227451, 0, 1,
-1.823292, 0.8099646, -3.427255, 1, 0.2352941, 0, 1,
-1.822894, 0.4899964, -3.393717, 1, 0.2392157, 0, 1,
-1.819731, -1.503015, -3.036582, 1, 0.2470588, 0, 1,
-1.819116, -1.223467, -1.467716, 1, 0.2509804, 0, 1,
-1.813297, 0.3005749, -0.9727765, 1, 0.2588235, 0, 1,
-1.805406, 1.584134, 0.2771173, 1, 0.2627451, 0, 1,
-1.777111, 0.1173201, -2.685418, 1, 0.2705882, 0, 1,
-1.765808, 0.2232118, -3.070225, 1, 0.2745098, 0, 1,
-1.731863, -0.3368525, -1.117662, 1, 0.282353, 0, 1,
-1.692482, -1.492584, -2.954638, 1, 0.2862745, 0, 1,
-1.687834, -0.3808323, -3.21534, 1, 0.2941177, 0, 1,
-1.642675, 1.716996, -0.5509443, 1, 0.3019608, 0, 1,
-1.636663, 0.02725628, -3.343338, 1, 0.3058824, 0, 1,
-1.627548, 0.07432231, -2.030533, 1, 0.3137255, 0, 1,
-1.571844, -0.3557344, -3.26154, 1, 0.3176471, 0, 1,
-1.570482, 0.7083479, -2.86049, 1, 0.3254902, 0, 1,
-1.556844, -2.137053, -3.063611, 1, 0.3294118, 0, 1,
-1.551781, 2.053271, 0.642194, 1, 0.3372549, 0, 1,
-1.550494, -0.2697301, -2.090659, 1, 0.3411765, 0, 1,
-1.548545, 0.592605, -2.413363, 1, 0.3490196, 0, 1,
-1.542198, -0.4452314, -3.33664, 1, 0.3529412, 0, 1,
-1.539436, 0.2147122, -2.159203, 1, 0.3607843, 0, 1,
-1.536645, -0.2320927, -1.575036, 1, 0.3647059, 0, 1,
-1.526243, -0.4784731, -1.382221, 1, 0.372549, 0, 1,
-1.516502, -1.235264, -1.343057, 1, 0.3764706, 0, 1,
-1.509504, 0.3281594, -2.216465, 1, 0.3843137, 0, 1,
-1.509362, -0.1487396, -2.927776, 1, 0.3882353, 0, 1,
-1.492077, -0.4136488, -0.721758, 1, 0.3960784, 0, 1,
-1.49029, -0.1911663, -0.3961082, 1, 0.4039216, 0, 1,
-1.488838, 1.170594, -1.877222, 1, 0.4078431, 0, 1,
-1.471029, -0.9791335, -2.276949, 1, 0.4156863, 0, 1,
-1.467047, -0.1012876, -0.2550994, 1, 0.4196078, 0, 1,
-1.447632, -0.9598851, -2.130192, 1, 0.427451, 0, 1,
-1.445601, 0.2423435, -0.5584928, 1, 0.4313726, 0, 1,
-1.437741, -0.3770855, -0.5305435, 1, 0.4392157, 0, 1,
-1.437706, -0.532907, -1.873761, 1, 0.4431373, 0, 1,
-1.430304, 0.9782544, -1.229359, 1, 0.4509804, 0, 1,
-1.428115, 1.094549, -0.02361522, 1, 0.454902, 0, 1,
-1.413735, 0.4687578, -2.564241, 1, 0.4627451, 0, 1,
-1.405546, -0.2540889, -1.123118, 1, 0.4666667, 0, 1,
-1.401867, 1.738925, -2.678179, 1, 0.4745098, 0, 1,
-1.3859, 1.47294, -0.3418168, 1, 0.4784314, 0, 1,
-1.374761, 0.7559957, -0.8260961, 1, 0.4862745, 0, 1,
-1.371546, 2.354732, -1.180964, 1, 0.4901961, 0, 1,
-1.364016, -1.273459, -2.062147, 1, 0.4980392, 0, 1,
-1.357324, 1.031868, -0.8236876, 1, 0.5058824, 0, 1,
-1.353479, -1.605637, -4.143324, 1, 0.509804, 0, 1,
-1.338732, 0.144289, -1.821659, 1, 0.5176471, 0, 1,
-1.33312, 0.1728583, -1.04355, 1, 0.5215687, 0, 1,
-1.325467, 0.8854499, -1.276012, 1, 0.5294118, 0, 1,
-1.321989, 0.4910615, -1.884252, 1, 0.5333334, 0, 1,
-1.314612, 2.328315, -2.180023, 1, 0.5411765, 0, 1,
-1.305355, 0.3333527, -0.3146783, 1, 0.5450981, 0, 1,
-1.30164, 1.611883, 0.9633741, 1, 0.5529412, 0, 1,
-1.29287, 0.02091099, -1.058024, 1, 0.5568628, 0, 1,
-1.281452, -1.482724, -3.634012, 1, 0.5647059, 0, 1,
-1.255746, 0.2117987, -1.770496, 1, 0.5686275, 0, 1,
-1.248494, -0.3133423, -2.228972, 1, 0.5764706, 0, 1,
-1.243393, -0.506953, -2.687916, 1, 0.5803922, 0, 1,
-1.243092, 0.9385951, -0.3161259, 1, 0.5882353, 0, 1,
-1.2405, 0.7033753, -1.143241, 1, 0.5921569, 0, 1,
-1.236399, -0.6352814, -1.670982, 1, 0.6, 0, 1,
-1.229479, -0.2080787, -1.039995, 1, 0.6078432, 0, 1,
-1.225899, 0.7288271, 0.8855094, 1, 0.6117647, 0, 1,
-1.223661, -2.15412, -2.756279, 1, 0.6196079, 0, 1,
-1.221393, 1.344203, -1.731118, 1, 0.6235294, 0, 1,
-1.220282, 0.5894811, -0.3302765, 1, 0.6313726, 0, 1,
-1.214538, -1.412517, -2.932352, 1, 0.6352941, 0, 1,
-1.208773, 0.7157927, -0.6974627, 1, 0.6431373, 0, 1,
-1.204019, 1.382952, -0.09341688, 1, 0.6470588, 0, 1,
-1.199409, 0.7504447, -1.076911, 1, 0.654902, 0, 1,
-1.179716, -2.177821, -1.201876, 1, 0.6588235, 0, 1,
-1.177587, -0.09732889, -1.857245, 1, 0.6666667, 0, 1,
-1.174614, 1.460895, -2.79792, 1, 0.6705883, 0, 1,
-1.173973, 0.5227575, 0.2024764, 1, 0.6784314, 0, 1,
-1.161571, 0.07275546, -1.566071, 1, 0.682353, 0, 1,
-1.155436, -1.190164, -3.804018, 1, 0.6901961, 0, 1,
-1.152746, -0.6029847, -2.254807, 1, 0.6941177, 0, 1,
-1.148964, 1.184463, -1.668054, 1, 0.7019608, 0, 1,
-1.147243, 0.3906815, -1.804366, 1, 0.7098039, 0, 1,
-1.140356, -0.0307151, -0.582212, 1, 0.7137255, 0, 1,
-1.138421, 1.392049, -1.506102, 1, 0.7215686, 0, 1,
-1.133415, -0.9849939, -3.670387, 1, 0.7254902, 0, 1,
-1.130024, -1.168001, -2.579374, 1, 0.7333333, 0, 1,
-1.120236, -0.02250987, -2.184075, 1, 0.7372549, 0, 1,
-1.109813, 0.5543938, -0.7805488, 1, 0.7450981, 0, 1,
-1.097849, -1.104605, -2.615528, 1, 0.7490196, 0, 1,
-1.095748, -0.2898428, -1.345788, 1, 0.7568628, 0, 1,
-1.09303, -0.1525345, -1.635188, 1, 0.7607843, 0, 1,
-1.068409, 1.492104, -0.5646621, 1, 0.7686275, 0, 1,
-1.0683, 2.949792, -1.520472, 1, 0.772549, 0, 1,
-1.067573, -0.1681083, -2.971079, 1, 0.7803922, 0, 1,
-1.066532, 1.147571, -2.609244, 1, 0.7843137, 0, 1,
-1.066085, 0.8995619, -1.495762, 1, 0.7921569, 0, 1,
-1.063738, 0.2859232, -1.853051, 1, 0.7960784, 0, 1,
-1.057625, 0.06075921, -3.891468, 1, 0.8039216, 0, 1,
-1.05701, -0.1148635, -2.262439, 1, 0.8117647, 0, 1,
-1.054583, 0.3211788, -1.163127, 1, 0.8156863, 0, 1,
-1.053652, 0.5674379, -0.8136244, 1, 0.8235294, 0, 1,
-1.051943, -0.8275092, -2.325107, 1, 0.827451, 0, 1,
-1.044471, 0.6861683, -0.5423932, 1, 0.8352941, 0, 1,
-1.044145, 1.490337, -1.812394, 1, 0.8392157, 0, 1,
-1.039723, -0.3181693, -1.874682, 1, 0.8470588, 0, 1,
-1.037697, 0.07239319, -1.823735, 1, 0.8509804, 0, 1,
-1.029222, 0.7084191, -0.1327413, 1, 0.8588235, 0, 1,
-1.025129, 0.8520905, 0.425687, 1, 0.8627451, 0, 1,
-1.023776, -1.359667, -1.923468, 1, 0.8705882, 0, 1,
-1.019367, 1.090468, -1.755711, 1, 0.8745098, 0, 1,
-1.019209, 0.9443025, -1.544564, 1, 0.8823529, 0, 1,
-1.019055, -1.190259, -2.536784, 1, 0.8862745, 0, 1,
-1.016722, 1.065423, -0.2193792, 1, 0.8941177, 0, 1,
-1.016442, -2.785399, -2.779306, 1, 0.8980392, 0, 1,
-1.01465, 0.04896517, -2.700754, 1, 0.9058824, 0, 1,
-1.01426, -0.81425, -1.554196, 1, 0.9137255, 0, 1,
-1.012947, -1.45695, -2.22268, 1, 0.9176471, 0, 1,
-1.001531, -0.2277059, -1.344086, 1, 0.9254902, 0, 1,
-0.9943929, -0.754572, -2.190154, 1, 0.9294118, 0, 1,
-0.9937096, 1.288283, -0.3819671, 1, 0.9372549, 0, 1,
-0.9934031, 1.079458, -0.3301818, 1, 0.9411765, 0, 1,
-0.9856175, -0.07326581, -1.023583, 1, 0.9490196, 0, 1,
-0.9831026, -0.5584842, -2.433211, 1, 0.9529412, 0, 1,
-0.9689378, -0.1368496, -0.8151011, 1, 0.9607843, 0, 1,
-0.9673412, -0.2437809, -1.911385, 1, 0.9647059, 0, 1,
-0.966782, -0.07916687, -2.265832, 1, 0.972549, 0, 1,
-0.9667306, 0.1623312, -1.776901, 1, 0.9764706, 0, 1,
-0.9639692, -2.255065, -2.090864, 1, 0.9843137, 0, 1,
-0.9610715, -2.207484, -4.944158, 1, 0.9882353, 0, 1,
-0.9498692, -0.2933544, -0.4082786, 1, 0.9960784, 0, 1,
-0.946222, -0.990524, -0.8599716, 0.9960784, 1, 0, 1,
-0.9428358, 0.4975643, 0.4439704, 0.9921569, 1, 0, 1,
-0.9410665, 0.4290216, -0.02781412, 0.9843137, 1, 0, 1,
-0.9318525, 1.104206, -0.2518651, 0.9803922, 1, 0, 1,
-0.9316065, 1.356822, -0.1760519, 0.972549, 1, 0, 1,
-0.9279292, 0.5262492, -1.561704, 0.9686275, 1, 0, 1,
-0.9207789, 0.9341284, -0.6632503, 0.9607843, 1, 0, 1,
-0.9149889, 0.1302972, -2.66012, 0.9568627, 1, 0, 1,
-0.9143906, -0.1665343, -2.885929, 0.9490196, 1, 0, 1,
-0.9055231, 0.1968365, -1.885974, 0.945098, 1, 0, 1,
-0.8995976, -1.364167, -2.518731, 0.9372549, 1, 0, 1,
-0.8925018, -0.2745928, -1.609825, 0.9333333, 1, 0, 1,
-0.8921612, 0.7893584, -2.013463, 0.9254902, 1, 0, 1,
-0.888136, 0.6915848, -2.618816, 0.9215686, 1, 0, 1,
-0.8874513, 1.256201, -0.7690578, 0.9137255, 1, 0, 1,
-0.887212, 1.435698, -0.778505, 0.9098039, 1, 0, 1,
-0.8795716, -0.2864446, -1.792491, 0.9019608, 1, 0, 1,
-0.8794535, 0.5711796, -0.8195648, 0.8941177, 1, 0, 1,
-0.8761677, 0.6367555, -0.89961, 0.8901961, 1, 0, 1,
-0.8713933, -1.490252, -1.346084, 0.8823529, 1, 0, 1,
-0.8604854, -1.121987, -2.975687, 0.8784314, 1, 0, 1,
-0.8578876, -1.09666, -2.948337, 0.8705882, 1, 0, 1,
-0.8543956, -2.713917, -2.404617, 0.8666667, 1, 0, 1,
-0.8484135, -1.144941, -3.482695, 0.8588235, 1, 0, 1,
-0.8465268, 0.1104312, -3.01934, 0.854902, 1, 0, 1,
-0.8417341, 1.773827, -1.432348, 0.8470588, 1, 0, 1,
-0.8400463, 0.1496708, -1.923179, 0.8431373, 1, 0, 1,
-0.8390337, -0.02269506, -1.212261, 0.8352941, 1, 0, 1,
-0.8331775, -0.4028096, -1.656562, 0.8313726, 1, 0, 1,
-0.832653, 0.07202342, -2.208412, 0.8235294, 1, 0, 1,
-0.8223356, 0.8706127, 0.5464236, 0.8196079, 1, 0, 1,
-0.8215784, 1.235489, -1.600283, 0.8117647, 1, 0, 1,
-0.8174834, 0.2136153, -1.554153, 0.8078431, 1, 0, 1,
-0.8135943, 0.7897374, -0.09683722, 0.8, 1, 0, 1,
-0.8115932, -1.536005, -3.413327, 0.7921569, 1, 0, 1,
-0.8090738, 0.7626114, 0.3234475, 0.7882353, 1, 0, 1,
-0.8046697, -1.474524, -1.980289, 0.7803922, 1, 0, 1,
-0.8018507, -1.373091, -2.555731, 0.7764706, 1, 0, 1,
-0.7997857, -0.2324993, -3.497418, 0.7686275, 1, 0, 1,
-0.7969396, -0.7031498, -1.564584, 0.7647059, 1, 0, 1,
-0.7913051, 0.2502757, -1.490614, 0.7568628, 1, 0, 1,
-0.7897654, -0.3737324, -1.394582, 0.7529412, 1, 0, 1,
-0.7881152, -1.320819, -2.416056, 0.7450981, 1, 0, 1,
-0.7847384, 0.5124618, -1.367552, 0.7411765, 1, 0, 1,
-0.7818195, 1.509383, -2.04677, 0.7333333, 1, 0, 1,
-0.7776025, 0.3017656, -0.9462758, 0.7294118, 1, 0, 1,
-0.7735209, -0.09062014, -1.560222, 0.7215686, 1, 0, 1,
-0.7717153, 0.1048068, -2.162115, 0.7176471, 1, 0, 1,
-0.7712427, -0.4325013, -1.071323, 0.7098039, 1, 0, 1,
-0.7703131, 0.5093014, -0.844541, 0.7058824, 1, 0, 1,
-0.7686412, -2.271094, -3.554335, 0.6980392, 1, 0, 1,
-0.7684395, 0.01201047, -0.191762, 0.6901961, 1, 0, 1,
-0.7669339, -0.6005102, -3.142439, 0.6862745, 1, 0, 1,
-0.7667739, 0.7421226, 0.431043, 0.6784314, 1, 0, 1,
-0.765186, 0.514836, -2.537133, 0.6745098, 1, 0, 1,
-0.7632581, -0.1920449, -1.974185, 0.6666667, 1, 0, 1,
-0.7617105, 1.70754, 0.4651544, 0.6627451, 1, 0, 1,
-0.7555913, 0.513891, -0.6652289, 0.654902, 1, 0, 1,
-0.7543057, 1.268182, -1.966177, 0.6509804, 1, 0, 1,
-0.7509745, 0.7393396, -0.1919104, 0.6431373, 1, 0, 1,
-0.7508557, 0.9634184, -1.177443, 0.6392157, 1, 0, 1,
-0.745463, -0.8989776, -2.393141, 0.6313726, 1, 0, 1,
-0.7420096, -0.6590571, -2.504407, 0.627451, 1, 0, 1,
-0.7374427, 1.167433, 0.8016002, 0.6196079, 1, 0, 1,
-0.7349746, 0.2621925, -1.361802, 0.6156863, 1, 0, 1,
-0.7335554, 1.174052, -1.26949, 0.6078432, 1, 0, 1,
-0.7319611, -1.135117, -2.778101, 0.6039216, 1, 0, 1,
-0.7315238, 0.2573281, -1.26512, 0.5960785, 1, 0, 1,
-0.7289472, -0.2764925, -2.689554, 0.5882353, 1, 0, 1,
-0.7278671, 0.3239275, -0.7904151, 0.5843138, 1, 0, 1,
-0.7274656, -0.08604369, -2.775804, 0.5764706, 1, 0, 1,
-0.7240947, -0.7545047, -4.388939, 0.572549, 1, 0, 1,
-0.7150857, 2.227009, -0.6218719, 0.5647059, 1, 0, 1,
-0.7119278, 2.376733, -0.4197348, 0.5607843, 1, 0, 1,
-0.7098596, -0.3818616, -3.539599, 0.5529412, 1, 0, 1,
-0.7004389, -0.06764722, -1.132582, 0.5490196, 1, 0, 1,
-0.700379, 0.001263717, -1.740659, 0.5411765, 1, 0, 1,
-0.6960162, 0.7574216, 2.206038, 0.5372549, 1, 0, 1,
-0.6935541, 0.5463948, -2.495838, 0.5294118, 1, 0, 1,
-0.6919962, 0.4965933, -1.994523, 0.5254902, 1, 0, 1,
-0.6903903, 2.004092, 2.342698, 0.5176471, 1, 0, 1,
-0.6902089, -2.215509, -2.303169, 0.5137255, 1, 0, 1,
-0.6880663, -0.1347706, -2.205982, 0.5058824, 1, 0, 1,
-0.6878424, -0.7146155, -3.468064, 0.5019608, 1, 0, 1,
-0.6842212, -0.9879075, -1.883024, 0.4941176, 1, 0, 1,
-0.6816725, -1.055696, -1.52335, 0.4862745, 1, 0, 1,
-0.6788422, 0.1399729, -0.1988893, 0.4823529, 1, 0, 1,
-0.6765423, -0.3293575, -1.089807, 0.4745098, 1, 0, 1,
-0.6733853, 0.8279917, 0.1803207, 0.4705882, 1, 0, 1,
-0.6728092, 0.1159553, -2.211429, 0.4627451, 1, 0, 1,
-0.6681075, -2.353923, -1.917849, 0.4588235, 1, 0, 1,
-0.6654943, -0.6171435, -2.645203, 0.4509804, 1, 0, 1,
-0.6650752, 0.1544583, -2.411685, 0.4470588, 1, 0, 1,
-0.6625825, -1.211524, -2.697006, 0.4392157, 1, 0, 1,
-0.6583914, -0.4042954, -2.467969, 0.4352941, 1, 0, 1,
-0.6561099, 0.7322736, -0.3471926, 0.427451, 1, 0, 1,
-0.6554713, 0.4029561, 2.74153, 0.4235294, 1, 0, 1,
-0.6512002, 1.856912, -0.9684363, 0.4156863, 1, 0, 1,
-0.636406, -0.6474437, -3.806995, 0.4117647, 1, 0, 1,
-0.6324489, 0.3712465, -2.057366, 0.4039216, 1, 0, 1,
-0.6300161, -0.2596151, -2.805137, 0.3960784, 1, 0, 1,
-0.6294265, 1.290509, -0.8199576, 0.3921569, 1, 0, 1,
-0.6272531, -0.5431401, -2.163109, 0.3843137, 1, 0, 1,
-0.6176134, -0.7341142, -2.575061, 0.3803922, 1, 0, 1,
-0.6159308, 0.814272, -1.510482, 0.372549, 1, 0, 1,
-0.6141471, -0.6929011, -1.492557, 0.3686275, 1, 0, 1,
-0.6067, -0.3532401, -1.643334, 0.3607843, 1, 0, 1,
-0.6011926, 0.989461, -0.2327274, 0.3568628, 1, 0, 1,
-0.5974426, 1.317308, -1.02336, 0.3490196, 1, 0, 1,
-0.5889111, -1.544732, -2.676457, 0.345098, 1, 0, 1,
-0.5872501, 0.3052831, 0.3185475, 0.3372549, 1, 0, 1,
-0.5864932, -1.126664, -1.821684, 0.3333333, 1, 0, 1,
-0.5864401, -0.1748743, -0.3387153, 0.3254902, 1, 0, 1,
-0.5843276, 0.6199985, -0.07518245, 0.3215686, 1, 0, 1,
-0.5827574, 1.333594, -0.8569778, 0.3137255, 1, 0, 1,
-0.5723011, 1.405876, -0.3545582, 0.3098039, 1, 0, 1,
-0.5719028, -1.700932, -0.9685397, 0.3019608, 1, 0, 1,
-0.5678257, -0.778312, -0.5398555, 0.2941177, 1, 0, 1,
-0.5668423, -0.09920707, -3.11884, 0.2901961, 1, 0, 1,
-0.5659094, -0.2359169, -3.083598, 0.282353, 1, 0, 1,
-0.5609146, -0.8195711, -1.165738, 0.2784314, 1, 0, 1,
-0.5529496, 1.965147, -1.368608, 0.2705882, 1, 0, 1,
-0.5497475, -1.57775, -1.565149, 0.2666667, 1, 0, 1,
-0.5488078, 0.3860124, -1.933202, 0.2588235, 1, 0, 1,
-0.5418618, 0.6556013, -0.5779684, 0.254902, 1, 0, 1,
-0.5408903, -0.04035338, -0.6809457, 0.2470588, 1, 0, 1,
-0.5373849, -0.3753912, -0.1078509, 0.2431373, 1, 0, 1,
-0.5368053, -1.606498, -1.857946, 0.2352941, 1, 0, 1,
-0.5346931, 0.6649464, -0.2047837, 0.2313726, 1, 0, 1,
-0.5345721, -0.8810804, -2.444791, 0.2235294, 1, 0, 1,
-0.5343388, 0.1628871, -0.2598699, 0.2196078, 1, 0, 1,
-0.5334888, -0.04145494, -0.2164895, 0.2117647, 1, 0, 1,
-0.531635, 0.3490115, 0.09419176, 0.2078431, 1, 0, 1,
-0.5191213, -0.6007645, -2.213947, 0.2, 1, 0, 1,
-0.5178168, -0.8786207, -2.373088, 0.1921569, 1, 0, 1,
-0.5169023, -0.09479939, -2.138733, 0.1882353, 1, 0, 1,
-0.5164567, 1.045105, -1.07094, 0.1803922, 1, 0, 1,
-0.514082, -0.9026505, -1.604382, 0.1764706, 1, 0, 1,
-0.5133767, 0.7795238, 0.7560169, 0.1686275, 1, 0, 1,
-0.5088258, -1.909251, -3.768135, 0.1647059, 1, 0, 1,
-0.5085365, -0.771144, -4.380639, 0.1568628, 1, 0, 1,
-0.5050136, -0.2710214, -2.762182, 0.1529412, 1, 0, 1,
-0.494995, 1.065125, 2.064512, 0.145098, 1, 0, 1,
-0.4934803, -0.9774765, -3.253813, 0.1411765, 1, 0, 1,
-0.4906774, -1.554823, -2.606362, 0.1333333, 1, 0, 1,
-0.4903849, 0.9859075, 0.08804633, 0.1294118, 1, 0, 1,
-0.4892411, -0.2860945, -2.668821, 0.1215686, 1, 0, 1,
-0.4807993, -0.9899169, -2.422127, 0.1176471, 1, 0, 1,
-0.480596, -1.083593, -2.285356, 0.1098039, 1, 0, 1,
-0.480279, -0.738184, -1.574756, 0.1058824, 1, 0, 1,
-0.4800978, 0.3285443, -0.9684588, 0.09803922, 1, 0, 1,
-0.479896, 0.5995533, -1.92365, 0.09019608, 1, 0, 1,
-0.4779166, 1.175885, -1.375345, 0.08627451, 1, 0, 1,
-0.4707887, 0.08522619, -1.306375, 0.07843138, 1, 0, 1,
-0.4634502, 0.1784464, 0.2958991, 0.07450981, 1, 0, 1,
-0.4610078, -1.501877, -4.110891, 0.06666667, 1, 0, 1,
-0.4593848, 0.4259292, 1.143636, 0.0627451, 1, 0, 1,
-0.459364, 0.3845474, -2.137575, 0.05490196, 1, 0, 1,
-0.4565436, 0.859769, -0.1339672, 0.05098039, 1, 0, 1,
-0.4557001, -1.163222, -3.742795, 0.04313726, 1, 0, 1,
-0.4515673, 0.8037471, -0.6291618, 0.03921569, 1, 0, 1,
-0.4510251, -0.1600845, -1.512442, 0.03137255, 1, 0, 1,
-0.4476073, -2.048206, -2.032251, 0.02745098, 1, 0, 1,
-0.4471295, -1.007298, -3.082024, 0.01960784, 1, 0, 1,
-0.4453305, -0.756486, -0.8800727, 0.01568628, 1, 0, 1,
-0.445188, 1.202772, -1.150174, 0.007843138, 1, 0, 1,
-0.4426985, -1.129833, -1.971806, 0.003921569, 1, 0, 1,
-0.4403932, -0.3210431, -2.801726, 0, 1, 0.003921569, 1,
-0.4367096, -0.2763418, -3.452299, 0, 1, 0.01176471, 1,
-0.4359618, 1.364631, 0.3144821, 0, 1, 0.01568628, 1,
-0.4338068, -0.4409988, -1.687699, 0, 1, 0.02352941, 1,
-0.4326326, 0.802236, -0.32234, 0, 1, 0.02745098, 1,
-0.4285316, -1.249262, -1.348733, 0, 1, 0.03529412, 1,
-0.4281141, -2.23669, -3.529019, 0, 1, 0.03921569, 1,
-0.4258183, 0.4189473, -2.127638, 0, 1, 0.04705882, 1,
-0.4249017, 0.4447186, -1.908149, 0, 1, 0.05098039, 1,
-0.4230816, -0.7880268, -1.244469, 0, 1, 0.05882353, 1,
-0.4218374, -2.919084, -4.764608, 0, 1, 0.0627451, 1,
-0.4153778, -2.311406, -3.484006, 0, 1, 0.07058824, 1,
-0.4079176, 1.079944, -0.1578327, 0, 1, 0.07450981, 1,
-0.4068952, -1.253063, -4.771757, 0, 1, 0.08235294, 1,
-0.4058964, 1.307844, 0.2098921, 0, 1, 0.08627451, 1,
-0.398607, -0.5077979, -2.450758, 0, 1, 0.09411765, 1,
-0.3968603, 0.235861, -1.70644, 0, 1, 0.1019608, 1,
-0.3928273, 0.04208793, 0.2528956, 0, 1, 0.1058824, 1,
-0.390594, -1.549473, -3.221454, 0, 1, 0.1137255, 1,
-0.3819869, 2.312566, -0.7764442, 0, 1, 0.1176471, 1,
-0.3807182, 0.5832283, -1.537565, 0, 1, 0.1254902, 1,
-0.3806296, 0.5452429, -0.4848357, 0, 1, 0.1294118, 1,
-0.3762574, 0.248207, 0.09813936, 0, 1, 0.1372549, 1,
-0.3734007, 0.6713233, -0.3451632, 0, 1, 0.1411765, 1,
-0.3707942, 1.646009, -0.5653979, 0, 1, 0.1490196, 1,
-0.370022, 2.102072, -1.186484, 0, 1, 0.1529412, 1,
-0.3683541, 0.7581196, 0.610917, 0, 1, 0.1607843, 1,
-0.3658052, 0.08880404, 0.9542797, 0, 1, 0.1647059, 1,
-0.3577549, 1.155696, -1.202505, 0, 1, 0.172549, 1,
-0.3547283, 0.1675588, -0.9993632, 0, 1, 0.1764706, 1,
-0.3503728, -1.063364, -3.618754, 0, 1, 0.1843137, 1,
-0.3469363, 1.309467, -1.009386, 0, 1, 0.1882353, 1,
-0.3449061, 0.452934, -0.02937844, 0, 1, 0.1960784, 1,
-0.3383332, 1.04566, 0.4241323, 0, 1, 0.2039216, 1,
-0.336524, 0.3675225, -0.2174034, 0, 1, 0.2078431, 1,
-0.3353432, 0.7171533, 0.5487041, 0, 1, 0.2156863, 1,
-0.3345801, -0.516547, -2.497198, 0, 1, 0.2196078, 1,
-0.3315874, 1.252675, -0.8329618, 0, 1, 0.227451, 1,
-0.3280586, 1.508454, -0.9973459, 0, 1, 0.2313726, 1,
-0.3275821, -0.5276374, -1.277356, 0, 1, 0.2392157, 1,
-0.3174883, 1.840495, -0.4561613, 0, 1, 0.2431373, 1,
-0.3169044, 1.508694, -1.705237, 0, 1, 0.2509804, 1,
-0.3113587, -0.2001361, -2.209688, 0, 1, 0.254902, 1,
-0.3088912, -0.9022682, -3.34851, 0, 1, 0.2627451, 1,
-0.3050466, 0.4574665, -0.6494744, 0, 1, 0.2666667, 1,
-0.2981967, 0.6988048, -0.4409637, 0, 1, 0.2745098, 1,
-0.2937563, -2.365561, -3.067185, 0, 1, 0.2784314, 1,
-0.2933235, -1.359147, -1.655886, 0, 1, 0.2862745, 1,
-0.2926596, 0.9884359, -0.6025739, 0, 1, 0.2901961, 1,
-0.2884995, -1.162725, -3.084278, 0, 1, 0.2980392, 1,
-0.2851067, -0.1763017, -4.970375, 0, 1, 0.3058824, 1,
-0.284928, -0.3541375, -2.326693, 0, 1, 0.3098039, 1,
-0.2835332, -0.0179614, -1.602774, 0, 1, 0.3176471, 1,
-0.2816315, 1.878404, -1.545667, 0, 1, 0.3215686, 1,
-0.2794732, 0.707111, -1.115261, 0, 1, 0.3294118, 1,
-0.2780656, -0.2437206, -2.190606, 0, 1, 0.3333333, 1,
-0.275372, 2.527413, -0.9945541, 0, 1, 0.3411765, 1,
-0.2739109, 0.5173358, -2.424449, 0, 1, 0.345098, 1,
-0.2700663, -1.354913, -3.688595, 0, 1, 0.3529412, 1,
-0.2654755, 0.3337368, -0.8893954, 0, 1, 0.3568628, 1,
-0.2616191, -0.2681599, -2.949757, 0, 1, 0.3647059, 1,
-0.2570287, 0.2987192, 1.111562, 0, 1, 0.3686275, 1,
-0.2563132, -1.400795, -3.884245, 0, 1, 0.3764706, 1,
-0.2559952, 0.2361007, -0.9185813, 0, 1, 0.3803922, 1,
-0.2485601, 0.4860234, -0.4307683, 0, 1, 0.3882353, 1,
-0.2472964, 0.111577, -1.484791, 0, 1, 0.3921569, 1,
-0.2469535, -0.8033583, -2.957379, 0, 1, 0.4, 1,
-0.2462084, -1.664481, -3.555226, 0, 1, 0.4078431, 1,
-0.2459292, 2.42152, 0.6604735, 0, 1, 0.4117647, 1,
-0.2447749, -0.4132399, -1.967785, 0, 1, 0.4196078, 1,
-0.2435111, 1.377048, 1.110843, 0, 1, 0.4235294, 1,
-0.2415428, 0.004358372, -3.436989, 0, 1, 0.4313726, 1,
-0.2412075, 0.6301883, 1.041431, 0, 1, 0.4352941, 1,
-0.2394935, -0.5561681, -3.367068, 0, 1, 0.4431373, 1,
-0.2372646, -0.4702656, -3.676879, 0, 1, 0.4470588, 1,
-0.2329596, 0.2816114, -2.964349, 0, 1, 0.454902, 1,
-0.22989, -0.7920921, -2.745934, 0, 1, 0.4588235, 1,
-0.2230883, -1.354028, -1.515377, 0, 1, 0.4666667, 1,
-0.2230159, 0.8454281, -0.6205458, 0, 1, 0.4705882, 1,
-0.2141788, 0.09574989, -0.6454057, 0, 1, 0.4784314, 1,
-0.2136327, 1.879804, 0.576304, 0, 1, 0.4823529, 1,
-0.213401, 1.068978, -0.8520869, 0, 1, 0.4901961, 1,
-0.2073938, 0.8561791, 1.321925, 0, 1, 0.4941176, 1,
-0.2041645, -0.9575931, -1.272797, 0, 1, 0.5019608, 1,
-0.200626, -0.06527207, -2.202271, 0, 1, 0.509804, 1,
-0.1974004, -1.26173, -4.126734, 0, 1, 0.5137255, 1,
-0.1963955, -0.4588194, -2.087335, 0, 1, 0.5215687, 1,
-0.1943857, -0.4187742, -2.002415, 0, 1, 0.5254902, 1,
-0.1931334, 0.4485216, -1.452417, 0, 1, 0.5333334, 1,
-0.1894325, -0.003277034, -1.143185, 0, 1, 0.5372549, 1,
-0.1859214, 0.9838984, -0.6440635, 0, 1, 0.5450981, 1,
-0.1850162, 0.6582496, 1.415527, 0, 1, 0.5490196, 1,
-0.1809094, -0.2283892, -2.065276, 0, 1, 0.5568628, 1,
-0.179073, -1.584677, -5.150592, 0, 1, 0.5607843, 1,
-0.176758, 0.6714043, -0.8544699, 0, 1, 0.5686275, 1,
-0.1757172, -0.8935977, -2.596563, 0, 1, 0.572549, 1,
-0.1730454, -1.050826, -1.040832, 0, 1, 0.5803922, 1,
-0.1723996, 0.1189652, -2.259066, 0, 1, 0.5843138, 1,
-0.1648244, 0.4235539, -0.9903555, 0, 1, 0.5921569, 1,
-0.1588619, 0.1528738, -1.21251, 0, 1, 0.5960785, 1,
-0.1567576, 0.3870736, 0.4466934, 0, 1, 0.6039216, 1,
-0.1561867, -0.5929701, -3.060518, 0, 1, 0.6117647, 1,
-0.1559725, 0.6544494, -0.541803, 0, 1, 0.6156863, 1,
-0.1529146, -1.78794, -3.681246, 0, 1, 0.6235294, 1,
-0.1508068, 0.827138, 0.2647706, 0, 1, 0.627451, 1,
-0.1487306, -0.8227283, -1.563603, 0, 1, 0.6352941, 1,
-0.1464183, -0.7858173, -3.725288, 0, 1, 0.6392157, 1,
-0.1443922, -0.2834753, -3.173765, 0, 1, 0.6470588, 1,
-0.141289, -0.6930808, -3.074324, 0, 1, 0.6509804, 1,
-0.1374933, 1.683452, -2.555311, 0, 1, 0.6588235, 1,
-0.134695, -1.53082, -2.952537, 0, 1, 0.6627451, 1,
-0.1337182, -0.663918, -3.139106, 0, 1, 0.6705883, 1,
-0.1326875, 0.3366387, 0.1429766, 0, 1, 0.6745098, 1,
-0.1280366, -0.5216511, -1.047783, 0, 1, 0.682353, 1,
-0.1255026, -0.2149005, -3.297645, 0, 1, 0.6862745, 1,
-0.1240141, 0.3841629, -1.356857, 0, 1, 0.6941177, 1,
-0.119942, -1.04597, -2.651565, 0, 1, 0.7019608, 1,
-0.1190118, 0.4718943, -0.6513532, 0, 1, 0.7058824, 1,
-0.1179402, -1.500954, -3.093473, 0, 1, 0.7137255, 1,
-0.1176708, 0.8300708, -1.520149, 0, 1, 0.7176471, 1,
-0.1137011, 0.3908716, -0.90545, 0, 1, 0.7254902, 1,
-0.1106159, 0.5565602, -0.1532547, 0, 1, 0.7294118, 1,
-0.1056981, 0.7936193, -0.216957, 0, 1, 0.7372549, 1,
-0.105111, 0.1493118, 1.16625, 0, 1, 0.7411765, 1,
-0.1015625, -0.5631625, -2.754952, 0, 1, 0.7490196, 1,
-0.1004496, -0.01211254, -1.701337, 0, 1, 0.7529412, 1,
-0.09948978, 0.6817181, -0.5748534, 0, 1, 0.7607843, 1,
-0.09353516, -1.176384, -4.129236, 0, 1, 0.7647059, 1,
-0.09285964, -0.04567246, -2.850816, 0, 1, 0.772549, 1,
-0.09104565, -1.666494, -3.093773, 0, 1, 0.7764706, 1,
-0.08410929, 0.6859301, 0.1187114, 0, 1, 0.7843137, 1,
-0.08201011, 1.426293, -1.029508, 0, 1, 0.7882353, 1,
-0.07829729, 1.378384, 2.104913, 0, 1, 0.7960784, 1,
-0.06885568, -0.1336094, -2.268923, 0, 1, 0.8039216, 1,
-0.06182455, 0.5117445, -1.07627, 0, 1, 0.8078431, 1,
-0.05984248, -2.044568, -3.880093, 0, 1, 0.8156863, 1,
-0.05623588, -0.4165765, -3.953644, 0, 1, 0.8196079, 1,
-0.05327028, -0.2489481, -2.227499, 0, 1, 0.827451, 1,
-0.0493865, -1.901537, -2.612142, 0, 1, 0.8313726, 1,
-0.04864196, 2.121888, 1.266766, 0, 1, 0.8392157, 1,
-0.04758828, -1.435105, -2.662865, 0, 1, 0.8431373, 1,
-0.04474201, -0.6363209, -3.500716, 0, 1, 0.8509804, 1,
-0.04285657, 1.759786, -0.3075598, 0, 1, 0.854902, 1,
-0.04176917, 0.7982479, -0.05083625, 0, 1, 0.8627451, 1,
-0.0406307, 0.3413347, -2.470547, 0, 1, 0.8666667, 1,
-0.03742979, -0.5845929, -3.51773, 0, 1, 0.8745098, 1,
-0.03064952, 1.437516, 0.5823005, 0, 1, 0.8784314, 1,
-0.02898234, 0.5036227, 1.257092, 0, 1, 0.8862745, 1,
-0.0275237, -1.574595, -1.848786, 0, 1, 0.8901961, 1,
-0.02367857, 1.380959, -0.5023494, 0, 1, 0.8980392, 1,
-0.02201328, 1.678876, 0.1527141, 0, 1, 0.9058824, 1,
-0.01979861, 0.1648959, -0.9510527, 0, 1, 0.9098039, 1,
-0.01433156, -0.6151788, -3.135032, 0, 1, 0.9176471, 1,
-0.01414982, -1.749606, -4.021414, 0, 1, 0.9215686, 1,
-0.01180696, 0.2702973, 0.05581563, 0, 1, 0.9294118, 1,
-0.01126529, -2.135145, -4.570997, 0, 1, 0.9333333, 1,
-0.01089792, -0.2930365, -3.42844, 0, 1, 0.9411765, 1,
-0.009977944, 1.563239, 1.306632, 0, 1, 0.945098, 1,
-0.005454301, 0.06996884, 0.3785165, 0, 1, 0.9529412, 1,
-0.004150643, 0.1480036, 1.835829, 0, 1, 0.9568627, 1,
-0.001906813, -0.1871935, -1.899991, 0, 1, 0.9647059, 1,
-0.001806495, 0.8742002, 0.4839772, 0, 1, 0.9686275, 1,
0.001204951, 1.444347, 0.5689242, 0, 1, 0.9764706, 1,
0.001300683, 1.433243, 0.4534387, 0, 1, 0.9803922, 1,
0.005652856, 0.6512505, -0.1047792, 0, 1, 0.9882353, 1,
0.009824242, 0.7573821, -0.9157386, 0, 1, 0.9921569, 1,
0.01086851, 0.1914472, -0.9889354, 0, 1, 1, 1,
0.02226754, -0.4434705, 3.711447, 0, 0.9921569, 1, 1,
0.02499014, 1.247691, -0.8096616, 0, 0.9882353, 1, 1,
0.02608635, -1.315043, 3.207884, 0, 0.9803922, 1, 1,
0.03197234, 0.5877291, 1.192573, 0, 0.9764706, 1, 1,
0.03476932, -1.311881, 3.465384, 0, 0.9686275, 1, 1,
0.03569506, -0.947309, 2.988924, 0, 0.9647059, 1, 1,
0.03701237, -1.037451, 2.623706, 0, 0.9568627, 1, 1,
0.03931033, 1.176815, -0.2517975, 0, 0.9529412, 1, 1,
0.04196687, -0.2473955, 2.689424, 0, 0.945098, 1, 1,
0.04335908, -1.982601, 4.722334, 0, 0.9411765, 1, 1,
0.04352991, 1.523032, 0.3474981, 0, 0.9333333, 1, 1,
0.04542173, 0.2411174, -1.393304, 0, 0.9294118, 1, 1,
0.04582315, -0.3953334, 1.767945, 0, 0.9215686, 1, 1,
0.04698834, 0.01710987, -0.2622336, 0, 0.9176471, 1, 1,
0.05046832, -0.6473564, 2.622236, 0, 0.9098039, 1, 1,
0.05260205, 1.345949, 0.3985028, 0, 0.9058824, 1, 1,
0.05407058, 0.4116993, -0.6238546, 0, 0.8980392, 1, 1,
0.06102126, 0.7826083, 0.9616244, 0, 0.8901961, 1, 1,
0.06395005, 1.445894, 0.440482, 0, 0.8862745, 1, 1,
0.06438299, -0.5849643, 3.784651, 0, 0.8784314, 1, 1,
0.06579565, -1.783025, 3.285716, 0, 0.8745098, 1, 1,
0.06642073, 1.235001, -0.60649, 0, 0.8666667, 1, 1,
0.07434925, -0.3658808, 2.903877, 0, 0.8627451, 1, 1,
0.07538669, 0.865186, -0.268924, 0, 0.854902, 1, 1,
0.07803719, -0.006245086, -0.4623765, 0, 0.8509804, 1, 1,
0.07812865, -1.05775, 2.140517, 0, 0.8431373, 1, 1,
0.07990832, 2.159015, -0.3427839, 0, 0.8392157, 1, 1,
0.08090237, 0.7601326, -0.4248528, 0, 0.8313726, 1, 1,
0.08300816, 1.098491, -0.4800434, 0, 0.827451, 1, 1,
0.08388071, 0.8149649, 1.780221, 0, 0.8196079, 1, 1,
0.08641582, -0.8157709, 4.407074, 0, 0.8156863, 1, 1,
0.08655462, 0.1540095, -1.261335, 0, 0.8078431, 1, 1,
0.08795424, 1.845638, 0.8669781, 0, 0.8039216, 1, 1,
0.08888683, 0.5801758, 1.576227, 0, 0.7960784, 1, 1,
0.08894603, -1.326427, 1.862464, 0, 0.7882353, 1, 1,
0.09101482, -0.9673941, 2.073232, 0, 0.7843137, 1, 1,
0.09348093, 0.816094, 0.06627152, 0, 0.7764706, 1, 1,
0.09845992, 1.564582, 2.32266, 0, 0.772549, 1, 1,
0.09878058, -1.383742, 3.41854, 0, 0.7647059, 1, 1,
0.09904125, -0.4659393, 3.367124, 0, 0.7607843, 1, 1,
0.1054511, -0.2777185, 2.688224, 0, 0.7529412, 1, 1,
0.1099832, 1.223321, -0.01614929, 0, 0.7490196, 1, 1,
0.1102425, 0.9052345, -0.6489033, 0, 0.7411765, 1, 1,
0.1139357, -0.794696, 0.9830154, 0, 0.7372549, 1, 1,
0.1145429, -1.13009, 4.299056, 0, 0.7294118, 1, 1,
0.1176435, 1.455052, -0.1294816, 0, 0.7254902, 1, 1,
0.1186602, 1.984651, -0.5875555, 0, 0.7176471, 1, 1,
0.1189871, 0.4524947, 1.55517, 0, 0.7137255, 1, 1,
0.1224416, -1.527702, 2.662318, 0, 0.7058824, 1, 1,
0.1241312, 0.1863771, 0.06935637, 0, 0.6980392, 1, 1,
0.1263545, -2.119488, 2.943106, 0, 0.6941177, 1, 1,
0.12637, 1.329118, -1.646139, 0, 0.6862745, 1, 1,
0.1323864, -1.24534, 2.105274, 0, 0.682353, 1, 1,
0.1356702, -0.7939942, 3.240479, 0, 0.6745098, 1, 1,
0.1382131, 0.1648973, 2.119365, 0, 0.6705883, 1, 1,
0.1403605, 2.183145, 2.084934, 0, 0.6627451, 1, 1,
0.1430509, -0.5778226, 3.589932, 0, 0.6588235, 1, 1,
0.1444723, 0.5896224, 1.047588, 0, 0.6509804, 1, 1,
0.150815, -0.3787439, 0.9984591, 0, 0.6470588, 1, 1,
0.1533757, 0.2670325, -0.791078, 0, 0.6392157, 1, 1,
0.1549532, 0.4130552, 1.214917, 0, 0.6352941, 1, 1,
0.1551232, -0.8297936, 4.327635, 0, 0.627451, 1, 1,
0.1590661, -0.69018, 1.762367, 0, 0.6235294, 1, 1,
0.1605151, 0.09025424, 0.3166288, 0, 0.6156863, 1, 1,
0.1637558, -1.76914, 3.177978, 0, 0.6117647, 1, 1,
0.1656336, 1.667988, -0.9126645, 0, 0.6039216, 1, 1,
0.169202, -1.157972, 2.773312, 0, 0.5960785, 1, 1,
0.1699941, -0.2175478, 3.039993, 0, 0.5921569, 1, 1,
0.1717996, 1.245019, 0.7767999, 0, 0.5843138, 1, 1,
0.1737944, 0.6317578, 1.267401, 0, 0.5803922, 1, 1,
0.1739618, -1.383821, 3.202464, 0, 0.572549, 1, 1,
0.1741996, -0.5250515, 1.897065, 0, 0.5686275, 1, 1,
0.1754764, -1.049527, 2.998157, 0, 0.5607843, 1, 1,
0.1765213, 0.3929231, -1.777844, 0, 0.5568628, 1, 1,
0.1827848, -0.01913882, 1.652363, 0, 0.5490196, 1, 1,
0.1827933, 1.847432, -0.5813367, 0, 0.5450981, 1, 1,
0.1871807, -0.7537778, 4.147514, 0, 0.5372549, 1, 1,
0.1919637, 1.716009, -0.9795197, 0, 0.5333334, 1, 1,
0.1926531, -0.5353844, 3.312428, 0, 0.5254902, 1, 1,
0.1935478, 1.262161, 1.433456, 0, 0.5215687, 1, 1,
0.1935772, 0.5341793, 0.00812199, 0, 0.5137255, 1, 1,
0.1992731, 0.07951616, 1.09928, 0, 0.509804, 1, 1,
0.1993007, -0.3971857, 2.852055, 0, 0.5019608, 1, 1,
0.2029334, 0.7159597, 0.2100974, 0, 0.4941176, 1, 1,
0.2046899, -2.483181, 3.147053, 0, 0.4901961, 1, 1,
0.2070693, -0.7271941, 3.161976, 0, 0.4823529, 1, 1,
0.2101395, 0.8693517, 0.4555469, 0, 0.4784314, 1, 1,
0.2122902, 0.3453712, 0.9882829, 0, 0.4705882, 1, 1,
0.2140521, 1.283966, -0.3873193, 0, 0.4666667, 1, 1,
0.2162569, -0.333132, 3.183681, 0, 0.4588235, 1, 1,
0.2170807, 0.004063514, 2.034163, 0, 0.454902, 1, 1,
0.2221122, -0.08839823, 2.894895, 0, 0.4470588, 1, 1,
0.224754, 1.559342, -0.6253699, 0, 0.4431373, 1, 1,
0.2394718, 1.052541, 0.6561094, 0, 0.4352941, 1, 1,
0.2443338, 1.54633, -1.036503, 0, 0.4313726, 1, 1,
0.2475724, -3.232717, 3.46707, 0, 0.4235294, 1, 1,
0.2478604, -0.5505586, 3.341605, 0, 0.4196078, 1, 1,
0.2495063, -0.5649901, 4.204851, 0, 0.4117647, 1, 1,
0.2521969, -0.5273991, 3.825819, 0, 0.4078431, 1, 1,
0.2566337, -1.611146, 3.383372, 0, 0.4, 1, 1,
0.2569958, 0.6821378, 0.9414243, 0, 0.3921569, 1, 1,
0.2578943, 0.8454868, -1.387251, 0, 0.3882353, 1, 1,
0.2624893, -0.751272, 1.3615, 0, 0.3803922, 1, 1,
0.2626267, 1.242519, 1.679835, 0, 0.3764706, 1, 1,
0.2638424, -0.4178285, 2.235583, 0, 0.3686275, 1, 1,
0.2642275, -3.934818, 4.592777, 0, 0.3647059, 1, 1,
0.2682378, 1.893266, 0.9712959, 0, 0.3568628, 1, 1,
0.2707993, 0.6112688, 0.04457793, 0, 0.3529412, 1, 1,
0.2718358, -2.880806, 2.834194, 0, 0.345098, 1, 1,
0.2720468, -0.3768086, 3.025488, 0, 0.3411765, 1, 1,
0.2729411, 0.58336, -2.188585, 0, 0.3333333, 1, 1,
0.2731692, -0.3243902, 3.872608, 0, 0.3294118, 1, 1,
0.2733914, -0.9220297, 3.913645, 0, 0.3215686, 1, 1,
0.2770289, -1.281954, 1.543023, 0, 0.3176471, 1, 1,
0.2800349, 0.3925599, 0.8358269, 0, 0.3098039, 1, 1,
0.2800359, 1.137738, 0.0009896887, 0, 0.3058824, 1, 1,
0.2832603, -0.8218112, 3.187939, 0, 0.2980392, 1, 1,
0.2891746, 0.05735262, 1.099012, 0, 0.2901961, 1, 1,
0.2909661, -0.3379924, 1.959639, 0, 0.2862745, 1, 1,
0.294463, -0.7616574, 3.21567, 0, 0.2784314, 1, 1,
0.3007158, 0.09367536, 2.507034, 0, 0.2745098, 1, 1,
0.3014117, 1.243462, 0.148564, 0, 0.2666667, 1, 1,
0.3093892, 0.2279555, 1.614042, 0, 0.2627451, 1, 1,
0.310769, -0.02798035, 1.244708, 0, 0.254902, 1, 1,
0.3132522, 0.2732008, 1.838531, 0, 0.2509804, 1, 1,
0.3195005, 0.4662019, 0.006723855, 0, 0.2431373, 1, 1,
0.3202256, 1.053054, 1.633208, 0, 0.2392157, 1, 1,
0.3220806, 1.138776, 1.913508, 0, 0.2313726, 1, 1,
0.3240511, 0.822112, 0.09932151, 0, 0.227451, 1, 1,
0.3266901, -0.2371599, 3.443307, 0, 0.2196078, 1, 1,
0.3278209, 1.096568, 0.4967908, 0, 0.2156863, 1, 1,
0.328225, -0.5180277, 1.721615, 0, 0.2078431, 1, 1,
0.332242, -1.324799, 2.16905, 0, 0.2039216, 1, 1,
0.3325078, 1.272994, -0.4376422, 0, 0.1960784, 1, 1,
0.3331541, 0.4701124, 0.408095, 0, 0.1882353, 1, 1,
0.3361436, 0.3808334, 0.1752129, 0, 0.1843137, 1, 1,
0.3377882, -0.2103843, 2.337005, 0, 0.1764706, 1, 1,
0.3397802, -0.4453689, 2.365173, 0, 0.172549, 1, 1,
0.3411427, -0.8980598, 0.5069052, 0, 0.1647059, 1, 1,
0.3445913, 0.08996218, 3.380154, 0, 0.1607843, 1, 1,
0.3447438, 0.4263429, 0.129331, 0, 0.1529412, 1, 1,
0.3484558, -1.129214, 1.256796, 0, 0.1490196, 1, 1,
0.3506554, -1.664174, 4.129086, 0, 0.1411765, 1, 1,
0.3516564, 0.9729024, 0.6074393, 0, 0.1372549, 1, 1,
0.3524441, -1.024915, 3.046646, 0, 0.1294118, 1, 1,
0.3547582, 0.8420428, 1.2378, 0, 0.1254902, 1, 1,
0.3580813, 1.163178, 0.4632353, 0, 0.1176471, 1, 1,
0.3586478, -1.375627, 1.817898, 0, 0.1137255, 1, 1,
0.3610664, 0.2628637, -0.1035668, 0, 0.1058824, 1, 1,
0.366832, -0.114853, 3.007538, 0, 0.09803922, 1, 1,
0.3675352, -0.5713735, 2.583774, 0, 0.09411765, 1, 1,
0.3676343, -0.2121628, 1.223336, 0, 0.08627451, 1, 1,
0.3706989, 0.9883791, 1.198069, 0, 0.08235294, 1, 1,
0.3805373, 0.1372657, 2.4858, 0, 0.07450981, 1, 1,
0.3920313, -1.194887, 1.346721, 0, 0.07058824, 1, 1,
0.4033826, 0.3456039, -0.1739025, 0, 0.0627451, 1, 1,
0.4038009, 1.231774, 1.648767, 0, 0.05882353, 1, 1,
0.4097747, 0.7485595, 2.128081, 0, 0.05098039, 1, 1,
0.4110419, 0.4410619, 0.3723506, 0, 0.04705882, 1, 1,
0.4112658, -2.431196, 4.78726, 0, 0.03921569, 1, 1,
0.4150472, -0.04801515, 1.81969, 0, 0.03529412, 1, 1,
0.4151823, 0.3895498, 2.264749, 0, 0.02745098, 1, 1,
0.4160629, -0.5412687, 3.140472, 0, 0.02352941, 1, 1,
0.4168375, 0.2362498, 1.191432, 0, 0.01568628, 1, 1,
0.4199227, 0.1992757, -0.235747, 0, 0.01176471, 1, 1,
0.4212632, 0.6251619, 0.5903838, 0, 0.003921569, 1, 1,
0.4215151, -0.8992962, 2.806284, 0.003921569, 0, 1, 1,
0.4259435, -1.323745, 3.45183, 0.007843138, 0, 1, 1,
0.4264056, 2.013987, -0.9077313, 0.01568628, 0, 1, 1,
0.4306317, -2.041373, 1.682258, 0.01960784, 0, 1, 1,
0.4377515, -0.6770115, 1.749788, 0.02745098, 0, 1, 1,
0.440216, -0.8101999, 1.969592, 0.03137255, 0, 1, 1,
0.4435648, -1.092696, 1.668463, 0.03921569, 0, 1, 1,
0.4487763, -0.9505545, 4.08, 0.04313726, 0, 1, 1,
0.449751, 0.3693435, 0.4971223, 0.05098039, 0, 1, 1,
0.4504056, -0.2860879, 1.449796, 0.05490196, 0, 1, 1,
0.4547587, 0.5913043, 0.9061219, 0.0627451, 0, 1, 1,
0.4559591, -0.6019296, 2.658489, 0.06666667, 0, 1, 1,
0.4582203, -1.170419, 3.573113, 0.07450981, 0, 1, 1,
0.4594438, 1.80789, -0.5024902, 0.07843138, 0, 1, 1,
0.4598727, -1.305863, 2.783686, 0.08627451, 0, 1, 1,
0.4671015, -1.145125, 3.368474, 0.09019608, 0, 1, 1,
0.46821, 0.3390585, 0.9331419, 0.09803922, 0, 1, 1,
0.4713157, -1.621914, 3.079016, 0.1058824, 0, 1, 1,
0.4729028, -0.8053603, 4.017551, 0.1098039, 0, 1, 1,
0.4748084, -1.456556, 4.772562, 0.1176471, 0, 1, 1,
0.4763787, -0.9573517, 2.07243, 0.1215686, 0, 1, 1,
0.4769669, 0.3146145, 1.748821, 0.1294118, 0, 1, 1,
0.4810039, 0.1896208, 2.08443, 0.1333333, 0, 1, 1,
0.4848655, 1.141937, -0.3592637, 0.1411765, 0, 1, 1,
0.4894565, 0.6837015, 0.8813455, 0.145098, 0, 1, 1,
0.4903605, -0.07199645, 2.085356, 0.1529412, 0, 1, 1,
0.4912403, 0.6296917, -1.244702, 0.1568628, 0, 1, 1,
0.491875, -1.492435, 2.789364, 0.1647059, 0, 1, 1,
0.4931737, -2.18069, 1.972887, 0.1686275, 0, 1, 1,
0.501439, 0.3861955, 1.506492, 0.1764706, 0, 1, 1,
0.5025358, -1.098688, 4.061059, 0.1803922, 0, 1, 1,
0.5032444, 0.1870788, 2.069024, 0.1882353, 0, 1, 1,
0.507044, -0.9956533, 1.166923, 0.1921569, 0, 1, 1,
0.5084365, 0.07273267, 2.776136, 0.2, 0, 1, 1,
0.5114236, -0.01607267, 1.842923, 0.2078431, 0, 1, 1,
0.5139169, 1.102818, -1.208919, 0.2117647, 0, 1, 1,
0.5233247, -0.1225314, -0.7463521, 0.2196078, 0, 1, 1,
0.5272437, -0.02446999, 2.651897, 0.2235294, 0, 1, 1,
0.5289796, -0.8683736, 0.9959368, 0.2313726, 0, 1, 1,
0.536682, -1.088281, 3.102136, 0.2352941, 0, 1, 1,
0.5393758, -0.9900082, 1.583544, 0.2431373, 0, 1, 1,
0.5418236, -0.2515202, 2.430501, 0.2470588, 0, 1, 1,
0.5419132, 2.889766, 0.3184862, 0.254902, 0, 1, 1,
0.5481828, 0.3215511, 2.210808, 0.2588235, 0, 1, 1,
0.5503137, -0.5999541, 0.6410082, 0.2666667, 0, 1, 1,
0.5507767, -0.3135281, 2.925678, 0.2705882, 0, 1, 1,
0.5508328, -0.1072854, 1.301318, 0.2784314, 0, 1, 1,
0.5523068, -1.025664, 2.255888, 0.282353, 0, 1, 1,
0.5581177, 1.218034, 1.500207, 0.2901961, 0, 1, 1,
0.5585437, 1.211612, 0.2277395, 0.2941177, 0, 1, 1,
0.5586314, 1.219256, 0.7069066, 0.3019608, 0, 1, 1,
0.5626834, -0.07148718, 2.461006, 0.3098039, 0, 1, 1,
0.565217, 0.1682165, 0.6188371, 0.3137255, 0, 1, 1,
0.5658632, -0.7414752, -0.2406549, 0.3215686, 0, 1, 1,
0.570034, -0.3996482, 1.944357, 0.3254902, 0, 1, 1,
0.5764635, -0.3523442, 3.043735, 0.3333333, 0, 1, 1,
0.5791363, -0.7519833, 1.869218, 0.3372549, 0, 1, 1,
0.5795192, 1.252711, 1.702797, 0.345098, 0, 1, 1,
0.5847707, 2.161515, 0.8055024, 0.3490196, 0, 1, 1,
0.5891765, -1.984273, 2.139734, 0.3568628, 0, 1, 1,
0.5892186, 1.96569, 2.313736, 0.3607843, 0, 1, 1,
0.5933943, -0.2145611, 1.591174, 0.3686275, 0, 1, 1,
0.5935761, 0.4923031, 1.761546, 0.372549, 0, 1, 1,
0.595636, 0.3507752, 2.191396, 0.3803922, 0, 1, 1,
0.6004959, 0.3467176, 3.227125, 0.3843137, 0, 1, 1,
0.6007381, -1.163842, 1.291982, 0.3921569, 0, 1, 1,
0.6118278, 0.1423261, 2.504446, 0.3960784, 0, 1, 1,
0.6134943, -0.4949814, 1.763903, 0.4039216, 0, 1, 1,
0.6171589, 0.4058156, 1.798728, 0.4117647, 0, 1, 1,
0.619832, -0.01969807, 2.012215, 0.4156863, 0, 1, 1,
0.6266248, -0.1941561, 1.741063, 0.4235294, 0, 1, 1,
0.6363512, -0.5214539, 1.284538, 0.427451, 0, 1, 1,
0.638672, -1.500414, 1.773415, 0.4352941, 0, 1, 1,
0.639074, 0.1569187, 3.983657, 0.4392157, 0, 1, 1,
0.6399937, 1.241286, 0.4228732, 0.4470588, 0, 1, 1,
0.6414077, -0.474677, 0.3984502, 0.4509804, 0, 1, 1,
0.6484272, 0.1762507, 0.1691398, 0.4588235, 0, 1, 1,
0.6540372, -0.3962193, 3.547652, 0.4627451, 0, 1, 1,
0.6543926, 0.3241192, -0.1216025, 0.4705882, 0, 1, 1,
0.6587154, 0.1873188, 1.689759, 0.4745098, 0, 1, 1,
0.6594412, -0.07905468, 0.3059677, 0.4823529, 0, 1, 1,
0.6595682, -0.5277769, 2.373647, 0.4862745, 0, 1, 1,
0.6603124, 0.9494082, -0.3579554, 0.4941176, 0, 1, 1,
0.662587, -0.8344484, 2.573325, 0.5019608, 0, 1, 1,
0.6700271, 0.8087463, 1.607939, 0.5058824, 0, 1, 1,
0.6724209, -0.1668923, 0.1657116, 0.5137255, 0, 1, 1,
0.6731989, -0.8497609, 3.596326, 0.5176471, 0, 1, 1,
0.6736333, 0.00117367, -0.4576455, 0.5254902, 0, 1, 1,
0.674212, -0.2196477, 1.758356, 0.5294118, 0, 1, 1,
0.6751553, -0.6754051, 2.650927, 0.5372549, 0, 1, 1,
0.6760616, -0.7107322, 1.326324, 0.5411765, 0, 1, 1,
0.676573, -1.36482, 1.846146, 0.5490196, 0, 1, 1,
0.6777385, -0.4112633, 1.143347, 0.5529412, 0, 1, 1,
0.6804852, 0.1841007, -0.9398861, 0.5607843, 0, 1, 1,
0.6823385, -0.8428805, 2.539961, 0.5647059, 0, 1, 1,
0.6875756, -1.774742, 3.107224, 0.572549, 0, 1, 1,
0.6884557, 0.09662768, 1.201651, 0.5764706, 0, 1, 1,
0.6885428, -0.09953272, 2.433868, 0.5843138, 0, 1, 1,
0.699325, -1.624707, 2.627228, 0.5882353, 0, 1, 1,
0.7020372, -0.4282759, 0.1970709, 0.5960785, 0, 1, 1,
0.7055608, 1.247645, 1.427903, 0.6039216, 0, 1, 1,
0.7068588, 0.6506649, 0.8914611, 0.6078432, 0, 1, 1,
0.7169906, 1.328511, -0.0896055, 0.6156863, 0, 1, 1,
0.7181041, 0.74496, -0.6256772, 0.6196079, 0, 1, 1,
0.7207347, 0.02585354, 2.670543, 0.627451, 0, 1, 1,
0.7209019, -0.256475, 3.057536, 0.6313726, 0, 1, 1,
0.7217125, 0.4653829, -0.7418328, 0.6392157, 0, 1, 1,
0.7220476, -0.6138201, 1.5858, 0.6431373, 0, 1, 1,
0.7224258, 0.2733188, 1.270901, 0.6509804, 0, 1, 1,
0.7242817, -0.1820181, 1.129007, 0.654902, 0, 1, 1,
0.7243214, -1.408323, 2.361663, 0.6627451, 0, 1, 1,
0.7306319, -0.5167398, 3.39977, 0.6666667, 0, 1, 1,
0.7354835, 0.3464688, 0.7907005, 0.6745098, 0, 1, 1,
0.740727, 0.8379798, 0.04485158, 0.6784314, 0, 1, 1,
0.7462924, -1.234313, 2.796665, 0.6862745, 0, 1, 1,
0.7481212, 1.162673, -0.05941874, 0.6901961, 0, 1, 1,
0.7485005, -0.8407815, 0.7460289, 0.6980392, 0, 1, 1,
0.7622372, -0.3205782, 0.9348354, 0.7058824, 0, 1, 1,
0.764204, 1.902892, 1.442156, 0.7098039, 0, 1, 1,
0.7651221, 1.238719, -0.1764674, 0.7176471, 0, 1, 1,
0.7651845, 1.83102, -0.08507231, 0.7215686, 0, 1, 1,
0.7667935, 1.195457, 0.5728863, 0.7294118, 0, 1, 1,
0.7749261, 0.9599806, -0.02174608, 0.7333333, 0, 1, 1,
0.7770849, -0.4939937, 1.88884, 0.7411765, 0, 1, 1,
0.784093, 0.4630124, 1.859262, 0.7450981, 0, 1, 1,
0.7908109, 1.21643, 2.045496, 0.7529412, 0, 1, 1,
0.792801, -0.9241883, 2.972435, 0.7568628, 0, 1, 1,
0.8087039, 0.09356146, 1.13698, 0.7647059, 0, 1, 1,
0.8101857, -0.05733172, 1.506225, 0.7686275, 0, 1, 1,
0.8138966, -0.004736193, 0.502601, 0.7764706, 0, 1, 1,
0.8165717, -0.07402863, 1.164451, 0.7803922, 0, 1, 1,
0.8204358, -1.711751, 3.994832, 0.7882353, 0, 1, 1,
0.8224701, -0.7438581, 2.292159, 0.7921569, 0, 1, 1,
0.8226116, 1.441705, -1.372618, 0.8, 0, 1, 1,
0.8262623, 0.2492598, 1.352624, 0.8078431, 0, 1, 1,
0.8291018, 1.255794, 0.2879489, 0.8117647, 0, 1, 1,
0.8330408, -1.77317, 1.732755, 0.8196079, 0, 1, 1,
0.8369586, -1.382504, 0.9783367, 0.8235294, 0, 1, 1,
0.845162, -1.436586, 2.263393, 0.8313726, 0, 1, 1,
0.8461735, -0.9953572, 3.755554, 0.8352941, 0, 1, 1,
0.8553731, 0.3889277, 2.792434, 0.8431373, 0, 1, 1,
0.8558429, -0.8684087, 1.090752, 0.8470588, 0, 1, 1,
0.8569056, 0.3243249, 0.3726876, 0.854902, 0, 1, 1,
0.8672869, 0.9368982, 1.071723, 0.8588235, 0, 1, 1,
0.8758537, -2.806449, 2.190113, 0.8666667, 0, 1, 1,
0.8811114, 0.8880084, 1.542772, 0.8705882, 0, 1, 1,
0.8833889, -2.127904, 3.05393, 0.8784314, 0, 1, 1,
0.8837212, -1.508447, 0.7993485, 0.8823529, 0, 1, 1,
0.8907714, 0.04081518, 2.038911, 0.8901961, 0, 1, 1,
0.9075447, -0.7844024, 4.186, 0.8941177, 0, 1, 1,
0.9089164, 0.5329335, 1.372404, 0.9019608, 0, 1, 1,
0.91036, -1.945083, 0.004496544, 0.9098039, 0, 1, 1,
0.9144791, 1.115916, 0.927884, 0.9137255, 0, 1, 1,
0.9158652, 0.4030778, 2.667817, 0.9215686, 0, 1, 1,
0.9233237, -0.3318284, 1.29658, 0.9254902, 0, 1, 1,
0.9247546, 0.3974763, 1.57079, 0.9333333, 0, 1, 1,
0.9365631, 0.2519719, 1.683248, 0.9372549, 0, 1, 1,
0.9448572, 1.359853, -1.921375, 0.945098, 0, 1, 1,
0.9494045, -1.114338, 1.285573, 0.9490196, 0, 1, 1,
0.9595621, -1.277682, 3.133476, 0.9568627, 0, 1, 1,
0.9614421, 0.790785, 2.372877, 0.9607843, 0, 1, 1,
0.9624996, -0.6621155, 3.293686, 0.9686275, 0, 1, 1,
0.9658061, -1.616733, 3.49049, 0.972549, 0, 1, 1,
0.9677742, -1.174344, 2.08068, 0.9803922, 0, 1, 1,
0.9685927, -0.2103029, 1.942027, 0.9843137, 0, 1, 1,
0.9777708, 0.4892058, 2.487136, 0.9921569, 0, 1, 1,
1.008813, 0.3126311, 1.234754, 0.9960784, 0, 1, 1,
1.027567, -0.5054176, 2.890216, 1, 0, 0.9960784, 1,
1.032228, -0.775488, 0.8175763, 1, 0, 0.9882353, 1,
1.035034, -0.9106049, 2.739107, 1, 0, 0.9843137, 1,
1.040325, 1.463812, 2.730524, 1, 0, 0.9764706, 1,
1.048094, 0.06046336, 1.441368, 1, 0, 0.972549, 1,
1.052676, -0.1280097, 0.6617349, 1, 0, 0.9647059, 1,
1.05391, 0.5158787, 0.9908204, 1, 0, 0.9607843, 1,
1.056967, -0.0382614, 2.832672, 1, 0, 0.9529412, 1,
1.059148, 0.8361202, 0.4810082, 1, 0, 0.9490196, 1,
1.064934, -0.2732733, 1.149366, 1, 0, 0.9411765, 1,
1.067671, 1.198379, -0.07422222, 1, 0, 0.9372549, 1,
1.07177, -0.5666195, 2.739106, 1, 0, 0.9294118, 1,
1.079042, 0.2112308, -1.091123, 1, 0, 0.9254902, 1,
1.079726, -0.4065274, 2.16645, 1, 0, 0.9176471, 1,
1.080378, 0.4408273, 2.007919, 1, 0, 0.9137255, 1,
1.081056, 1.576272, 0.9185413, 1, 0, 0.9058824, 1,
1.085679, 1.429156, 1.888017, 1, 0, 0.9019608, 1,
1.093792, 1.057462, 0.1651344, 1, 0, 0.8941177, 1,
1.097268, -0.0362941, 2.748525, 1, 0, 0.8862745, 1,
1.099342, 0.4645714, 0.9559487, 1, 0, 0.8823529, 1,
1.103027, 0.7856533, 2.051746, 1, 0, 0.8745098, 1,
1.104329, 0.1569825, 1.431867, 1, 0, 0.8705882, 1,
1.107071, 0.5281031, 1.855882, 1, 0, 0.8627451, 1,
1.111033, 1.972345, 2.000042, 1, 0, 0.8588235, 1,
1.114366, -0.07870899, 1.433321, 1, 0, 0.8509804, 1,
1.126684, -1.129341, 1.961164, 1, 0, 0.8470588, 1,
1.127577, 1.157846, 0.8828623, 1, 0, 0.8392157, 1,
1.136224, -0.8463399, 2.608134, 1, 0, 0.8352941, 1,
1.139593, -0.4448639, 1.55854, 1, 0, 0.827451, 1,
1.141385, -1.279182, 1.804439, 1, 0, 0.8235294, 1,
1.142412, -0.9011246, 2.396951, 1, 0, 0.8156863, 1,
1.144958, -0.5726115, 3.107878, 1, 0, 0.8117647, 1,
1.155273, 1.396346, 0.7718275, 1, 0, 0.8039216, 1,
1.158717, 0.8765121, -0.5785348, 1, 0, 0.7960784, 1,
1.158874, -0.1152872, 1.6896, 1, 0, 0.7921569, 1,
1.160087, -2.235989, 3.092351, 1, 0, 0.7843137, 1,
1.167846, 1.202631, 2.000046, 1, 0, 0.7803922, 1,
1.167905, -0.4112311, 2.249736, 1, 0, 0.772549, 1,
1.170437, 0.05756823, 0.06681343, 1, 0, 0.7686275, 1,
1.170948, -1.171012, 0.8892841, 1, 0, 0.7607843, 1,
1.177601, -1.870076, 4.004089, 1, 0, 0.7568628, 1,
1.178689, -0.735917, 3.555618, 1, 0, 0.7490196, 1,
1.180604, -0.219298, 2.155288, 1, 0, 0.7450981, 1,
1.184756, -1.453857, 2.263172, 1, 0, 0.7372549, 1,
1.19582, -1.244458, 1.507506, 1, 0, 0.7333333, 1,
1.199154, -0.5608352, 0.05183306, 1, 0, 0.7254902, 1,
1.19918, -0.4719163, 0.6124354, 1, 0, 0.7215686, 1,
1.205624, 0.8024209, 2.166934, 1, 0, 0.7137255, 1,
1.210244, 1.316081, -0.01704919, 1, 0, 0.7098039, 1,
1.215629, -1.726807, 1.267446, 1, 0, 0.7019608, 1,
1.216805, 0.7003134, 2.378094, 1, 0, 0.6941177, 1,
1.21904, 0.09975235, 0.5777068, 1, 0, 0.6901961, 1,
1.22872, -0.05763277, 0.6766111, 1, 0, 0.682353, 1,
1.238861, -0.3087271, 2.930982, 1, 0, 0.6784314, 1,
1.242566, 1.588788, -1.330904, 1, 0, 0.6705883, 1,
1.242578, -0.5341419, 2.589743, 1, 0, 0.6666667, 1,
1.242581, 0.2711227, 1.06805, 1, 0, 0.6588235, 1,
1.248494, -0.312348, 0.9081256, 1, 0, 0.654902, 1,
1.258961, -0.8445919, 0.4612298, 1, 0, 0.6470588, 1,
1.266612, 0.7412587, 0.2495198, 1, 0, 0.6431373, 1,
1.271184, 0.02072161, -0.1076723, 1, 0, 0.6352941, 1,
1.281292, -1.046118, 2.387969, 1, 0, 0.6313726, 1,
1.288193, -1.61113, 2.301045, 1, 0, 0.6235294, 1,
1.290231, 1.740293, 0.1430252, 1, 0, 0.6196079, 1,
1.295404, -1.502654, 3.416643, 1, 0, 0.6117647, 1,
1.299869, 0.4481164, -0.7998233, 1, 0, 0.6078432, 1,
1.306133, -0.01598206, 0.04251117, 1, 0, 0.6, 1,
1.307445, -0.5238885, 1.539697, 1, 0, 0.5921569, 1,
1.309505, -0.7613673, 1.831753, 1, 0, 0.5882353, 1,
1.312164, -0.02635815, 1.917357, 1, 0, 0.5803922, 1,
1.314707, 0.4155432, 0.2158794, 1, 0, 0.5764706, 1,
1.321551, -0.6308793, 1.75934, 1, 0, 0.5686275, 1,
1.329735, 1.15589, -0.6087749, 1, 0, 0.5647059, 1,
1.330658, 2.020032, 1.187551, 1, 0, 0.5568628, 1,
1.34757, 0.7357185, 0.3423097, 1, 0, 0.5529412, 1,
1.35951, 0.06356062, 1.522192, 1, 0, 0.5450981, 1,
1.365775, -0.6270261, 2.054077, 1, 0, 0.5411765, 1,
1.376912, -0.7439832, 2.183008, 1, 0, 0.5333334, 1,
1.385, -0.8323675, 3.239758, 1, 0, 0.5294118, 1,
1.394605, -0.9667947, 2.06958, 1, 0, 0.5215687, 1,
1.397572, -0.102364, 3.998617, 1, 0, 0.5176471, 1,
1.40889, -0.8638992, 2.016444, 1, 0, 0.509804, 1,
1.417666, 0.3203131, 0.09860422, 1, 0, 0.5058824, 1,
1.42145, 0.8118314, 2.426395, 1, 0, 0.4980392, 1,
1.423286, -0.4804243, -0.02435876, 1, 0, 0.4901961, 1,
1.427055, 0.1569002, 1.393156, 1, 0, 0.4862745, 1,
1.433579, 0.8188109, -0.5648969, 1, 0, 0.4784314, 1,
1.441367, 0.2864051, 1.719259, 1, 0, 0.4745098, 1,
1.442132, -0.07163966, 1.521075, 1, 0, 0.4666667, 1,
1.442223, -0.8550942, 2.235774, 1, 0, 0.4627451, 1,
1.442572, 1.592126, -1.06706, 1, 0, 0.454902, 1,
1.443333, 0.2287743, 0.5447448, 1, 0, 0.4509804, 1,
1.4454, -1.176798, 1.954714, 1, 0, 0.4431373, 1,
1.447514, -0.4307288, 0.6827859, 1, 0, 0.4392157, 1,
1.449526, 0.8631694, 1.323086, 1, 0, 0.4313726, 1,
1.460239, -0.6112836, 2.603515, 1, 0, 0.427451, 1,
1.465349, 0.07841513, 2.464879, 1, 0, 0.4196078, 1,
1.466394, 0.4233083, 1.971914, 1, 0, 0.4156863, 1,
1.469166, 0.1898257, 0.1021549, 1, 0, 0.4078431, 1,
1.47415, -0.230614, 1.749899, 1, 0, 0.4039216, 1,
1.482442, -1.451576, 2.782355, 1, 0, 0.3960784, 1,
1.502543, 0.5021947, 1.926273, 1, 0, 0.3882353, 1,
1.504261, -1.400995, 0.891897, 1, 0, 0.3843137, 1,
1.514222, -0.3982419, 2.063124, 1, 0, 0.3764706, 1,
1.515727, -0.9318801, 2.753145, 1, 0, 0.372549, 1,
1.533563, -1.873627, 2.241755, 1, 0, 0.3647059, 1,
1.538889, 0.06861317, 0.4235164, 1, 0, 0.3607843, 1,
1.544013, -0.1805884, 3.523595, 1, 0, 0.3529412, 1,
1.557996, -1.206176, 2.876762, 1, 0, 0.3490196, 1,
1.561264, -0.5746776, 3.015227, 1, 0, 0.3411765, 1,
1.563148, -0.3046731, 1.779929, 1, 0, 0.3372549, 1,
1.573313, 0.9023384, 1.072119, 1, 0, 0.3294118, 1,
1.583953, -1.006474, 2.136966, 1, 0, 0.3254902, 1,
1.589289, 1.341487, 1.036238, 1, 0, 0.3176471, 1,
1.589775, -0.8095908, 2.916509, 1, 0, 0.3137255, 1,
1.597583, -0.8763062, 1.553719, 1, 0, 0.3058824, 1,
1.59853, -0.192205, 3.402897, 1, 0, 0.2980392, 1,
1.602711, 1.03258, 1.04659, 1, 0, 0.2941177, 1,
1.603574, -2.245466, 1.848176, 1, 0, 0.2862745, 1,
1.667718, -0.3455991, 3.111696, 1, 0, 0.282353, 1,
1.672007, 0.6513142, -0.01465934, 1, 0, 0.2745098, 1,
1.695787, 0.992391, 2.414, 1, 0, 0.2705882, 1,
1.69659, 1.739388, 1.627295, 1, 0, 0.2627451, 1,
1.697066, -1.808809, 2.619237, 1, 0, 0.2588235, 1,
1.715574, -0.4613389, 3.357707, 1, 0, 0.2509804, 1,
1.7315, -0.6121973, 1.533009, 1, 0, 0.2470588, 1,
1.738705, 0.5391003, 0.98185, 1, 0, 0.2392157, 1,
1.760398, -0.7029878, 1.169455, 1, 0, 0.2352941, 1,
1.779536, 0.8080161, 0.5104339, 1, 0, 0.227451, 1,
1.818891, -0.2530547, -0.7505333, 1, 0, 0.2235294, 1,
1.822557, 1.173051, 1.352323, 1, 0, 0.2156863, 1,
1.836234, 0.2543152, 2.819882, 1, 0, 0.2117647, 1,
1.842142, 0.2062534, 0.02198768, 1, 0, 0.2039216, 1,
1.875768, 0.9473467, 1.654222, 1, 0, 0.1960784, 1,
1.882088, 0.2623059, 1.03383, 1, 0, 0.1921569, 1,
1.903381, 0.9094926, 1.194376, 1, 0, 0.1843137, 1,
1.928112, 0.2392119, 1.487375, 1, 0, 0.1803922, 1,
1.938277, 1.311454, 1.630461, 1, 0, 0.172549, 1,
1.93967, 0.342145, 0.9795648, 1, 0, 0.1686275, 1,
1.944289, -0.7204979, 0.2868548, 1, 0, 0.1607843, 1,
1.945205, -0.2606226, 3.597718, 1, 0, 0.1568628, 1,
1.956061, -0.7261878, 3.181673, 1, 0, 0.1490196, 1,
2.01757, -0.4456668, 3.391916, 1, 0, 0.145098, 1,
2.044745, 1.46967, 2.70847, 1, 0, 0.1372549, 1,
2.095397, 0.8198919, 2.473086, 1, 0, 0.1333333, 1,
2.098677, -2.007807, 3.08317, 1, 0, 0.1254902, 1,
2.119369, -1.968697, 2.764601, 1, 0, 0.1215686, 1,
2.128601, 2.069397, 1.23563, 1, 0, 0.1137255, 1,
2.134002, 1.50116, 1.408438, 1, 0, 0.1098039, 1,
2.159236, 0.3715142, 1.368907, 1, 0, 0.1019608, 1,
2.177559, -0.85592, 3.370817, 1, 0, 0.09411765, 1,
2.180087, -1.373655, 2.959228, 1, 0, 0.09019608, 1,
2.200581, -0.6763456, 2.734203, 1, 0, 0.08235294, 1,
2.234238, 0.4378536, 1.283658, 1, 0, 0.07843138, 1,
2.270962, 0.1555793, 2.90553, 1, 0, 0.07058824, 1,
2.308795, 0.7771459, -0.1103019, 1, 0, 0.06666667, 1,
2.379821, 0.006237259, -0.3138559, 1, 0, 0.05882353, 1,
2.408869, 2.506709, -0.1478257, 1, 0, 0.05490196, 1,
2.482368, 1.416455, 1.218367, 1, 0, 0.04705882, 1,
2.555447, -1.38796, 2.355081, 1, 0, 0.04313726, 1,
2.740507, -0.6554844, 2.483301, 1, 0, 0.03529412, 1,
2.790912, -1.042721, 1.208172, 1, 0, 0.03137255, 1,
2.994471, 0.4311481, 1.790402, 1, 0, 0.02352941, 1,
3.113268, 1.371435, -0.6070312, 1, 0, 0.01960784, 1,
3.464215, -1.128084, 2.754303, 1, 0, 0.01176471, 1,
3.631979, 0.383867, 1.161958, 1, 0, 0.007843138, 1
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
0.1284672, -5.101759, -6.835058, 0, -0.5, 0.5, 0.5,
0.1284672, -5.101759, -6.835058, 1, -0.5, 0.5, 0.5,
0.1284672, -5.101759, -6.835058, 1, 1.5, 0.5, 0.5,
0.1284672, -5.101759, -6.835058, 0, 1.5, 0.5, 0.5
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
-4.562736, -0.4925132, -6.835058, 0, -0.5, 0.5, 0.5,
-4.562736, -0.4925132, -6.835058, 1, -0.5, 0.5, 0.5,
-4.562736, -0.4925132, -6.835058, 1, 1.5, 0.5, 0.5,
-4.562736, -0.4925132, -6.835058, 0, 1.5, 0.5, 0.5
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
-4.562736, -5.101759, -0.1816659, 0, -0.5, 0.5, 0.5,
-4.562736, -5.101759, -0.1816659, 1, -0.5, 0.5, 0.5,
-4.562736, -5.101759, -0.1816659, 1, 1.5, 0.5, 0.5,
-4.562736, -5.101759, -0.1816659, 0, 1.5, 0.5, 0.5
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
-2, -4.038087, -5.29966,
2, -4.038087, -5.29966,
-2, -4.038087, -5.29966,
-2, -4.215366, -5.555559,
0, -4.038087, -5.29966,
0, -4.215366, -5.555559,
2, -4.038087, -5.29966,
2, -4.215366, -5.555559
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
-2, -4.569923, -6.067358, 0, -0.5, 0.5, 0.5,
-2, -4.569923, -6.067358, 1, -0.5, 0.5, 0.5,
-2, -4.569923, -6.067358, 1, 1.5, 0.5, 0.5,
-2, -4.569923, -6.067358, 0, 1.5, 0.5, 0.5,
0, -4.569923, -6.067358, 0, -0.5, 0.5, 0.5,
0, -4.569923, -6.067358, 1, -0.5, 0.5, 0.5,
0, -4.569923, -6.067358, 1, 1.5, 0.5, 0.5,
0, -4.569923, -6.067358, 0, 1.5, 0.5, 0.5,
2, -4.569923, -6.067358, 0, -0.5, 0.5, 0.5,
2, -4.569923, -6.067358, 1, -0.5, 0.5, 0.5,
2, -4.569923, -6.067358, 1, 1.5, 0.5, 0.5,
2, -4.569923, -6.067358, 0, 1.5, 0.5, 0.5
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
-3.48015, -3, -5.29966,
-3.48015, 2, -5.29966,
-3.48015, -3, -5.29966,
-3.660581, -3, -5.555559,
-3.48015, -2, -5.29966,
-3.660581, -2, -5.555559,
-3.48015, -1, -5.29966,
-3.660581, -1, -5.555559,
-3.48015, 0, -5.29966,
-3.660581, 0, -5.555559,
-3.48015, 1, -5.29966,
-3.660581, 1, -5.555559,
-3.48015, 2, -5.29966,
-3.660581, 2, -5.555559
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
-4.021443, -3, -6.067358, 0, -0.5, 0.5, 0.5,
-4.021443, -3, -6.067358, 1, -0.5, 0.5, 0.5,
-4.021443, -3, -6.067358, 1, 1.5, 0.5, 0.5,
-4.021443, -3, -6.067358, 0, 1.5, 0.5, 0.5,
-4.021443, -2, -6.067358, 0, -0.5, 0.5, 0.5,
-4.021443, -2, -6.067358, 1, -0.5, 0.5, 0.5,
-4.021443, -2, -6.067358, 1, 1.5, 0.5, 0.5,
-4.021443, -2, -6.067358, 0, 1.5, 0.5, 0.5,
-4.021443, -1, -6.067358, 0, -0.5, 0.5, 0.5,
-4.021443, -1, -6.067358, 1, -0.5, 0.5, 0.5,
-4.021443, -1, -6.067358, 1, 1.5, 0.5, 0.5,
-4.021443, -1, -6.067358, 0, 1.5, 0.5, 0.5,
-4.021443, 0, -6.067358, 0, -0.5, 0.5, 0.5,
-4.021443, 0, -6.067358, 1, -0.5, 0.5, 0.5,
-4.021443, 0, -6.067358, 1, 1.5, 0.5, 0.5,
-4.021443, 0, -6.067358, 0, 1.5, 0.5, 0.5,
-4.021443, 1, -6.067358, 0, -0.5, 0.5, 0.5,
-4.021443, 1, -6.067358, 1, -0.5, 0.5, 0.5,
-4.021443, 1, -6.067358, 1, 1.5, 0.5, 0.5,
-4.021443, 1, -6.067358, 0, 1.5, 0.5, 0.5,
-4.021443, 2, -6.067358, 0, -0.5, 0.5, 0.5,
-4.021443, 2, -6.067358, 1, -0.5, 0.5, 0.5,
-4.021443, 2, -6.067358, 1, 1.5, 0.5, 0.5,
-4.021443, 2, -6.067358, 0, 1.5, 0.5, 0.5
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
-3.48015, -4.038087, -4,
-3.48015, -4.038087, 4,
-3.48015, -4.038087, -4,
-3.660581, -4.215366, -4,
-3.48015, -4.038087, -2,
-3.660581, -4.215366, -2,
-3.48015, -4.038087, 0,
-3.660581, -4.215366, 0,
-3.48015, -4.038087, 2,
-3.660581, -4.215366, 2,
-3.48015, -4.038087, 4,
-3.660581, -4.215366, 4
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
-4.021443, -4.569923, -4, 0, -0.5, 0.5, 0.5,
-4.021443, -4.569923, -4, 1, -0.5, 0.5, 0.5,
-4.021443, -4.569923, -4, 1, 1.5, 0.5, 0.5,
-4.021443, -4.569923, -4, 0, 1.5, 0.5, 0.5,
-4.021443, -4.569923, -2, 0, -0.5, 0.5, 0.5,
-4.021443, -4.569923, -2, 1, -0.5, 0.5, 0.5,
-4.021443, -4.569923, -2, 1, 1.5, 0.5, 0.5,
-4.021443, -4.569923, -2, 0, 1.5, 0.5, 0.5,
-4.021443, -4.569923, 0, 0, -0.5, 0.5, 0.5,
-4.021443, -4.569923, 0, 1, -0.5, 0.5, 0.5,
-4.021443, -4.569923, 0, 1, 1.5, 0.5, 0.5,
-4.021443, -4.569923, 0, 0, 1.5, 0.5, 0.5,
-4.021443, -4.569923, 2, 0, -0.5, 0.5, 0.5,
-4.021443, -4.569923, 2, 1, -0.5, 0.5, 0.5,
-4.021443, -4.569923, 2, 1, 1.5, 0.5, 0.5,
-4.021443, -4.569923, 2, 0, 1.5, 0.5, 0.5,
-4.021443, -4.569923, 4, 0, -0.5, 0.5, 0.5,
-4.021443, -4.569923, 4, 1, -0.5, 0.5, 0.5,
-4.021443, -4.569923, 4, 1, 1.5, 0.5, 0.5,
-4.021443, -4.569923, 4, 0, 1.5, 0.5, 0.5
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
-3.48015, -4.038087, -5.29966,
-3.48015, 3.053061, -5.29966,
-3.48015, -4.038087, 4.936328,
-3.48015, 3.053061, 4.936328,
-3.48015, -4.038087, -5.29966,
-3.48015, -4.038087, 4.936328,
-3.48015, 3.053061, -5.29966,
-3.48015, 3.053061, 4.936328,
-3.48015, -4.038087, -5.29966,
3.737085, -4.038087, -5.29966,
-3.48015, -4.038087, 4.936328,
3.737085, -4.038087, 4.936328,
-3.48015, 3.053061, -5.29966,
3.737085, 3.053061, -5.29966,
-3.48015, 3.053061, 4.936328,
3.737085, 3.053061, 4.936328,
3.737085, -4.038087, -5.29966,
3.737085, 3.053061, -5.29966,
3.737085, -4.038087, 4.936328,
3.737085, 3.053061, 4.936328,
3.737085, -4.038087, -5.29966,
3.737085, -4.038087, 4.936328,
3.737085, 3.053061, -5.29966,
3.737085, 3.053061, 4.936328
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
var radius = 7.685394;
var distance = 34.19319;
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
mvMatrix.translate( -0.1284672, 0.4925132, 0.1816659 );
mvMatrix.scale( 1.151355, 1.171827, 0.8118024 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19319);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Prallethrin<-read.table("Prallethrin.xyz")
```

```
## Error in read.table("Prallethrin.xyz"): no lines available in input
```

```r
x<-Prallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
```

```r
y<-Prallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
```

```r
z<-Prallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
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
-3.375045, 0.600293, -0.9588181, 0, 0, 1, 1, 1,
-2.900913, 0.3280796, -1.495828, 1, 0, 0, 1, 1,
-2.800729, -0.3703182, -1.961991, 1, 0, 0, 1, 1,
-2.724296, 0.8084664, -0.1972782, 1, 0, 0, 1, 1,
-2.517942, 0.5541525, -1.184856, 1, 0, 0, 1, 1,
-2.500089, -2.426519, -4.277763, 1, 0, 0, 1, 1,
-2.380105, 0.1357217, -2.862307, 0, 0, 0, 1, 1,
-2.371988, 1.054636, -2.008583, 0, 0, 0, 1, 1,
-2.371919, 1.682679, -1.634196, 0, 0, 0, 1, 1,
-2.357464, -0.9245958, -2.54171, 0, 0, 0, 1, 1,
-2.344495, -0.2270719, -0.9562731, 0, 0, 0, 1, 1,
-2.321218, -0.6294465, -1.35318, 0, 0, 0, 1, 1,
-2.296266, 0.4986485, -0.5585733, 0, 0, 0, 1, 1,
-2.288792, -0.6348719, -0.2458572, 1, 1, 1, 1, 1,
-2.179783, -1.219152, -2.4393, 1, 1, 1, 1, 1,
-2.141563, -2.322127, -3.173444, 1, 1, 1, 1, 1,
-2.13969, 1.15691, -0.7814305, 1, 1, 1, 1, 1,
-2.120059, 0.778485, -2.970263, 1, 1, 1, 1, 1,
-2.112707, 0.1836422, -2.165599, 1, 1, 1, 1, 1,
-2.101084, -0.2838238, -1.719283, 1, 1, 1, 1, 1,
-2.096547, 0.6384206, -1.934235, 1, 1, 1, 1, 1,
-2.07908, 0.4567256, -0.4247158, 1, 1, 1, 1, 1,
-2.059707, -0.7759919, -0.8976865, 1, 1, 1, 1, 1,
-2.048496, -0.7790532, -3.111731, 1, 1, 1, 1, 1,
-2.033778, -0.8565006, -1.327546, 1, 1, 1, 1, 1,
-2.025787, 1.027041, -3.132731, 1, 1, 1, 1, 1,
-2.009118, -0.03717823, -1.135374, 1, 1, 1, 1, 1,
-1.993224, 0.6045603, -1.596521, 1, 1, 1, 1, 1,
-1.944961, -0.2558675, -0.336251, 0, 0, 1, 1, 1,
-1.928027, 0.3532882, -1.416605, 1, 0, 0, 1, 1,
-1.921319, 1.26633, -0.2767632, 1, 0, 0, 1, 1,
-1.917095, 0.1196557, -1.999476, 1, 0, 0, 1, 1,
-1.916965, -0.6341746, -2.427938, 1, 0, 0, 1, 1,
-1.902909, -0.3353332, -1.147748, 1, 0, 0, 1, 1,
-1.895622, 0.6034813, 1.337598, 0, 0, 0, 1, 1,
-1.876275, 0.3623828, -1.616494, 0, 0, 0, 1, 1,
-1.866074, -0.9357505, -1.809198, 0, 0, 0, 1, 1,
-1.832273, 1.194683, -0.7782702, 0, 0, 0, 1, 1,
-1.827057, -0.1707903, -0.9440697, 0, 0, 0, 1, 1,
-1.823292, 0.8099646, -3.427255, 0, 0, 0, 1, 1,
-1.822894, 0.4899964, -3.393717, 0, 0, 0, 1, 1,
-1.819731, -1.503015, -3.036582, 1, 1, 1, 1, 1,
-1.819116, -1.223467, -1.467716, 1, 1, 1, 1, 1,
-1.813297, 0.3005749, -0.9727765, 1, 1, 1, 1, 1,
-1.805406, 1.584134, 0.2771173, 1, 1, 1, 1, 1,
-1.777111, 0.1173201, -2.685418, 1, 1, 1, 1, 1,
-1.765808, 0.2232118, -3.070225, 1, 1, 1, 1, 1,
-1.731863, -0.3368525, -1.117662, 1, 1, 1, 1, 1,
-1.692482, -1.492584, -2.954638, 1, 1, 1, 1, 1,
-1.687834, -0.3808323, -3.21534, 1, 1, 1, 1, 1,
-1.642675, 1.716996, -0.5509443, 1, 1, 1, 1, 1,
-1.636663, 0.02725628, -3.343338, 1, 1, 1, 1, 1,
-1.627548, 0.07432231, -2.030533, 1, 1, 1, 1, 1,
-1.571844, -0.3557344, -3.26154, 1, 1, 1, 1, 1,
-1.570482, 0.7083479, -2.86049, 1, 1, 1, 1, 1,
-1.556844, -2.137053, -3.063611, 1, 1, 1, 1, 1,
-1.551781, 2.053271, 0.642194, 0, 0, 1, 1, 1,
-1.550494, -0.2697301, -2.090659, 1, 0, 0, 1, 1,
-1.548545, 0.592605, -2.413363, 1, 0, 0, 1, 1,
-1.542198, -0.4452314, -3.33664, 1, 0, 0, 1, 1,
-1.539436, 0.2147122, -2.159203, 1, 0, 0, 1, 1,
-1.536645, -0.2320927, -1.575036, 1, 0, 0, 1, 1,
-1.526243, -0.4784731, -1.382221, 0, 0, 0, 1, 1,
-1.516502, -1.235264, -1.343057, 0, 0, 0, 1, 1,
-1.509504, 0.3281594, -2.216465, 0, 0, 0, 1, 1,
-1.509362, -0.1487396, -2.927776, 0, 0, 0, 1, 1,
-1.492077, -0.4136488, -0.721758, 0, 0, 0, 1, 1,
-1.49029, -0.1911663, -0.3961082, 0, 0, 0, 1, 1,
-1.488838, 1.170594, -1.877222, 0, 0, 0, 1, 1,
-1.471029, -0.9791335, -2.276949, 1, 1, 1, 1, 1,
-1.467047, -0.1012876, -0.2550994, 1, 1, 1, 1, 1,
-1.447632, -0.9598851, -2.130192, 1, 1, 1, 1, 1,
-1.445601, 0.2423435, -0.5584928, 1, 1, 1, 1, 1,
-1.437741, -0.3770855, -0.5305435, 1, 1, 1, 1, 1,
-1.437706, -0.532907, -1.873761, 1, 1, 1, 1, 1,
-1.430304, 0.9782544, -1.229359, 1, 1, 1, 1, 1,
-1.428115, 1.094549, -0.02361522, 1, 1, 1, 1, 1,
-1.413735, 0.4687578, -2.564241, 1, 1, 1, 1, 1,
-1.405546, -0.2540889, -1.123118, 1, 1, 1, 1, 1,
-1.401867, 1.738925, -2.678179, 1, 1, 1, 1, 1,
-1.3859, 1.47294, -0.3418168, 1, 1, 1, 1, 1,
-1.374761, 0.7559957, -0.8260961, 1, 1, 1, 1, 1,
-1.371546, 2.354732, -1.180964, 1, 1, 1, 1, 1,
-1.364016, -1.273459, -2.062147, 1, 1, 1, 1, 1,
-1.357324, 1.031868, -0.8236876, 0, 0, 1, 1, 1,
-1.353479, -1.605637, -4.143324, 1, 0, 0, 1, 1,
-1.338732, 0.144289, -1.821659, 1, 0, 0, 1, 1,
-1.33312, 0.1728583, -1.04355, 1, 0, 0, 1, 1,
-1.325467, 0.8854499, -1.276012, 1, 0, 0, 1, 1,
-1.321989, 0.4910615, -1.884252, 1, 0, 0, 1, 1,
-1.314612, 2.328315, -2.180023, 0, 0, 0, 1, 1,
-1.305355, 0.3333527, -0.3146783, 0, 0, 0, 1, 1,
-1.30164, 1.611883, 0.9633741, 0, 0, 0, 1, 1,
-1.29287, 0.02091099, -1.058024, 0, 0, 0, 1, 1,
-1.281452, -1.482724, -3.634012, 0, 0, 0, 1, 1,
-1.255746, 0.2117987, -1.770496, 0, 0, 0, 1, 1,
-1.248494, -0.3133423, -2.228972, 0, 0, 0, 1, 1,
-1.243393, -0.506953, -2.687916, 1, 1, 1, 1, 1,
-1.243092, 0.9385951, -0.3161259, 1, 1, 1, 1, 1,
-1.2405, 0.7033753, -1.143241, 1, 1, 1, 1, 1,
-1.236399, -0.6352814, -1.670982, 1, 1, 1, 1, 1,
-1.229479, -0.2080787, -1.039995, 1, 1, 1, 1, 1,
-1.225899, 0.7288271, 0.8855094, 1, 1, 1, 1, 1,
-1.223661, -2.15412, -2.756279, 1, 1, 1, 1, 1,
-1.221393, 1.344203, -1.731118, 1, 1, 1, 1, 1,
-1.220282, 0.5894811, -0.3302765, 1, 1, 1, 1, 1,
-1.214538, -1.412517, -2.932352, 1, 1, 1, 1, 1,
-1.208773, 0.7157927, -0.6974627, 1, 1, 1, 1, 1,
-1.204019, 1.382952, -0.09341688, 1, 1, 1, 1, 1,
-1.199409, 0.7504447, -1.076911, 1, 1, 1, 1, 1,
-1.179716, -2.177821, -1.201876, 1, 1, 1, 1, 1,
-1.177587, -0.09732889, -1.857245, 1, 1, 1, 1, 1,
-1.174614, 1.460895, -2.79792, 0, 0, 1, 1, 1,
-1.173973, 0.5227575, 0.2024764, 1, 0, 0, 1, 1,
-1.161571, 0.07275546, -1.566071, 1, 0, 0, 1, 1,
-1.155436, -1.190164, -3.804018, 1, 0, 0, 1, 1,
-1.152746, -0.6029847, -2.254807, 1, 0, 0, 1, 1,
-1.148964, 1.184463, -1.668054, 1, 0, 0, 1, 1,
-1.147243, 0.3906815, -1.804366, 0, 0, 0, 1, 1,
-1.140356, -0.0307151, -0.582212, 0, 0, 0, 1, 1,
-1.138421, 1.392049, -1.506102, 0, 0, 0, 1, 1,
-1.133415, -0.9849939, -3.670387, 0, 0, 0, 1, 1,
-1.130024, -1.168001, -2.579374, 0, 0, 0, 1, 1,
-1.120236, -0.02250987, -2.184075, 0, 0, 0, 1, 1,
-1.109813, 0.5543938, -0.7805488, 0, 0, 0, 1, 1,
-1.097849, -1.104605, -2.615528, 1, 1, 1, 1, 1,
-1.095748, -0.2898428, -1.345788, 1, 1, 1, 1, 1,
-1.09303, -0.1525345, -1.635188, 1, 1, 1, 1, 1,
-1.068409, 1.492104, -0.5646621, 1, 1, 1, 1, 1,
-1.0683, 2.949792, -1.520472, 1, 1, 1, 1, 1,
-1.067573, -0.1681083, -2.971079, 1, 1, 1, 1, 1,
-1.066532, 1.147571, -2.609244, 1, 1, 1, 1, 1,
-1.066085, 0.8995619, -1.495762, 1, 1, 1, 1, 1,
-1.063738, 0.2859232, -1.853051, 1, 1, 1, 1, 1,
-1.057625, 0.06075921, -3.891468, 1, 1, 1, 1, 1,
-1.05701, -0.1148635, -2.262439, 1, 1, 1, 1, 1,
-1.054583, 0.3211788, -1.163127, 1, 1, 1, 1, 1,
-1.053652, 0.5674379, -0.8136244, 1, 1, 1, 1, 1,
-1.051943, -0.8275092, -2.325107, 1, 1, 1, 1, 1,
-1.044471, 0.6861683, -0.5423932, 1, 1, 1, 1, 1,
-1.044145, 1.490337, -1.812394, 0, 0, 1, 1, 1,
-1.039723, -0.3181693, -1.874682, 1, 0, 0, 1, 1,
-1.037697, 0.07239319, -1.823735, 1, 0, 0, 1, 1,
-1.029222, 0.7084191, -0.1327413, 1, 0, 0, 1, 1,
-1.025129, 0.8520905, 0.425687, 1, 0, 0, 1, 1,
-1.023776, -1.359667, -1.923468, 1, 0, 0, 1, 1,
-1.019367, 1.090468, -1.755711, 0, 0, 0, 1, 1,
-1.019209, 0.9443025, -1.544564, 0, 0, 0, 1, 1,
-1.019055, -1.190259, -2.536784, 0, 0, 0, 1, 1,
-1.016722, 1.065423, -0.2193792, 0, 0, 0, 1, 1,
-1.016442, -2.785399, -2.779306, 0, 0, 0, 1, 1,
-1.01465, 0.04896517, -2.700754, 0, 0, 0, 1, 1,
-1.01426, -0.81425, -1.554196, 0, 0, 0, 1, 1,
-1.012947, -1.45695, -2.22268, 1, 1, 1, 1, 1,
-1.001531, -0.2277059, -1.344086, 1, 1, 1, 1, 1,
-0.9943929, -0.754572, -2.190154, 1, 1, 1, 1, 1,
-0.9937096, 1.288283, -0.3819671, 1, 1, 1, 1, 1,
-0.9934031, 1.079458, -0.3301818, 1, 1, 1, 1, 1,
-0.9856175, -0.07326581, -1.023583, 1, 1, 1, 1, 1,
-0.9831026, -0.5584842, -2.433211, 1, 1, 1, 1, 1,
-0.9689378, -0.1368496, -0.8151011, 1, 1, 1, 1, 1,
-0.9673412, -0.2437809, -1.911385, 1, 1, 1, 1, 1,
-0.966782, -0.07916687, -2.265832, 1, 1, 1, 1, 1,
-0.9667306, 0.1623312, -1.776901, 1, 1, 1, 1, 1,
-0.9639692, -2.255065, -2.090864, 1, 1, 1, 1, 1,
-0.9610715, -2.207484, -4.944158, 1, 1, 1, 1, 1,
-0.9498692, -0.2933544, -0.4082786, 1, 1, 1, 1, 1,
-0.946222, -0.990524, -0.8599716, 1, 1, 1, 1, 1,
-0.9428358, 0.4975643, 0.4439704, 0, 0, 1, 1, 1,
-0.9410665, 0.4290216, -0.02781412, 1, 0, 0, 1, 1,
-0.9318525, 1.104206, -0.2518651, 1, 0, 0, 1, 1,
-0.9316065, 1.356822, -0.1760519, 1, 0, 0, 1, 1,
-0.9279292, 0.5262492, -1.561704, 1, 0, 0, 1, 1,
-0.9207789, 0.9341284, -0.6632503, 1, 0, 0, 1, 1,
-0.9149889, 0.1302972, -2.66012, 0, 0, 0, 1, 1,
-0.9143906, -0.1665343, -2.885929, 0, 0, 0, 1, 1,
-0.9055231, 0.1968365, -1.885974, 0, 0, 0, 1, 1,
-0.8995976, -1.364167, -2.518731, 0, 0, 0, 1, 1,
-0.8925018, -0.2745928, -1.609825, 0, 0, 0, 1, 1,
-0.8921612, 0.7893584, -2.013463, 0, 0, 0, 1, 1,
-0.888136, 0.6915848, -2.618816, 0, 0, 0, 1, 1,
-0.8874513, 1.256201, -0.7690578, 1, 1, 1, 1, 1,
-0.887212, 1.435698, -0.778505, 1, 1, 1, 1, 1,
-0.8795716, -0.2864446, -1.792491, 1, 1, 1, 1, 1,
-0.8794535, 0.5711796, -0.8195648, 1, 1, 1, 1, 1,
-0.8761677, 0.6367555, -0.89961, 1, 1, 1, 1, 1,
-0.8713933, -1.490252, -1.346084, 1, 1, 1, 1, 1,
-0.8604854, -1.121987, -2.975687, 1, 1, 1, 1, 1,
-0.8578876, -1.09666, -2.948337, 1, 1, 1, 1, 1,
-0.8543956, -2.713917, -2.404617, 1, 1, 1, 1, 1,
-0.8484135, -1.144941, -3.482695, 1, 1, 1, 1, 1,
-0.8465268, 0.1104312, -3.01934, 1, 1, 1, 1, 1,
-0.8417341, 1.773827, -1.432348, 1, 1, 1, 1, 1,
-0.8400463, 0.1496708, -1.923179, 1, 1, 1, 1, 1,
-0.8390337, -0.02269506, -1.212261, 1, 1, 1, 1, 1,
-0.8331775, -0.4028096, -1.656562, 1, 1, 1, 1, 1,
-0.832653, 0.07202342, -2.208412, 0, 0, 1, 1, 1,
-0.8223356, 0.8706127, 0.5464236, 1, 0, 0, 1, 1,
-0.8215784, 1.235489, -1.600283, 1, 0, 0, 1, 1,
-0.8174834, 0.2136153, -1.554153, 1, 0, 0, 1, 1,
-0.8135943, 0.7897374, -0.09683722, 1, 0, 0, 1, 1,
-0.8115932, -1.536005, -3.413327, 1, 0, 0, 1, 1,
-0.8090738, 0.7626114, 0.3234475, 0, 0, 0, 1, 1,
-0.8046697, -1.474524, -1.980289, 0, 0, 0, 1, 1,
-0.8018507, -1.373091, -2.555731, 0, 0, 0, 1, 1,
-0.7997857, -0.2324993, -3.497418, 0, 0, 0, 1, 1,
-0.7969396, -0.7031498, -1.564584, 0, 0, 0, 1, 1,
-0.7913051, 0.2502757, -1.490614, 0, 0, 0, 1, 1,
-0.7897654, -0.3737324, -1.394582, 0, 0, 0, 1, 1,
-0.7881152, -1.320819, -2.416056, 1, 1, 1, 1, 1,
-0.7847384, 0.5124618, -1.367552, 1, 1, 1, 1, 1,
-0.7818195, 1.509383, -2.04677, 1, 1, 1, 1, 1,
-0.7776025, 0.3017656, -0.9462758, 1, 1, 1, 1, 1,
-0.7735209, -0.09062014, -1.560222, 1, 1, 1, 1, 1,
-0.7717153, 0.1048068, -2.162115, 1, 1, 1, 1, 1,
-0.7712427, -0.4325013, -1.071323, 1, 1, 1, 1, 1,
-0.7703131, 0.5093014, -0.844541, 1, 1, 1, 1, 1,
-0.7686412, -2.271094, -3.554335, 1, 1, 1, 1, 1,
-0.7684395, 0.01201047, -0.191762, 1, 1, 1, 1, 1,
-0.7669339, -0.6005102, -3.142439, 1, 1, 1, 1, 1,
-0.7667739, 0.7421226, 0.431043, 1, 1, 1, 1, 1,
-0.765186, 0.514836, -2.537133, 1, 1, 1, 1, 1,
-0.7632581, -0.1920449, -1.974185, 1, 1, 1, 1, 1,
-0.7617105, 1.70754, 0.4651544, 1, 1, 1, 1, 1,
-0.7555913, 0.513891, -0.6652289, 0, 0, 1, 1, 1,
-0.7543057, 1.268182, -1.966177, 1, 0, 0, 1, 1,
-0.7509745, 0.7393396, -0.1919104, 1, 0, 0, 1, 1,
-0.7508557, 0.9634184, -1.177443, 1, 0, 0, 1, 1,
-0.745463, -0.8989776, -2.393141, 1, 0, 0, 1, 1,
-0.7420096, -0.6590571, -2.504407, 1, 0, 0, 1, 1,
-0.7374427, 1.167433, 0.8016002, 0, 0, 0, 1, 1,
-0.7349746, 0.2621925, -1.361802, 0, 0, 0, 1, 1,
-0.7335554, 1.174052, -1.26949, 0, 0, 0, 1, 1,
-0.7319611, -1.135117, -2.778101, 0, 0, 0, 1, 1,
-0.7315238, 0.2573281, -1.26512, 0, 0, 0, 1, 1,
-0.7289472, -0.2764925, -2.689554, 0, 0, 0, 1, 1,
-0.7278671, 0.3239275, -0.7904151, 0, 0, 0, 1, 1,
-0.7274656, -0.08604369, -2.775804, 1, 1, 1, 1, 1,
-0.7240947, -0.7545047, -4.388939, 1, 1, 1, 1, 1,
-0.7150857, 2.227009, -0.6218719, 1, 1, 1, 1, 1,
-0.7119278, 2.376733, -0.4197348, 1, 1, 1, 1, 1,
-0.7098596, -0.3818616, -3.539599, 1, 1, 1, 1, 1,
-0.7004389, -0.06764722, -1.132582, 1, 1, 1, 1, 1,
-0.700379, 0.001263717, -1.740659, 1, 1, 1, 1, 1,
-0.6960162, 0.7574216, 2.206038, 1, 1, 1, 1, 1,
-0.6935541, 0.5463948, -2.495838, 1, 1, 1, 1, 1,
-0.6919962, 0.4965933, -1.994523, 1, 1, 1, 1, 1,
-0.6903903, 2.004092, 2.342698, 1, 1, 1, 1, 1,
-0.6902089, -2.215509, -2.303169, 1, 1, 1, 1, 1,
-0.6880663, -0.1347706, -2.205982, 1, 1, 1, 1, 1,
-0.6878424, -0.7146155, -3.468064, 1, 1, 1, 1, 1,
-0.6842212, -0.9879075, -1.883024, 1, 1, 1, 1, 1,
-0.6816725, -1.055696, -1.52335, 0, 0, 1, 1, 1,
-0.6788422, 0.1399729, -0.1988893, 1, 0, 0, 1, 1,
-0.6765423, -0.3293575, -1.089807, 1, 0, 0, 1, 1,
-0.6733853, 0.8279917, 0.1803207, 1, 0, 0, 1, 1,
-0.6728092, 0.1159553, -2.211429, 1, 0, 0, 1, 1,
-0.6681075, -2.353923, -1.917849, 1, 0, 0, 1, 1,
-0.6654943, -0.6171435, -2.645203, 0, 0, 0, 1, 1,
-0.6650752, 0.1544583, -2.411685, 0, 0, 0, 1, 1,
-0.6625825, -1.211524, -2.697006, 0, 0, 0, 1, 1,
-0.6583914, -0.4042954, -2.467969, 0, 0, 0, 1, 1,
-0.6561099, 0.7322736, -0.3471926, 0, 0, 0, 1, 1,
-0.6554713, 0.4029561, 2.74153, 0, 0, 0, 1, 1,
-0.6512002, 1.856912, -0.9684363, 0, 0, 0, 1, 1,
-0.636406, -0.6474437, -3.806995, 1, 1, 1, 1, 1,
-0.6324489, 0.3712465, -2.057366, 1, 1, 1, 1, 1,
-0.6300161, -0.2596151, -2.805137, 1, 1, 1, 1, 1,
-0.6294265, 1.290509, -0.8199576, 1, 1, 1, 1, 1,
-0.6272531, -0.5431401, -2.163109, 1, 1, 1, 1, 1,
-0.6176134, -0.7341142, -2.575061, 1, 1, 1, 1, 1,
-0.6159308, 0.814272, -1.510482, 1, 1, 1, 1, 1,
-0.6141471, -0.6929011, -1.492557, 1, 1, 1, 1, 1,
-0.6067, -0.3532401, -1.643334, 1, 1, 1, 1, 1,
-0.6011926, 0.989461, -0.2327274, 1, 1, 1, 1, 1,
-0.5974426, 1.317308, -1.02336, 1, 1, 1, 1, 1,
-0.5889111, -1.544732, -2.676457, 1, 1, 1, 1, 1,
-0.5872501, 0.3052831, 0.3185475, 1, 1, 1, 1, 1,
-0.5864932, -1.126664, -1.821684, 1, 1, 1, 1, 1,
-0.5864401, -0.1748743, -0.3387153, 1, 1, 1, 1, 1,
-0.5843276, 0.6199985, -0.07518245, 0, 0, 1, 1, 1,
-0.5827574, 1.333594, -0.8569778, 1, 0, 0, 1, 1,
-0.5723011, 1.405876, -0.3545582, 1, 0, 0, 1, 1,
-0.5719028, -1.700932, -0.9685397, 1, 0, 0, 1, 1,
-0.5678257, -0.778312, -0.5398555, 1, 0, 0, 1, 1,
-0.5668423, -0.09920707, -3.11884, 1, 0, 0, 1, 1,
-0.5659094, -0.2359169, -3.083598, 0, 0, 0, 1, 1,
-0.5609146, -0.8195711, -1.165738, 0, 0, 0, 1, 1,
-0.5529496, 1.965147, -1.368608, 0, 0, 0, 1, 1,
-0.5497475, -1.57775, -1.565149, 0, 0, 0, 1, 1,
-0.5488078, 0.3860124, -1.933202, 0, 0, 0, 1, 1,
-0.5418618, 0.6556013, -0.5779684, 0, 0, 0, 1, 1,
-0.5408903, -0.04035338, -0.6809457, 0, 0, 0, 1, 1,
-0.5373849, -0.3753912, -0.1078509, 1, 1, 1, 1, 1,
-0.5368053, -1.606498, -1.857946, 1, 1, 1, 1, 1,
-0.5346931, 0.6649464, -0.2047837, 1, 1, 1, 1, 1,
-0.5345721, -0.8810804, -2.444791, 1, 1, 1, 1, 1,
-0.5343388, 0.1628871, -0.2598699, 1, 1, 1, 1, 1,
-0.5334888, -0.04145494, -0.2164895, 1, 1, 1, 1, 1,
-0.531635, 0.3490115, 0.09419176, 1, 1, 1, 1, 1,
-0.5191213, -0.6007645, -2.213947, 1, 1, 1, 1, 1,
-0.5178168, -0.8786207, -2.373088, 1, 1, 1, 1, 1,
-0.5169023, -0.09479939, -2.138733, 1, 1, 1, 1, 1,
-0.5164567, 1.045105, -1.07094, 1, 1, 1, 1, 1,
-0.514082, -0.9026505, -1.604382, 1, 1, 1, 1, 1,
-0.5133767, 0.7795238, 0.7560169, 1, 1, 1, 1, 1,
-0.5088258, -1.909251, -3.768135, 1, 1, 1, 1, 1,
-0.5085365, -0.771144, -4.380639, 1, 1, 1, 1, 1,
-0.5050136, -0.2710214, -2.762182, 0, 0, 1, 1, 1,
-0.494995, 1.065125, 2.064512, 1, 0, 0, 1, 1,
-0.4934803, -0.9774765, -3.253813, 1, 0, 0, 1, 1,
-0.4906774, -1.554823, -2.606362, 1, 0, 0, 1, 1,
-0.4903849, 0.9859075, 0.08804633, 1, 0, 0, 1, 1,
-0.4892411, -0.2860945, -2.668821, 1, 0, 0, 1, 1,
-0.4807993, -0.9899169, -2.422127, 0, 0, 0, 1, 1,
-0.480596, -1.083593, -2.285356, 0, 0, 0, 1, 1,
-0.480279, -0.738184, -1.574756, 0, 0, 0, 1, 1,
-0.4800978, 0.3285443, -0.9684588, 0, 0, 0, 1, 1,
-0.479896, 0.5995533, -1.92365, 0, 0, 0, 1, 1,
-0.4779166, 1.175885, -1.375345, 0, 0, 0, 1, 1,
-0.4707887, 0.08522619, -1.306375, 0, 0, 0, 1, 1,
-0.4634502, 0.1784464, 0.2958991, 1, 1, 1, 1, 1,
-0.4610078, -1.501877, -4.110891, 1, 1, 1, 1, 1,
-0.4593848, 0.4259292, 1.143636, 1, 1, 1, 1, 1,
-0.459364, 0.3845474, -2.137575, 1, 1, 1, 1, 1,
-0.4565436, 0.859769, -0.1339672, 1, 1, 1, 1, 1,
-0.4557001, -1.163222, -3.742795, 1, 1, 1, 1, 1,
-0.4515673, 0.8037471, -0.6291618, 1, 1, 1, 1, 1,
-0.4510251, -0.1600845, -1.512442, 1, 1, 1, 1, 1,
-0.4476073, -2.048206, -2.032251, 1, 1, 1, 1, 1,
-0.4471295, -1.007298, -3.082024, 1, 1, 1, 1, 1,
-0.4453305, -0.756486, -0.8800727, 1, 1, 1, 1, 1,
-0.445188, 1.202772, -1.150174, 1, 1, 1, 1, 1,
-0.4426985, -1.129833, -1.971806, 1, 1, 1, 1, 1,
-0.4403932, -0.3210431, -2.801726, 1, 1, 1, 1, 1,
-0.4367096, -0.2763418, -3.452299, 1, 1, 1, 1, 1,
-0.4359618, 1.364631, 0.3144821, 0, 0, 1, 1, 1,
-0.4338068, -0.4409988, -1.687699, 1, 0, 0, 1, 1,
-0.4326326, 0.802236, -0.32234, 1, 0, 0, 1, 1,
-0.4285316, -1.249262, -1.348733, 1, 0, 0, 1, 1,
-0.4281141, -2.23669, -3.529019, 1, 0, 0, 1, 1,
-0.4258183, 0.4189473, -2.127638, 1, 0, 0, 1, 1,
-0.4249017, 0.4447186, -1.908149, 0, 0, 0, 1, 1,
-0.4230816, -0.7880268, -1.244469, 0, 0, 0, 1, 1,
-0.4218374, -2.919084, -4.764608, 0, 0, 0, 1, 1,
-0.4153778, -2.311406, -3.484006, 0, 0, 0, 1, 1,
-0.4079176, 1.079944, -0.1578327, 0, 0, 0, 1, 1,
-0.4068952, -1.253063, -4.771757, 0, 0, 0, 1, 1,
-0.4058964, 1.307844, 0.2098921, 0, 0, 0, 1, 1,
-0.398607, -0.5077979, -2.450758, 1, 1, 1, 1, 1,
-0.3968603, 0.235861, -1.70644, 1, 1, 1, 1, 1,
-0.3928273, 0.04208793, 0.2528956, 1, 1, 1, 1, 1,
-0.390594, -1.549473, -3.221454, 1, 1, 1, 1, 1,
-0.3819869, 2.312566, -0.7764442, 1, 1, 1, 1, 1,
-0.3807182, 0.5832283, -1.537565, 1, 1, 1, 1, 1,
-0.3806296, 0.5452429, -0.4848357, 1, 1, 1, 1, 1,
-0.3762574, 0.248207, 0.09813936, 1, 1, 1, 1, 1,
-0.3734007, 0.6713233, -0.3451632, 1, 1, 1, 1, 1,
-0.3707942, 1.646009, -0.5653979, 1, 1, 1, 1, 1,
-0.370022, 2.102072, -1.186484, 1, 1, 1, 1, 1,
-0.3683541, 0.7581196, 0.610917, 1, 1, 1, 1, 1,
-0.3658052, 0.08880404, 0.9542797, 1, 1, 1, 1, 1,
-0.3577549, 1.155696, -1.202505, 1, 1, 1, 1, 1,
-0.3547283, 0.1675588, -0.9993632, 1, 1, 1, 1, 1,
-0.3503728, -1.063364, -3.618754, 0, 0, 1, 1, 1,
-0.3469363, 1.309467, -1.009386, 1, 0, 0, 1, 1,
-0.3449061, 0.452934, -0.02937844, 1, 0, 0, 1, 1,
-0.3383332, 1.04566, 0.4241323, 1, 0, 0, 1, 1,
-0.336524, 0.3675225, -0.2174034, 1, 0, 0, 1, 1,
-0.3353432, 0.7171533, 0.5487041, 1, 0, 0, 1, 1,
-0.3345801, -0.516547, -2.497198, 0, 0, 0, 1, 1,
-0.3315874, 1.252675, -0.8329618, 0, 0, 0, 1, 1,
-0.3280586, 1.508454, -0.9973459, 0, 0, 0, 1, 1,
-0.3275821, -0.5276374, -1.277356, 0, 0, 0, 1, 1,
-0.3174883, 1.840495, -0.4561613, 0, 0, 0, 1, 1,
-0.3169044, 1.508694, -1.705237, 0, 0, 0, 1, 1,
-0.3113587, -0.2001361, -2.209688, 0, 0, 0, 1, 1,
-0.3088912, -0.9022682, -3.34851, 1, 1, 1, 1, 1,
-0.3050466, 0.4574665, -0.6494744, 1, 1, 1, 1, 1,
-0.2981967, 0.6988048, -0.4409637, 1, 1, 1, 1, 1,
-0.2937563, -2.365561, -3.067185, 1, 1, 1, 1, 1,
-0.2933235, -1.359147, -1.655886, 1, 1, 1, 1, 1,
-0.2926596, 0.9884359, -0.6025739, 1, 1, 1, 1, 1,
-0.2884995, -1.162725, -3.084278, 1, 1, 1, 1, 1,
-0.2851067, -0.1763017, -4.970375, 1, 1, 1, 1, 1,
-0.284928, -0.3541375, -2.326693, 1, 1, 1, 1, 1,
-0.2835332, -0.0179614, -1.602774, 1, 1, 1, 1, 1,
-0.2816315, 1.878404, -1.545667, 1, 1, 1, 1, 1,
-0.2794732, 0.707111, -1.115261, 1, 1, 1, 1, 1,
-0.2780656, -0.2437206, -2.190606, 1, 1, 1, 1, 1,
-0.275372, 2.527413, -0.9945541, 1, 1, 1, 1, 1,
-0.2739109, 0.5173358, -2.424449, 1, 1, 1, 1, 1,
-0.2700663, -1.354913, -3.688595, 0, 0, 1, 1, 1,
-0.2654755, 0.3337368, -0.8893954, 1, 0, 0, 1, 1,
-0.2616191, -0.2681599, -2.949757, 1, 0, 0, 1, 1,
-0.2570287, 0.2987192, 1.111562, 1, 0, 0, 1, 1,
-0.2563132, -1.400795, -3.884245, 1, 0, 0, 1, 1,
-0.2559952, 0.2361007, -0.9185813, 1, 0, 0, 1, 1,
-0.2485601, 0.4860234, -0.4307683, 0, 0, 0, 1, 1,
-0.2472964, 0.111577, -1.484791, 0, 0, 0, 1, 1,
-0.2469535, -0.8033583, -2.957379, 0, 0, 0, 1, 1,
-0.2462084, -1.664481, -3.555226, 0, 0, 0, 1, 1,
-0.2459292, 2.42152, 0.6604735, 0, 0, 0, 1, 1,
-0.2447749, -0.4132399, -1.967785, 0, 0, 0, 1, 1,
-0.2435111, 1.377048, 1.110843, 0, 0, 0, 1, 1,
-0.2415428, 0.004358372, -3.436989, 1, 1, 1, 1, 1,
-0.2412075, 0.6301883, 1.041431, 1, 1, 1, 1, 1,
-0.2394935, -0.5561681, -3.367068, 1, 1, 1, 1, 1,
-0.2372646, -0.4702656, -3.676879, 1, 1, 1, 1, 1,
-0.2329596, 0.2816114, -2.964349, 1, 1, 1, 1, 1,
-0.22989, -0.7920921, -2.745934, 1, 1, 1, 1, 1,
-0.2230883, -1.354028, -1.515377, 1, 1, 1, 1, 1,
-0.2230159, 0.8454281, -0.6205458, 1, 1, 1, 1, 1,
-0.2141788, 0.09574989, -0.6454057, 1, 1, 1, 1, 1,
-0.2136327, 1.879804, 0.576304, 1, 1, 1, 1, 1,
-0.213401, 1.068978, -0.8520869, 1, 1, 1, 1, 1,
-0.2073938, 0.8561791, 1.321925, 1, 1, 1, 1, 1,
-0.2041645, -0.9575931, -1.272797, 1, 1, 1, 1, 1,
-0.200626, -0.06527207, -2.202271, 1, 1, 1, 1, 1,
-0.1974004, -1.26173, -4.126734, 1, 1, 1, 1, 1,
-0.1963955, -0.4588194, -2.087335, 0, 0, 1, 1, 1,
-0.1943857, -0.4187742, -2.002415, 1, 0, 0, 1, 1,
-0.1931334, 0.4485216, -1.452417, 1, 0, 0, 1, 1,
-0.1894325, -0.003277034, -1.143185, 1, 0, 0, 1, 1,
-0.1859214, 0.9838984, -0.6440635, 1, 0, 0, 1, 1,
-0.1850162, 0.6582496, 1.415527, 1, 0, 0, 1, 1,
-0.1809094, -0.2283892, -2.065276, 0, 0, 0, 1, 1,
-0.179073, -1.584677, -5.150592, 0, 0, 0, 1, 1,
-0.176758, 0.6714043, -0.8544699, 0, 0, 0, 1, 1,
-0.1757172, -0.8935977, -2.596563, 0, 0, 0, 1, 1,
-0.1730454, -1.050826, -1.040832, 0, 0, 0, 1, 1,
-0.1723996, 0.1189652, -2.259066, 0, 0, 0, 1, 1,
-0.1648244, 0.4235539, -0.9903555, 0, 0, 0, 1, 1,
-0.1588619, 0.1528738, -1.21251, 1, 1, 1, 1, 1,
-0.1567576, 0.3870736, 0.4466934, 1, 1, 1, 1, 1,
-0.1561867, -0.5929701, -3.060518, 1, 1, 1, 1, 1,
-0.1559725, 0.6544494, -0.541803, 1, 1, 1, 1, 1,
-0.1529146, -1.78794, -3.681246, 1, 1, 1, 1, 1,
-0.1508068, 0.827138, 0.2647706, 1, 1, 1, 1, 1,
-0.1487306, -0.8227283, -1.563603, 1, 1, 1, 1, 1,
-0.1464183, -0.7858173, -3.725288, 1, 1, 1, 1, 1,
-0.1443922, -0.2834753, -3.173765, 1, 1, 1, 1, 1,
-0.141289, -0.6930808, -3.074324, 1, 1, 1, 1, 1,
-0.1374933, 1.683452, -2.555311, 1, 1, 1, 1, 1,
-0.134695, -1.53082, -2.952537, 1, 1, 1, 1, 1,
-0.1337182, -0.663918, -3.139106, 1, 1, 1, 1, 1,
-0.1326875, 0.3366387, 0.1429766, 1, 1, 1, 1, 1,
-0.1280366, -0.5216511, -1.047783, 1, 1, 1, 1, 1,
-0.1255026, -0.2149005, -3.297645, 0, 0, 1, 1, 1,
-0.1240141, 0.3841629, -1.356857, 1, 0, 0, 1, 1,
-0.119942, -1.04597, -2.651565, 1, 0, 0, 1, 1,
-0.1190118, 0.4718943, -0.6513532, 1, 0, 0, 1, 1,
-0.1179402, -1.500954, -3.093473, 1, 0, 0, 1, 1,
-0.1176708, 0.8300708, -1.520149, 1, 0, 0, 1, 1,
-0.1137011, 0.3908716, -0.90545, 0, 0, 0, 1, 1,
-0.1106159, 0.5565602, -0.1532547, 0, 0, 0, 1, 1,
-0.1056981, 0.7936193, -0.216957, 0, 0, 0, 1, 1,
-0.105111, 0.1493118, 1.16625, 0, 0, 0, 1, 1,
-0.1015625, -0.5631625, -2.754952, 0, 0, 0, 1, 1,
-0.1004496, -0.01211254, -1.701337, 0, 0, 0, 1, 1,
-0.09948978, 0.6817181, -0.5748534, 0, 0, 0, 1, 1,
-0.09353516, -1.176384, -4.129236, 1, 1, 1, 1, 1,
-0.09285964, -0.04567246, -2.850816, 1, 1, 1, 1, 1,
-0.09104565, -1.666494, -3.093773, 1, 1, 1, 1, 1,
-0.08410929, 0.6859301, 0.1187114, 1, 1, 1, 1, 1,
-0.08201011, 1.426293, -1.029508, 1, 1, 1, 1, 1,
-0.07829729, 1.378384, 2.104913, 1, 1, 1, 1, 1,
-0.06885568, -0.1336094, -2.268923, 1, 1, 1, 1, 1,
-0.06182455, 0.5117445, -1.07627, 1, 1, 1, 1, 1,
-0.05984248, -2.044568, -3.880093, 1, 1, 1, 1, 1,
-0.05623588, -0.4165765, -3.953644, 1, 1, 1, 1, 1,
-0.05327028, -0.2489481, -2.227499, 1, 1, 1, 1, 1,
-0.0493865, -1.901537, -2.612142, 1, 1, 1, 1, 1,
-0.04864196, 2.121888, 1.266766, 1, 1, 1, 1, 1,
-0.04758828, -1.435105, -2.662865, 1, 1, 1, 1, 1,
-0.04474201, -0.6363209, -3.500716, 1, 1, 1, 1, 1,
-0.04285657, 1.759786, -0.3075598, 0, 0, 1, 1, 1,
-0.04176917, 0.7982479, -0.05083625, 1, 0, 0, 1, 1,
-0.0406307, 0.3413347, -2.470547, 1, 0, 0, 1, 1,
-0.03742979, -0.5845929, -3.51773, 1, 0, 0, 1, 1,
-0.03064952, 1.437516, 0.5823005, 1, 0, 0, 1, 1,
-0.02898234, 0.5036227, 1.257092, 1, 0, 0, 1, 1,
-0.0275237, -1.574595, -1.848786, 0, 0, 0, 1, 1,
-0.02367857, 1.380959, -0.5023494, 0, 0, 0, 1, 1,
-0.02201328, 1.678876, 0.1527141, 0, 0, 0, 1, 1,
-0.01979861, 0.1648959, -0.9510527, 0, 0, 0, 1, 1,
-0.01433156, -0.6151788, -3.135032, 0, 0, 0, 1, 1,
-0.01414982, -1.749606, -4.021414, 0, 0, 0, 1, 1,
-0.01180696, 0.2702973, 0.05581563, 0, 0, 0, 1, 1,
-0.01126529, -2.135145, -4.570997, 1, 1, 1, 1, 1,
-0.01089792, -0.2930365, -3.42844, 1, 1, 1, 1, 1,
-0.009977944, 1.563239, 1.306632, 1, 1, 1, 1, 1,
-0.005454301, 0.06996884, 0.3785165, 1, 1, 1, 1, 1,
-0.004150643, 0.1480036, 1.835829, 1, 1, 1, 1, 1,
-0.001906813, -0.1871935, -1.899991, 1, 1, 1, 1, 1,
-0.001806495, 0.8742002, 0.4839772, 1, 1, 1, 1, 1,
0.001204951, 1.444347, 0.5689242, 1, 1, 1, 1, 1,
0.001300683, 1.433243, 0.4534387, 1, 1, 1, 1, 1,
0.005652856, 0.6512505, -0.1047792, 1, 1, 1, 1, 1,
0.009824242, 0.7573821, -0.9157386, 1, 1, 1, 1, 1,
0.01086851, 0.1914472, -0.9889354, 1, 1, 1, 1, 1,
0.02226754, -0.4434705, 3.711447, 1, 1, 1, 1, 1,
0.02499014, 1.247691, -0.8096616, 1, 1, 1, 1, 1,
0.02608635, -1.315043, 3.207884, 1, 1, 1, 1, 1,
0.03197234, 0.5877291, 1.192573, 0, 0, 1, 1, 1,
0.03476932, -1.311881, 3.465384, 1, 0, 0, 1, 1,
0.03569506, -0.947309, 2.988924, 1, 0, 0, 1, 1,
0.03701237, -1.037451, 2.623706, 1, 0, 0, 1, 1,
0.03931033, 1.176815, -0.2517975, 1, 0, 0, 1, 1,
0.04196687, -0.2473955, 2.689424, 1, 0, 0, 1, 1,
0.04335908, -1.982601, 4.722334, 0, 0, 0, 1, 1,
0.04352991, 1.523032, 0.3474981, 0, 0, 0, 1, 1,
0.04542173, 0.2411174, -1.393304, 0, 0, 0, 1, 1,
0.04582315, -0.3953334, 1.767945, 0, 0, 0, 1, 1,
0.04698834, 0.01710987, -0.2622336, 0, 0, 0, 1, 1,
0.05046832, -0.6473564, 2.622236, 0, 0, 0, 1, 1,
0.05260205, 1.345949, 0.3985028, 0, 0, 0, 1, 1,
0.05407058, 0.4116993, -0.6238546, 1, 1, 1, 1, 1,
0.06102126, 0.7826083, 0.9616244, 1, 1, 1, 1, 1,
0.06395005, 1.445894, 0.440482, 1, 1, 1, 1, 1,
0.06438299, -0.5849643, 3.784651, 1, 1, 1, 1, 1,
0.06579565, -1.783025, 3.285716, 1, 1, 1, 1, 1,
0.06642073, 1.235001, -0.60649, 1, 1, 1, 1, 1,
0.07434925, -0.3658808, 2.903877, 1, 1, 1, 1, 1,
0.07538669, 0.865186, -0.268924, 1, 1, 1, 1, 1,
0.07803719, -0.006245086, -0.4623765, 1, 1, 1, 1, 1,
0.07812865, -1.05775, 2.140517, 1, 1, 1, 1, 1,
0.07990832, 2.159015, -0.3427839, 1, 1, 1, 1, 1,
0.08090237, 0.7601326, -0.4248528, 1, 1, 1, 1, 1,
0.08300816, 1.098491, -0.4800434, 1, 1, 1, 1, 1,
0.08388071, 0.8149649, 1.780221, 1, 1, 1, 1, 1,
0.08641582, -0.8157709, 4.407074, 1, 1, 1, 1, 1,
0.08655462, 0.1540095, -1.261335, 0, 0, 1, 1, 1,
0.08795424, 1.845638, 0.8669781, 1, 0, 0, 1, 1,
0.08888683, 0.5801758, 1.576227, 1, 0, 0, 1, 1,
0.08894603, -1.326427, 1.862464, 1, 0, 0, 1, 1,
0.09101482, -0.9673941, 2.073232, 1, 0, 0, 1, 1,
0.09348093, 0.816094, 0.06627152, 1, 0, 0, 1, 1,
0.09845992, 1.564582, 2.32266, 0, 0, 0, 1, 1,
0.09878058, -1.383742, 3.41854, 0, 0, 0, 1, 1,
0.09904125, -0.4659393, 3.367124, 0, 0, 0, 1, 1,
0.1054511, -0.2777185, 2.688224, 0, 0, 0, 1, 1,
0.1099832, 1.223321, -0.01614929, 0, 0, 0, 1, 1,
0.1102425, 0.9052345, -0.6489033, 0, 0, 0, 1, 1,
0.1139357, -0.794696, 0.9830154, 0, 0, 0, 1, 1,
0.1145429, -1.13009, 4.299056, 1, 1, 1, 1, 1,
0.1176435, 1.455052, -0.1294816, 1, 1, 1, 1, 1,
0.1186602, 1.984651, -0.5875555, 1, 1, 1, 1, 1,
0.1189871, 0.4524947, 1.55517, 1, 1, 1, 1, 1,
0.1224416, -1.527702, 2.662318, 1, 1, 1, 1, 1,
0.1241312, 0.1863771, 0.06935637, 1, 1, 1, 1, 1,
0.1263545, -2.119488, 2.943106, 1, 1, 1, 1, 1,
0.12637, 1.329118, -1.646139, 1, 1, 1, 1, 1,
0.1323864, -1.24534, 2.105274, 1, 1, 1, 1, 1,
0.1356702, -0.7939942, 3.240479, 1, 1, 1, 1, 1,
0.1382131, 0.1648973, 2.119365, 1, 1, 1, 1, 1,
0.1403605, 2.183145, 2.084934, 1, 1, 1, 1, 1,
0.1430509, -0.5778226, 3.589932, 1, 1, 1, 1, 1,
0.1444723, 0.5896224, 1.047588, 1, 1, 1, 1, 1,
0.150815, -0.3787439, 0.9984591, 1, 1, 1, 1, 1,
0.1533757, 0.2670325, -0.791078, 0, 0, 1, 1, 1,
0.1549532, 0.4130552, 1.214917, 1, 0, 0, 1, 1,
0.1551232, -0.8297936, 4.327635, 1, 0, 0, 1, 1,
0.1590661, -0.69018, 1.762367, 1, 0, 0, 1, 1,
0.1605151, 0.09025424, 0.3166288, 1, 0, 0, 1, 1,
0.1637558, -1.76914, 3.177978, 1, 0, 0, 1, 1,
0.1656336, 1.667988, -0.9126645, 0, 0, 0, 1, 1,
0.169202, -1.157972, 2.773312, 0, 0, 0, 1, 1,
0.1699941, -0.2175478, 3.039993, 0, 0, 0, 1, 1,
0.1717996, 1.245019, 0.7767999, 0, 0, 0, 1, 1,
0.1737944, 0.6317578, 1.267401, 0, 0, 0, 1, 1,
0.1739618, -1.383821, 3.202464, 0, 0, 0, 1, 1,
0.1741996, -0.5250515, 1.897065, 0, 0, 0, 1, 1,
0.1754764, -1.049527, 2.998157, 1, 1, 1, 1, 1,
0.1765213, 0.3929231, -1.777844, 1, 1, 1, 1, 1,
0.1827848, -0.01913882, 1.652363, 1, 1, 1, 1, 1,
0.1827933, 1.847432, -0.5813367, 1, 1, 1, 1, 1,
0.1871807, -0.7537778, 4.147514, 1, 1, 1, 1, 1,
0.1919637, 1.716009, -0.9795197, 1, 1, 1, 1, 1,
0.1926531, -0.5353844, 3.312428, 1, 1, 1, 1, 1,
0.1935478, 1.262161, 1.433456, 1, 1, 1, 1, 1,
0.1935772, 0.5341793, 0.00812199, 1, 1, 1, 1, 1,
0.1992731, 0.07951616, 1.09928, 1, 1, 1, 1, 1,
0.1993007, -0.3971857, 2.852055, 1, 1, 1, 1, 1,
0.2029334, 0.7159597, 0.2100974, 1, 1, 1, 1, 1,
0.2046899, -2.483181, 3.147053, 1, 1, 1, 1, 1,
0.2070693, -0.7271941, 3.161976, 1, 1, 1, 1, 1,
0.2101395, 0.8693517, 0.4555469, 1, 1, 1, 1, 1,
0.2122902, 0.3453712, 0.9882829, 0, 0, 1, 1, 1,
0.2140521, 1.283966, -0.3873193, 1, 0, 0, 1, 1,
0.2162569, -0.333132, 3.183681, 1, 0, 0, 1, 1,
0.2170807, 0.004063514, 2.034163, 1, 0, 0, 1, 1,
0.2221122, -0.08839823, 2.894895, 1, 0, 0, 1, 1,
0.224754, 1.559342, -0.6253699, 1, 0, 0, 1, 1,
0.2394718, 1.052541, 0.6561094, 0, 0, 0, 1, 1,
0.2443338, 1.54633, -1.036503, 0, 0, 0, 1, 1,
0.2475724, -3.232717, 3.46707, 0, 0, 0, 1, 1,
0.2478604, -0.5505586, 3.341605, 0, 0, 0, 1, 1,
0.2495063, -0.5649901, 4.204851, 0, 0, 0, 1, 1,
0.2521969, -0.5273991, 3.825819, 0, 0, 0, 1, 1,
0.2566337, -1.611146, 3.383372, 0, 0, 0, 1, 1,
0.2569958, 0.6821378, 0.9414243, 1, 1, 1, 1, 1,
0.2578943, 0.8454868, -1.387251, 1, 1, 1, 1, 1,
0.2624893, -0.751272, 1.3615, 1, 1, 1, 1, 1,
0.2626267, 1.242519, 1.679835, 1, 1, 1, 1, 1,
0.2638424, -0.4178285, 2.235583, 1, 1, 1, 1, 1,
0.2642275, -3.934818, 4.592777, 1, 1, 1, 1, 1,
0.2682378, 1.893266, 0.9712959, 1, 1, 1, 1, 1,
0.2707993, 0.6112688, 0.04457793, 1, 1, 1, 1, 1,
0.2718358, -2.880806, 2.834194, 1, 1, 1, 1, 1,
0.2720468, -0.3768086, 3.025488, 1, 1, 1, 1, 1,
0.2729411, 0.58336, -2.188585, 1, 1, 1, 1, 1,
0.2731692, -0.3243902, 3.872608, 1, 1, 1, 1, 1,
0.2733914, -0.9220297, 3.913645, 1, 1, 1, 1, 1,
0.2770289, -1.281954, 1.543023, 1, 1, 1, 1, 1,
0.2800349, 0.3925599, 0.8358269, 1, 1, 1, 1, 1,
0.2800359, 1.137738, 0.0009896887, 0, 0, 1, 1, 1,
0.2832603, -0.8218112, 3.187939, 1, 0, 0, 1, 1,
0.2891746, 0.05735262, 1.099012, 1, 0, 0, 1, 1,
0.2909661, -0.3379924, 1.959639, 1, 0, 0, 1, 1,
0.294463, -0.7616574, 3.21567, 1, 0, 0, 1, 1,
0.3007158, 0.09367536, 2.507034, 1, 0, 0, 1, 1,
0.3014117, 1.243462, 0.148564, 0, 0, 0, 1, 1,
0.3093892, 0.2279555, 1.614042, 0, 0, 0, 1, 1,
0.310769, -0.02798035, 1.244708, 0, 0, 0, 1, 1,
0.3132522, 0.2732008, 1.838531, 0, 0, 0, 1, 1,
0.3195005, 0.4662019, 0.006723855, 0, 0, 0, 1, 1,
0.3202256, 1.053054, 1.633208, 0, 0, 0, 1, 1,
0.3220806, 1.138776, 1.913508, 0, 0, 0, 1, 1,
0.3240511, 0.822112, 0.09932151, 1, 1, 1, 1, 1,
0.3266901, -0.2371599, 3.443307, 1, 1, 1, 1, 1,
0.3278209, 1.096568, 0.4967908, 1, 1, 1, 1, 1,
0.328225, -0.5180277, 1.721615, 1, 1, 1, 1, 1,
0.332242, -1.324799, 2.16905, 1, 1, 1, 1, 1,
0.3325078, 1.272994, -0.4376422, 1, 1, 1, 1, 1,
0.3331541, 0.4701124, 0.408095, 1, 1, 1, 1, 1,
0.3361436, 0.3808334, 0.1752129, 1, 1, 1, 1, 1,
0.3377882, -0.2103843, 2.337005, 1, 1, 1, 1, 1,
0.3397802, -0.4453689, 2.365173, 1, 1, 1, 1, 1,
0.3411427, -0.8980598, 0.5069052, 1, 1, 1, 1, 1,
0.3445913, 0.08996218, 3.380154, 1, 1, 1, 1, 1,
0.3447438, 0.4263429, 0.129331, 1, 1, 1, 1, 1,
0.3484558, -1.129214, 1.256796, 1, 1, 1, 1, 1,
0.3506554, -1.664174, 4.129086, 1, 1, 1, 1, 1,
0.3516564, 0.9729024, 0.6074393, 0, 0, 1, 1, 1,
0.3524441, -1.024915, 3.046646, 1, 0, 0, 1, 1,
0.3547582, 0.8420428, 1.2378, 1, 0, 0, 1, 1,
0.3580813, 1.163178, 0.4632353, 1, 0, 0, 1, 1,
0.3586478, -1.375627, 1.817898, 1, 0, 0, 1, 1,
0.3610664, 0.2628637, -0.1035668, 1, 0, 0, 1, 1,
0.366832, -0.114853, 3.007538, 0, 0, 0, 1, 1,
0.3675352, -0.5713735, 2.583774, 0, 0, 0, 1, 1,
0.3676343, -0.2121628, 1.223336, 0, 0, 0, 1, 1,
0.3706989, 0.9883791, 1.198069, 0, 0, 0, 1, 1,
0.3805373, 0.1372657, 2.4858, 0, 0, 0, 1, 1,
0.3920313, -1.194887, 1.346721, 0, 0, 0, 1, 1,
0.4033826, 0.3456039, -0.1739025, 0, 0, 0, 1, 1,
0.4038009, 1.231774, 1.648767, 1, 1, 1, 1, 1,
0.4097747, 0.7485595, 2.128081, 1, 1, 1, 1, 1,
0.4110419, 0.4410619, 0.3723506, 1, 1, 1, 1, 1,
0.4112658, -2.431196, 4.78726, 1, 1, 1, 1, 1,
0.4150472, -0.04801515, 1.81969, 1, 1, 1, 1, 1,
0.4151823, 0.3895498, 2.264749, 1, 1, 1, 1, 1,
0.4160629, -0.5412687, 3.140472, 1, 1, 1, 1, 1,
0.4168375, 0.2362498, 1.191432, 1, 1, 1, 1, 1,
0.4199227, 0.1992757, -0.235747, 1, 1, 1, 1, 1,
0.4212632, 0.6251619, 0.5903838, 1, 1, 1, 1, 1,
0.4215151, -0.8992962, 2.806284, 1, 1, 1, 1, 1,
0.4259435, -1.323745, 3.45183, 1, 1, 1, 1, 1,
0.4264056, 2.013987, -0.9077313, 1, 1, 1, 1, 1,
0.4306317, -2.041373, 1.682258, 1, 1, 1, 1, 1,
0.4377515, -0.6770115, 1.749788, 1, 1, 1, 1, 1,
0.440216, -0.8101999, 1.969592, 0, 0, 1, 1, 1,
0.4435648, -1.092696, 1.668463, 1, 0, 0, 1, 1,
0.4487763, -0.9505545, 4.08, 1, 0, 0, 1, 1,
0.449751, 0.3693435, 0.4971223, 1, 0, 0, 1, 1,
0.4504056, -0.2860879, 1.449796, 1, 0, 0, 1, 1,
0.4547587, 0.5913043, 0.9061219, 1, 0, 0, 1, 1,
0.4559591, -0.6019296, 2.658489, 0, 0, 0, 1, 1,
0.4582203, -1.170419, 3.573113, 0, 0, 0, 1, 1,
0.4594438, 1.80789, -0.5024902, 0, 0, 0, 1, 1,
0.4598727, -1.305863, 2.783686, 0, 0, 0, 1, 1,
0.4671015, -1.145125, 3.368474, 0, 0, 0, 1, 1,
0.46821, 0.3390585, 0.9331419, 0, 0, 0, 1, 1,
0.4713157, -1.621914, 3.079016, 0, 0, 0, 1, 1,
0.4729028, -0.8053603, 4.017551, 1, 1, 1, 1, 1,
0.4748084, -1.456556, 4.772562, 1, 1, 1, 1, 1,
0.4763787, -0.9573517, 2.07243, 1, 1, 1, 1, 1,
0.4769669, 0.3146145, 1.748821, 1, 1, 1, 1, 1,
0.4810039, 0.1896208, 2.08443, 1, 1, 1, 1, 1,
0.4848655, 1.141937, -0.3592637, 1, 1, 1, 1, 1,
0.4894565, 0.6837015, 0.8813455, 1, 1, 1, 1, 1,
0.4903605, -0.07199645, 2.085356, 1, 1, 1, 1, 1,
0.4912403, 0.6296917, -1.244702, 1, 1, 1, 1, 1,
0.491875, -1.492435, 2.789364, 1, 1, 1, 1, 1,
0.4931737, -2.18069, 1.972887, 1, 1, 1, 1, 1,
0.501439, 0.3861955, 1.506492, 1, 1, 1, 1, 1,
0.5025358, -1.098688, 4.061059, 1, 1, 1, 1, 1,
0.5032444, 0.1870788, 2.069024, 1, 1, 1, 1, 1,
0.507044, -0.9956533, 1.166923, 1, 1, 1, 1, 1,
0.5084365, 0.07273267, 2.776136, 0, 0, 1, 1, 1,
0.5114236, -0.01607267, 1.842923, 1, 0, 0, 1, 1,
0.5139169, 1.102818, -1.208919, 1, 0, 0, 1, 1,
0.5233247, -0.1225314, -0.7463521, 1, 0, 0, 1, 1,
0.5272437, -0.02446999, 2.651897, 1, 0, 0, 1, 1,
0.5289796, -0.8683736, 0.9959368, 1, 0, 0, 1, 1,
0.536682, -1.088281, 3.102136, 0, 0, 0, 1, 1,
0.5393758, -0.9900082, 1.583544, 0, 0, 0, 1, 1,
0.5418236, -0.2515202, 2.430501, 0, 0, 0, 1, 1,
0.5419132, 2.889766, 0.3184862, 0, 0, 0, 1, 1,
0.5481828, 0.3215511, 2.210808, 0, 0, 0, 1, 1,
0.5503137, -0.5999541, 0.6410082, 0, 0, 0, 1, 1,
0.5507767, -0.3135281, 2.925678, 0, 0, 0, 1, 1,
0.5508328, -0.1072854, 1.301318, 1, 1, 1, 1, 1,
0.5523068, -1.025664, 2.255888, 1, 1, 1, 1, 1,
0.5581177, 1.218034, 1.500207, 1, 1, 1, 1, 1,
0.5585437, 1.211612, 0.2277395, 1, 1, 1, 1, 1,
0.5586314, 1.219256, 0.7069066, 1, 1, 1, 1, 1,
0.5626834, -0.07148718, 2.461006, 1, 1, 1, 1, 1,
0.565217, 0.1682165, 0.6188371, 1, 1, 1, 1, 1,
0.5658632, -0.7414752, -0.2406549, 1, 1, 1, 1, 1,
0.570034, -0.3996482, 1.944357, 1, 1, 1, 1, 1,
0.5764635, -0.3523442, 3.043735, 1, 1, 1, 1, 1,
0.5791363, -0.7519833, 1.869218, 1, 1, 1, 1, 1,
0.5795192, 1.252711, 1.702797, 1, 1, 1, 1, 1,
0.5847707, 2.161515, 0.8055024, 1, 1, 1, 1, 1,
0.5891765, -1.984273, 2.139734, 1, 1, 1, 1, 1,
0.5892186, 1.96569, 2.313736, 1, 1, 1, 1, 1,
0.5933943, -0.2145611, 1.591174, 0, 0, 1, 1, 1,
0.5935761, 0.4923031, 1.761546, 1, 0, 0, 1, 1,
0.595636, 0.3507752, 2.191396, 1, 0, 0, 1, 1,
0.6004959, 0.3467176, 3.227125, 1, 0, 0, 1, 1,
0.6007381, -1.163842, 1.291982, 1, 0, 0, 1, 1,
0.6118278, 0.1423261, 2.504446, 1, 0, 0, 1, 1,
0.6134943, -0.4949814, 1.763903, 0, 0, 0, 1, 1,
0.6171589, 0.4058156, 1.798728, 0, 0, 0, 1, 1,
0.619832, -0.01969807, 2.012215, 0, 0, 0, 1, 1,
0.6266248, -0.1941561, 1.741063, 0, 0, 0, 1, 1,
0.6363512, -0.5214539, 1.284538, 0, 0, 0, 1, 1,
0.638672, -1.500414, 1.773415, 0, 0, 0, 1, 1,
0.639074, 0.1569187, 3.983657, 0, 0, 0, 1, 1,
0.6399937, 1.241286, 0.4228732, 1, 1, 1, 1, 1,
0.6414077, -0.474677, 0.3984502, 1, 1, 1, 1, 1,
0.6484272, 0.1762507, 0.1691398, 1, 1, 1, 1, 1,
0.6540372, -0.3962193, 3.547652, 1, 1, 1, 1, 1,
0.6543926, 0.3241192, -0.1216025, 1, 1, 1, 1, 1,
0.6587154, 0.1873188, 1.689759, 1, 1, 1, 1, 1,
0.6594412, -0.07905468, 0.3059677, 1, 1, 1, 1, 1,
0.6595682, -0.5277769, 2.373647, 1, 1, 1, 1, 1,
0.6603124, 0.9494082, -0.3579554, 1, 1, 1, 1, 1,
0.662587, -0.8344484, 2.573325, 1, 1, 1, 1, 1,
0.6700271, 0.8087463, 1.607939, 1, 1, 1, 1, 1,
0.6724209, -0.1668923, 0.1657116, 1, 1, 1, 1, 1,
0.6731989, -0.8497609, 3.596326, 1, 1, 1, 1, 1,
0.6736333, 0.00117367, -0.4576455, 1, 1, 1, 1, 1,
0.674212, -0.2196477, 1.758356, 1, 1, 1, 1, 1,
0.6751553, -0.6754051, 2.650927, 0, 0, 1, 1, 1,
0.6760616, -0.7107322, 1.326324, 1, 0, 0, 1, 1,
0.676573, -1.36482, 1.846146, 1, 0, 0, 1, 1,
0.6777385, -0.4112633, 1.143347, 1, 0, 0, 1, 1,
0.6804852, 0.1841007, -0.9398861, 1, 0, 0, 1, 1,
0.6823385, -0.8428805, 2.539961, 1, 0, 0, 1, 1,
0.6875756, -1.774742, 3.107224, 0, 0, 0, 1, 1,
0.6884557, 0.09662768, 1.201651, 0, 0, 0, 1, 1,
0.6885428, -0.09953272, 2.433868, 0, 0, 0, 1, 1,
0.699325, -1.624707, 2.627228, 0, 0, 0, 1, 1,
0.7020372, -0.4282759, 0.1970709, 0, 0, 0, 1, 1,
0.7055608, 1.247645, 1.427903, 0, 0, 0, 1, 1,
0.7068588, 0.6506649, 0.8914611, 0, 0, 0, 1, 1,
0.7169906, 1.328511, -0.0896055, 1, 1, 1, 1, 1,
0.7181041, 0.74496, -0.6256772, 1, 1, 1, 1, 1,
0.7207347, 0.02585354, 2.670543, 1, 1, 1, 1, 1,
0.7209019, -0.256475, 3.057536, 1, 1, 1, 1, 1,
0.7217125, 0.4653829, -0.7418328, 1, 1, 1, 1, 1,
0.7220476, -0.6138201, 1.5858, 1, 1, 1, 1, 1,
0.7224258, 0.2733188, 1.270901, 1, 1, 1, 1, 1,
0.7242817, -0.1820181, 1.129007, 1, 1, 1, 1, 1,
0.7243214, -1.408323, 2.361663, 1, 1, 1, 1, 1,
0.7306319, -0.5167398, 3.39977, 1, 1, 1, 1, 1,
0.7354835, 0.3464688, 0.7907005, 1, 1, 1, 1, 1,
0.740727, 0.8379798, 0.04485158, 1, 1, 1, 1, 1,
0.7462924, -1.234313, 2.796665, 1, 1, 1, 1, 1,
0.7481212, 1.162673, -0.05941874, 1, 1, 1, 1, 1,
0.7485005, -0.8407815, 0.7460289, 1, 1, 1, 1, 1,
0.7622372, -0.3205782, 0.9348354, 0, 0, 1, 1, 1,
0.764204, 1.902892, 1.442156, 1, 0, 0, 1, 1,
0.7651221, 1.238719, -0.1764674, 1, 0, 0, 1, 1,
0.7651845, 1.83102, -0.08507231, 1, 0, 0, 1, 1,
0.7667935, 1.195457, 0.5728863, 1, 0, 0, 1, 1,
0.7749261, 0.9599806, -0.02174608, 1, 0, 0, 1, 1,
0.7770849, -0.4939937, 1.88884, 0, 0, 0, 1, 1,
0.784093, 0.4630124, 1.859262, 0, 0, 0, 1, 1,
0.7908109, 1.21643, 2.045496, 0, 0, 0, 1, 1,
0.792801, -0.9241883, 2.972435, 0, 0, 0, 1, 1,
0.8087039, 0.09356146, 1.13698, 0, 0, 0, 1, 1,
0.8101857, -0.05733172, 1.506225, 0, 0, 0, 1, 1,
0.8138966, -0.004736193, 0.502601, 0, 0, 0, 1, 1,
0.8165717, -0.07402863, 1.164451, 1, 1, 1, 1, 1,
0.8204358, -1.711751, 3.994832, 1, 1, 1, 1, 1,
0.8224701, -0.7438581, 2.292159, 1, 1, 1, 1, 1,
0.8226116, 1.441705, -1.372618, 1, 1, 1, 1, 1,
0.8262623, 0.2492598, 1.352624, 1, 1, 1, 1, 1,
0.8291018, 1.255794, 0.2879489, 1, 1, 1, 1, 1,
0.8330408, -1.77317, 1.732755, 1, 1, 1, 1, 1,
0.8369586, -1.382504, 0.9783367, 1, 1, 1, 1, 1,
0.845162, -1.436586, 2.263393, 1, 1, 1, 1, 1,
0.8461735, -0.9953572, 3.755554, 1, 1, 1, 1, 1,
0.8553731, 0.3889277, 2.792434, 1, 1, 1, 1, 1,
0.8558429, -0.8684087, 1.090752, 1, 1, 1, 1, 1,
0.8569056, 0.3243249, 0.3726876, 1, 1, 1, 1, 1,
0.8672869, 0.9368982, 1.071723, 1, 1, 1, 1, 1,
0.8758537, -2.806449, 2.190113, 1, 1, 1, 1, 1,
0.8811114, 0.8880084, 1.542772, 0, 0, 1, 1, 1,
0.8833889, -2.127904, 3.05393, 1, 0, 0, 1, 1,
0.8837212, -1.508447, 0.7993485, 1, 0, 0, 1, 1,
0.8907714, 0.04081518, 2.038911, 1, 0, 0, 1, 1,
0.9075447, -0.7844024, 4.186, 1, 0, 0, 1, 1,
0.9089164, 0.5329335, 1.372404, 1, 0, 0, 1, 1,
0.91036, -1.945083, 0.004496544, 0, 0, 0, 1, 1,
0.9144791, 1.115916, 0.927884, 0, 0, 0, 1, 1,
0.9158652, 0.4030778, 2.667817, 0, 0, 0, 1, 1,
0.9233237, -0.3318284, 1.29658, 0, 0, 0, 1, 1,
0.9247546, 0.3974763, 1.57079, 0, 0, 0, 1, 1,
0.9365631, 0.2519719, 1.683248, 0, 0, 0, 1, 1,
0.9448572, 1.359853, -1.921375, 0, 0, 0, 1, 1,
0.9494045, -1.114338, 1.285573, 1, 1, 1, 1, 1,
0.9595621, -1.277682, 3.133476, 1, 1, 1, 1, 1,
0.9614421, 0.790785, 2.372877, 1, 1, 1, 1, 1,
0.9624996, -0.6621155, 3.293686, 1, 1, 1, 1, 1,
0.9658061, -1.616733, 3.49049, 1, 1, 1, 1, 1,
0.9677742, -1.174344, 2.08068, 1, 1, 1, 1, 1,
0.9685927, -0.2103029, 1.942027, 1, 1, 1, 1, 1,
0.9777708, 0.4892058, 2.487136, 1, 1, 1, 1, 1,
1.008813, 0.3126311, 1.234754, 1, 1, 1, 1, 1,
1.027567, -0.5054176, 2.890216, 1, 1, 1, 1, 1,
1.032228, -0.775488, 0.8175763, 1, 1, 1, 1, 1,
1.035034, -0.9106049, 2.739107, 1, 1, 1, 1, 1,
1.040325, 1.463812, 2.730524, 1, 1, 1, 1, 1,
1.048094, 0.06046336, 1.441368, 1, 1, 1, 1, 1,
1.052676, -0.1280097, 0.6617349, 1, 1, 1, 1, 1,
1.05391, 0.5158787, 0.9908204, 0, 0, 1, 1, 1,
1.056967, -0.0382614, 2.832672, 1, 0, 0, 1, 1,
1.059148, 0.8361202, 0.4810082, 1, 0, 0, 1, 1,
1.064934, -0.2732733, 1.149366, 1, 0, 0, 1, 1,
1.067671, 1.198379, -0.07422222, 1, 0, 0, 1, 1,
1.07177, -0.5666195, 2.739106, 1, 0, 0, 1, 1,
1.079042, 0.2112308, -1.091123, 0, 0, 0, 1, 1,
1.079726, -0.4065274, 2.16645, 0, 0, 0, 1, 1,
1.080378, 0.4408273, 2.007919, 0, 0, 0, 1, 1,
1.081056, 1.576272, 0.9185413, 0, 0, 0, 1, 1,
1.085679, 1.429156, 1.888017, 0, 0, 0, 1, 1,
1.093792, 1.057462, 0.1651344, 0, 0, 0, 1, 1,
1.097268, -0.0362941, 2.748525, 0, 0, 0, 1, 1,
1.099342, 0.4645714, 0.9559487, 1, 1, 1, 1, 1,
1.103027, 0.7856533, 2.051746, 1, 1, 1, 1, 1,
1.104329, 0.1569825, 1.431867, 1, 1, 1, 1, 1,
1.107071, 0.5281031, 1.855882, 1, 1, 1, 1, 1,
1.111033, 1.972345, 2.000042, 1, 1, 1, 1, 1,
1.114366, -0.07870899, 1.433321, 1, 1, 1, 1, 1,
1.126684, -1.129341, 1.961164, 1, 1, 1, 1, 1,
1.127577, 1.157846, 0.8828623, 1, 1, 1, 1, 1,
1.136224, -0.8463399, 2.608134, 1, 1, 1, 1, 1,
1.139593, -0.4448639, 1.55854, 1, 1, 1, 1, 1,
1.141385, -1.279182, 1.804439, 1, 1, 1, 1, 1,
1.142412, -0.9011246, 2.396951, 1, 1, 1, 1, 1,
1.144958, -0.5726115, 3.107878, 1, 1, 1, 1, 1,
1.155273, 1.396346, 0.7718275, 1, 1, 1, 1, 1,
1.158717, 0.8765121, -0.5785348, 1, 1, 1, 1, 1,
1.158874, -0.1152872, 1.6896, 0, 0, 1, 1, 1,
1.160087, -2.235989, 3.092351, 1, 0, 0, 1, 1,
1.167846, 1.202631, 2.000046, 1, 0, 0, 1, 1,
1.167905, -0.4112311, 2.249736, 1, 0, 0, 1, 1,
1.170437, 0.05756823, 0.06681343, 1, 0, 0, 1, 1,
1.170948, -1.171012, 0.8892841, 1, 0, 0, 1, 1,
1.177601, -1.870076, 4.004089, 0, 0, 0, 1, 1,
1.178689, -0.735917, 3.555618, 0, 0, 0, 1, 1,
1.180604, -0.219298, 2.155288, 0, 0, 0, 1, 1,
1.184756, -1.453857, 2.263172, 0, 0, 0, 1, 1,
1.19582, -1.244458, 1.507506, 0, 0, 0, 1, 1,
1.199154, -0.5608352, 0.05183306, 0, 0, 0, 1, 1,
1.19918, -0.4719163, 0.6124354, 0, 0, 0, 1, 1,
1.205624, 0.8024209, 2.166934, 1, 1, 1, 1, 1,
1.210244, 1.316081, -0.01704919, 1, 1, 1, 1, 1,
1.215629, -1.726807, 1.267446, 1, 1, 1, 1, 1,
1.216805, 0.7003134, 2.378094, 1, 1, 1, 1, 1,
1.21904, 0.09975235, 0.5777068, 1, 1, 1, 1, 1,
1.22872, -0.05763277, 0.6766111, 1, 1, 1, 1, 1,
1.238861, -0.3087271, 2.930982, 1, 1, 1, 1, 1,
1.242566, 1.588788, -1.330904, 1, 1, 1, 1, 1,
1.242578, -0.5341419, 2.589743, 1, 1, 1, 1, 1,
1.242581, 0.2711227, 1.06805, 1, 1, 1, 1, 1,
1.248494, -0.312348, 0.9081256, 1, 1, 1, 1, 1,
1.258961, -0.8445919, 0.4612298, 1, 1, 1, 1, 1,
1.266612, 0.7412587, 0.2495198, 1, 1, 1, 1, 1,
1.271184, 0.02072161, -0.1076723, 1, 1, 1, 1, 1,
1.281292, -1.046118, 2.387969, 1, 1, 1, 1, 1,
1.288193, -1.61113, 2.301045, 0, 0, 1, 1, 1,
1.290231, 1.740293, 0.1430252, 1, 0, 0, 1, 1,
1.295404, -1.502654, 3.416643, 1, 0, 0, 1, 1,
1.299869, 0.4481164, -0.7998233, 1, 0, 0, 1, 1,
1.306133, -0.01598206, 0.04251117, 1, 0, 0, 1, 1,
1.307445, -0.5238885, 1.539697, 1, 0, 0, 1, 1,
1.309505, -0.7613673, 1.831753, 0, 0, 0, 1, 1,
1.312164, -0.02635815, 1.917357, 0, 0, 0, 1, 1,
1.314707, 0.4155432, 0.2158794, 0, 0, 0, 1, 1,
1.321551, -0.6308793, 1.75934, 0, 0, 0, 1, 1,
1.329735, 1.15589, -0.6087749, 0, 0, 0, 1, 1,
1.330658, 2.020032, 1.187551, 0, 0, 0, 1, 1,
1.34757, 0.7357185, 0.3423097, 0, 0, 0, 1, 1,
1.35951, 0.06356062, 1.522192, 1, 1, 1, 1, 1,
1.365775, -0.6270261, 2.054077, 1, 1, 1, 1, 1,
1.376912, -0.7439832, 2.183008, 1, 1, 1, 1, 1,
1.385, -0.8323675, 3.239758, 1, 1, 1, 1, 1,
1.394605, -0.9667947, 2.06958, 1, 1, 1, 1, 1,
1.397572, -0.102364, 3.998617, 1, 1, 1, 1, 1,
1.40889, -0.8638992, 2.016444, 1, 1, 1, 1, 1,
1.417666, 0.3203131, 0.09860422, 1, 1, 1, 1, 1,
1.42145, 0.8118314, 2.426395, 1, 1, 1, 1, 1,
1.423286, -0.4804243, -0.02435876, 1, 1, 1, 1, 1,
1.427055, 0.1569002, 1.393156, 1, 1, 1, 1, 1,
1.433579, 0.8188109, -0.5648969, 1, 1, 1, 1, 1,
1.441367, 0.2864051, 1.719259, 1, 1, 1, 1, 1,
1.442132, -0.07163966, 1.521075, 1, 1, 1, 1, 1,
1.442223, -0.8550942, 2.235774, 1, 1, 1, 1, 1,
1.442572, 1.592126, -1.06706, 0, 0, 1, 1, 1,
1.443333, 0.2287743, 0.5447448, 1, 0, 0, 1, 1,
1.4454, -1.176798, 1.954714, 1, 0, 0, 1, 1,
1.447514, -0.4307288, 0.6827859, 1, 0, 0, 1, 1,
1.449526, 0.8631694, 1.323086, 1, 0, 0, 1, 1,
1.460239, -0.6112836, 2.603515, 1, 0, 0, 1, 1,
1.465349, 0.07841513, 2.464879, 0, 0, 0, 1, 1,
1.466394, 0.4233083, 1.971914, 0, 0, 0, 1, 1,
1.469166, 0.1898257, 0.1021549, 0, 0, 0, 1, 1,
1.47415, -0.230614, 1.749899, 0, 0, 0, 1, 1,
1.482442, -1.451576, 2.782355, 0, 0, 0, 1, 1,
1.502543, 0.5021947, 1.926273, 0, 0, 0, 1, 1,
1.504261, -1.400995, 0.891897, 0, 0, 0, 1, 1,
1.514222, -0.3982419, 2.063124, 1, 1, 1, 1, 1,
1.515727, -0.9318801, 2.753145, 1, 1, 1, 1, 1,
1.533563, -1.873627, 2.241755, 1, 1, 1, 1, 1,
1.538889, 0.06861317, 0.4235164, 1, 1, 1, 1, 1,
1.544013, -0.1805884, 3.523595, 1, 1, 1, 1, 1,
1.557996, -1.206176, 2.876762, 1, 1, 1, 1, 1,
1.561264, -0.5746776, 3.015227, 1, 1, 1, 1, 1,
1.563148, -0.3046731, 1.779929, 1, 1, 1, 1, 1,
1.573313, 0.9023384, 1.072119, 1, 1, 1, 1, 1,
1.583953, -1.006474, 2.136966, 1, 1, 1, 1, 1,
1.589289, 1.341487, 1.036238, 1, 1, 1, 1, 1,
1.589775, -0.8095908, 2.916509, 1, 1, 1, 1, 1,
1.597583, -0.8763062, 1.553719, 1, 1, 1, 1, 1,
1.59853, -0.192205, 3.402897, 1, 1, 1, 1, 1,
1.602711, 1.03258, 1.04659, 1, 1, 1, 1, 1,
1.603574, -2.245466, 1.848176, 0, 0, 1, 1, 1,
1.667718, -0.3455991, 3.111696, 1, 0, 0, 1, 1,
1.672007, 0.6513142, -0.01465934, 1, 0, 0, 1, 1,
1.695787, 0.992391, 2.414, 1, 0, 0, 1, 1,
1.69659, 1.739388, 1.627295, 1, 0, 0, 1, 1,
1.697066, -1.808809, 2.619237, 1, 0, 0, 1, 1,
1.715574, -0.4613389, 3.357707, 0, 0, 0, 1, 1,
1.7315, -0.6121973, 1.533009, 0, 0, 0, 1, 1,
1.738705, 0.5391003, 0.98185, 0, 0, 0, 1, 1,
1.760398, -0.7029878, 1.169455, 0, 0, 0, 1, 1,
1.779536, 0.8080161, 0.5104339, 0, 0, 0, 1, 1,
1.818891, -0.2530547, -0.7505333, 0, 0, 0, 1, 1,
1.822557, 1.173051, 1.352323, 0, 0, 0, 1, 1,
1.836234, 0.2543152, 2.819882, 1, 1, 1, 1, 1,
1.842142, 0.2062534, 0.02198768, 1, 1, 1, 1, 1,
1.875768, 0.9473467, 1.654222, 1, 1, 1, 1, 1,
1.882088, 0.2623059, 1.03383, 1, 1, 1, 1, 1,
1.903381, 0.9094926, 1.194376, 1, 1, 1, 1, 1,
1.928112, 0.2392119, 1.487375, 1, 1, 1, 1, 1,
1.938277, 1.311454, 1.630461, 1, 1, 1, 1, 1,
1.93967, 0.342145, 0.9795648, 1, 1, 1, 1, 1,
1.944289, -0.7204979, 0.2868548, 1, 1, 1, 1, 1,
1.945205, -0.2606226, 3.597718, 1, 1, 1, 1, 1,
1.956061, -0.7261878, 3.181673, 1, 1, 1, 1, 1,
2.01757, -0.4456668, 3.391916, 1, 1, 1, 1, 1,
2.044745, 1.46967, 2.70847, 1, 1, 1, 1, 1,
2.095397, 0.8198919, 2.473086, 1, 1, 1, 1, 1,
2.098677, -2.007807, 3.08317, 1, 1, 1, 1, 1,
2.119369, -1.968697, 2.764601, 0, 0, 1, 1, 1,
2.128601, 2.069397, 1.23563, 1, 0, 0, 1, 1,
2.134002, 1.50116, 1.408438, 1, 0, 0, 1, 1,
2.159236, 0.3715142, 1.368907, 1, 0, 0, 1, 1,
2.177559, -0.85592, 3.370817, 1, 0, 0, 1, 1,
2.180087, -1.373655, 2.959228, 1, 0, 0, 1, 1,
2.200581, -0.6763456, 2.734203, 0, 0, 0, 1, 1,
2.234238, 0.4378536, 1.283658, 0, 0, 0, 1, 1,
2.270962, 0.1555793, 2.90553, 0, 0, 0, 1, 1,
2.308795, 0.7771459, -0.1103019, 0, 0, 0, 1, 1,
2.379821, 0.006237259, -0.3138559, 0, 0, 0, 1, 1,
2.408869, 2.506709, -0.1478257, 0, 0, 0, 1, 1,
2.482368, 1.416455, 1.218367, 0, 0, 0, 1, 1,
2.555447, -1.38796, 2.355081, 1, 1, 1, 1, 1,
2.740507, -0.6554844, 2.483301, 1, 1, 1, 1, 1,
2.790912, -1.042721, 1.208172, 1, 1, 1, 1, 1,
2.994471, 0.4311481, 1.790402, 1, 1, 1, 1, 1,
3.113268, 1.371435, -0.6070312, 1, 1, 1, 1, 1,
3.464215, -1.128084, 2.754303, 1, 1, 1, 1, 1,
3.631979, 0.383867, 1.161958, 1, 1, 1, 1, 1
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
var radius = 9.567077;
var distance = 33.60395;
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
mvMatrix.translate( -0.1284671, 0.4925133, 0.1816659 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.60395);
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
