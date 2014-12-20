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
-3.196645, -0.2895642, -1.600624, 1, 0, 0, 1,
-2.971824, 1.336643, -1.954613, 1, 0.007843138, 0, 1,
-2.787133, 1.755195, -0.9907204, 1, 0.01176471, 0, 1,
-2.632172, -0.1250881, -0.6961432, 1, 0.01960784, 0, 1,
-2.598331, 1.051184, 0.0004742798, 1, 0.02352941, 0, 1,
-2.514926, 0.3090784, -0.43082, 1, 0.03137255, 0, 1,
-2.491585, -0.3259687, -2.14404, 1, 0.03529412, 0, 1,
-2.490642, 0.1091065, -1.042427, 1, 0.04313726, 0, 1,
-2.450566, 1.347324, -1.068275, 1, 0.04705882, 0, 1,
-2.412535, -1.052187, -2.622386, 1, 0.05490196, 0, 1,
-2.411438, -0.9434947, -1.017858, 1, 0.05882353, 0, 1,
-2.351542, -0.788785, -2.475434, 1, 0.06666667, 0, 1,
-2.351477, -1.012947, -0.7505194, 1, 0.07058824, 0, 1,
-2.323054, -0.8917862, -1.950487, 1, 0.07843138, 0, 1,
-2.286692, 1.859592, -1.898198, 1, 0.08235294, 0, 1,
-2.268583, 0.8070861, -1.869099, 1, 0.09019608, 0, 1,
-2.241951, 2.05958, -3.383006, 1, 0.09411765, 0, 1,
-2.22798, -0.05951275, -2.338629, 1, 0.1019608, 0, 1,
-2.125193, 0.5496853, -0.7763577, 1, 0.1098039, 0, 1,
-2.118512, -0.8904919, -3.517276, 1, 0.1137255, 0, 1,
-1.94773, -0.2983383, -2.584425, 1, 0.1215686, 0, 1,
-1.94003, -0.7081828, -2.706859, 1, 0.1254902, 0, 1,
-1.929861, -1.254808, -1.785007, 1, 0.1333333, 0, 1,
-1.92756, 1.06946, -0.9228761, 1, 0.1372549, 0, 1,
-1.879185, -0.9617853, -1.795738, 1, 0.145098, 0, 1,
-1.87012, -0.0876297, -1.20663, 1, 0.1490196, 0, 1,
-1.857567, -0.1697647, -1.781875, 1, 0.1568628, 0, 1,
-1.856861, 0.6749441, -2.180735, 1, 0.1607843, 0, 1,
-1.851447, -0.823189, -4.979686, 1, 0.1686275, 0, 1,
-1.850471, 1.09602, -0.2479795, 1, 0.172549, 0, 1,
-1.838356, -1.498462, -2.780271, 1, 0.1803922, 0, 1,
-1.801239, -1.180921, -3.347839, 1, 0.1843137, 0, 1,
-1.79501, -1.315352, -1.924477, 1, 0.1921569, 0, 1,
-1.762818, -0.8069808, -2.68528, 1, 0.1960784, 0, 1,
-1.75499, -0.5815303, -2.182497, 1, 0.2039216, 0, 1,
-1.748193, 0.5555854, -1.457294, 1, 0.2117647, 0, 1,
-1.73426, 1.360346, -2.330699, 1, 0.2156863, 0, 1,
-1.72942, 0.05392174, -1.538173, 1, 0.2235294, 0, 1,
-1.729411, 0.2645279, -1.065987, 1, 0.227451, 0, 1,
-1.716703, -0.1719285, -2.694333, 1, 0.2352941, 0, 1,
-1.716513, -1.332076, -3.773785, 1, 0.2392157, 0, 1,
-1.712489, -1.174898, -2.303381, 1, 0.2470588, 0, 1,
-1.697296, -0.8481715, -2.371792, 1, 0.2509804, 0, 1,
-1.68452, -1.697469, -2.027785, 1, 0.2588235, 0, 1,
-1.668292, -0.5683333, -1.169433, 1, 0.2627451, 0, 1,
-1.667457, -0.1724871, -1.182829, 1, 0.2705882, 0, 1,
-1.663565, -0.3314703, -0.3007606, 1, 0.2745098, 0, 1,
-1.661798, -1.139951, -1.979141, 1, 0.282353, 0, 1,
-1.624402, 1.392064, 1.116299, 1, 0.2862745, 0, 1,
-1.590298, 1.474514, -0.01727006, 1, 0.2941177, 0, 1,
-1.582932, 0.1745405, -0.1402467, 1, 0.3019608, 0, 1,
-1.576874, -0.7357638, -0.1911185, 1, 0.3058824, 0, 1,
-1.568784, 1.230555, 0.431427, 1, 0.3137255, 0, 1,
-1.563309, 0.7564948, -0.1993458, 1, 0.3176471, 0, 1,
-1.56113, -1.976393, -1.906808, 1, 0.3254902, 0, 1,
-1.551633, 0.6809279, -0.6168472, 1, 0.3294118, 0, 1,
-1.549666, 0.0006178573, -1.819323, 1, 0.3372549, 0, 1,
-1.536495, 0.2412793, -0.1621369, 1, 0.3411765, 0, 1,
-1.52783, -2.589991, -2.881892, 1, 0.3490196, 0, 1,
-1.526373, -0.6479427, -2.373219, 1, 0.3529412, 0, 1,
-1.51259, -0.1359576, -1.694472, 1, 0.3607843, 0, 1,
-1.505627, -0.5151254, -2.573864, 1, 0.3647059, 0, 1,
-1.505117, 1.339672, -0.8755003, 1, 0.372549, 0, 1,
-1.495294, -0.02730857, -2.687566, 1, 0.3764706, 0, 1,
-1.489131, -1.605132, -2.926691, 1, 0.3843137, 0, 1,
-1.488251, 0.4522403, 0.03902377, 1, 0.3882353, 0, 1,
-1.484083, -0.01578479, -0.4385231, 1, 0.3960784, 0, 1,
-1.480816, -0.309206, -0.3040076, 1, 0.4039216, 0, 1,
-1.475768, 0.6629687, -0.6219404, 1, 0.4078431, 0, 1,
-1.473156, -1.574741, -3.776691, 1, 0.4156863, 0, 1,
-1.462034, -1.086272, -0.990097, 1, 0.4196078, 0, 1,
-1.46091, 0.6012937, 0.1387438, 1, 0.427451, 0, 1,
-1.45111, -1.504365, -2.28781, 1, 0.4313726, 0, 1,
-1.441204, 0.2389765, -0.5977777, 1, 0.4392157, 0, 1,
-1.440633, 1.461092, -0.9920733, 1, 0.4431373, 0, 1,
-1.424969, 0.5265895, 0.7072978, 1, 0.4509804, 0, 1,
-1.422097, -0.9347548, -2.073521, 1, 0.454902, 0, 1,
-1.409708, 0.004952297, -1.014702, 1, 0.4627451, 0, 1,
-1.408759, 0.7019696, 0.841475, 1, 0.4666667, 0, 1,
-1.407108, 1.986397, -1.043573, 1, 0.4745098, 0, 1,
-1.395209, -0.7726133, -1.911372, 1, 0.4784314, 0, 1,
-1.388195, 1.06501, 0.2582505, 1, 0.4862745, 0, 1,
-1.382193, 1.834282, -2.449305, 1, 0.4901961, 0, 1,
-1.381395, -0.05155667, -3.6147, 1, 0.4980392, 0, 1,
-1.365868, -0.1597972, -3.239109, 1, 0.5058824, 0, 1,
-1.363465, -0.3725038, -1.976156, 1, 0.509804, 0, 1,
-1.341462, -0.005755985, -2.109434, 1, 0.5176471, 0, 1,
-1.334498, 1.373896, -0.9439316, 1, 0.5215687, 0, 1,
-1.324143, -0.4765533, -2.527834, 1, 0.5294118, 0, 1,
-1.315768, -0.2226058, -0.43021, 1, 0.5333334, 0, 1,
-1.314393, 0.02864732, -0.7173873, 1, 0.5411765, 0, 1,
-1.306822, -0.733458, -0.4003988, 1, 0.5450981, 0, 1,
-1.304554, 0.583228, -2.062986, 1, 0.5529412, 0, 1,
-1.299903, 1.368593, -0.3715635, 1, 0.5568628, 0, 1,
-1.291474, 0.6358165, -1.453742, 1, 0.5647059, 0, 1,
-1.288139, -0.2678503, -1.923514, 1, 0.5686275, 0, 1,
-1.28535, 2.022948, 1.782313, 1, 0.5764706, 0, 1,
-1.284708, -1.749071, -2.254107, 1, 0.5803922, 0, 1,
-1.284595, -0.3058562, -0.9082409, 1, 0.5882353, 0, 1,
-1.283069, -0.9876, -2.724959, 1, 0.5921569, 0, 1,
-1.273345, -0.7816339, -1.761764, 1, 0.6, 0, 1,
-1.271624, -1.273741, -1.525926, 1, 0.6078432, 0, 1,
-1.244585, -1.631267, -0.7258608, 1, 0.6117647, 0, 1,
-1.242371, -0.5174872, -1.435709, 1, 0.6196079, 0, 1,
-1.241801, -1.088389, -2.890779, 1, 0.6235294, 0, 1,
-1.235234, -0.01117179, -1.281604, 1, 0.6313726, 0, 1,
-1.226064, 0.81932, -1.21889, 1, 0.6352941, 0, 1,
-1.219969, 0.710476, -1.326177, 1, 0.6431373, 0, 1,
-1.205541, 0.8399362, -1.194258, 1, 0.6470588, 0, 1,
-1.199138, -0.5742912, -0.6900334, 1, 0.654902, 0, 1,
-1.193522, -1.298288, -1.750908, 1, 0.6588235, 0, 1,
-1.192917, 0.3498807, -2.583883, 1, 0.6666667, 0, 1,
-1.192802, -1.990754, -2.954849, 1, 0.6705883, 0, 1,
-1.191637, 1.847793, -0.6457531, 1, 0.6784314, 0, 1,
-1.18961, 0.9746022, -2.672179, 1, 0.682353, 0, 1,
-1.188279, -0.164562, -1.072832, 1, 0.6901961, 0, 1,
-1.188065, 1.208619, -1.926516, 1, 0.6941177, 0, 1,
-1.18314, -0.602012, -2.498441, 1, 0.7019608, 0, 1,
-1.18024, -0.03149216, -3.704602, 1, 0.7098039, 0, 1,
-1.180161, 1.086555, -0.6137729, 1, 0.7137255, 0, 1,
-1.178618, -0.5819969, -1.246166, 1, 0.7215686, 0, 1,
-1.177475, -0.1585146, -2.369995, 1, 0.7254902, 0, 1,
-1.175379, -0.1069698, 0.157215, 1, 0.7333333, 0, 1,
-1.173187, 1.280496, -1.749836, 1, 0.7372549, 0, 1,
-1.173005, -0.7514257, -1.25963, 1, 0.7450981, 0, 1,
-1.16636, 1.150477, -0.3524684, 1, 0.7490196, 0, 1,
-1.164174, -0.7317551, -1.043755, 1, 0.7568628, 0, 1,
-1.145935, -0.5208157, -0.09771519, 1, 0.7607843, 0, 1,
-1.144829, -0.5888245, -0.7013788, 1, 0.7686275, 0, 1,
-1.143774, -2.200901, -2.227443, 1, 0.772549, 0, 1,
-1.128532, 0.2557575, -3.461539, 1, 0.7803922, 0, 1,
-1.113348, -1.540249, -2.607767, 1, 0.7843137, 0, 1,
-1.105879, -0.5472522, -3.110574, 1, 0.7921569, 0, 1,
-1.102154, 1.498372, -1.390714, 1, 0.7960784, 0, 1,
-1.099901, 1.488489, -0.7015373, 1, 0.8039216, 0, 1,
-1.099415, -1.545437, -2.821434, 1, 0.8117647, 0, 1,
-1.099147, 0.4613151, -1.089461, 1, 0.8156863, 0, 1,
-1.099045, -0.2002811, -3.665733, 1, 0.8235294, 0, 1,
-1.098723, 0.9084778, 1.885845, 1, 0.827451, 0, 1,
-1.088005, 1.067182, -1.80503, 1, 0.8352941, 0, 1,
-1.075969, -0.2387526, -0.9730745, 1, 0.8392157, 0, 1,
-1.07415, 1.54137, 0.4174603, 1, 0.8470588, 0, 1,
-1.071176, -0.1880533, -1.907044, 1, 0.8509804, 0, 1,
-1.060893, -1.711422, -3.003199, 1, 0.8588235, 0, 1,
-1.056008, 0.4200156, -1.340056, 1, 0.8627451, 0, 1,
-1.052345, 1.225212, -0.8283373, 1, 0.8705882, 0, 1,
-1.044377, -0.8159883, -1.700012, 1, 0.8745098, 0, 1,
-1.042086, 0.0432054, -0.8004317, 1, 0.8823529, 0, 1,
-1.036549, 1.003664, -2.011786, 1, 0.8862745, 0, 1,
-1.033479, 0.6764712, -0.5922686, 1, 0.8941177, 0, 1,
-1.032558, -0.03171765, -1.108377, 1, 0.8980392, 0, 1,
-1.02742, 0.0185767, -1.906366, 1, 0.9058824, 0, 1,
-1.022685, 1.445803, -0.06022065, 1, 0.9137255, 0, 1,
-1.012231, -0.1588933, -2.205486, 1, 0.9176471, 0, 1,
-0.9988043, 1.657107, -1.968662, 1, 0.9254902, 0, 1,
-0.9966252, 1.195763, -1.153375, 1, 0.9294118, 0, 1,
-0.9885231, -1.34796, -2.790753, 1, 0.9372549, 0, 1,
-0.9861761, -0.4351436, -1.185784, 1, 0.9411765, 0, 1,
-0.9817203, 1.665081, 0.6798843, 1, 0.9490196, 0, 1,
-0.973345, -0.9115604, -3.507726, 1, 0.9529412, 0, 1,
-0.9629978, -0.8588073, -2.568323, 1, 0.9607843, 0, 1,
-0.9542611, -0.2817742, -3.56713, 1, 0.9647059, 0, 1,
-0.9514914, 0.9938474, 0.2918524, 1, 0.972549, 0, 1,
-0.9494426, -0.4292376, -2.475909, 1, 0.9764706, 0, 1,
-0.948673, 1.125153, -2.56935, 1, 0.9843137, 0, 1,
-0.9477184, 1.11323, -1.488687, 1, 0.9882353, 0, 1,
-0.9455467, -0.9095154, -3.536556, 1, 0.9960784, 0, 1,
-0.9390659, 0.7238339, -0.005563625, 0.9960784, 1, 0, 1,
-0.9304562, 1.095484, 0.3460912, 0.9921569, 1, 0, 1,
-0.9131245, -0.1677562, -2.163329, 0.9843137, 1, 0, 1,
-0.9131027, -0.2583967, -1.599972, 0.9803922, 1, 0, 1,
-0.9040956, -0.4816436, -1.328531, 0.972549, 1, 0, 1,
-0.9032523, -0.6039643, -1.789859, 0.9686275, 1, 0, 1,
-0.9028941, -0.3386966, -2.463276, 0.9607843, 1, 0, 1,
-0.902673, 0.03799229, -1.453574, 0.9568627, 1, 0, 1,
-0.8886969, 0.1667334, -2.084085, 0.9490196, 1, 0, 1,
-0.8828381, -0.7078295, -0.5319498, 0.945098, 1, 0, 1,
-0.8624941, 0.7344853, -0.5573707, 0.9372549, 1, 0, 1,
-0.8538594, -0.4375719, -2.427907, 0.9333333, 1, 0, 1,
-0.853397, 1.652002, -1.547699, 0.9254902, 1, 0, 1,
-0.8504045, 1.08155, 1.633885, 0.9215686, 1, 0, 1,
-0.8484793, -0.2477513, -2.342082, 0.9137255, 1, 0, 1,
-0.8388863, 0.4305745, 0.363205, 0.9098039, 1, 0, 1,
-0.8386024, 0.4754826, -1.938794, 0.9019608, 1, 0, 1,
-0.8358928, 0.8548606, -0.886538, 0.8941177, 1, 0, 1,
-0.8350797, -0.5620317, -2.23932, 0.8901961, 1, 0, 1,
-0.8305137, -0.9797528, -2.669603, 0.8823529, 1, 0, 1,
-0.8261341, -0.1775517, -0.6376247, 0.8784314, 1, 0, 1,
-0.8203593, 0.4822353, -1.022007, 0.8705882, 1, 0, 1,
-0.8155296, -0.007556486, -1.647094, 0.8666667, 1, 0, 1,
-0.8153538, 0.8460284, -0.09429616, 0.8588235, 1, 0, 1,
-0.8152194, 1.660822, 1.172507, 0.854902, 1, 0, 1,
-0.8142005, 2.013542, -0.4346839, 0.8470588, 1, 0, 1,
-0.8127632, 0.0142631, -2.014967, 0.8431373, 1, 0, 1,
-0.8125066, 0.01243421, -1.962112, 0.8352941, 1, 0, 1,
-0.8103081, 0.02136095, -1.63901, 0.8313726, 1, 0, 1,
-0.805185, -0.9732231, -1.848076, 0.8235294, 1, 0, 1,
-0.8042337, -0.7929491, -2.188729, 0.8196079, 1, 0, 1,
-0.8018456, 1.438676, -1.132065, 0.8117647, 1, 0, 1,
-0.7965937, -2.270571, -2.095122, 0.8078431, 1, 0, 1,
-0.7920006, -0.6921348, -1.568861, 0.8, 1, 0, 1,
-0.7908874, -0.1970374, -2.566083, 0.7921569, 1, 0, 1,
-0.7858528, 1.983325, 0.7108375, 0.7882353, 1, 0, 1,
-0.7739881, 1.52629, -1.081061, 0.7803922, 1, 0, 1,
-0.7732109, 0.4452705, -0.1838304, 0.7764706, 1, 0, 1,
-0.7722825, -2.262191, -3.164509, 0.7686275, 1, 0, 1,
-0.771814, -0.09421442, -2.009611, 0.7647059, 1, 0, 1,
-0.7680898, 0.03572338, -0.1225006, 0.7568628, 1, 0, 1,
-0.7661266, -0.1348997, -1.463374, 0.7529412, 1, 0, 1,
-0.765321, -0.6148829, -3.280877, 0.7450981, 1, 0, 1,
-0.7598407, -0.301745, -0.9525818, 0.7411765, 1, 0, 1,
-0.7591121, 0.1255161, -1.709736, 0.7333333, 1, 0, 1,
-0.7563064, 0.2473205, 0.4378332, 0.7294118, 1, 0, 1,
-0.7503256, -0.1688437, -1.83398, 0.7215686, 1, 0, 1,
-0.746133, 0.6995838, -0.01027406, 0.7176471, 1, 0, 1,
-0.7459602, -0.4262502, -3.92758, 0.7098039, 1, 0, 1,
-0.7456606, -1.887444, -3.296953, 0.7058824, 1, 0, 1,
-0.7393057, 0.09152186, -1.769948, 0.6980392, 1, 0, 1,
-0.7335176, -0.818846, -3.711847, 0.6901961, 1, 0, 1,
-0.7238294, 0.3899876, -0.1815759, 0.6862745, 1, 0, 1,
-0.7203655, -0.3188314, -3.123817, 0.6784314, 1, 0, 1,
-0.7194383, -1.355219, -2.09808, 0.6745098, 1, 0, 1,
-0.7147835, -0.8412042, -5.132986, 0.6666667, 1, 0, 1,
-0.7119215, 0.8567737, 0.482598, 0.6627451, 1, 0, 1,
-0.7099587, 0.5350248, -0.2808205, 0.654902, 1, 0, 1,
-0.7067651, -1.39885, -2.422361, 0.6509804, 1, 0, 1,
-0.6971402, -1.426203, -1.370265, 0.6431373, 1, 0, 1,
-0.6959592, 0.3666269, -1.851992, 0.6392157, 1, 0, 1,
-0.6925695, 0.03421305, -0.6873985, 0.6313726, 1, 0, 1,
-0.69082, -0.3055716, -1.691697, 0.627451, 1, 0, 1,
-0.6904691, 0.8441963, -3.92916, 0.6196079, 1, 0, 1,
-0.6893573, -0.9080727, -2.743789, 0.6156863, 1, 0, 1,
-0.6888763, -0.2557828, -2.674885, 0.6078432, 1, 0, 1,
-0.6838061, -1.598009, -2.109914, 0.6039216, 1, 0, 1,
-0.6820185, 0.3995824, -0.7114644, 0.5960785, 1, 0, 1,
-0.6788698, -1.451021, -4.74383, 0.5882353, 1, 0, 1,
-0.6778835, 0.7320176, 1.166438, 0.5843138, 1, 0, 1,
-0.677869, -0.9179826, -1.734204, 0.5764706, 1, 0, 1,
-0.6764172, -0.6357533, -1.997072, 0.572549, 1, 0, 1,
-0.6738561, 0.5892771, 0.7713839, 0.5647059, 1, 0, 1,
-0.6733702, 0.06938545, -0.7927921, 0.5607843, 1, 0, 1,
-0.6726894, 0.5357286, -1.221303, 0.5529412, 1, 0, 1,
-0.6723596, -1.364128, -3.648683, 0.5490196, 1, 0, 1,
-0.6651688, 0.01184979, -1.300558, 0.5411765, 1, 0, 1,
-0.662994, 0.04228794, -3.267284, 0.5372549, 1, 0, 1,
-0.6504176, -0.5475926, -2.208225, 0.5294118, 1, 0, 1,
-0.6466632, -0.5923661, -2.345182, 0.5254902, 1, 0, 1,
-0.6456444, -1.66838, -1.76631, 0.5176471, 1, 0, 1,
-0.641422, -1.88829, -2.723068, 0.5137255, 1, 0, 1,
-0.6327511, -1.160613, -2.547797, 0.5058824, 1, 0, 1,
-0.630846, -0.2097438, 0.02851046, 0.5019608, 1, 0, 1,
-0.6272325, 0.1839649, -0.6482226, 0.4941176, 1, 0, 1,
-0.6266508, -1.13932, -4.739286, 0.4862745, 1, 0, 1,
-0.6253918, 0.2095503, -0.06981827, 0.4823529, 1, 0, 1,
-0.6252327, -0.4085127, -2.887194, 0.4745098, 1, 0, 1,
-0.6230679, -0.2655618, -2.58823, 0.4705882, 1, 0, 1,
-0.6209166, 1.389926, -0.9698111, 0.4627451, 1, 0, 1,
-0.6134554, 0.7423658, -0.08903682, 0.4588235, 1, 0, 1,
-0.6130078, 0.000917977, -0.7693996, 0.4509804, 1, 0, 1,
-0.6097187, 0.4936791, -2.083957, 0.4470588, 1, 0, 1,
-0.6062372, 0.2762955, -0.6555744, 0.4392157, 1, 0, 1,
-0.6020935, 1.040712, 0.7796167, 0.4352941, 1, 0, 1,
-0.6018823, -1.330504, -3.741136, 0.427451, 1, 0, 1,
-0.5987386, -0.7254494, -2.749091, 0.4235294, 1, 0, 1,
-0.5950231, -0.4985995, -3.427574, 0.4156863, 1, 0, 1,
-0.5939199, -0.1832126, -2.769481, 0.4117647, 1, 0, 1,
-0.5929753, 1.227606, 1.621251, 0.4039216, 1, 0, 1,
-0.5924241, -0.6718276, -3.494225, 0.3960784, 1, 0, 1,
-0.5825908, 0.06127674, -3.843665, 0.3921569, 1, 0, 1,
-0.5816516, 0.8614699, -0.5554778, 0.3843137, 1, 0, 1,
-0.5797653, -2.525304, -3.528751, 0.3803922, 1, 0, 1,
-0.5785321, 0.4254184, -0.1150257, 0.372549, 1, 0, 1,
-0.5766138, 0.3183999, -0.4334074, 0.3686275, 1, 0, 1,
-0.5748557, 0.6047558, -0.869178, 0.3607843, 1, 0, 1,
-0.5719733, 0.5479597, -1.171179, 0.3568628, 1, 0, 1,
-0.5712076, -0.9039999, -3.454086, 0.3490196, 1, 0, 1,
-0.5698347, -0.002597533, -0.3888089, 0.345098, 1, 0, 1,
-0.5542256, -0.7196679, -2.701256, 0.3372549, 1, 0, 1,
-0.5516693, 0.5316661, -0.9664416, 0.3333333, 1, 0, 1,
-0.5427339, -0.267563, -1.593688, 0.3254902, 1, 0, 1,
-0.5420557, 1.477861, -0.4512525, 0.3215686, 1, 0, 1,
-0.5415247, 0.02614251, -2.441481, 0.3137255, 1, 0, 1,
-0.5414281, -0.9986966, -3.15907, 0.3098039, 1, 0, 1,
-0.5311283, -1.195629, -1.682326, 0.3019608, 1, 0, 1,
-0.527083, -0.1110009, -0.7181315, 0.2941177, 1, 0, 1,
-0.5250134, -0.1183858, -2.13225, 0.2901961, 1, 0, 1,
-0.5223703, 0.2646515, 0.007381462, 0.282353, 1, 0, 1,
-0.515851, -0.9955232, -4.277268, 0.2784314, 1, 0, 1,
-0.5134112, 1.236353, -0.6829401, 0.2705882, 1, 0, 1,
-0.5011682, -0.2099538, -2.325736, 0.2666667, 1, 0, 1,
-0.4895366, -1.126091, -3.219873, 0.2588235, 1, 0, 1,
-0.4853339, 1.185371, 0.5289943, 0.254902, 1, 0, 1,
-0.4839025, 0.6866927, -1.441973, 0.2470588, 1, 0, 1,
-0.4837043, -0.8956598, -2.939788, 0.2431373, 1, 0, 1,
-0.4834481, 2.070758, 0.2863959, 0.2352941, 1, 0, 1,
-0.4809969, -0.3889974, -2.229106, 0.2313726, 1, 0, 1,
-0.4782639, -0.6726319, -1.9286, 0.2235294, 1, 0, 1,
-0.4781588, 0.7457921, 0.4610499, 0.2196078, 1, 0, 1,
-0.4774391, -0.4066485, -1.347803, 0.2117647, 1, 0, 1,
-0.4756483, -1.148902, -1.770823, 0.2078431, 1, 0, 1,
-0.4748688, 0.9498882, 0.173543, 0.2, 1, 0, 1,
-0.4702134, -1.243799, -1.532536, 0.1921569, 1, 0, 1,
-0.469687, -1.315444, -1.947311, 0.1882353, 1, 0, 1,
-0.4696676, 0.9037433, 0.3337045, 0.1803922, 1, 0, 1,
-0.4682998, -0.7397071, -3.276493, 0.1764706, 1, 0, 1,
-0.4674942, 0.5956323, 0.04257613, 0.1686275, 1, 0, 1,
-0.4660985, -0.284209, -1.096155, 0.1647059, 1, 0, 1,
-0.464476, -0.7088928, -2.36666, 0.1568628, 1, 0, 1,
-0.4592172, 1.848365, -0.9322869, 0.1529412, 1, 0, 1,
-0.4550968, -0.229571, -2.394929, 0.145098, 1, 0, 1,
-0.4535106, 0.05609993, 0.2508603, 0.1411765, 1, 0, 1,
-0.4510596, -1.205961, -1.941429, 0.1333333, 1, 0, 1,
-0.4484891, -0.926462, -3.436466, 0.1294118, 1, 0, 1,
-0.4472444, 1.340717, -0.6807739, 0.1215686, 1, 0, 1,
-0.445006, -1.845124, -6.425119, 0.1176471, 1, 0, 1,
-0.4443385, 1.149687, -1.663794, 0.1098039, 1, 0, 1,
-0.4426616, -0.3310182, -4.072706, 0.1058824, 1, 0, 1,
-0.4391496, 1.676939, 0.5387826, 0.09803922, 1, 0, 1,
-0.4381347, -1.011537, -1.325742, 0.09019608, 1, 0, 1,
-0.4356108, 0.4944161, -1.496252, 0.08627451, 1, 0, 1,
-0.4325099, -0.2492661, -1.189745, 0.07843138, 1, 0, 1,
-0.4320138, -1.056974, -2.958279, 0.07450981, 1, 0, 1,
-0.4294365, -1.239567, -1.908017, 0.06666667, 1, 0, 1,
-0.4294243, -0.5202093, -4.257679, 0.0627451, 1, 0, 1,
-0.4255014, -0.4602421, -2.084084, 0.05490196, 1, 0, 1,
-0.4189763, -0.197955, -1.315351, 0.05098039, 1, 0, 1,
-0.4170776, -0.08956395, -2.176028, 0.04313726, 1, 0, 1,
-0.4157855, 0.9468941, -0.1592638, 0.03921569, 1, 0, 1,
-0.4132228, -0.1022492, -2.211282, 0.03137255, 1, 0, 1,
-0.4122203, 2.304775, -1.108852, 0.02745098, 1, 0, 1,
-0.4116831, 0.2040246, -1.334111, 0.01960784, 1, 0, 1,
-0.4113287, 0.1414979, -0.7808364, 0.01568628, 1, 0, 1,
-0.4055023, 1.863109, -0.7444956, 0.007843138, 1, 0, 1,
-0.4046272, -0.8135516, -1.915123, 0.003921569, 1, 0, 1,
-0.4026558, -2.348921, -2.768099, 0, 1, 0.003921569, 1,
-0.4011753, -1.100388, -3.259688, 0, 1, 0.01176471, 1,
-0.3919299, 0.7543878, 0.08267614, 0, 1, 0.01568628, 1,
-0.3908367, -0.1316186, -1.571885, 0, 1, 0.02352941, 1,
-0.3901495, -0.3145596, -3.615759, 0, 1, 0.02745098, 1,
-0.3834459, -1.516328, -2.384765, 0, 1, 0.03529412, 1,
-0.3817726, 1.286521, -0.1518677, 0, 1, 0.03921569, 1,
-0.3798376, 2.276912, -0.4657056, 0, 1, 0.04705882, 1,
-0.3777438, -0.4074106, -2.441984, 0, 1, 0.05098039, 1,
-0.3771378, 0.4747855, -2.079865, 0, 1, 0.05882353, 1,
-0.3749304, 0.4799271, -0.6349782, 0, 1, 0.0627451, 1,
-0.3737945, 0.5728297, -0.9935497, 0, 1, 0.07058824, 1,
-0.3737289, 0.6316345, -1.407864, 0, 1, 0.07450981, 1,
-0.3716485, -1.243899, -4.707098, 0, 1, 0.08235294, 1,
-0.3709386, -2.289993, -3.55665, 0, 1, 0.08627451, 1,
-0.370793, 0.6394463, 0.1798157, 0, 1, 0.09411765, 1,
-0.3699384, -1.268861, -3.798616, 0, 1, 0.1019608, 1,
-0.3562588, -0.2275936, -2.509026, 0, 1, 0.1058824, 1,
-0.3558473, 0.186174, -2.35415, 0, 1, 0.1137255, 1,
-0.3552894, 0.3224228, -0.270399, 0, 1, 0.1176471, 1,
-0.349064, 0.1677712, -0.9674441, 0, 1, 0.1254902, 1,
-0.347796, -0.4865749, -3.776369, 0, 1, 0.1294118, 1,
-0.3453566, -0.5211037, -4.057941, 0, 1, 0.1372549, 1,
-0.3453021, 1.52382, 0.5396112, 0, 1, 0.1411765, 1,
-0.3442513, 2.610977, -1.242805, 0, 1, 0.1490196, 1,
-0.3388877, -0.8095514, -1.892081, 0, 1, 0.1529412, 1,
-0.3327154, 0.436062, -1.845857, 0, 1, 0.1607843, 1,
-0.3281309, 1.224668, -0.3077654, 0, 1, 0.1647059, 1,
-0.3270303, -0.5380844, -3.308402, 0, 1, 0.172549, 1,
-0.3260325, 0.4370912, 0.4280772, 0, 1, 0.1764706, 1,
-0.3131923, -1.410227, -3.613755, 0, 1, 0.1843137, 1,
-0.3115103, -0.6452948, -3.54573, 0, 1, 0.1882353, 1,
-0.3087223, -1.545266, -3.433726, 0, 1, 0.1960784, 1,
-0.3084804, 0.04188857, -1.353543, 0, 1, 0.2039216, 1,
-0.3082609, 1.885015, 0.03099179, 0, 1, 0.2078431, 1,
-0.3079685, -0.255855, -1.868197, 0, 1, 0.2156863, 1,
-0.3056003, 0.3822848, 0.3186792, 0, 1, 0.2196078, 1,
-0.2976842, -0.3358986, -2.941102, 0, 1, 0.227451, 1,
-0.2975866, 0.6419789, -1.907735, 0, 1, 0.2313726, 1,
-0.2968975, 0.5629517, 1.319309, 0, 1, 0.2392157, 1,
-0.2959432, 1.077673, -0.4281151, 0, 1, 0.2431373, 1,
-0.2908066, -0.2289087, -3.518815, 0, 1, 0.2509804, 1,
-0.2883788, 0.006131629, -0.7303686, 0, 1, 0.254902, 1,
-0.284658, -1.104391, -3.397332, 0, 1, 0.2627451, 1,
-0.2837303, 0.1093735, -1.70938, 0, 1, 0.2666667, 1,
-0.2815048, -0.06850416, -1.069525, 0, 1, 0.2745098, 1,
-0.2791396, -1.554597, -3.302791, 0, 1, 0.2784314, 1,
-0.2786592, -0.8989329, -3.040229, 0, 1, 0.2862745, 1,
-0.2782478, -0.01802722, -1.792796, 0, 1, 0.2901961, 1,
-0.2700704, 0.1340192, -1.129301, 0, 1, 0.2980392, 1,
-0.2698517, -0.8477308, -1.903913, 0, 1, 0.3058824, 1,
-0.2680736, -2.298335, -2.808447, 0, 1, 0.3098039, 1,
-0.2679504, 0.6093676, -0.4223258, 0, 1, 0.3176471, 1,
-0.2664928, -0.3193893, -1.238225, 0, 1, 0.3215686, 1,
-0.2651565, 0.9277128, 1.210633, 0, 1, 0.3294118, 1,
-0.2643653, -0.0706148, -0.06507278, 0, 1, 0.3333333, 1,
-0.2626971, -1.557227, -2.013418, 0, 1, 0.3411765, 1,
-0.2626203, 0.5287045, -1.256391, 0, 1, 0.345098, 1,
-0.2580675, -0.5667767, -2.730956, 0, 1, 0.3529412, 1,
-0.25783, 0.6167722, 0.4897724, 0, 1, 0.3568628, 1,
-0.257631, -0.8342031, -4.048559, 0, 1, 0.3647059, 1,
-0.2575698, -0.7366074, -4.066939, 0, 1, 0.3686275, 1,
-0.2465587, -0.3193646, -4.371205, 0, 1, 0.3764706, 1,
-0.2397057, -0.123003, -2.551341, 0, 1, 0.3803922, 1,
-0.2382147, -1.257348, -3.704869, 0, 1, 0.3882353, 1,
-0.2372402, 1.800134, 0.2410655, 0, 1, 0.3921569, 1,
-0.2353269, -0.848954, -2.894715, 0, 1, 0.4, 1,
-0.234168, -1.152709, -3.087319, 0, 1, 0.4078431, 1,
-0.2293346, -1.257561, -4.072252, 0, 1, 0.4117647, 1,
-0.2271497, 0.06771345, -2.398847, 0, 1, 0.4196078, 1,
-0.2265802, 1.679604, 0.2736918, 0, 1, 0.4235294, 1,
-0.2249396, 0.4908441, -0.3910423, 0, 1, 0.4313726, 1,
-0.2226654, 0.05734766, -1.44013, 0, 1, 0.4352941, 1,
-0.2221287, -0.6406971, -1.273888, 0, 1, 0.4431373, 1,
-0.2210608, -0.7695604, -3.746498, 0, 1, 0.4470588, 1,
-0.2208255, 0.4244285, -1.677439, 0, 1, 0.454902, 1,
-0.217854, -0.6703007, -3.768653, 0, 1, 0.4588235, 1,
-0.2148077, 0.1114926, -1.247817, 0, 1, 0.4666667, 1,
-0.2122548, -0.5887226, -2.186879, 0, 1, 0.4705882, 1,
-0.2108149, 0.2454821, 0.286317, 0, 1, 0.4784314, 1,
-0.2085763, 0.9504229, 0.3460868, 0, 1, 0.4823529, 1,
-0.2067752, 0.4120364, -1.897838, 0, 1, 0.4901961, 1,
-0.2063244, 1.006552, 0.2591547, 0, 1, 0.4941176, 1,
-0.2019291, 0.2735161, -1.717831, 0, 1, 0.5019608, 1,
-0.2002333, 0.4680188, -0.426878, 0, 1, 0.509804, 1,
-0.1990066, -1.145168, -2.714765, 0, 1, 0.5137255, 1,
-0.1978973, 0.7505212, 0.4594811, 0, 1, 0.5215687, 1,
-0.1927946, -0.06452828, -1.268526, 0, 1, 0.5254902, 1,
-0.1904031, -0.5110517, -0.5805813, 0, 1, 0.5333334, 1,
-0.1897835, 0.8652685, -0.4678705, 0, 1, 0.5372549, 1,
-0.1836506, -1.276586, -2.321694, 0, 1, 0.5450981, 1,
-0.1773982, -0.5967822, -0.8702203, 0, 1, 0.5490196, 1,
-0.1764851, -1.166214, -4.09317, 0, 1, 0.5568628, 1,
-0.1763012, 0.8988739, 0.7193865, 0, 1, 0.5607843, 1,
-0.1717036, -0.3019505, -2.874636, 0, 1, 0.5686275, 1,
-0.1715039, 1.675505, -0.02147794, 0, 1, 0.572549, 1,
-0.1705548, -0.112104, -0.7047132, 0, 1, 0.5803922, 1,
-0.1675888, 1.029084, -0.8937991, 0, 1, 0.5843138, 1,
-0.1671278, -0.7076353, -3.838556, 0, 1, 0.5921569, 1,
-0.1653667, -0.6873235, -0.1564103, 0, 1, 0.5960785, 1,
-0.1644123, 0.745564, -0.4111359, 0, 1, 0.6039216, 1,
-0.1637648, 1.636981, 1.829667, 0, 1, 0.6117647, 1,
-0.1609144, -0.6246167, -4.172602, 0, 1, 0.6156863, 1,
-0.1557169, 0.4036672, -1.524754, 0, 1, 0.6235294, 1,
-0.1553924, 2.364798, -0.7810385, 0, 1, 0.627451, 1,
-0.1550011, -1.617922, -3.706399, 0, 1, 0.6352941, 1,
-0.1541164, -0.9690012, -1.796958, 0, 1, 0.6392157, 1,
-0.1469661, -0.3587872, -1.944334, 0, 1, 0.6470588, 1,
-0.1443447, 2.784246, -1.127802, 0, 1, 0.6509804, 1,
-0.1384324, 1.462394, 1.418023, 0, 1, 0.6588235, 1,
-0.1378907, 0.6993988, 1.042953, 0, 1, 0.6627451, 1,
-0.1356294, 1.139413, 0.4062624, 0, 1, 0.6705883, 1,
-0.1353263, -1.474239, -1.328089, 0, 1, 0.6745098, 1,
-0.1288397, 1.992563, 0.4707386, 0, 1, 0.682353, 1,
-0.1282201, -0.0862126, -1.255787, 0, 1, 0.6862745, 1,
-0.1274244, 1.098643, -1.272976, 0, 1, 0.6941177, 1,
-0.1245919, 0.8688059, 0.6687969, 0, 1, 0.7019608, 1,
-0.1245487, -1.00823, -4.495672, 0, 1, 0.7058824, 1,
-0.1204143, -0.6513788, -4.561888, 0, 1, 0.7137255, 1,
-0.119744, 0.2576039, -0.4463457, 0, 1, 0.7176471, 1,
-0.1167269, 0.1185622, -2.455442, 0, 1, 0.7254902, 1,
-0.1153081, 0.8915179, 0.6494507, 0, 1, 0.7294118, 1,
-0.1144948, 0.2223984, -0.4155356, 0, 1, 0.7372549, 1,
-0.1060577, -0.07433058, -1.420115, 0, 1, 0.7411765, 1,
-0.1046455, -0.0006690684, -0.1362589, 0, 1, 0.7490196, 1,
-0.1024938, -0.1549661, -3.548756, 0, 1, 0.7529412, 1,
-0.09823018, -1.048674, -3.125757, 0, 1, 0.7607843, 1,
-0.09593236, -0.08977452, -1.393189, 0, 1, 0.7647059, 1,
-0.09506394, -1.280405, -2.981564, 0, 1, 0.772549, 1,
-0.09348174, -1.207158, -2.603315, 0, 1, 0.7764706, 1,
-0.09311422, 0.8115901, -0.3937653, 0, 1, 0.7843137, 1,
-0.09062959, 0.3084743, -0.9634706, 0, 1, 0.7882353, 1,
-0.08839159, -1.325963, -1.507883, 0, 1, 0.7960784, 1,
-0.08776356, 0.5791777, -0.6117931, 0, 1, 0.8039216, 1,
-0.0876663, -0.9756924, -3.460031, 0, 1, 0.8078431, 1,
-0.08271709, 0.6355528, 0.04358839, 0, 1, 0.8156863, 1,
-0.08155848, 0.5182824, -0.8909916, 0, 1, 0.8196079, 1,
-0.0807981, -1.422977, -3.890245, 0, 1, 0.827451, 1,
-0.08023781, 1.745984, 2.750047, 0, 1, 0.8313726, 1,
-0.07982627, -1.315031, -1.523541, 0, 1, 0.8392157, 1,
-0.07878119, 0.6758789, -1.645677, 0, 1, 0.8431373, 1,
-0.07709427, -0.1659421, -1.969892, 0, 1, 0.8509804, 1,
-0.0768232, -1.07955, -3.061148, 0, 1, 0.854902, 1,
-0.07628019, -0.626987, -4.930754, 0, 1, 0.8627451, 1,
-0.07560142, -1.400128, -4.954989, 0, 1, 0.8666667, 1,
-0.07420608, -0.04450001, -2.784659, 0, 1, 0.8745098, 1,
-0.07241219, -1.036256, -0.7048199, 0, 1, 0.8784314, 1,
-0.07076688, -0.3195706, -3.124394, 0, 1, 0.8862745, 1,
-0.06794593, 0.5060766, 0.5445347, 0, 1, 0.8901961, 1,
-0.06613228, 0.3904603, -0.04661994, 0, 1, 0.8980392, 1,
-0.06487991, 1.198799, 1.157541, 0, 1, 0.9058824, 1,
-0.06331241, -0.2512611, -2.624518, 0, 1, 0.9098039, 1,
-0.05697258, -0.9548455, -3.680229, 0, 1, 0.9176471, 1,
-0.05691838, 0.4871054, -0.1848056, 0, 1, 0.9215686, 1,
-0.05630737, -0.259763, -3.888636, 0, 1, 0.9294118, 1,
-0.05274361, -0.2633239, -2.983709, 0, 1, 0.9333333, 1,
-0.04360552, -0.07412654, -2.610162, 0, 1, 0.9411765, 1,
-0.04311465, 0.205819, -0.3926757, 0, 1, 0.945098, 1,
-0.04305423, -0.3617767, -3.739388, 0, 1, 0.9529412, 1,
-0.03807399, 0.5564808, -0.2186013, 0, 1, 0.9568627, 1,
-0.03743502, -0.2507862, -3.694956, 0, 1, 0.9647059, 1,
-0.02558505, 0.8246064, -1.073463, 0, 1, 0.9686275, 1,
-0.02545708, -0.4279997, -2.50167, 0, 1, 0.9764706, 1,
-0.01899681, 0.004632922, -0.4451471, 0, 1, 0.9803922, 1,
-0.01477345, 0.178421, 0.5862486, 0, 1, 0.9882353, 1,
-0.01056755, 0.2090284, 0.05005962, 0, 1, 0.9921569, 1,
0.0005245292, -0.08425452, 2.939638, 0, 1, 1, 1,
0.00087456, 0.6962292, 1.312514, 0, 0.9921569, 1, 1,
0.004154619, -1.043694, 3.237085, 0, 0.9882353, 1, 1,
0.004539401, 0.5084228, 0.9761248, 0, 0.9803922, 1, 1,
0.005109303, -0.02460999, 3.575485, 0, 0.9764706, 1, 1,
0.00655304, 0.253456, 1.576723, 0, 0.9686275, 1, 1,
0.009738804, -0.4366725, 4.218236, 0, 0.9647059, 1, 1,
0.01380596, 0.4532109, 0.04160591, 0, 0.9568627, 1, 1,
0.01462449, 2.127075, -0.6267177, 0, 0.9529412, 1, 1,
0.02233807, -2.144203, 2.432636, 0, 0.945098, 1, 1,
0.02489415, -0.07017113, 1.974317, 0, 0.9411765, 1, 1,
0.0249075, 0.04329524, -0.07741306, 0, 0.9333333, 1, 1,
0.02915564, 0.9529424, 0.857934, 0, 0.9294118, 1, 1,
0.03292664, -0.5955193, 2.188219, 0, 0.9215686, 1, 1,
0.03329223, -0.7371539, 2.397928, 0, 0.9176471, 1, 1,
0.03549856, -0.08138809, 3.316081, 0, 0.9098039, 1, 1,
0.03672747, -0.4141468, 3.082839, 0, 0.9058824, 1, 1,
0.03746261, -0.2358313, 0.2885421, 0, 0.8980392, 1, 1,
0.03987259, 0.4326678, -0.3315744, 0, 0.8901961, 1, 1,
0.04382611, -0.5554824, 2.900872, 0, 0.8862745, 1, 1,
0.04603942, 1.466622, 0.7884818, 0, 0.8784314, 1, 1,
0.04988148, -0.7073032, 2.024746, 0, 0.8745098, 1, 1,
0.0513972, -0.8460711, 1.68605, 0, 0.8666667, 1, 1,
0.05689246, 1.365868, -0.1110634, 0, 0.8627451, 1, 1,
0.05959634, -1.641489, 2.803192, 0, 0.854902, 1, 1,
0.05984918, -1.569804, 1.197951, 0, 0.8509804, 1, 1,
0.06622757, -0.9626321, 2.920952, 0, 0.8431373, 1, 1,
0.07079115, -0.07596636, 2.500423, 0, 0.8392157, 1, 1,
0.07502177, 1.576514, -0.09780452, 0, 0.8313726, 1, 1,
0.07624488, -1.762542, 3.646795, 0, 0.827451, 1, 1,
0.07803017, -0.8989989, 3.869521, 0, 0.8196079, 1, 1,
0.0796637, -1.189273, 2.986818, 0, 0.8156863, 1, 1,
0.08287034, 0.01304315, -1.279147, 0, 0.8078431, 1, 1,
0.08478305, 0.3166974, 0.7313398, 0, 0.8039216, 1, 1,
0.0854451, -0.2865524, 2.19652, 0, 0.7960784, 1, 1,
0.09140677, 0.620364, 0.9932013, 0, 0.7882353, 1, 1,
0.09304065, 0.7737014, 0.4056776, 0, 0.7843137, 1, 1,
0.09671679, -1.279864, 3.351369, 0, 0.7764706, 1, 1,
0.09723812, 0.5577886, -1.645332, 0, 0.772549, 1, 1,
0.09877786, 0.8517302, -0.1433458, 0, 0.7647059, 1, 1,
0.09917769, 1.455724, 0.4721828, 0, 0.7607843, 1, 1,
0.09984951, 1.286677, 0.2927678, 0, 0.7529412, 1, 1,
0.1017157, 0.9560634, -1.231018, 0, 0.7490196, 1, 1,
0.1037441, -1.965028, 2.604937, 0, 0.7411765, 1, 1,
0.1089358, 1.058474, -0.0751645, 0, 0.7372549, 1, 1,
0.1113824, 0.4745309, 1.24613, 0, 0.7294118, 1, 1,
0.1122266, 0.5168312, -0.2556127, 0, 0.7254902, 1, 1,
0.1165782, 0.5974606, -0.8691198, 0, 0.7176471, 1, 1,
0.1189329, -1.570748, 1.67644, 0, 0.7137255, 1, 1,
0.1215021, -0.8322054, 2.263377, 0, 0.7058824, 1, 1,
0.1215563, 0.4905939, 0.6145757, 0, 0.6980392, 1, 1,
0.1259804, 0.1362561, -1.039518, 0, 0.6941177, 1, 1,
0.1338573, 2.856328, -0.2086331, 0, 0.6862745, 1, 1,
0.1349048, 1.392801, -0.07153918, 0, 0.682353, 1, 1,
0.1387079, 0.2539527, 0.1500398, 0, 0.6745098, 1, 1,
0.141412, -0.1295271, 1.832226, 0, 0.6705883, 1, 1,
0.1445019, 0.5224986, 0.2848106, 0, 0.6627451, 1, 1,
0.145993, -1.506671, 4.011901, 0, 0.6588235, 1, 1,
0.1459974, 1.326037, -1.100624, 0, 0.6509804, 1, 1,
0.1488135, 1.855582, -0.5408906, 0, 0.6470588, 1, 1,
0.1489197, -0.1147488, 0.8521676, 0, 0.6392157, 1, 1,
0.1492608, -0.5334001, 1.487567, 0, 0.6352941, 1, 1,
0.1526356, 0.5473946, -0.5908204, 0, 0.627451, 1, 1,
0.1549362, 0.08212402, 0.2040252, 0, 0.6235294, 1, 1,
0.1564693, 0.4621466, 0.4606602, 0, 0.6156863, 1, 1,
0.1575736, 0.1653221, 0.9048156, 0, 0.6117647, 1, 1,
0.1582818, 0.4867109, -1.134252, 0, 0.6039216, 1, 1,
0.1584513, 0.4150755, 1.939638, 0, 0.5960785, 1, 1,
0.1604067, -0.7910173, 3.075937, 0, 0.5921569, 1, 1,
0.1611778, -0.3025874, 2.754079, 0, 0.5843138, 1, 1,
0.1654553, -0.2159865, 3.872492, 0, 0.5803922, 1, 1,
0.1677954, -0.2359744, 1.32098, 0, 0.572549, 1, 1,
0.1702575, 0.1426488, 2.051217, 0, 0.5686275, 1, 1,
0.1739241, -0.5263147, 1.057719, 0, 0.5607843, 1, 1,
0.1755585, 1.105627, -1.659838, 0, 0.5568628, 1, 1,
0.1755837, -0.9587653, 3.259776, 0, 0.5490196, 1, 1,
0.1767441, 0.2444339, 0.8972137, 0, 0.5450981, 1, 1,
0.1802177, -1.252169, 2.426679, 0, 0.5372549, 1, 1,
0.1815731, -0.3800011, 3.075482, 0, 0.5333334, 1, 1,
0.1844863, -0.190024, 3.057835, 0, 0.5254902, 1, 1,
0.1860195, -0.2516401, 0.204096, 0, 0.5215687, 1, 1,
0.1911061, -0.9259014, 1.713651, 0, 0.5137255, 1, 1,
0.1918922, -0.6127398, 3.199547, 0, 0.509804, 1, 1,
0.1939357, -0.8604867, 1.54757, 0, 0.5019608, 1, 1,
0.1954824, 0.1071924, 2.520543, 0, 0.4941176, 1, 1,
0.1955193, -0.5822322, 4.611099, 0, 0.4901961, 1, 1,
0.1982538, 0.01383101, 2.253972, 0, 0.4823529, 1, 1,
0.2005515, 0.1334246, 1.109639, 0, 0.4784314, 1, 1,
0.2026556, 0.821906, 1.952165, 0, 0.4705882, 1, 1,
0.2087785, 1.101971, -0.4474403, 0, 0.4666667, 1, 1,
0.2103218, -0.1681941, 0.672143, 0, 0.4588235, 1, 1,
0.2134948, -0.2152283, 0.7794888, 0, 0.454902, 1, 1,
0.2186174, 1.046458, -1.230348, 0, 0.4470588, 1, 1,
0.2194629, 0.68737, 1.190794, 0, 0.4431373, 1, 1,
0.2195137, -0.4495507, 2.475417, 0, 0.4352941, 1, 1,
0.2202809, 0.6496729, 1.598629, 0, 0.4313726, 1, 1,
0.2226312, 0.3048674, 1.087851, 0, 0.4235294, 1, 1,
0.2273343, 1.79866, 0.02500516, 0, 0.4196078, 1, 1,
0.2310972, 0.3888363, -0.7967338, 0, 0.4117647, 1, 1,
0.2322088, 0.001718721, 2.177106, 0, 0.4078431, 1, 1,
0.2324895, 0.05738747, 2.522525, 0, 0.4, 1, 1,
0.234577, 0.7428631, 0.7248286, 0, 0.3921569, 1, 1,
0.2351472, -0.7803307, 2.481878, 0, 0.3882353, 1, 1,
0.2389165, 2.565479, 0.8235211, 0, 0.3803922, 1, 1,
0.2433765, -0.934098, 2.170396, 0, 0.3764706, 1, 1,
0.2481518, 0.3854191, 0.6846224, 0, 0.3686275, 1, 1,
0.2509142, 0.7954854, -1.229635, 0, 0.3647059, 1, 1,
0.2548851, 0.4920479, 1.30304, 0, 0.3568628, 1, 1,
0.2550011, -0.7687683, 4.155912, 0, 0.3529412, 1, 1,
0.255233, 1.884982, 0.6014434, 0, 0.345098, 1, 1,
0.2574447, 0.9793733, -0.1987923, 0, 0.3411765, 1, 1,
0.2582833, -1.424334, 2.507221, 0, 0.3333333, 1, 1,
0.2628235, -0.3288888, 1.529431, 0, 0.3294118, 1, 1,
0.2674354, -0.4845374, -0.5620042, 0, 0.3215686, 1, 1,
0.268654, 0.7017912, -1.350704, 0, 0.3176471, 1, 1,
0.2710919, -0.2489513, 2.244762, 0, 0.3098039, 1, 1,
0.2734802, 0.4908893, -0.73397, 0, 0.3058824, 1, 1,
0.2783895, 1.1079, 0.1782747, 0, 0.2980392, 1, 1,
0.2789024, -0.8101854, 3.971099, 0, 0.2901961, 1, 1,
0.280905, 0.5399552, 0.854917, 0, 0.2862745, 1, 1,
0.2811326, 0.7606112, 1.679657, 0, 0.2784314, 1, 1,
0.2827237, 0.6114175, -0.4823397, 0, 0.2745098, 1, 1,
0.2840818, -0.3271341, 1.9569, 0, 0.2666667, 1, 1,
0.2846517, 0.8893152, 0.3980407, 0, 0.2627451, 1, 1,
0.2850419, 0.8113007, 0.2875576, 0, 0.254902, 1, 1,
0.2878238, -0.8712889, 2.416556, 0, 0.2509804, 1, 1,
0.2888383, -1.566064, 2.455155, 0, 0.2431373, 1, 1,
0.292993, -0.9748595, 3.192234, 0, 0.2392157, 1, 1,
0.2948331, 0.4156033, 1.63445, 0, 0.2313726, 1, 1,
0.2972822, 0.6418875, 1.183757, 0, 0.227451, 1, 1,
0.2978909, -1.374827, 3.269263, 0, 0.2196078, 1, 1,
0.3025155, 0.7704608, 0.7151778, 0, 0.2156863, 1, 1,
0.305087, 0.09463361, 1.365954, 0, 0.2078431, 1, 1,
0.3057, -0.1100016, 0.8393012, 0, 0.2039216, 1, 1,
0.3089117, 1.23154, -2.013888, 0, 0.1960784, 1, 1,
0.3127895, 0.6216161, -0.2513198, 0, 0.1882353, 1, 1,
0.3151078, 0.4331712, 1.410549, 0, 0.1843137, 1, 1,
0.3178629, -0.4785747, 1.780969, 0, 0.1764706, 1, 1,
0.3203017, -0.8027027, 1.831665, 0, 0.172549, 1, 1,
0.3215316, 0.2650031, 0.6197422, 0, 0.1647059, 1, 1,
0.3218405, -0.8499823, 3.752991, 0, 0.1607843, 1, 1,
0.3261943, -0.740694, 3.98807, 0, 0.1529412, 1, 1,
0.3289325, 0.01477441, -1.646045, 0, 0.1490196, 1, 1,
0.3305897, -0.4117915, 1.917794, 0, 0.1411765, 1, 1,
0.3309142, 0.2153343, 0.430988, 0, 0.1372549, 1, 1,
0.3338234, 0.5139963, 0.4382105, 0, 0.1294118, 1, 1,
0.3356638, 0.5018572, 0.3971519, 0, 0.1254902, 1, 1,
0.3377171, 0.1033869, 1.764288, 0, 0.1176471, 1, 1,
0.3487372, -0.550459, 2.937644, 0, 0.1137255, 1, 1,
0.3500192, 0.3859986, 0.4913759, 0, 0.1058824, 1, 1,
0.3529021, 0.3537757, -0.8942869, 0, 0.09803922, 1, 1,
0.3544016, -1.146047, 0.9273065, 0, 0.09411765, 1, 1,
0.3571148, -1.512331, 4.62032, 0, 0.08627451, 1, 1,
0.3598139, 2.119514, 0.06691249, 0, 0.08235294, 1, 1,
0.3600996, -0.4047494, 1.936933, 0, 0.07450981, 1, 1,
0.3602846, 0.8499023, 0.7780333, 0, 0.07058824, 1, 1,
0.362948, -0.1772879, 3.392627, 0, 0.0627451, 1, 1,
0.3643669, -0.7276658, 3.64106, 0, 0.05882353, 1, 1,
0.3685574, 0.8651351, -0.1285214, 0, 0.05098039, 1, 1,
0.3686139, -0.1439003, -0.356526, 0, 0.04705882, 1, 1,
0.370619, -0.5676476, 2.586499, 0, 0.03921569, 1, 1,
0.3716779, -1.38426, 3.160247, 0, 0.03529412, 1, 1,
0.37475, -0.4961388, 1.107208, 0, 0.02745098, 1, 1,
0.3760504, 2.119, -1.540233, 0, 0.02352941, 1, 1,
0.3762927, -1.552997, 3.903973, 0, 0.01568628, 1, 1,
0.3773042, 1.009185, -0.5158975, 0, 0.01176471, 1, 1,
0.3813455, -0.7128294, 4.11114, 0, 0.003921569, 1, 1,
0.3817906, -0.06182455, 2.160166, 0.003921569, 0, 1, 1,
0.3832993, 0.1825025, 1.187987, 0.007843138, 0, 1, 1,
0.3852352, -0.7737894, 2.575663, 0.01568628, 0, 1, 1,
0.3870246, 0.4687334, 0.9844829, 0.01960784, 0, 1, 1,
0.3871193, 0.2643196, 0.896622, 0.02745098, 0, 1, 1,
0.3876134, 0.5269989, 0.8980747, 0.03137255, 0, 1, 1,
0.3979787, -0.4223154, 1.694347, 0.03921569, 0, 1, 1,
0.3985761, 1.44899, 0.5864224, 0.04313726, 0, 1, 1,
0.4018717, 0.365413, 1.66497, 0.05098039, 0, 1, 1,
0.4030039, -0.5667264, 3.933633, 0.05490196, 0, 1, 1,
0.4064532, 0.01380225, -0.03816185, 0.0627451, 0, 1, 1,
0.4069146, -0.6967933, 1.528548, 0.06666667, 0, 1, 1,
0.4077695, 0.5281128, 1.507587, 0.07450981, 0, 1, 1,
0.4123553, 1.68445, -1.110897, 0.07843138, 0, 1, 1,
0.4129595, -0.9822512, 3.64827, 0.08627451, 0, 1, 1,
0.4140944, -0.1714367, 1.475184, 0.09019608, 0, 1, 1,
0.4172032, 0.8090781, 0.3772871, 0.09803922, 0, 1, 1,
0.4198449, -1.322168, 2.19612, 0.1058824, 0, 1, 1,
0.4208875, 0.8637754, 0.399605, 0.1098039, 0, 1, 1,
0.4261652, -0.5436754, 1.468461, 0.1176471, 0, 1, 1,
0.4281943, -0.1556648, 3.184896, 0.1215686, 0, 1, 1,
0.4316047, 0.8249442, 0.4831079, 0.1294118, 0, 1, 1,
0.4344866, 0.740704, 0.790494, 0.1333333, 0, 1, 1,
0.4347917, -2.045942, 1.533369, 0.1411765, 0, 1, 1,
0.4416138, 1.761225, -0.3744702, 0.145098, 0, 1, 1,
0.444841, -1.404936, 4.377103, 0.1529412, 0, 1, 1,
0.448962, -0.3804609, 0.04623787, 0.1568628, 0, 1, 1,
0.4551935, -1.074629, 4.030831, 0.1647059, 0, 1, 1,
0.4553686, -1.176533, 4.670956, 0.1686275, 0, 1, 1,
0.4598137, 0.3058206, 1.659592, 0.1764706, 0, 1, 1,
0.4632732, -0.592307, 1.811639, 0.1803922, 0, 1, 1,
0.4664416, 1.726217, -1.194634, 0.1882353, 0, 1, 1,
0.4681832, -1.03783, 2.432899, 0.1921569, 0, 1, 1,
0.468373, 0.1831575, 1.355815, 0.2, 0, 1, 1,
0.4688326, 0.2041729, 2.479412, 0.2078431, 0, 1, 1,
0.4764389, 0.0931517, 2.881669, 0.2117647, 0, 1, 1,
0.4772428, -0.3548433, 2.925133, 0.2196078, 0, 1, 1,
0.4772986, 0.4581721, -0.6877806, 0.2235294, 0, 1, 1,
0.4858207, 0.9562435, 0.1085021, 0.2313726, 0, 1, 1,
0.4904372, -0.3426851, 1.284567, 0.2352941, 0, 1, 1,
0.4935308, -1.352116, 1.692837, 0.2431373, 0, 1, 1,
0.4949034, 0.7478951, 0.5612302, 0.2470588, 0, 1, 1,
0.4986388, 0.7228162, 1.742261, 0.254902, 0, 1, 1,
0.5001509, -0.9912615, 2.894926, 0.2588235, 0, 1, 1,
0.504428, -2.158197, 1.664381, 0.2666667, 0, 1, 1,
0.5224131, 0.3961257, 2.313213, 0.2705882, 0, 1, 1,
0.5239797, 0.2035293, 0.5410209, 0.2784314, 0, 1, 1,
0.5294983, -1.19575, 2.633044, 0.282353, 0, 1, 1,
0.5298612, -0.01342428, 1.959765, 0.2901961, 0, 1, 1,
0.531536, 0.7582111, 0.5769278, 0.2941177, 0, 1, 1,
0.5378991, 0.1016974, -1.232794, 0.3019608, 0, 1, 1,
0.5388789, -0.4504263, 2.688519, 0.3098039, 0, 1, 1,
0.5418355, -1.134325, 3.121714, 0.3137255, 0, 1, 1,
0.5439218, -0.1585921, 3.494702, 0.3215686, 0, 1, 1,
0.5447361, -0.3754235, 1.816602, 0.3254902, 0, 1, 1,
0.550456, 1.357595, 1.610139, 0.3333333, 0, 1, 1,
0.5536569, 0.7297815, 0.7779585, 0.3372549, 0, 1, 1,
0.555402, -0.7302586, 1.316403, 0.345098, 0, 1, 1,
0.5587053, 0.2480647, 1.852359, 0.3490196, 0, 1, 1,
0.5615128, 1.231568, 0.2390319, 0.3568628, 0, 1, 1,
0.5636799, -1.093936, 4.231271, 0.3607843, 0, 1, 1,
0.5652024, 0.2961159, 2.168356, 0.3686275, 0, 1, 1,
0.5653281, 0.5302714, 0.05238171, 0.372549, 0, 1, 1,
0.5673184, -0.6390325, 2.215822, 0.3803922, 0, 1, 1,
0.5729236, 0.1823548, 0.9283651, 0.3843137, 0, 1, 1,
0.5782424, -0.922281, 2.180737, 0.3921569, 0, 1, 1,
0.5790982, 1.728299, 0.663474, 0.3960784, 0, 1, 1,
0.5857885, -0.2296186, 2.357026, 0.4039216, 0, 1, 1,
0.5859591, -1.421089, 1.450959, 0.4117647, 0, 1, 1,
0.587649, 0.3706543, -0.1426363, 0.4156863, 0, 1, 1,
0.5893994, 1.021314, 0.9115663, 0.4235294, 0, 1, 1,
0.5916024, -0.08351389, 4.312691, 0.427451, 0, 1, 1,
0.5916455, -0.4753477, 2.034993, 0.4352941, 0, 1, 1,
0.5988883, 1.22707, 1.55313, 0.4392157, 0, 1, 1,
0.6021441, 1.637795, 0.6351027, 0.4470588, 0, 1, 1,
0.6043532, 0.02045229, 2.5393, 0.4509804, 0, 1, 1,
0.6101005, 1.282304, 0.7736715, 0.4588235, 0, 1, 1,
0.6108394, -0.0002687633, 3.375282, 0.4627451, 0, 1, 1,
0.6120695, 0.6503085, 1.238913, 0.4705882, 0, 1, 1,
0.6163608, 0.1684867, 1.132498, 0.4745098, 0, 1, 1,
0.6193965, -0.9173537, 2.165037, 0.4823529, 0, 1, 1,
0.6221197, -1.587249, 1.413209, 0.4862745, 0, 1, 1,
0.6278771, -0.851768, 2.21935, 0.4941176, 0, 1, 1,
0.6286409, 0.6812623, 1.180812, 0.5019608, 0, 1, 1,
0.6297731, -1.047727, 2.951539, 0.5058824, 0, 1, 1,
0.6314598, 0.1669263, 0.7690671, 0.5137255, 0, 1, 1,
0.6325766, -0.3588797, 1.690746, 0.5176471, 0, 1, 1,
0.6440055, 1.697652, 1.244869, 0.5254902, 0, 1, 1,
0.6452727, 1.313364, 0.1301287, 0.5294118, 0, 1, 1,
0.6461565, 0.785278, 0.4711772, 0.5372549, 0, 1, 1,
0.6519461, 1.247375, -0.5562191, 0.5411765, 0, 1, 1,
0.6536757, -0.07264183, 3.280757, 0.5490196, 0, 1, 1,
0.659974, 0.9548489, 0.672713, 0.5529412, 0, 1, 1,
0.6666278, -1.39325, 1.89656, 0.5607843, 0, 1, 1,
0.6689776, 0.8773548, 2.683561, 0.5647059, 0, 1, 1,
0.6691478, -0.2180918, 3.000966, 0.572549, 0, 1, 1,
0.672709, 0.5654578, -0.4846952, 0.5764706, 0, 1, 1,
0.6727284, 0.08927249, 0.9038187, 0.5843138, 0, 1, 1,
0.6783476, -0.2564116, 1.415961, 0.5882353, 0, 1, 1,
0.6820932, 0.5289876, 0.6647496, 0.5960785, 0, 1, 1,
0.6829371, -0.7325521, 2.990545, 0.6039216, 0, 1, 1,
0.6856699, 0.5242868, 0.5248906, 0.6078432, 0, 1, 1,
0.6861082, -0.5211655, 3.602248, 0.6156863, 0, 1, 1,
0.6906533, -0.7647587, 2.163022, 0.6196079, 0, 1, 1,
0.6931779, -2.130119, 1.294518, 0.627451, 0, 1, 1,
0.7013627, -0.5127443, 0.7927663, 0.6313726, 0, 1, 1,
0.7033041, 1.033118, -1.186036, 0.6392157, 0, 1, 1,
0.7057577, -0.3252917, -0.2600809, 0.6431373, 0, 1, 1,
0.7087768, -0.3077184, 1.848242, 0.6509804, 0, 1, 1,
0.7109281, 2.066355, 0.1215237, 0.654902, 0, 1, 1,
0.7152291, -1.193201, 2.614586, 0.6627451, 0, 1, 1,
0.7207563, -1.801209, 2.034436, 0.6666667, 0, 1, 1,
0.7233593, 0.06999906, 1.245612, 0.6745098, 0, 1, 1,
0.7235017, -2.712328, 1.845283, 0.6784314, 0, 1, 1,
0.740037, 2.16365, 1.294875, 0.6862745, 0, 1, 1,
0.7402365, -0.5746853, 2.111059, 0.6901961, 0, 1, 1,
0.7436596, -1.20663, 2.505786, 0.6980392, 0, 1, 1,
0.7468022, 0.4968673, 1.307992, 0.7058824, 0, 1, 1,
0.7653645, 0.7751622, -0.2511259, 0.7098039, 0, 1, 1,
0.7692587, 1.536574, 0.03988673, 0.7176471, 0, 1, 1,
0.7742977, 1.794284, 2.313318, 0.7215686, 0, 1, 1,
0.7746168, 0.8018232, 0.4875392, 0.7294118, 0, 1, 1,
0.7746966, 1.540093, 1.078929, 0.7333333, 0, 1, 1,
0.7754998, 0.897997, 1.408557, 0.7411765, 0, 1, 1,
0.7877972, -1.806158, 2.015644, 0.7450981, 0, 1, 1,
0.7889523, 2.423883, 1.176686, 0.7529412, 0, 1, 1,
0.7904828, -1.045398, 1.958107, 0.7568628, 0, 1, 1,
0.7914536, -1.666175, 2.531425, 0.7647059, 0, 1, 1,
0.7915833, 0.7959499, 1.909436, 0.7686275, 0, 1, 1,
0.7945282, -1.889634, 3.4453, 0.7764706, 0, 1, 1,
0.8011646, -0.8331856, 2.442422, 0.7803922, 0, 1, 1,
0.8078135, -0.3667503, 2.433181, 0.7882353, 0, 1, 1,
0.8116909, -0.1507834, 1.148524, 0.7921569, 0, 1, 1,
0.814447, -1.401754, 3.846859, 0.8, 0, 1, 1,
0.8157104, -0.9191072, 4.313472, 0.8078431, 0, 1, 1,
0.8163528, -0.509371, 2.00203, 0.8117647, 0, 1, 1,
0.8172264, 0.2786651, 0.4935913, 0.8196079, 0, 1, 1,
0.8315248, -2.118348, 3.409643, 0.8235294, 0, 1, 1,
0.8324056, 0.9290218, -0.5486882, 0.8313726, 0, 1, 1,
0.8326561, 0.8905544, 1.97376, 0.8352941, 0, 1, 1,
0.8355579, 1.18584, 1.122401, 0.8431373, 0, 1, 1,
0.8392261, -1.641905, 4.810231, 0.8470588, 0, 1, 1,
0.8394185, 0.1592985, 2.077528, 0.854902, 0, 1, 1,
0.8454099, -0.6599823, 3.202557, 0.8588235, 0, 1, 1,
0.8488268, 0.1686424, -0.1473477, 0.8666667, 0, 1, 1,
0.8558331, 0.2988806, 0.7238899, 0.8705882, 0, 1, 1,
0.858014, -0.6048803, 3.661121, 0.8784314, 0, 1, 1,
0.8635093, 0.6071864, 1.888644, 0.8823529, 0, 1, 1,
0.8653019, 0.8759679, 0.6509326, 0.8901961, 0, 1, 1,
0.8723236, 1.066825, 2.52261, 0.8941177, 0, 1, 1,
0.8778843, -0.6161622, 2.123264, 0.9019608, 0, 1, 1,
0.8858871, -0.4895354, 0.6431707, 0.9098039, 0, 1, 1,
0.8909434, 2.156439, 0.6743173, 0.9137255, 0, 1, 1,
0.8960091, -0.5910928, 0.596457, 0.9215686, 0, 1, 1,
0.9062749, 0.8934221, 0.6780272, 0.9254902, 0, 1, 1,
0.90874, -1.055815, 3.330317, 0.9333333, 0, 1, 1,
0.919793, -0.2246468, 1.310032, 0.9372549, 0, 1, 1,
0.9276077, 0.6278052, 0.878113, 0.945098, 0, 1, 1,
0.9300897, -1.426304, 2.142659, 0.9490196, 0, 1, 1,
0.9468952, -1.183548, 4.683377, 0.9568627, 0, 1, 1,
0.9554051, -0.0806004, 2.562092, 0.9607843, 0, 1, 1,
0.9596035, 1.691581, -1.849288, 0.9686275, 0, 1, 1,
0.9615304, 0.4846376, -1.12127, 0.972549, 0, 1, 1,
0.9645799, 0.6026707, 0.7592793, 0.9803922, 0, 1, 1,
0.9652646, 0.3299486, 2.315575, 0.9843137, 0, 1, 1,
0.9821638, -0.318387, 1.018436, 0.9921569, 0, 1, 1,
0.9828919, 0.1000467, 1.89157, 0.9960784, 0, 1, 1,
0.9884685, -0.4124527, 1.140735, 1, 0, 0.9960784, 1,
0.997592, 0.6377106, -0.2272242, 1, 0, 0.9882353, 1,
0.9994534, 0.7738408, -0.2758622, 1, 0, 0.9843137, 1,
1.001638, 0.001879523, 0.5641237, 1, 0, 0.9764706, 1,
1.005589, 0.7427291, 1.694569, 1, 0, 0.972549, 1,
1.006499, -0.724449, 2.060242, 1, 0, 0.9647059, 1,
1.010057, 0.6781436, -0.09071758, 1, 0, 0.9607843, 1,
1.01127, -1.172485, 3.724576, 1, 0, 0.9529412, 1,
1.012133, 0.947327, 1.325666, 1, 0, 0.9490196, 1,
1.012733, 0.2714328, 2.362418, 1, 0, 0.9411765, 1,
1.016194, -0.4195275, 1.107268, 1, 0, 0.9372549, 1,
1.017047, 1.196982, -1.009285, 1, 0, 0.9294118, 1,
1.020113, -1.058567, 1.580285, 1, 0, 0.9254902, 1,
1.029874, 0.1754558, 1.652257, 1, 0, 0.9176471, 1,
1.033662, 0.9160014, -0.6204627, 1, 0, 0.9137255, 1,
1.033921, -0.8714008, 2.10335, 1, 0, 0.9058824, 1,
1.039253, 0.8018646, 0.5870721, 1, 0, 0.9019608, 1,
1.039307, -1.616386, 2.482322, 1, 0, 0.8941177, 1,
1.040165, -0.3772329, 0.7341969, 1, 0, 0.8862745, 1,
1.040337, 0.2091658, 1.537635, 1, 0, 0.8823529, 1,
1.047221, -0.4171685, 1.519961, 1, 0, 0.8745098, 1,
1.057466, -1.032012, 1.779325, 1, 0, 0.8705882, 1,
1.06003, 0.07147228, 0.5467613, 1, 0, 0.8627451, 1,
1.06179, 0.7937561, -0.8677465, 1, 0, 0.8588235, 1,
1.063254, -0.2888875, 2.019511, 1, 0, 0.8509804, 1,
1.065969, 1.277664, 1.947043, 1, 0, 0.8470588, 1,
1.073532, -0.3662491, 0.8652359, 1, 0, 0.8392157, 1,
1.075332, -0.5572789, 2.883512, 1, 0, 0.8352941, 1,
1.078324, 0.1328524, 1.911717, 1, 0, 0.827451, 1,
1.082059, -2.597398, 3.242277, 1, 0, 0.8235294, 1,
1.083342, -1.152101, 1.953879, 1, 0, 0.8156863, 1,
1.087391, 0.1726065, 2.009213, 1, 0, 0.8117647, 1,
1.094608, 0.9930943, 0.437294, 1, 0, 0.8039216, 1,
1.09583, 0.2755224, 1.612426, 1, 0, 0.7960784, 1,
1.099621, 1.341397, -1.552239, 1, 0, 0.7921569, 1,
1.100337, 0.1922454, 0.8861859, 1, 0, 0.7843137, 1,
1.102853, 0.3808177, 1.768684, 1, 0, 0.7803922, 1,
1.103077, 1.143289, 0.9281932, 1, 0, 0.772549, 1,
1.103158, -0.8545759, 2.011716, 1, 0, 0.7686275, 1,
1.106461, -1.376796, 2.239347, 1, 0, 0.7607843, 1,
1.110559, 1.678854, 1.455648, 1, 0, 0.7568628, 1,
1.118367, -0.8732132, 3.65406, 1, 0, 0.7490196, 1,
1.125252, 2.085118, -0.8121116, 1, 0, 0.7450981, 1,
1.138109, 1.243814, 1.974624, 1, 0, 0.7372549, 1,
1.139959, 0.6527959, 2.03988, 1, 0, 0.7333333, 1,
1.144529, 1.375135, 0.003002649, 1, 0, 0.7254902, 1,
1.146903, 1.048076, 1.102301, 1, 0, 0.7215686, 1,
1.148503, 1.580238, 0.1594382, 1, 0, 0.7137255, 1,
1.150516, -1.611129, 2.615004, 1, 0, 0.7098039, 1,
1.169423, 0.2772415, 0.2027021, 1, 0, 0.7019608, 1,
1.170625, -0.09569862, 2.20034, 1, 0, 0.6941177, 1,
1.171267, 0.6242225, 0.3055002, 1, 0, 0.6901961, 1,
1.200971, -0.0803885, 0.7636009, 1, 0, 0.682353, 1,
1.208114, 1.420717, 0.4895203, 1, 0, 0.6784314, 1,
1.20859, -0.7096093, 2.217311, 1, 0, 0.6705883, 1,
1.214317, 0.3663728, 0.3987904, 1, 0, 0.6666667, 1,
1.223409, -0.1378963, 1.487994, 1, 0, 0.6588235, 1,
1.237497, 0.1021179, 2.0067, 1, 0, 0.654902, 1,
1.249101, -1.140922, 1.929312, 1, 0, 0.6470588, 1,
1.251795, 1.755337, -0.2796808, 1, 0, 0.6431373, 1,
1.254116, -0.3221076, 2.347451, 1, 0, 0.6352941, 1,
1.256345, 1.270613, 1.134493, 1, 0, 0.6313726, 1,
1.256644, 2.720375, -0.6906831, 1, 0, 0.6235294, 1,
1.259438, -0.1308203, 1.543897, 1, 0, 0.6196079, 1,
1.260911, -1.306583, 2.956465, 1, 0, 0.6117647, 1,
1.261824, 0.2845542, 1.319487, 1, 0, 0.6078432, 1,
1.264766, -0.09259472, 1.353068, 1, 0, 0.6, 1,
1.276338, 0.05170281, 1.112691, 1, 0, 0.5921569, 1,
1.289122, -0.4862931, 2.610537, 1, 0, 0.5882353, 1,
1.29198, -1.435184, 3.502155, 1, 0, 0.5803922, 1,
1.293498, -0.3070646, 1.743819, 1, 0, 0.5764706, 1,
1.294998, -0.3844996, 3.055695, 1, 0, 0.5686275, 1,
1.296065, -0.1735793, 0.3947225, 1, 0, 0.5647059, 1,
1.3047, -0.6498818, 2.355168, 1, 0, 0.5568628, 1,
1.321632, 0.7512373, 1.118361, 1, 0, 0.5529412, 1,
1.333328, -0.03448234, 0.8092977, 1, 0, 0.5450981, 1,
1.34024, -0.8579983, 1.909136, 1, 0, 0.5411765, 1,
1.343476, -1.070209, -0.09221658, 1, 0, 0.5333334, 1,
1.349562, -1.079948, 0.899483, 1, 0, 0.5294118, 1,
1.362705, -0.2882124, 2.726094, 1, 0, 0.5215687, 1,
1.36932, -0.3219122, 2.806197, 1, 0, 0.5176471, 1,
1.369727, -0.6017945, 2.446954, 1, 0, 0.509804, 1,
1.386931, -0.2476777, 1.551474, 1, 0, 0.5058824, 1,
1.399784, 0.0954231, 0.7048357, 1, 0, 0.4980392, 1,
1.401627, -0.03790787, 1.18559, 1, 0, 0.4901961, 1,
1.403551, -1.266379, 1.818292, 1, 0, 0.4862745, 1,
1.412524, -1.748194, 2.352455, 1, 0, 0.4784314, 1,
1.416291, 2.47991, 1.620254, 1, 0, 0.4745098, 1,
1.429301, 0.06061291, 1.759093, 1, 0, 0.4666667, 1,
1.438517, 0.4538018, 2.133494, 1, 0, 0.4627451, 1,
1.44471, 0.9308056, -0.2031811, 1, 0, 0.454902, 1,
1.446972, -1.02881, 2.48528, 1, 0, 0.4509804, 1,
1.453565, 0.2502045, 1.488128, 1, 0, 0.4431373, 1,
1.456693, 1.207501, 1.36859, 1, 0, 0.4392157, 1,
1.462155, 1.329109, 0.8413207, 1, 0, 0.4313726, 1,
1.48053, -0.08358287, 2.189814, 1, 0, 0.427451, 1,
1.48547, -0.3949187, 2.600252, 1, 0, 0.4196078, 1,
1.493431, -0.6699287, 2.990319, 1, 0, 0.4156863, 1,
1.498637, -0.19989, 1.225842, 1, 0, 0.4078431, 1,
1.508355, 0.1341478, 3.044629, 1, 0, 0.4039216, 1,
1.514336, -2.171506, 2.539291, 1, 0, 0.3960784, 1,
1.527625, -0.5691221, 1.318422, 1, 0, 0.3882353, 1,
1.528807, -0.17723, 1.261473, 1, 0, 0.3843137, 1,
1.529199, 0.04350609, 1.372933, 1, 0, 0.3764706, 1,
1.544425, -2.107012, 2.11094, 1, 0, 0.372549, 1,
1.552688, -0.9847751, 4.002386, 1, 0, 0.3647059, 1,
1.554386, 1.398886, -0.6335521, 1, 0, 0.3607843, 1,
1.56924, 0.04576037, -0.0584139, 1, 0, 0.3529412, 1,
1.585975, 1.246081, 0.6775599, 1, 0, 0.3490196, 1,
1.598686, -1.8298, 2.314807, 1, 0, 0.3411765, 1,
1.610623, -0.3953005, 1.649502, 1, 0, 0.3372549, 1,
1.614457, 1.781216, 0.8504582, 1, 0, 0.3294118, 1,
1.626773, -0.2377283, 2.244118, 1, 0, 0.3254902, 1,
1.635727, 0.6048795, 1.04246, 1, 0, 0.3176471, 1,
1.651204, 0.9000992, 1.130624, 1, 0, 0.3137255, 1,
1.658257, -0.5113676, 3.124916, 1, 0, 0.3058824, 1,
1.671692, -0.535332, 1.280543, 1, 0, 0.2980392, 1,
1.687186, 0.1875363, 2.254326, 1, 0, 0.2941177, 1,
1.698845, 0.6248795, 1.459537, 1, 0, 0.2862745, 1,
1.70003, 1.214272, 1.271675, 1, 0, 0.282353, 1,
1.708641, 0.3400447, 1.248154, 1, 0, 0.2745098, 1,
1.712157, 1.303666, 1.606273, 1, 0, 0.2705882, 1,
1.716723, 0.155775, 3.543351, 1, 0, 0.2627451, 1,
1.720461, 0.438326, 1.811684, 1, 0, 0.2588235, 1,
1.721483, -0.4769863, 0.6077812, 1, 0, 0.2509804, 1,
1.739064, -0.9230828, 2.793407, 1, 0, 0.2470588, 1,
1.740108, -1.411876, 2.27844, 1, 0, 0.2392157, 1,
1.754829, 1.4447, 1.248028, 1, 0, 0.2352941, 1,
1.762187, 1.662522, 1.221897, 1, 0, 0.227451, 1,
1.766999, 2.066188, 1.007994, 1, 0, 0.2235294, 1,
1.768543, 1.171532, 1.334021, 1, 0, 0.2156863, 1,
1.784246, -1.58644, 1.81899, 1, 0, 0.2117647, 1,
1.794996, 1.985816, 1.201678, 1, 0, 0.2039216, 1,
1.799714, 0.1161675, 2.05574, 1, 0, 0.1960784, 1,
1.809351, -0.4547776, 0.8931442, 1, 0, 0.1921569, 1,
1.83126, -0.4859901, 3.33366, 1, 0, 0.1843137, 1,
1.842858, -0.06019247, 0.8526562, 1, 0, 0.1803922, 1,
1.847036, -2.135807, 2.757761, 1, 0, 0.172549, 1,
1.849226, -0.660141, 3.171555, 1, 0, 0.1686275, 1,
1.853576, 0.2848523, 1.683474, 1, 0, 0.1607843, 1,
1.875237, -0.5273034, 2.620251, 1, 0, 0.1568628, 1,
1.876841, -0.514857, 1.469346, 1, 0, 0.1490196, 1,
1.878701, 1.68624, 0.5353685, 1, 0, 0.145098, 1,
1.878996, 1.895621, 0.9036545, 1, 0, 0.1372549, 1,
1.883069, -1.922002, -0.4429604, 1, 0, 0.1333333, 1,
1.925082, -1.339859, 1.024438, 1, 0, 0.1254902, 1,
1.960678, -1.170984, 2.207948, 1, 0, 0.1215686, 1,
2.005111, 0.09734567, 0.2058683, 1, 0, 0.1137255, 1,
2.010542, -0.2866206, 2.824626, 1, 0, 0.1098039, 1,
2.045065, 0.6107284, 1.53745, 1, 0, 0.1019608, 1,
2.054627, -0.8472675, 1.355496, 1, 0, 0.09411765, 1,
2.057273, 0.642203, 1.32741, 1, 0, 0.09019608, 1,
2.062835, -0.6832424, 2.111894, 1, 0, 0.08235294, 1,
2.151502, -0.8096331, 2.152161, 1, 0, 0.07843138, 1,
2.177155, 0.8547141, 0.3163774, 1, 0, 0.07058824, 1,
2.196197, 1.478566, 0.6488507, 1, 0, 0.06666667, 1,
2.285943, -0.01548342, 0.3903773, 1, 0, 0.05882353, 1,
2.303443, 0.03294104, 1.381429, 1, 0, 0.05490196, 1,
2.412519, -0.957239, 3.158435, 1, 0, 0.04705882, 1,
2.419777, 0.07269274, 0.9096694, 1, 0, 0.04313726, 1,
2.453807, 0.3132482, 0.8685576, 1, 0, 0.03529412, 1,
2.549284, -0.7891357, 1.531314, 1, 0, 0.03137255, 1,
2.68942, -1.200724, 3.696153, 1, 0, 0.02352941, 1,
3.525811, -1.056929, 1.076477, 1, 0, 0.01960784, 1,
3.547012, -1.089625, 2.381818, 1, 0, 0.01176471, 1,
3.551633, -0.3278479, 3.254025, 1, 0, 0.007843138, 1
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
0.1774938, -3.656215, -8.329511, 0, -0.5, 0.5, 0.5,
0.1774938, -3.656215, -8.329511, 1, -0.5, 0.5, 0.5,
0.1774938, -3.656215, -8.329511, 1, 1.5, 0.5, 0.5,
0.1774938, -3.656215, -8.329511, 0, 1.5, 0.5, 0.5
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
-4.340478, 0.07200027, -8.329511, 0, -0.5, 0.5, 0.5,
-4.340478, 0.07200027, -8.329511, 1, -0.5, 0.5, 0.5,
-4.340478, 0.07200027, -8.329511, 1, 1.5, 0.5, 0.5,
-4.340478, 0.07200027, -8.329511, 0, 1.5, 0.5, 0.5
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
-4.340478, -3.656215, -0.8074439, 0, -0.5, 0.5, 0.5,
-4.340478, -3.656215, -0.8074439, 1, -0.5, 0.5, 0.5,
-4.340478, -3.656215, -0.8074439, 1, 1.5, 0.5, 0.5,
-4.340478, -3.656215, -0.8074439, 0, 1.5, 0.5, 0.5
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
-3, -2.795858, -6.593649,
3, -2.795858, -6.593649,
-3, -2.795858, -6.593649,
-3, -2.93925, -6.882959,
-2, -2.795858, -6.593649,
-2, -2.93925, -6.882959,
-1, -2.795858, -6.593649,
-1, -2.93925, -6.882959,
0, -2.795858, -6.593649,
0, -2.93925, -6.882959,
1, -2.795858, -6.593649,
1, -2.93925, -6.882959,
2, -2.795858, -6.593649,
2, -2.93925, -6.882959,
3, -2.795858, -6.593649,
3, -2.93925, -6.882959
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
-3, -3.226036, -7.46158, 0, -0.5, 0.5, 0.5,
-3, -3.226036, -7.46158, 1, -0.5, 0.5, 0.5,
-3, -3.226036, -7.46158, 1, 1.5, 0.5, 0.5,
-3, -3.226036, -7.46158, 0, 1.5, 0.5, 0.5,
-2, -3.226036, -7.46158, 0, -0.5, 0.5, 0.5,
-2, -3.226036, -7.46158, 1, -0.5, 0.5, 0.5,
-2, -3.226036, -7.46158, 1, 1.5, 0.5, 0.5,
-2, -3.226036, -7.46158, 0, 1.5, 0.5, 0.5,
-1, -3.226036, -7.46158, 0, -0.5, 0.5, 0.5,
-1, -3.226036, -7.46158, 1, -0.5, 0.5, 0.5,
-1, -3.226036, -7.46158, 1, 1.5, 0.5, 0.5,
-1, -3.226036, -7.46158, 0, 1.5, 0.5, 0.5,
0, -3.226036, -7.46158, 0, -0.5, 0.5, 0.5,
0, -3.226036, -7.46158, 1, -0.5, 0.5, 0.5,
0, -3.226036, -7.46158, 1, 1.5, 0.5, 0.5,
0, -3.226036, -7.46158, 0, 1.5, 0.5, 0.5,
1, -3.226036, -7.46158, 0, -0.5, 0.5, 0.5,
1, -3.226036, -7.46158, 1, -0.5, 0.5, 0.5,
1, -3.226036, -7.46158, 1, 1.5, 0.5, 0.5,
1, -3.226036, -7.46158, 0, 1.5, 0.5, 0.5,
2, -3.226036, -7.46158, 0, -0.5, 0.5, 0.5,
2, -3.226036, -7.46158, 1, -0.5, 0.5, 0.5,
2, -3.226036, -7.46158, 1, 1.5, 0.5, 0.5,
2, -3.226036, -7.46158, 0, 1.5, 0.5, 0.5,
3, -3.226036, -7.46158, 0, -0.5, 0.5, 0.5,
3, -3.226036, -7.46158, 1, -0.5, 0.5, 0.5,
3, -3.226036, -7.46158, 1, 1.5, 0.5, 0.5,
3, -3.226036, -7.46158, 0, 1.5, 0.5, 0.5
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
-3.297869, -2, -6.593649,
-3.297869, 2, -6.593649,
-3.297869, -2, -6.593649,
-3.471637, -2, -6.882959,
-3.297869, -1, -6.593649,
-3.471637, -1, -6.882959,
-3.297869, 0, -6.593649,
-3.471637, 0, -6.882959,
-3.297869, 1, -6.593649,
-3.471637, 1, -6.882959,
-3.297869, 2, -6.593649,
-3.471637, 2, -6.882959
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
-3.819174, -2, -7.46158, 0, -0.5, 0.5, 0.5,
-3.819174, -2, -7.46158, 1, -0.5, 0.5, 0.5,
-3.819174, -2, -7.46158, 1, 1.5, 0.5, 0.5,
-3.819174, -2, -7.46158, 0, 1.5, 0.5, 0.5,
-3.819174, -1, -7.46158, 0, -0.5, 0.5, 0.5,
-3.819174, -1, -7.46158, 1, -0.5, 0.5, 0.5,
-3.819174, -1, -7.46158, 1, 1.5, 0.5, 0.5,
-3.819174, -1, -7.46158, 0, 1.5, 0.5, 0.5,
-3.819174, 0, -7.46158, 0, -0.5, 0.5, 0.5,
-3.819174, 0, -7.46158, 1, -0.5, 0.5, 0.5,
-3.819174, 0, -7.46158, 1, 1.5, 0.5, 0.5,
-3.819174, 0, -7.46158, 0, 1.5, 0.5, 0.5,
-3.819174, 1, -7.46158, 0, -0.5, 0.5, 0.5,
-3.819174, 1, -7.46158, 1, -0.5, 0.5, 0.5,
-3.819174, 1, -7.46158, 1, 1.5, 0.5, 0.5,
-3.819174, 1, -7.46158, 0, 1.5, 0.5, 0.5,
-3.819174, 2, -7.46158, 0, -0.5, 0.5, 0.5,
-3.819174, 2, -7.46158, 1, -0.5, 0.5, 0.5,
-3.819174, 2, -7.46158, 1, 1.5, 0.5, 0.5,
-3.819174, 2, -7.46158, 0, 1.5, 0.5, 0.5
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
-3.297869, -2.795858, -6,
-3.297869, -2.795858, 4,
-3.297869, -2.795858, -6,
-3.471637, -2.93925, -6,
-3.297869, -2.795858, -4,
-3.471637, -2.93925, -4,
-3.297869, -2.795858, -2,
-3.471637, -2.93925, -2,
-3.297869, -2.795858, 0,
-3.471637, -2.93925, 0,
-3.297869, -2.795858, 2,
-3.471637, -2.93925, 2,
-3.297869, -2.795858, 4,
-3.471637, -2.93925, 4
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
"-6",
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
-3.819174, -3.226036, -6, 0, -0.5, 0.5, 0.5,
-3.819174, -3.226036, -6, 1, -0.5, 0.5, 0.5,
-3.819174, -3.226036, -6, 1, 1.5, 0.5, 0.5,
-3.819174, -3.226036, -6, 0, 1.5, 0.5, 0.5,
-3.819174, -3.226036, -4, 0, -0.5, 0.5, 0.5,
-3.819174, -3.226036, -4, 1, -0.5, 0.5, 0.5,
-3.819174, -3.226036, -4, 1, 1.5, 0.5, 0.5,
-3.819174, -3.226036, -4, 0, 1.5, 0.5, 0.5,
-3.819174, -3.226036, -2, 0, -0.5, 0.5, 0.5,
-3.819174, -3.226036, -2, 1, -0.5, 0.5, 0.5,
-3.819174, -3.226036, -2, 1, 1.5, 0.5, 0.5,
-3.819174, -3.226036, -2, 0, 1.5, 0.5, 0.5,
-3.819174, -3.226036, 0, 0, -0.5, 0.5, 0.5,
-3.819174, -3.226036, 0, 1, -0.5, 0.5, 0.5,
-3.819174, -3.226036, 0, 1, 1.5, 0.5, 0.5,
-3.819174, -3.226036, 0, 0, 1.5, 0.5, 0.5,
-3.819174, -3.226036, 2, 0, -0.5, 0.5, 0.5,
-3.819174, -3.226036, 2, 1, -0.5, 0.5, 0.5,
-3.819174, -3.226036, 2, 1, 1.5, 0.5, 0.5,
-3.819174, -3.226036, 2, 0, 1.5, 0.5, 0.5,
-3.819174, -3.226036, 4, 0, -0.5, 0.5, 0.5,
-3.819174, -3.226036, 4, 1, -0.5, 0.5, 0.5,
-3.819174, -3.226036, 4, 1, 1.5, 0.5, 0.5,
-3.819174, -3.226036, 4, 0, 1.5, 0.5, 0.5
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
-3.297869, -2.795858, -6.593649,
-3.297869, 2.939858, -6.593649,
-3.297869, -2.795858, 4.978762,
-3.297869, 2.939858, 4.978762,
-3.297869, -2.795858, -6.593649,
-3.297869, -2.795858, 4.978762,
-3.297869, 2.939858, -6.593649,
-3.297869, 2.939858, 4.978762,
-3.297869, -2.795858, -6.593649,
3.652857, -2.795858, -6.593649,
-3.297869, -2.795858, 4.978762,
3.652857, -2.795858, 4.978762,
-3.297869, 2.939858, -6.593649,
3.652857, 2.939858, -6.593649,
-3.297869, 2.939858, 4.978762,
3.652857, 2.939858, 4.978762,
3.652857, -2.795858, -6.593649,
3.652857, 2.939858, -6.593649,
3.652857, -2.795858, 4.978762,
3.652857, 2.939858, 4.978762,
3.652857, -2.795858, -6.593649,
3.652857, -2.795858, 4.978762,
3.652857, 2.939858, -6.593649,
3.652857, 2.939858, 4.978762
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
var radius = 7.83209;
var distance = 34.84585;
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
mvMatrix.translate( -0.1774938, -0.07200027, 0.8074439 );
mvMatrix.scale( 1.21832, 1.4764, 0.7317585 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84585);
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
amidosulfuron<-read.table("amidosulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-amidosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'amidosulfuron' not found
```

```r
y<-amidosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'amidosulfuron' not found
```

```r
z<-amidosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'amidosulfuron' not found
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
-3.196645, -0.2895642, -1.600624, 0, 0, 1, 1, 1,
-2.971824, 1.336643, -1.954613, 1, 0, 0, 1, 1,
-2.787133, 1.755195, -0.9907204, 1, 0, 0, 1, 1,
-2.632172, -0.1250881, -0.6961432, 1, 0, 0, 1, 1,
-2.598331, 1.051184, 0.0004742798, 1, 0, 0, 1, 1,
-2.514926, 0.3090784, -0.43082, 1, 0, 0, 1, 1,
-2.491585, -0.3259687, -2.14404, 0, 0, 0, 1, 1,
-2.490642, 0.1091065, -1.042427, 0, 0, 0, 1, 1,
-2.450566, 1.347324, -1.068275, 0, 0, 0, 1, 1,
-2.412535, -1.052187, -2.622386, 0, 0, 0, 1, 1,
-2.411438, -0.9434947, -1.017858, 0, 0, 0, 1, 1,
-2.351542, -0.788785, -2.475434, 0, 0, 0, 1, 1,
-2.351477, -1.012947, -0.7505194, 0, 0, 0, 1, 1,
-2.323054, -0.8917862, -1.950487, 1, 1, 1, 1, 1,
-2.286692, 1.859592, -1.898198, 1, 1, 1, 1, 1,
-2.268583, 0.8070861, -1.869099, 1, 1, 1, 1, 1,
-2.241951, 2.05958, -3.383006, 1, 1, 1, 1, 1,
-2.22798, -0.05951275, -2.338629, 1, 1, 1, 1, 1,
-2.125193, 0.5496853, -0.7763577, 1, 1, 1, 1, 1,
-2.118512, -0.8904919, -3.517276, 1, 1, 1, 1, 1,
-1.94773, -0.2983383, -2.584425, 1, 1, 1, 1, 1,
-1.94003, -0.7081828, -2.706859, 1, 1, 1, 1, 1,
-1.929861, -1.254808, -1.785007, 1, 1, 1, 1, 1,
-1.92756, 1.06946, -0.9228761, 1, 1, 1, 1, 1,
-1.879185, -0.9617853, -1.795738, 1, 1, 1, 1, 1,
-1.87012, -0.0876297, -1.20663, 1, 1, 1, 1, 1,
-1.857567, -0.1697647, -1.781875, 1, 1, 1, 1, 1,
-1.856861, 0.6749441, -2.180735, 1, 1, 1, 1, 1,
-1.851447, -0.823189, -4.979686, 0, 0, 1, 1, 1,
-1.850471, 1.09602, -0.2479795, 1, 0, 0, 1, 1,
-1.838356, -1.498462, -2.780271, 1, 0, 0, 1, 1,
-1.801239, -1.180921, -3.347839, 1, 0, 0, 1, 1,
-1.79501, -1.315352, -1.924477, 1, 0, 0, 1, 1,
-1.762818, -0.8069808, -2.68528, 1, 0, 0, 1, 1,
-1.75499, -0.5815303, -2.182497, 0, 0, 0, 1, 1,
-1.748193, 0.5555854, -1.457294, 0, 0, 0, 1, 1,
-1.73426, 1.360346, -2.330699, 0, 0, 0, 1, 1,
-1.72942, 0.05392174, -1.538173, 0, 0, 0, 1, 1,
-1.729411, 0.2645279, -1.065987, 0, 0, 0, 1, 1,
-1.716703, -0.1719285, -2.694333, 0, 0, 0, 1, 1,
-1.716513, -1.332076, -3.773785, 0, 0, 0, 1, 1,
-1.712489, -1.174898, -2.303381, 1, 1, 1, 1, 1,
-1.697296, -0.8481715, -2.371792, 1, 1, 1, 1, 1,
-1.68452, -1.697469, -2.027785, 1, 1, 1, 1, 1,
-1.668292, -0.5683333, -1.169433, 1, 1, 1, 1, 1,
-1.667457, -0.1724871, -1.182829, 1, 1, 1, 1, 1,
-1.663565, -0.3314703, -0.3007606, 1, 1, 1, 1, 1,
-1.661798, -1.139951, -1.979141, 1, 1, 1, 1, 1,
-1.624402, 1.392064, 1.116299, 1, 1, 1, 1, 1,
-1.590298, 1.474514, -0.01727006, 1, 1, 1, 1, 1,
-1.582932, 0.1745405, -0.1402467, 1, 1, 1, 1, 1,
-1.576874, -0.7357638, -0.1911185, 1, 1, 1, 1, 1,
-1.568784, 1.230555, 0.431427, 1, 1, 1, 1, 1,
-1.563309, 0.7564948, -0.1993458, 1, 1, 1, 1, 1,
-1.56113, -1.976393, -1.906808, 1, 1, 1, 1, 1,
-1.551633, 0.6809279, -0.6168472, 1, 1, 1, 1, 1,
-1.549666, 0.0006178573, -1.819323, 0, 0, 1, 1, 1,
-1.536495, 0.2412793, -0.1621369, 1, 0, 0, 1, 1,
-1.52783, -2.589991, -2.881892, 1, 0, 0, 1, 1,
-1.526373, -0.6479427, -2.373219, 1, 0, 0, 1, 1,
-1.51259, -0.1359576, -1.694472, 1, 0, 0, 1, 1,
-1.505627, -0.5151254, -2.573864, 1, 0, 0, 1, 1,
-1.505117, 1.339672, -0.8755003, 0, 0, 0, 1, 1,
-1.495294, -0.02730857, -2.687566, 0, 0, 0, 1, 1,
-1.489131, -1.605132, -2.926691, 0, 0, 0, 1, 1,
-1.488251, 0.4522403, 0.03902377, 0, 0, 0, 1, 1,
-1.484083, -0.01578479, -0.4385231, 0, 0, 0, 1, 1,
-1.480816, -0.309206, -0.3040076, 0, 0, 0, 1, 1,
-1.475768, 0.6629687, -0.6219404, 0, 0, 0, 1, 1,
-1.473156, -1.574741, -3.776691, 1, 1, 1, 1, 1,
-1.462034, -1.086272, -0.990097, 1, 1, 1, 1, 1,
-1.46091, 0.6012937, 0.1387438, 1, 1, 1, 1, 1,
-1.45111, -1.504365, -2.28781, 1, 1, 1, 1, 1,
-1.441204, 0.2389765, -0.5977777, 1, 1, 1, 1, 1,
-1.440633, 1.461092, -0.9920733, 1, 1, 1, 1, 1,
-1.424969, 0.5265895, 0.7072978, 1, 1, 1, 1, 1,
-1.422097, -0.9347548, -2.073521, 1, 1, 1, 1, 1,
-1.409708, 0.004952297, -1.014702, 1, 1, 1, 1, 1,
-1.408759, 0.7019696, 0.841475, 1, 1, 1, 1, 1,
-1.407108, 1.986397, -1.043573, 1, 1, 1, 1, 1,
-1.395209, -0.7726133, -1.911372, 1, 1, 1, 1, 1,
-1.388195, 1.06501, 0.2582505, 1, 1, 1, 1, 1,
-1.382193, 1.834282, -2.449305, 1, 1, 1, 1, 1,
-1.381395, -0.05155667, -3.6147, 1, 1, 1, 1, 1,
-1.365868, -0.1597972, -3.239109, 0, 0, 1, 1, 1,
-1.363465, -0.3725038, -1.976156, 1, 0, 0, 1, 1,
-1.341462, -0.005755985, -2.109434, 1, 0, 0, 1, 1,
-1.334498, 1.373896, -0.9439316, 1, 0, 0, 1, 1,
-1.324143, -0.4765533, -2.527834, 1, 0, 0, 1, 1,
-1.315768, -0.2226058, -0.43021, 1, 0, 0, 1, 1,
-1.314393, 0.02864732, -0.7173873, 0, 0, 0, 1, 1,
-1.306822, -0.733458, -0.4003988, 0, 0, 0, 1, 1,
-1.304554, 0.583228, -2.062986, 0, 0, 0, 1, 1,
-1.299903, 1.368593, -0.3715635, 0, 0, 0, 1, 1,
-1.291474, 0.6358165, -1.453742, 0, 0, 0, 1, 1,
-1.288139, -0.2678503, -1.923514, 0, 0, 0, 1, 1,
-1.28535, 2.022948, 1.782313, 0, 0, 0, 1, 1,
-1.284708, -1.749071, -2.254107, 1, 1, 1, 1, 1,
-1.284595, -0.3058562, -0.9082409, 1, 1, 1, 1, 1,
-1.283069, -0.9876, -2.724959, 1, 1, 1, 1, 1,
-1.273345, -0.7816339, -1.761764, 1, 1, 1, 1, 1,
-1.271624, -1.273741, -1.525926, 1, 1, 1, 1, 1,
-1.244585, -1.631267, -0.7258608, 1, 1, 1, 1, 1,
-1.242371, -0.5174872, -1.435709, 1, 1, 1, 1, 1,
-1.241801, -1.088389, -2.890779, 1, 1, 1, 1, 1,
-1.235234, -0.01117179, -1.281604, 1, 1, 1, 1, 1,
-1.226064, 0.81932, -1.21889, 1, 1, 1, 1, 1,
-1.219969, 0.710476, -1.326177, 1, 1, 1, 1, 1,
-1.205541, 0.8399362, -1.194258, 1, 1, 1, 1, 1,
-1.199138, -0.5742912, -0.6900334, 1, 1, 1, 1, 1,
-1.193522, -1.298288, -1.750908, 1, 1, 1, 1, 1,
-1.192917, 0.3498807, -2.583883, 1, 1, 1, 1, 1,
-1.192802, -1.990754, -2.954849, 0, 0, 1, 1, 1,
-1.191637, 1.847793, -0.6457531, 1, 0, 0, 1, 1,
-1.18961, 0.9746022, -2.672179, 1, 0, 0, 1, 1,
-1.188279, -0.164562, -1.072832, 1, 0, 0, 1, 1,
-1.188065, 1.208619, -1.926516, 1, 0, 0, 1, 1,
-1.18314, -0.602012, -2.498441, 1, 0, 0, 1, 1,
-1.18024, -0.03149216, -3.704602, 0, 0, 0, 1, 1,
-1.180161, 1.086555, -0.6137729, 0, 0, 0, 1, 1,
-1.178618, -0.5819969, -1.246166, 0, 0, 0, 1, 1,
-1.177475, -0.1585146, -2.369995, 0, 0, 0, 1, 1,
-1.175379, -0.1069698, 0.157215, 0, 0, 0, 1, 1,
-1.173187, 1.280496, -1.749836, 0, 0, 0, 1, 1,
-1.173005, -0.7514257, -1.25963, 0, 0, 0, 1, 1,
-1.16636, 1.150477, -0.3524684, 1, 1, 1, 1, 1,
-1.164174, -0.7317551, -1.043755, 1, 1, 1, 1, 1,
-1.145935, -0.5208157, -0.09771519, 1, 1, 1, 1, 1,
-1.144829, -0.5888245, -0.7013788, 1, 1, 1, 1, 1,
-1.143774, -2.200901, -2.227443, 1, 1, 1, 1, 1,
-1.128532, 0.2557575, -3.461539, 1, 1, 1, 1, 1,
-1.113348, -1.540249, -2.607767, 1, 1, 1, 1, 1,
-1.105879, -0.5472522, -3.110574, 1, 1, 1, 1, 1,
-1.102154, 1.498372, -1.390714, 1, 1, 1, 1, 1,
-1.099901, 1.488489, -0.7015373, 1, 1, 1, 1, 1,
-1.099415, -1.545437, -2.821434, 1, 1, 1, 1, 1,
-1.099147, 0.4613151, -1.089461, 1, 1, 1, 1, 1,
-1.099045, -0.2002811, -3.665733, 1, 1, 1, 1, 1,
-1.098723, 0.9084778, 1.885845, 1, 1, 1, 1, 1,
-1.088005, 1.067182, -1.80503, 1, 1, 1, 1, 1,
-1.075969, -0.2387526, -0.9730745, 0, 0, 1, 1, 1,
-1.07415, 1.54137, 0.4174603, 1, 0, 0, 1, 1,
-1.071176, -0.1880533, -1.907044, 1, 0, 0, 1, 1,
-1.060893, -1.711422, -3.003199, 1, 0, 0, 1, 1,
-1.056008, 0.4200156, -1.340056, 1, 0, 0, 1, 1,
-1.052345, 1.225212, -0.8283373, 1, 0, 0, 1, 1,
-1.044377, -0.8159883, -1.700012, 0, 0, 0, 1, 1,
-1.042086, 0.0432054, -0.8004317, 0, 0, 0, 1, 1,
-1.036549, 1.003664, -2.011786, 0, 0, 0, 1, 1,
-1.033479, 0.6764712, -0.5922686, 0, 0, 0, 1, 1,
-1.032558, -0.03171765, -1.108377, 0, 0, 0, 1, 1,
-1.02742, 0.0185767, -1.906366, 0, 0, 0, 1, 1,
-1.022685, 1.445803, -0.06022065, 0, 0, 0, 1, 1,
-1.012231, -0.1588933, -2.205486, 1, 1, 1, 1, 1,
-0.9988043, 1.657107, -1.968662, 1, 1, 1, 1, 1,
-0.9966252, 1.195763, -1.153375, 1, 1, 1, 1, 1,
-0.9885231, -1.34796, -2.790753, 1, 1, 1, 1, 1,
-0.9861761, -0.4351436, -1.185784, 1, 1, 1, 1, 1,
-0.9817203, 1.665081, 0.6798843, 1, 1, 1, 1, 1,
-0.973345, -0.9115604, -3.507726, 1, 1, 1, 1, 1,
-0.9629978, -0.8588073, -2.568323, 1, 1, 1, 1, 1,
-0.9542611, -0.2817742, -3.56713, 1, 1, 1, 1, 1,
-0.9514914, 0.9938474, 0.2918524, 1, 1, 1, 1, 1,
-0.9494426, -0.4292376, -2.475909, 1, 1, 1, 1, 1,
-0.948673, 1.125153, -2.56935, 1, 1, 1, 1, 1,
-0.9477184, 1.11323, -1.488687, 1, 1, 1, 1, 1,
-0.9455467, -0.9095154, -3.536556, 1, 1, 1, 1, 1,
-0.9390659, 0.7238339, -0.005563625, 1, 1, 1, 1, 1,
-0.9304562, 1.095484, 0.3460912, 0, 0, 1, 1, 1,
-0.9131245, -0.1677562, -2.163329, 1, 0, 0, 1, 1,
-0.9131027, -0.2583967, -1.599972, 1, 0, 0, 1, 1,
-0.9040956, -0.4816436, -1.328531, 1, 0, 0, 1, 1,
-0.9032523, -0.6039643, -1.789859, 1, 0, 0, 1, 1,
-0.9028941, -0.3386966, -2.463276, 1, 0, 0, 1, 1,
-0.902673, 0.03799229, -1.453574, 0, 0, 0, 1, 1,
-0.8886969, 0.1667334, -2.084085, 0, 0, 0, 1, 1,
-0.8828381, -0.7078295, -0.5319498, 0, 0, 0, 1, 1,
-0.8624941, 0.7344853, -0.5573707, 0, 0, 0, 1, 1,
-0.8538594, -0.4375719, -2.427907, 0, 0, 0, 1, 1,
-0.853397, 1.652002, -1.547699, 0, 0, 0, 1, 1,
-0.8504045, 1.08155, 1.633885, 0, 0, 0, 1, 1,
-0.8484793, -0.2477513, -2.342082, 1, 1, 1, 1, 1,
-0.8388863, 0.4305745, 0.363205, 1, 1, 1, 1, 1,
-0.8386024, 0.4754826, -1.938794, 1, 1, 1, 1, 1,
-0.8358928, 0.8548606, -0.886538, 1, 1, 1, 1, 1,
-0.8350797, -0.5620317, -2.23932, 1, 1, 1, 1, 1,
-0.8305137, -0.9797528, -2.669603, 1, 1, 1, 1, 1,
-0.8261341, -0.1775517, -0.6376247, 1, 1, 1, 1, 1,
-0.8203593, 0.4822353, -1.022007, 1, 1, 1, 1, 1,
-0.8155296, -0.007556486, -1.647094, 1, 1, 1, 1, 1,
-0.8153538, 0.8460284, -0.09429616, 1, 1, 1, 1, 1,
-0.8152194, 1.660822, 1.172507, 1, 1, 1, 1, 1,
-0.8142005, 2.013542, -0.4346839, 1, 1, 1, 1, 1,
-0.8127632, 0.0142631, -2.014967, 1, 1, 1, 1, 1,
-0.8125066, 0.01243421, -1.962112, 1, 1, 1, 1, 1,
-0.8103081, 0.02136095, -1.63901, 1, 1, 1, 1, 1,
-0.805185, -0.9732231, -1.848076, 0, 0, 1, 1, 1,
-0.8042337, -0.7929491, -2.188729, 1, 0, 0, 1, 1,
-0.8018456, 1.438676, -1.132065, 1, 0, 0, 1, 1,
-0.7965937, -2.270571, -2.095122, 1, 0, 0, 1, 1,
-0.7920006, -0.6921348, -1.568861, 1, 0, 0, 1, 1,
-0.7908874, -0.1970374, -2.566083, 1, 0, 0, 1, 1,
-0.7858528, 1.983325, 0.7108375, 0, 0, 0, 1, 1,
-0.7739881, 1.52629, -1.081061, 0, 0, 0, 1, 1,
-0.7732109, 0.4452705, -0.1838304, 0, 0, 0, 1, 1,
-0.7722825, -2.262191, -3.164509, 0, 0, 0, 1, 1,
-0.771814, -0.09421442, -2.009611, 0, 0, 0, 1, 1,
-0.7680898, 0.03572338, -0.1225006, 0, 0, 0, 1, 1,
-0.7661266, -0.1348997, -1.463374, 0, 0, 0, 1, 1,
-0.765321, -0.6148829, -3.280877, 1, 1, 1, 1, 1,
-0.7598407, -0.301745, -0.9525818, 1, 1, 1, 1, 1,
-0.7591121, 0.1255161, -1.709736, 1, 1, 1, 1, 1,
-0.7563064, 0.2473205, 0.4378332, 1, 1, 1, 1, 1,
-0.7503256, -0.1688437, -1.83398, 1, 1, 1, 1, 1,
-0.746133, 0.6995838, -0.01027406, 1, 1, 1, 1, 1,
-0.7459602, -0.4262502, -3.92758, 1, 1, 1, 1, 1,
-0.7456606, -1.887444, -3.296953, 1, 1, 1, 1, 1,
-0.7393057, 0.09152186, -1.769948, 1, 1, 1, 1, 1,
-0.7335176, -0.818846, -3.711847, 1, 1, 1, 1, 1,
-0.7238294, 0.3899876, -0.1815759, 1, 1, 1, 1, 1,
-0.7203655, -0.3188314, -3.123817, 1, 1, 1, 1, 1,
-0.7194383, -1.355219, -2.09808, 1, 1, 1, 1, 1,
-0.7147835, -0.8412042, -5.132986, 1, 1, 1, 1, 1,
-0.7119215, 0.8567737, 0.482598, 1, 1, 1, 1, 1,
-0.7099587, 0.5350248, -0.2808205, 0, 0, 1, 1, 1,
-0.7067651, -1.39885, -2.422361, 1, 0, 0, 1, 1,
-0.6971402, -1.426203, -1.370265, 1, 0, 0, 1, 1,
-0.6959592, 0.3666269, -1.851992, 1, 0, 0, 1, 1,
-0.6925695, 0.03421305, -0.6873985, 1, 0, 0, 1, 1,
-0.69082, -0.3055716, -1.691697, 1, 0, 0, 1, 1,
-0.6904691, 0.8441963, -3.92916, 0, 0, 0, 1, 1,
-0.6893573, -0.9080727, -2.743789, 0, 0, 0, 1, 1,
-0.6888763, -0.2557828, -2.674885, 0, 0, 0, 1, 1,
-0.6838061, -1.598009, -2.109914, 0, 0, 0, 1, 1,
-0.6820185, 0.3995824, -0.7114644, 0, 0, 0, 1, 1,
-0.6788698, -1.451021, -4.74383, 0, 0, 0, 1, 1,
-0.6778835, 0.7320176, 1.166438, 0, 0, 0, 1, 1,
-0.677869, -0.9179826, -1.734204, 1, 1, 1, 1, 1,
-0.6764172, -0.6357533, -1.997072, 1, 1, 1, 1, 1,
-0.6738561, 0.5892771, 0.7713839, 1, 1, 1, 1, 1,
-0.6733702, 0.06938545, -0.7927921, 1, 1, 1, 1, 1,
-0.6726894, 0.5357286, -1.221303, 1, 1, 1, 1, 1,
-0.6723596, -1.364128, -3.648683, 1, 1, 1, 1, 1,
-0.6651688, 0.01184979, -1.300558, 1, 1, 1, 1, 1,
-0.662994, 0.04228794, -3.267284, 1, 1, 1, 1, 1,
-0.6504176, -0.5475926, -2.208225, 1, 1, 1, 1, 1,
-0.6466632, -0.5923661, -2.345182, 1, 1, 1, 1, 1,
-0.6456444, -1.66838, -1.76631, 1, 1, 1, 1, 1,
-0.641422, -1.88829, -2.723068, 1, 1, 1, 1, 1,
-0.6327511, -1.160613, -2.547797, 1, 1, 1, 1, 1,
-0.630846, -0.2097438, 0.02851046, 1, 1, 1, 1, 1,
-0.6272325, 0.1839649, -0.6482226, 1, 1, 1, 1, 1,
-0.6266508, -1.13932, -4.739286, 0, 0, 1, 1, 1,
-0.6253918, 0.2095503, -0.06981827, 1, 0, 0, 1, 1,
-0.6252327, -0.4085127, -2.887194, 1, 0, 0, 1, 1,
-0.6230679, -0.2655618, -2.58823, 1, 0, 0, 1, 1,
-0.6209166, 1.389926, -0.9698111, 1, 0, 0, 1, 1,
-0.6134554, 0.7423658, -0.08903682, 1, 0, 0, 1, 1,
-0.6130078, 0.000917977, -0.7693996, 0, 0, 0, 1, 1,
-0.6097187, 0.4936791, -2.083957, 0, 0, 0, 1, 1,
-0.6062372, 0.2762955, -0.6555744, 0, 0, 0, 1, 1,
-0.6020935, 1.040712, 0.7796167, 0, 0, 0, 1, 1,
-0.6018823, -1.330504, -3.741136, 0, 0, 0, 1, 1,
-0.5987386, -0.7254494, -2.749091, 0, 0, 0, 1, 1,
-0.5950231, -0.4985995, -3.427574, 0, 0, 0, 1, 1,
-0.5939199, -0.1832126, -2.769481, 1, 1, 1, 1, 1,
-0.5929753, 1.227606, 1.621251, 1, 1, 1, 1, 1,
-0.5924241, -0.6718276, -3.494225, 1, 1, 1, 1, 1,
-0.5825908, 0.06127674, -3.843665, 1, 1, 1, 1, 1,
-0.5816516, 0.8614699, -0.5554778, 1, 1, 1, 1, 1,
-0.5797653, -2.525304, -3.528751, 1, 1, 1, 1, 1,
-0.5785321, 0.4254184, -0.1150257, 1, 1, 1, 1, 1,
-0.5766138, 0.3183999, -0.4334074, 1, 1, 1, 1, 1,
-0.5748557, 0.6047558, -0.869178, 1, 1, 1, 1, 1,
-0.5719733, 0.5479597, -1.171179, 1, 1, 1, 1, 1,
-0.5712076, -0.9039999, -3.454086, 1, 1, 1, 1, 1,
-0.5698347, -0.002597533, -0.3888089, 1, 1, 1, 1, 1,
-0.5542256, -0.7196679, -2.701256, 1, 1, 1, 1, 1,
-0.5516693, 0.5316661, -0.9664416, 1, 1, 1, 1, 1,
-0.5427339, -0.267563, -1.593688, 1, 1, 1, 1, 1,
-0.5420557, 1.477861, -0.4512525, 0, 0, 1, 1, 1,
-0.5415247, 0.02614251, -2.441481, 1, 0, 0, 1, 1,
-0.5414281, -0.9986966, -3.15907, 1, 0, 0, 1, 1,
-0.5311283, -1.195629, -1.682326, 1, 0, 0, 1, 1,
-0.527083, -0.1110009, -0.7181315, 1, 0, 0, 1, 1,
-0.5250134, -0.1183858, -2.13225, 1, 0, 0, 1, 1,
-0.5223703, 0.2646515, 0.007381462, 0, 0, 0, 1, 1,
-0.515851, -0.9955232, -4.277268, 0, 0, 0, 1, 1,
-0.5134112, 1.236353, -0.6829401, 0, 0, 0, 1, 1,
-0.5011682, -0.2099538, -2.325736, 0, 0, 0, 1, 1,
-0.4895366, -1.126091, -3.219873, 0, 0, 0, 1, 1,
-0.4853339, 1.185371, 0.5289943, 0, 0, 0, 1, 1,
-0.4839025, 0.6866927, -1.441973, 0, 0, 0, 1, 1,
-0.4837043, -0.8956598, -2.939788, 1, 1, 1, 1, 1,
-0.4834481, 2.070758, 0.2863959, 1, 1, 1, 1, 1,
-0.4809969, -0.3889974, -2.229106, 1, 1, 1, 1, 1,
-0.4782639, -0.6726319, -1.9286, 1, 1, 1, 1, 1,
-0.4781588, 0.7457921, 0.4610499, 1, 1, 1, 1, 1,
-0.4774391, -0.4066485, -1.347803, 1, 1, 1, 1, 1,
-0.4756483, -1.148902, -1.770823, 1, 1, 1, 1, 1,
-0.4748688, 0.9498882, 0.173543, 1, 1, 1, 1, 1,
-0.4702134, -1.243799, -1.532536, 1, 1, 1, 1, 1,
-0.469687, -1.315444, -1.947311, 1, 1, 1, 1, 1,
-0.4696676, 0.9037433, 0.3337045, 1, 1, 1, 1, 1,
-0.4682998, -0.7397071, -3.276493, 1, 1, 1, 1, 1,
-0.4674942, 0.5956323, 0.04257613, 1, 1, 1, 1, 1,
-0.4660985, -0.284209, -1.096155, 1, 1, 1, 1, 1,
-0.464476, -0.7088928, -2.36666, 1, 1, 1, 1, 1,
-0.4592172, 1.848365, -0.9322869, 0, 0, 1, 1, 1,
-0.4550968, -0.229571, -2.394929, 1, 0, 0, 1, 1,
-0.4535106, 0.05609993, 0.2508603, 1, 0, 0, 1, 1,
-0.4510596, -1.205961, -1.941429, 1, 0, 0, 1, 1,
-0.4484891, -0.926462, -3.436466, 1, 0, 0, 1, 1,
-0.4472444, 1.340717, -0.6807739, 1, 0, 0, 1, 1,
-0.445006, -1.845124, -6.425119, 0, 0, 0, 1, 1,
-0.4443385, 1.149687, -1.663794, 0, 0, 0, 1, 1,
-0.4426616, -0.3310182, -4.072706, 0, 0, 0, 1, 1,
-0.4391496, 1.676939, 0.5387826, 0, 0, 0, 1, 1,
-0.4381347, -1.011537, -1.325742, 0, 0, 0, 1, 1,
-0.4356108, 0.4944161, -1.496252, 0, 0, 0, 1, 1,
-0.4325099, -0.2492661, -1.189745, 0, 0, 0, 1, 1,
-0.4320138, -1.056974, -2.958279, 1, 1, 1, 1, 1,
-0.4294365, -1.239567, -1.908017, 1, 1, 1, 1, 1,
-0.4294243, -0.5202093, -4.257679, 1, 1, 1, 1, 1,
-0.4255014, -0.4602421, -2.084084, 1, 1, 1, 1, 1,
-0.4189763, -0.197955, -1.315351, 1, 1, 1, 1, 1,
-0.4170776, -0.08956395, -2.176028, 1, 1, 1, 1, 1,
-0.4157855, 0.9468941, -0.1592638, 1, 1, 1, 1, 1,
-0.4132228, -0.1022492, -2.211282, 1, 1, 1, 1, 1,
-0.4122203, 2.304775, -1.108852, 1, 1, 1, 1, 1,
-0.4116831, 0.2040246, -1.334111, 1, 1, 1, 1, 1,
-0.4113287, 0.1414979, -0.7808364, 1, 1, 1, 1, 1,
-0.4055023, 1.863109, -0.7444956, 1, 1, 1, 1, 1,
-0.4046272, -0.8135516, -1.915123, 1, 1, 1, 1, 1,
-0.4026558, -2.348921, -2.768099, 1, 1, 1, 1, 1,
-0.4011753, -1.100388, -3.259688, 1, 1, 1, 1, 1,
-0.3919299, 0.7543878, 0.08267614, 0, 0, 1, 1, 1,
-0.3908367, -0.1316186, -1.571885, 1, 0, 0, 1, 1,
-0.3901495, -0.3145596, -3.615759, 1, 0, 0, 1, 1,
-0.3834459, -1.516328, -2.384765, 1, 0, 0, 1, 1,
-0.3817726, 1.286521, -0.1518677, 1, 0, 0, 1, 1,
-0.3798376, 2.276912, -0.4657056, 1, 0, 0, 1, 1,
-0.3777438, -0.4074106, -2.441984, 0, 0, 0, 1, 1,
-0.3771378, 0.4747855, -2.079865, 0, 0, 0, 1, 1,
-0.3749304, 0.4799271, -0.6349782, 0, 0, 0, 1, 1,
-0.3737945, 0.5728297, -0.9935497, 0, 0, 0, 1, 1,
-0.3737289, 0.6316345, -1.407864, 0, 0, 0, 1, 1,
-0.3716485, -1.243899, -4.707098, 0, 0, 0, 1, 1,
-0.3709386, -2.289993, -3.55665, 0, 0, 0, 1, 1,
-0.370793, 0.6394463, 0.1798157, 1, 1, 1, 1, 1,
-0.3699384, -1.268861, -3.798616, 1, 1, 1, 1, 1,
-0.3562588, -0.2275936, -2.509026, 1, 1, 1, 1, 1,
-0.3558473, 0.186174, -2.35415, 1, 1, 1, 1, 1,
-0.3552894, 0.3224228, -0.270399, 1, 1, 1, 1, 1,
-0.349064, 0.1677712, -0.9674441, 1, 1, 1, 1, 1,
-0.347796, -0.4865749, -3.776369, 1, 1, 1, 1, 1,
-0.3453566, -0.5211037, -4.057941, 1, 1, 1, 1, 1,
-0.3453021, 1.52382, 0.5396112, 1, 1, 1, 1, 1,
-0.3442513, 2.610977, -1.242805, 1, 1, 1, 1, 1,
-0.3388877, -0.8095514, -1.892081, 1, 1, 1, 1, 1,
-0.3327154, 0.436062, -1.845857, 1, 1, 1, 1, 1,
-0.3281309, 1.224668, -0.3077654, 1, 1, 1, 1, 1,
-0.3270303, -0.5380844, -3.308402, 1, 1, 1, 1, 1,
-0.3260325, 0.4370912, 0.4280772, 1, 1, 1, 1, 1,
-0.3131923, -1.410227, -3.613755, 0, 0, 1, 1, 1,
-0.3115103, -0.6452948, -3.54573, 1, 0, 0, 1, 1,
-0.3087223, -1.545266, -3.433726, 1, 0, 0, 1, 1,
-0.3084804, 0.04188857, -1.353543, 1, 0, 0, 1, 1,
-0.3082609, 1.885015, 0.03099179, 1, 0, 0, 1, 1,
-0.3079685, -0.255855, -1.868197, 1, 0, 0, 1, 1,
-0.3056003, 0.3822848, 0.3186792, 0, 0, 0, 1, 1,
-0.2976842, -0.3358986, -2.941102, 0, 0, 0, 1, 1,
-0.2975866, 0.6419789, -1.907735, 0, 0, 0, 1, 1,
-0.2968975, 0.5629517, 1.319309, 0, 0, 0, 1, 1,
-0.2959432, 1.077673, -0.4281151, 0, 0, 0, 1, 1,
-0.2908066, -0.2289087, -3.518815, 0, 0, 0, 1, 1,
-0.2883788, 0.006131629, -0.7303686, 0, 0, 0, 1, 1,
-0.284658, -1.104391, -3.397332, 1, 1, 1, 1, 1,
-0.2837303, 0.1093735, -1.70938, 1, 1, 1, 1, 1,
-0.2815048, -0.06850416, -1.069525, 1, 1, 1, 1, 1,
-0.2791396, -1.554597, -3.302791, 1, 1, 1, 1, 1,
-0.2786592, -0.8989329, -3.040229, 1, 1, 1, 1, 1,
-0.2782478, -0.01802722, -1.792796, 1, 1, 1, 1, 1,
-0.2700704, 0.1340192, -1.129301, 1, 1, 1, 1, 1,
-0.2698517, -0.8477308, -1.903913, 1, 1, 1, 1, 1,
-0.2680736, -2.298335, -2.808447, 1, 1, 1, 1, 1,
-0.2679504, 0.6093676, -0.4223258, 1, 1, 1, 1, 1,
-0.2664928, -0.3193893, -1.238225, 1, 1, 1, 1, 1,
-0.2651565, 0.9277128, 1.210633, 1, 1, 1, 1, 1,
-0.2643653, -0.0706148, -0.06507278, 1, 1, 1, 1, 1,
-0.2626971, -1.557227, -2.013418, 1, 1, 1, 1, 1,
-0.2626203, 0.5287045, -1.256391, 1, 1, 1, 1, 1,
-0.2580675, -0.5667767, -2.730956, 0, 0, 1, 1, 1,
-0.25783, 0.6167722, 0.4897724, 1, 0, 0, 1, 1,
-0.257631, -0.8342031, -4.048559, 1, 0, 0, 1, 1,
-0.2575698, -0.7366074, -4.066939, 1, 0, 0, 1, 1,
-0.2465587, -0.3193646, -4.371205, 1, 0, 0, 1, 1,
-0.2397057, -0.123003, -2.551341, 1, 0, 0, 1, 1,
-0.2382147, -1.257348, -3.704869, 0, 0, 0, 1, 1,
-0.2372402, 1.800134, 0.2410655, 0, 0, 0, 1, 1,
-0.2353269, -0.848954, -2.894715, 0, 0, 0, 1, 1,
-0.234168, -1.152709, -3.087319, 0, 0, 0, 1, 1,
-0.2293346, -1.257561, -4.072252, 0, 0, 0, 1, 1,
-0.2271497, 0.06771345, -2.398847, 0, 0, 0, 1, 1,
-0.2265802, 1.679604, 0.2736918, 0, 0, 0, 1, 1,
-0.2249396, 0.4908441, -0.3910423, 1, 1, 1, 1, 1,
-0.2226654, 0.05734766, -1.44013, 1, 1, 1, 1, 1,
-0.2221287, -0.6406971, -1.273888, 1, 1, 1, 1, 1,
-0.2210608, -0.7695604, -3.746498, 1, 1, 1, 1, 1,
-0.2208255, 0.4244285, -1.677439, 1, 1, 1, 1, 1,
-0.217854, -0.6703007, -3.768653, 1, 1, 1, 1, 1,
-0.2148077, 0.1114926, -1.247817, 1, 1, 1, 1, 1,
-0.2122548, -0.5887226, -2.186879, 1, 1, 1, 1, 1,
-0.2108149, 0.2454821, 0.286317, 1, 1, 1, 1, 1,
-0.2085763, 0.9504229, 0.3460868, 1, 1, 1, 1, 1,
-0.2067752, 0.4120364, -1.897838, 1, 1, 1, 1, 1,
-0.2063244, 1.006552, 0.2591547, 1, 1, 1, 1, 1,
-0.2019291, 0.2735161, -1.717831, 1, 1, 1, 1, 1,
-0.2002333, 0.4680188, -0.426878, 1, 1, 1, 1, 1,
-0.1990066, -1.145168, -2.714765, 1, 1, 1, 1, 1,
-0.1978973, 0.7505212, 0.4594811, 0, 0, 1, 1, 1,
-0.1927946, -0.06452828, -1.268526, 1, 0, 0, 1, 1,
-0.1904031, -0.5110517, -0.5805813, 1, 0, 0, 1, 1,
-0.1897835, 0.8652685, -0.4678705, 1, 0, 0, 1, 1,
-0.1836506, -1.276586, -2.321694, 1, 0, 0, 1, 1,
-0.1773982, -0.5967822, -0.8702203, 1, 0, 0, 1, 1,
-0.1764851, -1.166214, -4.09317, 0, 0, 0, 1, 1,
-0.1763012, 0.8988739, 0.7193865, 0, 0, 0, 1, 1,
-0.1717036, -0.3019505, -2.874636, 0, 0, 0, 1, 1,
-0.1715039, 1.675505, -0.02147794, 0, 0, 0, 1, 1,
-0.1705548, -0.112104, -0.7047132, 0, 0, 0, 1, 1,
-0.1675888, 1.029084, -0.8937991, 0, 0, 0, 1, 1,
-0.1671278, -0.7076353, -3.838556, 0, 0, 0, 1, 1,
-0.1653667, -0.6873235, -0.1564103, 1, 1, 1, 1, 1,
-0.1644123, 0.745564, -0.4111359, 1, 1, 1, 1, 1,
-0.1637648, 1.636981, 1.829667, 1, 1, 1, 1, 1,
-0.1609144, -0.6246167, -4.172602, 1, 1, 1, 1, 1,
-0.1557169, 0.4036672, -1.524754, 1, 1, 1, 1, 1,
-0.1553924, 2.364798, -0.7810385, 1, 1, 1, 1, 1,
-0.1550011, -1.617922, -3.706399, 1, 1, 1, 1, 1,
-0.1541164, -0.9690012, -1.796958, 1, 1, 1, 1, 1,
-0.1469661, -0.3587872, -1.944334, 1, 1, 1, 1, 1,
-0.1443447, 2.784246, -1.127802, 1, 1, 1, 1, 1,
-0.1384324, 1.462394, 1.418023, 1, 1, 1, 1, 1,
-0.1378907, 0.6993988, 1.042953, 1, 1, 1, 1, 1,
-0.1356294, 1.139413, 0.4062624, 1, 1, 1, 1, 1,
-0.1353263, -1.474239, -1.328089, 1, 1, 1, 1, 1,
-0.1288397, 1.992563, 0.4707386, 1, 1, 1, 1, 1,
-0.1282201, -0.0862126, -1.255787, 0, 0, 1, 1, 1,
-0.1274244, 1.098643, -1.272976, 1, 0, 0, 1, 1,
-0.1245919, 0.8688059, 0.6687969, 1, 0, 0, 1, 1,
-0.1245487, -1.00823, -4.495672, 1, 0, 0, 1, 1,
-0.1204143, -0.6513788, -4.561888, 1, 0, 0, 1, 1,
-0.119744, 0.2576039, -0.4463457, 1, 0, 0, 1, 1,
-0.1167269, 0.1185622, -2.455442, 0, 0, 0, 1, 1,
-0.1153081, 0.8915179, 0.6494507, 0, 0, 0, 1, 1,
-0.1144948, 0.2223984, -0.4155356, 0, 0, 0, 1, 1,
-0.1060577, -0.07433058, -1.420115, 0, 0, 0, 1, 1,
-0.1046455, -0.0006690684, -0.1362589, 0, 0, 0, 1, 1,
-0.1024938, -0.1549661, -3.548756, 0, 0, 0, 1, 1,
-0.09823018, -1.048674, -3.125757, 0, 0, 0, 1, 1,
-0.09593236, -0.08977452, -1.393189, 1, 1, 1, 1, 1,
-0.09506394, -1.280405, -2.981564, 1, 1, 1, 1, 1,
-0.09348174, -1.207158, -2.603315, 1, 1, 1, 1, 1,
-0.09311422, 0.8115901, -0.3937653, 1, 1, 1, 1, 1,
-0.09062959, 0.3084743, -0.9634706, 1, 1, 1, 1, 1,
-0.08839159, -1.325963, -1.507883, 1, 1, 1, 1, 1,
-0.08776356, 0.5791777, -0.6117931, 1, 1, 1, 1, 1,
-0.0876663, -0.9756924, -3.460031, 1, 1, 1, 1, 1,
-0.08271709, 0.6355528, 0.04358839, 1, 1, 1, 1, 1,
-0.08155848, 0.5182824, -0.8909916, 1, 1, 1, 1, 1,
-0.0807981, -1.422977, -3.890245, 1, 1, 1, 1, 1,
-0.08023781, 1.745984, 2.750047, 1, 1, 1, 1, 1,
-0.07982627, -1.315031, -1.523541, 1, 1, 1, 1, 1,
-0.07878119, 0.6758789, -1.645677, 1, 1, 1, 1, 1,
-0.07709427, -0.1659421, -1.969892, 1, 1, 1, 1, 1,
-0.0768232, -1.07955, -3.061148, 0, 0, 1, 1, 1,
-0.07628019, -0.626987, -4.930754, 1, 0, 0, 1, 1,
-0.07560142, -1.400128, -4.954989, 1, 0, 0, 1, 1,
-0.07420608, -0.04450001, -2.784659, 1, 0, 0, 1, 1,
-0.07241219, -1.036256, -0.7048199, 1, 0, 0, 1, 1,
-0.07076688, -0.3195706, -3.124394, 1, 0, 0, 1, 1,
-0.06794593, 0.5060766, 0.5445347, 0, 0, 0, 1, 1,
-0.06613228, 0.3904603, -0.04661994, 0, 0, 0, 1, 1,
-0.06487991, 1.198799, 1.157541, 0, 0, 0, 1, 1,
-0.06331241, -0.2512611, -2.624518, 0, 0, 0, 1, 1,
-0.05697258, -0.9548455, -3.680229, 0, 0, 0, 1, 1,
-0.05691838, 0.4871054, -0.1848056, 0, 0, 0, 1, 1,
-0.05630737, -0.259763, -3.888636, 0, 0, 0, 1, 1,
-0.05274361, -0.2633239, -2.983709, 1, 1, 1, 1, 1,
-0.04360552, -0.07412654, -2.610162, 1, 1, 1, 1, 1,
-0.04311465, 0.205819, -0.3926757, 1, 1, 1, 1, 1,
-0.04305423, -0.3617767, -3.739388, 1, 1, 1, 1, 1,
-0.03807399, 0.5564808, -0.2186013, 1, 1, 1, 1, 1,
-0.03743502, -0.2507862, -3.694956, 1, 1, 1, 1, 1,
-0.02558505, 0.8246064, -1.073463, 1, 1, 1, 1, 1,
-0.02545708, -0.4279997, -2.50167, 1, 1, 1, 1, 1,
-0.01899681, 0.004632922, -0.4451471, 1, 1, 1, 1, 1,
-0.01477345, 0.178421, 0.5862486, 1, 1, 1, 1, 1,
-0.01056755, 0.2090284, 0.05005962, 1, 1, 1, 1, 1,
0.0005245292, -0.08425452, 2.939638, 1, 1, 1, 1, 1,
0.00087456, 0.6962292, 1.312514, 1, 1, 1, 1, 1,
0.004154619, -1.043694, 3.237085, 1, 1, 1, 1, 1,
0.004539401, 0.5084228, 0.9761248, 1, 1, 1, 1, 1,
0.005109303, -0.02460999, 3.575485, 0, 0, 1, 1, 1,
0.00655304, 0.253456, 1.576723, 1, 0, 0, 1, 1,
0.009738804, -0.4366725, 4.218236, 1, 0, 0, 1, 1,
0.01380596, 0.4532109, 0.04160591, 1, 0, 0, 1, 1,
0.01462449, 2.127075, -0.6267177, 1, 0, 0, 1, 1,
0.02233807, -2.144203, 2.432636, 1, 0, 0, 1, 1,
0.02489415, -0.07017113, 1.974317, 0, 0, 0, 1, 1,
0.0249075, 0.04329524, -0.07741306, 0, 0, 0, 1, 1,
0.02915564, 0.9529424, 0.857934, 0, 0, 0, 1, 1,
0.03292664, -0.5955193, 2.188219, 0, 0, 0, 1, 1,
0.03329223, -0.7371539, 2.397928, 0, 0, 0, 1, 1,
0.03549856, -0.08138809, 3.316081, 0, 0, 0, 1, 1,
0.03672747, -0.4141468, 3.082839, 0, 0, 0, 1, 1,
0.03746261, -0.2358313, 0.2885421, 1, 1, 1, 1, 1,
0.03987259, 0.4326678, -0.3315744, 1, 1, 1, 1, 1,
0.04382611, -0.5554824, 2.900872, 1, 1, 1, 1, 1,
0.04603942, 1.466622, 0.7884818, 1, 1, 1, 1, 1,
0.04988148, -0.7073032, 2.024746, 1, 1, 1, 1, 1,
0.0513972, -0.8460711, 1.68605, 1, 1, 1, 1, 1,
0.05689246, 1.365868, -0.1110634, 1, 1, 1, 1, 1,
0.05959634, -1.641489, 2.803192, 1, 1, 1, 1, 1,
0.05984918, -1.569804, 1.197951, 1, 1, 1, 1, 1,
0.06622757, -0.9626321, 2.920952, 1, 1, 1, 1, 1,
0.07079115, -0.07596636, 2.500423, 1, 1, 1, 1, 1,
0.07502177, 1.576514, -0.09780452, 1, 1, 1, 1, 1,
0.07624488, -1.762542, 3.646795, 1, 1, 1, 1, 1,
0.07803017, -0.8989989, 3.869521, 1, 1, 1, 1, 1,
0.0796637, -1.189273, 2.986818, 1, 1, 1, 1, 1,
0.08287034, 0.01304315, -1.279147, 0, 0, 1, 1, 1,
0.08478305, 0.3166974, 0.7313398, 1, 0, 0, 1, 1,
0.0854451, -0.2865524, 2.19652, 1, 0, 0, 1, 1,
0.09140677, 0.620364, 0.9932013, 1, 0, 0, 1, 1,
0.09304065, 0.7737014, 0.4056776, 1, 0, 0, 1, 1,
0.09671679, -1.279864, 3.351369, 1, 0, 0, 1, 1,
0.09723812, 0.5577886, -1.645332, 0, 0, 0, 1, 1,
0.09877786, 0.8517302, -0.1433458, 0, 0, 0, 1, 1,
0.09917769, 1.455724, 0.4721828, 0, 0, 0, 1, 1,
0.09984951, 1.286677, 0.2927678, 0, 0, 0, 1, 1,
0.1017157, 0.9560634, -1.231018, 0, 0, 0, 1, 1,
0.1037441, -1.965028, 2.604937, 0, 0, 0, 1, 1,
0.1089358, 1.058474, -0.0751645, 0, 0, 0, 1, 1,
0.1113824, 0.4745309, 1.24613, 1, 1, 1, 1, 1,
0.1122266, 0.5168312, -0.2556127, 1, 1, 1, 1, 1,
0.1165782, 0.5974606, -0.8691198, 1, 1, 1, 1, 1,
0.1189329, -1.570748, 1.67644, 1, 1, 1, 1, 1,
0.1215021, -0.8322054, 2.263377, 1, 1, 1, 1, 1,
0.1215563, 0.4905939, 0.6145757, 1, 1, 1, 1, 1,
0.1259804, 0.1362561, -1.039518, 1, 1, 1, 1, 1,
0.1338573, 2.856328, -0.2086331, 1, 1, 1, 1, 1,
0.1349048, 1.392801, -0.07153918, 1, 1, 1, 1, 1,
0.1387079, 0.2539527, 0.1500398, 1, 1, 1, 1, 1,
0.141412, -0.1295271, 1.832226, 1, 1, 1, 1, 1,
0.1445019, 0.5224986, 0.2848106, 1, 1, 1, 1, 1,
0.145993, -1.506671, 4.011901, 1, 1, 1, 1, 1,
0.1459974, 1.326037, -1.100624, 1, 1, 1, 1, 1,
0.1488135, 1.855582, -0.5408906, 1, 1, 1, 1, 1,
0.1489197, -0.1147488, 0.8521676, 0, 0, 1, 1, 1,
0.1492608, -0.5334001, 1.487567, 1, 0, 0, 1, 1,
0.1526356, 0.5473946, -0.5908204, 1, 0, 0, 1, 1,
0.1549362, 0.08212402, 0.2040252, 1, 0, 0, 1, 1,
0.1564693, 0.4621466, 0.4606602, 1, 0, 0, 1, 1,
0.1575736, 0.1653221, 0.9048156, 1, 0, 0, 1, 1,
0.1582818, 0.4867109, -1.134252, 0, 0, 0, 1, 1,
0.1584513, 0.4150755, 1.939638, 0, 0, 0, 1, 1,
0.1604067, -0.7910173, 3.075937, 0, 0, 0, 1, 1,
0.1611778, -0.3025874, 2.754079, 0, 0, 0, 1, 1,
0.1654553, -0.2159865, 3.872492, 0, 0, 0, 1, 1,
0.1677954, -0.2359744, 1.32098, 0, 0, 0, 1, 1,
0.1702575, 0.1426488, 2.051217, 0, 0, 0, 1, 1,
0.1739241, -0.5263147, 1.057719, 1, 1, 1, 1, 1,
0.1755585, 1.105627, -1.659838, 1, 1, 1, 1, 1,
0.1755837, -0.9587653, 3.259776, 1, 1, 1, 1, 1,
0.1767441, 0.2444339, 0.8972137, 1, 1, 1, 1, 1,
0.1802177, -1.252169, 2.426679, 1, 1, 1, 1, 1,
0.1815731, -0.3800011, 3.075482, 1, 1, 1, 1, 1,
0.1844863, -0.190024, 3.057835, 1, 1, 1, 1, 1,
0.1860195, -0.2516401, 0.204096, 1, 1, 1, 1, 1,
0.1911061, -0.9259014, 1.713651, 1, 1, 1, 1, 1,
0.1918922, -0.6127398, 3.199547, 1, 1, 1, 1, 1,
0.1939357, -0.8604867, 1.54757, 1, 1, 1, 1, 1,
0.1954824, 0.1071924, 2.520543, 1, 1, 1, 1, 1,
0.1955193, -0.5822322, 4.611099, 1, 1, 1, 1, 1,
0.1982538, 0.01383101, 2.253972, 1, 1, 1, 1, 1,
0.2005515, 0.1334246, 1.109639, 1, 1, 1, 1, 1,
0.2026556, 0.821906, 1.952165, 0, 0, 1, 1, 1,
0.2087785, 1.101971, -0.4474403, 1, 0, 0, 1, 1,
0.2103218, -0.1681941, 0.672143, 1, 0, 0, 1, 1,
0.2134948, -0.2152283, 0.7794888, 1, 0, 0, 1, 1,
0.2186174, 1.046458, -1.230348, 1, 0, 0, 1, 1,
0.2194629, 0.68737, 1.190794, 1, 0, 0, 1, 1,
0.2195137, -0.4495507, 2.475417, 0, 0, 0, 1, 1,
0.2202809, 0.6496729, 1.598629, 0, 0, 0, 1, 1,
0.2226312, 0.3048674, 1.087851, 0, 0, 0, 1, 1,
0.2273343, 1.79866, 0.02500516, 0, 0, 0, 1, 1,
0.2310972, 0.3888363, -0.7967338, 0, 0, 0, 1, 1,
0.2322088, 0.001718721, 2.177106, 0, 0, 0, 1, 1,
0.2324895, 0.05738747, 2.522525, 0, 0, 0, 1, 1,
0.234577, 0.7428631, 0.7248286, 1, 1, 1, 1, 1,
0.2351472, -0.7803307, 2.481878, 1, 1, 1, 1, 1,
0.2389165, 2.565479, 0.8235211, 1, 1, 1, 1, 1,
0.2433765, -0.934098, 2.170396, 1, 1, 1, 1, 1,
0.2481518, 0.3854191, 0.6846224, 1, 1, 1, 1, 1,
0.2509142, 0.7954854, -1.229635, 1, 1, 1, 1, 1,
0.2548851, 0.4920479, 1.30304, 1, 1, 1, 1, 1,
0.2550011, -0.7687683, 4.155912, 1, 1, 1, 1, 1,
0.255233, 1.884982, 0.6014434, 1, 1, 1, 1, 1,
0.2574447, 0.9793733, -0.1987923, 1, 1, 1, 1, 1,
0.2582833, -1.424334, 2.507221, 1, 1, 1, 1, 1,
0.2628235, -0.3288888, 1.529431, 1, 1, 1, 1, 1,
0.2674354, -0.4845374, -0.5620042, 1, 1, 1, 1, 1,
0.268654, 0.7017912, -1.350704, 1, 1, 1, 1, 1,
0.2710919, -0.2489513, 2.244762, 1, 1, 1, 1, 1,
0.2734802, 0.4908893, -0.73397, 0, 0, 1, 1, 1,
0.2783895, 1.1079, 0.1782747, 1, 0, 0, 1, 1,
0.2789024, -0.8101854, 3.971099, 1, 0, 0, 1, 1,
0.280905, 0.5399552, 0.854917, 1, 0, 0, 1, 1,
0.2811326, 0.7606112, 1.679657, 1, 0, 0, 1, 1,
0.2827237, 0.6114175, -0.4823397, 1, 0, 0, 1, 1,
0.2840818, -0.3271341, 1.9569, 0, 0, 0, 1, 1,
0.2846517, 0.8893152, 0.3980407, 0, 0, 0, 1, 1,
0.2850419, 0.8113007, 0.2875576, 0, 0, 0, 1, 1,
0.2878238, -0.8712889, 2.416556, 0, 0, 0, 1, 1,
0.2888383, -1.566064, 2.455155, 0, 0, 0, 1, 1,
0.292993, -0.9748595, 3.192234, 0, 0, 0, 1, 1,
0.2948331, 0.4156033, 1.63445, 0, 0, 0, 1, 1,
0.2972822, 0.6418875, 1.183757, 1, 1, 1, 1, 1,
0.2978909, -1.374827, 3.269263, 1, 1, 1, 1, 1,
0.3025155, 0.7704608, 0.7151778, 1, 1, 1, 1, 1,
0.305087, 0.09463361, 1.365954, 1, 1, 1, 1, 1,
0.3057, -0.1100016, 0.8393012, 1, 1, 1, 1, 1,
0.3089117, 1.23154, -2.013888, 1, 1, 1, 1, 1,
0.3127895, 0.6216161, -0.2513198, 1, 1, 1, 1, 1,
0.3151078, 0.4331712, 1.410549, 1, 1, 1, 1, 1,
0.3178629, -0.4785747, 1.780969, 1, 1, 1, 1, 1,
0.3203017, -0.8027027, 1.831665, 1, 1, 1, 1, 1,
0.3215316, 0.2650031, 0.6197422, 1, 1, 1, 1, 1,
0.3218405, -0.8499823, 3.752991, 1, 1, 1, 1, 1,
0.3261943, -0.740694, 3.98807, 1, 1, 1, 1, 1,
0.3289325, 0.01477441, -1.646045, 1, 1, 1, 1, 1,
0.3305897, -0.4117915, 1.917794, 1, 1, 1, 1, 1,
0.3309142, 0.2153343, 0.430988, 0, 0, 1, 1, 1,
0.3338234, 0.5139963, 0.4382105, 1, 0, 0, 1, 1,
0.3356638, 0.5018572, 0.3971519, 1, 0, 0, 1, 1,
0.3377171, 0.1033869, 1.764288, 1, 0, 0, 1, 1,
0.3487372, -0.550459, 2.937644, 1, 0, 0, 1, 1,
0.3500192, 0.3859986, 0.4913759, 1, 0, 0, 1, 1,
0.3529021, 0.3537757, -0.8942869, 0, 0, 0, 1, 1,
0.3544016, -1.146047, 0.9273065, 0, 0, 0, 1, 1,
0.3571148, -1.512331, 4.62032, 0, 0, 0, 1, 1,
0.3598139, 2.119514, 0.06691249, 0, 0, 0, 1, 1,
0.3600996, -0.4047494, 1.936933, 0, 0, 0, 1, 1,
0.3602846, 0.8499023, 0.7780333, 0, 0, 0, 1, 1,
0.362948, -0.1772879, 3.392627, 0, 0, 0, 1, 1,
0.3643669, -0.7276658, 3.64106, 1, 1, 1, 1, 1,
0.3685574, 0.8651351, -0.1285214, 1, 1, 1, 1, 1,
0.3686139, -0.1439003, -0.356526, 1, 1, 1, 1, 1,
0.370619, -0.5676476, 2.586499, 1, 1, 1, 1, 1,
0.3716779, -1.38426, 3.160247, 1, 1, 1, 1, 1,
0.37475, -0.4961388, 1.107208, 1, 1, 1, 1, 1,
0.3760504, 2.119, -1.540233, 1, 1, 1, 1, 1,
0.3762927, -1.552997, 3.903973, 1, 1, 1, 1, 1,
0.3773042, 1.009185, -0.5158975, 1, 1, 1, 1, 1,
0.3813455, -0.7128294, 4.11114, 1, 1, 1, 1, 1,
0.3817906, -0.06182455, 2.160166, 1, 1, 1, 1, 1,
0.3832993, 0.1825025, 1.187987, 1, 1, 1, 1, 1,
0.3852352, -0.7737894, 2.575663, 1, 1, 1, 1, 1,
0.3870246, 0.4687334, 0.9844829, 1, 1, 1, 1, 1,
0.3871193, 0.2643196, 0.896622, 1, 1, 1, 1, 1,
0.3876134, 0.5269989, 0.8980747, 0, 0, 1, 1, 1,
0.3979787, -0.4223154, 1.694347, 1, 0, 0, 1, 1,
0.3985761, 1.44899, 0.5864224, 1, 0, 0, 1, 1,
0.4018717, 0.365413, 1.66497, 1, 0, 0, 1, 1,
0.4030039, -0.5667264, 3.933633, 1, 0, 0, 1, 1,
0.4064532, 0.01380225, -0.03816185, 1, 0, 0, 1, 1,
0.4069146, -0.6967933, 1.528548, 0, 0, 0, 1, 1,
0.4077695, 0.5281128, 1.507587, 0, 0, 0, 1, 1,
0.4123553, 1.68445, -1.110897, 0, 0, 0, 1, 1,
0.4129595, -0.9822512, 3.64827, 0, 0, 0, 1, 1,
0.4140944, -0.1714367, 1.475184, 0, 0, 0, 1, 1,
0.4172032, 0.8090781, 0.3772871, 0, 0, 0, 1, 1,
0.4198449, -1.322168, 2.19612, 0, 0, 0, 1, 1,
0.4208875, 0.8637754, 0.399605, 1, 1, 1, 1, 1,
0.4261652, -0.5436754, 1.468461, 1, 1, 1, 1, 1,
0.4281943, -0.1556648, 3.184896, 1, 1, 1, 1, 1,
0.4316047, 0.8249442, 0.4831079, 1, 1, 1, 1, 1,
0.4344866, 0.740704, 0.790494, 1, 1, 1, 1, 1,
0.4347917, -2.045942, 1.533369, 1, 1, 1, 1, 1,
0.4416138, 1.761225, -0.3744702, 1, 1, 1, 1, 1,
0.444841, -1.404936, 4.377103, 1, 1, 1, 1, 1,
0.448962, -0.3804609, 0.04623787, 1, 1, 1, 1, 1,
0.4551935, -1.074629, 4.030831, 1, 1, 1, 1, 1,
0.4553686, -1.176533, 4.670956, 1, 1, 1, 1, 1,
0.4598137, 0.3058206, 1.659592, 1, 1, 1, 1, 1,
0.4632732, -0.592307, 1.811639, 1, 1, 1, 1, 1,
0.4664416, 1.726217, -1.194634, 1, 1, 1, 1, 1,
0.4681832, -1.03783, 2.432899, 1, 1, 1, 1, 1,
0.468373, 0.1831575, 1.355815, 0, 0, 1, 1, 1,
0.4688326, 0.2041729, 2.479412, 1, 0, 0, 1, 1,
0.4764389, 0.0931517, 2.881669, 1, 0, 0, 1, 1,
0.4772428, -0.3548433, 2.925133, 1, 0, 0, 1, 1,
0.4772986, 0.4581721, -0.6877806, 1, 0, 0, 1, 1,
0.4858207, 0.9562435, 0.1085021, 1, 0, 0, 1, 1,
0.4904372, -0.3426851, 1.284567, 0, 0, 0, 1, 1,
0.4935308, -1.352116, 1.692837, 0, 0, 0, 1, 1,
0.4949034, 0.7478951, 0.5612302, 0, 0, 0, 1, 1,
0.4986388, 0.7228162, 1.742261, 0, 0, 0, 1, 1,
0.5001509, -0.9912615, 2.894926, 0, 0, 0, 1, 1,
0.504428, -2.158197, 1.664381, 0, 0, 0, 1, 1,
0.5224131, 0.3961257, 2.313213, 0, 0, 0, 1, 1,
0.5239797, 0.2035293, 0.5410209, 1, 1, 1, 1, 1,
0.5294983, -1.19575, 2.633044, 1, 1, 1, 1, 1,
0.5298612, -0.01342428, 1.959765, 1, 1, 1, 1, 1,
0.531536, 0.7582111, 0.5769278, 1, 1, 1, 1, 1,
0.5378991, 0.1016974, -1.232794, 1, 1, 1, 1, 1,
0.5388789, -0.4504263, 2.688519, 1, 1, 1, 1, 1,
0.5418355, -1.134325, 3.121714, 1, 1, 1, 1, 1,
0.5439218, -0.1585921, 3.494702, 1, 1, 1, 1, 1,
0.5447361, -0.3754235, 1.816602, 1, 1, 1, 1, 1,
0.550456, 1.357595, 1.610139, 1, 1, 1, 1, 1,
0.5536569, 0.7297815, 0.7779585, 1, 1, 1, 1, 1,
0.555402, -0.7302586, 1.316403, 1, 1, 1, 1, 1,
0.5587053, 0.2480647, 1.852359, 1, 1, 1, 1, 1,
0.5615128, 1.231568, 0.2390319, 1, 1, 1, 1, 1,
0.5636799, -1.093936, 4.231271, 1, 1, 1, 1, 1,
0.5652024, 0.2961159, 2.168356, 0, 0, 1, 1, 1,
0.5653281, 0.5302714, 0.05238171, 1, 0, 0, 1, 1,
0.5673184, -0.6390325, 2.215822, 1, 0, 0, 1, 1,
0.5729236, 0.1823548, 0.9283651, 1, 0, 0, 1, 1,
0.5782424, -0.922281, 2.180737, 1, 0, 0, 1, 1,
0.5790982, 1.728299, 0.663474, 1, 0, 0, 1, 1,
0.5857885, -0.2296186, 2.357026, 0, 0, 0, 1, 1,
0.5859591, -1.421089, 1.450959, 0, 0, 0, 1, 1,
0.587649, 0.3706543, -0.1426363, 0, 0, 0, 1, 1,
0.5893994, 1.021314, 0.9115663, 0, 0, 0, 1, 1,
0.5916024, -0.08351389, 4.312691, 0, 0, 0, 1, 1,
0.5916455, -0.4753477, 2.034993, 0, 0, 0, 1, 1,
0.5988883, 1.22707, 1.55313, 0, 0, 0, 1, 1,
0.6021441, 1.637795, 0.6351027, 1, 1, 1, 1, 1,
0.6043532, 0.02045229, 2.5393, 1, 1, 1, 1, 1,
0.6101005, 1.282304, 0.7736715, 1, 1, 1, 1, 1,
0.6108394, -0.0002687633, 3.375282, 1, 1, 1, 1, 1,
0.6120695, 0.6503085, 1.238913, 1, 1, 1, 1, 1,
0.6163608, 0.1684867, 1.132498, 1, 1, 1, 1, 1,
0.6193965, -0.9173537, 2.165037, 1, 1, 1, 1, 1,
0.6221197, -1.587249, 1.413209, 1, 1, 1, 1, 1,
0.6278771, -0.851768, 2.21935, 1, 1, 1, 1, 1,
0.6286409, 0.6812623, 1.180812, 1, 1, 1, 1, 1,
0.6297731, -1.047727, 2.951539, 1, 1, 1, 1, 1,
0.6314598, 0.1669263, 0.7690671, 1, 1, 1, 1, 1,
0.6325766, -0.3588797, 1.690746, 1, 1, 1, 1, 1,
0.6440055, 1.697652, 1.244869, 1, 1, 1, 1, 1,
0.6452727, 1.313364, 0.1301287, 1, 1, 1, 1, 1,
0.6461565, 0.785278, 0.4711772, 0, 0, 1, 1, 1,
0.6519461, 1.247375, -0.5562191, 1, 0, 0, 1, 1,
0.6536757, -0.07264183, 3.280757, 1, 0, 0, 1, 1,
0.659974, 0.9548489, 0.672713, 1, 0, 0, 1, 1,
0.6666278, -1.39325, 1.89656, 1, 0, 0, 1, 1,
0.6689776, 0.8773548, 2.683561, 1, 0, 0, 1, 1,
0.6691478, -0.2180918, 3.000966, 0, 0, 0, 1, 1,
0.672709, 0.5654578, -0.4846952, 0, 0, 0, 1, 1,
0.6727284, 0.08927249, 0.9038187, 0, 0, 0, 1, 1,
0.6783476, -0.2564116, 1.415961, 0, 0, 0, 1, 1,
0.6820932, 0.5289876, 0.6647496, 0, 0, 0, 1, 1,
0.6829371, -0.7325521, 2.990545, 0, 0, 0, 1, 1,
0.6856699, 0.5242868, 0.5248906, 0, 0, 0, 1, 1,
0.6861082, -0.5211655, 3.602248, 1, 1, 1, 1, 1,
0.6906533, -0.7647587, 2.163022, 1, 1, 1, 1, 1,
0.6931779, -2.130119, 1.294518, 1, 1, 1, 1, 1,
0.7013627, -0.5127443, 0.7927663, 1, 1, 1, 1, 1,
0.7033041, 1.033118, -1.186036, 1, 1, 1, 1, 1,
0.7057577, -0.3252917, -0.2600809, 1, 1, 1, 1, 1,
0.7087768, -0.3077184, 1.848242, 1, 1, 1, 1, 1,
0.7109281, 2.066355, 0.1215237, 1, 1, 1, 1, 1,
0.7152291, -1.193201, 2.614586, 1, 1, 1, 1, 1,
0.7207563, -1.801209, 2.034436, 1, 1, 1, 1, 1,
0.7233593, 0.06999906, 1.245612, 1, 1, 1, 1, 1,
0.7235017, -2.712328, 1.845283, 1, 1, 1, 1, 1,
0.740037, 2.16365, 1.294875, 1, 1, 1, 1, 1,
0.7402365, -0.5746853, 2.111059, 1, 1, 1, 1, 1,
0.7436596, -1.20663, 2.505786, 1, 1, 1, 1, 1,
0.7468022, 0.4968673, 1.307992, 0, 0, 1, 1, 1,
0.7653645, 0.7751622, -0.2511259, 1, 0, 0, 1, 1,
0.7692587, 1.536574, 0.03988673, 1, 0, 0, 1, 1,
0.7742977, 1.794284, 2.313318, 1, 0, 0, 1, 1,
0.7746168, 0.8018232, 0.4875392, 1, 0, 0, 1, 1,
0.7746966, 1.540093, 1.078929, 1, 0, 0, 1, 1,
0.7754998, 0.897997, 1.408557, 0, 0, 0, 1, 1,
0.7877972, -1.806158, 2.015644, 0, 0, 0, 1, 1,
0.7889523, 2.423883, 1.176686, 0, 0, 0, 1, 1,
0.7904828, -1.045398, 1.958107, 0, 0, 0, 1, 1,
0.7914536, -1.666175, 2.531425, 0, 0, 0, 1, 1,
0.7915833, 0.7959499, 1.909436, 0, 0, 0, 1, 1,
0.7945282, -1.889634, 3.4453, 0, 0, 0, 1, 1,
0.8011646, -0.8331856, 2.442422, 1, 1, 1, 1, 1,
0.8078135, -0.3667503, 2.433181, 1, 1, 1, 1, 1,
0.8116909, -0.1507834, 1.148524, 1, 1, 1, 1, 1,
0.814447, -1.401754, 3.846859, 1, 1, 1, 1, 1,
0.8157104, -0.9191072, 4.313472, 1, 1, 1, 1, 1,
0.8163528, -0.509371, 2.00203, 1, 1, 1, 1, 1,
0.8172264, 0.2786651, 0.4935913, 1, 1, 1, 1, 1,
0.8315248, -2.118348, 3.409643, 1, 1, 1, 1, 1,
0.8324056, 0.9290218, -0.5486882, 1, 1, 1, 1, 1,
0.8326561, 0.8905544, 1.97376, 1, 1, 1, 1, 1,
0.8355579, 1.18584, 1.122401, 1, 1, 1, 1, 1,
0.8392261, -1.641905, 4.810231, 1, 1, 1, 1, 1,
0.8394185, 0.1592985, 2.077528, 1, 1, 1, 1, 1,
0.8454099, -0.6599823, 3.202557, 1, 1, 1, 1, 1,
0.8488268, 0.1686424, -0.1473477, 1, 1, 1, 1, 1,
0.8558331, 0.2988806, 0.7238899, 0, 0, 1, 1, 1,
0.858014, -0.6048803, 3.661121, 1, 0, 0, 1, 1,
0.8635093, 0.6071864, 1.888644, 1, 0, 0, 1, 1,
0.8653019, 0.8759679, 0.6509326, 1, 0, 0, 1, 1,
0.8723236, 1.066825, 2.52261, 1, 0, 0, 1, 1,
0.8778843, -0.6161622, 2.123264, 1, 0, 0, 1, 1,
0.8858871, -0.4895354, 0.6431707, 0, 0, 0, 1, 1,
0.8909434, 2.156439, 0.6743173, 0, 0, 0, 1, 1,
0.8960091, -0.5910928, 0.596457, 0, 0, 0, 1, 1,
0.9062749, 0.8934221, 0.6780272, 0, 0, 0, 1, 1,
0.90874, -1.055815, 3.330317, 0, 0, 0, 1, 1,
0.919793, -0.2246468, 1.310032, 0, 0, 0, 1, 1,
0.9276077, 0.6278052, 0.878113, 0, 0, 0, 1, 1,
0.9300897, -1.426304, 2.142659, 1, 1, 1, 1, 1,
0.9468952, -1.183548, 4.683377, 1, 1, 1, 1, 1,
0.9554051, -0.0806004, 2.562092, 1, 1, 1, 1, 1,
0.9596035, 1.691581, -1.849288, 1, 1, 1, 1, 1,
0.9615304, 0.4846376, -1.12127, 1, 1, 1, 1, 1,
0.9645799, 0.6026707, 0.7592793, 1, 1, 1, 1, 1,
0.9652646, 0.3299486, 2.315575, 1, 1, 1, 1, 1,
0.9821638, -0.318387, 1.018436, 1, 1, 1, 1, 1,
0.9828919, 0.1000467, 1.89157, 1, 1, 1, 1, 1,
0.9884685, -0.4124527, 1.140735, 1, 1, 1, 1, 1,
0.997592, 0.6377106, -0.2272242, 1, 1, 1, 1, 1,
0.9994534, 0.7738408, -0.2758622, 1, 1, 1, 1, 1,
1.001638, 0.001879523, 0.5641237, 1, 1, 1, 1, 1,
1.005589, 0.7427291, 1.694569, 1, 1, 1, 1, 1,
1.006499, -0.724449, 2.060242, 1, 1, 1, 1, 1,
1.010057, 0.6781436, -0.09071758, 0, 0, 1, 1, 1,
1.01127, -1.172485, 3.724576, 1, 0, 0, 1, 1,
1.012133, 0.947327, 1.325666, 1, 0, 0, 1, 1,
1.012733, 0.2714328, 2.362418, 1, 0, 0, 1, 1,
1.016194, -0.4195275, 1.107268, 1, 0, 0, 1, 1,
1.017047, 1.196982, -1.009285, 1, 0, 0, 1, 1,
1.020113, -1.058567, 1.580285, 0, 0, 0, 1, 1,
1.029874, 0.1754558, 1.652257, 0, 0, 0, 1, 1,
1.033662, 0.9160014, -0.6204627, 0, 0, 0, 1, 1,
1.033921, -0.8714008, 2.10335, 0, 0, 0, 1, 1,
1.039253, 0.8018646, 0.5870721, 0, 0, 0, 1, 1,
1.039307, -1.616386, 2.482322, 0, 0, 0, 1, 1,
1.040165, -0.3772329, 0.7341969, 0, 0, 0, 1, 1,
1.040337, 0.2091658, 1.537635, 1, 1, 1, 1, 1,
1.047221, -0.4171685, 1.519961, 1, 1, 1, 1, 1,
1.057466, -1.032012, 1.779325, 1, 1, 1, 1, 1,
1.06003, 0.07147228, 0.5467613, 1, 1, 1, 1, 1,
1.06179, 0.7937561, -0.8677465, 1, 1, 1, 1, 1,
1.063254, -0.2888875, 2.019511, 1, 1, 1, 1, 1,
1.065969, 1.277664, 1.947043, 1, 1, 1, 1, 1,
1.073532, -0.3662491, 0.8652359, 1, 1, 1, 1, 1,
1.075332, -0.5572789, 2.883512, 1, 1, 1, 1, 1,
1.078324, 0.1328524, 1.911717, 1, 1, 1, 1, 1,
1.082059, -2.597398, 3.242277, 1, 1, 1, 1, 1,
1.083342, -1.152101, 1.953879, 1, 1, 1, 1, 1,
1.087391, 0.1726065, 2.009213, 1, 1, 1, 1, 1,
1.094608, 0.9930943, 0.437294, 1, 1, 1, 1, 1,
1.09583, 0.2755224, 1.612426, 1, 1, 1, 1, 1,
1.099621, 1.341397, -1.552239, 0, 0, 1, 1, 1,
1.100337, 0.1922454, 0.8861859, 1, 0, 0, 1, 1,
1.102853, 0.3808177, 1.768684, 1, 0, 0, 1, 1,
1.103077, 1.143289, 0.9281932, 1, 0, 0, 1, 1,
1.103158, -0.8545759, 2.011716, 1, 0, 0, 1, 1,
1.106461, -1.376796, 2.239347, 1, 0, 0, 1, 1,
1.110559, 1.678854, 1.455648, 0, 0, 0, 1, 1,
1.118367, -0.8732132, 3.65406, 0, 0, 0, 1, 1,
1.125252, 2.085118, -0.8121116, 0, 0, 0, 1, 1,
1.138109, 1.243814, 1.974624, 0, 0, 0, 1, 1,
1.139959, 0.6527959, 2.03988, 0, 0, 0, 1, 1,
1.144529, 1.375135, 0.003002649, 0, 0, 0, 1, 1,
1.146903, 1.048076, 1.102301, 0, 0, 0, 1, 1,
1.148503, 1.580238, 0.1594382, 1, 1, 1, 1, 1,
1.150516, -1.611129, 2.615004, 1, 1, 1, 1, 1,
1.169423, 0.2772415, 0.2027021, 1, 1, 1, 1, 1,
1.170625, -0.09569862, 2.20034, 1, 1, 1, 1, 1,
1.171267, 0.6242225, 0.3055002, 1, 1, 1, 1, 1,
1.200971, -0.0803885, 0.7636009, 1, 1, 1, 1, 1,
1.208114, 1.420717, 0.4895203, 1, 1, 1, 1, 1,
1.20859, -0.7096093, 2.217311, 1, 1, 1, 1, 1,
1.214317, 0.3663728, 0.3987904, 1, 1, 1, 1, 1,
1.223409, -0.1378963, 1.487994, 1, 1, 1, 1, 1,
1.237497, 0.1021179, 2.0067, 1, 1, 1, 1, 1,
1.249101, -1.140922, 1.929312, 1, 1, 1, 1, 1,
1.251795, 1.755337, -0.2796808, 1, 1, 1, 1, 1,
1.254116, -0.3221076, 2.347451, 1, 1, 1, 1, 1,
1.256345, 1.270613, 1.134493, 1, 1, 1, 1, 1,
1.256644, 2.720375, -0.6906831, 0, 0, 1, 1, 1,
1.259438, -0.1308203, 1.543897, 1, 0, 0, 1, 1,
1.260911, -1.306583, 2.956465, 1, 0, 0, 1, 1,
1.261824, 0.2845542, 1.319487, 1, 0, 0, 1, 1,
1.264766, -0.09259472, 1.353068, 1, 0, 0, 1, 1,
1.276338, 0.05170281, 1.112691, 1, 0, 0, 1, 1,
1.289122, -0.4862931, 2.610537, 0, 0, 0, 1, 1,
1.29198, -1.435184, 3.502155, 0, 0, 0, 1, 1,
1.293498, -0.3070646, 1.743819, 0, 0, 0, 1, 1,
1.294998, -0.3844996, 3.055695, 0, 0, 0, 1, 1,
1.296065, -0.1735793, 0.3947225, 0, 0, 0, 1, 1,
1.3047, -0.6498818, 2.355168, 0, 0, 0, 1, 1,
1.321632, 0.7512373, 1.118361, 0, 0, 0, 1, 1,
1.333328, -0.03448234, 0.8092977, 1, 1, 1, 1, 1,
1.34024, -0.8579983, 1.909136, 1, 1, 1, 1, 1,
1.343476, -1.070209, -0.09221658, 1, 1, 1, 1, 1,
1.349562, -1.079948, 0.899483, 1, 1, 1, 1, 1,
1.362705, -0.2882124, 2.726094, 1, 1, 1, 1, 1,
1.36932, -0.3219122, 2.806197, 1, 1, 1, 1, 1,
1.369727, -0.6017945, 2.446954, 1, 1, 1, 1, 1,
1.386931, -0.2476777, 1.551474, 1, 1, 1, 1, 1,
1.399784, 0.0954231, 0.7048357, 1, 1, 1, 1, 1,
1.401627, -0.03790787, 1.18559, 1, 1, 1, 1, 1,
1.403551, -1.266379, 1.818292, 1, 1, 1, 1, 1,
1.412524, -1.748194, 2.352455, 1, 1, 1, 1, 1,
1.416291, 2.47991, 1.620254, 1, 1, 1, 1, 1,
1.429301, 0.06061291, 1.759093, 1, 1, 1, 1, 1,
1.438517, 0.4538018, 2.133494, 1, 1, 1, 1, 1,
1.44471, 0.9308056, -0.2031811, 0, 0, 1, 1, 1,
1.446972, -1.02881, 2.48528, 1, 0, 0, 1, 1,
1.453565, 0.2502045, 1.488128, 1, 0, 0, 1, 1,
1.456693, 1.207501, 1.36859, 1, 0, 0, 1, 1,
1.462155, 1.329109, 0.8413207, 1, 0, 0, 1, 1,
1.48053, -0.08358287, 2.189814, 1, 0, 0, 1, 1,
1.48547, -0.3949187, 2.600252, 0, 0, 0, 1, 1,
1.493431, -0.6699287, 2.990319, 0, 0, 0, 1, 1,
1.498637, -0.19989, 1.225842, 0, 0, 0, 1, 1,
1.508355, 0.1341478, 3.044629, 0, 0, 0, 1, 1,
1.514336, -2.171506, 2.539291, 0, 0, 0, 1, 1,
1.527625, -0.5691221, 1.318422, 0, 0, 0, 1, 1,
1.528807, -0.17723, 1.261473, 0, 0, 0, 1, 1,
1.529199, 0.04350609, 1.372933, 1, 1, 1, 1, 1,
1.544425, -2.107012, 2.11094, 1, 1, 1, 1, 1,
1.552688, -0.9847751, 4.002386, 1, 1, 1, 1, 1,
1.554386, 1.398886, -0.6335521, 1, 1, 1, 1, 1,
1.56924, 0.04576037, -0.0584139, 1, 1, 1, 1, 1,
1.585975, 1.246081, 0.6775599, 1, 1, 1, 1, 1,
1.598686, -1.8298, 2.314807, 1, 1, 1, 1, 1,
1.610623, -0.3953005, 1.649502, 1, 1, 1, 1, 1,
1.614457, 1.781216, 0.8504582, 1, 1, 1, 1, 1,
1.626773, -0.2377283, 2.244118, 1, 1, 1, 1, 1,
1.635727, 0.6048795, 1.04246, 1, 1, 1, 1, 1,
1.651204, 0.9000992, 1.130624, 1, 1, 1, 1, 1,
1.658257, -0.5113676, 3.124916, 1, 1, 1, 1, 1,
1.671692, -0.535332, 1.280543, 1, 1, 1, 1, 1,
1.687186, 0.1875363, 2.254326, 1, 1, 1, 1, 1,
1.698845, 0.6248795, 1.459537, 0, 0, 1, 1, 1,
1.70003, 1.214272, 1.271675, 1, 0, 0, 1, 1,
1.708641, 0.3400447, 1.248154, 1, 0, 0, 1, 1,
1.712157, 1.303666, 1.606273, 1, 0, 0, 1, 1,
1.716723, 0.155775, 3.543351, 1, 0, 0, 1, 1,
1.720461, 0.438326, 1.811684, 1, 0, 0, 1, 1,
1.721483, -0.4769863, 0.6077812, 0, 0, 0, 1, 1,
1.739064, -0.9230828, 2.793407, 0, 0, 0, 1, 1,
1.740108, -1.411876, 2.27844, 0, 0, 0, 1, 1,
1.754829, 1.4447, 1.248028, 0, 0, 0, 1, 1,
1.762187, 1.662522, 1.221897, 0, 0, 0, 1, 1,
1.766999, 2.066188, 1.007994, 0, 0, 0, 1, 1,
1.768543, 1.171532, 1.334021, 0, 0, 0, 1, 1,
1.784246, -1.58644, 1.81899, 1, 1, 1, 1, 1,
1.794996, 1.985816, 1.201678, 1, 1, 1, 1, 1,
1.799714, 0.1161675, 2.05574, 1, 1, 1, 1, 1,
1.809351, -0.4547776, 0.8931442, 1, 1, 1, 1, 1,
1.83126, -0.4859901, 3.33366, 1, 1, 1, 1, 1,
1.842858, -0.06019247, 0.8526562, 1, 1, 1, 1, 1,
1.847036, -2.135807, 2.757761, 1, 1, 1, 1, 1,
1.849226, -0.660141, 3.171555, 1, 1, 1, 1, 1,
1.853576, 0.2848523, 1.683474, 1, 1, 1, 1, 1,
1.875237, -0.5273034, 2.620251, 1, 1, 1, 1, 1,
1.876841, -0.514857, 1.469346, 1, 1, 1, 1, 1,
1.878701, 1.68624, 0.5353685, 1, 1, 1, 1, 1,
1.878996, 1.895621, 0.9036545, 1, 1, 1, 1, 1,
1.883069, -1.922002, -0.4429604, 1, 1, 1, 1, 1,
1.925082, -1.339859, 1.024438, 1, 1, 1, 1, 1,
1.960678, -1.170984, 2.207948, 0, 0, 1, 1, 1,
2.005111, 0.09734567, 0.2058683, 1, 0, 0, 1, 1,
2.010542, -0.2866206, 2.824626, 1, 0, 0, 1, 1,
2.045065, 0.6107284, 1.53745, 1, 0, 0, 1, 1,
2.054627, -0.8472675, 1.355496, 1, 0, 0, 1, 1,
2.057273, 0.642203, 1.32741, 1, 0, 0, 1, 1,
2.062835, -0.6832424, 2.111894, 0, 0, 0, 1, 1,
2.151502, -0.8096331, 2.152161, 0, 0, 0, 1, 1,
2.177155, 0.8547141, 0.3163774, 0, 0, 0, 1, 1,
2.196197, 1.478566, 0.6488507, 0, 0, 0, 1, 1,
2.285943, -0.01548342, 0.3903773, 0, 0, 0, 1, 1,
2.303443, 0.03294104, 1.381429, 0, 0, 0, 1, 1,
2.412519, -0.957239, 3.158435, 0, 0, 0, 1, 1,
2.419777, 0.07269274, 0.9096694, 1, 1, 1, 1, 1,
2.453807, 0.3132482, 0.8685576, 1, 1, 1, 1, 1,
2.549284, -0.7891357, 1.531314, 1, 1, 1, 1, 1,
2.68942, -1.200724, 3.696153, 1, 1, 1, 1, 1,
3.525811, -1.056929, 1.076477, 1, 1, 1, 1, 1,
3.547012, -1.089625, 2.381818, 1, 1, 1, 1, 1,
3.551633, -0.3278479, 3.254025, 1, 1, 1, 1, 1
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
var radius = 9.667983;
var distance = 33.95838;
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
mvMatrix.translate( -0.1774938, -0.07200027, 0.8074439 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95838);
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
