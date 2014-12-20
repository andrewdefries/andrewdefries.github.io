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
-3.469144, 0.4411075, -0.990467, 1, 0, 0, 1,
-2.915199, -0.1052599, -0.8828723, 1, 0.007843138, 0, 1,
-2.843922, -0.5756258, -0.6832988, 1, 0.01176471, 0, 1,
-2.812243, -0.5584653, -1.070285, 1, 0.01960784, 0, 1,
-2.724343, -0.6937674, -0.1074999, 1, 0.02352941, 0, 1,
-2.646596, -0.6300091, -0.8762987, 1, 0.03137255, 0, 1,
-2.629429, -0.3292757, -1.927064, 1, 0.03529412, 0, 1,
-2.591084, 1.928837, -0.9793503, 1, 0.04313726, 0, 1,
-2.561406, -2.287051, -2.532438, 1, 0.04705882, 0, 1,
-2.485262, -0.0896517, -0.7696796, 1, 0.05490196, 0, 1,
-2.456174, -0.1756754, -0.7107061, 1, 0.05882353, 0, 1,
-2.442518, 0.3796399, -1.217952, 1, 0.06666667, 0, 1,
-2.404964, -1.328865, -1.780666, 1, 0.07058824, 0, 1,
-2.380221, 1.188285, -1.620025, 1, 0.07843138, 0, 1,
-2.349251, 0.7774697, -0.7181189, 1, 0.08235294, 0, 1,
-2.312406, -1.247943, -2.764517, 1, 0.09019608, 0, 1,
-2.307392, -0.9893476, -0.7685935, 1, 0.09411765, 0, 1,
-2.296711, -0.149669, -0.2124317, 1, 0.1019608, 0, 1,
-2.282724, 0.01508327, -2.535351, 1, 0.1098039, 0, 1,
-2.230856, -0.3937218, -2.358024, 1, 0.1137255, 0, 1,
-2.187892, -0.2066296, -1.352198, 1, 0.1215686, 0, 1,
-2.119782, -1.882364, -1.198436, 1, 0.1254902, 0, 1,
-2.098971, 0.9957619, -1.206385, 1, 0.1333333, 0, 1,
-2.092609, -1.041162, -3.438228, 1, 0.1372549, 0, 1,
-2.081069, 1.227088, -0.9585001, 1, 0.145098, 0, 1,
-2.014868, -0.4466292, -3.139837, 1, 0.1490196, 0, 1,
-2.003702, 0.8085825, -1.015421, 1, 0.1568628, 0, 1,
-1.993421, -0.7804322, -4.056015, 1, 0.1607843, 0, 1,
-1.962419, 0.2332952, -1.781168, 1, 0.1686275, 0, 1,
-1.957159, 0.08195176, -2.194467, 1, 0.172549, 0, 1,
-1.952334, -1.272612, -2.718665, 1, 0.1803922, 0, 1,
-1.946075, 0.8106843, -0.2745265, 1, 0.1843137, 0, 1,
-1.929386, -0.3801425, -3.121528, 1, 0.1921569, 0, 1,
-1.908362, -0.167421, -2.161088, 1, 0.1960784, 0, 1,
-1.902535, 0.9613235, -1.578768, 1, 0.2039216, 0, 1,
-1.888519, 1.372828, 0.392534, 1, 0.2117647, 0, 1,
-1.888165, 0.5220258, -3.226687, 1, 0.2156863, 0, 1,
-1.876984, 0.5852866, -1.996201, 1, 0.2235294, 0, 1,
-1.857317, -2.122228, -2.133087, 1, 0.227451, 0, 1,
-1.840306, 0.1654696, -1.319863, 1, 0.2352941, 0, 1,
-1.826237, 0.1813663, -1.551361, 1, 0.2392157, 0, 1,
-1.803905, -0.6328791, -2.902295, 1, 0.2470588, 0, 1,
-1.801841, -1.126196, -2.194043, 1, 0.2509804, 0, 1,
-1.793193, -0.172163, -3.371209, 1, 0.2588235, 0, 1,
-1.781629, -0.6077043, -2.351962, 1, 0.2627451, 0, 1,
-1.770356, -0.3118077, -2.276341, 1, 0.2705882, 0, 1,
-1.76379, 0.1260334, -1.583282, 1, 0.2745098, 0, 1,
-1.763329, -3.181149, -3.300713, 1, 0.282353, 0, 1,
-1.762162, 0.09053301, -1.842644, 1, 0.2862745, 0, 1,
-1.754086, -0.4097482, -3.324276, 1, 0.2941177, 0, 1,
-1.732374, -0.5437212, -1.753357, 1, 0.3019608, 0, 1,
-1.702703, 0.5074228, 0.2955805, 1, 0.3058824, 0, 1,
-1.690691, -0.3634824, -3.377178, 1, 0.3137255, 0, 1,
-1.68707, -0.2613474, -1.000608, 1, 0.3176471, 0, 1,
-1.678773, -0.6595476, -1.164055, 1, 0.3254902, 0, 1,
-1.678521, -0.6974264, -3.422819, 1, 0.3294118, 0, 1,
-1.674496, -0.377664, -2.664687, 1, 0.3372549, 0, 1,
-1.664587, -1.320263, -2.234026, 1, 0.3411765, 0, 1,
-1.653992, -0.216099, -1.439676, 1, 0.3490196, 0, 1,
-1.652734, 0.618511, -2.736628, 1, 0.3529412, 0, 1,
-1.647537, -0.4343617, -2.939423, 1, 0.3607843, 0, 1,
-1.642623, -0.8252966, -2.461706, 1, 0.3647059, 0, 1,
-1.63254, 0.544331, -2.204064, 1, 0.372549, 0, 1,
-1.625719, -0.09919182, -1.736772, 1, 0.3764706, 0, 1,
-1.618354, -0.0701075, -1.43561, 1, 0.3843137, 0, 1,
-1.618235, 0.6558764, -0.6081694, 1, 0.3882353, 0, 1,
-1.617363, -0.2389849, -1.470516, 1, 0.3960784, 0, 1,
-1.61261, 0.6602584, -1.687011, 1, 0.4039216, 0, 1,
-1.610613, -0.5543478, -1.474682, 1, 0.4078431, 0, 1,
-1.60935, 2.000042, -1.377775, 1, 0.4156863, 0, 1,
-1.608179, -0.2984428, -2.896453, 1, 0.4196078, 0, 1,
-1.602555, 0.09243739, -2.941008, 1, 0.427451, 0, 1,
-1.589873, -0.2627922, -1.643788, 1, 0.4313726, 0, 1,
-1.589437, -0.9261731, -2.574766, 1, 0.4392157, 0, 1,
-1.585832, 0.4533639, -2.516992, 1, 0.4431373, 0, 1,
-1.581736, -0.8649306, -2.758095, 1, 0.4509804, 0, 1,
-1.574424, 0.8087698, 0.8093238, 1, 0.454902, 0, 1,
-1.569357, 1.06345, -3.087461, 1, 0.4627451, 0, 1,
-1.568947, -1.786481, -3.368265, 1, 0.4666667, 0, 1,
-1.566329, -0.1398136, -0.5923396, 1, 0.4745098, 0, 1,
-1.566054, 0.1595086, -3.560844, 1, 0.4784314, 0, 1,
-1.561383, 0.8059653, -2.033181, 1, 0.4862745, 0, 1,
-1.540247, -1.742829, -2.24907, 1, 0.4901961, 0, 1,
-1.534338, 0.2952926, -2.321612, 1, 0.4980392, 0, 1,
-1.522896, -0.3563078, -0.3426978, 1, 0.5058824, 0, 1,
-1.514661, 1.080256, -0.7238749, 1, 0.509804, 0, 1,
-1.504292, 1.050871, -1.157763, 1, 0.5176471, 0, 1,
-1.497985, -0.8778991, -2.013768, 1, 0.5215687, 0, 1,
-1.487204, -0.2421082, -0.7244425, 1, 0.5294118, 0, 1,
-1.478967, 0.5182055, -1.67723, 1, 0.5333334, 0, 1,
-1.46895, 0.9849547, -1.89212, 1, 0.5411765, 0, 1,
-1.461604, -3.055118, -2.350814, 1, 0.5450981, 0, 1,
-1.449905, -1.792599, -3.666309, 1, 0.5529412, 0, 1,
-1.442224, 1.017807, 0.5238894, 1, 0.5568628, 0, 1,
-1.44106, 2.29018, -2.225607, 1, 0.5647059, 0, 1,
-1.411278, 0.8438214, -2.568365, 1, 0.5686275, 0, 1,
-1.40185, -0.1255973, -0.4296314, 1, 0.5764706, 0, 1,
-1.391176, -1.433358, -1.63309, 1, 0.5803922, 0, 1,
-1.390531, -1.673013, -1.51313, 1, 0.5882353, 0, 1,
-1.390284, 1.460045, -1.447031, 1, 0.5921569, 0, 1,
-1.379699, -0.05333912, -1.392987, 1, 0.6, 0, 1,
-1.370515, -0.7282912, -3.022637, 1, 0.6078432, 0, 1,
-1.359938, -0.07929385, 0.139298, 1, 0.6117647, 0, 1,
-1.354981, -0.07002917, -1.652323, 1, 0.6196079, 0, 1,
-1.344794, -1.717165, -3.252725, 1, 0.6235294, 0, 1,
-1.336097, -0.03689935, -1.161955, 1, 0.6313726, 0, 1,
-1.335844, 1.311181, -1.470761, 1, 0.6352941, 0, 1,
-1.329575, 1.683211, -2.210999, 1, 0.6431373, 0, 1,
-1.324748, 1.366447, -0.2954414, 1, 0.6470588, 0, 1,
-1.305325, 0.9436433, -1.293823, 1, 0.654902, 0, 1,
-1.300768, 0.4184377, -1.425989, 1, 0.6588235, 0, 1,
-1.299865, 1.85188, -0.4020299, 1, 0.6666667, 0, 1,
-1.297966, -0.1780087, -1.893513, 1, 0.6705883, 0, 1,
-1.285069, -1.580767, -2.269045, 1, 0.6784314, 0, 1,
-1.277244, 1.943468, -1.778923, 1, 0.682353, 0, 1,
-1.269368, 0.8021331, -0.5745224, 1, 0.6901961, 0, 1,
-1.261973, 1.89967, -0.2495045, 1, 0.6941177, 0, 1,
-1.255698, -0.9312465, -2.959692, 1, 0.7019608, 0, 1,
-1.253088, -0.2797207, -2.348353, 1, 0.7098039, 0, 1,
-1.241533, 0.0936936, -2.434792, 1, 0.7137255, 0, 1,
-1.222101, -1.770151, -2.11122, 1, 0.7215686, 0, 1,
-1.21672, -0.7985126, -1.076042, 1, 0.7254902, 0, 1,
-1.203526, -0.4049056, -1.184155, 1, 0.7333333, 0, 1,
-1.202431, 1.45861, 0.3348204, 1, 0.7372549, 0, 1,
-1.201299, 0.7096453, -0.120373, 1, 0.7450981, 0, 1,
-1.195698, -0.7581837, -3.195462, 1, 0.7490196, 0, 1,
-1.195478, -0.30105, -3.228184, 1, 0.7568628, 0, 1,
-1.186043, 2.127833, 1.557153, 1, 0.7607843, 0, 1,
-1.182548, -2.103097, -4.500682, 1, 0.7686275, 0, 1,
-1.174831, -1.249804, -2.288551, 1, 0.772549, 0, 1,
-1.168699, -0.8603619, -2.244673, 1, 0.7803922, 0, 1,
-1.167503, -0.2044553, -2.205576, 1, 0.7843137, 0, 1,
-1.167103, 0.208218, -1.90796, 1, 0.7921569, 0, 1,
-1.163836, -0.6232436, -2.818601, 1, 0.7960784, 0, 1,
-1.153335, -0.2140715, -1.557343, 1, 0.8039216, 0, 1,
-1.143167, -0.9255402, -3.231012, 1, 0.8117647, 0, 1,
-1.134096, 0.9226635, 0.1341945, 1, 0.8156863, 0, 1,
-1.133712, 0.3695662, -1.142195, 1, 0.8235294, 0, 1,
-1.13103, 0.3503147, 0.2683946, 1, 0.827451, 0, 1,
-1.130011, -2.378714, -2.409559, 1, 0.8352941, 0, 1,
-1.129678, -1.272143, -2.840556, 1, 0.8392157, 0, 1,
-1.127153, 0.7762572, -1.222033, 1, 0.8470588, 0, 1,
-1.11343, 1.0517, -0.1233961, 1, 0.8509804, 0, 1,
-1.111406, 0.4599068, -2.105411, 1, 0.8588235, 0, 1,
-1.108688, 0.5210823, -1.041387, 1, 0.8627451, 0, 1,
-1.106856, 2.376028, 0.3686375, 1, 0.8705882, 0, 1,
-1.104963, 2.656233, -0.549796, 1, 0.8745098, 0, 1,
-1.1042, 1.299409, -0.9930202, 1, 0.8823529, 0, 1,
-1.10171, -0.2916271, -0.4516659, 1, 0.8862745, 0, 1,
-1.099925, 0.08940076, -0.7109579, 1, 0.8941177, 0, 1,
-1.098101, 1.25376, -0.8908873, 1, 0.8980392, 0, 1,
-1.091773, -0.7292917, -1.489239, 1, 0.9058824, 0, 1,
-1.088848, 1.232438, 0.08937844, 1, 0.9137255, 0, 1,
-1.085285, 0.1586213, -2.255221, 1, 0.9176471, 0, 1,
-1.085181, -0.8821407, -3.654885, 1, 0.9254902, 0, 1,
-1.082615, 0.2225745, -2.360598, 1, 0.9294118, 0, 1,
-1.081534, 0.9408324, 0.1005486, 1, 0.9372549, 0, 1,
-1.081132, 0.02646243, -0.9392995, 1, 0.9411765, 0, 1,
-1.072314, 0.2153812, -1.187642, 1, 0.9490196, 0, 1,
-1.067717, 0.0007717276, -0.6552286, 1, 0.9529412, 0, 1,
-1.059945, 1.103123, -0.06005491, 1, 0.9607843, 0, 1,
-1.058114, -0.129113, -0.8445586, 1, 0.9647059, 0, 1,
-1.057423, 0.05995567, -2.664165, 1, 0.972549, 0, 1,
-1.050433, -0.3898715, -1.399291, 1, 0.9764706, 0, 1,
-1.045309, -0.8715633, -2.058441, 1, 0.9843137, 0, 1,
-1.033515, -0.09619613, -2.120997, 1, 0.9882353, 0, 1,
-1.031803, 0.4939063, -0.780791, 1, 0.9960784, 0, 1,
-1.029422, 0.06933132, -2.40018, 0.9960784, 1, 0, 1,
-1.024133, -2.253278, -2.92187, 0.9921569, 1, 0, 1,
-1.015965, -0.990863, -0.635482, 0.9843137, 1, 0, 1,
-1.015723, 0.9646422, -0.1043326, 0.9803922, 1, 0, 1,
-1.010127, -0.6431536, -2.710689, 0.972549, 1, 0, 1,
-1.009793, 0.7907989, 0.81178, 0.9686275, 1, 0, 1,
-1.003157, 0.2568754, 0.1853666, 0.9607843, 1, 0, 1,
-1.000969, 1.087014, -0.2132478, 0.9568627, 1, 0, 1,
-0.9939797, -0.8635949, -2.617627, 0.9490196, 1, 0, 1,
-0.9921981, 0.3270242, -3.680411, 0.945098, 1, 0, 1,
-0.9902708, -1.183048, -1.711822, 0.9372549, 1, 0, 1,
-0.9837647, 2.071148, -2.323746, 0.9333333, 1, 0, 1,
-0.9732168, -0.1359252, -1.90707, 0.9254902, 1, 0, 1,
-0.9694502, -1.435269, -3.893007, 0.9215686, 1, 0, 1,
-0.9691786, -1.540777, -2.065709, 0.9137255, 1, 0, 1,
-0.9670825, -0.9338521, -2.734165, 0.9098039, 1, 0, 1,
-0.9664744, 0.3296556, -1.468289, 0.9019608, 1, 0, 1,
-0.9614391, -0.4204401, -2.640818, 0.8941177, 1, 0, 1,
-0.9591914, 0.5643402, -2.70813, 0.8901961, 1, 0, 1,
-0.9454948, 0.5533592, 0.5817274, 0.8823529, 1, 0, 1,
-0.9427211, -0.1808693, -2.195782, 0.8784314, 1, 0, 1,
-0.942679, -0.1548024, -2.317918, 0.8705882, 1, 0, 1,
-0.9390768, -0.9096715, -2.386312, 0.8666667, 1, 0, 1,
-0.938377, 0.3433187, -1.557994, 0.8588235, 1, 0, 1,
-0.9365033, 0.3781502, -1.972596, 0.854902, 1, 0, 1,
-0.9288084, 0.1850656, -0.006077386, 0.8470588, 1, 0, 1,
-0.9253528, -0.627141, -1.830568, 0.8431373, 1, 0, 1,
-0.9177389, 0.6260567, 0.2165867, 0.8352941, 1, 0, 1,
-0.913084, -1.411389, -4.303871, 0.8313726, 1, 0, 1,
-0.9115236, -1.630909, -1.539545, 0.8235294, 1, 0, 1,
-0.9082742, -0.2550304, 0.03883832, 0.8196079, 1, 0, 1,
-0.9070343, 0.3183061, -2.875654, 0.8117647, 1, 0, 1,
-0.9031383, 1.277173, -1.169898, 0.8078431, 1, 0, 1,
-0.9013105, 1.139451, -0.3044619, 0.8, 1, 0, 1,
-0.8974315, 0.2611884, -1.655676, 0.7921569, 1, 0, 1,
-0.8943928, -0.09869171, -0.7595676, 0.7882353, 1, 0, 1,
-0.8910966, 0.09718721, -3.707317, 0.7803922, 1, 0, 1,
-0.889172, 1.160754, 0.3873397, 0.7764706, 1, 0, 1,
-0.8859575, 0.8812223, -1.721851, 0.7686275, 1, 0, 1,
-0.8829239, -1.15444, -1.602216, 0.7647059, 1, 0, 1,
-0.8769643, -1.15193, -2.373712, 0.7568628, 1, 0, 1,
-0.8675067, -1.05679, -2.64227, 0.7529412, 1, 0, 1,
-0.8618531, 0.8708507, -0.2705066, 0.7450981, 1, 0, 1,
-0.8618122, 1.851257, -0.1757425, 0.7411765, 1, 0, 1,
-0.8610221, 0.6016399, 0.7977947, 0.7333333, 1, 0, 1,
-0.8551186, 0.2470858, -0.8742495, 0.7294118, 1, 0, 1,
-0.8499055, -1.608494, -2.060139, 0.7215686, 1, 0, 1,
-0.8494687, -1.172796, -2.186495, 0.7176471, 1, 0, 1,
-0.8458051, 2.973496, 0.4850663, 0.7098039, 1, 0, 1,
-0.8411124, -1.875475, -3.69415, 0.7058824, 1, 0, 1,
-0.8391006, -1.01722, -2.495461, 0.6980392, 1, 0, 1,
-0.8365121, -1.266265, -2.584056, 0.6901961, 1, 0, 1,
-0.8351163, -0.5516384, -3.461983, 0.6862745, 1, 0, 1,
-0.8290491, -2.364376, -3.336027, 0.6784314, 1, 0, 1,
-0.8212662, 0.6519411, 0.07767344, 0.6745098, 1, 0, 1,
-0.8202544, -0.5938822, -3.546513, 0.6666667, 1, 0, 1,
-0.818127, -0.0550979, 0.3652723, 0.6627451, 1, 0, 1,
-0.8161618, 1.812367, -1.3135, 0.654902, 1, 0, 1,
-0.806949, -0.6047731, -2.696663, 0.6509804, 1, 0, 1,
-0.8061185, 1.365465, -1.032591, 0.6431373, 1, 0, 1,
-0.8012912, -1.387967, -1.009059, 0.6392157, 1, 0, 1,
-0.7997044, -0.3635188, -1.355191, 0.6313726, 1, 0, 1,
-0.7951168, -1.984182, -3.789402, 0.627451, 1, 0, 1,
-0.7898072, -1.280681, -0.2827835, 0.6196079, 1, 0, 1,
-0.76694, 0.05896276, -3.242889, 0.6156863, 1, 0, 1,
-0.7635828, 0.2704617, 1.304847, 0.6078432, 1, 0, 1,
-0.7617849, 1.487982, -0.3436781, 0.6039216, 1, 0, 1,
-0.7572489, -0.6252497, -1.17246, 0.5960785, 1, 0, 1,
-0.752398, -2.114361, -3.138404, 0.5882353, 1, 0, 1,
-0.7521893, -0.2442578, -3.911433, 0.5843138, 1, 0, 1,
-0.7493948, -0.4196317, -3.584656, 0.5764706, 1, 0, 1,
-0.7383901, 0.7174315, -2.518776, 0.572549, 1, 0, 1,
-0.7381069, 0.3357498, -0.7972593, 0.5647059, 1, 0, 1,
-0.7367882, 0.07766265, -2.391299, 0.5607843, 1, 0, 1,
-0.7353687, -1.552916, -4.319785, 0.5529412, 1, 0, 1,
-0.7346835, 0.1497815, -1.898989, 0.5490196, 1, 0, 1,
-0.7343913, -0.1858965, 0.5749654, 0.5411765, 1, 0, 1,
-0.7288932, -1.840286, -2.410888, 0.5372549, 1, 0, 1,
-0.727829, 0.5510713, 0.3571109, 0.5294118, 1, 0, 1,
-0.7204229, 0.2946484, -0.6000031, 0.5254902, 1, 0, 1,
-0.7162824, -0.7473141, -2.871702, 0.5176471, 1, 0, 1,
-0.71589, -1.170326, -3.751371, 0.5137255, 1, 0, 1,
-0.7152054, 0.4709304, -2.170668, 0.5058824, 1, 0, 1,
-0.7134635, 0.8150393, -0.09653709, 0.5019608, 1, 0, 1,
-0.7113197, -2.560445, -3.96175, 0.4941176, 1, 0, 1,
-0.7084763, 2.210951, 0.4428851, 0.4862745, 1, 0, 1,
-0.7079261, 0.0376049, -2.102259, 0.4823529, 1, 0, 1,
-0.7058001, 0.5184166, -2.110099, 0.4745098, 1, 0, 1,
-0.7055103, -0.3336904, -2.153451, 0.4705882, 1, 0, 1,
-0.6963607, -0.1169407, -1.839835, 0.4627451, 1, 0, 1,
-0.6961355, 0.4470849, 0.583957, 0.4588235, 1, 0, 1,
-0.6895738, 0.1943244, -1.725184, 0.4509804, 1, 0, 1,
-0.6882097, -0.9409229, -0.8815653, 0.4470588, 1, 0, 1,
-0.6866924, -1.759923, -2.87579, 0.4392157, 1, 0, 1,
-0.6838452, 0.568624, 0.9350885, 0.4352941, 1, 0, 1,
-0.6818572, 0.8030474, -0.339327, 0.427451, 1, 0, 1,
-0.6814976, -0.4122629, -1.429579, 0.4235294, 1, 0, 1,
-0.6784666, 0.5681598, 0.6076912, 0.4156863, 1, 0, 1,
-0.6748079, 1.704077, -1.195581, 0.4117647, 1, 0, 1,
-0.674256, -0.3654202, -1.909392, 0.4039216, 1, 0, 1,
-0.6722165, -0.5120759, -1.785226, 0.3960784, 1, 0, 1,
-0.670728, 0.585418, -1.244474, 0.3921569, 1, 0, 1,
-0.6705876, -0.02178306, -1.008651, 0.3843137, 1, 0, 1,
-0.6673066, -1.473365, -2.153471, 0.3803922, 1, 0, 1,
-0.6649035, 0.9368306, -2.564424, 0.372549, 1, 0, 1,
-0.6646316, 1.212627, -0.6181704, 0.3686275, 1, 0, 1,
-0.6613392, -0.04613899, -0.3456786, 0.3607843, 1, 0, 1,
-0.6528214, -2.299877, -1.828752, 0.3568628, 1, 0, 1,
-0.6439202, -0.3171374, -1.596471, 0.3490196, 1, 0, 1,
-0.6391367, 0.4422343, -2.713317, 0.345098, 1, 0, 1,
-0.634087, -2.051934, -2.888042, 0.3372549, 1, 0, 1,
-0.6323913, -0.2299707, -4.774493, 0.3333333, 1, 0, 1,
-0.6323174, -0.5749567, -3.191778, 0.3254902, 1, 0, 1,
-0.6261395, 0.8383018, -0.1813813, 0.3215686, 1, 0, 1,
-0.6243273, 1.166524, -0.3131235, 0.3137255, 1, 0, 1,
-0.6146834, -0.6917496, -2.821576, 0.3098039, 1, 0, 1,
-0.608246, -1.407642, -1.826572, 0.3019608, 1, 0, 1,
-0.6053233, 0.7121524, -2.662948, 0.2941177, 1, 0, 1,
-0.5961837, -1.33782, -1.671587, 0.2901961, 1, 0, 1,
-0.5932658, 0.5551447, 0.6182362, 0.282353, 1, 0, 1,
-0.5918592, 0.2844275, -1.761386, 0.2784314, 1, 0, 1,
-0.5890665, -0.9309501, -4.046825, 0.2705882, 1, 0, 1,
-0.5862898, -0.4137114, -2.6993, 0.2666667, 1, 0, 1,
-0.5825169, 1.441936, -1.170943, 0.2588235, 1, 0, 1,
-0.5767792, 0.1205267, -2.81323, 0.254902, 1, 0, 1,
-0.5746575, -0.4241596, -2.11492, 0.2470588, 1, 0, 1,
-0.5733196, -0.07014275, -1.429851, 0.2431373, 1, 0, 1,
-0.5674753, -1.671715, -0.8220623, 0.2352941, 1, 0, 1,
-0.5575279, 0.3124039, -1.14145, 0.2313726, 1, 0, 1,
-0.549951, 0.5431098, -1.115835, 0.2235294, 1, 0, 1,
-0.5497542, 0.2588187, 0.3272608, 0.2196078, 1, 0, 1,
-0.548389, -0.7003009, -2.546649, 0.2117647, 1, 0, 1,
-0.5478523, -0.06442522, -0.5703446, 0.2078431, 1, 0, 1,
-0.5403679, 0.2661929, -1.450191, 0.2, 1, 0, 1,
-0.5402144, 1.454215, 0.3155448, 0.1921569, 1, 0, 1,
-0.5384201, 0.2521479, 1.50413, 0.1882353, 1, 0, 1,
-0.5366684, 0.232677, -3.582832, 0.1803922, 1, 0, 1,
-0.5338846, -0.2115519, -1.560112, 0.1764706, 1, 0, 1,
-0.5305266, 0.7911893, -1.430388, 0.1686275, 1, 0, 1,
-0.5258119, -0.8063868, -2.896683, 0.1647059, 1, 0, 1,
-0.5216979, 0.829644, -0.6152575, 0.1568628, 1, 0, 1,
-0.5205727, -0.3534211, -1.882907, 0.1529412, 1, 0, 1,
-0.517943, 0.7387961, -1.329304, 0.145098, 1, 0, 1,
-0.5175126, -0.8079833, -0.4783984, 0.1411765, 1, 0, 1,
-0.5159611, 0.530274, 1.239669, 0.1333333, 1, 0, 1,
-0.5150012, -0.1451667, -1.829597, 0.1294118, 1, 0, 1,
-0.5135069, 1.566482, -0.4579853, 0.1215686, 1, 0, 1,
-0.5071989, 0.8154327, 1.654858, 0.1176471, 1, 0, 1,
-0.4991669, 0.6948013, -2.611419, 0.1098039, 1, 0, 1,
-0.4936157, 1.351614, -0.9825547, 0.1058824, 1, 0, 1,
-0.4898536, 0.2588793, -0.1186684, 0.09803922, 1, 0, 1,
-0.4896476, 0.6984735, 0.05769805, 0.09019608, 1, 0, 1,
-0.4877628, -0.8177398, -2.999432, 0.08627451, 1, 0, 1,
-0.4866529, 1.214313, 0.7754831, 0.07843138, 1, 0, 1,
-0.4865206, 0.5687239, -1.069553, 0.07450981, 1, 0, 1,
-0.4861267, 0.2532319, -0.7686553, 0.06666667, 1, 0, 1,
-0.4861152, -0.3565764, -1.898019, 0.0627451, 1, 0, 1,
-0.4852881, -0.4389825, -2.30031, 0.05490196, 1, 0, 1,
-0.4814851, 0.6814161, -1.43397, 0.05098039, 1, 0, 1,
-0.4786999, -1.701401, -3.303147, 0.04313726, 1, 0, 1,
-0.4774461, -1.196311, -2.102531, 0.03921569, 1, 0, 1,
-0.474403, 0.1941418, -1.905667, 0.03137255, 1, 0, 1,
-0.4743597, -1.338615, -3.801855, 0.02745098, 1, 0, 1,
-0.4739728, -0.6976188, -0.9114834, 0.01960784, 1, 0, 1,
-0.4732113, -1.504487, -2.863643, 0.01568628, 1, 0, 1,
-0.4700931, 0.3412327, -1.281357, 0.007843138, 1, 0, 1,
-0.4697004, -0.7991319, -3.411572, 0.003921569, 1, 0, 1,
-0.468686, -0.7051871, -2.391147, 0, 1, 0.003921569, 1,
-0.4677664, -0.7599759, -1.943323, 0, 1, 0.01176471, 1,
-0.4661303, -1.095676, -1.695545, 0, 1, 0.01568628, 1,
-0.4651169, 0.274494, -1.676657, 0, 1, 0.02352941, 1,
-0.4620367, 0.4345695, -0.9638867, 0, 1, 0.02745098, 1,
-0.4611036, 0.01184707, -0.9136564, 0, 1, 0.03529412, 1,
-0.4543308, 0.3046166, -0.671535, 0, 1, 0.03921569, 1,
-0.4536005, -0.6894083, -0.8413371, 0, 1, 0.04705882, 1,
-0.4500006, 0.03509722, -2.286406, 0, 1, 0.05098039, 1,
-0.4453467, 0.492683, -0.3098181, 0, 1, 0.05882353, 1,
-0.4375176, 0.05676248, -1.955549, 0, 1, 0.0627451, 1,
-0.4351921, -1.962674, -3.948603, 0, 1, 0.07058824, 1,
-0.4260054, -0.1241098, -0.9979722, 0, 1, 0.07450981, 1,
-0.4228553, -0.02495924, -1.625456, 0, 1, 0.08235294, 1,
-0.421511, 0.4277736, -2.735002, 0, 1, 0.08627451, 1,
-0.4193779, 0.8857055, -1.992616, 0, 1, 0.09411765, 1,
-0.4161879, 0.579433, -0.5168712, 0, 1, 0.1019608, 1,
-0.4145293, -0.8645369, -1.701474, 0, 1, 0.1058824, 1,
-0.4141275, 1.360704, -0.6555767, 0, 1, 0.1137255, 1,
-0.4122112, 0.411132, -0.9007356, 0, 1, 0.1176471, 1,
-0.4100208, -0.003792836, -0.6544101, 0, 1, 0.1254902, 1,
-0.4070835, 0.003881096, -0.6214108, 0, 1, 0.1294118, 1,
-0.4009619, -0.4419684, -2.008788, 0, 1, 0.1372549, 1,
-0.4008699, -1.32105, -1.435717, 0, 1, 0.1411765, 1,
-0.3998032, 0.7572282, -2.601595, 0, 1, 0.1490196, 1,
-0.399146, -0.153734, -1.705042, 0, 1, 0.1529412, 1,
-0.3953032, -0.3684003, -3.685718, 0, 1, 0.1607843, 1,
-0.3943747, -0.5714425, -2.267814, 0, 1, 0.1647059, 1,
-0.394125, 0.3855196, -0.7189369, 0, 1, 0.172549, 1,
-0.3912523, -0.5024111, -4.046134, 0, 1, 0.1764706, 1,
-0.3903961, 1.441632, 0.1107306, 0, 1, 0.1843137, 1,
-0.3898518, -0.1321662, -1.795075, 0, 1, 0.1882353, 1,
-0.3891101, -0.6302845, -2.059687, 0, 1, 0.1960784, 1,
-0.3871082, -0.1007944, -1.222478, 0, 1, 0.2039216, 1,
-0.3806961, -1.622386, -5.162935, 0, 1, 0.2078431, 1,
-0.3701256, 1.220702, 0.2546557, 0, 1, 0.2156863, 1,
-0.3629684, -0.2645549, -2.295967, 0, 1, 0.2196078, 1,
-0.3623406, -0.1863587, -1.874952, 0, 1, 0.227451, 1,
-0.3611354, 0.7208889, 0.4471, 0, 1, 0.2313726, 1,
-0.3567078, -1.140783, -2.666906, 0, 1, 0.2392157, 1,
-0.3552748, 0.3234617, 0.5767332, 0, 1, 0.2431373, 1,
-0.3494576, 0.2465486, -0.7300283, 0, 1, 0.2509804, 1,
-0.3482162, -1.346909, -1.920586, 0, 1, 0.254902, 1,
-0.346227, -1.407265, -2.853414, 0, 1, 0.2627451, 1,
-0.3407516, 0.4178786, 0.06239728, 0, 1, 0.2666667, 1,
-0.3376167, -1.127681, -3.544169, 0, 1, 0.2745098, 1,
-0.3375978, 1.076411, 0.4222852, 0, 1, 0.2784314, 1,
-0.3368914, -0.3641602, -2.960597, 0, 1, 0.2862745, 1,
-0.3352911, -0.9962764, -0.3694451, 0, 1, 0.2901961, 1,
-0.3318059, 0.3898282, -1.381487, 0, 1, 0.2980392, 1,
-0.3291221, -0.2265159, -3.182087, 0, 1, 0.3058824, 1,
-0.325363, -2.87047, -3.052589, 0, 1, 0.3098039, 1,
-0.321093, -1.240938, -2.110604, 0, 1, 0.3176471, 1,
-0.3137733, 0.6540133, 0.9951035, 0, 1, 0.3215686, 1,
-0.3070695, 1.452807, -0.2880417, 0, 1, 0.3294118, 1,
-0.3067544, 0.7198788, -1.136678, 0, 1, 0.3333333, 1,
-0.3065174, -0.9880511, -2.005906, 0, 1, 0.3411765, 1,
-0.3050675, -0.83917, -3.190158, 0, 1, 0.345098, 1,
-0.2969743, -0.7911058, -3.216771, 0, 1, 0.3529412, 1,
-0.2736052, -0.3792338, -3.257599, 0, 1, 0.3568628, 1,
-0.2727812, 0.4448794, -1.306244, 0, 1, 0.3647059, 1,
-0.2715587, 0.107799, -2.676422, 0, 1, 0.3686275, 1,
-0.2707551, -0.1054012, -1.263688, 0, 1, 0.3764706, 1,
-0.2657955, -1.65834, -2.224955, 0, 1, 0.3803922, 1,
-0.2657002, -2.993288, -4.318414, 0, 1, 0.3882353, 1,
-0.263707, -1.666128, -1.930072, 0, 1, 0.3921569, 1,
-0.2613599, -0.5021005, -4.557512, 0, 1, 0.4, 1,
-0.2596819, 0.5111376, -0.1087744, 0, 1, 0.4078431, 1,
-0.2593343, 0.4724063, -1.054738, 0, 1, 0.4117647, 1,
-0.258344, 0.5047379, -1.696426, 0, 1, 0.4196078, 1,
-0.2576126, -0.6157256, -1.047972, 0, 1, 0.4235294, 1,
-0.2569259, 0.8333781, 0.1675695, 0, 1, 0.4313726, 1,
-0.2472634, -0.1519426, -2.304936, 0, 1, 0.4352941, 1,
-0.2387905, -0.3180048, -4.428987, 0, 1, 0.4431373, 1,
-0.2380627, -0.3058076, -3.419145, 0, 1, 0.4470588, 1,
-0.2324937, -1.086209, -2.684001, 0, 1, 0.454902, 1,
-0.2322444, -1.198312, -4.746548, 0, 1, 0.4588235, 1,
-0.2280387, 0.4385985, -0.5516807, 0, 1, 0.4666667, 1,
-0.2254591, 0.0409144, -1.550437, 0, 1, 0.4705882, 1,
-0.2250082, -0.3546438, -3.007273, 0, 1, 0.4784314, 1,
-0.2240287, 1.223938, 1.367646, 0, 1, 0.4823529, 1,
-0.2209024, 0.9148887, 0.1504112, 0, 1, 0.4901961, 1,
-0.220019, -0.2323957, -2.55437, 0, 1, 0.4941176, 1,
-0.2154101, 0.1645133, -0.2662697, 0, 1, 0.5019608, 1,
-0.2150994, -1.512674, -3.491578, 0, 1, 0.509804, 1,
-0.2134334, 0.04931142, -1.930934, 0, 1, 0.5137255, 1,
-0.2134117, -1.144921, -4.17953, 0, 1, 0.5215687, 1,
-0.2049446, 0.5480326, -0.7482933, 0, 1, 0.5254902, 1,
-0.2040984, -0.01282505, 0.1997326, 0, 1, 0.5333334, 1,
-0.1997289, -1.215183, -3.555696, 0, 1, 0.5372549, 1,
-0.1932093, -0.9564339, -2.194737, 0, 1, 0.5450981, 1,
-0.1931512, 0.8194965, 1.52351, 0, 1, 0.5490196, 1,
-0.191013, -1.120437, -2.486698, 0, 1, 0.5568628, 1,
-0.188006, 0.773847, 0.5113686, 0, 1, 0.5607843, 1,
-0.1867368, -0.2485329, -2.010924, 0, 1, 0.5686275, 1,
-0.1798389, 0.04674471, -1.137004, 0, 1, 0.572549, 1,
-0.1794349, -0.7902212, -3.034463, 0, 1, 0.5803922, 1,
-0.1766306, 0.9141573, -0.1154891, 0, 1, 0.5843138, 1,
-0.1763914, -0.1290439, -1.968657, 0, 1, 0.5921569, 1,
-0.1723287, -1.461197, -3.774916, 0, 1, 0.5960785, 1,
-0.1721848, -0.1814801, -2.541975, 0, 1, 0.6039216, 1,
-0.1713113, -0.7280803, -3.911886, 0, 1, 0.6117647, 1,
-0.1664571, 0.4670614, -0.8288229, 0, 1, 0.6156863, 1,
-0.1658397, -0.8903907, -2.797063, 0, 1, 0.6235294, 1,
-0.1648788, -0.9252812, -3.407522, 0, 1, 0.627451, 1,
-0.1643603, -0.7283579, -3.257879, 0, 1, 0.6352941, 1,
-0.1633394, 0.7475286, 0.358295, 0, 1, 0.6392157, 1,
-0.1592523, -0.1903607, -0.7681079, 0, 1, 0.6470588, 1,
-0.1557535, 0.6222034, 0.432236, 0, 1, 0.6509804, 1,
-0.1514448, 1.561269, 1.097635, 0, 1, 0.6588235, 1,
-0.1512123, 0.09828001, -2.773766, 0, 1, 0.6627451, 1,
-0.1430878, 0.7559155, 0.451563, 0, 1, 0.6705883, 1,
-0.1417425, -0.1005566, -1.935776, 0, 1, 0.6745098, 1,
-0.1413737, -0.7240316, -1.855271, 0, 1, 0.682353, 1,
-0.1311721, 1.117498, 0.7953596, 0, 1, 0.6862745, 1,
-0.1286922, 0.9956322, 0.7317968, 0, 1, 0.6941177, 1,
-0.1282951, 0.3748812, -0.3256018, 0, 1, 0.7019608, 1,
-0.1278925, 0.3155929, -1.416002, 0, 1, 0.7058824, 1,
-0.1203583, 0.8425231, -0.504391, 0, 1, 0.7137255, 1,
-0.1189695, -0.4868922, -3.355059, 0, 1, 0.7176471, 1,
-0.1121028, 0.5109001, -0.3245334, 0, 1, 0.7254902, 1,
-0.1113853, 1.632914, 0.1124308, 0, 1, 0.7294118, 1,
-0.1102089, 1.017641, 0.9642186, 0, 1, 0.7372549, 1,
-0.109037, 0.7831843, -0.07470561, 0, 1, 0.7411765, 1,
-0.1089213, -0.166157, -5.356915, 0, 1, 0.7490196, 1,
-0.1061742, 0.8590683, -0.5582687, 0, 1, 0.7529412, 1,
-0.1028817, -0.06995878, -3.152777, 0, 1, 0.7607843, 1,
-0.1027743, 0.06216341, -2.412372, 0, 1, 0.7647059, 1,
-0.09741034, 0.5743389, -0.6170071, 0, 1, 0.772549, 1,
-0.093987, -0.248116, -1.923727, 0, 1, 0.7764706, 1,
-0.09231243, 1.003193, -2.318194, 0, 1, 0.7843137, 1,
-0.0889764, 0.07100841, -1.847496, 0, 1, 0.7882353, 1,
-0.08890605, -0.3465539, -2.759615, 0, 1, 0.7960784, 1,
-0.07510652, -2.076373, -3.635499, 0, 1, 0.8039216, 1,
-0.07377546, -0.2074019, -4.134721, 0, 1, 0.8078431, 1,
-0.07371078, -1.054039, -1.606843, 0, 1, 0.8156863, 1,
-0.07171164, 0.2101494, -1.504703, 0, 1, 0.8196079, 1,
-0.06997047, -0.296187, -3.969146, 0, 1, 0.827451, 1,
-0.06753913, -0.1362954, -3.280993, 0, 1, 0.8313726, 1,
-0.06159092, 0.05013273, -2.331432, 0, 1, 0.8392157, 1,
-0.05660518, 0.2356266, 0.4709541, 0, 1, 0.8431373, 1,
-0.05633118, 0.9400535, 0.2842517, 0, 1, 0.8509804, 1,
-0.05468329, 0.08385912, 0.1303044, 0, 1, 0.854902, 1,
-0.04930629, 0.6522292, 0.05964935, 0, 1, 0.8627451, 1,
-0.042804, -0.5149946, -3.4029, 0, 1, 0.8666667, 1,
-0.04243789, 0.4746302, 1.346001, 0, 1, 0.8745098, 1,
-0.04152552, 0.3022945, 0.0544232, 0, 1, 0.8784314, 1,
-0.03729076, 0.222427, 0.3252536, 0, 1, 0.8862745, 1,
-0.03623893, 0.07301247, -1.303798, 0, 1, 0.8901961, 1,
-0.03158751, -0.2222306, -2.827796, 0, 1, 0.8980392, 1,
-0.0282497, 0.09367041, -0.5614856, 0, 1, 0.9058824, 1,
-0.02231035, -1.965115, -2.410234, 0, 1, 0.9098039, 1,
-0.02196397, -0.2105649, -1.854749, 0, 1, 0.9176471, 1,
-0.02137868, 0.3249184, -0.4041609, 0, 1, 0.9215686, 1,
-0.01871199, -0.5671934, -2.551376, 0, 1, 0.9294118, 1,
-0.01514551, 1.13261, -0.1559871, 0, 1, 0.9333333, 1,
-0.0128889, -0.5231776, -3.723163, 0, 1, 0.9411765, 1,
-0.01001606, 0.8789188, 0.5140933, 0, 1, 0.945098, 1,
-0.005524895, -0.01488561, -2.745093, 0, 1, 0.9529412, 1,
-0.002909632, -0.6299803, -3.883379, 0, 1, 0.9568627, 1,
-0.002655401, -0.2815129, -2.807858, 0, 1, 0.9647059, 1,
-0.0002880486, 0.05177709, 2.285554, 0, 1, 0.9686275, 1,
-5.983201e-05, 0.6669443, -1.081851, 0, 1, 0.9764706, 1,
0.001564818, 0.4853707, -1.332338, 0, 1, 0.9803922, 1,
0.002661783, -0.09635988, 3.592489, 0, 1, 0.9882353, 1,
0.003035264, 0.7307855, 0.2088957, 0, 1, 0.9921569, 1,
0.00440989, 0.9808057, -0.3733709, 0, 1, 1, 1,
0.005134884, -0.03945545, 3.707912, 0, 0.9921569, 1, 1,
0.006028483, -0.4570879, 2.723541, 0, 0.9882353, 1, 1,
0.006088586, -0.6346693, 1.379819, 0, 0.9803922, 1, 1,
0.008805523, 0.16608, -0.3605605, 0, 0.9764706, 1, 1,
0.01396062, 0.8494695, -1.230565, 0, 0.9686275, 1, 1,
0.01481127, 0.3303031, -1.280839, 0, 0.9647059, 1, 1,
0.01867506, -0.4512694, 2.451385, 0, 0.9568627, 1, 1,
0.02095776, 1.016386, 0.8300835, 0, 0.9529412, 1, 1,
0.02279786, -0.2318878, 2.120043, 0, 0.945098, 1, 1,
0.02455514, 1.385997, -0.1402539, 0, 0.9411765, 1, 1,
0.03219999, -0.2770803, 1.74707, 0, 0.9333333, 1, 1,
0.03419879, 2.462348, 0.8784433, 0, 0.9294118, 1, 1,
0.03582309, 1.13695, 0.5342059, 0, 0.9215686, 1, 1,
0.03696291, -1.632401, 2.556104, 0, 0.9176471, 1, 1,
0.03980919, 0.3764392, -0.6436539, 0, 0.9098039, 1, 1,
0.04029875, -0.09067491, 2.808547, 0, 0.9058824, 1, 1,
0.04063648, 0.1243487, 1.67294, 0, 0.8980392, 1, 1,
0.04064495, 0.5783098, 1.210941, 0, 0.8901961, 1, 1,
0.04070929, -1.359181, 4.141161, 0, 0.8862745, 1, 1,
0.04152443, 0.7349212, 0.9315547, 0, 0.8784314, 1, 1,
0.04552626, 0.6786535, 1.898441, 0, 0.8745098, 1, 1,
0.04676871, 2.868361, 0.4788614, 0, 0.8666667, 1, 1,
0.04786799, 0.3975511, 0.4626212, 0, 0.8627451, 1, 1,
0.0500891, -0.3958681, 4.79934, 0, 0.854902, 1, 1,
0.05057669, 0.7829459, 2.131465, 0, 0.8509804, 1, 1,
0.06371448, -0.01783672, 3.108226, 0, 0.8431373, 1, 1,
0.06470307, 0.4549706, -0.7399234, 0, 0.8392157, 1, 1,
0.06562337, 0.3449997, -1.385158, 0, 0.8313726, 1, 1,
0.06751868, 1.908411, 0.3319902, 0, 0.827451, 1, 1,
0.07372506, -1.215678, 3.862825, 0, 0.8196079, 1, 1,
0.07433937, 1.19763, -1.502001, 0, 0.8156863, 1, 1,
0.07524369, 0.4172989, -0.1535226, 0, 0.8078431, 1, 1,
0.07748526, 0.2425935, 0.7409217, 0, 0.8039216, 1, 1,
0.07784079, -1.35402, 2.059138, 0, 0.7960784, 1, 1,
0.08025318, 0.6530405, 1.018976, 0, 0.7882353, 1, 1,
0.08286154, -0.2604936, 3.109734, 0, 0.7843137, 1, 1,
0.09952534, 0.1980999, -0.1907486, 0, 0.7764706, 1, 1,
0.1025163, -0.4562726, 1.902333, 0, 0.772549, 1, 1,
0.1027716, -0.2041445, 1.608554, 0, 0.7647059, 1, 1,
0.1032001, -0.5648911, 2.197721, 0, 0.7607843, 1, 1,
0.1061145, -0.03272687, 2.153592, 0, 0.7529412, 1, 1,
0.1075678, 1.168391, -0.368092, 0, 0.7490196, 1, 1,
0.1112131, 2.020122, 1.147433, 0, 0.7411765, 1, 1,
0.1120818, -0.1340706, 1.520498, 0, 0.7372549, 1, 1,
0.1124955, 0.8746827, -0.1135716, 0, 0.7294118, 1, 1,
0.1160372, -2.345837, 2.31637, 0, 0.7254902, 1, 1,
0.1177474, 0.38373, -1.534777, 0, 0.7176471, 1, 1,
0.1185667, -0.3927203, 5.051503, 0, 0.7137255, 1, 1,
0.1207155, -0.03477976, 0.3145316, 0, 0.7058824, 1, 1,
0.121528, 0.5525722, 0.3154041, 0, 0.6980392, 1, 1,
0.1220844, 0.7516001, -0.7837248, 0, 0.6941177, 1, 1,
0.1221825, 1.098947, 1.308864, 0, 0.6862745, 1, 1,
0.1272419, -1.358995, 2.343117, 0, 0.682353, 1, 1,
0.1303635, -0.6241856, 1.805305, 0, 0.6745098, 1, 1,
0.1344203, -1.313418, 3.226885, 0, 0.6705883, 1, 1,
0.1344328, 1.451551, -0.5750395, 0, 0.6627451, 1, 1,
0.1381264, -1.560221, 3.133513, 0, 0.6588235, 1, 1,
0.1396599, 0.8230041, 1.006541, 0, 0.6509804, 1, 1,
0.1492348, -1.013802, 1.46491, 0, 0.6470588, 1, 1,
0.1514343, -1.496472, 5.720785, 0, 0.6392157, 1, 1,
0.1525565, 1.540253, 0.5165028, 0, 0.6352941, 1, 1,
0.1546162, 0.5627937, 0.1960193, 0, 0.627451, 1, 1,
0.1558473, 0.1426118, 1.972932, 0, 0.6235294, 1, 1,
0.1595503, 0.5598727, -0.3045702, 0, 0.6156863, 1, 1,
0.1619365, 1.099021, 0.1074162, 0, 0.6117647, 1, 1,
0.1646065, 0.4307638, 2.071019, 0, 0.6039216, 1, 1,
0.1650402, 0.2373073, -0.7078032, 0, 0.5960785, 1, 1,
0.1686712, 1.358139, -0.7815384, 0, 0.5921569, 1, 1,
0.1709634, -1.474344, 3.400765, 0, 0.5843138, 1, 1,
0.1739833, 0.04001626, 1.572039, 0, 0.5803922, 1, 1,
0.1742858, 0.628009, -1.233486, 0, 0.572549, 1, 1,
0.1751137, -0.9068938, 2.702043, 0, 0.5686275, 1, 1,
0.1752885, 0.3938121, 0.02895803, 0, 0.5607843, 1, 1,
0.1756274, 1.286829, -0.6246542, 0, 0.5568628, 1, 1,
0.1757784, 0.6519318, -0.6667253, 0, 0.5490196, 1, 1,
0.178005, -0.2034816, 3.274027, 0, 0.5450981, 1, 1,
0.1787863, -0.8335813, 2.362179, 0, 0.5372549, 1, 1,
0.1791242, -1.381474, 3.173445, 0, 0.5333334, 1, 1,
0.1795938, 1.305246, 1.017043, 0, 0.5254902, 1, 1,
0.1801863, -0.566153, 2.93097, 0, 0.5215687, 1, 1,
0.1813986, 0.2503451, 0.1519797, 0, 0.5137255, 1, 1,
0.1862, 0.9352058, 1.606576, 0, 0.509804, 1, 1,
0.1866835, -1.587124, 2.438399, 0, 0.5019608, 1, 1,
0.1903702, -0.3461042, 1.771267, 0, 0.4941176, 1, 1,
0.1906343, -0.08553175, 1.490556, 0, 0.4901961, 1, 1,
0.1909812, 0.5940977, 0.5342243, 0, 0.4823529, 1, 1,
0.1934039, 0.6759847, 0.3852778, 0, 0.4784314, 1, 1,
0.1944261, -0.4877838, 2.543857, 0, 0.4705882, 1, 1,
0.1974993, -0.5708539, 2.728083, 0, 0.4666667, 1, 1,
0.1981371, -0.3392899, 2.650045, 0, 0.4588235, 1, 1,
0.1982719, 0.5897095, 0.5352854, 0, 0.454902, 1, 1,
0.198907, 2.495722, 0.1842143, 0, 0.4470588, 1, 1,
0.2019915, 0.1298885, 1.758317, 0, 0.4431373, 1, 1,
0.2086973, 0.5383558, 0.1556797, 0, 0.4352941, 1, 1,
0.208793, -0.2031378, 2.777554, 0, 0.4313726, 1, 1,
0.2121843, -0.3481968, 2.643497, 0, 0.4235294, 1, 1,
0.213984, -1.23209, 2.343884, 0, 0.4196078, 1, 1,
0.222831, 1.44788, 1.832502, 0, 0.4117647, 1, 1,
0.2277064, 0.4944171, 1.487679, 0, 0.4078431, 1, 1,
0.2277272, -0.0486517, 1.825535, 0, 0.4, 1, 1,
0.2296238, 1.354902, 0.8316265, 0, 0.3921569, 1, 1,
0.2318069, 0.1418727, 1.181251, 0, 0.3882353, 1, 1,
0.2377031, -1.774311, 2.511869, 0, 0.3803922, 1, 1,
0.238706, -0.3500646, 1.631657, 0, 0.3764706, 1, 1,
0.2434053, 1.634814, -0.6778018, 0, 0.3686275, 1, 1,
0.2526832, -0.5682848, 4.02529, 0, 0.3647059, 1, 1,
0.2547554, 0.5784428, -0.3732195, 0, 0.3568628, 1, 1,
0.2558957, -0.2755036, 4.257327, 0, 0.3529412, 1, 1,
0.2574704, 0.529851, 0.2365274, 0, 0.345098, 1, 1,
0.2578037, -0.9541007, 4.637065, 0, 0.3411765, 1, 1,
0.2595762, 0.8640157, 0.6921372, 0, 0.3333333, 1, 1,
0.259683, 1.237013, -1.503186, 0, 0.3294118, 1, 1,
0.2618137, 1.155801, 0.4381815, 0, 0.3215686, 1, 1,
0.262642, -1.388776, 2.088722, 0, 0.3176471, 1, 1,
0.2676347, 0.7773134, 0.4761558, 0, 0.3098039, 1, 1,
0.2677267, -0.7095455, 4.359436, 0, 0.3058824, 1, 1,
0.2686217, -1.219185, 2.84803, 0, 0.2980392, 1, 1,
0.2752196, -0.126479, 1.875273, 0, 0.2901961, 1, 1,
0.2767677, -0.932207, 2.27936, 0, 0.2862745, 1, 1,
0.2786597, 0.005119053, 2.201148, 0, 0.2784314, 1, 1,
0.2789784, 1.84306, -0.1772311, 0, 0.2745098, 1, 1,
0.2828765, 0.05222372, 2.214577, 0, 0.2666667, 1, 1,
0.286592, -0.6892202, 1.114312, 0, 0.2627451, 1, 1,
0.2881728, -0.7612091, 4.445032, 0, 0.254902, 1, 1,
0.2893794, 0.6938922, 0.7815509, 0, 0.2509804, 1, 1,
0.2903431, 1.823343, 2.824903, 0, 0.2431373, 1, 1,
0.2923354, -0.258138, 0.3303302, 0, 0.2392157, 1, 1,
0.2932796, -0.7525479, 2.999201, 0, 0.2313726, 1, 1,
0.2937582, 0.8167993, 0.9739796, 0, 0.227451, 1, 1,
0.2939399, -0.9862597, 2.266587, 0, 0.2196078, 1, 1,
0.2944769, -0.2779317, 3.713663, 0, 0.2156863, 1, 1,
0.2958217, -1.099686, 2.98171, 0, 0.2078431, 1, 1,
0.3028728, 0.4764581, -0.7333902, 0, 0.2039216, 1, 1,
0.304946, 0.5572964, 0.0913285, 0, 0.1960784, 1, 1,
0.305541, -0.3915951, 1.958656, 0, 0.1882353, 1, 1,
0.3128682, 0.7548206, -0.777254, 0, 0.1843137, 1, 1,
0.3138429, -1.261305, 3.788567, 0, 0.1764706, 1, 1,
0.313908, 0.9775486, 1.478009, 0, 0.172549, 1, 1,
0.3164508, 0.07049911, 0.6570498, 0, 0.1647059, 1, 1,
0.3186438, -0.7537376, 2.159006, 0, 0.1607843, 1, 1,
0.3186564, 1.118183, 1.232646, 0, 0.1529412, 1, 1,
0.3214293, 0.715121, 1.116258, 0, 0.1490196, 1, 1,
0.3215357, -0.1830261, 2.498524, 0, 0.1411765, 1, 1,
0.3312007, -0.630594, 3.240065, 0, 0.1372549, 1, 1,
0.3317792, -0.09054302, 3.331498, 0, 0.1294118, 1, 1,
0.3355724, -0.7404144, 3.071549, 0, 0.1254902, 1, 1,
0.3392898, -1.501005, 3.625001, 0, 0.1176471, 1, 1,
0.3399552, 0.2835645, 1.05681, 0, 0.1137255, 1, 1,
0.3432037, -0.07387992, 1.252348, 0, 0.1058824, 1, 1,
0.3440712, 0.2290822, 0.09718069, 0, 0.09803922, 1, 1,
0.3447021, 0.7858047, 1.667328, 0, 0.09411765, 1, 1,
0.3460328, -1.434298, 2.000046, 0, 0.08627451, 1, 1,
0.3523473, -0.3911577, 3.711179, 0, 0.08235294, 1, 1,
0.3569688, 1.117544, 0.5374662, 0, 0.07450981, 1, 1,
0.3587774, 0.2088283, 0.7135814, 0, 0.07058824, 1, 1,
0.3595842, 1.283275, -0.02511063, 0, 0.0627451, 1, 1,
0.3781608, -0.5489286, 2.546135, 0, 0.05882353, 1, 1,
0.3784981, 0.3971589, 3.007451, 0, 0.05098039, 1, 1,
0.3789575, -0.9604984, -0.4628899, 0, 0.04705882, 1, 1,
0.3856649, 0.5899426, 0.2883374, 0, 0.03921569, 1, 1,
0.3880157, -1.135426, 3.038986, 0, 0.03529412, 1, 1,
0.3996801, -0.4393892, 1.710553, 0, 0.02745098, 1, 1,
0.4020618, -0.07447991, 2.381414, 0, 0.02352941, 1, 1,
0.407032, -0.8208732, 4.679957, 0, 0.01568628, 1, 1,
0.4088373, -0.2324271, 1.117949, 0, 0.01176471, 1, 1,
0.4138338, -2.271387, 2.97865, 0, 0.003921569, 1, 1,
0.4228942, -0.2457707, 1.853967, 0.003921569, 0, 1, 1,
0.4252975, -0.3345807, 1.598311, 0.007843138, 0, 1, 1,
0.4263138, -0.2600988, 1.278194, 0.01568628, 0, 1, 1,
0.4265109, 0.3457507, 0.8858435, 0.01960784, 0, 1, 1,
0.430585, 1.474549, -0.148571, 0.02745098, 0, 1, 1,
0.4329506, -0.3980197, 0.8914431, 0.03137255, 0, 1, 1,
0.4340429, 0.4103241, 1.312547, 0.03921569, 0, 1, 1,
0.4384681, -1.419856, 2.061004, 0.04313726, 0, 1, 1,
0.4411705, -0.9860638, 3.716358, 0.05098039, 0, 1, 1,
0.4421199, -0.8916568, 3.435762, 0.05490196, 0, 1, 1,
0.4425929, 0.1471291, 1.653008, 0.0627451, 0, 1, 1,
0.4442167, 1.241853, 0.3251866, 0.06666667, 0, 1, 1,
0.4454121, 0.6082705, -0.5574067, 0.07450981, 0, 1, 1,
0.4459338, 0.3933848, 0.1247493, 0.07843138, 0, 1, 1,
0.4480474, -1.370961, 3.581072, 0.08627451, 0, 1, 1,
0.4488724, 0.6130005, 0.8590067, 0.09019608, 0, 1, 1,
0.4564362, -0.9230593, 3.2086, 0.09803922, 0, 1, 1,
0.4565853, -1.960531, 3.128036, 0.1058824, 0, 1, 1,
0.4575217, -0.5485501, 1.230583, 0.1098039, 0, 1, 1,
0.4578624, 1.560378, 0.3363162, 0.1176471, 0, 1, 1,
0.4597403, -0.001191142, 1.611923, 0.1215686, 0, 1, 1,
0.4643872, 0.6764135, 0.6104458, 0.1294118, 0, 1, 1,
0.4654635, -0.5221678, 4.445847, 0.1333333, 0, 1, 1,
0.4680151, 0.5303705, 1.19028, 0.1411765, 0, 1, 1,
0.4698144, 0.2366723, 2.720151, 0.145098, 0, 1, 1,
0.4743459, -1.316229, 2.988032, 0.1529412, 0, 1, 1,
0.4772836, 1.556278, 0.8932623, 0.1568628, 0, 1, 1,
0.4792808, 0.1404172, 0.5422548, 0.1647059, 0, 1, 1,
0.4864196, -1.144098, 4.018054, 0.1686275, 0, 1, 1,
0.4872753, 1.086256, 1.120046, 0.1764706, 0, 1, 1,
0.488509, 1.583309, -0.4299655, 0.1803922, 0, 1, 1,
0.4952567, -0.2091011, 2.81862, 0.1882353, 0, 1, 1,
0.5034811, 0.3113488, 1.54051, 0.1921569, 0, 1, 1,
0.5048859, -1.288726, 2.737377, 0.2, 0, 1, 1,
0.5124379, 1.864746, 0.1446183, 0.2078431, 0, 1, 1,
0.5133172, -0.4674771, 1.969238, 0.2117647, 0, 1, 1,
0.5161059, -1.679624, 4.31069, 0.2196078, 0, 1, 1,
0.519336, -0.8901454, 1.627201, 0.2235294, 0, 1, 1,
0.5202972, 1.886869, -1.048119, 0.2313726, 0, 1, 1,
0.5225023, -1.560307, 3.292856, 0.2352941, 0, 1, 1,
0.5230911, -1.224478, 2.378072, 0.2431373, 0, 1, 1,
0.5245376, 0.6709434, 1.276588, 0.2470588, 0, 1, 1,
0.5257125, 1.077673, -0.3118077, 0.254902, 0, 1, 1,
0.5258874, -2.056565, 2.3587, 0.2588235, 0, 1, 1,
0.5323107, 0.2471431, 2.018853, 0.2666667, 0, 1, 1,
0.532897, 0.1835103, 0.74977, 0.2705882, 0, 1, 1,
0.5362289, -0.1815474, 1.481651, 0.2784314, 0, 1, 1,
0.5384253, 1.093671, 1.264506, 0.282353, 0, 1, 1,
0.5386719, -0.1703434, 1.880525, 0.2901961, 0, 1, 1,
0.5391167, -1.3767, 2.976787, 0.2941177, 0, 1, 1,
0.5444682, -0.01989676, 1.189698, 0.3019608, 0, 1, 1,
0.5454305, 0.2896086, 0.2610757, 0.3098039, 0, 1, 1,
0.5491747, 0.3990595, 0.5152046, 0.3137255, 0, 1, 1,
0.5509485, 0.6093031, 1.786784, 0.3215686, 0, 1, 1,
0.5536535, 1.052696, -0.193456, 0.3254902, 0, 1, 1,
0.5683955, 2.98236, -1.380977, 0.3333333, 0, 1, 1,
0.5765719, 0.1530979, 1.056777, 0.3372549, 0, 1, 1,
0.583891, -0.7148369, 1.941977, 0.345098, 0, 1, 1,
0.5862496, 1.042051, 0.2892496, 0.3490196, 0, 1, 1,
0.5867347, 0.5782042, 1.078638, 0.3568628, 0, 1, 1,
0.5882877, -0.1381549, 2.563883, 0.3607843, 0, 1, 1,
0.5892884, 0.4020334, 1.723028, 0.3686275, 0, 1, 1,
0.594687, -0.6430222, 1.118, 0.372549, 0, 1, 1,
0.5954754, 0.09218946, 0.3358732, 0.3803922, 0, 1, 1,
0.5959951, -0.4144244, 2.236415, 0.3843137, 0, 1, 1,
0.6001152, -0.3044429, 2.784925, 0.3921569, 0, 1, 1,
0.6032971, 0.4603761, 1.977392, 0.3960784, 0, 1, 1,
0.6054793, 0.5078706, 1.727963, 0.4039216, 0, 1, 1,
0.607357, 1.175017, 0.3675234, 0.4117647, 0, 1, 1,
0.6164511, -0.5441165, 3.180104, 0.4156863, 0, 1, 1,
0.6168365, 1.646758, 1.06533, 0.4235294, 0, 1, 1,
0.618507, -0.2837668, 2.186538, 0.427451, 0, 1, 1,
0.6250096, 0.5065069, 0.7025653, 0.4352941, 0, 1, 1,
0.6282932, -0.2420384, 1.765317, 0.4392157, 0, 1, 1,
0.6296642, 1.121337, -0.1254177, 0.4470588, 0, 1, 1,
0.632363, -0.4555154, 0.6982378, 0.4509804, 0, 1, 1,
0.640829, 1.252035, 0.2103956, 0.4588235, 0, 1, 1,
0.6467523, 0.06893909, 0.3773783, 0.4627451, 0, 1, 1,
0.6511042, -0.6917804, 2.280363, 0.4705882, 0, 1, 1,
0.6591005, 0.7113193, 1.368052, 0.4745098, 0, 1, 1,
0.6596354, 2.587532, -0.2105355, 0.4823529, 0, 1, 1,
0.660578, 0.9323225, 0.1544955, 0.4862745, 0, 1, 1,
0.6624838, -1.892391, 3.634631, 0.4941176, 0, 1, 1,
0.6639106, 1.317428, 0.4719506, 0.5019608, 0, 1, 1,
0.67119, -0.2101462, 0.549431, 0.5058824, 0, 1, 1,
0.6764225, 0.8791857, 1.872131, 0.5137255, 0, 1, 1,
0.6770508, 0.2214605, -0.239039, 0.5176471, 0, 1, 1,
0.6787903, -1.031818, 3.394582, 0.5254902, 0, 1, 1,
0.6805789, -0.4956912, 1.897893, 0.5294118, 0, 1, 1,
0.6818307, -0.3805147, 1.32512, 0.5372549, 0, 1, 1,
0.6910719, -0.9056873, 2.338107, 0.5411765, 0, 1, 1,
0.6917706, -0.6598374, 2.125739, 0.5490196, 0, 1, 1,
0.6945214, 0.466984, 1.174006, 0.5529412, 0, 1, 1,
0.7068106, -0.4902984, 2.806413, 0.5607843, 0, 1, 1,
0.7098749, 1.265397, -1.15618, 0.5647059, 0, 1, 1,
0.7100604, -0.4315918, 1.046757, 0.572549, 0, 1, 1,
0.7124991, 0.7641082, 0.4014257, 0.5764706, 0, 1, 1,
0.7127843, -1.970232, 0.3142401, 0.5843138, 0, 1, 1,
0.7231386, 1.41121, 0.4976828, 0.5882353, 0, 1, 1,
0.7287537, 0.4892394, 1.594684, 0.5960785, 0, 1, 1,
0.7357175, -0.3688108, 2.691854, 0.6039216, 0, 1, 1,
0.7395328, -0.3253368, 2.934701, 0.6078432, 0, 1, 1,
0.7406361, 0.3947267, 0.7549639, 0.6156863, 0, 1, 1,
0.7431918, 0.7081572, 0.5330144, 0.6196079, 0, 1, 1,
0.7436767, -0.8583239, 2.715745, 0.627451, 0, 1, 1,
0.7439495, -0.7965462, 2.500829, 0.6313726, 0, 1, 1,
0.7440426, -0.7175898, 1.031145, 0.6392157, 0, 1, 1,
0.7448988, -0.4312558, 1.21455, 0.6431373, 0, 1, 1,
0.748579, 0.4274369, 1.59423, 0.6509804, 0, 1, 1,
0.7490639, -0.06172805, 2.088581, 0.654902, 0, 1, 1,
0.750858, -0.3948487, 3.652195, 0.6627451, 0, 1, 1,
0.751023, -0.2081545, 2.308709, 0.6666667, 0, 1, 1,
0.7564141, 0.8565636, -0.3502135, 0.6745098, 0, 1, 1,
0.7655901, -0.7722765, 2.92011, 0.6784314, 0, 1, 1,
0.7679868, -0.3267569, 2.296602, 0.6862745, 0, 1, 1,
0.7752842, -0.8181652, 2.420305, 0.6901961, 0, 1, 1,
0.7753596, -1.05981, 2.262076, 0.6980392, 0, 1, 1,
0.7835977, 0.1855615, 1.082082, 0.7058824, 0, 1, 1,
0.7898095, -0.9056345, 2.168232, 0.7098039, 0, 1, 1,
0.7977316, -1.135664, 1.893056, 0.7176471, 0, 1, 1,
0.7982698, -0.09773001, 1.201678, 0.7215686, 0, 1, 1,
0.7989362, 0.2312994, 0.7520863, 0.7294118, 0, 1, 1,
0.8107455, -0.8601003, 3.12632, 0.7333333, 0, 1, 1,
0.8108485, 0.5913066, 0.165959, 0.7411765, 0, 1, 1,
0.8154667, -0.6802564, 2.483208, 0.7450981, 0, 1, 1,
0.8175749, -0.2077511, 1.124882, 0.7529412, 0, 1, 1,
0.821037, -0.5290448, 2.676498, 0.7568628, 0, 1, 1,
0.8214411, -1.504078, 1.816895, 0.7647059, 0, 1, 1,
0.8234877, 1.170781, 0.8789263, 0.7686275, 0, 1, 1,
0.8256152, -1.794386, 1.831587, 0.7764706, 0, 1, 1,
0.8353273, -1.385607, 1.39857, 0.7803922, 0, 1, 1,
0.8369855, 0.4987773, 0.8241352, 0.7882353, 0, 1, 1,
0.8418168, 0.7823324, 1.866207, 0.7921569, 0, 1, 1,
0.8487169, -0.2678626, 3.006304, 0.8, 0, 1, 1,
0.8493385, 0.8362529, 1.03232, 0.8078431, 0, 1, 1,
0.8520012, 2.202656, 1.237153, 0.8117647, 0, 1, 1,
0.8534425, -0.3989021, 1.709969, 0.8196079, 0, 1, 1,
0.8590879, -0.3341593, 0.6853951, 0.8235294, 0, 1, 1,
0.8685077, 1.524115, 0.7893122, 0.8313726, 0, 1, 1,
0.8689778, 0.612607, 0.4074666, 0.8352941, 0, 1, 1,
0.8707022, -0.3833777, 2.533276, 0.8431373, 0, 1, 1,
0.8727006, -0.8025347, 3.928707, 0.8470588, 0, 1, 1,
0.8743817, 0.03326872, 1.726887, 0.854902, 0, 1, 1,
0.8804896, 0.08156547, 1.430117, 0.8588235, 0, 1, 1,
0.8847328, -0.1344166, 2.543647, 0.8666667, 0, 1, 1,
0.8896785, -1.408289, 2.991758, 0.8705882, 0, 1, 1,
0.8903183, -0.9901913, 2.215929, 0.8784314, 0, 1, 1,
0.8996617, -0.7390009, 0.2339035, 0.8823529, 0, 1, 1,
0.9000289, 0.2092996, 2.787628, 0.8901961, 0, 1, 1,
0.9000573, 0.1688958, 3.116257, 0.8941177, 0, 1, 1,
0.9092888, -0.7807528, 1.365995, 0.9019608, 0, 1, 1,
0.9123096, -1.438914, 2.400121, 0.9098039, 0, 1, 1,
0.9245642, 0.3530901, 1.137863, 0.9137255, 0, 1, 1,
0.9254086, -0.6596789, 2.474474, 0.9215686, 0, 1, 1,
0.9281774, -1.012459, 3.256332, 0.9254902, 0, 1, 1,
0.9303371, 0.5709942, 0.9674731, 0.9333333, 0, 1, 1,
0.9347645, 0.9773884, 1.830319, 0.9372549, 0, 1, 1,
0.9351516, 0.8224214, 1.923843, 0.945098, 0, 1, 1,
0.9365436, -1.288172, 1.956843, 0.9490196, 0, 1, 1,
0.9410717, 0.1749593, 1.524756, 0.9568627, 0, 1, 1,
0.9417375, 0.2484191, 0.2995945, 0.9607843, 0, 1, 1,
0.9438438, -0.6073496, 2.500976, 0.9686275, 0, 1, 1,
0.9450766, 1.406211, 0.9451128, 0.972549, 0, 1, 1,
0.9486826, -0.1150683, 3.20372, 0.9803922, 0, 1, 1,
0.9576125, -0.8173407, 3.50924, 0.9843137, 0, 1, 1,
0.9588116, -0.9117514, 4.353655, 0.9921569, 0, 1, 1,
0.9603691, -0.1890551, 1.955242, 0.9960784, 0, 1, 1,
0.9609756, -0.5993373, 0.5224954, 1, 0, 0.9960784, 1,
0.961793, 0.6013848, 2.232263, 1, 0, 0.9882353, 1,
0.9651551, 0.6439402, -0.2349802, 1, 0, 0.9843137, 1,
0.9678742, 0.2884333, 1.142854, 1, 0, 0.9764706, 1,
0.9696559, 0.1323664, 1.138002, 1, 0, 0.972549, 1,
0.9722375, 1.480768, 0.9880852, 1, 0, 0.9647059, 1,
0.9726589, 0.9237508, 2.258037, 1, 0, 0.9607843, 1,
0.9769232, 0.2244486, 1.454944, 1, 0, 0.9529412, 1,
0.9777335, -0.159852, 2.371781, 1, 0, 0.9490196, 1,
0.9796349, -0.08014617, 3.123779, 1, 0, 0.9411765, 1,
0.9796746, -2.374135, 2.513291, 1, 0, 0.9372549, 1,
0.9805458, -1.63562, 3.407418, 1, 0, 0.9294118, 1,
0.9928186, -0.3769853, 1.760728, 1, 0, 0.9254902, 1,
0.9951007, -0.274164, 1.270287, 1, 0, 0.9176471, 1,
1.005198, -0.1772781, 0.9521965, 1, 0, 0.9137255, 1,
1.006823, -0.1576731, 2.938168, 1, 0, 0.9058824, 1,
1.007262, -0.933355, 2.11761, 1, 0, 0.9019608, 1,
1.024241, 2.016802, -0.08658649, 1, 0, 0.8941177, 1,
1.036601, 0.9931951, 0.04726085, 1, 0, 0.8862745, 1,
1.040174, -1.090555, 0.730987, 1, 0, 0.8823529, 1,
1.052181, -0.2546064, 1.797312, 1, 0, 0.8745098, 1,
1.059742, 1.085831, 1.474352, 1, 0, 0.8705882, 1,
1.069276, 0.2010306, 2.317329, 1, 0, 0.8627451, 1,
1.075324, 0.1286077, 0.2579842, 1, 0, 0.8588235, 1,
1.07727, 0.6011863, 1.887846, 1, 0, 0.8509804, 1,
1.0899, 0.354103, 3.50215, 1, 0, 0.8470588, 1,
1.098237, 1.018486, 0.8412883, 1, 0, 0.8392157, 1,
1.098476, -1.963262, 3.410314, 1, 0, 0.8352941, 1,
1.105188, -1.059244, 2.708744, 1, 0, 0.827451, 1,
1.110619, 0.8293895, 0.6678198, 1, 0, 0.8235294, 1,
1.114848, -0.5094808, 2.021647, 1, 0, 0.8156863, 1,
1.115426, -0.003260684, 2.791895, 1, 0, 0.8117647, 1,
1.115578, -0.2419962, 1.795916, 1, 0, 0.8039216, 1,
1.116854, -0.9299436, 1.700238, 1, 0, 0.7960784, 1,
1.117035, 1.661991, 0.07308588, 1, 0, 0.7921569, 1,
1.123319, -0.6679152, 1.827583, 1, 0, 0.7843137, 1,
1.137148, 0.2062022, 3.308072, 1, 0, 0.7803922, 1,
1.140852, 1.059042, 1.792129, 1, 0, 0.772549, 1,
1.149132, -1.075657, 2.695168, 1, 0, 0.7686275, 1,
1.15591, 0.8569695, 0.5440904, 1, 0, 0.7607843, 1,
1.165805, -0.7576786, 1.783523, 1, 0, 0.7568628, 1,
1.167629, -0.6941038, 2.096877, 1, 0, 0.7490196, 1,
1.168271, 0.3485602, 1.588553, 1, 0, 0.7450981, 1,
1.174649, -1.235563, 2.579428, 1, 0, 0.7372549, 1,
1.182654, 1.484025, 2.246236, 1, 0, 0.7333333, 1,
1.189607, 1.596195, 0.7750939, 1, 0, 0.7254902, 1,
1.19001, -0.0502586, 1.822941, 1, 0, 0.7215686, 1,
1.197832, 0.305757, -1.506787, 1, 0, 0.7137255, 1,
1.198671, 0.504979, -0.5246989, 1, 0, 0.7098039, 1,
1.203919, 1.088709, 0.6329581, 1, 0, 0.7019608, 1,
1.207106, -1.490337, 3.716239, 1, 0, 0.6941177, 1,
1.209463, -0.1444086, 1.470551, 1, 0, 0.6901961, 1,
1.211088, -0.5522249, 4.296374, 1, 0, 0.682353, 1,
1.21754, 0.2623975, 0.5036997, 1, 0, 0.6784314, 1,
1.221588, -0.5315122, 0.4263876, 1, 0, 0.6705883, 1,
1.222525, -0.2594493, 2.938905, 1, 0, 0.6666667, 1,
1.227995, -0.3465829, 0.8998032, 1, 0, 0.6588235, 1,
1.232065, 0.06648145, 0.5393158, 1, 0, 0.654902, 1,
1.233692, 0.1417594, 1.001817, 1, 0, 0.6470588, 1,
1.2344, -1.327153, 2.763959, 1, 0, 0.6431373, 1,
1.243702, -0.4420825, 1.622335, 1, 0, 0.6352941, 1,
1.245425, 0.2081964, 2.677749, 1, 0, 0.6313726, 1,
1.25449, -0.191152, -0.07519339, 1, 0, 0.6235294, 1,
1.26702, -1.784521, 1.003011, 1, 0, 0.6196079, 1,
1.268904, -1.397104, 1.279578, 1, 0, 0.6117647, 1,
1.274284, -0.8457676, 0.5659141, 1, 0, 0.6078432, 1,
1.277995, -0.01685347, 1.967692, 1, 0, 0.6, 1,
1.295478, 1.561213, -0.4852513, 1, 0, 0.5921569, 1,
1.306217, 1.077363, 0.5960169, 1, 0, 0.5882353, 1,
1.312248, -0.1614856, 2.137916, 1, 0, 0.5803922, 1,
1.317386, 1.03095, 2.517241, 1, 0, 0.5764706, 1,
1.317835, -1.085853, 1.906712, 1, 0, 0.5686275, 1,
1.324854, -0.2309925, 3.096166, 1, 0, 0.5647059, 1,
1.333087, 0.6997774, 0.7831067, 1, 0, 0.5568628, 1,
1.343598, 1.068705, 1.078767, 1, 0, 0.5529412, 1,
1.349811, -1.140843, 2.781135, 1, 0, 0.5450981, 1,
1.36214, 3.250813, 2.268086, 1, 0, 0.5411765, 1,
1.364295, 0.6492936, 2.998985, 1, 0, 0.5333334, 1,
1.382436, -0.7064662, 3.843916, 1, 0, 0.5294118, 1,
1.382542, 2.077792, 0.3558149, 1, 0, 0.5215687, 1,
1.393828, -0.2601159, 1.617932, 1, 0, 0.5176471, 1,
1.400093, -0.03558923, 0.7728077, 1, 0, 0.509804, 1,
1.403814, -0.9912283, 3.014321, 1, 0, 0.5058824, 1,
1.411026, 1.330864, 1.382867, 1, 0, 0.4980392, 1,
1.413102, 1.36099, 0.8322495, 1, 0, 0.4901961, 1,
1.418877, -0.6912693, 3.17479, 1, 0, 0.4862745, 1,
1.420179, -0.6853848, 4.829522, 1, 0, 0.4784314, 1,
1.428961, -0.685389, 2.205333, 1, 0, 0.4745098, 1,
1.431068, -1.762115, 2.096154, 1, 0, 0.4666667, 1,
1.432625, 0.3825906, 0.007871288, 1, 0, 0.4627451, 1,
1.434351, 1.090563, 0.711769, 1, 0, 0.454902, 1,
1.438298, 0.01558542, 3.370374, 1, 0, 0.4509804, 1,
1.443303, -0.4613996, 1.62912, 1, 0, 0.4431373, 1,
1.445675, -0.6343865, 1.030462, 1, 0, 0.4392157, 1,
1.446097, -0.333674, 1.522247, 1, 0, 0.4313726, 1,
1.447883, -0.4905051, 1.521939, 1, 0, 0.427451, 1,
1.458429, -0.4279174, 1.961401, 1, 0, 0.4196078, 1,
1.462593, 0.08702798, 2.583948, 1, 0, 0.4156863, 1,
1.465639, 0.8556479, 2.358343, 1, 0, 0.4078431, 1,
1.470094, 0.410497, 2.177184, 1, 0, 0.4039216, 1,
1.477097, 1.259598, -0.4113843, 1, 0, 0.3960784, 1,
1.499417, -0.240073, 3.015358, 1, 0, 0.3882353, 1,
1.500665, -0.2875142, 1.146877, 1, 0, 0.3843137, 1,
1.508321, -0.7678541, 2.895481, 1, 0, 0.3764706, 1,
1.517231, 0.2226567, 2.696367, 1, 0, 0.372549, 1,
1.537029, 1.689183, 1.152115, 1, 0, 0.3647059, 1,
1.541312, -1.060501, 2.162884, 1, 0, 0.3607843, 1,
1.5474, -0.1294683, 1.074126, 1, 0, 0.3529412, 1,
1.548509, 1.094172, -0.1267755, 1, 0, 0.3490196, 1,
1.56181, -0.2940737, 3.422049, 1, 0, 0.3411765, 1,
1.567745, 1.693793, -1.163179, 1, 0, 0.3372549, 1,
1.591027, 0.4728972, 1.400199, 1, 0, 0.3294118, 1,
1.59589, -0.2918652, 0.2185963, 1, 0, 0.3254902, 1,
1.601901, 1.672228, 0.06827101, 1, 0, 0.3176471, 1,
1.623447, -0.2969471, 2.807946, 1, 0, 0.3137255, 1,
1.630652, 0.689297, 1.412184, 1, 0, 0.3058824, 1,
1.641647, -0.2479625, 0.2398863, 1, 0, 0.2980392, 1,
1.642876, 0.3298759, 1.712394, 1, 0, 0.2941177, 1,
1.648958, -0.952433, 3.015738, 1, 0, 0.2862745, 1,
1.673262, -1.684591, 1.582173, 1, 0, 0.282353, 1,
1.683007, -1.13385, 0.5813793, 1, 0, 0.2745098, 1,
1.705672, -0.4377643, 0.9903048, 1, 0, 0.2705882, 1,
1.712441, -0.9729389, 2.175108, 1, 0, 0.2627451, 1,
1.747864, 0.008831695, 2.568046, 1, 0, 0.2588235, 1,
1.761135, 0.7738063, 0.4837202, 1, 0, 0.2509804, 1,
1.761516, -1.299979, 3.227774, 1, 0, 0.2470588, 1,
1.763401, -2.054285, 1.077503, 1, 0, 0.2392157, 1,
1.787175, 0.1115667, 0.7500505, 1, 0, 0.2352941, 1,
1.798096, 1.623948, 0.2695705, 1, 0, 0.227451, 1,
1.808691, -0.3647324, 1.954346, 1, 0, 0.2235294, 1,
1.82107, 0.0477199, 2.912547, 1, 0, 0.2156863, 1,
1.830522, 0.7063311, 1.60096, 1, 0, 0.2117647, 1,
1.854403, 0.2062228, -0.6627943, 1, 0, 0.2039216, 1,
1.856331, 2.464797, 0.4663959, 1, 0, 0.1960784, 1,
1.879183, -0.5185126, 2.525516, 1, 0, 0.1921569, 1,
1.887366, -0.2795047, 2.77033, 1, 0, 0.1843137, 1,
1.894503, -0.9268818, 2.252856, 1, 0, 0.1803922, 1,
1.897175, 0.736762, 0.8105406, 1, 0, 0.172549, 1,
1.936489, -0.7705687, 1.866485, 1, 0, 0.1686275, 1,
1.944156, -1.941315, 3.695525, 1, 0, 0.1607843, 1,
1.949375, 0.2723328, 2.115185, 1, 0, 0.1568628, 1,
1.966348, 0.2907354, 2.263201, 1, 0, 0.1490196, 1,
1.970187, -0.9296877, 0.4703235, 1, 0, 0.145098, 1,
1.975054, -1.032372, 1.165147, 1, 0, 0.1372549, 1,
1.975821, -0.1640345, 0.3422466, 1, 0, 0.1333333, 1,
1.989066, -0.01370673, 0.382625, 1, 0, 0.1254902, 1,
1.995531, -1.287379, 2.740424, 1, 0, 0.1215686, 1,
2.062115, -1.367921, 3.803617, 1, 0, 0.1137255, 1,
2.066421, -2.143485, 3.47237, 1, 0, 0.1098039, 1,
2.079483, 0.1878492, 3.405914, 1, 0, 0.1019608, 1,
2.079782, -0.124668, 1.597802, 1, 0, 0.09411765, 1,
2.083224, -2.574234, 1.022676, 1, 0, 0.09019608, 1,
2.107436, 0.7864411, 3.314591, 1, 0, 0.08235294, 1,
2.147897, 0.5922104, 2.196477, 1, 0, 0.07843138, 1,
2.189246, -0.7931182, 0.9711246, 1, 0, 0.07058824, 1,
2.220212, 1.905746, 3.238159, 1, 0, 0.06666667, 1,
2.380596, -0.7440316, 3.003768, 1, 0, 0.05882353, 1,
2.404586, 0.984929, -0.8781601, 1, 0, 0.05490196, 1,
2.420763, 0.3575206, 1.530273, 1, 0, 0.04705882, 1,
2.501557, 1.010652, 1.458597, 1, 0, 0.04313726, 1,
2.536177, 0.4582493, 2.655653, 1, 0, 0.03529412, 1,
2.615264, -1.356106, 3.768261, 1, 0, 0.03137255, 1,
2.726243, 0.1732269, 0.08829664, 1, 0, 0.02352941, 1,
2.750545, 1.279208, 1.897477, 1, 0, 0.01960784, 1,
2.79292, -0.5411127, 2.682361, 1, 0, 0.01176471, 1,
2.919286, -1.252854, 0.8393143, 1, 0, 0.007843138, 1
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
-0.2749292, -4.271367, -7.234586, 0, -0.5, 0.5, 0.5,
-0.2749292, -4.271367, -7.234586, 1, -0.5, 0.5, 0.5,
-0.2749292, -4.271367, -7.234586, 1, 1.5, 0.5, 0.5,
-0.2749292, -4.271367, -7.234586, 0, 1.5, 0.5, 0.5
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
-4.551983, 0.03483176, -7.234586, 0, -0.5, 0.5, 0.5,
-4.551983, 0.03483176, -7.234586, 1, -0.5, 0.5, 0.5,
-4.551983, 0.03483176, -7.234586, 1, 1.5, 0.5, 0.5,
-4.551983, 0.03483176, -7.234586, 0, 1.5, 0.5, 0.5
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
-4.551983, -4.271367, 0.1819346, 0, -0.5, 0.5, 0.5,
-4.551983, -4.271367, 0.1819346, 1, -0.5, 0.5, 0.5,
-4.551983, -4.271367, 0.1819346, 1, 1.5, 0.5, 0.5,
-4.551983, -4.271367, 0.1819346, 0, 1.5, 0.5, 0.5
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
-3, -3.277629, -5.523081,
2, -3.277629, -5.523081,
-3, -3.277629, -5.523081,
-3, -3.443252, -5.808332,
-2, -3.277629, -5.523081,
-2, -3.443252, -5.808332,
-1, -3.277629, -5.523081,
-1, -3.443252, -5.808332,
0, -3.277629, -5.523081,
0, -3.443252, -5.808332,
1, -3.277629, -5.523081,
1, -3.443252, -5.808332,
2, -3.277629, -5.523081,
2, -3.443252, -5.808332
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
-3, -3.774498, -6.378833, 0, -0.5, 0.5, 0.5,
-3, -3.774498, -6.378833, 1, -0.5, 0.5, 0.5,
-3, -3.774498, -6.378833, 1, 1.5, 0.5, 0.5,
-3, -3.774498, -6.378833, 0, 1.5, 0.5, 0.5,
-2, -3.774498, -6.378833, 0, -0.5, 0.5, 0.5,
-2, -3.774498, -6.378833, 1, -0.5, 0.5, 0.5,
-2, -3.774498, -6.378833, 1, 1.5, 0.5, 0.5,
-2, -3.774498, -6.378833, 0, 1.5, 0.5, 0.5,
-1, -3.774498, -6.378833, 0, -0.5, 0.5, 0.5,
-1, -3.774498, -6.378833, 1, -0.5, 0.5, 0.5,
-1, -3.774498, -6.378833, 1, 1.5, 0.5, 0.5,
-1, -3.774498, -6.378833, 0, 1.5, 0.5, 0.5,
0, -3.774498, -6.378833, 0, -0.5, 0.5, 0.5,
0, -3.774498, -6.378833, 1, -0.5, 0.5, 0.5,
0, -3.774498, -6.378833, 1, 1.5, 0.5, 0.5,
0, -3.774498, -6.378833, 0, 1.5, 0.5, 0.5,
1, -3.774498, -6.378833, 0, -0.5, 0.5, 0.5,
1, -3.774498, -6.378833, 1, -0.5, 0.5, 0.5,
1, -3.774498, -6.378833, 1, 1.5, 0.5, 0.5,
1, -3.774498, -6.378833, 0, 1.5, 0.5, 0.5,
2, -3.774498, -6.378833, 0, -0.5, 0.5, 0.5,
2, -3.774498, -6.378833, 1, -0.5, 0.5, 0.5,
2, -3.774498, -6.378833, 1, 1.5, 0.5, 0.5,
2, -3.774498, -6.378833, 0, 1.5, 0.5, 0.5
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
-3.56497, -3, -5.523081,
-3.56497, 3, -5.523081,
-3.56497, -3, -5.523081,
-3.729472, -3, -5.808332,
-3.56497, -2, -5.523081,
-3.729472, -2, -5.808332,
-3.56497, -1, -5.523081,
-3.729472, -1, -5.808332,
-3.56497, 0, -5.523081,
-3.729472, 0, -5.808332,
-3.56497, 1, -5.523081,
-3.729472, 1, -5.808332,
-3.56497, 2, -5.523081,
-3.729472, 2, -5.808332,
-3.56497, 3, -5.523081,
-3.729472, 3, -5.808332
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
-4.058476, -3, -6.378833, 0, -0.5, 0.5, 0.5,
-4.058476, -3, -6.378833, 1, -0.5, 0.5, 0.5,
-4.058476, -3, -6.378833, 1, 1.5, 0.5, 0.5,
-4.058476, -3, -6.378833, 0, 1.5, 0.5, 0.5,
-4.058476, -2, -6.378833, 0, -0.5, 0.5, 0.5,
-4.058476, -2, -6.378833, 1, -0.5, 0.5, 0.5,
-4.058476, -2, -6.378833, 1, 1.5, 0.5, 0.5,
-4.058476, -2, -6.378833, 0, 1.5, 0.5, 0.5,
-4.058476, -1, -6.378833, 0, -0.5, 0.5, 0.5,
-4.058476, -1, -6.378833, 1, -0.5, 0.5, 0.5,
-4.058476, -1, -6.378833, 1, 1.5, 0.5, 0.5,
-4.058476, -1, -6.378833, 0, 1.5, 0.5, 0.5,
-4.058476, 0, -6.378833, 0, -0.5, 0.5, 0.5,
-4.058476, 0, -6.378833, 1, -0.5, 0.5, 0.5,
-4.058476, 0, -6.378833, 1, 1.5, 0.5, 0.5,
-4.058476, 0, -6.378833, 0, 1.5, 0.5, 0.5,
-4.058476, 1, -6.378833, 0, -0.5, 0.5, 0.5,
-4.058476, 1, -6.378833, 1, -0.5, 0.5, 0.5,
-4.058476, 1, -6.378833, 1, 1.5, 0.5, 0.5,
-4.058476, 1, -6.378833, 0, 1.5, 0.5, 0.5,
-4.058476, 2, -6.378833, 0, -0.5, 0.5, 0.5,
-4.058476, 2, -6.378833, 1, -0.5, 0.5, 0.5,
-4.058476, 2, -6.378833, 1, 1.5, 0.5, 0.5,
-4.058476, 2, -6.378833, 0, 1.5, 0.5, 0.5,
-4.058476, 3, -6.378833, 0, -0.5, 0.5, 0.5,
-4.058476, 3, -6.378833, 1, -0.5, 0.5, 0.5,
-4.058476, 3, -6.378833, 1, 1.5, 0.5, 0.5,
-4.058476, 3, -6.378833, 0, 1.5, 0.5, 0.5
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
-3.56497, -3.277629, -4,
-3.56497, -3.277629, 4,
-3.56497, -3.277629, -4,
-3.729472, -3.443252, -4,
-3.56497, -3.277629, -2,
-3.729472, -3.443252, -2,
-3.56497, -3.277629, 0,
-3.729472, -3.443252, 0,
-3.56497, -3.277629, 2,
-3.729472, -3.443252, 2,
-3.56497, -3.277629, 4,
-3.729472, -3.443252, 4
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
-4.058476, -3.774498, -4, 0, -0.5, 0.5, 0.5,
-4.058476, -3.774498, -4, 1, -0.5, 0.5, 0.5,
-4.058476, -3.774498, -4, 1, 1.5, 0.5, 0.5,
-4.058476, -3.774498, -4, 0, 1.5, 0.5, 0.5,
-4.058476, -3.774498, -2, 0, -0.5, 0.5, 0.5,
-4.058476, -3.774498, -2, 1, -0.5, 0.5, 0.5,
-4.058476, -3.774498, -2, 1, 1.5, 0.5, 0.5,
-4.058476, -3.774498, -2, 0, 1.5, 0.5, 0.5,
-4.058476, -3.774498, 0, 0, -0.5, 0.5, 0.5,
-4.058476, -3.774498, 0, 1, -0.5, 0.5, 0.5,
-4.058476, -3.774498, 0, 1, 1.5, 0.5, 0.5,
-4.058476, -3.774498, 0, 0, 1.5, 0.5, 0.5,
-4.058476, -3.774498, 2, 0, -0.5, 0.5, 0.5,
-4.058476, -3.774498, 2, 1, -0.5, 0.5, 0.5,
-4.058476, -3.774498, 2, 1, 1.5, 0.5, 0.5,
-4.058476, -3.774498, 2, 0, 1.5, 0.5, 0.5,
-4.058476, -3.774498, 4, 0, -0.5, 0.5, 0.5,
-4.058476, -3.774498, 4, 1, -0.5, 0.5, 0.5,
-4.058476, -3.774498, 4, 1, 1.5, 0.5, 0.5,
-4.058476, -3.774498, 4, 0, 1.5, 0.5, 0.5
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
-3.56497, -3.277629, -5.523081,
-3.56497, 3.347292, -5.523081,
-3.56497, -3.277629, 5.88695,
-3.56497, 3.347292, 5.88695,
-3.56497, -3.277629, -5.523081,
-3.56497, -3.277629, 5.88695,
-3.56497, 3.347292, -5.523081,
-3.56497, 3.347292, 5.88695,
-3.56497, -3.277629, -5.523081,
3.015112, -3.277629, -5.523081,
-3.56497, -3.277629, 5.88695,
3.015112, -3.277629, 5.88695,
-3.56497, 3.347292, -5.523081,
3.015112, 3.347292, -5.523081,
-3.56497, 3.347292, 5.88695,
3.015112, 3.347292, 5.88695,
3.015112, -3.277629, -5.523081,
3.015112, 3.347292, -5.523081,
3.015112, -3.277629, 5.88695,
3.015112, 3.347292, 5.88695,
3.015112, -3.277629, -5.523081,
3.015112, -3.277629, 5.88695,
3.015112, 3.347292, -5.523081,
3.015112, 3.347292, 5.88695
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
var radius = 7.872835;
var distance = 35.02713;
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
mvMatrix.translate( 0.2749292, -0.03483176, -0.1819346 );
mvMatrix.scale( 1.293641, 1.284885, 0.7460333 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.02713);
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
cloprop<-read.table("cloprop.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cloprop$V2
```

```
## Error in eval(expr, envir, enclos): object 'cloprop' not found
```

```r
y<-cloprop$V3
```

```
## Error in eval(expr, envir, enclos): object 'cloprop' not found
```

```r
z<-cloprop$V4
```

```
## Error in eval(expr, envir, enclos): object 'cloprop' not found
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
-3.469144, 0.4411075, -0.990467, 0, 0, 1, 1, 1,
-2.915199, -0.1052599, -0.8828723, 1, 0, 0, 1, 1,
-2.843922, -0.5756258, -0.6832988, 1, 0, 0, 1, 1,
-2.812243, -0.5584653, -1.070285, 1, 0, 0, 1, 1,
-2.724343, -0.6937674, -0.1074999, 1, 0, 0, 1, 1,
-2.646596, -0.6300091, -0.8762987, 1, 0, 0, 1, 1,
-2.629429, -0.3292757, -1.927064, 0, 0, 0, 1, 1,
-2.591084, 1.928837, -0.9793503, 0, 0, 0, 1, 1,
-2.561406, -2.287051, -2.532438, 0, 0, 0, 1, 1,
-2.485262, -0.0896517, -0.7696796, 0, 0, 0, 1, 1,
-2.456174, -0.1756754, -0.7107061, 0, 0, 0, 1, 1,
-2.442518, 0.3796399, -1.217952, 0, 0, 0, 1, 1,
-2.404964, -1.328865, -1.780666, 0, 0, 0, 1, 1,
-2.380221, 1.188285, -1.620025, 1, 1, 1, 1, 1,
-2.349251, 0.7774697, -0.7181189, 1, 1, 1, 1, 1,
-2.312406, -1.247943, -2.764517, 1, 1, 1, 1, 1,
-2.307392, -0.9893476, -0.7685935, 1, 1, 1, 1, 1,
-2.296711, -0.149669, -0.2124317, 1, 1, 1, 1, 1,
-2.282724, 0.01508327, -2.535351, 1, 1, 1, 1, 1,
-2.230856, -0.3937218, -2.358024, 1, 1, 1, 1, 1,
-2.187892, -0.2066296, -1.352198, 1, 1, 1, 1, 1,
-2.119782, -1.882364, -1.198436, 1, 1, 1, 1, 1,
-2.098971, 0.9957619, -1.206385, 1, 1, 1, 1, 1,
-2.092609, -1.041162, -3.438228, 1, 1, 1, 1, 1,
-2.081069, 1.227088, -0.9585001, 1, 1, 1, 1, 1,
-2.014868, -0.4466292, -3.139837, 1, 1, 1, 1, 1,
-2.003702, 0.8085825, -1.015421, 1, 1, 1, 1, 1,
-1.993421, -0.7804322, -4.056015, 1, 1, 1, 1, 1,
-1.962419, 0.2332952, -1.781168, 0, 0, 1, 1, 1,
-1.957159, 0.08195176, -2.194467, 1, 0, 0, 1, 1,
-1.952334, -1.272612, -2.718665, 1, 0, 0, 1, 1,
-1.946075, 0.8106843, -0.2745265, 1, 0, 0, 1, 1,
-1.929386, -0.3801425, -3.121528, 1, 0, 0, 1, 1,
-1.908362, -0.167421, -2.161088, 1, 0, 0, 1, 1,
-1.902535, 0.9613235, -1.578768, 0, 0, 0, 1, 1,
-1.888519, 1.372828, 0.392534, 0, 0, 0, 1, 1,
-1.888165, 0.5220258, -3.226687, 0, 0, 0, 1, 1,
-1.876984, 0.5852866, -1.996201, 0, 0, 0, 1, 1,
-1.857317, -2.122228, -2.133087, 0, 0, 0, 1, 1,
-1.840306, 0.1654696, -1.319863, 0, 0, 0, 1, 1,
-1.826237, 0.1813663, -1.551361, 0, 0, 0, 1, 1,
-1.803905, -0.6328791, -2.902295, 1, 1, 1, 1, 1,
-1.801841, -1.126196, -2.194043, 1, 1, 1, 1, 1,
-1.793193, -0.172163, -3.371209, 1, 1, 1, 1, 1,
-1.781629, -0.6077043, -2.351962, 1, 1, 1, 1, 1,
-1.770356, -0.3118077, -2.276341, 1, 1, 1, 1, 1,
-1.76379, 0.1260334, -1.583282, 1, 1, 1, 1, 1,
-1.763329, -3.181149, -3.300713, 1, 1, 1, 1, 1,
-1.762162, 0.09053301, -1.842644, 1, 1, 1, 1, 1,
-1.754086, -0.4097482, -3.324276, 1, 1, 1, 1, 1,
-1.732374, -0.5437212, -1.753357, 1, 1, 1, 1, 1,
-1.702703, 0.5074228, 0.2955805, 1, 1, 1, 1, 1,
-1.690691, -0.3634824, -3.377178, 1, 1, 1, 1, 1,
-1.68707, -0.2613474, -1.000608, 1, 1, 1, 1, 1,
-1.678773, -0.6595476, -1.164055, 1, 1, 1, 1, 1,
-1.678521, -0.6974264, -3.422819, 1, 1, 1, 1, 1,
-1.674496, -0.377664, -2.664687, 0, 0, 1, 1, 1,
-1.664587, -1.320263, -2.234026, 1, 0, 0, 1, 1,
-1.653992, -0.216099, -1.439676, 1, 0, 0, 1, 1,
-1.652734, 0.618511, -2.736628, 1, 0, 0, 1, 1,
-1.647537, -0.4343617, -2.939423, 1, 0, 0, 1, 1,
-1.642623, -0.8252966, -2.461706, 1, 0, 0, 1, 1,
-1.63254, 0.544331, -2.204064, 0, 0, 0, 1, 1,
-1.625719, -0.09919182, -1.736772, 0, 0, 0, 1, 1,
-1.618354, -0.0701075, -1.43561, 0, 0, 0, 1, 1,
-1.618235, 0.6558764, -0.6081694, 0, 0, 0, 1, 1,
-1.617363, -0.2389849, -1.470516, 0, 0, 0, 1, 1,
-1.61261, 0.6602584, -1.687011, 0, 0, 0, 1, 1,
-1.610613, -0.5543478, -1.474682, 0, 0, 0, 1, 1,
-1.60935, 2.000042, -1.377775, 1, 1, 1, 1, 1,
-1.608179, -0.2984428, -2.896453, 1, 1, 1, 1, 1,
-1.602555, 0.09243739, -2.941008, 1, 1, 1, 1, 1,
-1.589873, -0.2627922, -1.643788, 1, 1, 1, 1, 1,
-1.589437, -0.9261731, -2.574766, 1, 1, 1, 1, 1,
-1.585832, 0.4533639, -2.516992, 1, 1, 1, 1, 1,
-1.581736, -0.8649306, -2.758095, 1, 1, 1, 1, 1,
-1.574424, 0.8087698, 0.8093238, 1, 1, 1, 1, 1,
-1.569357, 1.06345, -3.087461, 1, 1, 1, 1, 1,
-1.568947, -1.786481, -3.368265, 1, 1, 1, 1, 1,
-1.566329, -0.1398136, -0.5923396, 1, 1, 1, 1, 1,
-1.566054, 0.1595086, -3.560844, 1, 1, 1, 1, 1,
-1.561383, 0.8059653, -2.033181, 1, 1, 1, 1, 1,
-1.540247, -1.742829, -2.24907, 1, 1, 1, 1, 1,
-1.534338, 0.2952926, -2.321612, 1, 1, 1, 1, 1,
-1.522896, -0.3563078, -0.3426978, 0, 0, 1, 1, 1,
-1.514661, 1.080256, -0.7238749, 1, 0, 0, 1, 1,
-1.504292, 1.050871, -1.157763, 1, 0, 0, 1, 1,
-1.497985, -0.8778991, -2.013768, 1, 0, 0, 1, 1,
-1.487204, -0.2421082, -0.7244425, 1, 0, 0, 1, 1,
-1.478967, 0.5182055, -1.67723, 1, 0, 0, 1, 1,
-1.46895, 0.9849547, -1.89212, 0, 0, 0, 1, 1,
-1.461604, -3.055118, -2.350814, 0, 0, 0, 1, 1,
-1.449905, -1.792599, -3.666309, 0, 0, 0, 1, 1,
-1.442224, 1.017807, 0.5238894, 0, 0, 0, 1, 1,
-1.44106, 2.29018, -2.225607, 0, 0, 0, 1, 1,
-1.411278, 0.8438214, -2.568365, 0, 0, 0, 1, 1,
-1.40185, -0.1255973, -0.4296314, 0, 0, 0, 1, 1,
-1.391176, -1.433358, -1.63309, 1, 1, 1, 1, 1,
-1.390531, -1.673013, -1.51313, 1, 1, 1, 1, 1,
-1.390284, 1.460045, -1.447031, 1, 1, 1, 1, 1,
-1.379699, -0.05333912, -1.392987, 1, 1, 1, 1, 1,
-1.370515, -0.7282912, -3.022637, 1, 1, 1, 1, 1,
-1.359938, -0.07929385, 0.139298, 1, 1, 1, 1, 1,
-1.354981, -0.07002917, -1.652323, 1, 1, 1, 1, 1,
-1.344794, -1.717165, -3.252725, 1, 1, 1, 1, 1,
-1.336097, -0.03689935, -1.161955, 1, 1, 1, 1, 1,
-1.335844, 1.311181, -1.470761, 1, 1, 1, 1, 1,
-1.329575, 1.683211, -2.210999, 1, 1, 1, 1, 1,
-1.324748, 1.366447, -0.2954414, 1, 1, 1, 1, 1,
-1.305325, 0.9436433, -1.293823, 1, 1, 1, 1, 1,
-1.300768, 0.4184377, -1.425989, 1, 1, 1, 1, 1,
-1.299865, 1.85188, -0.4020299, 1, 1, 1, 1, 1,
-1.297966, -0.1780087, -1.893513, 0, 0, 1, 1, 1,
-1.285069, -1.580767, -2.269045, 1, 0, 0, 1, 1,
-1.277244, 1.943468, -1.778923, 1, 0, 0, 1, 1,
-1.269368, 0.8021331, -0.5745224, 1, 0, 0, 1, 1,
-1.261973, 1.89967, -0.2495045, 1, 0, 0, 1, 1,
-1.255698, -0.9312465, -2.959692, 1, 0, 0, 1, 1,
-1.253088, -0.2797207, -2.348353, 0, 0, 0, 1, 1,
-1.241533, 0.0936936, -2.434792, 0, 0, 0, 1, 1,
-1.222101, -1.770151, -2.11122, 0, 0, 0, 1, 1,
-1.21672, -0.7985126, -1.076042, 0, 0, 0, 1, 1,
-1.203526, -0.4049056, -1.184155, 0, 0, 0, 1, 1,
-1.202431, 1.45861, 0.3348204, 0, 0, 0, 1, 1,
-1.201299, 0.7096453, -0.120373, 0, 0, 0, 1, 1,
-1.195698, -0.7581837, -3.195462, 1, 1, 1, 1, 1,
-1.195478, -0.30105, -3.228184, 1, 1, 1, 1, 1,
-1.186043, 2.127833, 1.557153, 1, 1, 1, 1, 1,
-1.182548, -2.103097, -4.500682, 1, 1, 1, 1, 1,
-1.174831, -1.249804, -2.288551, 1, 1, 1, 1, 1,
-1.168699, -0.8603619, -2.244673, 1, 1, 1, 1, 1,
-1.167503, -0.2044553, -2.205576, 1, 1, 1, 1, 1,
-1.167103, 0.208218, -1.90796, 1, 1, 1, 1, 1,
-1.163836, -0.6232436, -2.818601, 1, 1, 1, 1, 1,
-1.153335, -0.2140715, -1.557343, 1, 1, 1, 1, 1,
-1.143167, -0.9255402, -3.231012, 1, 1, 1, 1, 1,
-1.134096, 0.9226635, 0.1341945, 1, 1, 1, 1, 1,
-1.133712, 0.3695662, -1.142195, 1, 1, 1, 1, 1,
-1.13103, 0.3503147, 0.2683946, 1, 1, 1, 1, 1,
-1.130011, -2.378714, -2.409559, 1, 1, 1, 1, 1,
-1.129678, -1.272143, -2.840556, 0, 0, 1, 1, 1,
-1.127153, 0.7762572, -1.222033, 1, 0, 0, 1, 1,
-1.11343, 1.0517, -0.1233961, 1, 0, 0, 1, 1,
-1.111406, 0.4599068, -2.105411, 1, 0, 0, 1, 1,
-1.108688, 0.5210823, -1.041387, 1, 0, 0, 1, 1,
-1.106856, 2.376028, 0.3686375, 1, 0, 0, 1, 1,
-1.104963, 2.656233, -0.549796, 0, 0, 0, 1, 1,
-1.1042, 1.299409, -0.9930202, 0, 0, 0, 1, 1,
-1.10171, -0.2916271, -0.4516659, 0, 0, 0, 1, 1,
-1.099925, 0.08940076, -0.7109579, 0, 0, 0, 1, 1,
-1.098101, 1.25376, -0.8908873, 0, 0, 0, 1, 1,
-1.091773, -0.7292917, -1.489239, 0, 0, 0, 1, 1,
-1.088848, 1.232438, 0.08937844, 0, 0, 0, 1, 1,
-1.085285, 0.1586213, -2.255221, 1, 1, 1, 1, 1,
-1.085181, -0.8821407, -3.654885, 1, 1, 1, 1, 1,
-1.082615, 0.2225745, -2.360598, 1, 1, 1, 1, 1,
-1.081534, 0.9408324, 0.1005486, 1, 1, 1, 1, 1,
-1.081132, 0.02646243, -0.9392995, 1, 1, 1, 1, 1,
-1.072314, 0.2153812, -1.187642, 1, 1, 1, 1, 1,
-1.067717, 0.0007717276, -0.6552286, 1, 1, 1, 1, 1,
-1.059945, 1.103123, -0.06005491, 1, 1, 1, 1, 1,
-1.058114, -0.129113, -0.8445586, 1, 1, 1, 1, 1,
-1.057423, 0.05995567, -2.664165, 1, 1, 1, 1, 1,
-1.050433, -0.3898715, -1.399291, 1, 1, 1, 1, 1,
-1.045309, -0.8715633, -2.058441, 1, 1, 1, 1, 1,
-1.033515, -0.09619613, -2.120997, 1, 1, 1, 1, 1,
-1.031803, 0.4939063, -0.780791, 1, 1, 1, 1, 1,
-1.029422, 0.06933132, -2.40018, 1, 1, 1, 1, 1,
-1.024133, -2.253278, -2.92187, 0, 0, 1, 1, 1,
-1.015965, -0.990863, -0.635482, 1, 0, 0, 1, 1,
-1.015723, 0.9646422, -0.1043326, 1, 0, 0, 1, 1,
-1.010127, -0.6431536, -2.710689, 1, 0, 0, 1, 1,
-1.009793, 0.7907989, 0.81178, 1, 0, 0, 1, 1,
-1.003157, 0.2568754, 0.1853666, 1, 0, 0, 1, 1,
-1.000969, 1.087014, -0.2132478, 0, 0, 0, 1, 1,
-0.9939797, -0.8635949, -2.617627, 0, 0, 0, 1, 1,
-0.9921981, 0.3270242, -3.680411, 0, 0, 0, 1, 1,
-0.9902708, -1.183048, -1.711822, 0, 0, 0, 1, 1,
-0.9837647, 2.071148, -2.323746, 0, 0, 0, 1, 1,
-0.9732168, -0.1359252, -1.90707, 0, 0, 0, 1, 1,
-0.9694502, -1.435269, -3.893007, 0, 0, 0, 1, 1,
-0.9691786, -1.540777, -2.065709, 1, 1, 1, 1, 1,
-0.9670825, -0.9338521, -2.734165, 1, 1, 1, 1, 1,
-0.9664744, 0.3296556, -1.468289, 1, 1, 1, 1, 1,
-0.9614391, -0.4204401, -2.640818, 1, 1, 1, 1, 1,
-0.9591914, 0.5643402, -2.70813, 1, 1, 1, 1, 1,
-0.9454948, 0.5533592, 0.5817274, 1, 1, 1, 1, 1,
-0.9427211, -0.1808693, -2.195782, 1, 1, 1, 1, 1,
-0.942679, -0.1548024, -2.317918, 1, 1, 1, 1, 1,
-0.9390768, -0.9096715, -2.386312, 1, 1, 1, 1, 1,
-0.938377, 0.3433187, -1.557994, 1, 1, 1, 1, 1,
-0.9365033, 0.3781502, -1.972596, 1, 1, 1, 1, 1,
-0.9288084, 0.1850656, -0.006077386, 1, 1, 1, 1, 1,
-0.9253528, -0.627141, -1.830568, 1, 1, 1, 1, 1,
-0.9177389, 0.6260567, 0.2165867, 1, 1, 1, 1, 1,
-0.913084, -1.411389, -4.303871, 1, 1, 1, 1, 1,
-0.9115236, -1.630909, -1.539545, 0, 0, 1, 1, 1,
-0.9082742, -0.2550304, 0.03883832, 1, 0, 0, 1, 1,
-0.9070343, 0.3183061, -2.875654, 1, 0, 0, 1, 1,
-0.9031383, 1.277173, -1.169898, 1, 0, 0, 1, 1,
-0.9013105, 1.139451, -0.3044619, 1, 0, 0, 1, 1,
-0.8974315, 0.2611884, -1.655676, 1, 0, 0, 1, 1,
-0.8943928, -0.09869171, -0.7595676, 0, 0, 0, 1, 1,
-0.8910966, 0.09718721, -3.707317, 0, 0, 0, 1, 1,
-0.889172, 1.160754, 0.3873397, 0, 0, 0, 1, 1,
-0.8859575, 0.8812223, -1.721851, 0, 0, 0, 1, 1,
-0.8829239, -1.15444, -1.602216, 0, 0, 0, 1, 1,
-0.8769643, -1.15193, -2.373712, 0, 0, 0, 1, 1,
-0.8675067, -1.05679, -2.64227, 0, 0, 0, 1, 1,
-0.8618531, 0.8708507, -0.2705066, 1, 1, 1, 1, 1,
-0.8618122, 1.851257, -0.1757425, 1, 1, 1, 1, 1,
-0.8610221, 0.6016399, 0.7977947, 1, 1, 1, 1, 1,
-0.8551186, 0.2470858, -0.8742495, 1, 1, 1, 1, 1,
-0.8499055, -1.608494, -2.060139, 1, 1, 1, 1, 1,
-0.8494687, -1.172796, -2.186495, 1, 1, 1, 1, 1,
-0.8458051, 2.973496, 0.4850663, 1, 1, 1, 1, 1,
-0.8411124, -1.875475, -3.69415, 1, 1, 1, 1, 1,
-0.8391006, -1.01722, -2.495461, 1, 1, 1, 1, 1,
-0.8365121, -1.266265, -2.584056, 1, 1, 1, 1, 1,
-0.8351163, -0.5516384, -3.461983, 1, 1, 1, 1, 1,
-0.8290491, -2.364376, -3.336027, 1, 1, 1, 1, 1,
-0.8212662, 0.6519411, 0.07767344, 1, 1, 1, 1, 1,
-0.8202544, -0.5938822, -3.546513, 1, 1, 1, 1, 1,
-0.818127, -0.0550979, 0.3652723, 1, 1, 1, 1, 1,
-0.8161618, 1.812367, -1.3135, 0, 0, 1, 1, 1,
-0.806949, -0.6047731, -2.696663, 1, 0, 0, 1, 1,
-0.8061185, 1.365465, -1.032591, 1, 0, 0, 1, 1,
-0.8012912, -1.387967, -1.009059, 1, 0, 0, 1, 1,
-0.7997044, -0.3635188, -1.355191, 1, 0, 0, 1, 1,
-0.7951168, -1.984182, -3.789402, 1, 0, 0, 1, 1,
-0.7898072, -1.280681, -0.2827835, 0, 0, 0, 1, 1,
-0.76694, 0.05896276, -3.242889, 0, 0, 0, 1, 1,
-0.7635828, 0.2704617, 1.304847, 0, 0, 0, 1, 1,
-0.7617849, 1.487982, -0.3436781, 0, 0, 0, 1, 1,
-0.7572489, -0.6252497, -1.17246, 0, 0, 0, 1, 1,
-0.752398, -2.114361, -3.138404, 0, 0, 0, 1, 1,
-0.7521893, -0.2442578, -3.911433, 0, 0, 0, 1, 1,
-0.7493948, -0.4196317, -3.584656, 1, 1, 1, 1, 1,
-0.7383901, 0.7174315, -2.518776, 1, 1, 1, 1, 1,
-0.7381069, 0.3357498, -0.7972593, 1, 1, 1, 1, 1,
-0.7367882, 0.07766265, -2.391299, 1, 1, 1, 1, 1,
-0.7353687, -1.552916, -4.319785, 1, 1, 1, 1, 1,
-0.7346835, 0.1497815, -1.898989, 1, 1, 1, 1, 1,
-0.7343913, -0.1858965, 0.5749654, 1, 1, 1, 1, 1,
-0.7288932, -1.840286, -2.410888, 1, 1, 1, 1, 1,
-0.727829, 0.5510713, 0.3571109, 1, 1, 1, 1, 1,
-0.7204229, 0.2946484, -0.6000031, 1, 1, 1, 1, 1,
-0.7162824, -0.7473141, -2.871702, 1, 1, 1, 1, 1,
-0.71589, -1.170326, -3.751371, 1, 1, 1, 1, 1,
-0.7152054, 0.4709304, -2.170668, 1, 1, 1, 1, 1,
-0.7134635, 0.8150393, -0.09653709, 1, 1, 1, 1, 1,
-0.7113197, -2.560445, -3.96175, 1, 1, 1, 1, 1,
-0.7084763, 2.210951, 0.4428851, 0, 0, 1, 1, 1,
-0.7079261, 0.0376049, -2.102259, 1, 0, 0, 1, 1,
-0.7058001, 0.5184166, -2.110099, 1, 0, 0, 1, 1,
-0.7055103, -0.3336904, -2.153451, 1, 0, 0, 1, 1,
-0.6963607, -0.1169407, -1.839835, 1, 0, 0, 1, 1,
-0.6961355, 0.4470849, 0.583957, 1, 0, 0, 1, 1,
-0.6895738, 0.1943244, -1.725184, 0, 0, 0, 1, 1,
-0.6882097, -0.9409229, -0.8815653, 0, 0, 0, 1, 1,
-0.6866924, -1.759923, -2.87579, 0, 0, 0, 1, 1,
-0.6838452, 0.568624, 0.9350885, 0, 0, 0, 1, 1,
-0.6818572, 0.8030474, -0.339327, 0, 0, 0, 1, 1,
-0.6814976, -0.4122629, -1.429579, 0, 0, 0, 1, 1,
-0.6784666, 0.5681598, 0.6076912, 0, 0, 0, 1, 1,
-0.6748079, 1.704077, -1.195581, 1, 1, 1, 1, 1,
-0.674256, -0.3654202, -1.909392, 1, 1, 1, 1, 1,
-0.6722165, -0.5120759, -1.785226, 1, 1, 1, 1, 1,
-0.670728, 0.585418, -1.244474, 1, 1, 1, 1, 1,
-0.6705876, -0.02178306, -1.008651, 1, 1, 1, 1, 1,
-0.6673066, -1.473365, -2.153471, 1, 1, 1, 1, 1,
-0.6649035, 0.9368306, -2.564424, 1, 1, 1, 1, 1,
-0.6646316, 1.212627, -0.6181704, 1, 1, 1, 1, 1,
-0.6613392, -0.04613899, -0.3456786, 1, 1, 1, 1, 1,
-0.6528214, -2.299877, -1.828752, 1, 1, 1, 1, 1,
-0.6439202, -0.3171374, -1.596471, 1, 1, 1, 1, 1,
-0.6391367, 0.4422343, -2.713317, 1, 1, 1, 1, 1,
-0.634087, -2.051934, -2.888042, 1, 1, 1, 1, 1,
-0.6323913, -0.2299707, -4.774493, 1, 1, 1, 1, 1,
-0.6323174, -0.5749567, -3.191778, 1, 1, 1, 1, 1,
-0.6261395, 0.8383018, -0.1813813, 0, 0, 1, 1, 1,
-0.6243273, 1.166524, -0.3131235, 1, 0, 0, 1, 1,
-0.6146834, -0.6917496, -2.821576, 1, 0, 0, 1, 1,
-0.608246, -1.407642, -1.826572, 1, 0, 0, 1, 1,
-0.6053233, 0.7121524, -2.662948, 1, 0, 0, 1, 1,
-0.5961837, -1.33782, -1.671587, 1, 0, 0, 1, 1,
-0.5932658, 0.5551447, 0.6182362, 0, 0, 0, 1, 1,
-0.5918592, 0.2844275, -1.761386, 0, 0, 0, 1, 1,
-0.5890665, -0.9309501, -4.046825, 0, 0, 0, 1, 1,
-0.5862898, -0.4137114, -2.6993, 0, 0, 0, 1, 1,
-0.5825169, 1.441936, -1.170943, 0, 0, 0, 1, 1,
-0.5767792, 0.1205267, -2.81323, 0, 0, 0, 1, 1,
-0.5746575, -0.4241596, -2.11492, 0, 0, 0, 1, 1,
-0.5733196, -0.07014275, -1.429851, 1, 1, 1, 1, 1,
-0.5674753, -1.671715, -0.8220623, 1, 1, 1, 1, 1,
-0.5575279, 0.3124039, -1.14145, 1, 1, 1, 1, 1,
-0.549951, 0.5431098, -1.115835, 1, 1, 1, 1, 1,
-0.5497542, 0.2588187, 0.3272608, 1, 1, 1, 1, 1,
-0.548389, -0.7003009, -2.546649, 1, 1, 1, 1, 1,
-0.5478523, -0.06442522, -0.5703446, 1, 1, 1, 1, 1,
-0.5403679, 0.2661929, -1.450191, 1, 1, 1, 1, 1,
-0.5402144, 1.454215, 0.3155448, 1, 1, 1, 1, 1,
-0.5384201, 0.2521479, 1.50413, 1, 1, 1, 1, 1,
-0.5366684, 0.232677, -3.582832, 1, 1, 1, 1, 1,
-0.5338846, -0.2115519, -1.560112, 1, 1, 1, 1, 1,
-0.5305266, 0.7911893, -1.430388, 1, 1, 1, 1, 1,
-0.5258119, -0.8063868, -2.896683, 1, 1, 1, 1, 1,
-0.5216979, 0.829644, -0.6152575, 1, 1, 1, 1, 1,
-0.5205727, -0.3534211, -1.882907, 0, 0, 1, 1, 1,
-0.517943, 0.7387961, -1.329304, 1, 0, 0, 1, 1,
-0.5175126, -0.8079833, -0.4783984, 1, 0, 0, 1, 1,
-0.5159611, 0.530274, 1.239669, 1, 0, 0, 1, 1,
-0.5150012, -0.1451667, -1.829597, 1, 0, 0, 1, 1,
-0.5135069, 1.566482, -0.4579853, 1, 0, 0, 1, 1,
-0.5071989, 0.8154327, 1.654858, 0, 0, 0, 1, 1,
-0.4991669, 0.6948013, -2.611419, 0, 0, 0, 1, 1,
-0.4936157, 1.351614, -0.9825547, 0, 0, 0, 1, 1,
-0.4898536, 0.2588793, -0.1186684, 0, 0, 0, 1, 1,
-0.4896476, 0.6984735, 0.05769805, 0, 0, 0, 1, 1,
-0.4877628, -0.8177398, -2.999432, 0, 0, 0, 1, 1,
-0.4866529, 1.214313, 0.7754831, 0, 0, 0, 1, 1,
-0.4865206, 0.5687239, -1.069553, 1, 1, 1, 1, 1,
-0.4861267, 0.2532319, -0.7686553, 1, 1, 1, 1, 1,
-0.4861152, -0.3565764, -1.898019, 1, 1, 1, 1, 1,
-0.4852881, -0.4389825, -2.30031, 1, 1, 1, 1, 1,
-0.4814851, 0.6814161, -1.43397, 1, 1, 1, 1, 1,
-0.4786999, -1.701401, -3.303147, 1, 1, 1, 1, 1,
-0.4774461, -1.196311, -2.102531, 1, 1, 1, 1, 1,
-0.474403, 0.1941418, -1.905667, 1, 1, 1, 1, 1,
-0.4743597, -1.338615, -3.801855, 1, 1, 1, 1, 1,
-0.4739728, -0.6976188, -0.9114834, 1, 1, 1, 1, 1,
-0.4732113, -1.504487, -2.863643, 1, 1, 1, 1, 1,
-0.4700931, 0.3412327, -1.281357, 1, 1, 1, 1, 1,
-0.4697004, -0.7991319, -3.411572, 1, 1, 1, 1, 1,
-0.468686, -0.7051871, -2.391147, 1, 1, 1, 1, 1,
-0.4677664, -0.7599759, -1.943323, 1, 1, 1, 1, 1,
-0.4661303, -1.095676, -1.695545, 0, 0, 1, 1, 1,
-0.4651169, 0.274494, -1.676657, 1, 0, 0, 1, 1,
-0.4620367, 0.4345695, -0.9638867, 1, 0, 0, 1, 1,
-0.4611036, 0.01184707, -0.9136564, 1, 0, 0, 1, 1,
-0.4543308, 0.3046166, -0.671535, 1, 0, 0, 1, 1,
-0.4536005, -0.6894083, -0.8413371, 1, 0, 0, 1, 1,
-0.4500006, 0.03509722, -2.286406, 0, 0, 0, 1, 1,
-0.4453467, 0.492683, -0.3098181, 0, 0, 0, 1, 1,
-0.4375176, 0.05676248, -1.955549, 0, 0, 0, 1, 1,
-0.4351921, -1.962674, -3.948603, 0, 0, 0, 1, 1,
-0.4260054, -0.1241098, -0.9979722, 0, 0, 0, 1, 1,
-0.4228553, -0.02495924, -1.625456, 0, 0, 0, 1, 1,
-0.421511, 0.4277736, -2.735002, 0, 0, 0, 1, 1,
-0.4193779, 0.8857055, -1.992616, 1, 1, 1, 1, 1,
-0.4161879, 0.579433, -0.5168712, 1, 1, 1, 1, 1,
-0.4145293, -0.8645369, -1.701474, 1, 1, 1, 1, 1,
-0.4141275, 1.360704, -0.6555767, 1, 1, 1, 1, 1,
-0.4122112, 0.411132, -0.9007356, 1, 1, 1, 1, 1,
-0.4100208, -0.003792836, -0.6544101, 1, 1, 1, 1, 1,
-0.4070835, 0.003881096, -0.6214108, 1, 1, 1, 1, 1,
-0.4009619, -0.4419684, -2.008788, 1, 1, 1, 1, 1,
-0.4008699, -1.32105, -1.435717, 1, 1, 1, 1, 1,
-0.3998032, 0.7572282, -2.601595, 1, 1, 1, 1, 1,
-0.399146, -0.153734, -1.705042, 1, 1, 1, 1, 1,
-0.3953032, -0.3684003, -3.685718, 1, 1, 1, 1, 1,
-0.3943747, -0.5714425, -2.267814, 1, 1, 1, 1, 1,
-0.394125, 0.3855196, -0.7189369, 1, 1, 1, 1, 1,
-0.3912523, -0.5024111, -4.046134, 1, 1, 1, 1, 1,
-0.3903961, 1.441632, 0.1107306, 0, 0, 1, 1, 1,
-0.3898518, -0.1321662, -1.795075, 1, 0, 0, 1, 1,
-0.3891101, -0.6302845, -2.059687, 1, 0, 0, 1, 1,
-0.3871082, -0.1007944, -1.222478, 1, 0, 0, 1, 1,
-0.3806961, -1.622386, -5.162935, 1, 0, 0, 1, 1,
-0.3701256, 1.220702, 0.2546557, 1, 0, 0, 1, 1,
-0.3629684, -0.2645549, -2.295967, 0, 0, 0, 1, 1,
-0.3623406, -0.1863587, -1.874952, 0, 0, 0, 1, 1,
-0.3611354, 0.7208889, 0.4471, 0, 0, 0, 1, 1,
-0.3567078, -1.140783, -2.666906, 0, 0, 0, 1, 1,
-0.3552748, 0.3234617, 0.5767332, 0, 0, 0, 1, 1,
-0.3494576, 0.2465486, -0.7300283, 0, 0, 0, 1, 1,
-0.3482162, -1.346909, -1.920586, 0, 0, 0, 1, 1,
-0.346227, -1.407265, -2.853414, 1, 1, 1, 1, 1,
-0.3407516, 0.4178786, 0.06239728, 1, 1, 1, 1, 1,
-0.3376167, -1.127681, -3.544169, 1, 1, 1, 1, 1,
-0.3375978, 1.076411, 0.4222852, 1, 1, 1, 1, 1,
-0.3368914, -0.3641602, -2.960597, 1, 1, 1, 1, 1,
-0.3352911, -0.9962764, -0.3694451, 1, 1, 1, 1, 1,
-0.3318059, 0.3898282, -1.381487, 1, 1, 1, 1, 1,
-0.3291221, -0.2265159, -3.182087, 1, 1, 1, 1, 1,
-0.325363, -2.87047, -3.052589, 1, 1, 1, 1, 1,
-0.321093, -1.240938, -2.110604, 1, 1, 1, 1, 1,
-0.3137733, 0.6540133, 0.9951035, 1, 1, 1, 1, 1,
-0.3070695, 1.452807, -0.2880417, 1, 1, 1, 1, 1,
-0.3067544, 0.7198788, -1.136678, 1, 1, 1, 1, 1,
-0.3065174, -0.9880511, -2.005906, 1, 1, 1, 1, 1,
-0.3050675, -0.83917, -3.190158, 1, 1, 1, 1, 1,
-0.2969743, -0.7911058, -3.216771, 0, 0, 1, 1, 1,
-0.2736052, -0.3792338, -3.257599, 1, 0, 0, 1, 1,
-0.2727812, 0.4448794, -1.306244, 1, 0, 0, 1, 1,
-0.2715587, 0.107799, -2.676422, 1, 0, 0, 1, 1,
-0.2707551, -0.1054012, -1.263688, 1, 0, 0, 1, 1,
-0.2657955, -1.65834, -2.224955, 1, 0, 0, 1, 1,
-0.2657002, -2.993288, -4.318414, 0, 0, 0, 1, 1,
-0.263707, -1.666128, -1.930072, 0, 0, 0, 1, 1,
-0.2613599, -0.5021005, -4.557512, 0, 0, 0, 1, 1,
-0.2596819, 0.5111376, -0.1087744, 0, 0, 0, 1, 1,
-0.2593343, 0.4724063, -1.054738, 0, 0, 0, 1, 1,
-0.258344, 0.5047379, -1.696426, 0, 0, 0, 1, 1,
-0.2576126, -0.6157256, -1.047972, 0, 0, 0, 1, 1,
-0.2569259, 0.8333781, 0.1675695, 1, 1, 1, 1, 1,
-0.2472634, -0.1519426, -2.304936, 1, 1, 1, 1, 1,
-0.2387905, -0.3180048, -4.428987, 1, 1, 1, 1, 1,
-0.2380627, -0.3058076, -3.419145, 1, 1, 1, 1, 1,
-0.2324937, -1.086209, -2.684001, 1, 1, 1, 1, 1,
-0.2322444, -1.198312, -4.746548, 1, 1, 1, 1, 1,
-0.2280387, 0.4385985, -0.5516807, 1, 1, 1, 1, 1,
-0.2254591, 0.0409144, -1.550437, 1, 1, 1, 1, 1,
-0.2250082, -0.3546438, -3.007273, 1, 1, 1, 1, 1,
-0.2240287, 1.223938, 1.367646, 1, 1, 1, 1, 1,
-0.2209024, 0.9148887, 0.1504112, 1, 1, 1, 1, 1,
-0.220019, -0.2323957, -2.55437, 1, 1, 1, 1, 1,
-0.2154101, 0.1645133, -0.2662697, 1, 1, 1, 1, 1,
-0.2150994, -1.512674, -3.491578, 1, 1, 1, 1, 1,
-0.2134334, 0.04931142, -1.930934, 1, 1, 1, 1, 1,
-0.2134117, -1.144921, -4.17953, 0, 0, 1, 1, 1,
-0.2049446, 0.5480326, -0.7482933, 1, 0, 0, 1, 1,
-0.2040984, -0.01282505, 0.1997326, 1, 0, 0, 1, 1,
-0.1997289, -1.215183, -3.555696, 1, 0, 0, 1, 1,
-0.1932093, -0.9564339, -2.194737, 1, 0, 0, 1, 1,
-0.1931512, 0.8194965, 1.52351, 1, 0, 0, 1, 1,
-0.191013, -1.120437, -2.486698, 0, 0, 0, 1, 1,
-0.188006, 0.773847, 0.5113686, 0, 0, 0, 1, 1,
-0.1867368, -0.2485329, -2.010924, 0, 0, 0, 1, 1,
-0.1798389, 0.04674471, -1.137004, 0, 0, 0, 1, 1,
-0.1794349, -0.7902212, -3.034463, 0, 0, 0, 1, 1,
-0.1766306, 0.9141573, -0.1154891, 0, 0, 0, 1, 1,
-0.1763914, -0.1290439, -1.968657, 0, 0, 0, 1, 1,
-0.1723287, -1.461197, -3.774916, 1, 1, 1, 1, 1,
-0.1721848, -0.1814801, -2.541975, 1, 1, 1, 1, 1,
-0.1713113, -0.7280803, -3.911886, 1, 1, 1, 1, 1,
-0.1664571, 0.4670614, -0.8288229, 1, 1, 1, 1, 1,
-0.1658397, -0.8903907, -2.797063, 1, 1, 1, 1, 1,
-0.1648788, -0.9252812, -3.407522, 1, 1, 1, 1, 1,
-0.1643603, -0.7283579, -3.257879, 1, 1, 1, 1, 1,
-0.1633394, 0.7475286, 0.358295, 1, 1, 1, 1, 1,
-0.1592523, -0.1903607, -0.7681079, 1, 1, 1, 1, 1,
-0.1557535, 0.6222034, 0.432236, 1, 1, 1, 1, 1,
-0.1514448, 1.561269, 1.097635, 1, 1, 1, 1, 1,
-0.1512123, 0.09828001, -2.773766, 1, 1, 1, 1, 1,
-0.1430878, 0.7559155, 0.451563, 1, 1, 1, 1, 1,
-0.1417425, -0.1005566, -1.935776, 1, 1, 1, 1, 1,
-0.1413737, -0.7240316, -1.855271, 1, 1, 1, 1, 1,
-0.1311721, 1.117498, 0.7953596, 0, 0, 1, 1, 1,
-0.1286922, 0.9956322, 0.7317968, 1, 0, 0, 1, 1,
-0.1282951, 0.3748812, -0.3256018, 1, 0, 0, 1, 1,
-0.1278925, 0.3155929, -1.416002, 1, 0, 0, 1, 1,
-0.1203583, 0.8425231, -0.504391, 1, 0, 0, 1, 1,
-0.1189695, -0.4868922, -3.355059, 1, 0, 0, 1, 1,
-0.1121028, 0.5109001, -0.3245334, 0, 0, 0, 1, 1,
-0.1113853, 1.632914, 0.1124308, 0, 0, 0, 1, 1,
-0.1102089, 1.017641, 0.9642186, 0, 0, 0, 1, 1,
-0.109037, 0.7831843, -0.07470561, 0, 0, 0, 1, 1,
-0.1089213, -0.166157, -5.356915, 0, 0, 0, 1, 1,
-0.1061742, 0.8590683, -0.5582687, 0, 0, 0, 1, 1,
-0.1028817, -0.06995878, -3.152777, 0, 0, 0, 1, 1,
-0.1027743, 0.06216341, -2.412372, 1, 1, 1, 1, 1,
-0.09741034, 0.5743389, -0.6170071, 1, 1, 1, 1, 1,
-0.093987, -0.248116, -1.923727, 1, 1, 1, 1, 1,
-0.09231243, 1.003193, -2.318194, 1, 1, 1, 1, 1,
-0.0889764, 0.07100841, -1.847496, 1, 1, 1, 1, 1,
-0.08890605, -0.3465539, -2.759615, 1, 1, 1, 1, 1,
-0.07510652, -2.076373, -3.635499, 1, 1, 1, 1, 1,
-0.07377546, -0.2074019, -4.134721, 1, 1, 1, 1, 1,
-0.07371078, -1.054039, -1.606843, 1, 1, 1, 1, 1,
-0.07171164, 0.2101494, -1.504703, 1, 1, 1, 1, 1,
-0.06997047, -0.296187, -3.969146, 1, 1, 1, 1, 1,
-0.06753913, -0.1362954, -3.280993, 1, 1, 1, 1, 1,
-0.06159092, 0.05013273, -2.331432, 1, 1, 1, 1, 1,
-0.05660518, 0.2356266, 0.4709541, 1, 1, 1, 1, 1,
-0.05633118, 0.9400535, 0.2842517, 1, 1, 1, 1, 1,
-0.05468329, 0.08385912, 0.1303044, 0, 0, 1, 1, 1,
-0.04930629, 0.6522292, 0.05964935, 1, 0, 0, 1, 1,
-0.042804, -0.5149946, -3.4029, 1, 0, 0, 1, 1,
-0.04243789, 0.4746302, 1.346001, 1, 0, 0, 1, 1,
-0.04152552, 0.3022945, 0.0544232, 1, 0, 0, 1, 1,
-0.03729076, 0.222427, 0.3252536, 1, 0, 0, 1, 1,
-0.03623893, 0.07301247, -1.303798, 0, 0, 0, 1, 1,
-0.03158751, -0.2222306, -2.827796, 0, 0, 0, 1, 1,
-0.0282497, 0.09367041, -0.5614856, 0, 0, 0, 1, 1,
-0.02231035, -1.965115, -2.410234, 0, 0, 0, 1, 1,
-0.02196397, -0.2105649, -1.854749, 0, 0, 0, 1, 1,
-0.02137868, 0.3249184, -0.4041609, 0, 0, 0, 1, 1,
-0.01871199, -0.5671934, -2.551376, 0, 0, 0, 1, 1,
-0.01514551, 1.13261, -0.1559871, 1, 1, 1, 1, 1,
-0.0128889, -0.5231776, -3.723163, 1, 1, 1, 1, 1,
-0.01001606, 0.8789188, 0.5140933, 1, 1, 1, 1, 1,
-0.005524895, -0.01488561, -2.745093, 1, 1, 1, 1, 1,
-0.002909632, -0.6299803, -3.883379, 1, 1, 1, 1, 1,
-0.002655401, -0.2815129, -2.807858, 1, 1, 1, 1, 1,
-0.0002880486, 0.05177709, 2.285554, 1, 1, 1, 1, 1,
-5.983201e-05, 0.6669443, -1.081851, 1, 1, 1, 1, 1,
0.001564818, 0.4853707, -1.332338, 1, 1, 1, 1, 1,
0.002661783, -0.09635988, 3.592489, 1, 1, 1, 1, 1,
0.003035264, 0.7307855, 0.2088957, 1, 1, 1, 1, 1,
0.00440989, 0.9808057, -0.3733709, 1, 1, 1, 1, 1,
0.005134884, -0.03945545, 3.707912, 1, 1, 1, 1, 1,
0.006028483, -0.4570879, 2.723541, 1, 1, 1, 1, 1,
0.006088586, -0.6346693, 1.379819, 1, 1, 1, 1, 1,
0.008805523, 0.16608, -0.3605605, 0, 0, 1, 1, 1,
0.01396062, 0.8494695, -1.230565, 1, 0, 0, 1, 1,
0.01481127, 0.3303031, -1.280839, 1, 0, 0, 1, 1,
0.01867506, -0.4512694, 2.451385, 1, 0, 0, 1, 1,
0.02095776, 1.016386, 0.8300835, 1, 0, 0, 1, 1,
0.02279786, -0.2318878, 2.120043, 1, 0, 0, 1, 1,
0.02455514, 1.385997, -0.1402539, 0, 0, 0, 1, 1,
0.03219999, -0.2770803, 1.74707, 0, 0, 0, 1, 1,
0.03419879, 2.462348, 0.8784433, 0, 0, 0, 1, 1,
0.03582309, 1.13695, 0.5342059, 0, 0, 0, 1, 1,
0.03696291, -1.632401, 2.556104, 0, 0, 0, 1, 1,
0.03980919, 0.3764392, -0.6436539, 0, 0, 0, 1, 1,
0.04029875, -0.09067491, 2.808547, 0, 0, 0, 1, 1,
0.04063648, 0.1243487, 1.67294, 1, 1, 1, 1, 1,
0.04064495, 0.5783098, 1.210941, 1, 1, 1, 1, 1,
0.04070929, -1.359181, 4.141161, 1, 1, 1, 1, 1,
0.04152443, 0.7349212, 0.9315547, 1, 1, 1, 1, 1,
0.04552626, 0.6786535, 1.898441, 1, 1, 1, 1, 1,
0.04676871, 2.868361, 0.4788614, 1, 1, 1, 1, 1,
0.04786799, 0.3975511, 0.4626212, 1, 1, 1, 1, 1,
0.0500891, -0.3958681, 4.79934, 1, 1, 1, 1, 1,
0.05057669, 0.7829459, 2.131465, 1, 1, 1, 1, 1,
0.06371448, -0.01783672, 3.108226, 1, 1, 1, 1, 1,
0.06470307, 0.4549706, -0.7399234, 1, 1, 1, 1, 1,
0.06562337, 0.3449997, -1.385158, 1, 1, 1, 1, 1,
0.06751868, 1.908411, 0.3319902, 1, 1, 1, 1, 1,
0.07372506, -1.215678, 3.862825, 1, 1, 1, 1, 1,
0.07433937, 1.19763, -1.502001, 1, 1, 1, 1, 1,
0.07524369, 0.4172989, -0.1535226, 0, 0, 1, 1, 1,
0.07748526, 0.2425935, 0.7409217, 1, 0, 0, 1, 1,
0.07784079, -1.35402, 2.059138, 1, 0, 0, 1, 1,
0.08025318, 0.6530405, 1.018976, 1, 0, 0, 1, 1,
0.08286154, -0.2604936, 3.109734, 1, 0, 0, 1, 1,
0.09952534, 0.1980999, -0.1907486, 1, 0, 0, 1, 1,
0.1025163, -0.4562726, 1.902333, 0, 0, 0, 1, 1,
0.1027716, -0.2041445, 1.608554, 0, 0, 0, 1, 1,
0.1032001, -0.5648911, 2.197721, 0, 0, 0, 1, 1,
0.1061145, -0.03272687, 2.153592, 0, 0, 0, 1, 1,
0.1075678, 1.168391, -0.368092, 0, 0, 0, 1, 1,
0.1112131, 2.020122, 1.147433, 0, 0, 0, 1, 1,
0.1120818, -0.1340706, 1.520498, 0, 0, 0, 1, 1,
0.1124955, 0.8746827, -0.1135716, 1, 1, 1, 1, 1,
0.1160372, -2.345837, 2.31637, 1, 1, 1, 1, 1,
0.1177474, 0.38373, -1.534777, 1, 1, 1, 1, 1,
0.1185667, -0.3927203, 5.051503, 1, 1, 1, 1, 1,
0.1207155, -0.03477976, 0.3145316, 1, 1, 1, 1, 1,
0.121528, 0.5525722, 0.3154041, 1, 1, 1, 1, 1,
0.1220844, 0.7516001, -0.7837248, 1, 1, 1, 1, 1,
0.1221825, 1.098947, 1.308864, 1, 1, 1, 1, 1,
0.1272419, -1.358995, 2.343117, 1, 1, 1, 1, 1,
0.1303635, -0.6241856, 1.805305, 1, 1, 1, 1, 1,
0.1344203, -1.313418, 3.226885, 1, 1, 1, 1, 1,
0.1344328, 1.451551, -0.5750395, 1, 1, 1, 1, 1,
0.1381264, -1.560221, 3.133513, 1, 1, 1, 1, 1,
0.1396599, 0.8230041, 1.006541, 1, 1, 1, 1, 1,
0.1492348, -1.013802, 1.46491, 1, 1, 1, 1, 1,
0.1514343, -1.496472, 5.720785, 0, 0, 1, 1, 1,
0.1525565, 1.540253, 0.5165028, 1, 0, 0, 1, 1,
0.1546162, 0.5627937, 0.1960193, 1, 0, 0, 1, 1,
0.1558473, 0.1426118, 1.972932, 1, 0, 0, 1, 1,
0.1595503, 0.5598727, -0.3045702, 1, 0, 0, 1, 1,
0.1619365, 1.099021, 0.1074162, 1, 0, 0, 1, 1,
0.1646065, 0.4307638, 2.071019, 0, 0, 0, 1, 1,
0.1650402, 0.2373073, -0.7078032, 0, 0, 0, 1, 1,
0.1686712, 1.358139, -0.7815384, 0, 0, 0, 1, 1,
0.1709634, -1.474344, 3.400765, 0, 0, 0, 1, 1,
0.1739833, 0.04001626, 1.572039, 0, 0, 0, 1, 1,
0.1742858, 0.628009, -1.233486, 0, 0, 0, 1, 1,
0.1751137, -0.9068938, 2.702043, 0, 0, 0, 1, 1,
0.1752885, 0.3938121, 0.02895803, 1, 1, 1, 1, 1,
0.1756274, 1.286829, -0.6246542, 1, 1, 1, 1, 1,
0.1757784, 0.6519318, -0.6667253, 1, 1, 1, 1, 1,
0.178005, -0.2034816, 3.274027, 1, 1, 1, 1, 1,
0.1787863, -0.8335813, 2.362179, 1, 1, 1, 1, 1,
0.1791242, -1.381474, 3.173445, 1, 1, 1, 1, 1,
0.1795938, 1.305246, 1.017043, 1, 1, 1, 1, 1,
0.1801863, -0.566153, 2.93097, 1, 1, 1, 1, 1,
0.1813986, 0.2503451, 0.1519797, 1, 1, 1, 1, 1,
0.1862, 0.9352058, 1.606576, 1, 1, 1, 1, 1,
0.1866835, -1.587124, 2.438399, 1, 1, 1, 1, 1,
0.1903702, -0.3461042, 1.771267, 1, 1, 1, 1, 1,
0.1906343, -0.08553175, 1.490556, 1, 1, 1, 1, 1,
0.1909812, 0.5940977, 0.5342243, 1, 1, 1, 1, 1,
0.1934039, 0.6759847, 0.3852778, 1, 1, 1, 1, 1,
0.1944261, -0.4877838, 2.543857, 0, 0, 1, 1, 1,
0.1974993, -0.5708539, 2.728083, 1, 0, 0, 1, 1,
0.1981371, -0.3392899, 2.650045, 1, 0, 0, 1, 1,
0.1982719, 0.5897095, 0.5352854, 1, 0, 0, 1, 1,
0.198907, 2.495722, 0.1842143, 1, 0, 0, 1, 1,
0.2019915, 0.1298885, 1.758317, 1, 0, 0, 1, 1,
0.2086973, 0.5383558, 0.1556797, 0, 0, 0, 1, 1,
0.208793, -0.2031378, 2.777554, 0, 0, 0, 1, 1,
0.2121843, -0.3481968, 2.643497, 0, 0, 0, 1, 1,
0.213984, -1.23209, 2.343884, 0, 0, 0, 1, 1,
0.222831, 1.44788, 1.832502, 0, 0, 0, 1, 1,
0.2277064, 0.4944171, 1.487679, 0, 0, 0, 1, 1,
0.2277272, -0.0486517, 1.825535, 0, 0, 0, 1, 1,
0.2296238, 1.354902, 0.8316265, 1, 1, 1, 1, 1,
0.2318069, 0.1418727, 1.181251, 1, 1, 1, 1, 1,
0.2377031, -1.774311, 2.511869, 1, 1, 1, 1, 1,
0.238706, -0.3500646, 1.631657, 1, 1, 1, 1, 1,
0.2434053, 1.634814, -0.6778018, 1, 1, 1, 1, 1,
0.2526832, -0.5682848, 4.02529, 1, 1, 1, 1, 1,
0.2547554, 0.5784428, -0.3732195, 1, 1, 1, 1, 1,
0.2558957, -0.2755036, 4.257327, 1, 1, 1, 1, 1,
0.2574704, 0.529851, 0.2365274, 1, 1, 1, 1, 1,
0.2578037, -0.9541007, 4.637065, 1, 1, 1, 1, 1,
0.2595762, 0.8640157, 0.6921372, 1, 1, 1, 1, 1,
0.259683, 1.237013, -1.503186, 1, 1, 1, 1, 1,
0.2618137, 1.155801, 0.4381815, 1, 1, 1, 1, 1,
0.262642, -1.388776, 2.088722, 1, 1, 1, 1, 1,
0.2676347, 0.7773134, 0.4761558, 1, 1, 1, 1, 1,
0.2677267, -0.7095455, 4.359436, 0, 0, 1, 1, 1,
0.2686217, -1.219185, 2.84803, 1, 0, 0, 1, 1,
0.2752196, -0.126479, 1.875273, 1, 0, 0, 1, 1,
0.2767677, -0.932207, 2.27936, 1, 0, 0, 1, 1,
0.2786597, 0.005119053, 2.201148, 1, 0, 0, 1, 1,
0.2789784, 1.84306, -0.1772311, 1, 0, 0, 1, 1,
0.2828765, 0.05222372, 2.214577, 0, 0, 0, 1, 1,
0.286592, -0.6892202, 1.114312, 0, 0, 0, 1, 1,
0.2881728, -0.7612091, 4.445032, 0, 0, 0, 1, 1,
0.2893794, 0.6938922, 0.7815509, 0, 0, 0, 1, 1,
0.2903431, 1.823343, 2.824903, 0, 0, 0, 1, 1,
0.2923354, -0.258138, 0.3303302, 0, 0, 0, 1, 1,
0.2932796, -0.7525479, 2.999201, 0, 0, 0, 1, 1,
0.2937582, 0.8167993, 0.9739796, 1, 1, 1, 1, 1,
0.2939399, -0.9862597, 2.266587, 1, 1, 1, 1, 1,
0.2944769, -0.2779317, 3.713663, 1, 1, 1, 1, 1,
0.2958217, -1.099686, 2.98171, 1, 1, 1, 1, 1,
0.3028728, 0.4764581, -0.7333902, 1, 1, 1, 1, 1,
0.304946, 0.5572964, 0.0913285, 1, 1, 1, 1, 1,
0.305541, -0.3915951, 1.958656, 1, 1, 1, 1, 1,
0.3128682, 0.7548206, -0.777254, 1, 1, 1, 1, 1,
0.3138429, -1.261305, 3.788567, 1, 1, 1, 1, 1,
0.313908, 0.9775486, 1.478009, 1, 1, 1, 1, 1,
0.3164508, 0.07049911, 0.6570498, 1, 1, 1, 1, 1,
0.3186438, -0.7537376, 2.159006, 1, 1, 1, 1, 1,
0.3186564, 1.118183, 1.232646, 1, 1, 1, 1, 1,
0.3214293, 0.715121, 1.116258, 1, 1, 1, 1, 1,
0.3215357, -0.1830261, 2.498524, 1, 1, 1, 1, 1,
0.3312007, -0.630594, 3.240065, 0, 0, 1, 1, 1,
0.3317792, -0.09054302, 3.331498, 1, 0, 0, 1, 1,
0.3355724, -0.7404144, 3.071549, 1, 0, 0, 1, 1,
0.3392898, -1.501005, 3.625001, 1, 0, 0, 1, 1,
0.3399552, 0.2835645, 1.05681, 1, 0, 0, 1, 1,
0.3432037, -0.07387992, 1.252348, 1, 0, 0, 1, 1,
0.3440712, 0.2290822, 0.09718069, 0, 0, 0, 1, 1,
0.3447021, 0.7858047, 1.667328, 0, 0, 0, 1, 1,
0.3460328, -1.434298, 2.000046, 0, 0, 0, 1, 1,
0.3523473, -0.3911577, 3.711179, 0, 0, 0, 1, 1,
0.3569688, 1.117544, 0.5374662, 0, 0, 0, 1, 1,
0.3587774, 0.2088283, 0.7135814, 0, 0, 0, 1, 1,
0.3595842, 1.283275, -0.02511063, 0, 0, 0, 1, 1,
0.3781608, -0.5489286, 2.546135, 1, 1, 1, 1, 1,
0.3784981, 0.3971589, 3.007451, 1, 1, 1, 1, 1,
0.3789575, -0.9604984, -0.4628899, 1, 1, 1, 1, 1,
0.3856649, 0.5899426, 0.2883374, 1, 1, 1, 1, 1,
0.3880157, -1.135426, 3.038986, 1, 1, 1, 1, 1,
0.3996801, -0.4393892, 1.710553, 1, 1, 1, 1, 1,
0.4020618, -0.07447991, 2.381414, 1, 1, 1, 1, 1,
0.407032, -0.8208732, 4.679957, 1, 1, 1, 1, 1,
0.4088373, -0.2324271, 1.117949, 1, 1, 1, 1, 1,
0.4138338, -2.271387, 2.97865, 1, 1, 1, 1, 1,
0.4228942, -0.2457707, 1.853967, 1, 1, 1, 1, 1,
0.4252975, -0.3345807, 1.598311, 1, 1, 1, 1, 1,
0.4263138, -0.2600988, 1.278194, 1, 1, 1, 1, 1,
0.4265109, 0.3457507, 0.8858435, 1, 1, 1, 1, 1,
0.430585, 1.474549, -0.148571, 1, 1, 1, 1, 1,
0.4329506, -0.3980197, 0.8914431, 0, 0, 1, 1, 1,
0.4340429, 0.4103241, 1.312547, 1, 0, 0, 1, 1,
0.4384681, -1.419856, 2.061004, 1, 0, 0, 1, 1,
0.4411705, -0.9860638, 3.716358, 1, 0, 0, 1, 1,
0.4421199, -0.8916568, 3.435762, 1, 0, 0, 1, 1,
0.4425929, 0.1471291, 1.653008, 1, 0, 0, 1, 1,
0.4442167, 1.241853, 0.3251866, 0, 0, 0, 1, 1,
0.4454121, 0.6082705, -0.5574067, 0, 0, 0, 1, 1,
0.4459338, 0.3933848, 0.1247493, 0, 0, 0, 1, 1,
0.4480474, -1.370961, 3.581072, 0, 0, 0, 1, 1,
0.4488724, 0.6130005, 0.8590067, 0, 0, 0, 1, 1,
0.4564362, -0.9230593, 3.2086, 0, 0, 0, 1, 1,
0.4565853, -1.960531, 3.128036, 0, 0, 0, 1, 1,
0.4575217, -0.5485501, 1.230583, 1, 1, 1, 1, 1,
0.4578624, 1.560378, 0.3363162, 1, 1, 1, 1, 1,
0.4597403, -0.001191142, 1.611923, 1, 1, 1, 1, 1,
0.4643872, 0.6764135, 0.6104458, 1, 1, 1, 1, 1,
0.4654635, -0.5221678, 4.445847, 1, 1, 1, 1, 1,
0.4680151, 0.5303705, 1.19028, 1, 1, 1, 1, 1,
0.4698144, 0.2366723, 2.720151, 1, 1, 1, 1, 1,
0.4743459, -1.316229, 2.988032, 1, 1, 1, 1, 1,
0.4772836, 1.556278, 0.8932623, 1, 1, 1, 1, 1,
0.4792808, 0.1404172, 0.5422548, 1, 1, 1, 1, 1,
0.4864196, -1.144098, 4.018054, 1, 1, 1, 1, 1,
0.4872753, 1.086256, 1.120046, 1, 1, 1, 1, 1,
0.488509, 1.583309, -0.4299655, 1, 1, 1, 1, 1,
0.4952567, -0.2091011, 2.81862, 1, 1, 1, 1, 1,
0.5034811, 0.3113488, 1.54051, 1, 1, 1, 1, 1,
0.5048859, -1.288726, 2.737377, 0, 0, 1, 1, 1,
0.5124379, 1.864746, 0.1446183, 1, 0, 0, 1, 1,
0.5133172, -0.4674771, 1.969238, 1, 0, 0, 1, 1,
0.5161059, -1.679624, 4.31069, 1, 0, 0, 1, 1,
0.519336, -0.8901454, 1.627201, 1, 0, 0, 1, 1,
0.5202972, 1.886869, -1.048119, 1, 0, 0, 1, 1,
0.5225023, -1.560307, 3.292856, 0, 0, 0, 1, 1,
0.5230911, -1.224478, 2.378072, 0, 0, 0, 1, 1,
0.5245376, 0.6709434, 1.276588, 0, 0, 0, 1, 1,
0.5257125, 1.077673, -0.3118077, 0, 0, 0, 1, 1,
0.5258874, -2.056565, 2.3587, 0, 0, 0, 1, 1,
0.5323107, 0.2471431, 2.018853, 0, 0, 0, 1, 1,
0.532897, 0.1835103, 0.74977, 0, 0, 0, 1, 1,
0.5362289, -0.1815474, 1.481651, 1, 1, 1, 1, 1,
0.5384253, 1.093671, 1.264506, 1, 1, 1, 1, 1,
0.5386719, -0.1703434, 1.880525, 1, 1, 1, 1, 1,
0.5391167, -1.3767, 2.976787, 1, 1, 1, 1, 1,
0.5444682, -0.01989676, 1.189698, 1, 1, 1, 1, 1,
0.5454305, 0.2896086, 0.2610757, 1, 1, 1, 1, 1,
0.5491747, 0.3990595, 0.5152046, 1, 1, 1, 1, 1,
0.5509485, 0.6093031, 1.786784, 1, 1, 1, 1, 1,
0.5536535, 1.052696, -0.193456, 1, 1, 1, 1, 1,
0.5683955, 2.98236, -1.380977, 1, 1, 1, 1, 1,
0.5765719, 0.1530979, 1.056777, 1, 1, 1, 1, 1,
0.583891, -0.7148369, 1.941977, 1, 1, 1, 1, 1,
0.5862496, 1.042051, 0.2892496, 1, 1, 1, 1, 1,
0.5867347, 0.5782042, 1.078638, 1, 1, 1, 1, 1,
0.5882877, -0.1381549, 2.563883, 1, 1, 1, 1, 1,
0.5892884, 0.4020334, 1.723028, 0, 0, 1, 1, 1,
0.594687, -0.6430222, 1.118, 1, 0, 0, 1, 1,
0.5954754, 0.09218946, 0.3358732, 1, 0, 0, 1, 1,
0.5959951, -0.4144244, 2.236415, 1, 0, 0, 1, 1,
0.6001152, -0.3044429, 2.784925, 1, 0, 0, 1, 1,
0.6032971, 0.4603761, 1.977392, 1, 0, 0, 1, 1,
0.6054793, 0.5078706, 1.727963, 0, 0, 0, 1, 1,
0.607357, 1.175017, 0.3675234, 0, 0, 0, 1, 1,
0.6164511, -0.5441165, 3.180104, 0, 0, 0, 1, 1,
0.6168365, 1.646758, 1.06533, 0, 0, 0, 1, 1,
0.618507, -0.2837668, 2.186538, 0, 0, 0, 1, 1,
0.6250096, 0.5065069, 0.7025653, 0, 0, 0, 1, 1,
0.6282932, -0.2420384, 1.765317, 0, 0, 0, 1, 1,
0.6296642, 1.121337, -0.1254177, 1, 1, 1, 1, 1,
0.632363, -0.4555154, 0.6982378, 1, 1, 1, 1, 1,
0.640829, 1.252035, 0.2103956, 1, 1, 1, 1, 1,
0.6467523, 0.06893909, 0.3773783, 1, 1, 1, 1, 1,
0.6511042, -0.6917804, 2.280363, 1, 1, 1, 1, 1,
0.6591005, 0.7113193, 1.368052, 1, 1, 1, 1, 1,
0.6596354, 2.587532, -0.2105355, 1, 1, 1, 1, 1,
0.660578, 0.9323225, 0.1544955, 1, 1, 1, 1, 1,
0.6624838, -1.892391, 3.634631, 1, 1, 1, 1, 1,
0.6639106, 1.317428, 0.4719506, 1, 1, 1, 1, 1,
0.67119, -0.2101462, 0.549431, 1, 1, 1, 1, 1,
0.6764225, 0.8791857, 1.872131, 1, 1, 1, 1, 1,
0.6770508, 0.2214605, -0.239039, 1, 1, 1, 1, 1,
0.6787903, -1.031818, 3.394582, 1, 1, 1, 1, 1,
0.6805789, -0.4956912, 1.897893, 1, 1, 1, 1, 1,
0.6818307, -0.3805147, 1.32512, 0, 0, 1, 1, 1,
0.6910719, -0.9056873, 2.338107, 1, 0, 0, 1, 1,
0.6917706, -0.6598374, 2.125739, 1, 0, 0, 1, 1,
0.6945214, 0.466984, 1.174006, 1, 0, 0, 1, 1,
0.7068106, -0.4902984, 2.806413, 1, 0, 0, 1, 1,
0.7098749, 1.265397, -1.15618, 1, 0, 0, 1, 1,
0.7100604, -0.4315918, 1.046757, 0, 0, 0, 1, 1,
0.7124991, 0.7641082, 0.4014257, 0, 0, 0, 1, 1,
0.7127843, -1.970232, 0.3142401, 0, 0, 0, 1, 1,
0.7231386, 1.41121, 0.4976828, 0, 0, 0, 1, 1,
0.7287537, 0.4892394, 1.594684, 0, 0, 0, 1, 1,
0.7357175, -0.3688108, 2.691854, 0, 0, 0, 1, 1,
0.7395328, -0.3253368, 2.934701, 0, 0, 0, 1, 1,
0.7406361, 0.3947267, 0.7549639, 1, 1, 1, 1, 1,
0.7431918, 0.7081572, 0.5330144, 1, 1, 1, 1, 1,
0.7436767, -0.8583239, 2.715745, 1, 1, 1, 1, 1,
0.7439495, -0.7965462, 2.500829, 1, 1, 1, 1, 1,
0.7440426, -0.7175898, 1.031145, 1, 1, 1, 1, 1,
0.7448988, -0.4312558, 1.21455, 1, 1, 1, 1, 1,
0.748579, 0.4274369, 1.59423, 1, 1, 1, 1, 1,
0.7490639, -0.06172805, 2.088581, 1, 1, 1, 1, 1,
0.750858, -0.3948487, 3.652195, 1, 1, 1, 1, 1,
0.751023, -0.2081545, 2.308709, 1, 1, 1, 1, 1,
0.7564141, 0.8565636, -0.3502135, 1, 1, 1, 1, 1,
0.7655901, -0.7722765, 2.92011, 1, 1, 1, 1, 1,
0.7679868, -0.3267569, 2.296602, 1, 1, 1, 1, 1,
0.7752842, -0.8181652, 2.420305, 1, 1, 1, 1, 1,
0.7753596, -1.05981, 2.262076, 1, 1, 1, 1, 1,
0.7835977, 0.1855615, 1.082082, 0, 0, 1, 1, 1,
0.7898095, -0.9056345, 2.168232, 1, 0, 0, 1, 1,
0.7977316, -1.135664, 1.893056, 1, 0, 0, 1, 1,
0.7982698, -0.09773001, 1.201678, 1, 0, 0, 1, 1,
0.7989362, 0.2312994, 0.7520863, 1, 0, 0, 1, 1,
0.8107455, -0.8601003, 3.12632, 1, 0, 0, 1, 1,
0.8108485, 0.5913066, 0.165959, 0, 0, 0, 1, 1,
0.8154667, -0.6802564, 2.483208, 0, 0, 0, 1, 1,
0.8175749, -0.2077511, 1.124882, 0, 0, 0, 1, 1,
0.821037, -0.5290448, 2.676498, 0, 0, 0, 1, 1,
0.8214411, -1.504078, 1.816895, 0, 0, 0, 1, 1,
0.8234877, 1.170781, 0.8789263, 0, 0, 0, 1, 1,
0.8256152, -1.794386, 1.831587, 0, 0, 0, 1, 1,
0.8353273, -1.385607, 1.39857, 1, 1, 1, 1, 1,
0.8369855, 0.4987773, 0.8241352, 1, 1, 1, 1, 1,
0.8418168, 0.7823324, 1.866207, 1, 1, 1, 1, 1,
0.8487169, -0.2678626, 3.006304, 1, 1, 1, 1, 1,
0.8493385, 0.8362529, 1.03232, 1, 1, 1, 1, 1,
0.8520012, 2.202656, 1.237153, 1, 1, 1, 1, 1,
0.8534425, -0.3989021, 1.709969, 1, 1, 1, 1, 1,
0.8590879, -0.3341593, 0.6853951, 1, 1, 1, 1, 1,
0.8685077, 1.524115, 0.7893122, 1, 1, 1, 1, 1,
0.8689778, 0.612607, 0.4074666, 1, 1, 1, 1, 1,
0.8707022, -0.3833777, 2.533276, 1, 1, 1, 1, 1,
0.8727006, -0.8025347, 3.928707, 1, 1, 1, 1, 1,
0.8743817, 0.03326872, 1.726887, 1, 1, 1, 1, 1,
0.8804896, 0.08156547, 1.430117, 1, 1, 1, 1, 1,
0.8847328, -0.1344166, 2.543647, 1, 1, 1, 1, 1,
0.8896785, -1.408289, 2.991758, 0, 0, 1, 1, 1,
0.8903183, -0.9901913, 2.215929, 1, 0, 0, 1, 1,
0.8996617, -0.7390009, 0.2339035, 1, 0, 0, 1, 1,
0.9000289, 0.2092996, 2.787628, 1, 0, 0, 1, 1,
0.9000573, 0.1688958, 3.116257, 1, 0, 0, 1, 1,
0.9092888, -0.7807528, 1.365995, 1, 0, 0, 1, 1,
0.9123096, -1.438914, 2.400121, 0, 0, 0, 1, 1,
0.9245642, 0.3530901, 1.137863, 0, 0, 0, 1, 1,
0.9254086, -0.6596789, 2.474474, 0, 0, 0, 1, 1,
0.9281774, -1.012459, 3.256332, 0, 0, 0, 1, 1,
0.9303371, 0.5709942, 0.9674731, 0, 0, 0, 1, 1,
0.9347645, 0.9773884, 1.830319, 0, 0, 0, 1, 1,
0.9351516, 0.8224214, 1.923843, 0, 0, 0, 1, 1,
0.9365436, -1.288172, 1.956843, 1, 1, 1, 1, 1,
0.9410717, 0.1749593, 1.524756, 1, 1, 1, 1, 1,
0.9417375, 0.2484191, 0.2995945, 1, 1, 1, 1, 1,
0.9438438, -0.6073496, 2.500976, 1, 1, 1, 1, 1,
0.9450766, 1.406211, 0.9451128, 1, 1, 1, 1, 1,
0.9486826, -0.1150683, 3.20372, 1, 1, 1, 1, 1,
0.9576125, -0.8173407, 3.50924, 1, 1, 1, 1, 1,
0.9588116, -0.9117514, 4.353655, 1, 1, 1, 1, 1,
0.9603691, -0.1890551, 1.955242, 1, 1, 1, 1, 1,
0.9609756, -0.5993373, 0.5224954, 1, 1, 1, 1, 1,
0.961793, 0.6013848, 2.232263, 1, 1, 1, 1, 1,
0.9651551, 0.6439402, -0.2349802, 1, 1, 1, 1, 1,
0.9678742, 0.2884333, 1.142854, 1, 1, 1, 1, 1,
0.9696559, 0.1323664, 1.138002, 1, 1, 1, 1, 1,
0.9722375, 1.480768, 0.9880852, 1, 1, 1, 1, 1,
0.9726589, 0.9237508, 2.258037, 0, 0, 1, 1, 1,
0.9769232, 0.2244486, 1.454944, 1, 0, 0, 1, 1,
0.9777335, -0.159852, 2.371781, 1, 0, 0, 1, 1,
0.9796349, -0.08014617, 3.123779, 1, 0, 0, 1, 1,
0.9796746, -2.374135, 2.513291, 1, 0, 0, 1, 1,
0.9805458, -1.63562, 3.407418, 1, 0, 0, 1, 1,
0.9928186, -0.3769853, 1.760728, 0, 0, 0, 1, 1,
0.9951007, -0.274164, 1.270287, 0, 0, 0, 1, 1,
1.005198, -0.1772781, 0.9521965, 0, 0, 0, 1, 1,
1.006823, -0.1576731, 2.938168, 0, 0, 0, 1, 1,
1.007262, -0.933355, 2.11761, 0, 0, 0, 1, 1,
1.024241, 2.016802, -0.08658649, 0, 0, 0, 1, 1,
1.036601, 0.9931951, 0.04726085, 0, 0, 0, 1, 1,
1.040174, -1.090555, 0.730987, 1, 1, 1, 1, 1,
1.052181, -0.2546064, 1.797312, 1, 1, 1, 1, 1,
1.059742, 1.085831, 1.474352, 1, 1, 1, 1, 1,
1.069276, 0.2010306, 2.317329, 1, 1, 1, 1, 1,
1.075324, 0.1286077, 0.2579842, 1, 1, 1, 1, 1,
1.07727, 0.6011863, 1.887846, 1, 1, 1, 1, 1,
1.0899, 0.354103, 3.50215, 1, 1, 1, 1, 1,
1.098237, 1.018486, 0.8412883, 1, 1, 1, 1, 1,
1.098476, -1.963262, 3.410314, 1, 1, 1, 1, 1,
1.105188, -1.059244, 2.708744, 1, 1, 1, 1, 1,
1.110619, 0.8293895, 0.6678198, 1, 1, 1, 1, 1,
1.114848, -0.5094808, 2.021647, 1, 1, 1, 1, 1,
1.115426, -0.003260684, 2.791895, 1, 1, 1, 1, 1,
1.115578, -0.2419962, 1.795916, 1, 1, 1, 1, 1,
1.116854, -0.9299436, 1.700238, 1, 1, 1, 1, 1,
1.117035, 1.661991, 0.07308588, 0, 0, 1, 1, 1,
1.123319, -0.6679152, 1.827583, 1, 0, 0, 1, 1,
1.137148, 0.2062022, 3.308072, 1, 0, 0, 1, 1,
1.140852, 1.059042, 1.792129, 1, 0, 0, 1, 1,
1.149132, -1.075657, 2.695168, 1, 0, 0, 1, 1,
1.15591, 0.8569695, 0.5440904, 1, 0, 0, 1, 1,
1.165805, -0.7576786, 1.783523, 0, 0, 0, 1, 1,
1.167629, -0.6941038, 2.096877, 0, 0, 0, 1, 1,
1.168271, 0.3485602, 1.588553, 0, 0, 0, 1, 1,
1.174649, -1.235563, 2.579428, 0, 0, 0, 1, 1,
1.182654, 1.484025, 2.246236, 0, 0, 0, 1, 1,
1.189607, 1.596195, 0.7750939, 0, 0, 0, 1, 1,
1.19001, -0.0502586, 1.822941, 0, 0, 0, 1, 1,
1.197832, 0.305757, -1.506787, 1, 1, 1, 1, 1,
1.198671, 0.504979, -0.5246989, 1, 1, 1, 1, 1,
1.203919, 1.088709, 0.6329581, 1, 1, 1, 1, 1,
1.207106, -1.490337, 3.716239, 1, 1, 1, 1, 1,
1.209463, -0.1444086, 1.470551, 1, 1, 1, 1, 1,
1.211088, -0.5522249, 4.296374, 1, 1, 1, 1, 1,
1.21754, 0.2623975, 0.5036997, 1, 1, 1, 1, 1,
1.221588, -0.5315122, 0.4263876, 1, 1, 1, 1, 1,
1.222525, -0.2594493, 2.938905, 1, 1, 1, 1, 1,
1.227995, -0.3465829, 0.8998032, 1, 1, 1, 1, 1,
1.232065, 0.06648145, 0.5393158, 1, 1, 1, 1, 1,
1.233692, 0.1417594, 1.001817, 1, 1, 1, 1, 1,
1.2344, -1.327153, 2.763959, 1, 1, 1, 1, 1,
1.243702, -0.4420825, 1.622335, 1, 1, 1, 1, 1,
1.245425, 0.2081964, 2.677749, 1, 1, 1, 1, 1,
1.25449, -0.191152, -0.07519339, 0, 0, 1, 1, 1,
1.26702, -1.784521, 1.003011, 1, 0, 0, 1, 1,
1.268904, -1.397104, 1.279578, 1, 0, 0, 1, 1,
1.274284, -0.8457676, 0.5659141, 1, 0, 0, 1, 1,
1.277995, -0.01685347, 1.967692, 1, 0, 0, 1, 1,
1.295478, 1.561213, -0.4852513, 1, 0, 0, 1, 1,
1.306217, 1.077363, 0.5960169, 0, 0, 0, 1, 1,
1.312248, -0.1614856, 2.137916, 0, 0, 0, 1, 1,
1.317386, 1.03095, 2.517241, 0, 0, 0, 1, 1,
1.317835, -1.085853, 1.906712, 0, 0, 0, 1, 1,
1.324854, -0.2309925, 3.096166, 0, 0, 0, 1, 1,
1.333087, 0.6997774, 0.7831067, 0, 0, 0, 1, 1,
1.343598, 1.068705, 1.078767, 0, 0, 0, 1, 1,
1.349811, -1.140843, 2.781135, 1, 1, 1, 1, 1,
1.36214, 3.250813, 2.268086, 1, 1, 1, 1, 1,
1.364295, 0.6492936, 2.998985, 1, 1, 1, 1, 1,
1.382436, -0.7064662, 3.843916, 1, 1, 1, 1, 1,
1.382542, 2.077792, 0.3558149, 1, 1, 1, 1, 1,
1.393828, -0.2601159, 1.617932, 1, 1, 1, 1, 1,
1.400093, -0.03558923, 0.7728077, 1, 1, 1, 1, 1,
1.403814, -0.9912283, 3.014321, 1, 1, 1, 1, 1,
1.411026, 1.330864, 1.382867, 1, 1, 1, 1, 1,
1.413102, 1.36099, 0.8322495, 1, 1, 1, 1, 1,
1.418877, -0.6912693, 3.17479, 1, 1, 1, 1, 1,
1.420179, -0.6853848, 4.829522, 1, 1, 1, 1, 1,
1.428961, -0.685389, 2.205333, 1, 1, 1, 1, 1,
1.431068, -1.762115, 2.096154, 1, 1, 1, 1, 1,
1.432625, 0.3825906, 0.007871288, 1, 1, 1, 1, 1,
1.434351, 1.090563, 0.711769, 0, 0, 1, 1, 1,
1.438298, 0.01558542, 3.370374, 1, 0, 0, 1, 1,
1.443303, -0.4613996, 1.62912, 1, 0, 0, 1, 1,
1.445675, -0.6343865, 1.030462, 1, 0, 0, 1, 1,
1.446097, -0.333674, 1.522247, 1, 0, 0, 1, 1,
1.447883, -0.4905051, 1.521939, 1, 0, 0, 1, 1,
1.458429, -0.4279174, 1.961401, 0, 0, 0, 1, 1,
1.462593, 0.08702798, 2.583948, 0, 0, 0, 1, 1,
1.465639, 0.8556479, 2.358343, 0, 0, 0, 1, 1,
1.470094, 0.410497, 2.177184, 0, 0, 0, 1, 1,
1.477097, 1.259598, -0.4113843, 0, 0, 0, 1, 1,
1.499417, -0.240073, 3.015358, 0, 0, 0, 1, 1,
1.500665, -0.2875142, 1.146877, 0, 0, 0, 1, 1,
1.508321, -0.7678541, 2.895481, 1, 1, 1, 1, 1,
1.517231, 0.2226567, 2.696367, 1, 1, 1, 1, 1,
1.537029, 1.689183, 1.152115, 1, 1, 1, 1, 1,
1.541312, -1.060501, 2.162884, 1, 1, 1, 1, 1,
1.5474, -0.1294683, 1.074126, 1, 1, 1, 1, 1,
1.548509, 1.094172, -0.1267755, 1, 1, 1, 1, 1,
1.56181, -0.2940737, 3.422049, 1, 1, 1, 1, 1,
1.567745, 1.693793, -1.163179, 1, 1, 1, 1, 1,
1.591027, 0.4728972, 1.400199, 1, 1, 1, 1, 1,
1.59589, -0.2918652, 0.2185963, 1, 1, 1, 1, 1,
1.601901, 1.672228, 0.06827101, 1, 1, 1, 1, 1,
1.623447, -0.2969471, 2.807946, 1, 1, 1, 1, 1,
1.630652, 0.689297, 1.412184, 1, 1, 1, 1, 1,
1.641647, -0.2479625, 0.2398863, 1, 1, 1, 1, 1,
1.642876, 0.3298759, 1.712394, 1, 1, 1, 1, 1,
1.648958, -0.952433, 3.015738, 0, 0, 1, 1, 1,
1.673262, -1.684591, 1.582173, 1, 0, 0, 1, 1,
1.683007, -1.13385, 0.5813793, 1, 0, 0, 1, 1,
1.705672, -0.4377643, 0.9903048, 1, 0, 0, 1, 1,
1.712441, -0.9729389, 2.175108, 1, 0, 0, 1, 1,
1.747864, 0.008831695, 2.568046, 1, 0, 0, 1, 1,
1.761135, 0.7738063, 0.4837202, 0, 0, 0, 1, 1,
1.761516, -1.299979, 3.227774, 0, 0, 0, 1, 1,
1.763401, -2.054285, 1.077503, 0, 0, 0, 1, 1,
1.787175, 0.1115667, 0.7500505, 0, 0, 0, 1, 1,
1.798096, 1.623948, 0.2695705, 0, 0, 0, 1, 1,
1.808691, -0.3647324, 1.954346, 0, 0, 0, 1, 1,
1.82107, 0.0477199, 2.912547, 0, 0, 0, 1, 1,
1.830522, 0.7063311, 1.60096, 1, 1, 1, 1, 1,
1.854403, 0.2062228, -0.6627943, 1, 1, 1, 1, 1,
1.856331, 2.464797, 0.4663959, 1, 1, 1, 1, 1,
1.879183, -0.5185126, 2.525516, 1, 1, 1, 1, 1,
1.887366, -0.2795047, 2.77033, 1, 1, 1, 1, 1,
1.894503, -0.9268818, 2.252856, 1, 1, 1, 1, 1,
1.897175, 0.736762, 0.8105406, 1, 1, 1, 1, 1,
1.936489, -0.7705687, 1.866485, 1, 1, 1, 1, 1,
1.944156, -1.941315, 3.695525, 1, 1, 1, 1, 1,
1.949375, 0.2723328, 2.115185, 1, 1, 1, 1, 1,
1.966348, 0.2907354, 2.263201, 1, 1, 1, 1, 1,
1.970187, -0.9296877, 0.4703235, 1, 1, 1, 1, 1,
1.975054, -1.032372, 1.165147, 1, 1, 1, 1, 1,
1.975821, -0.1640345, 0.3422466, 1, 1, 1, 1, 1,
1.989066, -0.01370673, 0.382625, 1, 1, 1, 1, 1,
1.995531, -1.287379, 2.740424, 0, 0, 1, 1, 1,
2.062115, -1.367921, 3.803617, 1, 0, 0, 1, 1,
2.066421, -2.143485, 3.47237, 1, 0, 0, 1, 1,
2.079483, 0.1878492, 3.405914, 1, 0, 0, 1, 1,
2.079782, -0.124668, 1.597802, 1, 0, 0, 1, 1,
2.083224, -2.574234, 1.022676, 1, 0, 0, 1, 1,
2.107436, 0.7864411, 3.314591, 0, 0, 0, 1, 1,
2.147897, 0.5922104, 2.196477, 0, 0, 0, 1, 1,
2.189246, -0.7931182, 0.9711246, 0, 0, 0, 1, 1,
2.220212, 1.905746, 3.238159, 0, 0, 0, 1, 1,
2.380596, -0.7440316, 3.003768, 0, 0, 0, 1, 1,
2.404586, 0.984929, -0.8781601, 0, 0, 0, 1, 1,
2.420763, 0.3575206, 1.530273, 0, 0, 0, 1, 1,
2.501557, 1.010652, 1.458597, 1, 1, 1, 1, 1,
2.536177, 0.4582493, 2.655653, 1, 1, 1, 1, 1,
2.615264, -1.356106, 3.768261, 1, 1, 1, 1, 1,
2.726243, 0.1732269, 0.08829664, 1, 1, 1, 1, 1,
2.750545, 1.279208, 1.897477, 1, 1, 1, 1, 1,
2.79292, -0.5411127, 2.682361, 1, 1, 1, 1, 1,
2.919286, -1.252854, 0.8393143, 1, 1, 1, 1, 1
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
var radius = 9.722562;
var distance = 34.15009;
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
mvMatrix.translate( 0.2749292, -0.03483176, -0.1819346 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15009);
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
