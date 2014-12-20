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
-3.09917, 0.1824658, -2.430122, 1, 0, 0, 1,
-2.979952, -0.4426452, -2.686838, 1, 0.007843138, 0, 1,
-2.871714, 1.145547, 0.6085055, 1, 0.01176471, 0, 1,
-2.731646, 2.034516, -0.8808953, 1, 0.01960784, 0, 1,
-2.708341, 0.4414172, 0.1034495, 1, 0.02352941, 0, 1,
-2.673258, -1.281446, -0.9233303, 1, 0.03137255, 0, 1,
-2.662616, -0.4843183, -1.972343, 1, 0.03529412, 0, 1,
-2.451043, -1.738821, -2.295389, 1, 0.04313726, 0, 1,
-2.439768, 0.1453688, -1.048362, 1, 0.04705882, 0, 1,
-2.392621, -1.212483, -3.174246, 1, 0.05490196, 0, 1,
-2.346796, -0.557388, -1.859564, 1, 0.05882353, 0, 1,
-2.322241, 0.02468202, -2.131722, 1, 0.06666667, 0, 1,
-2.292372, -0.02638111, -1.012433, 1, 0.07058824, 0, 1,
-2.246492, -1.125492, -3.354757, 1, 0.07843138, 0, 1,
-2.245478, -0.3587641, -1.816133, 1, 0.08235294, 0, 1,
-2.225878, -0.5941123, -1.07956, 1, 0.09019608, 0, 1,
-2.215978, 0.03462311, -2.981919, 1, 0.09411765, 0, 1,
-2.167743, -0.5683841, -1.314942, 1, 0.1019608, 0, 1,
-2.15136, 0.3798958, -2.587241, 1, 0.1098039, 0, 1,
-2.122077, 1.854082, -1.085565, 1, 0.1137255, 0, 1,
-2.106465, 1.286877, 0.5569112, 1, 0.1215686, 0, 1,
-2.105594, -0.02411393, -3.937571, 1, 0.1254902, 0, 1,
-2.098931, -0.9840972, -0.9233927, 1, 0.1333333, 0, 1,
-2.044444, -0.6440217, -0.7593218, 1, 0.1372549, 0, 1,
-1.981476, -0.8662319, -2.189673, 1, 0.145098, 0, 1,
-1.975593, 1.111165, -0.2974882, 1, 0.1490196, 0, 1,
-1.948797, -1.418413, -2.753401, 1, 0.1568628, 0, 1,
-1.931917, -1.297235, -0.2150222, 1, 0.1607843, 0, 1,
-1.926616, 0.5181779, -2.894499, 1, 0.1686275, 0, 1,
-1.918992, -0.8029874, -2.801957, 1, 0.172549, 0, 1,
-1.882176, -1.108399, -0.534759, 1, 0.1803922, 0, 1,
-1.875464, 0.3947604, -1.626697, 1, 0.1843137, 0, 1,
-1.873844, 2.232516, -1.27253, 1, 0.1921569, 0, 1,
-1.867189, -0.08251425, -1.925038, 1, 0.1960784, 0, 1,
-1.858995, 0.3382374, -1.606608, 1, 0.2039216, 0, 1,
-1.857667, -0.2709924, -2.783753, 1, 0.2117647, 0, 1,
-1.842509, 2.371078, -1.036714, 1, 0.2156863, 0, 1,
-1.82273, 1.254468, -1.307989, 1, 0.2235294, 0, 1,
-1.811265, 0.7821799, -0.07520015, 1, 0.227451, 0, 1,
-1.781852, 0.06409651, -2.347028, 1, 0.2352941, 0, 1,
-1.771981, -0.7521393, -1.682204, 1, 0.2392157, 0, 1,
-1.764871, 1.386521, -0.8999589, 1, 0.2470588, 0, 1,
-1.759966, -0.2114791, -1.909413, 1, 0.2509804, 0, 1,
-1.757645, 0.3400882, -0.08426993, 1, 0.2588235, 0, 1,
-1.73633, 0.8184818, 0.09368629, 1, 0.2627451, 0, 1,
-1.71513, 0.2327167, -0.8556483, 1, 0.2705882, 0, 1,
-1.714429, -1.273267, -2.515645, 1, 0.2745098, 0, 1,
-1.710693, -0.09885222, 0.6964803, 1, 0.282353, 0, 1,
-1.7101, -1.260715, -1.853143, 1, 0.2862745, 0, 1,
-1.687969, 0.2893317, -2.311988, 1, 0.2941177, 0, 1,
-1.675997, 1.449298, 0.8248482, 1, 0.3019608, 0, 1,
-1.668586, 0.7567815, -1.313314, 1, 0.3058824, 0, 1,
-1.651538, 0.07349928, -1.210372, 1, 0.3137255, 0, 1,
-1.647941, -0.9139954, -3.428594, 1, 0.3176471, 0, 1,
-1.640217, -0.6278325, -2.965953, 1, 0.3254902, 0, 1,
-1.639023, -0.2121005, 1.279922, 1, 0.3294118, 0, 1,
-1.607898, -0.2993424, -1.099928, 1, 0.3372549, 0, 1,
-1.590934, -0.0001855785, -2.23055, 1, 0.3411765, 0, 1,
-1.581216, -0.008661554, -1.162847, 1, 0.3490196, 0, 1,
-1.580602, 2.909057, -0.3008554, 1, 0.3529412, 0, 1,
-1.571168, 0.4060019, -0.8155664, 1, 0.3607843, 0, 1,
-1.549023, -0.533558, -0.7427769, 1, 0.3647059, 0, 1,
-1.548291, -0.4170934, -1.80253, 1, 0.372549, 0, 1,
-1.542597, -0.5160738, -3.047218, 1, 0.3764706, 0, 1,
-1.527988, 0.6584101, -1.636378, 1, 0.3843137, 0, 1,
-1.519487, 0.5639141, -2.158419, 1, 0.3882353, 0, 1,
-1.51321, -2.231731, -2.831013, 1, 0.3960784, 0, 1,
-1.474468, -0.01561077, -2.118042, 1, 0.4039216, 0, 1,
-1.454556, 1.518908, -1.360924, 1, 0.4078431, 0, 1,
-1.454068, -0.4292588, -2.799299, 1, 0.4156863, 0, 1,
-1.451221, -0.6956499, -1.005616, 1, 0.4196078, 0, 1,
-1.444278, 0.360527, -2.521439, 1, 0.427451, 0, 1,
-1.442511, 0.9794815, -0.2060032, 1, 0.4313726, 0, 1,
-1.437796, 1.19018, -0.4456607, 1, 0.4392157, 0, 1,
-1.436857, 2.288569, -0.6596876, 1, 0.4431373, 0, 1,
-1.429161, 0.795989, 0.04665612, 1, 0.4509804, 0, 1,
-1.425342, -2.044968, -3.858974, 1, 0.454902, 0, 1,
-1.414809, 0.1862981, -1.389108, 1, 0.4627451, 0, 1,
-1.414807, -1.399193, -1.942203, 1, 0.4666667, 0, 1,
-1.403099, -1.321581, -3.103898, 1, 0.4745098, 0, 1,
-1.401301, 0.07329326, -1.759302, 1, 0.4784314, 0, 1,
-1.401052, 0.610611, -0.8247209, 1, 0.4862745, 0, 1,
-1.396959, 0.6954909, 0.3365781, 1, 0.4901961, 0, 1,
-1.394789, -1.29347, -3.290833, 1, 0.4980392, 0, 1,
-1.393675, -0.4037398, -1.910478, 1, 0.5058824, 0, 1,
-1.388904, -1.011065, -2.563348, 1, 0.509804, 0, 1,
-1.383395, 0.007055618, -2.01388, 1, 0.5176471, 0, 1,
-1.378087, -0.1085299, -1.362795, 1, 0.5215687, 0, 1,
-1.377641, 0.8325337, -1.250099, 1, 0.5294118, 0, 1,
-1.359024, 0.822088, -0.6418793, 1, 0.5333334, 0, 1,
-1.358441, 0.4034228, -1.212966, 1, 0.5411765, 0, 1,
-1.346387, 0.7880806, -1.297194, 1, 0.5450981, 0, 1,
-1.334133, 0.0740592, -2.428593, 1, 0.5529412, 0, 1,
-1.33098, -0.7799203, -3.561271, 1, 0.5568628, 0, 1,
-1.324546, -0.4152276, -1.492598, 1, 0.5647059, 0, 1,
-1.318627, -1.219971, -2.272658, 1, 0.5686275, 0, 1,
-1.317718, 1.571923, -0.7588126, 1, 0.5764706, 0, 1,
-1.303547, -1.043502, -1.672399, 1, 0.5803922, 0, 1,
-1.298053, 0.2430553, -0.5656621, 1, 0.5882353, 0, 1,
-1.294629, -0.1968793, -1.699731, 1, 0.5921569, 0, 1,
-1.292989, -0.4948762, -1.183125, 1, 0.6, 0, 1,
-1.283637, -0.1916661, -2.762464, 1, 0.6078432, 0, 1,
-1.28318, -0.859042, -4.519321, 1, 0.6117647, 0, 1,
-1.282588, 1.10851, 0.7902073, 1, 0.6196079, 0, 1,
-1.276199, -0.04974999, -3.577006, 1, 0.6235294, 0, 1,
-1.274262, 1.250372, 0.7425213, 1, 0.6313726, 0, 1,
-1.274022, 2.162714, 0.03673831, 1, 0.6352941, 0, 1,
-1.26372, 1.793491, -1.964848, 1, 0.6431373, 0, 1,
-1.262481, 0.3992407, -2.721251, 1, 0.6470588, 0, 1,
-1.250694, -0.2227149, -1.391893, 1, 0.654902, 0, 1,
-1.247891, -0.7358208, -1.407829, 1, 0.6588235, 0, 1,
-1.245119, -0.3481359, -0.5991079, 1, 0.6666667, 0, 1,
-1.239898, -1.216576, -2.648134, 1, 0.6705883, 0, 1,
-1.219852, -1.173423, -4.097608, 1, 0.6784314, 0, 1,
-1.194961, 0.4543221, -2.088115, 1, 0.682353, 0, 1,
-1.162306, -0.1226486, -3.036631, 1, 0.6901961, 0, 1,
-1.15552, -1.479663, -4.417659, 1, 0.6941177, 0, 1,
-1.147707, 1.154087, -0.6228778, 1, 0.7019608, 0, 1,
-1.144993, -1.605102, -1.938636, 1, 0.7098039, 0, 1,
-1.137321, 0.6448314, -1.407872, 1, 0.7137255, 0, 1,
-1.134466, 0.5492156, 0.7171292, 1, 0.7215686, 0, 1,
-1.12987, 0.04129781, -1.394145, 1, 0.7254902, 0, 1,
-1.126873, -0.1795408, -0.8898674, 1, 0.7333333, 0, 1,
-1.114054, 0.4549822, -2.112331, 1, 0.7372549, 0, 1,
-1.10186, -0.6014396, -3.712007, 1, 0.7450981, 0, 1,
-1.096967, 0.612589, -0.8841149, 1, 0.7490196, 0, 1,
-1.096206, 0.7589924, 0.1836311, 1, 0.7568628, 0, 1,
-1.092286, -0.2466287, -1.592846, 1, 0.7607843, 0, 1,
-1.092109, -1.392597, -2.698211, 1, 0.7686275, 0, 1,
-1.083576, -0.2103107, -2.950191, 1, 0.772549, 0, 1,
-1.079833, 1.348157, -2.182855, 1, 0.7803922, 0, 1,
-1.076789, -0.08411936, -1.554069, 1, 0.7843137, 0, 1,
-1.073714, 0.1261871, -1.802576, 1, 0.7921569, 0, 1,
-1.064066, 0.1595507, -1.60195, 1, 0.7960784, 0, 1,
-1.057285, -0.5576356, -1.358718, 1, 0.8039216, 0, 1,
-1.056826, 0.7296355, 0.3634288, 1, 0.8117647, 0, 1,
-1.056665, 0.8874786, -0.7701354, 1, 0.8156863, 0, 1,
-1.050564, 1.450012, -1.473416, 1, 0.8235294, 0, 1,
-1.049632, -0.1507177, -0.6152068, 1, 0.827451, 0, 1,
-1.045475, -0.1553838, -1.651002, 1, 0.8352941, 0, 1,
-1.044942, -1.207225, -1.557144, 1, 0.8392157, 0, 1,
-1.044183, 0.8135121, -1.357935, 1, 0.8470588, 0, 1,
-1.043084, -1.073714, -3.032707, 1, 0.8509804, 0, 1,
-1.036818, 1.585065, 0.7183029, 1, 0.8588235, 0, 1,
-1.033236, 0.4450149, -1.640979, 1, 0.8627451, 0, 1,
-1.030634, -1.438213, -1.56392, 1, 0.8705882, 0, 1,
-1.02656, -0.5482433, -3.124264, 1, 0.8745098, 0, 1,
-1.024207, 0.4732778, -1.525082, 1, 0.8823529, 0, 1,
-0.9983702, -0.6947011, -2.848565, 1, 0.8862745, 0, 1,
-0.9959487, 0.362489, -1.758535, 1, 0.8941177, 0, 1,
-0.9939962, -1.979411, -2.621262, 1, 0.8980392, 0, 1,
-0.9928377, 0.2982051, -0.9204785, 1, 0.9058824, 0, 1,
-0.9928092, -0.4879387, -1.5238, 1, 0.9137255, 0, 1,
-0.9848751, -0.2809204, -2.23983, 1, 0.9176471, 0, 1,
-0.9799542, 1.177326, -0.6853566, 1, 0.9254902, 0, 1,
-0.9676295, -0.06087535, -0.7022287, 1, 0.9294118, 0, 1,
-0.9659827, 0.2822983, -2.14825, 1, 0.9372549, 0, 1,
-0.9616315, -0.3738865, -1.302454, 1, 0.9411765, 0, 1,
-0.9588537, -0.6482757, -1.418195, 1, 0.9490196, 0, 1,
-0.9571145, 0.3326476, -1.341976, 1, 0.9529412, 0, 1,
-0.956718, -0.7161274, -2.787673, 1, 0.9607843, 0, 1,
-0.9519764, 2.248055, 1.523571, 1, 0.9647059, 0, 1,
-0.9460918, 0.3974625, -2.83358, 1, 0.972549, 0, 1,
-0.9331853, -1.232402, -2.535824, 1, 0.9764706, 0, 1,
-0.9327227, -1.15231, -2.171004, 1, 0.9843137, 0, 1,
-0.9300368, 1.288727, -1.532277, 1, 0.9882353, 0, 1,
-0.9291005, 1.233822, -0.6221841, 1, 0.9960784, 0, 1,
-0.9182484, -1.960024, -2.29542, 0.9960784, 1, 0, 1,
-0.9115828, -1.156486, -3.819855, 0.9921569, 1, 0, 1,
-0.9104176, -0.06106286, -2.28536, 0.9843137, 1, 0, 1,
-0.907461, 0.3032572, -1.850145, 0.9803922, 1, 0, 1,
-0.8970551, 0.9589736, -0.8429317, 0.972549, 1, 0, 1,
-0.8959579, -0.1706881, -1.377197, 0.9686275, 1, 0, 1,
-0.8945498, 1.188476, -0.2855133, 0.9607843, 1, 0, 1,
-0.880008, -0.7070135, 0.4920189, 0.9568627, 1, 0, 1,
-0.8792449, -0.004325686, -0.4339545, 0.9490196, 1, 0, 1,
-0.8789778, 1.0553, -0.9547834, 0.945098, 1, 0, 1,
-0.8773484, -1.075265, -2.8228, 0.9372549, 1, 0, 1,
-0.8745918, 1.373233, -1.525325, 0.9333333, 1, 0, 1,
-0.8670689, 0.2498242, -2.831705, 0.9254902, 1, 0, 1,
-0.8665909, 1.265566, -1.047645, 0.9215686, 1, 0, 1,
-0.8650296, 0.1833309, -1.319522, 0.9137255, 1, 0, 1,
-0.8638166, 0.3528039, -0.4334814, 0.9098039, 1, 0, 1,
-0.8618207, -1.457181, -4.002197, 0.9019608, 1, 0, 1,
-0.8617752, 0.31923, -0.4298468, 0.8941177, 1, 0, 1,
-0.8553128, -0.2330939, -2.732937, 0.8901961, 1, 0, 1,
-0.8484224, -0.3097198, -2.754456, 0.8823529, 1, 0, 1,
-0.846485, -0.3576369, -1.131666, 0.8784314, 1, 0, 1,
-0.8440786, 0.5022482, -0.9032971, 0.8705882, 1, 0, 1,
-0.8374294, -0.6278187, -1.833895, 0.8666667, 1, 0, 1,
-0.8360892, 0.9492339, -0.8266316, 0.8588235, 1, 0, 1,
-0.8351864, 1.112476, -1.125736, 0.854902, 1, 0, 1,
-0.8350781, -0.7129134, -3.857514, 0.8470588, 1, 0, 1,
-0.8343543, -0.1597376, -3.466899, 0.8431373, 1, 0, 1,
-0.8337286, -1.031475, -1.461286, 0.8352941, 1, 0, 1,
-0.8319419, 0.01104403, -2.214283, 0.8313726, 1, 0, 1,
-0.8307756, -0.1543132, -1.686942, 0.8235294, 1, 0, 1,
-0.8225821, 1.39933, 0.9893385, 0.8196079, 1, 0, 1,
-0.8207778, -0.2647748, -1.800749, 0.8117647, 1, 0, 1,
-0.8188081, -0.2847102, -0.8280579, 0.8078431, 1, 0, 1,
-0.8159299, -0.5601032, -1.695876, 0.8, 1, 0, 1,
-0.8105959, 0.2914615, -2.10156, 0.7921569, 1, 0, 1,
-0.8096306, -0.8566883, -3.033495, 0.7882353, 1, 0, 1,
-0.8052251, 0.1584427, -0.2083406, 0.7803922, 1, 0, 1,
-0.8042294, -0.7820842, -1.160801, 0.7764706, 1, 0, 1,
-0.7982236, 0.1693183, -4.041192, 0.7686275, 1, 0, 1,
-0.7982073, -0.04682707, -4.305844, 0.7647059, 1, 0, 1,
-0.795378, 0.950036, -0.3682297, 0.7568628, 1, 0, 1,
-0.7945095, -0.7713479, -0.112445, 0.7529412, 1, 0, 1,
-0.7855389, 0.522774, 0.2702424, 0.7450981, 1, 0, 1,
-0.780672, -0.4860078, -0.6957577, 0.7411765, 1, 0, 1,
-0.7790614, -0.02338648, -0.6782442, 0.7333333, 1, 0, 1,
-0.7787563, 1.376732, 1.146765, 0.7294118, 1, 0, 1,
-0.7673847, -0.4820991, -1.980597, 0.7215686, 1, 0, 1,
-0.7596198, -1.209617, -3.469615, 0.7176471, 1, 0, 1,
-0.754326, -0.2108947, -0.04610023, 0.7098039, 1, 0, 1,
-0.7535735, 0.803044, 0.6098559, 0.7058824, 1, 0, 1,
-0.752031, -2.146186, -2.613318, 0.6980392, 1, 0, 1,
-0.7477427, 0.8221791, -0.7427772, 0.6901961, 1, 0, 1,
-0.7422628, -1.76569, -3.011838, 0.6862745, 1, 0, 1,
-0.7333348, 0.1183045, -1.917459, 0.6784314, 1, 0, 1,
-0.7309781, 0.8529716, -1.052462, 0.6745098, 1, 0, 1,
-0.7276062, 1.505419, -1.493371, 0.6666667, 1, 0, 1,
-0.7267231, -1.206431, -3.471861, 0.6627451, 1, 0, 1,
-0.7209348, -0.9032145, -2.966025, 0.654902, 1, 0, 1,
-0.7201193, -1.027651, -3.107104, 0.6509804, 1, 0, 1,
-0.7178255, 0.5854607, -0.738777, 0.6431373, 1, 0, 1,
-0.713829, 0.281138, -0.5291338, 0.6392157, 1, 0, 1,
-0.7131817, -0.3612719, -1.997967, 0.6313726, 1, 0, 1,
-0.7130925, -0.8421235, -2.39662, 0.627451, 1, 0, 1,
-0.7118217, -1.164068, -2.496926, 0.6196079, 1, 0, 1,
-0.709659, -0.0480895, -1.474163, 0.6156863, 1, 0, 1,
-0.7086018, 0.7655898, -1.167789, 0.6078432, 1, 0, 1,
-0.7078874, -0.1985428, -0.9341108, 0.6039216, 1, 0, 1,
-0.7019661, -0.973432, -2.563774, 0.5960785, 1, 0, 1,
-0.6994784, 0.6948538, 1.158125, 0.5882353, 1, 0, 1,
-0.6981366, 1.921059, 0.2135902, 0.5843138, 1, 0, 1,
-0.6974946, 0.3208034, 0.2880102, 0.5764706, 1, 0, 1,
-0.6959252, -0.6201715, -2.323794, 0.572549, 1, 0, 1,
-0.6942133, -0.21825, -3.252886, 0.5647059, 1, 0, 1,
-0.6923402, -0.2056404, -1.77436, 0.5607843, 1, 0, 1,
-0.6880276, -0.5808897, -2.742887, 0.5529412, 1, 0, 1,
-0.6845325, -0.4258378, -1.147845, 0.5490196, 1, 0, 1,
-0.6843613, -1.351218, -2.281112, 0.5411765, 1, 0, 1,
-0.68304, -0.4396257, -3.026206, 0.5372549, 1, 0, 1,
-0.6827946, 0.3257402, -2.287203, 0.5294118, 1, 0, 1,
-0.6793995, 0.6382067, -1.71917, 0.5254902, 1, 0, 1,
-0.6716035, -0.3436478, -3.616328, 0.5176471, 1, 0, 1,
-0.670922, -0.4747903, -1.724132, 0.5137255, 1, 0, 1,
-0.6696366, -0.8360709, -2.161676, 0.5058824, 1, 0, 1,
-0.6652658, 0.5546145, -1.572083, 0.5019608, 1, 0, 1,
-0.6639526, 1.57049, 0.08586942, 0.4941176, 1, 0, 1,
-0.6594476, 0.110848, -2.352972, 0.4862745, 1, 0, 1,
-0.6494519, -1.690756, -2.386969, 0.4823529, 1, 0, 1,
-0.6491584, 0.5103639, -1.67753, 0.4745098, 1, 0, 1,
-0.646477, -0.7170461, -2.72835, 0.4705882, 1, 0, 1,
-0.6427621, -1.844967, -2.693122, 0.4627451, 1, 0, 1,
-0.6304261, -0.2234299, -0.679024, 0.4588235, 1, 0, 1,
-0.6204419, 1.085602, 0.8240833, 0.4509804, 1, 0, 1,
-0.6145892, -1.009375, -0.7976399, 0.4470588, 1, 0, 1,
-0.6094119, 2.169528, 0.03862546, 0.4392157, 1, 0, 1,
-0.6049166, -0.5973739, -2.544402, 0.4352941, 1, 0, 1,
-0.6047391, 0.1505589, -0.6647276, 0.427451, 1, 0, 1,
-0.602484, 1.639203, 1.781338, 0.4235294, 1, 0, 1,
-0.5996626, 0.08841278, -1.58394, 0.4156863, 1, 0, 1,
-0.5978534, -2.442543, -1.797783, 0.4117647, 1, 0, 1,
-0.5945529, 0.5737091, -2.278793, 0.4039216, 1, 0, 1,
-0.5922443, 0.9166786, 1.052533, 0.3960784, 1, 0, 1,
-0.5910864, -0.4446748, -2.609611, 0.3921569, 1, 0, 1,
-0.5875103, -0.948543, -4.420715, 0.3843137, 1, 0, 1,
-0.5842409, 0.05693464, -0.998637, 0.3803922, 1, 0, 1,
-0.5841501, -0.001393893, -1.34461, 0.372549, 1, 0, 1,
-0.583186, -0.2165793, -1.516663, 0.3686275, 1, 0, 1,
-0.583184, 0.2067365, -2.399065, 0.3607843, 1, 0, 1,
-0.5830826, -1.011251, -2.683775, 0.3568628, 1, 0, 1,
-0.58182, 0.07669269, -2.019972, 0.3490196, 1, 0, 1,
-0.5684373, -0.3446597, -1.835378, 0.345098, 1, 0, 1,
-0.5626017, -0.09495838, -2.739434, 0.3372549, 1, 0, 1,
-0.5596483, 0.1985086, -1.841277, 0.3333333, 1, 0, 1,
-0.5561407, 0.8197057, 1.415228, 0.3254902, 1, 0, 1,
-0.5530317, -0.1032606, -3.29366, 0.3215686, 1, 0, 1,
-0.5524884, 1.713877, -0.4722953, 0.3137255, 1, 0, 1,
-0.5496332, 0.9185771, -0.4634583, 0.3098039, 1, 0, 1,
-0.546587, 0.7809223, -1.031616, 0.3019608, 1, 0, 1,
-0.5462645, 1.035075, -1.056583, 0.2941177, 1, 0, 1,
-0.5448213, 1.102866, 0.7369238, 0.2901961, 1, 0, 1,
-0.5415992, -0.06046438, -1.00916, 0.282353, 1, 0, 1,
-0.5346779, 0.2922126, -1.129119, 0.2784314, 1, 0, 1,
-0.5333617, -0.9672787, -4.717614, 0.2705882, 1, 0, 1,
-0.5305659, 1.308268, -0.6567464, 0.2666667, 1, 0, 1,
-0.5304283, -0.5969665, -2.675979, 0.2588235, 1, 0, 1,
-0.5301146, 0.2838458, -1.375896, 0.254902, 1, 0, 1,
-0.5290158, -0.2005731, -0.4369549, 0.2470588, 1, 0, 1,
-0.5271056, -2.069502, -2.764549, 0.2431373, 1, 0, 1,
-0.5265452, -0.7543454, -3.219237, 0.2352941, 1, 0, 1,
-0.5178285, 0.2916172, -2.064484, 0.2313726, 1, 0, 1,
-0.4976716, 0.1812989, -1.660615, 0.2235294, 1, 0, 1,
-0.4958653, -1.315586, -2.717095, 0.2196078, 1, 0, 1,
-0.4898578, -0.2768653, -2.965291, 0.2117647, 1, 0, 1,
-0.4896468, 0.07829599, -1.041095, 0.2078431, 1, 0, 1,
-0.4895357, 1.68396, -0.1597341, 0.2, 1, 0, 1,
-0.4873614, -0.4327202, -2.904044, 0.1921569, 1, 0, 1,
-0.4831401, -1.800443, -1.882453, 0.1882353, 1, 0, 1,
-0.4797498, -0.7238544, -3.171302, 0.1803922, 1, 0, 1,
-0.4792047, 1.477499, -0.9632691, 0.1764706, 1, 0, 1,
-0.4792026, 1.590479, -1.234851, 0.1686275, 1, 0, 1,
-0.4771303, -0.2850031, -3.384798, 0.1647059, 1, 0, 1,
-0.4760989, 0.7232777, 0.2884106, 0.1568628, 1, 0, 1,
-0.4729879, 2.273441, -0.1054533, 0.1529412, 1, 0, 1,
-0.4729764, -0.795951, -1.465251, 0.145098, 1, 0, 1,
-0.4667903, 0.6503898, -0.7442912, 0.1411765, 1, 0, 1,
-0.4662987, -0.1744817, -2.739983, 0.1333333, 1, 0, 1,
-0.4661983, -0.1569385, -0.7482483, 0.1294118, 1, 0, 1,
-0.4655243, -0.1170034, -2.901881, 0.1215686, 1, 0, 1,
-0.4620003, 0.3096189, -1.045387, 0.1176471, 1, 0, 1,
-0.4597698, 0.7168294, -0.1783586, 0.1098039, 1, 0, 1,
-0.4537601, -1.370489, -3.428178, 0.1058824, 1, 0, 1,
-0.4533026, 1.514684, -0.444837, 0.09803922, 1, 0, 1,
-0.4527203, -0.6188805, -2.255751, 0.09019608, 1, 0, 1,
-0.4522709, 0.1243412, -1.679493, 0.08627451, 1, 0, 1,
-0.4504497, -0.1479911, -2.272653, 0.07843138, 1, 0, 1,
-0.4398969, 0.5521308, 0.1955253, 0.07450981, 1, 0, 1,
-0.4363011, 0.7308275, -1.092872, 0.06666667, 1, 0, 1,
-0.4340743, 0.5023443, -0.1887033, 0.0627451, 1, 0, 1,
-0.4287604, -0.447828, -2.256624, 0.05490196, 1, 0, 1,
-0.4273941, -0.2092257, -1.101325, 0.05098039, 1, 0, 1,
-0.4251815, -0.2898623, -2.290159, 0.04313726, 1, 0, 1,
-0.4246061, -0.9895899, -3.878056, 0.03921569, 1, 0, 1,
-0.424317, 0.6756842, 0.436785, 0.03137255, 1, 0, 1,
-0.4156222, -0.06360093, -0.690926, 0.02745098, 1, 0, 1,
-0.4138933, 0.8139018, 1.204261, 0.01960784, 1, 0, 1,
-0.409821, 0.6608317, -2.655527, 0.01568628, 1, 0, 1,
-0.4074092, -1.031788, -0.7444852, 0.007843138, 1, 0, 1,
-0.4064729, 0.2297142, 0.1454848, 0.003921569, 1, 0, 1,
-0.4012421, -1.847033, -1.901117, 0, 1, 0.003921569, 1,
-0.3978975, 1.398097, -0.1180538, 0, 1, 0.01176471, 1,
-0.3899631, 0.5587792, -2.037132, 0, 1, 0.01568628, 1,
-0.3855845, -0.03405681, -0.652491, 0, 1, 0.02352941, 1,
-0.3849733, -1.982954, -2.529427, 0, 1, 0.02745098, 1,
-0.3848146, 1.283801, -1.020607, 0, 1, 0.03529412, 1,
-0.3840966, -0.7700934, -2.103848, 0, 1, 0.03921569, 1,
-0.3810653, -1.265569, -1.978885, 0, 1, 0.04705882, 1,
-0.3801771, -0.720206, -0.8663536, 0, 1, 0.05098039, 1,
-0.3793659, 0.9100893, -0.3695619, 0, 1, 0.05882353, 1,
-0.3775642, 1.172086, 0.6114649, 0, 1, 0.0627451, 1,
-0.3770829, 0.1554003, -2.506252, 0, 1, 0.07058824, 1,
-0.3770437, 0.6580145, 0.4566455, 0, 1, 0.07450981, 1,
-0.3754569, -0.6736469, -2.576438, 0, 1, 0.08235294, 1,
-0.3744009, -0.2474401, -0.09290627, 0, 1, 0.08627451, 1,
-0.3730424, 1.989749, -1.347743, 0, 1, 0.09411765, 1,
-0.3713475, 1.328281, 0.1780562, 0, 1, 0.1019608, 1,
-0.3709218, 1.212051, -0.6349981, 0, 1, 0.1058824, 1,
-0.3708067, 0.1710415, -0.7928656, 0, 1, 0.1137255, 1,
-0.3655111, -0.4059775, -2.130957, 0, 1, 0.1176471, 1,
-0.3649857, -0.04536188, -2.058879, 0, 1, 0.1254902, 1,
-0.3633282, 0.6218974, -0.9016863, 0, 1, 0.1294118, 1,
-0.3596775, 0.5209351, -0.8356994, 0, 1, 0.1372549, 1,
-0.3558825, -0.1634681, -1.607857, 0, 1, 0.1411765, 1,
-0.3558361, 0.04018838, -2.221452, 0, 1, 0.1490196, 1,
-0.354475, 0.7113679, -0.9452488, 0, 1, 0.1529412, 1,
-0.3534718, 1.08119, 1.312298, 0, 1, 0.1607843, 1,
-0.3533368, 0.7592202, -2.522567, 0, 1, 0.1647059, 1,
-0.3521839, 0.9522686, -0.5133377, 0, 1, 0.172549, 1,
-0.349052, 0.6886705, 0.1689838, 0, 1, 0.1764706, 1,
-0.345496, 1.09918, 0.5995814, 0, 1, 0.1843137, 1,
-0.3424126, 0.5174052, 0.2077582, 0, 1, 0.1882353, 1,
-0.3376188, -1.809208, -1.743413, 0, 1, 0.1960784, 1,
-0.3356171, -0.6995323, -1.271981, 0, 1, 0.2039216, 1,
-0.3296137, 0.117339, -0.8336053, 0, 1, 0.2078431, 1,
-0.3246107, 0.5911376, 0.04306761, 0, 1, 0.2156863, 1,
-0.3217471, 0.3649577, -0.939658, 0, 1, 0.2196078, 1,
-0.3210489, -0.0336219, -3.14124, 0, 1, 0.227451, 1,
-0.3134186, 0.7242387, -0.8024309, 0, 1, 0.2313726, 1,
-0.3128515, 0.2461499, -1.431035, 0, 1, 0.2392157, 1,
-0.310777, -1.553912, -2.267784, 0, 1, 0.2431373, 1,
-0.3106837, -1.295166, -2.997428, 0, 1, 0.2509804, 1,
-0.3042173, 0.8622414, -2.095252, 0, 1, 0.254902, 1,
-0.3038971, -0.2206614, -1.910879, 0, 1, 0.2627451, 1,
-0.3010335, 0.06542238, -0.3217657, 0, 1, 0.2666667, 1,
-0.2993087, 0.2408649, -2.343384, 0, 1, 0.2745098, 1,
-0.2989496, 0.7389325, -1.193321, 0, 1, 0.2784314, 1,
-0.2980378, -0.0485178, -0.9478902, 0, 1, 0.2862745, 1,
-0.2954483, -1.114789, -3.417376, 0, 1, 0.2901961, 1,
-0.2939062, -0.4824557, -2.506045, 0, 1, 0.2980392, 1,
-0.2891624, -0.4549868, -2.298517, 0, 1, 0.3058824, 1,
-0.2841184, 0.4788819, -1.186012, 0, 1, 0.3098039, 1,
-0.2831475, -0.3112184, -2.031644, 0, 1, 0.3176471, 1,
-0.2827288, 1.121387, -0.8346295, 0, 1, 0.3215686, 1,
-0.282322, 0.90933, -2.22881, 0, 1, 0.3294118, 1,
-0.2795993, -0.5586385, -2.496864, 0, 1, 0.3333333, 1,
-0.2752361, -0.2452164, -2.430362, 0, 1, 0.3411765, 1,
-0.2741224, 1.31589, -0.06134972, 0, 1, 0.345098, 1,
-0.2709599, 1.135592, 0.281004, 0, 1, 0.3529412, 1,
-0.2703853, 0.503225, -0.4640275, 0, 1, 0.3568628, 1,
-0.2675032, 1.313205, -0.3633336, 0, 1, 0.3647059, 1,
-0.2649451, -0.5886804, -1.000713, 0, 1, 0.3686275, 1,
-0.2630127, -1.30575, -2.398843, 0, 1, 0.3764706, 1,
-0.2578492, -0.9239236, -3.446285, 0, 1, 0.3803922, 1,
-0.25016, 0.1990949, -0.06932165, 0, 1, 0.3882353, 1,
-0.2483742, -0.6324364, -2.93723, 0, 1, 0.3921569, 1,
-0.2476925, 2.186357, -0.3926627, 0, 1, 0.4, 1,
-0.247138, 0.09507295, 0.01329129, 0, 1, 0.4078431, 1,
-0.244288, 2.634117, 0.03297006, 0, 1, 0.4117647, 1,
-0.242562, -0.248736, -0.8922626, 0, 1, 0.4196078, 1,
-0.2402336, 0.8246036, 0.1987536, 0, 1, 0.4235294, 1,
-0.238836, -0.3040504, -2.306457, 0, 1, 0.4313726, 1,
-0.2357452, 1.561204, 0.9401444, 0, 1, 0.4352941, 1,
-0.2333716, 2.641927, 0.3716813, 0, 1, 0.4431373, 1,
-0.2328951, 1.129153, -1.605528, 0, 1, 0.4470588, 1,
-0.2295431, -0.3175412, -1.86757, 0, 1, 0.454902, 1,
-0.226404, -0.3001706, -3.907238, 0, 1, 0.4588235, 1,
-0.2235538, 0.9818698, 0.612049, 0, 1, 0.4666667, 1,
-0.2198367, -0.09503386, -2.29688, 0, 1, 0.4705882, 1,
-0.2152514, -1.267273, -5.132589, 0, 1, 0.4784314, 1,
-0.2149313, 0.08011054, -2.29491, 0, 1, 0.4823529, 1,
-0.2106122, 0.2424012, -0.6140402, 0, 1, 0.4901961, 1,
-0.208755, 0.5013106, -0.1336951, 0, 1, 0.4941176, 1,
-0.2085119, 1.951855, -0.1172018, 0, 1, 0.5019608, 1,
-0.202694, 0.644496, -0.6723696, 0, 1, 0.509804, 1,
-0.1997661, 0.1462474, -3.293903, 0, 1, 0.5137255, 1,
-0.1975355, -1.216437, -2.51331, 0, 1, 0.5215687, 1,
-0.1944539, 1.575291, -0.7673888, 0, 1, 0.5254902, 1,
-0.1933993, -1.640952, -3.029398, 0, 1, 0.5333334, 1,
-0.192445, 0.4505889, 0.2142206, 0, 1, 0.5372549, 1,
-0.1869738, -0.919511, -2.278154, 0, 1, 0.5450981, 1,
-0.1834837, -0.5220546, -4.62318, 0, 1, 0.5490196, 1,
-0.1793096, -1.762669, -5.007103, 0, 1, 0.5568628, 1,
-0.175926, -0.8997119, -1.157132, 0, 1, 0.5607843, 1,
-0.1744491, 1.182405, -0.4437591, 0, 1, 0.5686275, 1,
-0.1695224, 1.468603, 1.676131, 0, 1, 0.572549, 1,
-0.167958, -0.2219756, -3.458331, 0, 1, 0.5803922, 1,
-0.1663207, 1.077064, -2.255715, 0, 1, 0.5843138, 1,
-0.1663147, -1.354516, -3.043494, 0, 1, 0.5921569, 1,
-0.1649048, -1.681898, -1.638421, 0, 1, 0.5960785, 1,
-0.1646543, 0.1020695, -1.319102, 0, 1, 0.6039216, 1,
-0.1627618, -1.88024, -2.190664, 0, 1, 0.6117647, 1,
-0.1617156, -2.849651, -3.736181, 0, 1, 0.6156863, 1,
-0.1612314, -0.2913061, -4.545493, 0, 1, 0.6235294, 1,
-0.1599955, -0.1248901, -1.543652, 0, 1, 0.627451, 1,
-0.1566609, -0.9528313, -1.672564, 0, 1, 0.6352941, 1,
-0.1547556, -0.7000173, -2.406818, 0, 1, 0.6392157, 1,
-0.1523228, 1.455589, 0.8808287, 0, 1, 0.6470588, 1,
-0.1504736, 0.3721704, 0.9279785, 0, 1, 0.6509804, 1,
-0.1490819, -0.9824923, -3.143368, 0, 1, 0.6588235, 1,
-0.1487821, 0.1107511, 1.466014, 0, 1, 0.6627451, 1,
-0.1483172, -0.09136599, -2.655272, 0, 1, 0.6705883, 1,
-0.1411513, 2.424834, 0.2298049, 0, 1, 0.6745098, 1,
-0.1315618, 0.1233284, -2.961757, 0, 1, 0.682353, 1,
-0.1311221, -0.1122371, -3.855015, 0, 1, 0.6862745, 1,
-0.1308534, 1.541766, 2.080211, 0, 1, 0.6941177, 1,
-0.1282097, 0.3177817, -0.5819078, 0, 1, 0.7019608, 1,
-0.1278722, -0.6830921, -2.429777, 0, 1, 0.7058824, 1,
-0.1213304, 0.9945012, -0.02478447, 0, 1, 0.7137255, 1,
-0.1166766, -1.192512, -3.693562, 0, 1, 0.7176471, 1,
-0.114109, -1.10169, -2.722862, 0, 1, 0.7254902, 1,
-0.1130972, 0.6190826, 0.08523256, 0, 1, 0.7294118, 1,
-0.1087598, -0.5213506, -2.859505, 0, 1, 0.7372549, 1,
-0.1086359, 0.6865463, -1.098113, 0, 1, 0.7411765, 1,
-0.1074726, 1.566038, -0.4296974, 0, 1, 0.7490196, 1,
-0.105503, 0.5495028, -0.5374864, 0, 1, 0.7529412, 1,
-0.1053612, -2.05973, -2.955508, 0, 1, 0.7607843, 1,
-0.1038302, -0.3640755, -0.8637673, 0, 1, 0.7647059, 1,
-0.10066, -1.355566, -2.570805, 0, 1, 0.772549, 1,
-0.09542251, -0.5066555, -2.951353, 0, 1, 0.7764706, 1,
-0.09431238, 1.031859, 1.39236, 0, 1, 0.7843137, 1,
-0.0942935, -2.634553e-05, -0.04477029, 0, 1, 0.7882353, 1,
-0.08975212, -0.2756691, -3.819343, 0, 1, 0.7960784, 1,
-0.08666035, 1.920089, -1.353652, 0, 1, 0.8039216, 1,
-0.07909498, -0.5731245, -4.007155, 0, 1, 0.8078431, 1,
-0.07742067, 0.04688119, 0.7565759, 0, 1, 0.8156863, 1,
-0.07683576, 1.380885, 0.2296171, 0, 1, 0.8196079, 1,
-0.07495294, 0.4699866, 0.2478173, 0, 1, 0.827451, 1,
-0.07271416, -0.5798466, -2.935299, 0, 1, 0.8313726, 1,
-0.06957707, 0.1549744, -1.175884, 0, 1, 0.8392157, 1,
-0.06843443, 2.235979, -0.8507164, 0, 1, 0.8431373, 1,
-0.06610761, -1.004941, -2.305259, 0, 1, 0.8509804, 1,
-0.06495988, 0.6770945, -0.8871507, 0, 1, 0.854902, 1,
-0.05345092, -1.094077, -3.562039, 0, 1, 0.8627451, 1,
-0.04838539, 0.8749151, -1.090221, 0, 1, 0.8666667, 1,
-0.04315003, 1.428904, -1.941417, 0, 1, 0.8745098, 1,
-0.0427946, 0.3709519, 0.3471331, 0, 1, 0.8784314, 1,
-0.04245466, 0.7781155, 0.4799256, 0, 1, 0.8862745, 1,
-0.04018891, 0.2232571, 0.3543953, 0, 1, 0.8901961, 1,
-0.03665455, -2.014064, -2.500114, 0, 1, 0.8980392, 1,
-0.03354954, -1.02236, -3.909828, 0, 1, 0.9058824, 1,
-0.03315906, -0.1976972, -1.952668, 0, 1, 0.9098039, 1,
-0.03058885, 0.7324649, 0.1431063, 0, 1, 0.9176471, 1,
-0.02752028, -0.0117848, -1.822775, 0, 1, 0.9215686, 1,
-0.02022266, 1.008664, 1.241891, 0, 1, 0.9294118, 1,
-0.0199229, -0.02923116, -2.208595, 0, 1, 0.9333333, 1,
-0.0158234, 0.06030483, 0.7832303, 0, 1, 0.9411765, 1,
-0.01510086, -1.586755, -3.881251, 0, 1, 0.945098, 1,
-0.01367111, 1.053076, 1.165008, 0, 1, 0.9529412, 1,
-0.01120701, -0.7486338, -3.154255, 0, 1, 0.9568627, 1,
-0.009133391, 0.003935165, -0.4973379, 0, 1, 0.9647059, 1,
-0.0090367, 0.3655266, -1.047614, 0, 1, 0.9686275, 1,
0.0008714009, 0.8644342, -0.1706646, 0, 1, 0.9764706, 1,
0.003476165, 1.684352, -1.489283, 0, 1, 0.9803922, 1,
0.008151621, -2.709083, 0.9529139, 0, 1, 0.9882353, 1,
0.01233046, 0.318194, -0.9457462, 0, 1, 0.9921569, 1,
0.01760772, -0.7024587, 2.952178, 0, 1, 1, 1,
0.01773722, 0.3879853, 0.827404, 0, 0.9921569, 1, 1,
0.01953868, 1.514481, 0.317016, 0, 0.9882353, 1, 1,
0.02078826, 0.5911919, 0.5823532, 0, 0.9803922, 1, 1,
0.02135832, 0.4852646, -0.08434186, 0, 0.9764706, 1, 1,
0.02281697, 1.473926, -1.644403, 0, 0.9686275, 1, 1,
0.02585125, 0.8512835, 0.2222777, 0, 0.9647059, 1, 1,
0.02792682, 0.9435479, -1.04834, 0, 0.9568627, 1, 1,
0.03115234, 1.466624, 1.376474, 0, 0.9529412, 1, 1,
0.03285474, -0.5290227, 1.365249, 0, 0.945098, 1, 1,
0.03526568, 1.416917, -0.2507281, 0, 0.9411765, 1, 1,
0.03550994, 0.6774698, 1.993774, 0, 0.9333333, 1, 1,
0.03730617, 0.1523021, 0.2242098, 0, 0.9294118, 1, 1,
0.04043113, -0.3632595, 3.717737, 0, 0.9215686, 1, 1,
0.04165431, 0.1538947, 0.7012941, 0, 0.9176471, 1, 1,
0.05212794, 0.4926922, -1.599222, 0, 0.9098039, 1, 1,
0.05301451, -1.047579, 2.091227, 0, 0.9058824, 1, 1,
0.05477823, -0.06756987, 1.705711, 0, 0.8980392, 1, 1,
0.05539639, 2.568331, -0.4328426, 0, 0.8901961, 1, 1,
0.05622024, 0.6978342, -0.4169472, 0, 0.8862745, 1, 1,
0.05913418, -0.8733559, 2.876922, 0, 0.8784314, 1, 1,
0.06398263, 0.133306, 0.6656014, 0, 0.8745098, 1, 1,
0.06860885, 0.7528799, -0.02954891, 0, 0.8666667, 1, 1,
0.06890124, -0.1534726, 4.144782, 0, 0.8627451, 1, 1,
0.0716485, -0.116607, 2.896262, 0, 0.854902, 1, 1,
0.07205277, -0.6364995, 2.645218, 0, 0.8509804, 1, 1,
0.0746116, -0.06879052, 2.203589, 0, 0.8431373, 1, 1,
0.07528589, 1.837652, 0.07324945, 0, 0.8392157, 1, 1,
0.07954703, 0.2841005, 0.173833, 0, 0.8313726, 1, 1,
0.08391966, -1.791552, 5.140182, 0, 0.827451, 1, 1,
0.08498561, 0.3412364, -1.965428, 0, 0.8196079, 1, 1,
0.08573547, -1.445192, 3.233722, 0, 0.8156863, 1, 1,
0.08977715, 1.712012, 0.4146233, 0, 0.8078431, 1, 1,
0.09128558, 0.2079631, 0.8589928, 0, 0.8039216, 1, 1,
0.09203468, -0.7166199, 5.735027, 0, 0.7960784, 1, 1,
0.09762187, 0.8570636, 0.52889, 0, 0.7882353, 1, 1,
0.1022295, 0.3455161, 0.2321602, 0, 0.7843137, 1, 1,
0.1028253, -0.2175181, 3.657796, 0, 0.7764706, 1, 1,
0.1030003, -0.6104326, 2.226443, 0, 0.772549, 1, 1,
0.1078812, 0.2018048, -0.4975411, 0, 0.7647059, 1, 1,
0.110285, -0.2111762, 2.791587, 0, 0.7607843, 1, 1,
0.1121721, -0.7227886, 2.256134, 0, 0.7529412, 1, 1,
0.1201189, -1.169772, 2.212878, 0, 0.7490196, 1, 1,
0.1203459, -1.032276, 2.408094, 0, 0.7411765, 1, 1,
0.1212183, -1.21167, 1.37607, 0, 0.7372549, 1, 1,
0.1217665, 0.8257065, 0.4744396, 0, 0.7294118, 1, 1,
0.1235131, -0.8160344, 2.497145, 0, 0.7254902, 1, 1,
0.1238968, -0.3120257, 3.727281, 0, 0.7176471, 1, 1,
0.1255507, -0.4829957, 3.21214, 0, 0.7137255, 1, 1,
0.1265607, 0.7406212, -1.286915, 0, 0.7058824, 1, 1,
0.1343295, 0.4048524, 0.3905209, 0, 0.6980392, 1, 1,
0.1351655, -0.1889384, 3.2156, 0, 0.6941177, 1, 1,
0.1381518, -1.345932, 2.328305, 0, 0.6862745, 1, 1,
0.1387116, 1.49853, 1.360836, 0, 0.682353, 1, 1,
0.1404698, 0.9116631, 1.665202, 0, 0.6745098, 1, 1,
0.148234, 1.979185, -0.843954, 0, 0.6705883, 1, 1,
0.1502173, -1.820505, 3.768239, 0, 0.6627451, 1, 1,
0.1538322, -1.349516, 3.464695, 0, 0.6588235, 1, 1,
0.154643, -0.01109482, 1.182901, 0, 0.6509804, 1, 1,
0.156171, -0.2756284, 2.817945, 0, 0.6470588, 1, 1,
0.1568976, 0.6075352, 1.002676, 0, 0.6392157, 1, 1,
0.157972, 0.1165936, 2.270361, 0, 0.6352941, 1, 1,
0.1630245, 0.2913101, 1.672849, 0, 0.627451, 1, 1,
0.1642075, 2.081542, 1.713776, 0, 0.6235294, 1, 1,
0.1643496, 0.7577747, 0.09558096, 0, 0.6156863, 1, 1,
0.1655682, -0.5029803, 0.7317389, 0, 0.6117647, 1, 1,
0.1773495, 0.9379378, 0.1835077, 0, 0.6039216, 1, 1,
0.1777734, -0.07883721, 1.787416, 0, 0.5960785, 1, 1,
0.1779196, -0.1082384, 1.163469, 0, 0.5921569, 1, 1,
0.1819136, -0.1221078, 1.808696, 0, 0.5843138, 1, 1,
0.199289, -1.2411, 3.442027, 0, 0.5803922, 1, 1,
0.1998992, 0.05695182, 0.2694919, 0, 0.572549, 1, 1,
0.2007417, 0.0434909, 0.2710163, 0, 0.5686275, 1, 1,
0.2101795, 1.20945, -0.04441598, 0, 0.5607843, 1, 1,
0.2166294, 0.3022511, -0.1187826, 0, 0.5568628, 1, 1,
0.2185586, 1.071751, 0.7483377, 0, 0.5490196, 1, 1,
0.2197767, 0.7944837, 0.2279455, 0, 0.5450981, 1, 1,
0.2220218, -0.2607141, 2.390931, 0, 0.5372549, 1, 1,
0.225104, 0.1093985, 2.105561, 0, 0.5333334, 1, 1,
0.2261353, -1.235543, 0.6616193, 0, 0.5254902, 1, 1,
0.2284443, -0.06145378, 2.086904, 0, 0.5215687, 1, 1,
0.231219, 1.257568, -1.830973, 0, 0.5137255, 1, 1,
0.234485, -0.2553152, 3.662212, 0, 0.509804, 1, 1,
0.2354364, 0.5037207, 0.8381999, 0, 0.5019608, 1, 1,
0.2368568, -0.7113791, 2.860639, 0, 0.4941176, 1, 1,
0.2488538, 1.371979, 0.6340028, 0, 0.4901961, 1, 1,
0.2502266, -0.1890717, 3.48008, 0, 0.4823529, 1, 1,
0.2514045, -0.2108212, 3.603225, 0, 0.4784314, 1, 1,
0.2548394, -0.5097589, 3.700404, 0, 0.4705882, 1, 1,
0.2563289, 1.599479, 0.9815168, 0, 0.4666667, 1, 1,
0.259596, 0.3444799, 1.109627, 0, 0.4588235, 1, 1,
0.2603827, -0.0258088, 1.859697, 0, 0.454902, 1, 1,
0.2607284, -0.007195559, 1.773391, 0, 0.4470588, 1, 1,
0.2607758, -0.6867799, 3.065899, 0, 0.4431373, 1, 1,
0.2619967, 0.2069427, 0.02172815, 0, 0.4352941, 1, 1,
0.2651182, -0.02964046, -0.5857913, 0, 0.4313726, 1, 1,
0.2662833, 0.4950341, 1.678589, 0, 0.4235294, 1, 1,
0.2678279, -0.6404362, 5.308489, 0, 0.4196078, 1, 1,
0.2711725, 1.935213, -0.4293157, 0, 0.4117647, 1, 1,
0.2714169, 1.20688, 0.3591135, 0, 0.4078431, 1, 1,
0.2733057, 0.9992621, 0.141174, 0, 0.4, 1, 1,
0.2750483, 0.6753768, 1.85028, 0, 0.3921569, 1, 1,
0.2761129, -1.400424, 3.067485, 0, 0.3882353, 1, 1,
0.2778404, -0.01711041, -0.1409143, 0, 0.3803922, 1, 1,
0.2804025, 0.4010215, 1.366921, 0, 0.3764706, 1, 1,
0.2804406, -1.611125, 2.835964, 0, 0.3686275, 1, 1,
0.2818678, 1.349614, 0.2180265, 0, 0.3647059, 1, 1,
0.2838308, -0.4603109, 1.769836, 0, 0.3568628, 1, 1,
0.2872351, -0.1451256, 1.365804, 0, 0.3529412, 1, 1,
0.2885159, -0.8068752, 3.322665, 0, 0.345098, 1, 1,
0.2913473, 0.8494969, -1.506637, 0, 0.3411765, 1, 1,
0.2953398, -0.4885257, 2.405371, 0, 0.3333333, 1, 1,
0.2979654, -0.4994828, 1.465871, 0, 0.3294118, 1, 1,
0.2998689, -0.7638312, 3.221589, 0, 0.3215686, 1, 1,
0.3039576, 0.8871571, 1.434572, 0, 0.3176471, 1, 1,
0.3053892, 0.3020261, 1.252877, 0, 0.3098039, 1, 1,
0.3089797, -1.109008, 3.066742, 0, 0.3058824, 1, 1,
0.3139535, -1.02509, 3.957551, 0, 0.2980392, 1, 1,
0.3147403, -0.8909599, 1.749062, 0, 0.2901961, 1, 1,
0.3163189, 1.184409, -0.7829993, 0, 0.2862745, 1, 1,
0.3184594, 1.006656, 0.6013819, 0, 0.2784314, 1, 1,
0.3195614, 0.08066581, 1.376335, 0, 0.2745098, 1, 1,
0.3198134, 0.2755199, 2.19345, 0, 0.2666667, 1, 1,
0.3234543, -0.6786709, 1.185713, 0, 0.2627451, 1, 1,
0.3306645, 0.4197846, 0.8224857, 0, 0.254902, 1, 1,
0.330892, -0.2128872, 2.111334, 0, 0.2509804, 1, 1,
0.3339299, 1.842395, 0.3030728, 0, 0.2431373, 1, 1,
0.3341714, 0.06076088, 1.623082, 0, 0.2392157, 1, 1,
0.3396024, -1.09463, 3.72891, 0, 0.2313726, 1, 1,
0.3450073, 0.4250054, 2.183652, 0, 0.227451, 1, 1,
0.3454209, 0.9306645, -0.458772, 0, 0.2196078, 1, 1,
0.3512778, 0.9623481, -0.2985659, 0, 0.2156863, 1, 1,
0.3516031, 1.517181, -0.7725193, 0, 0.2078431, 1, 1,
0.3517761, 0.4546988, 2.926079, 0, 0.2039216, 1, 1,
0.3524136, 1.32, -0.3754991, 0, 0.1960784, 1, 1,
0.3544034, -0.6103917, 1.067796, 0, 0.1882353, 1, 1,
0.3553458, 0.7606668, 2.03105, 0, 0.1843137, 1, 1,
0.3563151, -0.3607274, 1.763101, 0, 0.1764706, 1, 1,
0.3568013, -0.5419776, 1.044132, 0, 0.172549, 1, 1,
0.3573489, 1.11916, -0.7761408, 0, 0.1647059, 1, 1,
0.3708278, -1.038467, 2.331066, 0, 0.1607843, 1, 1,
0.3738088, -1.44125, 2.103357, 0, 0.1529412, 1, 1,
0.3754497, -1.880849, 2.18295, 0, 0.1490196, 1, 1,
0.3766298, -0.2604555, 1.667792, 0, 0.1411765, 1, 1,
0.381742, -0.8054406, 4.075842, 0, 0.1372549, 1, 1,
0.4022222, -0.998809, 3.001111, 0, 0.1294118, 1, 1,
0.4133641, 0.04121991, 2.935089, 0, 0.1254902, 1, 1,
0.4146983, 0.774778, -0.2380442, 0, 0.1176471, 1, 1,
0.4160422, 0.6151664, -1.271226, 0, 0.1137255, 1, 1,
0.4168861, -0.3822052, 1.897569, 0, 0.1058824, 1, 1,
0.4170956, -0.3873828, 2.757246, 0, 0.09803922, 1, 1,
0.4175948, -0.6981922, 3.3824, 0, 0.09411765, 1, 1,
0.4242499, -1.559592, 2.853672, 0, 0.08627451, 1, 1,
0.4248674, 0.9391268, -0.5443088, 0, 0.08235294, 1, 1,
0.4272568, 1.273163, 0.2327292, 0, 0.07450981, 1, 1,
0.4294938, 0.1806956, 1.620965, 0, 0.07058824, 1, 1,
0.4315818, -0.5176076, 1.052948, 0, 0.0627451, 1, 1,
0.4320363, -0.7856998, 2.166467, 0, 0.05882353, 1, 1,
0.4322065, 0.3586648, -0.8389215, 0, 0.05098039, 1, 1,
0.4381855, 0.8197837, 1.516085, 0, 0.04705882, 1, 1,
0.4460638, 0.1829957, 2.05837, 0, 0.03921569, 1, 1,
0.4471338, -0.7302657, 3.502491, 0, 0.03529412, 1, 1,
0.4488244, -0.4970148, 1.269021, 0, 0.02745098, 1, 1,
0.4506338, -1.035564, 2.402086, 0, 0.02352941, 1, 1,
0.4507327, 0.7510663, -1.236448, 0, 0.01568628, 1, 1,
0.4534016, -0.8412988, 2.146058, 0, 0.01176471, 1, 1,
0.4571773, 0.9458341, 0.3526167, 0, 0.003921569, 1, 1,
0.4618135, -2.488428, 2.151437, 0.003921569, 0, 1, 1,
0.4674678, 0.5628636, 1.57069, 0.007843138, 0, 1, 1,
0.4698784, -0.674991, 3.650493, 0.01568628, 0, 1, 1,
0.471292, -0.8470247, 2.608961, 0.01960784, 0, 1, 1,
0.4714184, 0.1492502, 1.12105, 0.02745098, 0, 1, 1,
0.4760399, -0.9494176, 1.540389, 0.03137255, 0, 1, 1,
0.4781148, -0.3333423, 4.428432, 0.03921569, 0, 1, 1,
0.4822128, -0.9001542, 1.734426, 0.04313726, 0, 1, 1,
0.4840198, 1.331527, 2.275441, 0.05098039, 0, 1, 1,
0.4849359, 0.950808, -0.04420006, 0.05490196, 0, 1, 1,
0.4878077, -0.2052779, 1.153295, 0.0627451, 0, 1, 1,
0.4911696, 0.4460695, 0.3339579, 0.06666667, 0, 1, 1,
0.4936217, -0.5103486, 3.800824, 0.07450981, 0, 1, 1,
0.494077, 0.2795138, 2.079772, 0.07843138, 0, 1, 1,
0.4992056, -0.5039176, 2.427968, 0.08627451, 0, 1, 1,
0.5026987, 0.4677815, 0.232479, 0.09019608, 0, 1, 1,
0.5029176, 0.2256582, 0.7227376, 0.09803922, 0, 1, 1,
0.5070902, 0.03006676, 2.126267, 0.1058824, 0, 1, 1,
0.5088416, -1.901811, 3.403407, 0.1098039, 0, 1, 1,
0.5089633, -0.002823829, 1.44217, 0.1176471, 0, 1, 1,
0.5094912, 0.3818748, 1.793043, 0.1215686, 0, 1, 1,
0.5202916, 0.7064357, 1.542498, 0.1294118, 0, 1, 1,
0.5239526, 1.001885, 0.9551207, 0.1333333, 0, 1, 1,
0.5243883, 1.142822, 1.158201, 0.1411765, 0, 1, 1,
0.524474, -2.709952, 3.819387, 0.145098, 0, 1, 1,
0.5295582, -0.1627989, 3.091787, 0.1529412, 0, 1, 1,
0.5299954, -0.682816, 0.8441694, 0.1568628, 0, 1, 1,
0.533051, -0.7485151, 2.545604, 0.1647059, 0, 1, 1,
0.5357931, -0.3530792, 1.339245, 0.1686275, 0, 1, 1,
0.5358801, -0.02064739, 2.885243, 0.1764706, 0, 1, 1,
0.5436144, 0.774022, 2.3288, 0.1803922, 0, 1, 1,
0.5452417, 0.4879568, 2.127999, 0.1882353, 0, 1, 1,
0.5456194, 0.2908297, 1.727827, 0.1921569, 0, 1, 1,
0.5458882, -0.08862527, 0.8999225, 0.2, 0, 1, 1,
0.5467665, 0.05596493, 2.0905, 0.2078431, 0, 1, 1,
0.5484493, -1.731087, 3.705271, 0.2117647, 0, 1, 1,
0.5503656, -0.194419, 2.142731, 0.2196078, 0, 1, 1,
0.5604105, -1.500013, 3.871133, 0.2235294, 0, 1, 1,
0.5723783, -0.4576854, 0.1536111, 0.2313726, 0, 1, 1,
0.57811, 1.236449, 0.5283673, 0.2352941, 0, 1, 1,
0.5796506, -0.2697086, 1.810043, 0.2431373, 0, 1, 1,
0.5809569, -0.7946064, 2.656516, 0.2470588, 0, 1, 1,
0.5839362, -0.7657986, 1.309837, 0.254902, 0, 1, 1,
0.5867435, -1.223774, 3.781726, 0.2588235, 0, 1, 1,
0.5890974, 0.2942811, 2.078555, 0.2666667, 0, 1, 1,
0.592334, -1.362208, 2.855077, 0.2705882, 0, 1, 1,
0.5935468, -0.4703643, 2.094777, 0.2784314, 0, 1, 1,
0.5953484, -0.1305292, 3.056734, 0.282353, 0, 1, 1,
0.5991648, -0.5654055, 2.532748, 0.2901961, 0, 1, 1,
0.6028389, 0.8950341, 0.7798783, 0.2941177, 0, 1, 1,
0.6072845, -0.8077146, 2.955071, 0.3019608, 0, 1, 1,
0.6106228, -0.893673, 2.609852, 0.3098039, 0, 1, 1,
0.6134619, -0.3704133, 3.098846, 0.3137255, 0, 1, 1,
0.6143411, -0.3314407, 2.028262, 0.3215686, 0, 1, 1,
0.6153871, -1.708117, 3.463806, 0.3254902, 0, 1, 1,
0.6188281, 1.075396, 2.018196, 0.3333333, 0, 1, 1,
0.6191244, 0.6506893, 0.4394341, 0.3372549, 0, 1, 1,
0.6256959, -2.540559, 4.116955, 0.345098, 0, 1, 1,
0.6282073, -0.9246677, 2.939969, 0.3490196, 0, 1, 1,
0.6299589, 0.3028644, 0.8151484, 0.3568628, 0, 1, 1,
0.6347181, 0.7446317, -0.1921414, 0.3607843, 0, 1, 1,
0.6360822, 1.492853, 1.458269, 0.3686275, 0, 1, 1,
0.6372001, 0.4263993, -0.06637142, 0.372549, 0, 1, 1,
0.6393894, 1.429753, 0.06357348, 0.3803922, 0, 1, 1,
0.6440603, 0.1824361, 2.078748, 0.3843137, 0, 1, 1,
0.6480189, -0.4620804, 2.767068, 0.3921569, 0, 1, 1,
0.6503512, -0.5545714, 1.700902, 0.3960784, 0, 1, 1,
0.6516618, 0.3307985, 1.920581, 0.4039216, 0, 1, 1,
0.6548249, -0.5415199, 2.996025, 0.4117647, 0, 1, 1,
0.6640659, 0.7335249, -0.9212592, 0.4156863, 0, 1, 1,
0.6641788, -0.3794126, 1.38353, 0.4235294, 0, 1, 1,
0.6644894, 0.8582458, -0.08535166, 0.427451, 0, 1, 1,
0.6727507, -0.1014421, 1.192264, 0.4352941, 0, 1, 1,
0.6778976, 1.003305, -0.0803955, 0.4392157, 0, 1, 1,
0.6790552, 0.3779435, -1.161701, 0.4470588, 0, 1, 1,
0.6817138, -0.06782889, 0.7779707, 0.4509804, 0, 1, 1,
0.6876688, -1.593715, 2.218665, 0.4588235, 0, 1, 1,
0.6877471, -2.682247, 3.059897, 0.4627451, 0, 1, 1,
0.6909637, -0.2334119, 0.7073019, 0.4705882, 0, 1, 1,
0.6970065, 0.2129243, 1.674794, 0.4745098, 0, 1, 1,
0.6977564, -0.5022254, -0.04694812, 0.4823529, 0, 1, 1,
0.7031273, 1.178437, -0.3482007, 0.4862745, 0, 1, 1,
0.7069041, -0.502428, 0.8708677, 0.4941176, 0, 1, 1,
0.7089559, -0.7631737, 1.019172, 0.5019608, 0, 1, 1,
0.7095693, -0.9773746, 2.46482, 0.5058824, 0, 1, 1,
0.7103929, -1.035734, 2.160906, 0.5137255, 0, 1, 1,
0.7112575, 0.2082383, 2.033963, 0.5176471, 0, 1, 1,
0.7115756, -1.622713, 2.187778, 0.5254902, 0, 1, 1,
0.7118969, 0.1867367, -0.8033632, 0.5294118, 0, 1, 1,
0.7146014, 1.083299, 0.7243165, 0.5372549, 0, 1, 1,
0.7161995, 0.2923878, 1.17594, 0.5411765, 0, 1, 1,
0.7225384, 0.3160906, 2.635478, 0.5490196, 0, 1, 1,
0.7232774, 2.488015, 0.280956, 0.5529412, 0, 1, 1,
0.7237475, 1.281605, 2.283928, 0.5607843, 0, 1, 1,
0.7255494, 1.188121, 0.6973933, 0.5647059, 0, 1, 1,
0.7305906, 0.63043, 0.9243608, 0.572549, 0, 1, 1,
0.7315231, -1.947372, 1.74771, 0.5764706, 0, 1, 1,
0.7324167, 0.3681952, 2.770086, 0.5843138, 0, 1, 1,
0.7372369, 1.984845, -2.320249, 0.5882353, 0, 1, 1,
0.7385911, 0.05563084, 1.429895, 0.5960785, 0, 1, 1,
0.7397163, 0.7550732, 2.082113, 0.6039216, 0, 1, 1,
0.7467373, -0.1980472, 1.821327, 0.6078432, 0, 1, 1,
0.7474345, 1.430073, -0.9611225, 0.6156863, 0, 1, 1,
0.7475347, 1.134859, 1.349961, 0.6196079, 0, 1, 1,
0.7478463, 1.362805, 0.1602195, 0.627451, 0, 1, 1,
0.7482662, 2.939071, 0.08190229, 0.6313726, 0, 1, 1,
0.7487581, -0.9725208, 4.28894, 0.6392157, 0, 1, 1,
0.7499544, 1.008925, 0.5305295, 0.6431373, 0, 1, 1,
0.7509598, 0.8058919, 1.040251, 0.6509804, 0, 1, 1,
0.7511263, 1.399253, 1.36581, 0.654902, 0, 1, 1,
0.7572528, 0.3791697, 0.5631533, 0.6627451, 0, 1, 1,
0.7713599, 0.4347841, 0.5950167, 0.6666667, 0, 1, 1,
0.7729803, -0.3976643, 3.053229, 0.6745098, 0, 1, 1,
0.7768718, 0.3567578, 0.7124698, 0.6784314, 0, 1, 1,
0.7784269, 1.681554, -0.5143964, 0.6862745, 0, 1, 1,
0.7824317, 0.2311981, 1.150443, 0.6901961, 0, 1, 1,
0.7852014, 2.069076, 0.7268621, 0.6980392, 0, 1, 1,
0.7925125, -0.4004191, 1.480175, 0.7058824, 0, 1, 1,
0.7933027, -2.12313, 2.491471, 0.7098039, 0, 1, 1,
0.796526, -0.01943003, 0.1154118, 0.7176471, 0, 1, 1,
0.7976424, -0.0846784, -0.2541944, 0.7215686, 0, 1, 1,
0.8032668, -0.6889187, 1.542878, 0.7294118, 0, 1, 1,
0.8093665, 1.24005, 0.9586215, 0.7333333, 0, 1, 1,
0.8115149, -0.3104968, 0.623027, 0.7411765, 0, 1, 1,
0.8252756, 0.02040726, 0.5666479, 0.7450981, 0, 1, 1,
0.8281779, -0.4822307, 3.322957, 0.7529412, 0, 1, 1,
0.8282421, -0.3225154, 0.1636234, 0.7568628, 0, 1, 1,
0.8306614, 0.2868579, -0.2861335, 0.7647059, 0, 1, 1,
0.8309039, 1.725059, 0.2890765, 0.7686275, 0, 1, 1,
0.8336277, 0.3545681, -0.4699094, 0.7764706, 0, 1, 1,
0.8344287, -0.04648894, 1.062128, 0.7803922, 0, 1, 1,
0.8380353, 0.6184339, 1.354263, 0.7882353, 0, 1, 1,
0.839859, -0.09100904, -0.6294844, 0.7921569, 0, 1, 1,
0.8456344, -0.895764, 1.639163, 0.8, 0, 1, 1,
0.8474601, 0.4708109, 0.07987286, 0.8078431, 0, 1, 1,
0.8494321, 1.067165, -0.5383896, 0.8117647, 0, 1, 1,
0.8497319, 1.052651, 1.646014, 0.8196079, 0, 1, 1,
0.8540347, 0.6198276, -0.3149765, 0.8235294, 0, 1, 1,
0.8565115, 0.5438584, 2.169, 0.8313726, 0, 1, 1,
0.8683762, 0.8964921, -0.002815143, 0.8352941, 0, 1, 1,
0.8695948, -1.721677, 2.888925, 0.8431373, 0, 1, 1,
0.8695962, -1.018666, 3.031933, 0.8470588, 0, 1, 1,
0.8714955, -1.207225, 2.881774, 0.854902, 0, 1, 1,
0.8777596, -1.250734, 1.933099, 0.8588235, 0, 1, 1,
0.8831532, -1.406208, 3.934606, 0.8666667, 0, 1, 1,
0.8863024, -0.1989483, 2.296789, 0.8705882, 0, 1, 1,
0.8879432, -0.3341129, 2.651868, 0.8784314, 0, 1, 1,
0.8888147, 0.2881509, 0.8969756, 0.8823529, 0, 1, 1,
0.8896803, 0.6402426, 1.529625, 0.8901961, 0, 1, 1,
0.8912399, 2.124728, -0.9923026, 0.8941177, 0, 1, 1,
0.8937742, 1.331965, 0.6075048, 0.9019608, 0, 1, 1,
0.893806, -1.584101, 3.691519, 0.9098039, 0, 1, 1,
0.8960926, -1.204305, 4.352102, 0.9137255, 0, 1, 1,
0.8983312, 0.2644103, 0.4575625, 0.9215686, 0, 1, 1,
0.9015474, -0.2711239, 1.802081, 0.9254902, 0, 1, 1,
0.9065384, 1.242543, 1.027989, 0.9333333, 0, 1, 1,
0.9107866, 0.669943, 0.5345569, 0.9372549, 0, 1, 1,
0.9111833, 1.128374, -0.914441, 0.945098, 0, 1, 1,
0.9112324, -1.111989, 3.358362, 0.9490196, 0, 1, 1,
0.9113174, 0.1985089, 1.251417, 0.9568627, 0, 1, 1,
0.9138401, 0.7960824, 0.09165099, 0.9607843, 0, 1, 1,
0.9203796, -0.2551803, 0.6149311, 0.9686275, 0, 1, 1,
0.9305825, 0.04730142, 0.9844575, 0.972549, 0, 1, 1,
0.9378944, 0.6118458, 0.5652733, 0.9803922, 0, 1, 1,
0.9427943, -0.6206897, -0.6077825, 0.9843137, 0, 1, 1,
0.9430488, 0.2117195, 1.403617, 0.9921569, 0, 1, 1,
0.9450182, 1.440141, 0.9344435, 0.9960784, 0, 1, 1,
0.9492717, 0.5408203, -0.09618887, 1, 0, 0.9960784, 1,
0.9513998, 0.198467, 2.056465, 1, 0, 0.9882353, 1,
0.9529153, -0.4659003, 1.171533, 1, 0, 0.9843137, 1,
0.9599035, -1.15005, 0.8836002, 1, 0, 0.9764706, 1,
0.9634984, -0.2603711, 2.774886, 1, 0, 0.972549, 1,
0.9646558, -0.4620022, 1.053611, 1, 0, 0.9647059, 1,
0.9647363, -0.3434668, 1.39159, 1, 0, 0.9607843, 1,
0.977836, 0.02488851, 0.5005701, 1, 0, 0.9529412, 1,
0.9804476, -2.911511, 2.390716, 1, 0, 0.9490196, 1,
0.9878947, -1.367597, 2.887794, 1, 0, 0.9411765, 1,
0.9986544, -1.32413, 3.854548, 1, 0, 0.9372549, 1,
1.00059, 0.5347562, 2.568473, 1, 0, 0.9294118, 1,
1.008217, 0.8197988, 1.090237, 1, 0, 0.9254902, 1,
1.012236, -1.277475, 2.226773, 1, 0, 0.9176471, 1,
1.014121, -1.048128, 3.505916, 1, 0, 0.9137255, 1,
1.022816, -0.804047, 3.639545, 1, 0, 0.9058824, 1,
1.024674, 0.9011372, 0.1447667, 1, 0, 0.9019608, 1,
1.026338, -1.357455, 3.594922, 1, 0, 0.8941177, 1,
1.026433, -0.9941962, 1.858489, 1, 0, 0.8862745, 1,
1.029715, -0.5171515, 1.681232, 1, 0, 0.8823529, 1,
1.030539, 0.1213628, 3.010543, 1, 0, 0.8745098, 1,
1.032158, -0.06869762, -0.03246817, 1, 0, 0.8705882, 1,
1.032245, -0.3372165, 2.008914, 1, 0, 0.8627451, 1,
1.034982, 0.5990205, 0.4698545, 1, 0, 0.8588235, 1,
1.037573, 0.09650722, 1.127405, 1, 0, 0.8509804, 1,
1.041095, 0.7680987, 2.513844, 1, 0, 0.8470588, 1,
1.045219, -0.3679973, -0.2640546, 1, 0, 0.8392157, 1,
1.047435, 1.610188, 1.691026, 1, 0, 0.8352941, 1,
1.051033, -0.1863254, 4.156647, 1, 0, 0.827451, 1,
1.051438, 0.3784497, 1.219868, 1, 0, 0.8235294, 1,
1.052987, 0.2010349, 0.3352339, 1, 0, 0.8156863, 1,
1.058257, 2.458595, 1.773194, 1, 0, 0.8117647, 1,
1.063828, 0.2023303, 1.914843, 1, 0, 0.8039216, 1,
1.067893, 0.01477516, 3.235564, 1, 0, 0.7960784, 1,
1.068115, -0.7225226, 2.86542, 1, 0, 0.7921569, 1,
1.071694, -1.548692, 3.068656, 1, 0, 0.7843137, 1,
1.076758, -0.01329145, 2.196458, 1, 0, 0.7803922, 1,
1.090399, -0.8700165, 2.355645, 1, 0, 0.772549, 1,
1.090537, 0.2436079, -0.477879, 1, 0, 0.7686275, 1,
1.095035, 0.9335668, 3.559341, 1, 0, 0.7607843, 1,
1.106259, -1.760449, 3.22811, 1, 0, 0.7568628, 1,
1.109957, -0.8835045, 0.8556784, 1, 0, 0.7490196, 1,
1.110468, -0.3466506, 2.804764, 1, 0, 0.7450981, 1,
1.12286, -0.5679233, 2.871537, 1, 0, 0.7372549, 1,
1.124473, -0.9259002, 3.446191, 1, 0, 0.7333333, 1,
1.128125, 0.2404117, 2.695807, 1, 0, 0.7254902, 1,
1.128623, -1.730248, 2.149512, 1, 0, 0.7215686, 1,
1.132737, -0.1800179, 2.199095, 1, 0, 0.7137255, 1,
1.14312, 0.2249094, 1.054901, 1, 0, 0.7098039, 1,
1.143691, -0.8667867, 0.8245971, 1, 0, 0.7019608, 1,
1.144207, -0.1122597, 1.377101, 1, 0, 0.6941177, 1,
1.14475, 0.7761629, -0.1486379, 1, 0, 0.6901961, 1,
1.151998, -0.2892275, 1.292961, 1, 0, 0.682353, 1,
1.153988, 0.1416225, 2.711231, 1, 0, 0.6784314, 1,
1.165323, -1.236573, 2.27022, 1, 0, 0.6705883, 1,
1.167705, -1.059654, 3.888093, 1, 0, 0.6666667, 1,
1.184734, 0.2731737, 2.032465, 1, 0, 0.6588235, 1,
1.18684, 1.36065, 1.30722, 1, 0, 0.654902, 1,
1.204015, -1.105643, 2.974137, 1, 0, 0.6470588, 1,
1.204194, -1.808975, 0.9960644, 1, 0, 0.6431373, 1,
1.208476, 1.325011, 1.458956, 1, 0, 0.6352941, 1,
1.210064, 1.034187, -1.531891, 1, 0, 0.6313726, 1,
1.220793, 0.5520272, 1.054303, 1, 0, 0.6235294, 1,
1.222414, 0.1161404, 0.8764301, 1, 0, 0.6196079, 1,
1.223046, -0.09716661, 1.510609, 1, 0, 0.6117647, 1,
1.224038, 2.658625, -0.5622863, 1, 0, 0.6078432, 1,
1.224561, -0.815424, 1.396956, 1, 0, 0.6, 1,
1.225871, -1.411065, 1.950503, 1, 0, 0.5921569, 1,
1.233868, 1.092878, 2.402562, 1, 0, 0.5882353, 1,
1.235702, 0.4062774, 1.207608, 1, 0, 0.5803922, 1,
1.238886, 1.230973, 1.796857, 1, 0, 0.5764706, 1,
1.264641, 1.353849, 1.126625, 1, 0, 0.5686275, 1,
1.280927, -1.36715, 1.960834, 1, 0, 0.5647059, 1,
1.287222, 1.244964, 0.1646317, 1, 0, 0.5568628, 1,
1.28796, -1.005771, 2.871653, 1, 0, 0.5529412, 1,
1.303837, -0.5613109, 1.778312, 1, 0, 0.5450981, 1,
1.307244, -0.950176, 2.883645, 1, 0, 0.5411765, 1,
1.308058, 0.512367, 1.528634, 1, 0, 0.5333334, 1,
1.308761, -0.09398276, 1.306612, 1, 0, 0.5294118, 1,
1.309537, 0.7957852, 0.717943, 1, 0, 0.5215687, 1,
1.315124, 0.1253145, -0.08113606, 1, 0, 0.5176471, 1,
1.336563, -1.06789, 1.960382, 1, 0, 0.509804, 1,
1.347722, -0.3542201, 3.289274, 1, 0, 0.5058824, 1,
1.356443, 0.5472052, 1.223706, 1, 0, 0.4980392, 1,
1.358355, -1.725699, 3.2517, 1, 0, 0.4901961, 1,
1.364735, -0.4932851, 1.752661, 1, 0, 0.4862745, 1,
1.369978, -0.8194958, 2.71507, 1, 0, 0.4784314, 1,
1.37762, -0.5581704, 4.282589, 1, 0, 0.4745098, 1,
1.379143, -2.054749, 2.950004, 1, 0, 0.4666667, 1,
1.385973, 1.025646, 1.995914, 1, 0, 0.4627451, 1,
1.396483, -0.3569251, 1.833129, 1, 0, 0.454902, 1,
1.414268, 1.41844, 1.111758, 1, 0, 0.4509804, 1,
1.423357, 0.164766, 2.917782, 1, 0, 0.4431373, 1,
1.430766, -0.3843797, 0.7427224, 1, 0, 0.4392157, 1,
1.432947, 0.04090041, -0.5710569, 1, 0, 0.4313726, 1,
1.453608, 0.6798127, 1.662761, 1, 0, 0.427451, 1,
1.457566, -2.05716, 2.530609, 1, 0, 0.4196078, 1,
1.480731, -1.681856, 5.013185, 1, 0, 0.4156863, 1,
1.486055, -0.04956152, 1.114771, 1, 0, 0.4078431, 1,
1.500648, -0.4815631, 1.138959, 1, 0, 0.4039216, 1,
1.508884, -0.7771271, 1.758081, 1, 0, 0.3960784, 1,
1.523375, -0.05627522, 2.567752, 1, 0, 0.3882353, 1,
1.55814, 1.643311, 0.4809949, 1, 0, 0.3843137, 1,
1.563572, -0.8377272, 2.469724, 1, 0, 0.3764706, 1,
1.564177, -0.06205596, 1.082259, 1, 0, 0.372549, 1,
1.573379, 0.5950492, 0.8005159, 1, 0, 0.3647059, 1,
1.580864, 1.186571, 2.274937, 1, 0, 0.3607843, 1,
1.58194, -0.2292961, 0.6618537, 1, 0, 0.3529412, 1,
1.596698, -1.528547, 1.552823, 1, 0, 0.3490196, 1,
1.613923, 0.539012, 1.841769, 1, 0, 0.3411765, 1,
1.614215, -0.2574931, 2.680326, 1, 0, 0.3372549, 1,
1.615059, 0.4228195, 0.7709388, 1, 0, 0.3294118, 1,
1.629325, -2.36875, 0.6490418, 1, 0, 0.3254902, 1,
1.641772, -0.9638185, 2.476283, 1, 0, 0.3176471, 1,
1.649009, -0.1894447, 2.647447, 1, 0, 0.3137255, 1,
1.649206, -0.9110675, 1.591272, 1, 0, 0.3058824, 1,
1.650738, 1.629897, -1.174335, 1, 0, 0.2980392, 1,
1.651302, -1.331643, 2.748606, 1, 0, 0.2941177, 1,
1.674676, -0.1439201, 2.425625, 1, 0, 0.2862745, 1,
1.681225, 0.003866795, 1.833205, 1, 0, 0.282353, 1,
1.692225, 0.9943692, 3.206639, 1, 0, 0.2745098, 1,
1.696666, -0.9184795, 3.017433, 1, 0, 0.2705882, 1,
1.70769, -0.7645802, 3.538347, 1, 0, 0.2627451, 1,
1.713467, 0.8914044, 2.887871, 1, 0, 0.2588235, 1,
1.725858, -2.256266, 2.568148, 1, 0, 0.2509804, 1,
1.727409, -0.4306444, 1.47443, 1, 0, 0.2470588, 1,
1.735929, -1.583764, 2.884662, 1, 0, 0.2392157, 1,
1.745638, 0.05796017, 0.4127916, 1, 0, 0.2352941, 1,
1.758656, -1.092129, 3.029609, 1, 0, 0.227451, 1,
1.763363, -1.211859, 1.621456, 1, 0, 0.2235294, 1,
1.788857, -2.380091, 2.161149, 1, 0, 0.2156863, 1,
1.794673, -0.5757437, 1.689346, 1, 0, 0.2117647, 1,
1.802237, -0.8405177, 2.685273, 1, 0, 0.2039216, 1,
1.828395, 0.5439818, 3.86323, 1, 0, 0.1960784, 1,
1.842479, 0.0208075, 1.367765, 1, 0, 0.1921569, 1,
1.913597, -0.4320835, 1.717362, 1, 0, 0.1843137, 1,
1.919814, -0.3305286, 3.439263, 1, 0, 0.1803922, 1,
1.92537, 0.6821257, 1.991933, 1, 0, 0.172549, 1,
1.928985, -0.6210505, 0.814068, 1, 0, 0.1686275, 1,
1.931084, -1.337735, 1.225113, 1, 0, 0.1607843, 1,
1.933541, 0.3093421, 2.763977, 1, 0, 0.1568628, 1,
1.942468, -1.037378, 1.270737, 1, 0, 0.1490196, 1,
1.948145, 0.1553727, 1.766375, 1, 0, 0.145098, 1,
1.979987, 0.7924178, 1.9629, 1, 0, 0.1372549, 1,
1.992351, -1.050795, 0.6831031, 1, 0, 0.1333333, 1,
2.035446, -2.747892, 2.045943, 1, 0, 0.1254902, 1,
2.051839, -0.04047107, 1.14146, 1, 0, 0.1215686, 1,
2.222447, 0.6149608, 1.878054, 1, 0, 0.1137255, 1,
2.233411, 0.5785784, 1.456939, 1, 0, 0.1098039, 1,
2.248878, 0.8815175, 1.523324, 1, 0, 0.1019608, 1,
2.271625, 0.09631248, 0.1556326, 1, 0, 0.09411765, 1,
2.298706, 0.9407465, 1.348034, 1, 0, 0.09019608, 1,
2.301549, -0.3145645, 1.988115, 1, 0, 0.08235294, 1,
2.309039, 0.6744342, 0.868962, 1, 0, 0.07843138, 1,
2.398909, -0.8718531, 2.141033, 1, 0, 0.07058824, 1,
2.45353, -0.08307441, 0.8599688, 1, 0, 0.06666667, 1,
2.5257, 1.264847, 3.035696, 1, 0, 0.05882353, 1,
2.596932, 0.3307413, 1.793018, 1, 0, 0.05490196, 1,
2.603195, -0.2565368, 0.4145333, 1, 0, 0.04705882, 1,
2.619639, 0.9103684, 0.613231, 1, 0, 0.04313726, 1,
2.642502, -0.2709858, 4.719716, 1, 0, 0.03529412, 1,
2.643562, 0.3237655, 1.131913, 1, 0, 0.03137255, 1,
2.751744, 0.3791185, 0.7117053, 1, 0, 0.02352941, 1,
2.885753, 2.056349, 1.698379, 1, 0, 0.01960784, 1,
2.973397, 0.9572022, 1.356166, 1, 0, 0.01176471, 1,
3.234594, -0.2681762, 1.311443, 1, 0, 0.007843138, 1
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
0.06771183, -3.903185, -6.97465, 0, -0.5, 0.5, 0.5,
0.06771183, -3.903185, -6.97465, 1, -0.5, 0.5, 0.5,
0.06771183, -3.903185, -6.97465, 1, 1.5, 0.5, 0.5,
0.06771183, -3.903185, -6.97465, 0, 1.5, 0.5, 0.5
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
-4.172743, 0.01377976, -6.97465, 0, -0.5, 0.5, 0.5,
-4.172743, 0.01377976, -6.97465, 1, -0.5, 0.5, 0.5,
-4.172743, 0.01377976, -6.97465, 1, 1.5, 0.5, 0.5,
-4.172743, 0.01377976, -6.97465, 0, 1.5, 0.5, 0.5
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
-4.172743, -3.903185, 0.3012192, 0, -0.5, 0.5, 0.5,
-4.172743, -3.903185, 0.3012192, 1, -0.5, 0.5, 0.5,
-4.172743, -3.903185, 0.3012192, 1, 1.5, 0.5, 0.5,
-4.172743, -3.903185, 0.3012192, 0, 1.5, 0.5, 0.5
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
-3, -2.99927, -5.295603,
3, -2.99927, -5.295603,
-3, -2.99927, -5.295603,
-3, -3.149922, -5.575444,
-2, -2.99927, -5.295603,
-2, -3.149922, -5.575444,
-1, -2.99927, -5.295603,
-1, -3.149922, -5.575444,
0, -2.99927, -5.295603,
0, -3.149922, -5.575444,
1, -2.99927, -5.295603,
1, -3.149922, -5.575444,
2, -2.99927, -5.295603,
2, -3.149922, -5.575444,
3, -2.99927, -5.295603,
3, -3.149922, -5.575444
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
-3, -3.451227, -6.135127, 0, -0.5, 0.5, 0.5,
-3, -3.451227, -6.135127, 1, -0.5, 0.5, 0.5,
-3, -3.451227, -6.135127, 1, 1.5, 0.5, 0.5,
-3, -3.451227, -6.135127, 0, 1.5, 0.5, 0.5,
-2, -3.451227, -6.135127, 0, -0.5, 0.5, 0.5,
-2, -3.451227, -6.135127, 1, -0.5, 0.5, 0.5,
-2, -3.451227, -6.135127, 1, 1.5, 0.5, 0.5,
-2, -3.451227, -6.135127, 0, 1.5, 0.5, 0.5,
-1, -3.451227, -6.135127, 0, -0.5, 0.5, 0.5,
-1, -3.451227, -6.135127, 1, -0.5, 0.5, 0.5,
-1, -3.451227, -6.135127, 1, 1.5, 0.5, 0.5,
-1, -3.451227, -6.135127, 0, 1.5, 0.5, 0.5,
0, -3.451227, -6.135127, 0, -0.5, 0.5, 0.5,
0, -3.451227, -6.135127, 1, -0.5, 0.5, 0.5,
0, -3.451227, -6.135127, 1, 1.5, 0.5, 0.5,
0, -3.451227, -6.135127, 0, 1.5, 0.5, 0.5,
1, -3.451227, -6.135127, 0, -0.5, 0.5, 0.5,
1, -3.451227, -6.135127, 1, -0.5, 0.5, 0.5,
1, -3.451227, -6.135127, 1, 1.5, 0.5, 0.5,
1, -3.451227, -6.135127, 0, 1.5, 0.5, 0.5,
2, -3.451227, -6.135127, 0, -0.5, 0.5, 0.5,
2, -3.451227, -6.135127, 1, -0.5, 0.5, 0.5,
2, -3.451227, -6.135127, 1, 1.5, 0.5, 0.5,
2, -3.451227, -6.135127, 0, 1.5, 0.5, 0.5,
3, -3.451227, -6.135127, 0, -0.5, 0.5, 0.5,
3, -3.451227, -6.135127, 1, -0.5, 0.5, 0.5,
3, -3.451227, -6.135127, 1, 1.5, 0.5, 0.5,
3, -3.451227, -6.135127, 0, 1.5, 0.5, 0.5
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
-3.194177, -2, -5.295603,
-3.194177, 2, -5.295603,
-3.194177, -2, -5.295603,
-3.357271, -2, -5.575444,
-3.194177, -1, -5.295603,
-3.357271, -1, -5.575444,
-3.194177, 0, -5.295603,
-3.357271, 0, -5.575444,
-3.194177, 1, -5.295603,
-3.357271, 1, -5.575444,
-3.194177, 2, -5.295603,
-3.357271, 2, -5.575444
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
-3.68346, -2, -6.135127, 0, -0.5, 0.5, 0.5,
-3.68346, -2, -6.135127, 1, -0.5, 0.5, 0.5,
-3.68346, -2, -6.135127, 1, 1.5, 0.5, 0.5,
-3.68346, -2, -6.135127, 0, 1.5, 0.5, 0.5,
-3.68346, -1, -6.135127, 0, -0.5, 0.5, 0.5,
-3.68346, -1, -6.135127, 1, -0.5, 0.5, 0.5,
-3.68346, -1, -6.135127, 1, 1.5, 0.5, 0.5,
-3.68346, -1, -6.135127, 0, 1.5, 0.5, 0.5,
-3.68346, 0, -6.135127, 0, -0.5, 0.5, 0.5,
-3.68346, 0, -6.135127, 1, -0.5, 0.5, 0.5,
-3.68346, 0, -6.135127, 1, 1.5, 0.5, 0.5,
-3.68346, 0, -6.135127, 0, 1.5, 0.5, 0.5,
-3.68346, 1, -6.135127, 0, -0.5, 0.5, 0.5,
-3.68346, 1, -6.135127, 1, -0.5, 0.5, 0.5,
-3.68346, 1, -6.135127, 1, 1.5, 0.5, 0.5,
-3.68346, 1, -6.135127, 0, 1.5, 0.5, 0.5,
-3.68346, 2, -6.135127, 0, -0.5, 0.5, 0.5,
-3.68346, 2, -6.135127, 1, -0.5, 0.5, 0.5,
-3.68346, 2, -6.135127, 1, 1.5, 0.5, 0.5,
-3.68346, 2, -6.135127, 0, 1.5, 0.5, 0.5
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
-3.194177, -2.99927, -4,
-3.194177, -2.99927, 4,
-3.194177, -2.99927, -4,
-3.357271, -3.149922, -4,
-3.194177, -2.99927, -2,
-3.357271, -3.149922, -2,
-3.194177, -2.99927, 0,
-3.357271, -3.149922, 0,
-3.194177, -2.99927, 2,
-3.357271, -3.149922, 2,
-3.194177, -2.99927, 4,
-3.357271, -3.149922, 4
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
-3.68346, -3.451227, -4, 0, -0.5, 0.5, 0.5,
-3.68346, -3.451227, -4, 1, -0.5, 0.5, 0.5,
-3.68346, -3.451227, -4, 1, 1.5, 0.5, 0.5,
-3.68346, -3.451227, -4, 0, 1.5, 0.5, 0.5,
-3.68346, -3.451227, -2, 0, -0.5, 0.5, 0.5,
-3.68346, -3.451227, -2, 1, -0.5, 0.5, 0.5,
-3.68346, -3.451227, -2, 1, 1.5, 0.5, 0.5,
-3.68346, -3.451227, -2, 0, 1.5, 0.5, 0.5,
-3.68346, -3.451227, 0, 0, -0.5, 0.5, 0.5,
-3.68346, -3.451227, 0, 1, -0.5, 0.5, 0.5,
-3.68346, -3.451227, 0, 1, 1.5, 0.5, 0.5,
-3.68346, -3.451227, 0, 0, 1.5, 0.5, 0.5,
-3.68346, -3.451227, 2, 0, -0.5, 0.5, 0.5,
-3.68346, -3.451227, 2, 1, -0.5, 0.5, 0.5,
-3.68346, -3.451227, 2, 1, 1.5, 0.5, 0.5,
-3.68346, -3.451227, 2, 0, 1.5, 0.5, 0.5,
-3.68346, -3.451227, 4, 0, -0.5, 0.5, 0.5,
-3.68346, -3.451227, 4, 1, -0.5, 0.5, 0.5,
-3.68346, -3.451227, 4, 1, 1.5, 0.5, 0.5,
-3.68346, -3.451227, 4, 0, 1.5, 0.5, 0.5
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
-3.194177, -2.99927, -5.295603,
-3.194177, 3.026829, -5.295603,
-3.194177, -2.99927, 5.898042,
-3.194177, 3.026829, 5.898042,
-3.194177, -2.99927, -5.295603,
-3.194177, -2.99927, 5.898042,
-3.194177, 3.026829, -5.295603,
-3.194177, 3.026829, 5.898042,
-3.194177, -2.99927, -5.295603,
3.329601, -2.99927, -5.295603,
-3.194177, -2.99927, 5.898042,
3.329601, -2.99927, 5.898042,
-3.194177, 3.026829, -5.295603,
3.329601, 3.026829, -5.295603,
-3.194177, 3.026829, 5.898042,
3.329601, 3.026829, 5.898042,
3.329601, -2.99927, -5.295603,
3.329601, 3.026829, -5.295603,
3.329601, -2.99927, 5.898042,
3.329601, 3.026829, 5.898042,
3.329601, -2.99927, -5.295603,
3.329601, -2.99927, 5.898042,
3.329601, 3.026829, -5.295603,
3.329601, 3.026829, 5.898042
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
var radius = 7.629968;
var distance = 33.94659;
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
mvMatrix.translate( -0.06771183, -0.01377976, -0.3012192 );
mvMatrix.scale( 1.264554, 1.36899, 0.736996 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94659);
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


