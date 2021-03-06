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
-3.902048, -0.4087238, -0.30448, 1, 0, 0, 1,
-3.755823, 0.2261704, -0.6462423, 1, 0.007843138, 0, 1,
-2.884968, 0.07464994, -0.7319115, 1, 0.01176471, 0, 1,
-2.834044, -0.1846681, -0.9510599, 1, 0.01960784, 0, 1,
-2.723545, -0.4426013, -1.81192, 1, 0.02352941, 0, 1,
-2.66934, -1.520166, -1.618417, 1, 0.03137255, 0, 1,
-2.53266, -0.7766216, -2.452037, 1, 0.03529412, 0, 1,
-2.503072, 0.4231343, -0.9578544, 1, 0.04313726, 0, 1,
-2.45568, -1.012798, -2.063988, 1, 0.04705882, 0, 1,
-2.380383, 0.03460096, -0.6526275, 1, 0.05490196, 0, 1,
-2.247388, -0.9490897, -2.37708, 1, 0.05882353, 0, 1,
-2.243913, 0.3308464, -0.3960778, 1, 0.06666667, 0, 1,
-2.224501, -1.088459, -3.216417, 1, 0.07058824, 0, 1,
-2.189883, -1.547841, -2.153564, 1, 0.07843138, 0, 1,
-2.156852, 1.123993, 0.3536785, 1, 0.08235294, 0, 1,
-2.061729, -0.6132339, -0.299501, 1, 0.09019608, 0, 1,
-2.022591, -2.76922, -1.55398, 1, 0.09411765, 0, 1,
-2.002737, 0.8971085, -3.009837, 1, 0.1019608, 0, 1,
-1.984966, -0.2151574, -0.564007, 1, 0.1098039, 0, 1,
-1.954338, 0.1540955, -1.678672, 1, 0.1137255, 0, 1,
-1.951854, 1.428993, 1.028105, 1, 0.1215686, 0, 1,
-1.917983, 2.055026, -1.279484, 1, 0.1254902, 0, 1,
-1.90842, -0.5622186, -2.488488, 1, 0.1333333, 0, 1,
-1.907998, -0.8163738, -3.91677, 1, 0.1372549, 0, 1,
-1.904917, 0.5865037, -1.431611, 1, 0.145098, 0, 1,
-1.903508, 0.3900894, -2.061704, 1, 0.1490196, 0, 1,
-1.898473, 0.06250077, -1.955649, 1, 0.1568628, 0, 1,
-1.895949, -0.3601341, -2.482205, 1, 0.1607843, 0, 1,
-1.892214, -0.4312842, -0.2393325, 1, 0.1686275, 0, 1,
-1.887426, -1.729166, 0.1290062, 1, 0.172549, 0, 1,
-1.883621, 0.5294026, -0.2519719, 1, 0.1803922, 0, 1,
-1.859678, -0.03076091, -0.3055052, 1, 0.1843137, 0, 1,
-1.822779, -0.3868965, -1.719965, 1, 0.1921569, 0, 1,
-1.794693, 2.10667, -0.9022263, 1, 0.1960784, 0, 1,
-1.75473, 0.7008928, -0.748862, 1, 0.2039216, 0, 1,
-1.735692, -0.5267747, -1.352474, 1, 0.2117647, 0, 1,
-1.730766, -1.33295, -1.443998, 1, 0.2156863, 0, 1,
-1.727657, -0.05698023, -1.724557, 1, 0.2235294, 0, 1,
-1.719335, -0.460407, -2.243422, 1, 0.227451, 0, 1,
-1.718293, 1.854517, -0.2617493, 1, 0.2352941, 0, 1,
-1.71643, 0.6825345, -1.81746, 1, 0.2392157, 0, 1,
-1.715173, 0.5835537, -1.296194, 1, 0.2470588, 0, 1,
-1.714453, -1.147096, -1.387105, 1, 0.2509804, 0, 1,
-1.714093, -1.500592, -2.665483, 1, 0.2588235, 0, 1,
-1.705128, 0.4393474, -0.6706967, 1, 0.2627451, 0, 1,
-1.704432, 0.8098816, -1.101716, 1, 0.2705882, 0, 1,
-1.675422, -0.2988446, -1.655573, 1, 0.2745098, 0, 1,
-1.665805, 1.023259, -1.503113, 1, 0.282353, 0, 1,
-1.66254, 0.5191606, 0.2290042, 1, 0.2862745, 0, 1,
-1.662208, -0.8853704, -1.753668, 1, 0.2941177, 0, 1,
-1.662103, 0.9743705, -0.08237589, 1, 0.3019608, 0, 1,
-1.64609, -1.81064, -2.833507, 1, 0.3058824, 0, 1,
-1.64524, -0.1216957, -0.5316756, 1, 0.3137255, 0, 1,
-1.633724, -0.2410426, -1.030275, 1, 0.3176471, 0, 1,
-1.618648, 1.250998, -0.05879821, 1, 0.3254902, 0, 1,
-1.614969, 0.08189755, -1.348205, 1, 0.3294118, 0, 1,
-1.610214, -1.309313, -3.457233, 1, 0.3372549, 0, 1,
-1.579931, -0.6292161, -3.136231, 1, 0.3411765, 0, 1,
-1.575944, 0.1576143, -1.174963, 1, 0.3490196, 0, 1,
-1.573712, -0.8559634, -2.689009, 1, 0.3529412, 0, 1,
-1.56879, -1.634779, -3.082494, 1, 0.3607843, 0, 1,
-1.555925, -1.216063, -2.814067, 1, 0.3647059, 0, 1,
-1.550445, -0.01373797, -2.778244, 1, 0.372549, 0, 1,
-1.542677, -0.6090028, -1.348669, 1, 0.3764706, 0, 1,
-1.529636, -1.375988, -2.329706, 1, 0.3843137, 0, 1,
-1.517648, -1.14411, -3.608572, 1, 0.3882353, 0, 1,
-1.489632, -1.212735, -2.726969, 1, 0.3960784, 0, 1,
-1.476405, -0.6439348, -1.866531, 1, 0.4039216, 0, 1,
-1.475272, -0.2604231, -1.883738, 1, 0.4078431, 0, 1,
-1.472867, 0.4131938, -0.7294394, 1, 0.4156863, 0, 1,
-1.465099, -0.7736908, -2.156437, 1, 0.4196078, 0, 1,
-1.450171, 0.5086935, -1.612916, 1, 0.427451, 0, 1,
-1.450076, 0.6539221, -1.715216, 1, 0.4313726, 0, 1,
-1.439399, -1.740696, -2.098846, 1, 0.4392157, 0, 1,
-1.419324, -2.917913, -2.55949, 1, 0.4431373, 0, 1,
-1.41729, -1.387679, -2.789973, 1, 0.4509804, 0, 1,
-1.4095, -0.2258043, -1.724807, 1, 0.454902, 0, 1,
-1.395494, 0.5929622, -0.5393592, 1, 0.4627451, 0, 1,
-1.393689, -0.7919157, -3.021413, 1, 0.4666667, 0, 1,
-1.387336, -0.8833627, -1.223061, 1, 0.4745098, 0, 1,
-1.369684, 0.5784833, -2.080907, 1, 0.4784314, 0, 1,
-1.367299, 0.8702071, -1.639213, 1, 0.4862745, 0, 1,
-1.324049, -1.213097, -2.829545, 1, 0.4901961, 0, 1,
-1.323106, 1.682313, -0.9237822, 1, 0.4980392, 0, 1,
-1.322294, -1.141766, -3.366841, 1, 0.5058824, 0, 1,
-1.318524, 0.2563013, -1.150061, 1, 0.509804, 0, 1,
-1.317325, 0.9391819, -0.2417723, 1, 0.5176471, 0, 1,
-1.316188, -0.1334239, -0.05824631, 1, 0.5215687, 0, 1,
-1.310257, -0.1883048, -1.90106, 1, 0.5294118, 0, 1,
-1.300741, -0.02763933, -0.03119777, 1, 0.5333334, 0, 1,
-1.300002, -1.266221, -3.301506, 1, 0.5411765, 0, 1,
-1.288263, 0.769903, -1.729847, 1, 0.5450981, 0, 1,
-1.285182, -0.7201813, -3.46344, 1, 0.5529412, 0, 1,
-1.282106, 0.8007179, -0.5925692, 1, 0.5568628, 0, 1,
-1.272668, -1.542565, -3.162564, 1, 0.5647059, 0, 1,
-1.268785, -0.1783504, -0.7681607, 1, 0.5686275, 0, 1,
-1.264437, -2.478637, -2.461728, 1, 0.5764706, 0, 1,
-1.260661, 2.090875, 0.1162345, 1, 0.5803922, 0, 1,
-1.254485, 1.172159, -1.386653, 1, 0.5882353, 0, 1,
-1.252917, 1.149125, -0.6557298, 1, 0.5921569, 0, 1,
-1.252206, -1.236437, -3.142142, 1, 0.6, 0, 1,
-1.251843, 1.185949, -1.813017, 1, 0.6078432, 0, 1,
-1.251776, -0.3155476, -0.8171536, 1, 0.6117647, 0, 1,
-1.235515, -0.4815305, -1.29893, 1, 0.6196079, 0, 1,
-1.234808, 0.6843673, -1.143461, 1, 0.6235294, 0, 1,
-1.233546, -0.7686502, 0.06004622, 1, 0.6313726, 0, 1,
-1.224188, 0.6359437, -0.9395173, 1, 0.6352941, 0, 1,
-1.220717, -1.370729, -2.201944, 1, 0.6431373, 0, 1,
-1.220388, 1.095616, -0.3468527, 1, 0.6470588, 0, 1,
-1.213937, -0.889348, -2.619727, 1, 0.654902, 0, 1,
-1.186441, 1.347051, 0.3277879, 1, 0.6588235, 0, 1,
-1.17099, -0.3570146, -2.580178, 1, 0.6666667, 0, 1,
-1.169819, 0.5202338, -2.105994, 1, 0.6705883, 0, 1,
-1.162584, -1.189855, -1.28219, 1, 0.6784314, 0, 1,
-1.159961, 1.097619, -0.7726197, 1, 0.682353, 0, 1,
-1.156768, 1.15187, 0.1910231, 1, 0.6901961, 0, 1,
-1.13717, -0.2316714, -1.875354, 1, 0.6941177, 0, 1,
-1.135617, 0.009644033, -0.8795094, 1, 0.7019608, 0, 1,
-1.135295, -0.9081483, -1.698601, 1, 0.7098039, 0, 1,
-1.12654, -0.1241609, -1.25503, 1, 0.7137255, 0, 1,
-1.125399, -1.20676, -1.297938, 1, 0.7215686, 0, 1,
-1.125177, -0.5311738, -3.287444, 1, 0.7254902, 0, 1,
-1.123901, 0.1466531, -1.538393, 1, 0.7333333, 0, 1,
-1.1228, -0.8372751, -2.947721, 1, 0.7372549, 0, 1,
-1.104431, -0.9279031, -1.798576, 1, 0.7450981, 0, 1,
-1.099871, 1.242139, 0.2229181, 1, 0.7490196, 0, 1,
-1.094914, 0.1450463, 0.9296572, 1, 0.7568628, 0, 1,
-1.092348, 0.386994, -1.219357, 1, 0.7607843, 0, 1,
-1.070762, 0.6176894, -0.5763198, 1, 0.7686275, 0, 1,
-1.069173, 0.06656341, -0.85809, 1, 0.772549, 0, 1,
-1.069028, -1.840353, -1.332278, 1, 0.7803922, 0, 1,
-1.051891, -0.02501731, -1.728791, 1, 0.7843137, 0, 1,
-1.04914, -0.08164153, -1.151113, 1, 0.7921569, 0, 1,
-1.048881, -0.4475324, -1.871486, 1, 0.7960784, 0, 1,
-1.046436, 0.2863923, -1.654179, 1, 0.8039216, 0, 1,
-1.042633, 1.01377, -2.345012, 1, 0.8117647, 0, 1,
-1.036744, 0.5310794, -2.08746, 1, 0.8156863, 0, 1,
-1.033743, -0.3796111, -2.430683, 1, 0.8235294, 0, 1,
-1.028767, -0.7485263, -4.238806, 1, 0.827451, 0, 1,
-1.027638, -0.2239354, -1.237574, 1, 0.8352941, 0, 1,
-1.023169, -0.5255104, -1.414841, 1, 0.8392157, 0, 1,
-1.020621, 1.452872, -0.9218709, 1, 0.8470588, 0, 1,
-1.019964, -0.3315611, -1.195807, 1, 0.8509804, 0, 1,
-1.014499, 0.3519754, -1.8391, 1, 0.8588235, 0, 1,
-1.012882, -0.4182128, -3.548378, 1, 0.8627451, 0, 1,
-1.011343, 1.52384, -0.4631493, 1, 0.8705882, 0, 1,
-1.010952, -1.396112, -3.279681, 1, 0.8745098, 0, 1,
-1.00718, -0.5590754, -2.222654, 1, 0.8823529, 0, 1,
-0.9945151, -0.05695817, -1.107954, 1, 0.8862745, 0, 1,
-0.9916971, 0.4417676, -1.771073, 1, 0.8941177, 0, 1,
-0.9896191, 1.061613, -1.025229, 1, 0.8980392, 0, 1,
-0.9818754, 1.504995, -1.311383, 1, 0.9058824, 0, 1,
-0.9763645, -2.173206, -4.716614, 1, 0.9137255, 0, 1,
-0.9698759, -0.515013, -1.315488, 1, 0.9176471, 0, 1,
-0.9604887, -1.538986, -2.669455, 1, 0.9254902, 0, 1,
-0.9602339, -0.4932605, -1.793532, 1, 0.9294118, 0, 1,
-0.9599891, -1.566636, -3.742303, 1, 0.9372549, 0, 1,
-0.958033, 0.4578554, -2.261189, 1, 0.9411765, 0, 1,
-0.9568005, -0.4799183, -1.904856, 1, 0.9490196, 0, 1,
-0.9488273, 0.2988206, -2.129374, 1, 0.9529412, 0, 1,
-0.9480602, -0.9313506, -3.126254, 1, 0.9607843, 0, 1,
-0.9376355, -0.4289796, -2.666915, 1, 0.9647059, 0, 1,
-0.9352032, -0.4404556, -2.865712, 1, 0.972549, 0, 1,
-0.9301705, 1.312351, 0.1324179, 1, 0.9764706, 0, 1,
-0.9300597, -1.81328, -2.91429, 1, 0.9843137, 0, 1,
-0.9283983, 1.22066, -1.868879, 1, 0.9882353, 0, 1,
-0.9212227, -1.143356, -2.393881, 1, 0.9960784, 0, 1,
-0.9159817, -1.128019, -2.425724, 0.9960784, 1, 0, 1,
-0.9152977, -0.3057894, -3.431264, 0.9921569, 1, 0, 1,
-0.8930836, -0.1630918, -3.901737, 0.9843137, 1, 0, 1,
-0.890621, -0.09762797, -1.523815, 0.9803922, 1, 0, 1,
-0.8848454, -2.107611, -4.30659, 0.972549, 1, 0, 1,
-0.8843449, -0.1959081, -3.477083, 0.9686275, 1, 0, 1,
-0.8823661, 0.1398604, -0.8195741, 0.9607843, 1, 0, 1,
-0.8785955, 0.1705183, -1.800607, 0.9568627, 1, 0, 1,
-0.8779947, 0.9977343, -1.569363, 0.9490196, 1, 0, 1,
-0.8739144, -0.4896289, -1.266047, 0.945098, 1, 0, 1,
-0.8711442, -0.3705665, -1.951704, 0.9372549, 1, 0, 1,
-0.8703582, 0.621249, -2.210695, 0.9333333, 1, 0, 1,
-0.8692042, -0.9921827, -2.649375, 0.9254902, 1, 0, 1,
-0.863421, 0.6231096, -1.050635, 0.9215686, 1, 0, 1,
-0.8626156, 0.2524639, -1.298694, 0.9137255, 1, 0, 1,
-0.8560545, -0.4205883, -3.116173, 0.9098039, 1, 0, 1,
-0.8385556, 0.06269616, -1.383094, 0.9019608, 1, 0, 1,
-0.8385119, 0.8320837, 1.166928, 0.8941177, 1, 0, 1,
-0.8350076, -0.3127763, -1.717394, 0.8901961, 1, 0, 1,
-0.8291745, -1.132563, -2.818209, 0.8823529, 1, 0, 1,
-0.8283163, 0.3287587, -2.116199, 0.8784314, 1, 0, 1,
-0.8276908, 0.02167016, -0.4091313, 0.8705882, 1, 0, 1,
-0.8269371, -0.6283237, -2.738433, 0.8666667, 1, 0, 1,
-0.8224842, 0.03874126, -0.346945, 0.8588235, 1, 0, 1,
-0.8223139, -0.2913123, -4.231346, 0.854902, 1, 0, 1,
-0.8210716, -1.315673, -3.095448, 0.8470588, 1, 0, 1,
-0.8061413, -0.1024431, -1.927226, 0.8431373, 1, 0, 1,
-0.8000939, -1.630983, -3.594702, 0.8352941, 1, 0, 1,
-0.797592, 0.937205, 0.1064816, 0.8313726, 1, 0, 1,
-0.789928, -0.3645594, -2.6689, 0.8235294, 1, 0, 1,
-0.7863674, 2.188909, 1.081511, 0.8196079, 1, 0, 1,
-0.785862, 0.9181412, 0.5862262, 0.8117647, 1, 0, 1,
-0.7793241, -1.384893, -2.755409, 0.8078431, 1, 0, 1,
-0.7768093, 0.2241716, 1.319341, 0.8, 1, 0, 1,
-0.7741082, -0.1000328, -2.439373, 0.7921569, 1, 0, 1,
-0.7717749, 1.092809, 1.762891, 0.7882353, 1, 0, 1,
-0.7670202, 1.021081, -0.1432224, 0.7803922, 1, 0, 1,
-0.7578892, -0.7833446, -0.5503555, 0.7764706, 1, 0, 1,
-0.7573517, 1.458439, -0.4269037, 0.7686275, 1, 0, 1,
-0.7555116, 0.2206593, -1.543748, 0.7647059, 1, 0, 1,
-0.7479895, 2.118614, -1.995623, 0.7568628, 1, 0, 1,
-0.7471142, -0.0215452, -1.363567, 0.7529412, 1, 0, 1,
-0.7457573, 1.694603, -0.6201152, 0.7450981, 1, 0, 1,
-0.7446439, -0.7606075, -3.206254, 0.7411765, 1, 0, 1,
-0.7414153, 2.329505, -0.1777107, 0.7333333, 1, 0, 1,
-0.7357702, 1.245978, -1.164139, 0.7294118, 1, 0, 1,
-0.7336798, -0.5100472, -1.79366, 0.7215686, 1, 0, 1,
-0.7315214, 0.8305582, 0.118399, 0.7176471, 1, 0, 1,
-0.7293865, 0.1935211, -1.378911, 0.7098039, 1, 0, 1,
-0.7284809, 1.397573, 0.1629582, 0.7058824, 1, 0, 1,
-0.7215432, 0.1981395, -0.477155, 0.6980392, 1, 0, 1,
-0.7199702, 0.4090838, -1.491377, 0.6901961, 1, 0, 1,
-0.7171252, 0.6938927, -0.5643929, 0.6862745, 1, 0, 1,
-0.7154238, -0.8431651, -1.682915, 0.6784314, 1, 0, 1,
-0.7140589, 2.090811, -1.113142, 0.6745098, 1, 0, 1,
-0.712597, -0.3457626, -2.550959, 0.6666667, 1, 0, 1,
-0.7125059, 2.417109, -2.143779, 0.6627451, 1, 0, 1,
-0.7124711, -0.6145178, -2.049039, 0.654902, 1, 0, 1,
-0.7092884, 0.226929, -1.762612, 0.6509804, 1, 0, 1,
-0.7070049, 0.3425986, -1.011464, 0.6431373, 1, 0, 1,
-0.7063367, 0.7164755, -1.423836, 0.6392157, 1, 0, 1,
-0.7041882, -1.208488, -1.253971, 0.6313726, 1, 0, 1,
-0.7001343, -1.298418, -3.072324, 0.627451, 1, 0, 1,
-0.6976578, -2.513708, -2.484015, 0.6196079, 1, 0, 1,
-0.6945948, 0.1163575, -2.50418, 0.6156863, 1, 0, 1,
-0.6932915, 0.6207487, -0.4799381, 0.6078432, 1, 0, 1,
-0.6891428, -1.319872, -1.095557, 0.6039216, 1, 0, 1,
-0.6846848, 0.8763009, -1.616309, 0.5960785, 1, 0, 1,
-0.6844596, 0.3052422, -1.162606, 0.5882353, 1, 0, 1,
-0.6837611, -1.416654, -1.037969, 0.5843138, 1, 0, 1,
-0.6760263, -0.3613142, -1.174263, 0.5764706, 1, 0, 1,
-0.6750798, 0.5924669, -0.195315, 0.572549, 1, 0, 1,
-0.6712396, 0.7061477, -1.47302, 0.5647059, 1, 0, 1,
-0.6664737, -1.338033, -3.426872, 0.5607843, 1, 0, 1,
-0.6627779, 0.5073422, -1.398622, 0.5529412, 1, 0, 1,
-0.6585546, -2.162474, -2.09951, 0.5490196, 1, 0, 1,
-0.6577027, 0.3382775, -0.9568144, 0.5411765, 1, 0, 1,
-0.6555153, -0.5601144, -0.4019797, 0.5372549, 1, 0, 1,
-0.6527307, 1.140962, -1.680342, 0.5294118, 1, 0, 1,
-0.6526858, 1.654048, -0.7166075, 0.5254902, 1, 0, 1,
-0.651401, -0.2358973, -2.210434, 0.5176471, 1, 0, 1,
-0.6513993, -0.5541856, -2.32914, 0.5137255, 1, 0, 1,
-0.650556, -0.6921914, -1.629362, 0.5058824, 1, 0, 1,
-0.6485021, 0.8380655, -0.3760942, 0.5019608, 1, 0, 1,
-0.6478969, -0.4154703, -2.416836, 0.4941176, 1, 0, 1,
-0.646675, 1.094291, -1.112296, 0.4862745, 1, 0, 1,
-0.6461295, 0.5323865, -1.459625, 0.4823529, 1, 0, 1,
-0.6436616, -1.463533, -2.910946, 0.4745098, 1, 0, 1,
-0.6409395, -0.7926757, -1.450611, 0.4705882, 1, 0, 1,
-0.6390417, 0.5546018, 1.105066, 0.4627451, 1, 0, 1,
-0.6367038, 0.004818495, -0.5947723, 0.4588235, 1, 0, 1,
-0.6364768, 1.233205, -1.12782, 0.4509804, 1, 0, 1,
-0.6328182, 1.246525, -1.502891, 0.4470588, 1, 0, 1,
-0.6307079, 1.230877, -0.7394738, 0.4392157, 1, 0, 1,
-0.6302818, -0.1855273, -2.488723, 0.4352941, 1, 0, 1,
-0.6268992, -0.2150484, -0.3078873, 0.427451, 1, 0, 1,
-0.6241609, -0.7918152, -2.897231, 0.4235294, 1, 0, 1,
-0.6176815, -1.304804, -1.613647, 0.4156863, 1, 0, 1,
-0.6136506, 0.7469873, -1.087974, 0.4117647, 1, 0, 1,
-0.6114751, -0.2559496, -0.7156771, 0.4039216, 1, 0, 1,
-0.6111228, -0.7653559, -2.54379, 0.3960784, 1, 0, 1,
-0.6083686, -0.5147318, -1.306961, 0.3921569, 1, 0, 1,
-0.6055168, 0.4901751, -0.2773738, 0.3843137, 1, 0, 1,
-0.6050766, 1.018761, -0.09708735, 0.3803922, 1, 0, 1,
-0.6022469, -0.08527999, -3.355547, 0.372549, 1, 0, 1,
-0.6017725, 0.2713743, -0.3592498, 0.3686275, 1, 0, 1,
-0.6008196, -1.890043, -4.192237, 0.3607843, 1, 0, 1,
-0.6004491, 1.975951, -1.048994, 0.3568628, 1, 0, 1,
-0.5952361, -0.2568969, -1.415064, 0.3490196, 1, 0, 1,
-0.5946062, 0.7044582, 0.1467068, 0.345098, 1, 0, 1,
-0.5921825, -0.1434802, -0.3228689, 0.3372549, 1, 0, 1,
-0.5861589, 0.3470606, -2.205648, 0.3333333, 1, 0, 1,
-0.5784014, -0.6960049, -2.282023, 0.3254902, 1, 0, 1,
-0.5759906, 1.030742, -0.003409067, 0.3215686, 1, 0, 1,
-0.5735181, 1.515724, 0.7562261, 0.3137255, 1, 0, 1,
-0.5732141, 1.105077, 0.2840675, 0.3098039, 1, 0, 1,
-0.5719115, -1.160734, -2.430955, 0.3019608, 1, 0, 1,
-0.571498, 1.075409, 0.42826, 0.2941177, 1, 0, 1,
-0.5713226, -1.167139, -0.9695633, 0.2901961, 1, 0, 1,
-0.5707694, -0.2115152, -2.086022, 0.282353, 1, 0, 1,
-0.5620356, 1.38495, -1.117322, 0.2784314, 1, 0, 1,
-0.5602993, 2.515748, 1.933514, 0.2705882, 1, 0, 1,
-0.5587039, -0.5008568, -1.10316, 0.2666667, 1, 0, 1,
-0.5583888, -0.9203696, -2.993862, 0.2588235, 1, 0, 1,
-0.5579284, 0.7733193, -2.38325, 0.254902, 1, 0, 1,
-0.5553693, 0.4788024, -0.2818899, 0.2470588, 1, 0, 1,
-0.5535497, 1.064198, -0.3365266, 0.2431373, 1, 0, 1,
-0.5517836, -0.8916241, -1.74472, 0.2352941, 1, 0, 1,
-0.5515268, 0.6188186, -0.310796, 0.2313726, 1, 0, 1,
-0.5491493, 0.4501065, -0.405019, 0.2235294, 1, 0, 1,
-0.5471843, 0.499237, -0.02136697, 0.2196078, 1, 0, 1,
-0.5448053, 0.2252248, -0.9677661, 0.2117647, 1, 0, 1,
-0.5443779, 1.523531, 0.06268383, 0.2078431, 1, 0, 1,
-0.5395229, 0.7310057, 0.05704979, 0.2, 1, 0, 1,
-0.5390722, -1.113512, -2.318642, 0.1921569, 1, 0, 1,
-0.5366879, -1.237037, -2.483439, 0.1882353, 1, 0, 1,
-0.5348753, 1.562944, -3.324659, 0.1803922, 1, 0, 1,
-0.530655, -0.03227605, -2.902203, 0.1764706, 1, 0, 1,
-0.5294589, 0.2409736, -2.693528, 0.1686275, 1, 0, 1,
-0.5293054, 0.818233, 0.3885003, 0.1647059, 1, 0, 1,
-0.5290779, -1.834993, -2.869898, 0.1568628, 1, 0, 1,
-0.5279598, 2.409688, -1.098958, 0.1529412, 1, 0, 1,
-0.519852, 0.1706152, 0.04139056, 0.145098, 1, 0, 1,
-0.5189328, 1.869216, -0.9864919, 0.1411765, 1, 0, 1,
-0.5172533, -1.93281, -2.269332, 0.1333333, 1, 0, 1,
-0.5142474, 0.08363498, -0.9418132, 0.1294118, 1, 0, 1,
-0.5061677, 1.025984, -0.1725171, 0.1215686, 1, 0, 1,
-0.5005595, -0.5619659, -3.013313, 0.1176471, 1, 0, 1,
-0.495409, 1.686651, -1.161354, 0.1098039, 1, 0, 1,
-0.4952976, 0.1346534, -1.09723, 0.1058824, 1, 0, 1,
-0.4904106, 0.5260417, -0.0391374, 0.09803922, 1, 0, 1,
-0.4883229, 0.01907139, -2.165675, 0.09019608, 1, 0, 1,
-0.4880457, 1.512671, 1.308185, 0.08627451, 1, 0, 1,
-0.4876486, -0.5710914, -2.624323, 0.07843138, 1, 0, 1,
-0.4802217, -0.1622731, -2.241054, 0.07450981, 1, 0, 1,
-0.4777515, -0.3446976, -1.440791, 0.06666667, 1, 0, 1,
-0.4754083, 0.4108207, -0.8375029, 0.0627451, 1, 0, 1,
-0.473607, -0.4991184, -3.543441, 0.05490196, 1, 0, 1,
-0.4717515, 0.1949922, -0.1898803, 0.05098039, 1, 0, 1,
-0.4687783, -0.5514789, -1.670568, 0.04313726, 1, 0, 1,
-0.4598167, -1.052873, -3.37852, 0.03921569, 1, 0, 1,
-0.4598109, 0.02210463, -2.815943, 0.03137255, 1, 0, 1,
-0.4580127, 2.032715, 0.2652369, 0.02745098, 1, 0, 1,
-0.4529429, 4.092331, 0.1954437, 0.01960784, 1, 0, 1,
-0.4517921, 0.873931, 0.7462229, 0.01568628, 1, 0, 1,
-0.4486214, -0.6724017, -2.467726, 0.007843138, 1, 0, 1,
-0.4472463, -0.01043727, -3.536102, 0.003921569, 1, 0, 1,
-0.4469306, -0.245982, -1.852509, 0, 1, 0.003921569, 1,
-0.4435582, -0.7350838, -1.840299, 0, 1, 0.01176471, 1,
-0.4422945, -0.5783626, -2.864438, 0, 1, 0.01568628, 1,
-0.436794, -0.8508524, -3.101264, 0, 1, 0.02352941, 1,
-0.434389, -1.109176, -3.504237, 0, 1, 0.02745098, 1,
-0.4327511, 1.863515, -1.552863, 0, 1, 0.03529412, 1,
-0.4315182, -0.5824721, -2.711628, 0, 1, 0.03921569, 1,
-0.4310117, 2.359813, 0.2460137, 0, 1, 0.04705882, 1,
-0.4234708, -0.8611771, -2.397559, 0, 1, 0.05098039, 1,
-0.4223348, 0.9268237, -0.01122594, 0, 1, 0.05882353, 1,
-0.4223193, -2.356508, -1.373889, 0, 1, 0.0627451, 1,
-0.4174036, -0.4529082, -2.802301, 0, 1, 0.07058824, 1,
-0.4119066, -1.455096, -3.892269, 0, 1, 0.07450981, 1,
-0.406042, 0.3740514, 0.9420129, 0, 1, 0.08235294, 1,
-0.405598, 1.126323, -1.123711, 0, 1, 0.08627451, 1,
-0.4035786, -0.03800009, -0.3233709, 0, 1, 0.09411765, 1,
-0.4006348, -0.5075296, -3.257779, 0, 1, 0.1019608, 1,
-0.4002925, 2.229389, 1.904739, 0, 1, 0.1058824, 1,
-0.3988704, 1.046576, -0.7416753, 0, 1, 0.1137255, 1,
-0.3947377, 1.107976, -1.075646, 0, 1, 0.1176471, 1,
-0.3946836, 1.078938, -0.3011492, 0, 1, 0.1254902, 1,
-0.3921424, 0.0153777, -0.6063887, 0, 1, 0.1294118, 1,
-0.3905967, -0.3853609, -2.98676, 0, 1, 0.1372549, 1,
-0.3894214, 0.8093725, 0.84484, 0, 1, 0.1411765, 1,
-0.3884669, -0.8323972, -2.449391, 0, 1, 0.1490196, 1,
-0.3877634, 0.3180979, -1.646108, 0, 1, 0.1529412, 1,
-0.3873495, -0.2536887, -2.060981, 0, 1, 0.1607843, 1,
-0.3816456, 1.492826, 1.73836, 0, 1, 0.1647059, 1,
-0.3747996, -0.9610874, -3.417974, 0, 1, 0.172549, 1,
-0.3702838, 1.274282, -1.696731, 0, 1, 0.1764706, 1,
-0.367645, 0.598797, -0.7621527, 0, 1, 0.1843137, 1,
-0.3654825, -0.3925872, -1.749949, 0, 1, 0.1882353, 1,
-0.3553271, -0.8587742, -2.018384, 0, 1, 0.1960784, 1,
-0.354798, 1.819718, 0.6250495, 0, 1, 0.2039216, 1,
-0.3521793, 0.5765496, -0.5166904, 0, 1, 0.2078431, 1,
-0.3519733, 0.3614216, 1.909685, 0, 1, 0.2156863, 1,
-0.3436826, -0.2812235, -2.111853, 0, 1, 0.2196078, 1,
-0.3373135, -1.128839, -2.30569, 0, 1, 0.227451, 1,
-0.3296118, 0.3275256, -1.218371, 0, 1, 0.2313726, 1,
-0.3285143, 1.584391, 0.3446629, 0, 1, 0.2392157, 1,
-0.3259144, 0.608929, -1.093049, 0, 1, 0.2431373, 1,
-0.3233589, -0.7101853, -1.563753, 0, 1, 0.2509804, 1,
-0.3176078, -0.6557018, -3.347341, 0, 1, 0.254902, 1,
-0.317406, -0.5036196, -1.989232, 0, 1, 0.2627451, 1,
-0.3169912, -0.8405121, -3.256248, 0, 1, 0.2666667, 1,
-0.3139455, 0.7243677, -1.105045, 0, 1, 0.2745098, 1,
-0.3136151, 0.6798806, 0.2454615, 0, 1, 0.2784314, 1,
-0.3065941, -0.7691022, -2.755027, 0, 1, 0.2862745, 1,
-0.305676, 0.8352464, 0.778901, 0, 1, 0.2901961, 1,
-0.3003778, -1.026831, -2.591937, 0, 1, 0.2980392, 1,
-0.3001226, -0.5937867, -4.721205, 0, 1, 0.3058824, 1,
-0.2951645, 0.6364623, -1.665286, 0, 1, 0.3098039, 1,
-0.2881029, -0.9940642, -1.743124, 0, 1, 0.3176471, 1,
-0.2877775, -0.8869133, -2.303699, 0, 1, 0.3215686, 1,
-0.2873039, -1.371474, -4.423126, 0, 1, 0.3294118, 1,
-0.2849768, 1.586574, -0.8181088, 0, 1, 0.3333333, 1,
-0.2847941, -0.3931433, -2.021327, 0, 1, 0.3411765, 1,
-0.2723499, 0.3856111, 0.4667917, 0, 1, 0.345098, 1,
-0.2717523, 0.1265035, 0.1989207, 0, 1, 0.3529412, 1,
-0.2709221, 0.706121, -1.619062, 0, 1, 0.3568628, 1,
-0.2689519, 1.679479, 0.3443504, 0, 1, 0.3647059, 1,
-0.2658349, 0.7606578, 1.06611, 0, 1, 0.3686275, 1,
-0.2645826, -1.131157, -1.734569, 0, 1, 0.3764706, 1,
-0.263618, 0.3091206, 0.8375685, 0, 1, 0.3803922, 1,
-0.2634205, -0.4994454, -2.884398, 0, 1, 0.3882353, 1,
-0.256971, -0.8120095, -1.348129, 0, 1, 0.3921569, 1,
-0.2557627, 1.804489, 0.9129892, 0, 1, 0.4, 1,
-0.2547984, 1.231852, 1.586313, 0, 1, 0.4078431, 1,
-0.2544651, 1.25976, 0.839658, 0, 1, 0.4117647, 1,
-0.2531611, 1.430275, 0.6383715, 0, 1, 0.4196078, 1,
-0.2472187, -1.70465, -2.877629, 0, 1, 0.4235294, 1,
-0.2456844, -0.3204629, -1.321618, 0, 1, 0.4313726, 1,
-0.2418983, 0.523927, -0.9793771, 0, 1, 0.4352941, 1,
-0.2404878, -2.729691, -1.81826, 0, 1, 0.4431373, 1,
-0.2371578, 0.1978119, 0.9699379, 0, 1, 0.4470588, 1,
-0.2355946, -1.524059, -4.085306, 0, 1, 0.454902, 1,
-0.2350032, 0.3101638, 0.9958599, 0, 1, 0.4588235, 1,
-0.2222962, -0.8325053, -3.374817, 0, 1, 0.4666667, 1,
-0.2218991, 1.365896, 0.9786292, 0, 1, 0.4705882, 1,
-0.2214599, 0.07968795, -2.332795, 0, 1, 0.4784314, 1,
-0.2206841, -0.2158327, -1.953043, 0, 1, 0.4823529, 1,
-0.2163588, 0.214255, -1.38113, 0, 1, 0.4901961, 1,
-0.2163326, 0.7508861, -1.19602, 0, 1, 0.4941176, 1,
-0.2151054, -0.4244313, -2.849946, 0, 1, 0.5019608, 1,
-0.2142162, 0.5124268, -1.452202, 0, 1, 0.509804, 1,
-0.2140266, -0.5964547, -1.844822, 0, 1, 0.5137255, 1,
-0.2068429, -0.8637376, -2.85984, 0, 1, 0.5215687, 1,
-0.2035569, -0.7534602, -4.904962, 0, 1, 0.5254902, 1,
-0.2021032, 0.9594803, 1.016113, 0, 1, 0.5333334, 1,
-0.200526, -1.581525, -3.029515, 0, 1, 0.5372549, 1,
-0.1994081, -0.1825558, -2.454958, 0, 1, 0.5450981, 1,
-0.1967713, -0.3748105, -3.823549, 0, 1, 0.5490196, 1,
-0.1962346, 0.9895205, -2.505153, 0, 1, 0.5568628, 1,
-0.1939665, 0.01992375, -1.542412, 0, 1, 0.5607843, 1,
-0.1933195, 1.985523, -1.502249, 0, 1, 0.5686275, 1,
-0.1932319, -1.036688, -3.601564, 0, 1, 0.572549, 1,
-0.192094, -1.475614, -4.333523, 0, 1, 0.5803922, 1,
-0.184657, 0.7513161, -0.8125288, 0, 1, 0.5843138, 1,
-0.1817788, 1.296606, 0.04855254, 0, 1, 0.5921569, 1,
-0.1752636, 1.316458, 1.168454, 0, 1, 0.5960785, 1,
-0.174295, 0.02898981, -0.04799488, 0, 1, 0.6039216, 1,
-0.1731925, -0.3795882, -2.95059, 0, 1, 0.6117647, 1,
-0.164811, -0.3518668, -2.082779, 0, 1, 0.6156863, 1,
-0.1604033, -1.956523, -2.045276, 0, 1, 0.6235294, 1,
-0.1586425, -0.3569869, -1.994353, 0, 1, 0.627451, 1,
-0.1550432, -0.9642341, -4.083609, 0, 1, 0.6352941, 1,
-0.1547398, -0.3553078, -3.990394, 0, 1, 0.6392157, 1,
-0.152439, -1.225334, -2.181953, 0, 1, 0.6470588, 1,
-0.1473495, 1.845054, -0.4339885, 0, 1, 0.6509804, 1,
-0.141712, 0.5293113, -1.001585, 0, 1, 0.6588235, 1,
-0.1412487, 0.415493, -0.5368096, 0, 1, 0.6627451, 1,
-0.1380734, 1.002431, 0.2130372, 0, 1, 0.6705883, 1,
-0.1376916, -0.7379303, -1.691927, 0, 1, 0.6745098, 1,
-0.1345144, 0.6906047, -2.494896, 0, 1, 0.682353, 1,
-0.1340877, 1.074176, 1.86251, 0, 1, 0.6862745, 1,
-0.1321169, -0.5394668, -2.477013, 0, 1, 0.6941177, 1,
-0.1313589, -0.2611532, -2.267968, 0, 1, 0.7019608, 1,
-0.126735, 0.8210205, 0.1738838, 0, 1, 0.7058824, 1,
-0.1199205, 0.3813114, 0.815275, 0, 1, 0.7137255, 1,
-0.1179743, 0.3855568, -1.78938, 0, 1, 0.7176471, 1,
-0.1160422, 0.3651219, -0.2478184, 0, 1, 0.7254902, 1,
-0.1153491, 0.8546342, -0.77061, 0, 1, 0.7294118, 1,
-0.1145325, -0.2120216, -3.544248, 0, 1, 0.7372549, 1,
-0.1124206, 1.055635, -0.1990388, 0, 1, 0.7411765, 1,
-0.1061011, 1.848788, 0.5874503, 0, 1, 0.7490196, 1,
-0.1047447, 0.1369374, -0.8257115, 0, 1, 0.7529412, 1,
-0.1032098, -0.03969949, -1.364665, 0, 1, 0.7607843, 1,
-0.09998628, 1.285236, -1.459179, 0, 1, 0.7647059, 1,
-0.09819926, -0.4149976, -3.844885, 0, 1, 0.772549, 1,
-0.09644497, -0.1812745, -2.220566, 0, 1, 0.7764706, 1,
-0.09612551, -1.844725, -4.142808, 0, 1, 0.7843137, 1,
-0.0959402, 0.917664, 1.434893, 0, 1, 0.7882353, 1,
-0.09467796, 1.940258, -1.365982, 0, 1, 0.7960784, 1,
-0.09460206, 0.4110645, -0.7109938, 0, 1, 0.8039216, 1,
-0.09193518, -0.3564379, -3.680579, 0, 1, 0.8078431, 1,
-0.08671927, 2.256678, -0.2696244, 0, 1, 0.8156863, 1,
-0.08455037, -0.3533152, -2.751012, 0, 1, 0.8196079, 1,
-0.08256716, 2.131237, 0.804982, 0, 1, 0.827451, 1,
-0.08087093, 0.35963, -0.9509095, 0, 1, 0.8313726, 1,
-0.07649551, 2.965177, 0.9354809, 0, 1, 0.8392157, 1,
-0.07332545, 0.8155919, -0.8575642, 0, 1, 0.8431373, 1,
-0.07148312, 0.9891515, 0.9083712, 0, 1, 0.8509804, 1,
-0.0699873, -0.6240504, -3.738849, 0, 1, 0.854902, 1,
-0.05810051, -0.8810472, -3.570826, 0, 1, 0.8627451, 1,
-0.05751779, 1.724934, 2.430229, 0, 1, 0.8666667, 1,
-0.05291288, 1.082989, 2.103311, 0, 1, 0.8745098, 1,
-0.05058732, 0.2364458, -0.569128, 0, 1, 0.8784314, 1,
-0.04742186, 0.7414394, -0.0129811, 0, 1, 0.8862745, 1,
-0.04706968, 0.4605929, -0.7120654, 0, 1, 0.8901961, 1,
-0.0440673, -0.166604, -2.911236, 0, 1, 0.8980392, 1,
-0.04224189, 0.6426623, -1.564195, 0, 1, 0.9058824, 1,
-0.042158, 1.222712, 0.9027435, 0, 1, 0.9098039, 1,
-0.03971782, 0.3462737, 2.060409, 0, 1, 0.9176471, 1,
-0.03281191, 1.305503, 0.03471331, 0, 1, 0.9215686, 1,
-0.02753966, 2.306895, 0.7872194, 0, 1, 0.9294118, 1,
-0.0190916, 0.3967777, -0.008941289, 0, 1, 0.9333333, 1,
-0.01046543, 0.8251092, 0.2067844, 0, 1, 0.9411765, 1,
-0.009167032, -3.002763, -2.587912, 0, 1, 0.945098, 1,
-0.007211476, -0.7214256, -2.945817, 0, 1, 0.9529412, 1,
-0.00708203, -1.231641, -3.024732, 0, 1, 0.9568627, 1,
-0.00701671, 0.3018624, -0.1528242, 0, 1, 0.9647059, 1,
-0.002000036, 1.307808, -0.5466312, 0, 1, 0.9686275, 1,
0.003661019, -1.178215, 3.172131, 0, 1, 0.9764706, 1,
0.009624192, -0.01375135, 1.793534, 0, 1, 0.9803922, 1,
0.01109736, 0.2821631, 1.579541, 0, 1, 0.9882353, 1,
0.01244688, 0.6042679, -1.038258, 0, 1, 0.9921569, 1,
0.01528011, 0.6162281, 0.6839561, 0, 1, 1, 1,
0.01674902, -0.4980052, 3.140769, 0, 0.9921569, 1, 1,
0.0182945, 0.7665942, -0.04575615, 0, 0.9882353, 1, 1,
0.01943059, -0.1381656, 0.4373551, 0, 0.9803922, 1, 1,
0.02736123, -1.283198, 4.283411, 0, 0.9764706, 1, 1,
0.02829553, 1.067805, 0.4484049, 0, 0.9686275, 1, 1,
0.04133026, -2.478465, 2.47228, 0, 0.9647059, 1, 1,
0.04218659, -1.192919, 2.656132, 0, 0.9568627, 1, 1,
0.04297389, 2.33699, 1.589682, 0, 0.9529412, 1, 1,
0.04475478, 1.173236, -0.586112, 0, 0.945098, 1, 1,
0.0485095, -1.275757, 2.587745, 0, 0.9411765, 1, 1,
0.05644482, -0.8123909, 1.14139, 0, 0.9333333, 1, 1,
0.05816745, -0.5740929, 3.051393, 0, 0.9294118, 1, 1,
0.06016324, -0.5345223, 3.323344, 0, 0.9215686, 1, 1,
0.06054856, -0.1488644, 3.762968, 0, 0.9176471, 1, 1,
0.06134528, -0.2499236, 4.618942, 0, 0.9098039, 1, 1,
0.06230164, -0.6572179, 2.858099, 0, 0.9058824, 1, 1,
0.06472021, 0.4734901, -0.425803, 0, 0.8980392, 1, 1,
0.06576274, 0.1666265, -0.9335167, 0, 0.8901961, 1, 1,
0.07142799, -0.4604836, 2.252591, 0, 0.8862745, 1, 1,
0.07924849, 0.06165925, 1.533053, 0, 0.8784314, 1, 1,
0.07965361, 0.02650819, 1.146405, 0, 0.8745098, 1, 1,
0.08665294, -1.026132, 4.216421, 0, 0.8666667, 1, 1,
0.08759978, -0.463637, 4.401137, 0, 0.8627451, 1, 1,
0.08894341, 1.124818, -0.689598, 0, 0.854902, 1, 1,
0.09254349, 2.046693, -1.455747, 0, 0.8509804, 1, 1,
0.09501368, -0.1056401, 2.28688, 0, 0.8431373, 1, 1,
0.09955238, 2.052119, 0.06407741, 0, 0.8392157, 1, 1,
0.1029331, 1.351011, 2.364522, 0, 0.8313726, 1, 1,
0.1044327, -1.381421, 2.469316, 0, 0.827451, 1, 1,
0.1068313, 0.07304525, 0.04035032, 0, 0.8196079, 1, 1,
0.1089078, -1.002737, 2.534393, 0, 0.8156863, 1, 1,
0.108958, 0.09316073, 0.6453652, 0, 0.8078431, 1, 1,
0.1117986, -0.5520096, 3.081134, 0, 0.8039216, 1, 1,
0.1131955, 0.3905118, 1.415179, 0, 0.7960784, 1, 1,
0.1186678, -0.8436502, 0.9716127, 0, 0.7882353, 1, 1,
0.118937, -0.4217832, 4.229881, 0, 0.7843137, 1, 1,
0.1218879, -0.04478829, 3.858902, 0, 0.7764706, 1, 1,
0.1219368, -0.4665063, 1.014298, 0, 0.772549, 1, 1,
0.1224167, -0.141672, 4.550904, 0, 0.7647059, 1, 1,
0.1292337, -0.06445279, 1.422318, 0, 0.7607843, 1, 1,
0.1318593, -0.5002576, 1.911405, 0, 0.7529412, 1, 1,
0.1350819, 0.9575178, -0.1481035, 0, 0.7490196, 1, 1,
0.1368612, -0.5186644, 3.574201, 0, 0.7411765, 1, 1,
0.1379681, -0.3550053, 2.041757, 0, 0.7372549, 1, 1,
0.1404057, 1.137932, 0.5926571, 0, 0.7294118, 1, 1,
0.1408125, -0.908573, 4.82735, 0, 0.7254902, 1, 1,
0.1427451, -2.027616, 3.251125, 0, 0.7176471, 1, 1,
0.1429951, 0.3183436, 1.13159, 0, 0.7137255, 1, 1,
0.1494841, -2.282889, 4.180861, 0, 0.7058824, 1, 1,
0.1551145, -0.5652415, 4.760286, 0, 0.6980392, 1, 1,
0.1572986, -0.191781, 2.936119, 0, 0.6941177, 1, 1,
0.1639864, -0.7490738, 3.440099, 0, 0.6862745, 1, 1,
0.1684366, -1.147839, 2.15242, 0, 0.682353, 1, 1,
0.168481, 0.01774152, -0.1325527, 0, 0.6745098, 1, 1,
0.172402, -0.06103545, -0.3658779, 0, 0.6705883, 1, 1,
0.1734523, 0.2730806, 0.7080653, 0, 0.6627451, 1, 1,
0.1843341, -1.371644, 3.327529, 0, 0.6588235, 1, 1,
0.1869394, -0.1395711, 1.32863, 0, 0.6509804, 1, 1,
0.1871164, -1.094748, 3.311803, 0, 0.6470588, 1, 1,
0.1879514, 0.3978647, 0.5424914, 0, 0.6392157, 1, 1,
0.1890966, -0.4076858, 1.171813, 0, 0.6352941, 1, 1,
0.1912958, -0.1145277, 0.708944, 0, 0.627451, 1, 1,
0.1944096, 0.8190557, 0.8242227, 0, 0.6235294, 1, 1,
0.1952358, -0.4508969, 4.252125, 0, 0.6156863, 1, 1,
0.1963064, -1.161998, 4.035045, 0, 0.6117647, 1, 1,
0.2006912, -0.3965445, 1.494484, 0, 0.6039216, 1, 1,
0.2017299, 0.223, 2.318139, 0, 0.5960785, 1, 1,
0.2039776, -2.019247, 2.583054, 0, 0.5921569, 1, 1,
0.2053054, -1.884296, 3.338854, 0, 0.5843138, 1, 1,
0.2072257, -0.3633617, 2.156097, 0, 0.5803922, 1, 1,
0.2078408, 0.4168347, 0.5714328, 0, 0.572549, 1, 1,
0.2088362, -2.426795, 3.199914, 0, 0.5686275, 1, 1,
0.2092686, -1.085367, 2.277169, 0, 0.5607843, 1, 1,
0.2097742, 0.6523332, 0.553158, 0, 0.5568628, 1, 1,
0.2099921, -0.8290876, 3.047644, 0, 0.5490196, 1, 1,
0.2119891, 1.014905, 1.151069, 0, 0.5450981, 1, 1,
0.2131924, 0.9666603, -0.08293334, 0, 0.5372549, 1, 1,
0.2199859, 1.552927, -1.016224, 0, 0.5333334, 1, 1,
0.2211595, 1.299775, 0.6297094, 0, 0.5254902, 1, 1,
0.2212524, -1.143935, 0.9738343, 0, 0.5215687, 1, 1,
0.2230862, 0.9626837, -0.1118806, 0, 0.5137255, 1, 1,
0.2234035, 0.3459455, 1.66991, 0, 0.509804, 1, 1,
0.2318042, -1.062618, 4.557695, 0, 0.5019608, 1, 1,
0.2340774, 0.1448161, 1.403174, 0, 0.4941176, 1, 1,
0.2406041, 0.1014681, 1.844719, 0, 0.4901961, 1, 1,
0.2492914, -0.1930928, 0.5909743, 0, 0.4823529, 1, 1,
0.2556464, -1.556486, 1.911171, 0, 0.4784314, 1, 1,
0.2592923, 0.4541721, 1.899862, 0, 0.4705882, 1, 1,
0.2600719, -1.370506, 3.728651, 0, 0.4666667, 1, 1,
0.2630072, -1.404694, 1.213369, 0, 0.4588235, 1, 1,
0.2671481, 1.801981, 0.3435175, 0, 0.454902, 1, 1,
0.2738085, 0.3774011, 0.5463154, 0, 0.4470588, 1, 1,
0.2779489, -1.292311, 3.34385, 0, 0.4431373, 1, 1,
0.2858708, -0.3480807, 2.706849, 0, 0.4352941, 1, 1,
0.2887633, -0.3436806, 2.436548, 0, 0.4313726, 1, 1,
0.2904534, -0.4346716, 4.273651, 0, 0.4235294, 1, 1,
0.2915654, -2.21894, 3.029483, 0, 0.4196078, 1, 1,
0.2929933, -1.203413, 3.523232, 0, 0.4117647, 1, 1,
0.2948551, -1.21034, 3.22912, 0, 0.4078431, 1, 1,
0.2969432, -0.6437287, 3.480318, 0, 0.4, 1, 1,
0.304403, -2.321254, 1.611569, 0, 0.3921569, 1, 1,
0.3053812, -1.642361, 3.215116, 0, 0.3882353, 1, 1,
0.3132259, -0.3735565, -0.4225062, 0, 0.3803922, 1, 1,
0.3205308, -0.8826324, 1.033561, 0, 0.3764706, 1, 1,
0.3208378, 0.9140291, -0.2326492, 0, 0.3686275, 1, 1,
0.3244211, -0.728869, 2.317889, 0, 0.3647059, 1, 1,
0.3244836, -0.9409181, 3.474087, 0, 0.3568628, 1, 1,
0.3261337, -0.2858129, 2.083707, 0, 0.3529412, 1, 1,
0.3263918, 0.4156268, 1.944287, 0, 0.345098, 1, 1,
0.3279865, -0.5730762, 2.464798, 0, 0.3411765, 1, 1,
0.3306525, -1.099463, 3.248221, 0, 0.3333333, 1, 1,
0.3315613, -0.2354054, 3.436714, 0, 0.3294118, 1, 1,
0.3333741, -0.08441972, 3.177511, 0, 0.3215686, 1, 1,
0.334955, 0.4819535, 0.1948986, 0, 0.3176471, 1, 1,
0.3395559, -0.03176945, 2.083131, 0, 0.3098039, 1, 1,
0.3412639, -0.4272666, 1.893027, 0, 0.3058824, 1, 1,
0.3429791, 0.5182555, 0.8660558, 0, 0.2980392, 1, 1,
0.3491114, 1.15837, 0.7094326, 0, 0.2901961, 1, 1,
0.3515179, -0.2676668, 0.8994752, 0, 0.2862745, 1, 1,
0.3560297, 1.453065, 0.1851341, 0, 0.2784314, 1, 1,
0.3565785, -0.9062312, 2.681053, 0, 0.2745098, 1, 1,
0.3619429, -0.3326677, 2.559232, 0, 0.2666667, 1, 1,
0.3629583, 1.174621, 1.193477, 0, 0.2627451, 1, 1,
0.3633648, 1.616286, 1.543992, 0, 0.254902, 1, 1,
0.3667547, -0.4006366, 2.122069, 0, 0.2509804, 1, 1,
0.3696669, -0.3986931, 4.230871, 0, 0.2431373, 1, 1,
0.3743422, -1.551115, 3.232832, 0, 0.2392157, 1, 1,
0.3881648, 0.5501253, 0.2315593, 0, 0.2313726, 1, 1,
0.3883536, -0.4929124, 3.004839, 0, 0.227451, 1, 1,
0.3891011, -1.200983, 2.823323, 0, 0.2196078, 1, 1,
0.3908955, -2.23105, 1.398367, 0, 0.2156863, 1, 1,
0.391603, -1.712789, 3.197855, 0, 0.2078431, 1, 1,
0.3921093, 0.6614109, 0.1000418, 0, 0.2039216, 1, 1,
0.3927879, 0.9124855, 1.385245, 0, 0.1960784, 1, 1,
0.3931428, -0.3590443, 2.802818, 0, 0.1882353, 1, 1,
0.3950453, 0.1268404, 1.398568, 0, 0.1843137, 1, 1,
0.3984334, -0.8468945, 3.56744, 0, 0.1764706, 1, 1,
0.4009818, -1.153978, 3.467392, 0, 0.172549, 1, 1,
0.4017906, 0.2674727, 1.229631, 0, 0.1647059, 1, 1,
0.4116648, -0.1682609, 1.652459, 0, 0.1607843, 1, 1,
0.4172508, 0.658765, -0.1316805, 0, 0.1529412, 1, 1,
0.4197595, 0.9440909, -0.4817109, 0, 0.1490196, 1, 1,
0.4208755, 0.8972958, 1.934943, 0, 0.1411765, 1, 1,
0.4209812, -0.2002839, 1.300837, 0, 0.1372549, 1, 1,
0.4264621, 0.9530414, 0.2174362, 0, 0.1294118, 1, 1,
0.4278554, 0.6535864, 2.053671, 0, 0.1254902, 1, 1,
0.4325016, -0.3876804, 3.914026, 0, 0.1176471, 1, 1,
0.4328757, -0.321718, -0.3315932, 0, 0.1137255, 1, 1,
0.4336271, 0.3366897, 0.6851922, 0, 0.1058824, 1, 1,
0.4341255, -1.027217, 2.151798, 0, 0.09803922, 1, 1,
0.4384753, -0.3254305, 1.412983, 0, 0.09411765, 1, 1,
0.4408295, -0.57996, 2.130249, 0, 0.08627451, 1, 1,
0.4431435, 0.7922931, 0.7072799, 0, 0.08235294, 1, 1,
0.4443238, 0.844929, -0.09540479, 0, 0.07450981, 1, 1,
0.4471056, -0.924639, 3.310495, 0, 0.07058824, 1, 1,
0.450412, 0.004683003, 1.340276, 0, 0.0627451, 1, 1,
0.4513623, -0.2352009, 1.446161, 0, 0.05882353, 1, 1,
0.453733, 0.7285764, 1.727008, 0, 0.05098039, 1, 1,
0.4539358, -0.3362962, 2.978053, 0, 0.04705882, 1, 1,
0.4564966, 0.1268905, 0.7382835, 0, 0.03921569, 1, 1,
0.456933, -1.10652, 2.869121, 0, 0.03529412, 1, 1,
0.4588223, 0.05671216, 2.197107, 0, 0.02745098, 1, 1,
0.4612326, 1.005413, 0.5333939, 0, 0.02352941, 1, 1,
0.4620214, -1.025746, 4.049908, 0, 0.01568628, 1, 1,
0.4629548, 0.6777247, -0.5747653, 0, 0.01176471, 1, 1,
0.4636361, -1.287939, 1.211263, 0, 0.003921569, 1, 1,
0.469501, -0.8171395, 3.333384, 0.003921569, 0, 1, 1,
0.4705439, -0.1577554, 3.365909, 0.007843138, 0, 1, 1,
0.4707243, -2.183647, 3.693934, 0.01568628, 0, 1, 1,
0.4725091, -1.031991, 3.656606, 0.01960784, 0, 1, 1,
0.4753708, 0.09565235, 0.3677265, 0.02745098, 0, 1, 1,
0.4770595, 1.753623, 0.6002255, 0.03137255, 0, 1, 1,
0.4853384, 0.4971366, 0.02752151, 0.03921569, 0, 1, 1,
0.4856421, 0.5753191, 1.911899, 0.04313726, 0, 1, 1,
0.4894483, 0.5284671, 1.327641, 0.05098039, 0, 1, 1,
0.4903349, -0.4170133, 0.2832247, 0.05490196, 0, 1, 1,
0.4947242, -1.391548, 3.837082, 0.0627451, 0, 1, 1,
0.4990467, 1.759896, 0.1182532, 0.06666667, 0, 1, 1,
0.5003357, -0.4257806, 3.157127, 0.07450981, 0, 1, 1,
0.5013368, -2.295548, 2.73503, 0.07843138, 0, 1, 1,
0.5020361, 2.009924, -0.3598209, 0.08627451, 0, 1, 1,
0.5038353, 0.5790132, 1.923878, 0.09019608, 0, 1, 1,
0.511372, 1.043709, -0.1729796, 0.09803922, 0, 1, 1,
0.5140699, 0.8670844, 0.451974, 0.1058824, 0, 1, 1,
0.5147667, 0.3213765, 2.054454, 0.1098039, 0, 1, 1,
0.516462, -1.24597, 2.167722, 0.1176471, 0, 1, 1,
0.5235278, 0.8297105, 0.1465447, 0.1215686, 0, 1, 1,
0.526814, 0.9686991, 0.2371451, 0.1294118, 0, 1, 1,
0.5282797, -1.50536, 2.391456, 0.1333333, 0, 1, 1,
0.5289133, -1.322847, 3.018874, 0.1411765, 0, 1, 1,
0.5396661, -0.3175235, 1.916915, 0.145098, 0, 1, 1,
0.5412154, 0.2656899, 0.1800225, 0.1529412, 0, 1, 1,
0.5503113, -0.4073198, 2.774527, 0.1568628, 0, 1, 1,
0.5519878, 1.267161, 1.043444, 0.1647059, 0, 1, 1,
0.5531758, 0.6718535, -1.00045, 0.1686275, 0, 1, 1,
0.5630152, -0.6608018, 2.187044, 0.1764706, 0, 1, 1,
0.565945, -0.5789566, 3.699017, 0.1803922, 0, 1, 1,
0.567715, -0.3126508, 3.837381, 0.1882353, 0, 1, 1,
0.5721546, 0.05783734, 1.760399, 0.1921569, 0, 1, 1,
0.57267, -1.266312, 2.627616, 0.2, 0, 1, 1,
0.5826772, -1.238588, 2.507239, 0.2078431, 0, 1, 1,
0.585471, 0.7360551, 0.3742312, 0.2117647, 0, 1, 1,
0.5903926, -1.531092, 3.003184, 0.2196078, 0, 1, 1,
0.5908453, 0.5625502, 0.2303223, 0.2235294, 0, 1, 1,
0.5912102, -1.326088, 2.011772, 0.2313726, 0, 1, 1,
0.5932401, 0.1101718, 1.481823, 0.2352941, 0, 1, 1,
0.5950831, 0.04249996, 3.552209, 0.2431373, 0, 1, 1,
0.5958489, -0.2995734, 0.6444016, 0.2470588, 0, 1, 1,
0.5967247, -0.5079202, 2.05533, 0.254902, 0, 1, 1,
0.6058734, -0.556882, 1.033862, 0.2588235, 0, 1, 1,
0.6077213, 1.849963, 0.9515023, 0.2666667, 0, 1, 1,
0.6089113, 1.401731, 0.2921415, 0.2705882, 0, 1, 1,
0.6127557, -0.1382315, -0.1466648, 0.2784314, 0, 1, 1,
0.6188623, 0.4172995, 1.872544, 0.282353, 0, 1, 1,
0.6231912, -1.427846, 3.649062, 0.2901961, 0, 1, 1,
0.6274343, 0.9517426, 0.5968359, 0.2941177, 0, 1, 1,
0.628453, 0.1480316, 0.438794, 0.3019608, 0, 1, 1,
0.631927, 0.02504346, -0.003464604, 0.3098039, 0, 1, 1,
0.6323185, -0.08899777, 0.539298, 0.3137255, 0, 1, 1,
0.6330155, 1.443706, 0.05991174, 0.3215686, 0, 1, 1,
0.6342146, 0.4147784, 3.795216, 0.3254902, 0, 1, 1,
0.6356503, 0.216406, 0.5945825, 0.3333333, 0, 1, 1,
0.6361145, 0.01427025, 0.5864816, 0.3372549, 0, 1, 1,
0.6482013, 0.4684161, 0.9570682, 0.345098, 0, 1, 1,
0.6482229, -0.531749, 1.274517, 0.3490196, 0, 1, 1,
0.6483331, 1.727083, -0.8608844, 0.3568628, 0, 1, 1,
0.6494641, -1.196342, 0.7729512, 0.3607843, 0, 1, 1,
0.6548396, 1.153232, 1.739207, 0.3686275, 0, 1, 1,
0.6554505, -0.5626699, 2.646359, 0.372549, 0, 1, 1,
0.6622975, 0.5992666, -0.7135116, 0.3803922, 0, 1, 1,
0.6650725, 0.5910951, 0.3180195, 0.3843137, 0, 1, 1,
0.667822, -0.4214288, 1.550683, 0.3921569, 0, 1, 1,
0.6780273, -0.08541521, 0.178906, 0.3960784, 0, 1, 1,
0.6823719, 1.879695, 0.2201594, 0.4039216, 0, 1, 1,
0.6850106, -0.8304027, 2.224982, 0.4117647, 0, 1, 1,
0.6988067, 0.03900299, 2.341531, 0.4156863, 0, 1, 1,
0.7046652, 1.620634, 2.307088, 0.4235294, 0, 1, 1,
0.7068129, -1.323286, 1.131123, 0.427451, 0, 1, 1,
0.7074821, -0.1787482, 0.830295, 0.4352941, 0, 1, 1,
0.7090954, -0.4224546, 1.985849, 0.4392157, 0, 1, 1,
0.7116557, -1.18758, 4.303898, 0.4470588, 0, 1, 1,
0.7137305, 1.074302, 0.9647741, 0.4509804, 0, 1, 1,
0.7143143, 0.9550654, -0.974404, 0.4588235, 0, 1, 1,
0.7156504, 1.614798, 0.4888931, 0.4627451, 0, 1, 1,
0.7176652, 0.4343478, 1.784491, 0.4705882, 0, 1, 1,
0.7188241, -1.13389, 2.492177, 0.4745098, 0, 1, 1,
0.7232291, -2.267258, 3.181401, 0.4823529, 0, 1, 1,
0.7233214, -2.686755, 4.107614, 0.4862745, 0, 1, 1,
0.7253116, -0.1419252, 0.3928136, 0.4941176, 0, 1, 1,
0.726549, -0.7641709, 1.855473, 0.5019608, 0, 1, 1,
0.7295998, -1.205225, 1.473932, 0.5058824, 0, 1, 1,
0.73801, 0.86441, 2.550963, 0.5137255, 0, 1, 1,
0.7407696, 1.010601, 1.500503, 0.5176471, 0, 1, 1,
0.7441572, -1.132157, 0.7866315, 0.5254902, 0, 1, 1,
0.7459553, 0.1839547, 0.9229171, 0.5294118, 0, 1, 1,
0.7521175, -0.5195081, 2.047242, 0.5372549, 0, 1, 1,
0.7527315, -0.7179022, 1.780707, 0.5411765, 0, 1, 1,
0.7688174, -1.151494, 2.339216, 0.5490196, 0, 1, 1,
0.7753658, -0.2547634, 2.669382, 0.5529412, 0, 1, 1,
0.7806579, 1.344445, 0.02704244, 0.5607843, 0, 1, 1,
0.7814549, -0.7180706, 3.348245, 0.5647059, 0, 1, 1,
0.7815132, 0.9121566, 0.9563096, 0.572549, 0, 1, 1,
0.7824469, -0.09185139, 1.413781, 0.5764706, 0, 1, 1,
0.7825627, 0.009954302, 4.231256, 0.5843138, 0, 1, 1,
0.7865161, 0.489248, 0.3122412, 0.5882353, 0, 1, 1,
0.7910348, 0.1263836, 1.604196, 0.5960785, 0, 1, 1,
0.7919647, -0.6672661, 2.371412, 0.6039216, 0, 1, 1,
0.7932988, 2.134246, 1.5285, 0.6078432, 0, 1, 1,
0.7954583, -0.562996, 1.924303, 0.6156863, 0, 1, 1,
0.7963709, -1.49357, 1.823995, 0.6196079, 0, 1, 1,
0.8016092, 0.5262346, 0.9688022, 0.627451, 0, 1, 1,
0.8044987, 0.2617686, 1.652963, 0.6313726, 0, 1, 1,
0.8107468, -0.5697872, 2.469918, 0.6392157, 0, 1, 1,
0.8115658, 1.281557, -0.8545266, 0.6431373, 0, 1, 1,
0.8190358, -1.251993, 3.334021, 0.6509804, 0, 1, 1,
0.8191777, 1.068867, 0.2166261, 0.654902, 0, 1, 1,
0.8196785, 0.8852069, 1.443146, 0.6627451, 0, 1, 1,
0.8224185, 0.9258564, 0.9152309, 0.6666667, 0, 1, 1,
0.8245395, -0.7684674, 3.708725, 0.6745098, 0, 1, 1,
0.8245517, -1.171302, 1.557924, 0.6784314, 0, 1, 1,
0.8257704, 0.03681138, 3.461501, 0.6862745, 0, 1, 1,
0.8275545, -0.6147834, 1.210655, 0.6901961, 0, 1, 1,
0.8293788, 0.1651215, 2.335583, 0.6980392, 0, 1, 1,
0.8306857, 0.03243147, 1.157869, 0.7058824, 0, 1, 1,
0.8333994, 1.013714, -0.5006304, 0.7098039, 0, 1, 1,
0.8335841, 1.237058, 0.390262, 0.7176471, 0, 1, 1,
0.8339261, 1.732599, 1.302383, 0.7215686, 0, 1, 1,
0.8355784, -1.895632, 2.953686, 0.7294118, 0, 1, 1,
0.8356462, 0.258263, 0.7730414, 0.7333333, 0, 1, 1,
0.8390493, -1.648499, 1.336842, 0.7411765, 0, 1, 1,
0.8412295, 1.546786, 2.460279, 0.7450981, 0, 1, 1,
0.8415789, -0.1998938, 1.281876, 0.7529412, 0, 1, 1,
0.8487641, 1.233425, -2.427213, 0.7568628, 0, 1, 1,
0.8570681, 0.5231962, -0.3166668, 0.7647059, 0, 1, 1,
0.8573979, 0.166598, 2.319725, 0.7686275, 0, 1, 1,
0.8584027, -1.871006, 5.202306, 0.7764706, 0, 1, 1,
0.8658174, -3.05115, 2.912638, 0.7803922, 0, 1, 1,
0.8694484, 1.96782, 0.254023, 0.7882353, 0, 1, 1,
0.8777328, 1.689693, 0.9951435, 0.7921569, 0, 1, 1,
0.8799551, 0.4502371, 1.135016, 0.8, 0, 1, 1,
0.8821073, 1.374725, 1.478053, 0.8078431, 0, 1, 1,
0.8824959, 0.4247236, 2.033556, 0.8117647, 0, 1, 1,
0.8851134, 0.3133961, 0.9193062, 0.8196079, 0, 1, 1,
0.8865398, -0.3907712, 2.23155, 0.8235294, 0, 1, 1,
0.8896866, -0.6083954, 3.230006, 0.8313726, 0, 1, 1,
0.8924296, -0.5973023, 3.574823, 0.8352941, 0, 1, 1,
0.8928455, -2.30502, 1.366468, 0.8431373, 0, 1, 1,
0.8937331, -1.709789, 3.059683, 0.8470588, 0, 1, 1,
0.8953941, -1.91691, 4.25708, 0.854902, 0, 1, 1,
0.8956409, -0.3698018, 2.172131, 0.8588235, 0, 1, 1,
0.8970305, 0.972925, 2.00702, 0.8666667, 0, 1, 1,
0.9024016, 0.3277305, 1.414279, 0.8705882, 0, 1, 1,
0.9027088, 0.832367, 1.294221, 0.8784314, 0, 1, 1,
0.9093757, 0.2887435, 0.4390551, 0.8823529, 0, 1, 1,
0.9117242, -0.618579, 3.413301, 0.8901961, 0, 1, 1,
0.9211738, -0.02708627, 2.363871, 0.8941177, 0, 1, 1,
0.9218032, 1.176273, -0.4187296, 0.9019608, 0, 1, 1,
0.9227378, 1.947686, -0.01467782, 0.9098039, 0, 1, 1,
0.9269818, -0.1628751, 0.9721513, 0.9137255, 0, 1, 1,
0.9277571, 1.180901, 0.4439679, 0.9215686, 0, 1, 1,
0.9374501, 0.903383, 1.413324, 0.9254902, 0, 1, 1,
0.9457875, 1.505841, 0.2955726, 0.9333333, 0, 1, 1,
0.9485916, -0.1501333, 3.777482, 0.9372549, 0, 1, 1,
0.9511872, 0.7820849, 1.748536, 0.945098, 0, 1, 1,
0.9638194, 0.1669424, 0.8324209, 0.9490196, 0, 1, 1,
0.9666638, -1.232864, 1.019933, 0.9568627, 0, 1, 1,
0.9671144, -0.1654397, 2.240564, 0.9607843, 0, 1, 1,
0.9724509, -0.03824243, 3.284827, 0.9686275, 0, 1, 1,
0.9770809, 0.2724743, 1.262157, 0.972549, 0, 1, 1,
0.9799933, 1.134884, 0.3384324, 0.9803922, 0, 1, 1,
0.9869774, 1.336071, -0.8757522, 0.9843137, 0, 1, 1,
0.9899437, 0.5140934, 1.384328, 0.9921569, 0, 1, 1,
0.9925264, -0.3237985, 1.647954, 0.9960784, 0, 1, 1,
0.9947961, 1.068132, -0.05143549, 1, 0, 0.9960784, 1,
0.9994996, 0.4719157, 2.945597, 1, 0, 0.9882353, 1,
1.004436, 0.8710693, -0.4382261, 1, 0, 0.9843137, 1,
1.012637, -0.4605979, 1.439911, 1, 0, 0.9764706, 1,
1.01397, -1.186919, 2.468732, 1, 0, 0.972549, 1,
1.019553, -0.5086643, 3.684712, 1, 0, 0.9647059, 1,
1.021608, -0.63316, 3.129747, 1, 0, 0.9607843, 1,
1.028644, -1.231008, 3.047578, 1, 0, 0.9529412, 1,
1.03502, 1.446066, -0.4004767, 1, 0, 0.9490196, 1,
1.03508, -0.5795556, 1.394574, 1, 0, 0.9411765, 1,
1.03625, 0.5489156, 1.992203, 1, 0, 0.9372549, 1,
1.043568, -0.4704766, 2.868516, 1, 0, 0.9294118, 1,
1.04526, -0.2236018, -0.175322, 1, 0, 0.9254902, 1,
1.049649, 2.322858, 2.437412, 1, 0, 0.9176471, 1,
1.05025, 1.139845, 0.1582174, 1, 0, 0.9137255, 1,
1.05399, -1.506585, 0.8306479, 1, 0, 0.9058824, 1,
1.057737, -0.8248016, 2.292661, 1, 0, 0.9019608, 1,
1.093782, -0.4149069, 1.969491, 1, 0, 0.8941177, 1,
1.094534, -1.07987, 0.9313985, 1, 0, 0.8862745, 1,
1.098334, 0.4649687, 0.6090479, 1, 0, 0.8823529, 1,
1.098766, -0.1545288, 2.34012, 1, 0, 0.8745098, 1,
1.107202, 0.1248549, 0.7869236, 1, 0, 0.8705882, 1,
1.116307, -0.2244807, 0.5310919, 1, 0, 0.8627451, 1,
1.123833, -0.05461645, 2.26816, 1, 0, 0.8588235, 1,
1.128901, 1.623533, 2.680698, 1, 0, 0.8509804, 1,
1.132311, 1.328743, 1.08654, 1, 0, 0.8470588, 1,
1.134249, 0.009514528, 3.605296, 1, 0, 0.8392157, 1,
1.147672, -2.293634, 3.440279, 1, 0, 0.8352941, 1,
1.151798, -0.1386207, 1.604202, 1, 0, 0.827451, 1,
1.152977, 1.266657, 0.007873799, 1, 0, 0.8235294, 1,
1.155283, -0.2036151, 0.3430858, 1, 0, 0.8156863, 1,
1.169343, -1.263385, 0.8507475, 1, 0, 0.8117647, 1,
1.169834, 1.277748, -0.7124619, 1, 0, 0.8039216, 1,
1.174068, -0.8886176, 2.690463, 1, 0, 0.7960784, 1,
1.179631, -1.276783, 1.128332, 1, 0, 0.7921569, 1,
1.189556, -0.1909699, 2.197818, 1, 0, 0.7843137, 1,
1.191754, 0.8812768, 0.1932201, 1, 0, 0.7803922, 1,
1.192944, 0.2816629, 0.8268847, 1, 0, 0.772549, 1,
1.198685, 1.40163, -1.014524, 1, 0, 0.7686275, 1,
1.204321, 1.18828, 0.9091744, 1, 0, 0.7607843, 1,
1.20443, -0.2731875, 2.567598, 1, 0, 0.7568628, 1,
1.204468, -0.2862246, 1.166722, 1, 0, 0.7490196, 1,
1.206237, 0.4215784, 0.5182242, 1, 0, 0.7450981, 1,
1.208639, -0.9366963, 3.063372, 1, 0, 0.7372549, 1,
1.209454, -0.8572919, 2.573874, 1, 0, 0.7333333, 1,
1.218536, -2.252826, 2.986943, 1, 0, 0.7254902, 1,
1.22252, 0.3710035, 1.337418, 1, 0, 0.7215686, 1,
1.223679, -0.1347658, 3.329711, 1, 0, 0.7137255, 1,
1.237357, 0.4022105, -1.990066, 1, 0, 0.7098039, 1,
1.237969, 0.8952792, 2.792369, 1, 0, 0.7019608, 1,
1.240365, -0.10062, 2.694171, 1, 0, 0.6941177, 1,
1.24051, 0.671019, 0.421759, 1, 0, 0.6901961, 1,
1.241412, -1.008085, 2.837031, 1, 0, 0.682353, 1,
1.243117, 1.42233, -2.298131, 1, 0, 0.6784314, 1,
1.249613, 1.266767, 1.997412, 1, 0, 0.6705883, 1,
1.251227, -2.383699, 3.10896, 1, 0, 0.6666667, 1,
1.258031, 0.8388199, 2.092921, 1, 0, 0.6588235, 1,
1.26542, 0.8893791, -0.1747697, 1, 0, 0.654902, 1,
1.269402, 0.6957591, 1.66708, 1, 0, 0.6470588, 1,
1.273004, -1.031764, 1.89717, 1, 0, 0.6431373, 1,
1.280881, 1.943892, 0.4610301, 1, 0, 0.6352941, 1,
1.299113, 0.7556904, -0.3450599, 1, 0, 0.6313726, 1,
1.30062, 0.242383, 1.901241, 1, 0, 0.6235294, 1,
1.302282, 0.4724047, 0.3960143, 1, 0, 0.6196079, 1,
1.303397, 0.06492204, 0.6229627, 1, 0, 0.6117647, 1,
1.307414, -0.354724, 2.401005, 1, 0, 0.6078432, 1,
1.316481, -0.6024922, 0.3250239, 1, 0, 0.6, 1,
1.325262, -1.802855, 3.007453, 1, 0, 0.5921569, 1,
1.329141, 1.255564, 1.166373, 1, 0, 0.5882353, 1,
1.331385, -1.853584, 2.214966, 1, 0, 0.5803922, 1,
1.332687, -3.226766, 1.299717, 1, 0, 0.5764706, 1,
1.334391, 1.618433, -0.04910806, 1, 0, 0.5686275, 1,
1.336505, -0.5691651, 1.586606, 1, 0, 0.5647059, 1,
1.359227, -0.5919295, 4.281971, 1, 0, 0.5568628, 1,
1.372992, -0.5732957, 1.630683, 1, 0, 0.5529412, 1,
1.375705, 0.8576084, 0.3464443, 1, 0, 0.5450981, 1,
1.378163, 0.7502294, -0.7493653, 1, 0, 0.5411765, 1,
1.392227, 0.1354127, 1.337037, 1, 0, 0.5333334, 1,
1.39508, -1.422943, 3.018609, 1, 0, 0.5294118, 1,
1.405865, -0.7276957, 1.95032, 1, 0, 0.5215687, 1,
1.416295, -0.4367855, 2.982868, 1, 0, 0.5176471, 1,
1.422225, -0.1894671, 0.04288086, 1, 0, 0.509804, 1,
1.436107, -0.0001969297, 1.527601, 1, 0, 0.5058824, 1,
1.442852, 0.3300769, 1.00832, 1, 0, 0.4980392, 1,
1.453535, -2.546628, 2.421538, 1, 0, 0.4901961, 1,
1.4784, -0.05606918, 0.5008311, 1, 0, 0.4862745, 1,
1.496897, -0.1441903, 3.572848, 1, 0, 0.4784314, 1,
1.498124, -0.499755, 0.1317659, 1, 0, 0.4745098, 1,
1.49907, -1.194996, 3.112115, 1, 0, 0.4666667, 1,
1.499883, -1.014408, 3.019146, 1, 0, 0.4627451, 1,
1.505115, -0.2134062, 1.176939, 1, 0, 0.454902, 1,
1.506566, -1.08688, 2.047366, 1, 0, 0.4509804, 1,
1.50798, 0.8103397, 0.5152183, 1, 0, 0.4431373, 1,
1.511496, -0.4527308, 0.0381816, 1, 0, 0.4392157, 1,
1.516249, -1.160052, 0.08344972, 1, 0, 0.4313726, 1,
1.516914, -0.02244434, 2.634688, 1, 0, 0.427451, 1,
1.517386, 0.9582716, -0.7222354, 1, 0, 0.4196078, 1,
1.526198, 1.519317, 0.8914973, 1, 0, 0.4156863, 1,
1.53779, 0.9841782, 1.060092, 1, 0, 0.4078431, 1,
1.547257, -1.402887, 0.2173227, 1, 0, 0.4039216, 1,
1.555257, -1.074105, 3.536029, 1, 0, 0.3960784, 1,
1.556184, -2.555071, 1.372027, 1, 0, 0.3882353, 1,
1.558041, -0.3350749, 0.390449, 1, 0, 0.3843137, 1,
1.571821, -1.282733, 3.121583, 1, 0, 0.3764706, 1,
1.573304, 0.2369849, 2.051322, 1, 0, 0.372549, 1,
1.587582, 0.6701391, 0.8621488, 1, 0, 0.3647059, 1,
1.604197, -1.229137, 0.428256, 1, 0, 0.3607843, 1,
1.607525, -0.3115627, 0.5184215, 1, 0, 0.3529412, 1,
1.62139, 2.008144, 2.764162, 1, 0, 0.3490196, 1,
1.629005, -0.3870435, 2.308866, 1, 0, 0.3411765, 1,
1.655362, 1.99958, -1.211516, 1, 0, 0.3372549, 1,
1.655491, 1.083447, 0.6897541, 1, 0, 0.3294118, 1,
1.662037, -0.3770406, 3.093794, 1, 0, 0.3254902, 1,
1.667133, 1.823901, 1.003193, 1, 0, 0.3176471, 1,
1.681424, -0.09729969, 1.713832, 1, 0, 0.3137255, 1,
1.682806, -1.325371, 3.161983, 1, 0, 0.3058824, 1,
1.690936, 1.3779, 0.2140339, 1, 0, 0.2980392, 1,
1.70309, 0.9621746, 0.468242, 1, 0, 0.2941177, 1,
1.703626, -0.8426444, 1.065184, 1, 0, 0.2862745, 1,
1.719457, 0.05532858, 0.2312897, 1, 0, 0.282353, 1,
1.746478, 1.258942, 2.072931, 1, 0, 0.2745098, 1,
1.757307, -0.7251333, 2.760176, 1, 0, 0.2705882, 1,
1.77851, 0.07350341, 1.074603, 1, 0, 0.2627451, 1,
1.787682, -0.2586604, 1.353138, 1, 0, 0.2588235, 1,
1.788691, -1.260317, 3.733311, 1, 0, 0.2509804, 1,
1.79785, -0.7206744, 1.398096, 1, 0, 0.2470588, 1,
1.813377, -0.135496, 1.060741, 1, 0, 0.2392157, 1,
1.822096, 0.6760495, 1.2658, 1, 0, 0.2352941, 1,
1.824867, -0.7318606, 3.907862, 1, 0, 0.227451, 1,
1.843397, -0.530347, 2.903097, 1, 0, 0.2235294, 1,
1.856142, -0.6628961, 1.162015, 1, 0, 0.2156863, 1,
1.861867, 1.49293, 0.132495, 1, 0, 0.2117647, 1,
1.874678, -0.04655055, 3.705955, 1, 0, 0.2039216, 1,
1.877214, -0.1401874, 1.769508, 1, 0, 0.1960784, 1,
1.877514, -0.03102545, 1.332798, 1, 0, 0.1921569, 1,
1.882022, -0.06544737, 1.207179, 1, 0, 0.1843137, 1,
1.896992, -0.4998333, 1.135613, 1, 0, 0.1803922, 1,
1.9006, 0.01609971, 3.794544, 1, 0, 0.172549, 1,
1.913998, -0.03358484, 1.182149, 1, 0, 0.1686275, 1,
1.935586, 0.5707597, 2.108452, 1, 0, 0.1607843, 1,
1.953213, -0.5506623, 1.48462, 1, 0, 0.1568628, 1,
1.959025, 0.2623282, 2.957159, 1, 0, 0.1490196, 1,
1.96748, 0.9455389, 1.304573, 1, 0, 0.145098, 1,
1.96836, -0.7401689, 2.138567, 1, 0, 0.1372549, 1,
1.99817, 1.063497, 0.9685096, 1, 0, 0.1333333, 1,
2.025858, 1.126946, 1.451438, 1, 0, 0.1254902, 1,
2.061606, -0.1121598, 1.519992, 1, 0, 0.1215686, 1,
2.071973, -0.3803236, 2.032004, 1, 0, 0.1137255, 1,
2.086865, 0.179965, 1.139561, 1, 0, 0.1098039, 1,
2.094355, 1.005684, 1.713956, 1, 0, 0.1019608, 1,
2.094378, -0.550555, 0.01787769, 1, 0, 0.09411765, 1,
2.122707, -0.5262623, 1.507336, 1, 0, 0.09019608, 1,
2.125224, 1.322238, 1.932821, 1, 0, 0.08235294, 1,
2.146288, 0.5544738, 0.3871058, 1, 0, 0.07843138, 1,
2.159966, -0.9239658, 1.532472, 1, 0, 0.07058824, 1,
2.204957, 1.072466, 0.5022373, 1, 0, 0.06666667, 1,
2.221926, -0.1245059, 1.213033, 1, 0, 0.05882353, 1,
2.249734, 0.2896612, 0.9307144, 1, 0, 0.05490196, 1,
2.270255, -0.4998095, 2.91665, 1, 0, 0.04705882, 1,
2.288985, 1.6187, 0.5432301, 1, 0, 0.04313726, 1,
2.355131, -1.441317, 3.097282, 1, 0, 0.03529412, 1,
2.392638, -2.102744, 5.324748, 1, 0, 0.03137255, 1,
2.579734, 0.05545743, 1.52398, 1, 0, 0.02352941, 1,
2.69788, -0.7154284, 1.508829, 1, 0, 0.01960784, 1,
2.72484, -0.4221019, 1.934896, 1, 0, 0.01176471, 1,
2.836872, 0.9935947, 1.762846, 1, 0, 0.007843138, 1
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
-0.5325882, -4.467352, -6.638897, 0, -0.5, 0.5, 0.5,
-0.5325882, -4.467352, -6.638897, 1, -0.5, 0.5, 0.5,
-0.5325882, -4.467352, -6.638897, 1, 1.5, 0.5, 0.5,
-0.5325882, -4.467352, -6.638897, 0, 1.5, 0.5, 0.5
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
-5.044295, 0.4327829, -6.638897, 0, -0.5, 0.5, 0.5,
-5.044295, 0.4327829, -6.638897, 1, -0.5, 0.5, 0.5,
-5.044295, 0.4327829, -6.638897, 1, 1.5, 0.5, 0.5,
-5.044295, 0.4327829, -6.638897, 0, 1.5, 0.5, 0.5
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
-5.044295, -4.467352, 0.2098932, 0, -0.5, 0.5, 0.5,
-5.044295, -4.467352, 0.2098932, 1, -0.5, 0.5, 0.5,
-5.044295, -4.467352, 0.2098932, 1, 1.5, 0.5, 0.5,
-5.044295, -4.467352, 0.2098932, 0, 1.5, 0.5, 0.5
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
-3, -3.336552, -5.058407,
2, -3.336552, -5.058407,
-3, -3.336552, -5.058407,
-3, -3.525019, -5.321822,
-2, -3.336552, -5.058407,
-2, -3.525019, -5.321822,
-1, -3.336552, -5.058407,
-1, -3.525019, -5.321822,
0, -3.336552, -5.058407,
0, -3.525019, -5.321822,
1, -3.336552, -5.058407,
1, -3.525019, -5.321822,
2, -3.336552, -5.058407,
2, -3.525019, -5.321822
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
-3, -3.901952, -5.848652, 0, -0.5, 0.5, 0.5,
-3, -3.901952, -5.848652, 1, -0.5, 0.5, 0.5,
-3, -3.901952, -5.848652, 1, 1.5, 0.5, 0.5,
-3, -3.901952, -5.848652, 0, 1.5, 0.5, 0.5,
-2, -3.901952, -5.848652, 0, -0.5, 0.5, 0.5,
-2, -3.901952, -5.848652, 1, -0.5, 0.5, 0.5,
-2, -3.901952, -5.848652, 1, 1.5, 0.5, 0.5,
-2, -3.901952, -5.848652, 0, 1.5, 0.5, 0.5,
-1, -3.901952, -5.848652, 0, -0.5, 0.5, 0.5,
-1, -3.901952, -5.848652, 1, -0.5, 0.5, 0.5,
-1, -3.901952, -5.848652, 1, 1.5, 0.5, 0.5,
-1, -3.901952, -5.848652, 0, 1.5, 0.5, 0.5,
0, -3.901952, -5.848652, 0, -0.5, 0.5, 0.5,
0, -3.901952, -5.848652, 1, -0.5, 0.5, 0.5,
0, -3.901952, -5.848652, 1, 1.5, 0.5, 0.5,
0, -3.901952, -5.848652, 0, 1.5, 0.5, 0.5,
1, -3.901952, -5.848652, 0, -0.5, 0.5, 0.5,
1, -3.901952, -5.848652, 1, -0.5, 0.5, 0.5,
1, -3.901952, -5.848652, 1, 1.5, 0.5, 0.5,
1, -3.901952, -5.848652, 0, 1.5, 0.5, 0.5,
2, -3.901952, -5.848652, 0, -0.5, 0.5, 0.5,
2, -3.901952, -5.848652, 1, -0.5, 0.5, 0.5,
2, -3.901952, -5.848652, 1, 1.5, 0.5, 0.5,
2, -3.901952, -5.848652, 0, 1.5, 0.5, 0.5
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
-4.003132, -2, -5.058407,
-4.003132, 4, -5.058407,
-4.003132, -2, -5.058407,
-4.17666, -2, -5.321822,
-4.003132, 0, -5.058407,
-4.17666, 0, -5.321822,
-4.003132, 2, -5.058407,
-4.17666, 2, -5.321822,
-4.003132, 4, -5.058407,
-4.17666, 4, -5.321822
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
"2",
"4"
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
-4.523714, -2, -5.848652, 0, -0.5, 0.5, 0.5,
-4.523714, -2, -5.848652, 1, -0.5, 0.5, 0.5,
-4.523714, -2, -5.848652, 1, 1.5, 0.5, 0.5,
-4.523714, -2, -5.848652, 0, 1.5, 0.5, 0.5,
-4.523714, 0, -5.848652, 0, -0.5, 0.5, 0.5,
-4.523714, 0, -5.848652, 1, -0.5, 0.5, 0.5,
-4.523714, 0, -5.848652, 1, 1.5, 0.5, 0.5,
-4.523714, 0, -5.848652, 0, 1.5, 0.5, 0.5,
-4.523714, 2, -5.848652, 0, -0.5, 0.5, 0.5,
-4.523714, 2, -5.848652, 1, -0.5, 0.5, 0.5,
-4.523714, 2, -5.848652, 1, 1.5, 0.5, 0.5,
-4.523714, 2, -5.848652, 0, 1.5, 0.5, 0.5,
-4.523714, 4, -5.848652, 0, -0.5, 0.5, 0.5,
-4.523714, 4, -5.848652, 1, -0.5, 0.5, 0.5,
-4.523714, 4, -5.848652, 1, 1.5, 0.5, 0.5,
-4.523714, 4, -5.848652, 0, 1.5, 0.5, 0.5
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
-4.003132, -3.336552, -4,
-4.003132, -3.336552, 4,
-4.003132, -3.336552, -4,
-4.17666, -3.525019, -4,
-4.003132, -3.336552, -2,
-4.17666, -3.525019, -2,
-4.003132, -3.336552, 0,
-4.17666, -3.525019, 0,
-4.003132, -3.336552, 2,
-4.17666, -3.525019, 2,
-4.003132, -3.336552, 4,
-4.17666, -3.525019, 4
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
-4.523714, -3.901952, -4, 0, -0.5, 0.5, 0.5,
-4.523714, -3.901952, -4, 1, -0.5, 0.5, 0.5,
-4.523714, -3.901952, -4, 1, 1.5, 0.5, 0.5,
-4.523714, -3.901952, -4, 0, 1.5, 0.5, 0.5,
-4.523714, -3.901952, -2, 0, -0.5, 0.5, 0.5,
-4.523714, -3.901952, -2, 1, -0.5, 0.5, 0.5,
-4.523714, -3.901952, -2, 1, 1.5, 0.5, 0.5,
-4.523714, -3.901952, -2, 0, 1.5, 0.5, 0.5,
-4.523714, -3.901952, 0, 0, -0.5, 0.5, 0.5,
-4.523714, -3.901952, 0, 1, -0.5, 0.5, 0.5,
-4.523714, -3.901952, 0, 1, 1.5, 0.5, 0.5,
-4.523714, -3.901952, 0, 0, 1.5, 0.5, 0.5,
-4.523714, -3.901952, 2, 0, -0.5, 0.5, 0.5,
-4.523714, -3.901952, 2, 1, -0.5, 0.5, 0.5,
-4.523714, -3.901952, 2, 1, 1.5, 0.5, 0.5,
-4.523714, -3.901952, 2, 0, 1.5, 0.5, 0.5,
-4.523714, -3.901952, 4, 0, -0.5, 0.5, 0.5,
-4.523714, -3.901952, 4, 1, -0.5, 0.5, 0.5,
-4.523714, -3.901952, 4, 1, 1.5, 0.5, 0.5,
-4.523714, -3.901952, 4, 0, 1.5, 0.5, 0.5
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
-4.003132, -3.336552, -5.058407,
-4.003132, 4.202118, -5.058407,
-4.003132, -3.336552, 5.478194,
-4.003132, 4.202118, 5.478194,
-4.003132, -3.336552, -5.058407,
-4.003132, -3.336552, 5.478194,
-4.003132, 4.202118, -5.058407,
-4.003132, 4.202118, 5.478194,
-4.003132, -3.336552, -5.058407,
2.937956, -3.336552, -5.058407,
-4.003132, -3.336552, 5.478194,
2.937956, -3.336552, 5.478194,
-4.003132, 4.202118, -5.058407,
2.937956, 4.202118, -5.058407,
-4.003132, 4.202118, 5.478194,
2.937956, 4.202118, 5.478194,
2.937956, -3.336552, -5.058407,
2.937956, 4.202118, -5.058407,
2.937956, -3.336552, 5.478194,
2.937956, 4.202118, 5.478194,
2.937956, -3.336552, -5.058407,
2.937956, -3.336552, 5.478194,
2.937956, 4.202118, -5.058407,
2.937956, 4.202118, 5.478194
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
var radius = 7.848428;
var distance = 34.91854;
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
mvMatrix.translate( 0.5325882, -0.4327829, -0.2098932 );
mvMatrix.scale( 1.222557, 1.125646, 0.8053712 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91854);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


