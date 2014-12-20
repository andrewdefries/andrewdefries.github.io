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
-3.065527, 0.9690452, -2.243835, 1, 0, 0, 1,
-3.011918, -0.8469371, -1.669929, 1, 0.007843138, 0, 1,
-2.708597, 1.178029, -1.601056, 1, 0.01176471, 0, 1,
-2.679446, 0.8196918, -1.67536, 1, 0.01960784, 0, 1,
-2.588801, 0.8668517, -2.478989, 1, 0.02352941, 0, 1,
-2.420924, 0.04954964, -1.649816, 1, 0.03137255, 0, 1,
-2.347946, 1.91216, -1.724235, 1, 0.03529412, 0, 1,
-2.332597, 1.248506, -0.798583, 1, 0.04313726, 0, 1,
-2.320117, 0.97642, -2.069525, 1, 0.04705882, 0, 1,
-2.242195, -1.079743, -1.973699, 1, 0.05490196, 0, 1,
-2.216046, 0.05903149, -1.343742, 1, 0.05882353, 0, 1,
-2.215351, 0.656167, -1.080243, 1, 0.06666667, 0, 1,
-2.208817, 0.9009134, 0.2488953, 1, 0.07058824, 0, 1,
-2.207083, -0.1544149, -4.983202, 1, 0.07843138, 0, 1,
-2.191904, -0.2248684, -0.8911331, 1, 0.08235294, 0, 1,
-2.179024, 2.604546, -0.7448048, 1, 0.09019608, 0, 1,
-2.166153, -0.4565552, -0.737012, 1, 0.09411765, 0, 1,
-2.153098, -0.2692564, -1.851175, 1, 0.1019608, 0, 1,
-2.133886, 2.33752, 0.005834406, 1, 0.1098039, 0, 1,
-2.112485, 0.2495217, -1.953545, 1, 0.1137255, 0, 1,
-2.092309, -0.6800417, -1.493601, 1, 0.1215686, 0, 1,
-2.082411, -0.4525386, -2.398854, 1, 0.1254902, 0, 1,
-2.023179, -0.9911808, -2.478, 1, 0.1333333, 0, 1,
-1.923544, 2.590101, -0.3525716, 1, 0.1372549, 0, 1,
-1.91689, -0.4331912, -1.398942, 1, 0.145098, 0, 1,
-1.90322, -1.203824, -1.49762, 1, 0.1490196, 0, 1,
-1.901368, -0.3633286, -1.806163, 1, 0.1568628, 0, 1,
-1.893941, -0.924886, -2.531268, 1, 0.1607843, 0, 1,
-1.864367, 0.1282284, -1.819838, 1, 0.1686275, 0, 1,
-1.854893, 1.826453, -0.5649775, 1, 0.172549, 0, 1,
-1.828932, -0.8412167, -2.650943, 1, 0.1803922, 0, 1,
-1.813268, -1.014446, -0.7818801, 1, 0.1843137, 0, 1,
-1.794284, -0.7305675, -1.948376, 1, 0.1921569, 0, 1,
-1.786308, 0.4392221, -0.7767413, 1, 0.1960784, 0, 1,
-1.785263, -1.634741, -0.07169304, 1, 0.2039216, 0, 1,
-1.764991, 0.7397825, -0.6766357, 1, 0.2117647, 0, 1,
-1.749788, 0.6773526, -1.978943, 1, 0.2156863, 0, 1,
-1.748239, -1.019564, -1.396186, 1, 0.2235294, 0, 1,
-1.747228, -0.6696761, -1.483798, 1, 0.227451, 0, 1,
-1.737199, 2.324423, -1.520889, 1, 0.2352941, 0, 1,
-1.712533, -0.8484152, -1.71778, 1, 0.2392157, 0, 1,
-1.70448, -1.327533, -1.321439, 1, 0.2470588, 0, 1,
-1.69899, -0.7127848, -2.353524, 1, 0.2509804, 0, 1,
-1.689326, 0.5470665, -2.164614, 1, 0.2588235, 0, 1,
-1.678774, 0.009424631, -0.3725267, 1, 0.2627451, 0, 1,
-1.669497, -1.103088, -2.104462, 1, 0.2705882, 0, 1,
-1.657124, 0.3462495, -0.8020416, 1, 0.2745098, 0, 1,
-1.65416, 0.2554511, 0.5250514, 1, 0.282353, 0, 1,
-1.653429, 1.367141, -2.925957, 1, 0.2862745, 0, 1,
-1.65328, 0.1730863, -1.817326, 1, 0.2941177, 0, 1,
-1.648342, -1.106395, -1.859834, 1, 0.3019608, 0, 1,
-1.642003, -0.01213284, -2.82978, 1, 0.3058824, 0, 1,
-1.640487, 0.3545657, -0.7808697, 1, 0.3137255, 0, 1,
-1.631726, -0.1705499, -2.013909, 1, 0.3176471, 0, 1,
-1.627246, 1.29892, -0.3780889, 1, 0.3254902, 0, 1,
-1.624555, -0.3408193, -2.35077, 1, 0.3294118, 0, 1,
-1.615985, 0.6168282, -1.193594, 1, 0.3372549, 0, 1,
-1.612318, 1.14543, -3.643293, 1, 0.3411765, 0, 1,
-1.610024, 0.06136392, -1.228515, 1, 0.3490196, 0, 1,
-1.608525, 1.683032, -1.581648, 1, 0.3529412, 0, 1,
-1.605161, -1.115786, 0.1190389, 1, 0.3607843, 0, 1,
-1.577362, -1.445263, -3.369009, 1, 0.3647059, 0, 1,
-1.567728, -0.4187244, -0.4612407, 1, 0.372549, 0, 1,
-1.55885, -1.427104, -4.48948, 1, 0.3764706, 0, 1,
-1.555129, 0.3929037, -2.215109, 1, 0.3843137, 0, 1,
-1.551919, 0.704281, -0.6038998, 1, 0.3882353, 0, 1,
-1.549401, 1.188743, -0.8570966, 1, 0.3960784, 0, 1,
-1.545365, 0.3727772, -0.05151546, 1, 0.4039216, 0, 1,
-1.535137, 0.1329241, -2.636802, 1, 0.4078431, 0, 1,
-1.534193, -0.9860963, -0.9119391, 1, 0.4156863, 0, 1,
-1.52929, -0.3456907, -1.193214, 1, 0.4196078, 0, 1,
-1.506756, -1.398248, -2.300149, 1, 0.427451, 0, 1,
-1.50579, -0.09584153, -2.63882, 1, 0.4313726, 0, 1,
-1.494059, -0.1683881, -1.164261, 1, 0.4392157, 0, 1,
-1.490194, 0.5798742, -2.205412, 1, 0.4431373, 0, 1,
-1.465437, -0.586119, -2.292322, 1, 0.4509804, 0, 1,
-1.462314, -1.624809, -1.195919, 1, 0.454902, 0, 1,
-1.456243, 0.2578662, -2.658628, 1, 0.4627451, 0, 1,
-1.452609, 2.725004, -1.537175, 1, 0.4666667, 0, 1,
-1.448028, 0.5435447, -0.836025, 1, 0.4745098, 0, 1,
-1.441364, -0.8448936, -1.758614, 1, 0.4784314, 0, 1,
-1.439957, -1.00171, -0.8819888, 1, 0.4862745, 0, 1,
-1.433189, -0.4411506, -1.409139, 1, 0.4901961, 0, 1,
-1.431695, 0.9714023, -0.3711267, 1, 0.4980392, 0, 1,
-1.420313, 0.06307761, -1.116543, 1, 0.5058824, 0, 1,
-1.417284, -0.4259855, -0.7399775, 1, 0.509804, 0, 1,
-1.410946, -0.1466428, -1.636966, 1, 0.5176471, 0, 1,
-1.407293, -0.9845307, -4.243249, 1, 0.5215687, 0, 1,
-1.405467, -0.5816258, -3.77256, 1, 0.5294118, 0, 1,
-1.399957, -0.18152, -2.659007, 1, 0.5333334, 0, 1,
-1.393562, -0.1320588, -0.9617212, 1, 0.5411765, 0, 1,
-1.373186, -0.3051978, -1.557712, 1, 0.5450981, 0, 1,
-1.370048, 0.621792, -1.063157, 1, 0.5529412, 0, 1,
-1.368563, -0.2200108, -1.18389, 1, 0.5568628, 0, 1,
-1.365088, 1.768038, -1.461008, 1, 0.5647059, 0, 1,
-1.364241, -0.3573206, -2.338218, 1, 0.5686275, 0, 1,
-1.359313, -1.634786, -4.792101, 1, 0.5764706, 0, 1,
-1.35416, -0.889553, -0.7953828, 1, 0.5803922, 0, 1,
-1.347118, 0.9315364, 0.410304, 1, 0.5882353, 0, 1,
-1.345061, -1.163008, -2.688057, 1, 0.5921569, 0, 1,
-1.342917, 1.167926, -1.559993, 1, 0.6, 0, 1,
-1.334612, -1.148255, -3.5664, 1, 0.6078432, 0, 1,
-1.330859, -1.54115, -2.24177, 1, 0.6117647, 0, 1,
-1.327364, -0.103126, -1.242442, 1, 0.6196079, 0, 1,
-1.304501, -0.483558, -2.492676, 1, 0.6235294, 0, 1,
-1.301497, -0.5338656, -0.6799709, 1, 0.6313726, 0, 1,
-1.294756, -0.9863204, -3.215822, 1, 0.6352941, 0, 1,
-1.28486, -0.6852066, -2.465806, 1, 0.6431373, 0, 1,
-1.280435, 0.2295202, -2.492792, 1, 0.6470588, 0, 1,
-1.267674, 0.7628793, -1.781618, 1, 0.654902, 0, 1,
-1.259092, 1.398072, 0.5950436, 1, 0.6588235, 0, 1,
-1.24579, 0.8390725, -0.6968981, 1, 0.6666667, 0, 1,
-1.239933, -0.01888112, -0.8631533, 1, 0.6705883, 0, 1,
-1.239652, -0.3314725, -1.602311, 1, 0.6784314, 0, 1,
-1.212692, 0.110724, 0.1353908, 1, 0.682353, 0, 1,
-1.210845, 0.01622801, -2.11785, 1, 0.6901961, 0, 1,
-1.210501, -0.1441515, -1.875406, 1, 0.6941177, 0, 1,
-1.209026, -1.832927, -4.53687, 1, 0.7019608, 0, 1,
-1.20809, -0.07485096, -2.959782, 1, 0.7098039, 0, 1,
-1.204249, -0.1781506, -1.261198, 1, 0.7137255, 0, 1,
-1.203105, 0.2888977, -3.567474, 1, 0.7215686, 0, 1,
-1.200751, -0.1158727, -0.5668973, 1, 0.7254902, 0, 1,
-1.198982, 0.1087121, -0.3604415, 1, 0.7333333, 0, 1,
-1.190402, 1.480765, -0.7363269, 1, 0.7372549, 0, 1,
-1.186545, -0.1061514, -1.010331, 1, 0.7450981, 0, 1,
-1.167596, 1.563217, -0.5511838, 1, 0.7490196, 0, 1,
-1.163029, 0.07952871, -0.3239958, 1, 0.7568628, 0, 1,
-1.162548, -0.4193363, -2.873746, 1, 0.7607843, 0, 1,
-1.160174, 0.7793216, -0.5225985, 1, 0.7686275, 0, 1,
-1.157109, -0.1859309, -2.116899, 1, 0.772549, 0, 1,
-1.148444, 0.5882169, -1.981279, 1, 0.7803922, 0, 1,
-1.141712, 0.6865405, -3.166433, 1, 0.7843137, 0, 1,
-1.139512, 0.749373, -0.5426282, 1, 0.7921569, 0, 1,
-1.130699, 1.078061, -0.3272526, 1, 0.7960784, 0, 1,
-1.129487, -0.9302659, -2.297784, 1, 0.8039216, 0, 1,
-1.127606, -1.608605, -2.909129, 1, 0.8117647, 0, 1,
-1.12719, 1.223243, -0.7110143, 1, 0.8156863, 0, 1,
-1.124058, -0.08983368, 0.09896473, 1, 0.8235294, 0, 1,
-1.123912, 0.5554926, -0.4895853, 1, 0.827451, 0, 1,
-1.120759, -0.4469117, -2.341442, 1, 0.8352941, 0, 1,
-1.114317, 1.689148, 0.3484712, 1, 0.8392157, 0, 1,
-1.100115, 0.2218991, -1.276315, 1, 0.8470588, 0, 1,
-1.098101, -0.7382982, -1.90178, 1, 0.8509804, 0, 1,
-1.094679, 0.6773853, -0.05481924, 1, 0.8588235, 0, 1,
-1.091799, 0.6950787, -1.567539, 1, 0.8627451, 0, 1,
-1.08825, -0.4184533, -3.2234, 1, 0.8705882, 0, 1,
-1.086077, 1.180976, -0.7710215, 1, 0.8745098, 0, 1,
-1.08126, 0.4707641, 0.2864731, 1, 0.8823529, 0, 1,
-1.080977, 0.4771319, -2.57221, 1, 0.8862745, 0, 1,
-1.077, -1.789699, -5.246066, 1, 0.8941177, 0, 1,
-1.076622, 0.2950225, -2.176706, 1, 0.8980392, 0, 1,
-1.075821, 0.2713318, 1.241501, 1, 0.9058824, 0, 1,
-1.075126, -0.1094531, -0.3683868, 1, 0.9137255, 0, 1,
-1.070476, -1.015972, -3.021049, 1, 0.9176471, 0, 1,
-1.068272, -0.4872022, -3.025693, 1, 0.9254902, 0, 1,
-1.06624, 1.100341, 0.06334323, 1, 0.9294118, 0, 1,
-1.064747, 0.3691134, -1.015142, 1, 0.9372549, 0, 1,
-1.052831, 0.3048289, -3.162414, 1, 0.9411765, 0, 1,
-1.046214, -0.2164111, -1.165433, 1, 0.9490196, 0, 1,
-1.034238, -1.024575, -2.959537, 1, 0.9529412, 0, 1,
-1.030248, 0.2805751, -0.2056178, 1, 0.9607843, 0, 1,
-1.02607, -0.08247933, -1.046686, 1, 0.9647059, 0, 1,
-1.02421, 0.6164906, -1.891607, 1, 0.972549, 0, 1,
-1.021685, -1.101529, -1.893686, 1, 0.9764706, 0, 1,
-1.017928, -0.8881693, -1.059294, 1, 0.9843137, 0, 1,
-1.017324, -0.4683882, -0.3767395, 1, 0.9882353, 0, 1,
-1.008524, 0.4060471, -3.129221, 1, 0.9960784, 0, 1,
-1.007548, -0.1898968, -1.769571, 0.9960784, 1, 0, 1,
-1.005002, 0.03291187, -1.129875, 0.9921569, 1, 0, 1,
-1.002417, -0.5451914, -0.958635, 0.9843137, 1, 0, 1,
-1.000583, 0.8694181, 1.067661, 0.9803922, 1, 0, 1,
-0.9873165, 0.9697893, -0.08046315, 0.972549, 1, 0, 1,
-0.9840184, 1.179791, -0.02939278, 0.9686275, 1, 0, 1,
-0.981735, 1.152148, -0.8403147, 0.9607843, 1, 0, 1,
-0.9740818, 0.4099566, 0.3816653, 0.9568627, 1, 0, 1,
-0.9567572, -1.657981, -1.746594, 0.9490196, 1, 0, 1,
-0.9555227, 0.2243129, -1.406863, 0.945098, 1, 0, 1,
-0.9480826, -1.805404, -1.966758, 0.9372549, 1, 0, 1,
-0.9466997, -0.9202326, -3.291219, 0.9333333, 1, 0, 1,
-0.9441012, -1.086873, -4.198183, 0.9254902, 1, 0, 1,
-0.9352333, 1.844362, -1.670091, 0.9215686, 1, 0, 1,
-0.9291455, 0.4206608, -0.833079, 0.9137255, 1, 0, 1,
-0.9266303, -2.225861, -0.4958624, 0.9098039, 1, 0, 1,
-0.9256374, 1.291949, 0.6466541, 0.9019608, 1, 0, 1,
-0.9251227, 0.4561982, -1.826824, 0.8941177, 1, 0, 1,
-0.9152787, 0.1228612, -1.49955, 0.8901961, 1, 0, 1,
-0.91222, 1.416472, -0.397525, 0.8823529, 1, 0, 1,
-0.902981, -0.4070423, -1.591345, 0.8784314, 1, 0, 1,
-0.900335, 0.875165, -1.894488, 0.8705882, 1, 0, 1,
-0.8976874, -1.387655, -3.450538, 0.8666667, 1, 0, 1,
-0.8974538, 1.03982, -0.1429305, 0.8588235, 1, 0, 1,
-0.895624, 0.6222473, 1.007747, 0.854902, 1, 0, 1,
-0.8933077, 1.236403, 0.5833724, 0.8470588, 1, 0, 1,
-0.8886254, 0.6056893, -2.612346, 0.8431373, 1, 0, 1,
-0.8865202, -0.176862, -3.614224, 0.8352941, 1, 0, 1,
-0.8796261, -1.026826, -1.939108, 0.8313726, 1, 0, 1,
-0.8791317, 0.7371535, -2.799339, 0.8235294, 1, 0, 1,
-0.8785061, -0.7100326, -3.224057, 0.8196079, 1, 0, 1,
-0.8769206, -2.558128, -2.882832, 0.8117647, 1, 0, 1,
-0.8768594, -1.2006, -2.266037, 0.8078431, 1, 0, 1,
-0.8716328, 0.9354757, -0.948512, 0.8, 1, 0, 1,
-0.8611466, 0.8630496, -0.620824, 0.7921569, 1, 0, 1,
-0.8530573, 0.08584736, -1.521123, 0.7882353, 1, 0, 1,
-0.850771, 3.111191, 0.4470804, 0.7803922, 1, 0, 1,
-0.8491952, -2.01483, -3.412005, 0.7764706, 1, 0, 1,
-0.8487909, -0.03364649, -0.9230415, 0.7686275, 1, 0, 1,
-0.8472872, -2.187364, -4.057752, 0.7647059, 1, 0, 1,
-0.845246, 0.7275842, -0.5282478, 0.7568628, 1, 0, 1,
-0.8450416, 0.6702117, -1.554698, 0.7529412, 1, 0, 1,
-0.843551, -0.7050117, -1.799588, 0.7450981, 1, 0, 1,
-0.8421113, -0.2255373, -1.250914, 0.7411765, 1, 0, 1,
-0.8388346, 0.2874537, 0.3441191, 0.7333333, 1, 0, 1,
-0.8331881, 0.009325008, -1.500113, 0.7294118, 1, 0, 1,
-0.8158208, -0.5878363, -4.07347, 0.7215686, 1, 0, 1,
-0.8102295, 0.2591842, -0.6250429, 0.7176471, 1, 0, 1,
-0.8049977, -0.8353586, -1.410971, 0.7098039, 1, 0, 1,
-0.8020611, -0.2639814, -1.945641, 0.7058824, 1, 0, 1,
-0.8000664, -0.0156309, -1.02056, 0.6980392, 1, 0, 1,
-0.7899239, -0.5339963, -3.269702, 0.6901961, 1, 0, 1,
-0.7841134, 2.224989, -1.00735, 0.6862745, 1, 0, 1,
-0.7757365, -0.3562081, -2.593456, 0.6784314, 1, 0, 1,
-0.7738369, -0.1141378, -0.6283105, 0.6745098, 1, 0, 1,
-0.7687338, 0.4876903, -0.9992584, 0.6666667, 1, 0, 1,
-0.7549552, 0.7831725, -1.654577, 0.6627451, 1, 0, 1,
-0.7541667, -1.44848, -0.9179544, 0.654902, 1, 0, 1,
-0.7530621, -0.2307107, -1.933433, 0.6509804, 1, 0, 1,
-0.75004, -0.6710918, -2.642415, 0.6431373, 1, 0, 1,
-0.7491268, -2.718699, -3.139573, 0.6392157, 1, 0, 1,
-0.743129, -0.8455941, -2.740423, 0.6313726, 1, 0, 1,
-0.7406707, -0.5619403, -2.019069, 0.627451, 1, 0, 1,
-0.7323574, 0.9510597, -1.280636, 0.6196079, 1, 0, 1,
-0.7298105, -0.6521519, -2.440764, 0.6156863, 1, 0, 1,
-0.71764, -0.3383609, -1.264226, 0.6078432, 1, 0, 1,
-0.7167678, -1.912455, -2.97599, 0.6039216, 1, 0, 1,
-0.7144868, 0.7796484, -1.682677, 0.5960785, 1, 0, 1,
-0.7129728, 0.005314572, -1.032318, 0.5882353, 1, 0, 1,
-0.7129343, -0.4971841, -1.315275, 0.5843138, 1, 0, 1,
-0.7082741, -0.5692071, -2.827004, 0.5764706, 1, 0, 1,
-0.7082511, -0.4827912, -1.6986, 0.572549, 1, 0, 1,
-0.7078477, 1.006104, -1.745602, 0.5647059, 1, 0, 1,
-0.6986615, 1.282438, 0.07074353, 0.5607843, 1, 0, 1,
-0.6933185, -0.2223478, -2.688274, 0.5529412, 1, 0, 1,
-0.6906344, -0.1111544, -1.707195, 0.5490196, 1, 0, 1,
-0.6855822, -1.185413, -2.629848, 0.5411765, 1, 0, 1,
-0.6855509, -0.617583, -2.361514, 0.5372549, 1, 0, 1,
-0.6840488, 0.04599254, -2.272243, 0.5294118, 1, 0, 1,
-0.6801959, -1.087247, -1.332228, 0.5254902, 1, 0, 1,
-0.6792325, -0.2182839, -2.290838, 0.5176471, 1, 0, 1,
-0.6790237, -1.163205, -1.582283, 0.5137255, 1, 0, 1,
-0.6786539, 0.8055843, -0.04735025, 0.5058824, 1, 0, 1,
-0.6779638, 0.09046656, -3.467544, 0.5019608, 1, 0, 1,
-0.6771199, -0.3589629, -1.203381, 0.4941176, 1, 0, 1,
-0.6728176, 1.002295, -1.653774, 0.4862745, 1, 0, 1,
-0.6663766, -1.408825, -4.016724, 0.4823529, 1, 0, 1,
-0.6655483, -0.4479003, -0.8685955, 0.4745098, 1, 0, 1,
-0.6641991, -0.08215826, -1.655947, 0.4705882, 1, 0, 1,
-0.652733, -0.06113246, -1.630556, 0.4627451, 1, 0, 1,
-0.6456034, 0.0841172, 0.3433047, 0.4588235, 1, 0, 1,
-0.6393968, 0.8258332, -1.073345, 0.4509804, 1, 0, 1,
-0.6380202, -0.4207146, -1.036495, 0.4470588, 1, 0, 1,
-0.6372151, 2.333174, -0.28412, 0.4392157, 1, 0, 1,
-0.6329103, 2.156606, -0.1421218, 0.4352941, 1, 0, 1,
-0.6315325, -1.238544, -1.654396, 0.427451, 1, 0, 1,
-0.6290371, -0.174945, -1.927186, 0.4235294, 1, 0, 1,
-0.6218784, -1.114823, -1.830679, 0.4156863, 1, 0, 1,
-0.6213976, -1.405124, -2.593023, 0.4117647, 1, 0, 1,
-0.6207978, 1.064975, -1.741784, 0.4039216, 1, 0, 1,
-0.6184703, -1.999175, -5.31624, 0.3960784, 1, 0, 1,
-0.617551, -1.939814, -3.786009, 0.3921569, 1, 0, 1,
-0.6155016, 0.4270036, -1.021233, 0.3843137, 1, 0, 1,
-0.6104236, -1.67698, -2.574233, 0.3803922, 1, 0, 1,
-0.608412, -2.754905, -3.466972, 0.372549, 1, 0, 1,
-0.6074034, -0.5759868, -3.505991, 0.3686275, 1, 0, 1,
-0.6053098, -1.004475, -2.274838, 0.3607843, 1, 0, 1,
-0.6028973, 0.362633, -2.091379, 0.3568628, 1, 0, 1,
-0.6026146, -0.4049098, -1.892797, 0.3490196, 1, 0, 1,
-0.6022782, -0.08585891, -1.258516, 0.345098, 1, 0, 1,
-0.60001, -0.9438562, -1.301288, 0.3372549, 1, 0, 1,
-0.5997408, -0.3743657, -1.676061, 0.3333333, 1, 0, 1,
-0.5991735, 0.3721643, -0.6387908, 0.3254902, 1, 0, 1,
-0.5978435, 0.002910692, -1.258286, 0.3215686, 1, 0, 1,
-0.595286, 0.7319707, -1.34618, 0.3137255, 1, 0, 1,
-0.5880835, -1.10669, -4.336257, 0.3098039, 1, 0, 1,
-0.5845186, 1.731648, -0.9942362, 0.3019608, 1, 0, 1,
-0.583266, 0.2137724, -0.2771298, 0.2941177, 1, 0, 1,
-0.5807537, 0.929651, -1.828643, 0.2901961, 1, 0, 1,
-0.5789792, -0.7802436, -2.544404, 0.282353, 1, 0, 1,
-0.5787243, -0.1129644, -2.690828, 0.2784314, 1, 0, 1,
-0.5764396, -0.876419, -2.923204, 0.2705882, 1, 0, 1,
-0.5753124, -1.872913, -2.217542, 0.2666667, 1, 0, 1,
-0.5751659, -1.410045, -3.093272, 0.2588235, 1, 0, 1,
-0.5749488, -0.01117027, -1.769429, 0.254902, 1, 0, 1,
-0.5726767, -1.423293, -2.425553, 0.2470588, 1, 0, 1,
-0.5678799, -0.8690912, -3.842172, 0.2431373, 1, 0, 1,
-0.5674314, 0.5147751, -1.22471, 0.2352941, 1, 0, 1,
-0.565955, -0.009251085, -1.67201, 0.2313726, 1, 0, 1,
-0.5653888, -1.057452, -2.066974, 0.2235294, 1, 0, 1,
-0.5650496, 0.1589522, -1.317519, 0.2196078, 1, 0, 1,
-0.5627767, 0.2189354, -1.587222, 0.2117647, 1, 0, 1,
-0.557862, 1.382573, -0.2254418, 0.2078431, 1, 0, 1,
-0.5535285, 0.205414, 0.367472, 0.2, 1, 0, 1,
-0.552879, 0.4171534, 0.5697761, 0.1921569, 1, 0, 1,
-0.5481442, 0.5882925, -0.6628742, 0.1882353, 1, 0, 1,
-0.5455551, -0.07986274, -1.909419, 0.1803922, 1, 0, 1,
-0.544262, -0.02932948, -2.501415, 0.1764706, 1, 0, 1,
-0.5393347, 0.4774319, 0.6694351, 0.1686275, 1, 0, 1,
-0.5336183, -0.4342269, -2.108396, 0.1647059, 1, 0, 1,
-0.5292749, -0.1603954, -1.088789, 0.1568628, 1, 0, 1,
-0.5288266, -0.4806875, -2.579661, 0.1529412, 1, 0, 1,
-0.5279265, 0.4076994, -2.146418, 0.145098, 1, 0, 1,
-0.5246106, 1.299849, -1.30697, 0.1411765, 1, 0, 1,
-0.5242085, 0.2386413, -2.312713, 0.1333333, 1, 0, 1,
-0.5237154, -0.06054961, -3.034155, 0.1294118, 1, 0, 1,
-0.5208438, 2.474589, -1.300576, 0.1215686, 1, 0, 1,
-0.5195262, 0.7730775, 0.5584378, 0.1176471, 1, 0, 1,
-0.5185627, -0.1531214, -4.410689, 0.1098039, 1, 0, 1,
-0.5183524, -0.314898, -2.355819, 0.1058824, 1, 0, 1,
-0.5180849, 0.6354474, -1.032979, 0.09803922, 1, 0, 1,
-0.5120661, 0.2198018, -0.8370757, 0.09019608, 1, 0, 1,
-0.5089055, -0.01292634, -2.545312, 0.08627451, 1, 0, 1,
-0.5082173, -1.481391, -2.114788, 0.07843138, 1, 0, 1,
-0.4965204, -0.308974, -2.379219, 0.07450981, 1, 0, 1,
-0.49609, -0.07210197, -1.251623, 0.06666667, 1, 0, 1,
-0.4916569, 0.7060735, -0.6591215, 0.0627451, 1, 0, 1,
-0.4901502, -0.2331395, -3.827356, 0.05490196, 1, 0, 1,
-0.4887445, 0.4857627, 0.04472983, 0.05098039, 1, 0, 1,
-0.4886201, -0.1832141, -2.871919, 0.04313726, 1, 0, 1,
-0.4858648, -0.3304651, -4.328663, 0.03921569, 1, 0, 1,
-0.4833251, -0.650398, -1.34901, 0.03137255, 1, 0, 1,
-0.4824281, 2.076471, -0.3359466, 0.02745098, 1, 0, 1,
-0.4801889, -0.03815346, -0.8967429, 0.01960784, 1, 0, 1,
-0.4774527, 1.105212, -0.9988427, 0.01568628, 1, 0, 1,
-0.4767559, 0.4238384, -0.4087784, 0.007843138, 1, 0, 1,
-0.4760671, 1.212923, -1.959213, 0.003921569, 1, 0, 1,
-0.4645108, -0.2897338, -1.730969, 0, 1, 0.003921569, 1,
-0.460633, 0.3747421, -0.924095, 0, 1, 0.01176471, 1,
-0.459498, 1.679125, 2.564085, 0, 1, 0.01568628, 1,
-0.4575564, 0.2509019, -0.5806813, 0, 1, 0.02352941, 1,
-0.4521315, -1.070799, -3.915578, 0, 1, 0.02745098, 1,
-0.4520879, -0.8216379, -2.40137, 0, 1, 0.03529412, 1,
-0.4397925, 1.399234, -0.1799017, 0, 1, 0.03921569, 1,
-0.4396312, 0.4119035, -2.155515, 0, 1, 0.04705882, 1,
-0.4375345, -0.4766443, -2.974725, 0, 1, 0.05098039, 1,
-0.432683, 1.456367, 1.421774, 0, 1, 0.05882353, 1,
-0.4314874, -0.1193686, -4.150669, 0, 1, 0.0627451, 1,
-0.4291633, -1.314545, -3.963703, 0, 1, 0.07058824, 1,
-0.425988, 0.2477186, 0.09059165, 0, 1, 0.07450981, 1,
-0.4241863, 2.008447, 0.9496927, 0, 1, 0.08235294, 1,
-0.4239964, 0.04753821, -0.8765048, 0, 1, 0.08627451, 1,
-0.422803, 0.4080154, -0.9328749, 0, 1, 0.09411765, 1,
-0.4217398, 0.1652378, -1.060833, 0, 1, 0.1019608, 1,
-0.4206357, 0.4527701, -0.3520898, 0, 1, 0.1058824, 1,
-0.4155343, -2.02394, -2.787283, 0, 1, 0.1137255, 1,
-0.4132005, -0.4464449, -1.88435, 0, 1, 0.1176471, 1,
-0.4098337, 2.39828, 1.887801, 0, 1, 0.1254902, 1,
-0.4072626, -1.146771, -3.646631, 0, 1, 0.1294118, 1,
-0.4065085, 0.4460549, -1.616316, 0, 1, 0.1372549, 1,
-0.4034567, 0.3348354, -1.637181, 0, 1, 0.1411765, 1,
-0.4028221, 0.7521056, -2.104171, 0, 1, 0.1490196, 1,
-0.4012655, 2.178418, -1.229525, 0, 1, 0.1529412, 1,
-0.4006662, 0.5498077, -0.9064281, 0, 1, 0.1607843, 1,
-0.4003025, 0.2696353, -1.674625, 0, 1, 0.1647059, 1,
-0.3949411, -0.09327218, -2.505688, 0, 1, 0.172549, 1,
-0.392301, 1.13215, -1.786333, 0, 1, 0.1764706, 1,
-0.3912004, -0.3220415, -3.616299, 0, 1, 0.1843137, 1,
-0.3872978, -0.566971, -3.385962, 0, 1, 0.1882353, 1,
-0.3850287, -0.7217491, -4.096861, 0, 1, 0.1960784, 1,
-0.3848599, -0.4434684, -2.139605, 0, 1, 0.2039216, 1,
-0.3823242, -1.33288, -2.300677, 0, 1, 0.2078431, 1,
-0.3647954, -1.445268, -0.9911923, 0, 1, 0.2156863, 1,
-0.3598493, 1.770346, 0.2111755, 0, 1, 0.2196078, 1,
-0.3593639, -0.7205499, -2.912871, 0, 1, 0.227451, 1,
-0.3576581, 0.08418145, -0.885108, 0, 1, 0.2313726, 1,
-0.3566914, 0.7271981, -1.187405, 0, 1, 0.2392157, 1,
-0.351715, 0.833452, 0.3539046, 0, 1, 0.2431373, 1,
-0.3504577, 1.287064, -0.6253983, 0, 1, 0.2509804, 1,
-0.3472395, -0.5865293, -3.685895, 0, 1, 0.254902, 1,
-0.3451494, -0.5671209, -1.756392, 0, 1, 0.2627451, 1,
-0.3433656, -0.01996364, -1.627769, 0, 1, 0.2666667, 1,
-0.3406434, 0.5080821, -0.2398021, 0, 1, 0.2745098, 1,
-0.3402866, -0.05361057, -1.710721, 0, 1, 0.2784314, 1,
-0.3370211, 0.3563446, -0.3340188, 0, 1, 0.2862745, 1,
-0.3302733, 1.009348, 1.522101, 0, 1, 0.2901961, 1,
-0.3267644, -1.060242, -2.605153, 0, 1, 0.2980392, 1,
-0.3263225, -0.8857126, -3.193336, 0, 1, 0.3058824, 1,
-0.3237149, -0.5650128, -3.520259, 0, 1, 0.3098039, 1,
-0.3179699, -1.627695, -2.368448, 0, 1, 0.3176471, 1,
-0.3179581, -2.741127, -1.806216, 0, 1, 0.3215686, 1,
-0.3145131, -1.128396, -2.358849, 0, 1, 0.3294118, 1,
-0.311699, -0.2227019, -1.937832, 0, 1, 0.3333333, 1,
-0.310401, 0.6443345, -0.4350086, 0, 1, 0.3411765, 1,
-0.3063638, 0.7271855, -0.3126345, 0, 1, 0.345098, 1,
-0.2982948, -0.4316846, -3.29426, 0, 1, 0.3529412, 1,
-0.2956439, 0.9606019, -0.2435144, 0, 1, 0.3568628, 1,
-0.2950976, -1.543524, -1.242181, 0, 1, 0.3647059, 1,
-0.2938273, -0.1036216, -2.722302, 0, 1, 0.3686275, 1,
-0.2870608, 1.365898, -0.4286281, 0, 1, 0.3764706, 1,
-0.2848232, -0.7358481, -3.25958, 0, 1, 0.3803922, 1,
-0.2811538, 1.036693, 0.2858211, 0, 1, 0.3882353, 1,
-0.2800764, -0.208453, -2.842297, 0, 1, 0.3921569, 1,
-0.2794727, -0.1440055, -1.678684, 0, 1, 0.4, 1,
-0.2762569, -0.9089746, -3.497758, 0, 1, 0.4078431, 1,
-0.2722903, 1.32106, 0.8544714, 0, 1, 0.4117647, 1,
-0.2603461, -0.3789084, -1.485672, 0, 1, 0.4196078, 1,
-0.2589966, 1.791271, 0.4612868, 0, 1, 0.4235294, 1,
-0.2552073, 0.2880764, -2.770463, 0, 1, 0.4313726, 1,
-0.2541009, 0.1668001, 0.3868121, 0, 1, 0.4352941, 1,
-0.2513077, 0.047158, -2.220833, 0, 1, 0.4431373, 1,
-0.2470071, -0.8292254, -2.792769, 0, 1, 0.4470588, 1,
-0.2455062, -0.7732462, -2.585717, 0, 1, 0.454902, 1,
-0.243881, -2.191883, -3.976945, 0, 1, 0.4588235, 1,
-0.2402666, -1.276163, -3.61537, 0, 1, 0.4666667, 1,
-0.2333135, 0.69699, -0.09262228, 0, 1, 0.4705882, 1,
-0.2230441, 1.381262, 0.07931806, 0, 1, 0.4784314, 1,
-0.2210802, 0.3002343, 0.2666512, 0, 1, 0.4823529, 1,
-0.2192233, 0.08386231, 0.3560385, 0, 1, 0.4901961, 1,
-0.2185867, 0.5999635, 1.604937, 0, 1, 0.4941176, 1,
-0.2172032, -0.7816371, -2.381781, 0, 1, 0.5019608, 1,
-0.2126015, -0.01710347, -2.625536, 0, 1, 0.509804, 1,
-0.2102313, -1.056459, -1.909526, 0, 1, 0.5137255, 1,
-0.2100241, -0.7067055, -3.228167, 0, 1, 0.5215687, 1,
-0.2051488, 0.8943093, -1.040962, 0, 1, 0.5254902, 1,
-0.2038415, 0.6457571, 0.4706646, 0, 1, 0.5333334, 1,
-0.1992847, -0.705891, -3.213361, 0, 1, 0.5372549, 1,
-0.1970502, 1.280847, -0.5556382, 0, 1, 0.5450981, 1,
-0.1912717, 1.238707, -0.4522513, 0, 1, 0.5490196, 1,
-0.1897112, -0.5604481, -4.259565, 0, 1, 0.5568628, 1,
-0.1867554, 0.2180275, -1.796145, 0, 1, 0.5607843, 1,
-0.186374, -0.7456272, -1.174473, 0, 1, 0.5686275, 1,
-0.1846021, 1.198265, 0.8734643, 0, 1, 0.572549, 1,
-0.1843096, -0.108086, -2.965275, 0, 1, 0.5803922, 1,
-0.182228, 1.922388, -0.5632277, 0, 1, 0.5843138, 1,
-0.1821014, -1.003885, -3.553643, 0, 1, 0.5921569, 1,
-0.1781247, 0.5680597, -0.8558677, 0, 1, 0.5960785, 1,
-0.1764199, 1.208354, 1.389968, 0, 1, 0.6039216, 1,
-0.1702182, 0.3999186, 0.02811989, 0, 1, 0.6117647, 1,
-0.1689336, -0.7206762, -3.031835, 0, 1, 0.6156863, 1,
-0.1634662, -0.3170435, -2.817871, 0, 1, 0.6235294, 1,
-0.1634632, -0.9129304, -2.434234, 0, 1, 0.627451, 1,
-0.1618677, -0.7866123, -3.356875, 0, 1, 0.6352941, 1,
-0.1606386, -1.888812, -2.552608, 0, 1, 0.6392157, 1,
-0.1565542, 0.4240672, 0.2084461, 0, 1, 0.6470588, 1,
-0.1551426, -0.07024712, -1.076434, 0, 1, 0.6509804, 1,
-0.1515111, 0.0319238, -0.3433009, 0, 1, 0.6588235, 1,
-0.1441575, -0.7423174, -0.8077449, 0, 1, 0.6627451, 1,
-0.1396911, 0.6355567, -1.524063, 0, 1, 0.6705883, 1,
-0.1382404, -1.729921, -3.787805, 0, 1, 0.6745098, 1,
-0.1237612, 0.8218462, -0.3159959, 0, 1, 0.682353, 1,
-0.1226644, -0.1094384, -3.173209, 0, 1, 0.6862745, 1,
-0.1216673, 1.460223, 0.1145398, 0, 1, 0.6941177, 1,
-0.1211068, -1.309064, -1.733332, 0, 1, 0.7019608, 1,
-0.1191085, -1.331313, -5.289434, 0, 1, 0.7058824, 1,
-0.1169082, -0.1634461, -1.081847, 0, 1, 0.7137255, 1,
-0.1133611, -0.2746537, -2.208256, 0, 1, 0.7176471, 1,
-0.1101802, -0.4830835, -3.762627, 0, 1, 0.7254902, 1,
-0.1094125, 1.554434, 0.9338844, 0, 1, 0.7294118, 1,
-0.1065973, -0.3476676, -1.802138, 0, 1, 0.7372549, 1,
-0.1025284, 0.1487018, -0.7024189, 0, 1, 0.7411765, 1,
-0.09806909, -0.3720824, -4.501803, 0, 1, 0.7490196, 1,
-0.09721553, -0.3542933, -2.512184, 0, 1, 0.7529412, 1,
-0.09106941, -1.653404, -2.753007, 0, 1, 0.7607843, 1,
-0.08787181, 1.164166, 1.406342, 0, 1, 0.7647059, 1,
-0.08741101, 0.1839222, 2.036943, 0, 1, 0.772549, 1,
-0.08488987, 0.4399799, 1.298895, 0, 1, 0.7764706, 1,
-0.08257597, -0.9604829, -3.153189, 0, 1, 0.7843137, 1,
-0.082331, 0.5611879, 0.256807, 0, 1, 0.7882353, 1,
-0.08205826, -0.9952964, -2.471927, 0, 1, 0.7960784, 1,
-0.08197164, -0.8599182, -3.880898, 0, 1, 0.8039216, 1,
-0.08135931, 0.6353061, 1.211999, 0, 1, 0.8078431, 1,
-0.07711031, -1.700948, -3.408352, 0, 1, 0.8156863, 1,
-0.07692634, -0.2254298, -3.04222, 0, 1, 0.8196079, 1,
-0.074037, 0.09069628, -0.891696, 0, 1, 0.827451, 1,
-0.07314042, -0.2133428, -2.754056, 0, 1, 0.8313726, 1,
-0.07224465, -0.07282421, -2.398047, 0, 1, 0.8392157, 1,
-0.07085583, -0.8331169, -2.380692, 0, 1, 0.8431373, 1,
-0.07083262, -1.244623, -2.974143, 0, 1, 0.8509804, 1,
-0.06849188, -0.6194175, -3.156389, 0, 1, 0.854902, 1,
-0.06611475, 0.3657426, 0.1293684, 0, 1, 0.8627451, 1,
-0.06530057, 0.5347946, 0.5930276, 0, 1, 0.8666667, 1,
-0.06348439, -0.915526, -2.223826, 0, 1, 0.8745098, 1,
-0.06046047, -0.9333237, -2.828798, 0, 1, 0.8784314, 1,
-0.05357305, 0.8685037, -0.4718307, 0, 1, 0.8862745, 1,
-0.05158245, -0.0259227, -1.008063, 0, 1, 0.8901961, 1,
-0.05113075, -2.36085, -2.774981, 0, 1, 0.8980392, 1,
-0.04827627, 0.8805301, -0.3751232, 0, 1, 0.9058824, 1,
-0.04677432, -0.6352159, -4.099572, 0, 1, 0.9098039, 1,
-0.04271599, 0.4964333, -1.227793, 0, 1, 0.9176471, 1,
-0.03949558, 0.206591, 0.3014441, 0, 1, 0.9215686, 1,
-0.03583492, 0.8939364, 0.5398059, 0, 1, 0.9294118, 1,
-0.03225504, -0.4508459, -1.946133, 0, 1, 0.9333333, 1,
-0.03146276, -0.4920245, -2.625706, 0, 1, 0.9411765, 1,
-0.02976393, -0.453069, -1.961405, 0, 1, 0.945098, 1,
-0.02865015, 0.427558, 1.588366, 0, 1, 0.9529412, 1,
-0.0276663, 0.6704372, 1.387257, 0, 1, 0.9568627, 1,
-0.0240428, 0.7288172, -0.3681282, 0, 1, 0.9647059, 1,
-0.02183677, 1.713183, -0.7171425, 0, 1, 0.9686275, 1,
-0.01635905, -0.1537772, -2.856851, 0, 1, 0.9764706, 1,
-0.01599364, -0.5179349, -5.160273, 0, 1, 0.9803922, 1,
-0.01527163, -0.1666358, -3.172009, 0, 1, 0.9882353, 1,
-0.01484352, -2.076676, -3.082531, 0, 1, 0.9921569, 1,
-0.0134146, -2.072409, -4.628926, 0, 1, 1, 1,
-0.01306847, 1.473699, 1.127749, 0, 0.9921569, 1, 1,
-0.01237888, -1.07926, -3.417457, 0, 0.9882353, 1, 1,
-0.01200042, -0.1923016, -1.753383, 0, 0.9803922, 1, 1,
-0.01091544, 0.2955099, -0.3643141, 0, 0.9764706, 1, 1,
-0.008830395, -0.1364954, -4.030249, 0, 0.9686275, 1, 1,
-0.003794443, -1.057117, -3.880724, 0, 0.9647059, 1, 1,
-0.002523988, -1.117452, -2.78117, 0, 0.9568627, 1, 1,
-0.002358641, -1.362547, -2.865183, 0, 0.9529412, 1, 1,
-0.00143156, -0.5707429, -3.020796, 0, 0.945098, 1, 1,
-0.0001509294, 0.7410055, -0.3266183, 0, 0.9411765, 1, 1,
0.006855609, -0.5732815, 3.4634, 0, 0.9333333, 1, 1,
0.0157422, -0.5811436, 3.448768, 0, 0.9294118, 1, 1,
0.01588511, -0.3791819, 2.345538, 0, 0.9215686, 1, 1,
0.01652953, 0.3230338, -0.3060142, 0, 0.9176471, 1, 1,
0.01750923, 0.4227108, 0.9559909, 0, 0.9098039, 1, 1,
0.01757199, 0.5933244, 1.824735, 0, 0.9058824, 1, 1,
0.02123486, 0.4645483, -0.3664173, 0, 0.8980392, 1, 1,
0.02839402, 0.8212651, 0.7424414, 0, 0.8901961, 1, 1,
0.03492352, -1.005344, 2.951517, 0, 0.8862745, 1, 1,
0.03624411, 2.386799, 0.4009018, 0, 0.8784314, 1, 1,
0.03781589, -0.03237, 2.738397, 0, 0.8745098, 1, 1,
0.04115468, 0.03588859, 1.604354, 0, 0.8666667, 1, 1,
0.04206236, 0.563579, -0.5045974, 0, 0.8627451, 1, 1,
0.04449552, 0.7686194, 0.4780066, 0, 0.854902, 1, 1,
0.044876, -0.6473433, 3.437443, 0, 0.8509804, 1, 1,
0.04723556, 1.41178, -0.03446541, 0, 0.8431373, 1, 1,
0.05176208, 2.610757, -0.3956488, 0, 0.8392157, 1, 1,
0.06025063, -0.5807769, 4.35302, 0, 0.8313726, 1, 1,
0.06063994, -0.4797584, 3.934085, 0, 0.827451, 1, 1,
0.06125478, -0.04673066, 2.147905, 0, 0.8196079, 1, 1,
0.06929492, 0.1410459, 0.391139, 0, 0.8156863, 1, 1,
0.0702882, -1.013653, 4.343501, 0, 0.8078431, 1, 1,
0.07596523, 0.6607013, 0.8335264, 0, 0.8039216, 1, 1,
0.0776104, -1.335163, 2.437541, 0, 0.7960784, 1, 1,
0.07824837, -0.7801192, -0.06656791, 0, 0.7882353, 1, 1,
0.07937239, -1.397091, 2.255973, 0, 0.7843137, 1, 1,
0.0801516, 1.581405, 0.5572424, 0, 0.7764706, 1, 1,
0.08069506, 1.006912, -0.5468218, 0, 0.772549, 1, 1,
0.08142027, -1.347343, 4.050559, 0, 0.7647059, 1, 1,
0.08312584, 0.2309157, -0.5979918, 0, 0.7607843, 1, 1,
0.09029604, 0.3282636, 0.5280411, 0, 0.7529412, 1, 1,
0.0906233, 0.993652, -0.4110944, 0, 0.7490196, 1, 1,
0.09361818, -0.884436, 2.340558, 0, 0.7411765, 1, 1,
0.09543503, 1.758209, -1.090701, 0, 0.7372549, 1, 1,
0.09680134, 0.4102863, 0.5799843, 0, 0.7294118, 1, 1,
0.09820963, -0.822553, 0.3005729, 0, 0.7254902, 1, 1,
0.09852219, -1.003198, 3.421829, 0, 0.7176471, 1, 1,
0.1056479, -1.43302, 3.887856, 0, 0.7137255, 1, 1,
0.1080207, -0.3525714, 2.43725, 0, 0.7058824, 1, 1,
0.1097361, 0.1763567, 0.463107, 0, 0.6980392, 1, 1,
0.1110912, 0.7950734, -0.4828652, 0, 0.6941177, 1, 1,
0.1120507, 0.4639917, 0.7887317, 0, 0.6862745, 1, 1,
0.1130811, -0.9702863, 3.906699, 0, 0.682353, 1, 1,
0.115348, -0.6895723, 3.095243, 0, 0.6745098, 1, 1,
0.1175258, -0.6202025, 4.382356, 0, 0.6705883, 1, 1,
0.1217273, 0.3583948, -0.03897622, 0, 0.6627451, 1, 1,
0.1240675, -1.155886, 3.830675, 0, 0.6588235, 1, 1,
0.1244986, -0.06966823, 1.755887, 0, 0.6509804, 1, 1,
0.1250507, 1.964846, 0.242906, 0, 0.6470588, 1, 1,
0.1348453, 0.006347632, 2.244667, 0, 0.6392157, 1, 1,
0.137416, 0.01347984, 1.840283, 0, 0.6352941, 1, 1,
0.1379834, 0.801308, 0.1693827, 0, 0.627451, 1, 1,
0.1382676, 0.3362781, 0.5356032, 0, 0.6235294, 1, 1,
0.1414964, 1.282436, 0.02571911, 0, 0.6156863, 1, 1,
0.1422835, -0.8186505, 2.685491, 0, 0.6117647, 1, 1,
0.1434444, -1.400257, 3.141799, 0, 0.6039216, 1, 1,
0.1438195, 1.194374, 0.4971136, 0, 0.5960785, 1, 1,
0.1439003, -0.5639613, 1.361495, 0, 0.5921569, 1, 1,
0.1439921, -1.505019, 1.030342, 0, 0.5843138, 1, 1,
0.1443428, -1.308076, 2.961428, 0, 0.5803922, 1, 1,
0.1472902, -0.1432806, 3.650643, 0, 0.572549, 1, 1,
0.1482909, 0.09302993, -0.02609682, 0, 0.5686275, 1, 1,
0.1574069, 0.77775, 0.1124735, 0, 0.5607843, 1, 1,
0.1669088, 0.8064371, -0.5740274, 0, 0.5568628, 1, 1,
0.1725018, -1.687978, 2.450812, 0, 0.5490196, 1, 1,
0.1738869, -0.1849865, 4.117298, 0, 0.5450981, 1, 1,
0.174064, 0.6934466, 0.868234, 0, 0.5372549, 1, 1,
0.1743516, -0.7160312, 2.673182, 0, 0.5333334, 1, 1,
0.1748965, 1.572454, -0.4226663, 0, 0.5254902, 1, 1,
0.1757798, 1.09056, -0.2220745, 0, 0.5215687, 1, 1,
0.1819456, -0.1623371, 2.254358, 0, 0.5137255, 1, 1,
0.1873145, 1.158549, -0.06274136, 0, 0.509804, 1, 1,
0.1923994, 1.048697, -0.2545754, 0, 0.5019608, 1, 1,
0.1933937, 0.3733782, -0.5506062, 0, 0.4941176, 1, 1,
0.2036979, -0.5952688, 2.003098, 0, 0.4901961, 1, 1,
0.2049324, -0.7404649, 3.293441, 0, 0.4823529, 1, 1,
0.2082369, -0.5493319, 0.8466866, 0, 0.4784314, 1, 1,
0.2083229, 0.5015404, 2.052449, 0, 0.4705882, 1, 1,
0.2106341, -0.5360674, 3.446514, 0, 0.4666667, 1, 1,
0.214013, -0.6205364, 0.8671225, 0, 0.4588235, 1, 1,
0.2184939, -0.1625828, 2.729294, 0, 0.454902, 1, 1,
0.2204929, -0.3578684, 3.587363, 0, 0.4470588, 1, 1,
0.2210254, 0.105404, 0.7736855, 0, 0.4431373, 1, 1,
0.2278912, -0.5875888, 0.4404722, 0, 0.4352941, 1, 1,
0.2309936, 1.744028, -0.380003, 0, 0.4313726, 1, 1,
0.234118, -1.318811, 1.077032, 0, 0.4235294, 1, 1,
0.2348941, 1.627366, 0.5739009, 0, 0.4196078, 1, 1,
0.2372595, 0.9154379, -1.374092, 0, 0.4117647, 1, 1,
0.2375678, 0.1194263, -0.2317269, 0, 0.4078431, 1, 1,
0.242386, 0.05664932, 0.9126471, 0, 0.4, 1, 1,
0.2448361, 0.9016787, 0.7168604, 0, 0.3921569, 1, 1,
0.2513449, 0.1170844, 0.03771241, 0, 0.3882353, 1, 1,
0.2531351, -1.957305, 4.630493, 0, 0.3803922, 1, 1,
0.2547565, -0.4625322, 3.908557, 0, 0.3764706, 1, 1,
0.2559929, 0.4042178, 0.5438871, 0, 0.3686275, 1, 1,
0.2591456, 1.638429, -0.5220706, 0, 0.3647059, 1, 1,
0.2595799, -0.627026, 1.975606, 0, 0.3568628, 1, 1,
0.2634095, -0.02994463, 0.3336648, 0, 0.3529412, 1, 1,
0.2657679, -0.8460439, 3.224201, 0, 0.345098, 1, 1,
0.2670785, -0.04298796, 1.649013, 0, 0.3411765, 1, 1,
0.273239, -1.220466, 3.631219, 0, 0.3333333, 1, 1,
0.2763386, -1.191231, 1.54668, 0, 0.3294118, 1, 1,
0.2767777, -0.6850864, 4.041594, 0, 0.3215686, 1, 1,
0.2807727, 0.8132118, 0.3613271, 0, 0.3176471, 1, 1,
0.2813344, 0.6846732, 0.8611339, 0, 0.3098039, 1, 1,
0.2815595, 0.04231721, 1.177136, 0, 0.3058824, 1, 1,
0.2829082, -0.9847335, 1.982281, 0, 0.2980392, 1, 1,
0.2851776, -0.4221927, 3.805343, 0, 0.2901961, 1, 1,
0.2857023, -0.959511, 2.843659, 0, 0.2862745, 1, 1,
0.2884528, -0.1592403, 1.480496, 0, 0.2784314, 1, 1,
0.2894817, -0.07361857, 2.544672, 0, 0.2745098, 1, 1,
0.2912864, -0.5835944, 0.7893727, 0, 0.2666667, 1, 1,
0.2963761, -0.9419967, 2.984551, 0, 0.2627451, 1, 1,
0.2971529, -0.6459887, 2.582826, 0, 0.254902, 1, 1,
0.2979745, 0.512081, 1.475819, 0, 0.2509804, 1, 1,
0.3000965, 0.8194984, -0.7386914, 0, 0.2431373, 1, 1,
0.3039885, -2.362789, 3.368187, 0, 0.2392157, 1, 1,
0.30629, 1.25339, 1.408852, 0, 0.2313726, 1, 1,
0.3065973, 0.162813, 0.5677502, 0, 0.227451, 1, 1,
0.3086847, 1.954507, -0.2304414, 0, 0.2196078, 1, 1,
0.30871, -0.5809927, 1.636622, 0, 0.2156863, 1, 1,
0.3120648, 0.6996463, 1.269306, 0, 0.2078431, 1, 1,
0.3152412, -0.05335632, 2.849982, 0, 0.2039216, 1, 1,
0.3160508, 0.9455937, 0.6672368, 0, 0.1960784, 1, 1,
0.3181778, -0.8917017, 3.684338, 0, 0.1882353, 1, 1,
0.3203269, 0.2602993, 0.07345011, 0, 0.1843137, 1, 1,
0.3219586, -0.3033943, 2.053768, 0, 0.1764706, 1, 1,
0.3221008, 1.393131, -0.5974799, 0, 0.172549, 1, 1,
0.3305113, 0.06119118, 2.188321, 0, 0.1647059, 1, 1,
0.3329052, -0.04981705, 0.9341697, 0, 0.1607843, 1, 1,
0.3373966, -1.07352, 3.022819, 0, 0.1529412, 1, 1,
0.3374588, -0.634133, 4.032673, 0, 0.1490196, 1, 1,
0.3481375, -0.9150149, 1.081213, 0, 0.1411765, 1, 1,
0.3484403, -0.2525104, 2.442122, 0, 0.1372549, 1, 1,
0.3510266, -0.4568778, 2.182419, 0, 0.1294118, 1, 1,
0.3538024, -0.05269369, 0.9321301, 0, 0.1254902, 1, 1,
0.354305, 1.071077, 1.981364, 0, 0.1176471, 1, 1,
0.3579134, 2.494806, 0.5536798, 0, 0.1137255, 1, 1,
0.3602557, -0.734971, 2.070699, 0, 0.1058824, 1, 1,
0.3633854, -1.084545, 2.363243, 0, 0.09803922, 1, 1,
0.3663324, 0.8917952, -0.2907304, 0, 0.09411765, 1, 1,
0.3682388, -0.822301, 1.948337, 0, 0.08627451, 1, 1,
0.3708069, 0.1753371, 0.4885019, 0, 0.08235294, 1, 1,
0.3746552, -0.8283941, 2.717897, 0, 0.07450981, 1, 1,
0.3746606, 0.862174, 0.6242881, 0, 0.07058824, 1, 1,
0.3760742, -0.9060707, 2.11432, 0, 0.0627451, 1, 1,
0.3809029, 0.2665289, 1.108733, 0, 0.05882353, 1, 1,
0.3827039, 0.4939916, 2.301566, 0, 0.05098039, 1, 1,
0.3878146, -0.9047992, 2.452462, 0, 0.04705882, 1, 1,
0.3963163, 0.3543082, 0.7532877, 0, 0.03921569, 1, 1,
0.4015697, -0.1592212, 2.784107, 0, 0.03529412, 1, 1,
0.4023409, -1.654824, 1.772548, 0, 0.02745098, 1, 1,
0.4075007, 0.8754629, 1.124813, 0, 0.02352941, 1, 1,
0.4077255, -0.2608774, 2.119027, 0, 0.01568628, 1, 1,
0.4082769, -0.1728937, 1.773648, 0, 0.01176471, 1, 1,
0.4090386, -0.2334445, 3.129725, 0, 0.003921569, 1, 1,
0.4091026, -0.1839201, 2.767997, 0.003921569, 0, 1, 1,
0.4096717, 0.3168469, -0.04224475, 0.007843138, 0, 1, 1,
0.4147029, 0.3771331, 0.1583675, 0.01568628, 0, 1, 1,
0.4200579, 0.03586318, 1.606041, 0.01960784, 0, 1, 1,
0.4215209, 1.216229, -1.33731, 0.02745098, 0, 1, 1,
0.4229433, 0.3152153, -0.4598162, 0.03137255, 0, 1, 1,
0.4245328, -0.1477976, 0.9710029, 0.03921569, 0, 1, 1,
0.434857, 0.4848386, 0.5524296, 0.04313726, 0, 1, 1,
0.4379448, -0.8548087, 0.9362504, 0.05098039, 0, 1, 1,
0.4388955, -0.7217666, 1.609424, 0.05490196, 0, 1, 1,
0.4410314, -1.967212, 3.571686, 0.0627451, 0, 1, 1,
0.4415109, 0.3411907, 0.2934641, 0.06666667, 0, 1, 1,
0.4437765, 1.804677, -0.7221683, 0.07450981, 0, 1, 1,
0.4542715, -0.08925699, 1.121825, 0.07843138, 0, 1, 1,
0.4553143, 0.3960871, 0.5498208, 0.08627451, 0, 1, 1,
0.4575126, -1.845966, 3.846391, 0.09019608, 0, 1, 1,
0.4594587, -0.4602261, 1.239288, 0.09803922, 0, 1, 1,
0.4631747, 1.311864, 0.9439475, 0.1058824, 0, 1, 1,
0.4641929, -0.8166452, 2.144366, 0.1098039, 0, 1, 1,
0.4648138, 0.6356874, -0.1886096, 0.1176471, 0, 1, 1,
0.4682984, -0.9674172, 2.257008, 0.1215686, 0, 1, 1,
0.4723136, -0.7176305, 3.355759, 0.1294118, 0, 1, 1,
0.473777, -2.067758, 2.72017, 0.1333333, 0, 1, 1,
0.4756883, -1.309681, 2.56093, 0.1411765, 0, 1, 1,
0.476346, -0.6062028, 0.4200723, 0.145098, 0, 1, 1,
0.4787861, 0.831957, 1.755757, 0.1529412, 0, 1, 1,
0.4814888, -1.514739, 3.269938, 0.1568628, 0, 1, 1,
0.4849316, 0.3723719, -0.6662365, 0.1647059, 0, 1, 1,
0.4910571, 1.278338, 0.3478829, 0.1686275, 0, 1, 1,
0.4979452, 1.099542, 1.348584, 0.1764706, 0, 1, 1,
0.5012759, -1.426689, 3.391381, 0.1803922, 0, 1, 1,
0.5019665, -0.06446053, 1.917648, 0.1882353, 0, 1, 1,
0.5053261, -0.5982925, 1.222058, 0.1921569, 0, 1, 1,
0.5066715, 0.9473503, 0.01848736, 0.2, 0, 1, 1,
0.5102158, 0.2921258, 1.752731, 0.2078431, 0, 1, 1,
0.5125461, 0.4010482, 1.257943, 0.2117647, 0, 1, 1,
0.5157466, -0.04126627, 1.811349, 0.2196078, 0, 1, 1,
0.5188866, -0.2068419, 1.969319, 0.2235294, 0, 1, 1,
0.5189863, -1.864532, 3.850492, 0.2313726, 0, 1, 1,
0.5244734, -2.060901, 3.646252, 0.2352941, 0, 1, 1,
0.5281447, -0.7596262, 3.433871, 0.2431373, 0, 1, 1,
0.5282187, -3.094769, 3.850482, 0.2470588, 0, 1, 1,
0.5308079, -1.109704, 2.684249, 0.254902, 0, 1, 1,
0.5374809, -0.4800841, 2.025332, 0.2588235, 0, 1, 1,
0.5437376, 0.6162217, 0.05838763, 0.2666667, 0, 1, 1,
0.5458486, 1.233442, 0.2588246, 0.2705882, 0, 1, 1,
0.5479925, -0.7699428, 2.599899, 0.2784314, 0, 1, 1,
0.551517, 0.5170163, -0.8261576, 0.282353, 0, 1, 1,
0.5521594, -1.135697, 3.224063, 0.2901961, 0, 1, 1,
0.5532502, 0.03820187, 0.6250228, 0.2941177, 0, 1, 1,
0.5566381, -1.953539, 3.755363, 0.3019608, 0, 1, 1,
0.5597864, -0.3906031, 3.71986, 0.3098039, 0, 1, 1,
0.5608888, 0.5504886, 1.788427, 0.3137255, 0, 1, 1,
0.5631685, 0.5493005, -1.243216, 0.3215686, 0, 1, 1,
0.5632118, 0.02291318, 0.5378909, 0.3254902, 0, 1, 1,
0.5664066, -0.03237186, 0.4400719, 0.3333333, 0, 1, 1,
0.566489, 0.2977932, -0.2126457, 0.3372549, 0, 1, 1,
0.5747088, -0.4244595, 2.66637, 0.345098, 0, 1, 1,
0.5765458, 0.03488971, 2.543783, 0.3490196, 0, 1, 1,
0.5767006, 0.697851, 2.391069, 0.3568628, 0, 1, 1,
0.5828541, 0.6560155, -0.9074407, 0.3607843, 0, 1, 1,
0.5829919, 0.5923523, 1.178394, 0.3686275, 0, 1, 1,
0.5832748, -0.4686677, 1.894557, 0.372549, 0, 1, 1,
0.5837775, 0.7285128, 1.64451, 0.3803922, 0, 1, 1,
0.5844827, 0.3412478, 0.8612062, 0.3843137, 0, 1, 1,
0.5896805, -0.8752512, 4.180442, 0.3921569, 0, 1, 1,
0.5898595, -1.166886, 2.288713, 0.3960784, 0, 1, 1,
0.5905048, 0.5199053, 0.787079, 0.4039216, 0, 1, 1,
0.5915373, -0.8732471, 3.330441, 0.4117647, 0, 1, 1,
0.5917038, -0.282402, 2.595352, 0.4156863, 0, 1, 1,
0.5933464, 0.157893, -0.04411776, 0.4235294, 0, 1, 1,
0.5974117, 0.6892783, -0.3512508, 0.427451, 0, 1, 1,
0.5992863, 0.6782986, 0.197436, 0.4352941, 0, 1, 1,
0.6054705, 1.803577, 0.6647421, 0.4392157, 0, 1, 1,
0.6120469, -0.8977464, 2.818939, 0.4470588, 0, 1, 1,
0.6291474, -0.2089078, 3.356701, 0.4509804, 0, 1, 1,
0.6294943, -3.284293, 3.667189, 0.4588235, 0, 1, 1,
0.6330897, 1.859185, 1.060436, 0.4627451, 0, 1, 1,
0.6374474, -0.3131, 1.581228, 0.4705882, 0, 1, 1,
0.6396095, -0.5468484, 1.216373, 0.4745098, 0, 1, 1,
0.6409865, -0.3417906, 1.86344, 0.4823529, 0, 1, 1,
0.6420571, 0.71184, 1.867482, 0.4862745, 0, 1, 1,
0.6465123, -0.7505974, 2.074544, 0.4941176, 0, 1, 1,
0.6492847, -1.667818, 1.766369, 0.5019608, 0, 1, 1,
0.6493681, -1.502061, 2.253322, 0.5058824, 0, 1, 1,
0.6505935, -0.2862923, 2.977063, 0.5137255, 0, 1, 1,
0.6547688, 1.015508, 0.2295343, 0.5176471, 0, 1, 1,
0.6590393, -0.814607, 3.888289, 0.5254902, 0, 1, 1,
0.6629959, 0.06969895, 2.025362, 0.5294118, 0, 1, 1,
0.6685726, 1.800855, 2.172296, 0.5372549, 0, 1, 1,
0.671092, -0.9871112, 0.4741438, 0.5411765, 0, 1, 1,
0.6743999, -0.7428947, 3.037989, 0.5490196, 0, 1, 1,
0.6747065, 0.5053074, 1.580459, 0.5529412, 0, 1, 1,
0.6756981, -1.26053, 4.256993, 0.5607843, 0, 1, 1,
0.676196, -1.226049, 2.678075, 0.5647059, 0, 1, 1,
0.6793583, -1.914477, 3.73701, 0.572549, 0, 1, 1,
0.6811274, 0.6913233, 1.184664, 0.5764706, 0, 1, 1,
0.6816525, 0.1148007, 2.187011, 0.5843138, 0, 1, 1,
0.6873276, -0.3417147, 2.796836, 0.5882353, 0, 1, 1,
0.6911745, -1.130997, 2.387337, 0.5960785, 0, 1, 1,
0.6932214, 0.2199141, -0.2008903, 0.6039216, 0, 1, 1,
0.69789, 0.8926107, 0.6166869, 0.6078432, 0, 1, 1,
0.714182, -1.992239, 2.673938, 0.6156863, 0, 1, 1,
0.7162165, 0.366489, -1.21603, 0.6196079, 0, 1, 1,
0.717469, 0.6222328, -0.2913991, 0.627451, 0, 1, 1,
0.7187653, -0.4561061, 3.308175, 0.6313726, 0, 1, 1,
0.7252904, -1.464222, 1.01479, 0.6392157, 0, 1, 1,
0.7281121, -0.8680311, 2.950425, 0.6431373, 0, 1, 1,
0.729271, 0.8018306, -0.2469782, 0.6509804, 0, 1, 1,
0.7333251, 0.523295, 1.441023, 0.654902, 0, 1, 1,
0.7347002, 0.6559118, 1.548028, 0.6627451, 0, 1, 1,
0.7355036, -0.1034838, 1.64003, 0.6666667, 0, 1, 1,
0.7415614, -0.8549647, 1.800632, 0.6745098, 0, 1, 1,
0.7511542, 0.434236, 1.245555, 0.6784314, 0, 1, 1,
0.7596376, -0.29006, 1.471756, 0.6862745, 0, 1, 1,
0.7738841, -0.7328382, 1.004323, 0.6901961, 0, 1, 1,
0.7757044, 0.8056714, 0.5025927, 0.6980392, 0, 1, 1,
0.7757556, 1.930437, -0.4968023, 0.7058824, 0, 1, 1,
0.7769607, 0.5439849, 3.184295, 0.7098039, 0, 1, 1,
0.7794662, -0.9191455, 3.336955, 0.7176471, 0, 1, 1,
0.7832595, -0.07413979, 2.216072, 0.7215686, 0, 1, 1,
0.7838603, 1.774754, 0.9321017, 0.7294118, 0, 1, 1,
0.8064848, 1.047879, 0.7455843, 0.7333333, 0, 1, 1,
0.8065662, -0.8114053, 2.317112, 0.7411765, 0, 1, 1,
0.8114644, 1.261288, 0.757553, 0.7450981, 0, 1, 1,
0.8170512, 0.6638193, 1.479191, 0.7529412, 0, 1, 1,
0.8182201, 1.653046, 1.189471, 0.7568628, 0, 1, 1,
0.8206563, 0.07028831, 0.8996677, 0.7647059, 0, 1, 1,
0.8273613, 1.929587, 1.187753, 0.7686275, 0, 1, 1,
0.8291458, 0.767391, 0.08138601, 0.7764706, 0, 1, 1,
0.8306732, -1.513348, 2.27819, 0.7803922, 0, 1, 1,
0.8373199, -1.256447, 3.405693, 0.7882353, 0, 1, 1,
0.8440696, 0.9096299, 0.4203973, 0.7921569, 0, 1, 1,
0.8476909, 1.322594, 2.325854, 0.8, 0, 1, 1,
0.8512265, -1.017025, 2.757704, 0.8078431, 0, 1, 1,
0.8542399, -1.637095, 1.747748, 0.8117647, 0, 1, 1,
0.8606895, -0.5773532, 2.407627, 0.8196079, 0, 1, 1,
0.8635907, -1.489027, 3.893754, 0.8235294, 0, 1, 1,
0.8675947, -2.533833, 2.194786, 0.8313726, 0, 1, 1,
0.8713624, -0.4769895, 1.318511, 0.8352941, 0, 1, 1,
0.873117, -0.2731816, 1.518791, 0.8431373, 0, 1, 1,
0.8738867, 2.316591, 1.904334, 0.8470588, 0, 1, 1,
0.8740562, -1.211439, 2.333406, 0.854902, 0, 1, 1,
0.8763235, -0.1295155, 1.473317, 0.8588235, 0, 1, 1,
0.8791746, 0.9076859, 1.18753, 0.8666667, 0, 1, 1,
0.8964512, -0.01072548, 0.8240126, 0.8705882, 0, 1, 1,
0.8966611, -1.424665, 3.721526, 0.8784314, 0, 1, 1,
0.8982354, -1.438667, 4.525544, 0.8823529, 0, 1, 1,
0.9113269, -1.102335, 1.52653, 0.8901961, 0, 1, 1,
0.9208895, 0.2064099, 1.44809, 0.8941177, 0, 1, 1,
0.922916, -0.8494306, 2.286128, 0.9019608, 0, 1, 1,
0.9313471, 0.3023527, 2.061405, 0.9098039, 0, 1, 1,
0.9354125, 0.8112794, 0.9395816, 0.9137255, 0, 1, 1,
0.9409452, -1.411919, 1.954567, 0.9215686, 0, 1, 1,
0.9423096, 0.01637989, 1.742955, 0.9254902, 0, 1, 1,
0.9431355, 1.226263, 1.43716, 0.9333333, 0, 1, 1,
0.9450062, 0.8378701, 0.8395056, 0.9372549, 0, 1, 1,
0.9458076, 0.1426255, 2.503543, 0.945098, 0, 1, 1,
0.9570935, 0.5872006, -0.9383764, 0.9490196, 0, 1, 1,
0.9586149, 0.09153685, 1.185938, 0.9568627, 0, 1, 1,
0.9605672, -2.278492, 3.125206, 0.9607843, 0, 1, 1,
0.9687198, 0.1737712, 0.4961584, 0.9686275, 0, 1, 1,
0.9709162, -0.2154946, 2.853641, 0.972549, 0, 1, 1,
0.9776009, -1.45559, 1.27062, 0.9803922, 0, 1, 1,
0.9820188, 0.9770348, 1.317727, 0.9843137, 0, 1, 1,
0.9825555, 0.3437831, 2.063907, 0.9921569, 0, 1, 1,
0.9885036, 0.04014115, 1.949312, 0.9960784, 0, 1, 1,
0.9914282, -0.5829542, 2.773773, 1, 0, 0.9960784, 1,
1.012497, 2.735548, 1.416196, 1, 0, 0.9882353, 1,
1.018375, 0.7718831, 1.399781, 1, 0, 0.9843137, 1,
1.022763, 0.2024482, 0.1079707, 1, 0, 0.9764706, 1,
1.028141, -1.822544, 2.487874, 1, 0, 0.972549, 1,
1.02902, 0.9339957, 2.044013, 1, 0, 0.9647059, 1,
1.038986, 0.9005885, 0.8425126, 1, 0, 0.9607843, 1,
1.040144, -1.610406, 4.661979, 1, 0, 0.9529412, 1,
1.048117, -0.7486507, 4.046543, 1, 0, 0.9490196, 1,
1.050018, -0.2143908, 0.485268, 1, 0, 0.9411765, 1,
1.050999, 0.3323798, 3.507517, 1, 0, 0.9372549, 1,
1.051215, 1.031192, 0.7793559, 1, 0, 0.9294118, 1,
1.051799, -0.9544591, 2.033957, 1, 0, 0.9254902, 1,
1.056052, 0.3831913, 0.5674825, 1, 0, 0.9176471, 1,
1.057754, 0.694205, 2.301086, 1, 0, 0.9137255, 1,
1.061183, -0.90487, 3.220416, 1, 0, 0.9058824, 1,
1.065821, 0.2493789, 0.02767317, 1, 0, 0.9019608, 1,
1.065929, 1.295423, -0.3163732, 1, 0, 0.8941177, 1,
1.067975, -1.900746, 2.882757, 1, 0, 0.8862745, 1,
1.068919, 0.9242811, 1.364866, 1, 0, 0.8823529, 1,
1.070236, 0.7989222, -0.7944125, 1, 0, 0.8745098, 1,
1.078206, 0.4592113, 0.1518275, 1, 0, 0.8705882, 1,
1.082933, -1.593822, 1.536631, 1, 0, 0.8627451, 1,
1.084576, -0.2183135, 3.271203, 1, 0, 0.8588235, 1,
1.094546, 0.4510582, 0.7091997, 1, 0, 0.8509804, 1,
1.100375, -0.7357063, 2.903378, 1, 0, 0.8470588, 1,
1.108115, 0.1918117, 0.8650907, 1, 0, 0.8392157, 1,
1.109311, 1.201881, 1.39713, 1, 0, 0.8352941, 1,
1.117841, -0.48254, 1.632444, 1, 0, 0.827451, 1,
1.125778, 0.5490548, 1.316159, 1, 0, 0.8235294, 1,
1.129318, 1.14504, 0.8164943, 1, 0, 0.8156863, 1,
1.13155, -0.4377169, 1.912492, 1, 0, 0.8117647, 1,
1.13222, 0.1537792, 2.163676, 1, 0, 0.8039216, 1,
1.136443, 0.03668911, 0.9946536, 1, 0, 0.7960784, 1,
1.139231, 0.3902585, 1.895195, 1, 0, 0.7921569, 1,
1.14508, -0.7587397, 0.0267603, 1, 0, 0.7843137, 1,
1.154093, -1.673542, 5.400641, 1, 0, 0.7803922, 1,
1.154969, -1.32528, 3.291331, 1, 0, 0.772549, 1,
1.157793, 0.709139, -0.1778564, 1, 0, 0.7686275, 1,
1.174711, -0.2352076, 2.144948, 1, 0, 0.7607843, 1,
1.176708, 0.4143401, 1.336206, 1, 0, 0.7568628, 1,
1.179845, 1.009727, 1.263297, 1, 0, 0.7490196, 1,
1.191238, -0.2230508, 1.974607, 1, 0, 0.7450981, 1,
1.205003, -0.5984912, 1.563589, 1, 0, 0.7372549, 1,
1.212084, 0.4114677, -0.4031959, 1, 0, 0.7333333, 1,
1.218241, 0.9080352, 0.3235975, 1, 0, 0.7254902, 1,
1.220587, -0.7336292, 2.376985, 1, 0, 0.7215686, 1,
1.22228, 1.680986, 1.03763, 1, 0, 0.7137255, 1,
1.224623, -1.351754, 2.27992, 1, 0, 0.7098039, 1,
1.226839, -1.816187, 1.060978, 1, 0, 0.7019608, 1,
1.229226, -0.09881237, 1.943867, 1, 0, 0.6941177, 1,
1.230241, -1.761486, 3.388206, 1, 0, 0.6901961, 1,
1.232384, 0.4772206, 0.6589976, 1, 0, 0.682353, 1,
1.242361, 1.725251, 0.7241601, 1, 0, 0.6784314, 1,
1.245124, -0.3392754, 0.5727948, 1, 0, 0.6705883, 1,
1.247982, 0.9574227, -1.452999, 1, 0, 0.6666667, 1,
1.24959, 4.228236, 0.9817274, 1, 0, 0.6588235, 1,
1.251803, -0.6454107, 3.533081, 1, 0, 0.654902, 1,
1.262497, -0.2939005, 2.607738, 1, 0, 0.6470588, 1,
1.282527, -0.696838, 1.920451, 1, 0, 0.6431373, 1,
1.285082, 0.02128316, 0.8711706, 1, 0, 0.6352941, 1,
1.294002, -0.8791453, -0.03573174, 1, 0, 0.6313726, 1,
1.296222, 0.6746901, 1.616945, 1, 0, 0.6235294, 1,
1.313671, 0.433238, 1.001307, 1, 0, 0.6196079, 1,
1.318708, -0.412969, 3.393258, 1, 0, 0.6117647, 1,
1.319215, -0.2027051, 3.003838, 1, 0, 0.6078432, 1,
1.330559, -1.353097, 1.224117, 1, 0, 0.6, 1,
1.335374, -0.06563759, 2.364894, 1, 0, 0.5921569, 1,
1.346925, -1.829046, 2.39203, 1, 0, 0.5882353, 1,
1.351621, -0.7979521, 1.018634, 1, 0, 0.5803922, 1,
1.357489, 0.387015, 2.98899, 1, 0, 0.5764706, 1,
1.365312, -0.2844025, 1.618227, 1, 0, 0.5686275, 1,
1.369891, 1.046036, 0.2608885, 1, 0, 0.5647059, 1,
1.374053, -0.6571938, 2.090387, 1, 0, 0.5568628, 1,
1.37766, 1.881557, 1.838579, 1, 0, 0.5529412, 1,
1.378259, 1.977309, 1.347957, 1, 0, 0.5450981, 1,
1.378851, 0.01036266, 1.344224, 1, 0, 0.5411765, 1,
1.379603, 0.2351702, 0.6250114, 1, 0, 0.5333334, 1,
1.381786, 1.19944, 0.7587479, 1, 0, 0.5294118, 1,
1.385142, 0.5203808, 1.134203, 1, 0, 0.5215687, 1,
1.39751, 0.7959021, -0.02719902, 1, 0, 0.5176471, 1,
1.39878, 0.004659056, 3.006014, 1, 0, 0.509804, 1,
1.406422, 0.1150096, -0.05427701, 1, 0, 0.5058824, 1,
1.406891, -0.9896873, 0.4274996, 1, 0, 0.4980392, 1,
1.41033, 1.037579, 0.02289591, 1, 0, 0.4901961, 1,
1.412002, 0.002074806, 1.575021, 1, 0, 0.4862745, 1,
1.41283, -0.2424843, 0.4446949, 1, 0, 0.4784314, 1,
1.414772, 0.1837762, 2.640092, 1, 0, 0.4745098, 1,
1.416249, 0.3388807, 1.614609, 1, 0, 0.4666667, 1,
1.423093, 0.6681997, 0.7763931, 1, 0, 0.4627451, 1,
1.432666, 2.67349, -0.2936091, 1, 0, 0.454902, 1,
1.449735, -1.388126, 3.078187, 1, 0, 0.4509804, 1,
1.454996, 0.2209038, -0.3016552, 1, 0, 0.4431373, 1,
1.455877, -0.5824575, 1.147191, 1, 0, 0.4392157, 1,
1.461947, 2.082715, 0.4170948, 1, 0, 0.4313726, 1,
1.479733, 0.5782052, 1.040685, 1, 0, 0.427451, 1,
1.49032, -0.8234605, 0.5983251, 1, 0, 0.4196078, 1,
1.49035, 2.017567, 1.162736, 1, 0, 0.4156863, 1,
1.490915, -0.1772213, 1.014189, 1, 0, 0.4078431, 1,
1.492993, -0.7128902, 2.265161, 1, 0, 0.4039216, 1,
1.493585, -0.08371596, 3.035564, 1, 0, 0.3960784, 1,
1.502855, 0.4910084, 2.620127, 1, 0, 0.3882353, 1,
1.509155, -0.8167645, 0.7361284, 1, 0, 0.3843137, 1,
1.514578, 1.359425, 1.765771, 1, 0, 0.3764706, 1,
1.526206, 0.09424941, 3.855697, 1, 0, 0.372549, 1,
1.534678, 0.9071457, 1.8014, 1, 0, 0.3647059, 1,
1.545007, 0.08087227, 0.1786201, 1, 0, 0.3607843, 1,
1.54949, -1.713102, 0.8363899, 1, 0, 0.3529412, 1,
1.555174, -0.6769236, 3.590816, 1, 0, 0.3490196, 1,
1.567038, 0.2148491, 0.08578267, 1, 0, 0.3411765, 1,
1.569434, 0.2694907, 1.896105, 1, 0, 0.3372549, 1,
1.581312, -0.09726264, 2.173725, 1, 0, 0.3294118, 1,
1.596775, 0.8878241, 2.756765, 1, 0, 0.3254902, 1,
1.616163, -0.7371916, 1.141059, 1, 0, 0.3176471, 1,
1.624113, -0.8982428, 1.903691, 1, 0, 0.3137255, 1,
1.631095, -0.4416173, 0.8561695, 1, 0, 0.3058824, 1,
1.63915, 0.005074606, 1.17773, 1, 0, 0.2980392, 1,
1.640238, -0.270767, 1.746314, 1, 0, 0.2941177, 1,
1.651654, 1.186723, 2.377603, 1, 0, 0.2862745, 1,
1.656465, 0.120641, 2.650425, 1, 0, 0.282353, 1,
1.679763, 0.8212482, -0.3077049, 1, 0, 0.2745098, 1,
1.690951, -1.671497, 3.614143, 1, 0, 0.2705882, 1,
1.698153, -0.489005, 1.308341, 1, 0, 0.2627451, 1,
1.713278, 0.9898235, 1.066203, 1, 0, 0.2588235, 1,
1.716914, 1.115496, 1.610352, 1, 0, 0.2509804, 1,
1.718487, 0.1736978, 0.9698009, 1, 0, 0.2470588, 1,
1.719573, 0.6704522, 2.525135, 1, 0, 0.2392157, 1,
1.738203, 0.6417217, -0.5292014, 1, 0, 0.2352941, 1,
1.802722, -1.836803, 2.155375, 1, 0, 0.227451, 1,
1.803401, -0.37418, 1.936021, 1, 0, 0.2235294, 1,
1.812411, -1.226373, 1.948755, 1, 0, 0.2156863, 1,
1.813812, 1.191158, -0.1966192, 1, 0, 0.2117647, 1,
1.857857, -2.636109, 3.429909, 1, 0, 0.2039216, 1,
1.863793, -0.886762, 2.971991, 1, 0, 0.1960784, 1,
1.864124, -0.03665251, 0.3231103, 1, 0, 0.1921569, 1,
1.877203, 0.1472811, 1.42496, 1, 0, 0.1843137, 1,
1.897524, 0.05113309, 0.2113811, 1, 0, 0.1803922, 1,
1.914376, -1.017744, 3.467159, 1, 0, 0.172549, 1,
1.92251, 0.7819588, 1.510795, 1, 0, 0.1686275, 1,
1.928821, 0.9884108, 1.111086, 1, 0, 0.1607843, 1,
1.935241, 0.033479, 2.100806, 1, 0, 0.1568628, 1,
1.961684, 0.4532499, 3.057375, 1, 0, 0.1490196, 1,
1.961953, -0.1052752, 1.721959, 1, 0, 0.145098, 1,
2.009247, -0.3700365, 2.162106, 1, 0, 0.1372549, 1,
2.02512, -0.166733, 3.774952, 1, 0, 0.1333333, 1,
2.063584, -0.2108206, 0.7981595, 1, 0, 0.1254902, 1,
2.102988, -0.8522788, -0.05858181, 1, 0, 0.1215686, 1,
2.105618, -0.3667428, 3.154152, 1, 0, 0.1137255, 1,
2.115839, -1.444569, 0.8088112, 1, 0, 0.1098039, 1,
2.117857, -1.361734, 1.366399, 1, 0, 0.1019608, 1,
2.176147, -0.596814, 1.911906, 1, 0, 0.09411765, 1,
2.224522, 0.3011233, 2.000603, 1, 0, 0.09019608, 1,
2.232698, 1.071168, 0.1966732, 1, 0, 0.08235294, 1,
2.237432, -1.484503, 2.305193, 1, 0, 0.07843138, 1,
2.241226, 0.4533601, 3.398597, 1, 0, 0.07058824, 1,
2.276553, 0.5452324, 3.503552, 1, 0, 0.06666667, 1,
2.322518, 1.139263, 1.212211, 1, 0, 0.05882353, 1,
2.381028, -0.1460855, 2.558872, 1, 0, 0.05490196, 1,
2.384295, -2.670562, 3.117145, 1, 0, 0.04705882, 1,
2.517159, 0.1524096, 0.1697404, 1, 0, 0.04313726, 1,
2.553733, 0.7560571, 1.756708, 1, 0, 0.03529412, 1,
2.710457, 0.06423914, 2.239592, 1, 0, 0.03137255, 1,
2.764312, -0.9185333, 0.552228, 1, 0, 0.02352941, 1,
2.819643, 1.452664, 1.020058, 1, 0, 0.01960784, 1,
2.843794, -0.2212978, 0.7314172, 1, 0, 0.01176471, 1,
3.07422, -1.078434, 2.025423, 1, 0, 0.007843138, 1
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
0.004346371, -4.557667, -7.132751, 0, -0.5, 0.5, 0.5,
0.004346371, -4.557667, -7.132751, 1, -0.5, 0.5, 0.5,
0.004346371, -4.557667, -7.132751, 1, 1.5, 0.5, 0.5,
0.004346371, -4.557667, -7.132751, 0, 1.5, 0.5, 0.5
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
-4.106215, 0.4719712, -7.132751, 0, -0.5, 0.5, 0.5,
-4.106215, 0.4719712, -7.132751, 1, -0.5, 0.5, 0.5,
-4.106215, 0.4719712, -7.132751, 1, 1.5, 0.5, 0.5,
-4.106215, 0.4719712, -7.132751, 0, 1.5, 0.5, 0.5
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
-4.106215, -4.557667, 0.0422008, 0, -0.5, 0.5, 0.5,
-4.106215, -4.557667, 0.0422008, 1, -0.5, 0.5, 0.5,
-4.106215, -4.557667, 0.0422008, 1, 1.5, 0.5, 0.5,
-4.106215, -4.557667, 0.0422008, 0, 1.5, 0.5, 0.5
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
-3, -3.396981, -5.476993,
3, -3.396981, -5.476993,
-3, -3.396981, -5.476993,
-3, -3.590429, -5.752953,
-2, -3.396981, -5.476993,
-2, -3.590429, -5.752953,
-1, -3.396981, -5.476993,
-1, -3.590429, -5.752953,
0, -3.396981, -5.476993,
0, -3.590429, -5.752953,
1, -3.396981, -5.476993,
1, -3.590429, -5.752953,
2, -3.396981, -5.476993,
2, -3.590429, -5.752953,
3, -3.396981, -5.476993,
3, -3.590429, -5.752953
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
-3, -3.977324, -6.304872, 0, -0.5, 0.5, 0.5,
-3, -3.977324, -6.304872, 1, -0.5, 0.5, 0.5,
-3, -3.977324, -6.304872, 1, 1.5, 0.5, 0.5,
-3, -3.977324, -6.304872, 0, 1.5, 0.5, 0.5,
-2, -3.977324, -6.304872, 0, -0.5, 0.5, 0.5,
-2, -3.977324, -6.304872, 1, -0.5, 0.5, 0.5,
-2, -3.977324, -6.304872, 1, 1.5, 0.5, 0.5,
-2, -3.977324, -6.304872, 0, 1.5, 0.5, 0.5,
-1, -3.977324, -6.304872, 0, -0.5, 0.5, 0.5,
-1, -3.977324, -6.304872, 1, -0.5, 0.5, 0.5,
-1, -3.977324, -6.304872, 1, 1.5, 0.5, 0.5,
-1, -3.977324, -6.304872, 0, 1.5, 0.5, 0.5,
0, -3.977324, -6.304872, 0, -0.5, 0.5, 0.5,
0, -3.977324, -6.304872, 1, -0.5, 0.5, 0.5,
0, -3.977324, -6.304872, 1, 1.5, 0.5, 0.5,
0, -3.977324, -6.304872, 0, 1.5, 0.5, 0.5,
1, -3.977324, -6.304872, 0, -0.5, 0.5, 0.5,
1, -3.977324, -6.304872, 1, -0.5, 0.5, 0.5,
1, -3.977324, -6.304872, 1, 1.5, 0.5, 0.5,
1, -3.977324, -6.304872, 0, 1.5, 0.5, 0.5,
2, -3.977324, -6.304872, 0, -0.5, 0.5, 0.5,
2, -3.977324, -6.304872, 1, -0.5, 0.5, 0.5,
2, -3.977324, -6.304872, 1, 1.5, 0.5, 0.5,
2, -3.977324, -6.304872, 0, 1.5, 0.5, 0.5,
3, -3.977324, -6.304872, 0, -0.5, 0.5, 0.5,
3, -3.977324, -6.304872, 1, -0.5, 0.5, 0.5,
3, -3.977324, -6.304872, 1, 1.5, 0.5, 0.5,
3, -3.977324, -6.304872, 0, 1.5, 0.5, 0.5
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
-3.157624, -2, -5.476993,
-3.157624, 4, -5.476993,
-3.157624, -2, -5.476993,
-3.315722, -2, -5.752953,
-3.157624, 0, -5.476993,
-3.315722, 0, -5.752953,
-3.157624, 2, -5.476993,
-3.315722, 2, -5.752953,
-3.157624, 4, -5.476993,
-3.315722, 4, -5.752953
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
-3.631919, -2, -6.304872, 0, -0.5, 0.5, 0.5,
-3.631919, -2, -6.304872, 1, -0.5, 0.5, 0.5,
-3.631919, -2, -6.304872, 1, 1.5, 0.5, 0.5,
-3.631919, -2, -6.304872, 0, 1.5, 0.5, 0.5,
-3.631919, 0, -6.304872, 0, -0.5, 0.5, 0.5,
-3.631919, 0, -6.304872, 1, -0.5, 0.5, 0.5,
-3.631919, 0, -6.304872, 1, 1.5, 0.5, 0.5,
-3.631919, 0, -6.304872, 0, 1.5, 0.5, 0.5,
-3.631919, 2, -6.304872, 0, -0.5, 0.5, 0.5,
-3.631919, 2, -6.304872, 1, -0.5, 0.5, 0.5,
-3.631919, 2, -6.304872, 1, 1.5, 0.5, 0.5,
-3.631919, 2, -6.304872, 0, 1.5, 0.5, 0.5,
-3.631919, 4, -6.304872, 0, -0.5, 0.5, 0.5,
-3.631919, 4, -6.304872, 1, -0.5, 0.5, 0.5,
-3.631919, 4, -6.304872, 1, 1.5, 0.5, 0.5,
-3.631919, 4, -6.304872, 0, 1.5, 0.5, 0.5
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
-3.157624, -3.396981, -4,
-3.157624, -3.396981, 4,
-3.157624, -3.396981, -4,
-3.315722, -3.590429, -4,
-3.157624, -3.396981, -2,
-3.315722, -3.590429, -2,
-3.157624, -3.396981, 0,
-3.315722, -3.590429, 0,
-3.157624, -3.396981, 2,
-3.315722, -3.590429, 2,
-3.157624, -3.396981, 4,
-3.315722, -3.590429, 4
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
-3.631919, -3.977324, -4, 0, -0.5, 0.5, 0.5,
-3.631919, -3.977324, -4, 1, -0.5, 0.5, 0.5,
-3.631919, -3.977324, -4, 1, 1.5, 0.5, 0.5,
-3.631919, -3.977324, -4, 0, 1.5, 0.5, 0.5,
-3.631919, -3.977324, -2, 0, -0.5, 0.5, 0.5,
-3.631919, -3.977324, -2, 1, -0.5, 0.5, 0.5,
-3.631919, -3.977324, -2, 1, 1.5, 0.5, 0.5,
-3.631919, -3.977324, -2, 0, 1.5, 0.5, 0.5,
-3.631919, -3.977324, 0, 0, -0.5, 0.5, 0.5,
-3.631919, -3.977324, 0, 1, -0.5, 0.5, 0.5,
-3.631919, -3.977324, 0, 1, 1.5, 0.5, 0.5,
-3.631919, -3.977324, 0, 0, 1.5, 0.5, 0.5,
-3.631919, -3.977324, 2, 0, -0.5, 0.5, 0.5,
-3.631919, -3.977324, 2, 1, -0.5, 0.5, 0.5,
-3.631919, -3.977324, 2, 1, 1.5, 0.5, 0.5,
-3.631919, -3.977324, 2, 0, 1.5, 0.5, 0.5,
-3.631919, -3.977324, 4, 0, -0.5, 0.5, 0.5,
-3.631919, -3.977324, 4, 1, -0.5, 0.5, 0.5,
-3.631919, -3.977324, 4, 1, 1.5, 0.5, 0.5,
-3.631919, -3.977324, 4, 0, 1.5, 0.5, 0.5
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
-3.157624, -3.396981, -5.476993,
-3.157624, 4.340924, -5.476993,
-3.157624, -3.396981, 5.561395,
-3.157624, 4.340924, 5.561395,
-3.157624, -3.396981, -5.476993,
-3.157624, -3.396981, 5.561395,
-3.157624, 4.340924, -5.476993,
-3.157624, 4.340924, 5.561395,
-3.157624, -3.396981, -5.476993,
3.166317, -3.396981, -5.476993,
-3.157624, -3.396981, 5.561395,
3.166317, -3.396981, 5.561395,
-3.157624, 4.340924, -5.476993,
3.166317, 4.340924, -5.476993,
-3.157624, 4.340924, 5.561395,
3.166317, 4.340924, 5.561395,
3.166317, -3.396981, -5.476993,
3.166317, 4.340924, -5.476993,
3.166317, -3.396981, 5.561395,
3.166317, 4.340924, 5.561395,
3.166317, -3.396981, -5.476993,
3.166317, -3.396981, 5.561395,
3.166317, 4.340924, -5.476993,
3.166317, 4.340924, 5.561395
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
var radius = 7.950994;
var distance = 35.37487;
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
mvMatrix.translate( -0.004346371, -0.4719712, -0.0422008 );
mvMatrix.scale( 1.359401, 1.110995, 0.7788067 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.37487);
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
diclobutrazol<-read.table("diclobutrazol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diclobutrazol$V2
```

```
## Error in eval(expr, envir, enclos): object 'diclobutrazol' not found
```

```r
y<-diclobutrazol$V3
```

```
## Error in eval(expr, envir, enclos): object 'diclobutrazol' not found
```

```r
z<-diclobutrazol$V4
```

```
## Error in eval(expr, envir, enclos): object 'diclobutrazol' not found
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
-3.065527, 0.9690452, -2.243835, 0, 0, 1, 1, 1,
-3.011918, -0.8469371, -1.669929, 1, 0, 0, 1, 1,
-2.708597, 1.178029, -1.601056, 1, 0, 0, 1, 1,
-2.679446, 0.8196918, -1.67536, 1, 0, 0, 1, 1,
-2.588801, 0.8668517, -2.478989, 1, 0, 0, 1, 1,
-2.420924, 0.04954964, -1.649816, 1, 0, 0, 1, 1,
-2.347946, 1.91216, -1.724235, 0, 0, 0, 1, 1,
-2.332597, 1.248506, -0.798583, 0, 0, 0, 1, 1,
-2.320117, 0.97642, -2.069525, 0, 0, 0, 1, 1,
-2.242195, -1.079743, -1.973699, 0, 0, 0, 1, 1,
-2.216046, 0.05903149, -1.343742, 0, 0, 0, 1, 1,
-2.215351, 0.656167, -1.080243, 0, 0, 0, 1, 1,
-2.208817, 0.9009134, 0.2488953, 0, 0, 0, 1, 1,
-2.207083, -0.1544149, -4.983202, 1, 1, 1, 1, 1,
-2.191904, -0.2248684, -0.8911331, 1, 1, 1, 1, 1,
-2.179024, 2.604546, -0.7448048, 1, 1, 1, 1, 1,
-2.166153, -0.4565552, -0.737012, 1, 1, 1, 1, 1,
-2.153098, -0.2692564, -1.851175, 1, 1, 1, 1, 1,
-2.133886, 2.33752, 0.005834406, 1, 1, 1, 1, 1,
-2.112485, 0.2495217, -1.953545, 1, 1, 1, 1, 1,
-2.092309, -0.6800417, -1.493601, 1, 1, 1, 1, 1,
-2.082411, -0.4525386, -2.398854, 1, 1, 1, 1, 1,
-2.023179, -0.9911808, -2.478, 1, 1, 1, 1, 1,
-1.923544, 2.590101, -0.3525716, 1, 1, 1, 1, 1,
-1.91689, -0.4331912, -1.398942, 1, 1, 1, 1, 1,
-1.90322, -1.203824, -1.49762, 1, 1, 1, 1, 1,
-1.901368, -0.3633286, -1.806163, 1, 1, 1, 1, 1,
-1.893941, -0.924886, -2.531268, 1, 1, 1, 1, 1,
-1.864367, 0.1282284, -1.819838, 0, 0, 1, 1, 1,
-1.854893, 1.826453, -0.5649775, 1, 0, 0, 1, 1,
-1.828932, -0.8412167, -2.650943, 1, 0, 0, 1, 1,
-1.813268, -1.014446, -0.7818801, 1, 0, 0, 1, 1,
-1.794284, -0.7305675, -1.948376, 1, 0, 0, 1, 1,
-1.786308, 0.4392221, -0.7767413, 1, 0, 0, 1, 1,
-1.785263, -1.634741, -0.07169304, 0, 0, 0, 1, 1,
-1.764991, 0.7397825, -0.6766357, 0, 0, 0, 1, 1,
-1.749788, 0.6773526, -1.978943, 0, 0, 0, 1, 1,
-1.748239, -1.019564, -1.396186, 0, 0, 0, 1, 1,
-1.747228, -0.6696761, -1.483798, 0, 0, 0, 1, 1,
-1.737199, 2.324423, -1.520889, 0, 0, 0, 1, 1,
-1.712533, -0.8484152, -1.71778, 0, 0, 0, 1, 1,
-1.70448, -1.327533, -1.321439, 1, 1, 1, 1, 1,
-1.69899, -0.7127848, -2.353524, 1, 1, 1, 1, 1,
-1.689326, 0.5470665, -2.164614, 1, 1, 1, 1, 1,
-1.678774, 0.009424631, -0.3725267, 1, 1, 1, 1, 1,
-1.669497, -1.103088, -2.104462, 1, 1, 1, 1, 1,
-1.657124, 0.3462495, -0.8020416, 1, 1, 1, 1, 1,
-1.65416, 0.2554511, 0.5250514, 1, 1, 1, 1, 1,
-1.653429, 1.367141, -2.925957, 1, 1, 1, 1, 1,
-1.65328, 0.1730863, -1.817326, 1, 1, 1, 1, 1,
-1.648342, -1.106395, -1.859834, 1, 1, 1, 1, 1,
-1.642003, -0.01213284, -2.82978, 1, 1, 1, 1, 1,
-1.640487, 0.3545657, -0.7808697, 1, 1, 1, 1, 1,
-1.631726, -0.1705499, -2.013909, 1, 1, 1, 1, 1,
-1.627246, 1.29892, -0.3780889, 1, 1, 1, 1, 1,
-1.624555, -0.3408193, -2.35077, 1, 1, 1, 1, 1,
-1.615985, 0.6168282, -1.193594, 0, 0, 1, 1, 1,
-1.612318, 1.14543, -3.643293, 1, 0, 0, 1, 1,
-1.610024, 0.06136392, -1.228515, 1, 0, 0, 1, 1,
-1.608525, 1.683032, -1.581648, 1, 0, 0, 1, 1,
-1.605161, -1.115786, 0.1190389, 1, 0, 0, 1, 1,
-1.577362, -1.445263, -3.369009, 1, 0, 0, 1, 1,
-1.567728, -0.4187244, -0.4612407, 0, 0, 0, 1, 1,
-1.55885, -1.427104, -4.48948, 0, 0, 0, 1, 1,
-1.555129, 0.3929037, -2.215109, 0, 0, 0, 1, 1,
-1.551919, 0.704281, -0.6038998, 0, 0, 0, 1, 1,
-1.549401, 1.188743, -0.8570966, 0, 0, 0, 1, 1,
-1.545365, 0.3727772, -0.05151546, 0, 0, 0, 1, 1,
-1.535137, 0.1329241, -2.636802, 0, 0, 0, 1, 1,
-1.534193, -0.9860963, -0.9119391, 1, 1, 1, 1, 1,
-1.52929, -0.3456907, -1.193214, 1, 1, 1, 1, 1,
-1.506756, -1.398248, -2.300149, 1, 1, 1, 1, 1,
-1.50579, -0.09584153, -2.63882, 1, 1, 1, 1, 1,
-1.494059, -0.1683881, -1.164261, 1, 1, 1, 1, 1,
-1.490194, 0.5798742, -2.205412, 1, 1, 1, 1, 1,
-1.465437, -0.586119, -2.292322, 1, 1, 1, 1, 1,
-1.462314, -1.624809, -1.195919, 1, 1, 1, 1, 1,
-1.456243, 0.2578662, -2.658628, 1, 1, 1, 1, 1,
-1.452609, 2.725004, -1.537175, 1, 1, 1, 1, 1,
-1.448028, 0.5435447, -0.836025, 1, 1, 1, 1, 1,
-1.441364, -0.8448936, -1.758614, 1, 1, 1, 1, 1,
-1.439957, -1.00171, -0.8819888, 1, 1, 1, 1, 1,
-1.433189, -0.4411506, -1.409139, 1, 1, 1, 1, 1,
-1.431695, 0.9714023, -0.3711267, 1, 1, 1, 1, 1,
-1.420313, 0.06307761, -1.116543, 0, 0, 1, 1, 1,
-1.417284, -0.4259855, -0.7399775, 1, 0, 0, 1, 1,
-1.410946, -0.1466428, -1.636966, 1, 0, 0, 1, 1,
-1.407293, -0.9845307, -4.243249, 1, 0, 0, 1, 1,
-1.405467, -0.5816258, -3.77256, 1, 0, 0, 1, 1,
-1.399957, -0.18152, -2.659007, 1, 0, 0, 1, 1,
-1.393562, -0.1320588, -0.9617212, 0, 0, 0, 1, 1,
-1.373186, -0.3051978, -1.557712, 0, 0, 0, 1, 1,
-1.370048, 0.621792, -1.063157, 0, 0, 0, 1, 1,
-1.368563, -0.2200108, -1.18389, 0, 0, 0, 1, 1,
-1.365088, 1.768038, -1.461008, 0, 0, 0, 1, 1,
-1.364241, -0.3573206, -2.338218, 0, 0, 0, 1, 1,
-1.359313, -1.634786, -4.792101, 0, 0, 0, 1, 1,
-1.35416, -0.889553, -0.7953828, 1, 1, 1, 1, 1,
-1.347118, 0.9315364, 0.410304, 1, 1, 1, 1, 1,
-1.345061, -1.163008, -2.688057, 1, 1, 1, 1, 1,
-1.342917, 1.167926, -1.559993, 1, 1, 1, 1, 1,
-1.334612, -1.148255, -3.5664, 1, 1, 1, 1, 1,
-1.330859, -1.54115, -2.24177, 1, 1, 1, 1, 1,
-1.327364, -0.103126, -1.242442, 1, 1, 1, 1, 1,
-1.304501, -0.483558, -2.492676, 1, 1, 1, 1, 1,
-1.301497, -0.5338656, -0.6799709, 1, 1, 1, 1, 1,
-1.294756, -0.9863204, -3.215822, 1, 1, 1, 1, 1,
-1.28486, -0.6852066, -2.465806, 1, 1, 1, 1, 1,
-1.280435, 0.2295202, -2.492792, 1, 1, 1, 1, 1,
-1.267674, 0.7628793, -1.781618, 1, 1, 1, 1, 1,
-1.259092, 1.398072, 0.5950436, 1, 1, 1, 1, 1,
-1.24579, 0.8390725, -0.6968981, 1, 1, 1, 1, 1,
-1.239933, -0.01888112, -0.8631533, 0, 0, 1, 1, 1,
-1.239652, -0.3314725, -1.602311, 1, 0, 0, 1, 1,
-1.212692, 0.110724, 0.1353908, 1, 0, 0, 1, 1,
-1.210845, 0.01622801, -2.11785, 1, 0, 0, 1, 1,
-1.210501, -0.1441515, -1.875406, 1, 0, 0, 1, 1,
-1.209026, -1.832927, -4.53687, 1, 0, 0, 1, 1,
-1.20809, -0.07485096, -2.959782, 0, 0, 0, 1, 1,
-1.204249, -0.1781506, -1.261198, 0, 0, 0, 1, 1,
-1.203105, 0.2888977, -3.567474, 0, 0, 0, 1, 1,
-1.200751, -0.1158727, -0.5668973, 0, 0, 0, 1, 1,
-1.198982, 0.1087121, -0.3604415, 0, 0, 0, 1, 1,
-1.190402, 1.480765, -0.7363269, 0, 0, 0, 1, 1,
-1.186545, -0.1061514, -1.010331, 0, 0, 0, 1, 1,
-1.167596, 1.563217, -0.5511838, 1, 1, 1, 1, 1,
-1.163029, 0.07952871, -0.3239958, 1, 1, 1, 1, 1,
-1.162548, -0.4193363, -2.873746, 1, 1, 1, 1, 1,
-1.160174, 0.7793216, -0.5225985, 1, 1, 1, 1, 1,
-1.157109, -0.1859309, -2.116899, 1, 1, 1, 1, 1,
-1.148444, 0.5882169, -1.981279, 1, 1, 1, 1, 1,
-1.141712, 0.6865405, -3.166433, 1, 1, 1, 1, 1,
-1.139512, 0.749373, -0.5426282, 1, 1, 1, 1, 1,
-1.130699, 1.078061, -0.3272526, 1, 1, 1, 1, 1,
-1.129487, -0.9302659, -2.297784, 1, 1, 1, 1, 1,
-1.127606, -1.608605, -2.909129, 1, 1, 1, 1, 1,
-1.12719, 1.223243, -0.7110143, 1, 1, 1, 1, 1,
-1.124058, -0.08983368, 0.09896473, 1, 1, 1, 1, 1,
-1.123912, 0.5554926, -0.4895853, 1, 1, 1, 1, 1,
-1.120759, -0.4469117, -2.341442, 1, 1, 1, 1, 1,
-1.114317, 1.689148, 0.3484712, 0, 0, 1, 1, 1,
-1.100115, 0.2218991, -1.276315, 1, 0, 0, 1, 1,
-1.098101, -0.7382982, -1.90178, 1, 0, 0, 1, 1,
-1.094679, 0.6773853, -0.05481924, 1, 0, 0, 1, 1,
-1.091799, 0.6950787, -1.567539, 1, 0, 0, 1, 1,
-1.08825, -0.4184533, -3.2234, 1, 0, 0, 1, 1,
-1.086077, 1.180976, -0.7710215, 0, 0, 0, 1, 1,
-1.08126, 0.4707641, 0.2864731, 0, 0, 0, 1, 1,
-1.080977, 0.4771319, -2.57221, 0, 0, 0, 1, 1,
-1.077, -1.789699, -5.246066, 0, 0, 0, 1, 1,
-1.076622, 0.2950225, -2.176706, 0, 0, 0, 1, 1,
-1.075821, 0.2713318, 1.241501, 0, 0, 0, 1, 1,
-1.075126, -0.1094531, -0.3683868, 0, 0, 0, 1, 1,
-1.070476, -1.015972, -3.021049, 1, 1, 1, 1, 1,
-1.068272, -0.4872022, -3.025693, 1, 1, 1, 1, 1,
-1.06624, 1.100341, 0.06334323, 1, 1, 1, 1, 1,
-1.064747, 0.3691134, -1.015142, 1, 1, 1, 1, 1,
-1.052831, 0.3048289, -3.162414, 1, 1, 1, 1, 1,
-1.046214, -0.2164111, -1.165433, 1, 1, 1, 1, 1,
-1.034238, -1.024575, -2.959537, 1, 1, 1, 1, 1,
-1.030248, 0.2805751, -0.2056178, 1, 1, 1, 1, 1,
-1.02607, -0.08247933, -1.046686, 1, 1, 1, 1, 1,
-1.02421, 0.6164906, -1.891607, 1, 1, 1, 1, 1,
-1.021685, -1.101529, -1.893686, 1, 1, 1, 1, 1,
-1.017928, -0.8881693, -1.059294, 1, 1, 1, 1, 1,
-1.017324, -0.4683882, -0.3767395, 1, 1, 1, 1, 1,
-1.008524, 0.4060471, -3.129221, 1, 1, 1, 1, 1,
-1.007548, -0.1898968, -1.769571, 1, 1, 1, 1, 1,
-1.005002, 0.03291187, -1.129875, 0, 0, 1, 1, 1,
-1.002417, -0.5451914, -0.958635, 1, 0, 0, 1, 1,
-1.000583, 0.8694181, 1.067661, 1, 0, 0, 1, 1,
-0.9873165, 0.9697893, -0.08046315, 1, 0, 0, 1, 1,
-0.9840184, 1.179791, -0.02939278, 1, 0, 0, 1, 1,
-0.981735, 1.152148, -0.8403147, 1, 0, 0, 1, 1,
-0.9740818, 0.4099566, 0.3816653, 0, 0, 0, 1, 1,
-0.9567572, -1.657981, -1.746594, 0, 0, 0, 1, 1,
-0.9555227, 0.2243129, -1.406863, 0, 0, 0, 1, 1,
-0.9480826, -1.805404, -1.966758, 0, 0, 0, 1, 1,
-0.9466997, -0.9202326, -3.291219, 0, 0, 0, 1, 1,
-0.9441012, -1.086873, -4.198183, 0, 0, 0, 1, 1,
-0.9352333, 1.844362, -1.670091, 0, 0, 0, 1, 1,
-0.9291455, 0.4206608, -0.833079, 1, 1, 1, 1, 1,
-0.9266303, -2.225861, -0.4958624, 1, 1, 1, 1, 1,
-0.9256374, 1.291949, 0.6466541, 1, 1, 1, 1, 1,
-0.9251227, 0.4561982, -1.826824, 1, 1, 1, 1, 1,
-0.9152787, 0.1228612, -1.49955, 1, 1, 1, 1, 1,
-0.91222, 1.416472, -0.397525, 1, 1, 1, 1, 1,
-0.902981, -0.4070423, -1.591345, 1, 1, 1, 1, 1,
-0.900335, 0.875165, -1.894488, 1, 1, 1, 1, 1,
-0.8976874, -1.387655, -3.450538, 1, 1, 1, 1, 1,
-0.8974538, 1.03982, -0.1429305, 1, 1, 1, 1, 1,
-0.895624, 0.6222473, 1.007747, 1, 1, 1, 1, 1,
-0.8933077, 1.236403, 0.5833724, 1, 1, 1, 1, 1,
-0.8886254, 0.6056893, -2.612346, 1, 1, 1, 1, 1,
-0.8865202, -0.176862, -3.614224, 1, 1, 1, 1, 1,
-0.8796261, -1.026826, -1.939108, 1, 1, 1, 1, 1,
-0.8791317, 0.7371535, -2.799339, 0, 0, 1, 1, 1,
-0.8785061, -0.7100326, -3.224057, 1, 0, 0, 1, 1,
-0.8769206, -2.558128, -2.882832, 1, 0, 0, 1, 1,
-0.8768594, -1.2006, -2.266037, 1, 0, 0, 1, 1,
-0.8716328, 0.9354757, -0.948512, 1, 0, 0, 1, 1,
-0.8611466, 0.8630496, -0.620824, 1, 0, 0, 1, 1,
-0.8530573, 0.08584736, -1.521123, 0, 0, 0, 1, 1,
-0.850771, 3.111191, 0.4470804, 0, 0, 0, 1, 1,
-0.8491952, -2.01483, -3.412005, 0, 0, 0, 1, 1,
-0.8487909, -0.03364649, -0.9230415, 0, 0, 0, 1, 1,
-0.8472872, -2.187364, -4.057752, 0, 0, 0, 1, 1,
-0.845246, 0.7275842, -0.5282478, 0, 0, 0, 1, 1,
-0.8450416, 0.6702117, -1.554698, 0, 0, 0, 1, 1,
-0.843551, -0.7050117, -1.799588, 1, 1, 1, 1, 1,
-0.8421113, -0.2255373, -1.250914, 1, 1, 1, 1, 1,
-0.8388346, 0.2874537, 0.3441191, 1, 1, 1, 1, 1,
-0.8331881, 0.009325008, -1.500113, 1, 1, 1, 1, 1,
-0.8158208, -0.5878363, -4.07347, 1, 1, 1, 1, 1,
-0.8102295, 0.2591842, -0.6250429, 1, 1, 1, 1, 1,
-0.8049977, -0.8353586, -1.410971, 1, 1, 1, 1, 1,
-0.8020611, -0.2639814, -1.945641, 1, 1, 1, 1, 1,
-0.8000664, -0.0156309, -1.02056, 1, 1, 1, 1, 1,
-0.7899239, -0.5339963, -3.269702, 1, 1, 1, 1, 1,
-0.7841134, 2.224989, -1.00735, 1, 1, 1, 1, 1,
-0.7757365, -0.3562081, -2.593456, 1, 1, 1, 1, 1,
-0.7738369, -0.1141378, -0.6283105, 1, 1, 1, 1, 1,
-0.7687338, 0.4876903, -0.9992584, 1, 1, 1, 1, 1,
-0.7549552, 0.7831725, -1.654577, 1, 1, 1, 1, 1,
-0.7541667, -1.44848, -0.9179544, 0, 0, 1, 1, 1,
-0.7530621, -0.2307107, -1.933433, 1, 0, 0, 1, 1,
-0.75004, -0.6710918, -2.642415, 1, 0, 0, 1, 1,
-0.7491268, -2.718699, -3.139573, 1, 0, 0, 1, 1,
-0.743129, -0.8455941, -2.740423, 1, 0, 0, 1, 1,
-0.7406707, -0.5619403, -2.019069, 1, 0, 0, 1, 1,
-0.7323574, 0.9510597, -1.280636, 0, 0, 0, 1, 1,
-0.7298105, -0.6521519, -2.440764, 0, 0, 0, 1, 1,
-0.71764, -0.3383609, -1.264226, 0, 0, 0, 1, 1,
-0.7167678, -1.912455, -2.97599, 0, 0, 0, 1, 1,
-0.7144868, 0.7796484, -1.682677, 0, 0, 0, 1, 1,
-0.7129728, 0.005314572, -1.032318, 0, 0, 0, 1, 1,
-0.7129343, -0.4971841, -1.315275, 0, 0, 0, 1, 1,
-0.7082741, -0.5692071, -2.827004, 1, 1, 1, 1, 1,
-0.7082511, -0.4827912, -1.6986, 1, 1, 1, 1, 1,
-0.7078477, 1.006104, -1.745602, 1, 1, 1, 1, 1,
-0.6986615, 1.282438, 0.07074353, 1, 1, 1, 1, 1,
-0.6933185, -0.2223478, -2.688274, 1, 1, 1, 1, 1,
-0.6906344, -0.1111544, -1.707195, 1, 1, 1, 1, 1,
-0.6855822, -1.185413, -2.629848, 1, 1, 1, 1, 1,
-0.6855509, -0.617583, -2.361514, 1, 1, 1, 1, 1,
-0.6840488, 0.04599254, -2.272243, 1, 1, 1, 1, 1,
-0.6801959, -1.087247, -1.332228, 1, 1, 1, 1, 1,
-0.6792325, -0.2182839, -2.290838, 1, 1, 1, 1, 1,
-0.6790237, -1.163205, -1.582283, 1, 1, 1, 1, 1,
-0.6786539, 0.8055843, -0.04735025, 1, 1, 1, 1, 1,
-0.6779638, 0.09046656, -3.467544, 1, 1, 1, 1, 1,
-0.6771199, -0.3589629, -1.203381, 1, 1, 1, 1, 1,
-0.6728176, 1.002295, -1.653774, 0, 0, 1, 1, 1,
-0.6663766, -1.408825, -4.016724, 1, 0, 0, 1, 1,
-0.6655483, -0.4479003, -0.8685955, 1, 0, 0, 1, 1,
-0.6641991, -0.08215826, -1.655947, 1, 0, 0, 1, 1,
-0.652733, -0.06113246, -1.630556, 1, 0, 0, 1, 1,
-0.6456034, 0.0841172, 0.3433047, 1, 0, 0, 1, 1,
-0.6393968, 0.8258332, -1.073345, 0, 0, 0, 1, 1,
-0.6380202, -0.4207146, -1.036495, 0, 0, 0, 1, 1,
-0.6372151, 2.333174, -0.28412, 0, 0, 0, 1, 1,
-0.6329103, 2.156606, -0.1421218, 0, 0, 0, 1, 1,
-0.6315325, -1.238544, -1.654396, 0, 0, 0, 1, 1,
-0.6290371, -0.174945, -1.927186, 0, 0, 0, 1, 1,
-0.6218784, -1.114823, -1.830679, 0, 0, 0, 1, 1,
-0.6213976, -1.405124, -2.593023, 1, 1, 1, 1, 1,
-0.6207978, 1.064975, -1.741784, 1, 1, 1, 1, 1,
-0.6184703, -1.999175, -5.31624, 1, 1, 1, 1, 1,
-0.617551, -1.939814, -3.786009, 1, 1, 1, 1, 1,
-0.6155016, 0.4270036, -1.021233, 1, 1, 1, 1, 1,
-0.6104236, -1.67698, -2.574233, 1, 1, 1, 1, 1,
-0.608412, -2.754905, -3.466972, 1, 1, 1, 1, 1,
-0.6074034, -0.5759868, -3.505991, 1, 1, 1, 1, 1,
-0.6053098, -1.004475, -2.274838, 1, 1, 1, 1, 1,
-0.6028973, 0.362633, -2.091379, 1, 1, 1, 1, 1,
-0.6026146, -0.4049098, -1.892797, 1, 1, 1, 1, 1,
-0.6022782, -0.08585891, -1.258516, 1, 1, 1, 1, 1,
-0.60001, -0.9438562, -1.301288, 1, 1, 1, 1, 1,
-0.5997408, -0.3743657, -1.676061, 1, 1, 1, 1, 1,
-0.5991735, 0.3721643, -0.6387908, 1, 1, 1, 1, 1,
-0.5978435, 0.002910692, -1.258286, 0, 0, 1, 1, 1,
-0.595286, 0.7319707, -1.34618, 1, 0, 0, 1, 1,
-0.5880835, -1.10669, -4.336257, 1, 0, 0, 1, 1,
-0.5845186, 1.731648, -0.9942362, 1, 0, 0, 1, 1,
-0.583266, 0.2137724, -0.2771298, 1, 0, 0, 1, 1,
-0.5807537, 0.929651, -1.828643, 1, 0, 0, 1, 1,
-0.5789792, -0.7802436, -2.544404, 0, 0, 0, 1, 1,
-0.5787243, -0.1129644, -2.690828, 0, 0, 0, 1, 1,
-0.5764396, -0.876419, -2.923204, 0, 0, 0, 1, 1,
-0.5753124, -1.872913, -2.217542, 0, 0, 0, 1, 1,
-0.5751659, -1.410045, -3.093272, 0, 0, 0, 1, 1,
-0.5749488, -0.01117027, -1.769429, 0, 0, 0, 1, 1,
-0.5726767, -1.423293, -2.425553, 0, 0, 0, 1, 1,
-0.5678799, -0.8690912, -3.842172, 1, 1, 1, 1, 1,
-0.5674314, 0.5147751, -1.22471, 1, 1, 1, 1, 1,
-0.565955, -0.009251085, -1.67201, 1, 1, 1, 1, 1,
-0.5653888, -1.057452, -2.066974, 1, 1, 1, 1, 1,
-0.5650496, 0.1589522, -1.317519, 1, 1, 1, 1, 1,
-0.5627767, 0.2189354, -1.587222, 1, 1, 1, 1, 1,
-0.557862, 1.382573, -0.2254418, 1, 1, 1, 1, 1,
-0.5535285, 0.205414, 0.367472, 1, 1, 1, 1, 1,
-0.552879, 0.4171534, 0.5697761, 1, 1, 1, 1, 1,
-0.5481442, 0.5882925, -0.6628742, 1, 1, 1, 1, 1,
-0.5455551, -0.07986274, -1.909419, 1, 1, 1, 1, 1,
-0.544262, -0.02932948, -2.501415, 1, 1, 1, 1, 1,
-0.5393347, 0.4774319, 0.6694351, 1, 1, 1, 1, 1,
-0.5336183, -0.4342269, -2.108396, 1, 1, 1, 1, 1,
-0.5292749, -0.1603954, -1.088789, 1, 1, 1, 1, 1,
-0.5288266, -0.4806875, -2.579661, 0, 0, 1, 1, 1,
-0.5279265, 0.4076994, -2.146418, 1, 0, 0, 1, 1,
-0.5246106, 1.299849, -1.30697, 1, 0, 0, 1, 1,
-0.5242085, 0.2386413, -2.312713, 1, 0, 0, 1, 1,
-0.5237154, -0.06054961, -3.034155, 1, 0, 0, 1, 1,
-0.5208438, 2.474589, -1.300576, 1, 0, 0, 1, 1,
-0.5195262, 0.7730775, 0.5584378, 0, 0, 0, 1, 1,
-0.5185627, -0.1531214, -4.410689, 0, 0, 0, 1, 1,
-0.5183524, -0.314898, -2.355819, 0, 0, 0, 1, 1,
-0.5180849, 0.6354474, -1.032979, 0, 0, 0, 1, 1,
-0.5120661, 0.2198018, -0.8370757, 0, 0, 0, 1, 1,
-0.5089055, -0.01292634, -2.545312, 0, 0, 0, 1, 1,
-0.5082173, -1.481391, -2.114788, 0, 0, 0, 1, 1,
-0.4965204, -0.308974, -2.379219, 1, 1, 1, 1, 1,
-0.49609, -0.07210197, -1.251623, 1, 1, 1, 1, 1,
-0.4916569, 0.7060735, -0.6591215, 1, 1, 1, 1, 1,
-0.4901502, -0.2331395, -3.827356, 1, 1, 1, 1, 1,
-0.4887445, 0.4857627, 0.04472983, 1, 1, 1, 1, 1,
-0.4886201, -0.1832141, -2.871919, 1, 1, 1, 1, 1,
-0.4858648, -0.3304651, -4.328663, 1, 1, 1, 1, 1,
-0.4833251, -0.650398, -1.34901, 1, 1, 1, 1, 1,
-0.4824281, 2.076471, -0.3359466, 1, 1, 1, 1, 1,
-0.4801889, -0.03815346, -0.8967429, 1, 1, 1, 1, 1,
-0.4774527, 1.105212, -0.9988427, 1, 1, 1, 1, 1,
-0.4767559, 0.4238384, -0.4087784, 1, 1, 1, 1, 1,
-0.4760671, 1.212923, -1.959213, 1, 1, 1, 1, 1,
-0.4645108, -0.2897338, -1.730969, 1, 1, 1, 1, 1,
-0.460633, 0.3747421, -0.924095, 1, 1, 1, 1, 1,
-0.459498, 1.679125, 2.564085, 0, 0, 1, 1, 1,
-0.4575564, 0.2509019, -0.5806813, 1, 0, 0, 1, 1,
-0.4521315, -1.070799, -3.915578, 1, 0, 0, 1, 1,
-0.4520879, -0.8216379, -2.40137, 1, 0, 0, 1, 1,
-0.4397925, 1.399234, -0.1799017, 1, 0, 0, 1, 1,
-0.4396312, 0.4119035, -2.155515, 1, 0, 0, 1, 1,
-0.4375345, -0.4766443, -2.974725, 0, 0, 0, 1, 1,
-0.432683, 1.456367, 1.421774, 0, 0, 0, 1, 1,
-0.4314874, -0.1193686, -4.150669, 0, 0, 0, 1, 1,
-0.4291633, -1.314545, -3.963703, 0, 0, 0, 1, 1,
-0.425988, 0.2477186, 0.09059165, 0, 0, 0, 1, 1,
-0.4241863, 2.008447, 0.9496927, 0, 0, 0, 1, 1,
-0.4239964, 0.04753821, -0.8765048, 0, 0, 0, 1, 1,
-0.422803, 0.4080154, -0.9328749, 1, 1, 1, 1, 1,
-0.4217398, 0.1652378, -1.060833, 1, 1, 1, 1, 1,
-0.4206357, 0.4527701, -0.3520898, 1, 1, 1, 1, 1,
-0.4155343, -2.02394, -2.787283, 1, 1, 1, 1, 1,
-0.4132005, -0.4464449, -1.88435, 1, 1, 1, 1, 1,
-0.4098337, 2.39828, 1.887801, 1, 1, 1, 1, 1,
-0.4072626, -1.146771, -3.646631, 1, 1, 1, 1, 1,
-0.4065085, 0.4460549, -1.616316, 1, 1, 1, 1, 1,
-0.4034567, 0.3348354, -1.637181, 1, 1, 1, 1, 1,
-0.4028221, 0.7521056, -2.104171, 1, 1, 1, 1, 1,
-0.4012655, 2.178418, -1.229525, 1, 1, 1, 1, 1,
-0.4006662, 0.5498077, -0.9064281, 1, 1, 1, 1, 1,
-0.4003025, 0.2696353, -1.674625, 1, 1, 1, 1, 1,
-0.3949411, -0.09327218, -2.505688, 1, 1, 1, 1, 1,
-0.392301, 1.13215, -1.786333, 1, 1, 1, 1, 1,
-0.3912004, -0.3220415, -3.616299, 0, 0, 1, 1, 1,
-0.3872978, -0.566971, -3.385962, 1, 0, 0, 1, 1,
-0.3850287, -0.7217491, -4.096861, 1, 0, 0, 1, 1,
-0.3848599, -0.4434684, -2.139605, 1, 0, 0, 1, 1,
-0.3823242, -1.33288, -2.300677, 1, 0, 0, 1, 1,
-0.3647954, -1.445268, -0.9911923, 1, 0, 0, 1, 1,
-0.3598493, 1.770346, 0.2111755, 0, 0, 0, 1, 1,
-0.3593639, -0.7205499, -2.912871, 0, 0, 0, 1, 1,
-0.3576581, 0.08418145, -0.885108, 0, 0, 0, 1, 1,
-0.3566914, 0.7271981, -1.187405, 0, 0, 0, 1, 1,
-0.351715, 0.833452, 0.3539046, 0, 0, 0, 1, 1,
-0.3504577, 1.287064, -0.6253983, 0, 0, 0, 1, 1,
-0.3472395, -0.5865293, -3.685895, 0, 0, 0, 1, 1,
-0.3451494, -0.5671209, -1.756392, 1, 1, 1, 1, 1,
-0.3433656, -0.01996364, -1.627769, 1, 1, 1, 1, 1,
-0.3406434, 0.5080821, -0.2398021, 1, 1, 1, 1, 1,
-0.3402866, -0.05361057, -1.710721, 1, 1, 1, 1, 1,
-0.3370211, 0.3563446, -0.3340188, 1, 1, 1, 1, 1,
-0.3302733, 1.009348, 1.522101, 1, 1, 1, 1, 1,
-0.3267644, -1.060242, -2.605153, 1, 1, 1, 1, 1,
-0.3263225, -0.8857126, -3.193336, 1, 1, 1, 1, 1,
-0.3237149, -0.5650128, -3.520259, 1, 1, 1, 1, 1,
-0.3179699, -1.627695, -2.368448, 1, 1, 1, 1, 1,
-0.3179581, -2.741127, -1.806216, 1, 1, 1, 1, 1,
-0.3145131, -1.128396, -2.358849, 1, 1, 1, 1, 1,
-0.311699, -0.2227019, -1.937832, 1, 1, 1, 1, 1,
-0.310401, 0.6443345, -0.4350086, 1, 1, 1, 1, 1,
-0.3063638, 0.7271855, -0.3126345, 1, 1, 1, 1, 1,
-0.2982948, -0.4316846, -3.29426, 0, 0, 1, 1, 1,
-0.2956439, 0.9606019, -0.2435144, 1, 0, 0, 1, 1,
-0.2950976, -1.543524, -1.242181, 1, 0, 0, 1, 1,
-0.2938273, -0.1036216, -2.722302, 1, 0, 0, 1, 1,
-0.2870608, 1.365898, -0.4286281, 1, 0, 0, 1, 1,
-0.2848232, -0.7358481, -3.25958, 1, 0, 0, 1, 1,
-0.2811538, 1.036693, 0.2858211, 0, 0, 0, 1, 1,
-0.2800764, -0.208453, -2.842297, 0, 0, 0, 1, 1,
-0.2794727, -0.1440055, -1.678684, 0, 0, 0, 1, 1,
-0.2762569, -0.9089746, -3.497758, 0, 0, 0, 1, 1,
-0.2722903, 1.32106, 0.8544714, 0, 0, 0, 1, 1,
-0.2603461, -0.3789084, -1.485672, 0, 0, 0, 1, 1,
-0.2589966, 1.791271, 0.4612868, 0, 0, 0, 1, 1,
-0.2552073, 0.2880764, -2.770463, 1, 1, 1, 1, 1,
-0.2541009, 0.1668001, 0.3868121, 1, 1, 1, 1, 1,
-0.2513077, 0.047158, -2.220833, 1, 1, 1, 1, 1,
-0.2470071, -0.8292254, -2.792769, 1, 1, 1, 1, 1,
-0.2455062, -0.7732462, -2.585717, 1, 1, 1, 1, 1,
-0.243881, -2.191883, -3.976945, 1, 1, 1, 1, 1,
-0.2402666, -1.276163, -3.61537, 1, 1, 1, 1, 1,
-0.2333135, 0.69699, -0.09262228, 1, 1, 1, 1, 1,
-0.2230441, 1.381262, 0.07931806, 1, 1, 1, 1, 1,
-0.2210802, 0.3002343, 0.2666512, 1, 1, 1, 1, 1,
-0.2192233, 0.08386231, 0.3560385, 1, 1, 1, 1, 1,
-0.2185867, 0.5999635, 1.604937, 1, 1, 1, 1, 1,
-0.2172032, -0.7816371, -2.381781, 1, 1, 1, 1, 1,
-0.2126015, -0.01710347, -2.625536, 1, 1, 1, 1, 1,
-0.2102313, -1.056459, -1.909526, 1, 1, 1, 1, 1,
-0.2100241, -0.7067055, -3.228167, 0, 0, 1, 1, 1,
-0.2051488, 0.8943093, -1.040962, 1, 0, 0, 1, 1,
-0.2038415, 0.6457571, 0.4706646, 1, 0, 0, 1, 1,
-0.1992847, -0.705891, -3.213361, 1, 0, 0, 1, 1,
-0.1970502, 1.280847, -0.5556382, 1, 0, 0, 1, 1,
-0.1912717, 1.238707, -0.4522513, 1, 0, 0, 1, 1,
-0.1897112, -0.5604481, -4.259565, 0, 0, 0, 1, 1,
-0.1867554, 0.2180275, -1.796145, 0, 0, 0, 1, 1,
-0.186374, -0.7456272, -1.174473, 0, 0, 0, 1, 1,
-0.1846021, 1.198265, 0.8734643, 0, 0, 0, 1, 1,
-0.1843096, -0.108086, -2.965275, 0, 0, 0, 1, 1,
-0.182228, 1.922388, -0.5632277, 0, 0, 0, 1, 1,
-0.1821014, -1.003885, -3.553643, 0, 0, 0, 1, 1,
-0.1781247, 0.5680597, -0.8558677, 1, 1, 1, 1, 1,
-0.1764199, 1.208354, 1.389968, 1, 1, 1, 1, 1,
-0.1702182, 0.3999186, 0.02811989, 1, 1, 1, 1, 1,
-0.1689336, -0.7206762, -3.031835, 1, 1, 1, 1, 1,
-0.1634662, -0.3170435, -2.817871, 1, 1, 1, 1, 1,
-0.1634632, -0.9129304, -2.434234, 1, 1, 1, 1, 1,
-0.1618677, -0.7866123, -3.356875, 1, 1, 1, 1, 1,
-0.1606386, -1.888812, -2.552608, 1, 1, 1, 1, 1,
-0.1565542, 0.4240672, 0.2084461, 1, 1, 1, 1, 1,
-0.1551426, -0.07024712, -1.076434, 1, 1, 1, 1, 1,
-0.1515111, 0.0319238, -0.3433009, 1, 1, 1, 1, 1,
-0.1441575, -0.7423174, -0.8077449, 1, 1, 1, 1, 1,
-0.1396911, 0.6355567, -1.524063, 1, 1, 1, 1, 1,
-0.1382404, -1.729921, -3.787805, 1, 1, 1, 1, 1,
-0.1237612, 0.8218462, -0.3159959, 1, 1, 1, 1, 1,
-0.1226644, -0.1094384, -3.173209, 0, 0, 1, 1, 1,
-0.1216673, 1.460223, 0.1145398, 1, 0, 0, 1, 1,
-0.1211068, -1.309064, -1.733332, 1, 0, 0, 1, 1,
-0.1191085, -1.331313, -5.289434, 1, 0, 0, 1, 1,
-0.1169082, -0.1634461, -1.081847, 1, 0, 0, 1, 1,
-0.1133611, -0.2746537, -2.208256, 1, 0, 0, 1, 1,
-0.1101802, -0.4830835, -3.762627, 0, 0, 0, 1, 1,
-0.1094125, 1.554434, 0.9338844, 0, 0, 0, 1, 1,
-0.1065973, -0.3476676, -1.802138, 0, 0, 0, 1, 1,
-0.1025284, 0.1487018, -0.7024189, 0, 0, 0, 1, 1,
-0.09806909, -0.3720824, -4.501803, 0, 0, 0, 1, 1,
-0.09721553, -0.3542933, -2.512184, 0, 0, 0, 1, 1,
-0.09106941, -1.653404, -2.753007, 0, 0, 0, 1, 1,
-0.08787181, 1.164166, 1.406342, 1, 1, 1, 1, 1,
-0.08741101, 0.1839222, 2.036943, 1, 1, 1, 1, 1,
-0.08488987, 0.4399799, 1.298895, 1, 1, 1, 1, 1,
-0.08257597, -0.9604829, -3.153189, 1, 1, 1, 1, 1,
-0.082331, 0.5611879, 0.256807, 1, 1, 1, 1, 1,
-0.08205826, -0.9952964, -2.471927, 1, 1, 1, 1, 1,
-0.08197164, -0.8599182, -3.880898, 1, 1, 1, 1, 1,
-0.08135931, 0.6353061, 1.211999, 1, 1, 1, 1, 1,
-0.07711031, -1.700948, -3.408352, 1, 1, 1, 1, 1,
-0.07692634, -0.2254298, -3.04222, 1, 1, 1, 1, 1,
-0.074037, 0.09069628, -0.891696, 1, 1, 1, 1, 1,
-0.07314042, -0.2133428, -2.754056, 1, 1, 1, 1, 1,
-0.07224465, -0.07282421, -2.398047, 1, 1, 1, 1, 1,
-0.07085583, -0.8331169, -2.380692, 1, 1, 1, 1, 1,
-0.07083262, -1.244623, -2.974143, 1, 1, 1, 1, 1,
-0.06849188, -0.6194175, -3.156389, 0, 0, 1, 1, 1,
-0.06611475, 0.3657426, 0.1293684, 1, 0, 0, 1, 1,
-0.06530057, 0.5347946, 0.5930276, 1, 0, 0, 1, 1,
-0.06348439, -0.915526, -2.223826, 1, 0, 0, 1, 1,
-0.06046047, -0.9333237, -2.828798, 1, 0, 0, 1, 1,
-0.05357305, 0.8685037, -0.4718307, 1, 0, 0, 1, 1,
-0.05158245, -0.0259227, -1.008063, 0, 0, 0, 1, 1,
-0.05113075, -2.36085, -2.774981, 0, 0, 0, 1, 1,
-0.04827627, 0.8805301, -0.3751232, 0, 0, 0, 1, 1,
-0.04677432, -0.6352159, -4.099572, 0, 0, 0, 1, 1,
-0.04271599, 0.4964333, -1.227793, 0, 0, 0, 1, 1,
-0.03949558, 0.206591, 0.3014441, 0, 0, 0, 1, 1,
-0.03583492, 0.8939364, 0.5398059, 0, 0, 0, 1, 1,
-0.03225504, -0.4508459, -1.946133, 1, 1, 1, 1, 1,
-0.03146276, -0.4920245, -2.625706, 1, 1, 1, 1, 1,
-0.02976393, -0.453069, -1.961405, 1, 1, 1, 1, 1,
-0.02865015, 0.427558, 1.588366, 1, 1, 1, 1, 1,
-0.0276663, 0.6704372, 1.387257, 1, 1, 1, 1, 1,
-0.0240428, 0.7288172, -0.3681282, 1, 1, 1, 1, 1,
-0.02183677, 1.713183, -0.7171425, 1, 1, 1, 1, 1,
-0.01635905, -0.1537772, -2.856851, 1, 1, 1, 1, 1,
-0.01599364, -0.5179349, -5.160273, 1, 1, 1, 1, 1,
-0.01527163, -0.1666358, -3.172009, 1, 1, 1, 1, 1,
-0.01484352, -2.076676, -3.082531, 1, 1, 1, 1, 1,
-0.0134146, -2.072409, -4.628926, 1, 1, 1, 1, 1,
-0.01306847, 1.473699, 1.127749, 1, 1, 1, 1, 1,
-0.01237888, -1.07926, -3.417457, 1, 1, 1, 1, 1,
-0.01200042, -0.1923016, -1.753383, 1, 1, 1, 1, 1,
-0.01091544, 0.2955099, -0.3643141, 0, 0, 1, 1, 1,
-0.008830395, -0.1364954, -4.030249, 1, 0, 0, 1, 1,
-0.003794443, -1.057117, -3.880724, 1, 0, 0, 1, 1,
-0.002523988, -1.117452, -2.78117, 1, 0, 0, 1, 1,
-0.002358641, -1.362547, -2.865183, 1, 0, 0, 1, 1,
-0.00143156, -0.5707429, -3.020796, 1, 0, 0, 1, 1,
-0.0001509294, 0.7410055, -0.3266183, 0, 0, 0, 1, 1,
0.006855609, -0.5732815, 3.4634, 0, 0, 0, 1, 1,
0.0157422, -0.5811436, 3.448768, 0, 0, 0, 1, 1,
0.01588511, -0.3791819, 2.345538, 0, 0, 0, 1, 1,
0.01652953, 0.3230338, -0.3060142, 0, 0, 0, 1, 1,
0.01750923, 0.4227108, 0.9559909, 0, 0, 0, 1, 1,
0.01757199, 0.5933244, 1.824735, 0, 0, 0, 1, 1,
0.02123486, 0.4645483, -0.3664173, 1, 1, 1, 1, 1,
0.02839402, 0.8212651, 0.7424414, 1, 1, 1, 1, 1,
0.03492352, -1.005344, 2.951517, 1, 1, 1, 1, 1,
0.03624411, 2.386799, 0.4009018, 1, 1, 1, 1, 1,
0.03781589, -0.03237, 2.738397, 1, 1, 1, 1, 1,
0.04115468, 0.03588859, 1.604354, 1, 1, 1, 1, 1,
0.04206236, 0.563579, -0.5045974, 1, 1, 1, 1, 1,
0.04449552, 0.7686194, 0.4780066, 1, 1, 1, 1, 1,
0.044876, -0.6473433, 3.437443, 1, 1, 1, 1, 1,
0.04723556, 1.41178, -0.03446541, 1, 1, 1, 1, 1,
0.05176208, 2.610757, -0.3956488, 1, 1, 1, 1, 1,
0.06025063, -0.5807769, 4.35302, 1, 1, 1, 1, 1,
0.06063994, -0.4797584, 3.934085, 1, 1, 1, 1, 1,
0.06125478, -0.04673066, 2.147905, 1, 1, 1, 1, 1,
0.06929492, 0.1410459, 0.391139, 1, 1, 1, 1, 1,
0.0702882, -1.013653, 4.343501, 0, 0, 1, 1, 1,
0.07596523, 0.6607013, 0.8335264, 1, 0, 0, 1, 1,
0.0776104, -1.335163, 2.437541, 1, 0, 0, 1, 1,
0.07824837, -0.7801192, -0.06656791, 1, 0, 0, 1, 1,
0.07937239, -1.397091, 2.255973, 1, 0, 0, 1, 1,
0.0801516, 1.581405, 0.5572424, 1, 0, 0, 1, 1,
0.08069506, 1.006912, -0.5468218, 0, 0, 0, 1, 1,
0.08142027, -1.347343, 4.050559, 0, 0, 0, 1, 1,
0.08312584, 0.2309157, -0.5979918, 0, 0, 0, 1, 1,
0.09029604, 0.3282636, 0.5280411, 0, 0, 0, 1, 1,
0.0906233, 0.993652, -0.4110944, 0, 0, 0, 1, 1,
0.09361818, -0.884436, 2.340558, 0, 0, 0, 1, 1,
0.09543503, 1.758209, -1.090701, 0, 0, 0, 1, 1,
0.09680134, 0.4102863, 0.5799843, 1, 1, 1, 1, 1,
0.09820963, -0.822553, 0.3005729, 1, 1, 1, 1, 1,
0.09852219, -1.003198, 3.421829, 1, 1, 1, 1, 1,
0.1056479, -1.43302, 3.887856, 1, 1, 1, 1, 1,
0.1080207, -0.3525714, 2.43725, 1, 1, 1, 1, 1,
0.1097361, 0.1763567, 0.463107, 1, 1, 1, 1, 1,
0.1110912, 0.7950734, -0.4828652, 1, 1, 1, 1, 1,
0.1120507, 0.4639917, 0.7887317, 1, 1, 1, 1, 1,
0.1130811, -0.9702863, 3.906699, 1, 1, 1, 1, 1,
0.115348, -0.6895723, 3.095243, 1, 1, 1, 1, 1,
0.1175258, -0.6202025, 4.382356, 1, 1, 1, 1, 1,
0.1217273, 0.3583948, -0.03897622, 1, 1, 1, 1, 1,
0.1240675, -1.155886, 3.830675, 1, 1, 1, 1, 1,
0.1244986, -0.06966823, 1.755887, 1, 1, 1, 1, 1,
0.1250507, 1.964846, 0.242906, 1, 1, 1, 1, 1,
0.1348453, 0.006347632, 2.244667, 0, 0, 1, 1, 1,
0.137416, 0.01347984, 1.840283, 1, 0, 0, 1, 1,
0.1379834, 0.801308, 0.1693827, 1, 0, 0, 1, 1,
0.1382676, 0.3362781, 0.5356032, 1, 0, 0, 1, 1,
0.1414964, 1.282436, 0.02571911, 1, 0, 0, 1, 1,
0.1422835, -0.8186505, 2.685491, 1, 0, 0, 1, 1,
0.1434444, -1.400257, 3.141799, 0, 0, 0, 1, 1,
0.1438195, 1.194374, 0.4971136, 0, 0, 0, 1, 1,
0.1439003, -0.5639613, 1.361495, 0, 0, 0, 1, 1,
0.1439921, -1.505019, 1.030342, 0, 0, 0, 1, 1,
0.1443428, -1.308076, 2.961428, 0, 0, 0, 1, 1,
0.1472902, -0.1432806, 3.650643, 0, 0, 0, 1, 1,
0.1482909, 0.09302993, -0.02609682, 0, 0, 0, 1, 1,
0.1574069, 0.77775, 0.1124735, 1, 1, 1, 1, 1,
0.1669088, 0.8064371, -0.5740274, 1, 1, 1, 1, 1,
0.1725018, -1.687978, 2.450812, 1, 1, 1, 1, 1,
0.1738869, -0.1849865, 4.117298, 1, 1, 1, 1, 1,
0.174064, 0.6934466, 0.868234, 1, 1, 1, 1, 1,
0.1743516, -0.7160312, 2.673182, 1, 1, 1, 1, 1,
0.1748965, 1.572454, -0.4226663, 1, 1, 1, 1, 1,
0.1757798, 1.09056, -0.2220745, 1, 1, 1, 1, 1,
0.1819456, -0.1623371, 2.254358, 1, 1, 1, 1, 1,
0.1873145, 1.158549, -0.06274136, 1, 1, 1, 1, 1,
0.1923994, 1.048697, -0.2545754, 1, 1, 1, 1, 1,
0.1933937, 0.3733782, -0.5506062, 1, 1, 1, 1, 1,
0.2036979, -0.5952688, 2.003098, 1, 1, 1, 1, 1,
0.2049324, -0.7404649, 3.293441, 1, 1, 1, 1, 1,
0.2082369, -0.5493319, 0.8466866, 1, 1, 1, 1, 1,
0.2083229, 0.5015404, 2.052449, 0, 0, 1, 1, 1,
0.2106341, -0.5360674, 3.446514, 1, 0, 0, 1, 1,
0.214013, -0.6205364, 0.8671225, 1, 0, 0, 1, 1,
0.2184939, -0.1625828, 2.729294, 1, 0, 0, 1, 1,
0.2204929, -0.3578684, 3.587363, 1, 0, 0, 1, 1,
0.2210254, 0.105404, 0.7736855, 1, 0, 0, 1, 1,
0.2278912, -0.5875888, 0.4404722, 0, 0, 0, 1, 1,
0.2309936, 1.744028, -0.380003, 0, 0, 0, 1, 1,
0.234118, -1.318811, 1.077032, 0, 0, 0, 1, 1,
0.2348941, 1.627366, 0.5739009, 0, 0, 0, 1, 1,
0.2372595, 0.9154379, -1.374092, 0, 0, 0, 1, 1,
0.2375678, 0.1194263, -0.2317269, 0, 0, 0, 1, 1,
0.242386, 0.05664932, 0.9126471, 0, 0, 0, 1, 1,
0.2448361, 0.9016787, 0.7168604, 1, 1, 1, 1, 1,
0.2513449, 0.1170844, 0.03771241, 1, 1, 1, 1, 1,
0.2531351, -1.957305, 4.630493, 1, 1, 1, 1, 1,
0.2547565, -0.4625322, 3.908557, 1, 1, 1, 1, 1,
0.2559929, 0.4042178, 0.5438871, 1, 1, 1, 1, 1,
0.2591456, 1.638429, -0.5220706, 1, 1, 1, 1, 1,
0.2595799, -0.627026, 1.975606, 1, 1, 1, 1, 1,
0.2634095, -0.02994463, 0.3336648, 1, 1, 1, 1, 1,
0.2657679, -0.8460439, 3.224201, 1, 1, 1, 1, 1,
0.2670785, -0.04298796, 1.649013, 1, 1, 1, 1, 1,
0.273239, -1.220466, 3.631219, 1, 1, 1, 1, 1,
0.2763386, -1.191231, 1.54668, 1, 1, 1, 1, 1,
0.2767777, -0.6850864, 4.041594, 1, 1, 1, 1, 1,
0.2807727, 0.8132118, 0.3613271, 1, 1, 1, 1, 1,
0.2813344, 0.6846732, 0.8611339, 1, 1, 1, 1, 1,
0.2815595, 0.04231721, 1.177136, 0, 0, 1, 1, 1,
0.2829082, -0.9847335, 1.982281, 1, 0, 0, 1, 1,
0.2851776, -0.4221927, 3.805343, 1, 0, 0, 1, 1,
0.2857023, -0.959511, 2.843659, 1, 0, 0, 1, 1,
0.2884528, -0.1592403, 1.480496, 1, 0, 0, 1, 1,
0.2894817, -0.07361857, 2.544672, 1, 0, 0, 1, 1,
0.2912864, -0.5835944, 0.7893727, 0, 0, 0, 1, 1,
0.2963761, -0.9419967, 2.984551, 0, 0, 0, 1, 1,
0.2971529, -0.6459887, 2.582826, 0, 0, 0, 1, 1,
0.2979745, 0.512081, 1.475819, 0, 0, 0, 1, 1,
0.3000965, 0.8194984, -0.7386914, 0, 0, 0, 1, 1,
0.3039885, -2.362789, 3.368187, 0, 0, 0, 1, 1,
0.30629, 1.25339, 1.408852, 0, 0, 0, 1, 1,
0.3065973, 0.162813, 0.5677502, 1, 1, 1, 1, 1,
0.3086847, 1.954507, -0.2304414, 1, 1, 1, 1, 1,
0.30871, -0.5809927, 1.636622, 1, 1, 1, 1, 1,
0.3120648, 0.6996463, 1.269306, 1, 1, 1, 1, 1,
0.3152412, -0.05335632, 2.849982, 1, 1, 1, 1, 1,
0.3160508, 0.9455937, 0.6672368, 1, 1, 1, 1, 1,
0.3181778, -0.8917017, 3.684338, 1, 1, 1, 1, 1,
0.3203269, 0.2602993, 0.07345011, 1, 1, 1, 1, 1,
0.3219586, -0.3033943, 2.053768, 1, 1, 1, 1, 1,
0.3221008, 1.393131, -0.5974799, 1, 1, 1, 1, 1,
0.3305113, 0.06119118, 2.188321, 1, 1, 1, 1, 1,
0.3329052, -0.04981705, 0.9341697, 1, 1, 1, 1, 1,
0.3373966, -1.07352, 3.022819, 1, 1, 1, 1, 1,
0.3374588, -0.634133, 4.032673, 1, 1, 1, 1, 1,
0.3481375, -0.9150149, 1.081213, 1, 1, 1, 1, 1,
0.3484403, -0.2525104, 2.442122, 0, 0, 1, 1, 1,
0.3510266, -0.4568778, 2.182419, 1, 0, 0, 1, 1,
0.3538024, -0.05269369, 0.9321301, 1, 0, 0, 1, 1,
0.354305, 1.071077, 1.981364, 1, 0, 0, 1, 1,
0.3579134, 2.494806, 0.5536798, 1, 0, 0, 1, 1,
0.3602557, -0.734971, 2.070699, 1, 0, 0, 1, 1,
0.3633854, -1.084545, 2.363243, 0, 0, 0, 1, 1,
0.3663324, 0.8917952, -0.2907304, 0, 0, 0, 1, 1,
0.3682388, -0.822301, 1.948337, 0, 0, 0, 1, 1,
0.3708069, 0.1753371, 0.4885019, 0, 0, 0, 1, 1,
0.3746552, -0.8283941, 2.717897, 0, 0, 0, 1, 1,
0.3746606, 0.862174, 0.6242881, 0, 0, 0, 1, 1,
0.3760742, -0.9060707, 2.11432, 0, 0, 0, 1, 1,
0.3809029, 0.2665289, 1.108733, 1, 1, 1, 1, 1,
0.3827039, 0.4939916, 2.301566, 1, 1, 1, 1, 1,
0.3878146, -0.9047992, 2.452462, 1, 1, 1, 1, 1,
0.3963163, 0.3543082, 0.7532877, 1, 1, 1, 1, 1,
0.4015697, -0.1592212, 2.784107, 1, 1, 1, 1, 1,
0.4023409, -1.654824, 1.772548, 1, 1, 1, 1, 1,
0.4075007, 0.8754629, 1.124813, 1, 1, 1, 1, 1,
0.4077255, -0.2608774, 2.119027, 1, 1, 1, 1, 1,
0.4082769, -0.1728937, 1.773648, 1, 1, 1, 1, 1,
0.4090386, -0.2334445, 3.129725, 1, 1, 1, 1, 1,
0.4091026, -0.1839201, 2.767997, 1, 1, 1, 1, 1,
0.4096717, 0.3168469, -0.04224475, 1, 1, 1, 1, 1,
0.4147029, 0.3771331, 0.1583675, 1, 1, 1, 1, 1,
0.4200579, 0.03586318, 1.606041, 1, 1, 1, 1, 1,
0.4215209, 1.216229, -1.33731, 1, 1, 1, 1, 1,
0.4229433, 0.3152153, -0.4598162, 0, 0, 1, 1, 1,
0.4245328, -0.1477976, 0.9710029, 1, 0, 0, 1, 1,
0.434857, 0.4848386, 0.5524296, 1, 0, 0, 1, 1,
0.4379448, -0.8548087, 0.9362504, 1, 0, 0, 1, 1,
0.4388955, -0.7217666, 1.609424, 1, 0, 0, 1, 1,
0.4410314, -1.967212, 3.571686, 1, 0, 0, 1, 1,
0.4415109, 0.3411907, 0.2934641, 0, 0, 0, 1, 1,
0.4437765, 1.804677, -0.7221683, 0, 0, 0, 1, 1,
0.4542715, -0.08925699, 1.121825, 0, 0, 0, 1, 1,
0.4553143, 0.3960871, 0.5498208, 0, 0, 0, 1, 1,
0.4575126, -1.845966, 3.846391, 0, 0, 0, 1, 1,
0.4594587, -0.4602261, 1.239288, 0, 0, 0, 1, 1,
0.4631747, 1.311864, 0.9439475, 0, 0, 0, 1, 1,
0.4641929, -0.8166452, 2.144366, 1, 1, 1, 1, 1,
0.4648138, 0.6356874, -0.1886096, 1, 1, 1, 1, 1,
0.4682984, -0.9674172, 2.257008, 1, 1, 1, 1, 1,
0.4723136, -0.7176305, 3.355759, 1, 1, 1, 1, 1,
0.473777, -2.067758, 2.72017, 1, 1, 1, 1, 1,
0.4756883, -1.309681, 2.56093, 1, 1, 1, 1, 1,
0.476346, -0.6062028, 0.4200723, 1, 1, 1, 1, 1,
0.4787861, 0.831957, 1.755757, 1, 1, 1, 1, 1,
0.4814888, -1.514739, 3.269938, 1, 1, 1, 1, 1,
0.4849316, 0.3723719, -0.6662365, 1, 1, 1, 1, 1,
0.4910571, 1.278338, 0.3478829, 1, 1, 1, 1, 1,
0.4979452, 1.099542, 1.348584, 1, 1, 1, 1, 1,
0.5012759, -1.426689, 3.391381, 1, 1, 1, 1, 1,
0.5019665, -0.06446053, 1.917648, 1, 1, 1, 1, 1,
0.5053261, -0.5982925, 1.222058, 1, 1, 1, 1, 1,
0.5066715, 0.9473503, 0.01848736, 0, 0, 1, 1, 1,
0.5102158, 0.2921258, 1.752731, 1, 0, 0, 1, 1,
0.5125461, 0.4010482, 1.257943, 1, 0, 0, 1, 1,
0.5157466, -0.04126627, 1.811349, 1, 0, 0, 1, 1,
0.5188866, -0.2068419, 1.969319, 1, 0, 0, 1, 1,
0.5189863, -1.864532, 3.850492, 1, 0, 0, 1, 1,
0.5244734, -2.060901, 3.646252, 0, 0, 0, 1, 1,
0.5281447, -0.7596262, 3.433871, 0, 0, 0, 1, 1,
0.5282187, -3.094769, 3.850482, 0, 0, 0, 1, 1,
0.5308079, -1.109704, 2.684249, 0, 0, 0, 1, 1,
0.5374809, -0.4800841, 2.025332, 0, 0, 0, 1, 1,
0.5437376, 0.6162217, 0.05838763, 0, 0, 0, 1, 1,
0.5458486, 1.233442, 0.2588246, 0, 0, 0, 1, 1,
0.5479925, -0.7699428, 2.599899, 1, 1, 1, 1, 1,
0.551517, 0.5170163, -0.8261576, 1, 1, 1, 1, 1,
0.5521594, -1.135697, 3.224063, 1, 1, 1, 1, 1,
0.5532502, 0.03820187, 0.6250228, 1, 1, 1, 1, 1,
0.5566381, -1.953539, 3.755363, 1, 1, 1, 1, 1,
0.5597864, -0.3906031, 3.71986, 1, 1, 1, 1, 1,
0.5608888, 0.5504886, 1.788427, 1, 1, 1, 1, 1,
0.5631685, 0.5493005, -1.243216, 1, 1, 1, 1, 1,
0.5632118, 0.02291318, 0.5378909, 1, 1, 1, 1, 1,
0.5664066, -0.03237186, 0.4400719, 1, 1, 1, 1, 1,
0.566489, 0.2977932, -0.2126457, 1, 1, 1, 1, 1,
0.5747088, -0.4244595, 2.66637, 1, 1, 1, 1, 1,
0.5765458, 0.03488971, 2.543783, 1, 1, 1, 1, 1,
0.5767006, 0.697851, 2.391069, 1, 1, 1, 1, 1,
0.5828541, 0.6560155, -0.9074407, 1, 1, 1, 1, 1,
0.5829919, 0.5923523, 1.178394, 0, 0, 1, 1, 1,
0.5832748, -0.4686677, 1.894557, 1, 0, 0, 1, 1,
0.5837775, 0.7285128, 1.64451, 1, 0, 0, 1, 1,
0.5844827, 0.3412478, 0.8612062, 1, 0, 0, 1, 1,
0.5896805, -0.8752512, 4.180442, 1, 0, 0, 1, 1,
0.5898595, -1.166886, 2.288713, 1, 0, 0, 1, 1,
0.5905048, 0.5199053, 0.787079, 0, 0, 0, 1, 1,
0.5915373, -0.8732471, 3.330441, 0, 0, 0, 1, 1,
0.5917038, -0.282402, 2.595352, 0, 0, 0, 1, 1,
0.5933464, 0.157893, -0.04411776, 0, 0, 0, 1, 1,
0.5974117, 0.6892783, -0.3512508, 0, 0, 0, 1, 1,
0.5992863, 0.6782986, 0.197436, 0, 0, 0, 1, 1,
0.6054705, 1.803577, 0.6647421, 0, 0, 0, 1, 1,
0.6120469, -0.8977464, 2.818939, 1, 1, 1, 1, 1,
0.6291474, -0.2089078, 3.356701, 1, 1, 1, 1, 1,
0.6294943, -3.284293, 3.667189, 1, 1, 1, 1, 1,
0.6330897, 1.859185, 1.060436, 1, 1, 1, 1, 1,
0.6374474, -0.3131, 1.581228, 1, 1, 1, 1, 1,
0.6396095, -0.5468484, 1.216373, 1, 1, 1, 1, 1,
0.6409865, -0.3417906, 1.86344, 1, 1, 1, 1, 1,
0.6420571, 0.71184, 1.867482, 1, 1, 1, 1, 1,
0.6465123, -0.7505974, 2.074544, 1, 1, 1, 1, 1,
0.6492847, -1.667818, 1.766369, 1, 1, 1, 1, 1,
0.6493681, -1.502061, 2.253322, 1, 1, 1, 1, 1,
0.6505935, -0.2862923, 2.977063, 1, 1, 1, 1, 1,
0.6547688, 1.015508, 0.2295343, 1, 1, 1, 1, 1,
0.6590393, -0.814607, 3.888289, 1, 1, 1, 1, 1,
0.6629959, 0.06969895, 2.025362, 1, 1, 1, 1, 1,
0.6685726, 1.800855, 2.172296, 0, 0, 1, 1, 1,
0.671092, -0.9871112, 0.4741438, 1, 0, 0, 1, 1,
0.6743999, -0.7428947, 3.037989, 1, 0, 0, 1, 1,
0.6747065, 0.5053074, 1.580459, 1, 0, 0, 1, 1,
0.6756981, -1.26053, 4.256993, 1, 0, 0, 1, 1,
0.676196, -1.226049, 2.678075, 1, 0, 0, 1, 1,
0.6793583, -1.914477, 3.73701, 0, 0, 0, 1, 1,
0.6811274, 0.6913233, 1.184664, 0, 0, 0, 1, 1,
0.6816525, 0.1148007, 2.187011, 0, 0, 0, 1, 1,
0.6873276, -0.3417147, 2.796836, 0, 0, 0, 1, 1,
0.6911745, -1.130997, 2.387337, 0, 0, 0, 1, 1,
0.6932214, 0.2199141, -0.2008903, 0, 0, 0, 1, 1,
0.69789, 0.8926107, 0.6166869, 0, 0, 0, 1, 1,
0.714182, -1.992239, 2.673938, 1, 1, 1, 1, 1,
0.7162165, 0.366489, -1.21603, 1, 1, 1, 1, 1,
0.717469, 0.6222328, -0.2913991, 1, 1, 1, 1, 1,
0.7187653, -0.4561061, 3.308175, 1, 1, 1, 1, 1,
0.7252904, -1.464222, 1.01479, 1, 1, 1, 1, 1,
0.7281121, -0.8680311, 2.950425, 1, 1, 1, 1, 1,
0.729271, 0.8018306, -0.2469782, 1, 1, 1, 1, 1,
0.7333251, 0.523295, 1.441023, 1, 1, 1, 1, 1,
0.7347002, 0.6559118, 1.548028, 1, 1, 1, 1, 1,
0.7355036, -0.1034838, 1.64003, 1, 1, 1, 1, 1,
0.7415614, -0.8549647, 1.800632, 1, 1, 1, 1, 1,
0.7511542, 0.434236, 1.245555, 1, 1, 1, 1, 1,
0.7596376, -0.29006, 1.471756, 1, 1, 1, 1, 1,
0.7738841, -0.7328382, 1.004323, 1, 1, 1, 1, 1,
0.7757044, 0.8056714, 0.5025927, 1, 1, 1, 1, 1,
0.7757556, 1.930437, -0.4968023, 0, 0, 1, 1, 1,
0.7769607, 0.5439849, 3.184295, 1, 0, 0, 1, 1,
0.7794662, -0.9191455, 3.336955, 1, 0, 0, 1, 1,
0.7832595, -0.07413979, 2.216072, 1, 0, 0, 1, 1,
0.7838603, 1.774754, 0.9321017, 1, 0, 0, 1, 1,
0.8064848, 1.047879, 0.7455843, 1, 0, 0, 1, 1,
0.8065662, -0.8114053, 2.317112, 0, 0, 0, 1, 1,
0.8114644, 1.261288, 0.757553, 0, 0, 0, 1, 1,
0.8170512, 0.6638193, 1.479191, 0, 0, 0, 1, 1,
0.8182201, 1.653046, 1.189471, 0, 0, 0, 1, 1,
0.8206563, 0.07028831, 0.8996677, 0, 0, 0, 1, 1,
0.8273613, 1.929587, 1.187753, 0, 0, 0, 1, 1,
0.8291458, 0.767391, 0.08138601, 0, 0, 0, 1, 1,
0.8306732, -1.513348, 2.27819, 1, 1, 1, 1, 1,
0.8373199, -1.256447, 3.405693, 1, 1, 1, 1, 1,
0.8440696, 0.9096299, 0.4203973, 1, 1, 1, 1, 1,
0.8476909, 1.322594, 2.325854, 1, 1, 1, 1, 1,
0.8512265, -1.017025, 2.757704, 1, 1, 1, 1, 1,
0.8542399, -1.637095, 1.747748, 1, 1, 1, 1, 1,
0.8606895, -0.5773532, 2.407627, 1, 1, 1, 1, 1,
0.8635907, -1.489027, 3.893754, 1, 1, 1, 1, 1,
0.8675947, -2.533833, 2.194786, 1, 1, 1, 1, 1,
0.8713624, -0.4769895, 1.318511, 1, 1, 1, 1, 1,
0.873117, -0.2731816, 1.518791, 1, 1, 1, 1, 1,
0.8738867, 2.316591, 1.904334, 1, 1, 1, 1, 1,
0.8740562, -1.211439, 2.333406, 1, 1, 1, 1, 1,
0.8763235, -0.1295155, 1.473317, 1, 1, 1, 1, 1,
0.8791746, 0.9076859, 1.18753, 1, 1, 1, 1, 1,
0.8964512, -0.01072548, 0.8240126, 0, 0, 1, 1, 1,
0.8966611, -1.424665, 3.721526, 1, 0, 0, 1, 1,
0.8982354, -1.438667, 4.525544, 1, 0, 0, 1, 1,
0.9113269, -1.102335, 1.52653, 1, 0, 0, 1, 1,
0.9208895, 0.2064099, 1.44809, 1, 0, 0, 1, 1,
0.922916, -0.8494306, 2.286128, 1, 0, 0, 1, 1,
0.9313471, 0.3023527, 2.061405, 0, 0, 0, 1, 1,
0.9354125, 0.8112794, 0.9395816, 0, 0, 0, 1, 1,
0.9409452, -1.411919, 1.954567, 0, 0, 0, 1, 1,
0.9423096, 0.01637989, 1.742955, 0, 0, 0, 1, 1,
0.9431355, 1.226263, 1.43716, 0, 0, 0, 1, 1,
0.9450062, 0.8378701, 0.8395056, 0, 0, 0, 1, 1,
0.9458076, 0.1426255, 2.503543, 0, 0, 0, 1, 1,
0.9570935, 0.5872006, -0.9383764, 1, 1, 1, 1, 1,
0.9586149, 0.09153685, 1.185938, 1, 1, 1, 1, 1,
0.9605672, -2.278492, 3.125206, 1, 1, 1, 1, 1,
0.9687198, 0.1737712, 0.4961584, 1, 1, 1, 1, 1,
0.9709162, -0.2154946, 2.853641, 1, 1, 1, 1, 1,
0.9776009, -1.45559, 1.27062, 1, 1, 1, 1, 1,
0.9820188, 0.9770348, 1.317727, 1, 1, 1, 1, 1,
0.9825555, 0.3437831, 2.063907, 1, 1, 1, 1, 1,
0.9885036, 0.04014115, 1.949312, 1, 1, 1, 1, 1,
0.9914282, -0.5829542, 2.773773, 1, 1, 1, 1, 1,
1.012497, 2.735548, 1.416196, 1, 1, 1, 1, 1,
1.018375, 0.7718831, 1.399781, 1, 1, 1, 1, 1,
1.022763, 0.2024482, 0.1079707, 1, 1, 1, 1, 1,
1.028141, -1.822544, 2.487874, 1, 1, 1, 1, 1,
1.02902, 0.9339957, 2.044013, 1, 1, 1, 1, 1,
1.038986, 0.9005885, 0.8425126, 0, 0, 1, 1, 1,
1.040144, -1.610406, 4.661979, 1, 0, 0, 1, 1,
1.048117, -0.7486507, 4.046543, 1, 0, 0, 1, 1,
1.050018, -0.2143908, 0.485268, 1, 0, 0, 1, 1,
1.050999, 0.3323798, 3.507517, 1, 0, 0, 1, 1,
1.051215, 1.031192, 0.7793559, 1, 0, 0, 1, 1,
1.051799, -0.9544591, 2.033957, 0, 0, 0, 1, 1,
1.056052, 0.3831913, 0.5674825, 0, 0, 0, 1, 1,
1.057754, 0.694205, 2.301086, 0, 0, 0, 1, 1,
1.061183, -0.90487, 3.220416, 0, 0, 0, 1, 1,
1.065821, 0.2493789, 0.02767317, 0, 0, 0, 1, 1,
1.065929, 1.295423, -0.3163732, 0, 0, 0, 1, 1,
1.067975, -1.900746, 2.882757, 0, 0, 0, 1, 1,
1.068919, 0.9242811, 1.364866, 1, 1, 1, 1, 1,
1.070236, 0.7989222, -0.7944125, 1, 1, 1, 1, 1,
1.078206, 0.4592113, 0.1518275, 1, 1, 1, 1, 1,
1.082933, -1.593822, 1.536631, 1, 1, 1, 1, 1,
1.084576, -0.2183135, 3.271203, 1, 1, 1, 1, 1,
1.094546, 0.4510582, 0.7091997, 1, 1, 1, 1, 1,
1.100375, -0.7357063, 2.903378, 1, 1, 1, 1, 1,
1.108115, 0.1918117, 0.8650907, 1, 1, 1, 1, 1,
1.109311, 1.201881, 1.39713, 1, 1, 1, 1, 1,
1.117841, -0.48254, 1.632444, 1, 1, 1, 1, 1,
1.125778, 0.5490548, 1.316159, 1, 1, 1, 1, 1,
1.129318, 1.14504, 0.8164943, 1, 1, 1, 1, 1,
1.13155, -0.4377169, 1.912492, 1, 1, 1, 1, 1,
1.13222, 0.1537792, 2.163676, 1, 1, 1, 1, 1,
1.136443, 0.03668911, 0.9946536, 1, 1, 1, 1, 1,
1.139231, 0.3902585, 1.895195, 0, 0, 1, 1, 1,
1.14508, -0.7587397, 0.0267603, 1, 0, 0, 1, 1,
1.154093, -1.673542, 5.400641, 1, 0, 0, 1, 1,
1.154969, -1.32528, 3.291331, 1, 0, 0, 1, 1,
1.157793, 0.709139, -0.1778564, 1, 0, 0, 1, 1,
1.174711, -0.2352076, 2.144948, 1, 0, 0, 1, 1,
1.176708, 0.4143401, 1.336206, 0, 0, 0, 1, 1,
1.179845, 1.009727, 1.263297, 0, 0, 0, 1, 1,
1.191238, -0.2230508, 1.974607, 0, 0, 0, 1, 1,
1.205003, -0.5984912, 1.563589, 0, 0, 0, 1, 1,
1.212084, 0.4114677, -0.4031959, 0, 0, 0, 1, 1,
1.218241, 0.9080352, 0.3235975, 0, 0, 0, 1, 1,
1.220587, -0.7336292, 2.376985, 0, 0, 0, 1, 1,
1.22228, 1.680986, 1.03763, 1, 1, 1, 1, 1,
1.224623, -1.351754, 2.27992, 1, 1, 1, 1, 1,
1.226839, -1.816187, 1.060978, 1, 1, 1, 1, 1,
1.229226, -0.09881237, 1.943867, 1, 1, 1, 1, 1,
1.230241, -1.761486, 3.388206, 1, 1, 1, 1, 1,
1.232384, 0.4772206, 0.6589976, 1, 1, 1, 1, 1,
1.242361, 1.725251, 0.7241601, 1, 1, 1, 1, 1,
1.245124, -0.3392754, 0.5727948, 1, 1, 1, 1, 1,
1.247982, 0.9574227, -1.452999, 1, 1, 1, 1, 1,
1.24959, 4.228236, 0.9817274, 1, 1, 1, 1, 1,
1.251803, -0.6454107, 3.533081, 1, 1, 1, 1, 1,
1.262497, -0.2939005, 2.607738, 1, 1, 1, 1, 1,
1.282527, -0.696838, 1.920451, 1, 1, 1, 1, 1,
1.285082, 0.02128316, 0.8711706, 1, 1, 1, 1, 1,
1.294002, -0.8791453, -0.03573174, 1, 1, 1, 1, 1,
1.296222, 0.6746901, 1.616945, 0, 0, 1, 1, 1,
1.313671, 0.433238, 1.001307, 1, 0, 0, 1, 1,
1.318708, -0.412969, 3.393258, 1, 0, 0, 1, 1,
1.319215, -0.2027051, 3.003838, 1, 0, 0, 1, 1,
1.330559, -1.353097, 1.224117, 1, 0, 0, 1, 1,
1.335374, -0.06563759, 2.364894, 1, 0, 0, 1, 1,
1.346925, -1.829046, 2.39203, 0, 0, 0, 1, 1,
1.351621, -0.7979521, 1.018634, 0, 0, 0, 1, 1,
1.357489, 0.387015, 2.98899, 0, 0, 0, 1, 1,
1.365312, -0.2844025, 1.618227, 0, 0, 0, 1, 1,
1.369891, 1.046036, 0.2608885, 0, 0, 0, 1, 1,
1.374053, -0.6571938, 2.090387, 0, 0, 0, 1, 1,
1.37766, 1.881557, 1.838579, 0, 0, 0, 1, 1,
1.378259, 1.977309, 1.347957, 1, 1, 1, 1, 1,
1.378851, 0.01036266, 1.344224, 1, 1, 1, 1, 1,
1.379603, 0.2351702, 0.6250114, 1, 1, 1, 1, 1,
1.381786, 1.19944, 0.7587479, 1, 1, 1, 1, 1,
1.385142, 0.5203808, 1.134203, 1, 1, 1, 1, 1,
1.39751, 0.7959021, -0.02719902, 1, 1, 1, 1, 1,
1.39878, 0.004659056, 3.006014, 1, 1, 1, 1, 1,
1.406422, 0.1150096, -0.05427701, 1, 1, 1, 1, 1,
1.406891, -0.9896873, 0.4274996, 1, 1, 1, 1, 1,
1.41033, 1.037579, 0.02289591, 1, 1, 1, 1, 1,
1.412002, 0.002074806, 1.575021, 1, 1, 1, 1, 1,
1.41283, -0.2424843, 0.4446949, 1, 1, 1, 1, 1,
1.414772, 0.1837762, 2.640092, 1, 1, 1, 1, 1,
1.416249, 0.3388807, 1.614609, 1, 1, 1, 1, 1,
1.423093, 0.6681997, 0.7763931, 1, 1, 1, 1, 1,
1.432666, 2.67349, -0.2936091, 0, 0, 1, 1, 1,
1.449735, -1.388126, 3.078187, 1, 0, 0, 1, 1,
1.454996, 0.2209038, -0.3016552, 1, 0, 0, 1, 1,
1.455877, -0.5824575, 1.147191, 1, 0, 0, 1, 1,
1.461947, 2.082715, 0.4170948, 1, 0, 0, 1, 1,
1.479733, 0.5782052, 1.040685, 1, 0, 0, 1, 1,
1.49032, -0.8234605, 0.5983251, 0, 0, 0, 1, 1,
1.49035, 2.017567, 1.162736, 0, 0, 0, 1, 1,
1.490915, -0.1772213, 1.014189, 0, 0, 0, 1, 1,
1.492993, -0.7128902, 2.265161, 0, 0, 0, 1, 1,
1.493585, -0.08371596, 3.035564, 0, 0, 0, 1, 1,
1.502855, 0.4910084, 2.620127, 0, 0, 0, 1, 1,
1.509155, -0.8167645, 0.7361284, 0, 0, 0, 1, 1,
1.514578, 1.359425, 1.765771, 1, 1, 1, 1, 1,
1.526206, 0.09424941, 3.855697, 1, 1, 1, 1, 1,
1.534678, 0.9071457, 1.8014, 1, 1, 1, 1, 1,
1.545007, 0.08087227, 0.1786201, 1, 1, 1, 1, 1,
1.54949, -1.713102, 0.8363899, 1, 1, 1, 1, 1,
1.555174, -0.6769236, 3.590816, 1, 1, 1, 1, 1,
1.567038, 0.2148491, 0.08578267, 1, 1, 1, 1, 1,
1.569434, 0.2694907, 1.896105, 1, 1, 1, 1, 1,
1.581312, -0.09726264, 2.173725, 1, 1, 1, 1, 1,
1.596775, 0.8878241, 2.756765, 1, 1, 1, 1, 1,
1.616163, -0.7371916, 1.141059, 1, 1, 1, 1, 1,
1.624113, -0.8982428, 1.903691, 1, 1, 1, 1, 1,
1.631095, -0.4416173, 0.8561695, 1, 1, 1, 1, 1,
1.63915, 0.005074606, 1.17773, 1, 1, 1, 1, 1,
1.640238, -0.270767, 1.746314, 1, 1, 1, 1, 1,
1.651654, 1.186723, 2.377603, 0, 0, 1, 1, 1,
1.656465, 0.120641, 2.650425, 1, 0, 0, 1, 1,
1.679763, 0.8212482, -0.3077049, 1, 0, 0, 1, 1,
1.690951, -1.671497, 3.614143, 1, 0, 0, 1, 1,
1.698153, -0.489005, 1.308341, 1, 0, 0, 1, 1,
1.713278, 0.9898235, 1.066203, 1, 0, 0, 1, 1,
1.716914, 1.115496, 1.610352, 0, 0, 0, 1, 1,
1.718487, 0.1736978, 0.9698009, 0, 0, 0, 1, 1,
1.719573, 0.6704522, 2.525135, 0, 0, 0, 1, 1,
1.738203, 0.6417217, -0.5292014, 0, 0, 0, 1, 1,
1.802722, -1.836803, 2.155375, 0, 0, 0, 1, 1,
1.803401, -0.37418, 1.936021, 0, 0, 0, 1, 1,
1.812411, -1.226373, 1.948755, 0, 0, 0, 1, 1,
1.813812, 1.191158, -0.1966192, 1, 1, 1, 1, 1,
1.857857, -2.636109, 3.429909, 1, 1, 1, 1, 1,
1.863793, -0.886762, 2.971991, 1, 1, 1, 1, 1,
1.864124, -0.03665251, 0.3231103, 1, 1, 1, 1, 1,
1.877203, 0.1472811, 1.42496, 1, 1, 1, 1, 1,
1.897524, 0.05113309, 0.2113811, 1, 1, 1, 1, 1,
1.914376, -1.017744, 3.467159, 1, 1, 1, 1, 1,
1.92251, 0.7819588, 1.510795, 1, 1, 1, 1, 1,
1.928821, 0.9884108, 1.111086, 1, 1, 1, 1, 1,
1.935241, 0.033479, 2.100806, 1, 1, 1, 1, 1,
1.961684, 0.4532499, 3.057375, 1, 1, 1, 1, 1,
1.961953, -0.1052752, 1.721959, 1, 1, 1, 1, 1,
2.009247, -0.3700365, 2.162106, 1, 1, 1, 1, 1,
2.02512, -0.166733, 3.774952, 1, 1, 1, 1, 1,
2.063584, -0.2108206, 0.7981595, 1, 1, 1, 1, 1,
2.102988, -0.8522788, -0.05858181, 0, 0, 1, 1, 1,
2.105618, -0.3667428, 3.154152, 1, 0, 0, 1, 1,
2.115839, -1.444569, 0.8088112, 1, 0, 0, 1, 1,
2.117857, -1.361734, 1.366399, 1, 0, 0, 1, 1,
2.176147, -0.596814, 1.911906, 1, 0, 0, 1, 1,
2.224522, 0.3011233, 2.000603, 1, 0, 0, 1, 1,
2.232698, 1.071168, 0.1966732, 0, 0, 0, 1, 1,
2.237432, -1.484503, 2.305193, 0, 0, 0, 1, 1,
2.241226, 0.4533601, 3.398597, 0, 0, 0, 1, 1,
2.276553, 0.5452324, 3.503552, 0, 0, 0, 1, 1,
2.322518, 1.139263, 1.212211, 0, 0, 0, 1, 1,
2.381028, -0.1460855, 2.558872, 0, 0, 0, 1, 1,
2.384295, -2.670562, 3.117145, 0, 0, 0, 1, 1,
2.517159, 0.1524096, 0.1697404, 1, 1, 1, 1, 1,
2.553733, 0.7560571, 1.756708, 1, 1, 1, 1, 1,
2.710457, 0.06423914, 2.239592, 1, 1, 1, 1, 1,
2.764312, -0.9185333, 0.552228, 1, 1, 1, 1, 1,
2.819643, 1.452664, 1.020058, 1, 1, 1, 1, 1,
2.843794, -0.2212978, 0.7314172, 1, 1, 1, 1, 1,
3.07422, -1.078434, 2.025423, 1, 1, 1, 1, 1
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
var radius = 9.815039;
var distance = 34.47491;
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
mvMatrix.translate( -0.004346371, -0.4719713, -0.0422008 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47491);
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
