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
-2.779228, 0.4934477, -2.88102, 1, 0, 0, 1,
-2.553736, 0.5961446, -3.099288, 1, 0.007843138, 0, 1,
-2.551885, 1.447268, -2.860649, 1, 0.01176471, 0, 1,
-2.549263, -0.3757625, -2.332115, 1, 0.01960784, 0, 1,
-2.546207, -0.2610955, 0.3774949, 1, 0.02352941, 0, 1,
-2.527729, 0.7750567, -0.5649361, 1, 0.03137255, 0, 1,
-2.501956, -0.9840397, -1.008563, 1, 0.03529412, 0, 1,
-2.485419, 1.794203, -0.5399526, 1, 0.04313726, 0, 1,
-2.398668, -1.854706, -2.707171, 1, 0.04705882, 0, 1,
-2.387369, 0.1762396, -0.2361677, 1, 0.05490196, 0, 1,
-2.27858, -0.624195, -1.189011, 1, 0.05882353, 0, 1,
-2.267244, 0.3430244, -2.95401, 1, 0.06666667, 0, 1,
-2.25843, -0.3722089, -1.895903, 1, 0.07058824, 0, 1,
-2.178188, 0.4313546, 0.8746198, 1, 0.07843138, 0, 1,
-2.158358, -0.1246887, -0.7368039, 1, 0.08235294, 0, 1,
-2.148316, 2.010545, -2.659646, 1, 0.09019608, 0, 1,
-2.14346, -0.9786999, 0.3324364, 1, 0.09411765, 0, 1,
-2.136437, -1.089066, -1.559095, 1, 0.1019608, 0, 1,
-2.102217, -0.5597275, -3.468633, 1, 0.1098039, 0, 1,
-2.095, -0.5345123, -1.403329, 1, 0.1137255, 0, 1,
-2.072649, 1.338461, -1.266457, 1, 0.1215686, 0, 1,
-2.049454, 0.04561997, -1.538518, 1, 0.1254902, 0, 1,
-2.044995, 1.166643, -1.254366, 1, 0.1333333, 0, 1,
-2.02914, -1.734919, -2.076401, 1, 0.1372549, 0, 1,
-2.01896, -0.8808993, -0.9185636, 1, 0.145098, 0, 1,
-1.980816, -0.4224834, -2.419992, 1, 0.1490196, 0, 1,
-1.942461, 0.213175, -0.8618953, 1, 0.1568628, 0, 1,
-1.929254, 0.1188425, -1.770101, 1, 0.1607843, 0, 1,
-1.917871, 1.007671, -0.4482174, 1, 0.1686275, 0, 1,
-1.879279, -0.4218812, -1.830588, 1, 0.172549, 0, 1,
-1.862259, 0.511929, -0.1187298, 1, 0.1803922, 0, 1,
-1.855118, 0.8646618, -0.7564347, 1, 0.1843137, 0, 1,
-1.846737, -1.132304, -2.482094, 1, 0.1921569, 0, 1,
-1.842014, 1.481153, -0.9845789, 1, 0.1960784, 0, 1,
-1.837516, 0.3188324, -0.7657027, 1, 0.2039216, 0, 1,
-1.765946, 0.6040698, -1.081099, 1, 0.2117647, 0, 1,
-1.746956, -0.3773325, -2.515785, 1, 0.2156863, 0, 1,
-1.746826, 1.036071, -1.160029, 1, 0.2235294, 0, 1,
-1.731856, -1.388283, -1.877645, 1, 0.227451, 0, 1,
-1.720328, 0.1030297, -0.760175, 1, 0.2352941, 0, 1,
-1.716387, -0.03816586, -0.1868293, 1, 0.2392157, 0, 1,
-1.690125, 0.9591913, -1.131735, 1, 0.2470588, 0, 1,
-1.687306, -0.08120635, -0.7750553, 1, 0.2509804, 0, 1,
-1.686527, 0.5858711, -0.6689507, 1, 0.2588235, 0, 1,
-1.681613, -0.483713, -3.369342, 1, 0.2627451, 0, 1,
-1.665466, -0.6770005, 0.4462813, 1, 0.2705882, 0, 1,
-1.6535, -0.4589987, 0.04864233, 1, 0.2745098, 0, 1,
-1.65172, 0.9892245, -1.073194, 1, 0.282353, 0, 1,
-1.65164, 0.7919423, 2.187097, 1, 0.2862745, 0, 1,
-1.642986, -0.4168922, -1.917327, 1, 0.2941177, 0, 1,
-1.627748, -1.845263, -3.067614, 1, 0.3019608, 0, 1,
-1.614212, -0.6014068, -3.077517, 1, 0.3058824, 0, 1,
-1.606969, 1.452377, 0.3022035, 1, 0.3137255, 0, 1,
-1.606073, -0.5801949, -0.6823435, 1, 0.3176471, 0, 1,
-1.574421, 0.5308103, -1.35345, 1, 0.3254902, 0, 1,
-1.572603, 0.1290571, -1.267022, 1, 0.3294118, 0, 1,
-1.556603, -0.4735199, -1.957119, 1, 0.3372549, 0, 1,
-1.512584, 0.2249869, -1.020666, 1, 0.3411765, 0, 1,
-1.50205, 0.006499207, -1.716814, 1, 0.3490196, 0, 1,
-1.498738, 0.05245143, -0.8268024, 1, 0.3529412, 0, 1,
-1.491126, -0.1281984, -0.5236237, 1, 0.3607843, 0, 1,
-1.482745, -0.5871309, -0.8334178, 1, 0.3647059, 0, 1,
-1.47199, 0.9677627, -3.361519, 1, 0.372549, 0, 1,
-1.468458, 0.2058069, -2.512444, 1, 0.3764706, 0, 1,
-1.466769, 0.4600485, -0.5193524, 1, 0.3843137, 0, 1,
-1.463682, 0.6055616, -1.32629, 1, 0.3882353, 0, 1,
-1.458666, 1.271312, -0.571123, 1, 0.3960784, 0, 1,
-1.456129, 0.8258251, -1.990049, 1, 0.4039216, 0, 1,
-1.455514, -2.149108, -3.002793, 1, 0.4078431, 0, 1,
-1.454906, 0.5306497, 0.2459436, 1, 0.4156863, 0, 1,
-1.449742, 0.9017217, -0.304817, 1, 0.4196078, 0, 1,
-1.44755, -0.5856791, -3.077232, 1, 0.427451, 0, 1,
-1.432159, 0.00629657, -1.244173, 1, 0.4313726, 0, 1,
-1.431524, -3.14343, -1.87147, 1, 0.4392157, 0, 1,
-1.429877, 1.280915, -2.020048, 1, 0.4431373, 0, 1,
-1.410959, 0.1294744, -1.89238, 1, 0.4509804, 0, 1,
-1.40801, 0.4804604, -2.204859, 1, 0.454902, 0, 1,
-1.407521, 1.328392, -1.064201, 1, 0.4627451, 0, 1,
-1.405587, -0.2601748, -3.852437, 1, 0.4666667, 0, 1,
-1.394997, -0.2034057, -2.097735, 1, 0.4745098, 0, 1,
-1.390439, -0.08132327, -3.825518, 1, 0.4784314, 0, 1,
-1.380646, -0.7698004, -0.8508473, 1, 0.4862745, 0, 1,
-1.372007, 0.9436637, -1.179345, 1, 0.4901961, 0, 1,
-1.360502, 1.278385, 0.3217323, 1, 0.4980392, 0, 1,
-1.353399, 0.842425, -2.349858, 1, 0.5058824, 0, 1,
-1.351965, -1.464493, -2.837951, 1, 0.509804, 0, 1,
-1.348564, -1.129289, -1.574053, 1, 0.5176471, 0, 1,
-1.342687, 0.4013374, -0.2596534, 1, 0.5215687, 0, 1,
-1.341176, 0.1305425, -0.5050938, 1, 0.5294118, 0, 1,
-1.327546, 1.489447, -3.050933, 1, 0.5333334, 0, 1,
-1.318645, 0.5140682, 0.07609688, 1, 0.5411765, 0, 1,
-1.318105, 0.1773074, -0.7809302, 1, 0.5450981, 0, 1,
-1.316982, -1.697556, -0.6518319, 1, 0.5529412, 0, 1,
-1.310134, -0.2492833, -1.077115, 1, 0.5568628, 0, 1,
-1.309452, 0.821075, -0.6828302, 1, 0.5647059, 0, 1,
-1.309036, -0.0562974, -0.5450665, 1, 0.5686275, 0, 1,
-1.307962, -0.003669025, -1.044053, 1, 0.5764706, 0, 1,
-1.303151, 0.1427432, -2.541274, 1, 0.5803922, 0, 1,
-1.301208, 0.255547, -1.156717, 1, 0.5882353, 0, 1,
-1.29825, 1.582623, -0.3076743, 1, 0.5921569, 0, 1,
-1.295881, 1.283586, -0.5764868, 1, 0.6, 0, 1,
-1.285421, -0.7973444, -2.966128, 1, 0.6078432, 0, 1,
-1.285197, 0.3767318, -2.036284, 1, 0.6117647, 0, 1,
-1.272769, -0.07276311, -1.315124, 1, 0.6196079, 0, 1,
-1.272413, -0.7479554, -0.6324263, 1, 0.6235294, 0, 1,
-1.260638, 0.8215688, 0.4578219, 1, 0.6313726, 0, 1,
-1.259814, -0.01792857, -3.353153, 1, 0.6352941, 0, 1,
-1.256182, -1.605017, -0.7294946, 1, 0.6431373, 0, 1,
-1.240909, -0.4173351, -0.722872, 1, 0.6470588, 0, 1,
-1.239981, -0.4469841, -0.8101606, 1, 0.654902, 0, 1,
-1.218366, -0.3246394, 0.1106465, 1, 0.6588235, 0, 1,
-1.218343, 0.08673558, -1.667882, 1, 0.6666667, 0, 1,
-1.215628, -1.105036, -1.431664, 1, 0.6705883, 0, 1,
-1.205262, 0.6040787, -0.379559, 1, 0.6784314, 0, 1,
-1.204379, 1.037937, -0.2093458, 1, 0.682353, 0, 1,
-1.200193, -0.08894304, -1.393459, 1, 0.6901961, 0, 1,
-1.197762, -1.485164, -1.760649, 1, 0.6941177, 0, 1,
-1.194407, 1.222541, -0.571121, 1, 0.7019608, 0, 1,
-1.177508, 1.332577, -3.344885, 1, 0.7098039, 0, 1,
-1.176767, -1.966741, -1.356807, 1, 0.7137255, 0, 1,
-1.174675, 0.4671132, -2.458254, 1, 0.7215686, 0, 1,
-1.167843, 0.8938636, -1.911186, 1, 0.7254902, 0, 1,
-1.164227, 0.2690796, -2.68238, 1, 0.7333333, 0, 1,
-1.163793, 1.878139, -0.532129, 1, 0.7372549, 0, 1,
-1.139358, -0.6657544, -2.952626, 1, 0.7450981, 0, 1,
-1.13808, -1.634938, -4.104784, 1, 0.7490196, 0, 1,
-1.135231, -0.3269923, -1.668457, 1, 0.7568628, 0, 1,
-1.133457, 0.5106147, -1.58816, 1, 0.7607843, 0, 1,
-1.130166, 1.39615, -2.274267, 1, 0.7686275, 0, 1,
-1.128955, -0.1002046, -1.392142, 1, 0.772549, 0, 1,
-1.124422, -0.7983027, -2.575872, 1, 0.7803922, 0, 1,
-1.121406, -0.6409947, -1.164082, 1, 0.7843137, 0, 1,
-1.11555, 0.7067399, -2.110285, 1, 0.7921569, 0, 1,
-1.111898, -1.263247, -1.978095, 1, 0.7960784, 0, 1,
-1.111871, -1.30812, -1.741302, 1, 0.8039216, 0, 1,
-1.107146, 1.012346, -0.6206552, 1, 0.8117647, 0, 1,
-1.103497, 1.29145, 0.5777198, 1, 0.8156863, 0, 1,
-1.102925, -1.041985, -2.826538, 1, 0.8235294, 0, 1,
-1.08502, 0.8305886, 0.1294571, 1, 0.827451, 0, 1,
-1.082353, 1.11272, 0.7836352, 1, 0.8352941, 0, 1,
-1.078968, 0.4053929, -2.799756, 1, 0.8392157, 0, 1,
-1.077558, 1.809685, 0.1406699, 1, 0.8470588, 0, 1,
-1.077539, -0.6165313, -2.593135, 1, 0.8509804, 0, 1,
-1.072205, 0.1865428, -0.3384299, 1, 0.8588235, 0, 1,
-1.07059, 0.007193462, -2.602886, 1, 0.8627451, 0, 1,
-1.070467, -0.5461239, -1.801109, 1, 0.8705882, 0, 1,
-1.064809, -1.624113, -2.924153, 1, 0.8745098, 0, 1,
-1.060238, 0.6690112, -2.239857, 1, 0.8823529, 0, 1,
-1.055599, 0.645529, 0.686325, 1, 0.8862745, 0, 1,
-1.053836, -0.4243883, -2.936219, 1, 0.8941177, 0, 1,
-1.043236, -1.062598, -3.437957, 1, 0.8980392, 0, 1,
-1.034434, 0.6931368, -0.9967996, 1, 0.9058824, 0, 1,
-1.025569, 0.359158, -0.1386359, 1, 0.9137255, 0, 1,
-1.023071, 0.2493797, -2.049432, 1, 0.9176471, 0, 1,
-1.023034, -0.2401659, -2.667086, 1, 0.9254902, 0, 1,
-1.008711, -1.646597, -1.924753, 1, 0.9294118, 0, 1,
-1.006644, -0.2634144, -0.9730203, 1, 0.9372549, 0, 1,
-1.004782, 0.1423697, -0.008769972, 1, 0.9411765, 0, 1,
-0.9933679, -0.07182637, -2.917748, 1, 0.9490196, 0, 1,
-0.9863799, 1.555381, -1.307759, 1, 0.9529412, 0, 1,
-0.9745157, 1.927581, -0.4823844, 1, 0.9607843, 0, 1,
-0.9731855, 0.5997257, 0.2416878, 1, 0.9647059, 0, 1,
-0.9645576, -1.089212, -1.407734, 1, 0.972549, 0, 1,
-0.9638265, -0.2154358, -1.968647, 1, 0.9764706, 0, 1,
-0.9634225, -0.9409341, -1.101897, 1, 0.9843137, 0, 1,
-0.9628033, -0.3963277, -1.861814, 1, 0.9882353, 0, 1,
-0.9618821, -1.086253, -2.085544, 1, 0.9960784, 0, 1,
-0.9618423, 1.991426, -1.38997, 0.9960784, 1, 0, 1,
-0.9602975, 0.9644452, -0.1988124, 0.9921569, 1, 0, 1,
-0.9583148, 0.1367273, -1.569467, 0.9843137, 1, 0, 1,
-0.9559651, -0.859847, -0.5167949, 0.9803922, 1, 0, 1,
-0.955619, 0.3957577, -0.8817989, 0.972549, 1, 0, 1,
-0.9540339, -2.234336, -2.540302, 0.9686275, 1, 0, 1,
-0.953608, 0.235305, -0.3499124, 0.9607843, 1, 0, 1,
-0.9383602, 0.7824965, -0.5746583, 0.9568627, 1, 0, 1,
-0.934212, -1.983513, -1.379589, 0.9490196, 1, 0, 1,
-0.9317293, 0.542732, -1.38458, 0.945098, 1, 0, 1,
-0.9306473, 0.791366, 0.04559897, 0.9372549, 1, 0, 1,
-0.9301541, 0.6829402, -1.50255, 0.9333333, 1, 0, 1,
-0.9170705, 1.28333, -1.4918, 0.9254902, 1, 0, 1,
-0.9129217, 0.3200081, 0.8368666, 0.9215686, 1, 0, 1,
-0.9089338, 0.3885621, -0.3100238, 0.9137255, 1, 0, 1,
-0.906101, 0.9041485, 1.134372, 0.9098039, 1, 0, 1,
-0.9031795, -0.8458235, -1.970697, 0.9019608, 1, 0, 1,
-0.9011981, 1.479845, 0.2031939, 0.8941177, 1, 0, 1,
-0.8863665, -0.8185226, -2.990221, 0.8901961, 1, 0, 1,
-0.8861567, -0.9320508, 0.4691359, 0.8823529, 1, 0, 1,
-0.8817481, 0.4054897, -1.744729, 0.8784314, 1, 0, 1,
-0.8786191, 0.9617103, -1.442274, 0.8705882, 1, 0, 1,
-0.8720353, -0.2321877, -1.071672, 0.8666667, 1, 0, 1,
-0.8704597, -1.461732, -3.085632, 0.8588235, 1, 0, 1,
-0.8688998, 0.7921162, -2.08005, 0.854902, 1, 0, 1,
-0.8684191, -0.5023964, -2.514952, 0.8470588, 1, 0, 1,
-0.8677838, 1.030716, -1.9604, 0.8431373, 1, 0, 1,
-0.8673144, -0.8165756, -1.681089, 0.8352941, 1, 0, 1,
-0.8668548, 0.4722674, -2.112465, 0.8313726, 1, 0, 1,
-0.8647004, 0.3619302, 0.6208917, 0.8235294, 1, 0, 1,
-0.8553598, -1.44864, -1.458593, 0.8196079, 1, 0, 1,
-0.8537207, 0.2981449, -1.36871, 0.8117647, 1, 0, 1,
-0.8517427, -1.273694, -2.339638, 0.8078431, 1, 0, 1,
-0.8488426, -2.27305, -3.282993, 0.8, 1, 0, 1,
-0.8455437, -0.3817893, -3.00435, 0.7921569, 1, 0, 1,
-0.83457, -0.02258541, -0.1705772, 0.7882353, 1, 0, 1,
-0.8330051, 0.522095, -1.080504, 0.7803922, 1, 0, 1,
-0.8314012, 0.3259345, -2.733326, 0.7764706, 1, 0, 1,
-0.8252001, 0.3947355, -1.548335, 0.7686275, 1, 0, 1,
-0.8217838, 0.9310393, -2.753207, 0.7647059, 1, 0, 1,
-0.8202871, -1.171165, -4.494105, 0.7568628, 1, 0, 1,
-0.8157654, 0.487343, 0.0745231, 0.7529412, 1, 0, 1,
-0.8128146, 1.639229, -1.159184, 0.7450981, 1, 0, 1,
-0.8110039, -0.173013, -1.871633, 0.7411765, 1, 0, 1,
-0.8043805, -0.2114693, -0.9617166, 0.7333333, 1, 0, 1,
-0.8023767, -1.712787, -4.479029, 0.7294118, 1, 0, 1,
-0.7974707, 0.9119311, -0.2055677, 0.7215686, 1, 0, 1,
-0.7954226, -0.1763754, -3.571352, 0.7176471, 1, 0, 1,
-0.7927392, -1.614382, -1.983166, 0.7098039, 1, 0, 1,
-0.7824765, -0.3129458, -1.82511, 0.7058824, 1, 0, 1,
-0.7820632, -0.7689039, -2.04217, 0.6980392, 1, 0, 1,
-0.7805287, 1.063658, 0.2185958, 0.6901961, 1, 0, 1,
-0.7790136, 1.04041, 0.3106072, 0.6862745, 1, 0, 1,
-0.777754, -0.3132918, -2.628486, 0.6784314, 1, 0, 1,
-0.7754239, -1.434205, -4.104687, 0.6745098, 1, 0, 1,
-0.7727804, -0.711629, -2.828146, 0.6666667, 1, 0, 1,
-0.770772, -0.03583203, -1.734463, 0.6627451, 1, 0, 1,
-0.7655305, 1.261593, -0.5352307, 0.654902, 1, 0, 1,
-0.7649013, 0.3554506, -3.428488, 0.6509804, 1, 0, 1,
-0.763346, -1.125181, -2.886552, 0.6431373, 1, 0, 1,
-0.7578709, 0.5525072, -2.63179, 0.6392157, 1, 0, 1,
-0.7573085, -0.3743891, -3.746434, 0.6313726, 1, 0, 1,
-0.7502398, -0.9570959, -2.484839, 0.627451, 1, 0, 1,
-0.7494696, -0.2462361, -1.200667, 0.6196079, 1, 0, 1,
-0.749052, -0.07787717, -0.4610583, 0.6156863, 1, 0, 1,
-0.7474195, -0.1697902, -1.981816, 0.6078432, 1, 0, 1,
-0.7388286, -0.1803252, -1.809497, 0.6039216, 1, 0, 1,
-0.7373101, -1.122638, -2.103019, 0.5960785, 1, 0, 1,
-0.7371822, 0.4498079, -2.472537, 0.5882353, 1, 0, 1,
-0.7371049, -0.01911924, -1.773081, 0.5843138, 1, 0, 1,
-0.7367113, 0.8350748, 0.1070192, 0.5764706, 1, 0, 1,
-0.7349045, 0.9936432, -0.6762052, 0.572549, 1, 0, 1,
-0.7321681, -3.066402, -2.858459, 0.5647059, 1, 0, 1,
-0.7279407, -0.5513266, -0.7684489, 0.5607843, 1, 0, 1,
-0.72192, 0.02942816, -1.647757, 0.5529412, 1, 0, 1,
-0.7194818, -0.9661491, -1.971914, 0.5490196, 1, 0, 1,
-0.7169076, 0.7170669, -0.02855321, 0.5411765, 1, 0, 1,
-0.7133736, 1.121404, 0.3100137, 0.5372549, 1, 0, 1,
-0.7128665, -0.1350501, -2.982753, 0.5294118, 1, 0, 1,
-0.7119849, -0.1483675, -1.65172, 0.5254902, 1, 0, 1,
-0.7060558, 0.7434533, -1.626032, 0.5176471, 1, 0, 1,
-0.7059051, 0.811534, -1.275933, 0.5137255, 1, 0, 1,
-0.7003098, 0.4564381, -2.424813, 0.5058824, 1, 0, 1,
-0.6976865, 1.052005, -0.2856792, 0.5019608, 1, 0, 1,
-0.6933931, -0.8290447, -3.287743, 0.4941176, 1, 0, 1,
-0.6918629, 1.779142, -0.4749809, 0.4862745, 1, 0, 1,
-0.6900169, -1.400922, -3.722699, 0.4823529, 1, 0, 1,
-0.6899053, -1.141699, -0.8142631, 0.4745098, 1, 0, 1,
-0.6889738, -0.8291883, -1.10779, 0.4705882, 1, 0, 1,
-0.6870702, 2.092802, -1.100411, 0.4627451, 1, 0, 1,
-0.6862879, -1.121579, -2.975098, 0.4588235, 1, 0, 1,
-0.6824848, 0.002774512, -1.272261, 0.4509804, 1, 0, 1,
-0.6682757, 1.147052, -2.176135, 0.4470588, 1, 0, 1,
-0.666213, 0.1185532, -0.6915737, 0.4392157, 1, 0, 1,
-0.665338, -0.1560712, -1.047593, 0.4352941, 1, 0, 1,
-0.6621386, 0.3116473, -0.1363802, 0.427451, 1, 0, 1,
-0.6617888, 0.3434345, -2.020243, 0.4235294, 1, 0, 1,
-0.6609515, 0.8233718, -0.3139343, 0.4156863, 1, 0, 1,
-0.659151, -0.3902879, -1.73747, 0.4117647, 1, 0, 1,
-0.6559224, -3.903999, -2.651248, 0.4039216, 1, 0, 1,
-0.6545279, 1.415483, 0.6056292, 0.3960784, 1, 0, 1,
-0.6513867, 0.4507726, 0.2914793, 0.3921569, 1, 0, 1,
-0.6468034, -1.323163, -3.416675, 0.3843137, 1, 0, 1,
-0.6427568, -1.906588, -3.55574, 0.3803922, 1, 0, 1,
-0.6414077, 1.076648, -1.24186, 0.372549, 1, 0, 1,
-0.6340629, -0.1818056, -3.009898, 0.3686275, 1, 0, 1,
-0.6285257, 1.539661, 2.568896, 0.3607843, 1, 0, 1,
-0.6254472, 0.1597314, 0.2619197, 0.3568628, 1, 0, 1,
-0.6252731, 1.64676, 1.159808, 0.3490196, 1, 0, 1,
-0.6242759, 1.3016, -0.7211407, 0.345098, 1, 0, 1,
-0.6169557, 0.7639301, -0.4438348, 0.3372549, 1, 0, 1,
-0.6160051, 0.09239502, -3.494033, 0.3333333, 1, 0, 1,
-0.6137858, 0.2577875, -0.8159725, 0.3254902, 1, 0, 1,
-0.6100765, 0.6193314, -0.6182518, 0.3215686, 1, 0, 1,
-0.594315, 1.361578, 0.596943, 0.3137255, 1, 0, 1,
-0.5921313, 1.446194, -1.549005, 0.3098039, 1, 0, 1,
-0.5913829, 0.2411868, -2.67847, 0.3019608, 1, 0, 1,
-0.588878, 0.317738, 0.1871085, 0.2941177, 1, 0, 1,
-0.5870059, 0.1354562, -2.18134, 0.2901961, 1, 0, 1,
-0.5808829, 0.1877944, -2.394793, 0.282353, 1, 0, 1,
-0.5795639, 0.4893058, -0.8457565, 0.2784314, 1, 0, 1,
-0.5789365, 1.714075, 0.1921585, 0.2705882, 1, 0, 1,
-0.5761692, -0.8502178, -0.614459, 0.2666667, 1, 0, 1,
-0.5755332, -0.6719401, -2.722284, 0.2588235, 1, 0, 1,
-0.57165, -0.6718938, -2.561559, 0.254902, 1, 0, 1,
-0.5694162, -0.6781639, -2.626603, 0.2470588, 1, 0, 1,
-0.5676119, 0.5695086, -2.600589, 0.2431373, 1, 0, 1,
-0.5662295, 0.5539384, 0.9340445, 0.2352941, 1, 0, 1,
-0.5597245, 0.516813, -0.5431961, 0.2313726, 1, 0, 1,
-0.5552509, 0.9451368, -2.828435, 0.2235294, 1, 0, 1,
-0.5533979, 1.416445, 0.2543798, 0.2196078, 1, 0, 1,
-0.5525013, -1.126153, -2.274475, 0.2117647, 1, 0, 1,
-0.551461, -0.6205636, -2.903402, 0.2078431, 1, 0, 1,
-0.5510083, -0.4172452, -2.0036, 0.2, 1, 0, 1,
-0.5464834, 0.738827, -1.474682, 0.1921569, 1, 0, 1,
-0.5383728, -0.07782445, -1.337853, 0.1882353, 1, 0, 1,
-0.537078, -0.1100614, -1.794238, 0.1803922, 1, 0, 1,
-0.5353867, -0.4038218, -2.440394, 0.1764706, 1, 0, 1,
-0.5345483, -0.4764196, -2.024134, 0.1686275, 1, 0, 1,
-0.5289021, -1.544074, -3.407766, 0.1647059, 1, 0, 1,
-0.5257864, 0.4088095, 0.8953567, 0.1568628, 1, 0, 1,
-0.5242726, -0.1922525, -0.8959039, 0.1529412, 1, 0, 1,
-0.5170032, 1.35016, -0.5701414, 0.145098, 1, 0, 1,
-0.5152737, 0.5534866, -0.02326163, 0.1411765, 1, 0, 1,
-0.5129279, -1.447777, -3.05631, 0.1333333, 1, 0, 1,
-0.5106203, -0.2179357, -2.480668, 0.1294118, 1, 0, 1,
-0.5102988, -0.9632872, -2.15122, 0.1215686, 1, 0, 1,
-0.5094953, 0.2232544, -0.9159501, 0.1176471, 1, 0, 1,
-0.5073513, 0.8456016, 0.13485, 0.1098039, 1, 0, 1,
-0.5042586, -0.1409428, -0.7988433, 0.1058824, 1, 0, 1,
-0.4944384, -1.733194, -1.984847, 0.09803922, 1, 0, 1,
-0.493107, 1.730597, -1.996015, 0.09019608, 1, 0, 1,
-0.4923382, 1.516115, 0.7077532, 0.08627451, 1, 0, 1,
-0.4905306, -0.3302735, -2.636828, 0.07843138, 1, 0, 1,
-0.4887639, 0.81236, -0.1673331, 0.07450981, 1, 0, 1,
-0.4858053, 0.9945109, -2.407935, 0.06666667, 1, 0, 1,
-0.4837048, -0.6103112, -3.616261, 0.0627451, 1, 0, 1,
-0.4789602, 1.432585, 1.834819, 0.05490196, 1, 0, 1,
-0.4775407, -0.7160431, -3.485385, 0.05098039, 1, 0, 1,
-0.4758656, 0.7275881, -0.6739732, 0.04313726, 1, 0, 1,
-0.4754314, 0.8918134, -0.01187786, 0.03921569, 1, 0, 1,
-0.4702736, -0.2801975, -2.472155, 0.03137255, 1, 0, 1,
-0.4659705, -1.00141, -4.172964, 0.02745098, 1, 0, 1,
-0.465185, 0.0974015, -1.356362, 0.01960784, 1, 0, 1,
-0.4649796, 0.4653812, 0.1703418, 0.01568628, 1, 0, 1,
-0.4623111, 0.2759193, -0.566614, 0.007843138, 1, 0, 1,
-0.4603455, -1.039615, -3.244909, 0.003921569, 1, 0, 1,
-0.4599037, -1.917924, -3.599925, 0, 1, 0.003921569, 1,
-0.4483852, -0.06899883, -2.008571, 0, 1, 0.01176471, 1,
-0.4465442, 0.3759828, -0.6555321, 0, 1, 0.01568628, 1,
-0.4463946, 0.07791393, 0.9197809, 0, 1, 0.02352941, 1,
-0.4452528, -0.4362081, -2.00707, 0, 1, 0.02745098, 1,
-0.4414901, 2.271637, -0.6781762, 0, 1, 0.03529412, 1,
-0.440434, -0.7295502, -2.607771, 0, 1, 0.03921569, 1,
-0.440355, 0.04102249, -2.920622, 0, 1, 0.04705882, 1,
-0.4397891, 0.7356148, -0.1353128, 0, 1, 0.05098039, 1,
-0.4380956, 0.2024131, -1.651577, 0, 1, 0.05882353, 1,
-0.4367423, 0.719597, -2.23618, 0, 1, 0.0627451, 1,
-0.4353203, 0.3379112, -1.794165, 0, 1, 0.07058824, 1,
-0.4339664, 0.9761683, 0.2559482, 0, 1, 0.07450981, 1,
-0.432277, 1.987014, 2.667477, 0, 1, 0.08235294, 1,
-0.4319423, -0.4309658, -3.224798, 0, 1, 0.08627451, 1,
-0.4316734, -0.648405, -2.297669, 0, 1, 0.09411765, 1,
-0.4308828, 1.749962, -1.873245, 0, 1, 0.1019608, 1,
-0.4287836, -0.499728, -2.003132, 0, 1, 0.1058824, 1,
-0.4284595, 0.7451924, 1.668865, 0, 1, 0.1137255, 1,
-0.4260767, 0.5841354, -1.448592, 0, 1, 0.1176471, 1,
-0.4251789, -0.120217, -2.617135, 0, 1, 0.1254902, 1,
-0.4166698, 0.5544522, -1.593542, 0, 1, 0.1294118, 1,
-0.4144693, -0.9107233, -1.801155, 0, 1, 0.1372549, 1,
-0.4130616, 0.7187725, -1.51541, 0, 1, 0.1411765, 1,
-0.4090017, -0.08761697, -2.684814, 0, 1, 0.1490196, 1,
-0.407591, 0.338828, -0.7559115, 0, 1, 0.1529412, 1,
-0.4057436, 0.6671743, -0.1246935, 0, 1, 0.1607843, 1,
-0.4014923, -0.3494814, -1.827025, 0, 1, 0.1647059, 1,
-0.3861549, -1.029718, -3.66698, 0, 1, 0.172549, 1,
-0.385878, 1.153336, -1.815313, 0, 1, 0.1764706, 1,
-0.3783446, -0.947084, -3.739563, 0, 1, 0.1843137, 1,
-0.3749965, -0.9985334, -4.536049, 0, 1, 0.1882353, 1,
-0.3739142, -0.05317064, -1.988575, 0, 1, 0.1960784, 1,
-0.3730413, 0.9153546, 1.720491, 0, 1, 0.2039216, 1,
-0.364434, -0.02202448, -2.710238, 0, 1, 0.2078431, 1,
-0.364256, 0.6249903, -1.979233, 0, 1, 0.2156863, 1,
-0.3631637, 0.2011991, -1.420163, 0, 1, 0.2196078, 1,
-0.3621234, 0.1374256, -3.195637, 0, 1, 0.227451, 1,
-0.3618979, 0.1511313, -1.295455, 0, 1, 0.2313726, 1,
-0.3617961, -0.4399544, -1.354437, 0, 1, 0.2392157, 1,
-0.3588954, -1.711355, -2.973342, 0, 1, 0.2431373, 1,
-0.3583477, -0.007261751, -2.671538, 0, 1, 0.2509804, 1,
-0.354035, -0.1260516, -1.774944, 0, 1, 0.254902, 1,
-0.3505026, -1.393242, -2.648796, 0, 1, 0.2627451, 1,
-0.3491871, 1.378705, -0.3833692, 0, 1, 0.2666667, 1,
-0.3464524, 1.09451, -1.529701, 0, 1, 0.2745098, 1,
-0.3457808, 1.178161, -0.9866953, 0, 1, 0.2784314, 1,
-0.3451, 2.409036, 2.662771, 0, 1, 0.2862745, 1,
-0.3410608, 0.008355249, -1.396687, 0, 1, 0.2901961, 1,
-0.3397581, -1.163357, -3.386945, 0, 1, 0.2980392, 1,
-0.3366812, 1.161086, 0.6199004, 0, 1, 0.3058824, 1,
-0.331109, -0.6601719, -2.582385, 0, 1, 0.3098039, 1,
-0.3281752, 0.7736982, 0.6164351, 0, 1, 0.3176471, 1,
-0.3277427, 0.7001652, -0.1469015, 0, 1, 0.3215686, 1,
-0.3254922, -0.0006909962, -0.8408075, 0, 1, 0.3294118, 1,
-0.3239274, 1.27019, 0.9431856, 0, 1, 0.3333333, 1,
-0.3214086, -1.877901, -2.863167, 0, 1, 0.3411765, 1,
-0.3193642, -1.322021, -2.772131, 0, 1, 0.345098, 1,
-0.3084805, 1.410266, -1.03425, 0, 1, 0.3529412, 1,
-0.3083985, -1.919941, -1.353159, 0, 1, 0.3568628, 1,
-0.308079, 1.703388, 0.3720376, 0, 1, 0.3647059, 1,
-0.3010834, 0.6456286, -3.031576, 0, 1, 0.3686275, 1,
-0.2980467, -0.3573681, -2.57484, 0, 1, 0.3764706, 1,
-0.2978385, 1.103135, -0.5941786, 0, 1, 0.3803922, 1,
-0.2954886, -0.4146326, -2.78002, 0, 1, 0.3882353, 1,
-0.2939121, -0.540658, -2.845497, 0, 1, 0.3921569, 1,
-0.291675, -0.2706701, -1.826434, 0, 1, 0.4, 1,
-0.2909029, 0.8087267, -1.752287, 0, 1, 0.4078431, 1,
-0.290757, -0.7964021, -2.940767, 0, 1, 0.4117647, 1,
-0.2896304, 0.3458529, -0.7268651, 0, 1, 0.4196078, 1,
-0.2878212, 1.604147, -1.222279, 0, 1, 0.4235294, 1,
-0.2861701, 0.4753762, 0.8034401, 0, 1, 0.4313726, 1,
-0.2853135, -0.707449, -3.179896, 0, 1, 0.4352941, 1,
-0.2831881, -0.08018968, -0.8753078, 0, 1, 0.4431373, 1,
-0.2800652, -0.3791491, -1.078408, 0, 1, 0.4470588, 1,
-0.276485, 0.8114306, -0.7772743, 0, 1, 0.454902, 1,
-0.2719768, -0.03067753, -1.211285, 0, 1, 0.4588235, 1,
-0.2700461, 0.7297673, -1.738015, 0, 1, 0.4666667, 1,
-0.2699458, 0.1196722, -1.809391, 0, 1, 0.4705882, 1,
-0.2694574, -0.1378538, -3.541341, 0, 1, 0.4784314, 1,
-0.267976, -1.023449, -3.638017, 0, 1, 0.4823529, 1,
-0.266235, -0.1654399, -0.6978998, 0, 1, 0.4901961, 1,
-0.2635534, 1.070329, -0.2385177, 0, 1, 0.4941176, 1,
-0.2594626, 0.7701564, -0.2710449, 0, 1, 0.5019608, 1,
-0.2584594, 0.3957058, -1.274989, 0, 1, 0.509804, 1,
-0.2548648, 0.03558014, -0.9115013, 0, 1, 0.5137255, 1,
-0.2548213, -1.652333, -4.613798, 0, 1, 0.5215687, 1,
-0.2500511, 1.363345, 0.9622416, 0, 1, 0.5254902, 1,
-0.2495517, -1.05817, -2.061423, 0, 1, 0.5333334, 1,
-0.2483548, 0.2800509, 0.2566529, 0, 1, 0.5372549, 1,
-0.2461331, 0.472801, 0.50499, 0, 1, 0.5450981, 1,
-0.2440777, 0.4438655, 0.7053531, 0, 1, 0.5490196, 1,
-0.2439454, 1.163446, -0.1786289, 0, 1, 0.5568628, 1,
-0.242014, 0.3913799, -1.366057, 0, 1, 0.5607843, 1,
-0.2412589, 0.5009631, -0.6565446, 0, 1, 0.5686275, 1,
-0.2362614, 0.4297279, 0.8315709, 0, 1, 0.572549, 1,
-0.2360053, 0.163443, -0.3299851, 0, 1, 0.5803922, 1,
-0.2337539, 0.1215198, -2.337514, 0, 1, 0.5843138, 1,
-0.2325475, 0.4051436, 0.7229893, 0, 1, 0.5921569, 1,
-0.232435, -1.592558, -4.450359, 0, 1, 0.5960785, 1,
-0.228846, 0.01245191, -1.412653, 0, 1, 0.6039216, 1,
-0.2226424, 0.7994118, 1.10242, 0, 1, 0.6117647, 1,
-0.2171708, 1.118848, 0.6994633, 0, 1, 0.6156863, 1,
-0.2165943, 1.501496, 0.6232662, 0, 1, 0.6235294, 1,
-0.2102791, -0.6931629, -1.692135, 0, 1, 0.627451, 1,
-0.2067261, 1.268131, -0.2258056, 0, 1, 0.6352941, 1,
-0.2028785, 0.03295418, -0.9847539, 0, 1, 0.6392157, 1,
-0.1935719, -1.338442, -3.778245, 0, 1, 0.6470588, 1,
-0.1918653, 2.526114, -0.4329084, 0, 1, 0.6509804, 1,
-0.1903086, 0.09575876, -0.6742032, 0, 1, 0.6588235, 1,
-0.1901509, 0.2294981, -1.508329, 0, 1, 0.6627451, 1,
-0.1871673, 0.4478462, -0.833465, 0, 1, 0.6705883, 1,
-0.1861764, 0.6007609, -1.260193, 0, 1, 0.6745098, 1,
-0.1825185, 0.4069394, -0.6461153, 0, 1, 0.682353, 1,
-0.178987, -0.7472529, -4.912529, 0, 1, 0.6862745, 1,
-0.1781358, 0.849305, -0.5162128, 0, 1, 0.6941177, 1,
-0.1731841, 0.3223697, -0.1521975, 0, 1, 0.7019608, 1,
-0.1664977, -0.529758, -3.04205, 0, 1, 0.7058824, 1,
-0.1638414, -0.4060005, -3.577651, 0, 1, 0.7137255, 1,
-0.1633413, 0.41531, 1.462319, 0, 1, 0.7176471, 1,
-0.1623871, -0.4994744, -2.697581, 0, 1, 0.7254902, 1,
-0.1611035, 1.125704, 0.4208969, 0, 1, 0.7294118, 1,
-0.1605913, 0.07805355, -0.1098165, 0, 1, 0.7372549, 1,
-0.1600216, 0.910179, 1.182512, 0, 1, 0.7411765, 1,
-0.1586976, -2.003344, -2.903841, 0, 1, 0.7490196, 1,
-0.1578365, 0.2287835, 0.2361543, 0, 1, 0.7529412, 1,
-0.1552529, 0.005816735, -0.1158575, 0, 1, 0.7607843, 1,
-0.1533772, 0.5854313, 0.3359246, 0, 1, 0.7647059, 1,
-0.1481476, 0.8897618, 1.017939, 0, 1, 0.772549, 1,
-0.1438291, 0.490761, -1.142311, 0, 1, 0.7764706, 1,
-0.1400985, 1.239285, 0.508311, 0, 1, 0.7843137, 1,
-0.1390488, -0.3696235, -2.359859, 0, 1, 0.7882353, 1,
-0.1379375, -0.6476837, -2.010989, 0, 1, 0.7960784, 1,
-0.1293556, -0.4074115, -3.958356, 0, 1, 0.8039216, 1,
-0.1292946, 0.5091879, -0.4107727, 0, 1, 0.8078431, 1,
-0.127999, -0.4336928, -2.540098, 0, 1, 0.8156863, 1,
-0.1226534, -2.289069, -3.718886, 0, 1, 0.8196079, 1,
-0.1215694, 0.2496048, 0.248697, 0, 1, 0.827451, 1,
-0.1208239, 1.17997, -0.6499339, 0, 1, 0.8313726, 1,
-0.107524, 0.1863218, 2.181565, 0, 1, 0.8392157, 1,
-0.1070978, 0.5077095, -1.524283, 0, 1, 0.8431373, 1,
-0.1065233, 0.9724032, -2.284811, 0, 1, 0.8509804, 1,
-0.09868228, 1.882579, 0.1202069, 0, 1, 0.854902, 1,
-0.09798016, -2.090371, -2.773489, 0, 1, 0.8627451, 1,
-0.09617818, -0.4703626, -3.79223, 0, 1, 0.8666667, 1,
-0.09548683, 0.9493323, -0.3823748, 0, 1, 0.8745098, 1,
-0.09435178, -0.5274981, -1.889862, 0, 1, 0.8784314, 1,
-0.09400296, -0.7722743, -3.623306, 0, 1, 0.8862745, 1,
-0.09287975, -0.4423401, -5.323336, 0, 1, 0.8901961, 1,
-0.08973313, 1.024984, -0.7941366, 0, 1, 0.8980392, 1,
-0.08643405, 2.362012, -1.173263, 0, 1, 0.9058824, 1,
-0.08637543, 0.401476, -1.304619, 0, 1, 0.9098039, 1,
-0.08534317, -1.130465, -3.010664, 0, 1, 0.9176471, 1,
-0.08195484, -0.05017967, -1.87848, 0, 1, 0.9215686, 1,
-0.08126056, 0.9033952, -0.8771895, 0, 1, 0.9294118, 1,
-0.07931244, 0.5744647, -1.638562, 0, 1, 0.9333333, 1,
-0.07877858, 0.2700725, 0.05939701, 0, 1, 0.9411765, 1,
-0.07476217, 2.670373, -0.1845062, 0, 1, 0.945098, 1,
-0.07063753, -0.2165346, -1.184408, 0, 1, 0.9529412, 1,
-0.06886008, 1.677945, 1.246668, 0, 1, 0.9568627, 1,
-0.06366494, -0.8114199, -3.556301, 0, 1, 0.9647059, 1,
-0.06210783, 0.8072745, -1.161763, 0, 1, 0.9686275, 1,
-0.06132049, -1.461681, -2.936166, 0, 1, 0.9764706, 1,
-0.05395838, 0.2122134, -0.8614464, 0, 1, 0.9803922, 1,
-0.04842766, 0.726536, -0.5601378, 0, 1, 0.9882353, 1,
-0.04834527, -0.9985713, -2.98862, 0, 1, 0.9921569, 1,
-0.04788005, 1.13675, 1.167466, 0, 1, 1, 1,
-0.04756328, 0.4256078, 0.2000576, 0, 0.9921569, 1, 1,
-0.04540476, -1.689419, -2.567549, 0, 0.9882353, 1, 1,
-0.04384346, -0.9325184, -1.679681, 0, 0.9803922, 1, 1,
-0.03362159, 0.7570341, 0.8871661, 0, 0.9764706, 1, 1,
-0.02979449, 0.9817166, -0.9981877, 0, 0.9686275, 1, 1,
-0.02539928, -1.022109, -3.866902, 0, 0.9647059, 1, 1,
-0.02405788, 0.1884264, -0.9381839, 0, 0.9568627, 1, 1,
-0.02369796, -0.06423597, -3.495004, 0, 0.9529412, 1, 1,
-0.02126383, -0.5325935, -1.396377, 0, 0.945098, 1, 1,
-0.01724147, 1.022393, -1.09282, 0, 0.9411765, 1, 1,
-0.01515405, -1.087775, -1.245236, 0, 0.9333333, 1, 1,
-0.01131916, -0.5127343, -3.647345, 0, 0.9294118, 1, 1,
-0.01037611, 0.4586618, -1.234651, 0, 0.9215686, 1, 1,
-0.01001038, 1.568213, 1.015657, 0, 0.9176471, 1, 1,
-0.009730356, 0.2410093, 1.441092, 0, 0.9098039, 1, 1,
-0.009626237, -0.9830009, -3.367055, 0, 0.9058824, 1, 1,
0.0004727351, -1.264477, 1.930199, 0, 0.8980392, 1, 1,
0.004104682, -0.4636927, 2.279099, 0, 0.8901961, 1, 1,
0.004338683, 0.367278, -1.378281, 0, 0.8862745, 1, 1,
0.01420739, 0.8944071, -1.144969, 0, 0.8784314, 1, 1,
0.01975274, 0.3247974, 0.8385845, 0, 0.8745098, 1, 1,
0.02164535, 1.29496, -1.123043, 0, 0.8666667, 1, 1,
0.02282829, 1.180526, -0.5672113, 0, 0.8627451, 1, 1,
0.02424186, 1.187298, 0.2033478, 0, 0.854902, 1, 1,
0.02554695, 0.6511831, 0.2401411, 0, 0.8509804, 1, 1,
0.02748362, -0.07020076, 1.726188, 0, 0.8431373, 1, 1,
0.02779564, 0.04268497, -0.2040221, 0, 0.8392157, 1, 1,
0.03287929, -1.619249, 2.779492, 0, 0.8313726, 1, 1,
0.03954008, 0.03827741, -0.9522211, 0, 0.827451, 1, 1,
0.04007214, 0.3455986, 0.9173006, 0, 0.8196079, 1, 1,
0.04460294, -0.4765729, 0.3629727, 0, 0.8156863, 1, 1,
0.04832909, 1.362519, 0.3513726, 0, 0.8078431, 1, 1,
0.05010606, -1.598011, 1.169984, 0, 0.8039216, 1, 1,
0.05532891, -0.9745427, 3.012056, 0, 0.7960784, 1, 1,
0.05561834, 1.258432, 0.8730232, 0, 0.7882353, 1, 1,
0.05615772, -0.9908699, 4.089485, 0, 0.7843137, 1, 1,
0.05622353, -0.2431252, 3.797837, 0, 0.7764706, 1, 1,
0.05840996, 0.3663274, -1.599984, 0, 0.772549, 1, 1,
0.06035255, -0.6695489, 1.840563, 0, 0.7647059, 1, 1,
0.06128175, -0.2295529, 3.404282, 0, 0.7607843, 1, 1,
0.06506613, 0.5837203, -0.4237262, 0, 0.7529412, 1, 1,
0.06584521, 0.2436522, 0.1602411, 0, 0.7490196, 1, 1,
0.06595501, 1.623405, -0.867988, 0, 0.7411765, 1, 1,
0.07407758, 0.3425527, -0.1955159, 0, 0.7372549, 1, 1,
0.07668205, 1.001722, -0.6470443, 0, 0.7294118, 1, 1,
0.0773069, -0.1039229, 2.327347, 0, 0.7254902, 1, 1,
0.08129566, 0.2082775, -0.5030593, 0, 0.7176471, 1, 1,
0.08143234, -0.9714534, 1.741032, 0, 0.7137255, 1, 1,
0.08375777, 1.52731, 0.66766, 0, 0.7058824, 1, 1,
0.0838889, 1.724458, -0.6573123, 0, 0.6980392, 1, 1,
0.0875636, -0.5790221, 3.931269, 0, 0.6941177, 1, 1,
0.08940747, 0.0397199, 2.328579, 0, 0.6862745, 1, 1,
0.09088252, -0.324526, 3.367976, 0, 0.682353, 1, 1,
0.09229871, -0.1408211, 0.9869972, 0, 0.6745098, 1, 1,
0.09430961, -2.455, 3.525572, 0, 0.6705883, 1, 1,
0.09460204, 0.4665402, 1.233247, 0, 0.6627451, 1, 1,
0.0965796, -0.2712453, 1.930473, 0, 0.6588235, 1, 1,
0.09823219, -0.5089123, 1.501775, 0, 0.6509804, 1, 1,
0.09856269, -2.553461, 3.833672, 0, 0.6470588, 1, 1,
0.110955, -0.9606008, 2.213829, 0, 0.6392157, 1, 1,
0.1119198, 0.01769535, 0.7206938, 0, 0.6352941, 1, 1,
0.1183631, 0.6625292, 0.3570889, 0, 0.627451, 1, 1,
0.1212752, 0.2875502, 0.5001774, 0, 0.6235294, 1, 1,
0.121358, 0.7213092, -0.09950494, 0, 0.6156863, 1, 1,
0.1221729, 1.460723, -1.763184, 0, 0.6117647, 1, 1,
0.1224903, 1.358842, 1.508366, 0, 0.6039216, 1, 1,
0.1243902, -0.7951738, 4.246346, 0, 0.5960785, 1, 1,
0.1249227, -0.2612894, 2.547242, 0, 0.5921569, 1, 1,
0.1251419, 0.2623753, -0.4265961, 0, 0.5843138, 1, 1,
0.125508, 0.5269811, 0.03701918, 0, 0.5803922, 1, 1,
0.1288873, 1.062746, -0.4990854, 0, 0.572549, 1, 1,
0.1334808, -0.3210247, 4.40854, 0, 0.5686275, 1, 1,
0.1351028, -0.3809883, 2.997354, 0, 0.5607843, 1, 1,
0.1361369, 1.351027, 0.6835748, 0, 0.5568628, 1, 1,
0.1419221, 0.7066458, 0.2301441, 0, 0.5490196, 1, 1,
0.1434882, 0.3099258, -0.6411348, 0, 0.5450981, 1, 1,
0.143687, -0.3192265, 1.854764, 0, 0.5372549, 1, 1,
0.1452424, -0.6099581, 1.819938, 0, 0.5333334, 1, 1,
0.1468207, -0.169706, 2.850234, 0, 0.5254902, 1, 1,
0.1468928, 0.5189435, 1.437994, 0, 0.5215687, 1, 1,
0.1473192, -0.3288125, 1.31934, 0, 0.5137255, 1, 1,
0.1591848, -0.282101, 1.889655, 0, 0.509804, 1, 1,
0.160123, 0.2223504, 0.5962667, 0, 0.5019608, 1, 1,
0.1621699, 1.117133, 1.097197, 0, 0.4941176, 1, 1,
0.1625579, -0.1169773, 1.439369, 0, 0.4901961, 1, 1,
0.1646092, -1.601611, 2.266449, 0, 0.4823529, 1, 1,
0.1659348, 2.200105, 1.046681, 0, 0.4784314, 1, 1,
0.1770401, -0.3459957, 2.9885, 0, 0.4705882, 1, 1,
0.1806533, 0.8447978, 0.6308594, 0, 0.4666667, 1, 1,
0.1835214, -0.6031697, 3.945326, 0, 0.4588235, 1, 1,
0.1958191, -0.9971315, 4.22077, 0, 0.454902, 1, 1,
0.1961871, 0.7435334, 0.3884822, 0, 0.4470588, 1, 1,
0.196892, 0.1145723, -0.903134, 0, 0.4431373, 1, 1,
0.198454, -1.744898, 2.633176, 0, 0.4352941, 1, 1,
0.2020261, -0.8623198, 2.812542, 0, 0.4313726, 1, 1,
0.2114748, 0.09774104, 1.703755, 0, 0.4235294, 1, 1,
0.2141465, -0.4968239, 2.399489, 0, 0.4196078, 1, 1,
0.2209229, -0.06544859, 1.349253, 0, 0.4117647, 1, 1,
0.222518, -0.3783581, 2.585323, 0, 0.4078431, 1, 1,
0.2327502, 1.448789, 1.225324, 0, 0.4, 1, 1,
0.2333437, -1.760297, 3.534519, 0, 0.3921569, 1, 1,
0.238166, -1.372696, 3.523348, 0, 0.3882353, 1, 1,
0.2421061, 0.1994144, 0.5432138, 0, 0.3803922, 1, 1,
0.2446878, -2.176615, 3.222015, 0, 0.3764706, 1, 1,
0.2476446, 0.6237811, -1.139337, 0, 0.3686275, 1, 1,
0.2496826, 0.4101805, 0.2282983, 0, 0.3647059, 1, 1,
0.2507415, 0.02849692, 1.069165, 0, 0.3568628, 1, 1,
0.2519477, 2.145807, 0.3904712, 0, 0.3529412, 1, 1,
0.2608547, 0.4935803, 0.7809631, 0, 0.345098, 1, 1,
0.261168, 0.246115, 1.363685, 0, 0.3411765, 1, 1,
0.2614908, -0.3147753, 2.894097, 0, 0.3333333, 1, 1,
0.2640564, 0.7056888, -0.7097224, 0, 0.3294118, 1, 1,
0.2707714, 0.4735776, -0.8258541, 0, 0.3215686, 1, 1,
0.2745099, -1.081785, 2.065456, 0, 0.3176471, 1, 1,
0.2758796, -0.555333, 3.527248, 0, 0.3098039, 1, 1,
0.2780846, 0.9217121, -0.6076273, 0, 0.3058824, 1, 1,
0.2800271, 0.09096997, 1.318723, 0, 0.2980392, 1, 1,
0.2903193, -0.1557937, 2.147694, 0, 0.2901961, 1, 1,
0.2905779, 1.274839, 0.1012157, 0, 0.2862745, 1, 1,
0.2910868, 1.113547, -0.4197539, 0, 0.2784314, 1, 1,
0.2991168, 2.248622, -0.1646972, 0, 0.2745098, 1, 1,
0.3010088, -1.26268, 1.737463, 0, 0.2666667, 1, 1,
0.3023797, -0.6047923, 3.357095, 0, 0.2627451, 1, 1,
0.3055858, 0.006998992, 1.985744, 0, 0.254902, 1, 1,
0.3142626, 2.374088, 0.1267971, 0, 0.2509804, 1, 1,
0.3172302, -0.3949447, 2.533217, 0, 0.2431373, 1, 1,
0.3215831, -0.4585558, 1.792662, 0, 0.2392157, 1, 1,
0.3232572, -0.7300957, 2.37993, 0, 0.2313726, 1, 1,
0.3243956, -1.327073, 1.737696, 0, 0.227451, 1, 1,
0.3296691, 0.3193173, -1.01282, 0, 0.2196078, 1, 1,
0.330739, 1.391551, 1.504344, 0, 0.2156863, 1, 1,
0.3329678, -1.81595, 1.322011, 0, 0.2078431, 1, 1,
0.341126, 0.8200268, 1.203145, 0, 0.2039216, 1, 1,
0.3487531, -0.711951, 2.937288, 0, 0.1960784, 1, 1,
0.3490986, 0.09221669, 1.504099, 0, 0.1882353, 1, 1,
0.3516166, 1.299425, 1.615691, 0, 0.1843137, 1, 1,
0.353095, 0.6714416, 0.3018844, 0, 0.1764706, 1, 1,
0.3532442, -0.4211417, 1.01949, 0, 0.172549, 1, 1,
0.3605531, 0.2140087, 2.58739, 0, 0.1647059, 1, 1,
0.3630577, -0.2392221, 0.5915672, 0, 0.1607843, 1, 1,
0.3669537, 0.4475416, -1.513358, 0, 0.1529412, 1, 1,
0.3694329, 0.8358334, 1.06624, 0, 0.1490196, 1, 1,
0.3712231, 0.2974391, 0.01887429, 0, 0.1411765, 1, 1,
0.3761232, 0.9514502, 0.7836869, 0, 0.1372549, 1, 1,
0.378523, -0.2802492, 1.183257, 0, 0.1294118, 1, 1,
0.3803404, 0.03232467, 0.7964921, 0, 0.1254902, 1, 1,
0.3804939, -0.8118033, 1.104499, 0, 0.1176471, 1, 1,
0.3841847, 0.6516807, -0.6366176, 0, 0.1137255, 1, 1,
0.3918923, -1.194062, 4.325956, 0, 0.1058824, 1, 1,
0.3934521, 0.9449566, -0.08228063, 0, 0.09803922, 1, 1,
0.3965729, -0.7003594, 2.683162, 0, 0.09411765, 1, 1,
0.3977123, 0.1313462, 0.6212746, 0, 0.08627451, 1, 1,
0.4005759, -0.8590815, 4.223643, 0, 0.08235294, 1, 1,
0.4011096, -2.404119, 2.410031, 0, 0.07450981, 1, 1,
0.4016444, -0.4905339, 2.602945, 0, 0.07058824, 1, 1,
0.4018612, -1.099826, 2.636117, 0, 0.0627451, 1, 1,
0.403938, -0.08942677, 0.9989674, 0, 0.05882353, 1, 1,
0.4055032, -1.202772, 3.740702, 0, 0.05098039, 1, 1,
0.4074927, -0.2996765, 2.245182, 0, 0.04705882, 1, 1,
0.4092915, -0.1286838, -0.3592953, 0, 0.03921569, 1, 1,
0.4115089, 0.4417328, 2.456616, 0, 0.03529412, 1, 1,
0.4120447, 0.3813731, 2.09515, 0, 0.02745098, 1, 1,
0.4146113, -0.306574, 1.198172, 0, 0.02352941, 1, 1,
0.4153754, 1.798303, -1.305316, 0, 0.01568628, 1, 1,
0.4177537, 1.957124, 0.4678865, 0, 0.01176471, 1, 1,
0.4188202, -0.09585731, 3.052023, 0, 0.003921569, 1, 1,
0.4192645, -1.37026, 2.165588, 0.003921569, 0, 1, 1,
0.4239163, 0.7197447, -0.5823212, 0.007843138, 0, 1, 1,
0.4285191, -0.9293636, 1.532648, 0.01568628, 0, 1, 1,
0.4291273, 0.5515771, 1.17688, 0.01960784, 0, 1, 1,
0.4373628, -1.088629, 2.73166, 0.02745098, 0, 1, 1,
0.4391896, 0.2316294, 1.231435, 0.03137255, 0, 1, 1,
0.4418568, -1.020187, 2.45588, 0.03921569, 0, 1, 1,
0.4439501, 1.003915, 0.05744878, 0.04313726, 0, 1, 1,
0.4447529, 0.9971142, 0.6099908, 0.05098039, 0, 1, 1,
0.4451978, -1.038146, 3.600927, 0.05490196, 0, 1, 1,
0.447359, 0.8933523, -1.634229, 0.0627451, 0, 1, 1,
0.450912, 0.3329548, 1.364897, 0.06666667, 0, 1, 1,
0.4518511, 0.9861552, -0.181782, 0.07450981, 0, 1, 1,
0.4523375, -0.6124658, 2.086758, 0.07843138, 0, 1, 1,
0.4550919, 0.1943098, -0.5076756, 0.08627451, 0, 1, 1,
0.4551391, 0.5627779, -0.5494773, 0.09019608, 0, 1, 1,
0.4555809, 1.157915, 0.1351794, 0.09803922, 0, 1, 1,
0.4560998, 2.988127, -0.8266189, 0.1058824, 0, 1, 1,
0.4600336, -0.1382742, 2.378264, 0.1098039, 0, 1, 1,
0.4638463, -0.274745, 3.786303, 0.1176471, 0, 1, 1,
0.4727601, 0.8008874, 2.864107, 0.1215686, 0, 1, 1,
0.4753788, -0.4922158, 2.375939, 0.1294118, 0, 1, 1,
0.476256, -0.1412687, 1.204883, 0.1333333, 0, 1, 1,
0.4790844, -0.01764402, 3.315269, 0.1411765, 0, 1, 1,
0.4820336, -0.03054873, 3.120338, 0.145098, 0, 1, 1,
0.4828965, -0.139009, 0.9867628, 0.1529412, 0, 1, 1,
0.4883111, 1.21913, -1.169658, 0.1568628, 0, 1, 1,
0.4924396, -1.295192, 3.382901, 0.1647059, 0, 1, 1,
0.4969617, -1.428178, 0.5901819, 0.1686275, 0, 1, 1,
0.4982314, -0.5298052, 1.199641, 0.1764706, 0, 1, 1,
0.4985153, -0.1662526, 2.657006, 0.1803922, 0, 1, 1,
0.5078229, -0.1637104, 1.860927, 0.1882353, 0, 1, 1,
0.5097198, 1.419174, 0.313129, 0.1921569, 0, 1, 1,
0.511843, -0.4520228, 1.559792, 0.2, 0, 1, 1,
0.5140368, 0.501586, 1.965796, 0.2078431, 0, 1, 1,
0.514754, -0.3661718, 1.636912, 0.2117647, 0, 1, 1,
0.5223615, 0.04611893, 1.738478, 0.2196078, 0, 1, 1,
0.5249373, -0.906381, 3.959829, 0.2235294, 0, 1, 1,
0.5256776, -0.1395573, -0.1437119, 0.2313726, 0, 1, 1,
0.5292302, -0.1289235, 0.2900648, 0.2352941, 0, 1, 1,
0.5307912, 0.08219593, 0.2249542, 0.2431373, 0, 1, 1,
0.5323609, 0.8332453, 0.6769923, 0.2470588, 0, 1, 1,
0.5367141, 2.52605, 1.47493, 0.254902, 0, 1, 1,
0.5441487, 1.516729, -0.2629295, 0.2588235, 0, 1, 1,
0.5472071, -1.041342, 1.734624, 0.2666667, 0, 1, 1,
0.5486968, -0.4688213, 2.329644, 0.2705882, 0, 1, 1,
0.5581167, -1.939639, 3.794053, 0.2784314, 0, 1, 1,
0.5636644, -0.8640841, 1.779709, 0.282353, 0, 1, 1,
0.5665004, 0.315297, 1.24747, 0.2901961, 0, 1, 1,
0.567359, -1.2049, 0.210445, 0.2941177, 0, 1, 1,
0.5725387, -0.1564701, 1.967974, 0.3019608, 0, 1, 1,
0.5746187, -2.332794, 1.418456, 0.3098039, 0, 1, 1,
0.5768443, -0.8907943, 2.390705, 0.3137255, 0, 1, 1,
0.5772104, 1.081218, 0.237539, 0.3215686, 0, 1, 1,
0.5776729, -0.242907, 2.529892, 0.3254902, 0, 1, 1,
0.5794905, 0.4395567, 1.503892, 0.3333333, 0, 1, 1,
0.581825, 1.748491, -0.1366085, 0.3372549, 0, 1, 1,
0.5824387, -0.07822282, 2.60021, 0.345098, 0, 1, 1,
0.5856202, 0.6862162, -1.669156, 0.3490196, 0, 1, 1,
0.5884674, -1.209235, 1.542855, 0.3568628, 0, 1, 1,
0.593318, -0.8618554, 1.62845, 0.3607843, 0, 1, 1,
0.5948415, 0.4882455, 0.6825746, 0.3686275, 0, 1, 1,
0.5968133, 0.9115637, -0.855397, 0.372549, 0, 1, 1,
0.6010444, 0.4280221, 0.7854956, 0.3803922, 0, 1, 1,
0.6021109, 2.792255, 1.083168, 0.3843137, 0, 1, 1,
0.6023219, 0.2390238, 4.625022, 0.3921569, 0, 1, 1,
0.6037425, -0.5028165, 2.422217, 0.3960784, 0, 1, 1,
0.6116651, -0.0005376267, 0.2946943, 0.4039216, 0, 1, 1,
0.6143485, 1.655209, 1.129727, 0.4117647, 0, 1, 1,
0.6163087, -0.008007153, 3.033647, 0.4156863, 0, 1, 1,
0.6168967, -0.4764244, 4.058569, 0.4235294, 0, 1, 1,
0.6176755, 0.1290106, 0.6240913, 0.427451, 0, 1, 1,
0.6204853, 0.1486096, 2.119911, 0.4352941, 0, 1, 1,
0.6205515, 0.3909662, -0.2757142, 0.4392157, 0, 1, 1,
0.6217775, 0.1803138, 4.170083, 0.4470588, 0, 1, 1,
0.6280274, 0.4049805, 3.483128, 0.4509804, 0, 1, 1,
0.6285651, 2.201907, 0.8915622, 0.4588235, 0, 1, 1,
0.6341045, 1.285203, -0.7491593, 0.4627451, 0, 1, 1,
0.6370944, 0.9136798, 0.4110467, 0.4705882, 0, 1, 1,
0.6424444, 0.1607571, -0.2898869, 0.4745098, 0, 1, 1,
0.6478159, -1.252532, 2.132518, 0.4823529, 0, 1, 1,
0.6516209, 1.753734, -0.7867788, 0.4862745, 0, 1, 1,
0.6629056, -0.4055662, 1.934987, 0.4941176, 0, 1, 1,
0.6656175, -0.5648482, 1.187716, 0.5019608, 0, 1, 1,
0.6712427, 1.929906, 0.3613917, 0.5058824, 0, 1, 1,
0.6724269, -0.2367372, 0.4791878, 0.5137255, 0, 1, 1,
0.673882, 0.4968694, 2.671315, 0.5176471, 0, 1, 1,
0.6804877, 1.255961, -0.1008864, 0.5254902, 0, 1, 1,
0.6889994, 0.4677846, 1.434239, 0.5294118, 0, 1, 1,
0.6919996, 1.58134, 1.303519, 0.5372549, 0, 1, 1,
0.6939099, -0.8340265, 2.51116, 0.5411765, 0, 1, 1,
0.6958143, 0.5005444, -0.4246541, 0.5490196, 0, 1, 1,
0.6967613, -0.9315603, 2.336303, 0.5529412, 0, 1, 1,
0.6971276, 1.29198, 0.7945365, 0.5607843, 0, 1, 1,
0.7082595, 1.843883, 0.7221439, 0.5647059, 0, 1, 1,
0.7093488, -0.6831129, 2.185327, 0.572549, 0, 1, 1,
0.7096106, -0.4221874, 0.3682119, 0.5764706, 0, 1, 1,
0.7100801, 0.9869359, 1.178645, 0.5843138, 0, 1, 1,
0.7124487, -0.79882, 2.354107, 0.5882353, 0, 1, 1,
0.7158099, 0.6440643, -1.070063, 0.5960785, 0, 1, 1,
0.7166588, -0.05854146, 1.827729, 0.6039216, 0, 1, 1,
0.7168514, -0.1071359, 3.746711, 0.6078432, 0, 1, 1,
0.7252179, 0.242686, 2.088344, 0.6156863, 0, 1, 1,
0.7281442, -0.7721018, 1.973682, 0.6196079, 0, 1, 1,
0.7395483, 0.8937395, 1.251188, 0.627451, 0, 1, 1,
0.7402676, 0.4262596, 1.113184, 0.6313726, 0, 1, 1,
0.7428343, 1.357574, 2.188203, 0.6392157, 0, 1, 1,
0.7433177, -0.6070616, 3.028957, 0.6431373, 0, 1, 1,
0.7440184, 0.4662669, 0.09462662, 0.6509804, 0, 1, 1,
0.7449448, -0.6335878, 3.026396, 0.654902, 0, 1, 1,
0.7456523, 0.9214858, 0.1811262, 0.6627451, 0, 1, 1,
0.7508416, -0.03668118, 1.5311, 0.6666667, 0, 1, 1,
0.7518732, 0.7596421, 2.571275, 0.6745098, 0, 1, 1,
0.753758, -0.4343453, 2.794856, 0.6784314, 0, 1, 1,
0.7544328, 1.139339, 1.04252, 0.6862745, 0, 1, 1,
0.7655685, -0.2103566, 1.821748, 0.6901961, 0, 1, 1,
0.7846701, -0.8392209, 3.103662, 0.6980392, 0, 1, 1,
0.7892342, -0.1744343, 2.485809, 0.7058824, 0, 1, 1,
0.8019072, -1.139898, 3.51435, 0.7098039, 0, 1, 1,
0.8026451, 1.090415, 1.43019, 0.7176471, 0, 1, 1,
0.8081822, -1.631714, 4.323206, 0.7215686, 0, 1, 1,
0.8144495, 0.4625062, 2.652685, 0.7294118, 0, 1, 1,
0.8164409, 0.1362144, 0.85296, 0.7333333, 0, 1, 1,
0.8252407, -0.4862881, 1.903188, 0.7411765, 0, 1, 1,
0.8322134, -1.180561, 0.7391024, 0.7450981, 0, 1, 1,
0.8370845, -2.355922, 2.416106, 0.7529412, 0, 1, 1,
0.8407155, -0.8806148, 3.760762, 0.7568628, 0, 1, 1,
0.8450542, 0.35, 1.185845, 0.7647059, 0, 1, 1,
0.8471053, -2.566599, 1.546503, 0.7686275, 0, 1, 1,
0.8474087, -0.4166977, 3.253913, 0.7764706, 0, 1, 1,
0.8481192, -0.2686647, 2.563947, 0.7803922, 0, 1, 1,
0.858376, -0.07168005, 0.8264315, 0.7882353, 0, 1, 1,
0.8595709, -0.08806283, 1.346941, 0.7921569, 0, 1, 1,
0.8617399, -0.7730091, 1.472705, 0.8, 0, 1, 1,
0.8693184, 1.361463, 1.542421, 0.8078431, 0, 1, 1,
0.8697989, 0.68532, 2.798106, 0.8117647, 0, 1, 1,
0.8708551, -1.000387, 1.807849, 0.8196079, 0, 1, 1,
0.8762664, 0.6041037, -0.7132905, 0.8235294, 0, 1, 1,
0.8785383, -1.336652, 4.658337, 0.8313726, 0, 1, 1,
0.8798004, -0.5593247, 0.6631528, 0.8352941, 0, 1, 1,
0.8807315, -0.5974872, 2.226387, 0.8431373, 0, 1, 1,
0.8851964, 0.4287155, 2.395465, 0.8470588, 0, 1, 1,
0.8864453, 0.576821, 0.8201238, 0.854902, 0, 1, 1,
0.8876641, 0.6087604, 1.255281, 0.8588235, 0, 1, 1,
0.888675, 1.983231, 0.7535084, 0.8666667, 0, 1, 1,
0.8898863, 0.4010301, 2.349797, 0.8705882, 0, 1, 1,
0.8926854, 0.3591705, 2.490747, 0.8784314, 0, 1, 1,
0.8942915, 2.548447, -0.02223862, 0.8823529, 0, 1, 1,
0.9008874, 1.101253, 0.6041813, 0.8901961, 0, 1, 1,
0.903248, -0.6447118, 0.7856523, 0.8941177, 0, 1, 1,
0.9064533, -0.9297096, -0.76408, 0.9019608, 0, 1, 1,
0.9137508, -1.723165, 1.070758, 0.9098039, 0, 1, 1,
0.9171121, -0.5581958, 1.110937, 0.9137255, 0, 1, 1,
0.9196089, 1.645781, 0.8821487, 0.9215686, 0, 1, 1,
0.923602, -0.5296963, 2.316464, 0.9254902, 0, 1, 1,
0.9270344, -0.3352958, 0.9892684, 0.9333333, 0, 1, 1,
0.9272933, -0.0173417, 0.9361728, 0.9372549, 0, 1, 1,
0.9387115, -0.7496989, 3.161413, 0.945098, 0, 1, 1,
0.9447033, -0.7785337, 1.496413, 0.9490196, 0, 1, 1,
0.9483109, 0.4745537, 0.2315926, 0.9568627, 0, 1, 1,
0.94842, 0.1813116, 0.2529821, 0.9607843, 0, 1, 1,
0.9574036, -1.751391, 1.170393, 0.9686275, 0, 1, 1,
0.9632006, -0.6501253, 0.8934321, 0.972549, 0, 1, 1,
0.96466, 0.8806157, 0.4033726, 0.9803922, 0, 1, 1,
0.9657449, -0.8261007, 3.032645, 0.9843137, 0, 1, 1,
0.9683264, 0.8812335, 2.414957, 0.9921569, 0, 1, 1,
0.9768308, 1.679291, 0.4513725, 0.9960784, 0, 1, 1,
0.9777043, 0.1906657, 1.516173, 1, 0, 0.9960784, 1,
0.9817916, 1.30869, 2.097823, 1, 0, 0.9882353, 1,
0.9829046, -1.584031, 4.161767, 1, 0, 0.9843137, 1,
0.9901288, -0.2026018, 1.006388, 1, 0, 0.9764706, 1,
0.993623, 0.425861, 0.1556908, 1, 0, 0.972549, 1,
0.9955988, -0.006804682, 1.782254, 1, 0, 0.9647059, 1,
0.9970921, -0.9124442, 2.533451, 1, 0, 0.9607843, 1,
0.9993552, -1.132755, 3.312374, 1, 0, 0.9529412, 1,
1.01675, -1.628063, 2.054711, 1, 0, 0.9490196, 1,
1.02043, -0.2174301, 1.50254, 1, 0, 0.9411765, 1,
1.020792, 0.04132301, 0.5687299, 1, 0, 0.9372549, 1,
1.028578, -0.9796898, 2.036484, 1, 0, 0.9294118, 1,
1.034241, -0.501655, 3.642302, 1, 0, 0.9254902, 1,
1.035009, -0.8617021, 2.097066, 1, 0, 0.9176471, 1,
1.038333, 0.2691315, 1.425168, 1, 0, 0.9137255, 1,
1.039356, 0.2283556, 0.6102511, 1, 0, 0.9058824, 1,
1.03992, 0.1584329, 1.378775, 1, 0, 0.9019608, 1,
1.044872, -1.107213, 2.526997, 1, 0, 0.8941177, 1,
1.046298, 0.3270563, 2.623417, 1, 0, 0.8862745, 1,
1.050215, 0.335151, 1.125266, 1, 0, 0.8823529, 1,
1.058443, 0.3310424, 0.3114469, 1, 0, 0.8745098, 1,
1.061043, 2.090669, 0.5677452, 1, 0, 0.8705882, 1,
1.064056, -0.2334659, 1.94323, 1, 0, 0.8627451, 1,
1.066072, -1.158515, 1.866727, 1, 0, 0.8588235, 1,
1.068754, 0.2771936, 2.400212, 1, 0, 0.8509804, 1,
1.070086, 0.1652878, 1.753837, 1, 0, 0.8470588, 1,
1.07141, -2.484595, 2.127296, 1, 0, 0.8392157, 1,
1.071716, 0.3816474, 1.608799, 1, 0, 0.8352941, 1,
1.077108, -0.9523886, 0.9635884, 1, 0, 0.827451, 1,
1.077165, 0.8885565, 0.6499011, 1, 0, 0.8235294, 1,
1.077664, 0.1314717, 2.084798, 1, 0, 0.8156863, 1,
1.084453, -0.5085574, 2.661639, 1, 0, 0.8117647, 1,
1.094396, -0.3910647, 1.599192, 1, 0, 0.8039216, 1,
1.107983, 0.7325261, 1.010907, 1, 0, 0.7960784, 1,
1.109685, -0.6386166, 2.548551, 1, 0, 0.7921569, 1,
1.117748, -0.6275555, 1.030774, 1, 0, 0.7843137, 1,
1.117805, 0.912181, -0.523685, 1, 0, 0.7803922, 1,
1.118228, 0.03458053, 2.162769, 1, 0, 0.772549, 1,
1.1205, -1.086249, 2.007, 1, 0, 0.7686275, 1,
1.139586, 1.359817, 1.428088, 1, 0, 0.7607843, 1,
1.140685, -0.6200511, 3.448849, 1, 0, 0.7568628, 1,
1.147791, -0.3398387, 1.920287, 1, 0, 0.7490196, 1,
1.14959, 0.1831614, 0.9388696, 1, 0, 0.7450981, 1,
1.149974, -1.26134, 1.942865, 1, 0, 0.7372549, 1,
1.157796, -0.3395514, 1.264901, 1, 0, 0.7333333, 1,
1.158779, 0.7755644, 0.1344314, 1, 0, 0.7254902, 1,
1.158883, -1.535851, 1.307437, 1, 0, 0.7215686, 1,
1.165545, 0.6832516, -0.6473465, 1, 0, 0.7137255, 1,
1.165618, -0.09009118, -0.8787754, 1, 0, 0.7098039, 1,
1.165717, -0.559926, 3.175492, 1, 0, 0.7019608, 1,
1.172346, -1.102122, 3.593668, 1, 0, 0.6941177, 1,
1.175682, 0.6238947, 0.4984767, 1, 0, 0.6901961, 1,
1.177531, 1.816755, 1.172995, 1, 0, 0.682353, 1,
1.192108, 0.5451823, 1.464054, 1, 0, 0.6784314, 1,
1.209836, 0.2798209, 2.684364, 1, 0, 0.6705883, 1,
1.219872, 1.139814, 0.8458416, 1, 0, 0.6666667, 1,
1.231725, -0.6851634, 1.864092, 1, 0, 0.6588235, 1,
1.232558, 1.570714, 1.484015, 1, 0, 0.654902, 1,
1.23404, 0.04720102, 2.611912, 1, 0, 0.6470588, 1,
1.240969, 0.6458642, 1.657174, 1, 0, 0.6431373, 1,
1.258206, 2.469799, -0.4343802, 1, 0, 0.6352941, 1,
1.258422, -0.1272992, 3.039886, 1, 0, 0.6313726, 1,
1.259893, 0.2924275, 0.5304399, 1, 0, 0.6235294, 1,
1.26645, 0.1079441, 0.4694309, 1, 0, 0.6196079, 1,
1.279478, -0.3432936, 1.978605, 1, 0, 0.6117647, 1,
1.282927, -0.9748563, 1.885609, 1, 0, 0.6078432, 1,
1.283186, 0.4585384, 0.9125803, 1, 0, 0.6, 1,
1.29472, 0.7535565, -0.237669, 1, 0, 0.5921569, 1,
1.304394, 1.020428, 0.3745539, 1, 0, 0.5882353, 1,
1.314916, 0.6863324, 0.9446294, 1, 0, 0.5803922, 1,
1.323811, -0.2465143, 1.507442, 1, 0, 0.5764706, 1,
1.324715, 0.7545394, -1.520057, 1, 0, 0.5686275, 1,
1.326455, 0.03934329, 0.5308534, 1, 0, 0.5647059, 1,
1.331197, -1.079497, 1.801816, 1, 0, 0.5568628, 1,
1.332787, -0.8330668, 1.030412, 1, 0, 0.5529412, 1,
1.334984, 0.9911369, 1.354239, 1, 0, 0.5450981, 1,
1.335098, -0.8843529, 0.3624287, 1, 0, 0.5411765, 1,
1.342449, -0.6082063, 2.834003, 1, 0, 0.5333334, 1,
1.344527, -1.074015, 1.166987, 1, 0, 0.5294118, 1,
1.345703, -0.2609345, 2.208726, 1, 0, 0.5215687, 1,
1.346365, 0.2542586, 1.498754, 1, 0, 0.5176471, 1,
1.349947, -0.7695019, 4.182539, 1, 0, 0.509804, 1,
1.364024, 0.2708315, 0.7714301, 1, 0, 0.5058824, 1,
1.383905, 0.8995829, -0.8318312, 1, 0, 0.4980392, 1,
1.385903, -0.8262488, 1.815104, 1, 0, 0.4901961, 1,
1.388194, 1.302342, 1.706199, 1, 0, 0.4862745, 1,
1.390471, -0.3159723, 0.669532, 1, 0, 0.4784314, 1,
1.402162, 1.556338, 2.089885, 1, 0, 0.4745098, 1,
1.424908, -0.5597355, 3.064319, 1, 0, 0.4666667, 1,
1.431375, 1.628743, 0.90576, 1, 0, 0.4627451, 1,
1.434703, -0.7665414, 0.5176162, 1, 0, 0.454902, 1,
1.434769, -1.161516, 4.765517, 1, 0, 0.4509804, 1,
1.437976, 0.01469269, 2.673729, 1, 0, 0.4431373, 1,
1.44034, 0.936906, 1.2786, 1, 0, 0.4392157, 1,
1.441003, 0.4872785, 0.7500157, 1, 0, 0.4313726, 1,
1.456535, 0.5545263, 1.784756, 1, 0, 0.427451, 1,
1.458246, -0.345121, 1.961301, 1, 0, 0.4196078, 1,
1.46407, -1.615324, 1.986491, 1, 0, 0.4156863, 1,
1.471265, 0.7550599, 0.8841388, 1, 0, 0.4078431, 1,
1.477503, -1.543633, 2.797706, 1, 0, 0.4039216, 1,
1.48649, 2.632187, 0.1760711, 1, 0, 0.3960784, 1,
1.487905, -0.1783256, 1.559611, 1, 0, 0.3882353, 1,
1.520462, 1.10983, 1.080611, 1, 0, 0.3843137, 1,
1.522897, -0.1546103, 1.250444, 1, 0, 0.3764706, 1,
1.538512, -0.5880917, 1.859992, 1, 0, 0.372549, 1,
1.54057, -0.04825117, 0.111551, 1, 0, 0.3647059, 1,
1.542205, -0.4684716, 0.6821747, 1, 0, 0.3607843, 1,
1.549228, -0.00641088, 0.4110998, 1, 0, 0.3529412, 1,
1.552077, 0.8183562, 0.6828008, 1, 0, 0.3490196, 1,
1.553469, 0.9843439, 1.292583, 1, 0, 0.3411765, 1,
1.568877, -0.08221362, 2.066609, 1, 0, 0.3372549, 1,
1.579742, -0.845773, 1.483338, 1, 0, 0.3294118, 1,
1.581395, 0.3706076, 4.098902, 1, 0, 0.3254902, 1,
1.591408, -2.098659, 1.558993, 1, 0, 0.3176471, 1,
1.596853, -0.1630065, 1.760107, 1, 0, 0.3137255, 1,
1.62689, 0.3382413, -0.6603169, 1, 0, 0.3058824, 1,
1.650124, 0.5824594, 0.8098106, 1, 0, 0.2980392, 1,
1.659899, -0.6738003, 1.72861, 1, 0, 0.2941177, 1,
1.660162, 0.5594846, 0.8517276, 1, 0, 0.2862745, 1,
1.668829, 1.99043, 2.125657, 1, 0, 0.282353, 1,
1.679374, 0.1512044, 3.321737, 1, 0, 0.2745098, 1,
1.682143, 1.399887, 1.257702, 1, 0, 0.2705882, 1,
1.71318, -1.669799, 1.553054, 1, 0, 0.2627451, 1,
1.728612, 0.5885288, 3.033862, 1, 0, 0.2588235, 1,
1.752553, 0.4685721, 2.09833, 1, 0, 0.2509804, 1,
1.778494, -0.2021754, 2.459998, 1, 0, 0.2470588, 1,
1.80659, 0.4902244, 3.132354, 1, 0, 0.2392157, 1,
1.815487, 1.110338, 0.125409, 1, 0, 0.2352941, 1,
1.822639, -0.7806112, 1.603766, 1, 0, 0.227451, 1,
1.835434, 0.6591294, 0.1175484, 1, 0, 0.2235294, 1,
1.855548, 1.294457, 0.3431535, 1, 0, 0.2156863, 1,
1.882172, 0.7596744, -0.519207, 1, 0, 0.2117647, 1,
1.888579, -1.202057, 2.841722, 1, 0, 0.2039216, 1,
1.901747, 0.5827878, 1.335037, 1, 0, 0.1960784, 1,
1.9038, 0.2198345, 1.394826, 1, 0, 0.1921569, 1,
1.917973, -1.435161, 3.619124, 1, 0, 0.1843137, 1,
1.929672, -2.55217, 1.749093, 1, 0, 0.1803922, 1,
1.955999, -2.132464, 1.453287, 1, 0, 0.172549, 1,
2.008128, 0.1185853, 1.950782, 1, 0, 0.1686275, 1,
2.00853, -0.9224356, -0.6507583, 1, 0, 0.1607843, 1,
2.021421, 1.311843, 2.386561, 1, 0, 0.1568628, 1,
2.039211, -0.3715639, -0.4854263, 1, 0, 0.1490196, 1,
2.06269, -0.9148368, 1.655962, 1, 0, 0.145098, 1,
2.064106, 0.944028, 1.978986, 1, 0, 0.1372549, 1,
2.067594, 1.576801, 2.032355, 1, 0, 0.1333333, 1,
2.074917, -0.7182708, 2.896244, 1, 0, 0.1254902, 1,
2.12833, -0.1669565, 2.327503, 1, 0, 0.1215686, 1,
2.18769, -0.1520068, 1.439347, 1, 0, 0.1137255, 1,
2.205934, 0.5840451, 1.794753, 1, 0, 0.1098039, 1,
2.237835, 0.1153199, 2.411717, 1, 0, 0.1019608, 1,
2.252765, 0.4173033, 1.03738, 1, 0, 0.09411765, 1,
2.275133, -0.3383992, 1.663386, 1, 0, 0.09019608, 1,
2.292555, -0.9433124, 1.004804, 1, 0, 0.08235294, 1,
2.301313, -0.8754269, 2.018373, 1, 0, 0.07843138, 1,
2.30558, 0.3443563, 1.444804, 1, 0, 0.07058824, 1,
2.311366, -1.253684, 1.889972, 1, 0, 0.06666667, 1,
2.322664, -0.9227313, 0.6793224, 1, 0, 0.05882353, 1,
2.326188, 0.2288529, 1.02157, 1, 0, 0.05490196, 1,
2.336699, -0.5749267, 2.902512, 1, 0, 0.04705882, 1,
2.52659, 0.215882, 1.45022, 1, 0, 0.04313726, 1,
2.582454, -0.7413316, 2.350911, 1, 0, 0.03529412, 1,
2.605284, 0.6846991, 1.048871, 1, 0, 0.03137255, 1,
2.62167, -0.54607, 2.390306, 1, 0, 0.02352941, 1,
3.021358, -0.9586452, 4.459361, 1, 0, 0.01960784, 1,
3.308135, 1.332009, 1.988888, 1, 0, 0.01176471, 1,
3.369681, -0.3025879, 2.649941, 1, 0, 0.007843138, 1
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
0.2952265, -5.072215, -7.033396, 0, -0.5, 0.5, 0.5,
0.2952265, -5.072215, -7.033396, 1, -0.5, 0.5, 0.5,
0.2952265, -5.072215, -7.033396, 1, 1.5, 0.5, 0.5,
0.2952265, -5.072215, -7.033396, 0, 1.5, 0.5, 0.5
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
-3.821468, -0.4579359, -7.033396, 0, -0.5, 0.5, 0.5,
-3.821468, -0.4579359, -7.033396, 1, -0.5, 0.5, 0.5,
-3.821468, -0.4579359, -7.033396, 1, 1.5, 0.5, 0.5,
-3.821468, -0.4579359, -7.033396, 0, 1.5, 0.5, 0.5
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
-3.821468, -5.072215, -0.2789094, 0, -0.5, 0.5, 0.5,
-3.821468, -5.072215, -0.2789094, 1, -0.5, 0.5, 0.5,
-3.821468, -5.072215, -0.2789094, 1, 1.5, 0.5, 0.5,
-3.821468, -5.072215, -0.2789094, 0, 1.5, 0.5, 0.5
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
-2, -4.007381, -5.474669,
3, -4.007381, -5.474669,
-2, -4.007381, -5.474669,
-2, -4.184854, -5.734457,
-1, -4.007381, -5.474669,
-1, -4.184854, -5.734457,
0, -4.007381, -5.474669,
0, -4.184854, -5.734457,
1, -4.007381, -5.474669,
1, -4.184854, -5.734457,
2, -4.007381, -5.474669,
2, -4.184854, -5.734457,
3, -4.007381, -5.474669,
3, -4.184854, -5.734457
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
-2, -4.539798, -6.254032, 0, -0.5, 0.5, 0.5,
-2, -4.539798, -6.254032, 1, -0.5, 0.5, 0.5,
-2, -4.539798, -6.254032, 1, 1.5, 0.5, 0.5,
-2, -4.539798, -6.254032, 0, 1.5, 0.5, 0.5,
-1, -4.539798, -6.254032, 0, -0.5, 0.5, 0.5,
-1, -4.539798, -6.254032, 1, -0.5, 0.5, 0.5,
-1, -4.539798, -6.254032, 1, 1.5, 0.5, 0.5,
-1, -4.539798, -6.254032, 0, 1.5, 0.5, 0.5,
0, -4.539798, -6.254032, 0, -0.5, 0.5, 0.5,
0, -4.539798, -6.254032, 1, -0.5, 0.5, 0.5,
0, -4.539798, -6.254032, 1, 1.5, 0.5, 0.5,
0, -4.539798, -6.254032, 0, 1.5, 0.5, 0.5,
1, -4.539798, -6.254032, 0, -0.5, 0.5, 0.5,
1, -4.539798, -6.254032, 1, -0.5, 0.5, 0.5,
1, -4.539798, -6.254032, 1, 1.5, 0.5, 0.5,
1, -4.539798, -6.254032, 0, 1.5, 0.5, 0.5,
2, -4.539798, -6.254032, 0, -0.5, 0.5, 0.5,
2, -4.539798, -6.254032, 1, -0.5, 0.5, 0.5,
2, -4.539798, -6.254032, 1, 1.5, 0.5, 0.5,
2, -4.539798, -6.254032, 0, 1.5, 0.5, 0.5,
3, -4.539798, -6.254032, 0, -0.5, 0.5, 0.5,
3, -4.539798, -6.254032, 1, -0.5, 0.5, 0.5,
3, -4.539798, -6.254032, 1, 1.5, 0.5, 0.5,
3, -4.539798, -6.254032, 0, 1.5, 0.5, 0.5
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
-2.871462, -3, -5.474669,
-2.871462, 2, -5.474669,
-2.871462, -3, -5.474669,
-3.029796, -3, -5.734457,
-2.871462, -2, -5.474669,
-3.029796, -2, -5.734457,
-2.871462, -1, -5.474669,
-3.029796, -1, -5.734457,
-2.871462, 0, -5.474669,
-3.029796, 0, -5.734457,
-2.871462, 1, -5.474669,
-3.029796, 1, -5.734457,
-2.871462, 2, -5.474669,
-3.029796, 2, -5.734457
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
-3.346465, -3, -6.254032, 0, -0.5, 0.5, 0.5,
-3.346465, -3, -6.254032, 1, -0.5, 0.5, 0.5,
-3.346465, -3, -6.254032, 1, 1.5, 0.5, 0.5,
-3.346465, -3, -6.254032, 0, 1.5, 0.5, 0.5,
-3.346465, -2, -6.254032, 0, -0.5, 0.5, 0.5,
-3.346465, -2, -6.254032, 1, -0.5, 0.5, 0.5,
-3.346465, -2, -6.254032, 1, 1.5, 0.5, 0.5,
-3.346465, -2, -6.254032, 0, 1.5, 0.5, 0.5,
-3.346465, -1, -6.254032, 0, -0.5, 0.5, 0.5,
-3.346465, -1, -6.254032, 1, -0.5, 0.5, 0.5,
-3.346465, -1, -6.254032, 1, 1.5, 0.5, 0.5,
-3.346465, -1, -6.254032, 0, 1.5, 0.5, 0.5,
-3.346465, 0, -6.254032, 0, -0.5, 0.5, 0.5,
-3.346465, 0, -6.254032, 1, -0.5, 0.5, 0.5,
-3.346465, 0, -6.254032, 1, 1.5, 0.5, 0.5,
-3.346465, 0, -6.254032, 0, 1.5, 0.5, 0.5,
-3.346465, 1, -6.254032, 0, -0.5, 0.5, 0.5,
-3.346465, 1, -6.254032, 1, -0.5, 0.5, 0.5,
-3.346465, 1, -6.254032, 1, 1.5, 0.5, 0.5,
-3.346465, 1, -6.254032, 0, 1.5, 0.5, 0.5,
-3.346465, 2, -6.254032, 0, -0.5, 0.5, 0.5,
-3.346465, 2, -6.254032, 1, -0.5, 0.5, 0.5,
-3.346465, 2, -6.254032, 1, 1.5, 0.5, 0.5,
-3.346465, 2, -6.254032, 0, 1.5, 0.5, 0.5
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
-2.871462, -4.007381, -4,
-2.871462, -4.007381, 4,
-2.871462, -4.007381, -4,
-3.029796, -4.184854, -4,
-2.871462, -4.007381, -2,
-3.029796, -4.184854, -2,
-2.871462, -4.007381, 0,
-3.029796, -4.184854, 0,
-2.871462, -4.007381, 2,
-3.029796, -4.184854, 2,
-2.871462, -4.007381, 4,
-3.029796, -4.184854, 4
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
-3.346465, -4.539798, -4, 0, -0.5, 0.5, 0.5,
-3.346465, -4.539798, -4, 1, -0.5, 0.5, 0.5,
-3.346465, -4.539798, -4, 1, 1.5, 0.5, 0.5,
-3.346465, -4.539798, -4, 0, 1.5, 0.5, 0.5,
-3.346465, -4.539798, -2, 0, -0.5, 0.5, 0.5,
-3.346465, -4.539798, -2, 1, -0.5, 0.5, 0.5,
-3.346465, -4.539798, -2, 1, 1.5, 0.5, 0.5,
-3.346465, -4.539798, -2, 0, 1.5, 0.5, 0.5,
-3.346465, -4.539798, 0, 0, -0.5, 0.5, 0.5,
-3.346465, -4.539798, 0, 1, -0.5, 0.5, 0.5,
-3.346465, -4.539798, 0, 1, 1.5, 0.5, 0.5,
-3.346465, -4.539798, 0, 0, 1.5, 0.5, 0.5,
-3.346465, -4.539798, 2, 0, -0.5, 0.5, 0.5,
-3.346465, -4.539798, 2, 1, -0.5, 0.5, 0.5,
-3.346465, -4.539798, 2, 1, 1.5, 0.5, 0.5,
-3.346465, -4.539798, 2, 0, 1.5, 0.5, 0.5,
-3.346465, -4.539798, 4, 0, -0.5, 0.5, 0.5,
-3.346465, -4.539798, 4, 1, -0.5, 0.5, 0.5,
-3.346465, -4.539798, 4, 1, 1.5, 0.5, 0.5,
-3.346465, -4.539798, 4, 0, 1.5, 0.5, 0.5
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
-2.871462, -4.007381, -5.474669,
-2.871462, 3.091509, -5.474669,
-2.871462, -4.007381, 4.91685,
-2.871462, 3.091509, 4.91685,
-2.871462, -4.007381, -5.474669,
-2.871462, -4.007381, 4.91685,
-2.871462, 3.091509, -5.474669,
-2.871462, 3.091509, 4.91685,
-2.871462, -4.007381, -5.474669,
3.461915, -4.007381, -5.474669,
-2.871462, -4.007381, 4.91685,
3.461915, -4.007381, 4.91685,
-2.871462, 3.091509, -5.474669,
3.461915, 3.091509, -5.474669,
-2.871462, 3.091509, 4.91685,
3.461915, 3.091509, 4.91685,
3.461915, -4.007381, -5.474669,
3.461915, 3.091509, -5.474669,
3.461915, -4.007381, 4.91685,
3.461915, 3.091509, 4.91685,
3.461915, -4.007381, -5.474669,
3.461915, -4.007381, 4.91685,
3.461915, 3.091509, -5.474669,
3.461915, 3.091509, 4.91685
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
var radius = 7.523056;
var distance = 33.47092;
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
mvMatrix.translate( -0.2952265, 0.4579359, 0.2789094 );
mvMatrix.scale( 1.284319, 1.145823, 0.782761 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47092);
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
dinocap<-read.table("dinocap.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dinocap$V2
```

```
## Error in eval(expr, envir, enclos): object 'dinocap' not found
```

```r
y<-dinocap$V3
```

```
## Error in eval(expr, envir, enclos): object 'dinocap' not found
```

```r
z<-dinocap$V4
```

```
## Error in eval(expr, envir, enclos): object 'dinocap' not found
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
-2.779228, 0.4934477, -2.88102, 0, 0, 1, 1, 1,
-2.553736, 0.5961446, -3.099288, 1, 0, 0, 1, 1,
-2.551885, 1.447268, -2.860649, 1, 0, 0, 1, 1,
-2.549263, -0.3757625, -2.332115, 1, 0, 0, 1, 1,
-2.546207, -0.2610955, 0.3774949, 1, 0, 0, 1, 1,
-2.527729, 0.7750567, -0.5649361, 1, 0, 0, 1, 1,
-2.501956, -0.9840397, -1.008563, 0, 0, 0, 1, 1,
-2.485419, 1.794203, -0.5399526, 0, 0, 0, 1, 1,
-2.398668, -1.854706, -2.707171, 0, 0, 0, 1, 1,
-2.387369, 0.1762396, -0.2361677, 0, 0, 0, 1, 1,
-2.27858, -0.624195, -1.189011, 0, 0, 0, 1, 1,
-2.267244, 0.3430244, -2.95401, 0, 0, 0, 1, 1,
-2.25843, -0.3722089, -1.895903, 0, 0, 0, 1, 1,
-2.178188, 0.4313546, 0.8746198, 1, 1, 1, 1, 1,
-2.158358, -0.1246887, -0.7368039, 1, 1, 1, 1, 1,
-2.148316, 2.010545, -2.659646, 1, 1, 1, 1, 1,
-2.14346, -0.9786999, 0.3324364, 1, 1, 1, 1, 1,
-2.136437, -1.089066, -1.559095, 1, 1, 1, 1, 1,
-2.102217, -0.5597275, -3.468633, 1, 1, 1, 1, 1,
-2.095, -0.5345123, -1.403329, 1, 1, 1, 1, 1,
-2.072649, 1.338461, -1.266457, 1, 1, 1, 1, 1,
-2.049454, 0.04561997, -1.538518, 1, 1, 1, 1, 1,
-2.044995, 1.166643, -1.254366, 1, 1, 1, 1, 1,
-2.02914, -1.734919, -2.076401, 1, 1, 1, 1, 1,
-2.01896, -0.8808993, -0.9185636, 1, 1, 1, 1, 1,
-1.980816, -0.4224834, -2.419992, 1, 1, 1, 1, 1,
-1.942461, 0.213175, -0.8618953, 1, 1, 1, 1, 1,
-1.929254, 0.1188425, -1.770101, 1, 1, 1, 1, 1,
-1.917871, 1.007671, -0.4482174, 0, 0, 1, 1, 1,
-1.879279, -0.4218812, -1.830588, 1, 0, 0, 1, 1,
-1.862259, 0.511929, -0.1187298, 1, 0, 0, 1, 1,
-1.855118, 0.8646618, -0.7564347, 1, 0, 0, 1, 1,
-1.846737, -1.132304, -2.482094, 1, 0, 0, 1, 1,
-1.842014, 1.481153, -0.9845789, 1, 0, 0, 1, 1,
-1.837516, 0.3188324, -0.7657027, 0, 0, 0, 1, 1,
-1.765946, 0.6040698, -1.081099, 0, 0, 0, 1, 1,
-1.746956, -0.3773325, -2.515785, 0, 0, 0, 1, 1,
-1.746826, 1.036071, -1.160029, 0, 0, 0, 1, 1,
-1.731856, -1.388283, -1.877645, 0, 0, 0, 1, 1,
-1.720328, 0.1030297, -0.760175, 0, 0, 0, 1, 1,
-1.716387, -0.03816586, -0.1868293, 0, 0, 0, 1, 1,
-1.690125, 0.9591913, -1.131735, 1, 1, 1, 1, 1,
-1.687306, -0.08120635, -0.7750553, 1, 1, 1, 1, 1,
-1.686527, 0.5858711, -0.6689507, 1, 1, 1, 1, 1,
-1.681613, -0.483713, -3.369342, 1, 1, 1, 1, 1,
-1.665466, -0.6770005, 0.4462813, 1, 1, 1, 1, 1,
-1.6535, -0.4589987, 0.04864233, 1, 1, 1, 1, 1,
-1.65172, 0.9892245, -1.073194, 1, 1, 1, 1, 1,
-1.65164, 0.7919423, 2.187097, 1, 1, 1, 1, 1,
-1.642986, -0.4168922, -1.917327, 1, 1, 1, 1, 1,
-1.627748, -1.845263, -3.067614, 1, 1, 1, 1, 1,
-1.614212, -0.6014068, -3.077517, 1, 1, 1, 1, 1,
-1.606969, 1.452377, 0.3022035, 1, 1, 1, 1, 1,
-1.606073, -0.5801949, -0.6823435, 1, 1, 1, 1, 1,
-1.574421, 0.5308103, -1.35345, 1, 1, 1, 1, 1,
-1.572603, 0.1290571, -1.267022, 1, 1, 1, 1, 1,
-1.556603, -0.4735199, -1.957119, 0, 0, 1, 1, 1,
-1.512584, 0.2249869, -1.020666, 1, 0, 0, 1, 1,
-1.50205, 0.006499207, -1.716814, 1, 0, 0, 1, 1,
-1.498738, 0.05245143, -0.8268024, 1, 0, 0, 1, 1,
-1.491126, -0.1281984, -0.5236237, 1, 0, 0, 1, 1,
-1.482745, -0.5871309, -0.8334178, 1, 0, 0, 1, 1,
-1.47199, 0.9677627, -3.361519, 0, 0, 0, 1, 1,
-1.468458, 0.2058069, -2.512444, 0, 0, 0, 1, 1,
-1.466769, 0.4600485, -0.5193524, 0, 0, 0, 1, 1,
-1.463682, 0.6055616, -1.32629, 0, 0, 0, 1, 1,
-1.458666, 1.271312, -0.571123, 0, 0, 0, 1, 1,
-1.456129, 0.8258251, -1.990049, 0, 0, 0, 1, 1,
-1.455514, -2.149108, -3.002793, 0, 0, 0, 1, 1,
-1.454906, 0.5306497, 0.2459436, 1, 1, 1, 1, 1,
-1.449742, 0.9017217, -0.304817, 1, 1, 1, 1, 1,
-1.44755, -0.5856791, -3.077232, 1, 1, 1, 1, 1,
-1.432159, 0.00629657, -1.244173, 1, 1, 1, 1, 1,
-1.431524, -3.14343, -1.87147, 1, 1, 1, 1, 1,
-1.429877, 1.280915, -2.020048, 1, 1, 1, 1, 1,
-1.410959, 0.1294744, -1.89238, 1, 1, 1, 1, 1,
-1.40801, 0.4804604, -2.204859, 1, 1, 1, 1, 1,
-1.407521, 1.328392, -1.064201, 1, 1, 1, 1, 1,
-1.405587, -0.2601748, -3.852437, 1, 1, 1, 1, 1,
-1.394997, -0.2034057, -2.097735, 1, 1, 1, 1, 1,
-1.390439, -0.08132327, -3.825518, 1, 1, 1, 1, 1,
-1.380646, -0.7698004, -0.8508473, 1, 1, 1, 1, 1,
-1.372007, 0.9436637, -1.179345, 1, 1, 1, 1, 1,
-1.360502, 1.278385, 0.3217323, 1, 1, 1, 1, 1,
-1.353399, 0.842425, -2.349858, 0, 0, 1, 1, 1,
-1.351965, -1.464493, -2.837951, 1, 0, 0, 1, 1,
-1.348564, -1.129289, -1.574053, 1, 0, 0, 1, 1,
-1.342687, 0.4013374, -0.2596534, 1, 0, 0, 1, 1,
-1.341176, 0.1305425, -0.5050938, 1, 0, 0, 1, 1,
-1.327546, 1.489447, -3.050933, 1, 0, 0, 1, 1,
-1.318645, 0.5140682, 0.07609688, 0, 0, 0, 1, 1,
-1.318105, 0.1773074, -0.7809302, 0, 0, 0, 1, 1,
-1.316982, -1.697556, -0.6518319, 0, 0, 0, 1, 1,
-1.310134, -0.2492833, -1.077115, 0, 0, 0, 1, 1,
-1.309452, 0.821075, -0.6828302, 0, 0, 0, 1, 1,
-1.309036, -0.0562974, -0.5450665, 0, 0, 0, 1, 1,
-1.307962, -0.003669025, -1.044053, 0, 0, 0, 1, 1,
-1.303151, 0.1427432, -2.541274, 1, 1, 1, 1, 1,
-1.301208, 0.255547, -1.156717, 1, 1, 1, 1, 1,
-1.29825, 1.582623, -0.3076743, 1, 1, 1, 1, 1,
-1.295881, 1.283586, -0.5764868, 1, 1, 1, 1, 1,
-1.285421, -0.7973444, -2.966128, 1, 1, 1, 1, 1,
-1.285197, 0.3767318, -2.036284, 1, 1, 1, 1, 1,
-1.272769, -0.07276311, -1.315124, 1, 1, 1, 1, 1,
-1.272413, -0.7479554, -0.6324263, 1, 1, 1, 1, 1,
-1.260638, 0.8215688, 0.4578219, 1, 1, 1, 1, 1,
-1.259814, -0.01792857, -3.353153, 1, 1, 1, 1, 1,
-1.256182, -1.605017, -0.7294946, 1, 1, 1, 1, 1,
-1.240909, -0.4173351, -0.722872, 1, 1, 1, 1, 1,
-1.239981, -0.4469841, -0.8101606, 1, 1, 1, 1, 1,
-1.218366, -0.3246394, 0.1106465, 1, 1, 1, 1, 1,
-1.218343, 0.08673558, -1.667882, 1, 1, 1, 1, 1,
-1.215628, -1.105036, -1.431664, 0, 0, 1, 1, 1,
-1.205262, 0.6040787, -0.379559, 1, 0, 0, 1, 1,
-1.204379, 1.037937, -0.2093458, 1, 0, 0, 1, 1,
-1.200193, -0.08894304, -1.393459, 1, 0, 0, 1, 1,
-1.197762, -1.485164, -1.760649, 1, 0, 0, 1, 1,
-1.194407, 1.222541, -0.571121, 1, 0, 0, 1, 1,
-1.177508, 1.332577, -3.344885, 0, 0, 0, 1, 1,
-1.176767, -1.966741, -1.356807, 0, 0, 0, 1, 1,
-1.174675, 0.4671132, -2.458254, 0, 0, 0, 1, 1,
-1.167843, 0.8938636, -1.911186, 0, 0, 0, 1, 1,
-1.164227, 0.2690796, -2.68238, 0, 0, 0, 1, 1,
-1.163793, 1.878139, -0.532129, 0, 0, 0, 1, 1,
-1.139358, -0.6657544, -2.952626, 0, 0, 0, 1, 1,
-1.13808, -1.634938, -4.104784, 1, 1, 1, 1, 1,
-1.135231, -0.3269923, -1.668457, 1, 1, 1, 1, 1,
-1.133457, 0.5106147, -1.58816, 1, 1, 1, 1, 1,
-1.130166, 1.39615, -2.274267, 1, 1, 1, 1, 1,
-1.128955, -0.1002046, -1.392142, 1, 1, 1, 1, 1,
-1.124422, -0.7983027, -2.575872, 1, 1, 1, 1, 1,
-1.121406, -0.6409947, -1.164082, 1, 1, 1, 1, 1,
-1.11555, 0.7067399, -2.110285, 1, 1, 1, 1, 1,
-1.111898, -1.263247, -1.978095, 1, 1, 1, 1, 1,
-1.111871, -1.30812, -1.741302, 1, 1, 1, 1, 1,
-1.107146, 1.012346, -0.6206552, 1, 1, 1, 1, 1,
-1.103497, 1.29145, 0.5777198, 1, 1, 1, 1, 1,
-1.102925, -1.041985, -2.826538, 1, 1, 1, 1, 1,
-1.08502, 0.8305886, 0.1294571, 1, 1, 1, 1, 1,
-1.082353, 1.11272, 0.7836352, 1, 1, 1, 1, 1,
-1.078968, 0.4053929, -2.799756, 0, 0, 1, 1, 1,
-1.077558, 1.809685, 0.1406699, 1, 0, 0, 1, 1,
-1.077539, -0.6165313, -2.593135, 1, 0, 0, 1, 1,
-1.072205, 0.1865428, -0.3384299, 1, 0, 0, 1, 1,
-1.07059, 0.007193462, -2.602886, 1, 0, 0, 1, 1,
-1.070467, -0.5461239, -1.801109, 1, 0, 0, 1, 1,
-1.064809, -1.624113, -2.924153, 0, 0, 0, 1, 1,
-1.060238, 0.6690112, -2.239857, 0, 0, 0, 1, 1,
-1.055599, 0.645529, 0.686325, 0, 0, 0, 1, 1,
-1.053836, -0.4243883, -2.936219, 0, 0, 0, 1, 1,
-1.043236, -1.062598, -3.437957, 0, 0, 0, 1, 1,
-1.034434, 0.6931368, -0.9967996, 0, 0, 0, 1, 1,
-1.025569, 0.359158, -0.1386359, 0, 0, 0, 1, 1,
-1.023071, 0.2493797, -2.049432, 1, 1, 1, 1, 1,
-1.023034, -0.2401659, -2.667086, 1, 1, 1, 1, 1,
-1.008711, -1.646597, -1.924753, 1, 1, 1, 1, 1,
-1.006644, -0.2634144, -0.9730203, 1, 1, 1, 1, 1,
-1.004782, 0.1423697, -0.008769972, 1, 1, 1, 1, 1,
-0.9933679, -0.07182637, -2.917748, 1, 1, 1, 1, 1,
-0.9863799, 1.555381, -1.307759, 1, 1, 1, 1, 1,
-0.9745157, 1.927581, -0.4823844, 1, 1, 1, 1, 1,
-0.9731855, 0.5997257, 0.2416878, 1, 1, 1, 1, 1,
-0.9645576, -1.089212, -1.407734, 1, 1, 1, 1, 1,
-0.9638265, -0.2154358, -1.968647, 1, 1, 1, 1, 1,
-0.9634225, -0.9409341, -1.101897, 1, 1, 1, 1, 1,
-0.9628033, -0.3963277, -1.861814, 1, 1, 1, 1, 1,
-0.9618821, -1.086253, -2.085544, 1, 1, 1, 1, 1,
-0.9618423, 1.991426, -1.38997, 1, 1, 1, 1, 1,
-0.9602975, 0.9644452, -0.1988124, 0, 0, 1, 1, 1,
-0.9583148, 0.1367273, -1.569467, 1, 0, 0, 1, 1,
-0.9559651, -0.859847, -0.5167949, 1, 0, 0, 1, 1,
-0.955619, 0.3957577, -0.8817989, 1, 0, 0, 1, 1,
-0.9540339, -2.234336, -2.540302, 1, 0, 0, 1, 1,
-0.953608, 0.235305, -0.3499124, 1, 0, 0, 1, 1,
-0.9383602, 0.7824965, -0.5746583, 0, 0, 0, 1, 1,
-0.934212, -1.983513, -1.379589, 0, 0, 0, 1, 1,
-0.9317293, 0.542732, -1.38458, 0, 0, 0, 1, 1,
-0.9306473, 0.791366, 0.04559897, 0, 0, 0, 1, 1,
-0.9301541, 0.6829402, -1.50255, 0, 0, 0, 1, 1,
-0.9170705, 1.28333, -1.4918, 0, 0, 0, 1, 1,
-0.9129217, 0.3200081, 0.8368666, 0, 0, 0, 1, 1,
-0.9089338, 0.3885621, -0.3100238, 1, 1, 1, 1, 1,
-0.906101, 0.9041485, 1.134372, 1, 1, 1, 1, 1,
-0.9031795, -0.8458235, -1.970697, 1, 1, 1, 1, 1,
-0.9011981, 1.479845, 0.2031939, 1, 1, 1, 1, 1,
-0.8863665, -0.8185226, -2.990221, 1, 1, 1, 1, 1,
-0.8861567, -0.9320508, 0.4691359, 1, 1, 1, 1, 1,
-0.8817481, 0.4054897, -1.744729, 1, 1, 1, 1, 1,
-0.8786191, 0.9617103, -1.442274, 1, 1, 1, 1, 1,
-0.8720353, -0.2321877, -1.071672, 1, 1, 1, 1, 1,
-0.8704597, -1.461732, -3.085632, 1, 1, 1, 1, 1,
-0.8688998, 0.7921162, -2.08005, 1, 1, 1, 1, 1,
-0.8684191, -0.5023964, -2.514952, 1, 1, 1, 1, 1,
-0.8677838, 1.030716, -1.9604, 1, 1, 1, 1, 1,
-0.8673144, -0.8165756, -1.681089, 1, 1, 1, 1, 1,
-0.8668548, 0.4722674, -2.112465, 1, 1, 1, 1, 1,
-0.8647004, 0.3619302, 0.6208917, 0, 0, 1, 1, 1,
-0.8553598, -1.44864, -1.458593, 1, 0, 0, 1, 1,
-0.8537207, 0.2981449, -1.36871, 1, 0, 0, 1, 1,
-0.8517427, -1.273694, -2.339638, 1, 0, 0, 1, 1,
-0.8488426, -2.27305, -3.282993, 1, 0, 0, 1, 1,
-0.8455437, -0.3817893, -3.00435, 1, 0, 0, 1, 1,
-0.83457, -0.02258541, -0.1705772, 0, 0, 0, 1, 1,
-0.8330051, 0.522095, -1.080504, 0, 0, 0, 1, 1,
-0.8314012, 0.3259345, -2.733326, 0, 0, 0, 1, 1,
-0.8252001, 0.3947355, -1.548335, 0, 0, 0, 1, 1,
-0.8217838, 0.9310393, -2.753207, 0, 0, 0, 1, 1,
-0.8202871, -1.171165, -4.494105, 0, 0, 0, 1, 1,
-0.8157654, 0.487343, 0.0745231, 0, 0, 0, 1, 1,
-0.8128146, 1.639229, -1.159184, 1, 1, 1, 1, 1,
-0.8110039, -0.173013, -1.871633, 1, 1, 1, 1, 1,
-0.8043805, -0.2114693, -0.9617166, 1, 1, 1, 1, 1,
-0.8023767, -1.712787, -4.479029, 1, 1, 1, 1, 1,
-0.7974707, 0.9119311, -0.2055677, 1, 1, 1, 1, 1,
-0.7954226, -0.1763754, -3.571352, 1, 1, 1, 1, 1,
-0.7927392, -1.614382, -1.983166, 1, 1, 1, 1, 1,
-0.7824765, -0.3129458, -1.82511, 1, 1, 1, 1, 1,
-0.7820632, -0.7689039, -2.04217, 1, 1, 1, 1, 1,
-0.7805287, 1.063658, 0.2185958, 1, 1, 1, 1, 1,
-0.7790136, 1.04041, 0.3106072, 1, 1, 1, 1, 1,
-0.777754, -0.3132918, -2.628486, 1, 1, 1, 1, 1,
-0.7754239, -1.434205, -4.104687, 1, 1, 1, 1, 1,
-0.7727804, -0.711629, -2.828146, 1, 1, 1, 1, 1,
-0.770772, -0.03583203, -1.734463, 1, 1, 1, 1, 1,
-0.7655305, 1.261593, -0.5352307, 0, 0, 1, 1, 1,
-0.7649013, 0.3554506, -3.428488, 1, 0, 0, 1, 1,
-0.763346, -1.125181, -2.886552, 1, 0, 0, 1, 1,
-0.7578709, 0.5525072, -2.63179, 1, 0, 0, 1, 1,
-0.7573085, -0.3743891, -3.746434, 1, 0, 0, 1, 1,
-0.7502398, -0.9570959, -2.484839, 1, 0, 0, 1, 1,
-0.7494696, -0.2462361, -1.200667, 0, 0, 0, 1, 1,
-0.749052, -0.07787717, -0.4610583, 0, 0, 0, 1, 1,
-0.7474195, -0.1697902, -1.981816, 0, 0, 0, 1, 1,
-0.7388286, -0.1803252, -1.809497, 0, 0, 0, 1, 1,
-0.7373101, -1.122638, -2.103019, 0, 0, 0, 1, 1,
-0.7371822, 0.4498079, -2.472537, 0, 0, 0, 1, 1,
-0.7371049, -0.01911924, -1.773081, 0, 0, 0, 1, 1,
-0.7367113, 0.8350748, 0.1070192, 1, 1, 1, 1, 1,
-0.7349045, 0.9936432, -0.6762052, 1, 1, 1, 1, 1,
-0.7321681, -3.066402, -2.858459, 1, 1, 1, 1, 1,
-0.7279407, -0.5513266, -0.7684489, 1, 1, 1, 1, 1,
-0.72192, 0.02942816, -1.647757, 1, 1, 1, 1, 1,
-0.7194818, -0.9661491, -1.971914, 1, 1, 1, 1, 1,
-0.7169076, 0.7170669, -0.02855321, 1, 1, 1, 1, 1,
-0.7133736, 1.121404, 0.3100137, 1, 1, 1, 1, 1,
-0.7128665, -0.1350501, -2.982753, 1, 1, 1, 1, 1,
-0.7119849, -0.1483675, -1.65172, 1, 1, 1, 1, 1,
-0.7060558, 0.7434533, -1.626032, 1, 1, 1, 1, 1,
-0.7059051, 0.811534, -1.275933, 1, 1, 1, 1, 1,
-0.7003098, 0.4564381, -2.424813, 1, 1, 1, 1, 1,
-0.6976865, 1.052005, -0.2856792, 1, 1, 1, 1, 1,
-0.6933931, -0.8290447, -3.287743, 1, 1, 1, 1, 1,
-0.6918629, 1.779142, -0.4749809, 0, 0, 1, 1, 1,
-0.6900169, -1.400922, -3.722699, 1, 0, 0, 1, 1,
-0.6899053, -1.141699, -0.8142631, 1, 0, 0, 1, 1,
-0.6889738, -0.8291883, -1.10779, 1, 0, 0, 1, 1,
-0.6870702, 2.092802, -1.100411, 1, 0, 0, 1, 1,
-0.6862879, -1.121579, -2.975098, 1, 0, 0, 1, 1,
-0.6824848, 0.002774512, -1.272261, 0, 0, 0, 1, 1,
-0.6682757, 1.147052, -2.176135, 0, 0, 0, 1, 1,
-0.666213, 0.1185532, -0.6915737, 0, 0, 0, 1, 1,
-0.665338, -0.1560712, -1.047593, 0, 0, 0, 1, 1,
-0.6621386, 0.3116473, -0.1363802, 0, 0, 0, 1, 1,
-0.6617888, 0.3434345, -2.020243, 0, 0, 0, 1, 1,
-0.6609515, 0.8233718, -0.3139343, 0, 0, 0, 1, 1,
-0.659151, -0.3902879, -1.73747, 1, 1, 1, 1, 1,
-0.6559224, -3.903999, -2.651248, 1, 1, 1, 1, 1,
-0.6545279, 1.415483, 0.6056292, 1, 1, 1, 1, 1,
-0.6513867, 0.4507726, 0.2914793, 1, 1, 1, 1, 1,
-0.6468034, -1.323163, -3.416675, 1, 1, 1, 1, 1,
-0.6427568, -1.906588, -3.55574, 1, 1, 1, 1, 1,
-0.6414077, 1.076648, -1.24186, 1, 1, 1, 1, 1,
-0.6340629, -0.1818056, -3.009898, 1, 1, 1, 1, 1,
-0.6285257, 1.539661, 2.568896, 1, 1, 1, 1, 1,
-0.6254472, 0.1597314, 0.2619197, 1, 1, 1, 1, 1,
-0.6252731, 1.64676, 1.159808, 1, 1, 1, 1, 1,
-0.6242759, 1.3016, -0.7211407, 1, 1, 1, 1, 1,
-0.6169557, 0.7639301, -0.4438348, 1, 1, 1, 1, 1,
-0.6160051, 0.09239502, -3.494033, 1, 1, 1, 1, 1,
-0.6137858, 0.2577875, -0.8159725, 1, 1, 1, 1, 1,
-0.6100765, 0.6193314, -0.6182518, 0, 0, 1, 1, 1,
-0.594315, 1.361578, 0.596943, 1, 0, 0, 1, 1,
-0.5921313, 1.446194, -1.549005, 1, 0, 0, 1, 1,
-0.5913829, 0.2411868, -2.67847, 1, 0, 0, 1, 1,
-0.588878, 0.317738, 0.1871085, 1, 0, 0, 1, 1,
-0.5870059, 0.1354562, -2.18134, 1, 0, 0, 1, 1,
-0.5808829, 0.1877944, -2.394793, 0, 0, 0, 1, 1,
-0.5795639, 0.4893058, -0.8457565, 0, 0, 0, 1, 1,
-0.5789365, 1.714075, 0.1921585, 0, 0, 0, 1, 1,
-0.5761692, -0.8502178, -0.614459, 0, 0, 0, 1, 1,
-0.5755332, -0.6719401, -2.722284, 0, 0, 0, 1, 1,
-0.57165, -0.6718938, -2.561559, 0, 0, 0, 1, 1,
-0.5694162, -0.6781639, -2.626603, 0, 0, 0, 1, 1,
-0.5676119, 0.5695086, -2.600589, 1, 1, 1, 1, 1,
-0.5662295, 0.5539384, 0.9340445, 1, 1, 1, 1, 1,
-0.5597245, 0.516813, -0.5431961, 1, 1, 1, 1, 1,
-0.5552509, 0.9451368, -2.828435, 1, 1, 1, 1, 1,
-0.5533979, 1.416445, 0.2543798, 1, 1, 1, 1, 1,
-0.5525013, -1.126153, -2.274475, 1, 1, 1, 1, 1,
-0.551461, -0.6205636, -2.903402, 1, 1, 1, 1, 1,
-0.5510083, -0.4172452, -2.0036, 1, 1, 1, 1, 1,
-0.5464834, 0.738827, -1.474682, 1, 1, 1, 1, 1,
-0.5383728, -0.07782445, -1.337853, 1, 1, 1, 1, 1,
-0.537078, -0.1100614, -1.794238, 1, 1, 1, 1, 1,
-0.5353867, -0.4038218, -2.440394, 1, 1, 1, 1, 1,
-0.5345483, -0.4764196, -2.024134, 1, 1, 1, 1, 1,
-0.5289021, -1.544074, -3.407766, 1, 1, 1, 1, 1,
-0.5257864, 0.4088095, 0.8953567, 1, 1, 1, 1, 1,
-0.5242726, -0.1922525, -0.8959039, 0, 0, 1, 1, 1,
-0.5170032, 1.35016, -0.5701414, 1, 0, 0, 1, 1,
-0.5152737, 0.5534866, -0.02326163, 1, 0, 0, 1, 1,
-0.5129279, -1.447777, -3.05631, 1, 0, 0, 1, 1,
-0.5106203, -0.2179357, -2.480668, 1, 0, 0, 1, 1,
-0.5102988, -0.9632872, -2.15122, 1, 0, 0, 1, 1,
-0.5094953, 0.2232544, -0.9159501, 0, 0, 0, 1, 1,
-0.5073513, 0.8456016, 0.13485, 0, 0, 0, 1, 1,
-0.5042586, -0.1409428, -0.7988433, 0, 0, 0, 1, 1,
-0.4944384, -1.733194, -1.984847, 0, 0, 0, 1, 1,
-0.493107, 1.730597, -1.996015, 0, 0, 0, 1, 1,
-0.4923382, 1.516115, 0.7077532, 0, 0, 0, 1, 1,
-0.4905306, -0.3302735, -2.636828, 0, 0, 0, 1, 1,
-0.4887639, 0.81236, -0.1673331, 1, 1, 1, 1, 1,
-0.4858053, 0.9945109, -2.407935, 1, 1, 1, 1, 1,
-0.4837048, -0.6103112, -3.616261, 1, 1, 1, 1, 1,
-0.4789602, 1.432585, 1.834819, 1, 1, 1, 1, 1,
-0.4775407, -0.7160431, -3.485385, 1, 1, 1, 1, 1,
-0.4758656, 0.7275881, -0.6739732, 1, 1, 1, 1, 1,
-0.4754314, 0.8918134, -0.01187786, 1, 1, 1, 1, 1,
-0.4702736, -0.2801975, -2.472155, 1, 1, 1, 1, 1,
-0.4659705, -1.00141, -4.172964, 1, 1, 1, 1, 1,
-0.465185, 0.0974015, -1.356362, 1, 1, 1, 1, 1,
-0.4649796, 0.4653812, 0.1703418, 1, 1, 1, 1, 1,
-0.4623111, 0.2759193, -0.566614, 1, 1, 1, 1, 1,
-0.4603455, -1.039615, -3.244909, 1, 1, 1, 1, 1,
-0.4599037, -1.917924, -3.599925, 1, 1, 1, 1, 1,
-0.4483852, -0.06899883, -2.008571, 1, 1, 1, 1, 1,
-0.4465442, 0.3759828, -0.6555321, 0, 0, 1, 1, 1,
-0.4463946, 0.07791393, 0.9197809, 1, 0, 0, 1, 1,
-0.4452528, -0.4362081, -2.00707, 1, 0, 0, 1, 1,
-0.4414901, 2.271637, -0.6781762, 1, 0, 0, 1, 1,
-0.440434, -0.7295502, -2.607771, 1, 0, 0, 1, 1,
-0.440355, 0.04102249, -2.920622, 1, 0, 0, 1, 1,
-0.4397891, 0.7356148, -0.1353128, 0, 0, 0, 1, 1,
-0.4380956, 0.2024131, -1.651577, 0, 0, 0, 1, 1,
-0.4367423, 0.719597, -2.23618, 0, 0, 0, 1, 1,
-0.4353203, 0.3379112, -1.794165, 0, 0, 0, 1, 1,
-0.4339664, 0.9761683, 0.2559482, 0, 0, 0, 1, 1,
-0.432277, 1.987014, 2.667477, 0, 0, 0, 1, 1,
-0.4319423, -0.4309658, -3.224798, 0, 0, 0, 1, 1,
-0.4316734, -0.648405, -2.297669, 1, 1, 1, 1, 1,
-0.4308828, 1.749962, -1.873245, 1, 1, 1, 1, 1,
-0.4287836, -0.499728, -2.003132, 1, 1, 1, 1, 1,
-0.4284595, 0.7451924, 1.668865, 1, 1, 1, 1, 1,
-0.4260767, 0.5841354, -1.448592, 1, 1, 1, 1, 1,
-0.4251789, -0.120217, -2.617135, 1, 1, 1, 1, 1,
-0.4166698, 0.5544522, -1.593542, 1, 1, 1, 1, 1,
-0.4144693, -0.9107233, -1.801155, 1, 1, 1, 1, 1,
-0.4130616, 0.7187725, -1.51541, 1, 1, 1, 1, 1,
-0.4090017, -0.08761697, -2.684814, 1, 1, 1, 1, 1,
-0.407591, 0.338828, -0.7559115, 1, 1, 1, 1, 1,
-0.4057436, 0.6671743, -0.1246935, 1, 1, 1, 1, 1,
-0.4014923, -0.3494814, -1.827025, 1, 1, 1, 1, 1,
-0.3861549, -1.029718, -3.66698, 1, 1, 1, 1, 1,
-0.385878, 1.153336, -1.815313, 1, 1, 1, 1, 1,
-0.3783446, -0.947084, -3.739563, 0, 0, 1, 1, 1,
-0.3749965, -0.9985334, -4.536049, 1, 0, 0, 1, 1,
-0.3739142, -0.05317064, -1.988575, 1, 0, 0, 1, 1,
-0.3730413, 0.9153546, 1.720491, 1, 0, 0, 1, 1,
-0.364434, -0.02202448, -2.710238, 1, 0, 0, 1, 1,
-0.364256, 0.6249903, -1.979233, 1, 0, 0, 1, 1,
-0.3631637, 0.2011991, -1.420163, 0, 0, 0, 1, 1,
-0.3621234, 0.1374256, -3.195637, 0, 0, 0, 1, 1,
-0.3618979, 0.1511313, -1.295455, 0, 0, 0, 1, 1,
-0.3617961, -0.4399544, -1.354437, 0, 0, 0, 1, 1,
-0.3588954, -1.711355, -2.973342, 0, 0, 0, 1, 1,
-0.3583477, -0.007261751, -2.671538, 0, 0, 0, 1, 1,
-0.354035, -0.1260516, -1.774944, 0, 0, 0, 1, 1,
-0.3505026, -1.393242, -2.648796, 1, 1, 1, 1, 1,
-0.3491871, 1.378705, -0.3833692, 1, 1, 1, 1, 1,
-0.3464524, 1.09451, -1.529701, 1, 1, 1, 1, 1,
-0.3457808, 1.178161, -0.9866953, 1, 1, 1, 1, 1,
-0.3451, 2.409036, 2.662771, 1, 1, 1, 1, 1,
-0.3410608, 0.008355249, -1.396687, 1, 1, 1, 1, 1,
-0.3397581, -1.163357, -3.386945, 1, 1, 1, 1, 1,
-0.3366812, 1.161086, 0.6199004, 1, 1, 1, 1, 1,
-0.331109, -0.6601719, -2.582385, 1, 1, 1, 1, 1,
-0.3281752, 0.7736982, 0.6164351, 1, 1, 1, 1, 1,
-0.3277427, 0.7001652, -0.1469015, 1, 1, 1, 1, 1,
-0.3254922, -0.0006909962, -0.8408075, 1, 1, 1, 1, 1,
-0.3239274, 1.27019, 0.9431856, 1, 1, 1, 1, 1,
-0.3214086, -1.877901, -2.863167, 1, 1, 1, 1, 1,
-0.3193642, -1.322021, -2.772131, 1, 1, 1, 1, 1,
-0.3084805, 1.410266, -1.03425, 0, 0, 1, 1, 1,
-0.3083985, -1.919941, -1.353159, 1, 0, 0, 1, 1,
-0.308079, 1.703388, 0.3720376, 1, 0, 0, 1, 1,
-0.3010834, 0.6456286, -3.031576, 1, 0, 0, 1, 1,
-0.2980467, -0.3573681, -2.57484, 1, 0, 0, 1, 1,
-0.2978385, 1.103135, -0.5941786, 1, 0, 0, 1, 1,
-0.2954886, -0.4146326, -2.78002, 0, 0, 0, 1, 1,
-0.2939121, -0.540658, -2.845497, 0, 0, 0, 1, 1,
-0.291675, -0.2706701, -1.826434, 0, 0, 0, 1, 1,
-0.2909029, 0.8087267, -1.752287, 0, 0, 0, 1, 1,
-0.290757, -0.7964021, -2.940767, 0, 0, 0, 1, 1,
-0.2896304, 0.3458529, -0.7268651, 0, 0, 0, 1, 1,
-0.2878212, 1.604147, -1.222279, 0, 0, 0, 1, 1,
-0.2861701, 0.4753762, 0.8034401, 1, 1, 1, 1, 1,
-0.2853135, -0.707449, -3.179896, 1, 1, 1, 1, 1,
-0.2831881, -0.08018968, -0.8753078, 1, 1, 1, 1, 1,
-0.2800652, -0.3791491, -1.078408, 1, 1, 1, 1, 1,
-0.276485, 0.8114306, -0.7772743, 1, 1, 1, 1, 1,
-0.2719768, -0.03067753, -1.211285, 1, 1, 1, 1, 1,
-0.2700461, 0.7297673, -1.738015, 1, 1, 1, 1, 1,
-0.2699458, 0.1196722, -1.809391, 1, 1, 1, 1, 1,
-0.2694574, -0.1378538, -3.541341, 1, 1, 1, 1, 1,
-0.267976, -1.023449, -3.638017, 1, 1, 1, 1, 1,
-0.266235, -0.1654399, -0.6978998, 1, 1, 1, 1, 1,
-0.2635534, 1.070329, -0.2385177, 1, 1, 1, 1, 1,
-0.2594626, 0.7701564, -0.2710449, 1, 1, 1, 1, 1,
-0.2584594, 0.3957058, -1.274989, 1, 1, 1, 1, 1,
-0.2548648, 0.03558014, -0.9115013, 1, 1, 1, 1, 1,
-0.2548213, -1.652333, -4.613798, 0, 0, 1, 1, 1,
-0.2500511, 1.363345, 0.9622416, 1, 0, 0, 1, 1,
-0.2495517, -1.05817, -2.061423, 1, 0, 0, 1, 1,
-0.2483548, 0.2800509, 0.2566529, 1, 0, 0, 1, 1,
-0.2461331, 0.472801, 0.50499, 1, 0, 0, 1, 1,
-0.2440777, 0.4438655, 0.7053531, 1, 0, 0, 1, 1,
-0.2439454, 1.163446, -0.1786289, 0, 0, 0, 1, 1,
-0.242014, 0.3913799, -1.366057, 0, 0, 0, 1, 1,
-0.2412589, 0.5009631, -0.6565446, 0, 0, 0, 1, 1,
-0.2362614, 0.4297279, 0.8315709, 0, 0, 0, 1, 1,
-0.2360053, 0.163443, -0.3299851, 0, 0, 0, 1, 1,
-0.2337539, 0.1215198, -2.337514, 0, 0, 0, 1, 1,
-0.2325475, 0.4051436, 0.7229893, 0, 0, 0, 1, 1,
-0.232435, -1.592558, -4.450359, 1, 1, 1, 1, 1,
-0.228846, 0.01245191, -1.412653, 1, 1, 1, 1, 1,
-0.2226424, 0.7994118, 1.10242, 1, 1, 1, 1, 1,
-0.2171708, 1.118848, 0.6994633, 1, 1, 1, 1, 1,
-0.2165943, 1.501496, 0.6232662, 1, 1, 1, 1, 1,
-0.2102791, -0.6931629, -1.692135, 1, 1, 1, 1, 1,
-0.2067261, 1.268131, -0.2258056, 1, 1, 1, 1, 1,
-0.2028785, 0.03295418, -0.9847539, 1, 1, 1, 1, 1,
-0.1935719, -1.338442, -3.778245, 1, 1, 1, 1, 1,
-0.1918653, 2.526114, -0.4329084, 1, 1, 1, 1, 1,
-0.1903086, 0.09575876, -0.6742032, 1, 1, 1, 1, 1,
-0.1901509, 0.2294981, -1.508329, 1, 1, 1, 1, 1,
-0.1871673, 0.4478462, -0.833465, 1, 1, 1, 1, 1,
-0.1861764, 0.6007609, -1.260193, 1, 1, 1, 1, 1,
-0.1825185, 0.4069394, -0.6461153, 1, 1, 1, 1, 1,
-0.178987, -0.7472529, -4.912529, 0, 0, 1, 1, 1,
-0.1781358, 0.849305, -0.5162128, 1, 0, 0, 1, 1,
-0.1731841, 0.3223697, -0.1521975, 1, 0, 0, 1, 1,
-0.1664977, -0.529758, -3.04205, 1, 0, 0, 1, 1,
-0.1638414, -0.4060005, -3.577651, 1, 0, 0, 1, 1,
-0.1633413, 0.41531, 1.462319, 1, 0, 0, 1, 1,
-0.1623871, -0.4994744, -2.697581, 0, 0, 0, 1, 1,
-0.1611035, 1.125704, 0.4208969, 0, 0, 0, 1, 1,
-0.1605913, 0.07805355, -0.1098165, 0, 0, 0, 1, 1,
-0.1600216, 0.910179, 1.182512, 0, 0, 0, 1, 1,
-0.1586976, -2.003344, -2.903841, 0, 0, 0, 1, 1,
-0.1578365, 0.2287835, 0.2361543, 0, 0, 0, 1, 1,
-0.1552529, 0.005816735, -0.1158575, 0, 0, 0, 1, 1,
-0.1533772, 0.5854313, 0.3359246, 1, 1, 1, 1, 1,
-0.1481476, 0.8897618, 1.017939, 1, 1, 1, 1, 1,
-0.1438291, 0.490761, -1.142311, 1, 1, 1, 1, 1,
-0.1400985, 1.239285, 0.508311, 1, 1, 1, 1, 1,
-0.1390488, -0.3696235, -2.359859, 1, 1, 1, 1, 1,
-0.1379375, -0.6476837, -2.010989, 1, 1, 1, 1, 1,
-0.1293556, -0.4074115, -3.958356, 1, 1, 1, 1, 1,
-0.1292946, 0.5091879, -0.4107727, 1, 1, 1, 1, 1,
-0.127999, -0.4336928, -2.540098, 1, 1, 1, 1, 1,
-0.1226534, -2.289069, -3.718886, 1, 1, 1, 1, 1,
-0.1215694, 0.2496048, 0.248697, 1, 1, 1, 1, 1,
-0.1208239, 1.17997, -0.6499339, 1, 1, 1, 1, 1,
-0.107524, 0.1863218, 2.181565, 1, 1, 1, 1, 1,
-0.1070978, 0.5077095, -1.524283, 1, 1, 1, 1, 1,
-0.1065233, 0.9724032, -2.284811, 1, 1, 1, 1, 1,
-0.09868228, 1.882579, 0.1202069, 0, 0, 1, 1, 1,
-0.09798016, -2.090371, -2.773489, 1, 0, 0, 1, 1,
-0.09617818, -0.4703626, -3.79223, 1, 0, 0, 1, 1,
-0.09548683, 0.9493323, -0.3823748, 1, 0, 0, 1, 1,
-0.09435178, -0.5274981, -1.889862, 1, 0, 0, 1, 1,
-0.09400296, -0.7722743, -3.623306, 1, 0, 0, 1, 1,
-0.09287975, -0.4423401, -5.323336, 0, 0, 0, 1, 1,
-0.08973313, 1.024984, -0.7941366, 0, 0, 0, 1, 1,
-0.08643405, 2.362012, -1.173263, 0, 0, 0, 1, 1,
-0.08637543, 0.401476, -1.304619, 0, 0, 0, 1, 1,
-0.08534317, -1.130465, -3.010664, 0, 0, 0, 1, 1,
-0.08195484, -0.05017967, -1.87848, 0, 0, 0, 1, 1,
-0.08126056, 0.9033952, -0.8771895, 0, 0, 0, 1, 1,
-0.07931244, 0.5744647, -1.638562, 1, 1, 1, 1, 1,
-0.07877858, 0.2700725, 0.05939701, 1, 1, 1, 1, 1,
-0.07476217, 2.670373, -0.1845062, 1, 1, 1, 1, 1,
-0.07063753, -0.2165346, -1.184408, 1, 1, 1, 1, 1,
-0.06886008, 1.677945, 1.246668, 1, 1, 1, 1, 1,
-0.06366494, -0.8114199, -3.556301, 1, 1, 1, 1, 1,
-0.06210783, 0.8072745, -1.161763, 1, 1, 1, 1, 1,
-0.06132049, -1.461681, -2.936166, 1, 1, 1, 1, 1,
-0.05395838, 0.2122134, -0.8614464, 1, 1, 1, 1, 1,
-0.04842766, 0.726536, -0.5601378, 1, 1, 1, 1, 1,
-0.04834527, -0.9985713, -2.98862, 1, 1, 1, 1, 1,
-0.04788005, 1.13675, 1.167466, 1, 1, 1, 1, 1,
-0.04756328, 0.4256078, 0.2000576, 1, 1, 1, 1, 1,
-0.04540476, -1.689419, -2.567549, 1, 1, 1, 1, 1,
-0.04384346, -0.9325184, -1.679681, 1, 1, 1, 1, 1,
-0.03362159, 0.7570341, 0.8871661, 0, 0, 1, 1, 1,
-0.02979449, 0.9817166, -0.9981877, 1, 0, 0, 1, 1,
-0.02539928, -1.022109, -3.866902, 1, 0, 0, 1, 1,
-0.02405788, 0.1884264, -0.9381839, 1, 0, 0, 1, 1,
-0.02369796, -0.06423597, -3.495004, 1, 0, 0, 1, 1,
-0.02126383, -0.5325935, -1.396377, 1, 0, 0, 1, 1,
-0.01724147, 1.022393, -1.09282, 0, 0, 0, 1, 1,
-0.01515405, -1.087775, -1.245236, 0, 0, 0, 1, 1,
-0.01131916, -0.5127343, -3.647345, 0, 0, 0, 1, 1,
-0.01037611, 0.4586618, -1.234651, 0, 0, 0, 1, 1,
-0.01001038, 1.568213, 1.015657, 0, 0, 0, 1, 1,
-0.009730356, 0.2410093, 1.441092, 0, 0, 0, 1, 1,
-0.009626237, -0.9830009, -3.367055, 0, 0, 0, 1, 1,
0.0004727351, -1.264477, 1.930199, 1, 1, 1, 1, 1,
0.004104682, -0.4636927, 2.279099, 1, 1, 1, 1, 1,
0.004338683, 0.367278, -1.378281, 1, 1, 1, 1, 1,
0.01420739, 0.8944071, -1.144969, 1, 1, 1, 1, 1,
0.01975274, 0.3247974, 0.8385845, 1, 1, 1, 1, 1,
0.02164535, 1.29496, -1.123043, 1, 1, 1, 1, 1,
0.02282829, 1.180526, -0.5672113, 1, 1, 1, 1, 1,
0.02424186, 1.187298, 0.2033478, 1, 1, 1, 1, 1,
0.02554695, 0.6511831, 0.2401411, 1, 1, 1, 1, 1,
0.02748362, -0.07020076, 1.726188, 1, 1, 1, 1, 1,
0.02779564, 0.04268497, -0.2040221, 1, 1, 1, 1, 1,
0.03287929, -1.619249, 2.779492, 1, 1, 1, 1, 1,
0.03954008, 0.03827741, -0.9522211, 1, 1, 1, 1, 1,
0.04007214, 0.3455986, 0.9173006, 1, 1, 1, 1, 1,
0.04460294, -0.4765729, 0.3629727, 1, 1, 1, 1, 1,
0.04832909, 1.362519, 0.3513726, 0, 0, 1, 1, 1,
0.05010606, -1.598011, 1.169984, 1, 0, 0, 1, 1,
0.05532891, -0.9745427, 3.012056, 1, 0, 0, 1, 1,
0.05561834, 1.258432, 0.8730232, 1, 0, 0, 1, 1,
0.05615772, -0.9908699, 4.089485, 1, 0, 0, 1, 1,
0.05622353, -0.2431252, 3.797837, 1, 0, 0, 1, 1,
0.05840996, 0.3663274, -1.599984, 0, 0, 0, 1, 1,
0.06035255, -0.6695489, 1.840563, 0, 0, 0, 1, 1,
0.06128175, -0.2295529, 3.404282, 0, 0, 0, 1, 1,
0.06506613, 0.5837203, -0.4237262, 0, 0, 0, 1, 1,
0.06584521, 0.2436522, 0.1602411, 0, 0, 0, 1, 1,
0.06595501, 1.623405, -0.867988, 0, 0, 0, 1, 1,
0.07407758, 0.3425527, -0.1955159, 0, 0, 0, 1, 1,
0.07668205, 1.001722, -0.6470443, 1, 1, 1, 1, 1,
0.0773069, -0.1039229, 2.327347, 1, 1, 1, 1, 1,
0.08129566, 0.2082775, -0.5030593, 1, 1, 1, 1, 1,
0.08143234, -0.9714534, 1.741032, 1, 1, 1, 1, 1,
0.08375777, 1.52731, 0.66766, 1, 1, 1, 1, 1,
0.0838889, 1.724458, -0.6573123, 1, 1, 1, 1, 1,
0.0875636, -0.5790221, 3.931269, 1, 1, 1, 1, 1,
0.08940747, 0.0397199, 2.328579, 1, 1, 1, 1, 1,
0.09088252, -0.324526, 3.367976, 1, 1, 1, 1, 1,
0.09229871, -0.1408211, 0.9869972, 1, 1, 1, 1, 1,
0.09430961, -2.455, 3.525572, 1, 1, 1, 1, 1,
0.09460204, 0.4665402, 1.233247, 1, 1, 1, 1, 1,
0.0965796, -0.2712453, 1.930473, 1, 1, 1, 1, 1,
0.09823219, -0.5089123, 1.501775, 1, 1, 1, 1, 1,
0.09856269, -2.553461, 3.833672, 1, 1, 1, 1, 1,
0.110955, -0.9606008, 2.213829, 0, 0, 1, 1, 1,
0.1119198, 0.01769535, 0.7206938, 1, 0, 0, 1, 1,
0.1183631, 0.6625292, 0.3570889, 1, 0, 0, 1, 1,
0.1212752, 0.2875502, 0.5001774, 1, 0, 0, 1, 1,
0.121358, 0.7213092, -0.09950494, 1, 0, 0, 1, 1,
0.1221729, 1.460723, -1.763184, 1, 0, 0, 1, 1,
0.1224903, 1.358842, 1.508366, 0, 0, 0, 1, 1,
0.1243902, -0.7951738, 4.246346, 0, 0, 0, 1, 1,
0.1249227, -0.2612894, 2.547242, 0, 0, 0, 1, 1,
0.1251419, 0.2623753, -0.4265961, 0, 0, 0, 1, 1,
0.125508, 0.5269811, 0.03701918, 0, 0, 0, 1, 1,
0.1288873, 1.062746, -0.4990854, 0, 0, 0, 1, 1,
0.1334808, -0.3210247, 4.40854, 0, 0, 0, 1, 1,
0.1351028, -0.3809883, 2.997354, 1, 1, 1, 1, 1,
0.1361369, 1.351027, 0.6835748, 1, 1, 1, 1, 1,
0.1419221, 0.7066458, 0.2301441, 1, 1, 1, 1, 1,
0.1434882, 0.3099258, -0.6411348, 1, 1, 1, 1, 1,
0.143687, -0.3192265, 1.854764, 1, 1, 1, 1, 1,
0.1452424, -0.6099581, 1.819938, 1, 1, 1, 1, 1,
0.1468207, -0.169706, 2.850234, 1, 1, 1, 1, 1,
0.1468928, 0.5189435, 1.437994, 1, 1, 1, 1, 1,
0.1473192, -0.3288125, 1.31934, 1, 1, 1, 1, 1,
0.1591848, -0.282101, 1.889655, 1, 1, 1, 1, 1,
0.160123, 0.2223504, 0.5962667, 1, 1, 1, 1, 1,
0.1621699, 1.117133, 1.097197, 1, 1, 1, 1, 1,
0.1625579, -0.1169773, 1.439369, 1, 1, 1, 1, 1,
0.1646092, -1.601611, 2.266449, 1, 1, 1, 1, 1,
0.1659348, 2.200105, 1.046681, 1, 1, 1, 1, 1,
0.1770401, -0.3459957, 2.9885, 0, 0, 1, 1, 1,
0.1806533, 0.8447978, 0.6308594, 1, 0, 0, 1, 1,
0.1835214, -0.6031697, 3.945326, 1, 0, 0, 1, 1,
0.1958191, -0.9971315, 4.22077, 1, 0, 0, 1, 1,
0.1961871, 0.7435334, 0.3884822, 1, 0, 0, 1, 1,
0.196892, 0.1145723, -0.903134, 1, 0, 0, 1, 1,
0.198454, -1.744898, 2.633176, 0, 0, 0, 1, 1,
0.2020261, -0.8623198, 2.812542, 0, 0, 0, 1, 1,
0.2114748, 0.09774104, 1.703755, 0, 0, 0, 1, 1,
0.2141465, -0.4968239, 2.399489, 0, 0, 0, 1, 1,
0.2209229, -0.06544859, 1.349253, 0, 0, 0, 1, 1,
0.222518, -0.3783581, 2.585323, 0, 0, 0, 1, 1,
0.2327502, 1.448789, 1.225324, 0, 0, 0, 1, 1,
0.2333437, -1.760297, 3.534519, 1, 1, 1, 1, 1,
0.238166, -1.372696, 3.523348, 1, 1, 1, 1, 1,
0.2421061, 0.1994144, 0.5432138, 1, 1, 1, 1, 1,
0.2446878, -2.176615, 3.222015, 1, 1, 1, 1, 1,
0.2476446, 0.6237811, -1.139337, 1, 1, 1, 1, 1,
0.2496826, 0.4101805, 0.2282983, 1, 1, 1, 1, 1,
0.2507415, 0.02849692, 1.069165, 1, 1, 1, 1, 1,
0.2519477, 2.145807, 0.3904712, 1, 1, 1, 1, 1,
0.2608547, 0.4935803, 0.7809631, 1, 1, 1, 1, 1,
0.261168, 0.246115, 1.363685, 1, 1, 1, 1, 1,
0.2614908, -0.3147753, 2.894097, 1, 1, 1, 1, 1,
0.2640564, 0.7056888, -0.7097224, 1, 1, 1, 1, 1,
0.2707714, 0.4735776, -0.8258541, 1, 1, 1, 1, 1,
0.2745099, -1.081785, 2.065456, 1, 1, 1, 1, 1,
0.2758796, -0.555333, 3.527248, 1, 1, 1, 1, 1,
0.2780846, 0.9217121, -0.6076273, 0, 0, 1, 1, 1,
0.2800271, 0.09096997, 1.318723, 1, 0, 0, 1, 1,
0.2903193, -0.1557937, 2.147694, 1, 0, 0, 1, 1,
0.2905779, 1.274839, 0.1012157, 1, 0, 0, 1, 1,
0.2910868, 1.113547, -0.4197539, 1, 0, 0, 1, 1,
0.2991168, 2.248622, -0.1646972, 1, 0, 0, 1, 1,
0.3010088, -1.26268, 1.737463, 0, 0, 0, 1, 1,
0.3023797, -0.6047923, 3.357095, 0, 0, 0, 1, 1,
0.3055858, 0.006998992, 1.985744, 0, 0, 0, 1, 1,
0.3142626, 2.374088, 0.1267971, 0, 0, 0, 1, 1,
0.3172302, -0.3949447, 2.533217, 0, 0, 0, 1, 1,
0.3215831, -0.4585558, 1.792662, 0, 0, 0, 1, 1,
0.3232572, -0.7300957, 2.37993, 0, 0, 0, 1, 1,
0.3243956, -1.327073, 1.737696, 1, 1, 1, 1, 1,
0.3296691, 0.3193173, -1.01282, 1, 1, 1, 1, 1,
0.330739, 1.391551, 1.504344, 1, 1, 1, 1, 1,
0.3329678, -1.81595, 1.322011, 1, 1, 1, 1, 1,
0.341126, 0.8200268, 1.203145, 1, 1, 1, 1, 1,
0.3487531, -0.711951, 2.937288, 1, 1, 1, 1, 1,
0.3490986, 0.09221669, 1.504099, 1, 1, 1, 1, 1,
0.3516166, 1.299425, 1.615691, 1, 1, 1, 1, 1,
0.353095, 0.6714416, 0.3018844, 1, 1, 1, 1, 1,
0.3532442, -0.4211417, 1.01949, 1, 1, 1, 1, 1,
0.3605531, 0.2140087, 2.58739, 1, 1, 1, 1, 1,
0.3630577, -0.2392221, 0.5915672, 1, 1, 1, 1, 1,
0.3669537, 0.4475416, -1.513358, 1, 1, 1, 1, 1,
0.3694329, 0.8358334, 1.06624, 1, 1, 1, 1, 1,
0.3712231, 0.2974391, 0.01887429, 1, 1, 1, 1, 1,
0.3761232, 0.9514502, 0.7836869, 0, 0, 1, 1, 1,
0.378523, -0.2802492, 1.183257, 1, 0, 0, 1, 1,
0.3803404, 0.03232467, 0.7964921, 1, 0, 0, 1, 1,
0.3804939, -0.8118033, 1.104499, 1, 0, 0, 1, 1,
0.3841847, 0.6516807, -0.6366176, 1, 0, 0, 1, 1,
0.3918923, -1.194062, 4.325956, 1, 0, 0, 1, 1,
0.3934521, 0.9449566, -0.08228063, 0, 0, 0, 1, 1,
0.3965729, -0.7003594, 2.683162, 0, 0, 0, 1, 1,
0.3977123, 0.1313462, 0.6212746, 0, 0, 0, 1, 1,
0.4005759, -0.8590815, 4.223643, 0, 0, 0, 1, 1,
0.4011096, -2.404119, 2.410031, 0, 0, 0, 1, 1,
0.4016444, -0.4905339, 2.602945, 0, 0, 0, 1, 1,
0.4018612, -1.099826, 2.636117, 0, 0, 0, 1, 1,
0.403938, -0.08942677, 0.9989674, 1, 1, 1, 1, 1,
0.4055032, -1.202772, 3.740702, 1, 1, 1, 1, 1,
0.4074927, -0.2996765, 2.245182, 1, 1, 1, 1, 1,
0.4092915, -0.1286838, -0.3592953, 1, 1, 1, 1, 1,
0.4115089, 0.4417328, 2.456616, 1, 1, 1, 1, 1,
0.4120447, 0.3813731, 2.09515, 1, 1, 1, 1, 1,
0.4146113, -0.306574, 1.198172, 1, 1, 1, 1, 1,
0.4153754, 1.798303, -1.305316, 1, 1, 1, 1, 1,
0.4177537, 1.957124, 0.4678865, 1, 1, 1, 1, 1,
0.4188202, -0.09585731, 3.052023, 1, 1, 1, 1, 1,
0.4192645, -1.37026, 2.165588, 1, 1, 1, 1, 1,
0.4239163, 0.7197447, -0.5823212, 1, 1, 1, 1, 1,
0.4285191, -0.9293636, 1.532648, 1, 1, 1, 1, 1,
0.4291273, 0.5515771, 1.17688, 1, 1, 1, 1, 1,
0.4373628, -1.088629, 2.73166, 1, 1, 1, 1, 1,
0.4391896, 0.2316294, 1.231435, 0, 0, 1, 1, 1,
0.4418568, -1.020187, 2.45588, 1, 0, 0, 1, 1,
0.4439501, 1.003915, 0.05744878, 1, 0, 0, 1, 1,
0.4447529, 0.9971142, 0.6099908, 1, 0, 0, 1, 1,
0.4451978, -1.038146, 3.600927, 1, 0, 0, 1, 1,
0.447359, 0.8933523, -1.634229, 1, 0, 0, 1, 1,
0.450912, 0.3329548, 1.364897, 0, 0, 0, 1, 1,
0.4518511, 0.9861552, -0.181782, 0, 0, 0, 1, 1,
0.4523375, -0.6124658, 2.086758, 0, 0, 0, 1, 1,
0.4550919, 0.1943098, -0.5076756, 0, 0, 0, 1, 1,
0.4551391, 0.5627779, -0.5494773, 0, 0, 0, 1, 1,
0.4555809, 1.157915, 0.1351794, 0, 0, 0, 1, 1,
0.4560998, 2.988127, -0.8266189, 0, 0, 0, 1, 1,
0.4600336, -0.1382742, 2.378264, 1, 1, 1, 1, 1,
0.4638463, -0.274745, 3.786303, 1, 1, 1, 1, 1,
0.4727601, 0.8008874, 2.864107, 1, 1, 1, 1, 1,
0.4753788, -0.4922158, 2.375939, 1, 1, 1, 1, 1,
0.476256, -0.1412687, 1.204883, 1, 1, 1, 1, 1,
0.4790844, -0.01764402, 3.315269, 1, 1, 1, 1, 1,
0.4820336, -0.03054873, 3.120338, 1, 1, 1, 1, 1,
0.4828965, -0.139009, 0.9867628, 1, 1, 1, 1, 1,
0.4883111, 1.21913, -1.169658, 1, 1, 1, 1, 1,
0.4924396, -1.295192, 3.382901, 1, 1, 1, 1, 1,
0.4969617, -1.428178, 0.5901819, 1, 1, 1, 1, 1,
0.4982314, -0.5298052, 1.199641, 1, 1, 1, 1, 1,
0.4985153, -0.1662526, 2.657006, 1, 1, 1, 1, 1,
0.5078229, -0.1637104, 1.860927, 1, 1, 1, 1, 1,
0.5097198, 1.419174, 0.313129, 1, 1, 1, 1, 1,
0.511843, -0.4520228, 1.559792, 0, 0, 1, 1, 1,
0.5140368, 0.501586, 1.965796, 1, 0, 0, 1, 1,
0.514754, -0.3661718, 1.636912, 1, 0, 0, 1, 1,
0.5223615, 0.04611893, 1.738478, 1, 0, 0, 1, 1,
0.5249373, -0.906381, 3.959829, 1, 0, 0, 1, 1,
0.5256776, -0.1395573, -0.1437119, 1, 0, 0, 1, 1,
0.5292302, -0.1289235, 0.2900648, 0, 0, 0, 1, 1,
0.5307912, 0.08219593, 0.2249542, 0, 0, 0, 1, 1,
0.5323609, 0.8332453, 0.6769923, 0, 0, 0, 1, 1,
0.5367141, 2.52605, 1.47493, 0, 0, 0, 1, 1,
0.5441487, 1.516729, -0.2629295, 0, 0, 0, 1, 1,
0.5472071, -1.041342, 1.734624, 0, 0, 0, 1, 1,
0.5486968, -0.4688213, 2.329644, 0, 0, 0, 1, 1,
0.5581167, -1.939639, 3.794053, 1, 1, 1, 1, 1,
0.5636644, -0.8640841, 1.779709, 1, 1, 1, 1, 1,
0.5665004, 0.315297, 1.24747, 1, 1, 1, 1, 1,
0.567359, -1.2049, 0.210445, 1, 1, 1, 1, 1,
0.5725387, -0.1564701, 1.967974, 1, 1, 1, 1, 1,
0.5746187, -2.332794, 1.418456, 1, 1, 1, 1, 1,
0.5768443, -0.8907943, 2.390705, 1, 1, 1, 1, 1,
0.5772104, 1.081218, 0.237539, 1, 1, 1, 1, 1,
0.5776729, -0.242907, 2.529892, 1, 1, 1, 1, 1,
0.5794905, 0.4395567, 1.503892, 1, 1, 1, 1, 1,
0.581825, 1.748491, -0.1366085, 1, 1, 1, 1, 1,
0.5824387, -0.07822282, 2.60021, 1, 1, 1, 1, 1,
0.5856202, 0.6862162, -1.669156, 1, 1, 1, 1, 1,
0.5884674, -1.209235, 1.542855, 1, 1, 1, 1, 1,
0.593318, -0.8618554, 1.62845, 1, 1, 1, 1, 1,
0.5948415, 0.4882455, 0.6825746, 0, 0, 1, 1, 1,
0.5968133, 0.9115637, -0.855397, 1, 0, 0, 1, 1,
0.6010444, 0.4280221, 0.7854956, 1, 0, 0, 1, 1,
0.6021109, 2.792255, 1.083168, 1, 0, 0, 1, 1,
0.6023219, 0.2390238, 4.625022, 1, 0, 0, 1, 1,
0.6037425, -0.5028165, 2.422217, 1, 0, 0, 1, 1,
0.6116651, -0.0005376267, 0.2946943, 0, 0, 0, 1, 1,
0.6143485, 1.655209, 1.129727, 0, 0, 0, 1, 1,
0.6163087, -0.008007153, 3.033647, 0, 0, 0, 1, 1,
0.6168967, -0.4764244, 4.058569, 0, 0, 0, 1, 1,
0.6176755, 0.1290106, 0.6240913, 0, 0, 0, 1, 1,
0.6204853, 0.1486096, 2.119911, 0, 0, 0, 1, 1,
0.6205515, 0.3909662, -0.2757142, 0, 0, 0, 1, 1,
0.6217775, 0.1803138, 4.170083, 1, 1, 1, 1, 1,
0.6280274, 0.4049805, 3.483128, 1, 1, 1, 1, 1,
0.6285651, 2.201907, 0.8915622, 1, 1, 1, 1, 1,
0.6341045, 1.285203, -0.7491593, 1, 1, 1, 1, 1,
0.6370944, 0.9136798, 0.4110467, 1, 1, 1, 1, 1,
0.6424444, 0.1607571, -0.2898869, 1, 1, 1, 1, 1,
0.6478159, -1.252532, 2.132518, 1, 1, 1, 1, 1,
0.6516209, 1.753734, -0.7867788, 1, 1, 1, 1, 1,
0.6629056, -0.4055662, 1.934987, 1, 1, 1, 1, 1,
0.6656175, -0.5648482, 1.187716, 1, 1, 1, 1, 1,
0.6712427, 1.929906, 0.3613917, 1, 1, 1, 1, 1,
0.6724269, -0.2367372, 0.4791878, 1, 1, 1, 1, 1,
0.673882, 0.4968694, 2.671315, 1, 1, 1, 1, 1,
0.6804877, 1.255961, -0.1008864, 1, 1, 1, 1, 1,
0.6889994, 0.4677846, 1.434239, 1, 1, 1, 1, 1,
0.6919996, 1.58134, 1.303519, 0, 0, 1, 1, 1,
0.6939099, -0.8340265, 2.51116, 1, 0, 0, 1, 1,
0.6958143, 0.5005444, -0.4246541, 1, 0, 0, 1, 1,
0.6967613, -0.9315603, 2.336303, 1, 0, 0, 1, 1,
0.6971276, 1.29198, 0.7945365, 1, 0, 0, 1, 1,
0.7082595, 1.843883, 0.7221439, 1, 0, 0, 1, 1,
0.7093488, -0.6831129, 2.185327, 0, 0, 0, 1, 1,
0.7096106, -0.4221874, 0.3682119, 0, 0, 0, 1, 1,
0.7100801, 0.9869359, 1.178645, 0, 0, 0, 1, 1,
0.7124487, -0.79882, 2.354107, 0, 0, 0, 1, 1,
0.7158099, 0.6440643, -1.070063, 0, 0, 0, 1, 1,
0.7166588, -0.05854146, 1.827729, 0, 0, 0, 1, 1,
0.7168514, -0.1071359, 3.746711, 0, 0, 0, 1, 1,
0.7252179, 0.242686, 2.088344, 1, 1, 1, 1, 1,
0.7281442, -0.7721018, 1.973682, 1, 1, 1, 1, 1,
0.7395483, 0.8937395, 1.251188, 1, 1, 1, 1, 1,
0.7402676, 0.4262596, 1.113184, 1, 1, 1, 1, 1,
0.7428343, 1.357574, 2.188203, 1, 1, 1, 1, 1,
0.7433177, -0.6070616, 3.028957, 1, 1, 1, 1, 1,
0.7440184, 0.4662669, 0.09462662, 1, 1, 1, 1, 1,
0.7449448, -0.6335878, 3.026396, 1, 1, 1, 1, 1,
0.7456523, 0.9214858, 0.1811262, 1, 1, 1, 1, 1,
0.7508416, -0.03668118, 1.5311, 1, 1, 1, 1, 1,
0.7518732, 0.7596421, 2.571275, 1, 1, 1, 1, 1,
0.753758, -0.4343453, 2.794856, 1, 1, 1, 1, 1,
0.7544328, 1.139339, 1.04252, 1, 1, 1, 1, 1,
0.7655685, -0.2103566, 1.821748, 1, 1, 1, 1, 1,
0.7846701, -0.8392209, 3.103662, 1, 1, 1, 1, 1,
0.7892342, -0.1744343, 2.485809, 0, 0, 1, 1, 1,
0.8019072, -1.139898, 3.51435, 1, 0, 0, 1, 1,
0.8026451, 1.090415, 1.43019, 1, 0, 0, 1, 1,
0.8081822, -1.631714, 4.323206, 1, 0, 0, 1, 1,
0.8144495, 0.4625062, 2.652685, 1, 0, 0, 1, 1,
0.8164409, 0.1362144, 0.85296, 1, 0, 0, 1, 1,
0.8252407, -0.4862881, 1.903188, 0, 0, 0, 1, 1,
0.8322134, -1.180561, 0.7391024, 0, 0, 0, 1, 1,
0.8370845, -2.355922, 2.416106, 0, 0, 0, 1, 1,
0.8407155, -0.8806148, 3.760762, 0, 0, 0, 1, 1,
0.8450542, 0.35, 1.185845, 0, 0, 0, 1, 1,
0.8471053, -2.566599, 1.546503, 0, 0, 0, 1, 1,
0.8474087, -0.4166977, 3.253913, 0, 0, 0, 1, 1,
0.8481192, -0.2686647, 2.563947, 1, 1, 1, 1, 1,
0.858376, -0.07168005, 0.8264315, 1, 1, 1, 1, 1,
0.8595709, -0.08806283, 1.346941, 1, 1, 1, 1, 1,
0.8617399, -0.7730091, 1.472705, 1, 1, 1, 1, 1,
0.8693184, 1.361463, 1.542421, 1, 1, 1, 1, 1,
0.8697989, 0.68532, 2.798106, 1, 1, 1, 1, 1,
0.8708551, -1.000387, 1.807849, 1, 1, 1, 1, 1,
0.8762664, 0.6041037, -0.7132905, 1, 1, 1, 1, 1,
0.8785383, -1.336652, 4.658337, 1, 1, 1, 1, 1,
0.8798004, -0.5593247, 0.6631528, 1, 1, 1, 1, 1,
0.8807315, -0.5974872, 2.226387, 1, 1, 1, 1, 1,
0.8851964, 0.4287155, 2.395465, 1, 1, 1, 1, 1,
0.8864453, 0.576821, 0.8201238, 1, 1, 1, 1, 1,
0.8876641, 0.6087604, 1.255281, 1, 1, 1, 1, 1,
0.888675, 1.983231, 0.7535084, 1, 1, 1, 1, 1,
0.8898863, 0.4010301, 2.349797, 0, 0, 1, 1, 1,
0.8926854, 0.3591705, 2.490747, 1, 0, 0, 1, 1,
0.8942915, 2.548447, -0.02223862, 1, 0, 0, 1, 1,
0.9008874, 1.101253, 0.6041813, 1, 0, 0, 1, 1,
0.903248, -0.6447118, 0.7856523, 1, 0, 0, 1, 1,
0.9064533, -0.9297096, -0.76408, 1, 0, 0, 1, 1,
0.9137508, -1.723165, 1.070758, 0, 0, 0, 1, 1,
0.9171121, -0.5581958, 1.110937, 0, 0, 0, 1, 1,
0.9196089, 1.645781, 0.8821487, 0, 0, 0, 1, 1,
0.923602, -0.5296963, 2.316464, 0, 0, 0, 1, 1,
0.9270344, -0.3352958, 0.9892684, 0, 0, 0, 1, 1,
0.9272933, -0.0173417, 0.9361728, 0, 0, 0, 1, 1,
0.9387115, -0.7496989, 3.161413, 0, 0, 0, 1, 1,
0.9447033, -0.7785337, 1.496413, 1, 1, 1, 1, 1,
0.9483109, 0.4745537, 0.2315926, 1, 1, 1, 1, 1,
0.94842, 0.1813116, 0.2529821, 1, 1, 1, 1, 1,
0.9574036, -1.751391, 1.170393, 1, 1, 1, 1, 1,
0.9632006, -0.6501253, 0.8934321, 1, 1, 1, 1, 1,
0.96466, 0.8806157, 0.4033726, 1, 1, 1, 1, 1,
0.9657449, -0.8261007, 3.032645, 1, 1, 1, 1, 1,
0.9683264, 0.8812335, 2.414957, 1, 1, 1, 1, 1,
0.9768308, 1.679291, 0.4513725, 1, 1, 1, 1, 1,
0.9777043, 0.1906657, 1.516173, 1, 1, 1, 1, 1,
0.9817916, 1.30869, 2.097823, 1, 1, 1, 1, 1,
0.9829046, -1.584031, 4.161767, 1, 1, 1, 1, 1,
0.9901288, -0.2026018, 1.006388, 1, 1, 1, 1, 1,
0.993623, 0.425861, 0.1556908, 1, 1, 1, 1, 1,
0.9955988, -0.006804682, 1.782254, 1, 1, 1, 1, 1,
0.9970921, -0.9124442, 2.533451, 0, 0, 1, 1, 1,
0.9993552, -1.132755, 3.312374, 1, 0, 0, 1, 1,
1.01675, -1.628063, 2.054711, 1, 0, 0, 1, 1,
1.02043, -0.2174301, 1.50254, 1, 0, 0, 1, 1,
1.020792, 0.04132301, 0.5687299, 1, 0, 0, 1, 1,
1.028578, -0.9796898, 2.036484, 1, 0, 0, 1, 1,
1.034241, -0.501655, 3.642302, 0, 0, 0, 1, 1,
1.035009, -0.8617021, 2.097066, 0, 0, 0, 1, 1,
1.038333, 0.2691315, 1.425168, 0, 0, 0, 1, 1,
1.039356, 0.2283556, 0.6102511, 0, 0, 0, 1, 1,
1.03992, 0.1584329, 1.378775, 0, 0, 0, 1, 1,
1.044872, -1.107213, 2.526997, 0, 0, 0, 1, 1,
1.046298, 0.3270563, 2.623417, 0, 0, 0, 1, 1,
1.050215, 0.335151, 1.125266, 1, 1, 1, 1, 1,
1.058443, 0.3310424, 0.3114469, 1, 1, 1, 1, 1,
1.061043, 2.090669, 0.5677452, 1, 1, 1, 1, 1,
1.064056, -0.2334659, 1.94323, 1, 1, 1, 1, 1,
1.066072, -1.158515, 1.866727, 1, 1, 1, 1, 1,
1.068754, 0.2771936, 2.400212, 1, 1, 1, 1, 1,
1.070086, 0.1652878, 1.753837, 1, 1, 1, 1, 1,
1.07141, -2.484595, 2.127296, 1, 1, 1, 1, 1,
1.071716, 0.3816474, 1.608799, 1, 1, 1, 1, 1,
1.077108, -0.9523886, 0.9635884, 1, 1, 1, 1, 1,
1.077165, 0.8885565, 0.6499011, 1, 1, 1, 1, 1,
1.077664, 0.1314717, 2.084798, 1, 1, 1, 1, 1,
1.084453, -0.5085574, 2.661639, 1, 1, 1, 1, 1,
1.094396, -0.3910647, 1.599192, 1, 1, 1, 1, 1,
1.107983, 0.7325261, 1.010907, 1, 1, 1, 1, 1,
1.109685, -0.6386166, 2.548551, 0, 0, 1, 1, 1,
1.117748, -0.6275555, 1.030774, 1, 0, 0, 1, 1,
1.117805, 0.912181, -0.523685, 1, 0, 0, 1, 1,
1.118228, 0.03458053, 2.162769, 1, 0, 0, 1, 1,
1.1205, -1.086249, 2.007, 1, 0, 0, 1, 1,
1.139586, 1.359817, 1.428088, 1, 0, 0, 1, 1,
1.140685, -0.6200511, 3.448849, 0, 0, 0, 1, 1,
1.147791, -0.3398387, 1.920287, 0, 0, 0, 1, 1,
1.14959, 0.1831614, 0.9388696, 0, 0, 0, 1, 1,
1.149974, -1.26134, 1.942865, 0, 0, 0, 1, 1,
1.157796, -0.3395514, 1.264901, 0, 0, 0, 1, 1,
1.158779, 0.7755644, 0.1344314, 0, 0, 0, 1, 1,
1.158883, -1.535851, 1.307437, 0, 0, 0, 1, 1,
1.165545, 0.6832516, -0.6473465, 1, 1, 1, 1, 1,
1.165618, -0.09009118, -0.8787754, 1, 1, 1, 1, 1,
1.165717, -0.559926, 3.175492, 1, 1, 1, 1, 1,
1.172346, -1.102122, 3.593668, 1, 1, 1, 1, 1,
1.175682, 0.6238947, 0.4984767, 1, 1, 1, 1, 1,
1.177531, 1.816755, 1.172995, 1, 1, 1, 1, 1,
1.192108, 0.5451823, 1.464054, 1, 1, 1, 1, 1,
1.209836, 0.2798209, 2.684364, 1, 1, 1, 1, 1,
1.219872, 1.139814, 0.8458416, 1, 1, 1, 1, 1,
1.231725, -0.6851634, 1.864092, 1, 1, 1, 1, 1,
1.232558, 1.570714, 1.484015, 1, 1, 1, 1, 1,
1.23404, 0.04720102, 2.611912, 1, 1, 1, 1, 1,
1.240969, 0.6458642, 1.657174, 1, 1, 1, 1, 1,
1.258206, 2.469799, -0.4343802, 1, 1, 1, 1, 1,
1.258422, -0.1272992, 3.039886, 1, 1, 1, 1, 1,
1.259893, 0.2924275, 0.5304399, 0, 0, 1, 1, 1,
1.26645, 0.1079441, 0.4694309, 1, 0, 0, 1, 1,
1.279478, -0.3432936, 1.978605, 1, 0, 0, 1, 1,
1.282927, -0.9748563, 1.885609, 1, 0, 0, 1, 1,
1.283186, 0.4585384, 0.9125803, 1, 0, 0, 1, 1,
1.29472, 0.7535565, -0.237669, 1, 0, 0, 1, 1,
1.304394, 1.020428, 0.3745539, 0, 0, 0, 1, 1,
1.314916, 0.6863324, 0.9446294, 0, 0, 0, 1, 1,
1.323811, -0.2465143, 1.507442, 0, 0, 0, 1, 1,
1.324715, 0.7545394, -1.520057, 0, 0, 0, 1, 1,
1.326455, 0.03934329, 0.5308534, 0, 0, 0, 1, 1,
1.331197, -1.079497, 1.801816, 0, 0, 0, 1, 1,
1.332787, -0.8330668, 1.030412, 0, 0, 0, 1, 1,
1.334984, 0.9911369, 1.354239, 1, 1, 1, 1, 1,
1.335098, -0.8843529, 0.3624287, 1, 1, 1, 1, 1,
1.342449, -0.6082063, 2.834003, 1, 1, 1, 1, 1,
1.344527, -1.074015, 1.166987, 1, 1, 1, 1, 1,
1.345703, -0.2609345, 2.208726, 1, 1, 1, 1, 1,
1.346365, 0.2542586, 1.498754, 1, 1, 1, 1, 1,
1.349947, -0.7695019, 4.182539, 1, 1, 1, 1, 1,
1.364024, 0.2708315, 0.7714301, 1, 1, 1, 1, 1,
1.383905, 0.8995829, -0.8318312, 1, 1, 1, 1, 1,
1.385903, -0.8262488, 1.815104, 1, 1, 1, 1, 1,
1.388194, 1.302342, 1.706199, 1, 1, 1, 1, 1,
1.390471, -0.3159723, 0.669532, 1, 1, 1, 1, 1,
1.402162, 1.556338, 2.089885, 1, 1, 1, 1, 1,
1.424908, -0.5597355, 3.064319, 1, 1, 1, 1, 1,
1.431375, 1.628743, 0.90576, 1, 1, 1, 1, 1,
1.434703, -0.7665414, 0.5176162, 0, 0, 1, 1, 1,
1.434769, -1.161516, 4.765517, 1, 0, 0, 1, 1,
1.437976, 0.01469269, 2.673729, 1, 0, 0, 1, 1,
1.44034, 0.936906, 1.2786, 1, 0, 0, 1, 1,
1.441003, 0.4872785, 0.7500157, 1, 0, 0, 1, 1,
1.456535, 0.5545263, 1.784756, 1, 0, 0, 1, 1,
1.458246, -0.345121, 1.961301, 0, 0, 0, 1, 1,
1.46407, -1.615324, 1.986491, 0, 0, 0, 1, 1,
1.471265, 0.7550599, 0.8841388, 0, 0, 0, 1, 1,
1.477503, -1.543633, 2.797706, 0, 0, 0, 1, 1,
1.48649, 2.632187, 0.1760711, 0, 0, 0, 1, 1,
1.487905, -0.1783256, 1.559611, 0, 0, 0, 1, 1,
1.520462, 1.10983, 1.080611, 0, 0, 0, 1, 1,
1.522897, -0.1546103, 1.250444, 1, 1, 1, 1, 1,
1.538512, -0.5880917, 1.859992, 1, 1, 1, 1, 1,
1.54057, -0.04825117, 0.111551, 1, 1, 1, 1, 1,
1.542205, -0.4684716, 0.6821747, 1, 1, 1, 1, 1,
1.549228, -0.00641088, 0.4110998, 1, 1, 1, 1, 1,
1.552077, 0.8183562, 0.6828008, 1, 1, 1, 1, 1,
1.553469, 0.9843439, 1.292583, 1, 1, 1, 1, 1,
1.568877, -0.08221362, 2.066609, 1, 1, 1, 1, 1,
1.579742, -0.845773, 1.483338, 1, 1, 1, 1, 1,
1.581395, 0.3706076, 4.098902, 1, 1, 1, 1, 1,
1.591408, -2.098659, 1.558993, 1, 1, 1, 1, 1,
1.596853, -0.1630065, 1.760107, 1, 1, 1, 1, 1,
1.62689, 0.3382413, -0.6603169, 1, 1, 1, 1, 1,
1.650124, 0.5824594, 0.8098106, 1, 1, 1, 1, 1,
1.659899, -0.6738003, 1.72861, 1, 1, 1, 1, 1,
1.660162, 0.5594846, 0.8517276, 0, 0, 1, 1, 1,
1.668829, 1.99043, 2.125657, 1, 0, 0, 1, 1,
1.679374, 0.1512044, 3.321737, 1, 0, 0, 1, 1,
1.682143, 1.399887, 1.257702, 1, 0, 0, 1, 1,
1.71318, -1.669799, 1.553054, 1, 0, 0, 1, 1,
1.728612, 0.5885288, 3.033862, 1, 0, 0, 1, 1,
1.752553, 0.4685721, 2.09833, 0, 0, 0, 1, 1,
1.778494, -0.2021754, 2.459998, 0, 0, 0, 1, 1,
1.80659, 0.4902244, 3.132354, 0, 0, 0, 1, 1,
1.815487, 1.110338, 0.125409, 0, 0, 0, 1, 1,
1.822639, -0.7806112, 1.603766, 0, 0, 0, 1, 1,
1.835434, 0.6591294, 0.1175484, 0, 0, 0, 1, 1,
1.855548, 1.294457, 0.3431535, 0, 0, 0, 1, 1,
1.882172, 0.7596744, -0.519207, 1, 1, 1, 1, 1,
1.888579, -1.202057, 2.841722, 1, 1, 1, 1, 1,
1.901747, 0.5827878, 1.335037, 1, 1, 1, 1, 1,
1.9038, 0.2198345, 1.394826, 1, 1, 1, 1, 1,
1.917973, -1.435161, 3.619124, 1, 1, 1, 1, 1,
1.929672, -2.55217, 1.749093, 1, 1, 1, 1, 1,
1.955999, -2.132464, 1.453287, 1, 1, 1, 1, 1,
2.008128, 0.1185853, 1.950782, 1, 1, 1, 1, 1,
2.00853, -0.9224356, -0.6507583, 1, 1, 1, 1, 1,
2.021421, 1.311843, 2.386561, 1, 1, 1, 1, 1,
2.039211, -0.3715639, -0.4854263, 1, 1, 1, 1, 1,
2.06269, -0.9148368, 1.655962, 1, 1, 1, 1, 1,
2.064106, 0.944028, 1.978986, 1, 1, 1, 1, 1,
2.067594, 1.576801, 2.032355, 1, 1, 1, 1, 1,
2.074917, -0.7182708, 2.896244, 1, 1, 1, 1, 1,
2.12833, -0.1669565, 2.327503, 0, 0, 1, 1, 1,
2.18769, -0.1520068, 1.439347, 1, 0, 0, 1, 1,
2.205934, 0.5840451, 1.794753, 1, 0, 0, 1, 1,
2.237835, 0.1153199, 2.411717, 1, 0, 0, 1, 1,
2.252765, 0.4173033, 1.03738, 1, 0, 0, 1, 1,
2.275133, -0.3383992, 1.663386, 1, 0, 0, 1, 1,
2.292555, -0.9433124, 1.004804, 0, 0, 0, 1, 1,
2.301313, -0.8754269, 2.018373, 0, 0, 0, 1, 1,
2.30558, 0.3443563, 1.444804, 0, 0, 0, 1, 1,
2.311366, -1.253684, 1.889972, 0, 0, 0, 1, 1,
2.322664, -0.9227313, 0.6793224, 0, 0, 0, 1, 1,
2.326188, 0.2288529, 1.02157, 0, 0, 0, 1, 1,
2.336699, -0.5749267, 2.902512, 0, 0, 0, 1, 1,
2.52659, 0.215882, 1.45022, 1, 1, 1, 1, 1,
2.582454, -0.7413316, 2.350911, 1, 1, 1, 1, 1,
2.605284, 0.6846991, 1.048871, 1, 1, 1, 1, 1,
2.62167, -0.54607, 2.390306, 1, 1, 1, 1, 1,
3.021358, -0.9586452, 4.459361, 1, 1, 1, 1, 1,
3.308135, 1.332009, 1.988888, 1, 1, 1, 1, 1,
3.369681, -0.3025879, 2.649941, 1, 1, 1, 1, 1
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
var radius = 9.392206;
var distance = 32.98973;
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
mvMatrix.translate( -0.2952266, 0.4579359, 0.2789094 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.98973);
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
