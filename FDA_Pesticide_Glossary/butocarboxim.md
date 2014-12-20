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
-2.699448, 0.6223679, -1.768572, 1, 0, 0, 1,
-2.673292, 0.1536573, -0.02446933, 1, 0.007843138, 0, 1,
-2.517056, 0.1459647, -3.696746, 1, 0.01176471, 0, 1,
-2.506929, -0.815322, -2.659027, 1, 0.01960784, 0, 1,
-2.413251, 1.615796, -1.769323, 1, 0.02352941, 0, 1,
-2.382232, -0.536557, -1.49468, 1, 0.03137255, 0, 1,
-2.324089, -0.3579368, -1.421611, 1, 0.03529412, 0, 1,
-2.301073, -0.6977519, -2.831917, 1, 0.04313726, 0, 1,
-2.289264, -0.260493, -0.9680166, 1, 0.04705882, 0, 1,
-2.281715, 0.4987943, -2.137752, 1, 0.05490196, 0, 1,
-2.272432, 1.266563, -1.926637, 1, 0.05882353, 0, 1,
-2.252644, 0.8247463, -0.4883294, 1, 0.06666667, 0, 1,
-2.194925, 0.8376744, -1.222359, 1, 0.07058824, 0, 1,
-2.125233, 0.5127559, -2.003609, 1, 0.07843138, 0, 1,
-2.104352, -1.229118, -0.7671391, 1, 0.08235294, 0, 1,
-2.086425, 0.4047052, -0.8348657, 1, 0.09019608, 0, 1,
-2.083539, 1.32745, -0.09323795, 1, 0.09411765, 0, 1,
-2.082708, -0.315997, -3.697748, 1, 0.1019608, 0, 1,
-2.049617, 0.07951982, -3.869973, 1, 0.1098039, 0, 1,
-2.0488, -0.3684437, -2.120524, 1, 0.1137255, 0, 1,
-2.041469, 2.047746, 0.6240652, 1, 0.1215686, 0, 1,
-2.020001, 0.2041003, -0.9552925, 1, 0.1254902, 0, 1,
-2.005594, 0.02317704, -2.43229, 1, 0.1333333, 0, 1,
-1.987267, 0.5332099, -0.9554543, 1, 0.1372549, 0, 1,
-1.963839, 0.3290008, -2.346222, 1, 0.145098, 0, 1,
-1.938661, 0.4732331, -2.140188, 1, 0.1490196, 0, 1,
-1.933073, -0.05962963, -0.2108042, 1, 0.1568628, 0, 1,
-1.910552, 0.7289002, -3.249389, 1, 0.1607843, 0, 1,
-1.899738, 1.115215, -0.6580476, 1, 0.1686275, 0, 1,
-1.892657, 0.3082809, -1.428255, 1, 0.172549, 0, 1,
-1.877682, -1.95504, -0.6669437, 1, 0.1803922, 0, 1,
-1.871617, 0.5203916, -1.58512, 1, 0.1843137, 0, 1,
-1.870786, 0.8526022, -1.65859, 1, 0.1921569, 0, 1,
-1.865818, 2.805529, -0.700281, 1, 0.1960784, 0, 1,
-1.852252, 0.5068048, -0.08502239, 1, 0.2039216, 0, 1,
-1.843909, -0.9900743, -1.797725, 1, 0.2117647, 0, 1,
-1.811316, -0.2019434, -2.352503, 1, 0.2156863, 0, 1,
-1.796162, 0.4015511, -1.721038, 1, 0.2235294, 0, 1,
-1.782832, -1.733739, -3.294152, 1, 0.227451, 0, 1,
-1.771141, 0.4326764, -1.47257, 1, 0.2352941, 0, 1,
-1.767495, -2.154011, -1.529228, 1, 0.2392157, 0, 1,
-1.74772, -0.8439729, -1.756642, 1, 0.2470588, 0, 1,
-1.736485, 0.1084857, -3.47262, 1, 0.2509804, 0, 1,
-1.719603, 0.9323373, 0.1708869, 1, 0.2588235, 0, 1,
-1.704187, 0.1502427, -0.6816568, 1, 0.2627451, 0, 1,
-1.688326, 1.781563, -1.62228, 1, 0.2705882, 0, 1,
-1.688051, -1.846082, -3.604074, 1, 0.2745098, 0, 1,
-1.687567, -0.6964764, -0.5899223, 1, 0.282353, 0, 1,
-1.678872, -0.9032232, -3.506105, 1, 0.2862745, 0, 1,
-1.677153, 0.8499856, -0.6021468, 1, 0.2941177, 0, 1,
-1.659599, 0.961347, -2.014509, 1, 0.3019608, 0, 1,
-1.656599, 0.213086, -1.592854, 1, 0.3058824, 0, 1,
-1.648326, -0.6398153, -3.386556, 1, 0.3137255, 0, 1,
-1.64675, -0.6633046, -2.71472, 1, 0.3176471, 0, 1,
-1.637079, -1.263598, -2.610442, 1, 0.3254902, 0, 1,
-1.635805, 0.7331462, -1.166679, 1, 0.3294118, 0, 1,
-1.633707, -0.6469663, -0.9344394, 1, 0.3372549, 0, 1,
-1.619064, -0.108398, -3.956303, 1, 0.3411765, 0, 1,
-1.600485, -1.564544, -0.6399555, 1, 0.3490196, 0, 1,
-1.598476, 0.02926579, -3.454294, 1, 0.3529412, 0, 1,
-1.579103, -1.233011, -2.834368, 1, 0.3607843, 0, 1,
-1.571714, 0.848133, -1.96689, 1, 0.3647059, 0, 1,
-1.564835, -1.178725, -3.686247, 1, 0.372549, 0, 1,
-1.55711, 0.820931, -2.179364, 1, 0.3764706, 0, 1,
-1.550546, -0.01768124, -1.238978, 1, 0.3843137, 0, 1,
-1.532786, 0.05936446, -1.607372, 1, 0.3882353, 0, 1,
-1.526471, 0.794003, -1.616774, 1, 0.3960784, 0, 1,
-1.503601, -0.1361757, -2.350237, 1, 0.4039216, 0, 1,
-1.502041, 1.244968, -0.698737, 1, 0.4078431, 0, 1,
-1.489954, 1.497716, -1.197339, 1, 0.4156863, 0, 1,
-1.468596, -1.030022, -3.013052, 1, 0.4196078, 0, 1,
-1.462774, 1.25641, 0.7505088, 1, 0.427451, 0, 1,
-1.46122, -0.2347152, -3.174408, 1, 0.4313726, 0, 1,
-1.456535, -1.335029, -3.048499, 1, 0.4392157, 0, 1,
-1.446224, -0.1346724, -2.448692, 1, 0.4431373, 0, 1,
-1.428135, -0.5493431, -2.67106, 1, 0.4509804, 0, 1,
-1.419862, -0.01371637, -1.17821, 1, 0.454902, 0, 1,
-1.403881, 1.562137, -0.5393088, 1, 0.4627451, 0, 1,
-1.399026, -1.404995, -1.853678, 1, 0.4666667, 0, 1,
-1.398088, -0.1586921, -3.669022, 1, 0.4745098, 0, 1,
-1.39531, 0.6308495, -1.818446, 1, 0.4784314, 0, 1,
-1.391219, -0.8402839, -1.874506, 1, 0.4862745, 0, 1,
-1.385342, 0.03088031, 0.5157452, 1, 0.4901961, 0, 1,
-1.374226, -0.6187615, -1.89827, 1, 0.4980392, 0, 1,
-1.373622, -1.32962, -3.128274, 1, 0.5058824, 0, 1,
-1.36801, -0.3286899, -0.9667522, 1, 0.509804, 0, 1,
-1.366823, 0.4655015, -0.9124228, 1, 0.5176471, 0, 1,
-1.363793, 0.6114946, -0.7037889, 1, 0.5215687, 0, 1,
-1.33575, -0.4107777, -2.409347, 1, 0.5294118, 0, 1,
-1.329664, 2.522604, -2.94447, 1, 0.5333334, 0, 1,
-1.325915, -0.698953, -1.382031, 1, 0.5411765, 0, 1,
-1.320572, -0.713013, -1.43661, 1, 0.5450981, 0, 1,
-1.308785, -0.6489581, -2.575882, 1, 0.5529412, 0, 1,
-1.307348, -0.4898854, -1.669719, 1, 0.5568628, 0, 1,
-1.299548, -0.4783869, -1.965346, 1, 0.5647059, 0, 1,
-1.289405, 0.7476906, -1.691822, 1, 0.5686275, 0, 1,
-1.284735, 1.297918, -1.537678, 1, 0.5764706, 0, 1,
-1.271014, 0.3716485, -1.419767, 1, 0.5803922, 0, 1,
-1.269914, 0.3041857, 0.5757943, 1, 0.5882353, 0, 1,
-1.264237, 0.560018, 0.4886713, 1, 0.5921569, 0, 1,
-1.260484, 0.4723428, -0.1038357, 1, 0.6, 0, 1,
-1.258959, -2.767097, -5.41746, 1, 0.6078432, 0, 1,
-1.257618, 0.1750223, -1.359529, 1, 0.6117647, 0, 1,
-1.25635, -0.2324286, -1.842282, 1, 0.6196079, 0, 1,
-1.253086, 0.05998115, 0.4833416, 1, 0.6235294, 0, 1,
-1.251586, 1.228477, -0.2275012, 1, 0.6313726, 0, 1,
-1.247368, -0.09412874, -2.083808, 1, 0.6352941, 0, 1,
-1.24373, -0.1703037, -2.003406, 1, 0.6431373, 0, 1,
-1.243474, 0.8977673, -0.2653442, 1, 0.6470588, 0, 1,
-1.241698, -1.171327, -1.332776, 1, 0.654902, 0, 1,
-1.235717, -0.3625029, -2.326118, 1, 0.6588235, 0, 1,
-1.227881, -0.5302589, -3.793626, 1, 0.6666667, 0, 1,
-1.215588, 0.5261492, -0.6106165, 1, 0.6705883, 0, 1,
-1.21438, -0.3084194, -1.444013, 1, 0.6784314, 0, 1,
-1.210182, -0.6684818, -2.964622, 1, 0.682353, 0, 1,
-1.208891, -0.9236427, -3.83776, 1, 0.6901961, 0, 1,
-1.202455, 1.570169, -2.103055, 1, 0.6941177, 0, 1,
-1.201192, -1.715873, -2.852101, 1, 0.7019608, 0, 1,
-1.196348, 0.4654596, -1.571075, 1, 0.7098039, 0, 1,
-1.1961, -0.6215848, -1.857236, 1, 0.7137255, 0, 1,
-1.188647, -0.05034254, -0.6951792, 1, 0.7215686, 0, 1,
-1.17851, -0.1122366, -0.9534342, 1, 0.7254902, 0, 1,
-1.172691, -0.3520391, -2.623448, 1, 0.7333333, 0, 1,
-1.169603, -0.2457627, -1.149866, 1, 0.7372549, 0, 1,
-1.16449, 0.9264437, -0.7364804, 1, 0.7450981, 0, 1,
-1.15108, -0.6724484, -2.299721, 1, 0.7490196, 0, 1,
-1.149256, 0.8722911, -0.831477, 1, 0.7568628, 0, 1,
-1.147506, 0.3410107, -0.526926, 1, 0.7607843, 0, 1,
-1.14515, 0.01861753, -0.5928665, 1, 0.7686275, 0, 1,
-1.143835, 0.3168877, -0.5193865, 1, 0.772549, 0, 1,
-1.137924, -0.9750175, -3.27263, 1, 0.7803922, 0, 1,
-1.133518, 0.9435973, -0.0740383, 1, 0.7843137, 0, 1,
-1.13175, 0.4723508, -0.9991825, 1, 0.7921569, 0, 1,
-1.1289, 0.3630928, -1.118726, 1, 0.7960784, 0, 1,
-1.123817, 1.588469, -0.5374665, 1, 0.8039216, 0, 1,
-1.118453, -0.7923715, -3.690513, 1, 0.8117647, 0, 1,
-1.113768, 0.670724, -1.345298, 1, 0.8156863, 0, 1,
-1.112085, -1.08253, -2.243601, 1, 0.8235294, 0, 1,
-1.111672, -0.7220154, -2.004434, 1, 0.827451, 0, 1,
-1.105209, 0.8009007, 0.3073504, 1, 0.8352941, 0, 1,
-1.101639, -0.490317, -1.427005, 1, 0.8392157, 0, 1,
-1.09874, -0.6690971, -1.393767, 1, 0.8470588, 0, 1,
-1.091557, 1.035651, 0.8570612, 1, 0.8509804, 0, 1,
-1.082596, -0.07666742, -2.506412, 1, 0.8588235, 0, 1,
-1.081467, -0.3189343, -1.822384, 1, 0.8627451, 0, 1,
-1.080294, 0.7739643, -0.3120487, 1, 0.8705882, 0, 1,
-1.078432, 2.51922, 1.730921, 1, 0.8745098, 0, 1,
-1.078256, -1.141803, -2.410697, 1, 0.8823529, 0, 1,
-1.073286, 0.4760565, -0.3479587, 1, 0.8862745, 0, 1,
-1.070283, 0.6227713, -1.555461, 1, 0.8941177, 0, 1,
-1.067195, -1.899354, -2.0563, 1, 0.8980392, 0, 1,
-1.055807, -1.253603, -3.62268, 1, 0.9058824, 0, 1,
-1.049127, -2.688863, -4.184832, 1, 0.9137255, 0, 1,
-1.047454, -0.3394739, -0.9366002, 1, 0.9176471, 0, 1,
-1.039161, -0.8474948, -0.744088, 1, 0.9254902, 0, 1,
-1.037397, -0.3284228, -1.725224, 1, 0.9294118, 0, 1,
-1.029999, -0.06140845, -1.32871, 1, 0.9372549, 0, 1,
-1.027205, -0.7533795, -1.723777, 1, 0.9411765, 0, 1,
-1.025682, 0.152126, -1.834154, 1, 0.9490196, 0, 1,
-1.024577, -1.043976, -2.245203, 1, 0.9529412, 0, 1,
-1.023647, 0.2980355, -1.525852, 1, 0.9607843, 0, 1,
-1.021158, -1.416583, -1.738076, 1, 0.9647059, 0, 1,
-1.014851, -0.6239874, -3.63309, 1, 0.972549, 0, 1,
-1.005448, 0.3750488, -2.321959, 1, 0.9764706, 0, 1,
-1.004187, 2.508166, -1.343727, 1, 0.9843137, 0, 1,
-1.003833, 0.7698513, -1.929677, 1, 0.9882353, 0, 1,
-1.002923, -0.3042804, -3.108246, 1, 0.9960784, 0, 1,
-0.996251, 0.7103906, -2.185905, 0.9960784, 1, 0, 1,
-0.9955078, -0.3246757, -0.4024093, 0.9921569, 1, 0, 1,
-0.9880427, 0.7972869, -0.9982071, 0.9843137, 1, 0, 1,
-0.9852886, -1.252757, -2.313188, 0.9803922, 1, 0, 1,
-0.9804161, 0.6827272, -0.6669147, 0.972549, 1, 0, 1,
-0.9785584, 1.172035, -0.379923, 0.9686275, 1, 0, 1,
-0.9731829, -1.485376, -1.887303, 0.9607843, 1, 0, 1,
-0.9722505, 0.5130924, 0.4958261, 0.9568627, 1, 0, 1,
-0.9711316, 1.74717, -1.724479, 0.9490196, 1, 0, 1,
-0.9634661, -0.2825188, -1.653878, 0.945098, 1, 0, 1,
-0.961014, 0.3044182, -3.565915, 0.9372549, 1, 0, 1,
-0.9563279, 0.1607977, 0.2297201, 0.9333333, 1, 0, 1,
-0.9520332, 0.1912372, -0.1861911, 0.9254902, 1, 0, 1,
-0.951245, 1.322668, -0.4106892, 0.9215686, 1, 0, 1,
-0.948921, 0.1531629, -1.492675, 0.9137255, 1, 0, 1,
-0.9483308, -0.3359563, -1.016468, 0.9098039, 1, 0, 1,
-0.947626, 0.8246371, -2.109413, 0.9019608, 1, 0, 1,
-0.9458545, 0.5096721, -0.7162017, 0.8941177, 1, 0, 1,
-0.9447692, -0.3180292, -3.033513, 0.8901961, 1, 0, 1,
-0.9379357, -0.01244892, -1.598976, 0.8823529, 1, 0, 1,
-0.9358667, -0.2744374, -3.578119, 0.8784314, 1, 0, 1,
-0.9290132, 1.932307, -0.5260378, 0.8705882, 1, 0, 1,
-0.9207271, 0.2209662, -1.491318, 0.8666667, 1, 0, 1,
-0.9171436, 0.4718536, -2.113734, 0.8588235, 1, 0, 1,
-0.9161618, -0.2623288, -1.644289, 0.854902, 1, 0, 1,
-0.9056968, 0.5632316, -0.9714516, 0.8470588, 1, 0, 1,
-0.8983458, -1.115101, -3.039106, 0.8431373, 1, 0, 1,
-0.896432, -0.1838651, -2.490938, 0.8352941, 1, 0, 1,
-0.8959271, 0.5996639, -2.413539, 0.8313726, 1, 0, 1,
-0.8938723, 1.501846, -0.1562543, 0.8235294, 1, 0, 1,
-0.8901041, 0.7049108, -2.459462, 0.8196079, 1, 0, 1,
-0.8868879, -0.8414866, -3.242763, 0.8117647, 1, 0, 1,
-0.8855335, 2.201717, 0.5787948, 0.8078431, 1, 0, 1,
-0.8724839, -2.154955, -1.848168, 0.8, 1, 0, 1,
-0.8698102, 0.571405, -2.131009, 0.7921569, 1, 0, 1,
-0.8667223, -0.9465076, -0.6052313, 0.7882353, 1, 0, 1,
-0.8663136, -0.08463222, -1.346967, 0.7803922, 1, 0, 1,
-0.8630556, -0.1017219, -2.089896, 0.7764706, 1, 0, 1,
-0.8621118, -0.09931435, -3.422702, 0.7686275, 1, 0, 1,
-0.8617249, 0.4617197, -1.629041, 0.7647059, 1, 0, 1,
-0.857708, -0.6748489, -3.578451, 0.7568628, 1, 0, 1,
-0.8575031, -0.01244922, -0.3246326, 0.7529412, 1, 0, 1,
-0.8571921, -0.4603414, -3.677293, 0.7450981, 1, 0, 1,
-0.857096, 1.792488, -2.670797, 0.7411765, 1, 0, 1,
-0.854152, 0.1947353, -2.047555, 0.7333333, 1, 0, 1,
-0.8432036, -0.3346643, -0.6271339, 0.7294118, 1, 0, 1,
-0.8423105, -1.876482, -1.626251, 0.7215686, 1, 0, 1,
-0.8420154, -1.580944, -2.355096, 0.7176471, 1, 0, 1,
-0.8407291, -0.3411311, -1.688173, 0.7098039, 1, 0, 1,
-0.8369964, -0.6301708, -3.486341, 0.7058824, 1, 0, 1,
-0.8369442, 0.1562102, -1.53551, 0.6980392, 1, 0, 1,
-0.8356572, 0.5448623, -3.367015, 0.6901961, 1, 0, 1,
-0.83259, -0.1242568, -2.924249, 0.6862745, 1, 0, 1,
-0.8315003, 2.453149, 1.275642, 0.6784314, 1, 0, 1,
-0.8269714, -0.3171443, -1.089645, 0.6745098, 1, 0, 1,
-0.8249696, 0.3069745, -2.5249, 0.6666667, 1, 0, 1,
-0.8223999, -0.4813994, -1.236208, 0.6627451, 1, 0, 1,
-0.8166736, 0.6394708, -1.718017, 0.654902, 1, 0, 1,
-0.8156375, 0.4162589, -1.777147, 0.6509804, 1, 0, 1,
-0.8154978, 2.378119, 0.5863875, 0.6431373, 1, 0, 1,
-0.8101157, 0.02938935, -2.403209, 0.6392157, 1, 0, 1,
-0.8088301, -1.727413, -3.975047, 0.6313726, 1, 0, 1,
-0.8081011, -1.517413, -3.293416, 0.627451, 1, 0, 1,
-0.8024537, -1.035246, -3.41553, 0.6196079, 1, 0, 1,
-0.8012658, -1.574808, -1.519429, 0.6156863, 1, 0, 1,
-0.790095, -0.008792605, -0.09881704, 0.6078432, 1, 0, 1,
-0.7845792, -0.3488596, -0.7230806, 0.6039216, 1, 0, 1,
-0.7837889, 0.2087983, -1.013155, 0.5960785, 1, 0, 1,
-0.7830684, 0.5265605, -1.588745, 0.5882353, 1, 0, 1,
-0.7783295, -0.4866063, -1.815536, 0.5843138, 1, 0, 1,
-0.7783082, -0.7752314, -3.421074, 0.5764706, 1, 0, 1,
-0.7776228, 0.7119283, -0.1801578, 0.572549, 1, 0, 1,
-0.7679436, 0.2479219, -2.522775, 0.5647059, 1, 0, 1,
-0.7590621, -0.02020759, -0.017983, 0.5607843, 1, 0, 1,
-0.7504067, -1.163489, -2.122406, 0.5529412, 1, 0, 1,
-0.7499629, -1.612583, -4.13153, 0.5490196, 1, 0, 1,
-0.7495431, 0.5497015, 1.100787, 0.5411765, 1, 0, 1,
-0.7489634, 0.822323, -1.761629, 0.5372549, 1, 0, 1,
-0.7359874, -0.847167, -1.170772, 0.5294118, 1, 0, 1,
-0.7350289, -0.03715755, -2.387111, 0.5254902, 1, 0, 1,
-0.7338271, 0.4354007, -0.6483271, 0.5176471, 1, 0, 1,
-0.732051, -1.898094, -2.524472, 0.5137255, 1, 0, 1,
-0.7291499, -0.6991745, -1.898317, 0.5058824, 1, 0, 1,
-0.7248093, -1.251567, -2.937933, 0.5019608, 1, 0, 1,
-0.7238456, -0.7747265, -1.688745, 0.4941176, 1, 0, 1,
-0.713231, 0.4119628, -1.273145, 0.4862745, 1, 0, 1,
-0.7131283, -0.05935156, -1.911764, 0.4823529, 1, 0, 1,
-0.7073017, 1.072662, -1.190134, 0.4745098, 1, 0, 1,
-0.70424, 1.483473, -0.6361477, 0.4705882, 1, 0, 1,
-0.691615, 0.5075114, -3.290156, 0.4627451, 1, 0, 1,
-0.6914394, 1.22802, -0.4864737, 0.4588235, 1, 0, 1,
-0.6894678, 1.837187, -1.398455, 0.4509804, 1, 0, 1,
-0.6853303, -1.362151, -2.650448, 0.4470588, 1, 0, 1,
-0.6839042, -0.8563266, -1.955868, 0.4392157, 1, 0, 1,
-0.6810397, -0.4356428, -1.25992, 0.4352941, 1, 0, 1,
-0.6801656, -1.641966, -3.083201, 0.427451, 1, 0, 1,
-0.6786445, -1.856358, -2.391804, 0.4235294, 1, 0, 1,
-0.6756456, 1.028423, -1.143467, 0.4156863, 1, 0, 1,
-0.6725798, -0.6250435, -2.182791, 0.4117647, 1, 0, 1,
-0.6723673, -0.06723142, -1.159742, 0.4039216, 1, 0, 1,
-0.6718169, -1.950375, -1.494471, 0.3960784, 1, 0, 1,
-0.6697333, -1.139399, -3.09226, 0.3921569, 1, 0, 1,
-0.6693475, -1.078925, -3.516263, 0.3843137, 1, 0, 1,
-0.6682256, 1.102374, -0.9485903, 0.3803922, 1, 0, 1,
-0.6670442, 0.6149604, 0.9120059, 0.372549, 1, 0, 1,
-0.6640033, 1.681784, 0.9713171, 0.3686275, 1, 0, 1,
-0.6602226, -0.4736556, -3.628712, 0.3607843, 1, 0, 1,
-0.6582246, 0.4899445, -0.5379381, 0.3568628, 1, 0, 1,
-0.6574033, -0.1887188, -3.535574, 0.3490196, 1, 0, 1,
-0.6565023, -1.63539, -2.677936, 0.345098, 1, 0, 1,
-0.6410586, 2.23604, 1.585411, 0.3372549, 1, 0, 1,
-0.6362827, -0.8281907, -1.898102, 0.3333333, 1, 0, 1,
-0.6321528, 1.336662, 0.4098909, 0.3254902, 1, 0, 1,
-0.6312905, 0.8168283, -1.340784, 0.3215686, 1, 0, 1,
-0.626502, 1.486961, -0.3450138, 0.3137255, 1, 0, 1,
-0.6248188, 0.7100469, -0.9065437, 0.3098039, 1, 0, 1,
-0.6248002, 0.8305841, -0.6658448, 0.3019608, 1, 0, 1,
-0.6232658, 0.4580709, -0.9779096, 0.2941177, 1, 0, 1,
-0.6206211, 0.8829103, -0.3522938, 0.2901961, 1, 0, 1,
-0.6159074, 0.9978575, -0.2248709, 0.282353, 1, 0, 1,
-0.612774, -0.1619838, -2.240541, 0.2784314, 1, 0, 1,
-0.611667, 0.8338495, -1.940622, 0.2705882, 1, 0, 1,
-0.6050262, 0.5754101, -0.90168, 0.2666667, 1, 0, 1,
-0.5946696, 1.062841, -0.6307461, 0.2588235, 1, 0, 1,
-0.5907362, -0.293519, -2.975738, 0.254902, 1, 0, 1,
-0.5832897, 0.9518996, -1.116728, 0.2470588, 1, 0, 1,
-0.5794463, 0.1670543, -2.110912, 0.2431373, 1, 0, 1,
-0.5745923, 0.545323, -1.89389, 0.2352941, 1, 0, 1,
-0.5663175, -0.2692285, -3.449071, 0.2313726, 1, 0, 1,
-0.5658767, -0.7353466, -3.654737, 0.2235294, 1, 0, 1,
-0.5618168, -0.2403398, -1.974854, 0.2196078, 1, 0, 1,
-0.5580981, 0.7040052, -1.693759, 0.2117647, 1, 0, 1,
-0.5410171, 0.6499494, -2.930776, 0.2078431, 1, 0, 1,
-0.5392379, -0.4268064, -2.30877, 0.2, 1, 0, 1,
-0.538898, 0.7918419, 1.677188, 0.1921569, 1, 0, 1,
-0.5327334, -0.02762577, -2.769938, 0.1882353, 1, 0, 1,
-0.5326552, 1.204076, 0.476131, 0.1803922, 1, 0, 1,
-0.5324379, -0.05040503, -1.882562, 0.1764706, 1, 0, 1,
-0.5305807, 0.4147161, -0.9327189, 0.1686275, 1, 0, 1,
-0.5304865, -0.1514186, -3.187955, 0.1647059, 1, 0, 1,
-0.523642, 0.2906339, -1.221991, 0.1568628, 1, 0, 1,
-0.5209081, -0.1543563, -1.471585, 0.1529412, 1, 0, 1,
-0.520538, -0.1170561, -2.813394, 0.145098, 1, 0, 1,
-0.5179843, -0.2160789, -1.714469, 0.1411765, 1, 0, 1,
-0.512922, 0.5208194, -3.264214, 0.1333333, 1, 0, 1,
-0.5129134, 1.208257, -2.774694, 0.1294118, 1, 0, 1,
-0.5070546, -0.4890271, -2.140509, 0.1215686, 1, 0, 1,
-0.5028275, 0.5248191, -1.684489, 0.1176471, 1, 0, 1,
-0.5017862, 1.029496, -0.9956455, 0.1098039, 1, 0, 1,
-0.4993319, 0.9850108, 0.3848647, 0.1058824, 1, 0, 1,
-0.4874131, 0.3158427, -1.594459, 0.09803922, 1, 0, 1,
-0.4832791, 0.5706345, -0.5252894, 0.09019608, 1, 0, 1,
-0.4817942, -1.19812, -5.183734, 0.08627451, 1, 0, 1,
-0.4796295, 0.7307891, 0.7296845, 0.07843138, 1, 0, 1,
-0.4789859, -1.481227, -3.686633, 0.07450981, 1, 0, 1,
-0.4779959, -0.4443008, -3.284948, 0.06666667, 1, 0, 1,
-0.4748834, -1.148948, -2.187874, 0.0627451, 1, 0, 1,
-0.4727888, -0.4022796, -3.628354, 0.05490196, 1, 0, 1,
-0.4714496, -0.223096, -2.203753, 0.05098039, 1, 0, 1,
-0.4713263, -0.07041032, -0.8995546, 0.04313726, 1, 0, 1,
-0.4703398, -1.742092, -3.662745, 0.03921569, 1, 0, 1,
-0.4646316, -2.094664, -4.698403, 0.03137255, 1, 0, 1,
-0.450702, 0.2707473, -1.07276, 0.02745098, 1, 0, 1,
-0.4493117, 0.4709044, -0.4399624, 0.01960784, 1, 0, 1,
-0.4462289, -0.8897831, -3.24041, 0.01568628, 1, 0, 1,
-0.4439296, -1.627797, -2.451303, 0.007843138, 1, 0, 1,
-0.4429649, 0.1680875, -0.4024818, 0.003921569, 1, 0, 1,
-0.4420164, 0.8285056, -2.321033, 0, 1, 0.003921569, 1,
-0.4398852, 1.338455, -1.640793, 0, 1, 0.01176471, 1,
-0.4285682, -0.3435989, -1.129636, 0, 1, 0.01568628, 1,
-0.4278251, 0.4376965, -1.496334, 0, 1, 0.02352941, 1,
-0.4254714, -0.228507, -1.387454, 0, 1, 0.02745098, 1,
-0.4237023, 1.366972, -0.6099269, 0, 1, 0.03529412, 1,
-0.4215095, 1.460254, 0.1325253, 0, 1, 0.03921569, 1,
-0.42136, 1.480801, -1.379766, 0, 1, 0.04705882, 1,
-0.4211201, -1.831572, -2.294049, 0, 1, 0.05098039, 1,
-0.4204156, 0.5239009, -0.2891558, 0, 1, 0.05882353, 1,
-0.4170146, -2.057448, -4.150727, 0, 1, 0.0627451, 1,
-0.4168533, -0.6445653, -2.91187, 0, 1, 0.07058824, 1,
-0.4137138, 1.471458, -0.85518, 0, 1, 0.07450981, 1,
-0.4130319, -0.4138604, -3.358405, 0, 1, 0.08235294, 1,
-0.4113854, 0.04702364, -2.293242, 0, 1, 0.08627451, 1,
-0.4107212, 0.01625058, -2.241761, 0, 1, 0.09411765, 1,
-0.4066948, 1.295858, 0.7635679, 0, 1, 0.1019608, 1,
-0.4035664, 0.5931149, 1.026632, 0, 1, 0.1058824, 1,
-0.4026771, -0.07805821, -1.026496, 0, 1, 0.1137255, 1,
-0.4012824, -0.6410918, -1.727007, 0, 1, 0.1176471, 1,
-0.3999064, -0.913221, -1.915131, 0, 1, 0.1254902, 1,
-0.3950734, 0.1086818, -0.1458119, 0, 1, 0.1294118, 1,
-0.3935131, 0.4507996, -1.115831, 0, 1, 0.1372549, 1,
-0.3918352, 0.5143326, -0.5880386, 0, 1, 0.1411765, 1,
-0.3913699, -1.360696, -3.368616, 0, 1, 0.1490196, 1,
-0.3892631, -0.6815382, -0.1122346, 0, 1, 0.1529412, 1,
-0.3862253, 0.8259724, -0.3144031, 0, 1, 0.1607843, 1,
-0.3852431, 0.009610509, -1.657708, 0, 1, 0.1647059, 1,
-0.3850533, 0.1409772, -0.388695, 0, 1, 0.172549, 1,
-0.3835459, -1.141093, -3.054867, 0, 1, 0.1764706, 1,
-0.376857, -1.25736, -4.272339, 0, 1, 0.1843137, 1,
-0.3762902, -1.325472, -3.689945, 0, 1, 0.1882353, 1,
-0.3665623, -1.356622, -4.907514, 0, 1, 0.1960784, 1,
-0.3639093, -1.003203, -2.186089, 0, 1, 0.2039216, 1,
-0.3569897, -0.4564961, -1.211836, 0, 1, 0.2078431, 1,
-0.3559982, -0.7228314, -3.041613, 0, 1, 0.2156863, 1,
-0.3553066, -0.6836735, -1.443929, 0, 1, 0.2196078, 1,
-0.3544389, -0.5950493, -3.479804, 0, 1, 0.227451, 1,
-0.3501771, -0.5900326, -3.185371, 0, 1, 0.2313726, 1,
-0.3473676, 0.2237634, -0.1805692, 0, 1, 0.2392157, 1,
-0.3470858, -0.6227658, -3.973053, 0, 1, 0.2431373, 1,
-0.3438112, 1.971709, 1.253722, 0, 1, 0.2509804, 1,
-0.340699, 0.8329828, 0.7456965, 0, 1, 0.254902, 1,
-0.3391018, -0.1414294, -2.73421, 0, 1, 0.2627451, 1,
-0.3379418, -0.5999562, -1.860437, 0, 1, 0.2666667, 1,
-0.3348157, -0.2573195, -0.8788156, 0, 1, 0.2745098, 1,
-0.3315643, -0.4932757, -4.223853, 0, 1, 0.2784314, 1,
-0.3239014, 0.6269813, -1.732856, 0, 1, 0.2862745, 1,
-0.3201002, -1.217352, -1.720752, 0, 1, 0.2901961, 1,
-0.3198044, -0.5512304, -2.207409, 0, 1, 0.2980392, 1,
-0.3174694, 0.2771738, 0.643633, 0, 1, 0.3058824, 1,
-0.3154826, -1.035625, -4.149123, 0, 1, 0.3098039, 1,
-0.3154139, -0.6026601, -3.15609, 0, 1, 0.3176471, 1,
-0.3146771, 0.4912684, -1.747498, 0, 1, 0.3215686, 1,
-0.3107871, 0.09629122, -0.7013532, 0, 1, 0.3294118, 1,
-0.3101117, -0.717307, -1.256506, 0, 1, 0.3333333, 1,
-0.3052339, -2.050876, -3.853142, 0, 1, 0.3411765, 1,
-0.3040494, 2.58415, 0.5179031, 0, 1, 0.345098, 1,
-0.2994574, -1.102008, -3.884648, 0, 1, 0.3529412, 1,
-0.2989722, 1.305992, 0.5859821, 0, 1, 0.3568628, 1,
-0.2985848, 0.5590948, -1.14816, 0, 1, 0.3647059, 1,
-0.2951293, -0.8526259, -1.742983, 0, 1, 0.3686275, 1,
-0.2902573, 0.8013741, -0.04778786, 0, 1, 0.3764706, 1,
-0.288472, 0.8149512, -0.09038329, 0, 1, 0.3803922, 1,
-0.2845418, -0.2241326, -2.60399, 0, 1, 0.3882353, 1,
-0.2839569, -0.2102525, -1.740426, 0, 1, 0.3921569, 1,
-0.283139, 0.3857889, -0.2905149, 0, 1, 0.4, 1,
-0.280262, 0.4998287, 0.3719451, 0, 1, 0.4078431, 1,
-0.2779835, 0.9859642, -0.07177948, 0, 1, 0.4117647, 1,
-0.2735844, 0.8845509, -3.135214, 0, 1, 0.4196078, 1,
-0.2651894, 0.4341882, -0.4613869, 0, 1, 0.4235294, 1,
-0.2643968, -1.014692, -1.488466, 0, 1, 0.4313726, 1,
-0.2640349, -0.7795122, -5.179506, 0, 1, 0.4352941, 1,
-0.2606041, -0.1431944, -0.8574473, 0, 1, 0.4431373, 1,
-0.2593231, -0.2332456, -2.494804, 0, 1, 0.4470588, 1,
-0.2581042, -0.2106261, -1.607101, 0, 1, 0.454902, 1,
-0.2561806, 1.25138, -0.7087066, 0, 1, 0.4588235, 1,
-0.2557351, 0.8537878, -0.0350931, 0, 1, 0.4666667, 1,
-0.2525503, 1.435685, 0.003502798, 0, 1, 0.4705882, 1,
-0.2506297, -0.6039475, -3.274404, 0, 1, 0.4784314, 1,
-0.2427374, 0.439618, 0.5804031, 0, 1, 0.4823529, 1,
-0.2412925, 0.8430032, 0.04709761, 0, 1, 0.4901961, 1,
-0.2394698, 0.2016245, -0.3581625, 0, 1, 0.4941176, 1,
-0.2377127, -0.8654454, -2.771453, 0, 1, 0.5019608, 1,
-0.2356649, -0.9807291, -1.126926, 0, 1, 0.509804, 1,
-0.2305466, -1.426322, -3.421758, 0, 1, 0.5137255, 1,
-0.2286585, -0.4118497, -2.415494, 0, 1, 0.5215687, 1,
-0.2280527, 1.778547, -0.4648376, 0, 1, 0.5254902, 1,
-0.2274207, 0.08191798, -0.1695498, 0, 1, 0.5333334, 1,
-0.224284, 1.129734, -1.311564, 0, 1, 0.5372549, 1,
-0.223874, 0.4150894, -1.216691, 0, 1, 0.5450981, 1,
-0.2185221, -2.355426, -3.058345, 0, 1, 0.5490196, 1,
-0.2179637, -0.7701674, -5.340215, 0, 1, 0.5568628, 1,
-0.2163846, -0.4994228, -3.169705, 0, 1, 0.5607843, 1,
-0.2138238, -0.633962, -2.163204, 0, 1, 0.5686275, 1,
-0.2133552, 3.019748, 0.05512255, 0, 1, 0.572549, 1,
-0.2117063, 0.6765925, -1.68749, 0, 1, 0.5803922, 1,
-0.2100972, -0.246427, -2.450009, 0, 1, 0.5843138, 1,
-0.2026009, -0.2837754, 0.1784126, 0, 1, 0.5921569, 1,
-0.2019854, -0.9943753, -3.788954, 0, 1, 0.5960785, 1,
-0.2011411, 0.4619355, -0.01044962, 0, 1, 0.6039216, 1,
-0.2009809, -1.233527, -2.549358, 0, 1, 0.6117647, 1,
-0.200784, 1.297234, 1.055503, 0, 1, 0.6156863, 1,
-0.1986913, 1.940278, -1.43895, 0, 1, 0.6235294, 1,
-0.1975676, -1.924095, -2.52275, 0, 1, 0.627451, 1,
-0.1968944, -1.386319, -3.049374, 0, 1, 0.6352941, 1,
-0.193898, -0.8577154, -2.530972, 0, 1, 0.6392157, 1,
-0.1935268, -0.811866, -2.416061, 0, 1, 0.6470588, 1,
-0.1916293, 0.2571972, -0.9516336, 0, 1, 0.6509804, 1,
-0.1872594, -1.643946, -4.581356, 0, 1, 0.6588235, 1,
-0.1832568, -0.380761, -2.839023, 0, 1, 0.6627451, 1,
-0.1793307, 1.252491, -0.2288159, 0, 1, 0.6705883, 1,
-0.1776942, -0.6334002, -2.861166, 0, 1, 0.6745098, 1,
-0.1772011, -1.237419, -3.267965, 0, 1, 0.682353, 1,
-0.1631882, 0.8589858, 0.7131599, 0, 1, 0.6862745, 1,
-0.1586996, 0.666963, -0.6027255, 0, 1, 0.6941177, 1,
-0.1578485, -1.415626, -3.576054, 0, 1, 0.7019608, 1,
-0.1573653, -0.7056279, -2.909023, 0, 1, 0.7058824, 1,
-0.1571829, 0.5616721, -1.747827, 0, 1, 0.7137255, 1,
-0.1569252, -0.5188562, -3.489061, 0, 1, 0.7176471, 1,
-0.1565439, -0.5524123, -2.748103, 0, 1, 0.7254902, 1,
-0.1564954, 0.2610756, -1.293773, 0, 1, 0.7294118, 1,
-0.1552841, 0.5878429, -0.762054, 0, 1, 0.7372549, 1,
-0.1538401, -0.03215387, -2.810802, 0, 1, 0.7411765, 1,
-0.1516891, -0.357323, -3.613408, 0, 1, 0.7490196, 1,
-0.1506593, 1.568319, -0.2643222, 0, 1, 0.7529412, 1,
-0.1503794, 0.7291412, 0.04776152, 0, 1, 0.7607843, 1,
-0.1461594, -1.824059, -4.408725, 0, 1, 0.7647059, 1,
-0.1404325, -0.694208, -1.99873, 0, 1, 0.772549, 1,
-0.139191, 0.355542, 2.339177, 0, 1, 0.7764706, 1,
-0.1352459, 0.5989395, -0.07586492, 0, 1, 0.7843137, 1,
-0.1323227, -1.115938, -2.436835, 0, 1, 0.7882353, 1,
-0.1230487, -0.1826322, -5.260921, 0, 1, 0.7960784, 1,
-0.1218051, -0.9781773, -3.274955, 0, 1, 0.8039216, 1,
-0.121125, 0.4941812, -0.08415525, 0, 1, 0.8078431, 1,
-0.1202164, -0.665638, -3.081481, 0, 1, 0.8156863, 1,
-0.1201318, -0.8919601, -3.754848, 0, 1, 0.8196079, 1,
-0.118677, 0.2301781, 1.505468, 0, 1, 0.827451, 1,
-0.1185132, -0.7612675, -2.695933, 0, 1, 0.8313726, 1,
-0.1139364, 1.039996, 0.1830744, 0, 1, 0.8392157, 1,
-0.111896, 1.727225, -0.8498281, 0, 1, 0.8431373, 1,
-0.1116379, 0.7873173, -0.1934658, 0, 1, 0.8509804, 1,
-0.1102453, -0.100548, -2.695179, 0, 1, 0.854902, 1,
-0.1080663, 0.5219229, -0.5290952, 0, 1, 0.8627451, 1,
-0.1057691, 0.4317567, 0.8679398, 0, 1, 0.8666667, 1,
-0.1030638, 0.1528825, -0.3494286, 0, 1, 0.8745098, 1,
-0.1023723, -0.9211552, -2.881465, 0, 1, 0.8784314, 1,
-0.1016233, -1.191932, -2.056566, 0, 1, 0.8862745, 1,
-0.09838645, 0.03950287, -1.864736, 0, 1, 0.8901961, 1,
-0.09807865, 0.2683167, -1.136585, 0, 1, 0.8980392, 1,
-0.09415901, 1.773657, 0.04649839, 0, 1, 0.9058824, 1,
-0.09119891, -1.267148, -2.186388, 0, 1, 0.9098039, 1,
-0.09092332, 0.6140112, -1.142314, 0, 1, 0.9176471, 1,
-0.09032241, -0.5612676, -3.464717, 0, 1, 0.9215686, 1,
-0.08952161, -1.231091, -3.359552, 0, 1, 0.9294118, 1,
-0.08883326, 1.647521, 0.07583694, 0, 1, 0.9333333, 1,
-0.08389506, 0.2925926, 1.196518, 0, 1, 0.9411765, 1,
-0.08349568, -0.2763462, -1.230414, 0, 1, 0.945098, 1,
-0.08267371, -0.8923985, -2.208083, 0, 1, 0.9529412, 1,
-0.07955118, 2.001303, 0.1445197, 0, 1, 0.9568627, 1,
-0.07392114, 1.780985, 0.1871345, 0, 1, 0.9647059, 1,
-0.0731774, 0.7955062, -0.5855434, 0, 1, 0.9686275, 1,
-0.0726416, -0.2944038, -2.670203, 0, 1, 0.9764706, 1,
-0.07183772, 1.112233, -0.5668343, 0, 1, 0.9803922, 1,
-0.06846406, -0.684671, -4.134099, 0, 1, 0.9882353, 1,
-0.06264675, -2.019302, -2.720415, 0, 1, 0.9921569, 1,
-0.06200997, -0.228786, -1.326837, 0, 1, 1, 1,
-0.05976058, -1.58238, -3.629785, 0, 0.9921569, 1, 1,
-0.05578227, -0.2166786, -3.459171, 0, 0.9882353, 1, 1,
-0.05402526, -0.4509914, -2.667547, 0, 0.9803922, 1, 1,
-0.05225797, -0.3332584, -3.805815, 0, 0.9764706, 1, 1,
-0.05090157, -0.01141566, -2.003605, 0, 0.9686275, 1, 1,
-0.05043343, -0.5584963, -5.05373, 0, 0.9647059, 1, 1,
-0.04888926, 0.04820192, -1.077016, 0, 0.9568627, 1, 1,
-0.04859593, 0.7439708, -1.139733, 0, 0.9529412, 1, 1,
-0.04829471, 0.7920119, -0.4160884, 0, 0.945098, 1, 1,
-0.04703971, 1.565922, 0.7963886, 0, 0.9411765, 1, 1,
-0.04332928, 0.9536424, -0.7469312, 0, 0.9333333, 1, 1,
-0.04159338, 2.08488, -0.1620138, 0, 0.9294118, 1, 1,
-0.04140414, 0.6462681, -1.034237, 0, 0.9215686, 1, 1,
-0.0409843, -1.972309, -4.087434, 0, 0.9176471, 1, 1,
-0.04056516, 0.6789989, -0.2952502, 0, 0.9098039, 1, 1,
-0.04032291, 0.7819234, 0.09313477, 0, 0.9058824, 1, 1,
-0.03833571, 0.2648578, 0.1211399, 0, 0.8980392, 1, 1,
-0.03151451, -0.4080909, -1.910882, 0, 0.8901961, 1, 1,
-0.03125661, 1.675726, 1.075857, 0, 0.8862745, 1, 1,
-0.03124615, -0.7067968, -1.770665, 0, 0.8784314, 1, 1,
-0.0272791, 0.4878244, -1.565346, 0, 0.8745098, 1, 1,
-0.02500358, 1.977987, 0.6703832, 0, 0.8666667, 1, 1,
-0.02282183, -0.4506319, -4.118512, 0, 0.8627451, 1, 1,
-0.02267723, -0.5646065, -1.928506, 0, 0.854902, 1, 1,
-0.01869614, -0.4143979, -2.528802, 0, 0.8509804, 1, 1,
-0.009981218, -0.2827599, -3.593227, 0, 0.8431373, 1, 1,
-0.009798203, -0.9482133, -3.515009, 0, 0.8392157, 1, 1,
-0.001600197, -0.6778815, -1.418194, 0, 0.8313726, 1, 1,
-0.001292499, 0.761955, -0.2285207, 0, 0.827451, 1, 1,
0.00604428, -0.2127573, 2.252152, 0, 0.8196079, 1, 1,
0.00609661, -0.57881, 3.973404, 0, 0.8156863, 1, 1,
0.008099635, -0.4430526, 1.963966, 0, 0.8078431, 1, 1,
0.01017503, 1.028592, -0.5378088, 0, 0.8039216, 1, 1,
0.01399297, 0.5512011, -1.258003, 0, 0.7960784, 1, 1,
0.01533675, -0.6712109, 2.821055, 0, 0.7882353, 1, 1,
0.01775439, -0.03268468, 2.884228, 0, 0.7843137, 1, 1,
0.02061634, 0.7818224, -0.09836484, 0, 0.7764706, 1, 1,
0.0255354, 0.3343213, 0.8918646, 0, 0.772549, 1, 1,
0.02693626, -1.393692, 3.302146, 0, 0.7647059, 1, 1,
0.037408, -0.04678542, 3.818512, 0, 0.7607843, 1, 1,
0.04053478, 0.6961157, -1.955426, 0, 0.7529412, 1, 1,
0.04091527, 0.8076418, -2.032089, 0, 0.7490196, 1, 1,
0.04592972, -0.9423934, 4.615542, 0, 0.7411765, 1, 1,
0.04647266, -1.297249, 3.644293, 0, 0.7372549, 1, 1,
0.04966725, -0.8367863, 2.976002, 0, 0.7294118, 1, 1,
0.05132451, -1.242211, 2.961941, 0, 0.7254902, 1, 1,
0.05397221, 0.4750369, 0.9940192, 0, 0.7176471, 1, 1,
0.05534514, 1.960575, 0.4357723, 0, 0.7137255, 1, 1,
0.0561173, 0.6823773, -0.3711135, 0, 0.7058824, 1, 1,
0.0706088, -0.714986, 5.11324, 0, 0.6980392, 1, 1,
0.07202512, -1.06423, 3.765104, 0, 0.6941177, 1, 1,
0.07390057, -1.057763, 2.080553, 0, 0.6862745, 1, 1,
0.07459889, 0.5672376, -1.117543, 0, 0.682353, 1, 1,
0.08325094, -0.8250571, 3.753359, 0, 0.6745098, 1, 1,
0.08348078, 0.25334, 1.137063, 0, 0.6705883, 1, 1,
0.08652428, -2.685333, 3.101039, 0, 0.6627451, 1, 1,
0.08674148, -0.9152557, 3.934842, 0, 0.6588235, 1, 1,
0.08681266, 0.6340171, 0.5348662, 0, 0.6509804, 1, 1,
0.0884646, 0.9126856, 1.398631, 0, 0.6470588, 1, 1,
0.08961383, 0.8951623, 1.060461, 0, 0.6392157, 1, 1,
0.09108777, -0.5028124, 2.302187, 0, 0.6352941, 1, 1,
0.09302882, 0.6382694, -0.4568482, 0, 0.627451, 1, 1,
0.09535541, -1.30896, 1.360693, 0, 0.6235294, 1, 1,
0.09997639, 0.3307113, -0.3130676, 0, 0.6156863, 1, 1,
0.1014143, -0.5429015, 2.573325, 0, 0.6117647, 1, 1,
0.1016297, 0.118027, -0.7400593, 0, 0.6039216, 1, 1,
0.1024002, 1.593164, 1.260948, 0, 0.5960785, 1, 1,
0.103272, 0.5273203, 1.487897, 0, 0.5921569, 1, 1,
0.1037572, 0.8529035, -0.4001434, 0, 0.5843138, 1, 1,
0.1055244, -1.265319, 0.5459877, 0, 0.5803922, 1, 1,
0.1081301, -0.6008855, 3.381503, 0, 0.572549, 1, 1,
0.109908, -0.3048472, 4.577225, 0, 0.5686275, 1, 1,
0.1265984, -0.0525585, 2.145362, 0, 0.5607843, 1, 1,
0.1271273, 0.7028023, -0.01656902, 0, 0.5568628, 1, 1,
0.1284166, 0.03289216, 0.9494262, 0, 0.5490196, 1, 1,
0.1286595, -0.2340586, 2.642017, 0, 0.5450981, 1, 1,
0.1288564, -1.205332, 2.422606, 0, 0.5372549, 1, 1,
0.1348855, -0.03538479, 3.014438, 0, 0.5333334, 1, 1,
0.135242, 1.238285, -1.504927, 0, 0.5254902, 1, 1,
0.1394134, -0.139704, 1.312628, 0, 0.5215687, 1, 1,
0.14781, -0.3566141, 3.077843, 0, 0.5137255, 1, 1,
0.1532555, 0.7401702, -0.8165832, 0, 0.509804, 1, 1,
0.153977, -0.3109378, 1.420611, 0, 0.5019608, 1, 1,
0.159839, 1.061989, -1.156219, 0, 0.4941176, 1, 1,
0.159842, 0.2016013, -2.384581, 0, 0.4901961, 1, 1,
0.1612035, -0.7052041, 1.455456, 0, 0.4823529, 1, 1,
0.1637986, 1.084903, 1.576287, 0, 0.4784314, 1, 1,
0.167717, 1.128122, 0.6627128, 0, 0.4705882, 1, 1,
0.1688272, -0.1369157, 1.306918, 0, 0.4666667, 1, 1,
0.169618, 0.02383292, 2.034, 0, 0.4588235, 1, 1,
0.1703325, -0.252493, 2.256756, 0, 0.454902, 1, 1,
0.1705309, 1.372081, 0.6545747, 0, 0.4470588, 1, 1,
0.1746517, -2.923543, 2.061622, 0, 0.4431373, 1, 1,
0.1762512, 0.3974068, -0.4538725, 0, 0.4352941, 1, 1,
0.1787324, 0.6670372, 2.167069, 0, 0.4313726, 1, 1,
0.1802195, 0.5239956, 0.5571055, 0, 0.4235294, 1, 1,
0.1848059, -0.5031837, 2.957986, 0, 0.4196078, 1, 1,
0.1903073, -1.590929, 3.43061, 0, 0.4117647, 1, 1,
0.1917401, -1.019737, 2.923724, 0, 0.4078431, 1, 1,
0.1950496, 1.08453, -0.3684781, 0, 0.4, 1, 1,
0.1951889, 0.2735196, -0.765973, 0, 0.3921569, 1, 1,
0.1963636, 1.16518, 2.153973, 0, 0.3882353, 1, 1,
0.2021583, 0.4212823, 0.1478198, 0, 0.3803922, 1, 1,
0.2023415, -0.6726856, 3.038799, 0, 0.3764706, 1, 1,
0.214645, 0.04453377, 1.122488, 0, 0.3686275, 1, 1,
0.2158165, 0.7992797, 2.027705, 0, 0.3647059, 1, 1,
0.2178515, 0.6139332, 1.164529, 0, 0.3568628, 1, 1,
0.2185901, -0.2537529, 1.766401, 0, 0.3529412, 1, 1,
0.2187239, -1.24606, 3.220132, 0, 0.345098, 1, 1,
0.2234791, 1.00158, -1.316747, 0, 0.3411765, 1, 1,
0.2247705, 1.312254, 1.40329, 0, 0.3333333, 1, 1,
0.2253983, 0.1626063, 2.662715, 0, 0.3294118, 1, 1,
0.225954, -1.414027, 3.099324, 0, 0.3215686, 1, 1,
0.2313103, 0.1004678, 1.38754, 0, 0.3176471, 1, 1,
0.2322075, 0.5930246, 1.394471, 0, 0.3098039, 1, 1,
0.2363661, -0.3129782, 2.275518, 0, 0.3058824, 1, 1,
0.2367747, -1.55759, 3.208914, 0, 0.2980392, 1, 1,
0.2401797, -1.219138, 3.702811, 0, 0.2901961, 1, 1,
0.2438613, -1.837048, 3.703632, 0, 0.2862745, 1, 1,
0.2523715, 1.291842, -0.3892597, 0, 0.2784314, 1, 1,
0.257132, -0.09415343, 1.706099, 0, 0.2745098, 1, 1,
0.2604681, -1.643475, 1.809449, 0, 0.2666667, 1, 1,
0.2605564, 0.9736505, -0.9047549, 0, 0.2627451, 1, 1,
0.2615806, -1.124532, 3.456826, 0, 0.254902, 1, 1,
0.2621043, 0.7675334, 0.09113401, 0, 0.2509804, 1, 1,
0.2625015, 1.278266, 1.644731, 0, 0.2431373, 1, 1,
0.2641114, 1.287714, -0.3401563, 0, 0.2392157, 1, 1,
0.2678948, 0.7002615, -0.8299035, 0, 0.2313726, 1, 1,
0.2683353, -1.016049, 3.430406, 0, 0.227451, 1, 1,
0.2720078, -0.2190354, 0.6205872, 0, 0.2196078, 1, 1,
0.2735316, -0.1451224, 2.906194, 0, 0.2156863, 1, 1,
0.2741916, 0.09781288, 4.081968, 0, 0.2078431, 1, 1,
0.2771317, -1.467175, 3.471318, 0, 0.2039216, 1, 1,
0.2780457, -1.41368, 3.761161, 0, 0.1960784, 1, 1,
0.2786847, 0.008126375, 1.125065, 0, 0.1882353, 1, 1,
0.2801044, -1.598046, 3.829643, 0, 0.1843137, 1, 1,
0.2855867, 0.01283923, 2.330458, 0, 0.1764706, 1, 1,
0.286906, -2.11757, 3.660249, 0, 0.172549, 1, 1,
0.2872073, 0.1406302, 1.842186, 0, 0.1647059, 1, 1,
0.2873176, 1.494674, -0.853485, 0, 0.1607843, 1, 1,
0.2895087, -0.1298316, 3.002833, 0, 0.1529412, 1, 1,
0.2936159, 0.8481153, 2.313589, 0, 0.1490196, 1, 1,
0.3069549, -0.4681019, 2.302359, 0, 0.1411765, 1, 1,
0.3143632, 1.256474, 1.300193, 0, 0.1372549, 1, 1,
0.3143779, 0.8247805, 0.6578481, 0, 0.1294118, 1, 1,
0.3150516, 0.5024881, -0.007457842, 0, 0.1254902, 1, 1,
0.3200686, -2.311638, 3.864173, 0, 0.1176471, 1, 1,
0.3202516, -0.7779493, 2.599682, 0, 0.1137255, 1, 1,
0.322787, -1.467564, 2.353766, 0, 0.1058824, 1, 1,
0.3244812, 0.02182273, 1.159241, 0, 0.09803922, 1, 1,
0.3311087, 0.2607469, 0.6969968, 0, 0.09411765, 1, 1,
0.3320844, -0.3766943, 1.983975, 0, 0.08627451, 1, 1,
0.3335318, -0.8082384, 4.004557, 0, 0.08235294, 1, 1,
0.3355541, 1.400556, 0.001091225, 0, 0.07450981, 1, 1,
0.3369929, -1.391998, 3.785708, 0, 0.07058824, 1, 1,
0.3428672, -0.6650156, 2.513541, 0, 0.0627451, 1, 1,
0.3430477, -0.03665028, 0.5478361, 0, 0.05882353, 1, 1,
0.3431457, 0.7752085, 0.04414899, 0, 0.05098039, 1, 1,
0.3441336, -2.044148, 2.310056, 0, 0.04705882, 1, 1,
0.3455638, -1.428878, 2.62297, 0, 0.03921569, 1, 1,
0.3552505, 0.6502259, -0.7803156, 0, 0.03529412, 1, 1,
0.3558591, 0.3072917, 0.8696784, 0, 0.02745098, 1, 1,
0.3604889, -0.2701, 2.004441, 0, 0.02352941, 1, 1,
0.3612356, 0.8667183, 0.397303, 0, 0.01568628, 1, 1,
0.3632338, -1.292061, 2.791597, 0, 0.01176471, 1, 1,
0.3643042, -1.370684, 2.094503, 0, 0.003921569, 1, 1,
0.3650314, -1.835943, 1.794651, 0.003921569, 0, 1, 1,
0.3657075, 0.09542426, 0.9730568, 0.007843138, 0, 1, 1,
0.3681847, -0.6887224, 2.082306, 0.01568628, 0, 1, 1,
0.3686049, 0.4175586, -0.3562499, 0.01960784, 0, 1, 1,
0.37996, 1.194258, 1.965834, 0.02745098, 0, 1, 1,
0.3907521, -2.157411, 1.393327, 0.03137255, 0, 1, 1,
0.393557, -0.6631052, 3.240489, 0.03921569, 0, 1, 1,
0.4050026, -0.2114825, 1.702846, 0.04313726, 0, 1, 1,
0.4081412, 1.060701, 0.1185494, 0.05098039, 0, 1, 1,
0.4164293, 0.4237521, 1.102299, 0.05490196, 0, 1, 1,
0.4200509, 0.4172646, 1.08684, 0.0627451, 0, 1, 1,
0.4251947, 0.4915514, 0.9341413, 0.06666667, 0, 1, 1,
0.4256953, -1.372535, 3.933909, 0.07450981, 0, 1, 1,
0.4294177, 1.501859, -0.9611984, 0.07843138, 0, 1, 1,
0.4327365, -1.140781, 2.201735, 0.08627451, 0, 1, 1,
0.433832, -0.9191533, 3.050567, 0.09019608, 0, 1, 1,
0.4343826, -0.1527143, 1.901565, 0.09803922, 0, 1, 1,
0.4345599, -0.505905, 2.970966, 0.1058824, 0, 1, 1,
0.4375566, -0.2588849, 1.554765, 0.1098039, 0, 1, 1,
0.4426958, 0.3411962, 0.08877339, 0.1176471, 0, 1, 1,
0.4437423, -0.6793489, 1.791247, 0.1215686, 0, 1, 1,
0.4450978, -1.073006, 3.445402, 0.1294118, 0, 1, 1,
0.4481696, 0.4742321, 1.418988, 0.1333333, 0, 1, 1,
0.4537774, 0.6204001, 1.936471, 0.1411765, 0, 1, 1,
0.455645, 1.519041, 1.100108, 0.145098, 0, 1, 1,
0.4575559, -0.9681664, 3.440127, 0.1529412, 0, 1, 1,
0.4584611, 1.794653, 0.4477444, 0.1568628, 0, 1, 1,
0.4663395, -0.7397493, 2.595736, 0.1647059, 0, 1, 1,
0.4668455, -0.8355374, 2.911563, 0.1686275, 0, 1, 1,
0.4682349, -0.9123634, 3.056086, 0.1764706, 0, 1, 1,
0.4715332, -0.5891392, 1.197857, 0.1803922, 0, 1, 1,
0.4761019, -0.4256741, 2.822961, 0.1882353, 0, 1, 1,
0.4781432, 1.215059, 1.094095, 0.1921569, 0, 1, 1,
0.4789918, 0.5045835, 1.600596, 0.2, 0, 1, 1,
0.4803142, -1.785114, 2.974232, 0.2078431, 0, 1, 1,
0.4831353, 0.1523656, 1.143224, 0.2117647, 0, 1, 1,
0.4856275, 0.8870944, 0.2188757, 0.2196078, 0, 1, 1,
0.4897659, -0.9001678, 3.917741, 0.2235294, 0, 1, 1,
0.4915197, 0.8018205, 1.955244, 0.2313726, 0, 1, 1,
0.4955669, -0.1403713, 2.271021, 0.2352941, 0, 1, 1,
0.5007786, -0.3658674, 1.534419, 0.2431373, 0, 1, 1,
0.5080684, 3.255904, -0.1482971, 0.2470588, 0, 1, 1,
0.508294, 0.316265, 1.592235, 0.254902, 0, 1, 1,
0.508944, -1.143692, 5.73409, 0.2588235, 0, 1, 1,
0.5130252, -1.498886, 2.259202, 0.2666667, 0, 1, 1,
0.5133542, -1.034592, 4.793403, 0.2705882, 0, 1, 1,
0.5173497, -0.4561616, 3.381457, 0.2784314, 0, 1, 1,
0.5225984, -0.5171685, 1.250601, 0.282353, 0, 1, 1,
0.5274864, -0.1521457, 0.8705645, 0.2901961, 0, 1, 1,
0.5276936, -0.9228433, 3.010145, 0.2941177, 0, 1, 1,
0.5286749, 0.06668308, 1.375733, 0.3019608, 0, 1, 1,
0.5339726, 2.12667, -0.1371505, 0.3098039, 0, 1, 1,
0.5428615, 0.04289186, 2.077955, 0.3137255, 0, 1, 1,
0.5432413, -1.456063, 1.731633, 0.3215686, 0, 1, 1,
0.548833, 1.667472, 0.7539617, 0.3254902, 0, 1, 1,
0.5577803, 0.1722835, 1.352931, 0.3333333, 0, 1, 1,
0.5607656, 0.8987653, 0.07042228, 0.3372549, 0, 1, 1,
0.5643716, 0.2035831, 0.7549661, 0.345098, 0, 1, 1,
0.5691043, -0.1596499, 1.538997, 0.3490196, 0, 1, 1,
0.5719815, -1.099986, 3.363649, 0.3568628, 0, 1, 1,
0.5767185, 0.9747326, 0.7202817, 0.3607843, 0, 1, 1,
0.5781527, 0.2951996, 0.8426866, 0.3686275, 0, 1, 1,
0.5802734, 1.000572, 0.6284524, 0.372549, 0, 1, 1,
0.5816534, -1.281718, 2.872369, 0.3803922, 0, 1, 1,
0.5823593, -0.5873458, 3.461816, 0.3843137, 0, 1, 1,
0.5836787, -2.543571, 4.861056, 0.3921569, 0, 1, 1,
0.5837463, 0.5332535, 0.7923124, 0.3960784, 0, 1, 1,
0.5863161, 1.287662, -0.4562859, 0.4039216, 0, 1, 1,
0.5885466, -0.3793977, 1.208458, 0.4117647, 0, 1, 1,
0.6019239, -1.279427, 2.524769, 0.4156863, 0, 1, 1,
0.6073873, -0.2754953, 1.12559, 0.4235294, 0, 1, 1,
0.6168464, -0.4959593, 1.576805, 0.427451, 0, 1, 1,
0.6185954, 0.3154748, 3.260408, 0.4352941, 0, 1, 1,
0.6225417, 0.6806239, 1.340229, 0.4392157, 0, 1, 1,
0.6235709, 1.400937, 1.278892, 0.4470588, 0, 1, 1,
0.6241934, 0.2413683, 2.017487, 0.4509804, 0, 1, 1,
0.6243121, -0.404758, 1.387199, 0.4588235, 0, 1, 1,
0.6279455, -0.7550873, 4.724822, 0.4627451, 0, 1, 1,
0.6323641, 0.01069106, 0.9169985, 0.4705882, 0, 1, 1,
0.6372861, 0.4219282, -0.8162273, 0.4745098, 0, 1, 1,
0.6393973, 1.813442, 0.2351941, 0.4823529, 0, 1, 1,
0.6415677, 1.94541, 0.7515379, 0.4862745, 0, 1, 1,
0.6460363, -2.18807, 3.403207, 0.4941176, 0, 1, 1,
0.653598, -0.2334703, 2.45886, 0.5019608, 0, 1, 1,
0.6538851, 0.5688908, 0.982151, 0.5058824, 0, 1, 1,
0.6554736, 0.6253191, 1.665354, 0.5137255, 0, 1, 1,
0.6580504, -1.035306, 1.366158, 0.5176471, 0, 1, 1,
0.6608414, -0.5714176, 3.616238, 0.5254902, 0, 1, 1,
0.6633653, -1.822285, 1.528851, 0.5294118, 0, 1, 1,
0.6641293, 0.6026925, -0.07868981, 0.5372549, 0, 1, 1,
0.6644187, -0.06745484, 2.046504, 0.5411765, 0, 1, 1,
0.6665638, -0.5535475, 2.674835, 0.5490196, 0, 1, 1,
0.668162, -0.7776271, 1.981709, 0.5529412, 0, 1, 1,
0.6710697, -0.3829333, 2.500483, 0.5607843, 0, 1, 1,
0.6775492, -2.479015, 3.191215, 0.5647059, 0, 1, 1,
0.678121, -0.5805699, 0.7713147, 0.572549, 0, 1, 1,
0.6800574, 0.2603389, 0.9352813, 0.5764706, 0, 1, 1,
0.686985, 0.2388682, 2.009346, 0.5843138, 0, 1, 1,
0.6879286, 1.349864, -0.3706661, 0.5882353, 0, 1, 1,
0.6916852, 0.5446039, 0.4084312, 0.5960785, 0, 1, 1,
0.6925166, 1.207073, 0.7163153, 0.6039216, 0, 1, 1,
0.6935697, -1.271439, 2.832702, 0.6078432, 0, 1, 1,
0.6936236, 0.2386986, -0.7002562, 0.6156863, 0, 1, 1,
0.6958429, -0.778064, 2.622861, 0.6196079, 0, 1, 1,
0.6990231, 0.6257296, 1.352361, 0.627451, 0, 1, 1,
0.7046907, -0.2842139, 2.474963, 0.6313726, 0, 1, 1,
0.7078928, 1.321013, 0.129779, 0.6392157, 0, 1, 1,
0.7105776, 0.1816213, 2.630365, 0.6431373, 0, 1, 1,
0.7129816, 0.351129, 0.7738045, 0.6509804, 0, 1, 1,
0.7143973, -0.573552, 1.106949, 0.654902, 0, 1, 1,
0.7156171, 1.423344, 2.411799, 0.6627451, 0, 1, 1,
0.7164299, -0.3278847, 1.41757, 0.6666667, 0, 1, 1,
0.7215754, -0.6820551, 1.659398, 0.6745098, 0, 1, 1,
0.7223176, -0.7809853, 3.802023, 0.6784314, 0, 1, 1,
0.7347712, 1.598328, 2.172582, 0.6862745, 0, 1, 1,
0.7363162, 1.603851, 1.365709, 0.6901961, 0, 1, 1,
0.7384324, 1.746412, 0.1228067, 0.6980392, 0, 1, 1,
0.7392356, -0.5769295, 1.245154, 0.7058824, 0, 1, 1,
0.7422495, 2.057695, 0.2848074, 0.7098039, 0, 1, 1,
0.742799, 0.1062158, 0.8558992, 0.7176471, 0, 1, 1,
0.744474, -0.7515326, 1.28069, 0.7215686, 0, 1, 1,
0.7446791, 1.034018, 1.391901, 0.7294118, 0, 1, 1,
0.7484278, 1.140341, 0.5495759, 0.7333333, 0, 1, 1,
0.7501361, 0.6030429, 1.537065, 0.7411765, 0, 1, 1,
0.7654112, -1.57568, 3.355307, 0.7450981, 0, 1, 1,
0.7665567, 0.8480254, 0.306484, 0.7529412, 0, 1, 1,
0.7680755, -1.386504, 1.520746, 0.7568628, 0, 1, 1,
0.7687739, -0.06647528, 1.986645, 0.7647059, 0, 1, 1,
0.7701694, 0.08524355, 0.8443167, 0.7686275, 0, 1, 1,
0.7701853, 0.2814344, 0.1938563, 0.7764706, 0, 1, 1,
0.7748551, -0.3348342, 2.269398, 0.7803922, 0, 1, 1,
0.7779706, 0.647545, 1.459784, 0.7882353, 0, 1, 1,
0.7792736, 1.566837, -0.06830035, 0.7921569, 0, 1, 1,
0.7813127, -0.5177602, 2.310724, 0.8, 0, 1, 1,
0.7866147, 0.2164283, 0.8724212, 0.8078431, 0, 1, 1,
0.7867493, 0.2371324, 2.561132, 0.8117647, 0, 1, 1,
0.7999195, -0.3055673, 1.314161, 0.8196079, 0, 1, 1,
0.8020344, 1.486516, -0.3341038, 0.8235294, 0, 1, 1,
0.8056888, -0.7415075, 2.673791, 0.8313726, 0, 1, 1,
0.8059267, 1.115423, -0.05455307, 0.8352941, 0, 1, 1,
0.8083425, 0.3661433, 0.1840144, 0.8431373, 0, 1, 1,
0.8092287, -0.6000914, 2.399621, 0.8470588, 0, 1, 1,
0.8130343, 1.957563, -2.252679, 0.854902, 0, 1, 1,
0.831844, -0.7090834, 2.652174, 0.8588235, 0, 1, 1,
0.8324795, -1.382044, 2.841546, 0.8666667, 0, 1, 1,
0.8330361, -1.569842, 2.812247, 0.8705882, 0, 1, 1,
0.8383042, -0.4730617, 1.469779, 0.8784314, 0, 1, 1,
0.838987, 1.07517, -1.160198, 0.8823529, 0, 1, 1,
0.8407394, -0.1782573, 1.455955, 0.8901961, 0, 1, 1,
0.8471028, -0.4899674, 0.7335563, 0.8941177, 0, 1, 1,
0.8475939, -0.119123, 2.255272, 0.9019608, 0, 1, 1,
0.851256, -0.6740438, 3.378912, 0.9098039, 0, 1, 1,
0.8513055, 0.1580426, 1.586554, 0.9137255, 0, 1, 1,
0.8539554, -0.7869339, 2.046294, 0.9215686, 0, 1, 1,
0.8753617, -0.9909034, 1.047072, 0.9254902, 0, 1, 1,
0.8781878, 1.096389, 1.189603, 0.9333333, 0, 1, 1,
0.8787934, -0.7682098, 1.990666, 0.9372549, 0, 1, 1,
0.8947328, 0.6759884, 0.2818864, 0.945098, 0, 1, 1,
0.8958103, -0.2759813, 1.686083, 0.9490196, 0, 1, 1,
0.8991566, 2.3176, -0.5815969, 0.9568627, 0, 1, 1,
0.9016814, -1.400936, 3.443828, 0.9607843, 0, 1, 1,
0.9031466, -0.7223529, 2.654601, 0.9686275, 0, 1, 1,
0.9159515, 1.512144, 0.07516704, 0.972549, 0, 1, 1,
0.9217385, 1.180449, 1.403259, 0.9803922, 0, 1, 1,
0.925646, -0.3929721, 2.168704, 0.9843137, 0, 1, 1,
0.9373992, 0.6242132, 1.387459, 0.9921569, 0, 1, 1,
0.9395524, -0.6113548, 4.06026, 0.9960784, 0, 1, 1,
0.9403524, -0.9395768, 1.610842, 1, 0, 0.9960784, 1,
0.9436029, -0.09704535, 1.087188, 1, 0, 0.9882353, 1,
0.9446656, 0.2213491, 1.239274, 1, 0, 0.9843137, 1,
0.9460062, 1.131686, 2.510514, 1, 0, 0.9764706, 1,
0.9464974, -0.09522318, 4.040378, 1, 0, 0.972549, 1,
0.9482163, 0.5749219, 0.5857455, 1, 0, 0.9647059, 1,
0.9545462, -0.5863373, 1.942513, 1, 0, 0.9607843, 1,
0.9564484, 0.2004129, 1.393678, 1, 0, 0.9529412, 1,
0.960442, -2.018205, 1.22734, 1, 0, 0.9490196, 1,
0.9653622, 0.8207393, 1.540711, 1, 0, 0.9411765, 1,
0.9700631, -0.441985, 2.969957, 1, 0, 0.9372549, 1,
0.9744337, 0.394052, -0.0445957, 1, 0, 0.9294118, 1,
0.9767333, -0.04679339, 3.014307, 1, 0, 0.9254902, 1,
0.9865612, 0.0554194, 0.4180014, 1, 0, 0.9176471, 1,
0.9884251, -0.3509277, 2.251883, 1, 0, 0.9137255, 1,
0.9977644, 0.5092015, 0.5873691, 1, 0, 0.9058824, 1,
1.003907, -0.4682696, 1.405225, 1, 0, 0.9019608, 1,
1.004088, -0.1635842, 1.172621, 1, 0, 0.8941177, 1,
1.007453, 0.1806349, 2.022081, 1, 0, 0.8862745, 1,
1.007984, 0.4979644, 2.447117, 1, 0, 0.8823529, 1,
1.008139, 0.6465654, 1.354905, 1, 0, 0.8745098, 1,
1.009171, -0.4777215, 2.169005, 1, 0, 0.8705882, 1,
1.009834, 2.166285, 0.6325755, 1, 0, 0.8627451, 1,
1.010245, 0.5428723, 2.398272, 1, 0, 0.8588235, 1,
1.01071, 2.03944, 1.299194, 1, 0, 0.8509804, 1,
1.011311, -2.141527, 3.826896, 1, 0, 0.8470588, 1,
1.011881, 0.1347811, 0.5572152, 1, 0, 0.8392157, 1,
1.013869, 0.9787529, 0.9143024, 1, 0, 0.8352941, 1,
1.013927, -0.1365918, 1.182047, 1, 0, 0.827451, 1,
1.014211, -0.3087959, 1.061391, 1, 0, 0.8235294, 1,
1.015479, 0.6347609, 0.8536652, 1, 0, 0.8156863, 1,
1.016729, 0.2122359, 0.1276169, 1, 0, 0.8117647, 1,
1.019326, 1.120858, 1.719711, 1, 0, 0.8039216, 1,
1.02301, -1.053094, 0.7495477, 1, 0, 0.7960784, 1,
1.023158, 0.486506, 1.526567, 1, 0, 0.7921569, 1,
1.02713, 0.8269458, -0.01845098, 1, 0, 0.7843137, 1,
1.028505, -1.337122, 1.220791, 1, 0, 0.7803922, 1,
1.032545, -1.404521, 3.738153, 1, 0, 0.772549, 1,
1.038738, -0.585574, 2.513626, 1, 0, 0.7686275, 1,
1.03954, 1.31747, 0.5985969, 1, 0, 0.7607843, 1,
1.044836, 0.2346811, 1.918138, 1, 0, 0.7568628, 1,
1.062353, -0.24527, 1.848335, 1, 0, 0.7490196, 1,
1.06814, 2.041424, 0.6683926, 1, 0, 0.7450981, 1,
1.069887, 0.05586941, 0.9744502, 1, 0, 0.7372549, 1,
1.070801, -1.078434, 2.378169, 1, 0, 0.7333333, 1,
1.072322, 0.3396302, 1.446831, 1, 0, 0.7254902, 1,
1.072606, 0.6163217, 1.138504, 1, 0, 0.7215686, 1,
1.073841, 0.6504782, 0.8223065, 1, 0, 0.7137255, 1,
1.078578, -0.9574572, 2.127958, 1, 0, 0.7098039, 1,
1.079354, -0.8464671, 0.7272776, 1, 0, 0.7019608, 1,
1.082258, 1.909103, 0.9358722, 1, 0, 0.6941177, 1,
1.082991, 0.6389025, -0.03978604, 1, 0, 0.6901961, 1,
1.087207, -0.3805091, 1.478141, 1, 0, 0.682353, 1,
1.089867, 0.01188622, 2.639145, 1, 0, 0.6784314, 1,
1.100562, -0.4687869, 1.810049, 1, 0, 0.6705883, 1,
1.100902, -0.3002726, 0.9677204, 1, 0, 0.6666667, 1,
1.102058, 0.1659759, 0.7327346, 1, 0, 0.6588235, 1,
1.104076, -0.6086553, 1.319716, 1, 0, 0.654902, 1,
1.104519, 0.6483437, 1.343113, 1, 0, 0.6470588, 1,
1.120201, -0.7339631, 1.747729, 1, 0, 0.6431373, 1,
1.120967, -0.01340352, 0.9987907, 1, 0, 0.6352941, 1,
1.123323, -1.40506, 4.666512, 1, 0, 0.6313726, 1,
1.129923, 0.3679839, 1.214393, 1, 0, 0.6235294, 1,
1.132524, -0.2875223, 2.228419, 1, 0, 0.6196079, 1,
1.139193, -0.9851872, 3.22721, 1, 0, 0.6117647, 1,
1.141192, 0.3574017, 0.4381224, 1, 0, 0.6078432, 1,
1.159665, -0.1815996, 2.912244, 1, 0, 0.6, 1,
1.162804, 0.07922206, 2.665547, 1, 0, 0.5921569, 1,
1.173377, -0.607965, 2.517664, 1, 0, 0.5882353, 1,
1.17487, 2.496208, 0.9004004, 1, 0, 0.5803922, 1,
1.176152, -0.2821853, 2.226158, 1, 0, 0.5764706, 1,
1.178619, -0.1909698, 2.395586, 1, 0, 0.5686275, 1,
1.185343, -1.102142, 0.9453866, 1, 0, 0.5647059, 1,
1.195108, 0.5879407, 2.500527, 1, 0, 0.5568628, 1,
1.202189, -0.3750344, 0.617943, 1, 0, 0.5529412, 1,
1.234606, 0.2459356, -0.6718246, 1, 0, 0.5450981, 1,
1.240311, 1.529335, 1.704499, 1, 0, 0.5411765, 1,
1.24937, -0.06742521, 0.654803, 1, 0, 0.5333334, 1,
1.259894, 2.049688, -0.3472745, 1, 0, 0.5294118, 1,
1.27336, 0.5634124, 2.774734, 1, 0, 0.5215687, 1,
1.273859, -0.199183, 1.845416, 1, 0, 0.5176471, 1,
1.276718, 0.516924, 1.25794, 1, 0, 0.509804, 1,
1.285991, -0.6129748, 1.102966, 1, 0, 0.5058824, 1,
1.286743, -0.296584, 1.370443, 1, 0, 0.4980392, 1,
1.293231, 1.089901, -1.060648, 1, 0, 0.4901961, 1,
1.314022, -0.4469588, 0.4353594, 1, 0, 0.4862745, 1,
1.316283, -0.6497106, 0.6315125, 1, 0, 0.4784314, 1,
1.318375, -0.6688379, 1.656456, 1, 0, 0.4745098, 1,
1.324883, -1.864423, 1.518463, 1, 0, 0.4666667, 1,
1.335817, -0.2042691, 2.767545, 1, 0, 0.4627451, 1,
1.339468, 1.085966, 1.838588, 1, 0, 0.454902, 1,
1.343822, 0.1669871, 0.7718304, 1, 0, 0.4509804, 1,
1.347795, -0.1681075, 2.041611, 1, 0, 0.4431373, 1,
1.414172, -0.3058851, 2.10895, 1, 0, 0.4392157, 1,
1.417472, -0.1762209, 2.148043, 1, 0, 0.4313726, 1,
1.423782, -0.1139221, 3.100944, 1, 0, 0.427451, 1,
1.426259, -0.7859988, 1.967087, 1, 0, 0.4196078, 1,
1.426809, 0.548668, 1.55888, 1, 0, 0.4156863, 1,
1.430627, -0.2746714, 1.686907, 1, 0, 0.4078431, 1,
1.438873, 1.729732, 1.882678, 1, 0, 0.4039216, 1,
1.440435, 1.415353, 1.410189, 1, 0, 0.3960784, 1,
1.450665, 0.691039, 1.93788, 1, 0, 0.3882353, 1,
1.466045, -1.054172, 2.303121, 1, 0, 0.3843137, 1,
1.470839, -0.2683482, 2.386028, 1, 0, 0.3764706, 1,
1.477978, 0.7090627, 2.462907, 1, 0, 0.372549, 1,
1.480821, -1.019273, 2.320967, 1, 0, 0.3647059, 1,
1.481741, 0.05363342, 1.505022, 1, 0, 0.3607843, 1,
1.487803, -0.894011, 0.345436, 1, 0, 0.3529412, 1,
1.488052, 1.276391, 0.5849496, 1, 0, 0.3490196, 1,
1.489275, -1.942819, 3.365879, 1, 0, 0.3411765, 1,
1.505096, 1.91171, 1.793142, 1, 0, 0.3372549, 1,
1.509339, 0.04790623, 0.5236286, 1, 0, 0.3294118, 1,
1.522661, 1.071027, 2.200498, 1, 0, 0.3254902, 1,
1.550242, -0.1071694, 1.703981, 1, 0, 0.3176471, 1,
1.577238, -0.6938521, 0.2117254, 1, 0, 0.3137255, 1,
1.581, -0.776875, 2.739875, 1, 0, 0.3058824, 1,
1.584485, -0.7858774, 2.729245, 1, 0, 0.2980392, 1,
1.590699, 0.7261269, 3.583644, 1, 0, 0.2941177, 1,
1.600103, -0.7260402, 3.446555, 1, 0, 0.2862745, 1,
1.616284, -1.157695, -0.04473822, 1, 0, 0.282353, 1,
1.619104, -1.009936, 0.4104368, 1, 0, 0.2745098, 1,
1.648496, 1.129076, 0.1945616, 1, 0, 0.2705882, 1,
1.653985, -0.8707539, 3.698663, 1, 0, 0.2627451, 1,
1.681673, 1.525358, 0.3020094, 1, 0, 0.2588235, 1,
1.695493, 0.3275101, 1.411938, 1, 0, 0.2509804, 1,
1.710379, -3.036806, 2.216053, 1, 0, 0.2470588, 1,
1.718033, -0.3433836, -0.2325369, 1, 0, 0.2392157, 1,
1.729626, -0.1753313, 1.047181, 1, 0, 0.2352941, 1,
1.731547, -0.3566937, 1.308696, 1, 0, 0.227451, 1,
1.73407, 0.02888945, 2.272375, 1, 0, 0.2235294, 1,
1.734619, 1.611511, 1.558025, 1, 0, 0.2156863, 1,
1.739003, -2.200485, 1.383797, 1, 0, 0.2117647, 1,
1.761762, -0.0704921, 0.7039986, 1, 0, 0.2039216, 1,
1.779077, -1.176381, 1.391275, 1, 0, 0.1960784, 1,
1.795033, -0.2749278, 2.409732, 1, 0, 0.1921569, 1,
1.800137, -1.281411, 3.258748, 1, 0, 0.1843137, 1,
1.88767, 0.4620878, 2.112409, 1, 0, 0.1803922, 1,
1.900731, -1.203109, 1.34514, 1, 0, 0.172549, 1,
1.908063, 1.450106, -1.360712, 1, 0, 0.1686275, 1,
1.91914, 1.228681, -0.6489977, 1, 0, 0.1607843, 1,
1.926672, -1.316282, 2.618421, 1, 0, 0.1568628, 1,
1.930369, -0.9983138, 1.703665, 1, 0, 0.1490196, 1,
2.01913, 0.603915, 0.5451093, 1, 0, 0.145098, 1,
2.035153, -0.4496624, 1.18359, 1, 0, 0.1372549, 1,
2.036192, 1.125439, 1.185411, 1, 0, 0.1333333, 1,
2.048112, -0.4283191, 2.171661, 1, 0, 0.1254902, 1,
2.073835, -1.448048, 3.195057, 1, 0, 0.1215686, 1,
2.094352, -0.1008259, 1.50493, 1, 0, 0.1137255, 1,
2.096121, -1.434712, 0.9191121, 1, 0, 0.1098039, 1,
2.134358, -0.4852855, 2.550395, 1, 0, 0.1019608, 1,
2.137428, 0.5228363, -0.7410195, 1, 0, 0.09411765, 1,
2.172289, 0.9019998, 0.5198389, 1, 0, 0.09019608, 1,
2.18169, -0.7543105, 2.059989, 1, 0, 0.08235294, 1,
2.184721, -0.3143031, 1.106958, 1, 0, 0.07843138, 1,
2.212662, -0.2222069, 2.888528, 1, 0, 0.07058824, 1,
2.245381, -0.3412316, 0.835586, 1, 0, 0.06666667, 1,
2.256454, -0.1849885, 1.843117, 1, 0, 0.05882353, 1,
2.276732, -2.452967, 4.3905, 1, 0, 0.05490196, 1,
2.339785, 0.2753622, 2.285112, 1, 0, 0.04705882, 1,
2.367251, -0.0931064, 0.8639534, 1, 0, 0.04313726, 1,
2.370493, 0.2035022, -0.2906313, 1, 0, 0.03529412, 1,
2.413382, 0.7831552, 0.2752704, 1, 0, 0.03137255, 1,
2.427168, -0.8241088, 3.162248, 1, 0, 0.02352941, 1,
2.440915, 1.65717, 2.102533, 1, 0, 0.01960784, 1,
2.720313, 1.720132, 0.888069, 1, 0, 0.01176471, 1,
3.081433, -0.7019482, 0.2101147, 1, 0, 0.007843138, 1
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
0.1909925, -4.103421, -7.307648, 0, -0.5, 0.5, 0.5,
0.1909925, -4.103421, -7.307648, 1, -0.5, 0.5, 0.5,
0.1909925, -4.103421, -7.307648, 1, 1.5, 0.5, 0.5,
0.1909925, -4.103421, -7.307648, 0, 1.5, 0.5, 0.5
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
-3.679307, 0.109549, -7.307648, 0, -0.5, 0.5, 0.5,
-3.679307, 0.109549, -7.307648, 1, -0.5, 0.5, 0.5,
-3.679307, 0.109549, -7.307648, 1, 1.5, 0.5, 0.5,
-3.679307, 0.109549, -7.307648, 0, 1.5, 0.5, 0.5
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
-3.679307, -4.103421, 0.1583152, 0, -0.5, 0.5, 0.5,
-3.679307, -4.103421, 0.1583152, 1, -0.5, 0.5, 0.5,
-3.679307, -4.103421, 0.1583152, 1, 1.5, 0.5, 0.5,
-3.679307, -4.103421, 0.1583152, 0, 1.5, 0.5, 0.5
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
-2, -3.131197, -5.584733,
3, -3.131197, -5.584733,
-2, -3.131197, -5.584733,
-2, -3.293234, -5.871886,
-1, -3.131197, -5.584733,
-1, -3.293234, -5.871886,
0, -3.131197, -5.584733,
0, -3.293234, -5.871886,
1, -3.131197, -5.584733,
1, -3.293234, -5.871886,
2, -3.131197, -5.584733,
2, -3.293234, -5.871886,
3, -3.131197, -5.584733,
3, -3.293234, -5.871886
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
-2, -3.617309, -6.44619, 0, -0.5, 0.5, 0.5,
-2, -3.617309, -6.44619, 1, -0.5, 0.5, 0.5,
-2, -3.617309, -6.44619, 1, 1.5, 0.5, 0.5,
-2, -3.617309, -6.44619, 0, 1.5, 0.5, 0.5,
-1, -3.617309, -6.44619, 0, -0.5, 0.5, 0.5,
-1, -3.617309, -6.44619, 1, -0.5, 0.5, 0.5,
-1, -3.617309, -6.44619, 1, 1.5, 0.5, 0.5,
-1, -3.617309, -6.44619, 0, 1.5, 0.5, 0.5,
0, -3.617309, -6.44619, 0, -0.5, 0.5, 0.5,
0, -3.617309, -6.44619, 1, -0.5, 0.5, 0.5,
0, -3.617309, -6.44619, 1, 1.5, 0.5, 0.5,
0, -3.617309, -6.44619, 0, 1.5, 0.5, 0.5,
1, -3.617309, -6.44619, 0, -0.5, 0.5, 0.5,
1, -3.617309, -6.44619, 1, -0.5, 0.5, 0.5,
1, -3.617309, -6.44619, 1, 1.5, 0.5, 0.5,
1, -3.617309, -6.44619, 0, 1.5, 0.5, 0.5,
2, -3.617309, -6.44619, 0, -0.5, 0.5, 0.5,
2, -3.617309, -6.44619, 1, -0.5, 0.5, 0.5,
2, -3.617309, -6.44619, 1, 1.5, 0.5, 0.5,
2, -3.617309, -6.44619, 0, 1.5, 0.5, 0.5,
3, -3.617309, -6.44619, 0, -0.5, 0.5, 0.5,
3, -3.617309, -6.44619, 1, -0.5, 0.5, 0.5,
3, -3.617309, -6.44619, 1, 1.5, 0.5, 0.5,
3, -3.617309, -6.44619, 0, 1.5, 0.5, 0.5
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
-2.786161, -3, -5.584733,
-2.786161, 3, -5.584733,
-2.786161, -3, -5.584733,
-2.935019, -3, -5.871886,
-2.786161, -2, -5.584733,
-2.935019, -2, -5.871886,
-2.786161, -1, -5.584733,
-2.935019, -1, -5.871886,
-2.786161, 0, -5.584733,
-2.935019, 0, -5.871886,
-2.786161, 1, -5.584733,
-2.935019, 1, -5.871886,
-2.786161, 2, -5.584733,
-2.935019, 2, -5.871886,
-2.786161, 3, -5.584733,
-2.935019, 3, -5.871886
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
-3.232734, -3, -6.44619, 0, -0.5, 0.5, 0.5,
-3.232734, -3, -6.44619, 1, -0.5, 0.5, 0.5,
-3.232734, -3, -6.44619, 1, 1.5, 0.5, 0.5,
-3.232734, -3, -6.44619, 0, 1.5, 0.5, 0.5,
-3.232734, -2, -6.44619, 0, -0.5, 0.5, 0.5,
-3.232734, -2, -6.44619, 1, -0.5, 0.5, 0.5,
-3.232734, -2, -6.44619, 1, 1.5, 0.5, 0.5,
-3.232734, -2, -6.44619, 0, 1.5, 0.5, 0.5,
-3.232734, -1, -6.44619, 0, -0.5, 0.5, 0.5,
-3.232734, -1, -6.44619, 1, -0.5, 0.5, 0.5,
-3.232734, -1, -6.44619, 1, 1.5, 0.5, 0.5,
-3.232734, -1, -6.44619, 0, 1.5, 0.5, 0.5,
-3.232734, 0, -6.44619, 0, -0.5, 0.5, 0.5,
-3.232734, 0, -6.44619, 1, -0.5, 0.5, 0.5,
-3.232734, 0, -6.44619, 1, 1.5, 0.5, 0.5,
-3.232734, 0, -6.44619, 0, 1.5, 0.5, 0.5,
-3.232734, 1, -6.44619, 0, -0.5, 0.5, 0.5,
-3.232734, 1, -6.44619, 1, -0.5, 0.5, 0.5,
-3.232734, 1, -6.44619, 1, 1.5, 0.5, 0.5,
-3.232734, 1, -6.44619, 0, 1.5, 0.5, 0.5,
-3.232734, 2, -6.44619, 0, -0.5, 0.5, 0.5,
-3.232734, 2, -6.44619, 1, -0.5, 0.5, 0.5,
-3.232734, 2, -6.44619, 1, 1.5, 0.5, 0.5,
-3.232734, 2, -6.44619, 0, 1.5, 0.5, 0.5,
-3.232734, 3, -6.44619, 0, -0.5, 0.5, 0.5,
-3.232734, 3, -6.44619, 1, -0.5, 0.5, 0.5,
-3.232734, 3, -6.44619, 1, 1.5, 0.5, 0.5,
-3.232734, 3, -6.44619, 0, 1.5, 0.5, 0.5
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
-2.786161, -3.131197, -4,
-2.786161, -3.131197, 4,
-2.786161, -3.131197, -4,
-2.935019, -3.293234, -4,
-2.786161, -3.131197, -2,
-2.935019, -3.293234, -2,
-2.786161, -3.131197, 0,
-2.935019, -3.293234, 0,
-2.786161, -3.131197, 2,
-2.935019, -3.293234, 2,
-2.786161, -3.131197, 4,
-2.935019, -3.293234, 4
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
-3.232734, -3.617309, -4, 0, -0.5, 0.5, 0.5,
-3.232734, -3.617309, -4, 1, -0.5, 0.5, 0.5,
-3.232734, -3.617309, -4, 1, 1.5, 0.5, 0.5,
-3.232734, -3.617309, -4, 0, 1.5, 0.5, 0.5,
-3.232734, -3.617309, -2, 0, -0.5, 0.5, 0.5,
-3.232734, -3.617309, -2, 1, -0.5, 0.5, 0.5,
-3.232734, -3.617309, -2, 1, 1.5, 0.5, 0.5,
-3.232734, -3.617309, -2, 0, 1.5, 0.5, 0.5,
-3.232734, -3.617309, 0, 0, -0.5, 0.5, 0.5,
-3.232734, -3.617309, 0, 1, -0.5, 0.5, 0.5,
-3.232734, -3.617309, 0, 1, 1.5, 0.5, 0.5,
-3.232734, -3.617309, 0, 0, 1.5, 0.5, 0.5,
-3.232734, -3.617309, 2, 0, -0.5, 0.5, 0.5,
-3.232734, -3.617309, 2, 1, -0.5, 0.5, 0.5,
-3.232734, -3.617309, 2, 1, 1.5, 0.5, 0.5,
-3.232734, -3.617309, 2, 0, 1.5, 0.5, 0.5,
-3.232734, -3.617309, 4, 0, -0.5, 0.5, 0.5,
-3.232734, -3.617309, 4, 1, -0.5, 0.5, 0.5,
-3.232734, -3.617309, 4, 1, 1.5, 0.5, 0.5,
-3.232734, -3.617309, 4, 0, 1.5, 0.5, 0.5
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
-2.786161, -3.131197, -5.584733,
-2.786161, 3.350295, -5.584733,
-2.786161, -3.131197, 5.901363,
-2.786161, 3.350295, 5.901363,
-2.786161, -3.131197, -5.584733,
-2.786161, -3.131197, 5.901363,
-2.786161, 3.350295, -5.584733,
-2.786161, 3.350295, 5.901363,
-2.786161, -3.131197, -5.584733,
3.168146, -3.131197, -5.584733,
-2.786161, -3.131197, 5.901363,
3.168146, -3.131197, 5.901363,
-2.786161, 3.350295, -5.584733,
3.168146, 3.350295, -5.584733,
-2.786161, 3.350295, 5.901363,
3.168146, 3.350295, 5.901363,
3.168146, -3.131197, -5.584733,
3.168146, 3.350295, -5.584733,
3.168146, -3.131197, 5.901363,
3.168146, 3.350295, 5.901363,
3.168146, -3.131197, -5.584733,
3.168146, -3.131197, 5.901363,
3.168146, 3.350295, -5.584733,
3.168146, 3.350295, 5.901363
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
var radius = 7.72694;
var distance = 34.37803;
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
mvMatrix.translate( -0.1909925, -0.109549, -0.1583152 );
mvMatrix.scale( 1.403105, 1.288981, 0.7273592 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.37803);
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
butocarboxim<-read.table("butocarboxim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-butocarboxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'butocarboxim' not found
```

```r
y<-butocarboxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'butocarboxim' not found
```

```r
z<-butocarboxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'butocarboxim' not found
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
-2.699448, 0.6223679, -1.768572, 0, 0, 1, 1, 1,
-2.673292, 0.1536573, -0.02446933, 1, 0, 0, 1, 1,
-2.517056, 0.1459647, -3.696746, 1, 0, 0, 1, 1,
-2.506929, -0.815322, -2.659027, 1, 0, 0, 1, 1,
-2.413251, 1.615796, -1.769323, 1, 0, 0, 1, 1,
-2.382232, -0.536557, -1.49468, 1, 0, 0, 1, 1,
-2.324089, -0.3579368, -1.421611, 0, 0, 0, 1, 1,
-2.301073, -0.6977519, -2.831917, 0, 0, 0, 1, 1,
-2.289264, -0.260493, -0.9680166, 0, 0, 0, 1, 1,
-2.281715, 0.4987943, -2.137752, 0, 0, 0, 1, 1,
-2.272432, 1.266563, -1.926637, 0, 0, 0, 1, 1,
-2.252644, 0.8247463, -0.4883294, 0, 0, 0, 1, 1,
-2.194925, 0.8376744, -1.222359, 0, 0, 0, 1, 1,
-2.125233, 0.5127559, -2.003609, 1, 1, 1, 1, 1,
-2.104352, -1.229118, -0.7671391, 1, 1, 1, 1, 1,
-2.086425, 0.4047052, -0.8348657, 1, 1, 1, 1, 1,
-2.083539, 1.32745, -0.09323795, 1, 1, 1, 1, 1,
-2.082708, -0.315997, -3.697748, 1, 1, 1, 1, 1,
-2.049617, 0.07951982, -3.869973, 1, 1, 1, 1, 1,
-2.0488, -0.3684437, -2.120524, 1, 1, 1, 1, 1,
-2.041469, 2.047746, 0.6240652, 1, 1, 1, 1, 1,
-2.020001, 0.2041003, -0.9552925, 1, 1, 1, 1, 1,
-2.005594, 0.02317704, -2.43229, 1, 1, 1, 1, 1,
-1.987267, 0.5332099, -0.9554543, 1, 1, 1, 1, 1,
-1.963839, 0.3290008, -2.346222, 1, 1, 1, 1, 1,
-1.938661, 0.4732331, -2.140188, 1, 1, 1, 1, 1,
-1.933073, -0.05962963, -0.2108042, 1, 1, 1, 1, 1,
-1.910552, 0.7289002, -3.249389, 1, 1, 1, 1, 1,
-1.899738, 1.115215, -0.6580476, 0, 0, 1, 1, 1,
-1.892657, 0.3082809, -1.428255, 1, 0, 0, 1, 1,
-1.877682, -1.95504, -0.6669437, 1, 0, 0, 1, 1,
-1.871617, 0.5203916, -1.58512, 1, 0, 0, 1, 1,
-1.870786, 0.8526022, -1.65859, 1, 0, 0, 1, 1,
-1.865818, 2.805529, -0.700281, 1, 0, 0, 1, 1,
-1.852252, 0.5068048, -0.08502239, 0, 0, 0, 1, 1,
-1.843909, -0.9900743, -1.797725, 0, 0, 0, 1, 1,
-1.811316, -0.2019434, -2.352503, 0, 0, 0, 1, 1,
-1.796162, 0.4015511, -1.721038, 0, 0, 0, 1, 1,
-1.782832, -1.733739, -3.294152, 0, 0, 0, 1, 1,
-1.771141, 0.4326764, -1.47257, 0, 0, 0, 1, 1,
-1.767495, -2.154011, -1.529228, 0, 0, 0, 1, 1,
-1.74772, -0.8439729, -1.756642, 1, 1, 1, 1, 1,
-1.736485, 0.1084857, -3.47262, 1, 1, 1, 1, 1,
-1.719603, 0.9323373, 0.1708869, 1, 1, 1, 1, 1,
-1.704187, 0.1502427, -0.6816568, 1, 1, 1, 1, 1,
-1.688326, 1.781563, -1.62228, 1, 1, 1, 1, 1,
-1.688051, -1.846082, -3.604074, 1, 1, 1, 1, 1,
-1.687567, -0.6964764, -0.5899223, 1, 1, 1, 1, 1,
-1.678872, -0.9032232, -3.506105, 1, 1, 1, 1, 1,
-1.677153, 0.8499856, -0.6021468, 1, 1, 1, 1, 1,
-1.659599, 0.961347, -2.014509, 1, 1, 1, 1, 1,
-1.656599, 0.213086, -1.592854, 1, 1, 1, 1, 1,
-1.648326, -0.6398153, -3.386556, 1, 1, 1, 1, 1,
-1.64675, -0.6633046, -2.71472, 1, 1, 1, 1, 1,
-1.637079, -1.263598, -2.610442, 1, 1, 1, 1, 1,
-1.635805, 0.7331462, -1.166679, 1, 1, 1, 1, 1,
-1.633707, -0.6469663, -0.9344394, 0, 0, 1, 1, 1,
-1.619064, -0.108398, -3.956303, 1, 0, 0, 1, 1,
-1.600485, -1.564544, -0.6399555, 1, 0, 0, 1, 1,
-1.598476, 0.02926579, -3.454294, 1, 0, 0, 1, 1,
-1.579103, -1.233011, -2.834368, 1, 0, 0, 1, 1,
-1.571714, 0.848133, -1.96689, 1, 0, 0, 1, 1,
-1.564835, -1.178725, -3.686247, 0, 0, 0, 1, 1,
-1.55711, 0.820931, -2.179364, 0, 0, 0, 1, 1,
-1.550546, -0.01768124, -1.238978, 0, 0, 0, 1, 1,
-1.532786, 0.05936446, -1.607372, 0, 0, 0, 1, 1,
-1.526471, 0.794003, -1.616774, 0, 0, 0, 1, 1,
-1.503601, -0.1361757, -2.350237, 0, 0, 0, 1, 1,
-1.502041, 1.244968, -0.698737, 0, 0, 0, 1, 1,
-1.489954, 1.497716, -1.197339, 1, 1, 1, 1, 1,
-1.468596, -1.030022, -3.013052, 1, 1, 1, 1, 1,
-1.462774, 1.25641, 0.7505088, 1, 1, 1, 1, 1,
-1.46122, -0.2347152, -3.174408, 1, 1, 1, 1, 1,
-1.456535, -1.335029, -3.048499, 1, 1, 1, 1, 1,
-1.446224, -0.1346724, -2.448692, 1, 1, 1, 1, 1,
-1.428135, -0.5493431, -2.67106, 1, 1, 1, 1, 1,
-1.419862, -0.01371637, -1.17821, 1, 1, 1, 1, 1,
-1.403881, 1.562137, -0.5393088, 1, 1, 1, 1, 1,
-1.399026, -1.404995, -1.853678, 1, 1, 1, 1, 1,
-1.398088, -0.1586921, -3.669022, 1, 1, 1, 1, 1,
-1.39531, 0.6308495, -1.818446, 1, 1, 1, 1, 1,
-1.391219, -0.8402839, -1.874506, 1, 1, 1, 1, 1,
-1.385342, 0.03088031, 0.5157452, 1, 1, 1, 1, 1,
-1.374226, -0.6187615, -1.89827, 1, 1, 1, 1, 1,
-1.373622, -1.32962, -3.128274, 0, 0, 1, 1, 1,
-1.36801, -0.3286899, -0.9667522, 1, 0, 0, 1, 1,
-1.366823, 0.4655015, -0.9124228, 1, 0, 0, 1, 1,
-1.363793, 0.6114946, -0.7037889, 1, 0, 0, 1, 1,
-1.33575, -0.4107777, -2.409347, 1, 0, 0, 1, 1,
-1.329664, 2.522604, -2.94447, 1, 0, 0, 1, 1,
-1.325915, -0.698953, -1.382031, 0, 0, 0, 1, 1,
-1.320572, -0.713013, -1.43661, 0, 0, 0, 1, 1,
-1.308785, -0.6489581, -2.575882, 0, 0, 0, 1, 1,
-1.307348, -0.4898854, -1.669719, 0, 0, 0, 1, 1,
-1.299548, -0.4783869, -1.965346, 0, 0, 0, 1, 1,
-1.289405, 0.7476906, -1.691822, 0, 0, 0, 1, 1,
-1.284735, 1.297918, -1.537678, 0, 0, 0, 1, 1,
-1.271014, 0.3716485, -1.419767, 1, 1, 1, 1, 1,
-1.269914, 0.3041857, 0.5757943, 1, 1, 1, 1, 1,
-1.264237, 0.560018, 0.4886713, 1, 1, 1, 1, 1,
-1.260484, 0.4723428, -0.1038357, 1, 1, 1, 1, 1,
-1.258959, -2.767097, -5.41746, 1, 1, 1, 1, 1,
-1.257618, 0.1750223, -1.359529, 1, 1, 1, 1, 1,
-1.25635, -0.2324286, -1.842282, 1, 1, 1, 1, 1,
-1.253086, 0.05998115, 0.4833416, 1, 1, 1, 1, 1,
-1.251586, 1.228477, -0.2275012, 1, 1, 1, 1, 1,
-1.247368, -0.09412874, -2.083808, 1, 1, 1, 1, 1,
-1.24373, -0.1703037, -2.003406, 1, 1, 1, 1, 1,
-1.243474, 0.8977673, -0.2653442, 1, 1, 1, 1, 1,
-1.241698, -1.171327, -1.332776, 1, 1, 1, 1, 1,
-1.235717, -0.3625029, -2.326118, 1, 1, 1, 1, 1,
-1.227881, -0.5302589, -3.793626, 1, 1, 1, 1, 1,
-1.215588, 0.5261492, -0.6106165, 0, 0, 1, 1, 1,
-1.21438, -0.3084194, -1.444013, 1, 0, 0, 1, 1,
-1.210182, -0.6684818, -2.964622, 1, 0, 0, 1, 1,
-1.208891, -0.9236427, -3.83776, 1, 0, 0, 1, 1,
-1.202455, 1.570169, -2.103055, 1, 0, 0, 1, 1,
-1.201192, -1.715873, -2.852101, 1, 0, 0, 1, 1,
-1.196348, 0.4654596, -1.571075, 0, 0, 0, 1, 1,
-1.1961, -0.6215848, -1.857236, 0, 0, 0, 1, 1,
-1.188647, -0.05034254, -0.6951792, 0, 0, 0, 1, 1,
-1.17851, -0.1122366, -0.9534342, 0, 0, 0, 1, 1,
-1.172691, -0.3520391, -2.623448, 0, 0, 0, 1, 1,
-1.169603, -0.2457627, -1.149866, 0, 0, 0, 1, 1,
-1.16449, 0.9264437, -0.7364804, 0, 0, 0, 1, 1,
-1.15108, -0.6724484, -2.299721, 1, 1, 1, 1, 1,
-1.149256, 0.8722911, -0.831477, 1, 1, 1, 1, 1,
-1.147506, 0.3410107, -0.526926, 1, 1, 1, 1, 1,
-1.14515, 0.01861753, -0.5928665, 1, 1, 1, 1, 1,
-1.143835, 0.3168877, -0.5193865, 1, 1, 1, 1, 1,
-1.137924, -0.9750175, -3.27263, 1, 1, 1, 1, 1,
-1.133518, 0.9435973, -0.0740383, 1, 1, 1, 1, 1,
-1.13175, 0.4723508, -0.9991825, 1, 1, 1, 1, 1,
-1.1289, 0.3630928, -1.118726, 1, 1, 1, 1, 1,
-1.123817, 1.588469, -0.5374665, 1, 1, 1, 1, 1,
-1.118453, -0.7923715, -3.690513, 1, 1, 1, 1, 1,
-1.113768, 0.670724, -1.345298, 1, 1, 1, 1, 1,
-1.112085, -1.08253, -2.243601, 1, 1, 1, 1, 1,
-1.111672, -0.7220154, -2.004434, 1, 1, 1, 1, 1,
-1.105209, 0.8009007, 0.3073504, 1, 1, 1, 1, 1,
-1.101639, -0.490317, -1.427005, 0, 0, 1, 1, 1,
-1.09874, -0.6690971, -1.393767, 1, 0, 0, 1, 1,
-1.091557, 1.035651, 0.8570612, 1, 0, 0, 1, 1,
-1.082596, -0.07666742, -2.506412, 1, 0, 0, 1, 1,
-1.081467, -0.3189343, -1.822384, 1, 0, 0, 1, 1,
-1.080294, 0.7739643, -0.3120487, 1, 0, 0, 1, 1,
-1.078432, 2.51922, 1.730921, 0, 0, 0, 1, 1,
-1.078256, -1.141803, -2.410697, 0, 0, 0, 1, 1,
-1.073286, 0.4760565, -0.3479587, 0, 0, 0, 1, 1,
-1.070283, 0.6227713, -1.555461, 0, 0, 0, 1, 1,
-1.067195, -1.899354, -2.0563, 0, 0, 0, 1, 1,
-1.055807, -1.253603, -3.62268, 0, 0, 0, 1, 1,
-1.049127, -2.688863, -4.184832, 0, 0, 0, 1, 1,
-1.047454, -0.3394739, -0.9366002, 1, 1, 1, 1, 1,
-1.039161, -0.8474948, -0.744088, 1, 1, 1, 1, 1,
-1.037397, -0.3284228, -1.725224, 1, 1, 1, 1, 1,
-1.029999, -0.06140845, -1.32871, 1, 1, 1, 1, 1,
-1.027205, -0.7533795, -1.723777, 1, 1, 1, 1, 1,
-1.025682, 0.152126, -1.834154, 1, 1, 1, 1, 1,
-1.024577, -1.043976, -2.245203, 1, 1, 1, 1, 1,
-1.023647, 0.2980355, -1.525852, 1, 1, 1, 1, 1,
-1.021158, -1.416583, -1.738076, 1, 1, 1, 1, 1,
-1.014851, -0.6239874, -3.63309, 1, 1, 1, 1, 1,
-1.005448, 0.3750488, -2.321959, 1, 1, 1, 1, 1,
-1.004187, 2.508166, -1.343727, 1, 1, 1, 1, 1,
-1.003833, 0.7698513, -1.929677, 1, 1, 1, 1, 1,
-1.002923, -0.3042804, -3.108246, 1, 1, 1, 1, 1,
-0.996251, 0.7103906, -2.185905, 1, 1, 1, 1, 1,
-0.9955078, -0.3246757, -0.4024093, 0, 0, 1, 1, 1,
-0.9880427, 0.7972869, -0.9982071, 1, 0, 0, 1, 1,
-0.9852886, -1.252757, -2.313188, 1, 0, 0, 1, 1,
-0.9804161, 0.6827272, -0.6669147, 1, 0, 0, 1, 1,
-0.9785584, 1.172035, -0.379923, 1, 0, 0, 1, 1,
-0.9731829, -1.485376, -1.887303, 1, 0, 0, 1, 1,
-0.9722505, 0.5130924, 0.4958261, 0, 0, 0, 1, 1,
-0.9711316, 1.74717, -1.724479, 0, 0, 0, 1, 1,
-0.9634661, -0.2825188, -1.653878, 0, 0, 0, 1, 1,
-0.961014, 0.3044182, -3.565915, 0, 0, 0, 1, 1,
-0.9563279, 0.1607977, 0.2297201, 0, 0, 0, 1, 1,
-0.9520332, 0.1912372, -0.1861911, 0, 0, 0, 1, 1,
-0.951245, 1.322668, -0.4106892, 0, 0, 0, 1, 1,
-0.948921, 0.1531629, -1.492675, 1, 1, 1, 1, 1,
-0.9483308, -0.3359563, -1.016468, 1, 1, 1, 1, 1,
-0.947626, 0.8246371, -2.109413, 1, 1, 1, 1, 1,
-0.9458545, 0.5096721, -0.7162017, 1, 1, 1, 1, 1,
-0.9447692, -0.3180292, -3.033513, 1, 1, 1, 1, 1,
-0.9379357, -0.01244892, -1.598976, 1, 1, 1, 1, 1,
-0.9358667, -0.2744374, -3.578119, 1, 1, 1, 1, 1,
-0.9290132, 1.932307, -0.5260378, 1, 1, 1, 1, 1,
-0.9207271, 0.2209662, -1.491318, 1, 1, 1, 1, 1,
-0.9171436, 0.4718536, -2.113734, 1, 1, 1, 1, 1,
-0.9161618, -0.2623288, -1.644289, 1, 1, 1, 1, 1,
-0.9056968, 0.5632316, -0.9714516, 1, 1, 1, 1, 1,
-0.8983458, -1.115101, -3.039106, 1, 1, 1, 1, 1,
-0.896432, -0.1838651, -2.490938, 1, 1, 1, 1, 1,
-0.8959271, 0.5996639, -2.413539, 1, 1, 1, 1, 1,
-0.8938723, 1.501846, -0.1562543, 0, 0, 1, 1, 1,
-0.8901041, 0.7049108, -2.459462, 1, 0, 0, 1, 1,
-0.8868879, -0.8414866, -3.242763, 1, 0, 0, 1, 1,
-0.8855335, 2.201717, 0.5787948, 1, 0, 0, 1, 1,
-0.8724839, -2.154955, -1.848168, 1, 0, 0, 1, 1,
-0.8698102, 0.571405, -2.131009, 1, 0, 0, 1, 1,
-0.8667223, -0.9465076, -0.6052313, 0, 0, 0, 1, 1,
-0.8663136, -0.08463222, -1.346967, 0, 0, 0, 1, 1,
-0.8630556, -0.1017219, -2.089896, 0, 0, 0, 1, 1,
-0.8621118, -0.09931435, -3.422702, 0, 0, 0, 1, 1,
-0.8617249, 0.4617197, -1.629041, 0, 0, 0, 1, 1,
-0.857708, -0.6748489, -3.578451, 0, 0, 0, 1, 1,
-0.8575031, -0.01244922, -0.3246326, 0, 0, 0, 1, 1,
-0.8571921, -0.4603414, -3.677293, 1, 1, 1, 1, 1,
-0.857096, 1.792488, -2.670797, 1, 1, 1, 1, 1,
-0.854152, 0.1947353, -2.047555, 1, 1, 1, 1, 1,
-0.8432036, -0.3346643, -0.6271339, 1, 1, 1, 1, 1,
-0.8423105, -1.876482, -1.626251, 1, 1, 1, 1, 1,
-0.8420154, -1.580944, -2.355096, 1, 1, 1, 1, 1,
-0.8407291, -0.3411311, -1.688173, 1, 1, 1, 1, 1,
-0.8369964, -0.6301708, -3.486341, 1, 1, 1, 1, 1,
-0.8369442, 0.1562102, -1.53551, 1, 1, 1, 1, 1,
-0.8356572, 0.5448623, -3.367015, 1, 1, 1, 1, 1,
-0.83259, -0.1242568, -2.924249, 1, 1, 1, 1, 1,
-0.8315003, 2.453149, 1.275642, 1, 1, 1, 1, 1,
-0.8269714, -0.3171443, -1.089645, 1, 1, 1, 1, 1,
-0.8249696, 0.3069745, -2.5249, 1, 1, 1, 1, 1,
-0.8223999, -0.4813994, -1.236208, 1, 1, 1, 1, 1,
-0.8166736, 0.6394708, -1.718017, 0, 0, 1, 1, 1,
-0.8156375, 0.4162589, -1.777147, 1, 0, 0, 1, 1,
-0.8154978, 2.378119, 0.5863875, 1, 0, 0, 1, 1,
-0.8101157, 0.02938935, -2.403209, 1, 0, 0, 1, 1,
-0.8088301, -1.727413, -3.975047, 1, 0, 0, 1, 1,
-0.8081011, -1.517413, -3.293416, 1, 0, 0, 1, 1,
-0.8024537, -1.035246, -3.41553, 0, 0, 0, 1, 1,
-0.8012658, -1.574808, -1.519429, 0, 0, 0, 1, 1,
-0.790095, -0.008792605, -0.09881704, 0, 0, 0, 1, 1,
-0.7845792, -0.3488596, -0.7230806, 0, 0, 0, 1, 1,
-0.7837889, 0.2087983, -1.013155, 0, 0, 0, 1, 1,
-0.7830684, 0.5265605, -1.588745, 0, 0, 0, 1, 1,
-0.7783295, -0.4866063, -1.815536, 0, 0, 0, 1, 1,
-0.7783082, -0.7752314, -3.421074, 1, 1, 1, 1, 1,
-0.7776228, 0.7119283, -0.1801578, 1, 1, 1, 1, 1,
-0.7679436, 0.2479219, -2.522775, 1, 1, 1, 1, 1,
-0.7590621, -0.02020759, -0.017983, 1, 1, 1, 1, 1,
-0.7504067, -1.163489, -2.122406, 1, 1, 1, 1, 1,
-0.7499629, -1.612583, -4.13153, 1, 1, 1, 1, 1,
-0.7495431, 0.5497015, 1.100787, 1, 1, 1, 1, 1,
-0.7489634, 0.822323, -1.761629, 1, 1, 1, 1, 1,
-0.7359874, -0.847167, -1.170772, 1, 1, 1, 1, 1,
-0.7350289, -0.03715755, -2.387111, 1, 1, 1, 1, 1,
-0.7338271, 0.4354007, -0.6483271, 1, 1, 1, 1, 1,
-0.732051, -1.898094, -2.524472, 1, 1, 1, 1, 1,
-0.7291499, -0.6991745, -1.898317, 1, 1, 1, 1, 1,
-0.7248093, -1.251567, -2.937933, 1, 1, 1, 1, 1,
-0.7238456, -0.7747265, -1.688745, 1, 1, 1, 1, 1,
-0.713231, 0.4119628, -1.273145, 0, 0, 1, 1, 1,
-0.7131283, -0.05935156, -1.911764, 1, 0, 0, 1, 1,
-0.7073017, 1.072662, -1.190134, 1, 0, 0, 1, 1,
-0.70424, 1.483473, -0.6361477, 1, 0, 0, 1, 1,
-0.691615, 0.5075114, -3.290156, 1, 0, 0, 1, 1,
-0.6914394, 1.22802, -0.4864737, 1, 0, 0, 1, 1,
-0.6894678, 1.837187, -1.398455, 0, 0, 0, 1, 1,
-0.6853303, -1.362151, -2.650448, 0, 0, 0, 1, 1,
-0.6839042, -0.8563266, -1.955868, 0, 0, 0, 1, 1,
-0.6810397, -0.4356428, -1.25992, 0, 0, 0, 1, 1,
-0.6801656, -1.641966, -3.083201, 0, 0, 0, 1, 1,
-0.6786445, -1.856358, -2.391804, 0, 0, 0, 1, 1,
-0.6756456, 1.028423, -1.143467, 0, 0, 0, 1, 1,
-0.6725798, -0.6250435, -2.182791, 1, 1, 1, 1, 1,
-0.6723673, -0.06723142, -1.159742, 1, 1, 1, 1, 1,
-0.6718169, -1.950375, -1.494471, 1, 1, 1, 1, 1,
-0.6697333, -1.139399, -3.09226, 1, 1, 1, 1, 1,
-0.6693475, -1.078925, -3.516263, 1, 1, 1, 1, 1,
-0.6682256, 1.102374, -0.9485903, 1, 1, 1, 1, 1,
-0.6670442, 0.6149604, 0.9120059, 1, 1, 1, 1, 1,
-0.6640033, 1.681784, 0.9713171, 1, 1, 1, 1, 1,
-0.6602226, -0.4736556, -3.628712, 1, 1, 1, 1, 1,
-0.6582246, 0.4899445, -0.5379381, 1, 1, 1, 1, 1,
-0.6574033, -0.1887188, -3.535574, 1, 1, 1, 1, 1,
-0.6565023, -1.63539, -2.677936, 1, 1, 1, 1, 1,
-0.6410586, 2.23604, 1.585411, 1, 1, 1, 1, 1,
-0.6362827, -0.8281907, -1.898102, 1, 1, 1, 1, 1,
-0.6321528, 1.336662, 0.4098909, 1, 1, 1, 1, 1,
-0.6312905, 0.8168283, -1.340784, 0, 0, 1, 1, 1,
-0.626502, 1.486961, -0.3450138, 1, 0, 0, 1, 1,
-0.6248188, 0.7100469, -0.9065437, 1, 0, 0, 1, 1,
-0.6248002, 0.8305841, -0.6658448, 1, 0, 0, 1, 1,
-0.6232658, 0.4580709, -0.9779096, 1, 0, 0, 1, 1,
-0.6206211, 0.8829103, -0.3522938, 1, 0, 0, 1, 1,
-0.6159074, 0.9978575, -0.2248709, 0, 0, 0, 1, 1,
-0.612774, -0.1619838, -2.240541, 0, 0, 0, 1, 1,
-0.611667, 0.8338495, -1.940622, 0, 0, 0, 1, 1,
-0.6050262, 0.5754101, -0.90168, 0, 0, 0, 1, 1,
-0.5946696, 1.062841, -0.6307461, 0, 0, 0, 1, 1,
-0.5907362, -0.293519, -2.975738, 0, 0, 0, 1, 1,
-0.5832897, 0.9518996, -1.116728, 0, 0, 0, 1, 1,
-0.5794463, 0.1670543, -2.110912, 1, 1, 1, 1, 1,
-0.5745923, 0.545323, -1.89389, 1, 1, 1, 1, 1,
-0.5663175, -0.2692285, -3.449071, 1, 1, 1, 1, 1,
-0.5658767, -0.7353466, -3.654737, 1, 1, 1, 1, 1,
-0.5618168, -0.2403398, -1.974854, 1, 1, 1, 1, 1,
-0.5580981, 0.7040052, -1.693759, 1, 1, 1, 1, 1,
-0.5410171, 0.6499494, -2.930776, 1, 1, 1, 1, 1,
-0.5392379, -0.4268064, -2.30877, 1, 1, 1, 1, 1,
-0.538898, 0.7918419, 1.677188, 1, 1, 1, 1, 1,
-0.5327334, -0.02762577, -2.769938, 1, 1, 1, 1, 1,
-0.5326552, 1.204076, 0.476131, 1, 1, 1, 1, 1,
-0.5324379, -0.05040503, -1.882562, 1, 1, 1, 1, 1,
-0.5305807, 0.4147161, -0.9327189, 1, 1, 1, 1, 1,
-0.5304865, -0.1514186, -3.187955, 1, 1, 1, 1, 1,
-0.523642, 0.2906339, -1.221991, 1, 1, 1, 1, 1,
-0.5209081, -0.1543563, -1.471585, 0, 0, 1, 1, 1,
-0.520538, -0.1170561, -2.813394, 1, 0, 0, 1, 1,
-0.5179843, -0.2160789, -1.714469, 1, 0, 0, 1, 1,
-0.512922, 0.5208194, -3.264214, 1, 0, 0, 1, 1,
-0.5129134, 1.208257, -2.774694, 1, 0, 0, 1, 1,
-0.5070546, -0.4890271, -2.140509, 1, 0, 0, 1, 1,
-0.5028275, 0.5248191, -1.684489, 0, 0, 0, 1, 1,
-0.5017862, 1.029496, -0.9956455, 0, 0, 0, 1, 1,
-0.4993319, 0.9850108, 0.3848647, 0, 0, 0, 1, 1,
-0.4874131, 0.3158427, -1.594459, 0, 0, 0, 1, 1,
-0.4832791, 0.5706345, -0.5252894, 0, 0, 0, 1, 1,
-0.4817942, -1.19812, -5.183734, 0, 0, 0, 1, 1,
-0.4796295, 0.7307891, 0.7296845, 0, 0, 0, 1, 1,
-0.4789859, -1.481227, -3.686633, 1, 1, 1, 1, 1,
-0.4779959, -0.4443008, -3.284948, 1, 1, 1, 1, 1,
-0.4748834, -1.148948, -2.187874, 1, 1, 1, 1, 1,
-0.4727888, -0.4022796, -3.628354, 1, 1, 1, 1, 1,
-0.4714496, -0.223096, -2.203753, 1, 1, 1, 1, 1,
-0.4713263, -0.07041032, -0.8995546, 1, 1, 1, 1, 1,
-0.4703398, -1.742092, -3.662745, 1, 1, 1, 1, 1,
-0.4646316, -2.094664, -4.698403, 1, 1, 1, 1, 1,
-0.450702, 0.2707473, -1.07276, 1, 1, 1, 1, 1,
-0.4493117, 0.4709044, -0.4399624, 1, 1, 1, 1, 1,
-0.4462289, -0.8897831, -3.24041, 1, 1, 1, 1, 1,
-0.4439296, -1.627797, -2.451303, 1, 1, 1, 1, 1,
-0.4429649, 0.1680875, -0.4024818, 1, 1, 1, 1, 1,
-0.4420164, 0.8285056, -2.321033, 1, 1, 1, 1, 1,
-0.4398852, 1.338455, -1.640793, 1, 1, 1, 1, 1,
-0.4285682, -0.3435989, -1.129636, 0, 0, 1, 1, 1,
-0.4278251, 0.4376965, -1.496334, 1, 0, 0, 1, 1,
-0.4254714, -0.228507, -1.387454, 1, 0, 0, 1, 1,
-0.4237023, 1.366972, -0.6099269, 1, 0, 0, 1, 1,
-0.4215095, 1.460254, 0.1325253, 1, 0, 0, 1, 1,
-0.42136, 1.480801, -1.379766, 1, 0, 0, 1, 1,
-0.4211201, -1.831572, -2.294049, 0, 0, 0, 1, 1,
-0.4204156, 0.5239009, -0.2891558, 0, 0, 0, 1, 1,
-0.4170146, -2.057448, -4.150727, 0, 0, 0, 1, 1,
-0.4168533, -0.6445653, -2.91187, 0, 0, 0, 1, 1,
-0.4137138, 1.471458, -0.85518, 0, 0, 0, 1, 1,
-0.4130319, -0.4138604, -3.358405, 0, 0, 0, 1, 1,
-0.4113854, 0.04702364, -2.293242, 0, 0, 0, 1, 1,
-0.4107212, 0.01625058, -2.241761, 1, 1, 1, 1, 1,
-0.4066948, 1.295858, 0.7635679, 1, 1, 1, 1, 1,
-0.4035664, 0.5931149, 1.026632, 1, 1, 1, 1, 1,
-0.4026771, -0.07805821, -1.026496, 1, 1, 1, 1, 1,
-0.4012824, -0.6410918, -1.727007, 1, 1, 1, 1, 1,
-0.3999064, -0.913221, -1.915131, 1, 1, 1, 1, 1,
-0.3950734, 0.1086818, -0.1458119, 1, 1, 1, 1, 1,
-0.3935131, 0.4507996, -1.115831, 1, 1, 1, 1, 1,
-0.3918352, 0.5143326, -0.5880386, 1, 1, 1, 1, 1,
-0.3913699, -1.360696, -3.368616, 1, 1, 1, 1, 1,
-0.3892631, -0.6815382, -0.1122346, 1, 1, 1, 1, 1,
-0.3862253, 0.8259724, -0.3144031, 1, 1, 1, 1, 1,
-0.3852431, 0.009610509, -1.657708, 1, 1, 1, 1, 1,
-0.3850533, 0.1409772, -0.388695, 1, 1, 1, 1, 1,
-0.3835459, -1.141093, -3.054867, 1, 1, 1, 1, 1,
-0.376857, -1.25736, -4.272339, 0, 0, 1, 1, 1,
-0.3762902, -1.325472, -3.689945, 1, 0, 0, 1, 1,
-0.3665623, -1.356622, -4.907514, 1, 0, 0, 1, 1,
-0.3639093, -1.003203, -2.186089, 1, 0, 0, 1, 1,
-0.3569897, -0.4564961, -1.211836, 1, 0, 0, 1, 1,
-0.3559982, -0.7228314, -3.041613, 1, 0, 0, 1, 1,
-0.3553066, -0.6836735, -1.443929, 0, 0, 0, 1, 1,
-0.3544389, -0.5950493, -3.479804, 0, 0, 0, 1, 1,
-0.3501771, -0.5900326, -3.185371, 0, 0, 0, 1, 1,
-0.3473676, 0.2237634, -0.1805692, 0, 0, 0, 1, 1,
-0.3470858, -0.6227658, -3.973053, 0, 0, 0, 1, 1,
-0.3438112, 1.971709, 1.253722, 0, 0, 0, 1, 1,
-0.340699, 0.8329828, 0.7456965, 0, 0, 0, 1, 1,
-0.3391018, -0.1414294, -2.73421, 1, 1, 1, 1, 1,
-0.3379418, -0.5999562, -1.860437, 1, 1, 1, 1, 1,
-0.3348157, -0.2573195, -0.8788156, 1, 1, 1, 1, 1,
-0.3315643, -0.4932757, -4.223853, 1, 1, 1, 1, 1,
-0.3239014, 0.6269813, -1.732856, 1, 1, 1, 1, 1,
-0.3201002, -1.217352, -1.720752, 1, 1, 1, 1, 1,
-0.3198044, -0.5512304, -2.207409, 1, 1, 1, 1, 1,
-0.3174694, 0.2771738, 0.643633, 1, 1, 1, 1, 1,
-0.3154826, -1.035625, -4.149123, 1, 1, 1, 1, 1,
-0.3154139, -0.6026601, -3.15609, 1, 1, 1, 1, 1,
-0.3146771, 0.4912684, -1.747498, 1, 1, 1, 1, 1,
-0.3107871, 0.09629122, -0.7013532, 1, 1, 1, 1, 1,
-0.3101117, -0.717307, -1.256506, 1, 1, 1, 1, 1,
-0.3052339, -2.050876, -3.853142, 1, 1, 1, 1, 1,
-0.3040494, 2.58415, 0.5179031, 1, 1, 1, 1, 1,
-0.2994574, -1.102008, -3.884648, 0, 0, 1, 1, 1,
-0.2989722, 1.305992, 0.5859821, 1, 0, 0, 1, 1,
-0.2985848, 0.5590948, -1.14816, 1, 0, 0, 1, 1,
-0.2951293, -0.8526259, -1.742983, 1, 0, 0, 1, 1,
-0.2902573, 0.8013741, -0.04778786, 1, 0, 0, 1, 1,
-0.288472, 0.8149512, -0.09038329, 1, 0, 0, 1, 1,
-0.2845418, -0.2241326, -2.60399, 0, 0, 0, 1, 1,
-0.2839569, -0.2102525, -1.740426, 0, 0, 0, 1, 1,
-0.283139, 0.3857889, -0.2905149, 0, 0, 0, 1, 1,
-0.280262, 0.4998287, 0.3719451, 0, 0, 0, 1, 1,
-0.2779835, 0.9859642, -0.07177948, 0, 0, 0, 1, 1,
-0.2735844, 0.8845509, -3.135214, 0, 0, 0, 1, 1,
-0.2651894, 0.4341882, -0.4613869, 0, 0, 0, 1, 1,
-0.2643968, -1.014692, -1.488466, 1, 1, 1, 1, 1,
-0.2640349, -0.7795122, -5.179506, 1, 1, 1, 1, 1,
-0.2606041, -0.1431944, -0.8574473, 1, 1, 1, 1, 1,
-0.2593231, -0.2332456, -2.494804, 1, 1, 1, 1, 1,
-0.2581042, -0.2106261, -1.607101, 1, 1, 1, 1, 1,
-0.2561806, 1.25138, -0.7087066, 1, 1, 1, 1, 1,
-0.2557351, 0.8537878, -0.0350931, 1, 1, 1, 1, 1,
-0.2525503, 1.435685, 0.003502798, 1, 1, 1, 1, 1,
-0.2506297, -0.6039475, -3.274404, 1, 1, 1, 1, 1,
-0.2427374, 0.439618, 0.5804031, 1, 1, 1, 1, 1,
-0.2412925, 0.8430032, 0.04709761, 1, 1, 1, 1, 1,
-0.2394698, 0.2016245, -0.3581625, 1, 1, 1, 1, 1,
-0.2377127, -0.8654454, -2.771453, 1, 1, 1, 1, 1,
-0.2356649, -0.9807291, -1.126926, 1, 1, 1, 1, 1,
-0.2305466, -1.426322, -3.421758, 1, 1, 1, 1, 1,
-0.2286585, -0.4118497, -2.415494, 0, 0, 1, 1, 1,
-0.2280527, 1.778547, -0.4648376, 1, 0, 0, 1, 1,
-0.2274207, 0.08191798, -0.1695498, 1, 0, 0, 1, 1,
-0.224284, 1.129734, -1.311564, 1, 0, 0, 1, 1,
-0.223874, 0.4150894, -1.216691, 1, 0, 0, 1, 1,
-0.2185221, -2.355426, -3.058345, 1, 0, 0, 1, 1,
-0.2179637, -0.7701674, -5.340215, 0, 0, 0, 1, 1,
-0.2163846, -0.4994228, -3.169705, 0, 0, 0, 1, 1,
-0.2138238, -0.633962, -2.163204, 0, 0, 0, 1, 1,
-0.2133552, 3.019748, 0.05512255, 0, 0, 0, 1, 1,
-0.2117063, 0.6765925, -1.68749, 0, 0, 0, 1, 1,
-0.2100972, -0.246427, -2.450009, 0, 0, 0, 1, 1,
-0.2026009, -0.2837754, 0.1784126, 0, 0, 0, 1, 1,
-0.2019854, -0.9943753, -3.788954, 1, 1, 1, 1, 1,
-0.2011411, 0.4619355, -0.01044962, 1, 1, 1, 1, 1,
-0.2009809, -1.233527, -2.549358, 1, 1, 1, 1, 1,
-0.200784, 1.297234, 1.055503, 1, 1, 1, 1, 1,
-0.1986913, 1.940278, -1.43895, 1, 1, 1, 1, 1,
-0.1975676, -1.924095, -2.52275, 1, 1, 1, 1, 1,
-0.1968944, -1.386319, -3.049374, 1, 1, 1, 1, 1,
-0.193898, -0.8577154, -2.530972, 1, 1, 1, 1, 1,
-0.1935268, -0.811866, -2.416061, 1, 1, 1, 1, 1,
-0.1916293, 0.2571972, -0.9516336, 1, 1, 1, 1, 1,
-0.1872594, -1.643946, -4.581356, 1, 1, 1, 1, 1,
-0.1832568, -0.380761, -2.839023, 1, 1, 1, 1, 1,
-0.1793307, 1.252491, -0.2288159, 1, 1, 1, 1, 1,
-0.1776942, -0.6334002, -2.861166, 1, 1, 1, 1, 1,
-0.1772011, -1.237419, -3.267965, 1, 1, 1, 1, 1,
-0.1631882, 0.8589858, 0.7131599, 0, 0, 1, 1, 1,
-0.1586996, 0.666963, -0.6027255, 1, 0, 0, 1, 1,
-0.1578485, -1.415626, -3.576054, 1, 0, 0, 1, 1,
-0.1573653, -0.7056279, -2.909023, 1, 0, 0, 1, 1,
-0.1571829, 0.5616721, -1.747827, 1, 0, 0, 1, 1,
-0.1569252, -0.5188562, -3.489061, 1, 0, 0, 1, 1,
-0.1565439, -0.5524123, -2.748103, 0, 0, 0, 1, 1,
-0.1564954, 0.2610756, -1.293773, 0, 0, 0, 1, 1,
-0.1552841, 0.5878429, -0.762054, 0, 0, 0, 1, 1,
-0.1538401, -0.03215387, -2.810802, 0, 0, 0, 1, 1,
-0.1516891, -0.357323, -3.613408, 0, 0, 0, 1, 1,
-0.1506593, 1.568319, -0.2643222, 0, 0, 0, 1, 1,
-0.1503794, 0.7291412, 0.04776152, 0, 0, 0, 1, 1,
-0.1461594, -1.824059, -4.408725, 1, 1, 1, 1, 1,
-0.1404325, -0.694208, -1.99873, 1, 1, 1, 1, 1,
-0.139191, 0.355542, 2.339177, 1, 1, 1, 1, 1,
-0.1352459, 0.5989395, -0.07586492, 1, 1, 1, 1, 1,
-0.1323227, -1.115938, -2.436835, 1, 1, 1, 1, 1,
-0.1230487, -0.1826322, -5.260921, 1, 1, 1, 1, 1,
-0.1218051, -0.9781773, -3.274955, 1, 1, 1, 1, 1,
-0.121125, 0.4941812, -0.08415525, 1, 1, 1, 1, 1,
-0.1202164, -0.665638, -3.081481, 1, 1, 1, 1, 1,
-0.1201318, -0.8919601, -3.754848, 1, 1, 1, 1, 1,
-0.118677, 0.2301781, 1.505468, 1, 1, 1, 1, 1,
-0.1185132, -0.7612675, -2.695933, 1, 1, 1, 1, 1,
-0.1139364, 1.039996, 0.1830744, 1, 1, 1, 1, 1,
-0.111896, 1.727225, -0.8498281, 1, 1, 1, 1, 1,
-0.1116379, 0.7873173, -0.1934658, 1, 1, 1, 1, 1,
-0.1102453, -0.100548, -2.695179, 0, 0, 1, 1, 1,
-0.1080663, 0.5219229, -0.5290952, 1, 0, 0, 1, 1,
-0.1057691, 0.4317567, 0.8679398, 1, 0, 0, 1, 1,
-0.1030638, 0.1528825, -0.3494286, 1, 0, 0, 1, 1,
-0.1023723, -0.9211552, -2.881465, 1, 0, 0, 1, 1,
-0.1016233, -1.191932, -2.056566, 1, 0, 0, 1, 1,
-0.09838645, 0.03950287, -1.864736, 0, 0, 0, 1, 1,
-0.09807865, 0.2683167, -1.136585, 0, 0, 0, 1, 1,
-0.09415901, 1.773657, 0.04649839, 0, 0, 0, 1, 1,
-0.09119891, -1.267148, -2.186388, 0, 0, 0, 1, 1,
-0.09092332, 0.6140112, -1.142314, 0, 0, 0, 1, 1,
-0.09032241, -0.5612676, -3.464717, 0, 0, 0, 1, 1,
-0.08952161, -1.231091, -3.359552, 0, 0, 0, 1, 1,
-0.08883326, 1.647521, 0.07583694, 1, 1, 1, 1, 1,
-0.08389506, 0.2925926, 1.196518, 1, 1, 1, 1, 1,
-0.08349568, -0.2763462, -1.230414, 1, 1, 1, 1, 1,
-0.08267371, -0.8923985, -2.208083, 1, 1, 1, 1, 1,
-0.07955118, 2.001303, 0.1445197, 1, 1, 1, 1, 1,
-0.07392114, 1.780985, 0.1871345, 1, 1, 1, 1, 1,
-0.0731774, 0.7955062, -0.5855434, 1, 1, 1, 1, 1,
-0.0726416, -0.2944038, -2.670203, 1, 1, 1, 1, 1,
-0.07183772, 1.112233, -0.5668343, 1, 1, 1, 1, 1,
-0.06846406, -0.684671, -4.134099, 1, 1, 1, 1, 1,
-0.06264675, -2.019302, -2.720415, 1, 1, 1, 1, 1,
-0.06200997, -0.228786, -1.326837, 1, 1, 1, 1, 1,
-0.05976058, -1.58238, -3.629785, 1, 1, 1, 1, 1,
-0.05578227, -0.2166786, -3.459171, 1, 1, 1, 1, 1,
-0.05402526, -0.4509914, -2.667547, 1, 1, 1, 1, 1,
-0.05225797, -0.3332584, -3.805815, 0, 0, 1, 1, 1,
-0.05090157, -0.01141566, -2.003605, 1, 0, 0, 1, 1,
-0.05043343, -0.5584963, -5.05373, 1, 0, 0, 1, 1,
-0.04888926, 0.04820192, -1.077016, 1, 0, 0, 1, 1,
-0.04859593, 0.7439708, -1.139733, 1, 0, 0, 1, 1,
-0.04829471, 0.7920119, -0.4160884, 1, 0, 0, 1, 1,
-0.04703971, 1.565922, 0.7963886, 0, 0, 0, 1, 1,
-0.04332928, 0.9536424, -0.7469312, 0, 0, 0, 1, 1,
-0.04159338, 2.08488, -0.1620138, 0, 0, 0, 1, 1,
-0.04140414, 0.6462681, -1.034237, 0, 0, 0, 1, 1,
-0.0409843, -1.972309, -4.087434, 0, 0, 0, 1, 1,
-0.04056516, 0.6789989, -0.2952502, 0, 0, 0, 1, 1,
-0.04032291, 0.7819234, 0.09313477, 0, 0, 0, 1, 1,
-0.03833571, 0.2648578, 0.1211399, 1, 1, 1, 1, 1,
-0.03151451, -0.4080909, -1.910882, 1, 1, 1, 1, 1,
-0.03125661, 1.675726, 1.075857, 1, 1, 1, 1, 1,
-0.03124615, -0.7067968, -1.770665, 1, 1, 1, 1, 1,
-0.0272791, 0.4878244, -1.565346, 1, 1, 1, 1, 1,
-0.02500358, 1.977987, 0.6703832, 1, 1, 1, 1, 1,
-0.02282183, -0.4506319, -4.118512, 1, 1, 1, 1, 1,
-0.02267723, -0.5646065, -1.928506, 1, 1, 1, 1, 1,
-0.01869614, -0.4143979, -2.528802, 1, 1, 1, 1, 1,
-0.009981218, -0.2827599, -3.593227, 1, 1, 1, 1, 1,
-0.009798203, -0.9482133, -3.515009, 1, 1, 1, 1, 1,
-0.001600197, -0.6778815, -1.418194, 1, 1, 1, 1, 1,
-0.001292499, 0.761955, -0.2285207, 1, 1, 1, 1, 1,
0.00604428, -0.2127573, 2.252152, 1, 1, 1, 1, 1,
0.00609661, -0.57881, 3.973404, 1, 1, 1, 1, 1,
0.008099635, -0.4430526, 1.963966, 0, 0, 1, 1, 1,
0.01017503, 1.028592, -0.5378088, 1, 0, 0, 1, 1,
0.01399297, 0.5512011, -1.258003, 1, 0, 0, 1, 1,
0.01533675, -0.6712109, 2.821055, 1, 0, 0, 1, 1,
0.01775439, -0.03268468, 2.884228, 1, 0, 0, 1, 1,
0.02061634, 0.7818224, -0.09836484, 1, 0, 0, 1, 1,
0.0255354, 0.3343213, 0.8918646, 0, 0, 0, 1, 1,
0.02693626, -1.393692, 3.302146, 0, 0, 0, 1, 1,
0.037408, -0.04678542, 3.818512, 0, 0, 0, 1, 1,
0.04053478, 0.6961157, -1.955426, 0, 0, 0, 1, 1,
0.04091527, 0.8076418, -2.032089, 0, 0, 0, 1, 1,
0.04592972, -0.9423934, 4.615542, 0, 0, 0, 1, 1,
0.04647266, -1.297249, 3.644293, 0, 0, 0, 1, 1,
0.04966725, -0.8367863, 2.976002, 1, 1, 1, 1, 1,
0.05132451, -1.242211, 2.961941, 1, 1, 1, 1, 1,
0.05397221, 0.4750369, 0.9940192, 1, 1, 1, 1, 1,
0.05534514, 1.960575, 0.4357723, 1, 1, 1, 1, 1,
0.0561173, 0.6823773, -0.3711135, 1, 1, 1, 1, 1,
0.0706088, -0.714986, 5.11324, 1, 1, 1, 1, 1,
0.07202512, -1.06423, 3.765104, 1, 1, 1, 1, 1,
0.07390057, -1.057763, 2.080553, 1, 1, 1, 1, 1,
0.07459889, 0.5672376, -1.117543, 1, 1, 1, 1, 1,
0.08325094, -0.8250571, 3.753359, 1, 1, 1, 1, 1,
0.08348078, 0.25334, 1.137063, 1, 1, 1, 1, 1,
0.08652428, -2.685333, 3.101039, 1, 1, 1, 1, 1,
0.08674148, -0.9152557, 3.934842, 1, 1, 1, 1, 1,
0.08681266, 0.6340171, 0.5348662, 1, 1, 1, 1, 1,
0.0884646, 0.9126856, 1.398631, 1, 1, 1, 1, 1,
0.08961383, 0.8951623, 1.060461, 0, 0, 1, 1, 1,
0.09108777, -0.5028124, 2.302187, 1, 0, 0, 1, 1,
0.09302882, 0.6382694, -0.4568482, 1, 0, 0, 1, 1,
0.09535541, -1.30896, 1.360693, 1, 0, 0, 1, 1,
0.09997639, 0.3307113, -0.3130676, 1, 0, 0, 1, 1,
0.1014143, -0.5429015, 2.573325, 1, 0, 0, 1, 1,
0.1016297, 0.118027, -0.7400593, 0, 0, 0, 1, 1,
0.1024002, 1.593164, 1.260948, 0, 0, 0, 1, 1,
0.103272, 0.5273203, 1.487897, 0, 0, 0, 1, 1,
0.1037572, 0.8529035, -0.4001434, 0, 0, 0, 1, 1,
0.1055244, -1.265319, 0.5459877, 0, 0, 0, 1, 1,
0.1081301, -0.6008855, 3.381503, 0, 0, 0, 1, 1,
0.109908, -0.3048472, 4.577225, 0, 0, 0, 1, 1,
0.1265984, -0.0525585, 2.145362, 1, 1, 1, 1, 1,
0.1271273, 0.7028023, -0.01656902, 1, 1, 1, 1, 1,
0.1284166, 0.03289216, 0.9494262, 1, 1, 1, 1, 1,
0.1286595, -0.2340586, 2.642017, 1, 1, 1, 1, 1,
0.1288564, -1.205332, 2.422606, 1, 1, 1, 1, 1,
0.1348855, -0.03538479, 3.014438, 1, 1, 1, 1, 1,
0.135242, 1.238285, -1.504927, 1, 1, 1, 1, 1,
0.1394134, -0.139704, 1.312628, 1, 1, 1, 1, 1,
0.14781, -0.3566141, 3.077843, 1, 1, 1, 1, 1,
0.1532555, 0.7401702, -0.8165832, 1, 1, 1, 1, 1,
0.153977, -0.3109378, 1.420611, 1, 1, 1, 1, 1,
0.159839, 1.061989, -1.156219, 1, 1, 1, 1, 1,
0.159842, 0.2016013, -2.384581, 1, 1, 1, 1, 1,
0.1612035, -0.7052041, 1.455456, 1, 1, 1, 1, 1,
0.1637986, 1.084903, 1.576287, 1, 1, 1, 1, 1,
0.167717, 1.128122, 0.6627128, 0, 0, 1, 1, 1,
0.1688272, -0.1369157, 1.306918, 1, 0, 0, 1, 1,
0.169618, 0.02383292, 2.034, 1, 0, 0, 1, 1,
0.1703325, -0.252493, 2.256756, 1, 0, 0, 1, 1,
0.1705309, 1.372081, 0.6545747, 1, 0, 0, 1, 1,
0.1746517, -2.923543, 2.061622, 1, 0, 0, 1, 1,
0.1762512, 0.3974068, -0.4538725, 0, 0, 0, 1, 1,
0.1787324, 0.6670372, 2.167069, 0, 0, 0, 1, 1,
0.1802195, 0.5239956, 0.5571055, 0, 0, 0, 1, 1,
0.1848059, -0.5031837, 2.957986, 0, 0, 0, 1, 1,
0.1903073, -1.590929, 3.43061, 0, 0, 0, 1, 1,
0.1917401, -1.019737, 2.923724, 0, 0, 0, 1, 1,
0.1950496, 1.08453, -0.3684781, 0, 0, 0, 1, 1,
0.1951889, 0.2735196, -0.765973, 1, 1, 1, 1, 1,
0.1963636, 1.16518, 2.153973, 1, 1, 1, 1, 1,
0.2021583, 0.4212823, 0.1478198, 1, 1, 1, 1, 1,
0.2023415, -0.6726856, 3.038799, 1, 1, 1, 1, 1,
0.214645, 0.04453377, 1.122488, 1, 1, 1, 1, 1,
0.2158165, 0.7992797, 2.027705, 1, 1, 1, 1, 1,
0.2178515, 0.6139332, 1.164529, 1, 1, 1, 1, 1,
0.2185901, -0.2537529, 1.766401, 1, 1, 1, 1, 1,
0.2187239, -1.24606, 3.220132, 1, 1, 1, 1, 1,
0.2234791, 1.00158, -1.316747, 1, 1, 1, 1, 1,
0.2247705, 1.312254, 1.40329, 1, 1, 1, 1, 1,
0.2253983, 0.1626063, 2.662715, 1, 1, 1, 1, 1,
0.225954, -1.414027, 3.099324, 1, 1, 1, 1, 1,
0.2313103, 0.1004678, 1.38754, 1, 1, 1, 1, 1,
0.2322075, 0.5930246, 1.394471, 1, 1, 1, 1, 1,
0.2363661, -0.3129782, 2.275518, 0, 0, 1, 1, 1,
0.2367747, -1.55759, 3.208914, 1, 0, 0, 1, 1,
0.2401797, -1.219138, 3.702811, 1, 0, 0, 1, 1,
0.2438613, -1.837048, 3.703632, 1, 0, 0, 1, 1,
0.2523715, 1.291842, -0.3892597, 1, 0, 0, 1, 1,
0.257132, -0.09415343, 1.706099, 1, 0, 0, 1, 1,
0.2604681, -1.643475, 1.809449, 0, 0, 0, 1, 1,
0.2605564, 0.9736505, -0.9047549, 0, 0, 0, 1, 1,
0.2615806, -1.124532, 3.456826, 0, 0, 0, 1, 1,
0.2621043, 0.7675334, 0.09113401, 0, 0, 0, 1, 1,
0.2625015, 1.278266, 1.644731, 0, 0, 0, 1, 1,
0.2641114, 1.287714, -0.3401563, 0, 0, 0, 1, 1,
0.2678948, 0.7002615, -0.8299035, 0, 0, 0, 1, 1,
0.2683353, -1.016049, 3.430406, 1, 1, 1, 1, 1,
0.2720078, -0.2190354, 0.6205872, 1, 1, 1, 1, 1,
0.2735316, -0.1451224, 2.906194, 1, 1, 1, 1, 1,
0.2741916, 0.09781288, 4.081968, 1, 1, 1, 1, 1,
0.2771317, -1.467175, 3.471318, 1, 1, 1, 1, 1,
0.2780457, -1.41368, 3.761161, 1, 1, 1, 1, 1,
0.2786847, 0.008126375, 1.125065, 1, 1, 1, 1, 1,
0.2801044, -1.598046, 3.829643, 1, 1, 1, 1, 1,
0.2855867, 0.01283923, 2.330458, 1, 1, 1, 1, 1,
0.286906, -2.11757, 3.660249, 1, 1, 1, 1, 1,
0.2872073, 0.1406302, 1.842186, 1, 1, 1, 1, 1,
0.2873176, 1.494674, -0.853485, 1, 1, 1, 1, 1,
0.2895087, -0.1298316, 3.002833, 1, 1, 1, 1, 1,
0.2936159, 0.8481153, 2.313589, 1, 1, 1, 1, 1,
0.3069549, -0.4681019, 2.302359, 1, 1, 1, 1, 1,
0.3143632, 1.256474, 1.300193, 0, 0, 1, 1, 1,
0.3143779, 0.8247805, 0.6578481, 1, 0, 0, 1, 1,
0.3150516, 0.5024881, -0.007457842, 1, 0, 0, 1, 1,
0.3200686, -2.311638, 3.864173, 1, 0, 0, 1, 1,
0.3202516, -0.7779493, 2.599682, 1, 0, 0, 1, 1,
0.322787, -1.467564, 2.353766, 1, 0, 0, 1, 1,
0.3244812, 0.02182273, 1.159241, 0, 0, 0, 1, 1,
0.3311087, 0.2607469, 0.6969968, 0, 0, 0, 1, 1,
0.3320844, -0.3766943, 1.983975, 0, 0, 0, 1, 1,
0.3335318, -0.8082384, 4.004557, 0, 0, 0, 1, 1,
0.3355541, 1.400556, 0.001091225, 0, 0, 0, 1, 1,
0.3369929, -1.391998, 3.785708, 0, 0, 0, 1, 1,
0.3428672, -0.6650156, 2.513541, 0, 0, 0, 1, 1,
0.3430477, -0.03665028, 0.5478361, 1, 1, 1, 1, 1,
0.3431457, 0.7752085, 0.04414899, 1, 1, 1, 1, 1,
0.3441336, -2.044148, 2.310056, 1, 1, 1, 1, 1,
0.3455638, -1.428878, 2.62297, 1, 1, 1, 1, 1,
0.3552505, 0.6502259, -0.7803156, 1, 1, 1, 1, 1,
0.3558591, 0.3072917, 0.8696784, 1, 1, 1, 1, 1,
0.3604889, -0.2701, 2.004441, 1, 1, 1, 1, 1,
0.3612356, 0.8667183, 0.397303, 1, 1, 1, 1, 1,
0.3632338, -1.292061, 2.791597, 1, 1, 1, 1, 1,
0.3643042, -1.370684, 2.094503, 1, 1, 1, 1, 1,
0.3650314, -1.835943, 1.794651, 1, 1, 1, 1, 1,
0.3657075, 0.09542426, 0.9730568, 1, 1, 1, 1, 1,
0.3681847, -0.6887224, 2.082306, 1, 1, 1, 1, 1,
0.3686049, 0.4175586, -0.3562499, 1, 1, 1, 1, 1,
0.37996, 1.194258, 1.965834, 1, 1, 1, 1, 1,
0.3907521, -2.157411, 1.393327, 0, 0, 1, 1, 1,
0.393557, -0.6631052, 3.240489, 1, 0, 0, 1, 1,
0.4050026, -0.2114825, 1.702846, 1, 0, 0, 1, 1,
0.4081412, 1.060701, 0.1185494, 1, 0, 0, 1, 1,
0.4164293, 0.4237521, 1.102299, 1, 0, 0, 1, 1,
0.4200509, 0.4172646, 1.08684, 1, 0, 0, 1, 1,
0.4251947, 0.4915514, 0.9341413, 0, 0, 0, 1, 1,
0.4256953, -1.372535, 3.933909, 0, 0, 0, 1, 1,
0.4294177, 1.501859, -0.9611984, 0, 0, 0, 1, 1,
0.4327365, -1.140781, 2.201735, 0, 0, 0, 1, 1,
0.433832, -0.9191533, 3.050567, 0, 0, 0, 1, 1,
0.4343826, -0.1527143, 1.901565, 0, 0, 0, 1, 1,
0.4345599, -0.505905, 2.970966, 0, 0, 0, 1, 1,
0.4375566, -0.2588849, 1.554765, 1, 1, 1, 1, 1,
0.4426958, 0.3411962, 0.08877339, 1, 1, 1, 1, 1,
0.4437423, -0.6793489, 1.791247, 1, 1, 1, 1, 1,
0.4450978, -1.073006, 3.445402, 1, 1, 1, 1, 1,
0.4481696, 0.4742321, 1.418988, 1, 1, 1, 1, 1,
0.4537774, 0.6204001, 1.936471, 1, 1, 1, 1, 1,
0.455645, 1.519041, 1.100108, 1, 1, 1, 1, 1,
0.4575559, -0.9681664, 3.440127, 1, 1, 1, 1, 1,
0.4584611, 1.794653, 0.4477444, 1, 1, 1, 1, 1,
0.4663395, -0.7397493, 2.595736, 1, 1, 1, 1, 1,
0.4668455, -0.8355374, 2.911563, 1, 1, 1, 1, 1,
0.4682349, -0.9123634, 3.056086, 1, 1, 1, 1, 1,
0.4715332, -0.5891392, 1.197857, 1, 1, 1, 1, 1,
0.4761019, -0.4256741, 2.822961, 1, 1, 1, 1, 1,
0.4781432, 1.215059, 1.094095, 1, 1, 1, 1, 1,
0.4789918, 0.5045835, 1.600596, 0, 0, 1, 1, 1,
0.4803142, -1.785114, 2.974232, 1, 0, 0, 1, 1,
0.4831353, 0.1523656, 1.143224, 1, 0, 0, 1, 1,
0.4856275, 0.8870944, 0.2188757, 1, 0, 0, 1, 1,
0.4897659, -0.9001678, 3.917741, 1, 0, 0, 1, 1,
0.4915197, 0.8018205, 1.955244, 1, 0, 0, 1, 1,
0.4955669, -0.1403713, 2.271021, 0, 0, 0, 1, 1,
0.5007786, -0.3658674, 1.534419, 0, 0, 0, 1, 1,
0.5080684, 3.255904, -0.1482971, 0, 0, 0, 1, 1,
0.508294, 0.316265, 1.592235, 0, 0, 0, 1, 1,
0.508944, -1.143692, 5.73409, 0, 0, 0, 1, 1,
0.5130252, -1.498886, 2.259202, 0, 0, 0, 1, 1,
0.5133542, -1.034592, 4.793403, 0, 0, 0, 1, 1,
0.5173497, -0.4561616, 3.381457, 1, 1, 1, 1, 1,
0.5225984, -0.5171685, 1.250601, 1, 1, 1, 1, 1,
0.5274864, -0.1521457, 0.8705645, 1, 1, 1, 1, 1,
0.5276936, -0.9228433, 3.010145, 1, 1, 1, 1, 1,
0.5286749, 0.06668308, 1.375733, 1, 1, 1, 1, 1,
0.5339726, 2.12667, -0.1371505, 1, 1, 1, 1, 1,
0.5428615, 0.04289186, 2.077955, 1, 1, 1, 1, 1,
0.5432413, -1.456063, 1.731633, 1, 1, 1, 1, 1,
0.548833, 1.667472, 0.7539617, 1, 1, 1, 1, 1,
0.5577803, 0.1722835, 1.352931, 1, 1, 1, 1, 1,
0.5607656, 0.8987653, 0.07042228, 1, 1, 1, 1, 1,
0.5643716, 0.2035831, 0.7549661, 1, 1, 1, 1, 1,
0.5691043, -0.1596499, 1.538997, 1, 1, 1, 1, 1,
0.5719815, -1.099986, 3.363649, 1, 1, 1, 1, 1,
0.5767185, 0.9747326, 0.7202817, 1, 1, 1, 1, 1,
0.5781527, 0.2951996, 0.8426866, 0, 0, 1, 1, 1,
0.5802734, 1.000572, 0.6284524, 1, 0, 0, 1, 1,
0.5816534, -1.281718, 2.872369, 1, 0, 0, 1, 1,
0.5823593, -0.5873458, 3.461816, 1, 0, 0, 1, 1,
0.5836787, -2.543571, 4.861056, 1, 0, 0, 1, 1,
0.5837463, 0.5332535, 0.7923124, 1, 0, 0, 1, 1,
0.5863161, 1.287662, -0.4562859, 0, 0, 0, 1, 1,
0.5885466, -0.3793977, 1.208458, 0, 0, 0, 1, 1,
0.6019239, -1.279427, 2.524769, 0, 0, 0, 1, 1,
0.6073873, -0.2754953, 1.12559, 0, 0, 0, 1, 1,
0.6168464, -0.4959593, 1.576805, 0, 0, 0, 1, 1,
0.6185954, 0.3154748, 3.260408, 0, 0, 0, 1, 1,
0.6225417, 0.6806239, 1.340229, 0, 0, 0, 1, 1,
0.6235709, 1.400937, 1.278892, 1, 1, 1, 1, 1,
0.6241934, 0.2413683, 2.017487, 1, 1, 1, 1, 1,
0.6243121, -0.404758, 1.387199, 1, 1, 1, 1, 1,
0.6279455, -0.7550873, 4.724822, 1, 1, 1, 1, 1,
0.6323641, 0.01069106, 0.9169985, 1, 1, 1, 1, 1,
0.6372861, 0.4219282, -0.8162273, 1, 1, 1, 1, 1,
0.6393973, 1.813442, 0.2351941, 1, 1, 1, 1, 1,
0.6415677, 1.94541, 0.7515379, 1, 1, 1, 1, 1,
0.6460363, -2.18807, 3.403207, 1, 1, 1, 1, 1,
0.653598, -0.2334703, 2.45886, 1, 1, 1, 1, 1,
0.6538851, 0.5688908, 0.982151, 1, 1, 1, 1, 1,
0.6554736, 0.6253191, 1.665354, 1, 1, 1, 1, 1,
0.6580504, -1.035306, 1.366158, 1, 1, 1, 1, 1,
0.6608414, -0.5714176, 3.616238, 1, 1, 1, 1, 1,
0.6633653, -1.822285, 1.528851, 1, 1, 1, 1, 1,
0.6641293, 0.6026925, -0.07868981, 0, 0, 1, 1, 1,
0.6644187, -0.06745484, 2.046504, 1, 0, 0, 1, 1,
0.6665638, -0.5535475, 2.674835, 1, 0, 0, 1, 1,
0.668162, -0.7776271, 1.981709, 1, 0, 0, 1, 1,
0.6710697, -0.3829333, 2.500483, 1, 0, 0, 1, 1,
0.6775492, -2.479015, 3.191215, 1, 0, 0, 1, 1,
0.678121, -0.5805699, 0.7713147, 0, 0, 0, 1, 1,
0.6800574, 0.2603389, 0.9352813, 0, 0, 0, 1, 1,
0.686985, 0.2388682, 2.009346, 0, 0, 0, 1, 1,
0.6879286, 1.349864, -0.3706661, 0, 0, 0, 1, 1,
0.6916852, 0.5446039, 0.4084312, 0, 0, 0, 1, 1,
0.6925166, 1.207073, 0.7163153, 0, 0, 0, 1, 1,
0.6935697, -1.271439, 2.832702, 0, 0, 0, 1, 1,
0.6936236, 0.2386986, -0.7002562, 1, 1, 1, 1, 1,
0.6958429, -0.778064, 2.622861, 1, 1, 1, 1, 1,
0.6990231, 0.6257296, 1.352361, 1, 1, 1, 1, 1,
0.7046907, -0.2842139, 2.474963, 1, 1, 1, 1, 1,
0.7078928, 1.321013, 0.129779, 1, 1, 1, 1, 1,
0.7105776, 0.1816213, 2.630365, 1, 1, 1, 1, 1,
0.7129816, 0.351129, 0.7738045, 1, 1, 1, 1, 1,
0.7143973, -0.573552, 1.106949, 1, 1, 1, 1, 1,
0.7156171, 1.423344, 2.411799, 1, 1, 1, 1, 1,
0.7164299, -0.3278847, 1.41757, 1, 1, 1, 1, 1,
0.7215754, -0.6820551, 1.659398, 1, 1, 1, 1, 1,
0.7223176, -0.7809853, 3.802023, 1, 1, 1, 1, 1,
0.7347712, 1.598328, 2.172582, 1, 1, 1, 1, 1,
0.7363162, 1.603851, 1.365709, 1, 1, 1, 1, 1,
0.7384324, 1.746412, 0.1228067, 1, 1, 1, 1, 1,
0.7392356, -0.5769295, 1.245154, 0, 0, 1, 1, 1,
0.7422495, 2.057695, 0.2848074, 1, 0, 0, 1, 1,
0.742799, 0.1062158, 0.8558992, 1, 0, 0, 1, 1,
0.744474, -0.7515326, 1.28069, 1, 0, 0, 1, 1,
0.7446791, 1.034018, 1.391901, 1, 0, 0, 1, 1,
0.7484278, 1.140341, 0.5495759, 1, 0, 0, 1, 1,
0.7501361, 0.6030429, 1.537065, 0, 0, 0, 1, 1,
0.7654112, -1.57568, 3.355307, 0, 0, 0, 1, 1,
0.7665567, 0.8480254, 0.306484, 0, 0, 0, 1, 1,
0.7680755, -1.386504, 1.520746, 0, 0, 0, 1, 1,
0.7687739, -0.06647528, 1.986645, 0, 0, 0, 1, 1,
0.7701694, 0.08524355, 0.8443167, 0, 0, 0, 1, 1,
0.7701853, 0.2814344, 0.1938563, 0, 0, 0, 1, 1,
0.7748551, -0.3348342, 2.269398, 1, 1, 1, 1, 1,
0.7779706, 0.647545, 1.459784, 1, 1, 1, 1, 1,
0.7792736, 1.566837, -0.06830035, 1, 1, 1, 1, 1,
0.7813127, -0.5177602, 2.310724, 1, 1, 1, 1, 1,
0.7866147, 0.2164283, 0.8724212, 1, 1, 1, 1, 1,
0.7867493, 0.2371324, 2.561132, 1, 1, 1, 1, 1,
0.7999195, -0.3055673, 1.314161, 1, 1, 1, 1, 1,
0.8020344, 1.486516, -0.3341038, 1, 1, 1, 1, 1,
0.8056888, -0.7415075, 2.673791, 1, 1, 1, 1, 1,
0.8059267, 1.115423, -0.05455307, 1, 1, 1, 1, 1,
0.8083425, 0.3661433, 0.1840144, 1, 1, 1, 1, 1,
0.8092287, -0.6000914, 2.399621, 1, 1, 1, 1, 1,
0.8130343, 1.957563, -2.252679, 1, 1, 1, 1, 1,
0.831844, -0.7090834, 2.652174, 1, 1, 1, 1, 1,
0.8324795, -1.382044, 2.841546, 1, 1, 1, 1, 1,
0.8330361, -1.569842, 2.812247, 0, 0, 1, 1, 1,
0.8383042, -0.4730617, 1.469779, 1, 0, 0, 1, 1,
0.838987, 1.07517, -1.160198, 1, 0, 0, 1, 1,
0.8407394, -0.1782573, 1.455955, 1, 0, 0, 1, 1,
0.8471028, -0.4899674, 0.7335563, 1, 0, 0, 1, 1,
0.8475939, -0.119123, 2.255272, 1, 0, 0, 1, 1,
0.851256, -0.6740438, 3.378912, 0, 0, 0, 1, 1,
0.8513055, 0.1580426, 1.586554, 0, 0, 0, 1, 1,
0.8539554, -0.7869339, 2.046294, 0, 0, 0, 1, 1,
0.8753617, -0.9909034, 1.047072, 0, 0, 0, 1, 1,
0.8781878, 1.096389, 1.189603, 0, 0, 0, 1, 1,
0.8787934, -0.7682098, 1.990666, 0, 0, 0, 1, 1,
0.8947328, 0.6759884, 0.2818864, 0, 0, 0, 1, 1,
0.8958103, -0.2759813, 1.686083, 1, 1, 1, 1, 1,
0.8991566, 2.3176, -0.5815969, 1, 1, 1, 1, 1,
0.9016814, -1.400936, 3.443828, 1, 1, 1, 1, 1,
0.9031466, -0.7223529, 2.654601, 1, 1, 1, 1, 1,
0.9159515, 1.512144, 0.07516704, 1, 1, 1, 1, 1,
0.9217385, 1.180449, 1.403259, 1, 1, 1, 1, 1,
0.925646, -0.3929721, 2.168704, 1, 1, 1, 1, 1,
0.9373992, 0.6242132, 1.387459, 1, 1, 1, 1, 1,
0.9395524, -0.6113548, 4.06026, 1, 1, 1, 1, 1,
0.9403524, -0.9395768, 1.610842, 1, 1, 1, 1, 1,
0.9436029, -0.09704535, 1.087188, 1, 1, 1, 1, 1,
0.9446656, 0.2213491, 1.239274, 1, 1, 1, 1, 1,
0.9460062, 1.131686, 2.510514, 1, 1, 1, 1, 1,
0.9464974, -0.09522318, 4.040378, 1, 1, 1, 1, 1,
0.9482163, 0.5749219, 0.5857455, 1, 1, 1, 1, 1,
0.9545462, -0.5863373, 1.942513, 0, 0, 1, 1, 1,
0.9564484, 0.2004129, 1.393678, 1, 0, 0, 1, 1,
0.960442, -2.018205, 1.22734, 1, 0, 0, 1, 1,
0.9653622, 0.8207393, 1.540711, 1, 0, 0, 1, 1,
0.9700631, -0.441985, 2.969957, 1, 0, 0, 1, 1,
0.9744337, 0.394052, -0.0445957, 1, 0, 0, 1, 1,
0.9767333, -0.04679339, 3.014307, 0, 0, 0, 1, 1,
0.9865612, 0.0554194, 0.4180014, 0, 0, 0, 1, 1,
0.9884251, -0.3509277, 2.251883, 0, 0, 0, 1, 1,
0.9977644, 0.5092015, 0.5873691, 0, 0, 0, 1, 1,
1.003907, -0.4682696, 1.405225, 0, 0, 0, 1, 1,
1.004088, -0.1635842, 1.172621, 0, 0, 0, 1, 1,
1.007453, 0.1806349, 2.022081, 0, 0, 0, 1, 1,
1.007984, 0.4979644, 2.447117, 1, 1, 1, 1, 1,
1.008139, 0.6465654, 1.354905, 1, 1, 1, 1, 1,
1.009171, -0.4777215, 2.169005, 1, 1, 1, 1, 1,
1.009834, 2.166285, 0.6325755, 1, 1, 1, 1, 1,
1.010245, 0.5428723, 2.398272, 1, 1, 1, 1, 1,
1.01071, 2.03944, 1.299194, 1, 1, 1, 1, 1,
1.011311, -2.141527, 3.826896, 1, 1, 1, 1, 1,
1.011881, 0.1347811, 0.5572152, 1, 1, 1, 1, 1,
1.013869, 0.9787529, 0.9143024, 1, 1, 1, 1, 1,
1.013927, -0.1365918, 1.182047, 1, 1, 1, 1, 1,
1.014211, -0.3087959, 1.061391, 1, 1, 1, 1, 1,
1.015479, 0.6347609, 0.8536652, 1, 1, 1, 1, 1,
1.016729, 0.2122359, 0.1276169, 1, 1, 1, 1, 1,
1.019326, 1.120858, 1.719711, 1, 1, 1, 1, 1,
1.02301, -1.053094, 0.7495477, 1, 1, 1, 1, 1,
1.023158, 0.486506, 1.526567, 0, 0, 1, 1, 1,
1.02713, 0.8269458, -0.01845098, 1, 0, 0, 1, 1,
1.028505, -1.337122, 1.220791, 1, 0, 0, 1, 1,
1.032545, -1.404521, 3.738153, 1, 0, 0, 1, 1,
1.038738, -0.585574, 2.513626, 1, 0, 0, 1, 1,
1.03954, 1.31747, 0.5985969, 1, 0, 0, 1, 1,
1.044836, 0.2346811, 1.918138, 0, 0, 0, 1, 1,
1.062353, -0.24527, 1.848335, 0, 0, 0, 1, 1,
1.06814, 2.041424, 0.6683926, 0, 0, 0, 1, 1,
1.069887, 0.05586941, 0.9744502, 0, 0, 0, 1, 1,
1.070801, -1.078434, 2.378169, 0, 0, 0, 1, 1,
1.072322, 0.3396302, 1.446831, 0, 0, 0, 1, 1,
1.072606, 0.6163217, 1.138504, 0, 0, 0, 1, 1,
1.073841, 0.6504782, 0.8223065, 1, 1, 1, 1, 1,
1.078578, -0.9574572, 2.127958, 1, 1, 1, 1, 1,
1.079354, -0.8464671, 0.7272776, 1, 1, 1, 1, 1,
1.082258, 1.909103, 0.9358722, 1, 1, 1, 1, 1,
1.082991, 0.6389025, -0.03978604, 1, 1, 1, 1, 1,
1.087207, -0.3805091, 1.478141, 1, 1, 1, 1, 1,
1.089867, 0.01188622, 2.639145, 1, 1, 1, 1, 1,
1.100562, -0.4687869, 1.810049, 1, 1, 1, 1, 1,
1.100902, -0.3002726, 0.9677204, 1, 1, 1, 1, 1,
1.102058, 0.1659759, 0.7327346, 1, 1, 1, 1, 1,
1.104076, -0.6086553, 1.319716, 1, 1, 1, 1, 1,
1.104519, 0.6483437, 1.343113, 1, 1, 1, 1, 1,
1.120201, -0.7339631, 1.747729, 1, 1, 1, 1, 1,
1.120967, -0.01340352, 0.9987907, 1, 1, 1, 1, 1,
1.123323, -1.40506, 4.666512, 1, 1, 1, 1, 1,
1.129923, 0.3679839, 1.214393, 0, 0, 1, 1, 1,
1.132524, -0.2875223, 2.228419, 1, 0, 0, 1, 1,
1.139193, -0.9851872, 3.22721, 1, 0, 0, 1, 1,
1.141192, 0.3574017, 0.4381224, 1, 0, 0, 1, 1,
1.159665, -0.1815996, 2.912244, 1, 0, 0, 1, 1,
1.162804, 0.07922206, 2.665547, 1, 0, 0, 1, 1,
1.173377, -0.607965, 2.517664, 0, 0, 0, 1, 1,
1.17487, 2.496208, 0.9004004, 0, 0, 0, 1, 1,
1.176152, -0.2821853, 2.226158, 0, 0, 0, 1, 1,
1.178619, -0.1909698, 2.395586, 0, 0, 0, 1, 1,
1.185343, -1.102142, 0.9453866, 0, 0, 0, 1, 1,
1.195108, 0.5879407, 2.500527, 0, 0, 0, 1, 1,
1.202189, -0.3750344, 0.617943, 0, 0, 0, 1, 1,
1.234606, 0.2459356, -0.6718246, 1, 1, 1, 1, 1,
1.240311, 1.529335, 1.704499, 1, 1, 1, 1, 1,
1.24937, -0.06742521, 0.654803, 1, 1, 1, 1, 1,
1.259894, 2.049688, -0.3472745, 1, 1, 1, 1, 1,
1.27336, 0.5634124, 2.774734, 1, 1, 1, 1, 1,
1.273859, -0.199183, 1.845416, 1, 1, 1, 1, 1,
1.276718, 0.516924, 1.25794, 1, 1, 1, 1, 1,
1.285991, -0.6129748, 1.102966, 1, 1, 1, 1, 1,
1.286743, -0.296584, 1.370443, 1, 1, 1, 1, 1,
1.293231, 1.089901, -1.060648, 1, 1, 1, 1, 1,
1.314022, -0.4469588, 0.4353594, 1, 1, 1, 1, 1,
1.316283, -0.6497106, 0.6315125, 1, 1, 1, 1, 1,
1.318375, -0.6688379, 1.656456, 1, 1, 1, 1, 1,
1.324883, -1.864423, 1.518463, 1, 1, 1, 1, 1,
1.335817, -0.2042691, 2.767545, 1, 1, 1, 1, 1,
1.339468, 1.085966, 1.838588, 0, 0, 1, 1, 1,
1.343822, 0.1669871, 0.7718304, 1, 0, 0, 1, 1,
1.347795, -0.1681075, 2.041611, 1, 0, 0, 1, 1,
1.414172, -0.3058851, 2.10895, 1, 0, 0, 1, 1,
1.417472, -0.1762209, 2.148043, 1, 0, 0, 1, 1,
1.423782, -0.1139221, 3.100944, 1, 0, 0, 1, 1,
1.426259, -0.7859988, 1.967087, 0, 0, 0, 1, 1,
1.426809, 0.548668, 1.55888, 0, 0, 0, 1, 1,
1.430627, -0.2746714, 1.686907, 0, 0, 0, 1, 1,
1.438873, 1.729732, 1.882678, 0, 0, 0, 1, 1,
1.440435, 1.415353, 1.410189, 0, 0, 0, 1, 1,
1.450665, 0.691039, 1.93788, 0, 0, 0, 1, 1,
1.466045, -1.054172, 2.303121, 0, 0, 0, 1, 1,
1.470839, -0.2683482, 2.386028, 1, 1, 1, 1, 1,
1.477978, 0.7090627, 2.462907, 1, 1, 1, 1, 1,
1.480821, -1.019273, 2.320967, 1, 1, 1, 1, 1,
1.481741, 0.05363342, 1.505022, 1, 1, 1, 1, 1,
1.487803, -0.894011, 0.345436, 1, 1, 1, 1, 1,
1.488052, 1.276391, 0.5849496, 1, 1, 1, 1, 1,
1.489275, -1.942819, 3.365879, 1, 1, 1, 1, 1,
1.505096, 1.91171, 1.793142, 1, 1, 1, 1, 1,
1.509339, 0.04790623, 0.5236286, 1, 1, 1, 1, 1,
1.522661, 1.071027, 2.200498, 1, 1, 1, 1, 1,
1.550242, -0.1071694, 1.703981, 1, 1, 1, 1, 1,
1.577238, -0.6938521, 0.2117254, 1, 1, 1, 1, 1,
1.581, -0.776875, 2.739875, 1, 1, 1, 1, 1,
1.584485, -0.7858774, 2.729245, 1, 1, 1, 1, 1,
1.590699, 0.7261269, 3.583644, 1, 1, 1, 1, 1,
1.600103, -0.7260402, 3.446555, 0, 0, 1, 1, 1,
1.616284, -1.157695, -0.04473822, 1, 0, 0, 1, 1,
1.619104, -1.009936, 0.4104368, 1, 0, 0, 1, 1,
1.648496, 1.129076, 0.1945616, 1, 0, 0, 1, 1,
1.653985, -0.8707539, 3.698663, 1, 0, 0, 1, 1,
1.681673, 1.525358, 0.3020094, 1, 0, 0, 1, 1,
1.695493, 0.3275101, 1.411938, 0, 0, 0, 1, 1,
1.710379, -3.036806, 2.216053, 0, 0, 0, 1, 1,
1.718033, -0.3433836, -0.2325369, 0, 0, 0, 1, 1,
1.729626, -0.1753313, 1.047181, 0, 0, 0, 1, 1,
1.731547, -0.3566937, 1.308696, 0, 0, 0, 1, 1,
1.73407, 0.02888945, 2.272375, 0, 0, 0, 1, 1,
1.734619, 1.611511, 1.558025, 0, 0, 0, 1, 1,
1.739003, -2.200485, 1.383797, 1, 1, 1, 1, 1,
1.761762, -0.0704921, 0.7039986, 1, 1, 1, 1, 1,
1.779077, -1.176381, 1.391275, 1, 1, 1, 1, 1,
1.795033, -0.2749278, 2.409732, 1, 1, 1, 1, 1,
1.800137, -1.281411, 3.258748, 1, 1, 1, 1, 1,
1.88767, 0.4620878, 2.112409, 1, 1, 1, 1, 1,
1.900731, -1.203109, 1.34514, 1, 1, 1, 1, 1,
1.908063, 1.450106, -1.360712, 1, 1, 1, 1, 1,
1.91914, 1.228681, -0.6489977, 1, 1, 1, 1, 1,
1.926672, -1.316282, 2.618421, 1, 1, 1, 1, 1,
1.930369, -0.9983138, 1.703665, 1, 1, 1, 1, 1,
2.01913, 0.603915, 0.5451093, 1, 1, 1, 1, 1,
2.035153, -0.4496624, 1.18359, 1, 1, 1, 1, 1,
2.036192, 1.125439, 1.185411, 1, 1, 1, 1, 1,
2.048112, -0.4283191, 2.171661, 1, 1, 1, 1, 1,
2.073835, -1.448048, 3.195057, 0, 0, 1, 1, 1,
2.094352, -0.1008259, 1.50493, 1, 0, 0, 1, 1,
2.096121, -1.434712, 0.9191121, 1, 0, 0, 1, 1,
2.134358, -0.4852855, 2.550395, 1, 0, 0, 1, 1,
2.137428, 0.5228363, -0.7410195, 1, 0, 0, 1, 1,
2.172289, 0.9019998, 0.5198389, 1, 0, 0, 1, 1,
2.18169, -0.7543105, 2.059989, 0, 0, 0, 1, 1,
2.184721, -0.3143031, 1.106958, 0, 0, 0, 1, 1,
2.212662, -0.2222069, 2.888528, 0, 0, 0, 1, 1,
2.245381, -0.3412316, 0.835586, 0, 0, 0, 1, 1,
2.256454, -0.1849885, 1.843117, 0, 0, 0, 1, 1,
2.276732, -2.452967, 4.3905, 0, 0, 0, 1, 1,
2.339785, 0.2753622, 2.285112, 0, 0, 0, 1, 1,
2.367251, -0.0931064, 0.8639534, 1, 1, 1, 1, 1,
2.370493, 0.2035022, -0.2906313, 1, 1, 1, 1, 1,
2.413382, 0.7831552, 0.2752704, 1, 1, 1, 1, 1,
2.427168, -0.8241088, 3.162248, 1, 1, 1, 1, 1,
2.440915, 1.65717, 2.102533, 1, 1, 1, 1, 1,
2.720313, 1.720132, 0.888069, 1, 1, 1, 1, 1,
3.081433, -0.7019482, 0.2101147, 1, 1, 1, 1, 1
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
var radius = 9.562323;
var distance = 33.58725;
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
mvMatrix.translate( -0.1909926, -0.109549, -0.1583152 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.58725);
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
