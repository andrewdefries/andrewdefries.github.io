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
-3.092741, -0.2692369, -2.561663, 1, 0, 0, 1,
-2.812454, -1.297133, -0.8398058, 1, 0.007843138, 0, 1,
-2.70607, -1.162332, -1.109288, 1, 0.01176471, 0, 1,
-2.698684, -1.104887, -1.298344, 1, 0.01960784, 0, 1,
-2.656373, -1.190331, -1.55471, 1, 0.02352941, 0, 1,
-2.49891, 0.6063464, -0.4403544, 1, 0.03137255, 0, 1,
-2.465984, -1.123501, -2.893032, 1, 0.03529412, 0, 1,
-2.429421, -1.14797, -2.34631, 1, 0.04313726, 0, 1,
-2.332081, -0.546297, -2.546071, 1, 0.04705882, 0, 1,
-2.276351, 0.9535421, -2.158098, 1, 0.05490196, 0, 1,
-2.215223, 0.03892627, -1.530216, 1, 0.05882353, 0, 1,
-2.198676, 1.622007, 2.51248, 1, 0.06666667, 0, 1,
-2.161831, 2.177755, -1.0843, 1, 0.07058824, 0, 1,
-2.156491, 0.1504904, -3.060658, 1, 0.07843138, 0, 1,
-2.143843, 0.5773957, -0.1438613, 1, 0.08235294, 0, 1,
-2.071603, -0.06395094, -2.634898, 1, 0.09019608, 0, 1,
-2.025243, 0.1918868, -0.716961, 1, 0.09411765, 0, 1,
-2.004221, -0.2254045, -2.416238, 1, 0.1019608, 0, 1,
-1.99792, -0.498864, -1.076392, 1, 0.1098039, 0, 1,
-1.993953, -1.554801, -2.65466, 1, 0.1137255, 0, 1,
-1.985655, -0.297128, -2.667603, 1, 0.1215686, 0, 1,
-1.944321, -2.113064, -0.2843843, 1, 0.1254902, 0, 1,
-1.917929, 0.9361436, -0.6647455, 1, 0.1333333, 0, 1,
-1.89759, 1.22312, -1.779822, 1, 0.1372549, 0, 1,
-1.896134, -0.5277547, -0.918871, 1, 0.145098, 0, 1,
-1.887231, 0.9135939, -0.8071911, 1, 0.1490196, 0, 1,
-1.872519, -2.185071, -2.087821, 1, 0.1568628, 0, 1,
-1.835753, 0.09032359, -1.472017, 1, 0.1607843, 0, 1,
-1.832983, -0.6757504, -1.274746, 1, 0.1686275, 0, 1,
-1.7909, 0.5252651, -1.750844, 1, 0.172549, 0, 1,
-1.786827, -0.146196, -1.618724, 1, 0.1803922, 0, 1,
-1.785357, 1.519483, -0.8341067, 1, 0.1843137, 0, 1,
-1.74964, 0.01217344, -1.841282, 1, 0.1921569, 0, 1,
-1.743445, -0.9042397, -2.328349, 1, 0.1960784, 0, 1,
-1.723381, 1.414203, -0.4838105, 1, 0.2039216, 0, 1,
-1.707542, -1.188499, -1.864511, 1, 0.2117647, 0, 1,
-1.706152, 1.279056, 0.4104769, 1, 0.2156863, 0, 1,
-1.70557, -0.2266413, -1.719359, 1, 0.2235294, 0, 1,
-1.681658, 1.316818, -2.043029, 1, 0.227451, 0, 1,
-1.673049, -1.114915, -4.266285, 1, 0.2352941, 0, 1,
-1.666374, 1.119416, -1.51995, 1, 0.2392157, 0, 1,
-1.626471, 2.00045, -1.352754, 1, 0.2470588, 0, 1,
-1.616435, 0.001483943, -0.5311127, 1, 0.2509804, 0, 1,
-1.605473, 0.4358366, -0.723467, 1, 0.2588235, 0, 1,
-1.602381, -0.008423868, -2.212013, 1, 0.2627451, 0, 1,
-1.596177, -0.4713401, -2.291674, 1, 0.2705882, 0, 1,
-1.596083, 0.5637214, -0.6645289, 1, 0.2745098, 0, 1,
-1.59545, 0.953443, -1.706403, 1, 0.282353, 0, 1,
-1.591781, 0.4594727, -2.101711, 1, 0.2862745, 0, 1,
-1.588196, 1.347831, -0.07172086, 1, 0.2941177, 0, 1,
-1.587538, 0.147253, -1.043181, 1, 0.3019608, 0, 1,
-1.585334, -2.067129, -2.617955, 1, 0.3058824, 0, 1,
-1.577427, 1.067031, -1.681037, 1, 0.3137255, 0, 1,
-1.564826, 1.516006, -0.2513438, 1, 0.3176471, 0, 1,
-1.53971, 0.1486789, -2.635215, 1, 0.3254902, 0, 1,
-1.527051, -0.3677953, -1.234632, 1, 0.3294118, 0, 1,
-1.522427, 0.301332, -1.280138, 1, 0.3372549, 0, 1,
-1.513685, -0.9691548, -1.731495, 1, 0.3411765, 0, 1,
-1.503453, -1.588698, -4.017589, 1, 0.3490196, 0, 1,
-1.489319, -0.9836838, -2.433506, 1, 0.3529412, 0, 1,
-1.477617, -0.7312982, -1.750145, 1, 0.3607843, 0, 1,
-1.469528, -0.06509753, -1.021267, 1, 0.3647059, 0, 1,
-1.469287, 0.406047, -1.668072, 1, 0.372549, 0, 1,
-1.467366, 2.200478, -1.416688, 1, 0.3764706, 0, 1,
-1.446548, 0.3647496, -2.171855, 1, 0.3843137, 0, 1,
-1.434897, 0.5145464, -1.713053, 1, 0.3882353, 0, 1,
-1.429386, 0.1774731, 0.1625008, 1, 0.3960784, 0, 1,
-1.424044, 0.6562049, 0.9375495, 1, 0.4039216, 0, 1,
-1.42009, 1.589732, -1.328957, 1, 0.4078431, 0, 1,
-1.415921, 0.7719793, -1.053607, 1, 0.4156863, 0, 1,
-1.404635, -1.067818, -1.995192, 1, 0.4196078, 0, 1,
-1.393086, -0.7474023, -1.981227, 1, 0.427451, 0, 1,
-1.393043, 0.7421712, -1.930139, 1, 0.4313726, 0, 1,
-1.378433, 1.894527, -1.136853, 1, 0.4392157, 0, 1,
-1.370461, -1.56708, -2.081964, 1, 0.4431373, 0, 1,
-1.365188, -0.5720942, -2.950372, 1, 0.4509804, 0, 1,
-1.357074, 1.472914, -0.78216, 1, 0.454902, 0, 1,
-1.340957, -0.8580425, -2.888496, 1, 0.4627451, 0, 1,
-1.337933, -0.3608725, -1.435482, 1, 0.4666667, 0, 1,
-1.335334, -1.098179, -0.7035107, 1, 0.4745098, 0, 1,
-1.324949, 1.083016, -1.372737, 1, 0.4784314, 0, 1,
-1.324601, 0.1583052, -1.139371, 1, 0.4862745, 0, 1,
-1.313959, 0.6388748, 0.9855065, 1, 0.4901961, 0, 1,
-1.295908, 0.3738166, -1.961279, 1, 0.4980392, 0, 1,
-1.295141, -0.1800078, -2.843475, 1, 0.5058824, 0, 1,
-1.294068, 1.048697, -0.05573194, 1, 0.509804, 0, 1,
-1.283388, 0.2235128, -2.46265, 1, 0.5176471, 0, 1,
-1.283152, 1.63195, -3.045848, 1, 0.5215687, 0, 1,
-1.27517, -1.123068, -1.005948, 1, 0.5294118, 0, 1,
-1.274639, 0.4565303, -1.727734, 1, 0.5333334, 0, 1,
-1.25363, 2.115129, -1.447888, 1, 0.5411765, 0, 1,
-1.251688, 0.1814396, -0.8452541, 1, 0.5450981, 0, 1,
-1.246162, -0.4625354, -1.565781, 1, 0.5529412, 0, 1,
-1.243633, -0.6454849, -2.288612, 1, 0.5568628, 0, 1,
-1.24308, 0.3593523, -2.970431, 1, 0.5647059, 0, 1,
-1.242807, 1.102769, 0.2759633, 1, 0.5686275, 0, 1,
-1.224705, 0.9543159, -0.6894166, 1, 0.5764706, 0, 1,
-1.223178, 0.3239928, -0.213279, 1, 0.5803922, 0, 1,
-1.2178, -1.116923, -1.698559, 1, 0.5882353, 0, 1,
-1.21473, 0.6690704, -1.497791, 1, 0.5921569, 0, 1,
-1.210947, -0.1100979, -1.442341, 1, 0.6, 0, 1,
-1.208315, 0.1708309, -1.180278, 1, 0.6078432, 0, 1,
-1.20729, -1.005905, -4.298705, 1, 0.6117647, 0, 1,
-1.200791, -1.486143, -2.870097, 1, 0.6196079, 0, 1,
-1.197169, 0.4348156, -0.5949966, 1, 0.6235294, 0, 1,
-1.195992, -0.7213623, -3.786498, 1, 0.6313726, 0, 1,
-1.193835, -2.280965, -2.424329, 1, 0.6352941, 0, 1,
-1.192698, 1.578501, 0.1358773, 1, 0.6431373, 0, 1,
-1.183606, -0.8840051, -4.447997, 1, 0.6470588, 0, 1,
-1.182703, -1.123855, -2.629206, 1, 0.654902, 0, 1,
-1.180983, 0.3981213, -1.292256, 1, 0.6588235, 0, 1,
-1.176057, 1.361466, 0.9730526, 1, 0.6666667, 0, 1,
-1.171566, 0.7191868, -0.5370268, 1, 0.6705883, 0, 1,
-1.168302, 0.1667936, -1.590306, 1, 0.6784314, 0, 1,
-1.162707, -0.7044498, -0.6285741, 1, 0.682353, 0, 1,
-1.130268, -0.06374278, -1.699677, 1, 0.6901961, 0, 1,
-1.124707, 0.2742872, -2.435393, 1, 0.6941177, 0, 1,
-1.120551, 1.006316, -2.923124, 1, 0.7019608, 0, 1,
-1.114184, 0.1825487, -1.297716, 1, 0.7098039, 0, 1,
-1.113463, 1.926565, -2.637734, 1, 0.7137255, 0, 1,
-1.104972, -0.6191767, -2.645558, 1, 0.7215686, 0, 1,
-1.099199, 1.333587, -0.008726805, 1, 0.7254902, 0, 1,
-1.095011, 0.3514132, -0.8150549, 1, 0.7333333, 0, 1,
-1.09489, 1.596686, -0.6324433, 1, 0.7372549, 0, 1,
-1.094331, 0.6820365, 0.7923257, 1, 0.7450981, 0, 1,
-1.089525, -0.6590571, -2.127121, 1, 0.7490196, 0, 1,
-1.089106, 0.09554587, -2.263654, 1, 0.7568628, 0, 1,
-1.078551, -1.404411, -2.761147, 1, 0.7607843, 0, 1,
-1.072089, -0.300287, -0.6038128, 1, 0.7686275, 0, 1,
-1.066365, 2.203857, -1.385394, 1, 0.772549, 0, 1,
-1.065007, -1.322256, -4.121149, 1, 0.7803922, 0, 1,
-1.058037, -0.4352687, -2.503676, 1, 0.7843137, 0, 1,
-1.045627, 0.2409096, -1.021147, 1, 0.7921569, 0, 1,
-1.04371, 0.05647416, -1.153943, 1, 0.7960784, 0, 1,
-1.041504, -0.8090971, -2.243257, 1, 0.8039216, 0, 1,
-1.03979, -1.703169, -5.114089, 1, 0.8117647, 0, 1,
-1.039496, -0.4296994, -2.456103, 1, 0.8156863, 0, 1,
-1.02742, 0.2504375, -0.2506714, 1, 0.8235294, 0, 1,
-1.026014, 0.1425221, -2.588212, 1, 0.827451, 0, 1,
-1.024564, 0.8965127, -0.6596147, 1, 0.8352941, 0, 1,
-1.019425, -1.703543, -3.905056, 1, 0.8392157, 0, 1,
-1.018987, -0.9281516, -3.634744, 1, 0.8470588, 0, 1,
-1.015046, 0.1353833, -2.520583, 1, 0.8509804, 0, 1,
-1.012337, 1.337022, -0.3296708, 1, 0.8588235, 0, 1,
-1.009939, -0.09536237, -4.051374, 1, 0.8627451, 0, 1,
-1.003739, -0.3838919, -2.261965, 1, 0.8705882, 0, 1,
-1.003074, 1.217835, -0.9698043, 1, 0.8745098, 0, 1,
-0.9998737, 0.8095817, -1.364658, 1, 0.8823529, 0, 1,
-0.9991239, 0.7107335, -1.604094, 1, 0.8862745, 0, 1,
-0.9989226, -0.6896489, -2.447097, 1, 0.8941177, 0, 1,
-0.9983198, 1.166166, -0.7957211, 1, 0.8980392, 0, 1,
-0.9979599, -0.2989885, -1.270222, 1, 0.9058824, 0, 1,
-0.9886971, -1.39799, -4.470499, 1, 0.9137255, 0, 1,
-0.9807659, 0.4477527, -2.84333, 1, 0.9176471, 0, 1,
-0.977844, -0.5243776, -2.040995, 1, 0.9254902, 0, 1,
-0.9776078, -0.4832198, -1.267057, 1, 0.9294118, 0, 1,
-0.9760695, -0.3302786, -3.447068, 1, 0.9372549, 0, 1,
-0.9698874, -0.3644053, -1.647966, 1, 0.9411765, 0, 1,
-0.968899, -0.05702486, -0.8015875, 1, 0.9490196, 0, 1,
-0.9675561, -0.4483643, -1.391138, 1, 0.9529412, 0, 1,
-0.9653092, 0.4606431, -0.9410725, 1, 0.9607843, 0, 1,
-0.9638563, -1.295534, -0.8208429, 1, 0.9647059, 0, 1,
-0.9630023, -0.007647295, 0.2615727, 1, 0.972549, 0, 1,
-0.9512707, 0.1869098, -0.9168879, 1, 0.9764706, 0, 1,
-0.949714, -0.9697562, -2.76123, 1, 0.9843137, 0, 1,
-0.9451177, -0.5472782, -2.484339, 1, 0.9882353, 0, 1,
-0.9451037, 0.6524218, -0.5120911, 1, 0.9960784, 0, 1,
-0.9427291, 1.006799, -0.008667204, 0.9960784, 1, 0, 1,
-0.9417843, -1.90661, -2.685453, 0.9921569, 1, 0, 1,
-0.9386514, 0.4558228, -1.907762, 0.9843137, 1, 0, 1,
-0.9365886, 0.06967577, 0.5776996, 0.9803922, 1, 0, 1,
-0.9360861, -1.43644, -3.559555, 0.972549, 1, 0, 1,
-0.9278039, -1.292832, -3.245312, 0.9686275, 1, 0, 1,
-0.9276686, -0.5648291, -0.9839767, 0.9607843, 1, 0, 1,
-0.9257897, 1.023897, -1.318642, 0.9568627, 1, 0, 1,
-0.9172848, 0.2508304, -1.021475, 0.9490196, 1, 0, 1,
-0.9166489, -1.884983, -3.656611, 0.945098, 1, 0, 1,
-0.9149392, -0.5502052, -1.853272, 0.9372549, 1, 0, 1,
-0.914458, 1.85905, -0.2278058, 0.9333333, 1, 0, 1,
-0.9053411, -0.5255618, -1.558598, 0.9254902, 1, 0, 1,
-0.903924, 1.19198, -0.3998489, 0.9215686, 1, 0, 1,
-0.8990242, -0.02400581, -0.498922, 0.9137255, 1, 0, 1,
-0.8953462, -0.1915326, -0.8594874, 0.9098039, 1, 0, 1,
-0.8926589, -0.9976798, -1.386247, 0.9019608, 1, 0, 1,
-0.8819261, -0.4208154, -1.024262, 0.8941177, 1, 0, 1,
-0.8800433, -1.255249, -2.74776, 0.8901961, 1, 0, 1,
-0.8728014, -0.9310271, -0.9810435, 0.8823529, 1, 0, 1,
-0.8699641, 0.4372996, -1.933745, 0.8784314, 1, 0, 1,
-0.8646156, 0.2138369, -2.164285, 0.8705882, 1, 0, 1,
-0.8588783, -1.677502, -2.217406, 0.8666667, 1, 0, 1,
-0.8583626, 2.044675, -0.8769019, 0.8588235, 1, 0, 1,
-0.857232, 0.7917317, -0.7806286, 0.854902, 1, 0, 1,
-0.8518968, -0.4387935, -2.177243, 0.8470588, 1, 0, 1,
-0.8508711, 1.692122, 1.237461, 0.8431373, 1, 0, 1,
-0.843879, -0.8222182, -4.326016, 0.8352941, 1, 0, 1,
-0.8415586, 1.274887, 0.5304933, 0.8313726, 1, 0, 1,
-0.8366848, -0.7889699, -1.333843, 0.8235294, 1, 0, 1,
-0.8358209, -0.7398087, -2.684227, 0.8196079, 1, 0, 1,
-0.8348938, -0.9987447, -2.119323, 0.8117647, 1, 0, 1,
-0.8334727, 2.027749, -0.8289708, 0.8078431, 1, 0, 1,
-0.828906, 0.1293799, -1.319547, 0.8, 1, 0, 1,
-0.8254368, -1.124734, -3.526149, 0.7921569, 1, 0, 1,
-0.824972, -1.053103, -2.469339, 0.7882353, 1, 0, 1,
-0.8247414, 0.4812841, -1.813453, 0.7803922, 1, 0, 1,
-0.822127, -1.74409, -5.648313, 0.7764706, 1, 0, 1,
-0.8212415, -0.4546776, -1.862565, 0.7686275, 1, 0, 1,
-0.8171058, 1.428534, -1.242862, 0.7647059, 1, 0, 1,
-0.8108066, -0.7303514, -2.550848, 0.7568628, 1, 0, 1,
-0.8089537, 0.1163706, -2.904401, 0.7529412, 1, 0, 1,
-0.8050772, -0.2340022, -2.109361, 0.7450981, 1, 0, 1,
-0.8024762, 0.3415478, -2.353834, 0.7411765, 1, 0, 1,
-0.7973138, -1.112774, -2.658485, 0.7333333, 1, 0, 1,
-0.7948586, -0.4737987, -1.860929, 0.7294118, 1, 0, 1,
-0.7932131, 0.9040231, -1.039177, 0.7215686, 1, 0, 1,
-0.792189, 1.280978, -0.7717069, 0.7176471, 1, 0, 1,
-0.78044, -0.4229873, -3.053947, 0.7098039, 1, 0, 1,
-0.7800635, 1.88118, -0.2121108, 0.7058824, 1, 0, 1,
-0.7798246, -0.9817203, -2.938124, 0.6980392, 1, 0, 1,
-0.7765437, -1.112163, -2.28793, 0.6901961, 1, 0, 1,
-0.7758914, -0.5716679, -1.804412, 0.6862745, 1, 0, 1,
-0.7698271, -0.07481709, -2.053496, 0.6784314, 1, 0, 1,
-0.7666237, -0.05227848, -0.6504561, 0.6745098, 1, 0, 1,
-0.7655517, -0.7143764, -2.29004, 0.6666667, 1, 0, 1,
-0.7631245, -0.9038339, -3.281612, 0.6627451, 1, 0, 1,
-0.7625439, 1.575835, -1.800219, 0.654902, 1, 0, 1,
-0.7615674, 0.03784368, -0.9487032, 0.6509804, 1, 0, 1,
-0.7605573, -0.81043, -1.948695, 0.6431373, 1, 0, 1,
-0.7576486, -0.5769789, -3.35445, 0.6392157, 1, 0, 1,
-0.7535804, 1.769305, -1.255478, 0.6313726, 1, 0, 1,
-0.7470474, 0.3701164, -0.1870211, 0.627451, 1, 0, 1,
-0.737348, -0.9884626, -3.039811, 0.6196079, 1, 0, 1,
-0.7367069, -1.390411, -2.852454, 0.6156863, 1, 0, 1,
-0.7343963, 0.2322851, -0.5915971, 0.6078432, 1, 0, 1,
-0.7304993, 0.1999403, -1.033394, 0.6039216, 1, 0, 1,
-0.7279839, 0.1438058, 1.551515, 0.5960785, 1, 0, 1,
-0.7274408, 1.781873, 0.2191535, 0.5882353, 1, 0, 1,
-0.7059624, -1.154474, -1.691363, 0.5843138, 1, 0, 1,
-0.7046798, -0.6662879, -3.03229, 0.5764706, 1, 0, 1,
-0.7025983, -0.4770206, -2.890767, 0.572549, 1, 0, 1,
-0.7008554, 1.337034, -0.66127, 0.5647059, 1, 0, 1,
-0.6905902, -0.1535773, -2.989433, 0.5607843, 1, 0, 1,
-0.6856462, 0.3547717, -2.14276, 0.5529412, 1, 0, 1,
-0.6809522, 0.2144408, 0.1710285, 0.5490196, 1, 0, 1,
-0.6762489, 1.629813, 0.2713666, 0.5411765, 1, 0, 1,
-0.6744186, 0.9448879, -1.017624, 0.5372549, 1, 0, 1,
-0.6566752, 0.6715267, -1.218341, 0.5294118, 1, 0, 1,
-0.6511481, -0.6991513, -2.582556, 0.5254902, 1, 0, 1,
-0.6438472, -0.8192705, -3.288526, 0.5176471, 1, 0, 1,
-0.642047, 1.288919, -0.1648004, 0.5137255, 1, 0, 1,
-0.6378459, 0.7590997, -0.452237, 0.5058824, 1, 0, 1,
-0.635184, -0.264879, -2.355301, 0.5019608, 1, 0, 1,
-0.6333367, 0.1833136, -3.44194, 0.4941176, 1, 0, 1,
-0.6290962, 1.797571, -0.5419135, 0.4862745, 1, 0, 1,
-0.6279027, 1.018699, -1.551573, 0.4823529, 1, 0, 1,
-0.6245469, 0.8042474, 2.355569, 0.4745098, 1, 0, 1,
-0.6226097, 0.6120651, -0.6750197, 0.4705882, 1, 0, 1,
-0.6213725, -0.07340596, -0.9969218, 0.4627451, 1, 0, 1,
-0.6190619, 0.8820987, 0.3141173, 0.4588235, 1, 0, 1,
-0.6125515, 0.3323914, -1.950165, 0.4509804, 1, 0, 1,
-0.6120136, -0.6145259, -1.5458, 0.4470588, 1, 0, 1,
-0.6115983, 2.621672, 0.3190568, 0.4392157, 1, 0, 1,
-0.6074077, 0.1757194, -1.832766, 0.4352941, 1, 0, 1,
-0.6057456, -0.06114119, -1.384436, 0.427451, 1, 0, 1,
-0.6042738, -0.4854368, -1.459288, 0.4235294, 1, 0, 1,
-0.602591, -0.35329, -2.500743, 0.4156863, 1, 0, 1,
-0.6017768, -1.173464, -3.411382, 0.4117647, 1, 0, 1,
-0.5957586, -0.6999291, -2.16993, 0.4039216, 1, 0, 1,
-0.5952803, 2.091702, 0.006003856, 0.3960784, 1, 0, 1,
-0.5923991, -0.2477061, -1.690269, 0.3921569, 1, 0, 1,
-0.588818, -0.1684608, -0.8186751, 0.3843137, 1, 0, 1,
-0.5884023, -0.04184397, -1.903261, 0.3803922, 1, 0, 1,
-0.5868476, -0.9796227, -3.602131, 0.372549, 1, 0, 1,
-0.5831848, 0.5702366, -1.492419, 0.3686275, 1, 0, 1,
-0.5827895, 0.7503572, -0.6395884, 0.3607843, 1, 0, 1,
-0.58134, -0.2174972, -2.746177, 0.3568628, 1, 0, 1,
-0.5774347, -1.228345, -2.970782, 0.3490196, 1, 0, 1,
-0.5761073, -0.07205907, -3.545547, 0.345098, 1, 0, 1,
-0.5743782, -0.2522992, -0.9173616, 0.3372549, 1, 0, 1,
-0.5696502, 0.790578, -1.115919, 0.3333333, 1, 0, 1,
-0.5648873, -0.6078607, -2.316884, 0.3254902, 1, 0, 1,
-0.5618164, 1.68067, -2.050824, 0.3215686, 1, 0, 1,
-0.5593799, -0.8225915, -1.568981, 0.3137255, 1, 0, 1,
-0.5543693, -0.3564254, -2.321373, 0.3098039, 1, 0, 1,
-0.5481065, -0.06143493, -0.1532822, 0.3019608, 1, 0, 1,
-0.5464739, -0.01350642, -2.019233, 0.2941177, 1, 0, 1,
-0.5464005, 0.4102769, -1.553209, 0.2901961, 1, 0, 1,
-0.5380666, -0.3098055, -1.307574, 0.282353, 1, 0, 1,
-0.5354877, 0.5834634, -0.0785618, 0.2784314, 1, 0, 1,
-0.5346243, -0.575184, -3.498831, 0.2705882, 1, 0, 1,
-0.5324095, 1.810788, 0.2419351, 0.2666667, 1, 0, 1,
-0.5307302, 1.002661, -1.696817, 0.2588235, 1, 0, 1,
-0.5267006, -0.2086695, -2.629752, 0.254902, 1, 0, 1,
-0.5265947, 0.04444585, -1.119828, 0.2470588, 1, 0, 1,
-0.5232215, -0.3477153, -2.150234, 0.2431373, 1, 0, 1,
-0.5218523, -1.211007, -3.631124, 0.2352941, 1, 0, 1,
-0.5127022, 0.197965, -0.5925371, 0.2313726, 1, 0, 1,
-0.5122106, -2.535406, -4.440613, 0.2235294, 1, 0, 1,
-0.5110518, -0.5863258, -2.389904, 0.2196078, 1, 0, 1,
-0.5037405, 2.025928, 0.4183224, 0.2117647, 1, 0, 1,
-0.4955851, 0.3960374, 0.4285998, 0.2078431, 1, 0, 1,
-0.4836669, 0.3928292, -0.5486731, 0.2, 1, 0, 1,
-0.4807639, -1.005179, -3.64453, 0.1921569, 1, 0, 1,
-0.4798485, 1.798956, 0.4436978, 0.1882353, 1, 0, 1,
-0.4760543, -0.9714156, -2.040849, 0.1803922, 1, 0, 1,
-0.4759608, -1.444452, -1.357986, 0.1764706, 1, 0, 1,
-0.4741286, -1.018462, -2.660537, 0.1686275, 1, 0, 1,
-0.4735445, 1.080469, -1.099018, 0.1647059, 1, 0, 1,
-0.4717004, -0.948473, -1.342496, 0.1568628, 1, 0, 1,
-0.4696824, 0.3557083, 0.7873519, 0.1529412, 1, 0, 1,
-0.4595055, 0.9008575, -0.2797657, 0.145098, 1, 0, 1,
-0.4566011, 0.933915, -0.1000933, 0.1411765, 1, 0, 1,
-0.4559846, -0.2421197, -2.80402, 0.1333333, 1, 0, 1,
-0.4538644, 1.12382, -1.043494, 0.1294118, 1, 0, 1,
-0.4536346, 0.03041013, -2.83595, 0.1215686, 1, 0, 1,
-0.4523303, 0.05465132, 0.2571211, 0.1176471, 1, 0, 1,
-0.4482719, -0.285451, -2.825719, 0.1098039, 1, 0, 1,
-0.4467946, -1.843596, -0.841812, 0.1058824, 1, 0, 1,
-0.4465559, -1.273125, -1.305537, 0.09803922, 1, 0, 1,
-0.4441323, -0.1479792, -1.849964, 0.09019608, 1, 0, 1,
-0.4425453, -0.4221491, -1.771595, 0.08627451, 1, 0, 1,
-0.4384969, 0.1862806, -1.32095, 0.07843138, 1, 0, 1,
-0.437269, 0.39053, 0.1994467, 0.07450981, 1, 0, 1,
-0.4372342, 0.143844, -1.752086, 0.06666667, 1, 0, 1,
-0.4332703, 2.546046, -0.9768631, 0.0627451, 1, 0, 1,
-0.4327835, 0.2559989, -0.2339799, 0.05490196, 1, 0, 1,
-0.432597, 1.961923, -1.771392, 0.05098039, 1, 0, 1,
-0.4313683, -2.345439, -3.548876, 0.04313726, 1, 0, 1,
-0.4304411, 0.8384272, -1.674513, 0.03921569, 1, 0, 1,
-0.4302067, 0.6364901, 0.09972448, 0.03137255, 1, 0, 1,
-0.4295674, 0.6263312, -0.042426, 0.02745098, 1, 0, 1,
-0.4237765, -0.2136249, -2.076854, 0.01960784, 1, 0, 1,
-0.422903, 1.01344, -0.7988654, 0.01568628, 1, 0, 1,
-0.4134629, 0.2231935, -2.054507, 0.007843138, 1, 0, 1,
-0.4092775, -0.5768043, -3.49341, 0.003921569, 1, 0, 1,
-0.4073783, 0.3387045, -0.2260389, 0, 1, 0.003921569, 1,
-0.4062903, 1.350896, 0.3087622, 0, 1, 0.01176471, 1,
-0.4057174, -0.4597068, -3.137288, 0, 1, 0.01568628, 1,
-0.4028869, -0.6351031, -3.696153, 0, 1, 0.02352941, 1,
-0.402413, 0.5974789, 0.04722731, 0, 1, 0.02745098, 1,
-0.3978021, -0.7604467, -2.583807, 0, 1, 0.03529412, 1,
-0.3968234, 0.09360279, -1.826257, 0, 1, 0.03921569, 1,
-0.3942683, 0.9147295, 1.116667, 0, 1, 0.04705882, 1,
-0.3925931, 2.522894, -0.7723776, 0, 1, 0.05098039, 1,
-0.3913733, 2.604548, 1.761572, 0, 1, 0.05882353, 1,
-0.3900543, -1.347243, -3.070406, 0, 1, 0.0627451, 1,
-0.3868356, 0.3476548, 1.424731, 0, 1, 0.07058824, 1,
-0.3828385, 1.053454, -3.008117, 0, 1, 0.07450981, 1,
-0.3826677, 1.220424, -0.7070215, 0, 1, 0.08235294, 1,
-0.3825919, -1.070159, -3.265591, 0, 1, 0.08627451, 1,
-0.3808946, -1.183283, -2.817843, 0, 1, 0.09411765, 1,
-0.3803198, 0.02953643, -2.885798, 0, 1, 0.1019608, 1,
-0.3781792, -0.6011504, -0.7688627, 0, 1, 0.1058824, 1,
-0.3772618, 0.1126243, -0.5776175, 0, 1, 0.1137255, 1,
-0.3752095, 0.1970506, -1.060405, 0, 1, 0.1176471, 1,
-0.374251, 0.006610272, -0.5439773, 0, 1, 0.1254902, 1,
-0.3729748, 0.3708147, -0.3915332, 0, 1, 0.1294118, 1,
-0.362506, -0.5591105, -0.5611641, 0, 1, 0.1372549, 1,
-0.3608595, 0.3853818, -0.9366508, 0, 1, 0.1411765, 1,
-0.3582771, -0.4817276, -1.624737, 0, 1, 0.1490196, 1,
-0.355904, -0.2360777, -2.965785, 0, 1, 0.1529412, 1,
-0.3519813, 0.109678, -2.425927, 0, 1, 0.1607843, 1,
-0.3489563, -0.0008982595, -0.8696449, 0, 1, 0.1647059, 1,
-0.3474583, 0.2071626, -2.806667, 0, 1, 0.172549, 1,
-0.34525, 0.7931097, -0.7265581, 0, 1, 0.1764706, 1,
-0.3408281, -0.9408118, -3.752218, 0, 1, 0.1843137, 1,
-0.3408035, 0.3901596, -0.8374509, 0, 1, 0.1882353, 1,
-0.3388627, 0.1006323, -1.321652, 0, 1, 0.1960784, 1,
-0.3369404, 1.517283, -2.855008, 0, 1, 0.2039216, 1,
-0.3364537, -0.263414, -0.5814778, 0, 1, 0.2078431, 1,
-0.3358893, -0.9834868, -1.978583, 0, 1, 0.2156863, 1,
-0.335757, 0.7878184, 0.3925734, 0, 1, 0.2196078, 1,
-0.334192, -1.593488, -2.51445, 0, 1, 0.227451, 1,
-0.3307709, -2.569144, -3.205518, 0, 1, 0.2313726, 1,
-0.3279923, -0.2588798, -2.373065, 0, 1, 0.2392157, 1,
-0.3259957, -0.3685784, -2.852006, 0, 1, 0.2431373, 1,
-0.3255164, 2.204606, 1.23668, 0, 1, 0.2509804, 1,
-0.3226211, 0.4358987, -0.5860192, 0, 1, 0.254902, 1,
-0.320412, 0.230184, -0.608656, 0, 1, 0.2627451, 1,
-0.3191935, -0.7158302, -2.248563, 0, 1, 0.2666667, 1,
-0.3187296, -1.786973, -3.314731, 0, 1, 0.2745098, 1,
-0.3186619, 1.749665, -0.06642041, 0, 1, 0.2784314, 1,
-0.3180537, -0.4450788, -1.352132, 0, 1, 0.2862745, 1,
-0.3146413, -1.868082, -4.575329, 0, 1, 0.2901961, 1,
-0.3114718, 0.7394565, -1.056728, 0, 1, 0.2980392, 1,
-0.3102994, 0.9457325, 1.197313, 0, 1, 0.3058824, 1,
-0.3041003, 0.07709841, 0.5441705, 0, 1, 0.3098039, 1,
-0.3039829, 1.802915, 0.4129488, 0, 1, 0.3176471, 1,
-0.3013159, -0.6373132, -3.754707, 0, 1, 0.3215686, 1,
-0.2994485, -0.4011122, -1.904664, 0, 1, 0.3294118, 1,
-0.298816, 0.5584254, -0.3588518, 0, 1, 0.3333333, 1,
-0.2985898, 0.6529548, 1.460745, 0, 1, 0.3411765, 1,
-0.2964689, 1.223211, -0.8688525, 0, 1, 0.345098, 1,
-0.2949842, -1.253499, -2.784083, 0, 1, 0.3529412, 1,
-0.2938877, 0.1371597, -0.558919, 0, 1, 0.3568628, 1,
-0.2927449, 1.442845, -0.2573177, 0, 1, 0.3647059, 1,
-0.2850249, 1.118803, 1.776542, 0, 1, 0.3686275, 1,
-0.2823203, 0.1423723, -2.007698, 0, 1, 0.3764706, 1,
-0.2814749, -2.075941, -2.779183, 0, 1, 0.3803922, 1,
-0.2805594, -0.04269744, -3.574345, 0, 1, 0.3882353, 1,
-0.2803468, -1.455812, -0.9731943, 0, 1, 0.3921569, 1,
-0.2796676, -0.2128455, -2.160021, 0, 1, 0.4, 1,
-0.2737721, 0.5641853, -0.5367121, 0, 1, 0.4078431, 1,
-0.2723329, 0.5988457, -0.8075902, 0, 1, 0.4117647, 1,
-0.2698552, -0.9097125, -2.562629, 0, 1, 0.4196078, 1,
-0.2678548, -1.124848, -2.172762, 0, 1, 0.4235294, 1,
-0.2670405, 0.949794, -0.1688845, 0, 1, 0.4313726, 1,
-0.2646893, -1.002593, -3.075913, 0, 1, 0.4352941, 1,
-0.2528447, 1.055297, 0.6418728, 0, 1, 0.4431373, 1,
-0.2511404, -1.397053, -3.443179, 0, 1, 0.4470588, 1,
-0.2460921, 0.7509784, -2.833614, 0, 1, 0.454902, 1,
-0.2452858, 1.62498, 0.8924829, 0, 1, 0.4588235, 1,
-0.2447099, 0.1358244, -1.24334, 0, 1, 0.4666667, 1,
-0.2428363, -0.1600543, -2.793323, 0, 1, 0.4705882, 1,
-0.2399171, 0.6319358, -3.009226, 0, 1, 0.4784314, 1,
-0.2394628, -1.103613, -3.951846, 0, 1, 0.4823529, 1,
-0.2336717, 1.442423, 1.132174, 0, 1, 0.4901961, 1,
-0.229247, -1.497844, -2.789804, 0, 1, 0.4941176, 1,
-0.2281044, -0.9022738, -2.351641, 0, 1, 0.5019608, 1,
-0.2280553, 0.7824407, 0.945289, 0, 1, 0.509804, 1,
-0.2110529, 2.74535, -0.6811354, 0, 1, 0.5137255, 1,
-0.2089886, -0.2786877, -1.10321, 0, 1, 0.5215687, 1,
-0.2083252, -1.766127, -1.039308, 0, 1, 0.5254902, 1,
-0.2074341, 1.713187, -0.1945105, 0, 1, 0.5333334, 1,
-0.2032755, 0.6204031, 0.05942419, 0, 1, 0.5372549, 1,
-0.1975984, 0.3859372, 0.008986583, 0, 1, 0.5450981, 1,
-0.197492, -0.7306509, -3.342864, 0, 1, 0.5490196, 1,
-0.1958703, 0.3027208, -0.5941299, 0, 1, 0.5568628, 1,
-0.1950696, 1.331479, 1.534561, 0, 1, 0.5607843, 1,
-0.1947758, 1.750151, 1.642302, 0, 1, 0.5686275, 1,
-0.1915821, 1.452551, 1.486542, 0, 1, 0.572549, 1,
-0.1907391, -0.02962823, -0.007611636, 0, 1, 0.5803922, 1,
-0.1900664, -0.3477611, -1.309197, 0, 1, 0.5843138, 1,
-0.1867835, 0.2189179, -0.6734779, 0, 1, 0.5921569, 1,
-0.183564, 0.01889699, -0.08282025, 0, 1, 0.5960785, 1,
-0.1820046, -0.2600681, -2.204048, 0, 1, 0.6039216, 1,
-0.1799843, -0.538487, -1.774571, 0, 1, 0.6117647, 1,
-0.1795338, 0.3187621, 0.4421097, 0, 1, 0.6156863, 1,
-0.1757548, 0.4677311, -2.05896, 0, 1, 0.6235294, 1,
-0.1751209, 0.6576369, -1.341527, 0, 1, 0.627451, 1,
-0.1744873, -1.523778, -2.627455, 0, 1, 0.6352941, 1,
-0.1737855, 1.932047, 1.505072, 0, 1, 0.6392157, 1,
-0.1728005, -0.168577, -1.18758, 0, 1, 0.6470588, 1,
-0.1724378, 1.32381, -0.3201437, 0, 1, 0.6509804, 1,
-0.1679023, 0.7381942, -0.8159247, 0, 1, 0.6588235, 1,
-0.1662118, 1.201504, -0.228596, 0, 1, 0.6627451, 1,
-0.1621139, -0.6955684, -1.744085, 0, 1, 0.6705883, 1,
-0.1570451, -0.5257812, -3.293254, 0, 1, 0.6745098, 1,
-0.1547579, 0.1583316, 0.5452439, 0, 1, 0.682353, 1,
-0.1504567, -1.217776, -1.782803, 0, 1, 0.6862745, 1,
-0.1457051, -1.491147, -2.739696, 0, 1, 0.6941177, 1,
-0.1455244, 0.2243351, -1.059311, 0, 1, 0.7019608, 1,
-0.1381658, 0.5547214, 0.1390898, 0, 1, 0.7058824, 1,
-0.1334937, 0.2111827, -1.630552, 0, 1, 0.7137255, 1,
-0.1184399, -0.2288307, -3.19369, 0, 1, 0.7176471, 1,
-0.1179738, -0.4236675, -2.96659, 0, 1, 0.7254902, 1,
-0.1149665, 0.8092627, 0.09065208, 0, 1, 0.7294118, 1,
-0.1146257, 0.1988384, 0.6722999, 0, 1, 0.7372549, 1,
-0.1115096, -0.7708426, -2.457203, 0, 1, 0.7411765, 1,
-0.1097848, -2.599491, -4.291325, 0, 1, 0.7490196, 1,
-0.1089607, 0.2709953, -1.007141, 0, 1, 0.7529412, 1,
-0.1071969, -0.802561, -1.879035, 0, 1, 0.7607843, 1,
-0.1010252, 0.8175046, 0.4910555, 0, 1, 0.7647059, 1,
-0.09890857, -0.7015691, -2.286869, 0, 1, 0.772549, 1,
-0.09840258, -0.7382062, -2.908988, 0, 1, 0.7764706, 1,
-0.09804937, -0.2093078, -1.882981, 0, 1, 0.7843137, 1,
-0.09667292, -0.1090277, -2.144697, 0, 1, 0.7882353, 1,
-0.09581318, -0.1620286, -2.745214, 0, 1, 0.7960784, 1,
-0.09309813, -0.1261815, -4.008554, 0, 1, 0.8039216, 1,
-0.09225848, 0.99926, 0.6328745, 0, 1, 0.8078431, 1,
-0.08684241, -0.02144467, -1.927252, 0, 1, 0.8156863, 1,
-0.08667152, -2.045857, -1.360645, 0, 1, 0.8196079, 1,
-0.08289523, -0.9963176, -1.478616, 0, 1, 0.827451, 1,
-0.0798334, -1.687192, -3.13824, 0, 1, 0.8313726, 1,
-0.07918583, 1.560359, -2.829128, 0, 1, 0.8392157, 1,
-0.07893729, 0.1412187, -0.4482493, 0, 1, 0.8431373, 1,
-0.07777452, -1.856403, -2.589454, 0, 1, 0.8509804, 1,
-0.07696709, 1.905889, -1.303516, 0, 1, 0.854902, 1,
-0.0762722, 1.903011, -0.09987163, 0, 1, 0.8627451, 1,
-0.07401194, -0.1301333, -1.549869, 0, 1, 0.8666667, 1,
-0.07071551, 1.082995, 0.1375189, 0, 1, 0.8745098, 1,
-0.06699952, -1.143703, -3.026414, 0, 1, 0.8784314, 1,
-0.06243045, -0.02881303, -2.460115, 0, 1, 0.8862745, 1,
-0.06241227, -0.2031049, -3.233624, 0, 1, 0.8901961, 1,
-0.06034073, 0.5804846, 1.156911, 0, 1, 0.8980392, 1,
-0.05215418, -0.8543745, -3.198872, 0, 1, 0.9058824, 1,
-0.051885, 2.698984, -0.294486, 0, 1, 0.9098039, 1,
-0.04118082, 0.1812647, 0.5508178, 0, 1, 0.9176471, 1,
-0.04022775, 1.932181, -0.8358774, 0, 1, 0.9215686, 1,
-0.03487822, 0.3072971, 0.04432562, 0, 1, 0.9294118, 1,
-0.0348415, 0.9816438, 1.254719, 0, 1, 0.9333333, 1,
-0.03361107, -0.01463369, -2.71375, 0, 1, 0.9411765, 1,
-0.02846408, 0.6211922, 2.549164, 0, 1, 0.945098, 1,
-0.02839565, 0.1384145, -1.132171, 0, 1, 0.9529412, 1,
-0.02781711, 0.333172, -1.363678, 0, 1, 0.9568627, 1,
-0.02253331, 0.4300761, 0.5739964, 0, 1, 0.9647059, 1,
-0.0222219, -1.014537, -3.248819, 0, 1, 0.9686275, 1,
-0.02063832, -0.6786466, -2.363745, 0, 1, 0.9764706, 1,
-0.02021526, 0.1248904, 0.9331048, 0, 1, 0.9803922, 1,
-0.01958062, -1.520625, -3.623185, 0, 1, 0.9882353, 1,
-0.01683717, 0.07650131, 0.05550397, 0, 1, 0.9921569, 1,
-0.01450376, 0.09766855, -1.30965, 0, 1, 1, 1,
-0.01373849, -0.3468486, -3.361334, 0, 0.9921569, 1, 1,
-0.01350959, 0.2800479, -0.9629843, 0, 0.9882353, 1, 1,
-0.01288888, 0.2137469, -2.023869, 0, 0.9803922, 1, 1,
-0.01241705, 0.4321168, -0.8499392, 0, 0.9764706, 1, 1,
-0.007601575, -1.201559, -2.588815, 0, 0.9686275, 1, 1,
-0.0004743618, 0.620537, 1.186419, 0, 0.9647059, 1, 1,
0.00103452, -0.5446092, 2.862175, 0, 0.9568627, 1, 1,
0.003459011, 0.847204, -0.402353, 0, 0.9529412, 1, 1,
0.005309794, -0.2459923, 3.182783, 0, 0.945098, 1, 1,
0.008196055, -0.8411693, 2.716935, 0, 0.9411765, 1, 1,
0.01043501, 0.339365, -0.331977, 0, 0.9333333, 1, 1,
0.01131493, -0.06637277, 1.951167, 0, 0.9294118, 1, 1,
0.01152052, 0.2179022, 0.185941, 0, 0.9215686, 1, 1,
0.0121539, 0.05906293, 0.7281354, 0, 0.9176471, 1, 1,
0.01233073, -0.3876281, 2.662071, 0, 0.9098039, 1, 1,
0.01790793, 2.028927, -0.1126502, 0, 0.9058824, 1, 1,
0.01881909, -1.84714, 2.712189, 0, 0.8980392, 1, 1,
0.01996764, -0.1745453, 4.078144, 0, 0.8901961, 1, 1,
0.01999597, -0.9306769, 4.07102, 0, 0.8862745, 1, 1,
0.02256013, -1.155813, 3.349532, 0, 0.8784314, 1, 1,
0.02497275, 0.07754134, 2.52958, 0, 0.8745098, 1, 1,
0.02523829, 1.498003, 2.509573, 0, 0.8666667, 1, 1,
0.02866869, -0.8101979, 3.066334, 0, 0.8627451, 1, 1,
0.03008323, -1.324874, 3.97398, 0, 0.854902, 1, 1,
0.03273053, 0.1234758, 0.1939977, 0, 0.8509804, 1, 1,
0.03654612, 0.2264041, 1.778714, 0, 0.8431373, 1, 1,
0.03677265, -0.7470374, 3.003934, 0, 0.8392157, 1, 1,
0.04010421, 0.6779497, 0.567794, 0, 0.8313726, 1, 1,
0.04135745, -0.9420925, 1.846752, 0, 0.827451, 1, 1,
0.04786843, -0.7084829, 1.949258, 0, 0.8196079, 1, 1,
0.04880204, -0.8549272, 2.893538, 0, 0.8156863, 1, 1,
0.0504774, 0.006910717, 2.338546, 0, 0.8078431, 1, 1,
0.05415983, 0.7494958, 0.4455405, 0, 0.8039216, 1, 1,
0.05478444, -0.1326273, 3.098429, 0, 0.7960784, 1, 1,
0.05749642, -1.010937, 1.772956, 0, 0.7882353, 1, 1,
0.0597314, -2.011898, 2.474884, 0, 0.7843137, 1, 1,
0.05996667, -0.1755638, 1.497537, 0, 0.7764706, 1, 1,
0.06244633, 2.105557, 0.8970383, 0, 0.772549, 1, 1,
0.06575229, -1.55002, 1.320531, 0, 0.7647059, 1, 1,
0.06664064, 1.755957, -1.168269, 0, 0.7607843, 1, 1,
0.07162926, 1.208681, 0.7366048, 0, 0.7529412, 1, 1,
0.0788511, 0.4565601, -0.1216788, 0, 0.7490196, 1, 1,
0.07894144, 1.965036, 0.0479489, 0, 0.7411765, 1, 1,
0.07932444, 0.5175878, 0.4635344, 0, 0.7372549, 1, 1,
0.08193708, -0.3801073, 1.84784, 0, 0.7294118, 1, 1,
0.09286935, 1.215665, 1.506195, 0, 0.7254902, 1, 1,
0.09410278, -1.356879, 3.238711, 0, 0.7176471, 1, 1,
0.0947853, 0.301635, -0.2217839, 0, 0.7137255, 1, 1,
0.09739687, 1.134271, -0.2696559, 0, 0.7058824, 1, 1,
0.09892144, 3.176227, 1.013387, 0, 0.6980392, 1, 1,
0.1004001, -1.308631, 2.863561, 0, 0.6941177, 1, 1,
0.1038349, -0.3854102, 1.709886, 0, 0.6862745, 1, 1,
0.1104332, 0.6101428, -1.852766, 0, 0.682353, 1, 1,
0.1155812, -0.7620541, 1.639823, 0, 0.6745098, 1, 1,
0.1156861, -0.6411188, 3.722753, 0, 0.6705883, 1, 1,
0.1247846, -1.516558, 2.904414, 0, 0.6627451, 1, 1,
0.1256102, 1.093834, -0.1269482, 0, 0.6588235, 1, 1,
0.1266612, 2.285701, 0.06265135, 0, 0.6509804, 1, 1,
0.1299691, -0.7304605, 3.14521, 0, 0.6470588, 1, 1,
0.1326885, 0.2744898, 0.7467164, 0, 0.6392157, 1, 1,
0.138277, -0.8000911, 3.088729, 0, 0.6352941, 1, 1,
0.140471, -0.2138176, 3.073007, 0, 0.627451, 1, 1,
0.1410153, 0.2648928, 0.4466243, 0, 0.6235294, 1, 1,
0.1439043, -0.5182279, 2.5118, 0, 0.6156863, 1, 1,
0.1443239, -1.401963, 3.988977, 0, 0.6117647, 1, 1,
0.1458426, -0.5672842, 2.402481, 0, 0.6039216, 1, 1,
0.1505646, 1.655602, -0.5478224, 0, 0.5960785, 1, 1,
0.1519071, 1.08437, 0.3250475, 0, 0.5921569, 1, 1,
0.1566037, 0.1505149, -0.7287799, 0, 0.5843138, 1, 1,
0.1576319, 0.3710103, -0.01047928, 0, 0.5803922, 1, 1,
0.1638308, 0.84085, -0.02505881, 0, 0.572549, 1, 1,
0.164926, 0.9510466, 1.647445, 0, 0.5686275, 1, 1,
0.1681435, -0.9246389, 2.544177, 0, 0.5607843, 1, 1,
0.1682985, -1.195299, 3.999771, 0, 0.5568628, 1, 1,
0.1688178, 0.2090545, 0.5999993, 0, 0.5490196, 1, 1,
0.1691369, -1.106322, 3.726539, 0, 0.5450981, 1, 1,
0.1710848, -1.520578, 5.701729, 0, 0.5372549, 1, 1,
0.1745252, -0.6104822, 3.655269, 0, 0.5333334, 1, 1,
0.1746373, 0.7528347, 0.5842622, 0, 0.5254902, 1, 1,
0.1811737, 0.4583417, 0.2035465, 0, 0.5215687, 1, 1,
0.1862309, -0.8140616, 2.782266, 0, 0.5137255, 1, 1,
0.1868825, -0.0443502, 2.161072, 0, 0.509804, 1, 1,
0.1886989, -0.6922563, 4.366549, 0, 0.5019608, 1, 1,
0.1897626, -0.04794063, 2.675582, 0, 0.4941176, 1, 1,
0.1974119, 0.1401064, 1.904188, 0, 0.4901961, 1, 1,
0.1977763, -0.6934409, 3.634142, 0, 0.4823529, 1, 1,
0.1980863, 0.5118501, 1.634163, 0, 0.4784314, 1, 1,
0.1995876, -0.03014826, 0.6649259, 0, 0.4705882, 1, 1,
0.2002717, -1.060296, 3.401731, 0, 0.4666667, 1, 1,
0.2036688, 0.4956642, 0.09385497, 0, 0.4588235, 1, 1,
0.206158, -0.9438204, 1.331622, 0, 0.454902, 1, 1,
0.2085443, 0.9495898, -0.5510834, 0, 0.4470588, 1, 1,
0.2139405, 1.375396, 1.302316, 0, 0.4431373, 1, 1,
0.2143787, -0.0231305, -0.1538051, 0, 0.4352941, 1, 1,
0.2150213, 0.1063981, 2.467137, 0, 0.4313726, 1, 1,
0.2168863, 0.6583496, 0.5647309, 0, 0.4235294, 1, 1,
0.216928, -0.1157905, 2.395251, 0, 0.4196078, 1, 1,
0.2179136, -0.01304784, 4.453417, 0, 0.4117647, 1, 1,
0.2220795, -0.3389159, 2.613159, 0, 0.4078431, 1, 1,
0.2287855, 0.8093446, 1.811214, 0, 0.4, 1, 1,
0.2332491, -0.8408567, 3.923058, 0, 0.3921569, 1, 1,
0.2343373, 0.08465305, 1.76702, 0, 0.3882353, 1, 1,
0.2421813, 0.2034144, 0.6400664, 0, 0.3803922, 1, 1,
0.2517761, -2.579871, 3.335518, 0, 0.3764706, 1, 1,
0.2528421, 1.13035, 0.179917, 0, 0.3686275, 1, 1,
0.2536752, -0.2351833, 1.670132, 0, 0.3647059, 1, 1,
0.2542634, -1.054764, 2.139285, 0, 0.3568628, 1, 1,
0.2545717, -0.3894835, 3.598201, 0, 0.3529412, 1, 1,
0.2568262, 1.557086, 1.378907, 0, 0.345098, 1, 1,
0.2571741, 0.3480872, 1.024647, 0, 0.3411765, 1, 1,
0.2598231, 0.9744326, 3.273306, 0, 0.3333333, 1, 1,
0.2606127, 1.444229, 0.4981112, 0, 0.3294118, 1, 1,
0.2621948, -0.7384267, 2.2376, 0, 0.3215686, 1, 1,
0.2641385, -0.8644655, 2.69602, 0, 0.3176471, 1, 1,
0.2663688, -0.7742679, 2.317101, 0, 0.3098039, 1, 1,
0.2748176, -1.008509, 1.379041, 0, 0.3058824, 1, 1,
0.277675, 1.125117, -0.1537507, 0, 0.2980392, 1, 1,
0.2778324, -0.7609006, 3.408985, 0, 0.2901961, 1, 1,
0.2794396, -1.038067, 0.8908551, 0, 0.2862745, 1, 1,
0.2811206, -0.9264362, 4.220232, 0, 0.2784314, 1, 1,
0.2839946, -1.589382, 3.438186, 0, 0.2745098, 1, 1,
0.2843203, 1.715352, -0.4759893, 0, 0.2666667, 1, 1,
0.2844492, 1.441812, -1.193908, 0, 0.2627451, 1, 1,
0.2848862, -0.1229433, 1.35636, 0, 0.254902, 1, 1,
0.2879435, 0.4343823, -0.4328777, 0, 0.2509804, 1, 1,
0.2927765, 0.1123994, 1.991404, 0, 0.2431373, 1, 1,
0.2968728, 0.4225939, -0.05808263, 0, 0.2392157, 1, 1,
0.2991628, -1.101651, 1.652905, 0, 0.2313726, 1, 1,
0.3048561, -0.3349864, 2.141228, 0, 0.227451, 1, 1,
0.304929, 1.094001, 0.7269473, 0, 0.2196078, 1, 1,
0.3063494, -1.386156, 3.450497, 0, 0.2156863, 1, 1,
0.3157075, -0.2896863, 1.263472, 0, 0.2078431, 1, 1,
0.31878, -0.1615024, 3.282969, 0, 0.2039216, 1, 1,
0.322286, -0.971253, 3.460407, 0, 0.1960784, 1, 1,
0.3246039, -1.28008, 3.073415, 0, 0.1882353, 1, 1,
0.3266418, 1.609985, 2.479589, 0, 0.1843137, 1, 1,
0.3275492, -0.2616505, 1.261347, 0, 0.1764706, 1, 1,
0.3336218, 0.8623788, 0.08256002, 0, 0.172549, 1, 1,
0.3341266, 0.6006173, 0.1439108, 0, 0.1647059, 1, 1,
0.3388517, -0.7032044, 2.778416, 0, 0.1607843, 1, 1,
0.3419737, -1.634713, 2.604596, 0, 0.1529412, 1, 1,
0.3443202, -1.233872, 1.80572, 0, 0.1490196, 1, 1,
0.3472143, -0.4159527, 1.689737, 0, 0.1411765, 1, 1,
0.3475894, 0.5820239, 0.8429226, 0, 0.1372549, 1, 1,
0.3507236, 0.2821841, 0.8646772, 0, 0.1294118, 1, 1,
0.3512982, 1.660412, 2.593931, 0, 0.1254902, 1, 1,
0.3536644, -0.4772085, 1.898264, 0, 0.1176471, 1, 1,
0.3567299, -1.294833, 2.698858, 0, 0.1137255, 1, 1,
0.3588244, -0.6782959, 2.595537, 0, 0.1058824, 1, 1,
0.3620089, 1.699998, 0.02016083, 0, 0.09803922, 1, 1,
0.36696, -0.2987579, 2.783292, 0, 0.09411765, 1, 1,
0.3685339, -0.8351946, -0.0164431, 0, 0.08627451, 1, 1,
0.3707901, 1.16855, -0.8755207, 0, 0.08235294, 1, 1,
0.3812689, 0.460173, 0.8408383, 0, 0.07450981, 1, 1,
0.3852978, -2.584039, 4.280417, 0, 0.07058824, 1, 1,
0.3871565, -0.4814218, 2.222516, 0, 0.0627451, 1, 1,
0.3891347, 0.3875692, 0.6727679, 0, 0.05882353, 1, 1,
0.3893594, -0.1647386, 1.098819, 0, 0.05098039, 1, 1,
0.3921592, 0.4519421, -0.8114619, 0, 0.04705882, 1, 1,
0.3930021, 0.772572, -0.1097926, 0, 0.03921569, 1, 1,
0.3947533, -0.2159051, 1.705092, 0, 0.03529412, 1, 1,
0.3952998, 1.197036, 0.3842204, 0, 0.02745098, 1, 1,
0.396928, 2.114284, -0.4418052, 0, 0.02352941, 1, 1,
0.3970253, -0.1993949, 0.7782444, 0, 0.01568628, 1, 1,
0.3978301, 1.39053, 0.2770688, 0, 0.01176471, 1, 1,
0.4025095, -0.4998927, 3.042974, 0, 0.003921569, 1, 1,
0.4050458, 0.06508146, 1.982793, 0.003921569, 0, 1, 1,
0.4056065, 1.036471, -1.304728, 0.007843138, 0, 1, 1,
0.407864, -0.001211207, 2.670902, 0.01568628, 0, 1, 1,
0.4081491, -0.3257703, 2.294179, 0.01960784, 0, 1, 1,
0.4084272, 0.5582461, 1.58679, 0.02745098, 0, 1, 1,
0.4104075, 1.371862, -0.2753117, 0.03137255, 0, 1, 1,
0.4106273, 0.6133769, 1.50939, 0.03921569, 0, 1, 1,
0.4120333, -0.08094217, -0.6890867, 0.04313726, 0, 1, 1,
0.4131347, 0.1162345, 0.8806972, 0.05098039, 0, 1, 1,
0.4132398, -1.071281, 1.99526, 0.05490196, 0, 1, 1,
0.4159486, 0.1416392, 0.6559907, 0.0627451, 0, 1, 1,
0.4163683, -1.576455, 0.5897348, 0.06666667, 0, 1, 1,
0.4206578, -2.354318, 1.671145, 0.07450981, 0, 1, 1,
0.4208734, 1.414582, 0.1856806, 0.07843138, 0, 1, 1,
0.4218209, 0.4768059, 0.5006493, 0.08627451, 0, 1, 1,
0.4235406, -1.258326, 2.34874, 0.09019608, 0, 1, 1,
0.4236865, -0.4455584, 3.541652, 0.09803922, 0, 1, 1,
0.4261299, 0.04296032, 3.364064, 0.1058824, 0, 1, 1,
0.4338519, -2.883842, 1.490118, 0.1098039, 0, 1, 1,
0.4358599, -0.7307605, 2.425071, 0.1176471, 0, 1, 1,
0.4364727, -0.8499838, 2.873167, 0.1215686, 0, 1, 1,
0.4400763, -1.505424, 5.205436, 0.1294118, 0, 1, 1,
0.4448724, -0.669248, 1.186174, 0.1333333, 0, 1, 1,
0.4480133, 0.84914, -0.3698226, 0.1411765, 0, 1, 1,
0.4514257, 1.882939, -0.1203744, 0.145098, 0, 1, 1,
0.4532877, -0.0127089, 1.515383, 0.1529412, 0, 1, 1,
0.4559962, -0.07255021, 3.067689, 0.1568628, 0, 1, 1,
0.4601358, -0.5742182, 3.106559, 0.1647059, 0, 1, 1,
0.4607932, -1.077643, 4.29014, 0.1686275, 0, 1, 1,
0.4641527, 0.9230015, 1.618115, 0.1764706, 0, 1, 1,
0.4720235, -0.2624789, 1.687626, 0.1803922, 0, 1, 1,
0.4749581, -0.7184482, 1.960674, 0.1882353, 0, 1, 1,
0.4829092, 1.595084, 1.461422, 0.1921569, 0, 1, 1,
0.4904926, -1.318574, 3.977258, 0.2, 0, 1, 1,
0.4927648, -0.3524713, 4.363987, 0.2078431, 0, 1, 1,
0.4945412, 0.5968066, -0.6201485, 0.2117647, 0, 1, 1,
0.4958037, -0.8778808, 5.610357, 0.2196078, 0, 1, 1,
0.5061619, -0.9412327, 2.414103, 0.2235294, 0, 1, 1,
0.5080698, 0.1123822, 2.039796, 0.2313726, 0, 1, 1,
0.508354, -0.9437399, 2.722145, 0.2352941, 0, 1, 1,
0.5173, -0.5932831, 1.885861, 0.2431373, 0, 1, 1,
0.5181305, -0.4616727, 2.890583, 0.2470588, 0, 1, 1,
0.5204797, 0.934618, 1.111619, 0.254902, 0, 1, 1,
0.525956, -0.4332879, 0.9239096, 0.2588235, 0, 1, 1,
0.5276967, 0.2437158, 2.534648, 0.2666667, 0, 1, 1,
0.5297056, -0.8055941, 2.054721, 0.2705882, 0, 1, 1,
0.5328288, 0.6507696, 2.529566, 0.2784314, 0, 1, 1,
0.534002, 1.009244, 0.9035168, 0.282353, 0, 1, 1,
0.5340405, -0.4268019, 2.804951, 0.2901961, 0, 1, 1,
0.5366468, 0.3596088, -0.2306306, 0.2941177, 0, 1, 1,
0.5422748, 0.8197545, 2.059028, 0.3019608, 0, 1, 1,
0.5431215, -1.020057, 4.953369, 0.3098039, 0, 1, 1,
0.5516893, -1.331773, 2.205463, 0.3137255, 0, 1, 1,
0.5542929, 0.2295471, 0.6703738, 0.3215686, 0, 1, 1,
0.5578704, 0.4238192, -0.07928117, 0.3254902, 0, 1, 1,
0.5635229, -0.1088916, 1.991199, 0.3333333, 0, 1, 1,
0.5643235, 0.7313024, 1.271283, 0.3372549, 0, 1, 1,
0.5732819, 1.506209, -1.019579, 0.345098, 0, 1, 1,
0.574521, -0.4656103, 1.572534, 0.3490196, 0, 1, 1,
0.5819215, 1.243433, 1.24231, 0.3568628, 0, 1, 1,
0.5833443, 1.095447, -1.421892, 0.3607843, 0, 1, 1,
0.5837517, -0.6433564, 4.795061, 0.3686275, 0, 1, 1,
0.5910876, -1.443784, 2.71458, 0.372549, 0, 1, 1,
0.5925986, 0.2896001, 0.7302389, 0.3803922, 0, 1, 1,
0.6028403, 0.2802077, 3.355424, 0.3843137, 0, 1, 1,
0.6043339, -1.550953, 3.261264, 0.3921569, 0, 1, 1,
0.6192288, -1.028316, 6.045751, 0.3960784, 0, 1, 1,
0.6242361, -0.283484, 3.255827, 0.4039216, 0, 1, 1,
0.6245207, 0.2236254, 2.480652, 0.4117647, 0, 1, 1,
0.6258525, 1.173018, -0.4411786, 0.4156863, 0, 1, 1,
0.6331159, 0.6408733, 0.485893, 0.4235294, 0, 1, 1,
0.6357379, 0.9214118, 0.6202094, 0.427451, 0, 1, 1,
0.6390898, -1.005926, 2.665661, 0.4352941, 0, 1, 1,
0.6450244, 0.719048, 1.531547, 0.4392157, 0, 1, 1,
0.645446, 2.090848, 0.799319, 0.4470588, 0, 1, 1,
0.6508098, 1.506715, -1.963725, 0.4509804, 0, 1, 1,
0.6527811, -0.4299111, 2.053608, 0.4588235, 0, 1, 1,
0.6556107, -1.219639, 2.575965, 0.4627451, 0, 1, 1,
0.6558663, 0.4163858, 1.631077, 0.4705882, 0, 1, 1,
0.6652344, 0.6360562, 1.335266, 0.4745098, 0, 1, 1,
0.6701687, 1.630291, 1.639976, 0.4823529, 0, 1, 1,
0.6722839, 0.05524975, 2.778046, 0.4862745, 0, 1, 1,
0.6727926, 0.0122665, 1.927434, 0.4941176, 0, 1, 1,
0.6739331, 1.120755, 0.2201517, 0.5019608, 0, 1, 1,
0.6750689, 1.5353, 2.445275, 0.5058824, 0, 1, 1,
0.6795363, -0.1582663, 2.666991, 0.5137255, 0, 1, 1,
0.6807905, -0.1202203, 0.07646351, 0.5176471, 0, 1, 1,
0.6863274, -0.1336793, 1.656325, 0.5254902, 0, 1, 1,
0.6994863, -1.542412, 1.954576, 0.5294118, 0, 1, 1,
0.6996059, 1.313842, 2.385345, 0.5372549, 0, 1, 1,
0.7004233, 0.581846, -0.9414033, 0.5411765, 0, 1, 1,
0.7040989, -1.105417, 2.147041, 0.5490196, 0, 1, 1,
0.7041624, 0.09335029, 2.305741, 0.5529412, 0, 1, 1,
0.7042933, -1.700257, 2.726565, 0.5607843, 0, 1, 1,
0.7043007, -0.6251463, 2.88723, 0.5647059, 0, 1, 1,
0.7045123, -0.5895768, 1.960352, 0.572549, 0, 1, 1,
0.7088526, 0.9147592, 1.493497, 0.5764706, 0, 1, 1,
0.7093684, -1.312728, 2.953764, 0.5843138, 0, 1, 1,
0.7108086, -0.779403, 4.045568, 0.5882353, 0, 1, 1,
0.7150092, 1.85803, -1.707129, 0.5960785, 0, 1, 1,
0.7278697, -1.622285, 2.137741, 0.6039216, 0, 1, 1,
0.7304268, -0.8360018, 3.026357, 0.6078432, 0, 1, 1,
0.7319509, 1.71349, 2.303833, 0.6156863, 0, 1, 1,
0.736178, -2.037433, 3.330342, 0.6196079, 0, 1, 1,
0.7427452, 1.685396, -1.239298, 0.627451, 0, 1, 1,
0.7432587, 1.36628, 2.0764, 0.6313726, 0, 1, 1,
0.7449723, 1.075113, 0.5238497, 0.6392157, 0, 1, 1,
0.7457253, -0.04406307, 0.879674, 0.6431373, 0, 1, 1,
0.7492712, 0.2160044, 0.9445349, 0.6509804, 0, 1, 1,
0.7501318, 0.09758968, 1.769219, 0.654902, 0, 1, 1,
0.7531392, 0.1342933, 2.080239, 0.6627451, 0, 1, 1,
0.7630564, -1.511558, 3.961252, 0.6666667, 0, 1, 1,
0.7728555, -0.8132654, 2.169765, 0.6745098, 0, 1, 1,
0.7803253, 0.03541617, 0.04959052, 0.6784314, 0, 1, 1,
0.7826805, 0.8745443, 0.3911909, 0.6862745, 0, 1, 1,
0.7847182, -0.09724243, 2.078113, 0.6901961, 0, 1, 1,
0.7850972, -0.6276672, 1.182404, 0.6980392, 0, 1, 1,
0.7937162, -0.5121058, 3.953909, 0.7058824, 0, 1, 1,
0.794876, -0.7600399, 4.079035, 0.7098039, 0, 1, 1,
0.7956066, -0.8275505, 3.015979, 0.7176471, 0, 1, 1,
0.7957522, -0.6494031, 2.116677, 0.7215686, 0, 1, 1,
0.7981647, 0.2320574, 2.448965, 0.7294118, 0, 1, 1,
0.7990068, -0.1242411, 0.7517684, 0.7333333, 0, 1, 1,
0.7997828, 1.008164, 0.4000357, 0.7411765, 0, 1, 1,
0.80122, 0.7796426, 1.076803, 0.7450981, 0, 1, 1,
0.8114027, 0.5739754, 0.2996732, 0.7529412, 0, 1, 1,
0.8168713, -0.05631111, 1.726155, 0.7568628, 0, 1, 1,
0.8171005, -0.1566138, 1.283975, 0.7647059, 0, 1, 1,
0.8210987, -0.08497506, 3.179739, 0.7686275, 0, 1, 1,
0.8223047, 0.4432652, -0.8193617, 0.7764706, 0, 1, 1,
0.8312454, -0.1521907, 1.843366, 0.7803922, 0, 1, 1,
0.8358987, -0.9705094, 2.10388, 0.7882353, 0, 1, 1,
0.8410199, 1.453962, -1.336936, 0.7921569, 0, 1, 1,
0.8431794, 1.340626, 0.001484323, 0.8, 0, 1, 1,
0.8504685, -0.6146917, 1.341994, 0.8078431, 0, 1, 1,
0.8518628, -0.08877341, 1.98095, 0.8117647, 0, 1, 1,
0.8552395, -1.024892, 3.930698, 0.8196079, 0, 1, 1,
0.8811572, -0.2652487, 0.8297091, 0.8235294, 0, 1, 1,
0.8841728, -1.081322, 3.229265, 0.8313726, 0, 1, 1,
0.8916196, 0.3709555, 0.9538569, 0.8352941, 0, 1, 1,
0.8937401, 1.399811, 2.429195, 0.8431373, 0, 1, 1,
0.8948386, 0.2461223, 2.50334, 0.8470588, 0, 1, 1,
0.8968781, -0.06822724, 2.739614, 0.854902, 0, 1, 1,
0.9002357, -0.1043204, 0.01619801, 0.8588235, 0, 1, 1,
0.9005516, 0.1532027, 2.361144, 0.8666667, 0, 1, 1,
0.9094066, -1.306258, 2.051541, 0.8705882, 0, 1, 1,
0.9170811, 0.8417811, -0.4347045, 0.8784314, 0, 1, 1,
0.9175127, 1.216507, 0.1577122, 0.8823529, 0, 1, 1,
0.9286509, 0.9693797, 1.089799, 0.8901961, 0, 1, 1,
0.9348298, -0.268277, 0.4403791, 0.8941177, 0, 1, 1,
0.9403281, 1.585134, 0.957722, 0.9019608, 0, 1, 1,
0.9547641, 0.5938834, -0.3433127, 0.9098039, 0, 1, 1,
0.9570098, -0.3114347, 0.2799788, 0.9137255, 0, 1, 1,
0.9584765, 1.159346, -0.1437541, 0.9215686, 0, 1, 1,
0.9644775, -0.07401337, 1.289949, 0.9254902, 0, 1, 1,
0.9649752, -2.706947, 4.775286, 0.9333333, 0, 1, 1,
0.9657043, 0.2356503, 1.126081, 0.9372549, 0, 1, 1,
0.9679927, 1.043023, 1.303603, 0.945098, 0, 1, 1,
0.9684511, 0.2314181, 3.446987, 0.9490196, 0, 1, 1,
0.9703395, -0.2135571, 2.319353, 0.9568627, 0, 1, 1,
0.9767334, 1.14949, 2.434818, 0.9607843, 0, 1, 1,
0.9773371, 1.751285, 0.3111493, 0.9686275, 0, 1, 1,
0.9945046, -1.092146, 0.6156973, 0.972549, 0, 1, 1,
0.9946587, -0.4764172, 1.560858, 0.9803922, 0, 1, 1,
0.9954931, -0.3602664, 2.545583, 0.9843137, 0, 1, 1,
0.9959648, 0.381459, 0.1661945, 0.9921569, 0, 1, 1,
1.005881, -1.095678, 2.144258, 0.9960784, 0, 1, 1,
1.006576, -1.298783, 2.3561, 1, 0, 0.9960784, 1,
1.011124, -0.1001459, 1.284936, 1, 0, 0.9882353, 1,
1.019304, 1.776924, -0.2748153, 1, 0, 0.9843137, 1,
1.029053, -0.5087419, 2.106833, 1, 0, 0.9764706, 1,
1.03748, -0.7930053, 1.128563, 1, 0, 0.972549, 1,
1.04171, -0.9931464, 2.566648, 1, 0, 0.9647059, 1,
1.04567, 1.517195, 1.321007, 1, 0, 0.9607843, 1,
1.045768, 1.74658, 1.142615, 1, 0, 0.9529412, 1,
1.048374, 1.526885, 0.9404032, 1, 0, 0.9490196, 1,
1.050471, -0.02411868, 0.438856, 1, 0, 0.9411765, 1,
1.050687, -1.362085, 4.815303, 1, 0, 0.9372549, 1,
1.052181, -0.5069765, 2.453208, 1, 0, 0.9294118, 1,
1.068281, -0.7964694, 2.514652, 1, 0, 0.9254902, 1,
1.071763, 1.268973, -0.8223464, 1, 0, 0.9176471, 1,
1.075716, -0.2062476, 1.160023, 1, 0, 0.9137255, 1,
1.07746, 1.08991, -0.3219337, 1, 0, 0.9058824, 1,
1.089429, 0.8749298, 0.4274564, 1, 0, 0.9019608, 1,
1.092638, -0.5353209, 0.5829057, 1, 0, 0.8941177, 1,
1.093153, -0.9784949, 3.79663, 1, 0, 0.8862745, 1,
1.093373, 0.1920392, 2.200704, 1, 0, 0.8823529, 1,
1.102317, -0.2145346, 3.657965, 1, 0, 0.8745098, 1,
1.102475, 0.7155176, 2.003478, 1, 0, 0.8705882, 1,
1.108939, -2.211403, 3.154194, 1, 0, 0.8627451, 1,
1.109223, 2.82574, -0.1765334, 1, 0, 0.8588235, 1,
1.112037, 0.3640607, 0.5017022, 1, 0, 0.8509804, 1,
1.11812, -0.6913815, 2.50781, 1, 0, 0.8470588, 1,
1.123259, -0.4931416, 0.418921, 1, 0, 0.8392157, 1,
1.123437, 1.930174, 1.152179, 1, 0, 0.8352941, 1,
1.124555, 0.1701288, 1.441269, 1, 0, 0.827451, 1,
1.124885, -0.3289475, 1.823304, 1, 0, 0.8235294, 1,
1.126005, -0.05418314, 2.086968, 1, 0, 0.8156863, 1,
1.12914, 0.7431884, 0.3150124, 1, 0, 0.8117647, 1,
1.129497, 0.5092673, 0.8584589, 1, 0, 0.8039216, 1,
1.130869, -1.180573, 2.749402, 1, 0, 0.7960784, 1,
1.131476, 0.4839236, 0.4044754, 1, 0, 0.7921569, 1,
1.137221, -0.7569231, 3.157719, 1, 0, 0.7843137, 1,
1.142656, 0.723204, 0.7126252, 1, 0, 0.7803922, 1,
1.142851, -1.892039, 1.827338, 1, 0, 0.772549, 1,
1.146463, 0.2544041, 2.307051, 1, 0, 0.7686275, 1,
1.148064, 1.307119, -0.2207619, 1, 0, 0.7607843, 1,
1.157896, -0.4776588, 3.160633, 1, 0, 0.7568628, 1,
1.162292, 0.2421517, 0.4039917, 1, 0, 0.7490196, 1,
1.163176, 1.347471, 0.2944195, 1, 0, 0.7450981, 1,
1.165606, -0.5132799, 1.234095, 1, 0, 0.7372549, 1,
1.174678, 2.447771, 0.9558483, 1, 0, 0.7333333, 1,
1.182931, -1.669569, 1.75675, 1, 0, 0.7254902, 1,
1.184357, 1.565722, 0.1756407, 1, 0, 0.7215686, 1,
1.192382, -0.01012502, 0.1756594, 1, 0, 0.7137255, 1,
1.192688, -1.009075, 1.151165, 1, 0, 0.7098039, 1,
1.19319, 0.5454428, 1.070243, 1, 0, 0.7019608, 1,
1.198051, -0.560006, 1.412917, 1, 0, 0.6941177, 1,
1.210585, -0.5214085, 0.3526846, 1, 0, 0.6901961, 1,
1.213655, 1.915368, 0.8993894, 1, 0, 0.682353, 1,
1.214878, 0.2984462, 1.510832, 1, 0, 0.6784314, 1,
1.21648, -0.6650998, 0.579388, 1, 0, 0.6705883, 1,
1.216659, 0.4545855, 2.296752, 1, 0, 0.6666667, 1,
1.217205, -0.09095544, 2.431552, 1, 0, 0.6588235, 1,
1.22083, 0.4648648, 1.290641, 1, 0, 0.654902, 1,
1.225506, 0.2376903, 2.723064, 1, 0, 0.6470588, 1,
1.227871, 1.405132, 0.6897269, 1, 0, 0.6431373, 1,
1.231254, 1.005375, 2.403951, 1, 0, 0.6352941, 1,
1.236034, 0.0362907, 2.487371, 1, 0, 0.6313726, 1,
1.239895, -2.257357, 2.358298, 1, 0, 0.6235294, 1,
1.249189, 0.5297425, 0.5331649, 1, 0, 0.6196079, 1,
1.250872, 0.7701863, 0.4729842, 1, 0, 0.6117647, 1,
1.251677, 1.859454, 0.4855669, 1, 0, 0.6078432, 1,
1.259882, 0.5818167, 0.5881432, 1, 0, 0.6, 1,
1.263131, 1.706176, 1.583044, 1, 0, 0.5921569, 1,
1.266042, -1.983291, 3.443074, 1, 0, 0.5882353, 1,
1.269119, 0.9978967, 0.5328994, 1, 0, 0.5803922, 1,
1.279494, 0.2914622, 2.013714, 1, 0, 0.5764706, 1,
1.283641, 0.1000964, 1.292498, 1, 0, 0.5686275, 1,
1.285817, -0.2819304, -0.05639092, 1, 0, 0.5647059, 1,
1.286454, -0.8866264, 2.693229, 1, 0, 0.5568628, 1,
1.288265, 0.1672668, 1.293317, 1, 0, 0.5529412, 1,
1.292289, 0.1678, 2.507752, 1, 0, 0.5450981, 1,
1.313386, 0.08660787, 1.068854, 1, 0, 0.5411765, 1,
1.317874, 0.842371, 0.8637447, 1, 0, 0.5333334, 1,
1.321704, -1.372619, 4.204174, 1, 0, 0.5294118, 1,
1.325838, 0.8100773, 1.852788, 1, 0, 0.5215687, 1,
1.328943, -2.943118, 4.240682, 1, 0, 0.5176471, 1,
1.329774, -0.6541013, 2.63665, 1, 0, 0.509804, 1,
1.335317, -1.638536, 2.386324, 1, 0, 0.5058824, 1,
1.337657, -0.9335185, 1.536528, 1, 0, 0.4980392, 1,
1.340583, -0.9961019, 1.574986, 1, 0, 0.4901961, 1,
1.355338, -0.1424427, 0.6216612, 1, 0, 0.4862745, 1,
1.355683, -1.51769, 2.50745, 1, 0, 0.4784314, 1,
1.355715, -1.025721, 1.974501, 1, 0, 0.4745098, 1,
1.361589, 2.392777, 0.7533837, 1, 0, 0.4666667, 1,
1.366935, -1.310969, 3.197034, 1, 0, 0.4627451, 1,
1.389652, -1.189178, 1.54034, 1, 0, 0.454902, 1,
1.389752, -0.372731, 2.06706, 1, 0, 0.4509804, 1,
1.403607, -0.4032053, 3.325667, 1, 0, 0.4431373, 1,
1.415428, 0.4370055, 0.9490118, 1, 0, 0.4392157, 1,
1.429152, 0.05495065, 0.3410973, 1, 0, 0.4313726, 1,
1.430062, 0.650753, 2.595218, 1, 0, 0.427451, 1,
1.462162, -1.612381, 2.770563, 1, 0, 0.4196078, 1,
1.46435, -0.7919566, 2.681979, 1, 0, 0.4156863, 1,
1.46975, 0.005106984, 0.5365633, 1, 0, 0.4078431, 1,
1.469968, 0.7251807, 1.285086, 1, 0, 0.4039216, 1,
1.483442, 0.8940285, 1.872481, 1, 0, 0.3960784, 1,
1.507672, 1.399026, 1.86723, 1, 0, 0.3882353, 1,
1.512914, 0.8749005, 2.913053, 1, 0, 0.3843137, 1,
1.519564, 0.04615841, 1.338325, 1, 0, 0.3764706, 1,
1.521606, 1.264596, 1.635149, 1, 0, 0.372549, 1,
1.52398, 0.08987842, 1.881314, 1, 0, 0.3647059, 1,
1.541373, 0.6644319, -1.675161, 1, 0, 0.3607843, 1,
1.543954, 0.2660143, 1.229019, 1, 0, 0.3529412, 1,
1.562654, -1.937986, 2.490338, 1, 0, 0.3490196, 1,
1.583251, -1.939708, 2.087291, 1, 0, 0.3411765, 1,
1.589085, 1.499576, -1.582353, 1, 0, 0.3372549, 1,
1.598327, -1.290312, 2.512568, 1, 0, 0.3294118, 1,
1.606264, -0.5971804, 1.976754, 1, 0, 0.3254902, 1,
1.616475, 0.6894031, 0.7397982, 1, 0, 0.3176471, 1,
1.62292, -0.000258419, 1.440137, 1, 0, 0.3137255, 1,
1.626632, 0.2211964, 2.053152, 1, 0, 0.3058824, 1,
1.638003, 1.199447, 1.424382, 1, 0, 0.2980392, 1,
1.657968, 0.1093146, 1.166286, 1, 0, 0.2941177, 1,
1.680844, -0.01381435, 2.163953, 1, 0, 0.2862745, 1,
1.701895, -0.9481326, 1.599349, 1, 0, 0.282353, 1,
1.70913, 0.07191112, 1.353554, 1, 0, 0.2745098, 1,
1.709854, -0.6837519, 2.159515, 1, 0, 0.2705882, 1,
1.739031, 0.9805872, -0.1287595, 1, 0, 0.2627451, 1,
1.753872, 0.8421126, 2.637007, 1, 0, 0.2588235, 1,
1.771246, -0.2451226, 1.657117, 1, 0, 0.2509804, 1,
1.774507, -0.3666965, 0.2281022, 1, 0, 0.2470588, 1,
1.775891, -1.744786, 2.974321, 1, 0, 0.2392157, 1,
1.803836, -1.755024, 2.49819, 1, 0, 0.2352941, 1,
1.813516, -0.9255851, 1.343412, 1, 0, 0.227451, 1,
1.827876, -1.457899, 3.373893, 1, 0, 0.2235294, 1,
1.838319, -1.128183, 1.04161, 1, 0, 0.2156863, 1,
1.840061, -0.2033956, 1.281021, 1, 0, 0.2117647, 1,
1.844772, -0.7967033, 2.4475, 1, 0, 0.2039216, 1,
1.887877, -0.1932831, 1.147199, 1, 0, 0.1960784, 1,
1.890854, 0.2478344, 1.046775, 1, 0, 0.1921569, 1,
1.898461, -0.1727616, 2.048, 1, 0, 0.1843137, 1,
1.915427, -1.03933, 2.219557, 1, 0, 0.1803922, 1,
1.956558, -0.9618906, 1.539202, 1, 0, 0.172549, 1,
1.963867, 0.2392442, -1.280312, 1, 0, 0.1686275, 1,
1.980393, 0.6500344, 0.6476756, 1, 0, 0.1607843, 1,
2.01992, -0.766676, 3.847041, 1, 0, 0.1568628, 1,
2.022701, -0.2687222, 1.432483, 1, 0, 0.1490196, 1,
2.04388, -0.7421362, 2.768315, 1, 0, 0.145098, 1,
2.074205, 1.596215, 0.1090297, 1, 0, 0.1372549, 1,
2.095845, -1.821955, 0.8939993, 1, 0, 0.1333333, 1,
2.110376, -1.772177, 3.218115, 1, 0, 0.1254902, 1,
2.11362, 0.2473797, -0.04093412, 1, 0, 0.1215686, 1,
2.14719, 1.728285, 0.3976016, 1, 0, 0.1137255, 1,
2.218305, 2.319496, 0.4589309, 1, 0, 0.1098039, 1,
2.230173, 1.330616, 2.166097, 1, 0, 0.1019608, 1,
2.252278, 1.599123, 1.568893, 1, 0, 0.09411765, 1,
2.268012, -1.691476, 2.506844, 1, 0, 0.09019608, 1,
2.279585, -0.2579932, 1.58369, 1, 0, 0.08235294, 1,
2.287336, 0.4082608, 1.709433, 1, 0, 0.07843138, 1,
2.340703, 1.267847, 1.609933, 1, 0, 0.07058824, 1,
2.423897, -0.005747118, 1.891356, 1, 0, 0.06666667, 1,
2.43384, -0.2142459, 0.5269665, 1, 0, 0.05882353, 1,
2.440279, -2.357721, 2.313016, 1, 0, 0.05490196, 1,
2.703864, -0.05604869, 1.043466, 1, 0, 0.04705882, 1,
2.723, -0.8668298, 3.190956, 1, 0, 0.04313726, 1,
2.79623, 0.05142597, 0.6905357, 1, 0, 0.03529412, 1,
3.101143, 0.0657242, 1.500104, 1, 0, 0.03137255, 1,
3.11482, 1.302138, 1.751409, 1, 0, 0.02352941, 1,
3.16013, 0.4969996, 0.4732141, 1, 0, 0.01960784, 1,
3.289048, 1.925839, 2.643425, 1, 0, 0.01176471, 1,
3.461711, 0.2673865, 2.219404, 1, 0, 0.007843138, 1
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
0.1844854, -3.980347, -7.630457, 0, -0.5, 0.5, 0.5,
0.1844854, -3.980347, -7.630457, 1, -0.5, 0.5, 0.5,
0.1844854, -3.980347, -7.630457, 1, 1.5, 0.5, 0.5,
0.1844854, -3.980347, -7.630457, 0, 1.5, 0.5, 0.5
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
-4.20372, 0.1165546, -7.630457, 0, -0.5, 0.5, 0.5,
-4.20372, 0.1165546, -7.630457, 1, -0.5, 0.5, 0.5,
-4.20372, 0.1165546, -7.630457, 1, 1.5, 0.5, 0.5,
-4.20372, 0.1165546, -7.630457, 0, 1.5, 0.5, 0.5
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
-4.20372, -3.980347, 0.198719, 0, -0.5, 0.5, 0.5,
-4.20372, -3.980347, 0.198719, 1, -0.5, 0.5, 0.5,
-4.20372, -3.980347, 0.198719, 1, 1.5, 0.5, 0.5,
-4.20372, -3.980347, 0.198719, 0, 1.5, 0.5, 0.5
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
-3, -3.034908, -5.823724,
3, -3.034908, -5.823724,
-3, -3.034908, -5.823724,
-3, -3.192481, -6.124846,
-2, -3.034908, -5.823724,
-2, -3.192481, -6.124846,
-1, -3.034908, -5.823724,
-1, -3.192481, -6.124846,
0, -3.034908, -5.823724,
0, -3.192481, -6.124846,
1, -3.034908, -5.823724,
1, -3.192481, -6.124846,
2, -3.034908, -5.823724,
2, -3.192481, -6.124846,
3, -3.034908, -5.823724,
3, -3.192481, -6.124846
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
-3, -3.507627, -6.72709, 0, -0.5, 0.5, 0.5,
-3, -3.507627, -6.72709, 1, -0.5, 0.5, 0.5,
-3, -3.507627, -6.72709, 1, 1.5, 0.5, 0.5,
-3, -3.507627, -6.72709, 0, 1.5, 0.5, 0.5,
-2, -3.507627, -6.72709, 0, -0.5, 0.5, 0.5,
-2, -3.507627, -6.72709, 1, -0.5, 0.5, 0.5,
-2, -3.507627, -6.72709, 1, 1.5, 0.5, 0.5,
-2, -3.507627, -6.72709, 0, 1.5, 0.5, 0.5,
-1, -3.507627, -6.72709, 0, -0.5, 0.5, 0.5,
-1, -3.507627, -6.72709, 1, -0.5, 0.5, 0.5,
-1, -3.507627, -6.72709, 1, 1.5, 0.5, 0.5,
-1, -3.507627, -6.72709, 0, 1.5, 0.5, 0.5,
0, -3.507627, -6.72709, 0, -0.5, 0.5, 0.5,
0, -3.507627, -6.72709, 1, -0.5, 0.5, 0.5,
0, -3.507627, -6.72709, 1, 1.5, 0.5, 0.5,
0, -3.507627, -6.72709, 0, 1.5, 0.5, 0.5,
1, -3.507627, -6.72709, 0, -0.5, 0.5, 0.5,
1, -3.507627, -6.72709, 1, -0.5, 0.5, 0.5,
1, -3.507627, -6.72709, 1, 1.5, 0.5, 0.5,
1, -3.507627, -6.72709, 0, 1.5, 0.5, 0.5,
2, -3.507627, -6.72709, 0, -0.5, 0.5, 0.5,
2, -3.507627, -6.72709, 1, -0.5, 0.5, 0.5,
2, -3.507627, -6.72709, 1, 1.5, 0.5, 0.5,
2, -3.507627, -6.72709, 0, 1.5, 0.5, 0.5,
3, -3.507627, -6.72709, 0, -0.5, 0.5, 0.5,
3, -3.507627, -6.72709, 1, -0.5, 0.5, 0.5,
3, -3.507627, -6.72709, 1, 1.5, 0.5, 0.5,
3, -3.507627, -6.72709, 0, 1.5, 0.5, 0.5
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
-3.191057, -2, -5.823724,
-3.191057, 3, -5.823724,
-3.191057, -2, -5.823724,
-3.359834, -2, -6.124846,
-3.191057, -1, -5.823724,
-3.359834, -1, -6.124846,
-3.191057, 0, -5.823724,
-3.359834, 0, -6.124846,
-3.191057, 1, -5.823724,
-3.359834, 1, -6.124846,
-3.191057, 2, -5.823724,
-3.359834, 2, -6.124846,
-3.191057, 3, -5.823724,
-3.359834, 3, -6.124846
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
-3.697389, -2, -6.72709, 0, -0.5, 0.5, 0.5,
-3.697389, -2, -6.72709, 1, -0.5, 0.5, 0.5,
-3.697389, -2, -6.72709, 1, 1.5, 0.5, 0.5,
-3.697389, -2, -6.72709, 0, 1.5, 0.5, 0.5,
-3.697389, -1, -6.72709, 0, -0.5, 0.5, 0.5,
-3.697389, -1, -6.72709, 1, -0.5, 0.5, 0.5,
-3.697389, -1, -6.72709, 1, 1.5, 0.5, 0.5,
-3.697389, -1, -6.72709, 0, 1.5, 0.5, 0.5,
-3.697389, 0, -6.72709, 0, -0.5, 0.5, 0.5,
-3.697389, 0, -6.72709, 1, -0.5, 0.5, 0.5,
-3.697389, 0, -6.72709, 1, 1.5, 0.5, 0.5,
-3.697389, 0, -6.72709, 0, 1.5, 0.5, 0.5,
-3.697389, 1, -6.72709, 0, -0.5, 0.5, 0.5,
-3.697389, 1, -6.72709, 1, -0.5, 0.5, 0.5,
-3.697389, 1, -6.72709, 1, 1.5, 0.5, 0.5,
-3.697389, 1, -6.72709, 0, 1.5, 0.5, 0.5,
-3.697389, 2, -6.72709, 0, -0.5, 0.5, 0.5,
-3.697389, 2, -6.72709, 1, -0.5, 0.5, 0.5,
-3.697389, 2, -6.72709, 1, 1.5, 0.5, 0.5,
-3.697389, 2, -6.72709, 0, 1.5, 0.5, 0.5,
-3.697389, 3, -6.72709, 0, -0.5, 0.5, 0.5,
-3.697389, 3, -6.72709, 1, -0.5, 0.5, 0.5,
-3.697389, 3, -6.72709, 1, 1.5, 0.5, 0.5,
-3.697389, 3, -6.72709, 0, 1.5, 0.5, 0.5
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
-3.191057, -3.034908, -4,
-3.191057, -3.034908, 6,
-3.191057, -3.034908, -4,
-3.359834, -3.192481, -4,
-3.191057, -3.034908, -2,
-3.359834, -3.192481, -2,
-3.191057, -3.034908, 0,
-3.359834, -3.192481, 0,
-3.191057, -3.034908, 2,
-3.359834, -3.192481, 2,
-3.191057, -3.034908, 4,
-3.359834, -3.192481, 4,
-3.191057, -3.034908, 6,
-3.359834, -3.192481, 6
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
"4",
"6"
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
-3.697389, -3.507627, -4, 0, -0.5, 0.5, 0.5,
-3.697389, -3.507627, -4, 1, -0.5, 0.5, 0.5,
-3.697389, -3.507627, -4, 1, 1.5, 0.5, 0.5,
-3.697389, -3.507627, -4, 0, 1.5, 0.5, 0.5,
-3.697389, -3.507627, -2, 0, -0.5, 0.5, 0.5,
-3.697389, -3.507627, -2, 1, -0.5, 0.5, 0.5,
-3.697389, -3.507627, -2, 1, 1.5, 0.5, 0.5,
-3.697389, -3.507627, -2, 0, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 0, 0, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 0, 1, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 0, 1, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 0, 0, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 2, 0, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 2, 1, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 2, 1, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 2, 0, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 4, 0, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 4, 1, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 4, 1, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 4, 0, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 6, 0, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 6, 1, -0.5, 0.5, 0.5,
-3.697389, -3.507627, 6, 1, 1.5, 0.5, 0.5,
-3.697389, -3.507627, 6, 0, 1.5, 0.5, 0.5
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
-3.191057, -3.034908, -5.823724,
-3.191057, 3.268017, -5.823724,
-3.191057, -3.034908, 6.221162,
-3.191057, 3.268017, 6.221162,
-3.191057, -3.034908, -5.823724,
-3.191057, -3.034908, 6.221162,
-3.191057, 3.268017, -5.823724,
-3.191057, 3.268017, 6.221162,
-3.191057, -3.034908, -5.823724,
3.560028, -3.034908, -5.823724,
-3.191057, -3.034908, 6.221162,
3.560028, -3.034908, 6.221162,
-3.191057, 3.268017, -5.823724,
3.560028, 3.268017, -5.823724,
-3.191057, 3.268017, 6.221162,
3.560028, 3.268017, 6.221162,
3.560028, -3.034908, -5.823724,
3.560028, 3.268017, -5.823724,
3.560028, -3.034908, 6.221162,
3.560028, 3.268017, 6.221162,
3.560028, -3.034908, -5.823724,
3.560028, -3.034908, 6.221162,
3.560028, 3.268017, -5.823724,
3.560028, 3.268017, 6.221162
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
var radius = 8.104962;
var distance = 36.05989;
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
mvMatrix.translate( -0.1844854, -0.1165546, -0.198719 );
mvMatrix.scale( 1.29805, 1.390345, 0.7275489 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.05989);
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
carboxy_methylaminom<-read.table("carboxy_methylaminom.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carboxy_methylaminom$V2
```

```
## Error in eval(expr, envir, enclos): object 'carboxy_methylaminom' not found
```

```r
y<-carboxy_methylaminom$V3
```

```
## Error in eval(expr, envir, enclos): object 'carboxy_methylaminom' not found
```

```r
z<-carboxy_methylaminom$V4
```

```
## Error in eval(expr, envir, enclos): object 'carboxy_methylaminom' not found
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
-3.092741, -0.2692369, -2.561663, 0, 0, 1, 1, 1,
-2.812454, -1.297133, -0.8398058, 1, 0, 0, 1, 1,
-2.70607, -1.162332, -1.109288, 1, 0, 0, 1, 1,
-2.698684, -1.104887, -1.298344, 1, 0, 0, 1, 1,
-2.656373, -1.190331, -1.55471, 1, 0, 0, 1, 1,
-2.49891, 0.6063464, -0.4403544, 1, 0, 0, 1, 1,
-2.465984, -1.123501, -2.893032, 0, 0, 0, 1, 1,
-2.429421, -1.14797, -2.34631, 0, 0, 0, 1, 1,
-2.332081, -0.546297, -2.546071, 0, 0, 0, 1, 1,
-2.276351, 0.9535421, -2.158098, 0, 0, 0, 1, 1,
-2.215223, 0.03892627, -1.530216, 0, 0, 0, 1, 1,
-2.198676, 1.622007, 2.51248, 0, 0, 0, 1, 1,
-2.161831, 2.177755, -1.0843, 0, 0, 0, 1, 1,
-2.156491, 0.1504904, -3.060658, 1, 1, 1, 1, 1,
-2.143843, 0.5773957, -0.1438613, 1, 1, 1, 1, 1,
-2.071603, -0.06395094, -2.634898, 1, 1, 1, 1, 1,
-2.025243, 0.1918868, -0.716961, 1, 1, 1, 1, 1,
-2.004221, -0.2254045, -2.416238, 1, 1, 1, 1, 1,
-1.99792, -0.498864, -1.076392, 1, 1, 1, 1, 1,
-1.993953, -1.554801, -2.65466, 1, 1, 1, 1, 1,
-1.985655, -0.297128, -2.667603, 1, 1, 1, 1, 1,
-1.944321, -2.113064, -0.2843843, 1, 1, 1, 1, 1,
-1.917929, 0.9361436, -0.6647455, 1, 1, 1, 1, 1,
-1.89759, 1.22312, -1.779822, 1, 1, 1, 1, 1,
-1.896134, -0.5277547, -0.918871, 1, 1, 1, 1, 1,
-1.887231, 0.9135939, -0.8071911, 1, 1, 1, 1, 1,
-1.872519, -2.185071, -2.087821, 1, 1, 1, 1, 1,
-1.835753, 0.09032359, -1.472017, 1, 1, 1, 1, 1,
-1.832983, -0.6757504, -1.274746, 0, 0, 1, 1, 1,
-1.7909, 0.5252651, -1.750844, 1, 0, 0, 1, 1,
-1.786827, -0.146196, -1.618724, 1, 0, 0, 1, 1,
-1.785357, 1.519483, -0.8341067, 1, 0, 0, 1, 1,
-1.74964, 0.01217344, -1.841282, 1, 0, 0, 1, 1,
-1.743445, -0.9042397, -2.328349, 1, 0, 0, 1, 1,
-1.723381, 1.414203, -0.4838105, 0, 0, 0, 1, 1,
-1.707542, -1.188499, -1.864511, 0, 0, 0, 1, 1,
-1.706152, 1.279056, 0.4104769, 0, 0, 0, 1, 1,
-1.70557, -0.2266413, -1.719359, 0, 0, 0, 1, 1,
-1.681658, 1.316818, -2.043029, 0, 0, 0, 1, 1,
-1.673049, -1.114915, -4.266285, 0, 0, 0, 1, 1,
-1.666374, 1.119416, -1.51995, 0, 0, 0, 1, 1,
-1.626471, 2.00045, -1.352754, 1, 1, 1, 1, 1,
-1.616435, 0.001483943, -0.5311127, 1, 1, 1, 1, 1,
-1.605473, 0.4358366, -0.723467, 1, 1, 1, 1, 1,
-1.602381, -0.008423868, -2.212013, 1, 1, 1, 1, 1,
-1.596177, -0.4713401, -2.291674, 1, 1, 1, 1, 1,
-1.596083, 0.5637214, -0.6645289, 1, 1, 1, 1, 1,
-1.59545, 0.953443, -1.706403, 1, 1, 1, 1, 1,
-1.591781, 0.4594727, -2.101711, 1, 1, 1, 1, 1,
-1.588196, 1.347831, -0.07172086, 1, 1, 1, 1, 1,
-1.587538, 0.147253, -1.043181, 1, 1, 1, 1, 1,
-1.585334, -2.067129, -2.617955, 1, 1, 1, 1, 1,
-1.577427, 1.067031, -1.681037, 1, 1, 1, 1, 1,
-1.564826, 1.516006, -0.2513438, 1, 1, 1, 1, 1,
-1.53971, 0.1486789, -2.635215, 1, 1, 1, 1, 1,
-1.527051, -0.3677953, -1.234632, 1, 1, 1, 1, 1,
-1.522427, 0.301332, -1.280138, 0, 0, 1, 1, 1,
-1.513685, -0.9691548, -1.731495, 1, 0, 0, 1, 1,
-1.503453, -1.588698, -4.017589, 1, 0, 0, 1, 1,
-1.489319, -0.9836838, -2.433506, 1, 0, 0, 1, 1,
-1.477617, -0.7312982, -1.750145, 1, 0, 0, 1, 1,
-1.469528, -0.06509753, -1.021267, 1, 0, 0, 1, 1,
-1.469287, 0.406047, -1.668072, 0, 0, 0, 1, 1,
-1.467366, 2.200478, -1.416688, 0, 0, 0, 1, 1,
-1.446548, 0.3647496, -2.171855, 0, 0, 0, 1, 1,
-1.434897, 0.5145464, -1.713053, 0, 0, 0, 1, 1,
-1.429386, 0.1774731, 0.1625008, 0, 0, 0, 1, 1,
-1.424044, 0.6562049, 0.9375495, 0, 0, 0, 1, 1,
-1.42009, 1.589732, -1.328957, 0, 0, 0, 1, 1,
-1.415921, 0.7719793, -1.053607, 1, 1, 1, 1, 1,
-1.404635, -1.067818, -1.995192, 1, 1, 1, 1, 1,
-1.393086, -0.7474023, -1.981227, 1, 1, 1, 1, 1,
-1.393043, 0.7421712, -1.930139, 1, 1, 1, 1, 1,
-1.378433, 1.894527, -1.136853, 1, 1, 1, 1, 1,
-1.370461, -1.56708, -2.081964, 1, 1, 1, 1, 1,
-1.365188, -0.5720942, -2.950372, 1, 1, 1, 1, 1,
-1.357074, 1.472914, -0.78216, 1, 1, 1, 1, 1,
-1.340957, -0.8580425, -2.888496, 1, 1, 1, 1, 1,
-1.337933, -0.3608725, -1.435482, 1, 1, 1, 1, 1,
-1.335334, -1.098179, -0.7035107, 1, 1, 1, 1, 1,
-1.324949, 1.083016, -1.372737, 1, 1, 1, 1, 1,
-1.324601, 0.1583052, -1.139371, 1, 1, 1, 1, 1,
-1.313959, 0.6388748, 0.9855065, 1, 1, 1, 1, 1,
-1.295908, 0.3738166, -1.961279, 1, 1, 1, 1, 1,
-1.295141, -0.1800078, -2.843475, 0, 0, 1, 1, 1,
-1.294068, 1.048697, -0.05573194, 1, 0, 0, 1, 1,
-1.283388, 0.2235128, -2.46265, 1, 0, 0, 1, 1,
-1.283152, 1.63195, -3.045848, 1, 0, 0, 1, 1,
-1.27517, -1.123068, -1.005948, 1, 0, 0, 1, 1,
-1.274639, 0.4565303, -1.727734, 1, 0, 0, 1, 1,
-1.25363, 2.115129, -1.447888, 0, 0, 0, 1, 1,
-1.251688, 0.1814396, -0.8452541, 0, 0, 0, 1, 1,
-1.246162, -0.4625354, -1.565781, 0, 0, 0, 1, 1,
-1.243633, -0.6454849, -2.288612, 0, 0, 0, 1, 1,
-1.24308, 0.3593523, -2.970431, 0, 0, 0, 1, 1,
-1.242807, 1.102769, 0.2759633, 0, 0, 0, 1, 1,
-1.224705, 0.9543159, -0.6894166, 0, 0, 0, 1, 1,
-1.223178, 0.3239928, -0.213279, 1, 1, 1, 1, 1,
-1.2178, -1.116923, -1.698559, 1, 1, 1, 1, 1,
-1.21473, 0.6690704, -1.497791, 1, 1, 1, 1, 1,
-1.210947, -0.1100979, -1.442341, 1, 1, 1, 1, 1,
-1.208315, 0.1708309, -1.180278, 1, 1, 1, 1, 1,
-1.20729, -1.005905, -4.298705, 1, 1, 1, 1, 1,
-1.200791, -1.486143, -2.870097, 1, 1, 1, 1, 1,
-1.197169, 0.4348156, -0.5949966, 1, 1, 1, 1, 1,
-1.195992, -0.7213623, -3.786498, 1, 1, 1, 1, 1,
-1.193835, -2.280965, -2.424329, 1, 1, 1, 1, 1,
-1.192698, 1.578501, 0.1358773, 1, 1, 1, 1, 1,
-1.183606, -0.8840051, -4.447997, 1, 1, 1, 1, 1,
-1.182703, -1.123855, -2.629206, 1, 1, 1, 1, 1,
-1.180983, 0.3981213, -1.292256, 1, 1, 1, 1, 1,
-1.176057, 1.361466, 0.9730526, 1, 1, 1, 1, 1,
-1.171566, 0.7191868, -0.5370268, 0, 0, 1, 1, 1,
-1.168302, 0.1667936, -1.590306, 1, 0, 0, 1, 1,
-1.162707, -0.7044498, -0.6285741, 1, 0, 0, 1, 1,
-1.130268, -0.06374278, -1.699677, 1, 0, 0, 1, 1,
-1.124707, 0.2742872, -2.435393, 1, 0, 0, 1, 1,
-1.120551, 1.006316, -2.923124, 1, 0, 0, 1, 1,
-1.114184, 0.1825487, -1.297716, 0, 0, 0, 1, 1,
-1.113463, 1.926565, -2.637734, 0, 0, 0, 1, 1,
-1.104972, -0.6191767, -2.645558, 0, 0, 0, 1, 1,
-1.099199, 1.333587, -0.008726805, 0, 0, 0, 1, 1,
-1.095011, 0.3514132, -0.8150549, 0, 0, 0, 1, 1,
-1.09489, 1.596686, -0.6324433, 0, 0, 0, 1, 1,
-1.094331, 0.6820365, 0.7923257, 0, 0, 0, 1, 1,
-1.089525, -0.6590571, -2.127121, 1, 1, 1, 1, 1,
-1.089106, 0.09554587, -2.263654, 1, 1, 1, 1, 1,
-1.078551, -1.404411, -2.761147, 1, 1, 1, 1, 1,
-1.072089, -0.300287, -0.6038128, 1, 1, 1, 1, 1,
-1.066365, 2.203857, -1.385394, 1, 1, 1, 1, 1,
-1.065007, -1.322256, -4.121149, 1, 1, 1, 1, 1,
-1.058037, -0.4352687, -2.503676, 1, 1, 1, 1, 1,
-1.045627, 0.2409096, -1.021147, 1, 1, 1, 1, 1,
-1.04371, 0.05647416, -1.153943, 1, 1, 1, 1, 1,
-1.041504, -0.8090971, -2.243257, 1, 1, 1, 1, 1,
-1.03979, -1.703169, -5.114089, 1, 1, 1, 1, 1,
-1.039496, -0.4296994, -2.456103, 1, 1, 1, 1, 1,
-1.02742, 0.2504375, -0.2506714, 1, 1, 1, 1, 1,
-1.026014, 0.1425221, -2.588212, 1, 1, 1, 1, 1,
-1.024564, 0.8965127, -0.6596147, 1, 1, 1, 1, 1,
-1.019425, -1.703543, -3.905056, 0, 0, 1, 1, 1,
-1.018987, -0.9281516, -3.634744, 1, 0, 0, 1, 1,
-1.015046, 0.1353833, -2.520583, 1, 0, 0, 1, 1,
-1.012337, 1.337022, -0.3296708, 1, 0, 0, 1, 1,
-1.009939, -0.09536237, -4.051374, 1, 0, 0, 1, 1,
-1.003739, -0.3838919, -2.261965, 1, 0, 0, 1, 1,
-1.003074, 1.217835, -0.9698043, 0, 0, 0, 1, 1,
-0.9998737, 0.8095817, -1.364658, 0, 0, 0, 1, 1,
-0.9991239, 0.7107335, -1.604094, 0, 0, 0, 1, 1,
-0.9989226, -0.6896489, -2.447097, 0, 0, 0, 1, 1,
-0.9983198, 1.166166, -0.7957211, 0, 0, 0, 1, 1,
-0.9979599, -0.2989885, -1.270222, 0, 0, 0, 1, 1,
-0.9886971, -1.39799, -4.470499, 0, 0, 0, 1, 1,
-0.9807659, 0.4477527, -2.84333, 1, 1, 1, 1, 1,
-0.977844, -0.5243776, -2.040995, 1, 1, 1, 1, 1,
-0.9776078, -0.4832198, -1.267057, 1, 1, 1, 1, 1,
-0.9760695, -0.3302786, -3.447068, 1, 1, 1, 1, 1,
-0.9698874, -0.3644053, -1.647966, 1, 1, 1, 1, 1,
-0.968899, -0.05702486, -0.8015875, 1, 1, 1, 1, 1,
-0.9675561, -0.4483643, -1.391138, 1, 1, 1, 1, 1,
-0.9653092, 0.4606431, -0.9410725, 1, 1, 1, 1, 1,
-0.9638563, -1.295534, -0.8208429, 1, 1, 1, 1, 1,
-0.9630023, -0.007647295, 0.2615727, 1, 1, 1, 1, 1,
-0.9512707, 0.1869098, -0.9168879, 1, 1, 1, 1, 1,
-0.949714, -0.9697562, -2.76123, 1, 1, 1, 1, 1,
-0.9451177, -0.5472782, -2.484339, 1, 1, 1, 1, 1,
-0.9451037, 0.6524218, -0.5120911, 1, 1, 1, 1, 1,
-0.9427291, 1.006799, -0.008667204, 1, 1, 1, 1, 1,
-0.9417843, -1.90661, -2.685453, 0, 0, 1, 1, 1,
-0.9386514, 0.4558228, -1.907762, 1, 0, 0, 1, 1,
-0.9365886, 0.06967577, 0.5776996, 1, 0, 0, 1, 1,
-0.9360861, -1.43644, -3.559555, 1, 0, 0, 1, 1,
-0.9278039, -1.292832, -3.245312, 1, 0, 0, 1, 1,
-0.9276686, -0.5648291, -0.9839767, 1, 0, 0, 1, 1,
-0.9257897, 1.023897, -1.318642, 0, 0, 0, 1, 1,
-0.9172848, 0.2508304, -1.021475, 0, 0, 0, 1, 1,
-0.9166489, -1.884983, -3.656611, 0, 0, 0, 1, 1,
-0.9149392, -0.5502052, -1.853272, 0, 0, 0, 1, 1,
-0.914458, 1.85905, -0.2278058, 0, 0, 0, 1, 1,
-0.9053411, -0.5255618, -1.558598, 0, 0, 0, 1, 1,
-0.903924, 1.19198, -0.3998489, 0, 0, 0, 1, 1,
-0.8990242, -0.02400581, -0.498922, 1, 1, 1, 1, 1,
-0.8953462, -0.1915326, -0.8594874, 1, 1, 1, 1, 1,
-0.8926589, -0.9976798, -1.386247, 1, 1, 1, 1, 1,
-0.8819261, -0.4208154, -1.024262, 1, 1, 1, 1, 1,
-0.8800433, -1.255249, -2.74776, 1, 1, 1, 1, 1,
-0.8728014, -0.9310271, -0.9810435, 1, 1, 1, 1, 1,
-0.8699641, 0.4372996, -1.933745, 1, 1, 1, 1, 1,
-0.8646156, 0.2138369, -2.164285, 1, 1, 1, 1, 1,
-0.8588783, -1.677502, -2.217406, 1, 1, 1, 1, 1,
-0.8583626, 2.044675, -0.8769019, 1, 1, 1, 1, 1,
-0.857232, 0.7917317, -0.7806286, 1, 1, 1, 1, 1,
-0.8518968, -0.4387935, -2.177243, 1, 1, 1, 1, 1,
-0.8508711, 1.692122, 1.237461, 1, 1, 1, 1, 1,
-0.843879, -0.8222182, -4.326016, 1, 1, 1, 1, 1,
-0.8415586, 1.274887, 0.5304933, 1, 1, 1, 1, 1,
-0.8366848, -0.7889699, -1.333843, 0, 0, 1, 1, 1,
-0.8358209, -0.7398087, -2.684227, 1, 0, 0, 1, 1,
-0.8348938, -0.9987447, -2.119323, 1, 0, 0, 1, 1,
-0.8334727, 2.027749, -0.8289708, 1, 0, 0, 1, 1,
-0.828906, 0.1293799, -1.319547, 1, 0, 0, 1, 1,
-0.8254368, -1.124734, -3.526149, 1, 0, 0, 1, 1,
-0.824972, -1.053103, -2.469339, 0, 0, 0, 1, 1,
-0.8247414, 0.4812841, -1.813453, 0, 0, 0, 1, 1,
-0.822127, -1.74409, -5.648313, 0, 0, 0, 1, 1,
-0.8212415, -0.4546776, -1.862565, 0, 0, 0, 1, 1,
-0.8171058, 1.428534, -1.242862, 0, 0, 0, 1, 1,
-0.8108066, -0.7303514, -2.550848, 0, 0, 0, 1, 1,
-0.8089537, 0.1163706, -2.904401, 0, 0, 0, 1, 1,
-0.8050772, -0.2340022, -2.109361, 1, 1, 1, 1, 1,
-0.8024762, 0.3415478, -2.353834, 1, 1, 1, 1, 1,
-0.7973138, -1.112774, -2.658485, 1, 1, 1, 1, 1,
-0.7948586, -0.4737987, -1.860929, 1, 1, 1, 1, 1,
-0.7932131, 0.9040231, -1.039177, 1, 1, 1, 1, 1,
-0.792189, 1.280978, -0.7717069, 1, 1, 1, 1, 1,
-0.78044, -0.4229873, -3.053947, 1, 1, 1, 1, 1,
-0.7800635, 1.88118, -0.2121108, 1, 1, 1, 1, 1,
-0.7798246, -0.9817203, -2.938124, 1, 1, 1, 1, 1,
-0.7765437, -1.112163, -2.28793, 1, 1, 1, 1, 1,
-0.7758914, -0.5716679, -1.804412, 1, 1, 1, 1, 1,
-0.7698271, -0.07481709, -2.053496, 1, 1, 1, 1, 1,
-0.7666237, -0.05227848, -0.6504561, 1, 1, 1, 1, 1,
-0.7655517, -0.7143764, -2.29004, 1, 1, 1, 1, 1,
-0.7631245, -0.9038339, -3.281612, 1, 1, 1, 1, 1,
-0.7625439, 1.575835, -1.800219, 0, 0, 1, 1, 1,
-0.7615674, 0.03784368, -0.9487032, 1, 0, 0, 1, 1,
-0.7605573, -0.81043, -1.948695, 1, 0, 0, 1, 1,
-0.7576486, -0.5769789, -3.35445, 1, 0, 0, 1, 1,
-0.7535804, 1.769305, -1.255478, 1, 0, 0, 1, 1,
-0.7470474, 0.3701164, -0.1870211, 1, 0, 0, 1, 1,
-0.737348, -0.9884626, -3.039811, 0, 0, 0, 1, 1,
-0.7367069, -1.390411, -2.852454, 0, 0, 0, 1, 1,
-0.7343963, 0.2322851, -0.5915971, 0, 0, 0, 1, 1,
-0.7304993, 0.1999403, -1.033394, 0, 0, 0, 1, 1,
-0.7279839, 0.1438058, 1.551515, 0, 0, 0, 1, 1,
-0.7274408, 1.781873, 0.2191535, 0, 0, 0, 1, 1,
-0.7059624, -1.154474, -1.691363, 0, 0, 0, 1, 1,
-0.7046798, -0.6662879, -3.03229, 1, 1, 1, 1, 1,
-0.7025983, -0.4770206, -2.890767, 1, 1, 1, 1, 1,
-0.7008554, 1.337034, -0.66127, 1, 1, 1, 1, 1,
-0.6905902, -0.1535773, -2.989433, 1, 1, 1, 1, 1,
-0.6856462, 0.3547717, -2.14276, 1, 1, 1, 1, 1,
-0.6809522, 0.2144408, 0.1710285, 1, 1, 1, 1, 1,
-0.6762489, 1.629813, 0.2713666, 1, 1, 1, 1, 1,
-0.6744186, 0.9448879, -1.017624, 1, 1, 1, 1, 1,
-0.6566752, 0.6715267, -1.218341, 1, 1, 1, 1, 1,
-0.6511481, -0.6991513, -2.582556, 1, 1, 1, 1, 1,
-0.6438472, -0.8192705, -3.288526, 1, 1, 1, 1, 1,
-0.642047, 1.288919, -0.1648004, 1, 1, 1, 1, 1,
-0.6378459, 0.7590997, -0.452237, 1, 1, 1, 1, 1,
-0.635184, -0.264879, -2.355301, 1, 1, 1, 1, 1,
-0.6333367, 0.1833136, -3.44194, 1, 1, 1, 1, 1,
-0.6290962, 1.797571, -0.5419135, 0, 0, 1, 1, 1,
-0.6279027, 1.018699, -1.551573, 1, 0, 0, 1, 1,
-0.6245469, 0.8042474, 2.355569, 1, 0, 0, 1, 1,
-0.6226097, 0.6120651, -0.6750197, 1, 0, 0, 1, 1,
-0.6213725, -0.07340596, -0.9969218, 1, 0, 0, 1, 1,
-0.6190619, 0.8820987, 0.3141173, 1, 0, 0, 1, 1,
-0.6125515, 0.3323914, -1.950165, 0, 0, 0, 1, 1,
-0.6120136, -0.6145259, -1.5458, 0, 0, 0, 1, 1,
-0.6115983, 2.621672, 0.3190568, 0, 0, 0, 1, 1,
-0.6074077, 0.1757194, -1.832766, 0, 0, 0, 1, 1,
-0.6057456, -0.06114119, -1.384436, 0, 0, 0, 1, 1,
-0.6042738, -0.4854368, -1.459288, 0, 0, 0, 1, 1,
-0.602591, -0.35329, -2.500743, 0, 0, 0, 1, 1,
-0.6017768, -1.173464, -3.411382, 1, 1, 1, 1, 1,
-0.5957586, -0.6999291, -2.16993, 1, 1, 1, 1, 1,
-0.5952803, 2.091702, 0.006003856, 1, 1, 1, 1, 1,
-0.5923991, -0.2477061, -1.690269, 1, 1, 1, 1, 1,
-0.588818, -0.1684608, -0.8186751, 1, 1, 1, 1, 1,
-0.5884023, -0.04184397, -1.903261, 1, 1, 1, 1, 1,
-0.5868476, -0.9796227, -3.602131, 1, 1, 1, 1, 1,
-0.5831848, 0.5702366, -1.492419, 1, 1, 1, 1, 1,
-0.5827895, 0.7503572, -0.6395884, 1, 1, 1, 1, 1,
-0.58134, -0.2174972, -2.746177, 1, 1, 1, 1, 1,
-0.5774347, -1.228345, -2.970782, 1, 1, 1, 1, 1,
-0.5761073, -0.07205907, -3.545547, 1, 1, 1, 1, 1,
-0.5743782, -0.2522992, -0.9173616, 1, 1, 1, 1, 1,
-0.5696502, 0.790578, -1.115919, 1, 1, 1, 1, 1,
-0.5648873, -0.6078607, -2.316884, 1, 1, 1, 1, 1,
-0.5618164, 1.68067, -2.050824, 0, 0, 1, 1, 1,
-0.5593799, -0.8225915, -1.568981, 1, 0, 0, 1, 1,
-0.5543693, -0.3564254, -2.321373, 1, 0, 0, 1, 1,
-0.5481065, -0.06143493, -0.1532822, 1, 0, 0, 1, 1,
-0.5464739, -0.01350642, -2.019233, 1, 0, 0, 1, 1,
-0.5464005, 0.4102769, -1.553209, 1, 0, 0, 1, 1,
-0.5380666, -0.3098055, -1.307574, 0, 0, 0, 1, 1,
-0.5354877, 0.5834634, -0.0785618, 0, 0, 0, 1, 1,
-0.5346243, -0.575184, -3.498831, 0, 0, 0, 1, 1,
-0.5324095, 1.810788, 0.2419351, 0, 0, 0, 1, 1,
-0.5307302, 1.002661, -1.696817, 0, 0, 0, 1, 1,
-0.5267006, -0.2086695, -2.629752, 0, 0, 0, 1, 1,
-0.5265947, 0.04444585, -1.119828, 0, 0, 0, 1, 1,
-0.5232215, -0.3477153, -2.150234, 1, 1, 1, 1, 1,
-0.5218523, -1.211007, -3.631124, 1, 1, 1, 1, 1,
-0.5127022, 0.197965, -0.5925371, 1, 1, 1, 1, 1,
-0.5122106, -2.535406, -4.440613, 1, 1, 1, 1, 1,
-0.5110518, -0.5863258, -2.389904, 1, 1, 1, 1, 1,
-0.5037405, 2.025928, 0.4183224, 1, 1, 1, 1, 1,
-0.4955851, 0.3960374, 0.4285998, 1, 1, 1, 1, 1,
-0.4836669, 0.3928292, -0.5486731, 1, 1, 1, 1, 1,
-0.4807639, -1.005179, -3.64453, 1, 1, 1, 1, 1,
-0.4798485, 1.798956, 0.4436978, 1, 1, 1, 1, 1,
-0.4760543, -0.9714156, -2.040849, 1, 1, 1, 1, 1,
-0.4759608, -1.444452, -1.357986, 1, 1, 1, 1, 1,
-0.4741286, -1.018462, -2.660537, 1, 1, 1, 1, 1,
-0.4735445, 1.080469, -1.099018, 1, 1, 1, 1, 1,
-0.4717004, -0.948473, -1.342496, 1, 1, 1, 1, 1,
-0.4696824, 0.3557083, 0.7873519, 0, 0, 1, 1, 1,
-0.4595055, 0.9008575, -0.2797657, 1, 0, 0, 1, 1,
-0.4566011, 0.933915, -0.1000933, 1, 0, 0, 1, 1,
-0.4559846, -0.2421197, -2.80402, 1, 0, 0, 1, 1,
-0.4538644, 1.12382, -1.043494, 1, 0, 0, 1, 1,
-0.4536346, 0.03041013, -2.83595, 1, 0, 0, 1, 1,
-0.4523303, 0.05465132, 0.2571211, 0, 0, 0, 1, 1,
-0.4482719, -0.285451, -2.825719, 0, 0, 0, 1, 1,
-0.4467946, -1.843596, -0.841812, 0, 0, 0, 1, 1,
-0.4465559, -1.273125, -1.305537, 0, 0, 0, 1, 1,
-0.4441323, -0.1479792, -1.849964, 0, 0, 0, 1, 1,
-0.4425453, -0.4221491, -1.771595, 0, 0, 0, 1, 1,
-0.4384969, 0.1862806, -1.32095, 0, 0, 0, 1, 1,
-0.437269, 0.39053, 0.1994467, 1, 1, 1, 1, 1,
-0.4372342, 0.143844, -1.752086, 1, 1, 1, 1, 1,
-0.4332703, 2.546046, -0.9768631, 1, 1, 1, 1, 1,
-0.4327835, 0.2559989, -0.2339799, 1, 1, 1, 1, 1,
-0.432597, 1.961923, -1.771392, 1, 1, 1, 1, 1,
-0.4313683, -2.345439, -3.548876, 1, 1, 1, 1, 1,
-0.4304411, 0.8384272, -1.674513, 1, 1, 1, 1, 1,
-0.4302067, 0.6364901, 0.09972448, 1, 1, 1, 1, 1,
-0.4295674, 0.6263312, -0.042426, 1, 1, 1, 1, 1,
-0.4237765, -0.2136249, -2.076854, 1, 1, 1, 1, 1,
-0.422903, 1.01344, -0.7988654, 1, 1, 1, 1, 1,
-0.4134629, 0.2231935, -2.054507, 1, 1, 1, 1, 1,
-0.4092775, -0.5768043, -3.49341, 1, 1, 1, 1, 1,
-0.4073783, 0.3387045, -0.2260389, 1, 1, 1, 1, 1,
-0.4062903, 1.350896, 0.3087622, 1, 1, 1, 1, 1,
-0.4057174, -0.4597068, -3.137288, 0, 0, 1, 1, 1,
-0.4028869, -0.6351031, -3.696153, 1, 0, 0, 1, 1,
-0.402413, 0.5974789, 0.04722731, 1, 0, 0, 1, 1,
-0.3978021, -0.7604467, -2.583807, 1, 0, 0, 1, 1,
-0.3968234, 0.09360279, -1.826257, 1, 0, 0, 1, 1,
-0.3942683, 0.9147295, 1.116667, 1, 0, 0, 1, 1,
-0.3925931, 2.522894, -0.7723776, 0, 0, 0, 1, 1,
-0.3913733, 2.604548, 1.761572, 0, 0, 0, 1, 1,
-0.3900543, -1.347243, -3.070406, 0, 0, 0, 1, 1,
-0.3868356, 0.3476548, 1.424731, 0, 0, 0, 1, 1,
-0.3828385, 1.053454, -3.008117, 0, 0, 0, 1, 1,
-0.3826677, 1.220424, -0.7070215, 0, 0, 0, 1, 1,
-0.3825919, -1.070159, -3.265591, 0, 0, 0, 1, 1,
-0.3808946, -1.183283, -2.817843, 1, 1, 1, 1, 1,
-0.3803198, 0.02953643, -2.885798, 1, 1, 1, 1, 1,
-0.3781792, -0.6011504, -0.7688627, 1, 1, 1, 1, 1,
-0.3772618, 0.1126243, -0.5776175, 1, 1, 1, 1, 1,
-0.3752095, 0.1970506, -1.060405, 1, 1, 1, 1, 1,
-0.374251, 0.006610272, -0.5439773, 1, 1, 1, 1, 1,
-0.3729748, 0.3708147, -0.3915332, 1, 1, 1, 1, 1,
-0.362506, -0.5591105, -0.5611641, 1, 1, 1, 1, 1,
-0.3608595, 0.3853818, -0.9366508, 1, 1, 1, 1, 1,
-0.3582771, -0.4817276, -1.624737, 1, 1, 1, 1, 1,
-0.355904, -0.2360777, -2.965785, 1, 1, 1, 1, 1,
-0.3519813, 0.109678, -2.425927, 1, 1, 1, 1, 1,
-0.3489563, -0.0008982595, -0.8696449, 1, 1, 1, 1, 1,
-0.3474583, 0.2071626, -2.806667, 1, 1, 1, 1, 1,
-0.34525, 0.7931097, -0.7265581, 1, 1, 1, 1, 1,
-0.3408281, -0.9408118, -3.752218, 0, 0, 1, 1, 1,
-0.3408035, 0.3901596, -0.8374509, 1, 0, 0, 1, 1,
-0.3388627, 0.1006323, -1.321652, 1, 0, 0, 1, 1,
-0.3369404, 1.517283, -2.855008, 1, 0, 0, 1, 1,
-0.3364537, -0.263414, -0.5814778, 1, 0, 0, 1, 1,
-0.3358893, -0.9834868, -1.978583, 1, 0, 0, 1, 1,
-0.335757, 0.7878184, 0.3925734, 0, 0, 0, 1, 1,
-0.334192, -1.593488, -2.51445, 0, 0, 0, 1, 1,
-0.3307709, -2.569144, -3.205518, 0, 0, 0, 1, 1,
-0.3279923, -0.2588798, -2.373065, 0, 0, 0, 1, 1,
-0.3259957, -0.3685784, -2.852006, 0, 0, 0, 1, 1,
-0.3255164, 2.204606, 1.23668, 0, 0, 0, 1, 1,
-0.3226211, 0.4358987, -0.5860192, 0, 0, 0, 1, 1,
-0.320412, 0.230184, -0.608656, 1, 1, 1, 1, 1,
-0.3191935, -0.7158302, -2.248563, 1, 1, 1, 1, 1,
-0.3187296, -1.786973, -3.314731, 1, 1, 1, 1, 1,
-0.3186619, 1.749665, -0.06642041, 1, 1, 1, 1, 1,
-0.3180537, -0.4450788, -1.352132, 1, 1, 1, 1, 1,
-0.3146413, -1.868082, -4.575329, 1, 1, 1, 1, 1,
-0.3114718, 0.7394565, -1.056728, 1, 1, 1, 1, 1,
-0.3102994, 0.9457325, 1.197313, 1, 1, 1, 1, 1,
-0.3041003, 0.07709841, 0.5441705, 1, 1, 1, 1, 1,
-0.3039829, 1.802915, 0.4129488, 1, 1, 1, 1, 1,
-0.3013159, -0.6373132, -3.754707, 1, 1, 1, 1, 1,
-0.2994485, -0.4011122, -1.904664, 1, 1, 1, 1, 1,
-0.298816, 0.5584254, -0.3588518, 1, 1, 1, 1, 1,
-0.2985898, 0.6529548, 1.460745, 1, 1, 1, 1, 1,
-0.2964689, 1.223211, -0.8688525, 1, 1, 1, 1, 1,
-0.2949842, -1.253499, -2.784083, 0, 0, 1, 1, 1,
-0.2938877, 0.1371597, -0.558919, 1, 0, 0, 1, 1,
-0.2927449, 1.442845, -0.2573177, 1, 0, 0, 1, 1,
-0.2850249, 1.118803, 1.776542, 1, 0, 0, 1, 1,
-0.2823203, 0.1423723, -2.007698, 1, 0, 0, 1, 1,
-0.2814749, -2.075941, -2.779183, 1, 0, 0, 1, 1,
-0.2805594, -0.04269744, -3.574345, 0, 0, 0, 1, 1,
-0.2803468, -1.455812, -0.9731943, 0, 0, 0, 1, 1,
-0.2796676, -0.2128455, -2.160021, 0, 0, 0, 1, 1,
-0.2737721, 0.5641853, -0.5367121, 0, 0, 0, 1, 1,
-0.2723329, 0.5988457, -0.8075902, 0, 0, 0, 1, 1,
-0.2698552, -0.9097125, -2.562629, 0, 0, 0, 1, 1,
-0.2678548, -1.124848, -2.172762, 0, 0, 0, 1, 1,
-0.2670405, 0.949794, -0.1688845, 1, 1, 1, 1, 1,
-0.2646893, -1.002593, -3.075913, 1, 1, 1, 1, 1,
-0.2528447, 1.055297, 0.6418728, 1, 1, 1, 1, 1,
-0.2511404, -1.397053, -3.443179, 1, 1, 1, 1, 1,
-0.2460921, 0.7509784, -2.833614, 1, 1, 1, 1, 1,
-0.2452858, 1.62498, 0.8924829, 1, 1, 1, 1, 1,
-0.2447099, 0.1358244, -1.24334, 1, 1, 1, 1, 1,
-0.2428363, -0.1600543, -2.793323, 1, 1, 1, 1, 1,
-0.2399171, 0.6319358, -3.009226, 1, 1, 1, 1, 1,
-0.2394628, -1.103613, -3.951846, 1, 1, 1, 1, 1,
-0.2336717, 1.442423, 1.132174, 1, 1, 1, 1, 1,
-0.229247, -1.497844, -2.789804, 1, 1, 1, 1, 1,
-0.2281044, -0.9022738, -2.351641, 1, 1, 1, 1, 1,
-0.2280553, 0.7824407, 0.945289, 1, 1, 1, 1, 1,
-0.2110529, 2.74535, -0.6811354, 1, 1, 1, 1, 1,
-0.2089886, -0.2786877, -1.10321, 0, 0, 1, 1, 1,
-0.2083252, -1.766127, -1.039308, 1, 0, 0, 1, 1,
-0.2074341, 1.713187, -0.1945105, 1, 0, 0, 1, 1,
-0.2032755, 0.6204031, 0.05942419, 1, 0, 0, 1, 1,
-0.1975984, 0.3859372, 0.008986583, 1, 0, 0, 1, 1,
-0.197492, -0.7306509, -3.342864, 1, 0, 0, 1, 1,
-0.1958703, 0.3027208, -0.5941299, 0, 0, 0, 1, 1,
-0.1950696, 1.331479, 1.534561, 0, 0, 0, 1, 1,
-0.1947758, 1.750151, 1.642302, 0, 0, 0, 1, 1,
-0.1915821, 1.452551, 1.486542, 0, 0, 0, 1, 1,
-0.1907391, -0.02962823, -0.007611636, 0, 0, 0, 1, 1,
-0.1900664, -0.3477611, -1.309197, 0, 0, 0, 1, 1,
-0.1867835, 0.2189179, -0.6734779, 0, 0, 0, 1, 1,
-0.183564, 0.01889699, -0.08282025, 1, 1, 1, 1, 1,
-0.1820046, -0.2600681, -2.204048, 1, 1, 1, 1, 1,
-0.1799843, -0.538487, -1.774571, 1, 1, 1, 1, 1,
-0.1795338, 0.3187621, 0.4421097, 1, 1, 1, 1, 1,
-0.1757548, 0.4677311, -2.05896, 1, 1, 1, 1, 1,
-0.1751209, 0.6576369, -1.341527, 1, 1, 1, 1, 1,
-0.1744873, -1.523778, -2.627455, 1, 1, 1, 1, 1,
-0.1737855, 1.932047, 1.505072, 1, 1, 1, 1, 1,
-0.1728005, -0.168577, -1.18758, 1, 1, 1, 1, 1,
-0.1724378, 1.32381, -0.3201437, 1, 1, 1, 1, 1,
-0.1679023, 0.7381942, -0.8159247, 1, 1, 1, 1, 1,
-0.1662118, 1.201504, -0.228596, 1, 1, 1, 1, 1,
-0.1621139, -0.6955684, -1.744085, 1, 1, 1, 1, 1,
-0.1570451, -0.5257812, -3.293254, 1, 1, 1, 1, 1,
-0.1547579, 0.1583316, 0.5452439, 1, 1, 1, 1, 1,
-0.1504567, -1.217776, -1.782803, 0, 0, 1, 1, 1,
-0.1457051, -1.491147, -2.739696, 1, 0, 0, 1, 1,
-0.1455244, 0.2243351, -1.059311, 1, 0, 0, 1, 1,
-0.1381658, 0.5547214, 0.1390898, 1, 0, 0, 1, 1,
-0.1334937, 0.2111827, -1.630552, 1, 0, 0, 1, 1,
-0.1184399, -0.2288307, -3.19369, 1, 0, 0, 1, 1,
-0.1179738, -0.4236675, -2.96659, 0, 0, 0, 1, 1,
-0.1149665, 0.8092627, 0.09065208, 0, 0, 0, 1, 1,
-0.1146257, 0.1988384, 0.6722999, 0, 0, 0, 1, 1,
-0.1115096, -0.7708426, -2.457203, 0, 0, 0, 1, 1,
-0.1097848, -2.599491, -4.291325, 0, 0, 0, 1, 1,
-0.1089607, 0.2709953, -1.007141, 0, 0, 0, 1, 1,
-0.1071969, -0.802561, -1.879035, 0, 0, 0, 1, 1,
-0.1010252, 0.8175046, 0.4910555, 1, 1, 1, 1, 1,
-0.09890857, -0.7015691, -2.286869, 1, 1, 1, 1, 1,
-0.09840258, -0.7382062, -2.908988, 1, 1, 1, 1, 1,
-0.09804937, -0.2093078, -1.882981, 1, 1, 1, 1, 1,
-0.09667292, -0.1090277, -2.144697, 1, 1, 1, 1, 1,
-0.09581318, -0.1620286, -2.745214, 1, 1, 1, 1, 1,
-0.09309813, -0.1261815, -4.008554, 1, 1, 1, 1, 1,
-0.09225848, 0.99926, 0.6328745, 1, 1, 1, 1, 1,
-0.08684241, -0.02144467, -1.927252, 1, 1, 1, 1, 1,
-0.08667152, -2.045857, -1.360645, 1, 1, 1, 1, 1,
-0.08289523, -0.9963176, -1.478616, 1, 1, 1, 1, 1,
-0.0798334, -1.687192, -3.13824, 1, 1, 1, 1, 1,
-0.07918583, 1.560359, -2.829128, 1, 1, 1, 1, 1,
-0.07893729, 0.1412187, -0.4482493, 1, 1, 1, 1, 1,
-0.07777452, -1.856403, -2.589454, 1, 1, 1, 1, 1,
-0.07696709, 1.905889, -1.303516, 0, 0, 1, 1, 1,
-0.0762722, 1.903011, -0.09987163, 1, 0, 0, 1, 1,
-0.07401194, -0.1301333, -1.549869, 1, 0, 0, 1, 1,
-0.07071551, 1.082995, 0.1375189, 1, 0, 0, 1, 1,
-0.06699952, -1.143703, -3.026414, 1, 0, 0, 1, 1,
-0.06243045, -0.02881303, -2.460115, 1, 0, 0, 1, 1,
-0.06241227, -0.2031049, -3.233624, 0, 0, 0, 1, 1,
-0.06034073, 0.5804846, 1.156911, 0, 0, 0, 1, 1,
-0.05215418, -0.8543745, -3.198872, 0, 0, 0, 1, 1,
-0.051885, 2.698984, -0.294486, 0, 0, 0, 1, 1,
-0.04118082, 0.1812647, 0.5508178, 0, 0, 0, 1, 1,
-0.04022775, 1.932181, -0.8358774, 0, 0, 0, 1, 1,
-0.03487822, 0.3072971, 0.04432562, 0, 0, 0, 1, 1,
-0.0348415, 0.9816438, 1.254719, 1, 1, 1, 1, 1,
-0.03361107, -0.01463369, -2.71375, 1, 1, 1, 1, 1,
-0.02846408, 0.6211922, 2.549164, 1, 1, 1, 1, 1,
-0.02839565, 0.1384145, -1.132171, 1, 1, 1, 1, 1,
-0.02781711, 0.333172, -1.363678, 1, 1, 1, 1, 1,
-0.02253331, 0.4300761, 0.5739964, 1, 1, 1, 1, 1,
-0.0222219, -1.014537, -3.248819, 1, 1, 1, 1, 1,
-0.02063832, -0.6786466, -2.363745, 1, 1, 1, 1, 1,
-0.02021526, 0.1248904, 0.9331048, 1, 1, 1, 1, 1,
-0.01958062, -1.520625, -3.623185, 1, 1, 1, 1, 1,
-0.01683717, 0.07650131, 0.05550397, 1, 1, 1, 1, 1,
-0.01450376, 0.09766855, -1.30965, 1, 1, 1, 1, 1,
-0.01373849, -0.3468486, -3.361334, 1, 1, 1, 1, 1,
-0.01350959, 0.2800479, -0.9629843, 1, 1, 1, 1, 1,
-0.01288888, 0.2137469, -2.023869, 1, 1, 1, 1, 1,
-0.01241705, 0.4321168, -0.8499392, 0, 0, 1, 1, 1,
-0.007601575, -1.201559, -2.588815, 1, 0, 0, 1, 1,
-0.0004743618, 0.620537, 1.186419, 1, 0, 0, 1, 1,
0.00103452, -0.5446092, 2.862175, 1, 0, 0, 1, 1,
0.003459011, 0.847204, -0.402353, 1, 0, 0, 1, 1,
0.005309794, -0.2459923, 3.182783, 1, 0, 0, 1, 1,
0.008196055, -0.8411693, 2.716935, 0, 0, 0, 1, 1,
0.01043501, 0.339365, -0.331977, 0, 0, 0, 1, 1,
0.01131493, -0.06637277, 1.951167, 0, 0, 0, 1, 1,
0.01152052, 0.2179022, 0.185941, 0, 0, 0, 1, 1,
0.0121539, 0.05906293, 0.7281354, 0, 0, 0, 1, 1,
0.01233073, -0.3876281, 2.662071, 0, 0, 0, 1, 1,
0.01790793, 2.028927, -0.1126502, 0, 0, 0, 1, 1,
0.01881909, -1.84714, 2.712189, 1, 1, 1, 1, 1,
0.01996764, -0.1745453, 4.078144, 1, 1, 1, 1, 1,
0.01999597, -0.9306769, 4.07102, 1, 1, 1, 1, 1,
0.02256013, -1.155813, 3.349532, 1, 1, 1, 1, 1,
0.02497275, 0.07754134, 2.52958, 1, 1, 1, 1, 1,
0.02523829, 1.498003, 2.509573, 1, 1, 1, 1, 1,
0.02866869, -0.8101979, 3.066334, 1, 1, 1, 1, 1,
0.03008323, -1.324874, 3.97398, 1, 1, 1, 1, 1,
0.03273053, 0.1234758, 0.1939977, 1, 1, 1, 1, 1,
0.03654612, 0.2264041, 1.778714, 1, 1, 1, 1, 1,
0.03677265, -0.7470374, 3.003934, 1, 1, 1, 1, 1,
0.04010421, 0.6779497, 0.567794, 1, 1, 1, 1, 1,
0.04135745, -0.9420925, 1.846752, 1, 1, 1, 1, 1,
0.04786843, -0.7084829, 1.949258, 1, 1, 1, 1, 1,
0.04880204, -0.8549272, 2.893538, 1, 1, 1, 1, 1,
0.0504774, 0.006910717, 2.338546, 0, 0, 1, 1, 1,
0.05415983, 0.7494958, 0.4455405, 1, 0, 0, 1, 1,
0.05478444, -0.1326273, 3.098429, 1, 0, 0, 1, 1,
0.05749642, -1.010937, 1.772956, 1, 0, 0, 1, 1,
0.0597314, -2.011898, 2.474884, 1, 0, 0, 1, 1,
0.05996667, -0.1755638, 1.497537, 1, 0, 0, 1, 1,
0.06244633, 2.105557, 0.8970383, 0, 0, 0, 1, 1,
0.06575229, -1.55002, 1.320531, 0, 0, 0, 1, 1,
0.06664064, 1.755957, -1.168269, 0, 0, 0, 1, 1,
0.07162926, 1.208681, 0.7366048, 0, 0, 0, 1, 1,
0.0788511, 0.4565601, -0.1216788, 0, 0, 0, 1, 1,
0.07894144, 1.965036, 0.0479489, 0, 0, 0, 1, 1,
0.07932444, 0.5175878, 0.4635344, 0, 0, 0, 1, 1,
0.08193708, -0.3801073, 1.84784, 1, 1, 1, 1, 1,
0.09286935, 1.215665, 1.506195, 1, 1, 1, 1, 1,
0.09410278, -1.356879, 3.238711, 1, 1, 1, 1, 1,
0.0947853, 0.301635, -0.2217839, 1, 1, 1, 1, 1,
0.09739687, 1.134271, -0.2696559, 1, 1, 1, 1, 1,
0.09892144, 3.176227, 1.013387, 1, 1, 1, 1, 1,
0.1004001, -1.308631, 2.863561, 1, 1, 1, 1, 1,
0.1038349, -0.3854102, 1.709886, 1, 1, 1, 1, 1,
0.1104332, 0.6101428, -1.852766, 1, 1, 1, 1, 1,
0.1155812, -0.7620541, 1.639823, 1, 1, 1, 1, 1,
0.1156861, -0.6411188, 3.722753, 1, 1, 1, 1, 1,
0.1247846, -1.516558, 2.904414, 1, 1, 1, 1, 1,
0.1256102, 1.093834, -0.1269482, 1, 1, 1, 1, 1,
0.1266612, 2.285701, 0.06265135, 1, 1, 1, 1, 1,
0.1299691, -0.7304605, 3.14521, 1, 1, 1, 1, 1,
0.1326885, 0.2744898, 0.7467164, 0, 0, 1, 1, 1,
0.138277, -0.8000911, 3.088729, 1, 0, 0, 1, 1,
0.140471, -0.2138176, 3.073007, 1, 0, 0, 1, 1,
0.1410153, 0.2648928, 0.4466243, 1, 0, 0, 1, 1,
0.1439043, -0.5182279, 2.5118, 1, 0, 0, 1, 1,
0.1443239, -1.401963, 3.988977, 1, 0, 0, 1, 1,
0.1458426, -0.5672842, 2.402481, 0, 0, 0, 1, 1,
0.1505646, 1.655602, -0.5478224, 0, 0, 0, 1, 1,
0.1519071, 1.08437, 0.3250475, 0, 0, 0, 1, 1,
0.1566037, 0.1505149, -0.7287799, 0, 0, 0, 1, 1,
0.1576319, 0.3710103, -0.01047928, 0, 0, 0, 1, 1,
0.1638308, 0.84085, -0.02505881, 0, 0, 0, 1, 1,
0.164926, 0.9510466, 1.647445, 0, 0, 0, 1, 1,
0.1681435, -0.9246389, 2.544177, 1, 1, 1, 1, 1,
0.1682985, -1.195299, 3.999771, 1, 1, 1, 1, 1,
0.1688178, 0.2090545, 0.5999993, 1, 1, 1, 1, 1,
0.1691369, -1.106322, 3.726539, 1, 1, 1, 1, 1,
0.1710848, -1.520578, 5.701729, 1, 1, 1, 1, 1,
0.1745252, -0.6104822, 3.655269, 1, 1, 1, 1, 1,
0.1746373, 0.7528347, 0.5842622, 1, 1, 1, 1, 1,
0.1811737, 0.4583417, 0.2035465, 1, 1, 1, 1, 1,
0.1862309, -0.8140616, 2.782266, 1, 1, 1, 1, 1,
0.1868825, -0.0443502, 2.161072, 1, 1, 1, 1, 1,
0.1886989, -0.6922563, 4.366549, 1, 1, 1, 1, 1,
0.1897626, -0.04794063, 2.675582, 1, 1, 1, 1, 1,
0.1974119, 0.1401064, 1.904188, 1, 1, 1, 1, 1,
0.1977763, -0.6934409, 3.634142, 1, 1, 1, 1, 1,
0.1980863, 0.5118501, 1.634163, 1, 1, 1, 1, 1,
0.1995876, -0.03014826, 0.6649259, 0, 0, 1, 1, 1,
0.2002717, -1.060296, 3.401731, 1, 0, 0, 1, 1,
0.2036688, 0.4956642, 0.09385497, 1, 0, 0, 1, 1,
0.206158, -0.9438204, 1.331622, 1, 0, 0, 1, 1,
0.2085443, 0.9495898, -0.5510834, 1, 0, 0, 1, 1,
0.2139405, 1.375396, 1.302316, 1, 0, 0, 1, 1,
0.2143787, -0.0231305, -0.1538051, 0, 0, 0, 1, 1,
0.2150213, 0.1063981, 2.467137, 0, 0, 0, 1, 1,
0.2168863, 0.6583496, 0.5647309, 0, 0, 0, 1, 1,
0.216928, -0.1157905, 2.395251, 0, 0, 0, 1, 1,
0.2179136, -0.01304784, 4.453417, 0, 0, 0, 1, 1,
0.2220795, -0.3389159, 2.613159, 0, 0, 0, 1, 1,
0.2287855, 0.8093446, 1.811214, 0, 0, 0, 1, 1,
0.2332491, -0.8408567, 3.923058, 1, 1, 1, 1, 1,
0.2343373, 0.08465305, 1.76702, 1, 1, 1, 1, 1,
0.2421813, 0.2034144, 0.6400664, 1, 1, 1, 1, 1,
0.2517761, -2.579871, 3.335518, 1, 1, 1, 1, 1,
0.2528421, 1.13035, 0.179917, 1, 1, 1, 1, 1,
0.2536752, -0.2351833, 1.670132, 1, 1, 1, 1, 1,
0.2542634, -1.054764, 2.139285, 1, 1, 1, 1, 1,
0.2545717, -0.3894835, 3.598201, 1, 1, 1, 1, 1,
0.2568262, 1.557086, 1.378907, 1, 1, 1, 1, 1,
0.2571741, 0.3480872, 1.024647, 1, 1, 1, 1, 1,
0.2598231, 0.9744326, 3.273306, 1, 1, 1, 1, 1,
0.2606127, 1.444229, 0.4981112, 1, 1, 1, 1, 1,
0.2621948, -0.7384267, 2.2376, 1, 1, 1, 1, 1,
0.2641385, -0.8644655, 2.69602, 1, 1, 1, 1, 1,
0.2663688, -0.7742679, 2.317101, 1, 1, 1, 1, 1,
0.2748176, -1.008509, 1.379041, 0, 0, 1, 1, 1,
0.277675, 1.125117, -0.1537507, 1, 0, 0, 1, 1,
0.2778324, -0.7609006, 3.408985, 1, 0, 0, 1, 1,
0.2794396, -1.038067, 0.8908551, 1, 0, 0, 1, 1,
0.2811206, -0.9264362, 4.220232, 1, 0, 0, 1, 1,
0.2839946, -1.589382, 3.438186, 1, 0, 0, 1, 1,
0.2843203, 1.715352, -0.4759893, 0, 0, 0, 1, 1,
0.2844492, 1.441812, -1.193908, 0, 0, 0, 1, 1,
0.2848862, -0.1229433, 1.35636, 0, 0, 0, 1, 1,
0.2879435, 0.4343823, -0.4328777, 0, 0, 0, 1, 1,
0.2927765, 0.1123994, 1.991404, 0, 0, 0, 1, 1,
0.2968728, 0.4225939, -0.05808263, 0, 0, 0, 1, 1,
0.2991628, -1.101651, 1.652905, 0, 0, 0, 1, 1,
0.3048561, -0.3349864, 2.141228, 1, 1, 1, 1, 1,
0.304929, 1.094001, 0.7269473, 1, 1, 1, 1, 1,
0.3063494, -1.386156, 3.450497, 1, 1, 1, 1, 1,
0.3157075, -0.2896863, 1.263472, 1, 1, 1, 1, 1,
0.31878, -0.1615024, 3.282969, 1, 1, 1, 1, 1,
0.322286, -0.971253, 3.460407, 1, 1, 1, 1, 1,
0.3246039, -1.28008, 3.073415, 1, 1, 1, 1, 1,
0.3266418, 1.609985, 2.479589, 1, 1, 1, 1, 1,
0.3275492, -0.2616505, 1.261347, 1, 1, 1, 1, 1,
0.3336218, 0.8623788, 0.08256002, 1, 1, 1, 1, 1,
0.3341266, 0.6006173, 0.1439108, 1, 1, 1, 1, 1,
0.3388517, -0.7032044, 2.778416, 1, 1, 1, 1, 1,
0.3419737, -1.634713, 2.604596, 1, 1, 1, 1, 1,
0.3443202, -1.233872, 1.80572, 1, 1, 1, 1, 1,
0.3472143, -0.4159527, 1.689737, 1, 1, 1, 1, 1,
0.3475894, 0.5820239, 0.8429226, 0, 0, 1, 1, 1,
0.3507236, 0.2821841, 0.8646772, 1, 0, 0, 1, 1,
0.3512982, 1.660412, 2.593931, 1, 0, 0, 1, 1,
0.3536644, -0.4772085, 1.898264, 1, 0, 0, 1, 1,
0.3567299, -1.294833, 2.698858, 1, 0, 0, 1, 1,
0.3588244, -0.6782959, 2.595537, 1, 0, 0, 1, 1,
0.3620089, 1.699998, 0.02016083, 0, 0, 0, 1, 1,
0.36696, -0.2987579, 2.783292, 0, 0, 0, 1, 1,
0.3685339, -0.8351946, -0.0164431, 0, 0, 0, 1, 1,
0.3707901, 1.16855, -0.8755207, 0, 0, 0, 1, 1,
0.3812689, 0.460173, 0.8408383, 0, 0, 0, 1, 1,
0.3852978, -2.584039, 4.280417, 0, 0, 0, 1, 1,
0.3871565, -0.4814218, 2.222516, 0, 0, 0, 1, 1,
0.3891347, 0.3875692, 0.6727679, 1, 1, 1, 1, 1,
0.3893594, -0.1647386, 1.098819, 1, 1, 1, 1, 1,
0.3921592, 0.4519421, -0.8114619, 1, 1, 1, 1, 1,
0.3930021, 0.772572, -0.1097926, 1, 1, 1, 1, 1,
0.3947533, -0.2159051, 1.705092, 1, 1, 1, 1, 1,
0.3952998, 1.197036, 0.3842204, 1, 1, 1, 1, 1,
0.396928, 2.114284, -0.4418052, 1, 1, 1, 1, 1,
0.3970253, -0.1993949, 0.7782444, 1, 1, 1, 1, 1,
0.3978301, 1.39053, 0.2770688, 1, 1, 1, 1, 1,
0.4025095, -0.4998927, 3.042974, 1, 1, 1, 1, 1,
0.4050458, 0.06508146, 1.982793, 1, 1, 1, 1, 1,
0.4056065, 1.036471, -1.304728, 1, 1, 1, 1, 1,
0.407864, -0.001211207, 2.670902, 1, 1, 1, 1, 1,
0.4081491, -0.3257703, 2.294179, 1, 1, 1, 1, 1,
0.4084272, 0.5582461, 1.58679, 1, 1, 1, 1, 1,
0.4104075, 1.371862, -0.2753117, 0, 0, 1, 1, 1,
0.4106273, 0.6133769, 1.50939, 1, 0, 0, 1, 1,
0.4120333, -0.08094217, -0.6890867, 1, 0, 0, 1, 1,
0.4131347, 0.1162345, 0.8806972, 1, 0, 0, 1, 1,
0.4132398, -1.071281, 1.99526, 1, 0, 0, 1, 1,
0.4159486, 0.1416392, 0.6559907, 1, 0, 0, 1, 1,
0.4163683, -1.576455, 0.5897348, 0, 0, 0, 1, 1,
0.4206578, -2.354318, 1.671145, 0, 0, 0, 1, 1,
0.4208734, 1.414582, 0.1856806, 0, 0, 0, 1, 1,
0.4218209, 0.4768059, 0.5006493, 0, 0, 0, 1, 1,
0.4235406, -1.258326, 2.34874, 0, 0, 0, 1, 1,
0.4236865, -0.4455584, 3.541652, 0, 0, 0, 1, 1,
0.4261299, 0.04296032, 3.364064, 0, 0, 0, 1, 1,
0.4338519, -2.883842, 1.490118, 1, 1, 1, 1, 1,
0.4358599, -0.7307605, 2.425071, 1, 1, 1, 1, 1,
0.4364727, -0.8499838, 2.873167, 1, 1, 1, 1, 1,
0.4400763, -1.505424, 5.205436, 1, 1, 1, 1, 1,
0.4448724, -0.669248, 1.186174, 1, 1, 1, 1, 1,
0.4480133, 0.84914, -0.3698226, 1, 1, 1, 1, 1,
0.4514257, 1.882939, -0.1203744, 1, 1, 1, 1, 1,
0.4532877, -0.0127089, 1.515383, 1, 1, 1, 1, 1,
0.4559962, -0.07255021, 3.067689, 1, 1, 1, 1, 1,
0.4601358, -0.5742182, 3.106559, 1, 1, 1, 1, 1,
0.4607932, -1.077643, 4.29014, 1, 1, 1, 1, 1,
0.4641527, 0.9230015, 1.618115, 1, 1, 1, 1, 1,
0.4720235, -0.2624789, 1.687626, 1, 1, 1, 1, 1,
0.4749581, -0.7184482, 1.960674, 1, 1, 1, 1, 1,
0.4829092, 1.595084, 1.461422, 1, 1, 1, 1, 1,
0.4904926, -1.318574, 3.977258, 0, 0, 1, 1, 1,
0.4927648, -0.3524713, 4.363987, 1, 0, 0, 1, 1,
0.4945412, 0.5968066, -0.6201485, 1, 0, 0, 1, 1,
0.4958037, -0.8778808, 5.610357, 1, 0, 0, 1, 1,
0.5061619, -0.9412327, 2.414103, 1, 0, 0, 1, 1,
0.5080698, 0.1123822, 2.039796, 1, 0, 0, 1, 1,
0.508354, -0.9437399, 2.722145, 0, 0, 0, 1, 1,
0.5173, -0.5932831, 1.885861, 0, 0, 0, 1, 1,
0.5181305, -0.4616727, 2.890583, 0, 0, 0, 1, 1,
0.5204797, 0.934618, 1.111619, 0, 0, 0, 1, 1,
0.525956, -0.4332879, 0.9239096, 0, 0, 0, 1, 1,
0.5276967, 0.2437158, 2.534648, 0, 0, 0, 1, 1,
0.5297056, -0.8055941, 2.054721, 0, 0, 0, 1, 1,
0.5328288, 0.6507696, 2.529566, 1, 1, 1, 1, 1,
0.534002, 1.009244, 0.9035168, 1, 1, 1, 1, 1,
0.5340405, -0.4268019, 2.804951, 1, 1, 1, 1, 1,
0.5366468, 0.3596088, -0.2306306, 1, 1, 1, 1, 1,
0.5422748, 0.8197545, 2.059028, 1, 1, 1, 1, 1,
0.5431215, -1.020057, 4.953369, 1, 1, 1, 1, 1,
0.5516893, -1.331773, 2.205463, 1, 1, 1, 1, 1,
0.5542929, 0.2295471, 0.6703738, 1, 1, 1, 1, 1,
0.5578704, 0.4238192, -0.07928117, 1, 1, 1, 1, 1,
0.5635229, -0.1088916, 1.991199, 1, 1, 1, 1, 1,
0.5643235, 0.7313024, 1.271283, 1, 1, 1, 1, 1,
0.5732819, 1.506209, -1.019579, 1, 1, 1, 1, 1,
0.574521, -0.4656103, 1.572534, 1, 1, 1, 1, 1,
0.5819215, 1.243433, 1.24231, 1, 1, 1, 1, 1,
0.5833443, 1.095447, -1.421892, 1, 1, 1, 1, 1,
0.5837517, -0.6433564, 4.795061, 0, 0, 1, 1, 1,
0.5910876, -1.443784, 2.71458, 1, 0, 0, 1, 1,
0.5925986, 0.2896001, 0.7302389, 1, 0, 0, 1, 1,
0.6028403, 0.2802077, 3.355424, 1, 0, 0, 1, 1,
0.6043339, -1.550953, 3.261264, 1, 0, 0, 1, 1,
0.6192288, -1.028316, 6.045751, 1, 0, 0, 1, 1,
0.6242361, -0.283484, 3.255827, 0, 0, 0, 1, 1,
0.6245207, 0.2236254, 2.480652, 0, 0, 0, 1, 1,
0.6258525, 1.173018, -0.4411786, 0, 0, 0, 1, 1,
0.6331159, 0.6408733, 0.485893, 0, 0, 0, 1, 1,
0.6357379, 0.9214118, 0.6202094, 0, 0, 0, 1, 1,
0.6390898, -1.005926, 2.665661, 0, 0, 0, 1, 1,
0.6450244, 0.719048, 1.531547, 0, 0, 0, 1, 1,
0.645446, 2.090848, 0.799319, 1, 1, 1, 1, 1,
0.6508098, 1.506715, -1.963725, 1, 1, 1, 1, 1,
0.6527811, -0.4299111, 2.053608, 1, 1, 1, 1, 1,
0.6556107, -1.219639, 2.575965, 1, 1, 1, 1, 1,
0.6558663, 0.4163858, 1.631077, 1, 1, 1, 1, 1,
0.6652344, 0.6360562, 1.335266, 1, 1, 1, 1, 1,
0.6701687, 1.630291, 1.639976, 1, 1, 1, 1, 1,
0.6722839, 0.05524975, 2.778046, 1, 1, 1, 1, 1,
0.6727926, 0.0122665, 1.927434, 1, 1, 1, 1, 1,
0.6739331, 1.120755, 0.2201517, 1, 1, 1, 1, 1,
0.6750689, 1.5353, 2.445275, 1, 1, 1, 1, 1,
0.6795363, -0.1582663, 2.666991, 1, 1, 1, 1, 1,
0.6807905, -0.1202203, 0.07646351, 1, 1, 1, 1, 1,
0.6863274, -0.1336793, 1.656325, 1, 1, 1, 1, 1,
0.6994863, -1.542412, 1.954576, 1, 1, 1, 1, 1,
0.6996059, 1.313842, 2.385345, 0, 0, 1, 1, 1,
0.7004233, 0.581846, -0.9414033, 1, 0, 0, 1, 1,
0.7040989, -1.105417, 2.147041, 1, 0, 0, 1, 1,
0.7041624, 0.09335029, 2.305741, 1, 0, 0, 1, 1,
0.7042933, -1.700257, 2.726565, 1, 0, 0, 1, 1,
0.7043007, -0.6251463, 2.88723, 1, 0, 0, 1, 1,
0.7045123, -0.5895768, 1.960352, 0, 0, 0, 1, 1,
0.7088526, 0.9147592, 1.493497, 0, 0, 0, 1, 1,
0.7093684, -1.312728, 2.953764, 0, 0, 0, 1, 1,
0.7108086, -0.779403, 4.045568, 0, 0, 0, 1, 1,
0.7150092, 1.85803, -1.707129, 0, 0, 0, 1, 1,
0.7278697, -1.622285, 2.137741, 0, 0, 0, 1, 1,
0.7304268, -0.8360018, 3.026357, 0, 0, 0, 1, 1,
0.7319509, 1.71349, 2.303833, 1, 1, 1, 1, 1,
0.736178, -2.037433, 3.330342, 1, 1, 1, 1, 1,
0.7427452, 1.685396, -1.239298, 1, 1, 1, 1, 1,
0.7432587, 1.36628, 2.0764, 1, 1, 1, 1, 1,
0.7449723, 1.075113, 0.5238497, 1, 1, 1, 1, 1,
0.7457253, -0.04406307, 0.879674, 1, 1, 1, 1, 1,
0.7492712, 0.2160044, 0.9445349, 1, 1, 1, 1, 1,
0.7501318, 0.09758968, 1.769219, 1, 1, 1, 1, 1,
0.7531392, 0.1342933, 2.080239, 1, 1, 1, 1, 1,
0.7630564, -1.511558, 3.961252, 1, 1, 1, 1, 1,
0.7728555, -0.8132654, 2.169765, 1, 1, 1, 1, 1,
0.7803253, 0.03541617, 0.04959052, 1, 1, 1, 1, 1,
0.7826805, 0.8745443, 0.3911909, 1, 1, 1, 1, 1,
0.7847182, -0.09724243, 2.078113, 1, 1, 1, 1, 1,
0.7850972, -0.6276672, 1.182404, 1, 1, 1, 1, 1,
0.7937162, -0.5121058, 3.953909, 0, 0, 1, 1, 1,
0.794876, -0.7600399, 4.079035, 1, 0, 0, 1, 1,
0.7956066, -0.8275505, 3.015979, 1, 0, 0, 1, 1,
0.7957522, -0.6494031, 2.116677, 1, 0, 0, 1, 1,
0.7981647, 0.2320574, 2.448965, 1, 0, 0, 1, 1,
0.7990068, -0.1242411, 0.7517684, 1, 0, 0, 1, 1,
0.7997828, 1.008164, 0.4000357, 0, 0, 0, 1, 1,
0.80122, 0.7796426, 1.076803, 0, 0, 0, 1, 1,
0.8114027, 0.5739754, 0.2996732, 0, 0, 0, 1, 1,
0.8168713, -0.05631111, 1.726155, 0, 0, 0, 1, 1,
0.8171005, -0.1566138, 1.283975, 0, 0, 0, 1, 1,
0.8210987, -0.08497506, 3.179739, 0, 0, 0, 1, 1,
0.8223047, 0.4432652, -0.8193617, 0, 0, 0, 1, 1,
0.8312454, -0.1521907, 1.843366, 1, 1, 1, 1, 1,
0.8358987, -0.9705094, 2.10388, 1, 1, 1, 1, 1,
0.8410199, 1.453962, -1.336936, 1, 1, 1, 1, 1,
0.8431794, 1.340626, 0.001484323, 1, 1, 1, 1, 1,
0.8504685, -0.6146917, 1.341994, 1, 1, 1, 1, 1,
0.8518628, -0.08877341, 1.98095, 1, 1, 1, 1, 1,
0.8552395, -1.024892, 3.930698, 1, 1, 1, 1, 1,
0.8811572, -0.2652487, 0.8297091, 1, 1, 1, 1, 1,
0.8841728, -1.081322, 3.229265, 1, 1, 1, 1, 1,
0.8916196, 0.3709555, 0.9538569, 1, 1, 1, 1, 1,
0.8937401, 1.399811, 2.429195, 1, 1, 1, 1, 1,
0.8948386, 0.2461223, 2.50334, 1, 1, 1, 1, 1,
0.8968781, -0.06822724, 2.739614, 1, 1, 1, 1, 1,
0.9002357, -0.1043204, 0.01619801, 1, 1, 1, 1, 1,
0.9005516, 0.1532027, 2.361144, 1, 1, 1, 1, 1,
0.9094066, -1.306258, 2.051541, 0, 0, 1, 1, 1,
0.9170811, 0.8417811, -0.4347045, 1, 0, 0, 1, 1,
0.9175127, 1.216507, 0.1577122, 1, 0, 0, 1, 1,
0.9286509, 0.9693797, 1.089799, 1, 0, 0, 1, 1,
0.9348298, -0.268277, 0.4403791, 1, 0, 0, 1, 1,
0.9403281, 1.585134, 0.957722, 1, 0, 0, 1, 1,
0.9547641, 0.5938834, -0.3433127, 0, 0, 0, 1, 1,
0.9570098, -0.3114347, 0.2799788, 0, 0, 0, 1, 1,
0.9584765, 1.159346, -0.1437541, 0, 0, 0, 1, 1,
0.9644775, -0.07401337, 1.289949, 0, 0, 0, 1, 1,
0.9649752, -2.706947, 4.775286, 0, 0, 0, 1, 1,
0.9657043, 0.2356503, 1.126081, 0, 0, 0, 1, 1,
0.9679927, 1.043023, 1.303603, 0, 0, 0, 1, 1,
0.9684511, 0.2314181, 3.446987, 1, 1, 1, 1, 1,
0.9703395, -0.2135571, 2.319353, 1, 1, 1, 1, 1,
0.9767334, 1.14949, 2.434818, 1, 1, 1, 1, 1,
0.9773371, 1.751285, 0.3111493, 1, 1, 1, 1, 1,
0.9945046, -1.092146, 0.6156973, 1, 1, 1, 1, 1,
0.9946587, -0.4764172, 1.560858, 1, 1, 1, 1, 1,
0.9954931, -0.3602664, 2.545583, 1, 1, 1, 1, 1,
0.9959648, 0.381459, 0.1661945, 1, 1, 1, 1, 1,
1.005881, -1.095678, 2.144258, 1, 1, 1, 1, 1,
1.006576, -1.298783, 2.3561, 1, 1, 1, 1, 1,
1.011124, -0.1001459, 1.284936, 1, 1, 1, 1, 1,
1.019304, 1.776924, -0.2748153, 1, 1, 1, 1, 1,
1.029053, -0.5087419, 2.106833, 1, 1, 1, 1, 1,
1.03748, -0.7930053, 1.128563, 1, 1, 1, 1, 1,
1.04171, -0.9931464, 2.566648, 1, 1, 1, 1, 1,
1.04567, 1.517195, 1.321007, 0, 0, 1, 1, 1,
1.045768, 1.74658, 1.142615, 1, 0, 0, 1, 1,
1.048374, 1.526885, 0.9404032, 1, 0, 0, 1, 1,
1.050471, -0.02411868, 0.438856, 1, 0, 0, 1, 1,
1.050687, -1.362085, 4.815303, 1, 0, 0, 1, 1,
1.052181, -0.5069765, 2.453208, 1, 0, 0, 1, 1,
1.068281, -0.7964694, 2.514652, 0, 0, 0, 1, 1,
1.071763, 1.268973, -0.8223464, 0, 0, 0, 1, 1,
1.075716, -0.2062476, 1.160023, 0, 0, 0, 1, 1,
1.07746, 1.08991, -0.3219337, 0, 0, 0, 1, 1,
1.089429, 0.8749298, 0.4274564, 0, 0, 0, 1, 1,
1.092638, -0.5353209, 0.5829057, 0, 0, 0, 1, 1,
1.093153, -0.9784949, 3.79663, 0, 0, 0, 1, 1,
1.093373, 0.1920392, 2.200704, 1, 1, 1, 1, 1,
1.102317, -0.2145346, 3.657965, 1, 1, 1, 1, 1,
1.102475, 0.7155176, 2.003478, 1, 1, 1, 1, 1,
1.108939, -2.211403, 3.154194, 1, 1, 1, 1, 1,
1.109223, 2.82574, -0.1765334, 1, 1, 1, 1, 1,
1.112037, 0.3640607, 0.5017022, 1, 1, 1, 1, 1,
1.11812, -0.6913815, 2.50781, 1, 1, 1, 1, 1,
1.123259, -0.4931416, 0.418921, 1, 1, 1, 1, 1,
1.123437, 1.930174, 1.152179, 1, 1, 1, 1, 1,
1.124555, 0.1701288, 1.441269, 1, 1, 1, 1, 1,
1.124885, -0.3289475, 1.823304, 1, 1, 1, 1, 1,
1.126005, -0.05418314, 2.086968, 1, 1, 1, 1, 1,
1.12914, 0.7431884, 0.3150124, 1, 1, 1, 1, 1,
1.129497, 0.5092673, 0.8584589, 1, 1, 1, 1, 1,
1.130869, -1.180573, 2.749402, 1, 1, 1, 1, 1,
1.131476, 0.4839236, 0.4044754, 0, 0, 1, 1, 1,
1.137221, -0.7569231, 3.157719, 1, 0, 0, 1, 1,
1.142656, 0.723204, 0.7126252, 1, 0, 0, 1, 1,
1.142851, -1.892039, 1.827338, 1, 0, 0, 1, 1,
1.146463, 0.2544041, 2.307051, 1, 0, 0, 1, 1,
1.148064, 1.307119, -0.2207619, 1, 0, 0, 1, 1,
1.157896, -0.4776588, 3.160633, 0, 0, 0, 1, 1,
1.162292, 0.2421517, 0.4039917, 0, 0, 0, 1, 1,
1.163176, 1.347471, 0.2944195, 0, 0, 0, 1, 1,
1.165606, -0.5132799, 1.234095, 0, 0, 0, 1, 1,
1.174678, 2.447771, 0.9558483, 0, 0, 0, 1, 1,
1.182931, -1.669569, 1.75675, 0, 0, 0, 1, 1,
1.184357, 1.565722, 0.1756407, 0, 0, 0, 1, 1,
1.192382, -0.01012502, 0.1756594, 1, 1, 1, 1, 1,
1.192688, -1.009075, 1.151165, 1, 1, 1, 1, 1,
1.19319, 0.5454428, 1.070243, 1, 1, 1, 1, 1,
1.198051, -0.560006, 1.412917, 1, 1, 1, 1, 1,
1.210585, -0.5214085, 0.3526846, 1, 1, 1, 1, 1,
1.213655, 1.915368, 0.8993894, 1, 1, 1, 1, 1,
1.214878, 0.2984462, 1.510832, 1, 1, 1, 1, 1,
1.21648, -0.6650998, 0.579388, 1, 1, 1, 1, 1,
1.216659, 0.4545855, 2.296752, 1, 1, 1, 1, 1,
1.217205, -0.09095544, 2.431552, 1, 1, 1, 1, 1,
1.22083, 0.4648648, 1.290641, 1, 1, 1, 1, 1,
1.225506, 0.2376903, 2.723064, 1, 1, 1, 1, 1,
1.227871, 1.405132, 0.6897269, 1, 1, 1, 1, 1,
1.231254, 1.005375, 2.403951, 1, 1, 1, 1, 1,
1.236034, 0.0362907, 2.487371, 1, 1, 1, 1, 1,
1.239895, -2.257357, 2.358298, 0, 0, 1, 1, 1,
1.249189, 0.5297425, 0.5331649, 1, 0, 0, 1, 1,
1.250872, 0.7701863, 0.4729842, 1, 0, 0, 1, 1,
1.251677, 1.859454, 0.4855669, 1, 0, 0, 1, 1,
1.259882, 0.5818167, 0.5881432, 1, 0, 0, 1, 1,
1.263131, 1.706176, 1.583044, 1, 0, 0, 1, 1,
1.266042, -1.983291, 3.443074, 0, 0, 0, 1, 1,
1.269119, 0.9978967, 0.5328994, 0, 0, 0, 1, 1,
1.279494, 0.2914622, 2.013714, 0, 0, 0, 1, 1,
1.283641, 0.1000964, 1.292498, 0, 0, 0, 1, 1,
1.285817, -0.2819304, -0.05639092, 0, 0, 0, 1, 1,
1.286454, -0.8866264, 2.693229, 0, 0, 0, 1, 1,
1.288265, 0.1672668, 1.293317, 0, 0, 0, 1, 1,
1.292289, 0.1678, 2.507752, 1, 1, 1, 1, 1,
1.313386, 0.08660787, 1.068854, 1, 1, 1, 1, 1,
1.317874, 0.842371, 0.8637447, 1, 1, 1, 1, 1,
1.321704, -1.372619, 4.204174, 1, 1, 1, 1, 1,
1.325838, 0.8100773, 1.852788, 1, 1, 1, 1, 1,
1.328943, -2.943118, 4.240682, 1, 1, 1, 1, 1,
1.329774, -0.6541013, 2.63665, 1, 1, 1, 1, 1,
1.335317, -1.638536, 2.386324, 1, 1, 1, 1, 1,
1.337657, -0.9335185, 1.536528, 1, 1, 1, 1, 1,
1.340583, -0.9961019, 1.574986, 1, 1, 1, 1, 1,
1.355338, -0.1424427, 0.6216612, 1, 1, 1, 1, 1,
1.355683, -1.51769, 2.50745, 1, 1, 1, 1, 1,
1.355715, -1.025721, 1.974501, 1, 1, 1, 1, 1,
1.361589, 2.392777, 0.7533837, 1, 1, 1, 1, 1,
1.366935, -1.310969, 3.197034, 1, 1, 1, 1, 1,
1.389652, -1.189178, 1.54034, 0, 0, 1, 1, 1,
1.389752, -0.372731, 2.06706, 1, 0, 0, 1, 1,
1.403607, -0.4032053, 3.325667, 1, 0, 0, 1, 1,
1.415428, 0.4370055, 0.9490118, 1, 0, 0, 1, 1,
1.429152, 0.05495065, 0.3410973, 1, 0, 0, 1, 1,
1.430062, 0.650753, 2.595218, 1, 0, 0, 1, 1,
1.462162, -1.612381, 2.770563, 0, 0, 0, 1, 1,
1.46435, -0.7919566, 2.681979, 0, 0, 0, 1, 1,
1.46975, 0.005106984, 0.5365633, 0, 0, 0, 1, 1,
1.469968, 0.7251807, 1.285086, 0, 0, 0, 1, 1,
1.483442, 0.8940285, 1.872481, 0, 0, 0, 1, 1,
1.507672, 1.399026, 1.86723, 0, 0, 0, 1, 1,
1.512914, 0.8749005, 2.913053, 0, 0, 0, 1, 1,
1.519564, 0.04615841, 1.338325, 1, 1, 1, 1, 1,
1.521606, 1.264596, 1.635149, 1, 1, 1, 1, 1,
1.52398, 0.08987842, 1.881314, 1, 1, 1, 1, 1,
1.541373, 0.6644319, -1.675161, 1, 1, 1, 1, 1,
1.543954, 0.2660143, 1.229019, 1, 1, 1, 1, 1,
1.562654, -1.937986, 2.490338, 1, 1, 1, 1, 1,
1.583251, -1.939708, 2.087291, 1, 1, 1, 1, 1,
1.589085, 1.499576, -1.582353, 1, 1, 1, 1, 1,
1.598327, -1.290312, 2.512568, 1, 1, 1, 1, 1,
1.606264, -0.5971804, 1.976754, 1, 1, 1, 1, 1,
1.616475, 0.6894031, 0.7397982, 1, 1, 1, 1, 1,
1.62292, -0.000258419, 1.440137, 1, 1, 1, 1, 1,
1.626632, 0.2211964, 2.053152, 1, 1, 1, 1, 1,
1.638003, 1.199447, 1.424382, 1, 1, 1, 1, 1,
1.657968, 0.1093146, 1.166286, 1, 1, 1, 1, 1,
1.680844, -0.01381435, 2.163953, 0, 0, 1, 1, 1,
1.701895, -0.9481326, 1.599349, 1, 0, 0, 1, 1,
1.70913, 0.07191112, 1.353554, 1, 0, 0, 1, 1,
1.709854, -0.6837519, 2.159515, 1, 0, 0, 1, 1,
1.739031, 0.9805872, -0.1287595, 1, 0, 0, 1, 1,
1.753872, 0.8421126, 2.637007, 1, 0, 0, 1, 1,
1.771246, -0.2451226, 1.657117, 0, 0, 0, 1, 1,
1.774507, -0.3666965, 0.2281022, 0, 0, 0, 1, 1,
1.775891, -1.744786, 2.974321, 0, 0, 0, 1, 1,
1.803836, -1.755024, 2.49819, 0, 0, 0, 1, 1,
1.813516, -0.9255851, 1.343412, 0, 0, 0, 1, 1,
1.827876, -1.457899, 3.373893, 0, 0, 0, 1, 1,
1.838319, -1.128183, 1.04161, 0, 0, 0, 1, 1,
1.840061, -0.2033956, 1.281021, 1, 1, 1, 1, 1,
1.844772, -0.7967033, 2.4475, 1, 1, 1, 1, 1,
1.887877, -0.1932831, 1.147199, 1, 1, 1, 1, 1,
1.890854, 0.2478344, 1.046775, 1, 1, 1, 1, 1,
1.898461, -0.1727616, 2.048, 1, 1, 1, 1, 1,
1.915427, -1.03933, 2.219557, 1, 1, 1, 1, 1,
1.956558, -0.9618906, 1.539202, 1, 1, 1, 1, 1,
1.963867, 0.2392442, -1.280312, 1, 1, 1, 1, 1,
1.980393, 0.6500344, 0.6476756, 1, 1, 1, 1, 1,
2.01992, -0.766676, 3.847041, 1, 1, 1, 1, 1,
2.022701, -0.2687222, 1.432483, 1, 1, 1, 1, 1,
2.04388, -0.7421362, 2.768315, 1, 1, 1, 1, 1,
2.074205, 1.596215, 0.1090297, 1, 1, 1, 1, 1,
2.095845, -1.821955, 0.8939993, 1, 1, 1, 1, 1,
2.110376, -1.772177, 3.218115, 1, 1, 1, 1, 1,
2.11362, 0.2473797, -0.04093412, 0, 0, 1, 1, 1,
2.14719, 1.728285, 0.3976016, 1, 0, 0, 1, 1,
2.218305, 2.319496, 0.4589309, 1, 0, 0, 1, 1,
2.230173, 1.330616, 2.166097, 1, 0, 0, 1, 1,
2.252278, 1.599123, 1.568893, 1, 0, 0, 1, 1,
2.268012, -1.691476, 2.506844, 1, 0, 0, 1, 1,
2.279585, -0.2579932, 1.58369, 0, 0, 0, 1, 1,
2.287336, 0.4082608, 1.709433, 0, 0, 0, 1, 1,
2.340703, 1.267847, 1.609933, 0, 0, 0, 1, 1,
2.423897, -0.005747118, 1.891356, 0, 0, 0, 1, 1,
2.43384, -0.2142459, 0.5269665, 0, 0, 0, 1, 1,
2.440279, -2.357721, 2.313016, 0, 0, 0, 1, 1,
2.703864, -0.05604869, 1.043466, 0, 0, 0, 1, 1,
2.723, -0.8668298, 3.190956, 1, 1, 1, 1, 1,
2.79623, 0.05142597, 0.6905357, 1, 1, 1, 1, 1,
3.101143, 0.0657242, 1.500104, 1, 1, 1, 1, 1,
3.11482, 1.302138, 1.751409, 1, 1, 1, 1, 1,
3.16013, 0.4969996, 0.4732141, 1, 1, 1, 1, 1,
3.289048, 1.925839, 2.643425, 1, 1, 1, 1, 1,
3.461711, 0.2673865, 2.219404, 1, 1, 1, 1, 1
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
var radius = 9.940096;
var distance = 34.91417;
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
mvMatrix.translate( -0.1844854, -0.1165546, -0.198719 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.91417);
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
