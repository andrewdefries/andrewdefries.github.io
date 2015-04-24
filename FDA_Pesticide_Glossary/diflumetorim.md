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
-2.722389, 1.326581, -1.171617, 1, 0, 0, 1,
-2.625323, 2.029784, -0.9639461, 1, 0.007843138, 0, 1,
-2.600391, 0.8569993, -1.138253, 1, 0.01176471, 0, 1,
-2.307081, 0.07045982, -2.273504, 1, 0.01960784, 0, 1,
-2.269561, -0.4790142, -1.628211, 1, 0.02352941, 0, 1,
-2.227202, 0.06310151, -2.502815, 1, 0.03137255, 0, 1,
-2.204446, 0.7529157, -2.167456, 1, 0.03529412, 0, 1,
-2.159868, -0.1056007, -2.53393, 1, 0.04313726, 0, 1,
-2.15526, -1.018499, -2.462781, 1, 0.04705882, 0, 1,
-2.145904, 1.043465, -1.255475, 1, 0.05490196, 0, 1,
-2.122806, 1.159189, -0.4146947, 1, 0.05882353, 0, 1,
-2.121683, -0.4401938, -0.7845924, 1, 0.06666667, 0, 1,
-2.098695, -0.6129377, -0.4462504, 1, 0.07058824, 0, 1,
-2.096751, -1.090418, -2.312353, 1, 0.07843138, 0, 1,
-2.093498, 1.753131, -0.3832929, 1, 0.08235294, 0, 1,
-2.082819, -1.701987, -1.416708, 1, 0.09019608, 0, 1,
-2.068164, -0.6409371, -1.574674, 1, 0.09411765, 0, 1,
-2.060763, 1.657491, -0.1040043, 1, 0.1019608, 0, 1,
-1.986336, -0.2804874, -1.450117, 1, 0.1098039, 0, 1,
-1.976276, -1.003754, -1.630455, 1, 0.1137255, 0, 1,
-1.966938, -1.852953, -2.654485, 1, 0.1215686, 0, 1,
-1.948838, 0.2677453, -1.271354, 1, 0.1254902, 0, 1,
-1.936697, 0.3771372, -0.4084323, 1, 0.1333333, 0, 1,
-1.924637, -1.670539, -2.66125, 1, 0.1372549, 0, 1,
-1.924633, 0.6021972, -0.5394206, 1, 0.145098, 0, 1,
-1.923995, 0.4507481, -3.172489, 1, 0.1490196, 0, 1,
-1.920847, 0.4520331, 0.01826546, 1, 0.1568628, 0, 1,
-1.867848, -1.548084, -2.159836, 1, 0.1607843, 0, 1,
-1.854302, 0.4930927, -1.790975, 1, 0.1686275, 0, 1,
-1.842833, -1.826934, -1.943211, 1, 0.172549, 0, 1,
-1.842604, 0.3575566, -2.064409, 1, 0.1803922, 0, 1,
-1.829628, 0.2826769, -0.6717317, 1, 0.1843137, 0, 1,
-1.82855, -0.6645098, -3.424536, 1, 0.1921569, 0, 1,
-1.822199, -0.1880117, -2.081079, 1, 0.1960784, 0, 1,
-1.805345, 0.333359, -2.06532, 1, 0.2039216, 0, 1,
-1.804911, 0.4777204, -1.03361, 1, 0.2117647, 0, 1,
-1.80018, 0.1556917, -1.167006, 1, 0.2156863, 0, 1,
-1.785778, 0.02620668, -1.020476, 1, 0.2235294, 0, 1,
-1.783805, 0.1037879, -1.709193, 1, 0.227451, 0, 1,
-1.7712, 2.488978, -1.162091, 1, 0.2352941, 0, 1,
-1.764032, -0.257241, -2.756927, 1, 0.2392157, 0, 1,
-1.759754, -1.559451, -2.334277, 1, 0.2470588, 0, 1,
-1.755074, 0.4177766, -2.466417, 1, 0.2509804, 0, 1,
-1.733595, 1.215661, -0.0009947211, 1, 0.2588235, 0, 1,
-1.731258, 1.757072, -0.9479597, 1, 0.2627451, 0, 1,
-1.72684, -0.0928001, -0.6613207, 1, 0.2705882, 0, 1,
-1.723272, -0.4117233, -2.10172, 1, 0.2745098, 0, 1,
-1.723049, 1.069028, -0.1801784, 1, 0.282353, 0, 1,
-1.716999, 0.2312876, -2.427728, 1, 0.2862745, 0, 1,
-1.712339, 0.5905894, 0.8821197, 1, 0.2941177, 0, 1,
-1.702919, -1.018105, -2.843858, 1, 0.3019608, 0, 1,
-1.699251, 0.5850918, -1.9496, 1, 0.3058824, 0, 1,
-1.695623, 1.047185, -0.7193218, 1, 0.3137255, 0, 1,
-1.691253, -2.37326, -2.560887, 1, 0.3176471, 0, 1,
-1.690038, -0.7181175, -2.280215, 1, 0.3254902, 0, 1,
-1.67314, -0.04318153, -1.413262, 1, 0.3294118, 0, 1,
-1.661114, 1.484582, 0.9815668, 1, 0.3372549, 0, 1,
-1.657725, 0.1464973, -1.301077, 1, 0.3411765, 0, 1,
-1.655339, -0.1333079, -0.7673423, 1, 0.3490196, 0, 1,
-1.64817, -0.4302883, -0.7512168, 1, 0.3529412, 0, 1,
-1.61483, -1.153487, -3.971775, 1, 0.3607843, 0, 1,
-1.612807, -0.7230431, -2.271638, 1, 0.3647059, 0, 1,
-1.608968, 0.7595228, 0.4671453, 1, 0.372549, 0, 1,
-1.607763, -0.07085556, -3.260162, 1, 0.3764706, 0, 1,
-1.607408, 0.2142961, -1.68276, 1, 0.3843137, 0, 1,
-1.604802, -1.882411, -1.501831, 1, 0.3882353, 0, 1,
-1.583007, -0.0232113, -2.197439, 1, 0.3960784, 0, 1,
-1.570058, -0.2215963, -2.195403, 1, 0.4039216, 0, 1,
-1.569205, -1.758942, -3.500656, 1, 0.4078431, 0, 1,
-1.563534, -0.9871565, -1.974666, 1, 0.4156863, 0, 1,
-1.562443, 0.8455482, 0.6173779, 1, 0.4196078, 0, 1,
-1.553, -0.01688338, -1.408736, 1, 0.427451, 0, 1,
-1.552601, -1.478567, -0.887086, 1, 0.4313726, 0, 1,
-1.530618, 2.355259, -0.6454361, 1, 0.4392157, 0, 1,
-1.528564, -0.1321147, -3.272879, 1, 0.4431373, 0, 1,
-1.504867, 0.8443104, 0.08500375, 1, 0.4509804, 0, 1,
-1.502231, -1.853708, -3.310354, 1, 0.454902, 0, 1,
-1.497577, 0.1977053, -0.1201048, 1, 0.4627451, 0, 1,
-1.483636, -0.1271722, -1.654816, 1, 0.4666667, 0, 1,
-1.480069, 1.630041, 0.4492522, 1, 0.4745098, 0, 1,
-1.478205, -0.8879153, -1.569456, 1, 0.4784314, 0, 1,
-1.460357, -0.9028646, -2.312823, 1, 0.4862745, 0, 1,
-1.455445, -0.2726903, -1.900888, 1, 0.4901961, 0, 1,
-1.449603, -0.6988206, -1.467748, 1, 0.4980392, 0, 1,
-1.431967, 0.2915024, -1.087865, 1, 0.5058824, 0, 1,
-1.418559, 0.5896419, -0.1942658, 1, 0.509804, 0, 1,
-1.381328, 1.079522, -0.8432224, 1, 0.5176471, 0, 1,
-1.379787, 1.356003, -0.4875305, 1, 0.5215687, 0, 1,
-1.376939, 0.2574408, -1.529366, 1, 0.5294118, 0, 1,
-1.329752, 1.319938, 0.1002672, 1, 0.5333334, 0, 1,
-1.328992, 1.450788, -1.718687, 1, 0.5411765, 0, 1,
-1.320332, -0.4268232, -0.7448155, 1, 0.5450981, 0, 1,
-1.31054, 0.001838546, -0.3014393, 1, 0.5529412, 0, 1,
-1.310165, -0.5812453, -1.87581, 1, 0.5568628, 0, 1,
-1.305996, -0.8076185, -1.556548, 1, 0.5647059, 0, 1,
-1.304736, 1.472513, -0.8775365, 1, 0.5686275, 0, 1,
-1.292265, 0.5696517, -1.316433, 1, 0.5764706, 0, 1,
-1.282956, -1.472901, -0.4933823, 1, 0.5803922, 0, 1,
-1.256001, -0.2220227, -1.457545, 1, 0.5882353, 0, 1,
-1.247019, 0.2464408, -2.403928, 1, 0.5921569, 0, 1,
-1.233288, 0.9300331, -0.1554093, 1, 0.6, 0, 1,
-1.228484, 1.033828, -0.00766747, 1, 0.6078432, 0, 1,
-1.221777, -0.8911055, -0.8936211, 1, 0.6117647, 0, 1,
-1.217532, 0.1541475, -1.155344, 1, 0.6196079, 0, 1,
-1.216095, 0.5779751, -0.7099389, 1, 0.6235294, 0, 1,
-1.213312, -0.5019073, -1.154164, 1, 0.6313726, 0, 1,
-1.210475, -0.7930543, -2.483348, 1, 0.6352941, 0, 1,
-1.206849, 0.3982353, -0.819625, 1, 0.6431373, 0, 1,
-1.201218, 0.1707388, -2.925912, 1, 0.6470588, 0, 1,
-1.200652, -0.2280834, -0.6757772, 1, 0.654902, 0, 1,
-1.194996, -0.5841427, -1.574761, 1, 0.6588235, 0, 1,
-1.194183, -1.131362, -4.604392, 1, 0.6666667, 0, 1,
-1.186961, 0.3749487, -0.755288, 1, 0.6705883, 0, 1,
-1.184768, -0.4510621, -1.764534, 1, 0.6784314, 0, 1,
-1.17723, 1.440072, -1.561672, 1, 0.682353, 0, 1,
-1.165325, 0.8249808, -0.2591719, 1, 0.6901961, 0, 1,
-1.161631, 0.6956424, -1.742975, 1, 0.6941177, 0, 1,
-1.157427, -0.1434404, -1.527007, 1, 0.7019608, 0, 1,
-1.145477, 0.7070992, -1.138708, 1, 0.7098039, 0, 1,
-1.141079, 1.940994, -1.169351, 1, 0.7137255, 0, 1,
-1.140432, 1.926458, -1.841199, 1, 0.7215686, 0, 1,
-1.131789, 0.5281432, 1.115604, 1, 0.7254902, 0, 1,
-1.13008, 0.06268366, -1.052131, 1, 0.7333333, 0, 1,
-1.127627, -1.974493, -1.273868, 1, 0.7372549, 0, 1,
-1.123483, -0.9484575, -3.366345, 1, 0.7450981, 0, 1,
-1.123048, 1.410843, -1.235327, 1, 0.7490196, 0, 1,
-1.114738, -0.176698, -1.775402, 1, 0.7568628, 0, 1,
-1.112085, 0.4314565, -1.930968, 1, 0.7607843, 0, 1,
-1.102741, 2.871209, -1.751397, 1, 0.7686275, 0, 1,
-1.100288, -0.9164128, -3.404588, 1, 0.772549, 0, 1,
-1.089431, -0.5952014, -1.012276, 1, 0.7803922, 0, 1,
-1.081492, 1.802112, -0.115583, 1, 0.7843137, 0, 1,
-1.078712, -0.08608363, -0.518341, 1, 0.7921569, 0, 1,
-1.071434, 1.281468, -2.913577, 1, 0.7960784, 0, 1,
-1.070973, -0.1371741, -1.713492, 1, 0.8039216, 0, 1,
-1.058496, 0.3246782, -0.5404212, 1, 0.8117647, 0, 1,
-1.053753, -1.266168, -3.526548, 1, 0.8156863, 0, 1,
-1.050288, -0.8368963, -1.513902, 1, 0.8235294, 0, 1,
-1.043141, 1.06288, -0.534635, 1, 0.827451, 0, 1,
-1.041335, -0.5421923, -2.409423, 1, 0.8352941, 0, 1,
-1.031789, 0.474016, -0.2611381, 1, 0.8392157, 0, 1,
-1.030795, -0.726448, -2.92933, 1, 0.8470588, 0, 1,
-1.030318, 0.5419529, -1.514719, 1, 0.8509804, 0, 1,
-1.027671, 0.6508415, -2.118985, 1, 0.8588235, 0, 1,
-1.016439, -0.3394365, -1.263757, 1, 0.8627451, 0, 1,
-1.012094, 0.5894659, 0.04207944, 1, 0.8705882, 0, 1,
-1.00931, -1.067043, -2.169597, 1, 0.8745098, 0, 1,
-1.007442, 1.185605, -0.05928839, 1, 0.8823529, 0, 1,
-1.006047, -0.2736027, -0.2064486, 1, 0.8862745, 0, 1,
-1.003483, 0.6877102, -3.195024, 1, 0.8941177, 0, 1,
-1.000218, 1.301778, -0.5448605, 1, 0.8980392, 0, 1,
-0.9999164, 0.0682954, -1.877237, 1, 0.9058824, 0, 1,
-0.9961528, 0.8213639, -1.406357, 1, 0.9137255, 0, 1,
-0.9927192, 0.5320276, -0.5794623, 1, 0.9176471, 0, 1,
-0.9883125, -0.6138895, -1.40464, 1, 0.9254902, 0, 1,
-0.9857615, 0.8727497, -0.2712802, 1, 0.9294118, 0, 1,
-0.9839146, 2.252479, -0.7167749, 1, 0.9372549, 0, 1,
-0.9791325, -0.09613411, -2.042331, 1, 0.9411765, 0, 1,
-0.9782002, -1.013118, -1.963831, 1, 0.9490196, 0, 1,
-0.9762029, 0.2054772, -1.825014, 1, 0.9529412, 0, 1,
-0.9711691, 1.227878, 0.8017399, 1, 0.9607843, 0, 1,
-0.9615349, -0.7883599, -2.415954, 1, 0.9647059, 0, 1,
-0.9614152, -1.897242, -1.754218, 1, 0.972549, 0, 1,
-0.9591095, 1.017747, -2.262187, 1, 0.9764706, 0, 1,
-0.9563602, -1.087154, -1.613712, 1, 0.9843137, 0, 1,
-0.9558142, 0.6044106, -1.524877, 1, 0.9882353, 0, 1,
-0.9529161, -0.04701886, -3.006097, 1, 0.9960784, 0, 1,
-0.9492611, 0.3570936, -0.9937441, 0.9960784, 1, 0, 1,
-0.9482794, -0.3717, -1.217212, 0.9921569, 1, 0, 1,
-0.9481891, 0.3713312, -1.143021, 0.9843137, 1, 0, 1,
-0.9477399, 1.658237, -0.01470829, 0.9803922, 1, 0, 1,
-0.9477382, -0.8691921, -2.453294, 0.972549, 1, 0, 1,
-0.9415311, 0.2688257, -1.01995, 0.9686275, 1, 0, 1,
-0.9413239, 0.006681691, -0.5619166, 0.9607843, 1, 0, 1,
-0.939879, -0.1754503, -1.918607, 0.9568627, 1, 0, 1,
-0.9381726, -1.324191, -3.024669, 0.9490196, 1, 0, 1,
-0.9344398, 1.151572, -0.02052105, 0.945098, 1, 0, 1,
-0.9321967, -0.5096015, -1.093858, 0.9372549, 1, 0, 1,
-0.9241425, 1.036723, 0.9213972, 0.9333333, 1, 0, 1,
-0.9202321, 1.029994, -0.02344356, 0.9254902, 1, 0, 1,
-0.912964, -0.853526, -2.814706, 0.9215686, 1, 0, 1,
-0.9120046, 0.6290525, -1.892928, 0.9137255, 1, 0, 1,
-0.9087823, 0.4862053, -1.399281, 0.9098039, 1, 0, 1,
-0.9011064, 1.592772, -1.717529, 0.9019608, 1, 0, 1,
-0.8993485, -0.4741589, -2.978393, 0.8941177, 1, 0, 1,
-0.8911339, -0.1373093, -0.7411364, 0.8901961, 1, 0, 1,
-0.8903738, -0.2761278, -2.778585, 0.8823529, 1, 0, 1,
-0.8846411, -0.4260759, -3.680976, 0.8784314, 1, 0, 1,
-0.8816975, 0.1643908, 0.2704153, 0.8705882, 1, 0, 1,
-0.8806669, 0.2178493, -0.3487444, 0.8666667, 1, 0, 1,
-0.8795765, -0.7318845, -3.951387, 0.8588235, 1, 0, 1,
-0.8785338, -1.360341, -3.24105, 0.854902, 1, 0, 1,
-0.8770783, 0.4210985, 0.5450079, 0.8470588, 1, 0, 1,
-0.8610517, -0.3459581, -3.114012, 0.8431373, 1, 0, 1,
-0.8592255, -0.6824846, -1.999456, 0.8352941, 1, 0, 1,
-0.8510578, -1.08718, -3.293375, 0.8313726, 1, 0, 1,
-0.8483186, 0.2230994, -1.269628, 0.8235294, 1, 0, 1,
-0.8471264, -1.935568, -2.089731, 0.8196079, 1, 0, 1,
-0.8459087, 0.5085709, -0.5157523, 0.8117647, 1, 0, 1,
-0.845748, -1.054068, -4.496776, 0.8078431, 1, 0, 1,
-0.8451548, 0.9554051, -1.557109, 0.8, 1, 0, 1,
-0.8450688, -1.016988, -4.728058, 0.7921569, 1, 0, 1,
-0.8449311, 0.6174979, -0.3694351, 0.7882353, 1, 0, 1,
-0.8416747, -0.730548, -2.809148, 0.7803922, 1, 0, 1,
-0.8411738, 3.657533, -1.114043, 0.7764706, 1, 0, 1,
-0.8273951, -0.7154688, -2.448894, 0.7686275, 1, 0, 1,
-0.8248646, -0.7959454, -3.589208, 0.7647059, 1, 0, 1,
-0.8236063, 0.2442101, -1.888933, 0.7568628, 1, 0, 1,
-0.8217522, -0.004251357, -1.667554, 0.7529412, 1, 0, 1,
-0.8060681, -0.1893211, -1.278114, 0.7450981, 1, 0, 1,
-0.8030711, -0.3023001, -1.147752, 0.7411765, 1, 0, 1,
-0.8022655, -1.849534, -3.833623, 0.7333333, 1, 0, 1,
-0.7960882, -1.49534, -2.750238, 0.7294118, 1, 0, 1,
-0.7956641, -0.3703935, -1.259301, 0.7215686, 1, 0, 1,
-0.7937479, -0.8114634, -2.591154, 0.7176471, 1, 0, 1,
-0.7828269, -0.2346618, -3.984113, 0.7098039, 1, 0, 1,
-0.7745457, 0.2426645, -0.2235919, 0.7058824, 1, 0, 1,
-0.7722474, -0.8131806, -2.581889, 0.6980392, 1, 0, 1,
-0.7716084, 0.2954185, -0.9483722, 0.6901961, 1, 0, 1,
-0.771496, 2.213143, -2.685051, 0.6862745, 1, 0, 1,
-0.7684778, -0.613914, -1.456905, 0.6784314, 1, 0, 1,
-0.7669679, 0.3621453, -2.566964, 0.6745098, 1, 0, 1,
-0.7617677, 1.923163, -1.069625, 0.6666667, 1, 0, 1,
-0.7598457, -0.1272311, -0.8238553, 0.6627451, 1, 0, 1,
-0.7569896, 0.2275503, -2.501884, 0.654902, 1, 0, 1,
-0.754698, -0.8892111, -2.290817, 0.6509804, 1, 0, 1,
-0.7510405, -0.6236911, -1.060935, 0.6431373, 1, 0, 1,
-0.7474498, -1.73068, -2.793355, 0.6392157, 1, 0, 1,
-0.7473708, 0.3920727, -2.652202, 0.6313726, 1, 0, 1,
-0.7470056, 0.457546, -1.458669, 0.627451, 1, 0, 1,
-0.7456391, 0.2812632, -2.528097, 0.6196079, 1, 0, 1,
-0.7420352, -1.649311, -2.168054, 0.6156863, 1, 0, 1,
-0.7369611, -1.485566, -2.56002, 0.6078432, 1, 0, 1,
-0.7366793, -0.1618139, -2.73127, 0.6039216, 1, 0, 1,
-0.7310456, 0.06109345, -2.061124, 0.5960785, 1, 0, 1,
-0.7279153, 2.753835, -1.309261, 0.5882353, 1, 0, 1,
-0.7271123, 0.3768134, 0.2610731, 0.5843138, 1, 0, 1,
-0.7262383, 0.01057646, -1.577737, 0.5764706, 1, 0, 1,
-0.7234105, -1.114254, -5.597974, 0.572549, 1, 0, 1,
-0.7167398, -1.21083, -4.38459, 0.5647059, 1, 0, 1,
-0.7127439, -1.428414, -1.882643, 0.5607843, 1, 0, 1,
-0.7110515, -0.499466, -1.98568, 0.5529412, 1, 0, 1,
-0.6963195, -2.826801, -4.074704, 0.5490196, 1, 0, 1,
-0.6953928, -0.1870521, -2.112756, 0.5411765, 1, 0, 1,
-0.6951892, 1.569825, -0.02703641, 0.5372549, 1, 0, 1,
-0.6923529, -1.15609, -2.346068, 0.5294118, 1, 0, 1,
-0.6920484, 1.038626, -1.882383, 0.5254902, 1, 0, 1,
-0.6896493, -0.610442, -2.446167, 0.5176471, 1, 0, 1,
-0.6864468, -0.2861222, -1.60791, 0.5137255, 1, 0, 1,
-0.6785866, 1.199845, -1.839832, 0.5058824, 1, 0, 1,
-0.6779737, -0.1069309, -0.194658, 0.5019608, 1, 0, 1,
-0.6773407, 0.4385122, -0.06479648, 0.4941176, 1, 0, 1,
-0.6703966, 0.9457736, -2.077922, 0.4862745, 1, 0, 1,
-0.668441, 0.7155882, 1.888975, 0.4823529, 1, 0, 1,
-0.6665109, -1.61359, -3.473, 0.4745098, 1, 0, 1,
-0.6645882, -0.3885057, -2.210497, 0.4705882, 1, 0, 1,
-0.6466755, -0.04001609, -1.630216, 0.4627451, 1, 0, 1,
-0.6455797, -1.347982, -1.521253, 0.4588235, 1, 0, 1,
-0.6448336, -0.05584484, -0.9786269, 0.4509804, 1, 0, 1,
-0.6388047, -0.4728591, -1.138321, 0.4470588, 1, 0, 1,
-0.6382276, 0.763546, -1.399197, 0.4392157, 1, 0, 1,
-0.6367527, -2.01107, -2.169283, 0.4352941, 1, 0, 1,
-0.6360352, -1.785621, -3.144419, 0.427451, 1, 0, 1,
-0.6338056, 0.4977323, 1.337129, 0.4235294, 1, 0, 1,
-0.6312822, 1.24247, 0.0691615, 0.4156863, 1, 0, 1,
-0.6304291, 0.6630963, 0.2741031, 0.4117647, 1, 0, 1,
-0.6122022, 1.123851, 0.1529484, 0.4039216, 1, 0, 1,
-0.6100342, 0.1622444, -3.224239, 0.3960784, 1, 0, 1,
-0.6024807, -0.7614191, -1.945326, 0.3921569, 1, 0, 1,
-0.6003416, 0.1378176, -0.7791962, 0.3843137, 1, 0, 1,
-0.5961417, -0.9900554, -3.002867, 0.3803922, 1, 0, 1,
-0.5939783, 1.130157, -0.6967241, 0.372549, 1, 0, 1,
-0.5925855, -0.247499, -2.404224, 0.3686275, 1, 0, 1,
-0.5906368, -0.8771271, -2.447399, 0.3607843, 1, 0, 1,
-0.5880426, 1.355846, -1.303543, 0.3568628, 1, 0, 1,
-0.5880246, -2.406918, -0.7419765, 0.3490196, 1, 0, 1,
-0.582309, 0.7653056, 0.5774453, 0.345098, 1, 0, 1,
-0.5796568, 1.593627, 1.460336, 0.3372549, 1, 0, 1,
-0.5793673, 0.6380436, 0.2056139, 0.3333333, 1, 0, 1,
-0.5757622, -0.2917816, 0.1214902, 0.3254902, 1, 0, 1,
-0.5751181, 0.3377326, -1.113915, 0.3215686, 1, 0, 1,
-0.5717884, -0.1832451, -2.073026, 0.3137255, 1, 0, 1,
-0.5681931, 1.047398, -0.3769166, 0.3098039, 1, 0, 1,
-0.5679431, 1.926384, -0.3447109, 0.3019608, 1, 0, 1,
-0.5621417, -0.3277032, -1.065472, 0.2941177, 1, 0, 1,
-0.5580255, -0.3838857, -1.337843, 0.2901961, 1, 0, 1,
-0.5566587, 0.0184199, -2.141651, 0.282353, 1, 0, 1,
-0.5522097, 0.03837802, -2.486877, 0.2784314, 1, 0, 1,
-0.5409177, 0.2348638, -0.9397398, 0.2705882, 1, 0, 1,
-0.5387917, -0.7420815, -0.1021312, 0.2666667, 1, 0, 1,
-0.5319563, -0.3692591, -1.556872, 0.2588235, 1, 0, 1,
-0.5275422, 0.2169459, -1.877126, 0.254902, 1, 0, 1,
-0.5260937, 0.8374453, 1.781186, 0.2470588, 1, 0, 1,
-0.5251885, -0.5399884, -2.193568, 0.2431373, 1, 0, 1,
-0.5199713, -0.1803509, -0.5286607, 0.2352941, 1, 0, 1,
-0.5184887, -1.991268, -3.733738, 0.2313726, 1, 0, 1,
-0.5148029, 0.2224465, -1.03864, 0.2235294, 1, 0, 1,
-0.5134539, -1.284825, -2.553857, 0.2196078, 1, 0, 1,
-0.5132322, 0.6874869, 0.03834022, 0.2117647, 1, 0, 1,
-0.5116153, -0.3778352, -1.572075, 0.2078431, 1, 0, 1,
-0.5058244, -0.5216557, -1.61874, 0.2, 1, 0, 1,
-0.5028412, 2.109264, 1.439019, 0.1921569, 1, 0, 1,
-0.4955755, 1.02999, -1.171463, 0.1882353, 1, 0, 1,
-0.4888537, 0.8506713, -1.173054, 0.1803922, 1, 0, 1,
-0.4856525, 0.6458711, -1.523194, 0.1764706, 1, 0, 1,
-0.483579, -0.04837452, -2.050848, 0.1686275, 1, 0, 1,
-0.4818059, 0.383694, -2.857872, 0.1647059, 1, 0, 1,
-0.481685, -2.231351, -2.820768, 0.1568628, 1, 0, 1,
-0.4815418, -1.280791, -4.702579, 0.1529412, 1, 0, 1,
-0.4786395, -1.11661, -2.868041, 0.145098, 1, 0, 1,
-0.4779809, 0.3937325, 0.4057812, 0.1411765, 1, 0, 1,
-0.4776953, -0.1372509, -1.4662, 0.1333333, 1, 0, 1,
-0.4725085, -0.2944843, -3.039377, 0.1294118, 1, 0, 1,
-0.4666708, 0.7052141, -0.9841487, 0.1215686, 1, 0, 1,
-0.4635122, 0.8327855, -1.357987, 0.1176471, 1, 0, 1,
-0.4625777, 0.4601352, -1.273329, 0.1098039, 1, 0, 1,
-0.4597086, 0.14293, -0.4170144, 0.1058824, 1, 0, 1,
-0.4594732, 1.811995, 0.2535766, 0.09803922, 1, 0, 1,
-0.4579234, 0.9911791, 0.6949558, 0.09019608, 1, 0, 1,
-0.4548261, -0.1569931, -1.607736, 0.08627451, 1, 0, 1,
-0.4520122, -0.08303687, -1.97604, 0.07843138, 1, 0, 1,
-0.4503838, 0.258345, 0.0867652, 0.07450981, 1, 0, 1,
-0.4422004, -0.4494322, -3.690817, 0.06666667, 1, 0, 1,
-0.4411081, 0.7717175, -0.4783854, 0.0627451, 1, 0, 1,
-0.4374641, -0.4955888, -2.291695, 0.05490196, 1, 0, 1,
-0.4367733, -0.5426731, -1.576728, 0.05098039, 1, 0, 1,
-0.4302437, 1.28918, 0.02220382, 0.04313726, 1, 0, 1,
-0.4282778, 0.7756501, 0.5230333, 0.03921569, 1, 0, 1,
-0.4278555, -0.5793089, -2.573756, 0.03137255, 1, 0, 1,
-0.4263626, 1.121946, 0.04081691, 0.02745098, 1, 0, 1,
-0.4227343, 1.066581, -0.7221082, 0.01960784, 1, 0, 1,
-0.4172143, -1.352292, -3.847145, 0.01568628, 1, 0, 1,
-0.4133271, 2.086288, -0.01728411, 0.007843138, 1, 0, 1,
-0.4124691, -1.522508, -4.534028, 0.003921569, 1, 0, 1,
-0.411404, 0.192067, -1.772272, 0, 1, 0.003921569, 1,
-0.409312, 2.76359, 1.203272, 0, 1, 0.01176471, 1,
-0.4086692, -1.240916, -1.672318, 0, 1, 0.01568628, 1,
-0.4011832, 0.2750597, -1.233314, 0, 1, 0.02352941, 1,
-0.4010106, 1.10157, 0.9959105, 0, 1, 0.02745098, 1,
-0.3980477, 0.06967089, -1.338409, 0, 1, 0.03529412, 1,
-0.3971443, 0.6545115, -0.5480008, 0, 1, 0.03921569, 1,
-0.39431, 0.7453309, -0.8838912, 0, 1, 0.04705882, 1,
-0.3930972, -0.3668185, -2.013598, 0, 1, 0.05098039, 1,
-0.392996, 0.5535367, -2.687509, 0, 1, 0.05882353, 1,
-0.3907072, -0.4858103, -3.385302, 0, 1, 0.0627451, 1,
-0.3860813, -0.5568093, -1.035824, 0, 1, 0.07058824, 1,
-0.3845589, 0.06450347, -2.774641, 0, 1, 0.07450981, 1,
-0.3834432, 1.013873, 0.4922349, 0, 1, 0.08235294, 1,
-0.382308, -1.309419, -3.077455, 0, 1, 0.08627451, 1,
-0.3816133, 0.6665785, -2.013092, 0, 1, 0.09411765, 1,
-0.3798932, 1.303388, -1.072345, 0, 1, 0.1019608, 1,
-0.3780423, 1.07251, -1.003985, 0, 1, 0.1058824, 1,
-0.3749842, 0.5223987, -0.5591958, 0, 1, 0.1137255, 1,
-0.3749722, -1.909869, -2.763368, 0, 1, 0.1176471, 1,
-0.3722557, 0.3617207, 0.1530253, 0, 1, 0.1254902, 1,
-0.3658779, -0.6395975, -4.884874, 0, 1, 0.1294118, 1,
-0.3653466, 0.3952045, -1.008655, 0, 1, 0.1372549, 1,
-0.3650376, -0.5141768, -2.727834, 0, 1, 0.1411765, 1,
-0.3648051, -0.6757577, -3.758347, 0, 1, 0.1490196, 1,
-0.362188, 0.3878905, -0.8706547, 0, 1, 0.1529412, 1,
-0.349256, 0.9935948, -0.1563918, 0, 1, 0.1607843, 1,
-0.3457043, 0.3907503, -1.812319, 0, 1, 0.1647059, 1,
-0.3454907, -0.8018324, -2.402713, 0, 1, 0.172549, 1,
-0.3443223, 0.9228611, 1.250542, 0, 1, 0.1764706, 1,
-0.3417001, 0.1073192, -1.942479, 0, 1, 0.1843137, 1,
-0.3391844, -0.4503198, -3.675201, 0, 1, 0.1882353, 1,
-0.3367044, 0.4305071, 0.1475056, 0, 1, 0.1960784, 1,
-0.3348479, -0.2302655, -1.079304, 0, 1, 0.2039216, 1,
-0.3345647, 1.405985, 0.7787036, 0, 1, 0.2078431, 1,
-0.3331296, 0.05742332, -0.6111708, 0, 1, 0.2156863, 1,
-0.328192, 1.960457, -0.01985093, 0, 1, 0.2196078, 1,
-0.3276604, 0.3381156, -0.6332032, 0, 1, 0.227451, 1,
-0.3275836, -0.5439913, -0.2442535, 0, 1, 0.2313726, 1,
-0.3261189, -1.098982, -1.987393, 0, 1, 0.2392157, 1,
-0.3219115, 0.6820442, 0.5543059, 0, 1, 0.2431373, 1,
-0.3182542, 0.5562879, -1.043504, 0, 1, 0.2509804, 1,
-0.3122475, 0.8851603, 0.9273266, 0, 1, 0.254902, 1,
-0.3081981, 0.2503282, -0.9887199, 0, 1, 0.2627451, 1,
-0.3076612, 0.5584538, -1.169187, 0, 1, 0.2666667, 1,
-0.3030882, -1.395084, -3.453023, 0, 1, 0.2745098, 1,
-0.3027798, 1.332232, 0.2215814, 0, 1, 0.2784314, 1,
-0.2972373, -1.582667, -4.275736, 0, 1, 0.2862745, 1,
-0.2963862, 2.05587, -0.9393635, 0, 1, 0.2901961, 1,
-0.2960549, 0.731357, -0.5834284, 0, 1, 0.2980392, 1,
-0.2939925, 0.1250881, -0.7391784, 0, 1, 0.3058824, 1,
-0.2938277, -0.2529203, -0.9537347, 0, 1, 0.3098039, 1,
-0.2914353, 0.2187794, -0.1146603, 0, 1, 0.3176471, 1,
-0.2866674, -1.300839, -3.325903, 0, 1, 0.3215686, 1,
-0.2841433, -0.5935196, -1.446216, 0, 1, 0.3294118, 1,
-0.2833529, -0.5465164, -2.193503, 0, 1, 0.3333333, 1,
-0.2811757, -0.2711538, -2.083817, 0, 1, 0.3411765, 1,
-0.2810863, 1.905332, 1.921971, 0, 1, 0.345098, 1,
-0.2791029, -0.6074305, -1.677522, 0, 1, 0.3529412, 1,
-0.2764106, 1.538124, 0.3872276, 0, 1, 0.3568628, 1,
-0.2716264, -0.8489386, -3.876232, 0, 1, 0.3647059, 1,
-0.2661282, 0.4805928, -0.6330708, 0, 1, 0.3686275, 1,
-0.2632682, -0.2417529, -2.97812, 0, 1, 0.3764706, 1,
-0.2621111, -0.2582566, -2.561489, 0, 1, 0.3803922, 1,
-0.2596155, -1.358113, -1.066319, 0, 1, 0.3882353, 1,
-0.2585689, 0.3108465, -0.696516, 0, 1, 0.3921569, 1,
-0.2579242, -0.7577472, -2.375028, 0, 1, 0.4, 1,
-0.2498562, 0.0332756, -0.792389, 0, 1, 0.4078431, 1,
-0.2445052, 0.0498689, -2.82047, 0, 1, 0.4117647, 1,
-0.2443956, -0.5631841, -1.792612, 0, 1, 0.4196078, 1,
-0.2426681, -1.830403, -1.403334, 0, 1, 0.4235294, 1,
-0.2383585, 1.717703, -0.6618441, 0, 1, 0.4313726, 1,
-0.2311902, 0.3810873, 1.639249, 0, 1, 0.4352941, 1,
-0.2288649, 0.7577955, 0.1624963, 0, 1, 0.4431373, 1,
-0.2285943, 0.8550745, 0.2823091, 0, 1, 0.4470588, 1,
-0.2261188, -1.367404, -4.751301, 0, 1, 0.454902, 1,
-0.2203927, -0.1358927, -3.657025, 0, 1, 0.4588235, 1,
-0.2199988, -1.019338, -4.546695, 0, 1, 0.4666667, 1,
-0.2166402, -1.469831, -3.011612, 0, 1, 0.4705882, 1,
-0.2164357, -0.6955386, -3.050586, 0, 1, 0.4784314, 1,
-0.2081737, -0.4949064, -1.738896, 0, 1, 0.4823529, 1,
-0.2067592, -0.5090072, -0.654877, 0, 1, 0.4901961, 1,
-0.2038911, -1.230711, -1.149213, 0, 1, 0.4941176, 1,
-0.2036477, -0.09469688, -2.17507, 0, 1, 0.5019608, 1,
-0.1994729, -1.000986, -3.799955, 0, 1, 0.509804, 1,
-0.1938927, -0.9219562, -4.054679, 0, 1, 0.5137255, 1,
-0.1914529, -0.1307845, -0.9264582, 0, 1, 0.5215687, 1,
-0.1885276, -2.562762, -1.583318, 0, 1, 0.5254902, 1,
-0.1844509, -0.5870417, -2.78523, 0, 1, 0.5333334, 1,
-0.1836552, -0.5282421, -2.087212, 0, 1, 0.5372549, 1,
-0.1826419, 0.294513, -1.126709, 0, 1, 0.5450981, 1,
-0.1801936, -0.00480022, -1.803078, 0, 1, 0.5490196, 1,
-0.1794132, 0.9445671, 0.006882568, 0, 1, 0.5568628, 1,
-0.1792075, -0.2317252, -2.224452, 0, 1, 0.5607843, 1,
-0.1681722, -0.72168, -2.989463, 0, 1, 0.5686275, 1,
-0.1649819, 0.07448427, -0.1861897, 0, 1, 0.572549, 1,
-0.1628614, -0.6794679, -1.72922, 0, 1, 0.5803922, 1,
-0.162015, 0.7888325, -0.194497, 0, 1, 0.5843138, 1,
-0.1582652, -0.3191222, -4.988959, 0, 1, 0.5921569, 1,
-0.1582159, 0.491699, 0.5152552, 0, 1, 0.5960785, 1,
-0.1563984, 2.674155, -0.6119108, 0, 1, 0.6039216, 1,
-0.1561445, 0.8669293, 0.2225689, 0, 1, 0.6117647, 1,
-0.1561084, -1.395705, -3.206115, 0, 1, 0.6156863, 1,
-0.1539119, -1.802095, -2.701204, 0, 1, 0.6235294, 1,
-0.1469306, -1.136654, -4.04411, 0, 1, 0.627451, 1,
-0.1464282, 0.8922966, -1.26304, 0, 1, 0.6352941, 1,
-0.1460613, -1.224458, -3.282382, 0, 1, 0.6392157, 1,
-0.1418313, 1.250988, 0.2469014, 0, 1, 0.6470588, 1,
-0.140596, -0.1585065, -1.878214, 0, 1, 0.6509804, 1,
-0.1403054, 1.784269, -1.649788, 0, 1, 0.6588235, 1,
-0.1385812, 0.4721577, 0.4530566, 0, 1, 0.6627451, 1,
-0.1382193, -0.1588297, -3.112354, 0, 1, 0.6705883, 1,
-0.1381929, -0.01621208, -1.522805, 0, 1, 0.6745098, 1,
-0.1355361, -0.1491749, -1.194378, 0, 1, 0.682353, 1,
-0.1260412, 1.646235, 0.2952459, 0, 1, 0.6862745, 1,
-0.1215959, -2.010827, -3.338967, 0, 1, 0.6941177, 1,
-0.1201532, 0.831333, -0.1733061, 0, 1, 0.7019608, 1,
-0.1193922, 0.7074474, -1.01542, 0, 1, 0.7058824, 1,
-0.1143555, -1.384534, -1.469854, 0, 1, 0.7137255, 1,
-0.09883548, 0.9731339, -1.7227, 0, 1, 0.7176471, 1,
-0.08973575, -1.795677, -1.631059, 0, 1, 0.7254902, 1,
-0.08865403, -0.4376526, -2.8276, 0, 1, 0.7294118, 1,
-0.08720766, -0.1698915, -4.857383, 0, 1, 0.7372549, 1,
-0.08702202, -0.3692309, -1.904999, 0, 1, 0.7411765, 1,
-0.08217841, -0.3365428, -3.809642, 0, 1, 0.7490196, 1,
-0.08194195, 0.2339395, 0.2074154, 0, 1, 0.7529412, 1,
-0.08141737, 0.05197992, -1.278763, 0, 1, 0.7607843, 1,
-0.07265869, 1.605157, -0.357792, 0, 1, 0.7647059, 1,
-0.07174657, -1.880908, -5.647063, 0, 1, 0.772549, 1,
-0.06611835, 1.194959, 0.687537, 0, 1, 0.7764706, 1,
-0.06546365, 0.3045475, -0.4935846, 0, 1, 0.7843137, 1,
-0.06474315, 0.7361665, -2.010174, 0, 1, 0.7882353, 1,
-0.05957199, 0.4201072, 1.48472, 0, 1, 0.7960784, 1,
-0.0583923, 1.314566, 0.9741845, 0, 1, 0.8039216, 1,
-0.0554928, 0.99562, 0.6703107, 0, 1, 0.8078431, 1,
-0.05492176, -0.4707576, -2.359099, 0, 1, 0.8156863, 1,
-0.05434122, 1.24489, 1.036714, 0, 1, 0.8196079, 1,
-0.05357437, -0.1712607, -2.61774, 0, 1, 0.827451, 1,
-0.05307624, -1.152399, -1.808729, 0, 1, 0.8313726, 1,
-0.05224205, -0.2094271, -1.658521, 0, 1, 0.8392157, 1,
-0.04498776, 0.5193569, 1.110874, 0, 1, 0.8431373, 1,
-0.03869072, -0.7395687, -3.464116, 0, 1, 0.8509804, 1,
-0.03643685, 0.6348947, 0.09998076, 0, 1, 0.854902, 1,
-0.03561334, -0.006135857, -0.09245197, 0, 1, 0.8627451, 1,
-0.03330813, 0.1043274, -1.063648, 0, 1, 0.8666667, 1,
-0.03019796, 0.1860819, -0.8897323, 0, 1, 0.8745098, 1,
-0.02614599, 0.4795938, 0.1010461, 0, 1, 0.8784314, 1,
-0.02581229, 1.46903, 1.799347, 0, 1, 0.8862745, 1,
-0.02547721, -0.006168289, -2.405889, 0, 1, 0.8901961, 1,
-0.0198647, 0.5531607, -0.6570166, 0, 1, 0.8980392, 1,
-0.01897229, -0.5677322, -3.716241, 0, 1, 0.9058824, 1,
-0.01762132, 0.3877082, 1.02138, 0, 1, 0.9098039, 1,
-0.01400936, -0.2493762, -3.482966, 0, 1, 0.9176471, 1,
-0.01262473, 0.4509605, -0.1343593, 0, 1, 0.9215686, 1,
-0.01008348, -1.001068, -1.65972, 0, 1, 0.9294118, 1,
-0.00891581, 0.6205972, 1.004586, 0, 1, 0.9333333, 1,
-0.002875093, -0.25708, -2.431987, 0, 1, 0.9411765, 1,
-0.00136734, -0.442668, -2.076166, 0, 1, 0.945098, 1,
0.003865702, -1.013601, 2.885059, 0, 1, 0.9529412, 1,
0.004084622, 1.094641, -0.4403948, 0, 1, 0.9568627, 1,
0.006382863, -0.06868605, 2.896263, 0, 1, 0.9647059, 1,
0.008081921, 0.1241734, 0.03659545, 0, 1, 0.9686275, 1,
0.01299683, -0.3886712, 3.807511, 0, 1, 0.9764706, 1,
0.01377271, -0.9026029, 3.396363, 0, 1, 0.9803922, 1,
0.01421577, 0.7310279, -0.233123, 0, 1, 0.9882353, 1,
0.02179868, -0.525948, 4.538578, 0, 1, 0.9921569, 1,
0.0236007, -0.8607254, 1.118048, 0, 1, 1, 1,
0.02491666, 1.047119, 0.08240141, 0, 0.9921569, 1, 1,
0.03074096, 1.40794, -0.5716231, 0, 0.9882353, 1, 1,
0.03418258, 0.03837955, 1.464923, 0, 0.9803922, 1, 1,
0.03419235, 1.227087, 1.509273, 0, 0.9764706, 1, 1,
0.03422975, 2.207186, -0.04591415, 0, 0.9686275, 1, 1,
0.03533821, -0.2602402, 3.377472, 0, 0.9647059, 1, 1,
0.04188391, -1.971978, 2.132681, 0, 0.9568627, 1, 1,
0.04559124, 0.09464518, -1.175182, 0, 0.9529412, 1, 1,
0.04758136, 0.6950777, 0.8829935, 0, 0.945098, 1, 1,
0.04922298, -1.319859, 3.103291, 0, 0.9411765, 1, 1,
0.05272807, 0.9782245, 0.1455652, 0, 0.9333333, 1, 1,
0.05636461, 0.1877629, 0.3671203, 0, 0.9294118, 1, 1,
0.05854551, -0.8446862, 5.000934, 0, 0.9215686, 1, 1,
0.06126247, -1.621911, 3.428788, 0, 0.9176471, 1, 1,
0.06289607, 0.4840558, -0.8315182, 0, 0.9098039, 1, 1,
0.065037, -0.9173473, 2.8528, 0, 0.9058824, 1, 1,
0.06747939, 1.112696, 0.009157894, 0, 0.8980392, 1, 1,
0.06829284, -1.134376, 3.771144, 0, 0.8901961, 1, 1,
0.06861845, -1.585321, 3.775733, 0, 0.8862745, 1, 1,
0.07142462, 1.366309, -0.07222728, 0, 0.8784314, 1, 1,
0.07233042, -0.6978691, 4.655985, 0, 0.8745098, 1, 1,
0.07404897, 1.343255, 0.01617115, 0, 0.8666667, 1, 1,
0.07518923, -0.3639521, 2.664881, 0, 0.8627451, 1, 1,
0.08049452, 0.4740742, 1.654213, 0, 0.854902, 1, 1,
0.08080367, -0.3980713, 4.116534, 0, 0.8509804, 1, 1,
0.08405483, -0.4498127, 4.241945, 0, 0.8431373, 1, 1,
0.08429343, -0.1910617, 3.824973, 0, 0.8392157, 1, 1,
0.08477013, -0.1761181, 2.931823, 0, 0.8313726, 1, 1,
0.08606847, -1.842402, 2.41602, 0, 0.827451, 1, 1,
0.08676939, 0.8854302, 0.5770797, 0, 0.8196079, 1, 1,
0.08779974, -2.124028, 2.313366, 0, 0.8156863, 1, 1,
0.08887611, -1.73548, 2.885365, 0, 0.8078431, 1, 1,
0.09241718, 0.5324115, -0.7255147, 0, 0.8039216, 1, 1,
0.09249534, 0.4033646, -1.079866, 0, 0.7960784, 1, 1,
0.09271865, 1.611304, 0.4274158, 0, 0.7882353, 1, 1,
0.0985752, -0.4538147, 3.393051, 0, 0.7843137, 1, 1,
0.1072748, -1.017734, 1.165286, 0, 0.7764706, 1, 1,
0.1075821, -0.8981138, 2.950838, 0, 0.772549, 1, 1,
0.1098367, 1.317482, -0.1544699, 0, 0.7647059, 1, 1,
0.1112794, 0.136455, 2.635335, 0, 0.7607843, 1, 1,
0.1131826, -0.5253456, 0.951548, 0, 0.7529412, 1, 1,
0.1140942, 0.05606004, 0.1727712, 0, 0.7490196, 1, 1,
0.1260369, -1.492393, 3.736795, 0, 0.7411765, 1, 1,
0.1263019, 0.2162771, 0.9658304, 0, 0.7372549, 1, 1,
0.1309193, -0.3425238, 2.96031, 0, 0.7294118, 1, 1,
0.1324574, 0.5374409, 0.9214934, 0, 0.7254902, 1, 1,
0.1330791, -1.501305, 1.5979, 0, 0.7176471, 1, 1,
0.1372142, 1.148235, 0.4247715, 0, 0.7137255, 1, 1,
0.1382729, -0.1663388, 3.459287, 0, 0.7058824, 1, 1,
0.1391245, -0.4458424, 4.065165, 0, 0.6980392, 1, 1,
0.1401451, -0.743086, 2.159712, 0, 0.6941177, 1, 1,
0.1480289, 0.8526062, -0.7391406, 0, 0.6862745, 1, 1,
0.1481996, 0.5406298, 0.08542153, 0, 0.682353, 1, 1,
0.1515499, 1.037218, 0.303774, 0, 0.6745098, 1, 1,
0.1537565, 0.6712213, -0.2868768, 0, 0.6705883, 1, 1,
0.1552983, 0.53362, -0.001237896, 0, 0.6627451, 1, 1,
0.1591179, 1.221343, 0.9791391, 0, 0.6588235, 1, 1,
0.1671243, 1.125696, -0.7074677, 0, 0.6509804, 1, 1,
0.1673483, -2.107577, 3.10636, 0, 0.6470588, 1, 1,
0.169131, -1.992597, 3.935968, 0, 0.6392157, 1, 1,
0.1699577, -0.02376195, 2.540528, 0, 0.6352941, 1, 1,
0.1757454, -1.550927, 2.91162, 0, 0.627451, 1, 1,
0.1763465, -0.3184047, 2.15729, 0, 0.6235294, 1, 1,
0.1764412, 0.3647893, -0.6873617, 0, 0.6156863, 1, 1,
0.1800447, -0.412098, 2.649607, 0, 0.6117647, 1, 1,
0.1802485, 1.701603, -2.12134, 0, 0.6039216, 1, 1,
0.1820687, 1.875786, 0.5305321, 0, 0.5960785, 1, 1,
0.1931029, -0.09917038, 3.567972, 0, 0.5921569, 1, 1,
0.1971514, 0.8352547, -1.017616, 0, 0.5843138, 1, 1,
0.2003049, -0.01562932, 2.160452, 0, 0.5803922, 1, 1,
0.2007501, -1.079038, 2.780135, 0, 0.572549, 1, 1,
0.2019848, -0.7715751, 2.531129, 0, 0.5686275, 1, 1,
0.2026129, -2.909272, 2.367253, 0, 0.5607843, 1, 1,
0.2089428, 1.56646, -1.201512, 0, 0.5568628, 1, 1,
0.2185643, -1.389245, 2.937694, 0, 0.5490196, 1, 1,
0.225443, 1.14312, -1.021087, 0, 0.5450981, 1, 1,
0.2267327, 0.9655872, -0.4040851, 0, 0.5372549, 1, 1,
0.2317027, 0.03632682, 4.95106, 0, 0.5333334, 1, 1,
0.2325405, 1.637603, 0.5620422, 0, 0.5254902, 1, 1,
0.2333962, 0.06183388, 3.541112, 0, 0.5215687, 1, 1,
0.2336836, 0.4041466, 0.8295181, 0, 0.5137255, 1, 1,
0.2341223, 0.1720473, 1.569003, 0, 0.509804, 1, 1,
0.240169, 0.8362501, 0.3367229, 0, 0.5019608, 1, 1,
0.2411565, -0.09248447, 2.139721, 0, 0.4941176, 1, 1,
0.2431716, 0.2827603, 0.1482188, 0, 0.4901961, 1, 1,
0.2431874, -0.2538019, 3.709261, 0, 0.4823529, 1, 1,
0.2432195, -1.399226, 3.294467, 0, 0.4784314, 1, 1,
0.2439998, -0.8087224, 2.020071, 0, 0.4705882, 1, 1,
0.2464456, 1.135539, -0.01133489, 0, 0.4666667, 1, 1,
0.2513258, -0.4983226, 3.98873, 0, 0.4588235, 1, 1,
0.2513901, -0.7292643, 3.818377, 0, 0.454902, 1, 1,
0.2568545, 0.4708615, 1.095509, 0, 0.4470588, 1, 1,
0.2574734, 0.6749437, -0.5678321, 0, 0.4431373, 1, 1,
0.258743, -0.8843606, 1.490966, 0, 0.4352941, 1, 1,
0.2632566, -1.184535, 3.997972, 0, 0.4313726, 1, 1,
0.2672245, 2.303897, -0.987444, 0, 0.4235294, 1, 1,
0.267288, -0.2530785, 3.340909, 0, 0.4196078, 1, 1,
0.2678593, -1.92134, 3.933715, 0, 0.4117647, 1, 1,
0.2686424, -1.734281, 3.245527, 0, 0.4078431, 1, 1,
0.2729494, 1.458345, 0.4443533, 0, 0.4, 1, 1,
0.2773682, 0.7961419, 1.611519, 0, 0.3921569, 1, 1,
0.2844245, -1.257277, 3.711892, 0, 0.3882353, 1, 1,
0.2877797, 0.7411529, -0.1894808, 0, 0.3803922, 1, 1,
0.2878931, -0.9149827, 4.674164, 0, 0.3764706, 1, 1,
0.2901609, -0.1155324, 1.527933, 0, 0.3686275, 1, 1,
0.2911985, 0.2997749, 1.271394, 0, 0.3647059, 1, 1,
0.2922971, 0.6302544, 1.546006, 0, 0.3568628, 1, 1,
0.2930717, 0.2751202, 1.016526, 0, 0.3529412, 1, 1,
0.2939809, -1.286204, 3.550265, 0, 0.345098, 1, 1,
0.2946765, 0.999949, -0.5776879, 0, 0.3411765, 1, 1,
0.2948191, 0.3398516, 1.257535, 0, 0.3333333, 1, 1,
0.3069822, -0.02986308, 1.492834, 0, 0.3294118, 1, 1,
0.3125733, 1.142091, -1.772351, 0, 0.3215686, 1, 1,
0.3143636, -1.376431, 3.099463, 0, 0.3176471, 1, 1,
0.3151248, -0.5189474, 4.030552, 0, 0.3098039, 1, 1,
0.31714, -0.4998072, 3.98077, 0, 0.3058824, 1, 1,
0.3191065, 0.01710915, 2.041544, 0, 0.2980392, 1, 1,
0.3210206, -0.5568923, 1.375909, 0, 0.2901961, 1, 1,
0.321972, -0.1449422, -0.6105778, 0, 0.2862745, 1, 1,
0.322789, -8.294774e-05, 0.9270336, 0, 0.2784314, 1, 1,
0.3239908, -0.21417, 2.031377, 0, 0.2745098, 1, 1,
0.3334372, -2.09695, 4.012246, 0, 0.2666667, 1, 1,
0.3337132, -1.367652, 0.7118543, 0, 0.2627451, 1, 1,
0.3347698, 0.7005067, 1.742754, 0, 0.254902, 1, 1,
0.3359259, 1.168936, 0.7413567, 0, 0.2509804, 1, 1,
0.336056, -0.1801032, 1.043971, 0, 0.2431373, 1, 1,
0.3427335, -0.7611032, 1.981533, 0, 0.2392157, 1, 1,
0.3447932, 0.5350195, 0.3127862, 0, 0.2313726, 1, 1,
0.3448398, 0.06488732, 2.556234, 0, 0.227451, 1, 1,
0.3474819, -0.8013043, 4.178454, 0, 0.2196078, 1, 1,
0.3481274, 0.3508973, 1.548106, 0, 0.2156863, 1, 1,
0.3490361, 0.3602708, 2.572893, 0, 0.2078431, 1, 1,
0.3541391, 1.421036, 1.050354, 0, 0.2039216, 1, 1,
0.3567021, 0.2356079, 0.2605288, 0, 0.1960784, 1, 1,
0.3581403, -0.144067, 2.375952, 0, 0.1882353, 1, 1,
0.3582324, 1.927863, -0.5106836, 0, 0.1843137, 1, 1,
0.3640438, -1.484719, 3.142228, 0, 0.1764706, 1, 1,
0.3680157, -0.5580062, 1.840793, 0, 0.172549, 1, 1,
0.3682307, 0.7309271, 0.1375028, 0, 0.1647059, 1, 1,
0.3682758, 0.04834986, 2.726401, 0, 0.1607843, 1, 1,
0.3714854, -0.9067553, 2.198029, 0, 0.1529412, 1, 1,
0.3732432, 0.5155722, 1.77603, 0, 0.1490196, 1, 1,
0.3738762, 1.182677, 0.1537373, 0, 0.1411765, 1, 1,
0.375796, -0.3126185, 0.17016, 0, 0.1372549, 1, 1,
0.377784, -2.012197, 1.87304, 0, 0.1294118, 1, 1,
0.3797441, -1.208719, 4.374785, 0, 0.1254902, 1, 1,
0.3802017, 0.6504655, 0.07606806, 0, 0.1176471, 1, 1,
0.3803522, -0.0519366, 1.589613, 0, 0.1137255, 1, 1,
0.3822732, 0.2611659, -0.5000284, 0, 0.1058824, 1, 1,
0.3867283, 0.0507426, 1.933568, 0, 0.09803922, 1, 1,
0.387473, 0.3212527, 0.5878273, 0, 0.09411765, 1, 1,
0.3912084, 1.102454, 0.8547927, 0, 0.08627451, 1, 1,
0.3938227, 0.6633338, 0.8543479, 0, 0.08235294, 1, 1,
0.3938661, -0.1595918, 1.672533, 0, 0.07450981, 1, 1,
0.394164, 0.3383838, 0.6385428, 0, 0.07058824, 1, 1,
0.3946396, 0.577858, 1.199645, 0, 0.0627451, 1, 1,
0.3967665, 0.005553018, 1.376455, 0, 0.05882353, 1, 1,
0.3968085, 0.1385762, 3.174505, 0, 0.05098039, 1, 1,
0.3986124, -0.06901519, 2.809786, 0, 0.04705882, 1, 1,
0.4039928, 1.116959, 1.865504, 0, 0.03921569, 1, 1,
0.4040698, -0.5359668, 3.323371, 0, 0.03529412, 1, 1,
0.4111372, 0.5034077, 1.349256, 0, 0.02745098, 1, 1,
0.4129907, 0.6374885, 1.38934, 0, 0.02352941, 1, 1,
0.4138207, -1.134007, 2.317974, 0, 0.01568628, 1, 1,
0.4158527, -0.09043654, 1.239861, 0, 0.01176471, 1, 1,
0.4227266, 0.9902176, -0.4644011, 0, 0.003921569, 1, 1,
0.4248121, -0.6066555, 3.726853, 0.003921569, 0, 1, 1,
0.4260054, 0.8063837, 0.3307352, 0.007843138, 0, 1, 1,
0.4322012, -0.7382574, 1.069964, 0.01568628, 0, 1, 1,
0.4334925, 1.229755, -0.6805041, 0.01960784, 0, 1, 1,
0.4367618, 0.3826979, 1.689893, 0.02745098, 0, 1, 1,
0.4417065, -0.1767299, 2.726007, 0.03137255, 0, 1, 1,
0.4455131, -0.4723172, 2.111239, 0.03921569, 0, 1, 1,
0.4508788, -0.3878354, 0.7769678, 0.04313726, 0, 1, 1,
0.4554471, -1.148642, 2.699437, 0.05098039, 0, 1, 1,
0.4570396, -2.163133, 4.512984, 0.05490196, 0, 1, 1,
0.4585386, 1.697272, 0.1715108, 0.0627451, 0, 1, 1,
0.4600368, -2.015528, 3.099223, 0.06666667, 0, 1, 1,
0.4626657, 1.028759, 1.056685, 0.07450981, 0, 1, 1,
0.4642949, 1.484945, -0.134098, 0.07843138, 0, 1, 1,
0.4690702, 0.1612014, -0.230553, 0.08627451, 0, 1, 1,
0.4726219, 0.9440815, -0.7468877, 0.09019608, 0, 1, 1,
0.4741176, -1.106305, 1.441189, 0.09803922, 0, 1, 1,
0.4746566, 0.3788559, 1.301674, 0.1058824, 0, 1, 1,
0.4764181, 0.4755427, 1.246821, 0.1098039, 0, 1, 1,
0.4771457, 1.583158, -0.2448072, 0.1176471, 0, 1, 1,
0.484259, 0.2250907, 1.384385, 0.1215686, 0, 1, 1,
0.488934, 2.823785, 1.308236, 0.1294118, 0, 1, 1,
0.4941878, 0.2258162, 1.336107, 0.1333333, 0, 1, 1,
0.4944536, -0.3050751, 2.839271, 0.1411765, 0, 1, 1,
0.4968079, 0.5390012, 1.30373, 0.145098, 0, 1, 1,
0.4980282, -0.1708298, 0.7341546, 0.1529412, 0, 1, 1,
0.4986787, -0.4807103, 1.913922, 0.1568628, 0, 1, 1,
0.5064475, 0.472194, 2.301747, 0.1647059, 0, 1, 1,
0.523285, -2.154199, 2.393638, 0.1686275, 0, 1, 1,
0.5243728, 0.8840802, 2.085369, 0.1764706, 0, 1, 1,
0.5282131, -2.048697, 3.510952, 0.1803922, 0, 1, 1,
0.5302179, -0.03480554, 0.6936284, 0.1882353, 0, 1, 1,
0.5309895, 0.627901, 0.6026473, 0.1921569, 0, 1, 1,
0.5456485, 0.6429194, 0.9056481, 0.2, 0, 1, 1,
0.5458596, 0.8056105, -0.8773906, 0.2078431, 0, 1, 1,
0.5486378, -0.07977029, 2.672798, 0.2117647, 0, 1, 1,
0.5517448, 1.59009, 0.5219422, 0.2196078, 0, 1, 1,
0.5543007, -0.1277723, 2.633379, 0.2235294, 0, 1, 1,
0.5554326, 0.5123617, 0.06526845, 0.2313726, 0, 1, 1,
0.5554923, 1.954605, -1.435138, 0.2352941, 0, 1, 1,
0.556327, -0.7418342, 1.845244, 0.2431373, 0, 1, 1,
0.5567633, -0.03302471, 2.749711, 0.2470588, 0, 1, 1,
0.56615, 0.2225181, 1.826853, 0.254902, 0, 1, 1,
0.5662107, -0.07028375, 1.12345, 0.2588235, 0, 1, 1,
0.5725952, -0.7650292, 3.198249, 0.2666667, 0, 1, 1,
0.5806424, 1.549959, -0.1664553, 0.2705882, 0, 1, 1,
0.5811216, -0.2028287, 1.547857, 0.2784314, 0, 1, 1,
0.5833559, 0.4308761, 0.2619762, 0.282353, 0, 1, 1,
0.5834489, -0.1791555, 1.85088, 0.2901961, 0, 1, 1,
0.5920138, -0.03531241, 1.347389, 0.2941177, 0, 1, 1,
0.5954464, -1.507009, 2.664751, 0.3019608, 0, 1, 1,
0.59694, -0.6937658, 4.122265, 0.3098039, 0, 1, 1,
0.6060576, 0.6321076, 2.499223, 0.3137255, 0, 1, 1,
0.6084445, -0.1188874, 1.548656, 0.3215686, 0, 1, 1,
0.608717, 0.5835938, -0.4900855, 0.3254902, 0, 1, 1,
0.6088046, 2.500628, 0.8486404, 0.3333333, 0, 1, 1,
0.6156305, 1.399307, -0.560154, 0.3372549, 0, 1, 1,
0.6181117, -1.08312, 3.1527, 0.345098, 0, 1, 1,
0.6181235, -1.198127, 4.328181, 0.3490196, 0, 1, 1,
0.6199883, 0.1878698, 1.467393, 0.3568628, 0, 1, 1,
0.6277308, 0.1299106, 2.464698, 0.3607843, 0, 1, 1,
0.6287863, 0.1760698, 1.868001, 0.3686275, 0, 1, 1,
0.6354815, -0.4813062, 2.481445, 0.372549, 0, 1, 1,
0.6371478, -1.524208, 2.431381, 0.3803922, 0, 1, 1,
0.6371927, -1.130359, 3.064328, 0.3843137, 0, 1, 1,
0.6375077, -1.369022, 1.52798, 0.3921569, 0, 1, 1,
0.6406698, -0.6115376, 1.082132, 0.3960784, 0, 1, 1,
0.6425072, -0.7325187, 2.127279, 0.4039216, 0, 1, 1,
0.6490597, -1.365138, 2.699695, 0.4117647, 0, 1, 1,
0.6510872, 0.08562353, -0.08579466, 0.4156863, 0, 1, 1,
0.6546909, -1.079985, 1.497813, 0.4235294, 0, 1, 1,
0.6587707, 0.4207443, 1.155657, 0.427451, 0, 1, 1,
0.6591618, 0.9485147, 1.767231, 0.4352941, 0, 1, 1,
0.6592159, -1.8825, 2.585007, 0.4392157, 0, 1, 1,
0.6648932, 1.573846, -0.1997035, 0.4470588, 0, 1, 1,
0.6663852, -1.73862, 0.3147072, 0.4509804, 0, 1, 1,
0.6668999, 0.4862528, 0.5754533, 0.4588235, 0, 1, 1,
0.6782786, -1.599449, 1.839826, 0.4627451, 0, 1, 1,
0.6794903, -0.3443898, 1.175202, 0.4705882, 0, 1, 1,
0.6841562, 1.447279, 1.000578, 0.4745098, 0, 1, 1,
0.6859279, -2.60397, 0.151757, 0.4823529, 0, 1, 1,
0.6929467, -2.034459, 3.360451, 0.4862745, 0, 1, 1,
0.6934214, -0.003657381, 2.253662, 0.4941176, 0, 1, 1,
0.6956109, 0.2096443, 1.675413, 0.5019608, 0, 1, 1,
0.7031565, -0.8868731, 3.596478, 0.5058824, 0, 1, 1,
0.7035963, -1.413464, 2.598288, 0.5137255, 0, 1, 1,
0.7066412, 0.02534517, -0.7415329, 0.5176471, 0, 1, 1,
0.7078053, -0.5080722, 3.284992, 0.5254902, 0, 1, 1,
0.708277, -0.6819597, 3.087458, 0.5294118, 0, 1, 1,
0.7084941, 0.02322495, 2.629588, 0.5372549, 0, 1, 1,
0.7133353, -0.01861231, 3.548519, 0.5411765, 0, 1, 1,
0.715808, 0.02045124, 1.556867, 0.5490196, 0, 1, 1,
0.7171881, 0.01386981, 1.753336, 0.5529412, 0, 1, 1,
0.719133, 1.21311, 0.04754569, 0.5607843, 0, 1, 1,
0.7199692, -0.007937845, 0.5172713, 0.5647059, 0, 1, 1,
0.7208346, 0.463579, 0.2792473, 0.572549, 0, 1, 1,
0.727466, 0.1275295, -0.1007034, 0.5764706, 0, 1, 1,
0.7285715, -0.8568734, 1.006051, 0.5843138, 0, 1, 1,
0.7302518, -0.0366061, 3.886869, 0.5882353, 0, 1, 1,
0.7328562, 0.0457904, 0.3116698, 0.5960785, 0, 1, 1,
0.7340252, 0.7982568, 0.6790508, 0.6039216, 0, 1, 1,
0.7344532, -1.120137, 3.096142, 0.6078432, 0, 1, 1,
0.7345441, 0.7184426, -1.13722, 0.6156863, 0, 1, 1,
0.7367507, 1.199567, 1.071405, 0.6196079, 0, 1, 1,
0.7418824, 0.01916105, 1.382451, 0.627451, 0, 1, 1,
0.7431942, 1.547213, -0.09451556, 0.6313726, 0, 1, 1,
0.7438504, -1.497978, 1.485949, 0.6392157, 0, 1, 1,
0.7481573, 0.1675758, 0.938014, 0.6431373, 0, 1, 1,
0.7615477, -1.587249, 1.515084, 0.6509804, 0, 1, 1,
0.7644959, 0.4183104, -0.6555688, 0.654902, 0, 1, 1,
0.7688955, 1.068058, 1.266897, 0.6627451, 0, 1, 1,
0.7747555, -0.3858045, 0.9426599, 0.6666667, 0, 1, 1,
0.7758765, 1.853615, 1.915856, 0.6745098, 0, 1, 1,
0.7805106, -0.3007102, 1.256422, 0.6784314, 0, 1, 1,
0.7810892, -0.9647633, 1.515054, 0.6862745, 0, 1, 1,
0.7850454, 1.681212, 1.568531, 0.6901961, 0, 1, 1,
0.7908025, 1.47423, 0.5550207, 0.6980392, 0, 1, 1,
0.7951656, -1.85798, 2.87256, 0.7058824, 0, 1, 1,
0.8075694, -1.909802, 2.956446, 0.7098039, 0, 1, 1,
0.8165094, 1.46, -0.01301998, 0.7176471, 0, 1, 1,
0.8311394, -0.4849812, 2.580242, 0.7215686, 0, 1, 1,
0.831691, -0.9897697, -0.07954776, 0.7294118, 0, 1, 1,
0.8328403, 0.2768044, 3.649763, 0.7333333, 0, 1, 1,
0.8351068, 0.2183346, 2.102921, 0.7411765, 0, 1, 1,
0.8463, 0.8882815, 1.042253, 0.7450981, 0, 1, 1,
0.8492277, -0.7251738, 1.795273, 0.7529412, 0, 1, 1,
0.8510131, 0.7578956, -1.400233, 0.7568628, 0, 1, 1,
0.8511673, 1.047402, -2.34087, 0.7647059, 0, 1, 1,
0.8530727, 0.5576612, 1.76638, 0.7686275, 0, 1, 1,
0.8597139, 1.220448, 0.5606083, 0.7764706, 0, 1, 1,
0.8655061, 2.484474, 2.038088, 0.7803922, 0, 1, 1,
0.8688757, -0.4680026, 1.243281, 0.7882353, 0, 1, 1,
0.8714371, -0.324938, 1.473377, 0.7921569, 0, 1, 1,
0.8724044, 1.240098, 2.086988, 0.8, 0, 1, 1,
0.8731547, -0.7054994, 1.712385, 0.8078431, 0, 1, 1,
0.8754658, -1.753605, 1.461051, 0.8117647, 0, 1, 1,
0.8796193, -0.1691327, 3.498678, 0.8196079, 0, 1, 1,
0.87994, 0.004226629, 3.411721, 0.8235294, 0, 1, 1,
0.8804612, -0.2787588, 1.054006, 0.8313726, 0, 1, 1,
0.8827414, -0.2666974, 0.583248, 0.8352941, 0, 1, 1,
0.8843203, -0.1963217, 2.960781, 0.8431373, 0, 1, 1,
0.8875303, -0.9807183, 0.8255229, 0.8470588, 0, 1, 1,
0.8893218, 2.041328, 0.4508563, 0.854902, 0, 1, 1,
0.8920586, 1.591318, -0.7639372, 0.8588235, 0, 1, 1,
0.894043, -0.3808349, 3.263042, 0.8666667, 0, 1, 1,
0.9046657, -0.6981639, 1.563063, 0.8705882, 0, 1, 1,
0.9051453, 0.07763627, 0.07797683, 0.8784314, 0, 1, 1,
0.9194198, 0.6656617, 0.5094851, 0.8823529, 0, 1, 1,
0.9264711, -0.9508255, 1.772026, 0.8901961, 0, 1, 1,
0.9296886, 1.657943, -0.7819856, 0.8941177, 0, 1, 1,
0.9299024, 0.6933495, 1.588343, 0.9019608, 0, 1, 1,
0.9417228, 0.3867362, -0.5746095, 0.9098039, 0, 1, 1,
0.9472924, -0.1407925, 2.1589, 0.9137255, 0, 1, 1,
0.9473279, -0.9303662, 3.0176, 0.9215686, 0, 1, 1,
0.9629406, -0.0628473, 1.183734, 0.9254902, 0, 1, 1,
0.964863, 0.1528199, 1.455817, 0.9333333, 0, 1, 1,
0.9661459, 0.8134422, -1.495343, 0.9372549, 0, 1, 1,
0.9710311, -1.183802, 4.248613, 0.945098, 0, 1, 1,
0.9717988, -0.2003663, 2.171682, 0.9490196, 0, 1, 1,
0.9737512, -0.6653095, 2.093111, 0.9568627, 0, 1, 1,
0.9772121, 0.7083981, 1.597193, 0.9607843, 0, 1, 1,
0.9823031, -0.05984275, 0.3760015, 0.9686275, 0, 1, 1,
0.983669, -1.208231, 3.846228, 0.972549, 0, 1, 1,
0.9844725, -0.2619801, 2.309159, 0.9803922, 0, 1, 1,
0.98482, 0.6956401, 1.909566, 0.9843137, 0, 1, 1,
0.986693, -1.000309, 2.578546, 0.9921569, 0, 1, 1,
0.9868838, 0.4420805, 0.5487652, 0.9960784, 0, 1, 1,
0.9905158, 0.1850868, 1.645824, 1, 0, 0.9960784, 1,
1.002605, 0.1431109, 1.384514, 1, 0, 0.9882353, 1,
1.004417, 1.22602, 0.06838168, 1, 0, 0.9843137, 1,
1.005272, -1.017049, 3.139271, 1, 0, 0.9764706, 1,
1.007184, -0.7131443, 2.925029, 1, 0, 0.972549, 1,
1.009079, -1.69716, 2.423976, 1, 0, 0.9647059, 1,
1.015535, 1.007214, 0.9395314, 1, 0, 0.9607843, 1,
1.025549, 1.056651, 3.47263, 1, 0, 0.9529412, 1,
1.032875, 1.768919, 1.367169, 1, 0, 0.9490196, 1,
1.036425, 0.4118532, 1.945522, 1, 0, 0.9411765, 1,
1.037908, 1.933732, 0.760513, 1, 0, 0.9372549, 1,
1.039647, -0.1482993, 1.98215, 1, 0, 0.9294118, 1,
1.040952, 0.7245323, -0.06563711, 1, 0, 0.9254902, 1,
1.05597, -0.643666, 1.477562, 1, 0, 0.9176471, 1,
1.057255, -0.4406189, 2.440054, 1, 0, 0.9137255, 1,
1.058555, 0.9102938, -0.2192618, 1, 0, 0.9058824, 1,
1.060754, 0.6706227, 1.230156, 1, 0, 0.9019608, 1,
1.066226, 0.1701719, 0.4004104, 1, 0, 0.8941177, 1,
1.071447, -0.6484962, 2.397915, 1, 0, 0.8862745, 1,
1.074108, 1.386974, 0.6578795, 1, 0, 0.8823529, 1,
1.076929, 0.07885409, 1.65441, 1, 0, 0.8745098, 1,
1.077132, 0.8060799, 0.2532116, 1, 0, 0.8705882, 1,
1.079962, -0.8489565, 1.924005, 1, 0, 0.8627451, 1,
1.080587, -1.249434, 1.799232, 1, 0, 0.8588235, 1,
1.082406, 0.9629145, 0.8208495, 1, 0, 0.8509804, 1,
1.088726, 1.574601, 0.6078963, 1, 0, 0.8470588, 1,
1.10012, -0.7279788, 1.445313, 1, 0, 0.8392157, 1,
1.100337, -0.8831986, 3.112656, 1, 0, 0.8352941, 1,
1.101107, 1.029122, 0.9050543, 1, 0, 0.827451, 1,
1.105207, -0.9925153, 3.218158, 1, 0, 0.8235294, 1,
1.115284, 0.1792654, 1.362942, 1, 0, 0.8156863, 1,
1.115404, -0.1761917, 0.3793073, 1, 0, 0.8117647, 1,
1.120397, -0.8486188, 0.2101666, 1, 0, 0.8039216, 1,
1.121661, -0.1479994, 2.373205, 1, 0, 0.7960784, 1,
1.123067, 0.499657, 1.743853, 1, 0, 0.7921569, 1,
1.126679, 2.149342, 0.5123752, 1, 0, 0.7843137, 1,
1.130951, -0.4301268, 3.385665, 1, 0, 0.7803922, 1,
1.140439, -0.221257, 0.9557176, 1, 0, 0.772549, 1,
1.141347, 0.2116116, 1.731439, 1, 0, 0.7686275, 1,
1.145725, 2.070031, 0.8172564, 1, 0, 0.7607843, 1,
1.146262, -0.5974968, 0.6344958, 1, 0, 0.7568628, 1,
1.146361, -2.297813, 3.251732, 1, 0, 0.7490196, 1,
1.147864, -0.1799383, 3.250648, 1, 0, 0.7450981, 1,
1.151836, 0.1325227, 1.846275, 1, 0, 0.7372549, 1,
1.154778, 0.06865817, 3.309471, 1, 0, 0.7333333, 1,
1.158034, -0.1307283, 0.9536722, 1, 0, 0.7254902, 1,
1.1585, 0.4856509, 0.7391018, 1, 0, 0.7215686, 1,
1.165264, 0.1334423, 1.00291, 1, 0, 0.7137255, 1,
1.167432, -0.7789789, 1.711198, 1, 0, 0.7098039, 1,
1.175326, -0.3347339, 1.711905, 1, 0, 0.7019608, 1,
1.185073, 1.363498, 2.125182, 1, 0, 0.6941177, 1,
1.195885, 1.683437, 0.4544345, 1, 0, 0.6901961, 1,
1.200563, 0.7179025, 0.03966513, 1, 0, 0.682353, 1,
1.205542, 0.4051326, 3.3157, 1, 0, 0.6784314, 1,
1.20685, -0.9073875, 2.702911, 1, 0, 0.6705883, 1,
1.216075, -0.02149686, 2.338888, 1, 0, 0.6666667, 1,
1.219615, -1.027754, 1.879127, 1, 0, 0.6588235, 1,
1.225555, 1.094818, 0.3639776, 1, 0, 0.654902, 1,
1.234367, 0.1073962, 0.2010019, 1, 0, 0.6470588, 1,
1.234743, -0.8854163, 2.600835, 1, 0, 0.6431373, 1,
1.238431, -0.5377715, 0.9977573, 1, 0, 0.6352941, 1,
1.240926, 0.3717695, 1.187281, 1, 0, 0.6313726, 1,
1.241722, -0.4675834, 1.586788, 1, 0, 0.6235294, 1,
1.24223, -0.1471656, 0.7785818, 1, 0, 0.6196079, 1,
1.245266, 0.8142132, 0.610887, 1, 0, 0.6117647, 1,
1.251748, 0.7661707, 0.1243838, 1, 0, 0.6078432, 1,
1.252297, -1.563314, 1.666851, 1, 0, 0.6, 1,
1.254886, 0.4172902, 1.525206, 1, 0, 0.5921569, 1,
1.25588, 0.1189916, 1.677757, 1, 0, 0.5882353, 1,
1.266469, -1.42121, 1.890561, 1, 0, 0.5803922, 1,
1.26803, -0.7063664, 2.669358, 1, 0, 0.5764706, 1,
1.26808, -0.8101749, 2.735179, 1, 0, 0.5686275, 1,
1.270081, 1.571955, 0.4445761, 1, 0, 0.5647059, 1,
1.275334, -0.8469415, 4.027783, 1, 0, 0.5568628, 1,
1.275424, -1.534833, 2.53955, 1, 0, 0.5529412, 1,
1.288567, -3.121011, 3.45373, 1, 0, 0.5450981, 1,
1.294857, -0.1246857, 0.8081679, 1, 0, 0.5411765, 1,
1.298692, 1.064074, 1.322683, 1, 0, 0.5333334, 1,
1.301193, 0.2962852, 0.9836566, 1, 0, 0.5294118, 1,
1.308456, -0.2577973, 1.677376, 1, 0, 0.5215687, 1,
1.314863, -1.011926, 2.250517, 1, 0, 0.5176471, 1,
1.316286, 0.9314989, 1.832416, 1, 0, 0.509804, 1,
1.341035, -0.05242896, 1.622419, 1, 0, 0.5058824, 1,
1.341389, 0.3394603, 1.355515, 1, 0, 0.4980392, 1,
1.341578, 0.5530962, 1.572154, 1, 0, 0.4901961, 1,
1.346556, -0.6772515, 3.073921, 1, 0, 0.4862745, 1,
1.347102, -0.4295766, 2.289812, 1, 0, 0.4784314, 1,
1.35816, -0.1787709, 1.07956, 1, 0, 0.4745098, 1,
1.378543, 0.355987, 1.525995, 1, 0, 0.4666667, 1,
1.380325, 0.8646308, -0.64889, 1, 0, 0.4627451, 1,
1.382779, 0.3047099, 1.321701, 1, 0, 0.454902, 1,
1.397928, -1.529537, 1.707724, 1, 0, 0.4509804, 1,
1.4102, 0.7116152, 0.5393276, 1, 0, 0.4431373, 1,
1.419914, 2.329903, -0.6449498, 1, 0, 0.4392157, 1,
1.440131, 0.3081916, 1.603164, 1, 0, 0.4313726, 1,
1.444152, 0.941157, 2.668144, 1, 0, 0.427451, 1,
1.444491, 0.07192877, 1.217747, 1, 0, 0.4196078, 1,
1.45006, -1.439586, 3.227657, 1, 0, 0.4156863, 1,
1.451002, 0.2448442, 0.6551309, 1, 0, 0.4078431, 1,
1.452525, -0.4542641, 3.901232, 1, 0, 0.4039216, 1,
1.453959, -0.368118, 2.281666, 1, 0, 0.3960784, 1,
1.469795, -0.4474079, 0.6340533, 1, 0, 0.3882353, 1,
1.475503, -0.4828185, 1.74987, 1, 0, 0.3843137, 1,
1.490069, 0.1701043, 2.229515, 1, 0, 0.3764706, 1,
1.499477, -0.5347041, 2.10512, 1, 0, 0.372549, 1,
1.514333, -0.8905432, 0.2540776, 1, 0, 0.3647059, 1,
1.519335, 0.8816888, 0.8975829, 1, 0, 0.3607843, 1,
1.529578, 0.7580224, 0.6752659, 1, 0, 0.3529412, 1,
1.54796, 0.7922509, 0.1103075, 1, 0, 0.3490196, 1,
1.575802, -1.128199, 3.180501, 1, 0, 0.3411765, 1,
1.578563, -2.211898, 2.55231, 1, 0, 0.3372549, 1,
1.587664, -1.015299, 2.231568, 1, 0, 0.3294118, 1,
1.591515, 1.08209, 3.005955, 1, 0, 0.3254902, 1,
1.60629, 2.57027, 1.208549, 1, 0, 0.3176471, 1,
1.610445, 0.2663012, 2.251992, 1, 0, 0.3137255, 1,
1.62503, -0.5438966, 2.696563, 1, 0, 0.3058824, 1,
1.625902, -1.891317, 3.772374, 1, 0, 0.2980392, 1,
1.630359, 0.118768, 0.04240759, 1, 0, 0.2941177, 1,
1.631196, -1.884429, 1.212388, 1, 0, 0.2862745, 1,
1.631485, -1.578171, 2.116668, 1, 0, 0.282353, 1,
1.632055, -0.1569103, 0.7000711, 1, 0, 0.2745098, 1,
1.654483, 0.01916244, 1.981498, 1, 0, 0.2705882, 1,
1.654772, 0.2776619, 2.672174, 1, 0, 0.2627451, 1,
1.693956, -0.8540627, 3.94149, 1, 0, 0.2588235, 1,
1.702384, -0.5582035, 1.49457, 1, 0, 0.2509804, 1,
1.71815, -0.4258451, 0.8784824, 1, 0, 0.2470588, 1,
1.721121, 0.8643346, 1.842907, 1, 0, 0.2392157, 1,
1.740149, 0.6329173, -0.1654074, 1, 0, 0.2352941, 1,
1.744992, 0.4582312, 3.099075, 1, 0, 0.227451, 1,
1.761546, 0.4778204, 1.675929, 1, 0, 0.2235294, 1,
1.76202, -2.078484, 2.593143, 1, 0, 0.2156863, 1,
1.778215, -1.270624, 2.358585, 1, 0, 0.2117647, 1,
1.787876, 0.05659245, 1.707677, 1, 0, 0.2039216, 1,
1.795634, 1.818853, -0.5522526, 1, 0, 0.1960784, 1,
1.820881, -0.09360328, 1.485657, 1, 0, 0.1921569, 1,
1.840526, -0.7053357, 3.61316, 1, 0, 0.1843137, 1,
1.857224, 0.2957356, 0.358579, 1, 0, 0.1803922, 1,
1.880024, 1.770953, -0.9915294, 1, 0, 0.172549, 1,
1.891153, 1.32371, -0.5948761, 1, 0, 0.1686275, 1,
1.89557, 2.529588, -0.4819084, 1, 0, 0.1607843, 1,
1.904628, 0.7732318, -0.006942812, 1, 0, 0.1568628, 1,
1.960053, 0.08650769, 2.392336, 1, 0, 0.1490196, 1,
1.962157, -0.644254, 1.230616, 1, 0, 0.145098, 1,
1.974299, -0.706525, 1.550211, 1, 0, 0.1372549, 1,
1.994833, 1.639217, 0.678971, 1, 0, 0.1333333, 1,
2.038588, -1.266364, 0.8725243, 1, 0, 0.1254902, 1,
2.040898, 0.8660842, 0.953727, 1, 0, 0.1215686, 1,
2.048323, -0.5801723, 1.59356, 1, 0, 0.1137255, 1,
2.051881, -0.732798, 1.154777, 1, 0, 0.1098039, 1,
2.0563, -0.5459073, 1.457356, 1, 0, 0.1019608, 1,
2.077808, 1.314791, 0.2604245, 1, 0, 0.09411765, 1,
2.078603, -0.1496844, 2.262647, 1, 0, 0.09019608, 1,
2.07914, -0.6467855, 0.867511, 1, 0, 0.08235294, 1,
2.10936, 1.471549, 1.638038, 1, 0, 0.07843138, 1,
2.154138, 0.8791395, 1.685485, 1, 0, 0.07058824, 1,
2.255144, -0.2068307, -0.1479624, 1, 0, 0.06666667, 1,
2.255896, -0.2741886, 1.009409, 1, 0, 0.05882353, 1,
2.277717, -1.429655, 1.434486, 1, 0, 0.05490196, 1,
2.28664, 0.2243754, 0.6788414, 1, 0, 0.04705882, 1,
2.299956, 0.7080427, 2.124562, 1, 0, 0.04313726, 1,
2.368471, -0.8441086, 2.425431, 1, 0, 0.03529412, 1,
2.665213, 0.1945251, 1.793728, 1, 0, 0.03137255, 1,
2.683068, 0.6580915, 0.4649323, 1, 0, 0.02352941, 1,
2.722003, -2.438086, 0.9762234, 1, 0, 0.01960784, 1,
2.9482, 0.6919571, 0.05601788, 1, 0, 0.01176471, 1,
3.600288, -2.219227, 2.697579, 1, 0, 0.007843138, 1
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
0.4389498, -4.269974, -7.451899, 0, -0.5, 0.5, 0.5,
0.4389498, -4.269974, -7.451899, 1, -0.5, 0.5, 0.5,
0.4389498, -4.269974, -7.451899, 1, 1.5, 0.5, 0.5,
0.4389498, -4.269974, -7.451899, 0, 1.5, 0.5, 0.5
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
-3.794082, 0.2682611, -7.451899, 0, -0.5, 0.5, 0.5,
-3.794082, 0.2682611, -7.451899, 1, -0.5, 0.5, 0.5,
-3.794082, 0.2682611, -7.451899, 1, 1.5, 0.5, 0.5,
-3.794082, 0.2682611, -7.451899, 0, 1.5, 0.5, 0.5
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
-3.794082, -4.269974, -0.3230648, 0, -0.5, 0.5, 0.5,
-3.794082, -4.269974, -0.3230648, 1, -0.5, 0.5, 0.5,
-3.794082, -4.269974, -0.3230648, 1, 1.5, 0.5, 0.5,
-3.794082, -4.269974, -0.3230648, 0, 1.5, 0.5, 0.5
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
-2, -3.222689, -5.806783,
3, -3.222689, -5.806783,
-2, -3.222689, -5.806783,
-2, -3.397236, -6.080969,
-1, -3.222689, -5.806783,
-1, -3.397236, -6.080969,
0, -3.222689, -5.806783,
0, -3.397236, -6.080969,
1, -3.222689, -5.806783,
1, -3.397236, -6.080969,
2, -3.222689, -5.806783,
2, -3.397236, -6.080969,
3, -3.222689, -5.806783,
3, -3.397236, -6.080969
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
-2, -3.746331, -6.629341, 0, -0.5, 0.5, 0.5,
-2, -3.746331, -6.629341, 1, -0.5, 0.5, 0.5,
-2, -3.746331, -6.629341, 1, 1.5, 0.5, 0.5,
-2, -3.746331, -6.629341, 0, 1.5, 0.5, 0.5,
-1, -3.746331, -6.629341, 0, -0.5, 0.5, 0.5,
-1, -3.746331, -6.629341, 1, -0.5, 0.5, 0.5,
-1, -3.746331, -6.629341, 1, 1.5, 0.5, 0.5,
-1, -3.746331, -6.629341, 0, 1.5, 0.5, 0.5,
0, -3.746331, -6.629341, 0, -0.5, 0.5, 0.5,
0, -3.746331, -6.629341, 1, -0.5, 0.5, 0.5,
0, -3.746331, -6.629341, 1, 1.5, 0.5, 0.5,
0, -3.746331, -6.629341, 0, 1.5, 0.5, 0.5,
1, -3.746331, -6.629341, 0, -0.5, 0.5, 0.5,
1, -3.746331, -6.629341, 1, -0.5, 0.5, 0.5,
1, -3.746331, -6.629341, 1, 1.5, 0.5, 0.5,
1, -3.746331, -6.629341, 0, 1.5, 0.5, 0.5,
2, -3.746331, -6.629341, 0, -0.5, 0.5, 0.5,
2, -3.746331, -6.629341, 1, -0.5, 0.5, 0.5,
2, -3.746331, -6.629341, 1, 1.5, 0.5, 0.5,
2, -3.746331, -6.629341, 0, 1.5, 0.5, 0.5,
3, -3.746331, -6.629341, 0, -0.5, 0.5, 0.5,
3, -3.746331, -6.629341, 1, -0.5, 0.5, 0.5,
3, -3.746331, -6.629341, 1, 1.5, 0.5, 0.5,
3, -3.746331, -6.629341, 0, 1.5, 0.5, 0.5
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
-2.817229, -3, -5.806783,
-2.817229, 3, -5.806783,
-2.817229, -3, -5.806783,
-2.980038, -3, -6.080969,
-2.817229, -2, -5.806783,
-2.980038, -2, -6.080969,
-2.817229, -1, -5.806783,
-2.980038, -1, -6.080969,
-2.817229, 0, -5.806783,
-2.980038, 0, -6.080969,
-2.817229, 1, -5.806783,
-2.980038, 1, -6.080969,
-2.817229, 2, -5.806783,
-2.980038, 2, -6.080969,
-2.817229, 3, -5.806783,
-2.980038, 3, -6.080969
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
-3.305655, -3, -6.629341, 0, -0.5, 0.5, 0.5,
-3.305655, -3, -6.629341, 1, -0.5, 0.5, 0.5,
-3.305655, -3, -6.629341, 1, 1.5, 0.5, 0.5,
-3.305655, -3, -6.629341, 0, 1.5, 0.5, 0.5,
-3.305655, -2, -6.629341, 0, -0.5, 0.5, 0.5,
-3.305655, -2, -6.629341, 1, -0.5, 0.5, 0.5,
-3.305655, -2, -6.629341, 1, 1.5, 0.5, 0.5,
-3.305655, -2, -6.629341, 0, 1.5, 0.5, 0.5,
-3.305655, -1, -6.629341, 0, -0.5, 0.5, 0.5,
-3.305655, -1, -6.629341, 1, -0.5, 0.5, 0.5,
-3.305655, -1, -6.629341, 1, 1.5, 0.5, 0.5,
-3.305655, -1, -6.629341, 0, 1.5, 0.5, 0.5,
-3.305655, 0, -6.629341, 0, -0.5, 0.5, 0.5,
-3.305655, 0, -6.629341, 1, -0.5, 0.5, 0.5,
-3.305655, 0, -6.629341, 1, 1.5, 0.5, 0.5,
-3.305655, 0, -6.629341, 0, 1.5, 0.5, 0.5,
-3.305655, 1, -6.629341, 0, -0.5, 0.5, 0.5,
-3.305655, 1, -6.629341, 1, -0.5, 0.5, 0.5,
-3.305655, 1, -6.629341, 1, 1.5, 0.5, 0.5,
-3.305655, 1, -6.629341, 0, 1.5, 0.5, 0.5,
-3.305655, 2, -6.629341, 0, -0.5, 0.5, 0.5,
-3.305655, 2, -6.629341, 1, -0.5, 0.5, 0.5,
-3.305655, 2, -6.629341, 1, 1.5, 0.5, 0.5,
-3.305655, 2, -6.629341, 0, 1.5, 0.5, 0.5,
-3.305655, 3, -6.629341, 0, -0.5, 0.5, 0.5,
-3.305655, 3, -6.629341, 1, -0.5, 0.5, 0.5,
-3.305655, 3, -6.629341, 1, 1.5, 0.5, 0.5,
-3.305655, 3, -6.629341, 0, 1.5, 0.5, 0.5
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
-2.817229, -3.222689, -4,
-2.817229, -3.222689, 4,
-2.817229, -3.222689, -4,
-2.980038, -3.397236, -4,
-2.817229, -3.222689, -2,
-2.980038, -3.397236, -2,
-2.817229, -3.222689, 0,
-2.980038, -3.397236, 0,
-2.817229, -3.222689, 2,
-2.980038, -3.397236, 2,
-2.817229, -3.222689, 4,
-2.980038, -3.397236, 4
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
-3.305655, -3.746331, -4, 0, -0.5, 0.5, 0.5,
-3.305655, -3.746331, -4, 1, -0.5, 0.5, 0.5,
-3.305655, -3.746331, -4, 1, 1.5, 0.5, 0.5,
-3.305655, -3.746331, -4, 0, 1.5, 0.5, 0.5,
-3.305655, -3.746331, -2, 0, -0.5, 0.5, 0.5,
-3.305655, -3.746331, -2, 1, -0.5, 0.5, 0.5,
-3.305655, -3.746331, -2, 1, 1.5, 0.5, 0.5,
-3.305655, -3.746331, -2, 0, 1.5, 0.5, 0.5,
-3.305655, -3.746331, 0, 0, -0.5, 0.5, 0.5,
-3.305655, -3.746331, 0, 1, -0.5, 0.5, 0.5,
-3.305655, -3.746331, 0, 1, 1.5, 0.5, 0.5,
-3.305655, -3.746331, 0, 0, 1.5, 0.5, 0.5,
-3.305655, -3.746331, 2, 0, -0.5, 0.5, 0.5,
-3.305655, -3.746331, 2, 1, -0.5, 0.5, 0.5,
-3.305655, -3.746331, 2, 1, 1.5, 0.5, 0.5,
-3.305655, -3.746331, 2, 0, 1.5, 0.5, 0.5,
-3.305655, -3.746331, 4, 0, -0.5, 0.5, 0.5,
-3.305655, -3.746331, 4, 1, -0.5, 0.5, 0.5,
-3.305655, -3.746331, 4, 1, 1.5, 0.5, 0.5,
-3.305655, -3.746331, 4, 0, 1.5, 0.5, 0.5
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
-2.817229, -3.222689, -5.806783,
-2.817229, 3.759211, -5.806783,
-2.817229, -3.222689, 5.160654,
-2.817229, 3.759211, 5.160654,
-2.817229, -3.222689, -5.806783,
-2.817229, -3.222689, 5.160654,
-2.817229, 3.759211, -5.806783,
-2.817229, 3.759211, 5.160654,
-2.817229, -3.222689, -5.806783,
3.695128, -3.222689, -5.806783,
-2.817229, -3.222689, 5.160654,
3.695128, -3.222689, 5.160654,
-2.817229, 3.759211, -5.806783,
3.695128, 3.759211, -5.806783,
-2.817229, 3.759211, 5.160654,
3.695128, 3.759211, 5.160654,
3.695128, -3.222689, -5.806783,
3.695128, 3.759211, -5.806783,
3.695128, -3.222689, 5.160654,
3.695128, 3.759211, 5.160654,
3.695128, -3.222689, -5.806783,
3.695128, -3.222689, 5.160654,
3.695128, 3.759211, -5.806783,
3.695128, 3.759211, 5.160654
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
var radius = 7.764643;
var distance = 34.54577;
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
mvMatrix.translate( -0.4389498, -0.2682611, 0.3230648 );
mvMatrix.scale( 1.289131, 1.202435, 0.7654737 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54577);
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
diflumetorim<-read.table("diflumetorim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diflumetorim$V2
```

```
## Error in eval(expr, envir, enclos): object 'diflumetorim' not found
```

```r
y<-diflumetorim$V3
```

```
## Error in eval(expr, envir, enclos): object 'diflumetorim' not found
```

```r
z<-diflumetorim$V4
```

```
## Error in eval(expr, envir, enclos): object 'diflumetorim' not found
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
-2.722389, 1.326581, -1.171617, 0, 0, 1, 1, 1,
-2.625323, 2.029784, -0.9639461, 1, 0, 0, 1, 1,
-2.600391, 0.8569993, -1.138253, 1, 0, 0, 1, 1,
-2.307081, 0.07045982, -2.273504, 1, 0, 0, 1, 1,
-2.269561, -0.4790142, -1.628211, 1, 0, 0, 1, 1,
-2.227202, 0.06310151, -2.502815, 1, 0, 0, 1, 1,
-2.204446, 0.7529157, -2.167456, 0, 0, 0, 1, 1,
-2.159868, -0.1056007, -2.53393, 0, 0, 0, 1, 1,
-2.15526, -1.018499, -2.462781, 0, 0, 0, 1, 1,
-2.145904, 1.043465, -1.255475, 0, 0, 0, 1, 1,
-2.122806, 1.159189, -0.4146947, 0, 0, 0, 1, 1,
-2.121683, -0.4401938, -0.7845924, 0, 0, 0, 1, 1,
-2.098695, -0.6129377, -0.4462504, 0, 0, 0, 1, 1,
-2.096751, -1.090418, -2.312353, 1, 1, 1, 1, 1,
-2.093498, 1.753131, -0.3832929, 1, 1, 1, 1, 1,
-2.082819, -1.701987, -1.416708, 1, 1, 1, 1, 1,
-2.068164, -0.6409371, -1.574674, 1, 1, 1, 1, 1,
-2.060763, 1.657491, -0.1040043, 1, 1, 1, 1, 1,
-1.986336, -0.2804874, -1.450117, 1, 1, 1, 1, 1,
-1.976276, -1.003754, -1.630455, 1, 1, 1, 1, 1,
-1.966938, -1.852953, -2.654485, 1, 1, 1, 1, 1,
-1.948838, 0.2677453, -1.271354, 1, 1, 1, 1, 1,
-1.936697, 0.3771372, -0.4084323, 1, 1, 1, 1, 1,
-1.924637, -1.670539, -2.66125, 1, 1, 1, 1, 1,
-1.924633, 0.6021972, -0.5394206, 1, 1, 1, 1, 1,
-1.923995, 0.4507481, -3.172489, 1, 1, 1, 1, 1,
-1.920847, 0.4520331, 0.01826546, 1, 1, 1, 1, 1,
-1.867848, -1.548084, -2.159836, 1, 1, 1, 1, 1,
-1.854302, 0.4930927, -1.790975, 0, 0, 1, 1, 1,
-1.842833, -1.826934, -1.943211, 1, 0, 0, 1, 1,
-1.842604, 0.3575566, -2.064409, 1, 0, 0, 1, 1,
-1.829628, 0.2826769, -0.6717317, 1, 0, 0, 1, 1,
-1.82855, -0.6645098, -3.424536, 1, 0, 0, 1, 1,
-1.822199, -0.1880117, -2.081079, 1, 0, 0, 1, 1,
-1.805345, 0.333359, -2.06532, 0, 0, 0, 1, 1,
-1.804911, 0.4777204, -1.03361, 0, 0, 0, 1, 1,
-1.80018, 0.1556917, -1.167006, 0, 0, 0, 1, 1,
-1.785778, 0.02620668, -1.020476, 0, 0, 0, 1, 1,
-1.783805, 0.1037879, -1.709193, 0, 0, 0, 1, 1,
-1.7712, 2.488978, -1.162091, 0, 0, 0, 1, 1,
-1.764032, -0.257241, -2.756927, 0, 0, 0, 1, 1,
-1.759754, -1.559451, -2.334277, 1, 1, 1, 1, 1,
-1.755074, 0.4177766, -2.466417, 1, 1, 1, 1, 1,
-1.733595, 1.215661, -0.0009947211, 1, 1, 1, 1, 1,
-1.731258, 1.757072, -0.9479597, 1, 1, 1, 1, 1,
-1.72684, -0.0928001, -0.6613207, 1, 1, 1, 1, 1,
-1.723272, -0.4117233, -2.10172, 1, 1, 1, 1, 1,
-1.723049, 1.069028, -0.1801784, 1, 1, 1, 1, 1,
-1.716999, 0.2312876, -2.427728, 1, 1, 1, 1, 1,
-1.712339, 0.5905894, 0.8821197, 1, 1, 1, 1, 1,
-1.702919, -1.018105, -2.843858, 1, 1, 1, 1, 1,
-1.699251, 0.5850918, -1.9496, 1, 1, 1, 1, 1,
-1.695623, 1.047185, -0.7193218, 1, 1, 1, 1, 1,
-1.691253, -2.37326, -2.560887, 1, 1, 1, 1, 1,
-1.690038, -0.7181175, -2.280215, 1, 1, 1, 1, 1,
-1.67314, -0.04318153, -1.413262, 1, 1, 1, 1, 1,
-1.661114, 1.484582, 0.9815668, 0, 0, 1, 1, 1,
-1.657725, 0.1464973, -1.301077, 1, 0, 0, 1, 1,
-1.655339, -0.1333079, -0.7673423, 1, 0, 0, 1, 1,
-1.64817, -0.4302883, -0.7512168, 1, 0, 0, 1, 1,
-1.61483, -1.153487, -3.971775, 1, 0, 0, 1, 1,
-1.612807, -0.7230431, -2.271638, 1, 0, 0, 1, 1,
-1.608968, 0.7595228, 0.4671453, 0, 0, 0, 1, 1,
-1.607763, -0.07085556, -3.260162, 0, 0, 0, 1, 1,
-1.607408, 0.2142961, -1.68276, 0, 0, 0, 1, 1,
-1.604802, -1.882411, -1.501831, 0, 0, 0, 1, 1,
-1.583007, -0.0232113, -2.197439, 0, 0, 0, 1, 1,
-1.570058, -0.2215963, -2.195403, 0, 0, 0, 1, 1,
-1.569205, -1.758942, -3.500656, 0, 0, 0, 1, 1,
-1.563534, -0.9871565, -1.974666, 1, 1, 1, 1, 1,
-1.562443, 0.8455482, 0.6173779, 1, 1, 1, 1, 1,
-1.553, -0.01688338, -1.408736, 1, 1, 1, 1, 1,
-1.552601, -1.478567, -0.887086, 1, 1, 1, 1, 1,
-1.530618, 2.355259, -0.6454361, 1, 1, 1, 1, 1,
-1.528564, -0.1321147, -3.272879, 1, 1, 1, 1, 1,
-1.504867, 0.8443104, 0.08500375, 1, 1, 1, 1, 1,
-1.502231, -1.853708, -3.310354, 1, 1, 1, 1, 1,
-1.497577, 0.1977053, -0.1201048, 1, 1, 1, 1, 1,
-1.483636, -0.1271722, -1.654816, 1, 1, 1, 1, 1,
-1.480069, 1.630041, 0.4492522, 1, 1, 1, 1, 1,
-1.478205, -0.8879153, -1.569456, 1, 1, 1, 1, 1,
-1.460357, -0.9028646, -2.312823, 1, 1, 1, 1, 1,
-1.455445, -0.2726903, -1.900888, 1, 1, 1, 1, 1,
-1.449603, -0.6988206, -1.467748, 1, 1, 1, 1, 1,
-1.431967, 0.2915024, -1.087865, 0, 0, 1, 1, 1,
-1.418559, 0.5896419, -0.1942658, 1, 0, 0, 1, 1,
-1.381328, 1.079522, -0.8432224, 1, 0, 0, 1, 1,
-1.379787, 1.356003, -0.4875305, 1, 0, 0, 1, 1,
-1.376939, 0.2574408, -1.529366, 1, 0, 0, 1, 1,
-1.329752, 1.319938, 0.1002672, 1, 0, 0, 1, 1,
-1.328992, 1.450788, -1.718687, 0, 0, 0, 1, 1,
-1.320332, -0.4268232, -0.7448155, 0, 0, 0, 1, 1,
-1.31054, 0.001838546, -0.3014393, 0, 0, 0, 1, 1,
-1.310165, -0.5812453, -1.87581, 0, 0, 0, 1, 1,
-1.305996, -0.8076185, -1.556548, 0, 0, 0, 1, 1,
-1.304736, 1.472513, -0.8775365, 0, 0, 0, 1, 1,
-1.292265, 0.5696517, -1.316433, 0, 0, 0, 1, 1,
-1.282956, -1.472901, -0.4933823, 1, 1, 1, 1, 1,
-1.256001, -0.2220227, -1.457545, 1, 1, 1, 1, 1,
-1.247019, 0.2464408, -2.403928, 1, 1, 1, 1, 1,
-1.233288, 0.9300331, -0.1554093, 1, 1, 1, 1, 1,
-1.228484, 1.033828, -0.00766747, 1, 1, 1, 1, 1,
-1.221777, -0.8911055, -0.8936211, 1, 1, 1, 1, 1,
-1.217532, 0.1541475, -1.155344, 1, 1, 1, 1, 1,
-1.216095, 0.5779751, -0.7099389, 1, 1, 1, 1, 1,
-1.213312, -0.5019073, -1.154164, 1, 1, 1, 1, 1,
-1.210475, -0.7930543, -2.483348, 1, 1, 1, 1, 1,
-1.206849, 0.3982353, -0.819625, 1, 1, 1, 1, 1,
-1.201218, 0.1707388, -2.925912, 1, 1, 1, 1, 1,
-1.200652, -0.2280834, -0.6757772, 1, 1, 1, 1, 1,
-1.194996, -0.5841427, -1.574761, 1, 1, 1, 1, 1,
-1.194183, -1.131362, -4.604392, 1, 1, 1, 1, 1,
-1.186961, 0.3749487, -0.755288, 0, 0, 1, 1, 1,
-1.184768, -0.4510621, -1.764534, 1, 0, 0, 1, 1,
-1.17723, 1.440072, -1.561672, 1, 0, 0, 1, 1,
-1.165325, 0.8249808, -0.2591719, 1, 0, 0, 1, 1,
-1.161631, 0.6956424, -1.742975, 1, 0, 0, 1, 1,
-1.157427, -0.1434404, -1.527007, 1, 0, 0, 1, 1,
-1.145477, 0.7070992, -1.138708, 0, 0, 0, 1, 1,
-1.141079, 1.940994, -1.169351, 0, 0, 0, 1, 1,
-1.140432, 1.926458, -1.841199, 0, 0, 0, 1, 1,
-1.131789, 0.5281432, 1.115604, 0, 0, 0, 1, 1,
-1.13008, 0.06268366, -1.052131, 0, 0, 0, 1, 1,
-1.127627, -1.974493, -1.273868, 0, 0, 0, 1, 1,
-1.123483, -0.9484575, -3.366345, 0, 0, 0, 1, 1,
-1.123048, 1.410843, -1.235327, 1, 1, 1, 1, 1,
-1.114738, -0.176698, -1.775402, 1, 1, 1, 1, 1,
-1.112085, 0.4314565, -1.930968, 1, 1, 1, 1, 1,
-1.102741, 2.871209, -1.751397, 1, 1, 1, 1, 1,
-1.100288, -0.9164128, -3.404588, 1, 1, 1, 1, 1,
-1.089431, -0.5952014, -1.012276, 1, 1, 1, 1, 1,
-1.081492, 1.802112, -0.115583, 1, 1, 1, 1, 1,
-1.078712, -0.08608363, -0.518341, 1, 1, 1, 1, 1,
-1.071434, 1.281468, -2.913577, 1, 1, 1, 1, 1,
-1.070973, -0.1371741, -1.713492, 1, 1, 1, 1, 1,
-1.058496, 0.3246782, -0.5404212, 1, 1, 1, 1, 1,
-1.053753, -1.266168, -3.526548, 1, 1, 1, 1, 1,
-1.050288, -0.8368963, -1.513902, 1, 1, 1, 1, 1,
-1.043141, 1.06288, -0.534635, 1, 1, 1, 1, 1,
-1.041335, -0.5421923, -2.409423, 1, 1, 1, 1, 1,
-1.031789, 0.474016, -0.2611381, 0, 0, 1, 1, 1,
-1.030795, -0.726448, -2.92933, 1, 0, 0, 1, 1,
-1.030318, 0.5419529, -1.514719, 1, 0, 0, 1, 1,
-1.027671, 0.6508415, -2.118985, 1, 0, 0, 1, 1,
-1.016439, -0.3394365, -1.263757, 1, 0, 0, 1, 1,
-1.012094, 0.5894659, 0.04207944, 1, 0, 0, 1, 1,
-1.00931, -1.067043, -2.169597, 0, 0, 0, 1, 1,
-1.007442, 1.185605, -0.05928839, 0, 0, 0, 1, 1,
-1.006047, -0.2736027, -0.2064486, 0, 0, 0, 1, 1,
-1.003483, 0.6877102, -3.195024, 0, 0, 0, 1, 1,
-1.000218, 1.301778, -0.5448605, 0, 0, 0, 1, 1,
-0.9999164, 0.0682954, -1.877237, 0, 0, 0, 1, 1,
-0.9961528, 0.8213639, -1.406357, 0, 0, 0, 1, 1,
-0.9927192, 0.5320276, -0.5794623, 1, 1, 1, 1, 1,
-0.9883125, -0.6138895, -1.40464, 1, 1, 1, 1, 1,
-0.9857615, 0.8727497, -0.2712802, 1, 1, 1, 1, 1,
-0.9839146, 2.252479, -0.7167749, 1, 1, 1, 1, 1,
-0.9791325, -0.09613411, -2.042331, 1, 1, 1, 1, 1,
-0.9782002, -1.013118, -1.963831, 1, 1, 1, 1, 1,
-0.9762029, 0.2054772, -1.825014, 1, 1, 1, 1, 1,
-0.9711691, 1.227878, 0.8017399, 1, 1, 1, 1, 1,
-0.9615349, -0.7883599, -2.415954, 1, 1, 1, 1, 1,
-0.9614152, -1.897242, -1.754218, 1, 1, 1, 1, 1,
-0.9591095, 1.017747, -2.262187, 1, 1, 1, 1, 1,
-0.9563602, -1.087154, -1.613712, 1, 1, 1, 1, 1,
-0.9558142, 0.6044106, -1.524877, 1, 1, 1, 1, 1,
-0.9529161, -0.04701886, -3.006097, 1, 1, 1, 1, 1,
-0.9492611, 0.3570936, -0.9937441, 1, 1, 1, 1, 1,
-0.9482794, -0.3717, -1.217212, 0, 0, 1, 1, 1,
-0.9481891, 0.3713312, -1.143021, 1, 0, 0, 1, 1,
-0.9477399, 1.658237, -0.01470829, 1, 0, 0, 1, 1,
-0.9477382, -0.8691921, -2.453294, 1, 0, 0, 1, 1,
-0.9415311, 0.2688257, -1.01995, 1, 0, 0, 1, 1,
-0.9413239, 0.006681691, -0.5619166, 1, 0, 0, 1, 1,
-0.939879, -0.1754503, -1.918607, 0, 0, 0, 1, 1,
-0.9381726, -1.324191, -3.024669, 0, 0, 0, 1, 1,
-0.9344398, 1.151572, -0.02052105, 0, 0, 0, 1, 1,
-0.9321967, -0.5096015, -1.093858, 0, 0, 0, 1, 1,
-0.9241425, 1.036723, 0.9213972, 0, 0, 0, 1, 1,
-0.9202321, 1.029994, -0.02344356, 0, 0, 0, 1, 1,
-0.912964, -0.853526, -2.814706, 0, 0, 0, 1, 1,
-0.9120046, 0.6290525, -1.892928, 1, 1, 1, 1, 1,
-0.9087823, 0.4862053, -1.399281, 1, 1, 1, 1, 1,
-0.9011064, 1.592772, -1.717529, 1, 1, 1, 1, 1,
-0.8993485, -0.4741589, -2.978393, 1, 1, 1, 1, 1,
-0.8911339, -0.1373093, -0.7411364, 1, 1, 1, 1, 1,
-0.8903738, -0.2761278, -2.778585, 1, 1, 1, 1, 1,
-0.8846411, -0.4260759, -3.680976, 1, 1, 1, 1, 1,
-0.8816975, 0.1643908, 0.2704153, 1, 1, 1, 1, 1,
-0.8806669, 0.2178493, -0.3487444, 1, 1, 1, 1, 1,
-0.8795765, -0.7318845, -3.951387, 1, 1, 1, 1, 1,
-0.8785338, -1.360341, -3.24105, 1, 1, 1, 1, 1,
-0.8770783, 0.4210985, 0.5450079, 1, 1, 1, 1, 1,
-0.8610517, -0.3459581, -3.114012, 1, 1, 1, 1, 1,
-0.8592255, -0.6824846, -1.999456, 1, 1, 1, 1, 1,
-0.8510578, -1.08718, -3.293375, 1, 1, 1, 1, 1,
-0.8483186, 0.2230994, -1.269628, 0, 0, 1, 1, 1,
-0.8471264, -1.935568, -2.089731, 1, 0, 0, 1, 1,
-0.8459087, 0.5085709, -0.5157523, 1, 0, 0, 1, 1,
-0.845748, -1.054068, -4.496776, 1, 0, 0, 1, 1,
-0.8451548, 0.9554051, -1.557109, 1, 0, 0, 1, 1,
-0.8450688, -1.016988, -4.728058, 1, 0, 0, 1, 1,
-0.8449311, 0.6174979, -0.3694351, 0, 0, 0, 1, 1,
-0.8416747, -0.730548, -2.809148, 0, 0, 0, 1, 1,
-0.8411738, 3.657533, -1.114043, 0, 0, 0, 1, 1,
-0.8273951, -0.7154688, -2.448894, 0, 0, 0, 1, 1,
-0.8248646, -0.7959454, -3.589208, 0, 0, 0, 1, 1,
-0.8236063, 0.2442101, -1.888933, 0, 0, 0, 1, 1,
-0.8217522, -0.004251357, -1.667554, 0, 0, 0, 1, 1,
-0.8060681, -0.1893211, -1.278114, 1, 1, 1, 1, 1,
-0.8030711, -0.3023001, -1.147752, 1, 1, 1, 1, 1,
-0.8022655, -1.849534, -3.833623, 1, 1, 1, 1, 1,
-0.7960882, -1.49534, -2.750238, 1, 1, 1, 1, 1,
-0.7956641, -0.3703935, -1.259301, 1, 1, 1, 1, 1,
-0.7937479, -0.8114634, -2.591154, 1, 1, 1, 1, 1,
-0.7828269, -0.2346618, -3.984113, 1, 1, 1, 1, 1,
-0.7745457, 0.2426645, -0.2235919, 1, 1, 1, 1, 1,
-0.7722474, -0.8131806, -2.581889, 1, 1, 1, 1, 1,
-0.7716084, 0.2954185, -0.9483722, 1, 1, 1, 1, 1,
-0.771496, 2.213143, -2.685051, 1, 1, 1, 1, 1,
-0.7684778, -0.613914, -1.456905, 1, 1, 1, 1, 1,
-0.7669679, 0.3621453, -2.566964, 1, 1, 1, 1, 1,
-0.7617677, 1.923163, -1.069625, 1, 1, 1, 1, 1,
-0.7598457, -0.1272311, -0.8238553, 1, 1, 1, 1, 1,
-0.7569896, 0.2275503, -2.501884, 0, 0, 1, 1, 1,
-0.754698, -0.8892111, -2.290817, 1, 0, 0, 1, 1,
-0.7510405, -0.6236911, -1.060935, 1, 0, 0, 1, 1,
-0.7474498, -1.73068, -2.793355, 1, 0, 0, 1, 1,
-0.7473708, 0.3920727, -2.652202, 1, 0, 0, 1, 1,
-0.7470056, 0.457546, -1.458669, 1, 0, 0, 1, 1,
-0.7456391, 0.2812632, -2.528097, 0, 0, 0, 1, 1,
-0.7420352, -1.649311, -2.168054, 0, 0, 0, 1, 1,
-0.7369611, -1.485566, -2.56002, 0, 0, 0, 1, 1,
-0.7366793, -0.1618139, -2.73127, 0, 0, 0, 1, 1,
-0.7310456, 0.06109345, -2.061124, 0, 0, 0, 1, 1,
-0.7279153, 2.753835, -1.309261, 0, 0, 0, 1, 1,
-0.7271123, 0.3768134, 0.2610731, 0, 0, 0, 1, 1,
-0.7262383, 0.01057646, -1.577737, 1, 1, 1, 1, 1,
-0.7234105, -1.114254, -5.597974, 1, 1, 1, 1, 1,
-0.7167398, -1.21083, -4.38459, 1, 1, 1, 1, 1,
-0.7127439, -1.428414, -1.882643, 1, 1, 1, 1, 1,
-0.7110515, -0.499466, -1.98568, 1, 1, 1, 1, 1,
-0.6963195, -2.826801, -4.074704, 1, 1, 1, 1, 1,
-0.6953928, -0.1870521, -2.112756, 1, 1, 1, 1, 1,
-0.6951892, 1.569825, -0.02703641, 1, 1, 1, 1, 1,
-0.6923529, -1.15609, -2.346068, 1, 1, 1, 1, 1,
-0.6920484, 1.038626, -1.882383, 1, 1, 1, 1, 1,
-0.6896493, -0.610442, -2.446167, 1, 1, 1, 1, 1,
-0.6864468, -0.2861222, -1.60791, 1, 1, 1, 1, 1,
-0.6785866, 1.199845, -1.839832, 1, 1, 1, 1, 1,
-0.6779737, -0.1069309, -0.194658, 1, 1, 1, 1, 1,
-0.6773407, 0.4385122, -0.06479648, 1, 1, 1, 1, 1,
-0.6703966, 0.9457736, -2.077922, 0, 0, 1, 1, 1,
-0.668441, 0.7155882, 1.888975, 1, 0, 0, 1, 1,
-0.6665109, -1.61359, -3.473, 1, 0, 0, 1, 1,
-0.6645882, -0.3885057, -2.210497, 1, 0, 0, 1, 1,
-0.6466755, -0.04001609, -1.630216, 1, 0, 0, 1, 1,
-0.6455797, -1.347982, -1.521253, 1, 0, 0, 1, 1,
-0.6448336, -0.05584484, -0.9786269, 0, 0, 0, 1, 1,
-0.6388047, -0.4728591, -1.138321, 0, 0, 0, 1, 1,
-0.6382276, 0.763546, -1.399197, 0, 0, 0, 1, 1,
-0.6367527, -2.01107, -2.169283, 0, 0, 0, 1, 1,
-0.6360352, -1.785621, -3.144419, 0, 0, 0, 1, 1,
-0.6338056, 0.4977323, 1.337129, 0, 0, 0, 1, 1,
-0.6312822, 1.24247, 0.0691615, 0, 0, 0, 1, 1,
-0.6304291, 0.6630963, 0.2741031, 1, 1, 1, 1, 1,
-0.6122022, 1.123851, 0.1529484, 1, 1, 1, 1, 1,
-0.6100342, 0.1622444, -3.224239, 1, 1, 1, 1, 1,
-0.6024807, -0.7614191, -1.945326, 1, 1, 1, 1, 1,
-0.6003416, 0.1378176, -0.7791962, 1, 1, 1, 1, 1,
-0.5961417, -0.9900554, -3.002867, 1, 1, 1, 1, 1,
-0.5939783, 1.130157, -0.6967241, 1, 1, 1, 1, 1,
-0.5925855, -0.247499, -2.404224, 1, 1, 1, 1, 1,
-0.5906368, -0.8771271, -2.447399, 1, 1, 1, 1, 1,
-0.5880426, 1.355846, -1.303543, 1, 1, 1, 1, 1,
-0.5880246, -2.406918, -0.7419765, 1, 1, 1, 1, 1,
-0.582309, 0.7653056, 0.5774453, 1, 1, 1, 1, 1,
-0.5796568, 1.593627, 1.460336, 1, 1, 1, 1, 1,
-0.5793673, 0.6380436, 0.2056139, 1, 1, 1, 1, 1,
-0.5757622, -0.2917816, 0.1214902, 1, 1, 1, 1, 1,
-0.5751181, 0.3377326, -1.113915, 0, 0, 1, 1, 1,
-0.5717884, -0.1832451, -2.073026, 1, 0, 0, 1, 1,
-0.5681931, 1.047398, -0.3769166, 1, 0, 0, 1, 1,
-0.5679431, 1.926384, -0.3447109, 1, 0, 0, 1, 1,
-0.5621417, -0.3277032, -1.065472, 1, 0, 0, 1, 1,
-0.5580255, -0.3838857, -1.337843, 1, 0, 0, 1, 1,
-0.5566587, 0.0184199, -2.141651, 0, 0, 0, 1, 1,
-0.5522097, 0.03837802, -2.486877, 0, 0, 0, 1, 1,
-0.5409177, 0.2348638, -0.9397398, 0, 0, 0, 1, 1,
-0.5387917, -0.7420815, -0.1021312, 0, 0, 0, 1, 1,
-0.5319563, -0.3692591, -1.556872, 0, 0, 0, 1, 1,
-0.5275422, 0.2169459, -1.877126, 0, 0, 0, 1, 1,
-0.5260937, 0.8374453, 1.781186, 0, 0, 0, 1, 1,
-0.5251885, -0.5399884, -2.193568, 1, 1, 1, 1, 1,
-0.5199713, -0.1803509, -0.5286607, 1, 1, 1, 1, 1,
-0.5184887, -1.991268, -3.733738, 1, 1, 1, 1, 1,
-0.5148029, 0.2224465, -1.03864, 1, 1, 1, 1, 1,
-0.5134539, -1.284825, -2.553857, 1, 1, 1, 1, 1,
-0.5132322, 0.6874869, 0.03834022, 1, 1, 1, 1, 1,
-0.5116153, -0.3778352, -1.572075, 1, 1, 1, 1, 1,
-0.5058244, -0.5216557, -1.61874, 1, 1, 1, 1, 1,
-0.5028412, 2.109264, 1.439019, 1, 1, 1, 1, 1,
-0.4955755, 1.02999, -1.171463, 1, 1, 1, 1, 1,
-0.4888537, 0.8506713, -1.173054, 1, 1, 1, 1, 1,
-0.4856525, 0.6458711, -1.523194, 1, 1, 1, 1, 1,
-0.483579, -0.04837452, -2.050848, 1, 1, 1, 1, 1,
-0.4818059, 0.383694, -2.857872, 1, 1, 1, 1, 1,
-0.481685, -2.231351, -2.820768, 1, 1, 1, 1, 1,
-0.4815418, -1.280791, -4.702579, 0, 0, 1, 1, 1,
-0.4786395, -1.11661, -2.868041, 1, 0, 0, 1, 1,
-0.4779809, 0.3937325, 0.4057812, 1, 0, 0, 1, 1,
-0.4776953, -0.1372509, -1.4662, 1, 0, 0, 1, 1,
-0.4725085, -0.2944843, -3.039377, 1, 0, 0, 1, 1,
-0.4666708, 0.7052141, -0.9841487, 1, 0, 0, 1, 1,
-0.4635122, 0.8327855, -1.357987, 0, 0, 0, 1, 1,
-0.4625777, 0.4601352, -1.273329, 0, 0, 0, 1, 1,
-0.4597086, 0.14293, -0.4170144, 0, 0, 0, 1, 1,
-0.4594732, 1.811995, 0.2535766, 0, 0, 0, 1, 1,
-0.4579234, 0.9911791, 0.6949558, 0, 0, 0, 1, 1,
-0.4548261, -0.1569931, -1.607736, 0, 0, 0, 1, 1,
-0.4520122, -0.08303687, -1.97604, 0, 0, 0, 1, 1,
-0.4503838, 0.258345, 0.0867652, 1, 1, 1, 1, 1,
-0.4422004, -0.4494322, -3.690817, 1, 1, 1, 1, 1,
-0.4411081, 0.7717175, -0.4783854, 1, 1, 1, 1, 1,
-0.4374641, -0.4955888, -2.291695, 1, 1, 1, 1, 1,
-0.4367733, -0.5426731, -1.576728, 1, 1, 1, 1, 1,
-0.4302437, 1.28918, 0.02220382, 1, 1, 1, 1, 1,
-0.4282778, 0.7756501, 0.5230333, 1, 1, 1, 1, 1,
-0.4278555, -0.5793089, -2.573756, 1, 1, 1, 1, 1,
-0.4263626, 1.121946, 0.04081691, 1, 1, 1, 1, 1,
-0.4227343, 1.066581, -0.7221082, 1, 1, 1, 1, 1,
-0.4172143, -1.352292, -3.847145, 1, 1, 1, 1, 1,
-0.4133271, 2.086288, -0.01728411, 1, 1, 1, 1, 1,
-0.4124691, -1.522508, -4.534028, 1, 1, 1, 1, 1,
-0.411404, 0.192067, -1.772272, 1, 1, 1, 1, 1,
-0.409312, 2.76359, 1.203272, 1, 1, 1, 1, 1,
-0.4086692, -1.240916, -1.672318, 0, 0, 1, 1, 1,
-0.4011832, 0.2750597, -1.233314, 1, 0, 0, 1, 1,
-0.4010106, 1.10157, 0.9959105, 1, 0, 0, 1, 1,
-0.3980477, 0.06967089, -1.338409, 1, 0, 0, 1, 1,
-0.3971443, 0.6545115, -0.5480008, 1, 0, 0, 1, 1,
-0.39431, 0.7453309, -0.8838912, 1, 0, 0, 1, 1,
-0.3930972, -0.3668185, -2.013598, 0, 0, 0, 1, 1,
-0.392996, 0.5535367, -2.687509, 0, 0, 0, 1, 1,
-0.3907072, -0.4858103, -3.385302, 0, 0, 0, 1, 1,
-0.3860813, -0.5568093, -1.035824, 0, 0, 0, 1, 1,
-0.3845589, 0.06450347, -2.774641, 0, 0, 0, 1, 1,
-0.3834432, 1.013873, 0.4922349, 0, 0, 0, 1, 1,
-0.382308, -1.309419, -3.077455, 0, 0, 0, 1, 1,
-0.3816133, 0.6665785, -2.013092, 1, 1, 1, 1, 1,
-0.3798932, 1.303388, -1.072345, 1, 1, 1, 1, 1,
-0.3780423, 1.07251, -1.003985, 1, 1, 1, 1, 1,
-0.3749842, 0.5223987, -0.5591958, 1, 1, 1, 1, 1,
-0.3749722, -1.909869, -2.763368, 1, 1, 1, 1, 1,
-0.3722557, 0.3617207, 0.1530253, 1, 1, 1, 1, 1,
-0.3658779, -0.6395975, -4.884874, 1, 1, 1, 1, 1,
-0.3653466, 0.3952045, -1.008655, 1, 1, 1, 1, 1,
-0.3650376, -0.5141768, -2.727834, 1, 1, 1, 1, 1,
-0.3648051, -0.6757577, -3.758347, 1, 1, 1, 1, 1,
-0.362188, 0.3878905, -0.8706547, 1, 1, 1, 1, 1,
-0.349256, 0.9935948, -0.1563918, 1, 1, 1, 1, 1,
-0.3457043, 0.3907503, -1.812319, 1, 1, 1, 1, 1,
-0.3454907, -0.8018324, -2.402713, 1, 1, 1, 1, 1,
-0.3443223, 0.9228611, 1.250542, 1, 1, 1, 1, 1,
-0.3417001, 0.1073192, -1.942479, 0, 0, 1, 1, 1,
-0.3391844, -0.4503198, -3.675201, 1, 0, 0, 1, 1,
-0.3367044, 0.4305071, 0.1475056, 1, 0, 0, 1, 1,
-0.3348479, -0.2302655, -1.079304, 1, 0, 0, 1, 1,
-0.3345647, 1.405985, 0.7787036, 1, 0, 0, 1, 1,
-0.3331296, 0.05742332, -0.6111708, 1, 0, 0, 1, 1,
-0.328192, 1.960457, -0.01985093, 0, 0, 0, 1, 1,
-0.3276604, 0.3381156, -0.6332032, 0, 0, 0, 1, 1,
-0.3275836, -0.5439913, -0.2442535, 0, 0, 0, 1, 1,
-0.3261189, -1.098982, -1.987393, 0, 0, 0, 1, 1,
-0.3219115, 0.6820442, 0.5543059, 0, 0, 0, 1, 1,
-0.3182542, 0.5562879, -1.043504, 0, 0, 0, 1, 1,
-0.3122475, 0.8851603, 0.9273266, 0, 0, 0, 1, 1,
-0.3081981, 0.2503282, -0.9887199, 1, 1, 1, 1, 1,
-0.3076612, 0.5584538, -1.169187, 1, 1, 1, 1, 1,
-0.3030882, -1.395084, -3.453023, 1, 1, 1, 1, 1,
-0.3027798, 1.332232, 0.2215814, 1, 1, 1, 1, 1,
-0.2972373, -1.582667, -4.275736, 1, 1, 1, 1, 1,
-0.2963862, 2.05587, -0.9393635, 1, 1, 1, 1, 1,
-0.2960549, 0.731357, -0.5834284, 1, 1, 1, 1, 1,
-0.2939925, 0.1250881, -0.7391784, 1, 1, 1, 1, 1,
-0.2938277, -0.2529203, -0.9537347, 1, 1, 1, 1, 1,
-0.2914353, 0.2187794, -0.1146603, 1, 1, 1, 1, 1,
-0.2866674, -1.300839, -3.325903, 1, 1, 1, 1, 1,
-0.2841433, -0.5935196, -1.446216, 1, 1, 1, 1, 1,
-0.2833529, -0.5465164, -2.193503, 1, 1, 1, 1, 1,
-0.2811757, -0.2711538, -2.083817, 1, 1, 1, 1, 1,
-0.2810863, 1.905332, 1.921971, 1, 1, 1, 1, 1,
-0.2791029, -0.6074305, -1.677522, 0, 0, 1, 1, 1,
-0.2764106, 1.538124, 0.3872276, 1, 0, 0, 1, 1,
-0.2716264, -0.8489386, -3.876232, 1, 0, 0, 1, 1,
-0.2661282, 0.4805928, -0.6330708, 1, 0, 0, 1, 1,
-0.2632682, -0.2417529, -2.97812, 1, 0, 0, 1, 1,
-0.2621111, -0.2582566, -2.561489, 1, 0, 0, 1, 1,
-0.2596155, -1.358113, -1.066319, 0, 0, 0, 1, 1,
-0.2585689, 0.3108465, -0.696516, 0, 0, 0, 1, 1,
-0.2579242, -0.7577472, -2.375028, 0, 0, 0, 1, 1,
-0.2498562, 0.0332756, -0.792389, 0, 0, 0, 1, 1,
-0.2445052, 0.0498689, -2.82047, 0, 0, 0, 1, 1,
-0.2443956, -0.5631841, -1.792612, 0, 0, 0, 1, 1,
-0.2426681, -1.830403, -1.403334, 0, 0, 0, 1, 1,
-0.2383585, 1.717703, -0.6618441, 1, 1, 1, 1, 1,
-0.2311902, 0.3810873, 1.639249, 1, 1, 1, 1, 1,
-0.2288649, 0.7577955, 0.1624963, 1, 1, 1, 1, 1,
-0.2285943, 0.8550745, 0.2823091, 1, 1, 1, 1, 1,
-0.2261188, -1.367404, -4.751301, 1, 1, 1, 1, 1,
-0.2203927, -0.1358927, -3.657025, 1, 1, 1, 1, 1,
-0.2199988, -1.019338, -4.546695, 1, 1, 1, 1, 1,
-0.2166402, -1.469831, -3.011612, 1, 1, 1, 1, 1,
-0.2164357, -0.6955386, -3.050586, 1, 1, 1, 1, 1,
-0.2081737, -0.4949064, -1.738896, 1, 1, 1, 1, 1,
-0.2067592, -0.5090072, -0.654877, 1, 1, 1, 1, 1,
-0.2038911, -1.230711, -1.149213, 1, 1, 1, 1, 1,
-0.2036477, -0.09469688, -2.17507, 1, 1, 1, 1, 1,
-0.1994729, -1.000986, -3.799955, 1, 1, 1, 1, 1,
-0.1938927, -0.9219562, -4.054679, 1, 1, 1, 1, 1,
-0.1914529, -0.1307845, -0.9264582, 0, 0, 1, 1, 1,
-0.1885276, -2.562762, -1.583318, 1, 0, 0, 1, 1,
-0.1844509, -0.5870417, -2.78523, 1, 0, 0, 1, 1,
-0.1836552, -0.5282421, -2.087212, 1, 0, 0, 1, 1,
-0.1826419, 0.294513, -1.126709, 1, 0, 0, 1, 1,
-0.1801936, -0.00480022, -1.803078, 1, 0, 0, 1, 1,
-0.1794132, 0.9445671, 0.006882568, 0, 0, 0, 1, 1,
-0.1792075, -0.2317252, -2.224452, 0, 0, 0, 1, 1,
-0.1681722, -0.72168, -2.989463, 0, 0, 0, 1, 1,
-0.1649819, 0.07448427, -0.1861897, 0, 0, 0, 1, 1,
-0.1628614, -0.6794679, -1.72922, 0, 0, 0, 1, 1,
-0.162015, 0.7888325, -0.194497, 0, 0, 0, 1, 1,
-0.1582652, -0.3191222, -4.988959, 0, 0, 0, 1, 1,
-0.1582159, 0.491699, 0.5152552, 1, 1, 1, 1, 1,
-0.1563984, 2.674155, -0.6119108, 1, 1, 1, 1, 1,
-0.1561445, 0.8669293, 0.2225689, 1, 1, 1, 1, 1,
-0.1561084, -1.395705, -3.206115, 1, 1, 1, 1, 1,
-0.1539119, -1.802095, -2.701204, 1, 1, 1, 1, 1,
-0.1469306, -1.136654, -4.04411, 1, 1, 1, 1, 1,
-0.1464282, 0.8922966, -1.26304, 1, 1, 1, 1, 1,
-0.1460613, -1.224458, -3.282382, 1, 1, 1, 1, 1,
-0.1418313, 1.250988, 0.2469014, 1, 1, 1, 1, 1,
-0.140596, -0.1585065, -1.878214, 1, 1, 1, 1, 1,
-0.1403054, 1.784269, -1.649788, 1, 1, 1, 1, 1,
-0.1385812, 0.4721577, 0.4530566, 1, 1, 1, 1, 1,
-0.1382193, -0.1588297, -3.112354, 1, 1, 1, 1, 1,
-0.1381929, -0.01621208, -1.522805, 1, 1, 1, 1, 1,
-0.1355361, -0.1491749, -1.194378, 1, 1, 1, 1, 1,
-0.1260412, 1.646235, 0.2952459, 0, 0, 1, 1, 1,
-0.1215959, -2.010827, -3.338967, 1, 0, 0, 1, 1,
-0.1201532, 0.831333, -0.1733061, 1, 0, 0, 1, 1,
-0.1193922, 0.7074474, -1.01542, 1, 0, 0, 1, 1,
-0.1143555, -1.384534, -1.469854, 1, 0, 0, 1, 1,
-0.09883548, 0.9731339, -1.7227, 1, 0, 0, 1, 1,
-0.08973575, -1.795677, -1.631059, 0, 0, 0, 1, 1,
-0.08865403, -0.4376526, -2.8276, 0, 0, 0, 1, 1,
-0.08720766, -0.1698915, -4.857383, 0, 0, 0, 1, 1,
-0.08702202, -0.3692309, -1.904999, 0, 0, 0, 1, 1,
-0.08217841, -0.3365428, -3.809642, 0, 0, 0, 1, 1,
-0.08194195, 0.2339395, 0.2074154, 0, 0, 0, 1, 1,
-0.08141737, 0.05197992, -1.278763, 0, 0, 0, 1, 1,
-0.07265869, 1.605157, -0.357792, 1, 1, 1, 1, 1,
-0.07174657, -1.880908, -5.647063, 1, 1, 1, 1, 1,
-0.06611835, 1.194959, 0.687537, 1, 1, 1, 1, 1,
-0.06546365, 0.3045475, -0.4935846, 1, 1, 1, 1, 1,
-0.06474315, 0.7361665, -2.010174, 1, 1, 1, 1, 1,
-0.05957199, 0.4201072, 1.48472, 1, 1, 1, 1, 1,
-0.0583923, 1.314566, 0.9741845, 1, 1, 1, 1, 1,
-0.0554928, 0.99562, 0.6703107, 1, 1, 1, 1, 1,
-0.05492176, -0.4707576, -2.359099, 1, 1, 1, 1, 1,
-0.05434122, 1.24489, 1.036714, 1, 1, 1, 1, 1,
-0.05357437, -0.1712607, -2.61774, 1, 1, 1, 1, 1,
-0.05307624, -1.152399, -1.808729, 1, 1, 1, 1, 1,
-0.05224205, -0.2094271, -1.658521, 1, 1, 1, 1, 1,
-0.04498776, 0.5193569, 1.110874, 1, 1, 1, 1, 1,
-0.03869072, -0.7395687, -3.464116, 1, 1, 1, 1, 1,
-0.03643685, 0.6348947, 0.09998076, 0, 0, 1, 1, 1,
-0.03561334, -0.006135857, -0.09245197, 1, 0, 0, 1, 1,
-0.03330813, 0.1043274, -1.063648, 1, 0, 0, 1, 1,
-0.03019796, 0.1860819, -0.8897323, 1, 0, 0, 1, 1,
-0.02614599, 0.4795938, 0.1010461, 1, 0, 0, 1, 1,
-0.02581229, 1.46903, 1.799347, 1, 0, 0, 1, 1,
-0.02547721, -0.006168289, -2.405889, 0, 0, 0, 1, 1,
-0.0198647, 0.5531607, -0.6570166, 0, 0, 0, 1, 1,
-0.01897229, -0.5677322, -3.716241, 0, 0, 0, 1, 1,
-0.01762132, 0.3877082, 1.02138, 0, 0, 0, 1, 1,
-0.01400936, -0.2493762, -3.482966, 0, 0, 0, 1, 1,
-0.01262473, 0.4509605, -0.1343593, 0, 0, 0, 1, 1,
-0.01008348, -1.001068, -1.65972, 0, 0, 0, 1, 1,
-0.00891581, 0.6205972, 1.004586, 1, 1, 1, 1, 1,
-0.002875093, -0.25708, -2.431987, 1, 1, 1, 1, 1,
-0.00136734, -0.442668, -2.076166, 1, 1, 1, 1, 1,
0.003865702, -1.013601, 2.885059, 1, 1, 1, 1, 1,
0.004084622, 1.094641, -0.4403948, 1, 1, 1, 1, 1,
0.006382863, -0.06868605, 2.896263, 1, 1, 1, 1, 1,
0.008081921, 0.1241734, 0.03659545, 1, 1, 1, 1, 1,
0.01299683, -0.3886712, 3.807511, 1, 1, 1, 1, 1,
0.01377271, -0.9026029, 3.396363, 1, 1, 1, 1, 1,
0.01421577, 0.7310279, -0.233123, 1, 1, 1, 1, 1,
0.02179868, -0.525948, 4.538578, 1, 1, 1, 1, 1,
0.0236007, -0.8607254, 1.118048, 1, 1, 1, 1, 1,
0.02491666, 1.047119, 0.08240141, 1, 1, 1, 1, 1,
0.03074096, 1.40794, -0.5716231, 1, 1, 1, 1, 1,
0.03418258, 0.03837955, 1.464923, 1, 1, 1, 1, 1,
0.03419235, 1.227087, 1.509273, 0, 0, 1, 1, 1,
0.03422975, 2.207186, -0.04591415, 1, 0, 0, 1, 1,
0.03533821, -0.2602402, 3.377472, 1, 0, 0, 1, 1,
0.04188391, -1.971978, 2.132681, 1, 0, 0, 1, 1,
0.04559124, 0.09464518, -1.175182, 1, 0, 0, 1, 1,
0.04758136, 0.6950777, 0.8829935, 1, 0, 0, 1, 1,
0.04922298, -1.319859, 3.103291, 0, 0, 0, 1, 1,
0.05272807, 0.9782245, 0.1455652, 0, 0, 0, 1, 1,
0.05636461, 0.1877629, 0.3671203, 0, 0, 0, 1, 1,
0.05854551, -0.8446862, 5.000934, 0, 0, 0, 1, 1,
0.06126247, -1.621911, 3.428788, 0, 0, 0, 1, 1,
0.06289607, 0.4840558, -0.8315182, 0, 0, 0, 1, 1,
0.065037, -0.9173473, 2.8528, 0, 0, 0, 1, 1,
0.06747939, 1.112696, 0.009157894, 1, 1, 1, 1, 1,
0.06829284, -1.134376, 3.771144, 1, 1, 1, 1, 1,
0.06861845, -1.585321, 3.775733, 1, 1, 1, 1, 1,
0.07142462, 1.366309, -0.07222728, 1, 1, 1, 1, 1,
0.07233042, -0.6978691, 4.655985, 1, 1, 1, 1, 1,
0.07404897, 1.343255, 0.01617115, 1, 1, 1, 1, 1,
0.07518923, -0.3639521, 2.664881, 1, 1, 1, 1, 1,
0.08049452, 0.4740742, 1.654213, 1, 1, 1, 1, 1,
0.08080367, -0.3980713, 4.116534, 1, 1, 1, 1, 1,
0.08405483, -0.4498127, 4.241945, 1, 1, 1, 1, 1,
0.08429343, -0.1910617, 3.824973, 1, 1, 1, 1, 1,
0.08477013, -0.1761181, 2.931823, 1, 1, 1, 1, 1,
0.08606847, -1.842402, 2.41602, 1, 1, 1, 1, 1,
0.08676939, 0.8854302, 0.5770797, 1, 1, 1, 1, 1,
0.08779974, -2.124028, 2.313366, 1, 1, 1, 1, 1,
0.08887611, -1.73548, 2.885365, 0, 0, 1, 1, 1,
0.09241718, 0.5324115, -0.7255147, 1, 0, 0, 1, 1,
0.09249534, 0.4033646, -1.079866, 1, 0, 0, 1, 1,
0.09271865, 1.611304, 0.4274158, 1, 0, 0, 1, 1,
0.0985752, -0.4538147, 3.393051, 1, 0, 0, 1, 1,
0.1072748, -1.017734, 1.165286, 1, 0, 0, 1, 1,
0.1075821, -0.8981138, 2.950838, 0, 0, 0, 1, 1,
0.1098367, 1.317482, -0.1544699, 0, 0, 0, 1, 1,
0.1112794, 0.136455, 2.635335, 0, 0, 0, 1, 1,
0.1131826, -0.5253456, 0.951548, 0, 0, 0, 1, 1,
0.1140942, 0.05606004, 0.1727712, 0, 0, 0, 1, 1,
0.1260369, -1.492393, 3.736795, 0, 0, 0, 1, 1,
0.1263019, 0.2162771, 0.9658304, 0, 0, 0, 1, 1,
0.1309193, -0.3425238, 2.96031, 1, 1, 1, 1, 1,
0.1324574, 0.5374409, 0.9214934, 1, 1, 1, 1, 1,
0.1330791, -1.501305, 1.5979, 1, 1, 1, 1, 1,
0.1372142, 1.148235, 0.4247715, 1, 1, 1, 1, 1,
0.1382729, -0.1663388, 3.459287, 1, 1, 1, 1, 1,
0.1391245, -0.4458424, 4.065165, 1, 1, 1, 1, 1,
0.1401451, -0.743086, 2.159712, 1, 1, 1, 1, 1,
0.1480289, 0.8526062, -0.7391406, 1, 1, 1, 1, 1,
0.1481996, 0.5406298, 0.08542153, 1, 1, 1, 1, 1,
0.1515499, 1.037218, 0.303774, 1, 1, 1, 1, 1,
0.1537565, 0.6712213, -0.2868768, 1, 1, 1, 1, 1,
0.1552983, 0.53362, -0.001237896, 1, 1, 1, 1, 1,
0.1591179, 1.221343, 0.9791391, 1, 1, 1, 1, 1,
0.1671243, 1.125696, -0.7074677, 1, 1, 1, 1, 1,
0.1673483, -2.107577, 3.10636, 1, 1, 1, 1, 1,
0.169131, -1.992597, 3.935968, 0, 0, 1, 1, 1,
0.1699577, -0.02376195, 2.540528, 1, 0, 0, 1, 1,
0.1757454, -1.550927, 2.91162, 1, 0, 0, 1, 1,
0.1763465, -0.3184047, 2.15729, 1, 0, 0, 1, 1,
0.1764412, 0.3647893, -0.6873617, 1, 0, 0, 1, 1,
0.1800447, -0.412098, 2.649607, 1, 0, 0, 1, 1,
0.1802485, 1.701603, -2.12134, 0, 0, 0, 1, 1,
0.1820687, 1.875786, 0.5305321, 0, 0, 0, 1, 1,
0.1931029, -0.09917038, 3.567972, 0, 0, 0, 1, 1,
0.1971514, 0.8352547, -1.017616, 0, 0, 0, 1, 1,
0.2003049, -0.01562932, 2.160452, 0, 0, 0, 1, 1,
0.2007501, -1.079038, 2.780135, 0, 0, 0, 1, 1,
0.2019848, -0.7715751, 2.531129, 0, 0, 0, 1, 1,
0.2026129, -2.909272, 2.367253, 1, 1, 1, 1, 1,
0.2089428, 1.56646, -1.201512, 1, 1, 1, 1, 1,
0.2185643, -1.389245, 2.937694, 1, 1, 1, 1, 1,
0.225443, 1.14312, -1.021087, 1, 1, 1, 1, 1,
0.2267327, 0.9655872, -0.4040851, 1, 1, 1, 1, 1,
0.2317027, 0.03632682, 4.95106, 1, 1, 1, 1, 1,
0.2325405, 1.637603, 0.5620422, 1, 1, 1, 1, 1,
0.2333962, 0.06183388, 3.541112, 1, 1, 1, 1, 1,
0.2336836, 0.4041466, 0.8295181, 1, 1, 1, 1, 1,
0.2341223, 0.1720473, 1.569003, 1, 1, 1, 1, 1,
0.240169, 0.8362501, 0.3367229, 1, 1, 1, 1, 1,
0.2411565, -0.09248447, 2.139721, 1, 1, 1, 1, 1,
0.2431716, 0.2827603, 0.1482188, 1, 1, 1, 1, 1,
0.2431874, -0.2538019, 3.709261, 1, 1, 1, 1, 1,
0.2432195, -1.399226, 3.294467, 1, 1, 1, 1, 1,
0.2439998, -0.8087224, 2.020071, 0, 0, 1, 1, 1,
0.2464456, 1.135539, -0.01133489, 1, 0, 0, 1, 1,
0.2513258, -0.4983226, 3.98873, 1, 0, 0, 1, 1,
0.2513901, -0.7292643, 3.818377, 1, 0, 0, 1, 1,
0.2568545, 0.4708615, 1.095509, 1, 0, 0, 1, 1,
0.2574734, 0.6749437, -0.5678321, 1, 0, 0, 1, 1,
0.258743, -0.8843606, 1.490966, 0, 0, 0, 1, 1,
0.2632566, -1.184535, 3.997972, 0, 0, 0, 1, 1,
0.2672245, 2.303897, -0.987444, 0, 0, 0, 1, 1,
0.267288, -0.2530785, 3.340909, 0, 0, 0, 1, 1,
0.2678593, -1.92134, 3.933715, 0, 0, 0, 1, 1,
0.2686424, -1.734281, 3.245527, 0, 0, 0, 1, 1,
0.2729494, 1.458345, 0.4443533, 0, 0, 0, 1, 1,
0.2773682, 0.7961419, 1.611519, 1, 1, 1, 1, 1,
0.2844245, -1.257277, 3.711892, 1, 1, 1, 1, 1,
0.2877797, 0.7411529, -0.1894808, 1, 1, 1, 1, 1,
0.2878931, -0.9149827, 4.674164, 1, 1, 1, 1, 1,
0.2901609, -0.1155324, 1.527933, 1, 1, 1, 1, 1,
0.2911985, 0.2997749, 1.271394, 1, 1, 1, 1, 1,
0.2922971, 0.6302544, 1.546006, 1, 1, 1, 1, 1,
0.2930717, 0.2751202, 1.016526, 1, 1, 1, 1, 1,
0.2939809, -1.286204, 3.550265, 1, 1, 1, 1, 1,
0.2946765, 0.999949, -0.5776879, 1, 1, 1, 1, 1,
0.2948191, 0.3398516, 1.257535, 1, 1, 1, 1, 1,
0.3069822, -0.02986308, 1.492834, 1, 1, 1, 1, 1,
0.3125733, 1.142091, -1.772351, 1, 1, 1, 1, 1,
0.3143636, -1.376431, 3.099463, 1, 1, 1, 1, 1,
0.3151248, -0.5189474, 4.030552, 1, 1, 1, 1, 1,
0.31714, -0.4998072, 3.98077, 0, 0, 1, 1, 1,
0.3191065, 0.01710915, 2.041544, 1, 0, 0, 1, 1,
0.3210206, -0.5568923, 1.375909, 1, 0, 0, 1, 1,
0.321972, -0.1449422, -0.6105778, 1, 0, 0, 1, 1,
0.322789, -8.294774e-05, 0.9270336, 1, 0, 0, 1, 1,
0.3239908, -0.21417, 2.031377, 1, 0, 0, 1, 1,
0.3334372, -2.09695, 4.012246, 0, 0, 0, 1, 1,
0.3337132, -1.367652, 0.7118543, 0, 0, 0, 1, 1,
0.3347698, 0.7005067, 1.742754, 0, 0, 0, 1, 1,
0.3359259, 1.168936, 0.7413567, 0, 0, 0, 1, 1,
0.336056, -0.1801032, 1.043971, 0, 0, 0, 1, 1,
0.3427335, -0.7611032, 1.981533, 0, 0, 0, 1, 1,
0.3447932, 0.5350195, 0.3127862, 0, 0, 0, 1, 1,
0.3448398, 0.06488732, 2.556234, 1, 1, 1, 1, 1,
0.3474819, -0.8013043, 4.178454, 1, 1, 1, 1, 1,
0.3481274, 0.3508973, 1.548106, 1, 1, 1, 1, 1,
0.3490361, 0.3602708, 2.572893, 1, 1, 1, 1, 1,
0.3541391, 1.421036, 1.050354, 1, 1, 1, 1, 1,
0.3567021, 0.2356079, 0.2605288, 1, 1, 1, 1, 1,
0.3581403, -0.144067, 2.375952, 1, 1, 1, 1, 1,
0.3582324, 1.927863, -0.5106836, 1, 1, 1, 1, 1,
0.3640438, -1.484719, 3.142228, 1, 1, 1, 1, 1,
0.3680157, -0.5580062, 1.840793, 1, 1, 1, 1, 1,
0.3682307, 0.7309271, 0.1375028, 1, 1, 1, 1, 1,
0.3682758, 0.04834986, 2.726401, 1, 1, 1, 1, 1,
0.3714854, -0.9067553, 2.198029, 1, 1, 1, 1, 1,
0.3732432, 0.5155722, 1.77603, 1, 1, 1, 1, 1,
0.3738762, 1.182677, 0.1537373, 1, 1, 1, 1, 1,
0.375796, -0.3126185, 0.17016, 0, 0, 1, 1, 1,
0.377784, -2.012197, 1.87304, 1, 0, 0, 1, 1,
0.3797441, -1.208719, 4.374785, 1, 0, 0, 1, 1,
0.3802017, 0.6504655, 0.07606806, 1, 0, 0, 1, 1,
0.3803522, -0.0519366, 1.589613, 1, 0, 0, 1, 1,
0.3822732, 0.2611659, -0.5000284, 1, 0, 0, 1, 1,
0.3867283, 0.0507426, 1.933568, 0, 0, 0, 1, 1,
0.387473, 0.3212527, 0.5878273, 0, 0, 0, 1, 1,
0.3912084, 1.102454, 0.8547927, 0, 0, 0, 1, 1,
0.3938227, 0.6633338, 0.8543479, 0, 0, 0, 1, 1,
0.3938661, -0.1595918, 1.672533, 0, 0, 0, 1, 1,
0.394164, 0.3383838, 0.6385428, 0, 0, 0, 1, 1,
0.3946396, 0.577858, 1.199645, 0, 0, 0, 1, 1,
0.3967665, 0.005553018, 1.376455, 1, 1, 1, 1, 1,
0.3968085, 0.1385762, 3.174505, 1, 1, 1, 1, 1,
0.3986124, -0.06901519, 2.809786, 1, 1, 1, 1, 1,
0.4039928, 1.116959, 1.865504, 1, 1, 1, 1, 1,
0.4040698, -0.5359668, 3.323371, 1, 1, 1, 1, 1,
0.4111372, 0.5034077, 1.349256, 1, 1, 1, 1, 1,
0.4129907, 0.6374885, 1.38934, 1, 1, 1, 1, 1,
0.4138207, -1.134007, 2.317974, 1, 1, 1, 1, 1,
0.4158527, -0.09043654, 1.239861, 1, 1, 1, 1, 1,
0.4227266, 0.9902176, -0.4644011, 1, 1, 1, 1, 1,
0.4248121, -0.6066555, 3.726853, 1, 1, 1, 1, 1,
0.4260054, 0.8063837, 0.3307352, 1, 1, 1, 1, 1,
0.4322012, -0.7382574, 1.069964, 1, 1, 1, 1, 1,
0.4334925, 1.229755, -0.6805041, 1, 1, 1, 1, 1,
0.4367618, 0.3826979, 1.689893, 1, 1, 1, 1, 1,
0.4417065, -0.1767299, 2.726007, 0, 0, 1, 1, 1,
0.4455131, -0.4723172, 2.111239, 1, 0, 0, 1, 1,
0.4508788, -0.3878354, 0.7769678, 1, 0, 0, 1, 1,
0.4554471, -1.148642, 2.699437, 1, 0, 0, 1, 1,
0.4570396, -2.163133, 4.512984, 1, 0, 0, 1, 1,
0.4585386, 1.697272, 0.1715108, 1, 0, 0, 1, 1,
0.4600368, -2.015528, 3.099223, 0, 0, 0, 1, 1,
0.4626657, 1.028759, 1.056685, 0, 0, 0, 1, 1,
0.4642949, 1.484945, -0.134098, 0, 0, 0, 1, 1,
0.4690702, 0.1612014, -0.230553, 0, 0, 0, 1, 1,
0.4726219, 0.9440815, -0.7468877, 0, 0, 0, 1, 1,
0.4741176, -1.106305, 1.441189, 0, 0, 0, 1, 1,
0.4746566, 0.3788559, 1.301674, 0, 0, 0, 1, 1,
0.4764181, 0.4755427, 1.246821, 1, 1, 1, 1, 1,
0.4771457, 1.583158, -0.2448072, 1, 1, 1, 1, 1,
0.484259, 0.2250907, 1.384385, 1, 1, 1, 1, 1,
0.488934, 2.823785, 1.308236, 1, 1, 1, 1, 1,
0.4941878, 0.2258162, 1.336107, 1, 1, 1, 1, 1,
0.4944536, -0.3050751, 2.839271, 1, 1, 1, 1, 1,
0.4968079, 0.5390012, 1.30373, 1, 1, 1, 1, 1,
0.4980282, -0.1708298, 0.7341546, 1, 1, 1, 1, 1,
0.4986787, -0.4807103, 1.913922, 1, 1, 1, 1, 1,
0.5064475, 0.472194, 2.301747, 1, 1, 1, 1, 1,
0.523285, -2.154199, 2.393638, 1, 1, 1, 1, 1,
0.5243728, 0.8840802, 2.085369, 1, 1, 1, 1, 1,
0.5282131, -2.048697, 3.510952, 1, 1, 1, 1, 1,
0.5302179, -0.03480554, 0.6936284, 1, 1, 1, 1, 1,
0.5309895, 0.627901, 0.6026473, 1, 1, 1, 1, 1,
0.5456485, 0.6429194, 0.9056481, 0, 0, 1, 1, 1,
0.5458596, 0.8056105, -0.8773906, 1, 0, 0, 1, 1,
0.5486378, -0.07977029, 2.672798, 1, 0, 0, 1, 1,
0.5517448, 1.59009, 0.5219422, 1, 0, 0, 1, 1,
0.5543007, -0.1277723, 2.633379, 1, 0, 0, 1, 1,
0.5554326, 0.5123617, 0.06526845, 1, 0, 0, 1, 1,
0.5554923, 1.954605, -1.435138, 0, 0, 0, 1, 1,
0.556327, -0.7418342, 1.845244, 0, 0, 0, 1, 1,
0.5567633, -0.03302471, 2.749711, 0, 0, 0, 1, 1,
0.56615, 0.2225181, 1.826853, 0, 0, 0, 1, 1,
0.5662107, -0.07028375, 1.12345, 0, 0, 0, 1, 1,
0.5725952, -0.7650292, 3.198249, 0, 0, 0, 1, 1,
0.5806424, 1.549959, -0.1664553, 0, 0, 0, 1, 1,
0.5811216, -0.2028287, 1.547857, 1, 1, 1, 1, 1,
0.5833559, 0.4308761, 0.2619762, 1, 1, 1, 1, 1,
0.5834489, -0.1791555, 1.85088, 1, 1, 1, 1, 1,
0.5920138, -0.03531241, 1.347389, 1, 1, 1, 1, 1,
0.5954464, -1.507009, 2.664751, 1, 1, 1, 1, 1,
0.59694, -0.6937658, 4.122265, 1, 1, 1, 1, 1,
0.6060576, 0.6321076, 2.499223, 1, 1, 1, 1, 1,
0.6084445, -0.1188874, 1.548656, 1, 1, 1, 1, 1,
0.608717, 0.5835938, -0.4900855, 1, 1, 1, 1, 1,
0.6088046, 2.500628, 0.8486404, 1, 1, 1, 1, 1,
0.6156305, 1.399307, -0.560154, 1, 1, 1, 1, 1,
0.6181117, -1.08312, 3.1527, 1, 1, 1, 1, 1,
0.6181235, -1.198127, 4.328181, 1, 1, 1, 1, 1,
0.6199883, 0.1878698, 1.467393, 1, 1, 1, 1, 1,
0.6277308, 0.1299106, 2.464698, 1, 1, 1, 1, 1,
0.6287863, 0.1760698, 1.868001, 0, 0, 1, 1, 1,
0.6354815, -0.4813062, 2.481445, 1, 0, 0, 1, 1,
0.6371478, -1.524208, 2.431381, 1, 0, 0, 1, 1,
0.6371927, -1.130359, 3.064328, 1, 0, 0, 1, 1,
0.6375077, -1.369022, 1.52798, 1, 0, 0, 1, 1,
0.6406698, -0.6115376, 1.082132, 1, 0, 0, 1, 1,
0.6425072, -0.7325187, 2.127279, 0, 0, 0, 1, 1,
0.6490597, -1.365138, 2.699695, 0, 0, 0, 1, 1,
0.6510872, 0.08562353, -0.08579466, 0, 0, 0, 1, 1,
0.6546909, -1.079985, 1.497813, 0, 0, 0, 1, 1,
0.6587707, 0.4207443, 1.155657, 0, 0, 0, 1, 1,
0.6591618, 0.9485147, 1.767231, 0, 0, 0, 1, 1,
0.6592159, -1.8825, 2.585007, 0, 0, 0, 1, 1,
0.6648932, 1.573846, -0.1997035, 1, 1, 1, 1, 1,
0.6663852, -1.73862, 0.3147072, 1, 1, 1, 1, 1,
0.6668999, 0.4862528, 0.5754533, 1, 1, 1, 1, 1,
0.6782786, -1.599449, 1.839826, 1, 1, 1, 1, 1,
0.6794903, -0.3443898, 1.175202, 1, 1, 1, 1, 1,
0.6841562, 1.447279, 1.000578, 1, 1, 1, 1, 1,
0.6859279, -2.60397, 0.151757, 1, 1, 1, 1, 1,
0.6929467, -2.034459, 3.360451, 1, 1, 1, 1, 1,
0.6934214, -0.003657381, 2.253662, 1, 1, 1, 1, 1,
0.6956109, 0.2096443, 1.675413, 1, 1, 1, 1, 1,
0.7031565, -0.8868731, 3.596478, 1, 1, 1, 1, 1,
0.7035963, -1.413464, 2.598288, 1, 1, 1, 1, 1,
0.7066412, 0.02534517, -0.7415329, 1, 1, 1, 1, 1,
0.7078053, -0.5080722, 3.284992, 1, 1, 1, 1, 1,
0.708277, -0.6819597, 3.087458, 1, 1, 1, 1, 1,
0.7084941, 0.02322495, 2.629588, 0, 0, 1, 1, 1,
0.7133353, -0.01861231, 3.548519, 1, 0, 0, 1, 1,
0.715808, 0.02045124, 1.556867, 1, 0, 0, 1, 1,
0.7171881, 0.01386981, 1.753336, 1, 0, 0, 1, 1,
0.719133, 1.21311, 0.04754569, 1, 0, 0, 1, 1,
0.7199692, -0.007937845, 0.5172713, 1, 0, 0, 1, 1,
0.7208346, 0.463579, 0.2792473, 0, 0, 0, 1, 1,
0.727466, 0.1275295, -0.1007034, 0, 0, 0, 1, 1,
0.7285715, -0.8568734, 1.006051, 0, 0, 0, 1, 1,
0.7302518, -0.0366061, 3.886869, 0, 0, 0, 1, 1,
0.7328562, 0.0457904, 0.3116698, 0, 0, 0, 1, 1,
0.7340252, 0.7982568, 0.6790508, 0, 0, 0, 1, 1,
0.7344532, -1.120137, 3.096142, 0, 0, 0, 1, 1,
0.7345441, 0.7184426, -1.13722, 1, 1, 1, 1, 1,
0.7367507, 1.199567, 1.071405, 1, 1, 1, 1, 1,
0.7418824, 0.01916105, 1.382451, 1, 1, 1, 1, 1,
0.7431942, 1.547213, -0.09451556, 1, 1, 1, 1, 1,
0.7438504, -1.497978, 1.485949, 1, 1, 1, 1, 1,
0.7481573, 0.1675758, 0.938014, 1, 1, 1, 1, 1,
0.7615477, -1.587249, 1.515084, 1, 1, 1, 1, 1,
0.7644959, 0.4183104, -0.6555688, 1, 1, 1, 1, 1,
0.7688955, 1.068058, 1.266897, 1, 1, 1, 1, 1,
0.7747555, -0.3858045, 0.9426599, 1, 1, 1, 1, 1,
0.7758765, 1.853615, 1.915856, 1, 1, 1, 1, 1,
0.7805106, -0.3007102, 1.256422, 1, 1, 1, 1, 1,
0.7810892, -0.9647633, 1.515054, 1, 1, 1, 1, 1,
0.7850454, 1.681212, 1.568531, 1, 1, 1, 1, 1,
0.7908025, 1.47423, 0.5550207, 1, 1, 1, 1, 1,
0.7951656, -1.85798, 2.87256, 0, 0, 1, 1, 1,
0.8075694, -1.909802, 2.956446, 1, 0, 0, 1, 1,
0.8165094, 1.46, -0.01301998, 1, 0, 0, 1, 1,
0.8311394, -0.4849812, 2.580242, 1, 0, 0, 1, 1,
0.831691, -0.9897697, -0.07954776, 1, 0, 0, 1, 1,
0.8328403, 0.2768044, 3.649763, 1, 0, 0, 1, 1,
0.8351068, 0.2183346, 2.102921, 0, 0, 0, 1, 1,
0.8463, 0.8882815, 1.042253, 0, 0, 0, 1, 1,
0.8492277, -0.7251738, 1.795273, 0, 0, 0, 1, 1,
0.8510131, 0.7578956, -1.400233, 0, 0, 0, 1, 1,
0.8511673, 1.047402, -2.34087, 0, 0, 0, 1, 1,
0.8530727, 0.5576612, 1.76638, 0, 0, 0, 1, 1,
0.8597139, 1.220448, 0.5606083, 0, 0, 0, 1, 1,
0.8655061, 2.484474, 2.038088, 1, 1, 1, 1, 1,
0.8688757, -0.4680026, 1.243281, 1, 1, 1, 1, 1,
0.8714371, -0.324938, 1.473377, 1, 1, 1, 1, 1,
0.8724044, 1.240098, 2.086988, 1, 1, 1, 1, 1,
0.8731547, -0.7054994, 1.712385, 1, 1, 1, 1, 1,
0.8754658, -1.753605, 1.461051, 1, 1, 1, 1, 1,
0.8796193, -0.1691327, 3.498678, 1, 1, 1, 1, 1,
0.87994, 0.004226629, 3.411721, 1, 1, 1, 1, 1,
0.8804612, -0.2787588, 1.054006, 1, 1, 1, 1, 1,
0.8827414, -0.2666974, 0.583248, 1, 1, 1, 1, 1,
0.8843203, -0.1963217, 2.960781, 1, 1, 1, 1, 1,
0.8875303, -0.9807183, 0.8255229, 1, 1, 1, 1, 1,
0.8893218, 2.041328, 0.4508563, 1, 1, 1, 1, 1,
0.8920586, 1.591318, -0.7639372, 1, 1, 1, 1, 1,
0.894043, -0.3808349, 3.263042, 1, 1, 1, 1, 1,
0.9046657, -0.6981639, 1.563063, 0, 0, 1, 1, 1,
0.9051453, 0.07763627, 0.07797683, 1, 0, 0, 1, 1,
0.9194198, 0.6656617, 0.5094851, 1, 0, 0, 1, 1,
0.9264711, -0.9508255, 1.772026, 1, 0, 0, 1, 1,
0.9296886, 1.657943, -0.7819856, 1, 0, 0, 1, 1,
0.9299024, 0.6933495, 1.588343, 1, 0, 0, 1, 1,
0.9417228, 0.3867362, -0.5746095, 0, 0, 0, 1, 1,
0.9472924, -0.1407925, 2.1589, 0, 0, 0, 1, 1,
0.9473279, -0.9303662, 3.0176, 0, 0, 0, 1, 1,
0.9629406, -0.0628473, 1.183734, 0, 0, 0, 1, 1,
0.964863, 0.1528199, 1.455817, 0, 0, 0, 1, 1,
0.9661459, 0.8134422, -1.495343, 0, 0, 0, 1, 1,
0.9710311, -1.183802, 4.248613, 0, 0, 0, 1, 1,
0.9717988, -0.2003663, 2.171682, 1, 1, 1, 1, 1,
0.9737512, -0.6653095, 2.093111, 1, 1, 1, 1, 1,
0.9772121, 0.7083981, 1.597193, 1, 1, 1, 1, 1,
0.9823031, -0.05984275, 0.3760015, 1, 1, 1, 1, 1,
0.983669, -1.208231, 3.846228, 1, 1, 1, 1, 1,
0.9844725, -0.2619801, 2.309159, 1, 1, 1, 1, 1,
0.98482, 0.6956401, 1.909566, 1, 1, 1, 1, 1,
0.986693, -1.000309, 2.578546, 1, 1, 1, 1, 1,
0.9868838, 0.4420805, 0.5487652, 1, 1, 1, 1, 1,
0.9905158, 0.1850868, 1.645824, 1, 1, 1, 1, 1,
1.002605, 0.1431109, 1.384514, 1, 1, 1, 1, 1,
1.004417, 1.22602, 0.06838168, 1, 1, 1, 1, 1,
1.005272, -1.017049, 3.139271, 1, 1, 1, 1, 1,
1.007184, -0.7131443, 2.925029, 1, 1, 1, 1, 1,
1.009079, -1.69716, 2.423976, 1, 1, 1, 1, 1,
1.015535, 1.007214, 0.9395314, 0, 0, 1, 1, 1,
1.025549, 1.056651, 3.47263, 1, 0, 0, 1, 1,
1.032875, 1.768919, 1.367169, 1, 0, 0, 1, 1,
1.036425, 0.4118532, 1.945522, 1, 0, 0, 1, 1,
1.037908, 1.933732, 0.760513, 1, 0, 0, 1, 1,
1.039647, -0.1482993, 1.98215, 1, 0, 0, 1, 1,
1.040952, 0.7245323, -0.06563711, 0, 0, 0, 1, 1,
1.05597, -0.643666, 1.477562, 0, 0, 0, 1, 1,
1.057255, -0.4406189, 2.440054, 0, 0, 0, 1, 1,
1.058555, 0.9102938, -0.2192618, 0, 0, 0, 1, 1,
1.060754, 0.6706227, 1.230156, 0, 0, 0, 1, 1,
1.066226, 0.1701719, 0.4004104, 0, 0, 0, 1, 1,
1.071447, -0.6484962, 2.397915, 0, 0, 0, 1, 1,
1.074108, 1.386974, 0.6578795, 1, 1, 1, 1, 1,
1.076929, 0.07885409, 1.65441, 1, 1, 1, 1, 1,
1.077132, 0.8060799, 0.2532116, 1, 1, 1, 1, 1,
1.079962, -0.8489565, 1.924005, 1, 1, 1, 1, 1,
1.080587, -1.249434, 1.799232, 1, 1, 1, 1, 1,
1.082406, 0.9629145, 0.8208495, 1, 1, 1, 1, 1,
1.088726, 1.574601, 0.6078963, 1, 1, 1, 1, 1,
1.10012, -0.7279788, 1.445313, 1, 1, 1, 1, 1,
1.100337, -0.8831986, 3.112656, 1, 1, 1, 1, 1,
1.101107, 1.029122, 0.9050543, 1, 1, 1, 1, 1,
1.105207, -0.9925153, 3.218158, 1, 1, 1, 1, 1,
1.115284, 0.1792654, 1.362942, 1, 1, 1, 1, 1,
1.115404, -0.1761917, 0.3793073, 1, 1, 1, 1, 1,
1.120397, -0.8486188, 0.2101666, 1, 1, 1, 1, 1,
1.121661, -0.1479994, 2.373205, 1, 1, 1, 1, 1,
1.123067, 0.499657, 1.743853, 0, 0, 1, 1, 1,
1.126679, 2.149342, 0.5123752, 1, 0, 0, 1, 1,
1.130951, -0.4301268, 3.385665, 1, 0, 0, 1, 1,
1.140439, -0.221257, 0.9557176, 1, 0, 0, 1, 1,
1.141347, 0.2116116, 1.731439, 1, 0, 0, 1, 1,
1.145725, 2.070031, 0.8172564, 1, 0, 0, 1, 1,
1.146262, -0.5974968, 0.6344958, 0, 0, 0, 1, 1,
1.146361, -2.297813, 3.251732, 0, 0, 0, 1, 1,
1.147864, -0.1799383, 3.250648, 0, 0, 0, 1, 1,
1.151836, 0.1325227, 1.846275, 0, 0, 0, 1, 1,
1.154778, 0.06865817, 3.309471, 0, 0, 0, 1, 1,
1.158034, -0.1307283, 0.9536722, 0, 0, 0, 1, 1,
1.1585, 0.4856509, 0.7391018, 0, 0, 0, 1, 1,
1.165264, 0.1334423, 1.00291, 1, 1, 1, 1, 1,
1.167432, -0.7789789, 1.711198, 1, 1, 1, 1, 1,
1.175326, -0.3347339, 1.711905, 1, 1, 1, 1, 1,
1.185073, 1.363498, 2.125182, 1, 1, 1, 1, 1,
1.195885, 1.683437, 0.4544345, 1, 1, 1, 1, 1,
1.200563, 0.7179025, 0.03966513, 1, 1, 1, 1, 1,
1.205542, 0.4051326, 3.3157, 1, 1, 1, 1, 1,
1.20685, -0.9073875, 2.702911, 1, 1, 1, 1, 1,
1.216075, -0.02149686, 2.338888, 1, 1, 1, 1, 1,
1.219615, -1.027754, 1.879127, 1, 1, 1, 1, 1,
1.225555, 1.094818, 0.3639776, 1, 1, 1, 1, 1,
1.234367, 0.1073962, 0.2010019, 1, 1, 1, 1, 1,
1.234743, -0.8854163, 2.600835, 1, 1, 1, 1, 1,
1.238431, -0.5377715, 0.9977573, 1, 1, 1, 1, 1,
1.240926, 0.3717695, 1.187281, 1, 1, 1, 1, 1,
1.241722, -0.4675834, 1.586788, 0, 0, 1, 1, 1,
1.24223, -0.1471656, 0.7785818, 1, 0, 0, 1, 1,
1.245266, 0.8142132, 0.610887, 1, 0, 0, 1, 1,
1.251748, 0.7661707, 0.1243838, 1, 0, 0, 1, 1,
1.252297, -1.563314, 1.666851, 1, 0, 0, 1, 1,
1.254886, 0.4172902, 1.525206, 1, 0, 0, 1, 1,
1.25588, 0.1189916, 1.677757, 0, 0, 0, 1, 1,
1.266469, -1.42121, 1.890561, 0, 0, 0, 1, 1,
1.26803, -0.7063664, 2.669358, 0, 0, 0, 1, 1,
1.26808, -0.8101749, 2.735179, 0, 0, 0, 1, 1,
1.270081, 1.571955, 0.4445761, 0, 0, 0, 1, 1,
1.275334, -0.8469415, 4.027783, 0, 0, 0, 1, 1,
1.275424, -1.534833, 2.53955, 0, 0, 0, 1, 1,
1.288567, -3.121011, 3.45373, 1, 1, 1, 1, 1,
1.294857, -0.1246857, 0.8081679, 1, 1, 1, 1, 1,
1.298692, 1.064074, 1.322683, 1, 1, 1, 1, 1,
1.301193, 0.2962852, 0.9836566, 1, 1, 1, 1, 1,
1.308456, -0.2577973, 1.677376, 1, 1, 1, 1, 1,
1.314863, -1.011926, 2.250517, 1, 1, 1, 1, 1,
1.316286, 0.9314989, 1.832416, 1, 1, 1, 1, 1,
1.341035, -0.05242896, 1.622419, 1, 1, 1, 1, 1,
1.341389, 0.3394603, 1.355515, 1, 1, 1, 1, 1,
1.341578, 0.5530962, 1.572154, 1, 1, 1, 1, 1,
1.346556, -0.6772515, 3.073921, 1, 1, 1, 1, 1,
1.347102, -0.4295766, 2.289812, 1, 1, 1, 1, 1,
1.35816, -0.1787709, 1.07956, 1, 1, 1, 1, 1,
1.378543, 0.355987, 1.525995, 1, 1, 1, 1, 1,
1.380325, 0.8646308, -0.64889, 1, 1, 1, 1, 1,
1.382779, 0.3047099, 1.321701, 0, 0, 1, 1, 1,
1.397928, -1.529537, 1.707724, 1, 0, 0, 1, 1,
1.4102, 0.7116152, 0.5393276, 1, 0, 0, 1, 1,
1.419914, 2.329903, -0.6449498, 1, 0, 0, 1, 1,
1.440131, 0.3081916, 1.603164, 1, 0, 0, 1, 1,
1.444152, 0.941157, 2.668144, 1, 0, 0, 1, 1,
1.444491, 0.07192877, 1.217747, 0, 0, 0, 1, 1,
1.45006, -1.439586, 3.227657, 0, 0, 0, 1, 1,
1.451002, 0.2448442, 0.6551309, 0, 0, 0, 1, 1,
1.452525, -0.4542641, 3.901232, 0, 0, 0, 1, 1,
1.453959, -0.368118, 2.281666, 0, 0, 0, 1, 1,
1.469795, -0.4474079, 0.6340533, 0, 0, 0, 1, 1,
1.475503, -0.4828185, 1.74987, 0, 0, 0, 1, 1,
1.490069, 0.1701043, 2.229515, 1, 1, 1, 1, 1,
1.499477, -0.5347041, 2.10512, 1, 1, 1, 1, 1,
1.514333, -0.8905432, 0.2540776, 1, 1, 1, 1, 1,
1.519335, 0.8816888, 0.8975829, 1, 1, 1, 1, 1,
1.529578, 0.7580224, 0.6752659, 1, 1, 1, 1, 1,
1.54796, 0.7922509, 0.1103075, 1, 1, 1, 1, 1,
1.575802, -1.128199, 3.180501, 1, 1, 1, 1, 1,
1.578563, -2.211898, 2.55231, 1, 1, 1, 1, 1,
1.587664, -1.015299, 2.231568, 1, 1, 1, 1, 1,
1.591515, 1.08209, 3.005955, 1, 1, 1, 1, 1,
1.60629, 2.57027, 1.208549, 1, 1, 1, 1, 1,
1.610445, 0.2663012, 2.251992, 1, 1, 1, 1, 1,
1.62503, -0.5438966, 2.696563, 1, 1, 1, 1, 1,
1.625902, -1.891317, 3.772374, 1, 1, 1, 1, 1,
1.630359, 0.118768, 0.04240759, 1, 1, 1, 1, 1,
1.631196, -1.884429, 1.212388, 0, 0, 1, 1, 1,
1.631485, -1.578171, 2.116668, 1, 0, 0, 1, 1,
1.632055, -0.1569103, 0.7000711, 1, 0, 0, 1, 1,
1.654483, 0.01916244, 1.981498, 1, 0, 0, 1, 1,
1.654772, 0.2776619, 2.672174, 1, 0, 0, 1, 1,
1.693956, -0.8540627, 3.94149, 1, 0, 0, 1, 1,
1.702384, -0.5582035, 1.49457, 0, 0, 0, 1, 1,
1.71815, -0.4258451, 0.8784824, 0, 0, 0, 1, 1,
1.721121, 0.8643346, 1.842907, 0, 0, 0, 1, 1,
1.740149, 0.6329173, -0.1654074, 0, 0, 0, 1, 1,
1.744992, 0.4582312, 3.099075, 0, 0, 0, 1, 1,
1.761546, 0.4778204, 1.675929, 0, 0, 0, 1, 1,
1.76202, -2.078484, 2.593143, 0, 0, 0, 1, 1,
1.778215, -1.270624, 2.358585, 1, 1, 1, 1, 1,
1.787876, 0.05659245, 1.707677, 1, 1, 1, 1, 1,
1.795634, 1.818853, -0.5522526, 1, 1, 1, 1, 1,
1.820881, -0.09360328, 1.485657, 1, 1, 1, 1, 1,
1.840526, -0.7053357, 3.61316, 1, 1, 1, 1, 1,
1.857224, 0.2957356, 0.358579, 1, 1, 1, 1, 1,
1.880024, 1.770953, -0.9915294, 1, 1, 1, 1, 1,
1.891153, 1.32371, -0.5948761, 1, 1, 1, 1, 1,
1.89557, 2.529588, -0.4819084, 1, 1, 1, 1, 1,
1.904628, 0.7732318, -0.006942812, 1, 1, 1, 1, 1,
1.960053, 0.08650769, 2.392336, 1, 1, 1, 1, 1,
1.962157, -0.644254, 1.230616, 1, 1, 1, 1, 1,
1.974299, -0.706525, 1.550211, 1, 1, 1, 1, 1,
1.994833, 1.639217, 0.678971, 1, 1, 1, 1, 1,
2.038588, -1.266364, 0.8725243, 1, 1, 1, 1, 1,
2.040898, 0.8660842, 0.953727, 0, 0, 1, 1, 1,
2.048323, -0.5801723, 1.59356, 1, 0, 0, 1, 1,
2.051881, -0.732798, 1.154777, 1, 0, 0, 1, 1,
2.0563, -0.5459073, 1.457356, 1, 0, 0, 1, 1,
2.077808, 1.314791, 0.2604245, 1, 0, 0, 1, 1,
2.078603, -0.1496844, 2.262647, 1, 0, 0, 1, 1,
2.07914, -0.6467855, 0.867511, 0, 0, 0, 1, 1,
2.10936, 1.471549, 1.638038, 0, 0, 0, 1, 1,
2.154138, 0.8791395, 1.685485, 0, 0, 0, 1, 1,
2.255144, -0.2068307, -0.1479624, 0, 0, 0, 1, 1,
2.255896, -0.2741886, 1.009409, 0, 0, 0, 1, 1,
2.277717, -1.429655, 1.434486, 0, 0, 0, 1, 1,
2.28664, 0.2243754, 0.6788414, 0, 0, 0, 1, 1,
2.299956, 0.7080427, 2.124562, 1, 1, 1, 1, 1,
2.368471, -0.8441086, 2.425431, 1, 1, 1, 1, 1,
2.665213, 0.1945251, 1.793728, 1, 1, 1, 1, 1,
2.683068, 0.6580915, 0.4649323, 1, 1, 1, 1, 1,
2.722003, -2.438086, 0.9762234, 1, 1, 1, 1, 1,
2.9482, 0.6919571, 0.05601788, 1, 1, 1, 1, 1,
3.600288, -2.219227, 2.697579, 1, 1, 1, 1, 1
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
var radius = 9.625811;
var distance = 33.81025;
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
mvMatrix.translate( -0.4389499, -0.268261, 0.3230648 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.81025);
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