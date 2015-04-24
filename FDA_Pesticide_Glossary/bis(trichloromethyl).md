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
-3.680382, -1.443048, -0.9387038, 1, 0, 0, 1,
-3.144247, -0.6229139, -2.611571, 1, 0.007843138, 0, 1,
-3.078549, 0.116063, -2.120621, 1, 0.01176471, 0, 1,
-2.931591, -1.441496, -1.201731, 1, 0.01960784, 0, 1,
-2.736806, -0.2628943, -1.839412, 1, 0.02352941, 0, 1,
-2.507245, -0.330615, 0.1448662, 1, 0.03137255, 0, 1,
-2.504726, 1.625063, -1.134177, 1, 0.03529412, 0, 1,
-2.44861, 1.263269, -0.4843809, 1, 0.04313726, 0, 1,
-2.415863, 0.5696003, 0.1819538, 1, 0.04705882, 0, 1,
-2.415645, 0.4620526, -1.510444, 1, 0.05490196, 0, 1,
-2.343896, 1.409987, -1.294132, 1, 0.05882353, 0, 1,
-2.299914, -0.3616614, -1.871633, 1, 0.06666667, 0, 1,
-2.282443, 0.06059036, -2.415066, 1, 0.07058824, 0, 1,
-2.275559, -1.140466, -1.356728, 1, 0.07843138, 0, 1,
-2.202112, 0.3654832, -0.7449744, 1, 0.08235294, 0, 1,
-2.18013, -1.116486, -2.613977, 1, 0.09019608, 0, 1,
-2.128494, 0.5479034, -1.517351, 1, 0.09411765, 0, 1,
-2.12372, -0.06321144, -1.208588, 1, 0.1019608, 0, 1,
-2.122928, -0.4948545, -2.293949, 1, 0.1098039, 0, 1,
-2.096633, 1.837829, 0.9552481, 1, 0.1137255, 0, 1,
-2.067069, 0.3459518, -1.437314, 1, 0.1215686, 0, 1,
-2.050761, -0.01338907, -1.544556, 1, 0.1254902, 0, 1,
-2.037383, -0.9285178, -3.267918, 1, 0.1333333, 0, 1,
-2.030659, 1.838157, -3.461228, 1, 0.1372549, 0, 1,
-2.001643, 1.837791, 0.6203315, 1, 0.145098, 0, 1,
-1.998847, 2.05189, -0.04045142, 1, 0.1490196, 0, 1,
-1.944799, 0.1988881, -1.036616, 1, 0.1568628, 0, 1,
-1.943615, 1.290877, -1.514419, 1, 0.1607843, 0, 1,
-1.938977, 1.141007, 0.1263896, 1, 0.1686275, 0, 1,
-1.931387, 0.1333482, -2.082635, 1, 0.172549, 0, 1,
-1.928535, 0.1318337, -1.708455, 1, 0.1803922, 0, 1,
-1.925172, 0.4699005, -3.468835, 1, 0.1843137, 0, 1,
-1.925152, 0.7687038, -1.567393, 1, 0.1921569, 0, 1,
-1.893592, -1.939867, -1.605504, 1, 0.1960784, 0, 1,
-1.877781, 1.442046, -2.156352, 1, 0.2039216, 0, 1,
-1.871054, 1.118012, -1.126422, 1, 0.2117647, 0, 1,
-1.832972, 0.3894905, -1.540463, 1, 0.2156863, 0, 1,
-1.82324, -0.4832436, -3.793414, 1, 0.2235294, 0, 1,
-1.809782, 0.4555695, -1.02555, 1, 0.227451, 0, 1,
-1.803915, -1.099551, -2.03833, 1, 0.2352941, 0, 1,
-1.797153, -1.288057, -1.268391, 1, 0.2392157, 0, 1,
-1.786686, -2.009285, -1.883111, 1, 0.2470588, 0, 1,
-1.779618, 1.624486, -0.1394429, 1, 0.2509804, 0, 1,
-1.77208, -1.184672, -2.511883, 1, 0.2588235, 0, 1,
-1.75495, -1.092704, -4.064622, 1, 0.2627451, 0, 1,
-1.750855, -0.5372551, -0.7950642, 1, 0.2705882, 0, 1,
-1.735918, -1.115147, -3.208311, 1, 0.2745098, 0, 1,
-1.735642, 0.5974612, -1.06295, 1, 0.282353, 0, 1,
-1.733591, -0.1180002, 0.9624645, 1, 0.2862745, 0, 1,
-1.709242, 0.2690502, -2.02515, 1, 0.2941177, 0, 1,
-1.704817, -1.170042, -1.637872, 1, 0.3019608, 0, 1,
-1.694476, 1.77434, 1.117642, 1, 0.3058824, 0, 1,
-1.690315, -0.2037477, -1.544466, 1, 0.3137255, 0, 1,
-1.68405, -0.6070577, -3.450579, 1, 0.3176471, 0, 1,
-1.683336, -0.4944471, -3.613559, 1, 0.3254902, 0, 1,
-1.677576, -0.8497937, -1.861466, 1, 0.3294118, 0, 1,
-1.669011, 0.3350692, -2.021342, 1, 0.3372549, 0, 1,
-1.659086, -1.918728, -3.47873, 1, 0.3411765, 0, 1,
-1.658617, 1.097423, 0.2830446, 1, 0.3490196, 0, 1,
-1.644406, 0.3549272, -2.78085, 1, 0.3529412, 0, 1,
-1.641639, 1.223504, -1.933213, 1, 0.3607843, 0, 1,
-1.632564, -1.663448, -3.735828, 1, 0.3647059, 0, 1,
-1.630283, -1.343218, -1.745341, 1, 0.372549, 0, 1,
-1.6207, 1.54482, -1.406669, 1, 0.3764706, 0, 1,
-1.604435, -1.229065, -3.021931, 1, 0.3843137, 0, 1,
-1.597698, 0.6384841, -1.38502, 1, 0.3882353, 0, 1,
-1.596806, 0.5932027, -1.812865, 1, 0.3960784, 0, 1,
-1.596742, 0.6491647, -1.232964, 1, 0.4039216, 0, 1,
-1.593879, -0.0009897507, -1.424109, 1, 0.4078431, 0, 1,
-1.588157, 0.3188243, -2.879712, 1, 0.4156863, 0, 1,
-1.584198, 1.525478, -0.7445748, 1, 0.4196078, 0, 1,
-1.582155, -0.8762043, -2.170084, 1, 0.427451, 0, 1,
-1.569109, 1.368409, -1.492852, 1, 0.4313726, 0, 1,
-1.55838, 0.5204839, -0.8705198, 1, 0.4392157, 0, 1,
-1.545993, -1.364114, -0.08702913, 1, 0.4431373, 0, 1,
-1.545654, -1.684558, -0.6926609, 1, 0.4509804, 0, 1,
-1.529172, -0.4181891, -1.445298, 1, 0.454902, 0, 1,
-1.528816, -0.475452, -2.052169, 1, 0.4627451, 0, 1,
-1.526026, -1.217247, -2.61976, 1, 0.4666667, 0, 1,
-1.524237, 2.169522, -0.2733953, 1, 0.4745098, 0, 1,
-1.523967, -0.1848716, -1.434482, 1, 0.4784314, 0, 1,
-1.515705, 0.6498617, -0.6069498, 1, 0.4862745, 0, 1,
-1.507456, -0.3484063, -1.7204, 1, 0.4901961, 0, 1,
-1.506734, -0.385429, -0.2552924, 1, 0.4980392, 0, 1,
-1.506054, 0.8236149, -1.059733, 1, 0.5058824, 0, 1,
-1.495216, 0.169118, -0.8454324, 1, 0.509804, 0, 1,
-1.494647, 0.4120774, -1.782854, 1, 0.5176471, 0, 1,
-1.491548, 1.308333, -1.978357, 1, 0.5215687, 0, 1,
-1.487444, 0.8512773, -0.2182845, 1, 0.5294118, 0, 1,
-1.480928, 0.04516309, -1.456396, 1, 0.5333334, 0, 1,
-1.473053, 1.058419, -0.8131919, 1, 0.5411765, 0, 1,
-1.471733, 0.3788432, -0.2143607, 1, 0.5450981, 0, 1,
-1.469242, -0.3274348, -1.301847, 1, 0.5529412, 0, 1,
-1.462612, -1.408261, -3.243008, 1, 0.5568628, 0, 1,
-1.440102, -2.335786, -1.775348, 1, 0.5647059, 0, 1,
-1.438054, -1.268509, -2.599323, 1, 0.5686275, 0, 1,
-1.436589, -0.8508121, -2.664412, 1, 0.5764706, 0, 1,
-1.433231, 0.6380488, -1.007491, 1, 0.5803922, 0, 1,
-1.427012, 0.5821427, -2.29225, 1, 0.5882353, 0, 1,
-1.416774, -1.292745, -3.084444, 1, 0.5921569, 0, 1,
-1.385407, 0.01333483, -2.118963, 1, 0.6, 0, 1,
-1.367824, 0.2197295, -3.624942, 1, 0.6078432, 0, 1,
-1.367491, 0.1676718, -2.219049, 1, 0.6117647, 0, 1,
-1.363968, -0.408259, -0.5323659, 1, 0.6196079, 0, 1,
-1.355375, 0.1013337, -1.722192, 1, 0.6235294, 0, 1,
-1.352523, -0.9035555, -2.951749, 1, 0.6313726, 0, 1,
-1.340731, -0.9414322, -1.841725, 1, 0.6352941, 0, 1,
-1.331082, -0.4090452, -1.166602, 1, 0.6431373, 0, 1,
-1.317822, 0.2980183, -0.4641281, 1, 0.6470588, 0, 1,
-1.315198, -0.6336822, -2.768512, 1, 0.654902, 0, 1,
-1.314273, -1.652668, -4.137259, 1, 0.6588235, 0, 1,
-1.309302, -0.8223379, -2.050229, 1, 0.6666667, 0, 1,
-1.306061, -1.090113, -4.527195, 1, 0.6705883, 0, 1,
-1.303809, 0.6672379, -0.2790012, 1, 0.6784314, 0, 1,
-1.302001, 0.7810718, 0.1404419, 1, 0.682353, 0, 1,
-1.300051, -0.9858091, -1.056258, 1, 0.6901961, 0, 1,
-1.29143, -0.1315145, -1.920997, 1, 0.6941177, 0, 1,
-1.287195, 2.057062, 0.9316591, 1, 0.7019608, 0, 1,
-1.281705, -0.3926023, -0.9727262, 1, 0.7098039, 0, 1,
-1.278906, -0.9385609, -1.342439, 1, 0.7137255, 0, 1,
-1.278896, -1.027631, -2.374501, 1, 0.7215686, 0, 1,
-1.268158, 1.217807, -2.145061, 1, 0.7254902, 0, 1,
-1.265373, -0.7387011, -2.247826, 1, 0.7333333, 0, 1,
-1.260558, -0.9913404, -2.903397, 1, 0.7372549, 0, 1,
-1.257056, -1.140931, -2.543746, 1, 0.7450981, 0, 1,
-1.256563, 0.8862355, -2.608078, 1, 0.7490196, 0, 1,
-1.254767, 0.6506076, -1.203901, 1, 0.7568628, 0, 1,
-1.248833, 0.7851685, 0.4776222, 1, 0.7607843, 0, 1,
-1.248253, 0.4535738, -0.9762329, 1, 0.7686275, 0, 1,
-1.246008, -0.5864127, -1.894, 1, 0.772549, 0, 1,
-1.245968, 0.9030946, -1.610258, 1, 0.7803922, 0, 1,
-1.229113, -0.393406, -0.9830149, 1, 0.7843137, 0, 1,
-1.22418, -1.513892, -1.178705, 1, 0.7921569, 0, 1,
-1.197538, 0.2375548, -2.819934, 1, 0.7960784, 0, 1,
-1.195441, 0.3401753, -1.934417, 1, 0.8039216, 0, 1,
-1.182969, -0.866873, -2.273316, 1, 0.8117647, 0, 1,
-1.182742, -1.2528, -3.339946, 1, 0.8156863, 0, 1,
-1.181767, -0.498733, -2.686904, 1, 0.8235294, 0, 1,
-1.167776, -0.05895087, -2.47622, 1, 0.827451, 0, 1,
-1.152234, -0.1639928, -3.377878, 1, 0.8352941, 0, 1,
-1.148303, 0.4416201, -0.9611712, 1, 0.8392157, 0, 1,
-1.144545, -0.7713389, -1.31221, 1, 0.8470588, 0, 1,
-1.138845, 0.7010921, 0.2698107, 1, 0.8509804, 0, 1,
-1.135124, 1.679495, -0.7220404, 1, 0.8588235, 0, 1,
-1.133377, -2.803819, -5.146186, 1, 0.8627451, 0, 1,
-1.132396, -0.565464, -3.450738, 1, 0.8705882, 0, 1,
-1.129637, -1.77155, -1.91335, 1, 0.8745098, 0, 1,
-1.128428, 0.6167393, -1.351814, 1, 0.8823529, 0, 1,
-1.125846, -0.7575737, -2.511039, 1, 0.8862745, 0, 1,
-1.117481, 1.183145, -0.6455726, 1, 0.8941177, 0, 1,
-1.117479, 1.295424, -0.583856, 1, 0.8980392, 0, 1,
-1.110598, 1.45261, 1.240069, 1, 0.9058824, 0, 1,
-1.086791, 0.3255163, -2.352284, 1, 0.9137255, 0, 1,
-1.08611, 0.1488917, -1.742404, 1, 0.9176471, 0, 1,
-1.076823, -0.4638301, -1.889607, 1, 0.9254902, 0, 1,
-1.063298, -1.160766, -1.216922, 1, 0.9294118, 0, 1,
-1.058908, 0.09711205, -3.007145, 1, 0.9372549, 0, 1,
-1.058008, -0.8908712, -2.349575, 1, 0.9411765, 0, 1,
-1.056573, -2.089047, -3.264344, 1, 0.9490196, 0, 1,
-1.052129, -0.4757648, -3.053072, 1, 0.9529412, 0, 1,
-1.042601, 0.2255544, -0.2614378, 1, 0.9607843, 0, 1,
-1.036609, -0.3328314, -1.332545, 1, 0.9647059, 0, 1,
-1.031488, -0.7816958, -2.591913, 1, 0.972549, 0, 1,
-1.025226, -0.9679311, -1.46441, 1, 0.9764706, 0, 1,
-1.015969, 1.496109, -2.3463, 1, 0.9843137, 0, 1,
-1.014469, -1.377298, -3.092853, 1, 0.9882353, 0, 1,
-1.011128, -0.1716946, -1.668187, 1, 0.9960784, 0, 1,
-1.007363, 0.02089414, -2.161312, 0.9960784, 1, 0, 1,
-1.006282, 0.1039197, -1.521268, 0.9921569, 1, 0, 1,
-0.9987727, -1.161742, -3.223811, 0.9843137, 1, 0, 1,
-0.9959001, -0.6026203, -3.539278, 0.9803922, 1, 0, 1,
-0.9872643, -0.9395852, -1.698715, 0.972549, 1, 0, 1,
-0.9864873, 0.2911304, -2.292595, 0.9686275, 1, 0, 1,
-0.985612, -0.7397454, -2.873912, 0.9607843, 1, 0, 1,
-0.982155, 0.02690028, -0.4999573, 0.9568627, 1, 0, 1,
-0.9820192, -0.2691653, -1.772572, 0.9490196, 1, 0, 1,
-0.9718748, -0.2475038, -2.216196, 0.945098, 1, 0, 1,
-0.9704255, -0.1640328, -2.338687, 0.9372549, 1, 0, 1,
-0.9687366, -1.588305, -2.98163, 0.9333333, 1, 0, 1,
-0.967944, 2.056332, 1.596674, 0.9254902, 1, 0, 1,
-0.9597153, -0.3207701, -1.095161, 0.9215686, 1, 0, 1,
-0.9549561, -1.159994, -2.293188, 0.9137255, 1, 0, 1,
-0.9532244, -0.1735688, -2.566263, 0.9098039, 1, 0, 1,
-0.9527513, -1.718752, -2.808183, 0.9019608, 1, 0, 1,
-0.9495159, 0.7339762, -0.8786143, 0.8941177, 1, 0, 1,
-0.9462696, -0.4937142, -1.55441, 0.8901961, 1, 0, 1,
-0.9417578, 1.231919, 0.08841562, 0.8823529, 1, 0, 1,
-0.9390883, 1.287317, -1.695696, 0.8784314, 1, 0, 1,
-0.93591, 2.204428, 0.7564332, 0.8705882, 1, 0, 1,
-0.9356831, 0.8583423, -0.6198561, 0.8666667, 1, 0, 1,
-0.9355902, -0.04190958, -0.9021408, 0.8588235, 1, 0, 1,
-0.9326471, 0.8154, -1.989963, 0.854902, 1, 0, 1,
-0.9263492, 0.366443, -0.6857771, 0.8470588, 1, 0, 1,
-0.9253535, -0.8124321, -2.040091, 0.8431373, 1, 0, 1,
-0.9211079, 0.8572699, -0.509246, 0.8352941, 1, 0, 1,
-0.91733, 0.3108892, -3.159189, 0.8313726, 1, 0, 1,
-0.9148485, 0.9896787, -2.191998, 0.8235294, 1, 0, 1,
-0.9110624, -0.8075643, -2.075163, 0.8196079, 1, 0, 1,
-0.907077, -0.6677637, -2.113409, 0.8117647, 1, 0, 1,
-0.9038218, 1.30845, -1.158312, 0.8078431, 1, 0, 1,
-0.8975167, -0.1909525, -0.4759346, 0.8, 1, 0, 1,
-0.8946846, 0.6272275, -2.446885, 0.7921569, 1, 0, 1,
-0.8925535, 0.3734689, -0.3427216, 0.7882353, 1, 0, 1,
-0.8914758, 0.1313318, -0.9467681, 0.7803922, 1, 0, 1,
-0.8884902, 0.7763659, -0.8695596, 0.7764706, 1, 0, 1,
-0.8807231, -0.1219626, -1.619431, 0.7686275, 1, 0, 1,
-0.8740882, 1.611909, -0.3748951, 0.7647059, 1, 0, 1,
-0.8724359, -0.2270282, -3.481841, 0.7568628, 1, 0, 1,
-0.8721839, -0.7046898, -3.206643, 0.7529412, 1, 0, 1,
-0.8715885, 0.7814547, -1.074944, 0.7450981, 1, 0, 1,
-0.868374, 0.8629407, -0.3793756, 0.7411765, 1, 0, 1,
-0.8668595, -1.232709, -0.8761756, 0.7333333, 1, 0, 1,
-0.8646762, 1.02503, -0.8000156, 0.7294118, 1, 0, 1,
-0.8635408, -0.7128644, -0.4008579, 0.7215686, 1, 0, 1,
-0.8634521, 0.2274454, -1.892011, 0.7176471, 1, 0, 1,
-0.8618919, 0.1433568, -1.111347, 0.7098039, 1, 0, 1,
-0.8569905, 1.400763, -1.586009, 0.7058824, 1, 0, 1,
-0.8529515, 1.022799, 0.4432992, 0.6980392, 1, 0, 1,
-0.8504859, 0.2576528, -2.715602, 0.6901961, 1, 0, 1,
-0.8504301, -1.116372, -2.999215, 0.6862745, 1, 0, 1,
-0.8501309, 0.5314879, -1.138635, 0.6784314, 1, 0, 1,
-0.8448711, 0.09996608, -2.333076, 0.6745098, 1, 0, 1,
-0.8438244, -0.8224741, -4.967986, 0.6666667, 1, 0, 1,
-0.8408965, 2.78085, -1.844129, 0.6627451, 1, 0, 1,
-0.8389513, -1.51466, -2.42189, 0.654902, 1, 0, 1,
-0.8361683, 0.6414649, -0.9631878, 0.6509804, 1, 0, 1,
-0.8295233, 0.1518792, -3.309296, 0.6431373, 1, 0, 1,
-0.8288665, -1.292099, -4.684323, 0.6392157, 1, 0, 1,
-0.8213153, -0.2628855, -2.431204, 0.6313726, 1, 0, 1,
-0.8185356, 1.108473, -1.726244, 0.627451, 1, 0, 1,
-0.8184746, 0.0884604, -1.876441, 0.6196079, 1, 0, 1,
-0.8172245, 0.6154792, -1.632514, 0.6156863, 1, 0, 1,
-0.8169103, 1.150574, -1.304364, 0.6078432, 1, 0, 1,
-0.8152328, 1.812078, -0.5864422, 0.6039216, 1, 0, 1,
-0.8150421, 0.6672717, 0.1891315, 0.5960785, 1, 0, 1,
-0.8149195, -0.0216243, -2.806966, 0.5882353, 1, 0, 1,
-0.8064291, 0.4195876, -0.0306323, 0.5843138, 1, 0, 1,
-0.8002464, 0.009397799, -2.220519, 0.5764706, 1, 0, 1,
-0.7946556, 0.2376252, -1.787484, 0.572549, 1, 0, 1,
-0.7916639, 2.393131, -1.024618, 0.5647059, 1, 0, 1,
-0.7900479, 1.343773, -1.201372, 0.5607843, 1, 0, 1,
-0.7830007, -0.3964984, -3.018911, 0.5529412, 1, 0, 1,
-0.7824934, 0.05090133, -1.36658, 0.5490196, 1, 0, 1,
-0.7819853, -0.06485517, -3.209717, 0.5411765, 1, 0, 1,
-0.7761718, 0.8154332, 1.177661, 0.5372549, 1, 0, 1,
-0.7759793, 0.3445187, -1.580451, 0.5294118, 1, 0, 1,
-0.7725281, 0.6737181, -0.918052, 0.5254902, 1, 0, 1,
-0.7618745, -0.6211193, -1.773346, 0.5176471, 1, 0, 1,
-0.7576699, 0.9861509, -1.350909, 0.5137255, 1, 0, 1,
-0.7526146, 0.2194349, -2.758485, 0.5058824, 1, 0, 1,
-0.7512226, 0.5864347, -1.328981, 0.5019608, 1, 0, 1,
-0.7364567, 0.8606912, -3.635138, 0.4941176, 1, 0, 1,
-0.7338197, 0.2671825, -2.081644, 0.4862745, 1, 0, 1,
-0.7321145, 0.6173874, 0.08879329, 0.4823529, 1, 0, 1,
-0.7127366, -0.9817365, -1.846515, 0.4745098, 1, 0, 1,
-0.7123163, 0.6147255, -1.209265, 0.4705882, 1, 0, 1,
-0.7116888, -0.2500046, -1.509328, 0.4627451, 1, 0, 1,
-0.7103919, 0.1265608, -1.98846, 0.4588235, 1, 0, 1,
-0.7085456, 0.01055524, -2.461151, 0.4509804, 1, 0, 1,
-0.7047517, -1.004847, -4.330454, 0.4470588, 1, 0, 1,
-0.7013633, -1.498925, -3.209012, 0.4392157, 1, 0, 1,
-0.6991092, -0.3431754, 0.007783694, 0.4352941, 1, 0, 1,
-0.6988774, -0.3744466, -1.899028, 0.427451, 1, 0, 1,
-0.6934868, -0.3440321, -2.01991, 0.4235294, 1, 0, 1,
-0.6928404, -0.6732916, -3.444715, 0.4156863, 1, 0, 1,
-0.6860347, 0.8973349, -2.185148, 0.4117647, 1, 0, 1,
-0.6838114, 0.3334956, 0.2283099, 0.4039216, 1, 0, 1,
-0.6758003, -0.268168, -2.11438, 0.3960784, 1, 0, 1,
-0.6747848, -0.01530514, -2.548185, 0.3921569, 1, 0, 1,
-0.6675222, 0.5074875, -0.2074575, 0.3843137, 1, 0, 1,
-0.662699, -0.9245164, -2.801026, 0.3803922, 1, 0, 1,
-0.6521754, -0.4084204, -0.9645221, 0.372549, 1, 0, 1,
-0.6489015, -0.5276236, -2.071506, 0.3686275, 1, 0, 1,
-0.6478063, 0.594941, -0.03009933, 0.3607843, 1, 0, 1,
-0.6428886, 1.106898, 0.3349418, 0.3568628, 1, 0, 1,
-0.6428462, 0.07619529, -1.960667, 0.3490196, 1, 0, 1,
-0.6351856, 0.5683275, -0.4923468, 0.345098, 1, 0, 1,
-0.6286233, 0.2708348, -1.939542, 0.3372549, 1, 0, 1,
-0.6279323, 0.3033812, -1.045977, 0.3333333, 1, 0, 1,
-0.623355, 0.3994798, -1.325031, 0.3254902, 1, 0, 1,
-0.6152647, -1.004787, -2.388589, 0.3215686, 1, 0, 1,
-0.613412, -0.6120262, -2.594512, 0.3137255, 1, 0, 1,
-0.608622, -0.0946597, -1.973485, 0.3098039, 1, 0, 1,
-0.6081668, -1.030651, -1.278136, 0.3019608, 1, 0, 1,
-0.5998698, 0.7733918, -0.7837324, 0.2941177, 1, 0, 1,
-0.5979654, -1.139189, -2.250505, 0.2901961, 1, 0, 1,
-0.591454, -0.4148523, -1.990249, 0.282353, 1, 0, 1,
-0.5905792, 0.2044133, -0.8232163, 0.2784314, 1, 0, 1,
-0.588215, 0.1784474, -1.08748, 0.2705882, 1, 0, 1,
-0.5811093, 1.790088, -0.6638854, 0.2666667, 1, 0, 1,
-0.5799126, 0.8081869, 0.7100279, 0.2588235, 1, 0, 1,
-0.5773672, 0.2436449, 0.09801563, 0.254902, 1, 0, 1,
-0.5761625, 0.7197577, -0.509932, 0.2470588, 1, 0, 1,
-0.5734169, 0.1086574, -1.275544, 0.2431373, 1, 0, 1,
-0.5726117, 0.249692, -1.781074, 0.2352941, 1, 0, 1,
-0.5623498, 0.5834236, -1.591502, 0.2313726, 1, 0, 1,
-0.5588783, 0.6746166, -1.358606, 0.2235294, 1, 0, 1,
-0.5583484, 1.087967, 0.3339841, 0.2196078, 1, 0, 1,
-0.5573537, -0.4790924, -2.973077, 0.2117647, 1, 0, 1,
-0.5552337, -0.6862618, -2.6295, 0.2078431, 1, 0, 1,
-0.5546719, -0.4717248, -2.698753, 0.2, 1, 0, 1,
-0.5499485, -1.003601, -2.472347, 0.1921569, 1, 0, 1,
-0.5498547, -0.07381334, -2.22091, 0.1882353, 1, 0, 1,
-0.5494544, -0.5287701, -0.2850534, 0.1803922, 1, 0, 1,
-0.546805, -1.539714, -3.629481, 0.1764706, 1, 0, 1,
-0.5458359, -0.2540731, -2.188078, 0.1686275, 1, 0, 1,
-0.5442287, -1.726061, -1.52617, 0.1647059, 1, 0, 1,
-0.5428324, -0.3076345, -3.416909, 0.1568628, 1, 0, 1,
-0.5401928, -0.8632427, -1.71543, 0.1529412, 1, 0, 1,
-0.536324, -0.4685921, -2.853708, 0.145098, 1, 0, 1,
-0.533825, 0.9070045, -1.49848, 0.1411765, 1, 0, 1,
-0.5313936, -1.327194, -2.293831, 0.1333333, 1, 0, 1,
-0.5241313, 1.157116, -1.207357, 0.1294118, 1, 0, 1,
-0.5184371, 1.602271, -0.7114235, 0.1215686, 1, 0, 1,
-0.5156476, -0.2209907, -1.954706, 0.1176471, 1, 0, 1,
-0.5028272, -0.1399332, -1.562713, 0.1098039, 1, 0, 1,
-0.5021989, -1.648578, -2.854637, 0.1058824, 1, 0, 1,
-0.5020558, 1.247813, -0.2827235, 0.09803922, 1, 0, 1,
-0.4995835, 0.3702367, 0.5642349, 0.09019608, 1, 0, 1,
-0.4990575, -0.6209733, -4.235081, 0.08627451, 1, 0, 1,
-0.4962336, 0.002250601, -2.547155, 0.07843138, 1, 0, 1,
-0.4945589, 0.9016176, -0.8616695, 0.07450981, 1, 0, 1,
-0.4901217, 1.105768, -0.09930054, 0.06666667, 1, 0, 1,
-0.4878715, -0.2943136, -2.694068, 0.0627451, 1, 0, 1,
-0.4849023, -2.310889, -1.977256, 0.05490196, 1, 0, 1,
-0.4826622, 1.416743, -1.35184, 0.05098039, 1, 0, 1,
-0.4821321, 0.10201, -1.452183, 0.04313726, 1, 0, 1,
-0.4813547, 0.8616258, 0.09925057, 0.03921569, 1, 0, 1,
-0.4808836, 0.5220184, 0.06443725, 0.03137255, 1, 0, 1,
-0.4805527, -0.8477047, -4.220366, 0.02745098, 1, 0, 1,
-0.4791616, 1.284584, 0.5923016, 0.01960784, 1, 0, 1,
-0.4765167, 0.258868, -0.7989649, 0.01568628, 1, 0, 1,
-0.4730617, -0.058003, -1.002074, 0.007843138, 1, 0, 1,
-0.4702164, 0.5268099, 0.2889187, 0.003921569, 1, 0, 1,
-0.4660923, -1.03274, -1.303283, 0, 1, 0.003921569, 1,
-0.4624276, -0.3796077, -2.842829, 0, 1, 0.01176471, 1,
-0.4578336, -1.537128, -3.520652, 0, 1, 0.01568628, 1,
-0.4531091, 0.3836901, 0.02437656, 0, 1, 0.02352941, 1,
-0.4511852, -0.601445, -2.793701, 0, 1, 0.02745098, 1,
-0.4481278, 1.230528, -1.162041, 0, 1, 0.03529412, 1,
-0.4430677, -2.508472, -2.449657, 0, 1, 0.03921569, 1,
-0.4402429, 2.379248, -0.03721299, 0, 1, 0.04705882, 1,
-0.4401142, -1.904508, -2.71812, 0, 1, 0.05098039, 1,
-0.4304889, 0.2881347, 0.01965115, 0, 1, 0.05882353, 1,
-0.4285508, 0.0357086, -1.027053, 0, 1, 0.0627451, 1,
-0.423274, -0.7040569, -1.893542, 0, 1, 0.07058824, 1,
-0.4144636, -0.7868801, -2.386696, 0, 1, 0.07450981, 1,
-0.4144014, -1.153878, -1.733101, 0, 1, 0.08235294, 1,
-0.4136573, 1.199529, -2.236264, 0, 1, 0.08627451, 1,
-0.4103292, -0.5312123, -1.89579, 0, 1, 0.09411765, 1,
-0.4090849, 1.978696, 0.1995015, 0, 1, 0.1019608, 1,
-0.4079506, -1.80327, -2.853992, 0, 1, 0.1058824, 1,
-0.4045989, -0.679039, -2.989987, 0, 1, 0.1137255, 1,
-0.4025102, -0.7722848, -1.464038, 0, 1, 0.1176471, 1,
-0.3992662, 0.9077186, -1.213707, 0, 1, 0.1254902, 1,
-0.3987832, -0.6009412, -2.254741, 0, 1, 0.1294118, 1,
-0.3977352, 0.4301014, -0.8874622, 0, 1, 0.1372549, 1,
-0.3974854, -1.31813, -2.604861, 0, 1, 0.1411765, 1,
-0.397153, -0.5041824, -3.026371, 0, 1, 0.1490196, 1,
-0.3926943, -2.306172, -1.962481, 0, 1, 0.1529412, 1,
-0.3904465, 1.88222, -0.7768947, 0, 1, 0.1607843, 1,
-0.3898151, -0.7788815, -3.483524, 0, 1, 0.1647059, 1,
-0.3793294, -0.0524295, -0.9939755, 0, 1, 0.172549, 1,
-0.3791783, 0.9351334, 0.1280406, 0, 1, 0.1764706, 1,
-0.37309, -0.08948775, -1.277868, 0, 1, 0.1843137, 1,
-0.3669301, -0.1170982, -1.795577, 0, 1, 0.1882353, 1,
-0.361009, 0.1424531, -0.08332292, 0, 1, 0.1960784, 1,
-0.3604012, 0.1519641, -1.486393, 0, 1, 0.2039216, 1,
-0.3596183, 0.09744968, -3.54715, 0, 1, 0.2078431, 1,
-0.3583379, 0.1983165, -1.650403, 0, 1, 0.2156863, 1,
-0.3564915, 1.415458, 0.9840524, 0, 1, 0.2196078, 1,
-0.3528324, -0.1910114, -3.554679, 0, 1, 0.227451, 1,
-0.3523971, -1.509639, -2.101219, 0, 1, 0.2313726, 1,
-0.3516431, -0.2045766, -2.915723, 0, 1, 0.2392157, 1,
-0.3464461, -0.3825418, -1.606174, 0, 1, 0.2431373, 1,
-0.3462209, -0.6869038, -2.370576, 0, 1, 0.2509804, 1,
-0.3440449, -0.7278171, -0.9650401, 0, 1, 0.254902, 1,
-0.337608, 0.9069465, -0.326384, 0, 1, 0.2627451, 1,
-0.336115, 1.273488, 0.761177, 0, 1, 0.2666667, 1,
-0.334793, 2.261085, 0.7160449, 0, 1, 0.2745098, 1,
-0.3343072, 0.8084782, -1.386838, 0, 1, 0.2784314, 1,
-0.3331352, 0.5516652, -2.530724, 0, 1, 0.2862745, 1,
-0.3303343, 0.3989668, -2.18427, 0, 1, 0.2901961, 1,
-0.3301908, -0.1105114, -1.444536, 0, 1, 0.2980392, 1,
-0.3301335, 1.34787, -0.946254, 0, 1, 0.3058824, 1,
-0.3240705, 0.01083561, -1.817221, 0, 1, 0.3098039, 1,
-0.3221708, 0.3012238, 0.1314946, 0, 1, 0.3176471, 1,
-0.3199543, -0.8118896, -1.629011, 0, 1, 0.3215686, 1,
-0.3198207, 0.9795601, -2.01923, 0, 1, 0.3294118, 1,
-0.3190374, 0.5437759, 0.06142315, 0, 1, 0.3333333, 1,
-0.3179675, 1.076915, 0.1502367, 0, 1, 0.3411765, 1,
-0.3165889, -0.436367, -2.867923, 0, 1, 0.345098, 1,
-0.3148911, 0.0621477, -2.297654, 0, 1, 0.3529412, 1,
-0.3112336, 1.20392, -1.476768, 0, 1, 0.3568628, 1,
-0.3083418, 0.6409408, -1.54864, 0, 1, 0.3647059, 1,
-0.3082311, 0.9797804, -0.3523323, 0, 1, 0.3686275, 1,
-0.3047851, -0.8768669, -2.640043, 0, 1, 0.3764706, 1,
-0.3017748, 1.682547, -1.223938, 0, 1, 0.3803922, 1,
-0.301259, -1.993219, -3.367491, 0, 1, 0.3882353, 1,
-0.3005034, 0.3264456, 0.06074429, 0, 1, 0.3921569, 1,
-0.2974336, -0.4195355, -3.060786, 0, 1, 0.4, 1,
-0.2962274, -0.617575, -3.683718, 0, 1, 0.4078431, 1,
-0.2926526, 0.5948052, 0.09007524, 0, 1, 0.4117647, 1,
-0.2898281, -1.494114, -3.325474, 0, 1, 0.4196078, 1,
-0.2898174, -0.2345056, -3.40487, 0, 1, 0.4235294, 1,
-0.2874188, -1.446546, -2.847293, 0, 1, 0.4313726, 1,
-0.2836138, 0.213735, -1.353473, 0, 1, 0.4352941, 1,
-0.2781983, -0.3628429, -2.159472, 0, 1, 0.4431373, 1,
-0.2756033, 0.3419388, -0.6460189, 0, 1, 0.4470588, 1,
-0.275114, -0.5172528, -3.112704, 0, 1, 0.454902, 1,
-0.2721121, 0.3468663, 0.05483937, 0, 1, 0.4588235, 1,
-0.2645835, 0.6291215, -0.8782535, 0, 1, 0.4666667, 1,
-0.2630467, -0.2049669, -2.333009, 0, 1, 0.4705882, 1,
-0.2594732, 0.3013828, -0.9084342, 0, 1, 0.4784314, 1,
-0.2594141, 0.9998609, -0.3502085, 0, 1, 0.4823529, 1,
-0.2593873, 0.2954437, -2.45136, 0, 1, 0.4901961, 1,
-0.2529905, 1.985855, 0.06223183, 0, 1, 0.4941176, 1,
-0.2525171, -0.1841995, -3.208326, 0, 1, 0.5019608, 1,
-0.2496072, -0.5858084, -2.972295, 0, 1, 0.509804, 1,
-0.2479406, 0.5678203, -0.06691055, 0, 1, 0.5137255, 1,
-0.2473825, 1.450549, 0.07015456, 0, 1, 0.5215687, 1,
-0.2468143, 1.890133, -0.5715671, 0, 1, 0.5254902, 1,
-0.2458088, 0.7653536, 1.181664, 0, 1, 0.5333334, 1,
-0.2436217, -0.2651656, -1.660112, 0, 1, 0.5372549, 1,
-0.2410573, 0.3019354, -1.173919, 0, 1, 0.5450981, 1,
-0.2287097, -0.4901323, -3.26842, 0, 1, 0.5490196, 1,
-0.226615, 0.5592532, -1.572288, 0, 1, 0.5568628, 1,
-0.2260666, 0.7103911, 0.009852177, 0, 1, 0.5607843, 1,
-0.2259754, -1.042739, -6.610478, 0, 1, 0.5686275, 1,
-0.2241505, -0.9677699, -3.262637, 0, 1, 0.572549, 1,
-0.2216624, 0.7705665, 1.453807, 0, 1, 0.5803922, 1,
-0.2205517, 1.918486, -1.206437, 0, 1, 0.5843138, 1,
-0.217226, -0.2186401, -3.549293, 0, 1, 0.5921569, 1,
-0.2161851, -0.3212771, -2.541509, 0, 1, 0.5960785, 1,
-0.2139131, -0.5584937, -4.093929, 0, 1, 0.6039216, 1,
-0.2117802, -0.1994683, 0.6391381, 0, 1, 0.6117647, 1,
-0.2096222, -0.6461921, -3.770017, 0, 1, 0.6156863, 1,
-0.2048118, 0.395917, -1.270513, 0, 1, 0.6235294, 1,
-0.2047082, 0.4588507, -2.945788, 0, 1, 0.627451, 1,
-0.2042644, -1.022142, -3.891686, 0, 1, 0.6352941, 1,
-0.1998123, -0.9302425, -3.655388, 0, 1, 0.6392157, 1,
-0.1971402, 1.055055, -0.1598672, 0, 1, 0.6470588, 1,
-0.1966817, 1.410061, 1.083844, 0, 1, 0.6509804, 1,
-0.1957428, 0.2308234, -0.9777023, 0, 1, 0.6588235, 1,
-0.1880549, -0.07549044, -1.985684, 0, 1, 0.6627451, 1,
-0.1879542, 0.5016903, -0.1167466, 0, 1, 0.6705883, 1,
-0.1868148, -0.3439321, -3.288226, 0, 1, 0.6745098, 1,
-0.1866516, 0.6029453, 0.1174141, 0, 1, 0.682353, 1,
-0.1852386, -0.4614152, -1.600186, 0, 1, 0.6862745, 1,
-0.1845987, 0.4235401, -0.5892671, 0, 1, 0.6941177, 1,
-0.1818411, -0.458659, -2.421807, 0, 1, 0.7019608, 1,
-0.1805647, -0.2476487, -3.051869, 0, 1, 0.7058824, 1,
-0.1792798, -0.2817445, -3.408743, 0, 1, 0.7137255, 1,
-0.1766994, 0.2679724, -0.6609597, 0, 1, 0.7176471, 1,
-0.1663054, -0.8569762, -0.5894716, 0, 1, 0.7254902, 1,
-0.1651395, 0.9845309, -0.7231323, 0, 1, 0.7294118, 1,
-0.1634165, 1.55317, 0.6103937, 0, 1, 0.7372549, 1,
-0.1626388, 0.7118274, 1.18642, 0, 1, 0.7411765, 1,
-0.1608644, -0.2707233, -1.679129, 0, 1, 0.7490196, 1,
-0.1580817, 1.000721, -0.09900729, 0, 1, 0.7529412, 1,
-0.1569265, -0.8813644, -2.396725, 0, 1, 0.7607843, 1,
-0.1524699, 1.287964, 1.139494, 0, 1, 0.7647059, 1,
-0.1417443, -0.135906, -2.093153, 0, 1, 0.772549, 1,
-0.1390305, -0.5233175, -3.574872, 0, 1, 0.7764706, 1,
-0.1375338, -1.373806, -2.977852, 0, 1, 0.7843137, 1,
-0.1375275, -0.05356534, -3.610108, 0, 1, 0.7882353, 1,
-0.1353027, -0.4789857, -2.972272, 0, 1, 0.7960784, 1,
-0.1318718, -0.1079759, -2.127074, 0, 1, 0.8039216, 1,
-0.1308536, 1.756449, 0.7142372, 0, 1, 0.8078431, 1,
-0.1299636, -0.4634183, -3.819821, 0, 1, 0.8156863, 1,
-0.1294345, 1.092439, -1.669751, 0, 1, 0.8196079, 1,
-0.1253127, -0.3965476, -2.676327, 0, 1, 0.827451, 1,
-0.1246101, 0.5379519, -0.1334053, 0, 1, 0.8313726, 1,
-0.1240634, 0.3994903, -3.825864, 0, 1, 0.8392157, 1,
-0.1217548, 1.809124, -0.134985, 0, 1, 0.8431373, 1,
-0.1199092, -0.2970918, -3.200695, 0, 1, 0.8509804, 1,
-0.1168488, -1.286925, -3.748578, 0, 1, 0.854902, 1,
-0.1142124, -0.6249315, -3.092721, 0, 1, 0.8627451, 1,
-0.1125597, 0.01076349, -0.5468481, 0, 1, 0.8666667, 1,
-0.1052556, -0.782374, -2.312976, 0, 1, 0.8745098, 1,
-0.1050421, -0.3061073, -1.949742, 0, 1, 0.8784314, 1,
-0.1026571, 1.529153, -0.5154404, 0, 1, 0.8862745, 1,
-0.1014422, -1.741513, -2.216722, 0, 1, 0.8901961, 1,
-0.1008858, -0.6934463, -2.925226, 0, 1, 0.8980392, 1,
-0.09565232, -0.1455603, -4.801974, 0, 1, 0.9058824, 1,
-0.08729904, 0.7418148, -1.432699, 0, 1, 0.9098039, 1,
-0.08531005, -0.2875844, -4.08793, 0, 1, 0.9176471, 1,
-0.07658312, -0.001561618, -0.9732841, 0, 1, 0.9215686, 1,
-0.0738318, -1.696893, -5.253188, 0, 1, 0.9294118, 1,
-0.07366359, -0.5604696, -4.030652, 0, 1, 0.9333333, 1,
-0.06637371, -2.155169, -3.32078, 0, 1, 0.9411765, 1,
-0.06455722, -0.2392755, -2.981625, 0, 1, 0.945098, 1,
-0.05837204, 0.1305383, -0.5495024, 0, 1, 0.9529412, 1,
-0.05309391, 0.9043676, -1.179072, 0, 1, 0.9568627, 1,
-0.052113, 0.2729193, 0.1551747, 0, 1, 0.9647059, 1,
-0.04516239, 1.175552, -1.709386, 0, 1, 0.9686275, 1,
-0.04381762, 1.848592, -1.221006, 0, 1, 0.9764706, 1,
-0.04283457, -1.380305, -3.769341, 0, 1, 0.9803922, 1,
-0.04241347, -1.3703, -2.50291, 0, 1, 0.9882353, 1,
-0.03949859, -1.616782, -4.492262, 0, 1, 0.9921569, 1,
-0.0312588, -0.4215858, -3.184917, 0, 1, 1, 1,
-0.03015153, -1.004515, -4.655221, 0, 0.9921569, 1, 1,
-0.02829642, -0.4680721, -3.34769, 0, 0.9882353, 1, 1,
-0.02491116, 0.366369, 0.7078509, 0, 0.9803922, 1, 1,
-0.02397686, 2.060582, 1.452123, 0, 0.9764706, 1, 1,
-0.02087847, -0.8154614, -3.636007, 0, 0.9686275, 1, 1,
-0.01535961, -1.235004, -3.075442, 0, 0.9647059, 1, 1,
-0.00577132, -0.2258373, -3.168528, 0, 0.9568627, 1, 1,
-0.005441977, 0.03834618, -1.425263, 0, 0.9529412, 1, 1,
-0.002303032, 0.04664707, -1.545056, 0, 0.945098, 1, 1,
-0.002061738, -0.7198623, -2.14223, 0, 0.9411765, 1, 1,
-0.0005570967, -0.02120224, -3.74737, 0, 0.9333333, 1, 1,
0.01006886, 0.8739772, -0.4241296, 0, 0.9294118, 1, 1,
0.01084643, -0.2953948, 0.2958621, 0, 0.9215686, 1, 1,
0.01177055, 1.113714, 1.275419, 0, 0.9176471, 1, 1,
0.01213158, 0.8337716, 0.7603943, 0, 0.9098039, 1, 1,
0.01314246, -0.4702661, 3.069814, 0, 0.9058824, 1, 1,
0.01365625, 0.3176831, -0.1356608, 0, 0.8980392, 1, 1,
0.01489222, 1.206556, 1.227292, 0, 0.8901961, 1, 1,
0.01498419, 0.9470636, 1.306207, 0, 0.8862745, 1, 1,
0.01641412, 0.8027547, -1.391174, 0, 0.8784314, 1, 1,
0.02042893, -1.16595, 3.225212, 0, 0.8745098, 1, 1,
0.02058896, -0.02934616, 2.331753, 0, 0.8666667, 1, 1,
0.02226638, -1.611796, 2.702852, 0, 0.8627451, 1, 1,
0.02235849, -0.05697484, 3.07805, 0, 0.854902, 1, 1,
0.02566966, -0.7484781, 1.809441, 0, 0.8509804, 1, 1,
0.02699842, -0.554329, 4.201332, 0, 0.8431373, 1, 1,
0.02783391, -0.5293591, 2.571254, 0, 0.8392157, 1, 1,
0.03435593, -2.975208, 2.580074, 0, 0.8313726, 1, 1,
0.03510937, 0.1923126, 0.2246305, 0, 0.827451, 1, 1,
0.04079838, 0.9924535, 0.7088478, 0, 0.8196079, 1, 1,
0.04164061, -0.8787633, 2.541047, 0, 0.8156863, 1, 1,
0.04401399, -1.048567, 3.28755, 0, 0.8078431, 1, 1,
0.04534035, -0.1955405, 3.192689, 0, 0.8039216, 1, 1,
0.04559904, -1.035897, 1.566481, 0, 0.7960784, 1, 1,
0.05101792, -0.6310641, 2.445532, 0, 0.7882353, 1, 1,
0.05819469, -0.7423787, 2.967998, 0, 0.7843137, 1, 1,
0.0666307, -0.5549861, 3.554054, 0, 0.7764706, 1, 1,
0.06756856, 0.1046736, 0.5439392, 0, 0.772549, 1, 1,
0.07070208, -1.213269, 4.002514, 0, 0.7647059, 1, 1,
0.07895112, -1.306784, 1.683914, 0, 0.7607843, 1, 1,
0.08543423, -0.2441695, 1.642449, 0, 0.7529412, 1, 1,
0.08768082, -0.9210168, 3.631563, 0, 0.7490196, 1, 1,
0.08803201, 0.1580173, 0.9506749, 0, 0.7411765, 1, 1,
0.08938152, -0.9807679, 2.785861, 0, 0.7372549, 1, 1,
0.08977507, -0.124968, 2.189278, 0, 0.7294118, 1, 1,
0.09064075, 0.05306635, 2.141166, 0, 0.7254902, 1, 1,
0.09185433, 0.7657191, 0.02057681, 0, 0.7176471, 1, 1,
0.09275914, 1.098837, 1.178048, 0, 0.7137255, 1, 1,
0.09738412, -0.4183098, 3.679269, 0, 0.7058824, 1, 1,
0.1005903, -1.623911, 1.630447, 0, 0.6980392, 1, 1,
0.1007204, -1.757396, 3.274004, 0, 0.6941177, 1, 1,
0.1046303, 0.7795578, -1.132375, 0, 0.6862745, 1, 1,
0.1068261, -1.738602, 3.527135, 0, 0.682353, 1, 1,
0.1069665, -0.02979907, 1.506584, 0, 0.6745098, 1, 1,
0.1155821, 0.2928858, 0.6717298, 0, 0.6705883, 1, 1,
0.1211829, -1.123229, 2.903295, 0, 0.6627451, 1, 1,
0.1274636, -0.7601312, 1.999828, 0, 0.6588235, 1, 1,
0.1280462, -0.9511165, 1.938563, 0, 0.6509804, 1, 1,
0.1300512, 0.4491111, 0.6419936, 0, 0.6470588, 1, 1,
0.1308621, -1.170456, 3.223118, 0, 0.6392157, 1, 1,
0.1351192, -1.033458, 3.563904, 0, 0.6352941, 1, 1,
0.1380451, 0.8541504, -0.1196962, 0, 0.627451, 1, 1,
0.1429643, 1.30591, 1.701311, 0, 0.6235294, 1, 1,
0.1461632, 1.578424, 2.170474, 0, 0.6156863, 1, 1,
0.1499578, -0.3453659, 1.734117, 0, 0.6117647, 1, 1,
0.1539295, 0.1045099, 3.690759, 0, 0.6039216, 1, 1,
0.1567522, -1.014055, 4.564816, 0, 0.5960785, 1, 1,
0.1583613, 0.4260831, -0.5010002, 0, 0.5921569, 1, 1,
0.1585258, 0.6741778, 1.284547, 0, 0.5843138, 1, 1,
0.1611385, 0.0394511, 2.124076, 0, 0.5803922, 1, 1,
0.1614268, -0.244052, 2.879775, 0, 0.572549, 1, 1,
0.1666695, -0.1419097, 1.07146, 0, 0.5686275, 1, 1,
0.1666768, -0.7831875, 2.279953, 0, 0.5607843, 1, 1,
0.1668439, -0.7250828, 3.02608, 0, 0.5568628, 1, 1,
0.1701735, -0.5552707, 1.88885, 0, 0.5490196, 1, 1,
0.1705679, -0.4352559, 4.910704, 0, 0.5450981, 1, 1,
0.1756999, -2.403791, 5.272676, 0, 0.5372549, 1, 1,
0.1767062, 1.827692, 0.1253586, 0, 0.5333334, 1, 1,
0.1770962, -1.927752, 4.02005, 0, 0.5254902, 1, 1,
0.178409, 0.3427803, 1.09299, 0, 0.5215687, 1, 1,
0.1787748, 1.6122, 1.879982, 0, 0.5137255, 1, 1,
0.1872846, -0.6451563, 3.959632, 0, 0.509804, 1, 1,
0.187633, 1.575983, 0.1600345, 0, 0.5019608, 1, 1,
0.1947906, -0.9373654, 4.406809, 0, 0.4941176, 1, 1,
0.1953541, -0.01746941, 1.293921, 0, 0.4901961, 1, 1,
0.1957612, -1.015392, 3.936096, 0, 0.4823529, 1, 1,
0.2000558, 0.9330716, 0.4836245, 0, 0.4784314, 1, 1,
0.2052368, 0.2380531, 0.4102195, 0, 0.4705882, 1, 1,
0.2079529, 0.3794447, -1.006084, 0, 0.4666667, 1, 1,
0.2087463, 1.455844, -1.061645, 0, 0.4588235, 1, 1,
0.2106887, 1.504211, 0.1586309, 0, 0.454902, 1, 1,
0.2118259, -0.116976, 1.222263, 0, 0.4470588, 1, 1,
0.2135333, 2.098588, -0.3353151, 0, 0.4431373, 1, 1,
0.2159455, 1.151676, -1.800802, 0, 0.4352941, 1, 1,
0.2170648, -0.4966911, 3.887415, 0, 0.4313726, 1, 1,
0.2184569, 1.458715, 0.3110044, 0, 0.4235294, 1, 1,
0.2198454, 0.2833273, -0.3928322, 0, 0.4196078, 1, 1,
0.2202487, -0.3966394, 3.92309, 0, 0.4117647, 1, 1,
0.2227097, -1.042209, 5.031888, 0, 0.4078431, 1, 1,
0.2265514, 0.6221751, 0.3507401, 0, 0.4, 1, 1,
0.2329666, -0.6177171, 2.695242, 0, 0.3921569, 1, 1,
0.2349393, -0.3242327, 2.65934, 0, 0.3882353, 1, 1,
0.2361452, 0.279639, 0.5586413, 0, 0.3803922, 1, 1,
0.236794, 0.3403844, -0.01341708, 0, 0.3764706, 1, 1,
0.238695, -0.8487905, 4.3517, 0, 0.3686275, 1, 1,
0.2397777, 0.7978782, 0.5873389, 0, 0.3647059, 1, 1,
0.2448934, -0.3567593, 3.94113, 0, 0.3568628, 1, 1,
0.2562377, -0.1885108, 1.619206, 0, 0.3529412, 1, 1,
0.2565641, 0.4750356, -1.209137, 0, 0.345098, 1, 1,
0.261515, 1.312601, 0.3231709, 0, 0.3411765, 1, 1,
0.2617997, -0.4693383, 3.758623, 0, 0.3333333, 1, 1,
0.2671629, 0.004713452, 1.383506, 0, 0.3294118, 1, 1,
0.2681569, -0.1033678, 2.872448, 0, 0.3215686, 1, 1,
0.2685665, 0.5657294, 1.378616, 0, 0.3176471, 1, 1,
0.2691458, -1.656973, 2.231083, 0, 0.3098039, 1, 1,
0.2721266, 1.530592, 0.9405629, 0, 0.3058824, 1, 1,
0.27837, 0.5586842, 0.502728, 0, 0.2980392, 1, 1,
0.2805434, 0.6901855, 0.2865308, 0, 0.2901961, 1, 1,
0.2823554, -0.6380157, 3.95878, 0, 0.2862745, 1, 1,
0.2917804, 0.205212, -0.249965, 0, 0.2784314, 1, 1,
0.292277, 0.3594821, 3.087699, 0, 0.2745098, 1, 1,
0.2951499, 0.4478382, 0.392997, 0, 0.2666667, 1, 1,
0.2966754, 1.184077, 1.131138, 0, 0.2627451, 1, 1,
0.2969994, -2.202782, 2.135945, 0, 0.254902, 1, 1,
0.3046456, 0.1444602, 0.3574579, 0, 0.2509804, 1, 1,
0.3051207, -1.952806, 2.451696, 0, 0.2431373, 1, 1,
0.3059708, 0.02899389, 1.294075, 0, 0.2392157, 1, 1,
0.3100311, 2.155035, -0.1521574, 0, 0.2313726, 1, 1,
0.3107572, -0.8175887, 3.553409, 0, 0.227451, 1, 1,
0.3132311, 1.670502, -0.7134503, 0, 0.2196078, 1, 1,
0.3159743, 0.1052723, 1.357143, 0, 0.2156863, 1, 1,
0.3212023, -1.046622, 3.615415, 0, 0.2078431, 1, 1,
0.3215907, -1.435327, 2.425625, 0, 0.2039216, 1, 1,
0.3237796, 2.219724, -0.2384883, 0, 0.1960784, 1, 1,
0.3261626, -0.02110852, 2.248856, 0, 0.1882353, 1, 1,
0.3310862, 0.2037458, 2.120493, 0, 0.1843137, 1, 1,
0.3444727, -0.4408247, 1.326012, 0, 0.1764706, 1, 1,
0.3446954, 0.535307, -0.04940221, 0, 0.172549, 1, 1,
0.3463688, 0.9122627, 0.9303244, 0, 0.1647059, 1, 1,
0.3507186, -0.2386352, 2.078679, 0, 0.1607843, 1, 1,
0.3539517, 1.029672, -1.28999, 0, 0.1529412, 1, 1,
0.3564538, 0.5344191, -0.1178553, 0, 0.1490196, 1, 1,
0.3593922, -1.260902, 4.596377, 0, 0.1411765, 1, 1,
0.3602496, -0.2202366, 0.8468667, 0, 0.1372549, 1, 1,
0.3622954, 0.6172932, -0.9821081, 0, 0.1294118, 1, 1,
0.3679301, -0.2514031, 3.968727, 0, 0.1254902, 1, 1,
0.3757282, 1.20099, -1.137254, 0, 0.1176471, 1, 1,
0.3785415, -0.3483703, 1.672407, 0, 0.1137255, 1, 1,
0.3818847, 1.114437, 0.4747334, 0, 0.1058824, 1, 1,
0.382712, 0.7062794, 1.086509, 0, 0.09803922, 1, 1,
0.3862368, -0.04315151, 0.873349, 0, 0.09411765, 1, 1,
0.3881654, 0.1721168, 1.805984, 0, 0.08627451, 1, 1,
0.3887862, -0.7748732, 2.455933, 0, 0.08235294, 1, 1,
0.399661, -0.04895274, 1.859719, 0, 0.07450981, 1, 1,
0.4069529, -0.09540793, 2.849834, 0, 0.07058824, 1, 1,
0.4099112, -0.1780235, 1.757913, 0, 0.0627451, 1, 1,
0.4108548, -2.221177, 0.5500722, 0, 0.05882353, 1, 1,
0.4160361, -1.202319, 3.585141, 0, 0.05098039, 1, 1,
0.4170899, 0.3666366, 1.777066, 0, 0.04705882, 1, 1,
0.4174185, 1.113154, -0.4796346, 0, 0.03921569, 1, 1,
0.4193781, -0.4270431, 4.653071, 0, 0.03529412, 1, 1,
0.4256088, 0.7125277, -0.6434031, 0, 0.02745098, 1, 1,
0.4268929, -0.1767234, 0.889172, 0, 0.02352941, 1, 1,
0.4282122, 0.8384351, 1.710336, 0, 0.01568628, 1, 1,
0.4343091, 0.4337429, 0.05370208, 0, 0.01176471, 1, 1,
0.434754, 0.4216859, 0.01285123, 0, 0.003921569, 1, 1,
0.4377508, -0.9348131, 1.250493, 0.003921569, 0, 1, 1,
0.4380437, -0.6844544, 2.280758, 0.007843138, 0, 1, 1,
0.4382348, -0.2503588, 3.135645, 0.01568628, 0, 1, 1,
0.4390651, 0.4977576, -0.1690708, 0.01960784, 0, 1, 1,
0.441815, -1.182757, 2.338653, 0.02745098, 0, 1, 1,
0.4427458, -0.3281365, 2.912699, 0.03137255, 0, 1, 1,
0.4441848, 2.403551, -0.007478961, 0.03921569, 0, 1, 1,
0.4457553, -0.1685328, 0.3056948, 0.04313726, 0, 1, 1,
0.4460375, 1.510483, 0.7936585, 0.05098039, 0, 1, 1,
0.4467003, -0.006315611, -0.02322228, 0.05490196, 0, 1, 1,
0.4475367, 0.5790659, 1.535563, 0.0627451, 0, 1, 1,
0.4493142, 0.8215951, 0.5736051, 0.06666667, 0, 1, 1,
0.4498282, -0.8963924, 3.138913, 0.07450981, 0, 1, 1,
0.4533983, -0.005996525, 1.396434, 0.07843138, 0, 1, 1,
0.4540323, 0.4358869, 0.1345771, 0.08627451, 0, 1, 1,
0.4548706, -0.5584344, 3.193388, 0.09019608, 0, 1, 1,
0.4585185, -0.03331632, 2.337355, 0.09803922, 0, 1, 1,
0.4676251, 2.210923, 2.175764, 0.1058824, 0, 1, 1,
0.4733361, -0.9438091, 1.681315, 0.1098039, 0, 1, 1,
0.4768304, 0.2654872, -0.4918137, 0.1176471, 0, 1, 1,
0.4830081, -0.6902789, 2.755044, 0.1215686, 0, 1, 1,
0.4831859, 0.9976996, -0.1387064, 0.1294118, 0, 1, 1,
0.4833564, -0.2082839, 1.580566, 0.1333333, 0, 1, 1,
0.4847305, 0.5493127, -0.2397629, 0.1411765, 0, 1, 1,
0.486344, -0.05633106, 0.4864947, 0.145098, 0, 1, 1,
0.495824, 0.9566309, 0.6380003, 0.1529412, 0, 1, 1,
0.4961962, 0.5513989, 1.194276, 0.1568628, 0, 1, 1,
0.4995938, 1.517325, -1.231872, 0.1647059, 0, 1, 1,
0.5017005, -0.5981234, 1.91648, 0.1686275, 0, 1, 1,
0.5021008, 0.4397666, 0.9985933, 0.1764706, 0, 1, 1,
0.5025419, 0.389208, -0.1301384, 0.1803922, 0, 1, 1,
0.5037899, 0.2590986, 0.3964474, 0.1882353, 0, 1, 1,
0.505404, -1.121299, 3.147327, 0.1921569, 0, 1, 1,
0.5065163, -0.3032521, 2.722065, 0.2, 0, 1, 1,
0.5083585, 0.3713527, -0.4643763, 0.2078431, 0, 1, 1,
0.5140445, -0.81461, 3.132144, 0.2117647, 0, 1, 1,
0.515196, 0.8357368, 2.329446, 0.2196078, 0, 1, 1,
0.515751, -0.2442213, 2.556888, 0.2235294, 0, 1, 1,
0.517503, -1.485956, 1.273009, 0.2313726, 0, 1, 1,
0.5196462, 1.436879, 0.147701, 0.2352941, 0, 1, 1,
0.5214665, 1.022687, 1.274107, 0.2431373, 0, 1, 1,
0.5233881, 1.262681, 1.304693, 0.2470588, 0, 1, 1,
0.5246639, 0.1278677, 3.029697, 0.254902, 0, 1, 1,
0.5340093, 0.6703738, 0.2900915, 0.2588235, 0, 1, 1,
0.5340668, -0.1398812, 1.52997, 0.2666667, 0, 1, 1,
0.5431481, -1.024598, 1.873205, 0.2705882, 0, 1, 1,
0.5460281, -0.2560151, 1.591787, 0.2784314, 0, 1, 1,
0.5532721, 1.877273, 0.5914221, 0.282353, 0, 1, 1,
0.5549843, -1.539636, 2.891213, 0.2901961, 0, 1, 1,
0.5585638, -1.227486, 2.732428, 0.2941177, 0, 1, 1,
0.5595686, 0.6235459, 1.520937, 0.3019608, 0, 1, 1,
0.560883, 1.666529, 1.85359, 0.3098039, 0, 1, 1,
0.5697436, -0.5209768, 2.02232, 0.3137255, 0, 1, 1,
0.5753272, 0.4994759, 1.678536, 0.3215686, 0, 1, 1,
0.5753504, 0.3269053, 0.05669281, 0.3254902, 0, 1, 1,
0.5804024, 0.3644545, -0.1940306, 0.3333333, 0, 1, 1,
0.5835844, 0.3833095, 2.336469, 0.3372549, 0, 1, 1,
0.5854514, -0.726961, 2.548872, 0.345098, 0, 1, 1,
0.5878739, 1.305843, -0.9476889, 0.3490196, 0, 1, 1,
0.5879273, -0.1203242, 1.68264, 0.3568628, 0, 1, 1,
0.5882589, -0.5279217, 1.871884, 0.3607843, 0, 1, 1,
0.5919207, -0.1703924, 1.134587, 0.3686275, 0, 1, 1,
0.5928808, -0.09223223, 1.41847, 0.372549, 0, 1, 1,
0.5931026, -0.5231491, 3.149154, 0.3803922, 0, 1, 1,
0.5966303, 0.05763175, 1.638655, 0.3843137, 0, 1, 1,
0.5966758, -0.3634497, 3.490629, 0.3921569, 0, 1, 1,
0.5974064, 0.4727159, 0.2243797, 0.3960784, 0, 1, 1,
0.5974553, -0.228982, 4.004037, 0.4039216, 0, 1, 1,
0.5978885, 0.3940717, 2.494076, 0.4117647, 0, 1, 1,
0.5986721, -0.3559227, 2.164634, 0.4156863, 0, 1, 1,
0.6037345, -0.3515511, 0.1677389, 0.4235294, 0, 1, 1,
0.6072478, -0.3338602, 0.8470174, 0.427451, 0, 1, 1,
0.6073571, 0.215336, 1.305677, 0.4352941, 0, 1, 1,
0.6140692, -0.2655069, 1.814527, 0.4392157, 0, 1, 1,
0.6215831, 0.2345508, 1.829868, 0.4470588, 0, 1, 1,
0.6225131, 1.159833, 1.278564, 0.4509804, 0, 1, 1,
0.6253725, -1.886537, 4.144773, 0.4588235, 0, 1, 1,
0.627381, 1.995845, -0.4545065, 0.4627451, 0, 1, 1,
0.6290331, -0.3816912, 1.703142, 0.4705882, 0, 1, 1,
0.6306489, -0.469775, 1.985784, 0.4745098, 0, 1, 1,
0.6343789, 0.3466538, 1.763902, 0.4823529, 0, 1, 1,
0.6347857, -2.307321, 3.507086, 0.4862745, 0, 1, 1,
0.6352329, 0.2421147, 1.104223, 0.4941176, 0, 1, 1,
0.6370785, -0.5448278, 3.503786, 0.5019608, 0, 1, 1,
0.6389827, -1.397131, 2.22846, 0.5058824, 0, 1, 1,
0.6396814, 0.4956803, -0.2441769, 0.5137255, 0, 1, 1,
0.6403508, 0.8308153, -0.2298463, 0.5176471, 0, 1, 1,
0.641417, -0.0356326, 3.572909, 0.5254902, 0, 1, 1,
0.6473029, -0.1704286, 1.883773, 0.5294118, 0, 1, 1,
0.6566482, -0.5539446, 1.28987, 0.5372549, 0, 1, 1,
0.6591699, -0.3818006, 1.367867, 0.5411765, 0, 1, 1,
0.6609682, -0.2620004, 2.793904, 0.5490196, 0, 1, 1,
0.6624399, -0.3786301, 2.96195, 0.5529412, 0, 1, 1,
0.6642028, -1.242914, 3.858919, 0.5607843, 0, 1, 1,
0.6739126, -0.8641843, 3.109153, 0.5647059, 0, 1, 1,
0.6745269, -0.9823326, 1.074699, 0.572549, 0, 1, 1,
0.6781632, -0.7305216, 2.720218, 0.5764706, 0, 1, 1,
0.682276, -0.1426817, 3.314026, 0.5843138, 0, 1, 1,
0.6850117, 1.342137, -0.02546217, 0.5882353, 0, 1, 1,
0.6854316, 0.4258469, -0.1559138, 0.5960785, 0, 1, 1,
0.6872628, 0.5979604, 0.1768578, 0.6039216, 0, 1, 1,
0.6885669, 0.373381, 0.5765767, 0.6078432, 0, 1, 1,
0.6911896, -0.2062556, 1.225012, 0.6156863, 0, 1, 1,
0.6926963, 0.179877, 1.885447, 0.6196079, 0, 1, 1,
0.6957613, -0.2778856, 1.565359, 0.627451, 0, 1, 1,
0.7002253, 0.6987374, 0.9863838, 0.6313726, 0, 1, 1,
0.7048734, 0.3366342, 1.174855, 0.6392157, 0, 1, 1,
0.7100629, 0.1764069, 1.986805, 0.6431373, 0, 1, 1,
0.7109129, 1.41898, 1.06053, 0.6509804, 0, 1, 1,
0.7125511, -0.632707, 3.625798, 0.654902, 0, 1, 1,
0.7138811, 0.7910959, 0.2680362, 0.6627451, 0, 1, 1,
0.7168863, -0.4474796, 0.6579192, 0.6666667, 0, 1, 1,
0.7282053, -1.365674, 1.367911, 0.6745098, 0, 1, 1,
0.7347806, -0.8864998, 1.58395, 0.6784314, 0, 1, 1,
0.7354214, -0.6077225, 3.264237, 0.6862745, 0, 1, 1,
0.7386528, 1.611331, -0.2075492, 0.6901961, 0, 1, 1,
0.7394923, 0.4673069, 2.600417, 0.6980392, 0, 1, 1,
0.7417907, -1.074268, 2.249966, 0.7058824, 0, 1, 1,
0.7418862, -0.159517, 0.6382712, 0.7098039, 0, 1, 1,
0.7420214, -0.8696641, 2.332918, 0.7176471, 0, 1, 1,
0.7430949, -0.3400571, 0.5841725, 0.7215686, 0, 1, 1,
0.7446927, -0.1305164, 1.241586, 0.7294118, 0, 1, 1,
0.7481895, -0.6031199, 3.464464, 0.7333333, 0, 1, 1,
0.7510542, -1.252407, 1.39667, 0.7411765, 0, 1, 1,
0.7529607, -0.291944, 2.233521, 0.7450981, 0, 1, 1,
0.7544419, -0.827589, 0.9239799, 0.7529412, 0, 1, 1,
0.7551272, 0.1154853, 0.06458542, 0.7568628, 0, 1, 1,
0.7583653, -1.009027, 3.007777, 0.7647059, 0, 1, 1,
0.7609847, -1.190225, 0.6837592, 0.7686275, 0, 1, 1,
0.7615103, -0.6443899, 1.837667, 0.7764706, 0, 1, 1,
0.764259, 0.7134315, 0.2003992, 0.7803922, 0, 1, 1,
0.7698476, 0.3181412, 1.006349, 0.7882353, 0, 1, 1,
0.7731234, 0.04382225, 0.5630264, 0.7921569, 0, 1, 1,
0.7774674, -1.309736, 1.710053, 0.8, 0, 1, 1,
0.7812168, -1.304917, 2.679295, 0.8078431, 0, 1, 1,
0.7818918, 1.168365, -1.474354, 0.8117647, 0, 1, 1,
0.7908785, 0.1962495, 1.662621, 0.8196079, 0, 1, 1,
0.7934716, 1.678852, 0.527145, 0.8235294, 0, 1, 1,
0.7976275, 0.2929437, -0.3165081, 0.8313726, 0, 1, 1,
0.80044, -1.577066, 4.942632, 0.8352941, 0, 1, 1,
0.8092439, -1.779212, 2.187047, 0.8431373, 0, 1, 1,
0.8109589, 0.4171597, 2.62646, 0.8470588, 0, 1, 1,
0.8149372, -0.3936429, 1.79755, 0.854902, 0, 1, 1,
0.8180427, 0.6612705, 2.327994, 0.8588235, 0, 1, 1,
0.8184335, 0.4797143, -0.3312227, 0.8666667, 0, 1, 1,
0.8443981, 0.6588544, 0.8434008, 0.8705882, 0, 1, 1,
0.8480979, 2.239119, -1.023481, 0.8784314, 0, 1, 1,
0.8570678, 0.8364658, -0.3589171, 0.8823529, 0, 1, 1,
0.8584045, 1.291412, -0.3799042, 0.8901961, 0, 1, 1,
0.8757503, 0.8300288, 1.465817, 0.8941177, 0, 1, 1,
0.8767943, -0.6367214, 2.054702, 0.9019608, 0, 1, 1,
0.8821707, -0.2341082, 0.7564005, 0.9098039, 0, 1, 1,
0.8893417, 2.20748, -0.01295704, 0.9137255, 0, 1, 1,
0.8933368, -0.5704713, -0.4386519, 0.9215686, 0, 1, 1,
0.9023686, 0.1841373, 1.562103, 0.9254902, 0, 1, 1,
0.9032835, -0.7294726, 2.475342, 0.9333333, 0, 1, 1,
0.9047422, 0.4250198, 0.4058481, 0.9372549, 0, 1, 1,
0.9056854, -1.00816, 1.644279, 0.945098, 0, 1, 1,
0.9058051, 0.707123, 2.802186, 0.9490196, 0, 1, 1,
0.9154218, -0.5666361, 0.3213441, 0.9568627, 0, 1, 1,
0.9156737, 0.09571511, 1.898388, 0.9607843, 0, 1, 1,
0.9164829, -0.829728, 3.223198, 0.9686275, 0, 1, 1,
0.9185503, -2.121636, 1.939083, 0.972549, 0, 1, 1,
0.9219336, -0.06199037, 2.045765, 0.9803922, 0, 1, 1,
0.923456, 0.3308686, -0.4738335, 0.9843137, 0, 1, 1,
0.924398, -0.1058637, 0.7137704, 0.9921569, 0, 1, 1,
0.9339694, -1.941501, 2.062535, 0.9960784, 0, 1, 1,
0.9356899, 1.709151, 0.5456437, 1, 0, 0.9960784, 1,
0.9395576, 0.6997501, -0.7255457, 1, 0, 0.9882353, 1,
0.9413287, -1.579734, 2.256929, 1, 0, 0.9843137, 1,
0.9430555, -0.2064106, 1.096512, 1, 0, 0.9764706, 1,
0.9462108, -0.8287377, 2.44925, 1, 0, 0.972549, 1,
0.9502891, -0.3962747, 2.564717, 1, 0, 0.9647059, 1,
0.9522222, -0.5928884, 3.633774, 1, 0, 0.9607843, 1,
0.9587964, 1.169209, 2.998842, 1, 0, 0.9529412, 1,
0.962983, -1.363489, 2.28547, 1, 0, 0.9490196, 1,
0.9702528, -0.3746645, 2.767272, 1, 0, 0.9411765, 1,
0.9733608, 0.3178165, 1.595624, 1, 0, 0.9372549, 1,
0.9803692, 0.1122024, 2.160299, 1, 0, 0.9294118, 1,
0.9807145, 0.8938559, 0.246135, 1, 0, 0.9254902, 1,
0.9844216, -1.172352, 2.100985, 1, 0, 0.9176471, 1,
0.9856243, 0.05529917, 0.9261611, 1, 0, 0.9137255, 1,
0.987022, -1.797024, 2.5246, 1, 0, 0.9058824, 1,
0.9890205, 1.569059, 0.9797987, 1, 0, 0.9019608, 1,
0.9897743, 0.1940818, 0.8170941, 1, 0, 0.8941177, 1,
0.9977344, 0.01359038, 0.2929151, 1, 0, 0.8862745, 1,
1.003124, -0.3842875, 1.648105, 1, 0, 0.8823529, 1,
1.008311, 0.05161792, 1.816937, 1, 0, 0.8745098, 1,
1.009513, 0.652442, 0.2204949, 1, 0, 0.8705882, 1,
1.018688, -0.5296537, 4.944597, 1, 0, 0.8627451, 1,
1.029465, -0.419248, 2.811876, 1, 0, 0.8588235, 1,
1.030979, -2.558908, 2.858348, 1, 0, 0.8509804, 1,
1.032385, 1.385725, 1.209926, 1, 0, 0.8470588, 1,
1.034909, 0.6770617, 1.660098, 1, 0, 0.8392157, 1,
1.036859, -0.3382996, 1.825327, 1, 0, 0.8352941, 1,
1.046901, 0.3897214, 1.427061, 1, 0, 0.827451, 1,
1.046915, -0.07170805, 1.725887, 1, 0, 0.8235294, 1,
1.051258, -2.115537, 2.190963, 1, 0, 0.8156863, 1,
1.057311, -0.4433048, 2.498453, 1, 0, 0.8117647, 1,
1.062686, 1.103275, 2.188984, 1, 0, 0.8039216, 1,
1.067242, -0.4228324, 0.03662411, 1, 0, 0.7960784, 1,
1.092484, 0.2981915, 2.462433, 1, 0, 0.7921569, 1,
1.09394, -1.026033, 3.334734, 1, 0, 0.7843137, 1,
1.112349, 1.046005, 0.2360375, 1, 0, 0.7803922, 1,
1.114966, -0.6871681, 1.58628, 1, 0, 0.772549, 1,
1.123835, 0.7337914, 1.086272, 1, 0, 0.7686275, 1,
1.124366, 0.4596834, 0.6022593, 1, 0, 0.7607843, 1,
1.125645, -2.119396, 3.795819, 1, 0, 0.7568628, 1,
1.126519, 0.2807194, 1.573944, 1, 0, 0.7490196, 1,
1.129769, 0.3221885, 2.045532, 1, 0, 0.7450981, 1,
1.134083, -0.4250974, 1.481804, 1, 0, 0.7372549, 1,
1.134316, -0.9817094, 2.567096, 1, 0, 0.7333333, 1,
1.136901, -1.505676, 2.61542, 1, 0, 0.7254902, 1,
1.137361, 0.490773, 0.003568976, 1, 0, 0.7215686, 1,
1.143604, -0.1239981, 1.232407, 1, 0, 0.7137255, 1,
1.143831, 1.142076, -0.2757203, 1, 0, 0.7098039, 1,
1.144587, 0.4148254, 1.400519, 1, 0, 0.7019608, 1,
1.156195, 0.350835, 0.1462761, 1, 0, 0.6941177, 1,
1.163024, -0.3785083, 2.950778, 1, 0, 0.6901961, 1,
1.165124, 0.3587211, 0.1395239, 1, 0, 0.682353, 1,
1.17161, -1.008559, 1.74588, 1, 0, 0.6784314, 1,
1.172345, -0.05313886, 3.11336, 1, 0, 0.6705883, 1,
1.175205, 0.337961, 1.268949, 1, 0, 0.6666667, 1,
1.180978, 1.106251, 1.253062, 1, 0, 0.6588235, 1,
1.186063, -0.006061384, 1.654336, 1, 0, 0.654902, 1,
1.186377, -1.429085, 1.803093, 1, 0, 0.6470588, 1,
1.196179, -1.001326, 0.2620578, 1, 0, 0.6431373, 1,
1.198261, 0.8341686, 2.375533, 1, 0, 0.6352941, 1,
1.204675, -1.030101, 1.789282, 1, 0, 0.6313726, 1,
1.213964, -0.6510664, 1.440716, 1, 0, 0.6235294, 1,
1.216982, 0.2047449, 1.660823, 1, 0, 0.6196079, 1,
1.220059, 1.780024, 2.251203, 1, 0, 0.6117647, 1,
1.223648, -1.111046, 3.172484, 1, 0, 0.6078432, 1,
1.223725, 1.956593, -0.08370572, 1, 0, 0.6, 1,
1.227021, 0.3082227, 1.422057, 1, 0, 0.5921569, 1,
1.236743, -0.4361104, 2.246257, 1, 0, 0.5882353, 1,
1.238094, -0.2665161, 2.194475, 1, 0, 0.5803922, 1,
1.238784, -1.086574, 3.562487, 1, 0, 0.5764706, 1,
1.243803, -0.5429137, 1.231668, 1, 0, 0.5686275, 1,
1.246252, 0.4022186, 0.9390125, 1, 0, 0.5647059, 1,
1.250055, -1.79486, 2.165632, 1, 0, 0.5568628, 1,
1.252407, 0.6778354, 1.295392, 1, 0, 0.5529412, 1,
1.259253, -0.3778915, 2.865432, 1, 0, 0.5450981, 1,
1.265886, 0.2618914, 0.6145857, 1, 0, 0.5411765, 1,
1.266529, -0.4359757, 3.296565, 1, 0, 0.5333334, 1,
1.27272, -2.154636, 3.545231, 1, 0, 0.5294118, 1,
1.275251, 1.077609, 0.3859057, 1, 0, 0.5215687, 1,
1.280397, 0.6379706, 1.81653, 1, 0, 0.5176471, 1,
1.286637, -0.3915034, 0.6056748, 1, 0, 0.509804, 1,
1.289132, 1.198772, 1.665979, 1, 0, 0.5058824, 1,
1.307788, 0.2608778, 3.666209, 1, 0, 0.4980392, 1,
1.311214, -0.5542723, 1.700092, 1, 0, 0.4901961, 1,
1.32813, -0.1662048, 1.548199, 1, 0, 0.4862745, 1,
1.331612, -0.4537698, 2.255118, 1, 0, 0.4784314, 1,
1.339962, 1.316365, 3.127531, 1, 0, 0.4745098, 1,
1.340469, 0.3616965, 1.920923, 1, 0, 0.4666667, 1,
1.344226, 0.7274011, 1.354793, 1, 0, 0.4627451, 1,
1.346243, -0.1804576, 2.070655, 1, 0, 0.454902, 1,
1.359471, 0.9545334, 1.617778, 1, 0, 0.4509804, 1,
1.363599, -0.3931683, 1.676721, 1, 0, 0.4431373, 1,
1.36383, 0.3439917, 1.390041, 1, 0, 0.4392157, 1,
1.388247, 0.6082335, 0.9375359, 1, 0, 0.4313726, 1,
1.393984, -1.374862, -0.03463037, 1, 0, 0.427451, 1,
1.394869, 0.138671, 0.4964801, 1, 0, 0.4196078, 1,
1.401538, 1.280398, 1.922549, 1, 0, 0.4156863, 1,
1.421329, -0.3822837, 0.9235276, 1, 0, 0.4078431, 1,
1.427013, -0.1200712, 3.126939, 1, 0, 0.4039216, 1,
1.429618, 2.147272, -0.2318684, 1, 0, 0.3960784, 1,
1.432369, -1.272555, 3.115956, 1, 0, 0.3882353, 1,
1.436726, -0.5679659, -0.0129031, 1, 0, 0.3843137, 1,
1.439143, -0.8565664, 3.44542, 1, 0, 0.3764706, 1,
1.440652, 0.7253497, 2.190705, 1, 0, 0.372549, 1,
1.441302, -1.470936, 2.258379, 1, 0, 0.3647059, 1,
1.4437, -0.2179121, 2.366366, 1, 0, 0.3607843, 1,
1.447044, -1.472246, 4.093397, 1, 0, 0.3529412, 1,
1.479339, 0.6493644, 0.1748831, 1, 0, 0.3490196, 1,
1.487417, -1.008235, 1.249078, 1, 0, 0.3411765, 1,
1.495609, 0.7068953, 1.634778, 1, 0, 0.3372549, 1,
1.506962, -0.6977626, 3.160122, 1, 0, 0.3294118, 1,
1.515705, -0.4336376, 2.185788, 1, 0, 0.3254902, 1,
1.536236, 0.3981767, 0.9531627, 1, 0, 0.3176471, 1,
1.54695, -0.8099542, -0.3408129, 1, 0, 0.3137255, 1,
1.564689, 1.817713, 0.9121286, 1, 0, 0.3058824, 1,
1.568856, 0.9179505, 2.020716, 1, 0, 0.2980392, 1,
1.589418, 1.187753, 1.03914, 1, 0, 0.2941177, 1,
1.618886, 0.06763998, 2.170258, 1, 0, 0.2862745, 1,
1.63334, -1.284596, 2.430348, 1, 0, 0.282353, 1,
1.648982, 0.2776332, 1.100183, 1, 0, 0.2745098, 1,
1.656919, 1.730011, -0.7398478, 1, 0, 0.2705882, 1,
1.66876, -0.7890794, 2.071426, 1, 0, 0.2627451, 1,
1.676649, -0.1447773, 0.2661638, 1, 0, 0.2588235, 1,
1.690899, -0.4328059, 1.925699, 1, 0, 0.2509804, 1,
1.737974, -0.5342883, 3.469203, 1, 0, 0.2470588, 1,
1.750129, -0.1971124, -0.04496863, 1, 0, 0.2392157, 1,
1.82721, 1.094668, 0.8962569, 1, 0, 0.2352941, 1,
1.83874, -0.2113135, 2.98459, 1, 0, 0.227451, 1,
1.838802, -0.4992802, 1.651212, 1, 0, 0.2235294, 1,
1.839721, 0.8450736, 0.373957, 1, 0, 0.2156863, 1,
1.861217, -0.01912216, 3.074645, 1, 0, 0.2117647, 1,
1.863934, 1.864262, 0.4804963, 1, 0, 0.2039216, 1,
1.885831, -1.244506, 1.581601, 1, 0, 0.1960784, 1,
1.920959, -0.7061296, 1.645761, 1, 0, 0.1921569, 1,
1.940043, -1.427039, 3.551987, 1, 0, 0.1843137, 1,
1.979227, -0.2765154, 1.963879, 1, 0, 0.1803922, 1,
1.990599, 0.7400528, 1.121866, 1, 0, 0.172549, 1,
1.991406, -0.2184914, 1.860222, 1, 0, 0.1686275, 1,
2.000497, 3.063713, 1.22138, 1, 0, 0.1607843, 1,
2.033989, -0.4805422, 1.469323, 1, 0, 0.1568628, 1,
2.037933, -0.1457496, 2.215532, 1, 0, 0.1490196, 1,
2.05811, 0.3888746, 1.269904, 1, 0, 0.145098, 1,
2.058804, 0.1983972, 0.4244296, 1, 0, 0.1372549, 1,
2.07716, -1.197186, 2.876047, 1, 0, 0.1333333, 1,
2.097815, -0.4625694, 2.683502, 1, 0, 0.1254902, 1,
2.119664, -0.7053162, 2.652357, 1, 0, 0.1215686, 1,
2.122766, 0.2483125, 1.325376, 1, 0, 0.1137255, 1,
2.151309, 0.214395, 1.639998, 1, 0, 0.1098039, 1,
2.17868, 0.8979746, 2.403929, 1, 0, 0.1019608, 1,
2.197938, -1.769236, -0.03592741, 1, 0, 0.09411765, 1,
2.212994, -0.7275425, 3.663112, 1, 0, 0.09019608, 1,
2.251423, -0.5874431, 1.606768, 1, 0, 0.08235294, 1,
2.312437, 0.7281061, -0.8732134, 1, 0, 0.07843138, 1,
2.341956, -0.4220202, 2.345003, 1, 0, 0.07058824, 1,
2.366987, 0.4045353, 0.950252, 1, 0, 0.06666667, 1,
2.36924, -0.7448485, 3.032532, 1, 0, 0.05882353, 1,
2.383419, 0.5794345, 0.4416266, 1, 0, 0.05490196, 1,
2.412088, 2.557394, 0.8414282, 1, 0, 0.04705882, 1,
2.42011, -1.045586, 1.902331, 1, 0, 0.04313726, 1,
2.498844, -0.7598773, 1.247548, 1, 0, 0.03529412, 1,
2.53653, 0.4972281, 0.004916239, 1, 0, 0.03137255, 1,
2.536769, 0.2764427, -0.6652001, 1, 0, 0.02352941, 1,
2.608558, -0.6920844, 1.745407, 1, 0, 0.01960784, 1,
2.656883, 1.029829, -0.03168902, 1, 0, 0.01176471, 1,
2.703032, -1.023632, 0.76409, 1, 0, 0.007843138, 1
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
-0.4886754, -3.998805, -8.624673, 0, -0.5, 0.5, 0.5,
-0.4886754, -3.998805, -8.624673, 1, -0.5, 0.5, 0.5,
-0.4886754, -3.998805, -8.624673, 1, 1.5, 0.5, 0.5,
-0.4886754, -3.998805, -8.624673, 0, 1.5, 0.5, 0.5
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
-4.762371, 0.04425275, -8.624673, 0, -0.5, 0.5, 0.5,
-4.762371, 0.04425275, -8.624673, 1, -0.5, 0.5, 0.5,
-4.762371, 0.04425275, -8.624673, 1, 1.5, 0.5, 0.5,
-4.762371, 0.04425275, -8.624673, 0, 1.5, 0.5, 0.5
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
-4.762371, -3.998805, -0.6689012, 0, -0.5, 0.5, 0.5,
-4.762371, -3.998805, -0.6689012, 1, -0.5, 0.5, 0.5,
-4.762371, -3.998805, -0.6689012, 1, 1.5, 0.5, 0.5,
-4.762371, -3.998805, -0.6689012, 0, 1.5, 0.5, 0.5
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
-3, -3.065791, -6.788725,
2, -3.065791, -6.788725,
-3, -3.065791, -6.788725,
-3, -3.221294, -7.094717,
-2, -3.065791, -6.788725,
-2, -3.221294, -7.094717,
-1, -3.065791, -6.788725,
-1, -3.221294, -7.094717,
0, -3.065791, -6.788725,
0, -3.221294, -7.094717,
1, -3.065791, -6.788725,
1, -3.221294, -7.094717,
2, -3.065791, -6.788725,
2, -3.221294, -7.094717
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
-3, -3.532298, -7.706699, 0, -0.5, 0.5, 0.5,
-3, -3.532298, -7.706699, 1, -0.5, 0.5, 0.5,
-3, -3.532298, -7.706699, 1, 1.5, 0.5, 0.5,
-3, -3.532298, -7.706699, 0, 1.5, 0.5, 0.5,
-2, -3.532298, -7.706699, 0, -0.5, 0.5, 0.5,
-2, -3.532298, -7.706699, 1, -0.5, 0.5, 0.5,
-2, -3.532298, -7.706699, 1, 1.5, 0.5, 0.5,
-2, -3.532298, -7.706699, 0, 1.5, 0.5, 0.5,
-1, -3.532298, -7.706699, 0, -0.5, 0.5, 0.5,
-1, -3.532298, -7.706699, 1, -0.5, 0.5, 0.5,
-1, -3.532298, -7.706699, 1, 1.5, 0.5, 0.5,
-1, -3.532298, -7.706699, 0, 1.5, 0.5, 0.5,
0, -3.532298, -7.706699, 0, -0.5, 0.5, 0.5,
0, -3.532298, -7.706699, 1, -0.5, 0.5, 0.5,
0, -3.532298, -7.706699, 1, 1.5, 0.5, 0.5,
0, -3.532298, -7.706699, 0, 1.5, 0.5, 0.5,
1, -3.532298, -7.706699, 0, -0.5, 0.5, 0.5,
1, -3.532298, -7.706699, 1, -0.5, 0.5, 0.5,
1, -3.532298, -7.706699, 1, 1.5, 0.5, 0.5,
1, -3.532298, -7.706699, 0, 1.5, 0.5, 0.5,
2, -3.532298, -7.706699, 0, -0.5, 0.5, 0.5,
2, -3.532298, -7.706699, 1, -0.5, 0.5, 0.5,
2, -3.532298, -7.706699, 1, 1.5, 0.5, 0.5,
2, -3.532298, -7.706699, 0, 1.5, 0.5, 0.5
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
-3.776134, -2, -6.788725,
-3.776134, 3, -6.788725,
-3.776134, -2, -6.788725,
-3.940507, -2, -7.094717,
-3.776134, -1, -6.788725,
-3.940507, -1, -7.094717,
-3.776134, 0, -6.788725,
-3.940507, 0, -7.094717,
-3.776134, 1, -6.788725,
-3.940507, 1, -7.094717,
-3.776134, 2, -6.788725,
-3.940507, 2, -7.094717,
-3.776134, 3, -6.788725,
-3.940507, 3, -7.094717
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
-4.269252, -2, -7.706699, 0, -0.5, 0.5, 0.5,
-4.269252, -2, -7.706699, 1, -0.5, 0.5, 0.5,
-4.269252, -2, -7.706699, 1, 1.5, 0.5, 0.5,
-4.269252, -2, -7.706699, 0, 1.5, 0.5, 0.5,
-4.269252, -1, -7.706699, 0, -0.5, 0.5, 0.5,
-4.269252, -1, -7.706699, 1, -0.5, 0.5, 0.5,
-4.269252, -1, -7.706699, 1, 1.5, 0.5, 0.5,
-4.269252, -1, -7.706699, 0, 1.5, 0.5, 0.5,
-4.269252, 0, -7.706699, 0, -0.5, 0.5, 0.5,
-4.269252, 0, -7.706699, 1, -0.5, 0.5, 0.5,
-4.269252, 0, -7.706699, 1, 1.5, 0.5, 0.5,
-4.269252, 0, -7.706699, 0, 1.5, 0.5, 0.5,
-4.269252, 1, -7.706699, 0, -0.5, 0.5, 0.5,
-4.269252, 1, -7.706699, 1, -0.5, 0.5, 0.5,
-4.269252, 1, -7.706699, 1, 1.5, 0.5, 0.5,
-4.269252, 1, -7.706699, 0, 1.5, 0.5, 0.5,
-4.269252, 2, -7.706699, 0, -0.5, 0.5, 0.5,
-4.269252, 2, -7.706699, 1, -0.5, 0.5, 0.5,
-4.269252, 2, -7.706699, 1, 1.5, 0.5, 0.5,
-4.269252, 2, -7.706699, 0, 1.5, 0.5, 0.5,
-4.269252, 3, -7.706699, 0, -0.5, 0.5, 0.5,
-4.269252, 3, -7.706699, 1, -0.5, 0.5, 0.5,
-4.269252, 3, -7.706699, 1, 1.5, 0.5, 0.5,
-4.269252, 3, -7.706699, 0, 1.5, 0.5, 0.5
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
-3.776134, -3.065791, -6,
-3.776134, -3.065791, 4,
-3.776134, -3.065791, -6,
-3.940507, -3.221294, -6,
-3.776134, -3.065791, -4,
-3.940507, -3.221294, -4,
-3.776134, -3.065791, -2,
-3.940507, -3.221294, -2,
-3.776134, -3.065791, 0,
-3.940507, -3.221294, 0,
-3.776134, -3.065791, 2,
-3.940507, -3.221294, 2,
-3.776134, -3.065791, 4,
-3.940507, -3.221294, 4
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
-4.269252, -3.532298, -6, 0, -0.5, 0.5, 0.5,
-4.269252, -3.532298, -6, 1, -0.5, 0.5, 0.5,
-4.269252, -3.532298, -6, 1, 1.5, 0.5, 0.5,
-4.269252, -3.532298, -6, 0, 1.5, 0.5, 0.5,
-4.269252, -3.532298, -4, 0, -0.5, 0.5, 0.5,
-4.269252, -3.532298, -4, 1, -0.5, 0.5, 0.5,
-4.269252, -3.532298, -4, 1, 1.5, 0.5, 0.5,
-4.269252, -3.532298, -4, 0, 1.5, 0.5, 0.5,
-4.269252, -3.532298, -2, 0, -0.5, 0.5, 0.5,
-4.269252, -3.532298, -2, 1, -0.5, 0.5, 0.5,
-4.269252, -3.532298, -2, 1, 1.5, 0.5, 0.5,
-4.269252, -3.532298, -2, 0, 1.5, 0.5, 0.5,
-4.269252, -3.532298, 0, 0, -0.5, 0.5, 0.5,
-4.269252, -3.532298, 0, 1, -0.5, 0.5, 0.5,
-4.269252, -3.532298, 0, 1, 1.5, 0.5, 0.5,
-4.269252, -3.532298, 0, 0, 1.5, 0.5, 0.5,
-4.269252, -3.532298, 2, 0, -0.5, 0.5, 0.5,
-4.269252, -3.532298, 2, 1, -0.5, 0.5, 0.5,
-4.269252, -3.532298, 2, 1, 1.5, 0.5, 0.5,
-4.269252, -3.532298, 2, 0, 1.5, 0.5, 0.5,
-4.269252, -3.532298, 4, 0, -0.5, 0.5, 0.5,
-4.269252, -3.532298, 4, 1, -0.5, 0.5, 0.5,
-4.269252, -3.532298, 4, 1, 1.5, 0.5, 0.5,
-4.269252, -3.532298, 4, 0, 1.5, 0.5, 0.5
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
-3.776134, -3.065791, -6.788725,
-3.776134, 3.154297, -6.788725,
-3.776134, -3.065791, 5.450923,
-3.776134, 3.154297, 5.450923,
-3.776134, -3.065791, -6.788725,
-3.776134, -3.065791, 5.450923,
-3.776134, 3.154297, -6.788725,
-3.776134, 3.154297, 5.450923,
-3.776134, -3.065791, -6.788725,
2.798783, -3.065791, -6.788725,
-3.776134, -3.065791, 5.450923,
2.798783, -3.065791, 5.450923,
-3.776134, 3.154297, -6.788725,
2.798783, 3.154297, -6.788725,
-3.776134, 3.154297, 5.450923,
2.798783, 3.154297, 5.450923,
2.798783, -3.065791, -6.788725,
2.798783, 3.154297, -6.788725,
2.798783, -3.065791, 5.450923,
2.798783, 3.154297, 5.450923,
2.798783, -3.065791, -6.788725,
2.798783, -3.065791, 5.450923,
2.798783, 3.154297, -6.788725,
2.798783, 3.154297, 5.450923
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
var radius = 8.128581;
var distance = 36.16497;
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
mvMatrix.translate( 0.4886754, -0.04425275, 0.6689012 );
mvMatrix.scale( 1.336714, 1.412967, 0.7180583 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.16497);
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
bis(trichloromethyl)<-read.table("bis(trichloromethyl).xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bis(trichloromethyl)$V2
```

```
## Error in eval(expr, envir, enclos): could not find function "bis"
```

```r
y<-bis(trichloromethyl)$V3
```

```
## Error in eval(expr, envir, enclos): could not find function "bis"
```

```r
z<-bis(trichloromethyl)$V4
```

```
## Error in eval(expr, envir, enclos): could not find function "bis"
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
-3.680382, -1.443048, -0.9387038, 0, 0, 1, 1, 1,
-3.144247, -0.6229139, -2.611571, 1, 0, 0, 1, 1,
-3.078549, 0.116063, -2.120621, 1, 0, 0, 1, 1,
-2.931591, -1.441496, -1.201731, 1, 0, 0, 1, 1,
-2.736806, -0.2628943, -1.839412, 1, 0, 0, 1, 1,
-2.507245, -0.330615, 0.1448662, 1, 0, 0, 1, 1,
-2.504726, 1.625063, -1.134177, 0, 0, 0, 1, 1,
-2.44861, 1.263269, -0.4843809, 0, 0, 0, 1, 1,
-2.415863, 0.5696003, 0.1819538, 0, 0, 0, 1, 1,
-2.415645, 0.4620526, -1.510444, 0, 0, 0, 1, 1,
-2.343896, 1.409987, -1.294132, 0, 0, 0, 1, 1,
-2.299914, -0.3616614, -1.871633, 0, 0, 0, 1, 1,
-2.282443, 0.06059036, -2.415066, 0, 0, 0, 1, 1,
-2.275559, -1.140466, -1.356728, 1, 1, 1, 1, 1,
-2.202112, 0.3654832, -0.7449744, 1, 1, 1, 1, 1,
-2.18013, -1.116486, -2.613977, 1, 1, 1, 1, 1,
-2.128494, 0.5479034, -1.517351, 1, 1, 1, 1, 1,
-2.12372, -0.06321144, -1.208588, 1, 1, 1, 1, 1,
-2.122928, -0.4948545, -2.293949, 1, 1, 1, 1, 1,
-2.096633, 1.837829, 0.9552481, 1, 1, 1, 1, 1,
-2.067069, 0.3459518, -1.437314, 1, 1, 1, 1, 1,
-2.050761, -0.01338907, -1.544556, 1, 1, 1, 1, 1,
-2.037383, -0.9285178, -3.267918, 1, 1, 1, 1, 1,
-2.030659, 1.838157, -3.461228, 1, 1, 1, 1, 1,
-2.001643, 1.837791, 0.6203315, 1, 1, 1, 1, 1,
-1.998847, 2.05189, -0.04045142, 1, 1, 1, 1, 1,
-1.944799, 0.1988881, -1.036616, 1, 1, 1, 1, 1,
-1.943615, 1.290877, -1.514419, 1, 1, 1, 1, 1,
-1.938977, 1.141007, 0.1263896, 0, 0, 1, 1, 1,
-1.931387, 0.1333482, -2.082635, 1, 0, 0, 1, 1,
-1.928535, 0.1318337, -1.708455, 1, 0, 0, 1, 1,
-1.925172, 0.4699005, -3.468835, 1, 0, 0, 1, 1,
-1.925152, 0.7687038, -1.567393, 1, 0, 0, 1, 1,
-1.893592, -1.939867, -1.605504, 1, 0, 0, 1, 1,
-1.877781, 1.442046, -2.156352, 0, 0, 0, 1, 1,
-1.871054, 1.118012, -1.126422, 0, 0, 0, 1, 1,
-1.832972, 0.3894905, -1.540463, 0, 0, 0, 1, 1,
-1.82324, -0.4832436, -3.793414, 0, 0, 0, 1, 1,
-1.809782, 0.4555695, -1.02555, 0, 0, 0, 1, 1,
-1.803915, -1.099551, -2.03833, 0, 0, 0, 1, 1,
-1.797153, -1.288057, -1.268391, 0, 0, 0, 1, 1,
-1.786686, -2.009285, -1.883111, 1, 1, 1, 1, 1,
-1.779618, 1.624486, -0.1394429, 1, 1, 1, 1, 1,
-1.77208, -1.184672, -2.511883, 1, 1, 1, 1, 1,
-1.75495, -1.092704, -4.064622, 1, 1, 1, 1, 1,
-1.750855, -0.5372551, -0.7950642, 1, 1, 1, 1, 1,
-1.735918, -1.115147, -3.208311, 1, 1, 1, 1, 1,
-1.735642, 0.5974612, -1.06295, 1, 1, 1, 1, 1,
-1.733591, -0.1180002, 0.9624645, 1, 1, 1, 1, 1,
-1.709242, 0.2690502, -2.02515, 1, 1, 1, 1, 1,
-1.704817, -1.170042, -1.637872, 1, 1, 1, 1, 1,
-1.694476, 1.77434, 1.117642, 1, 1, 1, 1, 1,
-1.690315, -0.2037477, -1.544466, 1, 1, 1, 1, 1,
-1.68405, -0.6070577, -3.450579, 1, 1, 1, 1, 1,
-1.683336, -0.4944471, -3.613559, 1, 1, 1, 1, 1,
-1.677576, -0.8497937, -1.861466, 1, 1, 1, 1, 1,
-1.669011, 0.3350692, -2.021342, 0, 0, 1, 1, 1,
-1.659086, -1.918728, -3.47873, 1, 0, 0, 1, 1,
-1.658617, 1.097423, 0.2830446, 1, 0, 0, 1, 1,
-1.644406, 0.3549272, -2.78085, 1, 0, 0, 1, 1,
-1.641639, 1.223504, -1.933213, 1, 0, 0, 1, 1,
-1.632564, -1.663448, -3.735828, 1, 0, 0, 1, 1,
-1.630283, -1.343218, -1.745341, 0, 0, 0, 1, 1,
-1.6207, 1.54482, -1.406669, 0, 0, 0, 1, 1,
-1.604435, -1.229065, -3.021931, 0, 0, 0, 1, 1,
-1.597698, 0.6384841, -1.38502, 0, 0, 0, 1, 1,
-1.596806, 0.5932027, -1.812865, 0, 0, 0, 1, 1,
-1.596742, 0.6491647, -1.232964, 0, 0, 0, 1, 1,
-1.593879, -0.0009897507, -1.424109, 0, 0, 0, 1, 1,
-1.588157, 0.3188243, -2.879712, 1, 1, 1, 1, 1,
-1.584198, 1.525478, -0.7445748, 1, 1, 1, 1, 1,
-1.582155, -0.8762043, -2.170084, 1, 1, 1, 1, 1,
-1.569109, 1.368409, -1.492852, 1, 1, 1, 1, 1,
-1.55838, 0.5204839, -0.8705198, 1, 1, 1, 1, 1,
-1.545993, -1.364114, -0.08702913, 1, 1, 1, 1, 1,
-1.545654, -1.684558, -0.6926609, 1, 1, 1, 1, 1,
-1.529172, -0.4181891, -1.445298, 1, 1, 1, 1, 1,
-1.528816, -0.475452, -2.052169, 1, 1, 1, 1, 1,
-1.526026, -1.217247, -2.61976, 1, 1, 1, 1, 1,
-1.524237, 2.169522, -0.2733953, 1, 1, 1, 1, 1,
-1.523967, -0.1848716, -1.434482, 1, 1, 1, 1, 1,
-1.515705, 0.6498617, -0.6069498, 1, 1, 1, 1, 1,
-1.507456, -0.3484063, -1.7204, 1, 1, 1, 1, 1,
-1.506734, -0.385429, -0.2552924, 1, 1, 1, 1, 1,
-1.506054, 0.8236149, -1.059733, 0, 0, 1, 1, 1,
-1.495216, 0.169118, -0.8454324, 1, 0, 0, 1, 1,
-1.494647, 0.4120774, -1.782854, 1, 0, 0, 1, 1,
-1.491548, 1.308333, -1.978357, 1, 0, 0, 1, 1,
-1.487444, 0.8512773, -0.2182845, 1, 0, 0, 1, 1,
-1.480928, 0.04516309, -1.456396, 1, 0, 0, 1, 1,
-1.473053, 1.058419, -0.8131919, 0, 0, 0, 1, 1,
-1.471733, 0.3788432, -0.2143607, 0, 0, 0, 1, 1,
-1.469242, -0.3274348, -1.301847, 0, 0, 0, 1, 1,
-1.462612, -1.408261, -3.243008, 0, 0, 0, 1, 1,
-1.440102, -2.335786, -1.775348, 0, 0, 0, 1, 1,
-1.438054, -1.268509, -2.599323, 0, 0, 0, 1, 1,
-1.436589, -0.8508121, -2.664412, 0, 0, 0, 1, 1,
-1.433231, 0.6380488, -1.007491, 1, 1, 1, 1, 1,
-1.427012, 0.5821427, -2.29225, 1, 1, 1, 1, 1,
-1.416774, -1.292745, -3.084444, 1, 1, 1, 1, 1,
-1.385407, 0.01333483, -2.118963, 1, 1, 1, 1, 1,
-1.367824, 0.2197295, -3.624942, 1, 1, 1, 1, 1,
-1.367491, 0.1676718, -2.219049, 1, 1, 1, 1, 1,
-1.363968, -0.408259, -0.5323659, 1, 1, 1, 1, 1,
-1.355375, 0.1013337, -1.722192, 1, 1, 1, 1, 1,
-1.352523, -0.9035555, -2.951749, 1, 1, 1, 1, 1,
-1.340731, -0.9414322, -1.841725, 1, 1, 1, 1, 1,
-1.331082, -0.4090452, -1.166602, 1, 1, 1, 1, 1,
-1.317822, 0.2980183, -0.4641281, 1, 1, 1, 1, 1,
-1.315198, -0.6336822, -2.768512, 1, 1, 1, 1, 1,
-1.314273, -1.652668, -4.137259, 1, 1, 1, 1, 1,
-1.309302, -0.8223379, -2.050229, 1, 1, 1, 1, 1,
-1.306061, -1.090113, -4.527195, 0, 0, 1, 1, 1,
-1.303809, 0.6672379, -0.2790012, 1, 0, 0, 1, 1,
-1.302001, 0.7810718, 0.1404419, 1, 0, 0, 1, 1,
-1.300051, -0.9858091, -1.056258, 1, 0, 0, 1, 1,
-1.29143, -0.1315145, -1.920997, 1, 0, 0, 1, 1,
-1.287195, 2.057062, 0.9316591, 1, 0, 0, 1, 1,
-1.281705, -0.3926023, -0.9727262, 0, 0, 0, 1, 1,
-1.278906, -0.9385609, -1.342439, 0, 0, 0, 1, 1,
-1.278896, -1.027631, -2.374501, 0, 0, 0, 1, 1,
-1.268158, 1.217807, -2.145061, 0, 0, 0, 1, 1,
-1.265373, -0.7387011, -2.247826, 0, 0, 0, 1, 1,
-1.260558, -0.9913404, -2.903397, 0, 0, 0, 1, 1,
-1.257056, -1.140931, -2.543746, 0, 0, 0, 1, 1,
-1.256563, 0.8862355, -2.608078, 1, 1, 1, 1, 1,
-1.254767, 0.6506076, -1.203901, 1, 1, 1, 1, 1,
-1.248833, 0.7851685, 0.4776222, 1, 1, 1, 1, 1,
-1.248253, 0.4535738, -0.9762329, 1, 1, 1, 1, 1,
-1.246008, -0.5864127, -1.894, 1, 1, 1, 1, 1,
-1.245968, 0.9030946, -1.610258, 1, 1, 1, 1, 1,
-1.229113, -0.393406, -0.9830149, 1, 1, 1, 1, 1,
-1.22418, -1.513892, -1.178705, 1, 1, 1, 1, 1,
-1.197538, 0.2375548, -2.819934, 1, 1, 1, 1, 1,
-1.195441, 0.3401753, -1.934417, 1, 1, 1, 1, 1,
-1.182969, -0.866873, -2.273316, 1, 1, 1, 1, 1,
-1.182742, -1.2528, -3.339946, 1, 1, 1, 1, 1,
-1.181767, -0.498733, -2.686904, 1, 1, 1, 1, 1,
-1.167776, -0.05895087, -2.47622, 1, 1, 1, 1, 1,
-1.152234, -0.1639928, -3.377878, 1, 1, 1, 1, 1,
-1.148303, 0.4416201, -0.9611712, 0, 0, 1, 1, 1,
-1.144545, -0.7713389, -1.31221, 1, 0, 0, 1, 1,
-1.138845, 0.7010921, 0.2698107, 1, 0, 0, 1, 1,
-1.135124, 1.679495, -0.7220404, 1, 0, 0, 1, 1,
-1.133377, -2.803819, -5.146186, 1, 0, 0, 1, 1,
-1.132396, -0.565464, -3.450738, 1, 0, 0, 1, 1,
-1.129637, -1.77155, -1.91335, 0, 0, 0, 1, 1,
-1.128428, 0.6167393, -1.351814, 0, 0, 0, 1, 1,
-1.125846, -0.7575737, -2.511039, 0, 0, 0, 1, 1,
-1.117481, 1.183145, -0.6455726, 0, 0, 0, 1, 1,
-1.117479, 1.295424, -0.583856, 0, 0, 0, 1, 1,
-1.110598, 1.45261, 1.240069, 0, 0, 0, 1, 1,
-1.086791, 0.3255163, -2.352284, 0, 0, 0, 1, 1,
-1.08611, 0.1488917, -1.742404, 1, 1, 1, 1, 1,
-1.076823, -0.4638301, -1.889607, 1, 1, 1, 1, 1,
-1.063298, -1.160766, -1.216922, 1, 1, 1, 1, 1,
-1.058908, 0.09711205, -3.007145, 1, 1, 1, 1, 1,
-1.058008, -0.8908712, -2.349575, 1, 1, 1, 1, 1,
-1.056573, -2.089047, -3.264344, 1, 1, 1, 1, 1,
-1.052129, -0.4757648, -3.053072, 1, 1, 1, 1, 1,
-1.042601, 0.2255544, -0.2614378, 1, 1, 1, 1, 1,
-1.036609, -0.3328314, -1.332545, 1, 1, 1, 1, 1,
-1.031488, -0.7816958, -2.591913, 1, 1, 1, 1, 1,
-1.025226, -0.9679311, -1.46441, 1, 1, 1, 1, 1,
-1.015969, 1.496109, -2.3463, 1, 1, 1, 1, 1,
-1.014469, -1.377298, -3.092853, 1, 1, 1, 1, 1,
-1.011128, -0.1716946, -1.668187, 1, 1, 1, 1, 1,
-1.007363, 0.02089414, -2.161312, 1, 1, 1, 1, 1,
-1.006282, 0.1039197, -1.521268, 0, 0, 1, 1, 1,
-0.9987727, -1.161742, -3.223811, 1, 0, 0, 1, 1,
-0.9959001, -0.6026203, -3.539278, 1, 0, 0, 1, 1,
-0.9872643, -0.9395852, -1.698715, 1, 0, 0, 1, 1,
-0.9864873, 0.2911304, -2.292595, 1, 0, 0, 1, 1,
-0.985612, -0.7397454, -2.873912, 1, 0, 0, 1, 1,
-0.982155, 0.02690028, -0.4999573, 0, 0, 0, 1, 1,
-0.9820192, -0.2691653, -1.772572, 0, 0, 0, 1, 1,
-0.9718748, -0.2475038, -2.216196, 0, 0, 0, 1, 1,
-0.9704255, -0.1640328, -2.338687, 0, 0, 0, 1, 1,
-0.9687366, -1.588305, -2.98163, 0, 0, 0, 1, 1,
-0.967944, 2.056332, 1.596674, 0, 0, 0, 1, 1,
-0.9597153, -0.3207701, -1.095161, 0, 0, 0, 1, 1,
-0.9549561, -1.159994, -2.293188, 1, 1, 1, 1, 1,
-0.9532244, -0.1735688, -2.566263, 1, 1, 1, 1, 1,
-0.9527513, -1.718752, -2.808183, 1, 1, 1, 1, 1,
-0.9495159, 0.7339762, -0.8786143, 1, 1, 1, 1, 1,
-0.9462696, -0.4937142, -1.55441, 1, 1, 1, 1, 1,
-0.9417578, 1.231919, 0.08841562, 1, 1, 1, 1, 1,
-0.9390883, 1.287317, -1.695696, 1, 1, 1, 1, 1,
-0.93591, 2.204428, 0.7564332, 1, 1, 1, 1, 1,
-0.9356831, 0.8583423, -0.6198561, 1, 1, 1, 1, 1,
-0.9355902, -0.04190958, -0.9021408, 1, 1, 1, 1, 1,
-0.9326471, 0.8154, -1.989963, 1, 1, 1, 1, 1,
-0.9263492, 0.366443, -0.6857771, 1, 1, 1, 1, 1,
-0.9253535, -0.8124321, -2.040091, 1, 1, 1, 1, 1,
-0.9211079, 0.8572699, -0.509246, 1, 1, 1, 1, 1,
-0.91733, 0.3108892, -3.159189, 1, 1, 1, 1, 1,
-0.9148485, 0.9896787, -2.191998, 0, 0, 1, 1, 1,
-0.9110624, -0.8075643, -2.075163, 1, 0, 0, 1, 1,
-0.907077, -0.6677637, -2.113409, 1, 0, 0, 1, 1,
-0.9038218, 1.30845, -1.158312, 1, 0, 0, 1, 1,
-0.8975167, -0.1909525, -0.4759346, 1, 0, 0, 1, 1,
-0.8946846, 0.6272275, -2.446885, 1, 0, 0, 1, 1,
-0.8925535, 0.3734689, -0.3427216, 0, 0, 0, 1, 1,
-0.8914758, 0.1313318, -0.9467681, 0, 0, 0, 1, 1,
-0.8884902, 0.7763659, -0.8695596, 0, 0, 0, 1, 1,
-0.8807231, -0.1219626, -1.619431, 0, 0, 0, 1, 1,
-0.8740882, 1.611909, -0.3748951, 0, 0, 0, 1, 1,
-0.8724359, -0.2270282, -3.481841, 0, 0, 0, 1, 1,
-0.8721839, -0.7046898, -3.206643, 0, 0, 0, 1, 1,
-0.8715885, 0.7814547, -1.074944, 1, 1, 1, 1, 1,
-0.868374, 0.8629407, -0.3793756, 1, 1, 1, 1, 1,
-0.8668595, -1.232709, -0.8761756, 1, 1, 1, 1, 1,
-0.8646762, 1.02503, -0.8000156, 1, 1, 1, 1, 1,
-0.8635408, -0.7128644, -0.4008579, 1, 1, 1, 1, 1,
-0.8634521, 0.2274454, -1.892011, 1, 1, 1, 1, 1,
-0.8618919, 0.1433568, -1.111347, 1, 1, 1, 1, 1,
-0.8569905, 1.400763, -1.586009, 1, 1, 1, 1, 1,
-0.8529515, 1.022799, 0.4432992, 1, 1, 1, 1, 1,
-0.8504859, 0.2576528, -2.715602, 1, 1, 1, 1, 1,
-0.8504301, -1.116372, -2.999215, 1, 1, 1, 1, 1,
-0.8501309, 0.5314879, -1.138635, 1, 1, 1, 1, 1,
-0.8448711, 0.09996608, -2.333076, 1, 1, 1, 1, 1,
-0.8438244, -0.8224741, -4.967986, 1, 1, 1, 1, 1,
-0.8408965, 2.78085, -1.844129, 1, 1, 1, 1, 1,
-0.8389513, -1.51466, -2.42189, 0, 0, 1, 1, 1,
-0.8361683, 0.6414649, -0.9631878, 1, 0, 0, 1, 1,
-0.8295233, 0.1518792, -3.309296, 1, 0, 0, 1, 1,
-0.8288665, -1.292099, -4.684323, 1, 0, 0, 1, 1,
-0.8213153, -0.2628855, -2.431204, 1, 0, 0, 1, 1,
-0.8185356, 1.108473, -1.726244, 1, 0, 0, 1, 1,
-0.8184746, 0.0884604, -1.876441, 0, 0, 0, 1, 1,
-0.8172245, 0.6154792, -1.632514, 0, 0, 0, 1, 1,
-0.8169103, 1.150574, -1.304364, 0, 0, 0, 1, 1,
-0.8152328, 1.812078, -0.5864422, 0, 0, 0, 1, 1,
-0.8150421, 0.6672717, 0.1891315, 0, 0, 0, 1, 1,
-0.8149195, -0.0216243, -2.806966, 0, 0, 0, 1, 1,
-0.8064291, 0.4195876, -0.0306323, 0, 0, 0, 1, 1,
-0.8002464, 0.009397799, -2.220519, 1, 1, 1, 1, 1,
-0.7946556, 0.2376252, -1.787484, 1, 1, 1, 1, 1,
-0.7916639, 2.393131, -1.024618, 1, 1, 1, 1, 1,
-0.7900479, 1.343773, -1.201372, 1, 1, 1, 1, 1,
-0.7830007, -0.3964984, -3.018911, 1, 1, 1, 1, 1,
-0.7824934, 0.05090133, -1.36658, 1, 1, 1, 1, 1,
-0.7819853, -0.06485517, -3.209717, 1, 1, 1, 1, 1,
-0.7761718, 0.8154332, 1.177661, 1, 1, 1, 1, 1,
-0.7759793, 0.3445187, -1.580451, 1, 1, 1, 1, 1,
-0.7725281, 0.6737181, -0.918052, 1, 1, 1, 1, 1,
-0.7618745, -0.6211193, -1.773346, 1, 1, 1, 1, 1,
-0.7576699, 0.9861509, -1.350909, 1, 1, 1, 1, 1,
-0.7526146, 0.2194349, -2.758485, 1, 1, 1, 1, 1,
-0.7512226, 0.5864347, -1.328981, 1, 1, 1, 1, 1,
-0.7364567, 0.8606912, -3.635138, 1, 1, 1, 1, 1,
-0.7338197, 0.2671825, -2.081644, 0, 0, 1, 1, 1,
-0.7321145, 0.6173874, 0.08879329, 1, 0, 0, 1, 1,
-0.7127366, -0.9817365, -1.846515, 1, 0, 0, 1, 1,
-0.7123163, 0.6147255, -1.209265, 1, 0, 0, 1, 1,
-0.7116888, -0.2500046, -1.509328, 1, 0, 0, 1, 1,
-0.7103919, 0.1265608, -1.98846, 1, 0, 0, 1, 1,
-0.7085456, 0.01055524, -2.461151, 0, 0, 0, 1, 1,
-0.7047517, -1.004847, -4.330454, 0, 0, 0, 1, 1,
-0.7013633, -1.498925, -3.209012, 0, 0, 0, 1, 1,
-0.6991092, -0.3431754, 0.007783694, 0, 0, 0, 1, 1,
-0.6988774, -0.3744466, -1.899028, 0, 0, 0, 1, 1,
-0.6934868, -0.3440321, -2.01991, 0, 0, 0, 1, 1,
-0.6928404, -0.6732916, -3.444715, 0, 0, 0, 1, 1,
-0.6860347, 0.8973349, -2.185148, 1, 1, 1, 1, 1,
-0.6838114, 0.3334956, 0.2283099, 1, 1, 1, 1, 1,
-0.6758003, -0.268168, -2.11438, 1, 1, 1, 1, 1,
-0.6747848, -0.01530514, -2.548185, 1, 1, 1, 1, 1,
-0.6675222, 0.5074875, -0.2074575, 1, 1, 1, 1, 1,
-0.662699, -0.9245164, -2.801026, 1, 1, 1, 1, 1,
-0.6521754, -0.4084204, -0.9645221, 1, 1, 1, 1, 1,
-0.6489015, -0.5276236, -2.071506, 1, 1, 1, 1, 1,
-0.6478063, 0.594941, -0.03009933, 1, 1, 1, 1, 1,
-0.6428886, 1.106898, 0.3349418, 1, 1, 1, 1, 1,
-0.6428462, 0.07619529, -1.960667, 1, 1, 1, 1, 1,
-0.6351856, 0.5683275, -0.4923468, 1, 1, 1, 1, 1,
-0.6286233, 0.2708348, -1.939542, 1, 1, 1, 1, 1,
-0.6279323, 0.3033812, -1.045977, 1, 1, 1, 1, 1,
-0.623355, 0.3994798, -1.325031, 1, 1, 1, 1, 1,
-0.6152647, -1.004787, -2.388589, 0, 0, 1, 1, 1,
-0.613412, -0.6120262, -2.594512, 1, 0, 0, 1, 1,
-0.608622, -0.0946597, -1.973485, 1, 0, 0, 1, 1,
-0.6081668, -1.030651, -1.278136, 1, 0, 0, 1, 1,
-0.5998698, 0.7733918, -0.7837324, 1, 0, 0, 1, 1,
-0.5979654, -1.139189, -2.250505, 1, 0, 0, 1, 1,
-0.591454, -0.4148523, -1.990249, 0, 0, 0, 1, 1,
-0.5905792, 0.2044133, -0.8232163, 0, 0, 0, 1, 1,
-0.588215, 0.1784474, -1.08748, 0, 0, 0, 1, 1,
-0.5811093, 1.790088, -0.6638854, 0, 0, 0, 1, 1,
-0.5799126, 0.8081869, 0.7100279, 0, 0, 0, 1, 1,
-0.5773672, 0.2436449, 0.09801563, 0, 0, 0, 1, 1,
-0.5761625, 0.7197577, -0.509932, 0, 0, 0, 1, 1,
-0.5734169, 0.1086574, -1.275544, 1, 1, 1, 1, 1,
-0.5726117, 0.249692, -1.781074, 1, 1, 1, 1, 1,
-0.5623498, 0.5834236, -1.591502, 1, 1, 1, 1, 1,
-0.5588783, 0.6746166, -1.358606, 1, 1, 1, 1, 1,
-0.5583484, 1.087967, 0.3339841, 1, 1, 1, 1, 1,
-0.5573537, -0.4790924, -2.973077, 1, 1, 1, 1, 1,
-0.5552337, -0.6862618, -2.6295, 1, 1, 1, 1, 1,
-0.5546719, -0.4717248, -2.698753, 1, 1, 1, 1, 1,
-0.5499485, -1.003601, -2.472347, 1, 1, 1, 1, 1,
-0.5498547, -0.07381334, -2.22091, 1, 1, 1, 1, 1,
-0.5494544, -0.5287701, -0.2850534, 1, 1, 1, 1, 1,
-0.546805, -1.539714, -3.629481, 1, 1, 1, 1, 1,
-0.5458359, -0.2540731, -2.188078, 1, 1, 1, 1, 1,
-0.5442287, -1.726061, -1.52617, 1, 1, 1, 1, 1,
-0.5428324, -0.3076345, -3.416909, 1, 1, 1, 1, 1,
-0.5401928, -0.8632427, -1.71543, 0, 0, 1, 1, 1,
-0.536324, -0.4685921, -2.853708, 1, 0, 0, 1, 1,
-0.533825, 0.9070045, -1.49848, 1, 0, 0, 1, 1,
-0.5313936, -1.327194, -2.293831, 1, 0, 0, 1, 1,
-0.5241313, 1.157116, -1.207357, 1, 0, 0, 1, 1,
-0.5184371, 1.602271, -0.7114235, 1, 0, 0, 1, 1,
-0.5156476, -0.2209907, -1.954706, 0, 0, 0, 1, 1,
-0.5028272, -0.1399332, -1.562713, 0, 0, 0, 1, 1,
-0.5021989, -1.648578, -2.854637, 0, 0, 0, 1, 1,
-0.5020558, 1.247813, -0.2827235, 0, 0, 0, 1, 1,
-0.4995835, 0.3702367, 0.5642349, 0, 0, 0, 1, 1,
-0.4990575, -0.6209733, -4.235081, 0, 0, 0, 1, 1,
-0.4962336, 0.002250601, -2.547155, 0, 0, 0, 1, 1,
-0.4945589, 0.9016176, -0.8616695, 1, 1, 1, 1, 1,
-0.4901217, 1.105768, -0.09930054, 1, 1, 1, 1, 1,
-0.4878715, -0.2943136, -2.694068, 1, 1, 1, 1, 1,
-0.4849023, -2.310889, -1.977256, 1, 1, 1, 1, 1,
-0.4826622, 1.416743, -1.35184, 1, 1, 1, 1, 1,
-0.4821321, 0.10201, -1.452183, 1, 1, 1, 1, 1,
-0.4813547, 0.8616258, 0.09925057, 1, 1, 1, 1, 1,
-0.4808836, 0.5220184, 0.06443725, 1, 1, 1, 1, 1,
-0.4805527, -0.8477047, -4.220366, 1, 1, 1, 1, 1,
-0.4791616, 1.284584, 0.5923016, 1, 1, 1, 1, 1,
-0.4765167, 0.258868, -0.7989649, 1, 1, 1, 1, 1,
-0.4730617, -0.058003, -1.002074, 1, 1, 1, 1, 1,
-0.4702164, 0.5268099, 0.2889187, 1, 1, 1, 1, 1,
-0.4660923, -1.03274, -1.303283, 1, 1, 1, 1, 1,
-0.4624276, -0.3796077, -2.842829, 1, 1, 1, 1, 1,
-0.4578336, -1.537128, -3.520652, 0, 0, 1, 1, 1,
-0.4531091, 0.3836901, 0.02437656, 1, 0, 0, 1, 1,
-0.4511852, -0.601445, -2.793701, 1, 0, 0, 1, 1,
-0.4481278, 1.230528, -1.162041, 1, 0, 0, 1, 1,
-0.4430677, -2.508472, -2.449657, 1, 0, 0, 1, 1,
-0.4402429, 2.379248, -0.03721299, 1, 0, 0, 1, 1,
-0.4401142, -1.904508, -2.71812, 0, 0, 0, 1, 1,
-0.4304889, 0.2881347, 0.01965115, 0, 0, 0, 1, 1,
-0.4285508, 0.0357086, -1.027053, 0, 0, 0, 1, 1,
-0.423274, -0.7040569, -1.893542, 0, 0, 0, 1, 1,
-0.4144636, -0.7868801, -2.386696, 0, 0, 0, 1, 1,
-0.4144014, -1.153878, -1.733101, 0, 0, 0, 1, 1,
-0.4136573, 1.199529, -2.236264, 0, 0, 0, 1, 1,
-0.4103292, -0.5312123, -1.89579, 1, 1, 1, 1, 1,
-0.4090849, 1.978696, 0.1995015, 1, 1, 1, 1, 1,
-0.4079506, -1.80327, -2.853992, 1, 1, 1, 1, 1,
-0.4045989, -0.679039, -2.989987, 1, 1, 1, 1, 1,
-0.4025102, -0.7722848, -1.464038, 1, 1, 1, 1, 1,
-0.3992662, 0.9077186, -1.213707, 1, 1, 1, 1, 1,
-0.3987832, -0.6009412, -2.254741, 1, 1, 1, 1, 1,
-0.3977352, 0.4301014, -0.8874622, 1, 1, 1, 1, 1,
-0.3974854, -1.31813, -2.604861, 1, 1, 1, 1, 1,
-0.397153, -0.5041824, -3.026371, 1, 1, 1, 1, 1,
-0.3926943, -2.306172, -1.962481, 1, 1, 1, 1, 1,
-0.3904465, 1.88222, -0.7768947, 1, 1, 1, 1, 1,
-0.3898151, -0.7788815, -3.483524, 1, 1, 1, 1, 1,
-0.3793294, -0.0524295, -0.9939755, 1, 1, 1, 1, 1,
-0.3791783, 0.9351334, 0.1280406, 1, 1, 1, 1, 1,
-0.37309, -0.08948775, -1.277868, 0, 0, 1, 1, 1,
-0.3669301, -0.1170982, -1.795577, 1, 0, 0, 1, 1,
-0.361009, 0.1424531, -0.08332292, 1, 0, 0, 1, 1,
-0.3604012, 0.1519641, -1.486393, 1, 0, 0, 1, 1,
-0.3596183, 0.09744968, -3.54715, 1, 0, 0, 1, 1,
-0.3583379, 0.1983165, -1.650403, 1, 0, 0, 1, 1,
-0.3564915, 1.415458, 0.9840524, 0, 0, 0, 1, 1,
-0.3528324, -0.1910114, -3.554679, 0, 0, 0, 1, 1,
-0.3523971, -1.509639, -2.101219, 0, 0, 0, 1, 1,
-0.3516431, -0.2045766, -2.915723, 0, 0, 0, 1, 1,
-0.3464461, -0.3825418, -1.606174, 0, 0, 0, 1, 1,
-0.3462209, -0.6869038, -2.370576, 0, 0, 0, 1, 1,
-0.3440449, -0.7278171, -0.9650401, 0, 0, 0, 1, 1,
-0.337608, 0.9069465, -0.326384, 1, 1, 1, 1, 1,
-0.336115, 1.273488, 0.761177, 1, 1, 1, 1, 1,
-0.334793, 2.261085, 0.7160449, 1, 1, 1, 1, 1,
-0.3343072, 0.8084782, -1.386838, 1, 1, 1, 1, 1,
-0.3331352, 0.5516652, -2.530724, 1, 1, 1, 1, 1,
-0.3303343, 0.3989668, -2.18427, 1, 1, 1, 1, 1,
-0.3301908, -0.1105114, -1.444536, 1, 1, 1, 1, 1,
-0.3301335, 1.34787, -0.946254, 1, 1, 1, 1, 1,
-0.3240705, 0.01083561, -1.817221, 1, 1, 1, 1, 1,
-0.3221708, 0.3012238, 0.1314946, 1, 1, 1, 1, 1,
-0.3199543, -0.8118896, -1.629011, 1, 1, 1, 1, 1,
-0.3198207, 0.9795601, -2.01923, 1, 1, 1, 1, 1,
-0.3190374, 0.5437759, 0.06142315, 1, 1, 1, 1, 1,
-0.3179675, 1.076915, 0.1502367, 1, 1, 1, 1, 1,
-0.3165889, -0.436367, -2.867923, 1, 1, 1, 1, 1,
-0.3148911, 0.0621477, -2.297654, 0, 0, 1, 1, 1,
-0.3112336, 1.20392, -1.476768, 1, 0, 0, 1, 1,
-0.3083418, 0.6409408, -1.54864, 1, 0, 0, 1, 1,
-0.3082311, 0.9797804, -0.3523323, 1, 0, 0, 1, 1,
-0.3047851, -0.8768669, -2.640043, 1, 0, 0, 1, 1,
-0.3017748, 1.682547, -1.223938, 1, 0, 0, 1, 1,
-0.301259, -1.993219, -3.367491, 0, 0, 0, 1, 1,
-0.3005034, 0.3264456, 0.06074429, 0, 0, 0, 1, 1,
-0.2974336, -0.4195355, -3.060786, 0, 0, 0, 1, 1,
-0.2962274, -0.617575, -3.683718, 0, 0, 0, 1, 1,
-0.2926526, 0.5948052, 0.09007524, 0, 0, 0, 1, 1,
-0.2898281, -1.494114, -3.325474, 0, 0, 0, 1, 1,
-0.2898174, -0.2345056, -3.40487, 0, 0, 0, 1, 1,
-0.2874188, -1.446546, -2.847293, 1, 1, 1, 1, 1,
-0.2836138, 0.213735, -1.353473, 1, 1, 1, 1, 1,
-0.2781983, -0.3628429, -2.159472, 1, 1, 1, 1, 1,
-0.2756033, 0.3419388, -0.6460189, 1, 1, 1, 1, 1,
-0.275114, -0.5172528, -3.112704, 1, 1, 1, 1, 1,
-0.2721121, 0.3468663, 0.05483937, 1, 1, 1, 1, 1,
-0.2645835, 0.6291215, -0.8782535, 1, 1, 1, 1, 1,
-0.2630467, -0.2049669, -2.333009, 1, 1, 1, 1, 1,
-0.2594732, 0.3013828, -0.9084342, 1, 1, 1, 1, 1,
-0.2594141, 0.9998609, -0.3502085, 1, 1, 1, 1, 1,
-0.2593873, 0.2954437, -2.45136, 1, 1, 1, 1, 1,
-0.2529905, 1.985855, 0.06223183, 1, 1, 1, 1, 1,
-0.2525171, -0.1841995, -3.208326, 1, 1, 1, 1, 1,
-0.2496072, -0.5858084, -2.972295, 1, 1, 1, 1, 1,
-0.2479406, 0.5678203, -0.06691055, 1, 1, 1, 1, 1,
-0.2473825, 1.450549, 0.07015456, 0, 0, 1, 1, 1,
-0.2468143, 1.890133, -0.5715671, 1, 0, 0, 1, 1,
-0.2458088, 0.7653536, 1.181664, 1, 0, 0, 1, 1,
-0.2436217, -0.2651656, -1.660112, 1, 0, 0, 1, 1,
-0.2410573, 0.3019354, -1.173919, 1, 0, 0, 1, 1,
-0.2287097, -0.4901323, -3.26842, 1, 0, 0, 1, 1,
-0.226615, 0.5592532, -1.572288, 0, 0, 0, 1, 1,
-0.2260666, 0.7103911, 0.009852177, 0, 0, 0, 1, 1,
-0.2259754, -1.042739, -6.610478, 0, 0, 0, 1, 1,
-0.2241505, -0.9677699, -3.262637, 0, 0, 0, 1, 1,
-0.2216624, 0.7705665, 1.453807, 0, 0, 0, 1, 1,
-0.2205517, 1.918486, -1.206437, 0, 0, 0, 1, 1,
-0.217226, -0.2186401, -3.549293, 0, 0, 0, 1, 1,
-0.2161851, -0.3212771, -2.541509, 1, 1, 1, 1, 1,
-0.2139131, -0.5584937, -4.093929, 1, 1, 1, 1, 1,
-0.2117802, -0.1994683, 0.6391381, 1, 1, 1, 1, 1,
-0.2096222, -0.6461921, -3.770017, 1, 1, 1, 1, 1,
-0.2048118, 0.395917, -1.270513, 1, 1, 1, 1, 1,
-0.2047082, 0.4588507, -2.945788, 1, 1, 1, 1, 1,
-0.2042644, -1.022142, -3.891686, 1, 1, 1, 1, 1,
-0.1998123, -0.9302425, -3.655388, 1, 1, 1, 1, 1,
-0.1971402, 1.055055, -0.1598672, 1, 1, 1, 1, 1,
-0.1966817, 1.410061, 1.083844, 1, 1, 1, 1, 1,
-0.1957428, 0.2308234, -0.9777023, 1, 1, 1, 1, 1,
-0.1880549, -0.07549044, -1.985684, 1, 1, 1, 1, 1,
-0.1879542, 0.5016903, -0.1167466, 1, 1, 1, 1, 1,
-0.1868148, -0.3439321, -3.288226, 1, 1, 1, 1, 1,
-0.1866516, 0.6029453, 0.1174141, 1, 1, 1, 1, 1,
-0.1852386, -0.4614152, -1.600186, 0, 0, 1, 1, 1,
-0.1845987, 0.4235401, -0.5892671, 1, 0, 0, 1, 1,
-0.1818411, -0.458659, -2.421807, 1, 0, 0, 1, 1,
-0.1805647, -0.2476487, -3.051869, 1, 0, 0, 1, 1,
-0.1792798, -0.2817445, -3.408743, 1, 0, 0, 1, 1,
-0.1766994, 0.2679724, -0.6609597, 1, 0, 0, 1, 1,
-0.1663054, -0.8569762, -0.5894716, 0, 0, 0, 1, 1,
-0.1651395, 0.9845309, -0.7231323, 0, 0, 0, 1, 1,
-0.1634165, 1.55317, 0.6103937, 0, 0, 0, 1, 1,
-0.1626388, 0.7118274, 1.18642, 0, 0, 0, 1, 1,
-0.1608644, -0.2707233, -1.679129, 0, 0, 0, 1, 1,
-0.1580817, 1.000721, -0.09900729, 0, 0, 0, 1, 1,
-0.1569265, -0.8813644, -2.396725, 0, 0, 0, 1, 1,
-0.1524699, 1.287964, 1.139494, 1, 1, 1, 1, 1,
-0.1417443, -0.135906, -2.093153, 1, 1, 1, 1, 1,
-0.1390305, -0.5233175, -3.574872, 1, 1, 1, 1, 1,
-0.1375338, -1.373806, -2.977852, 1, 1, 1, 1, 1,
-0.1375275, -0.05356534, -3.610108, 1, 1, 1, 1, 1,
-0.1353027, -0.4789857, -2.972272, 1, 1, 1, 1, 1,
-0.1318718, -0.1079759, -2.127074, 1, 1, 1, 1, 1,
-0.1308536, 1.756449, 0.7142372, 1, 1, 1, 1, 1,
-0.1299636, -0.4634183, -3.819821, 1, 1, 1, 1, 1,
-0.1294345, 1.092439, -1.669751, 1, 1, 1, 1, 1,
-0.1253127, -0.3965476, -2.676327, 1, 1, 1, 1, 1,
-0.1246101, 0.5379519, -0.1334053, 1, 1, 1, 1, 1,
-0.1240634, 0.3994903, -3.825864, 1, 1, 1, 1, 1,
-0.1217548, 1.809124, -0.134985, 1, 1, 1, 1, 1,
-0.1199092, -0.2970918, -3.200695, 1, 1, 1, 1, 1,
-0.1168488, -1.286925, -3.748578, 0, 0, 1, 1, 1,
-0.1142124, -0.6249315, -3.092721, 1, 0, 0, 1, 1,
-0.1125597, 0.01076349, -0.5468481, 1, 0, 0, 1, 1,
-0.1052556, -0.782374, -2.312976, 1, 0, 0, 1, 1,
-0.1050421, -0.3061073, -1.949742, 1, 0, 0, 1, 1,
-0.1026571, 1.529153, -0.5154404, 1, 0, 0, 1, 1,
-0.1014422, -1.741513, -2.216722, 0, 0, 0, 1, 1,
-0.1008858, -0.6934463, -2.925226, 0, 0, 0, 1, 1,
-0.09565232, -0.1455603, -4.801974, 0, 0, 0, 1, 1,
-0.08729904, 0.7418148, -1.432699, 0, 0, 0, 1, 1,
-0.08531005, -0.2875844, -4.08793, 0, 0, 0, 1, 1,
-0.07658312, -0.001561618, -0.9732841, 0, 0, 0, 1, 1,
-0.0738318, -1.696893, -5.253188, 0, 0, 0, 1, 1,
-0.07366359, -0.5604696, -4.030652, 1, 1, 1, 1, 1,
-0.06637371, -2.155169, -3.32078, 1, 1, 1, 1, 1,
-0.06455722, -0.2392755, -2.981625, 1, 1, 1, 1, 1,
-0.05837204, 0.1305383, -0.5495024, 1, 1, 1, 1, 1,
-0.05309391, 0.9043676, -1.179072, 1, 1, 1, 1, 1,
-0.052113, 0.2729193, 0.1551747, 1, 1, 1, 1, 1,
-0.04516239, 1.175552, -1.709386, 1, 1, 1, 1, 1,
-0.04381762, 1.848592, -1.221006, 1, 1, 1, 1, 1,
-0.04283457, -1.380305, -3.769341, 1, 1, 1, 1, 1,
-0.04241347, -1.3703, -2.50291, 1, 1, 1, 1, 1,
-0.03949859, -1.616782, -4.492262, 1, 1, 1, 1, 1,
-0.0312588, -0.4215858, -3.184917, 1, 1, 1, 1, 1,
-0.03015153, -1.004515, -4.655221, 1, 1, 1, 1, 1,
-0.02829642, -0.4680721, -3.34769, 1, 1, 1, 1, 1,
-0.02491116, 0.366369, 0.7078509, 1, 1, 1, 1, 1,
-0.02397686, 2.060582, 1.452123, 0, 0, 1, 1, 1,
-0.02087847, -0.8154614, -3.636007, 1, 0, 0, 1, 1,
-0.01535961, -1.235004, -3.075442, 1, 0, 0, 1, 1,
-0.00577132, -0.2258373, -3.168528, 1, 0, 0, 1, 1,
-0.005441977, 0.03834618, -1.425263, 1, 0, 0, 1, 1,
-0.002303032, 0.04664707, -1.545056, 1, 0, 0, 1, 1,
-0.002061738, -0.7198623, -2.14223, 0, 0, 0, 1, 1,
-0.0005570967, -0.02120224, -3.74737, 0, 0, 0, 1, 1,
0.01006886, 0.8739772, -0.4241296, 0, 0, 0, 1, 1,
0.01084643, -0.2953948, 0.2958621, 0, 0, 0, 1, 1,
0.01177055, 1.113714, 1.275419, 0, 0, 0, 1, 1,
0.01213158, 0.8337716, 0.7603943, 0, 0, 0, 1, 1,
0.01314246, -0.4702661, 3.069814, 0, 0, 0, 1, 1,
0.01365625, 0.3176831, -0.1356608, 1, 1, 1, 1, 1,
0.01489222, 1.206556, 1.227292, 1, 1, 1, 1, 1,
0.01498419, 0.9470636, 1.306207, 1, 1, 1, 1, 1,
0.01641412, 0.8027547, -1.391174, 1, 1, 1, 1, 1,
0.02042893, -1.16595, 3.225212, 1, 1, 1, 1, 1,
0.02058896, -0.02934616, 2.331753, 1, 1, 1, 1, 1,
0.02226638, -1.611796, 2.702852, 1, 1, 1, 1, 1,
0.02235849, -0.05697484, 3.07805, 1, 1, 1, 1, 1,
0.02566966, -0.7484781, 1.809441, 1, 1, 1, 1, 1,
0.02699842, -0.554329, 4.201332, 1, 1, 1, 1, 1,
0.02783391, -0.5293591, 2.571254, 1, 1, 1, 1, 1,
0.03435593, -2.975208, 2.580074, 1, 1, 1, 1, 1,
0.03510937, 0.1923126, 0.2246305, 1, 1, 1, 1, 1,
0.04079838, 0.9924535, 0.7088478, 1, 1, 1, 1, 1,
0.04164061, -0.8787633, 2.541047, 1, 1, 1, 1, 1,
0.04401399, -1.048567, 3.28755, 0, 0, 1, 1, 1,
0.04534035, -0.1955405, 3.192689, 1, 0, 0, 1, 1,
0.04559904, -1.035897, 1.566481, 1, 0, 0, 1, 1,
0.05101792, -0.6310641, 2.445532, 1, 0, 0, 1, 1,
0.05819469, -0.7423787, 2.967998, 1, 0, 0, 1, 1,
0.0666307, -0.5549861, 3.554054, 1, 0, 0, 1, 1,
0.06756856, 0.1046736, 0.5439392, 0, 0, 0, 1, 1,
0.07070208, -1.213269, 4.002514, 0, 0, 0, 1, 1,
0.07895112, -1.306784, 1.683914, 0, 0, 0, 1, 1,
0.08543423, -0.2441695, 1.642449, 0, 0, 0, 1, 1,
0.08768082, -0.9210168, 3.631563, 0, 0, 0, 1, 1,
0.08803201, 0.1580173, 0.9506749, 0, 0, 0, 1, 1,
0.08938152, -0.9807679, 2.785861, 0, 0, 0, 1, 1,
0.08977507, -0.124968, 2.189278, 1, 1, 1, 1, 1,
0.09064075, 0.05306635, 2.141166, 1, 1, 1, 1, 1,
0.09185433, 0.7657191, 0.02057681, 1, 1, 1, 1, 1,
0.09275914, 1.098837, 1.178048, 1, 1, 1, 1, 1,
0.09738412, -0.4183098, 3.679269, 1, 1, 1, 1, 1,
0.1005903, -1.623911, 1.630447, 1, 1, 1, 1, 1,
0.1007204, -1.757396, 3.274004, 1, 1, 1, 1, 1,
0.1046303, 0.7795578, -1.132375, 1, 1, 1, 1, 1,
0.1068261, -1.738602, 3.527135, 1, 1, 1, 1, 1,
0.1069665, -0.02979907, 1.506584, 1, 1, 1, 1, 1,
0.1155821, 0.2928858, 0.6717298, 1, 1, 1, 1, 1,
0.1211829, -1.123229, 2.903295, 1, 1, 1, 1, 1,
0.1274636, -0.7601312, 1.999828, 1, 1, 1, 1, 1,
0.1280462, -0.9511165, 1.938563, 1, 1, 1, 1, 1,
0.1300512, 0.4491111, 0.6419936, 1, 1, 1, 1, 1,
0.1308621, -1.170456, 3.223118, 0, 0, 1, 1, 1,
0.1351192, -1.033458, 3.563904, 1, 0, 0, 1, 1,
0.1380451, 0.8541504, -0.1196962, 1, 0, 0, 1, 1,
0.1429643, 1.30591, 1.701311, 1, 0, 0, 1, 1,
0.1461632, 1.578424, 2.170474, 1, 0, 0, 1, 1,
0.1499578, -0.3453659, 1.734117, 1, 0, 0, 1, 1,
0.1539295, 0.1045099, 3.690759, 0, 0, 0, 1, 1,
0.1567522, -1.014055, 4.564816, 0, 0, 0, 1, 1,
0.1583613, 0.4260831, -0.5010002, 0, 0, 0, 1, 1,
0.1585258, 0.6741778, 1.284547, 0, 0, 0, 1, 1,
0.1611385, 0.0394511, 2.124076, 0, 0, 0, 1, 1,
0.1614268, -0.244052, 2.879775, 0, 0, 0, 1, 1,
0.1666695, -0.1419097, 1.07146, 0, 0, 0, 1, 1,
0.1666768, -0.7831875, 2.279953, 1, 1, 1, 1, 1,
0.1668439, -0.7250828, 3.02608, 1, 1, 1, 1, 1,
0.1701735, -0.5552707, 1.88885, 1, 1, 1, 1, 1,
0.1705679, -0.4352559, 4.910704, 1, 1, 1, 1, 1,
0.1756999, -2.403791, 5.272676, 1, 1, 1, 1, 1,
0.1767062, 1.827692, 0.1253586, 1, 1, 1, 1, 1,
0.1770962, -1.927752, 4.02005, 1, 1, 1, 1, 1,
0.178409, 0.3427803, 1.09299, 1, 1, 1, 1, 1,
0.1787748, 1.6122, 1.879982, 1, 1, 1, 1, 1,
0.1872846, -0.6451563, 3.959632, 1, 1, 1, 1, 1,
0.187633, 1.575983, 0.1600345, 1, 1, 1, 1, 1,
0.1947906, -0.9373654, 4.406809, 1, 1, 1, 1, 1,
0.1953541, -0.01746941, 1.293921, 1, 1, 1, 1, 1,
0.1957612, -1.015392, 3.936096, 1, 1, 1, 1, 1,
0.2000558, 0.9330716, 0.4836245, 1, 1, 1, 1, 1,
0.2052368, 0.2380531, 0.4102195, 0, 0, 1, 1, 1,
0.2079529, 0.3794447, -1.006084, 1, 0, 0, 1, 1,
0.2087463, 1.455844, -1.061645, 1, 0, 0, 1, 1,
0.2106887, 1.504211, 0.1586309, 1, 0, 0, 1, 1,
0.2118259, -0.116976, 1.222263, 1, 0, 0, 1, 1,
0.2135333, 2.098588, -0.3353151, 1, 0, 0, 1, 1,
0.2159455, 1.151676, -1.800802, 0, 0, 0, 1, 1,
0.2170648, -0.4966911, 3.887415, 0, 0, 0, 1, 1,
0.2184569, 1.458715, 0.3110044, 0, 0, 0, 1, 1,
0.2198454, 0.2833273, -0.3928322, 0, 0, 0, 1, 1,
0.2202487, -0.3966394, 3.92309, 0, 0, 0, 1, 1,
0.2227097, -1.042209, 5.031888, 0, 0, 0, 1, 1,
0.2265514, 0.6221751, 0.3507401, 0, 0, 0, 1, 1,
0.2329666, -0.6177171, 2.695242, 1, 1, 1, 1, 1,
0.2349393, -0.3242327, 2.65934, 1, 1, 1, 1, 1,
0.2361452, 0.279639, 0.5586413, 1, 1, 1, 1, 1,
0.236794, 0.3403844, -0.01341708, 1, 1, 1, 1, 1,
0.238695, -0.8487905, 4.3517, 1, 1, 1, 1, 1,
0.2397777, 0.7978782, 0.5873389, 1, 1, 1, 1, 1,
0.2448934, -0.3567593, 3.94113, 1, 1, 1, 1, 1,
0.2562377, -0.1885108, 1.619206, 1, 1, 1, 1, 1,
0.2565641, 0.4750356, -1.209137, 1, 1, 1, 1, 1,
0.261515, 1.312601, 0.3231709, 1, 1, 1, 1, 1,
0.2617997, -0.4693383, 3.758623, 1, 1, 1, 1, 1,
0.2671629, 0.004713452, 1.383506, 1, 1, 1, 1, 1,
0.2681569, -0.1033678, 2.872448, 1, 1, 1, 1, 1,
0.2685665, 0.5657294, 1.378616, 1, 1, 1, 1, 1,
0.2691458, -1.656973, 2.231083, 1, 1, 1, 1, 1,
0.2721266, 1.530592, 0.9405629, 0, 0, 1, 1, 1,
0.27837, 0.5586842, 0.502728, 1, 0, 0, 1, 1,
0.2805434, 0.6901855, 0.2865308, 1, 0, 0, 1, 1,
0.2823554, -0.6380157, 3.95878, 1, 0, 0, 1, 1,
0.2917804, 0.205212, -0.249965, 1, 0, 0, 1, 1,
0.292277, 0.3594821, 3.087699, 1, 0, 0, 1, 1,
0.2951499, 0.4478382, 0.392997, 0, 0, 0, 1, 1,
0.2966754, 1.184077, 1.131138, 0, 0, 0, 1, 1,
0.2969994, -2.202782, 2.135945, 0, 0, 0, 1, 1,
0.3046456, 0.1444602, 0.3574579, 0, 0, 0, 1, 1,
0.3051207, -1.952806, 2.451696, 0, 0, 0, 1, 1,
0.3059708, 0.02899389, 1.294075, 0, 0, 0, 1, 1,
0.3100311, 2.155035, -0.1521574, 0, 0, 0, 1, 1,
0.3107572, -0.8175887, 3.553409, 1, 1, 1, 1, 1,
0.3132311, 1.670502, -0.7134503, 1, 1, 1, 1, 1,
0.3159743, 0.1052723, 1.357143, 1, 1, 1, 1, 1,
0.3212023, -1.046622, 3.615415, 1, 1, 1, 1, 1,
0.3215907, -1.435327, 2.425625, 1, 1, 1, 1, 1,
0.3237796, 2.219724, -0.2384883, 1, 1, 1, 1, 1,
0.3261626, -0.02110852, 2.248856, 1, 1, 1, 1, 1,
0.3310862, 0.2037458, 2.120493, 1, 1, 1, 1, 1,
0.3444727, -0.4408247, 1.326012, 1, 1, 1, 1, 1,
0.3446954, 0.535307, -0.04940221, 1, 1, 1, 1, 1,
0.3463688, 0.9122627, 0.9303244, 1, 1, 1, 1, 1,
0.3507186, -0.2386352, 2.078679, 1, 1, 1, 1, 1,
0.3539517, 1.029672, -1.28999, 1, 1, 1, 1, 1,
0.3564538, 0.5344191, -0.1178553, 1, 1, 1, 1, 1,
0.3593922, -1.260902, 4.596377, 1, 1, 1, 1, 1,
0.3602496, -0.2202366, 0.8468667, 0, 0, 1, 1, 1,
0.3622954, 0.6172932, -0.9821081, 1, 0, 0, 1, 1,
0.3679301, -0.2514031, 3.968727, 1, 0, 0, 1, 1,
0.3757282, 1.20099, -1.137254, 1, 0, 0, 1, 1,
0.3785415, -0.3483703, 1.672407, 1, 0, 0, 1, 1,
0.3818847, 1.114437, 0.4747334, 1, 0, 0, 1, 1,
0.382712, 0.7062794, 1.086509, 0, 0, 0, 1, 1,
0.3862368, -0.04315151, 0.873349, 0, 0, 0, 1, 1,
0.3881654, 0.1721168, 1.805984, 0, 0, 0, 1, 1,
0.3887862, -0.7748732, 2.455933, 0, 0, 0, 1, 1,
0.399661, -0.04895274, 1.859719, 0, 0, 0, 1, 1,
0.4069529, -0.09540793, 2.849834, 0, 0, 0, 1, 1,
0.4099112, -0.1780235, 1.757913, 0, 0, 0, 1, 1,
0.4108548, -2.221177, 0.5500722, 1, 1, 1, 1, 1,
0.4160361, -1.202319, 3.585141, 1, 1, 1, 1, 1,
0.4170899, 0.3666366, 1.777066, 1, 1, 1, 1, 1,
0.4174185, 1.113154, -0.4796346, 1, 1, 1, 1, 1,
0.4193781, -0.4270431, 4.653071, 1, 1, 1, 1, 1,
0.4256088, 0.7125277, -0.6434031, 1, 1, 1, 1, 1,
0.4268929, -0.1767234, 0.889172, 1, 1, 1, 1, 1,
0.4282122, 0.8384351, 1.710336, 1, 1, 1, 1, 1,
0.4343091, 0.4337429, 0.05370208, 1, 1, 1, 1, 1,
0.434754, 0.4216859, 0.01285123, 1, 1, 1, 1, 1,
0.4377508, -0.9348131, 1.250493, 1, 1, 1, 1, 1,
0.4380437, -0.6844544, 2.280758, 1, 1, 1, 1, 1,
0.4382348, -0.2503588, 3.135645, 1, 1, 1, 1, 1,
0.4390651, 0.4977576, -0.1690708, 1, 1, 1, 1, 1,
0.441815, -1.182757, 2.338653, 1, 1, 1, 1, 1,
0.4427458, -0.3281365, 2.912699, 0, 0, 1, 1, 1,
0.4441848, 2.403551, -0.007478961, 1, 0, 0, 1, 1,
0.4457553, -0.1685328, 0.3056948, 1, 0, 0, 1, 1,
0.4460375, 1.510483, 0.7936585, 1, 0, 0, 1, 1,
0.4467003, -0.006315611, -0.02322228, 1, 0, 0, 1, 1,
0.4475367, 0.5790659, 1.535563, 1, 0, 0, 1, 1,
0.4493142, 0.8215951, 0.5736051, 0, 0, 0, 1, 1,
0.4498282, -0.8963924, 3.138913, 0, 0, 0, 1, 1,
0.4533983, -0.005996525, 1.396434, 0, 0, 0, 1, 1,
0.4540323, 0.4358869, 0.1345771, 0, 0, 0, 1, 1,
0.4548706, -0.5584344, 3.193388, 0, 0, 0, 1, 1,
0.4585185, -0.03331632, 2.337355, 0, 0, 0, 1, 1,
0.4676251, 2.210923, 2.175764, 0, 0, 0, 1, 1,
0.4733361, -0.9438091, 1.681315, 1, 1, 1, 1, 1,
0.4768304, 0.2654872, -0.4918137, 1, 1, 1, 1, 1,
0.4830081, -0.6902789, 2.755044, 1, 1, 1, 1, 1,
0.4831859, 0.9976996, -0.1387064, 1, 1, 1, 1, 1,
0.4833564, -0.2082839, 1.580566, 1, 1, 1, 1, 1,
0.4847305, 0.5493127, -0.2397629, 1, 1, 1, 1, 1,
0.486344, -0.05633106, 0.4864947, 1, 1, 1, 1, 1,
0.495824, 0.9566309, 0.6380003, 1, 1, 1, 1, 1,
0.4961962, 0.5513989, 1.194276, 1, 1, 1, 1, 1,
0.4995938, 1.517325, -1.231872, 1, 1, 1, 1, 1,
0.5017005, -0.5981234, 1.91648, 1, 1, 1, 1, 1,
0.5021008, 0.4397666, 0.9985933, 1, 1, 1, 1, 1,
0.5025419, 0.389208, -0.1301384, 1, 1, 1, 1, 1,
0.5037899, 0.2590986, 0.3964474, 1, 1, 1, 1, 1,
0.505404, -1.121299, 3.147327, 1, 1, 1, 1, 1,
0.5065163, -0.3032521, 2.722065, 0, 0, 1, 1, 1,
0.5083585, 0.3713527, -0.4643763, 1, 0, 0, 1, 1,
0.5140445, -0.81461, 3.132144, 1, 0, 0, 1, 1,
0.515196, 0.8357368, 2.329446, 1, 0, 0, 1, 1,
0.515751, -0.2442213, 2.556888, 1, 0, 0, 1, 1,
0.517503, -1.485956, 1.273009, 1, 0, 0, 1, 1,
0.5196462, 1.436879, 0.147701, 0, 0, 0, 1, 1,
0.5214665, 1.022687, 1.274107, 0, 0, 0, 1, 1,
0.5233881, 1.262681, 1.304693, 0, 0, 0, 1, 1,
0.5246639, 0.1278677, 3.029697, 0, 0, 0, 1, 1,
0.5340093, 0.6703738, 0.2900915, 0, 0, 0, 1, 1,
0.5340668, -0.1398812, 1.52997, 0, 0, 0, 1, 1,
0.5431481, -1.024598, 1.873205, 0, 0, 0, 1, 1,
0.5460281, -0.2560151, 1.591787, 1, 1, 1, 1, 1,
0.5532721, 1.877273, 0.5914221, 1, 1, 1, 1, 1,
0.5549843, -1.539636, 2.891213, 1, 1, 1, 1, 1,
0.5585638, -1.227486, 2.732428, 1, 1, 1, 1, 1,
0.5595686, 0.6235459, 1.520937, 1, 1, 1, 1, 1,
0.560883, 1.666529, 1.85359, 1, 1, 1, 1, 1,
0.5697436, -0.5209768, 2.02232, 1, 1, 1, 1, 1,
0.5753272, 0.4994759, 1.678536, 1, 1, 1, 1, 1,
0.5753504, 0.3269053, 0.05669281, 1, 1, 1, 1, 1,
0.5804024, 0.3644545, -0.1940306, 1, 1, 1, 1, 1,
0.5835844, 0.3833095, 2.336469, 1, 1, 1, 1, 1,
0.5854514, -0.726961, 2.548872, 1, 1, 1, 1, 1,
0.5878739, 1.305843, -0.9476889, 1, 1, 1, 1, 1,
0.5879273, -0.1203242, 1.68264, 1, 1, 1, 1, 1,
0.5882589, -0.5279217, 1.871884, 1, 1, 1, 1, 1,
0.5919207, -0.1703924, 1.134587, 0, 0, 1, 1, 1,
0.5928808, -0.09223223, 1.41847, 1, 0, 0, 1, 1,
0.5931026, -0.5231491, 3.149154, 1, 0, 0, 1, 1,
0.5966303, 0.05763175, 1.638655, 1, 0, 0, 1, 1,
0.5966758, -0.3634497, 3.490629, 1, 0, 0, 1, 1,
0.5974064, 0.4727159, 0.2243797, 1, 0, 0, 1, 1,
0.5974553, -0.228982, 4.004037, 0, 0, 0, 1, 1,
0.5978885, 0.3940717, 2.494076, 0, 0, 0, 1, 1,
0.5986721, -0.3559227, 2.164634, 0, 0, 0, 1, 1,
0.6037345, -0.3515511, 0.1677389, 0, 0, 0, 1, 1,
0.6072478, -0.3338602, 0.8470174, 0, 0, 0, 1, 1,
0.6073571, 0.215336, 1.305677, 0, 0, 0, 1, 1,
0.6140692, -0.2655069, 1.814527, 0, 0, 0, 1, 1,
0.6215831, 0.2345508, 1.829868, 1, 1, 1, 1, 1,
0.6225131, 1.159833, 1.278564, 1, 1, 1, 1, 1,
0.6253725, -1.886537, 4.144773, 1, 1, 1, 1, 1,
0.627381, 1.995845, -0.4545065, 1, 1, 1, 1, 1,
0.6290331, -0.3816912, 1.703142, 1, 1, 1, 1, 1,
0.6306489, -0.469775, 1.985784, 1, 1, 1, 1, 1,
0.6343789, 0.3466538, 1.763902, 1, 1, 1, 1, 1,
0.6347857, -2.307321, 3.507086, 1, 1, 1, 1, 1,
0.6352329, 0.2421147, 1.104223, 1, 1, 1, 1, 1,
0.6370785, -0.5448278, 3.503786, 1, 1, 1, 1, 1,
0.6389827, -1.397131, 2.22846, 1, 1, 1, 1, 1,
0.6396814, 0.4956803, -0.2441769, 1, 1, 1, 1, 1,
0.6403508, 0.8308153, -0.2298463, 1, 1, 1, 1, 1,
0.641417, -0.0356326, 3.572909, 1, 1, 1, 1, 1,
0.6473029, -0.1704286, 1.883773, 1, 1, 1, 1, 1,
0.6566482, -0.5539446, 1.28987, 0, 0, 1, 1, 1,
0.6591699, -0.3818006, 1.367867, 1, 0, 0, 1, 1,
0.6609682, -0.2620004, 2.793904, 1, 0, 0, 1, 1,
0.6624399, -0.3786301, 2.96195, 1, 0, 0, 1, 1,
0.6642028, -1.242914, 3.858919, 1, 0, 0, 1, 1,
0.6739126, -0.8641843, 3.109153, 1, 0, 0, 1, 1,
0.6745269, -0.9823326, 1.074699, 0, 0, 0, 1, 1,
0.6781632, -0.7305216, 2.720218, 0, 0, 0, 1, 1,
0.682276, -0.1426817, 3.314026, 0, 0, 0, 1, 1,
0.6850117, 1.342137, -0.02546217, 0, 0, 0, 1, 1,
0.6854316, 0.4258469, -0.1559138, 0, 0, 0, 1, 1,
0.6872628, 0.5979604, 0.1768578, 0, 0, 0, 1, 1,
0.6885669, 0.373381, 0.5765767, 0, 0, 0, 1, 1,
0.6911896, -0.2062556, 1.225012, 1, 1, 1, 1, 1,
0.6926963, 0.179877, 1.885447, 1, 1, 1, 1, 1,
0.6957613, -0.2778856, 1.565359, 1, 1, 1, 1, 1,
0.7002253, 0.6987374, 0.9863838, 1, 1, 1, 1, 1,
0.7048734, 0.3366342, 1.174855, 1, 1, 1, 1, 1,
0.7100629, 0.1764069, 1.986805, 1, 1, 1, 1, 1,
0.7109129, 1.41898, 1.06053, 1, 1, 1, 1, 1,
0.7125511, -0.632707, 3.625798, 1, 1, 1, 1, 1,
0.7138811, 0.7910959, 0.2680362, 1, 1, 1, 1, 1,
0.7168863, -0.4474796, 0.6579192, 1, 1, 1, 1, 1,
0.7282053, -1.365674, 1.367911, 1, 1, 1, 1, 1,
0.7347806, -0.8864998, 1.58395, 1, 1, 1, 1, 1,
0.7354214, -0.6077225, 3.264237, 1, 1, 1, 1, 1,
0.7386528, 1.611331, -0.2075492, 1, 1, 1, 1, 1,
0.7394923, 0.4673069, 2.600417, 1, 1, 1, 1, 1,
0.7417907, -1.074268, 2.249966, 0, 0, 1, 1, 1,
0.7418862, -0.159517, 0.6382712, 1, 0, 0, 1, 1,
0.7420214, -0.8696641, 2.332918, 1, 0, 0, 1, 1,
0.7430949, -0.3400571, 0.5841725, 1, 0, 0, 1, 1,
0.7446927, -0.1305164, 1.241586, 1, 0, 0, 1, 1,
0.7481895, -0.6031199, 3.464464, 1, 0, 0, 1, 1,
0.7510542, -1.252407, 1.39667, 0, 0, 0, 1, 1,
0.7529607, -0.291944, 2.233521, 0, 0, 0, 1, 1,
0.7544419, -0.827589, 0.9239799, 0, 0, 0, 1, 1,
0.7551272, 0.1154853, 0.06458542, 0, 0, 0, 1, 1,
0.7583653, -1.009027, 3.007777, 0, 0, 0, 1, 1,
0.7609847, -1.190225, 0.6837592, 0, 0, 0, 1, 1,
0.7615103, -0.6443899, 1.837667, 0, 0, 0, 1, 1,
0.764259, 0.7134315, 0.2003992, 1, 1, 1, 1, 1,
0.7698476, 0.3181412, 1.006349, 1, 1, 1, 1, 1,
0.7731234, 0.04382225, 0.5630264, 1, 1, 1, 1, 1,
0.7774674, -1.309736, 1.710053, 1, 1, 1, 1, 1,
0.7812168, -1.304917, 2.679295, 1, 1, 1, 1, 1,
0.7818918, 1.168365, -1.474354, 1, 1, 1, 1, 1,
0.7908785, 0.1962495, 1.662621, 1, 1, 1, 1, 1,
0.7934716, 1.678852, 0.527145, 1, 1, 1, 1, 1,
0.7976275, 0.2929437, -0.3165081, 1, 1, 1, 1, 1,
0.80044, -1.577066, 4.942632, 1, 1, 1, 1, 1,
0.8092439, -1.779212, 2.187047, 1, 1, 1, 1, 1,
0.8109589, 0.4171597, 2.62646, 1, 1, 1, 1, 1,
0.8149372, -0.3936429, 1.79755, 1, 1, 1, 1, 1,
0.8180427, 0.6612705, 2.327994, 1, 1, 1, 1, 1,
0.8184335, 0.4797143, -0.3312227, 1, 1, 1, 1, 1,
0.8443981, 0.6588544, 0.8434008, 0, 0, 1, 1, 1,
0.8480979, 2.239119, -1.023481, 1, 0, 0, 1, 1,
0.8570678, 0.8364658, -0.3589171, 1, 0, 0, 1, 1,
0.8584045, 1.291412, -0.3799042, 1, 0, 0, 1, 1,
0.8757503, 0.8300288, 1.465817, 1, 0, 0, 1, 1,
0.8767943, -0.6367214, 2.054702, 1, 0, 0, 1, 1,
0.8821707, -0.2341082, 0.7564005, 0, 0, 0, 1, 1,
0.8893417, 2.20748, -0.01295704, 0, 0, 0, 1, 1,
0.8933368, -0.5704713, -0.4386519, 0, 0, 0, 1, 1,
0.9023686, 0.1841373, 1.562103, 0, 0, 0, 1, 1,
0.9032835, -0.7294726, 2.475342, 0, 0, 0, 1, 1,
0.9047422, 0.4250198, 0.4058481, 0, 0, 0, 1, 1,
0.9056854, -1.00816, 1.644279, 0, 0, 0, 1, 1,
0.9058051, 0.707123, 2.802186, 1, 1, 1, 1, 1,
0.9154218, -0.5666361, 0.3213441, 1, 1, 1, 1, 1,
0.9156737, 0.09571511, 1.898388, 1, 1, 1, 1, 1,
0.9164829, -0.829728, 3.223198, 1, 1, 1, 1, 1,
0.9185503, -2.121636, 1.939083, 1, 1, 1, 1, 1,
0.9219336, -0.06199037, 2.045765, 1, 1, 1, 1, 1,
0.923456, 0.3308686, -0.4738335, 1, 1, 1, 1, 1,
0.924398, -0.1058637, 0.7137704, 1, 1, 1, 1, 1,
0.9339694, -1.941501, 2.062535, 1, 1, 1, 1, 1,
0.9356899, 1.709151, 0.5456437, 1, 1, 1, 1, 1,
0.9395576, 0.6997501, -0.7255457, 1, 1, 1, 1, 1,
0.9413287, -1.579734, 2.256929, 1, 1, 1, 1, 1,
0.9430555, -0.2064106, 1.096512, 1, 1, 1, 1, 1,
0.9462108, -0.8287377, 2.44925, 1, 1, 1, 1, 1,
0.9502891, -0.3962747, 2.564717, 1, 1, 1, 1, 1,
0.9522222, -0.5928884, 3.633774, 0, 0, 1, 1, 1,
0.9587964, 1.169209, 2.998842, 1, 0, 0, 1, 1,
0.962983, -1.363489, 2.28547, 1, 0, 0, 1, 1,
0.9702528, -0.3746645, 2.767272, 1, 0, 0, 1, 1,
0.9733608, 0.3178165, 1.595624, 1, 0, 0, 1, 1,
0.9803692, 0.1122024, 2.160299, 1, 0, 0, 1, 1,
0.9807145, 0.8938559, 0.246135, 0, 0, 0, 1, 1,
0.9844216, -1.172352, 2.100985, 0, 0, 0, 1, 1,
0.9856243, 0.05529917, 0.9261611, 0, 0, 0, 1, 1,
0.987022, -1.797024, 2.5246, 0, 0, 0, 1, 1,
0.9890205, 1.569059, 0.9797987, 0, 0, 0, 1, 1,
0.9897743, 0.1940818, 0.8170941, 0, 0, 0, 1, 1,
0.9977344, 0.01359038, 0.2929151, 0, 0, 0, 1, 1,
1.003124, -0.3842875, 1.648105, 1, 1, 1, 1, 1,
1.008311, 0.05161792, 1.816937, 1, 1, 1, 1, 1,
1.009513, 0.652442, 0.2204949, 1, 1, 1, 1, 1,
1.018688, -0.5296537, 4.944597, 1, 1, 1, 1, 1,
1.029465, -0.419248, 2.811876, 1, 1, 1, 1, 1,
1.030979, -2.558908, 2.858348, 1, 1, 1, 1, 1,
1.032385, 1.385725, 1.209926, 1, 1, 1, 1, 1,
1.034909, 0.6770617, 1.660098, 1, 1, 1, 1, 1,
1.036859, -0.3382996, 1.825327, 1, 1, 1, 1, 1,
1.046901, 0.3897214, 1.427061, 1, 1, 1, 1, 1,
1.046915, -0.07170805, 1.725887, 1, 1, 1, 1, 1,
1.051258, -2.115537, 2.190963, 1, 1, 1, 1, 1,
1.057311, -0.4433048, 2.498453, 1, 1, 1, 1, 1,
1.062686, 1.103275, 2.188984, 1, 1, 1, 1, 1,
1.067242, -0.4228324, 0.03662411, 1, 1, 1, 1, 1,
1.092484, 0.2981915, 2.462433, 0, 0, 1, 1, 1,
1.09394, -1.026033, 3.334734, 1, 0, 0, 1, 1,
1.112349, 1.046005, 0.2360375, 1, 0, 0, 1, 1,
1.114966, -0.6871681, 1.58628, 1, 0, 0, 1, 1,
1.123835, 0.7337914, 1.086272, 1, 0, 0, 1, 1,
1.124366, 0.4596834, 0.6022593, 1, 0, 0, 1, 1,
1.125645, -2.119396, 3.795819, 0, 0, 0, 1, 1,
1.126519, 0.2807194, 1.573944, 0, 0, 0, 1, 1,
1.129769, 0.3221885, 2.045532, 0, 0, 0, 1, 1,
1.134083, -0.4250974, 1.481804, 0, 0, 0, 1, 1,
1.134316, -0.9817094, 2.567096, 0, 0, 0, 1, 1,
1.136901, -1.505676, 2.61542, 0, 0, 0, 1, 1,
1.137361, 0.490773, 0.003568976, 0, 0, 0, 1, 1,
1.143604, -0.1239981, 1.232407, 1, 1, 1, 1, 1,
1.143831, 1.142076, -0.2757203, 1, 1, 1, 1, 1,
1.144587, 0.4148254, 1.400519, 1, 1, 1, 1, 1,
1.156195, 0.350835, 0.1462761, 1, 1, 1, 1, 1,
1.163024, -0.3785083, 2.950778, 1, 1, 1, 1, 1,
1.165124, 0.3587211, 0.1395239, 1, 1, 1, 1, 1,
1.17161, -1.008559, 1.74588, 1, 1, 1, 1, 1,
1.172345, -0.05313886, 3.11336, 1, 1, 1, 1, 1,
1.175205, 0.337961, 1.268949, 1, 1, 1, 1, 1,
1.180978, 1.106251, 1.253062, 1, 1, 1, 1, 1,
1.186063, -0.006061384, 1.654336, 1, 1, 1, 1, 1,
1.186377, -1.429085, 1.803093, 1, 1, 1, 1, 1,
1.196179, -1.001326, 0.2620578, 1, 1, 1, 1, 1,
1.198261, 0.8341686, 2.375533, 1, 1, 1, 1, 1,
1.204675, -1.030101, 1.789282, 1, 1, 1, 1, 1,
1.213964, -0.6510664, 1.440716, 0, 0, 1, 1, 1,
1.216982, 0.2047449, 1.660823, 1, 0, 0, 1, 1,
1.220059, 1.780024, 2.251203, 1, 0, 0, 1, 1,
1.223648, -1.111046, 3.172484, 1, 0, 0, 1, 1,
1.223725, 1.956593, -0.08370572, 1, 0, 0, 1, 1,
1.227021, 0.3082227, 1.422057, 1, 0, 0, 1, 1,
1.236743, -0.4361104, 2.246257, 0, 0, 0, 1, 1,
1.238094, -0.2665161, 2.194475, 0, 0, 0, 1, 1,
1.238784, -1.086574, 3.562487, 0, 0, 0, 1, 1,
1.243803, -0.5429137, 1.231668, 0, 0, 0, 1, 1,
1.246252, 0.4022186, 0.9390125, 0, 0, 0, 1, 1,
1.250055, -1.79486, 2.165632, 0, 0, 0, 1, 1,
1.252407, 0.6778354, 1.295392, 0, 0, 0, 1, 1,
1.259253, -0.3778915, 2.865432, 1, 1, 1, 1, 1,
1.265886, 0.2618914, 0.6145857, 1, 1, 1, 1, 1,
1.266529, -0.4359757, 3.296565, 1, 1, 1, 1, 1,
1.27272, -2.154636, 3.545231, 1, 1, 1, 1, 1,
1.275251, 1.077609, 0.3859057, 1, 1, 1, 1, 1,
1.280397, 0.6379706, 1.81653, 1, 1, 1, 1, 1,
1.286637, -0.3915034, 0.6056748, 1, 1, 1, 1, 1,
1.289132, 1.198772, 1.665979, 1, 1, 1, 1, 1,
1.307788, 0.2608778, 3.666209, 1, 1, 1, 1, 1,
1.311214, -0.5542723, 1.700092, 1, 1, 1, 1, 1,
1.32813, -0.1662048, 1.548199, 1, 1, 1, 1, 1,
1.331612, -0.4537698, 2.255118, 1, 1, 1, 1, 1,
1.339962, 1.316365, 3.127531, 1, 1, 1, 1, 1,
1.340469, 0.3616965, 1.920923, 1, 1, 1, 1, 1,
1.344226, 0.7274011, 1.354793, 1, 1, 1, 1, 1,
1.346243, -0.1804576, 2.070655, 0, 0, 1, 1, 1,
1.359471, 0.9545334, 1.617778, 1, 0, 0, 1, 1,
1.363599, -0.3931683, 1.676721, 1, 0, 0, 1, 1,
1.36383, 0.3439917, 1.390041, 1, 0, 0, 1, 1,
1.388247, 0.6082335, 0.9375359, 1, 0, 0, 1, 1,
1.393984, -1.374862, -0.03463037, 1, 0, 0, 1, 1,
1.394869, 0.138671, 0.4964801, 0, 0, 0, 1, 1,
1.401538, 1.280398, 1.922549, 0, 0, 0, 1, 1,
1.421329, -0.3822837, 0.9235276, 0, 0, 0, 1, 1,
1.427013, -0.1200712, 3.126939, 0, 0, 0, 1, 1,
1.429618, 2.147272, -0.2318684, 0, 0, 0, 1, 1,
1.432369, -1.272555, 3.115956, 0, 0, 0, 1, 1,
1.436726, -0.5679659, -0.0129031, 0, 0, 0, 1, 1,
1.439143, -0.8565664, 3.44542, 1, 1, 1, 1, 1,
1.440652, 0.7253497, 2.190705, 1, 1, 1, 1, 1,
1.441302, -1.470936, 2.258379, 1, 1, 1, 1, 1,
1.4437, -0.2179121, 2.366366, 1, 1, 1, 1, 1,
1.447044, -1.472246, 4.093397, 1, 1, 1, 1, 1,
1.479339, 0.6493644, 0.1748831, 1, 1, 1, 1, 1,
1.487417, -1.008235, 1.249078, 1, 1, 1, 1, 1,
1.495609, 0.7068953, 1.634778, 1, 1, 1, 1, 1,
1.506962, -0.6977626, 3.160122, 1, 1, 1, 1, 1,
1.515705, -0.4336376, 2.185788, 1, 1, 1, 1, 1,
1.536236, 0.3981767, 0.9531627, 1, 1, 1, 1, 1,
1.54695, -0.8099542, -0.3408129, 1, 1, 1, 1, 1,
1.564689, 1.817713, 0.9121286, 1, 1, 1, 1, 1,
1.568856, 0.9179505, 2.020716, 1, 1, 1, 1, 1,
1.589418, 1.187753, 1.03914, 1, 1, 1, 1, 1,
1.618886, 0.06763998, 2.170258, 0, 0, 1, 1, 1,
1.63334, -1.284596, 2.430348, 1, 0, 0, 1, 1,
1.648982, 0.2776332, 1.100183, 1, 0, 0, 1, 1,
1.656919, 1.730011, -0.7398478, 1, 0, 0, 1, 1,
1.66876, -0.7890794, 2.071426, 1, 0, 0, 1, 1,
1.676649, -0.1447773, 0.2661638, 1, 0, 0, 1, 1,
1.690899, -0.4328059, 1.925699, 0, 0, 0, 1, 1,
1.737974, -0.5342883, 3.469203, 0, 0, 0, 1, 1,
1.750129, -0.1971124, -0.04496863, 0, 0, 0, 1, 1,
1.82721, 1.094668, 0.8962569, 0, 0, 0, 1, 1,
1.83874, -0.2113135, 2.98459, 0, 0, 0, 1, 1,
1.838802, -0.4992802, 1.651212, 0, 0, 0, 1, 1,
1.839721, 0.8450736, 0.373957, 0, 0, 0, 1, 1,
1.861217, -0.01912216, 3.074645, 1, 1, 1, 1, 1,
1.863934, 1.864262, 0.4804963, 1, 1, 1, 1, 1,
1.885831, -1.244506, 1.581601, 1, 1, 1, 1, 1,
1.920959, -0.7061296, 1.645761, 1, 1, 1, 1, 1,
1.940043, -1.427039, 3.551987, 1, 1, 1, 1, 1,
1.979227, -0.2765154, 1.963879, 1, 1, 1, 1, 1,
1.990599, 0.7400528, 1.121866, 1, 1, 1, 1, 1,
1.991406, -0.2184914, 1.860222, 1, 1, 1, 1, 1,
2.000497, 3.063713, 1.22138, 1, 1, 1, 1, 1,
2.033989, -0.4805422, 1.469323, 1, 1, 1, 1, 1,
2.037933, -0.1457496, 2.215532, 1, 1, 1, 1, 1,
2.05811, 0.3888746, 1.269904, 1, 1, 1, 1, 1,
2.058804, 0.1983972, 0.4244296, 1, 1, 1, 1, 1,
2.07716, -1.197186, 2.876047, 1, 1, 1, 1, 1,
2.097815, -0.4625694, 2.683502, 1, 1, 1, 1, 1,
2.119664, -0.7053162, 2.652357, 0, 0, 1, 1, 1,
2.122766, 0.2483125, 1.325376, 1, 0, 0, 1, 1,
2.151309, 0.214395, 1.639998, 1, 0, 0, 1, 1,
2.17868, 0.8979746, 2.403929, 1, 0, 0, 1, 1,
2.197938, -1.769236, -0.03592741, 1, 0, 0, 1, 1,
2.212994, -0.7275425, 3.663112, 1, 0, 0, 1, 1,
2.251423, -0.5874431, 1.606768, 0, 0, 0, 1, 1,
2.312437, 0.7281061, -0.8732134, 0, 0, 0, 1, 1,
2.341956, -0.4220202, 2.345003, 0, 0, 0, 1, 1,
2.366987, 0.4045353, 0.950252, 0, 0, 0, 1, 1,
2.36924, -0.7448485, 3.032532, 0, 0, 0, 1, 1,
2.383419, 0.5794345, 0.4416266, 0, 0, 0, 1, 1,
2.412088, 2.557394, 0.8414282, 0, 0, 0, 1, 1,
2.42011, -1.045586, 1.902331, 1, 1, 1, 1, 1,
2.498844, -0.7598773, 1.247548, 1, 1, 1, 1, 1,
2.53653, 0.4972281, 0.004916239, 1, 1, 1, 1, 1,
2.536769, 0.2764427, -0.6652001, 1, 1, 1, 1, 1,
2.608558, -0.6920844, 1.745407, 1, 1, 1, 1, 1,
2.656883, 1.029829, -0.03168902, 1, 1, 1, 1, 1,
2.703032, -1.023632, 0.76409, 1, 1, 1, 1, 1
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
var radius = 9.955575;
var distance = 34.96854;
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
mvMatrix.translate( 0.4886755, -0.04425275, 0.6689012 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.96854);
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