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
-3.312959, -0.961492, -2.40222, 1, 0, 0, 1,
-2.647347, -0.1164768, -2.549871, 1, 0.007843138, 0, 1,
-2.638933, -0.7329603, -3.547363, 1, 0.01176471, 0, 1,
-2.625013, -0.7509903, -2.249721, 1, 0.01960784, 0, 1,
-2.546689, -1.246488, -0.6741703, 1, 0.02352941, 0, 1,
-2.394752, 1.244095, -0.7874982, 1, 0.03137255, 0, 1,
-2.366473, -1.209427, -1.813933, 1, 0.03529412, 0, 1,
-2.341602, 1.077873, -0.07052702, 1, 0.04313726, 0, 1,
-2.325127, 0.6952783, -2.601188, 1, 0.04705882, 0, 1,
-2.299516, -0.4954684, -1.492206, 1, 0.05490196, 0, 1,
-2.28497, 0.4364972, -2.245119, 1, 0.05882353, 0, 1,
-2.242981, -1.095583, -1.699212, 1, 0.06666667, 0, 1,
-2.229969, -1.337338, 1.229088, 1, 0.07058824, 0, 1,
-2.207649, -0.3380145, 0.1555019, 1, 0.07843138, 0, 1,
-2.200984, 1.092018, -0.636957, 1, 0.08235294, 0, 1,
-2.19114, -0.1044073, -2.369894, 1, 0.09019608, 0, 1,
-2.183286, 1.067784, -0.1507603, 1, 0.09411765, 0, 1,
-2.182243, -1.506898, -1.533813, 1, 0.1019608, 0, 1,
-2.171923, -1.324697, -2.823632, 1, 0.1098039, 0, 1,
-2.159003, -1.275883, -3.379616, 1, 0.1137255, 0, 1,
-2.133682, -0.2397152, -1.36635, 1, 0.1215686, 0, 1,
-2.118911, 0.1301908, -1.915706, 1, 0.1254902, 0, 1,
-2.100598, 0.7720754, -2.025738, 1, 0.1333333, 0, 1,
-2.046857, -0.09457286, -1.621379, 1, 0.1372549, 0, 1,
-2.033685, -0.007763163, -0.8964734, 1, 0.145098, 0, 1,
-2.001094, -0.9563069, -2.101203, 1, 0.1490196, 0, 1,
-1.990283, -1.059733, -0.0907886, 1, 0.1568628, 0, 1,
-1.950015, -0.128179, -1.754953, 1, 0.1607843, 0, 1,
-1.906657, -1.532683, -4.113983, 1, 0.1686275, 0, 1,
-1.880558, 1.205999, -1.555663, 1, 0.172549, 0, 1,
-1.873883, 0.4696753, -1.894222, 1, 0.1803922, 0, 1,
-1.870379, 1.022371, -0.5206881, 1, 0.1843137, 0, 1,
-1.843989, 2.418594, -1.363281, 1, 0.1921569, 0, 1,
-1.836117, 1.981601, 0.9279936, 1, 0.1960784, 0, 1,
-1.827506, -0.8234595, -2.597084, 1, 0.2039216, 0, 1,
-1.826664, -0.9387298, -0.587333, 1, 0.2117647, 0, 1,
-1.797854, -0.4457902, -2.387898, 1, 0.2156863, 0, 1,
-1.771985, 0.4004818, -1.008313, 1, 0.2235294, 0, 1,
-1.742814, -2.089481, -2.523921, 1, 0.227451, 0, 1,
-1.724725, 0.9101727, -0.5725228, 1, 0.2352941, 0, 1,
-1.722229, -0.8636542, -4.338542, 1, 0.2392157, 0, 1,
-1.72099, 1.894032, -1.736877, 1, 0.2470588, 0, 1,
-1.713444, -1.662815, -3.320536, 1, 0.2509804, 0, 1,
-1.694814, 0.8782868, -2.453773, 1, 0.2588235, 0, 1,
-1.690582, -0.1973191, -1.158134, 1, 0.2627451, 0, 1,
-1.688412, 0.6010268, -2.453035, 1, 0.2705882, 0, 1,
-1.67616, -0.1817891, -1.229571, 1, 0.2745098, 0, 1,
-1.669434, 0.5560334, -0.7207499, 1, 0.282353, 0, 1,
-1.653988, -1.381788, -3.172888, 1, 0.2862745, 0, 1,
-1.642549, -0.1943502, -2.969358, 1, 0.2941177, 0, 1,
-1.626364, -1.367091, -3.592504, 1, 0.3019608, 0, 1,
-1.623976, -1.498804, -2.40796, 1, 0.3058824, 0, 1,
-1.620188, 0.2579717, -2.955106, 1, 0.3137255, 0, 1,
-1.613319, 0.524054, -2.733651, 1, 0.3176471, 0, 1,
-1.609086, 1.391496, -0.4907769, 1, 0.3254902, 0, 1,
-1.607507, 0.3759668, -2.305188, 1, 0.3294118, 0, 1,
-1.588941, -0.08199285, -3.45164, 1, 0.3372549, 0, 1,
-1.581652, -0.9749122, -1.078973, 1, 0.3411765, 0, 1,
-1.581491, 0.9839622, -1.483064, 1, 0.3490196, 0, 1,
-1.574832, 0.5932804, -1.788657, 1, 0.3529412, 0, 1,
-1.5646, -0.5583512, -0.716488, 1, 0.3607843, 0, 1,
-1.561688, -0.09741917, -0.5485329, 1, 0.3647059, 0, 1,
-1.551819, 0.4463482, -1.377536, 1, 0.372549, 0, 1,
-1.545712, -0.5498099, -3.057642, 1, 0.3764706, 0, 1,
-1.51936, -1.589714, -1.828231, 1, 0.3843137, 0, 1,
-1.516884, -1.954905, -2.466812, 1, 0.3882353, 0, 1,
-1.515554, 0.8703054, -1.1115, 1, 0.3960784, 0, 1,
-1.510849, 0.5480691, 0.6724635, 1, 0.4039216, 0, 1,
-1.507141, 0.8414524, -1.688667, 1, 0.4078431, 0, 1,
-1.500511, -0.5373852, -2.242942, 1, 0.4156863, 0, 1,
-1.497016, -0.4629053, -2.273693, 1, 0.4196078, 0, 1,
-1.490291, 0.07367176, -2.834776, 1, 0.427451, 0, 1,
-1.487541, -0.3865567, -1.964442, 1, 0.4313726, 0, 1,
-1.48139, -0.7766976, -1.051894, 1, 0.4392157, 0, 1,
-1.475195, -1.508038, -2.031536, 1, 0.4431373, 0, 1,
-1.461913, 0.657277, -1.695415, 1, 0.4509804, 0, 1,
-1.459631, -0.7620313, -4.852449, 1, 0.454902, 0, 1,
-1.457324, -0.05521027, -1.41535, 1, 0.4627451, 0, 1,
-1.455943, -0.6890196, -2.355608, 1, 0.4666667, 0, 1,
-1.450664, 1.011112, -0.8097563, 1, 0.4745098, 0, 1,
-1.426426, 0.6661186, -0.8720341, 1, 0.4784314, 0, 1,
-1.421637, 0.7254422, -0.6967403, 1, 0.4862745, 0, 1,
-1.421032, -1.317683, -2.373152, 1, 0.4901961, 0, 1,
-1.419478, 0.4424962, -0.9161385, 1, 0.4980392, 0, 1,
-1.41795, -0.8924515, -1.11116, 1, 0.5058824, 0, 1,
-1.411179, 0.1068759, -1.444077, 1, 0.509804, 0, 1,
-1.404996, -0.9568613, -0.8585801, 1, 0.5176471, 0, 1,
-1.404169, -1.800505, -2.523782, 1, 0.5215687, 0, 1,
-1.393927, 0.545624, -1.129732, 1, 0.5294118, 0, 1,
-1.387342, -1.893568, -2.917296, 1, 0.5333334, 0, 1,
-1.369309, -3.4232, -1.936422, 1, 0.5411765, 0, 1,
-1.368733, -0.1846037, -2.869053, 1, 0.5450981, 0, 1,
-1.365221, -0.1178809, -0.2659881, 1, 0.5529412, 0, 1,
-1.359868, -1.207101, -1.421343, 1, 0.5568628, 0, 1,
-1.356163, -1.50845, -5.004509, 1, 0.5647059, 0, 1,
-1.352281, -1.644237, -2.05856, 1, 0.5686275, 0, 1,
-1.34298, 0.9702938, -0.4225087, 1, 0.5764706, 0, 1,
-1.337367, 0.3841332, -1.126762, 1, 0.5803922, 0, 1,
-1.335082, -1.582569, -3.919863, 1, 0.5882353, 0, 1,
-1.330569, -0.2277672, -2.46634, 1, 0.5921569, 0, 1,
-1.309398, -2.549982, -1.690149, 1, 0.6, 0, 1,
-1.304617, -0.05195883, -0.341986, 1, 0.6078432, 0, 1,
-1.294331, 1.165268, -1.29803, 1, 0.6117647, 0, 1,
-1.279651, -1.478934, -2.217895, 1, 0.6196079, 0, 1,
-1.267989, 0.6385642, -1.546, 1, 0.6235294, 0, 1,
-1.256107, 1.396097, -0.7257848, 1, 0.6313726, 0, 1,
-1.243034, -1.703273, -2.302845, 1, 0.6352941, 0, 1,
-1.227849, 0.07145704, -1.548565, 1, 0.6431373, 0, 1,
-1.226805, 1.998035, -0.9456556, 1, 0.6470588, 0, 1,
-1.220043, -0.1836816, -1.728244, 1, 0.654902, 0, 1,
-1.215448, -1.136065, -0.3626592, 1, 0.6588235, 0, 1,
-1.212701, -0.3984531, -2.918085, 1, 0.6666667, 0, 1,
-1.210054, 0.3857009, -1.445216, 1, 0.6705883, 0, 1,
-1.200119, -0.2458808, -0.2262103, 1, 0.6784314, 0, 1,
-1.199306, -0.9411946, -1.670175, 1, 0.682353, 0, 1,
-1.196693, -0.9137192, -0.06634876, 1, 0.6901961, 0, 1,
-1.192024, 1.119581, -1.242951, 1, 0.6941177, 0, 1,
-1.189173, 2.015644, 0.3333523, 1, 0.7019608, 0, 1,
-1.185396, 0.6444268, -1.597702, 1, 0.7098039, 0, 1,
-1.175384, -0.05010127, -3.278091, 1, 0.7137255, 0, 1,
-1.171908, -1.289261, -2.975725, 1, 0.7215686, 0, 1,
-1.169338, -1.691148, -3.801367, 1, 0.7254902, 0, 1,
-1.166366, 0.002429935, 0.005803951, 1, 0.7333333, 0, 1,
-1.163422, 0.01688307, -1.224567, 1, 0.7372549, 0, 1,
-1.158915, -0.1802156, -1.9954, 1, 0.7450981, 0, 1,
-1.151144, -0.1555156, -1.69699, 1, 0.7490196, 0, 1,
-1.1482, -1.504449, -4.331646, 1, 0.7568628, 0, 1,
-1.144019, -0.5623009, -2.655013, 1, 0.7607843, 0, 1,
-1.143134, 2.518928, -0.1100078, 1, 0.7686275, 0, 1,
-1.137541, 0.3783206, -1.198143, 1, 0.772549, 0, 1,
-1.133329, 0.1769722, -3.018058, 1, 0.7803922, 0, 1,
-1.124312, 0.3353006, -2.105565, 1, 0.7843137, 0, 1,
-1.121187, 0.2943697, -1.781941, 1, 0.7921569, 0, 1,
-1.118929, 0.3147085, -0.5919208, 1, 0.7960784, 0, 1,
-1.108748, 2.760049, 0.5157441, 1, 0.8039216, 0, 1,
-1.104862, -0.5072249, -1.183587, 1, 0.8117647, 0, 1,
-1.095249, 1.557613, 0.1460851, 1, 0.8156863, 0, 1,
-1.095107, 0.5287202, -1.694958, 1, 0.8235294, 0, 1,
-1.089521, -0.4075687, -2.329023, 1, 0.827451, 0, 1,
-1.085104, -0.1818504, -1.807637, 1, 0.8352941, 0, 1,
-1.083518, -0.1154561, -1.391772, 1, 0.8392157, 0, 1,
-1.080993, -2.737898, -3.962243, 1, 0.8470588, 0, 1,
-1.080215, 1.171794, -0.5089304, 1, 0.8509804, 0, 1,
-1.07317, 0.03932045, -2.449676, 1, 0.8588235, 0, 1,
-1.070728, -0.1204403, 0.3048435, 1, 0.8627451, 0, 1,
-1.067947, 0.7391419, -1.388022, 1, 0.8705882, 0, 1,
-1.066203, 1.036449, -0.5892992, 1, 0.8745098, 0, 1,
-1.059817, -0.923461, -1.011812, 1, 0.8823529, 0, 1,
-1.058656, 0.1344585, 0.1170202, 1, 0.8862745, 0, 1,
-1.055648, 1.676579, 0.8405256, 1, 0.8941177, 0, 1,
-1.055535, 1.214539, -3.012646, 1, 0.8980392, 0, 1,
-1.044522, -1.884643, -2.477039, 1, 0.9058824, 0, 1,
-1.043052, -1.217243, -3.564803, 1, 0.9137255, 0, 1,
-1.04301, 0.8522505, -1.956572, 1, 0.9176471, 0, 1,
-1.038742, 0.2895598, -0.6215983, 1, 0.9254902, 0, 1,
-1.031714, 0.4008245, 0.2509523, 1, 0.9294118, 0, 1,
-1.030991, 0.62929, 0.08931069, 1, 0.9372549, 0, 1,
-1.026636, -0.09800857, -2.370555, 1, 0.9411765, 0, 1,
-1.016678, 1.262847, -2.652761, 1, 0.9490196, 0, 1,
-1.015657, -0.3329636, -0.8838204, 1, 0.9529412, 0, 1,
-1.01277, -0.665652, -1.942015, 1, 0.9607843, 0, 1,
-1.012324, 0.2439505, -1.926259, 1, 0.9647059, 0, 1,
-1.007417, 1.203182, -1.873958, 1, 0.972549, 0, 1,
-1.00497, -0.4285093, -2.896853, 1, 0.9764706, 0, 1,
-1.002485, -0.6336889, -1.061915, 1, 0.9843137, 0, 1,
-1.002371, 1.125012, -0.7113084, 1, 0.9882353, 0, 1,
-0.9954604, 0.1476734, -0.8225383, 1, 0.9960784, 0, 1,
-0.9899414, -0.6275204, -1.764744, 0.9960784, 1, 0, 1,
-0.9894148, 1.187253, -1.754805, 0.9921569, 1, 0, 1,
-0.9869685, -1.16818, 0.1304545, 0.9843137, 1, 0, 1,
-0.9798526, 0.590608, -1.742265, 0.9803922, 1, 0, 1,
-0.9684831, -0.02706232, -1.473054, 0.972549, 1, 0, 1,
-0.9649729, -1.128426, -1.433631, 0.9686275, 1, 0, 1,
-0.9647838, -0.2894634, -1.792157, 0.9607843, 1, 0, 1,
-0.9584055, 1.425943, -1.739938, 0.9568627, 1, 0, 1,
-0.9568416, 1.071727, 0.4405432, 0.9490196, 1, 0, 1,
-0.9555528, 0.6657447, -1.213993, 0.945098, 1, 0, 1,
-0.9529052, 0.7616147, -1.085487, 0.9372549, 1, 0, 1,
-0.9497415, 0.3855982, -1.923117, 0.9333333, 1, 0, 1,
-0.9496672, -0.6928181, -2.043575, 0.9254902, 1, 0, 1,
-0.9482685, 1.270974, 0.04128227, 0.9215686, 1, 0, 1,
-0.9459683, 0.7498623, -1.529075, 0.9137255, 1, 0, 1,
-0.9432547, -1.83829, -1.905513, 0.9098039, 1, 0, 1,
-0.9364976, -0.4840412, -1.069025, 0.9019608, 1, 0, 1,
-0.9316279, 0.7498631, -0.6260745, 0.8941177, 1, 0, 1,
-0.9302934, -0.676523, -0.8930641, 0.8901961, 1, 0, 1,
-0.9292924, 0.6435665, -0.09369186, 0.8823529, 1, 0, 1,
-0.9187675, -0.08167733, -0.3900614, 0.8784314, 1, 0, 1,
-0.9179206, -1.867146, -3.346592, 0.8705882, 1, 0, 1,
-0.917208, -0.1693571, -2.144644, 0.8666667, 1, 0, 1,
-0.915674, 1.585033, 0.3891466, 0.8588235, 1, 0, 1,
-0.9143264, 0.1389545, -1.395759, 0.854902, 1, 0, 1,
-0.9120669, -0.6081585, -0.2255311, 0.8470588, 1, 0, 1,
-0.9111852, 0.1828221, -0.8224663, 0.8431373, 1, 0, 1,
-0.9073035, 0.9041337, -0.981252, 0.8352941, 1, 0, 1,
-0.9048986, 0.5536382, -1.14776, 0.8313726, 1, 0, 1,
-0.9045249, -0.8533405, -3.266554, 0.8235294, 1, 0, 1,
-0.9023297, 0.05282899, -3.168717, 0.8196079, 1, 0, 1,
-0.8992607, -0.7750459, -2.600487, 0.8117647, 1, 0, 1,
-0.895678, -0.2213057, -0.9130717, 0.8078431, 1, 0, 1,
-0.8925934, 1.564483, 0.06808853, 0.8, 1, 0, 1,
-0.8872447, -0.2749037, -0.8718897, 0.7921569, 1, 0, 1,
-0.8670005, -1.53601, -1.865299, 0.7882353, 1, 0, 1,
-0.8643828, -0.1362247, -1.120471, 0.7803922, 1, 0, 1,
-0.8642517, 0.0591257, -1.911268, 0.7764706, 1, 0, 1,
-0.8638994, -0.9063097, -1.435912, 0.7686275, 1, 0, 1,
-0.8630245, -0.07880432, -2.364916, 0.7647059, 1, 0, 1,
-0.8576196, -0.0397131, -0.8959035, 0.7568628, 1, 0, 1,
-0.8508478, -0.3844498, -2.141202, 0.7529412, 1, 0, 1,
-0.8505371, 0.5510373, 0.12355, 0.7450981, 1, 0, 1,
-0.8491011, -0.2477159, -1.363667, 0.7411765, 1, 0, 1,
-0.8460119, 0.502452, -1.758232, 0.7333333, 1, 0, 1,
-0.8377694, 0.2173803, 0.3993722, 0.7294118, 1, 0, 1,
-0.8375609, -0.2247467, -2.679549, 0.7215686, 1, 0, 1,
-0.826037, 0.1358934, -2.202705, 0.7176471, 1, 0, 1,
-0.8223638, -1.004816, -3.621596, 0.7098039, 1, 0, 1,
-0.8213475, -1.385868, -1.919242, 0.7058824, 1, 0, 1,
-0.8175592, 1.326959, -0.075326, 0.6980392, 1, 0, 1,
-0.808184, -0.9642442, -2.042312, 0.6901961, 1, 0, 1,
-0.8068879, 0.9486775, 0.06421302, 0.6862745, 1, 0, 1,
-0.8047035, 0.8303897, 0.109729, 0.6784314, 1, 0, 1,
-0.8041697, -0.3932158, -1.525067, 0.6745098, 1, 0, 1,
-0.8001124, -0.3793839, -1.903808, 0.6666667, 1, 0, 1,
-0.7963406, 0.1509518, -1.356978, 0.6627451, 1, 0, 1,
-0.7928141, -0.6535598, -2.370785, 0.654902, 1, 0, 1,
-0.7852996, 0.07833571, -0.7812176, 0.6509804, 1, 0, 1,
-0.777624, -0.3269215, -1.593555, 0.6431373, 1, 0, 1,
-0.7765968, 0.1298131, -0.4709617, 0.6392157, 1, 0, 1,
-0.7763215, -0.2492551, -1.620464, 0.6313726, 1, 0, 1,
-0.7736474, 0.6652524, 0.1738351, 0.627451, 1, 0, 1,
-0.7698108, -0.8971277, -2.985766, 0.6196079, 1, 0, 1,
-0.7662192, -0.1515964, -2.256538, 0.6156863, 1, 0, 1,
-0.7633998, 0.1709945, -1.139989, 0.6078432, 1, 0, 1,
-0.7627106, -0.5069128, -1.969374, 0.6039216, 1, 0, 1,
-0.7626409, 1.18432, 0.5542979, 0.5960785, 1, 0, 1,
-0.7603301, -0.6049767, -0.8873832, 0.5882353, 1, 0, 1,
-0.7579467, 1.105686, -0.7100316, 0.5843138, 1, 0, 1,
-0.7511088, 0.03024502, -0.9933094, 0.5764706, 1, 0, 1,
-0.7442389, 1.859938, -1.640222, 0.572549, 1, 0, 1,
-0.7420076, 0.7094126, 1.608132, 0.5647059, 1, 0, 1,
-0.740028, 0.3622268, -0.03350687, 0.5607843, 1, 0, 1,
-0.7396492, -1.426866, -2.282006, 0.5529412, 1, 0, 1,
-0.7337532, 0.01502738, -4.329313, 0.5490196, 1, 0, 1,
-0.7318624, -0.9467337, -2.52243, 0.5411765, 1, 0, 1,
-0.7279869, 0.8209848, 0.6596845, 0.5372549, 1, 0, 1,
-0.726167, 1.789797, 0.06162423, 0.5294118, 1, 0, 1,
-0.7259755, 0.5409979, -2.588955, 0.5254902, 1, 0, 1,
-0.7226501, 0.7636395, -0.5724924, 0.5176471, 1, 0, 1,
-0.7205351, 0.06779026, -1.362776, 0.5137255, 1, 0, 1,
-0.7172397, 0.9153496, -0.2268857, 0.5058824, 1, 0, 1,
-0.7083727, -0.646333, -1.5017, 0.5019608, 1, 0, 1,
-0.7057311, -0.668208, -2.510435, 0.4941176, 1, 0, 1,
-0.7045953, -1.241213, -2.374164, 0.4862745, 1, 0, 1,
-0.7028773, -0.02271531, -1.328785, 0.4823529, 1, 0, 1,
-0.7008353, 0.02908777, -1.944405, 0.4745098, 1, 0, 1,
-0.6993239, -0.2735046, -2.518052, 0.4705882, 1, 0, 1,
-0.6983091, -0.5478733, -2.7307, 0.4627451, 1, 0, 1,
-0.6846029, 0.2365054, 0.01249171, 0.4588235, 1, 0, 1,
-0.6843708, -0.4322986, -2.229895, 0.4509804, 1, 0, 1,
-0.681903, 0.5352154, 0.1352401, 0.4470588, 1, 0, 1,
-0.6784792, -0.7550192, -3.217042, 0.4392157, 1, 0, 1,
-0.6757371, -0.2653871, -2.178881, 0.4352941, 1, 0, 1,
-0.6738424, -0.4207272, -2.239279, 0.427451, 1, 0, 1,
-0.6722524, -0.262775, -3.282028, 0.4235294, 1, 0, 1,
-0.6695791, 1.93826, -0.714339, 0.4156863, 1, 0, 1,
-0.6686619, 0.3599735, -1.50911, 0.4117647, 1, 0, 1,
-0.6667217, 0.2265491, -2.620485, 0.4039216, 1, 0, 1,
-0.6661698, 0.996843, 0.4597302, 0.3960784, 1, 0, 1,
-0.6611198, 0.6500332, -1.940065, 0.3921569, 1, 0, 1,
-0.6375714, 0.3034789, -1.076222, 0.3843137, 1, 0, 1,
-0.6326419, -0.108891, -2.087527, 0.3803922, 1, 0, 1,
-0.630012, -0.5870538, -2.614089, 0.372549, 1, 0, 1,
-0.6284212, -0.3894197, -3.587884, 0.3686275, 1, 0, 1,
-0.6234986, 0.1591209, -0.2225527, 0.3607843, 1, 0, 1,
-0.6220585, 1.056551, 0.7323741, 0.3568628, 1, 0, 1,
-0.6160856, 0.3218328, -1.547334, 0.3490196, 1, 0, 1,
-0.6147291, 0.5862913, -1.232839, 0.345098, 1, 0, 1,
-0.6110892, -1.556346, -2.738033, 0.3372549, 1, 0, 1,
-0.6062729, -3.158797, -2.516155, 0.3333333, 1, 0, 1,
-0.6034704, 0.7483251, -1.397121, 0.3254902, 1, 0, 1,
-0.6001921, 1.838707, 0.6424867, 0.3215686, 1, 0, 1,
-0.5983078, 0.7675371, -0.8403483, 0.3137255, 1, 0, 1,
-0.5954821, 0.9659689, -0.8830533, 0.3098039, 1, 0, 1,
-0.5951051, -0.4325587, -2.749429, 0.3019608, 1, 0, 1,
-0.5930473, 0.7610462, 0.3275545, 0.2941177, 1, 0, 1,
-0.5870137, 0.4962526, -1.712649, 0.2901961, 1, 0, 1,
-0.5866428, -1.867763, -2.705243, 0.282353, 1, 0, 1,
-0.5833791, -0.06333742, -1.329563, 0.2784314, 1, 0, 1,
-0.5816554, 0.9687607, 0.2170267, 0.2705882, 1, 0, 1,
-0.5812323, 0.1038589, -0.7073002, 0.2666667, 1, 0, 1,
-0.5781606, -1.441175, -3.616141, 0.2588235, 1, 0, 1,
-0.5763862, 0.310966, -1.371157, 0.254902, 1, 0, 1,
-0.5699182, 0.7016287, -0.1069679, 0.2470588, 1, 0, 1,
-0.5668846, -0.1463974, -2.051832, 0.2431373, 1, 0, 1,
-0.5520251, 0.2855669, 0.6554676, 0.2352941, 1, 0, 1,
-0.5515006, -0.3682809, -3.260687, 0.2313726, 1, 0, 1,
-0.5449648, -0.6023639, -1.928837, 0.2235294, 1, 0, 1,
-0.540695, 0.3938465, -0.1926112, 0.2196078, 1, 0, 1,
-0.5393963, 0.08402303, -2.765421, 0.2117647, 1, 0, 1,
-0.5376685, -0.8670713, -2.718254, 0.2078431, 1, 0, 1,
-0.5356451, -0.401128, -3.391653, 0.2, 1, 0, 1,
-0.529791, 0.007330056, -2.023219, 0.1921569, 1, 0, 1,
-0.5289571, -1.61554, -3.407143, 0.1882353, 1, 0, 1,
-0.5261268, -0.149499, -0.4443187, 0.1803922, 1, 0, 1,
-0.5221245, 0.8649035, -1.093227, 0.1764706, 1, 0, 1,
-0.5151673, 0.5775052, -1.640122, 0.1686275, 1, 0, 1,
-0.5144888, 1.651751, -0.2370725, 0.1647059, 1, 0, 1,
-0.5130453, 2.166226, -0.05677265, 0.1568628, 1, 0, 1,
-0.5126439, -0.3591951, -2.859591, 0.1529412, 1, 0, 1,
-0.5111843, 0.9078236, -0.6439353, 0.145098, 1, 0, 1,
-0.5092788, -0.9947535, -3.381591, 0.1411765, 1, 0, 1,
-0.5069202, 1.225685, 0.2790232, 0.1333333, 1, 0, 1,
-0.506252, -1.638278, -2.096277, 0.1294118, 1, 0, 1,
-0.5033461, -0.6650015, -3.242717, 0.1215686, 1, 0, 1,
-0.4996677, 1.207383, 0.4545083, 0.1176471, 1, 0, 1,
-0.4966053, -0.1802625, -2.321835, 0.1098039, 1, 0, 1,
-0.4932699, -0.9466131, -2.023119, 0.1058824, 1, 0, 1,
-0.4928805, 0.6890623, -0.955788, 0.09803922, 1, 0, 1,
-0.4920046, -0.4391574, -0.5452838, 0.09019608, 1, 0, 1,
-0.4905403, 0.08656371, -0.8836998, 0.08627451, 1, 0, 1,
-0.4901353, -0.3258932, -1.568823, 0.07843138, 1, 0, 1,
-0.4829764, -1.568333, -2.042299, 0.07450981, 1, 0, 1,
-0.4815814, -0.847945, -2.731029, 0.06666667, 1, 0, 1,
-0.4811368, -0.8939331, -0.5531765, 0.0627451, 1, 0, 1,
-0.4796453, -0.2308399, -1.806634, 0.05490196, 1, 0, 1,
-0.4796305, 0.1478547, -2.233213, 0.05098039, 1, 0, 1,
-0.4769476, 0.4659431, -0.02445529, 0.04313726, 1, 0, 1,
-0.4765606, 0.3222262, -1.715181, 0.03921569, 1, 0, 1,
-0.4740498, -0.2515118, -0.996932, 0.03137255, 1, 0, 1,
-0.4705352, -1.563234, -3.605793, 0.02745098, 1, 0, 1,
-0.4646743, -0.4386479, -2.89252, 0.01960784, 1, 0, 1,
-0.4636978, -0.8475823, -3.244055, 0.01568628, 1, 0, 1,
-0.4630125, -1.626792, -2.601305, 0.007843138, 1, 0, 1,
-0.4627252, -0.0750053, -0.6266524, 0.003921569, 1, 0, 1,
-0.4620109, 0.2578632, -1.994677, 0, 1, 0.003921569, 1,
-0.4579588, 0.5779335, -1.73315, 0, 1, 0.01176471, 1,
-0.4574213, 1.099758, -0.8125141, 0, 1, 0.01568628, 1,
-0.4517842, 0.03303588, 0.5514932, 0, 1, 0.02352941, 1,
-0.4511619, 1.258801, 0.08350892, 0, 1, 0.02745098, 1,
-0.4460525, -1.157734, -6.184252, 0, 1, 0.03529412, 1,
-0.4456673, -0.5246055, -3.524764, 0, 1, 0.03921569, 1,
-0.4414673, -0.2634991, -1.106812, 0, 1, 0.04705882, 1,
-0.4368931, -1.014532, -2.94277, 0, 1, 0.05098039, 1,
-0.4357536, 0.9835594, 0.8188771, 0, 1, 0.05882353, 1,
-0.4344715, 1.521262, -0.4352021, 0, 1, 0.0627451, 1,
-0.429177, -0.5581663, -3.822446, 0, 1, 0.07058824, 1,
-0.4225338, 0.1528784, -1.54615, 0, 1, 0.07450981, 1,
-0.4133757, -0.9924565, -1.786013, 0, 1, 0.08235294, 1,
-0.3999137, -1.273377, -3.497684, 0, 1, 0.08627451, 1,
-0.3988383, 0.08270385, -1.788368, 0, 1, 0.09411765, 1,
-0.3902996, -0.03313866, -3.010949, 0, 1, 0.1019608, 1,
-0.3882727, 0.1900264, -0.790778, 0, 1, 0.1058824, 1,
-0.3863319, 2.288766, 0.9624652, 0, 1, 0.1137255, 1,
-0.3830496, -0.5420821, -3.478681, 0, 1, 0.1176471, 1,
-0.3824363, -0.9169515, -3.929485, 0, 1, 0.1254902, 1,
-0.3793944, 0.1902616, -0.7373393, 0, 1, 0.1294118, 1,
-0.37919, -0.6352288, -2.499728, 0, 1, 0.1372549, 1,
-0.3783919, 0.361135, -1.273984, 0, 1, 0.1411765, 1,
-0.3767397, 2.050982, -0.02651773, 0, 1, 0.1490196, 1,
-0.3705685, 0.3964674, 0.4183159, 0, 1, 0.1529412, 1,
-0.3669004, 0.3373475, -2.370368, 0, 1, 0.1607843, 1,
-0.3628178, -0.233892, -2.011315, 0, 1, 0.1647059, 1,
-0.3619191, -1.013183, -4.179641, 0, 1, 0.172549, 1,
-0.3605245, -1.59292, -2.044839, 0, 1, 0.1764706, 1,
-0.3584172, -0.2228331, -1.493196, 0, 1, 0.1843137, 1,
-0.3579746, 0.8704526, 1.388785, 0, 1, 0.1882353, 1,
-0.3571149, 1.423751, -0.1653604, 0, 1, 0.1960784, 1,
-0.3558073, 1.188038, 1.8664, 0, 1, 0.2039216, 1,
-0.3538152, 0.2315617, -0.5835003, 0, 1, 0.2078431, 1,
-0.3538002, -0.1182835, -3.622301, 0, 1, 0.2156863, 1,
-0.3451006, 0.7249519, -1.581061, 0, 1, 0.2196078, 1,
-0.3440575, 0.7881375, -1.273404, 0, 1, 0.227451, 1,
-0.3395997, -1.876035, -2.051276, 0, 1, 0.2313726, 1,
-0.3388976, 0.1535624, -0.6791899, 0, 1, 0.2392157, 1,
-0.3383542, -0.3082124, -2.151754, 0, 1, 0.2431373, 1,
-0.3371333, 0.05268702, -1.264054, 0, 1, 0.2509804, 1,
-0.3365411, 1.193768, -1.81804, 0, 1, 0.254902, 1,
-0.335297, -2.065596, -1.826146, 0, 1, 0.2627451, 1,
-0.3218318, -0.6812288, -4.865143, 0, 1, 0.2666667, 1,
-0.3205121, 0.849834, -0.5370572, 0, 1, 0.2745098, 1,
-0.3160941, 1.235599, -2.044927, 0, 1, 0.2784314, 1,
-0.3139158, -1.993178, -4.499215, 0, 1, 0.2862745, 1,
-0.3084449, 1.43454, -1.511321, 0, 1, 0.2901961, 1,
-0.3083167, -1.819385, -5.090843, 0, 1, 0.2980392, 1,
-0.3053163, -0.8490175, -3.538934, 0, 1, 0.3058824, 1,
-0.2947891, 0.08016456, -0.001531782, 0, 1, 0.3098039, 1,
-0.294023, 0.5605428, -1.366691, 0, 1, 0.3176471, 1,
-0.2910072, -1.029376, -3.966341, 0, 1, 0.3215686, 1,
-0.2902162, 1.784042, -0.2380133, 0, 1, 0.3294118, 1,
-0.2887018, -0.2862421, 0.1047046, 0, 1, 0.3333333, 1,
-0.2875682, -1.050626, -2.504153, 0, 1, 0.3411765, 1,
-0.2867344, -0.6046467, -0.04906581, 0, 1, 0.345098, 1,
-0.2812109, 0.2764857, -0.6216759, 0, 1, 0.3529412, 1,
-0.2802246, 0.229983, -1.566019, 0, 1, 0.3568628, 1,
-0.2776611, 2.097615, -1.651544, 0, 1, 0.3647059, 1,
-0.275688, -0.3387097, -0.7657669, 0, 1, 0.3686275, 1,
-0.2751827, 2.582171, -0.19852, 0, 1, 0.3764706, 1,
-0.2743384, -0.2425635, -1.880288, 0, 1, 0.3803922, 1,
-0.2740034, 0.5362185, -1.304584, 0, 1, 0.3882353, 1,
-0.2700211, 0.3692493, -0.7716452, 0, 1, 0.3921569, 1,
-0.2696872, 2.59983, -0.6011167, 0, 1, 0.4, 1,
-0.2649156, 1.090194, -0.4096467, 0, 1, 0.4078431, 1,
-0.2644279, -0.4484124, -3.129568, 0, 1, 0.4117647, 1,
-0.2586642, -0.8186017, -2.117475, 0, 1, 0.4196078, 1,
-0.2530634, 1.855134, -1.094972, 0, 1, 0.4235294, 1,
-0.2477077, 1.751283, 1.126505, 0, 1, 0.4313726, 1,
-0.2447055, -1.116402, -3.207234, 0, 1, 0.4352941, 1,
-0.2437575, -0.3827689, -2.394156, 0, 1, 0.4431373, 1,
-0.2421437, 1.132869, 0.1188951, 0, 1, 0.4470588, 1,
-0.2416174, 0.8427519, 0.9165989, 0, 1, 0.454902, 1,
-0.2386944, -0.09744462, -2.923372, 0, 1, 0.4588235, 1,
-0.235216, -0.5445604, -3.438307, 0, 1, 0.4666667, 1,
-0.2346876, 1.837977, -0.10824, 0, 1, 0.4705882, 1,
-0.2337106, -0.06282511, -1.273639, 0, 1, 0.4784314, 1,
-0.2225267, 1.086868, 0.6124684, 0, 1, 0.4823529, 1,
-0.2154774, -1.447868, -2.293636, 0, 1, 0.4901961, 1,
-0.2121247, 1.514329, -2.023463, 0, 1, 0.4941176, 1,
-0.2091601, -0.6935796, -2.940831, 0, 1, 0.5019608, 1,
-0.2089579, 1.191087, -0.4684646, 0, 1, 0.509804, 1,
-0.2060034, 0.0505849, -1.917727, 0, 1, 0.5137255, 1,
-0.2054745, 0.03140417, -1.598059, 0, 1, 0.5215687, 1,
-0.2014515, -1.379394, -3.434056, 0, 1, 0.5254902, 1,
-0.2014501, -0.3514313, -2.565612, 0, 1, 0.5333334, 1,
-0.1995756, 1.589384, 0.3905851, 0, 1, 0.5372549, 1,
-0.1919811, 0.5186474, -1.831695, 0, 1, 0.5450981, 1,
-0.1896077, -0.08788555, -3.633851, 0, 1, 0.5490196, 1,
-0.1888262, -0.4912897, -3.117858, 0, 1, 0.5568628, 1,
-0.1852829, -0.02103, -2.996978, 0, 1, 0.5607843, 1,
-0.1741286, 1.246989, -0.3946479, 0, 1, 0.5686275, 1,
-0.1668478, -1.31185, -2.828057, 0, 1, 0.572549, 1,
-0.1624548, -0.3076327, -3.377987, 0, 1, 0.5803922, 1,
-0.1602234, -0.8050884, -2.392372, 0, 1, 0.5843138, 1,
-0.1565603, 0.1520742, -0.6518961, 0, 1, 0.5921569, 1,
-0.1515023, -0.6974136, -1.646274, 0, 1, 0.5960785, 1,
-0.1510292, 1.585797, 1.266532, 0, 1, 0.6039216, 1,
-0.1509258, -0.3361363, -2.593954, 0, 1, 0.6117647, 1,
-0.1498711, -0.2055033, -1.569676, 0, 1, 0.6156863, 1,
-0.1445488, -1.079974, -3.743989, 0, 1, 0.6235294, 1,
-0.1420112, -0.7393969, -2.576102, 0, 1, 0.627451, 1,
-0.1395651, -0.2185797, -4.346579, 0, 1, 0.6352941, 1,
-0.1313296, -0.7012973, -5.120133, 0, 1, 0.6392157, 1,
-0.129001, 0.8819799, -1.016625, 0, 1, 0.6470588, 1,
-0.1271183, 0.7279703, 0.1965134, 0, 1, 0.6509804, 1,
-0.1247908, 2.092519, -0.6616521, 0, 1, 0.6588235, 1,
-0.1246145, 0.410975, -0.7571871, 0, 1, 0.6627451, 1,
-0.1229334, -0.2953164, -3.310817, 0, 1, 0.6705883, 1,
-0.1208848, 0.7889228, -0.298535, 0, 1, 0.6745098, 1,
-0.1105972, -0.4470352, -2.881438, 0, 1, 0.682353, 1,
-0.1083956, 0.3280474, -0.9244695, 0, 1, 0.6862745, 1,
-0.1043045, 0.1816465, -0.1270534, 0, 1, 0.6941177, 1,
-0.09764937, -1.615528, -1.640406, 0, 1, 0.7019608, 1,
-0.09750725, 0.3226665, -1.148272, 0, 1, 0.7058824, 1,
-0.09698458, -0.1217861, -4.038146, 0, 1, 0.7137255, 1,
-0.09660006, 0.3023327, -0.4331823, 0, 1, 0.7176471, 1,
-0.09570681, 0.01952867, -1.862701, 0, 1, 0.7254902, 1,
-0.09408209, -1.273943, -3.474272, 0, 1, 0.7294118, 1,
-0.09276985, -0.8969348, -4.647119, 0, 1, 0.7372549, 1,
-0.08623389, -0.3079466, -1.987131, 0, 1, 0.7411765, 1,
-0.0859935, 2.2145, 0.3257064, 0, 1, 0.7490196, 1,
-0.08466844, 0.9938917, -0.294255, 0, 1, 0.7529412, 1,
-0.0802119, -0.2654909, -3.434298, 0, 1, 0.7607843, 1,
-0.07369521, 0.1924891, -1.392577, 0, 1, 0.7647059, 1,
-0.07243025, -0.4541783, -5.238292, 0, 1, 0.772549, 1,
-0.07164522, 0.8284557, 1.110727, 0, 1, 0.7764706, 1,
-0.06741324, -1.181896, -2.4041, 0, 1, 0.7843137, 1,
-0.05474677, -0.4281674, -2.780193, 0, 1, 0.7882353, 1,
-0.05253664, -0.7858627, -3.613329, 0, 1, 0.7960784, 1,
-0.04742635, 0.1790477, -0.1766183, 0, 1, 0.8039216, 1,
-0.04155732, 1.08414, 1.291787, 0, 1, 0.8078431, 1,
-0.03598378, 0.8626853, 0.9284703, 0, 1, 0.8156863, 1,
-0.02981107, 0.7831507, 0.9643851, 0, 1, 0.8196079, 1,
-0.02862312, 0.5999566, 1.579097, 0, 1, 0.827451, 1,
-0.0285375, -1.238662, -4.477635, 0, 1, 0.8313726, 1,
-0.028525, -0.2199777, -3.078218, 0, 1, 0.8392157, 1,
-0.02810147, -0.4010444, -3.179394, 0, 1, 0.8431373, 1,
-0.02796108, 0.2145112, -1.070135, 0, 1, 0.8509804, 1,
-0.02778729, -1.237274, -2.551202, 0, 1, 0.854902, 1,
-0.02317296, -1.20531, -3.297208, 0, 1, 0.8627451, 1,
-0.01740601, -1.07074, -5.00758, 0, 1, 0.8666667, 1,
-0.01631434, 0.5563923, 1.077978, 0, 1, 0.8745098, 1,
-0.01554512, 1.690856, -0.6848563, 0, 1, 0.8784314, 1,
-0.006377418, 1.301539, -0.5771726, 0, 1, 0.8862745, 1,
-0.005626614, -0.6671049, -3.749439, 0, 1, 0.8901961, 1,
-0.004814387, -1.417312, -0.9788616, 0, 1, 0.8980392, 1,
-0.003984818, 0.8578781, 0.7286442, 0, 1, 0.9058824, 1,
-0.003133671, -0.3039268, -6.269544, 0, 1, 0.9098039, 1,
-0.0007018578, 0.6937091, -1.164672, 0, 1, 0.9176471, 1,
4.751215e-05, 0.4566534, -1.159637, 0, 1, 0.9215686, 1,
0.001734808, -1.05615, 2.575353, 0, 1, 0.9294118, 1,
0.005446525, 1.3258, 0.173375, 0, 1, 0.9333333, 1,
0.01077696, -0.8207496, 2.76476, 0, 1, 0.9411765, 1,
0.01194371, 0.01830986, 1.96161, 0, 1, 0.945098, 1,
0.01281112, 1.201925, -1.177959, 0, 1, 0.9529412, 1,
0.01337871, -0.01076428, 3.845056, 0, 1, 0.9568627, 1,
0.01505117, -0.1030114, 2.497935, 0, 1, 0.9647059, 1,
0.01620211, -0.3910052, 2.598446, 0, 1, 0.9686275, 1,
0.02008499, 0.5571244, 2.477388, 0, 1, 0.9764706, 1,
0.0244271, -1.159557, 2.513569, 0, 1, 0.9803922, 1,
0.03351613, -0.2757664, 4.199094, 0, 1, 0.9882353, 1,
0.03429502, 0.6218774, 1.204296, 0, 1, 0.9921569, 1,
0.03435383, -0.7050968, 4.206492, 0, 1, 1, 1,
0.03509439, 1.085692, -1.017882, 0, 0.9921569, 1, 1,
0.04150533, -1.952487, 5.350184, 0, 0.9882353, 1, 1,
0.04417874, 1.372277, 0.8841983, 0, 0.9803922, 1, 1,
0.04606896, 0.1153199, 1.527929, 0, 0.9764706, 1, 1,
0.04842347, -0.06233164, 2.502789, 0, 0.9686275, 1, 1,
0.04870005, -1.503488, 4.337175, 0, 0.9647059, 1, 1,
0.05148307, 0.3656735, 0.2328031, 0, 0.9568627, 1, 1,
0.05488539, 0.5602853, -0.2407918, 0, 0.9529412, 1, 1,
0.05499999, -0.955768, 1.870173, 0, 0.945098, 1, 1,
0.05557878, -1.387931, 1.07256, 0, 0.9411765, 1, 1,
0.06194265, 0.5002971, 2.121561, 0, 0.9333333, 1, 1,
0.06520819, 0.3293881, -0.8198121, 0, 0.9294118, 1, 1,
0.07393976, -1.035029, 2.750937, 0, 0.9215686, 1, 1,
0.07444719, -0.0926903, 0.5616688, 0, 0.9176471, 1, 1,
0.07643237, -1.889201, 3.194073, 0, 0.9098039, 1, 1,
0.07650701, -1.667133, 4.918489, 0, 0.9058824, 1, 1,
0.08035135, 0.2614359, 1.264806, 0, 0.8980392, 1, 1,
0.08193382, -1.073103, 3.076946, 0, 0.8901961, 1, 1,
0.08242185, 1.639993, 0.1655469, 0, 0.8862745, 1, 1,
0.08431864, -0.2844764, 2.668517, 0, 0.8784314, 1, 1,
0.08686335, -1.211373, 4.497719, 0, 0.8745098, 1, 1,
0.09501523, -0.6975874, 1.248955, 0, 0.8666667, 1, 1,
0.09613004, 0.1989335, 0.1883665, 0, 0.8627451, 1, 1,
0.09724331, 1.178228, 1.918311, 0, 0.854902, 1, 1,
0.1016517, -1.250602, 2.097007, 0, 0.8509804, 1, 1,
0.1023375, 1.382183, -0.2631571, 0, 0.8431373, 1, 1,
0.1030646, -1.49402, 2.64589, 0, 0.8392157, 1, 1,
0.1037754, -1.893723, 3.939395, 0, 0.8313726, 1, 1,
0.1044692, 1.820118, -0.6912727, 0, 0.827451, 1, 1,
0.1073313, 0.3092252, 0.576852, 0, 0.8196079, 1, 1,
0.1105779, 0.2268897, -0.4616624, 0, 0.8156863, 1, 1,
0.1125098, 0.9757544, 0.0853405, 0, 0.8078431, 1, 1,
0.1131875, -0.6183956, 4.339663, 0, 0.8039216, 1, 1,
0.113492, 1.565545, 0.1233158, 0, 0.7960784, 1, 1,
0.1171237, -0.3897214, 1.247899, 0, 0.7882353, 1, 1,
0.1174134, 0.6419069, -0.9776827, 0, 0.7843137, 1, 1,
0.1294725, 2.399976, -0.4883706, 0, 0.7764706, 1, 1,
0.1300768, -0.9307302, 2.325727, 0, 0.772549, 1, 1,
0.1343877, 0.6767278, 0.1331284, 0, 0.7647059, 1, 1,
0.1369247, 0.06675716, 0.04191958, 0, 0.7607843, 1, 1,
0.1385265, -0.06430858, 1.193537, 0, 0.7529412, 1, 1,
0.1396937, 0.7213402, 0.5591555, 0, 0.7490196, 1, 1,
0.1423324, 0.7118014, 1.220711, 0, 0.7411765, 1, 1,
0.1439265, -0.5647823, 4.194536, 0, 0.7372549, 1, 1,
0.14782, -0.0955376, 0.7627537, 0, 0.7294118, 1, 1,
0.1493696, 0.1739881, -0.2756545, 0, 0.7254902, 1, 1,
0.1497051, 0.06371276, 2.596605, 0, 0.7176471, 1, 1,
0.1502566, 0.3137541, 0.5737803, 0, 0.7137255, 1, 1,
0.1598347, -0.4060996, 2.220891, 0, 0.7058824, 1, 1,
0.1640935, -0.2664867, 1.54111, 0, 0.6980392, 1, 1,
0.1693619, 0.3016478, 0.251873, 0, 0.6941177, 1, 1,
0.1742302, 0.9435483, 0.449333, 0, 0.6862745, 1, 1,
0.17471, 1.552927, 0.1366873, 0, 0.682353, 1, 1,
0.1749852, -0.5295647, 2.893697, 0, 0.6745098, 1, 1,
0.1768646, -0.6967295, 4.089693, 0, 0.6705883, 1, 1,
0.1770916, 0.9996722, 0.4580632, 0, 0.6627451, 1, 1,
0.1816789, -0.05798922, 3.693984, 0, 0.6588235, 1, 1,
0.1842112, 1.833522, 0.7413301, 0, 0.6509804, 1, 1,
0.1845254, 1.41026, 0.2687584, 0, 0.6470588, 1, 1,
0.1855132, 1.372162, -1.393532, 0, 0.6392157, 1, 1,
0.1879241, 1.143276, 0.6693579, 0, 0.6352941, 1, 1,
0.1885966, 0.5544335, -0.4271125, 0, 0.627451, 1, 1,
0.1909286, -0.8665745, 2.814778, 0, 0.6235294, 1, 1,
0.1909475, 1.767621, -0.9280801, 0, 0.6156863, 1, 1,
0.1957448, -0.7186184, 2.767951, 0, 0.6117647, 1, 1,
0.2016332, -1.113488, 4.307237, 0, 0.6039216, 1, 1,
0.2041082, 0.2618103, 2.839581, 0, 0.5960785, 1, 1,
0.2067831, -0.8924211, 0.5777757, 0, 0.5921569, 1, 1,
0.2079999, -0.5837079, 2.324012, 0, 0.5843138, 1, 1,
0.2125947, -0.2994961, 2.197129, 0, 0.5803922, 1, 1,
0.21376, -1.174129, 3.679784, 0, 0.572549, 1, 1,
0.2139957, 1.158206, -0.03547681, 0, 0.5686275, 1, 1,
0.2154348, -0.1525264, 2.617388, 0, 0.5607843, 1, 1,
0.2176127, -0.2502571, 1.106474, 0, 0.5568628, 1, 1,
0.221447, 0.446262, 1.013085, 0, 0.5490196, 1, 1,
0.222438, 0.8891246, -1.300107, 0, 0.5450981, 1, 1,
0.2293204, -0.2426098, 1.113122, 0, 0.5372549, 1, 1,
0.2294645, -0.07288153, 0.9984677, 0, 0.5333334, 1, 1,
0.2296533, 1.162976, -1.385082, 0, 0.5254902, 1, 1,
0.2306523, 2.756425, -0.7618292, 0, 0.5215687, 1, 1,
0.2312151, -0.299366, 4.670776, 0, 0.5137255, 1, 1,
0.2317778, -0.0004900714, 0.2821842, 0, 0.509804, 1, 1,
0.2322052, -0.521017, 2.540233, 0, 0.5019608, 1, 1,
0.2337964, -0.2238842, 1.719592, 0, 0.4941176, 1, 1,
0.2379848, -1.593804, 2.190103, 0, 0.4901961, 1, 1,
0.2385911, 0.8990943, 2.043637, 0, 0.4823529, 1, 1,
0.2565164, 1.984748, 0.606698, 0, 0.4784314, 1, 1,
0.2602723, -0.3664537, 2.05596, 0, 0.4705882, 1, 1,
0.2607709, 0.4457288, 0.4682009, 0, 0.4666667, 1, 1,
0.2663065, -1.091351, 3.656917, 0, 0.4588235, 1, 1,
0.2671262, 0.4301435, -0.01246074, 0, 0.454902, 1, 1,
0.271693, -0.1269343, 2.553954, 0, 0.4470588, 1, 1,
0.274197, -1.031974, 3.382973, 0, 0.4431373, 1, 1,
0.2744166, -0.1448704, 3.983409, 0, 0.4352941, 1, 1,
0.2794159, 0.6933304, -0.9967857, 0, 0.4313726, 1, 1,
0.2796683, -1.413198, 3.984475, 0, 0.4235294, 1, 1,
0.2865669, -1.292768, 2.642048, 0, 0.4196078, 1, 1,
0.2873352, 0.9515421, 1.932184, 0, 0.4117647, 1, 1,
0.289655, 0.06427764, 2.778666, 0, 0.4078431, 1, 1,
0.2920559, 1.277956, 0.2603599, 0, 0.4, 1, 1,
0.3007054, 0.2212121, 0.916879, 0, 0.3921569, 1, 1,
0.3008384, 0.6951836, 0.01534068, 0, 0.3882353, 1, 1,
0.3055387, 1.852962, -0.3920677, 0, 0.3803922, 1, 1,
0.306678, -0.7102376, 1.750007, 0, 0.3764706, 1, 1,
0.3121456, 0.3512438, 1.224776, 0, 0.3686275, 1, 1,
0.3122275, -0.0515577, 0.8690876, 0, 0.3647059, 1, 1,
0.3163869, 0.6160308, 0.9371868, 0, 0.3568628, 1, 1,
0.3236441, -0.8222188, 1.032969, 0, 0.3529412, 1, 1,
0.3258563, -0.08189666, 2.550309, 0, 0.345098, 1, 1,
0.3262312, 0.1776722, -0.8191035, 0, 0.3411765, 1, 1,
0.3289557, -1.022439, 2.61387, 0, 0.3333333, 1, 1,
0.3324354, -0.08690598, 2.379134, 0, 0.3294118, 1, 1,
0.3388989, -0.8545043, 1.054891, 0, 0.3215686, 1, 1,
0.3412095, 0.3267652, -0.2875821, 0, 0.3176471, 1, 1,
0.3518717, -0.05510775, 1.985644, 0, 0.3098039, 1, 1,
0.3519927, -1.079605, 1.721084, 0, 0.3058824, 1, 1,
0.352858, 0.9016774, 1.509303, 0, 0.2980392, 1, 1,
0.3538376, -1.369051, 3.16286, 0, 0.2901961, 1, 1,
0.3542524, 0.2986406, 1.188306, 0, 0.2862745, 1, 1,
0.3547416, -1.840105, 1.874413, 0, 0.2784314, 1, 1,
0.3565327, 1.498336, 0.5686605, 0, 0.2745098, 1, 1,
0.3600486, -1.968678, 3.17877, 0, 0.2666667, 1, 1,
0.3661555, -0.002412019, 3.416613, 0, 0.2627451, 1, 1,
0.3708437, -1.189514, 2.723076, 0, 0.254902, 1, 1,
0.3758754, 0.0723923, 0.761072, 0, 0.2509804, 1, 1,
0.3778862, 1.332596, 0.5737061, 0, 0.2431373, 1, 1,
0.3814977, -0.4052765, 2.425387, 0, 0.2392157, 1, 1,
0.3871569, -0.8038848, 1.959846, 0, 0.2313726, 1, 1,
0.3891812, -0.4898357, 2.370085, 0, 0.227451, 1, 1,
0.3961383, 1.954775, 1.598959, 0, 0.2196078, 1, 1,
0.3971592, -1.731454, 4.328215, 0, 0.2156863, 1, 1,
0.4002369, -2.440282, 1.851205, 0, 0.2078431, 1, 1,
0.4006423, -1.571172, 3.586136, 0, 0.2039216, 1, 1,
0.4025795, 0.856728, 0.6865617, 0, 0.1960784, 1, 1,
0.4055174, 0.9414305, 1.801503, 0, 0.1882353, 1, 1,
0.4056356, 1.07831, 1.396297, 0, 0.1843137, 1, 1,
0.4118302, 0.4483657, 2.287596, 0, 0.1764706, 1, 1,
0.4146214, 1.230694, 1.710598, 0, 0.172549, 1, 1,
0.4152336, -1.416918, 2.920417, 0, 0.1647059, 1, 1,
0.4227008, 0.7220786, 0.2482473, 0, 0.1607843, 1, 1,
0.4238138, -1.086409, 3.210883, 0, 0.1529412, 1, 1,
0.4246846, 0.5397574, -0.6909646, 0, 0.1490196, 1, 1,
0.4264814, -1.277595, 2.074054, 0, 0.1411765, 1, 1,
0.4274229, -0.02339768, 2.57367, 0, 0.1372549, 1, 1,
0.4322391, 1.14827, -0.3458167, 0, 0.1294118, 1, 1,
0.4351248, 0.3470578, 1.600804, 0, 0.1254902, 1, 1,
0.4356726, 1.576483, -1.003093, 0, 0.1176471, 1, 1,
0.4375266, 0.1823214, 2.678006, 0, 0.1137255, 1, 1,
0.4482699, -0.07326244, -0.01491539, 0, 0.1058824, 1, 1,
0.4497382, 0.2714704, 1.188473, 0, 0.09803922, 1, 1,
0.4527238, -0.9209758, 2.583666, 0, 0.09411765, 1, 1,
0.4532682, -0.9581393, 2.103611, 0, 0.08627451, 1, 1,
0.4534731, -0.607865, 3.390186, 0, 0.08235294, 1, 1,
0.4581493, 0.0725555, 1.052519, 0, 0.07450981, 1, 1,
0.4585275, -0.03713021, 1.132889, 0, 0.07058824, 1, 1,
0.4590714, -0.3449896, 1.74985, 0, 0.0627451, 1, 1,
0.4595485, 1.343859, 0.397732, 0, 0.05882353, 1, 1,
0.4611458, 0.3438526, 0.6540011, 0, 0.05098039, 1, 1,
0.4655418, -1.013487, 2.766161, 0, 0.04705882, 1, 1,
0.4673173, 0.3526665, 0.6755853, 0, 0.03921569, 1, 1,
0.4680774, -0.503433, 2.501261, 0, 0.03529412, 1, 1,
0.4725679, -0.2465497, 2.2592, 0, 0.02745098, 1, 1,
0.4756781, -0.4971848, 1.499217, 0, 0.02352941, 1, 1,
0.4777412, 0.3356557, 0.4797193, 0, 0.01568628, 1, 1,
0.4805034, -2.611634, 5.324947, 0, 0.01176471, 1, 1,
0.4805124, 0.4869934, 0.9313303, 0, 0.003921569, 1, 1,
0.4823945, 0.918215, -0.00152623, 0.003921569, 0, 1, 1,
0.4836223, 0.04666069, 2.135879, 0.007843138, 0, 1, 1,
0.4957345, -1.263845, 3.38379, 0.01568628, 0, 1, 1,
0.506881, 0.07176615, 2.383871, 0.01960784, 0, 1, 1,
0.5128908, -0.8647922, 3.676782, 0.02745098, 0, 1, 1,
0.5134534, -3.163558, 1.956802, 0.03137255, 0, 1, 1,
0.5142254, -0.5934389, 1.538753, 0.03921569, 0, 1, 1,
0.5167787, 0.2083426, 1.664412, 0.04313726, 0, 1, 1,
0.5173783, -0.8160622, 1.324585, 0.05098039, 0, 1, 1,
0.5194364, -0.8176714, 2.696383, 0.05490196, 0, 1, 1,
0.5213582, 1.125508, 0.7776518, 0.0627451, 0, 1, 1,
0.5236805, -1.223709, 1.236868, 0.06666667, 0, 1, 1,
0.5273721, 0.3790175, 2.008435, 0.07450981, 0, 1, 1,
0.5288852, 0.1025205, 3.284379, 0.07843138, 0, 1, 1,
0.5320175, 0.02425442, 0.5532116, 0.08627451, 0, 1, 1,
0.5355641, 0.418626, 0.2940312, 0.09019608, 0, 1, 1,
0.5386175, -1.046739, 2.501353, 0.09803922, 0, 1, 1,
0.5536362, -0.1682966, 3.185557, 0.1058824, 0, 1, 1,
0.5572997, -0.9833356, 1.941162, 0.1098039, 0, 1, 1,
0.5577413, -0.7025889, 1.614666, 0.1176471, 0, 1, 1,
0.5624411, -0.05844416, 1.274841, 0.1215686, 0, 1, 1,
0.5636209, 0.9226608, 1.000393, 0.1294118, 0, 1, 1,
0.5642651, 0.417785, 1.426905, 0.1333333, 0, 1, 1,
0.5648914, 0.8607907, -0.1146529, 0.1411765, 0, 1, 1,
0.5651554, -0.9261199, 1.847463, 0.145098, 0, 1, 1,
0.5660045, -0.87164, 2.885011, 0.1529412, 0, 1, 1,
0.5660705, -1.875531, 2.275378, 0.1568628, 0, 1, 1,
0.5666524, -1.080636, 3.616628, 0.1647059, 0, 1, 1,
0.5702309, -2.018522, 3.483258, 0.1686275, 0, 1, 1,
0.5721167, 0.1001623, 3.315927, 0.1764706, 0, 1, 1,
0.5739433, 0.3888002, 1.623997, 0.1803922, 0, 1, 1,
0.5742487, -0.3372975, 4.724711, 0.1882353, 0, 1, 1,
0.574719, 0.397941, 1.08383, 0.1921569, 0, 1, 1,
0.5758915, -1.34175, 2.43264, 0.2, 0, 1, 1,
0.5765235, 1.43888, 0.8756254, 0.2078431, 0, 1, 1,
0.5765454, 0.5034544, -0.4279368, 0.2117647, 0, 1, 1,
0.5775127, 0.2544836, 1.6305, 0.2196078, 0, 1, 1,
0.5786223, -0.07141582, 0.6003723, 0.2235294, 0, 1, 1,
0.581629, -1.13508, 2.775193, 0.2313726, 0, 1, 1,
0.5902889, 0.8022734, 1.095349, 0.2352941, 0, 1, 1,
0.5912861, 1.686422, 0.5128108, 0.2431373, 0, 1, 1,
0.5943573, 1.237899, 0.01914797, 0.2470588, 0, 1, 1,
0.6006206, -1.911939, 1.864271, 0.254902, 0, 1, 1,
0.6029781, -1.42974, 3.882962, 0.2588235, 0, 1, 1,
0.6037824, -0.701863, 3.087329, 0.2666667, 0, 1, 1,
0.6048619, -2.061748, 2.86928, 0.2705882, 0, 1, 1,
0.6077671, 0.01238001, 1.970053, 0.2784314, 0, 1, 1,
0.6083008, -0.5526915, 3.0748, 0.282353, 0, 1, 1,
0.6086501, 0.5031635, 0.7376691, 0.2901961, 0, 1, 1,
0.6149688, -0.49065, 1.905305, 0.2941177, 0, 1, 1,
0.6196768, 1.277899, 0.3122725, 0.3019608, 0, 1, 1,
0.6199207, 1.68064, 0.3012322, 0.3098039, 0, 1, 1,
0.6208786, 0.1836041, 4.534034, 0.3137255, 0, 1, 1,
0.6241201, -2.512398, 1.446361, 0.3215686, 0, 1, 1,
0.6247165, -0.727464, 4.360794, 0.3254902, 0, 1, 1,
0.6281655, -1.49145, 2.51752, 0.3333333, 0, 1, 1,
0.6282001, 0.4822463, 0.556088, 0.3372549, 0, 1, 1,
0.6363989, -0.7957917, 4.371855, 0.345098, 0, 1, 1,
0.6381431, -0.3681597, 4.009762, 0.3490196, 0, 1, 1,
0.6382878, 0.3236655, 0.5872886, 0.3568628, 0, 1, 1,
0.6471183, 0.7232932, 0.8528637, 0.3607843, 0, 1, 1,
0.6472132, -1.272659, 3.998104, 0.3686275, 0, 1, 1,
0.648155, -0.4974606, 3.623058, 0.372549, 0, 1, 1,
0.6493429, -3.828464, 1.778474, 0.3803922, 0, 1, 1,
0.6528282, -0.9729381, 1.801662, 0.3843137, 0, 1, 1,
0.6530105, 0.7777049, 0.8648322, 0.3921569, 0, 1, 1,
0.6542436, 0.30437, 2.766613, 0.3960784, 0, 1, 1,
0.6549729, 0.08302028, 2.655415, 0.4039216, 0, 1, 1,
0.6571671, -0.93957, 2.985908, 0.4117647, 0, 1, 1,
0.6688775, -1.431011, 2.97152, 0.4156863, 0, 1, 1,
0.6732272, 1.012842, 0.6193871, 0.4235294, 0, 1, 1,
0.6750261, 1.363337, -0.9434388, 0.427451, 0, 1, 1,
0.6768728, 1.329596, 0.5856569, 0.4352941, 0, 1, 1,
0.6787983, 0.01148439, 0.0009157075, 0.4392157, 0, 1, 1,
0.679295, 0.3625302, 3.360235, 0.4470588, 0, 1, 1,
0.685343, -1.83912, 3.145383, 0.4509804, 0, 1, 1,
0.6871656, 1.458601, 1.265443, 0.4588235, 0, 1, 1,
0.6921699, -0.6754151, 0.9168078, 0.4627451, 0, 1, 1,
0.692558, 1.693553, 0.02315315, 0.4705882, 0, 1, 1,
0.6937625, 1.582832, -0.2894097, 0.4745098, 0, 1, 1,
0.6968291, -0.7492886, 1.688671, 0.4823529, 0, 1, 1,
0.6976072, 0.4220003, 1.758413, 0.4862745, 0, 1, 1,
0.69838, -0.7664255, 2.773275, 0.4941176, 0, 1, 1,
0.7051895, 1.571927, -0.2168311, 0.5019608, 0, 1, 1,
0.7192025, -2.206491, 1.498115, 0.5058824, 0, 1, 1,
0.7202975, 1.059868, 1.810489, 0.5137255, 0, 1, 1,
0.72306, -0.7399511, 2.677099, 0.5176471, 0, 1, 1,
0.7231835, 1.175794, 0.4622762, 0.5254902, 0, 1, 1,
0.7280395, 0.6639903, -0.358925, 0.5294118, 0, 1, 1,
0.730719, 0.5641223, 0.4333097, 0.5372549, 0, 1, 1,
0.7309162, -1.07539, 1.496891, 0.5411765, 0, 1, 1,
0.7375904, -0.9501096, 3.419388, 0.5490196, 0, 1, 1,
0.7425836, -0.03969703, 0.3782886, 0.5529412, 0, 1, 1,
0.7461633, 0.8885058, -0.8513524, 0.5607843, 0, 1, 1,
0.7465982, -3.014213, 1.590776, 0.5647059, 0, 1, 1,
0.7544873, -1.256934, 3.903617, 0.572549, 0, 1, 1,
0.7563804, 0.06939032, 1.376852, 0.5764706, 0, 1, 1,
0.758814, 0.3051403, 1.797805, 0.5843138, 0, 1, 1,
0.7620903, 1.175458, -0.9979231, 0.5882353, 0, 1, 1,
0.7641715, -0.4390425, 3.186042, 0.5960785, 0, 1, 1,
0.7685158, 0.3541118, 0.9121878, 0.6039216, 0, 1, 1,
0.7699993, 0.07200082, 0.05180465, 0.6078432, 0, 1, 1,
0.7727866, 1.344522, -0.05570737, 0.6156863, 0, 1, 1,
0.7757657, 0.6713638, -0.2205121, 0.6196079, 0, 1, 1,
0.7867785, -0.7395068, 3.046974, 0.627451, 0, 1, 1,
0.7871245, -1.449214, 5.304384, 0.6313726, 0, 1, 1,
0.7907416, -0.05750031, 1.053814, 0.6392157, 0, 1, 1,
0.7915154, 1.903578, 0.889641, 0.6431373, 0, 1, 1,
0.7934505, 1.19824, 1.28984, 0.6509804, 0, 1, 1,
0.7979238, -0.2928259, 1.444857, 0.654902, 0, 1, 1,
0.7981448, 1.082789, 1.580407, 0.6627451, 0, 1, 1,
0.8027164, 0.5498141, 1.546169, 0.6666667, 0, 1, 1,
0.8095131, -1.08273, 4.507248, 0.6745098, 0, 1, 1,
0.8105999, 0.4437066, 0.9480363, 0.6784314, 0, 1, 1,
0.819164, -0.227781, 0.8987728, 0.6862745, 0, 1, 1,
0.8204809, -0.8354676, 2.422955, 0.6901961, 0, 1, 1,
0.8232139, -0.4308604, 1.943909, 0.6980392, 0, 1, 1,
0.8242984, -0.06892405, 2.288307, 0.7058824, 0, 1, 1,
0.8335152, 0.09144709, 1.603301, 0.7098039, 0, 1, 1,
0.8380797, -0.7204016, 2.196958, 0.7176471, 0, 1, 1,
0.8481189, -1.372218, 2.401207, 0.7215686, 0, 1, 1,
0.848183, 0.7301435, -2.468995, 0.7294118, 0, 1, 1,
0.8487533, -0.3797338, 1.268304, 0.7333333, 0, 1, 1,
0.8525227, 0.02215881, 2.110388, 0.7411765, 0, 1, 1,
0.8535498, -0.009699528, 1.885184, 0.7450981, 0, 1, 1,
0.8602637, -0.1088592, 2.208917, 0.7529412, 0, 1, 1,
0.8616391, 0.03827142, 1.023594, 0.7568628, 0, 1, 1,
0.8647152, 1.903512, -1.646295, 0.7647059, 0, 1, 1,
0.879965, 0.09044279, 1.362533, 0.7686275, 0, 1, 1,
0.8834944, -0.4802418, 1.724751, 0.7764706, 0, 1, 1,
0.8901583, 0.5336936, 0.8670518, 0.7803922, 0, 1, 1,
0.8939269, 0.9852649, 1.144654, 0.7882353, 0, 1, 1,
0.8954967, 0.9540879, -0.6060418, 0.7921569, 0, 1, 1,
0.9052538, -1.639784, 2.833464, 0.8, 0, 1, 1,
0.9116638, 1.155892, -0.7221093, 0.8078431, 0, 1, 1,
0.9141193, -0.4253003, 3.226762, 0.8117647, 0, 1, 1,
0.924384, 0.1215737, 1.60795, 0.8196079, 0, 1, 1,
0.927457, -0.03544641, 0.6771219, 0.8235294, 0, 1, 1,
0.9304274, 0.3654537, 1.498428, 0.8313726, 0, 1, 1,
0.9306163, -0.9625117, -0.01662773, 0.8352941, 0, 1, 1,
0.9425539, 1.997759, -0.4246481, 0.8431373, 0, 1, 1,
0.9457944, -0.6789713, 1.661626, 0.8470588, 0, 1, 1,
0.946122, -0.2756644, 1.687801, 0.854902, 0, 1, 1,
0.9478236, -0.3846736, 2.458254, 0.8588235, 0, 1, 1,
0.9480156, 1.068629, -0.1421589, 0.8666667, 0, 1, 1,
0.9509698, -0.1167103, 1.903503, 0.8705882, 0, 1, 1,
0.953035, 0.0976922, 1.813084, 0.8784314, 0, 1, 1,
0.9531977, -1.251809, -0.1093835, 0.8823529, 0, 1, 1,
0.9546129, 0.5444324, 0.3505677, 0.8901961, 0, 1, 1,
0.9549778, 0.1414192, 2.307037, 0.8941177, 0, 1, 1,
0.9565547, 2.719374, 0.9578926, 0.9019608, 0, 1, 1,
0.9687019, -0.3884603, 1.529324, 0.9098039, 0, 1, 1,
0.9773595, -1.230249, 3.38694, 0.9137255, 0, 1, 1,
0.9822843, 0.7423429, 2.184248, 0.9215686, 0, 1, 1,
0.9830924, 0.8017912, 2.509856, 0.9254902, 0, 1, 1,
0.9836282, -0.1392952, 0.1122359, 0.9333333, 0, 1, 1,
0.9871777, 1.045707, 0.4134405, 0.9372549, 0, 1, 1,
0.9922063, 1.071823, 0.3248984, 0.945098, 0, 1, 1,
0.99253, -1.21017, 1.401983, 0.9490196, 0, 1, 1,
0.993697, 0.2845228, 1.820992, 0.9568627, 0, 1, 1,
0.9942274, 0.4304814, 1.740533, 0.9607843, 0, 1, 1,
1.000625, 1.518699, -0.2627956, 0.9686275, 0, 1, 1,
1.001502, -0.7399225, 2.493803, 0.972549, 0, 1, 1,
1.004603, -0.1710497, 2.077352, 0.9803922, 0, 1, 1,
1.009037, 1.073415, 0.1157087, 0.9843137, 0, 1, 1,
1.01154, -0.1680987, 1.039409, 0.9921569, 0, 1, 1,
1.011823, -0.3178809, 0.9350016, 0.9960784, 0, 1, 1,
1.011936, -2.611653, 2.657676, 1, 0, 0.9960784, 1,
1.012129, 0.1465966, 1.629686, 1, 0, 0.9882353, 1,
1.013562, 0.6961261, -0.7218375, 1, 0, 0.9843137, 1,
1.014162, -0.06992383, -1.844905, 1, 0, 0.9764706, 1,
1.019851, -0.2951441, 2.52026, 1, 0, 0.972549, 1,
1.025422, 1.187611, -0.8076972, 1, 0, 0.9647059, 1,
1.029436, -1.76037, 2.928895, 1, 0, 0.9607843, 1,
1.029972, -0.4402881, 2.217495, 1, 0, 0.9529412, 1,
1.030662, 0.4382843, 1.529007, 1, 0, 0.9490196, 1,
1.031061, -1.042349, 2.307253, 1, 0, 0.9411765, 1,
1.031286, 0.9088401, 0.5048988, 1, 0, 0.9372549, 1,
1.032907, -0.2199701, 1.258922, 1, 0, 0.9294118, 1,
1.038442, -0.03893116, 2.420709, 1, 0, 0.9254902, 1,
1.043609, -0.1129994, 1.357742, 1, 0, 0.9176471, 1,
1.047781, -0.9883046, 3.558518, 1, 0, 0.9137255, 1,
1.048175, -0.2431639, 1.116516, 1, 0, 0.9058824, 1,
1.053484, 2.44979, 0.672475, 1, 0, 0.9019608, 1,
1.064238, -1.111464, 2.599087, 1, 0, 0.8941177, 1,
1.066682, 0.695954, 0.515431, 1, 0, 0.8862745, 1,
1.07052, -0.3571341, 1.397186, 1, 0, 0.8823529, 1,
1.074721, -1.055514, 2.521526, 1, 0, 0.8745098, 1,
1.083616, 0.5554579, 0.357523, 1, 0, 0.8705882, 1,
1.08595, -1.336783, 1.742499, 1, 0, 0.8627451, 1,
1.086336, -1.524392, 2.957048, 1, 0, 0.8588235, 1,
1.086857, -0.5047842, 2.415692, 1, 0, 0.8509804, 1,
1.093474, -0.4612739, 1.122543, 1, 0, 0.8470588, 1,
1.094347, 0.6645402, 1.174488, 1, 0, 0.8392157, 1,
1.097168, 1.632763, 0.3089927, 1, 0, 0.8352941, 1,
1.102522, 0.9925947, 0.6052015, 1, 0, 0.827451, 1,
1.110181, -0.2050623, 2.371803, 1, 0, 0.8235294, 1,
1.110716, -0.8359309, 1.702019, 1, 0, 0.8156863, 1,
1.11078, -0.8313982, 1.922739, 1, 0, 0.8117647, 1,
1.115069, 0.5898171, 0.9796452, 1, 0, 0.8039216, 1,
1.118689, -0.6918715, 2.446691, 1, 0, 0.7960784, 1,
1.11897, -2.246567, 3.730172, 1, 0, 0.7921569, 1,
1.121274, -0.6688137, 1.318211, 1, 0, 0.7843137, 1,
1.123849, -0.6028814, 2.936351, 1, 0, 0.7803922, 1,
1.129832, -1.284762, 3.29919, 1, 0, 0.772549, 1,
1.129926, -0.07067259, 1.830333, 1, 0, 0.7686275, 1,
1.135368, 1.428196, 2.25837, 1, 0, 0.7607843, 1,
1.135777, -0.1349717, 0.9568935, 1, 0, 0.7568628, 1,
1.139888, -0.5958909, 2.173696, 1, 0, 0.7490196, 1,
1.143215, 0.2531018, 3.117613, 1, 0, 0.7450981, 1,
1.144653, -0.3468525, -0.01924775, 1, 0, 0.7372549, 1,
1.146269, -1.005797, 3.776299, 1, 0, 0.7333333, 1,
1.149531, 2.381912, 2.698344, 1, 0, 0.7254902, 1,
1.165873, -0.3996585, 0.4586943, 1, 0, 0.7215686, 1,
1.17819, 0.2796279, 0.5045953, 1, 0, 0.7137255, 1,
1.180677, -1.477916, 2.647045, 1, 0, 0.7098039, 1,
1.180725, 0.9306998, -0.2632041, 1, 0, 0.7019608, 1,
1.181228, -0.1478186, 0.09359661, 1, 0, 0.6941177, 1,
1.186782, -0.8296741, 1.959116, 1, 0, 0.6901961, 1,
1.186857, 0.3507485, 2.206395, 1, 0, 0.682353, 1,
1.195118, -0.007041423, 1.503679, 1, 0, 0.6784314, 1,
1.197068, -0.5976462, 2.656654, 1, 0, 0.6705883, 1,
1.201741, -1.608341, 1.946189, 1, 0, 0.6666667, 1,
1.203537, -0.3006583, 1.81186, 1, 0, 0.6588235, 1,
1.206875, -0.09984232, 1.416259, 1, 0, 0.654902, 1,
1.214609, -0.8874972, 0.5301495, 1, 0, 0.6470588, 1,
1.217942, -0.05002923, 1.263914, 1, 0, 0.6431373, 1,
1.231297, -0.444178, 3.479674, 1, 0, 0.6352941, 1,
1.231442, 0.1530275, 1.467808, 1, 0, 0.6313726, 1,
1.232452, -0.2666562, 1.469953, 1, 0, 0.6235294, 1,
1.247988, -1.12053, 3.396576, 1, 0, 0.6196079, 1,
1.254629, 1.439103, 1.191833, 1, 0, 0.6117647, 1,
1.256632, 0.05025131, 1.068727, 1, 0, 0.6078432, 1,
1.256986, 0.5901817, 0.2195549, 1, 0, 0.6, 1,
1.262715, -1.442808, 1.762477, 1, 0, 0.5921569, 1,
1.268385, 0.231314, 0.7086099, 1, 0, 0.5882353, 1,
1.272205, -0.7372674, 2.235288, 1, 0, 0.5803922, 1,
1.27641, 0.03624374, 2.050755, 1, 0, 0.5764706, 1,
1.278627, 0.08228288, -0.4255627, 1, 0, 0.5686275, 1,
1.281305, -0.5705865, 2.97343, 1, 0, 0.5647059, 1,
1.288285, 1.787492, 0.4108365, 1, 0, 0.5568628, 1,
1.305381, -0.7136213, 1.912945, 1, 0, 0.5529412, 1,
1.30591, 0.7462774, 1.261121, 1, 0, 0.5450981, 1,
1.321504, -0.3259195, 2.867349, 1, 0, 0.5411765, 1,
1.324844, 0.7784097, 1.544142, 1, 0, 0.5333334, 1,
1.343148, 0.9993042, 1.314724, 1, 0, 0.5294118, 1,
1.343562, 0.08558633, 3.359889, 1, 0, 0.5215687, 1,
1.34963, 0.5172952, 0.143197, 1, 0, 0.5176471, 1,
1.354824, -0.1163158, 2.863962, 1, 0, 0.509804, 1,
1.361101, 0.9853096, 1.076858, 1, 0, 0.5058824, 1,
1.362152, -0.6491867, 2.616228, 1, 0, 0.4980392, 1,
1.362481, -0.5045034, 1.495213, 1, 0, 0.4901961, 1,
1.387564, 0.02681095, 0.9847995, 1, 0, 0.4862745, 1,
1.400495, 0.5011216, 0.4874122, 1, 0, 0.4784314, 1,
1.403657, 0.6958814, 1.263295, 1, 0, 0.4745098, 1,
1.411526, -0.6963637, 1.185752, 1, 0, 0.4666667, 1,
1.413689, 0.326506, 2.117166, 1, 0, 0.4627451, 1,
1.422217, -0.2367063, 0.933392, 1, 0, 0.454902, 1,
1.423884, 2.333006, -0.1825088, 1, 0, 0.4509804, 1,
1.425744, -0.6389681, 2.023934, 1, 0, 0.4431373, 1,
1.427768, -1.52267, 3.041751, 1, 0, 0.4392157, 1,
1.436317, 0.9801536, 1.897295, 1, 0, 0.4313726, 1,
1.443345, -0.443565, 1.40712, 1, 0, 0.427451, 1,
1.447218, 0.5432508, 1.075439, 1, 0, 0.4196078, 1,
1.447855, 0.7411101, -1.043819, 1, 0, 0.4156863, 1,
1.449581, -1.215336, 2.793784, 1, 0, 0.4078431, 1,
1.459068, -0.02696416, 1.793862, 1, 0, 0.4039216, 1,
1.460823, 1.489747, 0.8710572, 1, 0, 0.3960784, 1,
1.465613, 0.893257, 1.964838, 1, 0, 0.3882353, 1,
1.466584, 0.3681546, 1.149127, 1, 0, 0.3843137, 1,
1.471866, 1.012352, 1.595629, 1, 0, 0.3764706, 1,
1.472302, -1.267482, 4.965253, 1, 0, 0.372549, 1,
1.472726, -2.532644, 3.718626, 1, 0, 0.3647059, 1,
1.473162, -0.9190965, 1.734442, 1, 0, 0.3607843, 1,
1.490047, -0.9734905, -1.082295, 1, 0, 0.3529412, 1,
1.503251, 0.5680183, 2.446572, 1, 0, 0.3490196, 1,
1.503589, -1.152897, 2.558001, 1, 0, 0.3411765, 1,
1.507593, -1.002979, 3.776018, 1, 0, 0.3372549, 1,
1.545093, 0.3253896, 0.6866661, 1, 0, 0.3294118, 1,
1.557105, 1.125335, 0.6215603, 1, 0, 0.3254902, 1,
1.580848, 0.4589866, 0.4767202, 1, 0, 0.3176471, 1,
1.587189, 0.1742929, 1.059549, 1, 0, 0.3137255, 1,
1.590208, 1.093451, 2.95089, 1, 0, 0.3058824, 1,
1.604102, 1.536048, -0.6842159, 1, 0, 0.2980392, 1,
1.610619, 1.179209, 1.257949, 1, 0, 0.2941177, 1,
1.618658, -0.3933739, 2.525867, 1, 0, 0.2862745, 1,
1.629663, -0.1093764, 3.467215, 1, 0, 0.282353, 1,
1.630072, 0.6768032, -1.021382, 1, 0, 0.2745098, 1,
1.6321, -0.1009261, 2.746421, 1, 0, 0.2705882, 1,
1.679083, 0.3224116, 2.246108, 1, 0, 0.2627451, 1,
1.707333, -0.2251215, 3.456158, 1, 0, 0.2588235, 1,
1.710335, -0.2630663, 2.80627, 1, 0, 0.2509804, 1,
1.722326, -0.43247, 1.975542, 1, 0, 0.2470588, 1,
1.728698, -0.2161822, 0.650396, 1, 0, 0.2392157, 1,
1.758126, -0.2880567, 2.344407, 1, 0, 0.2352941, 1,
1.762545, -0.493167, 0.7916824, 1, 0, 0.227451, 1,
1.788836, -0.7634454, 3.437602, 1, 0, 0.2235294, 1,
1.845196, -0.205032, 1.451126, 1, 0, 0.2156863, 1,
1.848125, 0.04931578, 2.656127, 1, 0, 0.2117647, 1,
1.871855, 1.195195, 0.2414237, 1, 0, 0.2039216, 1,
1.903214, -0.2332258, 1.257533, 1, 0, 0.1960784, 1,
1.907198, -0.2932178, 1.776269, 1, 0, 0.1921569, 1,
1.919677, 0.1853582, 2.309677, 1, 0, 0.1843137, 1,
1.930463, 2.320284, -0.2967381, 1, 0, 0.1803922, 1,
1.934732, 0.3452276, 3.027535, 1, 0, 0.172549, 1,
1.935662, -0.4435662, 1.511379, 1, 0, 0.1686275, 1,
1.955589, -0.4691982, 0.9531449, 1, 0, 0.1607843, 1,
1.991615, -0.8611987, 1.339684, 1, 0, 0.1568628, 1,
1.993105, -1.510765, 1.454252, 1, 0, 0.1490196, 1,
1.994074, -1.515022, 2.748142, 1, 0, 0.145098, 1,
2.038138, 0.1071616, 1.76345, 1, 0, 0.1372549, 1,
2.065472, -0.4152856, 0.6347684, 1, 0, 0.1333333, 1,
2.068064, 1.688147, -0.6790528, 1, 0, 0.1254902, 1,
2.094044, -0.9827443, 1.671463, 1, 0, 0.1215686, 1,
2.129361, -0.1051765, 2.446382, 1, 0, 0.1137255, 1,
2.198653, -0.01882284, 2.351985, 1, 0, 0.1098039, 1,
2.237638, 0.2783865, 2.880318, 1, 0, 0.1019608, 1,
2.254886, -0.03232021, 0.4309184, 1, 0, 0.09411765, 1,
2.327054, -2.538424, 3.362402, 1, 0, 0.09019608, 1,
2.327681, 0.389222, 0.93758, 1, 0, 0.08235294, 1,
2.331046, -2.875937, 2.273125, 1, 0, 0.07843138, 1,
2.389363, -1.248196, 2.60979, 1, 0, 0.07058824, 1,
2.416102, -0.9697034, 2.577208, 1, 0, 0.06666667, 1,
2.477036, -0.7134867, 1.589502, 1, 0, 0.05882353, 1,
2.483305, -0.1059501, 2.046531, 1, 0, 0.05490196, 1,
2.601086, -0.01173114, 1.669787, 1, 0, 0.04705882, 1,
2.642816, -0.3697275, 0.8262725, 1, 0, 0.04313726, 1,
2.707547, -1.730502, 1.693568, 1, 0, 0.03529412, 1,
2.761985, 0.5727818, 1.834587, 1, 0, 0.03137255, 1,
2.809943, 0.770535, 1.618839, 1, 0, 0.02352941, 1,
2.997886, -0.5361973, 1.329055, 1, 0, 0.01960784, 1,
3.0575, -0.6555098, 2.129641, 1, 0, 0.01176471, 1,
3.508534, 1.714164, 0.1492165, 1, 0, 0.007843138, 1
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
0.09778774, -4.945217, -8.239088, 0, -0.5, 0.5, 0.5,
0.09778774, -4.945217, -8.239088, 1, -0.5, 0.5, 0.5,
0.09778774, -4.945217, -8.239088, 1, 1.5, 0.5, 0.5,
0.09778774, -4.945217, -8.239088, 0, 1.5, 0.5, 0.5
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
-4.469202, -0.5342071, -8.239088, 0, -0.5, 0.5, 0.5,
-4.469202, -0.5342071, -8.239088, 1, -0.5, 0.5, 0.5,
-4.469202, -0.5342071, -8.239088, 1, 1.5, 0.5, 0.5,
-4.469202, -0.5342071, -8.239088, 0, 1.5, 0.5, 0.5
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
-4.469202, -4.945217, -0.4596798, 0, -0.5, 0.5, 0.5,
-4.469202, -4.945217, -0.4596798, 1, -0.5, 0.5, 0.5,
-4.469202, -4.945217, -0.4596798, 1, 1.5, 0.5, 0.5,
-4.469202, -4.945217, -0.4596798, 0, 1.5, 0.5, 0.5
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
-3, -3.927291, -6.44384,
3, -3.927291, -6.44384,
-3, -3.927291, -6.44384,
-3, -4.096945, -6.743048,
-2, -3.927291, -6.44384,
-2, -4.096945, -6.743048,
-1, -3.927291, -6.44384,
-1, -4.096945, -6.743048,
0, -3.927291, -6.44384,
0, -4.096945, -6.743048,
1, -3.927291, -6.44384,
1, -4.096945, -6.743048,
2, -3.927291, -6.44384,
2, -4.096945, -6.743048,
3, -3.927291, -6.44384,
3, -4.096945, -6.743048
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
-3, -4.436254, -7.341464, 0, -0.5, 0.5, 0.5,
-3, -4.436254, -7.341464, 1, -0.5, 0.5, 0.5,
-3, -4.436254, -7.341464, 1, 1.5, 0.5, 0.5,
-3, -4.436254, -7.341464, 0, 1.5, 0.5, 0.5,
-2, -4.436254, -7.341464, 0, -0.5, 0.5, 0.5,
-2, -4.436254, -7.341464, 1, -0.5, 0.5, 0.5,
-2, -4.436254, -7.341464, 1, 1.5, 0.5, 0.5,
-2, -4.436254, -7.341464, 0, 1.5, 0.5, 0.5,
-1, -4.436254, -7.341464, 0, -0.5, 0.5, 0.5,
-1, -4.436254, -7.341464, 1, -0.5, 0.5, 0.5,
-1, -4.436254, -7.341464, 1, 1.5, 0.5, 0.5,
-1, -4.436254, -7.341464, 0, 1.5, 0.5, 0.5,
0, -4.436254, -7.341464, 0, -0.5, 0.5, 0.5,
0, -4.436254, -7.341464, 1, -0.5, 0.5, 0.5,
0, -4.436254, -7.341464, 1, 1.5, 0.5, 0.5,
0, -4.436254, -7.341464, 0, 1.5, 0.5, 0.5,
1, -4.436254, -7.341464, 0, -0.5, 0.5, 0.5,
1, -4.436254, -7.341464, 1, -0.5, 0.5, 0.5,
1, -4.436254, -7.341464, 1, 1.5, 0.5, 0.5,
1, -4.436254, -7.341464, 0, 1.5, 0.5, 0.5,
2, -4.436254, -7.341464, 0, -0.5, 0.5, 0.5,
2, -4.436254, -7.341464, 1, -0.5, 0.5, 0.5,
2, -4.436254, -7.341464, 1, 1.5, 0.5, 0.5,
2, -4.436254, -7.341464, 0, 1.5, 0.5, 0.5,
3, -4.436254, -7.341464, 0, -0.5, 0.5, 0.5,
3, -4.436254, -7.341464, 1, -0.5, 0.5, 0.5,
3, -4.436254, -7.341464, 1, 1.5, 0.5, 0.5,
3, -4.436254, -7.341464, 0, 1.5, 0.5, 0.5
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
-3.415281, -3, -6.44384,
-3.415281, 2, -6.44384,
-3.415281, -3, -6.44384,
-3.590935, -3, -6.743048,
-3.415281, -2, -6.44384,
-3.590935, -2, -6.743048,
-3.415281, -1, -6.44384,
-3.590935, -1, -6.743048,
-3.415281, 0, -6.44384,
-3.590935, 0, -6.743048,
-3.415281, 1, -6.44384,
-3.590935, 1, -6.743048,
-3.415281, 2, -6.44384,
-3.590935, 2, -6.743048
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
-3.942242, -3, -7.341464, 0, -0.5, 0.5, 0.5,
-3.942242, -3, -7.341464, 1, -0.5, 0.5, 0.5,
-3.942242, -3, -7.341464, 1, 1.5, 0.5, 0.5,
-3.942242, -3, -7.341464, 0, 1.5, 0.5, 0.5,
-3.942242, -2, -7.341464, 0, -0.5, 0.5, 0.5,
-3.942242, -2, -7.341464, 1, -0.5, 0.5, 0.5,
-3.942242, -2, -7.341464, 1, 1.5, 0.5, 0.5,
-3.942242, -2, -7.341464, 0, 1.5, 0.5, 0.5,
-3.942242, -1, -7.341464, 0, -0.5, 0.5, 0.5,
-3.942242, -1, -7.341464, 1, -0.5, 0.5, 0.5,
-3.942242, -1, -7.341464, 1, 1.5, 0.5, 0.5,
-3.942242, -1, -7.341464, 0, 1.5, 0.5, 0.5,
-3.942242, 0, -7.341464, 0, -0.5, 0.5, 0.5,
-3.942242, 0, -7.341464, 1, -0.5, 0.5, 0.5,
-3.942242, 0, -7.341464, 1, 1.5, 0.5, 0.5,
-3.942242, 0, -7.341464, 0, 1.5, 0.5, 0.5,
-3.942242, 1, -7.341464, 0, -0.5, 0.5, 0.5,
-3.942242, 1, -7.341464, 1, -0.5, 0.5, 0.5,
-3.942242, 1, -7.341464, 1, 1.5, 0.5, 0.5,
-3.942242, 1, -7.341464, 0, 1.5, 0.5, 0.5,
-3.942242, 2, -7.341464, 0, -0.5, 0.5, 0.5,
-3.942242, 2, -7.341464, 1, -0.5, 0.5, 0.5,
-3.942242, 2, -7.341464, 1, 1.5, 0.5, 0.5,
-3.942242, 2, -7.341464, 0, 1.5, 0.5, 0.5
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
-3.415281, -3.927291, -6,
-3.415281, -3.927291, 4,
-3.415281, -3.927291, -6,
-3.590935, -4.096945, -6,
-3.415281, -3.927291, -4,
-3.590935, -4.096945, -4,
-3.415281, -3.927291, -2,
-3.590935, -4.096945, -2,
-3.415281, -3.927291, 0,
-3.590935, -4.096945, 0,
-3.415281, -3.927291, 2,
-3.590935, -4.096945, 2,
-3.415281, -3.927291, 4,
-3.590935, -4.096945, 4
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
-3.942242, -4.436254, -6, 0, -0.5, 0.5, 0.5,
-3.942242, -4.436254, -6, 1, -0.5, 0.5, 0.5,
-3.942242, -4.436254, -6, 1, 1.5, 0.5, 0.5,
-3.942242, -4.436254, -6, 0, 1.5, 0.5, 0.5,
-3.942242, -4.436254, -4, 0, -0.5, 0.5, 0.5,
-3.942242, -4.436254, -4, 1, -0.5, 0.5, 0.5,
-3.942242, -4.436254, -4, 1, 1.5, 0.5, 0.5,
-3.942242, -4.436254, -4, 0, 1.5, 0.5, 0.5,
-3.942242, -4.436254, -2, 0, -0.5, 0.5, 0.5,
-3.942242, -4.436254, -2, 1, -0.5, 0.5, 0.5,
-3.942242, -4.436254, -2, 1, 1.5, 0.5, 0.5,
-3.942242, -4.436254, -2, 0, 1.5, 0.5, 0.5,
-3.942242, -4.436254, 0, 0, -0.5, 0.5, 0.5,
-3.942242, -4.436254, 0, 1, -0.5, 0.5, 0.5,
-3.942242, -4.436254, 0, 1, 1.5, 0.5, 0.5,
-3.942242, -4.436254, 0, 0, 1.5, 0.5, 0.5,
-3.942242, -4.436254, 2, 0, -0.5, 0.5, 0.5,
-3.942242, -4.436254, 2, 1, -0.5, 0.5, 0.5,
-3.942242, -4.436254, 2, 1, 1.5, 0.5, 0.5,
-3.942242, -4.436254, 2, 0, 1.5, 0.5, 0.5,
-3.942242, -4.436254, 4, 0, -0.5, 0.5, 0.5,
-3.942242, -4.436254, 4, 1, -0.5, 0.5, 0.5,
-3.942242, -4.436254, 4, 1, 1.5, 0.5, 0.5,
-3.942242, -4.436254, 4, 0, 1.5, 0.5, 0.5
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
-3.415281, -3.927291, -6.44384,
-3.415281, 2.858877, -6.44384,
-3.415281, -3.927291, 5.52448,
-3.415281, 2.858877, 5.52448,
-3.415281, -3.927291, -6.44384,
-3.415281, -3.927291, 5.52448,
-3.415281, 2.858877, -6.44384,
-3.415281, 2.858877, 5.52448,
-3.415281, -3.927291, -6.44384,
3.610857, -3.927291, -6.44384,
-3.415281, -3.927291, 5.52448,
3.610857, -3.927291, 5.52448,
-3.415281, 2.858877, -6.44384,
3.610857, 2.858877, -6.44384,
-3.415281, 2.858877, 5.52448,
3.610857, 2.858877, 5.52448,
3.610857, -3.927291, -6.44384,
3.610857, 2.858877, -6.44384,
3.610857, -3.927291, 5.52448,
3.610857, 2.858877, 5.52448,
3.610857, -3.927291, -6.44384,
3.610857, -3.927291, 5.52448,
3.610857, 2.858877, -6.44384,
3.610857, 2.858877, 5.52448
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
var radius = 8.249255;
var distance = 36.70187;
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
mvMatrix.translate( -0.09778774, 0.5342071, 0.4596798 );
mvMatrix.scale( 1.269439, 1.314329, 0.7452387 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.70187);
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
emamectin<-read.table("emamectin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-emamectin$V2
```

```
## Error in eval(expr, envir, enclos): object 'emamectin' not found
```

```r
y<-emamectin$V3
```

```
## Error in eval(expr, envir, enclos): object 'emamectin' not found
```

```r
z<-emamectin$V4
```

```
## Error in eval(expr, envir, enclos): object 'emamectin' not found
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
-3.312959, -0.961492, -2.40222, 0, 0, 1, 1, 1,
-2.647347, -0.1164768, -2.549871, 1, 0, 0, 1, 1,
-2.638933, -0.7329603, -3.547363, 1, 0, 0, 1, 1,
-2.625013, -0.7509903, -2.249721, 1, 0, 0, 1, 1,
-2.546689, -1.246488, -0.6741703, 1, 0, 0, 1, 1,
-2.394752, 1.244095, -0.7874982, 1, 0, 0, 1, 1,
-2.366473, -1.209427, -1.813933, 0, 0, 0, 1, 1,
-2.341602, 1.077873, -0.07052702, 0, 0, 0, 1, 1,
-2.325127, 0.6952783, -2.601188, 0, 0, 0, 1, 1,
-2.299516, -0.4954684, -1.492206, 0, 0, 0, 1, 1,
-2.28497, 0.4364972, -2.245119, 0, 0, 0, 1, 1,
-2.242981, -1.095583, -1.699212, 0, 0, 0, 1, 1,
-2.229969, -1.337338, 1.229088, 0, 0, 0, 1, 1,
-2.207649, -0.3380145, 0.1555019, 1, 1, 1, 1, 1,
-2.200984, 1.092018, -0.636957, 1, 1, 1, 1, 1,
-2.19114, -0.1044073, -2.369894, 1, 1, 1, 1, 1,
-2.183286, 1.067784, -0.1507603, 1, 1, 1, 1, 1,
-2.182243, -1.506898, -1.533813, 1, 1, 1, 1, 1,
-2.171923, -1.324697, -2.823632, 1, 1, 1, 1, 1,
-2.159003, -1.275883, -3.379616, 1, 1, 1, 1, 1,
-2.133682, -0.2397152, -1.36635, 1, 1, 1, 1, 1,
-2.118911, 0.1301908, -1.915706, 1, 1, 1, 1, 1,
-2.100598, 0.7720754, -2.025738, 1, 1, 1, 1, 1,
-2.046857, -0.09457286, -1.621379, 1, 1, 1, 1, 1,
-2.033685, -0.007763163, -0.8964734, 1, 1, 1, 1, 1,
-2.001094, -0.9563069, -2.101203, 1, 1, 1, 1, 1,
-1.990283, -1.059733, -0.0907886, 1, 1, 1, 1, 1,
-1.950015, -0.128179, -1.754953, 1, 1, 1, 1, 1,
-1.906657, -1.532683, -4.113983, 0, 0, 1, 1, 1,
-1.880558, 1.205999, -1.555663, 1, 0, 0, 1, 1,
-1.873883, 0.4696753, -1.894222, 1, 0, 0, 1, 1,
-1.870379, 1.022371, -0.5206881, 1, 0, 0, 1, 1,
-1.843989, 2.418594, -1.363281, 1, 0, 0, 1, 1,
-1.836117, 1.981601, 0.9279936, 1, 0, 0, 1, 1,
-1.827506, -0.8234595, -2.597084, 0, 0, 0, 1, 1,
-1.826664, -0.9387298, -0.587333, 0, 0, 0, 1, 1,
-1.797854, -0.4457902, -2.387898, 0, 0, 0, 1, 1,
-1.771985, 0.4004818, -1.008313, 0, 0, 0, 1, 1,
-1.742814, -2.089481, -2.523921, 0, 0, 0, 1, 1,
-1.724725, 0.9101727, -0.5725228, 0, 0, 0, 1, 1,
-1.722229, -0.8636542, -4.338542, 0, 0, 0, 1, 1,
-1.72099, 1.894032, -1.736877, 1, 1, 1, 1, 1,
-1.713444, -1.662815, -3.320536, 1, 1, 1, 1, 1,
-1.694814, 0.8782868, -2.453773, 1, 1, 1, 1, 1,
-1.690582, -0.1973191, -1.158134, 1, 1, 1, 1, 1,
-1.688412, 0.6010268, -2.453035, 1, 1, 1, 1, 1,
-1.67616, -0.1817891, -1.229571, 1, 1, 1, 1, 1,
-1.669434, 0.5560334, -0.7207499, 1, 1, 1, 1, 1,
-1.653988, -1.381788, -3.172888, 1, 1, 1, 1, 1,
-1.642549, -0.1943502, -2.969358, 1, 1, 1, 1, 1,
-1.626364, -1.367091, -3.592504, 1, 1, 1, 1, 1,
-1.623976, -1.498804, -2.40796, 1, 1, 1, 1, 1,
-1.620188, 0.2579717, -2.955106, 1, 1, 1, 1, 1,
-1.613319, 0.524054, -2.733651, 1, 1, 1, 1, 1,
-1.609086, 1.391496, -0.4907769, 1, 1, 1, 1, 1,
-1.607507, 0.3759668, -2.305188, 1, 1, 1, 1, 1,
-1.588941, -0.08199285, -3.45164, 0, 0, 1, 1, 1,
-1.581652, -0.9749122, -1.078973, 1, 0, 0, 1, 1,
-1.581491, 0.9839622, -1.483064, 1, 0, 0, 1, 1,
-1.574832, 0.5932804, -1.788657, 1, 0, 0, 1, 1,
-1.5646, -0.5583512, -0.716488, 1, 0, 0, 1, 1,
-1.561688, -0.09741917, -0.5485329, 1, 0, 0, 1, 1,
-1.551819, 0.4463482, -1.377536, 0, 0, 0, 1, 1,
-1.545712, -0.5498099, -3.057642, 0, 0, 0, 1, 1,
-1.51936, -1.589714, -1.828231, 0, 0, 0, 1, 1,
-1.516884, -1.954905, -2.466812, 0, 0, 0, 1, 1,
-1.515554, 0.8703054, -1.1115, 0, 0, 0, 1, 1,
-1.510849, 0.5480691, 0.6724635, 0, 0, 0, 1, 1,
-1.507141, 0.8414524, -1.688667, 0, 0, 0, 1, 1,
-1.500511, -0.5373852, -2.242942, 1, 1, 1, 1, 1,
-1.497016, -0.4629053, -2.273693, 1, 1, 1, 1, 1,
-1.490291, 0.07367176, -2.834776, 1, 1, 1, 1, 1,
-1.487541, -0.3865567, -1.964442, 1, 1, 1, 1, 1,
-1.48139, -0.7766976, -1.051894, 1, 1, 1, 1, 1,
-1.475195, -1.508038, -2.031536, 1, 1, 1, 1, 1,
-1.461913, 0.657277, -1.695415, 1, 1, 1, 1, 1,
-1.459631, -0.7620313, -4.852449, 1, 1, 1, 1, 1,
-1.457324, -0.05521027, -1.41535, 1, 1, 1, 1, 1,
-1.455943, -0.6890196, -2.355608, 1, 1, 1, 1, 1,
-1.450664, 1.011112, -0.8097563, 1, 1, 1, 1, 1,
-1.426426, 0.6661186, -0.8720341, 1, 1, 1, 1, 1,
-1.421637, 0.7254422, -0.6967403, 1, 1, 1, 1, 1,
-1.421032, -1.317683, -2.373152, 1, 1, 1, 1, 1,
-1.419478, 0.4424962, -0.9161385, 1, 1, 1, 1, 1,
-1.41795, -0.8924515, -1.11116, 0, 0, 1, 1, 1,
-1.411179, 0.1068759, -1.444077, 1, 0, 0, 1, 1,
-1.404996, -0.9568613, -0.8585801, 1, 0, 0, 1, 1,
-1.404169, -1.800505, -2.523782, 1, 0, 0, 1, 1,
-1.393927, 0.545624, -1.129732, 1, 0, 0, 1, 1,
-1.387342, -1.893568, -2.917296, 1, 0, 0, 1, 1,
-1.369309, -3.4232, -1.936422, 0, 0, 0, 1, 1,
-1.368733, -0.1846037, -2.869053, 0, 0, 0, 1, 1,
-1.365221, -0.1178809, -0.2659881, 0, 0, 0, 1, 1,
-1.359868, -1.207101, -1.421343, 0, 0, 0, 1, 1,
-1.356163, -1.50845, -5.004509, 0, 0, 0, 1, 1,
-1.352281, -1.644237, -2.05856, 0, 0, 0, 1, 1,
-1.34298, 0.9702938, -0.4225087, 0, 0, 0, 1, 1,
-1.337367, 0.3841332, -1.126762, 1, 1, 1, 1, 1,
-1.335082, -1.582569, -3.919863, 1, 1, 1, 1, 1,
-1.330569, -0.2277672, -2.46634, 1, 1, 1, 1, 1,
-1.309398, -2.549982, -1.690149, 1, 1, 1, 1, 1,
-1.304617, -0.05195883, -0.341986, 1, 1, 1, 1, 1,
-1.294331, 1.165268, -1.29803, 1, 1, 1, 1, 1,
-1.279651, -1.478934, -2.217895, 1, 1, 1, 1, 1,
-1.267989, 0.6385642, -1.546, 1, 1, 1, 1, 1,
-1.256107, 1.396097, -0.7257848, 1, 1, 1, 1, 1,
-1.243034, -1.703273, -2.302845, 1, 1, 1, 1, 1,
-1.227849, 0.07145704, -1.548565, 1, 1, 1, 1, 1,
-1.226805, 1.998035, -0.9456556, 1, 1, 1, 1, 1,
-1.220043, -0.1836816, -1.728244, 1, 1, 1, 1, 1,
-1.215448, -1.136065, -0.3626592, 1, 1, 1, 1, 1,
-1.212701, -0.3984531, -2.918085, 1, 1, 1, 1, 1,
-1.210054, 0.3857009, -1.445216, 0, 0, 1, 1, 1,
-1.200119, -0.2458808, -0.2262103, 1, 0, 0, 1, 1,
-1.199306, -0.9411946, -1.670175, 1, 0, 0, 1, 1,
-1.196693, -0.9137192, -0.06634876, 1, 0, 0, 1, 1,
-1.192024, 1.119581, -1.242951, 1, 0, 0, 1, 1,
-1.189173, 2.015644, 0.3333523, 1, 0, 0, 1, 1,
-1.185396, 0.6444268, -1.597702, 0, 0, 0, 1, 1,
-1.175384, -0.05010127, -3.278091, 0, 0, 0, 1, 1,
-1.171908, -1.289261, -2.975725, 0, 0, 0, 1, 1,
-1.169338, -1.691148, -3.801367, 0, 0, 0, 1, 1,
-1.166366, 0.002429935, 0.005803951, 0, 0, 0, 1, 1,
-1.163422, 0.01688307, -1.224567, 0, 0, 0, 1, 1,
-1.158915, -0.1802156, -1.9954, 0, 0, 0, 1, 1,
-1.151144, -0.1555156, -1.69699, 1, 1, 1, 1, 1,
-1.1482, -1.504449, -4.331646, 1, 1, 1, 1, 1,
-1.144019, -0.5623009, -2.655013, 1, 1, 1, 1, 1,
-1.143134, 2.518928, -0.1100078, 1, 1, 1, 1, 1,
-1.137541, 0.3783206, -1.198143, 1, 1, 1, 1, 1,
-1.133329, 0.1769722, -3.018058, 1, 1, 1, 1, 1,
-1.124312, 0.3353006, -2.105565, 1, 1, 1, 1, 1,
-1.121187, 0.2943697, -1.781941, 1, 1, 1, 1, 1,
-1.118929, 0.3147085, -0.5919208, 1, 1, 1, 1, 1,
-1.108748, 2.760049, 0.5157441, 1, 1, 1, 1, 1,
-1.104862, -0.5072249, -1.183587, 1, 1, 1, 1, 1,
-1.095249, 1.557613, 0.1460851, 1, 1, 1, 1, 1,
-1.095107, 0.5287202, -1.694958, 1, 1, 1, 1, 1,
-1.089521, -0.4075687, -2.329023, 1, 1, 1, 1, 1,
-1.085104, -0.1818504, -1.807637, 1, 1, 1, 1, 1,
-1.083518, -0.1154561, -1.391772, 0, 0, 1, 1, 1,
-1.080993, -2.737898, -3.962243, 1, 0, 0, 1, 1,
-1.080215, 1.171794, -0.5089304, 1, 0, 0, 1, 1,
-1.07317, 0.03932045, -2.449676, 1, 0, 0, 1, 1,
-1.070728, -0.1204403, 0.3048435, 1, 0, 0, 1, 1,
-1.067947, 0.7391419, -1.388022, 1, 0, 0, 1, 1,
-1.066203, 1.036449, -0.5892992, 0, 0, 0, 1, 1,
-1.059817, -0.923461, -1.011812, 0, 0, 0, 1, 1,
-1.058656, 0.1344585, 0.1170202, 0, 0, 0, 1, 1,
-1.055648, 1.676579, 0.8405256, 0, 0, 0, 1, 1,
-1.055535, 1.214539, -3.012646, 0, 0, 0, 1, 1,
-1.044522, -1.884643, -2.477039, 0, 0, 0, 1, 1,
-1.043052, -1.217243, -3.564803, 0, 0, 0, 1, 1,
-1.04301, 0.8522505, -1.956572, 1, 1, 1, 1, 1,
-1.038742, 0.2895598, -0.6215983, 1, 1, 1, 1, 1,
-1.031714, 0.4008245, 0.2509523, 1, 1, 1, 1, 1,
-1.030991, 0.62929, 0.08931069, 1, 1, 1, 1, 1,
-1.026636, -0.09800857, -2.370555, 1, 1, 1, 1, 1,
-1.016678, 1.262847, -2.652761, 1, 1, 1, 1, 1,
-1.015657, -0.3329636, -0.8838204, 1, 1, 1, 1, 1,
-1.01277, -0.665652, -1.942015, 1, 1, 1, 1, 1,
-1.012324, 0.2439505, -1.926259, 1, 1, 1, 1, 1,
-1.007417, 1.203182, -1.873958, 1, 1, 1, 1, 1,
-1.00497, -0.4285093, -2.896853, 1, 1, 1, 1, 1,
-1.002485, -0.6336889, -1.061915, 1, 1, 1, 1, 1,
-1.002371, 1.125012, -0.7113084, 1, 1, 1, 1, 1,
-0.9954604, 0.1476734, -0.8225383, 1, 1, 1, 1, 1,
-0.9899414, -0.6275204, -1.764744, 1, 1, 1, 1, 1,
-0.9894148, 1.187253, -1.754805, 0, 0, 1, 1, 1,
-0.9869685, -1.16818, 0.1304545, 1, 0, 0, 1, 1,
-0.9798526, 0.590608, -1.742265, 1, 0, 0, 1, 1,
-0.9684831, -0.02706232, -1.473054, 1, 0, 0, 1, 1,
-0.9649729, -1.128426, -1.433631, 1, 0, 0, 1, 1,
-0.9647838, -0.2894634, -1.792157, 1, 0, 0, 1, 1,
-0.9584055, 1.425943, -1.739938, 0, 0, 0, 1, 1,
-0.9568416, 1.071727, 0.4405432, 0, 0, 0, 1, 1,
-0.9555528, 0.6657447, -1.213993, 0, 0, 0, 1, 1,
-0.9529052, 0.7616147, -1.085487, 0, 0, 0, 1, 1,
-0.9497415, 0.3855982, -1.923117, 0, 0, 0, 1, 1,
-0.9496672, -0.6928181, -2.043575, 0, 0, 0, 1, 1,
-0.9482685, 1.270974, 0.04128227, 0, 0, 0, 1, 1,
-0.9459683, 0.7498623, -1.529075, 1, 1, 1, 1, 1,
-0.9432547, -1.83829, -1.905513, 1, 1, 1, 1, 1,
-0.9364976, -0.4840412, -1.069025, 1, 1, 1, 1, 1,
-0.9316279, 0.7498631, -0.6260745, 1, 1, 1, 1, 1,
-0.9302934, -0.676523, -0.8930641, 1, 1, 1, 1, 1,
-0.9292924, 0.6435665, -0.09369186, 1, 1, 1, 1, 1,
-0.9187675, -0.08167733, -0.3900614, 1, 1, 1, 1, 1,
-0.9179206, -1.867146, -3.346592, 1, 1, 1, 1, 1,
-0.917208, -0.1693571, -2.144644, 1, 1, 1, 1, 1,
-0.915674, 1.585033, 0.3891466, 1, 1, 1, 1, 1,
-0.9143264, 0.1389545, -1.395759, 1, 1, 1, 1, 1,
-0.9120669, -0.6081585, -0.2255311, 1, 1, 1, 1, 1,
-0.9111852, 0.1828221, -0.8224663, 1, 1, 1, 1, 1,
-0.9073035, 0.9041337, -0.981252, 1, 1, 1, 1, 1,
-0.9048986, 0.5536382, -1.14776, 1, 1, 1, 1, 1,
-0.9045249, -0.8533405, -3.266554, 0, 0, 1, 1, 1,
-0.9023297, 0.05282899, -3.168717, 1, 0, 0, 1, 1,
-0.8992607, -0.7750459, -2.600487, 1, 0, 0, 1, 1,
-0.895678, -0.2213057, -0.9130717, 1, 0, 0, 1, 1,
-0.8925934, 1.564483, 0.06808853, 1, 0, 0, 1, 1,
-0.8872447, -0.2749037, -0.8718897, 1, 0, 0, 1, 1,
-0.8670005, -1.53601, -1.865299, 0, 0, 0, 1, 1,
-0.8643828, -0.1362247, -1.120471, 0, 0, 0, 1, 1,
-0.8642517, 0.0591257, -1.911268, 0, 0, 0, 1, 1,
-0.8638994, -0.9063097, -1.435912, 0, 0, 0, 1, 1,
-0.8630245, -0.07880432, -2.364916, 0, 0, 0, 1, 1,
-0.8576196, -0.0397131, -0.8959035, 0, 0, 0, 1, 1,
-0.8508478, -0.3844498, -2.141202, 0, 0, 0, 1, 1,
-0.8505371, 0.5510373, 0.12355, 1, 1, 1, 1, 1,
-0.8491011, -0.2477159, -1.363667, 1, 1, 1, 1, 1,
-0.8460119, 0.502452, -1.758232, 1, 1, 1, 1, 1,
-0.8377694, 0.2173803, 0.3993722, 1, 1, 1, 1, 1,
-0.8375609, -0.2247467, -2.679549, 1, 1, 1, 1, 1,
-0.826037, 0.1358934, -2.202705, 1, 1, 1, 1, 1,
-0.8223638, -1.004816, -3.621596, 1, 1, 1, 1, 1,
-0.8213475, -1.385868, -1.919242, 1, 1, 1, 1, 1,
-0.8175592, 1.326959, -0.075326, 1, 1, 1, 1, 1,
-0.808184, -0.9642442, -2.042312, 1, 1, 1, 1, 1,
-0.8068879, 0.9486775, 0.06421302, 1, 1, 1, 1, 1,
-0.8047035, 0.8303897, 0.109729, 1, 1, 1, 1, 1,
-0.8041697, -0.3932158, -1.525067, 1, 1, 1, 1, 1,
-0.8001124, -0.3793839, -1.903808, 1, 1, 1, 1, 1,
-0.7963406, 0.1509518, -1.356978, 1, 1, 1, 1, 1,
-0.7928141, -0.6535598, -2.370785, 0, 0, 1, 1, 1,
-0.7852996, 0.07833571, -0.7812176, 1, 0, 0, 1, 1,
-0.777624, -0.3269215, -1.593555, 1, 0, 0, 1, 1,
-0.7765968, 0.1298131, -0.4709617, 1, 0, 0, 1, 1,
-0.7763215, -0.2492551, -1.620464, 1, 0, 0, 1, 1,
-0.7736474, 0.6652524, 0.1738351, 1, 0, 0, 1, 1,
-0.7698108, -0.8971277, -2.985766, 0, 0, 0, 1, 1,
-0.7662192, -0.1515964, -2.256538, 0, 0, 0, 1, 1,
-0.7633998, 0.1709945, -1.139989, 0, 0, 0, 1, 1,
-0.7627106, -0.5069128, -1.969374, 0, 0, 0, 1, 1,
-0.7626409, 1.18432, 0.5542979, 0, 0, 0, 1, 1,
-0.7603301, -0.6049767, -0.8873832, 0, 0, 0, 1, 1,
-0.7579467, 1.105686, -0.7100316, 0, 0, 0, 1, 1,
-0.7511088, 0.03024502, -0.9933094, 1, 1, 1, 1, 1,
-0.7442389, 1.859938, -1.640222, 1, 1, 1, 1, 1,
-0.7420076, 0.7094126, 1.608132, 1, 1, 1, 1, 1,
-0.740028, 0.3622268, -0.03350687, 1, 1, 1, 1, 1,
-0.7396492, -1.426866, -2.282006, 1, 1, 1, 1, 1,
-0.7337532, 0.01502738, -4.329313, 1, 1, 1, 1, 1,
-0.7318624, -0.9467337, -2.52243, 1, 1, 1, 1, 1,
-0.7279869, 0.8209848, 0.6596845, 1, 1, 1, 1, 1,
-0.726167, 1.789797, 0.06162423, 1, 1, 1, 1, 1,
-0.7259755, 0.5409979, -2.588955, 1, 1, 1, 1, 1,
-0.7226501, 0.7636395, -0.5724924, 1, 1, 1, 1, 1,
-0.7205351, 0.06779026, -1.362776, 1, 1, 1, 1, 1,
-0.7172397, 0.9153496, -0.2268857, 1, 1, 1, 1, 1,
-0.7083727, -0.646333, -1.5017, 1, 1, 1, 1, 1,
-0.7057311, -0.668208, -2.510435, 1, 1, 1, 1, 1,
-0.7045953, -1.241213, -2.374164, 0, 0, 1, 1, 1,
-0.7028773, -0.02271531, -1.328785, 1, 0, 0, 1, 1,
-0.7008353, 0.02908777, -1.944405, 1, 0, 0, 1, 1,
-0.6993239, -0.2735046, -2.518052, 1, 0, 0, 1, 1,
-0.6983091, -0.5478733, -2.7307, 1, 0, 0, 1, 1,
-0.6846029, 0.2365054, 0.01249171, 1, 0, 0, 1, 1,
-0.6843708, -0.4322986, -2.229895, 0, 0, 0, 1, 1,
-0.681903, 0.5352154, 0.1352401, 0, 0, 0, 1, 1,
-0.6784792, -0.7550192, -3.217042, 0, 0, 0, 1, 1,
-0.6757371, -0.2653871, -2.178881, 0, 0, 0, 1, 1,
-0.6738424, -0.4207272, -2.239279, 0, 0, 0, 1, 1,
-0.6722524, -0.262775, -3.282028, 0, 0, 0, 1, 1,
-0.6695791, 1.93826, -0.714339, 0, 0, 0, 1, 1,
-0.6686619, 0.3599735, -1.50911, 1, 1, 1, 1, 1,
-0.6667217, 0.2265491, -2.620485, 1, 1, 1, 1, 1,
-0.6661698, 0.996843, 0.4597302, 1, 1, 1, 1, 1,
-0.6611198, 0.6500332, -1.940065, 1, 1, 1, 1, 1,
-0.6375714, 0.3034789, -1.076222, 1, 1, 1, 1, 1,
-0.6326419, -0.108891, -2.087527, 1, 1, 1, 1, 1,
-0.630012, -0.5870538, -2.614089, 1, 1, 1, 1, 1,
-0.6284212, -0.3894197, -3.587884, 1, 1, 1, 1, 1,
-0.6234986, 0.1591209, -0.2225527, 1, 1, 1, 1, 1,
-0.6220585, 1.056551, 0.7323741, 1, 1, 1, 1, 1,
-0.6160856, 0.3218328, -1.547334, 1, 1, 1, 1, 1,
-0.6147291, 0.5862913, -1.232839, 1, 1, 1, 1, 1,
-0.6110892, -1.556346, -2.738033, 1, 1, 1, 1, 1,
-0.6062729, -3.158797, -2.516155, 1, 1, 1, 1, 1,
-0.6034704, 0.7483251, -1.397121, 1, 1, 1, 1, 1,
-0.6001921, 1.838707, 0.6424867, 0, 0, 1, 1, 1,
-0.5983078, 0.7675371, -0.8403483, 1, 0, 0, 1, 1,
-0.5954821, 0.9659689, -0.8830533, 1, 0, 0, 1, 1,
-0.5951051, -0.4325587, -2.749429, 1, 0, 0, 1, 1,
-0.5930473, 0.7610462, 0.3275545, 1, 0, 0, 1, 1,
-0.5870137, 0.4962526, -1.712649, 1, 0, 0, 1, 1,
-0.5866428, -1.867763, -2.705243, 0, 0, 0, 1, 1,
-0.5833791, -0.06333742, -1.329563, 0, 0, 0, 1, 1,
-0.5816554, 0.9687607, 0.2170267, 0, 0, 0, 1, 1,
-0.5812323, 0.1038589, -0.7073002, 0, 0, 0, 1, 1,
-0.5781606, -1.441175, -3.616141, 0, 0, 0, 1, 1,
-0.5763862, 0.310966, -1.371157, 0, 0, 0, 1, 1,
-0.5699182, 0.7016287, -0.1069679, 0, 0, 0, 1, 1,
-0.5668846, -0.1463974, -2.051832, 1, 1, 1, 1, 1,
-0.5520251, 0.2855669, 0.6554676, 1, 1, 1, 1, 1,
-0.5515006, -0.3682809, -3.260687, 1, 1, 1, 1, 1,
-0.5449648, -0.6023639, -1.928837, 1, 1, 1, 1, 1,
-0.540695, 0.3938465, -0.1926112, 1, 1, 1, 1, 1,
-0.5393963, 0.08402303, -2.765421, 1, 1, 1, 1, 1,
-0.5376685, -0.8670713, -2.718254, 1, 1, 1, 1, 1,
-0.5356451, -0.401128, -3.391653, 1, 1, 1, 1, 1,
-0.529791, 0.007330056, -2.023219, 1, 1, 1, 1, 1,
-0.5289571, -1.61554, -3.407143, 1, 1, 1, 1, 1,
-0.5261268, -0.149499, -0.4443187, 1, 1, 1, 1, 1,
-0.5221245, 0.8649035, -1.093227, 1, 1, 1, 1, 1,
-0.5151673, 0.5775052, -1.640122, 1, 1, 1, 1, 1,
-0.5144888, 1.651751, -0.2370725, 1, 1, 1, 1, 1,
-0.5130453, 2.166226, -0.05677265, 1, 1, 1, 1, 1,
-0.5126439, -0.3591951, -2.859591, 0, 0, 1, 1, 1,
-0.5111843, 0.9078236, -0.6439353, 1, 0, 0, 1, 1,
-0.5092788, -0.9947535, -3.381591, 1, 0, 0, 1, 1,
-0.5069202, 1.225685, 0.2790232, 1, 0, 0, 1, 1,
-0.506252, -1.638278, -2.096277, 1, 0, 0, 1, 1,
-0.5033461, -0.6650015, -3.242717, 1, 0, 0, 1, 1,
-0.4996677, 1.207383, 0.4545083, 0, 0, 0, 1, 1,
-0.4966053, -0.1802625, -2.321835, 0, 0, 0, 1, 1,
-0.4932699, -0.9466131, -2.023119, 0, 0, 0, 1, 1,
-0.4928805, 0.6890623, -0.955788, 0, 0, 0, 1, 1,
-0.4920046, -0.4391574, -0.5452838, 0, 0, 0, 1, 1,
-0.4905403, 0.08656371, -0.8836998, 0, 0, 0, 1, 1,
-0.4901353, -0.3258932, -1.568823, 0, 0, 0, 1, 1,
-0.4829764, -1.568333, -2.042299, 1, 1, 1, 1, 1,
-0.4815814, -0.847945, -2.731029, 1, 1, 1, 1, 1,
-0.4811368, -0.8939331, -0.5531765, 1, 1, 1, 1, 1,
-0.4796453, -0.2308399, -1.806634, 1, 1, 1, 1, 1,
-0.4796305, 0.1478547, -2.233213, 1, 1, 1, 1, 1,
-0.4769476, 0.4659431, -0.02445529, 1, 1, 1, 1, 1,
-0.4765606, 0.3222262, -1.715181, 1, 1, 1, 1, 1,
-0.4740498, -0.2515118, -0.996932, 1, 1, 1, 1, 1,
-0.4705352, -1.563234, -3.605793, 1, 1, 1, 1, 1,
-0.4646743, -0.4386479, -2.89252, 1, 1, 1, 1, 1,
-0.4636978, -0.8475823, -3.244055, 1, 1, 1, 1, 1,
-0.4630125, -1.626792, -2.601305, 1, 1, 1, 1, 1,
-0.4627252, -0.0750053, -0.6266524, 1, 1, 1, 1, 1,
-0.4620109, 0.2578632, -1.994677, 1, 1, 1, 1, 1,
-0.4579588, 0.5779335, -1.73315, 1, 1, 1, 1, 1,
-0.4574213, 1.099758, -0.8125141, 0, 0, 1, 1, 1,
-0.4517842, 0.03303588, 0.5514932, 1, 0, 0, 1, 1,
-0.4511619, 1.258801, 0.08350892, 1, 0, 0, 1, 1,
-0.4460525, -1.157734, -6.184252, 1, 0, 0, 1, 1,
-0.4456673, -0.5246055, -3.524764, 1, 0, 0, 1, 1,
-0.4414673, -0.2634991, -1.106812, 1, 0, 0, 1, 1,
-0.4368931, -1.014532, -2.94277, 0, 0, 0, 1, 1,
-0.4357536, 0.9835594, 0.8188771, 0, 0, 0, 1, 1,
-0.4344715, 1.521262, -0.4352021, 0, 0, 0, 1, 1,
-0.429177, -0.5581663, -3.822446, 0, 0, 0, 1, 1,
-0.4225338, 0.1528784, -1.54615, 0, 0, 0, 1, 1,
-0.4133757, -0.9924565, -1.786013, 0, 0, 0, 1, 1,
-0.3999137, -1.273377, -3.497684, 0, 0, 0, 1, 1,
-0.3988383, 0.08270385, -1.788368, 1, 1, 1, 1, 1,
-0.3902996, -0.03313866, -3.010949, 1, 1, 1, 1, 1,
-0.3882727, 0.1900264, -0.790778, 1, 1, 1, 1, 1,
-0.3863319, 2.288766, 0.9624652, 1, 1, 1, 1, 1,
-0.3830496, -0.5420821, -3.478681, 1, 1, 1, 1, 1,
-0.3824363, -0.9169515, -3.929485, 1, 1, 1, 1, 1,
-0.3793944, 0.1902616, -0.7373393, 1, 1, 1, 1, 1,
-0.37919, -0.6352288, -2.499728, 1, 1, 1, 1, 1,
-0.3783919, 0.361135, -1.273984, 1, 1, 1, 1, 1,
-0.3767397, 2.050982, -0.02651773, 1, 1, 1, 1, 1,
-0.3705685, 0.3964674, 0.4183159, 1, 1, 1, 1, 1,
-0.3669004, 0.3373475, -2.370368, 1, 1, 1, 1, 1,
-0.3628178, -0.233892, -2.011315, 1, 1, 1, 1, 1,
-0.3619191, -1.013183, -4.179641, 1, 1, 1, 1, 1,
-0.3605245, -1.59292, -2.044839, 1, 1, 1, 1, 1,
-0.3584172, -0.2228331, -1.493196, 0, 0, 1, 1, 1,
-0.3579746, 0.8704526, 1.388785, 1, 0, 0, 1, 1,
-0.3571149, 1.423751, -0.1653604, 1, 0, 0, 1, 1,
-0.3558073, 1.188038, 1.8664, 1, 0, 0, 1, 1,
-0.3538152, 0.2315617, -0.5835003, 1, 0, 0, 1, 1,
-0.3538002, -0.1182835, -3.622301, 1, 0, 0, 1, 1,
-0.3451006, 0.7249519, -1.581061, 0, 0, 0, 1, 1,
-0.3440575, 0.7881375, -1.273404, 0, 0, 0, 1, 1,
-0.3395997, -1.876035, -2.051276, 0, 0, 0, 1, 1,
-0.3388976, 0.1535624, -0.6791899, 0, 0, 0, 1, 1,
-0.3383542, -0.3082124, -2.151754, 0, 0, 0, 1, 1,
-0.3371333, 0.05268702, -1.264054, 0, 0, 0, 1, 1,
-0.3365411, 1.193768, -1.81804, 0, 0, 0, 1, 1,
-0.335297, -2.065596, -1.826146, 1, 1, 1, 1, 1,
-0.3218318, -0.6812288, -4.865143, 1, 1, 1, 1, 1,
-0.3205121, 0.849834, -0.5370572, 1, 1, 1, 1, 1,
-0.3160941, 1.235599, -2.044927, 1, 1, 1, 1, 1,
-0.3139158, -1.993178, -4.499215, 1, 1, 1, 1, 1,
-0.3084449, 1.43454, -1.511321, 1, 1, 1, 1, 1,
-0.3083167, -1.819385, -5.090843, 1, 1, 1, 1, 1,
-0.3053163, -0.8490175, -3.538934, 1, 1, 1, 1, 1,
-0.2947891, 0.08016456, -0.001531782, 1, 1, 1, 1, 1,
-0.294023, 0.5605428, -1.366691, 1, 1, 1, 1, 1,
-0.2910072, -1.029376, -3.966341, 1, 1, 1, 1, 1,
-0.2902162, 1.784042, -0.2380133, 1, 1, 1, 1, 1,
-0.2887018, -0.2862421, 0.1047046, 1, 1, 1, 1, 1,
-0.2875682, -1.050626, -2.504153, 1, 1, 1, 1, 1,
-0.2867344, -0.6046467, -0.04906581, 1, 1, 1, 1, 1,
-0.2812109, 0.2764857, -0.6216759, 0, 0, 1, 1, 1,
-0.2802246, 0.229983, -1.566019, 1, 0, 0, 1, 1,
-0.2776611, 2.097615, -1.651544, 1, 0, 0, 1, 1,
-0.275688, -0.3387097, -0.7657669, 1, 0, 0, 1, 1,
-0.2751827, 2.582171, -0.19852, 1, 0, 0, 1, 1,
-0.2743384, -0.2425635, -1.880288, 1, 0, 0, 1, 1,
-0.2740034, 0.5362185, -1.304584, 0, 0, 0, 1, 1,
-0.2700211, 0.3692493, -0.7716452, 0, 0, 0, 1, 1,
-0.2696872, 2.59983, -0.6011167, 0, 0, 0, 1, 1,
-0.2649156, 1.090194, -0.4096467, 0, 0, 0, 1, 1,
-0.2644279, -0.4484124, -3.129568, 0, 0, 0, 1, 1,
-0.2586642, -0.8186017, -2.117475, 0, 0, 0, 1, 1,
-0.2530634, 1.855134, -1.094972, 0, 0, 0, 1, 1,
-0.2477077, 1.751283, 1.126505, 1, 1, 1, 1, 1,
-0.2447055, -1.116402, -3.207234, 1, 1, 1, 1, 1,
-0.2437575, -0.3827689, -2.394156, 1, 1, 1, 1, 1,
-0.2421437, 1.132869, 0.1188951, 1, 1, 1, 1, 1,
-0.2416174, 0.8427519, 0.9165989, 1, 1, 1, 1, 1,
-0.2386944, -0.09744462, -2.923372, 1, 1, 1, 1, 1,
-0.235216, -0.5445604, -3.438307, 1, 1, 1, 1, 1,
-0.2346876, 1.837977, -0.10824, 1, 1, 1, 1, 1,
-0.2337106, -0.06282511, -1.273639, 1, 1, 1, 1, 1,
-0.2225267, 1.086868, 0.6124684, 1, 1, 1, 1, 1,
-0.2154774, -1.447868, -2.293636, 1, 1, 1, 1, 1,
-0.2121247, 1.514329, -2.023463, 1, 1, 1, 1, 1,
-0.2091601, -0.6935796, -2.940831, 1, 1, 1, 1, 1,
-0.2089579, 1.191087, -0.4684646, 1, 1, 1, 1, 1,
-0.2060034, 0.0505849, -1.917727, 1, 1, 1, 1, 1,
-0.2054745, 0.03140417, -1.598059, 0, 0, 1, 1, 1,
-0.2014515, -1.379394, -3.434056, 1, 0, 0, 1, 1,
-0.2014501, -0.3514313, -2.565612, 1, 0, 0, 1, 1,
-0.1995756, 1.589384, 0.3905851, 1, 0, 0, 1, 1,
-0.1919811, 0.5186474, -1.831695, 1, 0, 0, 1, 1,
-0.1896077, -0.08788555, -3.633851, 1, 0, 0, 1, 1,
-0.1888262, -0.4912897, -3.117858, 0, 0, 0, 1, 1,
-0.1852829, -0.02103, -2.996978, 0, 0, 0, 1, 1,
-0.1741286, 1.246989, -0.3946479, 0, 0, 0, 1, 1,
-0.1668478, -1.31185, -2.828057, 0, 0, 0, 1, 1,
-0.1624548, -0.3076327, -3.377987, 0, 0, 0, 1, 1,
-0.1602234, -0.8050884, -2.392372, 0, 0, 0, 1, 1,
-0.1565603, 0.1520742, -0.6518961, 0, 0, 0, 1, 1,
-0.1515023, -0.6974136, -1.646274, 1, 1, 1, 1, 1,
-0.1510292, 1.585797, 1.266532, 1, 1, 1, 1, 1,
-0.1509258, -0.3361363, -2.593954, 1, 1, 1, 1, 1,
-0.1498711, -0.2055033, -1.569676, 1, 1, 1, 1, 1,
-0.1445488, -1.079974, -3.743989, 1, 1, 1, 1, 1,
-0.1420112, -0.7393969, -2.576102, 1, 1, 1, 1, 1,
-0.1395651, -0.2185797, -4.346579, 1, 1, 1, 1, 1,
-0.1313296, -0.7012973, -5.120133, 1, 1, 1, 1, 1,
-0.129001, 0.8819799, -1.016625, 1, 1, 1, 1, 1,
-0.1271183, 0.7279703, 0.1965134, 1, 1, 1, 1, 1,
-0.1247908, 2.092519, -0.6616521, 1, 1, 1, 1, 1,
-0.1246145, 0.410975, -0.7571871, 1, 1, 1, 1, 1,
-0.1229334, -0.2953164, -3.310817, 1, 1, 1, 1, 1,
-0.1208848, 0.7889228, -0.298535, 1, 1, 1, 1, 1,
-0.1105972, -0.4470352, -2.881438, 1, 1, 1, 1, 1,
-0.1083956, 0.3280474, -0.9244695, 0, 0, 1, 1, 1,
-0.1043045, 0.1816465, -0.1270534, 1, 0, 0, 1, 1,
-0.09764937, -1.615528, -1.640406, 1, 0, 0, 1, 1,
-0.09750725, 0.3226665, -1.148272, 1, 0, 0, 1, 1,
-0.09698458, -0.1217861, -4.038146, 1, 0, 0, 1, 1,
-0.09660006, 0.3023327, -0.4331823, 1, 0, 0, 1, 1,
-0.09570681, 0.01952867, -1.862701, 0, 0, 0, 1, 1,
-0.09408209, -1.273943, -3.474272, 0, 0, 0, 1, 1,
-0.09276985, -0.8969348, -4.647119, 0, 0, 0, 1, 1,
-0.08623389, -0.3079466, -1.987131, 0, 0, 0, 1, 1,
-0.0859935, 2.2145, 0.3257064, 0, 0, 0, 1, 1,
-0.08466844, 0.9938917, -0.294255, 0, 0, 0, 1, 1,
-0.0802119, -0.2654909, -3.434298, 0, 0, 0, 1, 1,
-0.07369521, 0.1924891, -1.392577, 1, 1, 1, 1, 1,
-0.07243025, -0.4541783, -5.238292, 1, 1, 1, 1, 1,
-0.07164522, 0.8284557, 1.110727, 1, 1, 1, 1, 1,
-0.06741324, -1.181896, -2.4041, 1, 1, 1, 1, 1,
-0.05474677, -0.4281674, -2.780193, 1, 1, 1, 1, 1,
-0.05253664, -0.7858627, -3.613329, 1, 1, 1, 1, 1,
-0.04742635, 0.1790477, -0.1766183, 1, 1, 1, 1, 1,
-0.04155732, 1.08414, 1.291787, 1, 1, 1, 1, 1,
-0.03598378, 0.8626853, 0.9284703, 1, 1, 1, 1, 1,
-0.02981107, 0.7831507, 0.9643851, 1, 1, 1, 1, 1,
-0.02862312, 0.5999566, 1.579097, 1, 1, 1, 1, 1,
-0.0285375, -1.238662, -4.477635, 1, 1, 1, 1, 1,
-0.028525, -0.2199777, -3.078218, 1, 1, 1, 1, 1,
-0.02810147, -0.4010444, -3.179394, 1, 1, 1, 1, 1,
-0.02796108, 0.2145112, -1.070135, 1, 1, 1, 1, 1,
-0.02778729, -1.237274, -2.551202, 0, 0, 1, 1, 1,
-0.02317296, -1.20531, -3.297208, 1, 0, 0, 1, 1,
-0.01740601, -1.07074, -5.00758, 1, 0, 0, 1, 1,
-0.01631434, 0.5563923, 1.077978, 1, 0, 0, 1, 1,
-0.01554512, 1.690856, -0.6848563, 1, 0, 0, 1, 1,
-0.006377418, 1.301539, -0.5771726, 1, 0, 0, 1, 1,
-0.005626614, -0.6671049, -3.749439, 0, 0, 0, 1, 1,
-0.004814387, -1.417312, -0.9788616, 0, 0, 0, 1, 1,
-0.003984818, 0.8578781, 0.7286442, 0, 0, 0, 1, 1,
-0.003133671, -0.3039268, -6.269544, 0, 0, 0, 1, 1,
-0.0007018578, 0.6937091, -1.164672, 0, 0, 0, 1, 1,
4.751215e-05, 0.4566534, -1.159637, 0, 0, 0, 1, 1,
0.001734808, -1.05615, 2.575353, 0, 0, 0, 1, 1,
0.005446525, 1.3258, 0.173375, 1, 1, 1, 1, 1,
0.01077696, -0.8207496, 2.76476, 1, 1, 1, 1, 1,
0.01194371, 0.01830986, 1.96161, 1, 1, 1, 1, 1,
0.01281112, 1.201925, -1.177959, 1, 1, 1, 1, 1,
0.01337871, -0.01076428, 3.845056, 1, 1, 1, 1, 1,
0.01505117, -0.1030114, 2.497935, 1, 1, 1, 1, 1,
0.01620211, -0.3910052, 2.598446, 1, 1, 1, 1, 1,
0.02008499, 0.5571244, 2.477388, 1, 1, 1, 1, 1,
0.0244271, -1.159557, 2.513569, 1, 1, 1, 1, 1,
0.03351613, -0.2757664, 4.199094, 1, 1, 1, 1, 1,
0.03429502, 0.6218774, 1.204296, 1, 1, 1, 1, 1,
0.03435383, -0.7050968, 4.206492, 1, 1, 1, 1, 1,
0.03509439, 1.085692, -1.017882, 1, 1, 1, 1, 1,
0.04150533, -1.952487, 5.350184, 1, 1, 1, 1, 1,
0.04417874, 1.372277, 0.8841983, 1, 1, 1, 1, 1,
0.04606896, 0.1153199, 1.527929, 0, 0, 1, 1, 1,
0.04842347, -0.06233164, 2.502789, 1, 0, 0, 1, 1,
0.04870005, -1.503488, 4.337175, 1, 0, 0, 1, 1,
0.05148307, 0.3656735, 0.2328031, 1, 0, 0, 1, 1,
0.05488539, 0.5602853, -0.2407918, 1, 0, 0, 1, 1,
0.05499999, -0.955768, 1.870173, 1, 0, 0, 1, 1,
0.05557878, -1.387931, 1.07256, 0, 0, 0, 1, 1,
0.06194265, 0.5002971, 2.121561, 0, 0, 0, 1, 1,
0.06520819, 0.3293881, -0.8198121, 0, 0, 0, 1, 1,
0.07393976, -1.035029, 2.750937, 0, 0, 0, 1, 1,
0.07444719, -0.0926903, 0.5616688, 0, 0, 0, 1, 1,
0.07643237, -1.889201, 3.194073, 0, 0, 0, 1, 1,
0.07650701, -1.667133, 4.918489, 0, 0, 0, 1, 1,
0.08035135, 0.2614359, 1.264806, 1, 1, 1, 1, 1,
0.08193382, -1.073103, 3.076946, 1, 1, 1, 1, 1,
0.08242185, 1.639993, 0.1655469, 1, 1, 1, 1, 1,
0.08431864, -0.2844764, 2.668517, 1, 1, 1, 1, 1,
0.08686335, -1.211373, 4.497719, 1, 1, 1, 1, 1,
0.09501523, -0.6975874, 1.248955, 1, 1, 1, 1, 1,
0.09613004, 0.1989335, 0.1883665, 1, 1, 1, 1, 1,
0.09724331, 1.178228, 1.918311, 1, 1, 1, 1, 1,
0.1016517, -1.250602, 2.097007, 1, 1, 1, 1, 1,
0.1023375, 1.382183, -0.2631571, 1, 1, 1, 1, 1,
0.1030646, -1.49402, 2.64589, 1, 1, 1, 1, 1,
0.1037754, -1.893723, 3.939395, 1, 1, 1, 1, 1,
0.1044692, 1.820118, -0.6912727, 1, 1, 1, 1, 1,
0.1073313, 0.3092252, 0.576852, 1, 1, 1, 1, 1,
0.1105779, 0.2268897, -0.4616624, 1, 1, 1, 1, 1,
0.1125098, 0.9757544, 0.0853405, 0, 0, 1, 1, 1,
0.1131875, -0.6183956, 4.339663, 1, 0, 0, 1, 1,
0.113492, 1.565545, 0.1233158, 1, 0, 0, 1, 1,
0.1171237, -0.3897214, 1.247899, 1, 0, 0, 1, 1,
0.1174134, 0.6419069, -0.9776827, 1, 0, 0, 1, 1,
0.1294725, 2.399976, -0.4883706, 1, 0, 0, 1, 1,
0.1300768, -0.9307302, 2.325727, 0, 0, 0, 1, 1,
0.1343877, 0.6767278, 0.1331284, 0, 0, 0, 1, 1,
0.1369247, 0.06675716, 0.04191958, 0, 0, 0, 1, 1,
0.1385265, -0.06430858, 1.193537, 0, 0, 0, 1, 1,
0.1396937, 0.7213402, 0.5591555, 0, 0, 0, 1, 1,
0.1423324, 0.7118014, 1.220711, 0, 0, 0, 1, 1,
0.1439265, -0.5647823, 4.194536, 0, 0, 0, 1, 1,
0.14782, -0.0955376, 0.7627537, 1, 1, 1, 1, 1,
0.1493696, 0.1739881, -0.2756545, 1, 1, 1, 1, 1,
0.1497051, 0.06371276, 2.596605, 1, 1, 1, 1, 1,
0.1502566, 0.3137541, 0.5737803, 1, 1, 1, 1, 1,
0.1598347, -0.4060996, 2.220891, 1, 1, 1, 1, 1,
0.1640935, -0.2664867, 1.54111, 1, 1, 1, 1, 1,
0.1693619, 0.3016478, 0.251873, 1, 1, 1, 1, 1,
0.1742302, 0.9435483, 0.449333, 1, 1, 1, 1, 1,
0.17471, 1.552927, 0.1366873, 1, 1, 1, 1, 1,
0.1749852, -0.5295647, 2.893697, 1, 1, 1, 1, 1,
0.1768646, -0.6967295, 4.089693, 1, 1, 1, 1, 1,
0.1770916, 0.9996722, 0.4580632, 1, 1, 1, 1, 1,
0.1816789, -0.05798922, 3.693984, 1, 1, 1, 1, 1,
0.1842112, 1.833522, 0.7413301, 1, 1, 1, 1, 1,
0.1845254, 1.41026, 0.2687584, 1, 1, 1, 1, 1,
0.1855132, 1.372162, -1.393532, 0, 0, 1, 1, 1,
0.1879241, 1.143276, 0.6693579, 1, 0, 0, 1, 1,
0.1885966, 0.5544335, -0.4271125, 1, 0, 0, 1, 1,
0.1909286, -0.8665745, 2.814778, 1, 0, 0, 1, 1,
0.1909475, 1.767621, -0.9280801, 1, 0, 0, 1, 1,
0.1957448, -0.7186184, 2.767951, 1, 0, 0, 1, 1,
0.2016332, -1.113488, 4.307237, 0, 0, 0, 1, 1,
0.2041082, 0.2618103, 2.839581, 0, 0, 0, 1, 1,
0.2067831, -0.8924211, 0.5777757, 0, 0, 0, 1, 1,
0.2079999, -0.5837079, 2.324012, 0, 0, 0, 1, 1,
0.2125947, -0.2994961, 2.197129, 0, 0, 0, 1, 1,
0.21376, -1.174129, 3.679784, 0, 0, 0, 1, 1,
0.2139957, 1.158206, -0.03547681, 0, 0, 0, 1, 1,
0.2154348, -0.1525264, 2.617388, 1, 1, 1, 1, 1,
0.2176127, -0.2502571, 1.106474, 1, 1, 1, 1, 1,
0.221447, 0.446262, 1.013085, 1, 1, 1, 1, 1,
0.222438, 0.8891246, -1.300107, 1, 1, 1, 1, 1,
0.2293204, -0.2426098, 1.113122, 1, 1, 1, 1, 1,
0.2294645, -0.07288153, 0.9984677, 1, 1, 1, 1, 1,
0.2296533, 1.162976, -1.385082, 1, 1, 1, 1, 1,
0.2306523, 2.756425, -0.7618292, 1, 1, 1, 1, 1,
0.2312151, -0.299366, 4.670776, 1, 1, 1, 1, 1,
0.2317778, -0.0004900714, 0.2821842, 1, 1, 1, 1, 1,
0.2322052, -0.521017, 2.540233, 1, 1, 1, 1, 1,
0.2337964, -0.2238842, 1.719592, 1, 1, 1, 1, 1,
0.2379848, -1.593804, 2.190103, 1, 1, 1, 1, 1,
0.2385911, 0.8990943, 2.043637, 1, 1, 1, 1, 1,
0.2565164, 1.984748, 0.606698, 1, 1, 1, 1, 1,
0.2602723, -0.3664537, 2.05596, 0, 0, 1, 1, 1,
0.2607709, 0.4457288, 0.4682009, 1, 0, 0, 1, 1,
0.2663065, -1.091351, 3.656917, 1, 0, 0, 1, 1,
0.2671262, 0.4301435, -0.01246074, 1, 0, 0, 1, 1,
0.271693, -0.1269343, 2.553954, 1, 0, 0, 1, 1,
0.274197, -1.031974, 3.382973, 1, 0, 0, 1, 1,
0.2744166, -0.1448704, 3.983409, 0, 0, 0, 1, 1,
0.2794159, 0.6933304, -0.9967857, 0, 0, 0, 1, 1,
0.2796683, -1.413198, 3.984475, 0, 0, 0, 1, 1,
0.2865669, -1.292768, 2.642048, 0, 0, 0, 1, 1,
0.2873352, 0.9515421, 1.932184, 0, 0, 0, 1, 1,
0.289655, 0.06427764, 2.778666, 0, 0, 0, 1, 1,
0.2920559, 1.277956, 0.2603599, 0, 0, 0, 1, 1,
0.3007054, 0.2212121, 0.916879, 1, 1, 1, 1, 1,
0.3008384, 0.6951836, 0.01534068, 1, 1, 1, 1, 1,
0.3055387, 1.852962, -0.3920677, 1, 1, 1, 1, 1,
0.306678, -0.7102376, 1.750007, 1, 1, 1, 1, 1,
0.3121456, 0.3512438, 1.224776, 1, 1, 1, 1, 1,
0.3122275, -0.0515577, 0.8690876, 1, 1, 1, 1, 1,
0.3163869, 0.6160308, 0.9371868, 1, 1, 1, 1, 1,
0.3236441, -0.8222188, 1.032969, 1, 1, 1, 1, 1,
0.3258563, -0.08189666, 2.550309, 1, 1, 1, 1, 1,
0.3262312, 0.1776722, -0.8191035, 1, 1, 1, 1, 1,
0.3289557, -1.022439, 2.61387, 1, 1, 1, 1, 1,
0.3324354, -0.08690598, 2.379134, 1, 1, 1, 1, 1,
0.3388989, -0.8545043, 1.054891, 1, 1, 1, 1, 1,
0.3412095, 0.3267652, -0.2875821, 1, 1, 1, 1, 1,
0.3518717, -0.05510775, 1.985644, 1, 1, 1, 1, 1,
0.3519927, -1.079605, 1.721084, 0, 0, 1, 1, 1,
0.352858, 0.9016774, 1.509303, 1, 0, 0, 1, 1,
0.3538376, -1.369051, 3.16286, 1, 0, 0, 1, 1,
0.3542524, 0.2986406, 1.188306, 1, 0, 0, 1, 1,
0.3547416, -1.840105, 1.874413, 1, 0, 0, 1, 1,
0.3565327, 1.498336, 0.5686605, 1, 0, 0, 1, 1,
0.3600486, -1.968678, 3.17877, 0, 0, 0, 1, 1,
0.3661555, -0.002412019, 3.416613, 0, 0, 0, 1, 1,
0.3708437, -1.189514, 2.723076, 0, 0, 0, 1, 1,
0.3758754, 0.0723923, 0.761072, 0, 0, 0, 1, 1,
0.3778862, 1.332596, 0.5737061, 0, 0, 0, 1, 1,
0.3814977, -0.4052765, 2.425387, 0, 0, 0, 1, 1,
0.3871569, -0.8038848, 1.959846, 0, 0, 0, 1, 1,
0.3891812, -0.4898357, 2.370085, 1, 1, 1, 1, 1,
0.3961383, 1.954775, 1.598959, 1, 1, 1, 1, 1,
0.3971592, -1.731454, 4.328215, 1, 1, 1, 1, 1,
0.4002369, -2.440282, 1.851205, 1, 1, 1, 1, 1,
0.4006423, -1.571172, 3.586136, 1, 1, 1, 1, 1,
0.4025795, 0.856728, 0.6865617, 1, 1, 1, 1, 1,
0.4055174, 0.9414305, 1.801503, 1, 1, 1, 1, 1,
0.4056356, 1.07831, 1.396297, 1, 1, 1, 1, 1,
0.4118302, 0.4483657, 2.287596, 1, 1, 1, 1, 1,
0.4146214, 1.230694, 1.710598, 1, 1, 1, 1, 1,
0.4152336, -1.416918, 2.920417, 1, 1, 1, 1, 1,
0.4227008, 0.7220786, 0.2482473, 1, 1, 1, 1, 1,
0.4238138, -1.086409, 3.210883, 1, 1, 1, 1, 1,
0.4246846, 0.5397574, -0.6909646, 1, 1, 1, 1, 1,
0.4264814, -1.277595, 2.074054, 1, 1, 1, 1, 1,
0.4274229, -0.02339768, 2.57367, 0, 0, 1, 1, 1,
0.4322391, 1.14827, -0.3458167, 1, 0, 0, 1, 1,
0.4351248, 0.3470578, 1.600804, 1, 0, 0, 1, 1,
0.4356726, 1.576483, -1.003093, 1, 0, 0, 1, 1,
0.4375266, 0.1823214, 2.678006, 1, 0, 0, 1, 1,
0.4482699, -0.07326244, -0.01491539, 1, 0, 0, 1, 1,
0.4497382, 0.2714704, 1.188473, 0, 0, 0, 1, 1,
0.4527238, -0.9209758, 2.583666, 0, 0, 0, 1, 1,
0.4532682, -0.9581393, 2.103611, 0, 0, 0, 1, 1,
0.4534731, -0.607865, 3.390186, 0, 0, 0, 1, 1,
0.4581493, 0.0725555, 1.052519, 0, 0, 0, 1, 1,
0.4585275, -0.03713021, 1.132889, 0, 0, 0, 1, 1,
0.4590714, -0.3449896, 1.74985, 0, 0, 0, 1, 1,
0.4595485, 1.343859, 0.397732, 1, 1, 1, 1, 1,
0.4611458, 0.3438526, 0.6540011, 1, 1, 1, 1, 1,
0.4655418, -1.013487, 2.766161, 1, 1, 1, 1, 1,
0.4673173, 0.3526665, 0.6755853, 1, 1, 1, 1, 1,
0.4680774, -0.503433, 2.501261, 1, 1, 1, 1, 1,
0.4725679, -0.2465497, 2.2592, 1, 1, 1, 1, 1,
0.4756781, -0.4971848, 1.499217, 1, 1, 1, 1, 1,
0.4777412, 0.3356557, 0.4797193, 1, 1, 1, 1, 1,
0.4805034, -2.611634, 5.324947, 1, 1, 1, 1, 1,
0.4805124, 0.4869934, 0.9313303, 1, 1, 1, 1, 1,
0.4823945, 0.918215, -0.00152623, 1, 1, 1, 1, 1,
0.4836223, 0.04666069, 2.135879, 1, 1, 1, 1, 1,
0.4957345, -1.263845, 3.38379, 1, 1, 1, 1, 1,
0.506881, 0.07176615, 2.383871, 1, 1, 1, 1, 1,
0.5128908, -0.8647922, 3.676782, 1, 1, 1, 1, 1,
0.5134534, -3.163558, 1.956802, 0, 0, 1, 1, 1,
0.5142254, -0.5934389, 1.538753, 1, 0, 0, 1, 1,
0.5167787, 0.2083426, 1.664412, 1, 0, 0, 1, 1,
0.5173783, -0.8160622, 1.324585, 1, 0, 0, 1, 1,
0.5194364, -0.8176714, 2.696383, 1, 0, 0, 1, 1,
0.5213582, 1.125508, 0.7776518, 1, 0, 0, 1, 1,
0.5236805, -1.223709, 1.236868, 0, 0, 0, 1, 1,
0.5273721, 0.3790175, 2.008435, 0, 0, 0, 1, 1,
0.5288852, 0.1025205, 3.284379, 0, 0, 0, 1, 1,
0.5320175, 0.02425442, 0.5532116, 0, 0, 0, 1, 1,
0.5355641, 0.418626, 0.2940312, 0, 0, 0, 1, 1,
0.5386175, -1.046739, 2.501353, 0, 0, 0, 1, 1,
0.5536362, -0.1682966, 3.185557, 0, 0, 0, 1, 1,
0.5572997, -0.9833356, 1.941162, 1, 1, 1, 1, 1,
0.5577413, -0.7025889, 1.614666, 1, 1, 1, 1, 1,
0.5624411, -0.05844416, 1.274841, 1, 1, 1, 1, 1,
0.5636209, 0.9226608, 1.000393, 1, 1, 1, 1, 1,
0.5642651, 0.417785, 1.426905, 1, 1, 1, 1, 1,
0.5648914, 0.8607907, -0.1146529, 1, 1, 1, 1, 1,
0.5651554, -0.9261199, 1.847463, 1, 1, 1, 1, 1,
0.5660045, -0.87164, 2.885011, 1, 1, 1, 1, 1,
0.5660705, -1.875531, 2.275378, 1, 1, 1, 1, 1,
0.5666524, -1.080636, 3.616628, 1, 1, 1, 1, 1,
0.5702309, -2.018522, 3.483258, 1, 1, 1, 1, 1,
0.5721167, 0.1001623, 3.315927, 1, 1, 1, 1, 1,
0.5739433, 0.3888002, 1.623997, 1, 1, 1, 1, 1,
0.5742487, -0.3372975, 4.724711, 1, 1, 1, 1, 1,
0.574719, 0.397941, 1.08383, 1, 1, 1, 1, 1,
0.5758915, -1.34175, 2.43264, 0, 0, 1, 1, 1,
0.5765235, 1.43888, 0.8756254, 1, 0, 0, 1, 1,
0.5765454, 0.5034544, -0.4279368, 1, 0, 0, 1, 1,
0.5775127, 0.2544836, 1.6305, 1, 0, 0, 1, 1,
0.5786223, -0.07141582, 0.6003723, 1, 0, 0, 1, 1,
0.581629, -1.13508, 2.775193, 1, 0, 0, 1, 1,
0.5902889, 0.8022734, 1.095349, 0, 0, 0, 1, 1,
0.5912861, 1.686422, 0.5128108, 0, 0, 0, 1, 1,
0.5943573, 1.237899, 0.01914797, 0, 0, 0, 1, 1,
0.6006206, -1.911939, 1.864271, 0, 0, 0, 1, 1,
0.6029781, -1.42974, 3.882962, 0, 0, 0, 1, 1,
0.6037824, -0.701863, 3.087329, 0, 0, 0, 1, 1,
0.6048619, -2.061748, 2.86928, 0, 0, 0, 1, 1,
0.6077671, 0.01238001, 1.970053, 1, 1, 1, 1, 1,
0.6083008, -0.5526915, 3.0748, 1, 1, 1, 1, 1,
0.6086501, 0.5031635, 0.7376691, 1, 1, 1, 1, 1,
0.6149688, -0.49065, 1.905305, 1, 1, 1, 1, 1,
0.6196768, 1.277899, 0.3122725, 1, 1, 1, 1, 1,
0.6199207, 1.68064, 0.3012322, 1, 1, 1, 1, 1,
0.6208786, 0.1836041, 4.534034, 1, 1, 1, 1, 1,
0.6241201, -2.512398, 1.446361, 1, 1, 1, 1, 1,
0.6247165, -0.727464, 4.360794, 1, 1, 1, 1, 1,
0.6281655, -1.49145, 2.51752, 1, 1, 1, 1, 1,
0.6282001, 0.4822463, 0.556088, 1, 1, 1, 1, 1,
0.6363989, -0.7957917, 4.371855, 1, 1, 1, 1, 1,
0.6381431, -0.3681597, 4.009762, 1, 1, 1, 1, 1,
0.6382878, 0.3236655, 0.5872886, 1, 1, 1, 1, 1,
0.6471183, 0.7232932, 0.8528637, 1, 1, 1, 1, 1,
0.6472132, -1.272659, 3.998104, 0, 0, 1, 1, 1,
0.648155, -0.4974606, 3.623058, 1, 0, 0, 1, 1,
0.6493429, -3.828464, 1.778474, 1, 0, 0, 1, 1,
0.6528282, -0.9729381, 1.801662, 1, 0, 0, 1, 1,
0.6530105, 0.7777049, 0.8648322, 1, 0, 0, 1, 1,
0.6542436, 0.30437, 2.766613, 1, 0, 0, 1, 1,
0.6549729, 0.08302028, 2.655415, 0, 0, 0, 1, 1,
0.6571671, -0.93957, 2.985908, 0, 0, 0, 1, 1,
0.6688775, -1.431011, 2.97152, 0, 0, 0, 1, 1,
0.6732272, 1.012842, 0.6193871, 0, 0, 0, 1, 1,
0.6750261, 1.363337, -0.9434388, 0, 0, 0, 1, 1,
0.6768728, 1.329596, 0.5856569, 0, 0, 0, 1, 1,
0.6787983, 0.01148439, 0.0009157075, 0, 0, 0, 1, 1,
0.679295, 0.3625302, 3.360235, 1, 1, 1, 1, 1,
0.685343, -1.83912, 3.145383, 1, 1, 1, 1, 1,
0.6871656, 1.458601, 1.265443, 1, 1, 1, 1, 1,
0.6921699, -0.6754151, 0.9168078, 1, 1, 1, 1, 1,
0.692558, 1.693553, 0.02315315, 1, 1, 1, 1, 1,
0.6937625, 1.582832, -0.2894097, 1, 1, 1, 1, 1,
0.6968291, -0.7492886, 1.688671, 1, 1, 1, 1, 1,
0.6976072, 0.4220003, 1.758413, 1, 1, 1, 1, 1,
0.69838, -0.7664255, 2.773275, 1, 1, 1, 1, 1,
0.7051895, 1.571927, -0.2168311, 1, 1, 1, 1, 1,
0.7192025, -2.206491, 1.498115, 1, 1, 1, 1, 1,
0.7202975, 1.059868, 1.810489, 1, 1, 1, 1, 1,
0.72306, -0.7399511, 2.677099, 1, 1, 1, 1, 1,
0.7231835, 1.175794, 0.4622762, 1, 1, 1, 1, 1,
0.7280395, 0.6639903, -0.358925, 1, 1, 1, 1, 1,
0.730719, 0.5641223, 0.4333097, 0, 0, 1, 1, 1,
0.7309162, -1.07539, 1.496891, 1, 0, 0, 1, 1,
0.7375904, -0.9501096, 3.419388, 1, 0, 0, 1, 1,
0.7425836, -0.03969703, 0.3782886, 1, 0, 0, 1, 1,
0.7461633, 0.8885058, -0.8513524, 1, 0, 0, 1, 1,
0.7465982, -3.014213, 1.590776, 1, 0, 0, 1, 1,
0.7544873, -1.256934, 3.903617, 0, 0, 0, 1, 1,
0.7563804, 0.06939032, 1.376852, 0, 0, 0, 1, 1,
0.758814, 0.3051403, 1.797805, 0, 0, 0, 1, 1,
0.7620903, 1.175458, -0.9979231, 0, 0, 0, 1, 1,
0.7641715, -0.4390425, 3.186042, 0, 0, 0, 1, 1,
0.7685158, 0.3541118, 0.9121878, 0, 0, 0, 1, 1,
0.7699993, 0.07200082, 0.05180465, 0, 0, 0, 1, 1,
0.7727866, 1.344522, -0.05570737, 1, 1, 1, 1, 1,
0.7757657, 0.6713638, -0.2205121, 1, 1, 1, 1, 1,
0.7867785, -0.7395068, 3.046974, 1, 1, 1, 1, 1,
0.7871245, -1.449214, 5.304384, 1, 1, 1, 1, 1,
0.7907416, -0.05750031, 1.053814, 1, 1, 1, 1, 1,
0.7915154, 1.903578, 0.889641, 1, 1, 1, 1, 1,
0.7934505, 1.19824, 1.28984, 1, 1, 1, 1, 1,
0.7979238, -0.2928259, 1.444857, 1, 1, 1, 1, 1,
0.7981448, 1.082789, 1.580407, 1, 1, 1, 1, 1,
0.8027164, 0.5498141, 1.546169, 1, 1, 1, 1, 1,
0.8095131, -1.08273, 4.507248, 1, 1, 1, 1, 1,
0.8105999, 0.4437066, 0.9480363, 1, 1, 1, 1, 1,
0.819164, -0.227781, 0.8987728, 1, 1, 1, 1, 1,
0.8204809, -0.8354676, 2.422955, 1, 1, 1, 1, 1,
0.8232139, -0.4308604, 1.943909, 1, 1, 1, 1, 1,
0.8242984, -0.06892405, 2.288307, 0, 0, 1, 1, 1,
0.8335152, 0.09144709, 1.603301, 1, 0, 0, 1, 1,
0.8380797, -0.7204016, 2.196958, 1, 0, 0, 1, 1,
0.8481189, -1.372218, 2.401207, 1, 0, 0, 1, 1,
0.848183, 0.7301435, -2.468995, 1, 0, 0, 1, 1,
0.8487533, -0.3797338, 1.268304, 1, 0, 0, 1, 1,
0.8525227, 0.02215881, 2.110388, 0, 0, 0, 1, 1,
0.8535498, -0.009699528, 1.885184, 0, 0, 0, 1, 1,
0.8602637, -0.1088592, 2.208917, 0, 0, 0, 1, 1,
0.8616391, 0.03827142, 1.023594, 0, 0, 0, 1, 1,
0.8647152, 1.903512, -1.646295, 0, 0, 0, 1, 1,
0.879965, 0.09044279, 1.362533, 0, 0, 0, 1, 1,
0.8834944, -0.4802418, 1.724751, 0, 0, 0, 1, 1,
0.8901583, 0.5336936, 0.8670518, 1, 1, 1, 1, 1,
0.8939269, 0.9852649, 1.144654, 1, 1, 1, 1, 1,
0.8954967, 0.9540879, -0.6060418, 1, 1, 1, 1, 1,
0.9052538, -1.639784, 2.833464, 1, 1, 1, 1, 1,
0.9116638, 1.155892, -0.7221093, 1, 1, 1, 1, 1,
0.9141193, -0.4253003, 3.226762, 1, 1, 1, 1, 1,
0.924384, 0.1215737, 1.60795, 1, 1, 1, 1, 1,
0.927457, -0.03544641, 0.6771219, 1, 1, 1, 1, 1,
0.9304274, 0.3654537, 1.498428, 1, 1, 1, 1, 1,
0.9306163, -0.9625117, -0.01662773, 1, 1, 1, 1, 1,
0.9425539, 1.997759, -0.4246481, 1, 1, 1, 1, 1,
0.9457944, -0.6789713, 1.661626, 1, 1, 1, 1, 1,
0.946122, -0.2756644, 1.687801, 1, 1, 1, 1, 1,
0.9478236, -0.3846736, 2.458254, 1, 1, 1, 1, 1,
0.9480156, 1.068629, -0.1421589, 1, 1, 1, 1, 1,
0.9509698, -0.1167103, 1.903503, 0, 0, 1, 1, 1,
0.953035, 0.0976922, 1.813084, 1, 0, 0, 1, 1,
0.9531977, -1.251809, -0.1093835, 1, 0, 0, 1, 1,
0.9546129, 0.5444324, 0.3505677, 1, 0, 0, 1, 1,
0.9549778, 0.1414192, 2.307037, 1, 0, 0, 1, 1,
0.9565547, 2.719374, 0.9578926, 1, 0, 0, 1, 1,
0.9687019, -0.3884603, 1.529324, 0, 0, 0, 1, 1,
0.9773595, -1.230249, 3.38694, 0, 0, 0, 1, 1,
0.9822843, 0.7423429, 2.184248, 0, 0, 0, 1, 1,
0.9830924, 0.8017912, 2.509856, 0, 0, 0, 1, 1,
0.9836282, -0.1392952, 0.1122359, 0, 0, 0, 1, 1,
0.9871777, 1.045707, 0.4134405, 0, 0, 0, 1, 1,
0.9922063, 1.071823, 0.3248984, 0, 0, 0, 1, 1,
0.99253, -1.21017, 1.401983, 1, 1, 1, 1, 1,
0.993697, 0.2845228, 1.820992, 1, 1, 1, 1, 1,
0.9942274, 0.4304814, 1.740533, 1, 1, 1, 1, 1,
1.000625, 1.518699, -0.2627956, 1, 1, 1, 1, 1,
1.001502, -0.7399225, 2.493803, 1, 1, 1, 1, 1,
1.004603, -0.1710497, 2.077352, 1, 1, 1, 1, 1,
1.009037, 1.073415, 0.1157087, 1, 1, 1, 1, 1,
1.01154, -0.1680987, 1.039409, 1, 1, 1, 1, 1,
1.011823, -0.3178809, 0.9350016, 1, 1, 1, 1, 1,
1.011936, -2.611653, 2.657676, 1, 1, 1, 1, 1,
1.012129, 0.1465966, 1.629686, 1, 1, 1, 1, 1,
1.013562, 0.6961261, -0.7218375, 1, 1, 1, 1, 1,
1.014162, -0.06992383, -1.844905, 1, 1, 1, 1, 1,
1.019851, -0.2951441, 2.52026, 1, 1, 1, 1, 1,
1.025422, 1.187611, -0.8076972, 1, 1, 1, 1, 1,
1.029436, -1.76037, 2.928895, 0, 0, 1, 1, 1,
1.029972, -0.4402881, 2.217495, 1, 0, 0, 1, 1,
1.030662, 0.4382843, 1.529007, 1, 0, 0, 1, 1,
1.031061, -1.042349, 2.307253, 1, 0, 0, 1, 1,
1.031286, 0.9088401, 0.5048988, 1, 0, 0, 1, 1,
1.032907, -0.2199701, 1.258922, 1, 0, 0, 1, 1,
1.038442, -0.03893116, 2.420709, 0, 0, 0, 1, 1,
1.043609, -0.1129994, 1.357742, 0, 0, 0, 1, 1,
1.047781, -0.9883046, 3.558518, 0, 0, 0, 1, 1,
1.048175, -0.2431639, 1.116516, 0, 0, 0, 1, 1,
1.053484, 2.44979, 0.672475, 0, 0, 0, 1, 1,
1.064238, -1.111464, 2.599087, 0, 0, 0, 1, 1,
1.066682, 0.695954, 0.515431, 0, 0, 0, 1, 1,
1.07052, -0.3571341, 1.397186, 1, 1, 1, 1, 1,
1.074721, -1.055514, 2.521526, 1, 1, 1, 1, 1,
1.083616, 0.5554579, 0.357523, 1, 1, 1, 1, 1,
1.08595, -1.336783, 1.742499, 1, 1, 1, 1, 1,
1.086336, -1.524392, 2.957048, 1, 1, 1, 1, 1,
1.086857, -0.5047842, 2.415692, 1, 1, 1, 1, 1,
1.093474, -0.4612739, 1.122543, 1, 1, 1, 1, 1,
1.094347, 0.6645402, 1.174488, 1, 1, 1, 1, 1,
1.097168, 1.632763, 0.3089927, 1, 1, 1, 1, 1,
1.102522, 0.9925947, 0.6052015, 1, 1, 1, 1, 1,
1.110181, -0.2050623, 2.371803, 1, 1, 1, 1, 1,
1.110716, -0.8359309, 1.702019, 1, 1, 1, 1, 1,
1.11078, -0.8313982, 1.922739, 1, 1, 1, 1, 1,
1.115069, 0.5898171, 0.9796452, 1, 1, 1, 1, 1,
1.118689, -0.6918715, 2.446691, 1, 1, 1, 1, 1,
1.11897, -2.246567, 3.730172, 0, 0, 1, 1, 1,
1.121274, -0.6688137, 1.318211, 1, 0, 0, 1, 1,
1.123849, -0.6028814, 2.936351, 1, 0, 0, 1, 1,
1.129832, -1.284762, 3.29919, 1, 0, 0, 1, 1,
1.129926, -0.07067259, 1.830333, 1, 0, 0, 1, 1,
1.135368, 1.428196, 2.25837, 1, 0, 0, 1, 1,
1.135777, -0.1349717, 0.9568935, 0, 0, 0, 1, 1,
1.139888, -0.5958909, 2.173696, 0, 0, 0, 1, 1,
1.143215, 0.2531018, 3.117613, 0, 0, 0, 1, 1,
1.144653, -0.3468525, -0.01924775, 0, 0, 0, 1, 1,
1.146269, -1.005797, 3.776299, 0, 0, 0, 1, 1,
1.149531, 2.381912, 2.698344, 0, 0, 0, 1, 1,
1.165873, -0.3996585, 0.4586943, 0, 0, 0, 1, 1,
1.17819, 0.2796279, 0.5045953, 1, 1, 1, 1, 1,
1.180677, -1.477916, 2.647045, 1, 1, 1, 1, 1,
1.180725, 0.9306998, -0.2632041, 1, 1, 1, 1, 1,
1.181228, -0.1478186, 0.09359661, 1, 1, 1, 1, 1,
1.186782, -0.8296741, 1.959116, 1, 1, 1, 1, 1,
1.186857, 0.3507485, 2.206395, 1, 1, 1, 1, 1,
1.195118, -0.007041423, 1.503679, 1, 1, 1, 1, 1,
1.197068, -0.5976462, 2.656654, 1, 1, 1, 1, 1,
1.201741, -1.608341, 1.946189, 1, 1, 1, 1, 1,
1.203537, -0.3006583, 1.81186, 1, 1, 1, 1, 1,
1.206875, -0.09984232, 1.416259, 1, 1, 1, 1, 1,
1.214609, -0.8874972, 0.5301495, 1, 1, 1, 1, 1,
1.217942, -0.05002923, 1.263914, 1, 1, 1, 1, 1,
1.231297, -0.444178, 3.479674, 1, 1, 1, 1, 1,
1.231442, 0.1530275, 1.467808, 1, 1, 1, 1, 1,
1.232452, -0.2666562, 1.469953, 0, 0, 1, 1, 1,
1.247988, -1.12053, 3.396576, 1, 0, 0, 1, 1,
1.254629, 1.439103, 1.191833, 1, 0, 0, 1, 1,
1.256632, 0.05025131, 1.068727, 1, 0, 0, 1, 1,
1.256986, 0.5901817, 0.2195549, 1, 0, 0, 1, 1,
1.262715, -1.442808, 1.762477, 1, 0, 0, 1, 1,
1.268385, 0.231314, 0.7086099, 0, 0, 0, 1, 1,
1.272205, -0.7372674, 2.235288, 0, 0, 0, 1, 1,
1.27641, 0.03624374, 2.050755, 0, 0, 0, 1, 1,
1.278627, 0.08228288, -0.4255627, 0, 0, 0, 1, 1,
1.281305, -0.5705865, 2.97343, 0, 0, 0, 1, 1,
1.288285, 1.787492, 0.4108365, 0, 0, 0, 1, 1,
1.305381, -0.7136213, 1.912945, 0, 0, 0, 1, 1,
1.30591, 0.7462774, 1.261121, 1, 1, 1, 1, 1,
1.321504, -0.3259195, 2.867349, 1, 1, 1, 1, 1,
1.324844, 0.7784097, 1.544142, 1, 1, 1, 1, 1,
1.343148, 0.9993042, 1.314724, 1, 1, 1, 1, 1,
1.343562, 0.08558633, 3.359889, 1, 1, 1, 1, 1,
1.34963, 0.5172952, 0.143197, 1, 1, 1, 1, 1,
1.354824, -0.1163158, 2.863962, 1, 1, 1, 1, 1,
1.361101, 0.9853096, 1.076858, 1, 1, 1, 1, 1,
1.362152, -0.6491867, 2.616228, 1, 1, 1, 1, 1,
1.362481, -0.5045034, 1.495213, 1, 1, 1, 1, 1,
1.387564, 0.02681095, 0.9847995, 1, 1, 1, 1, 1,
1.400495, 0.5011216, 0.4874122, 1, 1, 1, 1, 1,
1.403657, 0.6958814, 1.263295, 1, 1, 1, 1, 1,
1.411526, -0.6963637, 1.185752, 1, 1, 1, 1, 1,
1.413689, 0.326506, 2.117166, 1, 1, 1, 1, 1,
1.422217, -0.2367063, 0.933392, 0, 0, 1, 1, 1,
1.423884, 2.333006, -0.1825088, 1, 0, 0, 1, 1,
1.425744, -0.6389681, 2.023934, 1, 0, 0, 1, 1,
1.427768, -1.52267, 3.041751, 1, 0, 0, 1, 1,
1.436317, 0.9801536, 1.897295, 1, 0, 0, 1, 1,
1.443345, -0.443565, 1.40712, 1, 0, 0, 1, 1,
1.447218, 0.5432508, 1.075439, 0, 0, 0, 1, 1,
1.447855, 0.7411101, -1.043819, 0, 0, 0, 1, 1,
1.449581, -1.215336, 2.793784, 0, 0, 0, 1, 1,
1.459068, -0.02696416, 1.793862, 0, 0, 0, 1, 1,
1.460823, 1.489747, 0.8710572, 0, 0, 0, 1, 1,
1.465613, 0.893257, 1.964838, 0, 0, 0, 1, 1,
1.466584, 0.3681546, 1.149127, 0, 0, 0, 1, 1,
1.471866, 1.012352, 1.595629, 1, 1, 1, 1, 1,
1.472302, -1.267482, 4.965253, 1, 1, 1, 1, 1,
1.472726, -2.532644, 3.718626, 1, 1, 1, 1, 1,
1.473162, -0.9190965, 1.734442, 1, 1, 1, 1, 1,
1.490047, -0.9734905, -1.082295, 1, 1, 1, 1, 1,
1.503251, 0.5680183, 2.446572, 1, 1, 1, 1, 1,
1.503589, -1.152897, 2.558001, 1, 1, 1, 1, 1,
1.507593, -1.002979, 3.776018, 1, 1, 1, 1, 1,
1.545093, 0.3253896, 0.6866661, 1, 1, 1, 1, 1,
1.557105, 1.125335, 0.6215603, 1, 1, 1, 1, 1,
1.580848, 0.4589866, 0.4767202, 1, 1, 1, 1, 1,
1.587189, 0.1742929, 1.059549, 1, 1, 1, 1, 1,
1.590208, 1.093451, 2.95089, 1, 1, 1, 1, 1,
1.604102, 1.536048, -0.6842159, 1, 1, 1, 1, 1,
1.610619, 1.179209, 1.257949, 1, 1, 1, 1, 1,
1.618658, -0.3933739, 2.525867, 0, 0, 1, 1, 1,
1.629663, -0.1093764, 3.467215, 1, 0, 0, 1, 1,
1.630072, 0.6768032, -1.021382, 1, 0, 0, 1, 1,
1.6321, -0.1009261, 2.746421, 1, 0, 0, 1, 1,
1.679083, 0.3224116, 2.246108, 1, 0, 0, 1, 1,
1.707333, -0.2251215, 3.456158, 1, 0, 0, 1, 1,
1.710335, -0.2630663, 2.80627, 0, 0, 0, 1, 1,
1.722326, -0.43247, 1.975542, 0, 0, 0, 1, 1,
1.728698, -0.2161822, 0.650396, 0, 0, 0, 1, 1,
1.758126, -0.2880567, 2.344407, 0, 0, 0, 1, 1,
1.762545, -0.493167, 0.7916824, 0, 0, 0, 1, 1,
1.788836, -0.7634454, 3.437602, 0, 0, 0, 1, 1,
1.845196, -0.205032, 1.451126, 0, 0, 0, 1, 1,
1.848125, 0.04931578, 2.656127, 1, 1, 1, 1, 1,
1.871855, 1.195195, 0.2414237, 1, 1, 1, 1, 1,
1.903214, -0.2332258, 1.257533, 1, 1, 1, 1, 1,
1.907198, -0.2932178, 1.776269, 1, 1, 1, 1, 1,
1.919677, 0.1853582, 2.309677, 1, 1, 1, 1, 1,
1.930463, 2.320284, -0.2967381, 1, 1, 1, 1, 1,
1.934732, 0.3452276, 3.027535, 1, 1, 1, 1, 1,
1.935662, -0.4435662, 1.511379, 1, 1, 1, 1, 1,
1.955589, -0.4691982, 0.9531449, 1, 1, 1, 1, 1,
1.991615, -0.8611987, 1.339684, 1, 1, 1, 1, 1,
1.993105, -1.510765, 1.454252, 1, 1, 1, 1, 1,
1.994074, -1.515022, 2.748142, 1, 1, 1, 1, 1,
2.038138, 0.1071616, 1.76345, 1, 1, 1, 1, 1,
2.065472, -0.4152856, 0.6347684, 1, 1, 1, 1, 1,
2.068064, 1.688147, -0.6790528, 1, 1, 1, 1, 1,
2.094044, -0.9827443, 1.671463, 0, 0, 1, 1, 1,
2.129361, -0.1051765, 2.446382, 1, 0, 0, 1, 1,
2.198653, -0.01882284, 2.351985, 1, 0, 0, 1, 1,
2.237638, 0.2783865, 2.880318, 1, 0, 0, 1, 1,
2.254886, -0.03232021, 0.4309184, 1, 0, 0, 1, 1,
2.327054, -2.538424, 3.362402, 1, 0, 0, 1, 1,
2.327681, 0.389222, 0.93758, 0, 0, 0, 1, 1,
2.331046, -2.875937, 2.273125, 0, 0, 0, 1, 1,
2.389363, -1.248196, 2.60979, 0, 0, 0, 1, 1,
2.416102, -0.9697034, 2.577208, 0, 0, 0, 1, 1,
2.477036, -0.7134867, 1.589502, 0, 0, 0, 1, 1,
2.483305, -0.1059501, 2.046531, 0, 0, 0, 1, 1,
2.601086, -0.01173114, 1.669787, 0, 0, 0, 1, 1,
2.642816, -0.3697275, 0.8262725, 1, 1, 1, 1, 1,
2.707547, -1.730502, 1.693568, 1, 1, 1, 1, 1,
2.761985, 0.5727818, 1.834587, 1, 1, 1, 1, 1,
2.809943, 0.770535, 1.618839, 1, 1, 1, 1, 1,
2.997886, -0.5361973, 1.329055, 1, 1, 1, 1, 1,
3.0575, -0.6555098, 2.129641, 1, 1, 1, 1, 1,
3.508534, 1.714164, 0.1492165, 1, 1, 1, 1, 1
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
var radius = 10.09783;
var distance = 35.4682;
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
mvMatrix.translate( -0.09778786, 0.5342071, 0.4596798 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.4682);
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
