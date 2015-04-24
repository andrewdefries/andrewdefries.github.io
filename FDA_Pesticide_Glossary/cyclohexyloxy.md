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
-2.923687, 0.3622158, -1.150844, 1, 0, 0, 1,
-2.80582, -0.5327415, -2.566128, 1, 0.007843138, 0, 1,
-2.627891, -0.7523978, -1.601443, 1, 0.01176471, 0, 1,
-2.429738, -0.855944, -2.038926, 1, 0.01960784, 0, 1,
-2.363013, -0.8896427, -4.543341, 1, 0.02352941, 0, 1,
-2.324054, 0.3565177, -0.04599892, 1, 0.03137255, 0, 1,
-2.295778, 0.1896459, -0.4969199, 1, 0.03529412, 0, 1,
-2.238906, 0.07601636, -2.399791, 1, 0.04313726, 0, 1,
-2.228215, -0.8657554, -2.22298, 1, 0.04705882, 0, 1,
-2.226043, 1.347454, 0.4702508, 1, 0.05490196, 0, 1,
-2.203369, 0.6012616, -1.191283, 1, 0.05882353, 0, 1,
-2.169948, 1.220302, -0.7150024, 1, 0.06666667, 0, 1,
-2.144224, 1.374069, -0.8474733, 1, 0.07058824, 0, 1,
-2.089961, 1.456406, 0.5683324, 1, 0.07843138, 0, 1,
-2.087047, 0.001785532, -0.9624016, 1, 0.08235294, 0, 1,
-2.041313, 1.583245, -0.8180631, 1, 0.09019608, 0, 1,
-2.037309, -0.6590618, -2.610875, 1, 0.09411765, 0, 1,
-2.00479, 0.5491527, 0.4187348, 1, 0.1019608, 0, 1,
-1.963299, -0.04638048, -0.7319209, 1, 0.1098039, 0, 1,
-1.91644, 1.185117, -0.3255581, 1, 0.1137255, 0, 1,
-1.912524, 0.08576241, -1.432222, 1, 0.1215686, 0, 1,
-1.908511, 0.6088527, -1.51834, 1, 0.1254902, 0, 1,
-1.906119, 0.7373328, -0.2902668, 1, 0.1333333, 0, 1,
-1.902552, -0.2508227, -2.163527, 1, 0.1372549, 0, 1,
-1.897028, 0.5907855, -2.687716, 1, 0.145098, 0, 1,
-1.878192, 1.213653, -1.124994, 1, 0.1490196, 0, 1,
-1.869982, 0.2111274, -2.010168, 1, 0.1568628, 0, 1,
-1.86986, 0.4905202, -1.890797, 1, 0.1607843, 0, 1,
-1.865738, 1.227579, -1.714106, 1, 0.1686275, 0, 1,
-1.856472, -1.116263, -0.8320734, 1, 0.172549, 0, 1,
-1.849098, -1.103244, -1.774074, 1, 0.1803922, 0, 1,
-1.848684, -0.9790788, -2.07528, 1, 0.1843137, 0, 1,
-1.841883, -1.537979, -0.9052455, 1, 0.1921569, 0, 1,
-1.835062, 1.666653, -1.146948, 1, 0.1960784, 0, 1,
-1.82301, -0.3609761, -0.07242658, 1, 0.2039216, 0, 1,
-1.820725, -0.5607448, -1.490587, 1, 0.2117647, 0, 1,
-1.818468, -0.01364538, -2.313233, 1, 0.2156863, 0, 1,
-1.811531, -1.268709, -2.462877, 1, 0.2235294, 0, 1,
-1.802671, -0.6514224, -3.098983, 1, 0.227451, 0, 1,
-1.801825, 1.316735, -0.8630114, 1, 0.2352941, 0, 1,
-1.797769, -1.790763, -1.704919, 1, 0.2392157, 0, 1,
-1.77586, -1.387715, -1.482937, 1, 0.2470588, 0, 1,
-1.774443, -0.01628028, -1.360651, 1, 0.2509804, 0, 1,
-1.764127, 0.7137718, -1.772025, 1, 0.2588235, 0, 1,
-1.763307, -0.1084344, -1.884251, 1, 0.2627451, 0, 1,
-1.757102, 1.019682, -1.513299, 1, 0.2705882, 0, 1,
-1.753632, 0.1505083, -1.889817, 1, 0.2745098, 0, 1,
-1.750881, -1.005015, -2.629658, 1, 0.282353, 0, 1,
-1.714266, 1.095438, -1.910609, 1, 0.2862745, 0, 1,
-1.706861, -1.398451, -2.312653, 1, 0.2941177, 0, 1,
-1.673248, 0.4422826, -1.401111, 1, 0.3019608, 0, 1,
-1.670656, -0.01169373, -2.000048, 1, 0.3058824, 0, 1,
-1.657687, 1.213152, -0.6874816, 1, 0.3137255, 0, 1,
-1.644807, -0.2784287, -2.374345, 1, 0.3176471, 0, 1,
-1.634135, -0.185413, -1.829607, 1, 0.3254902, 0, 1,
-1.632258, -0.007380153, -3.049117, 1, 0.3294118, 0, 1,
-1.631963, 1.880238, -1.503341, 1, 0.3372549, 0, 1,
-1.631186, 1.06861, -2.513691, 1, 0.3411765, 0, 1,
-1.614197, -1.60082, -1.21335, 1, 0.3490196, 0, 1,
-1.600588, 1.513492, -2.649813, 1, 0.3529412, 0, 1,
-1.582434, -0.5969225, -2.297968, 1, 0.3607843, 0, 1,
-1.579065, -0.1210914, -3.281503, 1, 0.3647059, 0, 1,
-1.578365, 0.5594602, -2.763446, 1, 0.372549, 0, 1,
-1.574236, 0.5327278, -2.014366, 1, 0.3764706, 0, 1,
-1.559291, 0.3499074, -1.492308, 1, 0.3843137, 0, 1,
-1.558763, 0.6137456, -0.6866855, 1, 0.3882353, 0, 1,
-1.549602, 0.4716888, -1.180581, 1, 0.3960784, 0, 1,
-1.540151, -1.072853, -1.483179, 1, 0.4039216, 0, 1,
-1.533051, 2.718665, 0.7024992, 1, 0.4078431, 0, 1,
-1.531441, -1.846443, -1.0414, 1, 0.4156863, 0, 1,
-1.531112, 0.3824214, -1.592362, 1, 0.4196078, 0, 1,
-1.519229, -0.689442, -2.391547, 1, 0.427451, 0, 1,
-1.513644, 0.7632996, -1.418798, 1, 0.4313726, 0, 1,
-1.503196, 1.268685, -1.777556, 1, 0.4392157, 0, 1,
-1.503096, -0.9383073, -2.309012, 1, 0.4431373, 0, 1,
-1.500046, -0.6433296, -3.612262, 1, 0.4509804, 0, 1,
-1.483632, 0.01157245, 0.3262727, 1, 0.454902, 0, 1,
-1.477743, -0.09977678, -2.373713, 1, 0.4627451, 0, 1,
-1.476777, 0.5325118, 1.059704, 1, 0.4666667, 0, 1,
-1.473248, 1.121124, -1.157089, 1, 0.4745098, 0, 1,
-1.469656, -0.7146227, -2.081087, 1, 0.4784314, 0, 1,
-1.457567, 0.9305478, -0.2370956, 1, 0.4862745, 0, 1,
-1.457079, -1.998132, -1.236496, 1, 0.4901961, 0, 1,
-1.443048, -1.19068, -4.074883, 1, 0.4980392, 0, 1,
-1.437429, -1.282919, -3.848118, 1, 0.5058824, 0, 1,
-1.431852, 0.6499544, 0.6233963, 1, 0.509804, 0, 1,
-1.430449, -0.7757663, -1.443591, 1, 0.5176471, 0, 1,
-1.429432, -0.3843116, -2.533001, 1, 0.5215687, 0, 1,
-1.426195, -0.008704692, -2.01499, 1, 0.5294118, 0, 1,
-1.424294, 0.04254753, -2.119513, 1, 0.5333334, 0, 1,
-1.418901, 1.232771, -0.8285912, 1, 0.5411765, 0, 1,
-1.417951, 0.9035617, -0.4387079, 1, 0.5450981, 0, 1,
-1.405518, -0.5044457, -0.9727955, 1, 0.5529412, 0, 1,
-1.387222, 0.1836216, -3.153849, 1, 0.5568628, 0, 1,
-1.387014, 1.641801, -2.377533, 1, 0.5647059, 0, 1,
-1.385989, -0.133256, -0.7420725, 1, 0.5686275, 0, 1,
-1.377618, 0.1801238, -0.8174314, 1, 0.5764706, 0, 1,
-1.371742, -0.2937678, -1.03788, 1, 0.5803922, 0, 1,
-1.370092, 0.0760896, 0.8801827, 1, 0.5882353, 0, 1,
-1.362933, 1.974009, -0.2058244, 1, 0.5921569, 0, 1,
-1.362262, 0.297988, -0.2113543, 1, 0.6, 0, 1,
-1.361736, -0.8111484, -1.611234, 1, 0.6078432, 0, 1,
-1.357217, 0.1638508, -0.3572601, 1, 0.6117647, 0, 1,
-1.354008, 0.8221717, -0.8643897, 1, 0.6196079, 0, 1,
-1.350454, 0.01820062, -1.599228, 1, 0.6235294, 0, 1,
-1.336976, 0.7654297, -0.650822, 1, 0.6313726, 0, 1,
-1.325187, 0.1412389, -1.446399, 1, 0.6352941, 0, 1,
-1.312752, -0.5646592, -3.098317, 1, 0.6431373, 0, 1,
-1.304342, -0.9101645, 0.1465754, 1, 0.6470588, 0, 1,
-1.303512, -0.0852188, -3.125437, 1, 0.654902, 0, 1,
-1.302217, 1.389138, -0.2533989, 1, 0.6588235, 0, 1,
-1.26586, 0.6994475, -5.286247, 1, 0.6666667, 0, 1,
-1.263684, 1.142015, -1.917472, 1, 0.6705883, 0, 1,
-1.260287, -0.1979561, -1.10936, 1, 0.6784314, 0, 1,
-1.258366, 0.8371055, -0.3708903, 1, 0.682353, 0, 1,
-1.247254, 0.5260032, -2.090269, 1, 0.6901961, 0, 1,
-1.246261, 0.06531434, -0.5338358, 1, 0.6941177, 0, 1,
-1.243623, 1.094705, 0.7648718, 1, 0.7019608, 0, 1,
-1.239484, 1.098713, -2.269669, 1, 0.7098039, 0, 1,
-1.236893, 0.6440873, 1.256116, 1, 0.7137255, 0, 1,
-1.230673, 0.8293917, -1.282611, 1, 0.7215686, 0, 1,
-1.22443, -0.6390291, -1.064278, 1, 0.7254902, 0, 1,
-1.210782, -1.733899, -3.84802, 1, 0.7333333, 0, 1,
-1.208959, -0.5388295, -2.002795, 1, 0.7372549, 0, 1,
-1.193355, -0.2507693, -1.150262, 1, 0.7450981, 0, 1,
-1.185909, -0.7729654, -1.458829, 1, 0.7490196, 0, 1,
-1.185246, 0.03653496, -0.1453654, 1, 0.7568628, 0, 1,
-1.182233, 0.04013671, -1.397889, 1, 0.7607843, 0, 1,
-1.176211, -2.825566, -3.64407, 1, 0.7686275, 0, 1,
-1.174115, 0.09033116, -1.988285, 1, 0.772549, 0, 1,
-1.166774, 0.8770758, -0.6084841, 1, 0.7803922, 0, 1,
-1.165431, 1.859871, -0.06815994, 1, 0.7843137, 0, 1,
-1.159545, -0.4997776, -2.243195, 1, 0.7921569, 0, 1,
-1.155154, 1.008161, -1.035512, 1, 0.7960784, 0, 1,
-1.147412, 0.4099431, -2.942614, 1, 0.8039216, 0, 1,
-1.135261, 0.2354796, -3.475802, 1, 0.8117647, 0, 1,
-1.13117, -0.01025584, -1.017475, 1, 0.8156863, 0, 1,
-1.124206, 4.240794, -0.1910911, 1, 0.8235294, 0, 1,
-1.121127, -2.05416, -3.401612, 1, 0.827451, 0, 1,
-1.117452, -0.3913935, -1.643351, 1, 0.8352941, 0, 1,
-1.116934, 1.032414, -0.8310952, 1, 0.8392157, 0, 1,
-1.115511, -0.3496412, -0.8092545, 1, 0.8470588, 0, 1,
-1.110754, 0.8432542, -1.38025, 1, 0.8509804, 0, 1,
-1.099391, -1.599277, -3.652539, 1, 0.8588235, 0, 1,
-1.097142, -0.4373802, -0.7902555, 1, 0.8627451, 0, 1,
-1.093847, 0.7562677, -1.555605, 1, 0.8705882, 0, 1,
-1.092974, -0.08011772, -3.276772, 1, 0.8745098, 0, 1,
-1.084706, 0.3771427, -1.68536, 1, 0.8823529, 0, 1,
-1.083865, 1.025135, -1.911624, 1, 0.8862745, 0, 1,
-1.079475, -0.06997107, -2.404923, 1, 0.8941177, 0, 1,
-1.077617, -0.4521327, -2.928719, 1, 0.8980392, 0, 1,
-1.069571, -0.9730509, -2.715309, 1, 0.9058824, 0, 1,
-1.067807, 0.09169294, -0.5731937, 1, 0.9137255, 0, 1,
-1.059506, 0.04793265, -0.0759681, 1, 0.9176471, 0, 1,
-1.05757, 0.1545735, 0.454818, 1, 0.9254902, 0, 1,
-1.054949, -0.2726945, -3.636398, 1, 0.9294118, 0, 1,
-1.041193, 0.3202635, -0.8229178, 1, 0.9372549, 0, 1,
-1.039089, -1.321114, -2.595818, 1, 0.9411765, 0, 1,
-1.034365, -1.233602, -3.054833, 1, 0.9490196, 0, 1,
-1.028882, -0.5848198, -3.043036, 1, 0.9529412, 0, 1,
-1.026507, -0.311825, -0.1682901, 1, 0.9607843, 0, 1,
-1.022136, -0.2529857, -3.416317, 1, 0.9647059, 0, 1,
-1.020298, 0.5933185, -1.469535, 1, 0.972549, 0, 1,
-1.018807, -0.1731985, -2.146122, 1, 0.9764706, 0, 1,
-1.015872, 0.8677523, -2.221457, 1, 0.9843137, 0, 1,
-1.010517, 0.5363097, -0.9227569, 1, 0.9882353, 0, 1,
-1.009218, 0.7407024, 0.7892914, 1, 0.9960784, 0, 1,
-1.005892, -1.183437, -2.454155, 0.9960784, 1, 0, 1,
-1.001628, -0.2131454, -2.136014, 0.9921569, 1, 0, 1,
-0.9994496, 1.80079, -0.6025923, 0.9843137, 1, 0, 1,
-0.9938046, 0.3080213, 0.6129659, 0.9803922, 1, 0, 1,
-0.9919012, -0.05232039, -2.362321, 0.972549, 1, 0, 1,
-0.9883506, 1.783784, -0.2362491, 0.9686275, 1, 0, 1,
-0.9880438, -0.5982864, -2.183826, 0.9607843, 1, 0, 1,
-0.9870786, -0.5066665, -2.988501, 0.9568627, 1, 0, 1,
-0.9860305, 1.026902, -0.2526031, 0.9490196, 1, 0, 1,
-0.9835185, -0.2003923, -1.894416, 0.945098, 1, 0, 1,
-0.9835032, -0.03808849, -1.503836, 0.9372549, 1, 0, 1,
-0.9783642, -0.9172065, -3.620618, 0.9333333, 1, 0, 1,
-0.9762623, 0.07574952, -0.6081818, 0.9254902, 1, 0, 1,
-0.9748169, 1.627013, -2.107193, 0.9215686, 1, 0, 1,
-0.9728941, -0.9399611, -4.040582, 0.9137255, 1, 0, 1,
-0.9717996, -1.00248, -1.92295, 0.9098039, 1, 0, 1,
-0.9684923, -0.9867412, -1.887379, 0.9019608, 1, 0, 1,
-0.9679754, -1.624687, -3.515495, 0.8941177, 1, 0, 1,
-0.9645998, 0.4551726, -1.379709, 0.8901961, 1, 0, 1,
-0.9594489, -0.6896018, -2.331239, 0.8823529, 1, 0, 1,
-0.9523817, -0.4271034, -3.77001, 0.8784314, 1, 0, 1,
-0.9482346, -2.571466, -2.644895, 0.8705882, 1, 0, 1,
-0.9379644, -1.864717, -3.865236, 0.8666667, 1, 0, 1,
-0.9350561, 0.941538, -0.1725965, 0.8588235, 1, 0, 1,
-0.9331952, -0.7000027, -2.442208, 0.854902, 1, 0, 1,
-0.9328714, -0.6479717, -1.318846, 0.8470588, 1, 0, 1,
-0.9260204, 0.4279457, -2.179203, 0.8431373, 1, 0, 1,
-0.9170937, 0.7150013, 0.8854069, 0.8352941, 1, 0, 1,
-0.9131621, 0.6728922, -0.9910315, 0.8313726, 1, 0, 1,
-0.9097158, 0.4390897, -0.04674643, 0.8235294, 1, 0, 1,
-0.9064453, -0.5289565, -2.788651, 0.8196079, 1, 0, 1,
-0.9054902, 0.6704896, 1.065108, 0.8117647, 1, 0, 1,
-0.904469, -0.2877339, -0.1529242, 0.8078431, 1, 0, 1,
-0.8957714, -1.779952, -2.509968, 0.8, 1, 0, 1,
-0.8943624, -0.1977012, -1.984666, 0.7921569, 1, 0, 1,
-0.8905408, 1.394442, -1.067582, 0.7882353, 1, 0, 1,
-0.8902592, -1.780883, -2.686357, 0.7803922, 1, 0, 1,
-0.8844625, 0.5737329, -2.038479, 0.7764706, 1, 0, 1,
-0.8835886, -0.5822861, -2.189874, 0.7686275, 1, 0, 1,
-0.8800962, -1.101799, -1.890113, 0.7647059, 1, 0, 1,
-0.8796085, -0.9725308, -1.323136, 0.7568628, 1, 0, 1,
-0.8695931, -0.6156895, -1.820089, 0.7529412, 1, 0, 1,
-0.8648621, 0.7788247, 0.448449, 0.7450981, 1, 0, 1,
-0.8543679, -0.3146169, -0.9568639, 0.7411765, 1, 0, 1,
-0.8532153, 1.231273, -1.3174, 0.7333333, 1, 0, 1,
-0.8426948, -0.01960484, -1.598566, 0.7294118, 1, 0, 1,
-0.8424687, -1.931486, -2.987468, 0.7215686, 1, 0, 1,
-0.8382087, -0.06421123, -1.115254, 0.7176471, 1, 0, 1,
-0.8361909, 1.30182, 0.8330121, 0.7098039, 1, 0, 1,
-0.8152149, 0.1239841, 0.2722915, 0.7058824, 1, 0, 1,
-0.8146194, -0.1539232, -1.086853, 0.6980392, 1, 0, 1,
-0.8145795, 1.161533, 0.130804, 0.6901961, 1, 0, 1,
-0.8130616, -0.4228551, -2.130612, 0.6862745, 1, 0, 1,
-0.8128796, -1.471805, -2.370374, 0.6784314, 1, 0, 1,
-0.8125513, 0.8688104, -2.7414, 0.6745098, 1, 0, 1,
-0.8122591, 0.2992194, -0.3078902, 0.6666667, 1, 0, 1,
-0.8056095, 0.1977488, -0.7416028, 0.6627451, 1, 0, 1,
-0.805208, 0.8439948, -0.7009478, 0.654902, 1, 0, 1,
-0.8031161, -1.617785, -3.627665, 0.6509804, 1, 0, 1,
-0.802964, 0.350162, -0.8816, 0.6431373, 1, 0, 1,
-0.7986155, -1.317048, -0.9855676, 0.6392157, 1, 0, 1,
-0.7952605, -0.5829142, -2.200956, 0.6313726, 1, 0, 1,
-0.7940044, -1.393525, -4.014532, 0.627451, 1, 0, 1,
-0.7895973, 1.217246, -1.072157, 0.6196079, 1, 0, 1,
-0.7844472, 1.38143, -0.632328, 0.6156863, 1, 0, 1,
-0.7821611, -0.3447607, -1.969144, 0.6078432, 1, 0, 1,
-0.7809932, -0.5024939, -0.734177, 0.6039216, 1, 0, 1,
-0.7781032, 1.40724, -1.040197, 0.5960785, 1, 0, 1,
-0.7710797, 0.5516419, -0.1836054, 0.5882353, 1, 0, 1,
-0.769138, -1.184216, -3.75653, 0.5843138, 1, 0, 1,
-0.7606084, -0.05417572, -3.456923, 0.5764706, 1, 0, 1,
-0.7580592, -0.5274566, -2.434646, 0.572549, 1, 0, 1,
-0.7576187, -0.4285095, -2.534986, 0.5647059, 1, 0, 1,
-0.7565899, -0.3935545, -1.653417, 0.5607843, 1, 0, 1,
-0.7445517, -0.6185231, -3.510587, 0.5529412, 1, 0, 1,
-0.7439731, 0.2408775, -0.6088749, 0.5490196, 1, 0, 1,
-0.7437467, 1.675581, -2.543723, 0.5411765, 1, 0, 1,
-0.7428328, 0.3908369, -0.5779487, 0.5372549, 1, 0, 1,
-0.7397824, 0.9120085, -0.914892, 0.5294118, 1, 0, 1,
-0.7366703, -0.3703735, -1.201535, 0.5254902, 1, 0, 1,
-0.7365296, -0.03839214, -1.499498, 0.5176471, 1, 0, 1,
-0.7324511, -0.7123887, -0.9733437, 0.5137255, 1, 0, 1,
-0.7279151, 1.238286, -2.323612, 0.5058824, 1, 0, 1,
-0.7258444, -0.3166915, -0.5360481, 0.5019608, 1, 0, 1,
-0.7228504, -1.18281, -1.904148, 0.4941176, 1, 0, 1,
-0.719427, 0.8844306, 0.2262428, 0.4862745, 1, 0, 1,
-0.7180709, -0.8857493, -4.168412, 0.4823529, 1, 0, 1,
-0.7158565, 1.471789, -1.171504, 0.4745098, 1, 0, 1,
-0.715551, 0.4504666, -1.190767, 0.4705882, 1, 0, 1,
-0.7143409, -1.210896, -3.541549, 0.4627451, 1, 0, 1,
-0.7101572, 0.7396808, -1.239872, 0.4588235, 1, 0, 1,
-0.70825, 0.01686463, -2.744604, 0.4509804, 1, 0, 1,
-0.7039068, -0.4638181, -1.729445, 0.4470588, 1, 0, 1,
-0.7011465, -1.318485, -4.075933, 0.4392157, 1, 0, 1,
-0.6993931, -1.160965, -4.211558, 0.4352941, 1, 0, 1,
-0.6986384, 1.029899, 2.938476, 0.427451, 1, 0, 1,
-0.6985151, 1.165166, -0.2617252, 0.4235294, 1, 0, 1,
-0.6964706, -1.776848, -1.742972, 0.4156863, 1, 0, 1,
-0.6952311, 0.3707792, 0.3855812, 0.4117647, 1, 0, 1,
-0.6934276, 0.5256366, 0.0849591, 0.4039216, 1, 0, 1,
-0.6928397, 1.204278, 0.6821473, 0.3960784, 1, 0, 1,
-0.6921098, -0.2580682, -1.822423, 0.3921569, 1, 0, 1,
-0.6883207, -0.4439242, -3.116035, 0.3843137, 1, 0, 1,
-0.6845546, -0.036559, -2.232535, 0.3803922, 1, 0, 1,
-0.680267, -0.3705417, -1.650391, 0.372549, 1, 0, 1,
-0.6751423, -0.8713961, -3.505252, 0.3686275, 1, 0, 1,
-0.6685681, -0.02399946, -1.818322, 0.3607843, 1, 0, 1,
-0.6605448, -1.743571, -3.571394, 0.3568628, 1, 0, 1,
-0.659281, 0.3216126, -2.063354, 0.3490196, 1, 0, 1,
-0.6577676, 0.02229659, -2.229769, 0.345098, 1, 0, 1,
-0.6505272, -0.3373993, -1.442553, 0.3372549, 1, 0, 1,
-0.6478799, -0.5053145, -3.535264, 0.3333333, 1, 0, 1,
-0.647821, 1.368474, -2.735771, 0.3254902, 1, 0, 1,
-0.647513, -0.83288, -4.013834, 0.3215686, 1, 0, 1,
-0.6444405, -0.5019436, -1.977109, 0.3137255, 1, 0, 1,
-0.6383213, -0.7083381, -2.689853, 0.3098039, 1, 0, 1,
-0.637078, -0.383015, -2.299284, 0.3019608, 1, 0, 1,
-0.6348798, 0.6619429, -1.86598, 0.2941177, 1, 0, 1,
-0.6292219, 0.08655822, -2.141939, 0.2901961, 1, 0, 1,
-0.6260592, -1.229564, -1.777772, 0.282353, 1, 0, 1,
-0.6218639, -0.07013462, -0.03981271, 0.2784314, 1, 0, 1,
-0.6216627, 1.084297, -1.786591, 0.2705882, 1, 0, 1,
-0.6200839, -0.7761629, -1.764572, 0.2666667, 1, 0, 1,
-0.614642, -0.4633417, -2.870672, 0.2588235, 1, 0, 1,
-0.6108584, 0.5406526, 0.8888504, 0.254902, 1, 0, 1,
-0.6100605, 1.306628, 0.3587594, 0.2470588, 1, 0, 1,
-0.6069376, 0.1864171, -2.351542, 0.2431373, 1, 0, 1,
-0.6047313, 0.7297852, -0.04521085, 0.2352941, 1, 0, 1,
-0.6046077, -0.5791537, -1.881578, 0.2313726, 1, 0, 1,
-0.6005116, -0.4407787, -2.715159, 0.2235294, 1, 0, 1,
-0.5923103, -0.1053805, -3.427606, 0.2196078, 1, 0, 1,
-0.582779, 0.05599868, -1.977677, 0.2117647, 1, 0, 1,
-0.5756211, 0.9814023, 0.06280024, 0.2078431, 1, 0, 1,
-0.5745901, -0.7908406, -2.554117, 0.2, 1, 0, 1,
-0.5724487, 0.4070368, -0.9714413, 0.1921569, 1, 0, 1,
-0.568626, 0.6897832, -1.709597, 0.1882353, 1, 0, 1,
-0.5682369, 0.31971, -1.226132, 0.1803922, 1, 0, 1,
-0.5628623, 0.3399552, -1.057514, 0.1764706, 1, 0, 1,
-0.5620706, -0.8564492, -2.310507, 0.1686275, 1, 0, 1,
-0.5614703, 1.722871, -1.697565, 0.1647059, 1, 0, 1,
-0.5550725, 0.4914503, -0.933305, 0.1568628, 1, 0, 1,
-0.5541266, -1.530083, -2.375005, 0.1529412, 1, 0, 1,
-0.5458783, -0.4225464, -1.711017, 0.145098, 1, 0, 1,
-0.5425724, -0.1972538, -1.940604, 0.1411765, 1, 0, 1,
-0.5393526, -1.92273, -1.692724, 0.1333333, 1, 0, 1,
-0.5381853, 1.15993, -0.283422, 0.1294118, 1, 0, 1,
-0.5355048, -0.5368478, -1.024667, 0.1215686, 1, 0, 1,
-0.5323961, -0.3824185, -0.5842286, 0.1176471, 1, 0, 1,
-0.5317128, 0.3257031, -0.7033225, 0.1098039, 1, 0, 1,
-0.5292364, 0.2242114, -0.8911545, 0.1058824, 1, 0, 1,
-0.5259208, -2.579845, -3.162876, 0.09803922, 1, 0, 1,
-0.5192419, -0.9343358, -2.922348, 0.09019608, 1, 0, 1,
-0.5185812, 1.718632, 0.3121496, 0.08627451, 1, 0, 1,
-0.5163168, -0.6470475, -2.207619, 0.07843138, 1, 0, 1,
-0.5128917, -0.6703463, -2.093427, 0.07450981, 1, 0, 1,
-0.5087698, 0.3418782, 0.2392791, 0.06666667, 1, 0, 1,
-0.5042389, 0.1037125, 0.245867, 0.0627451, 1, 0, 1,
-0.5008743, 1.16422, -0.06986471, 0.05490196, 1, 0, 1,
-0.4979011, -1.302344, -3.616668, 0.05098039, 1, 0, 1,
-0.4949612, -1.566111, -1.251193, 0.04313726, 1, 0, 1,
-0.4932556, -1.133341, -2.366052, 0.03921569, 1, 0, 1,
-0.4913138, 1.409929, -1.17338, 0.03137255, 1, 0, 1,
-0.4878583, 0.2457264, -0.5848618, 0.02745098, 1, 0, 1,
-0.4867641, 0.5434617, -1.367899, 0.01960784, 1, 0, 1,
-0.4856372, 2.111399, 1.431533, 0.01568628, 1, 0, 1,
-0.484269, 0.7852404, -0.3961533, 0.007843138, 1, 0, 1,
-0.4792243, 0.0345316, -1.827547, 0.003921569, 1, 0, 1,
-0.4775475, 2.011132, 0.9639329, 0, 1, 0.003921569, 1,
-0.4767367, 0.7986676, 0.8335584, 0, 1, 0.01176471, 1,
-0.475749, 0.7357584, -0.2379771, 0, 1, 0.01568628, 1,
-0.4753633, -0.9001926, -2.985445, 0, 1, 0.02352941, 1,
-0.4747416, -0.4206519, -2.200589, 0, 1, 0.02745098, 1,
-0.4681601, 0.2507072, -1.86181, 0, 1, 0.03529412, 1,
-0.4657633, 1.12472, 0.5195399, 0, 1, 0.03921569, 1,
-0.4634703, -0.5134059, -2.873136, 0, 1, 0.04705882, 1,
-0.4618723, 0.444663, -0.7025216, 0, 1, 0.05098039, 1,
-0.4577351, -0.1095498, -3.239492, 0, 1, 0.05882353, 1,
-0.4574219, 1.233203, 0.7302389, 0, 1, 0.0627451, 1,
-0.4568947, 2.687016, 0.5856536, 0, 1, 0.07058824, 1,
-0.450086, -2.176359, -2.691798, 0, 1, 0.07450981, 1,
-0.4358279, -1.266977, -3.273302, 0, 1, 0.08235294, 1,
-0.4343348, 1.7697, 0.250035, 0, 1, 0.08627451, 1,
-0.429865, 0.352889, -0.6069734, 0, 1, 0.09411765, 1,
-0.4288321, 1.35302, -1.973743, 0, 1, 0.1019608, 1,
-0.4249939, -0.3454547, -2.12402, 0, 1, 0.1058824, 1,
-0.4235918, 0.8221072, 0.02607873, 0, 1, 0.1137255, 1,
-0.418639, -1.154105, -3.827832, 0, 1, 0.1176471, 1,
-0.4141693, 1.66129, -0.9580438, 0, 1, 0.1254902, 1,
-0.4135652, 0.7986009, -0.7344458, 0, 1, 0.1294118, 1,
-0.4129288, -1.685688, -1.706725, 0, 1, 0.1372549, 1,
-0.4118846, -1.381678, -3.130006, 0, 1, 0.1411765, 1,
-0.4037497, 1.376243, -0.5140914, 0, 1, 0.1490196, 1,
-0.4026015, 1.368723, -0.2343072, 0, 1, 0.1529412, 1,
-0.4017649, -0.7397688, -2.275754, 0, 1, 0.1607843, 1,
-0.3991576, 0.1193322, -0.8983097, 0, 1, 0.1647059, 1,
-0.3939548, 2.307045, -1.520427, 0, 1, 0.172549, 1,
-0.388835, 0.1332918, -1.272948, 0, 1, 0.1764706, 1,
-0.3879679, 0.1771514, -1.938466, 0, 1, 0.1843137, 1,
-0.3788867, -0.4084764, -1.83207, 0, 1, 0.1882353, 1,
-0.3783278, 0.234222, -0.1915572, 0, 1, 0.1960784, 1,
-0.378283, 0.5895721, -0.1110639, 0, 1, 0.2039216, 1,
-0.3766981, 1.242644, -0.8631611, 0, 1, 0.2078431, 1,
-0.3764362, -0.09547497, -2.210555, 0, 1, 0.2156863, 1,
-0.3748922, 1.685649, -0.3919098, 0, 1, 0.2196078, 1,
-0.3648882, 0.4496772, 0.2673243, 0, 1, 0.227451, 1,
-0.3616315, -0.4794542, -2.636951, 0, 1, 0.2313726, 1,
-0.3578884, 1.53935, -1.057986, 0, 1, 0.2392157, 1,
-0.357366, 0.750313, 0.1832448, 0, 1, 0.2431373, 1,
-0.3533114, -0.2308604, -2.459744, 0, 1, 0.2509804, 1,
-0.3531546, 0.9420738, -0.2368061, 0, 1, 0.254902, 1,
-0.3526021, 0.552067, -0.8537352, 0, 1, 0.2627451, 1,
-0.3460066, 0.9983351, 0.8560194, 0, 1, 0.2666667, 1,
-0.3433567, -1.566729, -5.135896, 0, 1, 0.2745098, 1,
-0.3416828, 0.1127136, -0.979217, 0, 1, 0.2784314, 1,
-0.3416381, -0.08256706, -2.320536, 0, 1, 0.2862745, 1,
-0.3355883, 1.277181, 0.4124978, 0, 1, 0.2901961, 1,
-0.3308355, 0.09389533, -1.732868, 0, 1, 0.2980392, 1,
-0.3270428, -0.3650687, -2.831184, 0, 1, 0.3058824, 1,
-0.3250224, 1.190747, -1.360147, 0, 1, 0.3098039, 1,
-0.3180191, -1.329137, -3.434856, 0, 1, 0.3176471, 1,
-0.3168055, -0.4453624, -1.382303, 0, 1, 0.3215686, 1,
-0.315246, 1.448192, -0.3147767, 0, 1, 0.3294118, 1,
-0.314891, 1.595881, 1.50698, 0, 1, 0.3333333, 1,
-0.3147306, 0.05078698, -1.193923, 0, 1, 0.3411765, 1,
-0.3143438, -1.301744, -2.792139, 0, 1, 0.345098, 1,
-0.3141454, 0.866988, -1.348951, 0, 1, 0.3529412, 1,
-0.3135777, 0.1760799, -0.9339616, 0, 1, 0.3568628, 1,
-0.3132323, 0.004345568, -0.7899507, 0, 1, 0.3647059, 1,
-0.3026664, -0.256812, -2.6534, 0, 1, 0.3686275, 1,
-0.3012731, -1.159353, -2.328549, 0, 1, 0.3764706, 1,
-0.2996908, -1.3359, -1.889806, 0, 1, 0.3803922, 1,
-0.297662, -0.3031986, -2.405754, 0, 1, 0.3882353, 1,
-0.2941712, -0.1752368, -2.510786, 0, 1, 0.3921569, 1,
-0.2917515, -1.67473, -2.406873, 0, 1, 0.4, 1,
-0.2872468, 0.2733796, -0.07359617, 0, 1, 0.4078431, 1,
-0.2844429, -0.4512694, -3.826782, 0, 1, 0.4117647, 1,
-0.284324, -0.8218225, -2.656812, 0, 1, 0.4196078, 1,
-0.284124, 1.480641, -0.4193202, 0, 1, 0.4235294, 1,
-0.280884, -0.865253, -2.599903, 0, 1, 0.4313726, 1,
-0.2803664, 1.109261, -0.2628924, 0, 1, 0.4352941, 1,
-0.2791565, 1.488719, 0.4727942, 0, 1, 0.4431373, 1,
-0.2771375, -0.4010015, -1.754737, 0, 1, 0.4470588, 1,
-0.2766208, 0.4161335, 0.05587988, 0, 1, 0.454902, 1,
-0.2752783, 0.4853449, 0.8260081, 0, 1, 0.4588235, 1,
-0.2742731, -1.246536, -2.438278, 0, 1, 0.4666667, 1,
-0.2738325, 0.3164338, -2.234182, 0, 1, 0.4705882, 1,
-0.2682136, 1.703477, -1.58294, 0, 1, 0.4784314, 1,
-0.2665141, -0.03723396, -1.199561, 0, 1, 0.4823529, 1,
-0.2631984, 0.307996, -1.650558, 0, 1, 0.4901961, 1,
-0.2621817, -0.807202, -1.967688, 0, 1, 0.4941176, 1,
-0.2602296, 1.255897, -0.5231363, 0, 1, 0.5019608, 1,
-0.2579446, -0.6837253, -3.423373, 0, 1, 0.509804, 1,
-0.2576809, -0.3702917, -2.371139, 0, 1, 0.5137255, 1,
-0.2456347, 0.4267375, -0.318241, 0, 1, 0.5215687, 1,
-0.2444757, -1.338396, -2.331135, 0, 1, 0.5254902, 1,
-0.2424031, -2.276092, -1.820432, 0, 1, 0.5333334, 1,
-0.2423638, 0.6579022, -1.011412, 0, 1, 0.5372549, 1,
-0.2422561, 0.9326249, -0.4912098, 0, 1, 0.5450981, 1,
-0.2394865, -1.03533, -2.059508, 0, 1, 0.5490196, 1,
-0.2393208, 0.7986071, 0.4599116, 0, 1, 0.5568628, 1,
-0.2370524, 0.4336514, -0.1651489, 0, 1, 0.5607843, 1,
-0.2366217, 0.8620173, -0.9146622, 0, 1, 0.5686275, 1,
-0.235018, -0.6032056, -4.04985, 0, 1, 0.572549, 1,
-0.2340742, 0.3562369, 0.1122875, 0, 1, 0.5803922, 1,
-0.2320905, 0.1112009, -0.5441646, 0, 1, 0.5843138, 1,
-0.2216189, 0.2334518, -1.636176, 0, 1, 0.5921569, 1,
-0.2175239, 0.3221158, -0.8840098, 0, 1, 0.5960785, 1,
-0.2041956, 1.174371, 1.082406, 0, 1, 0.6039216, 1,
-0.1999388, 0.3438694, -0.9844593, 0, 1, 0.6117647, 1,
-0.1975001, 0.2358071, -3.177809, 0, 1, 0.6156863, 1,
-0.19699, -0.9377343, -3.505383, 0, 1, 0.6235294, 1,
-0.1945862, -2.344236, -3.474582, 0, 1, 0.627451, 1,
-0.191292, -1.156169, -3.22074, 0, 1, 0.6352941, 1,
-0.1882451, 0.11492, -1.441693, 0, 1, 0.6392157, 1,
-0.1878198, -0.3223313, -2.597447, 0, 1, 0.6470588, 1,
-0.1742473, 1.291902, -0.4023916, 0, 1, 0.6509804, 1,
-0.1700286, 0.5919836, -0.8941625, 0, 1, 0.6588235, 1,
-0.1687823, 0.6791235, -2.565915, 0, 1, 0.6627451, 1,
-0.1591008, 0.5084568, 0.193086, 0, 1, 0.6705883, 1,
-0.1580328, 1.68121, -2.579009, 0, 1, 0.6745098, 1,
-0.1579972, -0.2321345, -1.508696, 0, 1, 0.682353, 1,
-0.1572802, -0.9252883, -4.143746, 0, 1, 0.6862745, 1,
-0.1565923, 0.7634099, 0.01403474, 0, 1, 0.6941177, 1,
-0.1544698, -0.4891928, -0.9384891, 0, 1, 0.7019608, 1,
-0.1498969, 0.5144047, -0.1888688, 0, 1, 0.7058824, 1,
-0.1452337, 0.249631, 0.5935871, 0, 1, 0.7137255, 1,
-0.1422406, 2.539663, -0.6894635, 0, 1, 0.7176471, 1,
-0.1421169, -0.8825313, -2.7412, 0, 1, 0.7254902, 1,
-0.1412483, -1.193179, -3.944425, 0, 1, 0.7294118, 1,
-0.1406494, 1.111683, 0.7481296, 0, 1, 0.7372549, 1,
-0.1369583, -0.6337817, -1.115403, 0, 1, 0.7411765, 1,
-0.1351967, 1.452777, -0.8743412, 0, 1, 0.7490196, 1,
-0.1345522, 1.007136, -1.745796, 0, 1, 0.7529412, 1,
-0.1309, 1.20309, 1.295436, 0, 1, 0.7607843, 1,
-0.1281967, -1.527331, -3.606951, 0, 1, 0.7647059, 1,
-0.1261566, -0.5893463, -3.501142, 0, 1, 0.772549, 1,
-0.1260299, -0.7107551, -3.590247, 0, 1, 0.7764706, 1,
-0.1256797, 0.4220999, 0.6199107, 0, 1, 0.7843137, 1,
-0.1201117, 1.078451, -0.4671956, 0, 1, 0.7882353, 1,
-0.1190667, -0.5024427, -1.525925, 0, 1, 0.7960784, 1,
-0.1165394, -0.3007686, -1.832482, 0, 1, 0.8039216, 1,
-0.1150653, 0.00125806, -1.563672, 0, 1, 0.8078431, 1,
-0.1127181, 0.8953421, 0.1399135, 0, 1, 0.8156863, 1,
-0.1119267, 0.4017044, 0.3458295, 0, 1, 0.8196079, 1,
-0.1116743, -1.359287, -2.613765, 0, 1, 0.827451, 1,
-0.1112486, 0.5874617, 0.546287, 0, 1, 0.8313726, 1,
-0.1112332, -1.690075, -3.497435, 0, 1, 0.8392157, 1,
-0.1099645, 0.8277799, -0.5429727, 0, 1, 0.8431373, 1,
-0.1080334, -0.5045283, -2.29746, 0, 1, 0.8509804, 1,
-0.106458, -0.4509993, -1.962286, 0, 1, 0.854902, 1,
-0.1034343, 0.01891608, -0.05978107, 0, 1, 0.8627451, 1,
-0.1008488, -0.1867944, -2.461647, 0, 1, 0.8666667, 1,
-0.09875688, 0.06190481, -0.406871, 0, 1, 0.8745098, 1,
-0.09521964, 0.04820114, -1.381535, 0, 1, 0.8784314, 1,
-0.09433202, -0.2094634, -2.948315, 0, 1, 0.8862745, 1,
-0.09141269, -1.137076, -3.63666, 0, 1, 0.8901961, 1,
-0.0897928, -0.9269488, -2.200119, 0, 1, 0.8980392, 1,
-0.08412411, 1.061514, 1.21057, 0, 1, 0.9058824, 1,
-0.08373471, 2.6314, 0.1472399, 0, 1, 0.9098039, 1,
-0.0748846, -0.9970461, -3.275937, 0, 1, 0.9176471, 1,
-0.06951649, 1.037176, 0.9240777, 0, 1, 0.9215686, 1,
-0.06902085, -1.809476, -3.890804, 0, 1, 0.9294118, 1,
-0.06860457, 1.013891, 0.6871281, 0, 1, 0.9333333, 1,
-0.0587742, -0.685506, -3.594176, 0, 1, 0.9411765, 1,
-0.05823806, -1.540483, -3.169424, 0, 1, 0.945098, 1,
-0.05774523, -1.802057, -2.904897, 0, 1, 0.9529412, 1,
-0.05261106, -0.838852, -3.15381, 0, 1, 0.9568627, 1,
-0.04934279, -0.03289551, -2.807828, 0, 1, 0.9647059, 1,
-0.04895756, 0.5802212, -1.640293, 0, 1, 0.9686275, 1,
-0.0475872, 0.1688256, 0.6716945, 0, 1, 0.9764706, 1,
-0.04705266, 0.9899644, 0.1962084, 0, 1, 0.9803922, 1,
-0.03929595, 0.8844139, 0.6079003, 0, 1, 0.9882353, 1,
-0.03865784, 0.01794548, -2.662705, 0, 1, 0.9921569, 1,
-0.03509889, 0.9219321, -1.391116, 0, 1, 1, 1,
-0.02689658, 0.1125624, 2.033418, 0, 0.9921569, 1, 1,
-0.02299963, -0.5716251, -3.265411, 0, 0.9882353, 1, 1,
-0.02290835, 0.9637221, -0.2324454, 0, 0.9803922, 1, 1,
-0.008693346, 0.996789, -0.464173, 0, 0.9764706, 1, 1,
-0.008596146, -0.5847318, -3.069184, 0, 0.9686275, 1, 1,
-0.008556393, 0.2514289, -0.7709212, 0, 0.9647059, 1, 1,
-0.001867758, 1.515184, 0.469391, 0, 0.9568627, 1, 1,
0.004217654, 1.986336, -1.202514, 0, 0.9529412, 1, 1,
0.01104111, 0.5386103, -0.6636434, 0, 0.945098, 1, 1,
0.01170171, 0.6235881, 0.9447191, 0, 0.9411765, 1, 1,
0.01894771, -1.790448, 3.216269, 0, 0.9333333, 1, 1,
0.02033591, 0.1725876, -0.8125144, 0, 0.9294118, 1, 1,
0.02645196, -0.5587958, 2.986211, 0, 0.9215686, 1, 1,
0.02999548, -0.7870682, 2.427593, 0, 0.9176471, 1, 1,
0.03006801, 1.489861, -0.06301796, 0, 0.9098039, 1, 1,
0.03290614, -0.4874664, 3.839112, 0, 0.9058824, 1, 1,
0.03374679, 0.2596555, -0.9469231, 0, 0.8980392, 1, 1,
0.03501625, 0.8363915, 0.1138673, 0, 0.8901961, 1, 1,
0.04206262, 1.122427, -1.521338, 0, 0.8862745, 1, 1,
0.04262433, -1.498815, 2.813762, 0, 0.8784314, 1, 1,
0.04338303, -1.32122, 3.00625, 0, 0.8745098, 1, 1,
0.04472235, -1.761999, 4.420304, 0, 0.8666667, 1, 1,
0.04824564, -0.9624018, 4.32668, 0, 0.8627451, 1, 1,
0.04992925, -0.3306507, 3.909183, 0, 0.854902, 1, 1,
0.05453889, 0.4939563, -1.261837, 0, 0.8509804, 1, 1,
0.05713417, -0.1384472, 4.135896, 0, 0.8431373, 1, 1,
0.05804454, 2.912994, 0.2606552, 0, 0.8392157, 1, 1,
0.06494353, 0.2189137, 1.582487, 0, 0.8313726, 1, 1,
0.07952153, -0.6779479, 3.849384, 0, 0.827451, 1, 1,
0.08590943, 0.7951942, 0.1509327, 0, 0.8196079, 1, 1,
0.08878055, -1.033475, 4.293182, 0, 0.8156863, 1, 1,
0.09409373, -1.007968, 2.243867, 0, 0.8078431, 1, 1,
0.09468157, 0.9739603, 0.07940397, 0, 0.8039216, 1, 1,
0.09490436, -1.512405, 1.924638, 0, 0.7960784, 1, 1,
0.1003379, 0.09903831, 1.891955, 0, 0.7882353, 1, 1,
0.1033709, 0.4452915, -1.081959, 0, 0.7843137, 1, 1,
0.1042914, 0.09065844, 2.900968, 0, 0.7764706, 1, 1,
0.1045453, -2.348453, 4.604349, 0, 0.772549, 1, 1,
0.104725, 0.03661641, 1.681154, 0, 0.7647059, 1, 1,
0.1052786, -0.3242092, 4.014568, 0, 0.7607843, 1, 1,
0.1058309, -0.6582192, 2.549495, 0, 0.7529412, 1, 1,
0.1113617, -1.465672, 1.85222, 0, 0.7490196, 1, 1,
0.1121113, 0.693413, 0.7342027, 0, 0.7411765, 1, 1,
0.1130123, 1.206481, -1.168427, 0, 0.7372549, 1, 1,
0.1165363, 0.8164933, -1.496277, 0, 0.7294118, 1, 1,
0.1187151, 1.659412, -0.4081878, 0, 0.7254902, 1, 1,
0.1188488, -0.3495466, 3.092695, 0, 0.7176471, 1, 1,
0.120272, -1.904266, 0.5183741, 0, 0.7137255, 1, 1,
0.1208981, -0.9085035, 4.143461, 0, 0.7058824, 1, 1,
0.1240957, -2.134279, 4.021279, 0, 0.6980392, 1, 1,
0.1245717, -1.738029, 3.707768, 0, 0.6941177, 1, 1,
0.1249254, 0.5281842, -0.2133066, 0, 0.6862745, 1, 1,
0.1257692, 0.6419674, 0.5024182, 0, 0.682353, 1, 1,
0.1390749, -2.333756, 2.400497, 0, 0.6745098, 1, 1,
0.1396086, -0.2972164, 3.750363, 0, 0.6705883, 1, 1,
0.1412392, -0.1835311, 2.688174, 0, 0.6627451, 1, 1,
0.1464834, -0.4234356, 2.483849, 0, 0.6588235, 1, 1,
0.1497924, -1.487586, 4.057554, 0, 0.6509804, 1, 1,
0.1508307, -1.458737, 3.684721, 0, 0.6470588, 1, 1,
0.1508979, -0.6336538, 3.189951, 0, 0.6392157, 1, 1,
0.154116, -1.424815, 3.342623, 0, 0.6352941, 1, 1,
0.163431, -2.009219, 3.087834, 0, 0.627451, 1, 1,
0.1688301, -0.1666145, 2.730621, 0, 0.6235294, 1, 1,
0.1733251, -1.389862, 1.956724, 0, 0.6156863, 1, 1,
0.1746528, 2.654184, 0.3111036, 0, 0.6117647, 1, 1,
0.1747241, 0.8973933, 0.9113887, 0, 0.6039216, 1, 1,
0.1794816, 0.7948206, -0.05828812, 0, 0.5960785, 1, 1,
0.1804357, -1.25674, 4.285412, 0, 0.5921569, 1, 1,
0.1823995, 0.8170781, 0.8668056, 0, 0.5843138, 1, 1,
0.1827467, 1.102939, -0.4479496, 0, 0.5803922, 1, 1,
0.1830066, -0.4984194, 4.109226, 0, 0.572549, 1, 1,
0.1835242, 0.2934791, 1.531338, 0, 0.5686275, 1, 1,
0.1840757, -1.693556, 2.633619, 0, 0.5607843, 1, 1,
0.1855506, 0.7772696, 0.7540473, 0, 0.5568628, 1, 1,
0.1856362, 0.0680135, 1.314553, 0, 0.5490196, 1, 1,
0.1858644, 0.576474, -0.8757839, 0, 0.5450981, 1, 1,
0.1890747, -0.01652969, 2.499178, 0, 0.5372549, 1, 1,
0.1895922, -0.003579486, 0.6446695, 0, 0.5333334, 1, 1,
0.195167, -0.2219183, 1.356055, 0, 0.5254902, 1, 1,
0.1960602, 0.5985368, -0.4635929, 0, 0.5215687, 1, 1,
0.2073082, 1.893765, 0.3378049, 0, 0.5137255, 1, 1,
0.2097334, -0.1304571, 1.678778, 0, 0.509804, 1, 1,
0.2097826, -1.299895, 2.535221, 0, 0.5019608, 1, 1,
0.2121891, -1.595352, 5.053337, 0, 0.4941176, 1, 1,
0.2126905, 1.969377, -0.9242124, 0, 0.4901961, 1, 1,
0.2182914, 0.1028465, 2.465998, 0, 0.4823529, 1, 1,
0.2234448, -0.7971881, 2.322709, 0, 0.4784314, 1, 1,
0.2251738, 1.318554, -0.8592677, 0, 0.4705882, 1, 1,
0.2261028, 1.397679, 0.9826773, 0, 0.4666667, 1, 1,
0.229697, -0.1727767, 2.438603, 0, 0.4588235, 1, 1,
0.231193, -0.6359248, 3.924055, 0, 0.454902, 1, 1,
0.2328012, -0.06997783, 0.4862768, 0, 0.4470588, 1, 1,
0.2334116, -1.437053, 4.157372, 0, 0.4431373, 1, 1,
0.2338818, -0.4374192, 2.685307, 0, 0.4352941, 1, 1,
0.2340164, 2.111482, 0.03018806, 0, 0.4313726, 1, 1,
0.2341338, -0.6494823, 4.265567, 0, 0.4235294, 1, 1,
0.2370775, 1.388003, 1.635888, 0, 0.4196078, 1, 1,
0.2383761, -1.162485, 3.844471, 0, 0.4117647, 1, 1,
0.2388726, 0.3310305, -1.051549, 0, 0.4078431, 1, 1,
0.2438913, 1.166287, -0.1401237, 0, 0.4, 1, 1,
0.2442581, 0.8019989, 1.583638, 0, 0.3921569, 1, 1,
0.2468839, -0.5206007, 3.538114, 0, 0.3882353, 1, 1,
0.2471821, 0.200293, 1.749218, 0, 0.3803922, 1, 1,
0.2475122, -1.17019, 2.892864, 0, 0.3764706, 1, 1,
0.2493034, -0.7487069, 2.140881, 0, 0.3686275, 1, 1,
0.2500455, -0.4807166, 3.236422, 0, 0.3647059, 1, 1,
0.2507436, -1.316867, 2.816627, 0, 0.3568628, 1, 1,
0.252056, -0.1720809, 0.4085025, 0, 0.3529412, 1, 1,
0.2563721, -0.6287773, 2.667069, 0, 0.345098, 1, 1,
0.2605402, -2.056507, 4.869889, 0, 0.3411765, 1, 1,
0.2606329, 0.07820328, 0.5191521, 0, 0.3333333, 1, 1,
0.2648683, 1.108308, -0.7143105, 0, 0.3294118, 1, 1,
0.2656663, -2.188782, 3.597275, 0, 0.3215686, 1, 1,
0.267481, 0.873408, 1.225078, 0, 0.3176471, 1, 1,
0.2702056, -1.499781, 2.167007, 0, 0.3098039, 1, 1,
0.2714938, -0.04778789, 1.44121, 0, 0.3058824, 1, 1,
0.2765212, -0.1387772, 1.658701, 0, 0.2980392, 1, 1,
0.2786, -1.09597, 3.310431, 0, 0.2901961, 1, 1,
0.2816346, 0.3668318, 1.051437, 0, 0.2862745, 1, 1,
0.2836485, -0.8295224, 3.203499, 0, 0.2784314, 1, 1,
0.2841507, -0.129126, 1.663344, 0, 0.2745098, 1, 1,
0.2889568, 0.879307, -0.465434, 0, 0.2666667, 1, 1,
0.2889993, 1.232491, -0.2871421, 0, 0.2627451, 1, 1,
0.3025451, -0.8956673, 3.537762, 0, 0.254902, 1, 1,
0.3031661, 1.253537, -0.8299133, 0, 0.2509804, 1, 1,
0.3055952, 0.1564594, 1.053516, 0, 0.2431373, 1, 1,
0.3061385, 1.004654, 1.297661, 0, 0.2392157, 1, 1,
0.3071603, 1.953616, -1.104004, 0, 0.2313726, 1, 1,
0.3097094, -1.803897, 1.275679, 0, 0.227451, 1, 1,
0.313628, 1.830526, -1.64948, 0, 0.2196078, 1, 1,
0.3137684, 1.043645, -0.6114023, 0, 0.2156863, 1, 1,
0.3149844, -0.9008635, 1.439843, 0, 0.2078431, 1, 1,
0.3245764, -1.487373, 3.993937, 0, 0.2039216, 1, 1,
0.3261541, 0.7827913, 2.398638, 0, 0.1960784, 1, 1,
0.3274525, -1.701355, 3.856459, 0, 0.1882353, 1, 1,
0.3276377, 1.081289, -0.03285983, 0, 0.1843137, 1, 1,
0.3279621, 1.359303, -0.8532938, 0, 0.1764706, 1, 1,
0.3339413, -1.778208, 4.386163, 0, 0.172549, 1, 1,
0.3442879, 0.1893943, 2.888585, 0, 0.1647059, 1, 1,
0.3487163, -0.3245823, 0.2016964, 0, 0.1607843, 1, 1,
0.3506993, 1.361284, -1.586604, 0, 0.1529412, 1, 1,
0.3569126, -1.63501, 3.191293, 0, 0.1490196, 1, 1,
0.3586138, -1.16154, 1.692767, 0, 0.1411765, 1, 1,
0.3598856, -0.1077, 1.883036, 0, 0.1372549, 1, 1,
0.3628325, -0.07441606, 3.174035, 0, 0.1294118, 1, 1,
0.3664424, 0.4930944, -0.6404937, 0, 0.1254902, 1, 1,
0.3667504, 0.4048525, 0.09748874, 0, 0.1176471, 1, 1,
0.3677617, -0.3951696, 1.781137, 0, 0.1137255, 1, 1,
0.3717679, -0.5074504, 2.091364, 0, 0.1058824, 1, 1,
0.373866, -1.06355, 4.168587, 0, 0.09803922, 1, 1,
0.3742131, -0.2707122, 1.512815, 0, 0.09411765, 1, 1,
0.3760311, 0.03583675, 0.8948103, 0, 0.08627451, 1, 1,
0.3761848, -0.126259, 2.592787, 0, 0.08235294, 1, 1,
0.3807573, 0.341538, 1.884172, 0, 0.07450981, 1, 1,
0.3824951, -0.1024441, 0.7825702, 0, 0.07058824, 1, 1,
0.3832057, 2.182365, -2.781221, 0, 0.0627451, 1, 1,
0.3920062, 0.1214124, 3.136078, 0, 0.05882353, 1, 1,
0.3936048, -0.1371979, 1.898509, 0, 0.05098039, 1, 1,
0.3958859, 0.02512985, 1.462977, 0, 0.04705882, 1, 1,
0.3988554, -0.2498183, 4.632679, 0, 0.03921569, 1, 1,
0.4013449, 1.386154, 0.8399465, 0, 0.03529412, 1, 1,
0.4052444, -1.008369, 3.68099, 0, 0.02745098, 1, 1,
0.4102722, -1.405155, 2.843021, 0, 0.02352941, 1, 1,
0.4105845, 1.151243, 0.689774, 0, 0.01568628, 1, 1,
0.415207, -0.0603406, 1.76513, 0, 0.01176471, 1, 1,
0.4199304, -1.27097, 4.557, 0, 0.003921569, 1, 1,
0.4203874, 0.0328056, 0.4338519, 0.003921569, 0, 1, 1,
0.4204965, 1.060407, 0.7687464, 0.007843138, 0, 1, 1,
0.4268535, -0.3717324, 1.137276, 0.01568628, 0, 1, 1,
0.4295876, -0.6772831, 3.598732, 0.01960784, 0, 1, 1,
0.4343084, 1.167202, 0.9638259, 0.02745098, 0, 1, 1,
0.4344311, 1.483308, -0.2128957, 0.03137255, 0, 1, 1,
0.4385277, -0.4681965, 2.149163, 0.03921569, 0, 1, 1,
0.4419165, -1.83085, 5.209155, 0.04313726, 0, 1, 1,
0.4431289, 0.972132, 0.6745502, 0.05098039, 0, 1, 1,
0.4477243, 0.5599264, 0.63986, 0.05490196, 0, 1, 1,
0.4479999, -1.288163, 3.571177, 0.0627451, 0, 1, 1,
0.4524181, -1.630901, 2.657938, 0.06666667, 0, 1, 1,
0.4569473, 0.3715663, 1.019014, 0.07450981, 0, 1, 1,
0.4593191, 0.2238725, 0.9911564, 0.07843138, 0, 1, 1,
0.460116, -0.4862965, 2.702412, 0.08627451, 0, 1, 1,
0.4621691, -0.5903593, 2.20143, 0.09019608, 0, 1, 1,
0.462337, -1.585772, 4.815883, 0.09803922, 0, 1, 1,
0.4659007, -0.272184, 2.919854, 0.1058824, 0, 1, 1,
0.4678917, 0.9664633, -0.1803447, 0.1098039, 0, 1, 1,
0.4690491, -1.085428, 5.142941, 0.1176471, 0, 1, 1,
0.4732057, -0.8213398, 4.015172, 0.1215686, 0, 1, 1,
0.4751586, 0.438073, 1.704341, 0.1294118, 0, 1, 1,
0.4784425, 1.126336, -0.2326066, 0.1333333, 0, 1, 1,
0.479483, 1.285323, -0.1448308, 0.1411765, 0, 1, 1,
0.4822347, 1.552679, -0.4506887, 0.145098, 0, 1, 1,
0.482421, 1.47832, 0.2643955, 0.1529412, 0, 1, 1,
0.4831531, 1.960458, -0.4468772, 0.1568628, 0, 1, 1,
0.4868654, 2.791258, -1.149903, 0.1647059, 0, 1, 1,
0.4870282, -0.1821878, 0.7257353, 0.1686275, 0, 1, 1,
0.487309, 1.168309, 0.2012015, 0.1764706, 0, 1, 1,
0.491767, -1.29288, 3.634408, 0.1803922, 0, 1, 1,
0.4941576, 0.4934247, -0.03544117, 0.1882353, 0, 1, 1,
0.4988313, 0.4544813, 1.680693, 0.1921569, 0, 1, 1,
0.4989305, -0.5236827, 3.061368, 0.2, 0, 1, 1,
0.5000827, -1.030342, 2.142511, 0.2078431, 0, 1, 1,
0.5078605, -0.09187728, 0.3248725, 0.2117647, 0, 1, 1,
0.5087159, -1.498524, 3.188849, 0.2196078, 0, 1, 1,
0.5089055, -1.838858, 4.521783, 0.2235294, 0, 1, 1,
0.5122058, -1.188322, 1.451656, 0.2313726, 0, 1, 1,
0.5128301, 0.2668221, 2.267741, 0.2352941, 0, 1, 1,
0.5161996, -0.1826627, 2.030231, 0.2431373, 0, 1, 1,
0.5196146, -1.465028, 2.10786, 0.2470588, 0, 1, 1,
0.5200933, -0.2725323, 1.789528, 0.254902, 0, 1, 1,
0.5217516, -0.4837584, 4.228691, 0.2588235, 0, 1, 1,
0.5224745, 0.8805912, 0.7302173, 0.2666667, 0, 1, 1,
0.5251378, -1.622533, 1.529193, 0.2705882, 0, 1, 1,
0.5256016, -0.8074867, 1.903421, 0.2784314, 0, 1, 1,
0.5281978, -0.4041749, 1.452062, 0.282353, 0, 1, 1,
0.5363279, 0.9889743, 2.220254, 0.2901961, 0, 1, 1,
0.537129, -0.3671841, 2.240129, 0.2941177, 0, 1, 1,
0.5403802, 0.04278241, 0.5483198, 0.3019608, 0, 1, 1,
0.5452945, -0.5422852, 1.349579, 0.3098039, 0, 1, 1,
0.5469638, 0.6042233, 1.522693, 0.3137255, 0, 1, 1,
0.5512869, 0.06711839, 1.75225, 0.3215686, 0, 1, 1,
0.5550191, 1.809051, -0.5252733, 0.3254902, 0, 1, 1,
0.5693818, -1.955103, 1.863115, 0.3333333, 0, 1, 1,
0.5788392, 0.935394, 0.04359737, 0.3372549, 0, 1, 1,
0.5813295, 0.2476285, 2.053138, 0.345098, 0, 1, 1,
0.5815516, 0.3717255, 0.4170347, 0.3490196, 0, 1, 1,
0.585832, 0.3327306, 1.610384, 0.3568628, 0, 1, 1,
0.5883495, -0.4850405, 2.548211, 0.3607843, 0, 1, 1,
0.5989302, -2.263766, 2.765708, 0.3686275, 0, 1, 1,
0.6046753, 1.173251, 0.07460594, 0.372549, 0, 1, 1,
0.605076, -2.144697, 1.476983, 0.3803922, 0, 1, 1,
0.6058137, 1.583055, -1.073536, 0.3843137, 0, 1, 1,
0.6090792, -0.7272372, 1.969518, 0.3921569, 0, 1, 1,
0.611828, -0.08899114, 1.687918, 0.3960784, 0, 1, 1,
0.622851, -2.765402, 3.385099, 0.4039216, 0, 1, 1,
0.6271331, 0.1394153, 1.168738, 0.4117647, 0, 1, 1,
0.6277314, 1.356566, -0.1870139, 0.4156863, 0, 1, 1,
0.6328363, 0.02564082, 2.238465, 0.4235294, 0, 1, 1,
0.6337, -0.3641065, 2.665648, 0.427451, 0, 1, 1,
0.6365982, 0.833593, 1.488783, 0.4352941, 0, 1, 1,
0.63814, -0.6428824, 2.193574, 0.4392157, 0, 1, 1,
0.6396741, 0.4811134, -0.007453906, 0.4470588, 0, 1, 1,
0.641703, -1.190236, 2.310657, 0.4509804, 0, 1, 1,
0.6445307, -0.8609794, 2.766869, 0.4588235, 0, 1, 1,
0.6500416, 0.03730038, 0.8671982, 0.4627451, 0, 1, 1,
0.6501129, -1.39296, 2.036422, 0.4705882, 0, 1, 1,
0.6543222, 0.02890773, 0.4464796, 0.4745098, 0, 1, 1,
0.6663318, 0.6461428, 0.8782938, 0.4823529, 0, 1, 1,
0.6677194, 1.325974, 1.54089, 0.4862745, 0, 1, 1,
0.6726278, 0.2263971, 2.549005, 0.4941176, 0, 1, 1,
0.6736872, -0.8128676, 3.30015, 0.5019608, 0, 1, 1,
0.675619, 0.6962633, 0.4159566, 0.5058824, 0, 1, 1,
0.6777149, -0.6310028, 1.541469, 0.5137255, 0, 1, 1,
0.6849374, -0.3975722, 1.343968, 0.5176471, 0, 1, 1,
0.6871415, -0.2967571, 4.608266, 0.5254902, 0, 1, 1,
0.7043539, 0.443365, -0.9598882, 0.5294118, 0, 1, 1,
0.7141216, 1.135264, -0.295351, 0.5372549, 0, 1, 1,
0.7164444, 0.0250344, 2.563964, 0.5411765, 0, 1, 1,
0.7363511, 0.08599204, 1.369449, 0.5490196, 0, 1, 1,
0.7364504, -1.412707, 2.620951, 0.5529412, 0, 1, 1,
0.7400073, -0.626228, 2.84848, 0.5607843, 0, 1, 1,
0.7406901, -1.213612, 1.814629, 0.5647059, 0, 1, 1,
0.7410684, -0.1160047, -0.168172, 0.572549, 0, 1, 1,
0.7415417, -1.471326, 3.616771, 0.5764706, 0, 1, 1,
0.745315, 1.257443, -0.07483805, 0.5843138, 0, 1, 1,
0.745434, 0.1660648, 1.47934, 0.5882353, 0, 1, 1,
0.7481142, 0.3250561, 1.717729, 0.5960785, 0, 1, 1,
0.7506487, -0.7973173, 1.500353, 0.6039216, 0, 1, 1,
0.7588794, 2.14687, 0.7709543, 0.6078432, 0, 1, 1,
0.7726056, -1.047962, 3.911953, 0.6156863, 0, 1, 1,
0.7782049, -2.357544, 1.730881, 0.6196079, 0, 1, 1,
0.7791351, 1.778767, 2.267176, 0.627451, 0, 1, 1,
0.7791918, 0.08755194, 1.037693, 0.6313726, 0, 1, 1,
0.780032, -1.591852, 2.762275, 0.6392157, 0, 1, 1,
0.7870067, 2.654963, -3.338693, 0.6431373, 0, 1, 1,
0.8050359, -1.614621, 3.494842, 0.6509804, 0, 1, 1,
0.8056141, 0.3886375, 1.927595, 0.654902, 0, 1, 1,
0.8058066, 2.18238, 1.038562, 0.6627451, 0, 1, 1,
0.807445, -1.139754, 2.370774, 0.6666667, 0, 1, 1,
0.8128211, 0.6325223, 1.045324, 0.6745098, 0, 1, 1,
0.8158147, 1.739635, 0.6336882, 0.6784314, 0, 1, 1,
0.8214104, -0.0001960981, 0.9811827, 0.6862745, 0, 1, 1,
0.8243555, 1.117977, 2.719765, 0.6901961, 0, 1, 1,
0.8326823, -0.2387492, -0.2174076, 0.6980392, 0, 1, 1,
0.8330401, -0.3148896, 0.9805875, 0.7058824, 0, 1, 1,
0.8359112, 1.283197, -0.5715849, 0.7098039, 0, 1, 1,
0.844309, -0.3313322, 3.581792, 0.7176471, 0, 1, 1,
0.8445553, -0.5145571, 0.9443306, 0.7215686, 0, 1, 1,
0.8512859, 0.06539206, 0.4972951, 0.7294118, 0, 1, 1,
0.8541999, -0.8222571, 0.9982117, 0.7333333, 0, 1, 1,
0.8564178, -1.159204, 1.854275, 0.7411765, 0, 1, 1,
0.859264, -0.06537492, 0.3405, 0.7450981, 0, 1, 1,
0.8632095, 0.9120646, -0.5057108, 0.7529412, 0, 1, 1,
0.8676261, -1.174121, 0.4245176, 0.7568628, 0, 1, 1,
0.8677705, -1.875444, 2.15918, 0.7647059, 0, 1, 1,
0.8694243, -0.8019047, 3.601927, 0.7686275, 0, 1, 1,
0.8704838, -0.8107812, 1.771423, 0.7764706, 0, 1, 1,
0.8812718, -0.4188133, 0.6933253, 0.7803922, 0, 1, 1,
0.8814259, 2.70916, 0.9261274, 0.7882353, 0, 1, 1,
0.8836752, -0.3868049, 1.759194, 0.7921569, 0, 1, 1,
0.8872492, -2.110615, 4.23878, 0.8, 0, 1, 1,
0.8882017, 0.07898197, 2.03121, 0.8078431, 0, 1, 1,
0.8906963, -0.694172, 1.874369, 0.8117647, 0, 1, 1,
0.8956761, 0.692281, -0.1210474, 0.8196079, 0, 1, 1,
0.8961242, 0.7493622, 1.356915, 0.8235294, 0, 1, 1,
0.8963072, -0.5622008, 1.07283, 0.8313726, 0, 1, 1,
0.8980308, 0.1627582, 0.5671443, 0.8352941, 0, 1, 1,
0.9044576, -0.7632436, 1.616219, 0.8431373, 0, 1, 1,
0.9053825, 1.672656, 0.1021151, 0.8470588, 0, 1, 1,
0.9093541, -0.4311865, 1.64519, 0.854902, 0, 1, 1,
0.9129306, 0.5341314, 1.345896, 0.8588235, 0, 1, 1,
0.9171649, -1.453068, 3.706047, 0.8666667, 0, 1, 1,
0.9180521, 1.632992, -0.6873327, 0.8705882, 0, 1, 1,
0.9219463, -0.1738376, 2.018388, 0.8784314, 0, 1, 1,
0.9220074, -1.332521, 2.562561, 0.8823529, 0, 1, 1,
0.9285319, 0.1306584, 2.107372, 0.8901961, 0, 1, 1,
0.9322669, -1.052357, 3.017489, 0.8941177, 0, 1, 1,
0.9475929, -0.6302798, 0.340476, 0.9019608, 0, 1, 1,
0.9526088, -2.213572, 1.971025, 0.9098039, 0, 1, 1,
0.9571707, 0.8465297, 1.537812, 0.9137255, 0, 1, 1,
0.964153, 0.6586932, 0.8244827, 0.9215686, 0, 1, 1,
0.9650238, 1.830749, -0.6147908, 0.9254902, 0, 1, 1,
0.9700229, -1.377998, 0.6690648, 0.9333333, 0, 1, 1,
0.9829043, -0.2900962, 2.833642, 0.9372549, 0, 1, 1,
0.9857756, 0.06475858, 0.549798, 0.945098, 0, 1, 1,
0.9869545, -0.9672574, 2.856995, 0.9490196, 0, 1, 1,
0.9997999, -1.478875, 1.810381, 0.9568627, 0, 1, 1,
1.000409, -0.164792, 2.354628, 0.9607843, 0, 1, 1,
1.000857, -0.4090843, 1.004101, 0.9686275, 0, 1, 1,
1.003827, -0.886783, 1.694927, 0.972549, 0, 1, 1,
1.006017, -0.2095949, 1.025808, 0.9803922, 0, 1, 1,
1.008555, 0.682338, 1.783852, 0.9843137, 0, 1, 1,
1.008754, 0.6599951, 0.7503642, 0.9921569, 0, 1, 1,
1.012428, -0.4662882, 1.645429, 0.9960784, 0, 1, 1,
1.018697, -1.254758, 1.45545, 1, 0, 0.9960784, 1,
1.0247, -0.6615653, 2.834537, 1, 0, 0.9882353, 1,
1.02485, -1.406669, 1.18856, 1, 0, 0.9843137, 1,
1.030421, 0.5101206, -0.2933541, 1, 0, 0.9764706, 1,
1.030899, -0.4259623, 3.200313, 1, 0, 0.972549, 1,
1.032592, 0.6873917, 1.805998, 1, 0, 0.9647059, 1,
1.048881, 1.328033, -0.1402113, 1, 0, 0.9607843, 1,
1.053457, -0.1345321, 1.680521, 1, 0, 0.9529412, 1,
1.053621, -3.39217, 1.862772, 1, 0, 0.9490196, 1,
1.05438, -0.4948318, 2.277675, 1, 0, 0.9411765, 1,
1.057386, 0.7244044, 1.326643, 1, 0, 0.9372549, 1,
1.057741, 0.07970651, 1.624067, 1, 0, 0.9294118, 1,
1.062919, 0.2061313, 2.46989, 1, 0, 0.9254902, 1,
1.062952, 1.363958, 1.048361, 1, 0, 0.9176471, 1,
1.071285, -2.211625, 2.284289, 1, 0, 0.9137255, 1,
1.079743, 0.3152688, 0.6502383, 1, 0, 0.9058824, 1,
1.079805, 1.551436, 1.300176, 1, 0, 0.9019608, 1,
1.08089, -1.471061, 2.225309, 1, 0, 0.8941177, 1,
1.084279, 0.119549, 1.978453, 1, 0, 0.8862745, 1,
1.085847, -0.3811281, 0.2889287, 1, 0, 0.8823529, 1,
1.087874, 1.067136, 0.05647685, 1, 0, 0.8745098, 1,
1.087965, 0.227049, 2.56246, 1, 0, 0.8705882, 1,
1.08848, -3.820984, 3.367173, 1, 0, 0.8627451, 1,
1.089565, -0.2879098, 1.534206, 1, 0, 0.8588235, 1,
1.090124, -1.349945, 1.040406, 1, 0, 0.8509804, 1,
1.094272, 0.5896392, 0.1364661, 1, 0, 0.8470588, 1,
1.099922, 0.9617749, 2.215515, 1, 0, 0.8392157, 1,
1.10924, 1.022101, -0.09570203, 1, 0, 0.8352941, 1,
1.110374, -0.9257873, 2.61886, 1, 0, 0.827451, 1,
1.113338, 0.7666482, -0.4868935, 1, 0, 0.8235294, 1,
1.113806, 2.367317, -1.26207, 1, 0, 0.8156863, 1,
1.114664, -0.8749419, 2.000462, 1, 0, 0.8117647, 1,
1.118942, -0.6823953, 1.54723, 1, 0, 0.8039216, 1,
1.120881, -0.05165827, 2.424616, 1, 0, 0.7960784, 1,
1.128695, -0.5357074, 2.798835, 1, 0, 0.7921569, 1,
1.129772, 1.188576, 0.3979948, 1, 0, 0.7843137, 1,
1.131162, -1.103901, 1.578478, 1, 0, 0.7803922, 1,
1.140153, -0.1007674, 1.722878, 1, 0, 0.772549, 1,
1.151986, -0.6403147, 4.214832, 1, 0, 0.7686275, 1,
1.182018, 0.4534575, -0.07006574, 1, 0, 0.7607843, 1,
1.18229, 0.9487415, 0.7555388, 1, 0, 0.7568628, 1,
1.184655, 0.6686794, 1.924067, 1, 0, 0.7490196, 1,
1.21104, -0.4645016, 1.363111, 1, 0, 0.7450981, 1,
1.214109, -0.2169397, 0.3324503, 1, 0, 0.7372549, 1,
1.215996, 0.8955566, 0.1762349, 1, 0, 0.7333333, 1,
1.216347, -0.1614784, 2.777287, 1, 0, 0.7254902, 1,
1.21864, -0.1685928, 2.32378, 1, 0, 0.7215686, 1,
1.219624, 0.7746152, -0.035902, 1, 0, 0.7137255, 1,
1.225904, 0.01765351, 2.263711, 1, 0, 0.7098039, 1,
1.230321, -0.05712276, 0.2386378, 1, 0, 0.7019608, 1,
1.248495, -0.3839521, 2.742586, 1, 0, 0.6941177, 1,
1.260511, -0.9005521, 0.9642481, 1, 0, 0.6901961, 1,
1.268949, -1.038228, 1.365382, 1, 0, 0.682353, 1,
1.270049, 0.9770123, -1.118923, 1, 0, 0.6784314, 1,
1.271246, -2.58271, 2.34389, 1, 0, 0.6705883, 1,
1.272107, 0.2129886, 0.08354633, 1, 0, 0.6666667, 1,
1.286832, 2.202723, 0.365154, 1, 0, 0.6588235, 1,
1.288187, 1.223701, -0.04320034, 1, 0, 0.654902, 1,
1.294316, -0.7525655, 2.494468, 1, 0, 0.6470588, 1,
1.30268, -1.253464, 2.372666, 1, 0, 0.6431373, 1,
1.320558, 2.036118, 0.1954073, 1, 0, 0.6352941, 1,
1.325323, 0.4461031, 1.308912, 1, 0, 0.6313726, 1,
1.335454, 1.436873, 0.09843582, 1, 0, 0.6235294, 1,
1.34031, -0.2217564, 1.430613, 1, 0, 0.6196079, 1,
1.342211, 0.8103232, 1.146012, 1, 0, 0.6117647, 1,
1.343239, 0.02243247, 2.799955, 1, 0, 0.6078432, 1,
1.348294, -1.367266, 2.890072, 1, 0, 0.6, 1,
1.353847, -0.2940027, 0.4209665, 1, 0, 0.5921569, 1,
1.362989, 0.1475425, 0.9897091, 1, 0, 0.5882353, 1,
1.365405, -0.1508019, 1.369146, 1, 0, 0.5803922, 1,
1.368076, -1.495695, 4.228526, 1, 0, 0.5764706, 1,
1.369246, 1.739207, 0.4332521, 1, 0, 0.5686275, 1,
1.370957, 0.2131943, 1.756896, 1, 0, 0.5647059, 1,
1.371609, 1.001262, 1.858608, 1, 0, 0.5568628, 1,
1.372799, 0.8116719, 0.7895373, 1, 0, 0.5529412, 1,
1.373284, -0.02627401, 1.191331, 1, 0, 0.5450981, 1,
1.393174, 1.200112, 0.7439857, 1, 0, 0.5411765, 1,
1.399474, 1.077188, 2.288253, 1, 0, 0.5333334, 1,
1.403419, -0.07438377, -0.2998942, 1, 0, 0.5294118, 1,
1.404512, 0.1639223, 3.126857, 1, 0, 0.5215687, 1,
1.416196, 0.4185367, -0.8341137, 1, 0, 0.5176471, 1,
1.42118, 2.14487, 1.719224, 1, 0, 0.509804, 1,
1.425854, -0.2233831, 1.015674, 1, 0, 0.5058824, 1,
1.449527, -0.7805143, 1.371935, 1, 0, 0.4980392, 1,
1.454513, -0.1902735, 1.503641, 1, 0, 0.4901961, 1,
1.466833, 0.1916225, 0.1911105, 1, 0, 0.4862745, 1,
1.469482, -2.02687, 2.819855, 1, 0, 0.4784314, 1,
1.470432, -1.762202, 1.781114, 1, 0, 0.4745098, 1,
1.474027, -0.06387556, 1.835113, 1, 0, 0.4666667, 1,
1.478236, -0.2281397, 3.46682, 1, 0, 0.4627451, 1,
1.479352, 1.269083, -0.6164393, 1, 0, 0.454902, 1,
1.480832, -0.5920194, 3.673128, 1, 0, 0.4509804, 1,
1.490847, 0.08102918, 2.195416, 1, 0, 0.4431373, 1,
1.510201, 1.923274, 0.666629, 1, 0, 0.4392157, 1,
1.512293, -0.1142594, 1.742377, 1, 0, 0.4313726, 1,
1.552816, 1.80978, 2.273875, 1, 0, 0.427451, 1,
1.554346, 0.6115699, 0.676434, 1, 0, 0.4196078, 1,
1.568642, 0.2471908, -0.1033491, 1, 0, 0.4156863, 1,
1.571368, -0.5952543, 2.686778, 1, 0, 0.4078431, 1,
1.577644, 1.793255, 0.4430823, 1, 0, 0.4039216, 1,
1.578646, 0.4988017, 1.448581, 1, 0, 0.3960784, 1,
1.585113, 0.5372257, 0.5560005, 1, 0, 0.3882353, 1,
1.608965, -0.4887727, 1.794275, 1, 0, 0.3843137, 1,
1.618061, -1.500232, 1.450863, 1, 0, 0.3764706, 1,
1.627309, -1.09695, 1.201454, 1, 0, 0.372549, 1,
1.629982, -1.269553, 1.107451, 1, 0, 0.3647059, 1,
1.634379, -0.6853154, 1.487832, 1, 0, 0.3607843, 1,
1.675645, 0.03235088, 2.179776, 1, 0, 0.3529412, 1,
1.688205, 0.1923156, 2.051761, 1, 0, 0.3490196, 1,
1.690328, 1.214531, 0.3761933, 1, 0, 0.3411765, 1,
1.72717, -1.579137, 2.396122, 1, 0, 0.3372549, 1,
1.727711, -1.424943, 1.772033, 1, 0, 0.3294118, 1,
1.733717, 0.2369315, 2.427637, 1, 0, 0.3254902, 1,
1.745935, -0.3672451, 2.1168, 1, 0, 0.3176471, 1,
1.753479, 0.8789721, 0.6053647, 1, 0, 0.3137255, 1,
1.758906, -2.498143, 2.411697, 1, 0, 0.3058824, 1,
1.76189, -0.3418534, 2.235504, 1, 0, 0.2980392, 1,
1.766129, 0.6622207, 0.2691703, 1, 0, 0.2941177, 1,
1.795111, -0.2042844, 0.1903177, 1, 0, 0.2862745, 1,
1.796774, -0.2683882, 2.555394, 1, 0, 0.282353, 1,
1.827609, -0.1160214, 1.692037, 1, 0, 0.2745098, 1,
1.858619, 0.5936662, 1.205268, 1, 0, 0.2705882, 1,
1.863307, -0.3715232, 1.938576, 1, 0, 0.2627451, 1,
1.865873, 1.199265, 0.9200452, 1, 0, 0.2588235, 1,
1.878797, 0.1844748, 0.3957047, 1, 0, 0.2509804, 1,
1.889571, 0.2464942, 0.5734917, 1, 0, 0.2470588, 1,
1.897505, 0.2191167, 2.083208, 1, 0, 0.2392157, 1,
1.905108, 0.1302807, 0.4808917, 1, 0, 0.2352941, 1,
1.914055, -2.013936, 0.04915841, 1, 0, 0.227451, 1,
1.926785, -0.4325929, 1.698343, 1, 0, 0.2235294, 1,
1.933507, -0.05754231, 1.752963, 1, 0, 0.2156863, 1,
1.933959, 1.401671, 0.7390907, 1, 0, 0.2117647, 1,
1.949624, 0.1293278, 0.4496405, 1, 0, 0.2039216, 1,
1.955346, -0.01129957, 1.583135, 1, 0, 0.1960784, 1,
1.959097, 0.07522235, -1.585792, 1, 0, 0.1921569, 1,
1.976069, 0.1533962, 1.710078, 1, 0, 0.1843137, 1,
1.980501, -0.03856918, 2.112144, 1, 0, 0.1803922, 1,
1.986082, -1.280774, 1.285942, 1, 0, 0.172549, 1,
2.00233, 0.2737993, 1.763572, 1, 0, 0.1686275, 1,
2.038681, -0.5306202, 1.514224, 1, 0, 0.1607843, 1,
2.057855, -0.3705341, 1.478885, 1, 0, 0.1568628, 1,
2.072263, 1.943576, 1.81492, 1, 0, 0.1490196, 1,
2.088069, 1.189876, 1.474858, 1, 0, 0.145098, 1,
2.095937, 0.4838608, -0.3624839, 1, 0, 0.1372549, 1,
2.119249, 0.2976374, 1.419008, 1, 0, 0.1333333, 1,
2.126556, 0.9518086, 1.606492, 1, 0, 0.1254902, 1,
2.135802, 0.4702682, 0.8766376, 1, 0, 0.1215686, 1,
2.145541, -0.3765617, 2.282698, 1, 0, 0.1137255, 1,
2.211286, 0.7163213, 1.96374, 1, 0, 0.1098039, 1,
2.233585, 0.8750232, 1.54247, 1, 0, 0.1019608, 1,
2.234831, -1.983951, 2.779097, 1, 0, 0.09411765, 1,
2.260074, -0.8602136, 1.171345, 1, 0, 0.09019608, 1,
2.278532, -1.043847, 1.60817, 1, 0, 0.08235294, 1,
2.356842, -0.6041566, 0.1581191, 1, 0, 0.07843138, 1,
2.366454, -0.9405313, 1.618989, 1, 0, 0.07058824, 1,
2.381719, -1.118911, 1.800519, 1, 0, 0.06666667, 1,
2.420966, -1.2492, 3.980535, 1, 0, 0.05882353, 1,
2.433494, 0.5703109, 3.330772, 1, 0, 0.05490196, 1,
2.442883, -0.4223638, 0.5512172, 1, 0, 0.04705882, 1,
2.53303, -0.1028557, 1.103617, 1, 0, 0.04313726, 1,
2.612375, -0.03503634, 2.024176, 1, 0, 0.03529412, 1,
2.640627, 0.1376287, 1.47855, 1, 0, 0.03137255, 1,
2.844966, 0.7722712, 1.848026, 1, 0, 0.02352941, 1,
3.073407, 0.1329418, 2.88784, 1, 0, 0.01960784, 1,
3.10169, 0.569575, 1.023271, 1, 0, 0.01176471, 1,
3.26515, -0.5024624, 1.967491, 1, 0, 0.007843138, 1
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
0.1707313, -5.187456, -7.065218, 0, -0.5, 0.5, 0.5,
0.1707313, -5.187456, -7.065218, 1, -0.5, 0.5, 0.5,
0.1707313, -5.187456, -7.065218, 1, 1.5, 0.5, 0.5,
0.1707313, -5.187456, -7.065218, 0, 1.5, 0.5, 0.5
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
-3.972695, 0.209905, -7.065218, 0, -0.5, 0.5, 0.5,
-3.972695, 0.209905, -7.065218, 1, -0.5, 0.5, 0.5,
-3.972695, 0.209905, -7.065218, 1, 1.5, 0.5, 0.5,
-3.972695, 0.209905, -7.065218, 0, 1.5, 0.5, 0.5
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
-3.972695, -5.187456, -0.03854609, 0, -0.5, 0.5, 0.5,
-3.972695, -5.187456, -0.03854609, 1, -0.5, 0.5, 0.5,
-3.972695, -5.187456, -0.03854609, 1, 1.5, 0.5, 0.5,
-3.972695, -5.187456, -0.03854609, 0, 1.5, 0.5, 0.5
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
-2, -3.941911, -5.443678,
3, -3.941911, -5.443678,
-2, -3.941911, -5.443678,
-2, -4.149502, -5.713935,
-1, -3.941911, -5.443678,
-1, -4.149502, -5.713935,
0, -3.941911, -5.443678,
0, -4.149502, -5.713935,
1, -3.941911, -5.443678,
1, -4.149502, -5.713935,
2, -3.941911, -5.443678,
2, -4.149502, -5.713935,
3, -3.941911, -5.443678,
3, -4.149502, -5.713935
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
-2, -4.564683, -6.254448, 0, -0.5, 0.5, 0.5,
-2, -4.564683, -6.254448, 1, -0.5, 0.5, 0.5,
-2, -4.564683, -6.254448, 1, 1.5, 0.5, 0.5,
-2, -4.564683, -6.254448, 0, 1.5, 0.5, 0.5,
-1, -4.564683, -6.254448, 0, -0.5, 0.5, 0.5,
-1, -4.564683, -6.254448, 1, -0.5, 0.5, 0.5,
-1, -4.564683, -6.254448, 1, 1.5, 0.5, 0.5,
-1, -4.564683, -6.254448, 0, 1.5, 0.5, 0.5,
0, -4.564683, -6.254448, 0, -0.5, 0.5, 0.5,
0, -4.564683, -6.254448, 1, -0.5, 0.5, 0.5,
0, -4.564683, -6.254448, 1, 1.5, 0.5, 0.5,
0, -4.564683, -6.254448, 0, 1.5, 0.5, 0.5,
1, -4.564683, -6.254448, 0, -0.5, 0.5, 0.5,
1, -4.564683, -6.254448, 1, -0.5, 0.5, 0.5,
1, -4.564683, -6.254448, 1, 1.5, 0.5, 0.5,
1, -4.564683, -6.254448, 0, 1.5, 0.5, 0.5,
2, -4.564683, -6.254448, 0, -0.5, 0.5, 0.5,
2, -4.564683, -6.254448, 1, -0.5, 0.5, 0.5,
2, -4.564683, -6.254448, 1, 1.5, 0.5, 0.5,
2, -4.564683, -6.254448, 0, 1.5, 0.5, 0.5,
3, -4.564683, -6.254448, 0, -0.5, 0.5, 0.5,
3, -4.564683, -6.254448, 1, -0.5, 0.5, 0.5,
3, -4.564683, -6.254448, 1, 1.5, 0.5, 0.5,
3, -4.564683, -6.254448, 0, 1.5, 0.5, 0.5
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
-3.01652, -2, -5.443678,
-3.01652, 4, -5.443678,
-3.01652, -2, -5.443678,
-3.175882, -2, -5.713935,
-3.01652, 0, -5.443678,
-3.175882, 0, -5.713935,
-3.01652, 2, -5.443678,
-3.175882, 2, -5.713935,
-3.01652, 4, -5.443678,
-3.175882, 4, -5.713935
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
"2",
"4"
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
-3.494607, -2, -6.254448, 0, -0.5, 0.5, 0.5,
-3.494607, -2, -6.254448, 1, -0.5, 0.5, 0.5,
-3.494607, -2, -6.254448, 1, 1.5, 0.5, 0.5,
-3.494607, -2, -6.254448, 0, 1.5, 0.5, 0.5,
-3.494607, 0, -6.254448, 0, -0.5, 0.5, 0.5,
-3.494607, 0, -6.254448, 1, -0.5, 0.5, 0.5,
-3.494607, 0, -6.254448, 1, 1.5, 0.5, 0.5,
-3.494607, 0, -6.254448, 0, 1.5, 0.5, 0.5,
-3.494607, 2, -6.254448, 0, -0.5, 0.5, 0.5,
-3.494607, 2, -6.254448, 1, -0.5, 0.5, 0.5,
-3.494607, 2, -6.254448, 1, 1.5, 0.5, 0.5,
-3.494607, 2, -6.254448, 0, 1.5, 0.5, 0.5,
-3.494607, 4, -6.254448, 0, -0.5, 0.5, 0.5,
-3.494607, 4, -6.254448, 1, -0.5, 0.5, 0.5,
-3.494607, 4, -6.254448, 1, 1.5, 0.5, 0.5,
-3.494607, 4, -6.254448, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.01652, -3.941911, -4,
-3.01652, -3.941911, 4,
-3.01652, -3.941911, -4,
-3.175882, -4.149502, -4,
-3.01652, -3.941911, -2,
-3.175882, -4.149502, -2,
-3.01652, -3.941911, 0,
-3.175882, -4.149502, 0,
-3.01652, -3.941911, 2,
-3.175882, -4.149502, 2,
-3.01652, -3.941911, 4,
-3.175882, -4.149502, 4
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
-3.494607, -4.564683, -4, 0, -0.5, 0.5, 0.5,
-3.494607, -4.564683, -4, 1, -0.5, 0.5, 0.5,
-3.494607, -4.564683, -4, 1, 1.5, 0.5, 0.5,
-3.494607, -4.564683, -4, 0, 1.5, 0.5, 0.5,
-3.494607, -4.564683, -2, 0, -0.5, 0.5, 0.5,
-3.494607, -4.564683, -2, 1, -0.5, 0.5, 0.5,
-3.494607, -4.564683, -2, 1, 1.5, 0.5, 0.5,
-3.494607, -4.564683, -2, 0, 1.5, 0.5, 0.5,
-3.494607, -4.564683, 0, 0, -0.5, 0.5, 0.5,
-3.494607, -4.564683, 0, 1, -0.5, 0.5, 0.5,
-3.494607, -4.564683, 0, 1, 1.5, 0.5, 0.5,
-3.494607, -4.564683, 0, 0, 1.5, 0.5, 0.5,
-3.494607, -4.564683, 2, 0, -0.5, 0.5, 0.5,
-3.494607, -4.564683, 2, 1, -0.5, 0.5, 0.5,
-3.494607, -4.564683, 2, 1, 1.5, 0.5, 0.5,
-3.494607, -4.564683, 2, 0, 1.5, 0.5, 0.5,
-3.494607, -4.564683, 4, 0, -0.5, 0.5, 0.5,
-3.494607, -4.564683, 4, 1, -0.5, 0.5, 0.5,
-3.494607, -4.564683, 4, 1, 1.5, 0.5, 0.5,
-3.494607, -4.564683, 4, 0, 1.5, 0.5, 0.5
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
-3.01652, -3.941911, -5.443678,
-3.01652, 4.361721, -5.443678,
-3.01652, -3.941911, 5.366586,
-3.01652, 4.361721, 5.366586,
-3.01652, -3.941911, -5.443678,
-3.01652, -3.941911, 5.366586,
-3.01652, 4.361721, -5.443678,
-3.01652, 4.361721, 5.366586,
-3.01652, -3.941911, -5.443678,
3.357982, -3.941911, -5.443678,
-3.01652, -3.941911, 5.366586,
3.357982, -3.941911, 5.366586,
-3.01652, 4.361721, -5.443678,
3.357982, 4.361721, -5.443678,
-3.01652, 4.361721, 5.366586,
3.357982, 4.361721, 5.366586,
3.357982, -3.941911, -5.443678,
3.357982, 4.361721, -5.443678,
3.357982, -3.941911, 5.366586,
3.357982, 4.361721, 5.366586,
3.357982, -3.941911, -5.443678,
3.357982, -3.941911, 5.366586,
3.357982, 4.361721, -5.443678,
3.357982, 4.361721, 5.366586
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
var radius = 8.035412;
var distance = 35.75046;
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
mvMatrix.translate( -0.1707313, -0.209905, 0.03854609 );
mvMatrix.scale( 1.362937, 1.046295, 0.8036848 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75046);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
cyclohexyloxy<-read.table("cyclohexyloxy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclohexyloxy$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclohexyloxy' not found
```

```r
y<-cyclohexyloxy$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclohexyloxy' not found
```

```r
z<-cyclohexyloxy$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclohexyloxy' not found
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
-2.923687, 0.3622158, -1.150844, 0, 0, 1, 1, 1,
-2.80582, -0.5327415, -2.566128, 1, 0, 0, 1, 1,
-2.627891, -0.7523978, -1.601443, 1, 0, 0, 1, 1,
-2.429738, -0.855944, -2.038926, 1, 0, 0, 1, 1,
-2.363013, -0.8896427, -4.543341, 1, 0, 0, 1, 1,
-2.324054, 0.3565177, -0.04599892, 1, 0, 0, 1, 1,
-2.295778, 0.1896459, -0.4969199, 0, 0, 0, 1, 1,
-2.238906, 0.07601636, -2.399791, 0, 0, 0, 1, 1,
-2.228215, -0.8657554, -2.22298, 0, 0, 0, 1, 1,
-2.226043, 1.347454, 0.4702508, 0, 0, 0, 1, 1,
-2.203369, 0.6012616, -1.191283, 0, 0, 0, 1, 1,
-2.169948, 1.220302, -0.7150024, 0, 0, 0, 1, 1,
-2.144224, 1.374069, -0.8474733, 0, 0, 0, 1, 1,
-2.089961, 1.456406, 0.5683324, 1, 1, 1, 1, 1,
-2.087047, 0.001785532, -0.9624016, 1, 1, 1, 1, 1,
-2.041313, 1.583245, -0.8180631, 1, 1, 1, 1, 1,
-2.037309, -0.6590618, -2.610875, 1, 1, 1, 1, 1,
-2.00479, 0.5491527, 0.4187348, 1, 1, 1, 1, 1,
-1.963299, -0.04638048, -0.7319209, 1, 1, 1, 1, 1,
-1.91644, 1.185117, -0.3255581, 1, 1, 1, 1, 1,
-1.912524, 0.08576241, -1.432222, 1, 1, 1, 1, 1,
-1.908511, 0.6088527, -1.51834, 1, 1, 1, 1, 1,
-1.906119, 0.7373328, -0.2902668, 1, 1, 1, 1, 1,
-1.902552, -0.2508227, -2.163527, 1, 1, 1, 1, 1,
-1.897028, 0.5907855, -2.687716, 1, 1, 1, 1, 1,
-1.878192, 1.213653, -1.124994, 1, 1, 1, 1, 1,
-1.869982, 0.2111274, -2.010168, 1, 1, 1, 1, 1,
-1.86986, 0.4905202, -1.890797, 1, 1, 1, 1, 1,
-1.865738, 1.227579, -1.714106, 0, 0, 1, 1, 1,
-1.856472, -1.116263, -0.8320734, 1, 0, 0, 1, 1,
-1.849098, -1.103244, -1.774074, 1, 0, 0, 1, 1,
-1.848684, -0.9790788, -2.07528, 1, 0, 0, 1, 1,
-1.841883, -1.537979, -0.9052455, 1, 0, 0, 1, 1,
-1.835062, 1.666653, -1.146948, 1, 0, 0, 1, 1,
-1.82301, -0.3609761, -0.07242658, 0, 0, 0, 1, 1,
-1.820725, -0.5607448, -1.490587, 0, 0, 0, 1, 1,
-1.818468, -0.01364538, -2.313233, 0, 0, 0, 1, 1,
-1.811531, -1.268709, -2.462877, 0, 0, 0, 1, 1,
-1.802671, -0.6514224, -3.098983, 0, 0, 0, 1, 1,
-1.801825, 1.316735, -0.8630114, 0, 0, 0, 1, 1,
-1.797769, -1.790763, -1.704919, 0, 0, 0, 1, 1,
-1.77586, -1.387715, -1.482937, 1, 1, 1, 1, 1,
-1.774443, -0.01628028, -1.360651, 1, 1, 1, 1, 1,
-1.764127, 0.7137718, -1.772025, 1, 1, 1, 1, 1,
-1.763307, -0.1084344, -1.884251, 1, 1, 1, 1, 1,
-1.757102, 1.019682, -1.513299, 1, 1, 1, 1, 1,
-1.753632, 0.1505083, -1.889817, 1, 1, 1, 1, 1,
-1.750881, -1.005015, -2.629658, 1, 1, 1, 1, 1,
-1.714266, 1.095438, -1.910609, 1, 1, 1, 1, 1,
-1.706861, -1.398451, -2.312653, 1, 1, 1, 1, 1,
-1.673248, 0.4422826, -1.401111, 1, 1, 1, 1, 1,
-1.670656, -0.01169373, -2.000048, 1, 1, 1, 1, 1,
-1.657687, 1.213152, -0.6874816, 1, 1, 1, 1, 1,
-1.644807, -0.2784287, -2.374345, 1, 1, 1, 1, 1,
-1.634135, -0.185413, -1.829607, 1, 1, 1, 1, 1,
-1.632258, -0.007380153, -3.049117, 1, 1, 1, 1, 1,
-1.631963, 1.880238, -1.503341, 0, 0, 1, 1, 1,
-1.631186, 1.06861, -2.513691, 1, 0, 0, 1, 1,
-1.614197, -1.60082, -1.21335, 1, 0, 0, 1, 1,
-1.600588, 1.513492, -2.649813, 1, 0, 0, 1, 1,
-1.582434, -0.5969225, -2.297968, 1, 0, 0, 1, 1,
-1.579065, -0.1210914, -3.281503, 1, 0, 0, 1, 1,
-1.578365, 0.5594602, -2.763446, 0, 0, 0, 1, 1,
-1.574236, 0.5327278, -2.014366, 0, 0, 0, 1, 1,
-1.559291, 0.3499074, -1.492308, 0, 0, 0, 1, 1,
-1.558763, 0.6137456, -0.6866855, 0, 0, 0, 1, 1,
-1.549602, 0.4716888, -1.180581, 0, 0, 0, 1, 1,
-1.540151, -1.072853, -1.483179, 0, 0, 0, 1, 1,
-1.533051, 2.718665, 0.7024992, 0, 0, 0, 1, 1,
-1.531441, -1.846443, -1.0414, 1, 1, 1, 1, 1,
-1.531112, 0.3824214, -1.592362, 1, 1, 1, 1, 1,
-1.519229, -0.689442, -2.391547, 1, 1, 1, 1, 1,
-1.513644, 0.7632996, -1.418798, 1, 1, 1, 1, 1,
-1.503196, 1.268685, -1.777556, 1, 1, 1, 1, 1,
-1.503096, -0.9383073, -2.309012, 1, 1, 1, 1, 1,
-1.500046, -0.6433296, -3.612262, 1, 1, 1, 1, 1,
-1.483632, 0.01157245, 0.3262727, 1, 1, 1, 1, 1,
-1.477743, -0.09977678, -2.373713, 1, 1, 1, 1, 1,
-1.476777, 0.5325118, 1.059704, 1, 1, 1, 1, 1,
-1.473248, 1.121124, -1.157089, 1, 1, 1, 1, 1,
-1.469656, -0.7146227, -2.081087, 1, 1, 1, 1, 1,
-1.457567, 0.9305478, -0.2370956, 1, 1, 1, 1, 1,
-1.457079, -1.998132, -1.236496, 1, 1, 1, 1, 1,
-1.443048, -1.19068, -4.074883, 1, 1, 1, 1, 1,
-1.437429, -1.282919, -3.848118, 0, 0, 1, 1, 1,
-1.431852, 0.6499544, 0.6233963, 1, 0, 0, 1, 1,
-1.430449, -0.7757663, -1.443591, 1, 0, 0, 1, 1,
-1.429432, -0.3843116, -2.533001, 1, 0, 0, 1, 1,
-1.426195, -0.008704692, -2.01499, 1, 0, 0, 1, 1,
-1.424294, 0.04254753, -2.119513, 1, 0, 0, 1, 1,
-1.418901, 1.232771, -0.8285912, 0, 0, 0, 1, 1,
-1.417951, 0.9035617, -0.4387079, 0, 0, 0, 1, 1,
-1.405518, -0.5044457, -0.9727955, 0, 0, 0, 1, 1,
-1.387222, 0.1836216, -3.153849, 0, 0, 0, 1, 1,
-1.387014, 1.641801, -2.377533, 0, 0, 0, 1, 1,
-1.385989, -0.133256, -0.7420725, 0, 0, 0, 1, 1,
-1.377618, 0.1801238, -0.8174314, 0, 0, 0, 1, 1,
-1.371742, -0.2937678, -1.03788, 1, 1, 1, 1, 1,
-1.370092, 0.0760896, 0.8801827, 1, 1, 1, 1, 1,
-1.362933, 1.974009, -0.2058244, 1, 1, 1, 1, 1,
-1.362262, 0.297988, -0.2113543, 1, 1, 1, 1, 1,
-1.361736, -0.8111484, -1.611234, 1, 1, 1, 1, 1,
-1.357217, 0.1638508, -0.3572601, 1, 1, 1, 1, 1,
-1.354008, 0.8221717, -0.8643897, 1, 1, 1, 1, 1,
-1.350454, 0.01820062, -1.599228, 1, 1, 1, 1, 1,
-1.336976, 0.7654297, -0.650822, 1, 1, 1, 1, 1,
-1.325187, 0.1412389, -1.446399, 1, 1, 1, 1, 1,
-1.312752, -0.5646592, -3.098317, 1, 1, 1, 1, 1,
-1.304342, -0.9101645, 0.1465754, 1, 1, 1, 1, 1,
-1.303512, -0.0852188, -3.125437, 1, 1, 1, 1, 1,
-1.302217, 1.389138, -0.2533989, 1, 1, 1, 1, 1,
-1.26586, 0.6994475, -5.286247, 1, 1, 1, 1, 1,
-1.263684, 1.142015, -1.917472, 0, 0, 1, 1, 1,
-1.260287, -0.1979561, -1.10936, 1, 0, 0, 1, 1,
-1.258366, 0.8371055, -0.3708903, 1, 0, 0, 1, 1,
-1.247254, 0.5260032, -2.090269, 1, 0, 0, 1, 1,
-1.246261, 0.06531434, -0.5338358, 1, 0, 0, 1, 1,
-1.243623, 1.094705, 0.7648718, 1, 0, 0, 1, 1,
-1.239484, 1.098713, -2.269669, 0, 0, 0, 1, 1,
-1.236893, 0.6440873, 1.256116, 0, 0, 0, 1, 1,
-1.230673, 0.8293917, -1.282611, 0, 0, 0, 1, 1,
-1.22443, -0.6390291, -1.064278, 0, 0, 0, 1, 1,
-1.210782, -1.733899, -3.84802, 0, 0, 0, 1, 1,
-1.208959, -0.5388295, -2.002795, 0, 0, 0, 1, 1,
-1.193355, -0.2507693, -1.150262, 0, 0, 0, 1, 1,
-1.185909, -0.7729654, -1.458829, 1, 1, 1, 1, 1,
-1.185246, 0.03653496, -0.1453654, 1, 1, 1, 1, 1,
-1.182233, 0.04013671, -1.397889, 1, 1, 1, 1, 1,
-1.176211, -2.825566, -3.64407, 1, 1, 1, 1, 1,
-1.174115, 0.09033116, -1.988285, 1, 1, 1, 1, 1,
-1.166774, 0.8770758, -0.6084841, 1, 1, 1, 1, 1,
-1.165431, 1.859871, -0.06815994, 1, 1, 1, 1, 1,
-1.159545, -0.4997776, -2.243195, 1, 1, 1, 1, 1,
-1.155154, 1.008161, -1.035512, 1, 1, 1, 1, 1,
-1.147412, 0.4099431, -2.942614, 1, 1, 1, 1, 1,
-1.135261, 0.2354796, -3.475802, 1, 1, 1, 1, 1,
-1.13117, -0.01025584, -1.017475, 1, 1, 1, 1, 1,
-1.124206, 4.240794, -0.1910911, 1, 1, 1, 1, 1,
-1.121127, -2.05416, -3.401612, 1, 1, 1, 1, 1,
-1.117452, -0.3913935, -1.643351, 1, 1, 1, 1, 1,
-1.116934, 1.032414, -0.8310952, 0, 0, 1, 1, 1,
-1.115511, -0.3496412, -0.8092545, 1, 0, 0, 1, 1,
-1.110754, 0.8432542, -1.38025, 1, 0, 0, 1, 1,
-1.099391, -1.599277, -3.652539, 1, 0, 0, 1, 1,
-1.097142, -0.4373802, -0.7902555, 1, 0, 0, 1, 1,
-1.093847, 0.7562677, -1.555605, 1, 0, 0, 1, 1,
-1.092974, -0.08011772, -3.276772, 0, 0, 0, 1, 1,
-1.084706, 0.3771427, -1.68536, 0, 0, 0, 1, 1,
-1.083865, 1.025135, -1.911624, 0, 0, 0, 1, 1,
-1.079475, -0.06997107, -2.404923, 0, 0, 0, 1, 1,
-1.077617, -0.4521327, -2.928719, 0, 0, 0, 1, 1,
-1.069571, -0.9730509, -2.715309, 0, 0, 0, 1, 1,
-1.067807, 0.09169294, -0.5731937, 0, 0, 0, 1, 1,
-1.059506, 0.04793265, -0.0759681, 1, 1, 1, 1, 1,
-1.05757, 0.1545735, 0.454818, 1, 1, 1, 1, 1,
-1.054949, -0.2726945, -3.636398, 1, 1, 1, 1, 1,
-1.041193, 0.3202635, -0.8229178, 1, 1, 1, 1, 1,
-1.039089, -1.321114, -2.595818, 1, 1, 1, 1, 1,
-1.034365, -1.233602, -3.054833, 1, 1, 1, 1, 1,
-1.028882, -0.5848198, -3.043036, 1, 1, 1, 1, 1,
-1.026507, -0.311825, -0.1682901, 1, 1, 1, 1, 1,
-1.022136, -0.2529857, -3.416317, 1, 1, 1, 1, 1,
-1.020298, 0.5933185, -1.469535, 1, 1, 1, 1, 1,
-1.018807, -0.1731985, -2.146122, 1, 1, 1, 1, 1,
-1.015872, 0.8677523, -2.221457, 1, 1, 1, 1, 1,
-1.010517, 0.5363097, -0.9227569, 1, 1, 1, 1, 1,
-1.009218, 0.7407024, 0.7892914, 1, 1, 1, 1, 1,
-1.005892, -1.183437, -2.454155, 1, 1, 1, 1, 1,
-1.001628, -0.2131454, -2.136014, 0, 0, 1, 1, 1,
-0.9994496, 1.80079, -0.6025923, 1, 0, 0, 1, 1,
-0.9938046, 0.3080213, 0.6129659, 1, 0, 0, 1, 1,
-0.9919012, -0.05232039, -2.362321, 1, 0, 0, 1, 1,
-0.9883506, 1.783784, -0.2362491, 1, 0, 0, 1, 1,
-0.9880438, -0.5982864, -2.183826, 1, 0, 0, 1, 1,
-0.9870786, -0.5066665, -2.988501, 0, 0, 0, 1, 1,
-0.9860305, 1.026902, -0.2526031, 0, 0, 0, 1, 1,
-0.9835185, -0.2003923, -1.894416, 0, 0, 0, 1, 1,
-0.9835032, -0.03808849, -1.503836, 0, 0, 0, 1, 1,
-0.9783642, -0.9172065, -3.620618, 0, 0, 0, 1, 1,
-0.9762623, 0.07574952, -0.6081818, 0, 0, 0, 1, 1,
-0.9748169, 1.627013, -2.107193, 0, 0, 0, 1, 1,
-0.9728941, -0.9399611, -4.040582, 1, 1, 1, 1, 1,
-0.9717996, -1.00248, -1.92295, 1, 1, 1, 1, 1,
-0.9684923, -0.9867412, -1.887379, 1, 1, 1, 1, 1,
-0.9679754, -1.624687, -3.515495, 1, 1, 1, 1, 1,
-0.9645998, 0.4551726, -1.379709, 1, 1, 1, 1, 1,
-0.9594489, -0.6896018, -2.331239, 1, 1, 1, 1, 1,
-0.9523817, -0.4271034, -3.77001, 1, 1, 1, 1, 1,
-0.9482346, -2.571466, -2.644895, 1, 1, 1, 1, 1,
-0.9379644, -1.864717, -3.865236, 1, 1, 1, 1, 1,
-0.9350561, 0.941538, -0.1725965, 1, 1, 1, 1, 1,
-0.9331952, -0.7000027, -2.442208, 1, 1, 1, 1, 1,
-0.9328714, -0.6479717, -1.318846, 1, 1, 1, 1, 1,
-0.9260204, 0.4279457, -2.179203, 1, 1, 1, 1, 1,
-0.9170937, 0.7150013, 0.8854069, 1, 1, 1, 1, 1,
-0.9131621, 0.6728922, -0.9910315, 1, 1, 1, 1, 1,
-0.9097158, 0.4390897, -0.04674643, 0, 0, 1, 1, 1,
-0.9064453, -0.5289565, -2.788651, 1, 0, 0, 1, 1,
-0.9054902, 0.6704896, 1.065108, 1, 0, 0, 1, 1,
-0.904469, -0.2877339, -0.1529242, 1, 0, 0, 1, 1,
-0.8957714, -1.779952, -2.509968, 1, 0, 0, 1, 1,
-0.8943624, -0.1977012, -1.984666, 1, 0, 0, 1, 1,
-0.8905408, 1.394442, -1.067582, 0, 0, 0, 1, 1,
-0.8902592, -1.780883, -2.686357, 0, 0, 0, 1, 1,
-0.8844625, 0.5737329, -2.038479, 0, 0, 0, 1, 1,
-0.8835886, -0.5822861, -2.189874, 0, 0, 0, 1, 1,
-0.8800962, -1.101799, -1.890113, 0, 0, 0, 1, 1,
-0.8796085, -0.9725308, -1.323136, 0, 0, 0, 1, 1,
-0.8695931, -0.6156895, -1.820089, 0, 0, 0, 1, 1,
-0.8648621, 0.7788247, 0.448449, 1, 1, 1, 1, 1,
-0.8543679, -0.3146169, -0.9568639, 1, 1, 1, 1, 1,
-0.8532153, 1.231273, -1.3174, 1, 1, 1, 1, 1,
-0.8426948, -0.01960484, -1.598566, 1, 1, 1, 1, 1,
-0.8424687, -1.931486, -2.987468, 1, 1, 1, 1, 1,
-0.8382087, -0.06421123, -1.115254, 1, 1, 1, 1, 1,
-0.8361909, 1.30182, 0.8330121, 1, 1, 1, 1, 1,
-0.8152149, 0.1239841, 0.2722915, 1, 1, 1, 1, 1,
-0.8146194, -0.1539232, -1.086853, 1, 1, 1, 1, 1,
-0.8145795, 1.161533, 0.130804, 1, 1, 1, 1, 1,
-0.8130616, -0.4228551, -2.130612, 1, 1, 1, 1, 1,
-0.8128796, -1.471805, -2.370374, 1, 1, 1, 1, 1,
-0.8125513, 0.8688104, -2.7414, 1, 1, 1, 1, 1,
-0.8122591, 0.2992194, -0.3078902, 1, 1, 1, 1, 1,
-0.8056095, 0.1977488, -0.7416028, 1, 1, 1, 1, 1,
-0.805208, 0.8439948, -0.7009478, 0, 0, 1, 1, 1,
-0.8031161, -1.617785, -3.627665, 1, 0, 0, 1, 1,
-0.802964, 0.350162, -0.8816, 1, 0, 0, 1, 1,
-0.7986155, -1.317048, -0.9855676, 1, 0, 0, 1, 1,
-0.7952605, -0.5829142, -2.200956, 1, 0, 0, 1, 1,
-0.7940044, -1.393525, -4.014532, 1, 0, 0, 1, 1,
-0.7895973, 1.217246, -1.072157, 0, 0, 0, 1, 1,
-0.7844472, 1.38143, -0.632328, 0, 0, 0, 1, 1,
-0.7821611, -0.3447607, -1.969144, 0, 0, 0, 1, 1,
-0.7809932, -0.5024939, -0.734177, 0, 0, 0, 1, 1,
-0.7781032, 1.40724, -1.040197, 0, 0, 0, 1, 1,
-0.7710797, 0.5516419, -0.1836054, 0, 0, 0, 1, 1,
-0.769138, -1.184216, -3.75653, 0, 0, 0, 1, 1,
-0.7606084, -0.05417572, -3.456923, 1, 1, 1, 1, 1,
-0.7580592, -0.5274566, -2.434646, 1, 1, 1, 1, 1,
-0.7576187, -0.4285095, -2.534986, 1, 1, 1, 1, 1,
-0.7565899, -0.3935545, -1.653417, 1, 1, 1, 1, 1,
-0.7445517, -0.6185231, -3.510587, 1, 1, 1, 1, 1,
-0.7439731, 0.2408775, -0.6088749, 1, 1, 1, 1, 1,
-0.7437467, 1.675581, -2.543723, 1, 1, 1, 1, 1,
-0.7428328, 0.3908369, -0.5779487, 1, 1, 1, 1, 1,
-0.7397824, 0.9120085, -0.914892, 1, 1, 1, 1, 1,
-0.7366703, -0.3703735, -1.201535, 1, 1, 1, 1, 1,
-0.7365296, -0.03839214, -1.499498, 1, 1, 1, 1, 1,
-0.7324511, -0.7123887, -0.9733437, 1, 1, 1, 1, 1,
-0.7279151, 1.238286, -2.323612, 1, 1, 1, 1, 1,
-0.7258444, -0.3166915, -0.5360481, 1, 1, 1, 1, 1,
-0.7228504, -1.18281, -1.904148, 1, 1, 1, 1, 1,
-0.719427, 0.8844306, 0.2262428, 0, 0, 1, 1, 1,
-0.7180709, -0.8857493, -4.168412, 1, 0, 0, 1, 1,
-0.7158565, 1.471789, -1.171504, 1, 0, 0, 1, 1,
-0.715551, 0.4504666, -1.190767, 1, 0, 0, 1, 1,
-0.7143409, -1.210896, -3.541549, 1, 0, 0, 1, 1,
-0.7101572, 0.7396808, -1.239872, 1, 0, 0, 1, 1,
-0.70825, 0.01686463, -2.744604, 0, 0, 0, 1, 1,
-0.7039068, -0.4638181, -1.729445, 0, 0, 0, 1, 1,
-0.7011465, -1.318485, -4.075933, 0, 0, 0, 1, 1,
-0.6993931, -1.160965, -4.211558, 0, 0, 0, 1, 1,
-0.6986384, 1.029899, 2.938476, 0, 0, 0, 1, 1,
-0.6985151, 1.165166, -0.2617252, 0, 0, 0, 1, 1,
-0.6964706, -1.776848, -1.742972, 0, 0, 0, 1, 1,
-0.6952311, 0.3707792, 0.3855812, 1, 1, 1, 1, 1,
-0.6934276, 0.5256366, 0.0849591, 1, 1, 1, 1, 1,
-0.6928397, 1.204278, 0.6821473, 1, 1, 1, 1, 1,
-0.6921098, -0.2580682, -1.822423, 1, 1, 1, 1, 1,
-0.6883207, -0.4439242, -3.116035, 1, 1, 1, 1, 1,
-0.6845546, -0.036559, -2.232535, 1, 1, 1, 1, 1,
-0.680267, -0.3705417, -1.650391, 1, 1, 1, 1, 1,
-0.6751423, -0.8713961, -3.505252, 1, 1, 1, 1, 1,
-0.6685681, -0.02399946, -1.818322, 1, 1, 1, 1, 1,
-0.6605448, -1.743571, -3.571394, 1, 1, 1, 1, 1,
-0.659281, 0.3216126, -2.063354, 1, 1, 1, 1, 1,
-0.6577676, 0.02229659, -2.229769, 1, 1, 1, 1, 1,
-0.6505272, -0.3373993, -1.442553, 1, 1, 1, 1, 1,
-0.6478799, -0.5053145, -3.535264, 1, 1, 1, 1, 1,
-0.647821, 1.368474, -2.735771, 1, 1, 1, 1, 1,
-0.647513, -0.83288, -4.013834, 0, 0, 1, 1, 1,
-0.6444405, -0.5019436, -1.977109, 1, 0, 0, 1, 1,
-0.6383213, -0.7083381, -2.689853, 1, 0, 0, 1, 1,
-0.637078, -0.383015, -2.299284, 1, 0, 0, 1, 1,
-0.6348798, 0.6619429, -1.86598, 1, 0, 0, 1, 1,
-0.6292219, 0.08655822, -2.141939, 1, 0, 0, 1, 1,
-0.6260592, -1.229564, -1.777772, 0, 0, 0, 1, 1,
-0.6218639, -0.07013462, -0.03981271, 0, 0, 0, 1, 1,
-0.6216627, 1.084297, -1.786591, 0, 0, 0, 1, 1,
-0.6200839, -0.7761629, -1.764572, 0, 0, 0, 1, 1,
-0.614642, -0.4633417, -2.870672, 0, 0, 0, 1, 1,
-0.6108584, 0.5406526, 0.8888504, 0, 0, 0, 1, 1,
-0.6100605, 1.306628, 0.3587594, 0, 0, 0, 1, 1,
-0.6069376, 0.1864171, -2.351542, 1, 1, 1, 1, 1,
-0.6047313, 0.7297852, -0.04521085, 1, 1, 1, 1, 1,
-0.6046077, -0.5791537, -1.881578, 1, 1, 1, 1, 1,
-0.6005116, -0.4407787, -2.715159, 1, 1, 1, 1, 1,
-0.5923103, -0.1053805, -3.427606, 1, 1, 1, 1, 1,
-0.582779, 0.05599868, -1.977677, 1, 1, 1, 1, 1,
-0.5756211, 0.9814023, 0.06280024, 1, 1, 1, 1, 1,
-0.5745901, -0.7908406, -2.554117, 1, 1, 1, 1, 1,
-0.5724487, 0.4070368, -0.9714413, 1, 1, 1, 1, 1,
-0.568626, 0.6897832, -1.709597, 1, 1, 1, 1, 1,
-0.5682369, 0.31971, -1.226132, 1, 1, 1, 1, 1,
-0.5628623, 0.3399552, -1.057514, 1, 1, 1, 1, 1,
-0.5620706, -0.8564492, -2.310507, 1, 1, 1, 1, 1,
-0.5614703, 1.722871, -1.697565, 1, 1, 1, 1, 1,
-0.5550725, 0.4914503, -0.933305, 1, 1, 1, 1, 1,
-0.5541266, -1.530083, -2.375005, 0, 0, 1, 1, 1,
-0.5458783, -0.4225464, -1.711017, 1, 0, 0, 1, 1,
-0.5425724, -0.1972538, -1.940604, 1, 0, 0, 1, 1,
-0.5393526, -1.92273, -1.692724, 1, 0, 0, 1, 1,
-0.5381853, 1.15993, -0.283422, 1, 0, 0, 1, 1,
-0.5355048, -0.5368478, -1.024667, 1, 0, 0, 1, 1,
-0.5323961, -0.3824185, -0.5842286, 0, 0, 0, 1, 1,
-0.5317128, 0.3257031, -0.7033225, 0, 0, 0, 1, 1,
-0.5292364, 0.2242114, -0.8911545, 0, 0, 0, 1, 1,
-0.5259208, -2.579845, -3.162876, 0, 0, 0, 1, 1,
-0.5192419, -0.9343358, -2.922348, 0, 0, 0, 1, 1,
-0.5185812, 1.718632, 0.3121496, 0, 0, 0, 1, 1,
-0.5163168, -0.6470475, -2.207619, 0, 0, 0, 1, 1,
-0.5128917, -0.6703463, -2.093427, 1, 1, 1, 1, 1,
-0.5087698, 0.3418782, 0.2392791, 1, 1, 1, 1, 1,
-0.5042389, 0.1037125, 0.245867, 1, 1, 1, 1, 1,
-0.5008743, 1.16422, -0.06986471, 1, 1, 1, 1, 1,
-0.4979011, -1.302344, -3.616668, 1, 1, 1, 1, 1,
-0.4949612, -1.566111, -1.251193, 1, 1, 1, 1, 1,
-0.4932556, -1.133341, -2.366052, 1, 1, 1, 1, 1,
-0.4913138, 1.409929, -1.17338, 1, 1, 1, 1, 1,
-0.4878583, 0.2457264, -0.5848618, 1, 1, 1, 1, 1,
-0.4867641, 0.5434617, -1.367899, 1, 1, 1, 1, 1,
-0.4856372, 2.111399, 1.431533, 1, 1, 1, 1, 1,
-0.484269, 0.7852404, -0.3961533, 1, 1, 1, 1, 1,
-0.4792243, 0.0345316, -1.827547, 1, 1, 1, 1, 1,
-0.4775475, 2.011132, 0.9639329, 1, 1, 1, 1, 1,
-0.4767367, 0.7986676, 0.8335584, 1, 1, 1, 1, 1,
-0.475749, 0.7357584, -0.2379771, 0, 0, 1, 1, 1,
-0.4753633, -0.9001926, -2.985445, 1, 0, 0, 1, 1,
-0.4747416, -0.4206519, -2.200589, 1, 0, 0, 1, 1,
-0.4681601, 0.2507072, -1.86181, 1, 0, 0, 1, 1,
-0.4657633, 1.12472, 0.5195399, 1, 0, 0, 1, 1,
-0.4634703, -0.5134059, -2.873136, 1, 0, 0, 1, 1,
-0.4618723, 0.444663, -0.7025216, 0, 0, 0, 1, 1,
-0.4577351, -0.1095498, -3.239492, 0, 0, 0, 1, 1,
-0.4574219, 1.233203, 0.7302389, 0, 0, 0, 1, 1,
-0.4568947, 2.687016, 0.5856536, 0, 0, 0, 1, 1,
-0.450086, -2.176359, -2.691798, 0, 0, 0, 1, 1,
-0.4358279, -1.266977, -3.273302, 0, 0, 0, 1, 1,
-0.4343348, 1.7697, 0.250035, 0, 0, 0, 1, 1,
-0.429865, 0.352889, -0.6069734, 1, 1, 1, 1, 1,
-0.4288321, 1.35302, -1.973743, 1, 1, 1, 1, 1,
-0.4249939, -0.3454547, -2.12402, 1, 1, 1, 1, 1,
-0.4235918, 0.8221072, 0.02607873, 1, 1, 1, 1, 1,
-0.418639, -1.154105, -3.827832, 1, 1, 1, 1, 1,
-0.4141693, 1.66129, -0.9580438, 1, 1, 1, 1, 1,
-0.4135652, 0.7986009, -0.7344458, 1, 1, 1, 1, 1,
-0.4129288, -1.685688, -1.706725, 1, 1, 1, 1, 1,
-0.4118846, -1.381678, -3.130006, 1, 1, 1, 1, 1,
-0.4037497, 1.376243, -0.5140914, 1, 1, 1, 1, 1,
-0.4026015, 1.368723, -0.2343072, 1, 1, 1, 1, 1,
-0.4017649, -0.7397688, -2.275754, 1, 1, 1, 1, 1,
-0.3991576, 0.1193322, -0.8983097, 1, 1, 1, 1, 1,
-0.3939548, 2.307045, -1.520427, 1, 1, 1, 1, 1,
-0.388835, 0.1332918, -1.272948, 1, 1, 1, 1, 1,
-0.3879679, 0.1771514, -1.938466, 0, 0, 1, 1, 1,
-0.3788867, -0.4084764, -1.83207, 1, 0, 0, 1, 1,
-0.3783278, 0.234222, -0.1915572, 1, 0, 0, 1, 1,
-0.378283, 0.5895721, -0.1110639, 1, 0, 0, 1, 1,
-0.3766981, 1.242644, -0.8631611, 1, 0, 0, 1, 1,
-0.3764362, -0.09547497, -2.210555, 1, 0, 0, 1, 1,
-0.3748922, 1.685649, -0.3919098, 0, 0, 0, 1, 1,
-0.3648882, 0.4496772, 0.2673243, 0, 0, 0, 1, 1,
-0.3616315, -0.4794542, -2.636951, 0, 0, 0, 1, 1,
-0.3578884, 1.53935, -1.057986, 0, 0, 0, 1, 1,
-0.357366, 0.750313, 0.1832448, 0, 0, 0, 1, 1,
-0.3533114, -0.2308604, -2.459744, 0, 0, 0, 1, 1,
-0.3531546, 0.9420738, -0.2368061, 0, 0, 0, 1, 1,
-0.3526021, 0.552067, -0.8537352, 1, 1, 1, 1, 1,
-0.3460066, 0.9983351, 0.8560194, 1, 1, 1, 1, 1,
-0.3433567, -1.566729, -5.135896, 1, 1, 1, 1, 1,
-0.3416828, 0.1127136, -0.979217, 1, 1, 1, 1, 1,
-0.3416381, -0.08256706, -2.320536, 1, 1, 1, 1, 1,
-0.3355883, 1.277181, 0.4124978, 1, 1, 1, 1, 1,
-0.3308355, 0.09389533, -1.732868, 1, 1, 1, 1, 1,
-0.3270428, -0.3650687, -2.831184, 1, 1, 1, 1, 1,
-0.3250224, 1.190747, -1.360147, 1, 1, 1, 1, 1,
-0.3180191, -1.329137, -3.434856, 1, 1, 1, 1, 1,
-0.3168055, -0.4453624, -1.382303, 1, 1, 1, 1, 1,
-0.315246, 1.448192, -0.3147767, 1, 1, 1, 1, 1,
-0.314891, 1.595881, 1.50698, 1, 1, 1, 1, 1,
-0.3147306, 0.05078698, -1.193923, 1, 1, 1, 1, 1,
-0.3143438, -1.301744, -2.792139, 1, 1, 1, 1, 1,
-0.3141454, 0.866988, -1.348951, 0, 0, 1, 1, 1,
-0.3135777, 0.1760799, -0.9339616, 1, 0, 0, 1, 1,
-0.3132323, 0.004345568, -0.7899507, 1, 0, 0, 1, 1,
-0.3026664, -0.256812, -2.6534, 1, 0, 0, 1, 1,
-0.3012731, -1.159353, -2.328549, 1, 0, 0, 1, 1,
-0.2996908, -1.3359, -1.889806, 1, 0, 0, 1, 1,
-0.297662, -0.3031986, -2.405754, 0, 0, 0, 1, 1,
-0.2941712, -0.1752368, -2.510786, 0, 0, 0, 1, 1,
-0.2917515, -1.67473, -2.406873, 0, 0, 0, 1, 1,
-0.2872468, 0.2733796, -0.07359617, 0, 0, 0, 1, 1,
-0.2844429, -0.4512694, -3.826782, 0, 0, 0, 1, 1,
-0.284324, -0.8218225, -2.656812, 0, 0, 0, 1, 1,
-0.284124, 1.480641, -0.4193202, 0, 0, 0, 1, 1,
-0.280884, -0.865253, -2.599903, 1, 1, 1, 1, 1,
-0.2803664, 1.109261, -0.2628924, 1, 1, 1, 1, 1,
-0.2791565, 1.488719, 0.4727942, 1, 1, 1, 1, 1,
-0.2771375, -0.4010015, -1.754737, 1, 1, 1, 1, 1,
-0.2766208, 0.4161335, 0.05587988, 1, 1, 1, 1, 1,
-0.2752783, 0.4853449, 0.8260081, 1, 1, 1, 1, 1,
-0.2742731, -1.246536, -2.438278, 1, 1, 1, 1, 1,
-0.2738325, 0.3164338, -2.234182, 1, 1, 1, 1, 1,
-0.2682136, 1.703477, -1.58294, 1, 1, 1, 1, 1,
-0.2665141, -0.03723396, -1.199561, 1, 1, 1, 1, 1,
-0.2631984, 0.307996, -1.650558, 1, 1, 1, 1, 1,
-0.2621817, -0.807202, -1.967688, 1, 1, 1, 1, 1,
-0.2602296, 1.255897, -0.5231363, 1, 1, 1, 1, 1,
-0.2579446, -0.6837253, -3.423373, 1, 1, 1, 1, 1,
-0.2576809, -0.3702917, -2.371139, 1, 1, 1, 1, 1,
-0.2456347, 0.4267375, -0.318241, 0, 0, 1, 1, 1,
-0.2444757, -1.338396, -2.331135, 1, 0, 0, 1, 1,
-0.2424031, -2.276092, -1.820432, 1, 0, 0, 1, 1,
-0.2423638, 0.6579022, -1.011412, 1, 0, 0, 1, 1,
-0.2422561, 0.9326249, -0.4912098, 1, 0, 0, 1, 1,
-0.2394865, -1.03533, -2.059508, 1, 0, 0, 1, 1,
-0.2393208, 0.7986071, 0.4599116, 0, 0, 0, 1, 1,
-0.2370524, 0.4336514, -0.1651489, 0, 0, 0, 1, 1,
-0.2366217, 0.8620173, -0.9146622, 0, 0, 0, 1, 1,
-0.235018, -0.6032056, -4.04985, 0, 0, 0, 1, 1,
-0.2340742, 0.3562369, 0.1122875, 0, 0, 0, 1, 1,
-0.2320905, 0.1112009, -0.5441646, 0, 0, 0, 1, 1,
-0.2216189, 0.2334518, -1.636176, 0, 0, 0, 1, 1,
-0.2175239, 0.3221158, -0.8840098, 1, 1, 1, 1, 1,
-0.2041956, 1.174371, 1.082406, 1, 1, 1, 1, 1,
-0.1999388, 0.3438694, -0.9844593, 1, 1, 1, 1, 1,
-0.1975001, 0.2358071, -3.177809, 1, 1, 1, 1, 1,
-0.19699, -0.9377343, -3.505383, 1, 1, 1, 1, 1,
-0.1945862, -2.344236, -3.474582, 1, 1, 1, 1, 1,
-0.191292, -1.156169, -3.22074, 1, 1, 1, 1, 1,
-0.1882451, 0.11492, -1.441693, 1, 1, 1, 1, 1,
-0.1878198, -0.3223313, -2.597447, 1, 1, 1, 1, 1,
-0.1742473, 1.291902, -0.4023916, 1, 1, 1, 1, 1,
-0.1700286, 0.5919836, -0.8941625, 1, 1, 1, 1, 1,
-0.1687823, 0.6791235, -2.565915, 1, 1, 1, 1, 1,
-0.1591008, 0.5084568, 0.193086, 1, 1, 1, 1, 1,
-0.1580328, 1.68121, -2.579009, 1, 1, 1, 1, 1,
-0.1579972, -0.2321345, -1.508696, 1, 1, 1, 1, 1,
-0.1572802, -0.9252883, -4.143746, 0, 0, 1, 1, 1,
-0.1565923, 0.7634099, 0.01403474, 1, 0, 0, 1, 1,
-0.1544698, -0.4891928, -0.9384891, 1, 0, 0, 1, 1,
-0.1498969, 0.5144047, -0.1888688, 1, 0, 0, 1, 1,
-0.1452337, 0.249631, 0.5935871, 1, 0, 0, 1, 1,
-0.1422406, 2.539663, -0.6894635, 1, 0, 0, 1, 1,
-0.1421169, -0.8825313, -2.7412, 0, 0, 0, 1, 1,
-0.1412483, -1.193179, -3.944425, 0, 0, 0, 1, 1,
-0.1406494, 1.111683, 0.7481296, 0, 0, 0, 1, 1,
-0.1369583, -0.6337817, -1.115403, 0, 0, 0, 1, 1,
-0.1351967, 1.452777, -0.8743412, 0, 0, 0, 1, 1,
-0.1345522, 1.007136, -1.745796, 0, 0, 0, 1, 1,
-0.1309, 1.20309, 1.295436, 0, 0, 0, 1, 1,
-0.1281967, -1.527331, -3.606951, 1, 1, 1, 1, 1,
-0.1261566, -0.5893463, -3.501142, 1, 1, 1, 1, 1,
-0.1260299, -0.7107551, -3.590247, 1, 1, 1, 1, 1,
-0.1256797, 0.4220999, 0.6199107, 1, 1, 1, 1, 1,
-0.1201117, 1.078451, -0.4671956, 1, 1, 1, 1, 1,
-0.1190667, -0.5024427, -1.525925, 1, 1, 1, 1, 1,
-0.1165394, -0.3007686, -1.832482, 1, 1, 1, 1, 1,
-0.1150653, 0.00125806, -1.563672, 1, 1, 1, 1, 1,
-0.1127181, 0.8953421, 0.1399135, 1, 1, 1, 1, 1,
-0.1119267, 0.4017044, 0.3458295, 1, 1, 1, 1, 1,
-0.1116743, -1.359287, -2.613765, 1, 1, 1, 1, 1,
-0.1112486, 0.5874617, 0.546287, 1, 1, 1, 1, 1,
-0.1112332, -1.690075, -3.497435, 1, 1, 1, 1, 1,
-0.1099645, 0.8277799, -0.5429727, 1, 1, 1, 1, 1,
-0.1080334, -0.5045283, -2.29746, 1, 1, 1, 1, 1,
-0.106458, -0.4509993, -1.962286, 0, 0, 1, 1, 1,
-0.1034343, 0.01891608, -0.05978107, 1, 0, 0, 1, 1,
-0.1008488, -0.1867944, -2.461647, 1, 0, 0, 1, 1,
-0.09875688, 0.06190481, -0.406871, 1, 0, 0, 1, 1,
-0.09521964, 0.04820114, -1.381535, 1, 0, 0, 1, 1,
-0.09433202, -0.2094634, -2.948315, 1, 0, 0, 1, 1,
-0.09141269, -1.137076, -3.63666, 0, 0, 0, 1, 1,
-0.0897928, -0.9269488, -2.200119, 0, 0, 0, 1, 1,
-0.08412411, 1.061514, 1.21057, 0, 0, 0, 1, 1,
-0.08373471, 2.6314, 0.1472399, 0, 0, 0, 1, 1,
-0.0748846, -0.9970461, -3.275937, 0, 0, 0, 1, 1,
-0.06951649, 1.037176, 0.9240777, 0, 0, 0, 1, 1,
-0.06902085, -1.809476, -3.890804, 0, 0, 0, 1, 1,
-0.06860457, 1.013891, 0.6871281, 1, 1, 1, 1, 1,
-0.0587742, -0.685506, -3.594176, 1, 1, 1, 1, 1,
-0.05823806, -1.540483, -3.169424, 1, 1, 1, 1, 1,
-0.05774523, -1.802057, -2.904897, 1, 1, 1, 1, 1,
-0.05261106, -0.838852, -3.15381, 1, 1, 1, 1, 1,
-0.04934279, -0.03289551, -2.807828, 1, 1, 1, 1, 1,
-0.04895756, 0.5802212, -1.640293, 1, 1, 1, 1, 1,
-0.0475872, 0.1688256, 0.6716945, 1, 1, 1, 1, 1,
-0.04705266, 0.9899644, 0.1962084, 1, 1, 1, 1, 1,
-0.03929595, 0.8844139, 0.6079003, 1, 1, 1, 1, 1,
-0.03865784, 0.01794548, -2.662705, 1, 1, 1, 1, 1,
-0.03509889, 0.9219321, -1.391116, 1, 1, 1, 1, 1,
-0.02689658, 0.1125624, 2.033418, 1, 1, 1, 1, 1,
-0.02299963, -0.5716251, -3.265411, 1, 1, 1, 1, 1,
-0.02290835, 0.9637221, -0.2324454, 1, 1, 1, 1, 1,
-0.008693346, 0.996789, -0.464173, 0, 0, 1, 1, 1,
-0.008596146, -0.5847318, -3.069184, 1, 0, 0, 1, 1,
-0.008556393, 0.2514289, -0.7709212, 1, 0, 0, 1, 1,
-0.001867758, 1.515184, 0.469391, 1, 0, 0, 1, 1,
0.004217654, 1.986336, -1.202514, 1, 0, 0, 1, 1,
0.01104111, 0.5386103, -0.6636434, 1, 0, 0, 1, 1,
0.01170171, 0.6235881, 0.9447191, 0, 0, 0, 1, 1,
0.01894771, -1.790448, 3.216269, 0, 0, 0, 1, 1,
0.02033591, 0.1725876, -0.8125144, 0, 0, 0, 1, 1,
0.02645196, -0.5587958, 2.986211, 0, 0, 0, 1, 1,
0.02999548, -0.7870682, 2.427593, 0, 0, 0, 1, 1,
0.03006801, 1.489861, -0.06301796, 0, 0, 0, 1, 1,
0.03290614, -0.4874664, 3.839112, 0, 0, 0, 1, 1,
0.03374679, 0.2596555, -0.9469231, 1, 1, 1, 1, 1,
0.03501625, 0.8363915, 0.1138673, 1, 1, 1, 1, 1,
0.04206262, 1.122427, -1.521338, 1, 1, 1, 1, 1,
0.04262433, -1.498815, 2.813762, 1, 1, 1, 1, 1,
0.04338303, -1.32122, 3.00625, 1, 1, 1, 1, 1,
0.04472235, -1.761999, 4.420304, 1, 1, 1, 1, 1,
0.04824564, -0.9624018, 4.32668, 1, 1, 1, 1, 1,
0.04992925, -0.3306507, 3.909183, 1, 1, 1, 1, 1,
0.05453889, 0.4939563, -1.261837, 1, 1, 1, 1, 1,
0.05713417, -0.1384472, 4.135896, 1, 1, 1, 1, 1,
0.05804454, 2.912994, 0.2606552, 1, 1, 1, 1, 1,
0.06494353, 0.2189137, 1.582487, 1, 1, 1, 1, 1,
0.07952153, -0.6779479, 3.849384, 1, 1, 1, 1, 1,
0.08590943, 0.7951942, 0.1509327, 1, 1, 1, 1, 1,
0.08878055, -1.033475, 4.293182, 1, 1, 1, 1, 1,
0.09409373, -1.007968, 2.243867, 0, 0, 1, 1, 1,
0.09468157, 0.9739603, 0.07940397, 1, 0, 0, 1, 1,
0.09490436, -1.512405, 1.924638, 1, 0, 0, 1, 1,
0.1003379, 0.09903831, 1.891955, 1, 0, 0, 1, 1,
0.1033709, 0.4452915, -1.081959, 1, 0, 0, 1, 1,
0.1042914, 0.09065844, 2.900968, 1, 0, 0, 1, 1,
0.1045453, -2.348453, 4.604349, 0, 0, 0, 1, 1,
0.104725, 0.03661641, 1.681154, 0, 0, 0, 1, 1,
0.1052786, -0.3242092, 4.014568, 0, 0, 0, 1, 1,
0.1058309, -0.6582192, 2.549495, 0, 0, 0, 1, 1,
0.1113617, -1.465672, 1.85222, 0, 0, 0, 1, 1,
0.1121113, 0.693413, 0.7342027, 0, 0, 0, 1, 1,
0.1130123, 1.206481, -1.168427, 0, 0, 0, 1, 1,
0.1165363, 0.8164933, -1.496277, 1, 1, 1, 1, 1,
0.1187151, 1.659412, -0.4081878, 1, 1, 1, 1, 1,
0.1188488, -0.3495466, 3.092695, 1, 1, 1, 1, 1,
0.120272, -1.904266, 0.5183741, 1, 1, 1, 1, 1,
0.1208981, -0.9085035, 4.143461, 1, 1, 1, 1, 1,
0.1240957, -2.134279, 4.021279, 1, 1, 1, 1, 1,
0.1245717, -1.738029, 3.707768, 1, 1, 1, 1, 1,
0.1249254, 0.5281842, -0.2133066, 1, 1, 1, 1, 1,
0.1257692, 0.6419674, 0.5024182, 1, 1, 1, 1, 1,
0.1390749, -2.333756, 2.400497, 1, 1, 1, 1, 1,
0.1396086, -0.2972164, 3.750363, 1, 1, 1, 1, 1,
0.1412392, -0.1835311, 2.688174, 1, 1, 1, 1, 1,
0.1464834, -0.4234356, 2.483849, 1, 1, 1, 1, 1,
0.1497924, -1.487586, 4.057554, 1, 1, 1, 1, 1,
0.1508307, -1.458737, 3.684721, 1, 1, 1, 1, 1,
0.1508979, -0.6336538, 3.189951, 0, 0, 1, 1, 1,
0.154116, -1.424815, 3.342623, 1, 0, 0, 1, 1,
0.163431, -2.009219, 3.087834, 1, 0, 0, 1, 1,
0.1688301, -0.1666145, 2.730621, 1, 0, 0, 1, 1,
0.1733251, -1.389862, 1.956724, 1, 0, 0, 1, 1,
0.1746528, 2.654184, 0.3111036, 1, 0, 0, 1, 1,
0.1747241, 0.8973933, 0.9113887, 0, 0, 0, 1, 1,
0.1794816, 0.7948206, -0.05828812, 0, 0, 0, 1, 1,
0.1804357, -1.25674, 4.285412, 0, 0, 0, 1, 1,
0.1823995, 0.8170781, 0.8668056, 0, 0, 0, 1, 1,
0.1827467, 1.102939, -0.4479496, 0, 0, 0, 1, 1,
0.1830066, -0.4984194, 4.109226, 0, 0, 0, 1, 1,
0.1835242, 0.2934791, 1.531338, 0, 0, 0, 1, 1,
0.1840757, -1.693556, 2.633619, 1, 1, 1, 1, 1,
0.1855506, 0.7772696, 0.7540473, 1, 1, 1, 1, 1,
0.1856362, 0.0680135, 1.314553, 1, 1, 1, 1, 1,
0.1858644, 0.576474, -0.8757839, 1, 1, 1, 1, 1,
0.1890747, -0.01652969, 2.499178, 1, 1, 1, 1, 1,
0.1895922, -0.003579486, 0.6446695, 1, 1, 1, 1, 1,
0.195167, -0.2219183, 1.356055, 1, 1, 1, 1, 1,
0.1960602, 0.5985368, -0.4635929, 1, 1, 1, 1, 1,
0.2073082, 1.893765, 0.3378049, 1, 1, 1, 1, 1,
0.2097334, -0.1304571, 1.678778, 1, 1, 1, 1, 1,
0.2097826, -1.299895, 2.535221, 1, 1, 1, 1, 1,
0.2121891, -1.595352, 5.053337, 1, 1, 1, 1, 1,
0.2126905, 1.969377, -0.9242124, 1, 1, 1, 1, 1,
0.2182914, 0.1028465, 2.465998, 1, 1, 1, 1, 1,
0.2234448, -0.7971881, 2.322709, 1, 1, 1, 1, 1,
0.2251738, 1.318554, -0.8592677, 0, 0, 1, 1, 1,
0.2261028, 1.397679, 0.9826773, 1, 0, 0, 1, 1,
0.229697, -0.1727767, 2.438603, 1, 0, 0, 1, 1,
0.231193, -0.6359248, 3.924055, 1, 0, 0, 1, 1,
0.2328012, -0.06997783, 0.4862768, 1, 0, 0, 1, 1,
0.2334116, -1.437053, 4.157372, 1, 0, 0, 1, 1,
0.2338818, -0.4374192, 2.685307, 0, 0, 0, 1, 1,
0.2340164, 2.111482, 0.03018806, 0, 0, 0, 1, 1,
0.2341338, -0.6494823, 4.265567, 0, 0, 0, 1, 1,
0.2370775, 1.388003, 1.635888, 0, 0, 0, 1, 1,
0.2383761, -1.162485, 3.844471, 0, 0, 0, 1, 1,
0.2388726, 0.3310305, -1.051549, 0, 0, 0, 1, 1,
0.2438913, 1.166287, -0.1401237, 0, 0, 0, 1, 1,
0.2442581, 0.8019989, 1.583638, 1, 1, 1, 1, 1,
0.2468839, -0.5206007, 3.538114, 1, 1, 1, 1, 1,
0.2471821, 0.200293, 1.749218, 1, 1, 1, 1, 1,
0.2475122, -1.17019, 2.892864, 1, 1, 1, 1, 1,
0.2493034, -0.7487069, 2.140881, 1, 1, 1, 1, 1,
0.2500455, -0.4807166, 3.236422, 1, 1, 1, 1, 1,
0.2507436, -1.316867, 2.816627, 1, 1, 1, 1, 1,
0.252056, -0.1720809, 0.4085025, 1, 1, 1, 1, 1,
0.2563721, -0.6287773, 2.667069, 1, 1, 1, 1, 1,
0.2605402, -2.056507, 4.869889, 1, 1, 1, 1, 1,
0.2606329, 0.07820328, 0.5191521, 1, 1, 1, 1, 1,
0.2648683, 1.108308, -0.7143105, 1, 1, 1, 1, 1,
0.2656663, -2.188782, 3.597275, 1, 1, 1, 1, 1,
0.267481, 0.873408, 1.225078, 1, 1, 1, 1, 1,
0.2702056, -1.499781, 2.167007, 1, 1, 1, 1, 1,
0.2714938, -0.04778789, 1.44121, 0, 0, 1, 1, 1,
0.2765212, -0.1387772, 1.658701, 1, 0, 0, 1, 1,
0.2786, -1.09597, 3.310431, 1, 0, 0, 1, 1,
0.2816346, 0.3668318, 1.051437, 1, 0, 0, 1, 1,
0.2836485, -0.8295224, 3.203499, 1, 0, 0, 1, 1,
0.2841507, -0.129126, 1.663344, 1, 0, 0, 1, 1,
0.2889568, 0.879307, -0.465434, 0, 0, 0, 1, 1,
0.2889993, 1.232491, -0.2871421, 0, 0, 0, 1, 1,
0.3025451, -0.8956673, 3.537762, 0, 0, 0, 1, 1,
0.3031661, 1.253537, -0.8299133, 0, 0, 0, 1, 1,
0.3055952, 0.1564594, 1.053516, 0, 0, 0, 1, 1,
0.3061385, 1.004654, 1.297661, 0, 0, 0, 1, 1,
0.3071603, 1.953616, -1.104004, 0, 0, 0, 1, 1,
0.3097094, -1.803897, 1.275679, 1, 1, 1, 1, 1,
0.313628, 1.830526, -1.64948, 1, 1, 1, 1, 1,
0.3137684, 1.043645, -0.6114023, 1, 1, 1, 1, 1,
0.3149844, -0.9008635, 1.439843, 1, 1, 1, 1, 1,
0.3245764, -1.487373, 3.993937, 1, 1, 1, 1, 1,
0.3261541, 0.7827913, 2.398638, 1, 1, 1, 1, 1,
0.3274525, -1.701355, 3.856459, 1, 1, 1, 1, 1,
0.3276377, 1.081289, -0.03285983, 1, 1, 1, 1, 1,
0.3279621, 1.359303, -0.8532938, 1, 1, 1, 1, 1,
0.3339413, -1.778208, 4.386163, 1, 1, 1, 1, 1,
0.3442879, 0.1893943, 2.888585, 1, 1, 1, 1, 1,
0.3487163, -0.3245823, 0.2016964, 1, 1, 1, 1, 1,
0.3506993, 1.361284, -1.586604, 1, 1, 1, 1, 1,
0.3569126, -1.63501, 3.191293, 1, 1, 1, 1, 1,
0.3586138, -1.16154, 1.692767, 1, 1, 1, 1, 1,
0.3598856, -0.1077, 1.883036, 0, 0, 1, 1, 1,
0.3628325, -0.07441606, 3.174035, 1, 0, 0, 1, 1,
0.3664424, 0.4930944, -0.6404937, 1, 0, 0, 1, 1,
0.3667504, 0.4048525, 0.09748874, 1, 0, 0, 1, 1,
0.3677617, -0.3951696, 1.781137, 1, 0, 0, 1, 1,
0.3717679, -0.5074504, 2.091364, 1, 0, 0, 1, 1,
0.373866, -1.06355, 4.168587, 0, 0, 0, 1, 1,
0.3742131, -0.2707122, 1.512815, 0, 0, 0, 1, 1,
0.3760311, 0.03583675, 0.8948103, 0, 0, 0, 1, 1,
0.3761848, -0.126259, 2.592787, 0, 0, 0, 1, 1,
0.3807573, 0.341538, 1.884172, 0, 0, 0, 1, 1,
0.3824951, -0.1024441, 0.7825702, 0, 0, 0, 1, 1,
0.3832057, 2.182365, -2.781221, 0, 0, 0, 1, 1,
0.3920062, 0.1214124, 3.136078, 1, 1, 1, 1, 1,
0.3936048, -0.1371979, 1.898509, 1, 1, 1, 1, 1,
0.3958859, 0.02512985, 1.462977, 1, 1, 1, 1, 1,
0.3988554, -0.2498183, 4.632679, 1, 1, 1, 1, 1,
0.4013449, 1.386154, 0.8399465, 1, 1, 1, 1, 1,
0.4052444, -1.008369, 3.68099, 1, 1, 1, 1, 1,
0.4102722, -1.405155, 2.843021, 1, 1, 1, 1, 1,
0.4105845, 1.151243, 0.689774, 1, 1, 1, 1, 1,
0.415207, -0.0603406, 1.76513, 1, 1, 1, 1, 1,
0.4199304, -1.27097, 4.557, 1, 1, 1, 1, 1,
0.4203874, 0.0328056, 0.4338519, 1, 1, 1, 1, 1,
0.4204965, 1.060407, 0.7687464, 1, 1, 1, 1, 1,
0.4268535, -0.3717324, 1.137276, 1, 1, 1, 1, 1,
0.4295876, -0.6772831, 3.598732, 1, 1, 1, 1, 1,
0.4343084, 1.167202, 0.9638259, 1, 1, 1, 1, 1,
0.4344311, 1.483308, -0.2128957, 0, 0, 1, 1, 1,
0.4385277, -0.4681965, 2.149163, 1, 0, 0, 1, 1,
0.4419165, -1.83085, 5.209155, 1, 0, 0, 1, 1,
0.4431289, 0.972132, 0.6745502, 1, 0, 0, 1, 1,
0.4477243, 0.5599264, 0.63986, 1, 0, 0, 1, 1,
0.4479999, -1.288163, 3.571177, 1, 0, 0, 1, 1,
0.4524181, -1.630901, 2.657938, 0, 0, 0, 1, 1,
0.4569473, 0.3715663, 1.019014, 0, 0, 0, 1, 1,
0.4593191, 0.2238725, 0.9911564, 0, 0, 0, 1, 1,
0.460116, -0.4862965, 2.702412, 0, 0, 0, 1, 1,
0.4621691, -0.5903593, 2.20143, 0, 0, 0, 1, 1,
0.462337, -1.585772, 4.815883, 0, 0, 0, 1, 1,
0.4659007, -0.272184, 2.919854, 0, 0, 0, 1, 1,
0.4678917, 0.9664633, -0.1803447, 1, 1, 1, 1, 1,
0.4690491, -1.085428, 5.142941, 1, 1, 1, 1, 1,
0.4732057, -0.8213398, 4.015172, 1, 1, 1, 1, 1,
0.4751586, 0.438073, 1.704341, 1, 1, 1, 1, 1,
0.4784425, 1.126336, -0.2326066, 1, 1, 1, 1, 1,
0.479483, 1.285323, -0.1448308, 1, 1, 1, 1, 1,
0.4822347, 1.552679, -0.4506887, 1, 1, 1, 1, 1,
0.482421, 1.47832, 0.2643955, 1, 1, 1, 1, 1,
0.4831531, 1.960458, -0.4468772, 1, 1, 1, 1, 1,
0.4868654, 2.791258, -1.149903, 1, 1, 1, 1, 1,
0.4870282, -0.1821878, 0.7257353, 1, 1, 1, 1, 1,
0.487309, 1.168309, 0.2012015, 1, 1, 1, 1, 1,
0.491767, -1.29288, 3.634408, 1, 1, 1, 1, 1,
0.4941576, 0.4934247, -0.03544117, 1, 1, 1, 1, 1,
0.4988313, 0.4544813, 1.680693, 1, 1, 1, 1, 1,
0.4989305, -0.5236827, 3.061368, 0, 0, 1, 1, 1,
0.5000827, -1.030342, 2.142511, 1, 0, 0, 1, 1,
0.5078605, -0.09187728, 0.3248725, 1, 0, 0, 1, 1,
0.5087159, -1.498524, 3.188849, 1, 0, 0, 1, 1,
0.5089055, -1.838858, 4.521783, 1, 0, 0, 1, 1,
0.5122058, -1.188322, 1.451656, 1, 0, 0, 1, 1,
0.5128301, 0.2668221, 2.267741, 0, 0, 0, 1, 1,
0.5161996, -0.1826627, 2.030231, 0, 0, 0, 1, 1,
0.5196146, -1.465028, 2.10786, 0, 0, 0, 1, 1,
0.5200933, -0.2725323, 1.789528, 0, 0, 0, 1, 1,
0.5217516, -0.4837584, 4.228691, 0, 0, 0, 1, 1,
0.5224745, 0.8805912, 0.7302173, 0, 0, 0, 1, 1,
0.5251378, -1.622533, 1.529193, 0, 0, 0, 1, 1,
0.5256016, -0.8074867, 1.903421, 1, 1, 1, 1, 1,
0.5281978, -0.4041749, 1.452062, 1, 1, 1, 1, 1,
0.5363279, 0.9889743, 2.220254, 1, 1, 1, 1, 1,
0.537129, -0.3671841, 2.240129, 1, 1, 1, 1, 1,
0.5403802, 0.04278241, 0.5483198, 1, 1, 1, 1, 1,
0.5452945, -0.5422852, 1.349579, 1, 1, 1, 1, 1,
0.5469638, 0.6042233, 1.522693, 1, 1, 1, 1, 1,
0.5512869, 0.06711839, 1.75225, 1, 1, 1, 1, 1,
0.5550191, 1.809051, -0.5252733, 1, 1, 1, 1, 1,
0.5693818, -1.955103, 1.863115, 1, 1, 1, 1, 1,
0.5788392, 0.935394, 0.04359737, 1, 1, 1, 1, 1,
0.5813295, 0.2476285, 2.053138, 1, 1, 1, 1, 1,
0.5815516, 0.3717255, 0.4170347, 1, 1, 1, 1, 1,
0.585832, 0.3327306, 1.610384, 1, 1, 1, 1, 1,
0.5883495, -0.4850405, 2.548211, 1, 1, 1, 1, 1,
0.5989302, -2.263766, 2.765708, 0, 0, 1, 1, 1,
0.6046753, 1.173251, 0.07460594, 1, 0, 0, 1, 1,
0.605076, -2.144697, 1.476983, 1, 0, 0, 1, 1,
0.6058137, 1.583055, -1.073536, 1, 0, 0, 1, 1,
0.6090792, -0.7272372, 1.969518, 1, 0, 0, 1, 1,
0.611828, -0.08899114, 1.687918, 1, 0, 0, 1, 1,
0.622851, -2.765402, 3.385099, 0, 0, 0, 1, 1,
0.6271331, 0.1394153, 1.168738, 0, 0, 0, 1, 1,
0.6277314, 1.356566, -0.1870139, 0, 0, 0, 1, 1,
0.6328363, 0.02564082, 2.238465, 0, 0, 0, 1, 1,
0.6337, -0.3641065, 2.665648, 0, 0, 0, 1, 1,
0.6365982, 0.833593, 1.488783, 0, 0, 0, 1, 1,
0.63814, -0.6428824, 2.193574, 0, 0, 0, 1, 1,
0.6396741, 0.4811134, -0.007453906, 1, 1, 1, 1, 1,
0.641703, -1.190236, 2.310657, 1, 1, 1, 1, 1,
0.6445307, -0.8609794, 2.766869, 1, 1, 1, 1, 1,
0.6500416, 0.03730038, 0.8671982, 1, 1, 1, 1, 1,
0.6501129, -1.39296, 2.036422, 1, 1, 1, 1, 1,
0.6543222, 0.02890773, 0.4464796, 1, 1, 1, 1, 1,
0.6663318, 0.6461428, 0.8782938, 1, 1, 1, 1, 1,
0.6677194, 1.325974, 1.54089, 1, 1, 1, 1, 1,
0.6726278, 0.2263971, 2.549005, 1, 1, 1, 1, 1,
0.6736872, -0.8128676, 3.30015, 1, 1, 1, 1, 1,
0.675619, 0.6962633, 0.4159566, 1, 1, 1, 1, 1,
0.6777149, -0.6310028, 1.541469, 1, 1, 1, 1, 1,
0.6849374, -0.3975722, 1.343968, 1, 1, 1, 1, 1,
0.6871415, -0.2967571, 4.608266, 1, 1, 1, 1, 1,
0.7043539, 0.443365, -0.9598882, 1, 1, 1, 1, 1,
0.7141216, 1.135264, -0.295351, 0, 0, 1, 1, 1,
0.7164444, 0.0250344, 2.563964, 1, 0, 0, 1, 1,
0.7363511, 0.08599204, 1.369449, 1, 0, 0, 1, 1,
0.7364504, -1.412707, 2.620951, 1, 0, 0, 1, 1,
0.7400073, -0.626228, 2.84848, 1, 0, 0, 1, 1,
0.7406901, -1.213612, 1.814629, 1, 0, 0, 1, 1,
0.7410684, -0.1160047, -0.168172, 0, 0, 0, 1, 1,
0.7415417, -1.471326, 3.616771, 0, 0, 0, 1, 1,
0.745315, 1.257443, -0.07483805, 0, 0, 0, 1, 1,
0.745434, 0.1660648, 1.47934, 0, 0, 0, 1, 1,
0.7481142, 0.3250561, 1.717729, 0, 0, 0, 1, 1,
0.7506487, -0.7973173, 1.500353, 0, 0, 0, 1, 1,
0.7588794, 2.14687, 0.7709543, 0, 0, 0, 1, 1,
0.7726056, -1.047962, 3.911953, 1, 1, 1, 1, 1,
0.7782049, -2.357544, 1.730881, 1, 1, 1, 1, 1,
0.7791351, 1.778767, 2.267176, 1, 1, 1, 1, 1,
0.7791918, 0.08755194, 1.037693, 1, 1, 1, 1, 1,
0.780032, -1.591852, 2.762275, 1, 1, 1, 1, 1,
0.7870067, 2.654963, -3.338693, 1, 1, 1, 1, 1,
0.8050359, -1.614621, 3.494842, 1, 1, 1, 1, 1,
0.8056141, 0.3886375, 1.927595, 1, 1, 1, 1, 1,
0.8058066, 2.18238, 1.038562, 1, 1, 1, 1, 1,
0.807445, -1.139754, 2.370774, 1, 1, 1, 1, 1,
0.8128211, 0.6325223, 1.045324, 1, 1, 1, 1, 1,
0.8158147, 1.739635, 0.6336882, 1, 1, 1, 1, 1,
0.8214104, -0.0001960981, 0.9811827, 1, 1, 1, 1, 1,
0.8243555, 1.117977, 2.719765, 1, 1, 1, 1, 1,
0.8326823, -0.2387492, -0.2174076, 1, 1, 1, 1, 1,
0.8330401, -0.3148896, 0.9805875, 0, 0, 1, 1, 1,
0.8359112, 1.283197, -0.5715849, 1, 0, 0, 1, 1,
0.844309, -0.3313322, 3.581792, 1, 0, 0, 1, 1,
0.8445553, -0.5145571, 0.9443306, 1, 0, 0, 1, 1,
0.8512859, 0.06539206, 0.4972951, 1, 0, 0, 1, 1,
0.8541999, -0.8222571, 0.9982117, 1, 0, 0, 1, 1,
0.8564178, -1.159204, 1.854275, 0, 0, 0, 1, 1,
0.859264, -0.06537492, 0.3405, 0, 0, 0, 1, 1,
0.8632095, 0.9120646, -0.5057108, 0, 0, 0, 1, 1,
0.8676261, -1.174121, 0.4245176, 0, 0, 0, 1, 1,
0.8677705, -1.875444, 2.15918, 0, 0, 0, 1, 1,
0.8694243, -0.8019047, 3.601927, 0, 0, 0, 1, 1,
0.8704838, -0.8107812, 1.771423, 0, 0, 0, 1, 1,
0.8812718, -0.4188133, 0.6933253, 1, 1, 1, 1, 1,
0.8814259, 2.70916, 0.9261274, 1, 1, 1, 1, 1,
0.8836752, -0.3868049, 1.759194, 1, 1, 1, 1, 1,
0.8872492, -2.110615, 4.23878, 1, 1, 1, 1, 1,
0.8882017, 0.07898197, 2.03121, 1, 1, 1, 1, 1,
0.8906963, -0.694172, 1.874369, 1, 1, 1, 1, 1,
0.8956761, 0.692281, -0.1210474, 1, 1, 1, 1, 1,
0.8961242, 0.7493622, 1.356915, 1, 1, 1, 1, 1,
0.8963072, -0.5622008, 1.07283, 1, 1, 1, 1, 1,
0.8980308, 0.1627582, 0.5671443, 1, 1, 1, 1, 1,
0.9044576, -0.7632436, 1.616219, 1, 1, 1, 1, 1,
0.9053825, 1.672656, 0.1021151, 1, 1, 1, 1, 1,
0.9093541, -0.4311865, 1.64519, 1, 1, 1, 1, 1,
0.9129306, 0.5341314, 1.345896, 1, 1, 1, 1, 1,
0.9171649, -1.453068, 3.706047, 1, 1, 1, 1, 1,
0.9180521, 1.632992, -0.6873327, 0, 0, 1, 1, 1,
0.9219463, -0.1738376, 2.018388, 1, 0, 0, 1, 1,
0.9220074, -1.332521, 2.562561, 1, 0, 0, 1, 1,
0.9285319, 0.1306584, 2.107372, 1, 0, 0, 1, 1,
0.9322669, -1.052357, 3.017489, 1, 0, 0, 1, 1,
0.9475929, -0.6302798, 0.340476, 1, 0, 0, 1, 1,
0.9526088, -2.213572, 1.971025, 0, 0, 0, 1, 1,
0.9571707, 0.8465297, 1.537812, 0, 0, 0, 1, 1,
0.964153, 0.6586932, 0.8244827, 0, 0, 0, 1, 1,
0.9650238, 1.830749, -0.6147908, 0, 0, 0, 1, 1,
0.9700229, -1.377998, 0.6690648, 0, 0, 0, 1, 1,
0.9829043, -0.2900962, 2.833642, 0, 0, 0, 1, 1,
0.9857756, 0.06475858, 0.549798, 0, 0, 0, 1, 1,
0.9869545, -0.9672574, 2.856995, 1, 1, 1, 1, 1,
0.9997999, -1.478875, 1.810381, 1, 1, 1, 1, 1,
1.000409, -0.164792, 2.354628, 1, 1, 1, 1, 1,
1.000857, -0.4090843, 1.004101, 1, 1, 1, 1, 1,
1.003827, -0.886783, 1.694927, 1, 1, 1, 1, 1,
1.006017, -0.2095949, 1.025808, 1, 1, 1, 1, 1,
1.008555, 0.682338, 1.783852, 1, 1, 1, 1, 1,
1.008754, 0.6599951, 0.7503642, 1, 1, 1, 1, 1,
1.012428, -0.4662882, 1.645429, 1, 1, 1, 1, 1,
1.018697, -1.254758, 1.45545, 1, 1, 1, 1, 1,
1.0247, -0.6615653, 2.834537, 1, 1, 1, 1, 1,
1.02485, -1.406669, 1.18856, 1, 1, 1, 1, 1,
1.030421, 0.5101206, -0.2933541, 1, 1, 1, 1, 1,
1.030899, -0.4259623, 3.200313, 1, 1, 1, 1, 1,
1.032592, 0.6873917, 1.805998, 1, 1, 1, 1, 1,
1.048881, 1.328033, -0.1402113, 0, 0, 1, 1, 1,
1.053457, -0.1345321, 1.680521, 1, 0, 0, 1, 1,
1.053621, -3.39217, 1.862772, 1, 0, 0, 1, 1,
1.05438, -0.4948318, 2.277675, 1, 0, 0, 1, 1,
1.057386, 0.7244044, 1.326643, 1, 0, 0, 1, 1,
1.057741, 0.07970651, 1.624067, 1, 0, 0, 1, 1,
1.062919, 0.2061313, 2.46989, 0, 0, 0, 1, 1,
1.062952, 1.363958, 1.048361, 0, 0, 0, 1, 1,
1.071285, -2.211625, 2.284289, 0, 0, 0, 1, 1,
1.079743, 0.3152688, 0.6502383, 0, 0, 0, 1, 1,
1.079805, 1.551436, 1.300176, 0, 0, 0, 1, 1,
1.08089, -1.471061, 2.225309, 0, 0, 0, 1, 1,
1.084279, 0.119549, 1.978453, 0, 0, 0, 1, 1,
1.085847, -0.3811281, 0.2889287, 1, 1, 1, 1, 1,
1.087874, 1.067136, 0.05647685, 1, 1, 1, 1, 1,
1.087965, 0.227049, 2.56246, 1, 1, 1, 1, 1,
1.08848, -3.820984, 3.367173, 1, 1, 1, 1, 1,
1.089565, -0.2879098, 1.534206, 1, 1, 1, 1, 1,
1.090124, -1.349945, 1.040406, 1, 1, 1, 1, 1,
1.094272, 0.5896392, 0.1364661, 1, 1, 1, 1, 1,
1.099922, 0.9617749, 2.215515, 1, 1, 1, 1, 1,
1.10924, 1.022101, -0.09570203, 1, 1, 1, 1, 1,
1.110374, -0.9257873, 2.61886, 1, 1, 1, 1, 1,
1.113338, 0.7666482, -0.4868935, 1, 1, 1, 1, 1,
1.113806, 2.367317, -1.26207, 1, 1, 1, 1, 1,
1.114664, -0.8749419, 2.000462, 1, 1, 1, 1, 1,
1.118942, -0.6823953, 1.54723, 1, 1, 1, 1, 1,
1.120881, -0.05165827, 2.424616, 1, 1, 1, 1, 1,
1.128695, -0.5357074, 2.798835, 0, 0, 1, 1, 1,
1.129772, 1.188576, 0.3979948, 1, 0, 0, 1, 1,
1.131162, -1.103901, 1.578478, 1, 0, 0, 1, 1,
1.140153, -0.1007674, 1.722878, 1, 0, 0, 1, 1,
1.151986, -0.6403147, 4.214832, 1, 0, 0, 1, 1,
1.182018, 0.4534575, -0.07006574, 1, 0, 0, 1, 1,
1.18229, 0.9487415, 0.7555388, 0, 0, 0, 1, 1,
1.184655, 0.6686794, 1.924067, 0, 0, 0, 1, 1,
1.21104, -0.4645016, 1.363111, 0, 0, 0, 1, 1,
1.214109, -0.2169397, 0.3324503, 0, 0, 0, 1, 1,
1.215996, 0.8955566, 0.1762349, 0, 0, 0, 1, 1,
1.216347, -0.1614784, 2.777287, 0, 0, 0, 1, 1,
1.21864, -0.1685928, 2.32378, 0, 0, 0, 1, 1,
1.219624, 0.7746152, -0.035902, 1, 1, 1, 1, 1,
1.225904, 0.01765351, 2.263711, 1, 1, 1, 1, 1,
1.230321, -0.05712276, 0.2386378, 1, 1, 1, 1, 1,
1.248495, -0.3839521, 2.742586, 1, 1, 1, 1, 1,
1.260511, -0.9005521, 0.9642481, 1, 1, 1, 1, 1,
1.268949, -1.038228, 1.365382, 1, 1, 1, 1, 1,
1.270049, 0.9770123, -1.118923, 1, 1, 1, 1, 1,
1.271246, -2.58271, 2.34389, 1, 1, 1, 1, 1,
1.272107, 0.2129886, 0.08354633, 1, 1, 1, 1, 1,
1.286832, 2.202723, 0.365154, 1, 1, 1, 1, 1,
1.288187, 1.223701, -0.04320034, 1, 1, 1, 1, 1,
1.294316, -0.7525655, 2.494468, 1, 1, 1, 1, 1,
1.30268, -1.253464, 2.372666, 1, 1, 1, 1, 1,
1.320558, 2.036118, 0.1954073, 1, 1, 1, 1, 1,
1.325323, 0.4461031, 1.308912, 1, 1, 1, 1, 1,
1.335454, 1.436873, 0.09843582, 0, 0, 1, 1, 1,
1.34031, -0.2217564, 1.430613, 1, 0, 0, 1, 1,
1.342211, 0.8103232, 1.146012, 1, 0, 0, 1, 1,
1.343239, 0.02243247, 2.799955, 1, 0, 0, 1, 1,
1.348294, -1.367266, 2.890072, 1, 0, 0, 1, 1,
1.353847, -0.2940027, 0.4209665, 1, 0, 0, 1, 1,
1.362989, 0.1475425, 0.9897091, 0, 0, 0, 1, 1,
1.365405, -0.1508019, 1.369146, 0, 0, 0, 1, 1,
1.368076, -1.495695, 4.228526, 0, 0, 0, 1, 1,
1.369246, 1.739207, 0.4332521, 0, 0, 0, 1, 1,
1.370957, 0.2131943, 1.756896, 0, 0, 0, 1, 1,
1.371609, 1.001262, 1.858608, 0, 0, 0, 1, 1,
1.372799, 0.8116719, 0.7895373, 0, 0, 0, 1, 1,
1.373284, -0.02627401, 1.191331, 1, 1, 1, 1, 1,
1.393174, 1.200112, 0.7439857, 1, 1, 1, 1, 1,
1.399474, 1.077188, 2.288253, 1, 1, 1, 1, 1,
1.403419, -0.07438377, -0.2998942, 1, 1, 1, 1, 1,
1.404512, 0.1639223, 3.126857, 1, 1, 1, 1, 1,
1.416196, 0.4185367, -0.8341137, 1, 1, 1, 1, 1,
1.42118, 2.14487, 1.719224, 1, 1, 1, 1, 1,
1.425854, -0.2233831, 1.015674, 1, 1, 1, 1, 1,
1.449527, -0.7805143, 1.371935, 1, 1, 1, 1, 1,
1.454513, -0.1902735, 1.503641, 1, 1, 1, 1, 1,
1.466833, 0.1916225, 0.1911105, 1, 1, 1, 1, 1,
1.469482, -2.02687, 2.819855, 1, 1, 1, 1, 1,
1.470432, -1.762202, 1.781114, 1, 1, 1, 1, 1,
1.474027, -0.06387556, 1.835113, 1, 1, 1, 1, 1,
1.478236, -0.2281397, 3.46682, 1, 1, 1, 1, 1,
1.479352, 1.269083, -0.6164393, 0, 0, 1, 1, 1,
1.480832, -0.5920194, 3.673128, 1, 0, 0, 1, 1,
1.490847, 0.08102918, 2.195416, 1, 0, 0, 1, 1,
1.510201, 1.923274, 0.666629, 1, 0, 0, 1, 1,
1.512293, -0.1142594, 1.742377, 1, 0, 0, 1, 1,
1.552816, 1.80978, 2.273875, 1, 0, 0, 1, 1,
1.554346, 0.6115699, 0.676434, 0, 0, 0, 1, 1,
1.568642, 0.2471908, -0.1033491, 0, 0, 0, 1, 1,
1.571368, -0.5952543, 2.686778, 0, 0, 0, 1, 1,
1.577644, 1.793255, 0.4430823, 0, 0, 0, 1, 1,
1.578646, 0.4988017, 1.448581, 0, 0, 0, 1, 1,
1.585113, 0.5372257, 0.5560005, 0, 0, 0, 1, 1,
1.608965, -0.4887727, 1.794275, 0, 0, 0, 1, 1,
1.618061, -1.500232, 1.450863, 1, 1, 1, 1, 1,
1.627309, -1.09695, 1.201454, 1, 1, 1, 1, 1,
1.629982, -1.269553, 1.107451, 1, 1, 1, 1, 1,
1.634379, -0.6853154, 1.487832, 1, 1, 1, 1, 1,
1.675645, 0.03235088, 2.179776, 1, 1, 1, 1, 1,
1.688205, 0.1923156, 2.051761, 1, 1, 1, 1, 1,
1.690328, 1.214531, 0.3761933, 1, 1, 1, 1, 1,
1.72717, -1.579137, 2.396122, 1, 1, 1, 1, 1,
1.727711, -1.424943, 1.772033, 1, 1, 1, 1, 1,
1.733717, 0.2369315, 2.427637, 1, 1, 1, 1, 1,
1.745935, -0.3672451, 2.1168, 1, 1, 1, 1, 1,
1.753479, 0.8789721, 0.6053647, 1, 1, 1, 1, 1,
1.758906, -2.498143, 2.411697, 1, 1, 1, 1, 1,
1.76189, -0.3418534, 2.235504, 1, 1, 1, 1, 1,
1.766129, 0.6622207, 0.2691703, 1, 1, 1, 1, 1,
1.795111, -0.2042844, 0.1903177, 0, 0, 1, 1, 1,
1.796774, -0.2683882, 2.555394, 1, 0, 0, 1, 1,
1.827609, -0.1160214, 1.692037, 1, 0, 0, 1, 1,
1.858619, 0.5936662, 1.205268, 1, 0, 0, 1, 1,
1.863307, -0.3715232, 1.938576, 1, 0, 0, 1, 1,
1.865873, 1.199265, 0.9200452, 1, 0, 0, 1, 1,
1.878797, 0.1844748, 0.3957047, 0, 0, 0, 1, 1,
1.889571, 0.2464942, 0.5734917, 0, 0, 0, 1, 1,
1.897505, 0.2191167, 2.083208, 0, 0, 0, 1, 1,
1.905108, 0.1302807, 0.4808917, 0, 0, 0, 1, 1,
1.914055, -2.013936, 0.04915841, 0, 0, 0, 1, 1,
1.926785, -0.4325929, 1.698343, 0, 0, 0, 1, 1,
1.933507, -0.05754231, 1.752963, 0, 0, 0, 1, 1,
1.933959, 1.401671, 0.7390907, 1, 1, 1, 1, 1,
1.949624, 0.1293278, 0.4496405, 1, 1, 1, 1, 1,
1.955346, -0.01129957, 1.583135, 1, 1, 1, 1, 1,
1.959097, 0.07522235, -1.585792, 1, 1, 1, 1, 1,
1.976069, 0.1533962, 1.710078, 1, 1, 1, 1, 1,
1.980501, -0.03856918, 2.112144, 1, 1, 1, 1, 1,
1.986082, -1.280774, 1.285942, 1, 1, 1, 1, 1,
2.00233, 0.2737993, 1.763572, 1, 1, 1, 1, 1,
2.038681, -0.5306202, 1.514224, 1, 1, 1, 1, 1,
2.057855, -0.3705341, 1.478885, 1, 1, 1, 1, 1,
2.072263, 1.943576, 1.81492, 1, 1, 1, 1, 1,
2.088069, 1.189876, 1.474858, 1, 1, 1, 1, 1,
2.095937, 0.4838608, -0.3624839, 1, 1, 1, 1, 1,
2.119249, 0.2976374, 1.419008, 1, 1, 1, 1, 1,
2.126556, 0.9518086, 1.606492, 1, 1, 1, 1, 1,
2.135802, 0.4702682, 0.8766376, 0, 0, 1, 1, 1,
2.145541, -0.3765617, 2.282698, 1, 0, 0, 1, 1,
2.211286, 0.7163213, 1.96374, 1, 0, 0, 1, 1,
2.233585, 0.8750232, 1.54247, 1, 0, 0, 1, 1,
2.234831, -1.983951, 2.779097, 1, 0, 0, 1, 1,
2.260074, -0.8602136, 1.171345, 1, 0, 0, 1, 1,
2.278532, -1.043847, 1.60817, 0, 0, 0, 1, 1,
2.356842, -0.6041566, 0.1581191, 0, 0, 0, 1, 1,
2.366454, -0.9405313, 1.618989, 0, 0, 0, 1, 1,
2.381719, -1.118911, 1.800519, 0, 0, 0, 1, 1,
2.420966, -1.2492, 3.980535, 0, 0, 0, 1, 1,
2.433494, 0.5703109, 3.330772, 0, 0, 0, 1, 1,
2.442883, -0.4223638, 0.5512172, 0, 0, 0, 1, 1,
2.53303, -0.1028557, 1.103617, 1, 1, 1, 1, 1,
2.612375, -0.03503634, 2.024176, 1, 1, 1, 1, 1,
2.640627, 0.1376287, 1.47855, 1, 1, 1, 1, 1,
2.844966, 0.7722712, 1.848026, 1, 1, 1, 1, 1,
3.073407, 0.1329418, 2.88784, 1, 1, 1, 1, 1,
3.10169, 0.569575, 1.023271, 1, 1, 1, 1, 1,
3.26515, -0.5024624, 1.967491, 1, 1, 1, 1, 1
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
var radius = 9.90659;
var distance = 34.79648;
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
mvMatrix.translate( -0.1707313, -0.2099051, 0.03854609 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79648);
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