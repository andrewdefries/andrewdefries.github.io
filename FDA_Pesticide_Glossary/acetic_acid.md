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
-3.157611, -0.09503665, -2.013903, 1, 0, 0, 1,
-2.840988, 0.01617654, -1.082518, 1, 0.007843138, 0, 1,
-2.786305, 0.3171568, -1.943662, 1, 0.01176471, 0, 1,
-2.697888, 0.6874229, -0.7712678, 1, 0.01960784, 0, 1,
-2.592425, 0.07249408, -1.067371, 1, 0.02352941, 0, 1,
-2.423528, -0.09103057, -0.5718503, 1, 0.03137255, 0, 1,
-2.419089, 0.2006327, 0.6426538, 1, 0.03529412, 0, 1,
-2.373038, 0.3121019, -1.674672, 1, 0.04313726, 0, 1,
-2.305733, 0.07346622, -0.7678918, 1, 0.04705882, 0, 1,
-2.295409, 0.5900862, -2.767835, 1, 0.05490196, 0, 1,
-2.276176, -1.37068, -2.309544, 1, 0.05882353, 0, 1,
-2.227601, 0.1559217, -1.544982, 1, 0.06666667, 0, 1,
-2.184732, -1.381687, -2.267618, 1, 0.07058824, 0, 1,
-2.170115, 0.6648653, -1.159039, 1, 0.07843138, 0, 1,
-2.16486, -1.11969, -2.967638, 1, 0.08235294, 0, 1,
-2.139844, -1.674178, -2.54985, 1, 0.09019608, 0, 1,
-2.130184, 0.6230998, -2.378679, 1, 0.09411765, 0, 1,
-2.087007, 0.7824914, -1.322473, 1, 0.1019608, 0, 1,
-2.076151, -0.7114987, -1.243743, 1, 0.1098039, 0, 1,
-2.066311, -1.223896, -1.792136, 1, 0.1137255, 0, 1,
-2.064431, 0.176374, -0.9084368, 1, 0.1215686, 0, 1,
-2.035137, -2.28877, -2.603612, 1, 0.1254902, 0, 1,
-1.988839, 1.149064, -1.37941, 1, 0.1333333, 0, 1,
-1.988359, -0.1898093, -3.563072, 1, 0.1372549, 0, 1,
-1.97733, -1.035049, -1.382142, 1, 0.145098, 0, 1,
-1.940544, -0.5370094, -1.032119, 1, 0.1490196, 0, 1,
-1.917736, -1.330408, -3.005524, 1, 0.1568628, 0, 1,
-1.905046, -0.9544889, -0.99004, 1, 0.1607843, 0, 1,
-1.898271, 0.3681751, 0.4724191, 1, 0.1686275, 0, 1,
-1.882642, 0.08164212, -1.169657, 1, 0.172549, 0, 1,
-1.880022, 0.8690356, -2.004901, 1, 0.1803922, 0, 1,
-1.816175, -0.2524467, -2.278713, 1, 0.1843137, 0, 1,
-1.803079, -0.4061376, -2.419645, 1, 0.1921569, 0, 1,
-1.7701, -1.642097, -2.630518, 1, 0.1960784, 0, 1,
-1.73123, 0.7647847, 0.01225949, 1, 0.2039216, 0, 1,
-1.70586, 0.6827102, -2.668248, 1, 0.2117647, 0, 1,
-1.697892, -1.894084, -1.607487, 1, 0.2156863, 0, 1,
-1.683342, -0.9453331, -2.145849, 1, 0.2235294, 0, 1,
-1.669784, 0.02488666, -1.297179, 1, 0.227451, 0, 1,
-1.665486, 0.6766743, -0.04224812, 1, 0.2352941, 0, 1,
-1.657139, 1.085614, 0.1428584, 1, 0.2392157, 0, 1,
-1.649356, -0.2114787, -0.5600297, 1, 0.2470588, 0, 1,
-1.649099, 0.7423145, -1.279426, 1, 0.2509804, 0, 1,
-1.626914, 0.1052545, -2.051259, 1, 0.2588235, 0, 1,
-1.625189, 0.6394481, -1.799116, 1, 0.2627451, 0, 1,
-1.606804, 1.481403, -1.193287, 1, 0.2705882, 0, 1,
-1.594581, -0.04175136, -3.540841, 1, 0.2745098, 0, 1,
-1.593565, 1.490607, -1.756204, 1, 0.282353, 0, 1,
-1.588935, 0.3558267, 0.7623119, 1, 0.2862745, 0, 1,
-1.576661, -0.4807356, -1.457133, 1, 0.2941177, 0, 1,
-1.564019, 0.07760936, -2.245242, 1, 0.3019608, 0, 1,
-1.557983, 1.363105, -1.511881, 1, 0.3058824, 0, 1,
-1.546768, -0.3266338, -1.341076, 1, 0.3137255, 0, 1,
-1.537284, -0.9019167, 0.1640812, 1, 0.3176471, 0, 1,
-1.534645, -0.3005567, -1.52627, 1, 0.3254902, 0, 1,
-1.532839, -0.9754938, -3.725171, 1, 0.3294118, 0, 1,
-1.530295, 0.338594, -1.956701, 1, 0.3372549, 0, 1,
-1.509889, -2.015552, -1.468637, 1, 0.3411765, 0, 1,
-1.502988, -0.2170673, -1.127294, 1, 0.3490196, 0, 1,
-1.491647, -0.4837532, -0.3750837, 1, 0.3529412, 0, 1,
-1.482516, -0.553558, -1.940831, 1, 0.3607843, 0, 1,
-1.476472, -0.08464863, -1.360481, 1, 0.3647059, 0, 1,
-1.476032, 0.4775598, -2.485509, 1, 0.372549, 0, 1,
-1.470193, -1.648952, -1.65426, 1, 0.3764706, 0, 1,
-1.461122, 1.479562, -0.9074855, 1, 0.3843137, 0, 1,
-1.432154, 1.070594, -0.4549216, 1, 0.3882353, 0, 1,
-1.427168, 0.01622501, -0.497052, 1, 0.3960784, 0, 1,
-1.403617, -0.6258172, -1.928043, 1, 0.4039216, 0, 1,
-1.39888, 0.1098571, 0.02730574, 1, 0.4078431, 0, 1,
-1.394594, -2.100703, -3.137628, 1, 0.4156863, 0, 1,
-1.394593, 1.067837, -0.6519482, 1, 0.4196078, 0, 1,
-1.390771, 1.435511, -0.5603275, 1, 0.427451, 0, 1,
-1.38829, 0.187927, -1.891848, 1, 0.4313726, 0, 1,
-1.38465, 0.9039302, -0.5951109, 1, 0.4392157, 0, 1,
-1.383918, -0.3607763, -2.131386, 1, 0.4431373, 0, 1,
-1.346342, -1.934174, -3.340101, 1, 0.4509804, 0, 1,
-1.33052, -0.3861751, -2.118069, 1, 0.454902, 0, 1,
-1.329619, 1.126829, -1.324744, 1, 0.4627451, 0, 1,
-1.326662, 1.25718, -0.8269687, 1, 0.4666667, 0, 1,
-1.319534, 0.538306, -0.7686431, 1, 0.4745098, 0, 1,
-1.315696, -0.05612582, -0.6076089, 1, 0.4784314, 0, 1,
-1.30391, 1.039029, -2.58055, 1, 0.4862745, 0, 1,
-1.302059, 0.7265976, -0.9775808, 1, 0.4901961, 0, 1,
-1.293014, 0.03568754, -2.378058, 1, 0.4980392, 0, 1,
-1.292175, 0.2266633, 0.361021, 1, 0.5058824, 0, 1,
-1.287495, -1.069565, -2.272791, 1, 0.509804, 0, 1,
-1.28307, 1.197778, -2.853402, 1, 0.5176471, 0, 1,
-1.281368, -1.145907, -2.006252, 1, 0.5215687, 0, 1,
-1.277074, 0.323303, -0.1856033, 1, 0.5294118, 0, 1,
-1.263903, 0.2849058, -2.203362, 1, 0.5333334, 0, 1,
-1.262264, -1.000171, -3.515244, 1, 0.5411765, 0, 1,
-1.261889, -0.6896331, -1.80535, 1, 0.5450981, 0, 1,
-1.246184, 0.4819071, 0.2850444, 1, 0.5529412, 0, 1,
-1.240242, -0.2122259, -1.163366, 1, 0.5568628, 0, 1,
-1.237073, -0.1340953, -1.675718, 1, 0.5647059, 0, 1,
-1.226141, 0.2965879, -0.8322158, 1, 0.5686275, 0, 1,
-1.221774, 0.7748196, -1.156501, 1, 0.5764706, 0, 1,
-1.215647, -0.6851906, -2.221356, 1, 0.5803922, 0, 1,
-1.213869, 0.3965733, -2.734512, 1, 0.5882353, 0, 1,
-1.212418, 0.7195625, -0.8769967, 1, 0.5921569, 0, 1,
-1.211124, 0.3328958, -4.196237, 1, 0.6, 0, 1,
-1.209957, 1.202691, -1.301961, 1, 0.6078432, 0, 1,
-1.207259, 0.2595133, -1.589679, 1, 0.6117647, 0, 1,
-1.205691, 0.4410183, -0.4103713, 1, 0.6196079, 0, 1,
-1.20389, 1.354349, -1.141392, 1, 0.6235294, 0, 1,
-1.19488, -1.4645, -1.827237, 1, 0.6313726, 0, 1,
-1.189908, 0.02108479, -3.039498, 1, 0.6352941, 0, 1,
-1.185647, 0.3307727, -1.559679, 1, 0.6431373, 0, 1,
-1.180024, 1.530461, 2.432237, 1, 0.6470588, 0, 1,
-1.176541, 0.3263335, -0.2392448, 1, 0.654902, 0, 1,
-1.173581, -0.5319499, -2.183945, 1, 0.6588235, 0, 1,
-1.166993, -1.041524, -1.869454, 1, 0.6666667, 0, 1,
-1.165226, -0.7240221, -3.72104, 1, 0.6705883, 0, 1,
-1.157877, 0.2065171, -0.3920207, 1, 0.6784314, 0, 1,
-1.152498, 0.0004395935, -2.725993, 1, 0.682353, 0, 1,
-1.148766, 0.6678931, -1.252553, 1, 0.6901961, 0, 1,
-1.135908, 1.243955, -0.4147982, 1, 0.6941177, 0, 1,
-1.135469, 0.4379042, -0.4622525, 1, 0.7019608, 0, 1,
-1.126586, 0.4015962, -0.8785537, 1, 0.7098039, 0, 1,
-1.11902, 0.6433669, -1.657967, 1, 0.7137255, 0, 1,
-1.111177, -0.5837059, -1.493617, 1, 0.7215686, 0, 1,
-1.109408, 0.826132, -1.021051, 1, 0.7254902, 0, 1,
-1.104609, 1.392981, -1.271997, 1, 0.7333333, 0, 1,
-1.085399, -0.4165752, -1.533598, 1, 0.7372549, 0, 1,
-1.075549, -0.3571066, -2.349791, 1, 0.7450981, 0, 1,
-1.068949, -0.4334058, -2.33277, 1, 0.7490196, 0, 1,
-1.068176, -0.9956961, -4.459493, 1, 0.7568628, 0, 1,
-1.066178, 0.007704897, -1.273428, 1, 0.7607843, 0, 1,
-1.06404, 0.1675756, -1.613259, 1, 0.7686275, 0, 1,
-1.062202, -1.410306, -2.111805, 1, 0.772549, 0, 1,
-1.043295, 1.035161, -2.832235, 1, 0.7803922, 0, 1,
-1.035952, 0.2008252, -1.376103, 1, 0.7843137, 0, 1,
-1.033146, 1.160139, -1.967466, 1, 0.7921569, 0, 1,
-1.030138, 2.169093, -2.055269, 1, 0.7960784, 0, 1,
-1.026539, -0.8637848, -2.31479, 1, 0.8039216, 0, 1,
-1.018692, -0.2950853, -1.6816, 1, 0.8117647, 0, 1,
-1.018281, -0.4950073, -3.030818, 1, 0.8156863, 0, 1,
-1.007884, -0.5601916, -2.303756, 1, 0.8235294, 0, 1,
-1.00686, 0.4994495, 0.06289487, 1, 0.827451, 0, 1,
-1.005019, 0.3841818, -0.2721372, 1, 0.8352941, 0, 1,
-0.9960295, -0.6343262, -3.059935, 1, 0.8392157, 0, 1,
-0.9905999, 0.3329837, -0.5438976, 1, 0.8470588, 0, 1,
-0.9863915, -0.8104094, -2.312828, 1, 0.8509804, 0, 1,
-0.9848062, -1.304789, -1.488597, 1, 0.8588235, 0, 1,
-0.9836137, -0.4505675, -2.435885, 1, 0.8627451, 0, 1,
-0.9818156, -1.850459, -3.076096, 1, 0.8705882, 0, 1,
-0.9791818, 0.8665516, 1.345586, 1, 0.8745098, 0, 1,
-0.975939, -0.6024656, -1.349513, 1, 0.8823529, 0, 1,
-0.9726155, 0.9624968, 0.5259047, 1, 0.8862745, 0, 1,
-0.9712156, 0.7765048, 0.2114111, 1, 0.8941177, 0, 1,
-0.9651592, -0.6989742, -1.431268, 1, 0.8980392, 0, 1,
-0.9649684, 1.154029, -1.410515, 1, 0.9058824, 0, 1,
-0.9630411, -0.0341167, -1.322252, 1, 0.9137255, 0, 1,
-0.9571673, -0.2374925, -2.049261, 1, 0.9176471, 0, 1,
-0.9563639, 0.3627951, -1.31869, 1, 0.9254902, 0, 1,
-0.955792, 0.9883198, -1.085631, 1, 0.9294118, 0, 1,
-0.9547791, -0.4405548, -1.22804, 1, 0.9372549, 0, 1,
-0.9400288, -0.8737466, -1.634739, 1, 0.9411765, 0, 1,
-0.9393053, 0.5290286, -2.183043, 1, 0.9490196, 0, 1,
-0.9320588, 0.3049169, -0.8109589, 1, 0.9529412, 0, 1,
-0.9262292, -1.016597, -1.563776, 1, 0.9607843, 0, 1,
-0.9233095, 2.325987, -0.4442269, 1, 0.9647059, 0, 1,
-0.9203711, -0.5096064, -0.4533292, 1, 0.972549, 0, 1,
-0.9169473, -0.2943984, -1.386302, 1, 0.9764706, 0, 1,
-0.9140618, -0.381411, -3.074511, 1, 0.9843137, 0, 1,
-0.9117857, 1.280413, -0.1725952, 1, 0.9882353, 0, 1,
-0.9115414, 2.180435, 1.854402, 1, 0.9960784, 0, 1,
-0.9108396, -0.2560816, -0.6418573, 0.9960784, 1, 0, 1,
-0.9103031, 0.7439904, -2.798709, 0.9921569, 1, 0, 1,
-0.9102783, -0.6710812, -1.405222, 0.9843137, 1, 0, 1,
-0.9073935, 1.47939, -0.7202091, 0.9803922, 1, 0, 1,
-0.8997242, -1.05192, -1.656943, 0.972549, 1, 0, 1,
-0.8985415, -1.629573, -2.547953, 0.9686275, 1, 0, 1,
-0.8979874, 0.6636434, -0.4752188, 0.9607843, 1, 0, 1,
-0.8884506, 0.8047136, -0.263958, 0.9568627, 1, 0, 1,
-0.8853502, 0.642405, 0.4699342, 0.9490196, 1, 0, 1,
-0.8831908, 0.09953359, -1.083576, 0.945098, 1, 0, 1,
-0.8723618, 0.08989888, -1.891655, 0.9372549, 1, 0, 1,
-0.8709673, 0.1394358, -0.272272, 0.9333333, 1, 0, 1,
-0.8683361, 0.6409917, -0.7223514, 0.9254902, 1, 0, 1,
-0.8662747, 0.5656663, -1.3111, 0.9215686, 1, 0, 1,
-0.8659476, -0.4282301, -2.834508, 0.9137255, 1, 0, 1,
-0.8646919, 1.141979, 0.5040668, 0.9098039, 1, 0, 1,
-0.8524567, -2.417274, -2.746666, 0.9019608, 1, 0, 1,
-0.8520821, -2.131231, -3.047967, 0.8941177, 1, 0, 1,
-0.8517181, 1.284631, -1.78808, 0.8901961, 1, 0, 1,
-0.8493916, -1.587529, -2.319349, 0.8823529, 1, 0, 1,
-0.8347727, 0.4844234, 0.1363129, 0.8784314, 1, 0, 1,
-0.8339229, -1.684113, 0.4318708, 0.8705882, 1, 0, 1,
-0.8327813, 2.292017, 0.7585403, 0.8666667, 1, 0, 1,
-0.8309295, -0.07850544, -3.059879, 0.8588235, 1, 0, 1,
-0.8253637, -1.153364, -2.638037, 0.854902, 1, 0, 1,
-0.815512, 1.981638, -1.589272, 0.8470588, 1, 0, 1,
-0.8138185, 0.05631376, -2.413178, 0.8431373, 1, 0, 1,
-0.8136668, -0.02322257, -1.997744, 0.8352941, 1, 0, 1,
-0.8078949, -0.1711135, -1.272083, 0.8313726, 1, 0, 1,
-0.804801, 0.05400527, -0.2418321, 0.8235294, 1, 0, 1,
-0.8006924, 0.4151892, -1.220601, 0.8196079, 1, 0, 1,
-0.7960879, -1.178374, -1.893548, 0.8117647, 1, 0, 1,
-0.7933124, -2.477629, -3.660111, 0.8078431, 1, 0, 1,
-0.7932835, -0.42516, -1.618172, 0.8, 1, 0, 1,
-0.7906536, 0.488468, -1.358832, 0.7921569, 1, 0, 1,
-0.787688, -0.1591508, -1.084933, 0.7882353, 1, 0, 1,
-0.7869405, -0.3030078, -1.587566, 0.7803922, 1, 0, 1,
-0.7868692, 1.376955, 1.062199, 0.7764706, 1, 0, 1,
-0.7854609, 0.2691654, -1.500606, 0.7686275, 1, 0, 1,
-0.7840867, 0.08389972, -0.6560556, 0.7647059, 1, 0, 1,
-0.7825553, -0.698494, -2.191353, 0.7568628, 1, 0, 1,
-0.781496, 1.180681, -0.2542843, 0.7529412, 1, 0, 1,
-0.7808467, -2.682992, -3.508619, 0.7450981, 1, 0, 1,
-0.7763711, -0.06317514, -0.9420688, 0.7411765, 1, 0, 1,
-0.7760192, 0.8090798, -2.46684, 0.7333333, 1, 0, 1,
-0.7667343, -0.778645, -2.876295, 0.7294118, 1, 0, 1,
-0.7657598, 1.102055, -1.161072, 0.7215686, 1, 0, 1,
-0.7653936, 0.1150746, -1.028687, 0.7176471, 1, 0, 1,
-0.7590607, -1.797427, -1.625262, 0.7098039, 1, 0, 1,
-0.7584828, -1.028416, -3.055085, 0.7058824, 1, 0, 1,
-0.7496614, 0.1955676, -0.1476169, 0.6980392, 1, 0, 1,
-0.7437276, -0.2356331, -1.982571, 0.6901961, 1, 0, 1,
-0.7374262, 1.133778, -1.110778, 0.6862745, 1, 0, 1,
-0.73469, -3.643856, -5.347208, 0.6784314, 1, 0, 1,
-0.7301017, -0.5802631, -2.962367, 0.6745098, 1, 0, 1,
-0.7213774, -2.168114, -2.324864, 0.6666667, 1, 0, 1,
-0.7191382, -0.5870509, -1.712456, 0.6627451, 1, 0, 1,
-0.7142786, -0.6061751, -0.6933681, 0.654902, 1, 0, 1,
-0.7130893, -0.2408275, -1.844837, 0.6509804, 1, 0, 1,
-0.7121036, -0.2045843, -2.335007, 0.6431373, 1, 0, 1,
-0.7069776, 0.707042, 0.1250633, 0.6392157, 1, 0, 1,
-0.7031711, 0.364133, -1.543483, 0.6313726, 1, 0, 1,
-0.7025554, -0.5285056, -0.3714963, 0.627451, 1, 0, 1,
-0.6988276, -0.2476841, -2.409209, 0.6196079, 1, 0, 1,
-0.6963431, 1.199943, 1.481102, 0.6156863, 1, 0, 1,
-0.6962923, 0.3864848, -3.960741, 0.6078432, 1, 0, 1,
-0.6957281, -0.2958403, -1.712306, 0.6039216, 1, 0, 1,
-0.6945358, -1.928084, -2.535315, 0.5960785, 1, 0, 1,
-0.6895854, 0.8125624, -0.2573974, 0.5882353, 1, 0, 1,
-0.6793497, -0.285866, -2.474202, 0.5843138, 1, 0, 1,
-0.6778303, -0.5685646, -0.2328032, 0.5764706, 1, 0, 1,
-0.6649432, 0.1946004, 0.1438032, 0.572549, 1, 0, 1,
-0.6649253, 0.2526434, -0.8346794, 0.5647059, 1, 0, 1,
-0.6589228, -0.2582814, -1.115978, 0.5607843, 1, 0, 1,
-0.6569541, 0.6635309, -0.4719906, 0.5529412, 1, 0, 1,
-0.6503515, -0.284045, -3.658194, 0.5490196, 1, 0, 1,
-0.6482386, -2.510754, -5.47028, 0.5411765, 1, 0, 1,
-0.6456591, 0.082366, -2.897399, 0.5372549, 1, 0, 1,
-0.6432977, -1.463451, -3.842268, 0.5294118, 1, 0, 1,
-0.6428866, -2.11821, -1.649909, 0.5254902, 1, 0, 1,
-0.634206, -0.1086977, -1.306547, 0.5176471, 1, 0, 1,
-0.63349, 1.20807, -0.319158, 0.5137255, 1, 0, 1,
-0.6311183, 0.6623065, -0.5640092, 0.5058824, 1, 0, 1,
-0.6256496, -1.610246, -4.027258, 0.5019608, 1, 0, 1,
-0.6235321, 0.1385343, -3.348479, 0.4941176, 1, 0, 1,
-0.6184338, 0.3515972, 1.221838, 0.4862745, 1, 0, 1,
-0.6182421, 1.020549, -1.801878, 0.4823529, 1, 0, 1,
-0.6161211, -1.156847, -1.712689, 0.4745098, 1, 0, 1,
-0.6158605, 2.47072, -1.632732, 0.4705882, 1, 0, 1,
-0.6143162, 0.5203651, -0.4937946, 0.4627451, 1, 0, 1,
-0.6124698, 0.4188754, 0.3610737, 0.4588235, 1, 0, 1,
-0.6078966, 0.472302, -1.571366, 0.4509804, 1, 0, 1,
-0.6034924, -0.3640666, -1.111087, 0.4470588, 1, 0, 1,
-0.6019214, -2.135664, -2.400455, 0.4392157, 1, 0, 1,
-0.5993606, -0.4957765, -1.381458, 0.4352941, 1, 0, 1,
-0.5970985, 0.7260849, -1.224959, 0.427451, 1, 0, 1,
-0.593621, 0.540543, 0.5730364, 0.4235294, 1, 0, 1,
-0.5894633, -0.7807841, -1.43261, 0.4156863, 1, 0, 1,
-0.5880067, 0.3787062, -1.943039, 0.4117647, 1, 0, 1,
-0.5878541, -1.714119, -4.191242, 0.4039216, 1, 0, 1,
-0.5860982, -0.04226996, -0.07042306, 0.3960784, 1, 0, 1,
-0.5843524, 0.934172, 0.4924522, 0.3921569, 1, 0, 1,
-0.5810139, -1.596983, -2.484456, 0.3843137, 1, 0, 1,
-0.5804765, 0.6078468, -2.745392, 0.3803922, 1, 0, 1,
-0.5727875, 1.120898, -0.295763, 0.372549, 1, 0, 1,
-0.5660967, -0.6952657, -1.836712, 0.3686275, 1, 0, 1,
-0.5659575, 0.9162619, 0.1769308, 0.3607843, 1, 0, 1,
-0.5634628, 0.825548, -1.113271, 0.3568628, 1, 0, 1,
-0.5611591, 0.1324262, -3.24704, 0.3490196, 1, 0, 1,
-0.5493655, -0.6710258, -2.793413, 0.345098, 1, 0, 1,
-0.5483351, -0.2801303, -3.302216, 0.3372549, 1, 0, 1,
-0.5430796, 0.1790796, -0.02170377, 0.3333333, 1, 0, 1,
-0.5418592, 0.3985112, -1.183872, 0.3254902, 1, 0, 1,
-0.5415044, -1.272011, -0.6276037, 0.3215686, 1, 0, 1,
-0.5403354, -0.2058804, -3.278679, 0.3137255, 1, 0, 1,
-0.5388424, 0.6596369, -0.09763946, 0.3098039, 1, 0, 1,
-0.5363292, 0.8366268, -1.758088, 0.3019608, 1, 0, 1,
-0.5353209, 0.09415818, -1.629243, 0.2941177, 1, 0, 1,
-0.5321149, -1.317922, -4.901396, 0.2901961, 1, 0, 1,
-0.527472, -2.045734, -3.478038, 0.282353, 1, 0, 1,
-0.526264, -0.5340306, -4.165678, 0.2784314, 1, 0, 1,
-0.5260783, 2.214446, 0.06745321, 0.2705882, 1, 0, 1,
-0.5254618, -0.6759329, -2.265791, 0.2666667, 1, 0, 1,
-0.5152929, 0.07738645, -1.778715, 0.2588235, 1, 0, 1,
-0.5139457, -0.6840039, -2.140597, 0.254902, 1, 0, 1,
-0.5135505, -1.316161, -3.294565, 0.2470588, 1, 0, 1,
-0.5057371, 0.7095472, -1.558631, 0.2431373, 1, 0, 1,
-0.5039828, -0.4382651, -3.422334, 0.2352941, 1, 0, 1,
-0.5026194, -0.7115483, -2.765178, 0.2313726, 1, 0, 1,
-0.5008865, 0.9489499, 1.222258, 0.2235294, 1, 0, 1,
-0.498306, 0.5535163, -0.9522222, 0.2196078, 1, 0, 1,
-0.4969551, 0.7171876, -0.3724477, 0.2117647, 1, 0, 1,
-0.4946295, 0.6470322, 0.1581426, 0.2078431, 1, 0, 1,
-0.4933355, -0.5076015, -1.284915, 0.2, 1, 0, 1,
-0.4914748, -0.1285137, -0.5883654, 0.1921569, 1, 0, 1,
-0.4900456, -0.03945037, -2.965375, 0.1882353, 1, 0, 1,
-0.48888, -0.5721139, -2.360615, 0.1803922, 1, 0, 1,
-0.488609, -0.8235461, -1.834757, 0.1764706, 1, 0, 1,
-0.486526, 1.800125, -1.092051, 0.1686275, 1, 0, 1,
-0.4849045, -0.4963747, -2.513729, 0.1647059, 1, 0, 1,
-0.4822964, 1.729022, -0.2254381, 0.1568628, 1, 0, 1,
-0.4806014, 3.184832, -0.2551479, 0.1529412, 1, 0, 1,
-0.4805178, 0.1952375, -0.7429675, 0.145098, 1, 0, 1,
-0.4791057, 0.6412231, -0.4303002, 0.1411765, 1, 0, 1,
-0.477324, -0.6776715, -0.6689365, 0.1333333, 1, 0, 1,
-0.4754655, -1.151801, -4.426935, 0.1294118, 1, 0, 1,
-0.4737101, -0.7787184, -1.934264, 0.1215686, 1, 0, 1,
-0.4717163, 1.49348, 0.5527304, 0.1176471, 1, 0, 1,
-0.4706601, -1.325137, -3.725507, 0.1098039, 1, 0, 1,
-0.4696898, 0.3131601, -2.085897, 0.1058824, 1, 0, 1,
-0.4618871, 0.02461986, -3.392945, 0.09803922, 1, 0, 1,
-0.4570868, -0.6410553, -4.081009, 0.09019608, 1, 0, 1,
-0.4565608, -0.8483503, -3.687349, 0.08627451, 1, 0, 1,
-0.4563912, -0.0174502, -1.809411, 0.07843138, 1, 0, 1,
-0.4523498, 0.0711192, 0.1884697, 0.07450981, 1, 0, 1,
-0.4519706, -0.5358492, -3.208989, 0.06666667, 1, 0, 1,
-0.449578, 0.3441924, -1.620454, 0.0627451, 1, 0, 1,
-0.4462459, -0.3021952, -2.530361, 0.05490196, 1, 0, 1,
-0.442979, -1.844723, -1.852136, 0.05098039, 1, 0, 1,
-0.4420394, 1.67419, 1.31341, 0.04313726, 1, 0, 1,
-0.4380312, 0.1574439, -1.876225, 0.03921569, 1, 0, 1,
-0.436963, -0.527966, -2.670902, 0.03137255, 1, 0, 1,
-0.4344014, 0.9567136, 0.8595137, 0.02745098, 1, 0, 1,
-0.4324193, -0.07479563, -1.055343, 0.01960784, 1, 0, 1,
-0.4259041, -0.5530565, -3.977392, 0.01568628, 1, 0, 1,
-0.4211252, -0.09358358, -1.865316, 0.007843138, 1, 0, 1,
-0.4208163, 0.7215167, -0.5192721, 0.003921569, 1, 0, 1,
-0.4185023, 0.7835857, 0.7641653, 0, 1, 0.003921569, 1,
-0.4146009, 1.614384, -2.776968, 0, 1, 0.01176471, 1,
-0.4039558, -1.42799, -2.773587, 0, 1, 0.01568628, 1,
-0.4034589, -0.2149057, -1.339525, 0, 1, 0.02352941, 1,
-0.4032602, 0.792586, -0.00870071, 0, 1, 0.02745098, 1,
-0.4023809, -1.72699, -3.279644, 0, 1, 0.03529412, 1,
-0.396494, -0.6738929, -4.966416, 0, 1, 0.03921569, 1,
-0.3956795, 1.385318, -0.235776, 0, 1, 0.04705882, 1,
-0.393665, -1.850765, -2.777329, 0, 1, 0.05098039, 1,
-0.3903317, -0.8776948, -3.959485, 0, 1, 0.05882353, 1,
-0.385704, 0.1185568, -0.8513903, 0, 1, 0.0627451, 1,
-0.3852711, 1.052827, -1.074839, 0, 1, 0.07058824, 1,
-0.3830693, 0.1656626, -1.381633, 0, 1, 0.07450981, 1,
-0.3781283, -0.06510391, -1.682294, 0, 1, 0.08235294, 1,
-0.3780235, 0.08906732, -2.875437, 0, 1, 0.08627451, 1,
-0.3772068, -2.074795, -2.472953, 0, 1, 0.09411765, 1,
-0.3757339, 0.3063674, 1.335286, 0, 1, 0.1019608, 1,
-0.3752048, 1.274366, 0.7992048, 0, 1, 0.1058824, 1,
-0.3745597, -0.05039092, -2.912792, 0, 1, 0.1137255, 1,
-0.3743842, -1.200016, -2.75069, 0, 1, 0.1176471, 1,
-0.3739073, -0.3292655, -3.65668, 0, 1, 0.1254902, 1,
-0.3710063, -0.5664457, -2.11555, 0, 1, 0.1294118, 1,
-0.3707682, -1.310448, -2.11996, 0, 1, 0.1372549, 1,
-0.363626, 0.4905424, -0.567381, 0, 1, 0.1411765, 1,
-0.3631681, -1.150566, -2.64717, 0, 1, 0.1490196, 1,
-0.3627408, -0.3087345, -3.02154, 0, 1, 0.1529412, 1,
-0.3593469, -0.3218702, -1.493809, 0, 1, 0.1607843, 1,
-0.3577337, -0.09450167, -3.180372, 0, 1, 0.1647059, 1,
-0.3553398, 1.37929, -0.2936072, 0, 1, 0.172549, 1,
-0.3484942, -0.9093539, -2.214205, 0, 1, 0.1764706, 1,
-0.347055, 0.06650272, -1.325787, 0, 1, 0.1843137, 1,
-0.3469432, 0.1853256, 0.03990711, 0, 1, 0.1882353, 1,
-0.3447739, 0.3250818, -2.418765, 0, 1, 0.1960784, 1,
-0.3440138, 1.584613, -1.801844, 0, 1, 0.2039216, 1,
-0.3438531, 1.305215, -0.2080968, 0, 1, 0.2078431, 1,
-0.3384035, 0.8665182, -0.001108432, 0, 1, 0.2156863, 1,
-0.3368671, -0.8697424, -2.236181, 0, 1, 0.2196078, 1,
-0.3364421, 0.3319433, -2.535025, 0, 1, 0.227451, 1,
-0.336302, -0.1878248, -1.561007, 0, 1, 0.2313726, 1,
-0.3328851, 0.08363488, -0.6109298, 0, 1, 0.2392157, 1,
-0.3302385, 0.2553472, -0.7730092, 0, 1, 0.2431373, 1,
-0.3291488, -0.5452842, -1.013617, 0, 1, 0.2509804, 1,
-0.3289762, -1.741729, -2.975482, 0, 1, 0.254902, 1,
-0.3275729, 0.2144756, -0.2794638, 0, 1, 0.2627451, 1,
-0.3267591, -0.1648536, -1.201869, 0, 1, 0.2666667, 1,
-0.3223794, 0.2010345, -1.507109, 0, 1, 0.2745098, 1,
-0.3223433, -0.08648351, -1.484992, 0, 1, 0.2784314, 1,
-0.3205983, 0.5329129, -0.6602694, 0, 1, 0.2862745, 1,
-0.3159947, -0.9561303, -3.064117, 0, 1, 0.2901961, 1,
-0.3158805, -0.7811639, -2.480943, 0, 1, 0.2980392, 1,
-0.3126895, 1.871629, 0.9644532, 0, 1, 0.3058824, 1,
-0.305871, -1.632, -3.717116, 0, 1, 0.3098039, 1,
-0.3056507, 1.358771, -0.2856893, 0, 1, 0.3176471, 1,
-0.303797, 0.6511142, 0.1687673, 0, 1, 0.3215686, 1,
-0.3026992, 2.348087, -2.241472, 0, 1, 0.3294118, 1,
-0.2970332, 2.192977, -0.05397099, 0, 1, 0.3333333, 1,
-0.2939855, -0.9355445, -2.269839, 0, 1, 0.3411765, 1,
-0.2926347, -0.8346031, -2.011055, 0, 1, 0.345098, 1,
-0.2910159, 0.9617487, -0.9321786, 0, 1, 0.3529412, 1,
-0.2746046, -1.487556, -3.598437, 0, 1, 0.3568628, 1,
-0.2743115, 0.8944719, 0.3643114, 0, 1, 0.3647059, 1,
-0.2728498, 0.05655184, -2.67176, 0, 1, 0.3686275, 1,
-0.2668773, 0.8626184, -0.7196442, 0, 1, 0.3764706, 1,
-0.2663988, -0.5310546, -2.977727, 0, 1, 0.3803922, 1,
-0.2660898, 0.1408766, -1.237939, 0, 1, 0.3882353, 1,
-0.2651585, 1.216813, -0.02710186, 0, 1, 0.3921569, 1,
-0.2578902, 0.591291, -1.630825, 0, 1, 0.4, 1,
-0.2551348, -0.6304666, -1.816333, 0, 1, 0.4078431, 1,
-0.25398, -0.2579732, -3.872669, 0, 1, 0.4117647, 1,
-0.2535969, -0.6868804, -1.26472, 0, 1, 0.4196078, 1,
-0.2530871, -0.04338194, -3.222218, 0, 1, 0.4235294, 1,
-0.2502239, -1.265711, -2.312747, 0, 1, 0.4313726, 1,
-0.2477879, 1.376141, -0.3106953, 0, 1, 0.4352941, 1,
-0.2430194, 0.1043232, -1.913692, 0, 1, 0.4431373, 1,
-0.2425111, -1.337567, -1.579498, 0, 1, 0.4470588, 1,
-0.2416567, -0.3632035, -2.444074, 0, 1, 0.454902, 1,
-0.2398445, 0.2113423, -0.8619108, 0, 1, 0.4588235, 1,
-0.2379814, 0.1858434, -1.976935, 0, 1, 0.4666667, 1,
-0.2332307, 0.2508037, -0.4980255, 0, 1, 0.4705882, 1,
-0.2298996, -0.07313304, 0.1423422, 0, 1, 0.4784314, 1,
-0.2248717, 0.2033256, -1.145158, 0, 1, 0.4823529, 1,
-0.2247808, -0.4005006, -2.787307, 0, 1, 0.4901961, 1,
-0.224094, 2.041963, 0.4798729, 0, 1, 0.4941176, 1,
-0.222316, -0.9062647, -3.205873, 0, 1, 0.5019608, 1,
-0.2187173, -0.4214537, -3.575082, 0, 1, 0.509804, 1,
-0.2170328, 0.3172729, -1.254591, 0, 1, 0.5137255, 1,
-0.2159682, -0.007211893, -0.4382679, 0, 1, 0.5215687, 1,
-0.2135837, 0.4435241, -1.361416, 0, 1, 0.5254902, 1,
-0.2134662, 0.7500324, -0.05907312, 0, 1, 0.5333334, 1,
-0.2119567, 0.1791154, -0.5071487, 0, 1, 0.5372549, 1,
-0.2087211, -1.286783, -2.835247, 0, 1, 0.5450981, 1,
-0.2068418, -0.1285385, -2.220657, 0, 1, 0.5490196, 1,
-0.2058788, 0.456594, -0.5040364, 0, 1, 0.5568628, 1,
-0.2000213, -1.405872, -3.549943, 0, 1, 0.5607843, 1,
-0.1968969, -0.08088291, -1.859544, 0, 1, 0.5686275, 1,
-0.1960699, -0.5857875, -3.300127, 0, 1, 0.572549, 1,
-0.1922156, -2.829849, -3.771638, 0, 1, 0.5803922, 1,
-0.1919998, -0.1283027, -2.339854, 0, 1, 0.5843138, 1,
-0.1904567, -0.03648845, -1.880072, 0, 1, 0.5921569, 1,
-0.1892544, -0.9696847, -3.946841, 0, 1, 0.5960785, 1,
-0.187287, -0.8803624, -3.125448, 0, 1, 0.6039216, 1,
-0.1855522, -0.5939948, -1.475734, 0, 1, 0.6117647, 1,
-0.1832069, -0.6192945, -3.058494, 0, 1, 0.6156863, 1,
-0.1813904, -0.695949, -2.044502, 0, 1, 0.6235294, 1,
-0.179619, -0.9124409, -2.240264, 0, 1, 0.627451, 1,
-0.179139, -1.641155, -2.944144, 0, 1, 0.6352941, 1,
-0.1789431, -0.3913998, -3.011231, 0, 1, 0.6392157, 1,
-0.1767107, -0.6998201, -2.982616, 0, 1, 0.6470588, 1,
-0.1753339, -0.1231012, -1.295061, 0, 1, 0.6509804, 1,
-0.1741674, 1.683531, 0.2488873, 0, 1, 0.6588235, 1,
-0.1722361, 1.048825, -0.2252987, 0, 1, 0.6627451, 1,
-0.1715834, -0.4306371, -2.110966, 0, 1, 0.6705883, 1,
-0.1678859, -0.4404784, -4.20668, 0, 1, 0.6745098, 1,
-0.1676441, -0.9007839, -1.080255, 0, 1, 0.682353, 1,
-0.1670483, -1.650579, -3.126768, 0, 1, 0.6862745, 1,
-0.1608794, 1.946533, -0.3616168, 0, 1, 0.6941177, 1,
-0.1590424, 0.780556, -1.072616, 0, 1, 0.7019608, 1,
-0.1584038, 1.48413, 0.9827163, 0, 1, 0.7058824, 1,
-0.1476342, 0.2515067, -0.2478192, 0, 1, 0.7137255, 1,
-0.1470453, -0.02760963, -2.037446, 0, 1, 0.7176471, 1,
-0.1462538, 0.2933521, 0.3619921, 0, 1, 0.7254902, 1,
-0.1345183, 0.2380776, 0.4604773, 0, 1, 0.7294118, 1,
-0.1274517, 0.4061706, -1.392003, 0, 1, 0.7372549, 1,
-0.119941, 1.303299, 0.0982438, 0, 1, 0.7411765, 1,
-0.1171064, 0.7318371, -0.7176094, 0, 1, 0.7490196, 1,
-0.1119199, 0.2990938, 0.7187494, 0, 1, 0.7529412, 1,
-0.1113475, -2.075915, -2.667535, 0, 1, 0.7607843, 1,
-0.1064732, 0.2699402, -0.09402977, 0, 1, 0.7647059, 1,
-0.1010035, -1.80192, -1.228709, 0, 1, 0.772549, 1,
-0.09946458, 3.504639, -2.147543, 0, 1, 0.7764706, 1,
-0.08903071, 1.421597, 0.5912433, 0, 1, 0.7843137, 1,
-0.08659412, -0.5568448, -4.3874, 0, 1, 0.7882353, 1,
-0.08461736, 0.6924419, -1.724095, 0, 1, 0.7960784, 1,
-0.08426576, -0.1575792, -2.682285, 0, 1, 0.8039216, 1,
-0.08326506, -0.1347619, -1.782938, 0, 1, 0.8078431, 1,
-0.07931478, -0.570215, -5.583084, 0, 1, 0.8156863, 1,
-0.07853505, 1.160405, 0.4870952, 0, 1, 0.8196079, 1,
-0.07418987, -0.7635876, -5.375032, 0, 1, 0.827451, 1,
-0.07351428, 0.1022933, -0.4117287, 0, 1, 0.8313726, 1,
-0.07162622, 0.5331728, -1.318632, 0, 1, 0.8392157, 1,
-0.06722067, -1.003344, -3.73429, 0, 1, 0.8431373, 1,
-0.06673788, -0.8444928, -3.273618, 0, 1, 0.8509804, 1,
-0.06672252, -1.002087, -3.29034, 0, 1, 0.854902, 1,
-0.06284022, 0.7490349, -0.3042734, 0, 1, 0.8627451, 1,
-0.05823604, 1.690854, 0.6642712, 0, 1, 0.8666667, 1,
-0.05753313, -1.27478, -3.147759, 0, 1, 0.8745098, 1,
-0.04732301, 0.5742837, -0.06703515, 0, 1, 0.8784314, 1,
-0.04204549, -0.2366255, -1.669608, 0, 1, 0.8862745, 1,
-0.0404979, 0.8716819, 0.7252958, 0, 1, 0.8901961, 1,
-0.03430437, 1.809438, 1.4048, 0, 1, 0.8980392, 1,
-0.02674034, 0.9520274, -1.754577, 0, 1, 0.9058824, 1,
-0.02646146, -1.010094, -2.671297, 0, 1, 0.9098039, 1,
-0.02436267, 0.1560406, -0.1446626, 0, 1, 0.9176471, 1,
-0.02073418, -2.230242, -4.061527, 0, 1, 0.9215686, 1,
-0.01866634, 0.5521565, 0.3001058, 0, 1, 0.9294118, 1,
-0.01781771, 0.8411681, -1.906629, 0, 1, 0.9333333, 1,
-0.01588686, -0.5362324, -2.360607, 0, 1, 0.9411765, 1,
-0.01304513, 0.4380058, -1.268221, 0, 1, 0.945098, 1,
-0.01095005, 0.9747296, 0.8026298, 0, 1, 0.9529412, 1,
-0.01044937, -1.122829, -4.127536, 0, 1, 0.9568627, 1,
-0.009994254, -0.02948727, -3.756818, 0, 1, 0.9647059, 1,
-0.009303339, 0.7031081, -1.404694, 0, 1, 0.9686275, 1,
-0.006203892, -1.510975, -3.198816, 0, 1, 0.9764706, 1,
-0.003995578, 0.8701887, 0.3882234, 0, 1, 0.9803922, 1,
-0.001576872, -1.204292, -5.513522, 0, 1, 0.9882353, 1,
-0.0007110957, -0.6919376, -2.516861, 0, 1, 0.9921569, 1,
0.0002770795, -0.6772324, 3.638753, 0, 1, 1, 1,
0.00399624, 1.032903, 0.2047456, 0, 0.9921569, 1, 1,
0.006791594, 0.9422517, 1.592731, 0, 0.9882353, 1, 1,
0.007757719, -0.8742599, 2.609253, 0, 0.9803922, 1, 1,
0.008025575, 2.654973, 0.02589753, 0, 0.9764706, 1, 1,
0.01429187, 0.5497718, 0.4518102, 0, 0.9686275, 1, 1,
0.01920552, 0.7069906, -0.5061359, 0, 0.9647059, 1, 1,
0.02048844, 0.2832118, -0.5409632, 0, 0.9568627, 1, 1,
0.02407624, -0.6446041, 3.688201, 0, 0.9529412, 1, 1,
0.02751265, -0.09619092, 1.891287, 0, 0.945098, 1, 1,
0.0277924, -0.3848898, 3.868482, 0, 0.9411765, 1, 1,
0.03131235, 2.223819, -2.114032, 0, 0.9333333, 1, 1,
0.03194505, -1.358802, 2.859671, 0, 0.9294118, 1, 1,
0.03203863, -0.9292573, 3.403564, 0, 0.9215686, 1, 1,
0.03294286, 0.4363662, -0.0701694, 0, 0.9176471, 1, 1,
0.03354727, -2.07327, 4.639192, 0, 0.9098039, 1, 1,
0.03732455, -0.2347545, 2.675467, 0, 0.9058824, 1, 1,
0.03990802, 0.3809495, -0.7260016, 0, 0.8980392, 1, 1,
0.04013524, -0.787763, 1.816859, 0, 0.8901961, 1, 1,
0.04078312, -1.299268, 0.6574458, 0, 0.8862745, 1, 1,
0.04134881, 0.4090063, -0.359272, 0, 0.8784314, 1, 1,
0.04830977, 0.05726715, 0.9189799, 0, 0.8745098, 1, 1,
0.05216162, 0.3839428, -1.072024, 0, 0.8666667, 1, 1,
0.05256368, -0.05721138, 2.489703, 0, 0.8627451, 1, 1,
0.05339417, -0.1755159, 3.872298, 0, 0.854902, 1, 1,
0.05523055, 0.3538364, -1.006088, 0, 0.8509804, 1, 1,
0.05766986, 0.6678213, -0.1636616, 0, 0.8431373, 1, 1,
0.06012885, 0.1354161, -0.4094369, 0, 0.8392157, 1, 1,
0.07038718, -0.253727, 3.765473, 0, 0.8313726, 1, 1,
0.07335673, -0.8491848, 2.270464, 0, 0.827451, 1, 1,
0.07809725, 1.277575, 0.6391447, 0, 0.8196079, 1, 1,
0.0794654, 1.273308, -0.5689801, 0, 0.8156863, 1, 1,
0.0874632, -0.2885947, 1.686162, 0, 0.8078431, 1, 1,
0.08897556, 0.6799009, 1.22059, 0, 0.8039216, 1, 1,
0.08928418, -0.005796565, 1.840972, 0, 0.7960784, 1, 1,
0.09322109, 0.2412456, -1.349117, 0, 0.7882353, 1, 1,
0.09472468, -1.14766, 3.273318, 0, 0.7843137, 1, 1,
0.09605764, 0.7177258, -1.542854, 0, 0.7764706, 1, 1,
0.09841682, 0.7838584, -0.2106298, 0, 0.772549, 1, 1,
0.09962071, -1.058454, 3.589098, 0, 0.7647059, 1, 1,
0.102225, 0.1088192, 1.249523, 0, 0.7607843, 1, 1,
0.1053198, 0.5910397, 0.7443727, 0, 0.7529412, 1, 1,
0.1104164, 0.02697732, 0.5555555, 0, 0.7490196, 1, 1,
0.1111256, -0.6926187, 2.751087, 0, 0.7411765, 1, 1,
0.1139762, 0.003088804, 2.067899, 0, 0.7372549, 1, 1,
0.1167492, 0.4145041, -0.127207, 0, 0.7294118, 1, 1,
0.1184978, 0.1026164, 1.069139, 0, 0.7254902, 1, 1,
0.1247005, -0.002949235, 1.43538, 0, 0.7176471, 1, 1,
0.1269916, -0.833863, 2.802527, 0, 0.7137255, 1, 1,
0.128869, 0.4752209, -1.979524, 0, 0.7058824, 1, 1,
0.1310273, -1.846782, 2.169584, 0, 0.6980392, 1, 1,
0.1321776, 0.4004715, -0.3161406, 0, 0.6941177, 1, 1,
0.1326223, 1.728497, 1.55281, 0, 0.6862745, 1, 1,
0.1329913, -1.00092, 3.859031, 0, 0.682353, 1, 1,
0.1341678, 0.06297721, 0.5001616, 0, 0.6745098, 1, 1,
0.1445926, -0.01651955, 0.6955879, 0, 0.6705883, 1, 1,
0.1462465, 0.3112321, 0.5975844, 0, 0.6627451, 1, 1,
0.1463706, 0.7648604, -0.3886012, 0, 0.6588235, 1, 1,
0.1509778, -0.5490478, 4.444057, 0, 0.6509804, 1, 1,
0.1516791, -0.2077457, 2.1515, 0, 0.6470588, 1, 1,
0.1530702, -0.6332659, 2.123418, 0, 0.6392157, 1, 1,
0.1585311, 0.056587, 0.3438849, 0, 0.6352941, 1, 1,
0.1586877, 1.062884, 1.589726, 0, 0.627451, 1, 1,
0.15909, -1.12665, 3.271517, 0, 0.6235294, 1, 1,
0.1667258, -1.104108, 2.409231, 0, 0.6156863, 1, 1,
0.1688084, -0.9528544, 2.866066, 0, 0.6117647, 1, 1,
0.1697081, 1.215525, 1.257019, 0, 0.6039216, 1, 1,
0.1707522, 0.08005729, -0.8183347, 0, 0.5960785, 1, 1,
0.1738206, 0.1557218, -1.290667, 0, 0.5921569, 1, 1,
0.1760036, -0.1015486, 2.772198, 0, 0.5843138, 1, 1,
0.1777925, -2.204779, 2.57861, 0, 0.5803922, 1, 1,
0.177917, 0.02927315, 0.8380127, 0, 0.572549, 1, 1,
0.183653, 1.247476, -1.21305, 0, 0.5686275, 1, 1,
0.184629, -0.7501393, 3.755754, 0, 0.5607843, 1, 1,
0.1871467, 0.05765549, 1.424477, 0, 0.5568628, 1, 1,
0.188334, -0.01398309, 1.26195, 0, 0.5490196, 1, 1,
0.1885427, 0.5586973, 1.945103, 0, 0.5450981, 1, 1,
0.1892474, 0.8883728, 1.44756, 0, 0.5372549, 1, 1,
0.1918581, 2.231018, -0.4555666, 0, 0.5333334, 1, 1,
0.1947583, 1.46237, 0.1414926, 0, 0.5254902, 1, 1,
0.1955624, -0.3911585, 0.709976, 0, 0.5215687, 1, 1,
0.197576, 1.370989, 0.4005003, 0, 0.5137255, 1, 1,
0.198046, 0.08077005, 2.259359, 0, 0.509804, 1, 1,
0.1991729, 0.2431747, 1.189104, 0, 0.5019608, 1, 1,
0.2029311, 0.1416198, 1.284814, 0, 0.4941176, 1, 1,
0.2060792, -0.9431132, 5.054531, 0, 0.4901961, 1, 1,
0.2060945, 1.101785, 1.832388, 0, 0.4823529, 1, 1,
0.2065874, -1.838165, 3.186701, 0, 0.4784314, 1, 1,
0.2080169, -0.7042624, 3.467451, 0, 0.4705882, 1, 1,
0.2108241, -1.186392, 3.682358, 0, 0.4666667, 1, 1,
0.2168299, 1.503433, 0.8026198, 0, 0.4588235, 1, 1,
0.2171764, 0.0006566349, 1.659126, 0, 0.454902, 1, 1,
0.2181544, 0.8128995, -0.8078382, 0, 0.4470588, 1, 1,
0.2190836, 0.811881, -0.1555619, 0, 0.4431373, 1, 1,
0.2230019, -1.02278, 3.637459, 0, 0.4352941, 1, 1,
0.2248639, -0.9258183, 3.097189, 0, 0.4313726, 1, 1,
0.2261184, -1.32769, 2.798219, 0, 0.4235294, 1, 1,
0.2294054, 0.4105771, -1.478014, 0, 0.4196078, 1, 1,
0.2360732, -0.1695704, 1.909077, 0, 0.4117647, 1, 1,
0.2414466, 0.607572, -0.629333, 0, 0.4078431, 1, 1,
0.2436513, -0.8047557, 1.65069, 0, 0.4, 1, 1,
0.2437693, -0.8318233, 2.301769, 0, 0.3921569, 1, 1,
0.2492944, -0.01813279, 1.151375, 0, 0.3882353, 1, 1,
0.2494723, 0.6033341, -0.3058315, 0, 0.3803922, 1, 1,
0.2505624, -1.162327, 2.642717, 0, 0.3764706, 1, 1,
0.2514139, 0.8304154, -0.2107189, 0, 0.3686275, 1, 1,
0.2516158, -0.1529994, 3.315408, 0, 0.3647059, 1, 1,
0.2539352, 0.1234288, 1.391011, 0, 0.3568628, 1, 1,
0.2651501, -1.435409, 2.951292, 0, 0.3529412, 1, 1,
0.2695592, 1.348652, -2.373348, 0, 0.345098, 1, 1,
0.27325, 0.03523097, 1.719122, 0, 0.3411765, 1, 1,
0.2773339, -1.905826, 4.895471, 0, 0.3333333, 1, 1,
0.2799641, 1.553125, -0.6646607, 0, 0.3294118, 1, 1,
0.2814864, 0.2291775, -0.9800804, 0, 0.3215686, 1, 1,
0.2829607, 0.1935946, 2.074822, 0, 0.3176471, 1, 1,
0.2841706, 1.870004, 0.7890053, 0, 0.3098039, 1, 1,
0.2859735, 0.3042918, 0.8936135, 0, 0.3058824, 1, 1,
0.2883063, -0.8358495, 0.5234762, 0, 0.2980392, 1, 1,
0.2916183, -1.266097, 1.392463, 0, 0.2901961, 1, 1,
0.2926257, -0.5783998, 0.2309226, 0, 0.2862745, 1, 1,
0.2927782, -0.4765965, 1.764936, 0, 0.2784314, 1, 1,
0.2936528, -0.4813474, 2.126386, 0, 0.2745098, 1, 1,
0.2952373, -0.6185886, 3.774206, 0, 0.2666667, 1, 1,
0.2976508, -0.3304159, 2.996837, 0, 0.2627451, 1, 1,
0.2980449, 1.301231, 1.332815, 0, 0.254902, 1, 1,
0.3029298, 0.1461505, 0.5683741, 0, 0.2509804, 1, 1,
0.3030052, 0.4118704, -0.4030734, 0, 0.2431373, 1, 1,
0.3069994, -0.2866221, 3.243251, 0, 0.2392157, 1, 1,
0.312867, 0.9582304, 1.036435, 0, 0.2313726, 1, 1,
0.3137734, 0.4834298, 0.3610044, 0, 0.227451, 1, 1,
0.3140903, 0.03805549, 2.160795, 0, 0.2196078, 1, 1,
0.3146638, 0.1610318, 2.667008, 0, 0.2156863, 1, 1,
0.3226895, -0.8853526, 3.035969, 0, 0.2078431, 1, 1,
0.3247901, -0.1820183, 1.197994, 0, 0.2039216, 1, 1,
0.3304517, -1.700433, 3.563553, 0, 0.1960784, 1, 1,
0.3309392, -0.6634561, 3.168287, 0, 0.1882353, 1, 1,
0.3362688, 0.6772594, -0.2206524, 0, 0.1843137, 1, 1,
0.3386575, 0.02074537, 1.877966, 0, 0.1764706, 1, 1,
0.3391693, 0.8903734, -0.3109144, 0, 0.172549, 1, 1,
0.3557765, -0.7511874, 0.7870228, 0, 0.1647059, 1, 1,
0.358535, -1.17091, 3.939817, 0, 0.1607843, 1, 1,
0.3590972, -0.08286172, 1.818106, 0, 0.1529412, 1, 1,
0.3655744, 0.8622954, 0.07449642, 0, 0.1490196, 1, 1,
0.3687225, 1.564284, 0.193867, 0, 0.1411765, 1, 1,
0.373556, 0.07131296, -0.1356389, 0, 0.1372549, 1, 1,
0.3739862, -0.4739603, 3.39499, 0, 0.1294118, 1, 1,
0.375349, 0.4765722, 0.03100413, 0, 0.1254902, 1, 1,
0.3756659, 0.3712516, 2.464168, 0, 0.1176471, 1, 1,
0.3787375, 0.03690933, 1.117718, 0, 0.1137255, 1, 1,
0.3879363, -0.389765, 1.026993, 0, 0.1058824, 1, 1,
0.3893902, -1.032225, 3.111463, 0, 0.09803922, 1, 1,
0.3905964, 0.2387166, 0.8896756, 0, 0.09411765, 1, 1,
0.3907003, 0.3461353, 0.2447438, 0, 0.08627451, 1, 1,
0.392085, -0.02180161, 0.2397932, 0, 0.08235294, 1, 1,
0.3950444, -0.03440933, 0.4324151, 0, 0.07450981, 1, 1,
0.3954627, -0.7434356, 3.075106, 0, 0.07058824, 1, 1,
0.3986236, -0.5265341, 2.623957, 0, 0.0627451, 1, 1,
0.4006482, 0.3717783, 0.4444939, 0, 0.05882353, 1, 1,
0.4042609, 0.8094537, 1.331813, 0, 0.05098039, 1, 1,
0.4114045, 0.5485703, -0.1344182, 0, 0.04705882, 1, 1,
0.4120241, -0.8230699, 2.930207, 0, 0.03921569, 1, 1,
0.4129207, 0.09846885, 2.151078, 0, 0.03529412, 1, 1,
0.4186273, 0.9812796, 1.112496, 0, 0.02745098, 1, 1,
0.4187843, 0.03373201, 2.549409, 0, 0.02352941, 1, 1,
0.4195721, 1.510519, 1.517578, 0, 0.01568628, 1, 1,
0.4218307, -1.906843, 3.074561, 0, 0.01176471, 1, 1,
0.4227919, 0.08131941, 0.6340832, 0, 0.003921569, 1, 1,
0.4231715, -1.400698, 0.7361459, 0.003921569, 0, 1, 1,
0.4252391, 0.1306769, 0.9680498, 0.007843138, 0, 1, 1,
0.4291096, -0.994633, 2.285492, 0.01568628, 0, 1, 1,
0.4292884, 2.160201, 0.3590388, 0.01960784, 0, 1, 1,
0.4303001, -0.8203718, 1.075489, 0.02745098, 0, 1, 1,
0.4343613, 0.7761698, 0.302071, 0.03137255, 0, 1, 1,
0.4348432, -0.7327854, 3.024203, 0.03921569, 0, 1, 1,
0.4396767, 0.06121756, 0.579078, 0.04313726, 0, 1, 1,
0.4404001, -0.9789332, 3.207846, 0.05098039, 0, 1, 1,
0.4451681, 0.6746653, 1.104595, 0.05490196, 0, 1, 1,
0.4515715, 0.9649459, 0.3937085, 0.0627451, 0, 1, 1,
0.4567106, 0.2414701, 3.03885, 0.06666667, 0, 1, 1,
0.4585238, -0.330553, 2.366302, 0.07450981, 0, 1, 1,
0.4676762, 0.08254665, 2.554568, 0.07843138, 0, 1, 1,
0.468329, -0.05313708, 0.8251584, 0.08627451, 0, 1, 1,
0.4697774, -0.8778974, 1.364192, 0.09019608, 0, 1, 1,
0.4700651, -0.2482344, 1.576987, 0.09803922, 0, 1, 1,
0.470409, -0.2656484, 3.635754, 0.1058824, 0, 1, 1,
0.4706202, -0.3304932, 3.953651, 0.1098039, 0, 1, 1,
0.47847, 0.07143182, 3.348163, 0.1176471, 0, 1, 1,
0.4810269, 0.1432555, -0.3730384, 0.1215686, 0, 1, 1,
0.4843914, -0.6374744, 3.232836, 0.1294118, 0, 1, 1,
0.4882128, -1.263352, 5.287467, 0.1333333, 0, 1, 1,
0.4893053, -2.049441, 2.203732, 0.1411765, 0, 1, 1,
0.4930954, -0.237126, 2.323188, 0.145098, 0, 1, 1,
0.4962587, 0.7415977, 1.081795, 0.1529412, 0, 1, 1,
0.4993005, -0.3542796, 2.559985, 0.1568628, 0, 1, 1,
0.4998295, -0.1356475, 2.203589, 0.1647059, 0, 1, 1,
0.5087575, -0.07647828, 1.936561, 0.1686275, 0, 1, 1,
0.5103357, -0.1681009, 3.35293, 0.1764706, 0, 1, 1,
0.5165083, 1.883884, 1.132688, 0.1803922, 0, 1, 1,
0.5165145, -0.9759827, 2.117642, 0.1882353, 0, 1, 1,
0.5183313, 3.119739, -1.121245, 0.1921569, 0, 1, 1,
0.5222377, -1.591503, 2.814553, 0.2, 0, 1, 1,
0.5269701, 0.2734165, 0.1584699, 0.2078431, 0, 1, 1,
0.5275353, 0.6602845, 0.5339394, 0.2117647, 0, 1, 1,
0.5296811, 1.218284, 1.099826, 0.2196078, 0, 1, 1,
0.530067, 0.1600864, 2.560838, 0.2235294, 0, 1, 1,
0.5459704, 0.005667749, 1.320347, 0.2313726, 0, 1, 1,
0.5462977, 0.04031739, 1.797331, 0.2352941, 0, 1, 1,
0.5482153, -0.9287948, 1.677666, 0.2431373, 0, 1, 1,
0.5504904, 0.119779, 1.429585, 0.2470588, 0, 1, 1,
0.552108, 0.60807, 0.9560926, 0.254902, 0, 1, 1,
0.5560293, 0.9904007, -0.1454087, 0.2588235, 0, 1, 1,
0.5627635, -1.356787, 2.102109, 0.2666667, 0, 1, 1,
0.5698982, 1.188071, -0.4068113, 0.2705882, 0, 1, 1,
0.5716758, 0.1486633, -0.5203645, 0.2784314, 0, 1, 1,
0.5775327, 0.376772, 1.607021, 0.282353, 0, 1, 1,
0.5787801, -0.3061592, 2.561636, 0.2901961, 0, 1, 1,
0.5809556, 0.1472432, -0.1140441, 0.2941177, 0, 1, 1,
0.5846723, 0.6635826, -1.048736, 0.3019608, 0, 1, 1,
0.5854721, 2.09212, 1.542454, 0.3098039, 0, 1, 1,
0.5876354, -0.4178907, -0.2510616, 0.3137255, 0, 1, 1,
0.5896334, 0.2683798, 0.236269, 0.3215686, 0, 1, 1,
0.5898287, -0.4982237, 3.972278, 0.3254902, 0, 1, 1,
0.5945522, -0.2429766, 2.953441, 0.3333333, 0, 1, 1,
0.5959809, 0.1394775, 1.024093, 0.3372549, 0, 1, 1,
0.5969889, -0.6310245, 1.767454, 0.345098, 0, 1, 1,
0.6009687, 1.044292, 0.7278285, 0.3490196, 0, 1, 1,
0.6019798, -1.065444, 2.500344, 0.3568628, 0, 1, 1,
0.6023908, -2.038937, 2.307582, 0.3607843, 0, 1, 1,
0.6134914, -0.6321094, 1.373673, 0.3686275, 0, 1, 1,
0.6135874, 0.9524494, 2.31775, 0.372549, 0, 1, 1,
0.6154504, 0.3401266, 2.11066, 0.3803922, 0, 1, 1,
0.6179884, -0.1281282, 1.694708, 0.3843137, 0, 1, 1,
0.6211242, -0.5690322, 3.026557, 0.3921569, 0, 1, 1,
0.6221701, 0.8504142, 0.7205514, 0.3960784, 0, 1, 1,
0.6244056, 0.6120238, -0.4350331, 0.4039216, 0, 1, 1,
0.6246545, -0.03939674, 2.740312, 0.4117647, 0, 1, 1,
0.6285304, -0.1707571, 1.916951, 0.4156863, 0, 1, 1,
0.6288523, -0.3516702, 1.549481, 0.4235294, 0, 1, 1,
0.631768, 0.4476459, 2.256804, 0.427451, 0, 1, 1,
0.6359764, -0.1845663, 4.123324, 0.4352941, 0, 1, 1,
0.6363446, 0.9078284, -0.6372824, 0.4392157, 0, 1, 1,
0.6373987, -0.8210363, 3.520074, 0.4470588, 0, 1, 1,
0.6397871, 0.06069807, 1.773827, 0.4509804, 0, 1, 1,
0.6397994, 1.746054, -0.8384075, 0.4588235, 0, 1, 1,
0.6403288, 1.821628, -0.4367292, 0.4627451, 0, 1, 1,
0.6441464, -0.4864494, 3.541249, 0.4705882, 0, 1, 1,
0.6470679, 1.079271, 2.526821, 0.4745098, 0, 1, 1,
0.6495972, -0.8376555, 0.09829859, 0.4823529, 0, 1, 1,
0.6604623, 0.6355281, 2.353646, 0.4862745, 0, 1, 1,
0.6635613, -1.280443, 2.884567, 0.4941176, 0, 1, 1,
0.6698862, 0.783195, 0.1044669, 0.5019608, 0, 1, 1,
0.6716999, -0.8208988, 3.682884, 0.5058824, 0, 1, 1,
0.6722063, 0.9783306, -0.7528889, 0.5137255, 0, 1, 1,
0.6787922, -0.779684, 3.078065, 0.5176471, 0, 1, 1,
0.6803653, 0.9558489, 0.2310711, 0.5254902, 0, 1, 1,
0.6819959, 0.3305624, -0.2752305, 0.5294118, 0, 1, 1,
0.6844031, 0.5217922, -0.4351442, 0.5372549, 0, 1, 1,
0.6848548, -0.8495916, 3.373629, 0.5411765, 0, 1, 1,
0.6889141, -0.8521447, 2.409255, 0.5490196, 0, 1, 1,
0.6938094, 0.1271945, 0.8371868, 0.5529412, 0, 1, 1,
0.694221, 0.08710171, 2.185771, 0.5607843, 0, 1, 1,
0.6944085, -1.529943, 2.756224, 0.5647059, 0, 1, 1,
0.6983522, -0.2953781, 3.505169, 0.572549, 0, 1, 1,
0.7017888, -0.1964497, 3.961405, 0.5764706, 0, 1, 1,
0.710198, -2.439849, 2.563834, 0.5843138, 0, 1, 1,
0.7111349, 0.9900768, 0.6370672, 0.5882353, 0, 1, 1,
0.7120174, -0.8483909, 2.687389, 0.5960785, 0, 1, 1,
0.7127954, 0.8738471, 0.3740808, 0.6039216, 0, 1, 1,
0.7168006, 1.841437, 1.047569, 0.6078432, 0, 1, 1,
0.7222491, -0.2648391, 1.765174, 0.6156863, 0, 1, 1,
0.7267515, 0.7784039, 0.4835732, 0.6196079, 0, 1, 1,
0.7310979, 1.878442, -0.4193686, 0.627451, 0, 1, 1,
0.7312643, 0.6578094, 0.8143274, 0.6313726, 0, 1, 1,
0.7429857, 0.3555728, 1.679889, 0.6392157, 0, 1, 1,
0.7469555, 0.3339481, 0.5708169, 0.6431373, 0, 1, 1,
0.7500311, 0.09074927, 3.176292, 0.6509804, 0, 1, 1,
0.7505429, 1.270777, -0.3587644, 0.654902, 0, 1, 1,
0.7525786, 0.636304, 0.7578276, 0.6627451, 0, 1, 1,
0.7537138, 1.234213, 1.004462, 0.6666667, 0, 1, 1,
0.758101, 1.517033, -0.3272882, 0.6745098, 0, 1, 1,
0.7656389, 1.707262, -0.9750225, 0.6784314, 0, 1, 1,
0.7664293, 1.214108, -0.5918849, 0.6862745, 0, 1, 1,
0.7696306, 1.8123, 1.224456, 0.6901961, 0, 1, 1,
0.7727236, 0.8007609, 1.395574, 0.6980392, 0, 1, 1,
0.7815245, 1.6928, 1.585529, 0.7058824, 0, 1, 1,
0.7875227, -1.01126, 2.988283, 0.7098039, 0, 1, 1,
0.7929485, -0.4365329, 1.927571, 0.7176471, 0, 1, 1,
0.7938466, 0.7247396, -0.2359138, 0.7215686, 0, 1, 1,
0.7961116, 0.05585773, 1.24097, 0.7294118, 0, 1, 1,
0.8036293, 1.518236, -0.1533922, 0.7333333, 0, 1, 1,
0.8108963, 0.389951, 1.911663, 0.7411765, 0, 1, 1,
0.8167172, -0.6914978, 2.612609, 0.7450981, 0, 1, 1,
0.8273713, -1.149881, 4.33487, 0.7529412, 0, 1, 1,
0.838426, 1.370599, -0.2307135, 0.7568628, 0, 1, 1,
0.8417268, 0.8318992, 1.163598, 0.7647059, 0, 1, 1,
0.8445588, 0.4302794, 1.547863, 0.7686275, 0, 1, 1,
0.8526797, 0.4673777, 0.6768253, 0.7764706, 0, 1, 1,
0.8563832, 0.3190013, 0.91488, 0.7803922, 0, 1, 1,
0.8624997, 0.479073, -0.3162396, 0.7882353, 0, 1, 1,
0.8701136, 1.3514, 1.649878, 0.7921569, 0, 1, 1,
0.873681, 0.2821431, 0.5862612, 0.8, 0, 1, 1,
0.8744773, 0.9762729, 2.250726, 0.8078431, 0, 1, 1,
0.8753067, -0.5389494, 1.175707, 0.8117647, 0, 1, 1,
0.8826176, 0.2434823, 1.420207, 0.8196079, 0, 1, 1,
0.883469, 0.7020291, 2.023735, 0.8235294, 0, 1, 1,
0.8914952, -1.844802, 3.912154, 0.8313726, 0, 1, 1,
0.9013017, -0.1790136, 2.34025, 0.8352941, 0, 1, 1,
0.9069819, 0.6414387, 3.25793, 0.8431373, 0, 1, 1,
0.9139969, 0.1380615, 0.3825917, 0.8470588, 0, 1, 1,
0.9149706, 0.5411776, 0.6444476, 0.854902, 0, 1, 1,
0.9400132, -0.4413441, 1.317015, 0.8588235, 0, 1, 1,
0.9403648, -0.7677456, 2.478896, 0.8666667, 0, 1, 1,
0.9550248, 0.9350762, 1.459703, 0.8705882, 0, 1, 1,
0.9711941, 0.7743853, 1.175023, 0.8784314, 0, 1, 1,
0.9739451, -1.150053, 2.557179, 0.8823529, 0, 1, 1,
0.979655, -1.136958, 3.323952, 0.8901961, 0, 1, 1,
0.9799235, 3.158526, -1.053311, 0.8941177, 0, 1, 1,
0.9839051, -1.124235, 2.17003, 0.9019608, 0, 1, 1,
0.9876818, 0.03317154, 2.301738, 0.9098039, 0, 1, 1,
0.9898467, 0.7428223, 0.7390233, 0.9137255, 0, 1, 1,
0.9950411, 0.1273873, 1.188053, 0.9215686, 0, 1, 1,
0.9952974, -1.318636, 3.900529, 0.9254902, 0, 1, 1,
0.9970491, 0.7864384, -0.3582828, 0.9333333, 0, 1, 1,
0.9981669, -0.9676707, 2.391443, 0.9372549, 0, 1, 1,
1.003345, 0.1161941, 1.090415, 0.945098, 0, 1, 1,
1.005878, -0.6963711, 0.4053804, 0.9490196, 0, 1, 1,
1.019785, 1.085379, 1.212467, 0.9568627, 0, 1, 1,
1.026345, 1.022868, 2.193282, 0.9607843, 0, 1, 1,
1.031265, 0.542119, 1.931952, 0.9686275, 0, 1, 1,
1.043081, 1.414766, 0.8989091, 0.972549, 0, 1, 1,
1.047625, -1.191223, 1.556759, 0.9803922, 0, 1, 1,
1.053066, -0.3149268, 1.835704, 0.9843137, 0, 1, 1,
1.055787, 0.0430031, 1.05046, 0.9921569, 0, 1, 1,
1.062237, 0.181979, 1.612933, 0.9960784, 0, 1, 1,
1.064039, -0.08194498, 1.356851, 1, 0, 0.9960784, 1,
1.06997, -1.436449, 2.523687, 1, 0, 0.9882353, 1,
1.081157, -1.067598, 2.296954, 1, 0, 0.9843137, 1,
1.082207, 1.25625, -0.2131735, 1, 0, 0.9764706, 1,
1.082508, 0.9903227, 2.331464, 1, 0, 0.972549, 1,
1.086024, 0.005113962, 2.137617, 1, 0, 0.9647059, 1,
1.092119, -0.3700427, 1.962298, 1, 0, 0.9607843, 1,
1.101521, 1.091753, 0.9016137, 1, 0, 0.9529412, 1,
1.102018, 0.2628277, 1.250287, 1, 0, 0.9490196, 1,
1.106599, 1.151389, 2.802503, 1, 0, 0.9411765, 1,
1.106744, -0.1304186, 1.852879, 1, 0, 0.9372549, 1,
1.113855, -0.4823559, 3.138052, 1, 0, 0.9294118, 1,
1.1199, -0.285115, 2.424909, 1, 0, 0.9254902, 1,
1.121594, -1.118415, 2.4771, 1, 0, 0.9176471, 1,
1.128167, -0.8588951, 2.028689, 1, 0, 0.9137255, 1,
1.128295, -1.695366, 2.391366, 1, 0, 0.9058824, 1,
1.129573, -1.43371, 4.539124, 1, 0, 0.9019608, 1,
1.133393, -1.069195, 2.711003, 1, 0, 0.8941177, 1,
1.13544, 1.074589, 0.7657941, 1, 0, 0.8862745, 1,
1.144925, -0.8129648, 1.404364, 1, 0, 0.8823529, 1,
1.148977, -1.730616, 2.591508, 1, 0, 0.8745098, 1,
1.150164, 0.6110715, 2.24415, 1, 0, 0.8705882, 1,
1.15606, 0.5524542, 1.54835, 1, 0, 0.8627451, 1,
1.160679, 0.2498076, 1.530194, 1, 0, 0.8588235, 1,
1.160711, 0.9023069, 1.832173, 1, 0, 0.8509804, 1,
1.167565, -0.2061833, 2.13435, 1, 0, 0.8470588, 1,
1.172385, 0.5009638, -0.7916708, 1, 0, 0.8392157, 1,
1.175462, -0.2116662, 2.771733, 1, 0, 0.8352941, 1,
1.182894, -0.3903631, 1.665104, 1, 0, 0.827451, 1,
1.188432, -1.551295, 1.944563, 1, 0, 0.8235294, 1,
1.190557, 0.3500159, 2.277407, 1, 0, 0.8156863, 1,
1.196422, 0.02611148, 1.121782, 1, 0, 0.8117647, 1,
1.196805, -0.1524656, 1.363325, 1, 0, 0.8039216, 1,
1.197852, 0.708487, 1.57853, 1, 0, 0.7960784, 1,
1.20121, -1.76261, 1.920472, 1, 0, 0.7921569, 1,
1.203912, -0.5770804, 0.2638182, 1, 0, 0.7843137, 1,
1.206404, 0.7401387, 1.012988, 1, 0, 0.7803922, 1,
1.206468, 2.272791, 1.538602, 1, 0, 0.772549, 1,
1.210562, 0.2547165, 3.119174, 1, 0, 0.7686275, 1,
1.210588, 0.1206246, 1.654246, 1, 0, 0.7607843, 1,
1.21459, 0.7553377, 0.07854569, 1, 0, 0.7568628, 1,
1.216809, 1.482265, -0.5977913, 1, 0, 0.7490196, 1,
1.22058, 0.5982952, 0.9399788, 1, 0, 0.7450981, 1,
1.225547, -0.2786356, 1.644584, 1, 0, 0.7372549, 1,
1.226715, 0.04449406, 2.412549, 1, 0, 0.7333333, 1,
1.231383, -0.1405523, 1.951895, 1, 0, 0.7254902, 1,
1.232089, -1.433983, 1.186057, 1, 0, 0.7215686, 1,
1.237113, -0.8800783, 2.865445, 1, 0, 0.7137255, 1,
1.241471, -0.4227082, 2.91187, 1, 0, 0.7098039, 1,
1.24363, 1.238679, 0.104827, 1, 0, 0.7019608, 1,
1.245491, -0.4996, 2.552057, 1, 0, 0.6941177, 1,
1.25256, -0.8685958, 1.519773, 1, 0, 0.6901961, 1,
1.25806, 1.992757, 1.979223, 1, 0, 0.682353, 1,
1.260546, -0.1032518, 2.061496, 1, 0, 0.6784314, 1,
1.263543, -1.576977, 0.3341012, 1, 0, 0.6705883, 1,
1.2681, 1.228687, 2.62397, 1, 0, 0.6666667, 1,
1.268597, 0.1579123, 1.225844, 1, 0, 0.6588235, 1,
1.271146, -0.5311089, 2.423267, 1, 0, 0.654902, 1,
1.281558, 1.428302, 1.665308, 1, 0, 0.6470588, 1,
1.281638, -0.7103464, 2.554909, 1, 0, 0.6431373, 1,
1.283893, -0.9529223, 3.569699, 1, 0, 0.6352941, 1,
1.284939, 0.08811574, 1.165139, 1, 0, 0.6313726, 1,
1.287285, -0.7157373, 1.69164, 1, 0, 0.6235294, 1,
1.28845, 0.3281026, 1.954816, 1, 0, 0.6196079, 1,
1.289949, 0.5987582, 0.8124713, 1, 0, 0.6117647, 1,
1.291667, 1.386333, 3.766483, 1, 0, 0.6078432, 1,
1.293689, -1.039063, 2.618375, 1, 0, 0.6, 1,
1.315892, -0.2842657, 2.358495, 1, 0, 0.5921569, 1,
1.319657, -0.543677, 1.338001, 1, 0, 0.5882353, 1,
1.324754, 0.8611824, 2.044149, 1, 0, 0.5803922, 1,
1.337909, 1.664978, 1.222997, 1, 0, 0.5764706, 1,
1.345704, -1.638858, 2.499576, 1, 0, 0.5686275, 1,
1.354536, -0.4829341, 0.5280731, 1, 0, 0.5647059, 1,
1.356387, -0.3783299, 1.439182, 1, 0, 0.5568628, 1,
1.36285, 0.7908341, 0.9355567, 1, 0, 0.5529412, 1,
1.374016, 0.4448738, 1.892917, 1, 0, 0.5450981, 1,
1.380132, -0.4663766, 3.887967, 1, 0, 0.5411765, 1,
1.381225, 0.3493558, 2.107618, 1, 0, 0.5333334, 1,
1.386126, 0.813563, 0.646393, 1, 0, 0.5294118, 1,
1.390326, 0.3254821, 2.050252, 1, 0, 0.5215687, 1,
1.392479, 1.519542, 0.7266147, 1, 0, 0.5176471, 1,
1.393416, 0.6981128, 1.395085, 1, 0, 0.509804, 1,
1.398365, -1.00527, 0.9081504, 1, 0, 0.5058824, 1,
1.40053, -0.3920842, 2.289952, 1, 0, 0.4980392, 1,
1.403395, -0.164865, 2.170208, 1, 0, 0.4901961, 1,
1.410124, 0.2739708, 1.091867, 1, 0, 0.4862745, 1,
1.425163, 1.137402, 2.214721, 1, 0, 0.4784314, 1,
1.435747, -1.436185, 1.981047, 1, 0, 0.4745098, 1,
1.441141, 0.4335812, 2.224376, 1, 0, 0.4666667, 1,
1.462172, 0.0391561, 3.063765, 1, 0, 0.4627451, 1,
1.468924, -0.7304136, 2.394572, 1, 0, 0.454902, 1,
1.469509, -1.515954, 2.440243, 1, 0, 0.4509804, 1,
1.474053, -0.7370896, 2.889705, 1, 0, 0.4431373, 1,
1.476175, -0.2492245, 0.1035527, 1, 0, 0.4392157, 1,
1.488859, 0.7849615, 0.6632758, 1, 0, 0.4313726, 1,
1.489212, -0.2535536, 1.905832, 1, 0, 0.427451, 1,
1.489431, -1.910395, 3.531339, 1, 0, 0.4196078, 1,
1.49211, -0.2878827, 2.412379, 1, 0, 0.4156863, 1,
1.497613, 0.7003046, 0.5532715, 1, 0, 0.4078431, 1,
1.49798, -0.3295773, 3.091306, 1, 0, 0.4039216, 1,
1.502321, -1.353307, 0.6600286, 1, 0, 0.3960784, 1,
1.503342, -0.5690821, 1.896201, 1, 0, 0.3882353, 1,
1.509947, -0.1892747, 0.514345, 1, 0, 0.3843137, 1,
1.52674, 0.9949741, 1.10436, 1, 0, 0.3764706, 1,
1.526877, -0.09559567, 1.638371, 1, 0, 0.372549, 1,
1.529129, 1.219219, 0.5419762, 1, 0, 0.3647059, 1,
1.534679, -3.135142, 1.142287, 1, 0, 0.3607843, 1,
1.548705, -0.5909449, 0.8878457, 1, 0, 0.3529412, 1,
1.555967, 0.4087856, 1.956484, 1, 0, 0.3490196, 1,
1.56004, -0.1630145, 2.523199, 1, 0, 0.3411765, 1,
1.561957, -0.7590204, 2.991773, 1, 0, 0.3372549, 1,
1.562986, 0.7456847, 2.095971, 1, 0, 0.3294118, 1,
1.572232, -0.4879009, 1.276275, 1, 0, 0.3254902, 1,
1.583969, 1.815055, 0.8261905, 1, 0, 0.3176471, 1,
1.610438, -0.8466666, 1.472519, 1, 0, 0.3137255, 1,
1.658326, 0.3862957, 1.401497, 1, 0, 0.3058824, 1,
1.666149, -0.4329482, 3.025113, 1, 0, 0.2980392, 1,
1.674173, -0.2411994, 1.345843, 1, 0, 0.2941177, 1,
1.693777, 0.00245632, 1.550761, 1, 0, 0.2862745, 1,
1.697044, -1.304768, 0.5614824, 1, 0, 0.282353, 1,
1.707314, 0.2631199, 1.10857, 1, 0, 0.2745098, 1,
1.711922, -0.9958622, 2.384128, 1, 0, 0.2705882, 1,
1.724189, -0.1289371, 0.3829654, 1, 0, 0.2627451, 1,
1.754347, 0.4644599, 0.927448, 1, 0, 0.2588235, 1,
1.761934, 0.329002, -0.7148003, 1, 0, 0.2509804, 1,
1.768031, 0.3425283, 0.7144543, 1, 0, 0.2470588, 1,
1.770527, -1.657131, 2.077588, 1, 0, 0.2392157, 1,
1.778464, 1.023595, 0.6316221, 1, 0, 0.2352941, 1,
1.789467, -2.08317, 3.688023, 1, 0, 0.227451, 1,
1.815811, -0.5545117, 2.738973, 1, 0, 0.2235294, 1,
1.836324, -0.5171109, 0.3693049, 1, 0, 0.2156863, 1,
1.860604, 0.9336845, 0.942192, 1, 0, 0.2117647, 1,
1.861468, -0.1738271, 1.769913, 1, 0, 0.2039216, 1,
1.864644, -1.15088, 1.757508, 1, 0, 0.1960784, 1,
1.872738, 0.8087505, 2.191881, 1, 0, 0.1921569, 1,
1.881907, -0.08340181, 0.7891849, 1, 0, 0.1843137, 1,
1.890792, 1.939927, -1.211577, 1, 0, 0.1803922, 1,
1.932003, -1.50109, 3.489212, 1, 0, 0.172549, 1,
2.00254, -0.5432101, 1.690502, 1, 0, 0.1686275, 1,
2.01117, 0.5325388, 1.561009, 1, 0, 0.1607843, 1,
2.016236, 0.2620078, 1.868012, 1, 0, 0.1568628, 1,
2.045385, 0.04426271, 1.78593, 1, 0, 0.1490196, 1,
2.064718, 0.2729709, 0.02957257, 1, 0, 0.145098, 1,
2.084619, 1.148713, 0.616306, 1, 0, 0.1372549, 1,
2.088578, -0.3285633, 2.882177, 1, 0, 0.1333333, 1,
2.089951, -0.3839141, 1.10021, 1, 0, 0.1254902, 1,
2.128572, 2.307049, -0.8188757, 1, 0, 0.1215686, 1,
2.141955, -0.6771607, 1.081964, 1, 0, 0.1137255, 1,
2.158323, -0.4740915, 1.204759, 1, 0, 0.1098039, 1,
2.177696, -2.221232, 2.213584, 1, 0, 0.1019608, 1,
2.179486, 1.014117, 2.047884, 1, 0, 0.09411765, 1,
2.184744, -2.205754, 3.516453, 1, 0, 0.09019608, 1,
2.23272, 0.05972388, 2.078801, 1, 0, 0.08235294, 1,
2.371104, -0.1254666, 2.43212, 1, 0, 0.07843138, 1,
2.411257, -0.8513361, 2.561655, 1, 0, 0.07058824, 1,
2.416718, -0.7082454, 2.972787, 1, 0, 0.06666667, 1,
2.460001, 0.5446779, 1.672095, 1, 0, 0.05882353, 1,
2.471021, 0.2316411, 0.3652978, 1, 0, 0.05490196, 1,
2.484684, -0.08662712, 2.271845, 1, 0, 0.04705882, 1,
2.576178, 1.401035, 1.941699, 1, 0, 0.04313726, 1,
2.601758, -0.5867896, 0.932015, 1, 0, 0.03529412, 1,
2.66908, 0.04665412, 0.8308024, 1, 0, 0.03137255, 1,
2.672656, -1.346642, 2.663319, 1, 0, 0.02352941, 1,
2.838242, -0.09368222, 1.359438, 1, 0, 0.01960784, 1,
2.852859, -0.7756656, 3.195057, 1, 0, 0.01176471, 1,
3.184019, -0.6173699, 0.2072875, 1, 0, 0.007843138, 1
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
0.0132041, -4.855526, -7.425642, 0, -0.5, 0.5, 0.5,
0.0132041, -4.855526, -7.425642, 1, -0.5, 0.5, 0.5,
0.0132041, -4.855526, -7.425642, 1, 1.5, 0.5, 0.5,
0.0132041, -4.855526, -7.425642, 0, 1.5, 0.5, 0.5
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
-4.232517, -0.06960869, -7.425642, 0, -0.5, 0.5, 0.5,
-4.232517, -0.06960869, -7.425642, 1, -0.5, 0.5, 0.5,
-4.232517, -0.06960869, -7.425642, 1, 1.5, 0.5, 0.5,
-4.232517, -0.06960869, -7.425642, 0, 1.5, 0.5, 0.5
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
-4.232517, -4.855526, -0.1478088, 0, -0.5, 0.5, 0.5,
-4.232517, -4.855526, -0.1478088, 1, -0.5, 0.5, 0.5,
-4.232517, -4.855526, -0.1478088, 1, 1.5, 0.5, 0.5,
-4.232517, -4.855526, -0.1478088, 0, 1.5, 0.5, 0.5
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
-3, -3.751084, -5.746142,
3, -3.751084, -5.746142,
-3, -3.751084, -5.746142,
-3, -3.935158, -6.026059,
-2, -3.751084, -5.746142,
-2, -3.935158, -6.026059,
-1, -3.751084, -5.746142,
-1, -3.935158, -6.026059,
0, -3.751084, -5.746142,
0, -3.935158, -6.026059,
1, -3.751084, -5.746142,
1, -3.935158, -6.026059,
2, -3.751084, -5.746142,
2, -3.935158, -6.026059,
3, -3.751084, -5.746142,
3, -3.935158, -6.026059
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
-3, -4.303305, -6.585892, 0, -0.5, 0.5, 0.5,
-3, -4.303305, -6.585892, 1, -0.5, 0.5, 0.5,
-3, -4.303305, -6.585892, 1, 1.5, 0.5, 0.5,
-3, -4.303305, -6.585892, 0, 1.5, 0.5, 0.5,
-2, -4.303305, -6.585892, 0, -0.5, 0.5, 0.5,
-2, -4.303305, -6.585892, 1, -0.5, 0.5, 0.5,
-2, -4.303305, -6.585892, 1, 1.5, 0.5, 0.5,
-2, -4.303305, -6.585892, 0, 1.5, 0.5, 0.5,
-1, -4.303305, -6.585892, 0, -0.5, 0.5, 0.5,
-1, -4.303305, -6.585892, 1, -0.5, 0.5, 0.5,
-1, -4.303305, -6.585892, 1, 1.5, 0.5, 0.5,
-1, -4.303305, -6.585892, 0, 1.5, 0.5, 0.5,
0, -4.303305, -6.585892, 0, -0.5, 0.5, 0.5,
0, -4.303305, -6.585892, 1, -0.5, 0.5, 0.5,
0, -4.303305, -6.585892, 1, 1.5, 0.5, 0.5,
0, -4.303305, -6.585892, 0, 1.5, 0.5, 0.5,
1, -4.303305, -6.585892, 0, -0.5, 0.5, 0.5,
1, -4.303305, -6.585892, 1, -0.5, 0.5, 0.5,
1, -4.303305, -6.585892, 1, 1.5, 0.5, 0.5,
1, -4.303305, -6.585892, 0, 1.5, 0.5, 0.5,
2, -4.303305, -6.585892, 0, -0.5, 0.5, 0.5,
2, -4.303305, -6.585892, 1, -0.5, 0.5, 0.5,
2, -4.303305, -6.585892, 1, 1.5, 0.5, 0.5,
2, -4.303305, -6.585892, 0, 1.5, 0.5, 0.5,
3, -4.303305, -6.585892, 0, -0.5, 0.5, 0.5,
3, -4.303305, -6.585892, 1, -0.5, 0.5, 0.5,
3, -4.303305, -6.585892, 1, 1.5, 0.5, 0.5,
3, -4.303305, -6.585892, 0, 1.5, 0.5, 0.5
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
-3.252735, -2, -5.746142,
-3.252735, 2, -5.746142,
-3.252735, -2, -5.746142,
-3.416032, -2, -6.026059,
-3.252735, 0, -5.746142,
-3.416032, 0, -6.026059,
-3.252735, 2, -5.746142,
-3.416032, 2, -6.026059
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
-3.742626, -2, -6.585892, 0, -0.5, 0.5, 0.5,
-3.742626, -2, -6.585892, 1, -0.5, 0.5, 0.5,
-3.742626, -2, -6.585892, 1, 1.5, 0.5, 0.5,
-3.742626, -2, -6.585892, 0, 1.5, 0.5, 0.5,
-3.742626, 0, -6.585892, 0, -0.5, 0.5, 0.5,
-3.742626, 0, -6.585892, 1, -0.5, 0.5, 0.5,
-3.742626, 0, -6.585892, 1, 1.5, 0.5, 0.5,
-3.742626, 0, -6.585892, 0, 1.5, 0.5, 0.5,
-3.742626, 2, -6.585892, 0, -0.5, 0.5, 0.5,
-3.742626, 2, -6.585892, 1, -0.5, 0.5, 0.5,
-3.742626, 2, -6.585892, 1, 1.5, 0.5, 0.5,
-3.742626, 2, -6.585892, 0, 1.5, 0.5, 0.5
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
-3.252735, -3.751084, -4,
-3.252735, -3.751084, 4,
-3.252735, -3.751084, -4,
-3.416032, -3.935158, -4,
-3.252735, -3.751084, -2,
-3.416032, -3.935158, -2,
-3.252735, -3.751084, 0,
-3.416032, -3.935158, 0,
-3.252735, -3.751084, 2,
-3.416032, -3.935158, 2,
-3.252735, -3.751084, 4,
-3.416032, -3.935158, 4
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
-3.742626, -4.303305, -4, 0, -0.5, 0.5, 0.5,
-3.742626, -4.303305, -4, 1, -0.5, 0.5, 0.5,
-3.742626, -4.303305, -4, 1, 1.5, 0.5, 0.5,
-3.742626, -4.303305, -4, 0, 1.5, 0.5, 0.5,
-3.742626, -4.303305, -2, 0, -0.5, 0.5, 0.5,
-3.742626, -4.303305, -2, 1, -0.5, 0.5, 0.5,
-3.742626, -4.303305, -2, 1, 1.5, 0.5, 0.5,
-3.742626, -4.303305, -2, 0, 1.5, 0.5, 0.5,
-3.742626, -4.303305, 0, 0, -0.5, 0.5, 0.5,
-3.742626, -4.303305, 0, 1, -0.5, 0.5, 0.5,
-3.742626, -4.303305, 0, 1, 1.5, 0.5, 0.5,
-3.742626, -4.303305, 0, 0, 1.5, 0.5, 0.5,
-3.742626, -4.303305, 2, 0, -0.5, 0.5, 0.5,
-3.742626, -4.303305, 2, 1, -0.5, 0.5, 0.5,
-3.742626, -4.303305, 2, 1, 1.5, 0.5, 0.5,
-3.742626, -4.303305, 2, 0, 1.5, 0.5, 0.5,
-3.742626, -4.303305, 4, 0, -0.5, 0.5, 0.5,
-3.742626, -4.303305, 4, 1, -0.5, 0.5, 0.5,
-3.742626, -4.303305, 4, 1, 1.5, 0.5, 0.5,
-3.742626, -4.303305, 4, 0, 1.5, 0.5, 0.5
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
-3.252735, -3.751084, -5.746142,
-3.252735, 3.611866, -5.746142,
-3.252735, -3.751084, 5.450525,
-3.252735, 3.611866, 5.450525,
-3.252735, -3.751084, -5.746142,
-3.252735, -3.751084, 5.450525,
-3.252735, 3.611866, -5.746142,
-3.252735, 3.611866, 5.450525,
-3.252735, -3.751084, -5.746142,
3.279144, -3.751084, -5.746142,
-3.252735, -3.751084, 5.450525,
3.279144, -3.751084, 5.450525,
-3.252735, 3.611866, -5.746142,
3.279144, 3.611866, -5.746142,
-3.252735, 3.611866, 5.450525,
3.279144, 3.611866, 5.450525,
3.279144, -3.751084, -5.746142,
3.279144, 3.611866, -5.746142,
3.279144, -3.751084, 5.450525,
3.279144, 3.611866, 5.450525,
3.279144, -3.751084, -5.746142,
3.279144, -3.751084, 5.450525,
3.279144, 3.611866, -5.746142,
3.279144, 3.611866, 5.450525
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
var radius = 7.9605;
var distance = 35.41716;
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
mvMatrix.translate( -0.0132041, 0.06960869, 0.1478088 );
mvMatrix.scale( 1.317699, 1.168967, 0.7687152 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41716);
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
acetic_acid<-read.table("acetic_acid.xyz")
```

```
## Error in read.table("acetic_acid.xyz"): no lines available in input
```

```r
x<-acetic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
y<-acetic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
z<-acetic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
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
-3.157611, -0.09503665, -2.013903, 0, 0, 1, 1, 1,
-2.840988, 0.01617654, -1.082518, 1, 0, 0, 1, 1,
-2.786305, 0.3171568, -1.943662, 1, 0, 0, 1, 1,
-2.697888, 0.6874229, -0.7712678, 1, 0, 0, 1, 1,
-2.592425, 0.07249408, -1.067371, 1, 0, 0, 1, 1,
-2.423528, -0.09103057, -0.5718503, 1, 0, 0, 1, 1,
-2.419089, 0.2006327, 0.6426538, 0, 0, 0, 1, 1,
-2.373038, 0.3121019, -1.674672, 0, 0, 0, 1, 1,
-2.305733, 0.07346622, -0.7678918, 0, 0, 0, 1, 1,
-2.295409, 0.5900862, -2.767835, 0, 0, 0, 1, 1,
-2.276176, -1.37068, -2.309544, 0, 0, 0, 1, 1,
-2.227601, 0.1559217, -1.544982, 0, 0, 0, 1, 1,
-2.184732, -1.381687, -2.267618, 0, 0, 0, 1, 1,
-2.170115, 0.6648653, -1.159039, 1, 1, 1, 1, 1,
-2.16486, -1.11969, -2.967638, 1, 1, 1, 1, 1,
-2.139844, -1.674178, -2.54985, 1, 1, 1, 1, 1,
-2.130184, 0.6230998, -2.378679, 1, 1, 1, 1, 1,
-2.087007, 0.7824914, -1.322473, 1, 1, 1, 1, 1,
-2.076151, -0.7114987, -1.243743, 1, 1, 1, 1, 1,
-2.066311, -1.223896, -1.792136, 1, 1, 1, 1, 1,
-2.064431, 0.176374, -0.9084368, 1, 1, 1, 1, 1,
-2.035137, -2.28877, -2.603612, 1, 1, 1, 1, 1,
-1.988839, 1.149064, -1.37941, 1, 1, 1, 1, 1,
-1.988359, -0.1898093, -3.563072, 1, 1, 1, 1, 1,
-1.97733, -1.035049, -1.382142, 1, 1, 1, 1, 1,
-1.940544, -0.5370094, -1.032119, 1, 1, 1, 1, 1,
-1.917736, -1.330408, -3.005524, 1, 1, 1, 1, 1,
-1.905046, -0.9544889, -0.99004, 1, 1, 1, 1, 1,
-1.898271, 0.3681751, 0.4724191, 0, 0, 1, 1, 1,
-1.882642, 0.08164212, -1.169657, 1, 0, 0, 1, 1,
-1.880022, 0.8690356, -2.004901, 1, 0, 0, 1, 1,
-1.816175, -0.2524467, -2.278713, 1, 0, 0, 1, 1,
-1.803079, -0.4061376, -2.419645, 1, 0, 0, 1, 1,
-1.7701, -1.642097, -2.630518, 1, 0, 0, 1, 1,
-1.73123, 0.7647847, 0.01225949, 0, 0, 0, 1, 1,
-1.70586, 0.6827102, -2.668248, 0, 0, 0, 1, 1,
-1.697892, -1.894084, -1.607487, 0, 0, 0, 1, 1,
-1.683342, -0.9453331, -2.145849, 0, 0, 0, 1, 1,
-1.669784, 0.02488666, -1.297179, 0, 0, 0, 1, 1,
-1.665486, 0.6766743, -0.04224812, 0, 0, 0, 1, 1,
-1.657139, 1.085614, 0.1428584, 0, 0, 0, 1, 1,
-1.649356, -0.2114787, -0.5600297, 1, 1, 1, 1, 1,
-1.649099, 0.7423145, -1.279426, 1, 1, 1, 1, 1,
-1.626914, 0.1052545, -2.051259, 1, 1, 1, 1, 1,
-1.625189, 0.6394481, -1.799116, 1, 1, 1, 1, 1,
-1.606804, 1.481403, -1.193287, 1, 1, 1, 1, 1,
-1.594581, -0.04175136, -3.540841, 1, 1, 1, 1, 1,
-1.593565, 1.490607, -1.756204, 1, 1, 1, 1, 1,
-1.588935, 0.3558267, 0.7623119, 1, 1, 1, 1, 1,
-1.576661, -0.4807356, -1.457133, 1, 1, 1, 1, 1,
-1.564019, 0.07760936, -2.245242, 1, 1, 1, 1, 1,
-1.557983, 1.363105, -1.511881, 1, 1, 1, 1, 1,
-1.546768, -0.3266338, -1.341076, 1, 1, 1, 1, 1,
-1.537284, -0.9019167, 0.1640812, 1, 1, 1, 1, 1,
-1.534645, -0.3005567, -1.52627, 1, 1, 1, 1, 1,
-1.532839, -0.9754938, -3.725171, 1, 1, 1, 1, 1,
-1.530295, 0.338594, -1.956701, 0, 0, 1, 1, 1,
-1.509889, -2.015552, -1.468637, 1, 0, 0, 1, 1,
-1.502988, -0.2170673, -1.127294, 1, 0, 0, 1, 1,
-1.491647, -0.4837532, -0.3750837, 1, 0, 0, 1, 1,
-1.482516, -0.553558, -1.940831, 1, 0, 0, 1, 1,
-1.476472, -0.08464863, -1.360481, 1, 0, 0, 1, 1,
-1.476032, 0.4775598, -2.485509, 0, 0, 0, 1, 1,
-1.470193, -1.648952, -1.65426, 0, 0, 0, 1, 1,
-1.461122, 1.479562, -0.9074855, 0, 0, 0, 1, 1,
-1.432154, 1.070594, -0.4549216, 0, 0, 0, 1, 1,
-1.427168, 0.01622501, -0.497052, 0, 0, 0, 1, 1,
-1.403617, -0.6258172, -1.928043, 0, 0, 0, 1, 1,
-1.39888, 0.1098571, 0.02730574, 0, 0, 0, 1, 1,
-1.394594, -2.100703, -3.137628, 1, 1, 1, 1, 1,
-1.394593, 1.067837, -0.6519482, 1, 1, 1, 1, 1,
-1.390771, 1.435511, -0.5603275, 1, 1, 1, 1, 1,
-1.38829, 0.187927, -1.891848, 1, 1, 1, 1, 1,
-1.38465, 0.9039302, -0.5951109, 1, 1, 1, 1, 1,
-1.383918, -0.3607763, -2.131386, 1, 1, 1, 1, 1,
-1.346342, -1.934174, -3.340101, 1, 1, 1, 1, 1,
-1.33052, -0.3861751, -2.118069, 1, 1, 1, 1, 1,
-1.329619, 1.126829, -1.324744, 1, 1, 1, 1, 1,
-1.326662, 1.25718, -0.8269687, 1, 1, 1, 1, 1,
-1.319534, 0.538306, -0.7686431, 1, 1, 1, 1, 1,
-1.315696, -0.05612582, -0.6076089, 1, 1, 1, 1, 1,
-1.30391, 1.039029, -2.58055, 1, 1, 1, 1, 1,
-1.302059, 0.7265976, -0.9775808, 1, 1, 1, 1, 1,
-1.293014, 0.03568754, -2.378058, 1, 1, 1, 1, 1,
-1.292175, 0.2266633, 0.361021, 0, 0, 1, 1, 1,
-1.287495, -1.069565, -2.272791, 1, 0, 0, 1, 1,
-1.28307, 1.197778, -2.853402, 1, 0, 0, 1, 1,
-1.281368, -1.145907, -2.006252, 1, 0, 0, 1, 1,
-1.277074, 0.323303, -0.1856033, 1, 0, 0, 1, 1,
-1.263903, 0.2849058, -2.203362, 1, 0, 0, 1, 1,
-1.262264, -1.000171, -3.515244, 0, 0, 0, 1, 1,
-1.261889, -0.6896331, -1.80535, 0, 0, 0, 1, 1,
-1.246184, 0.4819071, 0.2850444, 0, 0, 0, 1, 1,
-1.240242, -0.2122259, -1.163366, 0, 0, 0, 1, 1,
-1.237073, -0.1340953, -1.675718, 0, 0, 0, 1, 1,
-1.226141, 0.2965879, -0.8322158, 0, 0, 0, 1, 1,
-1.221774, 0.7748196, -1.156501, 0, 0, 0, 1, 1,
-1.215647, -0.6851906, -2.221356, 1, 1, 1, 1, 1,
-1.213869, 0.3965733, -2.734512, 1, 1, 1, 1, 1,
-1.212418, 0.7195625, -0.8769967, 1, 1, 1, 1, 1,
-1.211124, 0.3328958, -4.196237, 1, 1, 1, 1, 1,
-1.209957, 1.202691, -1.301961, 1, 1, 1, 1, 1,
-1.207259, 0.2595133, -1.589679, 1, 1, 1, 1, 1,
-1.205691, 0.4410183, -0.4103713, 1, 1, 1, 1, 1,
-1.20389, 1.354349, -1.141392, 1, 1, 1, 1, 1,
-1.19488, -1.4645, -1.827237, 1, 1, 1, 1, 1,
-1.189908, 0.02108479, -3.039498, 1, 1, 1, 1, 1,
-1.185647, 0.3307727, -1.559679, 1, 1, 1, 1, 1,
-1.180024, 1.530461, 2.432237, 1, 1, 1, 1, 1,
-1.176541, 0.3263335, -0.2392448, 1, 1, 1, 1, 1,
-1.173581, -0.5319499, -2.183945, 1, 1, 1, 1, 1,
-1.166993, -1.041524, -1.869454, 1, 1, 1, 1, 1,
-1.165226, -0.7240221, -3.72104, 0, 0, 1, 1, 1,
-1.157877, 0.2065171, -0.3920207, 1, 0, 0, 1, 1,
-1.152498, 0.0004395935, -2.725993, 1, 0, 0, 1, 1,
-1.148766, 0.6678931, -1.252553, 1, 0, 0, 1, 1,
-1.135908, 1.243955, -0.4147982, 1, 0, 0, 1, 1,
-1.135469, 0.4379042, -0.4622525, 1, 0, 0, 1, 1,
-1.126586, 0.4015962, -0.8785537, 0, 0, 0, 1, 1,
-1.11902, 0.6433669, -1.657967, 0, 0, 0, 1, 1,
-1.111177, -0.5837059, -1.493617, 0, 0, 0, 1, 1,
-1.109408, 0.826132, -1.021051, 0, 0, 0, 1, 1,
-1.104609, 1.392981, -1.271997, 0, 0, 0, 1, 1,
-1.085399, -0.4165752, -1.533598, 0, 0, 0, 1, 1,
-1.075549, -0.3571066, -2.349791, 0, 0, 0, 1, 1,
-1.068949, -0.4334058, -2.33277, 1, 1, 1, 1, 1,
-1.068176, -0.9956961, -4.459493, 1, 1, 1, 1, 1,
-1.066178, 0.007704897, -1.273428, 1, 1, 1, 1, 1,
-1.06404, 0.1675756, -1.613259, 1, 1, 1, 1, 1,
-1.062202, -1.410306, -2.111805, 1, 1, 1, 1, 1,
-1.043295, 1.035161, -2.832235, 1, 1, 1, 1, 1,
-1.035952, 0.2008252, -1.376103, 1, 1, 1, 1, 1,
-1.033146, 1.160139, -1.967466, 1, 1, 1, 1, 1,
-1.030138, 2.169093, -2.055269, 1, 1, 1, 1, 1,
-1.026539, -0.8637848, -2.31479, 1, 1, 1, 1, 1,
-1.018692, -0.2950853, -1.6816, 1, 1, 1, 1, 1,
-1.018281, -0.4950073, -3.030818, 1, 1, 1, 1, 1,
-1.007884, -0.5601916, -2.303756, 1, 1, 1, 1, 1,
-1.00686, 0.4994495, 0.06289487, 1, 1, 1, 1, 1,
-1.005019, 0.3841818, -0.2721372, 1, 1, 1, 1, 1,
-0.9960295, -0.6343262, -3.059935, 0, 0, 1, 1, 1,
-0.9905999, 0.3329837, -0.5438976, 1, 0, 0, 1, 1,
-0.9863915, -0.8104094, -2.312828, 1, 0, 0, 1, 1,
-0.9848062, -1.304789, -1.488597, 1, 0, 0, 1, 1,
-0.9836137, -0.4505675, -2.435885, 1, 0, 0, 1, 1,
-0.9818156, -1.850459, -3.076096, 1, 0, 0, 1, 1,
-0.9791818, 0.8665516, 1.345586, 0, 0, 0, 1, 1,
-0.975939, -0.6024656, -1.349513, 0, 0, 0, 1, 1,
-0.9726155, 0.9624968, 0.5259047, 0, 0, 0, 1, 1,
-0.9712156, 0.7765048, 0.2114111, 0, 0, 0, 1, 1,
-0.9651592, -0.6989742, -1.431268, 0, 0, 0, 1, 1,
-0.9649684, 1.154029, -1.410515, 0, 0, 0, 1, 1,
-0.9630411, -0.0341167, -1.322252, 0, 0, 0, 1, 1,
-0.9571673, -0.2374925, -2.049261, 1, 1, 1, 1, 1,
-0.9563639, 0.3627951, -1.31869, 1, 1, 1, 1, 1,
-0.955792, 0.9883198, -1.085631, 1, 1, 1, 1, 1,
-0.9547791, -0.4405548, -1.22804, 1, 1, 1, 1, 1,
-0.9400288, -0.8737466, -1.634739, 1, 1, 1, 1, 1,
-0.9393053, 0.5290286, -2.183043, 1, 1, 1, 1, 1,
-0.9320588, 0.3049169, -0.8109589, 1, 1, 1, 1, 1,
-0.9262292, -1.016597, -1.563776, 1, 1, 1, 1, 1,
-0.9233095, 2.325987, -0.4442269, 1, 1, 1, 1, 1,
-0.9203711, -0.5096064, -0.4533292, 1, 1, 1, 1, 1,
-0.9169473, -0.2943984, -1.386302, 1, 1, 1, 1, 1,
-0.9140618, -0.381411, -3.074511, 1, 1, 1, 1, 1,
-0.9117857, 1.280413, -0.1725952, 1, 1, 1, 1, 1,
-0.9115414, 2.180435, 1.854402, 1, 1, 1, 1, 1,
-0.9108396, -0.2560816, -0.6418573, 1, 1, 1, 1, 1,
-0.9103031, 0.7439904, -2.798709, 0, 0, 1, 1, 1,
-0.9102783, -0.6710812, -1.405222, 1, 0, 0, 1, 1,
-0.9073935, 1.47939, -0.7202091, 1, 0, 0, 1, 1,
-0.8997242, -1.05192, -1.656943, 1, 0, 0, 1, 1,
-0.8985415, -1.629573, -2.547953, 1, 0, 0, 1, 1,
-0.8979874, 0.6636434, -0.4752188, 1, 0, 0, 1, 1,
-0.8884506, 0.8047136, -0.263958, 0, 0, 0, 1, 1,
-0.8853502, 0.642405, 0.4699342, 0, 0, 0, 1, 1,
-0.8831908, 0.09953359, -1.083576, 0, 0, 0, 1, 1,
-0.8723618, 0.08989888, -1.891655, 0, 0, 0, 1, 1,
-0.8709673, 0.1394358, -0.272272, 0, 0, 0, 1, 1,
-0.8683361, 0.6409917, -0.7223514, 0, 0, 0, 1, 1,
-0.8662747, 0.5656663, -1.3111, 0, 0, 0, 1, 1,
-0.8659476, -0.4282301, -2.834508, 1, 1, 1, 1, 1,
-0.8646919, 1.141979, 0.5040668, 1, 1, 1, 1, 1,
-0.8524567, -2.417274, -2.746666, 1, 1, 1, 1, 1,
-0.8520821, -2.131231, -3.047967, 1, 1, 1, 1, 1,
-0.8517181, 1.284631, -1.78808, 1, 1, 1, 1, 1,
-0.8493916, -1.587529, -2.319349, 1, 1, 1, 1, 1,
-0.8347727, 0.4844234, 0.1363129, 1, 1, 1, 1, 1,
-0.8339229, -1.684113, 0.4318708, 1, 1, 1, 1, 1,
-0.8327813, 2.292017, 0.7585403, 1, 1, 1, 1, 1,
-0.8309295, -0.07850544, -3.059879, 1, 1, 1, 1, 1,
-0.8253637, -1.153364, -2.638037, 1, 1, 1, 1, 1,
-0.815512, 1.981638, -1.589272, 1, 1, 1, 1, 1,
-0.8138185, 0.05631376, -2.413178, 1, 1, 1, 1, 1,
-0.8136668, -0.02322257, -1.997744, 1, 1, 1, 1, 1,
-0.8078949, -0.1711135, -1.272083, 1, 1, 1, 1, 1,
-0.804801, 0.05400527, -0.2418321, 0, 0, 1, 1, 1,
-0.8006924, 0.4151892, -1.220601, 1, 0, 0, 1, 1,
-0.7960879, -1.178374, -1.893548, 1, 0, 0, 1, 1,
-0.7933124, -2.477629, -3.660111, 1, 0, 0, 1, 1,
-0.7932835, -0.42516, -1.618172, 1, 0, 0, 1, 1,
-0.7906536, 0.488468, -1.358832, 1, 0, 0, 1, 1,
-0.787688, -0.1591508, -1.084933, 0, 0, 0, 1, 1,
-0.7869405, -0.3030078, -1.587566, 0, 0, 0, 1, 1,
-0.7868692, 1.376955, 1.062199, 0, 0, 0, 1, 1,
-0.7854609, 0.2691654, -1.500606, 0, 0, 0, 1, 1,
-0.7840867, 0.08389972, -0.6560556, 0, 0, 0, 1, 1,
-0.7825553, -0.698494, -2.191353, 0, 0, 0, 1, 1,
-0.781496, 1.180681, -0.2542843, 0, 0, 0, 1, 1,
-0.7808467, -2.682992, -3.508619, 1, 1, 1, 1, 1,
-0.7763711, -0.06317514, -0.9420688, 1, 1, 1, 1, 1,
-0.7760192, 0.8090798, -2.46684, 1, 1, 1, 1, 1,
-0.7667343, -0.778645, -2.876295, 1, 1, 1, 1, 1,
-0.7657598, 1.102055, -1.161072, 1, 1, 1, 1, 1,
-0.7653936, 0.1150746, -1.028687, 1, 1, 1, 1, 1,
-0.7590607, -1.797427, -1.625262, 1, 1, 1, 1, 1,
-0.7584828, -1.028416, -3.055085, 1, 1, 1, 1, 1,
-0.7496614, 0.1955676, -0.1476169, 1, 1, 1, 1, 1,
-0.7437276, -0.2356331, -1.982571, 1, 1, 1, 1, 1,
-0.7374262, 1.133778, -1.110778, 1, 1, 1, 1, 1,
-0.73469, -3.643856, -5.347208, 1, 1, 1, 1, 1,
-0.7301017, -0.5802631, -2.962367, 1, 1, 1, 1, 1,
-0.7213774, -2.168114, -2.324864, 1, 1, 1, 1, 1,
-0.7191382, -0.5870509, -1.712456, 1, 1, 1, 1, 1,
-0.7142786, -0.6061751, -0.6933681, 0, 0, 1, 1, 1,
-0.7130893, -0.2408275, -1.844837, 1, 0, 0, 1, 1,
-0.7121036, -0.2045843, -2.335007, 1, 0, 0, 1, 1,
-0.7069776, 0.707042, 0.1250633, 1, 0, 0, 1, 1,
-0.7031711, 0.364133, -1.543483, 1, 0, 0, 1, 1,
-0.7025554, -0.5285056, -0.3714963, 1, 0, 0, 1, 1,
-0.6988276, -0.2476841, -2.409209, 0, 0, 0, 1, 1,
-0.6963431, 1.199943, 1.481102, 0, 0, 0, 1, 1,
-0.6962923, 0.3864848, -3.960741, 0, 0, 0, 1, 1,
-0.6957281, -0.2958403, -1.712306, 0, 0, 0, 1, 1,
-0.6945358, -1.928084, -2.535315, 0, 0, 0, 1, 1,
-0.6895854, 0.8125624, -0.2573974, 0, 0, 0, 1, 1,
-0.6793497, -0.285866, -2.474202, 0, 0, 0, 1, 1,
-0.6778303, -0.5685646, -0.2328032, 1, 1, 1, 1, 1,
-0.6649432, 0.1946004, 0.1438032, 1, 1, 1, 1, 1,
-0.6649253, 0.2526434, -0.8346794, 1, 1, 1, 1, 1,
-0.6589228, -0.2582814, -1.115978, 1, 1, 1, 1, 1,
-0.6569541, 0.6635309, -0.4719906, 1, 1, 1, 1, 1,
-0.6503515, -0.284045, -3.658194, 1, 1, 1, 1, 1,
-0.6482386, -2.510754, -5.47028, 1, 1, 1, 1, 1,
-0.6456591, 0.082366, -2.897399, 1, 1, 1, 1, 1,
-0.6432977, -1.463451, -3.842268, 1, 1, 1, 1, 1,
-0.6428866, -2.11821, -1.649909, 1, 1, 1, 1, 1,
-0.634206, -0.1086977, -1.306547, 1, 1, 1, 1, 1,
-0.63349, 1.20807, -0.319158, 1, 1, 1, 1, 1,
-0.6311183, 0.6623065, -0.5640092, 1, 1, 1, 1, 1,
-0.6256496, -1.610246, -4.027258, 1, 1, 1, 1, 1,
-0.6235321, 0.1385343, -3.348479, 1, 1, 1, 1, 1,
-0.6184338, 0.3515972, 1.221838, 0, 0, 1, 1, 1,
-0.6182421, 1.020549, -1.801878, 1, 0, 0, 1, 1,
-0.6161211, -1.156847, -1.712689, 1, 0, 0, 1, 1,
-0.6158605, 2.47072, -1.632732, 1, 0, 0, 1, 1,
-0.6143162, 0.5203651, -0.4937946, 1, 0, 0, 1, 1,
-0.6124698, 0.4188754, 0.3610737, 1, 0, 0, 1, 1,
-0.6078966, 0.472302, -1.571366, 0, 0, 0, 1, 1,
-0.6034924, -0.3640666, -1.111087, 0, 0, 0, 1, 1,
-0.6019214, -2.135664, -2.400455, 0, 0, 0, 1, 1,
-0.5993606, -0.4957765, -1.381458, 0, 0, 0, 1, 1,
-0.5970985, 0.7260849, -1.224959, 0, 0, 0, 1, 1,
-0.593621, 0.540543, 0.5730364, 0, 0, 0, 1, 1,
-0.5894633, -0.7807841, -1.43261, 0, 0, 0, 1, 1,
-0.5880067, 0.3787062, -1.943039, 1, 1, 1, 1, 1,
-0.5878541, -1.714119, -4.191242, 1, 1, 1, 1, 1,
-0.5860982, -0.04226996, -0.07042306, 1, 1, 1, 1, 1,
-0.5843524, 0.934172, 0.4924522, 1, 1, 1, 1, 1,
-0.5810139, -1.596983, -2.484456, 1, 1, 1, 1, 1,
-0.5804765, 0.6078468, -2.745392, 1, 1, 1, 1, 1,
-0.5727875, 1.120898, -0.295763, 1, 1, 1, 1, 1,
-0.5660967, -0.6952657, -1.836712, 1, 1, 1, 1, 1,
-0.5659575, 0.9162619, 0.1769308, 1, 1, 1, 1, 1,
-0.5634628, 0.825548, -1.113271, 1, 1, 1, 1, 1,
-0.5611591, 0.1324262, -3.24704, 1, 1, 1, 1, 1,
-0.5493655, -0.6710258, -2.793413, 1, 1, 1, 1, 1,
-0.5483351, -0.2801303, -3.302216, 1, 1, 1, 1, 1,
-0.5430796, 0.1790796, -0.02170377, 1, 1, 1, 1, 1,
-0.5418592, 0.3985112, -1.183872, 1, 1, 1, 1, 1,
-0.5415044, -1.272011, -0.6276037, 0, 0, 1, 1, 1,
-0.5403354, -0.2058804, -3.278679, 1, 0, 0, 1, 1,
-0.5388424, 0.6596369, -0.09763946, 1, 0, 0, 1, 1,
-0.5363292, 0.8366268, -1.758088, 1, 0, 0, 1, 1,
-0.5353209, 0.09415818, -1.629243, 1, 0, 0, 1, 1,
-0.5321149, -1.317922, -4.901396, 1, 0, 0, 1, 1,
-0.527472, -2.045734, -3.478038, 0, 0, 0, 1, 1,
-0.526264, -0.5340306, -4.165678, 0, 0, 0, 1, 1,
-0.5260783, 2.214446, 0.06745321, 0, 0, 0, 1, 1,
-0.5254618, -0.6759329, -2.265791, 0, 0, 0, 1, 1,
-0.5152929, 0.07738645, -1.778715, 0, 0, 0, 1, 1,
-0.5139457, -0.6840039, -2.140597, 0, 0, 0, 1, 1,
-0.5135505, -1.316161, -3.294565, 0, 0, 0, 1, 1,
-0.5057371, 0.7095472, -1.558631, 1, 1, 1, 1, 1,
-0.5039828, -0.4382651, -3.422334, 1, 1, 1, 1, 1,
-0.5026194, -0.7115483, -2.765178, 1, 1, 1, 1, 1,
-0.5008865, 0.9489499, 1.222258, 1, 1, 1, 1, 1,
-0.498306, 0.5535163, -0.9522222, 1, 1, 1, 1, 1,
-0.4969551, 0.7171876, -0.3724477, 1, 1, 1, 1, 1,
-0.4946295, 0.6470322, 0.1581426, 1, 1, 1, 1, 1,
-0.4933355, -0.5076015, -1.284915, 1, 1, 1, 1, 1,
-0.4914748, -0.1285137, -0.5883654, 1, 1, 1, 1, 1,
-0.4900456, -0.03945037, -2.965375, 1, 1, 1, 1, 1,
-0.48888, -0.5721139, -2.360615, 1, 1, 1, 1, 1,
-0.488609, -0.8235461, -1.834757, 1, 1, 1, 1, 1,
-0.486526, 1.800125, -1.092051, 1, 1, 1, 1, 1,
-0.4849045, -0.4963747, -2.513729, 1, 1, 1, 1, 1,
-0.4822964, 1.729022, -0.2254381, 1, 1, 1, 1, 1,
-0.4806014, 3.184832, -0.2551479, 0, 0, 1, 1, 1,
-0.4805178, 0.1952375, -0.7429675, 1, 0, 0, 1, 1,
-0.4791057, 0.6412231, -0.4303002, 1, 0, 0, 1, 1,
-0.477324, -0.6776715, -0.6689365, 1, 0, 0, 1, 1,
-0.4754655, -1.151801, -4.426935, 1, 0, 0, 1, 1,
-0.4737101, -0.7787184, -1.934264, 1, 0, 0, 1, 1,
-0.4717163, 1.49348, 0.5527304, 0, 0, 0, 1, 1,
-0.4706601, -1.325137, -3.725507, 0, 0, 0, 1, 1,
-0.4696898, 0.3131601, -2.085897, 0, 0, 0, 1, 1,
-0.4618871, 0.02461986, -3.392945, 0, 0, 0, 1, 1,
-0.4570868, -0.6410553, -4.081009, 0, 0, 0, 1, 1,
-0.4565608, -0.8483503, -3.687349, 0, 0, 0, 1, 1,
-0.4563912, -0.0174502, -1.809411, 0, 0, 0, 1, 1,
-0.4523498, 0.0711192, 0.1884697, 1, 1, 1, 1, 1,
-0.4519706, -0.5358492, -3.208989, 1, 1, 1, 1, 1,
-0.449578, 0.3441924, -1.620454, 1, 1, 1, 1, 1,
-0.4462459, -0.3021952, -2.530361, 1, 1, 1, 1, 1,
-0.442979, -1.844723, -1.852136, 1, 1, 1, 1, 1,
-0.4420394, 1.67419, 1.31341, 1, 1, 1, 1, 1,
-0.4380312, 0.1574439, -1.876225, 1, 1, 1, 1, 1,
-0.436963, -0.527966, -2.670902, 1, 1, 1, 1, 1,
-0.4344014, 0.9567136, 0.8595137, 1, 1, 1, 1, 1,
-0.4324193, -0.07479563, -1.055343, 1, 1, 1, 1, 1,
-0.4259041, -0.5530565, -3.977392, 1, 1, 1, 1, 1,
-0.4211252, -0.09358358, -1.865316, 1, 1, 1, 1, 1,
-0.4208163, 0.7215167, -0.5192721, 1, 1, 1, 1, 1,
-0.4185023, 0.7835857, 0.7641653, 1, 1, 1, 1, 1,
-0.4146009, 1.614384, -2.776968, 1, 1, 1, 1, 1,
-0.4039558, -1.42799, -2.773587, 0, 0, 1, 1, 1,
-0.4034589, -0.2149057, -1.339525, 1, 0, 0, 1, 1,
-0.4032602, 0.792586, -0.00870071, 1, 0, 0, 1, 1,
-0.4023809, -1.72699, -3.279644, 1, 0, 0, 1, 1,
-0.396494, -0.6738929, -4.966416, 1, 0, 0, 1, 1,
-0.3956795, 1.385318, -0.235776, 1, 0, 0, 1, 1,
-0.393665, -1.850765, -2.777329, 0, 0, 0, 1, 1,
-0.3903317, -0.8776948, -3.959485, 0, 0, 0, 1, 1,
-0.385704, 0.1185568, -0.8513903, 0, 0, 0, 1, 1,
-0.3852711, 1.052827, -1.074839, 0, 0, 0, 1, 1,
-0.3830693, 0.1656626, -1.381633, 0, 0, 0, 1, 1,
-0.3781283, -0.06510391, -1.682294, 0, 0, 0, 1, 1,
-0.3780235, 0.08906732, -2.875437, 0, 0, 0, 1, 1,
-0.3772068, -2.074795, -2.472953, 1, 1, 1, 1, 1,
-0.3757339, 0.3063674, 1.335286, 1, 1, 1, 1, 1,
-0.3752048, 1.274366, 0.7992048, 1, 1, 1, 1, 1,
-0.3745597, -0.05039092, -2.912792, 1, 1, 1, 1, 1,
-0.3743842, -1.200016, -2.75069, 1, 1, 1, 1, 1,
-0.3739073, -0.3292655, -3.65668, 1, 1, 1, 1, 1,
-0.3710063, -0.5664457, -2.11555, 1, 1, 1, 1, 1,
-0.3707682, -1.310448, -2.11996, 1, 1, 1, 1, 1,
-0.363626, 0.4905424, -0.567381, 1, 1, 1, 1, 1,
-0.3631681, -1.150566, -2.64717, 1, 1, 1, 1, 1,
-0.3627408, -0.3087345, -3.02154, 1, 1, 1, 1, 1,
-0.3593469, -0.3218702, -1.493809, 1, 1, 1, 1, 1,
-0.3577337, -0.09450167, -3.180372, 1, 1, 1, 1, 1,
-0.3553398, 1.37929, -0.2936072, 1, 1, 1, 1, 1,
-0.3484942, -0.9093539, -2.214205, 1, 1, 1, 1, 1,
-0.347055, 0.06650272, -1.325787, 0, 0, 1, 1, 1,
-0.3469432, 0.1853256, 0.03990711, 1, 0, 0, 1, 1,
-0.3447739, 0.3250818, -2.418765, 1, 0, 0, 1, 1,
-0.3440138, 1.584613, -1.801844, 1, 0, 0, 1, 1,
-0.3438531, 1.305215, -0.2080968, 1, 0, 0, 1, 1,
-0.3384035, 0.8665182, -0.001108432, 1, 0, 0, 1, 1,
-0.3368671, -0.8697424, -2.236181, 0, 0, 0, 1, 1,
-0.3364421, 0.3319433, -2.535025, 0, 0, 0, 1, 1,
-0.336302, -0.1878248, -1.561007, 0, 0, 0, 1, 1,
-0.3328851, 0.08363488, -0.6109298, 0, 0, 0, 1, 1,
-0.3302385, 0.2553472, -0.7730092, 0, 0, 0, 1, 1,
-0.3291488, -0.5452842, -1.013617, 0, 0, 0, 1, 1,
-0.3289762, -1.741729, -2.975482, 0, 0, 0, 1, 1,
-0.3275729, 0.2144756, -0.2794638, 1, 1, 1, 1, 1,
-0.3267591, -0.1648536, -1.201869, 1, 1, 1, 1, 1,
-0.3223794, 0.2010345, -1.507109, 1, 1, 1, 1, 1,
-0.3223433, -0.08648351, -1.484992, 1, 1, 1, 1, 1,
-0.3205983, 0.5329129, -0.6602694, 1, 1, 1, 1, 1,
-0.3159947, -0.9561303, -3.064117, 1, 1, 1, 1, 1,
-0.3158805, -0.7811639, -2.480943, 1, 1, 1, 1, 1,
-0.3126895, 1.871629, 0.9644532, 1, 1, 1, 1, 1,
-0.305871, -1.632, -3.717116, 1, 1, 1, 1, 1,
-0.3056507, 1.358771, -0.2856893, 1, 1, 1, 1, 1,
-0.303797, 0.6511142, 0.1687673, 1, 1, 1, 1, 1,
-0.3026992, 2.348087, -2.241472, 1, 1, 1, 1, 1,
-0.2970332, 2.192977, -0.05397099, 1, 1, 1, 1, 1,
-0.2939855, -0.9355445, -2.269839, 1, 1, 1, 1, 1,
-0.2926347, -0.8346031, -2.011055, 1, 1, 1, 1, 1,
-0.2910159, 0.9617487, -0.9321786, 0, 0, 1, 1, 1,
-0.2746046, -1.487556, -3.598437, 1, 0, 0, 1, 1,
-0.2743115, 0.8944719, 0.3643114, 1, 0, 0, 1, 1,
-0.2728498, 0.05655184, -2.67176, 1, 0, 0, 1, 1,
-0.2668773, 0.8626184, -0.7196442, 1, 0, 0, 1, 1,
-0.2663988, -0.5310546, -2.977727, 1, 0, 0, 1, 1,
-0.2660898, 0.1408766, -1.237939, 0, 0, 0, 1, 1,
-0.2651585, 1.216813, -0.02710186, 0, 0, 0, 1, 1,
-0.2578902, 0.591291, -1.630825, 0, 0, 0, 1, 1,
-0.2551348, -0.6304666, -1.816333, 0, 0, 0, 1, 1,
-0.25398, -0.2579732, -3.872669, 0, 0, 0, 1, 1,
-0.2535969, -0.6868804, -1.26472, 0, 0, 0, 1, 1,
-0.2530871, -0.04338194, -3.222218, 0, 0, 0, 1, 1,
-0.2502239, -1.265711, -2.312747, 1, 1, 1, 1, 1,
-0.2477879, 1.376141, -0.3106953, 1, 1, 1, 1, 1,
-0.2430194, 0.1043232, -1.913692, 1, 1, 1, 1, 1,
-0.2425111, -1.337567, -1.579498, 1, 1, 1, 1, 1,
-0.2416567, -0.3632035, -2.444074, 1, 1, 1, 1, 1,
-0.2398445, 0.2113423, -0.8619108, 1, 1, 1, 1, 1,
-0.2379814, 0.1858434, -1.976935, 1, 1, 1, 1, 1,
-0.2332307, 0.2508037, -0.4980255, 1, 1, 1, 1, 1,
-0.2298996, -0.07313304, 0.1423422, 1, 1, 1, 1, 1,
-0.2248717, 0.2033256, -1.145158, 1, 1, 1, 1, 1,
-0.2247808, -0.4005006, -2.787307, 1, 1, 1, 1, 1,
-0.224094, 2.041963, 0.4798729, 1, 1, 1, 1, 1,
-0.222316, -0.9062647, -3.205873, 1, 1, 1, 1, 1,
-0.2187173, -0.4214537, -3.575082, 1, 1, 1, 1, 1,
-0.2170328, 0.3172729, -1.254591, 1, 1, 1, 1, 1,
-0.2159682, -0.007211893, -0.4382679, 0, 0, 1, 1, 1,
-0.2135837, 0.4435241, -1.361416, 1, 0, 0, 1, 1,
-0.2134662, 0.7500324, -0.05907312, 1, 0, 0, 1, 1,
-0.2119567, 0.1791154, -0.5071487, 1, 0, 0, 1, 1,
-0.2087211, -1.286783, -2.835247, 1, 0, 0, 1, 1,
-0.2068418, -0.1285385, -2.220657, 1, 0, 0, 1, 1,
-0.2058788, 0.456594, -0.5040364, 0, 0, 0, 1, 1,
-0.2000213, -1.405872, -3.549943, 0, 0, 0, 1, 1,
-0.1968969, -0.08088291, -1.859544, 0, 0, 0, 1, 1,
-0.1960699, -0.5857875, -3.300127, 0, 0, 0, 1, 1,
-0.1922156, -2.829849, -3.771638, 0, 0, 0, 1, 1,
-0.1919998, -0.1283027, -2.339854, 0, 0, 0, 1, 1,
-0.1904567, -0.03648845, -1.880072, 0, 0, 0, 1, 1,
-0.1892544, -0.9696847, -3.946841, 1, 1, 1, 1, 1,
-0.187287, -0.8803624, -3.125448, 1, 1, 1, 1, 1,
-0.1855522, -0.5939948, -1.475734, 1, 1, 1, 1, 1,
-0.1832069, -0.6192945, -3.058494, 1, 1, 1, 1, 1,
-0.1813904, -0.695949, -2.044502, 1, 1, 1, 1, 1,
-0.179619, -0.9124409, -2.240264, 1, 1, 1, 1, 1,
-0.179139, -1.641155, -2.944144, 1, 1, 1, 1, 1,
-0.1789431, -0.3913998, -3.011231, 1, 1, 1, 1, 1,
-0.1767107, -0.6998201, -2.982616, 1, 1, 1, 1, 1,
-0.1753339, -0.1231012, -1.295061, 1, 1, 1, 1, 1,
-0.1741674, 1.683531, 0.2488873, 1, 1, 1, 1, 1,
-0.1722361, 1.048825, -0.2252987, 1, 1, 1, 1, 1,
-0.1715834, -0.4306371, -2.110966, 1, 1, 1, 1, 1,
-0.1678859, -0.4404784, -4.20668, 1, 1, 1, 1, 1,
-0.1676441, -0.9007839, -1.080255, 1, 1, 1, 1, 1,
-0.1670483, -1.650579, -3.126768, 0, 0, 1, 1, 1,
-0.1608794, 1.946533, -0.3616168, 1, 0, 0, 1, 1,
-0.1590424, 0.780556, -1.072616, 1, 0, 0, 1, 1,
-0.1584038, 1.48413, 0.9827163, 1, 0, 0, 1, 1,
-0.1476342, 0.2515067, -0.2478192, 1, 0, 0, 1, 1,
-0.1470453, -0.02760963, -2.037446, 1, 0, 0, 1, 1,
-0.1462538, 0.2933521, 0.3619921, 0, 0, 0, 1, 1,
-0.1345183, 0.2380776, 0.4604773, 0, 0, 0, 1, 1,
-0.1274517, 0.4061706, -1.392003, 0, 0, 0, 1, 1,
-0.119941, 1.303299, 0.0982438, 0, 0, 0, 1, 1,
-0.1171064, 0.7318371, -0.7176094, 0, 0, 0, 1, 1,
-0.1119199, 0.2990938, 0.7187494, 0, 0, 0, 1, 1,
-0.1113475, -2.075915, -2.667535, 0, 0, 0, 1, 1,
-0.1064732, 0.2699402, -0.09402977, 1, 1, 1, 1, 1,
-0.1010035, -1.80192, -1.228709, 1, 1, 1, 1, 1,
-0.09946458, 3.504639, -2.147543, 1, 1, 1, 1, 1,
-0.08903071, 1.421597, 0.5912433, 1, 1, 1, 1, 1,
-0.08659412, -0.5568448, -4.3874, 1, 1, 1, 1, 1,
-0.08461736, 0.6924419, -1.724095, 1, 1, 1, 1, 1,
-0.08426576, -0.1575792, -2.682285, 1, 1, 1, 1, 1,
-0.08326506, -0.1347619, -1.782938, 1, 1, 1, 1, 1,
-0.07931478, -0.570215, -5.583084, 1, 1, 1, 1, 1,
-0.07853505, 1.160405, 0.4870952, 1, 1, 1, 1, 1,
-0.07418987, -0.7635876, -5.375032, 1, 1, 1, 1, 1,
-0.07351428, 0.1022933, -0.4117287, 1, 1, 1, 1, 1,
-0.07162622, 0.5331728, -1.318632, 1, 1, 1, 1, 1,
-0.06722067, -1.003344, -3.73429, 1, 1, 1, 1, 1,
-0.06673788, -0.8444928, -3.273618, 1, 1, 1, 1, 1,
-0.06672252, -1.002087, -3.29034, 0, 0, 1, 1, 1,
-0.06284022, 0.7490349, -0.3042734, 1, 0, 0, 1, 1,
-0.05823604, 1.690854, 0.6642712, 1, 0, 0, 1, 1,
-0.05753313, -1.27478, -3.147759, 1, 0, 0, 1, 1,
-0.04732301, 0.5742837, -0.06703515, 1, 0, 0, 1, 1,
-0.04204549, -0.2366255, -1.669608, 1, 0, 0, 1, 1,
-0.0404979, 0.8716819, 0.7252958, 0, 0, 0, 1, 1,
-0.03430437, 1.809438, 1.4048, 0, 0, 0, 1, 1,
-0.02674034, 0.9520274, -1.754577, 0, 0, 0, 1, 1,
-0.02646146, -1.010094, -2.671297, 0, 0, 0, 1, 1,
-0.02436267, 0.1560406, -0.1446626, 0, 0, 0, 1, 1,
-0.02073418, -2.230242, -4.061527, 0, 0, 0, 1, 1,
-0.01866634, 0.5521565, 0.3001058, 0, 0, 0, 1, 1,
-0.01781771, 0.8411681, -1.906629, 1, 1, 1, 1, 1,
-0.01588686, -0.5362324, -2.360607, 1, 1, 1, 1, 1,
-0.01304513, 0.4380058, -1.268221, 1, 1, 1, 1, 1,
-0.01095005, 0.9747296, 0.8026298, 1, 1, 1, 1, 1,
-0.01044937, -1.122829, -4.127536, 1, 1, 1, 1, 1,
-0.009994254, -0.02948727, -3.756818, 1, 1, 1, 1, 1,
-0.009303339, 0.7031081, -1.404694, 1, 1, 1, 1, 1,
-0.006203892, -1.510975, -3.198816, 1, 1, 1, 1, 1,
-0.003995578, 0.8701887, 0.3882234, 1, 1, 1, 1, 1,
-0.001576872, -1.204292, -5.513522, 1, 1, 1, 1, 1,
-0.0007110957, -0.6919376, -2.516861, 1, 1, 1, 1, 1,
0.0002770795, -0.6772324, 3.638753, 1, 1, 1, 1, 1,
0.00399624, 1.032903, 0.2047456, 1, 1, 1, 1, 1,
0.006791594, 0.9422517, 1.592731, 1, 1, 1, 1, 1,
0.007757719, -0.8742599, 2.609253, 1, 1, 1, 1, 1,
0.008025575, 2.654973, 0.02589753, 0, 0, 1, 1, 1,
0.01429187, 0.5497718, 0.4518102, 1, 0, 0, 1, 1,
0.01920552, 0.7069906, -0.5061359, 1, 0, 0, 1, 1,
0.02048844, 0.2832118, -0.5409632, 1, 0, 0, 1, 1,
0.02407624, -0.6446041, 3.688201, 1, 0, 0, 1, 1,
0.02751265, -0.09619092, 1.891287, 1, 0, 0, 1, 1,
0.0277924, -0.3848898, 3.868482, 0, 0, 0, 1, 1,
0.03131235, 2.223819, -2.114032, 0, 0, 0, 1, 1,
0.03194505, -1.358802, 2.859671, 0, 0, 0, 1, 1,
0.03203863, -0.9292573, 3.403564, 0, 0, 0, 1, 1,
0.03294286, 0.4363662, -0.0701694, 0, 0, 0, 1, 1,
0.03354727, -2.07327, 4.639192, 0, 0, 0, 1, 1,
0.03732455, -0.2347545, 2.675467, 0, 0, 0, 1, 1,
0.03990802, 0.3809495, -0.7260016, 1, 1, 1, 1, 1,
0.04013524, -0.787763, 1.816859, 1, 1, 1, 1, 1,
0.04078312, -1.299268, 0.6574458, 1, 1, 1, 1, 1,
0.04134881, 0.4090063, -0.359272, 1, 1, 1, 1, 1,
0.04830977, 0.05726715, 0.9189799, 1, 1, 1, 1, 1,
0.05216162, 0.3839428, -1.072024, 1, 1, 1, 1, 1,
0.05256368, -0.05721138, 2.489703, 1, 1, 1, 1, 1,
0.05339417, -0.1755159, 3.872298, 1, 1, 1, 1, 1,
0.05523055, 0.3538364, -1.006088, 1, 1, 1, 1, 1,
0.05766986, 0.6678213, -0.1636616, 1, 1, 1, 1, 1,
0.06012885, 0.1354161, -0.4094369, 1, 1, 1, 1, 1,
0.07038718, -0.253727, 3.765473, 1, 1, 1, 1, 1,
0.07335673, -0.8491848, 2.270464, 1, 1, 1, 1, 1,
0.07809725, 1.277575, 0.6391447, 1, 1, 1, 1, 1,
0.0794654, 1.273308, -0.5689801, 1, 1, 1, 1, 1,
0.0874632, -0.2885947, 1.686162, 0, 0, 1, 1, 1,
0.08897556, 0.6799009, 1.22059, 1, 0, 0, 1, 1,
0.08928418, -0.005796565, 1.840972, 1, 0, 0, 1, 1,
0.09322109, 0.2412456, -1.349117, 1, 0, 0, 1, 1,
0.09472468, -1.14766, 3.273318, 1, 0, 0, 1, 1,
0.09605764, 0.7177258, -1.542854, 1, 0, 0, 1, 1,
0.09841682, 0.7838584, -0.2106298, 0, 0, 0, 1, 1,
0.09962071, -1.058454, 3.589098, 0, 0, 0, 1, 1,
0.102225, 0.1088192, 1.249523, 0, 0, 0, 1, 1,
0.1053198, 0.5910397, 0.7443727, 0, 0, 0, 1, 1,
0.1104164, 0.02697732, 0.5555555, 0, 0, 0, 1, 1,
0.1111256, -0.6926187, 2.751087, 0, 0, 0, 1, 1,
0.1139762, 0.003088804, 2.067899, 0, 0, 0, 1, 1,
0.1167492, 0.4145041, -0.127207, 1, 1, 1, 1, 1,
0.1184978, 0.1026164, 1.069139, 1, 1, 1, 1, 1,
0.1247005, -0.002949235, 1.43538, 1, 1, 1, 1, 1,
0.1269916, -0.833863, 2.802527, 1, 1, 1, 1, 1,
0.128869, 0.4752209, -1.979524, 1, 1, 1, 1, 1,
0.1310273, -1.846782, 2.169584, 1, 1, 1, 1, 1,
0.1321776, 0.4004715, -0.3161406, 1, 1, 1, 1, 1,
0.1326223, 1.728497, 1.55281, 1, 1, 1, 1, 1,
0.1329913, -1.00092, 3.859031, 1, 1, 1, 1, 1,
0.1341678, 0.06297721, 0.5001616, 1, 1, 1, 1, 1,
0.1445926, -0.01651955, 0.6955879, 1, 1, 1, 1, 1,
0.1462465, 0.3112321, 0.5975844, 1, 1, 1, 1, 1,
0.1463706, 0.7648604, -0.3886012, 1, 1, 1, 1, 1,
0.1509778, -0.5490478, 4.444057, 1, 1, 1, 1, 1,
0.1516791, -0.2077457, 2.1515, 1, 1, 1, 1, 1,
0.1530702, -0.6332659, 2.123418, 0, 0, 1, 1, 1,
0.1585311, 0.056587, 0.3438849, 1, 0, 0, 1, 1,
0.1586877, 1.062884, 1.589726, 1, 0, 0, 1, 1,
0.15909, -1.12665, 3.271517, 1, 0, 0, 1, 1,
0.1667258, -1.104108, 2.409231, 1, 0, 0, 1, 1,
0.1688084, -0.9528544, 2.866066, 1, 0, 0, 1, 1,
0.1697081, 1.215525, 1.257019, 0, 0, 0, 1, 1,
0.1707522, 0.08005729, -0.8183347, 0, 0, 0, 1, 1,
0.1738206, 0.1557218, -1.290667, 0, 0, 0, 1, 1,
0.1760036, -0.1015486, 2.772198, 0, 0, 0, 1, 1,
0.1777925, -2.204779, 2.57861, 0, 0, 0, 1, 1,
0.177917, 0.02927315, 0.8380127, 0, 0, 0, 1, 1,
0.183653, 1.247476, -1.21305, 0, 0, 0, 1, 1,
0.184629, -0.7501393, 3.755754, 1, 1, 1, 1, 1,
0.1871467, 0.05765549, 1.424477, 1, 1, 1, 1, 1,
0.188334, -0.01398309, 1.26195, 1, 1, 1, 1, 1,
0.1885427, 0.5586973, 1.945103, 1, 1, 1, 1, 1,
0.1892474, 0.8883728, 1.44756, 1, 1, 1, 1, 1,
0.1918581, 2.231018, -0.4555666, 1, 1, 1, 1, 1,
0.1947583, 1.46237, 0.1414926, 1, 1, 1, 1, 1,
0.1955624, -0.3911585, 0.709976, 1, 1, 1, 1, 1,
0.197576, 1.370989, 0.4005003, 1, 1, 1, 1, 1,
0.198046, 0.08077005, 2.259359, 1, 1, 1, 1, 1,
0.1991729, 0.2431747, 1.189104, 1, 1, 1, 1, 1,
0.2029311, 0.1416198, 1.284814, 1, 1, 1, 1, 1,
0.2060792, -0.9431132, 5.054531, 1, 1, 1, 1, 1,
0.2060945, 1.101785, 1.832388, 1, 1, 1, 1, 1,
0.2065874, -1.838165, 3.186701, 1, 1, 1, 1, 1,
0.2080169, -0.7042624, 3.467451, 0, 0, 1, 1, 1,
0.2108241, -1.186392, 3.682358, 1, 0, 0, 1, 1,
0.2168299, 1.503433, 0.8026198, 1, 0, 0, 1, 1,
0.2171764, 0.0006566349, 1.659126, 1, 0, 0, 1, 1,
0.2181544, 0.8128995, -0.8078382, 1, 0, 0, 1, 1,
0.2190836, 0.811881, -0.1555619, 1, 0, 0, 1, 1,
0.2230019, -1.02278, 3.637459, 0, 0, 0, 1, 1,
0.2248639, -0.9258183, 3.097189, 0, 0, 0, 1, 1,
0.2261184, -1.32769, 2.798219, 0, 0, 0, 1, 1,
0.2294054, 0.4105771, -1.478014, 0, 0, 0, 1, 1,
0.2360732, -0.1695704, 1.909077, 0, 0, 0, 1, 1,
0.2414466, 0.607572, -0.629333, 0, 0, 0, 1, 1,
0.2436513, -0.8047557, 1.65069, 0, 0, 0, 1, 1,
0.2437693, -0.8318233, 2.301769, 1, 1, 1, 1, 1,
0.2492944, -0.01813279, 1.151375, 1, 1, 1, 1, 1,
0.2494723, 0.6033341, -0.3058315, 1, 1, 1, 1, 1,
0.2505624, -1.162327, 2.642717, 1, 1, 1, 1, 1,
0.2514139, 0.8304154, -0.2107189, 1, 1, 1, 1, 1,
0.2516158, -0.1529994, 3.315408, 1, 1, 1, 1, 1,
0.2539352, 0.1234288, 1.391011, 1, 1, 1, 1, 1,
0.2651501, -1.435409, 2.951292, 1, 1, 1, 1, 1,
0.2695592, 1.348652, -2.373348, 1, 1, 1, 1, 1,
0.27325, 0.03523097, 1.719122, 1, 1, 1, 1, 1,
0.2773339, -1.905826, 4.895471, 1, 1, 1, 1, 1,
0.2799641, 1.553125, -0.6646607, 1, 1, 1, 1, 1,
0.2814864, 0.2291775, -0.9800804, 1, 1, 1, 1, 1,
0.2829607, 0.1935946, 2.074822, 1, 1, 1, 1, 1,
0.2841706, 1.870004, 0.7890053, 1, 1, 1, 1, 1,
0.2859735, 0.3042918, 0.8936135, 0, 0, 1, 1, 1,
0.2883063, -0.8358495, 0.5234762, 1, 0, 0, 1, 1,
0.2916183, -1.266097, 1.392463, 1, 0, 0, 1, 1,
0.2926257, -0.5783998, 0.2309226, 1, 0, 0, 1, 1,
0.2927782, -0.4765965, 1.764936, 1, 0, 0, 1, 1,
0.2936528, -0.4813474, 2.126386, 1, 0, 0, 1, 1,
0.2952373, -0.6185886, 3.774206, 0, 0, 0, 1, 1,
0.2976508, -0.3304159, 2.996837, 0, 0, 0, 1, 1,
0.2980449, 1.301231, 1.332815, 0, 0, 0, 1, 1,
0.3029298, 0.1461505, 0.5683741, 0, 0, 0, 1, 1,
0.3030052, 0.4118704, -0.4030734, 0, 0, 0, 1, 1,
0.3069994, -0.2866221, 3.243251, 0, 0, 0, 1, 1,
0.312867, 0.9582304, 1.036435, 0, 0, 0, 1, 1,
0.3137734, 0.4834298, 0.3610044, 1, 1, 1, 1, 1,
0.3140903, 0.03805549, 2.160795, 1, 1, 1, 1, 1,
0.3146638, 0.1610318, 2.667008, 1, 1, 1, 1, 1,
0.3226895, -0.8853526, 3.035969, 1, 1, 1, 1, 1,
0.3247901, -0.1820183, 1.197994, 1, 1, 1, 1, 1,
0.3304517, -1.700433, 3.563553, 1, 1, 1, 1, 1,
0.3309392, -0.6634561, 3.168287, 1, 1, 1, 1, 1,
0.3362688, 0.6772594, -0.2206524, 1, 1, 1, 1, 1,
0.3386575, 0.02074537, 1.877966, 1, 1, 1, 1, 1,
0.3391693, 0.8903734, -0.3109144, 1, 1, 1, 1, 1,
0.3557765, -0.7511874, 0.7870228, 1, 1, 1, 1, 1,
0.358535, -1.17091, 3.939817, 1, 1, 1, 1, 1,
0.3590972, -0.08286172, 1.818106, 1, 1, 1, 1, 1,
0.3655744, 0.8622954, 0.07449642, 1, 1, 1, 1, 1,
0.3687225, 1.564284, 0.193867, 1, 1, 1, 1, 1,
0.373556, 0.07131296, -0.1356389, 0, 0, 1, 1, 1,
0.3739862, -0.4739603, 3.39499, 1, 0, 0, 1, 1,
0.375349, 0.4765722, 0.03100413, 1, 0, 0, 1, 1,
0.3756659, 0.3712516, 2.464168, 1, 0, 0, 1, 1,
0.3787375, 0.03690933, 1.117718, 1, 0, 0, 1, 1,
0.3879363, -0.389765, 1.026993, 1, 0, 0, 1, 1,
0.3893902, -1.032225, 3.111463, 0, 0, 0, 1, 1,
0.3905964, 0.2387166, 0.8896756, 0, 0, 0, 1, 1,
0.3907003, 0.3461353, 0.2447438, 0, 0, 0, 1, 1,
0.392085, -0.02180161, 0.2397932, 0, 0, 0, 1, 1,
0.3950444, -0.03440933, 0.4324151, 0, 0, 0, 1, 1,
0.3954627, -0.7434356, 3.075106, 0, 0, 0, 1, 1,
0.3986236, -0.5265341, 2.623957, 0, 0, 0, 1, 1,
0.4006482, 0.3717783, 0.4444939, 1, 1, 1, 1, 1,
0.4042609, 0.8094537, 1.331813, 1, 1, 1, 1, 1,
0.4114045, 0.5485703, -0.1344182, 1, 1, 1, 1, 1,
0.4120241, -0.8230699, 2.930207, 1, 1, 1, 1, 1,
0.4129207, 0.09846885, 2.151078, 1, 1, 1, 1, 1,
0.4186273, 0.9812796, 1.112496, 1, 1, 1, 1, 1,
0.4187843, 0.03373201, 2.549409, 1, 1, 1, 1, 1,
0.4195721, 1.510519, 1.517578, 1, 1, 1, 1, 1,
0.4218307, -1.906843, 3.074561, 1, 1, 1, 1, 1,
0.4227919, 0.08131941, 0.6340832, 1, 1, 1, 1, 1,
0.4231715, -1.400698, 0.7361459, 1, 1, 1, 1, 1,
0.4252391, 0.1306769, 0.9680498, 1, 1, 1, 1, 1,
0.4291096, -0.994633, 2.285492, 1, 1, 1, 1, 1,
0.4292884, 2.160201, 0.3590388, 1, 1, 1, 1, 1,
0.4303001, -0.8203718, 1.075489, 1, 1, 1, 1, 1,
0.4343613, 0.7761698, 0.302071, 0, 0, 1, 1, 1,
0.4348432, -0.7327854, 3.024203, 1, 0, 0, 1, 1,
0.4396767, 0.06121756, 0.579078, 1, 0, 0, 1, 1,
0.4404001, -0.9789332, 3.207846, 1, 0, 0, 1, 1,
0.4451681, 0.6746653, 1.104595, 1, 0, 0, 1, 1,
0.4515715, 0.9649459, 0.3937085, 1, 0, 0, 1, 1,
0.4567106, 0.2414701, 3.03885, 0, 0, 0, 1, 1,
0.4585238, -0.330553, 2.366302, 0, 0, 0, 1, 1,
0.4676762, 0.08254665, 2.554568, 0, 0, 0, 1, 1,
0.468329, -0.05313708, 0.8251584, 0, 0, 0, 1, 1,
0.4697774, -0.8778974, 1.364192, 0, 0, 0, 1, 1,
0.4700651, -0.2482344, 1.576987, 0, 0, 0, 1, 1,
0.470409, -0.2656484, 3.635754, 0, 0, 0, 1, 1,
0.4706202, -0.3304932, 3.953651, 1, 1, 1, 1, 1,
0.47847, 0.07143182, 3.348163, 1, 1, 1, 1, 1,
0.4810269, 0.1432555, -0.3730384, 1, 1, 1, 1, 1,
0.4843914, -0.6374744, 3.232836, 1, 1, 1, 1, 1,
0.4882128, -1.263352, 5.287467, 1, 1, 1, 1, 1,
0.4893053, -2.049441, 2.203732, 1, 1, 1, 1, 1,
0.4930954, -0.237126, 2.323188, 1, 1, 1, 1, 1,
0.4962587, 0.7415977, 1.081795, 1, 1, 1, 1, 1,
0.4993005, -0.3542796, 2.559985, 1, 1, 1, 1, 1,
0.4998295, -0.1356475, 2.203589, 1, 1, 1, 1, 1,
0.5087575, -0.07647828, 1.936561, 1, 1, 1, 1, 1,
0.5103357, -0.1681009, 3.35293, 1, 1, 1, 1, 1,
0.5165083, 1.883884, 1.132688, 1, 1, 1, 1, 1,
0.5165145, -0.9759827, 2.117642, 1, 1, 1, 1, 1,
0.5183313, 3.119739, -1.121245, 1, 1, 1, 1, 1,
0.5222377, -1.591503, 2.814553, 0, 0, 1, 1, 1,
0.5269701, 0.2734165, 0.1584699, 1, 0, 0, 1, 1,
0.5275353, 0.6602845, 0.5339394, 1, 0, 0, 1, 1,
0.5296811, 1.218284, 1.099826, 1, 0, 0, 1, 1,
0.530067, 0.1600864, 2.560838, 1, 0, 0, 1, 1,
0.5459704, 0.005667749, 1.320347, 1, 0, 0, 1, 1,
0.5462977, 0.04031739, 1.797331, 0, 0, 0, 1, 1,
0.5482153, -0.9287948, 1.677666, 0, 0, 0, 1, 1,
0.5504904, 0.119779, 1.429585, 0, 0, 0, 1, 1,
0.552108, 0.60807, 0.9560926, 0, 0, 0, 1, 1,
0.5560293, 0.9904007, -0.1454087, 0, 0, 0, 1, 1,
0.5627635, -1.356787, 2.102109, 0, 0, 0, 1, 1,
0.5698982, 1.188071, -0.4068113, 0, 0, 0, 1, 1,
0.5716758, 0.1486633, -0.5203645, 1, 1, 1, 1, 1,
0.5775327, 0.376772, 1.607021, 1, 1, 1, 1, 1,
0.5787801, -0.3061592, 2.561636, 1, 1, 1, 1, 1,
0.5809556, 0.1472432, -0.1140441, 1, 1, 1, 1, 1,
0.5846723, 0.6635826, -1.048736, 1, 1, 1, 1, 1,
0.5854721, 2.09212, 1.542454, 1, 1, 1, 1, 1,
0.5876354, -0.4178907, -0.2510616, 1, 1, 1, 1, 1,
0.5896334, 0.2683798, 0.236269, 1, 1, 1, 1, 1,
0.5898287, -0.4982237, 3.972278, 1, 1, 1, 1, 1,
0.5945522, -0.2429766, 2.953441, 1, 1, 1, 1, 1,
0.5959809, 0.1394775, 1.024093, 1, 1, 1, 1, 1,
0.5969889, -0.6310245, 1.767454, 1, 1, 1, 1, 1,
0.6009687, 1.044292, 0.7278285, 1, 1, 1, 1, 1,
0.6019798, -1.065444, 2.500344, 1, 1, 1, 1, 1,
0.6023908, -2.038937, 2.307582, 1, 1, 1, 1, 1,
0.6134914, -0.6321094, 1.373673, 0, 0, 1, 1, 1,
0.6135874, 0.9524494, 2.31775, 1, 0, 0, 1, 1,
0.6154504, 0.3401266, 2.11066, 1, 0, 0, 1, 1,
0.6179884, -0.1281282, 1.694708, 1, 0, 0, 1, 1,
0.6211242, -0.5690322, 3.026557, 1, 0, 0, 1, 1,
0.6221701, 0.8504142, 0.7205514, 1, 0, 0, 1, 1,
0.6244056, 0.6120238, -0.4350331, 0, 0, 0, 1, 1,
0.6246545, -0.03939674, 2.740312, 0, 0, 0, 1, 1,
0.6285304, -0.1707571, 1.916951, 0, 0, 0, 1, 1,
0.6288523, -0.3516702, 1.549481, 0, 0, 0, 1, 1,
0.631768, 0.4476459, 2.256804, 0, 0, 0, 1, 1,
0.6359764, -0.1845663, 4.123324, 0, 0, 0, 1, 1,
0.6363446, 0.9078284, -0.6372824, 0, 0, 0, 1, 1,
0.6373987, -0.8210363, 3.520074, 1, 1, 1, 1, 1,
0.6397871, 0.06069807, 1.773827, 1, 1, 1, 1, 1,
0.6397994, 1.746054, -0.8384075, 1, 1, 1, 1, 1,
0.6403288, 1.821628, -0.4367292, 1, 1, 1, 1, 1,
0.6441464, -0.4864494, 3.541249, 1, 1, 1, 1, 1,
0.6470679, 1.079271, 2.526821, 1, 1, 1, 1, 1,
0.6495972, -0.8376555, 0.09829859, 1, 1, 1, 1, 1,
0.6604623, 0.6355281, 2.353646, 1, 1, 1, 1, 1,
0.6635613, -1.280443, 2.884567, 1, 1, 1, 1, 1,
0.6698862, 0.783195, 0.1044669, 1, 1, 1, 1, 1,
0.6716999, -0.8208988, 3.682884, 1, 1, 1, 1, 1,
0.6722063, 0.9783306, -0.7528889, 1, 1, 1, 1, 1,
0.6787922, -0.779684, 3.078065, 1, 1, 1, 1, 1,
0.6803653, 0.9558489, 0.2310711, 1, 1, 1, 1, 1,
0.6819959, 0.3305624, -0.2752305, 1, 1, 1, 1, 1,
0.6844031, 0.5217922, -0.4351442, 0, 0, 1, 1, 1,
0.6848548, -0.8495916, 3.373629, 1, 0, 0, 1, 1,
0.6889141, -0.8521447, 2.409255, 1, 0, 0, 1, 1,
0.6938094, 0.1271945, 0.8371868, 1, 0, 0, 1, 1,
0.694221, 0.08710171, 2.185771, 1, 0, 0, 1, 1,
0.6944085, -1.529943, 2.756224, 1, 0, 0, 1, 1,
0.6983522, -0.2953781, 3.505169, 0, 0, 0, 1, 1,
0.7017888, -0.1964497, 3.961405, 0, 0, 0, 1, 1,
0.710198, -2.439849, 2.563834, 0, 0, 0, 1, 1,
0.7111349, 0.9900768, 0.6370672, 0, 0, 0, 1, 1,
0.7120174, -0.8483909, 2.687389, 0, 0, 0, 1, 1,
0.7127954, 0.8738471, 0.3740808, 0, 0, 0, 1, 1,
0.7168006, 1.841437, 1.047569, 0, 0, 0, 1, 1,
0.7222491, -0.2648391, 1.765174, 1, 1, 1, 1, 1,
0.7267515, 0.7784039, 0.4835732, 1, 1, 1, 1, 1,
0.7310979, 1.878442, -0.4193686, 1, 1, 1, 1, 1,
0.7312643, 0.6578094, 0.8143274, 1, 1, 1, 1, 1,
0.7429857, 0.3555728, 1.679889, 1, 1, 1, 1, 1,
0.7469555, 0.3339481, 0.5708169, 1, 1, 1, 1, 1,
0.7500311, 0.09074927, 3.176292, 1, 1, 1, 1, 1,
0.7505429, 1.270777, -0.3587644, 1, 1, 1, 1, 1,
0.7525786, 0.636304, 0.7578276, 1, 1, 1, 1, 1,
0.7537138, 1.234213, 1.004462, 1, 1, 1, 1, 1,
0.758101, 1.517033, -0.3272882, 1, 1, 1, 1, 1,
0.7656389, 1.707262, -0.9750225, 1, 1, 1, 1, 1,
0.7664293, 1.214108, -0.5918849, 1, 1, 1, 1, 1,
0.7696306, 1.8123, 1.224456, 1, 1, 1, 1, 1,
0.7727236, 0.8007609, 1.395574, 1, 1, 1, 1, 1,
0.7815245, 1.6928, 1.585529, 0, 0, 1, 1, 1,
0.7875227, -1.01126, 2.988283, 1, 0, 0, 1, 1,
0.7929485, -0.4365329, 1.927571, 1, 0, 0, 1, 1,
0.7938466, 0.7247396, -0.2359138, 1, 0, 0, 1, 1,
0.7961116, 0.05585773, 1.24097, 1, 0, 0, 1, 1,
0.8036293, 1.518236, -0.1533922, 1, 0, 0, 1, 1,
0.8108963, 0.389951, 1.911663, 0, 0, 0, 1, 1,
0.8167172, -0.6914978, 2.612609, 0, 0, 0, 1, 1,
0.8273713, -1.149881, 4.33487, 0, 0, 0, 1, 1,
0.838426, 1.370599, -0.2307135, 0, 0, 0, 1, 1,
0.8417268, 0.8318992, 1.163598, 0, 0, 0, 1, 1,
0.8445588, 0.4302794, 1.547863, 0, 0, 0, 1, 1,
0.8526797, 0.4673777, 0.6768253, 0, 0, 0, 1, 1,
0.8563832, 0.3190013, 0.91488, 1, 1, 1, 1, 1,
0.8624997, 0.479073, -0.3162396, 1, 1, 1, 1, 1,
0.8701136, 1.3514, 1.649878, 1, 1, 1, 1, 1,
0.873681, 0.2821431, 0.5862612, 1, 1, 1, 1, 1,
0.8744773, 0.9762729, 2.250726, 1, 1, 1, 1, 1,
0.8753067, -0.5389494, 1.175707, 1, 1, 1, 1, 1,
0.8826176, 0.2434823, 1.420207, 1, 1, 1, 1, 1,
0.883469, 0.7020291, 2.023735, 1, 1, 1, 1, 1,
0.8914952, -1.844802, 3.912154, 1, 1, 1, 1, 1,
0.9013017, -0.1790136, 2.34025, 1, 1, 1, 1, 1,
0.9069819, 0.6414387, 3.25793, 1, 1, 1, 1, 1,
0.9139969, 0.1380615, 0.3825917, 1, 1, 1, 1, 1,
0.9149706, 0.5411776, 0.6444476, 1, 1, 1, 1, 1,
0.9400132, -0.4413441, 1.317015, 1, 1, 1, 1, 1,
0.9403648, -0.7677456, 2.478896, 1, 1, 1, 1, 1,
0.9550248, 0.9350762, 1.459703, 0, 0, 1, 1, 1,
0.9711941, 0.7743853, 1.175023, 1, 0, 0, 1, 1,
0.9739451, -1.150053, 2.557179, 1, 0, 0, 1, 1,
0.979655, -1.136958, 3.323952, 1, 0, 0, 1, 1,
0.9799235, 3.158526, -1.053311, 1, 0, 0, 1, 1,
0.9839051, -1.124235, 2.17003, 1, 0, 0, 1, 1,
0.9876818, 0.03317154, 2.301738, 0, 0, 0, 1, 1,
0.9898467, 0.7428223, 0.7390233, 0, 0, 0, 1, 1,
0.9950411, 0.1273873, 1.188053, 0, 0, 0, 1, 1,
0.9952974, -1.318636, 3.900529, 0, 0, 0, 1, 1,
0.9970491, 0.7864384, -0.3582828, 0, 0, 0, 1, 1,
0.9981669, -0.9676707, 2.391443, 0, 0, 0, 1, 1,
1.003345, 0.1161941, 1.090415, 0, 0, 0, 1, 1,
1.005878, -0.6963711, 0.4053804, 1, 1, 1, 1, 1,
1.019785, 1.085379, 1.212467, 1, 1, 1, 1, 1,
1.026345, 1.022868, 2.193282, 1, 1, 1, 1, 1,
1.031265, 0.542119, 1.931952, 1, 1, 1, 1, 1,
1.043081, 1.414766, 0.8989091, 1, 1, 1, 1, 1,
1.047625, -1.191223, 1.556759, 1, 1, 1, 1, 1,
1.053066, -0.3149268, 1.835704, 1, 1, 1, 1, 1,
1.055787, 0.0430031, 1.05046, 1, 1, 1, 1, 1,
1.062237, 0.181979, 1.612933, 1, 1, 1, 1, 1,
1.064039, -0.08194498, 1.356851, 1, 1, 1, 1, 1,
1.06997, -1.436449, 2.523687, 1, 1, 1, 1, 1,
1.081157, -1.067598, 2.296954, 1, 1, 1, 1, 1,
1.082207, 1.25625, -0.2131735, 1, 1, 1, 1, 1,
1.082508, 0.9903227, 2.331464, 1, 1, 1, 1, 1,
1.086024, 0.005113962, 2.137617, 1, 1, 1, 1, 1,
1.092119, -0.3700427, 1.962298, 0, 0, 1, 1, 1,
1.101521, 1.091753, 0.9016137, 1, 0, 0, 1, 1,
1.102018, 0.2628277, 1.250287, 1, 0, 0, 1, 1,
1.106599, 1.151389, 2.802503, 1, 0, 0, 1, 1,
1.106744, -0.1304186, 1.852879, 1, 0, 0, 1, 1,
1.113855, -0.4823559, 3.138052, 1, 0, 0, 1, 1,
1.1199, -0.285115, 2.424909, 0, 0, 0, 1, 1,
1.121594, -1.118415, 2.4771, 0, 0, 0, 1, 1,
1.128167, -0.8588951, 2.028689, 0, 0, 0, 1, 1,
1.128295, -1.695366, 2.391366, 0, 0, 0, 1, 1,
1.129573, -1.43371, 4.539124, 0, 0, 0, 1, 1,
1.133393, -1.069195, 2.711003, 0, 0, 0, 1, 1,
1.13544, 1.074589, 0.7657941, 0, 0, 0, 1, 1,
1.144925, -0.8129648, 1.404364, 1, 1, 1, 1, 1,
1.148977, -1.730616, 2.591508, 1, 1, 1, 1, 1,
1.150164, 0.6110715, 2.24415, 1, 1, 1, 1, 1,
1.15606, 0.5524542, 1.54835, 1, 1, 1, 1, 1,
1.160679, 0.2498076, 1.530194, 1, 1, 1, 1, 1,
1.160711, 0.9023069, 1.832173, 1, 1, 1, 1, 1,
1.167565, -0.2061833, 2.13435, 1, 1, 1, 1, 1,
1.172385, 0.5009638, -0.7916708, 1, 1, 1, 1, 1,
1.175462, -0.2116662, 2.771733, 1, 1, 1, 1, 1,
1.182894, -0.3903631, 1.665104, 1, 1, 1, 1, 1,
1.188432, -1.551295, 1.944563, 1, 1, 1, 1, 1,
1.190557, 0.3500159, 2.277407, 1, 1, 1, 1, 1,
1.196422, 0.02611148, 1.121782, 1, 1, 1, 1, 1,
1.196805, -0.1524656, 1.363325, 1, 1, 1, 1, 1,
1.197852, 0.708487, 1.57853, 1, 1, 1, 1, 1,
1.20121, -1.76261, 1.920472, 0, 0, 1, 1, 1,
1.203912, -0.5770804, 0.2638182, 1, 0, 0, 1, 1,
1.206404, 0.7401387, 1.012988, 1, 0, 0, 1, 1,
1.206468, 2.272791, 1.538602, 1, 0, 0, 1, 1,
1.210562, 0.2547165, 3.119174, 1, 0, 0, 1, 1,
1.210588, 0.1206246, 1.654246, 1, 0, 0, 1, 1,
1.21459, 0.7553377, 0.07854569, 0, 0, 0, 1, 1,
1.216809, 1.482265, -0.5977913, 0, 0, 0, 1, 1,
1.22058, 0.5982952, 0.9399788, 0, 0, 0, 1, 1,
1.225547, -0.2786356, 1.644584, 0, 0, 0, 1, 1,
1.226715, 0.04449406, 2.412549, 0, 0, 0, 1, 1,
1.231383, -0.1405523, 1.951895, 0, 0, 0, 1, 1,
1.232089, -1.433983, 1.186057, 0, 0, 0, 1, 1,
1.237113, -0.8800783, 2.865445, 1, 1, 1, 1, 1,
1.241471, -0.4227082, 2.91187, 1, 1, 1, 1, 1,
1.24363, 1.238679, 0.104827, 1, 1, 1, 1, 1,
1.245491, -0.4996, 2.552057, 1, 1, 1, 1, 1,
1.25256, -0.8685958, 1.519773, 1, 1, 1, 1, 1,
1.25806, 1.992757, 1.979223, 1, 1, 1, 1, 1,
1.260546, -0.1032518, 2.061496, 1, 1, 1, 1, 1,
1.263543, -1.576977, 0.3341012, 1, 1, 1, 1, 1,
1.2681, 1.228687, 2.62397, 1, 1, 1, 1, 1,
1.268597, 0.1579123, 1.225844, 1, 1, 1, 1, 1,
1.271146, -0.5311089, 2.423267, 1, 1, 1, 1, 1,
1.281558, 1.428302, 1.665308, 1, 1, 1, 1, 1,
1.281638, -0.7103464, 2.554909, 1, 1, 1, 1, 1,
1.283893, -0.9529223, 3.569699, 1, 1, 1, 1, 1,
1.284939, 0.08811574, 1.165139, 1, 1, 1, 1, 1,
1.287285, -0.7157373, 1.69164, 0, 0, 1, 1, 1,
1.28845, 0.3281026, 1.954816, 1, 0, 0, 1, 1,
1.289949, 0.5987582, 0.8124713, 1, 0, 0, 1, 1,
1.291667, 1.386333, 3.766483, 1, 0, 0, 1, 1,
1.293689, -1.039063, 2.618375, 1, 0, 0, 1, 1,
1.315892, -0.2842657, 2.358495, 1, 0, 0, 1, 1,
1.319657, -0.543677, 1.338001, 0, 0, 0, 1, 1,
1.324754, 0.8611824, 2.044149, 0, 0, 0, 1, 1,
1.337909, 1.664978, 1.222997, 0, 0, 0, 1, 1,
1.345704, -1.638858, 2.499576, 0, 0, 0, 1, 1,
1.354536, -0.4829341, 0.5280731, 0, 0, 0, 1, 1,
1.356387, -0.3783299, 1.439182, 0, 0, 0, 1, 1,
1.36285, 0.7908341, 0.9355567, 0, 0, 0, 1, 1,
1.374016, 0.4448738, 1.892917, 1, 1, 1, 1, 1,
1.380132, -0.4663766, 3.887967, 1, 1, 1, 1, 1,
1.381225, 0.3493558, 2.107618, 1, 1, 1, 1, 1,
1.386126, 0.813563, 0.646393, 1, 1, 1, 1, 1,
1.390326, 0.3254821, 2.050252, 1, 1, 1, 1, 1,
1.392479, 1.519542, 0.7266147, 1, 1, 1, 1, 1,
1.393416, 0.6981128, 1.395085, 1, 1, 1, 1, 1,
1.398365, -1.00527, 0.9081504, 1, 1, 1, 1, 1,
1.40053, -0.3920842, 2.289952, 1, 1, 1, 1, 1,
1.403395, -0.164865, 2.170208, 1, 1, 1, 1, 1,
1.410124, 0.2739708, 1.091867, 1, 1, 1, 1, 1,
1.425163, 1.137402, 2.214721, 1, 1, 1, 1, 1,
1.435747, -1.436185, 1.981047, 1, 1, 1, 1, 1,
1.441141, 0.4335812, 2.224376, 1, 1, 1, 1, 1,
1.462172, 0.0391561, 3.063765, 1, 1, 1, 1, 1,
1.468924, -0.7304136, 2.394572, 0, 0, 1, 1, 1,
1.469509, -1.515954, 2.440243, 1, 0, 0, 1, 1,
1.474053, -0.7370896, 2.889705, 1, 0, 0, 1, 1,
1.476175, -0.2492245, 0.1035527, 1, 0, 0, 1, 1,
1.488859, 0.7849615, 0.6632758, 1, 0, 0, 1, 1,
1.489212, -0.2535536, 1.905832, 1, 0, 0, 1, 1,
1.489431, -1.910395, 3.531339, 0, 0, 0, 1, 1,
1.49211, -0.2878827, 2.412379, 0, 0, 0, 1, 1,
1.497613, 0.7003046, 0.5532715, 0, 0, 0, 1, 1,
1.49798, -0.3295773, 3.091306, 0, 0, 0, 1, 1,
1.502321, -1.353307, 0.6600286, 0, 0, 0, 1, 1,
1.503342, -0.5690821, 1.896201, 0, 0, 0, 1, 1,
1.509947, -0.1892747, 0.514345, 0, 0, 0, 1, 1,
1.52674, 0.9949741, 1.10436, 1, 1, 1, 1, 1,
1.526877, -0.09559567, 1.638371, 1, 1, 1, 1, 1,
1.529129, 1.219219, 0.5419762, 1, 1, 1, 1, 1,
1.534679, -3.135142, 1.142287, 1, 1, 1, 1, 1,
1.548705, -0.5909449, 0.8878457, 1, 1, 1, 1, 1,
1.555967, 0.4087856, 1.956484, 1, 1, 1, 1, 1,
1.56004, -0.1630145, 2.523199, 1, 1, 1, 1, 1,
1.561957, -0.7590204, 2.991773, 1, 1, 1, 1, 1,
1.562986, 0.7456847, 2.095971, 1, 1, 1, 1, 1,
1.572232, -0.4879009, 1.276275, 1, 1, 1, 1, 1,
1.583969, 1.815055, 0.8261905, 1, 1, 1, 1, 1,
1.610438, -0.8466666, 1.472519, 1, 1, 1, 1, 1,
1.658326, 0.3862957, 1.401497, 1, 1, 1, 1, 1,
1.666149, -0.4329482, 3.025113, 1, 1, 1, 1, 1,
1.674173, -0.2411994, 1.345843, 1, 1, 1, 1, 1,
1.693777, 0.00245632, 1.550761, 0, 0, 1, 1, 1,
1.697044, -1.304768, 0.5614824, 1, 0, 0, 1, 1,
1.707314, 0.2631199, 1.10857, 1, 0, 0, 1, 1,
1.711922, -0.9958622, 2.384128, 1, 0, 0, 1, 1,
1.724189, -0.1289371, 0.3829654, 1, 0, 0, 1, 1,
1.754347, 0.4644599, 0.927448, 1, 0, 0, 1, 1,
1.761934, 0.329002, -0.7148003, 0, 0, 0, 1, 1,
1.768031, 0.3425283, 0.7144543, 0, 0, 0, 1, 1,
1.770527, -1.657131, 2.077588, 0, 0, 0, 1, 1,
1.778464, 1.023595, 0.6316221, 0, 0, 0, 1, 1,
1.789467, -2.08317, 3.688023, 0, 0, 0, 1, 1,
1.815811, -0.5545117, 2.738973, 0, 0, 0, 1, 1,
1.836324, -0.5171109, 0.3693049, 0, 0, 0, 1, 1,
1.860604, 0.9336845, 0.942192, 1, 1, 1, 1, 1,
1.861468, -0.1738271, 1.769913, 1, 1, 1, 1, 1,
1.864644, -1.15088, 1.757508, 1, 1, 1, 1, 1,
1.872738, 0.8087505, 2.191881, 1, 1, 1, 1, 1,
1.881907, -0.08340181, 0.7891849, 1, 1, 1, 1, 1,
1.890792, 1.939927, -1.211577, 1, 1, 1, 1, 1,
1.932003, -1.50109, 3.489212, 1, 1, 1, 1, 1,
2.00254, -0.5432101, 1.690502, 1, 1, 1, 1, 1,
2.01117, 0.5325388, 1.561009, 1, 1, 1, 1, 1,
2.016236, 0.2620078, 1.868012, 1, 1, 1, 1, 1,
2.045385, 0.04426271, 1.78593, 1, 1, 1, 1, 1,
2.064718, 0.2729709, 0.02957257, 1, 1, 1, 1, 1,
2.084619, 1.148713, 0.616306, 1, 1, 1, 1, 1,
2.088578, -0.3285633, 2.882177, 1, 1, 1, 1, 1,
2.089951, -0.3839141, 1.10021, 1, 1, 1, 1, 1,
2.128572, 2.307049, -0.8188757, 0, 0, 1, 1, 1,
2.141955, -0.6771607, 1.081964, 1, 0, 0, 1, 1,
2.158323, -0.4740915, 1.204759, 1, 0, 0, 1, 1,
2.177696, -2.221232, 2.213584, 1, 0, 0, 1, 1,
2.179486, 1.014117, 2.047884, 1, 0, 0, 1, 1,
2.184744, -2.205754, 3.516453, 1, 0, 0, 1, 1,
2.23272, 0.05972388, 2.078801, 0, 0, 0, 1, 1,
2.371104, -0.1254666, 2.43212, 0, 0, 0, 1, 1,
2.411257, -0.8513361, 2.561655, 0, 0, 0, 1, 1,
2.416718, -0.7082454, 2.972787, 0, 0, 0, 1, 1,
2.460001, 0.5446779, 1.672095, 0, 0, 0, 1, 1,
2.471021, 0.2316411, 0.3652978, 0, 0, 0, 1, 1,
2.484684, -0.08662712, 2.271845, 0, 0, 0, 1, 1,
2.576178, 1.401035, 1.941699, 1, 1, 1, 1, 1,
2.601758, -0.5867896, 0.932015, 1, 1, 1, 1, 1,
2.66908, 0.04665412, 0.8308024, 1, 1, 1, 1, 1,
2.672656, -1.346642, 2.663319, 1, 1, 1, 1, 1,
2.838242, -0.09368222, 1.359438, 1, 1, 1, 1, 1,
2.852859, -0.7756656, 3.195057, 1, 1, 1, 1, 1,
3.184019, -0.6173699, 0.2072875, 1, 1, 1, 1, 1
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
var radius = 9.822218;
var distance = 34.50012;
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
mvMatrix.translate( -0.0132041, 0.06960869, 0.1478088 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50012);
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
