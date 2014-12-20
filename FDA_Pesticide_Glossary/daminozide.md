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
-3.080357, 0.7803817, -2.03453, 1, 0, 0, 1,
-3.064017, -0.01248422, -0.3674994, 1, 0.007843138, 0, 1,
-2.635819, 1.529194, -2.260907, 1, 0.01176471, 0, 1,
-2.621676, -1.319191, -1.155092, 1, 0.01960784, 0, 1,
-2.609205, 2.489541, -1.440748, 1, 0.02352941, 0, 1,
-2.604922, -0.1331232, -1.200262, 1, 0.03137255, 0, 1,
-2.594792, 0.3499751, -0.1428117, 1, 0.03529412, 0, 1,
-2.503033, 0.3376451, -1.358585, 1, 0.04313726, 0, 1,
-2.490067, -0.6848918, -2.287675, 1, 0.04705882, 0, 1,
-2.463922, 0.985208, -2.62445, 1, 0.05490196, 0, 1,
-2.420791, 0.6441384, -1.60946, 1, 0.05882353, 0, 1,
-2.37111, -0.2420898, -1.906791, 1, 0.06666667, 0, 1,
-2.270621, 0.8129215, -0.3153617, 1, 0.07058824, 0, 1,
-2.267861, 1.814722, -0.5169091, 1, 0.07843138, 0, 1,
-2.170542, -0.2378116, -2.646222, 1, 0.08235294, 0, 1,
-2.143461, 0.5877554, -3.116176, 1, 0.09019608, 0, 1,
-2.118145, -0.04167508, -2.198051, 1, 0.09411765, 0, 1,
-2.090075, 0.8262327, -0.9479527, 1, 0.1019608, 0, 1,
-2.080218, -1.248419, -4.103167, 1, 0.1098039, 0, 1,
-2.056035, 0.4631259, 0.3372068, 1, 0.1137255, 0, 1,
-2.050863, 0.1168525, -1.933975, 1, 0.1215686, 0, 1,
-2.049615, -0.1663413, -2.733003, 1, 0.1254902, 0, 1,
-2.030623, -0.2003976, -1.799623, 1, 0.1333333, 0, 1,
-2.003322, 0.4203353, -1.318818, 1, 0.1372549, 0, 1,
-1.997467, 0.6221425, -2.158502, 1, 0.145098, 0, 1,
-1.981508, -0.3883045, -3.867457, 1, 0.1490196, 0, 1,
-1.968114, 0.5589004, -0.862817, 1, 0.1568628, 0, 1,
-1.958002, -0.5307596, -1.655522, 1, 0.1607843, 0, 1,
-1.866231, -1.115297, -1.112523, 1, 0.1686275, 0, 1,
-1.85902, 0.2066811, -0.8238317, 1, 0.172549, 0, 1,
-1.845919, -1.185445, -1.892479, 1, 0.1803922, 0, 1,
-1.826181, 0.4520297, -1.162974, 1, 0.1843137, 0, 1,
-1.820048, 0.2253918, -1.912864, 1, 0.1921569, 0, 1,
-1.818318, -0.8629167, -3.687447, 1, 0.1960784, 0, 1,
-1.807782, 0.5007362, -2.216217, 1, 0.2039216, 0, 1,
-1.806054, 2.606004, 0.4303339, 1, 0.2117647, 0, 1,
-1.799842, 0.7590435, -1.893567, 1, 0.2156863, 0, 1,
-1.773567, 1.299048, -2.215958, 1, 0.2235294, 0, 1,
-1.762094, 0.6258969, -0.4883125, 1, 0.227451, 0, 1,
-1.745906, 0.2276116, -0.5327123, 1, 0.2352941, 0, 1,
-1.714115, 0.3179599, 0.4897866, 1, 0.2392157, 0, 1,
-1.698649, 0.7988495, -0.4438165, 1, 0.2470588, 0, 1,
-1.672053, -0.8403825, -2.390229, 1, 0.2509804, 0, 1,
-1.644417, 1.661557, 0.03673485, 1, 0.2588235, 0, 1,
-1.637965, 0.5630369, -1.212257, 1, 0.2627451, 0, 1,
-1.637799, 0.3207414, -2.013756, 1, 0.2705882, 0, 1,
-1.636458, -0.3525595, 0.114237, 1, 0.2745098, 0, 1,
-1.618979, -0.1799634, -1.549554, 1, 0.282353, 0, 1,
-1.613276, 0.9888746, -2.417483, 1, 0.2862745, 0, 1,
-1.609822, 0.0642247, -1.61129, 1, 0.2941177, 0, 1,
-1.606931, -0.1083458, -1.598891, 1, 0.3019608, 0, 1,
-1.601026, 0.5258592, -0.7751986, 1, 0.3058824, 0, 1,
-1.59263, -1.329319, -2.179653, 1, 0.3137255, 0, 1,
-1.581445, 0.706066, -0.9731406, 1, 0.3176471, 0, 1,
-1.580238, -0.9817629, -2.366708, 1, 0.3254902, 0, 1,
-1.575912, -0.4048812, -1.233024, 1, 0.3294118, 0, 1,
-1.572449, 0.3584651, -2.631274, 1, 0.3372549, 0, 1,
-1.550534, -0.1860147, -1.393958, 1, 0.3411765, 0, 1,
-1.545726, -1.058622, -2.740234, 1, 0.3490196, 0, 1,
-1.545096, 0.436039, -1.985952, 1, 0.3529412, 0, 1,
-1.53812, 1.295766, -0.8779664, 1, 0.3607843, 0, 1,
-1.534463, 0.1747425, 0.06632122, 1, 0.3647059, 0, 1,
-1.528762, 2.007464, -0.6797204, 1, 0.372549, 0, 1,
-1.525178, -2.971981, -2.419503, 1, 0.3764706, 0, 1,
-1.521016, -1.955488, -1.600018, 1, 0.3843137, 0, 1,
-1.519056, 1.1565, -0.08111781, 1, 0.3882353, 0, 1,
-1.509849, -0.4252076, -2.462445, 1, 0.3960784, 0, 1,
-1.502396, -2.808154, -3.73832, 1, 0.4039216, 0, 1,
-1.501145, -0.8258935, -0.2514141, 1, 0.4078431, 0, 1,
-1.49776, -0.2491046, -0.3758349, 1, 0.4156863, 0, 1,
-1.481479, 1.040568, -1.01157, 1, 0.4196078, 0, 1,
-1.478933, 0.06155132, -1.973246, 1, 0.427451, 0, 1,
-1.470838, -1.063818, -2.921094, 1, 0.4313726, 0, 1,
-1.458394, 0.5377768, -0.5351015, 1, 0.4392157, 0, 1,
-1.455215, 1.257209, 0.6653543, 1, 0.4431373, 0, 1,
-1.453964, 0.4247306, -3.507921, 1, 0.4509804, 0, 1,
-1.451173, 0.296352, -2.395344, 1, 0.454902, 0, 1,
-1.450964, -2.177164, -3.296465, 1, 0.4627451, 0, 1,
-1.4483, 2.467346, -0.4464265, 1, 0.4666667, 0, 1,
-1.447069, 0.5446497, -0.282841, 1, 0.4745098, 0, 1,
-1.444357, -0.5348344, -1.3279, 1, 0.4784314, 0, 1,
-1.430278, 1.718592, 1.810905, 1, 0.4862745, 0, 1,
-1.428172, 0.1459061, -1.914532, 1, 0.4901961, 0, 1,
-1.420333, -0.2635368, -1.163118, 1, 0.4980392, 0, 1,
-1.419837, 0.04076606, -1.550973, 1, 0.5058824, 0, 1,
-1.416476, 0.5911509, -0.4830385, 1, 0.509804, 0, 1,
-1.408242, -0.2010775, -1.811709, 1, 0.5176471, 0, 1,
-1.407467, 1.169429, -0.6751508, 1, 0.5215687, 0, 1,
-1.405828, 0.4144741, -0.1360286, 1, 0.5294118, 0, 1,
-1.399627, -0.9358191, -0.9879812, 1, 0.5333334, 0, 1,
-1.378903, 1.652703, -1.848983, 1, 0.5411765, 0, 1,
-1.350523, -0.2949474, -1.137628, 1, 0.5450981, 0, 1,
-1.342485, 0.03633211, -1.185859, 1, 0.5529412, 0, 1,
-1.334891, -1.357906, -4.008327, 1, 0.5568628, 0, 1,
-1.333822, 1.420007, -2.212667, 1, 0.5647059, 0, 1,
-1.328439, 1.902219, -1.678179, 1, 0.5686275, 0, 1,
-1.317973, 0.9272726, -1.233806, 1, 0.5764706, 0, 1,
-1.313724, -2.20525, -0.8972703, 1, 0.5803922, 0, 1,
-1.29884, -0.4432845, -1.857867, 1, 0.5882353, 0, 1,
-1.281088, -0.8267184, -3.383445, 1, 0.5921569, 0, 1,
-1.276518, -1.256429, -1.674063, 1, 0.6, 0, 1,
-1.272764, 1.98861, -2.089937, 1, 0.6078432, 0, 1,
-1.272488, 1.337966, 0.5294009, 1, 0.6117647, 0, 1,
-1.268354, 1.871843, -0.4642263, 1, 0.6196079, 0, 1,
-1.267934, -0.2077456, -2.607666, 1, 0.6235294, 0, 1,
-1.258055, 0.9561375, -0.5115454, 1, 0.6313726, 0, 1,
-1.250986, -1.153176, -2.397464, 1, 0.6352941, 0, 1,
-1.243908, 0.8257813, -3.697133, 1, 0.6431373, 0, 1,
-1.241925, 1.131063, 0.1254319, 1, 0.6470588, 0, 1,
-1.230074, 0.4062169, -1.921367, 1, 0.654902, 0, 1,
-1.228406, 0.9802704, -0.4791376, 1, 0.6588235, 0, 1,
-1.223041, -0.2926346, -2.239674, 1, 0.6666667, 0, 1,
-1.218587, 1.243306, 0.04562884, 1, 0.6705883, 0, 1,
-1.217088, -0.3014711, -1.941106, 1, 0.6784314, 0, 1,
-1.199856, 0.3028016, -1.412233, 1, 0.682353, 0, 1,
-1.185397, 1.439506, -1.542872, 1, 0.6901961, 0, 1,
-1.179084, -0.2495369, -0.8280185, 1, 0.6941177, 0, 1,
-1.169564, -0.156438, -1.168414, 1, 0.7019608, 0, 1,
-1.167181, -0.5992581, -0.4866627, 1, 0.7098039, 0, 1,
-1.16197, -1.947517, -2.581295, 1, 0.7137255, 0, 1,
-1.156703, -0.1058594, -1.946722, 1, 0.7215686, 0, 1,
-1.152639, -2.746524, -2.523839, 1, 0.7254902, 0, 1,
-1.148423, -1.420121, -2.225773, 1, 0.7333333, 0, 1,
-1.148275, -0.5617216, -5.053188, 1, 0.7372549, 0, 1,
-1.146382, 1.700789, -1.752612, 1, 0.7450981, 0, 1,
-1.138045, -0.8265832, -3.867601, 1, 0.7490196, 0, 1,
-1.136386, 0.06010302, -0.5078211, 1, 0.7568628, 0, 1,
-1.13403, -1.782119, -2.107238, 1, 0.7607843, 0, 1,
-1.128179, 1.113914, -0.6217457, 1, 0.7686275, 0, 1,
-1.127435, 1.728845, -0.3597847, 1, 0.772549, 0, 1,
-1.123424, -1.165924, -1.500312, 1, 0.7803922, 0, 1,
-1.111097, -0.9421172, -1.740035, 1, 0.7843137, 0, 1,
-1.108033, -0.03281833, -1.576624, 1, 0.7921569, 0, 1,
-1.102304, 0.1046021, -0.1463053, 1, 0.7960784, 0, 1,
-1.100353, 1.792094, 0.1929395, 1, 0.8039216, 0, 1,
-1.090647, 0.2191036, -1.332077, 1, 0.8117647, 0, 1,
-1.085327, -1.411972, -3.22662, 1, 0.8156863, 0, 1,
-1.081387, -1.129073, -2.081813, 1, 0.8235294, 0, 1,
-1.080616, 0.6925509, -1.021409, 1, 0.827451, 0, 1,
-1.077766, -0.404304, -0.3797916, 1, 0.8352941, 0, 1,
-1.066656, -1.655726, -2.524009, 1, 0.8392157, 0, 1,
-1.060727, 0.8455407, -0.482112, 1, 0.8470588, 0, 1,
-1.049313, -1.915501, -3.012431, 1, 0.8509804, 0, 1,
-1.046612, -1.290368, -2.790843, 1, 0.8588235, 0, 1,
-1.044482, -0.6947181, -3.905421, 1, 0.8627451, 0, 1,
-1.043291, -1.585433, -1.778262, 1, 0.8705882, 0, 1,
-1.026973, -0.7331505, -0.7725497, 1, 0.8745098, 0, 1,
-1.02356, 0.9933334, -0.1216089, 1, 0.8823529, 0, 1,
-1.013524, 1.296051, -1.583242, 1, 0.8862745, 0, 1,
-1.012285, 0.428384, -1.173542, 1, 0.8941177, 0, 1,
-1.011898, -0.212519, -2.127159, 1, 0.8980392, 0, 1,
-1.00012, -1.444119, -1.952099, 1, 0.9058824, 0, 1,
-0.9975573, -0.1593642, -3.219968, 1, 0.9137255, 0, 1,
-0.9967825, 1.309173, -2.563579, 1, 0.9176471, 0, 1,
-0.9959161, 0.2355234, -0.7685854, 1, 0.9254902, 0, 1,
-0.9930323, 2.42083, -1.850793, 1, 0.9294118, 0, 1,
-0.9919445, 1.270681, 0.1118048, 1, 0.9372549, 0, 1,
-0.9849365, 1.60639, -1.11111, 1, 0.9411765, 0, 1,
-0.9817937, 0.8186089, -1.568061, 1, 0.9490196, 0, 1,
-0.9807799, -0.4999924, -1.463622, 1, 0.9529412, 0, 1,
-0.9723592, 0.2079746, -1.4437, 1, 0.9607843, 0, 1,
-0.9626744, -0.9031723, -2.042273, 1, 0.9647059, 0, 1,
-0.9620023, -0.7553411, -2.16848, 1, 0.972549, 0, 1,
-0.9512119, 0.4605622, -1.214467, 1, 0.9764706, 0, 1,
-0.9497395, 1.626678, 0.2640043, 1, 0.9843137, 0, 1,
-0.9436164, -0.3370619, -1.358199, 1, 0.9882353, 0, 1,
-0.9382847, -1.081587, -2.628022, 1, 0.9960784, 0, 1,
-0.936053, -2.045578, -3.153699, 0.9960784, 1, 0, 1,
-0.9310793, -0.5631009, -1.71916, 0.9921569, 1, 0, 1,
-0.9290086, 0.7687699, 0.8408133, 0.9843137, 1, 0, 1,
-0.9261317, -0.1008779, -0.160516, 0.9803922, 1, 0, 1,
-0.9202965, -0.7275251, -1.176809, 0.972549, 1, 0, 1,
-0.9164548, -1.124317, -1.23867, 0.9686275, 1, 0, 1,
-0.913936, -0.4014519, -0.8058199, 0.9607843, 1, 0, 1,
-0.9129044, -1.568733, -2.600341, 0.9568627, 1, 0, 1,
-0.9119244, -1.46177, -3.259645, 0.9490196, 1, 0, 1,
-0.8986847, -0.2245068, -0.8940172, 0.945098, 1, 0, 1,
-0.8891683, -0.4363476, -3.37335, 0.9372549, 1, 0, 1,
-0.8856169, -1.002209, -1.261523, 0.9333333, 1, 0, 1,
-0.8840485, -1.051677, -2.820357, 0.9254902, 1, 0, 1,
-0.8831879, 0.718525, -1.4931, 0.9215686, 1, 0, 1,
-0.8782552, -0.06991147, -1.807976, 0.9137255, 1, 0, 1,
-0.8775405, 0.930765, -1.439744, 0.9098039, 1, 0, 1,
-0.875137, 0.6474705, -3.544789, 0.9019608, 1, 0, 1,
-0.8673471, 1.515876, 1.229556, 0.8941177, 1, 0, 1,
-0.8653316, -0.1743967, -2.4122, 0.8901961, 1, 0, 1,
-0.862652, -1.78891, -4.06946, 0.8823529, 1, 0, 1,
-0.8598027, 2.531088, -0.6653162, 0.8784314, 1, 0, 1,
-0.8567906, -0.9623501, -0.5490398, 0.8705882, 1, 0, 1,
-0.8566014, 0.8414274, -1.817937, 0.8666667, 1, 0, 1,
-0.8547202, 0.07964547, -1.844209, 0.8588235, 1, 0, 1,
-0.8529408, -0.1692774, 0.5582284, 0.854902, 1, 0, 1,
-0.8523861, -0.4606955, -4.326231, 0.8470588, 1, 0, 1,
-0.8512907, 1.293077, -0.5457007, 0.8431373, 1, 0, 1,
-0.8433167, 1.1307, -1.278476, 0.8352941, 1, 0, 1,
-0.8397834, 0.2385005, -2.133756, 0.8313726, 1, 0, 1,
-0.8368576, 0.9408082, -0.7079427, 0.8235294, 1, 0, 1,
-0.8282616, -1.876862, -1.208495, 0.8196079, 1, 0, 1,
-0.8209369, 0.607985, -1.973032, 0.8117647, 1, 0, 1,
-0.8198508, 1.424176, -2.327154, 0.8078431, 1, 0, 1,
-0.8124346, -0.7219746, -0.9756671, 0.8, 1, 0, 1,
-0.8092756, 1.434323, -0.2517746, 0.7921569, 1, 0, 1,
-0.8074514, -0.7247692, -3.599239, 0.7882353, 1, 0, 1,
-0.7920153, -0.6957807, -3.525987, 0.7803922, 1, 0, 1,
-0.7911851, -1.164741, -2.568931, 0.7764706, 1, 0, 1,
-0.7906761, 0.9411363, -2.517453, 0.7686275, 1, 0, 1,
-0.7902642, 0.6402986, -1.304618, 0.7647059, 1, 0, 1,
-0.7901353, -1.436534, -0.6283625, 0.7568628, 1, 0, 1,
-0.7894486, -0.3948564, -1.371757, 0.7529412, 1, 0, 1,
-0.7858713, 0.5170809, -1.570744, 0.7450981, 1, 0, 1,
-0.7795404, -1.168483, -3.172602, 0.7411765, 1, 0, 1,
-0.7789884, -2.309027, -2.067122, 0.7333333, 1, 0, 1,
-0.7697648, 0.6275476, -0.7031727, 0.7294118, 1, 0, 1,
-0.766683, 0.6220053, -1.266623, 0.7215686, 1, 0, 1,
-0.7640035, 0.2337048, -1.758872, 0.7176471, 1, 0, 1,
-0.7637122, -0.4686085, -2.242198, 0.7098039, 1, 0, 1,
-0.7618731, -0.1980598, -0.9906007, 0.7058824, 1, 0, 1,
-0.7604866, -1.15208, -2.208933, 0.6980392, 1, 0, 1,
-0.7603421, 0.5724807, -0.9843233, 0.6901961, 1, 0, 1,
-0.7596988, 0.02881452, -1.183947, 0.6862745, 1, 0, 1,
-0.7548148, 0.4121507, 0.6220171, 0.6784314, 1, 0, 1,
-0.7534796, -1.233708, -2.301026, 0.6745098, 1, 0, 1,
-0.7519245, -0.3451421, -2.622411, 0.6666667, 1, 0, 1,
-0.750086, -0.8669612, -3.019958, 0.6627451, 1, 0, 1,
-0.7455881, 1.357505, 0.3458669, 0.654902, 1, 0, 1,
-0.7415173, -0.414881, -2.830858, 0.6509804, 1, 0, 1,
-0.7396157, -0.4927348, -2.031622, 0.6431373, 1, 0, 1,
-0.7374436, -1.248058, -3.922092, 0.6392157, 1, 0, 1,
-0.7370572, -1.307101, -4.298918, 0.6313726, 1, 0, 1,
-0.7357857, 1.230536, 0.07342876, 0.627451, 1, 0, 1,
-0.7353348, 1.751274, -0.8082502, 0.6196079, 1, 0, 1,
-0.7328125, 0.2590293, -0.7240669, 0.6156863, 1, 0, 1,
-0.7315195, 0.6304413, -0.2520042, 0.6078432, 1, 0, 1,
-0.7305387, 0.187164, -2.000135, 0.6039216, 1, 0, 1,
-0.7274621, -3.130307, -2.95468, 0.5960785, 1, 0, 1,
-0.726432, 1.053425, 2.572063, 0.5882353, 1, 0, 1,
-0.7228019, 0.9318942, -0.3162132, 0.5843138, 1, 0, 1,
-0.7191291, 0.4381917, 1.135329, 0.5764706, 1, 0, 1,
-0.7187999, 1.269865, 1.43838, 0.572549, 1, 0, 1,
-0.7136323, -1.432274, -2.407598, 0.5647059, 1, 0, 1,
-0.7032269, 0.8996149, -0.9918865, 0.5607843, 1, 0, 1,
-0.7008221, -0.2540175, -1.558579, 0.5529412, 1, 0, 1,
-0.6882179, -0.9153361, -2.419979, 0.5490196, 1, 0, 1,
-0.6869, 0.7881826, -1.353524, 0.5411765, 1, 0, 1,
-0.6854925, -1.270003, -1.579531, 0.5372549, 1, 0, 1,
-0.6764172, -1.830449, -3.352106, 0.5294118, 1, 0, 1,
-0.6751176, -1.435267, -2.004732, 0.5254902, 1, 0, 1,
-0.6718425, -0.7285622, -3.147125, 0.5176471, 1, 0, 1,
-0.6714386, -0.5824996, -1.867167, 0.5137255, 1, 0, 1,
-0.6674215, 0.5330415, 1.223479, 0.5058824, 1, 0, 1,
-0.6663097, -0.4498725, -2.075055, 0.5019608, 1, 0, 1,
-0.6608861, -1.21217, -3.240491, 0.4941176, 1, 0, 1,
-0.657339, -0.7072182, -2.478373, 0.4862745, 1, 0, 1,
-0.6488808, 1.772754, -2.23699, 0.4823529, 1, 0, 1,
-0.6446891, -0.6061638, -4.550845, 0.4745098, 1, 0, 1,
-0.6425261, -1.452297, -2.863657, 0.4705882, 1, 0, 1,
-0.6389015, -0.8209739, -3.657092, 0.4627451, 1, 0, 1,
-0.6374328, 0.1948188, -1.681664, 0.4588235, 1, 0, 1,
-0.6361351, -0.7716879, -4.764404, 0.4509804, 1, 0, 1,
-0.6342565, 2.098353, -0.2319812, 0.4470588, 1, 0, 1,
-0.6288288, -0.8512427, -4.711107, 0.4392157, 1, 0, 1,
-0.6229126, -0.526562, -1.563527, 0.4352941, 1, 0, 1,
-0.6208397, 0.1471912, -3.465742, 0.427451, 1, 0, 1,
-0.6141498, 0.7625976, 0.4780153, 0.4235294, 1, 0, 1,
-0.6090264, -1.35298, -3.84895, 0.4156863, 1, 0, 1,
-0.6042055, -0.1615693, -1.279174, 0.4117647, 1, 0, 1,
-0.6019275, 0.009311852, -0.5160817, 0.4039216, 1, 0, 1,
-0.6012864, -0.9562483, -1.716858, 0.3960784, 1, 0, 1,
-0.5951199, -1.124122, -3.350427, 0.3921569, 1, 0, 1,
-0.5907905, 1.632964, -0.5053781, 0.3843137, 1, 0, 1,
-0.5868779, 1.075748, -0.4403819, 0.3803922, 1, 0, 1,
-0.5861027, 1.873361, -2.04914, 0.372549, 1, 0, 1,
-0.5767291, -2.608415, -3.109498, 0.3686275, 1, 0, 1,
-0.5720466, 0.6429887, 1.172895, 0.3607843, 1, 0, 1,
-0.5715828, -0.1270614, -1.668362, 0.3568628, 1, 0, 1,
-0.5696853, 0.380043, 0.07441637, 0.3490196, 1, 0, 1,
-0.5685852, -0.3547505, -2.98311, 0.345098, 1, 0, 1,
-0.5679162, -0.1701464, -2.175771, 0.3372549, 1, 0, 1,
-0.5623759, 1.216903, 1.25958, 0.3333333, 1, 0, 1,
-0.5579155, 0.2333224, -1.025014, 0.3254902, 1, 0, 1,
-0.5543021, 0.9951376, -0.6582627, 0.3215686, 1, 0, 1,
-0.5518697, 1.181567, -1.298097, 0.3137255, 1, 0, 1,
-0.545721, 0.9412023, -0.5894247, 0.3098039, 1, 0, 1,
-0.5448437, 0.4606252, -0.8949276, 0.3019608, 1, 0, 1,
-0.5416263, 0.08902708, -2.548804, 0.2941177, 1, 0, 1,
-0.5409358, 0.2492167, -1.666358, 0.2901961, 1, 0, 1,
-0.5406234, -0.596719, -1.127832, 0.282353, 1, 0, 1,
-0.5397758, -2.521146, -2.827593, 0.2784314, 1, 0, 1,
-0.5394019, -1.741443, -3.360236, 0.2705882, 1, 0, 1,
-0.5388404, 0.9936468, -1.074242, 0.2666667, 1, 0, 1,
-0.5357637, -0.3516513, -1.959461, 0.2588235, 1, 0, 1,
-0.5356809, 2.135403, 1.018392, 0.254902, 1, 0, 1,
-0.5351611, -0.5993395, -3.191915, 0.2470588, 1, 0, 1,
-0.5349262, 0.7523309, -0.2406118, 0.2431373, 1, 0, 1,
-0.5305601, 0.5113469, 0.1777912, 0.2352941, 1, 0, 1,
-0.5293893, 1.997695, -0.004549821, 0.2313726, 1, 0, 1,
-0.5271531, 2.962165, -0.610302, 0.2235294, 1, 0, 1,
-0.5221148, -2.153111, -2.132782, 0.2196078, 1, 0, 1,
-0.5219865, -0.8389385, -1.736661, 0.2117647, 1, 0, 1,
-0.5197508, -0.801799, -1.519422, 0.2078431, 1, 0, 1,
-0.5108767, -0.2400525, -2.812566, 0.2, 1, 0, 1,
-0.5097028, 1.815814, 0.3452645, 0.1921569, 1, 0, 1,
-0.5089754, -0.9080808, -2.968757, 0.1882353, 1, 0, 1,
-0.5085226, -1.244429, -1.702844, 0.1803922, 1, 0, 1,
-0.5076904, 0.3473278, -2.145858, 0.1764706, 1, 0, 1,
-0.5008526, -0.3320255, -1.120531, 0.1686275, 1, 0, 1,
-0.4989241, -0.7393407, -3.320814, 0.1647059, 1, 0, 1,
-0.487967, 0.7190229, 0.4930967, 0.1568628, 1, 0, 1,
-0.4808837, -1.585284, -3.340132, 0.1529412, 1, 0, 1,
-0.4774824, -0.1534352, -0.1847831, 0.145098, 1, 0, 1,
-0.4768115, 0.6272137, -0.1436034, 0.1411765, 1, 0, 1,
-0.4761087, -0.4184493, -4.317726, 0.1333333, 1, 0, 1,
-0.4722121, 0.4914681, -0.7834464, 0.1294118, 1, 0, 1,
-0.4705057, -1.170259, -2.575353, 0.1215686, 1, 0, 1,
-0.4696606, -1.30856, -1.670339, 0.1176471, 1, 0, 1,
-0.4688067, -0.1735834, -2.14331, 0.1098039, 1, 0, 1,
-0.463762, -0.4112017, -2.696215, 0.1058824, 1, 0, 1,
-0.4623527, -0.1506269, -2.873836, 0.09803922, 1, 0, 1,
-0.4600731, 0.2821972, -1.603601, 0.09019608, 1, 0, 1,
-0.4554274, 0.3270975, -0.6134848, 0.08627451, 1, 0, 1,
-0.4529516, -0.9471121, -2.488002, 0.07843138, 1, 0, 1,
-0.449438, 1.208065, -0.1574498, 0.07450981, 1, 0, 1,
-0.446493, -0.3976381, -0.949852, 0.06666667, 1, 0, 1,
-0.4439229, -1.972474, -2.550207, 0.0627451, 1, 0, 1,
-0.4428512, 1.432691, 0.991583, 0.05490196, 1, 0, 1,
-0.440847, 1.02848, -0.5222059, 0.05098039, 1, 0, 1,
-0.4394587, 0.8041843, -0.1298511, 0.04313726, 1, 0, 1,
-0.4368408, 0.3117258, -0.04296748, 0.03921569, 1, 0, 1,
-0.4275552, -0.7798042, -3.648839, 0.03137255, 1, 0, 1,
-0.4270132, -2.633338, -3.927577, 0.02745098, 1, 0, 1,
-0.4218705, 0.7728459, -0.399873, 0.01960784, 1, 0, 1,
-0.4182031, 1.283147, 0.6927769, 0.01568628, 1, 0, 1,
-0.4174016, -0.4324598, -2.274929, 0.007843138, 1, 0, 1,
-0.4170895, 0.7041963, -0.3828251, 0.003921569, 1, 0, 1,
-0.4169608, -0.1233337, -2.635344, 0, 1, 0.003921569, 1,
-0.416363, 0.9833753, -0.767316, 0, 1, 0.01176471, 1,
-0.4162872, 1.256348, -0.5136977, 0, 1, 0.01568628, 1,
-0.4075574, -0.440865, -1.816623, 0, 1, 0.02352941, 1,
-0.4039028, 0.3126517, -2.280297, 0, 1, 0.02745098, 1,
-0.4011298, 0.3186252, -1.495582, 0, 1, 0.03529412, 1,
-0.3940107, -0.5378289, -2.055504, 0, 1, 0.03921569, 1,
-0.387951, 0.154496, -0.4312719, 0, 1, 0.04705882, 1,
-0.3845251, 0.6213621, 0.757058, 0, 1, 0.05098039, 1,
-0.3826095, 0.7901839, -0.4831094, 0, 1, 0.05882353, 1,
-0.3786057, 0.2429295, -0.5034152, 0, 1, 0.0627451, 1,
-0.3784735, -0.7075415, -1.610694, 0, 1, 0.07058824, 1,
-0.3782787, -1.107018, -3.032097, 0, 1, 0.07450981, 1,
-0.3695429, -1.253826, -2.607405, 0, 1, 0.08235294, 1,
-0.366283, 0.894008, 0.1865274, 0, 1, 0.08627451, 1,
-0.3632108, -0.8515477, -2.390904, 0, 1, 0.09411765, 1,
-0.362096, 0.145818, -3.004272, 0, 1, 0.1019608, 1,
-0.3606371, -2.057835, -2.620269, 0, 1, 0.1058824, 1,
-0.3605837, 1.058869, 0.4908118, 0, 1, 0.1137255, 1,
-0.3601311, 0.791812, 0.4995671, 0, 1, 0.1176471, 1,
-0.3593757, 0.5680484, -2.530434, 0, 1, 0.1254902, 1,
-0.3592308, 1.157395, 1.210263, 0, 1, 0.1294118, 1,
-0.3490423, -1.105463, -4.642553, 0, 1, 0.1372549, 1,
-0.3487571, 0.4089251, -1.000803, 0, 1, 0.1411765, 1,
-0.3487478, -0.2119652, -2.579514, 0, 1, 0.1490196, 1,
-0.3452509, 0.03778095, -3.049026, 0, 1, 0.1529412, 1,
-0.3439564, -0.6534248, -3.319351, 0, 1, 0.1607843, 1,
-0.341913, 0.3322635, -2.175778, 0, 1, 0.1647059, 1,
-0.3404362, -0.3690267, -1.469572, 0, 1, 0.172549, 1,
-0.3396705, 0.9065819, 0.3906693, 0, 1, 0.1764706, 1,
-0.339166, -0.9527494, -2.841255, 0, 1, 0.1843137, 1,
-0.3387603, 0.474802, -0.5256171, 0, 1, 0.1882353, 1,
-0.3386142, -0.9289629, -1.084711, 0, 1, 0.1960784, 1,
-0.3379306, -1.327626, -3.513502, 0, 1, 0.2039216, 1,
-0.3291094, -0.5813069, -2.125067, 0, 1, 0.2078431, 1,
-0.3275358, 1.398994, -1.432777, 0, 1, 0.2156863, 1,
-0.3273935, -1.604497, -3.780438, 0, 1, 0.2196078, 1,
-0.3251774, -0.259302, -2.755288, 0, 1, 0.227451, 1,
-0.3217302, -1.319252, -2.891361, 0, 1, 0.2313726, 1,
-0.3200001, -0.2694155, -1.374168, 0, 1, 0.2392157, 1,
-0.31688, 1.769195, 0.832322, 0, 1, 0.2431373, 1,
-0.3164231, 1.418716, -0.1689212, 0, 1, 0.2509804, 1,
-0.3162707, 0.4475985, 0.4098253, 0, 1, 0.254902, 1,
-0.3135959, -1.666756, -2.837163, 0, 1, 0.2627451, 1,
-0.3081797, 0.1922237, -0.9753447, 0, 1, 0.2666667, 1,
-0.3035268, 1.23933, -1.599462, 0, 1, 0.2745098, 1,
-0.3007895, 2.013612, -2.221691, 0, 1, 0.2784314, 1,
-0.3000592, 0.6922206, -0.8647973, 0, 1, 0.2862745, 1,
-0.2974948, 0.6009357, 1.208226, 0, 1, 0.2901961, 1,
-0.2968669, 0.4677804, -2.661558, 0, 1, 0.2980392, 1,
-0.2947779, 0.5094514, -2.003457, 0, 1, 0.3058824, 1,
-0.2939907, 1.429425, 0.08722094, 0, 1, 0.3098039, 1,
-0.2900124, -0.3385106, -1.84035, 0, 1, 0.3176471, 1,
-0.2897102, -1.75275, -1.89257, 0, 1, 0.3215686, 1,
-0.2840222, -0.2039667, -2.854338, 0, 1, 0.3294118, 1,
-0.2837917, -0.6140488, -3.144541, 0, 1, 0.3333333, 1,
-0.2803851, 0.00260135, -1.62099, 0, 1, 0.3411765, 1,
-0.2749676, -0.2046748, -3.732626, 0, 1, 0.345098, 1,
-0.2678763, 0.02404811, -1.158308, 0, 1, 0.3529412, 1,
-0.2637422, 0.7855365, -1.479267, 0, 1, 0.3568628, 1,
-0.2587182, -1.027273, -0.3984923, 0, 1, 0.3647059, 1,
-0.2580398, 0.5767375, 0.6659878, 0, 1, 0.3686275, 1,
-0.2529766, 0.3114633, -1.406043, 0, 1, 0.3764706, 1,
-0.2528954, 1.066702, -0.08601763, 0, 1, 0.3803922, 1,
-0.2496139, 0.1136215, -2.504926, 0, 1, 0.3882353, 1,
-0.2471877, 0.1456947, 0.5139686, 0, 1, 0.3921569, 1,
-0.2397979, -0.7225925, -3.035914, 0, 1, 0.4, 1,
-0.2362863, -0.1572533, -2.352468, 0, 1, 0.4078431, 1,
-0.2263029, -0.9539863, -1.253306, 0, 1, 0.4117647, 1,
-0.2254801, -0.1460847, -1.591849, 0, 1, 0.4196078, 1,
-0.2247758, -1.364198, -3.143466, 0, 1, 0.4235294, 1,
-0.2136208, 0.01755097, -1.734528, 0, 1, 0.4313726, 1,
-0.2085019, -0.2990696, -1.471208, 0, 1, 0.4352941, 1,
-0.2061537, -0.3866957, -3.062411, 0, 1, 0.4431373, 1,
-0.2051603, 0.8364252, -0.1130314, 0, 1, 0.4470588, 1,
-0.2024046, -0.6305265, -1.371973, 0, 1, 0.454902, 1,
-0.2019532, -0.09623524, -2.92732, 0, 1, 0.4588235, 1,
-0.2005795, 1.589075, 0.520757, 0, 1, 0.4666667, 1,
-0.1875098, -0.9357359, -2.601895, 0, 1, 0.4705882, 1,
-0.1862243, -2.428401, -1.382028, 0, 1, 0.4784314, 1,
-0.1860856, -0.3216299, -2.848593, 0, 1, 0.4823529, 1,
-0.1844884, 0.1674181, -0.1516177, 0, 1, 0.4901961, 1,
-0.1828816, -0.7840168, -2.627012, 0, 1, 0.4941176, 1,
-0.1790479, 0.3549962, -0.6023872, 0, 1, 0.5019608, 1,
-0.1766298, 0.4754148, 0.8571141, 0, 1, 0.509804, 1,
-0.1749068, -0.9891753, -4.502036, 0, 1, 0.5137255, 1,
-0.1740749, -0.6929689, -1.799571, 0, 1, 0.5215687, 1,
-0.1694312, -1.948176, -4.08176, 0, 1, 0.5254902, 1,
-0.1685384, -0.2716585, -1.286528, 0, 1, 0.5333334, 1,
-0.1622303, 0.6111061, 1.478162, 0, 1, 0.5372549, 1,
-0.161945, -1.242755, -2.476538, 0, 1, 0.5450981, 1,
-0.1602179, -1.752252, -2.480782, 0, 1, 0.5490196, 1,
-0.1576786, 1.311185, -2.191428, 0, 1, 0.5568628, 1,
-0.1567214, 0.6157018, 0.09361202, 0, 1, 0.5607843, 1,
-0.1562966, 0.07546189, -0.7531692, 0, 1, 0.5686275, 1,
-0.1555889, 0.01201363, 1.044763, 0, 1, 0.572549, 1,
-0.1553704, -0.3412908, -1.074918, 0, 1, 0.5803922, 1,
-0.1511071, 2.160773, -0.8717612, 0, 1, 0.5843138, 1,
-0.146373, 0.3477939, -0.1698823, 0, 1, 0.5921569, 1,
-0.1453371, 2.01113, 0.3213609, 0, 1, 0.5960785, 1,
-0.1448801, 0.298894, -2.027453, 0, 1, 0.6039216, 1,
-0.1399516, -0.247745, -1.18658, 0, 1, 0.6117647, 1,
-0.1357468, -1.044403, -3.320976, 0, 1, 0.6156863, 1,
-0.1342452, 0.9720836, -0.1425994, 0, 1, 0.6235294, 1,
-0.1337843, -1.019925, -4.275573, 0, 1, 0.627451, 1,
-0.1287321, 0.4193941, -1.02143, 0, 1, 0.6352941, 1,
-0.1228032, 1.167506, 0.1563117, 0, 1, 0.6392157, 1,
-0.1204396, -0.9689721, -2.877321, 0, 1, 0.6470588, 1,
-0.1179999, -0.1742895, -3.810919, 0, 1, 0.6509804, 1,
-0.1166715, 2.503727, -0.6881851, 0, 1, 0.6588235, 1,
-0.1131597, 0.07408735, -2.778507, 0, 1, 0.6627451, 1,
-0.1107424, -0.4008412, -3.753764, 0, 1, 0.6705883, 1,
-0.1062118, 0.4211185, 0.7270569, 0, 1, 0.6745098, 1,
-0.1047714, -0.8876739, -2.605972, 0, 1, 0.682353, 1,
-0.1006504, 0.244599, -0.7404579, 0, 1, 0.6862745, 1,
-0.09749006, 1.196995, -2.029327, 0, 1, 0.6941177, 1,
-0.09097535, -0.6727195, -2.554021, 0, 1, 0.7019608, 1,
-0.09035325, 0.6831391, -1.862067, 0, 1, 0.7058824, 1,
-0.08611825, 0.5024969, 3.025968, 0, 1, 0.7137255, 1,
-0.08450836, -2.371548, -2.150531, 0, 1, 0.7176471, 1,
-0.08282322, 1.257751, -0.2465639, 0, 1, 0.7254902, 1,
-0.07061518, 0.7566653, 0.1851664, 0, 1, 0.7294118, 1,
-0.06318855, -0.6454686, -3.271273, 0, 1, 0.7372549, 1,
-0.06243771, 0.6648316, 0.2913155, 0, 1, 0.7411765, 1,
-0.06171441, -0.9680573, -4.298388, 0, 1, 0.7490196, 1,
-0.0600109, -0.00772177, -1.036459, 0, 1, 0.7529412, 1,
-0.05968819, -1.028072, -3.689074, 0, 1, 0.7607843, 1,
-0.05926383, -0.7591518, -2.303786, 0, 1, 0.7647059, 1,
-0.05887172, -0.3073317, -4.07412, 0, 1, 0.772549, 1,
-0.05307094, 0.1741698, -0.9916034, 0, 1, 0.7764706, 1,
-0.04961294, 0.01409905, -0.7117555, 0, 1, 0.7843137, 1,
-0.04693827, -0.8287019, -3.134134, 0, 1, 0.7882353, 1,
-0.04664188, 0.379579, -0.5903556, 0, 1, 0.7960784, 1,
-0.04505184, 0.6453241, -0.5855305, 0, 1, 0.8039216, 1,
-0.0433966, -0.6369468, -1.570456, 0, 1, 0.8078431, 1,
-0.04133092, -0.3776255, -1.810456, 0, 1, 0.8156863, 1,
-0.0350696, 0.6439225, -1.39156, 0, 1, 0.8196079, 1,
-0.03460697, 1.421068, -0.4178163, 0, 1, 0.827451, 1,
-0.03256459, -1.879146, -2.723278, 0, 1, 0.8313726, 1,
-0.03232527, 0.3770495, 0.100682, 0, 1, 0.8392157, 1,
-0.0316508, 1.513528, -0.9164824, 0, 1, 0.8431373, 1,
-0.03120753, -0.9957188, -1.489207, 0, 1, 0.8509804, 1,
-0.02918316, -1.654995, -2.35201, 0, 1, 0.854902, 1,
-0.02709072, 0.7226681, -1.678949, 0, 1, 0.8627451, 1,
-0.02419203, -1.236352, -3.129807, 0, 1, 0.8666667, 1,
-0.02227409, 0.8479723, 0.7346036, 0, 1, 0.8745098, 1,
-0.0186171, 1.945572, 0.9167761, 0, 1, 0.8784314, 1,
-0.0151247, -2.169272, -2.850867, 0, 1, 0.8862745, 1,
-0.01005805, -1.046434, -3.477433, 0, 1, 0.8901961, 1,
-0.009131262, -0.1096299, -4.898802, 0, 1, 0.8980392, 1,
-0.004896429, -0.4212942, -3.52778, 0, 1, 0.9058824, 1,
-0.00461371, -0.3079738, -2.07416, 0, 1, 0.9098039, 1,
-0.003722585, 0.9915137, 2.089055, 0, 1, 0.9176471, 1,
0.0002922091, -0.789699, 4.40999, 0, 1, 0.9215686, 1,
0.004196586, 0.8598959, 2.243608, 0, 1, 0.9294118, 1,
0.005283902, 0.6943123, -0.02109258, 0, 1, 0.9333333, 1,
0.006001839, -0.7729092, 3.583026, 0, 1, 0.9411765, 1,
0.0125205, 0.1194731, 0.559506, 0, 1, 0.945098, 1,
0.01262125, 1.636289, -0.9375421, 0, 1, 0.9529412, 1,
0.01367945, 0.3463565, -0.8045986, 0, 1, 0.9568627, 1,
0.01605435, 1.191771, 0.02544892, 0, 1, 0.9647059, 1,
0.02116089, -0.8000607, 3.533113, 0, 1, 0.9686275, 1,
0.02217807, 0.7357066, 0.6642545, 0, 1, 0.9764706, 1,
0.02276788, -0.4630327, 1.765579, 0, 1, 0.9803922, 1,
0.03111126, 0.5687349, -0.5009695, 0, 1, 0.9882353, 1,
0.03146433, 0.9104357, 0.2017192, 0, 1, 0.9921569, 1,
0.03173157, 1.275754, 0.3122207, 0, 1, 1, 1,
0.03201914, -1.416184, 4.209704, 0, 0.9921569, 1, 1,
0.03266827, -0.5700938, 3.532622, 0, 0.9882353, 1, 1,
0.03535921, -2.240625, 3.593528, 0, 0.9803922, 1, 1,
0.03670868, -0.8685877, 3.330721, 0, 0.9764706, 1, 1,
0.03783559, 0.0670405, -0.6207599, 0, 0.9686275, 1, 1,
0.03815644, -0.002803454, 2.160465, 0, 0.9647059, 1, 1,
0.0401543, 0.3084221, 0.2201057, 0, 0.9568627, 1, 1,
0.0435286, 0.9722622, -0.2968754, 0, 0.9529412, 1, 1,
0.04582747, -0.9483093, 2.597548, 0, 0.945098, 1, 1,
0.05049133, 0.2346777, -0.3977279, 0, 0.9411765, 1, 1,
0.05114961, 0.08301029, 1.186919, 0, 0.9333333, 1, 1,
0.05736505, 0.2410921, -0.5167261, 0, 0.9294118, 1, 1,
0.05977083, -1.070016, 3.19269, 0, 0.9215686, 1, 1,
0.06143968, -0.5506869, 3.036038, 0, 0.9176471, 1, 1,
0.06235657, 1.463485, -1.192911, 0, 0.9098039, 1, 1,
0.06497256, -0.3150385, 3.885859, 0, 0.9058824, 1, 1,
0.06532613, -0.8383666, 1.81009, 0, 0.8980392, 1, 1,
0.0664763, 0.02992659, 1.062655, 0, 0.8901961, 1, 1,
0.06674525, -0.8878871, 4.067499, 0, 0.8862745, 1, 1,
0.06840245, 1.370853, 0.4994797, 0, 0.8784314, 1, 1,
0.07082881, -0.1064226, 1.66115, 0, 0.8745098, 1, 1,
0.07497425, -0.1608344, 2.898146, 0, 0.8666667, 1, 1,
0.07632374, -0.7522317, 1.198048, 0, 0.8627451, 1, 1,
0.07930523, -0.3304295, 2.627861, 0, 0.854902, 1, 1,
0.08454021, -1.463076, 2.934319, 0, 0.8509804, 1, 1,
0.09013385, 0.7198591, -0.8527977, 0, 0.8431373, 1, 1,
0.09240069, -0.3142922, 2.507899, 0, 0.8392157, 1, 1,
0.09722485, -0.2358573, 1.030243, 0, 0.8313726, 1, 1,
0.09815697, 0.9202117, -0.8063526, 0, 0.827451, 1, 1,
0.1052793, -0.1420093, 2.36818, 0, 0.8196079, 1, 1,
0.1066515, -0.1115922, 1.465024, 0, 0.8156863, 1, 1,
0.1123687, -0.7130516, 2.756553, 0, 0.8078431, 1, 1,
0.1173416, -1.683464, 3.566628, 0, 0.8039216, 1, 1,
0.1204695, 2.100945, -1.256577, 0, 0.7960784, 1, 1,
0.1216468, -0.9689948, 2.957173, 0, 0.7882353, 1, 1,
0.1250416, 1.004591, -1.544111, 0, 0.7843137, 1, 1,
0.1283758, -2.056152, 1.205245, 0, 0.7764706, 1, 1,
0.1291184, -0.4217772, 3.266778, 0, 0.772549, 1, 1,
0.137253, -0.2082559, 2.036389, 0, 0.7647059, 1, 1,
0.1380409, -1.34822, 3.441936, 0, 0.7607843, 1, 1,
0.1387164, 0.1484598, 0.4034983, 0, 0.7529412, 1, 1,
0.1414365, -0.5412572, 3.171985, 0, 0.7490196, 1, 1,
0.1430779, 1.337912, 0.8486558, 0, 0.7411765, 1, 1,
0.146202, 0.1437198, -0.06955893, 0, 0.7372549, 1, 1,
0.1464841, -0.566358, 2.436586, 0, 0.7294118, 1, 1,
0.1474662, -0.5941814, 3.036707, 0, 0.7254902, 1, 1,
0.1475009, 1.275709, 0.677564, 0, 0.7176471, 1, 1,
0.1493876, 0.05724854, 1.817869, 0, 0.7137255, 1, 1,
0.1512371, -0.3059892, 3.260011, 0, 0.7058824, 1, 1,
0.1538104, -0.6241949, 3.227101, 0, 0.6980392, 1, 1,
0.1604513, 0.008817165, 1.898237, 0, 0.6941177, 1, 1,
0.1612351, 1.321501, 0.257137, 0, 0.6862745, 1, 1,
0.1613904, -0.2921774, 2.014633, 0, 0.682353, 1, 1,
0.1640776, 0.8741562, 1.572807, 0, 0.6745098, 1, 1,
0.170646, -0.3306942, 3.213231, 0, 0.6705883, 1, 1,
0.1710206, 0.2897503, 0.8137087, 0, 0.6627451, 1, 1,
0.1714029, 0.7745411, 1.13258, 0, 0.6588235, 1, 1,
0.1721903, 0.7145392, 0.315296, 0, 0.6509804, 1, 1,
0.172972, -0.6236215, 2.199643, 0, 0.6470588, 1, 1,
0.1810986, -0.001342331, 1.596257, 0, 0.6392157, 1, 1,
0.1813825, 0.408241, 0.2764906, 0, 0.6352941, 1, 1,
0.1891303, -3.038515, 3.732804, 0, 0.627451, 1, 1,
0.1897049, 1.264603, 0.4917445, 0, 0.6235294, 1, 1,
0.1934233, -0.002579547, 1.68798, 0, 0.6156863, 1, 1,
0.1939572, 1.17272, 0.4218374, 0, 0.6117647, 1, 1,
0.1971436, 2.291519, -1.154964, 0, 0.6039216, 1, 1,
0.2045944, -0.1562951, 1.42293, 0, 0.5960785, 1, 1,
0.2048231, 0.1457729, -0.5219463, 0, 0.5921569, 1, 1,
0.2115191, -1.399781, 1.7837, 0, 0.5843138, 1, 1,
0.2125763, 0.4411764, -0.3348995, 0, 0.5803922, 1, 1,
0.2131665, -0.6835117, 3.37395, 0, 0.572549, 1, 1,
0.2168996, 0.2416184, 0.454533, 0, 0.5686275, 1, 1,
0.2186871, 2.219245, 0.7817913, 0, 0.5607843, 1, 1,
0.2190183, -1.451763, 2.73773, 0, 0.5568628, 1, 1,
0.2273149, -0.8269112, 4.205688, 0, 0.5490196, 1, 1,
0.2289365, -0.737651, 3.124982, 0, 0.5450981, 1, 1,
0.2295592, -0.8885289, 4.164844, 0, 0.5372549, 1, 1,
0.2306788, -2.487127, 1.81779, 0, 0.5333334, 1, 1,
0.2309516, -1.862625, 1.092983, 0, 0.5254902, 1, 1,
0.234019, -1.417948, 3.014756, 0, 0.5215687, 1, 1,
0.2366182, -1.186722, 2.748292, 0, 0.5137255, 1, 1,
0.2370173, -0.7826135, 3.378378, 0, 0.509804, 1, 1,
0.2394745, 0.05890315, 3.770805, 0, 0.5019608, 1, 1,
0.2398994, -1.125679, 5.08505, 0, 0.4941176, 1, 1,
0.24414, 1.196927, 0.4656892, 0, 0.4901961, 1, 1,
0.247277, -0.3982778, 3.19183, 0, 0.4823529, 1, 1,
0.2490066, -1.667557, 4.310328, 0, 0.4784314, 1, 1,
0.2501838, -2.375611, 1.800787, 0, 0.4705882, 1, 1,
0.2511649, -1.470697, 4.213341, 0, 0.4666667, 1, 1,
0.2541595, 1.350296, 1.929774, 0, 0.4588235, 1, 1,
0.2554827, -1.069739, 2.852762, 0, 0.454902, 1, 1,
0.2637739, -0.4359716, 3.355936, 0, 0.4470588, 1, 1,
0.2661703, -1.422499, 3.236087, 0, 0.4431373, 1, 1,
0.2697465, 0.4131679, 0.8222623, 0, 0.4352941, 1, 1,
0.2735525, -1.013992, 1.96717, 0, 0.4313726, 1, 1,
0.2753122, 1.517578, 1.27942, 0, 0.4235294, 1, 1,
0.2768574, -0.09647774, 1.891046, 0, 0.4196078, 1, 1,
0.2805363, -0.4172289, 2.884706, 0, 0.4117647, 1, 1,
0.2819807, 0.1080061, 1.963601, 0, 0.4078431, 1, 1,
0.2822635, -0.8228992, 1.44248, 0, 0.4, 1, 1,
0.2842861, -1.991521, 4.59043, 0, 0.3921569, 1, 1,
0.2871143, 0.0332283, 2.112954, 0, 0.3882353, 1, 1,
0.2918837, 1.490892, 1.735413, 0, 0.3803922, 1, 1,
0.2976667, 0.5577116, -1.438582, 0, 0.3764706, 1, 1,
0.2978637, -0.8795141, 1.864136, 0, 0.3686275, 1, 1,
0.3016459, -0.1808377, 0.7999257, 0, 0.3647059, 1, 1,
0.3066407, -0.5264641, 0.7276819, 0, 0.3568628, 1, 1,
0.3076484, -2.563745, 2.956827, 0, 0.3529412, 1, 1,
0.3085629, -1.038698, 3.324328, 0, 0.345098, 1, 1,
0.3102168, 0.9191425, -0.598961, 0, 0.3411765, 1, 1,
0.3122008, -0.397934, 2.490032, 0, 0.3333333, 1, 1,
0.3170249, -0.6572559, 2.480854, 0, 0.3294118, 1, 1,
0.3176389, -1.21811, 3.48282, 0, 0.3215686, 1, 1,
0.3177928, 0.1458731, 1.657354, 0, 0.3176471, 1, 1,
0.3180783, -0.4091363, 2.171131, 0, 0.3098039, 1, 1,
0.3198705, 0.3644688, 0.7370037, 0, 0.3058824, 1, 1,
0.3240412, -0.9837043, 0.3727831, 0, 0.2980392, 1, 1,
0.3362888, 1.666515, -0.08319882, 0, 0.2901961, 1, 1,
0.3387543, -0.02677987, 0.4408752, 0, 0.2862745, 1, 1,
0.342844, -1.241268, 3.951957, 0, 0.2784314, 1, 1,
0.3446776, 0.9061011, 1.489319, 0, 0.2745098, 1, 1,
0.3505547, 0.7519228, -1.19884, 0, 0.2666667, 1, 1,
0.3570994, 1.564895, -1.189378, 0, 0.2627451, 1, 1,
0.3609132, -0.02126396, 2.717849, 0, 0.254902, 1, 1,
0.3613302, 1.051686, 1.370622, 0, 0.2509804, 1, 1,
0.3658247, -0.4800263, 1.529379, 0, 0.2431373, 1, 1,
0.3673923, 0.7979905, -0.4895004, 0, 0.2392157, 1, 1,
0.3684936, 0.3376675, 1.673117, 0, 0.2313726, 1, 1,
0.3697282, -1.450472, 1.129367, 0, 0.227451, 1, 1,
0.3777055, 0.3770871, 0.3117804, 0, 0.2196078, 1, 1,
0.3813675, 1.307128, -0.3448449, 0, 0.2156863, 1, 1,
0.3831071, 0.4975043, 2.114528, 0, 0.2078431, 1, 1,
0.3835189, 1.522559, -1.60101, 0, 0.2039216, 1, 1,
0.3867383, 0.3089545, 0.5671638, 0, 0.1960784, 1, 1,
0.3873137, -1.412409, 3.017577, 0, 0.1882353, 1, 1,
0.3878846, -1.749267, 3.85065, 0, 0.1843137, 1, 1,
0.3911328, 2.106859, -2.058048, 0, 0.1764706, 1, 1,
0.3929412, 0.5987786, 0.09697388, 0, 0.172549, 1, 1,
0.3979256, -0.650387, 3.781926, 0, 0.1647059, 1, 1,
0.3997806, 1.047844, 0.2127373, 0, 0.1607843, 1, 1,
0.4020095, -1.866905, -0.8269044, 0, 0.1529412, 1, 1,
0.4089216, 0.6340546, 0.6598747, 0, 0.1490196, 1, 1,
0.4089217, 0.29003, -0.2221333, 0, 0.1411765, 1, 1,
0.4144572, 0.5805872, 1.624009, 0, 0.1372549, 1, 1,
0.4175325, -0.300579, 1.74245, 0, 0.1294118, 1, 1,
0.4225589, -0.1386734, 2.235553, 0, 0.1254902, 1, 1,
0.4248328, 0.4137765, 0.8762411, 0, 0.1176471, 1, 1,
0.4258575, -1.854758, 2.837718, 0, 0.1137255, 1, 1,
0.4265713, -0.7427553, 2.031692, 0, 0.1058824, 1, 1,
0.4269096, -1.059176, 3.60991, 0, 0.09803922, 1, 1,
0.4307273, -0.8980874, 2.055436, 0, 0.09411765, 1, 1,
0.4323956, -0.7026809, 4.374378, 0, 0.08627451, 1, 1,
0.4354209, 0.6955913, -0.3446442, 0, 0.08235294, 1, 1,
0.4362017, 0.5446649, 1.407508, 0, 0.07450981, 1, 1,
0.4379847, -0.1316611, 1.96125, 0, 0.07058824, 1, 1,
0.4404164, -1.287359, 4.231687, 0, 0.0627451, 1, 1,
0.4411471, 0.4230902, 0.9340616, 0, 0.05882353, 1, 1,
0.4454517, 0.5601327, 0.3523265, 0, 0.05098039, 1, 1,
0.4502591, -2.185762, 3.329738, 0, 0.04705882, 1, 1,
0.4576545, -0.4714766, 2.943135, 0, 0.03921569, 1, 1,
0.4587623, 0.4925483, 1.399275, 0, 0.03529412, 1, 1,
0.4606208, -1.348296, 4.13287, 0, 0.02745098, 1, 1,
0.4616713, -0.08937003, 2.039237, 0, 0.02352941, 1, 1,
0.4657691, -1.2415, 3.455166, 0, 0.01568628, 1, 1,
0.4681096, 1.148501, 1.914941, 0, 0.01176471, 1, 1,
0.4687831, -1.583247, 3.165467, 0, 0.003921569, 1, 1,
0.4752218, -0.562611, 2.161393, 0.003921569, 0, 1, 1,
0.4797941, -1.161612, 3.365384, 0.007843138, 0, 1, 1,
0.4799445, -0.3870845, 2.602011, 0.01568628, 0, 1, 1,
0.4811904, 0.2430617, 2.327175, 0.01960784, 0, 1, 1,
0.489143, 1.157929, -0.190618, 0.02745098, 0, 1, 1,
0.4920816, 0.5173554, -0.4052803, 0.03137255, 0, 1, 1,
0.4951974, -1.202558, 2.924488, 0.03921569, 0, 1, 1,
0.4959936, 0.57127, 1.299179, 0.04313726, 0, 1, 1,
0.497583, -0.5170412, 3.003772, 0.05098039, 0, 1, 1,
0.4991212, -0.3083393, 3.313328, 0.05490196, 0, 1, 1,
0.5031024, 0.2031323, 0.3172389, 0.0627451, 0, 1, 1,
0.5038711, 0.05595429, 2.538041, 0.06666667, 0, 1, 1,
0.503941, 1.829123, -0.1189286, 0.07450981, 0, 1, 1,
0.5058241, 1.116122, 0.1883053, 0.07843138, 0, 1, 1,
0.5071374, -0.4151883, 2.81257, 0.08627451, 0, 1, 1,
0.5072294, -0.2873186, 2.540611, 0.09019608, 0, 1, 1,
0.5112713, -0.05252524, 1.752055, 0.09803922, 0, 1, 1,
0.5176604, -0.2408348, 1.956995, 0.1058824, 0, 1, 1,
0.5206904, 0.3736672, 1.345946, 0.1098039, 0, 1, 1,
0.5212016, -0.1147498, 1.293245, 0.1176471, 0, 1, 1,
0.5231055, -0.3668201, 1.89301, 0.1215686, 0, 1, 1,
0.5238044, -0.1843278, 2.821109, 0.1294118, 0, 1, 1,
0.5266101, -1.336365, 3.24508, 0.1333333, 0, 1, 1,
0.5268098, 0.9145798, 0.6057178, 0.1411765, 0, 1, 1,
0.5298214, 0.2420488, 1.688699, 0.145098, 0, 1, 1,
0.5329193, -0.3915681, 2.674359, 0.1529412, 0, 1, 1,
0.5404192, 0.1351317, 0.4559818, 0.1568628, 0, 1, 1,
0.5406494, 0.820052, 1.65142, 0.1647059, 0, 1, 1,
0.5408875, -0.432616, 3.261339, 0.1686275, 0, 1, 1,
0.5429494, -0.4004745, 2.659461, 0.1764706, 0, 1, 1,
0.5506499, 1.017049, 0.846378, 0.1803922, 0, 1, 1,
0.5527123, 0.02414086, 2.199618, 0.1882353, 0, 1, 1,
0.5607889, 1.759959, -0.3720126, 0.1921569, 0, 1, 1,
0.5687111, 0.3206499, 3.064521, 0.2, 0, 1, 1,
0.5688097, -0.05572766, 2.265681, 0.2078431, 0, 1, 1,
0.5695552, -1.714191, 1.960721, 0.2117647, 0, 1, 1,
0.5725171, -1.175705, 2.703777, 0.2196078, 0, 1, 1,
0.5740764, 1.124466, 1.349287, 0.2235294, 0, 1, 1,
0.5773693, -1.246489, 3.440424, 0.2313726, 0, 1, 1,
0.5786144, 0.4526868, 0.7092675, 0.2352941, 0, 1, 1,
0.5847839, -0.0935206, 2.849494, 0.2431373, 0, 1, 1,
0.5909927, 1.919793, -0.5545394, 0.2470588, 0, 1, 1,
0.59664, -0.3024067, 1.197253, 0.254902, 0, 1, 1,
0.6071188, 0.9381003, -1.513795, 0.2588235, 0, 1, 1,
0.608821, -2.480977, 4.086485, 0.2666667, 0, 1, 1,
0.6110565, 0.5821005, 0.983578, 0.2705882, 0, 1, 1,
0.6194121, -1.724292, 1.458405, 0.2784314, 0, 1, 1,
0.6256223, -0.9049534, 3.921227, 0.282353, 0, 1, 1,
0.6288791, 0.7360491, 0.8730615, 0.2901961, 0, 1, 1,
0.6418712, -0.2292974, 3.116455, 0.2941177, 0, 1, 1,
0.6443737, 0.4365465, 0.02748828, 0.3019608, 0, 1, 1,
0.6480692, -0.1357706, 2.145837, 0.3098039, 0, 1, 1,
0.6545916, 0.01318631, 1.060884, 0.3137255, 0, 1, 1,
0.6547142, -0.6035043, 2.198476, 0.3215686, 0, 1, 1,
0.6574865, -1.057346, 2.965765, 0.3254902, 0, 1, 1,
0.6574996, 1.340422, 0.07086156, 0.3333333, 0, 1, 1,
0.6594639, -0.4309781, 0.3560301, 0.3372549, 0, 1, 1,
0.663842, 0.7441109, 0.3306325, 0.345098, 0, 1, 1,
0.6665339, 2.014238, 0.6930444, 0.3490196, 0, 1, 1,
0.6732331, -1.092429, 3.748782, 0.3568628, 0, 1, 1,
0.6776837, 0.6729726, -1.07228, 0.3607843, 0, 1, 1,
0.6778595, -0.6660699, 2.914444, 0.3686275, 0, 1, 1,
0.6856505, 0.3051013, 1.652193, 0.372549, 0, 1, 1,
0.6874828, -0.7814071, 3.250545, 0.3803922, 0, 1, 1,
0.687637, -0.4058517, 3.004514, 0.3843137, 0, 1, 1,
0.6938196, -0.7652182, 3.250117, 0.3921569, 0, 1, 1,
0.6976681, -1.812269, 4.063707, 0.3960784, 0, 1, 1,
0.6987579, 0.5886388, 0.5561841, 0.4039216, 0, 1, 1,
0.6990349, 0.9949299, 0.3511486, 0.4117647, 0, 1, 1,
0.7000541, -0.1397931, 2.877354, 0.4156863, 0, 1, 1,
0.7047815, -1.922503, 2.992051, 0.4235294, 0, 1, 1,
0.7083254, 1.030661, 1.018059, 0.427451, 0, 1, 1,
0.7115073, -0.0024624, 2.297637, 0.4352941, 0, 1, 1,
0.7152942, -0.2690928, -0.002530857, 0.4392157, 0, 1, 1,
0.7166944, -0.2349432, 2.329695, 0.4470588, 0, 1, 1,
0.7176629, -1.143327, 2.579547, 0.4509804, 0, 1, 1,
0.7206252, -0.2393239, 2.058372, 0.4588235, 0, 1, 1,
0.7222624, -1.08764, 1.78155, 0.4627451, 0, 1, 1,
0.7232234, -0.2420098, 1.150142, 0.4705882, 0, 1, 1,
0.728214, -0.3698468, 2.524341, 0.4745098, 0, 1, 1,
0.7314811, 0.1937645, 1.555495, 0.4823529, 0, 1, 1,
0.7319881, 1.214207, 1.44862, 0.4862745, 0, 1, 1,
0.7334225, -0.4669937, 1.670543, 0.4941176, 0, 1, 1,
0.7341624, -0.8987281, 2.283648, 0.5019608, 0, 1, 1,
0.7421929, -0.6106895, 3.364384, 0.5058824, 0, 1, 1,
0.7431506, -0.2620805, 1.447506, 0.5137255, 0, 1, 1,
0.7449501, -2.160549, 2.916578, 0.5176471, 0, 1, 1,
0.7463105, 1.253371, 0.7647291, 0.5254902, 0, 1, 1,
0.7478319, 0.1571003, 1.278928, 0.5294118, 0, 1, 1,
0.7482306, 1.142033, 1.278354, 0.5372549, 0, 1, 1,
0.7491744, -0.330146, 1.574125, 0.5411765, 0, 1, 1,
0.7512878, 1.926138, -1.449237, 0.5490196, 0, 1, 1,
0.7558152, -0.6117383, 2.834878, 0.5529412, 0, 1, 1,
0.7559134, -2.182609, 3.975329, 0.5607843, 0, 1, 1,
0.7585298, 1.61672, -1.286343, 0.5647059, 0, 1, 1,
0.7593474, -0.3066439, 1.434678, 0.572549, 0, 1, 1,
0.7635242, 0.9664033, 0.3657277, 0.5764706, 0, 1, 1,
0.7651514, -0.8272899, 4.06941, 0.5843138, 0, 1, 1,
0.7655147, -0.3563254, 2.145424, 0.5882353, 0, 1, 1,
0.7664269, -1.020694, 0.8349007, 0.5960785, 0, 1, 1,
0.7691998, 1.051276, 1.058542, 0.6039216, 0, 1, 1,
0.7800915, -2.032351, 2.009261, 0.6078432, 0, 1, 1,
0.7818642, 1.506357, 0.9337088, 0.6156863, 0, 1, 1,
0.7840158, 0.9438746, 1.798104, 0.6196079, 0, 1, 1,
0.7920159, 0.8194535, 0.6599548, 0.627451, 0, 1, 1,
0.7929923, -1.293931, 1.871432, 0.6313726, 0, 1, 1,
0.7932903, -0.5549352, 3.074425, 0.6392157, 0, 1, 1,
0.794299, 0.2446366, 0.7274699, 0.6431373, 0, 1, 1,
0.796187, -0.398369, 2.791263, 0.6509804, 0, 1, 1,
0.7982318, -0.228826, 2.542686, 0.654902, 0, 1, 1,
0.8020669, 0.3601646, 1.764224, 0.6627451, 0, 1, 1,
0.8037504, 0.9052595, 1.680182, 0.6666667, 0, 1, 1,
0.8040747, -0.5596578, 1.490281, 0.6745098, 0, 1, 1,
0.8065309, -0.7667438, 2.121504, 0.6784314, 0, 1, 1,
0.8081385, -2.112643, 3.196088, 0.6862745, 0, 1, 1,
0.8097739, 0.5056649, 0.8071124, 0.6901961, 0, 1, 1,
0.8097839, -0.4793134, 0.76482, 0.6980392, 0, 1, 1,
0.8108813, 0.342119, -0.6210585, 0.7058824, 0, 1, 1,
0.8139129, 0.1163061, 2.531046, 0.7098039, 0, 1, 1,
0.8158172, 0.03689147, 1.465907, 0.7176471, 0, 1, 1,
0.8193315, -0.3713987, 2.54068, 0.7215686, 0, 1, 1,
0.8197021, -0.394826, 2.003722, 0.7294118, 0, 1, 1,
0.8224498, 0.0437468, 2.043275, 0.7333333, 0, 1, 1,
0.8225372, 0.05396442, 2.699204, 0.7411765, 0, 1, 1,
0.826824, 2.200486, -1.245671, 0.7450981, 0, 1, 1,
0.8345371, -0.94933, 2.186704, 0.7529412, 0, 1, 1,
0.8377222, 0.3246037, 1.818769, 0.7568628, 0, 1, 1,
0.839772, 1.022, 0.7527016, 0.7647059, 0, 1, 1,
0.8400453, -0.7678052, 0.6720945, 0.7686275, 0, 1, 1,
0.8426486, -0.5935853, 2.790312, 0.7764706, 0, 1, 1,
0.8457245, 0.2069885, 2.094177, 0.7803922, 0, 1, 1,
0.8463171, -0.2704732, 3.975075, 0.7882353, 0, 1, 1,
0.8475993, -1.297319, 2.468395, 0.7921569, 0, 1, 1,
0.8480337, 0.1172995, 0.3767952, 0.8, 0, 1, 1,
0.8484568, -0.510442, 2.2149, 0.8078431, 0, 1, 1,
0.8517593, 0.4508255, 0.06023766, 0.8117647, 0, 1, 1,
0.8597919, 1.112501, -0.1046162, 0.8196079, 0, 1, 1,
0.8638638, 0.06744397, 2.267555, 0.8235294, 0, 1, 1,
0.864242, -0.1138908, 2.029708, 0.8313726, 0, 1, 1,
0.8718827, 0.4248974, 0.9386681, 0.8352941, 0, 1, 1,
0.8732712, 0.3750789, 0.1894642, 0.8431373, 0, 1, 1,
0.8804744, -0.6325074, 2.819, 0.8470588, 0, 1, 1,
0.8844801, 0.1976087, 2.290622, 0.854902, 0, 1, 1,
0.8913187, -0.1916305, 2.395325, 0.8588235, 0, 1, 1,
0.8960004, 0.1721988, 1.203001, 0.8666667, 0, 1, 1,
0.900805, -0.2036485, 3.292601, 0.8705882, 0, 1, 1,
0.9010831, 1.696986, 0.2678315, 0.8784314, 0, 1, 1,
0.904957, 1.826033, 2.584333, 0.8823529, 0, 1, 1,
0.9096676, 0.5376174, 1.376723, 0.8901961, 0, 1, 1,
0.9136688, 0.8334885, 0.4442281, 0.8941177, 0, 1, 1,
0.9153671, 0.7621838, 0.9808833, 0.9019608, 0, 1, 1,
0.918653, -0.1745631, 1.422058, 0.9098039, 0, 1, 1,
0.9186562, -0.1583505, 0.8426043, 0.9137255, 0, 1, 1,
0.9226822, -1.286087, 1.820882, 0.9215686, 0, 1, 1,
0.9230911, 2.582968, 0.9571798, 0.9254902, 0, 1, 1,
0.9231243, 1.19138, 0.04740901, 0.9333333, 0, 1, 1,
0.9285328, -1.291443, 2.745849, 0.9372549, 0, 1, 1,
0.931933, 1.043952, -0.2317644, 0.945098, 0, 1, 1,
0.9449407, 1.270566, 1.16408, 0.9490196, 0, 1, 1,
0.9459231, 0.5738905, 3.961151, 0.9568627, 0, 1, 1,
0.9463965, -1.394217, 2.574549, 0.9607843, 0, 1, 1,
0.9473808, -0.2719546, 0.5639011, 0.9686275, 0, 1, 1,
0.9503779, -0.7132181, 1.876456, 0.972549, 0, 1, 1,
0.9558374, -0.6630454, 2.003592, 0.9803922, 0, 1, 1,
0.9577514, 0.7570098, 1.003971, 0.9843137, 0, 1, 1,
0.9611921, -1.247255, 3.383937, 0.9921569, 0, 1, 1,
0.9644415, -0.4600825, 0.6395615, 0.9960784, 0, 1, 1,
0.9718252, 0.008659797, 4.892182, 1, 0, 0.9960784, 1,
0.975183, 0.2891036, -1.327901, 1, 0, 0.9882353, 1,
0.9756105, 1.116547, 1.280786, 1, 0, 0.9843137, 1,
0.9910716, 0.2745851, 2.569046, 1, 0, 0.9764706, 1,
1.008023, -1.360858, 2.571185, 1, 0, 0.972549, 1,
1.009379, -0.9067073, 2.163278, 1, 0, 0.9647059, 1,
1.010721, 0.4207812, 1.473452, 1, 0, 0.9607843, 1,
1.016752, -2.122488, 2.475829, 1, 0, 0.9529412, 1,
1.019859, 0.4481939, 0.4797944, 1, 0, 0.9490196, 1,
1.026817, 0.5574045, 1.545432, 1, 0, 0.9411765, 1,
1.031917, 0.4713469, 1.42665, 1, 0, 0.9372549, 1,
1.044935, -0.4721652, 2.592703, 1, 0, 0.9294118, 1,
1.046165, -0.865365, 1.033328, 1, 0, 0.9254902, 1,
1.046701, 1.020609, -0.6007963, 1, 0, 0.9176471, 1,
1.046738, -0.9184681, 1.839841, 1, 0, 0.9137255, 1,
1.049774, 1.4338, 1.354291, 1, 0, 0.9058824, 1,
1.052387, -0.03131687, 1.950669, 1, 0, 0.9019608, 1,
1.057764, 1.436623, -0.3163133, 1, 0, 0.8941177, 1,
1.06049, 0.6963938, 2.909407, 1, 0, 0.8862745, 1,
1.063217, -0.03391974, 0.7705576, 1, 0, 0.8823529, 1,
1.064355, 0.2326267, 3.326805, 1, 0, 0.8745098, 1,
1.071133, -0.2024613, 1.581008, 1, 0, 0.8705882, 1,
1.074314, -0.7873772, 1.461677, 1, 0, 0.8627451, 1,
1.079919, -1.102803, 2.060532, 1, 0, 0.8588235, 1,
1.08426, -0.7822984, 1.181038, 1, 0, 0.8509804, 1,
1.089234, -0.1482731, 1.09888, 1, 0, 0.8470588, 1,
1.096317, -1.329121, 1.265131, 1, 0, 0.8392157, 1,
1.098171, -0.1860592, 1.233733, 1, 0, 0.8352941, 1,
1.10035, 1.848208, 0.5946353, 1, 0, 0.827451, 1,
1.108158, 0.169441, 2.350196, 1, 0, 0.8235294, 1,
1.110911, 1.666481, 0.5266616, 1, 0, 0.8156863, 1,
1.11617, 1.394175, 1.737601, 1, 0, 0.8117647, 1,
1.118192, 0.9144425, 1.253612, 1, 0, 0.8039216, 1,
1.120441, 1.973405, -0.8553538, 1, 0, 0.7960784, 1,
1.122408, 1.008128, 1.113867, 1, 0, 0.7921569, 1,
1.135247, -0.2756811, 2.201619, 1, 0, 0.7843137, 1,
1.136775, -0.7691056, 0.180676, 1, 0, 0.7803922, 1,
1.137425, -1.106717, 2.304878, 1, 0, 0.772549, 1,
1.139052, 1.489898, -0.4987468, 1, 0, 0.7686275, 1,
1.146014, -0.5635297, 1.609597, 1, 0, 0.7607843, 1,
1.152984, -1.022207, 1.698537, 1, 0, 0.7568628, 1,
1.154452, 1.47316, 1.538652, 1, 0, 0.7490196, 1,
1.156541, -0.3831845, 3.535047, 1, 0, 0.7450981, 1,
1.158347, -0.101486, 1.721593, 1, 0, 0.7372549, 1,
1.161985, 0.8319643, 0.3464655, 1, 0, 0.7333333, 1,
1.162212, -0.5318114, 1.933825, 1, 0, 0.7254902, 1,
1.164949, -0.3493154, 2.209432, 1, 0, 0.7215686, 1,
1.1657, -0.01770345, 1.006471, 1, 0, 0.7137255, 1,
1.166524, -0.1521948, 2.472959, 1, 0, 0.7098039, 1,
1.175737, 0.3611801, 2.132308, 1, 0, 0.7019608, 1,
1.181561, 1.281301, 3.744108, 1, 0, 0.6941177, 1,
1.181716, -0.9753506, 1.289142, 1, 0, 0.6901961, 1,
1.182745, 0.2003822, 1.556559, 1, 0, 0.682353, 1,
1.184486, -1.286263, 3.581363, 1, 0, 0.6784314, 1,
1.1884, 1.437952, 1.553208, 1, 0, 0.6705883, 1,
1.201469, -0.6863521, 0.1298269, 1, 0, 0.6666667, 1,
1.20303, 0.1894732, 0.4839793, 1, 0, 0.6588235, 1,
1.204938, 0.9520233, 1.251699, 1, 0, 0.654902, 1,
1.206642, 0.6712652, 1.148783, 1, 0, 0.6470588, 1,
1.209002, 1.599298, 2.631617, 1, 0, 0.6431373, 1,
1.210615, -0.5833162, 2.441588, 1, 0, 0.6352941, 1,
1.212889, 0.2030587, 1.236551, 1, 0, 0.6313726, 1,
1.213341, -0.7234162, 1.430941, 1, 0, 0.6235294, 1,
1.216525, 1.392639, 0.4364698, 1, 0, 0.6196079, 1,
1.217794, 2.299514, 0.291183, 1, 0, 0.6117647, 1,
1.245314, -1.070994, 3.312268, 1, 0, 0.6078432, 1,
1.246027, -0.4659052, 2.009867, 1, 0, 0.6, 1,
1.252232, -0.5054168, 4.092013, 1, 0, 0.5921569, 1,
1.253496, 1.349371, 0.2439429, 1, 0, 0.5882353, 1,
1.25549, 1.232664, 2.728607, 1, 0, 0.5803922, 1,
1.255966, -0.9865687, 1.968251, 1, 0, 0.5764706, 1,
1.265679, -0.4926813, 1.340137, 1, 0, 0.5686275, 1,
1.268459, 1.561299, 2.22364, 1, 0, 0.5647059, 1,
1.270899, -0.02763933, 1.003272, 1, 0, 0.5568628, 1,
1.273299, 0.6589577, -0.5514843, 1, 0, 0.5529412, 1,
1.30295, 0.5166699, 1.259239, 1, 0, 0.5450981, 1,
1.303173, -0.9522405, 3.59102, 1, 0, 0.5411765, 1,
1.332026, 0.07155019, 2.0762, 1, 0, 0.5333334, 1,
1.335036, -0.7055941, 1.370247, 1, 0, 0.5294118, 1,
1.343583, 0.1677964, 1.074836, 1, 0, 0.5215687, 1,
1.344902, -0.1366656, 1.686959, 1, 0, 0.5176471, 1,
1.347551, 0.9790542, 1.246807, 1, 0, 0.509804, 1,
1.349916, -0.1928048, 2.424462, 1, 0, 0.5058824, 1,
1.358401, 0.3265152, 0.167419, 1, 0, 0.4980392, 1,
1.359173, -0.7243579, 2.420682, 1, 0, 0.4901961, 1,
1.371741, -0.7569192, 1.64156, 1, 0, 0.4862745, 1,
1.373118, 0.3444078, 3.828279, 1, 0, 0.4784314, 1,
1.377575, 1.088946, 2.614951, 1, 0, 0.4745098, 1,
1.380157, -0.1694208, -0.3771717, 1, 0, 0.4666667, 1,
1.380301, 0.06175661, 2.228242, 1, 0, 0.4627451, 1,
1.401902, -1.554319, 2.930813, 1, 0, 0.454902, 1,
1.417983, -0.7472464, 1.529412, 1, 0, 0.4509804, 1,
1.427923, -1.65148, 4.400224, 1, 0, 0.4431373, 1,
1.431126, -0.3188826, 2.169569, 1, 0, 0.4392157, 1,
1.432827, 0.2981065, 2.542393, 1, 0, 0.4313726, 1,
1.435938, -2.590639, 2.754479, 1, 0, 0.427451, 1,
1.438052, -2.885823, 3.149181, 1, 0, 0.4196078, 1,
1.464153, -1.440568, 1.630709, 1, 0, 0.4156863, 1,
1.471691, -1.460884, 1.11026, 1, 0, 0.4078431, 1,
1.485652, 0.1256994, 1.344601, 1, 0, 0.4039216, 1,
1.495464, -0.04349975, 0.8817618, 1, 0, 0.3960784, 1,
1.509876, -3.025165, 2.881678, 1, 0, 0.3882353, 1,
1.523751, 0.7145948, 1.254802, 1, 0, 0.3843137, 1,
1.524959, 1.906065, 0.8940697, 1, 0, 0.3764706, 1,
1.532136, -0.497858, 2.584722, 1, 0, 0.372549, 1,
1.543052, 1.203732, 0.9775116, 1, 0, 0.3647059, 1,
1.545812, -0.2306821, 1.168544, 1, 0, 0.3607843, 1,
1.558632, -0.2414553, 1.83796, 1, 0, 0.3529412, 1,
1.561216, -0.7713957, 1.577757, 1, 0, 0.3490196, 1,
1.605935, -0.5144526, 1.900926, 1, 0, 0.3411765, 1,
1.635607, -0.5047453, 0.3879823, 1, 0, 0.3372549, 1,
1.642438, -0.8510061, 1.550523, 1, 0, 0.3294118, 1,
1.647261, 1.512277, 1.408277, 1, 0, 0.3254902, 1,
1.657993, -0.4278884, 0.5667112, 1, 0, 0.3176471, 1,
1.703827, -0.4513676, 3.358469, 1, 0, 0.3137255, 1,
1.720841, 0.02005249, 1.038774, 1, 0, 0.3058824, 1,
1.721091, -0.08198863, 1.584914, 1, 0, 0.2980392, 1,
1.72897, 0.925304, 1.250445, 1, 0, 0.2941177, 1,
1.741347, 1.15003, 1.404543, 1, 0, 0.2862745, 1,
1.743383, 1.344642, 1.606619, 1, 0, 0.282353, 1,
1.756473, -1.161022, 2.366717, 1, 0, 0.2745098, 1,
1.770472, 0.8436849, 0.1327289, 1, 0, 0.2705882, 1,
1.790081, 1.755183, 1.69223, 1, 0, 0.2627451, 1,
1.791137, -1.262818, 0.7632878, 1, 0, 0.2588235, 1,
1.795469, 2.352626, 0.7878684, 1, 0, 0.2509804, 1,
1.795908, 2.815488, -0.1020038, 1, 0, 0.2470588, 1,
1.803115, -1.453829, 2.096421, 1, 0, 0.2392157, 1,
1.864968, 0.3344173, -0.4238431, 1, 0, 0.2352941, 1,
1.895711, 0.02184978, 2.617962, 1, 0, 0.227451, 1,
1.928918, -1.25709, -0.3874062, 1, 0, 0.2235294, 1,
1.941486, -1.499596, 3.27649, 1, 0, 0.2156863, 1,
1.944188, -0.8915859, 2.923091, 1, 0, 0.2117647, 1,
1.958322, -0.1028592, 1.580801, 1, 0, 0.2039216, 1,
1.958731, -0.69577, -0.1845779, 1, 0, 0.1960784, 1,
1.959001, 0.9145427, 1.90932, 1, 0, 0.1921569, 1,
1.962028, -0.5842202, 2.144346, 1, 0, 0.1843137, 1,
1.962397, 1.248814, 1.043998, 1, 0, 0.1803922, 1,
1.963397, 0.4829721, 0.7132802, 1, 0, 0.172549, 1,
1.966678, 0.3927842, 1.967012, 1, 0, 0.1686275, 1,
1.967634, -0.7518679, 1.808901, 1, 0, 0.1607843, 1,
1.968422, -0.6600149, 1.300974, 1, 0, 0.1568628, 1,
1.994936, 0.6658889, 2.1263, 1, 0, 0.1490196, 1,
1.998518, 0.01316232, 1.703169, 1, 0, 0.145098, 1,
2.002131, 0.2792003, 1.259259, 1, 0, 0.1372549, 1,
2.047152, -0.5849317, 1.875425, 1, 0, 0.1333333, 1,
2.063322, -0.3687825, 0.4959197, 1, 0, 0.1254902, 1,
2.070564, -2.20864, 3.6429, 1, 0, 0.1215686, 1,
2.075135, -0.5197225, 1.774398, 1, 0, 0.1137255, 1,
2.096823, 2.17537, 0.6600891, 1, 0, 0.1098039, 1,
2.110564, 0.3929418, 1.109307, 1, 0, 0.1019608, 1,
2.173659, 0.4056569, 0.7030376, 1, 0, 0.09411765, 1,
2.194699, -0.330339, 2.229358, 1, 0, 0.09019608, 1,
2.26964, -0.2625507, 1.112733, 1, 0, 0.08235294, 1,
2.269893, -0.7440953, 2.430563, 1, 0, 0.07843138, 1,
2.292532, -0.8636592, 0.5142484, 1, 0, 0.07058824, 1,
2.300259, -0.4936748, 2.703863, 1, 0, 0.06666667, 1,
2.462309, 0.5874518, 1.140713, 1, 0, 0.05882353, 1,
2.476455, -0.3309635, 2.264624, 1, 0, 0.05490196, 1,
2.526913, 2.131324, 0.5207956, 1, 0, 0.04705882, 1,
2.536176, 0.3152642, 1.515267, 1, 0, 0.04313726, 1,
2.667907, -0.3494118, 1.405311, 1, 0, 0.03529412, 1,
2.765062, 0.05529066, 0.6847932, 1, 0, 0.03137255, 1,
2.848658, -0.1267639, 1.592027, 1, 0, 0.02352941, 1,
2.900303, 0.3335501, 0.5799221, 1, 0, 0.01960784, 1,
3.270617, -0.2448183, 1.209439, 1, 0, 0.01176471, 1,
3.462379, 0.03607334, 0.6659153, 1, 0, 0.007843138, 1
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
0.1910111, -4.162982, -6.771619, 0, -0.5, 0.5, 0.5,
0.1910111, -4.162982, -6.771619, 1, -0.5, 0.5, 0.5,
0.1910111, -4.162982, -6.771619, 1, 1.5, 0.5, 0.5,
0.1910111, -4.162982, -6.771619, 0, 1.5, 0.5, 0.5
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
-4.189351, -0.08407128, -6.771619, 0, -0.5, 0.5, 0.5,
-4.189351, -0.08407128, -6.771619, 1, -0.5, 0.5, 0.5,
-4.189351, -0.08407128, -6.771619, 1, 1.5, 0.5, 0.5,
-4.189351, -0.08407128, -6.771619, 0, 1.5, 0.5, 0.5
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
-4.189351, -4.162982, 0.01593089, 0, -0.5, 0.5, 0.5,
-4.189351, -4.162982, 0.01593089, 1, -0.5, 0.5, 0.5,
-4.189351, -4.162982, 0.01593089, 1, 1.5, 0.5, 0.5,
-4.189351, -4.162982, 0.01593089, 0, 1.5, 0.5, 0.5
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
-3, -3.221694, -5.205261,
3, -3.221694, -5.205261,
-3, -3.221694, -5.205261,
-3, -3.378576, -5.466321,
-2, -3.221694, -5.205261,
-2, -3.378576, -5.466321,
-1, -3.221694, -5.205261,
-1, -3.378576, -5.466321,
0, -3.221694, -5.205261,
0, -3.378576, -5.466321,
1, -3.221694, -5.205261,
1, -3.378576, -5.466321,
2, -3.221694, -5.205261,
2, -3.378576, -5.466321,
3, -3.221694, -5.205261,
3, -3.378576, -5.466321
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
-3, -3.692338, -5.98844, 0, -0.5, 0.5, 0.5,
-3, -3.692338, -5.98844, 1, -0.5, 0.5, 0.5,
-3, -3.692338, -5.98844, 1, 1.5, 0.5, 0.5,
-3, -3.692338, -5.98844, 0, 1.5, 0.5, 0.5,
-2, -3.692338, -5.98844, 0, -0.5, 0.5, 0.5,
-2, -3.692338, -5.98844, 1, -0.5, 0.5, 0.5,
-2, -3.692338, -5.98844, 1, 1.5, 0.5, 0.5,
-2, -3.692338, -5.98844, 0, 1.5, 0.5, 0.5,
-1, -3.692338, -5.98844, 0, -0.5, 0.5, 0.5,
-1, -3.692338, -5.98844, 1, -0.5, 0.5, 0.5,
-1, -3.692338, -5.98844, 1, 1.5, 0.5, 0.5,
-1, -3.692338, -5.98844, 0, 1.5, 0.5, 0.5,
0, -3.692338, -5.98844, 0, -0.5, 0.5, 0.5,
0, -3.692338, -5.98844, 1, -0.5, 0.5, 0.5,
0, -3.692338, -5.98844, 1, 1.5, 0.5, 0.5,
0, -3.692338, -5.98844, 0, 1.5, 0.5, 0.5,
1, -3.692338, -5.98844, 0, -0.5, 0.5, 0.5,
1, -3.692338, -5.98844, 1, -0.5, 0.5, 0.5,
1, -3.692338, -5.98844, 1, 1.5, 0.5, 0.5,
1, -3.692338, -5.98844, 0, 1.5, 0.5, 0.5,
2, -3.692338, -5.98844, 0, -0.5, 0.5, 0.5,
2, -3.692338, -5.98844, 1, -0.5, 0.5, 0.5,
2, -3.692338, -5.98844, 1, 1.5, 0.5, 0.5,
2, -3.692338, -5.98844, 0, 1.5, 0.5, 0.5,
3, -3.692338, -5.98844, 0, -0.5, 0.5, 0.5,
3, -3.692338, -5.98844, 1, -0.5, 0.5, 0.5,
3, -3.692338, -5.98844, 1, 1.5, 0.5, 0.5,
3, -3.692338, -5.98844, 0, 1.5, 0.5, 0.5
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
-3.178498, -3, -5.205261,
-3.178498, 2, -5.205261,
-3.178498, -3, -5.205261,
-3.346973, -3, -5.466321,
-3.178498, -2, -5.205261,
-3.346973, -2, -5.466321,
-3.178498, -1, -5.205261,
-3.346973, -1, -5.466321,
-3.178498, 0, -5.205261,
-3.346973, 0, -5.466321,
-3.178498, 1, -5.205261,
-3.346973, 1, -5.466321,
-3.178498, 2, -5.205261,
-3.346973, 2, -5.466321
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
-3.683924, -3, -5.98844, 0, -0.5, 0.5, 0.5,
-3.683924, -3, -5.98844, 1, -0.5, 0.5, 0.5,
-3.683924, -3, -5.98844, 1, 1.5, 0.5, 0.5,
-3.683924, -3, -5.98844, 0, 1.5, 0.5, 0.5,
-3.683924, -2, -5.98844, 0, -0.5, 0.5, 0.5,
-3.683924, -2, -5.98844, 1, -0.5, 0.5, 0.5,
-3.683924, -2, -5.98844, 1, 1.5, 0.5, 0.5,
-3.683924, -2, -5.98844, 0, 1.5, 0.5, 0.5,
-3.683924, -1, -5.98844, 0, -0.5, 0.5, 0.5,
-3.683924, -1, -5.98844, 1, -0.5, 0.5, 0.5,
-3.683924, -1, -5.98844, 1, 1.5, 0.5, 0.5,
-3.683924, -1, -5.98844, 0, 1.5, 0.5, 0.5,
-3.683924, 0, -5.98844, 0, -0.5, 0.5, 0.5,
-3.683924, 0, -5.98844, 1, -0.5, 0.5, 0.5,
-3.683924, 0, -5.98844, 1, 1.5, 0.5, 0.5,
-3.683924, 0, -5.98844, 0, 1.5, 0.5, 0.5,
-3.683924, 1, -5.98844, 0, -0.5, 0.5, 0.5,
-3.683924, 1, -5.98844, 1, -0.5, 0.5, 0.5,
-3.683924, 1, -5.98844, 1, 1.5, 0.5, 0.5,
-3.683924, 1, -5.98844, 0, 1.5, 0.5, 0.5,
-3.683924, 2, -5.98844, 0, -0.5, 0.5, 0.5,
-3.683924, 2, -5.98844, 1, -0.5, 0.5, 0.5,
-3.683924, 2, -5.98844, 1, 1.5, 0.5, 0.5,
-3.683924, 2, -5.98844, 0, 1.5, 0.5, 0.5
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
-3.178498, -3.221694, -4,
-3.178498, -3.221694, 4,
-3.178498, -3.221694, -4,
-3.346973, -3.378576, -4,
-3.178498, -3.221694, -2,
-3.346973, -3.378576, -2,
-3.178498, -3.221694, 0,
-3.346973, -3.378576, 0,
-3.178498, -3.221694, 2,
-3.346973, -3.378576, 2,
-3.178498, -3.221694, 4,
-3.346973, -3.378576, 4
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
-3.683924, -3.692338, -4, 0, -0.5, 0.5, 0.5,
-3.683924, -3.692338, -4, 1, -0.5, 0.5, 0.5,
-3.683924, -3.692338, -4, 1, 1.5, 0.5, 0.5,
-3.683924, -3.692338, -4, 0, 1.5, 0.5, 0.5,
-3.683924, -3.692338, -2, 0, -0.5, 0.5, 0.5,
-3.683924, -3.692338, -2, 1, -0.5, 0.5, 0.5,
-3.683924, -3.692338, -2, 1, 1.5, 0.5, 0.5,
-3.683924, -3.692338, -2, 0, 1.5, 0.5, 0.5,
-3.683924, -3.692338, 0, 0, -0.5, 0.5, 0.5,
-3.683924, -3.692338, 0, 1, -0.5, 0.5, 0.5,
-3.683924, -3.692338, 0, 1, 1.5, 0.5, 0.5,
-3.683924, -3.692338, 0, 0, 1.5, 0.5, 0.5,
-3.683924, -3.692338, 2, 0, -0.5, 0.5, 0.5,
-3.683924, -3.692338, 2, 1, -0.5, 0.5, 0.5,
-3.683924, -3.692338, 2, 1, 1.5, 0.5, 0.5,
-3.683924, -3.692338, 2, 0, 1.5, 0.5, 0.5,
-3.683924, -3.692338, 4, 0, -0.5, 0.5, 0.5,
-3.683924, -3.692338, 4, 1, -0.5, 0.5, 0.5,
-3.683924, -3.692338, 4, 1, 1.5, 0.5, 0.5,
-3.683924, -3.692338, 4, 0, 1.5, 0.5, 0.5
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
-3.178498, -3.221694, -5.205261,
-3.178498, 3.053552, -5.205261,
-3.178498, -3.221694, 5.237123,
-3.178498, 3.053552, 5.237123,
-3.178498, -3.221694, -5.205261,
-3.178498, -3.221694, 5.237123,
-3.178498, 3.053552, -5.205261,
-3.178498, 3.053552, 5.237123,
-3.178498, -3.221694, -5.205261,
3.56052, -3.221694, -5.205261,
-3.178498, -3.221694, 5.237123,
3.56052, -3.221694, 5.237123,
-3.178498, 3.053552, -5.205261,
3.56052, 3.053552, -5.205261,
-3.178498, 3.053552, 5.237123,
3.56052, 3.053552, 5.237123,
3.56052, -3.221694, -5.205261,
3.56052, 3.053552, -5.205261,
3.56052, -3.221694, 5.237123,
3.56052, 3.053552, 5.237123,
3.56052, -3.221694, -5.205261,
3.56052, -3.221694, 5.237123,
3.56052, 3.053552, -5.205261,
3.56052, 3.053552, 5.237123
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
var radius = 7.434354;
var distance = 33.07628;
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
mvMatrix.translate( -0.1910111, 0.08407128, -0.01593089 );
mvMatrix.scale( 1.19278, 1.280933, 0.7697637 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.07628);
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
daminozide<-read.table("daminozide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-daminozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'daminozide' not found
```

```r
y<-daminozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'daminozide' not found
```

```r
z<-daminozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'daminozide' not found
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
-3.080357, 0.7803817, -2.03453, 0, 0, 1, 1, 1,
-3.064017, -0.01248422, -0.3674994, 1, 0, 0, 1, 1,
-2.635819, 1.529194, -2.260907, 1, 0, 0, 1, 1,
-2.621676, -1.319191, -1.155092, 1, 0, 0, 1, 1,
-2.609205, 2.489541, -1.440748, 1, 0, 0, 1, 1,
-2.604922, -0.1331232, -1.200262, 1, 0, 0, 1, 1,
-2.594792, 0.3499751, -0.1428117, 0, 0, 0, 1, 1,
-2.503033, 0.3376451, -1.358585, 0, 0, 0, 1, 1,
-2.490067, -0.6848918, -2.287675, 0, 0, 0, 1, 1,
-2.463922, 0.985208, -2.62445, 0, 0, 0, 1, 1,
-2.420791, 0.6441384, -1.60946, 0, 0, 0, 1, 1,
-2.37111, -0.2420898, -1.906791, 0, 0, 0, 1, 1,
-2.270621, 0.8129215, -0.3153617, 0, 0, 0, 1, 1,
-2.267861, 1.814722, -0.5169091, 1, 1, 1, 1, 1,
-2.170542, -0.2378116, -2.646222, 1, 1, 1, 1, 1,
-2.143461, 0.5877554, -3.116176, 1, 1, 1, 1, 1,
-2.118145, -0.04167508, -2.198051, 1, 1, 1, 1, 1,
-2.090075, 0.8262327, -0.9479527, 1, 1, 1, 1, 1,
-2.080218, -1.248419, -4.103167, 1, 1, 1, 1, 1,
-2.056035, 0.4631259, 0.3372068, 1, 1, 1, 1, 1,
-2.050863, 0.1168525, -1.933975, 1, 1, 1, 1, 1,
-2.049615, -0.1663413, -2.733003, 1, 1, 1, 1, 1,
-2.030623, -0.2003976, -1.799623, 1, 1, 1, 1, 1,
-2.003322, 0.4203353, -1.318818, 1, 1, 1, 1, 1,
-1.997467, 0.6221425, -2.158502, 1, 1, 1, 1, 1,
-1.981508, -0.3883045, -3.867457, 1, 1, 1, 1, 1,
-1.968114, 0.5589004, -0.862817, 1, 1, 1, 1, 1,
-1.958002, -0.5307596, -1.655522, 1, 1, 1, 1, 1,
-1.866231, -1.115297, -1.112523, 0, 0, 1, 1, 1,
-1.85902, 0.2066811, -0.8238317, 1, 0, 0, 1, 1,
-1.845919, -1.185445, -1.892479, 1, 0, 0, 1, 1,
-1.826181, 0.4520297, -1.162974, 1, 0, 0, 1, 1,
-1.820048, 0.2253918, -1.912864, 1, 0, 0, 1, 1,
-1.818318, -0.8629167, -3.687447, 1, 0, 0, 1, 1,
-1.807782, 0.5007362, -2.216217, 0, 0, 0, 1, 1,
-1.806054, 2.606004, 0.4303339, 0, 0, 0, 1, 1,
-1.799842, 0.7590435, -1.893567, 0, 0, 0, 1, 1,
-1.773567, 1.299048, -2.215958, 0, 0, 0, 1, 1,
-1.762094, 0.6258969, -0.4883125, 0, 0, 0, 1, 1,
-1.745906, 0.2276116, -0.5327123, 0, 0, 0, 1, 1,
-1.714115, 0.3179599, 0.4897866, 0, 0, 0, 1, 1,
-1.698649, 0.7988495, -0.4438165, 1, 1, 1, 1, 1,
-1.672053, -0.8403825, -2.390229, 1, 1, 1, 1, 1,
-1.644417, 1.661557, 0.03673485, 1, 1, 1, 1, 1,
-1.637965, 0.5630369, -1.212257, 1, 1, 1, 1, 1,
-1.637799, 0.3207414, -2.013756, 1, 1, 1, 1, 1,
-1.636458, -0.3525595, 0.114237, 1, 1, 1, 1, 1,
-1.618979, -0.1799634, -1.549554, 1, 1, 1, 1, 1,
-1.613276, 0.9888746, -2.417483, 1, 1, 1, 1, 1,
-1.609822, 0.0642247, -1.61129, 1, 1, 1, 1, 1,
-1.606931, -0.1083458, -1.598891, 1, 1, 1, 1, 1,
-1.601026, 0.5258592, -0.7751986, 1, 1, 1, 1, 1,
-1.59263, -1.329319, -2.179653, 1, 1, 1, 1, 1,
-1.581445, 0.706066, -0.9731406, 1, 1, 1, 1, 1,
-1.580238, -0.9817629, -2.366708, 1, 1, 1, 1, 1,
-1.575912, -0.4048812, -1.233024, 1, 1, 1, 1, 1,
-1.572449, 0.3584651, -2.631274, 0, 0, 1, 1, 1,
-1.550534, -0.1860147, -1.393958, 1, 0, 0, 1, 1,
-1.545726, -1.058622, -2.740234, 1, 0, 0, 1, 1,
-1.545096, 0.436039, -1.985952, 1, 0, 0, 1, 1,
-1.53812, 1.295766, -0.8779664, 1, 0, 0, 1, 1,
-1.534463, 0.1747425, 0.06632122, 1, 0, 0, 1, 1,
-1.528762, 2.007464, -0.6797204, 0, 0, 0, 1, 1,
-1.525178, -2.971981, -2.419503, 0, 0, 0, 1, 1,
-1.521016, -1.955488, -1.600018, 0, 0, 0, 1, 1,
-1.519056, 1.1565, -0.08111781, 0, 0, 0, 1, 1,
-1.509849, -0.4252076, -2.462445, 0, 0, 0, 1, 1,
-1.502396, -2.808154, -3.73832, 0, 0, 0, 1, 1,
-1.501145, -0.8258935, -0.2514141, 0, 0, 0, 1, 1,
-1.49776, -0.2491046, -0.3758349, 1, 1, 1, 1, 1,
-1.481479, 1.040568, -1.01157, 1, 1, 1, 1, 1,
-1.478933, 0.06155132, -1.973246, 1, 1, 1, 1, 1,
-1.470838, -1.063818, -2.921094, 1, 1, 1, 1, 1,
-1.458394, 0.5377768, -0.5351015, 1, 1, 1, 1, 1,
-1.455215, 1.257209, 0.6653543, 1, 1, 1, 1, 1,
-1.453964, 0.4247306, -3.507921, 1, 1, 1, 1, 1,
-1.451173, 0.296352, -2.395344, 1, 1, 1, 1, 1,
-1.450964, -2.177164, -3.296465, 1, 1, 1, 1, 1,
-1.4483, 2.467346, -0.4464265, 1, 1, 1, 1, 1,
-1.447069, 0.5446497, -0.282841, 1, 1, 1, 1, 1,
-1.444357, -0.5348344, -1.3279, 1, 1, 1, 1, 1,
-1.430278, 1.718592, 1.810905, 1, 1, 1, 1, 1,
-1.428172, 0.1459061, -1.914532, 1, 1, 1, 1, 1,
-1.420333, -0.2635368, -1.163118, 1, 1, 1, 1, 1,
-1.419837, 0.04076606, -1.550973, 0, 0, 1, 1, 1,
-1.416476, 0.5911509, -0.4830385, 1, 0, 0, 1, 1,
-1.408242, -0.2010775, -1.811709, 1, 0, 0, 1, 1,
-1.407467, 1.169429, -0.6751508, 1, 0, 0, 1, 1,
-1.405828, 0.4144741, -0.1360286, 1, 0, 0, 1, 1,
-1.399627, -0.9358191, -0.9879812, 1, 0, 0, 1, 1,
-1.378903, 1.652703, -1.848983, 0, 0, 0, 1, 1,
-1.350523, -0.2949474, -1.137628, 0, 0, 0, 1, 1,
-1.342485, 0.03633211, -1.185859, 0, 0, 0, 1, 1,
-1.334891, -1.357906, -4.008327, 0, 0, 0, 1, 1,
-1.333822, 1.420007, -2.212667, 0, 0, 0, 1, 1,
-1.328439, 1.902219, -1.678179, 0, 0, 0, 1, 1,
-1.317973, 0.9272726, -1.233806, 0, 0, 0, 1, 1,
-1.313724, -2.20525, -0.8972703, 1, 1, 1, 1, 1,
-1.29884, -0.4432845, -1.857867, 1, 1, 1, 1, 1,
-1.281088, -0.8267184, -3.383445, 1, 1, 1, 1, 1,
-1.276518, -1.256429, -1.674063, 1, 1, 1, 1, 1,
-1.272764, 1.98861, -2.089937, 1, 1, 1, 1, 1,
-1.272488, 1.337966, 0.5294009, 1, 1, 1, 1, 1,
-1.268354, 1.871843, -0.4642263, 1, 1, 1, 1, 1,
-1.267934, -0.2077456, -2.607666, 1, 1, 1, 1, 1,
-1.258055, 0.9561375, -0.5115454, 1, 1, 1, 1, 1,
-1.250986, -1.153176, -2.397464, 1, 1, 1, 1, 1,
-1.243908, 0.8257813, -3.697133, 1, 1, 1, 1, 1,
-1.241925, 1.131063, 0.1254319, 1, 1, 1, 1, 1,
-1.230074, 0.4062169, -1.921367, 1, 1, 1, 1, 1,
-1.228406, 0.9802704, -0.4791376, 1, 1, 1, 1, 1,
-1.223041, -0.2926346, -2.239674, 1, 1, 1, 1, 1,
-1.218587, 1.243306, 0.04562884, 0, 0, 1, 1, 1,
-1.217088, -0.3014711, -1.941106, 1, 0, 0, 1, 1,
-1.199856, 0.3028016, -1.412233, 1, 0, 0, 1, 1,
-1.185397, 1.439506, -1.542872, 1, 0, 0, 1, 1,
-1.179084, -0.2495369, -0.8280185, 1, 0, 0, 1, 1,
-1.169564, -0.156438, -1.168414, 1, 0, 0, 1, 1,
-1.167181, -0.5992581, -0.4866627, 0, 0, 0, 1, 1,
-1.16197, -1.947517, -2.581295, 0, 0, 0, 1, 1,
-1.156703, -0.1058594, -1.946722, 0, 0, 0, 1, 1,
-1.152639, -2.746524, -2.523839, 0, 0, 0, 1, 1,
-1.148423, -1.420121, -2.225773, 0, 0, 0, 1, 1,
-1.148275, -0.5617216, -5.053188, 0, 0, 0, 1, 1,
-1.146382, 1.700789, -1.752612, 0, 0, 0, 1, 1,
-1.138045, -0.8265832, -3.867601, 1, 1, 1, 1, 1,
-1.136386, 0.06010302, -0.5078211, 1, 1, 1, 1, 1,
-1.13403, -1.782119, -2.107238, 1, 1, 1, 1, 1,
-1.128179, 1.113914, -0.6217457, 1, 1, 1, 1, 1,
-1.127435, 1.728845, -0.3597847, 1, 1, 1, 1, 1,
-1.123424, -1.165924, -1.500312, 1, 1, 1, 1, 1,
-1.111097, -0.9421172, -1.740035, 1, 1, 1, 1, 1,
-1.108033, -0.03281833, -1.576624, 1, 1, 1, 1, 1,
-1.102304, 0.1046021, -0.1463053, 1, 1, 1, 1, 1,
-1.100353, 1.792094, 0.1929395, 1, 1, 1, 1, 1,
-1.090647, 0.2191036, -1.332077, 1, 1, 1, 1, 1,
-1.085327, -1.411972, -3.22662, 1, 1, 1, 1, 1,
-1.081387, -1.129073, -2.081813, 1, 1, 1, 1, 1,
-1.080616, 0.6925509, -1.021409, 1, 1, 1, 1, 1,
-1.077766, -0.404304, -0.3797916, 1, 1, 1, 1, 1,
-1.066656, -1.655726, -2.524009, 0, 0, 1, 1, 1,
-1.060727, 0.8455407, -0.482112, 1, 0, 0, 1, 1,
-1.049313, -1.915501, -3.012431, 1, 0, 0, 1, 1,
-1.046612, -1.290368, -2.790843, 1, 0, 0, 1, 1,
-1.044482, -0.6947181, -3.905421, 1, 0, 0, 1, 1,
-1.043291, -1.585433, -1.778262, 1, 0, 0, 1, 1,
-1.026973, -0.7331505, -0.7725497, 0, 0, 0, 1, 1,
-1.02356, 0.9933334, -0.1216089, 0, 0, 0, 1, 1,
-1.013524, 1.296051, -1.583242, 0, 0, 0, 1, 1,
-1.012285, 0.428384, -1.173542, 0, 0, 0, 1, 1,
-1.011898, -0.212519, -2.127159, 0, 0, 0, 1, 1,
-1.00012, -1.444119, -1.952099, 0, 0, 0, 1, 1,
-0.9975573, -0.1593642, -3.219968, 0, 0, 0, 1, 1,
-0.9967825, 1.309173, -2.563579, 1, 1, 1, 1, 1,
-0.9959161, 0.2355234, -0.7685854, 1, 1, 1, 1, 1,
-0.9930323, 2.42083, -1.850793, 1, 1, 1, 1, 1,
-0.9919445, 1.270681, 0.1118048, 1, 1, 1, 1, 1,
-0.9849365, 1.60639, -1.11111, 1, 1, 1, 1, 1,
-0.9817937, 0.8186089, -1.568061, 1, 1, 1, 1, 1,
-0.9807799, -0.4999924, -1.463622, 1, 1, 1, 1, 1,
-0.9723592, 0.2079746, -1.4437, 1, 1, 1, 1, 1,
-0.9626744, -0.9031723, -2.042273, 1, 1, 1, 1, 1,
-0.9620023, -0.7553411, -2.16848, 1, 1, 1, 1, 1,
-0.9512119, 0.4605622, -1.214467, 1, 1, 1, 1, 1,
-0.9497395, 1.626678, 0.2640043, 1, 1, 1, 1, 1,
-0.9436164, -0.3370619, -1.358199, 1, 1, 1, 1, 1,
-0.9382847, -1.081587, -2.628022, 1, 1, 1, 1, 1,
-0.936053, -2.045578, -3.153699, 1, 1, 1, 1, 1,
-0.9310793, -0.5631009, -1.71916, 0, 0, 1, 1, 1,
-0.9290086, 0.7687699, 0.8408133, 1, 0, 0, 1, 1,
-0.9261317, -0.1008779, -0.160516, 1, 0, 0, 1, 1,
-0.9202965, -0.7275251, -1.176809, 1, 0, 0, 1, 1,
-0.9164548, -1.124317, -1.23867, 1, 0, 0, 1, 1,
-0.913936, -0.4014519, -0.8058199, 1, 0, 0, 1, 1,
-0.9129044, -1.568733, -2.600341, 0, 0, 0, 1, 1,
-0.9119244, -1.46177, -3.259645, 0, 0, 0, 1, 1,
-0.8986847, -0.2245068, -0.8940172, 0, 0, 0, 1, 1,
-0.8891683, -0.4363476, -3.37335, 0, 0, 0, 1, 1,
-0.8856169, -1.002209, -1.261523, 0, 0, 0, 1, 1,
-0.8840485, -1.051677, -2.820357, 0, 0, 0, 1, 1,
-0.8831879, 0.718525, -1.4931, 0, 0, 0, 1, 1,
-0.8782552, -0.06991147, -1.807976, 1, 1, 1, 1, 1,
-0.8775405, 0.930765, -1.439744, 1, 1, 1, 1, 1,
-0.875137, 0.6474705, -3.544789, 1, 1, 1, 1, 1,
-0.8673471, 1.515876, 1.229556, 1, 1, 1, 1, 1,
-0.8653316, -0.1743967, -2.4122, 1, 1, 1, 1, 1,
-0.862652, -1.78891, -4.06946, 1, 1, 1, 1, 1,
-0.8598027, 2.531088, -0.6653162, 1, 1, 1, 1, 1,
-0.8567906, -0.9623501, -0.5490398, 1, 1, 1, 1, 1,
-0.8566014, 0.8414274, -1.817937, 1, 1, 1, 1, 1,
-0.8547202, 0.07964547, -1.844209, 1, 1, 1, 1, 1,
-0.8529408, -0.1692774, 0.5582284, 1, 1, 1, 1, 1,
-0.8523861, -0.4606955, -4.326231, 1, 1, 1, 1, 1,
-0.8512907, 1.293077, -0.5457007, 1, 1, 1, 1, 1,
-0.8433167, 1.1307, -1.278476, 1, 1, 1, 1, 1,
-0.8397834, 0.2385005, -2.133756, 1, 1, 1, 1, 1,
-0.8368576, 0.9408082, -0.7079427, 0, 0, 1, 1, 1,
-0.8282616, -1.876862, -1.208495, 1, 0, 0, 1, 1,
-0.8209369, 0.607985, -1.973032, 1, 0, 0, 1, 1,
-0.8198508, 1.424176, -2.327154, 1, 0, 0, 1, 1,
-0.8124346, -0.7219746, -0.9756671, 1, 0, 0, 1, 1,
-0.8092756, 1.434323, -0.2517746, 1, 0, 0, 1, 1,
-0.8074514, -0.7247692, -3.599239, 0, 0, 0, 1, 1,
-0.7920153, -0.6957807, -3.525987, 0, 0, 0, 1, 1,
-0.7911851, -1.164741, -2.568931, 0, 0, 0, 1, 1,
-0.7906761, 0.9411363, -2.517453, 0, 0, 0, 1, 1,
-0.7902642, 0.6402986, -1.304618, 0, 0, 0, 1, 1,
-0.7901353, -1.436534, -0.6283625, 0, 0, 0, 1, 1,
-0.7894486, -0.3948564, -1.371757, 0, 0, 0, 1, 1,
-0.7858713, 0.5170809, -1.570744, 1, 1, 1, 1, 1,
-0.7795404, -1.168483, -3.172602, 1, 1, 1, 1, 1,
-0.7789884, -2.309027, -2.067122, 1, 1, 1, 1, 1,
-0.7697648, 0.6275476, -0.7031727, 1, 1, 1, 1, 1,
-0.766683, 0.6220053, -1.266623, 1, 1, 1, 1, 1,
-0.7640035, 0.2337048, -1.758872, 1, 1, 1, 1, 1,
-0.7637122, -0.4686085, -2.242198, 1, 1, 1, 1, 1,
-0.7618731, -0.1980598, -0.9906007, 1, 1, 1, 1, 1,
-0.7604866, -1.15208, -2.208933, 1, 1, 1, 1, 1,
-0.7603421, 0.5724807, -0.9843233, 1, 1, 1, 1, 1,
-0.7596988, 0.02881452, -1.183947, 1, 1, 1, 1, 1,
-0.7548148, 0.4121507, 0.6220171, 1, 1, 1, 1, 1,
-0.7534796, -1.233708, -2.301026, 1, 1, 1, 1, 1,
-0.7519245, -0.3451421, -2.622411, 1, 1, 1, 1, 1,
-0.750086, -0.8669612, -3.019958, 1, 1, 1, 1, 1,
-0.7455881, 1.357505, 0.3458669, 0, 0, 1, 1, 1,
-0.7415173, -0.414881, -2.830858, 1, 0, 0, 1, 1,
-0.7396157, -0.4927348, -2.031622, 1, 0, 0, 1, 1,
-0.7374436, -1.248058, -3.922092, 1, 0, 0, 1, 1,
-0.7370572, -1.307101, -4.298918, 1, 0, 0, 1, 1,
-0.7357857, 1.230536, 0.07342876, 1, 0, 0, 1, 1,
-0.7353348, 1.751274, -0.8082502, 0, 0, 0, 1, 1,
-0.7328125, 0.2590293, -0.7240669, 0, 0, 0, 1, 1,
-0.7315195, 0.6304413, -0.2520042, 0, 0, 0, 1, 1,
-0.7305387, 0.187164, -2.000135, 0, 0, 0, 1, 1,
-0.7274621, -3.130307, -2.95468, 0, 0, 0, 1, 1,
-0.726432, 1.053425, 2.572063, 0, 0, 0, 1, 1,
-0.7228019, 0.9318942, -0.3162132, 0, 0, 0, 1, 1,
-0.7191291, 0.4381917, 1.135329, 1, 1, 1, 1, 1,
-0.7187999, 1.269865, 1.43838, 1, 1, 1, 1, 1,
-0.7136323, -1.432274, -2.407598, 1, 1, 1, 1, 1,
-0.7032269, 0.8996149, -0.9918865, 1, 1, 1, 1, 1,
-0.7008221, -0.2540175, -1.558579, 1, 1, 1, 1, 1,
-0.6882179, -0.9153361, -2.419979, 1, 1, 1, 1, 1,
-0.6869, 0.7881826, -1.353524, 1, 1, 1, 1, 1,
-0.6854925, -1.270003, -1.579531, 1, 1, 1, 1, 1,
-0.6764172, -1.830449, -3.352106, 1, 1, 1, 1, 1,
-0.6751176, -1.435267, -2.004732, 1, 1, 1, 1, 1,
-0.6718425, -0.7285622, -3.147125, 1, 1, 1, 1, 1,
-0.6714386, -0.5824996, -1.867167, 1, 1, 1, 1, 1,
-0.6674215, 0.5330415, 1.223479, 1, 1, 1, 1, 1,
-0.6663097, -0.4498725, -2.075055, 1, 1, 1, 1, 1,
-0.6608861, -1.21217, -3.240491, 1, 1, 1, 1, 1,
-0.657339, -0.7072182, -2.478373, 0, 0, 1, 1, 1,
-0.6488808, 1.772754, -2.23699, 1, 0, 0, 1, 1,
-0.6446891, -0.6061638, -4.550845, 1, 0, 0, 1, 1,
-0.6425261, -1.452297, -2.863657, 1, 0, 0, 1, 1,
-0.6389015, -0.8209739, -3.657092, 1, 0, 0, 1, 1,
-0.6374328, 0.1948188, -1.681664, 1, 0, 0, 1, 1,
-0.6361351, -0.7716879, -4.764404, 0, 0, 0, 1, 1,
-0.6342565, 2.098353, -0.2319812, 0, 0, 0, 1, 1,
-0.6288288, -0.8512427, -4.711107, 0, 0, 0, 1, 1,
-0.6229126, -0.526562, -1.563527, 0, 0, 0, 1, 1,
-0.6208397, 0.1471912, -3.465742, 0, 0, 0, 1, 1,
-0.6141498, 0.7625976, 0.4780153, 0, 0, 0, 1, 1,
-0.6090264, -1.35298, -3.84895, 0, 0, 0, 1, 1,
-0.6042055, -0.1615693, -1.279174, 1, 1, 1, 1, 1,
-0.6019275, 0.009311852, -0.5160817, 1, 1, 1, 1, 1,
-0.6012864, -0.9562483, -1.716858, 1, 1, 1, 1, 1,
-0.5951199, -1.124122, -3.350427, 1, 1, 1, 1, 1,
-0.5907905, 1.632964, -0.5053781, 1, 1, 1, 1, 1,
-0.5868779, 1.075748, -0.4403819, 1, 1, 1, 1, 1,
-0.5861027, 1.873361, -2.04914, 1, 1, 1, 1, 1,
-0.5767291, -2.608415, -3.109498, 1, 1, 1, 1, 1,
-0.5720466, 0.6429887, 1.172895, 1, 1, 1, 1, 1,
-0.5715828, -0.1270614, -1.668362, 1, 1, 1, 1, 1,
-0.5696853, 0.380043, 0.07441637, 1, 1, 1, 1, 1,
-0.5685852, -0.3547505, -2.98311, 1, 1, 1, 1, 1,
-0.5679162, -0.1701464, -2.175771, 1, 1, 1, 1, 1,
-0.5623759, 1.216903, 1.25958, 1, 1, 1, 1, 1,
-0.5579155, 0.2333224, -1.025014, 1, 1, 1, 1, 1,
-0.5543021, 0.9951376, -0.6582627, 0, 0, 1, 1, 1,
-0.5518697, 1.181567, -1.298097, 1, 0, 0, 1, 1,
-0.545721, 0.9412023, -0.5894247, 1, 0, 0, 1, 1,
-0.5448437, 0.4606252, -0.8949276, 1, 0, 0, 1, 1,
-0.5416263, 0.08902708, -2.548804, 1, 0, 0, 1, 1,
-0.5409358, 0.2492167, -1.666358, 1, 0, 0, 1, 1,
-0.5406234, -0.596719, -1.127832, 0, 0, 0, 1, 1,
-0.5397758, -2.521146, -2.827593, 0, 0, 0, 1, 1,
-0.5394019, -1.741443, -3.360236, 0, 0, 0, 1, 1,
-0.5388404, 0.9936468, -1.074242, 0, 0, 0, 1, 1,
-0.5357637, -0.3516513, -1.959461, 0, 0, 0, 1, 1,
-0.5356809, 2.135403, 1.018392, 0, 0, 0, 1, 1,
-0.5351611, -0.5993395, -3.191915, 0, 0, 0, 1, 1,
-0.5349262, 0.7523309, -0.2406118, 1, 1, 1, 1, 1,
-0.5305601, 0.5113469, 0.1777912, 1, 1, 1, 1, 1,
-0.5293893, 1.997695, -0.004549821, 1, 1, 1, 1, 1,
-0.5271531, 2.962165, -0.610302, 1, 1, 1, 1, 1,
-0.5221148, -2.153111, -2.132782, 1, 1, 1, 1, 1,
-0.5219865, -0.8389385, -1.736661, 1, 1, 1, 1, 1,
-0.5197508, -0.801799, -1.519422, 1, 1, 1, 1, 1,
-0.5108767, -0.2400525, -2.812566, 1, 1, 1, 1, 1,
-0.5097028, 1.815814, 0.3452645, 1, 1, 1, 1, 1,
-0.5089754, -0.9080808, -2.968757, 1, 1, 1, 1, 1,
-0.5085226, -1.244429, -1.702844, 1, 1, 1, 1, 1,
-0.5076904, 0.3473278, -2.145858, 1, 1, 1, 1, 1,
-0.5008526, -0.3320255, -1.120531, 1, 1, 1, 1, 1,
-0.4989241, -0.7393407, -3.320814, 1, 1, 1, 1, 1,
-0.487967, 0.7190229, 0.4930967, 1, 1, 1, 1, 1,
-0.4808837, -1.585284, -3.340132, 0, 0, 1, 1, 1,
-0.4774824, -0.1534352, -0.1847831, 1, 0, 0, 1, 1,
-0.4768115, 0.6272137, -0.1436034, 1, 0, 0, 1, 1,
-0.4761087, -0.4184493, -4.317726, 1, 0, 0, 1, 1,
-0.4722121, 0.4914681, -0.7834464, 1, 0, 0, 1, 1,
-0.4705057, -1.170259, -2.575353, 1, 0, 0, 1, 1,
-0.4696606, -1.30856, -1.670339, 0, 0, 0, 1, 1,
-0.4688067, -0.1735834, -2.14331, 0, 0, 0, 1, 1,
-0.463762, -0.4112017, -2.696215, 0, 0, 0, 1, 1,
-0.4623527, -0.1506269, -2.873836, 0, 0, 0, 1, 1,
-0.4600731, 0.2821972, -1.603601, 0, 0, 0, 1, 1,
-0.4554274, 0.3270975, -0.6134848, 0, 0, 0, 1, 1,
-0.4529516, -0.9471121, -2.488002, 0, 0, 0, 1, 1,
-0.449438, 1.208065, -0.1574498, 1, 1, 1, 1, 1,
-0.446493, -0.3976381, -0.949852, 1, 1, 1, 1, 1,
-0.4439229, -1.972474, -2.550207, 1, 1, 1, 1, 1,
-0.4428512, 1.432691, 0.991583, 1, 1, 1, 1, 1,
-0.440847, 1.02848, -0.5222059, 1, 1, 1, 1, 1,
-0.4394587, 0.8041843, -0.1298511, 1, 1, 1, 1, 1,
-0.4368408, 0.3117258, -0.04296748, 1, 1, 1, 1, 1,
-0.4275552, -0.7798042, -3.648839, 1, 1, 1, 1, 1,
-0.4270132, -2.633338, -3.927577, 1, 1, 1, 1, 1,
-0.4218705, 0.7728459, -0.399873, 1, 1, 1, 1, 1,
-0.4182031, 1.283147, 0.6927769, 1, 1, 1, 1, 1,
-0.4174016, -0.4324598, -2.274929, 1, 1, 1, 1, 1,
-0.4170895, 0.7041963, -0.3828251, 1, 1, 1, 1, 1,
-0.4169608, -0.1233337, -2.635344, 1, 1, 1, 1, 1,
-0.416363, 0.9833753, -0.767316, 1, 1, 1, 1, 1,
-0.4162872, 1.256348, -0.5136977, 0, 0, 1, 1, 1,
-0.4075574, -0.440865, -1.816623, 1, 0, 0, 1, 1,
-0.4039028, 0.3126517, -2.280297, 1, 0, 0, 1, 1,
-0.4011298, 0.3186252, -1.495582, 1, 0, 0, 1, 1,
-0.3940107, -0.5378289, -2.055504, 1, 0, 0, 1, 1,
-0.387951, 0.154496, -0.4312719, 1, 0, 0, 1, 1,
-0.3845251, 0.6213621, 0.757058, 0, 0, 0, 1, 1,
-0.3826095, 0.7901839, -0.4831094, 0, 0, 0, 1, 1,
-0.3786057, 0.2429295, -0.5034152, 0, 0, 0, 1, 1,
-0.3784735, -0.7075415, -1.610694, 0, 0, 0, 1, 1,
-0.3782787, -1.107018, -3.032097, 0, 0, 0, 1, 1,
-0.3695429, -1.253826, -2.607405, 0, 0, 0, 1, 1,
-0.366283, 0.894008, 0.1865274, 0, 0, 0, 1, 1,
-0.3632108, -0.8515477, -2.390904, 1, 1, 1, 1, 1,
-0.362096, 0.145818, -3.004272, 1, 1, 1, 1, 1,
-0.3606371, -2.057835, -2.620269, 1, 1, 1, 1, 1,
-0.3605837, 1.058869, 0.4908118, 1, 1, 1, 1, 1,
-0.3601311, 0.791812, 0.4995671, 1, 1, 1, 1, 1,
-0.3593757, 0.5680484, -2.530434, 1, 1, 1, 1, 1,
-0.3592308, 1.157395, 1.210263, 1, 1, 1, 1, 1,
-0.3490423, -1.105463, -4.642553, 1, 1, 1, 1, 1,
-0.3487571, 0.4089251, -1.000803, 1, 1, 1, 1, 1,
-0.3487478, -0.2119652, -2.579514, 1, 1, 1, 1, 1,
-0.3452509, 0.03778095, -3.049026, 1, 1, 1, 1, 1,
-0.3439564, -0.6534248, -3.319351, 1, 1, 1, 1, 1,
-0.341913, 0.3322635, -2.175778, 1, 1, 1, 1, 1,
-0.3404362, -0.3690267, -1.469572, 1, 1, 1, 1, 1,
-0.3396705, 0.9065819, 0.3906693, 1, 1, 1, 1, 1,
-0.339166, -0.9527494, -2.841255, 0, 0, 1, 1, 1,
-0.3387603, 0.474802, -0.5256171, 1, 0, 0, 1, 1,
-0.3386142, -0.9289629, -1.084711, 1, 0, 0, 1, 1,
-0.3379306, -1.327626, -3.513502, 1, 0, 0, 1, 1,
-0.3291094, -0.5813069, -2.125067, 1, 0, 0, 1, 1,
-0.3275358, 1.398994, -1.432777, 1, 0, 0, 1, 1,
-0.3273935, -1.604497, -3.780438, 0, 0, 0, 1, 1,
-0.3251774, -0.259302, -2.755288, 0, 0, 0, 1, 1,
-0.3217302, -1.319252, -2.891361, 0, 0, 0, 1, 1,
-0.3200001, -0.2694155, -1.374168, 0, 0, 0, 1, 1,
-0.31688, 1.769195, 0.832322, 0, 0, 0, 1, 1,
-0.3164231, 1.418716, -0.1689212, 0, 0, 0, 1, 1,
-0.3162707, 0.4475985, 0.4098253, 0, 0, 0, 1, 1,
-0.3135959, -1.666756, -2.837163, 1, 1, 1, 1, 1,
-0.3081797, 0.1922237, -0.9753447, 1, 1, 1, 1, 1,
-0.3035268, 1.23933, -1.599462, 1, 1, 1, 1, 1,
-0.3007895, 2.013612, -2.221691, 1, 1, 1, 1, 1,
-0.3000592, 0.6922206, -0.8647973, 1, 1, 1, 1, 1,
-0.2974948, 0.6009357, 1.208226, 1, 1, 1, 1, 1,
-0.2968669, 0.4677804, -2.661558, 1, 1, 1, 1, 1,
-0.2947779, 0.5094514, -2.003457, 1, 1, 1, 1, 1,
-0.2939907, 1.429425, 0.08722094, 1, 1, 1, 1, 1,
-0.2900124, -0.3385106, -1.84035, 1, 1, 1, 1, 1,
-0.2897102, -1.75275, -1.89257, 1, 1, 1, 1, 1,
-0.2840222, -0.2039667, -2.854338, 1, 1, 1, 1, 1,
-0.2837917, -0.6140488, -3.144541, 1, 1, 1, 1, 1,
-0.2803851, 0.00260135, -1.62099, 1, 1, 1, 1, 1,
-0.2749676, -0.2046748, -3.732626, 1, 1, 1, 1, 1,
-0.2678763, 0.02404811, -1.158308, 0, 0, 1, 1, 1,
-0.2637422, 0.7855365, -1.479267, 1, 0, 0, 1, 1,
-0.2587182, -1.027273, -0.3984923, 1, 0, 0, 1, 1,
-0.2580398, 0.5767375, 0.6659878, 1, 0, 0, 1, 1,
-0.2529766, 0.3114633, -1.406043, 1, 0, 0, 1, 1,
-0.2528954, 1.066702, -0.08601763, 1, 0, 0, 1, 1,
-0.2496139, 0.1136215, -2.504926, 0, 0, 0, 1, 1,
-0.2471877, 0.1456947, 0.5139686, 0, 0, 0, 1, 1,
-0.2397979, -0.7225925, -3.035914, 0, 0, 0, 1, 1,
-0.2362863, -0.1572533, -2.352468, 0, 0, 0, 1, 1,
-0.2263029, -0.9539863, -1.253306, 0, 0, 0, 1, 1,
-0.2254801, -0.1460847, -1.591849, 0, 0, 0, 1, 1,
-0.2247758, -1.364198, -3.143466, 0, 0, 0, 1, 1,
-0.2136208, 0.01755097, -1.734528, 1, 1, 1, 1, 1,
-0.2085019, -0.2990696, -1.471208, 1, 1, 1, 1, 1,
-0.2061537, -0.3866957, -3.062411, 1, 1, 1, 1, 1,
-0.2051603, 0.8364252, -0.1130314, 1, 1, 1, 1, 1,
-0.2024046, -0.6305265, -1.371973, 1, 1, 1, 1, 1,
-0.2019532, -0.09623524, -2.92732, 1, 1, 1, 1, 1,
-0.2005795, 1.589075, 0.520757, 1, 1, 1, 1, 1,
-0.1875098, -0.9357359, -2.601895, 1, 1, 1, 1, 1,
-0.1862243, -2.428401, -1.382028, 1, 1, 1, 1, 1,
-0.1860856, -0.3216299, -2.848593, 1, 1, 1, 1, 1,
-0.1844884, 0.1674181, -0.1516177, 1, 1, 1, 1, 1,
-0.1828816, -0.7840168, -2.627012, 1, 1, 1, 1, 1,
-0.1790479, 0.3549962, -0.6023872, 1, 1, 1, 1, 1,
-0.1766298, 0.4754148, 0.8571141, 1, 1, 1, 1, 1,
-0.1749068, -0.9891753, -4.502036, 1, 1, 1, 1, 1,
-0.1740749, -0.6929689, -1.799571, 0, 0, 1, 1, 1,
-0.1694312, -1.948176, -4.08176, 1, 0, 0, 1, 1,
-0.1685384, -0.2716585, -1.286528, 1, 0, 0, 1, 1,
-0.1622303, 0.6111061, 1.478162, 1, 0, 0, 1, 1,
-0.161945, -1.242755, -2.476538, 1, 0, 0, 1, 1,
-0.1602179, -1.752252, -2.480782, 1, 0, 0, 1, 1,
-0.1576786, 1.311185, -2.191428, 0, 0, 0, 1, 1,
-0.1567214, 0.6157018, 0.09361202, 0, 0, 0, 1, 1,
-0.1562966, 0.07546189, -0.7531692, 0, 0, 0, 1, 1,
-0.1555889, 0.01201363, 1.044763, 0, 0, 0, 1, 1,
-0.1553704, -0.3412908, -1.074918, 0, 0, 0, 1, 1,
-0.1511071, 2.160773, -0.8717612, 0, 0, 0, 1, 1,
-0.146373, 0.3477939, -0.1698823, 0, 0, 0, 1, 1,
-0.1453371, 2.01113, 0.3213609, 1, 1, 1, 1, 1,
-0.1448801, 0.298894, -2.027453, 1, 1, 1, 1, 1,
-0.1399516, -0.247745, -1.18658, 1, 1, 1, 1, 1,
-0.1357468, -1.044403, -3.320976, 1, 1, 1, 1, 1,
-0.1342452, 0.9720836, -0.1425994, 1, 1, 1, 1, 1,
-0.1337843, -1.019925, -4.275573, 1, 1, 1, 1, 1,
-0.1287321, 0.4193941, -1.02143, 1, 1, 1, 1, 1,
-0.1228032, 1.167506, 0.1563117, 1, 1, 1, 1, 1,
-0.1204396, -0.9689721, -2.877321, 1, 1, 1, 1, 1,
-0.1179999, -0.1742895, -3.810919, 1, 1, 1, 1, 1,
-0.1166715, 2.503727, -0.6881851, 1, 1, 1, 1, 1,
-0.1131597, 0.07408735, -2.778507, 1, 1, 1, 1, 1,
-0.1107424, -0.4008412, -3.753764, 1, 1, 1, 1, 1,
-0.1062118, 0.4211185, 0.7270569, 1, 1, 1, 1, 1,
-0.1047714, -0.8876739, -2.605972, 1, 1, 1, 1, 1,
-0.1006504, 0.244599, -0.7404579, 0, 0, 1, 1, 1,
-0.09749006, 1.196995, -2.029327, 1, 0, 0, 1, 1,
-0.09097535, -0.6727195, -2.554021, 1, 0, 0, 1, 1,
-0.09035325, 0.6831391, -1.862067, 1, 0, 0, 1, 1,
-0.08611825, 0.5024969, 3.025968, 1, 0, 0, 1, 1,
-0.08450836, -2.371548, -2.150531, 1, 0, 0, 1, 1,
-0.08282322, 1.257751, -0.2465639, 0, 0, 0, 1, 1,
-0.07061518, 0.7566653, 0.1851664, 0, 0, 0, 1, 1,
-0.06318855, -0.6454686, -3.271273, 0, 0, 0, 1, 1,
-0.06243771, 0.6648316, 0.2913155, 0, 0, 0, 1, 1,
-0.06171441, -0.9680573, -4.298388, 0, 0, 0, 1, 1,
-0.0600109, -0.00772177, -1.036459, 0, 0, 0, 1, 1,
-0.05968819, -1.028072, -3.689074, 0, 0, 0, 1, 1,
-0.05926383, -0.7591518, -2.303786, 1, 1, 1, 1, 1,
-0.05887172, -0.3073317, -4.07412, 1, 1, 1, 1, 1,
-0.05307094, 0.1741698, -0.9916034, 1, 1, 1, 1, 1,
-0.04961294, 0.01409905, -0.7117555, 1, 1, 1, 1, 1,
-0.04693827, -0.8287019, -3.134134, 1, 1, 1, 1, 1,
-0.04664188, 0.379579, -0.5903556, 1, 1, 1, 1, 1,
-0.04505184, 0.6453241, -0.5855305, 1, 1, 1, 1, 1,
-0.0433966, -0.6369468, -1.570456, 1, 1, 1, 1, 1,
-0.04133092, -0.3776255, -1.810456, 1, 1, 1, 1, 1,
-0.0350696, 0.6439225, -1.39156, 1, 1, 1, 1, 1,
-0.03460697, 1.421068, -0.4178163, 1, 1, 1, 1, 1,
-0.03256459, -1.879146, -2.723278, 1, 1, 1, 1, 1,
-0.03232527, 0.3770495, 0.100682, 1, 1, 1, 1, 1,
-0.0316508, 1.513528, -0.9164824, 1, 1, 1, 1, 1,
-0.03120753, -0.9957188, -1.489207, 1, 1, 1, 1, 1,
-0.02918316, -1.654995, -2.35201, 0, 0, 1, 1, 1,
-0.02709072, 0.7226681, -1.678949, 1, 0, 0, 1, 1,
-0.02419203, -1.236352, -3.129807, 1, 0, 0, 1, 1,
-0.02227409, 0.8479723, 0.7346036, 1, 0, 0, 1, 1,
-0.0186171, 1.945572, 0.9167761, 1, 0, 0, 1, 1,
-0.0151247, -2.169272, -2.850867, 1, 0, 0, 1, 1,
-0.01005805, -1.046434, -3.477433, 0, 0, 0, 1, 1,
-0.009131262, -0.1096299, -4.898802, 0, 0, 0, 1, 1,
-0.004896429, -0.4212942, -3.52778, 0, 0, 0, 1, 1,
-0.00461371, -0.3079738, -2.07416, 0, 0, 0, 1, 1,
-0.003722585, 0.9915137, 2.089055, 0, 0, 0, 1, 1,
0.0002922091, -0.789699, 4.40999, 0, 0, 0, 1, 1,
0.004196586, 0.8598959, 2.243608, 0, 0, 0, 1, 1,
0.005283902, 0.6943123, -0.02109258, 1, 1, 1, 1, 1,
0.006001839, -0.7729092, 3.583026, 1, 1, 1, 1, 1,
0.0125205, 0.1194731, 0.559506, 1, 1, 1, 1, 1,
0.01262125, 1.636289, -0.9375421, 1, 1, 1, 1, 1,
0.01367945, 0.3463565, -0.8045986, 1, 1, 1, 1, 1,
0.01605435, 1.191771, 0.02544892, 1, 1, 1, 1, 1,
0.02116089, -0.8000607, 3.533113, 1, 1, 1, 1, 1,
0.02217807, 0.7357066, 0.6642545, 1, 1, 1, 1, 1,
0.02276788, -0.4630327, 1.765579, 1, 1, 1, 1, 1,
0.03111126, 0.5687349, -0.5009695, 1, 1, 1, 1, 1,
0.03146433, 0.9104357, 0.2017192, 1, 1, 1, 1, 1,
0.03173157, 1.275754, 0.3122207, 1, 1, 1, 1, 1,
0.03201914, -1.416184, 4.209704, 1, 1, 1, 1, 1,
0.03266827, -0.5700938, 3.532622, 1, 1, 1, 1, 1,
0.03535921, -2.240625, 3.593528, 1, 1, 1, 1, 1,
0.03670868, -0.8685877, 3.330721, 0, 0, 1, 1, 1,
0.03783559, 0.0670405, -0.6207599, 1, 0, 0, 1, 1,
0.03815644, -0.002803454, 2.160465, 1, 0, 0, 1, 1,
0.0401543, 0.3084221, 0.2201057, 1, 0, 0, 1, 1,
0.0435286, 0.9722622, -0.2968754, 1, 0, 0, 1, 1,
0.04582747, -0.9483093, 2.597548, 1, 0, 0, 1, 1,
0.05049133, 0.2346777, -0.3977279, 0, 0, 0, 1, 1,
0.05114961, 0.08301029, 1.186919, 0, 0, 0, 1, 1,
0.05736505, 0.2410921, -0.5167261, 0, 0, 0, 1, 1,
0.05977083, -1.070016, 3.19269, 0, 0, 0, 1, 1,
0.06143968, -0.5506869, 3.036038, 0, 0, 0, 1, 1,
0.06235657, 1.463485, -1.192911, 0, 0, 0, 1, 1,
0.06497256, -0.3150385, 3.885859, 0, 0, 0, 1, 1,
0.06532613, -0.8383666, 1.81009, 1, 1, 1, 1, 1,
0.0664763, 0.02992659, 1.062655, 1, 1, 1, 1, 1,
0.06674525, -0.8878871, 4.067499, 1, 1, 1, 1, 1,
0.06840245, 1.370853, 0.4994797, 1, 1, 1, 1, 1,
0.07082881, -0.1064226, 1.66115, 1, 1, 1, 1, 1,
0.07497425, -0.1608344, 2.898146, 1, 1, 1, 1, 1,
0.07632374, -0.7522317, 1.198048, 1, 1, 1, 1, 1,
0.07930523, -0.3304295, 2.627861, 1, 1, 1, 1, 1,
0.08454021, -1.463076, 2.934319, 1, 1, 1, 1, 1,
0.09013385, 0.7198591, -0.8527977, 1, 1, 1, 1, 1,
0.09240069, -0.3142922, 2.507899, 1, 1, 1, 1, 1,
0.09722485, -0.2358573, 1.030243, 1, 1, 1, 1, 1,
0.09815697, 0.9202117, -0.8063526, 1, 1, 1, 1, 1,
0.1052793, -0.1420093, 2.36818, 1, 1, 1, 1, 1,
0.1066515, -0.1115922, 1.465024, 1, 1, 1, 1, 1,
0.1123687, -0.7130516, 2.756553, 0, 0, 1, 1, 1,
0.1173416, -1.683464, 3.566628, 1, 0, 0, 1, 1,
0.1204695, 2.100945, -1.256577, 1, 0, 0, 1, 1,
0.1216468, -0.9689948, 2.957173, 1, 0, 0, 1, 1,
0.1250416, 1.004591, -1.544111, 1, 0, 0, 1, 1,
0.1283758, -2.056152, 1.205245, 1, 0, 0, 1, 1,
0.1291184, -0.4217772, 3.266778, 0, 0, 0, 1, 1,
0.137253, -0.2082559, 2.036389, 0, 0, 0, 1, 1,
0.1380409, -1.34822, 3.441936, 0, 0, 0, 1, 1,
0.1387164, 0.1484598, 0.4034983, 0, 0, 0, 1, 1,
0.1414365, -0.5412572, 3.171985, 0, 0, 0, 1, 1,
0.1430779, 1.337912, 0.8486558, 0, 0, 0, 1, 1,
0.146202, 0.1437198, -0.06955893, 0, 0, 0, 1, 1,
0.1464841, -0.566358, 2.436586, 1, 1, 1, 1, 1,
0.1474662, -0.5941814, 3.036707, 1, 1, 1, 1, 1,
0.1475009, 1.275709, 0.677564, 1, 1, 1, 1, 1,
0.1493876, 0.05724854, 1.817869, 1, 1, 1, 1, 1,
0.1512371, -0.3059892, 3.260011, 1, 1, 1, 1, 1,
0.1538104, -0.6241949, 3.227101, 1, 1, 1, 1, 1,
0.1604513, 0.008817165, 1.898237, 1, 1, 1, 1, 1,
0.1612351, 1.321501, 0.257137, 1, 1, 1, 1, 1,
0.1613904, -0.2921774, 2.014633, 1, 1, 1, 1, 1,
0.1640776, 0.8741562, 1.572807, 1, 1, 1, 1, 1,
0.170646, -0.3306942, 3.213231, 1, 1, 1, 1, 1,
0.1710206, 0.2897503, 0.8137087, 1, 1, 1, 1, 1,
0.1714029, 0.7745411, 1.13258, 1, 1, 1, 1, 1,
0.1721903, 0.7145392, 0.315296, 1, 1, 1, 1, 1,
0.172972, -0.6236215, 2.199643, 1, 1, 1, 1, 1,
0.1810986, -0.001342331, 1.596257, 0, 0, 1, 1, 1,
0.1813825, 0.408241, 0.2764906, 1, 0, 0, 1, 1,
0.1891303, -3.038515, 3.732804, 1, 0, 0, 1, 1,
0.1897049, 1.264603, 0.4917445, 1, 0, 0, 1, 1,
0.1934233, -0.002579547, 1.68798, 1, 0, 0, 1, 1,
0.1939572, 1.17272, 0.4218374, 1, 0, 0, 1, 1,
0.1971436, 2.291519, -1.154964, 0, 0, 0, 1, 1,
0.2045944, -0.1562951, 1.42293, 0, 0, 0, 1, 1,
0.2048231, 0.1457729, -0.5219463, 0, 0, 0, 1, 1,
0.2115191, -1.399781, 1.7837, 0, 0, 0, 1, 1,
0.2125763, 0.4411764, -0.3348995, 0, 0, 0, 1, 1,
0.2131665, -0.6835117, 3.37395, 0, 0, 0, 1, 1,
0.2168996, 0.2416184, 0.454533, 0, 0, 0, 1, 1,
0.2186871, 2.219245, 0.7817913, 1, 1, 1, 1, 1,
0.2190183, -1.451763, 2.73773, 1, 1, 1, 1, 1,
0.2273149, -0.8269112, 4.205688, 1, 1, 1, 1, 1,
0.2289365, -0.737651, 3.124982, 1, 1, 1, 1, 1,
0.2295592, -0.8885289, 4.164844, 1, 1, 1, 1, 1,
0.2306788, -2.487127, 1.81779, 1, 1, 1, 1, 1,
0.2309516, -1.862625, 1.092983, 1, 1, 1, 1, 1,
0.234019, -1.417948, 3.014756, 1, 1, 1, 1, 1,
0.2366182, -1.186722, 2.748292, 1, 1, 1, 1, 1,
0.2370173, -0.7826135, 3.378378, 1, 1, 1, 1, 1,
0.2394745, 0.05890315, 3.770805, 1, 1, 1, 1, 1,
0.2398994, -1.125679, 5.08505, 1, 1, 1, 1, 1,
0.24414, 1.196927, 0.4656892, 1, 1, 1, 1, 1,
0.247277, -0.3982778, 3.19183, 1, 1, 1, 1, 1,
0.2490066, -1.667557, 4.310328, 1, 1, 1, 1, 1,
0.2501838, -2.375611, 1.800787, 0, 0, 1, 1, 1,
0.2511649, -1.470697, 4.213341, 1, 0, 0, 1, 1,
0.2541595, 1.350296, 1.929774, 1, 0, 0, 1, 1,
0.2554827, -1.069739, 2.852762, 1, 0, 0, 1, 1,
0.2637739, -0.4359716, 3.355936, 1, 0, 0, 1, 1,
0.2661703, -1.422499, 3.236087, 1, 0, 0, 1, 1,
0.2697465, 0.4131679, 0.8222623, 0, 0, 0, 1, 1,
0.2735525, -1.013992, 1.96717, 0, 0, 0, 1, 1,
0.2753122, 1.517578, 1.27942, 0, 0, 0, 1, 1,
0.2768574, -0.09647774, 1.891046, 0, 0, 0, 1, 1,
0.2805363, -0.4172289, 2.884706, 0, 0, 0, 1, 1,
0.2819807, 0.1080061, 1.963601, 0, 0, 0, 1, 1,
0.2822635, -0.8228992, 1.44248, 0, 0, 0, 1, 1,
0.2842861, -1.991521, 4.59043, 1, 1, 1, 1, 1,
0.2871143, 0.0332283, 2.112954, 1, 1, 1, 1, 1,
0.2918837, 1.490892, 1.735413, 1, 1, 1, 1, 1,
0.2976667, 0.5577116, -1.438582, 1, 1, 1, 1, 1,
0.2978637, -0.8795141, 1.864136, 1, 1, 1, 1, 1,
0.3016459, -0.1808377, 0.7999257, 1, 1, 1, 1, 1,
0.3066407, -0.5264641, 0.7276819, 1, 1, 1, 1, 1,
0.3076484, -2.563745, 2.956827, 1, 1, 1, 1, 1,
0.3085629, -1.038698, 3.324328, 1, 1, 1, 1, 1,
0.3102168, 0.9191425, -0.598961, 1, 1, 1, 1, 1,
0.3122008, -0.397934, 2.490032, 1, 1, 1, 1, 1,
0.3170249, -0.6572559, 2.480854, 1, 1, 1, 1, 1,
0.3176389, -1.21811, 3.48282, 1, 1, 1, 1, 1,
0.3177928, 0.1458731, 1.657354, 1, 1, 1, 1, 1,
0.3180783, -0.4091363, 2.171131, 1, 1, 1, 1, 1,
0.3198705, 0.3644688, 0.7370037, 0, 0, 1, 1, 1,
0.3240412, -0.9837043, 0.3727831, 1, 0, 0, 1, 1,
0.3362888, 1.666515, -0.08319882, 1, 0, 0, 1, 1,
0.3387543, -0.02677987, 0.4408752, 1, 0, 0, 1, 1,
0.342844, -1.241268, 3.951957, 1, 0, 0, 1, 1,
0.3446776, 0.9061011, 1.489319, 1, 0, 0, 1, 1,
0.3505547, 0.7519228, -1.19884, 0, 0, 0, 1, 1,
0.3570994, 1.564895, -1.189378, 0, 0, 0, 1, 1,
0.3609132, -0.02126396, 2.717849, 0, 0, 0, 1, 1,
0.3613302, 1.051686, 1.370622, 0, 0, 0, 1, 1,
0.3658247, -0.4800263, 1.529379, 0, 0, 0, 1, 1,
0.3673923, 0.7979905, -0.4895004, 0, 0, 0, 1, 1,
0.3684936, 0.3376675, 1.673117, 0, 0, 0, 1, 1,
0.3697282, -1.450472, 1.129367, 1, 1, 1, 1, 1,
0.3777055, 0.3770871, 0.3117804, 1, 1, 1, 1, 1,
0.3813675, 1.307128, -0.3448449, 1, 1, 1, 1, 1,
0.3831071, 0.4975043, 2.114528, 1, 1, 1, 1, 1,
0.3835189, 1.522559, -1.60101, 1, 1, 1, 1, 1,
0.3867383, 0.3089545, 0.5671638, 1, 1, 1, 1, 1,
0.3873137, -1.412409, 3.017577, 1, 1, 1, 1, 1,
0.3878846, -1.749267, 3.85065, 1, 1, 1, 1, 1,
0.3911328, 2.106859, -2.058048, 1, 1, 1, 1, 1,
0.3929412, 0.5987786, 0.09697388, 1, 1, 1, 1, 1,
0.3979256, -0.650387, 3.781926, 1, 1, 1, 1, 1,
0.3997806, 1.047844, 0.2127373, 1, 1, 1, 1, 1,
0.4020095, -1.866905, -0.8269044, 1, 1, 1, 1, 1,
0.4089216, 0.6340546, 0.6598747, 1, 1, 1, 1, 1,
0.4089217, 0.29003, -0.2221333, 1, 1, 1, 1, 1,
0.4144572, 0.5805872, 1.624009, 0, 0, 1, 1, 1,
0.4175325, -0.300579, 1.74245, 1, 0, 0, 1, 1,
0.4225589, -0.1386734, 2.235553, 1, 0, 0, 1, 1,
0.4248328, 0.4137765, 0.8762411, 1, 0, 0, 1, 1,
0.4258575, -1.854758, 2.837718, 1, 0, 0, 1, 1,
0.4265713, -0.7427553, 2.031692, 1, 0, 0, 1, 1,
0.4269096, -1.059176, 3.60991, 0, 0, 0, 1, 1,
0.4307273, -0.8980874, 2.055436, 0, 0, 0, 1, 1,
0.4323956, -0.7026809, 4.374378, 0, 0, 0, 1, 1,
0.4354209, 0.6955913, -0.3446442, 0, 0, 0, 1, 1,
0.4362017, 0.5446649, 1.407508, 0, 0, 0, 1, 1,
0.4379847, -0.1316611, 1.96125, 0, 0, 0, 1, 1,
0.4404164, -1.287359, 4.231687, 0, 0, 0, 1, 1,
0.4411471, 0.4230902, 0.9340616, 1, 1, 1, 1, 1,
0.4454517, 0.5601327, 0.3523265, 1, 1, 1, 1, 1,
0.4502591, -2.185762, 3.329738, 1, 1, 1, 1, 1,
0.4576545, -0.4714766, 2.943135, 1, 1, 1, 1, 1,
0.4587623, 0.4925483, 1.399275, 1, 1, 1, 1, 1,
0.4606208, -1.348296, 4.13287, 1, 1, 1, 1, 1,
0.4616713, -0.08937003, 2.039237, 1, 1, 1, 1, 1,
0.4657691, -1.2415, 3.455166, 1, 1, 1, 1, 1,
0.4681096, 1.148501, 1.914941, 1, 1, 1, 1, 1,
0.4687831, -1.583247, 3.165467, 1, 1, 1, 1, 1,
0.4752218, -0.562611, 2.161393, 1, 1, 1, 1, 1,
0.4797941, -1.161612, 3.365384, 1, 1, 1, 1, 1,
0.4799445, -0.3870845, 2.602011, 1, 1, 1, 1, 1,
0.4811904, 0.2430617, 2.327175, 1, 1, 1, 1, 1,
0.489143, 1.157929, -0.190618, 1, 1, 1, 1, 1,
0.4920816, 0.5173554, -0.4052803, 0, 0, 1, 1, 1,
0.4951974, -1.202558, 2.924488, 1, 0, 0, 1, 1,
0.4959936, 0.57127, 1.299179, 1, 0, 0, 1, 1,
0.497583, -0.5170412, 3.003772, 1, 0, 0, 1, 1,
0.4991212, -0.3083393, 3.313328, 1, 0, 0, 1, 1,
0.5031024, 0.2031323, 0.3172389, 1, 0, 0, 1, 1,
0.5038711, 0.05595429, 2.538041, 0, 0, 0, 1, 1,
0.503941, 1.829123, -0.1189286, 0, 0, 0, 1, 1,
0.5058241, 1.116122, 0.1883053, 0, 0, 0, 1, 1,
0.5071374, -0.4151883, 2.81257, 0, 0, 0, 1, 1,
0.5072294, -0.2873186, 2.540611, 0, 0, 0, 1, 1,
0.5112713, -0.05252524, 1.752055, 0, 0, 0, 1, 1,
0.5176604, -0.2408348, 1.956995, 0, 0, 0, 1, 1,
0.5206904, 0.3736672, 1.345946, 1, 1, 1, 1, 1,
0.5212016, -0.1147498, 1.293245, 1, 1, 1, 1, 1,
0.5231055, -0.3668201, 1.89301, 1, 1, 1, 1, 1,
0.5238044, -0.1843278, 2.821109, 1, 1, 1, 1, 1,
0.5266101, -1.336365, 3.24508, 1, 1, 1, 1, 1,
0.5268098, 0.9145798, 0.6057178, 1, 1, 1, 1, 1,
0.5298214, 0.2420488, 1.688699, 1, 1, 1, 1, 1,
0.5329193, -0.3915681, 2.674359, 1, 1, 1, 1, 1,
0.5404192, 0.1351317, 0.4559818, 1, 1, 1, 1, 1,
0.5406494, 0.820052, 1.65142, 1, 1, 1, 1, 1,
0.5408875, -0.432616, 3.261339, 1, 1, 1, 1, 1,
0.5429494, -0.4004745, 2.659461, 1, 1, 1, 1, 1,
0.5506499, 1.017049, 0.846378, 1, 1, 1, 1, 1,
0.5527123, 0.02414086, 2.199618, 1, 1, 1, 1, 1,
0.5607889, 1.759959, -0.3720126, 1, 1, 1, 1, 1,
0.5687111, 0.3206499, 3.064521, 0, 0, 1, 1, 1,
0.5688097, -0.05572766, 2.265681, 1, 0, 0, 1, 1,
0.5695552, -1.714191, 1.960721, 1, 0, 0, 1, 1,
0.5725171, -1.175705, 2.703777, 1, 0, 0, 1, 1,
0.5740764, 1.124466, 1.349287, 1, 0, 0, 1, 1,
0.5773693, -1.246489, 3.440424, 1, 0, 0, 1, 1,
0.5786144, 0.4526868, 0.7092675, 0, 0, 0, 1, 1,
0.5847839, -0.0935206, 2.849494, 0, 0, 0, 1, 1,
0.5909927, 1.919793, -0.5545394, 0, 0, 0, 1, 1,
0.59664, -0.3024067, 1.197253, 0, 0, 0, 1, 1,
0.6071188, 0.9381003, -1.513795, 0, 0, 0, 1, 1,
0.608821, -2.480977, 4.086485, 0, 0, 0, 1, 1,
0.6110565, 0.5821005, 0.983578, 0, 0, 0, 1, 1,
0.6194121, -1.724292, 1.458405, 1, 1, 1, 1, 1,
0.6256223, -0.9049534, 3.921227, 1, 1, 1, 1, 1,
0.6288791, 0.7360491, 0.8730615, 1, 1, 1, 1, 1,
0.6418712, -0.2292974, 3.116455, 1, 1, 1, 1, 1,
0.6443737, 0.4365465, 0.02748828, 1, 1, 1, 1, 1,
0.6480692, -0.1357706, 2.145837, 1, 1, 1, 1, 1,
0.6545916, 0.01318631, 1.060884, 1, 1, 1, 1, 1,
0.6547142, -0.6035043, 2.198476, 1, 1, 1, 1, 1,
0.6574865, -1.057346, 2.965765, 1, 1, 1, 1, 1,
0.6574996, 1.340422, 0.07086156, 1, 1, 1, 1, 1,
0.6594639, -0.4309781, 0.3560301, 1, 1, 1, 1, 1,
0.663842, 0.7441109, 0.3306325, 1, 1, 1, 1, 1,
0.6665339, 2.014238, 0.6930444, 1, 1, 1, 1, 1,
0.6732331, -1.092429, 3.748782, 1, 1, 1, 1, 1,
0.6776837, 0.6729726, -1.07228, 1, 1, 1, 1, 1,
0.6778595, -0.6660699, 2.914444, 0, 0, 1, 1, 1,
0.6856505, 0.3051013, 1.652193, 1, 0, 0, 1, 1,
0.6874828, -0.7814071, 3.250545, 1, 0, 0, 1, 1,
0.687637, -0.4058517, 3.004514, 1, 0, 0, 1, 1,
0.6938196, -0.7652182, 3.250117, 1, 0, 0, 1, 1,
0.6976681, -1.812269, 4.063707, 1, 0, 0, 1, 1,
0.6987579, 0.5886388, 0.5561841, 0, 0, 0, 1, 1,
0.6990349, 0.9949299, 0.3511486, 0, 0, 0, 1, 1,
0.7000541, -0.1397931, 2.877354, 0, 0, 0, 1, 1,
0.7047815, -1.922503, 2.992051, 0, 0, 0, 1, 1,
0.7083254, 1.030661, 1.018059, 0, 0, 0, 1, 1,
0.7115073, -0.0024624, 2.297637, 0, 0, 0, 1, 1,
0.7152942, -0.2690928, -0.002530857, 0, 0, 0, 1, 1,
0.7166944, -0.2349432, 2.329695, 1, 1, 1, 1, 1,
0.7176629, -1.143327, 2.579547, 1, 1, 1, 1, 1,
0.7206252, -0.2393239, 2.058372, 1, 1, 1, 1, 1,
0.7222624, -1.08764, 1.78155, 1, 1, 1, 1, 1,
0.7232234, -0.2420098, 1.150142, 1, 1, 1, 1, 1,
0.728214, -0.3698468, 2.524341, 1, 1, 1, 1, 1,
0.7314811, 0.1937645, 1.555495, 1, 1, 1, 1, 1,
0.7319881, 1.214207, 1.44862, 1, 1, 1, 1, 1,
0.7334225, -0.4669937, 1.670543, 1, 1, 1, 1, 1,
0.7341624, -0.8987281, 2.283648, 1, 1, 1, 1, 1,
0.7421929, -0.6106895, 3.364384, 1, 1, 1, 1, 1,
0.7431506, -0.2620805, 1.447506, 1, 1, 1, 1, 1,
0.7449501, -2.160549, 2.916578, 1, 1, 1, 1, 1,
0.7463105, 1.253371, 0.7647291, 1, 1, 1, 1, 1,
0.7478319, 0.1571003, 1.278928, 1, 1, 1, 1, 1,
0.7482306, 1.142033, 1.278354, 0, 0, 1, 1, 1,
0.7491744, -0.330146, 1.574125, 1, 0, 0, 1, 1,
0.7512878, 1.926138, -1.449237, 1, 0, 0, 1, 1,
0.7558152, -0.6117383, 2.834878, 1, 0, 0, 1, 1,
0.7559134, -2.182609, 3.975329, 1, 0, 0, 1, 1,
0.7585298, 1.61672, -1.286343, 1, 0, 0, 1, 1,
0.7593474, -0.3066439, 1.434678, 0, 0, 0, 1, 1,
0.7635242, 0.9664033, 0.3657277, 0, 0, 0, 1, 1,
0.7651514, -0.8272899, 4.06941, 0, 0, 0, 1, 1,
0.7655147, -0.3563254, 2.145424, 0, 0, 0, 1, 1,
0.7664269, -1.020694, 0.8349007, 0, 0, 0, 1, 1,
0.7691998, 1.051276, 1.058542, 0, 0, 0, 1, 1,
0.7800915, -2.032351, 2.009261, 0, 0, 0, 1, 1,
0.7818642, 1.506357, 0.9337088, 1, 1, 1, 1, 1,
0.7840158, 0.9438746, 1.798104, 1, 1, 1, 1, 1,
0.7920159, 0.8194535, 0.6599548, 1, 1, 1, 1, 1,
0.7929923, -1.293931, 1.871432, 1, 1, 1, 1, 1,
0.7932903, -0.5549352, 3.074425, 1, 1, 1, 1, 1,
0.794299, 0.2446366, 0.7274699, 1, 1, 1, 1, 1,
0.796187, -0.398369, 2.791263, 1, 1, 1, 1, 1,
0.7982318, -0.228826, 2.542686, 1, 1, 1, 1, 1,
0.8020669, 0.3601646, 1.764224, 1, 1, 1, 1, 1,
0.8037504, 0.9052595, 1.680182, 1, 1, 1, 1, 1,
0.8040747, -0.5596578, 1.490281, 1, 1, 1, 1, 1,
0.8065309, -0.7667438, 2.121504, 1, 1, 1, 1, 1,
0.8081385, -2.112643, 3.196088, 1, 1, 1, 1, 1,
0.8097739, 0.5056649, 0.8071124, 1, 1, 1, 1, 1,
0.8097839, -0.4793134, 0.76482, 1, 1, 1, 1, 1,
0.8108813, 0.342119, -0.6210585, 0, 0, 1, 1, 1,
0.8139129, 0.1163061, 2.531046, 1, 0, 0, 1, 1,
0.8158172, 0.03689147, 1.465907, 1, 0, 0, 1, 1,
0.8193315, -0.3713987, 2.54068, 1, 0, 0, 1, 1,
0.8197021, -0.394826, 2.003722, 1, 0, 0, 1, 1,
0.8224498, 0.0437468, 2.043275, 1, 0, 0, 1, 1,
0.8225372, 0.05396442, 2.699204, 0, 0, 0, 1, 1,
0.826824, 2.200486, -1.245671, 0, 0, 0, 1, 1,
0.8345371, -0.94933, 2.186704, 0, 0, 0, 1, 1,
0.8377222, 0.3246037, 1.818769, 0, 0, 0, 1, 1,
0.839772, 1.022, 0.7527016, 0, 0, 0, 1, 1,
0.8400453, -0.7678052, 0.6720945, 0, 0, 0, 1, 1,
0.8426486, -0.5935853, 2.790312, 0, 0, 0, 1, 1,
0.8457245, 0.2069885, 2.094177, 1, 1, 1, 1, 1,
0.8463171, -0.2704732, 3.975075, 1, 1, 1, 1, 1,
0.8475993, -1.297319, 2.468395, 1, 1, 1, 1, 1,
0.8480337, 0.1172995, 0.3767952, 1, 1, 1, 1, 1,
0.8484568, -0.510442, 2.2149, 1, 1, 1, 1, 1,
0.8517593, 0.4508255, 0.06023766, 1, 1, 1, 1, 1,
0.8597919, 1.112501, -0.1046162, 1, 1, 1, 1, 1,
0.8638638, 0.06744397, 2.267555, 1, 1, 1, 1, 1,
0.864242, -0.1138908, 2.029708, 1, 1, 1, 1, 1,
0.8718827, 0.4248974, 0.9386681, 1, 1, 1, 1, 1,
0.8732712, 0.3750789, 0.1894642, 1, 1, 1, 1, 1,
0.8804744, -0.6325074, 2.819, 1, 1, 1, 1, 1,
0.8844801, 0.1976087, 2.290622, 1, 1, 1, 1, 1,
0.8913187, -0.1916305, 2.395325, 1, 1, 1, 1, 1,
0.8960004, 0.1721988, 1.203001, 1, 1, 1, 1, 1,
0.900805, -0.2036485, 3.292601, 0, 0, 1, 1, 1,
0.9010831, 1.696986, 0.2678315, 1, 0, 0, 1, 1,
0.904957, 1.826033, 2.584333, 1, 0, 0, 1, 1,
0.9096676, 0.5376174, 1.376723, 1, 0, 0, 1, 1,
0.9136688, 0.8334885, 0.4442281, 1, 0, 0, 1, 1,
0.9153671, 0.7621838, 0.9808833, 1, 0, 0, 1, 1,
0.918653, -0.1745631, 1.422058, 0, 0, 0, 1, 1,
0.9186562, -0.1583505, 0.8426043, 0, 0, 0, 1, 1,
0.9226822, -1.286087, 1.820882, 0, 0, 0, 1, 1,
0.9230911, 2.582968, 0.9571798, 0, 0, 0, 1, 1,
0.9231243, 1.19138, 0.04740901, 0, 0, 0, 1, 1,
0.9285328, -1.291443, 2.745849, 0, 0, 0, 1, 1,
0.931933, 1.043952, -0.2317644, 0, 0, 0, 1, 1,
0.9449407, 1.270566, 1.16408, 1, 1, 1, 1, 1,
0.9459231, 0.5738905, 3.961151, 1, 1, 1, 1, 1,
0.9463965, -1.394217, 2.574549, 1, 1, 1, 1, 1,
0.9473808, -0.2719546, 0.5639011, 1, 1, 1, 1, 1,
0.9503779, -0.7132181, 1.876456, 1, 1, 1, 1, 1,
0.9558374, -0.6630454, 2.003592, 1, 1, 1, 1, 1,
0.9577514, 0.7570098, 1.003971, 1, 1, 1, 1, 1,
0.9611921, -1.247255, 3.383937, 1, 1, 1, 1, 1,
0.9644415, -0.4600825, 0.6395615, 1, 1, 1, 1, 1,
0.9718252, 0.008659797, 4.892182, 1, 1, 1, 1, 1,
0.975183, 0.2891036, -1.327901, 1, 1, 1, 1, 1,
0.9756105, 1.116547, 1.280786, 1, 1, 1, 1, 1,
0.9910716, 0.2745851, 2.569046, 1, 1, 1, 1, 1,
1.008023, -1.360858, 2.571185, 1, 1, 1, 1, 1,
1.009379, -0.9067073, 2.163278, 1, 1, 1, 1, 1,
1.010721, 0.4207812, 1.473452, 0, 0, 1, 1, 1,
1.016752, -2.122488, 2.475829, 1, 0, 0, 1, 1,
1.019859, 0.4481939, 0.4797944, 1, 0, 0, 1, 1,
1.026817, 0.5574045, 1.545432, 1, 0, 0, 1, 1,
1.031917, 0.4713469, 1.42665, 1, 0, 0, 1, 1,
1.044935, -0.4721652, 2.592703, 1, 0, 0, 1, 1,
1.046165, -0.865365, 1.033328, 0, 0, 0, 1, 1,
1.046701, 1.020609, -0.6007963, 0, 0, 0, 1, 1,
1.046738, -0.9184681, 1.839841, 0, 0, 0, 1, 1,
1.049774, 1.4338, 1.354291, 0, 0, 0, 1, 1,
1.052387, -0.03131687, 1.950669, 0, 0, 0, 1, 1,
1.057764, 1.436623, -0.3163133, 0, 0, 0, 1, 1,
1.06049, 0.6963938, 2.909407, 0, 0, 0, 1, 1,
1.063217, -0.03391974, 0.7705576, 1, 1, 1, 1, 1,
1.064355, 0.2326267, 3.326805, 1, 1, 1, 1, 1,
1.071133, -0.2024613, 1.581008, 1, 1, 1, 1, 1,
1.074314, -0.7873772, 1.461677, 1, 1, 1, 1, 1,
1.079919, -1.102803, 2.060532, 1, 1, 1, 1, 1,
1.08426, -0.7822984, 1.181038, 1, 1, 1, 1, 1,
1.089234, -0.1482731, 1.09888, 1, 1, 1, 1, 1,
1.096317, -1.329121, 1.265131, 1, 1, 1, 1, 1,
1.098171, -0.1860592, 1.233733, 1, 1, 1, 1, 1,
1.10035, 1.848208, 0.5946353, 1, 1, 1, 1, 1,
1.108158, 0.169441, 2.350196, 1, 1, 1, 1, 1,
1.110911, 1.666481, 0.5266616, 1, 1, 1, 1, 1,
1.11617, 1.394175, 1.737601, 1, 1, 1, 1, 1,
1.118192, 0.9144425, 1.253612, 1, 1, 1, 1, 1,
1.120441, 1.973405, -0.8553538, 1, 1, 1, 1, 1,
1.122408, 1.008128, 1.113867, 0, 0, 1, 1, 1,
1.135247, -0.2756811, 2.201619, 1, 0, 0, 1, 1,
1.136775, -0.7691056, 0.180676, 1, 0, 0, 1, 1,
1.137425, -1.106717, 2.304878, 1, 0, 0, 1, 1,
1.139052, 1.489898, -0.4987468, 1, 0, 0, 1, 1,
1.146014, -0.5635297, 1.609597, 1, 0, 0, 1, 1,
1.152984, -1.022207, 1.698537, 0, 0, 0, 1, 1,
1.154452, 1.47316, 1.538652, 0, 0, 0, 1, 1,
1.156541, -0.3831845, 3.535047, 0, 0, 0, 1, 1,
1.158347, -0.101486, 1.721593, 0, 0, 0, 1, 1,
1.161985, 0.8319643, 0.3464655, 0, 0, 0, 1, 1,
1.162212, -0.5318114, 1.933825, 0, 0, 0, 1, 1,
1.164949, -0.3493154, 2.209432, 0, 0, 0, 1, 1,
1.1657, -0.01770345, 1.006471, 1, 1, 1, 1, 1,
1.166524, -0.1521948, 2.472959, 1, 1, 1, 1, 1,
1.175737, 0.3611801, 2.132308, 1, 1, 1, 1, 1,
1.181561, 1.281301, 3.744108, 1, 1, 1, 1, 1,
1.181716, -0.9753506, 1.289142, 1, 1, 1, 1, 1,
1.182745, 0.2003822, 1.556559, 1, 1, 1, 1, 1,
1.184486, -1.286263, 3.581363, 1, 1, 1, 1, 1,
1.1884, 1.437952, 1.553208, 1, 1, 1, 1, 1,
1.201469, -0.6863521, 0.1298269, 1, 1, 1, 1, 1,
1.20303, 0.1894732, 0.4839793, 1, 1, 1, 1, 1,
1.204938, 0.9520233, 1.251699, 1, 1, 1, 1, 1,
1.206642, 0.6712652, 1.148783, 1, 1, 1, 1, 1,
1.209002, 1.599298, 2.631617, 1, 1, 1, 1, 1,
1.210615, -0.5833162, 2.441588, 1, 1, 1, 1, 1,
1.212889, 0.2030587, 1.236551, 1, 1, 1, 1, 1,
1.213341, -0.7234162, 1.430941, 0, 0, 1, 1, 1,
1.216525, 1.392639, 0.4364698, 1, 0, 0, 1, 1,
1.217794, 2.299514, 0.291183, 1, 0, 0, 1, 1,
1.245314, -1.070994, 3.312268, 1, 0, 0, 1, 1,
1.246027, -0.4659052, 2.009867, 1, 0, 0, 1, 1,
1.252232, -0.5054168, 4.092013, 1, 0, 0, 1, 1,
1.253496, 1.349371, 0.2439429, 0, 0, 0, 1, 1,
1.25549, 1.232664, 2.728607, 0, 0, 0, 1, 1,
1.255966, -0.9865687, 1.968251, 0, 0, 0, 1, 1,
1.265679, -0.4926813, 1.340137, 0, 0, 0, 1, 1,
1.268459, 1.561299, 2.22364, 0, 0, 0, 1, 1,
1.270899, -0.02763933, 1.003272, 0, 0, 0, 1, 1,
1.273299, 0.6589577, -0.5514843, 0, 0, 0, 1, 1,
1.30295, 0.5166699, 1.259239, 1, 1, 1, 1, 1,
1.303173, -0.9522405, 3.59102, 1, 1, 1, 1, 1,
1.332026, 0.07155019, 2.0762, 1, 1, 1, 1, 1,
1.335036, -0.7055941, 1.370247, 1, 1, 1, 1, 1,
1.343583, 0.1677964, 1.074836, 1, 1, 1, 1, 1,
1.344902, -0.1366656, 1.686959, 1, 1, 1, 1, 1,
1.347551, 0.9790542, 1.246807, 1, 1, 1, 1, 1,
1.349916, -0.1928048, 2.424462, 1, 1, 1, 1, 1,
1.358401, 0.3265152, 0.167419, 1, 1, 1, 1, 1,
1.359173, -0.7243579, 2.420682, 1, 1, 1, 1, 1,
1.371741, -0.7569192, 1.64156, 1, 1, 1, 1, 1,
1.373118, 0.3444078, 3.828279, 1, 1, 1, 1, 1,
1.377575, 1.088946, 2.614951, 1, 1, 1, 1, 1,
1.380157, -0.1694208, -0.3771717, 1, 1, 1, 1, 1,
1.380301, 0.06175661, 2.228242, 1, 1, 1, 1, 1,
1.401902, -1.554319, 2.930813, 0, 0, 1, 1, 1,
1.417983, -0.7472464, 1.529412, 1, 0, 0, 1, 1,
1.427923, -1.65148, 4.400224, 1, 0, 0, 1, 1,
1.431126, -0.3188826, 2.169569, 1, 0, 0, 1, 1,
1.432827, 0.2981065, 2.542393, 1, 0, 0, 1, 1,
1.435938, -2.590639, 2.754479, 1, 0, 0, 1, 1,
1.438052, -2.885823, 3.149181, 0, 0, 0, 1, 1,
1.464153, -1.440568, 1.630709, 0, 0, 0, 1, 1,
1.471691, -1.460884, 1.11026, 0, 0, 0, 1, 1,
1.485652, 0.1256994, 1.344601, 0, 0, 0, 1, 1,
1.495464, -0.04349975, 0.8817618, 0, 0, 0, 1, 1,
1.509876, -3.025165, 2.881678, 0, 0, 0, 1, 1,
1.523751, 0.7145948, 1.254802, 0, 0, 0, 1, 1,
1.524959, 1.906065, 0.8940697, 1, 1, 1, 1, 1,
1.532136, -0.497858, 2.584722, 1, 1, 1, 1, 1,
1.543052, 1.203732, 0.9775116, 1, 1, 1, 1, 1,
1.545812, -0.2306821, 1.168544, 1, 1, 1, 1, 1,
1.558632, -0.2414553, 1.83796, 1, 1, 1, 1, 1,
1.561216, -0.7713957, 1.577757, 1, 1, 1, 1, 1,
1.605935, -0.5144526, 1.900926, 1, 1, 1, 1, 1,
1.635607, -0.5047453, 0.3879823, 1, 1, 1, 1, 1,
1.642438, -0.8510061, 1.550523, 1, 1, 1, 1, 1,
1.647261, 1.512277, 1.408277, 1, 1, 1, 1, 1,
1.657993, -0.4278884, 0.5667112, 1, 1, 1, 1, 1,
1.703827, -0.4513676, 3.358469, 1, 1, 1, 1, 1,
1.720841, 0.02005249, 1.038774, 1, 1, 1, 1, 1,
1.721091, -0.08198863, 1.584914, 1, 1, 1, 1, 1,
1.72897, 0.925304, 1.250445, 1, 1, 1, 1, 1,
1.741347, 1.15003, 1.404543, 0, 0, 1, 1, 1,
1.743383, 1.344642, 1.606619, 1, 0, 0, 1, 1,
1.756473, -1.161022, 2.366717, 1, 0, 0, 1, 1,
1.770472, 0.8436849, 0.1327289, 1, 0, 0, 1, 1,
1.790081, 1.755183, 1.69223, 1, 0, 0, 1, 1,
1.791137, -1.262818, 0.7632878, 1, 0, 0, 1, 1,
1.795469, 2.352626, 0.7878684, 0, 0, 0, 1, 1,
1.795908, 2.815488, -0.1020038, 0, 0, 0, 1, 1,
1.803115, -1.453829, 2.096421, 0, 0, 0, 1, 1,
1.864968, 0.3344173, -0.4238431, 0, 0, 0, 1, 1,
1.895711, 0.02184978, 2.617962, 0, 0, 0, 1, 1,
1.928918, -1.25709, -0.3874062, 0, 0, 0, 1, 1,
1.941486, -1.499596, 3.27649, 0, 0, 0, 1, 1,
1.944188, -0.8915859, 2.923091, 1, 1, 1, 1, 1,
1.958322, -0.1028592, 1.580801, 1, 1, 1, 1, 1,
1.958731, -0.69577, -0.1845779, 1, 1, 1, 1, 1,
1.959001, 0.9145427, 1.90932, 1, 1, 1, 1, 1,
1.962028, -0.5842202, 2.144346, 1, 1, 1, 1, 1,
1.962397, 1.248814, 1.043998, 1, 1, 1, 1, 1,
1.963397, 0.4829721, 0.7132802, 1, 1, 1, 1, 1,
1.966678, 0.3927842, 1.967012, 1, 1, 1, 1, 1,
1.967634, -0.7518679, 1.808901, 1, 1, 1, 1, 1,
1.968422, -0.6600149, 1.300974, 1, 1, 1, 1, 1,
1.994936, 0.6658889, 2.1263, 1, 1, 1, 1, 1,
1.998518, 0.01316232, 1.703169, 1, 1, 1, 1, 1,
2.002131, 0.2792003, 1.259259, 1, 1, 1, 1, 1,
2.047152, -0.5849317, 1.875425, 1, 1, 1, 1, 1,
2.063322, -0.3687825, 0.4959197, 1, 1, 1, 1, 1,
2.070564, -2.20864, 3.6429, 0, 0, 1, 1, 1,
2.075135, -0.5197225, 1.774398, 1, 0, 0, 1, 1,
2.096823, 2.17537, 0.6600891, 1, 0, 0, 1, 1,
2.110564, 0.3929418, 1.109307, 1, 0, 0, 1, 1,
2.173659, 0.4056569, 0.7030376, 1, 0, 0, 1, 1,
2.194699, -0.330339, 2.229358, 1, 0, 0, 1, 1,
2.26964, -0.2625507, 1.112733, 0, 0, 0, 1, 1,
2.269893, -0.7440953, 2.430563, 0, 0, 0, 1, 1,
2.292532, -0.8636592, 0.5142484, 0, 0, 0, 1, 1,
2.300259, -0.4936748, 2.703863, 0, 0, 0, 1, 1,
2.462309, 0.5874518, 1.140713, 0, 0, 0, 1, 1,
2.476455, -0.3309635, 2.264624, 0, 0, 0, 1, 1,
2.526913, 2.131324, 0.5207956, 0, 0, 0, 1, 1,
2.536176, 0.3152642, 1.515267, 1, 1, 1, 1, 1,
2.667907, -0.3494118, 1.405311, 1, 1, 1, 1, 1,
2.765062, 0.05529066, 0.6847932, 1, 1, 1, 1, 1,
2.848658, -0.1267639, 1.592027, 1, 1, 1, 1, 1,
2.900303, 0.3335501, 0.5799221, 1, 1, 1, 1, 1,
3.270617, -0.2448183, 1.209439, 1, 1, 1, 1, 1,
3.462379, 0.03607334, 0.6659153, 1, 1, 1, 1, 1
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
var radius = 9.298144;
var distance = 32.65934;
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
mvMatrix.translate( -0.1910112, 0.08407116, -0.01593089 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.65934);
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
