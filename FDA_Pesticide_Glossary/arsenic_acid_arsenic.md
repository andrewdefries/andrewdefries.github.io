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
-3.805764, -0.6609313, -0.0688653, 1, 0, 0, 1,
-2.69977, -1.159877, -2.827407, 1, 0.007843138, 0, 1,
-2.584808, -0.4340943, -1.38146, 1, 0.01176471, 0, 1,
-2.581924, 0.6742895, -0.4156301, 1, 0.01960784, 0, 1,
-2.553607, -1.920947, -2.761791, 1, 0.02352941, 0, 1,
-2.550544, 0.8349035, -0.3349468, 1, 0.03137255, 0, 1,
-2.521402, 2.506019, -0.3990698, 1, 0.03529412, 0, 1,
-2.512885, 0.7078642, -0.5847716, 1, 0.04313726, 0, 1,
-2.420957, -1.286931, -0.9510211, 1, 0.04705882, 0, 1,
-2.34236, -0.06420325, -1.278577, 1, 0.05490196, 0, 1,
-2.341839, -0.2072841, -1.328635, 1, 0.05882353, 0, 1,
-2.260895, 0.4490026, -1.806281, 1, 0.06666667, 0, 1,
-2.234019, -0.3729419, -1.848165, 1, 0.07058824, 0, 1,
-2.232925, 0.1731889, -1.626773, 1, 0.07843138, 0, 1,
-2.207415, -0.8450544, -2.286396, 1, 0.08235294, 0, 1,
-2.146759, -0.1510684, -4.126336, 1, 0.09019608, 0, 1,
-2.124178, -1.446594, -1.145826, 1, 0.09411765, 0, 1,
-2.118777, -1.828526, -1.978364, 1, 0.1019608, 0, 1,
-2.115221, 1.201828, -1.05062, 1, 0.1098039, 0, 1,
-2.100136, 0.03393958, -1.710485, 1, 0.1137255, 0, 1,
-2.095, 0.841279, -2.486405, 1, 0.1215686, 0, 1,
-2.080126, -0.3862505, -0.7917796, 1, 0.1254902, 0, 1,
-2.063108, 0.2008003, -0.7038528, 1, 0.1333333, 0, 1,
-2.051829, -1.14519, -2.585625, 1, 0.1372549, 0, 1,
-1.978374, -0.6798478, -2.058727, 1, 0.145098, 0, 1,
-1.972453, -0.1637925, -1.035956, 1, 0.1490196, 0, 1,
-1.970948, -0.006943991, -0.07894585, 1, 0.1568628, 0, 1,
-1.963589, -0.8049347, -3.763218, 1, 0.1607843, 0, 1,
-1.956869, 1.128259, 0.130288, 1, 0.1686275, 0, 1,
-1.932042, 0.4965228, 0.2383797, 1, 0.172549, 0, 1,
-1.89784, 1.025091, 0.01537633, 1, 0.1803922, 0, 1,
-1.886522, 1.287024, -0.2326391, 1, 0.1843137, 0, 1,
-1.877969, -2.526302, -2.482583, 1, 0.1921569, 0, 1,
-1.876515, -0.9129589, -2.396288, 1, 0.1960784, 0, 1,
-1.862564, -0.8002133, 0.3160199, 1, 0.2039216, 0, 1,
-1.785539, -0.9688752, 0.5105693, 1, 0.2117647, 0, 1,
-1.772707, -0.6757632, -2.072998, 1, 0.2156863, 0, 1,
-1.731683, -0.07728938, -1.439797, 1, 0.2235294, 0, 1,
-1.72899, 1.005691, 0.3589827, 1, 0.227451, 0, 1,
-1.723123, 2.441794, 0.6175779, 1, 0.2352941, 0, 1,
-1.703924, -0.3049963, -2.388286, 1, 0.2392157, 0, 1,
-1.697517, 0.4029022, -2.621891, 1, 0.2470588, 0, 1,
-1.691915, 0.4834409, -1.169467, 1, 0.2509804, 0, 1,
-1.672634, -0.4382305, -2.239547, 1, 0.2588235, 0, 1,
-1.656772, 1.401128, 0.5366956, 1, 0.2627451, 0, 1,
-1.646555, -0.4377605, -3.070447, 1, 0.2705882, 0, 1,
-1.623136, -0.6027005, -1.213644, 1, 0.2745098, 0, 1,
-1.617123, -1.274382, -1.583797, 1, 0.282353, 0, 1,
-1.575732, 0.1717212, -1.23349, 1, 0.2862745, 0, 1,
-1.5711, 0.8224335, -1.666197, 1, 0.2941177, 0, 1,
-1.56884, 0.8553872, -1.332654, 1, 0.3019608, 0, 1,
-1.567933, 2.249794, -1.379701, 1, 0.3058824, 0, 1,
-1.565669, -1.388204, -2.274426, 1, 0.3137255, 0, 1,
-1.565417, -0.1764647, -1.434846, 1, 0.3176471, 0, 1,
-1.560308, -0.1280676, -2.085184, 1, 0.3254902, 0, 1,
-1.554241, -1.602633, -3.302607, 1, 0.3294118, 0, 1,
-1.547634, 0.2500725, -1.795697, 1, 0.3372549, 0, 1,
-1.545038, -0.1040986, -1.472388, 1, 0.3411765, 0, 1,
-1.522738, -1.310216, -2.855752, 1, 0.3490196, 0, 1,
-1.508919, 2.790325, -0.5313608, 1, 0.3529412, 0, 1,
-1.503625, -0.5423652, -2.440675, 1, 0.3607843, 0, 1,
-1.49407, 0.507234, -0.785327, 1, 0.3647059, 0, 1,
-1.489084, 0.1455895, -1.462195, 1, 0.372549, 0, 1,
-1.488151, -0.6196686, -1.61146, 1, 0.3764706, 0, 1,
-1.471425, -0.07738678, -1.063514, 1, 0.3843137, 0, 1,
-1.466954, 0.745782, -0.4167005, 1, 0.3882353, 0, 1,
-1.460554, 1.168307, -1.45154, 1, 0.3960784, 0, 1,
-1.448736, 1.000436, -1.717699, 1, 0.4039216, 0, 1,
-1.425755, -1.666663, -3.142136, 1, 0.4078431, 0, 1,
-1.408489, -0.3845428, 0.6436547, 1, 0.4156863, 0, 1,
-1.40576, -2.210274, -2.330106, 1, 0.4196078, 0, 1,
-1.384709, -2.367425, -4.087949, 1, 0.427451, 0, 1,
-1.374942, 1.184836, -0.3516195, 1, 0.4313726, 0, 1,
-1.368886, 0.07060562, -1.821303, 1, 0.4392157, 0, 1,
-1.359257, -0.8363957, -2.915099, 1, 0.4431373, 0, 1,
-1.356809, -2.327338, -2.136748, 1, 0.4509804, 0, 1,
-1.352627, -0.2886866, -3.81618, 1, 0.454902, 0, 1,
-1.327181, -1.906728, -2.952597, 1, 0.4627451, 0, 1,
-1.318051, -0.2370885, -1.732165, 1, 0.4666667, 0, 1,
-1.31709, 1.367759, -1.015951, 1, 0.4745098, 0, 1,
-1.316641, -0.258434, -2.471623, 1, 0.4784314, 0, 1,
-1.316325, -0.4084662, -3.338629, 1, 0.4862745, 0, 1,
-1.31432, 0.3394544, 0.09081098, 1, 0.4901961, 0, 1,
-1.306715, -0.9729818, -1.35852, 1, 0.4980392, 0, 1,
-1.299969, 2.26801, 1.379595, 1, 0.5058824, 0, 1,
-1.292975, -0.3914341, -2.616579, 1, 0.509804, 0, 1,
-1.276813, -0.3371489, -1.461051, 1, 0.5176471, 0, 1,
-1.267243, -0.2750311, -0.8642215, 1, 0.5215687, 0, 1,
-1.260972, 0.08526009, -1.449544, 1, 0.5294118, 0, 1,
-1.254363, 0.02101572, -0.04434993, 1, 0.5333334, 0, 1,
-1.248328, -0.439086, -1.920123, 1, 0.5411765, 0, 1,
-1.244665, 0.2231167, -1.011894, 1, 0.5450981, 0, 1,
-1.242913, -1.879837, -1.936082, 1, 0.5529412, 0, 1,
-1.237855, 0.2923608, -0.4931647, 1, 0.5568628, 0, 1,
-1.236712, 0.9938963, -0.5184199, 1, 0.5647059, 0, 1,
-1.233199, -1.718497, -1.025851, 1, 0.5686275, 0, 1,
-1.232679, 0.8937939, -0.5496156, 1, 0.5764706, 0, 1,
-1.2294, -1.53539, -0.4139681, 1, 0.5803922, 0, 1,
-1.228935, -0.3729321, -2.031562, 1, 0.5882353, 0, 1,
-1.211495, 0.06131934, -2.878814, 1, 0.5921569, 0, 1,
-1.202375, 0.2758405, -1.824017, 1, 0.6, 0, 1,
-1.192812, -0.2406994, -2.668664, 1, 0.6078432, 0, 1,
-1.192665, 1.197206, -2.05759, 1, 0.6117647, 0, 1,
-1.188086, -0.7191815, -1.416087, 1, 0.6196079, 0, 1,
-1.178703, -1.111089, -1.975091, 1, 0.6235294, 0, 1,
-1.178238, -0.5123414, 0.1758749, 1, 0.6313726, 0, 1,
-1.171652, 1.283706, -0.1535902, 1, 0.6352941, 0, 1,
-1.158868, -0.4755782, -0.5213134, 1, 0.6431373, 0, 1,
-1.156755, 0.6240454, -1.753412, 1, 0.6470588, 0, 1,
-1.143927, -0.1546272, -3.497492, 1, 0.654902, 0, 1,
-1.142184, -1.160031, -4.807422, 1, 0.6588235, 0, 1,
-1.142027, 0.7435927, -1.618268, 1, 0.6666667, 0, 1,
-1.136431, 0.8346863, -1.919232, 1, 0.6705883, 0, 1,
-1.134382, 1.059124, -1.172853, 1, 0.6784314, 0, 1,
-1.128131, 0.09191497, -1.381652, 1, 0.682353, 0, 1,
-1.127132, 0.122262, -0.1011524, 1, 0.6901961, 0, 1,
-1.123582, -0.524461, -3.14591, 1, 0.6941177, 0, 1,
-1.123488, -0.007286164, -2.676737, 1, 0.7019608, 0, 1,
-1.122529, -0.5705636, -2.260328, 1, 0.7098039, 0, 1,
-1.095734, 0.665804, -0.6200645, 1, 0.7137255, 0, 1,
-1.093138, 1.021045, -0.3093759, 1, 0.7215686, 0, 1,
-1.09231, -1.440336, -1.015133, 1, 0.7254902, 0, 1,
-1.088356, 0.6571952, 0.5704072, 1, 0.7333333, 0, 1,
-1.087434, 1.089795, -3.018071, 1, 0.7372549, 0, 1,
-1.086295, -0.1169188, -0.9322203, 1, 0.7450981, 0, 1,
-1.081229, -1.805324, -2.243235, 1, 0.7490196, 0, 1,
-1.069717, 0.7635471, 0.4618224, 1, 0.7568628, 0, 1,
-1.055642, -0.4177286, -2.696997, 1, 0.7607843, 0, 1,
-1.054065, -0.3541857, -2.910024, 1, 0.7686275, 0, 1,
-1.049293, -0.6469672, -0.7429197, 1, 0.772549, 0, 1,
-1.038408, 2.415746, 0.1722568, 1, 0.7803922, 0, 1,
-1.03725, 0.9735022, -0.07505057, 1, 0.7843137, 0, 1,
-1.030383, -1.110903, -2.274537, 1, 0.7921569, 0, 1,
-1.027406, -0.4985602, -2.392128, 1, 0.7960784, 0, 1,
-1.026221, 0.5018703, -0.6147511, 1, 0.8039216, 0, 1,
-1.018864, -1.450636, -1.525514, 1, 0.8117647, 0, 1,
-1.014817, 1.68769, -0.1200847, 1, 0.8156863, 0, 1,
-1.005517, 0.6167029, 1.278762, 1, 0.8235294, 0, 1,
-0.9979345, 0.2464967, -1.86239, 1, 0.827451, 0, 1,
-0.9951885, 0.5710188, -2.012405, 1, 0.8352941, 0, 1,
-0.9921747, -0.6523794, -0.4813462, 1, 0.8392157, 0, 1,
-0.9888999, -0.3571979, -0.5628483, 1, 0.8470588, 0, 1,
-0.9876291, -0.6337843, -1.696095, 1, 0.8509804, 0, 1,
-0.9827459, -0.06605203, -0.1277544, 1, 0.8588235, 0, 1,
-0.9790277, -0.6990888, -1.256103, 1, 0.8627451, 0, 1,
-0.969534, -0.2160676, -2.749979, 1, 0.8705882, 0, 1,
-0.9671353, -0.6345975, -2.037215, 1, 0.8745098, 0, 1,
-0.9669973, -1.698314, -1.900768, 1, 0.8823529, 0, 1,
-0.964738, -1.227737, -2.158451, 1, 0.8862745, 0, 1,
-0.9644262, -0.7167109, -2.550915, 1, 0.8941177, 0, 1,
-0.9573827, 0.6668612, -2.351952, 1, 0.8980392, 0, 1,
-0.9554281, 1.319338, -0.6622999, 1, 0.9058824, 0, 1,
-0.9485176, -0.5695399, -3.419224, 1, 0.9137255, 0, 1,
-0.9442077, -1.622462, -2.666417, 1, 0.9176471, 0, 1,
-0.933312, -1.223417, -1.761694, 1, 0.9254902, 0, 1,
-0.923641, 0.10064, -3.29454, 1, 0.9294118, 0, 1,
-0.9029263, 0.9979728, -1.347702, 1, 0.9372549, 0, 1,
-0.9010434, -0.7489915, -3.334234, 1, 0.9411765, 0, 1,
-0.900513, -1.041343, -1.466926, 1, 0.9490196, 0, 1,
-0.8942155, 0.546267, -1.364733, 1, 0.9529412, 0, 1,
-0.8923638, -0.167175, -2.985978, 1, 0.9607843, 0, 1,
-0.8894097, 0.9020047, -0.1576598, 1, 0.9647059, 0, 1,
-0.8888621, -0.3695426, -2.238149, 1, 0.972549, 0, 1,
-0.8853858, -1.875347, -3.803026, 1, 0.9764706, 0, 1,
-0.882274, -1.095016, -0.6944588, 1, 0.9843137, 0, 1,
-0.8818264, 0.1448292, -1.737026, 1, 0.9882353, 0, 1,
-0.8797932, -0.502296, -2.538656, 1, 0.9960784, 0, 1,
-0.8752009, -0.4882047, -0.7828676, 0.9960784, 1, 0, 1,
-0.8723201, 0.6228172, -2.478084, 0.9921569, 1, 0, 1,
-0.8703904, -1.207851, -2.46525, 0.9843137, 1, 0, 1,
-0.856519, -0.3988758, -1.03265, 0.9803922, 1, 0, 1,
-0.8522508, 1.539606, 1.675952, 0.972549, 1, 0, 1,
-0.8512258, 0.5072829, -0.06138363, 0.9686275, 1, 0, 1,
-0.8490905, -0.1828025, -2.071692, 0.9607843, 1, 0, 1,
-0.848655, 0.07525402, -0.9685597, 0.9568627, 1, 0, 1,
-0.8465586, 0.1919068, -2.164788, 0.9490196, 1, 0, 1,
-0.8445805, -0.1030978, 0.09998758, 0.945098, 1, 0, 1,
-0.833996, 0.3127559, -0.02132784, 0.9372549, 1, 0, 1,
-0.8288307, 0.2894853, -1.045962, 0.9333333, 1, 0, 1,
-0.8243346, 2.077179, 0.2717684, 0.9254902, 1, 0, 1,
-0.8234452, 0.05653134, -1.438018, 0.9215686, 1, 0, 1,
-0.8208303, -0.3182101, -1.995811, 0.9137255, 1, 0, 1,
-0.8187406, -1.095953, -1.907351, 0.9098039, 1, 0, 1,
-0.8182209, -1.229607, -1.085819, 0.9019608, 1, 0, 1,
-0.8116952, -1.728635, -1.412829, 0.8941177, 1, 0, 1,
-0.8087369, -0.5868146, -2.748616, 0.8901961, 1, 0, 1,
-0.8067707, -0.658739, -4.467793, 0.8823529, 1, 0, 1,
-0.7987686, -1.351815, -3.566589, 0.8784314, 1, 0, 1,
-0.7975121, 1.216268, 0.4209772, 0.8705882, 1, 0, 1,
-0.7854689, -1.217172, -1.48396, 0.8666667, 1, 0, 1,
-0.7772722, 1.012809, 0.0489913, 0.8588235, 1, 0, 1,
-0.7751688, 0.3087011, -2.464368, 0.854902, 1, 0, 1,
-0.771625, -1.164382, -2.272335, 0.8470588, 1, 0, 1,
-0.766683, 0.07506912, -4.726122, 0.8431373, 1, 0, 1,
-0.764607, -0.3221867, -1.75609, 0.8352941, 1, 0, 1,
-0.7621187, -0.7084019, -2.461019, 0.8313726, 1, 0, 1,
-0.7615085, -0.4743432, -3.978641, 0.8235294, 1, 0, 1,
-0.7577173, -0.1151576, -1.64404, 0.8196079, 1, 0, 1,
-0.7561253, 0.03194649, -1.654173, 0.8117647, 1, 0, 1,
-0.7553408, 1.247718, 0.9823728, 0.8078431, 1, 0, 1,
-0.7533553, 0.1345541, -0.6849481, 0.8, 1, 0, 1,
-0.7507821, -0.1694437, -2.450845, 0.7921569, 1, 0, 1,
-0.7503551, -1.456687, -1.929107, 0.7882353, 1, 0, 1,
-0.7446523, 0.4843182, -1.716064, 0.7803922, 1, 0, 1,
-0.7425522, 0.5113581, -1.200784, 0.7764706, 1, 0, 1,
-0.7421782, 0.6911344, 0.3589, 0.7686275, 1, 0, 1,
-0.7354103, 0.8101441, -1.246564, 0.7647059, 1, 0, 1,
-0.7336512, -0.93453, -1.184961, 0.7568628, 1, 0, 1,
-0.7294308, -0.8179436, -2.730366, 0.7529412, 1, 0, 1,
-0.7278412, -1.353014, -2.700872, 0.7450981, 1, 0, 1,
-0.7221057, -0.3859218, -2.341685, 0.7411765, 1, 0, 1,
-0.7173779, 1.113894, -2.832921, 0.7333333, 1, 0, 1,
-0.7108128, 0.8354321, -1.116592, 0.7294118, 1, 0, 1,
-0.6971503, -0.1121191, -1.0878, 0.7215686, 1, 0, 1,
-0.6937194, 1.059177, 0.06364688, 0.7176471, 1, 0, 1,
-0.6870716, -0.1443586, -0.5520017, 0.7098039, 1, 0, 1,
-0.6850329, -0.5441957, -0.6797315, 0.7058824, 1, 0, 1,
-0.6840883, 0.2949217, -3.504601, 0.6980392, 1, 0, 1,
-0.6828306, 0.7419446, 0.2335798, 0.6901961, 1, 0, 1,
-0.6754393, -0.4585228, -2.379962, 0.6862745, 1, 0, 1,
-0.6687096, 0.4186687, -1.987608, 0.6784314, 1, 0, 1,
-0.6683406, -0.5376388, -2.328798, 0.6745098, 1, 0, 1,
-0.6615549, 0.5044239, -1.026939, 0.6666667, 1, 0, 1,
-0.6563756, -0.3314538, -2.24787, 0.6627451, 1, 0, 1,
-0.6537958, 0.09735021, -0.7135625, 0.654902, 1, 0, 1,
-0.6458187, -2.041754, -2.578267, 0.6509804, 1, 0, 1,
-0.6455686, 0.4270025, -0.9145432, 0.6431373, 1, 0, 1,
-0.6445954, -0.08868985, -2.614721, 0.6392157, 1, 0, 1,
-0.6444691, 0.1950036, -0.9060857, 0.6313726, 1, 0, 1,
-0.6423821, 1.452643, 0.2861581, 0.627451, 1, 0, 1,
-0.6420097, 2.324022, 0.02089922, 0.6196079, 1, 0, 1,
-0.6350878, 0.6542106, -0.309663, 0.6156863, 1, 0, 1,
-0.63182, 1.192173, -0.3751459, 0.6078432, 1, 0, 1,
-0.6282627, 1.379469, -0.05366354, 0.6039216, 1, 0, 1,
-0.6217482, 0.3911318, -1.413584, 0.5960785, 1, 0, 1,
-0.621384, 1.71558, -1.036127, 0.5882353, 1, 0, 1,
-0.6180107, 1.054237, -1.803099, 0.5843138, 1, 0, 1,
-0.6155332, 0.2657552, -0.3190307, 0.5764706, 1, 0, 1,
-0.6093446, -0.6997532, -2.676827, 0.572549, 1, 0, 1,
-0.605604, -0.4122699, -1.630976, 0.5647059, 1, 0, 1,
-0.6040518, -1.091673, -2.795785, 0.5607843, 1, 0, 1,
-0.5998294, 0.5968745, 0.1619459, 0.5529412, 1, 0, 1,
-0.5961492, -0.1556839, -2.448192, 0.5490196, 1, 0, 1,
-0.5948923, -1.088085, -2.511717, 0.5411765, 1, 0, 1,
-0.5946273, -2.834048, -2.086982, 0.5372549, 1, 0, 1,
-0.5938931, 0.4579386, -1.135153, 0.5294118, 1, 0, 1,
-0.5917771, 1.409192, -0.3118099, 0.5254902, 1, 0, 1,
-0.5764744, 0.4061334, 0.3001778, 0.5176471, 1, 0, 1,
-0.5703895, -1.844127, -4.973141, 0.5137255, 1, 0, 1,
-0.5649105, -0.5089821, -3.25104, 0.5058824, 1, 0, 1,
-0.5616555, -0.4785748, -2.382086, 0.5019608, 1, 0, 1,
-0.556053, -0.6190671, -3.692106, 0.4941176, 1, 0, 1,
-0.5404548, 0.8523768, 1.474216, 0.4862745, 1, 0, 1,
-0.5312417, 1.740997, 0.5750971, 0.4823529, 1, 0, 1,
-0.5266527, 2.037695, -1.332332, 0.4745098, 1, 0, 1,
-0.52107, -0.7278158, -2.873058, 0.4705882, 1, 0, 1,
-0.5209548, 1.233436, -0.7128877, 0.4627451, 1, 0, 1,
-0.5209392, -1.097381, -2.253582, 0.4588235, 1, 0, 1,
-0.5196064, -0.7525631, -2.959171, 0.4509804, 1, 0, 1,
-0.5173367, -1.149094, -2.27579, 0.4470588, 1, 0, 1,
-0.5163073, -0.06152912, -1.142171, 0.4392157, 1, 0, 1,
-0.5152583, -1.053381, -3.858175, 0.4352941, 1, 0, 1,
-0.5102366, -0.1705192, -1.182912, 0.427451, 1, 0, 1,
-0.501357, 0.6429846, -1.543753, 0.4235294, 1, 0, 1,
-0.5005795, 0.8218072, -2.80165, 0.4156863, 1, 0, 1,
-0.4989378, -0.5495153, -1.971812, 0.4117647, 1, 0, 1,
-0.4989023, -0.6126016, -2.732077, 0.4039216, 1, 0, 1,
-0.4978911, -0.03537861, -2.072916, 0.3960784, 1, 0, 1,
-0.4930597, -1.619368, -3.670786, 0.3921569, 1, 0, 1,
-0.4868339, 1.353808, 1.008329, 0.3843137, 1, 0, 1,
-0.4799597, -0.0962539, -2.173378, 0.3803922, 1, 0, 1,
-0.4776208, -1.219058, -1.957037, 0.372549, 1, 0, 1,
-0.4768351, -0.7956998, -2.280068, 0.3686275, 1, 0, 1,
-0.4748359, 0.8148436, -2.296598, 0.3607843, 1, 0, 1,
-0.4728429, 1.046496, -1.165824, 0.3568628, 1, 0, 1,
-0.4659434, -1.398996, -3.064142, 0.3490196, 1, 0, 1,
-0.4646874, 0.05246875, -0.956681, 0.345098, 1, 0, 1,
-0.4602898, -0.6550104, -1.386952, 0.3372549, 1, 0, 1,
-0.4598462, -0.6271433, -4.320383, 0.3333333, 1, 0, 1,
-0.4534739, -0.08601228, -2.274814, 0.3254902, 1, 0, 1,
-0.4463584, -0.5019498, -2.325822, 0.3215686, 1, 0, 1,
-0.4448037, 0.4257351, 0.4208686, 0.3137255, 1, 0, 1,
-0.4382458, -0.2952987, -0.1384902, 0.3098039, 1, 0, 1,
-0.4302056, -1.677187, -3.884009, 0.3019608, 1, 0, 1,
-0.425637, 0.9398301, 1.178996, 0.2941177, 1, 0, 1,
-0.4253851, -0.1346209, -0.628528, 0.2901961, 1, 0, 1,
-0.4223633, 2.603373, 1.164713, 0.282353, 1, 0, 1,
-0.4119451, -0.2050471, -2.855645, 0.2784314, 1, 0, 1,
-0.4055282, 0.4804599, 0.06777919, 0.2705882, 1, 0, 1,
-0.4028779, 0.1802877, -3.488536, 0.2666667, 1, 0, 1,
-0.4006582, -0.1879598, -1.187157, 0.2588235, 1, 0, 1,
-0.3973115, -1.674403, -4.874468, 0.254902, 1, 0, 1,
-0.3888624, -0.4057482, -0.7956294, 0.2470588, 1, 0, 1,
-0.3851622, -0.2399525, -1.427195, 0.2431373, 1, 0, 1,
-0.383403, -1.05387, -3.049218, 0.2352941, 1, 0, 1,
-0.3833187, 0.7208077, -2.215327, 0.2313726, 1, 0, 1,
-0.3796646, -1.266587, -2.687604, 0.2235294, 1, 0, 1,
-0.3775821, -0.05701895, -1.036342, 0.2196078, 1, 0, 1,
-0.3761077, -1.907482, -4.268453, 0.2117647, 1, 0, 1,
-0.3749242, -1.067147, -3.784449, 0.2078431, 1, 0, 1,
-0.3638621, -0.003382585, -1.676045, 0.2, 1, 0, 1,
-0.362953, 1.383482, -0.7364555, 0.1921569, 1, 0, 1,
-0.3608481, -1.670959, -3.111124, 0.1882353, 1, 0, 1,
-0.3587146, -0.3314512, -3.231735, 0.1803922, 1, 0, 1,
-0.3580795, -0.1098184, -0.1089255, 0.1764706, 1, 0, 1,
-0.3566109, 0.6432694, -0.5336698, 0.1686275, 1, 0, 1,
-0.355029, 0.3263478, 1.00098, 0.1647059, 1, 0, 1,
-0.353801, 1.19049, 0.3333658, 0.1568628, 1, 0, 1,
-0.3535173, -1.208179, -3.286474, 0.1529412, 1, 0, 1,
-0.3526162, -1.246242, -1.330226, 0.145098, 1, 0, 1,
-0.3510124, 1.340586, 1.69664, 0.1411765, 1, 0, 1,
-0.3510068, -1.064673, -4.06277, 0.1333333, 1, 0, 1,
-0.3477617, -0.06830081, -1.482528, 0.1294118, 1, 0, 1,
-0.3464395, -0.4200161, -2.281564, 0.1215686, 1, 0, 1,
-0.3454057, -0.1661555, -0.8339527, 0.1176471, 1, 0, 1,
-0.3437586, -0.7267294, -2.221488, 0.1098039, 1, 0, 1,
-0.3423196, -0.3334134, -2.577554, 0.1058824, 1, 0, 1,
-0.3422217, 1.53373, 0.06074594, 0.09803922, 1, 0, 1,
-0.3420557, 2.087737, 0.1351452, 0.09019608, 1, 0, 1,
-0.3378239, 0.1210897, -3.121907, 0.08627451, 1, 0, 1,
-0.3366441, -0.001573762, -1.598022, 0.07843138, 1, 0, 1,
-0.3328291, 0.2565926, -1.237621, 0.07450981, 1, 0, 1,
-0.3216563, 0.7177901, -0.5793801, 0.06666667, 1, 0, 1,
-0.3216016, 0.9414463, -0.2022383, 0.0627451, 1, 0, 1,
-0.3213313, -0.2403873, -2.938627, 0.05490196, 1, 0, 1,
-0.3208583, 1.22013, 1.426959, 0.05098039, 1, 0, 1,
-0.3187751, -0.1435491, -3.022887, 0.04313726, 1, 0, 1,
-0.3178023, 1.167992, -0.07332001, 0.03921569, 1, 0, 1,
-0.3103249, 0.4285202, 0.276135, 0.03137255, 1, 0, 1,
-0.3086134, -0.3394748, -1.907663, 0.02745098, 1, 0, 1,
-0.3070152, -1.138702, -2.901519, 0.01960784, 1, 0, 1,
-0.3056673, 0.5499372, -1.78793, 0.01568628, 1, 0, 1,
-0.3042009, -1.435017, -1.960596, 0.007843138, 1, 0, 1,
-0.3015053, 0.1494579, -0.6918251, 0.003921569, 1, 0, 1,
-0.2975861, 1.131595, 0.8333226, 0, 1, 0.003921569, 1,
-0.2972457, -0.02265138, -1.332049, 0, 1, 0.01176471, 1,
-0.2920557, 2.446052, -1.96471, 0, 1, 0.01568628, 1,
-0.2854704, -0.8730546, -3.089604, 0, 1, 0.02352941, 1,
-0.2831185, -1.065874, -2.454801, 0, 1, 0.02745098, 1,
-0.2829784, -0.1823276, -2.765755, 0, 1, 0.03529412, 1,
-0.2826635, 0.4869073, 0.09859928, 0, 1, 0.03921569, 1,
-0.2806115, -0.7619168, -3.486526, 0, 1, 0.04705882, 1,
-0.2768864, 0.08980552, 0.5222203, 0, 1, 0.05098039, 1,
-0.2753952, 0.2804921, -1.320959, 0, 1, 0.05882353, 1,
-0.2668802, -0.4709364, -3.330989, 0, 1, 0.0627451, 1,
-0.264223, 0.01419779, -3.040676, 0, 1, 0.07058824, 1,
-0.2632332, 0.81308, -0.3202386, 0, 1, 0.07450981, 1,
-0.2622154, 0.9069124, 0.00296782, 0, 1, 0.08235294, 1,
-0.2605331, 1.058363, -0.6405275, 0, 1, 0.08627451, 1,
-0.2602214, -0.2462166, -2.864657, 0, 1, 0.09411765, 1,
-0.2573428, -0.7544454, -4.233704, 0, 1, 0.1019608, 1,
-0.2565078, -0.8042209, -1.354931, 0, 1, 0.1058824, 1,
-0.2531565, -0.07574221, -4.0667, 0, 1, 0.1137255, 1,
-0.2518826, 1.032234, 0.3101752, 0, 1, 0.1176471, 1,
-0.2459555, 0.4824353, -1.038521, 0, 1, 0.1254902, 1,
-0.2430034, 0.7028934, 0.5628408, 0, 1, 0.1294118, 1,
-0.2418423, 0.487732, 1.591794, 0, 1, 0.1372549, 1,
-0.2412141, -0.04048217, -3.581462, 0, 1, 0.1411765, 1,
-0.2391744, 1.334745, 0.2363935, 0, 1, 0.1490196, 1,
-0.2377296, -0.6398168, -4.937905, 0, 1, 0.1529412, 1,
-0.235481, 0.334125, 0.2846378, 0, 1, 0.1607843, 1,
-0.2345458, 1.05829, -0.007107514, 0, 1, 0.1647059, 1,
-0.2336313, 1.239072, -0.8388716, 0, 1, 0.172549, 1,
-0.228695, 0.575444, -0.0459987, 0, 1, 0.1764706, 1,
-0.2284217, 1.678256, 0.8660373, 0, 1, 0.1843137, 1,
-0.2260661, 1.343078, -0.5010355, 0, 1, 0.1882353, 1,
-0.2254225, 0.03753135, -1.184033, 0, 1, 0.1960784, 1,
-0.2253554, -0.853282, -2.67044, 0, 1, 0.2039216, 1,
-0.2221431, 0.5874115, -0.9273135, 0, 1, 0.2078431, 1,
-0.2170562, 1.093133, 0.4278936, 0, 1, 0.2156863, 1,
-0.2169821, -0.4238231, -1.839579, 0, 1, 0.2196078, 1,
-0.2166719, -0.6154432, -3.092838, 0, 1, 0.227451, 1,
-0.215954, 2.006827, -0.650859, 0, 1, 0.2313726, 1,
-0.2144152, 0.3558743, -0.7840855, 0, 1, 0.2392157, 1,
-0.2088408, 0.6350703, -0.4976461, 0, 1, 0.2431373, 1,
-0.208584, 0.3684144, -2.672946, 0, 1, 0.2509804, 1,
-0.2081798, 0.2521379, -0.4110462, 0, 1, 0.254902, 1,
-0.2076244, 1.731229, 1.30705, 0, 1, 0.2627451, 1,
-0.2020416, -2.222217, -2.129601, 0, 1, 0.2666667, 1,
-0.1926772, -0.691327, -1.874501, 0, 1, 0.2745098, 1,
-0.189534, 0.1749005, -1.076822, 0, 1, 0.2784314, 1,
-0.1874792, 0.8987817, -1.08044, 0, 1, 0.2862745, 1,
-0.1869782, 2.422924, 0.6407056, 0, 1, 0.2901961, 1,
-0.1860727, -0.8121188, -2.857383, 0, 1, 0.2980392, 1,
-0.1854896, -0.6688534, -4.472954, 0, 1, 0.3058824, 1,
-0.1842811, 0.8480193, -1.157761, 0, 1, 0.3098039, 1,
-0.1831785, 0.5624449, -0.07527916, 0, 1, 0.3176471, 1,
-0.1821184, -0.1195001, -0.1759443, 0, 1, 0.3215686, 1,
-0.1816054, 0.2858993, 1.010092, 0, 1, 0.3294118, 1,
-0.1769659, -0.1085206, -1.725312, 0, 1, 0.3333333, 1,
-0.1756807, -1.666397, -2.855372, 0, 1, 0.3411765, 1,
-0.1755166, -1.06158, -1.912544, 0, 1, 0.345098, 1,
-0.1678511, 0.4591882, -0.2034059, 0, 1, 0.3529412, 1,
-0.16635, 1.662755, -0.6104242, 0, 1, 0.3568628, 1,
-0.162272, 0.3548338, 0.4926673, 0, 1, 0.3647059, 1,
-0.160384, 2.317788, -1.52189, 0, 1, 0.3686275, 1,
-0.1577172, -0.5566291, -2.754631, 0, 1, 0.3764706, 1,
-0.1567289, 1.508612, -0.8110099, 0, 1, 0.3803922, 1,
-0.1553666, 1.355033, 0.4755074, 0, 1, 0.3882353, 1,
-0.1550882, -1.066573, -1.69886, 0, 1, 0.3921569, 1,
-0.1535731, 1.930125, -0.4292845, 0, 1, 0.4, 1,
-0.1534387, -0.2953157, -2.057756, 0, 1, 0.4078431, 1,
-0.1504878, -0.53783, -2.790898, 0, 1, 0.4117647, 1,
-0.1497047, -1.813143, -2.960214, 0, 1, 0.4196078, 1,
-0.1483537, -0.8619456, -4.976661, 0, 1, 0.4235294, 1,
-0.1454395, 1.114687, -0.988108, 0, 1, 0.4313726, 1,
-0.1422992, -1.829258, -2.777088, 0, 1, 0.4352941, 1,
-0.1420759, -0.2259447, -2.410547, 0, 1, 0.4431373, 1,
-0.1403113, -0.6243393, -4.213789, 0, 1, 0.4470588, 1,
-0.1379271, 0.05522515, -1.782221, 0, 1, 0.454902, 1,
-0.1372832, 1.577659, 0.01601947, 0, 1, 0.4588235, 1,
-0.1372598, 0.3919865, -0.3911308, 0, 1, 0.4666667, 1,
-0.1367765, 0.03701762, -4.349905, 0, 1, 0.4705882, 1,
-0.1335922, -0.5010843, -1.916172, 0, 1, 0.4784314, 1,
-0.1331833, -0.3760379, -2.021188, 0, 1, 0.4823529, 1,
-0.131483, -1.269439, -3.390474, 0, 1, 0.4901961, 1,
-0.1260516, 0.0488033, -1.080206, 0, 1, 0.4941176, 1,
-0.1246695, 0.5483232, -0.5528421, 0, 1, 0.5019608, 1,
-0.1192117, -1.987414, -3.049326, 0, 1, 0.509804, 1,
-0.1099373, 1.54899, 0.5536591, 0, 1, 0.5137255, 1,
-0.1096532, 0.8550122, -0.6884692, 0, 1, 0.5215687, 1,
-0.1090706, 1.055786, 0.1823715, 0, 1, 0.5254902, 1,
-0.1061836, 0.07395907, -2.654191, 0, 1, 0.5333334, 1,
-0.1041902, 0.4299703, -1.098166, 0, 1, 0.5372549, 1,
-0.1032551, 0.261862, 0.425024, 0, 1, 0.5450981, 1,
-0.09910652, -0.1162799, -0.6546737, 0, 1, 0.5490196, 1,
-0.09732375, -0.4331787, -3.769909, 0, 1, 0.5568628, 1,
-0.08352055, 1.632077, -1.337669, 0, 1, 0.5607843, 1,
-0.08261909, -0.3049704, -2.024806, 0, 1, 0.5686275, 1,
-0.08255571, -0.5240848, -2.990273, 0, 1, 0.572549, 1,
-0.08202191, 0.8711271, -0.3018669, 0, 1, 0.5803922, 1,
-0.07863015, -0.9834399, -2.167542, 0, 1, 0.5843138, 1,
-0.07127848, -1.522141, -2.78192, 0, 1, 0.5921569, 1,
-0.07117516, 1.84009, 0.7989607, 0, 1, 0.5960785, 1,
-0.06819762, -0.3547123, -3.597894, 0, 1, 0.6039216, 1,
-0.06260323, -0.2883813, -4.033291, 0, 1, 0.6117647, 1,
-0.06167801, -1.113369, -3.312158, 0, 1, 0.6156863, 1,
-0.06014144, 1.175229, 0.8768435, 0, 1, 0.6235294, 1,
-0.05953591, 0.5624957, -1.930841, 0, 1, 0.627451, 1,
-0.05730712, 0.6238548, 1.639438, 0, 1, 0.6352941, 1,
-0.05391148, -0.6137755, -3.513503, 0, 1, 0.6392157, 1,
-0.05374886, 1.18789, -1.133945, 0, 1, 0.6470588, 1,
-0.05180385, -0.920892, -1.554495, 0, 1, 0.6509804, 1,
-0.04716912, 0.1085726, 0.8190066, 0, 1, 0.6588235, 1,
-0.04429606, 0.9046266, 2.060881, 0, 1, 0.6627451, 1,
-0.04308895, -0.03523104, -2.350086, 0, 1, 0.6705883, 1,
-0.04235456, 1.608284, -0.8233507, 0, 1, 0.6745098, 1,
-0.04091239, 0.2231226, -0.2199793, 0, 1, 0.682353, 1,
-0.03977324, 0.6834352, 0.002680125, 0, 1, 0.6862745, 1,
-0.0387965, 1.203806, -0.4526106, 0, 1, 0.6941177, 1,
-0.03589746, -1.417674, -2.894144, 0, 1, 0.7019608, 1,
-0.03575835, 0.4732859, 0.6154689, 0, 1, 0.7058824, 1,
-0.03570395, 1.782867, 1.550266, 0, 1, 0.7137255, 1,
-0.03498377, 1.039914, 0.8029736, 0, 1, 0.7176471, 1,
-0.03451937, 0.620228, 0.483198, 0, 1, 0.7254902, 1,
-0.03348136, 0.1732329, -0.020465, 0, 1, 0.7294118, 1,
-0.03237534, -0.6562186, -4.010292, 0, 1, 0.7372549, 1,
-0.03200932, -0.3181899, -2.81386, 0, 1, 0.7411765, 1,
-0.0278373, -0.2414097, -2.37094, 0, 1, 0.7490196, 1,
-0.02778625, -0.5955305, -3.066297, 0, 1, 0.7529412, 1,
-0.02707182, -0.3876503, -3.355818, 0, 1, 0.7607843, 1,
-0.02526807, -0.8593839, -4.993587, 0, 1, 0.7647059, 1,
-0.02384845, 0.8185638, -2.47058, 0, 1, 0.772549, 1,
-0.02248344, -1.473798, -4.494894, 0, 1, 0.7764706, 1,
-0.02236695, 1.449053, -0.5759279, 0, 1, 0.7843137, 1,
-0.02131907, -0.7712497, -1.670114, 0, 1, 0.7882353, 1,
-0.008970364, -0.5278616, -2.751788, 0, 1, 0.7960784, 1,
-0.007948504, -0.1921008, -2.016951, 0, 1, 0.8039216, 1,
-0.00773467, 0.552177, 0.09507354, 0, 1, 0.8078431, 1,
-0.007587827, -0.5868694, -2.110362, 0, 1, 0.8156863, 1,
-0.006677668, 0.6113941, 0.6944601, 0, 1, 0.8196079, 1,
-0.00394223, -0.5987613, -3.906618, 0, 1, 0.827451, 1,
-0.002611909, -0.04902688, -2.815252, 0, 1, 0.8313726, 1,
0.003338121, 0.6497855, 0.8346283, 0, 1, 0.8392157, 1,
0.0103396, 0.08947099, -0.2654257, 0, 1, 0.8431373, 1,
0.01131014, -0.8671792, 2.941801, 0, 1, 0.8509804, 1,
0.01392807, -0.6296933, 1.484495, 0, 1, 0.854902, 1,
0.01646419, -1.512217, 2.184699, 0, 1, 0.8627451, 1,
0.02064848, 0.3126132, -0.6085654, 0, 1, 0.8666667, 1,
0.02079692, -0.5153689, 2.052238, 0, 1, 0.8745098, 1,
0.02284075, 0.3540667, 1.980854, 0, 1, 0.8784314, 1,
0.02288756, 0.9585714, -0.8544173, 0, 1, 0.8862745, 1,
0.03033792, -0.4601813, 4.396352, 0, 1, 0.8901961, 1,
0.03241972, -0.4483598, 2.663131, 0, 1, 0.8980392, 1,
0.03643808, -0.7494308, 1.584482, 0, 1, 0.9058824, 1,
0.0370638, 0.6886045, -0.04324744, 0, 1, 0.9098039, 1,
0.0410432, -0.4664251, 3.051634, 0, 1, 0.9176471, 1,
0.04133204, 1.863973, 0.2552083, 0, 1, 0.9215686, 1,
0.04408182, 1.100834, 0.6231586, 0, 1, 0.9294118, 1,
0.04412509, 0.6430504, 1.129367, 0, 1, 0.9333333, 1,
0.04593529, 1.152608, -0.9062936, 0, 1, 0.9411765, 1,
0.04712015, 1.011978, 0.3061331, 0, 1, 0.945098, 1,
0.0594678, 2.246076, 0.1519825, 0, 1, 0.9529412, 1,
0.05993389, 0.1662899, -0.8079433, 0, 1, 0.9568627, 1,
0.06016436, 1.970842, -0.04251005, 0, 1, 0.9647059, 1,
0.06220258, 1.106865, 0.1338056, 0, 1, 0.9686275, 1,
0.06364588, -0.4696802, 3.857913, 0, 1, 0.9764706, 1,
0.06642445, 0.1245948, 1.751485, 0, 1, 0.9803922, 1,
0.066939, 0.9851617, 1.763204, 0, 1, 0.9882353, 1,
0.06905373, -0.925532, 2.401421, 0, 1, 0.9921569, 1,
0.07082536, -0.3823502, 3.600161, 0, 1, 1, 1,
0.07188378, -2.154436, 4.235486, 0, 0.9921569, 1, 1,
0.07193431, -0.4260176, 2.961722, 0, 0.9882353, 1, 1,
0.07306203, 1.132909, -0.3387423, 0, 0.9803922, 1, 1,
0.07539283, -0.8529496, 3.907033, 0, 0.9764706, 1, 1,
0.07575634, -0.6764473, 2.600312, 0, 0.9686275, 1, 1,
0.07740916, -1.94799, 3.763552, 0, 0.9647059, 1, 1,
0.0878229, 0.1117297, 0.190685, 0, 0.9568627, 1, 1,
0.0885848, -0.238512, 2.165125, 0, 0.9529412, 1, 1,
0.0905203, -0.3291365, 2.781153, 0, 0.945098, 1, 1,
0.09292573, -0.2127411, 3.98091, 0, 0.9411765, 1, 1,
0.0945705, 0.387989, 1.520559, 0, 0.9333333, 1, 1,
0.09647301, 1.637043, 1.199616, 0, 0.9294118, 1, 1,
0.09653576, -0.4645714, 1.713361, 0, 0.9215686, 1, 1,
0.1010858, -0.206244, 3.280521, 0, 0.9176471, 1, 1,
0.1029076, -0.4396716, 4.318316, 0, 0.9098039, 1, 1,
0.1096049, -0.7687919, 2.749569, 0, 0.9058824, 1, 1,
0.1109095, -0.3855972, 2.733624, 0, 0.8980392, 1, 1,
0.1187173, -0.1737778, 1.63587, 0, 0.8901961, 1, 1,
0.1238884, -0.146216, 2.375172, 0, 0.8862745, 1, 1,
0.1265219, 1.356341, -0.3266807, 0, 0.8784314, 1, 1,
0.130908, -0.2246236, 2.280285, 0, 0.8745098, 1, 1,
0.1372533, -1.376192, 4.262648, 0, 0.8666667, 1, 1,
0.1391452, -0.5512, 2.505665, 0, 0.8627451, 1, 1,
0.1396343, 1.76583, 1.115897, 0, 0.854902, 1, 1,
0.1399059, 0.5609128, 0.8000076, 0, 0.8509804, 1, 1,
0.143884, 0.2908803, 0.9863421, 0, 0.8431373, 1, 1,
0.1442856, 0.3345519, -0.0451306, 0, 0.8392157, 1, 1,
0.1470021, -0.6987548, 3.573235, 0, 0.8313726, 1, 1,
0.1471865, 1.352919, -0.5448824, 0, 0.827451, 1, 1,
0.1508726, 0.3704923, -0.1370339, 0, 0.8196079, 1, 1,
0.1526481, -0.06859006, 1.889288, 0, 0.8156863, 1, 1,
0.158931, -0.9499325, 1.86149, 0, 0.8078431, 1, 1,
0.1651032, -1.187738, 2.515457, 0, 0.8039216, 1, 1,
0.1683517, 0.3706909, 1.083592, 0, 0.7960784, 1, 1,
0.1690453, -1.464566, 2.608963, 0, 0.7882353, 1, 1,
0.1699487, 0.9206606, 0.6444184, 0, 0.7843137, 1, 1,
0.1730571, -2.646483, 2.761521, 0, 0.7764706, 1, 1,
0.1758877, 1.379682, 1.840399, 0, 0.772549, 1, 1,
0.1788521, -1.134798, 2.685399, 0, 0.7647059, 1, 1,
0.1790768, 0.1408645, 1.041894, 0, 0.7607843, 1, 1,
0.1810849, 0.3525668, -0.1119475, 0, 0.7529412, 1, 1,
0.1842701, -1.210695, 3.707451, 0, 0.7490196, 1, 1,
0.1855809, -1.57222, 1.73509, 0, 0.7411765, 1, 1,
0.1876071, 0.06518938, 2.800908, 0, 0.7372549, 1, 1,
0.1921206, -0.06930098, 2.221734, 0, 0.7294118, 1, 1,
0.1929413, -1.70065, 5.497229, 0, 0.7254902, 1, 1,
0.1934482, 0.9383725, 0.9084441, 0, 0.7176471, 1, 1,
0.1948376, 0.3133254, 1.126969, 0, 0.7137255, 1, 1,
0.1956471, -0.05702852, 2.816978, 0, 0.7058824, 1, 1,
0.2006422, 0.9486911, -0.5583484, 0, 0.6980392, 1, 1,
0.203835, -1.125918, 1.926834, 0, 0.6941177, 1, 1,
0.210519, 1.873194, -0.4738672, 0, 0.6862745, 1, 1,
0.2171055, -0.5082803, 2.779696, 0, 0.682353, 1, 1,
0.2183681, -0.7419893, 2.759296, 0, 0.6745098, 1, 1,
0.2186229, 0.6895283, -0.562827, 0, 0.6705883, 1, 1,
0.2192205, -0.332184, 3.316851, 0, 0.6627451, 1, 1,
0.2279563, 2.220211, 0.8086919, 0, 0.6588235, 1, 1,
0.2290696, -0.1174403, 3.153747, 0, 0.6509804, 1, 1,
0.2304402, -0.3200737, 2.525001, 0, 0.6470588, 1, 1,
0.2397609, 2.862174, 1.110551, 0, 0.6392157, 1, 1,
0.240919, 0.9312971, -1.41666, 0, 0.6352941, 1, 1,
0.2461289, -0.2785406, 3.812433, 0, 0.627451, 1, 1,
0.2477167, 1.244461, -0.3284178, 0, 0.6235294, 1, 1,
0.251811, 0.2205992, 1.453826, 0, 0.6156863, 1, 1,
0.2576977, -0.8166807, 2.518095, 0, 0.6117647, 1, 1,
0.2639592, 0.5682372, 0.4438256, 0, 0.6039216, 1, 1,
0.2647923, 0.178753, 1.612935, 0, 0.5960785, 1, 1,
0.2651287, -0.9267163, 4.247451, 0, 0.5921569, 1, 1,
0.2690849, -0.6020737, 3.999605, 0, 0.5843138, 1, 1,
0.2750211, 1.855301, 0.6168863, 0, 0.5803922, 1, 1,
0.2789447, -0.6720797, 3.117216, 0, 0.572549, 1, 1,
0.2831638, -1.109022, 3.232974, 0, 0.5686275, 1, 1,
0.284937, 0.5834346, 0.9266627, 0, 0.5607843, 1, 1,
0.287414, 0.2605163, -0.4955425, 0, 0.5568628, 1, 1,
0.2934926, -0.1201053, 1.725027, 0, 0.5490196, 1, 1,
0.2976987, -0.7955964, 2.764866, 0, 0.5450981, 1, 1,
0.2997333, 0.3047658, -0.07842961, 0, 0.5372549, 1, 1,
0.3028999, 0.5429541, -0.7309578, 0, 0.5333334, 1, 1,
0.306327, 0.3841146, -0.3163948, 0, 0.5254902, 1, 1,
0.31081, -0.892252, 2.220857, 0, 0.5215687, 1, 1,
0.3132394, -0.8668556, 3.827327, 0, 0.5137255, 1, 1,
0.3175256, 1.318444, -0.06392781, 0, 0.509804, 1, 1,
0.3175579, 0.2866529, 2.506993, 0, 0.5019608, 1, 1,
0.3185074, -0.5091745, 2.426403, 0, 0.4941176, 1, 1,
0.3210327, 0.6369771, -0.7662772, 0, 0.4901961, 1, 1,
0.323177, 0.1781408, 0.3824388, 0, 0.4823529, 1, 1,
0.3232265, 0.4989688, -0.1197511, 0, 0.4784314, 1, 1,
0.3304713, 0.05901438, 2.437627, 0, 0.4705882, 1, 1,
0.3324034, 1.416264, -2.044403, 0, 0.4666667, 1, 1,
0.3343098, 1.789888, -1.829567, 0, 0.4588235, 1, 1,
0.3377573, 0.2050293, -0.3744323, 0, 0.454902, 1, 1,
0.338992, -0.1798553, 1.663279, 0, 0.4470588, 1, 1,
0.3392871, 0.07868172, -1.254131, 0, 0.4431373, 1, 1,
0.3395979, -0.3689652, 2.375037, 0, 0.4352941, 1, 1,
0.3403361, 0.1233598, 0.7395683, 0, 0.4313726, 1, 1,
0.3445218, 0.2029877, 2.159652, 0, 0.4235294, 1, 1,
0.349509, 0.715861, 0.8129757, 0, 0.4196078, 1, 1,
0.3496588, 0.5969789, -0.3942241, 0, 0.4117647, 1, 1,
0.3585711, 0.3099543, 1.157934, 0, 0.4078431, 1, 1,
0.3599685, 1.155772, 2.089967, 0, 0.4, 1, 1,
0.3599719, -0.1427804, -0.2357215, 0, 0.3921569, 1, 1,
0.360783, 1.18629, 1.08455, 0, 0.3882353, 1, 1,
0.3611186, -1.066193, 4.486087, 0, 0.3803922, 1, 1,
0.3633081, -0.3955489, 3.592598, 0, 0.3764706, 1, 1,
0.3649113, -1.914945, 2.820374, 0, 0.3686275, 1, 1,
0.3691597, 0.3327157, 3.448358, 0, 0.3647059, 1, 1,
0.3740678, 0.5286915, 0.2450782, 0, 0.3568628, 1, 1,
0.3778484, 2.670686, 0.5929787, 0, 0.3529412, 1, 1,
0.3790319, -0.5922977, 3.323383, 0, 0.345098, 1, 1,
0.3801388, 0.7326054, -0.7304706, 0, 0.3411765, 1, 1,
0.3815124, -0.2624276, 1.886785, 0, 0.3333333, 1, 1,
0.3848773, -0.6644247, 3.581051, 0, 0.3294118, 1, 1,
0.3859705, 1.646731, 0.4534467, 0, 0.3215686, 1, 1,
0.3869753, 0.09179654, 0.05471125, 0, 0.3176471, 1, 1,
0.3887254, 2.198355, 0.9688252, 0, 0.3098039, 1, 1,
0.3920903, 1.110282, 0.1746103, 0, 0.3058824, 1, 1,
0.3921027, -0.9299062, 3.432693, 0, 0.2980392, 1, 1,
0.3980587, -0.9233564, 2.912656, 0, 0.2901961, 1, 1,
0.3980661, -0.6975859, 3.048396, 0, 0.2862745, 1, 1,
0.3987999, 0.3480764, 1.950915, 0, 0.2784314, 1, 1,
0.3990878, 0.2863728, 0.4899258, 0, 0.2745098, 1, 1,
0.4011526, -1.090581, 2.49469, 0, 0.2666667, 1, 1,
0.4024592, -1.304629, 2.19587, 0, 0.2627451, 1, 1,
0.4031446, 1.171113, 0.7943816, 0, 0.254902, 1, 1,
0.4034135, 0.3650021, 1.782818, 0, 0.2509804, 1, 1,
0.4051766, -1.496636, 3.548034, 0, 0.2431373, 1, 1,
0.4065285, -1.134267, 1.246759, 0, 0.2392157, 1, 1,
0.408186, -1.757869, 3.046196, 0, 0.2313726, 1, 1,
0.4089533, -0.7916753, 2.702877, 0, 0.227451, 1, 1,
0.4089864, 0.4563242, 0.3651448, 0, 0.2196078, 1, 1,
0.4177343, 0.5650512, -0.09042531, 0, 0.2156863, 1, 1,
0.4217165, 0.3520617, 1.819759, 0, 0.2078431, 1, 1,
0.4239273, -0.289382, 1.457253, 0, 0.2039216, 1, 1,
0.4242201, -1.143627, 2.544076, 0, 0.1960784, 1, 1,
0.4269805, 0.7406506, 1.731221, 0, 0.1882353, 1, 1,
0.4290177, -0.1436696, 2.001689, 0, 0.1843137, 1, 1,
0.4316664, 0.2508308, 0.4115487, 0, 0.1764706, 1, 1,
0.4317807, -0.8260294, 1.640426, 0, 0.172549, 1, 1,
0.432023, 0.6977612, 0.09036964, 0, 0.1647059, 1, 1,
0.4365563, 0.4028538, 1.718363, 0, 0.1607843, 1, 1,
0.4388081, -0.604111, 1.387852, 0, 0.1529412, 1, 1,
0.4403306, -0.507548, 2.10575, 0, 0.1490196, 1, 1,
0.4406354, -1.28643, 2.646507, 0, 0.1411765, 1, 1,
0.4418839, -2.403128, 2.723275, 0, 0.1372549, 1, 1,
0.4446656, 0.02696902, 0.704329, 0, 0.1294118, 1, 1,
0.4455546, -1.112256, 2.603761, 0, 0.1254902, 1, 1,
0.4480959, -1.451182, 3.116021, 0, 0.1176471, 1, 1,
0.4513912, 0.6703975, 1.318, 0, 0.1137255, 1, 1,
0.4527291, 1.218865, -1.123176, 0, 0.1058824, 1, 1,
0.4533313, -0.2366073, 1.163344, 0, 0.09803922, 1, 1,
0.4537261, -1.036812, 1.856385, 0, 0.09411765, 1, 1,
0.4551878, -0.7661871, 4.294333, 0, 0.08627451, 1, 1,
0.4571874, 0.4550799, 1.770085, 0, 0.08235294, 1, 1,
0.4576166, -1.811648, 0.3069268, 0, 0.07450981, 1, 1,
0.4581614, 1.286173, -0.2680442, 0, 0.07058824, 1, 1,
0.4634278, -0.8957233, 2.876697, 0, 0.0627451, 1, 1,
0.4722796, -1.319946, 3.373329, 0, 0.05882353, 1, 1,
0.4742075, -1.72529, 3.681234, 0, 0.05098039, 1, 1,
0.4750194, -0.4796509, 2.702363, 0, 0.04705882, 1, 1,
0.4819123, 0.4059128, 1.826683, 0, 0.03921569, 1, 1,
0.4829157, 0.7970528, 0.8109559, 0, 0.03529412, 1, 1,
0.4898252, 0.5236182, 1.516313, 0, 0.02745098, 1, 1,
0.4962416, 0.2100445, 0.8331116, 0, 0.02352941, 1, 1,
0.4991949, -0.5093514, 1.800998, 0, 0.01568628, 1, 1,
0.5058887, -0.5487148, 3.281602, 0, 0.01176471, 1, 1,
0.5087725, 1.675865, 1.612931, 0, 0.003921569, 1, 1,
0.5117123, -0.04035441, 0.2308675, 0.003921569, 0, 1, 1,
0.5122349, 0.4098612, 1.571454, 0.007843138, 0, 1, 1,
0.5155433, 0.5018662, 0.7999502, 0.01568628, 0, 1, 1,
0.5268221, -0.5589894, 2.368486, 0.01960784, 0, 1, 1,
0.5360867, 0.9035656, 2.332289, 0.02745098, 0, 1, 1,
0.5369992, -1.426192, 1.545951, 0.03137255, 0, 1, 1,
0.5394927, 0.3162607, 2.637851, 0.03921569, 0, 1, 1,
0.5397205, -0.3106463, 1.963492, 0.04313726, 0, 1, 1,
0.5404863, -0.1290125, 3.345528, 0.05098039, 0, 1, 1,
0.5424563, 0.3843367, 1.970197, 0.05490196, 0, 1, 1,
0.5425053, -1.901441, 0.5174509, 0.0627451, 0, 1, 1,
0.5456265, -1.59436, 2.629225, 0.06666667, 0, 1, 1,
0.5479491, -0.8679958, 2.767754, 0.07450981, 0, 1, 1,
0.5534515, 1.35872, -0.711952, 0.07843138, 0, 1, 1,
0.5572831, 0.3464887, 3.266054, 0.08627451, 0, 1, 1,
0.5582511, -0.7296666, 1.45874, 0.09019608, 0, 1, 1,
0.5583223, -0.8123898, 2.331199, 0.09803922, 0, 1, 1,
0.5619684, -0.6322564, 2.535829, 0.1058824, 0, 1, 1,
0.5635309, -1.618104, 2.654258, 0.1098039, 0, 1, 1,
0.5648204, 0.4173657, 0.9830695, 0.1176471, 0, 1, 1,
0.5655249, 0.2246559, 2.266577, 0.1215686, 0, 1, 1,
0.565949, 0.06059431, 3.456021, 0.1294118, 0, 1, 1,
0.5690172, -0.2284407, 1.826074, 0.1333333, 0, 1, 1,
0.5703419, -0.8031986, 1.989941, 0.1411765, 0, 1, 1,
0.5726923, 0.1550857, -0.5716128, 0.145098, 0, 1, 1,
0.579719, 0.1220182, 0.6990957, 0.1529412, 0, 1, 1,
0.5804437, -0.1846389, 1.97245, 0.1568628, 0, 1, 1,
0.5834787, -0.3063485, 1.463777, 0.1647059, 0, 1, 1,
0.5850429, -0.6352319, 1.933034, 0.1686275, 0, 1, 1,
0.5865563, -0.5760809, 2.783613, 0.1764706, 0, 1, 1,
0.5905931, -0.3957908, 0.1683603, 0.1803922, 0, 1, 1,
0.5943791, -0.4169139, 2.676458, 0.1882353, 0, 1, 1,
0.5959302, -1.183088, 1.207889, 0.1921569, 0, 1, 1,
0.5964333, -0.3487375, 2.797504, 0.2, 0, 1, 1,
0.5972542, -0.08936109, 2.528194, 0.2078431, 0, 1, 1,
0.5990272, 2.635, 2.066138, 0.2117647, 0, 1, 1,
0.6011885, -0.7235342, 3.076594, 0.2196078, 0, 1, 1,
0.6029987, -0.4278053, 1.468322, 0.2235294, 0, 1, 1,
0.611937, 0.5692537, 1.55811, 0.2313726, 0, 1, 1,
0.6124111, -0.9774978, 1.824593, 0.2352941, 0, 1, 1,
0.6210102, -0.6753891, 1.747227, 0.2431373, 0, 1, 1,
0.6242153, 0.4447276, 1.373973, 0.2470588, 0, 1, 1,
0.6259158, 0.5746331, 2.534009, 0.254902, 0, 1, 1,
0.6321828, 1.309378, 0.7135502, 0.2588235, 0, 1, 1,
0.6344109, -1.069865, 1.356385, 0.2666667, 0, 1, 1,
0.6365206, 0.3094522, 0.7990937, 0.2705882, 0, 1, 1,
0.6391012, -0.1761572, 1.824588, 0.2784314, 0, 1, 1,
0.6414856, -2.287632, 4.095522, 0.282353, 0, 1, 1,
0.6438651, -0.0333943, 1.112165, 0.2901961, 0, 1, 1,
0.6457387, 0.8644185, -0.2856761, 0.2941177, 0, 1, 1,
0.64997, -0.1858585, 0.83397, 0.3019608, 0, 1, 1,
0.653082, 1.133736, 1.285401, 0.3098039, 0, 1, 1,
0.6545171, -1.961212, 3.221035, 0.3137255, 0, 1, 1,
0.6546929, 0.5295003, -1.554544, 0.3215686, 0, 1, 1,
0.66303, 1.261612, 0.7012247, 0.3254902, 0, 1, 1,
0.6652089, 0.1129761, 1.05891, 0.3333333, 0, 1, 1,
0.6662023, 0.3977091, 1.488386, 0.3372549, 0, 1, 1,
0.6694564, 0.4264936, 0.7908953, 0.345098, 0, 1, 1,
0.6704166, 1.094404, 0.5544655, 0.3490196, 0, 1, 1,
0.6719179, 0.4610158, 0.1841007, 0.3568628, 0, 1, 1,
0.6730413, 0.1189228, 0.5832849, 0.3607843, 0, 1, 1,
0.675419, -0.8603655, 0.5572226, 0.3686275, 0, 1, 1,
0.6765624, 0.6172627, -0.2899624, 0.372549, 0, 1, 1,
0.6825993, 0.5143909, 0.7118137, 0.3803922, 0, 1, 1,
0.6827113, 1.23172, 0.2505171, 0.3843137, 0, 1, 1,
0.6830899, 0.9994363, 0.6487756, 0.3921569, 0, 1, 1,
0.6865879, 0.9930477, 3.294697, 0.3960784, 0, 1, 1,
0.6878602, 0.2639917, -0.3904, 0.4039216, 0, 1, 1,
0.6915844, -0.6852402, 2.906697, 0.4117647, 0, 1, 1,
0.6920527, 0.5749954, -0.09393702, 0.4156863, 0, 1, 1,
0.6941503, 0.6832566, 1.457035, 0.4235294, 0, 1, 1,
0.6956809, 0.6302038, 2.47193, 0.427451, 0, 1, 1,
0.7012759, 0.4779576, 0.6271282, 0.4352941, 0, 1, 1,
0.7045078, 0.2419479, 1.07335, 0.4392157, 0, 1, 1,
0.705685, -1.24902, 3.135351, 0.4470588, 0, 1, 1,
0.7137585, -0.3914228, 0.2565826, 0.4509804, 0, 1, 1,
0.717226, -1.147768, 2.690399, 0.4588235, 0, 1, 1,
0.7266394, -0.06864724, 2.211493, 0.4627451, 0, 1, 1,
0.7369086, -0.3336084, 2.989763, 0.4705882, 0, 1, 1,
0.7375613, -0.7421213, 2.790088, 0.4745098, 0, 1, 1,
0.738329, 0.4494075, 0.007416134, 0.4823529, 0, 1, 1,
0.7405533, -1.242222, 2.836298, 0.4862745, 0, 1, 1,
0.7438405, 2.90344, 0.9528652, 0.4941176, 0, 1, 1,
0.7446824, 0.5967917, 2.420683, 0.5019608, 0, 1, 1,
0.7450385, -1.90704, 2.93159, 0.5058824, 0, 1, 1,
0.7458634, -0.2300009, 1.851472, 0.5137255, 0, 1, 1,
0.748135, 1.724862, 0.5456144, 0.5176471, 0, 1, 1,
0.7488426, 0.4181777, 1.279426, 0.5254902, 0, 1, 1,
0.7503549, -0.7962871, 2.872799, 0.5294118, 0, 1, 1,
0.7547854, -1.032481, 3.011523, 0.5372549, 0, 1, 1,
0.7550288, -0.9939595, 3.87743, 0.5411765, 0, 1, 1,
0.7675356, -0.1183352, 3.114214, 0.5490196, 0, 1, 1,
0.7689334, 0.6420286, 0.2626037, 0.5529412, 0, 1, 1,
0.7759216, 1.148073, -1.338859, 0.5607843, 0, 1, 1,
0.7823258, 0.8263202, 0.6688424, 0.5647059, 0, 1, 1,
0.7848511, -0.8674557, 1.589024, 0.572549, 0, 1, 1,
0.7883332, -0.3420355, 0.6210327, 0.5764706, 0, 1, 1,
0.7889344, 0.2686226, -0.1312113, 0.5843138, 0, 1, 1,
0.8003889, 1.526667, 1.142186, 0.5882353, 0, 1, 1,
0.8021056, -0.1738599, 1.272594, 0.5960785, 0, 1, 1,
0.8043541, -0.8956242, 1.698091, 0.6039216, 0, 1, 1,
0.8076183, 1.693901, -1.002276, 0.6078432, 0, 1, 1,
0.8118301, 0.8484314, 2.073003, 0.6156863, 0, 1, 1,
0.8154422, -0.2863441, 0.5413971, 0.6196079, 0, 1, 1,
0.8166463, -0.5676324, 2.839861, 0.627451, 0, 1, 1,
0.8206831, -1.598285, 2.283638, 0.6313726, 0, 1, 1,
0.8212888, -0.08944435, 3.619404, 0.6392157, 0, 1, 1,
0.8234094, -0.5068091, 1.856426, 0.6431373, 0, 1, 1,
0.8324564, -0.3446228, 2.094063, 0.6509804, 0, 1, 1,
0.8382891, -0.2068229, 2.009332, 0.654902, 0, 1, 1,
0.8394469, 0.2756349, 1.616395, 0.6627451, 0, 1, 1,
0.8411499, -0.2221671, 3.394393, 0.6666667, 0, 1, 1,
0.8434984, -1.683879, 1.746815, 0.6745098, 0, 1, 1,
0.8441761, 0.2640235, 1.355147, 0.6784314, 0, 1, 1,
0.8451077, -1.624388, 2.050398, 0.6862745, 0, 1, 1,
0.8458468, 0.006549892, 2.656438, 0.6901961, 0, 1, 1,
0.849744, 1.548938, 0.9288469, 0.6980392, 0, 1, 1,
0.8547595, -1.074414, 3.541825, 0.7058824, 0, 1, 1,
0.8550367, -0.3360628, 2.924086, 0.7098039, 0, 1, 1,
0.8560649, 0.0321601, 0.7213981, 0.7176471, 0, 1, 1,
0.8608739, 0.08358902, 2.303879, 0.7215686, 0, 1, 1,
0.8616326, -0.3504, 2.231195, 0.7294118, 0, 1, 1,
0.8643671, 1.194337, 0.8424425, 0.7333333, 0, 1, 1,
0.8667574, -0.9635181, 2.216528, 0.7411765, 0, 1, 1,
0.8704544, -0.2287026, 2.18337, 0.7450981, 0, 1, 1,
0.8732459, -0.3498381, 1.721481, 0.7529412, 0, 1, 1,
0.873975, -0.2360267, 2.401129, 0.7568628, 0, 1, 1,
0.883998, -0.8954473, 1.992125, 0.7647059, 0, 1, 1,
0.8867239, -0.1107115, 1.938435, 0.7686275, 0, 1, 1,
0.8904851, -0.5444109, 3.612263, 0.7764706, 0, 1, 1,
0.890754, 0.0668636, 0.9635954, 0.7803922, 0, 1, 1,
0.90199, 1.143843, 2.158084, 0.7882353, 0, 1, 1,
0.9027618, -0.9901711, 1.344395, 0.7921569, 0, 1, 1,
0.9037493, -1.024151, 2.717892, 0.8, 0, 1, 1,
0.9054202, -0.04384626, -0.3971528, 0.8078431, 0, 1, 1,
0.9060986, 1.626108, 0.3059033, 0.8117647, 0, 1, 1,
0.9070302, 1.65194, 0.9158618, 0.8196079, 0, 1, 1,
0.9083088, -0.04074671, 4.315878, 0.8235294, 0, 1, 1,
0.908319, 0.01848552, 1.603526, 0.8313726, 0, 1, 1,
0.9084562, -0.1827225, 2.396321, 0.8352941, 0, 1, 1,
0.9149514, 0.5969022, 0.5855605, 0.8431373, 0, 1, 1,
0.9226345, -0.6465822, 3.115858, 0.8470588, 0, 1, 1,
0.9290136, -2.180393, 3.99816, 0.854902, 0, 1, 1,
0.9291559, 0.04260795, 4.401713, 0.8588235, 0, 1, 1,
0.9303824, -0.4274011, 2.122932, 0.8666667, 0, 1, 1,
0.9384543, 0.9310931, 2.234331, 0.8705882, 0, 1, 1,
0.9386505, -1.67569, 1.216296, 0.8784314, 0, 1, 1,
0.9416257, -0.4827315, 1.053273, 0.8823529, 0, 1, 1,
0.9478742, 0.1321141, 3.014275, 0.8901961, 0, 1, 1,
0.9526741, -0.337033, 2.578602, 0.8941177, 0, 1, 1,
0.9556318, -1.488674, 3.10444, 0.9019608, 0, 1, 1,
0.9633622, -1.065431, 2.262591, 0.9098039, 0, 1, 1,
0.9634295, 1.243796, 0.3909355, 0.9137255, 0, 1, 1,
0.9635464, 1.038637, 2.837517, 0.9215686, 0, 1, 1,
0.963571, -2.286326, 4.109543, 0.9254902, 0, 1, 1,
0.9669312, -0.9047588, 1.944335, 0.9333333, 0, 1, 1,
0.9736164, -1.327113, 3.177893, 0.9372549, 0, 1, 1,
0.9827167, 2.24487, -0.3742467, 0.945098, 0, 1, 1,
0.9901353, -1.078172, 1.940603, 0.9490196, 0, 1, 1,
0.9942673, -0.3816622, 2.919384, 0.9568627, 0, 1, 1,
0.9973372, 0.3794578, 1.50564, 0.9607843, 0, 1, 1,
1.002716, -0.7815219, 3.101509, 0.9686275, 0, 1, 1,
1.005915, -0.2600172, 1.465755, 0.972549, 0, 1, 1,
1.017198, -0.7712337, 3.004678, 0.9803922, 0, 1, 1,
1.024881, -0.6424507, 2.784799, 0.9843137, 0, 1, 1,
1.033048, -0.1291704, 2.912463, 0.9921569, 0, 1, 1,
1.033676, 0.5643705, 0.3660614, 0.9960784, 0, 1, 1,
1.037957, -0.4452728, 0.9953961, 1, 0, 0.9960784, 1,
1.044305, 0.8799599, 1.768127, 1, 0, 0.9882353, 1,
1.052525, 1.265152, 0.2652594, 1, 0, 0.9843137, 1,
1.053789, -1.163115, 1.916572, 1, 0, 0.9764706, 1,
1.056534, -1.342928, 2.451766, 1, 0, 0.972549, 1,
1.06552, -0.7658525, 2.167302, 1, 0, 0.9647059, 1,
1.067631, -0.3248872, 1.576877, 1, 0, 0.9607843, 1,
1.070117, 0.1246081, 0.2174093, 1, 0, 0.9529412, 1,
1.088333, -1.012334, 1.561212, 1, 0, 0.9490196, 1,
1.089455, 0.255412, 1.278357, 1, 0, 0.9411765, 1,
1.090179, -0.04327991, -0.9775339, 1, 0, 0.9372549, 1,
1.097226, -0.7215751, 4.135638, 1, 0, 0.9294118, 1,
1.101816, -0.3468131, 3.504367, 1, 0, 0.9254902, 1,
1.101997, 1.477426, 0.1875561, 1, 0, 0.9176471, 1,
1.10366, -1.365571, 4.039028, 1, 0, 0.9137255, 1,
1.104481, 1.449484, 1.993968, 1, 0, 0.9058824, 1,
1.109988, -0.2766645, -0.1408994, 1, 0, 0.9019608, 1,
1.120088, 0.4644597, -0.4986838, 1, 0, 0.8941177, 1,
1.120669, -1.823437, 3.3713, 1, 0, 0.8862745, 1,
1.122631, 0.1027215, 3.490067, 1, 0, 0.8823529, 1,
1.122704, -0.5661855, 1.949282, 1, 0, 0.8745098, 1,
1.122712, 0.09846168, 0.7811084, 1, 0, 0.8705882, 1,
1.125268, 0.9551997, 0.5541224, 1, 0, 0.8627451, 1,
1.129101, 0.8762263, -0.9791802, 1, 0, 0.8588235, 1,
1.131889, -0.8500929, 2.625024, 1, 0, 0.8509804, 1,
1.132759, 0.08119684, 2.805553, 1, 0, 0.8470588, 1,
1.133548, -0.8844128, 1.587021, 1, 0, 0.8392157, 1,
1.135602, 1.375347, -1.749097, 1, 0, 0.8352941, 1,
1.137675, 1.844698, 0.02987893, 1, 0, 0.827451, 1,
1.148518, 0.6976051, 0.723954, 1, 0, 0.8235294, 1,
1.151974, 0.2464, -0.6081678, 1, 0, 0.8156863, 1,
1.155436, 0.4515043, 1.20814, 1, 0, 0.8117647, 1,
1.158039, -0.1192818, 0.4113383, 1, 0, 0.8039216, 1,
1.158069, 1.389448, 0.8162865, 1, 0, 0.7960784, 1,
1.161356, 1.490643, -0.3420908, 1, 0, 0.7921569, 1,
1.161551, 0.6682262, 0.01858633, 1, 0, 0.7843137, 1,
1.165977, 2.060386, 1.404912, 1, 0, 0.7803922, 1,
1.169948, -1.082521, 1.266329, 1, 0, 0.772549, 1,
1.171755, 1.110247, -0.643564, 1, 0, 0.7686275, 1,
1.177038, 1.103602, 2.21912, 1, 0, 0.7607843, 1,
1.180744, 0.3893403, 1.392476, 1, 0, 0.7568628, 1,
1.181274, 0.3451992, 1.421211, 1, 0, 0.7490196, 1,
1.18294, 2.969394, -0.2205806, 1, 0, 0.7450981, 1,
1.186374, 0.4869126, 0.4707666, 1, 0, 0.7372549, 1,
1.187585, 0.2942775, -1.462885, 1, 0, 0.7333333, 1,
1.191214, -0.824827, 2.965618, 1, 0, 0.7254902, 1,
1.196486, 0.06504944, 1.543108, 1, 0, 0.7215686, 1,
1.202448, -1.010867, 2.886047, 1, 0, 0.7137255, 1,
1.202457, -1.187157, 3.476034, 1, 0, 0.7098039, 1,
1.208352, 0.1591207, 1.800845, 1, 0, 0.7019608, 1,
1.218221, -0.1230393, 1.826269, 1, 0, 0.6941177, 1,
1.219622, -0.3022395, 2.474294, 1, 0, 0.6901961, 1,
1.219968, 0.8526897, 0.1186292, 1, 0, 0.682353, 1,
1.220049, 0.5818989, 1.505165, 1, 0, 0.6784314, 1,
1.220248, -0.3059927, 0.8857829, 1, 0, 0.6705883, 1,
1.222929, -0.396062, 2.44353, 1, 0, 0.6666667, 1,
1.223244, 0.03647038, 1.245527, 1, 0, 0.6588235, 1,
1.223407, 0.722589, 1.015303, 1, 0, 0.654902, 1,
1.224538, 0.2493917, 1.801925, 1, 0, 0.6470588, 1,
1.225965, 0.778986, 2.115781, 1, 0, 0.6431373, 1,
1.229742, -0.5201992, 1.764501, 1, 0, 0.6352941, 1,
1.232045, 1.655724, 0.2847457, 1, 0, 0.6313726, 1,
1.234629, -0.3825376, 0.8997431, 1, 0, 0.6235294, 1,
1.239974, -0.5477061, 1.504164, 1, 0, 0.6196079, 1,
1.244406, 0.7726821, 2.136549, 1, 0, 0.6117647, 1,
1.245753, 1.716064, -0.3636516, 1, 0, 0.6078432, 1,
1.256579, -0.150162, 0.999224, 1, 0, 0.6, 1,
1.263535, -1.023451, 2.32162, 1, 0, 0.5921569, 1,
1.266363, -1.451049, 3.45775, 1, 0, 0.5882353, 1,
1.278426, 0.7958841, 0.01169398, 1, 0, 0.5803922, 1,
1.285136, -0.6107613, 0.8662227, 1, 0, 0.5764706, 1,
1.30071, -0.4925499, 2.664855, 1, 0, 0.5686275, 1,
1.30166, 1.85986, 1.219834, 1, 0, 0.5647059, 1,
1.307001, -1.875633, 2.195008, 1, 0, 0.5568628, 1,
1.312215, 2.060679, 1.063085, 1, 0, 0.5529412, 1,
1.326054, -0.1393285, 1.369315, 1, 0, 0.5450981, 1,
1.3262, -0.642104, 1.725315, 1, 0, 0.5411765, 1,
1.339723, -1.116909, 3.170983, 1, 0, 0.5333334, 1,
1.348402, -0.09688601, 2.351565, 1, 0, 0.5294118, 1,
1.357969, -0.7106935, 0.3522283, 1, 0, 0.5215687, 1,
1.359146, 1.070772, -0.3053031, 1, 0, 0.5176471, 1,
1.359274, 1.174476, -0.01285639, 1, 0, 0.509804, 1,
1.362459, 2.182193, 1.26343, 1, 0, 0.5058824, 1,
1.367305, 1.429782, 1.605707, 1, 0, 0.4980392, 1,
1.386873, 1.231718, -0.1952751, 1, 0, 0.4901961, 1,
1.387173, -0.8309166, 1.46637, 1, 0, 0.4862745, 1,
1.392443, 0.1229358, 1.238798, 1, 0, 0.4784314, 1,
1.407771, -0.7017829, 1.89707, 1, 0, 0.4745098, 1,
1.428741, -0.1735795, 2.117896, 1, 0, 0.4666667, 1,
1.428966, 0.5293916, 1.166037, 1, 0, 0.4627451, 1,
1.438141, 0.365265, 1.64382, 1, 0, 0.454902, 1,
1.441256, -0.8554065, 1.474714, 1, 0, 0.4509804, 1,
1.444675, -0.07296424, 1.550932, 1, 0, 0.4431373, 1,
1.456443, -0.1205047, 2.551751, 1, 0, 0.4392157, 1,
1.473785, -0.5827523, 2.358677, 1, 0, 0.4313726, 1,
1.477337, -0.9099597, 2.392144, 1, 0, 0.427451, 1,
1.481616, -0.1617676, 1.614044, 1, 0, 0.4196078, 1,
1.491837, 1.506966, -0.3879771, 1, 0, 0.4156863, 1,
1.524344, 0.02594613, 0.5632282, 1, 0, 0.4078431, 1,
1.52669, -1.430208, 1.971881, 1, 0, 0.4039216, 1,
1.537233, 1.603005, 1.946645, 1, 0, 0.3960784, 1,
1.540102, -2.633377, 2.043142, 1, 0, 0.3882353, 1,
1.542518, -1.445253, 0.6633907, 1, 0, 0.3843137, 1,
1.548926, -1.523859, 2.760655, 1, 0, 0.3764706, 1,
1.554211, -0.6839461, 2.924756, 1, 0, 0.372549, 1,
1.559002, 1.320717, -0.06667887, 1, 0, 0.3647059, 1,
1.582263, -0.3977475, 2.325683, 1, 0, 0.3607843, 1,
1.58264, 0.2606462, 0.2490969, 1, 0, 0.3529412, 1,
1.584791, 0.3257055, -1.31084, 1, 0, 0.3490196, 1,
1.609564, -1.377694, 1.555394, 1, 0, 0.3411765, 1,
1.613438, 0.1930479, 1.557146, 1, 0, 0.3372549, 1,
1.631101, -0.3202047, 1.181495, 1, 0, 0.3294118, 1,
1.631818, 0.9379661, 2.217307, 1, 0, 0.3254902, 1,
1.632929, 1.03478, 0.8033919, 1, 0, 0.3176471, 1,
1.644446, 0.02976084, 3.589287, 1, 0, 0.3137255, 1,
1.661636, 0.123896, 0.619355, 1, 0, 0.3058824, 1,
1.670627, -1.687241, 1.347977, 1, 0, 0.2980392, 1,
1.683691, 0.1148497, 0.9901512, 1, 0, 0.2941177, 1,
1.693537, -1.29019, 1.480731, 1, 0, 0.2862745, 1,
1.69837, 1.621177, 2.761405, 1, 0, 0.282353, 1,
1.705812, 0.5883016, 1.516142, 1, 0, 0.2745098, 1,
1.715336, -1.236463, 0.3365943, 1, 0, 0.2705882, 1,
1.717429, 1.753935, 2.581289, 1, 0, 0.2627451, 1,
1.734478, 1.739118, 1.376625, 1, 0, 0.2588235, 1,
1.736701, -0.1615294, 1.48248, 1, 0, 0.2509804, 1,
1.740934, 0.5494104, 1.046728, 1, 0, 0.2470588, 1,
1.745283, 0.5267796, 1.154856, 1, 0, 0.2392157, 1,
1.754928, -0.3116018, 1.680272, 1, 0, 0.2352941, 1,
1.756023, 0.2482625, 2.509558, 1, 0, 0.227451, 1,
1.763004, -0.05726331, 1.988582, 1, 0, 0.2235294, 1,
1.763458, -0.03461259, 0.6134129, 1, 0, 0.2156863, 1,
1.769986, 1.793502, 0.08400565, 1, 0, 0.2117647, 1,
1.770707, -1.154791, 1.761336, 1, 0, 0.2039216, 1,
1.771919, 2.935514, -1.215284, 1, 0, 0.1960784, 1,
1.782517, -0.06153109, 1.366526, 1, 0, 0.1921569, 1,
1.783211, -0.2346346, 1.357003, 1, 0, 0.1843137, 1,
1.787986, 0.7843563, 1.849172, 1, 0, 0.1803922, 1,
1.804296, 0.4339969, 1.801213, 1, 0, 0.172549, 1,
1.826104, 0.2556382, 0.2642835, 1, 0, 0.1686275, 1,
1.826784, -1.494393, 1.742704, 1, 0, 0.1607843, 1,
1.833729, 0.1600795, 2.563349, 1, 0, 0.1568628, 1,
1.842312, -0.8128207, 1.126603, 1, 0, 0.1490196, 1,
1.873144, -0.1140736, 0.7628759, 1, 0, 0.145098, 1,
1.90527, 0.8582366, -0.09609912, 1, 0, 0.1372549, 1,
1.90746, 1.231993, -0.1270801, 1, 0, 0.1333333, 1,
1.908024, -0.03643851, 2.48957, 1, 0, 0.1254902, 1,
1.99995, -0.7517763, 3.365883, 1, 0, 0.1215686, 1,
2.001362, 0.3197358, 1.629853, 1, 0, 0.1137255, 1,
2.024541, -1.368217, 3.857054, 1, 0, 0.1098039, 1,
2.02542, 1.541135, 1.617911, 1, 0, 0.1019608, 1,
2.028072, -0.3167566, 2.187735, 1, 0, 0.09411765, 1,
2.050137, -1.238433, 3.49236, 1, 0, 0.09019608, 1,
2.052618, -1.167096, 1.406065, 1, 0, 0.08235294, 1,
2.078609, -1.002466, 2.05476, 1, 0, 0.07843138, 1,
2.122057, -1.322335, 2.342988, 1, 0, 0.07058824, 1,
2.144932, -2.527616, 1.326977, 1, 0, 0.06666667, 1,
2.168659, 0.4389064, 1.382521, 1, 0, 0.05882353, 1,
2.250301, 0.6203237, 0.7842267, 1, 0, 0.05490196, 1,
2.258474, 0.3482136, 3.042572, 1, 0, 0.04705882, 1,
2.298558, -0.771847, 2.514708, 1, 0, 0.04313726, 1,
2.436623, 0.7881399, 0.5719172, 1, 0, 0.03529412, 1,
2.470083, 0.1114468, 1.338036, 1, 0, 0.03137255, 1,
2.527195, 1.883141, 1.769845, 1, 0, 0.02352941, 1,
2.531961, -1.27545, 1.609959, 1, 0, 0.01960784, 1,
2.635296, 0.6041474, 2.256502, 1, 0, 0.01176471, 1,
2.735338, -0.3306672, 2.94701, 1, 0, 0.007843138, 1
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
-0.5352132, -3.817732, -6.771781, 0, -0.5, 0.5, 0.5,
-0.5352132, -3.817732, -6.771781, 1, -0.5, 0.5, 0.5,
-0.5352132, -3.817732, -6.771781, 1, 1.5, 0.5, 0.5,
-0.5352132, -3.817732, -6.771781, 0, 1.5, 0.5, 0.5
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
-4.914481, 0.06767273, -6.771781, 0, -0.5, 0.5, 0.5,
-4.914481, 0.06767273, -6.771781, 1, -0.5, 0.5, 0.5,
-4.914481, 0.06767273, -6.771781, 1, 1.5, 0.5, 0.5,
-4.914481, 0.06767273, -6.771781, 0, 1.5, 0.5, 0.5
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
-4.914481, -3.817732, 0.2518208, 0, -0.5, 0.5, 0.5,
-4.914481, -3.817732, 0.2518208, 1, -0.5, 0.5, 0.5,
-4.914481, -3.817732, 0.2518208, 1, 1.5, 0.5, 0.5,
-4.914481, -3.817732, 0.2518208, 0, 1.5, 0.5, 0.5
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
-3, -2.9211, -5.15095,
2, -2.9211, -5.15095,
-3, -2.9211, -5.15095,
-3, -3.070539, -5.421088,
-2, -2.9211, -5.15095,
-2, -3.070539, -5.421088,
-1, -2.9211, -5.15095,
-1, -3.070539, -5.421088,
0, -2.9211, -5.15095,
0, -3.070539, -5.421088,
1, -2.9211, -5.15095,
1, -3.070539, -5.421088,
2, -2.9211, -5.15095,
2, -3.070539, -5.421088
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
-3, -3.369416, -5.961365, 0, -0.5, 0.5, 0.5,
-3, -3.369416, -5.961365, 1, -0.5, 0.5, 0.5,
-3, -3.369416, -5.961365, 1, 1.5, 0.5, 0.5,
-3, -3.369416, -5.961365, 0, 1.5, 0.5, 0.5,
-2, -3.369416, -5.961365, 0, -0.5, 0.5, 0.5,
-2, -3.369416, -5.961365, 1, -0.5, 0.5, 0.5,
-2, -3.369416, -5.961365, 1, 1.5, 0.5, 0.5,
-2, -3.369416, -5.961365, 0, 1.5, 0.5, 0.5,
-1, -3.369416, -5.961365, 0, -0.5, 0.5, 0.5,
-1, -3.369416, -5.961365, 1, -0.5, 0.5, 0.5,
-1, -3.369416, -5.961365, 1, 1.5, 0.5, 0.5,
-1, -3.369416, -5.961365, 0, 1.5, 0.5, 0.5,
0, -3.369416, -5.961365, 0, -0.5, 0.5, 0.5,
0, -3.369416, -5.961365, 1, -0.5, 0.5, 0.5,
0, -3.369416, -5.961365, 1, 1.5, 0.5, 0.5,
0, -3.369416, -5.961365, 0, 1.5, 0.5, 0.5,
1, -3.369416, -5.961365, 0, -0.5, 0.5, 0.5,
1, -3.369416, -5.961365, 1, -0.5, 0.5, 0.5,
1, -3.369416, -5.961365, 1, 1.5, 0.5, 0.5,
1, -3.369416, -5.961365, 0, 1.5, 0.5, 0.5,
2, -3.369416, -5.961365, 0, -0.5, 0.5, 0.5,
2, -3.369416, -5.961365, 1, -0.5, 0.5, 0.5,
2, -3.369416, -5.961365, 1, 1.5, 0.5, 0.5,
2, -3.369416, -5.961365, 0, 1.5, 0.5, 0.5
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
-3.903881, -2, -5.15095,
-3.903881, 2, -5.15095,
-3.903881, -2, -5.15095,
-4.072314, -2, -5.421088,
-3.903881, -1, -5.15095,
-4.072314, -1, -5.421088,
-3.903881, 0, -5.15095,
-4.072314, 0, -5.421088,
-3.903881, 1, -5.15095,
-4.072314, 1, -5.421088,
-3.903881, 2, -5.15095,
-4.072314, 2, -5.421088
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
-4.409181, -2, -5.961365, 0, -0.5, 0.5, 0.5,
-4.409181, -2, -5.961365, 1, -0.5, 0.5, 0.5,
-4.409181, -2, -5.961365, 1, 1.5, 0.5, 0.5,
-4.409181, -2, -5.961365, 0, 1.5, 0.5, 0.5,
-4.409181, -1, -5.961365, 0, -0.5, 0.5, 0.5,
-4.409181, -1, -5.961365, 1, -0.5, 0.5, 0.5,
-4.409181, -1, -5.961365, 1, 1.5, 0.5, 0.5,
-4.409181, -1, -5.961365, 0, 1.5, 0.5, 0.5,
-4.409181, 0, -5.961365, 0, -0.5, 0.5, 0.5,
-4.409181, 0, -5.961365, 1, -0.5, 0.5, 0.5,
-4.409181, 0, -5.961365, 1, 1.5, 0.5, 0.5,
-4.409181, 0, -5.961365, 0, 1.5, 0.5, 0.5,
-4.409181, 1, -5.961365, 0, -0.5, 0.5, 0.5,
-4.409181, 1, -5.961365, 1, -0.5, 0.5, 0.5,
-4.409181, 1, -5.961365, 1, 1.5, 0.5, 0.5,
-4.409181, 1, -5.961365, 0, 1.5, 0.5, 0.5,
-4.409181, 2, -5.961365, 0, -0.5, 0.5, 0.5,
-4.409181, 2, -5.961365, 1, -0.5, 0.5, 0.5,
-4.409181, 2, -5.961365, 1, 1.5, 0.5, 0.5,
-4.409181, 2, -5.961365, 0, 1.5, 0.5, 0.5
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
-3.903881, -2.9211, -4,
-3.903881, -2.9211, 4,
-3.903881, -2.9211, -4,
-4.072314, -3.070539, -4,
-3.903881, -2.9211, -2,
-4.072314, -3.070539, -2,
-3.903881, -2.9211, 0,
-4.072314, -3.070539, 0,
-3.903881, -2.9211, 2,
-4.072314, -3.070539, 2,
-3.903881, -2.9211, 4,
-4.072314, -3.070539, 4
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
-4.409181, -3.369416, -4, 0, -0.5, 0.5, 0.5,
-4.409181, -3.369416, -4, 1, -0.5, 0.5, 0.5,
-4.409181, -3.369416, -4, 1, 1.5, 0.5, 0.5,
-4.409181, -3.369416, -4, 0, 1.5, 0.5, 0.5,
-4.409181, -3.369416, -2, 0, -0.5, 0.5, 0.5,
-4.409181, -3.369416, -2, 1, -0.5, 0.5, 0.5,
-4.409181, -3.369416, -2, 1, 1.5, 0.5, 0.5,
-4.409181, -3.369416, -2, 0, 1.5, 0.5, 0.5,
-4.409181, -3.369416, 0, 0, -0.5, 0.5, 0.5,
-4.409181, -3.369416, 0, 1, -0.5, 0.5, 0.5,
-4.409181, -3.369416, 0, 1, 1.5, 0.5, 0.5,
-4.409181, -3.369416, 0, 0, 1.5, 0.5, 0.5,
-4.409181, -3.369416, 2, 0, -0.5, 0.5, 0.5,
-4.409181, -3.369416, 2, 1, -0.5, 0.5, 0.5,
-4.409181, -3.369416, 2, 1, 1.5, 0.5, 0.5,
-4.409181, -3.369416, 2, 0, 1.5, 0.5, 0.5,
-4.409181, -3.369416, 4, 0, -0.5, 0.5, 0.5,
-4.409181, -3.369416, 4, 1, -0.5, 0.5, 0.5,
-4.409181, -3.369416, 4, 1, 1.5, 0.5, 0.5,
-4.409181, -3.369416, 4, 0, 1.5, 0.5, 0.5
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
-3.903881, -2.9211, -5.15095,
-3.903881, 3.056445, -5.15095,
-3.903881, -2.9211, 5.654592,
-3.903881, 3.056445, 5.654592,
-3.903881, -2.9211, -5.15095,
-3.903881, -2.9211, 5.654592,
-3.903881, 3.056445, -5.15095,
-3.903881, 3.056445, 5.654592,
-3.903881, -2.9211, -5.15095,
2.833454, -2.9211, -5.15095,
-3.903881, -2.9211, 5.654592,
2.833454, -2.9211, 5.654592,
-3.903881, 3.056445, -5.15095,
2.833454, 3.056445, -5.15095,
-3.903881, 3.056445, 5.654592,
2.833454, 3.056445, 5.654592,
2.833454, -2.9211, -5.15095,
2.833454, 3.056445, -5.15095,
2.833454, -2.9211, 5.654592,
2.833454, 3.056445, 5.654592,
2.833454, -2.9211, -5.15095,
2.833454, -2.9211, 5.654592,
2.833454, 3.056445, -5.15095,
2.833454, 3.056445, 5.654592
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
var radius = 7.511542;
var distance = 33.4197;
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
mvMatrix.translate( 0.5352132, -0.06767273, -0.2518208 );
mvMatrix.scale( 1.205466, 1.358689, 0.7516168 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.4197);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
arsenic_acid_arsenic<-read.table("arsenic_acid_arsenic.xyz", skip=1)
x<-arsenic_acid_arsenic$V2
y<-arsenic_acid_arsenic$V3
z<-arsenic_acid_arsenic$V4
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
8, 8, 2, 0, 0, 1, 1, 1,
2, 5, 1, 1, 0, 0, 1, 1,
5, 6, 1, 1, 0, 0, 1, 1,
4, 7, 1, 1, 0, 0, 1, 1,
3, 2, 1, 1, 0, 0, 1, 1,
6, 3, 1, 1, 0, 0, 1, 1,
6, 1, 1, 0, 0, 0, 1, 1,
6, 4, 1, 0, 0, 0, 1, 1,
7, 1, 1, 0, 0, 0, 1, 1,
1, 1, 1, 0, 0, 0, 1, 1
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
var radius = 7.192183;
var distance = 25.26224;
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
mvMatrix.translate( -4.5, -4.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -25.26224);
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
for (var i = 0; i < 10; i++) {
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
