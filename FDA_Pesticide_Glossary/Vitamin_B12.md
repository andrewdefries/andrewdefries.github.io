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
-3.436651, 0.4239415, -1.381867, 1, 0, 0, 1,
-2.889327, -0.6969441, -3.379579, 1, 0.007843138, 0, 1,
-2.724801, -1.226452, -2.624862, 1, 0.01176471, 0, 1,
-2.474805, -1.194433, -3.007957, 1, 0.01960784, 0, 1,
-2.471958, 2.584909, 0.1874851, 1, 0.02352941, 0, 1,
-2.433632, 0.9588443, -0.4345811, 1, 0.03137255, 0, 1,
-2.393387, 0.5527394, -1.289796, 1, 0.03529412, 0, 1,
-2.377585, 0.08736295, -1.600376, 1, 0.04313726, 0, 1,
-2.351993, -2.195564, -4.225214, 1, 0.04705882, 0, 1,
-2.326688, -1.213981, -2.8573, 1, 0.05490196, 0, 1,
-2.291313, 0.1671788, -2.786686, 1, 0.05882353, 0, 1,
-2.27213, 0.7799024, -0.4469345, 1, 0.06666667, 0, 1,
-2.241743, -0.5048342, -2.061076, 1, 0.07058824, 0, 1,
-2.197824, 0.7812059, -2.561588, 1, 0.07843138, 0, 1,
-2.178848, 0.1220685, -0.8694899, 1, 0.08235294, 0, 1,
-2.170202, 1.257693, -0.2565566, 1, 0.09019608, 0, 1,
-2.159672, 0.3420701, -0.6890618, 1, 0.09411765, 0, 1,
-2.146564, -1.006889, -2.70978, 1, 0.1019608, 0, 1,
-2.133951, 0.9173381, -0.4523071, 1, 0.1098039, 0, 1,
-2.130435, 0.03254754, -0.3422771, 1, 0.1137255, 0, 1,
-2.124868, 0.1030812, -1.398916, 1, 0.1215686, 0, 1,
-2.101594, 0.5957546, -0.08744815, 1, 0.1254902, 0, 1,
-2.096038, -0.4124824, -2.36096, 1, 0.1333333, 0, 1,
-2.048491, -0.5181945, -1.892008, 1, 0.1372549, 0, 1,
-2.041493, 0.0462729, -2.864393, 1, 0.145098, 0, 1,
-2.019564, 0.3295158, -2.073703, 1, 0.1490196, 0, 1,
-2.012934, 0.2149276, -3.329073, 1, 0.1568628, 0, 1,
-1.999777, 1.002512, -2.31402, 1, 0.1607843, 0, 1,
-1.988875, -0.7352401, -0.7833732, 1, 0.1686275, 0, 1,
-1.977281, -0.7858845, -1.891726, 1, 0.172549, 0, 1,
-1.962529, -0.08238304, -1.862447, 1, 0.1803922, 0, 1,
-1.947583, -0.2383507, 0.1017404, 1, 0.1843137, 0, 1,
-1.941228, -0.4793557, -2.530061, 1, 0.1921569, 0, 1,
-1.941206, 0.2276213, -0.3197742, 1, 0.1960784, 0, 1,
-1.919628, 1.300352, -0.9549311, 1, 0.2039216, 0, 1,
-1.916543, -1.615184, -2.681946, 1, 0.2117647, 0, 1,
-1.903946, -0.4972163, -1.920151, 1, 0.2156863, 0, 1,
-1.899861, 0.03392871, -1.112654, 1, 0.2235294, 0, 1,
-1.864887, 0.6841823, -2.601155, 1, 0.227451, 0, 1,
-1.856516, -1.130829, -1.172101, 1, 0.2352941, 0, 1,
-1.852097, -1.086155, -3.609226, 1, 0.2392157, 0, 1,
-1.846858, -0.2326779, -0.4647553, 1, 0.2470588, 0, 1,
-1.833809, 0.3624303, -0.23924, 1, 0.2509804, 0, 1,
-1.828504, 0.2455802, 0.9598765, 1, 0.2588235, 0, 1,
-1.818057, -0.01731698, -0.9900908, 1, 0.2627451, 0, 1,
-1.816387, 0.97013, -1.88531, 1, 0.2705882, 0, 1,
-1.811749, 0.2893758, -2.695327, 1, 0.2745098, 0, 1,
-1.79679, -0.6237146, -4.388817, 1, 0.282353, 0, 1,
-1.771048, -0.8551116, -1.237098, 1, 0.2862745, 0, 1,
-1.770585, -0.7706374, -2.214679, 1, 0.2941177, 0, 1,
-1.766718, 0.01328586, -0.5622478, 1, 0.3019608, 0, 1,
-1.754953, 0.05365372, -1.306889, 1, 0.3058824, 0, 1,
-1.75017, 0.5065966, -1.610411, 1, 0.3137255, 0, 1,
-1.730878, 0.1466006, -0.9463274, 1, 0.3176471, 0, 1,
-1.729835, 1.80977, -0.02184904, 1, 0.3254902, 0, 1,
-1.728254, 1.339528, 1.083069, 1, 0.3294118, 0, 1,
-1.723016, -0.9780841, -0.571827, 1, 0.3372549, 0, 1,
-1.712849, 2.211972, -1.353706, 1, 0.3411765, 0, 1,
-1.702721, 0.191929, -1.046967, 1, 0.3490196, 0, 1,
-1.694619, -0.7710854, -1.563112, 1, 0.3529412, 0, 1,
-1.689134, 0.9780719, -0.06349386, 1, 0.3607843, 0, 1,
-1.671907, -0.4426957, -1.732116, 1, 0.3647059, 0, 1,
-1.664508, -1.495999, -2.055479, 1, 0.372549, 0, 1,
-1.662526, -1.39228, -2.237166, 1, 0.3764706, 0, 1,
-1.647736, 0.3742379, -0.9051865, 1, 0.3843137, 0, 1,
-1.645656, 0.1668039, -1.086896, 1, 0.3882353, 0, 1,
-1.644317, -0.4818711, -0.6500254, 1, 0.3960784, 0, 1,
-1.642074, 0.3881148, -2.966511, 1, 0.4039216, 0, 1,
-1.635003, -1.312434, -1.061731, 1, 0.4078431, 0, 1,
-1.624616, -0.352295, -0.2756316, 1, 0.4156863, 0, 1,
-1.623479, -0.2427431, 0.52984, 1, 0.4196078, 0, 1,
-1.620614, 0.5559291, 0.4302993, 1, 0.427451, 0, 1,
-1.607262, -1.422483, -3.897385, 1, 0.4313726, 0, 1,
-1.593835, 0.6345535, -0.750451, 1, 0.4392157, 0, 1,
-1.578157, -0.1429054, -0.9843177, 1, 0.4431373, 0, 1,
-1.556175, -0.8943028, -1.972384, 1, 0.4509804, 0, 1,
-1.552448, 0.7971097, -1.094694, 1, 0.454902, 0, 1,
-1.53721, -0.6467861, -0.7631111, 1, 0.4627451, 0, 1,
-1.536112, 1.441504, -1.869524, 1, 0.4666667, 0, 1,
-1.533932, -1.626247, -2.18042, 1, 0.4745098, 0, 1,
-1.533306, 0.3836147, 0.02333745, 1, 0.4784314, 0, 1,
-1.532928, 0.2230099, -0.8932226, 1, 0.4862745, 0, 1,
-1.527435, -0.3003829, -2.346939, 1, 0.4901961, 0, 1,
-1.524351, 1.315891, -0.4609625, 1, 0.4980392, 0, 1,
-1.521929, 0.4218646, -0.4144315, 1, 0.5058824, 0, 1,
-1.519888, 1.52828, 1.086951, 1, 0.509804, 0, 1,
-1.514927, 0.1005772, -2.610381, 1, 0.5176471, 0, 1,
-1.502571, 0.4649348, -1.449577, 1, 0.5215687, 0, 1,
-1.501988, 0.380744, -2.897369, 1, 0.5294118, 0, 1,
-1.496066, 0.6636046, -1.18441, 1, 0.5333334, 0, 1,
-1.493543, 0.04748374, -0.9489138, 1, 0.5411765, 0, 1,
-1.449025, -0.115718, -1.521311, 1, 0.5450981, 0, 1,
-1.425195, -0.8899131, -3.720329, 1, 0.5529412, 0, 1,
-1.411289, -0.9032757, -1.964595, 1, 0.5568628, 0, 1,
-1.401065, 0.8407827, -0.4739872, 1, 0.5647059, 0, 1,
-1.397978, 0.364531, -4.024771, 1, 0.5686275, 0, 1,
-1.390832, -0.3306471, -2.102221, 1, 0.5764706, 0, 1,
-1.385116, 0.1010924, -1.129597, 1, 0.5803922, 0, 1,
-1.376843, -0.5088543, -1.465946, 1, 0.5882353, 0, 1,
-1.367865, -0.7978668, -3.939821, 1, 0.5921569, 0, 1,
-1.367253, 0.2212779, -1.570929, 1, 0.6, 0, 1,
-1.365509, -1.630152, -1.313572, 1, 0.6078432, 0, 1,
-1.360155, -0.0009981977, -0.8147461, 1, 0.6117647, 0, 1,
-1.312037, -0.04139493, -0.556747, 1, 0.6196079, 0, 1,
-1.311845, 0.02776773, 0.1608339, 1, 0.6235294, 0, 1,
-1.293321, -1.023433, -1.912716, 1, 0.6313726, 0, 1,
-1.268298, 0.3249308, -1.507237, 1, 0.6352941, 0, 1,
-1.264836, -0.9496059, -1.893432, 1, 0.6431373, 0, 1,
-1.262531, 1.144506, -1.831931, 1, 0.6470588, 0, 1,
-1.258522, -0.1478844, -1.302529, 1, 0.654902, 0, 1,
-1.253751, -0.7250243, -1.350294, 1, 0.6588235, 0, 1,
-1.248989, 0.2224287, -1.794387, 1, 0.6666667, 0, 1,
-1.245596, -0.03775386, -2.370048, 1, 0.6705883, 0, 1,
-1.23922, 0.2332793, 0.1331046, 1, 0.6784314, 0, 1,
-1.236932, -0.2284812, -1.301764, 1, 0.682353, 0, 1,
-1.236365, -0.3519842, -1.655158, 1, 0.6901961, 0, 1,
-1.235158, -0.07430418, -1.498042, 1, 0.6941177, 0, 1,
-1.231761, 0.02812901, -2.795312, 1, 0.7019608, 0, 1,
-1.211311, 0.05852809, -1.480926, 1, 0.7098039, 0, 1,
-1.200885, 0.5176795, -0.5700079, 1, 0.7137255, 0, 1,
-1.200729, 0.4142479, -0.7878135, 1, 0.7215686, 0, 1,
-1.199937, 0.8994701, -1.752946, 1, 0.7254902, 0, 1,
-1.19627, 1.078463, -0.6510379, 1, 0.7333333, 0, 1,
-1.193019, 1.831217, 0.6474438, 1, 0.7372549, 0, 1,
-1.181752, 0.1112629, -0.9966501, 1, 0.7450981, 0, 1,
-1.169893, 1.342744, -0.9362562, 1, 0.7490196, 0, 1,
-1.163369, -0.5228025, -3.092359, 1, 0.7568628, 0, 1,
-1.159932, 1.339918, -0.5123527, 1, 0.7607843, 0, 1,
-1.152244, 0.5582758, -0.6376446, 1, 0.7686275, 0, 1,
-1.144568, -0.6250994, -3.564987, 1, 0.772549, 0, 1,
-1.144069, 0.9999608, -1.02358, 1, 0.7803922, 0, 1,
-1.143059, 0.35501, -1.281507, 1, 0.7843137, 0, 1,
-1.138392, 1.78574, 0.3306558, 1, 0.7921569, 0, 1,
-1.134859, 0.368109, -0.731661, 1, 0.7960784, 0, 1,
-1.134042, -0.1755934, -2.33641, 1, 0.8039216, 0, 1,
-1.128293, 0.3094038, -1.237256, 1, 0.8117647, 0, 1,
-1.127505, 1.685888, -0.3504605, 1, 0.8156863, 0, 1,
-1.115868, 0.7678961, -0.7400344, 1, 0.8235294, 0, 1,
-1.115317, 0.7214482, -2.566383, 1, 0.827451, 0, 1,
-1.108613, 0.797003, 0.2175053, 1, 0.8352941, 0, 1,
-1.105411, 0.3112856, -1.57179, 1, 0.8392157, 0, 1,
-1.091235, -0.09249441, -2.383146, 1, 0.8470588, 0, 1,
-1.084549, -0.2370972, -0.1184272, 1, 0.8509804, 0, 1,
-1.084256, -0.3367788, -2.65875, 1, 0.8588235, 0, 1,
-1.072198, 0.7428635, -2.286098, 1, 0.8627451, 0, 1,
-1.069709, -1.542913, -1.262226, 1, 0.8705882, 0, 1,
-1.063457, 0.343956, -0.7338975, 1, 0.8745098, 0, 1,
-1.061617, -0.2130127, -2.917252, 1, 0.8823529, 0, 1,
-1.053726, -0.2317624, -3.277817, 1, 0.8862745, 0, 1,
-1.051525, 0.6973578, -0.7805508, 1, 0.8941177, 0, 1,
-1.048321, 0.1325073, -1.65339, 1, 0.8980392, 0, 1,
-1.04743, -0.04125309, -2.376358, 1, 0.9058824, 0, 1,
-1.042806, 0.7528419, -1.051621, 1, 0.9137255, 0, 1,
-1.042317, -1.899195, -3.075163, 1, 0.9176471, 0, 1,
-1.041294, 1.604936, 0.4631951, 1, 0.9254902, 0, 1,
-1.037684, -1.297088, -1.42897, 1, 0.9294118, 0, 1,
-1.027699, -0.9850523, -1.69953, 1, 0.9372549, 0, 1,
-1.023967, 0.04166868, -2.580627, 1, 0.9411765, 0, 1,
-1.015105, 0.02816984, 1.712784, 1, 0.9490196, 0, 1,
-1.013003, 0.4582425, -0.9084728, 1, 0.9529412, 0, 1,
-1.010256, 0.2794763, -0.963513, 1, 0.9607843, 0, 1,
-1.005051, 0.3543224, -1.643579, 1, 0.9647059, 0, 1,
-0.9979708, -0.2460553, -1.259104, 1, 0.972549, 0, 1,
-0.9928425, -1.335225, -2.557464, 1, 0.9764706, 0, 1,
-0.9817227, -0.0503368, -0.1760848, 1, 0.9843137, 0, 1,
-0.9761651, -0.1381214, -1.660841, 1, 0.9882353, 0, 1,
-0.9745211, 0.7314, -0.564079, 1, 0.9960784, 0, 1,
-0.9711442, -0.4929278, -4.037174, 0.9960784, 1, 0, 1,
-0.964676, -0.1239293, -2.037808, 0.9921569, 1, 0, 1,
-0.9632888, 0.0116636, -1.573793, 0.9843137, 1, 0, 1,
-0.9525905, 1.437664, -2.092889, 0.9803922, 1, 0, 1,
-0.9454306, 0.2411901, -2.184124, 0.972549, 1, 0, 1,
-0.9417763, -0.4231256, -2.969079, 0.9686275, 1, 0, 1,
-0.9358583, -0.334238, -0.5712352, 0.9607843, 1, 0, 1,
-0.9319988, -1.265346, -4.611329, 0.9568627, 1, 0, 1,
-0.92483, -1.30878, -3.164263, 0.9490196, 1, 0, 1,
-0.924042, -0.2248959, -0.3378117, 0.945098, 1, 0, 1,
-0.919577, -0.05748926, -0.2391429, 0.9372549, 1, 0, 1,
-0.9165369, -0.1518962, -1.156373, 0.9333333, 1, 0, 1,
-0.9127042, -0.1079764, -1.487376, 0.9254902, 1, 0, 1,
-0.9101184, -0.496309, -1.589392, 0.9215686, 1, 0, 1,
-0.9009279, 0.658906, 0.02590033, 0.9137255, 1, 0, 1,
-0.8952243, 0.6552119, -0.8579665, 0.9098039, 1, 0, 1,
-0.8939211, 0.09305592, -0.6413843, 0.9019608, 1, 0, 1,
-0.8913079, 1.620723, -1.291543, 0.8941177, 1, 0, 1,
-0.8900024, 1.189701, 1.138474, 0.8901961, 1, 0, 1,
-0.8873581, -0.3407027, -3.325246, 0.8823529, 1, 0, 1,
-0.8861207, -0.5546551, -2.640449, 0.8784314, 1, 0, 1,
-0.876449, 0.7418756, -1.441997, 0.8705882, 1, 0, 1,
-0.8758547, -1.452282, -2.451662, 0.8666667, 1, 0, 1,
-0.8742752, 0.2239889, 0.1070544, 0.8588235, 1, 0, 1,
-0.8732059, -0.1593459, -0.9729882, 0.854902, 1, 0, 1,
-0.8688335, 1.248681, 0.46197, 0.8470588, 1, 0, 1,
-0.8682904, -0.4931321, 0.1031881, 0.8431373, 1, 0, 1,
-0.8666932, 0.1163391, -1.013018, 0.8352941, 1, 0, 1,
-0.8661861, -0.2494734, -1.745824, 0.8313726, 1, 0, 1,
-0.8525196, -0.8347009, -2.00399, 0.8235294, 1, 0, 1,
-0.8515837, -0.7045543, -2.405561, 0.8196079, 1, 0, 1,
-0.8445638, -0.8417809, -0.7360774, 0.8117647, 1, 0, 1,
-0.8430967, -0.1477889, -2.42984, 0.8078431, 1, 0, 1,
-0.8406982, 0.8935069, -0.165214, 0.8, 1, 0, 1,
-0.8395625, -0.5929383, -1.908492, 0.7921569, 1, 0, 1,
-0.8356373, -0.601791, -2.651989, 0.7882353, 1, 0, 1,
-0.8269912, 0.1723286, -0.2009216, 0.7803922, 1, 0, 1,
-0.8247164, 0.1321043, -2.326799, 0.7764706, 1, 0, 1,
-0.8205452, 0.456695, -1.687734, 0.7686275, 1, 0, 1,
-0.8192462, -2.424414, -1.740037, 0.7647059, 1, 0, 1,
-0.8168898, 0.9367065, -0.3375308, 0.7568628, 1, 0, 1,
-0.8122504, 1.868698, -2.41189, 0.7529412, 1, 0, 1,
-0.8081566, -0.2978815, -3.21703, 0.7450981, 1, 0, 1,
-0.8071569, -0.1209141, -1.585265, 0.7411765, 1, 0, 1,
-0.8042586, 0.8213803, -1.122443, 0.7333333, 1, 0, 1,
-0.803916, -0.3756846, -3.589314, 0.7294118, 1, 0, 1,
-0.8018482, 0.4665288, -1.128803, 0.7215686, 1, 0, 1,
-0.8017492, -0.9040773, -1.897174, 0.7176471, 1, 0, 1,
-0.7994741, -0.3286853, -1.295053, 0.7098039, 1, 0, 1,
-0.78737, -1.591248, -1.312041, 0.7058824, 1, 0, 1,
-0.7775288, 0.6297693, -0.1076638, 0.6980392, 1, 0, 1,
-0.7744941, 0.1994117, -0.623747, 0.6901961, 1, 0, 1,
-0.7672293, 1.675502, -0.3198956, 0.6862745, 1, 0, 1,
-0.7609406, -0.07058043, -1.114288, 0.6784314, 1, 0, 1,
-0.74779, 1.134701, -1.239886, 0.6745098, 1, 0, 1,
-0.7438375, -0.1850626, -2.334946, 0.6666667, 1, 0, 1,
-0.7370391, -1.517519, -1.194345, 0.6627451, 1, 0, 1,
-0.7364653, 1.209717, -2.002667, 0.654902, 1, 0, 1,
-0.7363085, 0.3588096, -0.1703145, 0.6509804, 1, 0, 1,
-0.7355629, 1.931548, -0.123772, 0.6431373, 1, 0, 1,
-0.7343469, -0.554969, -3.40909, 0.6392157, 1, 0, 1,
-0.727676, -0.3650354, -3.204566, 0.6313726, 1, 0, 1,
-0.7226636, 0.3302283, -1.680003, 0.627451, 1, 0, 1,
-0.7168861, 0.3442021, 0.7606226, 0.6196079, 1, 0, 1,
-0.7148482, 0.09778394, -2.170976, 0.6156863, 1, 0, 1,
-0.7059714, 2.123363, 0.9477893, 0.6078432, 1, 0, 1,
-0.7047519, 0.7282887, -0.3104644, 0.6039216, 1, 0, 1,
-0.699926, 1.746524, 0.3413969, 0.5960785, 1, 0, 1,
-0.6992794, 0.5663891, -0.4530804, 0.5882353, 1, 0, 1,
-0.6927748, -0.3048078, -2.350521, 0.5843138, 1, 0, 1,
-0.6926282, 0.1966353, -2.029212, 0.5764706, 1, 0, 1,
-0.6913685, -1.112231, -2.354624, 0.572549, 1, 0, 1,
-0.6908888, 0.6005046, -0.1911509, 0.5647059, 1, 0, 1,
-0.6894132, -0.2842695, -4.286827, 0.5607843, 1, 0, 1,
-0.6892679, 1.026089, -1.860922, 0.5529412, 1, 0, 1,
-0.6890932, 0.02247682, -0.9826244, 0.5490196, 1, 0, 1,
-0.6871998, 0.1028672, -1.439968, 0.5411765, 1, 0, 1,
-0.6770727, 1.689928, -1.339969, 0.5372549, 1, 0, 1,
-0.675962, 1.230852, -1.999741, 0.5294118, 1, 0, 1,
-0.6722823, 2.50574, 1.173308, 0.5254902, 1, 0, 1,
-0.6618941, 0.09033132, -0.7614146, 0.5176471, 1, 0, 1,
-0.6567142, 1.959687, 0.2858385, 0.5137255, 1, 0, 1,
-0.65498, -1.228607, -3.277046, 0.5058824, 1, 0, 1,
-0.6515983, 0.3793887, -0.1038403, 0.5019608, 1, 0, 1,
-0.6513107, -0.7192109, -1.917699, 0.4941176, 1, 0, 1,
-0.6496776, -0.5369989, -2.240768, 0.4862745, 1, 0, 1,
-0.6490292, 0.5945928, 0.3887879, 0.4823529, 1, 0, 1,
-0.6482484, 0.4001841, -1.454238, 0.4745098, 1, 0, 1,
-0.64033, -0.1514527, -3.212544, 0.4705882, 1, 0, 1,
-0.6400101, 0.3987501, -0.8383575, 0.4627451, 1, 0, 1,
-0.6387638, -2.053579, -2.731242, 0.4588235, 1, 0, 1,
-0.6381596, 0.7592112, -0.286686, 0.4509804, 1, 0, 1,
-0.6358851, 0.006024514, -2.302345, 0.4470588, 1, 0, 1,
-0.6306706, -1.717641, -3.140493, 0.4392157, 1, 0, 1,
-0.6280669, 0.4287347, -1.344069, 0.4352941, 1, 0, 1,
-0.6196451, 0.504797, -0.5441428, 0.427451, 1, 0, 1,
-0.6195164, -0.8755022, -1.736729, 0.4235294, 1, 0, 1,
-0.6178144, -0.8192965, -3.1254, 0.4156863, 1, 0, 1,
-0.6150084, 0.1528898, -2.43554, 0.4117647, 1, 0, 1,
-0.6080987, 0.616785, -2.301914, 0.4039216, 1, 0, 1,
-0.607005, -1.246865, -3.140153, 0.3960784, 1, 0, 1,
-0.5982442, -0.5702184, -2.193793, 0.3921569, 1, 0, 1,
-0.5940617, -0.1735912, -1.851108, 0.3843137, 1, 0, 1,
-0.5883155, -0.1545166, -1.412089, 0.3803922, 1, 0, 1,
-0.578643, 0.5707622, -0.544344, 0.372549, 1, 0, 1,
-0.5785428, 1.050598, 0.09738387, 0.3686275, 1, 0, 1,
-0.5760851, 0.9399995, -0.2444347, 0.3607843, 1, 0, 1,
-0.5671803, -0.004824675, -3.980919, 0.3568628, 1, 0, 1,
-0.5660318, 0.2160832, -1.477959, 0.3490196, 1, 0, 1,
-0.5659217, -0.9390126, -2.822002, 0.345098, 1, 0, 1,
-0.5638492, 0.2127078, -0.6829537, 0.3372549, 1, 0, 1,
-0.5615613, 0.9162187, -1.539987, 0.3333333, 1, 0, 1,
-0.5612461, 0.02140415, -1.767918, 0.3254902, 1, 0, 1,
-0.560518, -0.00807991, -0.3639137, 0.3215686, 1, 0, 1,
-0.5588108, -0.3461992, -2.06897, 0.3137255, 1, 0, 1,
-0.5575411, 0.9126647, -1.999014, 0.3098039, 1, 0, 1,
-0.5561232, -0.3927279, -1.408975, 0.3019608, 1, 0, 1,
-0.5527819, -0.5473097, -1.72915, 0.2941177, 1, 0, 1,
-0.5520934, -0.5183868, -3.102036, 0.2901961, 1, 0, 1,
-0.5503395, 1.124862, -1.647489, 0.282353, 1, 0, 1,
-0.5499392, 0.1110863, -0.9108043, 0.2784314, 1, 0, 1,
-0.5467687, 0.5103104, -2.455233, 0.2705882, 1, 0, 1,
-0.5451158, 0.2071127, -3.153751, 0.2666667, 1, 0, 1,
-0.5299392, 0.8612581, -1.80212, 0.2588235, 1, 0, 1,
-0.5261444, 1.11714, -0.8787477, 0.254902, 1, 0, 1,
-0.5171044, 0.2603257, -1.53006, 0.2470588, 1, 0, 1,
-0.5161914, 0.5699295, 1.082349, 0.2431373, 1, 0, 1,
-0.5151565, 1.416944, 0.7214881, 0.2352941, 1, 0, 1,
-0.5137849, -2.516113, -3.716669, 0.2313726, 1, 0, 1,
-0.5121306, 0.01290206, -1.351145, 0.2235294, 1, 0, 1,
-0.5106635, -0.6985602, -1.629189, 0.2196078, 1, 0, 1,
-0.5094051, 1.76724, -0.2827225, 0.2117647, 1, 0, 1,
-0.5057018, -0.5180474, -1.981182, 0.2078431, 1, 0, 1,
-0.5047985, 0.1506115, -1.590912, 0.2, 1, 0, 1,
-0.5045974, 0.7406927, -1.120878, 0.1921569, 1, 0, 1,
-0.5035182, 0.9290904, 0.4371922, 0.1882353, 1, 0, 1,
-0.5009768, -0.03704031, -2.193795, 0.1803922, 1, 0, 1,
-0.4991824, 1.508032, -0.9781706, 0.1764706, 1, 0, 1,
-0.4960646, -0.1362732, -2.711259, 0.1686275, 1, 0, 1,
-0.4918823, -0.4697352, -1.589333, 0.1647059, 1, 0, 1,
-0.4910289, -0.255538, -1.381515, 0.1568628, 1, 0, 1,
-0.4875571, 1.183499, -1.333755, 0.1529412, 1, 0, 1,
-0.4777237, 0.9191422, -0.8398617, 0.145098, 1, 0, 1,
-0.4745872, -0.1872355, -0.03484271, 0.1411765, 1, 0, 1,
-0.4712901, -0.5565981, -3.833826, 0.1333333, 1, 0, 1,
-0.4708527, 2.37643, 0.8596473, 0.1294118, 1, 0, 1,
-0.4654675, 0.9795172, 0.1825316, 0.1215686, 1, 0, 1,
-0.4649494, 0.5157384, -0.4857087, 0.1176471, 1, 0, 1,
-0.4601477, -0.0939073, -1.77812, 0.1098039, 1, 0, 1,
-0.4587547, 0.988494, -1.727818, 0.1058824, 1, 0, 1,
-0.4509674, -1.269134, -4.967721, 0.09803922, 1, 0, 1,
-0.4432213, 0.8582467, 0.9558646, 0.09019608, 1, 0, 1,
-0.4420148, 0.7687073, 0.6918813, 0.08627451, 1, 0, 1,
-0.4401131, 0.8076385, -1.471336, 0.07843138, 1, 0, 1,
-0.4382222, -1.143593, -2.012444, 0.07450981, 1, 0, 1,
-0.4362471, 0.3094071, -1.128725, 0.06666667, 1, 0, 1,
-0.4343943, 1.233022, 1.764358, 0.0627451, 1, 0, 1,
-0.4323848, -0.8731458, -2.90623, 0.05490196, 1, 0, 1,
-0.4314657, 0.9829361, 0.844369, 0.05098039, 1, 0, 1,
-0.4305999, 0.6908979, 0.3143696, 0.04313726, 1, 0, 1,
-0.4246237, 0.03455782, -0.04060835, 0.03921569, 1, 0, 1,
-0.422848, 0.7475663, -0.03281332, 0.03137255, 1, 0, 1,
-0.4227637, -1.52624, -4.459934, 0.02745098, 1, 0, 1,
-0.4153598, 0.06707139, -4.080836, 0.01960784, 1, 0, 1,
-0.409764, 0.009119584, -0.5097603, 0.01568628, 1, 0, 1,
-0.4093915, 0.3778583, -0.9398458, 0.007843138, 1, 0, 1,
-0.3972735, -0.9052592, -2.010376, 0.003921569, 1, 0, 1,
-0.3942145, -1.16619, -0.4310794, 0, 1, 0.003921569, 1,
-0.3874447, -0.4319113, -0.7684853, 0, 1, 0.01176471, 1,
-0.3843942, -0.4112636, -2.044976, 0, 1, 0.01568628, 1,
-0.380038, -0.2240513, -1.772019, 0, 1, 0.02352941, 1,
-0.3790109, -0.8174879, -3.124284, 0, 1, 0.02745098, 1,
-0.3742526, 0.720066, 0.6238647, 0, 1, 0.03529412, 1,
-0.3702972, 0.4367719, 0.5534312, 0, 1, 0.03921569, 1,
-0.3696077, 0.7293289, 0.3445706, 0, 1, 0.04705882, 1,
-0.3695593, 1.080285, 1.472574, 0, 1, 0.05098039, 1,
-0.3634725, 2.751344, 1.855289, 0, 1, 0.05882353, 1,
-0.3611096, 0.695476, -2.753934, 0, 1, 0.0627451, 1,
-0.3608266, -0.7737535, -1.344806, 0, 1, 0.07058824, 1,
-0.3542816, -0.856456, -4.122319, 0, 1, 0.07450981, 1,
-0.3537455, -2.033207, -3.438603, 0, 1, 0.08235294, 1,
-0.3508567, -1.042228, -2.305321, 0, 1, 0.08627451, 1,
-0.3438639, 1.669991, -1.443322, 0, 1, 0.09411765, 1,
-0.3425415, -1.022463, -2.088218, 0, 1, 0.1019608, 1,
-0.3416739, 1.246227, -1.146568, 0, 1, 0.1058824, 1,
-0.3405794, 0.02446059, -1.001346, 0, 1, 0.1137255, 1,
-0.3401768, 0.5777295, -0.4764035, 0, 1, 0.1176471, 1,
-0.3320248, -0.1550987, -1.459251, 0, 1, 0.1254902, 1,
-0.320151, 1.335397, -0.4593943, 0, 1, 0.1294118, 1,
-0.3153995, -0.2643121, -3.034532, 0, 1, 0.1372549, 1,
-0.3144178, 0.1869068, -0.9101368, 0, 1, 0.1411765, 1,
-0.3117663, 1.974529, 1.302966, 0, 1, 0.1490196, 1,
-0.3109176, -0.3293828, -1.554044, 0, 1, 0.1529412, 1,
-0.3067031, -0.4044572, -2.85649, 0, 1, 0.1607843, 1,
-0.3043461, -0.7369744, -3.051372, 0, 1, 0.1647059, 1,
-0.3032575, 1.271742, -0.1923481, 0, 1, 0.172549, 1,
-0.3031114, 0.5384817, -0.6412361, 0, 1, 0.1764706, 1,
-0.3024634, 0.3405144, -2.333428, 0, 1, 0.1843137, 1,
-0.2991959, -0.4888471, -0.9524281, 0, 1, 0.1882353, 1,
-0.2856095, 0.0109651, -2.175176, 0, 1, 0.1960784, 1,
-0.2848784, -0.5981217, -3.206495, 0, 1, 0.2039216, 1,
-0.281862, 2.031349, 0.7157742, 0, 1, 0.2078431, 1,
-0.2818185, 0.4627506, 1.025422, 0, 1, 0.2156863, 1,
-0.2798227, -0.9818801, -2.210989, 0, 1, 0.2196078, 1,
-0.2770397, 1.104001, -0.5209522, 0, 1, 0.227451, 1,
-0.2695981, 1.051834, 0.8092525, 0, 1, 0.2313726, 1,
-0.2681209, 1.126176, 1.248034, 0, 1, 0.2392157, 1,
-0.2590664, -3.162108, -2.523679, 0, 1, 0.2431373, 1,
-0.2578516, 1.468937, -0.4272771, 0, 1, 0.2509804, 1,
-0.25772, 0.7091588, -0.8089173, 0, 1, 0.254902, 1,
-0.2548496, -1.163628, -2.998623, 0, 1, 0.2627451, 1,
-0.2527146, -0.2841941, -2.403959, 0, 1, 0.2666667, 1,
-0.2429334, -1.414731, -2.923149, 0, 1, 0.2745098, 1,
-0.2429099, 0.3641188, -1.208542, 0, 1, 0.2784314, 1,
-0.2423281, 0.7376738, -0.7975841, 0, 1, 0.2862745, 1,
-0.2388388, -0.2327317, -2.450159, 0, 1, 0.2901961, 1,
-0.2331859, 0.1693071, -0.7462333, 0, 1, 0.2980392, 1,
-0.2325334, -1.374852, -2.764135, 0, 1, 0.3058824, 1,
-0.2313903, 0.5326146, -0.397268, 0, 1, 0.3098039, 1,
-0.2310501, -2.030285, -4.325599, 0, 1, 0.3176471, 1,
-0.2272711, -1.39815, -3.474141, 0, 1, 0.3215686, 1,
-0.2265845, 1.126156, -0.1480276, 0, 1, 0.3294118, 1,
-0.2251457, 1.26428, -2.83491, 0, 1, 0.3333333, 1,
-0.2235778, -0.6644971, -2.777694, 0, 1, 0.3411765, 1,
-0.2216306, -1.275404, -2.870822, 0, 1, 0.345098, 1,
-0.2209619, -0.4860588, -3.109405, 0, 1, 0.3529412, 1,
-0.219901, 0.5698468, -1.275196, 0, 1, 0.3568628, 1,
-0.2142155, -0.4260736, -3.838624, 0, 1, 0.3647059, 1,
-0.2119765, -1.225293, -4.245179, 0, 1, 0.3686275, 1,
-0.2098886, -0.9283047, -0.8634797, 0, 1, 0.3764706, 1,
-0.2081111, -0.303142, -2.674481, 0, 1, 0.3803922, 1,
-0.2066234, 0.2172753, -0.04512331, 0, 1, 0.3882353, 1,
-0.2058162, 0.9374186, -2.115723, 0, 1, 0.3921569, 1,
-0.1975596, -1.346395, -2.294778, 0, 1, 0.4, 1,
-0.1971606, -0.7756029, -2.906049, 0, 1, 0.4078431, 1,
-0.1964771, 0.885362, -1.658689, 0, 1, 0.4117647, 1,
-0.1963964, -0.8268541, -1.989017, 0, 1, 0.4196078, 1,
-0.1933956, -1.92896, -3.949117, 0, 1, 0.4235294, 1,
-0.1917146, 0.01951781, -0.8547245, 0, 1, 0.4313726, 1,
-0.190738, 2.196521, -0.04587274, 0, 1, 0.4352941, 1,
-0.1802553, 0.9078327, 1.220655, 0, 1, 0.4431373, 1,
-0.1777377, -0.160524, -0.959253, 0, 1, 0.4470588, 1,
-0.1745888, 0.363379, -0.5309585, 0, 1, 0.454902, 1,
-0.1738511, 1.115051, -1.917387, 0, 1, 0.4588235, 1,
-0.1719496, 0.01628596, -1.894046, 0, 1, 0.4666667, 1,
-0.1697436, 0.6839793, 0.6568915, 0, 1, 0.4705882, 1,
-0.1619066, 0.6777878, -1.419108, 0, 1, 0.4784314, 1,
-0.161249, 0.3148653, -1.467601, 0, 1, 0.4823529, 1,
-0.1602909, -0.1296812, -2.391456, 0, 1, 0.4901961, 1,
-0.1571575, -2.776505, -4.580891, 0, 1, 0.4941176, 1,
-0.1521443, -0.6601445, -3.376278, 0, 1, 0.5019608, 1,
-0.1520946, 0.3045054, -0.1046609, 0, 1, 0.509804, 1,
-0.1489705, 1.769208, 0.6366238, 0, 1, 0.5137255, 1,
-0.1460027, -0.7706051, -3.709671, 0, 1, 0.5215687, 1,
-0.1310023, -0.1178068, -1.988309, 0, 1, 0.5254902, 1,
-0.1304293, -1.503748, -3.130133, 0, 1, 0.5333334, 1,
-0.1275615, -1.108244, -3.807662, 0, 1, 0.5372549, 1,
-0.1270716, -1.416262, -3.243804, 0, 1, 0.5450981, 1,
-0.1204479, -1.582067, -2.725514, 0, 1, 0.5490196, 1,
-0.1155365, -0.9778612, -2.752387, 0, 1, 0.5568628, 1,
-0.1152503, -0.4752534, -4.616419, 0, 1, 0.5607843, 1,
-0.1116424, -0.8559231, -4.895485, 0, 1, 0.5686275, 1,
-0.1054529, -0.3687342, -2.842754, 0, 1, 0.572549, 1,
-0.1049201, 0.607492, 0.8673529, 0, 1, 0.5803922, 1,
-0.09502149, 0.6725318, -0.6458096, 0, 1, 0.5843138, 1,
-0.09369427, 1.614242, -0.9885255, 0, 1, 0.5921569, 1,
-0.09189806, -0.1268042, -2.059158, 0, 1, 0.5960785, 1,
-0.09151556, 1.4634, -1.052834, 0, 1, 0.6039216, 1,
-0.08915188, 0.7573616, 0.2511296, 0, 1, 0.6117647, 1,
-0.08592139, -0.6055205, -4.354844, 0, 1, 0.6156863, 1,
-0.08340511, -0.1866502, -2.372213, 0, 1, 0.6235294, 1,
-0.08074211, 0.2854294, 0.08710484, 0, 1, 0.627451, 1,
-0.07500711, 0.1298922, -1.095716, 0, 1, 0.6352941, 1,
-0.07499444, 0.2902646, 0.006749565, 0, 1, 0.6392157, 1,
-0.0722677, 0.1067779, 0.3221781, 0, 1, 0.6470588, 1,
-0.06876969, 1.141385, 1.075057, 0, 1, 0.6509804, 1,
-0.06609701, -2.306123, -4.289462, 0, 1, 0.6588235, 1,
-0.06042515, 0.1302581, -1.912519, 0, 1, 0.6627451, 1,
-0.05850266, -0.7216242, -1.455801, 0, 1, 0.6705883, 1,
-0.05641345, 0.8160967, 0.4650152, 0, 1, 0.6745098, 1,
-0.05250366, -0.9449502, -3.133216, 0, 1, 0.682353, 1,
-0.04545033, 1.122917, 0.7419262, 0, 1, 0.6862745, 1,
-0.04535006, 0.2773272, -0.4343462, 0, 1, 0.6941177, 1,
-0.04110786, 0.7025126, 0.07127045, 0, 1, 0.7019608, 1,
-0.03854221, 0.2316137, 0.633698, 0, 1, 0.7058824, 1,
-0.03759592, -0.7991703, -4.197674, 0, 1, 0.7137255, 1,
-0.03165168, 0.2989403, 0.6684853, 0, 1, 0.7176471, 1,
-0.02981952, -1.171002, -3.201748, 0, 1, 0.7254902, 1,
-0.0285893, 0.6920634, 0.1281303, 0, 1, 0.7294118, 1,
-0.02497805, 0.3782627, -0.7629507, 0, 1, 0.7372549, 1,
-0.02222471, 0.08245316, -1.154317, 0, 1, 0.7411765, 1,
-0.02096038, 0.8613534, -1.306629, 0, 1, 0.7490196, 1,
-0.02092848, 0.7119508, 1.841146, 0, 1, 0.7529412, 1,
-0.01968516, 1.295874, -1.750365, 0, 1, 0.7607843, 1,
-0.01862765, 0.008810161, 0.9157394, 0, 1, 0.7647059, 1,
-0.01586495, -0.6791549, -3.636895, 0, 1, 0.772549, 1,
-0.01339732, 0.1052641, -0.7096563, 0, 1, 0.7764706, 1,
-0.01242658, 1.578842, 0.9461796, 0, 1, 0.7843137, 1,
-0.01044441, 0.01326468, -0.1320608, 0, 1, 0.7882353, 1,
-0.006733538, 0.8102429, 1.268747, 0, 1, 0.7960784, 1,
-0.005259906, -0.04257982, -4.971271, 0, 1, 0.8039216, 1,
-0.004562152, 0.3416536, 0.4775745, 0, 1, 0.8078431, 1,
-0.002561429, 1.050567, -0.001520347, 0, 1, 0.8156863, 1,
0.0007868803, 1.00013, 1.569915, 0, 1, 0.8196079, 1,
0.000856796, -0.384457, 2.96459, 0, 1, 0.827451, 1,
0.004297223, 0.590256, 0.2572953, 0, 1, 0.8313726, 1,
0.006151431, -0.7365314, 3.822299, 0, 1, 0.8392157, 1,
0.007536781, -0.06918531, 3.659463, 0, 1, 0.8431373, 1,
0.007840627, -0.1317368, 4.341965, 0, 1, 0.8509804, 1,
0.008870942, -0.04777494, 3.626801, 0, 1, 0.854902, 1,
0.009214791, -1.837294, 2.329269, 0, 1, 0.8627451, 1,
0.01891151, 0.4427311, 0.03839685, 0, 1, 0.8666667, 1,
0.02027574, 0.1904246, 1.496966, 0, 1, 0.8745098, 1,
0.0313199, 1.867491, -0.5533119, 0, 1, 0.8784314, 1,
0.03783849, 0.995609, -0.1920787, 0, 1, 0.8862745, 1,
0.04292747, 1.30742, 0.1986707, 0, 1, 0.8901961, 1,
0.0522498, -0.7131715, 1.175167, 0, 1, 0.8980392, 1,
0.05286622, 0.7775816, -0.4312153, 0, 1, 0.9058824, 1,
0.05368112, -0.05837715, 1.718086, 0, 1, 0.9098039, 1,
0.05370582, -1.194275, 2.884257, 0, 1, 0.9176471, 1,
0.05375712, 0.01607385, 0.9219489, 0, 1, 0.9215686, 1,
0.05534402, 1.741479, 0.0603626, 0, 1, 0.9294118, 1,
0.05632936, 1.52036, -0.8246711, 0, 1, 0.9333333, 1,
0.0576417, -1.839487, 4.254107, 0, 1, 0.9411765, 1,
0.0603099, -0.5680301, 3.868056, 0, 1, 0.945098, 1,
0.06051749, -1.450537, 4.674558, 0, 1, 0.9529412, 1,
0.06518716, -0.02004055, 3.037731, 0, 1, 0.9568627, 1,
0.06598669, 2.179338, -0.3932637, 0, 1, 0.9647059, 1,
0.06976642, -0.9775963, 2.918866, 0, 1, 0.9686275, 1,
0.07073002, -0.3794883, 2.360594, 0, 1, 0.9764706, 1,
0.07745426, -2.644081, 3.976803, 0, 1, 0.9803922, 1,
0.07812414, 0.6486311, 2.011209, 0, 1, 0.9882353, 1,
0.07967507, -0.110007, 2.556597, 0, 1, 0.9921569, 1,
0.08070853, 1.237621, -0.518859, 0, 1, 1, 1,
0.08314401, -0.6663753, 2.76228, 0, 0.9921569, 1, 1,
0.08929365, 0.3975823, 1.632804, 0, 0.9882353, 1, 1,
0.09010442, 0.1897483, 1.097597, 0, 0.9803922, 1, 1,
0.09013575, -0.4965362, 2.996587, 0, 0.9764706, 1, 1,
0.1002676, -0.1979635, 3.154738, 0, 0.9686275, 1, 1,
0.1003689, -0.6332952, 3.616705, 0, 0.9647059, 1, 1,
0.1005702, -1.011758, 2.046561, 0, 0.9568627, 1, 1,
0.1011727, -0.4365569, 2.287966, 0, 0.9529412, 1, 1,
0.1023796, 1.009578, 0.921774, 0, 0.945098, 1, 1,
0.1026578, -0.0436045, 3.142467, 0, 0.9411765, 1, 1,
0.108175, -1.733991, 2.86272, 0, 0.9333333, 1, 1,
0.1088562, 0.2033889, -0.8884044, 0, 0.9294118, 1, 1,
0.1095543, 0.2161956, 3.304946, 0, 0.9215686, 1, 1,
0.1101617, -0.6458369, 2.473662, 0, 0.9176471, 1, 1,
0.1106948, -0.7279128, 2.207353, 0, 0.9098039, 1, 1,
0.1126691, -0.577429, 2.60478, 0, 0.9058824, 1, 1,
0.1127606, 2.435018, 0.6386202, 0, 0.8980392, 1, 1,
0.1132289, 1.2598, -0.6077753, 0, 0.8901961, 1, 1,
0.1138954, -0.3327236, 3.215302, 0, 0.8862745, 1, 1,
0.1170916, -2.300845, 3.488291, 0, 0.8784314, 1, 1,
0.1175607, -0.2746975, 2.439599, 0, 0.8745098, 1, 1,
0.1198895, 0.5348209, 0.4426753, 0, 0.8666667, 1, 1,
0.1219855, 2.228157, 0.03419328, 0, 0.8627451, 1, 1,
0.1239698, 0.008929382, 1.055338, 0, 0.854902, 1, 1,
0.1312252, -1.079334, 3.051984, 0, 0.8509804, 1, 1,
0.1318042, -0.6781707, 1.866838, 0, 0.8431373, 1, 1,
0.1337527, 0.490373, 0.471316, 0, 0.8392157, 1, 1,
0.1350678, 0.6984066, 0.1301129, 0, 0.8313726, 1, 1,
0.1359318, -0.3460666, 2.329602, 0, 0.827451, 1, 1,
0.1390802, -0.1954489, 2.418013, 0, 0.8196079, 1, 1,
0.1553638, 0.9192104, 1.22471, 0, 0.8156863, 1, 1,
0.1567101, -0.04554235, 1.154424, 0, 0.8078431, 1, 1,
0.1616216, 1.052688, 0.7468894, 0, 0.8039216, 1, 1,
0.1619167, -1.030963, 4.195311, 0, 0.7960784, 1, 1,
0.1625936, 0.6497599, 0.5415007, 0, 0.7882353, 1, 1,
0.1640636, 1.565316, -1.283303, 0, 0.7843137, 1, 1,
0.1644024, -1.309876, 3.993029, 0, 0.7764706, 1, 1,
0.164923, 0.6767845, -1.361623, 0, 0.772549, 1, 1,
0.1661495, -0.04580986, 3.076562, 0, 0.7647059, 1, 1,
0.1676001, -1.157651, 2.976619, 0, 0.7607843, 1, 1,
0.1712218, -0.3327655, 2.752784, 0, 0.7529412, 1, 1,
0.1727889, 1.053506, -1.309575, 0, 0.7490196, 1, 1,
0.1731367, -0.4881934, 4.168316, 0, 0.7411765, 1, 1,
0.1816541, 1.543687, -0.8854337, 0, 0.7372549, 1, 1,
0.1830647, -1.684495, 2.397042, 0, 0.7294118, 1, 1,
0.1835432, -0.9496164, 2.255283, 0, 0.7254902, 1, 1,
0.184925, 1.563224, -0.1187907, 0, 0.7176471, 1, 1,
0.1864275, 0.8924535, 0.01537677, 0, 0.7137255, 1, 1,
0.1873164, -0.08421803, 1.976879, 0, 0.7058824, 1, 1,
0.1876566, 1.103302, -1.259434, 0, 0.6980392, 1, 1,
0.187797, -0.2707639, 1.75254, 0, 0.6941177, 1, 1,
0.1913781, -1.339491, 3.394441, 0, 0.6862745, 1, 1,
0.1945775, 0.1574742, 2.026349, 0, 0.682353, 1, 1,
0.1950883, 1.43264, 1.525365, 0, 0.6745098, 1, 1,
0.1979278, 1.745818, -1.223772, 0, 0.6705883, 1, 1,
0.2032058, 0.9310611, 0.4170451, 0, 0.6627451, 1, 1,
0.2037951, -1.775709, 3.394241, 0, 0.6588235, 1, 1,
0.2070029, 0.09785058, -0.2264581, 0, 0.6509804, 1, 1,
0.2097154, 1.265316, 0.3390198, 0, 0.6470588, 1, 1,
0.2168371, 0.6626635, -1.446166, 0, 0.6392157, 1, 1,
0.2223467, 0.7765427, -0.9787492, 0, 0.6352941, 1, 1,
0.2248688, 1.342559, 0.7561367, 0, 0.627451, 1, 1,
0.2260747, 1.069248, 1.484509, 0, 0.6235294, 1, 1,
0.22912, -0.903363, 2.94203, 0, 0.6156863, 1, 1,
0.2299573, -0.1589787, 2.759238, 0, 0.6117647, 1, 1,
0.2309045, -0.2834623, 2.446667, 0, 0.6039216, 1, 1,
0.2331879, 0.7245862, 0.7808883, 0, 0.5960785, 1, 1,
0.234663, 1.893386, 1.263184, 0, 0.5921569, 1, 1,
0.2404867, 0.3260415, -0.1269753, 0, 0.5843138, 1, 1,
0.2426142, -1.228965, 1.417239, 0, 0.5803922, 1, 1,
0.2482586, -1.94159, 3.251772, 0, 0.572549, 1, 1,
0.2518588, 0.9637408, 0.4316048, 0, 0.5686275, 1, 1,
0.2531763, 2.054056, -1.008583, 0, 0.5607843, 1, 1,
0.2538289, 1.108562, 1.401953, 0, 0.5568628, 1, 1,
0.2568137, 0.2614527, -0.1217806, 0, 0.5490196, 1, 1,
0.257029, 0.4114396, 0.8763514, 0, 0.5450981, 1, 1,
0.2594462, -0.6376485, 3.031831, 0, 0.5372549, 1, 1,
0.2630411, 0.1282777, 1.56817, 0, 0.5333334, 1, 1,
0.2656941, 1.640402, 0.5970073, 0, 0.5254902, 1, 1,
0.2657408, -0.8198756, 2.956359, 0, 0.5215687, 1, 1,
0.2659665, -1.468452, 4.001242, 0, 0.5137255, 1, 1,
0.2661467, -0.922416, 3.055779, 0, 0.509804, 1, 1,
0.2690194, -1.411459, 3.041723, 0, 0.5019608, 1, 1,
0.2725422, 0.357745, 0.7344429, 0, 0.4941176, 1, 1,
0.2753738, -2.492006, 2.03362, 0, 0.4901961, 1, 1,
0.2769198, 0.6172426, 0.1511335, 0, 0.4823529, 1, 1,
0.2769368, 0.05426354, 1.779702, 0, 0.4784314, 1, 1,
0.2810759, 2.239183, -0.938293, 0, 0.4705882, 1, 1,
0.2836054, -0.005102912, 2.091753, 0, 0.4666667, 1, 1,
0.2877325, -1.077597, 2.752054, 0, 0.4588235, 1, 1,
0.2877943, -0.7824476, 3.331394, 0, 0.454902, 1, 1,
0.2884866, -1.997043, 1.699045, 0, 0.4470588, 1, 1,
0.2917686, 0.6475948, -0.9873232, 0, 0.4431373, 1, 1,
0.2946382, -0.7584062, 3.296604, 0, 0.4352941, 1, 1,
0.2951111, 1.010437, -0.2665465, 0, 0.4313726, 1, 1,
0.2954788, -1.012045, 2.034835, 0, 0.4235294, 1, 1,
0.2990718, 0.3292911, 0.4129905, 0, 0.4196078, 1, 1,
0.3004812, 1.069913, -0.6009182, 0, 0.4117647, 1, 1,
0.3048195, -1.469842, 2.858713, 0, 0.4078431, 1, 1,
0.307616, -0.1562178, 1.501732, 0, 0.4, 1, 1,
0.3104862, -1.550955, 4.190998, 0, 0.3921569, 1, 1,
0.3133287, -0.5987936, 1.464622, 0, 0.3882353, 1, 1,
0.3143934, -1.727409, 2.605222, 0, 0.3803922, 1, 1,
0.3168918, 0.6288598, 2.123014, 0, 0.3764706, 1, 1,
0.3208475, -0.2384012, 2.008572, 0, 0.3686275, 1, 1,
0.3217548, 0.5916954, -0.3230873, 0, 0.3647059, 1, 1,
0.3223616, 0.3841103, 1.299325, 0, 0.3568628, 1, 1,
0.3241648, -0.02324417, 3.145627, 0, 0.3529412, 1, 1,
0.3294439, -1.766763, 2.56686, 0, 0.345098, 1, 1,
0.3306411, -0.3390313, 1.994522, 0, 0.3411765, 1, 1,
0.3327449, 1.601896, -0.4611495, 0, 0.3333333, 1, 1,
0.3332392, 0.2828433, 1.8784, 0, 0.3294118, 1, 1,
0.3392946, 0.06260628, 1.539153, 0, 0.3215686, 1, 1,
0.3399895, 0.2302188, -0.1536283, 0, 0.3176471, 1, 1,
0.3415934, -1.281536, 3.875691, 0, 0.3098039, 1, 1,
0.342047, -0.05692697, 0.457872, 0, 0.3058824, 1, 1,
0.3434669, -0.9422062, 3.517845, 0, 0.2980392, 1, 1,
0.3451074, -0.8451484, 3.507345, 0, 0.2901961, 1, 1,
0.3523814, -1.090874, 2.704928, 0, 0.2862745, 1, 1,
0.357501, -0.8727859, 3.30759, 0, 0.2784314, 1, 1,
0.3591737, -0.9611964, 3.596679, 0, 0.2745098, 1, 1,
0.3650257, -1.937973, 4.222275, 0, 0.2666667, 1, 1,
0.3654808, 0.7068914, 0.8764067, 0, 0.2627451, 1, 1,
0.3741659, -0.5484453, 2.873455, 0, 0.254902, 1, 1,
0.3839442, 0.9112859, -0.1053127, 0, 0.2509804, 1, 1,
0.3840706, 0.06772961, 1.060684, 0, 0.2431373, 1, 1,
0.384853, -0.1239395, 2.496021, 0, 0.2392157, 1, 1,
0.3863871, -1.02854, 2.056741, 0, 0.2313726, 1, 1,
0.3883084, 1.340282, -0.3199731, 0, 0.227451, 1, 1,
0.389399, 0.5236986, 0.4053376, 0, 0.2196078, 1, 1,
0.3905591, 0.1334428, 1.219195, 0, 0.2156863, 1, 1,
0.3932936, -0.9046817, 1.855989, 0, 0.2078431, 1, 1,
0.3950468, -0.227909, 2.522774, 0, 0.2039216, 1, 1,
0.3951596, 1.042435, 0.624559, 0, 0.1960784, 1, 1,
0.4019922, -1.288007, 1.480227, 0, 0.1882353, 1, 1,
0.4068592, -1.2079, 3.215485, 0, 0.1843137, 1, 1,
0.4125488, 1.045268, -1.477708, 0, 0.1764706, 1, 1,
0.4158554, -0.1067093, 2.175868, 0, 0.172549, 1, 1,
0.4205137, 0.8497775, 0.4657141, 0, 0.1647059, 1, 1,
0.420582, -0.6132465, 2.767429, 0, 0.1607843, 1, 1,
0.4242732, 0.5371251, -0.06125884, 0, 0.1529412, 1, 1,
0.4258699, 1.629916, -0.6397696, 0, 0.1490196, 1, 1,
0.4366195, -0.1517163, 2.029605, 0, 0.1411765, 1, 1,
0.4415334, 1.510739, 0.621797, 0, 0.1372549, 1, 1,
0.4464542, -0.9448866, 1.32658, 0, 0.1294118, 1, 1,
0.4501257, -0.9665718, 0.7477087, 0, 0.1254902, 1, 1,
0.4637479, -0.9804147, 3.074458, 0, 0.1176471, 1, 1,
0.4657152, 3.076379, -0.147966, 0, 0.1137255, 1, 1,
0.4666594, 0.6612458, -0.3674227, 0, 0.1058824, 1, 1,
0.4673101, 0.4854147, 1.167657, 0, 0.09803922, 1, 1,
0.4693094, 0.5190492, -0.08065536, 0, 0.09411765, 1, 1,
0.4777913, -0.4341966, 2.806193, 0, 0.08627451, 1, 1,
0.4819143, -0.4382896, 3.38131, 0, 0.08235294, 1, 1,
0.4968067, -0.4842994, 1.610118, 0, 0.07450981, 1, 1,
0.504798, 1.751923, -0.03308183, 0, 0.07058824, 1, 1,
0.5050907, 1.00778, -1.266621, 0, 0.0627451, 1, 1,
0.5112954, 0.9509285, 0.08493895, 0, 0.05882353, 1, 1,
0.5192678, 0.9511898, 1.877436, 0, 0.05098039, 1, 1,
0.5196593, -0.3468872, 2.538552, 0, 0.04705882, 1, 1,
0.5210037, 0.2637559, 0.9817807, 0, 0.03921569, 1, 1,
0.5230317, 0.5987158, -0.2389987, 0, 0.03529412, 1, 1,
0.527846, 1.902077, 0.568377, 0, 0.02745098, 1, 1,
0.5292161, -0.1949313, 2.468422, 0, 0.02352941, 1, 1,
0.5298512, 1.433685, 0.02322559, 0, 0.01568628, 1, 1,
0.5300879, -0.2545874, 3.165802, 0, 0.01176471, 1, 1,
0.5351895, 0.8865214, 2.597241, 0, 0.003921569, 1, 1,
0.5382949, -0.8903844, 3.628493, 0.003921569, 0, 1, 1,
0.5393059, -0.848716, 1.001995, 0.007843138, 0, 1, 1,
0.5397069, 0.9090999, 2.019685, 0.01568628, 0, 1, 1,
0.5413007, -0.08217259, 2.122061, 0.01960784, 0, 1, 1,
0.5429578, -0.9945289, 3.334347, 0.02745098, 0, 1, 1,
0.5477377, -1.402885, 3.303123, 0.03137255, 0, 1, 1,
0.5497261, -1.958178, 2.145988, 0.03921569, 0, 1, 1,
0.5504352, 0.884919, 0.01975134, 0.04313726, 0, 1, 1,
0.5506506, -0.3592912, 3.841157, 0.05098039, 0, 1, 1,
0.5529278, -0.1418727, 2.617547, 0.05490196, 0, 1, 1,
0.5545666, -0.46412, 1.875656, 0.0627451, 0, 1, 1,
0.5629199, -1.858334, 4.381222, 0.06666667, 0, 1, 1,
0.5655172, -1.738395, 3.635411, 0.07450981, 0, 1, 1,
0.5656563, 0.1526809, 1.133158, 0.07843138, 0, 1, 1,
0.571142, -0.2820471, 2.863962, 0.08627451, 0, 1, 1,
0.5716597, 0.4601116, 0.8984616, 0.09019608, 0, 1, 1,
0.5756434, 0.7354671, 0.5260736, 0.09803922, 0, 1, 1,
0.5797444, -0.07667246, 1.608476, 0.1058824, 0, 1, 1,
0.5835152, 1.365966, 1.064021, 0.1098039, 0, 1, 1,
0.5867446, -0.4704476, 2.490487, 0.1176471, 0, 1, 1,
0.587711, 0.6535801, 1.045991, 0.1215686, 0, 1, 1,
0.5883506, -1.534946, 2.564112, 0.1294118, 0, 1, 1,
0.593356, -0.5362394, 3.090164, 0.1333333, 0, 1, 1,
0.5968893, -0.8556052, 3.410112, 0.1411765, 0, 1, 1,
0.5991055, 0.03034355, 1.761919, 0.145098, 0, 1, 1,
0.599696, 1.005736, 1.13042, 0.1529412, 0, 1, 1,
0.6000157, 0.02739253, 1.368342, 0.1568628, 0, 1, 1,
0.6032364, -0.713941, 3.222196, 0.1647059, 0, 1, 1,
0.6043587, -0.4121426, 1.76902, 0.1686275, 0, 1, 1,
0.6058301, 0.2038405, -1.029628, 0.1764706, 0, 1, 1,
0.6100094, -0.1442794, 2.833962, 0.1803922, 0, 1, 1,
0.6103508, -0.7823633, 2.21036, 0.1882353, 0, 1, 1,
0.6125955, -0.1698228, 2.472174, 0.1921569, 0, 1, 1,
0.6126481, -0.3222965, 1.129265, 0.2, 0, 1, 1,
0.6195215, -0.8676107, 2.815698, 0.2078431, 0, 1, 1,
0.6235017, -1.749086, 3.559456, 0.2117647, 0, 1, 1,
0.6293219, -1.385217, 2.202104, 0.2196078, 0, 1, 1,
0.6358054, 0.2363914, 0.5303284, 0.2235294, 0, 1, 1,
0.6362264, 0.4476045, 1.980469, 0.2313726, 0, 1, 1,
0.6363379, -1.53968, 2.037923, 0.2352941, 0, 1, 1,
0.6383343, -0.4863106, 2.391217, 0.2431373, 0, 1, 1,
0.6407767, -0.06635025, -0.1027364, 0.2470588, 0, 1, 1,
0.6409706, 0.2431605, 1.197983, 0.254902, 0, 1, 1,
0.6414006, 2.079491, -0.6541049, 0.2588235, 0, 1, 1,
0.6422226, -0.1391532, 2.161959, 0.2666667, 0, 1, 1,
0.6441476, -0.4300128, 3.503708, 0.2705882, 0, 1, 1,
0.6445284, 0.3044673, 0.8489971, 0.2784314, 0, 1, 1,
0.6548989, 0.785486, 1.469161, 0.282353, 0, 1, 1,
0.6556663, -2.058323, 3.105255, 0.2901961, 0, 1, 1,
0.6567643, -0.6467092, 0.950832, 0.2941177, 0, 1, 1,
0.6578979, -0.5540832, 1.460978, 0.3019608, 0, 1, 1,
0.6619706, 1.540943, -0.3310324, 0.3098039, 0, 1, 1,
0.6758535, -1.197197, 2.951608, 0.3137255, 0, 1, 1,
0.6793602, -0.2506492, 1.323433, 0.3215686, 0, 1, 1,
0.6801356, -0.3082927, 0.08899955, 0.3254902, 0, 1, 1,
0.6807017, 0.8737162, 0.1343962, 0.3333333, 0, 1, 1,
0.681398, 0.971361, 0.8001126, 0.3372549, 0, 1, 1,
0.6860948, 1.331496, 2.521084, 0.345098, 0, 1, 1,
0.6956686, -0.7316916, 1.660467, 0.3490196, 0, 1, 1,
0.7005463, -0.7871851, 1.915637, 0.3568628, 0, 1, 1,
0.7011942, 0.4174955, 0.8856282, 0.3607843, 0, 1, 1,
0.7038302, 2.300995, -0.4555288, 0.3686275, 0, 1, 1,
0.7044425, 1.754827, -0.6008422, 0.372549, 0, 1, 1,
0.7056891, -0.1733827, 3.157934, 0.3803922, 0, 1, 1,
0.7060494, -0.1781648, 0.7372958, 0.3843137, 0, 1, 1,
0.7124954, -1.682301, 3.899082, 0.3921569, 0, 1, 1,
0.7125859, 0.6193888, 1.951043, 0.3960784, 0, 1, 1,
0.7133839, 2.37205, -1.037101, 0.4039216, 0, 1, 1,
0.7148251, -2.043742, 2.600586, 0.4117647, 0, 1, 1,
0.7151142, -0.07194313, 2.095878, 0.4156863, 0, 1, 1,
0.7162374, 0.3960685, 0.5701304, 0.4235294, 0, 1, 1,
0.7176394, -1.036106, 3.647574, 0.427451, 0, 1, 1,
0.7199473, 0.4877415, 1.958663, 0.4352941, 0, 1, 1,
0.7239496, 0.5510712, 1.029423, 0.4392157, 0, 1, 1,
0.7254897, 1.27818, -0.446541, 0.4470588, 0, 1, 1,
0.7270808, 0.9479592, 1.492707, 0.4509804, 0, 1, 1,
0.7292146, -0.1310946, 1.707747, 0.4588235, 0, 1, 1,
0.7334752, 0.2619171, -0.964445, 0.4627451, 0, 1, 1,
0.7335677, 1.172942, -1.561506, 0.4705882, 0, 1, 1,
0.7356885, -0.6363654, 0.9140756, 0.4745098, 0, 1, 1,
0.7372085, -1.132242, 3.01099, 0.4823529, 0, 1, 1,
0.7379905, -0.008094186, 1.485971, 0.4862745, 0, 1, 1,
0.738039, 1.002954, 0.3624293, 0.4941176, 0, 1, 1,
0.7404553, 1.467545, 0.1414267, 0.5019608, 0, 1, 1,
0.7427827, -1.60797, 1.300759, 0.5058824, 0, 1, 1,
0.7567453, 0.156064, 1.752073, 0.5137255, 0, 1, 1,
0.7580761, -0.9205792, 2.09474, 0.5176471, 0, 1, 1,
0.7597045, -0.2528608, 1.833807, 0.5254902, 0, 1, 1,
0.7703465, 0.08865787, 0.7143466, 0.5294118, 0, 1, 1,
0.7721962, 0.6059325, -0.4872465, 0.5372549, 0, 1, 1,
0.7732137, -0.2670168, 0.5124026, 0.5411765, 0, 1, 1,
0.7738209, -0.3188851, 2.015877, 0.5490196, 0, 1, 1,
0.7751692, -0.6000699, 1.996534, 0.5529412, 0, 1, 1,
0.7846575, -0.6204825, 3.400191, 0.5607843, 0, 1, 1,
0.7881844, 2.759041, 1.012405, 0.5647059, 0, 1, 1,
0.7885084, -0.5859693, 2.842344, 0.572549, 0, 1, 1,
0.7890652, 0.03863774, 3.172364, 0.5764706, 0, 1, 1,
0.7941993, 0.6769288, 0.4593787, 0.5843138, 0, 1, 1,
0.7947399, -0.7131968, 1.25765, 0.5882353, 0, 1, 1,
0.7960992, -1.648459, 1.996974, 0.5960785, 0, 1, 1,
0.7984994, -1.310029, 0.3615734, 0.6039216, 0, 1, 1,
0.8045907, 1.715104, 1.084901, 0.6078432, 0, 1, 1,
0.8086479, 1.077813, 2.013001, 0.6156863, 0, 1, 1,
0.8108557, -0.1217791, 0.4442803, 0.6196079, 0, 1, 1,
0.813086, -0.2776945, 1.025738, 0.627451, 0, 1, 1,
0.8308437, -0.608336, 0.5792203, 0.6313726, 0, 1, 1,
0.8407623, 0.5102159, 0.7505641, 0.6392157, 0, 1, 1,
0.8495675, 0.568821, 0.2681105, 0.6431373, 0, 1, 1,
0.85381, 0.7673599, 1.548961, 0.6509804, 0, 1, 1,
0.8547253, 1.605899, 1.387245, 0.654902, 0, 1, 1,
0.8550916, 1.459678, 0.06272293, 0.6627451, 0, 1, 1,
0.8566198, -0.1125015, 1.482623, 0.6666667, 0, 1, 1,
0.8593826, -2.102195, 2.708786, 0.6745098, 0, 1, 1,
0.8598172, -0.1456531, 0.7845669, 0.6784314, 0, 1, 1,
0.8639973, -0.6119847, 3.300673, 0.6862745, 0, 1, 1,
0.865693, 0.3114198, 0.1946466, 0.6901961, 0, 1, 1,
0.8698308, 0.1768209, 0.9489013, 0.6980392, 0, 1, 1,
0.8746243, 0.5243449, 2.134162, 0.7058824, 0, 1, 1,
0.8761305, 0.8567945, 0.4906496, 0.7098039, 0, 1, 1,
0.8782661, 1.7018, -0.002908792, 0.7176471, 0, 1, 1,
0.886908, -0.2750338, 1.970184, 0.7215686, 0, 1, 1,
0.8877772, 0.6194602, 1.475904, 0.7294118, 0, 1, 1,
0.8899942, 0.8294657, -1.744803, 0.7333333, 0, 1, 1,
0.890071, -1.302828, 1.102245, 0.7411765, 0, 1, 1,
0.8937957, -0.1310928, 1.693333, 0.7450981, 0, 1, 1,
0.8970664, -0.7755019, 2.76964, 0.7529412, 0, 1, 1,
0.8998394, 1.297616, 0.8722552, 0.7568628, 0, 1, 1,
0.9000447, -1.246467, 3.007156, 0.7647059, 0, 1, 1,
0.9009023, -1.452179, 1.492408, 0.7686275, 0, 1, 1,
0.9022629, 1.072004, 0.007713137, 0.7764706, 0, 1, 1,
0.9025882, 0.2618125, -0.4532023, 0.7803922, 0, 1, 1,
0.9084986, 0.3473056, 1.478457, 0.7882353, 0, 1, 1,
0.9158535, -0.389041, 1.78463, 0.7921569, 0, 1, 1,
0.9159205, -0.2381907, 1.855356, 0.8, 0, 1, 1,
0.9164808, -0.1672174, 1.857253, 0.8078431, 0, 1, 1,
0.9253111, 0.9186411, -0.4387639, 0.8117647, 0, 1, 1,
0.9319307, 1.883197, -0.8532072, 0.8196079, 0, 1, 1,
0.9391053, 0.4427086, 0.02602633, 0.8235294, 0, 1, 1,
0.9392082, -1.358136, 2.295092, 0.8313726, 0, 1, 1,
0.9449348, 1.338758, 0.7208845, 0.8352941, 0, 1, 1,
0.9518412, 0.4656654, -1.159193, 0.8431373, 0, 1, 1,
0.952892, -0.5036888, 2.865364, 0.8470588, 0, 1, 1,
0.9560736, 1.984028, 2.167588, 0.854902, 0, 1, 1,
0.9585903, -0.9103304, 1.990199, 0.8588235, 0, 1, 1,
0.962885, -0.1385161, 3.125045, 0.8666667, 0, 1, 1,
0.9630773, 0.9938435, 1.047048, 0.8705882, 0, 1, 1,
0.9651218, 0.5149055, 1.397872, 0.8784314, 0, 1, 1,
0.9685448, -0.3516951, 3.118026, 0.8823529, 0, 1, 1,
0.9720048, 0.1826122, 1.962744, 0.8901961, 0, 1, 1,
0.9787147, -1.958939, 1.958912, 0.8941177, 0, 1, 1,
0.9851705, 1.640492, 0.9579263, 0.9019608, 0, 1, 1,
0.9902707, -0.7999802, 1.368875, 0.9098039, 0, 1, 1,
0.990942, -0.9744881, 1.813323, 0.9137255, 0, 1, 1,
0.9927802, 0.801289, 1.296888, 0.9215686, 0, 1, 1,
0.9945048, -0.882592, 1.644931, 0.9254902, 0, 1, 1,
0.9990584, 1.350521, 3.085206, 0.9333333, 0, 1, 1,
1.01451, 1.736782, 2.303631, 0.9372549, 0, 1, 1,
1.016584, 0.3002576, 0.9704244, 0.945098, 0, 1, 1,
1.017848, -2.023523, 3.056029, 0.9490196, 0, 1, 1,
1.020716, -0.01993652, 2.871799, 0.9568627, 0, 1, 1,
1.02375, 0.2181035, 1.092349, 0.9607843, 0, 1, 1,
1.023999, -1.209185, 0.913824, 0.9686275, 0, 1, 1,
1.026341, -0.621207, 3.844661, 0.972549, 0, 1, 1,
1.032367, -0.5178138, 0.06230868, 0.9803922, 0, 1, 1,
1.034896, 0.5996323, 1.733631, 0.9843137, 0, 1, 1,
1.046409, 0.2562893, 1.283786, 0.9921569, 0, 1, 1,
1.046481, 1.96537, 0.7054673, 0.9960784, 0, 1, 1,
1.046964, 0.2150066, -0.3570685, 1, 0, 0.9960784, 1,
1.054958, -0.3544359, 2.664665, 1, 0, 0.9882353, 1,
1.056072, 1.08576, 0.388103, 1, 0, 0.9843137, 1,
1.058298, -0.3987377, 2.37467, 1, 0, 0.9764706, 1,
1.066447, -2.061283, 3.599635, 1, 0, 0.972549, 1,
1.06786, -0.2564081, -0.4496629, 1, 0, 0.9647059, 1,
1.076796, 1.188699, 0.120403, 1, 0, 0.9607843, 1,
1.077201, -1.192412, 1.06967, 1, 0, 0.9529412, 1,
1.077644, 0.3965188, 1.209275, 1, 0, 0.9490196, 1,
1.080981, -0.5790333, 3.228236, 1, 0, 0.9411765, 1,
1.082433, 1.719953, 0.2827044, 1, 0, 0.9372549, 1,
1.084811, 0.2186944, 1.018701, 1, 0, 0.9294118, 1,
1.105293, 0.1966073, 0.5804856, 1, 0, 0.9254902, 1,
1.107214, -0.612393, 0.6824515, 1, 0, 0.9176471, 1,
1.116286, -0.3413074, 2.818193, 1, 0, 0.9137255, 1,
1.116327, 1.410959, 1.756131, 1, 0, 0.9058824, 1,
1.124763, -0.1605238, 2.693626, 1, 0, 0.9019608, 1,
1.133338, 0.5131969, 0.8579675, 1, 0, 0.8941177, 1,
1.133406, -0.5417921, 2.752428, 1, 0, 0.8862745, 1,
1.135135, 1.138973, 0.2205795, 1, 0, 0.8823529, 1,
1.136361, -0.2984762, 3.014305, 1, 0, 0.8745098, 1,
1.137818, 0.05300811, -0.7922721, 1, 0, 0.8705882, 1,
1.138045, -0.1826606, 1.253041, 1, 0, 0.8627451, 1,
1.147015, -0.01912767, 3.374018, 1, 0, 0.8588235, 1,
1.157656, 0.2866088, 1.732215, 1, 0, 0.8509804, 1,
1.167158, -1.118969, 2.385389, 1, 0, 0.8470588, 1,
1.17811, -0.1728607, 2.238221, 1, 0, 0.8392157, 1,
1.178825, 0.7867209, 0.3533666, 1, 0, 0.8352941, 1,
1.181988, -0.9748772, 3.344752, 1, 0, 0.827451, 1,
1.183533, 0.1006557, 1.822819, 1, 0, 0.8235294, 1,
1.183694, 0.04712443, 0.7356369, 1, 0, 0.8156863, 1,
1.186309, 0.7566832, 0.9509052, 1, 0, 0.8117647, 1,
1.195607, 1.898896, -1.837619, 1, 0, 0.8039216, 1,
1.196941, -0.739479, 3.440022, 1, 0, 0.7960784, 1,
1.199672, -0.2840241, 2.341048, 1, 0, 0.7921569, 1,
1.202992, 1.226718, 0.2426166, 1, 0, 0.7843137, 1,
1.207077, -0.508073, 3.650481, 1, 0, 0.7803922, 1,
1.20788, -1.513846, 0.7379606, 1, 0, 0.772549, 1,
1.209178, 0.4613658, 1.913237, 1, 0, 0.7686275, 1,
1.210105, -0.02182132, 0.9584396, 1, 0, 0.7607843, 1,
1.216174, -0.3150622, 1.084016, 1, 0, 0.7568628, 1,
1.216657, 0.8477894, -0.5691295, 1, 0, 0.7490196, 1,
1.216843, 0.04926177, 2.586462, 1, 0, 0.7450981, 1,
1.218322, 1.464459, 2.028174, 1, 0, 0.7372549, 1,
1.221187, -1.307515, 2.679744, 1, 0, 0.7333333, 1,
1.222453, 0.2905885, 0.5301765, 1, 0, 0.7254902, 1,
1.225639, -0.2060117, 1.186381, 1, 0, 0.7215686, 1,
1.228211, -0.3005707, 1.134062, 1, 0, 0.7137255, 1,
1.229839, -0.2757915, 1.488505, 1, 0, 0.7098039, 1,
1.231876, 0.5330637, 0.4497143, 1, 0, 0.7019608, 1,
1.240935, 2.036965, 0.955709, 1, 0, 0.6941177, 1,
1.242712, -0.3858449, 1.817139, 1, 0, 0.6901961, 1,
1.245265, 0.4221636, -0.7919301, 1, 0, 0.682353, 1,
1.253617, -1.072585, -0.1055873, 1, 0, 0.6784314, 1,
1.262181, 0.02530535, 0.2762514, 1, 0, 0.6705883, 1,
1.263829, 0.4733592, 1.185355, 1, 0, 0.6666667, 1,
1.272533, -1.017673, 1.893101, 1, 0, 0.6588235, 1,
1.272883, 1.476013, -0.6443494, 1, 0, 0.654902, 1,
1.274967, -1.221688, 4.594571, 1, 0, 0.6470588, 1,
1.276075, -0.4970002, -0.06250405, 1, 0, 0.6431373, 1,
1.276116, 0.7792251, 1.926078, 1, 0, 0.6352941, 1,
1.277114, 0.8412679, 0.2872044, 1, 0, 0.6313726, 1,
1.277232, 0.0496831, 1.205479, 1, 0, 0.6235294, 1,
1.279723, -0.5676293, 2.680838, 1, 0, 0.6196079, 1,
1.28485, 1.040946, 1.661959, 1, 0, 0.6117647, 1,
1.286036, 1.156249, 1.286669, 1, 0, 0.6078432, 1,
1.300528, 0.8367411, 1.102212, 1, 0, 0.6, 1,
1.304006, 0.8648962, 1.204765, 1, 0, 0.5921569, 1,
1.305002, 0.008915274, 2.275205, 1, 0, 0.5882353, 1,
1.311967, -0.544122, 3.634963, 1, 0, 0.5803922, 1,
1.325626, -0.2193045, 0.8536476, 1, 0, 0.5764706, 1,
1.336611, -0.7214807, 3.896986, 1, 0, 0.5686275, 1,
1.344726, -1.186662, 3.949501, 1, 0, 0.5647059, 1,
1.355239, -0.4157654, 1.230169, 1, 0, 0.5568628, 1,
1.363574, -0.4563405, 2.142258, 1, 0, 0.5529412, 1,
1.367981, -0.06458123, 2.833115, 1, 0, 0.5450981, 1,
1.368685, -0.6127968, 1.208734, 1, 0, 0.5411765, 1,
1.37539, 0.896444, 0.9730324, 1, 0, 0.5333334, 1,
1.375511, 0.7753867, 0.9998197, 1, 0, 0.5294118, 1,
1.375708, -0.5677853, 4.717991, 1, 0, 0.5215687, 1,
1.396875, 0.1105126, 2.22558, 1, 0, 0.5176471, 1,
1.401568, 0.04911599, 0.4887839, 1, 0, 0.509804, 1,
1.404508, -1.012787, 2.754195, 1, 0, 0.5058824, 1,
1.411812, -0.7841479, 1.882882, 1, 0, 0.4980392, 1,
1.413147, -1.37273, 3.693245, 1, 0, 0.4901961, 1,
1.417707, -0.9776264, -0.06459278, 1, 0, 0.4862745, 1,
1.419389, 0.4820586, 0.2007151, 1, 0, 0.4784314, 1,
1.431388, -0.09989595, 1.475588, 1, 0, 0.4745098, 1,
1.435283, 1.453315, 1.006344, 1, 0, 0.4666667, 1,
1.437131, 0.08417114, 1.635007, 1, 0, 0.4627451, 1,
1.439347, -0.4493116, 1.100319, 1, 0, 0.454902, 1,
1.441994, 0.07372072, 1.753588, 1, 0, 0.4509804, 1,
1.442373, 1.121164, 2.170807, 1, 0, 0.4431373, 1,
1.443957, -0.794415, 1.893397, 1, 0, 0.4392157, 1,
1.454847, 1.702567, -1.14727, 1, 0, 0.4313726, 1,
1.459195, 1.777457, 0.9672564, 1, 0, 0.427451, 1,
1.46054, -0.9023623, 2.526398, 1, 0, 0.4196078, 1,
1.462503, -0.2437301, 2.69977, 1, 0, 0.4156863, 1,
1.468755, 0.1396997, 2.821654, 1, 0, 0.4078431, 1,
1.47143, -2.141825, 2.934056, 1, 0, 0.4039216, 1,
1.472643, 0.5643629, -0.2483258, 1, 0, 0.3960784, 1,
1.483483, -1.464405, 2.970254, 1, 0, 0.3882353, 1,
1.488591, 2.041296, 0.6567786, 1, 0, 0.3843137, 1,
1.493452, 0.5473102, 1.306269, 1, 0, 0.3764706, 1,
1.509155, 0.3358484, 1.524731, 1, 0, 0.372549, 1,
1.513989, 1.222971, 0.3656882, 1, 0, 0.3647059, 1,
1.523967, 0.7028117, 1.360708, 1, 0, 0.3607843, 1,
1.531918, 0.2006052, 2.472734, 1, 0, 0.3529412, 1,
1.535167, -0.2630111, 2.550853, 1, 0, 0.3490196, 1,
1.55078, 0.1510624, 0.171241, 1, 0, 0.3411765, 1,
1.556816, -0.4423895, 1.025901, 1, 0, 0.3372549, 1,
1.558958, -0.8523061, 1.480842, 1, 0, 0.3294118, 1,
1.573799, -0.650749, 1.76207, 1, 0, 0.3254902, 1,
1.577157, -0.5205805, 2.98794, 1, 0, 0.3176471, 1,
1.58392, -0.8177395, 2.073506, 1, 0, 0.3137255, 1,
1.593717, -0.008951564, 1.604444, 1, 0, 0.3058824, 1,
1.613988, 0.4197898, 0.4095413, 1, 0, 0.2980392, 1,
1.619794, -1.426887, 3.180913, 1, 0, 0.2941177, 1,
1.673856, 0.699528, 1.97171, 1, 0, 0.2862745, 1,
1.684756, -0.4562316, 2.12922, 1, 0, 0.282353, 1,
1.700928, 0.08720651, 3.313863, 1, 0, 0.2745098, 1,
1.703379, -2.51255, 1.440724, 1, 0, 0.2705882, 1,
1.707251, 1.138024, 1.294949, 1, 0, 0.2627451, 1,
1.710929, -0.450812, 2.875222, 1, 0, 0.2588235, 1,
1.714917, 0.4701334, 2.723843, 1, 0, 0.2509804, 1,
1.72523, 0.4513875, 1.240678, 1, 0, 0.2470588, 1,
1.747252, -0.3673062, 3.178425, 1, 0, 0.2392157, 1,
1.751976, 0.9388957, 0.8491077, 1, 0, 0.2352941, 1,
1.752084, -1.007427, 1.085275, 1, 0, 0.227451, 1,
1.756742, -1.719853, 3.214947, 1, 0, 0.2235294, 1,
1.759795, 0.05692363, 1.161748, 1, 0, 0.2156863, 1,
1.762299, -1.06604, 2.485447, 1, 0, 0.2117647, 1,
1.767123, 1.070338, 2.723278, 1, 0, 0.2039216, 1,
1.802732, -2.202885, 3.682398, 1, 0, 0.1960784, 1,
1.803913, -0.4692786, 1.452685, 1, 0, 0.1921569, 1,
1.807805, 1.174803, 2.651796, 1, 0, 0.1843137, 1,
1.812851, -0.03316462, 3.58153, 1, 0, 0.1803922, 1,
1.818635, -0.2514309, 4.620415, 1, 0, 0.172549, 1,
1.83254, 0.3237323, 0.2889751, 1, 0, 0.1686275, 1,
1.885005, 0.3679732, 2.932036, 1, 0, 0.1607843, 1,
1.889908, -0.391742, 1.34004, 1, 0, 0.1568628, 1,
1.901185, 1.263217, 1.167897, 1, 0, 0.1490196, 1,
1.91271, 1.592324, 1.219165, 1, 0, 0.145098, 1,
1.960382, 0.8114906, 0.9558147, 1, 0, 0.1372549, 1,
1.970356, -0.2811651, 0.7862808, 1, 0, 0.1333333, 1,
1.995648, 0.1632722, 0.6879501, 1, 0, 0.1254902, 1,
1.996785, 2.364861, -0.004873294, 1, 0, 0.1215686, 1,
1.998631, 1.262718, 0.5934135, 1, 0, 0.1137255, 1,
2.002913, 1.266935, 2.756506, 1, 0, 0.1098039, 1,
2.023725, -1.016455, 1.351699, 1, 0, 0.1019608, 1,
2.04572, -0.5999272, 2.107573, 1, 0, 0.09411765, 1,
2.071927, 1.485308, 0.3054574, 1, 0, 0.09019608, 1,
2.078639, -0.2457357, 1.493783, 1, 0, 0.08235294, 1,
2.088356, 0.3093274, 0.4857464, 1, 0, 0.07843138, 1,
2.090936, 1.489294, -0.3194379, 1, 0, 0.07058824, 1,
2.115807, -1.444039, 1.07647, 1, 0, 0.06666667, 1,
2.31367, 0.6553796, 0.9542439, 1, 0, 0.05882353, 1,
2.330355, -0.2964621, 3.051861, 1, 0, 0.05490196, 1,
2.373239, -2.013142, 0.9498579, 1, 0, 0.04705882, 1,
2.479688, -0.9124032, 0.8182321, 1, 0, 0.04313726, 1,
2.496252, -0.9649485, -0.5827572, 1, 0, 0.03529412, 1,
2.546285, -0.1081608, 2.559649, 1, 0, 0.03137255, 1,
2.550941, -0.8360338, 0.8793617, 1, 0, 0.02352941, 1,
2.57155, -0.7276135, 2.999051, 1, 0, 0.01960784, 1,
2.590249, 0.17871, 2.70095, 1, 0, 0.01176471, 1,
2.712821, 1.091472, 0.5567473, 1, 0, 0.007843138, 1
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
-0.3619153, -4.219532, -6.6136, 0, -0.5, 0.5, 0.5,
-0.3619153, -4.219532, -6.6136, 1, -0.5, 0.5, 0.5,
-0.3619153, -4.219532, -6.6136, 1, 1.5, 0.5, 0.5,
-0.3619153, -4.219532, -6.6136, 0, 1.5, 0.5, 0.5
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
-4.478987, -0.04286456, -6.6136, 0, -0.5, 0.5, 0.5,
-4.478987, -0.04286456, -6.6136, 1, -0.5, 0.5, 0.5,
-4.478987, -0.04286456, -6.6136, 1, 1.5, 0.5, 0.5,
-4.478987, -0.04286456, -6.6136, 0, 1.5, 0.5, 0.5
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
-4.478987, -4.219532, -0.1266396, 0, -0.5, 0.5, 0.5,
-4.478987, -4.219532, -0.1266396, 1, -0.5, 0.5, 0.5,
-4.478987, -4.219532, -0.1266396, 1, 1.5, 0.5, 0.5,
-4.478987, -4.219532, -0.1266396, 0, 1.5, 0.5, 0.5
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
-3, -3.255686, -5.11661,
2, -3.255686, -5.11661,
-3, -3.255686, -5.11661,
-3, -3.416327, -5.366108,
-2, -3.255686, -5.11661,
-2, -3.416327, -5.366108,
-1, -3.255686, -5.11661,
-1, -3.416327, -5.366108,
0, -3.255686, -5.11661,
0, -3.416327, -5.366108,
1, -3.255686, -5.11661,
1, -3.416327, -5.366108,
2, -3.255686, -5.11661,
2, -3.416327, -5.366108
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
-3, -3.737609, -5.865105, 0, -0.5, 0.5, 0.5,
-3, -3.737609, -5.865105, 1, -0.5, 0.5, 0.5,
-3, -3.737609, -5.865105, 1, 1.5, 0.5, 0.5,
-3, -3.737609, -5.865105, 0, 1.5, 0.5, 0.5,
-2, -3.737609, -5.865105, 0, -0.5, 0.5, 0.5,
-2, -3.737609, -5.865105, 1, -0.5, 0.5, 0.5,
-2, -3.737609, -5.865105, 1, 1.5, 0.5, 0.5,
-2, -3.737609, -5.865105, 0, 1.5, 0.5, 0.5,
-1, -3.737609, -5.865105, 0, -0.5, 0.5, 0.5,
-1, -3.737609, -5.865105, 1, -0.5, 0.5, 0.5,
-1, -3.737609, -5.865105, 1, 1.5, 0.5, 0.5,
-1, -3.737609, -5.865105, 0, 1.5, 0.5, 0.5,
0, -3.737609, -5.865105, 0, -0.5, 0.5, 0.5,
0, -3.737609, -5.865105, 1, -0.5, 0.5, 0.5,
0, -3.737609, -5.865105, 1, 1.5, 0.5, 0.5,
0, -3.737609, -5.865105, 0, 1.5, 0.5, 0.5,
1, -3.737609, -5.865105, 0, -0.5, 0.5, 0.5,
1, -3.737609, -5.865105, 1, -0.5, 0.5, 0.5,
1, -3.737609, -5.865105, 1, 1.5, 0.5, 0.5,
1, -3.737609, -5.865105, 0, 1.5, 0.5, 0.5,
2, -3.737609, -5.865105, 0, -0.5, 0.5, 0.5,
2, -3.737609, -5.865105, 1, -0.5, 0.5, 0.5,
2, -3.737609, -5.865105, 1, 1.5, 0.5, 0.5,
2, -3.737609, -5.865105, 0, 1.5, 0.5, 0.5
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
-3.528893, -3, -5.11661,
-3.528893, 3, -5.11661,
-3.528893, -3, -5.11661,
-3.687242, -3, -5.366108,
-3.528893, -2, -5.11661,
-3.687242, -2, -5.366108,
-3.528893, -1, -5.11661,
-3.687242, -1, -5.366108,
-3.528893, 0, -5.11661,
-3.687242, 0, -5.366108,
-3.528893, 1, -5.11661,
-3.687242, 1, -5.366108,
-3.528893, 2, -5.11661,
-3.687242, 2, -5.366108,
-3.528893, 3, -5.11661,
-3.687242, 3, -5.366108
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
-4.00394, -3, -5.865105, 0, -0.5, 0.5, 0.5,
-4.00394, -3, -5.865105, 1, -0.5, 0.5, 0.5,
-4.00394, -3, -5.865105, 1, 1.5, 0.5, 0.5,
-4.00394, -3, -5.865105, 0, 1.5, 0.5, 0.5,
-4.00394, -2, -5.865105, 0, -0.5, 0.5, 0.5,
-4.00394, -2, -5.865105, 1, -0.5, 0.5, 0.5,
-4.00394, -2, -5.865105, 1, 1.5, 0.5, 0.5,
-4.00394, -2, -5.865105, 0, 1.5, 0.5, 0.5,
-4.00394, -1, -5.865105, 0, -0.5, 0.5, 0.5,
-4.00394, -1, -5.865105, 1, -0.5, 0.5, 0.5,
-4.00394, -1, -5.865105, 1, 1.5, 0.5, 0.5,
-4.00394, -1, -5.865105, 0, 1.5, 0.5, 0.5,
-4.00394, 0, -5.865105, 0, -0.5, 0.5, 0.5,
-4.00394, 0, -5.865105, 1, -0.5, 0.5, 0.5,
-4.00394, 0, -5.865105, 1, 1.5, 0.5, 0.5,
-4.00394, 0, -5.865105, 0, 1.5, 0.5, 0.5,
-4.00394, 1, -5.865105, 0, -0.5, 0.5, 0.5,
-4.00394, 1, -5.865105, 1, -0.5, 0.5, 0.5,
-4.00394, 1, -5.865105, 1, 1.5, 0.5, 0.5,
-4.00394, 1, -5.865105, 0, 1.5, 0.5, 0.5,
-4.00394, 2, -5.865105, 0, -0.5, 0.5, 0.5,
-4.00394, 2, -5.865105, 1, -0.5, 0.5, 0.5,
-4.00394, 2, -5.865105, 1, 1.5, 0.5, 0.5,
-4.00394, 2, -5.865105, 0, 1.5, 0.5, 0.5,
-4.00394, 3, -5.865105, 0, -0.5, 0.5, 0.5,
-4.00394, 3, -5.865105, 1, -0.5, 0.5, 0.5,
-4.00394, 3, -5.865105, 1, 1.5, 0.5, 0.5,
-4.00394, 3, -5.865105, 0, 1.5, 0.5, 0.5
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
-3.528893, -3.255686, -4,
-3.528893, -3.255686, 4,
-3.528893, -3.255686, -4,
-3.687242, -3.416327, -4,
-3.528893, -3.255686, -2,
-3.687242, -3.416327, -2,
-3.528893, -3.255686, 0,
-3.687242, -3.416327, 0,
-3.528893, -3.255686, 2,
-3.687242, -3.416327, 2,
-3.528893, -3.255686, 4,
-3.687242, -3.416327, 4
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
-4.00394, -3.737609, -4, 0, -0.5, 0.5, 0.5,
-4.00394, -3.737609, -4, 1, -0.5, 0.5, 0.5,
-4.00394, -3.737609, -4, 1, 1.5, 0.5, 0.5,
-4.00394, -3.737609, -4, 0, 1.5, 0.5, 0.5,
-4.00394, -3.737609, -2, 0, -0.5, 0.5, 0.5,
-4.00394, -3.737609, -2, 1, -0.5, 0.5, 0.5,
-4.00394, -3.737609, -2, 1, 1.5, 0.5, 0.5,
-4.00394, -3.737609, -2, 0, 1.5, 0.5, 0.5,
-4.00394, -3.737609, 0, 0, -0.5, 0.5, 0.5,
-4.00394, -3.737609, 0, 1, -0.5, 0.5, 0.5,
-4.00394, -3.737609, 0, 1, 1.5, 0.5, 0.5,
-4.00394, -3.737609, 0, 0, 1.5, 0.5, 0.5,
-4.00394, -3.737609, 2, 0, -0.5, 0.5, 0.5,
-4.00394, -3.737609, 2, 1, -0.5, 0.5, 0.5,
-4.00394, -3.737609, 2, 1, 1.5, 0.5, 0.5,
-4.00394, -3.737609, 2, 0, 1.5, 0.5, 0.5,
-4.00394, -3.737609, 4, 0, -0.5, 0.5, 0.5,
-4.00394, -3.737609, 4, 1, -0.5, 0.5, 0.5,
-4.00394, -3.737609, 4, 1, 1.5, 0.5, 0.5,
-4.00394, -3.737609, 4, 0, 1.5, 0.5, 0.5
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
-3.528893, -3.255686, -5.11661,
-3.528893, 3.169956, -5.11661,
-3.528893, -3.255686, 4.86333,
-3.528893, 3.169956, 4.86333,
-3.528893, -3.255686, -5.11661,
-3.528893, -3.255686, 4.86333,
-3.528893, 3.169956, -5.11661,
-3.528893, 3.169956, 4.86333,
-3.528893, -3.255686, -5.11661,
2.805063, -3.255686, -5.11661,
-3.528893, -3.255686, 4.86333,
2.805063, -3.255686, 4.86333,
-3.528893, 3.169956, -5.11661,
2.805063, 3.169956, -5.11661,
-3.528893, 3.169956, 4.86333,
2.805063, 3.169956, 4.86333,
2.805063, -3.255686, -5.11661,
2.805063, 3.169956, -5.11661,
2.805063, -3.255686, 4.86333,
2.805063, 3.169956, 4.86333,
2.805063, -3.255686, -5.11661,
2.805063, -3.255686, 4.86333,
2.805063, 3.169956, -5.11661,
2.805063, 3.169956, 4.86333
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
var radius = 7.184114;
var distance = 31.96294;
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
mvMatrix.translate( 0.3619153, 0.04286456, 0.1266396 );
mvMatrix.scale( 1.226343, 1.208845, 0.7783219 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.96294);
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
Vitamin_B12<-read.table("Vitamin_B12.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Vitamin_B12$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
```

```r
y<-Vitamin_B12$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
```

```r
z<-Vitamin_B12$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
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
-3.436651, 0.4239415, -1.381867, 0, 0, 1, 1, 1,
-2.889327, -0.6969441, -3.379579, 1, 0, 0, 1, 1,
-2.724801, -1.226452, -2.624862, 1, 0, 0, 1, 1,
-2.474805, -1.194433, -3.007957, 1, 0, 0, 1, 1,
-2.471958, 2.584909, 0.1874851, 1, 0, 0, 1, 1,
-2.433632, 0.9588443, -0.4345811, 1, 0, 0, 1, 1,
-2.393387, 0.5527394, -1.289796, 0, 0, 0, 1, 1,
-2.377585, 0.08736295, -1.600376, 0, 0, 0, 1, 1,
-2.351993, -2.195564, -4.225214, 0, 0, 0, 1, 1,
-2.326688, -1.213981, -2.8573, 0, 0, 0, 1, 1,
-2.291313, 0.1671788, -2.786686, 0, 0, 0, 1, 1,
-2.27213, 0.7799024, -0.4469345, 0, 0, 0, 1, 1,
-2.241743, -0.5048342, -2.061076, 0, 0, 0, 1, 1,
-2.197824, 0.7812059, -2.561588, 1, 1, 1, 1, 1,
-2.178848, 0.1220685, -0.8694899, 1, 1, 1, 1, 1,
-2.170202, 1.257693, -0.2565566, 1, 1, 1, 1, 1,
-2.159672, 0.3420701, -0.6890618, 1, 1, 1, 1, 1,
-2.146564, -1.006889, -2.70978, 1, 1, 1, 1, 1,
-2.133951, 0.9173381, -0.4523071, 1, 1, 1, 1, 1,
-2.130435, 0.03254754, -0.3422771, 1, 1, 1, 1, 1,
-2.124868, 0.1030812, -1.398916, 1, 1, 1, 1, 1,
-2.101594, 0.5957546, -0.08744815, 1, 1, 1, 1, 1,
-2.096038, -0.4124824, -2.36096, 1, 1, 1, 1, 1,
-2.048491, -0.5181945, -1.892008, 1, 1, 1, 1, 1,
-2.041493, 0.0462729, -2.864393, 1, 1, 1, 1, 1,
-2.019564, 0.3295158, -2.073703, 1, 1, 1, 1, 1,
-2.012934, 0.2149276, -3.329073, 1, 1, 1, 1, 1,
-1.999777, 1.002512, -2.31402, 1, 1, 1, 1, 1,
-1.988875, -0.7352401, -0.7833732, 0, 0, 1, 1, 1,
-1.977281, -0.7858845, -1.891726, 1, 0, 0, 1, 1,
-1.962529, -0.08238304, -1.862447, 1, 0, 0, 1, 1,
-1.947583, -0.2383507, 0.1017404, 1, 0, 0, 1, 1,
-1.941228, -0.4793557, -2.530061, 1, 0, 0, 1, 1,
-1.941206, 0.2276213, -0.3197742, 1, 0, 0, 1, 1,
-1.919628, 1.300352, -0.9549311, 0, 0, 0, 1, 1,
-1.916543, -1.615184, -2.681946, 0, 0, 0, 1, 1,
-1.903946, -0.4972163, -1.920151, 0, 0, 0, 1, 1,
-1.899861, 0.03392871, -1.112654, 0, 0, 0, 1, 1,
-1.864887, 0.6841823, -2.601155, 0, 0, 0, 1, 1,
-1.856516, -1.130829, -1.172101, 0, 0, 0, 1, 1,
-1.852097, -1.086155, -3.609226, 0, 0, 0, 1, 1,
-1.846858, -0.2326779, -0.4647553, 1, 1, 1, 1, 1,
-1.833809, 0.3624303, -0.23924, 1, 1, 1, 1, 1,
-1.828504, 0.2455802, 0.9598765, 1, 1, 1, 1, 1,
-1.818057, -0.01731698, -0.9900908, 1, 1, 1, 1, 1,
-1.816387, 0.97013, -1.88531, 1, 1, 1, 1, 1,
-1.811749, 0.2893758, -2.695327, 1, 1, 1, 1, 1,
-1.79679, -0.6237146, -4.388817, 1, 1, 1, 1, 1,
-1.771048, -0.8551116, -1.237098, 1, 1, 1, 1, 1,
-1.770585, -0.7706374, -2.214679, 1, 1, 1, 1, 1,
-1.766718, 0.01328586, -0.5622478, 1, 1, 1, 1, 1,
-1.754953, 0.05365372, -1.306889, 1, 1, 1, 1, 1,
-1.75017, 0.5065966, -1.610411, 1, 1, 1, 1, 1,
-1.730878, 0.1466006, -0.9463274, 1, 1, 1, 1, 1,
-1.729835, 1.80977, -0.02184904, 1, 1, 1, 1, 1,
-1.728254, 1.339528, 1.083069, 1, 1, 1, 1, 1,
-1.723016, -0.9780841, -0.571827, 0, 0, 1, 1, 1,
-1.712849, 2.211972, -1.353706, 1, 0, 0, 1, 1,
-1.702721, 0.191929, -1.046967, 1, 0, 0, 1, 1,
-1.694619, -0.7710854, -1.563112, 1, 0, 0, 1, 1,
-1.689134, 0.9780719, -0.06349386, 1, 0, 0, 1, 1,
-1.671907, -0.4426957, -1.732116, 1, 0, 0, 1, 1,
-1.664508, -1.495999, -2.055479, 0, 0, 0, 1, 1,
-1.662526, -1.39228, -2.237166, 0, 0, 0, 1, 1,
-1.647736, 0.3742379, -0.9051865, 0, 0, 0, 1, 1,
-1.645656, 0.1668039, -1.086896, 0, 0, 0, 1, 1,
-1.644317, -0.4818711, -0.6500254, 0, 0, 0, 1, 1,
-1.642074, 0.3881148, -2.966511, 0, 0, 0, 1, 1,
-1.635003, -1.312434, -1.061731, 0, 0, 0, 1, 1,
-1.624616, -0.352295, -0.2756316, 1, 1, 1, 1, 1,
-1.623479, -0.2427431, 0.52984, 1, 1, 1, 1, 1,
-1.620614, 0.5559291, 0.4302993, 1, 1, 1, 1, 1,
-1.607262, -1.422483, -3.897385, 1, 1, 1, 1, 1,
-1.593835, 0.6345535, -0.750451, 1, 1, 1, 1, 1,
-1.578157, -0.1429054, -0.9843177, 1, 1, 1, 1, 1,
-1.556175, -0.8943028, -1.972384, 1, 1, 1, 1, 1,
-1.552448, 0.7971097, -1.094694, 1, 1, 1, 1, 1,
-1.53721, -0.6467861, -0.7631111, 1, 1, 1, 1, 1,
-1.536112, 1.441504, -1.869524, 1, 1, 1, 1, 1,
-1.533932, -1.626247, -2.18042, 1, 1, 1, 1, 1,
-1.533306, 0.3836147, 0.02333745, 1, 1, 1, 1, 1,
-1.532928, 0.2230099, -0.8932226, 1, 1, 1, 1, 1,
-1.527435, -0.3003829, -2.346939, 1, 1, 1, 1, 1,
-1.524351, 1.315891, -0.4609625, 1, 1, 1, 1, 1,
-1.521929, 0.4218646, -0.4144315, 0, 0, 1, 1, 1,
-1.519888, 1.52828, 1.086951, 1, 0, 0, 1, 1,
-1.514927, 0.1005772, -2.610381, 1, 0, 0, 1, 1,
-1.502571, 0.4649348, -1.449577, 1, 0, 0, 1, 1,
-1.501988, 0.380744, -2.897369, 1, 0, 0, 1, 1,
-1.496066, 0.6636046, -1.18441, 1, 0, 0, 1, 1,
-1.493543, 0.04748374, -0.9489138, 0, 0, 0, 1, 1,
-1.449025, -0.115718, -1.521311, 0, 0, 0, 1, 1,
-1.425195, -0.8899131, -3.720329, 0, 0, 0, 1, 1,
-1.411289, -0.9032757, -1.964595, 0, 0, 0, 1, 1,
-1.401065, 0.8407827, -0.4739872, 0, 0, 0, 1, 1,
-1.397978, 0.364531, -4.024771, 0, 0, 0, 1, 1,
-1.390832, -0.3306471, -2.102221, 0, 0, 0, 1, 1,
-1.385116, 0.1010924, -1.129597, 1, 1, 1, 1, 1,
-1.376843, -0.5088543, -1.465946, 1, 1, 1, 1, 1,
-1.367865, -0.7978668, -3.939821, 1, 1, 1, 1, 1,
-1.367253, 0.2212779, -1.570929, 1, 1, 1, 1, 1,
-1.365509, -1.630152, -1.313572, 1, 1, 1, 1, 1,
-1.360155, -0.0009981977, -0.8147461, 1, 1, 1, 1, 1,
-1.312037, -0.04139493, -0.556747, 1, 1, 1, 1, 1,
-1.311845, 0.02776773, 0.1608339, 1, 1, 1, 1, 1,
-1.293321, -1.023433, -1.912716, 1, 1, 1, 1, 1,
-1.268298, 0.3249308, -1.507237, 1, 1, 1, 1, 1,
-1.264836, -0.9496059, -1.893432, 1, 1, 1, 1, 1,
-1.262531, 1.144506, -1.831931, 1, 1, 1, 1, 1,
-1.258522, -0.1478844, -1.302529, 1, 1, 1, 1, 1,
-1.253751, -0.7250243, -1.350294, 1, 1, 1, 1, 1,
-1.248989, 0.2224287, -1.794387, 1, 1, 1, 1, 1,
-1.245596, -0.03775386, -2.370048, 0, 0, 1, 1, 1,
-1.23922, 0.2332793, 0.1331046, 1, 0, 0, 1, 1,
-1.236932, -0.2284812, -1.301764, 1, 0, 0, 1, 1,
-1.236365, -0.3519842, -1.655158, 1, 0, 0, 1, 1,
-1.235158, -0.07430418, -1.498042, 1, 0, 0, 1, 1,
-1.231761, 0.02812901, -2.795312, 1, 0, 0, 1, 1,
-1.211311, 0.05852809, -1.480926, 0, 0, 0, 1, 1,
-1.200885, 0.5176795, -0.5700079, 0, 0, 0, 1, 1,
-1.200729, 0.4142479, -0.7878135, 0, 0, 0, 1, 1,
-1.199937, 0.8994701, -1.752946, 0, 0, 0, 1, 1,
-1.19627, 1.078463, -0.6510379, 0, 0, 0, 1, 1,
-1.193019, 1.831217, 0.6474438, 0, 0, 0, 1, 1,
-1.181752, 0.1112629, -0.9966501, 0, 0, 0, 1, 1,
-1.169893, 1.342744, -0.9362562, 1, 1, 1, 1, 1,
-1.163369, -0.5228025, -3.092359, 1, 1, 1, 1, 1,
-1.159932, 1.339918, -0.5123527, 1, 1, 1, 1, 1,
-1.152244, 0.5582758, -0.6376446, 1, 1, 1, 1, 1,
-1.144568, -0.6250994, -3.564987, 1, 1, 1, 1, 1,
-1.144069, 0.9999608, -1.02358, 1, 1, 1, 1, 1,
-1.143059, 0.35501, -1.281507, 1, 1, 1, 1, 1,
-1.138392, 1.78574, 0.3306558, 1, 1, 1, 1, 1,
-1.134859, 0.368109, -0.731661, 1, 1, 1, 1, 1,
-1.134042, -0.1755934, -2.33641, 1, 1, 1, 1, 1,
-1.128293, 0.3094038, -1.237256, 1, 1, 1, 1, 1,
-1.127505, 1.685888, -0.3504605, 1, 1, 1, 1, 1,
-1.115868, 0.7678961, -0.7400344, 1, 1, 1, 1, 1,
-1.115317, 0.7214482, -2.566383, 1, 1, 1, 1, 1,
-1.108613, 0.797003, 0.2175053, 1, 1, 1, 1, 1,
-1.105411, 0.3112856, -1.57179, 0, 0, 1, 1, 1,
-1.091235, -0.09249441, -2.383146, 1, 0, 0, 1, 1,
-1.084549, -0.2370972, -0.1184272, 1, 0, 0, 1, 1,
-1.084256, -0.3367788, -2.65875, 1, 0, 0, 1, 1,
-1.072198, 0.7428635, -2.286098, 1, 0, 0, 1, 1,
-1.069709, -1.542913, -1.262226, 1, 0, 0, 1, 1,
-1.063457, 0.343956, -0.7338975, 0, 0, 0, 1, 1,
-1.061617, -0.2130127, -2.917252, 0, 0, 0, 1, 1,
-1.053726, -0.2317624, -3.277817, 0, 0, 0, 1, 1,
-1.051525, 0.6973578, -0.7805508, 0, 0, 0, 1, 1,
-1.048321, 0.1325073, -1.65339, 0, 0, 0, 1, 1,
-1.04743, -0.04125309, -2.376358, 0, 0, 0, 1, 1,
-1.042806, 0.7528419, -1.051621, 0, 0, 0, 1, 1,
-1.042317, -1.899195, -3.075163, 1, 1, 1, 1, 1,
-1.041294, 1.604936, 0.4631951, 1, 1, 1, 1, 1,
-1.037684, -1.297088, -1.42897, 1, 1, 1, 1, 1,
-1.027699, -0.9850523, -1.69953, 1, 1, 1, 1, 1,
-1.023967, 0.04166868, -2.580627, 1, 1, 1, 1, 1,
-1.015105, 0.02816984, 1.712784, 1, 1, 1, 1, 1,
-1.013003, 0.4582425, -0.9084728, 1, 1, 1, 1, 1,
-1.010256, 0.2794763, -0.963513, 1, 1, 1, 1, 1,
-1.005051, 0.3543224, -1.643579, 1, 1, 1, 1, 1,
-0.9979708, -0.2460553, -1.259104, 1, 1, 1, 1, 1,
-0.9928425, -1.335225, -2.557464, 1, 1, 1, 1, 1,
-0.9817227, -0.0503368, -0.1760848, 1, 1, 1, 1, 1,
-0.9761651, -0.1381214, -1.660841, 1, 1, 1, 1, 1,
-0.9745211, 0.7314, -0.564079, 1, 1, 1, 1, 1,
-0.9711442, -0.4929278, -4.037174, 1, 1, 1, 1, 1,
-0.964676, -0.1239293, -2.037808, 0, 0, 1, 1, 1,
-0.9632888, 0.0116636, -1.573793, 1, 0, 0, 1, 1,
-0.9525905, 1.437664, -2.092889, 1, 0, 0, 1, 1,
-0.9454306, 0.2411901, -2.184124, 1, 0, 0, 1, 1,
-0.9417763, -0.4231256, -2.969079, 1, 0, 0, 1, 1,
-0.9358583, -0.334238, -0.5712352, 1, 0, 0, 1, 1,
-0.9319988, -1.265346, -4.611329, 0, 0, 0, 1, 1,
-0.92483, -1.30878, -3.164263, 0, 0, 0, 1, 1,
-0.924042, -0.2248959, -0.3378117, 0, 0, 0, 1, 1,
-0.919577, -0.05748926, -0.2391429, 0, 0, 0, 1, 1,
-0.9165369, -0.1518962, -1.156373, 0, 0, 0, 1, 1,
-0.9127042, -0.1079764, -1.487376, 0, 0, 0, 1, 1,
-0.9101184, -0.496309, -1.589392, 0, 0, 0, 1, 1,
-0.9009279, 0.658906, 0.02590033, 1, 1, 1, 1, 1,
-0.8952243, 0.6552119, -0.8579665, 1, 1, 1, 1, 1,
-0.8939211, 0.09305592, -0.6413843, 1, 1, 1, 1, 1,
-0.8913079, 1.620723, -1.291543, 1, 1, 1, 1, 1,
-0.8900024, 1.189701, 1.138474, 1, 1, 1, 1, 1,
-0.8873581, -0.3407027, -3.325246, 1, 1, 1, 1, 1,
-0.8861207, -0.5546551, -2.640449, 1, 1, 1, 1, 1,
-0.876449, 0.7418756, -1.441997, 1, 1, 1, 1, 1,
-0.8758547, -1.452282, -2.451662, 1, 1, 1, 1, 1,
-0.8742752, 0.2239889, 0.1070544, 1, 1, 1, 1, 1,
-0.8732059, -0.1593459, -0.9729882, 1, 1, 1, 1, 1,
-0.8688335, 1.248681, 0.46197, 1, 1, 1, 1, 1,
-0.8682904, -0.4931321, 0.1031881, 1, 1, 1, 1, 1,
-0.8666932, 0.1163391, -1.013018, 1, 1, 1, 1, 1,
-0.8661861, -0.2494734, -1.745824, 1, 1, 1, 1, 1,
-0.8525196, -0.8347009, -2.00399, 0, 0, 1, 1, 1,
-0.8515837, -0.7045543, -2.405561, 1, 0, 0, 1, 1,
-0.8445638, -0.8417809, -0.7360774, 1, 0, 0, 1, 1,
-0.8430967, -0.1477889, -2.42984, 1, 0, 0, 1, 1,
-0.8406982, 0.8935069, -0.165214, 1, 0, 0, 1, 1,
-0.8395625, -0.5929383, -1.908492, 1, 0, 0, 1, 1,
-0.8356373, -0.601791, -2.651989, 0, 0, 0, 1, 1,
-0.8269912, 0.1723286, -0.2009216, 0, 0, 0, 1, 1,
-0.8247164, 0.1321043, -2.326799, 0, 0, 0, 1, 1,
-0.8205452, 0.456695, -1.687734, 0, 0, 0, 1, 1,
-0.8192462, -2.424414, -1.740037, 0, 0, 0, 1, 1,
-0.8168898, 0.9367065, -0.3375308, 0, 0, 0, 1, 1,
-0.8122504, 1.868698, -2.41189, 0, 0, 0, 1, 1,
-0.8081566, -0.2978815, -3.21703, 1, 1, 1, 1, 1,
-0.8071569, -0.1209141, -1.585265, 1, 1, 1, 1, 1,
-0.8042586, 0.8213803, -1.122443, 1, 1, 1, 1, 1,
-0.803916, -0.3756846, -3.589314, 1, 1, 1, 1, 1,
-0.8018482, 0.4665288, -1.128803, 1, 1, 1, 1, 1,
-0.8017492, -0.9040773, -1.897174, 1, 1, 1, 1, 1,
-0.7994741, -0.3286853, -1.295053, 1, 1, 1, 1, 1,
-0.78737, -1.591248, -1.312041, 1, 1, 1, 1, 1,
-0.7775288, 0.6297693, -0.1076638, 1, 1, 1, 1, 1,
-0.7744941, 0.1994117, -0.623747, 1, 1, 1, 1, 1,
-0.7672293, 1.675502, -0.3198956, 1, 1, 1, 1, 1,
-0.7609406, -0.07058043, -1.114288, 1, 1, 1, 1, 1,
-0.74779, 1.134701, -1.239886, 1, 1, 1, 1, 1,
-0.7438375, -0.1850626, -2.334946, 1, 1, 1, 1, 1,
-0.7370391, -1.517519, -1.194345, 1, 1, 1, 1, 1,
-0.7364653, 1.209717, -2.002667, 0, 0, 1, 1, 1,
-0.7363085, 0.3588096, -0.1703145, 1, 0, 0, 1, 1,
-0.7355629, 1.931548, -0.123772, 1, 0, 0, 1, 1,
-0.7343469, -0.554969, -3.40909, 1, 0, 0, 1, 1,
-0.727676, -0.3650354, -3.204566, 1, 0, 0, 1, 1,
-0.7226636, 0.3302283, -1.680003, 1, 0, 0, 1, 1,
-0.7168861, 0.3442021, 0.7606226, 0, 0, 0, 1, 1,
-0.7148482, 0.09778394, -2.170976, 0, 0, 0, 1, 1,
-0.7059714, 2.123363, 0.9477893, 0, 0, 0, 1, 1,
-0.7047519, 0.7282887, -0.3104644, 0, 0, 0, 1, 1,
-0.699926, 1.746524, 0.3413969, 0, 0, 0, 1, 1,
-0.6992794, 0.5663891, -0.4530804, 0, 0, 0, 1, 1,
-0.6927748, -0.3048078, -2.350521, 0, 0, 0, 1, 1,
-0.6926282, 0.1966353, -2.029212, 1, 1, 1, 1, 1,
-0.6913685, -1.112231, -2.354624, 1, 1, 1, 1, 1,
-0.6908888, 0.6005046, -0.1911509, 1, 1, 1, 1, 1,
-0.6894132, -0.2842695, -4.286827, 1, 1, 1, 1, 1,
-0.6892679, 1.026089, -1.860922, 1, 1, 1, 1, 1,
-0.6890932, 0.02247682, -0.9826244, 1, 1, 1, 1, 1,
-0.6871998, 0.1028672, -1.439968, 1, 1, 1, 1, 1,
-0.6770727, 1.689928, -1.339969, 1, 1, 1, 1, 1,
-0.675962, 1.230852, -1.999741, 1, 1, 1, 1, 1,
-0.6722823, 2.50574, 1.173308, 1, 1, 1, 1, 1,
-0.6618941, 0.09033132, -0.7614146, 1, 1, 1, 1, 1,
-0.6567142, 1.959687, 0.2858385, 1, 1, 1, 1, 1,
-0.65498, -1.228607, -3.277046, 1, 1, 1, 1, 1,
-0.6515983, 0.3793887, -0.1038403, 1, 1, 1, 1, 1,
-0.6513107, -0.7192109, -1.917699, 1, 1, 1, 1, 1,
-0.6496776, -0.5369989, -2.240768, 0, 0, 1, 1, 1,
-0.6490292, 0.5945928, 0.3887879, 1, 0, 0, 1, 1,
-0.6482484, 0.4001841, -1.454238, 1, 0, 0, 1, 1,
-0.64033, -0.1514527, -3.212544, 1, 0, 0, 1, 1,
-0.6400101, 0.3987501, -0.8383575, 1, 0, 0, 1, 1,
-0.6387638, -2.053579, -2.731242, 1, 0, 0, 1, 1,
-0.6381596, 0.7592112, -0.286686, 0, 0, 0, 1, 1,
-0.6358851, 0.006024514, -2.302345, 0, 0, 0, 1, 1,
-0.6306706, -1.717641, -3.140493, 0, 0, 0, 1, 1,
-0.6280669, 0.4287347, -1.344069, 0, 0, 0, 1, 1,
-0.6196451, 0.504797, -0.5441428, 0, 0, 0, 1, 1,
-0.6195164, -0.8755022, -1.736729, 0, 0, 0, 1, 1,
-0.6178144, -0.8192965, -3.1254, 0, 0, 0, 1, 1,
-0.6150084, 0.1528898, -2.43554, 1, 1, 1, 1, 1,
-0.6080987, 0.616785, -2.301914, 1, 1, 1, 1, 1,
-0.607005, -1.246865, -3.140153, 1, 1, 1, 1, 1,
-0.5982442, -0.5702184, -2.193793, 1, 1, 1, 1, 1,
-0.5940617, -0.1735912, -1.851108, 1, 1, 1, 1, 1,
-0.5883155, -0.1545166, -1.412089, 1, 1, 1, 1, 1,
-0.578643, 0.5707622, -0.544344, 1, 1, 1, 1, 1,
-0.5785428, 1.050598, 0.09738387, 1, 1, 1, 1, 1,
-0.5760851, 0.9399995, -0.2444347, 1, 1, 1, 1, 1,
-0.5671803, -0.004824675, -3.980919, 1, 1, 1, 1, 1,
-0.5660318, 0.2160832, -1.477959, 1, 1, 1, 1, 1,
-0.5659217, -0.9390126, -2.822002, 1, 1, 1, 1, 1,
-0.5638492, 0.2127078, -0.6829537, 1, 1, 1, 1, 1,
-0.5615613, 0.9162187, -1.539987, 1, 1, 1, 1, 1,
-0.5612461, 0.02140415, -1.767918, 1, 1, 1, 1, 1,
-0.560518, -0.00807991, -0.3639137, 0, 0, 1, 1, 1,
-0.5588108, -0.3461992, -2.06897, 1, 0, 0, 1, 1,
-0.5575411, 0.9126647, -1.999014, 1, 0, 0, 1, 1,
-0.5561232, -0.3927279, -1.408975, 1, 0, 0, 1, 1,
-0.5527819, -0.5473097, -1.72915, 1, 0, 0, 1, 1,
-0.5520934, -0.5183868, -3.102036, 1, 0, 0, 1, 1,
-0.5503395, 1.124862, -1.647489, 0, 0, 0, 1, 1,
-0.5499392, 0.1110863, -0.9108043, 0, 0, 0, 1, 1,
-0.5467687, 0.5103104, -2.455233, 0, 0, 0, 1, 1,
-0.5451158, 0.2071127, -3.153751, 0, 0, 0, 1, 1,
-0.5299392, 0.8612581, -1.80212, 0, 0, 0, 1, 1,
-0.5261444, 1.11714, -0.8787477, 0, 0, 0, 1, 1,
-0.5171044, 0.2603257, -1.53006, 0, 0, 0, 1, 1,
-0.5161914, 0.5699295, 1.082349, 1, 1, 1, 1, 1,
-0.5151565, 1.416944, 0.7214881, 1, 1, 1, 1, 1,
-0.5137849, -2.516113, -3.716669, 1, 1, 1, 1, 1,
-0.5121306, 0.01290206, -1.351145, 1, 1, 1, 1, 1,
-0.5106635, -0.6985602, -1.629189, 1, 1, 1, 1, 1,
-0.5094051, 1.76724, -0.2827225, 1, 1, 1, 1, 1,
-0.5057018, -0.5180474, -1.981182, 1, 1, 1, 1, 1,
-0.5047985, 0.1506115, -1.590912, 1, 1, 1, 1, 1,
-0.5045974, 0.7406927, -1.120878, 1, 1, 1, 1, 1,
-0.5035182, 0.9290904, 0.4371922, 1, 1, 1, 1, 1,
-0.5009768, -0.03704031, -2.193795, 1, 1, 1, 1, 1,
-0.4991824, 1.508032, -0.9781706, 1, 1, 1, 1, 1,
-0.4960646, -0.1362732, -2.711259, 1, 1, 1, 1, 1,
-0.4918823, -0.4697352, -1.589333, 1, 1, 1, 1, 1,
-0.4910289, -0.255538, -1.381515, 1, 1, 1, 1, 1,
-0.4875571, 1.183499, -1.333755, 0, 0, 1, 1, 1,
-0.4777237, 0.9191422, -0.8398617, 1, 0, 0, 1, 1,
-0.4745872, -0.1872355, -0.03484271, 1, 0, 0, 1, 1,
-0.4712901, -0.5565981, -3.833826, 1, 0, 0, 1, 1,
-0.4708527, 2.37643, 0.8596473, 1, 0, 0, 1, 1,
-0.4654675, 0.9795172, 0.1825316, 1, 0, 0, 1, 1,
-0.4649494, 0.5157384, -0.4857087, 0, 0, 0, 1, 1,
-0.4601477, -0.0939073, -1.77812, 0, 0, 0, 1, 1,
-0.4587547, 0.988494, -1.727818, 0, 0, 0, 1, 1,
-0.4509674, -1.269134, -4.967721, 0, 0, 0, 1, 1,
-0.4432213, 0.8582467, 0.9558646, 0, 0, 0, 1, 1,
-0.4420148, 0.7687073, 0.6918813, 0, 0, 0, 1, 1,
-0.4401131, 0.8076385, -1.471336, 0, 0, 0, 1, 1,
-0.4382222, -1.143593, -2.012444, 1, 1, 1, 1, 1,
-0.4362471, 0.3094071, -1.128725, 1, 1, 1, 1, 1,
-0.4343943, 1.233022, 1.764358, 1, 1, 1, 1, 1,
-0.4323848, -0.8731458, -2.90623, 1, 1, 1, 1, 1,
-0.4314657, 0.9829361, 0.844369, 1, 1, 1, 1, 1,
-0.4305999, 0.6908979, 0.3143696, 1, 1, 1, 1, 1,
-0.4246237, 0.03455782, -0.04060835, 1, 1, 1, 1, 1,
-0.422848, 0.7475663, -0.03281332, 1, 1, 1, 1, 1,
-0.4227637, -1.52624, -4.459934, 1, 1, 1, 1, 1,
-0.4153598, 0.06707139, -4.080836, 1, 1, 1, 1, 1,
-0.409764, 0.009119584, -0.5097603, 1, 1, 1, 1, 1,
-0.4093915, 0.3778583, -0.9398458, 1, 1, 1, 1, 1,
-0.3972735, -0.9052592, -2.010376, 1, 1, 1, 1, 1,
-0.3942145, -1.16619, -0.4310794, 1, 1, 1, 1, 1,
-0.3874447, -0.4319113, -0.7684853, 1, 1, 1, 1, 1,
-0.3843942, -0.4112636, -2.044976, 0, 0, 1, 1, 1,
-0.380038, -0.2240513, -1.772019, 1, 0, 0, 1, 1,
-0.3790109, -0.8174879, -3.124284, 1, 0, 0, 1, 1,
-0.3742526, 0.720066, 0.6238647, 1, 0, 0, 1, 1,
-0.3702972, 0.4367719, 0.5534312, 1, 0, 0, 1, 1,
-0.3696077, 0.7293289, 0.3445706, 1, 0, 0, 1, 1,
-0.3695593, 1.080285, 1.472574, 0, 0, 0, 1, 1,
-0.3634725, 2.751344, 1.855289, 0, 0, 0, 1, 1,
-0.3611096, 0.695476, -2.753934, 0, 0, 0, 1, 1,
-0.3608266, -0.7737535, -1.344806, 0, 0, 0, 1, 1,
-0.3542816, -0.856456, -4.122319, 0, 0, 0, 1, 1,
-0.3537455, -2.033207, -3.438603, 0, 0, 0, 1, 1,
-0.3508567, -1.042228, -2.305321, 0, 0, 0, 1, 1,
-0.3438639, 1.669991, -1.443322, 1, 1, 1, 1, 1,
-0.3425415, -1.022463, -2.088218, 1, 1, 1, 1, 1,
-0.3416739, 1.246227, -1.146568, 1, 1, 1, 1, 1,
-0.3405794, 0.02446059, -1.001346, 1, 1, 1, 1, 1,
-0.3401768, 0.5777295, -0.4764035, 1, 1, 1, 1, 1,
-0.3320248, -0.1550987, -1.459251, 1, 1, 1, 1, 1,
-0.320151, 1.335397, -0.4593943, 1, 1, 1, 1, 1,
-0.3153995, -0.2643121, -3.034532, 1, 1, 1, 1, 1,
-0.3144178, 0.1869068, -0.9101368, 1, 1, 1, 1, 1,
-0.3117663, 1.974529, 1.302966, 1, 1, 1, 1, 1,
-0.3109176, -0.3293828, -1.554044, 1, 1, 1, 1, 1,
-0.3067031, -0.4044572, -2.85649, 1, 1, 1, 1, 1,
-0.3043461, -0.7369744, -3.051372, 1, 1, 1, 1, 1,
-0.3032575, 1.271742, -0.1923481, 1, 1, 1, 1, 1,
-0.3031114, 0.5384817, -0.6412361, 1, 1, 1, 1, 1,
-0.3024634, 0.3405144, -2.333428, 0, 0, 1, 1, 1,
-0.2991959, -0.4888471, -0.9524281, 1, 0, 0, 1, 1,
-0.2856095, 0.0109651, -2.175176, 1, 0, 0, 1, 1,
-0.2848784, -0.5981217, -3.206495, 1, 0, 0, 1, 1,
-0.281862, 2.031349, 0.7157742, 1, 0, 0, 1, 1,
-0.2818185, 0.4627506, 1.025422, 1, 0, 0, 1, 1,
-0.2798227, -0.9818801, -2.210989, 0, 0, 0, 1, 1,
-0.2770397, 1.104001, -0.5209522, 0, 0, 0, 1, 1,
-0.2695981, 1.051834, 0.8092525, 0, 0, 0, 1, 1,
-0.2681209, 1.126176, 1.248034, 0, 0, 0, 1, 1,
-0.2590664, -3.162108, -2.523679, 0, 0, 0, 1, 1,
-0.2578516, 1.468937, -0.4272771, 0, 0, 0, 1, 1,
-0.25772, 0.7091588, -0.8089173, 0, 0, 0, 1, 1,
-0.2548496, -1.163628, -2.998623, 1, 1, 1, 1, 1,
-0.2527146, -0.2841941, -2.403959, 1, 1, 1, 1, 1,
-0.2429334, -1.414731, -2.923149, 1, 1, 1, 1, 1,
-0.2429099, 0.3641188, -1.208542, 1, 1, 1, 1, 1,
-0.2423281, 0.7376738, -0.7975841, 1, 1, 1, 1, 1,
-0.2388388, -0.2327317, -2.450159, 1, 1, 1, 1, 1,
-0.2331859, 0.1693071, -0.7462333, 1, 1, 1, 1, 1,
-0.2325334, -1.374852, -2.764135, 1, 1, 1, 1, 1,
-0.2313903, 0.5326146, -0.397268, 1, 1, 1, 1, 1,
-0.2310501, -2.030285, -4.325599, 1, 1, 1, 1, 1,
-0.2272711, -1.39815, -3.474141, 1, 1, 1, 1, 1,
-0.2265845, 1.126156, -0.1480276, 1, 1, 1, 1, 1,
-0.2251457, 1.26428, -2.83491, 1, 1, 1, 1, 1,
-0.2235778, -0.6644971, -2.777694, 1, 1, 1, 1, 1,
-0.2216306, -1.275404, -2.870822, 1, 1, 1, 1, 1,
-0.2209619, -0.4860588, -3.109405, 0, 0, 1, 1, 1,
-0.219901, 0.5698468, -1.275196, 1, 0, 0, 1, 1,
-0.2142155, -0.4260736, -3.838624, 1, 0, 0, 1, 1,
-0.2119765, -1.225293, -4.245179, 1, 0, 0, 1, 1,
-0.2098886, -0.9283047, -0.8634797, 1, 0, 0, 1, 1,
-0.2081111, -0.303142, -2.674481, 1, 0, 0, 1, 1,
-0.2066234, 0.2172753, -0.04512331, 0, 0, 0, 1, 1,
-0.2058162, 0.9374186, -2.115723, 0, 0, 0, 1, 1,
-0.1975596, -1.346395, -2.294778, 0, 0, 0, 1, 1,
-0.1971606, -0.7756029, -2.906049, 0, 0, 0, 1, 1,
-0.1964771, 0.885362, -1.658689, 0, 0, 0, 1, 1,
-0.1963964, -0.8268541, -1.989017, 0, 0, 0, 1, 1,
-0.1933956, -1.92896, -3.949117, 0, 0, 0, 1, 1,
-0.1917146, 0.01951781, -0.8547245, 1, 1, 1, 1, 1,
-0.190738, 2.196521, -0.04587274, 1, 1, 1, 1, 1,
-0.1802553, 0.9078327, 1.220655, 1, 1, 1, 1, 1,
-0.1777377, -0.160524, -0.959253, 1, 1, 1, 1, 1,
-0.1745888, 0.363379, -0.5309585, 1, 1, 1, 1, 1,
-0.1738511, 1.115051, -1.917387, 1, 1, 1, 1, 1,
-0.1719496, 0.01628596, -1.894046, 1, 1, 1, 1, 1,
-0.1697436, 0.6839793, 0.6568915, 1, 1, 1, 1, 1,
-0.1619066, 0.6777878, -1.419108, 1, 1, 1, 1, 1,
-0.161249, 0.3148653, -1.467601, 1, 1, 1, 1, 1,
-0.1602909, -0.1296812, -2.391456, 1, 1, 1, 1, 1,
-0.1571575, -2.776505, -4.580891, 1, 1, 1, 1, 1,
-0.1521443, -0.6601445, -3.376278, 1, 1, 1, 1, 1,
-0.1520946, 0.3045054, -0.1046609, 1, 1, 1, 1, 1,
-0.1489705, 1.769208, 0.6366238, 1, 1, 1, 1, 1,
-0.1460027, -0.7706051, -3.709671, 0, 0, 1, 1, 1,
-0.1310023, -0.1178068, -1.988309, 1, 0, 0, 1, 1,
-0.1304293, -1.503748, -3.130133, 1, 0, 0, 1, 1,
-0.1275615, -1.108244, -3.807662, 1, 0, 0, 1, 1,
-0.1270716, -1.416262, -3.243804, 1, 0, 0, 1, 1,
-0.1204479, -1.582067, -2.725514, 1, 0, 0, 1, 1,
-0.1155365, -0.9778612, -2.752387, 0, 0, 0, 1, 1,
-0.1152503, -0.4752534, -4.616419, 0, 0, 0, 1, 1,
-0.1116424, -0.8559231, -4.895485, 0, 0, 0, 1, 1,
-0.1054529, -0.3687342, -2.842754, 0, 0, 0, 1, 1,
-0.1049201, 0.607492, 0.8673529, 0, 0, 0, 1, 1,
-0.09502149, 0.6725318, -0.6458096, 0, 0, 0, 1, 1,
-0.09369427, 1.614242, -0.9885255, 0, 0, 0, 1, 1,
-0.09189806, -0.1268042, -2.059158, 1, 1, 1, 1, 1,
-0.09151556, 1.4634, -1.052834, 1, 1, 1, 1, 1,
-0.08915188, 0.7573616, 0.2511296, 1, 1, 1, 1, 1,
-0.08592139, -0.6055205, -4.354844, 1, 1, 1, 1, 1,
-0.08340511, -0.1866502, -2.372213, 1, 1, 1, 1, 1,
-0.08074211, 0.2854294, 0.08710484, 1, 1, 1, 1, 1,
-0.07500711, 0.1298922, -1.095716, 1, 1, 1, 1, 1,
-0.07499444, 0.2902646, 0.006749565, 1, 1, 1, 1, 1,
-0.0722677, 0.1067779, 0.3221781, 1, 1, 1, 1, 1,
-0.06876969, 1.141385, 1.075057, 1, 1, 1, 1, 1,
-0.06609701, -2.306123, -4.289462, 1, 1, 1, 1, 1,
-0.06042515, 0.1302581, -1.912519, 1, 1, 1, 1, 1,
-0.05850266, -0.7216242, -1.455801, 1, 1, 1, 1, 1,
-0.05641345, 0.8160967, 0.4650152, 1, 1, 1, 1, 1,
-0.05250366, -0.9449502, -3.133216, 1, 1, 1, 1, 1,
-0.04545033, 1.122917, 0.7419262, 0, 0, 1, 1, 1,
-0.04535006, 0.2773272, -0.4343462, 1, 0, 0, 1, 1,
-0.04110786, 0.7025126, 0.07127045, 1, 0, 0, 1, 1,
-0.03854221, 0.2316137, 0.633698, 1, 0, 0, 1, 1,
-0.03759592, -0.7991703, -4.197674, 1, 0, 0, 1, 1,
-0.03165168, 0.2989403, 0.6684853, 1, 0, 0, 1, 1,
-0.02981952, -1.171002, -3.201748, 0, 0, 0, 1, 1,
-0.0285893, 0.6920634, 0.1281303, 0, 0, 0, 1, 1,
-0.02497805, 0.3782627, -0.7629507, 0, 0, 0, 1, 1,
-0.02222471, 0.08245316, -1.154317, 0, 0, 0, 1, 1,
-0.02096038, 0.8613534, -1.306629, 0, 0, 0, 1, 1,
-0.02092848, 0.7119508, 1.841146, 0, 0, 0, 1, 1,
-0.01968516, 1.295874, -1.750365, 0, 0, 0, 1, 1,
-0.01862765, 0.008810161, 0.9157394, 1, 1, 1, 1, 1,
-0.01586495, -0.6791549, -3.636895, 1, 1, 1, 1, 1,
-0.01339732, 0.1052641, -0.7096563, 1, 1, 1, 1, 1,
-0.01242658, 1.578842, 0.9461796, 1, 1, 1, 1, 1,
-0.01044441, 0.01326468, -0.1320608, 1, 1, 1, 1, 1,
-0.006733538, 0.8102429, 1.268747, 1, 1, 1, 1, 1,
-0.005259906, -0.04257982, -4.971271, 1, 1, 1, 1, 1,
-0.004562152, 0.3416536, 0.4775745, 1, 1, 1, 1, 1,
-0.002561429, 1.050567, -0.001520347, 1, 1, 1, 1, 1,
0.0007868803, 1.00013, 1.569915, 1, 1, 1, 1, 1,
0.000856796, -0.384457, 2.96459, 1, 1, 1, 1, 1,
0.004297223, 0.590256, 0.2572953, 1, 1, 1, 1, 1,
0.006151431, -0.7365314, 3.822299, 1, 1, 1, 1, 1,
0.007536781, -0.06918531, 3.659463, 1, 1, 1, 1, 1,
0.007840627, -0.1317368, 4.341965, 1, 1, 1, 1, 1,
0.008870942, -0.04777494, 3.626801, 0, 0, 1, 1, 1,
0.009214791, -1.837294, 2.329269, 1, 0, 0, 1, 1,
0.01891151, 0.4427311, 0.03839685, 1, 0, 0, 1, 1,
0.02027574, 0.1904246, 1.496966, 1, 0, 0, 1, 1,
0.0313199, 1.867491, -0.5533119, 1, 0, 0, 1, 1,
0.03783849, 0.995609, -0.1920787, 1, 0, 0, 1, 1,
0.04292747, 1.30742, 0.1986707, 0, 0, 0, 1, 1,
0.0522498, -0.7131715, 1.175167, 0, 0, 0, 1, 1,
0.05286622, 0.7775816, -0.4312153, 0, 0, 0, 1, 1,
0.05368112, -0.05837715, 1.718086, 0, 0, 0, 1, 1,
0.05370582, -1.194275, 2.884257, 0, 0, 0, 1, 1,
0.05375712, 0.01607385, 0.9219489, 0, 0, 0, 1, 1,
0.05534402, 1.741479, 0.0603626, 0, 0, 0, 1, 1,
0.05632936, 1.52036, -0.8246711, 1, 1, 1, 1, 1,
0.0576417, -1.839487, 4.254107, 1, 1, 1, 1, 1,
0.0603099, -0.5680301, 3.868056, 1, 1, 1, 1, 1,
0.06051749, -1.450537, 4.674558, 1, 1, 1, 1, 1,
0.06518716, -0.02004055, 3.037731, 1, 1, 1, 1, 1,
0.06598669, 2.179338, -0.3932637, 1, 1, 1, 1, 1,
0.06976642, -0.9775963, 2.918866, 1, 1, 1, 1, 1,
0.07073002, -0.3794883, 2.360594, 1, 1, 1, 1, 1,
0.07745426, -2.644081, 3.976803, 1, 1, 1, 1, 1,
0.07812414, 0.6486311, 2.011209, 1, 1, 1, 1, 1,
0.07967507, -0.110007, 2.556597, 1, 1, 1, 1, 1,
0.08070853, 1.237621, -0.518859, 1, 1, 1, 1, 1,
0.08314401, -0.6663753, 2.76228, 1, 1, 1, 1, 1,
0.08929365, 0.3975823, 1.632804, 1, 1, 1, 1, 1,
0.09010442, 0.1897483, 1.097597, 1, 1, 1, 1, 1,
0.09013575, -0.4965362, 2.996587, 0, 0, 1, 1, 1,
0.1002676, -0.1979635, 3.154738, 1, 0, 0, 1, 1,
0.1003689, -0.6332952, 3.616705, 1, 0, 0, 1, 1,
0.1005702, -1.011758, 2.046561, 1, 0, 0, 1, 1,
0.1011727, -0.4365569, 2.287966, 1, 0, 0, 1, 1,
0.1023796, 1.009578, 0.921774, 1, 0, 0, 1, 1,
0.1026578, -0.0436045, 3.142467, 0, 0, 0, 1, 1,
0.108175, -1.733991, 2.86272, 0, 0, 0, 1, 1,
0.1088562, 0.2033889, -0.8884044, 0, 0, 0, 1, 1,
0.1095543, 0.2161956, 3.304946, 0, 0, 0, 1, 1,
0.1101617, -0.6458369, 2.473662, 0, 0, 0, 1, 1,
0.1106948, -0.7279128, 2.207353, 0, 0, 0, 1, 1,
0.1126691, -0.577429, 2.60478, 0, 0, 0, 1, 1,
0.1127606, 2.435018, 0.6386202, 1, 1, 1, 1, 1,
0.1132289, 1.2598, -0.6077753, 1, 1, 1, 1, 1,
0.1138954, -0.3327236, 3.215302, 1, 1, 1, 1, 1,
0.1170916, -2.300845, 3.488291, 1, 1, 1, 1, 1,
0.1175607, -0.2746975, 2.439599, 1, 1, 1, 1, 1,
0.1198895, 0.5348209, 0.4426753, 1, 1, 1, 1, 1,
0.1219855, 2.228157, 0.03419328, 1, 1, 1, 1, 1,
0.1239698, 0.008929382, 1.055338, 1, 1, 1, 1, 1,
0.1312252, -1.079334, 3.051984, 1, 1, 1, 1, 1,
0.1318042, -0.6781707, 1.866838, 1, 1, 1, 1, 1,
0.1337527, 0.490373, 0.471316, 1, 1, 1, 1, 1,
0.1350678, 0.6984066, 0.1301129, 1, 1, 1, 1, 1,
0.1359318, -0.3460666, 2.329602, 1, 1, 1, 1, 1,
0.1390802, -0.1954489, 2.418013, 1, 1, 1, 1, 1,
0.1553638, 0.9192104, 1.22471, 1, 1, 1, 1, 1,
0.1567101, -0.04554235, 1.154424, 0, 0, 1, 1, 1,
0.1616216, 1.052688, 0.7468894, 1, 0, 0, 1, 1,
0.1619167, -1.030963, 4.195311, 1, 0, 0, 1, 1,
0.1625936, 0.6497599, 0.5415007, 1, 0, 0, 1, 1,
0.1640636, 1.565316, -1.283303, 1, 0, 0, 1, 1,
0.1644024, -1.309876, 3.993029, 1, 0, 0, 1, 1,
0.164923, 0.6767845, -1.361623, 0, 0, 0, 1, 1,
0.1661495, -0.04580986, 3.076562, 0, 0, 0, 1, 1,
0.1676001, -1.157651, 2.976619, 0, 0, 0, 1, 1,
0.1712218, -0.3327655, 2.752784, 0, 0, 0, 1, 1,
0.1727889, 1.053506, -1.309575, 0, 0, 0, 1, 1,
0.1731367, -0.4881934, 4.168316, 0, 0, 0, 1, 1,
0.1816541, 1.543687, -0.8854337, 0, 0, 0, 1, 1,
0.1830647, -1.684495, 2.397042, 1, 1, 1, 1, 1,
0.1835432, -0.9496164, 2.255283, 1, 1, 1, 1, 1,
0.184925, 1.563224, -0.1187907, 1, 1, 1, 1, 1,
0.1864275, 0.8924535, 0.01537677, 1, 1, 1, 1, 1,
0.1873164, -0.08421803, 1.976879, 1, 1, 1, 1, 1,
0.1876566, 1.103302, -1.259434, 1, 1, 1, 1, 1,
0.187797, -0.2707639, 1.75254, 1, 1, 1, 1, 1,
0.1913781, -1.339491, 3.394441, 1, 1, 1, 1, 1,
0.1945775, 0.1574742, 2.026349, 1, 1, 1, 1, 1,
0.1950883, 1.43264, 1.525365, 1, 1, 1, 1, 1,
0.1979278, 1.745818, -1.223772, 1, 1, 1, 1, 1,
0.2032058, 0.9310611, 0.4170451, 1, 1, 1, 1, 1,
0.2037951, -1.775709, 3.394241, 1, 1, 1, 1, 1,
0.2070029, 0.09785058, -0.2264581, 1, 1, 1, 1, 1,
0.2097154, 1.265316, 0.3390198, 1, 1, 1, 1, 1,
0.2168371, 0.6626635, -1.446166, 0, 0, 1, 1, 1,
0.2223467, 0.7765427, -0.9787492, 1, 0, 0, 1, 1,
0.2248688, 1.342559, 0.7561367, 1, 0, 0, 1, 1,
0.2260747, 1.069248, 1.484509, 1, 0, 0, 1, 1,
0.22912, -0.903363, 2.94203, 1, 0, 0, 1, 1,
0.2299573, -0.1589787, 2.759238, 1, 0, 0, 1, 1,
0.2309045, -0.2834623, 2.446667, 0, 0, 0, 1, 1,
0.2331879, 0.7245862, 0.7808883, 0, 0, 0, 1, 1,
0.234663, 1.893386, 1.263184, 0, 0, 0, 1, 1,
0.2404867, 0.3260415, -0.1269753, 0, 0, 0, 1, 1,
0.2426142, -1.228965, 1.417239, 0, 0, 0, 1, 1,
0.2482586, -1.94159, 3.251772, 0, 0, 0, 1, 1,
0.2518588, 0.9637408, 0.4316048, 0, 0, 0, 1, 1,
0.2531763, 2.054056, -1.008583, 1, 1, 1, 1, 1,
0.2538289, 1.108562, 1.401953, 1, 1, 1, 1, 1,
0.2568137, 0.2614527, -0.1217806, 1, 1, 1, 1, 1,
0.257029, 0.4114396, 0.8763514, 1, 1, 1, 1, 1,
0.2594462, -0.6376485, 3.031831, 1, 1, 1, 1, 1,
0.2630411, 0.1282777, 1.56817, 1, 1, 1, 1, 1,
0.2656941, 1.640402, 0.5970073, 1, 1, 1, 1, 1,
0.2657408, -0.8198756, 2.956359, 1, 1, 1, 1, 1,
0.2659665, -1.468452, 4.001242, 1, 1, 1, 1, 1,
0.2661467, -0.922416, 3.055779, 1, 1, 1, 1, 1,
0.2690194, -1.411459, 3.041723, 1, 1, 1, 1, 1,
0.2725422, 0.357745, 0.7344429, 1, 1, 1, 1, 1,
0.2753738, -2.492006, 2.03362, 1, 1, 1, 1, 1,
0.2769198, 0.6172426, 0.1511335, 1, 1, 1, 1, 1,
0.2769368, 0.05426354, 1.779702, 1, 1, 1, 1, 1,
0.2810759, 2.239183, -0.938293, 0, 0, 1, 1, 1,
0.2836054, -0.005102912, 2.091753, 1, 0, 0, 1, 1,
0.2877325, -1.077597, 2.752054, 1, 0, 0, 1, 1,
0.2877943, -0.7824476, 3.331394, 1, 0, 0, 1, 1,
0.2884866, -1.997043, 1.699045, 1, 0, 0, 1, 1,
0.2917686, 0.6475948, -0.9873232, 1, 0, 0, 1, 1,
0.2946382, -0.7584062, 3.296604, 0, 0, 0, 1, 1,
0.2951111, 1.010437, -0.2665465, 0, 0, 0, 1, 1,
0.2954788, -1.012045, 2.034835, 0, 0, 0, 1, 1,
0.2990718, 0.3292911, 0.4129905, 0, 0, 0, 1, 1,
0.3004812, 1.069913, -0.6009182, 0, 0, 0, 1, 1,
0.3048195, -1.469842, 2.858713, 0, 0, 0, 1, 1,
0.307616, -0.1562178, 1.501732, 0, 0, 0, 1, 1,
0.3104862, -1.550955, 4.190998, 1, 1, 1, 1, 1,
0.3133287, -0.5987936, 1.464622, 1, 1, 1, 1, 1,
0.3143934, -1.727409, 2.605222, 1, 1, 1, 1, 1,
0.3168918, 0.6288598, 2.123014, 1, 1, 1, 1, 1,
0.3208475, -0.2384012, 2.008572, 1, 1, 1, 1, 1,
0.3217548, 0.5916954, -0.3230873, 1, 1, 1, 1, 1,
0.3223616, 0.3841103, 1.299325, 1, 1, 1, 1, 1,
0.3241648, -0.02324417, 3.145627, 1, 1, 1, 1, 1,
0.3294439, -1.766763, 2.56686, 1, 1, 1, 1, 1,
0.3306411, -0.3390313, 1.994522, 1, 1, 1, 1, 1,
0.3327449, 1.601896, -0.4611495, 1, 1, 1, 1, 1,
0.3332392, 0.2828433, 1.8784, 1, 1, 1, 1, 1,
0.3392946, 0.06260628, 1.539153, 1, 1, 1, 1, 1,
0.3399895, 0.2302188, -0.1536283, 1, 1, 1, 1, 1,
0.3415934, -1.281536, 3.875691, 1, 1, 1, 1, 1,
0.342047, -0.05692697, 0.457872, 0, 0, 1, 1, 1,
0.3434669, -0.9422062, 3.517845, 1, 0, 0, 1, 1,
0.3451074, -0.8451484, 3.507345, 1, 0, 0, 1, 1,
0.3523814, -1.090874, 2.704928, 1, 0, 0, 1, 1,
0.357501, -0.8727859, 3.30759, 1, 0, 0, 1, 1,
0.3591737, -0.9611964, 3.596679, 1, 0, 0, 1, 1,
0.3650257, -1.937973, 4.222275, 0, 0, 0, 1, 1,
0.3654808, 0.7068914, 0.8764067, 0, 0, 0, 1, 1,
0.3741659, -0.5484453, 2.873455, 0, 0, 0, 1, 1,
0.3839442, 0.9112859, -0.1053127, 0, 0, 0, 1, 1,
0.3840706, 0.06772961, 1.060684, 0, 0, 0, 1, 1,
0.384853, -0.1239395, 2.496021, 0, 0, 0, 1, 1,
0.3863871, -1.02854, 2.056741, 0, 0, 0, 1, 1,
0.3883084, 1.340282, -0.3199731, 1, 1, 1, 1, 1,
0.389399, 0.5236986, 0.4053376, 1, 1, 1, 1, 1,
0.3905591, 0.1334428, 1.219195, 1, 1, 1, 1, 1,
0.3932936, -0.9046817, 1.855989, 1, 1, 1, 1, 1,
0.3950468, -0.227909, 2.522774, 1, 1, 1, 1, 1,
0.3951596, 1.042435, 0.624559, 1, 1, 1, 1, 1,
0.4019922, -1.288007, 1.480227, 1, 1, 1, 1, 1,
0.4068592, -1.2079, 3.215485, 1, 1, 1, 1, 1,
0.4125488, 1.045268, -1.477708, 1, 1, 1, 1, 1,
0.4158554, -0.1067093, 2.175868, 1, 1, 1, 1, 1,
0.4205137, 0.8497775, 0.4657141, 1, 1, 1, 1, 1,
0.420582, -0.6132465, 2.767429, 1, 1, 1, 1, 1,
0.4242732, 0.5371251, -0.06125884, 1, 1, 1, 1, 1,
0.4258699, 1.629916, -0.6397696, 1, 1, 1, 1, 1,
0.4366195, -0.1517163, 2.029605, 1, 1, 1, 1, 1,
0.4415334, 1.510739, 0.621797, 0, 0, 1, 1, 1,
0.4464542, -0.9448866, 1.32658, 1, 0, 0, 1, 1,
0.4501257, -0.9665718, 0.7477087, 1, 0, 0, 1, 1,
0.4637479, -0.9804147, 3.074458, 1, 0, 0, 1, 1,
0.4657152, 3.076379, -0.147966, 1, 0, 0, 1, 1,
0.4666594, 0.6612458, -0.3674227, 1, 0, 0, 1, 1,
0.4673101, 0.4854147, 1.167657, 0, 0, 0, 1, 1,
0.4693094, 0.5190492, -0.08065536, 0, 0, 0, 1, 1,
0.4777913, -0.4341966, 2.806193, 0, 0, 0, 1, 1,
0.4819143, -0.4382896, 3.38131, 0, 0, 0, 1, 1,
0.4968067, -0.4842994, 1.610118, 0, 0, 0, 1, 1,
0.504798, 1.751923, -0.03308183, 0, 0, 0, 1, 1,
0.5050907, 1.00778, -1.266621, 0, 0, 0, 1, 1,
0.5112954, 0.9509285, 0.08493895, 1, 1, 1, 1, 1,
0.5192678, 0.9511898, 1.877436, 1, 1, 1, 1, 1,
0.5196593, -0.3468872, 2.538552, 1, 1, 1, 1, 1,
0.5210037, 0.2637559, 0.9817807, 1, 1, 1, 1, 1,
0.5230317, 0.5987158, -0.2389987, 1, 1, 1, 1, 1,
0.527846, 1.902077, 0.568377, 1, 1, 1, 1, 1,
0.5292161, -0.1949313, 2.468422, 1, 1, 1, 1, 1,
0.5298512, 1.433685, 0.02322559, 1, 1, 1, 1, 1,
0.5300879, -0.2545874, 3.165802, 1, 1, 1, 1, 1,
0.5351895, 0.8865214, 2.597241, 1, 1, 1, 1, 1,
0.5382949, -0.8903844, 3.628493, 1, 1, 1, 1, 1,
0.5393059, -0.848716, 1.001995, 1, 1, 1, 1, 1,
0.5397069, 0.9090999, 2.019685, 1, 1, 1, 1, 1,
0.5413007, -0.08217259, 2.122061, 1, 1, 1, 1, 1,
0.5429578, -0.9945289, 3.334347, 1, 1, 1, 1, 1,
0.5477377, -1.402885, 3.303123, 0, 0, 1, 1, 1,
0.5497261, -1.958178, 2.145988, 1, 0, 0, 1, 1,
0.5504352, 0.884919, 0.01975134, 1, 0, 0, 1, 1,
0.5506506, -0.3592912, 3.841157, 1, 0, 0, 1, 1,
0.5529278, -0.1418727, 2.617547, 1, 0, 0, 1, 1,
0.5545666, -0.46412, 1.875656, 1, 0, 0, 1, 1,
0.5629199, -1.858334, 4.381222, 0, 0, 0, 1, 1,
0.5655172, -1.738395, 3.635411, 0, 0, 0, 1, 1,
0.5656563, 0.1526809, 1.133158, 0, 0, 0, 1, 1,
0.571142, -0.2820471, 2.863962, 0, 0, 0, 1, 1,
0.5716597, 0.4601116, 0.8984616, 0, 0, 0, 1, 1,
0.5756434, 0.7354671, 0.5260736, 0, 0, 0, 1, 1,
0.5797444, -0.07667246, 1.608476, 0, 0, 0, 1, 1,
0.5835152, 1.365966, 1.064021, 1, 1, 1, 1, 1,
0.5867446, -0.4704476, 2.490487, 1, 1, 1, 1, 1,
0.587711, 0.6535801, 1.045991, 1, 1, 1, 1, 1,
0.5883506, -1.534946, 2.564112, 1, 1, 1, 1, 1,
0.593356, -0.5362394, 3.090164, 1, 1, 1, 1, 1,
0.5968893, -0.8556052, 3.410112, 1, 1, 1, 1, 1,
0.5991055, 0.03034355, 1.761919, 1, 1, 1, 1, 1,
0.599696, 1.005736, 1.13042, 1, 1, 1, 1, 1,
0.6000157, 0.02739253, 1.368342, 1, 1, 1, 1, 1,
0.6032364, -0.713941, 3.222196, 1, 1, 1, 1, 1,
0.6043587, -0.4121426, 1.76902, 1, 1, 1, 1, 1,
0.6058301, 0.2038405, -1.029628, 1, 1, 1, 1, 1,
0.6100094, -0.1442794, 2.833962, 1, 1, 1, 1, 1,
0.6103508, -0.7823633, 2.21036, 1, 1, 1, 1, 1,
0.6125955, -0.1698228, 2.472174, 1, 1, 1, 1, 1,
0.6126481, -0.3222965, 1.129265, 0, 0, 1, 1, 1,
0.6195215, -0.8676107, 2.815698, 1, 0, 0, 1, 1,
0.6235017, -1.749086, 3.559456, 1, 0, 0, 1, 1,
0.6293219, -1.385217, 2.202104, 1, 0, 0, 1, 1,
0.6358054, 0.2363914, 0.5303284, 1, 0, 0, 1, 1,
0.6362264, 0.4476045, 1.980469, 1, 0, 0, 1, 1,
0.6363379, -1.53968, 2.037923, 0, 0, 0, 1, 1,
0.6383343, -0.4863106, 2.391217, 0, 0, 0, 1, 1,
0.6407767, -0.06635025, -0.1027364, 0, 0, 0, 1, 1,
0.6409706, 0.2431605, 1.197983, 0, 0, 0, 1, 1,
0.6414006, 2.079491, -0.6541049, 0, 0, 0, 1, 1,
0.6422226, -0.1391532, 2.161959, 0, 0, 0, 1, 1,
0.6441476, -0.4300128, 3.503708, 0, 0, 0, 1, 1,
0.6445284, 0.3044673, 0.8489971, 1, 1, 1, 1, 1,
0.6548989, 0.785486, 1.469161, 1, 1, 1, 1, 1,
0.6556663, -2.058323, 3.105255, 1, 1, 1, 1, 1,
0.6567643, -0.6467092, 0.950832, 1, 1, 1, 1, 1,
0.6578979, -0.5540832, 1.460978, 1, 1, 1, 1, 1,
0.6619706, 1.540943, -0.3310324, 1, 1, 1, 1, 1,
0.6758535, -1.197197, 2.951608, 1, 1, 1, 1, 1,
0.6793602, -0.2506492, 1.323433, 1, 1, 1, 1, 1,
0.6801356, -0.3082927, 0.08899955, 1, 1, 1, 1, 1,
0.6807017, 0.8737162, 0.1343962, 1, 1, 1, 1, 1,
0.681398, 0.971361, 0.8001126, 1, 1, 1, 1, 1,
0.6860948, 1.331496, 2.521084, 1, 1, 1, 1, 1,
0.6956686, -0.7316916, 1.660467, 1, 1, 1, 1, 1,
0.7005463, -0.7871851, 1.915637, 1, 1, 1, 1, 1,
0.7011942, 0.4174955, 0.8856282, 1, 1, 1, 1, 1,
0.7038302, 2.300995, -0.4555288, 0, 0, 1, 1, 1,
0.7044425, 1.754827, -0.6008422, 1, 0, 0, 1, 1,
0.7056891, -0.1733827, 3.157934, 1, 0, 0, 1, 1,
0.7060494, -0.1781648, 0.7372958, 1, 0, 0, 1, 1,
0.7124954, -1.682301, 3.899082, 1, 0, 0, 1, 1,
0.7125859, 0.6193888, 1.951043, 1, 0, 0, 1, 1,
0.7133839, 2.37205, -1.037101, 0, 0, 0, 1, 1,
0.7148251, -2.043742, 2.600586, 0, 0, 0, 1, 1,
0.7151142, -0.07194313, 2.095878, 0, 0, 0, 1, 1,
0.7162374, 0.3960685, 0.5701304, 0, 0, 0, 1, 1,
0.7176394, -1.036106, 3.647574, 0, 0, 0, 1, 1,
0.7199473, 0.4877415, 1.958663, 0, 0, 0, 1, 1,
0.7239496, 0.5510712, 1.029423, 0, 0, 0, 1, 1,
0.7254897, 1.27818, -0.446541, 1, 1, 1, 1, 1,
0.7270808, 0.9479592, 1.492707, 1, 1, 1, 1, 1,
0.7292146, -0.1310946, 1.707747, 1, 1, 1, 1, 1,
0.7334752, 0.2619171, -0.964445, 1, 1, 1, 1, 1,
0.7335677, 1.172942, -1.561506, 1, 1, 1, 1, 1,
0.7356885, -0.6363654, 0.9140756, 1, 1, 1, 1, 1,
0.7372085, -1.132242, 3.01099, 1, 1, 1, 1, 1,
0.7379905, -0.008094186, 1.485971, 1, 1, 1, 1, 1,
0.738039, 1.002954, 0.3624293, 1, 1, 1, 1, 1,
0.7404553, 1.467545, 0.1414267, 1, 1, 1, 1, 1,
0.7427827, -1.60797, 1.300759, 1, 1, 1, 1, 1,
0.7567453, 0.156064, 1.752073, 1, 1, 1, 1, 1,
0.7580761, -0.9205792, 2.09474, 1, 1, 1, 1, 1,
0.7597045, -0.2528608, 1.833807, 1, 1, 1, 1, 1,
0.7703465, 0.08865787, 0.7143466, 1, 1, 1, 1, 1,
0.7721962, 0.6059325, -0.4872465, 0, 0, 1, 1, 1,
0.7732137, -0.2670168, 0.5124026, 1, 0, 0, 1, 1,
0.7738209, -0.3188851, 2.015877, 1, 0, 0, 1, 1,
0.7751692, -0.6000699, 1.996534, 1, 0, 0, 1, 1,
0.7846575, -0.6204825, 3.400191, 1, 0, 0, 1, 1,
0.7881844, 2.759041, 1.012405, 1, 0, 0, 1, 1,
0.7885084, -0.5859693, 2.842344, 0, 0, 0, 1, 1,
0.7890652, 0.03863774, 3.172364, 0, 0, 0, 1, 1,
0.7941993, 0.6769288, 0.4593787, 0, 0, 0, 1, 1,
0.7947399, -0.7131968, 1.25765, 0, 0, 0, 1, 1,
0.7960992, -1.648459, 1.996974, 0, 0, 0, 1, 1,
0.7984994, -1.310029, 0.3615734, 0, 0, 0, 1, 1,
0.8045907, 1.715104, 1.084901, 0, 0, 0, 1, 1,
0.8086479, 1.077813, 2.013001, 1, 1, 1, 1, 1,
0.8108557, -0.1217791, 0.4442803, 1, 1, 1, 1, 1,
0.813086, -0.2776945, 1.025738, 1, 1, 1, 1, 1,
0.8308437, -0.608336, 0.5792203, 1, 1, 1, 1, 1,
0.8407623, 0.5102159, 0.7505641, 1, 1, 1, 1, 1,
0.8495675, 0.568821, 0.2681105, 1, 1, 1, 1, 1,
0.85381, 0.7673599, 1.548961, 1, 1, 1, 1, 1,
0.8547253, 1.605899, 1.387245, 1, 1, 1, 1, 1,
0.8550916, 1.459678, 0.06272293, 1, 1, 1, 1, 1,
0.8566198, -0.1125015, 1.482623, 1, 1, 1, 1, 1,
0.8593826, -2.102195, 2.708786, 1, 1, 1, 1, 1,
0.8598172, -0.1456531, 0.7845669, 1, 1, 1, 1, 1,
0.8639973, -0.6119847, 3.300673, 1, 1, 1, 1, 1,
0.865693, 0.3114198, 0.1946466, 1, 1, 1, 1, 1,
0.8698308, 0.1768209, 0.9489013, 1, 1, 1, 1, 1,
0.8746243, 0.5243449, 2.134162, 0, 0, 1, 1, 1,
0.8761305, 0.8567945, 0.4906496, 1, 0, 0, 1, 1,
0.8782661, 1.7018, -0.002908792, 1, 0, 0, 1, 1,
0.886908, -0.2750338, 1.970184, 1, 0, 0, 1, 1,
0.8877772, 0.6194602, 1.475904, 1, 0, 0, 1, 1,
0.8899942, 0.8294657, -1.744803, 1, 0, 0, 1, 1,
0.890071, -1.302828, 1.102245, 0, 0, 0, 1, 1,
0.8937957, -0.1310928, 1.693333, 0, 0, 0, 1, 1,
0.8970664, -0.7755019, 2.76964, 0, 0, 0, 1, 1,
0.8998394, 1.297616, 0.8722552, 0, 0, 0, 1, 1,
0.9000447, -1.246467, 3.007156, 0, 0, 0, 1, 1,
0.9009023, -1.452179, 1.492408, 0, 0, 0, 1, 1,
0.9022629, 1.072004, 0.007713137, 0, 0, 0, 1, 1,
0.9025882, 0.2618125, -0.4532023, 1, 1, 1, 1, 1,
0.9084986, 0.3473056, 1.478457, 1, 1, 1, 1, 1,
0.9158535, -0.389041, 1.78463, 1, 1, 1, 1, 1,
0.9159205, -0.2381907, 1.855356, 1, 1, 1, 1, 1,
0.9164808, -0.1672174, 1.857253, 1, 1, 1, 1, 1,
0.9253111, 0.9186411, -0.4387639, 1, 1, 1, 1, 1,
0.9319307, 1.883197, -0.8532072, 1, 1, 1, 1, 1,
0.9391053, 0.4427086, 0.02602633, 1, 1, 1, 1, 1,
0.9392082, -1.358136, 2.295092, 1, 1, 1, 1, 1,
0.9449348, 1.338758, 0.7208845, 1, 1, 1, 1, 1,
0.9518412, 0.4656654, -1.159193, 1, 1, 1, 1, 1,
0.952892, -0.5036888, 2.865364, 1, 1, 1, 1, 1,
0.9560736, 1.984028, 2.167588, 1, 1, 1, 1, 1,
0.9585903, -0.9103304, 1.990199, 1, 1, 1, 1, 1,
0.962885, -0.1385161, 3.125045, 1, 1, 1, 1, 1,
0.9630773, 0.9938435, 1.047048, 0, 0, 1, 1, 1,
0.9651218, 0.5149055, 1.397872, 1, 0, 0, 1, 1,
0.9685448, -0.3516951, 3.118026, 1, 0, 0, 1, 1,
0.9720048, 0.1826122, 1.962744, 1, 0, 0, 1, 1,
0.9787147, -1.958939, 1.958912, 1, 0, 0, 1, 1,
0.9851705, 1.640492, 0.9579263, 1, 0, 0, 1, 1,
0.9902707, -0.7999802, 1.368875, 0, 0, 0, 1, 1,
0.990942, -0.9744881, 1.813323, 0, 0, 0, 1, 1,
0.9927802, 0.801289, 1.296888, 0, 0, 0, 1, 1,
0.9945048, -0.882592, 1.644931, 0, 0, 0, 1, 1,
0.9990584, 1.350521, 3.085206, 0, 0, 0, 1, 1,
1.01451, 1.736782, 2.303631, 0, 0, 0, 1, 1,
1.016584, 0.3002576, 0.9704244, 0, 0, 0, 1, 1,
1.017848, -2.023523, 3.056029, 1, 1, 1, 1, 1,
1.020716, -0.01993652, 2.871799, 1, 1, 1, 1, 1,
1.02375, 0.2181035, 1.092349, 1, 1, 1, 1, 1,
1.023999, -1.209185, 0.913824, 1, 1, 1, 1, 1,
1.026341, -0.621207, 3.844661, 1, 1, 1, 1, 1,
1.032367, -0.5178138, 0.06230868, 1, 1, 1, 1, 1,
1.034896, 0.5996323, 1.733631, 1, 1, 1, 1, 1,
1.046409, 0.2562893, 1.283786, 1, 1, 1, 1, 1,
1.046481, 1.96537, 0.7054673, 1, 1, 1, 1, 1,
1.046964, 0.2150066, -0.3570685, 1, 1, 1, 1, 1,
1.054958, -0.3544359, 2.664665, 1, 1, 1, 1, 1,
1.056072, 1.08576, 0.388103, 1, 1, 1, 1, 1,
1.058298, -0.3987377, 2.37467, 1, 1, 1, 1, 1,
1.066447, -2.061283, 3.599635, 1, 1, 1, 1, 1,
1.06786, -0.2564081, -0.4496629, 1, 1, 1, 1, 1,
1.076796, 1.188699, 0.120403, 0, 0, 1, 1, 1,
1.077201, -1.192412, 1.06967, 1, 0, 0, 1, 1,
1.077644, 0.3965188, 1.209275, 1, 0, 0, 1, 1,
1.080981, -0.5790333, 3.228236, 1, 0, 0, 1, 1,
1.082433, 1.719953, 0.2827044, 1, 0, 0, 1, 1,
1.084811, 0.2186944, 1.018701, 1, 0, 0, 1, 1,
1.105293, 0.1966073, 0.5804856, 0, 0, 0, 1, 1,
1.107214, -0.612393, 0.6824515, 0, 0, 0, 1, 1,
1.116286, -0.3413074, 2.818193, 0, 0, 0, 1, 1,
1.116327, 1.410959, 1.756131, 0, 0, 0, 1, 1,
1.124763, -0.1605238, 2.693626, 0, 0, 0, 1, 1,
1.133338, 0.5131969, 0.8579675, 0, 0, 0, 1, 1,
1.133406, -0.5417921, 2.752428, 0, 0, 0, 1, 1,
1.135135, 1.138973, 0.2205795, 1, 1, 1, 1, 1,
1.136361, -0.2984762, 3.014305, 1, 1, 1, 1, 1,
1.137818, 0.05300811, -0.7922721, 1, 1, 1, 1, 1,
1.138045, -0.1826606, 1.253041, 1, 1, 1, 1, 1,
1.147015, -0.01912767, 3.374018, 1, 1, 1, 1, 1,
1.157656, 0.2866088, 1.732215, 1, 1, 1, 1, 1,
1.167158, -1.118969, 2.385389, 1, 1, 1, 1, 1,
1.17811, -0.1728607, 2.238221, 1, 1, 1, 1, 1,
1.178825, 0.7867209, 0.3533666, 1, 1, 1, 1, 1,
1.181988, -0.9748772, 3.344752, 1, 1, 1, 1, 1,
1.183533, 0.1006557, 1.822819, 1, 1, 1, 1, 1,
1.183694, 0.04712443, 0.7356369, 1, 1, 1, 1, 1,
1.186309, 0.7566832, 0.9509052, 1, 1, 1, 1, 1,
1.195607, 1.898896, -1.837619, 1, 1, 1, 1, 1,
1.196941, -0.739479, 3.440022, 1, 1, 1, 1, 1,
1.199672, -0.2840241, 2.341048, 0, 0, 1, 1, 1,
1.202992, 1.226718, 0.2426166, 1, 0, 0, 1, 1,
1.207077, -0.508073, 3.650481, 1, 0, 0, 1, 1,
1.20788, -1.513846, 0.7379606, 1, 0, 0, 1, 1,
1.209178, 0.4613658, 1.913237, 1, 0, 0, 1, 1,
1.210105, -0.02182132, 0.9584396, 1, 0, 0, 1, 1,
1.216174, -0.3150622, 1.084016, 0, 0, 0, 1, 1,
1.216657, 0.8477894, -0.5691295, 0, 0, 0, 1, 1,
1.216843, 0.04926177, 2.586462, 0, 0, 0, 1, 1,
1.218322, 1.464459, 2.028174, 0, 0, 0, 1, 1,
1.221187, -1.307515, 2.679744, 0, 0, 0, 1, 1,
1.222453, 0.2905885, 0.5301765, 0, 0, 0, 1, 1,
1.225639, -0.2060117, 1.186381, 0, 0, 0, 1, 1,
1.228211, -0.3005707, 1.134062, 1, 1, 1, 1, 1,
1.229839, -0.2757915, 1.488505, 1, 1, 1, 1, 1,
1.231876, 0.5330637, 0.4497143, 1, 1, 1, 1, 1,
1.240935, 2.036965, 0.955709, 1, 1, 1, 1, 1,
1.242712, -0.3858449, 1.817139, 1, 1, 1, 1, 1,
1.245265, 0.4221636, -0.7919301, 1, 1, 1, 1, 1,
1.253617, -1.072585, -0.1055873, 1, 1, 1, 1, 1,
1.262181, 0.02530535, 0.2762514, 1, 1, 1, 1, 1,
1.263829, 0.4733592, 1.185355, 1, 1, 1, 1, 1,
1.272533, -1.017673, 1.893101, 1, 1, 1, 1, 1,
1.272883, 1.476013, -0.6443494, 1, 1, 1, 1, 1,
1.274967, -1.221688, 4.594571, 1, 1, 1, 1, 1,
1.276075, -0.4970002, -0.06250405, 1, 1, 1, 1, 1,
1.276116, 0.7792251, 1.926078, 1, 1, 1, 1, 1,
1.277114, 0.8412679, 0.2872044, 1, 1, 1, 1, 1,
1.277232, 0.0496831, 1.205479, 0, 0, 1, 1, 1,
1.279723, -0.5676293, 2.680838, 1, 0, 0, 1, 1,
1.28485, 1.040946, 1.661959, 1, 0, 0, 1, 1,
1.286036, 1.156249, 1.286669, 1, 0, 0, 1, 1,
1.300528, 0.8367411, 1.102212, 1, 0, 0, 1, 1,
1.304006, 0.8648962, 1.204765, 1, 0, 0, 1, 1,
1.305002, 0.008915274, 2.275205, 0, 0, 0, 1, 1,
1.311967, -0.544122, 3.634963, 0, 0, 0, 1, 1,
1.325626, -0.2193045, 0.8536476, 0, 0, 0, 1, 1,
1.336611, -0.7214807, 3.896986, 0, 0, 0, 1, 1,
1.344726, -1.186662, 3.949501, 0, 0, 0, 1, 1,
1.355239, -0.4157654, 1.230169, 0, 0, 0, 1, 1,
1.363574, -0.4563405, 2.142258, 0, 0, 0, 1, 1,
1.367981, -0.06458123, 2.833115, 1, 1, 1, 1, 1,
1.368685, -0.6127968, 1.208734, 1, 1, 1, 1, 1,
1.37539, 0.896444, 0.9730324, 1, 1, 1, 1, 1,
1.375511, 0.7753867, 0.9998197, 1, 1, 1, 1, 1,
1.375708, -0.5677853, 4.717991, 1, 1, 1, 1, 1,
1.396875, 0.1105126, 2.22558, 1, 1, 1, 1, 1,
1.401568, 0.04911599, 0.4887839, 1, 1, 1, 1, 1,
1.404508, -1.012787, 2.754195, 1, 1, 1, 1, 1,
1.411812, -0.7841479, 1.882882, 1, 1, 1, 1, 1,
1.413147, -1.37273, 3.693245, 1, 1, 1, 1, 1,
1.417707, -0.9776264, -0.06459278, 1, 1, 1, 1, 1,
1.419389, 0.4820586, 0.2007151, 1, 1, 1, 1, 1,
1.431388, -0.09989595, 1.475588, 1, 1, 1, 1, 1,
1.435283, 1.453315, 1.006344, 1, 1, 1, 1, 1,
1.437131, 0.08417114, 1.635007, 1, 1, 1, 1, 1,
1.439347, -0.4493116, 1.100319, 0, 0, 1, 1, 1,
1.441994, 0.07372072, 1.753588, 1, 0, 0, 1, 1,
1.442373, 1.121164, 2.170807, 1, 0, 0, 1, 1,
1.443957, -0.794415, 1.893397, 1, 0, 0, 1, 1,
1.454847, 1.702567, -1.14727, 1, 0, 0, 1, 1,
1.459195, 1.777457, 0.9672564, 1, 0, 0, 1, 1,
1.46054, -0.9023623, 2.526398, 0, 0, 0, 1, 1,
1.462503, -0.2437301, 2.69977, 0, 0, 0, 1, 1,
1.468755, 0.1396997, 2.821654, 0, 0, 0, 1, 1,
1.47143, -2.141825, 2.934056, 0, 0, 0, 1, 1,
1.472643, 0.5643629, -0.2483258, 0, 0, 0, 1, 1,
1.483483, -1.464405, 2.970254, 0, 0, 0, 1, 1,
1.488591, 2.041296, 0.6567786, 0, 0, 0, 1, 1,
1.493452, 0.5473102, 1.306269, 1, 1, 1, 1, 1,
1.509155, 0.3358484, 1.524731, 1, 1, 1, 1, 1,
1.513989, 1.222971, 0.3656882, 1, 1, 1, 1, 1,
1.523967, 0.7028117, 1.360708, 1, 1, 1, 1, 1,
1.531918, 0.2006052, 2.472734, 1, 1, 1, 1, 1,
1.535167, -0.2630111, 2.550853, 1, 1, 1, 1, 1,
1.55078, 0.1510624, 0.171241, 1, 1, 1, 1, 1,
1.556816, -0.4423895, 1.025901, 1, 1, 1, 1, 1,
1.558958, -0.8523061, 1.480842, 1, 1, 1, 1, 1,
1.573799, -0.650749, 1.76207, 1, 1, 1, 1, 1,
1.577157, -0.5205805, 2.98794, 1, 1, 1, 1, 1,
1.58392, -0.8177395, 2.073506, 1, 1, 1, 1, 1,
1.593717, -0.008951564, 1.604444, 1, 1, 1, 1, 1,
1.613988, 0.4197898, 0.4095413, 1, 1, 1, 1, 1,
1.619794, -1.426887, 3.180913, 1, 1, 1, 1, 1,
1.673856, 0.699528, 1.97171, 0, 0, 1, 1, 1,
1.684756, -0.4562316, 2.12922, 1, 0, 0, 1, 1,
1.700928, 0.08720651, 3.313863, 1, 0, 0, 1, 1,
1.703379, -2.51255, 1.440724, 1, 0, 0, 1, 1,
1.707251, 1.138024, 1.294949, 1, 0, 0, 1, 1,
1.710929, -0.450812, 2.875222, 1, 0, 0, 1, 1,
1.714917, 0.4701334, 2.723843, 0, 0, 0, 1, 1,
1.72523, 0.4513875, 1.240678, 0, 0, 0, 1, 1,
1.747252, -0.3673062, 3.178425, 0, 0, 0, 1, 1,
1.751976, 0.9388957, 0.8491077, 0, 0, 0, 1, 1,
1.752084, -1.007427, 1.085275, 0, 0, 0, 1, 1,
1.756742, -1.719853, 3.214947, 0, 0, 0, 1, 1,
1.759795, 0.05692363, 1.161748, 0, 0, 0, 1, 1,
1.762299, -1.06604, 2.485447, 1, 1, 1, 1, 1,
1.767123, 1.070338, 2.723278, 1, 1, 1, 1, 1,
1.802732, -2.202885, 3.682398, 1, 1, 1, 1, 1,
1.803913, -0.4692786, 1.452685, 1, 1, 1, 1, 1,
1.807805, 1.174803, 2.651796, 1, 1, 1, 1, 1,
1.812851, -0.03316462, 3.58153, 1, 1, 1, 1, 1,
1.818635, -0.2514309, 4.620415, 1, 1, 1, 1, 1,
1.83254, 0.3237323, 0.2889751, 1, 1, 1, 1, 1,
1.885005, 0.3679732, 2.932036, 1, 1, 1, 1, 1,
1.889908, -0.391742, 1.34004, 1, 1, 1, 1, 1,
1.901185, 1.263217, 1.167897, 1, 1, 1, 1, 1,
1.91271, 1.592324, 1.219165, 1, 1, 1, 1, 1,
1.960382, 0.8114906, 0.9558147, 1, 1, 1, 1, 1,
1.970356, -0.2811651, 0.7862808, 1, 1, 1, 1, 1,
1.995648, 0.1632722, 0.6879501, 1, 1, 1, 1, 1,
1.996785, 2.364861, -0.004873294, 0, 0, 1, 1, 1,
1.998631, 1.262718, 0.5934135, 1, 0, 0, 1, 1,
2.002913, 1.266935, 2.756506, 1, 0, 0, 1, 1,
2.023725, -1.016455, 1.351699, 1, 0, 0, 1, 1,
2.04572, -0.5999272, 2.107573, 1, 0, 0, 1, 1,
2.071927, 1.485308, 0.3054574, 1, 0, 0, 1, 1,
2.078639, -0.2457357, 1.493783, 0, 0, 0, 1, 1,
2.088356, 0.3093274, 0.4857464, 0, 0, 0, 1, 1,
2.090936, 1.489294, -0.3194379, 0, 0, 0, 1, 1,
2.115807, -1.444039, 1.07647, 0, 0, 0, 1, 1,
2.31367, 0.6553796, 0.9542439, 0, 0, 0, 1, 1,
2.330355, -0.2964621, 3.051861, 0, 0, 0, 1, 1,
2.373239, -2.013142, 0.9498579, 0, 0, 0, 1, 1,
2.479688, -0.9124032, 0.8182321, 1, 1, 1, 1, 1,
2.496252, -0.9649485, -0.5827572, 1, 1, 1, 1, 1,
2.546285, -0.1081608, 2.559649, 1, 1, 1, 1, 1,
2.550941, -0.8360338, 0.8793617, 1, 1, 1, 1, 1,
2.57155, -0.7276135, 2.999051, 1, 1, 1, 1, 1,
2.590249, 0.17871, 2.70095, 1, 1, 1, 1, 1,
2.712821, 1.091472, 0.5567473, 1, 1, 1, 1, 1
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
var radius = 9.052897;
var distance = 31.79792;
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
mvMatrix.translate( 0.3619153, 0.0428648, 0.1266396 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.79792);
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
