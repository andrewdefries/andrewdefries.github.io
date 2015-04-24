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
-4.053918, -0.07241865, -0.7652135, 1, 0, 0, 1,
-3.319906, -0.1711794, -1.032911, 1, 0.007843138, 0, 1,
-3.304382, 0.4834057, -1.162755, 1, 0.01176471, 0, 1,
-2.811966, 1.035224, -3.110706, 1, 0.01960784, 0, 1,
-2.759045, -0.2986903, -1.686219, 1, 0.02352941, 0, 1,
-2.68462, -0.3200875, -2.512241, 1, 0.03137255, 0, 1,
-2.594443, 1.392785, -0.8232208, 1, 0.03529412, 0, 1,
-2.548019, -0.7565095, -1.55141, 1, 0.04313726, 0, 1,
-2.387138, 0.0225465, 0.2210877, 1, 0.04705882, 0, 1,
-2.270186, -1.250453, -2.821693, 1, 0.05490196, 0, 1,
-2.242961, 0.399264, -0.6990519, 1, 0.05882353, 0, 1,
-2.192196, 0.001486123, -1.613295, 1, 0.06666667, 0, 1,
-2.129894, 0.9496085, -1.646837, 1, 0.07058824, 0, 1,
-2.104115, 1.076882, -3.076552, 1, 0.07843138, 0, 1,
-2.101584, 0.9751199, -0.7138776, 1, 0.08235294, 0, 1,
-2.080689, -0.0772756, -2.23416, 1, 0.09019608, 0, 1,
-2.072782, 0.7654552, -0.7501135, 1, 0.09411765, 0, 1,
-2.070235, -0.06263616, -0.5596998, 1, 0.1019608, 0, 1,
-2.057557, -0.3285263, -2.909717, 1, 0.1098039, 0, 1,
-2.045565, 2.327435, -0.1882495, 1, 0.1137255, 0, 1,
-2.037785, -0.638307, 0.5316226, 1, 0.1215686, 0, 1,
-2.019736, 0.1740756, -1.733322, 1, 0.1254902, 0, 1,
-2.005735, 1.870638, 0.0951628, 1, 0.1333333, 0, 1,
-2.000549, 0.7500895, -0.6749153, 1, 0.1372549, 0, 1,
-1.950789, 0.4121164, -0.6081429, 1, 0.145098, 0, 1,
-1.943807, 0.3887769, -2.233016, 1, 0.1490196, 0, 1,
-1.939131, -2.714442, -1.646549, 1, 0.1568628, 0, 1,
-1.933211, 1.117375, -2.059572, 1, 0.1607843, 0, 1,
-1.927566, -1.798243, -1.13359, 1, 0.1686275, 0, 1,
-1.927353, -0.7079138, -0.7203335, 1, 0.172549, 0, 1,
-1.923128, 0.5816293, -0.9050673, 1, 0.1803922, 0, 1,
-1.918825, -1.844059, -3.573748, 1, 0.1843137, 0, 1,
-1.908976, 0.6624513, -1.371921, 1, 0.1921569, 0, 1,
-1.907031, 0.7423839, -0.7430154, 1, 0.1960784, 0, 1,
-1.903049, -1.158495, -2.419893, 1, 0.2039216, 0, 1,
-1.899635, 0.6925049, 0.3351682, 1, 0.2117647, 0, 1,
-1.86535, -0.3455324, -2.16574, 1, 0.2156863, 0, 1,
-1.81302, -0.8990127, -3.660697, 1, 0.2235294, 0, 1,
-1.794339, -0.7110513, 0.1962005, 1, 0.227451, 0, 1,
-1.788723, 0.8474328, -2.932626, 1, 0.2352941, 0, 1,
-1.785678, -2.093268, -2.81861, 1, 0.2392157, 0, 1,
-1.781389, -0.279368, -1.719939, 1, 0.2470588, 0, 1,
-1.761904, -1.853363, -2.581057, 1, 0.2509804, 0, 1,
-1.753916, -0.7913225, -2.939943, 1, 0.2588235, 0, 1,
-1.734113, 1.651548, -0.5789438, 1, 0.2627451, 0, 1,
-1.727205, -1.210665, -2.118779, 1, 0.2705882, 0, 1,
-1.71339, 0.4125806, -0.8295945, 1, 0.2745098, 0, 1,
-1.695108, -0.3652348, -1.634196, 1, 0.282353, 0, 1,
-1.689483, 0.7406734, -1.971039, 1, 0.2862745, 0, 1,
-1.68056, -0.006357932, -0.8157195, 1, 0.2941177, 0, 1,
-1.67885, -1.51224, -1.025198, 1, 0.3019608, 0, 1,
-1.660099, 0.9311885, -1.093822, 1, 0.3058824, 0, 1,
-1.659841, -1.002013, -1.408548, 1, 0.3137255, 0, 1,
-1.645292, -0.3719962, -0.2558297, 1, 0.3176471, 0, 1,
-1.632171, 1.252217, -1.901226, 1, 0.3254902, 0, 1,
-1.619263, -0.02216688, -2.801521, 1, 0.3294118, 0, 1,
-1.614903, -2.010151, -1.587501, 1, 0.3372549, 0, 1,
-1.601231, 0.6937064, -2.633371, 1, 0.3411765, 0, 1,
-1.583846, 1.859834, -1.11702, 1, 0.3490196, 0, 1,
-1.582167, 0.9991844, -1.410472, 1, 0.3529412, 0, 1,
-1.577776, 0.1182323, -2.119671, 1, 0.3607843, 0, 1,
-1.576671, 0.6896102, -0.9264451, 1, 0.3647059, 0, 1,
-1.574981, -1.037104, -2.825495, 1, 0.372549, 0, 1,
-1.567391, 0.06575235, -2.147267, 1, 0.3764706, 0, 1,
-1.560698, -0.8438001, -1.766801, 1, 0.3843137, 0, 1,
-1.552274, -0.9470884, -1.598049, 1, 0.3882353, 0, 1,
-1.551626, -1.440683, -2.893689, 1, 0.3960784, 0, 1,
-1.536458, -0.4344015, -1.046684, 1, 0.4039216, 0, 1,
-1.532792, 0.05691982, -2.030397, 1, 0.4078431, 0, 1,
-1.532216, -0.1909714, -1.052109, 1, 0.4156863, 0, 1,
-1.528799, -0.7599887, -1.830595, 1, 0.4196078, 0, 1,
-1.523026, 1.90583, -1.811349, 1, 0.427451, 0, 1,
-1.519886, -2.511596, -1.899311, 1, 0.4313726, 0, 1,
-1.514068, -0.4748557, -2.178356, 1, 0.4392157, 0, 1,
-1.512278, -0.4172719, -2.168377, 1, 0.4431373, 0, 1,
-1.503585, -0.3050168, -1.249066, 1, 0.4509804, 0, 1,
-1.487963, 0.9758812, -1.256142, 1, 0.454902, 0, 1,
-1.485765, 0.9425045, -1.152952, 1, 0.4627451, 0, 1,
-1.484536, -0.2177596, -1.975299, 1, 0.4666667, 0, 1,
-1.484133, 0.5014703, -1.629253, 1, 0.4745098, 0, 1,
-1.470903, -1.164684, -1.434292, 1, 0.4784314, 0, 1,
-1.468962, 0.7788066, -1.174598, 1, 0.4862745, 0, 1,
-1.468856, -2.053175, -1.224163, 1, 0.4901961, 0, 1,
-1.46767, -1.38256, -1.684831, 1, 0.4980392, 0, 1,
-1.448469, -0.03498285, 0.6237248, 1, 0.5058824, 0, 1,
-1.443498, 0.1753408, -1.300749, 1, 0.509804, 0, 1,
-1.440033, -0.3347024, -3.956998, 1, 0.5176471, 0, 1,
-1.431773, -0.9155025, -2.640769, 1, 0.5215687, 0, 1,
-1.424503, 0.4664277, -1.148695, 1, 0.5294118, 0, 1,
-1.406257, 0.5422558, -0.8478922, 1, 0.5333334, 0, 1,
-1.398066, 0.4376605, -0.6217839, 1, 0.5411765, 0, 1,
-1.388773, -0.003130824, -1.325129, 1, 0.5450981, 0, 1,
-1.388317, 0.6885362, -1.199486, 1, 0.5529412, 0, 1,
-1.385421, -0.6908106, -0.2175914, 1, 0.5568628, 0, 1,
-1.380159, 0.1667846, -0.4822392, 1, 0.5647059, 0, 1,
-1.380058, -0.5269002, -0.8857649, 1, 0.5686275, 0, 1,
-1.376527, 1.199628, -1.42718, 1, 0.5764706, 0, 1,
-1.375578, 0.9150814, -0.894226, 1, 0.5803922, 0, 1,
-1.371847, -0.3109654, -1.418319, 1, 0.5882353, 0, 1,
-1.369432, -1.261085, -1.303137, 1, 0.5921569, 0, 1,
-1.366604, 0.4631191, -1.745104, 1, 0.6, 0, 1,
-1.357634, -0.267506, -1.559274, 1, 0.6078432, 0, 1,
-1.356073, 1.230124, -1.368986, 1, 0.6117647, 0, 1,
-1.34965, -0.5558423, -0.9155289, 1, 0.6196079, 0, 1,
-1.343541, -0.2478149, -1.937673, 1, 0.6235294, 0, 1,
-1.332123, -1.206754, -2.147424, 1, 0.6313726, 0, 1,
-1.331464, -1.464541, -1.072497, 1, 0.6352941, 0, 1,
-1.330715, 0.1060852, -1.283017, 1, 0.6431373, 0, 1,
-1.329473, -0.32083, -1.741602, 1, 0.6470588, 0, 1,
-1.312222, -0.3512946, -1.207946, 1, 0.654902, 0, 1,
-1.303797, -0.0460109, -1.27157, 1, 0.6588235, 0, 1,
-1.300378, 2.740068, 1.631101, 1, 0.6666667, 0, 1,
-1.297727, -0.3359354, -2.239546, 1, 0.6705883, 0, 1,
-1.291091, 0.2661832, -2.41464, 1, 0.6784314, 0, 1,
-1.282366, 1.282428, -0.1619892, 1, 0.682353, 0, 1,
-1.277205, 0.3756965, -1.213725, 1, 0.6901961, 0, 1,
-1.271954, -0.2115259, -1.94347, 1, 0.6941177, 0, 1,
-1.268918, -1.257089, -1.801431, 1, 0.7019608, 0, 1,
-1.264141, -0.2730961, -2.034034, 1, 0.7098039, 0, 1,
-1.257024, 0.9414861, -0.5842891, 1, 0.7137255, 0, 1,
-1.253204, -0.3394222, -1.37291, 1, 0.7215686, 0, 1,
-1.251927, -0.35844, -1.672798, 1, 0.7254902, 0, 1,
-1.244939, 0.7973421, -0.1299162, 1, 0.7333333, 0, 1,
-1.232528, -0.8233807, -2.988925, 1, 0.7372549, 0, 1,
-1.227061, -0.3611408, -1.757274, 1, 0.7450981, 0, 1,
-1.226887, 0.7006391, -0.7433712, 1, 0.7490196, 0, 1,
-1.22488, -0.002274174, -0.4449767, 1, 0.7568628, 0, 1,
-1.220936, 0.2085251, 0.4148396, 1, 0.7607843, 0, 1,
-1.216933, 1.472818, 1.089238, 1, 0.7686275, 0, 1,
-1.214555, 1.682241, 0.1437531, 1, 0.772549, 0, 1,
-1.212824, 1.313112, -0.07962998, 1, 0.7803922, 0, 1,
-1.206875, 0.3382928, -1.905362, 1, 0.7843137, 0, 1,
-1.196332, 0.09245458, -1.109583, 1, 0.7921569, 0, 1,
-1.190255, 1.655192, 0.04285724, 1, 0.7960784, 0, 1,
-1.188211, -2.098343, -3.551549, 1, 0.8039216, 0, 1,
-1.186911, 0.4931597, 1.245161, 1, 0.8117647, 0, 1,
-1.184355, -1.166033, -3.616659, 1, 0.8156863, 0, 1,
-1.179282, 0.6660709, -1.76499, 1, 0.8235294, 0, 1,
-1.15661, 1.801477, -1.997541, 1, 0.827451, 0, 1,
-1.147653, -0.5567501, -2.346077, 1, 0.8352941, 0, 1,
-1.142279, -1.658959, -4.11623, 1, 0.8392157, 0, 1,
-1.136574, 0.02484122, -1.474042, 1, 0.8470588, 0, 1,
-1.134308, -1.67354, -3.160096, 1, 0.8509804, 0, 1,
-1.103016, 0.9499475, -0.9352232, 1, 0.8588235, 0, 1,
-1.100691, 0.2076306, -0.7301584, 1, 0.8627451, 0, 1,
-1.100323, 2.36376, -1.038137, 1, 0.8705882, 0, 1,
-1.096614, -0.2158108, -2.774566, 1, 0.8745098, 0, 1,
-1.089124, 2.3286, -2.155257, 1, 0.8823529, 0, 1,
-1.088909, -0.4781654, -1.700515, 1, 0.8862745, 0, 1,
-1.087871, 0.6655257, -0.6786537, 1, 0.8941177, 0, 1,
-1.087427, -0.1116656, -0.5177486, 1, 0.8980392, 0, 1,
-1.07845, -1.289775, -2.242167, 1, 0.9058824, 0, 1,
-1.077164, 0.7558596, -1.623643, 1, 0.9137255, 0, 1,
-1.07449, 0.01103333, -0.7968891, 1, 0.9176471, 0, 1,
-1.073815, 1.055013, -0.6230336, 1, 0.9254902, 0, 1,
-1.06269, 0.8021121, 0.4092661, 1, 0.9294118, 0, 1,
-1.058581, -1.039587, -1.608216, 1, 0.9372549, 0, 1,
-1.057289, -0.7416331, -2.794811, 1, 0.9411765, 0, 1,
-1.056683, -0.04838582, -3.938032, 1, 0.9490196, 0, 1,
-1.053769, 0.303305, -1.948845, 1, 0.9529412, 0, 1,
-1.052087, 0.4958283, 0.8675125, 1, 0.9607843, 0, 1,
-1.048663, -1.055399, -3.11918, 1, 0.9647059, 0, 1,
-1.04754, -0.2092904, -3.024777, 1, 0.972549, 0, 1,
-1.045554, -0.471522, -2.68063, 1, 0.9764706, 0, 1,
-1.044366, -0.556382, -1.078272, 1, 0.9843137, 0, 1,
-1.042021, 1.631054, -1.867824, 1, 0.9882353, 0, 1,
-1.039691, 0.3425103, -1.224813, 1, 0.9960784, 0, 1,
-1.031983, 1.159196, -1.293204, 0.9960784, 1, 0, 1,
-1.030459, -1.194952, -2.565438, 0.9921569, 1, 0, 1,
-1.016495, 0.9787242, -0.9358487, 0.9843137, 1, 0, 1,
-1.015402, -0.02827632, -0.7790464, 0.9803922, 1, 0, 1,
-1.007025, 0.06967951, -1.23636, 0.972549, 1, 0, 1,
-1.004929, 0.01793287, -1.072065, 0.9686275, 1, 0, 1,
-1.001197, 0.7470039, 0.6562189, 0.9607843, 1, 0, 1,
-0.9920967, -1.381028, -3.446558, 0.9568627, 1, 0, 1,
-0.9796, -0.08406833, -1.831905, 0.9490196, 1, 0, 1,
-0.9770358, -0.1567781, -1.856637, 0.945098, 1, 0, 1,
-0.9712195, 0.4954448, -1.182767, 0.9372549, 1, 0, 1,
-0.9676256, 0.4611072, -1.583408, 0.9333333, 1, 0, 1,
-0.9672558, 0.4231362, 0.4634234, 0.9254902, 1, 0, 1,
-0.9629175, -0.8273772, -0.8214073, 0.9215686, 1, 0, 1,
-0.962821, -0.04005314, -1.399393, 0.9137255, 1, 0, 1,
-0.9608315, -0.8898959, -3.453852, 0.9098039, 1, 0, 1,
-0.960579, 1.575876, -0.2109766, 0.9019608, 1, 0, 1,
-0.9533089, 0.8876788, -1.432299, 0.8941177, 1, 0, 1,
-0.948994, -0.2957897, -3.444769, 0.8901961, 1, 0, 1,
-0.9437585, 0.9121903, -0.6390662, 0.8823529, 1, 0, 1,
-0.9394587, -0.7337511, -2.7197, 0.8784314, 1, 0, 1,
-0.9351588, 1.978358, 0.2776518, 0.8705882, 1, 0, 1,
-0.9309191, -1.328281, -2.142685, 0.8666667, 1, 0, 1,
-0.9165081, 0.9382353, -0.702004, 0.8588235, 1, 0, 1,
-0.909833, -0.6843916, -3.387913, 0.854902, 1, 0, 1,
-0.9097922, 0.5066715, -1.516038, 0.8470588, 1, 0, 1,
-0.9006698, -0.3883854, -2.278753, 0.8431373, 1, 0, 1,
-0.8993771, 1.98885, -0.7855189, 0.8352941, 1, 0, 1,
-0.8988559, 0.9252071, -1.479176, 0.8313726, 1, 0, 1,
-0.89728, -0.384854, -2.606776, 0.8235294, 1, 0, 1,
-0.8949685, 0.04236162, -1.02931, 0.8196079, 1, 0, 1,
-0.8941883, -0.9897578, -1.092509, 0.8117647, 1, 0, 1,
-0.8941147, 1.151296, -0.576045, 0.8078431, 1, 0, 1,
-0.8921301, -0.3962939, -0.995151, 0.8, 1, 0, 1,
-0.8846236, 0.800333, -0.6832994, 0.7921569, 1, 0, 1,
-0.8842007, -1.457843, -2.893027, 0.7882353, 1, 0, 1,
-0.8825504, -0.6861722, -3.248737, 0.7803922, 1, 0, 1,
-0.8774957, 0.7479581, -2.165734, 0.7764706, 1, 0, 1,
-0.8752312, -2.518477, -2.876644, 0.7686275, 1, 0, 1,
-0.8673956, -1.061756, -2.06284, 0.7647059, 1, 0, 1,
-0.8606536, 0.2849289, -1.408125, 0.7568628, 1, 0, 1,
-0.8600171, -0.8906295, -2.393853, 0.7529412, 1, 0, 1,
-0.8561373, 0.3141737, -2.278334, 0.7450981, 1, 0, 1,
-0.8531929, -0.418565, -0.5556638, 0.7411765, 1, 0, 1,
-0.8523336, 0.5093575, -1.193626, 0.7333333, 1, 0, 1,
-0.8494621, -1.013178, -1.959236, 0.7294118, 1, 0, 1,
-0.8489272, -1.911317, -1.353195, 0.7215686, 1, 0, 1,
-0.8310034, -1.739461, -3.321286, 0.7176471, 1, 0, 1,
-0.8297063, 1.224531, -1.03629, 0.7098039, 1, 0, 1,
-0.8259118, -0.1406069, -0.5225673, 0.7058824, 1, 0, 1,
-0.8257009, -0.656691, -2.25977, 0.6980392, 1, 0, 1,
-0.8214663, -0.05719585, -1.547704, 0.6901961, 1, 0, 1,
-0.8197199, -1.330702, -1.318515, 0.6862745, 1, 0, 1,
-0.8163796, -0.2080042, -2.162004, 0.6784314, 1, 0, 1,
-0.8135002, -2.026467, -2.207637, 0.6745098, 1, 0, 1,
-0.8099768, 0.61943, -0.2366382, 0.6666667, 1, 0, 1,
-0.8085774, 1.687824, 0.9144961, 0.6627451, 1, 0, 1,
-0.8061215, 0.539979, -0.6848401, 0.654902, 1, 0, 1,
-0.8048861, 0.03675037, -2.017339, 0.6509804, 1, 0, 1,
-0.8045003, -0.5433515, -1.753284, 0.6431373, 1, 0, 1,
-0.8040767, -1.239776, -2.696482, 0.6392157, 1, 0, 1,
-0.803076, 1.276457, 0.7388685, 0.6313726, 1, 0, 1,
-0.799677, 0.03115921, -0.8785453, 0.627451, 1, 0, 1,
-0.7920692, -0.6629635, -2.266194, 0.6196079, 1, 0, 1,
-0.7900788, 0.697753, -1.417518, 0.6156863, 1, 0, 1,
-0.7892248, 0.3361833, -2.787108, 0.6078432, 1, 0, 1,
-0.7888456, -0.1450837, -1.745367, 0.6039216, 1, 0, 1,
-0.7800863, 0.6678764, -2.278246, 0.5960785, 1, 0, 1,
-0.7734488, -0.6283488, -3.357888, 0.5882353, 1, 0, 1,
-0.7691395, 0.9013762, -0.3834262, 0.5843138, 1, 0, 1,
-0.7626382, 1.418163, -0.5340875, 0.5764706, 1, 0, 1,
-0.7617226, -0.06896977, -0.1762034, 0.572549, 1, 0, 1,
-0.7616583, 1.282744, -0.9828098, 0.5647059, 1, 0, 1,
-0.7594021, -0.928874, -3.916022, 0.5607843, 1, 0, 1,
-0.7573612, 0.1563714, -0.9616549, 0.5529412, 1, 0, 1,
-0.7527127, 1.639504, -0.4065855, 0.5490196, 1, 0, 1,
-0.7449656, 1.08278, 2.084054, 0.5411765, 1, 0, 1,
-0.7439763, -0.08206869, -2.948034, 0.5372549, 1, 0, 1,
-0.7428284, 0.06180683, -0.8927514, 0.5294118, 1, 0, 1,
-0.7399027, 0.4860168, 0.3496336, 0.5254902, 1, 0, 1,
-0.739673, 1.236846, -0.7445616, 0.5176471, 1, 0, 1,
-0.7371839, 1.116607, 1.357605, 0.5137255, 1, 0, 1,
-0.7334374, -2.053569, -3.335769, 0.5058824, 1, 0, 1,
-0.7308478, 0.01332463, 0.4268178, 0.5019608, 1, 0, 1,
-0.7298146, 0.05013664, -0.6757467, 0.4941176, 1, 0, 1,
-0.7296909, 0.7305148, -3.253085, 0.4862745, 1, 0, 1,
-0.7196159, -1.390956, -1.421817, 0.4823529, 1, 0, 1,
-0.7162269, -0.1224256, -1.70871, 0.4745098, 1, 0, 1,
-0.7153584, 0.6735958, -1.529344, 0.4705882, 1, 0, 1,
-0.7119277, -1.128736, -2.205755, 0.4627451, 1, 0, 1,
-0.7105083, -1.528532, -4.165608, 0.4588235, 1, 0, 1,
-0.7104822, 0.2032567, 0.2621568, 0.4509804, 1, 0, 1,
-0.7099246, 0.5790629, -0.3095907, 0.4470588, 1, 0, 1,
-0.7054904, 0.6565655, -1.56238, 0.4392157, 1, 0, 1,
-0.7034362, -0.2040695, -3.006075, 0.4352941, 1, 0, 1,
-0.6887547, -0.4733727, -1.889081, 0.427451, 1, 0, 1,
-0.6887284, 2.722621, -0.05082384, 0.4235294, 1, 0, 1,
-0.6858349, -0.03343571, -2.394811, 0.4156863, 1, 0, 1,
-0.6841913, 0.3096632, -0.9684414, 0.4117647, 1, 0, 1,
-0.6815652, 0.7491722, -0.9801925, 0.4039216, 1, 0, 1,
-0.6749768, 0.8796811, 0.05214465, 0.3960784, 1, 0, 1,
-0.6749037, -0.07132103, -2.115149, 0.3921569, 1, 0, 1,
-0.6736251, 0.8705465, -1.126399, 0.3843137, 1, 0, 1,
-0.673353, 0.1905433, -1.09269, 0.3803922, 1, 0, 1,
-0.6626439, -0.2121973, -0.7743505, 0.372549, 1, 0, 1,
-0.6621146, 0.6774264, -1.397742, 0.3686275, 1, 0, 1,
-0.6603882, -0.01298801, -1.839386, 0.3607843, 1, 0, 1,
-0.6596609, 0.8641923, 0.4802143, 0.3568628, 1, 0, 1,
-0.6583698, -0.003105158, -2.085299, 0.3490196, 1, 0, 1,
-0.6583101, 0.854735, -0.07642809, 0.345098, 1, 0, 1,
-0.6582497, 0.2477299, -0.7840788, 0.3372549, 1, 0, 1,
-0.6510938, 0.8984348, 0.9177198, 0.3333333, 1, 0, 1,
-0.6491534, -0.9815903, -0.9721913, 0.3254902, 1, 0, 1,
-0.6457579, 0.9888128, 0.04668286, 0.3215686, 1, 0, 1,
-0.6447217, 0.06158056, -1.509485, 0.3137255, 1, 0, 1,
-0.6436161, 0.4929555, -1.536548, 0.3098039, 1, 0, 1,
-0.6388035, -0.1001739, -0.6932881, 0.3019608, 1, 0, 1,
-0.6383582, 0.6387338, -1.338976, 0.2941177, 1, 0, 1,
-0.6361505, -0.5451989, -2.072169, 0.2901961, 1, 0, 1,
-0.6345938, -1.385621, -1.4369, 0.282353, 1, 0, 1,
-0.6328033, -1.170952, 0.4979913, 0.2784314, 1, 0, 1,
-0.6299601, 0.3148607, -1.754358, 0.2705882, 1, 0, 1,
-0.6293454, -0.6867071, -2.089504, 0.2666667, 1, 0, 1,
-0.6273223, -0.4705921, -2.102619, 0.2588235, 1, 0, 1,
-0.6198401, -0.7690696, -4.259542, 0.254902, 1, 0, 1,
-0.6171814, -0.5911589, -2.512297, 0.2470588, 1, 0, 1,
-0.6167855, -0.8682771, -3.066518, 0.2431373, 1, 0, 1,
-0.6118205, -0.2766983, -0.8411808, 0.2352941, 1, 0, 1,
-0.6102281, 0.4847967, -1.480305, 0.2313726, 1, 0, 1,
-0.608434, 0.7642683, -2.016647, 0.2235294, 1, 0, 1,
-0.6036144, 0.7150177, -0.5679146, 0.2196078, 1, 0, 1,
-0.6006237, 0.1410753, -2.254332, 0.2117647, 1, 0, 1,
-0.5922252, -0.1490404, -2.804823, 0.2078431, 1, 0, 1,
-0.5916772, -0.8333637, -3.45968, 0.2, 1, 0, 1,
-0.5883962, -1.442163, -3.297205, 0.1921569, 1, 0, 1,
-0.5879384, 0.9794423, -1.125354, 0.1882353, 1, 0, 1,
-0.5870069, -0.5835343, -1.329028, 0.1803922, 1, 0, 1,
-0.5857322, -0.01304526, -3.451963, 0.1764706, 1, 0, 1,
-0.5855923, -0.9646406, -2.20503, 0.1686275, 1, 0, 1,
-0.5855322, -0.7211027, -1.720167, 0.1647059, 1, 0, 1,
-0.5824478, -0.3727978, -2.006567, 0.1568628, 1, 0, 1,
-0.5804852, 0.4017544, -3.003099, 0.1529412, 1, 0, 1,
-0.5799017, 0.2668069, -0.4440692, 0.145098, 1, 0, 1,
-0.5796574, -0.6087636, -2.136471, 0.1411765, 1, 0, 1,
-0.577275, 1.883765, -0.07831384, 0.1333333, 1, 0, 1,
-0.576323, -1.549778, -2.79871, 0.1294118, 1, 0, 1,
-0.5758303, -1.010769, -2.95986, 0.1215686, 1, 0, 1,
-0.5721653, -0.3705426, -1.775187, 0.1176471, 1, 0, 1,
-0.5718677, 1.502663, -0.1640231, 0.1098039, 1, 0, 1,
-0.5593826, -0.8893299, -2.254846, 0.1058824, 1, 0, 1,
-0.5531425, -0.7952154, -3.459152, 0.09803922, 1, 0, 1,
-0.5527642, 0.4417498, -0.6499316, 0.09019608, 1, 0, 1,
-0.5510772, 0.6128223, -0.8479592, 0.08627451, 1, 0, 1,
-0.548498, -0.8448162, -3.55683, 0.07843138, 1, 0, 1,
-0.543537, 0.7574474, 0.2999173, 0.07450981, 1, 0, 1,
-0.5434943, -0.5135976, -0.9292181, 0.06666667, 1, 0, 1,
-0.5434814, -0.3917325, -1.380926, 0.0627451, 1, 0, 1,
-0.5420313, 0.4236061, -0.4920568, 0.05490196, 1, 0, 1,
-0.525436, 0.8822998, 0.3623171, 0.05098039, 1, 0, 1,
-0.5216591, 0.3436614, -1.584982, 0.04313726, 1, 0, 1,
-0.5100465, -1.499792, -3.723579, 0.03921569, 1, 0, 1,
-0.5100353, -0.4477228, -2.967642, 0.03137255, 1, 0, 1,
-0.5090259, 0.3329265, -1.429545, 0.02745098, 1, 0, 1,
-0.5083734, -1.306093, -4.044087, 0.01960784, 1, 0, 1,
-0.4982301, -0.3366128, -0.7440148, 0.01568628, 1, 0, 1,
-0.490787, 0.2944698, 0.05546274, 0.007843138, 1, 0, 1,
-0.4904698, 0.4154058, -1.170051, 0.003921569, 1, 0, 1,
-0.4804799, -0.6002398, -2.758395, 0, 1, 0.003921569, 1,
-0.4782018, 1.557003, -1.520306, 0, 1, 0.01176471, 1,
-0.4753194, -0.3528932, -2.867179, 0, 1, 0.01568628, 1,
-0.4691904, -1.909771, -3.139695, 0, 1, 0.02352941, 1,
-0.4657318, 1.923482, 0.01224407, 0, 1, 0.02745098, 1,
-0.4642347, -0.3183004, -3.223647, 0, 1, 0.03529412, 1,
-0.464146, 0.6617362, 0.1839555, 0, 1, 0.03921569, 1,
-0.4629192, -1.270465, -2.565523, 0, 1, 0.04705882, 1,
-0.4617937, 1.934348, -2.652659, 0, 1, 0.05098039, 1,
-0.4604425, 0.003150569, -1.873266, 0, 1, 0.05882353, 1,
-0.4582954, 1.015519, 0.07131275, 0, 1, 0.0627451, 1,
-0.4564639, 0.8647602, -0.4531275, 0, 1, 0.07058824, 1,
-0.4561085, -0.7856177, -2.721717, 0, 1, 0.07450981, 1,
-0.4552104, -0.02780857, -1.649508, 0, 1, 0.08235294, 1,
-0.4544629, 0.1633726, 2.117724, 0, 1, 0.08627451, 1,
-0.4513547, -1.812255, -3.861146, 0, 1, 0.09411765, 1,
-0.4481634, 0.5910366, 2.00264, 0, 1, 0.1019608, 1,
-0.4464614, -0.5681564, -2.561011, 0, 1, 0.1058824, 1,
-0.4432306, -0.7285042, -3.246897, 0, 1, 0.1137255, 1,
-0.442921, 0.5730459, -0.5633497, 0, 1, 0.1176471, 1,
-0.4416924, -1.493218, -3.001536, 0, 1, 0.1254902, 1,
-0.4375664, -0.3904363, -1.800881, 0, 1, 0.1294118, 1,
-0.4311364, 0.4576111, -0.4515862, 0, 1, 0.1372549, 1,
-0.430886, 0.3977939, -2.302138, 0, 1, 0.1411765, 1,
-0.4284922, -0.9459688, -2.014017, 0, 1, 0.1490196, 1,
-0.4159779, -0.140088, -2.311215, 0, 1, 0.1529412, 1,
-0.4141355, 0.4202046, -1.882739, 0, 1, 0.1607843, 1,
-0.4138072, 0.8431819, -1.57791, 0, 1, 0.1647059, 1,
-0.4067724, 0.9261049, 0.46345, 0, 1, 0.172549, 1,
-0.4060678, -0.4520936, -1.607877, 0, 1, 0.1764706, 1,
-0.4057154, 0.1552965, -1.446961, 0, 1, 0.1843137, 1,
-0.3968474, -1.192393, -3.061885, 0, 1, 0.1882353, 1,
-0.3964606, -0.7415123, -3.077103, 0, 1, 0.1960784, 1,
-0.386062, -0.6968388, -2.557799, 0, 1, 0.2039216, 1,
-0.385814, 0.529882, 0.4088314, 0, 1, 0.2078431, 1,
-0.3856201, 0.5036051, -1.063151, 0, 1, 0.2156863, 1,
-0.3832484, 0.880626, -0.7511141, 0, 1, 0.2196078, 1,
-0.3776976, 1.595377, -0.4026247, 0, 1, 0.227451, 1,
-0.3766404, -0.7813366, -1.839428, 0, 1, 0.2313726, 1,
-0.3710698, 1.344758, -2.901902, 0, 1, 0.2392157, 1,
-0.3700403, -1.819411, -2.045894, 0, 1, 0.2431373, 1,
-0.3669492, 0.496789, -0.0784387, 0, 1, 0.2509804, 1,
-0.3638642, 0.1995158, -1.628225, 0, 1, 0.254902, 1,
-0.3633858, -0.3531408, -1.928428, 0, 1, 0.2627451, 1,
-0.3625296, -0.8982981, -3.787474, 0, 1, 0.2666667, 1,
-0.3590938, -0.1124275, -1.876333, 0, 1, 0.2745098, 1,
-0.3581552, 0.4947004, -0.3155704, 0, 1, 0.2784314, 1,
-0.3567737, 0.5443256, -0.8003983, 0, 1, 0.2862745, 1,
-0.3474357, 1.656409, 0.4245333, 0, 1, 0.2901961, 1,
-0.3471435, -1.570346, -4.180162, 0, 1, 0.2980392, 1,
-0.3469021, 0.474933, 0.5762601, 0, 1, 0.3058824, 1,
-0.3443561, 0.02368083, -1.727142, 0, 1, 0.3098039, 1,
-0.3439582, -0.4592935, -1.943732, 0, 1, 0.3176471, 1,
-0.3427228, -0.9255161, -4.999666, 0, 1, 0.3215686, 1,
-0.3423508, -1.597727, -3.175235, 0, 1, 0.3294118, 1,
-0.3394414, 1.445591, 0.3707603, 0, 1, 0.3333333, 1,
-0.3279071, 0.03113815, -1.617382, 0, 1, 0.3411765, 1,
-0.3273869, 0.9181797, 0.0336839, 0, 1, 0.345098, 1,
-0.324486, -0.2678354, -2.175581, 0, 1, 0.3529412, 1,
-0.3200987, 0.912191, -0.004815018, 0, 1, 0.3568628, 1,
-0.3089793, -1.417042, -3.041643, 0, 1, 0.3647059, 1,
-0.3087053, -1.222821, -3.29265, 0, 1, 0.3686275, 1,
-0.2986586, 1.637023, -0.3969375, 0, 1, 0.3764706, 1,
-0.2917961, 1.025078, 0.6436068, 0, 1, 0.3803922, 1,
-0.2874304, 1.346639, -0.04982124, 0, 1, 0.3882353, 1,
-0.2708074, -0.07974842, -1.789739, 0, 1, 0.3921569, 1,
-0.2683422, 0.2561737, -1.075747, 0, 1, 0.4, 1,
-0.267845, 0.3670177, 0.8426479, 0, 1, 0.4078431, 1,
-0.266186, 0.006688248, -0.8532003, 0, 1, 0.4117647, 1,
-0.264771, -1.22635, -2.973316, 0, 1, 0.4196078, 1,
-0.2596009, 0.2674778, -1.85217, 0, 1, 0.4235294, 1,
-0.251225, 1.410852, 0.02259515, 0, 1, 0.4313726, 1,
-0.249496, 1.592392, 0.8903588, 0, 1, 0.4352941, 1,
-0.2476659, 0.3867222, 1.187333, 0, 1, 0.4431373, 1,
-0.2450485, 1.23284, -0.5294408, 0, 1, 0.4470588, 1,
-0.242905, 1.687511, 0.6912583, 0, 1, 0.454902, 1,
-0.2424461, 0.7763227, -2.306867, 0, 1, 0.4588235, 1,
-0.2421993, 1.310933, -1.385608, 0, 1, 0.4666667, 1,
-0.2408046, 0.4039996, -0.8164703, 0, 1, 0.4705882, 1,
-0.2318293, 0.5364088, -0.7211451, 0, 1, 0.4784314, 1,
-0.2316128, 1.170615, -1.071534, 0, 1, 0.4823529, 1,
-0.2311007, -1.160111, -3.672142, 0, 1, 0.4901961, 1,
-0.2274371, 0.1657834, -3.180721, 0, 1, 0.4941176, 1,
-0.2273362, 1.534373, -0.3725649, 0, 1, 0.5019608, 1,
-0.225482, 1.399327, -0.4414626, 0, 1, 0.509804, 1,
-0.2247801, -1.036039, -1.608277, 0, 1, 0.5137255, 1,
-0.2237831, -0.09953149, -1.652769, 0, 1, 0.5215687, 1,
-0.2224448, 1.181633, -1.386601, 0, 1, 0.5254902, 1,
-0.220131, -1.795174, -2.302387, 0, 1, 0.5333334, 1,
-0.2190396, 2.162823, 0.2406767, 0, 1, 0.5372549, 1,
-0.216101, -0.3494498, -2.483011, 0, 1, 0.5450981, 1,
-0.2141491, 0.5529496, -1.321153, 0, 1, 0.5490196, 1,
-0.2116547, 0.4594015, -0.430021, 0, 1, 0.5568628, 1,
-0.207608, -0.07921434, -2.889184, 0, 1, 0.5607843, 1,
-0.2053957, -0.447182, -1.480177, 0, 1, 0.5686275, 1,
-0.2036362, -2.27798, -1.847141, 0, 1, 0.572549, 1,
-0.2016389, -0.4392321, -2.552841, 0, 1, 0.5803922, 1,
-0.200394, -2.093179, -4.774191, 0, 1, 0.5843138, 1,
-0.1976776, 0.6583875, 0.1674347, 0, 1, 0.5921569, 1,
-0.1945324, 2.707202, -1.624337, 0, 1, 0.5960785, 1,
-0.1931625, 1.175258, -0.9764055, 0, 1, 0.6039216, 1,
-0.1890538, -1.656659, -4.169067, 0, 1, 0.6117647, 1,
-0.185147, -0.3590796, -2.563767, 0, 1, 0.6156863, 1,
-0.1842708, -0.6219292, -2.247754, 0, 1, 0.6235294, 1,
-0.183637, -0.3309712, -2.657428, 0, 1, 0.627451, 1,
-0.1778061, 2.213262, 0.4825692, 0, 1, 0.6352941, 1,
-0.1774116, -0.006365865, -0.6138647, 0, 1, 0.6392157, 1,
-0.1681607, -0.1168561, -2.56279, 0, 1, 0.6470588, 1,
-0.1632659, -0.04330176, -1.808423, 0, 1, 0.6509804, 1,
-0.162724, 0.5269532, 1.030936, 0, 1, 0.6588235, 1,
-0.1611862, 1.352262, 0.7868248, 0, 1, 0.6627451, 1,
-0.1590261, -1.105972, -2.722192, 0, 1, 0.6705883, 1,
-0.1537364, -1.443354, -4.150556, 0, 1, 0.6745098, 1,
-0.1496634, 0.507636, -0.512839, 0, 1, 0.682353, 1,
-0.147122, 0.3531957, -0.3502588, 0, 1, 0.6862745, 1,
-0.1463716, 1.166603, -0.320029, 0, 1, 0.6941177, 1,
-0.1459803, 0.06896371, -1.579062, 0, 1, 0.7019608, 1,
-0.1423535, -0.6942515, -3.538787, 0, 1, 0.7058824, 1,
-0.1374416, 0.8569698, -0.5870557, 0, 1, 0.7137255, 1,
-0.1302907, -1.151143, -2.528091, 0, 1, 0.7176471, 1,
-0.1268114, 0.3708812, -1.042971, 0, 1, 0.7254902, 1,
-0.1256589, 0.2144989, 0.1225708, 0, 1, 0.7294118, 1,
-0.124481, 0.4178469, 0.292861, 0, 1, 0.7372549, 1,
-0.1242101, -0.01467955, -2.526939, 0, 1, 0.7411765, 1,
-0.1237495, 1.478189, 0.9297655, 0, 1, 0.7490196, 1,
-0.1182343, -0.1239975, -1.227043, 0, 1, 0.7529412, 1,
-0.1169187, -0.1477152, -2.543231, 0, 1, 0.7607843, 1,
-0.1053716, -1.102953, -2.908752, 0, 1, 0.7647059, 1,
-0.1016998, 1.273469, 0.1780264, 0, 1, 0.772549, 1,
-0.09961225, -0.2801595, -2.37594, 0, 1, 0.7764706, 1,
-0.09597321, 1.285419, 0.1861095, 0, 1, 0.7843137, 1,
-0.09526104, 0.2788009, -0.2408506, 0, 1, 0.7882353, 1,
-0.09183614, -0.3369201, -3.082967, 0, 1, 0.7960784, 1,
-0.09161863, 0.2901769, 0.07467072, 0, 1, 0.8039216, 1,
-0.09052392, -1.110313, -2.829084, 0, 1, 0.8078431, 1,
-0.08700871, -0.2419605, -3.76294, 0, 1, 0.8156863, 1,
-0.08628696, 0.7010443, -1.245017, 0, 1, 0.8196079, 1,
-0.0841364, 1.088015, 0.4003047, 0, 1, 0.827451, 1,
-0.07798287, 1.400253, 0.06082813, 0, 1, 0.8313726, 1,
-0.07770661, 1.358843, -0.1157001, 0, 1, 0.8392157, 1,
-0.07587957, -0.237716, -1.85208, 0, 1, 0.8431373, 1,
-0.07541098, 1.225927, 1.106818, 0, 1, 0.8509804, 1,
-0.07421473, -0.4542489, -2.427253, 0, 1, 0.854902, 1,
-0.07401393, -0.2076902, -2.418725, 0, 1, 0.8627451, 1,
-0.06383273, 0.6839679, 1.374414, 0, 1, 0.8666667, 1,
-0.06288949, -2.130553, -2.610584, 0, 1, 0.8745098, 1,
-0.05793711, 0.7698732, -0.5086159, 0, 1, 0.8784314, 1,
-0.05760941, -0.3278201, -0.1606824, 0, 1, 0.8862745, 1,
-0.05355783, -0.2414524, -3.516433, 0, 1, 0.8901961, 1,
-0.05185569, 1.446766, -0.1633591, 0, 1, 0.8980392, 1,
-0.04921791, 0.8423259, -1.055295, 0, 1, 0.9058824, 1,
-0.0489103, 0.4602223, 0.32359, 0, 1, 0.9098039, 1,
-0.04370484, -1.160766, -4.362124, 0, 1, 0.9176471, 1,
-0.04117133, -0.8128976, -2.750062, 0, 1, 0.9215686, 1,
-0.03976429, -1.248978, -1.443331, 0, 1, 0.9294118, 1,
-0.03743069, -0.4763671, -2.716527, 0, 1, 0.9333333, 1,
-0.03693637, -1.17815, -4.338061, 0, 1, 0.9411765, 1,
-0.02457669, -0.4257265, -4.351438, 0, 1, 0.945098, 1,
-0.02448351, -0.6737158, -4.087827, 0, 1, 0.9529412, 1,
-0.02228787, -0.0377037, -2.256034, 0, 1, 0.9568627, 1,
-0.01839985, -0.1767947, -4.066028, 0, 1, 0.9647059, 1,
-0.01635849, -0.1319019, -1.367659, 0, 1, 0.9686275, 1,
-0.01546612, 0.347751, 0.4735375, 0, 1, 0.9764706, 1,
-0.01416049, 0.03708195, 0.3795886, 0, 1, 0.9803922, 1,
-0.009901252, 1.199806, -0.146349, 0, 1, 0.9882353, 1,
-0.008214233, 0.6831612, -0.4107821, 0, 1, 0.9921569, 1,
-0.006475435, 1.327368, 1.97929, 0, 1, 1, 1,
-0.0006806332, 1.56741, -0.8921175, 0, 0.9921569, 1, 1,
-0.000620136, 0.3791604, -0.5618679, 0, 0.9882353, 1, 1,
-0.0004162418, -0.3400695, -1.915573, 0, 0.9803922, 1, 1,
-0.0004075346, 0.03735988, -0.8356429, 0, 0.9764706, 1, 1,
0.0001465257, -1.148739, 3.3868, 0, 0.9686275, 1, 1,
0.003258085, 0.8519156, 0.4406272, 0, 0.9647059, 1, 1,
0.01760419, -0.7643706, 2.086381, 0, 0.9568627, 1, 1,
0.0213722, -0.6792166, 3.51531, 0, 0.9529412, 1, 1,
0.02313151, -1.092236, 4.670764, 0, 0.945098, 1, 1,
0.02394127, -1.2999, 2.776175, 0, 0.9411765, 1, 1,
0.0243711, 0.2647659, 0.7007636, 0, 0.9333333, 1, 1,
0.02479482, -1.49303, 1.636095, 0, 0.9294118, 1, 1,
0.02520661, 0.5051326, -0.2526024, 0, 0.9215686, 1, 1,
0.02766226, 0.512182, 0.120545, 0, 0.9176471, 1, 1,
0.02822268, 0.3625322, 1.014672, 0, 0.9098039, 1, 1,
0.03110349, 1.05387, -0.7147864, 0, 0.9058824, 1, 1,
0.03353734, 0.8243325, 0.8392086, 0, 0.8980392, 1, 1,
0.03668767, 0.5031537, 1.945754, 0, 0.8901961, 1, 1,
0.04161402, -0.6340796, 2.659846, 0, 0.8862745, 1, 1,
0.04264909, 0.9259111, 0.6874121, 0, 0.8784314, 1, 1,
0.04525151, 0.5443999, -0.05070532, 0, 0.8745098, 1, 1,
0.04804827, 1.909431, 0.3208058, 0, 0.8666667, 1, 1,
0.0486006, -0.6690593, 2.778086, 0, 0.8627451, 1, 1,
0.04962688, -0.9018289, 2.20564, 0, 0.854902, 1, 1,
0.05037349, -0.03480139, 2.010641, 0, 0.8509804, 1, 1,
0.05240982, 0.7864882, 0.4052468, 0, 0.8431373, 1, 1,
0.05407242, 0.5099339, 1.461564, 0, 0.8392157, 1, 1,
0.05531349, -0.09220636, 2.34766, 0, 0.8313726, 1, 1,
0.05705591, 0.5812798, -0.2259262, 0, 0.827451, 1, 1,
0.06143091, 0.1074124, 1.630254, 0, 0.8196079, 1, 1,
0.06274007, 0.4815735, -0.1373872, 0, 0.8156863, 1, 1,
0.06593838, -0.5455446, 5.004898, 0, 0.8078431, 1, 1,
0.07642961, -1.19516, 2.579811, 0, 0.8039216, 1, 1,
0.08358384, 0.242524, -0.9516127, 0, 0.7960784, 1, 1,
0.08695535, 0.2009306, 0.01824811, 0, 0.7882353, 1, 1,
0.09135344, -0.09522383, 1.517749, 0, 0.7843137, 1, 1,
0.0937317, -1.70562, 0.7476814, 0, 0.7764706, 1, 1,
0.09504727, 1.401934, 0.4304479, 0, 0.772549, 1, 1,
0.09548465, 0.696633, 0.3799602, 0, 0.7647059, 1, 1,
0.09637867, -0.3066162, 3.508103, 0, 0.7607843, 1, 1,
0.096531, 0.04557039, 0.4828262, 0, 0.7529412, 1, 1,
0.09713423, -0.9027997, 4.449722, 0, 0.7490196, 1, 1,
0.1000409, -0.633276, 2.200911, 0, 0.7411765, 1, 1,
0.1011677, 1.639843, -0.8667424, 0, 0.7372549, 1, 1,
0.1016635, -0.00985482, 1.474401, 0, 0.7294118, 1, 1,
0.1031306, -1.678469, 1.612589, 0, 0.7254902, 1, 1,
0.1033603, -0.3620173, 1.92556, 0, 0.7176471, 1, 1,
0.1063666, 0.9667566, -1.842885, 0, 0.7137255, 1, 1,
0.1086503, 1.450418, -1.487176, 0, 0.7058824, 1, 1,
0.1096838, -1.148667, 3.448939, 0, 0.6980392, 1, 1,
0.1159532, 0.05961728, 1.654567, 0, 0.6941177, 1, 1,
0.1211502, -0.9625033, 2.93523, 0, 0.6862745, 1, 1,
0.1220153, -0.990144, 4.313269, 0, 0.682353, 1, 1,
0.1233722, -0.814696, 3.386172, 0, 0.6745098, 1, 1,
0.1242927, -1.782091, 3.450456, 0, 0.6705883, 1, 1,
0.1245279, -0.04729807, 1.591056, 0, 0.6627451, 1, 1,
0.1253176, -0.6446185, 3.59628, 0, 0.6588235, 1, 1,
0.1258122, -0.7036296, 2.524805, 0, 0.6509804, 1, 1,
0.1280483, 0.8770855, -0.8442679, 0, 0.6470588, 1, 1,
0.1291642, -0.1954776, 2.756699, 0, 0.6392157, 1, 1,
0.1291779, 0.6083977, -0.8544452, 0, 0.6352941, 1, 1,
0.1301015, 0.9129231, 0.7421821, 0, 0.627451, 1, 1,
0.1306418, -0.4801773, 3.271458, 0, 0.6235294, 1, 1,
0.131763, 0.1968602, -0.1466218, 0, 0.6156863, 1, 1,
0.131769, -0.4031957, 2.521907, 0, 0.6117647, 1, 1,
0.1332804, -0.3450139, 2.569057, 0, 0.6039216, 1, 1,
0.1361496, 0.2053865, 0.1916028, 0, 0.5960785, 1, 1,
0.1373823, 0.8620678, -1.296455, 0, 0.5921569, 1, 1,
0.1397466, -0.9333276, 3.765653, 0, 0.5843138, 1, 1,
0.1469293, 1.448065, 1.927599, 0, 0.5803922, 1, 1,
0.1476782, -0.5103125, 3.666401, 0, 0.572549, 1, 1,
0.1494116, 0.3577102, 0.5460691, 0, 0.5686275, 1, 1,
0.1498484, 0.3463295, -0.08843296, 0, 0.5607843, 1, 1,
0.151712, -0.9701499, 2.714933, 0, 0.5568628, 1, 1,
0.155141, -2.279053, 2.281192, 0, 0.5490196, 1, 1,
0.1574511, -0.4748492, 3.125494, 0, 0.5450981, 1, 1,
0.1577733, -1.325178, 1.751816, 0, 0.5372549, 1, 1,
0.1594467, 1.288862, -0.005896014, 0, 0.5333334, 1, 1,
0.1629698, 0.911081, -0.4057371, 0, 0.5254902, 1, 1,
0.1633547, -0.3970497, 2.008882, 0, 0.5215687, 1, 1,
0.1665395, 1.247975, 0.751727, 0, 0.5137255, 1, 1,
0.1668615, 1.033969, 1.227003, 0, 0.509804, 1, 1,
0.1676915, 0.4931418, 0.2871714, 0, 0.5019608, 1, 1,
0.1688494, -0.8665566, 3.197936, 0, 0.4941176, 1, 1,
0.1695119, 0.1751492, 2.247804, 0, 0.4901961, 1, 1,
0.1695921, -0.3604262, 2.959082, 0, 0.4823529, 1, 1,
0.1698125, 0.0772773, 1.160708, 0, 0.4784314, 1, 1,
0.1765004, 1.005103, 0.7251593, 0, 0.4705882, 1, 1,
0.1786832, -0.2094982, 3.072215, 0, 0.4666667, 1, 1,
0.1798832, -0.32886, 2.732612, 0, 0.4588235, 1, 1,
0.1837452, 1.247957, 0.2737653, 0, 0.454902, 1, 1,
0.1838907, -1.80032, 5.386341, 0, 0.4470588, 1, 1,
0.1872184, 0.285654, -0.09380237, 0, 0.4431373, 1, 1,
0.1903562, 0.7276904, 1.995772, 0, 0.4352941, 1, 1,
0.1912606, -0.5580941, 3.270801, 0, 0.4313726, 1, 1,
0.1939707, -1.470463, 1.488394, 0, 0.4235294, 1, 1,
0.1940557, -0.9249732, 1.543689, 0, 0.4196078, 1, 1,
0.1988869, 1.388627, 0.2262892, 0, 0.4117647, 1, 1,
0.1994425, 0.2937867, -0.3938233, 0, 0.4078431, 1, 1,
0.2000555, 0.8184975, 1.901751, 0, 0.4, 1, 1,
0.2034948, -1.492595, 4.013748, 0, 0.3921569, 1, 1,
0.2074929, -0.57239, 3.140659, 0, 0.3882353, 1, 1,
0.2077786, 0.6361631, -2.188103, 0, 0.3803922, 1, 1,
0.207868, 0.4958886, -0.169445, 0, 0.3764706, 1, 1,
0.2112608, -0.5933877, 1.936314, 0, 0.3686275, 1, 1,
0.2152366, -1.91517, 1.861712, 0, 0.3647059, 1, 1,
0.2160109, 0.5308746, 1.522782, 0, 0.3568628, 1, 1,
0.226283, -0.2826071, 1.671957, 0, 0.3529412, 1, 1,
0.2267657, -0.3844437, 2.676453, 0, 0.345098, 1, 1,
0.231637, 0.3069301, 1.161649, 0, 0.3411765, 1, 1,
0.2343771, 0.38848, 0.0889824, 0, 0.3333333, 1, 1,
0.2352249, -0.3543518, 4.049726, 0, 0.3294118, 1, 1,
0.2368429, -2.144918, 2.220597, 0, 0.3215686, 1, 1,
0.2425453, -0.1514442, 1.651064, 0, 0.3176471, 1, 1,
0.2486279, -0.8750145, 1.21989, 0, 0.3098039, 1, 1,
0.2506481, 0.8674766, 1.154207, 0, 0.3058824, 1, 1,
0.2521421, -0.4593953, 3.425509, 0, 0.2980392, 1, 1,
0.2642092, 0.755377, 1.14282, 0, 0.2901961, 1, 1,
0.2643186, 1.192624, 0.6811732, 0, 0.2862745, 1, 1,
0.2646394, 1.622119, -0.3546555, 0, 0.2784314, 1, 1,
0.2686576, -0.2409926, 0.02737109, 0, 0.2745098, 1, 1,
0.2734778, 1.633718, -0.1366939, 0, 0.2666667, 1, 1,
0.2764108, -1.542233, 2.668677, 0, 0.2627451, 1, 1,
0.2768048, 1.081273, -0.6193113, 0, 0.254902, 1, 1,
0.2783063, -1.316821, 3.639692, 0, 0.2509804, 1, 1,
0.2795664, -1.027244, 3.954704, 0, 0.2431373, 1, 1,
0.2828115, -0.5307404, 3.449218, 0, 0.2392157, 1, 1,
0.2839592, 1.356736, -1.429339, 0, 0.2313726, 1, 1,
0.2861932, -0.06447513, 1.207202, 0, 0.227451, 1, 1,
0.288195, -1.403577, 3.618734, 0, 0.2196078, 1, 1,
0.2945097, 0.2711242, 1.720688, 0, 0.2156863, 1, 1,
0.2993974, 0.7310804, 1.270475, 0, 0.2078431, 1, 1,
0.3005086, 2.109532, -1.532058, 0, 0.2039216, 1, 1,
0.3007307, -1.055403, 1.509437, 0, 0.1960784, 1, 1,
0.3060394, -0.1686006, 2.776788, 0, 0.1882353, 1, 1,
0.306574, -2.019424, 2.060002, 0, 0.1843137, 1, 1,
0.3069066, -1.058957, 3.075296, 0, 0.1764706, 1, 1,
0.3098441, 1.767688, -1.94142, 0, 0.172549, 1, 1,
0.3107443, 1.170965, -0.1282856, 0, 0.1647059, 1, 1,
0.3190329, -1.618637, 1.70303, 0, 0.1607843, 1, 1,
0.3269784, 0.9377857, 0.424895, 0, 0.1529412, 1, 1,
0.3288892, 0.6134365, 0.9910154, 0, 0.1490196, 1, 1,
0.3294605, 0.3058505, 0.5817447, 0, 0.1411765, 1, 1,
0.3307219, 0.1673099, 2.76895, 0, 0.1372549, 1, 1,
0.3334053, 0.02211449, 1.546864, 0, 0.1294118, 1, 1,
0.3444991, -0.1958874, 2.433381, 0, 0.1254902, 1, 1,
0.3477785, 0.1027698, 0.5382919, 0, 0.1176471, 1, 1,
0.3483595, -0.2349782, 1.800953, 0, 0.1137255, 1, 1,
0.3491264, -0.3366839, 2.942832, 0, 0.1058824, 1, 1,
0.3516488, -0.5071089, 3.848591, 0, 0.09803922, 1, 1,
0.3570311, -1.398031, 2.539188, 0, 0.09411765, 1, 1,
0.3588922, 0.6068523, 0.4352252, 0, 0.08627451, 1, 1,
0.359635, -1.726771, 2.860869, 0, 0.08235294, 1, 1,
0.3622925, 1.762311, 0.7725852, 0, 0.07450981, 1, 1,
0.3665733, -1.464367, 1.342232, 0, 0.07058824, 1, 1,
0.3714498, -0.2364745, 2.550756, 0, 0.0627451, 1, 1,
0.3794863, -1.175433, 3.010632, 0, 0.05882353, 1, 1,
0.3847069, -1.607491, 2.610786, 0, 0.05098039, 1, 1,
0.385622, -0.01564344, 3.103704, 0, 0.04705882, 1, 1,
0.3878037, -0.3171346, 1.828295, 0, 0.03921569, 1, 1,
0.3879307, -0.7695978, 2.599568, 0, 0.03529412, 1, 1,
0.4049362, -1.117017, 3.250218, 0, 0.02745098, 1, 1,
0.4071908, -0.2505131, 2.209786, 0, 0.02352941, 1, 1,
0.4079789, -1.469204, 3.479623, 0, 0.01568628, 1, 1,
0.4108269, -0.1270176, 3.269143, 0, 0.01176471, 1, 1,
0.4109128, 1.476406, -0.08120909, 0, 0.003921569, 1, 1,
0.4148946, 0.4984091, 0.6537206, 0.003921569, 0, 1, 1,
0.4151744, -1.308689, 3.060947, 0.007843138, 0, 1, 1,
0.4160711, 0.3196428, 0.4534558, 0.01568628, 0, 1, 1,
0.4166337, -0.1461522, 3.290383, 0.01960784, 0, 1, 1,
0.4177103, -0.1117182, -0.1741278, 0.02745098, 0, 1, 1,
0.4201832, -1.226388, 0.7002518, 0.03137255, 0, 1, 1,
0.4203295, 2.069733, 0.9226964, 0.03921569, 0, 1, 1,
0.4230033, 1.21332, 0.5196105, 0.04313726, 0, 1, 1,
0.42471, -0.4069341, 3.164686, 0.05098039, 0, 1, 1,
0.4294024, -0.02526719, 1.285677, 0.05490196, 0, 1, 1,
0.4306382, 2.721571, -0.4808358, 0.0627451, 0, 1, 1,
0.433915, -1.287238, 3.619336, 0.06666667, 0, 1, 1,
0.4419212, -0.7867782, 2.748828, 0.07450981, 0, 1, 1,
0.4426693, -1.713814, 4.193869, 0.07843138, 0, 1, 1,
0.4434839, -0.07536668, 1.357668, 0.08627451, 0, 1, 1,
0.4606842, -0.8514633, 1.890492, 0.09019608, 0, 1, 1,
0.4639559, 0.7699325, 1.97525, 0.09803922, 0, 1, 1,
0.4652571, 0.7384521, 0.1675896, 0.1058824, 0, 1, 1,
0.4777386, -1.447831, 2.599159, 0.1098039, 0, 1, 1,
0.4786406, 0.3237575, 2.481683, 0.1176471, 0, 1, 1,
0.4789323, 0.3511685, 1.506168, 0.1215686, 0, 1, 1,
0.4860108, 2.462186, 0.6807982, 0.1294118, 0, 1, 1,
0.486793, -1.239003, 2.495697, 0.1333333, 0, 1, 1,
0.4898809, -0.4088109, 4.517553, 0.1411765, 0, 1, 1,
0.495332, 0.02525053, 1.546114, 0.145098, 0, 1, 1,
0.4982844, -0.01425493, 0.3006122, 0.1529412, 0, 1, 1,
0.4987688, 0.3848212, -1.12824, 0.1568628, 0, 1, 1,
0.4990039, -0.4159631, 2.792504, 0.1647059, 0, 1, 1,
0.5019967, -0.04188848, 1.656958, 0.1686275, 0, 1, 1,
0.5039775, 0.3798258, 0.2863977, 0.1764706, 0, 1, 1,
0.5062659, 0.911281, 0.9967299, 0.1803922, 0, 1, 1,
0.5159551, -1.700937, 4.325894, 0.1882353, 0, 1, 1,
0.5162455, -1.187695, 2.545907, 0.1921569, 0, 1, 1,
0.5196343, 1.993013, -1.587302, 0.2, 0, 1, 1,
0.5214999, -1.021932, 4.790903, 0.2078431, 0, 1, 1,
0.5235546, -0.6031403, 1.679025, 0.2117647, 0, 1, 1,
0.5260089, -0.24576, 4.120402, 0.2196078, 0, 1, 1,
0.5266853, 0.573425, 1.350961, 0.2235294, 0, 1, 1,
0.5286811, 0.1700432, 1.31155, 0.2313726, 0, 1, 1,
0.5315387, -2.109427, 3.445077, 0.2352941, 0, 1, 1,
0.534154, -1.10477, 2.18283, 0.2431373, 0, 1, 1,
0.5369043, -0.2406545, 2.048763, 0.2470588, 0, 1, 1,
0.5372015, -0.06243746, 2.206542, 0.254902, 0, 1, 1,
0.5401068, -0.01280426, 2.608423, 0.2588235, 0, 1, 1,
0.5441527, -1.556848, 2.617305, 0.2666667, 0, 1, 1,
0.5453752, 1.303846, 1.068984, 0.2705882, 0, 1, 1,
0.545863, -0.8087564, 0.5804665, 0.2784314, 0, 1, 1,
0.5472502, -0.9497635, 3.206279, 0.282353, 0, 1, 1,
0.5474884, -1.051546, 1.771187, 0.2901961, 0, 1, 1,
0.5494705, 0.6013265, 1.529756, 0.2941177, 0, 1, 1,
0.5499655, -1.45567, 2.445891, 0.3019608, 0, 1, 1,
0.5517461, 0.2924221, 0.2023722, 0.3098039, 0, 1, 1,
0.5522883, -1.160484, 1.951897, 0.3137255, 0, 1, 1,
0.5525328, -0.008209554, 2.545255, 0.3215686, 0, 1, 1,
0.5527927, 0.1187187, 1.092615, 0.3254902, 0, 1, 1,
0.5567671, 0.5555364, 0.04344954, 0.3333333, 0, 1, 1,
0.5642753, 0.7300864, -0.2427738, 0.3372549, 0, 1, 1,
0.5644022, -0.6337075, 4.463013, 0.345098, 0, 1, 1,
0.5709675, 0.1840637, 3.565021, 0.3490196, 0, 1, 1,
0.5713835, 0.2999439, -0.2652291, 0.3568628, 0, 1, 1,
0.5717412, 2.932011, -0.04971633, 0.3607843, 0, 1, 1,
0.5742331, -0.9477346, 0.8610293, 0.3686275, 0, 1, 1,
0.5748523, 0.2412142, 0.05405172, 0.372549, 0, 1, 1,
0.5809431, -1.550039, 3.501576, 0.3803922, 0, 1, 1,
0.5823196, 0.6642712, 1.282264, 0.3843137, 0, 1, 1,
0.5841756, 0.09104536, 0.7162806, 0.3921569, 0, 1, 1,
0.5880253, 2.243556, 1.134625, 0.3960784, 0, 1, 1,
0.5898897, 0.8248003, 0.5969642, 0.4039216, 0, 1, 1,
0.5947443, -0.2966636, 2.376473, 0.4117647, 0, 1, 1,
0.5954219, -0.7845767, 2.316568, 0.4156863, 0, 1, 1,
0.6061803, -1.017353, 2.998575, 0.4235294, 0, 1, 1,
0.6106099, -0.7499032, 2.097028, 0.427451, 0, 1, 1,
0.6119181, 1.711937, -0.1579762, 0.4352941, 0, 1, 1,
0.6198959, -0.7871249, 2.324904, 0.4392157, 0, 1, 1,
0.6220574, 1.457795, -1.046813, 0.4470588, 0, 1, 1,
0.6268072, -0.8973842, 1.97937, 0.4509804, 0, 1, 1,
0.6304495, 1.007504, -0.4721611, 0.4588235, 0, 1, 1,
0.6387048, 0.1388966, 0.915437, 0.4627451, 0, 1, 1,
0.6391057, -1.204345, 4.066317, 0.4705882, 0, 1, 1,
0.6396417, -0.6005628, 1.207208, 0.4745098, 0, 1, 1,
0.6455115, 1.360452, 0.2108863, 0.4823529, 0, 1, 1,
0.6456339, 0.1880266, 2.449808, 0.4862745, 0, 1, 1,
0.6536981, 0.3254278, 0.5928897, 0.4941176, 0, 1, 1,
0.6537804, -1.45559, 3.534175, 0.5019608, 0, 1, 1,
0.6544814, -2.469427, 3.403129, 0.5058824, 0, 1, 1,
0.6546729, -0.4739907, 1.411999, 0.5137255, 0, 1, 1,
0.6620993, -1.355725, 1.839601, 0.5176471, 0, 1, 1,
0.6645085, 0.4453686, -1.221897, 0.5254902, 0, 1, 1,
0.6714019, 1.080486, 0.849605, 0.5294118, 0, 1, 1,
0.689433, -0.01749776, 2.580427, 0.5372549, 0, 1, 1,
0.6918404, -0.2860581, 2.658728, 0.5411765, 0, 1, 1,
0.6927787, -1.428001, 2.479638, 0.5490196, 0, 1, 1,
0.7021798, 0.06348114, 2.343924, 0.5529412, 0, 1, 1,
0.7050732, 1.318218, 0.203632, 0.5607843, 0, 1, 1,
0.7053112, 0.0493445, 1.647415, 0.5647059, 0, 1, 1,
0.705573, 0.612533, 1.066373, 0.572549, 0, 1, 1,
0.7101298, -1.079501, 2.888239, 0.5764706, 0, 1, 1,
0.7129692, -2.556273, 3.541742, 0.5843138, 0, 1, 1,
0.7177029, 1.164547, 0.4226432, 0.5882353, 0, 1, 1,
0.7203501, 1.229903, 0.04446287, 0.5960785, 0, 1, 1,
0.7259908, -2.605095, 4.208575, 0.6039216, 0, 1, 1,
0.7274292, -0.3556181, 1.483122, 0.6078432, 0, 1, 1,
0.7347929, -0.8863935, 3.00728, 0.6156863, 0, 1, 1,
0.7366994, -1.63518, 0.9896277, 0.6196079, 0, 1, 1,
0.7414916, -0.741331, 0.2303322, 0.627451, 0, 1, 1,
0.7461467, -0.05978937, 3.262639, 0.6313726, 0, 1, 1,
0.7482688, 0.8300839, -1.514746, 0.6392157, 0, 1, 1,
0.7498278, 0.9078923, 0.1577287, 0.6431373, 0, 1, 1,
0.7503037, 0.2949744, 0.5234822, 0.6509804, 0, 1, 1,
0.7513984, 0.4572015, 2.245033, 0.654902, 0, 1, 1,
0.7566581, -0.1536992, 2.220915, 0.6627451, 0, 1, 1,
0.7600756, -0.5456617, 1.853595, 0.6666667, 0, 1, 1,
0.7604288, -2.155551, 1.445198, 0.6745098, 0, 1, 1,
0.7606945, 1.411672, -0.6037031, 0.6784314, 0, 1, 1,
0.7609811, 1.675726, -0.03485939, 0.6862745, 0, 1, 1,
0.7714787, -1.027908, 1.586486, 0.6901961, 0, 1, 1,
0.7717463, 0.1062763, 1.272601, 0.6980392, 0, 1, 1,
0.7761753, 0.3789326, 2.895651, 0.7058824, 0, 1, 1,
0.777912, 1.620374, 0.05777659, 0.7098039, 0, 1, 1,
0.7788525, 0.3809148, 1.89566, 0.7176471, 0, 1, 1,
0.7796488, 0.3889586, 2.590376, 0.7215686, 0, 1, 1,
0.7807367, 0.1004072, 1.212818, 0.7294118, 0, 1, 1,
0.7842925, -1.268885, -0.9477588, 0.7333333, 0, 1, 1,
0.7853454, -0.8549899, 3.567219, 0.7411765, 0, 1, 1,
0.7960466, 1.106703, 1.093615, 0.7450981, 0, 1, 1,
0.7963767, 0.009872624, 2.617576, 0.7529412, 0, 1, 1,
0.7990137, 1.09156, 2.123209, 0.7568628, 0, 1, 1,
0.8010038, -0.5686155, 0.9073157, 0.7647059, 0, 1, 1,
0.808212, -0.7888269, 0.637484, 0.7686275, 0, 1, 1,
0.8086582, 1.2089, 0.4020732, 0.7764706, 0, 1, 1,
0.8132457, -1.780835, 4.3943, 0.7803922, 0, 1, 1,
0.8141536, -0.3212519, 1.247355, 0.7882353, 0, 1, 1,
0.8166029, -1.120693, 4.305187, 0.7921569, 0, 1, 1,
0.8306971, -0.5026059, 3.45897, 0.8, 0, 1, 1,
0.8322861, 0.9678912, 0.13262, 0.8078431, 0, 1, 1,
0.8355489, -1.835005, 4.152805, 0.8117647, 0, 1, 1,
0.849125, 0.1326929, 1.697421, 0.8196079, 0, 1, 1,
0.8582215, 0.03322273, 1.62352, 0.8235294, 0, 1, 1,
0.8591191, -0.325424, -0.01819454, 0.8313726, 0, 1, 1,
0.8668001, -0.5063441, 1.732185, 0.8352941, 0, 1, 1,
0.8675945, -0.3799736, 0.2600966, 0.8431373, 0, 1, 1,
0.8739398, -1.168093, 3.212667, 0.8470588, 0, 1, 1,
0.878116, -0.4364594, 2.580725, 0.854902, 0, 1, 1,
0.8793679, 0.8679796, -0.4236035, 0.8588235, 0, 1, 1,
0.8841946, -0.161944, 0.2513873, 0.8666667, 0, 1, 1,
0.8845026, 0.6652358, -0.7936303, 0.8705882, 0, 1, 1,
0.893591, -0.8061797, 1.774178, 0.8784314, 0, 1, 1,
0.9054047, -1.376994, 2.817547, 0.8823529, 0, 1, 1,
0.9054109, 0.2419751, 0.9847337, 0.8901961, 0, 1, 1,
0.9060358, -0.2376576, 1.345854, 0.8941177, 0, 1, 1,
0.9072072, -0.03436424, 0.6437985, 0.9019608, 0, 1, 1,
0.9140699, 0.4615296, 1.534127, 0.9098039, 0, 1, 1,
0.9146523, 0.4125061, -0.137826, 0.9137255, 0, 1, 1,
0.916627, 0.2741382, 0.3127694, 0.9215686, 0, 1, 1,
0.9168838, -0.1615972, 2.18939, 0.9254902, 0, 1, 1,
0.9198462, -0.831199, 2.506756, 0.9333333, 0, 1, 1,
0.9260787, -0.5443678, 1.37384, 0.9372549, 0, 1, 1,
0.9261179, -0.1592694, 2.116131, 0.945098, 0, 1, 1,
0.9266383, 1.034836, 1.455866, 0.9490196, 0, 1, 1,
0.928352, 1.143491, 1.753694, 0.9568627, 0, 1, 1,
0.9341812, 0.9789757, -0.09639019, 0.9607843, 0, 1, 1,
0.9393547, -0.8679363, 3.770754, 0.9686275, 0, 1, 1,
0.9426932, -0.2055692, 2.568425, 0.972549, 0, 1, 1,
0.9482214, -0.2198739, 0.2429085, 0.9803922, 0, 1, 1,
0.9520388, -0.1379205, 0.8836638, 0.9843137, 0, 1, 1,
0.9624642, 0.3719347, 1.381392, 0.9921569, 0, 1, 1,
0.97311, -0.5390592, 2.221884, 0.9960784, 0, 1, 1,
0.9788779, 0.8540249, -0.5710892, 1, 0, 0.9960784, 1,
0.9821381, -0.8036616, 2.746317, 1, 0, 0.9882353, 1,
0.9832692, -1.537718, 1.500744, 1, 0, 0.9843137, 1,
0.9849779, 1.904709, 0.192597, 1, 0, 0.9764706, 1,
0.9850659, -1.406269, 2.127633, 1, 0, 0.972549, 1,
0.9864532, 0.07038277, 2.518676, 1, 0, 0.9647059, 1,
0.9993857, 0.6579521, 2.249789, 1, 0, 0.9607843, 1,
1.001195, 0.8946637, 1.764979, 1, 0, 0.9529412, 1,
1.004262, -0.6505156, 3.33492, 1, 0, 0.9490196, 1,
1.00446, 1.935153, 0.3754386, 1, 0, 0.9411765, 1,
1.004628, 0.01883791, 0.4656528, 1, 0, 0.9372549, 1,
1.004912, 0.5131895, 1.074023, 1, 0, 0.9294118, 1,
1.00512, 0.2230596, 0.8436323, 1, 0, 0.9254902, 1,
1.008833, -0.02245728, 4.217229, 1, 0, 0.9176471, 1,
1.010051, 0.7550839, -0.05543938, 1, 0, 0.9137255, 1,
1.011174, -1.824273, -0.5549642, 1, 0, 0.9058824, 1,
1.01309, -2.219489, 0.8642132, 1, 0, 0.9019608, 1,
1.036098, 0.6055542, -0.6722531, 1, 0, 0.8941177, 1,
1.039287, -0.4923074, -1.475958, 1, 0, 0.8862745, 1,
1.042562, 1.640143, 1.259909, 1, 0, 0.8823529, 1,
1.051564, -2.176518, 3.357306, 1, 0, 0.8745098, 1,
1.063185, 0.502578, 2.002692, 1, 0, 0.8705882, 1,
1.076847, 0.3501236, 1.370926, 1, 0, 0.8627451, 1,
1.078151, -1.372591, 1.431134, 1, 0, 0.8588235, 1,
1.079525, 0.5447814, 1.916226, 1, 0, 0.8509804, 1,
1.094998, 0.01246705, 1.056682, 1, 0, 0.8470588, 1,
1.097963, -0.1860269, 1.042381, 1, 0, 0.8392157, 1,
1.100261, 0.1144604, 0.8887906, 1, 0, 0.8352941, 1,
1.10118, 2.099937, 1.282289, 1, 0, 0.827451, 1,
1.102834, 0.7932487, -0.6391449, 1, 0, 0.8235294, 1,
1.108179, 0.09346173, 1.258201, 1, 0, 0.8156863, 1,
1.111669, -1.87073, 2.793918, 1, 0, 0.8117647, 1,
1.118747, 1.391605, -0.6732021, 1, 0, 0.8039216, 1,
1.135387, 0.6541863, 0.1107221, 1, 0, 0.7960784, 1,
1.138622, 0.2697743, -1.139028, 1, 0, 0.7921569, 1,
1.139378, -0.5452486, -0.6888122, 1, 0, 0.7843137, 1,
1.143368, 1.920352, 2.446402, 1, 0, 0.7803922, 1,
1.155651, -0.1575115, 0.8242361, 1, 0, 0.772549, 1,
1.155787, 0.5496591, 0.8488765, 1, 0, 0.7686275, 1,
1.156487, 0.9149669, 0.5655935, 1, 0, 0.7607843, 1,
1.17161, 0.9247783, 1.565543, 1, 0, 0.7568628, 1,
1.172833, 0.4059284, 0.6573597, 1, 0, 0.7490196, 1,
1.175066, 1.438251, 1.403994, 1, 0, 0.7450981, 1,
1.179607, 1.909587, 1.85452, 1, 0, 0.7372549, 1,
1.182786, -0.09508345, 2.010751, 1, 0, 0.7333333, 1,
1.187539, 1.899632, 1.585806, 1, 0, 0.7254902, 1,
1.188501, -0.6219715, 2.120136, 1, 0, 0.7215686, 1,
1.19229, -1.130589, 1.309609, 1, 0, 0.7137255, 1,
1.203037, 0.06396611, 0.7315474, 1, 0, 0.7098039, 1,
1.204822, 0.78162, 1.816658, 1, 0, 0.7019608, 1,
1.20909, -0.28153, 1.868535, 1, 0, 0.6941177, 1,
1.2161, 0.0964479, 2.104717, 1, 0, 0.6901961, 1,
1.217847, -1.008624, 1.017962, 1, 0, 0.682353, 1,
1.220791, -1.504317, 3.424073, 1, 0, 0.6784314, 1,
1.222691, -0.9955309, 2.116939, 1, 0, 0.6705883, 1,
1.240267, -0.02221175, 1.974073, 1, 0, 0.6666667, 1,
1.241404, -0.5166171, 2.067285, 1, 0, 0.6588235, 1,
1.242797, -1.037888, 2.392272, 1, 0, 0.654902, 1,
1.249369, 1.675776, -0.01907725, 1, 0, 0.6470588, 1,
1.250189, 0.3331019, 2.11178, 1, 0, 0.6431373, 1,
1.282858, -2.863378, 2.921328, 1, 0, 0.6352941, 1,
1.287708, -0.3600202, 1.742641, 1, 0, 0.6313726, 1,
1.30772, 0.4892278, 1.309673, 1, 0, 0.6235294, 1,
1.311751, 1.606713, -0.4024411, 1, 0, 0.6196079, 1,
1.32141, -1.053527, 0.7503113, 1, 0, 0.6117647, 1,
1.338274, -0.507853, 1.506164, 1, 0, 0.6078432, 1,
1.344882, 1.298316, -0.2167856, 1, 0, 0.6, 1,
1.345912, -2.134793, 2.087125, 1, 0, 0.5921569, 1,
1.349025, 0.2412196, 1.969868, 1, 0, 0.5882353, 1,
1.351552, -0.3622631, 2.427321, 1, 0, 0.5803922, 1,
1.35235, -2.562813, 1.924172, 1, 0, 0.5764706, 1,
1.360449, 1.151884, -1.318819, 1, 0, 0.5686275, 1,
1.370168, -1.048959, 2.29861, 1, 0, 0.5647059, 1,
1.384063, 1.03969, 1.681518, 1, 0, 0.5568628, 1,
1.388616, 0.8841754, 1.005352, 1, 0, 0.5529412, 1,
1.395243, 1.113378, 0.2617013, 1, 0, 0.5450981, 1,
1.401905, -0.9438363, 2.687329, 1, 0, 0.5411765, 1,
1.405568, -0.09856369, -0.08442522, 1, 0, 0.5333334, 1,
1.406293, -1.636622, 0.8105975, 1, 0, 0.5294118, 1,
1.417374, -0.4089761, 1.520895, 1, 0, 0.5215687, 1,
1.425364, -1.078319, 1.163231, 1, 0, 0.5176471, 1,
1.435536, 1.217119, 0.2660417, 1, 0, 0.509804, 1,
1.438177, -2.147183, 3.909174, 1, 0, 0.5058824, 1,
1.442814, -0.9268862, 1.018263, 1, 0, 0.4980392, 1,
1.443569, 2.141208, 1.595123, 1, 0, 0.4901961, 1,
1.443802, -1.052619, 2.480413, 1, 0, 0.4862745, 1,
1.447653, 0.7403462, -0.3226142, 1, 0, 0.4784314, 1,
1.453828, 2.171674, 1.301264, 1, 0, 0.4745098, 1,
1.463389, -1.166019, 1.597481, 1, 0, 0.4666667, 1,
1.466359, -1.232159, 1.320211, 1, 0, 0.4627451, 1,
1.467601, 0.3487369, 2.710628, 1, 0, 0.454902, 1,
1.4934, -0.4588825, 2.09543, 1, 0, 0.4509804, 1,
1.501256, 0.2432797, 0.652162, 1, 0, 0.4431373, 1,
1.502867, 0.5399938, 1.465112, 1, 0, 0.4392157, 1,
1.506458, -0.8103094, 3.092299, 1, 0, 0.4313726, 1,
1.512058, -0.5710756, 1.772972, 1, 0, 0.427451, 1,
1.519762, -0.5123957, 2.608329, 1, 0, 0.4196078, 1,
1.528761, 0.0757976, 1.444971, 1, 0, 0.4156863, 1,
1.533615, 0.7736335, 0.02926833, 1, 0, 0.4078431, 1,
1.545979, -0.07664009, 0.8802713, 1, 0, 0.4039216, 1,
1.554849, 0.1876698, 0.953456, 1, 0, 0.3960784, 1,
1.559479, 1.220641, 1.156701, 1, 0, 0.3882353, 1,
1.561451, -0.2509032, -0.3764094, 1, 0, 0.3843137, 1,
1.568122, -1.868203, 2.848656, 1, 0, 0.3764706, 1,
1.569657, 1.961, 0.6346608, 1, 0, 0.372549, 1,
1.589887, -1.828909, 2.084362, 1, 0, 0.3647059, 1,
1.599833, 0.1800273, 3.190634, 1, 0, 0.3607843, 1,
1.603517, -1.06447, 2.066721, 1, 0, 0.3529412, 1,
1.614791, -0.137974, 0.04048787, 1, 0, 0.3490196, 1,
1.632452, -0.3171179, 2.431772, 1, 0, 0.3411765, 1,
1.635687, 1.893869, -0.8124635, 1, 0, 0.3372549, 1,
1.646824, 0.3446911, 0.5315181, 1, 0, 0.3294118, 1,
1.657566, 1.114896, 0.1794205, 1, 0, 0.3254902, 1,
1.669395, 1.59754, 0.6616789, 1, 0, 0.3176471, 1,
1.67311, -0.9880025, -0.23902, 1, 0, 0.3137255, 1,
1.683776, 0.1073516, 1.484326, 1, 0, 0.3058824, 1,
1.718602, 1.752861, 0.3559247, 1, 0, 0.2980392, 1,
1.727293, -1.084794, 1.947182, 1, 0, 0.2941177, 1,
1.729564, 2.129457, 0.9818988, 1, 0, 0.2862745, 1,
1.744436, -0.08211189, 3.173479, 1, 0, 0.282353, 1,
1.798433, -0.6245339, 1.838683, 1, 0, 0.2745098, 1,
1.811605, -0.9173253, 2.766035, 1, 0, 0.2705882, 1,
1.82663, -0.6002838, 2.412914, 1, 0, 0.2627451, 1,
1.83181, -0.8713261, 0.8922997, 1, 0, 0.2588235, 1,
1.855488, -1.707196, 1.341688, 1, 0, 0.2509804, 1,
1.871134, 1.886329, 0.8108948, 1, 0, 0.2470588, 1,
1.893484, 0.7830206, 0.5839916, 1, 0, 0.2392157, 1,
1.918877, -0.138018, 1.038221, 1, 0, 0.2352941, 1,
1.926383, -1.321813, 2.435596, 1, 0, 0.227451, 1,
1.931229, 1.179228, 2.233668, 1, 0, 0.2235294, 1,
1.935457, -1.686664, 2.857078, 1, 0, 0.2156863, 1,
1.939479, 1.56444, 0.6307896, 1, 0, 0.2117647, 1,
1.944058, -0.8266942, 2.722975, 1, 0, 0.2039216, 1,
1.954942, -1.13494, 2.859561, 1, 0, 0.1960784, 1,
1.95511, -1.296428, 1.518112, 1, 0, 0.1921569, 1,
1.973254, 0.3851358, 1.991454, 1, 0, 0.1843137, 1,
1.991665, 1.346617, -0.8494726, 1, 0, 0.1803922, 1,
1.993931, -0.8789184, 2.679573, 1, 0, 0.172549, 1,
1.999632, -0.3565605, 0.2989828, 1, 0, 0.1686275, 1,
2.008369, 0.3033864, -0.867801, 1, 0, 0.1607843, 1,
2.040204, 0.1058157, 2.96715, 1, 0, 0.1568628, 1,
2.064368, -1.365403, 2.16675, 1, 0, 0.1490196, 1,
2.095815, 0.692513, 0.5560218, 1, 0, 0.145098, 1,
2.103836, -0.1729283, 1.540944, 1, 0, 0.1372549, 1,
2.119565, 1.198582, 1.247182, 1, 0, 0.1333333, 1,
2.144394, -0.9664126, 2.432672, 1, 0, 0.1254902, 1,
2.156276, -1.327734, 0.7157511, 1, 0, 0.1215686, 1,
2.199795, 1.639389, 0.6771606, 1, 0, 0.1137255, 1,
2.206514, -1.137538, 1.343385, 1, 0, 0.1098039, 1,
2.209718, -0.209427, 0.1565535, 1, 0, 0.1019608, 1,
2.210506, -0.5980219, 1.097457, 1, 0, 0.09411765, 1,
2.211363, 0.9363477, 1.407758, 1, 0, 0.09019608, 1,
2.223722, -0.1183644, 1.938716, 1, 0, 0.08235294, 1,
2.26448, 1.134683, 1.445548, 1, 0, 0.07843138, 1,
2.267646, 0.5975553, 2.124313, 1, 0, 0.07058824, 1,
2.2901, 0.09003942, 1.261261, 1, 0, 0.06666667, 1,
2.355843, -1.211776, -0.294501, 1, 0, 0.05882353, 1,
2.374993, 0.06914838, 0.7435141, 1, 0, 0.05490196, 1,
2.379313, -0.1198215, 2.118447, 1, 0, 0.04705882, 1,
2.423325, -0.4154902, 1.489747, 1, 0, 0.04313726, 1,
2.511432, 1.167069, 2.974138, 1, 0, 0.03529412, 1,
2.537813, 0.1349878, 1.70885, 1, 0, 0.03137255, 1,
2.651697, 0.6276422, 1.24185, 1, 0, 0.02352941, 1,
2.787823, -1.286296, 0.8604893, 1, 0, 0.01960784, 1,
2.811357, -0.5265625, 3.069813, 1, 0, 0.01176471, 1,
2.933202, -0.2642285, 3.144657, 1, 0, 0.007843138, 1
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
-0.5603582, -3.845696, -6.760094, 0, -0.5, 0.5, 0.5,
-0.5603582, -3.845696, -6.760094, 1, -0.5, 0.5, 0.5,
-0.5603582, -3.845696, -6.760094, 1, 1.5, 0.5, 0.5,
-0.5603582, -3.845696, -6.760094, 0, 1.5, 0.5, 0.5
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
-5.238235, 0.03431654, -6.760094, 0, -0.5, 0.5, 0.5,
-5.238235, 0.03431654, -6.760094, 1, -0.5, 0.5, 0.5,
-5.238235, 0.03431654, -6.760094, 1, 1.5, 0.5, 0.5,
-5.238235, 0.03431654, -6.760094, 0, 1.5, 0.5, 0.5
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
-5.238235, -3.845696, 0.1933377, 0, -0.5, 0.5, 0.5,
-5.238235, -3.845696, 0.1933377, 1, -0.5, 0.5, 0.5,
-5.238235, -3.845696, 0.1933377, 1, 1.5, 0.5, 0.5,
-5.238235, -3.845696, 0.1933377, 0, 1.5, 0.5, 0.5
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
-4, -2.950309, -5.155456,
2, -2.950309, -5.155456,
-4, -2.950309, -5.155456,
-4, -3.09954, -5.422895,
-3, -2.950309, -5.155456,
-3, -3.09954, -5.422895,
-2, -2.950309, -5.155456,
-2, -3.09954, -5.422895,
-1, -2.950309, -5.155456,
-1, -3.09954, -5.422895,
0, -2.950309, -5.155456,
0, -3.09954, -5.422895,
1, -2.950309, -5.155456,
1, -3.09954, -5.422895,
2, -2.950309, -5.155456,
2, -3.09954, -5.422895
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
"-4",
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
-4, -3.398003, -5.957775, 0, -0.5, 0.5, 0.5,
-4, -3.398003, -5.957775, 1, -0.5, 0.5, 0.5,
-4, -3.398003, -5.957775, 1, 1.5, 0.5, 0.5,
-4, -3.398003, -5.957775, 0, 1.5, 0.5, 0.5,
-3, -3.398003, -5.957775, 0, -0.5, 0.5, 0.5,
-3, -3.398003, -5.957775, 1, -0.5, 0.5, 0.5,
-3, -3.398003, -5.957775, 1, 1.5, 0.5, 0.5,
-3, -3.398003, -5.957775, 0, 1.5, 0.5, 0.5,
-2, -3.398003, -5.957775, 0, -0.5, 0.5, 0.5,
-2, -3.398003, -5.957775, 1, -0.5, 0.5, 0.5,
-2, -3.398003, -5.957775, 1, 1.5, 0.5, 0.5,
-2, -3.398003, -5.957775, 0, 1.5, 0.5, 0.5,
-1, -3.398003, -5.957775, 0, -0.5, 0.5, 0.5,
-1, -3.398003, -5.957775, 1, -0.5, 0.5, 0.5,
-1, -3.398003, -5.957775, 1, 1.5, 0.5, 0.5,
-1, -3.398003, -5.957775, 0, 1.5, 0.5, 0.5,
0, -3.398003, -5.957775, 0, -0.5, 0.5, 0.5,
0, -3.398003, -5.957775, 1, -0.5, 0.5, 0.5,
0, -3.398003, -5.957775, 1, 1.5, 0.5, 0.5,
0, -3.398003, -5.957775, 0, 1.5, 0.5, 0.5,
1, -3.398003, -5.957775, 0, -0.5, 0.5, 0.5,
1, -3.398003, -5.957775, 1, -0.5, 0.5, 0.5,
1, -3.398003, -5.957775, 1, 1.5, 0.5, 0.5,
1, -3.398003, -5.957775, 0, 1.5, 0.5, 0.5,
2, -3.398003, -5.957775, 0, -0.5, 0.5, 0.5,
2, -3.398003, -5.957775, 1, -0.5, 0.5, 0.5,
2, -3.398003, -5.957775, 1, 1.5, 0.5, 0.5,
2, -3.398003, -5.957775, 0, 1.5, 0.5, 0.5
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
-4.158725, -2, -5.155456,
-4.158725, 2, -5.155456,
-4.158725, -2, -5.155456,
-4.338644, -2, -5.422895,
-4.158725, -1, -5.155456,
-4.338644, -1, -5.422895,
-4.158725, 0, -5.155456,
-4.338644, 0, -5.422895,
-4.158725, 1, -5.155456,
-4.338644, 1, -5.422895,
-4.158725, 2, -5.155456,
-4.338644, 2, -5.422895
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
-4.69848, -2, -5.957775, 0, -0.5, 0.5, 0.5,
-4.69848, -2, -5.957775, 1, -0.5, 0.5, 0.5,
-4.69848, -2, -5.957775, 1, 1.5, 0.5, 0.5,
-4.69848, -2, -5.957775, 0, 1.5, 0.5, 0.5,
-4.69848, -1, -5.957775, 0, -0.5, 0.5, 0.5,
-4.69848, -1, -5.957775, 1, -0.5, 0.5, 0.5,
-4.69848, -1, -5.957775, 1, 1.5, 0.5, 0.5,
-4.69848, -1, -5.957775, 0, 1.5, 0.5, 0.5,
-4.69848, 0, -5.957775, 0, -0.5, 0.5, 0.5,
-4.69848, 0, -5.957775, 1, -0.5, 0.5, 0.5,
-4.69848, 0, -5.957775, 1, 1.5, 0.5, 0.5,
-4.69848, 0, -5.957775, 0, 1.5, 0.5, 0.5,
-4.69848, 1, -5.957775, 0, -0.5, 0.5, 0.5,
-4.69848, 1, -5.957775, 1, -0.5, 0.5, 0.5,
-4.69848, 1, -5.957775, 1, 1.5, 0.5, 0.5,
-4.69848, 1, -5.957775, 0, 1.5, 0.5, 0.5,
-4.69848, 2, -5.957775, 0, -0.5, 0.5, 0.5,
-4.69848, 2, -5.957775, 1, -0.5, 0.5, 0.5,
-4.69848, 2, -5.957775, 1, 1.5, 0.5, 0.5,
-4.69848, 2, -5.957775, 0, 1.5, 0.5, 0.5
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
-4.158725, -2.950309, -4,
-4.158725, -2.950309, 4,
-4.158725, -2.950309, -4,
-4.338644, -3.09954, -4,
-4.158725, -2.950309, -2,
-4.338644, -3.09954, -2,
-4.158725, -2.950309, 0,
-4.338644, -3.09954, 0,
-4.158725, -2.950309, 2,
-4.338644, -3.09954, 2,
-4.158725, -2.950309, 4,
-4.338644, -3.09954, 4
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
-4.69848, -3.398003, -4, 0, -0.5, 0.5, 0.5,
-4.69848, -3.398003, -4, 1, -0.5, 0.5, 0.5,
-4.69848, -3.398003, -4, 1, 1.5, 0.5, 0.5,
-4.69848, -3.398003, -4, 0, 1.5, 0.5, 0.5,
-4.69848, -3.398003, -2, 0, -0.5, 0.5, 0.5,
-4.69848, -3.398003, -2, 1, -0.5, 0.5, 0.5,
-4.69848, -3.398003, -2, 1, 1.5, 0.5, 0.5,
-4.69848, -3.398003, -2, 0, 1.5, 0.5, 0.5,
-4.69848, -3.398003, 0, 0, -0.5, 0.5, 0.5,
-4.69848, -3.398003, 0, 1, -0.5, 0.5, 0.5,
-4.69848, -3.398003, 0, 1, 1.5, 0.5, 0.5,
-4.69848, -3.398003, 0, 0, 1.5, 0.5, 0.5,
-4.69848, -3.398003, 2, 0, -0.5, 0.5, 0.5,
-4.69848, -3.398003, 2, 1, -0.5, 0.5, 0.5,
-4.69848, -3.398003, 2, 1, 1.5, 0.5, 0.5,
-4.69848, -3.398003, 2, 0, 1.5, 0.5, 0.5,
-4.69848, -3.398003, 4, 0, -0.5, 0.5, 0.5,
-4.69848, -3.398003, 4, 1, -0.5, 0.5, 0.5,
-4.69848, -3.398003, 4, 1, 1.5, 0.5, 0.5,
-4.69848, -3.398003, 4, 0, 1.5, 0.5, 0.5
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
-4.158725, -2.950309, -5.155456,
-4.158725, 3.018942, -5.155456,
-4.158725, -2.950309, 5.542131,
-4.158725, 3.018942, 5.542131,
-4.158725, -2.950309, -5.155456,
-4.158725, -2.950309, 5.542131,
-4.158725, 3.018942, -5.155456,
-4.158725, 3.018942, 5.542131,
-4.158725, -2.950309, -5.155456,
3.038009, -2.950309, -5.155456,
-4.158725, -2.950309, 5.542131,
3.038009, -2.950309, 5.542131,
-4.158725, 3.018942, -5.155456,
3.038009, 3.018942, -5.155456,
-4.158725, 3.018942, 5.542131,
3.038009, 3.018942, 5.542131,
3.038009, -2.950309, -5.155456,
3.038009, 3.018942, -5.155456,
3.038009, -2.950309, 5.542131,
3.038009, 3.018942, 5.542131,
3.038009, -2.950309, -5.155456,
3.038009, -2.950309, 5.542131,
3.038009, 3.018942, -5.155456,
3.038009, 3.018942, 5.542131
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
var radius = 7.586722;
var distance = 33.75418;
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
mvMatrix.translate( 0.5603582, -0.03431654, -0.1933377 );
mvMatrix.scale( 1.13981, 1.374195, 0.7668002 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.75418);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
chlorphoxim<-read.table("chlorphoxim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorphoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorphoxim' not found
```

```r
y<-chlorphoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorphoxim' not found
```

```r
z<-chlorphoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorphoxim' not found
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
-4.053918, -0.07241865, -0.7652135, 0, 0, 1, 1, 1,
-3.319906, -0.1711794, -1.032911, 1, 0, 0, 1, 1,
-3.304382, 0.4834057, -1.162755, 1, 0, 0, 1, 1,
-2.811966, 1.035224, -3.110706, 1, 0, 0, 1, 1,
-2.759045, -0.2986903, -1.686219, 1, 0, 0, 1, 1,
-2.68462, -0.3200875, -2.512241, 1, 0, 0, 1, 1,
-2.594443, 1.392785, -0.8232208, 0, 0, 0, 1, 1,
-2.548019, -0.7565095, -1.55141, 0, 0, 0, 1, 1,
-2.387138, 0.0225465, 0.2210877, 0, 0, 0, 1, 1,
-2.270186, -1.250453, -2.821693, 0, 0, 0, 1, 1,
-2.242961, 0.399264, -0.6990519, 0, 0, 0, 1, 1,
-2.192196, 0.001486123, -1.613295, 0, 0, 0, 1, 1,
-2.129894, 0.9496085, -1.646837, 0, 0, 0, 1, 1,
-2.104115, 1.076882, -3.076552, 1, 1, 1, 1, 1,
-2.101584, 0.9751199, -0.7138776, 1, 1, 1, 1, 1,
-2.080689, -0.0772756, -2.23416, 1, 1, 1, 1, 1,
-2.072782, 0.7654552, -0.7501135, 1, 1, 1, 1, 1,
-2.070235, -0.06263616, -0.5596998, 1, 1, 1, 1, 1,
-2.057557, -0.3285263, -2.909717, 1, 1, 1, 1, 1,
-2.045565, 2.327435, -0.1882495, 1, 1, 1, 1, 1,
-2.037785, -0.638307, 0.5316226, 1, 1, 1, 1, 1,
-2.019736, 0.1740756, -1.733322, 1, 1, 1, 1, 1,
-2.005735, 1.870638, 0.0951628, 1, 1, 1, 1, 1,
-2.000549, 0.7500895, -0.6749153, 1, 1, 1, 1, 1,
-1.950789, 0.4121164, -0.6081429, 1, 1, 1, 1, 1,
-1.943807, 0.3887769, -2.233016, 1, 1, 1, 1, 1,
-1.939131, -2.714442, -1.646549, 1, 1, 1, 1, 1,
-1.933211, 1.117375, -2.059572, 1, 1, 1, 1, 1,
-1.927566, -1.798243, -1.13359, 0, 0, 1, 1, 1,
-1.927353, -0.7079138, -0.7203335, 1, 0, 0, 1, 1,
-1.923128, 0.5816293, -0.9050673, 1, 0, 0, 1, 1,
-1.918825, -1.844059, -3.573748, 1, 0, 0, 1, 1,
-1.908976, 0.6624513, -1.371921, 1, 0, 0, 1, 1,
-1.907031, 0.7423839, -0.7430154, 1, 0, 0, 1, 1,
-1.903049, -1.158495, -2.419893, 0, 0, 0, 1, 1,
-1.899635, 0.6925049, 0.3351682, 0, 0, 0, 1, 1,
-1.86535, -0.3455324, -2.16574, 0, 0, 0, 1, 1,
-1.81302, -0.8990127, -3.660697, 0, 0, 0, 1, 1,
-1.794339, -0.7110513, 0.1962005, 0, 0, 0, 1, 1,
-1.788723, 0.8474328, -2.932626, 0, 0, 0, 1, 1,
-1.785678, -2.093268, -2.81861, 0, 0, 0, 1, 1,
-1.781389, -0.279368, -1.719939, 1, 1, 1, 1, 1,
-1.761904, -1.853363, -2.581057, 1, 1, 1, 1, 1,
-1.753916, -0.7913225, -2.939943, 1, 1, 1, 1, 1,
-1.734113, 1.651548, -0.5789438, 1, 1, 1, 1, 1,
-1.727205, -1.210665, -2.118779, 1, 1, 1, 1, 1,
-1.71339, 0.4125806, -0.8295945, 1, 1, 1, 1, 1,
-1.695108, -0.3652348, -1.634196, 1, 1, 1, 1, 1,
-1.689483, 0.7406734, -1.971039, 1, 1, 1, 1, 1,
-1.68056, -0.006357932, -0.8157195, 1, 1, 1, 1, 1,
-1.67885, -1.51224, -1.025198, 1, 1, 1, 1, 1,
-1.660099, 0.9311885, -1.093822, 1, 1, 1, 1, 1,
-1.659841, -1.002013, -1.408548, 1, 1, 1, 1, 1,
-1.645292, -0.3719962, -0.2558297, 1, 1, 1, 1, 1,
-1.632171, 1.252217, -1.901226, 1, 1, 1, 1, 1,
-1.619263, -0.02216688, -2.801521, 1, 1, 1, 1, 1,
-1.614903, -2.010151, -1.587501, 0, 0, 1, 1, 1,
-1.601231, 0.6937064, -2.633371, 1, 0, 0, 1, 1,
-1.583846, 1.859834, -1.11702, 1, 0, 0, 1, 1,
-1.582167, 0.9991844, -1.410472, 1, 0, 0, 1, 1,
-1.577776, 0.1182323, -2.119671, 1, 0, 0, 1, 1,
-1.576671, 0.6896102, -0.9264451, 1, 0, 0, 1, 1,
-1.574981, -1.037104, -2.825495, 0, 0, 0, 1, 1,
-1.567391, 0.06575235, -2.147267, 0, 0, 0, 1, 1,
-1.560698, -0.8438001, -1.766801, 0, 0, 0, 1, 1,
-1.552274, -0.9470884, -1.598049, 0, 0, 0, 1, 1,
-1.551626, -1.440683, -2.893689, 0, 0, 0, 1, 1,
-1.536458, -0.4344015, -1.046684, 0, 0, 0, 1, 1,
-1.532792, 0.05691982, -2.030397, 0, 0, 0, 1, 1,
-1.532216, -0.1909714, -1.052109, 1, 1, 1, 1, 1,
-1.528799, -0.7599887, -1.830595, 1, 1, 1, 1, 1,
-1.523026, 1.90583, -1.811349, 1, 1, 1, 1, 1,
-1.519886, -2.511596, -1.899311, 1, 1, 1, 1, 1,
-1.514068, -0.4748557, -2.178356, 1, 1, 1, 1, 1,
-1.512278, -0.4172719, -2.168377, 1, 1, 1, 1, 1,
-1.503585, -0.3050168, -1.249066, 1, 1, 1, 1, 1,
-1.487963, 0.9758812, -1.256142, 1, 1, 1, 1, 1,
-1.485765, 0.9425045, -1.152952, 1, 1, 1, 1, 1,
-1.484536, -0.2177596, -1.975299, 1, 1, 1, 1, 1,
-1.484133, 0.5014703, -1.629253, 1, 1, 1, 1, 1,
-1.470903, -1.164684, -1.434292, 1, 1, 1, 1, 1,
-1.468962, 0.7788066, -1.174598, 1, 1, 1, 1, 1,
-1.468856, -2.053175, -1.224163, 1, 1, 1, 1, 1,
-1.46767, -1.38256, -1.684831, 1, 1, 1, 1, 1,
-1.448469, -0.03498285, 0.6237248, 0, 0, 1, 1, 1,
-1.443498, 0.1753408, -1.300749, 1, 0, 0, 1, 1,
-1.440033, -0.3347024, -3.956998, 1, 0, 0, 1, 1,
-1.431773, -0.9155025, -2.640769, 1, 0, 0, 1, 1,
-1.424503, 0.4664277, -1.148695, 1, 0, 0, 1, 1,
-1.406257, 0.5422558, -0.8478922, 1, 0, 0, 1, 1,
-1.398066, 0.4376605, -0.6217839, 0, 0, 0, 1, 1,
-1.388773, -0.003130824, -1.325129, 0, 0, 0, 1, 1,
-1.388317, 0.6885362, -1.199486, 0, 0, 0, 1, 1,
-1.385421, -0.6908106, -0.2175914, 0, 0, 0, 1, 1,
-1.380159, 0.1667846, -0.4822392, 0, 0, 0, 1, 1,
-1.380058, -0.5269002, -0.8857649, 0, 0, 0, 1, 1,
-1.376527, 1.199628, -1.42718, 0, 0, 0, 1, 1,
-1.375578, 0.9150814, -0.894226, 1, 1, 1, 1, 1,
-1.371847, -0.3109654, -1.418319, 1, 1, 1, 1, 1,
-1.369432, -1.261085, -1.303137, 1, 1, 1, 1, 1,
-1.366604, 0.4631191, -1.745104, 1, 1, 1, 1, 1,
-1.357634, -0.267506, -1.559274, 1, 1, 1, 1, 1,
-1.356073, 1.230124, -1.368986, 1, 1, 1, 1, 1,
-1.34965, -0.5558423, -0.9155289, 1, 1, 1, 1, 1,
-1.343541, -0.2478149, -1.937673, 1, 1, 1, 1, 1,
-1.332123, -1.206754, -2.147424, 1, 1, 1, 1, 1,
-1.331464, -1.464541, -1.072497, 1, 1, 1, 1, 1,
-1.330715, 0.1060852, -1.283017, 1, 1, 1, 1, 1,
-1.329473, -0.32083, -1.741602, 1, 1, 1, 1, 1,
-1.312222, -0.3512946, -1.207946, 1, 1, 1, 1, 1,
-1.303797, -0.0460109, -1.27157, 1, 1, 1, 1, 1,
-1.300378, 2.740068, 1.631101, 1, 1, 1, 1, 1,
-1.297727, -0.3359354, -2.239546, 0, 0, 1, 1, 1,
-1.291091, 0.2661832, -2.41464, 1, 0, 0, 1, 1,
-1.282366, 1.282428, -0.1619892, 1, 0, 0, 1, 1,
-1.277205, 0.3756965, -1.213725, 1, 0, 0, 1, 1,
-1.271954, -0.2115259, -1.94347, 1, 0, 0, 1, 1,
-1.268918, -1.257089, -1.801431, 1, 0, 0, 1, 1,
-1.264141, -0.2730961, -2.034034, 0, 0, 0, 1, 1,
-1.257024, 0.9414861, -0.5842891, 0, 0, 0, 1, 1,
-1.253204, -0.3394222, -1.37291, 0, 0, 0, 1, 1,
-1.251927, -0.35844, -1.672798, 0, 0, 0, 1, 1,
-1.244939, 0.7973421, -0.1299162, 0, 0, 0, 1, 1,
-1.232528, -0.8233807, -2.988925, 0, 0, 0, 1, 1,
-1.227061, -0.3611408, -1.757274, 0, 0, 0, 1, 1,
-1.226887, 0.7006391, -0.7433712, 1, 1, 1, 1, 1,
-1.22488, -0.002274174, -0.4449767, 1, 1, 1, 1, 1,
-1.220936, 0.2085251, 0.4148396, 1, 1, 1, 1, 1,
-1.216933, 1.472818, 1.089238, 1, 1, 1, 1, 1,
-1.214555, 1.682241, 0.1437531, 1, 1, 1, 1, 1,
-1.212824, 1.313112, -0.07962998, 1, 1, 1, 1, 1,
-1.206875, 0.3382928, -1.905362, 1, 1, 1, 1, 1,
-1.196332, 0.09245458, -1.109583, 1, 1, 1, 1, 1,
-1.190255, 1.655192, 0.04285724, 1, 1, 1, 1, 1,
-1.188211, -2.098343, -3.551549, 1, 1, 1, 1, 1,
-1.186911, 0.4931597, 1.245161, 1, 1, 1, 1, 1,
-1.184355, -1.166033, -3.616659, 1, 1, 1, 1, 1,
-1.179282, 0.6660709, -1.76499, 1, 1, 1, 1, 1,
-1.15661, 1.801477, -1.997541, 1, 1, 1, 1, 1,
-1.147653, -0.5567501, -2.346077, 1, 1, 1, 1, 1,
-1.142279, -1.658959, -4.11623, 0, 0, 1, 1, 1,
-1.136574, 0.02484122, -1.474042, 1, 0, 0, 1, 1,
-1.134308, -1.67354, -3.160096, 1, 0, 0, 1, 1,
-1.103016, 0.9499475, -0.9352232, 1, 0, 0, 1, 1,
-1.100691, 0.2076306, -0.7301584, 1, 0, 0, 1, 1,
-1.100323, 2.36376, -1.038137, 1, 0, 0, 1, 1,
-1.096614, -0.2158108, -2.774566, 0, 0, 0, 1, 1,
-1.089124, 2.3286, -2.155257, 0, 0, 0, 1, 1,
-1.088909, -0.4781654, -1.700515, 0, 0, 0, 1, 1,
-1.087871, 0.6655257, -0.6786537, 0, 0, 0, 1, 1,
-1.087427, -0.1116656, -0.5177486, 0, 0, 0, 1, 1,
-1.07845, -1.289775, -2.242167, 0, 0, 0, 1, 1,
-1.077164, 0.7558596, -1.623643, 0, 0, 0, 1, 1,
-1.07449, 0.01103333, -0.7968891, 1, 1, 1, 1, 1,
-1.073815, 1.055013, -0.6230336, 1, 1, 1, 1, 1,
-1.06269, 0.8021121, 0.4092661, 1, 1, 1, 1, 1,
-1.058581, -1.039587, -1.608216, 1, 1, 1, 1, 1,
-1.057289, -0.7416331, -2.794811, 1, 1, 1, 1, 1,
-1.056683, -0.04838582, -3.938032, 1, 1, 1, 1, 1,
-1.053769, 0.303305, -1.948845, 1, 1, 1, 1, 1,
-1.052087, 0.4958283, 0.8675125, 1, 1, 1, 1, 1,
-1.048663, -1.055399, -3.11918, 1, 1, 1, 1, 1,
-1.04754, -0.2092904, -3.024777, 1, 1, 1, 1, 1,
-1.045554, -0.471522, -2.68063, 1, 1, 1, 1, 1,
-1.044366, -0.556382, -1.078272, 1, 1, 1, 1, 1,
-1.042021, 1.631054, -1.867824, 1, 1, 1, 1, 1,
-1.039691, 0.3425103, -1.224813, 1, 1, 1, 1, 1,
-1.031983, 1.159196, -1.293204, 1, 1, 1, 1, 1,
-1.030459, -1.194952, -2.565438, 0, 0, 1, 1, 1,
-1.016495, 0.9787242, -0.9358487, 1, 0, 0, 1, 1,
-1.015402, -0.02827632, -0.7790464, 1, 0, 0, 1, 1,
-1.007025, 0.06967951, -1.23636, 1, 0, 0, 1, 1,
-1.004929, 0.01793287, -1.072065, 1, 0, 0, 1, 1,
-1.001197, 0.7470039, 0.6562189, 1, 0, 0, 1, 1,
-0.9920967, -1.381028, -3.446558, 0, 0, 0, 1, 1,
-0.9796, -0.08406833, -1.831905, 0, 0, 0, 1, 1,
-0.9770358, -0.1567781, -1.856637, 0, 0, 0, 1, 1,
-0.9712195, 0.4954448, -1.182767, 0, 0, 0, 1, 1,
-0.9676256, 0.4611072, -1.583408, 0, 0, 0, 1, 1,
-0.9672558, 0.4231362, 0.4634234, 0, 0, 0, 1, 1,
-0.9629175, -0.8273772, -0.8214073, 0, 0, 0, 1, 1,
-0.962821, -0.04005314, -1.399393, 1, 1, 1, 1, 1,
-0.9608315, -0.8898959, -3.453852, 1, 1, 1, 1, 1,
-0.960579, 1.575876, -0.2109766, 1, 1, 1, 1, 1,
-0.9533089, 0.8876788, -1.432299, 1, 1, 1, 1, 1,
-0.948994, -0.2957897, -3.444769, 1, 1, 1, 1, 1,
-0.9437585, 0.9121903, -0.6390662, 1, 1, 1, 1, 1,
-0.9394587, -0.7337511, -2.7197, 1, 1, 1, 1, 1,
-0.9351588, 1.978358, 0.2776518, 1, 1, 1, 1, 1,
-0.9309191, -1.328281, -2.142685, 1, 1, 1, 1, 1,
-0.9165081, 0.9382353, -0.702004, 1, 1, 1, 1, 1,
-0.909833, -0.6843916, -3.387913, 1, 1, 1, 1, 1,
-0.9097922, 0.5066715, -1.516038, 1, 1, 1, 1, 1,
-0.9006698, -0.3883854, -2.278753, 1, 1, 1, 1, 1,
-0.8993771, 1.98885, -0.7855189, 1, 1, 1, 1, 1,
-0.8988559, 0.9252071, -1.479176, 1, 1, 1, 1, 1,
-0.89728, -0.384854, -2.606776, 0, 0, 1, 1, 1,
-0.8949685, 0.04236162, -1.02931, 1, 0, 0, 1, 1,
-0.8941883, -0.9897578, -1.092509, 1, 0, 0, 1, 1,
-0.8941147, 1.151296, -0.576045, 1, 0, 0, 1, 1,
-0.8921301, -0.3962939, -0.995151, 1, 0, 0, 1, 1,
-0.8846236, 0.800333, -0.6832994, 1, 0, 0, 1, 1,
-0.8842007, -1.457843, -2.893027, 0, 0, 0, 1, 1,
-0.8825504, -0.6861722, -3.248737, 0, 0, 0, 1, 1,
-0.8774957, 0.7479581, -2.165734, 0, 0, 0, 1, 1,
-0.8752312, -2.518477, -2.876644, 0, 0, 0, 1, 1,
-0.8673956, -1.061756, -2.06284, 0, 0, 0, 1, 1,
-0.8606536, 0.2849289, -1.408125, 0, 0, 0, 1, 1,
-0.8600171, -0.8906295, -2.393853, 0, 0, 0, 1, 1,
-0.8561373, 0.3141737, -2.278334, 1, 1, 1, 1, 1,
-0.8531929, -0.418565, -0.5556638, 1, 1, 1, 1, 1,
-0.8523336, 0.5093575, -1.193626, 1, 1, 1, 1, 1,
-0.8494621, -1.013178, -1.959236, 1, 1, 1, 1, 1,
-0.8489272, -1.911317, -1.353195, 1, 1, 1, 1, 1,
-0.8310034, -1.739461, -3.321286, 1, 1, 1, 1, 1,
-0.8297063, 1.224531, -1.03629, 1, 1, 1, 1, 1,
-0.8259118, -0.1406069, -0.5225673, 1, 1, 1, 1, 1,
-0.8257009, -0.656691, -2.25977, 1, 1, 1, 1, 1,
-0.8214663, -0.05719585, -1.547704, 1, 1, 1, 1, 1,
-0.8197199, -1.330702, -1.318515, 1, 1, 1, 1, 1,
-0.8163796, -0.2080042, -2.162004, 1, 1, 1, 1, 1,
-0.8135002, -2.026467, -2.207637, 1, 1, 1, 1, 1,
-0.8099768, 0.61943, -0.2366382, 1, 1, 1, 1, 1,
-0.8085774, 1.687824, 0.9144961, 1, 1, 1, 1, 1,
-0.8061215, 0.539979, -0.6848401, 0, 0, 1, 1, 1,
-0.8048861, 0.03675037, -2.017339, 1, 0, 0, 1, 1,
-0.8045003, -0.5433515, -1.753284, 1, 0, 0, 1, 1,
-0.8040767, -1.239776, -2.696482, 1, 0, 0, 1, 1,
-0.803076, 1.276457, 0.7388685, 1, 0, 0, 1, 1,
-0.799677, 0.03115921, -0.8785453, 1, 0, 0, 1, 1,
-0.7920692, -0.6629635, -2.266194, 0, 0, 0, 1, 1,
-0.7900788, 0.697753, -1.417518, 0, 0, 0, 1, 1,
-0.7892248, 0.3361833, -2.787108, 0, 0, 0, 1, 1,
-0.7888456, -0.1450837, -1.745367, 0, 0, 0, 1, 1,
-0.7800863, 0.6678764, -2.278246, 0, 0, 0, 1, 1,
-0.7734488, -0.6283488, -3.357888, 0, 0, 0, 1, 1,
-0.7691395, 0.9013762, -0.3834262, 0, 0, 0, 1, 1,
-0.7626382, 1.418163, -0.5340875, 1, 1, 1, 1, 1,
-0.7617226, -0.06896977, -0.1762034, 1, 1, 1, 1, 1,
-0.7616583, 1.282744, -0.9828098, 1, 1, 1, 1, 1,
-0.7594021, -0.928874, -3.916022, 1, 1, 1, 1, 1,
-0.7573612, 0.1563714, -0.9616549, 1, 1, 1, 1, 1,
-0.7527127, 1.639504, -0.4065855, 1, 1, 1, 1, 1,
-0.7449656, 1.08278, 2.084054, 1, 1, 1, 1, 1,
-0.7439763, -0.08206869, -2.948034, 1, 1, 1, 1, 1,
-0.7428284, 0.06180683, -0.8927514, 1, 1, 1, 1, 1,
-0.7399027, 0.4860168, 0.3496336, 1, 1, 1, 1, 1,
-0.739673, 1.236846, -0.7445616, 1, 1, 1, 1, 1,
-0.7371839, 1.116607, 1.357605, 1, 1, 1, 1, 1,
-0.7334374, -2.053569, -3.335769, 1, 1, 1, 1, 1,
-0.7308478, 0.01332463, 0.4268178, 1, 1, 1, 1, 1,
-0.7298146, 0.05013664, -0.6757467, 1, 1, 1, 1, 1,
-0.7296909, 0.7305148, -3.253085, 0, 0, 1, 1, 1,
-0.7196159, -1.390956, -1.421817, 1, 0, 0, 1, 1,
-0.7162269, -0.1224256, -1.70871, 1, 0, 0, 1, 1,
-0.7153584, 0.6735958, -1.529344, 1, 0, 0, 1, 1,
-0.7119277, -1.128736, -2.205755, 1, 0, 0, 1, 1,
-0.7105083, -1.528532, -4.165608, 1, 0, 0, 1, 1,
-0.7104822, 0.2032567, 0.2621568, 0, 0, 0, 1, 1,
-0.7099246, 0.5790629, -0.3095907, 0, 0, 0, 1, 1,
-0.7054904, 0.6565655, -1.56238, 0, 0, 0, 1, 1,
-0.7034362, -0.2040695, -3.006075, 0, 0, 0, 1, 1,
-0.6887547, -0.4733727, -1.889081, 0, 0, 0, 1, 1,
-0.6887284, 2.722621, -0.05082384, 0, 0, 0, 1, 1,
-0.6858349, -0.03343571, -2.394811, 0, 0, 0, 1, 1,
-0.6841913, 0.3096632, -0.9684414, 1, 1, 1, 1, 1,
-0.6815652, 0.7491722, -0.9801925, 1, 1, 1, 1, 1,
-0.6749768, 0.8796811, 0.05214465, 1, 1, 1, 1, 1,
-0.6749037, -0.07132103, -2.115149, 1, 1, 1, 1, 1,
-0.6736251, 0.8705465, -1.126399, 1, 1, 1, 1, 1,
-0.673353, 0.1905433, -1.09269, 1, 1, 1, 1, 1,
-0.6626439, -0.2121973, -0.7743505, 1, 1, 1, 1, 1,
-0.6621146, 0.6774264, -1.397742, 1, 1, 1, 1, 1,
-0.6603882, -0.01298801, -1.839386, 1, 1, 1, 1, 1,
-0.6596609, 0.8641923, 0.4802143, 1, 1, 1, 1, 1,
-0.6583698, -0.003105158, -2.085299, 1, 1, 1, 1, 1,
-0.6583101, 0.854735, -0.07642809, 1, 1, 1, 1, 1,
-0.6582497, 0.2477299, -0.7840788, 1, 1, 1, 1, 1,
-0.6510938, 0.8984348, 0.9177198, 1, 1, 1, 1, 1,
-0.6491534, -0.9815903, -0.9721913, 1, 1, 1, 1, 1,
-0.6457579, 0.9888128, 0.04668286, 0, 0, 1, 1, 1,
-0.6447217, 0.06158056, -1.509485, 1, 0, 0, 1, 1,
-0.6436161, 0.4929555, -1.536548, 1, 0, 0, 1, 1,
-0.6388035, -0.1001739, -0.6932881, 1, 0, 0, 1, 1,
-0.6383582, 0.6387338, -1.338976, 1, 0, 0, 1, 1,
-0.6361505, -0.5451989, -2.072169, 1, 0, 0, 1, 1,
-0.6345938, -1.385621, -1.4369, 0, 0, 0, 1, 1,
-0.6328033, -1.170952, 0.4979913, 0, 0, 0, 1, 1,
-0.6299601, 0.3148607, -1.754358, 0, 0, 0, 1, 1,
-0.6293454, -0.6867071, -2.089504, 0, 0, 0, 1, 1,
-0.6273223, -0.4705921, -2.102619, 0, 0, 0, 1, 1,
-0.6198401, -0.7690696, -4.259542, 0, 0, 0, 1, 1,
-0.6171814, -0.5911589, -2.512297, 0, 0, 0, 1, 1,
-0.6167855, -0.8682771, -3.066518, 1, 1, 1, 1, 1,
-0.6118205, -0.2766983, -0.8411808, 1, 1, 1, 1, 1,
-0.6102281, 0.4847967, -1.480305, 1, 1, 1, 1, 1,
-0.608434, 0.7642683, -2.016647, 1, 1, 1, 1, 1,
-0.6036144, 0.7150177, -0.5679146, 1, 1, 1, 1, 1,
-0.6006237, 0.1410753, -2.254332, 1, 1, 1, 1, 1,
-0.5922252, -0.1490404, -2.804823, 1, 1, 1, 1, 1,
-0.5916772, -0.8333637, -3.45968, 1, 1, 1, 1, 1,
-0.5883962, -1.442163, -3.297205, 1, 1, 1, 1, 1,
-0.5879384, 0.9794423, -1.125354, 1, 1, 1, 1, 1,
-0.5870069, -0.5835343, -1.329028, 1, 1, 1, 1, 1,
-0.5857322, -0.01304526, -3.451963, 1, 1, 1, 1, 1,
-0.5855923, -0.9646406, -2.20503, 1, 1, 1, 1, 1,
-0.5855322, -0.7211027, -1.720167, 1, 1, 1, 1, 1,
-0.5824478, -0.3727978, -2.006567, 1, 1, 1, 1, 1,
-0.5804852, 0.4017544, -3.003099, 0, 0, 1, 1, 1,
-0.5799017, 0.2668069, -0.4440692, 1, 0, 0, 1, 1,
-0.5796574, -0.6087636, -2.136471, 1, 0, 0, 1, 1,
-0.577275, 1.883765, -0.07831384, 1, 0, 0, 1, 1,
-0.576323, -1.549778, -2.79871, 1, 0, 0, 1, 1,
-0.5758303, -1.010769, -2.95986, 1, 0, 0, 1, 1,
-0.5721653, -0.3705426, -1.775187, 0, 0, 0, 1, 1,
-0.5718677, 1.502663, -0.1640231, 0, 0, 0, 1, 1,
-0.5593826, -0.8893299, -2.254846, 0, 0, 0, 1, 1,
-0.5531425, -0.7952154, -3.459152, 0, 0, 0, 1, 1,
-0.5527642, 0.4417498, -0.6499316, 0, 0, 0, 1, 1,
-0.5510772, 0.6128223, -0.8479592, 0, 0, 0, 1, 1,
-0.548498, -0.8448162, -3.55683, 0, 0, 0, 1, 1,
-0.543537, 0.7574474, 0.2999173, 1, 1, 1, 1, 1,
-0.5434943, -0.5135976, -0.9292181, 1, 1, 1, 1, 1,
-0.5434814, -0.3917325, -1.380926, 1, 1, 1, 1, 1,
-0.5420313, 0.4236061, -0.4920568, 1, 1, 1, 1, 1,
-0.525436, 0.8822998, 0.3623171, 1, 1, 1, 1, 1,
-0.5216591, 0.3436614, -1.584982, 1, 1, 1, 1, 1,
-0.5100465, -1.499792, -3.723579, 1, 1, 1, 1, 1,
-0.5100353, -0.4477228, -2.967642, 1, 1, 1, 1, 1,
-0.5090259, 0.3329265, -1.429545, 1, 1, 1, 1, 1,
-0.5083734, -1.306093, -4.044087, 1, 1, 1, 1, 1,
-0.4982301, -0.3366128, -0.7440148, 1, 1, 1, 1, 1,
-0.490787, 0.2944698, 0.05546274, 1, 1, 1, 1, 1,
-0.4904698, 0.4154058, -1.170051, 1, 1, 1, 1, 1,
-0.4804799, -0.6002398, -2.758395, 1, 1, 1, 1, 1,
-0.4782018, 1.557003, -1.520306, 1, 1, 1, 1, 1,
-0.4753194, -0.3528932, -2.867179, 0, 0, 1, 1, 1,
-0.4691904, -1.909771, -3.139695, 1, 0, 0, 1, 1,
-0.4657318, 1.923482, 0.01224407, 1, 0, 0, 1, 1,
-0.4642347, -0.3183004, -3.223647, 1, 0, 0, 1, 1,
-0.464146, 0.6617362, 0.1839555, 1, 0, 0, 1, 1,
-0.4629192, -1.270465, -2.565523, 1, 0, 0, 1, 1,
-0.4617937, 1.934348, -2.652659, 0, 0, 0, 1, 1,
-0.4604425, 0.003150569, -1.873266, 0, 0, 0, 1, 1,
-0.4582954, 1.015519, 0.07131275, 0, 0, 0, 1, 1,
-0.4564639, 0.8647602, -0.4531275, 0, 0, 0, 1, 1,
-0.4561085, -0.7856177, -2.721717, 0, 0, 0, 1, 1,
-0.4552104, -0.02780857, -1.649508, 0, 0, 0, 1, 1,
-0.4544629, 0.1633726, 2.117724, 0, 0, 0, 1, 1,
-0.4513547, -1.812255, -3.861146, 1, 1, 1, 1, 1,
-0.4481634, 0.5910366, 2.00264, 1, 1, 1, 1, 1,
-0.4464614, -0.5681564, -2.561011, 1, 1, 1, 1, 1,
-0.4432306, -0.7285042, -3.246897, 1, 1, 1, 1, 1,
-0.442921, 0.5730459, -0.5633497, 1, 1, 1, 1, 1,
-0.4416924, -1.493218, -3.001536, 1, 1, 1, 1, 1,
-0.4375664, -0.3904363, -1.800881, 1, 1, 1, 1, 1,
-0.4311364, 0.4576111, -0.4515862, 1, 1, 1, 1, 1,
-0.430886, 0.3977939, -2.302138, 1, 1, 1, 1, 1,
-0.4284922, -0.9459688, -2.014017, 1, 1, 1, 1, 1,
-0.4159779, -0.140088, -2.311215, 1, 1, 1, 1, 1,
-0.4141355, 0.4202046, -1.882739, 1, 1, 1, 1, 1,
-0.4138072, 0.8431819, -1.57791, 1, 1, 1, 1, 1,
-0.4067724, 0.9261049, 0.46345, 1, 1, 1, 1, 1,
-0.4060678, -0.4520936, -1.607877, 1, 1, 1, 1, 1,
-0.4057154, 0.1552965, -1.446961, 0, 0, 1, 1, 1,
-0.3968474, -1.192393, -3.061885, 1, 0, 0, 1, 1,
-0.3964606, -0.7415123, -3.077103, 1, 0, 0, 1, 1,
-0.386062, -0.6968388, -2.557799, 1, 0, 0, 1, 1,
-0.385814, 0.529882, 0.4088314, 1, 0, 0, 1, 1,
-0.3856201, 0.5036051, -1.063151, 1, 0, 0, 1, 1,
-0.3832484, 0.880626, -0.7511141, 0, 0, 0, 1, 1,
-0.3776976, 1.595377, -0.4026247, 0, 0, 0, 1, 1,
-0.3766404, -0.7813366, -1.839428, 0, 0, 0, 1, 1,
-0.3710698, 1.344758, -2.901902, 0, 0, 0, 1, 1,
-0.3700403, -1.819411, -2.045894, 0, 0, 0, 1, 1,
-0.3669492, 0.496789, -0.0784387, 0, 0, 0, 1, 1,
-0.3638642, 0.1995158, -1.628225, 0, 0, 0, 1, 1,
-0.3633858, -0.3531408, -1.928428, 1, 1, 1, 1, 1,
-0.3625296, -0.8982981, -3.787474, 1, 1, 1, 1, 1,
-0.3590938, -0.1124275, -1.876333, 1, 1, 1, 1, 1,
-0.3581552, 0.4947004, -0.3155704, 1, 1, 1, 1, 1,
-0.3567737, 0.5443256, -0.8003983, 1, 1, 1, 1, 1,
-0.3474357, 1.656409, 0.4245333, 1, 1, 1, 1, 1,
-0.3471435, -1.570346, -4.180162, 1, 1, 1, 1, 1,
-0.3469021, 0.474933, 0.5762601, 1, 1, 1, 1, 1,
-0.3443561, 0.02368083, -1.727142, 1, 1, 1, 1, 1,
-0.3439582, -0.4592935, -1.943732, 1, 1, 1, 1, 1,
-0.3427228, -0.9255161, -4.999666, 1, 1, 1, 1, 1,
-0.3423508, -1.597727, -3.175235, 1, 1, 1, 1, 1,
-0.3394414, 1.445591, 0.3707603, 1, 1, 1, 1, 1,
-0.3279071, 0.03113815, -1.617382, 1, 1, 1, 1, 1,
-0.3273869, 0.9181797, 0.0336839, 1, 1, 1, 1, 1,
-0.324486, -0.2678354, -2.175581, 0, 0, 1, 1, 1,
-0.3200987, 0.912191, -0.004815018, 1, 0, 0, 1, 1,
-0.3089793, -1.417042, -3.041643, 1, 0, 0, 1, 1,
-0.3087053, -1.222821, -3.29265, 1, 0, 0, 1, 1,
-0.2986586, 1.637023, -0.3969375, 1, 0, 0, 1, 1,
-0.2917961, 1.025078, 0.6436068, 1, 0, 0, 1, 1,
-0.2874304, 1.346639, -0.04982124, 0, 0, 0, 1, 1,
-0.2708074, -0.07974842, -1.789739, 0, 0, 0, 1, 1,
-0.2683422, 0.2561737, -1.075747, 0, 0, 0, 1, 1,
-0.267845, 0.3670177, 0.8426479, 0, 0, 0, 1, 1,
-0.266186, 0.006688248, -0.8532003, 0, 0, 0, 1, 1,
-0.264771, -1.22635, -2.973316, 0, 0, 0, 1, 1,
-0.2596009, 0.2674778, -1.85217, 0, 0, 0, 1, 1,
-0.251225, 1.410852, 0.02259515, 1, 1, 1, 1, 1,
-0.249496, 1.592392, 0.8903588, 1, 1, 1, 1, 1,
-0.2476659, 0.3867222, 1.187333, 1, 1, 1, 1, 1,
-0.2450485, 1.23284, -0.5294408, 1, 1, 1, 1, 1,
-0.242905, 1.687511, 0.6912583, 1, 1, 1, 1, 1,
-0.2424461, 0.7763227, -2.306867, 1, 1, 1, 1, 1,
-0.2421993, 1.310933, -1.385608, 1, 1, 1, 1, 1,
-0.2408046, 0.4039996, -0.8164703, 1, 1, 1, 1, 1,
-0.2318293, 0.5364088, -0.7211451, 1, 1, 1, 1, 1,
-0.2316128, 1.170615, -1.071534, 1, 1, 1, 1, 1,
-0.2311007, -1.160111, -3.672142, 1, 1, 1, 1, 1,
-0.2274371, 0.1657834, -3.180721, 1, 1, 1, 1, 1,
-0.2273362, 1.534373, -0.3725649, 1, 1, 1, 1, 1,
-0.225482, 1.399327, -0.4414626, 1, 1, 1, 1, 1,
-0.2247801, -1.036039, -1.608277, 1, 1, 1, 1, 1,
-0.2237831, -0.09953149, -1.652769, 0, 0, 1, 1, 1,
-0.2224448, 1.181633, -1.386601, 1, 0, 0, 1, 1,
-0.220131, -1.795174, -2.302387, 1, 0, 0, 1, 1,
-0.2190396, 2.162823, 0.2406767, 1, 0, 0, 1, 1,
-0.216101, -0.3494498, -2.483011, 1, 0, 0, 1, 1,
-0.2141491, 0.5529496, -1.321153, 1, 0, 0, 1, 1,
-0.2116547, 0.4594015, -0.430021, 0, 0, 0, 1, 1,
-0.207608, -0.07921434, -2.889184, 0, 0, 0, 1, 1,
-0.2053957, -0.447182, -1.480177, 0, 0, 0, 1, 1,
-0.2036362, -2.27798, -1.847141, 0, 0, 0, 1, 1,
-0.2016389, -0.4392321, -2.552841, 0, 0, 0, 1, 1,
-0.200394, -2.093179, -4.774191, 0, 0, 0, 1, 1,
-0.1976776, 0.6583875, 0.1674347, 0, 0, 0, 1, 1,
-0.1945324, 2.707202, -1.624337, 1, 1, 1, 1, 1,
-0.1931625, 1.175258, -0.9764055, 1, 1, 1, 1, 1,
-0.1890538, -1.656659, -4.169067, 1, 1, 1, 1, 1,
-0.185147, -0.3590796, -2.563767, 1, 1, 1, 1, 1,
-0.1842708, -0.6219292, -2.247754, 1, 1, 1, 1, 1,
-0.183637, -0.3309712, -2.657428, 1, 1, 1, 1, 1,
-0.1778061, 2.213262, 0.4825692, 1, 1, 1, 1, 1,
-0.1774116, -0.006365865, -0.6138647, 1, 1, 1, 1, 1,
-0.1681607, -0.1168561, -2.56279, 1, 1, 1, 1, 1,
-0.1632659, -0.04330176, -1.808423, 1, 1, 1, 1, 1,
-0.162724, 0.5269532, 1.030936, 1, 1, 1, 1, 1,
-0.1611862, 1.352262, 0.7868248, 1, 1, 1, 1, 1,
-0.1590261, -1.105972, -2.722192, 1, 1, 1, 1, 1,
-0.1537364, -1.443354, -4.150556, 1, 1, 1, 1, 1,
-0.1496634, 0.507636, -0.512839, 1, 1, 1, 1, 1,
-0.147122, 0.3531957, -0.3502588, 0, 0, 1, 1, 1,
-0.1463716, 1.166603, -0.320029, 1, 0, 0, 1, 1,
-0.1459803, 0.06896371, -1.579062, 1, 0, 0, 1, 1,
-0.1423535, -0.6942515, -3.538787, 1, 0, 0, 1, 1,
-0.1374416, 0.8569698, -0.5870557, 1, 0, 0, 1, 1,
-0.1302907, -1.151143, -2.528091, 1, 0, 0, 1, 1,
-0.1268114, 0.3708812, -1.042971, 0, 0, 0, 1, 1,
-0.1256589, 0.2144989, 0.1225708, 0, 0, 0, 1, 1,
-0.124481, 0.4178469, 0.292861, 0, 0, 0, 1, 1,
-0.1242101, -0.01467955, -2.526939, 0, 0, 0, 1, 1,
-0.1237495, 1.478189, 0.9297655, 0, 0, 0, 1, 1,
-0.1182343, -0.1239975, -1.227043, 0, 0, 0, 1, 1,
-0.1169187, -0.1477152, -2.543231, 0, 0, 0, 1, 1,
-0.1053716, -1.102953, -2.908752, 1, 1, 1, 1, 1,
-0.1016998, 1.273469, 0.1780264, 1, 1, 1, 1, 1,
-0.09961225, -0.2801595, -2.37594, 1, 1, 1, 1, 1,
-0.09597321, 1.285419, 0.1861095, 1, 1, 1, 1, 1,
-0.09526104, 0.2788009, -0.2408506, 1, 1, 1, 1, 1,
-0.09183614, -0.3369201, -3.082967, 1, 1, 1, 1, 1,
-0.09161863, 0.2901769, 0.07467072, 1, 1, 1, 1, 1,
-0.09052392, -1.110313, -2.829084, 1, 1, 1, 1, 1,
-0.08700871, -0.2419605, -3.76294, 1, 1, 1, 1, 1,
-0.08628696, 0.7010443, -1.245017, 1, 1, 1, 1, 1,
-0.0841364, 1.088015, 0.4003047, 1, 1, 1, 1, 1,
-0.07798287, 1.400253, 0.06082813, 1, 1, 1, 1, 1,
-0.07770661, 1.358843, -0.1157001, 1, 1, 1, 1, 1,
-0.07587957, -0.237716, -1.85208, 1, 1, 1, 1, 1,
-0.07541098, 1.225927, 1.106818, 1, 1, 1, 1, 1,
-0.07421473, -0.4542489, -2.427253, 0, 0, 1, 1, 1,
-0.07401393, -0.2076902, -2.418725, 1, 0, 0, 1, 1,
-0.06383273, 0.6839679, 1.374414, 1, 0, 0, 1, 1,
-0.06288949, -2.130553, -2.610584, 1, 0, 0, 1, 1,
-0.05793711, 0.7698732, -0.5086159, 1, 0, 0, 1, 1,
-0.05760941, -0.3278201, -0.1606824, 1, 0, 0, 1, 1,
-0.05355783, -0.2414524, -3.516433, 0, 0, 0, 1, 1,
-0.05185569, 1.446766, -0.1633591, 0, 0, 0, 1, 1,
-0.04921791, 0.8423259, -1.055295, 0, 0, 0, 1, 1,
-0.0489103, 0.4602223, 0.32359, 0, 0, 0, 1, 1,
-0.04370484, -1.160766, -4.362124, 0, 0, 0, 1, 1,
-0.04117133, -0.8128976, -2.750062, 0, 0, 0, 1, 1,
-0.03976429, -1.248978, -1.443331, 0, 0, 0, 1, 1,
-0.03743069, -0.4763671, -2.716527, 1, 1, 1, 1, 1,
-0.03693637, -1.17815, -4.338061, 1, 1, 1, 1, 1,
-0.02457669, -0.4257265, -4.351438, 1, 1, 1, 1, 1,
-0.02448351, -0.6737158, -4.087827, 1, 1, 1, 1, 1,
-0.02228787, -0.0377037, -2.256034, 1, 1, 1, 1, 1,
-0.01839985, -0.1767947, -4.066028, 1, 1, 1, 1, 1,
-0.01635849, -0.1319019, -1.367659, 1, 1, 1, 1, 1,
-0.01546612, 0.347751, 0.4735375, 1, 1, 1, 1, 1,
-0.01416049, 0.03708195, 0.3795886, 1, 1, 1, 1, 1,
-0.009901252, 1.199806, -0.146349, 1, 1, 1, 1, 1,
-0.008214233, 0.6831612, -0.4107821, 1, 1, 1, 1, 1,
-0.006475435, 1.327368, 1.97929, 1, 1, 1, 1, 1,
-0.0006806332, 1.56741, -0.8921175, 1, 1, 1, 1, 1,
-0.000620136, 0.3791604, -0.5618679, 1, 1, 1, 1, 1,
-0.0004162418, -0.3400695, -1.915573, 1, 1, 1, 1, 1,
-0.0004075346, 0.03735988, -0.8356429, 0, 0, 1, 1, 1,
0.0001465257, -1.148739, 3.3868, 1, 0, 0, 1, 1,
0.003258085, 0.8519156, 0.4406272, 1, 0, 0, 1, 1,
0.01760419, -0.7643706, 2.086381, 1, 0, 0, 1, 1,
0.0213722, -0.6792166, 3.51531, 1, 0, 0, 1, 1,
0.02313151, -1.092236, 4.670764, 1, 0, 0, 1, 1,
0.02394127, -1.2999, 2.776175, 0, 0, 0, 1, 1,
0.0243711, 0.2647659, 0.7007636, 0, 0, 0, 1, 1,
0.02479482, -1.49303, 1.636095, 0, 0, 0, 1, 1,
0.02520661, 0.5051326, -0.2526024, 0, 0, 0, 1, 1,
0.02766226, 0.512182, 0.120545, 0, 0, 0, 1, 1,
0.02822268, 0.3625322, 1.014672, 0, 0, 0, 1, 1,
0.03110349, 1.05387, -0.7147864, 0, 0, 0, 1, 1,
0.03353734, 0.8243325, 0.8392086, 1, 1, 1, 1, 1,
0.03668767, 0.5031537, 1.945754, 1, 1, 1, 1, 1,
0.04161402, -0.6340796, 2.659846, 1, 1, 1, 1, 1,
0.04264909, 0.9259111, 0.6874121, 1, 1, 1, 1, 1,
0.04525151, 0.5443999, -0.05070532, 1, 1, 1, 1, 1,
0.04804827, 1.909431, 0.3208058, 1, 1, 1, 1, 1,
0.0486006, -0.6690593, 2.778086, 1, 1, 1, 1, 1,
0.04962688, -0.9018289, 2.20564, 1, 1, 1, 1, 1,
0.05037349, -0.03480139, 2.010641, 1, 1, 1, 1, 1,
0.05240982, 0.7864882, 0.4052468, 1, 1, 1, 1, 1,
0.05407242, 0.5099339, 1.461564, 1, 1, 1, 1, 1,
0.05531349, -0.09220636, 2.34766, 1, 1, 1, 1, 1,
0.05705591, 0.5812798, -0.2259262, 1, 1, 1, 1, 1,
0.06143091, 0.1074124, 1.630254, 1, 1, 1, 1, 1,
0.06274007, 0.4815735, -0.1373872, 1, 1, 1, 1, 1,
0.06593838, -0.5455446, 5.004898, 0, 0, 1, 1, 1,
0.07642961, -1.19516, 2.579811, 1, 0, 0, 1, 1,
0.08358384, 0.242524, -0.9516127, 1, 0, 0, 1, 1,
0.08695535, 0.2009306, 0.01824811, 1, 0, 0, 1, 1,
0.09135344, -0.09522383, 1.517749, 1, 0, 0, 1, 1,
0.0937317, -1.70562, 0.7476814, 1, 0, 0, 1, 1,
0.09504727, 1.401934, 0.4304479, 0, 0, 0, 1, 1,
0.09548465, 0.696633, 0.3799602, 0, 0, 0, 1, 1,
0.09637867, -0.3066162, 3.508103, 0, 0, 0, 1, 1,
0.096531, 0.04557039, 0.4828262, 0, 0, 0, 1, 1,
0.09713423, -0.9027997, 4.449722, 0, 0, 0, 1, 1,
0.1000409, -0.633276, 2.200911, 0, 0, 0, 1, 1,
0.1011677, 1.639843, -0.8667424, 0, 0, 0, 1, 1,
0.1016635, -0.00985482, 1.474401, 1, 1, 1, 1, 1,
0.1031306, -1.678469, 1.612589, 1, 1, 1, 1, 1,
0.1033603, -0.3620173, 1.92556, 1, 1, 1, 1, 1,
0.1063666, 0.9667566, -1.842885, 1, 1, 1, 1, 1,
0.1086503, 1.450418, -1.487176, 1, 1, 1, 1, 1,
0.1096838, -1.148667, 3.448939, 1, 1, 1, 1, 1,
0.1159532, 0.05961728, 1.654567, 1, 1, 1, 1, 1,
0.1211502, -0.9625033, 2.93523, 1, 1, 1, 1, 1,
0.1220153, -0.990144, 4.313269, 1, 1, 1, 1, 1,
0.1233722, -0.814696, 3.386172, 1, 1, 1, 1, 1,
0.1242927, -1.782091, 3.450456, 1, 1, 1, 1, 1,
0.1245279, -0.04729807, 1.591056, 1, 1, 1, 1, 1,
0.1253176, -0.6446185, 3.59628, 1, 1, 1, 1, 1,
0.1258122, -0.7036296, 2.524805, 1, 1, 1, 1, 1,
0.1280483, 0.8770855, -0.8442679, 1, 1, 1, 1, 1,
0.1291642, -0.1954776, 2.756699, 0, 0, 1, 1, 1,
0.1291779, 0.6083977, -0.8544452, 1, 0, 0, 1, 1,
0.1301015, 0.9129231, 0.7421821, 1, 0, 0, 1, 1,
0.1306418, -0.4801773, 3.271458, 1, 0, 0, 1, 1,
0.131763, 0.1968602, -0.1466218, 1, 0, 0, 1, 1,
0.131769, -0.4031957, 2.521907, 1, 0, 0, 1, 1,
0.1332804, -0.3450139, 2.569057, 0, 0, 0, 1, 1,
0.1361496, 0.2053865, 0.1916028, 0, 0, 0, 1, 1,
0.1373823, 0.8620678, -1.296455, 0, 0, 0, 1, 1,
0.1397466, -0.9333276, 3.765653, 0, 0, 0, 1, 1,
0.1469293, 1.448065, 1.927599, 0, 0, 0, 1, 1,
0.1476782, -0.5103125, 3.666401, 0, 0, 0, 1, 1,
0.1494116, 0.3577102, 0.5460691, 0, 0, 0, 1, 1,
0.1498484, 0.3463295, -0.08843296, 1, 1, 1, 1, 1,
0.151712, -0.9701499, 2.714933, 1, 1, 1, 1, 1,
0.155141, -2.279053, 2.281192, 1, 1, 1, 1, 1,
0.1574511, -0.4748492, 3.125494, 1, 1, 1, 1, 1,
0.1577733, -1.325178, 1.751816, 1, 1, 1, 1, 1,
0.1594467, 1.288862, -0.005896014, 1, 1, 1, 1, 1,
0.1629698, 0.911081, -0.4057371, 1, 1, 1, 1, 1,
0.1633547, -0.3970497, 2.008882, 1, 1, 1, 1, 1,
0.1665395, 1.247975, 0.751727, 1, 1, 1, 1, 1,
0.1668615, 1.033969, 1.227003, 1, 1, 1, 1, 1,
0.1676915, 0.4931418, 0.2871714, 1, 1, 1, 1, 1,
0.1688494, -0.8665566, 3.197936, 1, 1, 1, 1, 1,
0.1695119, 0.1751492, 2.247804, 1, 1, 1, 1, 1,
0.1695921, -0.3604262, 2.959082, 1, 1, 1, 1, 1,
0.1698125, 0.0772773, 1.160708, 1, 1, 1, 1, 1,
0.1765004, 1.005103, 0.7251593, 0, 0, 1, 1, 1,
0.1786832, -0.2094982, 3.072215, 1, 0, 0, 1, 1,
0.1798832, -0.32886, 2.732612, 1, 0, 0, 1, 1,
0.1837452, 1.247957, 0.2737653, 1, 0, 0, 1, 1,
0.1838907, -1.80032, 5.386341, 1, 0, 0, 1, 1,
0.1872184, 0.285654, -0.09380237, 1, 0, 0, 1, 1,
0.1903562, 0.7276904, 1.995772, 0, 0, 0, 1, 1,
0.1912606, -0.5580941, 3.270801, 0, 0, 0, 1, 1,
0.1939707, -1.470463, 1.488394, 0, 0, 0, 1, 1,
0.1940557, -0.9249732, 1.543689, 0, 0, 0, 1, 1,
0.1988869, 1.388627, 0.2262892, 0, 0, 0, 1, 1,
0.1994425, 0.2937867, -0.3938233, 0, 0, 0, 1, 1,
0.2000555, 0.8184975, 1.901751, 0, 0, 0, 1, 1,
0.2034948, -1.492595, 4.013748, 1, 1, 1, 1, 1,
0.2074929, -0.57239, 3.140659, 1, 1, 1, 1, 1,
0.2077786, 0.6361631, -2.188103, 1, 1, 1, 1, 1,
0.207868, 0.4958886, -0.169445, 1, 1, 1, 1, 1,
0.2112608, -0.5933877, 1.936314, 1, 1, 1, 1, 1,
0.2152366, -1.91517, 1.861712, 1, 1, 1, 1, 1,
0.2160109, 0.5308746, 1.522782, 1, 1, 1, 1, 1,
0.226283, -0.2826071, 1.671957, 1, 1, 1, 1, 1,
0.2267657, -0.3844437, 2.676453, 1, 1, 1, 1, 1,
0.231637, 0.3069301, 1.161649, 1, 1, 1, 1, 1,
0.2343771, 0.38848, 0.0889824, 1, 1, 1, 1, 1,
0.2352249, -0.3543518, 4.049726, 1, 1, 1, 1, 1,
0.2368429, -2.144918, 2.220597, 1, 1, 1, 1, 1,
0.2425453, -0.1514442, 1.651064, 1, 1, 1, 1, 1,
0.2486279, -0.8750145, 1.21989, 1, 1, 1, 1, 1,
0.2506481, 0.8674766, 1.154207, 0, 0, 1, 1, 1,
0.2521421, -0.4593953, 3.425509, 1, 0, 0, 1, 1,
0.2642092, 0.755377, 1.14282, 1, 0, 0, 1, 1,
0.2643186, 1.192624, 0.6811732, 1, 0, 0, 1, 1,
0.2646394, 1.622119, -0.3546555, 1, 0, 0, 1, 1,
0.2686576, -0.2409926, 0.02737109, 1, 0, 0, 1, 1,
0.2734778, 1.633718, -0.1366939, 0, 0, 0, 1, 1,
0.2764108, -1.542233, 2.668677, 0, 0, 0, 1, 1,
0.2768048, 1.081273, -0.6193113, 0, 0, 0, 1, 1,
0.2783063, -1.316821, 3.639692, 0, 0, 0, 1, 1,
0.2795664, -1.027244, 3.954704, 0, 0, 0, 1, 1,
0.2828115, -0.5307404, 3.449218, 0, 0, 0, 1, 1,
0.2839592, 1.356736, -1.429339, 0, 0, 0, 1, 1,
0.2861932, -0.06447513, 1.207202, 1, 1, 1, 1, 1,
0.288195, -1.403577, 3.618734, 1, 1, 1, 1, 1,
0.2945097, 0.2711242, 1.720688, 1, 1, 1, 1, 1,
0.2993974, 0.7310804, 1.270475, 1, 1, 1, 1, 1,
0.3005086, 2.109532, -1.532058, 1, 1, 1, 1, 1,
0.3007307, -1.055403, 1.509437, 1, 1, 1, 1, 1,
0.3060394, -0.1686006, 2.776788, 1, 1, 1, 1, 1,
0.306574, -2.019424, 2.060002, 1, 1, 1, 1, 1,
0.3069066, -1.058957, 3.075296, 1, 1, 1, 1, 1,
0.3098441, 1.767688, -1.94142, 1, 1, 1, 1, 1,
0.3107443, 1.170965, -0.1282856, 1, 1, 1, 1, 1,
0.3190329, -1.618637, 1.70303, 1, 1, 1, 1, 1,
0.3269784, 0.9377857, 0.424895, 1, 1, 1, 1, 1,
0.3288892, 0.6134365, 0.9910154, 1, 1, 1, 1, 1,
0.3294605, 0.3058505, 0.5817447, 1, 1, 1, 1, 1,
0.3307219, 0.1673099, 2.76895, 0, 0, 1, 1, 1,
0.3334053, 0.02211449, 1.546864, 1, 0, 0, 1, 1,
0.3444991, -0.1958874, 2.433381, 1, 0, 0, 1, 1,
0.3477785, 0.1027698, 0.5382919, 1, 0, 0, 1, 1,
0.3483595, -0.2349782, 1.800953, 1, 0, 0, 1, 1,
0.3491264, -0.3366839, 2.942832, 1, 0, 0, 1, 1,
0.3516488, -0.5071089, 3.848591, 0, 0, 0, 1, 1,
0.3570311, -1.398031, 2.539188, 0, 0, 0, 1, 1,
0.3588922, 0.6068523, 0.4352252, 0, 0, 0, 1, 1,
0.359635, -1.726771, 2.860869, 0, 0, 0, 1, 1,
0.3622925, 1.762311, 0.7725852, 0, 0, 0, 1, 1,
0.3665733, -1.464367, 1.342232, 0, 0, 0, 1, 1,
0.3714498, -0.2364745, 2.550756, 0, 0, 0, 1, 1,
0.3794863, -1.175433, 3.010632, 1, 1, 1, 1, 1,
0.3847069, -1.607491, 2.610786, 1, 1, 1, 1, 1,
0.385622, -0.01564344, 3.103704, 1, 1, 1, 1, 1,
0.3878037, -0.3171346, 1.828295, 1, 1, 1, 1, 1,
0.3879307, -0.7695978, 2.599568, 1, 1, 1, 1, 1,
0.4049362, -1.117017, 3.250218, 1, 1, 1, 1, 1,
0.4071908, -0.2505131, 2.209786, 1, 1, 1, 1, 1,
0.4079789, -1.469204, 3.479623, 1, 1, 1, 1, 1,
0.4108269, -0.1270176, 3.269143, 1, 1, 1, 1, 1,
0.4109128, 1.476406, -0.08120909, 1, 1, 1, 1, 1,
0.4148946, 0.4984091, 0.6537206, 1, 1, 1, 1, 1,
0.4151744, -1.308689, 3.060947, 1, 1, 1, 1, 1,
0.4160711, 0.3196428, 0.4534558, 1, 1, 1, 1, 1,
0.4166337, -0.1461522, 3.290383, 1, 1, 1, 1, 1,
0.4177103, -0.1117182, -0.1741278, 1, 1, 1, 1, 1,
0.4201832, -1.226388, 0.7002518, 0, 0, 1, 1, 1,
0.4203295, 2.069733, 0.9226964, 1, 0, 0, 1, 1,
0.4230033, 1.21332, 0.5196105, 1, 0, 0, 1, 1,
0.42471, -0.4069341, 3.164686, 1, 0, 0, 1, 1,
0.4294024, -0.02526719, 1.285677, 1, 0, 0, 1, 1,
0.4306382, 2.721571, -0.4808358, 1, 0, 0, 1, 1,
0.433915, -1.287238, 3.619336, 0, 0, 0, 1, 1,
0.4419212, -0.7867782, 2.748828, 0, 0, 0, 1, 1,
0.4426693, -1.713814, 4.193869, 0, 0, 0, 1, 1,
0.4434839, -0.07536668, 1.357668, 0, 0, 0, 1, 1,
0.4606842, -0.8514633, 1.890492, 0, 0, 0, 1, 1,
0.4639559, 0.7699325, 1.97525, 0, 0, 0, 1, 1,
0.4652571, 0.7384521, 0.1675896, 0, 0, 0, 1, 1,
0.4777386, -1.447831, 2.599159, 1, 1, 1, 1, 1,
0.4786406, 0.3237575, 2.481683, 1, 1, 1, 1, 1,
0.4789323, 0.3511685, 1.506168, 1, 1, 1, 1, 1,
0.4860108, 2.462186, 0.6807982, 1, 1, 1, 1, 1,
0.486793, -1.239003, 2.495697, 1, 1, 1, 1, 1,
0.4898809, -0.4088109, 4.517553, 1, 1, 1, 1, 1,
0.495332, 0.02525053, 1.546114, 1, 1, 1, 1, 1,
0.4982844, -0.01425493, 0.3006122, 1, 1, 1, 1, 1,
0.4987688, 0.3848212, -1.12824, 1, 1, 1, 1, 1,
0.4990039, -0.4159631, 2.792504, 1, 1, 1, 1, 1,
0.5019967, -0.04188848, 1.656958, 1, 1, 1, 1, 1,
0.5039775, 0.3798258, 0.2863977, 1, 1, 1, 1, 1,
0.5062659, 0.911281, 0.9967299, 1, 1, 1, 1, 1,
0.5159551, -1.700937, 4.325894, 1, 1, 1, 1, 1,
0.5162455, -1.187695, 2.545907, 1, 1, 1, 1, 1,
0.5196343, 1.993013, -1.587302, 0, 0, 1, 1, 1,
0.5214999, -1.021932, 4.790903, 1, 0, 0, 1, 1,
0.5235546, -0.6031403, 1.679025, 1, 0, 0, 1, 1,
0.5260089, -0.24576, 4.120402, 1, 0, 0, 1, 1,
0.5266853, 0.573425, 1.350961, 1, 0, 0, 1, 1,
0.5286811, 0.1700432, 1.31155, 1, 0, 0, 1, 1,
0.5315387, -2.109427, 3.445077, 0, 0, 0, 1, 1,
0.534154, -1.10477, 2.18283, 0, 0, 0, 1, 1,
0.5369043, -0.2406545, 2.048763, 0, 0, 0, 1, 1,
0.5372015, -0.06243746, 2.206542, 0, 0, 0, 1, 1,
0.5401068, -0.01280426, 2.608423, 0, 0, 0, 1, 1,
0.5441527, -1.556848, 2.617305, 0, 0, 0, 1, 1,
0.5453752, 1.303846, 1.068984, 0, 0, 0, 1, 1,
0.545863, -0.8087564, 0.5804665, 1, 1, 1, 1, 1,
0.5472502, -0.9497635, 3.206279, 1, 1, 1, 1, 1,
0.5474884, -1.051546, 1.771187, 1, 1, 1, 1, 1,
0.5494705, 0.6013265, 1.529756, 1, 1, 1, 1, 1,
0.5499655, -1.45567, 2.445891, 1, 1, 1, 1, 1,
0.5517461, 0.2924221, 0.2023722, 1, 1, 1, 1, 1,
0.5522883, -1.160484, 1.951897, 1, 1, 1, 1, 1,
0.5525328, -0.008209554, 2.545255, 1, 1, 1, 1, 1,
0.5527927, 0.1187187, 1.092615, 1, 1, 1, 1, 1,
0.5567671, 0.5555364, 0.04344954, 1, 1, 1, 1, 1,
0.5642753, 0.7300864, -0.2427738, 1, 1, 1, 1, 1,
0.5644022, -0.6337075, 4.463013, 1, 1, 1, 1, 1,
0.5709675, 0.1840637, 3.565021, 1, 1, 1, 1, 1,
0.5713835, 0.2999439, -0.2652291, 1, 1, 1, 1, 1,
0.5717412, 2.932011, -0.04971633, 1, 1, 1, 1, 1,
0.5742331, -0.9477346, 0.8610293, 0, 0, 1, 1, 1,
0.5748523, 0.2412142, 0.05405172, 1, 0, 0, 1, 1,
0.5809431, -1.550039, 3.501576, 1, 0, 0, 1, 1,
0.5823196, 0.6642712, 1.282264, 1, 0, 0, 1, 1,
0.5841756, 0.09104536, 0.7162806, 1, 0, 0, 1, 1,
0.5880253, 2.243556, 1.134625, 1, 0, 0, 1, 1,
0.5898897, 0.8248003, 0.5969642, 0, 0, 0, 1, 1,
0.5947443, -0.2966636, 2.376473, 0, 0, 0, 1, 1,
0.5954219, -0.7845767, 2.316568, 0, 0, 0, 1, 1,
0.6061803, -1.017353, 2.998575, 0, 0, 0, 1, 1,
0.6106099, -0.7499032, 2.097028, 0, 0, 0, 1, 1,
0.6119181, 1.711937, -0.1579762, 0, 0, 0, 1, 1,
0.6198959, -0.7871249, 2.324904, 0, 0, 0, 1, 1,
0.6220574, 1.457795, -1.046813, 1, 1, 1, 1, 1,
0.6268072, -0.8973842, 1.97937, 1, 1, 1, 1, 1,
0.6304495, 1.007504, -0.4721611, 1, 1, 1, 1, 1,
0.6387048, 0.1388966, 0.915437, 1, 1, 1, 1, 1,
0.6391057, -1.204345, 4.066317, 1, 1, 1, 1, 1,
0.6396417, -0.6005628, 1.207208, 1, 1, 1, 1, 1,
0.6455115, 1.360452, 0.2108863, 1, 1, 1, 1, 1,
0.6456339, 0.1880266, 2.449808, 1, 1, 1, 1, 1,
0.6536981, 0.3254278, 0.5928897, 1, 1, 1, 1, 1,
0.6537804, -1.45559, 3.534175, 1, 1, 1, 1, 1,
0.6544814, -2.469427, 3.403129, 1, 1, 1, 1, 1,
0.6546729, -0.4739907, 1.411999, 1, 1, 1, 1, 1,
0.6620993, -1.355725, 1.839601, 1, 1, 1, 1, 1,
0.6645085, 0.4453686, -1.221897, 1, 1, 1, 1, 1,
0.6714019, 1.080486, 0.849605, 1, 1, 1, 1, 1,
0.689433, -0.01749776, 2.580427, 0, 0, 1, 1, 1,
0.6918404, -0.2860581, 2.658728, 1, 0, 0, 1, 1,
0.6927787, -1.428001, 2.479638, 1, 0, 0, 1, 1,
0.7021798, 0.06348114, 2.343924, 1, 0, 0, 1, 1,
0.7050732, 1.318218, 0.203632, 1, 0, 0, 1, 1,
0.7053112, 0.0493445, 1.647415, 1, 0, 0, 1, 1,
0.705573, 0.612533, 1.066373, 0, 0, 0, 1, 1,
0.7101298, -1.079501, 2.888239, 0, 0, 0, 1, 1,
0.7129692, -2.556273, 3.541742, 0, 0, 0, 1, 1,
0.7177029, 1.164547, 0.4226432, 0, 0, 0, 1, 1,
0.7203501, 1.229903, 0.04446287, 0, 0, 0, 1, 1,
0.7259908, -2.605095, 4.208575, 0, 0, 0, 1, 1,
0.7274292, -0.3556181, 1.483122, 0, 0, 0, 1, 1,
0.7347929, -0.8863935, 3.00728, 1, 1, 1, 1, 1,
0.7366994, -1.63518, 0.9896277, 1, 1, 1, 1, 1,
0.7414916, -0.741331, 0.2303322, 1, 1, 1, 1, 1,
0.7461467, -0.05978937, 3.262639, 1, 1, 1, 1, 1,
0.7482688, 0.8300839, -1.514746, 1, 1, 1, 1, 1,
0.7498278, 0.9078923, 0.1577287, 1, 1, 1, 1, 1,
0.7503037, 0.2949744, 0.5234822, 1, 1, 1, 1, 1,
0.7513984, 0.4572015, 2.245033, 1, 1, 1, 1, 1,
0.7566581, -0.1536992, 2.220915, 1, 1, 1, 1, 1,
0.7600756, -0.5456617, 1.853595, 1, 1, 1, 1, 1,
0.7604288, -2.155551, 1.445198, 1, 1, 1, 1, 1,
0.7606945, 1.411672, -0.6037031, 1, 1, 1, 1, 1,
0.7609811, 1.675726, -0.03485939, 1, 1, 1, 1, 1,
0.7714787, -1.027908, 1.586486, 1, 1, 1, 1, 1,
0.7717463, 0.1062763, 1.272601, 1, 1, 1, 1, 1,
0.7761753, 0.3789326, 2.895651, 0, 0, 1, 1, 1,
0.777912, 1.620374, 0.05777659, 1, 0, 0, 1, 1,
0.7788525, 0.3809148, 1.89566, 1, 0, 0, 1, 1,
0.7796488, 0.3889586, 2.590376, 1, 0, 0, 1, 1,
0.7807367, 0.1004072, 1.212818, 1, 0, 0, 1, 1,
0.7842925, -1.268885, -0.9477588, 1, 0, 0, 1, 1,
0.7853454, -0.8549899, 3.567219, 0, 0, 0, 1, 1,
0.7960466, 1.106703, 1.093615, 0, 0, 0, 1, 1,
0.7963767, 0.009872624, 2.617576, 0, 0, 0, 1, 1,
0.7990137, 1.09156, 2.123209, 0, 0, 0, 1, 1,
0.8010038, -0.5686155, 0.9073157, 0, 0, 0, 1, 1,
0.808212, -0.7888269, 0.637484, 0, 0, 0, 1, 1,
0.8086582, 1.2089, 0.4020732, 0, 0, 0, 1, 1,
0.8132457, -1.780835, 4.3943, 1, 1, 1, 1, 1,
0.8141536, -0.3212519, 1.247355, 1, 1, 1, 1, 1,
0.8166029, -1.120693, 4.305187, 1, 1, 1, 1, 1,
0.8306971, -0.5026059, 3.45897, 1, 1, 1, 1, 1,
0.8322861, 0.9678912, 0.13262, 1, 1, 1, 1, 1,
0.8355489, -1.835005, 4.152805, 1, 1, 1, 1, 1,
0.849125, 0.1326929, 1.697421, 1, 1, 1, 1, 1,
0.8582215, 0.03322273, 1.62352, 1, 1, 1, 1, 1,
0.8591191, -0.325424, -0.01819454, 1, 1, 1, 1, 1,
0.8668001, -0.5063441, 1.732185, 1, 1, 1, 1, 1,
0.8675945, -0.3799736, 0.2600966, 1, 1, 1, 1, 1,
0.8739398, -1.168093, 3.212667, 1, 1, 1, 1, 1,
0.878116, -0.4364594, 2.580725, 1, 1, 1, 1, 1,
0.8793679, 0.8679796, -0.4236035, 1, 1, 1, 1, 1,
0.8841946, -0.161944, 0.2513873, 1, 1, 1, 1, 1,
0.8845026, 0.6652358, -0.7936303, 0, 0, 1, 1, 1,
0.893591, -0.8061797, 1.774178, 1, 0, 0, 1, 1,
0.9054047, -1.376994, 2.817547, 1, 0, 0, 1, 1,
0.9054109, 0.2419751, 0.9847337, 1, 0, 0, 1, 1,
0.9060358, -0.2376576, 1.345854, 1, 0, 0, 1, 1,
0.9072072, -0.03436424, 0.6437985, 1, 0, 0, 1, 1,
0.9140699, 0.4615296, 1.534127, 0, 0, 0, 1, 1,
0.9146523, 0.4125061, -0.137826, 0, 0, 0, 1, 1,
0.916627, 0.2741382, 0.3127694, 0, 0, 0, 1, 1,
0.9168838, -0.1615972, 2.18939, 0, 0, 0, 1, 1,
0.9198462, -0.831199, 2.506756, 0, 0, 0, 1, 1,
0.9260787, -0.5443678, 1.37384, 0, 0, 0, 1, 1,
0.9261179, -0.1592694, 2.116131, 0, 0, 0, 1, 1,
0.9266383, 1.034836, 1.455866, 1, 1, 1, 1, 1,
0.928352, 1.143491, 1.753694, 1, 1, 1, 1, 1,
0.9341812, 0.9789757, -0.09639019, 1, 1, 1, 1, 1,
0.9393547, -0.8679363, 3.770754, 1, 1, 1, 1, 1,
0.9426932, -0.2055692, 2.568425, 1, 1, 1, 1, 1,
0.9482214, -0.2198739, 0.2429085, 1, 1, 1, 1, 1,
0.9520388, -0.1379205, 0.8836638, 1, 1, 1, 1, 1,
0.9624642, 0.3719347, 1.381392, 1, 1, 1, 1, 1,
0.97311, -0.5390592, 2.221884, 1, 1, 1, 1, 1,
0.9788779, 0.8540249, -0.5710892, 1, 1, 1, 1, 1,
0.9821381, -0.8036616, 2.746317, 1, 1, 1, 1, 1,
0.9832692, -1.537718, 1.500744, 1, 1, 1, 1, 1,
0.9849779, 1.904709, 0.192597, 1, 1, 1, 1, 1,
0.9850659, -1.406269, 2.127633, 1, 1, 1, 1, 1,
0.9864532, 0.07038277, 2.518676, 1, 1, 1, 1, 1,
0.9993857, 0.6579521, 2.249789, 0, 0, 1, 1, 1,
1.001195, 0.8946637, 1.764979, 1, 0, 0, 1, 1,
1.004262, -0.6505156, 3.33492, 1, 0, 0, 1, 1,
1.00446, 1.935153, 0.3754386, 1, 0, 0, 1, 1,
1.004628, 0.01883791, 0.4656528, 1, 0, 0, 1, 1,
1.004912, 0.5131895, 1.074023, 1, 0, 0, 1, 1,
1.00512, 0.2230596, 0.8436323, 0, 0, 0, 1, 1,
1.008833, -0.02245728, 4.217229, 0, 0, 0, 1, 1,
1.010051, 0.7550839, -0.05543938, 0, 0, 0, 1, 1,
1.011174, -1.824273, -0.5549642, 0, 0, 0, 1, 1,
1.01309, -2.219489, 0.8642132, 0, 0, 0, 1, 1,
1.036098, 0.6055542, -0.6722531, 0, 0, 0, 1, 1,
1.039287, -0.4923074, -1.475958, 0, 0, 0, 1, 1,
1.042562, 1.640143, 1.259909, 1, 1, 1, 1, 1,
1.051564, -2.176518, 3.357306, 1, 1, 1, 1, 1,
1.063185, 0.502578, 2.002692, 1, 1, 1, 1, 1,
1.076847, 0.3501236, 1.370926, 1, 1, 1, 1, 1,
1.078151, -1.372591, 1.431134, 1, 1, 1, 1, 1,
1.079525, 0.5447814, 1.916226, 1, 1, 1, 1, 1,
1.094998, 0.01246705, 1.056682, 1, 1, 1, 1, 1,
1.097963, -0.1860269, 1.042381, 1, 1, 1, 1, 1,
1.100261, 0.1144604, 0.8887906, 1, 1, 1, 1, 1,
1.10118, 2.099937, 1.282289, 1, 1, 1, 1, 1,
1.102834, 0.7932487, -0.6391449, 1, 1, 1, 1, 1,
1.108179, 0.09346173, 1.258201, 1, 1, 1, 1, 1,
1.111669, -1.87073, 2.793918, 1, 1, 1, 1, 1,
1.118747, 1.391605, -0.6732021, 1, 1, 1, 1, 1,
1.135387, 0.6541863, 0.1107221, 1, 1, 1, 1, 1,
1.138622, 0.2697743, -1.139028, 0, 0, 1, 1, 1,
1.139378, -0.5452486, -0.6888122, 1, 0, 0, 1, 1,
1.143368, 1.920352, 2.446402, 1, 0, 0, 1, 1,
1.155651, -0.1575115, 0.8242361, 1, 0, 0, 1, 1,
1.155787, 0.5496591, 0.8488765, 1, 0, 0, 1, 1,
1.156487, 0.9149669, 0.5655935, 1, 0, 0, 1, 1,
1.17161, 0.9247783, 1.565543, 0, 0, 0, 1, 1,
1.172833, 0.4059284, 0.6573597, 0, 0, 0, 1, 1,
1.175066, 1.438251, 1.403994, 0, 0, 0, 1, 1,
1.179607, 1.909587, 1.85452, 0, 0, 0, 1, 1,
1.182786, -0.09508345, 2.010751, 0, 0, 0, 1, 1,
1.187539, 1.899632, 1.585806, 0, 0, 0, 1, 1,
1.188501, -0.6219715, 2.120136, 0, 0, 0, 1, 1,
1.19229, -1.130589, 1.309609, 1, 1, 1, 1, 1,
1.203037, 0.06396611, 0.7315474, 1, 1, 1, 1, 1,
1.204822, 0.78162, 1.816658, 1, 1, 1, 1, 1,
1.20909, -0.28153, 1.868535, 1, 1, 1, 1, 1,
1.2161, 0.0964479, 2.104717, 1, 1, 1, 1, 1,
1.217847, -1.008624, 1.017962, 1, 1, 1, 1, 1,
1.220791, -1.504317, 3.424073, 1, 1, 1, 1, 1,
1.222691, -0.9955309, 2.116939, 1, 1, 1, 1, 1,
1.240267, -0.02221175, 1.974073, 1, 1, 1, 1, 1,
1.241404, -0.5166171, 2.067285, 1, 1, 1, 1, 1,
1.242797, -1.037888, 2.392272, 1, 1, 1, 1, 1,
1.249369, 1.675776, -0.01907725, 1, 1, 1, 1, 1,
1.250189, 0.3331019, 2.11178, 1, 1, 1, 1, 1,
1.282858, -2.863378, 2.921328, 1, 1, 1, 1, 1,
1.287708, -0.3600202, 1.742641, 1, 1, 1, 1, 1,
1.30772, 0.4892278, 1.309673, 0, 0, 1, 1, 1,
1.311751, 1.606713, -0.4024411, 1, 0, 0, 1, 1,
1.32141, -1.053527, 0.7503113, 1, 0, 0, 1, 1,
1.338274, -0.507853, 1.506164, 1, 0, 0, 1, 1,
1.344882, 1.298316, -0.2167856, 1, 0, 0, 1, 1,
1.345912, -2.134793, 2.087125, 1, 0, 0, 1, 1,
1.349025, 0.2412196, 1.969868, 0, 0, 0, 1, 1,
1.351552, -0.3622631, 2.427321, 0, 0, 0, 1, 1,
1.35235, -2.562813, 1.924172, 0, 0, 0, 1, 1,
1.360449, 1.151884, -1.318819, 0, 0, 0, 1, 1,
1.370168, -1.048959, 2.29861, 0, 0, 0, 1, 1,
1.384063, 1.03969, 1.681518, 0, 0, 0, 1, 1,
1.388616, 0.8841754, 1.005352, 0, 0, 0, 1, 1,
1.395243, 1.113378, 0.2617013, 1, 1, 1, 1, 1,
1.401905, -0.9438363, 2.687329, 1, 1, 1, 1, 1,
1.405568, -0.09856369, -0.08442522, 1, 1, 1, 1, 1,
1.406293, -1.636622, 0.8105975, 1, 1, 1, 1, 1,
1.417374, -0.4089761, 1.520895, 1, 1, 1, 1, 1,
1.425364, -1.078319, 1.163231, 1, 1, 1, 1, 1,
1.435536, 1.217119, 0.2660417, 1, 1, 1, 1, 1,
1.438177, -2.147183, 3.909174, 1, 1, 1, 1, 1,
1.442814, -0.9268862, 1.018263, 1, 1, 1, 1, 1,
1.443569, 2.141208, 1.595123, 1, 1, 1, 1, 1,
1.443802, -1.052619, 2.480413, 1, 1, 1, 1, 1,
1.447653, 0.7403462, -0.3226142, 1, 1, 1, 1, 1,
1.453828, 2.171674, 1.301264, 1, 1, 1, 1, 1,
1.463389, -1.166019, 1.597481, 1, 1, 1, 1, 1,
1.466359, -1.232159, 1.320211, 1, 1, 1, 1, 1,
1.467601, 0.3487369, 2.710628, 0, 0, 1, 1, 1,
1.4934, -0.4588825, 2.09543, 1, 0, 0, 1, 1,
1.501256, 0.2432797, 0.652162, 1, 0, 0, 1, 1,
1.502867, 0.5399938, 1.465112, 1, 0, 0, 1, 1,
1.506458, -0.8103094, 3.092299, 1, 0, 0, 1, 1,
1.512058, -0.5710756, 1.772972, 1, 0, 0, 1, 1,
1.519762, -0.5123957, 2.608329, 0, 0, 0, 1, 1,
1.528761, 0.0757976, 1.444971, 0, 0, 0, 1, 1,
1.533615, 0.7736335, 0.02926833, 0, 0, 0, 1, 1,
1.545979, -0.07664009, 0.8802713, 0, 0, 0, 1, 1,
1.554849, 0.1876698, 0.953456, 0, 0, 0, 1, 1,
1.559479, 1.220641, 1.156701, 0, 0, 0, 1, 1,
1.561451, -0.2509032, -0.3764094, 0, 0, 0, 1, 1,
1.568122, -1.868203, 2.848656, 1, 1, 1, 1, 1,
1.569657, 1.961, 0.6346608, 1, 1, 1, 1, 1,
1.589887, -1.828909, 2.084362, 1, 1, 1, 1, 1,
1.599833, 0.1800273, 3.190634, 1, 1, 1, 1, 1,
1.603517, -1.06447, 2.066721, 1, 1, 1, 1, 1,
1.614791, -0.137974, 0.04048787, 1, 1, 1, 1, 1,
1.632452, -0.3171179, 2.431772, 1, 1, 1, 1, 1,
1.635687, 1.893869, -0.8124635, 1, 1, 1, 1, 1,
1.646824, 0.3446911, 0.5315181, 1, 1, 1, 1, 1,
1.657566, 1.114896, 0.1794205, 1, 1, 1, 1, 1,
1.669395, 1.59754, 0.6616789, 1, 1, 1, 1, 1,
1.67311, -0.9880025, -0.23902, 1, 1, 1, 1, 1,
1.683776, 0.1073516, 1.484326, 1, 1, 1, 1, 1,
1.718602, 1.752861, 0.3559247, 1, 1, 1, 1, 1,
1.727293, -1.084794, 1.947182, 1, 1, 1, 1, 1,
1.729564, 2.129457, 0.9818988, 0, 0, 1, 1, 1,
1.744436, -0.08211189, 3.173479, 1, 0, 0, 1, 1,
1.798433, -0.6245339, 1.838683, 1, 0, 0, 1, 1,
1.811605, -0.9173253, 2.766035, 1, 0, 0, 1, 1,
1.82663, -0.6002838, 2.412914, 1, 0, 0, 1, 1,
1.83181, -0.8713261, 0.8922997, 1, 0, 0, 1, 1,
1.855488, -1.707196, 1.341688, 0, 0, 0, 1, 1,
1.871134, 1.886329, 0.8108948, 0, 0, 0, 1, 1,
1.893484, 0.7830206, 0.5839916, 0, 0, 0, 1, 1,
1.918877, -0.138018, 1.038221, 0, 0, 0, 1, 1,
1.926383, -1.321813, 2.435596, 0, 0, 0, 1, 1,
1.931229, 1.179228, 2.233668, 0, 0, 0, 1, 1,
1.935457, -1.686664, 2.857078, 0, 0, 0, 1, 1,
1.939479, 1.56444, 0.6307896, 1, 1, 1, 1, 1,
1.944058, -0.8266942, 2.722975, 1, 1, 1, 1, 1,
1.954942, -1.13494, 2.859561, 1, 1, 1, 1, 1,
1.95511, -1.296428, 1.518112, 1, 1, 1, 1, 1,
1.973254, 0.3851358, 1.991454, 1, 1, 1, 1, 1,
1.991665, 1.346617, -0.8494726, 1, 1, 1, 1, 1,
1.993931, -0.8789184, 2.679573, 1, 1, 1, 1, 1,
1.999632, -0.3565605, 0.2989828, 1, 1, 1, 1, 1,
2.008369, 0.3033864, -0.867801, 1, 1, 1, 1, 1,
2.040204, 0.1058157, 2.96715, 1, 1, 1, 1, 1,
2.064368, -1.365403, 2.16675, 1, 1, 1, 1, 1,
2.095815, 0.692513, 0.5560218, 1, 1, 1, 1, 1,
2.103836, -0.1729283, 1.540944, 1, 1, 1, 1, 1,
2.119565, 1.198582, 1.247182, 1, 1, 1, 1, 1,
2.144394, -0.9664126, 2.432672, 1, 1, 1, 1, 1,
2.156276, -1.327734, 0.7157511, 0, 0, 1, 1, 1,
2.199795, 1.639389, 0.6771606, 1, 0, 0, 1, 1,
2.206514, -1.137538, 1.343385, 1, 0, 0, 1, 1,
2.209718, -0.209427, 0.1565535, 1, 0, 0, 1, 1,
2.210506, -0.5980219, 1.097457, 1, 0, 0, 1, 1,
2.211363, 0.9363477, 1.407758, 1, 0, 0, 1, 1,
2.223722, -0.1183644, 1.938716, 0, 0, 0, 1, 1,
2.26448, 1.134683, 1.445548, 0, 0, 0, 1, 1,
2.267646, 0.5975553, 2.124313, 0, 0, 0, 1, 1,
2.2901, 0.09003942, 1.261261, 0, 0, 0, 1, 1,
2.355843, -1.211776, -0.294501, 0, 0, 0, 1, 1,
2.374993, 0.06914838, 0.7435141, 0, 0, 0, 1, 1,
2.379313, -0.1198215, 2.118447, 0, 0, 0, 1, 1,
2.423325, -0.4154902, 1.489747, 1, 1, 1, 1, 1,
2.511432, 1.167069, 2.974138, 1, 1, 1, 1, 1,
2.537813, 0.1349878, 1.70885, 1, 1, 1, 1, 1,
2.651697, 0.6276422, 1.24185, 1, 1, 1, 1, 1,
2.787823, -1.286296, 0.8604893, 1, 1, 1, 1, 1,
2.811357, -0.5265625, 3.069813, 1, 1, 1, 1, 1,
2.933202, -0.2642285, 3.144657, 1, 1, 1, 1, 1
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
var radius = 9.445753;
var distance = 33.17781;
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
mvMatrix.translate( 0.5603582, -0.03431654, -0.1933377 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17781);
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