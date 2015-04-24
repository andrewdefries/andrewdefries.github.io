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
-3.27213, 0.8474067, -0.07855348, 1, 0, 0, 1,
-2.725017, 1.380878, 0.1753432, 1, 0.007843138, 0, 1,
-2.596215, -0.4748761, -0.5947102, 1, 0.01176471, 0, 1,
-2.557263, 0.233357, -1.81868, 1, 0.01960784, 0, 1,
-2.424734, 0.2368467, -1.291608, 1, 0.02352941, 0, 1,
-2.317466, 0.2550426, -1.674092, 1, 0.03137255, 0, 1,
-2.234896, 0.0549803, -3.344579, 1, 0.03529412, 0, 1,
-2.232848, 1.755245, -0.5915437, 1, 0.04313726, 0, 1,
-2.190969, -0.007204341, 0.8472389, 1, 0.04705882, 0, 1,
-2.155082, -0.6794536, -2.056293, 1, 0.05490196, 0, 1,
-2.148986, 0.5271309, -1.692126, 1, 0.05882353, 0, 1,
-2.13113, -1.639024, -3.618588, 1, 0.06666667, 0, 1,
-2.121619, 0.8962114, -0.9857394, 1, 0.07058824, 0, 1,
-2.065274, -1.150011, -2.429749, 1, 0.07843138, 0, 1,
-2.057025, -1.061725, -1.298658, 1, 0.08235294, 0, 1,
-2.048691, -0.008114746, -0.3006792, 1, 0.09019608, 0, 1,
-2.030004, -0.3282384, -1.700993, 1, 0.09411765, 0, 1,
-2.01389, -0.346362, -2.585495, 1, 0.1019608, 0, 1,
-1.974214, 1.051238, -0.9340965, 1, 0.1098039, 0, 1,
-1.974212, 0.07656743, -1.5774, 1, 0.1137255, 0, 1,
-1.971368, 2.033206, -3.89149, 1, 0.1215686, 0, 1,
-1.966602, -0.8569199, -1.781451, 1, 0.1254902, 0, 1,
-1.960748, 2.383345, 0.9346546, 1, 0.1333333, 0, 1,
-1.957778, 0.2043077, -0.3434812, 1, 0.1372549, 0, 1,
-1.927757, -0.5206475, -1.87836, 1, 0.145098, 0, 1,
-1.891585, -0.283156, 0.5438309, 1, 0.1490196, 0, 1,
-1.870339, -0.8385859, -1.050394, 1, 0.1568628, 0, 1,
-1.828048, -0.8800968, -2.729073, 1, 0.1607843, 0, 1,
-1.819224, -2.317659, -3.004262, 1, 0.1686275, 0, 1,
-1.796142, -0.6239987, -2.133469, 1, 0.172549, 0, 1,
-1.746709, 0.4335194, -1.779307, 1, 0.1803922, 0, 1,
-1.746225, 0.6618791, -2.978577, 1, 0.1843137, 0, 1,
-1.737579, 2.066769, -1.247932, 1, 0.1921569, 0, 1,
-1.733542, -1.387964, -2.358701, 1, 0.1960784, 0, 1,
-1.709408, -0.2802766, -1.759107, 1, 0.2039216, 0, 1,
-1.707685, 1.547975, -1.845308, 1, 0.2117647, 0, 1,
-1.701933, -3.396414, -3.749022, 1, 0.2156863, 0, 1,
-1.698717, 0.6201953, -0.7810611, 1, 0.2235294, 0, 1,
-1.687526, -0.09652982, -2.008156, 1, 0.227451, 0, 1,
-1.680304, -0.4423398, -2.153846, 1, 0.2352941, 0, 1,
-1.670591, 1.168594, -0.7328794, 1, 0.2392157, 0, 1,
-1.652234, 0.7180651, -2.035299, 1, 0.2470588, 0, 1,
-1.635777, 0.6024147, -1.755528, 1, 0.2509804, 0, 1,
-1.609151, 0.2829387, -0.7047046, 1, 0.2588235, 0, 1,
-1.603027, -1.045367, -0.4466251, 1, 0.2627451, 0, 1,
-1.594294, 1.230803, -2.489581, 1, 0.2705882, 0, 1,
-1.591824, 0.577874, -1.562677, 1, 0.2745098, 0, 1,
-1.546615, -1.195607, -2.251817, 1, 0.282353, 0, 1,
-1.539263, 0.8569435, -1.236894, 1, 0.2862745, 0, 1,
-1.532405, -1.186057, -1.11119, 1, 0.2941177, 0, 1,
-1.522662, -0.2372829, -3.280841, 1, 0.3019608, 0, 1,
-1.514075, -1.766253, -0.06467812, 1, 0.3058824, 0, 1,
-1.50688, 0.5245033, -0.3701549, 1, 0.3137255, 0, 1,
-1.503656, 0.1404993, -0.6276956, 1, 0.3176471, 0, 1,
-1.501167, -0.6076875, -0.3281997, 1, 0.3254902, 0, 1,
-1.483033, 1.01731, -0.3356859, 1, 0.3294118, 0, 1,
-1.483012, -1.873558, -2.747405, 1, 0.3372549, 0, 1,
-1.473027, 1.571206, -1.7814, 1, 0.3411765, 0, 1,
-1.470982, -0.3833202, -1.782646, 1, 0.3490196, 0, 1,
-1.462539, 1.080309, -1.065009, 1, 0.3529412, 0, 1,
-1.456095, -1.773372, -3.308203, 1, 0.3607843, 0, 1,
-1.449585, 2.272177, 0.6830665, 1, 0.3647059, 0, 1,
-1.445199, 0.8725653, 0.1241875, 1, 0.372549, 0, 1,
-1.445113, -0.3432798, -1.938024, 1, 0.3764706, 0, 1,
-1.439022, 0.7427263, -1.025189, 1, 0.3843137, 0, 1,
-1.428314, 1.746317, -0.1710105, 1, 0.3882353, 0, 1,
-1.415736, 0.4053824, -2.002783, 1, 0.3960784, 0, 1,
-1.411969, 0.3500294, -0.6472991, 1, 0.4039216, 0, 1,
-1.408258, -1.41015, -3.554969, 1, 0.4078431, 0, 1,
-1.404666, -0.6289802, -1.285738, 1, 0.4156863, 0, 1,
-1.401748, 0.6582405, -1.270377, 1, 0.4196078, 0, 1,
-1.399804, -0.6755047, -3.490318, 1, 0.427451, 0, 1,
-1.392944, 0.5730215, -1.181512, 1, 0.4313726, 0, 1,
-1.392363, -1.482276, -3.529204, 1, 0.4392157, 0, 1,
-1.388047, -0.7081842, -0.626599, 1, 0.4431373, 0, 1,
-1.378949, -0.07874637, -3.609865, 1, 0.4509804, 0, 1,
-1.369403, -0.140833, -2.456293, 1, 0.454902, 0, 1,
-1.369166, -2.251116, -2.076671, 1, 0.4627451, 0, 1,
-1.352645, 0.06317393, -1.176373, 1, 0.4666667, 0, 1,
-1.347546, 0.03784796, -1.969514, 1, 0.4745098, 0, 1,
-1.340857, -0.4031985, -1.347411, 1, 0.4784314, 0, 1,
-1.32668, 0.2661346, -2.823376, 1, 0.4862745, 0, 1,
-1.311908, -1.696739, -1.775733, 1, 0.4901961, 0, 1,
-1.304381, 2.544793, 0.9956314, 1, 0.4980392, 0, 1,
-1.272832, -0.8412176, -1.823303, 1, 0.5058824, 0, 1,
-1.258219, -1.769271, -1.576209, 1, 0.509804, 0, 1,
-1.243732, -0.9581835, -4.599323, 1, 0.5176471, 0, 1,
-1.237714, -1.271302, -3.170115, 1, 0.5215687, 0, 1,
-1.231443, -0.6685508, -4.507573, 1, 0.5294118, 0, 1,
-1.21708, -0.6166975, -2.012453, 1, 0.5333334, 0, 1,
-1.217035, -1.10391, -3.077001, 1, 0.5411765, 0, 1,
-1.216249, -0.007069032, -0.9080098, 1, 0.5450981, 0, 1,
-1.214363, 1.139271, -0.1269973, 1, 0.5529412, 0, 1,
-1.212826, -0.1493569, -1.609132, 1, 0.5568628, 0, 1,
-1.200002, 0.3126688, -1.544696, 1, 0.5647059, 0, 1,
-1.195937, -0.6633359, -1.807723, 1, 0.5686275, 0, 1,
-1.191254, 1.376008, -2.269104, 1, 0.5764706, 0, 1,
-1.175623, -0.8404742, -2.217644, 1, 0.5803922, 0, 1,
-1.174519, 1.218685, -2.010913, 1, 0.5882353, 0, 1,
-1.169579, 1.807641, -0.8581942, 1, 0.5921569, 0, 1,
-1.168726, -0.7284621, -1.804847, 1, 0.6, 0, 1,
-1.16599, -0.9829457, -0.4988547, 1, 0.6078432, 0, 1,
-1.156929, 1.806811, -0.7644118, 1, 0.6117647, 0, 1,
-1.152202, 2.070823, 0.9133442, 1, 0.6196079, 0, 1,
-1.146599, -0.959456, -2.099902, 1, 0.6235294, 0, 1,
-1.142061, -0.4643569, -3.185743, 1, 0.6313726, 0, 1,
-1.134624, -0.1163025, -1.093383, 1, 0.6352941, 0, 1,
-1.123526, -1.091604, -2.149996, 1, 0.6431373, 0, 1,
-1.115617, 0.8447196, -2.360647, 1, 0.6470588, 0, 1,
-1.111275, -0.2067136, -2.086145, 1, 0.654902, 0, 1,
-1.086229, -0.483152, -2.060272, 1, 0.6588235, 0, 1,
-1.075561, -1.502377, -2.91638, 1, 0.6666667, 0, 1,
-1.073013, -0.9812695, -1.477845, 1, 0.6705883, 0, 1,
-1.071581, -0.4725092, -2.400016, 1, 0.6784314, 0, 1,
-1.070219, -0.5789155, -1.139267, 1, 0.682353, 0, 1,
-1.067035, -0.1203779, -1.364496, 1, 0.6901961, 0, 1,
-1.065634, 0.8021919, -0.9283014, 1, 0.6941177, 0, 1,
-1.061908, 1.008795, -0.1014856, 1, 0.7019608, 0, 1,
-1.061425, -0.2592048, -2.69819, 1, 0.7098039, 0, 1,
-1.057102, 0.4584056, -2.203845, 1, 0.7137255, 0, 1,
-1.055129, -0.4618588, -1.168923, 1, 0.7215686, 0, 1,
-1.051371, 0.874797, 0.3086976, 1, 0.7254902, 0, 1,
-1.049664, -2.198041, -3.444967, 1, 0.7333333, 0, 1,
-1.046378, 0.2587811, -0.7728441, 1, 0.7372549, 0, 1,
-1.046299, 0.1930105, -2.981225, 1, 0.7450981, 0, 1,
-1.038872, 1.898042, -1.185228, 1, 0.7490196, 0, 1,
-1.036605, 1.543421, -0.2208971, 1, 0.7568628, 0, 1,
-1.031898, 1.053593, -0.3095468, 1, 0.7607843, 0, 1,
-1.029565, 0.4154282, -0.9880866, 1, 0.7686275, 0, 1,
-1.028756, -0.3606722, -1.486322, 1, 0.772549, 0, 1,
-1.016744, -0.08777223, -4.10678, 1, 0.7803922, 0, 1,
-1.014102, 1.854586, -1.369022, 1, 0.7843137, 0, 1,
-1.013706, 1.377977, -2.124849, 1, 0.7921569, 0, 1,
-1.012073, 1.647039, 0.2192903, 1, 0.7960784, 0, 1,
-1.007229, 0.8443226, -1.34815, 1, 0.8039216, 0, 1,
-1.001532, 0.2423991, -2.939826, 1, 0.8117647, 0, 1,
-0.9974349, -1.368268, -0.4977483, 1, 0.8156863, 0, 1,
-0.9945385, -1.089981, -2.334005, 1, 0.8235294, 0, 1,
-0.9944862, 0.876231, -0.2804719, 1, 0.827451, 0, 1,
-0.992408, -0.6567814, -3.120281, 1, 0.8352941, 0, 1,
-0.9896006, -0.3922905, -2.075824, 1, 0.8392157, 0, 1,
-0.9814647, -1.429699, -4.007921, 1, 0.8470588, 0, 1,
-0.9741706, -0.6235262, -4.518581, 1, 0.8509804, 0, 1,
-0.9537213, 0.4704652, -1.077449, 1, 0.8588235, 0, 1,
-0.9520723, -0.2171485, -2.872976, 1, 0.8627451, 0, 1,
-0.9490277, -1.276254, -2.294878, 1, 0.8705882, 0, 1,
-0.9489116, -0.6707612, -2.221147, 1, 0.8745098, 0, 1,
-0.9476455, 0.282819, -0.2130315, 1, 0.8823529, 0, 1,
-0.9441519, -1.319991, -1.806688, 1, 0.8862745, 0, 1,
-0.9389855, 0.5027972, -2.190487, 1, 0.8941177, 0, 1,
-0.9361705, -0.4375746, -3.224055, 1, 0.8980392, 0, 1,
-0.9356002, -0.7693426, -2.188122, 1, 0.9058824, 0, 1,
-0.9283471, 1.28892, -1.11946, 1, 0.9137255, 0, 1,
-0.9261579, 0.4668464, -1.257925, 1, 0.9176471, 0, 1,
-0.9186519, -0.6319171, -2.221251, 1, 0.9254902, 0, 1,
-0.9128956, 0.03933686, 0.005296743, 1, 0.9294118, 0, 1,
-0.9048665, 1.028689, -0.23479, 1, 0.9372549, 0, 1,
-0.9032058, -0.05091568, -3.124479, 1, 0.9411765, 0, 1,
-0.9026234, -1.254552, -2.825851, 1, 0.9490196, 0, 1,
-0.8924418, 1.836856, -2.548907, 1, 0.9529412, 0, 1,
-0.8895255, 0.1672698, 0.2812799, 1, 0.9607843, 0, 1,
-0.8881074, 0.02214655, -1.092673, 1, 0.9647059, 0, 1,
-0.8822284, -2.099346, -2.750591, 1, 0.972549, 0, 1,
-0.8776502, -0.3237849, -1.558769, 1, 0.9764706, 0, 1,
-0.8763906, 0.06131162, -1.558829, 1, 0.9843137, 0, 1,
-0.8759001, 0.4578245, -0.4348279, 1, 0.9882353, 0, 1,
-0.8749734, -1.249703, -2.581799, 1, 0.9960784, 0, 1,
-0.8741997, 0.2206358, -1.14736, 0.9960784, 1, 0, 1,
-0.8653147, 1.64919, 0.8232465, 0.9921569, 1, 0, 1,
-0.8572459, 0.8144379, -1.045917, 0.9843137, 1, 0, 1,
-0.8508778, 0.3263247, -0.08713374, 0.9803922, 1, 0, 1,
-0.8483902, -0.9299275, -2.265541, 0.972549, 1, 0, 1,
-0.8461225, 1.946744, -0.2078423, 0.9686275, 1, 0, 1,
-0.8433678, 0.8494068, 0.4695834, 0.9607843, 1, 0, 1,
-0.8394688, -0.2783535, -1.786607, 0.9568627, 1, 0, 1,
-0.8389886, 0.02699386, -3.234412, 0.9490196, 1, 0, 1,
-0.8369759, -1.123858, -2.45242, 0.945098, 1, 0, 1,
-0.8350642, -1.009593, -2.931848, 0.9372549, 1, 0, 1,
-0.8349483, 0.3583055, -2.515214, 0.9333333, 1, 0, 1,
-0.8281751, -1.044831, -0.4882365, 0.9254902, 1, 0, 1,
-0.8265827, -0.1746405, -4.187899, 0.9215686, 1, 0, 1,
-0.8230775, 0.01356536, -0.762085, 0.9137255, 1, 0, 1,
-0.8213062, 0.3810811, 0.5394236, 0.9098039, 1, 0, 1,
-0.8076096, 1.600087, -2.068383, 0.9019608, 1, 0, 1,
-0.8075445, -0.6523845, -2.626214, 0.8941177, 1, 0, 1,
-0.7978005, 0.9523092, -0.006213856, 0.8901961, 1, 0, 1,
-0.7965044, 1.757721, 0.5454674, 0.8823529, 1, 0, 1,
-0.7954325, 1.592278, 0.3188387, 0.8784314, 1, 0, 1,
-0.7860163, 0.9306416, -2.399488, 0.8705882, 1, 0, 1,
-0.7853365, 0.3276247, -0.8681344, 0.8666667, 1, 0, 1,
-0.7841831, 0.72802, -0.8769431, 0.8588235, 1, 0, 1,
-0.7821465, -0.4897192, -1.846435, 0.854902, 1, 0, 1,
-0.7801598, 0.2537621, -1.220447, 0.8470588, 1, 0, 1,
-0.7781171, -0.4690826, -2.9379, 0.8431373, 1, 0, 1,
-0.777433, 0.13986, -2.363897, 0.8352941, 1, 0, 1,
-0.7758754, -0.1476597, -1.801327, 0.8313726, 1, 0, 1,
-0.7712167, 1.032219, -0.6319089, 0.8235294, 1, 0, 1,
-0.766964, -1.413194, -1.983007, 0.8196079, 1, 0, 1,
-0.7636447, -1.313494, -2.587709, 0.8117647, 1, 0, 1,
-0.761915, 0.7067755, -1.489823, 0.8078431, 1, 0, 1,
-0.7611085, -0.2506746, -0.4893769, 0.8, 1, 0, 1,
-0.7588041, 0.6037489, -1.024519, 0.7921569, 1, 0, 1,
-0.7582721, -0.2177377, -2.549345, 0.7882353, 1, 0, 1,
-0.754576, 0.9240672, -0.9305078, 0.7803922, 1, 0, 1,
-0.749593, 0.2464292, -0.9049473, 0.7764706, 1, 0, 1,
-0.7495465, -0.07993011, -0.4632721, 0.7686275, 1, 0, 1,
-0.7467148, -0.8359365, -3.485603, 0.7647059, 1, 0, 1,
-0.7416028, -0.3680408, -2.220866, 0.7568628, 1, 0, 1,
-0.7363071, 1.246133, -0.852992, 0.7529412, 1, 0, 1,
-0.7357402, -0.1920127, -3.527205, 0.7450981, 1, 0, 1,
-0.7336359, -0.8048652, -3.048254, 0.7411765, 1, 0, 1,
-0.7304627, 1.108636, -1.646503, 0.7333333, 1, 0, 1,
-0.7296128, 1.40307, -1.104636, 0.7294118, 1, 0, 1,
-0.7293707, -1.919294, -5.112999, 0.7215686, 1, 0, 1,
-0.7284499, 0.2462283, -2.912253, 0.7176471, 1, 0, 1,
-0.7267764, -0.4400579, -2.595247, 0.7098039, 1, 0, 1,
-0.7215984, 0.8670301, 0.637157, 0.7058824, 1, 0, 1,
-0.7164112, 0.3940889, -0.9317093, 0.6980392, 1, 0, 1,
-0.7164004, -0.6743189, -3.036952, 0.6901961, 1, 0, 1,
-0.7144114, -0.3370956, -2.204628, 0.6862745, 1, 0, 1,
-0.7126961, -0.5255684, -3.172745, 0.6784314, 1, 0, 1,
-0.7118199, -1.272249, -3.718516, 0.6745098, 1, 0, 1,
-0.7097387, -0.7247621, -2.876882, 0.6666667, 1, 0, 1,
-0.7085589, -0.1649527, -2.035577, 0.6627451, 1, 0, 1,
-0.7046498, -0.1418148, -1.442555, 0.654902, 1, 0, 1,
-0.7024255, -2.119853, -3.224666, 0.6509804, 1, 0, 1,
-0.7023805, -1.262567, -2.658056, 0.6431373, 1, 0, 1,
-0.7021526, -0.8051976, -2.939671, 0.6392157, 1, 0, 1,
-0.7001613, -1.29855, -4.264738, 0.6313726, 1, 0, 1,
-0.699813, 0.05904077, -0.679054, 0.627451, 1, 0, 1,
-0.6993602, -1.157749, -2.655181, 0.6196079, 1, 0, 1,
-0.6920924, -0.9617233, -1.993768, 0.6156863, 1, 0, 1,
-0.6918126, -0.7621289, -1.682321, 0.6078432, 1, 0, 1,
-0.6861688, -0.6478611, -1.949564, 0.6039216, 1, 0, 1,
-0.6843793, -0.1492675, 0.006453071, 0.5960785, 1, 0, 1,
-0.6799885, -0.6172051, -2.896752, 0.5882353, 1, 0, 1,
-0.6782359, -1.398156, -3.33563, 0.5843138, 1, 0, 1,
-0.6687183, 1.07854, -0.4888395, 0.5764706, 1, 0, 1,
-0.6677682, 0.8089932, 0.336808, 0.572549, 1, 0, 1,
-0.6669504, -0.6815351, -1.26528, 0.5647059, 1, 0, 1,
-0.6667884, 1.445643, -0.3000808, 0.5607843, 1, 0, 1,
-0.6662596, 0.9984635, -0.7747323, 0.5529412, 1, 0, 1,
-0.657853, -0.1911978, -2.118492, 0.5490196, 1, 0, 1,
-0.6562311, 0.09195179, -0.4254284, 0.5411765, 1, 0, 1,
-0.6540763, 0.323949, 0.004341267, 0.5372549, 1, 0, 1,
-0.6517172, 1.570488, -0.4798775, 0.5294118, 1, 0, 1,
-0.6488972, 0.2015068, -0.4618526, 0.5254902, 1, 0, 1,
-0.6461346, 0.7481419, -1.530416, 0.5176471, 1, 0, 1,
-0.6451716, 0.2240496, -1.375569, 0.5137255, 1, 0, 1,
-0.6426921, 1.547764, 0.245344, 0.5058824, 1, 0, 1,
-0.6418671, 0.6008765, -0.3214377, 0.5019608, 1, 0, 1,
-0.6409319, -0.1552704, -2.941527, 0.4941176, 1, 0, 1,
-0.6341584, -0.5868627, -3.390556, 0.4862745, 1, 0, 1,
-0.6341227, -0.8340783, -4.039605, 0.4823529, 1, 0, 1,
-0.6257297, -0.3182929, -2.468137, 0.4745098, 1, 0, 1,
-0.6200601, -1.139015, -1.587677, 0.4705882, 1, 0, 1,
-0.6200453, -0.6590157, -2.677702, 0.4627451, 1, 0, 1,
-0.6112074, 0.5330909, -0.7357227, 0.4588235, 1, 0, 1,
-0.6098559, -0.3134096, -4.58231, 0.4509804, 1, 0, 1,
-0.6098026, 0.06079217, 0.04297413, 0.4470588, 1, 0, 1,
-0.6082556, 0.1642384, -0.06647994, 0.4392157, 1, 0, 1,
-0.605096, -1.428097, -3.101425, 0.4352941, 1, 0, 1,
-0.60224, 0.7061083, -1.991295, 0.427451, 1, 0, 1,
-0.6005062, 0.6208269, -1.596128, 0.4235294, 1, 0, 1,
-0.6005046, 1.181086, -1.503601, 0.4156863, 1, 0, 1,
-0.5955008, -0.9479996, -3.487433, 0.4117647, 1, 0, 1,
-0.5908242, -0.6116966, -3.220733, 0.4039216, 1, 0, 1,
-0.5890181, -0.288684, -3.140992, 0.3960784, 1, 0, 1,
-0.5842413, 0.2198109, -1.84876, 0.3921569, 1, 0, 1,
-0.5767589, 1.022787, -0.02670285, 0.3843137, 1, 0, 1,
-0.571754, -0.4776724, -3.07811, 0.3803922, 1, 0, 1,
-0.5716647, 1.483436, 0.7187237, 0.372549, 1, 0, 1,
-0.5690871, -0.6328331, -2.508789, 0.3686275, 1, 0, 1,
-0.56589, 1.070895, -0.8407509, 0.3607843, 1, 0, 1,
-0.5634478, -0.5426034, -2.066683, 0.3568628, 1, 0, 1,
-0.5617174, 0.2073854, -2.132323, 0.3490196, 1, 0, 1,
-0.560905, 0.2469174, -1.241734, 0.345098, 1, 0, 1,
-0.5606733, 0.7000048, 0.6255888, 0.3372549, 1, 0, 1,
-0.5590228, 0.9353595, -0.08668379, 0.3333333, 1, 0, 1,
-0.5589648, 1.022487, 0.8756714, 0.3254902, 1, 0, 1,
-0.5574353, 0.9515328, -0.5102528, 0.3215686, 1, 0, 1,
-0.5565072, -0.5613264, -3.056884, 0.3137255, 1, 0, 1,
-0.5522209, -1.875557, -4.151979, 0.3098039, 1, 0, 1,
-0.5497666, 0.9838582, 0.4652159, 0.3019608, 1, 0, 1,
-0.5461106, -1.623147, -2.520705, 0.2941177, 1, 0, 1,
-0.5441155, 0.1785389, -0.7847276, 0.2901961, 1, 0, 1,
-0.5425916, 1.209811, -1.430758, 0.282353, 1, 0, 1,
-0.5414217, -0.8794915, -2.660205, 0.2784314, 1, 0, 1,
-0.539313, -1.415926, -3.780676, 0.2705882, 1, 0, 1,
-0.5380102, -0.2407156, -1.114538, 0.2666667, 1, 0, 1,
-0.5370977, -0.342253, -2.950806, 0.2588235, 1, 0, 1,
-0.5367158, 0.6765883, -0.02388375, 0.254902, 1, 0, 1,
-0.5362833, 0.5560832, -2.016789, 0.2470588, 1, 0, 1,
-0.5323652, 0.9061116, -0.8179006, 0.2431373, 1, 0, 1,
-0.5270694, 0.04477948, -1.562261, 0.2352941, 1, 0, 1,
-0.5227375, -0.00572652, -1.011359, 0.2313726, 1, 0, 1,
-0.522547, -0.2735034, -1.998897, 0.2235294, 1, 0, 1,
-0.5204821, 0.7553858, -0.7919548, 0.2196078, 1, 0, 1,
-0.5126661, -0.9269931, -2.885209, 0.2117647, 1, 0, 1,
-0.5068212, 0.4506346, -3.024156, 0.2078431, 1, 0, 1,
-0.506593, -0.789065, -1.139273, 0.2, 1, 0, 1,
-0.5049717, -0.811166, -4.368383, 0.1921569, 1, 0, 1,
-0.4957365, 0.7533219, -0.4040785, 0.1882353, 1, 0, 1,
-0.4911876, 0.2584156, -1.87956, 0.1803922, 1, 0, 1,
-0.4889941, -1.34712, -2.957752, 0.1764706, 1, 0, 1,
-0.4845929, -0.4477031, -2.809125, 0.1686275, 1, 0, 1,
-0.4828189, -0.6704054, -0.4783544, 0.1647059, 1, 0, 1,
-0.4816058, -0.2152624, -2.585249, 0.1568628, 1, 0, 1,
-0.4808025, -1.014986, -1.558723, 0.1529412, 1, 0, 1,
-0.4775446, 0.8717913, -1.813845, 0.145098, 1, 0, 1,
-0.4751309, 1.666176, -0.2137488, 0.1411765, 1, 0, 1,
-0.474856, 0.7941961, 1.474277, 0.1333333, 1, 0, 1,
-0.4707462, -2.317212, -3.822318, 0.1294118, 1, 0, 1,
-0.4647171, 1.323308, 0.4193116, 0.1215686, 1, 0, 1,
-0.4640721, -0.6804172, -3.187834, 0.1176471, 1, 0, 1,
-0.4609006, 0.1615508, -1.331487, 0.1098039, 1, 0, 1,
-0.4530005, -0.1950236, -1.410553, 0.1058824, 1, 0, 1,
-0.4454695, -1.401158, -3.472011, 0.09803922, 1, 0, 1,
-0.4434891, -0.1697963, -3.392843, 0.09019608, 1, 0, 1,
-0.4371005, 0.1866675, 0.09250088, 0.08627451, 1, 0, 1,
-0.4340658, 1.53721, 0.4114224, 0.07843138, 1, 0, 1,
-0.4142286, -0.8117061, -1.246696, 0.07450981, 1, 0, 1,
-0.4100911, 0.9788747, -3.981718, 0.06666667, 1, 0, 1,
-0.4078812, 0.728682, 1.18694, 0.0627451, 1, 0, 1,
-0.4072046, 0.8459845, 0.4771724, 0.05490196, 1, 0, 1,
-0.4051165, -0.1413249, -3.990892, 0.05098039, 1, 0, 1,
-0.4044072, 0.1655146, -3.427474, 0.04313726, 1, 0, 1,
-0.4002807, 2.186437, 0.6483972, 0.03921569, 1, 0, 1,
-0.3960729, -1.713181, -4.63077, 0.03137255, 1, 0, 1,
-0.3938623, -0.5293224, -1.212546, 0.02745098, 1, 0, 1,
-0.3911513, 0.2581215, -1.161883, 0.01960784, 1, 0, 1,
-0.3888331, 0.4669683, -0.6460831, 0.01568628, 1, 0, 1,
-0.3872457, -1.068833, -2.556577, 0.007843138, 1, 0, 1,
-0.3834978, 0.9658176, 0.8513979, 0.003921569, 1, 0, 1,
-0.3834858, 0.7792948, -0.3969139, 0, 1, 0.003921569, 1,
-0.3818359, 1.450484, -0.4300851, 0, 1, 0.01176471, 1,
-0.3785799, 1.359413, 0.8368422, 0, 1, 0.01568628, 1,
-0.3759306, -0.1597599, -2.845498, 0, 1, 0.02352941, 1,
-0.3710021, 1.11219, -0.8009245, 0, 1, 0.02745098, 1,
-0.3684494, -1.638431, -3.96166, 0, 1, 0.03529412, 1,
-0.36558, -0.01080698, -3.564921, 0, 1, 0.03921569, 1,
-0.3610522, -0.326754, -2.516488, 0, 1, 0.04705882, 1,
-0.3594456, -0.5240024, -3.130419, 0, 1, 0.05098039, 1,
-0.3589469, 1.861106, -0.117836, 0, 1, 0.05882353, 1,
-0.3563826, 0.3647532, -1.638742, 0, 1, 0.0627451, 1,
-0.3555148, 0.1511987, 0.3999986, 0, 1, 0.07058824, 1,
-0.3551231, -0.7446851, -3.759703, 0, 1, 0.07450981, 1,
-0.3531716, 0.09087744, -0.2034745, 0, 1, 0.08235294, 1,
-0.3514959, -0.00157019, 0.09811379, 0, 1, 0.08627451, 1,
-0.3510056, 0.8826379, -1.91059, 0, 1, 0.09411765, 1,
-0.3506369, 0.652248, -0.6647542, 0, 1, 0.1019608, 1,
-0.3504707, 0.902942, 0.2111856, 0, 1, 0.1058824, 1,
-0.3503807, -2.744546, -4.32916, 0, 1, 0.1137255, 1,
-0.3471692, 0.4785599, -1.986533, 0, 1, 0.1176471, 1,
-0.339628, 0.7936888, -1.352051, 0, 1, 0.1254902, 1,
-0.332056, -2.015497, -1.24888, 0, 1, 0.1294118, 1,
-0.312868, 0.8686708, -0.4816307, 0, 1, 0.1372549, 1,
-0.3120043, -0.5650932, -3.55263, 0, 1, 0.1411765, 1,
-0.3077066, -0.3096637, -1.71702, 0, 1, 0.1490196, 1,
-0.307657, 0.2902306, -2.324741, 0, 1, 0.1529412, 1,
-0.3048501, 0.05215237, -0.8154796, 0, 1, 0.1607843, 1,
-0.3007681, 0.09745327, -1.274618, 0, 1, 0.1647059, 1,
-0.283174, -1.761696, -2.785508, 0, 1, 0.172549, 1,
-0.2823969, -1.424131, -2.691367, 0, 1, 0.1764706, 1,
-0.2821116, -1.139849, -3.718458, 0, 1, 0.1843137, 1,
-0.2815527, -0.7693924, -2.43403, 0, 1, 0.1882353, 1,
-0.2814347, -1.449473, -2.756251, 0, 1, 0.1960784, 1,
-0.2806873, -0.3191527, -3.139396, 0, 1, 0.2039216, 1,
-0.2765067, -0.7803779, -2.504138, 0, 1, 0.2078431, 1,
-0.276477, 0.5325838, -1.14129, 0, 1, 0.2156863, 1,
-0.2751369, 0.6255066, -1.221853, 0, 1, 0.2196078, 1,
-0.2741338, -1.051882, -1.607666, 0, 1, 0.227451, 1,
-0.2740847, 1.024449, -0.5580253, 0, 1, 0.2313726, 1,
-0.2734569, -0.2596009, -2.137245, 0, 1, 0.2392157, 1,
-0.2732761, -0.0005387269, -2.415634, 0, 1, 0.2431373, 1,
-0.269385, 0.05477632, -1.171031, 0, 1, 0.2509804, 1,
-0.2689492, -0.2943872, -2.282897, 0, 1, 0.254902, 1,
-0.2665405, -0.4718577, -3.809781, 0, 1, 0.2627451, 1,
-0.2661652, -1.141441, -2.041724, 0, 1, 0.2666667, 1,
-0.2648703, 0.1406722, -1.293835, 0, 1, 0.2745098, 1,
-0.2632631, -1.963085, -2.929495, 0, 1, 0.2784314, 1,
-0.2551099, -0.5984489, -2.898448, 0, 1, 0.2862745, 1,
-0.2488209, -0.5440911, -2.643665, 0, 1, 0.2901961, 1,
-0.2463644, -1.52282, -2.918129, 0, 1, 0.2980392, 1,
-0.244749, 0.8832574, -0.5184374, 0, 1, 0.3058824, 1,
-0.2431991, -0.1927744, -2.26482, 0, 1, 0.3098039, 1,
-0.2412184, -0.9831198, -4.999825, 0, 1, 0.3176471, 1,
-0.2404766, -0.6310928, -3.271651, 0, 1, 0.3215686, 1,
-0.2377036, 0.2379597, -0.4839951, 0, 1, 0.3294118, 1,
-0.2337062, 0.1592787, -2.091886, 0, 1, 0.3333333, 1,
-0.2298988, -0.6922529, -2.99089, 0, 1, 0.3411765, 1,
-0.2292111, 0.7893481, -0.5881377, 0, 1, 0.345098, 1,
-0.2183974, -0.6413681, -2.758181, 0, 1, 0.3529412, 1,
-0.2155904, 0.6050562, -1.410159, 0, 1, 0.3568628, 1,
-0.2075072, 2.245922, -0.5315593, 0, 1, 0.3647059, 1,
-0.204066, -0.1117997, -1.265979, 0, 1, 0.3686275, 1,
-0.2026272, -0.03444903, -0.4594392, 0, 1, 0.3764706, 1,
-0.2018565, 0.7857853, 0.2741752, 0, 1, 0.3803922, 1,
-0.2003436, 1.069626, -1.497077, 0, 1, 0.3882353, 1,
-0.2003011, -0.180746, -1.520658, 0, 1, 0.3921569, 1,
-0.2002304, 0.6347441, -1.028385, 0, 1, 0.4, 1,
-0.198553, -0.7187712, -1.894284, 0, 1, 0.4078431, 1,
-0.1933425, -0.9977412, -3.84934, 0, 1, 0.4117647, 1,
-0.1908597, 0.4301874, -0.4906048, 0, 1, 0.4196078, 1,
-0.1857081, -1.071458, -2.577513, 0, 1, 0.4235294, 1,
-0.1830418, 1.543782, -1.038988, 0, 1, 0.4313726, 1,
-0.1830382, 0.7859198, -0.05737112, 0, 1, 0.4352941, 1,
-0.1818972, 0.001095561, -0.33775, 0, 1, 0.4431373, 1,
-0.1817451, -1.437322, -0.74881, 0, 1, 0.4470588, 1,
-0.1794106, -0.1755734, -2.589083, 0, 1, 0.454902, 1,
-0.1778807, 0.4617369, 1.341068, 0, 1, 0.4588235, 1,
-0.1767014, 0.584325, -0.3064441, 0, 1, 0.4666667, 1,
-0.1766898, -1.304098, -2.94599, 0, 1, 0.4705882, 1,
-0.1758924, 0.5140179, 1.955548, 0, 1, 0.4784314, 1,
-0.1723631, -0.8280703, -2.437504, 0, 1, 0.4823529, 1,
-0.1700363, -1.023321, -2.99227, 0, 1, 0.4901961, 1,
-0.1672474, 0.2911015, -0.3800081, 0, 1, 0.4941176, 1,
-0.1661535, 2.066584, 0.1335274, 0, 1, 0.5019608, 1,
-0.1652924, -1.338112, -1.896156, 0, 1, 0.509804, 1,
-0.1644778, 0.09350482, -0.737976, 0, 1, 0.5137255, 1,
-0.1642685, 0.3141794, 1.047767, 0, 1, 0.5215687, 1,
-0.1635886, 1.151896, 0.4677857, 0, 1, 0.5254902, 1,
-0.1622574, -2.798166, -4.206806, 0, 1, 0.5333334, 1,
-0.1621587, -0.6482728, -3.78548, 0, 1, 0.5372549, 1,
-0.1616338, 0.715235, 0.06281518, 0, 1, 0.5450981, 1,
-0.1569344, -1.003649, -2.670475, 0, 1, 0.5490196, 1,
-0.1565139, 0.5541388, -0.7195024, 0, 1, 0.5568628, 1,
-0.1514509, -0.5104094, -1.07526, 0, 1, 0.5607843, 1,
-0.1513011, -0.5992239, -4.584797, 0, 1, 0.5686275, 1,
-0.14998, 1.090872, 1.352163, 0, 1, 0.572549, 1,
-0.1478323, 0.2704405, -0.8667547, 0, 1, 0.5803922, 1,
-0.1432472, 0.8594445, -0.5858002, 0, 1, 0.5843138, 1,
-0.1422466, 0.764433, -1.35834, 0, 1, 0.5921569, 1,
-0.1400722, 0.01108257, -2.147234, 0, 1, 0.5960785, 1,
-0.1396026, -0.6019062, -2.801931, 0, 1, 0.6039216, 1,
-0.1255703, 1.387757, 0.05792142, 0, 1, 0.6117647, 1,
-0.1253759, 0.8806473, 0.7616988, 0, 1, 0.6156863, 1,
-0.1216309, -0.3816946, -4.063361, 0, 1, 0.6235294, 1,
-0.1210138, -1.863617, -1.050117, 0, 1, 0.627451, 1,
-0.1205142, -1.267223, -3.28523, 0, 1, 0.6352941, 1,
-0.1180791, -1.395113, -4.745309, 0, 1, 0.6392157, 1,
-0.1170262, 0.7277045, -1.578632, 0, 1, 0.6470588, 1,
-0.1169621, -0.3884784, -2.969513, 0, 1, 0.6509804, 1,
-0.1077816, 0.3559489, 0.4615613, 0, 1, 0.6588235, 1,
-0.1071959, 0.09017612, -1.87327, 0, 1, 0.6627451, 1,
-0.106646, -0.8275628, -3.937394, 0, 1, 0.6705883, 1,
-0.1022417, -0.6509696, -1.442615, 0, 1, 0.6745098, 1,
-0.102103, 0.0226296, -1.957003, 0, 1, 0.682353, 1,
-0.09453798, 1.902884, -0.08488519, 0, 1, 0.6862745, 1,
-0.09262946, -1.347172, -2.43728, 0, 1, 0.6941177, 1,
-0.09068009, 1.567388, 1.563977, 0, 1, 0.7019608, 1,
-0.08767365, -0.2429513, -3.171494, 0, 1, 0.7058824, 1,
-0.08743381, 0.6278934, 0.1708117, 0, 1, 0.7137255, 1,
-0.08735618, 0.9457307, 0.5161075, 0, 1, 0.7176471, 1,
-0.08685534, -0.8036382, -2.815489, 0, 1, 0.7254902, 1,
-0.08675846, -1.552246, -3.250746, 0, 1, 0.7294118, 1,
-0.08622515, 0.7661058, -0.8841537, 0, 1, 0.7372549, 1,
-0.08399823, 0.3209683, 0.2893545, 0, 1, 0.7411765, 1,
-0.08181851, 0.3708062, -0.8109398, 0, 1, 0.7490196, 1,
-0.07887802, 0.4579154, 0.3447872, 0, 1, 0.7529412, 1,
-0.07258512, 1.838069, 1.02146, 0, 1, 0.7607843, 1,
-0.07230705, -0.8929002, -3.269318, 0, 1, 0.7647059, 1,
-0.0670017, 0.2352642, -1.1378, 0, 1, 0.772549, 1,
-0.06195733, 1.527434, 1.040769, 0, 1, 0.7764706, 1,
-0.06180562, 0.03968164, 1.534622, 0, 1, 0.7843137, 1,
-0.0577369, 0.4924791, 0.9378818, 0, 1, 0.7882353, 1,
-0.05504321, -1.000916, -2.933177, 0, 1, 0.7960784, 1,
-0.05436325, 0.760982, -0.1810152, 0, 1, 0.8039216, 1,
-0.05318737, 1.509429, -0.6534711, 0, 1, 0.8078431, 1,
-0.05253256, -1.284871, -4.106895, 0, 1, 0.8156863, 1,
-0.05212338, 0.1288759, -1.25995, 0, 1, 0.8196079, 1,
-0.05166946, 0.5631028, -0.06247443, 0, 1, 0.827451, 1,
-0.05140384, -0.9694779, -4.985215, 0, 1, 0.8313726, 1,
-0.04860985, 0.4883527, 0.06468173, 0, 1, 0.8392157, 1,
-0.04835597, 0.5871961, 0.5729094, 0, 1, 0.8431373, 1,
-0.04402384, -0.3658445, -3.947315, 0, 1, 0.8509804, 1,
-0.03113141, 0.7610246, 0.2773981, 0, 1, 0.854902, 1,
-0.02481916, -1.025934, -4.762658, 0, 1, 0.8627451, 1,
-0.02422787, 0.04782842, 0.24498, 0, 1, 0.8666667, 1,
-0.02283474, -1.40615, -3.008577, 0, 1, 0.8745098, 1,
-0.02244932, 0.9377367, -1.478303, 0, 1, 0.8784314, 1,
-0.02094179, -1.383777, -3.194595, 0, 1, 0.8862745, 1,
-0.01823511, 0.2113182, -1.881351, 0, 1, 0.8901961, 1,
-0.01605232, -1.467185, -3.075511, 0, 1, 0.8980392, 1,
-0.0145432, 0.1595228, 0.8620842, 0, 1, 0.9058824, 1,
-0.01292826, -0.1736963, -2.95618, 0, 1, 0.9098039, 1,
-0.01037582, -0.62306, -2.202144, 0, 1, 0.9176471, 1,
-0.002115596, 0.9205911, 0.4079647, 0, 1, 0.9215686, 1,
-0.001849006, 1.097735, 0.1646091, 0, 1, 0.9294118, 1,
0.001356521, 0.5372676, 0.6063696, 0, 1, 0.9333333, 1,
0.007507847, 0.2280937, -0.2690547, 0, 1, 0.9411765, 1,
0.009686548, -0.7218303, 4.805373, 0, 1, 0.945098, 1,
0.01421949, -0.5428929, 3.113529, 0, 1, 0.9529412, 1,
0.01527089, -0.3546054, 2.198115, 0, 1, 0.9568627, 1,
0.0203073, -0.5378663, 3.658805, 0, 1, 0.9647059, 1,
0.02211356, -2.183647, 3.892282, 0, 1, 0.9686275, 1,
0.02257114, -1.609743, 3.347904, 0, 1, 0.9764706, 1,
0.03017427, 0.001638306, 3.496916, 0, 1, 0.9803922, 1,
0.03502231, -0.3750232, 2.510911, 0, 1, 0.9882353, 1,
0.04021377, -0.190751, 3.90819, 0, 1, 0.9921569, 1,
0.04389454, -0.8652525, 3.795151, 0, 1, 1, 1,
0.04466354, 1.281728, 0.5213836, 0, 0.9921569, 1, 1,
0.04974941, 0.2032605, -0.5342672, 0, 0.9882353, 1, 1,
0.05182127, -1.702151, 3.834517, 0, 0.9803922, 1, 1,
0.05418273, 1.231051, -0.9277898, 0, 0.9764706, 1, 1,
0.05885052, 0.6031279, 0.02772426, 0, 0.9686275, 1, 1,
0.05942502, -1.109446, 4.996407, 0, 0.9647059, 1, 1,
0.05951229, 1.883206, 0.09684507, 0, 0.9568627, 1, 1,
0.06178895, -1.239366, 4.035205, 0, 0.9529412, 1, 1,
0.06276964, -2.500887, 4.509488, 0, 0.945098, 1, 1,
0.06338698, -0.1313496, 3.923035, 0, 0.9411765, 1, 1,
0.06566423, 0.4318918, 1.012426, 0, 0.9333333, 1, 1,
0.06985489, -0.7134463, 2.486688, 0, 0.9294118, 1, 1,
0.07172383, 0.8043785, 1.571384, 0, 0.9215686, 1, 1,
0.07240504, -0.4411161, 4.442704, 0, 0.9176471, 1, 1,
0.07293381, 0.08740775, 0.2397671, 0, 0.9098039, 1, 1,
0.07319246, 1.377794, 0.9861599, 0, 0.9058824, 1, 1,
0.07517933, 0.5393705, 0.03539207, 0, 0.8980392, 1, 1,
0.07657704, 2.040398, -0.1689829, 0, 0.8901961, 1, 1,
0.07812079, 0.503185, 0.5937733, 0, 0.8862745, 1, 1,
0.0781443, -1.922915, 2.673081, 0, 0.8784314, 1, 1,
0.08007947, -0.8628746, 4.355973, 0, 0.8745098, 1, 1,
0.08084975, 0.4495793, -0.0006401684, 0, 0.8666667, 1, 1,
0.08387552, 2.547226, 0.5614514, 0, 0.8627451, 1, 1,
0.08642216, -0.4821321, 4.620273, 0, 0.854902, 1, 1,
0.08830774, 0.3636142, 0.4925452, 0, 0.8509804, 1, 1,
0.08864956, -0.7172034, 1.939398, 0, 0.8431373, 1, 1,
0.09004486, -2.305822, 0.9632311, 0, 0.8392157, 1, 1,
0.09052645, 0.03508369, 2.205741, 0, 0.8313726, 1, 1,
0.09210465, -0.0567721, 1.821359, 0, 0.827451, 1, 1,
0.09596442, -0.02192567, 1.745734, 0, 0.8196079, 1, 1,
0.09766818, -1.779207, 2.45022, 0, 0.8156863, 1, 1,
0.09927584, -1.165373, 2.195613, 0, 0.8078431, 1, 1,
0.1009873, -0.00609227, 2.090901, 0, 0.8039216, 1, 1,
0.1035313, -0.03133409, 1.808933, 0, 0.7960784, 1, 1,
0.1043311, 0.3474685, -0.3395039, 0, 0.7882353, 1, 1,
0.105222, -0.9283498, 2.256681, 0, 0.7843137, 1, 1,
0.1117295, -0.8534145, 3.22666, 0, 0.7764706, 1, 1,
0.1135025, 0.3900014, 0.9019381, 0, 0.772549, 1, 1,
0.1168652, 0.5584517, 0.2595415, 0, 0.7647059, 1, 1,
0.1176569, -0.6490847, 4.11091, 0, 0.7607843, 1, 1,
0.1187605, 0.001548749, 1.470193, 0, 0.7529412, 1, 1,
0.1191428, -0.2718796, 2.673476, 0, 0.7490196, 1, 1,
0.1196204, -0.6354537, 0.7163855, 0, 0.7411765, 1, 1,
0.1207737, 0.4644784, 0.9491647, 0, 0.7372549, 1, 1,
0.1245967, 0.1617094, -0.3037966, 0, 0.7294118, 1, 1,
0.1252789, -0.2773554, 3.740681, 0, 0.7254902, 1, 1,
0.125843, 0.5102835, 0.8939304, 0, 0.7176471, 1, 1,
0.1302372, -0.1573016, 1.363745, 0, 0.7137255, 1, 1,
0.1305497, -1.792937, 3.171986, 0, 0.7058824, 1, 1,
0.1306513, -1.674861, 3.039807, 0, 0.6980392, 1, 1,
0.1314652, 0.5191619, 1.542593, 0, 0.6941177, 1, 1,
0.1332281, 1.175415, 1.182595, 0, 0.6862745, 1, 1,
0.1339023, -0.4562869, 3.106395, 0, 0.682353, 1, 1,
0.1343362, 0.5606112, 0.1823084, 0, 0.6745098, 1, 1,
0.1376245, -1.133877, 1.352533, 0, 0.6705883, 1, 1,
0.14066, -1.015227, 2.403151, 0, 0.6627451, 1, 1,
0.144959, -0.3715299, 4.494809, 0, 0.6588235, 1, 1,
0.1480087, -0.1906926, 2.8756, 0, 0.6509804, 1, 1,
0.1502145, 0.8879257, -0.2342621, 0, 0.6470588, 1, 1,
0.1544086, 1.326758, 0.1063974, 0, 0.6392157, 1, 1,
0.1571667, -0.1050468, 1.727453, 0, 0.6352941, 1, 1,
0.1608404, 0.8060005, 0.3341847, 0, 0.627451, 1, 1,
0.162489, 1.503695, 0.9590142, 0, 0.6235294, 1, 1,
0.1629114, -0.2380952, 3.165247, 0, 0.6156863, 1, 1,
0.1644688, 0.963567, 1.468998, 0, 0.6117647, 1, 1,
0.1650473, -1.114575, 2.275491, 0, 0.6039216, 1, 1,
0.1669401, 1.149761, 0.0160766, 0, 0.5960785, 1, 1,
0.1676441, -1.001184, 2.10411, 0, 0.5921569, 1, 1,
0.1728893, -1.739424, 1.413268, 0, 0.5843138, 1, 1,
0.1752894, 0.4768509, 0.7439228, 0, 0.5803922, 1, 1,
0.1759101, -1.531555, 3.277308, 0, 0.572549, 1, 1,
0.1766493, 1.487097, 0.3975532, 0, 0.5686275, 1, 1,
0.1771223, 0.7133251, 1.796625, 0, 0.5607843, 1, 1,
0.1808928, -0.2634716, 2.911588, 0, 0.5568628, 1, 1,
0.1816511, 1.257424, 0.6790569, 0, 0.5490196, 1, 1,
0.1828594, 1.445267, -0.1602031, 0, 0.5450981, 1, 1,
0.1829247, -1.475516, 1.690333, 0, 0.5372549, 1, 1,
0.1843569, -0.8053082, 0.9377249, 0, 0.5333334, 1, 1,
0.1850793, 2.259868, 2.435814, 0, 0.5254902, 1, 1,
0.1910233, 1.990014, 1.761325, 0, 0.5215687, 1, 1,
0.1919005, -0.9231924, 2.312641, 0, 0.5137255, 1, 1,
0.1927635, -0.8691505, 1.637197, 0, 0.509804, 1, 1,
0.1937704, -0.8745031, 3.290826, 0, 0.5019608, 1, 1,
0.194606, -1.18355, 2.264795, 0, 0.4941176, 1, 1,
0.1984823, -1.20829, 3.474176, 0, 0.4901961, 1, 1,
0.2014737, -0.03045482, 1.002243, 0, 0.4823529, 1, 1,
0.2079581, -0.4430737, 3.819541, 0, 0.4784314, 1, 1,
0.2086826, -0.002145581, 1.496512, 0, 0.4705882, 1, 1,
0.2119087, 0.8630033, 0.07712843, 0, 0.4666667, 1, 1,
0.216627, 0.9091156, 0.3652775, 0, 0.4588235, 1, 1,
0.2175116, -0.1393323, 1.740451, 0, 0.454902, 1, 1,
0.2183977, -1.573465, 2.438648, 0, 0.4470588, 1, 1,
0.2192454, -0.4615344, 2.237686, 0, 0.4431373, 1, 1,
0.2212805, 0.9400051, -0.9630821, 0, 0.4352941, 1, 1,
0.2215371, 0.04919234, 1.303403, 0, 0.4313726, 1, 1,
0.2265014, -0.2828529, 2.748794, 0, 0.4235294, 1, 1,
0.2271644, -0.9652992, 1.996694, 0, 0.4196078, 1, 1,
0.2277015, 0.8167647, 1.202975, 0, 0.4117647, 1, 1,
0.2284049, 0.8979952, -0.1728807, 0, 0.4078431, 1, 1,
0.2289389, -0.5459157, 3.48207, 0, 0.4, 1, 1,
0.2300153, -0.3758879, 3.679712, 0, 0.3921569, 1, 1,
0.2357984, -0.7997597, 3.526128, 0, 0.3882353, 1, 1,
0.2366282, 0.05409174, 2.161573, 0, 0.3803922, 1, 1,
0.2389476, -1.739472, 3.239791, 0, 0.3764706, 1, 1,
0.2403799, 0.9571565, -0.8119034, 0, 0.3686275, 1, 1,
0.2413708, -0.9071898, 2.424773, 0, 0.3647059, 1, 1,
0.242505, 0.8482314, 0.5111948, 0, 0.3568628, 1, 1,
0.2445049, -0.09899817, 3.489891, 0, 0.3529412, 1, 1,
0.2474938, -0.5884685, 0.9813212, 0, 0.345098, 1, 1,
0.2479197, -0.2211768, 2.729164, 0, 0.3411765, 1, 1,
0.2483056, 1.016188, -0.4173945, 0, 0.3333333, 1, 1,
0.2506415, -1.051865, 2.242406, 0, 0.3294118, 1, 1,
0.2530018, 1.810186, -0.9302902, 0, 0.3215686, 1, 1,
0.2546909, -1.615261, 2.765888, 0, 0.3176471, 1, 1,
0.2567249, -2.232017, 1.778404, 0, 0.3098039, 1, 1,
0.2614205, 0.5434249, 0.1133826, 0, 0.3058824, 1, 1,
0.2625294, 0.4336507, -0.2951446, 0, 0.2980392, 1, 1,
0.267659, -0.4046616, 0.1584534, 0, 0.2901961, 1, 1,
0.2683604, 2.0345, -0.8302288, 0, 0.2862745, 1, 1,
0.2728094, -0.6861585, 1.08663, 0, 0.2784314, 1, 1,
0.2729855, 0.03609645, 1.463855, 0, 0.2745098, 1, 1,
0.2756911, 0.8830171, 2.025845, 0, 0.2666667, 1, 1,
0.2785809, -1.172446, 2.60905, 0, 0.2627451, 1, 1,
0.2786705, -0.3114327, 4.034871, 0, 0.254902, 1, 1,
0.2891729, -0.4090484, 3.048857, 0, 0.2509804, 1, 1,
0.2921007, 1.679467, -0.2844244, 0, 0.2431373, 1, 1,
0.3018251, 0.2951203, 0.8340339, 0, 0.2392157, 1, 1,
0.3038444, 0.3813799, 0.2004919, 0, 0.2313726, 1, 1,
0.3070559, 1.025361, 1.069618, 0, 0.227451, 1, 1,
0.3079295, -0.4782149, 3.261921, 0, 0.2196078, 1, 1,
0.3112, -1.465552, 2.64962, 0, 0.2156863, 1, 1,
0.3151756, -1.247607, 3.214956, 0, 0.2078431, 1, 1,
0.3190933, -0.5313303, 1.898199, 0, 0.2039216, 1, 1,
0.3197902, 1.455749, -0.08575819, 0, 0.1960784, 1, 1,
0.3220927, -0.4593473, 2.650717, 0, 0.1882353, 1, 1,
0.3250212, 0.6091619, 1.880026, 0, 0.1843137, 1, 1,
0.326131, 0.8667101, 0.6045054, 0, 0.1764706, 1, 1,
0.3269397, 0.3087797, 1.574906, 0, 0.172549, 1, 1,
0.3301812, 1.648624, 1.172812, 0, 0.1647059, 1, 1,
0.33069, 1.057129, 0.01158764, 0, 0.1607843, 1, 1,
0.3314741, 0.4802008, 0.526426, 0, 0.1529412, 1, 1,
0.3346587, 0.5771524, 0.1347429, 0, 0.1490196, 1, 1,
0.3412979, -2.016908, 3.992999, 0, 0.1411765, 1, 1,
0.3414633, 0.09901936, 2.421391, 0, 0.1372549, 1, 1,
0.3421411, 0.1032001, 1.43496, 0, 0.1294118, 1, 1,
0.3459759, 0.3832471, 0.03773769, 0, 0.1254902, 1, 1,
0.3475621, -1.417072, 2.119371, 0, 0.1176471, 1, 1,
0.3477188, -0.9115303, 2.286434, 0, 0.1137255, 1, 1,
0.3480657, 1.586159, 1.645194, 0, 0.1058824, 1, 1,
0.3484488, 0.1067815, 0.271947, 0, 0.09803922, 1, 1,
0.3505457, -0.6557336, 1.666268, 0, 0.09411765, 1, 1,
0.3541387, 1.196112, -0.1144535, 0, 0.08627451, 1, 1,
0.3555434, -1.038401, 2.664175, 0, 0.08235294, 1, 1,
0.3625375, 0.763406, -0.01148717, 0, 0.07450981, 1, 1,
0.3668932, -0.08585976, 2.387658, 0, 0.07058824, 1, 1,
0.3709431, -0.5983577, 1.56686, 0, 0.0627451, 1, 1,
0.3715357, -0.2481866, 2.378637, 0, 0.05882353, 1, 1,
0.3762482, -0.05847067, 0.1837883, 0, 0.05098039, 1, 1,
0.3767498, 0.8944183, 0.2287476, 0, 0.04705882, 1, 1,
0.3799247, 0.4696213, 0.8109758, 0, 0.03921569, 1, 1,
0.3919986, -1.291726, 4.574408, 0, 0.03529412, 1, 1,
0.3972293, -1.420499, 2.940026, 0, 0.02745098, 1, 1,
0.3973325, -0.5860548, 1.769436, 0, 0.02352941, 1, 1,
0.405318, -2.072052, 3.181716, 0, 0.01568628, 1, 1,
0.4074146, 0.9565314, 1.172338, 0, 0.01176471, 1, 1,
0.4076498, 0.8441669, -0.5823882, 0, 0.003921569, 1, 1,
0.407686, 1.517621, 0.4653867, 0.003921569, 0, 1, 1,
0.4118612, -1.236703, 4.563254, 0.007843138, 0, 1, 1,
0.4140908, -0.9020025, 3.999629, 0.01568628, 0, 1, 1,
0.4157982, -0.3097084, 3.422523, 0.01960784, 0, 1, 1,
0.4193347, -0.7908182, 4.235, 0.02745098, 0, 1, 1,
0.4253755, 0.2778938, -0.5482526, 0.03137255, 0, 1, 1,
0.425651, -0.4673851, 3.202531, 0.03921569, 0, 1, 1,
0.4263047, 0.1535609, 1.315142, 0.04313726, 0, 1, 1,
0.4280172, 0.2961239, 0.402684, 0.05098039, 0, 1, 1,
0.4297351, 1.006225, 1.637596, 0.05490196, 0, 1, 1,
0.4300782, -1.761801, 2.659984, 0.0627451, 0, 1, 1,
0.4306798, 0.3029386, 0.5515556, 0.06666667, 0, 1, 1,
0.4430557, 1.058245, -1.411389, 0.07450981, 0, 1, 1,
0.4459672, 2.362224, -0.634092, 0.07843138, 0, 1, 1,
0.4464466, 0.4117356, 1.31939, 0.08627451, 0, 1, 1,
0.4476745, 1.077747, 0.1730222, 0.09019608, 0, 1, 1,
0.4479788, 0.445121, 0.4052025, 0.09803922, 0, 1, 1,
0.4481566, 0.6126962, 2.8157, 0.1058824, 0, 1, 1,
0.4519853, -1.793615, 5.279584, 0.1098039, 0, 1, 1,
0.4553437, 0.8904516, 1.35652, 0.1176471, 0, 1, 1,
0.45807, 0.2733363, 0.2698698, 0.1215686, 0, 1, 1,
0.4615892, 0.3363488, 1.112952, 0.1294118, 0, 1, 1,
0.4627694, 0.2255139, 0.7441176, 0.1333333, 0, 1, 1,
0.4631938, 0.8633221, -0.03119837, 0.1411765, 0, 1, 1,
0.4772772, -1.236343, 2.705958, 0.145098, 0, 1, 1,
0.4785392, 0.8033992, 0.2348145, 0.1529412, 0, 1, 1,
0.4805939, -0.5936266, 1.960356, 0.1568628, 0, 1, 1,
0.4853135, -0.5495263, 1.831282, 0.1647059, 0, 1, 1,
0.4853154, 0.7033229, 0.6541087, 0.1686275, 0, 1, 1,
0.4896104, -0.6022367, 0.7333066, 0.1764706, 0, 1, 1,
0.4951354, 0.6698371, 1.048151, 0.1803922, 0, 1, 1,
0.4957555, -1.594319, 4.066174, 0.1882353, 0, 1, 1,
0.4982514, -0.3215574, 1.548179, 0.1921569, 0, 1, 1,
0.4986693, 1.131453, 1.279698, 0.2, 0, 1, 1,
0.5002356, -0.1925173, 2.103407, 0.2078431, 0, 1, 1,
0.5016038, 0.07635614, 0.3679252, 0.2117647, 0, 1, 1,
0.5127127, 0.7319906, 0.3328977, 0.2196078, 0, 1, 1,
0.5143315, -0.354931, 2.998458, 0.2235294, 0, 1, 1,
0.5186363, 1.038255, -0.0269724, 0.2313726, 0, 1, 1,
0.5206143, 0.3438073, 0.1755136, 0.2352941, 0, 1, 1,
0.5229989, 0.4900464, 1.727008, 0.2431373, 0, 1, 1,
0.5248734, 0.0762742, 2.184275, 0.2470588, 0, 1, 1,
0.5289624, 0.2182602, 2.363176, 0.254902, 0, 1, 1,
0.5317179, 0.857464, 0.02924472, 0.2588235, 0, 1, 1,
0.5338686, 0.3678902, -0.675412, 0.2666667, 0, 1, 1,
0.5348825, -1.248693, 4.195117, 0.2705882, 0, 1, 1,
0.5394186, 1.190566, -1.397104, 0.2784314, 0, 1, 1,
0.544677, 1.012124, 1.274936, 0.282353, 0, 1, 1,
0.5462268, -0.4819518, 0.6364422, 0.2901961, 0, 1, 1,
0.5464876, -0.2110613, 2.854486, 0.2941177, 0, 1, 1,
0.5481263, -0.7954171, 3.442367, 0.3019608, 0, 1, 1,
0.5499058, -0.06515335, 3.222583, 0.3098039, 0, 1, 1,
0.5528426, 1.121643, 1.177321, 0.3137255, 0, 1, 1,
0.5534545, -0.6182393, 1.971145, 0.3215686, 0, 1, 1,
0.5553836, 0.5669429, 0.8652915, 0.3254902, 0, 1, 1,
0.5672961, 0.2580417, 1.218685, 0.3333333, 0, 1, 1,
0.5696956, -0.1049253, 1.26622, 0.3372549, 0, 1, 1,
0.5711018, -0.5415121, 2.140725, 0.345098, 0, 1, 1,
0.5804658, 1.485398, 0.8065568, 0.3490196, 0, 1, 1,
0.584178, -0.7873877, 0.7077047, 0.3568628, 0, 1, 1,
0.5850466, 0.5758532, 0.8232405, 0.3607843, 0, 1, 1,
0.5898732, -1.273349, 3.885851, 0.3686275, 0, 1, 1,
0.593733, 2.234937, -0.09178936, 0.372549, 0, 1, 1,
0.5963981, 1.709889, 0.3191369, 0.3803922, 0, 1, 1,
0.5966619, 0.2381327, 0.6425886, 0.3843137, 0, 1, 1,
0.5987423, -1.138195, 2.634084, 0.3921569, 0, 1, 1,
0.6000831, -0.4209858, 1.002185, 0.3960784, 0, 1, 1,
0.6018564, -0.8079991, 1.739071, 0.4039216, 0, 1, 1,
0.608976, -1.396997, 1.936567, 0.4117647, 0, 1, 1,
0.6106822, 0.02324448, 0.3113233, 0.4156863, 0, 1, 1,
0.6107226, -0.4751651, 2.544948, 0.4235294, 0, 1, 1,
0.6118298, -1.377369, 2.397663, 0.427451, 0, 1, 1,
0.6142429, -0.2313983, -0.7516961, 0.4352941, 0, 1, 1,
0.6184747, 0.7994035, 1.673189, 0.4392157, 0, 1, 1,
0.620425, 0.2076289, 2.284551, 0.4470588, 0, 1, 1,
0.6218787, -0.4393153, 2.107126, 0.4509804, 0, 1, 1,
0.6221371, -2.275332, 2.43054, 0.4588235, 0, 1, 1,
0.6253648, 2.147902, 1.584705, 0.4627451, 0, 1, 1,
0.6266649, -1.434526, 3.623212, 0.4705882, 0, 1, 1,
0.6310418, -1.505033, 1.94374, 0.4745098, 0, 1, 1,
0.6374462, 1.899293, 0.1958133, 0.4823529, 0, 1, 1,
0.6412043, -1.138162, 2.875141, 0.4862745, 0, 1, 1,
0.6424761, 1.083436, 1.455491, 0.4941176, 0, 1, 1,
0.6462575, 0.8511062, 0.513187, 0.5019608, 0, 1, 1,
0.6474347, -0.004235139, 2.514276, 0.5058824, 0, 1, 1,
0.6492168, 0.3873527, 1.724082, 0.5137255, 0, 1, 1,
0.6524848, -1.069808, -0.02215841, 0.5176471, 0, 1, 1,
0.6560544, 0.4405489, 1.761444, 0.5254902, 0, 1, 1,
0.6601091, 1.270407, 1.000409, 0.5294118, 0, 1, 1,
0.6606415, 1.499699, 1.587566, 0.5372549, 0, 1, 1,
0.6646194, 0.7317182, 2.112983, 0.5411765, 0, 1, 1,
0.6665674, -1.258635, 2.318726, 0.5490196, 0, 1, 1,
0.6667112, -0.459516, 2.448872, 0.5529412, 0, 1, 1,
0.6766729, 0.3450673, 2.252239, 0.5607843, 0, 1, 1,
0.678436, 0.3586168, 1.506279, 0.5647059, 0, 1, 1,
0.687701, 0.7120211, 1.87138, 0.572549, 0, 1, 1,
0.6883362, 0.896585, 0.9406452, 0.5764706, 0, 1, 1,
0.6893364, -0.280606, 2.141598, 0.5843138, 0, 1, 1,
0.6903909, -0.260238, 1.696706, 0.5882353, 0, 1, 1,
0.6931654, 1.329709, -1.363076, 0.5960785, 0, 1, 1,
0.6933726, 0.1947891, 1.024618, 0.6039216, 0, 1, 1,
0.7153686, -0.3239185, 2.43473, 0.6078432, 0, 1, 1,
0.716026, 0.754447, 0.560338, 0.6156863, 0, 1, 1,
0.7196578, -0.9122176, 0.8698553, 0.6196079, 0, 1, 1,
0.7279661, 0.9312499, -1.357251, 0.627451, 0, 1, 1,
0.7284876, 0.2722389, 1.593821, 0.6313726, 0, 1, 1,
0.7322997, 0.4812734, 0.4950331, 0.6392157, 0, 1, 1,
0.7380005, 0.121463, 1.002624, 0.6431373, 0, 1, 1,
0.7426873, 0.7967942, -0.4674656, 0.6509804, 0, 1, 1,
0.7456049, -1.979135, 4.371261, 0.654902, 0, 1, 1,
0.7460132, -0.000976824, 2.209481, 0.6627451, 0, 1, 1,
0.7613193, 0.981108, 0.2140948, 0.6666667, 0, 1, 1,
0.7684697, 0.05394186, 1.806086, 0.6745098, 0, 1, 1,
0.7815547, 1.451735, -0.6354265, 0.6784314, 0, 1, 1,
0.7872319, -0.2736536, 1.23231, 0.6862745, 0, 1, 1,
0.7909479, -1.564644, 2.567131, 0.6901961, 0, 1, 1,
0.7989979, -0.3394069, 2.376563, 0.6980392, 0, 1, 1,
0.8001892, 1.435915, -0.766919, 0.7058824, 0, 1, 1,
0.8045327, -0.6533278, 2.487692, 0.7098039, 0, 1, 1,
0.809083, -1.347113, 2.001698, 0.7176471, 0, 1, 1,
0.8195955, 1.628118, 0.9193038, 0.7215686, 0, 1, 1,
0.8249266, -1.308147, 1.799132, 0.7294118, 0, 1, 1,
0.8259072, 0.09383461, 0.9743894, 0.7333333, 0, 1, 1,
0.8331544, 0.5796753, 0.6064253, 0.7411765, 0, 1, 1,
0.834311, -0.03164541, 0.9559352, 0.7450981, 0, 1, 1,
0.8427658, 1.259025, 1.239522, 0.7529412, 0, 1, 1,
0.8460144, 1.022557, 2.227369, 0.7568628, 0, 1, 1,
0.8495834, 0.199435, 1.279265, 0.7647059, 0, 1, 1,
0.8502229, -1.025633, 2.934517, 0.7686275, 0, 1, 1,
0.8503346, 0.6777975, 1.2263, 0.7764706, 0, 1, 1,
0.8544356, 0.2518938, 0.7563268, 0.7803922, 0, 1, 1,
0.8546703, -0.5630898, 1.995016, 0.7882353, 0, 1, 1,
0.8550208, 1.058362, 1.014504, 0.7921569, 0, 1, 1,
0.8617159, -0.8368473, 2.637701, 0.8, 0, 1, 1,
0.8627219, -0.02198795, 2.344134, 0.8078431, 0, 1, 1,
0.8641407, 0.7067971, 2.183555, 0.8117647, 0, 1, 1,
0.8642073, 0.1876918, 1.997673, 0.8196079, 0, 1, 1,
0.8642516, 0.09014526, 1.488825, 0.8235294, 0, 1, 1,
0.8728932, -0.7958607, 1.824552, 0.8313726, 0, 1, 1,
0.8871731, 0.1830581, 1.587255, 0.8352941, 0, 1, 1,
0.8877387, 1.432491, -0.5019928, 0.8431373, 0, 1, 1,
0.8883758, 0.3491311, 1.227271, 0.8470588, 0, 1, 1,
0.8957174, 0.02361413, 0.8562896, 0.854902, 0, 1, 1,
0.8957732, -0.1844485, 0.02865975, 0.8588235, 0, 1, 1,
0.8984785, -1.421557, 3.282151, 0.8666667, 0, 1, 1,
0.8992504, 1.335221, 2.142784, 0.8705882, 0, 1, 1,
0.901053, 0.1542047, -0.2694646, 0.8784314, 0, 1, 1,
0.9012183, 1.422884, 0.6138707, 0.8823529, 0, 1, 1,
0.9058717, 2.363984, 0.2169379, 0.8901961, 0, 1, 1,
0.9063854, 0.4114647, -0.4825484, 0.8941177, 0, 1, 1,
0.907953, -0.5809332, 1.237956, 0.9019608, 0, 1, 1,
0.9153425, 0.3802831, 1.60882, 0.9098039, 0, 1, 1,
0.9209281, 0.4997302, 1.29132, 0.9137255, 0, 1, 1,
0.923907, -1.514778, 1.998821, 0.9215686, 0, 1, 1,
0.9271227, -0.242882, 1.329626, 0.9254902, 0, 1, 1,
0.9283947, 0.5268567, 1.800853, 0.9333333, 0, 1, 1,
0.9306309, -0.007458653, 3.115061, 0.9372549, 0, 1, 1,
0.9324419, -1.145184, 1.26048, 0.945098, 0, 1, 1,
0.9327636, -0.4617593, 3.048267, 0.9490196, 0, 1, 1,
0.9333187, 1.626837, 2.459027, 0.9568627, 0, 1, 1,
0.9345844, 1.388789, 1.389324, 0.9607843, 0, 1, 1,
0.9505235, 0.7616071, 0.1232679, 0.9686275, 0, 1, 1,
0.9548263, -1.336186, -0.1859744, 0.972549, 0, 1, 1,
0.9636195, 1.437513, 0.6733074, 0.9803922, 0, 1, 1,
0.9654276, -0.3516631, 1.475178, 0.9843137, 0, 1, 1,
0.9655801, -0.0109101, 0.5053313, 0.9921569, 0, 1, 1,
0.9696043, -1.246908, 1.823512, 0.9960784, 0, 1, 1,
0.9751923, 1.343088, 0.873214, 1, 0, 0.9960784, 1,
0.9822905, 0.6642683, -0.5294695, 1, 0, 0.9882353, 1,
0.9938012, -0.8465884, 3.130923, 1, 0, 0.9843137, 1,
0.9940772, 0.8167623, 2.223503, 1, 0, 0.9764706, 1,
0.9944677, 0.7998933, 1.310982, 1, 0, 0.972549, 1,
0.9961748, -0.1854701, 2.595932, 1, 0, 0.9647059, 1,
0.9992383, -0.6927332, 2.25531, 1, 0, 0.9607843, 1,
0.9992667, -1.105578, 4.211199, 1, 0, 0.9529412, 1,
1.000589, 1.083677, 0.1193904, 1, 0, 0.9490196, 1,
1.004182, -1.262688, 0.867536, 1, 0, 0.9411765, 1,
1.013513, -0.8331209, 2.7346, 1, 0, 0.9372549, 1,
1.020414, -0.6083897, 2.374726, 1, 0, 0.9294118, 1,
1.024933, 0.1421402, 1.948283, 1, 0, 0.9254902, 1,
1.031222, -0.5947834, 1.578913, 1, 0, 0.9176471, 1,
1.035026, -0.7217058, 0.3605905, 1, 0, 0.9137255, 1,
1.035119, 1.000207, 1.580966, 1, 0, 0.9058824, 1,
1.035392, -0.6673145, 1.821905, 1, 0, 0.9019608, 1,
1.048013, -0.7271476, 0.9373502, 1, 0, 0.8941177, 1,
1.055563, -1.636273, 4.216675, 1, 0, 0.8862745, 1,
1.059081, -2.502331, 1.900106, 1, 0, 0.8823529, 1,
1.069553, 0.9421658, 0.444248, 1, 0, 0.8745098, 1,
1.075257, 0.1514177, 1.442421, 1, 0, 0.8705882, 1,
1.079542, 0.4294875, 2.402113, 1, 0, 0.8627451, 1,
1.08196, 0.153506, 1.552026, 1, 0, 0.8588235, 1,
1.086115, 0.06750446, 2.76819, 1, 0, 0.8509804, 1,
1.087235, -0.8991487, 1.349555, 1, 0, 0.8470588, 1,
1.088703, -0.1880553, 1.570823, 1, 0, 0.8392157, 1,
1.091616, -0.1354319, 0.8852632, 1, 0, 0.8352941, 1,
1.095847, -1.168873, 4.533052, 1, 0, 0.827451, 1,
1.098941, 0.2329981, 0.8245214, 1, 0, 0.8235294, 1,
1.103028, -0.06368956, 1.191214, 1, 0, 0.8156863, 1,
1.115504, 0.1040925, 1.747653, 1, 0, 0.8117647, 1,
1.122496, -0.5667459, 0.7104948, 1, 0, 0.8039216, 1,
1.124532, -0.4201403, 0.5017287, 1, 0, 0.7960784, 1,
1.126112, -0.2142411, 2.113488, 1, 0, 0.7921569, 1,
1.126845, -0.4185309, 3.114125, 1, 0, 0.7843137, 1,
1.12839, -0.655396, -0.1187726, 1, 0, 0.7803922, 1,
1.130959, -1.520723, 2.235863, 1, 0, 0.772549, 1,
1.135475, 0.4407544, 1.750896, 1, 0, 0.7686275, 1,
1.146151, -0.1687052, 1.855872, 1, 0, 0.7607843, 1,
1.156216, -0.0008757329, 2.011928, 1, 0, 0.7568628, 1,
1.157774, -1.875769, 1.53888, 1, 0, 0.7490196, 1,
1.160734, 1.584822, 2.885453, 1, 0, 0.7450981, 1,
1.169332, 0.3816481, 0.05127895, 1, 0, 0.7372549, 1,
1.169783, 1.095641, 1.669153, 1, 0, 0.7333333, 1,
1.181175, -0.04148497, 1.478493, 1, 0, 0.7254902, 1,
1.184752, -0.6220609, 1.304832, 1, 0, 0.7215686, 1,
1.185896, 1.274219, 0.3443322, 1, 0, 0.7137255, 1,
1.187194, 0.839322, 4.225222, 1, 0, 0.7098039, 1,
1.192193, 0.919595, 0.3763842, 1, 0, 0.7019608, 1,
1.194018, -0.6449546, 2.605265, 1, 0, 0.6941177, 1,
1.201869, 0.0450177, 1.977173, 1, 0, 0.6901961, 1,
1.210632, -0.4048505, 2.543828, 1, 0, 0.682353, 1,
1.21671, 0.6794134, 0.570559, 1, 0, 0.6784314, 1,
1.217098, 0.08940268, 1.212518, 1, 0, 0.6705883, 1,
1.221769, -0.164077, 1.537154, 1, 0, 0.6666667, 1,
1.229681, 0.8410121, 2.839257, 1, 0, 0.6588235, 1,
1.231584, -0.2609063, 0.1009269, 1, 0, 0.654902, 1,
1.242889, 2.297161, 0.6811879, 1, 0, 0.6470588, 1,
1.245851, -0.4716459, 1.02547, 1, 0, 0.6431373, 1,
1.251809, 1.291612, 2.360421, 1, 0, 0.6352941, 1,
1.259708, 0.371551, 1.715104, 1, 0, 0.6313726, 1,
1.264413, -0.7094295, 0.6329764, 1, 0, 0.6235294, 1,
1.274553, -0.4019996, 3.799131, 1, 0, 0.6196079, 1,
1.276562, 0.7459514, 0.08193137, 1, 0, 0.6117647, 1,
1.277107, 0.4756508, -0.3251535, 1, 0, 0.6078432, 1,
1.283206, -0.1402005, 1.392759, 1, 0, 0.6, 1,
1.284543, 1.513047, 0.2043792, 1, 0, 0.5921569, 1,
1.290706, 0.420917, 1.974304, 1, 0, 0.5882353, 1,
1.294209, 0.5725298, 1.118141, 1, 0, 0.5803922, 1,
1.295412, 1.238297, 0.1404983, 1, 0, 0.5764706, 1,
1.312832, 1.439948, 0.4525316, 1, 0, 0.5686275, 1,
1.321052, 1.795264, -0.222484, 1, 0, 0.5647059, 1,
1.325717, -1.527116, 3.261225, 1, 0, 0.5568628, 1,
1.326279, -0.7681284, 1.911444, 1, 0, 0.5529412, 1,
1.33649, -0.3890174, 3.036663, 1, 0, 0.5450981, 1,
1.341895, -0.5779606, 3.094992, 1, 0, 0.5411765, 1,
1.342045, 0.799658, 2.154709, 1, 0, 0.5333334, 1,
1.342632, -0.8150696, 2.154499, 1, 0, 0.5294118, 1,
1.342957, -0.6277049, 1.091183, 1, 0, 0.5215687, 1,
1.348005, -0.68263, 0.9779029, 1, 0, 0.5176471, 1,
1.362042, 0.5465341, 1.629442, 1, 0, 0.509804, 1,
1.36882, -0.6387722, 0.05383888, 1, 0, 0.5058824, 1,
1.372158, 1.205439, 1.500474, 1, 0, 0.4980392, 1,
1.380268, -1.60392, 5.489772, 1, 0, 0.4901961, 1,
1.380849, -0.8250479, 0.7848391, 1, 0, 0.4862745, 1,
1.414473, -1.028458, 3.200012, 1, 0, 0.4784314, 1,
1.418926, -0.2713765, 0.2347194, 1, 0, 0.4745098, 1,
1.435071, 0.363351, 1.293744, 1, 0, 0.4666667, 1,
1.435109, 0.7197214, -0.934465, 1, 0, 0.4627451, 1,
1.437604, 1.051646, 3.146935, 1, 0, 0.454902, 1,
1.438305, 0.6806797, 1.17758, 1, 0, 0.4509804, 1,
1.444298, 1.465951, 1.151724, 1, 0, 0.4431373, 1,
1.444732, -1.006919, 3.237176, 1, 0, 0.4392157, 1,
1.455301, -0.5278489, 4.398829, 1, 0, 0.4313726, 1,
1.462661, 0.4234289, 1.99947, 1, 0, 0.427451, 1,
1.46398, 2.440185, 1.54409, 1, 0, 0.4196078, 1,
1.466155, 1.655888, 1.189387, 1, 0, 0.4156863, 1,
1.466819, -0.8252678, 3.345599, 1, 0, 0.4078431, 1,
1.47537, 0.4875857, 0.9948295, 1, 0, 0.4039216, 1,
1.476987, 1.622241, -1.398211, 1, 0, 0.3960784, 1,
1.485974, -0.8078332, 3.130543, 1, 0, 0.3882353, 1,
1.532505, 0.002717839, 0.2832515, 1, 0, 0.3843137, 1,
1.536281, 0.02358031, 3.314445, 1, 0, 0.3764706, 1,
1.541407, 0.07668369, 1.500289, 1, 0, 0.372549, 1,
1.542804, -0.6598524, 2.136823, 1, 0, 0.3647059, 1,
1.547266, -0.4510169, 2.628424, 1, 0, 0.3607843, 1,
1.588301, 0.1139108, 2.181951, 1, 0, 0.3529412, 1,
1.601068, -0.06611801, 1.536376, 1, 0, 0.3490196, 1,
1.607679, -1.308511, 2.861885, 1, 0, 0.3411765, 1,
1.607803, -1.52882, 1.987843, 1, 0, 0.3372549, 1,
1.609457, 1.671955, 2.101752, 1, 0, 0.3294118, 1,
1.618569, 0.8778816, -0.6435325, 1, 0, 0.3254902, 1,
1.628045, -3.072769, 4.461709, 1, 0, 0.3176471, 1,
1.639372, 1.195284, 2.049296, 1, 0, 0.3137255, 1,
1.64106, -0.3080179, 0.258123, 1, 0, 0.3058824, 1,
1.649941, 0.8901244, 2.024979, 1, 0, 0.2980392, 1,
1.661948, -0.9956989, 2.654577, 1, 0, 0.2941177, 1,
1.679464, 0.3491043, 1.813736, 1, 0, 0.2862745, 1,
1.689033, 0.5380321, -0.06716456, 1, 0, 0.282353, 1,
1.692591, 1.888031, 0.3144061, 1, 0, 0.2745098, 1,
1.754687, -0.07168583, 0.7681844, 1, 0, 0.2705882, 1,
1.760772, 0.5268457, 0.4663571, 1, 0, 0.2627451, 1,
1.777806, -0.8556205, 2.028424, 1, 0, 0.2588235, 1,
1.803389, -1.193464, 2.88048, 1, 0, 0.2509804, 1,
1.805854, 0.6104159, 0.8532396, 1, 0, 0.2470588, 1,
1.812601, -0.3241453, 1.017502, 1, 0, 0.2392157, 1,
1.814815, -1.969518, 0.73952, 1, 0, 0.2352941, 1,
1.818702, 2.072345, 1.670334, 1, 0, 0.227451, 1,
1.818822, -1.543178, 2.580703, 1, 0, 0.2235294, 1,
1.81912, 0.7192966, 0.3175686, 1, 0, 0.2156863, 1,
1.835418, 0.4072248, 1.566958, 1, 0, 0.2117647, 1,
1.837613, 0.6337753, 0.5007363, 1, 0, 0.2039216, 1,
1.840021, -0.8818915, 2.932676, 1, 0, 0.1960784, 1,
1.84097, 0.9843802, 0.644102, 1, 0, 0.1921569, 1,
1.841048, 1.084266, 0.4128, 1, 0, 0.1843137, 1,
1.862963, -0.09156539, 2.42556, 1, 0, 0.1803922, 1,
1.87195, 0.3781136, 1.353547, 1, 0, 0.172549, 1,
1.875676, -0.6616251, 2.950036, 1, 0, 0.1686275, 1,
1.877851, -0.2590493, 2.614491, 1, 0, 0.1607843, 1,
1.891502, 0.6265468, 0.4792206, 1, 0, 0.1568628, 1,
1.942694, 0.5295815, -0.5572839, 1, 0, 0.1490196, 1,
1.95392, 0.08498909, 0.9070095, 1, 0, 0.145098, 1,
1.997578, -0.7923989, 1.711216, 1, 0, 0.1372549, 1,
2.002276, -1.359431, 0.5149058, 1, 0, 0.1333333, 1,
2.056609, 0.5512297, 0.5756868, 1, 0, 0.1254902, 1,
2.057826, -0.1331781, 0.8841742, 1, 0, 0.1215686, 1,
2.092161, 1.073793, 1.983562, 1, 0, 0.1137255, 1,
2.151976, 0.05934471, 1.615817, 1, 0, 0.1098039, 1,
2.162782, 0.2357201, 2.678964, 1, 0, 0.1019608, 1,
2.224917, -0.005808782, 1.51535, 1, 0, 0.09411765, 1,
2.309714, 0.8363892, 2.422571, 1, 0, 0.09019608, 1,
2.314883, -1.332315, 0.4211347, 1, 0, 0.08235294, 1,
2.334189, 0.03541048, 3.004944, 1, 0, 0.07843138, 1,
2.368345, -0.3524981, 2.364556, 1, 0, 0.07058824, 1,
2.455152, -1.681422, 2.972099, 1, 0, 0.06666667, 1,
2.473087, -0.6258129, 1.335852, 1, 0, 0.05882353, 1,
2.596828, -1.374685, 1.652355, 1, 0, 0.05490196, 1,
2.624657, -0.249425, 0.8752655, 1, 0, 0.04705882, 1,
2.673873, -0.2115243, 1.626941, 1, 0, 0.04313726, 1,
2.698274, -0.007162946, 1.771675, 1, 0, 0.03529412, 1,
2.699772, -0.1152039, 1.785816, 1, 0, 0.03137255, 1,
2.706451, -0.06142998, -0.108407, 1, 0, 0.02352941, 1,
2.758748, -1.273835, 1.574828, 1, 0, 0.01960784, 1,
2.923642, 0.8051496, 2.023725, 1, 0, 0.01176471, 1,
3.440087, 0.2803102, 1.63004, 1, 0, 0.007843138, 1
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
0.08397841, -4.403861, -6.910169, 0, -0.5, 0.5, 0.5,
0.08397841, -4.403861, -6.910169, 1, -0.5, 0.5, 0.5,
0.08397841, -4.403861, -6.910169, 1, 1.5, 0.5, 0.5,
0.08397841, -4.403861, -6.910169, 0, 1.5, 0.5, 0.5
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
-4.409851, -0.4245937, -6.910169, 0, -0.5, 0.5, 0.5,
-4.409851, -0.4245937, -6.910169, 1, -0.5, 0.5, 0.5,
-4.409851, -0.4245937, -6.910169, 1, 1.5, 0.5, 0.5,
-4.409851, -0.4245937, -6.910169, 0, 1.5, 0.5, 0.5
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
-4.409851, -4.403861, 0.1883864, 0, -0.5, 0.5, 0.5,
-4.409851, -4.403861, 0.1883864, 1, -0.5, 0.5, 0.5,
-4.409851, -4.403861, 0.1883864, 1, 1.5, 0.5, 0.5,
-4.409851, -4.403861, 0.1883864, 0, 1.5, 0.5, 0.5
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
-3, -3.485569, -5.272041,
3, -3.485569, -5.272041,
-3, -3.485569, -5.272041,
-3, -3.638617, -5.545063,
-2, -3.485569, -5.272041,
-2, -3.638617, -5.545063,
-1, -3.485569, -5.272041,
-1, -3.638617, -5.545063,
0, -3.485569, -5.272041,
0, -3.638617, -5.545063,
1, -3.485569, -5.272041,
1, -3.638617, -5.545063,
2, -3.485569, -5.272041,
2, -3.638617, -5.545063,
3, -3.485569, -5.272041,
3, -3.638617, -5.545063
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
-3, -3.944715, -6.091105, 0, -0.5, 0.5, 0.5,
-3, -3.944715, -6.091105, 1, -0.5, 0.5, 0.5,
-3, -3.944715, -6.091105, 1, 1.5, 0.5, 0.5,
-3, -3.944715, -6.091105, 0, 1.5, 0.5, 0.5,
-2, -3.944715, -6.091105, 0, -0.5, 0.5, 0.5,
-2, -3.944715, -6.091105, 1, -0.5, 0.5, 0.5,
-2, -3.944715, -6.091105, 1, 1.5, 0.5, 0.5,
-2, -3.944715, -6.091105, 0, 1.5, 0.5, 0.5,
-1, -3.944715, -6.091105, 0, -0.5, 0.5, 0.5,
-1, -3.944715, -6.091105, 1, -0.5, 0.5, 0.5,
-1, -3.944715, -6.091105, 1, 1.5, 0.5, 0.5,
-1, -3.944715, -6.091105, 0, 1.5, 0.5, 0.5,
0, -3.944715, -6.091105, 0, -0.5, 0.5, 0.5,
0, -3.944715, -6.091105, 1, -0.5, 0.5, 0.5,
0, -3.944715, -6.091105, 1, 1.5, 0.5, 0.5,
0, -3.944715, -6.091105, 0, 1.5, 0.5, 0.5,
1, -3.944715, -6.091105, 0, -0.5, 0.5, 0.5,
1, -3.944715, -6.091105, 1, -0.5, 0.5, 0.5,
1, -3.944715, -6.091105, 1, 1.5, 0.5, 0.5,
1, -3.944715, -6.091105, 0, 1.5, 0.5, 0.5,
2, -3.944715, -6.091105, 0, -0.5, 0.5, 0.5,
2, -3.944715, -6.091105, 1, -0.5, 0.5, 0.5,
2, -3.944715, -6.091105, 1, 1.5, 0.5, 0.5,
2, -3.944715, -6.091105, 0, 1.5, 0.5, 0.5,
3, -3.944715, -6.091105, 0, -0.5, 0.5, 0.5,
3, -3.944715, -6.091105, 1, -0.5, 0.5, 0.5,
3, -3.944715, -6.091105, 1, 1.5, 0.5, 0.5,
3, -3.944715, -6.091105, 0, 1.5, 0.5, 0.5
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
-3.372813, -3, -5.272041,
-3.372813, 2, -5.272041,
-3.372813, -3, -5.272041,
-3.545653, -3, -5.545063,
-3.372813, -2, -5.272041,
-3.545653, -2, -5.545063,
-3.372813, -1, -5.272041,
-3.545653, -1, -5.545063,
-3.372813, 0, -5.272041,
-3.545653, 0, -5.545063,
-3.372813, 1, -5.272041,
-3.545653, 1, -5.545063,
-3.372813, 2, -5.272041,
-3.545653, 2, -5.545063
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
-3.891332, -3, -6.091105, 0, -0.5, 0.5, 0.5,
-3.891332, -3, -6.091105, 1, -0.5, 0.5, 0.5,
-3.891332, -3, -6.091105, 1, 1.5, 0.5, 0.5,
-3.891332, -3, -6.091105, 0, 1.5, 0.5, 0.5,
-3.891332, -2, -6.091105, 0, -0.5, 0.5, 0.5,
-3.891332, -2, -6.091105, 1, -0.5, 0.5, 0.5,
-3.891332, -2, -6.091105, 1, 1.5, 0.5, 0.5,
-3.891332, -2, -6.091105, 0, 1.5, 0.5, 0.5,
-3.891332, -1, -6.091105, 0, -0.5, 0.5, 0.5,
-3.891332, -1, -6.091105, 1, -0.5, 0.5, 0.5,
-3.891332, -1, -6.091105, 1, 1.5, 0.5, 0.5,
-3.891332, -1, -6.091105, 0, 1.5, 0.5, 0.5,
-3.891332, 0, -6.091105, 0, -0.5, 0.5, 0.5,
-3.891332, 0, -6.091105, 1, -0.5, 0.5, 0.5,
-3.891332, 0, -6.091105, 1, 1.5, 0.5, 0.5,
-3.891332, 0, -6.091105, 0, 1.5, 0.5, 0.5,
-3.891332, 1, -6.091105, 0, -0.5, 0.5, 0.5,
-3.891332, 1, -6.091105, 1, -0.5, 0.5, 0.5,
-3.891332, 1, -6.091105, 1, 1.5, 0.5, 0.5,
-3.891332, 1, -6.091105, 0, 1.5, 0.5, 0.5,
-3.891332, 2, -6.091105, 0, -0.5, 0.5, 0.5,
-3.891332, 2, -6.091105, 1, -0.5, 0.5, 0.5,
-3.891332, 2, -6.091105, 1, 1.5, 0.5, 0.5,
-3.891332, 2, -6.091105, 0, 1.5, 0.5, 0.5
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
-3.372813, -3.485569, -4,
-3.372813, -3.485569, 4,
-3.372813, -3.485569, -4,
-3.545653, -3.638617, -4,
-3.372813, -3.485569, -2,
-3.545653, -3.638617, -2,
-3.372813, -3.485569, 0,
-3.545653, -3.638617, 0,
-3.372813, -3.485569, 2,
-3.545653, -3.638617, 2,
-3.372813, -3.485569, 4,
-3.545653, -3.638617, 4
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
-3.891332, -3.944715, -4, 0, -0.5, 0.5, 0.5,
-3.891332, -3.944715, -4, 1, -0.5, 0.5, 0.5,
-3.891332, -3.944715, -4, 1, 1.5, 0.5, 0.5,
-3.891332, -3.944715, -4, 0, 1.5, 0.5, 0.5,
-3.891332, -3.944715, -2, 0, -0.5, 0.5, 0.5,
-3.891332, -3.944715, -2, 1, -0.5, 0.5, 0.5,
-3.891332, -3.944715, -2, 1, 1.5, 0.5, 0.5,
-3.891332, -3.944715, -2, 0, 1.5, 0.5, 0.5,
-3.891332, -3.944715, 0, 0, -0.5, 0.5, 0.5,
-3.891332, -3.944715, 0, 1, -0.5, 0.5, 0.5,
-3.891332, -3.944715, 0, 1, 1.5, 0.5, 0.5,
-3.891332, -3.944715, 0, 0, 1.5, 0.5, 0.5,
-3.891332, -3.944715, 2, 0, -0.5, 0.5, 0.5,
-3.891332, -3.944715, 2, 1, -0.5, 0.5, 0.5,
-3.891332, -3.944715, 2, 1, 1.5, 0.5, 0.5,
-3.891332, -3.944715, 2, 0, 1.5, 0.5, 0.5,
-3.891332, -3.944715, 4, 0, -0.5, 0.5, 0.5,
-3.891332, -3.944715, 4, 1, -0.5, 0.5, 0.5,
-3.891332, -3.944715, 4, 1, 1.5, 0.5, 0.5,
-3.891332, -3.944715, 4, 0, 1.5, 0.5, 0.5
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
-3.372813, -3.485569, -5.272041,
-3.372813, 2.636381, -5.272041,
-3.372813, -3.485569, 5.648814,
-3.372813, 2.636381, 5.648814,
-3.372813, -3.485569, -5.272041,
-3.372813, -3.485569, 5.648814,
-3.372813, 2.636381, -5.272041,
-3.372813, 2.636381, 5.648814,
-3.372813, -3.485569, -5.272041,
3.54077, -3.485569, -5.272041,
-3.372813, -3.485569, 5.648814,
3.54077, -3.485569, 5.648814,
-3.372813, 2.636381, -5.272041,
3.54077, 2.636381, -5.272041,
-3.372813, 2.636381, 5.648814,
3.54077, 2.636381, 5.648814,
3.54077, -3.485569, -5.272041,
3.54077, 2.636381, -5.272041,
3.54077, -3.485569, 5.648814,
3.54077, 2.636381, 5.648814,
3.54077, -3.485569, -5.272041,
3.54077, -3.485569, 5.648814,
3.54077, 2.636381, -5.272041,
3.54077, 2.636381, 5.648814
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
var radius = 7.636874;
var distance = 33.97731;
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
mvMatrix.translate( -0.08397841, 0.4245937, -0.1883864 );
mvMatrix.scale( 1.194335, 1.348776, 0.756089 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.97731);
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
Sulfonanilide<-read.table("Sulfonanilide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sulfonanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sulfonanilide' not found
```

```r
y<-Sulfonanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sulfonanilide' not found
```

```r
z<-Sulfonanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sulfonanilide' not found
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
-3.27213, 0.8474067, -0.07855348, 0, 0, 1, 1, 1,
-2.725017, 1.380878, 0.1753432, 1, 0, 0, 1, 1,
-2.596215, -0.4748761, -0.5947102, 1, 0, 0, 1, 1,
-2.557263, 0.233357, -1.81868, 1, 0, 0, 1, 1,
-2.424734, 0.2368467, -1.291608, 1, 0, 0, 1, 1,
-2.317466, 0.2550426, -1.674092, 1, 0, 0, 1, 1,
-2.234896, 0.0549803, -3.344579, 0, 0, 0, 1, 1,
-2.232848, 1.755245, -0.5915437, 0, 0, 0, 1, 1,
-2.190969, -0.007204341, 0.8472389, 0, 0, 0, 1, 1,
-2.155082, -0.6794536, -2.056293, 0, 0, 0, 1, 1,
-2.148986, 0.5271309, -1.692126, 0, 0, 0, 1, 1,
-2.13113, -1.639024, -3.618588, 0, 0, 0, 1, 1,
-2.121619, 0.8962114, -0.9857394, 0, 0, 0, 1, 1,
-2.065274, -1.150011, -2.429749, 1, 1, 1, 1, 1,
-2.057025, -1.061725, -1.298658, 1, 1, 1, 1, 1,
-2.048691, -0.008114746, -0.3006792, 1, 1, 1, 1, 1,
-2.030004, -0.3282384, -1.700993, 1, 1, 1, 1, 1,
-2.01389, -0.346362, -2.585495, 1, 1, 1, 1, 1,
-1.974214, 1.051238, -0.9340965, 1, 1, 1, 1, 1,
-1.974212, 0.07656743, -1.5774, 1, 1, 1, 1, 1,
-1.971368, 2.033206, -3.89149, 1, 1, 1, 1, 1,
-1.966602, -0.8569199, -1.781451, 1, 1, 1, 1, 1,
-1.960748, 2.383345, 0.9346546, 1, 1, 1, 1, 1,
-1.957778, 0.2043077, -0.3434812, 1, 1, 1, 1, 1,
-1.927757, -0.5206475, -1.87836, 1, 1, 1, 1, 1,
-1.891585, -0.283156, 0.5438309, 1, 1, 1, 1, 1,
-1.870339, -0.8385859, -1.050394, 1, 1, 1, 1, 1,
-1.828048, -0.8800968, -2.729073, 1, 1, 1, 1, 1,
-1.819224, -2.317659, -3.004262, 0, 0, 1, 1, 1,
-1.796142, -0.6239987, -2.133469, 1, 0, 0, 1, 1,
-1.746709, 0.4335194, -1.779307, 1, 0, 0, 1, 1,
-1.746225, 0.6618791, -2.978577, 1, 0, 0, 1, 1,
-1.737579, 2.066769, -1.247932, 1, 0, 0, 1, 1,
-1.733542, -1.387964, -2.358701, 1, 0, 0, 1, 1,
-1.709408, -0.2802766, -1.759107, 0, 0, 0, 1, 1,
-1.707685, 1.547975, -1.845308, 0, 0, 0, 1, 1,
-1.701933, -3.396414, -3.749022, 0, 0, 0, 1, 1,
-1.698717, 0.6201953, -0.7810611, 0, 0, 0, 1, 1,
-1.687526, -0.09652982, -2.008156, 0, 0, 0, 1, 1,
-1.680304, -0.4423398, -2.153846, 0, 0, 0, 1, 1,
-1.670591, 1.168594, -0.7328794, 0, 0, 0, 1, 1,
-1.652234, 0.7180651, -2.035299, 1, 1, 1, 1, 1,
-1.635777, 0.6024147, -1.755528, 1, 1, 1, 1, 1,
-1.609151, 0.2829387, -0.7047046, 1, 1, 1, 1, 1,
-1.603027, -1.045367, -0.4466251, 1, 1, 1, 1, 1,
-1.594294, 1.230803, -2.489581, 1, 1, 1, 1, 1,
-1.591824, 0.577874, -1.562677, 1, 1, 1, 1, 1,
-1.546615, -1.195607, -2.251817, 1, 1, 1, 1, 1,
-1.539263, 0.8569435, -1.236894, 1, 1, 1, 1, 1,
-1.532405, -1.186057, -1.11119, 1, 1, 1, 1, 1,
-1.522662, -0.2372829, -3.280841, 1, 1, 1, 1, 1,
-1.514075, -1.766253, -0.06467812, 1, 1, 1, 1, 1,
-1.50688, 0.5245033, -0.3701549, 1, 1, 1, 1, 1,
-1.503656, 0.1404993, -0.6276956, 1, 1, 1, 1, 1,
-1.501167, -0.6076875, -0.3281997, 1, 1, 1, 1, 1,
-1.483033, 1.01731, -0.3356859, 1, 1, 1, 1, 1,
-1.483012, -1.873558, -2.747405, 0, 0, 1, 1, 1,
-1.473027, 1.571206, -1.7814, 1, 0, 0, 1, 1,
-1.470982, -0.3833202, -1.782646, 1, 0, 0, 1, 1,
-1.462539, 1.080309, -1.065009, 1, 0, 0, 1, 1,
-1.456095, -1.773372, -3.308203, 1, 0, 0, 1, 1,
-1.449585, 2.272177, 0.6830665, 1, 0, 0, 1, 1,
-1.445199, 0.8725653, 0.1241875, 0, 0, 0, 1, 1,
-1.445113, -0.3432798, -1.938024, 0, 0, 0, 1, 1,
-1.439022, 0.7427263, -1.025189, 0, 0, 0, 1, 1,
-1.428314, 1.746317, -0.1710105, 0, 0, 0, 1, 1,
-1.415736, 0.4053824, -2.002783, 0, 0, 0, 1, 1,
-1.411969, 0.3500294, -0.6472991, 0, 0, 0, 1, 1,
-1.408258, -1.41015, -3.554969, 0, 0, 0, 1, 1,
-1.404666, -0.6289802, -1.285738, 1, 1, 1, 1, 1,
-1.401748, 0.6582405, -1.270377, 1, 1, 1, 1, 1,
-1.399804, -0.6755047, -3.490318, 1, 1, 1, 1, 1,
-1.392944, 0.5730215, -1.181512, 1, 1, 1, 1, 1,
-1.392363, -1.482276, -3.529204, 1, 1, 1, 1, 1,
-1.388047, -0.7081842, -0.626599, 1, 1, 1, 1, 1,
-1.378949, -0.07874637, -3.609865, 1, 1, 1, 1, 1,
-1.369403, -0.140833, -2.456293, 1, 1, 1, 1, 1,
-1.369166, -2.251116, -2.076671, 1, 1, 1, 1, 1,
-1.352645, 0.06317393, -1.176373, 1, 1, 1, 1, 1,
-1.347546, 0.03784796, -1.969514, 1, 1, 1, 1, 1,
-1.340857, -0.4031985, -1.347411, 1, 1, 1, 1, 1,
-1.32668, 0.2661346, -2.823376, 1, 1, 1, 1, 1,
-1.311908, -1.696739, -1.775733, 1, 1, 1, 1, 1,
-1.304381, 2.544793, 0.9956314, 1, 1, 1, 1, 1,
-1.272832, -0.8412176, -1.823303, 0, 0, 1, 1, 1,
-1.258219, -1.769271, -1.576209, 1, 0, 0, 1, 1,
-1.243732, -0.9581835, -4.599323, 1, 0, 0, 1, 1,
-1.237714, -1.271302, -3.170115, 1, 0, 0, 1, 1,
-1.231443, -0.6685508, -4.507573, 1, 0, 0, 1, 1,
-1.21708, -0.6166975, -2.012453, 1, 0, 0, 1, 1,
-1.217035, -1.10391, -3.077001, 0, 0, 0, 1, 1,
-1.216249, -0.007069032, -0.9080098, 0, 0, 0, 1, 1,
-1.214363, 1.139271, -0.1269973, 0, 0, 0, 1, 1,
-1.212826, -0.1493569, -1.609132, 0, 0, 0, 1, 1,
-1.200002, 0.3126688, -1.544696, 0, 0, 0, 1, 1,
-1.195937, -0.6633359, -1.807723, 0, 0, 0, 1, 1,
-1.191254, 1.376008, -2.269104, 0, 0, 0, 1, 1,
-1.175623, -0.8404742, -2.217644, 1, 1, 1, 1, 1,
-1.174519, 1.218685, -2.010913, 1, 1, 1, 1, 1,
-1.169579, 1.807641, -0.8581942, 1, 1, 1, 1, 1,
-1.168726, -0.7284621, -1.804847, 1, 1, 1, 1, 1,
-1.16599, -0.9829457, -0.4988547, 1, 1, 1, 1, 1,
-1.156929, 1.806811, -0.7644118, 1, 1, 1, 1, 1,
-1.152202, 2.070823, 0.9133442, 1, 1, 1, 1, 1,
-1.146599, -0.959456, -2.099902, 1, 1, 1, 1, 1,
-1.142061, -0.4643569, -3.185743, 1, 1, 1, 1, 1,
-1.134624, -0.1163025, -1.093383, 1, 1, 1, 1, 1,
-1.123526, -1.091604, -2.149996, 1, 1, 1, 1, 1,
-1.115617, 0.8447196, -2.360647, 1, 1, 1, 1, 1,
-1.111275, -0.2067136, -2.086145, 1, 1, 1, 1, 1,
-1.086229, -0.483152, -2.060272, 1, 1, 1, 1, 1,
-1.075561, -1.502377, -2.91638, 1, 1, 1, 1, 1,
-1.073013, -0.9812695, -1.477845, 0, 0, 1, 1, 1,
-1.071581, -0.4725092, -2.400016, 1, 0, 0, 1, 1,
-1.070219, -0.5789155, -1.139267, 1, 0, 0, 1, 1,
-1.067035, -0.1203779, -1.364496, 1, 0, 0, 1, 1,
-1.065634, 0.8021919, -0.9283014, 1, 0, 0, 1, 1,
-1.061908, 1.008795, -0.1014856, 1, 0, 0, 1, 1,
-1.061425, -0.2592048, -2.69819, 0, 0, 0, 1, 1,
-1.057102, 0.4584056, -2.203845, 0, 0, 0, 1, 1,
-1.055129, -0.4618588, -1.168923, 0, 0, 0, 1, 1,
-1.051371, 0.874797, 0.3086976, 0, 0, 0, 1, 1,
-1.049664, -2.198041, -3.444967, 0, 0, 0, 1, 1,
-1.046378, 0.2587811, -0.7728441, 0, 0, 0, 1, 1,
-1.046299, 0.1930105, -2.981225, 0, 0, 0, 1, 1,
-1.038872, 1.898042, -1.185228, 1, 1, 1, 1, 1,
-1.036605, 1.543421, -0.2208971, 1, 1, 1, 1, 1,
-1.031898, 1.053593, -0.3095468, 1, 1, 1, 1, 1,
-1.029565, 0.4154282, -0.9880866, 1, 1, 1, 1, 1,
-1.028756, -0.3606722, -1.486322, 1, 1, 1, 1, 1,
-1.016744, -0.08777223, -4.10678, 1, 1, 1, 1, 1,
-1.014102, 1.854586, -1.369022, 1, 1, 1, 1, 1,
-1.013706, 1.377977, -2.124849, 1, 1, 1, 1, 1,
-1.012073, 1.647039, 0.2192903, 1, 1, 1, 1, 1,
-1.007229, 0.8443226, -1.34815, 1, 1, 1, 1, 1,
-1.001532, 0.2423991, -2.939826, 1, 1, 1, 1, 1,
-0.9974349, -1.368268, -0.4977483, 1, 1, 1, 1, 1,
-0.9945385, -1.089981, -2.334005, 1, 1, 1, 1, 1,
-0.9944862, 0.876231, -0.2804719, 1, 1, 1, 1, 1,
-0.992408, -0.6567814, -3.120281, 1, 1, 1, 1, 1,
-0.9896006, -0.3922905, -2.075824, 0, 0, 1, 1, 1,
-0.9814647, -1.429699, -4.007921, 1, 0, 0, 1, 1,
-0.9741706, -0.6235262, -4.518581, 1, 0, 0, 1, 1,
-0.9537213, 0.4704652, -1.077449, 1, 0, 0, 1, 1,
-0.9520723, -0.2171485, -2.872976, 1, 0, 0, 1, 1,
-0.9490277, -1.276254, -2.294878, 1, 0, 0, 1, 1,
-0.9489116, -0.6707612, -2.221147, 0, 0, 0, 1, 1,
-0.9476455, 0.282819, -0.2130315, 0, 0, 0, 1, 1,
-0.9441519, -1.319991, -1.806688, 0, 0, 0, 1, 1,
-0.9389855, 0.5027972, -2.190487, 0, 0, 0, 1, 1,
-0.9361705, -0.4375746, -3.224055, 0, 0, 0, 1, 1,
-0.9356002, -0.7693426, -2.188122, 0, 0, 0, 1, 1,
-0.9283471, 1.28892, -1.11946, 0, 0, 0, 1, 1,
-0.9261579, 0.4668464, -1.257925, 1, 1, 1, 1, 1,
-0.9186519, -0.6319171, -2.221251, 1, 1, 1, 1, 1,
-0.9128956, 0.03933686, 0.005296743, 1, 1, 1, 1, 1,
-0.9048665, 1.028689, -0.23479, 1, 1, 1, 1, 1,
-0.9032058, -0.05091568, -3.124479, 1, 1, 1, 1, 1,
-0.9026234, -1.254552, -2.825851, 1, 1, 1, 1, 1,
-0.8924418, 1.836856, -2.548907, 1, 1, 1, 1, 1,
-0.8895255, 0.1672698, 0.2812799, 1, 1, 1, 1, 1,
-0.8881074, 0.02214655, -1.092673, 1, 1, 1, 1, 1,
-0.8822284, -2.099346, -2.750591, 1, 1, 1, 1, 1,
-0.8776502, -0.3237849, -1.558769, 1, 1, 1, 1, 1,
-0.8763906, 0.06131162, -1.558829, 1, 1, 1, 1, 1,
-0.8759001, 0.4578245, -0.4348279, 1, 1, 1, 1, 1,
-0.8749734, -1.249703, -2.581799, 1, 1, 1, 1, 1,
-0.8741997, 0.2206358, -1.14736, 1, 1, 1, 1, 1,
-0.8653147, 1.64919, 0.8232465, 0, 0, 1, 1, 1,
-0.8572459, 0.8144379, -1.045917, 1, 0, 0, 1, 1,
-0.8508778, 0.3263247, -0.08713374, 1, 0, 0, 1, 1,
-0.8483902, -0.9299275, -2.265541, 1, 0, 0, 1, 1,
-0.8461225, 1.946744, -0.2078423, 1, 0, 0, 1, 1,
-0.8433678, 0.8494068, 0.4695834, 1, 0, 0, 1, 1,
-0.8394688, -0.2783535, -1.786607, 0, 0, 0, 1, 1,
-0.8389886, 0.02699386, -3.234412, 0, 0, 0, 1, 1,
-0.8369759, -1.123858, -2.45242, 0, 0, 0, 1, 1,
-0.8350642, -1.009593, -2.931848, 0, 0, 0, 1, 1,
-0.8349483, 0.3583055, -2.515214, 0, 0, 0, 1, 1,
-0.8281751, -1.044831, -0.4882365, 0, 0, 0, 1, 1,
-0.8265827, -0.1746405, -4.187899, 0, 0, 0, 1, 1,
-0.8230775, 0.01356536, -0.762085, 1, 1, 1, 1, 1,
-0.8213062, 0.3810811, 0.5394236, 1, 1, 1, 1, 1,
-0.8076096, 1.600087, -2.068383, 1, 1, 1, 1, 1,
-0.8075445, -0.6523845, -2.626214, 1, 1, 1, 1, 1,
-0.7978005, 0.9523092, -0.006213856, 1, 1, 1, 1, 1,
-0.7965044, 1.757721, 0.5454674, 1, 1, 1, 1, 1,
-0.7954325, 1.592278, 0.3188387, 1, 1, 1, 1, 1,
-0.7860163, 0.9306416, -2.399488, 1, 1, 1, 1, 1,
-0.7853365, 0.3276247, -0.8681344, 1, 1, 1, 1, 1,
-0.7841831, 0.72802, -0.8769431, 1, 1, 1, 1, 1,
-0.7821465, -0.4897192, -1.846435, 1, 1, 1, 1, 1,
-0.7801598, 0.2537621, -1.220447, 1, 1, 1, 1, 1,
-0.7781171, -0.4690826, -2.9379, 1, 1, 1, 1, 1,
-0.777433, 0.13986, -2.363897, 1, 1, 1, 1, 1,
-0.7758754, -0.1476597, -1.801327, 1, 1, 1, 1, 1,
-0.7712167, 1.032219, -0.6319089, 0, 0, 1, 1, 1,
-0.766964, -1.413194, -1.983007, 1, 0, 0, 1, 1,
-0.7636447, -1.313494, -2.587709, 1, 0, 0, 1, 1,
-0.761915, 0.7067755, -1.489823, 1, 0, 0, 1, 1,
-0.7611085, -0.2506746, -0.4893769, 1, 0, 0, 1, 1,
-0.7588041, 0.6037489, -1.024519, 1, 0, 0, 1, 1,
-0.7582721, -0.2177377, -2.549345, 0, 0, 0, 1, 1,
-0.754576, 0.9240672, -0.9305078, 0, 0, 0, 1, 1,
-0.749593, 0.2464292, -0.9049473, 0, 0, 0, 1, 1,
-0.7495465, -0.07993011, -0.4632721, 0, 0, 0, 1, 1,
-0.7467148, -0.8359365, -3.485603, 0, 0, 0, 1, 1,
-0.7416028, -0.3680408, -2.220866, 0, 0, 0, 1, 1,
-0.7363071, 1.246133, -0.852992, 0, 0, 0, 1, 1,
-0.7357402, -0.1920127, -3.527205, 1, 1, 1, 1, 1,
-0.7336359, -0.8048652, -3.048254, 1, 1, 1, 1, 1,
-0.7304627, 1.108636, -1.646503, 1, 1, 1, 1, 1,
-0.7296128, 1.40307, -1.104636, 1, 1, 1, 1, 1,
-0.7293707, -1.919294, -5.112999, 1, 1, 1, 1, 1,
-0.7284499, 0.2462283, -2.912253, 1, 1, 1, 1, 1,
-0.7267764, -0.4400579, -2.595247, 1, 1, 1, 1, 1,
-0.7215984, 0.8670301, 0.637157, 1, 1, 1, 1, 1,
-0.7164112, 0.3940889, -0.9317093, 1, 1, 1, 1, 1,
-0.7164004, -0.6743189, -3.036952, 1, 1, 1, 1, 1,
-0.7144114, -0.3370956, -2.204628, 1, 1, 1, 1, 1,
-0.7126961, -0.5255684, -3.172745, 1, 1, 1, 1, 1,
-0.7118199, -1.272249, -3.718516, 1, 1, 1, 1, 1,
-0.7097387, -0.7247621, -2.876882, 1, 1, 1, 1, 1,
-0.7085589, -0.1649527, -2.035577, 1, 1, 1, 1, 1,
-0.7046498, -0.1418148, -1.442555, 0, 0, 1, 1, 1,
-0.7024255, -2.119853, -3.224666, 1, 0, 0, 1, 1,
-0.7023805, -1.262567, -2.658056, 1, 0, 0, 1, 1,
-0.7021526, -0.8051976, -2.939671, 1, 0, 0, 1, 1,
-0.7001613, -1.29855, -4.264738, 1, 0, 0, 1, 1,
-0.699813, 0.05904077, -0.679054, 1, 0, 0, 1, 1,
-0.6993602, -1.157749, -2.655181, 0, 0, 0, 1, 1,
-0.6920924, -0.9617233, -1.993768, 0, 0, 0, 1, 1,
-0.6918126, -0.7621289, -1.682321, 0, 0, 0, 1, 1,
-0.6861688, -0.6478611, -1.949564, 0, 0, 0, 1, 1,
-0.6843793, -0.1492675, 0.006453071, 0, 0, 0, 1, 1,
-0.6799885, -0.6172051, -2.896752, 0, 0, 0, 1, 1,
-0.6782359, -1.398156, -3.33563, 0, 0, 0, 1, 1,
-0.6687183, 1.07854, -0.4888395, 1, 1, 1, 1, 1,
-0.6677682, 0.8089932, 0.336808, 1, 1, 1, 1, 1,
-0.6669504, -0.6815351, -1.26528, 1, 1, 1, 1, 1,
-0.6667884, 1.445643, -0.3000808, 1, 1, 1, 1, 1,
-0.6662596, 0.9984635, -0.7747323, 1, 1, 1, 1, 1,
-0.657853, -0.1911978, -2.118492, 1, 1, 1, 1, 1,
-0.6562311, 0.09195179, -0.4254284, 1, 1, 1, 1, 1,
-0.6540763, 0.323949, 0.004341267, 1, 1, 1, 1, 1,
-0.6517172, 1.570488, -0.4798775, 1, 1, 1, 1, 1,
-0.6488972, 0.2015068, -0.4618526, 1, 1, 1, 1, 1,
-0.6461346, 0.7481419, -1.530416, 1, 1, 1, 1, 1,
-0.6451716, 0.2240496, -1.375569, 1, 1, 1, 1, 1,
-0.6426921, 1.547764, 0.245344, 1, 1, 1, 1, 1,
-0.6418671, 0.6008765, -0.3214377, 1, 1, 1, 1, 1,
-0.6409319, -0.1552704, -2.941527, 1, 1, 1, 1, 1,
-0.6341584, -0.5868627, -3.390556, 0, 0, 1, 1, 1,
-0.6341227, -0.8340783, -4.039605, 1, 0, 0, 1, 1,
-0.6257297, -0.3182929, -2.468137, 1, 0, 0, 1, 1,
-0.6200601, -1.139015, -1.587677, 1, 0, 0, 1, 1,
-0.6200453, -0.6590157, -2.677702, 1, 0, 0, 1, 1,
-0.6112074, 0.5330909, -0.7357227, 1, 0, 0, 1, 1,
-0.6098559, -0.3134096, -4.58231, 0, 0, 0, 1, 1,
-0.6098026, 0.06079217, 0.04297413, 0, 0, 0, 1, 1,
-0.6082556, 0.1642384, -0.06647994, 0, 0, 0, 1, 1,
-0.605096, -1.428097, -3.101425, 0, 0, 0, 1, 1,
-0.60224, 0.7061083, -1.991295, 0, 0, 0, 1, 1,
-0.6005062, 0.6208269, -1.596128, 0, 0, 0, 1, 1,
-0.6005046, 1.181086, -1.503601, 0, 0, 0, 1, 1,
-0.5955008, -0.9479996, -3.487433, 1, 1, 1, 1, 1,
-0.5908242, -0.6116966, -3.220733, 1, 1, 1, 1, 1,
-0.5890181, -0.288684, -3.140992, 1, 1, 1, 1, 1,
-0.5842413, 0.2198109, -1.84876, 1, 1, 1, 1, 1,
-0.5767589, 1.022787, -0.02670285, 1, 1, 1, 1, 1,
-0.571754, -0.4776724, -3.07811, 1, 1, 1, 1, 1,
-0.5716647, 1.483436, 0.7187237, 1, 1, 1, 1, 1,
-0.5690871, -0.6328331, -2.508789, 1, 1, 1, 1, 1,
-0.56589, 1.070895, -0.8407509, 1, 1, 1, 1, 1,
-0.5634478, -0.5426034, -2.066683, 1, 1, 1, 1, 1,
-0.5617174, 0.2073854, -2.132323, 1, 1, 1, 1, 1,
-0.560905, 0.2469174, -1.241734, 1, 1, 1, 1, 1,
-0.5606733, 0.7000048, 0.6255888, 1, 1, 1, 1, 1,
-0.5590228, 0.9353595, -0.08668379, 1, 1, 1, 1, 1,
-0.5589648, 1.022487, 0.8756714, 1, 1, 1, 1, 1,
-0.5574353, 0.9515328, -0.5102528, 0, 0, 1, 1, 1,
-0.5565072, -0.5613264, -3.056884, 1, 0, 0, 1, 1,
-0.5522209, -1.875557, -4.151979, 1, 0, 0, 1, 1,
-0.5497666, 0.9838582, 0.4652159, 1, 0, 0, 1, 1,
-0.5461106, -1.623147, -2.520705, 1, 0, 0, 1, 1,
-0.5441155, 0.1785389, -0.7847276, 1, 0, 0, 1, 1,
-0.5425916, 1.209811, -1.430758, 0, 0, 0, 1, 1,
-0.5414217, -0.8794915, -2.660205, 0, 0, 0, 1, 1,
-0.539313, -1.415926, -3.780676, 0, 0, 0, 1, 1,
-0.5380102, -0.2407156, -1.114538, 0, 0, 0, 1, 1,
-0.5370977, -0.342253, -2.950806, 0, 0, 0, 1, 1,
-0.5367158, 0.6765883, -0.02388375, 0, 0, 0, 1, 1,
-0.5362833, 0.5560832, -2.016789, 0, 0, 0, 1, 1,
-0.5323652, 0.9061116, -0.8179006, 1, 1, 1, 1, 1,
-0.5270694, 0.04477948, -1.562261, 1, 1, 1, 1, 1,
-0.5227375, -0.00572652, -1.011359, 1, 1, 1, 1, 1,
-0.522547, -0.2735034, -1.998897, 1, 1, 1, 1, 1,
-0.5204821, 0.7553858, -0.7919548, 1, 1, 1, 1, 1,
-0.5126661, -0.9269931, -2.885209, 1, 1, 1, 1, 1,
-0.5068212, 0.4506346, -3.024156, 1, 1, 1, 1, 1,
-0.506593, -0.789065, -1.139273, 1, 1, 1, 1, 1,
-0.5049717, -0.811166, -4.368383, 1, 1, 1, 1, 1,
-0.4957365, 0.7533219, -0.4040785, 1, 1, 1, 1, 1,
-0.4911876, 0.2584156, -1.87956, 1, 1, 1, 1, 1,
-0.4889941, -1.34712, -2.957752, 1, 1, 1, 1, 1,
-0.4845929, -0.4477031, -2.809125, 1, 1, 1, 1, 1,
-0.4828189, -0.6704054, -0.4783544, 1, 1, 1, 1, 1,
-0.4816058, -0.2152624, -2.585249, 1, 1, 1, 1, 1,
-0.4808025, -1.014986, -1.558723, 0, 0, 1, 1, 1,
-0.4775446, 0.8717913, -1.813845, 1, 0, 0, 1, 1,
-0.4751309, 1.666176, -0.2137488, 1, 0, 0, 1, 1,
-0.474856, 0.7941961, 1.474277, 1, 0, 0, 1, 1,
-0.4707462, -2.317212, -3.822318, 1, 0, 0, 1, 1,
-0.4647171, 1.323308, 0.4193116, 1, 0, 0, 1, 1,
-0.4640721, -0.6804172, -3.187834, 0, 0, 0, 1, 1,
-0.4609006, 0.1615508, -1.331487, 0, 0, 0, 1, 1,
-0.4530005, -0.1950236, -1.410553, 0, 0, 0, 1, 1,
-0.4454695, -1.401158, -3.472011, 0, 0, 0, 1, 1,
-0.4434891, -0.1697963, -3.392843, 0, 0, 0, 1, 1,
-0.4371005, 0.1866675, 0.09250088, 0, 0, 0, 1, 1,
-0.4340658, 1.53721, 0.4114224, 0, 0, 0, 1, 1,
-0.4142286, -0.8117061, -1.246696, 1, 1, 1, 1, 1,
-0.4100911, 0.9788747, -3.981718, 1, 1, 1, 1, 1,
-0.4078812, 0.728682, 1.18694, 1, 1, 1, 1, 1,
-0.4072046, 0.8459845, 0.4771724, 1, 1, 1, 1, 1,
-0.4051165, -0.1413249, -3.990892, 1, 1, 1, 1, 1,
-0.4044072, 0.1655146, -3.427474, 1, 1, 1, 1, 1,
-0.4002807, 2.186437, 0.6483972, 1, 1, 1, 1, 1,
-0.3960729, -1.713181, -4.63077, 1, 1, 1, 1, 1,
-0.3938623, -0.5293224, -1.212546, 1, 1, 1, 1, 1,
-0.3911513, 0.2581215, -1.161883, 1, 1, 1, 1, 1,
-0.3888331, 0.4669683, -0.6460831, 1, 1, 1, 1, 1,
-0.3872457, -1.068833, -2.556577, 1, 1, 1, 1, 1,
-0.3834978, 0.9658176, 0.8513979, 1, 1, 1, 1, 1,
-0.3834858, 0.7792948, -0.3969139, 1, 1, 1, 1, 1,
-0.3818359, 1.450484, -0.4300851, 1, 1, 1, 1, 1,
-0.3785799, 1.359413, 0.8368422, 0, 0, 1, 1, 1,
-0.3759306, -0.1597599, -2.845498, 1, 0, 0, 1, 1,
-0.3710021, 1.11219, -0.8009245, 1, 0, 0, 1, 1,
-0.3684494, -1.638431, -3.96166, 1, 0, 0, 1, 1,
-0.36558, -0.01080698, -3.564921, 1, 0, 0, 1, 1,
-0.3610522, -0.326754, -2.516488, 1, 0, 0, 1, 1,
-0.3594456, -0.5240024, -3.130419, 0, 0, 0, 1, 1,
-0.3589469, 1.861106, -0.117836, 0, 0, 0, 1, 1,
-0.3563826, 0.3647532, -1.638742, 0, 0, 0, 1, 1,
-0.3555148, 0.1511987, 0.3999986, 0, 0, 0, 1, 1,
-0.3551231, -0.7446851, -3.759703, 0, 0, 0, 1, 1,
-0.3531716, 0.09087744, -0.2034745, 0, 0, 0, 1, 1,
-0.3514959, -0.00157019, 0.09811379, 0, 0, 0, 1, 1,
-0.3510056, 0.8826379, -1.91059, 1, 1, 1, 1, 1,
-0.3506369, 0.652248, -0.6647542, 1, 1, 1, 1, 1,
-0.3504707, 0.902942, 0.2111856, 1, 1, 1, 1, 1,
-0.3503807, -2.744546, -4.32916, 1, 1, 1, 1, 1,
-0.3471692, 0.4785599, -1.986533, 1, 1, 1, 1, 1,
-0.339628, 0.7936888, -1.352051, 1, 1, 1, 1, 1,
-0.332056, -2.015497, -1.24888, 1, 1, 1, 1, 1,
-0.312868, 0.8686708, -0.4816307, 1, 1, 1, 1, 1,
-0.3120043, -0.5650932, -3.55263, 1, 1, 1, 1, 1,
-0.3077066, -0.3096637, -1.71702, 1, 1, 1, 1, 1,
-0.307657, 0.2902306, -2.324741, 1, 1, 1, 1, 1,
-0.3048501, 0.05215237, -0.8154796, 1, 1, 1, 1, 1,
-0.3007681, 0.09745327, -1.274618, 1, 1, 1, 1, 1,
-0.283174, -1.761696, -2.785508, 1, 1, 1, 1, 1,
-0.2823969, -1.424131, -2.691367, 1, 1, 1, 1, 1,
-0.2821116, -1.139849, -3.718458, 0, 0, 1, 1, 1,
-0.2815527, -0.7693924, -2.43403, 1, 0, 0, 1, 1,
-0.2814347, -1.449473, -2.756251, 1, 0, 0, 1, 1,
-0.2806873, -0.3191527, -3.139396, 1, 0, 0, 1, 1,
-0.2765067, -0.7803779, -2.504138, 1, 0, 0, 1, 1,
-0.276477, 0.5325838, -1.14129, 1, 0, 0, 1, 1,
-0.2751369, 0.6255066, -1.221853, 0, 0, 0, 1, 1,
-0.2741338, -1.051882, -1.607666, 0, 0, 0, 1, 1,
-0.2740847, 1.024449, -0.5580253, 0, 0, 0, 1, 1,
-0.2734569, -0.2596009, -2.137245, 0, 0, 0, 1, 1,
-0.2732761, -0.0005387269, -2.415634, 0, 0, 0, 1, 1,
-0.269385, 0.05477632, -1.171031, 0, 0, 0, 1, 1,
-0.2689492, -0.2943872, -2.282897, 0, 0, 0, 1, 1,
-0.2665405, -0.4718577, -3.809781, 1, 1, 1, 1, 1,
-0.2661652, -1.141441, -2.041724, 1, 1, 1, 1, 1,
-0.2648703, 0.1406722, -1.293835, 1, 1, 1, 1, 1,
-0.2632631, -1.963085, -2.929495, 1, 1, 1, 1, 1,
-0.2551099, -0.5984489, -2.898448, 1, 1, 1, 1, 1,
-0.2488209, -0.5440911, -2.643665, 1, 1, 1, 1, 1,
-0.2463644, -1.52282, -2.918129, 1, 1, 1, 1, 1,
-0.244749, 0.8832574, -0.5184374, 1, 1, 1, 1, 1,
-0.2431991, -0.1927744, -2.26482, 1, 1, 1, 1, 1,
-0.2412184, -0.9831198, -4.999825, 1, 1, 1, 1, 1,
-0.2404766, -0.6310928, -3.271651, 1, 1, 1, 1, 1,
-0.2377036, 0.2379597, -0.4839951, 1, 1, 1, 1, 1,
-0.2337062, 0.1592787, -2.091886, 1, 1, 1, 1, 1,
-0.2298988, -0.6922529, -2.99089, 1, 1, 1, 1, 1,
-0.2292111, 0.7893481, -0.5881377, 1, 1, 1, 1, 1,
-0.2183974, -0.6413681, -2.758181, 0, 0, 1, 1, 1,
-0.2155904, 0.6050562, -1.410159, 1, 0, 0, 1, 1,
-0.2075072, 2.245922, -0.5315593, 1, 0, 0, 1, 1,
-0.204066, -0.1117997, -1.265979, 1, 0, 0, 1, 1,
-0.2026272, -0.03444903, -0.4594392, 1, 0, 0, 1, 1,
-0.2018565, 0.7857853, 0.2741752, 1, 0, 0, 1, 1,
-0.2003436, 1.069626, -1.497077, 0, 0, 0, 1, 1,
-0.2003011, -0.180746, -1.520658, 0, 0, 0, 1, 1,
-0.2002304, 0.6347441, -1.028385, 0, 0, 0, 1, 1,
-0.198553, -0.7187712, -1.894284, 0, 0, 0, 1, 1,
-0.1933425, -0.9977412, -3.84934, 0, 0, 0, 1, 1,
-0.1908597, 0.4301874, -0.4906048, 0, 0, 0, 1, 1,
-0.1857081, -1.071458, -2.577513, 0, 0, 0, 1, 1,
-0.1830418, 1.543782, -1.038988, 1, 1, 1, 1, 1,
-0.1830382, 0.7859198, -0.05737112, 1, 1, 1, 1, 1,
-0.1818972, 0.001095561, -0.33775, 1, 1, 1, 1, 1,
-0.1817451, -1.437322, -0.74881, 1, 1, 1, 1, 1,
-0.1794106, -0.1755734, -2.589083, 1, 1, 1, 1, 1,
-0.1778807, 0.4617369, 1.341068, 1, 1, 1, 1, 1,
-0.1767014, 0.584325, -0.3064441, 1, 1, 1, 1, 1,
-0.1766898, -1.304098, -2.94599, 1, 1, 1, 1, 1,
-0.1758924, 0.5140179, 1.955548, 1, 1, 1, 1, 1,
-0.1723631, -0.8280703, -2.437504, 1, 1, 1, 1, 1,
-0.1700363, -1.023321, -2.99227, 1, 1, 1, 1, 1,
-0.1672474, 0.2911015, -0.3800081, 1, 1, 1, 1, 1,
-0.1661535, 2.066584, 0.1335274, 1, 1, 1, 1, 1,
-0.1652924, -1.338112, -1.896156, 1, 1, 1, 1, 1,
-0.1644778, 0.09350482, -0.737976, 1, 1, 1, 1, 1,
-0.1642685, 0.3141794, 1.047767, 0, 0, 1, 1, 1,
-0.1635886, 1.151896, 0.4677857, 1, 0, 0, 1, 1,
-0.1622574, -2.798166, -4.206806, 1, 0, 0, 1, 1,
-0.1621587, -0.6482728, -3.78548, 1, 0, 0, 1, 1,
-0.1616338, 0.715235, 0.06281518, 1, 0, 0, 1, 1,
-0.1569344, -1.003649, -2.670475, 1, 0, 0, 1, 1,
-0.1565139, 0.5541388, -0.7195024, 0, 0, 0, 1, 1,
-0.1514509, -0.5104094, -1.07526, 0, 0, 0, 1, 1,
-0.1513011, -0.5992239, -4.584797, 0, 0, 0, 1, 1,
-0.14998, 1.090872, 1.352163, 0, 0, 0, 1, 1,
-0.1478323, 0.2704405, -0.8667547, 0, 0, 0, 1, 1,
-0.1432472, 0.8594445, -0.5858002, 0, 0, 0, 1, 1,
-0.1422466, 0.764433, -1.35834, 0, 0, 0, 1, 1,
-0.1400722, 0.01108257, -2.147234, 1, 1, 1, 1, 1,
-0.1396026, -0.6019062, -2.801931, 1, 1, 1, 1, 1,
-0.1255703, 1.387757, 0.05792142, 1, 1, 1, 1, 1,
-0.1253759, 0.8806473, 0.7616988, 1, 1, 1, 1, 1,
-0.1216309, -0.3816946, -4.063361, 1, 1, 1, 1, 1,
-0.1210138, -1.863617, -1.050117, 1, 1, 1, 1, 1,
-0.1205142, -1.267223, -3.28523, 1, 1, 1, 1, 1,
-0.1180791, -1.395113, -4.745309, 1, 1, 1, 1, 1,
-0.1170262, 0.7277045, -1.578632, 1, 1, 1, 1, 1,
-0.1169621, -0.3884784, -2.969513, 1, 1, 1, 1, 1,
-0.1077816, 0.3559489, 0.4615613, 1, 1, 1, 1, 1,
-0.1071959, 0.09017612, -1.87327, 1, 1, 1, 1, 1,
-0.106646, -0.8275628, -3.937394, 1, 1, 1, 1, 1,
-0.1022417, -0.6509696, -1.442615, 1, 1, 1, 1, 1,
-0.102103, 0.0226296, -1.957003, 1, 1, 1, 1, 1,
-0.09453798, 1.902884, -0.08488519, 0, 0, 1, 1, 1,
-0.09262946, -1.347172, -2.43728, 1, 0, 0, 1, 1,
-0.09068009, 1.567388, 1.563977, 1, 0, 0, 1, 1,
-0.08767365, -0.2429513, -3.171494, 1, 0, 0, 1, 1,
-0.08743381, 0.6278934, 0.1708117, 1, 0, 0, 1, 1,
-0.08735618, 0.9457307, 0.5161075, 1, 0, 0, 1, 1,
-0.08685534, -0.8036382, -2.815489, 0, 0, 0, 1, 1,
-0.08675846, -1.552246, -3.250746, 0, 0, 0, 1, 1,
-0.08622515, 0.7661058, -0.8841537, 0, 0, 0, 1, 1,
-0.08399823, 0.3209683, 0.2893545, 0, 0, 0, 1, 1,
-0.08181851, 0.3708062, -0.8109398, 0, 0, 0, 1, 1,
-0.07887802, 0.4579154, 0.3447872, 0, 0, 0, 1, 1,
-0.07258512, 1.838069, 1.02146, 0, 0, 0, 1, 1,
-0.07230705, -0.8929002, -3.269318, 1, 1, 1, 1, 1,
-0.0670017, 0.2352642, -1.1378, 1, 1, 1, 1, 1,
-0.06195733, 1.527434, 1.040769, 1, 1, 1, 1, 1,
-0.06180562, 0.03968164, 1.534622, 1, 1, 1, 1, 1,
-0.0577369, 0.4924791, 0.9378818, 1, 1, 1, 1, 1,
-0.05504321, -1.000916, -2.933177, 1, 1, 1, 1, 1,
-0.05436325, 0.760982, -0.1810152, 1, 1, 1, 1, 1,
-0.05318737, 1.509429, -0.6534711, 1, 1, 1, 1, 1,
-0.05253256, -1.284871, -4.106895, 1, 1, 1, 1, 1,
-0.05212338, 0.1288759, -1.25995, 1, 1, 1, 1, 1,
-0.05166946, 0.5631028, -0.06247443, 1, 1, 1, 1, 1,
-0.05140384, -0.9694779, -4.985215, 1, 1, 1, 1, 1,
-0.04860985, 0.4883527, 0.06468173, 1, 1, 1, 1, 1,
-0.04835597, 0.5871961, 0.5729094, 1, 1, 1, 1, 1,
-0.04402384, -0.3658445, -3.947315, 1, 1, 1, 1, 1,
-0.03113141, 0.7610246, 0.2773981, 0, 0, 1, 1, 1,
-0.02481916, -1.025934, -4.762658, 1, 0, 0, 1, 1,
-0.02422787, 0.04782842, 0.24498, 1, 0, 0, 1, 1,
-0.02283474, -1.40615, -3.008577, 1, 0, 0, 1, 1,
-0.02244932, 0.9377367, -1.478303, 1, 0, 0, 1, 1,
-0.02094179, -1.383777, -3.194595, 1, 0, 0, 1, 1,
-0.01823511, 0.2113182, -1.881351, 0, 0, 0, 1, 1,
-0.01605232, -1.467185, -3.075511, 0, 0, 0, 1, 1,
-0.0145432, 0.1595228, 0.8620842, 0, 0, 0, 1, 1,
-0.01292826, -0.1736963, -2.95618, 0, 0, 0, 1, 1,
-0.01037582, -0.62306, -2.202144, 0, 0, 0, 1, 1,
-0.002115596, 0.9205911, 0.4079647, 0, 0, 0, 1, 1,
-0.001849006, 1.097735, 0.1646091, 0, 0, 0, 1, 1,
0.001356521, 0.5372676, 0.6063696, 1, 1, 1, 1, 1,
0.007507847, 0.2280937, -0.2690547, 1, 1, 1, 1, 1,
0.009686548, -0.7218303, 4.805373, 1, 1, 1, 1, 1,
0.01421949, -0.5428929, 3.113529, 1, 1, 1, 1, 1,
0.01527089, -0.3546054, 2.198115, 1, 1, 1, 1, 1,
0.0203073, -0.5378663, 3.658805, 1, 1, 1, 1, 1,
0.02211356, -2.183647, 3.892282, 1, 1, 1, 1, 1,
0.02257114, -1.609743, 3.347904, 1, 1, 1, 1, 1,
0.03017427, 0.001638306, 3.496916, 1, 1, 1, 1, 1,
0.03502231, -0.3750232, 2.510911, 1, 1, 1, 1, 1,
0.04021377, -0.190751, 3.90819, 1, 1, 1, 1, 1,
0.04389454, -0.8652525, 3.795151, 1, 1, 1, 1, 1,
0.04466354, 1.281728, 0.5213836, 1, 1, 1, 1, 1,
0.04974941, 0.2032605, -0.5342672, 1, 1, 1, 1, 1,
0.05182127, -1.702151, 3.834517, 1, 1, 1, 1, 1,
0.05418273, 1.231051, -0.9277898, 0, 0, 1, 1, 1,
0.05885052, 0.6031279, 0.02772426, 1, 0, 0, 1, 1,
0.05942502, -1.109446, 4.996407, 1, 0, 0, 1, 1,
0.05951229, 1.883206, 0.09684507, 1, 0, 0, 1, 1,
0.06178895, -1.239366, 4.035205, 1, 0, 0, 1, 1,
0.06276964, -2.500887, 4.509488, 1, 0, 0, 1, 1,
0.06338698, -0.1313496, 3.923035, 0, 0, 0, 1, 1,
0.06566423, 0.4318918, 1.012426, 0, 0, 0, 1, 1,
0.06985489, -0.7134463, 2.486688, 0, 0, 0, 1, 1,
0.07172383, 0.8043785, 1.571384, 0, 0, 0, 1, 1,
0.07240504, -0.4411161, 4.442704, 0, 0, 0, 1, 1,
0.07293381, 0.08740775, 0.2397671, 0, 0, 0, 1, 1,
0.07319246, 1.377794, 0.9861599, 0, 0, 0, 1, 1,
0.07517933, 0.5393705, 0.03539207, 1, 1, 1, 1, 1,
0.07657704, 2.040398, -0.1689829, 1, 1, 1, 1, 1,
0.07812079, 0.503185, 0.5937733, 1, 1, 1, 1, 1,
0.0781443, -1.922915, 2.673081, 1, 1, 1, 1, 1,
0.08007947, -0.8628746, 4.355973, 1, 1, 1, 1, 1,
0.08084975, 0.4495793, -0.0006401684, 1, 1, 1, 1, 1,
0.08387552, 2.547226, 0.5614514, 1, 1, 1, 1, 1,
0.08642216, -0.4821321, 4.620273, 1, 1, 1, 1, 1,
0.08830774, 0.3636142, 0.4925452, 1, 1, 1, 1, 1,
0.08864956, -0.7172034, 1.939398, 1, 1, 1, 1, 1,
0.09004486, -2.305822, 0.9632311, 1, 1, 1, 1, 1,
0.09052645, 0.03508369, 2.205741, 1, 1, 1, 1, 1,
0.09210465, -0.0567721, 1.821359, 1, 1, 1, 1, 1,
0.09596442, -0.02192567, 1.745734, 1, 1, 1, 1, 1,
0.09766818, -1.779207, 2.45022, 1, 1, 1, 1, 1,
0.09927584, -1.165373, 2.195613, 0, 0, 1, 1, 1,
0.1009873, -0.00609227, 2.090901, 1, 0, 0, 1, 1,
0.1035313, -0.03133409, 1.808933, 1, 0, 0, 1, 1,
0.1043311, 0.3474685, -0.3395039, 1, 0, 0, 1, 1,
0.105222, -0.9283498, 2.256681, 1, 0, 0, 1, 1,
0.1117295, -0.8534145, 3.22666, 1, 0, 0, 1, 1,
0.1135025, 0.3900014, 0.9019381, 0, 0, 0, 1, 1,
0.1168652, 0.5584517, 0.2595415, 0, 0, 0, 1, 1,
0.1176569, -0.6490847, 4.11091, 0, 0, 0, 1, 1,
0.1187605, 0.001548749, 1.470193, 0, 0, 0, 1, 1,
0.1191428, -0.2718796, 2.673476, 0, 0, 0, 1, 1,
0.1196204, -0.6354537, 0.7163855, 0, 0, 0, 1, 1,
0.1207737, 0.4644784, 0.9491647, 0, 0, 0, 1, 1,
0.1245967, 0.1617094, -0.3037966, 1, 1, 1, 1, 1,
0.1252789, -0.2773554, 3.740681, 1, 1, 1, 1, 1,
0.125843, 0.5102835, 0.8939304, 1, 1, 1, 1, 1,
0.1302372, -0.1573016, 1.363745, 1, 1, 1, 1, 1,
0.1305497, -1.792937, 3.171986, 1, 1, 1, 1, 1,
0.1306513, -1.674861, 3.039807, 1, 1, 1, 1, 1,
0.1314652, 0.5191619, 1.542593, 1, 1, 1, 1, 1,
0.1332281, 1.175415, 1.182595, 1, 1, 1, 1, 1,
0.1339023, -0.4562869, 3.106395, 1, 1, 1, 1, 1,
0.1343362, 0.5606112, 0.1823084, 1, 1, 1, 1, 1,
0.1376245, -1.133877, 1.352533, 1, 1, 1, 1, 1,
0.14066, -1.015227, 2.403151, 1, 1, 1, 1, 1,
0.144959, -0.3715299, 4.494809, 1, 1, 1, 1, 1,
0.1480087, -0.1906926, 2.8756, 1, 1, 1, 1, 1,
0.1502145, 0.8879257, -0.2342621, 1, 1, 1, 1, 1,
0.1544086, 1.326758, 0.1063974, 0, 0, 1, 1, 1,
0.1571667, -0.1050468, 1.727453, 1, 0, 0, 1, 1,
0.1608404, 0.8060005, 0.3341847, 1, 0, 0, 1, 1,
0.162489, 1.503695, 0.9590142, 1, 0, 0, 1, 1,
0.1629114, -0.2380952, 3.165247, 1, 0, 0, 1, 1,
0.1644688, 0.963567, 1.468998, 1, 0, 0, 1, 1,
0.1650473, -1.114575, 2.275491, 0, 0, 0, 1, 1,
0.1669401, 1.149761, 0.0160766, 0, 0, 0, 1, 1,
0.1676441, -1.001184, 2.10411, 0, 0, 0, 1, 1,
0.1728893, -1.739424, 1.413268, 0, 0, 0, 1, 1,
0.1752894, 0.4768509, 0.7439228, 0, 0, 0, 1, 1,
0.1759101, -1.531555, 3.277308, 0, 0, 0, 1, 1,
0.1766493, 1.487097, 0.3975532, 0, 0, 0, 1, 1,
0.1771223, 0.7133251, 1.796625, 1, 1, 1, 1, 1,
0.1808928, -0.2634716, 2.911588, 1, 1, 1, 1, 1,
0.1816511, 1.257424, 0.6790569, 1, 1, 1, 1, 1,
0.1828594, 1.445267, -0.1602031, 1, 1, 1, 1, 1,
0.1829247, -1.475516, 1.690333, 1, 1, 1, 1, 1,
0.1843569, -0.8053082, 0.9377249, 1, 1, 1, 1, 1,
0.1850793, 2.259868, 2.435814, 1, 1, 1, 1, 1,
0.1910233, 1.990014, 1.761325, 1, 1, 1, 1, 1,
0.1919005, -0.9231924, 2.312641, 1, 1, 1, 1, 1,
0.1927635, -0.8691505, 1.637197, 1, 1, 1, 1, 1,
0.1937704, -0.8745031, 3.290826, 1, 1, 1, 1, 1,
0.194606, -1.18355, 2.264795, 1, 1, 1, 1, 1,
0.1984823, -1.20829, 3.474176, 1, 1, 1, 1, 1,
0.2014737, -0.03045482, 1.002243, 1, 1, 1, 1, 1,
0.2079581, -0.4430737, 3.819541, 1, 1, 1, 1, 1,
0.2086826, -0.002145581, 1.496512, 0, 0, 1, 1, 1,
0.2119087, 0.8630033, 0.07712843, 1, 0, 0, 1, 1,
0.216627, 0.9091156, 0.3652775, 1, 0, 0, 1, 1,
0.2175116, -0.1393323, 1.740451, 1, 0, 0, 1, 1,
0.2183977, -1.573465, 2.438648, 1, 0, 0, 1, 1,
0.2192454, -0.4615344, 2.237686, 1, 0, 0, 1, 1,
0.2212805, 0.9400051, -0.9630821, 0, 0, 0, 1, 1,
0.2215371, 0.04919234, 1.303403, 0, 0, 0, 1, 1,
0.2265014, -0.2828529, 2.748794, 0, 0, 0, 1, 1,
0.2271644, -0.9652992, 1.996694, 0, 0, 0, 1, 1,
0.2277015, 0.8167647, 1.202975, 0, 0, 0, 1, 1,
0.2284049, 0.8979952, -0.1728807, 0, 0, 0, 1, 1,
0.2289389, -0.5459157, 3.48207, 0, 0, 0, 1, 1,
0.2300153, -0.3758879, 3.679712, 1, 1, 1, 1, 1,
0.2357984, -0.7997597, 3.526128, 1, 1, 1, 1, 1,
0.2366282, 0.05409174, 2.161573, 1, 1, 1, 1, 1,
0.2389476, -1.739472, 3.239791, 1, 1, 1, 1, 1,
0.2403799, 0.9571565, -0.8119034, 1, 1, 1, 1, 1,
0.2413708, -0.9071898, 2.424773, 1, 1, 1, 1, 1,
0.242505, 0.8482314, 0.5111948, 1, 1, 1, 1, 1,
0.2445049, -0.09899817, 3.489891, 1, 1, 1, 1, 1,
0.2474938, -0.5884685, 0.9813212, 1, 1, 1, 1, 1,
0.2479197, -0.2211768, 2.729164, 1, 1, 1, 1, 1,
0.2483056, 1.016188, -0.4173945, 1, 1, 1, 1, 1,
0.2506415, -1.051865, 2.242406, 1, 1, 1, 1, 1,
0.2530018, 1.810186, -0.9302902, 1, 1, 1, 1, 1,
0.2546909, -1.615261, 2.765888, 1, 1, 1, 1, 1,
0.2567249, -2.232017, 1.778404, 1, 1, 1, 1, 1,
0.2614205, 0.5434249, 0.1133826, 0, 0, 1, 1, 1,
0.2625294, 0.4336507, -0.2951446, 1, 0, 0, 1, 1,
0.267659, -0.4046616, 0.1584534, 1, 0, 0, 1, 1,
0.2683604, 2.0345, -0.8302288, 1, 0, 0, 1, 1,
0.2728094, -0.6861585, 1.08663, 1, 0, 0, 1, 1,
0.2729855, 0.03609645, 1.463855, 1, 0, 0, 1, 1,
0.2756911, 0.8830171, 2.025845, 0, 0, 0, 1, 1,
0.2785809, -1.172446, 2.60905, 0, 0, 0, 1, 1,
0.2786705, -0.3114327, 4.034871, 0, 0, 0, 1, 1,
0.2891729, -0.4090484, 3.048857, 0, 0, 0, 1, 1,
0.2921007, 1.679467, -0.2844244, 0, 0, 0, 1, 1,
0.3018251, 0.2951203, 0.8340339, 0, 0, 0, 1, 1,
0.3038444, 0.3813799, 0.2004919, 0, 0, 0, 1, 1,
0.3070559, 1.025361, 1.069618, 1, 1, 1, 1, 1,
0.3079295, -0.4782149, 3.261921, 1, 1, 1, 1, 1,
0.3112, -1.465552, 2.64962, 1, 1, 1, 1, 1,
0.3151756, -1.247607, 3.214956, 1, 1, 1, 1, 1,
0.3190933, -0.5313303, 1.898199, 1, 1, 1, 1, 1,
0.3197902, 1.455749, -0.08575819, 1, 1, 1, 1, 1,
0.3220927, -0.4593473, 2.650717, 1, 1, 1, 1, 1,
0.3250212, 0.6091619, 1.880026, 1, 1, 1, 1, 1,
0.326131, 0.8667101, 0.6045054, 1, 1, 1, 1, 1,
0.3269397, 0.3087797, 1.574906, 1, 1, 1, 1, 1,
0.3301812, 1.648624, 1.172812, 1, 1, 1, 1, 1,
0.33069, 1.057129, 0.01158764, 1, 1, 1, 1, 1,
0.3314741, 0.4802008, 0.526426, 1, 1, 1, 1, 1,
0.3346587, 0.5771524, 0.1347429, 1, 1, 1, 1, 1,
0.3412979, -2.016908, 3.992999, 1, 1, 1, 1, 1,
0.3414633, 0.09901936, 2.421391, 0, 0, 1, 1, 1,
0.3421411, 0.1032001, 1.43496, 1, 0, 0, 1, 1,
0.3459759, 0.3832471, 0.03773769, 1, 0, 0, 1, 1,
0.3475621, -1.417072, 2.119371, 1, 0, 0, 1, 1,
0.3477188, -0.9115303, 2.286434, 1, 0, 0, 1, 1,
0.3480657, 1.586159, 1.645194, 1, 0, 0, 1, 1,
0.3484488, 0.1067815, 0.271947, 0, 0, 0, 1, 1,
0.3505457, -0.6557336, 1.666268, 0, 0, 0, 1, 1,
0.3541387, 1.196112, -0.1144535, 0, 0, 0, 1, 1,
0.3555434, -1.038401, 2.664175, 0, 0, 0, 1, 1,
0.3625375, 0.763406, -0.01148717, 0, 0, 0, 1, 1,
0.3668932, -0.08585976, 2.387658, 0, 0, 0, 1, 1,
0.3709431, -0.5983577, 1.56686, 0, 0, 0, 1, 1,
0.3715357, -0.2481866, 2.378637, 1, 1, 1, 1, 1,
0.3762482, -0.05847067, 0.1837883, 1, 1, 1, 1, 1,
0.3767498, 0.8944183, 0.2287476, 1, 1, 1, 1, 1,
0.3799247, 0.4696213, 0.8109758, 1, 1, 1, 1, 1,
0.3919986, -1.291726, 4.574408, 1, 1, 1, 1, 1,
0.3972293, -1.420499, 2.940026, 1, 1, 1, 1, 1,
0.3973325, -0.5860548, 1.769436, 1, 1, 1, 1, 1,
0.405318, -2.072052, 3.181716, 1, 1, 1, 1, 1,
0.4074146, 0.9565314, 1.172338, 1, 1, 1, 1, 1,
0.4076498, 0.8441669, -0.5823882, 1, 1, 1, 1, 1,
0.407686, 1.517621, 0.4653867, 1, 1, 1, 1, 1,
0.4118612, -1.236703, 4.563254, 1, 1, 1, 1, 1,
0.4140908, -0.9020025, 3.999629, 1, 1, 1, 1, 1,
0.4157982, -0.3097084, 3.422523, 1, 1, 1, 1, 1,
0.4193347, -0.7908182, 4.235, 1, 1, 1, 1, 1,
0.4253755, 0.2778938, -0.5482526, 0, 0, 1, 1, 1,
0.425651, -0.4673851, 3.202531, 1, 0, 0, 1, 1,
0.4263047, 0.1535609, 1.315142, 1, 0, 0, 1, 1,
0.4280172, 0.2961239, 0.402684, 1, 0, 0, 1, 1,
0.4297351, 1.006225, 1.637596, 1, 0, 0, 1, 1,
0.4300782, -1.761801, 2.659984, 1, 0, 0, 1, 1,
0.4306798, 0.3029386, 0.5515556, 0, 0, 0, 1, 1,
0.4430557, 1.058245, -1.411389, 0, 0, 0, 1, 1,
0.4459672, 2.362224, -0.634092, 0, 0, 0, 1, 1,
0.4464466, 0.4117356, 1.31939, 0, 0, 0, 1, 1,
0.4476745, 1.077747, 0.1730222, 0, 0, 0, 1, 1,
0.4479788, 0.445121, 0.4052025, 0, 0, 0, 1, 1,
0.4481566, 0.6126962, 2.8157, 0, 0, 0, 1, 1,
0.4519853, -1.793615, 5.279584, 1, 1, 1, 1, 1,
0.4553437, 0.8904516, 1.35652, 1, 1, 1, 1, 1,
0.45807, 0.2733363, 0.2698698, 1, 1, 1, 1, 1,
0.4615892, 0.3363488, 1.112952, 1, 1, 1, 1, 1,
0.4627694, 0.2255139, 0.7441176, 1, 1, 1, 1, 1,
0.4631938, 0.8633221, -0.03119837, 1, 1, 1, 1, 1,
0.4772772, -1.236343, 2.705958, 1, 1, 1, 1, 1,
0.4785392, 0.8033992, 0.2348145, 1, 1, 1, 1, 1,
0.4805939, -0.5936266, 1.960356, 1, 1, 1, 1, 1,
0.4853135, -0.5495263, 1.831282, 1, 1, 1, 1, 1,
0.4853154, 0.7033229, 0.6541087, 1, 1, 1, 1, 1,
0.4896104, -0.6022367, 0.7333066, 1, 1, 1, 1, 1,
0.4951354, 0.6698371, 1.048151, 1, 1, 1, 1, 1,
0.4957555, -1.594319, 4.066174, 1, 1, 1, 1, 1,
0.4982514, -0.3215574, 1.548179, 1, 1, 1, 1, 1,
0.4986693, 1.131453, 1.279698, 0, 0, 1, 1, 1,
0.5002356, -0.1925173, 2.103407, 1, 0, 0, 1, 1,
0.5016038, 0.07635614, 0.3679252, 1, 0, 0, 1, 1,
0.5127127, 0.7319906, 0.3328977, 1, 0, 0, 1, 1,
0.5143315, -0.354931, 2.998458, 1, 0, 0, 1, 1,
0.5186363, 1.038255, -0.0269724, 1, 0, 0, 1, 1,
0.5206143, 0.3438073, 0.1755136, 0, 0, 0, 1, 1,
0.5229989, 0.4900464, 1.727008, 0, 0, 0, 1, 1,
0.5248734, 0.0762742, 2.184275, 0, 0, 0, 1, 1,
0.5289624, 0.2182602, 2.363176, 0, 0, 0, 1, 1,
0.5317179, 0.857464, 0.02924472, 0, 0, 0, 1, 1,
0.5338686, 0.3678902, -0.675412, 0, 0, 0, 1, 1,
0.5348825, -1.248693, 4.195117, 0, 0, 0, 1, 1,
0.5394186, 1.190566, -1.397104, 1, 1, 1, 1, 1,
0.544677, 1.012124, 1.274936, 1, 1, 1, 1, 1,
0.5462268, -0.4819518, 0.6364422, 1, 1, 1, 1, 1,
0.5464876, -0.2110613, 2.854486, 1, 1, 1, 1, 1,
0.5481263, -0.7954171, 3.442367, 1, 1, 1, 1, 1,
0.5499058, -0.06515335, 3.222583, 1, 1, 1, 1, 1,
0.5528426, 1.121643, 1.177321, 1, 1, 1, 1, 1,
0.5534545, -0.6182393, 1.971145, 1, 1, 1, 1, 1,
0.5553836, 0.5669429, 0.8652915, 1, 1, 1, 1, 1,
0.5672961, 0.2580417, 1.218685, 1, 1, 1, 1, 1,
0.5696956, -0.1049253, 1.26622, 1, 1, 1, 1, 1,
0.5711018, -0.5415121, 2.140725, 1, 1, 1, 1, 1,
0.5804658, 1.485398, 0.8065568, 1, 1, 1, 1, 1,
0.584178, -0.7873877, 0.7077047, 1, 1, 1, 1, 1,
0.5850466, 0.5758532, 0.8232405, 1, 1, 1, 1, 1,
0.5898732, -1.273349, 3.885851, 0, 0, 1, 1, 1,
0.593733, 2.234937, -0.09178936, 1, 0, 0, 1, 1,
0.5963981, 1.709889, 0.3191369, 1, 0, 0, 1, 1,
0.5966619, 0.2381327, 0.6425886, 1, 0, 0, 1, 1,
0.5987423, -1.138195, 2.634084, 1, 0, 0, 1, 1,
0.6000831, -0.4209858, 1.002185, 1, 0, 0, 1, 1,
0.6018564, -0.8079991, 1.739071, 0, 0, 0, 1, 1,
0.608976, -1.396997, 1.936567, 0, 0, 0, 1, 1,
0.6106822, 0.02324448, 0.3113233, 0, 0, 0, 1, 1,
0.6107226, -0.4751651, 2.544948, 0, 0, 0, 1, 1,
0.6118298, -1.377369, 2.397663, 0, 0, 0, 1, 1,
0.6142429, -0.2313983, -0.7516961, 0, 0, 0, 1, 1,
0.6184747, 0.7994035, 1.673189, 0, 0, 0, 1, 1,
0.620425, 0.2076289, 2.284551, 1, 1, 1, 1, 1,
0.6218787, -0.4393153, 2.107126, 1, 1, 1, 1, 1,
0.6221371, -2.275332, 2.43054, 1, 1, 1, 1, 1,
0.6253648, 2.147902, 1.584705, 1, 1, 1, 1, 1,
0.6266649, -1.434526, 3.623212, 1, 1, 1, 1, 1,
0.6310418, -1.505033, 1.94374, 1, 1, 1, 1, 1,
0.6374462, 1.899293, 0.1958133, 1, 1, 1, 1, 1,
0.6412043, -1.138162, 2.875141, 1, 1, 1, 1, 1,
0.6424761, 1.083436, 1.455491, 1, 1, 1, 1, 1,
0.6462575, 0.8511062, 0.513187, 1, 1, 1, 1, 1,
0.6474347, -0.004235139, 2.514276, 1, 1, 1, 1, 1,
0.6492168, 0.3873527, 1.724082, 1, 1, 1, 1, 1,
0.6524848, -1.069808, -0.02215841, 1, 1, 1, 1, 1,
0.6560544, 0.4405489, 1.761444, 1, 1, 1, 1, 1,
0.6601091, 1.270407, 1.000409, 1, 1, 1, 1, 1,
0.6606415, 1.499699, 1.587566, 0, 0, 1, 1, 1,
0.6646194, 0.7317182, 2.112983, 1, 0, 0, 1, 1,
0.6665674, -1.258635, 2.318726, 1, 0, 0, 1, 1,
0.6667112, -0.459516, 2.448872, 1, 0, 0, 1, 1,
0.6766729, 0.3450673, 2.252239, 1, 0, 0, 1, 1,
0.678436, 0.3586168, 1.506279, 1, 0, 0, 1, 1,
0.687701, 0.7120211, 1.87138, 0, 0, 0, 1, 1,
0.6883362, 0.896585, 0.9406452, 0, 0, 0, 1, 1,
0.6893364, -0.280606, 2.141598, 0, 0, 0, 1, 1,
0.6903909, -0.260238, 1.696706, 0, 0, 0, 1, 1,
0.6931654, 1.329709, -1.363076, 0, 0, 0, 1, 1,
0.6933726, 0.1947891, 1.024618, 0, 0, 0, 1, 1,
0.7153686, -0.3239185, 2.43473, 0, 0, 0, 1, 1,
0.716026, 0.754447, 0.560338, 1, 1, 1, 1, 1,
0.7196578, -0.9122176, 0.8698553, 1, 1, 1, 1, 1,
0.7279661, 0.9312499, -1.357251, 1, 1, 1, 1, 1,
0.7284876, 0.2722389, 1.593821, 1, 1, 1, 1, 1,
0.7322997, 0.4812734, 0.4950331, 1, 1, 1, 1, 1,
0.7380005, 0.121463, 1.002624, 1, 1, 1, 1, 1,
0.7426873, 0.7967942, -0.4674656, 1, 1, 1, 1, 1,
0.7456049, -1.979135, 4.371261, 1, 1, 1, 1, 1,
0.7460132, -0.000976824, 2.209481, 1, 1, 1, 1, 1,
0.7613193, 0.981108, 0.2140948, 1, 1, 1, 1, 1,
0.7684697, 0.05394186, 1.806086, 1, 1, 1, 1, 1,
0.7815547, 1.451735, -0.6354265, 1, 1, 1, 1, 1,
0.7872319, -0.2736536, 1.23231, 1, 1, 1, 1, 1,
0.7909479, -1.564644, 2.567131, 1, 1, 1, 1, 1,
0.7989979, -0.3394069, 2.376563, 1, 1, 1, 1, 1,
0.8001892, 1.435915, -0.766919, 0, 0, 1, 1, 1,
0.8045327, -0.6533278, 2.487692, 1, 0, 0, 1, 1,
0.809083, -1.347113, 2.001698, 1, 0, 0, 1, 1,
0.8195955, 1.628118, 0.9193038, 1, 0, 0, 1, 1,
0.8249266, -1.308147, 1.799132, 1, 0, 0, 1, 1,
0.8259072, 0.09383461, 0.9743894, 1, 0, 0, 1, 1,
0.8331544, 0.5796753, 0.6064253, 0, 0, 0, 1, 1,
0.834311, -0.03164541, 0.9559352, 0, 0, 0, 1, 1,
0.8427658, 1.259025, 1.239522, 0, 0, 0, 1, 1,
0.8460144, 1.022557, 2.227369, 0, 0, 0, 1, 1,
0.8495834, 0.199435, 1.279265, 0, 0, 0, 1, 1,
0.8502229, -1.025633, 2.934517, 0, 0, 0, 1, 1,
0.8503346, 0.6777975, 1.2263, 0, 0, 0, 1, 1,
0.8544356, 0.2518938, 0.7563268, 1, 1, 1, 1, 1,
0.8546703, -0.5630898, 1.995016, 1, 1, 1, 1, 1,
0.8550208, 1.058362, 1.014504, 1, 1, 1, 1, 1,
0.8617159, -0.8368473, 2.637701, 1, 1, 1, 1, 1,
0.8627219, -0.02198795, 2.344134, 1, 1, 1, 1, 1,
0.8641407, 0.7067971, 2.183555, 1, 1, 1, 1, 1,
0.8642073, 0.1876918, 1.997673, 1, 1, 1, 1, 1,
0.8642516, 0.09014526, 1.488825, 1, 1, 1, 1, 1,
0.8728932, -0.7958607, 1.824552, 1, 1, 1, 1, 1,
0.8871731, 0.1830581, 1.587255, 1, 1, 1, 1, 1,
0.8877387, 1.432491, -0.5019928, 1, 1, 1, 1, 1,
0.8883758, 0.3491311, 1.227271, 1, 1, 1, 1, 1,
0.8957174, 0.02361413, 0.8562896, 1, 1, 1, 1, 1,
0.8957732, -0.1844485, 0.02865975, 1, 1, 1, 1, 1,
0.8984785, -1.421557, 3.282151, 1, 1, 1, 1, 1,
0.8992504, 1.335221, 2.142784, 0, 0, 1, 1, 1,
0.901053, 0.1542047, -0.2694646, 1, 0, 0, 1, 1,
0.9012183, 1.422884, 0.6138707, 1, 0, 0, 1, 1,
0.9058717, 2.363984, 0.2169379, 1, 0, 0, 1, 1,
0.9063854, 0.4114647, -0.4825484, 1, 0, 0, 1, 1,
0.907953, -0.5809332, 1.237956, 1, 0, 0, 1, 1,
0.9153425, 0.3802831, 1.60882, 0, 0, 0, 1, 1,
0.9209281, 0.4997302, 1.29132, 0, 0, 0, 1, 1,
0.923907, -1.514778, 1.998821, 0, 0, 0, 1, 1,
0.9271227, -0.242882, 1.329626, 0, 0, 0, 1, 1,
0.9283947, 0.5268567, 1.800853, 0, 0, 0, 1, 1,
0.9306309, -0.007458653, 3.115061, 0, 0, 0, 1, 1,
0.9324419, -1.145184, 1.26048, 0, 0, 0, 1, 1,
0.9327636, -0.4617593, 3.048267, 1, 1, 1, 1, 1,
0.9333187, 1.626837, 2.459027, 1, 1, 1, 1, 1,
0.9345844, 1.388789, 1.389324, 1, 1, 1, 1, 1,
0.9505235, 0.7616071, 0.1232679, 1, 1, 1, 1, 1,
0.9548263, -1.336186, -0.1859744, 1, 1, 1, 1, 1,
0.9636195, 1.437513, 0.6733074, 1, 1, 1, 1, 1,
0.9654276, -0.3516631, 1.475178, 1, 1, 1, 1, 1,
0.9655801, -0.0109101, 0.5053313, 1, 1, 1, 1, 1,
0.9696043, -1.246908, 1.823512, 1, 1, 1, 1, 1,
0.9751923, 1.343088, 0.873214, 1, 1, 1, 1, 1,
0.9822905, 0.6642683, -0.5294695, 1, 1, 1, 1, 1,
0.9938012, -0.8465884, 3.130923, 1, 1, 1, 1, 1,
0.9940772, 0.8167623, 2.223503, 1, 1, 1, 1, 1,
0.9944677, 0.7998933, 1.310982, 1, 1, 1, 1, 1,
0.9961748, -0.1854701, 2.595932, 1, 1, 1, 1, 1,
0.9992383, -0.6927332, 2.25531, 0, 0, 1, 1, 1,
0.9992667, -1.105578, 4.211199, 1, 0, 0, 1, 1,
1.000589, 1.083677, 0.1193904, 1, 0, 0, 1, 1,
1.004182, -1.262688, 0.867536, 1, 0, 0, 1, 1,
1.013513, -0.8331209, 2.7346, 1, 0, 0, 1, 1,
1.020414, -0.6083897, 2.374726, 1, 0, 0, 1, 1,
1.024933, 0.1421402, 1.948283, 0, 0, 0, 1, 1,
1.031222, -0.5947834, 1.578913, 0, 0, 0, 1, 1,
1.035026, -0.7217058, 0.3605905, 0, 0, 0, 1, 1,
1.035119, 1.000207, 1.580966, 0, 0, 0, 1, 1,
1.035392, -0.6673145, 1.821905, 0, 0, 0, 1, 1,
1.048013, -0.7271476, 0.9373502, 0, 0, 0, 1, 1,
1.055563, -1.636273, 4.216675, 0, 0, 0, 1, 1,
1.059081, -2.502331, 1.900106, 1, 1, 1, 1, 1,
1.069553, 0.9421658, 0.444248, 1, 1, 1, 1, 1,
1.075257, 0.1514177, 1.442421, 1, 1, 1, 1, 1,
1.079542, 0.4294875, 2.402113, 1, 1, 1, 1, 1,
1.08196, 0.153506, 1.552026, 1, 1, 1, 1, 1,
1.086115, 0.06750446, 2.76819, 1, 1, 1, 1, 1,
1.087235, -0.8991487, 1.349555, 1, 1, 1, 1, 1,
1.088703, -0.1880553, 1.570823, 1, 1, 1, 1, 1,
1.091616, -0.1354319, 0.8852632, 1, 1, 1, 1, 1,
1.095847, -1.168873, 4.533052, 1, 1, 1, 1, 1,
1.098941, 0.2329981, 0.8245214, 1, 1, 1, 1, 1,
1.103028, -0.06368956, 1.191214, 1, 1, 1, 1, 1,
1.115504, 0.1040925, 1.747653, 1, 1, 1, 1, 1,
1.122496, -0.5667459, 0.7104948, 1, 1, 1, 1, 1,
1.124532, -0.4201403, 0.5017287, 1, 1, 1, 1, 1,
1.126112, -0.2142411, 2.113488, 0, 0, 1, 1, 1,
1.126845, -0.4185309, 3.114125, 1, 0, 0, 1, 1,
1.12839, -0.655396, -0.1187726, 1, 0, 0, 1, 1,
1.130959, -1.520723, 2.235863, 1, 0, 0, 1, 1,
1.135475, 0.4407544, 1.750896, 1, 0, 0, 1, 1,
1.146151, -0.1687052, 1.855872, 1, 0, 0, 1, 1,
1.156216, -0.0008757329, 2.011928, 0, 0, 0, 1, 1,
1.157774, -1.875769, 1.53888, 0, 0, 0, 1, 1,
1.160734, 1.584822, 2.885453, 0, 0, 0, 1, 1,
1.169332, 0.3816481, 0.05127895, 0, 0, 0, 1, 1,
1.169783, 1.095641, 1.669153, 0, 0, 0, 1, 1,
1.181175, -0.04148497, 1.478493, 0, 0, 0, 1, 1,
1.184752, -0.6220609, 1.304832, 0, 0, 0, 1, 1,
1.185896, 1.274219, 0.3443322, 1, 1, 1, 1, 1,
1.187194, 0.839322, 4.225222, 1, 1, 1, 1, 1,
1.192193, 0.919595, 0.3763842, 1, 1, 1, 1, 1,
1.194018, -0.6449546, 2.605265, 1, 1, 1, 1, 1,
1.201869, 0.0450177, 1.977173, 1, 1, 1, 1, 1,
1.210632, -0.4048505, 2.543828, 1, 1, 1, 1, 1,
1.21671, 0.6794134, 0.570559, 1, 1, 1, 1, 1,
1.217098, 0.08940268, 1.212518, 1, 1, 1, 1, 1,
1.221769, -0.164077, 1.537154, 1, 1, 1, 1, 1,
1.229681, 0.8410121, 2.839257, 1, 1, 1, 1, 1,
1.231584, -0.2609063, 0.1009269, 1, 1, 1, 1, 1,
1.242889, 2.297161, 0.6811879, 1, 1, 1, 1, 1,
1.245851, -0.4716459, 1.02547, 1, 1, 1, 1, 1,
1.251809, 1.291612, 2.360421, 1, 1, 1, 1, 1,
1.259708, 0.371551, 1.715104, 1, 1, 1, 1, 1,
1.264413, -0.7094295, 0.6329764, 0, 0, 1, 1, 1,
1.274553, -0.4019996, 3.799131, 1, 0, 0, 1, 1,
1.276562, 0.7459514, 0.08193137, 1, 0, 0, 1, 1,
1.277107, 0.4756508, -0.3251535, 1, 0, 0, 1, 1,
1.283206, -0.1402005, 1.392759, 1, 0, 0, 1, 1,
1.284543, 1.513047, 0.2043792, 1, 0, 0, 1, 1,
1.290706, 0.420917, 1.974304, 0, 0, 0, 1, 1,
1.294209, 0.5725298, 1.118141, 0, 0, 0, 1, 1,
1.295412, 1.238297, 0.1404983, 0, 0, 0, 1, 1,
1.312832, 1.439948, 0.4525316, 0, 0, 0, 1, 1,
1.321052, 1.795264, -0.222484, 0, 0, 0, 1, 1,
1.325717, -1.527116, 3.261225, 0, 0, 0, 1, 1,
1.326279, -0.7681284, 1.911444, 0, 0, 0, 1, 1,
1.33649, -0.3890174, 3.036663, 1, 1, 1, 1, 1,
1.341895, -0.5779606, 3.094992, 1, 1, 1, 1, 1,
1.342045, 0.799658, 2.154709, 1, 1, 1, 1, 1,
1.342632, -0.8150696, 2.154499, 1, 1, 1, 1, 1,
1.342957, -0.6277049, 1.091183, 1, 1, 1, 1, 1,
1.348005, -0.68263, 0.9779029, 1, 1, 1, 1, 1,
1.362042, 0.5465341, 1.629442, 1, 1, 1, 1, 1,
1.36882, -0.6387722, 0.05383888, 1, 1, 1, 1, 1,
1.372158, 1.205439, 1.500474, 1, 1, 1, 1, 1,
1.380268, -1.60392, 5.489772, 1, 1, 1, 1, 1,
1.380849, -0.8250479, 0.7848391, 1, 1, 1, 1, 1,
1.414473, -1.028458, 3.200012, 1, 1, 1, 1, 1,
1.418926, -0.2713765, 0.2347194, 1, 1, 1, 1, 1,
1.435071, 0.363351, 1.293744, 1, 1, 1, 1, 1,
1.435109, 0.7197214, -0.934465, 1, 1, 1, 1, 1,
1.437604, 1.051646, 3.146935, 0, 0, 1, 1, 1,
1.438305, 0.6806797, 1.17758, 1, 0, 0, 1, 1,
1.444298, 1.465951, 1.151724, 1, 0, 0, 1, 1,
1.444732, -1.006919, 3.237176, 1, 0, 0, 1, 1,
1.455301, -0.5278489, 4.398829, 1, 0, 0, 1, 1,
1.462661, 0.4234289, 1.99947, 1, 0, 0, 1, 1,
1.46398, 2.440185, 1.54409, 0, 0, 0, 1, 1,
1.466155, 1.655888, 1.189387, 0, 0, 0, 1, 1,
1.466819, -0.8252678, 3.345599, 0, 0, 0, 1, 1,
1.47537, 0.4875857, 0.9948295, 0, 0, 0, 1, 1,
1.476987, 1.622241, -1.398211, 0, 0, 0, 1, 1,
1.485974, -0.8078332, 3.130543, 0, 0, 0, 1, 1,
1.532505, 0.002717839, 0.2832515, 0, 0, 0, 1, 1,
1.536281, 0.02358031, 3.314445, 1, 1, 1, 1, 1,
1.541407, 0.07668369, 1.500289, 1, 1, 1, 1, 1,
1.542804, -0.6598524, 2.136823, 1, 1, 1, 1, 1,
1.547266, -0.4510169, 2.628424, 1, 1, 1, 1, 1,
1.588301, 0.1139108, 2.181951, 1, 1, 1, 1, 1,
1.601068, -0.06611801, 1.536376, 1, 1, 1, 1, 1,
1.607679, -1.308511, 2.861885, 1, 1, 1, 1, 1,
1.607803, -1.52882, 1.987843, 1, 1, 1, 1, 1,
1.609457, 1.671955, 2.101752, 1, 1, 1, 1, 1,
1.618569, 0.8778816, -0.6435325, 1, 1, 1, 1, 1,
1.628045, -3.072769, 4.461709, 1, 1, 1, 1, 1,
1.639372, 1.195284, 2.049296, 1, 1, 1, 1, 1,
1.64106, -0.3080179, 0.258123, 1, 1, 1, 1, 1,
1.649941, 0.8901244, 2.024979, 1, 1, 1, 1, 1,
1.661948, -0.9956989, 2.654577, 1, 1, 1, 1, 1,
1.679464, 0.3491043, 1.813736, 0, 0, 1, 1, 1,
1.689033, 0.5380321, -0.06716456, 1, 0, 0, 1, 1,
1.692591, 1.888031, 0.3144061, 1, 0, 0, 1, 1,
1.754687, -0.07168583, 0.7681844, 1, 0, 0, 1, 1,
1.760772, 0.5268457, 0.4663571, 1, 0, 0, 1, 1,
1.777806, -0.8556205, 2.028424, 1, 0, 0, 1, 1,
1.803389, -1.193464, 2.88048, 0, 0, 0, 1, 1,
1.805854, 0.6104159, 0.8532396, 0, 0, 0, 1, 1,
1.812601, -0.3241453, 1.017502, 0, 0, 0, 1, 1,
1.814815, -1.969518, 0.73952, 0, 0, 0, 1, 1,
1.818702, 2.072345, 1.670334, 0, 0, 0, 1, 1,
1.818822, -1.543178, 2.580703, 0, 0, 0, 1, 1,
1.81912, 0.7192966, 0.3175686, 0, 0, 0, 1, 1,
1.835418, 0.4072248, 1.566958, 1, 1, 1, 1, 1,
1.837613, 0.6337753, 0.5007363, 1, 1, 1, 1, 1,
1.840021, -0.8818915, 2.932676, 1, 1, 1, 1, 1,
1.84097, 0.9843802, 0.644102, 1, 1, 1, 1, 1,
1.841048, 1.084266, 0.4128, 1, 1, 1, 1, 1,
1.862963, -0.09156539, 2.42556, 1, 1, 1, 1, 1,
1.87195, 0.3781136, 1.353547, 1, 1, 1, 1, 1,
1.875676, -0.6616251, 2.950036, 1, 1, 1, 1, 1,
1.877851, -0.2590493, 2.614491, 1, 1, 1, 1, 1,
1.891502, 0.6265468, 0.4792206, 1, 1, 1, 1, 1,
1.942694, 0.5295815, -0.5572839, 1, 1, 1, 1, 1,
1.95392, 0.08498909, 0.9070095, 1, 1, 1, 1, 1,
1.997578, -0.7923989, 1.711216, 1, 1, 1, 1, 1,
2.002276, -1.359431, 0.5149058, 1, 1, 1, 1, 1,
2.056609, 0.5512297, 0.5756868, 1, 1, 1, 1, 1,
2.057826, -0.1331781, 0.8841742, 0, 0, 1, 1, 1,
2.092161, 1.073793, 1.983562, 1, 0, 0, 1, 1,
2.151976, 0.05934471, 1.615817, 1, 0, 0, 1, 1,
2.162782, 0.2357201, 2.678964, 1, 0, 0, 1, 1,
2.224917, -0.005808782, 1.51535, 1, 0, 0, 1, 1,
2.309714, 0.8363892, 2.422571, 1, 0, 0, 1, 1,
2.314883, -1.332315, 0.4211347, 0, 0, 0, 1, 1,
2.334189, 0.03541048, 3.004944, 0, 0, 0, 1, 1,
2.368345, -0.3524981, 2.364556, 0, 0, 0, 1, 1,
2.455152, -1.681422, 2.972099, 0, 0, 0, 1, 1,
2.473087, -0.6258129, 1.335852, 0, 0, 0, 1, 1,
2.596828, -1.374685, 1.652355, 0, 0, 0, 1, 1,
2.624657, -0.249425, 0.8752655, 0, 0, 0, 1, 1,
2.673873, -0.2115243, 1.626941, 1, 1, 1, 1, 1,
2.698274, -0.007162946, 1.771675, 1, 1, 1, 1, 1,
2.699772, -0.1152039, 1.785816, 1, 1, 1, 1, 1,
2.706451, -0.06142998, -0.108407, 1, 1, 1, 1, 1,
2.758748, -1.273835, 1.574828, 1, 1, 1, 1, 1,
2.923642, 0.8051496, 2.023725, 1, 1, 1, 1, 1,
3.440087, 0.2803102, 1.63004, 1, 1, 1, 1, 1
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
var radius = 9.491827;
var distance = 33.33964;
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
mvMatrix.translate( -0.08397865, 0.4245937, -0.1883864 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.33964);
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