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
-3.908769, -1.0611, -0.006823511, 1, 0, 0, 1,
-3.225885, 0.1240123, -1.348596, 1, 0.007843138, 0, 1,
-3.137024, 0.146269, -1.627373, 1, 0.01176471, 0, 1,
-3.129253, -0.2616446, -0.8149971, 1, 0.01960784, 0, 1,
-3.055409, -0.5074679, -3.382376, 1, 0.02352941, 0, 1,
-2.986901, -1.274776, -1.441293, 1, 0.03137255, 0, 1,
-2.843836, 0.01104079, -2.860984, 1, 0.03529412, 0, 1,
-2.641381, -0.3861108, -2.726826, 1, 0.04313726, 0, 1,
-2.635663, 0.4458057, -1.385466, 1, 0.04705882, 0, 1,
-2.555856, -1.496356, -1.055491, 1, 0.05490196, 0, 1,
-2.521844, -0.431365, -1.610045, 1, 0.05882353, 0, 1,
-2.492549, -0.4547837, -0.6570329, 1, 0.06666667, 0, 1,
-2.482635, -0.7363698, -2.492186, 1, 0.07058824, 0, 1,
-2.465876, -0.1211371, -3.179886, 1, 0.07843138, 0, 1,
-2.42276, -1.650425, -1.598314, 1, 0.08235294, 0, 1,
-2.418585, 1.085758, 0.84323, 1, 0.09019608, 0, 1,
-2.324967, -1.088824, -0.9832309, 1, 0.09411765, 0, 1,
-2.27131, -0.781679, -2.040917, 1, 0.1019608, 0, 1,
-2.204546, -0.9271239, -2.408793, 1, 0.1098039, 0, 1,
-2.200094, 0.2581035, 0.5528941, 1, 0.1137255, 0, 1,
-2.17361, -0.9260666, -2.246717, 1, 0.1215686, 0, 1,
-2.150838, -2.428664, -2.314818, 1, 0.1254902, 0, 1,
-2.14063, 0.1751674, -2.897984, 1, 0.1333333, 0, 1,
-2.11816, -0.5824414, -2.917349, 1, 0.1372549, 0, 1,
-2.107028, 0.8093966, -1.554544, 1, 0.145098, 0, 1,
-2.086808, 0.9479663, -0.2459357, 1, 0.1490196, 0, 1,
-2.0506, -0.8578256, -0.3528198, 1, 0.1568628, 0, 1,
-2.035383, -0.2491297, -1.206161, 1, 0.1607843, 0, 1,
-2.033134, -0.4515243, -1.948971, 1, 0.1686275, 0, 1,
-2.012694, -0.5067345, -0.5349081, 1, 0.172549, 0, 1,
-1.992959, 0.1612573, -3.276406, 1, 0.1803922, 0, 1,
-1.977637, -0.4082869, -0.5435147, 1, 0.1843137, 0, 1,
-1.977483, -1.554427, -3.596884, 1, 0.1921569, 0, 1,
-1.966323, -0.5584587, -1.628529, 1, 0.1960784, 0, 1,
-1.948436, 0.9876051, -1.263302, 1, 0.2039216, 0, 1,
-1.938301, -0.5895306, -3.093454, 1, 0.2117647, 0, 1,
-1.927677, -0.555244, -2.792394, 1, 0.2156863, 0, 1,
-1.923268, 2.182328, -0.6962293, 1, 0.2235294, 0, 1,
-1.919805, -0.588856, -1.576969, 1, 0.227451, 0, 1,
-1.909174, -0.9029754, -1.665433, 1, 0.2352941, 0, 1,
-1.892587, -0.5403, -0.9997247, 1, 0.2392157, 0, 1,
-1.864459, 0.6953288, -0.5992597, 1, 0.2470588, 0, 1,
-1.833691, 0.2871874, -2.448941, 1, 0.2509804, 0, 1,
-1.805407, 0.3851817, -1.253082, 1, 0.2588235, 0, 1,
-1.804135, -1.23024, -1.559475, 1, 0.2627451, 0, 1,
-1.798806, -0.9352164, -2.715185, 1, 0.2705882, 0, 1,
-1.777351, -0.4129909, -0.7847547, 1, 0.2745098, 0, 1,
-1.761433, 0.2764847, -1.597909, 1, 0.282353, 0, 1,
-1.759732, 0.8246381, -0.5498613, 1, 0.2862745, 0, 1,
-1.746194, -1.373223, -1.313983, 1, 0.2941177, 0, 1,
-1.727075, 0.192179, -2.160168, 1, 0.3019608, 0, 1,
-1.716189, -1.287131, -2.162343, 1, 0.3058824, 0, 1,
-1.683543, 0.3172077, -1.328636, 1, 0.3137255, 0, 1,
-1.681972, 1.534936, -0.7267209, 1, 0.3176471, 0, 1,
-1.675882, -1.325379, -2.365371, 1, 0.3254902, 0, 1,
-1.668583, 0.3671314, -1.385503, 1, 0.3294118, 0, 1,
-1.664871, 0.3738756, -0.03313485, 1, 0.3372549, 0, 1,
-1.660298, 0.04810207, -0.7838029, 1, 0.3411765, 0, 1,
-1.647272, -0.570821, -2.72626, 1, 0.3490196, 0, 1,
-1.644906, -3.186454, -2.921118, 1, 0.3529412, 0, 1,
-1.64331, 0.155884, -1.704271, 1, 0.3607843, 0, 1,
-1.642078, -0.841059, -0.9825967, 1, 0.3647059, 0, 1,
-1.638732, -0.3059096, -2.688553, 1, 0.372549, 0, 1,
-1.625898, -0.08932368, -0.04448809, 1, 0.3764706, 0, 1,
-1.595045, 0.7658633, -0.6914375, 1, 0.3843137, 0, 1,
-1.581468, -0.5256733, -2.772079, 1, 0.3882353, 0, 1,
-1.579659, -0.1922199, -2.03027, 1, 0.3960784, 0, 1,
-1.565602, 1.194751, -0.4458335, 1, 0.4039216, 0, 1,
-1.562181, 1.69504, 1.109681, 1, 0.4078431, 0, 1,
-1.556516, 2.145118, -0.08692554, 1, 0.4156863, 0, 1,
-1.549654, 1.076237, -1.179728, 1, 0.4196078, 0, 1,
-1.542588, 0.9855947, -1.679142, 1, 0.427451, 0, 1,
-1.527174, 0.05692767, -2.560878, 1, 0.4313726, 0, 1,
-1.524151, 0.3863585, 0.05139213, 1, 0.4392157, 0, 1,
-1.523191, -0.9151424, -3.070092, 1, 0.4431373, 0, 1,
-1.518718, -1.729496, -1.766358, 1, 0.4509804, 0, 1,
-1.513843, -0.1795841, -1.274503, 1, 0.454902, 0, 1,
-1.505172, -0.2041371, -1.888112, 1, 0.4627451, 0, 1,
-1.500321, 0.6212606, -1.482191, 1, 0.4666667, 0, 1,
-1.499691, -0.8968756, -1.36037, 1, 0.4745098, 0, 1,
-1.494119, -1.203185, -2.935046, 1, 0.4784314, 0, 1,
-1.4927, -0.02450774, -2.972854, 1, 0.4862745, 0, 1,
-1.473317, -0.2828911, -1.463635, 1, 0.4901961, 0, 1,
-1.472365, 0.4166783, 0.505608, 1, 0.4980392, 0, 1,
-1.467349, 0.8724395, -2.028716, 1, 0.5058824, 0, 1,
-1.457776, -0.5702828, -1.960262, 1, 0.509804, 0, 1,
-1.450921, -1.267974, -0.9055405, 1, 0.5176471, 0, 1,
-1.437607, -0.9234256, -3.588889, 1, 0.5215687, 0, 1,
-1.431354, -1.734064, -0.8937314, 1, 0.5294118, 0, 1,
-1.431147, 1.046503, -0.4830311, 1, 0.5333334, 0, 1,
-1.421507, -2.161613, -1.954754, 1, 0.5411765, 0, 1,
-1.421233, -0.01588272, -0.5922714, 1, 0.5450981, 0, 1,
-1.414417, 1.233613, -2.731576, 1, 0.5529412, 0, 1,
-1.413741, 1.359054, -0.7711624, 1, 0.5568628, 0, 1,
-1.410092, -0.9559274, -0.7986192, 1, 0.5647059, 0, 1,
-1.389995, -0.3733992, -0.3827106, 1, 0.5686275, 0, 1,
-1.383337, -0.1952812, -2.087061, 1, 0.5764706, 0, 1,
-1.382254, -0.5331048, -3.96881, 1, 0.5803922, 0, 1,
-1.380224, -0.5190801, -0.9407259, 1, 0.5882353, 0, 1,
-1.372971, 1.918706, -0.27771, 1, 0.5921569, 0, 1,
-1.367191, -1.172715, -4.863749, 1, 0.6, 0, 1,
-1.357836, -0.116757, -4.221792, 1, 0.6078432, 0, 1,
-1.355491, -0.6331725, -1.851305, 1, 0.6117647, 0, 1,
-1.349543, -1.236428, -1.668129, 1, 0.6196079, 0, 1,
-1.346647, -1.439178, -1.881531, 1, 0.6235294, 0, 1,
-1.340967, -1.598776, -2.332405, 1, 0.6313726, 0, 1,
-1.338811, 1.282947, -0.6791015, 1, 0.6352941, 0, 1,
-1.336947, 2.191493, 0.8226631, 1, 0.6431373, 0, 1,
-1.330192, -0.1066011, -2.729042, 1, 0.6470588, 0, 1,
-1.328496, -0.6631793, -1.872351, 1, 0.654902, 0, 1,
-1.317659, -0.6212837, -1.123781, 1, 0.6588235, 0, 1,
-1.31538, -1.320189, -2.221576, 1, 0.6666667, 0, 1,
-1.309246, 0.2865101, -0.605269, 1, 0.6705883, 0, 1,
-1.296644, 0.6854286, -2.179917, 1, 0.6784314, 0, 1,
-1.285412, 1.600528, -0.4727525, 1, 0.682353, 0, 1,
-1.282999, -1.044913, -2.462882, 1, 0.6901961, 0, 1,
-1.282598, 0.07411726, -0.9618586, 1, 0.6941177, 0, 1,
-1.27773, 2.17012, -1.055813, 1, 0.7019608, 0, 1,
-1.265985, -0.02410119, -2.930917, 1, 0.7098039, 0, 1,
-1.265461, 0.479508, -1.408386, 1, 0.7137255, 0, 1,
-1.257541, -0.4148674, -0.8685893, 1, 0.7215686, 0, 1,
-1.25237, 0.2912886, -1.077441, 1, 0.7254902, 0, 1,
-1.250014, 0.7263629, -1.84229, 1, 0.7333333, 0, 1,
-1.24121, 1.354467, 0.02598237, 1, 0.7372549, 0, 1,
-1.223898, -0.2097532, -2.122614, 1, 0.7450981, 0, 1,
-1.21365, 0.6526613, -2.135256, 1, 0.7490196, 0, 1,
-1.200835, -0.768925, -1.26786, 1, 0.7568628, 0, 1,
-1.199559, -1.170914, -1.871682, 1, 0.7607843, 0, 1,
-1.195092, -0.2118764, -3.771054, 1, 0.7686275, 0, 1,
-1.179021, -0.4942527, -1.000974, 1, 0.772549, 0, 1,
-1.178045, -0.164339, -2.571629, 1, 0.7803922, 0, 1,
-1.173733, 0.8724487, -0.2661584, 1, 0.7843137, 0, 1,
-1.158393, 1.013514, 0.5601468, 1, 0.7921569, 0, 1,
-1.139688, -2.754653, -1.838226, 1, 0.7960784, 0, 1,
-1.125648, -1.074141, -3.992877, 1, 0.8039216, 0, 1,
-1.124678, 2.174032, -2.395066, 1, 0.8117647, 0, 1,
-1.118312, 0.06509453, -1.942871, 1, 0.8156863, 0, 1,
-1.105706, 1.159991, -1.470544, 1, 0.8235294, 0, 1,
-1.104222, -0.7269607, -1.87951, 1, 0.827451, 0, 1,
-1.099278, -0.133944, -2.01144, 1, 0.8352941, 0, 1,
-1.099021, -0.6146115, -2.827903, 1, 0.8392157, 0, 1,
-1.097277, 1.063368, -2.629712, 1, 0.8470588, 0, 1,
-1.092151, -0.5316258, 0.7994582, 1, 0.8509804, 0, 1,
-1.090033, 0.6728631, 0.2041123, 1, 0.8588235, 0, 1,
-1.088977, 0.424346, -1.036744, 1, 0.8627451, 0, 1,
-1.086534, -0.139653, -3.239412, 1, 0.8705882, 0, 1,
-1.085299, -1.462395, -3.979872, 1, 0.8745098, 0, 1,
-1.077218, -0.7885142, -1.841904, 1, 0.8823529, 0, 1,
-1.070099, 0.6030896, -1.463727, 1, 0.8862745, 0, 1,
-1.067931, -0.02451267, -0.06098261, 1, 0.8941177, 0, 1,
-1.049387, 0.3299208, -0.7914019, 1, 0.8980392, 0, 1,
-1.047962, 0.4837629, -0.856281, 1, 0.9058824, 0, 1,
-1.042487, -0.8156067, -1.791807, 1, 0.9137255, 0, 1,
-1.038577, -0.1309264, -1.920248, 1, 0.9176471, 0, 1,
-1.035532, -1.055858, -2.134603, 1, 0.9254902, 0, 1,
-1.031061, 0.1888522, -0.3638262, 1, 0.9294118, 0, 1,
-1.027735, -0.4552359, -3.109932, 1, 0.9372549, 0, 1,
-1.027478, -0.9632012, -2.643094, 1, 0.9411765, 0, 1,
-1.020943, 1.298831, -2.096666, 1, 0.9490196, 0, 1,
-1.020157, -0.2651, -2.122714, 1, 0.9529412, 0, 1,
-1.014407, -1.661635, -2.947894, 1, 0.9607843, 0, 1,
-1.014315, -0.346729, -2.777039, 1, 0.9647059, 0, 1,
-1.013039, -0.3434733, -1.42179, 1, 0.972549, 0, 1,
-1.003253, -1.675517, -2.870801, 1, 0.9764706, 0, 1,
-1.000285, 0.06427447, -3.921739, 1, 0.9843137, 0, 1,
-0.9996502, 0.9621673, 1.564318, 1, 0.9882353, 0, 1,
-0.9976427, 0.7030716, -1.811541, 1, 0.9960784, 0, 1,
-0.9937403, -1.973939, -3.297873, 0.9960784, 1, 0, 1,
-0.9925813, 1.444109, -1.171612, 0.9921569, 1, 0, 1,
-0.9918888, 1.531693, 0.06952883, 0.9843137, 1, 0, 1,
-0.9809237, 1.063083, -1.195738, 0.9803922, 1, 0, 1,
-0.9673264, -0.09805815, -1.166852, 0.972549, 1, 0, 1,
-0.9672368, -0.2470737, -0.02409673, 0.9686275, 1, 0, 1,
-0.9638669, -0.477439, -1.232413, 0.9607843, 1, 0, 1,
-0.9549185, -0.04310225, -3.507719, 0.9568627, 1, 0, 1,
-0.9509164, -1.444525, -2.505383, 0.9490196, 1, 0, 1,
-0.9455836, 1.767499, -1.477898, 0.945098, 1, 0, 1,
-0.9415722, 0.3549201, -0.9354334, 0.9372549, 1, 0, 1,
-0.9374859, 0.8318347, -1.552161, 0.9333333, 1, 0, 1,
-0.9283981, 0.1678151, -1.780701, 0.9254902, 1, 0, 1,
-0.9208068, -0.3663976, -2.349389, 0.9215686, 1, 0, 1,
-0.9169524, 0.03146712, -1.889347, 0.9137255, 1, 0, 1,
-0.9162931, 1.014684, -1.874427, 0.9098039, 1, 0, 1,
-0.9018854, -0.7084964, -2.63842, 0.9019608, 1, 0, 1,
-0.9007322, -0.6468219, -0.4041244, 0.8941177, 1, 0, 1,
-0.9001895, -2.882103, -5.05991, 0.8901961, 1, 0, 1,
-0.8976821, 1.270339, -0.3556391, 0.8823529, 1, 0, 1,
-0.8952554, -0.54136, -0.4502963, 0.8784314, 1, 0, 1,
-0.8886826, -1.361222, -2.681246, 0.8705882, 1, 0, 1,
-0.8860578, 1.04296, -0.3006324, 0.8666667, 1, 0, 1,
-0.8833736, -1.186151, -1.834459, 0.8588235, 1, 0, 1,
-0.8828417, -0.7860277, -4.487495, 0.854902, 1, 0, 1,
-0.8779764, 0.7356769, -1.381502, 0.8470588, 1, 0, 1,
-0.8773219, 0.03635794, -1.887165, 0.8431373, 1, 0, 1,
-0.8501225, 0.5977007, -1.949269, 0.8352941, 1, 0, 1,
-0.8498175, 0.7170873, -0.4239002, 0.8313726, 1, 0, 1,
-0.8478972, 0.2529302, -1.717038, 0.8235294, 1, 0, 1,
-0.8379691, -0.3244329, -2.494939, 0.8196079, 1, 0, 1,
-0.8298312, -1.349708, -3.650298, 0.8117647, 1, 0, 1,
-0.8206843, -2.180748, -3.118167, 0.8078431, 1, 0, 1,
-0.8103032, 1.174218, -0.1141035, 0.8, 1, 0, 1,
-0.8067045, 0.03274596, -4.160314, 0.7921569, 1, 0, 1,
-0.8003959, -0.2862312, -0.9979448, 0.7882353, 1, 0, 1,
-0.7994615, -1.567105, -3.230829, 0.7803922, 1, 0, 1,
-0.7964525, 0.7128195, 0.4603061, 0.7764706, 1, 0, 1,
-0.7942022, 1.277329, -1.760868, 0.7686275, 1, 0, 1,
-0.7936823, 3.040278, -1.113631, 0.7647059, 1, 0, 1,
-0.7837768, -2.084023, -3.709322, 0.7568628, 1, 0, 1,
-0.775014, -3.412446, -2.77588, 0.7529412, 1, 0, 1,
-0.7655439, 0.7108431, -2.252298, 0.7450981, 1, 0, 1,
-0.7654172, 1.069024, -0.8368648, 0.7411765, 1, 0, 1,
-0.7604689, 0.6011335, -2.02725, 0.7333333, 1, 0, 1,
-0.7590613, -1.210884, -0.9873432, 0.7294118, 1, 0, 1,
-0.7590276, -0.1110624, -1.238936, 0.7215686, 1, 0, 1,
-0.7582746, -0.5463769, -2.066347, 0.7176471, 1, 0, 1,
-0.7547419, -1.256954, -4.617243, 0.7098039, 1, 0, 1,
-0.7528254, -0.4815127, -1.152698, 0.7058824, 1, 0, 1,
-0.7527359, -0.05194106, -1.269048, 0.6980392, 1, 0, 1,
-0.7495916, 0.7184426, -1.360341, 0.6901961, 1, 0, 1,
-0.7487809, -0.3349543, -1.771895, 0.6862745, 1, 0, 1,
-0.7461384, 1.984109, 0.2577538, 0.6784314, 1, 0, 1,
-0.745304, -1.473295, -3.463186, 0.6745098, 1, 0, 1,
-0.7390379, -2.006381, -2.732668, 0.6666667, 1, 0, 1,
-0.7359168, -0.7111801, -4.136866, 0.6627451, 1, 0, 1,
-0.7358989, 2.325923, 0.7740308, 0.654902, 1, 0, 1,
-0.7335299, -0.4449965, -1.103696, 0.6509804, 1, 0, 1,
-0.722789, 0.6613188, -1.178103, 0.6431373, 1, 0, 1,
-0.7218009, -1.310683, -1.812981, 0.6392157, 1, 0, 1,
-0.7175474, -0.5772083, -4.57892, 0.6313726, 1, 0, 1,
-0.7173671, 0.04111682, 0.4085226, 0.627451, 1, 0, 1,
-0.7150726, -0.3926157, -3.284079, 0.6196079, 1, 0, 1,
-0.7101601, 1.105217, -0.1794125, 0.6156863, 1, 0, 1,
-0.7070346, 1.111909, 0.7607365, 0.6078432, 1, 0, 1,
-0.7017328, -0.762681, -3.636598, 0.6039216, 1, 0, 1,
-0.6984212, 1.695137, 0.1782443, 0.5960785, 1, 0, 1,
-0.696409, -0.3546943, -1.163646, 0.5882353, 1, 0, 1,
-0.6935341, 0.6212065, -1.728999, 0.5843138, 1, 0, 1,
-0.6924087, 0.8510231, -0.864711, 0.5764706, 1, 0, 1,
-0.692238, 1.10089, -0.01568305, 0.572549, 1, 0, 1,
-0.6788657, -0.6694169, -2.432548, 0.5647059, 1, 0, 1,
-0.6787139, 2.028404, 0.6527884, 0.5607843, 1, 0, 1,
-0.6782875, -0.4395194, -1.526795, 0.5529412, 1, 0, 1,
-0.6782065, -0.3818253, -1.459548, 0.5490196, 1, 0, 1,
-0.6740024, -0.4941742, -2.319524, 0.5411765, 1, 0, 1,
-0.6714666, 1.33063, 0.1342401, 0.5372549, 1, 0, 1,
-0.6695636, 0.03232403, -2.900916, 0.5294118, 1, 0, 1,
-0.6675728, 0.4421414, -1.588888, 0.5254902, 1, 0, 1,
-0.6618117, -1.427744, -1.49533, 0.5176471, 1, 0, 1,
-0.6605351, -1.896174, -2.536185, 0.5137255, 1, 0, 1,
-0.6604944, -0.01811456, -2.690676, 0.5058824, 1, 0, 1,
-0.6585982, -0.5650893, -3.020592, 0.5019608, 1, 0, 1,
-0.6584864, 0.740001, -1.7523, 0.4941176, 1, 0, 1,
-0.6567979, -0.2549123, -0.9662594, 0.4862745, 1, 0, 1,
-0.6520922, -0.513101, -2.747316, 0.4823529, 1, 0, 1,
-0.6518843, -1.043399, -2.768498, 0.4745098, 1, 0, 1,
-0.6488646, -1.148723, -3.053228, 0.4705882, 1, 0, 1,
-0.6428445, -0.4292095, -1.571942, 0.4627451, 1, 0, 1,
-0.6401421, 0.8655699, 0.4873568, 0.4588235, 1, 0, 1,
-0.6350001, -0.5952141, -1.510409, 0.4509804, 1, 0, 1,
-0.6339233, 0.7314867, -0.7833301, 0.4470588, 1, 0, 1,
-0.6336337, 0.7714034, -0.5341555, 0.4392157, 1, 0, 1,
-0.633058, -1.594916, -2.796773, 0.4352941, 1, 0, 1,
-0.6328402, 2.078089, -0.6898178, 0.427451, 1, 0, 1,
-0.6278985, 1.107977, -1.649031, 0.4235294, 1, 0, 1,
-0.6252673, -0.5568961, -1.225185, 0.4156863, 1, 0, 1,
-0.6246747, 0.4758628, 0.3168236, 0.4117647, 1, 0, 1,
-0.6238706, -1.783112, -2.62816, 0.4039216, 1, 0, 1,
-0.6208345, -0.9057036, -4.637719, 0.3960784, 1, 0, 1,
-0.6182216, 0.615918, -0.3923842, 0.3921569, 1, 0, 1,
-0.6118454, -0.4083995, -2.047712, 0.3843137, 1, 0, 1,
-0.6104375, 0.04170665, -1.16945, 0.3803922, 1, 0, 1,
-0.6095558, 0.696713, -1.869034, 0.372549, 1, 0, 1,
-0.6080591, 0.514097, -0.05687709, 0.3686275, 1, 0, 1,
-0.6038458, 1.474198, -0.7123721, 0.3607843, 1, 0, 1,
-0.5976723, -0.6497373, -3.051434, 0.3568628, 1, 0, 1,
-0.5975683, 1.301156, -2.219829, 0.3490196, 1, 0, 1,
-0.5930681, -0.9662427, -2.377506, 0.345098, 1, 0, 1,
-0.5926812, 0.3088849, -2.371522, 0.3372549, 1, 0, 1,
-0.5923946, 0.4407172, -1.386427, 0.3333333, 1, 0, 1,
-0.5909712, 0.9098486, -0.9530808, 0.3254902, 1, 0, 1,
-0.5863028, 2.472254, -0.8975804, 0.3215686, 1, 0, 1,
-0.5853751, -1.115809, -2.723102, 0.3137255, 1, 0, 1,
-0.5841169, 0.3675964, -1.182977, 0.3098039, 1, 0, 1,
-0.5790223, -0.02667321, -0.950343, 0.3019608, 1, 0, 1,
-0.5779889, 1.092993, -0.2071825, 0.2941177, 1, 0, 1,
-0.5773388, 1.102143, -0.9896235, 0.2901961, 1, 0, 1,
-0.5705399, 2.131099, -1.571003, 0.282353, 1, 0, 1,
-0.5647833, -0.5820699, -0.8856834, 0.2784314, 1, 0, 1,
-0.5640211, 0.7711526, -1.591911, 0.2705882, 1, 0, 1,
-0.5639247, -0.4541313, -2.272045, 0.2666667, 1, 0, 1,
-0.562564, -0.1142773, -1.016922, 0.2588235, 1, 0, 1,
-0.5622665, 0.3275845, -0.9756299, 0.254902, 1, 0, 1,
-0.5607244, 0.6990129, -0.867266, 0.2470588, 1, 0, 1,
-0.5577554, -0.4294202, 0.06265247, 0.2431373, 1, 0, 1,
-0.5561337, 0.6696386, -1.446489, 0.2352941, 1, 0, 1,
-0.5553599, -0.249716, -0.8186993, 0.2313726, 1, 0, 1,
-0.5454251, 0.09278286, -0.5760463, 0.2235294, 1, 0, 1,
-0.5393918, -0.09217206, -1.090017, 0.2196078, 1, 0, 1,
-0.5361822, -0.245215, -4.831699, 0.2117647, 1, 0, 1,
-0.5340431, 0.5976133, -0.6532004, 0.2078431, 1, 0, 1,
-0.5304586, -1.068804, -2.7005, 0.2, 1, 0, 1,
-0.5269365, -0.9132376, -1.871958, 0.1921569, 1, 0, 1,
-0.5252483, 0.1329275, -1.227704, 0.1882353, 1, 0, 1,
-0.5241652, -0.5373398, 0.04816136, 0.1803922, 1, 0, 1,
-0.523536, -1.255887, -2.56424, 0.1764706, 1, 0, 1,
-0.5183487, 0.9601652, -0.8240134, 0.1686275, 1, 0, 1,
-0.5149158, 0.09312279, -0.4366728, 0.1647059, 1, 0, 1,
-0.5137852, 1.492056, 0.879568, 0.1568628, 1, 0, 1,
-0.5120133, -0.9029994, -1.755301, 0.1529412, 1, 0, 1,
-0.5076792, -0.1127455, -2.956357, 0.145098, 1, 0, 1,
-0.5068728, -1.174483, -1.854786, 0.1411765, 1, 0, 1,
-0.5067701, -1.177936, -0.9140217, 0.1333333, 1, 0, 1,
-0.501574, -0.651031, -1.029734, 0.1294118, 1, 0, 1,
-0.4989741, 0.6330048, -1.992038, 0.1215686, 1, 0, 1,
-0.4975185, 0.2225118, -1.142629, 0.1176471, 1, 0, 1,
-0.4942815, 0.2112572, 0.6242692, 0.1098039, 1, 0, 1,
-0.4895877, 0.3203936, -1.846489, 0.1058824, 1, 0, 1,
-0.4845763, 1.409069, -0.8311291, 0.09803922, 1, 0, 1,
-0.4834577, -1.662447, -5.129305, 0.09019608, 1, 0, 1,
-0.4834104, -1.875919, -1.755093, 0.08627451, 1, 0, 1,
-0.4824431, -0.8605465, -3.305964, 0.07843138, 1, 0, 1,
-0.480364, -0.7089499, -2.436852, 0.07450981, 1, 0, 1,
-0.4666894, 0.2309983, 0.375441, 0.06666667, 1, 0, 1,
-0.4649938, 1.868836, -0.238186, 0.0627451, 1, 0, 1,
-0.4642376, -1.264301, -3.950791, 0.05490196, 1, 0, 1,
-0.4598041, -0.3967148, -1.859621, 0.05098039, 1, 0, 1,
-0.4592377, -0.9703514, -2.79099, 0.04313726, 1, 0, 1,
-0.4590661, -0.2120356, -2.560159, 0.03921569, 1, 0, 1,
-0.4516063, 0.5578539, -0.5767697, 0.03137255, 1, 0, 1,
-0.4504972, 0.2218003, -2.498174, 0.02745098, 1, 0, 1,
-0.4436662, -1.000292, -3.341817, 0.01960784, 1, 0, 1,
-0.4389818, -0.4993428, -2.837431, 0.01568628, 1, 0, 1,
-0.438438, -0.7704589, -2.337888, 0.007843138, 1, 0, 1,
-0.4333225, -1.141899, -3.773607, 0.003921569, 1, 0, 1,
-0.4302104, 1.331344, -0.2863453, 0, 1, 0.003921569, 1,
-0.4281791, -0.3795449, -2.859662, 0, 1, 0.01176471, 1,
-0.4259804, -0.2822813, -2.248038, 0, 1, 0.01568628, 1,
-0.4246203, 2.598033, -0.7734017, 0, 1, 0.02352941, 1,
-0.4172066, 0.868593, -0.08964942, 0, 1, 0.02745098, 1,
-0.4154646, 1.117717, -1.84445, 0, 1, 0.03529412, 1,
-0.4101144, -0.9402401, -2.709569, 0, 1, 0.03921569, 1,
-0.4099251, -1.449072, -2.952544, 0, 1, 0.04705882, 1,
-0.4065782, 0.1480899, 0.3315801, 0, 1, 0.05098039, 1,
-0.4024579, 0.8898792, -0.3527384, 0, 1, 0.05882353, 1,
-0.398309, -0.1233554, -0.8588168, 0, 1, 0.0627451, 1,
-0.3974646, -0.09746882, -3.017626, 0, 1, 0.07058824, 1,
-0.3966105, -0.3160756, -1.460848, 0, 1, 0.07450981, 1,
-0.3960766, -1.485291, -4.334818, 0, 1, 0.08235294, 1,
-0.3925743, 1.372827, 0.7050676, 0, 1, 0.08627451, 1,
-0.3901805, -0.2617414, -1.78069, 0, 1, 0.09411765, 1,
-0.3866489, 0.3015865, 0.6248516, 0, 1, 0.1019608, 1,
-0.3844193, -1.738626, -2.758535, 0, 1, 0.1058824, 1,
-0.3815319, 0.2246199, -0.4677183, 0, 1, 0.1137255, 1,
-0.3795706, -1.767498, -2.803464, 0, 1, 0.1176471, 1,
-0.3783912, 1.523824, 2.18122, 0, 1, 0.1254902, 1,
-0.3783863, -1.553753, -3.190267, 0, 1, 0.1294118, 1,
-0.3702018, -0.3822073, -3.68071, 0, 1, 0.1372549, 1,
-0.3679929, -1.463002, -1.558857, 0, 1, 0.1411765, 1,
-0.3638641, 0.9735102, -0.06826027, 0, 1, 0.1490196, 1,
-0.361999, -0.168496, -2.011926, 0, 1, 0.1529412, 1,
-0.3619113, -0.08084196, -1.359338, 0, 1, 0.1607843, 1,
-0.3611894, -1.192485, -3.767873, 0, 1, 0.1647059, 1,
-0.3602844, 1.746024, 0.07927957, 0, 1, 0.172549, 1,
-0.3599584, 0.3408173, -0.7848348, 0, 1, 0.1764706, 1,
-0.3582329, 0.3190738, -2.01017, 0, 1, 0.1843137, 1,
-0.3567889, -1.546528, -0.9515401, 0, 1, 0.1882353, 1,
-0.3536029, -1.336289, -2.866519, 0, 1, 0.1960784, 1,
-0.3520462, 2.248102, 0.4246528, 0, 1, 0.2039216, 1,
-0.3518263, -0.7673375, -3.564703, 0, 1, 0.2078431, 1,
-0.3506568, 0.6084979, -1.295146, 0, 1, 0.2156863, 1,
-0.3505282, 1.144814, 0.673692, 0, 1, 0.2196078, 1,
-0.349535, 0.3251346, -0.716441, 0, 1, 0.227451, 1,
-0.3482747, -1.122543, -2.275865, 0, 1, 0.2313726, 1,
-0.3426512, -0.6939935, -2.798036, 0, 1, 0.2392157, 1,
-0.3397132, -1.191911, -2.62726, 0, 1, 0.2431373, 1,
-0.3380738, 2.352456, -1.324249, 0, 1, 0.2509804, 1,
-0.3307588, 0.7298605, -1.012845, 0, 1, 0.254902, 1,
-0.3293622, 0.0530102, -2.331869, 0, 1, 0.2627451, 1,
-0.3272187, 0.153821, -2.344255, 0, 1, 0.2666667, 1,
-0.3223301, 0.03396887, 0.06495836, 0, 1, 0.2745098, 1,
-0.3176365, -0.2132827, -1.899576, 0, 1, 0.2784314, 1,
-0.3175285, -0.4683641, -3.052907, 0, 1, 0.2862745, 1,
-0.3163383, -0.05888653, -1.626546, 0, 1, 0.2901961, 1,
-0.3095558, -0.5381027, -2.28594, 0, 1, 0.2980392, 1,
-0.3088533, 0.2444258, -0.9986404, 0, 1, 0.3058824, 1,
-0.307993, -0.393026, -2.980824, 0, 1, 0.3098039, 1,
-0.3044483, -1.881882, -2.156249, 0, 1, 0.3176471, 1,
-0.2958702, 1.283896, 1.581878, 0, 1, 0.3215686, 1,
-0.2930921, -0.0987056, -3.645267, 0, 1, 0.3294118, 1,
-0.2875641, 0.7074264, -1.552122, 0, 1, 0.3333333, 1,
-0.2833333, 1.369895, -0.886034, 0, 1, 0.3411765, 1,
-0.2634266, 0.7384459, 1.709611, 0, 1, 0.345098, 1,
-0.2605396, 0.0972981, -1.268018, 0, 1, 0.3529412, 1,
-0.2602783, -0.03926854, -1.686636, 0, 1, 0.3568628, 1,
-0.2599293, -0.305621, -1.527792, 0, 1, 0.3647059, 1,
-0.255074, -1.60065, -3.623447, 0, 1, 0.3686275, 1,
-0.2427305, -0.1975472, -2.620062, 0, 1, 0.3764706, 1,
-0.2425057, 1.110077, 0.2614452, 0, 1, 0.3803922, 1,
-0.2414173, -0.1306514, -2.897333, 0, 1, 0.3882353, 1,
-0.24117, 0.02190941, 0.2315726, 0, 1, 0.3921569, 1,
-0.2394565, 0.4141815, -1.401577, 0, 1, 0.4, 1,
-0.23723, -0.2606824, -2.497027, 0, 1, 0.4078431, 1,
-0.2294507, -1.751381, -4.388317, 0, 1, 0.4117647, 1,
-0.2246158, -1.829793, -2.692282, 0, 1, 0.4196078, 1,
-0.2177814, 2.260632, -0.7732801, 0, 1, 0.4235294, 1,
-0.2167278, -1.796877, -2.995351, 0, 1, 0.4313726, 1,
-0.21386, -0.7003955, -1.736296, 0, 1, 0.4352941, 1,
-0.2108382, 0.2992043, -2.096488, 0, 1, 0.4431373, 1,
-0.2106273, -1.441387, -4.392937, 0, 1, 0.4470588, 1,
-0.2090409, 0.06928159, -0.01184143, 0, 1, 0.454902, 1,
-0.2074456, 1.64558, -0.4941852, 0, 1, 0.4588235, 1,
-0.2027614, -2.335268, -3.31283, 0, 1, 0.4666667, 1,
-0.2019913, -0.9289456, -2.968964, 0, 1, 0.4705882, 1,
-0.1999656, 0.5487164, -1.133775, 0, 1, 0.4784314, 1,
-0.1952698, 0.5000394, -1.353773, 0, 1, 0.4823529, 1,
-0.1936441, 1.055285, -0.8194023, 0, 1, 0.4901961, 1,
-0.192459, 0.3185261, -1.740579, 0, 1, 0.4941176, 1,
-0.18957, -0.06441697, -2.442756, 0, 1, 0.5019608, 1,
-0.1895413, -0.6977943, -2.774005, 0, 1, 0.509804, 1,
-0.1856529, -0.6821632, -3.008898, 0, 1, 0.5137255, 1,
-0.1853649, 0.1529869, 0.6207862, 0, 1, 0.5215687, 1,
-0.1819578, -0.09352362, -2.290868, 0, 1, 0.5254902, 1,
-0.1805821, 0.4784405, 1.56405, 0, 1, 0.5333334, 1,
-0.1776887, -0.4930263, -2.993631, 0, 1, 0.5372549, 1,
-0.1763014, 1.525866, -0.2006988, 0, 1, 0.5450981, 1,
-0.1736684, 0.07025871, -2.492289, 0, 1, 0.5490196, 1,
-0.1730308, 0.8345169, 0.004464739, 0, 1, 0.5568628, 1,
-0.1687842, -0.1366869, -2.018872, 0, 1, 0.5607843, 1,
-0.1626265, 0.1781031, 0.1498891, 0, 1, 0.5686275, 1,
-0.1611356, 0.2610292, 0.8917468, 0, 1, 0.572549, 1,
-0.1583499, -0.5754038, -3.545781, 0, 1, 0.5803922, 1,
-0.1574738, -0.07474305, -0.6842684, 0, 1, 0.5843138, 1,
-0.1556974, -0.4293516, -2.57305, 0, 1, 0.5921569, 1,
-0.1541157, 0.06594973, -1.409072, 0, 1, 0.5960785, 1,
-0.1540618, 0.8426308, 0.2407932, 0, 1, 0.6039216, 1,
-0.1524197, 1.801226, 0.5077214, 0, 1, 0.6117647, 1,
-0.1506495, 0.2667658, -1.115424, 0, 1, 0.6156863, 1,
-0.1473784, -0.2108966, -3.924745, 0, 1, 0.6235294, 1,
-0.1468673, -0.4861565, -0.2197197, 0, 1, 0.627451, 1,
-0.1435541, -1.389805, -2.596514, 0, 1, 0.6352941, 1,
-0.1434456, -1.202045, -3.661917, 0, 1, 0.6392157, 1,
-0.1405989, -1.051238, -4.835244, 0, 1, 0.6470588, 1,
-0.1380481, -0.2399919, -1.15072, 0, 1, 0.6509804, 1,
-0.1339432, 0.4726092, 0.3185333, 0, 1, 0.6588235, 1,
-0.1329991, -0.04085958, -1.29972, 0, 1, 0.6627451, 1,
-0.1313846, -0.2055387, -1.587404, 0, 1, 0.6705883, 1,
-0.1304499, 0.4876607, -0.9936248, 0, 1, 0.6745098, 1,
-0.1297104, -0.891933, -2.52208, 0, 1, 0.682353, 1,
-0.1288846, 0.1115518, -1.920229, 0, 1, 0.6862745, 1,
-0.1219783, -0.7488015, -3.665931, 0, 1, 0.6941177, 1,
-0.1218344, -0.8020973, -2.93387, 0, 1, 0.7019608, 1,
-0.1192198, 0.9153265, -1.561322, 0, 1, 0.7058824, 1,
-0.1176947, -0.4788877, -4.47537, 0, 1, 0.7137255, 1,
-0.1168851, 1.753481, 0.6006677, 0, 1, 0.7176471, 1,
-0.1161393, 0.6374818, -1.355593, 0, 1, 0.7254902, 1,
-0.1159883, -1.267372, -3.214567, 0, 1, 0.7294118, 1,
-0.1113656, -0.1312993, -2.180077, 0, 1, 0.7372549, 1,
-0.1046922, 0.4864051, -0.5778819, 0, 1, 0.7411765, 1,
-0.102557, -0.1574315, -3.228339, 0, 1, 0.7490196, 1,
-0.1011577, 0.5055857, 0.03159279, 0, 1, 0.7529412, 1,
-0.1009759, -2.460387, -1.763241, 0, 1, 0.7607843, 1,
-0.100532, 0.3718379, -0.9104372, 0, 1, 0.7647059, 1,
-0.09461264, -1.406637, -4.248171, 0, 1, 0.772549, 1,
-0.09272285, -0.3075735, -2.065341, 0, 1, 0.7764706, 1,
-0.08607158, 1.735672, 0.2538842, 0, 1, 0.7843137, 1,
-0.08500941, 1.878145, 1.697098, 0, 1, 0.7882353, 1,
-0.08418075, 0.2065063, -1.440785, 0, 1, 0.7960784, 1,
-0.08209255, 1.996427, 0.137545, 0, 1, 0.8039216, 1,
-0.07113107, 0.03580657, -0.9012737, 0, 1, 0.8078431, 1,
-0.06856944, -1.538402, -3.583031, 0, 1, 0.8156863, 1,
-0.0672358, -0.1541997, -3.348042, 0, 1, 0.8196079, 1,
-0.06600849, -0.8648683, -1.872801, 0, 1, 0.827451, 1,
-0.06547215, 0.4391206, 0.00753527, 0, 1, 0.8313726, 1,
-0.06255659, 0.4915545, -1.527271, 0, 1, 0.8392157, 1,
-0.06063649, -0.2224876, -2.519329, 0, 1, 0.8431373, 1,
-0.05976524, 0.02808753, -0.3752268, 0, 1, 0.8509804, 1,
-0.05736376, 0.5508494, 1.463887, 0, 1, 0.854902, 1,
-0.05599986, 0.5018807, -0.3470736, 0, 1, 0.8627451, 1,
-0.05506176, 0.5585629, 0.3410448, 0, 1, 0.8666667, 1,
-0.05103528, 1.978166, -1.406879, 0, 1, 0.8745098, 1,
-0.04879636, 2.067647, -0.3424502, 0, 1, 0.8784314, 1,
-0.04684725, -0.1042691, -1.139739, 0, 1, 0.8862745, 1,
-0.04605342, -0.0269843, -2.222588, 0, 1, 0.8901961, 1,
-0.04592259, 0.7837419, -0.06972852, 0, 1, 0.8980392, 1,
-0.04357462, 0.2613112, 0.2289046, 0, 1, 0.9058824, 1,
-0.04357184, -0.3709174, -3.376848, 0, 1, 0.9098039, 1,
-0.04273551, 1.329059, -0.1064112, 0, 1, 0.9176471, 1,
-0.03963492, 0.6759064, -2.103278, 0, 1, 0.9215686, 1,
-0.0385748, -0.1107135, -3.792083, 0, 1, 0.9294118, 1,
-0.03830101, 0.03981952, -1.00985, 0, 1, 0.9333333, 1,
-0.03338609, -2.361919, -4.99624, 0, 1, 0.9411765, 1,
-0.02971141, 0.1136751, -0.2723773, 0, 1, 0.945098, 1,
-0.02942815, -0.2802549, -3.634258, 0, 1, 0.9529412, 1,
-0.02872377, 0.4956703, -1.009904, 0, 1, 0.9568627, 1,
-0.02798228, -2.885279, -2.990502, 0, 1, 0.9647059, 1,
-0.02368396, -0.8289536, -0.3664289, 0, 1, 0.9686275, 1,
-0.02207945, -1.059809, -4.179348, 0, 1, 0.9764706, 1,
-0.02181231, -0.1891008, -3.308887, 0, 1, 0.9803922, 1,
-0.01487844, 1.118632, 0.5618061, 0, 1, 0.9882353, 1,
-0.01367187, 0.1271116, 1.424364, 0, 1, 0.9921569, 1,
-0.005224368, 0.3989175, -2.639416, 0, 1, 1, 1,
-0.003499428, -1.925567, -4.496701, 0, 0.9921569, 1, 1,
-0.0006447196, -0.9603592, -4.42624, 0, 0.9882353, 1, 1,
-8.238229e-05, -0.4678382, -2.097271, 0, 0.9803922, 1, 1,
0.008187831, -1.327157, 3.65728, 0, 0.9764706, 1, 1,
0.00855595, -0.9363021, 3.835621, 0, 0.9686275, 1, 1,
0.008629547, 0.0721055, 0.07401807, 0, 0.9647059, 1, 1,
0.0123935, 0.3647436, 0.1779904, 0, 0.9568627, 1, 1,
0.01357903, 0.5026359, -0.8641601, 0, 0.9529412, 1, 1,
0.01576075, -0.7367572, 2.194109, 0, 0.945098, 1, 1,
0.01691251, -2.058141, 3.443641, 0, 0.9411765, 1, 1,
0.01754788, 1.099184, 1.160154, 0, 0.9333333, 1, 1,
0.01780638, 0.8140479, 0.1448411, 0, 0.9294118, 1, 1,
0.02473021, -0.2347475, 3.851827, 0, 0.9215686, 1, 1,
0.0250366, -0.6093888, 4.139676, 0, 0.9176471, 1, 1,
0.02507641, 0.1360157, 0.6456729, 0, 0.9098039, 1, 1,
0.02853074, -1.196593, 2.777098, 0, 0.9058824, 1, 1,
0.03475666, 0.1990209, 0.6308476, 0, 0.8980392, 1, 1,
0.03562974, -1.905915, 3.578557, 0, 0.8901961, 1, 1,
0.03781674, 0.9554624, 1.84639, 0, 0.8862745, 1, 1,
0.03878434, 0.08794387, 0.3350762, 0, 0.8784314, 1, 1,
0.04164144, 1.589744, 1.831825, 0, 0.8745098, 1, 1,
0.04214363, -0.2927635, 2.102912, 0, 0.8666667, 1, 1,
0.04681154, -0.5196583, 3.305241, 0, 0.8627451, 1, 1,
0.04741512, -0.6277229, 2.828158, 0, 0.854902, 1, 1,
0.0489291, -1.845761, 3.625055, 0, 0.8509804, 1, 1,
0.05316073, 0.4976418, 1.250599, 0, 0.8431373, 1, 1,
0.05329552, -0.3486013, 1.781267, 0, 0.8392157, 1, 1,
0.05412275, 0.8290834, -0.2458782, 0, 0.8313726, 1, 1,
0.0576599, 1.624113, 0.3236449, 0, 0.827451, 1, 1,
0.05884703, 0.876794, -0.4484181, 0, 0.8196079, 1, 1,
0.06117068, -0.08889993, 1.054346, 0, 0.8156863, 1, 1,
0.07256511, -0.7419295, 2.983271, 0, 0.8078431, 1, 1,
0.07266989, 0.2636062, 0.1897676, 0, 0.8039216, 1, 1,
0.07410096, 0.4063938, -1.940446, 0, 0.7960784, 1, 1,
0.07594669, 0.8241848, -1.064368, 0, 0.7882353, 1, 1,
0.07963537, 0.4414954, -0.8471676, 0, 0.7843137, 1, 1,
0.08047511, -2.146777, 3.14125, 0, 0.7764706, 1, 1,
0.0827481, 1.034859, 1.149798, 0, 0.772549, 1, 1,
0.08662589, 1.649201, -0.2526039, 0, 0.7647059, 1, 1,
0.0879391, -0.07088102, 2.98408, 0, 0.7607843, 1, 1,
0.09054568, 0.008548373, 0.3429395, 0, 0.7529412, 1, 1,
0.09481481, -0.9006599, 3.021066, 0, 0.7490196, 1, 1,
0.09712791, 0.5491421, -0.01469179, 0, 0.7411765, 1, 1,
0.1050308, -0.7912408, 3.091413, 0, 0.7372549, 1, 1,
0.1063951, -0.3187251, 3.009946, 0, 0.7294118, 1, 1,
0.1071705, 1.19208, -0.2654077, 0, 0.7254902, 1, 1,
0.10955, -2.066175, 3.302319, 0, 0.7176471, 1, 1,
0.1102987, -0.5650028, 1.868046, 0, 0.7137255, 1, 1,
0.1141783, 1.438575, -1.935203, 0, 0.7058824, 1, 1,
0.1210493, 0.246584, -0.3156818, 0, 0.6980392, 1, 1,
0.1218238, 0.1555461, 1.004007, 0, 0.6941177, 1, 1,
0.1218548, -1.700519, 2.703738, 0, 0.6862745, 1, 1,
0.1221954, 1.310504, -0.1286541, 0, 0.682353, 1, 1,
0.1243423, 1.179753, 0.2291546, 0, 0.6745098, 1, 1,
0.1248522, -0.2029905, 1.538905, 0, 0.6705883, 1, 1,
0.1267367, -1.857269, 3.369601, 0, 0.6627451, 1, 1,
0.1308212, -0.8428864, 3.496145, 0, 0.6588235, 1, 1,
0.1320102, 0.7651386, 1.105695, 0, 0.6509804, 1, 1,
0.1380188, -0.05857391, 0.9552568, 0, 0.6470588, 1, 1,
0.1408661, -0.2951757, 3.989264, 0, 0.6392157, 1, 1,
0.141885, 0.4070835, 0.3417282, 0, 0.6352941, 1, 1,
0.142316, -0.1541052, 3.573824, 0, 0.627451, 1, 1,
0.1538248, -1.467787, 2.665052, 0, 0.6235294, 1, 1,
0.1564899, -0.1747303, 2.481697, 0, 0.6156863, 1, 1,
0.160949, -0.6175329, 4.344107, 0, 0.6117647, 1, 1,
0.170492, -0.06104961, 1.713189, 0, 0.6039216, 1, 1,
0.1707279, -0.2806943, 2.978706, 0, 0.5960785, 1, 1,
0.1729988, -1.368428, 2.390777, 0, 0.5921569, 1, 1,
0.1772726, 0.03805842, -0.2992423, 0, 0.5843138, 1, 1,
0.1827074, -0.03522404, 1.869733, 0, 0.5803922, 1, 1,
0.1878636, 2.138794, -1.402368, 0, 0.572549, 1, 1,
0.1891084, -1.891206, 2.393925, 0, 0.5686275, 1, 1,
0.1907046, -0.6956075, 2.823565, 0, 0.5607843, 1, 1,
0.1934837, -0.7627464, 2.349206, 0, 0.5568628, 1, 1,
0.1957009, -0.3797976, 3.346297, 0, 0.5490196, 1, 1,
0.1960353, -1.543718, 4.136327, 0, 0.5450981, 1, 1,
0.2001498, -0.2837478, 1.426736, 0, 0.5372549, 1, 1,
0.2014727, -0.3191776, 3.496774, 0, 0.5333334, 1, 1,
0.2075868, -0.4348074, 0.8407604, 0, 0.5254902, 1, 1,
0.2092629, 0.3474005, -0.2454258, 0, 0.5215687, 1, 1,
0.2103981, -0.7680998, 4.145636, 0, 0.5137255, 1, 1,
0.2105296, 0.8682919, 0.3537086, 0, 0.509804, 1, 1,
0.2114433, -0.1439203, 1.197889, 0, 0.5019608, 1, 1,
0.2116373, 0.3017898, 1.558305, 0, 0.4941176, 1, 1,
0.2170285, -0.3553347, 3.89014, 0, 0.4901961, 1, 1,
0.218607, -1.695702, 2.676171, 0, 0.4823529, 1, 1,
0.2192585, 0.08829271, 1.025786, 0, 0.4784314, 1, 1,
0.2235676, 0.4206258, 0.3615144, 0, 0.4705882, 1, 1,
0.2257797, 1.00044, 0.5750294, 0, 0.4666667, 1, 1,
0.2373069, -0.4195042, 0.1851801, 0, 0.4588235, 1, 1,
0.2445333, 0.7064485, 0.6011821, 0, 0.454902, 1, 1,
0.2445641, -0.8345227, 4.604912, 0, 0.4470588, 1, 1,
0.2458646, -0.7123522, 4.692274, 0, 0.4431373, 1, 1,
0.252835, 0.8900747, 1.961015, 0, 0.4352941, 1, 1,
0.2536122, 0.9993069, -0.1573762, 0, 0.4313726, 1, 1,
0.2547733, -0.1952539, 1.072812, 0, 0.4235294, 1, 1,
0.2548473, -0.8601323, 2.669291, 0, 0.4196078, 1, 1,
0.2562989, 0.77183, -0.310951, 0, 0.4117647, 1, 1,
0.2575013, 0.7450985, 1.423604, 0, 0.4078431, 1, 1,
0.2591861, -0.8742221, 3.250094, 0, 0.4, 1, 1,
0.2654946, -1.67821, 1.665663, 0, 0.3921569, 1, 1,
0.2722794, 0.54515, 0.1865965, 0, 0.3882353, 1, 1,
0.2746729, -1.972514, 4.303644, 0, 0.3803922, 1, 1,
0.2761544, 0.6113402, 1.609231, 0, 0.3764706, 1, 1,
0.2778759, -1.407479, 3.458915, 0, 0.3686275, 1, 1,
0.2781599, -1.298846, 2.766217, 0, 0.3647059, 1, 1,
0.2826979, 0.1170125, 1.207825, 0, 0.3568628, 1, 1,
0.285419, -2.110941, 2.837772, 0, 0.3529412, 1, 1,
0.2861722, 1.020745, 1.058523, 0, 0.345098, 1, 1,
0.2866434, 1.844901, 0.08335846, 0, 0.3411765, 1, 1,
0.2879353, -0.3142589, 2.403415, 0, 0.3333333, 1, 1,
0.2907121, -0.3858863, 1.445746, 0, 0.3294118, 1, 1,
0.2951774, 0.4100305, 0.3104892, 0, 0.3215686, 1, 1,
0.2954701, 0.6936949, 0.4864122, 0, 0.3176471, 1, 1,
0.2987688, 0.5743313, 2.626447, 0, 0.3098039, 1, 1,
0.3051776, -1.114647, 2.928241, 0, 0.3058824, 1, 1,
0.3053208, 2.087993, -0.9855956, 0, 0.2980392, 1, 1,
0.3057627, -0.2745829, 2.976809, 0, 0.2901961, 1, 1,
0.3089064, 0.9712077, -0.2138236, 0, 0.2862745, 1, 1,
0.3100678, 0.09554906, -0.529835, 0, 0.2784314, 1, 1,
0.3102913, 0.6514342, 1.116205, 0, 0.2745098, 1, 1,
0.3124543, -0.742988, 1.263223, 0, 0.2666667, 1, 1,
0.3130197, 0.2207553, 0.7963795, 0, 0.2627451, 1, 1,
0.3131127, -0.826538, 3.76479, 0, 0.254902, 1, 1,
0.3232824, 0.1131989, 3.143793, 0, 0.2509804, 1, 1,
0.3236941, 0.3653765, 1.501574, 0, 0.2431373, 1, 1,
0.3245642, -0.2903756, 1.660005, 0, 0.2392157, 1, 1,
0.3264621, 0.9784532, 0.8023369, 0, 0.2313726, 1, 1,
0.328986, -2.943208, 2.971663, 0, 0.227451, 1, 1,
0.330237, -1.017894, 3.248282, 0, 0.2196078, 1, 1,
0.3306829, -1.537325, 3.704207, 0, 0.2156863, 1, 1,
0.3310699, -0.770855, 3.511362, 0, 0.2078431, 1, 1,
0.3329528, 1.826125, 0.2464556, 0, 0.2039216, 1, 1,
0.3331289, 0.6766689, -0.5578743, 0, 0.1960784, 1, 1,
0.3434891, -0.769505, 2.454547, 0, 0.1882353, 1, 1,
0.3460235, 2.003481, 1.430962, 0, 0.1843137, 1, 1,
0.3470105, 0.6502854, 0.6435836, 0, 0.1764706, 1, 1,
0.3605703, -0.1782116, 2.038804, 0, 0.172549, 1, 1,
0.363533, 0.4871494, -0.06086281, 0, 0.1647059, 1, 1,
0.3639645, 0.02611748, 1.793631, 0, 0.1607843, 1, 1,
0.3651124, 0.4629719, -0.9674676, 0, 0.1529412, 1, 1,
0.3655098, -0.160193, 1.726148, 0, 0.1490196, 1, 1,
0.3681797, -0.9369714, 3.950399, 0, 0.1411765, 1, 1,
0.3685623, -0.103501, 2.396, 0, 0.1372549, 1, 1,
0.3691283, -0.06669389, 2.610202, 0, 0.1294118, 1, 1,
0.3712262, 0.8998191, 0.9376285, 0, 0.1254902, 1, 1,
0.3722655, -0.568216, 2.938067, 0, 0.1176471, 1, 1,
0.3731848, 0.2503783, 2.421501, 0, 0.1137255, 1, 1,
0.3747986, -0.8303964, 3.079468, 0, 0.1058824, 1, 1,
0.3788804, 0.0412291, 2.913716, 0, 0.09803922, 1, 1,
0.3808826, 0.8297603, 1.491067, 0, 0.09411765, 1, 1,
0.3810423, 0.7030194, 1.476808, 0, 0.08627451, 1, 1,
0.3834843, -0.1490933, 1.596852, 0, 0.08235294, 1, 1,
0.3847111, -1.04128, 2.636386, 0, 0.07450981, 1, 1,
0.3852188, 1.807225, -0.06555855, 0, 0.07058824, 1, 1,
0.3858141, -1.153103, 3.391141, 0, 0.0627451, 1, 1,
0.390324, -1.083676, 0.319485, 0, 0.05882353, 1, 1,
0.3911139, 0.8494469, 1.638597, 0, 0.05098039, 1, 1,
0.3945992, -0.238591, 3.480668, 0, 0.04705882, 1, 1,
0.3959609, 0.4366636, 2.050948, 0, 0.03921569, 1, 1,
0.3967989, 0.2851894, 1.800439, 0, 0.03529412, 1, 1,
0.4003402, -1.369243, 2.443821, 0, 0.02745098, 1, 1,
0.4005671, 0.9719192, 2.399769, 0, 0.02352941, 1, 1,
0.4024822, 1.059571, -0.7473377, 0, 0.01568628, 1, 1,
0.4026683, -0.6415888, 2.257005, 0, 0.01176471, 1, 1,
0.4027582, 1.506873, -0.2555362, 0, 0.003921569, 1, 1,
0.4043548, 1.388028, 0.2702127, 0.003921569, 0, 1, 1,
0.4053714, 1.159721, -0.4691451, 0.007843138, 0, 1, 1,
0.4063207, 2.382002, 0.5413655, 0.01568628, 0, 1, 1,
0.4074755, -0.7641023, 3.468477, 0.01960784, 0, 1, 1,
0.4151015, 0.3590078, 0.7148086, 0.02745098, 0, 1, 1,
0.4170554, -1.012092, 3.268673, 0.03137255, 0, 1, 1,
0.4184919, -0.577659, 4.525012, 0.03921569, 0, 1, 1,
0.428046, 0.7463132, 0.4536528, 0.04313726, 0, 1, 1,
0.4294936, 0.7862263, 0.7832243, 0.05098039, 0, 1, 1,
0.4295429, -0.2753417, 1.637915, 0.05490196, 0, 1, 1,
0.4307953, -0.2542137, 3.613307, 0.0627451, 0, 1, 1,
0.4310969, -1.166463, 2.750692, 0.06666667, 0, 1, 1,
0.4349492, -1.325125, 3.193841, 0.07450981, 0, 1, 1,
0.4382465, -1.066983, 1.538238, 0.07843138, 0, 1, 1,
0.4393181, 1.07034, 1.503182, 0.08627451, 0, 1, 1,
0.4475129, 1.110381, -1.103266, 0.09019608, 0, 1, 1,
0.4489591, -0.352952, 3.304047, 0.09803922, 0, 1, 1,
0.4530717, 0.2442744, 0.02317508, 0.1058824, 0, 1, 1,
0.4573559, 0.526055, 1.488931, 0.1098039, 0, 1, 1,
0.4581285, 0.753298, 0.957514, 0.1176471, 0, 1, 1,
0.4592211, 1.365218, -0.2031416, 0.1215686, 0, 1, 1,
0.463355, 2.196413, -1.738022, 0.1294118, 0, 1, 1,
0.4651635, -0.9216039, 3.123455, 0.1333333, 0, 1, 1,
0.4661799, 0.7895532, 0.9253161, 0.1411765, 0, 1, 1,
0.4670943, -1.540387, 3.375213, 0.145098, 0, 1, 1,
0.4715224, 0.255777, -0.1745857, 0.1529412, 0, 1, 1,
0.4722988, -1.878382, 2.363526, 0.1568628, 0, 1, 1,
0.4733507, 1.146358, 1.11133, 0.1647059, 0, 1, 1,
0.4739273, -1.383606, 1.998334, 0.1686275, 0, 1, 1,
0.47879, 0.02930275, 1.480316, 0.1764706, 0, 1, 1,
0.4797639, 0.881178, 0.392188, 0.1803922, 0, 1, 1,
0.4804717, 1.225792, 1.567402, 0.1882353, 0, 1, 1,
0.4866231, 0.2069341, 1.499953, 0.1921569, 0, 1, 1,
0.4882282, 0.6073992, 0.9144986, 0.2, 0, 1, 1,
0.495871, 0.5532703, 0.8506027, 0.2078431, 0, 1, 1,
0.4961933, 0.6652089, -0.1647297, 0.2117647, 0, 1, 1,
0.5001692, -1.334324, 0.8012509, 0.2196078, 0, 1, 1,
0.5006505, -2.404625, 1.780262, 0.2235294, 0, 1, 1,
0.5009115, 0.5551705, 1.191299, 0.2313726, 0, 1, 1,
0.5026959, 0.525934, -0.5649865, 0.2352941, 0, 1, 1,
0.5051048, 0.03393862, 0.2556654, 0.2431373, 0, 1, 1,
0.5090437, -0.3837242, 1.2706, 0.2470588, 0, 1, 1,
0.5130348, -0.5395662, 2.062504, 0.254902, 0, 1, 1,
0.5157556, 0.8179386, 0.6863399, 0.2588235, 0, 1, 1,
0.5230157, 0.6592234, 1.480434, 0.2666667, 0, 1, 1,
0.5289154, -0.1638477, 2.161247, 0.2705882, 0, 1, 1,
0.5305904, 1.238428, 0.1361809, 0.2784314, 0, 1, 1,
0.5306338, 1.375553, 0.6892688, 0.282353, 0, 1, 1,
0.5402988, -0.8709247, 4.05796, 0.2901961, 0, 1, 1,
0.5403085, -0.3788177, 1.604993, 0.2941177, 0, 1, 1,
0.5403802, 0.7410967, -0.002214005, 0.3019608, 0, 1, 1,
0.5417212, 1.004308, -0.1308135, 0.3098039, 0, 1, 1,
0.5453565, -0.04800379, 2.358905, 0.3137255, 0, 1, 1,
0.5524378, -1.285446, 4.947883, 0.3215686, 0, 1, 1,
0.5525196, -0.9826489, 0.944286, 0.3254902, 0, 1, 1,
0.5552428, -0.7824152, 2.149965, 0.3333333, 0, 1, 1,
0.5584279, 0.1344614, 2.058496, 0.3372549, 0, 1, 1,
0.558571, 1.403952, 1.623798, 0.345098, 0, 1, 1,
0.5593435, -0.009671055, -0.4639378, 0.3490196, 0, 1, 1,
0.5634152, -0.1152589, 1.838914, 0.3568628, 0, 1, 1,
0.5684105, -1.119155, 0.6188263, 0.3607843, 0, 1, 1,
0.5720128, 0.7535548, 1.029139, 0.3686275, 0, 1, 1,
0.5768954, 0.1208252, 0.6353085, 0.372549, 0, 1, 1,
0.5798723, -1.037317, 3.168096, 0.3803922, 0, 1, 1,
0.5808261, 0.7957973, 1.511408, 0.3843137, 0, 1, 1,
0.5813315, 0.6222913, 0.9298947, 0.3921569, 0, 1, 1,
0.5894552, 1.49721, 1.223523, 0.3960784, 0, 1, 1,
0.5962679, 0.8107172, 2.013873, 0.4039216, 0, 1, 1,
0.5969961, -0.5292584, 2.510767, 0.4117647, 0, 1, 1,
0.5970558, -0.01924839, 0.3557049, 0.4156863, 0, 1, 1,
0.5989921, -1.320047, 2.03997, 0.4235294, 0, 1, 1,
0.6029692, 1.327275, 1.539461, 0.427451, 0, 1, 1,
0.6039833, 0.8157159, -0.9182278, 0.4352941, 0, 1, 1,
0.6153568, -0.8994326, 2.690413, 0.4392157, 0, 1, 1,
0.6153733, -0.02306509, 1.40676, 0.4470588, 0, 1, 1,
0.6179474, 0.3978748, 0.01226823, 0.4509804, 0, 1, 1,
0.6188529, 1.352108, -0.6672947, 0.4588235, 0, 1, 1,
0.620162, -0.4642912, 1.788025, 0.4627451, 0, 1, 1,
0.6286864, -0.3105821, 1.014742, 0.4705882, 0, 1, 1,
0.6305642, -0.5082319, 1.29699, 0.4745098, 0, 1, 1,
0.631745, 0.5174895, 0.9799583, 0.4823529, 0, 1, 1,
0.6347231, -0.3967513, 0.8458112, 0.4862745, 0, 1, 1,
0.6375385, -0.2859294, 2.184093, 0.4941176, 0, 1, 1,
0.6385877, 0.08315985, 0.699738, 0.5019608, 0, 1, 1,
0.6473082, -0.2485193, 1.506185, 0.5058824, 0, 1, 1,
0.6506494, -0.2503319, 3.163322, 0.5137255, 0, 1, 1,
0.6534275, -0.3778317, 1.497498, 0.5176471, 0, 1, 1,
0.6541224, 0.8441268, -0.7819284, 0.5254902, 0, 1, 1,
0.6547424, 0.4226184, 1.996037, 0.5294118, 0, 1, 1,
0.65758, 0.7779287, 0.7514631, 0.5372549, 0, 1, 1,
0.6607312, 0.03599177, 0.5656831, 0.5411765, 0, 1, 1,
0.6686105, -0.4509041, 1.749873, 0.5490196, 0, 1, 1,
0.6722207, 0.8396628, 1.644777, 0.5529412, 0, 1, 1,
0.6735339, -1.067328, 2.354089, 0.5607843, 0, 1, 1,
0.6738648, 1.343554, -0.1107756, 0.5647059, 0, 1, 1,
0.6754242, -0.737807, 3.300551, 0.572549, 0, 1, 1,
0.6805769, -1.783812, 2.525801, 0.5764706, 0, 1, 1,
0.6882489, -0.5012169, 3.281496, 0.5843138, 0, 1, 1,
0.690582, 0.2958181, 1.281972, 0.5882353, 0, 1, 1,
0.6909446, -0.8981982, 2.76722, 0.5960785, 0, 1, 1,
0.6942925, 1.909894, 0.1941801, 0.6039216, 0, 1, 1,
0.6983116, -0.4871213, 1.179946, 0.6078432, 0, 1, 1,
0.699342, 0.6050234, -0.9912374, 0.6156863, 0, 1, 1,
0.7005712, 1.808224, 2.079875, 0.6196079, 0, 1, 1,
0.7040402, 1.332793, 0.5486036, 0.627451, 0, 1, 1,
0.7049243, 1.971871, 0.4966473, 0.6313726, 0, 1, 1,
0.7067692, -0.3506857, 1.59815, 0.6392157, 0, 1, 1,
0.7089549, 0.2047792, 1.354698, 0.6431373, 0, 1, 1,
0.7107062, 1.386416, 2.042304, 0.6509804, 0, 1, 1,
0.7139509, 1.03805, 2.441765, 0.654902, 0, 1, 1,
0.7175221, -0.835601, 2.191437, 0.6627451, 0, 1, 1,
0.71969, 0.8953225, 0.3582035, 0.6666667, 0, 1, 1,
0.721109, -0.1816322, 2.317754, 0.6745098, 0, 1, 1,
0.7214578, -0.1044978, 1.302527, 0.6784314, 0, 1, 1,
0.7264269, 0.4188685, -0.7672328, 0.6862745, 0, 1, 1,
0.7297235, -0.3893847, 1.775253, 0.6901961, 0, 1, 1,
0.7302991, -1.491171, 1.146043, 0.6980392, 0, 1, 1,
0.7433096, 0.1769661, 1.332209, 0.7058824, 0, 1, 1,
0.748155, 0.2214875, 0.8176257, 0.7098039, 0, 1, 1,
0.7486615, 0.8003746, 1.185757, 0.7176471, 0, 1, 1,
0.7487246, 0.8778911, 1.429735, 0.7215686, 0, 1, 1,
0.750734, 0.1347392, 2.54829, 0.7294118, 0, 1, 1,
0.7527159, -1.303464, 2.284319, 0.7333333, 0, 1, 1,
0.7545182, 0.6928794, 0.7960055, 0.7411765, 0, 1, 1,
0.7545409, 0.755062, -1.214528, 0.7450981, 0, 1, 1,
0.7562835, 1.534491, 1.44506, 0.7529412, 0, 1, 1,
0.7587924, -0.952317, 2.429136, 0.7568628, 0, 1, 1,
0.7591594, 0.9378699, 1.124153, 0.7647059, 0, 1, 1,
0.7636848, -1.134504, 0.9507532, 0.7686275, 0, 1, 1,
0.7672713, -1.543177, 3.7351, 0.7764706, 0, 1, 1,
0.7744055, -0.3316402, 4.061762, 0.7803922, 0, 1, 1,
0.7748778, 0.9806507, 0.9070181, 0.7882353, 0, 1, 1,
0.7821538, 2.107058, 0.208703, 0.7921569, 0, 1, 1,
0.7832373, -0.6096163, 1.803881, 0.8, 0, 1, 1,
0.7839709, 0.6768783, 1.412815, 0.8078431, 0, 1, 1,
0.7901186, 0.4613379, 1.3165, 0.8117647, 0, 1, 1,
0.8142715, 1.756136, -0.9178249, 0.8196079, 0, 1, 1,
0.8173277, -0.2237175, 2.078182, 0.8235294, 0, 1, 1,
0.8179253, -0.4313838, 1.754282, 0.8313726, 0, 1, 1,
0.8196362, -0.7423177, 0.4659346, 0.8352941, 0, 1, 1,
0.8196768, 0.8195245, 1.422421, 0.8431373, 0, 1, 1,
0.8206748, 0.1709105, 0.5602821, 0.8470588, 0, 1, 1,
0.8213798, -0.06121896, 1.135713, 0.854902, 0, 1, 1,
0.8250282, 2.38025, -1.935083, 0.8588235, 0, 1, 1,
0.8252299, 0.4206869, 1.638915, 0.8666667, 0, 1, 1,
0.8268397, 0.1344453, 0.2364969, 0.8705882, 0, 1, 1,
0.8378375, 0.5556328, 1.156983, 0.8784314, 0, 1, 1,
0.8415552, 0.9418438, 0.4005717, 0.8823529, 0, 1, 1,
0.8475016, 0.8868548, 0.9501873, 0.8901961, 0, 1, 1,
0.8592823, 0.2852248, -0.1846458, 0.8941177, 0, 1, 1,
0.866101, 0.7228662, 1.790834, 0.9019608, 0, 1, 1,
0.8725311, 0.5008491, 0.119338, 0.9098039, 0, 1, 1,
0.8727013, 1.738797, -0.3758171, 0.9137255, 0, 1, 1,
0.8733323, 1.584132, 0.2049607, 0.9215686, 0, 1, 1,
0.8742884, -1.86127, 1.911373, 0.9254902, 0, 1, 1,
0.8757769, 0.3492313, 1.963612, 0.9333333, 0, 1, 1,
0.8770242, -0.4450066, 2.070086, 0.9372549, 0, 1, 1,
0.8779224, -1.303955, 2.838587, 0.945098, 0, 1, 1,
0.8813139, 0.9560024, -0.9968559, 0.9490196, 0, 1, 1,
0.883783, -0.02304392, 0.2943547, 0.9568627, 0, 1, 1,
0.8892042, -0.8760617, 2.402788, 0.9607843, 0, 1, 1,
0.8892791, 0.9593393, 1.585572, 0.9686275, 0, 1, 1,
0.8944612, 0.7095551, 1.581461, 0.972549, 0, 1, 1,
0.8973751, 0.8433743, 1.303737, 0.9803922, 0, 1, 1,
0.901602, -1.520102, 1.852351, 0.9843137, 0, 1, 1,
0.9078609, 2.022156, 0.8377347, 0.9921569, 0, 1, 1,
0.9083353, 1.24695, -0.05953953, 0.9960784, 0, 1, 1,
0.9131857, 1.400975, 0.443489, 1, 0, 0.9960784, 1,
0.9140569, -0.02637957, 1.949961, 1, 0, 0.9882353, 1,
0.9144059, -0.4959618, 2.353988, 1, 0, 0.9843137, 1,
0.915436, 0.6869595, 0.1402168, 1, 0, 0.9764706, 1,
0.9181378, -1.62395, 2.038692, 1, 0, 0.972549, 1,
0.9234554, -2.384635, 2.470946, 1, 0, 0.9647059, 1,
0.9236861, -1.765137, 4.263657, 1, 0, 0.9607843, 1,
0.9276487, 0.9225644, 3.385829, 1, 0, 0.9529412, 1,
0.9305223, 0.1425481, -0.8544565, 1, 0, 0.9490196, 1,
0.9309277, 2.119069, 2.223681, 1, 0, 0.9411765, 1,
0.9350115, 1.249892, 0.6934835, 1, 0, 0.9372549, 1,
0.9410755, -1.323796, 3.204991, 1, 0, 0.9294118, 1,
0.9431571, 0.1976518, 1.012191, 1, 0, 0.9254902, 1,
0.9477482, 1.274246, 1.574849, 1, 0, 0.9176471, 1,
0.9487646, 1.233775, 1.546259, 1, 0, 0.9137255, 1,
0.9512023, -0.673821, 1.713491, 1, 0, 0.9058824, 1,
0.9598365, -0.164695, 0.957688, 1, 0, 0.9019608, 1,
0.9718147, -0.01881853, 0.9860127, 1, 0, 0.8941177, 1,
0.9907615, -0.6015075, 1.840055, 1, 0, 0.8862745, 1,
1.003855, -0.4271365, 0.4162382, 1, 0, 0.8823529, 1,
1.007078, -0.5723436, 0.1951029, 1, 0, 0.8745098, 1,
1.012832, 1.197734, 0.8649874, 1, 0, 0.8705882, 1,
1.02141, -1.366476, 2.695257, 1, 0, 0.8627451, 1,
1.024797, 0.04018355, 1.212151, 1, 0, 0.8588235, 1,
1.030376, 0.5835748, 0.2248362, 1, 0, 0.8509804, 1,
1.031829, -0.167713, 2.631527, 1, 0, 0.8470588, 1,
1.034465, -0.4879681, 0.7934848, 1, 0, 0.8392157, 1,
1.041953, -0.05145211, 3.185004, 1, 0, 0.8352941, 1,
1.043917, -0.4577971, 0.9294222, 1, 0, 0.827451, 1,
1.045665, -0.531337, 3.005331, 1, 0, 0.8235294, 1,
1.046769, 0.5347898, 0.6435869, 1, 0, 0.8156863, 1,
1.049099, 1.114055, 1.095501, 1, 0, 0.8117647, 1,
1.052768, 1.10557, -0.1426643, 1, 0, 0.8039216, 1,
1.065511, 0.1231542, 1.155542, 1, 0, 0.7960784, 1,
1.076869, 0.306159, 0.2371358, 1, 0, 0.7921569, 1,
1.083029, 0.9517785, 0.6714894, 1, 0, 0.7843137, 1,
1.091119, 0.2871104, 1.639882, 1, 0, 0.7803922, 1,
1.10327, 0.1540294, 1.618698, 1, 0, 0.772549, 1,
1.103695, -0.4302988, 1.742496, 1, 0, 0.7686275, 1,
1.107756, 0.7333167, 1.80657, 1, 0, 0.7607843, 1,
1.108701, 0.634721, 1.080102, 1, 0, 0.7568628, 1,
1.111522, 0.7359388, 0.7433847, 1, 0, 0.7490196, 1,
1.119458, 1.108478, -0.1864683, 1, 0, 0.7450981, 1,
1.124417, -0.4124622, 2.313967, 1, 0, 0.7372549, 1,
1.126794, -0.08967687, 0.9531618, 1, 0, 0.7333333, 1,
1.128132, 0.09047774, 2.038309, 1, 0, 0.7254902, 1,
1.129295, -0.1780165, 2.545613, 1, 0, 0.7215686, 1,
1.129722, -0.263752, 0.2170871, 1, 0, 0.7137255, 1,
1.137297, 0.3916152, 1.863635, 1, 0, 0.7098039, 1,
1.140056, -0.4539801, 0.5061386, 1, 0, 0.7019608, 1,
1.140067, 1.486537, -0.01337901, 1, 0, 0.6941177, 1,
1.142318, 0.4088968, 2.293297, 1, 0, 0.6901961, 1,
1.142433, -1.591788, 1.999792, 1, 0, 0.682353, 1,
1.142805, -0.7071322, 1.6396, 1, 0, 0.6784314, 1,
1.145847, -1.679682, 1.647183, 1, 0, 0.6705883, 1,
1.157584, 0.3446907, 2.093324, 1, 0, 0.6666667, 1,
1.158953, 1.666643, -0.07386643, 1, 0, 0.6588235, 1,
1.159692, -2.637359, 2.900252, 1, 0, 0.654902, 1,
1.161373, -0.7497973, 0.7752056, 1, 0, 0.6470588, 1,
1.174556, -1.717658, 3.611279, 1, 0, 0.6431373, 1,
1.177283, -0.6125365, 3.784922, 1, 0, 0.6352941, 1,
1.184111, 0.04663072, 2.494795, 1, 0, 0.6313726, 1,
1.190987, 1.332634, 3.141884, 1, 0, 0.6235294, 1,
1.1991, 0.5216252, 0.5117325, 1, 0, 0.6196079, 1,
1.20458, -0.9214357, 2.203581, 1, 0, 0.6117647, 1,
1.210747, -0.1638044, 1.294645, 1, 0, 0.6078432, 1,
1.21114, 0.1538835, 0.2639546, 1, 0, 0.6, 1,
1.219202, -1.228307, 3.608064, 1, 0, 0.5921569, 1,
1.228492, 1.602615, 1.754475, 1, 0, 0.5882353, 1,
1.244584, -0.04581678, 1.745884, 1, 0, 0.5803922, 1,
1.247084, -0.0506459, 1.110428, 1, 0, 0.5764706, 1,
1.249454, -1.615845, 3.722415, 1, 0, 0.5686275, 1,
1.262191, -1.037902, 0.850848, 1, 0, 0.5647059, 1,
1.267862, -0.3314584, 1.738053, 1, 0, 0.5568628, 1,
1.274858, -0.1761371, 1.146628, 1, 0, 0.5529412, 1,
1.304495, 0.5731178, 2.046149, 1, 0, 0.5450981, 1,
1.306526, 0.8798086, 1.111838, 1, 0, 0.5411765, 1,
1.318326, 1.022227, -0.2798118, 1, 0, 0.5333334, 1,
1.326734, 0.8682417, 0.01194852, 1, 0, 0.5294118, 1,
1.353279, -1.070226, 3.478205, 1, 0, 0.5215687, 1,
1.355381, -1.827312, 2.032152, 1, 0, 0.5176471, 1,
1.365944, -0.05091068, 0.6074541, 1, 0, 0.509804, 1,
1.377667, 0.4484262, 2.686061, 1, 0, 0.5058824, 1,
1.385067, -0.07297983, 1.993645, 1, 0, 0.4980392, 1,
1.399272, 0.6949733, 1.265972, 1, 0, 0.4901961, 1,
1.414907, -0.3896254, 1.645574, 1, 0, 0.4862745, 1,
1.41627, -1.019276, 1.658308, 1, 0, 0.4784314, 1,
1.422341, -0.6709947, 1.273062, 1, 0, 0.4745098, 1,
1.434454, -1.221753, 1.89458, 1, 0, 0.4666667, 1,
1.452945, -0.2913627, 3.25994, 1, 0, 0.4627451, 1,
1.454225, -0.7675794, 1.475005, 1, 0, 0.454902, 1,
1.458594, 0.9607292, 1.850573, 1, 0, 0.4509804, 1,
1.459612, -1.18312, 2.30955, 1, 0, 0.4431373, 1,
1.46049, -0.1095022, 2.224229, 1, 0, 0.4392157, 1,
1.460552, 0.3623444, 2.22112, 1, 0, 0.4313726, 1,
1.46542, -0.08794348, -0.09016462, 1, 0, 0.427451, 1,
1.471357, 0.56586, 0.1795291, 1, 0, 0.4196078, 1,
1.490739, -0.2723094, 1.038992, 1, 0, 0.4156863, 1,
1.498332, -0.4052929, 2.86673, 1, 0, 0.4078431, 1,
1.499718, 0.5880569, 0.6795911, 1, 0, 0.4039216, 1,
1.5008, -1.067439, 5.442774, 1, 0, 0.3960784, 1,
1.511016, -1.184213, 1.828085, 1, 0, 0.3882353, 1,
1.512835, -0.7691777, 3.131333, 1, 0, 0.3843137, 1,
1.530824, 0.956908, -0.02226595, 1, 0, 0.3764706, 1,
1.555246, -0.4002628, 1.392086, 1, 0, 0.372549, 1,
1.579616, -1.997451, 2.324732, 1, 0, 0.3647059, 1,
1.584731, 1.242619, 1.408737, 1, 0, 0.3607843, 1,
1.585059, 0.7443436, 0.7145882, 1, 0, 0.3529412, 1,
1.587171, -0.327978, 0.2674172, 1, 0, 0.3490196, 1,
1.594547, 1.670115, 0.7034553, 1, 0, 0.3411765, 1,
1.595113, 0.2549262, 1.279255, 1, 0, 0.3372549, 1,
1.603859, 0.5590648, -0.09248324, 1, 0, 0.3294118, 1,
1.609843, 1.297813, 2.790975, 1, 0, 0.3254902, 1,
1.64115, 0.8886084, 0.5540414, 1, 0, 0.3176471, 1,
1.651989, -0.1872298, 2.499995, 1, 0, 0.3137255, 1,
1.655143, -1.023234, 1.522775, 1, 0, 0.3058824, 1,
1.679852, -0.5173516, 0.789552, 1, 0, 0.2980392, 1,
1.683513, -1.66951, 2.0511, 1, 0, 0.2941177, 1,
1.694552, 0.05862503, 0.9119163, 1, 0, 0.2862745, 1,
1.698612, -1.808354, 2.036008, 1, 0, 0.282353, 1,
1.698802, -0.3090391, 2.823459, 1, 0, 0.2745098, 1,
1.720797, 0.6860831, -1.268735, 1, 0, 0.2705882, 1,
1.742329, -1.028355, 2.133681, 1, 0, 0.2627451, 1,
1.746299, -0.241717, 0.5007359, 1, 0, 0.2588235, 1,
1.767827, -1.960662, 1.411247, 1, 0, 0.2509804, 1,
1.770777, -0.2314906, 2.499512, 1, 0, 0.2470588, 1,
1.775373, -0.8472381, 2.563108, 1, 0, 0.2392157, 1,
1.784527, 0.04886755, 2.139965, 1, 0, 0.2352941, 1,
1.807746, -1.151187, 2.898478, 1, 0, 0.227451, 1,
1.810789, 0.08058496, 1.22689, 1, 0, 0.2235294, 1,
1.833891, -0.2012475, 0.2434369, 1, 0, 0.2156863, 1,
1.85393, 1.035244, 0.6872845, 1, 0, 0.2117647, 1,
1.895296, 1.36945, -0.2884761, 1, 0, 0.2039216, 1,
1.915408, 0.8896066, 1.115756, 1, 0, 0.1960784, 1,
1.929949, 0.3171958, 1.719098, 1, 0, 0.1921569, 1,
1.947235, -0.3865031, 0.2243241, 1, 0, 0.1843137, 1,
1.961804, 0.7647769, 1.49299, 1, 0, 0.1803922, 1,
1.964659, 0.404509, 0.01870454, 1, 0, 0.172549, 1,
1.9868, -0.4548967, 1.525174, 1, 0, 0.1686275, 1,
1.991013, -1.257554, 2.686465, 1, 0, 0.1607843, 1,
2.026873, -0.7205663, 0.9472561, 1, 0, 0.1568628, 1,
2.039194, -1.467624, 2.920952, 1, 0, 0.1490196, 1,
2.042555, -0.7646862, 2.360678, 1, 0, 0.145098, 1,
2.065625, 0.3600579, 2.439127, 1, 0, 0.1372549, 1,
2.107124, -0.436984, 1.82993, 1, 0, 0.1333333, 1,
2.109545, -1.198264, 2.01597, 1, 0, 0.1254902, 1,
2.115143, 0.3429629, 0.1513967, 1, 0, 0.1215686, 1,
2.15129, 0.1765325, 3.19685, 1, 0, 0.1137255, 1,
2.161253, 0.5438165, 3.800505, 1, 0, 0.1098039, 1,
2.180497, 0.05843923, 1.94879, 1, 0, 0.1019608, 1,
2.219026, 2.215315, 1.855258, 1, 0, 0.09411765, 1,
2.271279, -0.6967149, 1.930745, 1, 0, 0.09019608, 1,
2.276683, 1.217469, -0.1672951, 1, 0, 0.08235294, 1,
2.328532, -0.4167636, 1.813462, 1, 0, 0.07843138, 1,
2.337539, 0.2901057, 3.33555, 1, 0, 0.07058824, 1,
2.349839, -0.5143782, 3.05637, 1, 0, 0.06666667, 1,
2.391263, -0.3239716, 2.855107, 1, 0, 0.05882353, 1,
2.402406, -1.584893, 2.232562, 1, 0, 0.05490196, 1,
2.41394, -1.542347, 1.774657, 1, 0, 0.04705882, 1,
2.424814, -0.1185006, 1.795762, 1, 0, 0.04313726, 1,
2.499422, -0.234329, 1.536662, 1, 0, 0.03529412, 1,
2.522021, -0.4952346, 2.230379, 1, 0, 0.03137255, 1,
2.587701, -0.6147604, 2.247575, 1, 0, 0.02352941, 1,
2.620416, -1.2237, 2.026911, 1, 0, 0.01960784, 1,
2.680876, 0.966602, 1.653083, 1, 0, 0.01176471, 1,
2.681177, 2.46597, 0.2861216, 1, 0, 0.007843138, 1
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
-0.6137961, -4.506182, -6.921273, 0, -0.5, 0.5, 0.5,
-0.6137961, -4.506182, -6.921273, 1, -0.5, 0.5, 0.5,
-0.6137961, -4.506182, -6.921273, 1, 1.5, 0.5, 0.5,
-0.6137961, -4.506182, -6.921273, 0, 1.5, 0.5, 0.5
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
-5.025764, -0.1860839, -6.921273, 0, -0.5, 0.5, 0.5,
-5.025764, -0.1860839, -6.921273, 1, -0.5, 0.5, 0.5,
-5.025764, -0.1860839, -6.921273, 1, 1.5, 0.5, 0.5,
-5.025764, -0.1860839, -6.921273, 0, 1.5, 0.5, 0.5
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
-5.025764, -4.506182, 0.1567342, 0, -0.5, 0.5, 0.5,
-5.025764, -4.506182, 0.1567342, 1, -0.5, 0.5, 0.5,
-5.025764, -4.506182, 0.1567342, 1, 1.5, 0.5, 0.5,
-5.025764, -4.506182, 0.1567342, 0, 1.5, 0.5, 0.5
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
-3, -3.509236, -5.287887,
2, -3.509236, -5.287887,
-3, -3.509236, -5.287887,
-3, -3.675394, -5.560118,
-2, -3.509236, -5.287887,
-2, -3.675394, -5.560118,
-1, -3.509236, -5.287887,
-1, -3.675394, -5.560118,
0, -3.509236, -5.287887,
0, -3.675394, -5.560118,
1, -3.509236, -5.287887,
1, -3.675394, -5.560118,
2, -3.509236, -5.287887,
2, -3.675394, -5.560118
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
-3, -4.00771, -6.104579, 0, -0.5, 0.5, 0.5,
-3, -4.00771, -6.104579, 1, -0.5, 0.5, 0.5,
-3, -4.00771, -6.104579, 1, 1.5, 0.5, 0.5,
-3, -4.00771, -6.104579, 0, 1.5, 0.5, 0.5,
-2, -4.00771, -6.104579, 0, -0.5, 0.5, 0.5,
-2, -4.00771, -6.104579, 1, -0.5, 0.5, 0.5,
-2, -4.00771, -6.104579, 1, 1.5, 0.5, 0.5,
-2, -4.00771, -6.104579, 0, 1.5, 0.5, 0.5,
-1, -4.00771, -6.104579, 0, -0.5, 0.5, 0.5,
-1, -4.00771, -6.104579, 1, -0.5, 0.5, 0.5,
-1, -4.00771, -6.104579, 1, 1.5, 0.5, 0.5,
-1, -4.00771, -6.104579, 0, 1.5, 0.5, 0.5,
0, -4.00771, -6.104579, 0, -0.5, 0.5, 0.5,
0, -4.00771, -6.104579, 1, -0.5, 0.5, 0.5,
0, -4.00771, -6.104579, 1, 1.5, 0.5, 0.5,
0, -4.00771, -6.104579, 0, 1.5, 0.5, 0.5,
1, -4.00771, -6.104579, 0, -0.5, 0.5, 0.5,
1, -4.00771, -6.104579, 1, -0.5, 0.5, 0.5,
1, -4.00771, -6.104579, 1, 1.5, 0.5, 0.5,
1, -4.00771, -6.104579, 0, 1.5, 0.5, 0.5,
2, -4.00771, -6.104579, 0, -0.5, 0.5, 0.5,
2, -4.00771, -6.104579, 1, -0.5, 0.5, 0.5,
2, -4.00771, -6.104579, 1, 1.5, 0.5, 0.5,
2, -4.00771, -6.104579, 0, 1.5, 0.5, 0.5
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
-4.007618, -3, -5.287887,
-4.007618, 3, -5.287887,
-4.007618, -3, -5.287887,
-4.177309, -3, -5.560118,
-4.007618, -2, -5.287887,
-4.177309, -2, -5.560118,
-4.007618, -1, -5.287887,
-4.177309, -1, -5.560118,
-4.007618, 0, -5.287887,
-4.177309, 0, -5.560118,
-4.007618, 1, -5.287887,
-4.177309, 1, -5.560118,
-4.007618, 2, -5.287887,
-4.177309, 2, -5.560118,
-4.007618, 3, -5.287887,
-4.177309, 3, -5.560118
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
-4.516691, -3, -6.104579, 0, -0.5, 0.5, 0.5,
-4.516691, -3, -6.104579, 1, -0.5, 0.5, 0.5,
-4.516691, -3, -6.104579, 1, 1.5, 0.5, 0.5,
-4.516691, -3, -6.104579, 0, 1.5, 0.5, 0.5,
-4.516691, -2, -6.104579, 0, -0.5, 0.5, 0.5,
-4.516691, -2, -6.104579, 1, -0.5, 0.5, 0.5,
-4.516691, -2, -6.104579, 1, 1.5, 0.5, 0.5,
-4.516691, -2, -6.104579, 0, 1.5, 0.5, 0.5,
-4.516691, -1, -6.104579, 0, -0.5, 0.5, 0.5,
-4.516691, -1, -6.104579, 1, -0.5, 0.5, 0.5,
-4.516691, -1, -6.104579, 1, 1.5, 0.5, 0.5,
-4.516691, -1, -6.104579, 0, 1.5, 0.5, 0.5,
-4.516691, 0, -6.104579, 0, -0.5, 0.5, 0.5,
-4.516691, 0, -6.104579, 1, -0.5, 0.5, 0.5,
-4.516691, 0, -6.104579, 1, 1.5, 0.5, 0.5,
-4.516691, 0, -6.104579, 0, 1.5, 0.5, 0.5,
-4.516691, 1, -6.104579, 0, -0.5, 0.5, 0.5,
-4.516691, 1, -6.104579, 1, -0.5, 0.5, 0.5,
-4.516691, 1, -6.104579, 1, 1.5, 0.5, 0.5,
-4.516691, 1, -6.104579, 0, 1.5, 0.5, 0.5,
-4.516691, 2, -6.104579, 0, -0.5, 0.5, 0.5,
-4.516691, 2, -6.104579, 1, -0.5, 0.5, 0.5,
-4.516691, 2, -6.104579, 1, 1.5, 0.5, 0.5,
-4.516691, 2, -6.104579, 0, 1.5, 0.5, 0.5,
-4.516691, 3, -6.104579, 0, -0.5, 0.5, 0.5,
-4.516691, 3, -6.104579, 1, -0.5, 0.5, 0.5,
-4.516691, 3, -6.104579, 1, 1.5, 0.5, 0.5,
-4.516691, 3, -6.104579, 0, 1.5, 0.5, 0.5
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
-4.007618, -3.509236, -4,
-4.007618, -3.509236, 4,
-4.007618, -3.509236, -4,
-4.177309, -3.675394, -4,
-4.007618, -3.509236, -2,
-4.177309, -3.675394, -2,
-4.007618, -3.509236, 0,
-4.177309, -3.675394, 0,
-4.007618, -3.509236, 2,
-4.177309, -3.675394, 2,
-4.007618, -3.509236, 4,
-4.177309, -3.675394, 4
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
-4.516691, -4.00771, -4, 0, -0.5, 0.5, 0.5,
-4.516691, -4.00771, -4, 1, -0.5, 0.5, 0.5,
-4.516691, -4.00771, -4, 1, 1.5, 0.5, 0.5,
-4.516691, -4.00771, -4, 0, 1.5, 0.5, 0.5,
-4.516691, -4.00771, -2, 0, -0.5, 0.5, 0.5,
-4.516691, -4.00771, -2, 1, -0.5, 0.5, 0.5,
-4.516691, -4.00771, -2, 1, 1.5, 0.5, 0.5,
-4.516691, -4.00771, -2, 0, 1.5, 0.5, 0.5,
-4.516691, -4.00771, 0, 0, -0.5, 0.5, 0.5,
-4.516691, -4.00771, 0, 1, -0.5, 0.5, 0.5,
-4.516691, -4.00771, 0, 1, 1.5, 0.5, 0.5,
-4.516691, -4.00771, 0, 0, 1.5, 0.5, 0.5,
-4.516691, -4.00771, 2, 0, -0.5, 0.5, 0.5,
-4.516691, -4.00771, 2, 1, -0.5, 0.5, 0.5,
-4.516691, -4.00771, 2, 1, 1.5, 0.5, 0.5,
-4.516691, -4.00771, 2, 0, 1.5, 0.5, 0.5,
-4.516691, -4.00771, 4, 0, -0.5, 0.5, 0.5,
-4.516691, -4.00771, 4, 1, -0.5, 0.5, 0.5,
-4.516691, -4.00771, 4, 1, 1.5, 0.5, 0.5,
-4.516691, -4.00771, 4, 0, 1.5, 0.5, 0.5
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
-4.007618, -3.509236, -5.287887,
-4.007618, 3.137069, -5.287887,
-4.007618, -3.509236, 5.601355,
-4.007618, 3.137069, 5.601355,
-4.007618, -3.509236, -5.287887,
-4.007618, -3.509236, 5.601355,
-4.007618, 3.137069, -5.287887,
-4.007618, 3.137069, 5.601355,
-4.007618, -3.509236, -5.287887,
2.780026, -3.509236, -5.287887,
-4.007618, -3.509236, 5.601355,
2.780026, -3.509236, 5.601355,
-4.007618, 3.137069, -5.287887,
2.780026, 3.137069, -5.287887,
-4.007618, 3.137069, 5.601355,
2.780026, 3.137069, 5.601355,
2.780026, -3.509236, -5.287887,
2.780026, 3.137069, -5.287887,
2.780026, -3.509236, 5.601355,
2.780026, 3.137069, 5.601355,
2.780026, -3.509236, -5.287887,
2.780026, -3.509236, 5.601355,
2.780026, 3.137069, -5.287887,
2.780026, 3.137069, 5.601355
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
var radius = 7.716362;
var distance = 34.33097;
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
mvMatrix.translate( 0.6137961, 0.1860839, -0.1567342 );
mvMatrix.scale( 1.229157, 1.255296, 0.7661766 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.33097);
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
bentazone<-read.table("bentazone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bentazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'bentazone' not found
```

```r
y<-bentazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'bentazone' not found
```

```r
z<-bentazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'bentazone' not found
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
-3.908769, -1.0611, -0.006823511, 0, 0, 1, 1, 1,
-3.225885, 0.1240123, -1.348596, 1, 0, 0, 1, 1,
-3.137024, 0.146269, -1.627373, 1, 0, 0, 1, 1,
-3.129253, -0.2616446, -0.8149971, 1, 0, 0, 1, 1,
-3.055409, -0.5074679, -3.382376, 1, 0, 0, 1, 1,
-2.986901, -1.274776, -1.441293, 1, 0, 0, 1, 1,
-2.843836, 0.01104079, -2.860984, 0, 0, 0, 1, 1,
-2.641381, -0.3861108, -2.726826, 0, 0, 0, 1, 1,
-2.635663, 0.4458057, -1.385466, 0, 0, 0, 1, 1,
-2.555856, -1.496356, -1.055491, 0, 0, 0, 1, 1,
-2.521844, -0.431365, -1.610045, 0, 0, 0, 1, 1,
-2.492549, -0.4547837, -0.6570329, 0, 0, 0, 1, 1,
-2.482635, -0.7363698, -2.492186, 0, 0, 0, 1, 1,
-2.465876, -0.1211371, -3.179886, 1, 1, 1, 1, 1,
-2.42276, -1.650425, -1.598314, 1, 1, 1, 1, 1,
-2.418585, 1.085758, 0.84323, 1, 1, 1, 1, 1,
-2.324967, -1.088824, -0.9832309, 1, 1, 1, 1, 1,
-2.27131, -0.781679, -2.040917, 1, 1, 1, 1, 1,
-2.204546, -0.9271239, -2.408793, 1, 1, 1, 1, 1,
-2.200094, 0.2581035, 0.5528941, 1, 1, 1, 1, 1,
-2.17361, -0.9260666, -2.246717, 1, 1, 1, 1, 1,
-2.150838, -2.428664, -2.314818, 1, 1, 1, 1, 1,
-2.14063, 0.1751674, -2.897984, 1, 1, 1, 1, 1,
-2.11816, -0.5824414, -2.917349, 1, 1, 1, 1, 1,
-2.107028, 0.8093966, -1.554544, 1, 1, 1, 1, 1,
-2.086808, 0.9479663, -0.2459357, 1, 1, 1, 1, 1,
-2.0506, -0.8578256, -0.3528198, 1, 1, 1, 1, 1,
-2.035383, -0.2491297, -1.206161, 1, 1, 1, 1, 1,
-2.033134, -0.4515243, -1.948971, 0, 0, 1, 1, 1,
-2.012694, -0.5067345, -0.5349081, 1, 0, 0, 1, 1,
-1.992959, 0.1612573, -3.276406, 1, 0, 0, 1, 1,
-1.977637, -0.4082869, -0.5435147, 1, 0, 0, 1, 1,
-1.977483, -1.554427, -3.596884, 1, 0, 0, 1, 1,
-1.966323, -0.5584587, -1.628529, 1, 0, 0, 1, 1,
-1.948436, 0.9876051, -1.263302, 0, 0, 0, 1, 1,
-1.938301, -0.5895306, -3.093454, 0, 0, 0, 1, 1,
-1.927677, -0.555244, -2.792394, 0, 0, 0, 1, 1,
-1.923268, 2.182328, -0.6962293, 0, 0, 0, 1, 1,
-1.919805, -0.588856, -1.576969, 0, 0, 0, 1, 1,
-1.909174, -0.9029754, -1.665433, 0, 0, 0, 1, 1,
-1.892587, -0.5403, -0.9997247, 0, 0, 0, 1, 1,
-1.864459, 0.6953288, -0.5992597, 1, 1, 1, 1, 1,
-1.833691, 0.2871874, -2.448941, 1, 1, 1, 1, 1,
-1.805407, 0.3851817, -1.253082, 1, 1, 1, 1, 1,
-1.804135, -1.23024, -1.559475, 1, 1, 1, 1, 1,
-1.798806, -0.9352164, -2.715185, 1, 1, 1, 1, 1,
-1.777351, -0.4129909, -0.7847547, 1, 1, 1, 1, 1,
-1.761433, 0.2764847, -1.597909, 1, 1, 1, 1, 1,
-1.759732, 0.8246381, -0.5498613, 1, 1, 1, 1, 1,
-1.746194, -1.373223, -1.313983, 1, 1, 1, 1, 1,
-1.727075, 0.192179, -2.160168, 1, 1, 1, 1, 1,
-1.716189, -1.287131, -2.162343, 1, 1, 1, 1, 1,
-1.683543, 0.3172077, -1.328636, 1, 1, 1, 1, 1,
-1.681972, 1.534936, -0.7267209, 1, 1, 1, 1, 1,
-1.675882, -1.325379, -2.365371, 1, 1, 1, 1, 1,
-1.668583, 0.3671314, -1.385503, 1, 1, 1, 1, 1,
-1.664871, 0.3738756, -0.03313485, 0, 0, 1, 1, 1,
-1.660298, 0.04810207, -0.7838029, 1, 0, 0, 1, 1,
-1.647272, -0.570821, -2.72626, 1, 0, 0, 1, 1,
-1.644906, -3.186454, -2.921118, 1, 0, 0, 1, 1,
-1.64331, 0.155884, -1.704271, 1, 0, 0, 1, 1,
-1.642078, -0.841059, -0.9825967, 1, 0, 0, 1, 1,
-1.638732, -0.3059096, -2.688553, 0, 0, 0, 1, 1,
-1.625898, -0.08932368, -0.04448809, 0, 0, 0, 1, 1,
-1.595045, 0.7658633, -0.6914375, 0, 0, 0, 1, 1,
-1.581468, -0.5256733, -2.772079, 0, 0, 0, 1, 1,
-1.579659, -0.1922199, -2.03027, 0, 0, 0, 1, 1,
-1.565602, 1.194751, -0.4458335, 0, 0, 0, 1, 1,
-1.562181, 1.69504, 1.109681, 0, 0, 0, 1, 1,
-1.556516, 2.145118, -0.08692554, 1, 1, 1, 1, 1,
-1.549654, 1.076237, -1.179728, 1, 1, 1, 1, 1,
-1.542588, 0.9855947, -1.679142, 1, 1, 1, 1, 1,
-1.527174, 0.05692767, -2.560878, 1, 1, 1, 1, 1,
-1.524151, 0.3863585, 0.05139213, 1, 1, 1, 1, 1,
-1.523191, -0.9151424, -3.070092, 1, 1, 1, 1, 1,
-1.518718, -1.729496, -1.766358, 1, 1, 1, 1, 1,
-1.513843, -0.1795841, -1.274503, 1, 1, 1, 1, 1,
-1.505172, -0.2041371, -1.888112, 1, 1, 1, 1, 1,
-1.500321, 0.6212606, -1.482191, 1, 1, 1, 1, 1,
-1.499691, -0.8968756, -1.36037, 1, 1, 1, 1, 1,
-1.494119, -1.203185, -2.935046, 1, 1, 1, 1, 1,
-1.4927, -0.02450774, -2.972854, 1, 1, 1, 1, 1,
-1.473317, -0.2828911, -1.463635, 1, 1, 1, 1, 1,
-1.472365, 0.4166783, 0.505608, 1, 1, 1, 1, 1,
-1.467349, 0.8724395, -2.028716, 0, 0, 1, 1, 1,
-1.457776, -0.5702828, -1.960262, 1, 0, 0, 1, 1,
-1.450921, -1.267974, -0.9055405, 1, 0, 0, 1, 1,
-1.437607, -0.9234256, -3.588889, 1, 0, 0, 1, 1,
-1.431354, -1.734064, -0.8937314, 1, 0, 0, 1, 1,
-1.431147, 1.046503, -0.4830311, 1, 0, 0, 1, 1,
-1.421507, -2.161613, -1.954754, 0, 0, 0, 1, 1,
-1.421233, -0.01588272, -0.5922714, 0, 0, 0, 1, 1,
-1.414417, 1.233613, -2.731576, 0, 0, 0, 1, 1,
-1.413741, 1.359054, -0.7711624, 0, 0, 0, 1, 1,
-1.410092, -0.9559274, -0.7986192, 0, 0, 0, 1, 1,
-1.389995, -0.3733992, -0.3827106, 0, 0, 0, 1, 1,
-1.383337, -0.1952812, -2.087061, 0, 0, 0, 1, 1,
-1.382254, -0.5331048, -3.96881, 1, 1, 1, 1, 1,
-1.380224, -0.5190801, -0.9407259, 1, 1, 1, 1, 1,
-1.372971, 1.918706, -0.27771, 1, 1, 1, 1, 1,
-1.367191, -1.172715, -4.863749, 1, 1, 1, 1, 1,
-1.357836, -0.116757, -4.221792, 1, 1, 1, 1, 1,
-1.355491, -0.6331725, -1.851305, 1, 1, 1, 1, 1,
-1.349543, -1.236428, -1.668129, 1, 1, 1, 1, 1,
-1.346647, -1.439178, -1.881531, 1, 1, 1, 1, 1,
-1.340967, -1.598776, -2.332405, 1, 1, 1, 1, 1,
-1.338811, 1.282947, -0.6791015, 1, 1, 1, 1, 1,
-1.336947, 2.191493, 0.8226631, 1, 1, 1, 1, 1,
-1.330192, -0.1066011, -2.729042, 1, 1, 1, 1, 1,
-1.328496, -0.6631793, -1.872351, 1, 1, 1, 1, 1,
-1.317659, -0.6212837, -1.123781, 1, 1, 1, 1, 1,
-1.31538, -1.320189, -2.221576, 1, 1, 1, 1, 1,
-1.309246, 0.2865101, -0.605269, 0, 0, 1, 1, 1,
-1.296644, 0.6854286, -2.179917, 1, 0, 0, 1, 1,
-1.285412, 1.600528, -0.4727525, 1, 0, 0, 1, 1,
-1.282999, -1.044913, -2.462882, 1, 0, 0, 1, 1,
-1.282598, 0.07411726, -0.9618586, 1, 0, 0, 1, 1,
-1.27773, 2.17012, -1.055813, 1, 0, 0, 1, 1,
-1.265985, -0.02410119, -2.930917, 0, 0, 0, 1, 1,
-1.265461, 0.479508, -1.408386, 0, 0, 0, 1, 1,
-1.257541, -0.4148674, -0.8685893, 0, 0, 0, 1, 1,
-1.25237, 0.2912886, -1.077441, 0, 0, 0, 1, 1,
-1.250014, 0.7263629, -1.84229, 0, 0, 0, 1, 1,
-1.24121, 1.354467, 0.02598237, 0, 0, 0, 1, 1,
-1.223898, -0.2097532, -2.122614, 0, 0, 0, 1, 1,
-1.21365, 0.6526613, -2.135256, 1, 1, 1, 1, 1,
-1.200835, -0.768925, -1.26786, 1, 1, 1, 1, 1,
-1.199559, -1.170914, -1.871682, 1, 1, 1, 1, 1,
-1.195092, -0.2118764, -3.771054, 1, 1, 1, 1, 1,
-1.179021, -0.4942527, -1.000974, 1, 1, 1, 1, 1,
-1.178045, -0.164339, -2.571629, 1, 1, 1, 1, 1,
-1.173733, 0.8724487, -0.2661584, 1, 1, 1, 1, 1,
-1.158393, 1.013514, 0.5601468, 1, 1, 1, 1, 1,
-1.139688, -2.754653, -1.838226, 1, 1, 1, 1, 1,
-1.125648, -1.074141, -3.992877, 1, 1, 1, 1, 1,
-1.124678, 2.174032, -2.395066, 1, 1, 1, 1, 1,
-1.118312, 0.06509453, -1.942871, 1, 1, 1, 1, 1,
-1.105706, 1.159991, -1.470544, 1, 1, 1, 1, 1,
-1.104222, -0.7269607, -1.87951, 1, 1, 1, 1, 1,
-1.099278, -0.133944, -2.01144, 1, 1, 1, 1, 1,
-1.099021, -0.6146115, -2.827903, 0, 0, 1, 1, 1,
-1.097277, 1.063368, -2.629712, 1, 0, 0, 1, 1,
-1.092151, -0.5316258, 0.7994582, 1, 0, 0, 1, 1,
-1.090033, 0.6728631, 0.2041123, 1, 0, 0, 1, 1,
-1.088977, 0.424346, -1.036744, 1, 0, 0, 1, 1,
-1.086534, -0.139653, -3.239412, 1, 0, 0, 1, 1,
-1.085299, -1.462395, -3.979872, 0, 0, 0, 1, 1,
-1.077218, -0.7885142, -1.841904, 0, 0, 0, 1, 1,
-1.070099, 0.6030896, -1.463727, 0, 0, 0, 1, 1,
-1.067931, -0.02451267, -0.06098261, 0, 0, 0, 1, 1,
-1.049387, 0.3299208, -0.7914019, 0, 0, 0, 1, 1,
-1.047962, 0.4837629, -0.856281, 0, 0, 0, 1, 1,
-1.042487, -0.8156067, -1.791807, 0, 0, 0, 1, 1,
-1.038577, -0.1309264, -1.920248, 1, 1, 1, 1, 1,
-1.035532, -1.055858, -2.134603, 1, 1, 1, 1, 1,
-1.031061, 0.1888522, -0.3638262, 1, 1, 1, 1, 1,
-1.027735, -0.4552359, -3.109932, 1, 1, 1, 1, 1,
-1.027478, -0.9632012, -2.643094, 1, 1, 1, 1, 1,
-1.020943, 1.298831, -2.096666, 1, 1, 1, 1, 1,
-1.020157, -0.2651, -2.122714, 1, 1, 1, 1, 1,
-1.014407, -1.661635, -2.947894, 1, 1, 1, 1, 1,
-1.014315, -0.346729, -2.777039, 1, 1, 1, 1, 1,
-1.013039, -0.3434733, -1.42179, 1, 1, 1, 1, 1,
-1.003253, -1.675517, -2.870801, 1, 1, 1, 1, 1,
-1.000285, 0.06427447, -3.921739, 1, 1, 1, 1, 1,
-0.9996502, 0.9621673, 1.564318, 1, 1, 1, 1, 1,
-0.9976427, 0.7030716, -1.811541, 1, 1, 1, 1, 1,
-0.9937403, -1.973939, -3.297873, 1, 1, 1, 1, 1,
-0.9925813, 1.444109, -1.171612, 0, 0, 1, 1, 1,
-0.9918888, 1.531693, 0.06952883, 1, 0, 0, 1, 1,
-0.9809237, 1.063083, -1.195738, 1, 0, 0, 1, 1,
-0.9673264, -0.09805815, -1.166852, 1, 0, 0, 1, 1,
-0.9672368, -0.2470737, -0.02409673, 1, 0, 0, 1, 1,
-0.9638669, -0.477439, -1.232413, 1, 0, 0, 1, 1,
-0.9549185, -0.04310225, -3.507719, 0, 0, 0, 1, 1,
-0.9509164, -1.444525, -2.505383, 0, 0, 0, 1, 1,
-0.9455836, 1.767499, -1.477898, 0, 0, 0, 1, 1,
-0.9415722, 0.3549201, -0.9354334, 0, 0, 0, 1, 1,
-0.9374859, 0.8318347, -1.552161, 0, 0, 0, 1, 1,
-0.9283981, 0.1678151, -1.780701, 0, 0, 0, 1, 1,
-0.9208068, -0.3663976, -2.349389, 0, 0, 0, 1, 1,
-0.9169524, 0.03146712, -1.889347, 1, 1, 1, 1, 1,
-0.9162931, 1.014684, -1.874427, 1, 1, 1, 1, 1,
-0.9018854, -0.7084964, -2.63842, 1, 1, 1, 1, 1,
-0.9007322, -0.6468219, -0.4041244, 1, 1, 1, 1, 1,
-0.9001895, -2.882103, -5.05991, 1, 1, 1, 1, 1,
-0.8976821, 1.270339, -0.3556391, 1, 1, 1, 1, 1,
-0.8952554, -0.54136, -0.4502963, 1, 1, 1, 1, 1,
-0.8886826, -1.361222, -2.681246, 1, 1, 1, 1, 1,
-0.8860578, 1.04296, -0.3006324, 1, 1, 1, 1, 1,
-0.8833736, -1.186151, -1.834459, 1, 1, 1, 1, 1,
-0.8828417, -0.7860277, -4.487495, 1, 1, 1, 1, 1,
-0.8779764, 0.7356769, -1.381502, 1, 1, 1, 1, 1,
-0.8773219, 0.03635794, -1.887165, 1, 1, 1, 1, 1,
-0.8501225, 0.5977007, -1.949269, 1, 1, 1, 1, 1,
-0.8498175, 0.7170873, -0.4239002, 1, 1, 1, 1, 1,
-0.8478972, 0.2529302, -1.717038, 0, 0, 1, 1, 1,
-0.8379691, -0.3244329, -2.494939, 1, 0, 0, 1, 1,
-0.8298312, -1.349708, -3.650298, 1, 0, 0, 1, 1,
-0.8206843, -2.180748, -3.118167, 1, 0, 0, 1, 1,
-0.8103032, 1.174218, -0.1141035, 1, 0, 0, 1, 1,
-0.8067045, 0.03274596, -4.160314, 1, 0, 0, 1, 1,
-0.8003959, -0.2862312, -0.9979448, 0, 0, 0, 1, 1,
-0.7994615, -1.567105, -3.230829, 0, 0, 0, 1, 1,
-0.7964525, 0.7128195, 0.4603061, 0, 0, 0, 1, 1,
-0.7942022, 1.277329, -1.760868, 0, 0, 0, 1, 1,
-0.7936823, 3.040278, -1.113631, 0, 0, 0, 1, 1,
-0.7837768, -2.084023, -3.709322, 0, 0, 0, 1, 1,
-0.775014, -3.412446, -2.77588, 0, 0, 0, 1, 1,
-0.7655439, 0.7108431, -2.252298, 1, 1, 1, 1, 1,
-0.7654172, 1.069024, -0.8368648, 1, 1, 1, 1, 1,
-0.7604689, 0.6011335, -2.02725, 1, 1, 1, 1, 1,
-0.7590613, -1.210884, -0.9873432, 1, 1, 1, 1, 1,
-0.7590276, -0.1110624, -1.238936, 1, 1, 1, 1, 1,
-0.7582746, -0.5463769, -2.066347, 1, 1, 1, 1, 1,
-0.7547419, -1.256954, -4.617243, 1, 1, 1, 1, 1,
-0.7528254, -0.4815127, -1.152698, 1, 1, 1, 1, 1,
-0.7527359, -0.05194106, -1.269048, 1, 1, 1, 1, 1,
-0.7495916, 0.7184426, -1.360341, 1, 1, 1, 1, 1,
-0.7487809, -0.3349543, -1.771895, 1, 1, 1, 1, 1,
-0.7461384, 1.984109, 0.2577538, 1, 1, 1, 1, 1,
-0.745304, -1.473295, -3.463186, 1, 1, 1, 1, 1,
-0.7390379, -2.006381, -2.732668, 1, 1, 1, 1, 1,
-0.7359168, -0.7111801, -4.136866, 1, 1, 1, 1, 1,
-0.7358989, 2.325923, 0.7740308, 0, 0, 1, 1, 1,
-0.7335299, -0.4449965, -1.103696, 1, 0, 0, 1, 1,
-0.722789, 0.6613188, -1.178103, 1, 0, 0, 1, 1,
-0.7218009, -1.310683, -1.812981, 1, 0, 0, 1, 1,
-0.7175474, -0.5772083, -4.57892, 1, 0, 0, 1, 1,
-0.7173671, 0.04111682, 0.4085226, 1, 0, 0, 1, 1,
-0.7150726, -0.3926157, -3.284079, 0, 0, 0, 1, 1,
-0.7101601, 1.105217, -0.1794125, 0, 0, 0, 1, 1,
-0.7070346, 1.111909, 0.7607365, 0, 0, 0, 1, 1,
-0.7017328, -0.762681, -3.636598, 0, 0, 0, 1, 1,
-0.6984212, 1.695137, 0.1782443, 0, 0, 0, 1, 1,
-0.696409, -0.3546943, -1.163646, 0, 0, 0, 1, 1,
-0.6935341, 0.6212065, -1.728999, 0, 0, 0, 1, 1,
-0.6924087, 0.8510231, -0.864711, 1, 1, 1, 1, 1,
-0.692238, 1.10089, -0.01568305, 1, 1, 1, 1, 1,
-0.6788657, -0.6694169, -2.432548, 1, 1, 1, 1, 1,
-0.6787139, 2.028404, 0.6527884, 1, 1, 1, 1, 1,
-0.6782875, -0.4395194, -1.526795, 1, 1, 1, 1, 1,
-0.6782065, -0.3818253, -1.459548, 1, 1, 1, 1, 1,
-0.6740024, -0.4941742, -2.319524, 1, 1, 1, 1, 1,
-0.6714666, 1.33063, 0.1342401, 1, 1, 1, 1, 1,
-0.6695636, 0.03232403, -2.900916, 1, 1, 1, 1, 1,
-0.6675728, 0.4421414, -1.588888, 1, 1, 1, 1, 1,
-0.6618117, -1.427744, -1.49533, 1, 1, 1, 1, 1,
-0.6605351, -1.896174, -2.536185, 1, 1, 1, 1, 1,
-0.6604944, -0.01811456, -2.690676, 1, 1, 1, 1, 1,
-0.6585982, -0.5650893, -3.020592, 1, 1, 1, 1, 1,
-0.6584864, 0.740001, -1.7523, 1, 1, 1, 1, 1,
-0.6567979, -0.2549123, -0.9662594, 0, 0, 1, 1, 1,
-0.6520922, -0.513101, -2.747316, 1, 0, 0, 1, 1,
-0.6518843, -1.043399, -2.768498, 1, 0, 0, 1, 1,
-0.6488646, -1.148723, -3.053228, 1, 0, 0, 1, 1,
-0.6428445, -0.4292095, -1.571942, 1, 0, 0, 1, 1,
-0.6401421, 0.8655699, 0.4873568, 1, 0, 0, 1, 1,
-0.6350001, -0.5952141, -1.510409, 0, 0, 0, 1, 1,
-0.6339233, 0.7314867, -0.7833301, 0, 0, 0, 1, 1,
-0.6336337, 0.7714034, -0.5341555, 0, 0, 0, 1, 1,
-0.633058, -1.594916, -2.796773, 0, 0, 0, 1, 1,
-0.6328402, 2.078089, -0.6898178, 0, 0, 0, 1, 1,
-0.6278985, 1.107977, -1.649031, 0, 0, 0, 1, 1,
-0.6252673, -0.5568961, -1.225185, 0, 0, 0, 1, 1,
-0.6246747, 0.4758628, 0.3168236, 1, 1, 1, 1, 1,
-0.6238706, -1.783112, -2.62816, 1, 1, 1, 1, 1,
-0.6208345, -0.9057036, -4.637719, 1, 1, 1, 1, 1,
-0.6182216, 0.615918, -0.3923842, 1, 1, 1, 1, 1,
-0.6118454, -0.4083995, -2.047712, 1, 1, 1, 1, 1,
-0.6104375, 0.04170665, -1.16945, 1, 1, 1, 1, 1,
-0.6095558, 0.696713, -1.869034, 1, 1, 1, 1, 1,
-0.6080591, 0.514097, -0.05687709, 1, 1, 1, 1, 1,
-0.6038458, 1.474198, -0.7123721, 1, 1, 1, 1, 1,
-0.5976723, -0.6497373, -3.051434, 1, 1, 1, 1, 1,
-0.5975683, 1.301156, -2.219829, 1, 1, 1, 1, 1,
-0.5930681, -0.9662427, -2.377506, 1, 1, 1, 1, 1,
-0.5926812, 0.3088849, -2.371522, 1, 1, 1, 1, 1,
-0.5923946, 0.4407172, -1.386427, 1, 1, 1, 1, 1,
-0.5909712, 0.9098486, -0.9530808, 1, 1, 1, 1, 1,
-0.5863028, 2.472254, -0.8975804, 0, 0, 1, 1, 1,
-0.5853751, -1.115809, -2.723102, 1, 0, 0, 1, 1,
-0.5841169, 0.3675964, -1.182977, 1, 0, 0, 1, 1,
-0.5790223, -0.02667321, -0.950343, 1, 0, 0, 1, 1,
-0.5779889, 1.092993, -0.2071825, 1, 0, 0, 1, 1,
-0.5773388, 1.102143, -0.9896235, 1, 0, 0, 1, 1,
-0.5705399, 2.131099, -1.571003, 0, 0, 0, 1, 1,
-0.5647833, -0.5820699, -0.8856834, 0, 0, 0, 1, 1,
-0.5640211, 0.7711526, -1.591911, 0, 0, 0, 1, 1,
-0.5639247, -0.4541313, -2.272045, 0, 0, 0, 1, 1,
-0.562564, -0.1142773, -1.016922, 0, 0, 0, 1, 1,
-0.5622665, 0.3275845, -0.9756299, 0, 0, 0, 1, 1,
-0.5607244, 0.6990129, -0.867266, 0, 0, 0, 1, 1,
-0.5577554, -0.4294202, 0.06265247, 1, 1, 1, 1, 1,
-0.5561337, 0.6696386, -1.446489, 1, 1, 1, 1, 1,
-0.5553599, -0.249716, -0.8186993, 1, 1, 1, 1, 1,
-0.5454251, 0.09278286, -0.5760463, 1, 1, 1, 1, 1,
-0.5393918, -0.09217206, -1.090017, 1, 1, 1, 1, 1,
-0.5361822, -0.245215, -4.831699, 1, 1, 1, 1, 1,
-0.5340431, 0.5976133, -0.6532004, 1, 1, 1, 1, 1,
-0.5304586, -1.068804, -2.7005, 1, 1, 1, 1, 1,
-0.5269365, -0.9132376, -1.871958, 1, 1, 1, 1, 1,
-0.5252483, 0.1329275, -1.227704, 1, 1, 1, 1, 1,
-0.5241652, -0.5373398, 0.04816136, 1, 1, 1, 1, 1,
-0.523536, -1.255887, -2.56424, 1, 1, 1, 1, 1,
-0.5183487, 0.9601652, -0.8240134, 1, 1, 1, 1, 1,
-0.5149158, 0.09312279, -0.4366728, 1, 1, 1, 1, 1,
-0.5137852, 1.492056, 0.879568, 1, 1, 1, 1, 1,
-0.5120133, -0.9029994, -1.755301, 0, 0, 1, 1, 1,
-0.5076792, -0.1127455, -2.956357, 1, 0, 0, 1, 1,
-0.5068728, -1.174483, -1.854786, 1, 0, 0, 1, 1,
-0.5067701, -1.177936, -0.9140217, 1, 0, 0, 1, 1,
-0.501574, -0.651031, -1.029734, 1, 0, 0, 1, 1,
-0.4989741, 0.6330048, -1.992038, 1, 0, 0, 1, 1,
-0.4975185, 0.2225118, -1.142629, 0, 0, 0, 1, 1,
-0.4942815, 0.2112572, 0.6242692, 0, 0, 0, 1, 1,
-0.4895877, 0.3203936, -1.846489, 0, 0, 0, 1, 1,
-0.4845763, 1.409069, -0.8311291, 0, 0, 0, 1, 1,
-0.4834577, -1.662447, -5.129305, 0, 0, 0, 1, 1,
-0.4834104, -1.875919, -1.755093, 0, 0, 0, 1, 1,
-0.4824431, -0.8605465, -3.305964, 0, 0, 0, 1, 1,
-0.480364, -0.7089499, -2.436852, 1, 1, 1, 1, 1,
-0.4666894, 0.2309983, 0.375441, 1, 1, 1, 1, 1,
-0.4649938, 1.868836, -0.238186, 1, 1, 1, 1, 1,
-0.4642376, -1.264301, -3.950791, 1, 1, 1, 1, 1,
-0.4598041, -0.3967148, -1.859621, 1, 1, 1, 1, 1,
-0.4592377, -0.9703514, -2.79099, 1, 1, 1, 1, 1,
-0.4590661, -0.2120356, -2.560159, 1, 1, 1, 1, 1,
-0.4516063, 0.5578539, -0.5767697, 1, 1, 1, 1, 1,
-0.4504972, 0.2218003, -2.498174, 1, 1, 1, 1, 1,
-0.4436662, -1.000292, -3.341817, 1, 1, 1, 1, 1,
-0.4389818, -0.4993428, -2.837431, 1, 1, 1, 1, 1,
-0.438438, -0.7704589, -2.337888, 1, 1, 1, 1, 1,
-0.4333225, -1.141899, -3.773607, 1, 1, 1, 1, 1,
-0.4302104, 1.331344, -0.2863453, 1, 1, 1, 1, 1,
-0.4281791, -0.3795449, -2.859662, 1, 1, 1, 1, 1,
-0.4259804, -0.2822813, -2.248038, 0, 0, 1, 1, 1,
-0.4246203, 2.598033, -0.7734017, 1, 0, 0, 1, 1,
-0.4172066, 0.868593, -0.08964942, 1, 0, 0, 1, 1,
-0.4154646, 1.117717, -1.84445, 1, 0, 0, 1, 1,
-0.4101144, -0.9402401, -2.709569, 1, 0, 0, 1, 1,
-0.4099251, -1.449072, -2.952544, 1, 0, 0, 1, 1,
-0.4065782, 0.1480899, 0.3315801, 0, 0, 0, 1, 1,
-0.4024579, 0.8898792, -0.3527384, 0, 0, 0, 1, 1,
-0.398309, -0.1233554, -0.8588168, 0, 0, 0, 1, 1,
-0.3974646, -0.09746882, -3.017626, 0, 0, 0, 1, 1,
-0.3966105, -0.3160756, -1.460848, 0, 0, 0, 1, 1,
-0.3960766, -1.485291, -4.334818, 0, 0, 0, 1, 1,
-0.3925743, 1.372827, 0.7050676, 0, 0, 0, 1, 1,
-0.3901805, -0.2617414, -1.78069, 1, 1, 1, 1, 1,
-0.3866489, 0.3015865, 0.6248516, 1, 1, 1, 1, 1,
-0.3844193, -1.738626, -2.758535, 1, 1, 1, 1, 1,
-0.3815319, 0.2246199, -0.4677183, 1, 1, 1, 1, 1,
-0.3795706, -1.767498, -2.803464, 1, 1, 1, 1, 1,
-0.3783912, 1.523824, 2.18122, 1, 1, 1, 1, 1,
-0.3783863, -1.553753, -3.190267, 1, 1, 1, 1, 1,
-0.3702018, -0.3822073, -3.68071, 1, 1, 1, 1, 1,
-0.3679929, -1.463002, -1.558857, 1, 1, 1, 1, 1,
-0.3638641, 0.9735102, -0.06826027, 1, 1, 1, 1, 1,
-0.361999, -0.168496, -2.011926, 1, 1, 1, 1, 1,
-0.3619113, -0.08084196, -1.359338, 1, 1, 1, 1, 1,
-0.3611894, -1.192485, -3.767873, 1, 1, 1, 1, 1,
-0.3602844, 1.746024, 0.07927957, 1, 1, 1, 1, 1,
-0.3599584, 0.3408173, -0.7848348, 1, 1, 1, 1, 1,
-0.3582329, 0.3190738, -2.01017, 0, 0, 1, 1, 1,
-0.3567889, -1.546528, -0.9515401, 1, 0, 0, 1, 1,
-0.3536029, -1.336289, -2.866519, 1, 0, 0, 1, 1,
-0.3520462, 2.248102, 0.4246528, 1, 0, 0, 1, 1,
-0.3518263, -0.7673375, -3.564703, 1, 0, 0, 1, 1,
-0.3506568, 0.6084979, -1.295146, 1, 0, 0, 1, 1,
-0.3505282, 1.144814, 0.673692, 0, 0, 0, 1, 1,
-0.349535, 0.3251346, -0.716441, 0, 0, 0, 1, 1,
-0.3482747, -1.122543, -2.275865, 0, 0, 0, 1, 1,
-0.3426512, -0.6939935, -2.798036, 0, 0, 0, 1, 1,
-0.3397132, -1.191911, -2.62726, 0, 0, 0, 1, 1,
-0.3380738, 2.352456, -1.324249, 0, 0, 0, 1, 1,
-0.3307588, 0.7298605, -1.012845, 0, 0, 0, 1, 1,
-0.3293622, 0.0530102, -2.331869, 1, 1, 1, 1, 1,
-0.3272187, 0.153821, -2.344255, 1, 1, 1, 1, 1,
-0.3223301, 0.03396887, 0.06495836, 1, 1, 1, 1, 1,
-0.3176365, -0.2132827, -1.899576, 1, 1, 1, 1, 1,
-0.3175285, -0.4683641, -3.052907, 1, 1, 1, 1, 1,
-0.3163383, -0.05888653, -1.626546, 1, 1, 1, 1, 1,
-0.3095558, -0.5381027, -2.28594, 1, 1, 1, 1, 1,
-0.3088533, 0.2444258, -0.9986404, 1, 1, 1, 1, 1,
-0.307993, -0.393026, -2.980824, 1, 1, 1, 1, 1,
-0.3044483, -1.881882, -2.156249, 1, 1, 1, 1, 1,
-0.2958702, 1.283896, 1.581878, 1, 1, 1, 1, 1,
-0.2930921, -0.0987056, -3.645267, 1, 1, 1, 1, 1,
-0.2875641, 0.7074264, -1.552122, 1, 1, 1, 1, 1,
-0.2833333, 1.369895, -0.886034, 1, 1, 1, 1, 1,
-0.2634266, 0.7384459, 1.709611, 1, 1, 1, 1, 1,
-0.2605396, 0.0972981, -1.268018, 0, 0, 1, 1, 1,
-0.2602783, -0.03926854, -1.686636, 1, 0, 0, 1, 1,
-0.2599293, -0.305621, -1.527792, 1, 0, 0, 1, 1,
-0.255074, -1.60065, -3.623447, 1, 0, 0, 1, 1,
-0.2427305, -0.1975472, -2.620062, 1, 0, 0, 1, 1,
-0.2425057, 1.110077, 0.2614452, 1, 0, 0, 1, 1,
-0.2414173, -0.1306514, -2.897333, 0, 0, 0, 1, 1,
-0.24117, 0.02190941, 0.2315726, 0, 0, 0, 1, 1,
-0.2394565, 0.4141815, -1.401577, 0, 0, 0, 1, 1,
-0.23723, -0.2606824, -2.497027, 0, 0, 0, 1, 1,
-0.2294507, -1.751381, -4.388317, 0, 0, 0, 1, 1,
-0.2246158, -1.829793, -2.692282, 0, 0, 0, 1, 1,
-0.2177814, 2.260632, -0.7732801, 0, 0, 0, 1, 1,
-0.2167278, -1.796877, -2.995351, 1, 1, 1, 1, 1,
-0.21386, -0.7003955, -1.736296, 1, 1, 1, 1, 1,
-0.2108382, 0.2992043, -2.096488, 1, 1, 1, 1, 1,
-0.2106273, -1.441387, -4.392937, 1, 1, 1, 1, 1,
-0.2090409, 0.06928159, -0.01184143, 1, 1, 1, 1, 1,
-0.2074456, 1.64558, -0.4941852, 1, 1, 1, 1, 1,
-0.2027614, -2.335268, -3.31283, 1, 1, 1, 1, 1,
-0.2019913, -0.9289456, -2.968964, 1, 1, 1, 1, 1,
-0.1999656, 0.5487164, -1.133775, 1, 1, 1, 1, 1,
-0.1952698, 0.5000394, -1.353773, 1, 1, 1, 1, 1,
-0.1936441, 1.055285, -0.8194023, 1, 1, 1, 1, 1,
-0.192459, 0.3185261, -1.740579, 1, 1, 1, 1, 1,
-0.18957, -0.06441697, -2.442756, 1, 1, 1, 1, 1,
-0.1895413, -0.6977943, -2.774005, 1, 1, 1, 1, 1,
-0.1856529, -0.6821632, -3.008898, 1, 1, 1, 1, 1,
-0.1853649, 0.1529869, 0.6207862, 0, 0, 1, 1, 1,
-0.1819578, -0.09352362, -2.290868, 1, 0, 0, 1, 1,
-0.1805821, 0.4784405, 1.56405, 1, 0, 0, 1, 1,
-0.1776887, -0.4930263, -2.993631, 1, 0, 0, 1, 1,
-0.1763014, 1.525866, -0.2006988, 1, 0, 0, 1, 1,
-0.1736684, 0.07025871, -2.492289, 1, 0, 0, 1, 1,
-0.1730308, 0.8345169, 0.004464739, 0, 0, 0, 1, 1,
-0.1687842, -0.1366869, -2.018872, 0, 0, 0, 1, 1,
-0.1626265, 0.1781031, 0.1498891, 0, 0, 0, 1, 1,
-0.1611356, 0.2610292, 0.8917468, 0, 0, 0, 1, 1,
-0.1583499, -0.5754038, -3.545781, 0, 0, 0, 1, 1,
-0.1574738, -0.07474305, -0.6842684, 0, 0, 0, 1, 1,
-0.1556974, -0.4293516, -2.57305, 0, 0, 0, 1, 1,
-0.1541157, 0.06594973, -1.409072, 1, 1, 1, 1, 1,
-0.1540618, 0.8426308, 0.2407932, 1, 1, 1, 1, 1,
-0.1524197, 1.801226, 0.5077214, 1, 1, 1, 1, 1,
-0.1506495, 0.2667658, -1.115424, 1, 1, 1, 1, 1,
-0.1473784, -0.2108966, -3.924745, 1, 1, 1, 1, 1,
-0.1468673, -0.4861565, -0.2197197, 1, 1, 1, 1, 1,
-0.1435541, -1.389805, -2.596514, 1, 1, 1, 1, 1,
-0.1434456, -1.202045, -3.661917, 1, 1, 1, 1, 1,
-0.1405989, -1.051238, -4.835244, 1, 1, 1, 1, 1,
-0.1380481, -0.2399919, -1.15072, 1, 1, 1, 1, 1,
-0.1339432, 0.4726092, 0.3185333, 1, 1, 1, 1, 1,
-0.1329991, -0.04085958, -1.29972, 1, 1, 1, 1, 1,
-0.1313846, -0.2055387, -1.587404, 1, 1, 1, 1, 1,
-0.1304499, 0.4876607, -0.9936248, 1, 1, 1, 1, 1,
-0.1297104, -0.891933, -2.52208, 1, 1, 1, 1, 1,
-0.1288846, 0.1115518, -1.920229, 0, 0, 1, 1, 1,
-0.1219783, -0.7488015, -3.665931, 1, 0, 0, 1, 1,
-0.1218344, -0.8020973, -2.93387, 1, 0, 0, 1, 1,
-0.1192198, 0.9153265, -1.561322, 1, 0, 0, 1, 1,
-0.1176947, -0.4788877, -4.47537, 1, 0, 0, 1, 1,
-0.1168851, 1.753481, 0.6006677, 1, 0, 0, 1, 1,
-0.1161393, 0.6374818, -1.355593, 0, 0, 0, 1, 1,
-0.1159883, -1.267372, -3.214567, 0, 0, 0, 1, 1,
-0.1113656, -0.1312993, -2.180077, 0, 0, 0, 1, 1,
-0.1046922, 0.4864051, -0.5778819, 0, 0, 0, 1, 1,
-0.102557, -0.1574315, -3.228339, 0, 0, 0, 1, 1,
-0.1011577, 0.5055857, 0.03159279, 0, 0, 0, 1, 1,
-0.1009759, -2.460387, -1.763241, 0, 0, 0, 1, 1,
-0.100532, 0.3718379, -0.9104372, 1, 1, 1, 1, 1,
-0.09461264, -1.406637, -4.248171, 1, 1, 1, 1, 1,
-0.09272285, -0.3075735, -2.065341, 1, 1, 1, 1, 1,
-0.08607158, 1.735672, 0.2538842, 1, 1, 1, 1, 1,
-0.08500941, 1.878145, 1.697098, 1, 1, 1, 1, 1,
-0.08418075, 0.2065063, -1.440785, 1, 1, 1, 1, 1,
-0.08209255, 1.996427, 0.137545, 1, 1, 1, 1, 1,
-0.07113107, 0.03580657, -0.9012737, 1, 1, 1, 1, 1,
-0.06856944, -1.538402, -3.583031, 1, 1, 1, 1, 1,
-0.0672358, -0.1541997, -3.348042, 1, 1, 1, 1, 1,
-0.06600849, -0.8648683, -1.872801, 1, 1, 1, 1, 1,
-0.06547215, 0.4391206, 0.00753527, 1, 1, 1, 1, 1,
-0.06255659, 0.4915545, -1.527271, 1, 1, 1, 1, 1,
-0.06063649, -0.2224876, -2.519329, 1, 1, 1, 1, 1,
-0.05976524, 0.02808753, -0.3752268, 1, 1, 1, 1, 1,
-0.05736376, 0.5508494, 1.463887, 0, 0, 1, 1, 1,
-0.05599986, 0.5018807, -0.3470736, 1, 0, 0, 1, 1,
-0.05506176, 0.5585629, 0.3410448, 1, 0, 0, 1, 1,
-0.05103528, 1.978166, -1.406879, 1, 0, 0, 1, 1,
-0.04879636, 2.067647, -0.3424502, 1, 0, 0, 1, 1,
-0.04684725, -0.1042691, -1.139739, 1, 0, 0, 1, 1,
-0.04605342, -0.0269843, -2.222588, 0, 0, 0, 1, 1,
-0.04592259, 0.7837419, -0.06972852, 0, 0, 0, 1, 1,
-0.04357462, 0.2613112, 0.2289046, 0, 0, 0, 1, 1,
-0.04357184, -0.3709174, -3.376848, 0, 0, 0, 1, 1,
-0.04273551, 1.329059, -0.1064112, 0, 0, 0, 1, 1,
-0.03963492, 0.6759064, -2.103278, 0, 0, 0, 1, 1,
-0.0385748, -0.1107135, -3.792083, 0, 0, 0, 1, 1,
-0.03830101, 0.03981952, -1.00985, 1, 1, 1, 1, 1,
-0.03338609, -2.361919, -4.99624, 1, 1, 1, 1, 1,
-0.02971141, 0.1136751, -0.2723773, 1, 1, 1, 1, 1,
-0.02942815, -0.2802549, -3.634258, 1, 1, 1, 1, 1,
-0.02872377, 0.4956703, -1.009904, 1, 1, 1, 1, 1,
-0.02798228, -2.885279, -2.990502, 1, 1, 1, 1, 1,
-0.02368396, -0.8289536, -0.3664289, 1, 1, 1, 1, 1,
-0.02207945, -1.059809, -4.179348, 1, 1, 1, 1, 1,
-0.02181231, -0.1891008, -3.308887, 1, 1, 1, 1, 1,
-0.01487844, 1.118632, 0.5618061, 1, 1, 1, 1, 1,
-0.01367187, 0.1271116, 1.424364, 1, 1, 1, 1, 1,
-0.005224368, 0.3989175, -2.639416, 1, 1, 1, 1, 1,
-0.003499428, -1.925567, -4.496701, 1, 1, 1, 1, 1,
-0.0006447196, -0.9603592, -4.42624, 1, 1, 1, 1, 1,
-8.238229e-05, -0.4678382, -2.097271, 1, 1, 1, 1, 1,
0.008187831, -1.327157, 3.65728, 0, 0, 1, 1, 1,
0.00855595, -0.9363021, 3.835621, 1, 0, 0, 1, 1,
0.008629547, 0.0721055, 0.07401807, 1, 0, 0, 1, 1,
0.0123935, 0.3647436, 0.1779904, 1, 0, 0, 1, 1,
0.01357903, 0.5026359, -0.8641601, 1, 0, 0, 1, 1,
0.01576075, -0.7367572, 2.194109, 1, 0, 0, 1, 1,
0.01691251, -2.058141, 3.443641, 0, 0, 0, 1, 1,
0.01754788, 1.099184, 1.160154, 0, 0, 0, 1, 1,
0.01780638, 0.8140479, 0.1448411, 0, 0, 0, 1, 1,
0.02473021, -0.2347475, 3.851827, 0, 0, 0, 1, 1,
0.0250366, -0.6093888, 4.139676, 0, 0, 0, 1, 1,
0.02507641, 0.1360157, 0.6456729, 0, 0, 0, 1, 1,
0.02853074, -1.196593, 2.777098, 0, 0, 0, 1, 1,
0.03475666, 0.1990209, 0.6308476, 1, 1, 1, 1, 1,
0.03562974, -1.905915, 3.578557, 1, 1, 1, 1, 1,
0.03781674, 0.9554624, 1.84639, 1, 1, 1, 1, 1,
0.03878434, 0.08794387, 0.3350762, 1, 1, 1, 1, 1,
0.04164144, 1.589744, 1.831825, 1, 1, 1, 1, 1,
0.04214363, -0.2927635, 2.102912, 1, 1, 1, 1, 1,
0.04681154, -0.5196583, 3.305241, 1, 1, 1, 1, 1,
0.04741512, -0.6277229, 2.828158, 1, 1, 1, 1, 1,
0.0489291, -1.845761, 3.625055, 1, 1, 1, 1, 1,
0.05316073, 0.4976418, 1.250599, 1, 1, 1, 1, 1,
0.05329552, -0.3486013, 1.781267, 1, 1, 1, 1, 1,
0.05412275, 0.8290834, -0.2458782, 1, 1, 1, 1, 1,
0.0576599, 1.624113, 0.3236449, 1, 1, 1, 1, 1,
0.05884703, 0.876794, -0.4484181, 1, 1, 1, 1, 1,
0.06117068, -0.08889993, 1.054346, 1, 1, 1, 1, 1,
0.07256511, -0.7419295, 2.983271, 0, 0, 1, 1, 1,
0.07266989, 0.2636062, 0.1897676, 1, 0, 0, 1, 1,
0.07410096, 0.4063938, -1.940446, 1, 0, 0, 1, 1,
0.07594669, 0.8241848, -1.064368, 1, 0, 0, 1, 1,
0.07963537, 0.4414954, -0.8471676, 1, 0, 0, 1, 1,
0.08047511, -2.146777, 3.14125, 1, 0, 0, 1, 1,
0.0827481, 1.034859, 1.149798, 0, 0, 0, 1, 1,
0.08662589, 1.649201, -0.2526039, 0, 0, 0, 1, 1,
0.0879391, -0.07088102, 2.98408, 0, 0, 0, 1, 1,
0.09054568, 0.008548373, 0.3429395, 0, 0, 0, 1, 1,
0.09481481, -0.9006599, 3.021066, 0, 0, 0, 1, 1,
0.09712791, 0.5491421, -0.01469179, 0, 0, 0, 1, 1,
0.1050308, -0.7912408, 3.091413, 0, 0, 0, 1, 1,
0.1063951, -0.3187251, 3.009946, 1, 1, 1, 1, 1,
0.1071705, 1.19208, -0.2654077, 1, 1, 1, 1, 1,
0.10955, -2.066175, 3.302319, 1, 1, 1, 1, 1,
0.1102987, -0.5650028, 1.868046, 1, 1, 1, 1, 1,
0.1141783, 1.438575, -1.935203, 1, 1, 1, 1, 1,
0.1210493, 0.246584, -0.3156818, 1, 1, 1, 1, 1,
0.1218238, 0.1555461, 1.004007, 1, 1, 1, 1, 1,
0.1218548, -1.700519, 2.703738, 1, 1, 1, 1, 1,
0.1221954, 1.310504, -0.1286541, 1, 1, 1, 1, 1,
0.1243423, 1.179753, 0.2291546, 1, 1, 1, 1, 1,
0.1248522, -0.2029905, 1.538905, 1, 1, 1, 1, 1,
0.1267367, -1.857269, 3.369601, 1, 1, 1, 1, 1,
0.1308212, -0.8428864, 3.496145, 1, 1, 1, 1, 1,
0.1320102, 0.7651386, 1.105695, 1, 1, 1, 1, 1,
0.1380188, -0.05857391, 0.9552568, 1, 1, 1, 1, 1,
0.1408661, -0.2951757, 3.989264, 0, 0, 1, 1, 1,
0.141885, 0.4070835, 0.3417282, 1, 0, 0, 1, 1,
0.142316, -0.1541052, 3.573824, 1, 0, 0, 1, 1,
0.1538248, -1.467787, 2.665052, 1, 0, 0, 1, 1,
0.1564899, -0.1747303, 2.481697, 1, 0, 0, 1, 1,
0.160949, -0.6175329, 4.344107, 1, 0, 0, 1, 1,
0.170492, -0.06104961, 1.713189, 0, 0, 0, 1, 1,
0.1707279, -0.2806943, 2.978706, 0, 0, 0, 1, 1,
0.1729988, -1.368428, 2.390777, 0, 0, 0, 1, 1,
0.1772726, 0.03805842, -0.2992423, 0, 0, 0, 1, 1,
0.1827074, -0.03522404, 1.869733, 0, 0, 0, 1, 1,
0.1878636, 2.138794, -1.402368, 0, 0, 0, 1, 1,
0.1891084, -1.891206, 2.393925, 0, 0, 0, 1, 1,
0.1907046, -0.6956075, 2.823565, 1, 1, 1, 1, 1,
0.1934837, -0.7627464, 2.349206, 1, 1, 1, 1, 1,
0.1957009, -0.3797976, 3.346297, 1, 1, 1, 1, 1,
0.1960353, -1.543718, 4.136327, 1, 1, 1, 1, 1,
0.2001498, -0.2837478, 1.426736, 1, 1, 1, 1, 1,
0.2014727, -0.3191776, 3.496774, 1, 1, 1, 1, 1,
0.2075868, -0.4348074, 0.8407604, 1, 1, 1, 1, 1,
0.2092629, 0.3474005, -0.2454258, 1, 1, 1, 1, 1,
0.2103981, -0.7680998, 4.145636, 1, 1, 1, 1, 1,
0.2105296, 0.8682919, 0.3537086, 1, 1, 1, 1, 1,
0.2114433, -0.1439203, 1.197889, 1, 1, 1, 1, 1,
0.2116373, 0.3017898, 1.558305, 1, 1, 1, 1, 1,
0.2170285, -0.3553347, 3.89014, 1, 1, 1, 1, 1,
0.218607, -1.695702, 2.676171, 1, 1, 1, 1, 1,
0.2192585, 0.08829271, 1.025786, 1, 1, 1, 1, 1,
0.2235676, 0.4206258, 0.3615144, 0, 0, 1, 1, 1,
0.2257797, 1.00044, 0.5750294, 1, 0, 0, 1, 1,
0.2373069, -0.4195042, 0.1851801, 1, 0, 0, 1, 1,
0.2445333, 0.7064485, 0.6011821, 1, 0, 0, 1, 1,
0.2445641, -0.8345227, 4.604912, 1, 0, 0, 1, 1,
0.2458646, -0.7123522, 4.692274, 1, 0, 0, 1, 1,
0.252835, 0.8900747, 1.961015, 0, 0, 0, 1, 1,
0.2536122, 0.9993069, -0.1573762, 0, 0, 0, 1, 1,
0.2547733, -0.1952539, 1.072812, 0, 0, 0, 1, 1,
0.2548473, -0.8601323, 2.669291, 0, 0, 0, 1, 1,
0.2562989, 0.77183, -0.310951, 0, 0, 0, 1, 1,
0.2575013, 0.7450985, 1.423604, 0, 0, 0, 1, 1,
0.2591861, -0.8742221, 3.250094, 0, 0, 0, 1, 1,
0.2654946, -1.67821, 1.665663, 1, 1, 1, 1, 1,
0.2722794, 0.54515, 0.1865965, 1, 1, 1, 1, 1,
0.2746729, -1.972514, 4.303644, 1, 1, 1, 1, 1,
0.2761544, 0.6113402, 1.609231, 1, 1, 1, 1, 1,
0.2778759, -1.407479, 3.458915, 1, 1, 1, 1, 1,
0.2781599, -1.298846, 2.766217, 1, 1, 1, 1, 1,
0.2826979, 0.1170125, 1.207825, 1, 1, 1, 1, 1,
0.285419, -2.110941, 2.837772, 1, 1, 1, 1, 1,
0.2861722, 1.020745, 1.058523, 1, 1, 1, 1, 1,
0.2866434, 1.844901, 0.08335846, 1, 1, 1, 1, 1,
0.2879353, -0.3142589, 2.403415, 1, 1, 1, 1, 1,
0.2907121, -0.3858863, 1.445746, 1, 1, 1, 1, 1,
0.2951774, 0.4100305, 0.3104892, 1, 1, 1, 1, 1,
0.2954701, 0.6936949, 0.4864122, 1, 1, 1, 1, 1,
0.2987688, 0.5743313, 2.626447, 1, 1, 1, 1, 1,
0.3051776, -1.114647, 2.928241, 0, 0, 1, 1, 1,
0.3053208, 2.087993, -0.9855956, 1, 0, 0, 1, 1,
0.3057627, -0.2745829, 2.976809, 1, 0, 0, 1, 1,
0.3089064, 0.9712077, -0.2138236, 1, 0, 0, 1, 1,
0.3100678, 0.09554906, -0.529835, 1, 0, 0, 1, 1,
0.3102913, 0.6514342, 1.116205, 1, 0, 0, 1, 1,
0.3124543, -0.742988, 1.263223, 0, 0, 0, 1, 1,
0.3130197, 0.2207553, 0.7963795, 0, 0, 0, 1, 1,
0.3131127, -0.826538, 3.76479, 0, 0, 0, 1, 1,
0.3232824, 0.1131989, 3.143793, 0, 0, 0, 1, 1,
0.3236941, 0.3653765, 1.501574, 0, 0, 0, 1, 1,
0.3245642, -0.2903756, 1.660005, 0, 0, 0, 1, 1,
0.3264621, 0.9784532, 0.8023369, 0, 0, 0, 1, 1,
0.328986, -2.943208, 2.971663, 1, 1, 1, 1, 1,
0.330237, -1.017894, 3.248282, 1, 1, 1, 1, 1,
0.3306829, -1.537325, 3.704207, 1, 1, 1, 1, 1,
0.3310699, -0.770855, 3.511362, 1, 1, 1, 1, 1,
0.3329528, 1.826125, 0.2464556, 1, 1, 1, 1, 1,
0.3331289, 0.6766689, -0.5578743, 1, 1, 1, 1, 1,
0.3434891, -0.769505, 2.454547, 1, 1, 1, 1, 1,
0.3460235, 2.003481, 1.430962, 1, 1, 1, 1, 1,
0.3470105, 0.6502854, 0.6435836, 1, 1, 1, 1, 1,
0.3605703, -0.1782116, 2.038804, 1, 1, 1, 1, 1,
0.363533, 0.4871494, -0.06086281, 1, 1, 1, 1, 1,
0.3639645, 0.02611748, 1.793631, 1, 1, 1, 1, 1,
0.3651124, 0.4629719, -0.9674676, 1, 1, 1, 1, 1,
0.3655098, -0.160193, 1.726148, 1, 1, 1, 1, 1,
0.3681797, -0.9369714, 3.950399, 1, 1, 1, 1, 1,
0.3685623, -0.103501, 2.396, 0, 0, 1, 1, 1,
0.3691283, -0.06669389, 2.610202, 1, 0, 0, 1, 1,
0.3712262, 0.8998191, 0.9376285, 1, 0, 0, 1, 1,
0.3722655, -0.568216, 2.938067, 1, 0, 0, 1, 1,
0.3731848, 0.2503783, 2.421501, 1, 0, 0, 1, 1,
0.3747986, -0.8303964, 3.079468, 1, 0, 0, 1, 1,
0.3788804, 0.0412291, 2.913716, 0, 0, 0, 1, 1,
0.3808826, 0.8297603, 1.491067, 0, 0, 0, 1, 1,
0.3810423, 0.7030194, 1.476808, 0, 0, 0, 1, 1,
0.3834843, -0.1490933, 1.596852, 0, 0, 0, 1, 1,
0.3847111, -1.04128, 2.636386, 0, 0, 0, 1, 1,
0.3852188, 1.807225, -0.06555855, 0, 0, 0, 1, 1,
0.3858141, -1.153103, 3.391141, 0, 0, 0, 1, 1,
0.390324, -1.083676, 0.319485, 1, 1, 1, 1, 1,
0.3911139, 0.8494469, 1.638597, 1, 1, 1, 1, 1,
0.3945992, -0.238591, 3.480668, 1, 1, 1, 1, 1,
0.3959609, 0.4366636, 2.050948, 1, 1, 1, 1, 1,
0.3967989, 0.2851894, 1.800439, 1, 1, 1, 1, 1,
0.4003402, -1.369243, 2.443821, 1, 1, 1, 1, 1,
0.4005671, 0.9719192, 2.399769, 1, 1, 1, 1, 1,
0.4024822, 1.059571, -0.7473377, 1, 1, 1, 1, 1,
0.4026683, -0.6415888, 2.257005, 1, 1, 1, 1, 1,
0.4027582, 1.506873, -0.2555362, 1, 1, 1, 1, 1,
0.4043548, 1.388028, 0.2702127, 1, 1, 1, 1, 1,
0.4053714, 1.159721, -0.4691451, 1, 1, 1, 1, 1,
0.4063207, 2.382002, 0.5413655, 1, 1, 1, 1, 1,
0.4074755, -0.7641023, 3.468477, 1, 1, 1, 1, 1,
0.4151015, 0.3590078, 0.7148086, 1, 1, 1, 1, 1,
0.4170554, -1.012092, 3.268673, 0, 0, 1, 1, 1,
0.4184919, -0.577659, 4.525012, 1, 0, 0, 1, 1,
0.428046, 0.7463132, 0.4536528, 1, 0, 0, 1, 1,
0.4294936, 0.7862263, 0.7832243, 1, 0, 0, 1, 1,
0.4295429, -0.2753417, 1.637915, 1, 0, 0, 1, 1,
0.4307953, -0.2542137, 3.613307, 1, 0, 0, 1, 1,
0.4310969, -1.166463, 2.750692, 0, 0, 0, 1, 1,
0.4349492, -1.325125, 3.193841, 0, 0, 0, 1, 1,
0.4382465, -1.066983, 1.538238, 0, 0, 0, 1, 1,
0.4393181, 1.07034, 1.503182, 0, 0, 0, 1, 1,
0.4475129, 1.110381, -1.103266, 0, 0, 0, 1, 1,
0.4489591, -0.352952, 3.304047, 0, 0, 0, 1, 1,
0.4530717, 0.2442744, 0.02317508, 0, 0, 0, 1, 1,
0.4573559, 0.526055, 1.488931, 1, 1, 1, 1, 1,
0.4581285, 0.753298, 0.957514, 1, 1, 1, 1, 1,
0.4592211, 1.365218, -0.2031416, 1, 1, 1, 1, 1,
0.463355, 2.196413, -1.738022, 1, 1, 1, 1, 1,
0.4651635, -0.9216039, 3.123455, 1, 1, 1, 1, 1,
0.4661799, 0.7895532, 0.9253161, 1, 1, 1, 1, 1,
0.4670943, -1.540387, 3.375213, 1, 1, 1, 1, 1,
0.4715224, 0.255777, -0.1745857, 1, 1, 1, 1, 1,
0.4722988, -1.878382, 2.363526, 1, 1, 1, 1, 1,
0.4733507, 1.146358, 1.11133, 1, 1, 1, 1, 1,
0.4739273, -1.383606, 1.998334, 1, 1, 1, 1, 1,
0.47879, 0.02930275, 1.480316, 1, 1, 1, 1, 1,
0.4797639, 0.881178, 0.392188, 1, 1, 1, 1, 1,
0.4804717, 1.225792, 1.567402, 1, 1, 1, 1, 1,
0.4866231, 0.2069341, 1.499953, 1, 1, 1, 1, 1,
0.4882282, 0.6073992, 0.9144986, 0, 0, 1, 1, 1,
0.495871, 0.5532703, 0.8506027, 1, 0, 0, 1, 1,
0.4961933, 0.6652089, -0.1647297, 1, 0, 0, 1, 1,
0.5001692, -1.334324, 0.8012509, 1, 0, 0, 1, 1,
0.5006505, -2.404625, 1.780262, 1, 0, 0, 1, 1,
0.5009115, 0.5551705, 1.191299, 1, 0, 0, 1, 1,
0.5026959, 0.525934, -0.5649865, 0, 0, 0, 1, 1,
0.5051048, 0.03393862, 0.2556654, 0, 0, 0, 1, 1,
0.5090437, -0.3837242, 1.2706, 0, 0, 0, 1, 1,
0.5130348, -0.5395662, 2.062504, 0, 0, 0, 1, 1,
0.5157556, 0.8179386, 0.6863399, 0, 0, 0, 1, 1,
0.5230157, 0.6592234, 1.480434, 0, 0, 0, 1, 1,
0.5289154, -0.1638477, 2.161247, 0, 0, 0, 1, 1,
0.5305904, 1.238428, 0.1361809, 1, 1, 1, 1, 1,
0.5306338, 1.375553, 0.6892688, 1, 1, 1, 1, 1,
0.5402988, -0.8709247, 4.05796, 1, 1, 1, 1, 1,
0.5403085, -0.3788177, 1.604993, 1, 1, 1, 1, 1,
0.5403802, 0.7410967, -0.002214005, 1, 1, 1, 1, 1,
0.5417212, 1.004308, -0.1308135, 1, 1, 1, 1, 1,
0.5453565, -0.04800379, 2.358905, 1, 1, 1, 1, 1,
0.5524378, -1.285446, 4.947883, 1, 1, 1, 1, 1,
0.5525196, -0.9826489, 0.944286, 1, 1, 1, 1, 1,
0.5552428, -0.7824152, 2.149965, 1, 1, 1, 1, 1,
0.5584279, 0.1344614, 2.058496, 1, 1, 1, 1, 1,
0.558571, 1.403952, 1.623798, 1, 1, 1, 1, 1,
0.5593435, -0.009671055, -0.4639378, 1, 1, 1, 1, 1,
0.5634152, -0.1152589, 1.838914, 1, 1, 1, 1, 1,
0.5684105, -1.119155, 0.6188263, 1, 1, 1, 1, 1,
0.5720128, 0.7535548, 1.029139, 0, 0, 1, 1, 1,
0.5768954, 0.1208252, 0.6353085, 1, 0, 0, 1, 1,
0.5798723, -1.037317, 3.168096, 1, 0, 0, 1, 1,
0.5808261, 0.7957973, 1.511408, 1, 0, 0, 1, 1,
0.5813315, 0.6222913, 0.9298947, 1, 0, 0, 1, 1,
0.5894552, 1.49721, 1.223523, 1, 0, 0, 1, 1,
0.5962679, 0.8107172, 2.013873, 0, 0, 0, 1, 1,
0.5969961, -0.5292584, 2.510767, 0, 0, 0, 1, 1,
0.5970558, -0.01924839, 0.3557049, 0, 0, 0, 1, 1,
0.5989921, -1.320047, 2.03997, 0, 0, 0, 1, 1,
0.6029692, 1.327275, 1.539461, 0, 0, 0, 1, 1,
0.6039833, 0.8157159, -0.9182278, 0, 0, 0, 1, 1,
0.6153568, -0.8994326, 2.690413, 0, 0, 0, 1, 1,
0.6153733, -0.02306509, 1.40676, 1, 1, 1, 1, 1,
0.6179474, 0.3978748, 0.01226823, 1, 1, 1, 1, 1,
0.6188529, 1.352108, -0.6672947, 1, 1, 1, 1, 1,
0.620162, -0.4642912, 1.788025, 1, 1, 1, 1, 1,
0.6286864, -0.3105821, 1.014742, 1, 1, 1, 1, 1,
0.6305642, -0.5082319, 1.29699, 1, 1, 1, 1, 1,
0.631745, 0.5174895, 0.9799583, 1, 1, 1, 1, 1,
0.6347231, -0.3967513, 0.8458112, 1, 1, 1, 1, 1,
0.6375385, -0.2859294, 2.184093, 1, 1, 1, 1, 1,
0.6385877, 0.08315985, 0.699738, 1, 1, 1, 1, 1,
0.6473082, -0.2485193, 1.506185, 1, 1, 1, 1, 1,
0.6506494, -0.2503319, 3.163322, 1, 1, 1, 1, 1,
0.6534275, -0.3778317, 1.497498, 1, 1, 1, 1, 1,
0.6541224, 0.8441268, -0.7819284, 1, 1, 1, 1, 1,
0.6547424, 0.4226184, 1.996037, 1, 1, 1, 1, 1,
0.65758, 0.7779287, 0.7514631, 0, 0, 1, 1, 1,
0.6607312, 0.03599177, 0.5656831, 1, 0, 0, 1, 1,
0.6686105, -0.4509041, 1.749873, 1, 0, 0, 1, 1,
0.6722207, 0.8396628, 1.644777, 1, 0, 0, 1, 1,
0.6735339, -1.067328, 2.354089, 1, 0, 0, 1, 1,
0.6738648, 1.343554, -0.1107756, 1, 0, 0, 1, 1,
0.6754242, -0.737807, 3.300551, 0, 0, 0, 1, 1,
0.6805769, -1.783812, 2.525801, 0, 0, 0, 1, 1,
0.6882489, -0.5012169, 3.281496, 0, 0, 0, 1, 1,
0.690582, 0.2958181, 1.281972, 0, 0, 0, 1, 1,
0.6909446, -0.8981982, 2.76722, 0, 0, 0, 1, 1,
0.6942925, 1.909894, 0.1941801, 0, 0, 0, 1, 1,
0.6983116, -0.4871213, 1.179946, 0, 0, 0, 1, 1,
0.699342, 0.6050234, -0.9912374, 1, 1, 1, 1, 1,
0.7005712, 1.808224, 2.079875, 1, 1, 1, 1, 1,
0.7040402, 1.332793, 0.5486036, 1, 1, 1, 1, 1,
0.7049243, 1.971871, 0.4966473, 1, 1, 1, 1, 1,
0.7067692, -0.3506857, 1.59815, 1, 1, 1, 1, 1,
0.7089549, 0.2047792, 1.354698, 1, 1, 1, 1, 1,
0.7107062, 1.386416, 2.042304, 1, 1, 1, 1, 1,
0.7139509, 1.03805, 2.441765, 1, 1, 1, 1, 1,
0.7175221, -0.835601, 2.191437, 1, 1, 1, 1, 1,
0.71969, 0.8953225, 0.3582035, 1, 1, 1, 1, 1,
0.721109, -0.1816322, 2.317754, 1, 1, 1, 1, 1,
0.7214578, -0.1044978, 1.302527, 1, 1, 1, 1, 1,
0.7264269, 0.4188685, -0.7672328, 1, 1, 1, 1, 1,
0.7297235, -0.3893847, 1.775253, 1, 1, 1, 1, 1,
0.7302991, -1.491171, 1.146043, 1, 1, 1, 1, 1,
0.7433096, 0.1769661, 1.332209, 0, 0, 1, 1, 1,
0.748155, 0.2214875, 0.8176257, 1, 0, 0, 1, 1,
0.7486615, 0.8003746, 1.185757, 1, 0, 0, 1, 1,
0.7487246, 0.8778911, 1.429735, 1, 0, 0, 1, 1,
0.750734, 0.1347392, 2.54829, 1, 0, 0, 1, 1,
0.7527159, -1.303464, 2.284319, 1, 0, 0, 1, 1,
0.7545182, 0.6928794, 0.7960055, 0, 0, 0, 1, 1,
0.7545409, 0.755062, -1.214528, 0, 0, 0, 1, 1,
0.7562835, 1.534491, 1.44506, 0, 0, 0, 1, 1,
0.7587924, -0.952317, 2.429136, 0, 0, 0, 1, 1,
0.7591594, 0.9378699, 1.124153, 0, 0, 0, 1, 1,
0.7636848, -1.134504, 0.9507532, 0, 0, 0, 1, 1,
0.7672713, -1.543177, 3.7351, 0, 0, 0, 1, 1,
0.7744055, -0.3316402, 4.061762, 1, 1, 1, 1, 1,
0.7748778, 0.9806507, 0.9070181, 1, 1, 1, 1, 1,
0.7821538, 2.107058, 0.208703, 1, 1, 1, 1, 1,
0.7832373, -0.6096163, 1.803881, 1, 1, 1, 1, 1,
0.7839709, 0.6768783, 1.412815, 1, 1, 1, 1, 1,
0.7901186, 0.4613379, 1.3165, 1, 1, 1, 1, 1,
0.8142715, 1.756136, -0.9178249, 1, 1, 1, 1, 1,
0.8173277, -0.2237175, 2.078182, 1, 1, 1, 1, 1,
0.8179253, -0.4313838, 1.754282, 1, 1, 1, 1, 1,
0.8196362, -0.7423177, 0.4659346, 1, 1, 1, 1, 1,
0.8196768, 0.8195245, 1.422421, 1, 1, 1, 1, 1,
0.8206748, 0.1709105, 0.5602821, 1, 1, 1, 1, 1,
0.8213798, -0.06121896, 1.135713, 1, 1, 1, 1, 1,
0.8250282, 2.38025, -1.935083, 1, 1, 1, 1, 1,
0.8252299, 0.4206869, 1.638915, 1, 1, 1, 1, 1,
0.8268397, 0.1344453, 0.2364969, 0, 0, 1, 1, 1,
0.8378375, 0.5556328, 1.156983, 1, 0, 0, 1, 1,
0.8415552, 0.9418438, 0.4005717, 1, 0, 0, 1, 1,
0.8475016, 0.8868548, 0.9501873, 1, 0, 0, 1, 1,
0.8592823, 0.2852248, -0.1846458, 1, 0, 0, 1, 1,
0.866101, 0.7228662, 1.790834, 1, 0, 0, 1, 1,
0.8725311, 0.5008491, 0.119338, 0, 0, 0, 1, 1,
0.8727013, 1.738797, -0.3758171, 0, 0, 0, 1, 1,
0.8733323, 1.584132, 0.2049607, 0, 0, 0, 1, 1,
0.8742884, -1.86127, 1.911373, 0, 0, 0, 1, 1,
0.8757769, 0.3492313, 1.963612, 0, 0, 0, 1, 1,
0.8770242, -0.4450066, 2.070086, 0, 0, 0, 1, 1,
0.8779224, -1.303955, 2.838587, 0, 0, 0, 1, 1,
0.8813139, 0.9560024, -0.9968559, 1, 1, 1, 1, 1,
0.883783, -0.02304392, 0.2943547, 1, 1, 1, 1, 1,
0.8892042, -0.8760617, 2.402788, 1, 1, 1, 1, 1,
0.8892791, 0.9593393, 1.585572, 1, 1, 1, 1, 1,
0.8944612, 0.7095551, 1.581461, 1, 1, 1, 1, 1,
0.8973751, 0.8433743, 1.303737, 1, 1, 1, 1, 1,
0.901602, -1.520102, 1.852351, 1, 1, 1, 1, 1,
0.9078609, 2.022156, 0.8377347, 1, 1, 1, 1, 1,
0.9083353, 1.24695, -0.05953953, 1, 1, 1, 1, 1,
0.9131857, 1.400975, 0.443489, 1, 1, 1, 1, 1,
0.9140569, -0.02637957, 1.949961, 1, 1, 1, 1, 1,
0.9144059, -0.4959618, 2.353988, 1, 1, 1, 1, 1,
0.915436, 0.6869595, 0.1402168, 1, 1, 1, 1, 1,
0.9181378, -1.62395, 2.038692, 1, 1, 1, 1, 1,
0.9234554, -2.384635, 2.470946, 1, 1, 1, 1, 1,
0.9236861, -1.765137, 4.263657, 0, 0, 1, 1, 1,
0.9276487, 0.9225644, 3.385829, 1, 0, 0, 1, 1,
0.9305223, 0.1425481, -0.8544565, 1, 0, 0, 1, 1,
0.9309277, 2.119069, 2.223681, 1, 0, 0, 1, 1,
0.9350115, 1.249892, 0.6934835, 1, 0, 0, 1, 1,
0.9410755, -1.323796, 3.204991, 1, 0, 0, 1, 1,
0.9431571, 0.1976518, 1.012191, 0, 0, 0, 1, 1,
0.9477482, 1.274246, 1.574849, 0, 0, 0, 1, 1,
0.9487646, 1.233775, 1.546259, 0, 0, 0, 1, 1,
0.9512023, -0.673821, 1.713491, 0, 0, 0, 1, 1,
0.9598365, -0.164695, 0.957688, 0, 0, 0, 1, 1,
0.9718147, -0.01881853, 0.9860127, 0, 0, 0, 1, 1,
0.9907615, -0.6015075, 1.840055, 0, 0, 0, 1, 1,
1.003855, -0.4271365, 0.4162382, 1, 1, 1, 1, 1,
1.007078, -0.5723436, 0.1951029, 1, 1, 1, 1, 1,
1.012832, 1.197734, 0.8649874, 1, 1, 1, 1, 1,
1.02141, -1.366476, 2.695257, 1, 1, 1, 1, 1,
1.024797, 0.04018355, 1.212151, 1, 1, 1, 1, 1,
1.030376, 0.5835748, 0.2248362, 1, 1, 1, 1, 1,
1.031829, -0.167713, 2.631527, 1, 1, 1, 1, 1,
1.034465, -0.4879681, 0.7934848, 1, 1, 1, 1, 1,
1.041953, -0.05145211, 3.185004, 1, 1, 1, 1, 1,
1.043917, -0.4577971, 0.9294222, 1, 1, 1, 1, 1,
1.045665, -0.531337, 3.005331, 1, 1, 1, 1, 1,
1.046769, 0.5347898, 0.6435869, 1, 1, 1, 1, 1,
1.049099, 1.114055, 1.095501, 1, 1, 1, 1, 1,
1.052768, 1.10557, -0.1426643, 1, 1, 1, 1, 1,
1.065511, 0.1231542, 1.155542, 1, 1, 1, 1, 1,
1.076869, 0.306159, 0.2371358, 0, 0, 1, 1, 1,
1.083029, 0.9517785, 0.6714894, 1, 0, 0, 1, 1,
1.091119, 0.2871104, 1.639882, 1, 0, 0, 1, 1,
1.10327, 0.1540294, 1.618698, 1, 0, 0, 1, 1,
1.103695, -0.4302988, 1.742496, 1, 0, 0, 1, 1,
1.107756, 0.7333167, 1.80657, 1, 0, 0, 1, 1,
1.108701, 0.634721, 1.080102, 0, 0, 0, 1, 1,
1.111522, 0.7359388, 0.7433847, 0, 0, 0, 1, 1,
1.119458, 1.108478, -0.1864683, 0, 0, 0, 1, 1,
1.124417, -0.4124622, 2.313967, 0, 0, 0, 1, 1,
1.126794, -0.08967687, 0.9531618, 0, 0, 0, 1, 1,
1.128132, 0.09047774, 2.038309, 0, 0, 0, 1, 1,
1.129295, -0.1780165, 2.545613, 0, 0, 0, 1, 1,
1.129722, -0.263752, 0.2170871, 1, 1, 1, 1, 1,
1.137297, 0.3916152, 1.863635, 1, 1, 1, 1, 1,
1.140056, -0.4539801, 0.5061386, 1, 1, 1, 1, 1,
1.140067, 1.486537, -0.01337901, 1, 1, 1, 1, 1,
1.142318, 0.4088968, 2.293297, 1, 1, 1, 1, 1,
1.142433, -1.591788, 1.999792, 1, 1, 1, 1, 1,
1.142805, -0.7071322, 1.6396, 1, 1, 1, 1, 1,
1.145847, -1.679682, 1.647183, 1, 1, 1, 1, 1,
1.157584, 0.3446907, 2.093324, 1, 1, 1, 1, 1,
1.158953, 1.666643, -0.07386643, 1, 1, 1, 1, 1,
1.159692, -2.637359, 2.900252, 1, 1, 1, 1, 1,
1.161373, -0.7497973, 0.7752056, 1, 1, 1, 1, 1,
1.174556, -1.717658, 3.611279, 1, 1, 1, 1, 1,
1.177283, -0.6125365, 3.784922, 1, 1, 1, 1, 1,
1.184111, 0.04663072, 2.494795, 1, 1, 1, 1, 1,
1.190987, 1.332634, 3.141884, 0, 0, 1, 1, 1,
1.1991, 0.5216252, 0.5117325, 1, 0, 0, 1, 1,
1.20458, -0.9214357, 2.203581, 1, 0, 0, 1, 1,
1.210747, -0.1638044, 1.294645, 1, 0, 0, 1, 1,
1.21114, 0.1538835, 0.2639546, 1, 0, 0, 1, 1,
1.219202, -1.228307, 3.608064, 1, 0, 0, 1, 1,
1.228492, 1.602615, 1.754475, 0, 0, 0, 1, 1,
1.244584, -0.04581678, 1.745884, 0, 0, 0, 1, 1,
1.247084, -0.0506459, 1.110428, 0, 0, 0, 1, 1,
1.249454, -1.615845, 3.722415, 0, 0, 0, 1, 1,
1.262191, -1.037902, 0.850848, 0, 0, 0, 1, 1,
1.267862, -0.3314584, 1.738053, 0, 0, 0, 1, 1,
1.274858, -0.1761371, 1.146628, 0, 0, 0, 1, 1,
1.304495, 0.5731178, 2.046149, 1, 1, 1, 1, 1,
1.306526, 0.8798086, 1.111838, 1, 1, 1, 1, 1,
1.318326, 1.022227, -0.2798118, 1, 1, 1, 1, 1,
1.326734, 0.8682417, 0.01194852, 1, 1, 1, 1, 1,
1.353279, -1.070226, 3.478205, 1, 1, 1, 1, 1,
1.355381, -1.827312, 2.032152, 1, 1, 1, 1, 1,
1.365944, -0.05091068, 0.6074541, 1, 1, 1, 1, 1,
1.377667, 0.4484262, 2.686061, 1, 1, 1, 1, 1,
1.385067, -0.07297983, 1.993645, 1, 1, 1, 1, 1,
1.399272, 0.6949733, 1.265972, 1, 1, 1, 1, 1,
1.414907, -0.3896254, 1.645574, 1, 1, 1, 1, 1,
1.41627, -1.019276, 1.658308, 1, 1, 1, 1, 1,
1.422341, -0.6709947, 1.273062, 1, 1, 1, 1, 1,
1.434454, -1.221753, 1.89458, 1, 1, 1, 1, 1,
1.452945, -0.2913627, 3.25994, 1, 1, 1, 1, 1,
1.454225, -0.7675794, 1.475005, 0, 0, 1, 1, 1,
1.458594, 0.9607292, 1.850573, 1, 0, 0, 1, 1,
1.459612, -1.18312, 2.30955, 1, 0, 0, 1, 1,
1.46049, -0.1095022, 2.224229, 1, 0, 0, 1, 1,
1.460552, 0.3623444, 2.22112, 1, 0, 0, 1, 1,
1.46542, -0.08794348, -0.09016462, 1, 0, 0, 1, 1,
1.471357, 0.56586, 0.1795291, 0, 0, 0, 1, 1,
1.490739, -0.2723094, 1.038992, 0, 0, 0, 1, 1,
1.498332, -0.4052929, 2.86673, 0, 0, 0, 1, 1,
1.499718, 0.5880569, 0.6795911, 0, 0, 0, 1, 1,
1.5008, -1.067439, 5.442774, 0, 0, 0, 1, 1,
1.511016, -1.184213, 1.828085, 0, 0, 0, 1, 1,
1.512835, -0.7691777, 3.131333, 0, 0, 0, 1, 1,
1.530824, 0.956908, -0.02226595, 1, 1, 1, 1, 1,
1.555246, -0.4002628, 1.392086, 1, 1, 1, 1, 1,
1.579616, -1.997451, 2.324732, 1, 1, 1, 1, 1,
1.584731, 1.242619, 1.408737, 1, 1, 1, 1, 1,
1.585059, 0.7443436, 0.7145882, 1, 1, 1, 1, 1,
1.587171, -0.327978, 0.2674172, 1, 1, 1, 1, 1,
1.594547, 1.670115, 0.7034553, 1, 1, 1, 1, 1,
1.595113, 0.2549262, 1.279255, 1, 1, 1, 1, 1,
1.603859, 0.5590648, -0.09248324, 1, 1, 1, 1, 1,
1.609843, 1.297813, 2.790975, 1, 1, 1, 1, 1,
1.64115, 0.8886084, 0.5540414, 1, 1, 1, 1, 1,
1.651989, -0.1872298, 2.499995, 1, 1, 1, 1, 1,
1.655143, -1.023234, 1.522775, 1, 1, 1, 1, 1,
1.679852, -0.5173516, 0.789552, 1, 1, 1, 1, 1,
1.683513, -1.66951, 2.0511, 1, 1, 1, 1, 1,
1.694552, 0.05862503, 0.9119163, 0, 0, 1, 1, 1,
1.698612, -1.808354, 2.036008, 1, 0, 0, 1, 1,
1.698802, -0.3090391, 2.823459, 1, 0, 0, 1, 1,
1.720797, 0.6860831, -1.268735, 1, 0, 0, 1, 1,
1.742329, -1.028355, 2.133681, 1, 0, 0, 1, 1,
1.746299, -0.241717, 0.5007359, 1, 0, 0, 1, 1,
1.767827, -1.960662, 1.411247, 0, 0, 0, 1, 1,
1.770777, -0.2314906, 2.499512, 0, 0, 0, 1, 1,
1.775373, -0.8472381, 2.563108, 0, 0, 0, 1, 1,
1.784527, 0.04886755, 2.139965, 0, 0, 0, 1, 1,
1.807746, -1.151187, 2.898478, 0, 0, 0, 1, 1,
1.810789, 0.08058496, 1.22689, 0, 0, 0, 1, 1,
1.833891, -0.2012475, 0.2434369, 0, 0, 0, 1, 1,
1.85393, 1.035244, 0.6872845, 1, 1, 1, 1, 1,
1.895296, 1.36945, -0.2884761, 1, 1, 1, 1, 1,
1.915408, 0.8896066, 1.115756, 1, 1, 1, 1, 1,
1.929949, 0.3171958, 1.719098, 1, 1, 1, 1, 1,
1.947235, -0.3865031, 0.2243241, 1, 1, 1, 1, 1,
1.961804, 0.7647769, 1.49299, 1, 1, 1, 1, 1,
1.964659, 0.404509, 0.01870454, 1, 1, 1, 1, 1,
1.9868, -0.4548967, 1.525174, 1, 1, 1, 1, 1,
1.991013, -1.257554, 2.686465, 1, 1, 1, 1, 1,
2.026873, -0.7205663, 0.9472561, 1, 1, 1, 1, 1,
2.039194, -1.467624, 2.920952, 1, 1, 1, 1, 1,
2.042555, -0.7646862, 2.360678, 1, 1, 1, 1, 1,
2.065625, 0.3600579, 2.439127, 1, 1, 1, 1, 1,
2.107124, -0.436984, 1.82993, 1, 1, 1, 1, 1,
2.109545, -1.198264, 2.01597, 1, 1, 1, 1, 1,
2.115143, 0.3429629, 0.1513967, 0, 0, 1, 1, 1,
2.15129, 0.1765325, 3.19685, 1, 0, 0, 1, 1,
2.161253, 0.5438165, 3.800505, 1, 0, 0, 1, 1,
2.180497, 0.05843923, 1.94879, 1, 0, 0, 1, 1,
2.219026, 2.215315, 1.855258, 1, 0, 0, 1, 1,
2.271279, -0.6967149, 1.930745, 1, 0, 0, 1, 1,
2.276683, 1.217469, -0.1672951, 0, 0, 0, 1, 1,
2.328532, -0.4167636, 1.813462, 0, 0, 0, 1, 1,
2.337539, 0.2901057, 3.33555, 0, 0, 0, 1, 1,
2.349839, -0.5143782, 3.05637, 0, 0, 0, 1, 1,
2.391263, -0.3239716, 2.855107, 0, 0, 0, 1, 1,
2.402406, -1.584893, 2.232562, 0, 0, 0, 1, 1,
2.41394, -1.542347, 1.774657, 0, 0, 0, 1, 1,
2.424814, -0.1185006, 1.795762, 1, 1, 1, 1, 1,
2.499422, -0.234329, 1.536662, 1, 1, 1, 1, 1,
2.522021, -0.4952346, 2.230379, 1, 1, 1, 1, 1,
2.587701, -0.6147604, 2.247575, 1, 1, 1, 1, 1,
2.620416, -1.2237, 2.026911, 1, 1, 1, 1, 1,
2.680876, 0.966602, 1.653083, 1, 1, 1, 1, 1,
2.681177, 2.46597, 0.2861216, 1, 1, 1, 1, 1
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
var radius = 9.578418;
var distance = 33.64378;
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
mvMatrix.translate( 0.613796, 0.186084, -0.1567342 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64378);
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
