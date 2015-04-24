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
-2.626387, -0.1073513, -1.187516, 1, 0, 0, 1,
-2.517215, 3.06925, -0.7905238, 1, 0.007843138, 0, 1,
-2.507526, 0.8156121, -1.281951, 1, 0.01176471, 0, 1,
-2.498319, 0.6177865, -2.489924, 1, 0.01960784, 0, 1,
-2.46489, 0.2957737, -2.721255, 1, 0.02352941, 0, 1,
-2.430227, 2.041141, -0.2485475, 1, 0.03137255, 0, 1,
-2.420479, -0.661006, -1.44647, 1, 0.03529412, 0, 1,
-2.350521, -0.5837114, -1.172701, 1, 0.04313726, 0, 1,
-2.344929, 0.2375717, -2.10316, 1, 0.04705882, 0, 1,
-2.318589, -0.4080459, -1.853305, 1, 0.05490196, 0, 1,
-2.298035, 0.01437298, -1.685388, 1, 0.05882353, 0, 1,
-2.276546, 0.03097654, -1.224925, 1, 0.06666667, 0, 1,
-2.267322, -0.6586605, -2.286782, 1, 0.07058824, 0, 1,
-2.206404, -1.322791, -0.7084087, 1, 0.07843138, 0, 1,
-2.181032, 0.0403116, -1.764054, 1, 0.08235294, 0, 1,
-2.140872, 0.6975346, -1.37482, 1, 0.09019608, 0, 1,
-2.12573, -0.05363656, -1.188072, 1, 0.09411765, 0, 1,
-2.10974, 0.3485349, -2.534404, 1, 0.1019608, 0, 1,
-2.093238, 0.6977307, -1.485387, 1, 0.1098039, 0, 1,
-2.090636, -0.8507795, -2.135779, 1, 0.1137255, 0, 1,
-2.068133, 0.09022142, 0.1504723, 1, 0.1215686, 0, 1,
-2.064654, -1.5584, -1.768879, 1, 0.1254902, 0, 1,
-2.063896, 1.801194, 0.6195782, 1, 0.1333333, 0, 1,
-2.061963, 0.05389293, -1.776239, 1, 0.1372549, 0, 1,
-2.057577, 0.4632893, -1.957114, 1, 0.145098, 0, 1,
-2.050052, -0.5234376, -2.716484, 1, 0.1490196, 0, 1,
-2.047699, 1.684691, -1.26201, 1, 0.1568628, 0, 1,
-2.023819, 0.7067531, -2.071402, 1, 0.1607843, 0, 1,
-2.017107, 1.189724, 0.8178927, 1, 0.1686275, 0, 1,
-2.000926, -0.9310889, -2.918416, 1, 0.172549, 0, 1,
-1.989057, 1.188304, -0.9966395, 1, 0.1803922, 0, 1,
-1.982994, 0.5058047, -2.567619, 1, 0.1843137, 0, 1,
-1.954544, -1.755039, -1.108458, 1, 0.1921569, 0, 1,
-1.953096, -2.532312, -2.889351, 1, 0.1960784, 0, 1,
-1.947272, 3.107134, 0.6928565, 1, 0.2039216, 0, 1,
-1.942957, 0.6123805, -1.356135, 1, 0.2117647, 0, 1,
-1.939547, 1.15543, -3.110798, 1, 0.2156863, 0, 1,
-1.933569, 0.2125723, -2.014256, 1, 0.2235294, 0, 1,
-1.896726, 1.686772, -2.039286, 1, 0.227451, 0, 1,
-1.888393, 0.6934161, -0.2898162, 1, 0.2352941, 0, 1,
-1.881753, 0.7444201, -2.408368, 1, 0.2392157, 0, 1,
-1.880522, -0.2863767, -0.7878209, 1, 0.2470588, 0, 1,
-1.877234, -1.239451, -1.63092, 1, 0.2509804, 0, 1,
-1.864727, -0.6153847, -2.904507, 1, 0.2588235, 0, 1,
-1.862456, -0.03174784, -3.041891, 1, 0.2627451, 0, 1,
-1.855104, 0.6300383, -1.412985, 1, 0.2705882, 0, 1,
-1.851288, -0.3065392, -2.029315, 1, 0.2745098, 0, 1,
-1.826645, -1.764839, -2.207914, 1, 0.282353, 0, 1,
-1.809747, -0.492141, -2.395297, 1, 0.2862745, 0, 1,
-1.798695, 1.050044, -2.366552, 1, 0.2941177, 0, 1,
-1.795844, 0.6310376, -1.969646, 1, 0.3019608, 0, 1,
-1.795285, -1.512386, -2.713427, 1, 0.3058824, 0, 1,
-1.792189, 0.9535223, -1.525473, 1, 0.3137255, 0, 1,
-1.742807, 0.1763999, -2.476019, 1, 0.3176471, 0, 1,
-1.734201, 2.12046, -0.7247404, 1, 0.3254902, 0, 1,
-1.729029, 1.474918, -0.6051204, 1, 0.3294118, 0, 1,
-1.722752, -0.3529928, -0.9042152, 1, 0.3372549, 0, 1,
-1.720653, -1.63071, -2.060854, 1, 0.3411765, 0, 1,
-1.716413, -1.073149, -1.654103, 1, 0.3490196, 0, 1,
-1.714619, 0.4817857, -1.648664, 1, 0.3529412, 0, 1,
-1.709602, -0.8540832, -3.436407, 1, 0.3607843, 0, 1,
-1.682428, -0.2315918, -1.144342, 1, 0.3647059, 0, 1,
-1.682334, -1.22484, -1.979141, 1, 0.372549, 0, 1,
-1.679834, 0.1860568, -3.299376, 1, 0.3764706, 0, 1,
-1.669824, 0.777437, -0.5534589, 1, 0.3843137, 0, 1,
-1.657451, -0.2934561, -1.643051, 1, 0.3882353, 0, 1,
-1.655668, 0.3125182, -2.159662, 1, 0.3960784, 0, 1,
-1.633133, -0.7113084, -1.622704, 1, 0.4039216, 0, 1,
-1.631961, 1.252154, -2.126509, 1, 0.4078431, 0, 1,
-1.629826, 0.8725221, -2.095032, 1, 0.4156863, 0, 1,
-1.626821, -1.875087, -3.66873, 1, 0.4196078, 0, 1,
-1.609389, -1.984791, -2.700446, 1, 0.427451, 0, 1,
-1.60794, 0.242549, 0.6878814, 1, 0.4313726, 0, 1,
-1.60252, 0.5475807, -1.202814, 1, 0.4392157, 0, 1,
-1.597025, 0.4763159, -2.646951, 1, 0.4431373, 0, 1,
-1.592519, -0.4639093, -1.928463, 1, 0.4509804, 0, 1,
-1.576833, -0.3573498, -3.824129, 1, 0.454902, 0, 1,
-1.565524, -1.220537, -2.620775, 1, 0.4627451, 0, 1,
-1.557613, 0.9403653, -0.5792575, 1, 0.4666667, 0, 1,
-1.556072, 1.510697, -1.576011, 1, 0.4745098, 0, 1,
-1.54985, 0.004569366, -0.8490033, 1, 0.4784314, 0, 1,
-1.535099, 0.6885993, -2.381904, 1, 0.4862745, 0, 1,
-1.534091, -0.919144, -3.399915, 1, 0.4901961, 0, 1,
-1.526269, 1.390488, -0.7028468, 1, 0.4980392, 0, 1,
-1.488457, 0.7769072, -1.224469, 1, 0.5058824, 0, 1,
-1.47859, 2.386747, -0.01809363, 1, 0.509804, 0, 1,
-1.46716, 1.77218, -1.482017, 1, 0.5176471, 0, 1,
-1.466432, -2.020826, -3.314119, 1, 0.5215687, 0, 1,
-1.465078, 0.2976489, -0.6779386, 1, 0.5294118, 0, 1,
-1.459038, 0.309996, -0.5957284, 1, 0.5333334, 0, 1,
-1.456307, 1.378994, -0.7048964, 1, 0.5411765, 0, 1,
-1.447046, 0.5066806, -2.125378, 1, 0.5450981, 0, 1,
-1.435147, -0.1697665, -1.487546, 1, 0.5529412, 0, 1,
-1.421921, 0.2109069, -2.693676, 1, 0.5568628, 0, 1,
-1.421077, 0.6260234, -0.4332265, 1, 0.5647059, 0, 1,
-1.415978, 0.120621, -2.795202, 1, 0.5686275, 0, 1,
-1.412995, 1.293555, -1.07698, 1, 0.5764706, 0, 1,
-1.411997, -0.5933052, -1.254588, 1, 0.5803922, 0, 1,
-1.410359, -0.287847, -0.7905151, 1, 0.5882353, 0, 1,
-1.40885, 0.123409, 0.8959117, 1, 0.5921569, 0, 1,
-1.406121, -0.1981971, -2.362322, 1, 0.6, 0, 1,
-1.405983, 0.2672716, -2.238476, 1, 0.6078432, 0, 1,
-1.392432, -0.5268674, -2.155837, 1, 0.6117647, 0, 1,
-1.380559, -0.6382519, -1.631407, 1, 0.6196079, 0, 1,
-1.370078, 0.4010133, 0.22857, 1, 0.6235294, 0, 1,
-1.362972, 1.061154, -0.3289682, 1, 0.6313726, 0, 1,
-1.339713, -0.2730183, -1.117899, 1, 0.6352941, 0, 1,
-1.335879, 0.9269354, 0.180406, 1, 0.6431373, 0, 1,
-1.333753, -0.7432147, -0.9083675, 1, 0.6470588, 0, 1,
-1.315986, -1.664497, -1.480161, 1, 0.654902, 0, 1,
-1.306213, -0.4067577, -1.729547, 1, 0.6588235, 0, 1,
-1.302627, 0.4140477, -0.5582125, 1, 0.6666667, 0, 1,
-1.297938, -0.8313655, -2.28103, 1, 0.6705883, 0, 1,
-1.290168, 2.17269, -1.067981, 1, 0.6784314, 0, 1,
-1.28477, -0.9173599, -2.118482, 1, 0.682353, 0, 1,
-1.283413, 0.5061417, -2.60428, 1, 0.6901961, 0, 1,
-1.281719, 2.008013, -0.287814, 1, 0.6941177, 0, 1,
-1.279333, 0.6722607, -1.923808, 1, 0.7019608, 0, 1,
-1.276024, -0.5400457, 0.9090341, 1, 0.7098039, 0, 1,
-1.267765, 0.6291677, -1.708887, 1, 0.7137255, 0, 1,
-1.26737, 1.468057, -1.610255, 1, 0.7215686, 0, 1,
-1.261055, -0.5220224, -2.060393, 1, 0.7254902, 0, 1,
-1.258985, 1.761091, -1.443415, 1, 0.7333333, 0, 1,
-1.250931, -0.7544599, -0.9019504, 1, 0.7372549, 0, 1,
-1.235711, 0.400374, -0.2786629, 1, 0.7450981, 0, 1,
-1.229951, 0.6208716, 0.2224911, 1, 0.7490196, 0, 1,
-1.214888, -0.1677665, -2.566059, 1, 0.7568628, 0, 1,
-1.213876, -0.9975879, -2.849582, 1, 0.7607843, 0, 1,
-1.211408, -1.06514, -2.745684, 1, 0.7686275, 0, 1,
-1.209404, 1.487075, -1.648011, 1, 0.772549, 0, 1,
-1.205745, -1.094457, -1.101195, 1, 0.7803922, 0, 1,
-1.197728, 1.51854, -0.6372686, 1, 0.7843137, 0, 1,
-1.195961, -1.378645, -1.956961, 1, 0.7921569, 0, 1,
-1.195898, 0.009563031, -0.8162422, 1, 0.7960784, 0, 1,
-1.183755, 0.8098001, 0.07166567, 1, 0.8039216, 0, 1,
-1.176814, -1.603857, -2.689377, 1, 0.8117647, 0, 1,
-1.173851, 0.4272121, -1.19919, 1, 0.8156863, 0, 1,
-1.164282, -0.6604731, -0.8489091, 1, 0.8235294, 0, 1,
-1.162438, -0.04175588, -0.7400801, 1, 0.827451, 0, 1,
-1.160052, -2.775374, -1.915438, 1, 0.8352941, 0, 1,
-1.156243, -1.159098, -1.483333, 1, 0.8392157, 0, 1,
-1.131967, 0.5328906, -0.4107715, 1, 0.8470588, 0, 1,
-1.131302, -2.13648, -4.955325, 1, 0.8509804, 0, 1,
-1.125645, -0.7397269, -1.767868, 1, 0.8588235, 0, 1,
-1.123933, -0.313582, -1.991452, 1, 0.8627451, 0, 1,
-1.105654, 0.069684, -2.150572, 1, 0.8705882, 0, 1,
-1.10247, 1.775129, 0.8794776, 1, 0.8745098, 0, 1,
-1.100263, -1.912871, -1.834574, 1, 0.8823529, 0, 1,
-1.099648, 0.1605104, 0.08781295, 1, 0.8862745, 0, 1,
-1.09782, -2.124564, -3.378432, 1, 0.8941177, 0, 1,
-1.085804, -0.6140569, -2.866225, 1, 0.8980392, 0, 1,
-1.085508, -0.6676889, -0.2426895, 1, 0.9058824, 0, 1,
-1.070635, 0.3740707, -0.3610837, 1, 0.9137255, 0, 1,
-1.063138, 1.367563, -0.7634867, 1, 0.9176471, 0, 1,
-1.0587, -0.6075594, -2.956029, 1, 0.9254902, 0, 1,
-1.056065, -1.031038, -2.423937, 1, 0.9294118, 0, 1,
-1.055387, -0.05334313, -1.344614, 1, 0.9372549, 0, 1,
-1.055227, 1.031097, 0.1684075, 1, 0.9411765, 0, 1,
-1.040838, 1.229536, -1.171369, 1, 0.9490196, 0, 1,
-1.037828, 0.540609, 0.7495444, 1, 0.9529412, 0, 1,
-1.027348, -0.4630263, -2.764276, 1, 0.9607843, 0, 1,
-1.024049, -0.2088399, -0.8901923, 1, 0.9647059, 0, 1,
-1.023673, -0.5242609, -1.751279, 1, 0.972549, 0, 1,
-1.0231, 0.3341362, -1.018085, 1, 0.9764706, 0, 1,
-1.01603, -1.341339, -3.179045, 1, 0.9843137, 0, 1,
-1.000969, 0.3291583, -0.7016881, 1, 0.9882353, 0, 1,
-0.9997584, -0.5140801, -3.243903, 1, 0.9960784, 0, 1,
-0.9991921, -0.7191097, -1.06525, 0.9960784, 1, 0, 1,
-0.9937187, 0.2761084, -3.539511, 0.9921569, 1, 0, 1,
-0.9895919, 0.4392706, 0.5458686, 0.9843137, 1, 0, 1,
-0.9891655, 1.980716, -1.241575, 0.9803922, 1, 0, 1,
-0.9765989, -1.198346, -3.142874, 0.972549, 1, 0, 1,
-0.9730409, -0.9911945, -2.614074, 0.9686275, 1, 0, 1,
-0.9725658, 0.6205704, -1.982467, 0.9607843, 1, 0, 1,
-0.9718148, 0.4056415, -0.2899667, 0.9568627, 1, 0, 1,
-0.9711071, 0.1477938, -2.217612, 0.9490196, 1, 0, 1,
-0.9588829, 0.3658628, -2.428991, 0.945098, 1, 0, 1,
-0.9586857, 2.255219, -0.2775834, 0.9372549, 1, 0, 1,
-0.9560232, 1.667909, -0.9142334, 0.9333333, 1, 0, 1,
-0.9517196, 0.3520308, -1.00025, 0.9254902, 1, 0, 1,
-0.9494375, 1.297729, 0.09282231, 0.9215686, 1, 0, 1,
-0.9413203, -1.584999, -3.305914, 0.9137255, 1, 0, 1,
-0.9404335, 0.04189143, -0.9336175, 0.9098039, 1, 0, 1,
-0.9372231, 0.4062979, -0.9586715, 0.9019608, 1, 0, 1,
-0.9308208, 0.3018106, -1.250875, 0.8941177, 1, 0, 1,
-0.9204672, -1.177564, -4.270073, 0.8901961, 1, 0, 1,
-0.9121343, 0.6718975, -1.279809, 0.8823529, 1, 0, 1,
-0.906951, -1.667386, -3.434838, 0.8784314, 1, 0, 1,
-0.9032072, -1.118838, -2.933917, 0.8705882, 1, 0, 1,
-0.9009883, 1.463317, 0.6435692, 0.8666667, 1, 0, 1,
-0.8941292, 0.3976557, 0.2357117, 0.8588235, 1, 0, 1,
-0.8923659, -0.6143253, -2.962031, 0.854902, 1, 0, 1,
-0.8878427, 1.381923, -2.433796, 0.8470588, 1, 0, 1,
-0.8844444, -0.006045434, -1.747773, 0.8431373, 1, 0, 1,
-0.8841143, 0.06933681, -1.185578, 0.8352941, 1, 0, 1,
-0.882597, -1.471964, -2.810522, 0.8313726, 1, 0, 1,
-0.8739837, 0.4597991, -2.765221, 0.8235294, 1, 0, 1,
-0.8730679, 0.6154767, 0.5330082, 0.8196079, 1, 0, 1,
-0.8683574, -0.6168255, -2.29755, 0.8117647, 1, 0, 1,
-0.867152, -0.1190359, -0.3587276, 0.8078431, 1, 0, 1,
-0.8659431, 0.5459496, -2.414268, 0.8, 1, 0, 1,
-0.8645644, -0.7992921, -3.233935, 0.7921569, 1, 0, 1,
-0.8643179, -0.3102396, -1.579212, 0.7882353, 1, 0, 1,
-0.8619929, 0.5814961, -1.533055, 0.7803922, 1, 0, 1,
-0.8585471, -0.135578, -2.905261, 0.7764706, 1, 0, 1,
-0.854211, -0.2667521, -2.263703, 0.7686275, 1, 0, 1,
-0.8370153, 0.2244601, -2.874164, 0.7647059, 1, 0, 1,
-0.8369955, 0.3078325, -0.4212231, 0.7568628, 1, 0, 1,
-0.8348154, 1.119698, -1.11222, 0.7529412, 1, 0, 1,
-0.8318366, 0.03519958, -1.968937, 0.7450981, 1, 0, 1,
-0.8282338, 0.4835414, -1.653708, 0.7411765, 1, 0, 1,
-0.8206561, -1.129929, -2.102079, 0.7333333, 1, 0, 1,
-0.8199426, 1.735487, -0.3554445, 0.7294118, 1, 0, 1,
-0.8148863, -0.1332074, -3.14791, 0.7215686, 1, 0, 1,
-0.814712, 0.516598, -1.05769, 0.7176471, 1, 0, 1,
-0.8142759, -0.01657908, -1.465685, 0.7098039, 1, 0, 1,
-0.8100728, 0.3599449, -1.329463, 0.7058824, 1, 0, 1,
-0.8084008, 1.117897, -1.325376, 0.6980392, 1, 0, 1,
-0.8050863, 0.02714407, -2.732472, 0.6901961, 1, 0, 1,
-0.8045389, 0.8110493, -2.283262, 0.6862745, 1, 0, 1,
-0.8014871, 2.105071, 0.5260892, 0.6784314, 1, 0, 1,
-0.7995335, -0.9955044, -1.61508, 0.6745098, 1, 0, 1,
-0.797107, -0.544439, -2.8209, 0.6666667, 1, 0, 1,
-0.7907103, 1.047258, 0.5827186, 0.6627451, 1, 0, 1,
-0.7898464, 0.5788102, -1.338639, 0.654902, 1, 0, 1,
-0.7877418, -1.284586, -1.376187, 0.6509804, 1, 0, 1,
-0.7868897, -0.5501808, -4.178182, 0.6431373, 1, 0, 1,
-0.7830923, -0.5735243, -1.674136, 0.6392157, 1, 0, 1,
-0.7819653, 1.4615, -1.077636, 0.6313726, 1, 0, 1,
-0.779369, 1.611132, -0.7190763, 0.627451, 1, 0, 1,
-0.7755415, 0.4954717, -0.4443624, 0.6196079, 1, 0, 1,
-0.7739419, 0.6133511, -1.799701, 0.6156863, 1, 0, 1,
-0.768969, -0.9834224, -0.5207212, 0.6078432, 1, 0, 1,
-0.7590141, -0.639764, -3.302849, 0.6039216, 1, 0, 1,
-0.7560737, 1.092215, -2.138512, 0.5960785, 1, 0, 1,
-0.755341, -1.133018, -3.303159, 0.5882353, 1, 0, 1,
-0.7476332, -0.04865124, -2.096455, 0.5843138, 1, 0, 1,
-0.7426084, 1.315367, -1.640707, 0.5764706, 1, 0, 1,
-0.7378729, 1.803499, -0.389378, 0.572549, 1, 0, 1,
-0.7374476, -0.09039825, -1.836949, 0.5647059, 1, 0, 1,
-0.7323406, 1.330014, -2.088153, 0.5607843, 1, 0, 1,
-0.7251886, 0.5897353, -1.045653, 0.5529412, 1, 0, 1,
-0.7191674, -1.876215, -3.203655, 0.5490196, 1, 0, 1,
-0.7148237, 0.7195874, 0.8171515, 0.5411765, 1, 0, 1,
-0.7103622, -0.5761567, -0.6182743, 0.5372549, 1, 0, 1,
-0.7100909, -1.332439, -4.223786, 0.5294118, 1, 0, 1,
-0.706323, 1.450575, 1.368789, 0.5254902, 1, 0, 1,
-0.7034787, -1.996217, -1.746697, 0.5176471, 1, 0, 1,
-0.700276, 0.7166893, -0.7847639, 0.5137255, 1, 0, 1,
-0.6968969, 0.8626284, -1.586923, 0.5058824, 1, 0, 1,
-0.6945857, 0.71499, -0.58591, 0.5019608, 1, 0, 1,
-0.6886703, -0.6633522, -1.631301, 0.4941176, 1, 0, 1,
-0.6873115, -0.904672, -3.407062, 0.4862745, 1, 0, 1,
-0.685056, -0.307519, -2.850219, 0.4823529, 1, 0, 1,
-0.6805483, 0.6628685, -0.3324042, 0.4745098, 1, 0, 1,
-0.668965, -0.5356697, -2.002422, 0.4705882, 1, 0, 1,
-0.6648151, 1.097211, -2.942206, 0.4627451, 1, 0, 1,
-0.6646307, 1.366885, -1.976367, 0.4588235, 1, 0, 1,
-0.6637887, -0.8418519, -2.025335, 0.4509804, 1, 0, 1,
-0.6591177, -0.7922266, -3.282653, 0.4470588, 1, 0, 1,
-0.6476065, -1.370968, -2.784522, 0.4392157, 1, 0, 1,
-0.6467302, -0.3594773, -1.941861, 0.4352941, 1, 0, 1,
-0.6462643, 0.460342, -2.045512, 0.427451, 1, 0, 1,
-0.6418625, 0.8146424, -0.8542103, 0.4235294, 1, 0, 1,
-0.6411243, 0.7556459, -0.7267571, 0.4156863, 1, 0, 1,
-0.636034, 0.5294525, -2.177388, 0.4117647, 1, 0, 1,
-0.6321093, -0.89026, -2.606662, 0.4039216, 1, 0, 1,
-0.6318584, -0.5685966, -2.419206, 0.3960784, 1, 0, 1,
-0.6271626, -1.161554, -1.70487, 0.3921569, 1, 0, 1,
-0.6261969, 0.2766382, -0.8748683, 0.3843137, 1, 0, 1,
-0.6257043, 0.108505, -1.449599, 0.3803922, 1, 0, 1,
-0.6238285, -0.469496, -2.987901, 0.372549, 1, 0, 1,
-0.6194566, -0.2300295, -0.7365131, 0.3686275, 1, 0, 1,
-0.6183279, 0.5361893, -0.1769263, 0.3607843, 1, 0, 1,
-0.613829, 0.6205903, -1.585208, 0.3568628, 1, 0, 1,
-0.6123596, -0.5754836, -3.285424, 0.3490196, 1, 0, 1,
-0.6093708, -0.2009035, -3.571235, 0.345098, 1, 0, 1,
-0.6061814, -0.415794, -2.179601, 0.3372549, 1, 0, 1,
-0.6060082, 0.1191485, -3.329833, 0.3333333, 1, 0, 1,
-0.6035495, -0.6281554, -3.14182, 0.3254902, 1, 0, 1,
-0.6027002, -0.1416595, -3.167636, 0.3215686, 1, 0, 1,
-0.5991798, -0.06102055, -0.6514175, 0.3137255, 1, 0, 1,
-0.5990191, -1.785557, -2.939657, 0.3098039, 1, 0, 1,
-0.5970078, -0.06917462, -2.227916, 0.3019608, 1, 0, 1,
-0.5957554, 1.022336, -2.906845, 0.2941177, 1, 0, 1,
-0.5921538, 1.551384, -0.9136744, 0.2901961, 1, 0, 1,
-0.5903323, -0.6691984, -3.737553, 0.282353, 1, 0, 1,
-0.5875906, 0.577361, 0.2548215, 0.2784314, 1, 0, 1,
-0.5849187, -1.539944, -1.31463, 0.2705882, 1, 0, 1,
-0.5781616, 2.923793, -1.079047, 0.2666667, 1, 0, 1,
-0.5766411, 2.563513, 0.4534601, 0.2588235, 1, 0, 1,
-0.5734081, 0.7360837, -0.06518517, 0.254902, 1, 0, 1,
-0.5733958, 2.455142, 0.2233603, 0.2470588, 1, 0, 1,
-0.5576987, -0.06446646, -0.9798508, 0.2431373, 1, 0, 1,
-0.5575539, -1.008084, -2.215811, 0.2352941, 1, 0, 1,
-0.5559958, 0.7077979, -3.695764, 0.2313726, 1, 0, 1,
-0.5531936, 0.1567644, -1.339443, 0.2235294, 1, 0, 1,
-0.5499128, 1.82394, 0.7276793, 0.2196078, 1, 0, 1,
-0.5461885, -0.4711809, -1.599365, 0.2117647, 1, 0, 1,
-0.5458366, 0.3418943, -2.326226, 0.2078431, 1, 0, 1,
-0.5435941, -2.391369, -3.283481, 0.2, 1, 0, 1,
-0.5432312, -0.5428998, -2.550172, 0.1921569, 1, 0, 1,
-0.5354875, 0.09054526, -1.420499, 0.1882353, 1, 0, 1,
-0.5349996, -0.3053054, -3.494242, 0.1803922, 1, 0, 1,
-0.5341589, 1.918863, -0.6823327, 0.1764706, 1, 0, 1,
-0.5322514, 0.1270381, 1.475786, 0.1686275, 1, 0, 1,
-0.5309705, 0.1864045, -1.429895, 0.1647059, 1, 0, 1,
-0.5177559, 0.7405856, -1.079066, 0.1568628, 1, 0, 1,
-0.5155785, 0.09312682, -1.278705, 0.1529412, 1, 0, 1,
-0.5119233, -0.8341483, -3.358543, 0.145098, 1, 0, 1,
-0.5052516, -0.2152153, -1.188253, 0.1411765, 1, 0, 1,
-0.504878, 1.496634, -1.360898, 0.1333333, 1, 0, 1,
-0.5037987, -0.362366, -1.762366, 0.1294118, 1, 0, 1,
-0.4963172, 1.454944, 0.5946558, 0.1215686, 1, 0, 1,
-0.4942089, 0.4777382, -1.264784, 0.1176471, 1, 0, 1,
-0.4939918, 1.433137, 0.1373352, 0.1098039, 1, 0, 1,
-0.4903898, 0.3356438, 1.567912, 0.1058824, 1, 0, 1,
-0.4850589, -0.2459838, -0.8769181, 0.09803922, 1, 0, 1,
-0.4824168, 0.06698918, -3.179098, 0.09019608, 1, 0, 1,
-0.4816372, 0.5438843, -1.385827, 0.08627451, 1, 0, 1,
-0.4731992, -0.8923086, -0.9064782, 0.07843138, 1, 0, 1,
-0.4653103, -0.1082607, -2.054225, 0.07450981, 1, 0, 1,
-0.4625911, -0.006651497, -1.213319, 0.06666667, 1, 0, 1,
-0.4616326, -1.190106, -2.335563, 0.0627451, 1, 0, 1,
-0.4580111, -0.3997374, -2.5167, 0.05490196, 1, 0, 1,
-0.4579575, 0.3734077, 0.3698112, 0.05098039, 1, 0, 1,
-0.4575407, -0.3376417, -1.752721, 0.04313726, 1, 0, 1,
-0.4520631, -2.091691, -2.986513, 0.03921569, 1, 0, 1,
-0.4515061, 1.040679, 1.059221, 0.03137255, 1, 0, 1,
-0.4480082, -1.710063, -3.124141, 0.02745098, 1, 0, 1,
-0.4377781, 2.880048, -0.613609, 0.01960784, 1, 0, 1,
-0.4357285, -1.013844, -2.708496, 0.01568628, 1, 0, 1,
-0.4339509, 0.09293596, -1.837109, 0.007843138, 1, 0, 1,
-0.432292, 1.078625, -0.4361174, 0.003921569, 1, 0, 1,
-0.4322504, 1.03516, -0.9008439, 0, 1, 0.003921569, 1,
-0.4309918, 0.1573739, 1.370488, 0, 1, 0.01176471, 1,
-0.4308771, 0.8726863, -0.8206911, 0, 1, 0.01568628, 1,
-0.428563, 0.4080335, 0.1682898, 0, 1, 0.02352941, 1,
-0.4227189, 1.804544, -1.101059, 0, 1, 0.02745098, 1,
-0.4173709, -0.5916299, -1.952351, 0, 1, 0.03529412, 1,
-0.4155041, -0.5342884, -1.470568, 0, 1, 0.03921569, 1,
-0.4115195, -0.9877916, -2.837171, 0, 1, 0.04705882, 1,
-0.4031508, -1.961224, -3.571155, 0, 1, 0.05098039, 1,
-0.4024765, -0.1689629, -2.37702, 0, 1, 0.05882353, 1,
-0.4001991, 1.137653, 0.9329867, 0, 1, 0.0627451, 1,
-0.3984841, 0.777921, -0.1351443, 0, 1, 0.07058824, 1,
-0.3965681, -2.051263, -3.33217, 0, 1, 0.07450981, 1,
-0.3897419, 0.8101479, -0.3099526, 0, 1, 0.08235294, 1,
-0.3892526, 0.3575892, -0.09989087, 0, 1, 0.08627451, 1,
-0.3867419, 0.1723907, -2.097897, 0, 1, 0.09411765, 1,
-0.3858298, -0.9031577, -4.011209, 0, 1, 0.1019608, 1,
-0.3794942, 0.6604155, 0.7465437, 0, 1, 0.1058824, 1,
-0.3789503, 0.3153448, -0.858509, 0, 1, 0.1137255, 1,
-0.3772193, -1.69081, -1.816025, 0, 1, 0.1176471, 1,
-0.3697686, 1.296263, -0.8009695, 0, 1, 0.1254902, 1,
-0.3693938, -0.2301345, -2.709291, 0, 1, 0.1294118, 1,
-0.36854, -1.322375, -3.808577, 0, 1, 0.1372549, 1,
-0.3664815, -0.8801185, -1.729507, 0, 1, 0.1411765, 1,
-0.3644151, 0.5003985, -1.723951, 0, 1, 0.1490196, 1,
-0.3621677, -0.646895, -2.932905, 0, 1, 0.1529412, 1,
-0.3594784, -0.3963665, -2.051805, 0, 1, 0.1607843, 1,
-0.3576554, -0.7882392, -2.404848, 0, 1, 0.1647059, 1,
-0.3570144, 0.254004, -1.522336, 0, 1, 0.172549, 1,
-0.3557485, -0.7737438, -1.508953, 0, 1, 0.1764706, 1,
-0.3537529, 0.5582613, 0.09826178, 0, 1, 0.1843137, 1,
-0.3529096, -1.459259, -2.462966, 0, 1, 0.1882353, 1,
-0.3527947, 0.3563731, -0.5805242, 0, 1, 0.1960784, 1,
-0.3478427, -0.4058568, -2.908055, 0, 1, 0.2039216, 1,
-0.3432922, -0.13616, -2.008454, 0, 1, 0.2078431, 1,
-0.3411187, -1.033528, -2.530819, 0, 1, 0.2156863, 1,
-0.3391395, 0.5665576, -1.062711, 0, 1, 0.2196078, 1,
-0.3387134, 0.224508, -1.259457, 0, 1, 0.227451, 1,
-0.3370136, 0.4934249, 0.0876344, 0, 1, 0.2313726, 1,
-0.3367075, 1.403585, -1.624007, 0, 1, 0.2392157, 1,
-0.334581, -0.2661706, -1.794645, 0, 1, 0.2431373, 1,
-0.3342194, -0.6173563, -3.640313, 0, 1, 0.2509804, 1,
-0.3337936, -0.4431318, -2.90248, 0, 1, 0.254902, 1,
-0.3316408, -0.2727585, -0.1774863, 0, 1, 0.2627451, 1,
-0.327792, 1.637279, -1.132878, 0, 1, 0.2666667, 1,
-0.325347, 0.3847053, 0.6584683, 0, 1, 0.2745098, 1,
-0.3227865, -0.8951148, -2.938195, 0, 1, 0.2784314, 1,
-0.3187835, 0.1810859, -1.928133, 0, 1, 0.2862745, 1,
-0.3186978, -2.334644, -2.582144, 0, 1, 0.2901961, 1,
-0.309193, -0.6507419, -2.117353, 0, 1, 0.2980392, 1,
-0.3083903, 1.538505, -0.0902869, 0, 1, 0.3058824, 1,
-0.3067853, -0.003156938, -3.647521, 0, 1, 0.3098039, 1,
-0.3035711, 1.959886, -0.2786363, 0, 1, 0.3176471, 1,
-0.3032905, -1.221057, -2.575448, 0, 1, 0.3215686, 1,
-0.3018978, 0.9396836, -2.258288, 0, 1, 0.3294118, 1,
-0.3002289, -0.02665495, -0.5373025, 0, 1, 0.3333333, 1,
-0.2988127, 2.116989, -0.3210612, 0, 1, 0.3411765, 1,
-0.2986283, 0.9804932, -1.351235, 0, 1, 0.345098, 1,
-0.298201, -1.634242, -3.941854, 0, 1, 0.3529412, 1,
-0.2928745, -1.077334, -3.390257, 0, 1, 0.3568628, 1,
-0.2907639, 0.4907611, 1.087468, 0, 1, 0.3647059, 1,
-0.290169, -0.2895735, -5.296365, 0, 1, 0.3686275, 1,
-0.2832971, -0.1578629, -3.395789, 0, 1, 0.3764706, 1,
-0.2761926, 0.1856608, -1.711776, 0, 1, 0.3803922, 1,
-0.275132, 0.009337123, -1.907674, 0, 1, 0.3882353, 1,
-0.2726715, -1.394291, -3.641549, 0, 1, 0.3921569, 1,
-0.2689331, -1.557496, -2.970725, 0, 1, 0.4, 1,
-0.2680022, 2.177117, 1.210274, 0, 1, 0.4078431, 1,
-0.2633929, 0.4133987, -1.395769, 0, 1, 0.4117647, 1,
-0.2631226, 1.305556, -1.448903, 0, 1, 0.4196078, 1,
-0.2630714, -1.126234, -1.4759, 0, 1, 0.4235294, 1,
-0.2612612, 0.8059785, -1.104079, 0, 1, 0.4313726, 1,
-0.261043, -0.8939108, -2.064661, 0, 1, 0.4352941, 1,
-0.2606628, 0.8112897, -0.05500271, 0, 1, 0.4431373, 1,
-0.2577094, 0.1505441, -3.104926, 0, 1, 0.4470588, 1,
-0.2523674, -0.3723644, -1.090613, 0, 1, 0.454902, 1,
-0.2484091, 0.0893027, 0.4672801, 0, 1, 0.4588235, 1,
-0.2470072, 2.543938, -0.04095222, 0, 1, 0.4666667, 1,
-0.2461698, 0.06700721, -1.842805, 0, 1, 0.4705882, 1,
-0.2369508, 0.7922341, -0.7017695, 0, 1, 0.4784314, 1,
-0.235875, 0.5355377, -1.00849, 0, 1, 0.4823529, 1,
-0.2336451, 1.990536, -0.3996455, 0, 1, 0.4901961, 1,
-0.2305048, 1.94675, -1.477679, 0, 1, 0.4941176, 1,
-0.2297549, 0.5006519, -1.184665, 0, 1, 0.5019608, 1,
-0.2292271, -1.056717, -2.52697, 0, 1, 0.509804, 1,
-0.228057, 0.6016463, 1.237954, 0, 1, 0.5137255, 1,
-0.2258538, -2.131531, -2.534768, 0, 1, 0.5215687, 1,
-0.2236199, -1.338873, -5.076993, 0, 1, 0.5254902, 1,
-0.2198203, -0.3318108, -3.938628, 0, 1, 0.5333334, 1,
-0.1984123, 0.6376808, -0.6066612, 0, 1, 0.5372549, 1,
-0.1969954, -0.478975, -2.626643, 0, 1, 0.5450981, 1,
-0.1960997, 1.309639, 0.2486946, 0, 1, 0.5490196, 1,
-0.1956494, -1.608339, -3.322538, 0, 1, 0.5568628, 1,
-0.1905032, 1.060315, 0.742739, 0, 1, 0.5607843, 1,
-0.190361, -1.039729, -2.458917, 0, 1, 0.5686275, 1,
-0.1883228, 1.182481, -0.4603256, 0, 1, 0.572549, 1,
-0.1851615, -0.2871327, -3.187152, 0, 1, 0.5803922, 1,
-0.1805142, 1.010245, 1.324746, 0, 1, 0.5843138, 1,
-0.1783517, -2.057373, -2.453669, 0, 1, 0.5921569, 1,
-0.1770494, 0.563328, 0.5633801, 0, 1, 0.5960785, 1,
-0.1736065, -0.8991166, -3.473059, 0, 1, 0.6039216, 1,
-0.1726324, -0.2500173, -0.6491887, 0, 1, 0.6117647, 1,
-0.1672209, -0.5466973, -2.007096, 0, 1, 0.6156863, 1,
-0.1663442, 2.281032, 2.177738, 0, 1, 0.6235294, 1,
-0.1639145, 1.331664, -0.7361646, 0, 1, 0.627451, 1,
-0.1583644, -0.5824289, -4.350956, 0, 1, 0.6352941, 1,
-0.1534598, -1.607655, -3.149253, 0, 1, 0.6392157, 1,
-0.1497808, 1.262812, 1.741714, 0, 1, 0.6470588, 1,
-0.1492877, 1.340213, -0.08015557, 0, 1, 0.6509804, 1,
-0.1468716, 0.2195459, -0.6014149, 0, 1, 0.6588235, 1,
-0.1461502, -0.657109, -1.350266, 0, 1, 0.6627451, 1,
-0.1460838, 0.7931434, -1.009524, 0, 1, 0.6705883, 1,
-0.1421751, -0.3849111, -5.415919, 0, 1, 0.6745098, 1,
-0.1411039, 0.1988433, -0.1582346, 0, 1, 0.682353, 1,
-0.1407147, 0.592643, -0.7035857, 0, 1, 0.6862745, 1,
-0.1390147, -0.5408767, -1.919535, 0, 1, 0.6941177, 1,
-0.1386249, 1.275054, -0.8634208, 0, 1, 0.7019608, 1,
-0.1360662, -1.052525, -4.152009, 0, 1, 0.7058824, 1,
-0.1347939, 0.3771273, -0.7118109, 0, 1, 0.7137255, 1,
-0.132899, 1.128896, -0.5547617, 0, 1, 0.7176471, 1,
-0.1295321, 1.459978, -1.94697, 0, 1, 0.7254902, 1,
-0.1226392, 0.8385808, 0.7842835, 0, 1, 0.7294118, 1,
-0.1216259, 1.597976, 1.517357, 0, 1, 0.7372549, 1,
-0.1089095, -1.96427, -2.266851, 0, 1, 0.7411765, 1,
-0.1060039, -0.5001519, -2.101405, 0, 1, 0.7490196, 1,
-0.1046835, -0.7543456, -2.89406, 0, 1, 0.7529412, 1,
-0.1022012, 0.1690427, -1.957179, 0, 1, 0.7607843, 1,
-0.1014427, 1.712216, 0.6326895, 0, 1, 0.7647059, 1,
-0.09981847, -0.05091714, -1.408123, 0, 1, 0.772549, 1,
-0.09685022, 0.8881016, -0.4485889, 0, 1, 0.7764706, 1,
-0.09645302, 0.4965659, 1.199462, 0, 1, 0.7843137, 1,
-0.08497819, -0.3236476, -2.691864, 0, 1, 0.7882353, 1,
-0.08404937, 0.7298555, -0.5372508, 0, 1, 0.7960784, 1,
-0.08222906, 0.4522512, -1.145019, 0, 1, 0.8039216, 1,
-0.0796619, 0.3941882, 0.3731042, 0, 1, 0.8078431, 1,
-0.07839471, -0.3830276, -2.476144, 0, 1, 0.8156863, 1,
-0.07836978, -0.5207213, -3.156893, 0, 1, 0.8196079, 1,
-0.06295568, -0.9102414, -3.400026, 0, 1, 0.827451, 1,
-0.06254824, 0.6130118, -0.2134007, 0, 1, 0.8313726, 1,
-0.06147578, -0.5733599, -1.873904, 0, 1, 0.8392157, 1,
-0.05749803, 0.4353353, 0.5482566, 0, 1, 0.8431373, 1,
-0.05266031, -0.3692389, -2.059231, 0, 1, 0.8509804, 1,
-0.05126082, -0.03495087, -3.436619, 0, 1, 0.854902, 1,
-0.04882017, -0.0439372, -4.426351, 0, 1, 0.8627451, 1,
-0.04787032, -0.7168117, -2.855746, 0, 1, 0.8666667, 1,
-0.0421235, 0.6388739, -1.30052, 0, 1, 0.8745098, 1,
-0.04164081, 0.8974899, 0.711313, 0, 1, 0.8784314, 1,
-0.04089172, -0.5115958, -2.106426, 0, 1, 0.8862745, 1,
-0.03745138, 0.4750623, 0.3698055, 0, 1, 0.8901961, 1,
-0.03437198, -0.9182201, -2.929294, 0, 1, 0.8980392, 1,
-0.03433813, -1.092264, -4.501491, 0, 1, 0.9058824, 1,
-0.0333495, 0.2378606, -0.5040967, 0, 1, 0.9098039, 1,
-0.03050391, 0.8515355, 0.8441995, 0, 1, 0.9176471, 1,
-0.02969898, -1.316588, -2.90813, 0, 1, 0.9215686, 1,
-0.02677323, -1.137154, -3.231319, 0, 1, 0.9294118, 1,
-0.02667519, -1.58326, -4.207752, 0, 1, 0.9333333, 1,
-0.02429489, 0.9550667, -0.9564331, 0, 1, 0.9411765, 1,
-0.02224226, -2.206775, -0.9665065, 0, 1, 0.945098, 1,
-0.01831402, 0.06785255, 0.02902083, 0, 1, 0.9529412, 1,
-0.01688281, -0.6964018, -2.983129, 0, 1, 0.9568627, 1,
-0.01640042, -0.3386345, -2.867689, 0, 1, 0.9647059, 1,
-0.01621972, -0.9135443, -2.655187, 0, 1, 0.9686275, 1,
-0.01445413, -0.008671649, -1.392629, 0, 1, 0.9764706, 1,
-0.01394651, 2.527333, 1.621226, 0, 1, 0.9803922, 1,
-0.009245794, 1.000749, -1.568653, 0, 1, 0.9882353, 1,
-0.0006540919, 0.2015709, -0.8230488, 0, 1, 0.9921569, 1,
0.0004358914, 0.08832344, -0.3903413, 0, 1, 1, 1,
0.007915736, 0.1523522, 0.7285843, 0, 0.9921569, 1, 1,
0.008251741, 0.2297296, -2.293014, 0, 0.9882353, 1, 1,
0.008964913, 0.2320385, 0.1254033, 0, 0.9803922, 1, 1,
0.01760979, 1.926014, -0.8934932, 0, 0.9764706, 1, 1,
0.02237143, -0.7402341, 2.963485, 0, 0.9686275, 1, 1,
0.02288055, -1.284419, 3.143926, 0, 0.9647059, 1, 1,
0.02605337, 0.9707572, -0.975541, 0, 0.9568627, 1, 1,
0.02876613, 0.02249897, 1.704905, 0, 0.9529412, 1, 1,
0.02992971, -0.8960644, 2.794272, 0, 0.945098, 1, 1,
0.0315338, 2.096378, 0.433725, 0, 0.9411765, 1, 1,
0.03267663, 0.2725315, -0.5266502, 0, 0.9333333, 1, 1,
0.03606466, -1.58124, 5.009894, 0, 0.9294118, 1, 1,
0.03733568, -0.1410345, 3.848883, 0, 0.9215686, 1, 1,
0.03965317, 0.2916835, 0.2746459, 0, 0.9176471, 1, 1,
0.04123574, 0.8230307, 2.300723, 0, 0.9098039, 1, 1,
0.04618734, -0.6923773, 5.538892, 0, 0.9058824, 1, 1,
0.04742483, 0.8038779, 0.5457189, 0, 0.8980392, 1, 1,
0.05112592, -1.369131, 3.452914, 0, 0.8901961, 1, 1,
0.05222299, 1.4564, 0.4709336, 0, 0.8862745, 1, 1,
0.05886504, 0.2670486, 1.392108, 0, 0.8784314, 1, 1,
0.06227736, 1.291555, 0.7508184, 0, 0.8745098, 1, 1,
0.06288575, -0.2618321, 2.55227, 0, 0.8666667, 1, 1,
0.06321978, -0.4667307, 2.866727, 0, 0.8627451, 1, 1,
0.06399427, -2.917038, 1.844728, 0, 0.854902, 1, 1,
0.06538643, -0.04300833, 1.92086, 0, 0.8509804, 1, 1,
0.06655422, -1.57349, 4.459177, 0, 0.8431373, 1, 1,
0.06781869, -0.1265285, 0.6679405, 0, 0.8392157, 1, 1,
0.07121538, -0.948672, 1.380363, 0, 0.8313726, 1, 1,
0.07498583, 0.009749, 0.05757359, 0, 0.827451, 1, 1,
0.07535037, -0.4781172, 1.532488, 0, 0.8196079, 1, 1,
0.08385625, 0.8727564, 0.106669, 0, 0.8156863, 1, 1,
0.08501446, -0.2182993, 2.678275, 0, 0.8078431, 1, 1,
0.08575389, 0.548246, -0.62992, 0, 0.8039216, 1, 1,
0.0859827, 0.1092894, 0.8175566, 0, 0.7960784, 1, 1,
0.08759212, 0.3964855, 0.6016425, 0, 0.7882353, 1, 1,
0.0886659, 1.645276, -1.34517, 0, 0.7843137, 1, 1,
0.09210966, 0.2659126, 1.032089, 0, 0.7764706, 1, 1,
0.09426357, 0.5248194, 2.201476, 0, 0.772549, 1, 1,
0.09702899, 0.4452274, 1.994143, 0, 0.7647059, 1, 1,
0.09798804, 0.1758249, 1.937459, 0, 0.7607843, 1, 1,
0.1006441, -0.4086325, 4.075992, 0, 0.7529412, 1, 1,
0.1072036, -1.686904, 3.451271, 0, 0.7490196, 1, 1,
0.1083127, 1.140136, 0.7757115, 0, 0.7411765, 1, 1,
0.1083689, -0.4693376, 2.215003, 0, 0.7372549, 1, 1,
0.1085562, 0.4444187, 0.8817533, 0, 0.7294118, 1, 1,
0.1101708, 1.065814, 1.135614, 0, 0.7254902, 1, 1,
0.1128062, -0.9797968, 1.895803, 0, 0.7176471, 1, 1,
0.1132537, -0.003301437, 1.127802, 0, 0.7137255, 1, 1,
0.1134674, 2.100458, 0.8155369, 0, 0.7058824, 1, 1,
0.1148136, 0.95595, -1.351711, 0, 0.6980392, 1, 1,
0.1185196, -0.3017437, 2.265926, 0, 0.6941177, 1, 1,
0.1209845, -0.5218546, 2.851859, 0, 0.6862745, 1, 1,
0.1219473, -1.394424, 2.186748, 0, 0.682353, 1, 1,
0.1264156, 0.2724383, -1.066267, 0, 0.6745098, 1, 1,
0.1282347, 0.8569464, -0.2975831, 0, 0.6705883, 1, 1,
0.131516, -0.4632239, 3.859856, 0, 0.6627451, 1, 1,
0.1373856, 1.505279, -0.2562559, 0, 0.6588235, 1, 1,
0.1381628, 0.9354144, 1.692974, 0, 0.6509804, 1, 1,
0.1388108, 0.4089201, 0.9605829, 0, 0.6470588, 1, 1,
0.1403174, -1.508695, 3.505427, 0, 0.6392157, 1, 1,
0.1412715, -0.7465579, 2.320112, 0, 0.6352941, 1, 1,
0.1473738, -0.2838714, 2.178859, 0, 0.627451, 1, 1,
0.147887, -1.303107, 3.811199, 0, 0.6235294, 1, 1,
0.1564646, -0.3414327, 0.8075284, 0, 0.6156863, 1, 1,
0.1609025, -0.9566824, 2.771752, 0, 0.6117647, 1, 1,
0.1633268, -0.5457105, 1.871482, 0, 0.6039216, 1, 1,
0.1667149, 0.190022, 1.833714, 0, 0.5960785, 1, 1,
0.1709162, 0.7420003, -1.002249, 0, 0.5921569, 1, 1,
0.1736295, -1.243732, 2.001827, 0, 0.5843138, 1, 1,
0.1784908, 0.09880511, 2.41624, 0, 0.5803922, 1, 1,
0.178999, -0.2581395, 3.871777, 0, 0.572549, 1, 1,
0.1796204, 1.583083, 0.4310723, 0, 0.5686275, 1, 1,
0.1809373, 0.06769309, 1.212148, 0, 0.5607843, 1, 1,
0.1818642, -0.02629134, 0.1715631, 0, 0.5568628, 1, 1,
0.1842403, -0.365184, 3.328046, 0, 0.5490196, 1, 1,
0.191433, 0.2624833, -0.9533045, 0, 0.5450981, 1, 1,
0.1925465, -1.346398, 3.296737, 0, 0.5372549, 1, 1,
0.1936136, -2.055007, 3.631307, 0, 0.5333334, 1, 1,
0.1942831, -0.07310417, 0.8388643, 0, 0.5254902, 1, 1,
0.1948964, -1.28749, 2.860389, 0, 0.5215687, 1, 1,
0.1965876, -0.5186175, 2.858657, 0, 0.5137255, 1, 1,
0.20081, -2.281405, 3.775973, 0, 0.509804, 1, 1,
0.2058999, -0.3448551, 1.866598, 0, 0.5019608, 1, 1,
0.2101674, -0.6303639, 1.873779, 0, 0.4941176, 1, 1,
0.2105857, 0.6850457, 0.7224478, 0, 0.4901961, 1, 1,
0.2123798, 0.6041521, 1.412036, 0, 0.4823529, 1, 1,
0.2188208, -0.5145182, 3.025381, 0, 0.4784314, 1, 1,
0.225458, -0.4634076, 2.2265, 0, 0.4705882, 1, 1,
0.2289217, 0.7265778, 0.9315533, 0, 0.4666667, 1, 1,
0.2324392, 0.08417173, 0.9632199, 0, 0.4588235, 1, 1,
0.2347435, -0.8224288, 2.25206, 0, 0.454902, 1, 1,
0.2408284, 1.220923, -1.098132, 0, 0.4470588, 1, 1,
0.2429652, 2.28831, -1.790267, 0, 0.4431373, 1, 1,
0.243484, -0.7486016, 2.87765, 0, 0.4352941, 1, 1,
0.243768, 1.083133, 0.2821157, 0, 0.4313726, 1, 1,
0.2458665, -1.276097, 0.9590667, 0, 0.4235294, 1, 1,
0.2469251, -1.449769, 3.150191, 0, 0.4196078, 1, 1,
0.2496119, 0.3218261, 2.10683, 0, 0.4117647, 1, 1,
0.2523047, -0.2275773, 1.404498, 0, 0.4078431, 1, 1,
0.2524486, 0.5896235, -0.947771, 0, 0.4, 1, 1,
0.253285, 0.591432, -1.233108, 0, 0.3921569, 1, 1,
0.2544883, -0.4103024, 2.842848, 0, 0.3882353, 1, 1,
0.2571052, -0.329636, 1.407726, 0, 0.3803922, 1, 1,
0.2580625, -0.4785059, 4.188623, 0, 0.3764706, 1, 1,
0.2675901, -0.5741823, 1.875447, 0, 0.3686275, 1, 1,
0.2691394, -0.1523682, 0.9761747, 0, 0.3647059, 1, 1,
0.2700251, -0.1450497, 1.966691, 0, 0.3568628, 1, 1,
0.2761383, 0.2833152, 1.056242, 0, 0.3529412, 1, 1,
0.2803219, -0.345364, 4.088086, 0, 0.345098, 1, 1,
0.2883245, 0.8091561, 0.4246908, 0, 0.3411765, 1, 1,
0.2904688, -0.9096763, 2.622867, 0, 0.3333333, 1, 1,
0.291924, 0.6266474, 0.1211256, 0, 0.3294118, 1, 1,
0.2929784, 0.8790451, 1.806116, 0, 0.3215686, 1, 1,
0.2979199, -0.9489861, 1.939034, 0, 0.3176471, 1, 1,
0.2979894, -1.297958, 2.444048, 0, 0.3098039, 1, 1,
0.2982966, -2.733923, 0.0110861, 0, 0.3058824, 1, 1,
0.2984585, 0.358512, 0.159502, 0, 0.2980392, 1, 1,
0.3004238, -1.041688, 2.763229, 0, 0.2901961, 1, 1,
0.3015091, 0.564889, 0.02691724, 0, 0.2862745, 1, 1,
0.3028716, 0.1923606, 0.9155263, 0, 0.2784314, 1, 1,
0.3058338, -0.7829872, 3.241023, 0, 0.2745098, 1, 1,
0.3142339, 0.01367921, 3.083672, 0, 0.2666667, 1, 1,
0.3182735, 0.5136586, 1.451546, 0, 0.2627451, 1, 1,
0.3208144, -0.8332385, 2.942512, 0, 0.254902, 1, 1,
0.3217988, -0.007183903, 3.267227, 0, 0.2509804, 1, 1,
0.3224986, -0.6700539, 2.546047, 0, 0.2431373, 1, 1,
0.3225689, -1.001752, 2.031972, 0, 0.2392157, 1, 1,
0.3241924, 0.9288005, 0.7266276, 0, 0.2313726, 1, 1,
0.324303, -0.8005997, 4.096196, 0, 0.227451, 1, 1,
0.328063, 0.750163, 0.5898073, 0, 0.2196078, 1, 1,
0.3292545, 0.9945189, -0.2745786, 0, 0.2156863, 1, 1,
0.3293125, -0.5323988, 2.83555, 0, 0.2078431, 1, 1,
0.3305695, -0.3366401, 2.515664, 0, 0.2039216, 1, 1,
0.3311815, 0.3424462, -0.262065, 0, 0.1960784, 1, 1,
0.3328079, -3.595713, 4.642352, 0, 0.1882353, 1, 1,
0.3347863, 1.606544, 1.721756, 0, 0.1843137, 1, 1,
0.3375917, -0.4378387, 2.234371, 0, 0.1764706, 1, 1,
0.3389831, -0.2009721, 1.365402, 0, 0.172549, 1, 1,
0.3422367, -0.09885326, 0.1364105, 0, 0.1647059, 1, 1,
0.3428471, 0.8317353, -0.4976846, 0, 0.1607843, 1, 1,
0.3460818, 1.039041, 0.3667509, 0, 0.1529412, 1, 1,
0.3495862, 0.9358065, -0.2314043, 0, 0.1490196, 1, 1,
0.3544265, 0.08638266, 1.017727, 0, 0.1411765, 1, 1,
0.3590061, 0.8276143, -0.8113472, 0, 0.1372549, 1, 1,
0.3595301, -0.458462, 5.254175, 0, 0.1294118, 1, 1,
0.3620844, 0.3598527, 0.2504563, 0, 0.1254902, 1, 1,
0.3650765, 1.454059, -0.981499, 0, 0.1176471, 1, 1,
0.3658782, -1.424626, 1.309111, 0, 0.1137255, 1, 1,
0.3662698, -0.9619251, 3.268659, 0, 0.1058824, 1, 1,
0.371544, -0.230046, 2.746175, 0, 0.09803922, 1, 1,
0.3814438, -0.07588495, 2.16367, 0, 0.09411765, 1, 1,
0.3817133, -1.242898, 2.807464, 0, 0.08627451, 1, 1,
0.3825063, -0.7438502, 2.721255, 0, 0.08235294, 1, 1,
0.3830517, 0.5155051, 1.22517, 0, 0.07450981, 1, 1,
0.3850044, 1.654269, -2.038182, 0, 0.07058824, 1, 1,
0.3912509, 0.8985977, 1.822665, 0, 0.0627451, 1, 1,
0.3927948, -0.5567155, 2.405658, 0, 0.05882353, 1, 1,
0.3949025, -0.9764546, 2.964019, 0, 0.05098039, 1, 1,
0.3974503, -1.083146, 2.831354, 0, 0.04705882, 1, 1,
0.3990488, -0.8928924, 2.804688, 0, 0.03921569, 1, 1,
0.4014721, 0.4488893, 1.472439, 0, 0.03529412, 1, 1,
0.4076043, 2.034654, 1.377119, 0, 0.02745098, 1, 1,
0.409874, -1.942959, 2.348624, 0, 0.02352941, 1, 1,
0.410027, 1.333656, 0.5488769, 0, 0.01568628, 1, 1,
0.414204, -0.3604809, 2.253168, 0, 0.01176471, 1, 1,
0.418379, 1.299993, 0.5608351, 0, 0.003921569, 1, 1,
0.4188642, 1.007919, 1.903487, 0.003921569, 0, 1, 1,
0.4237976, -0.6772253, -0.6542394, 0.007843138, 0, 1, 1,
0.4240912, 0.2125649, 0.5812116, 0.01568628, 0, 1, 1,
0.4277458, 1.071741, -0.07806213, 0.01960784, 0, 1, 1,
0.428318, -0.5819221, 1.406233, 0.02745098, 0, 1, 1,
0.4290455, -0.9672866, 3.123442, 0.03137255, 0, 1, 1,
0.4387746, -0.2126386, 1.013807, 0.03921569, 0, 1, 1,
0.4393797, -0.5749062, 2.660908, 0.04313726, 0, 1, 1,
0.4395551, 0.3150443, -0.00456188, 0.05098039, 0, 1, 1,
0.4413218, 0.8030916, 1.643681, 0.05490196, 0, 1, 1,
0.4414212, -0.8952945, 3.307374, 0.0627451, 0, 1, 1,
0.4418089, 2.617327, -0.8262531, 0.06666667, 0, 1, 1,
0.4418681, -1.10068, 2.798347, 0.07450981, 0, 1, 1,
0.4434549, 2.149419, -1.71064, 0.07843138, 0, 1, 1,
0.4440594, -0.844411, 2.78288, 0.08627451, 0, 1, 1,
0.4449786, 0.4711086, 1.722495, 0.09019608, 0, 1, 1,
0.4489585, -2.006987, 2.773423, 0.09803922, 0, 1, 1,
0.4502852, -1.353595, 3.686917, 0.1058824, 0, 1, 1,
0.4529716, -0.1078391, 2.035116, 0.1098039, 0, 1, 1,
0.4536072, 0.8803293, 0.857821, 0.1176471, 0, 1, 1,
0.4590678, 0.6981658, 0.4075281, 0.1215686, 0, 1, 1,
0.4619645, -0.006900337, 2.691292, 0.1294118, 0, 1, 1,
0.4629261, 1.578786, 0.7224946, 0.1333333, 0, 1, 1,
0.467338, 0.02378049, 0.9578562, 0.1411765, 0, 1, 1,
0.4679238, 1.289783, 1.431815, 0.145098, 0, 1, 1,
0.4685101, -0.08496871, 1.321301, 0.1529412, 0, 1, 1,
0.4717853, -0.1100813, 1.945296, 0.1568628, 0, 1, 1,
0.4732389, -0.6350714, 1.17756, 0.1647059, 0, 1, 1,
0.4753551, 0.8415617, 1.096504, 0.1686275, 0, 1, 1,
0.476264, 0.487924, 1.548206, 0.1764706, 0, 1, 1,
0.476569, -1.117577, 3.31009, 0.1803922, 0, 1, 1,
0.4792567, 1.524083, 0.9662556, 0.1882353, 0, 1, 1,
0.4795612, -0.9874591, 2.548064, 0.1921569, 0, 1, 1,
0.4804879, 0.07529422, 1.67477, 0.2, 0, 1, 1,
0.4819604, 0.658988, 1.029534, 0.2078431, 0, 1, 1,
0.4890722, 0.6076608, 3.006913, 0.2117647, 0, 1, 1,
0.4929693, 0.02922809, 0.2304867, 0.2196078, 0, 1, 1,
0.5007529, -0.5526578, 2.668246, 0.2235294, 0, 1, 1,
0.5039945, -0.1770746, 0.8750907, 0.2313726, 0, 1, 1,
0.5056176, -0.3883967, 4.78586, 0.2352941, 0, 1, 1,
0.5099866, 0.4508201, 1.530773, 0.2431373, 0, 1, 1,
0.5103344, -0.1011253, 1.527775, 0.2470588, 0, 1, 1,
0.5107828, 0.7118873, 0.1937982, 0.254902, 0, 1, 1,
0.510795, -0.9736307, 1.78022, 0.2588235, 0, 1, 1,
0.515007, 3.055889, 0.1126354, 0.2666667, 0, 1, 1,
0.5151213, 1.024042, 0.4887986, 0.2705882, 0, 1, 1,
0.5167336, -0.3998, 2.73404, 0.2784314, 0, 1, 1,
0.5228173, 0.7186782, 2.021595, 0.282353, 0, 1, 1,
0.5252642, 0.1127775, 1.215397, 0.2901961, 0, 1, 1,
0.5379497, 1.435457, 0.09769691, 0.2941177, 0, 1, 1,
0.5395105, 1.482168, 0.8391134, 0.3019608, 0, 1, 1,
0.5518036, 0.2641577, 0.3554325, 0.3098039, 0, 1, 1,
0.5538238, -0.5528874, 3.833701, 0.3137255, 0, 1, 1,
0.5567994, -0.8419495, 1.765601, 0.3215686, 0, 1, 1,
0.5573946, 0.8503948, 1.407849, 0.3254902, 0, 1, 1,
0.5577438, 0.167549, 0.971145, 0.3333333, 0, 1, 1,
0.559698, 0.5527265, 2.897116, 0.3372549, 0, 1, 1,
0.5622922, 0.1841788, 0.604219, 0.345098, 0, 1, 1,
0.5624379, -0.9132591, 2.712713, 0.3490196, 0, 1, 1,
0.5644628, 1.195855, 0.8543774, 0.3568628, 0, 1, 1,
0.5655914, 2.389059, 0.3239245, 0.3607843, 0, 1, 1,
0.5702161, 0.2904174, 1.346205, 0.3686275, 0, 1, 1,
0.5756932, 0.6146294, 2.446949, 0.372549, 0, 1, 1,
0.5800086, 0.7371002, 1.433759, 0.3803922, 0, 1, 1,
0.5824137, 0.7468153, 0.5760655, 0.3843137, 0, 1, 1,
0.5824953, 0.4398045, 1.385986, 0.3921569, 0, 1, 1,
0.5862514, -0.6589336, 3.987096, 0.3960784, 0, 1, 1,
0.5867692, 1.841869, -0.1044586, 0.4039216, 0, 1, 1,
0.5888623, -0.2504182, 2.284175, 0.4117647, 0, 1, 1,
0.5890228, 0.5193812, 1.375304, 0.4156863, 0, 1, 1,
0.5970537, -1.752421, 1.407812, 0.4235294, 0, 1, 1,
0.6003451, 0.05499956, 1.567967, 0.427451, 0, 1, 1,
0.6009564, -1.20298, 1.447484, 0.4352941, 0, 1, 1,
0.6063154, 0.07808025, -0.01878381, 0.4392157, 0, 1, 1,
0.6066989, -0.6665511, 2.162144, 0.4470588, 0, 1, 1,
0.6099676, 0.3480643, 2.583068, 0.4509804, 0, 1, 1,
0.6166925, 0.2675227, 2.318865, 0.4588235, 0, 1, 1,
0.6180589, 0.5498418, 0.4026075, 0.4627451, 0, 1, 1,
0.6196506, 0.7918922, 0.7287599, 0.4705882, 0, 1, 1,
0.6218901, -0.3488228, 0.1513526, 0.4745098, 0, 1, 1,
0.622749, -0.2713893, 3.239203, 0.4823529, 0, 1, 1,
0.6237267, -0.1555463, 1.436747, 0.4862745, 0, 1, 1,
0.6244414, 1.282531, 1.077874, 0.4941176, 0, 1, 1,
0.6268699, -2.629743, 3.404096, 0.5019608, 0, 1, 1,
0.6322899, 1.021441, 0.5579324, 0.5058824, 0, 1, 1,
0.6354023, -0.006834089, 1.949676, 0.5137255, 0, 1, 1,
0.6365567, 0.4138719, 0.5863937, 0.5176471, 0, 1, 1,
0.6477628, 0.188524, 1.436312, 0.5254902, 0, 1, 1,
0.6488274, 0.744831, 0.000439348, 0.5294118, 0, 1, 1,
0.651598, 0.06207625, 0.6356093, 0.5372549, 0, 1, 1,
0.666139, 1.228907, 0.2286303, 0.5411765, 0, 1, 1,
0.6704785, 1.191146, -0.7468307, 0.5490196, 0, 1, 1,
0.6712496, -1.15787, 3.438379, 0.5529412, 0, 1, 1,
0.6713158, -1.241556, 2.298588, 0.5607843, 0, 1, 1,
0.672316, -0.144345, 2.6123, 0.5647059, 0, 1, 1,
0.6757824, -0.8605042, 2.253528, 0.572549, 0, 1, 1,
0.6812505, 0.3874537, 2.451746, 0.5764706, 0, 1, 1,
0.6822681, -1.205752, 2.947553, 0.5843138, 0, 1, 1,
0.6841853, -1.151576, 2.899432, 0.5882353, 0, 1, 1,
0.6863114, 0.0576131, 0.8183622, 0.5960785, 0, 1, 1,
0.6864172, 0.2175595, 0.8982196, 0.6039216, 0, 1, 1,
0.6881308, -0.5338493, 1.107383, 0.6078432, 0, 1, 1,
0.6886171, 0.4629836, -0.03692401, 0.6156863, 0, 1, 1,
0.6903706, 1.447023, -2.510364, 0.6196079, 0, 1, 1,
0.692291, 0.3185684, 2.12694, 0.627451, 0, 1, 1,
0.6939375, 0.3871314, 0.5470394, 0.6313726, 0, 1, 1,
0.6955985, -1.881557, 2.66701, 0.6392157, 0, 1, 1,
0.6985074, 1.360823, -1.603095, 0.6431373, 0, 1, 1,
0.6990978, -0.9298363, 4.226362, 0.6509804, 0, 1, 1,
0.7015228, -1.130918, 2.679076, 0.654902, 0, 1, 1,
0.7015655, 0.4143185, -0.009578922, 0.6627451, 0, 1, 1,
0.7025492, -1.917098, 2.219021, 0.6666667, 0, 1, 1,
0.7055153, -0.4945116, 2.713965, 0.6745098, 0, 1, 1,
0.7098898, -0.1210684, 2.732613, 0.6784314, 0, 1, 1,
0.7118897, -1.488447, 2.944572, 0.6862745, 0, 1, 1,
0.7141971, -0.792239, 2.259203, 0.6901961, 0, 1, 1,
0.7195624, 0.1500801, 0.2180692, 0.6980392, 0, 1, 1,
0.7218519, -0.2331336, 2.275101, 0.7058824, 0, 1, 1,
0.724771, 1.734024, -0.6764842, 0.7098039, 0, 1, 1,
0.7320402, 0.5693245, 0.85662, 0.7176471, 0, 1, 1,
0.7441626, -0.8729273, 1.864913, 0.7215686, 0, 1, 1,
0.7451804, 0.5495468, 1.124805, 0.7294118, 0, 1, 1,
0.7452437, -0.4776319, 1.295746, 0.7333333, 0, 1, 1,
0.7455433, -1.131217, 2.776368, 0.7411765, 0, 1, 1,
0.7461586, 1.19331, -2.672388, 0.7450981, 0, 1, 1,
0.7486269, 0.9523937, 1.136623, 0.7529412, 0, 1, 1,
0.7535423, 1.633046, 0.1623485, 0.7568628, 0, 1, 1,
0.7640738, 0.4340362, 0.6267565, 0.7647059, 0, 1, 1,
0.7755363, -1.033754, 2.549762, 0.7686275, 0, 1, 1,
0.781622, -2.662999, 4.453284, 0.7764706, 0, 1, 1,
0.7865806, 0.1928272, 0.5562317, 0.7803922, 0, 1, 1,
0.7951142, -0.1873138, 2.327296, 0.7882353, 0, 1, 1,
0.8035353, -1.543973, 1.675441, 0.7921569, 0, 1, 1,
0.8061271, -0.6157488, 1.510133, 0.8, 0, 1, 1,
0.8071047, -1.001006, 3.921454, 0.8078431, 0, 1, 1,
0.8074365, 0.9416709, 0.5855095, 0.8117647, 0, 1, 1,
0.8138847, 0.2159643, 2.278903, 0.8196079, 0, 1, 1,
0.8142254, -0.8322358, 3.293596, 0.8235294, 0, 1, 1,
0.8147022, -2.358897, 3.698757, 0.8313726, 0, 1, 1,
0.8154938, -0.5846879, 1.049267, 0.8352941, 0, 1, 1,
0.8226808, -0.7347487, 3.09944, 0.8431373, 0, 1, 1,
0.8243081, 0.882821, -0.5311017, 0.8470588, 0, 1, 1,
0.8261312, 0.09732293, 1.179394, 0.854902, 0, 1, 1,
0.8347896, 0.6870098, 0.9749269, 0.8588235, 0, 1, 1,
0.8460963, -0.2093785, 3.321904, 0.8666667, 0, 1, 1,
0.8464197, -0.9000149, 4.616426, 0.8705882, 0, 1, 1,
0.8472956, -0.1383922, 1.743734, 0.8784314, 0, 1, 1,
0.8490645, -0.1035729, 0.6408111, 0.8823529, 0, 1, 1,
0.8562165, -1.53223, 3.788099, 0.8901961, 0, 1, 1,
0.858445, -1.550104, 2.989842, 0.8941177, 0, 1, 1,
0.8605279, 0.3890288, -1.251653, 0.9019608, 0, 1, 1,
0.8640454, -0.1491175, 0.1815085, 0.9098039, 0, 1, 1,
0.867713, -0.09752764, 3.746046, 0.9137255, 0, 1, 1,
0.874109, 0.2096475, 0.6505544, 0.9215686, 0, 1, 1,
0.8747751, 0.05919664, 2.342847, 0.9254902, 0, 1, 1,
0.8757719, -0.8102251, 2.131064, 0.9333333, 0, 1, 1,
0.8769395, 0.5092506, 1.550186, 0.9372549, 0, 1, 1,
0.882203, -0.5196654, 0.7100513, 0.945098, 0, 1, 1,
0.8855431, 1.73326, -0.8636512, 0.9490196, 0, 1, 1,
0.8893695, 0.7742182, 1.595548, 0.9568627, 0, 1, 1,
0.891174, -0.7262401, 3.491979, 0.9607843, 0, 1, 1,
0.891942, -0.2109965, 0.5291203, 0.9686275, 0, 1, 1,
0.8951779, 0.01080503, 0.768868, 0.972549, 0, 1, 1,
0.8965892, 0.3177207, -0.008883197, 0.9803922, 0, 1, 1,
0.898732, 0.6527316, 3.832595, 0.9843137, 0, 1, 1,
0.9003493, 0.6292503, 2.80355, 0.9921569, 0, 1, 1,
0.9007463, -3.094124, 4.103601, 0.9960784, 0, 1, 1,
0.9079348, 0.002951885, -0.1297403, 1, 0, 0.9960784, 1,
0.9106377, -1.199847, 1.878279, 1, 0, 0.9882353, 1,
0.9206398, 0.7875133, 1.610484, 1, 0, 0.9843137, 1,
0.9208189, 0.0535164, 2.166782, 1, 0, 0.9764706, 1,
0.9223616, 0.2832244, 1.413572, 1, 0, 0.972549, 1,
0.9250503, 1.15563, 2.143562, 1, 0, 0.9647059, 1,
0.9316302, 0.9436409, 1.23258, 1, 0, 0.9607843, 1,
0.9327208, 0.07148865, 1.829772, 1, 0, 0.9529412, 1,
0.9347328, -1.365057, 1.529797, 1, 0, 0.9490196, 1,
0.9379041, -0.6339274, 1.514907, 1, 0, 0.9411765, 1,
0.9392467, 1.202456, -0.5687178, 1, 0, 0.9372549, 1,
0.9399354, -0.466893, 2.966126, 1, 0, 0.9294118, 1,
0.9403543, -0.04573422, 2.909933, 1, 0, 0.9254902, 1,
0.9438856, -0.4317197, 2.886722, 1, 0, 0.9176471, 1,
0.9475574, -0.2249793, 1.401222, 1, 0, 0.9137255, 1,
0.9484792, -0.7072613, 2.607115, 1, 0, 0.9058824, 1,
0.9540862, -0.07350013, 2.422174, 1, 0, 0.9019608, 1,
0.9584354, -1.027123, 3.612562, 1, 0, 0.8941177, 1,
0.9605196, -0.5691308, 1.389922, 1, 0, 0.8862745, 1,
0.9612864, -0.3588344, 2.760595, 1, 0, 0.8823529, 1,
0.9642204, -0.02495323, 2.548973, 1, 0, 0.8745098, 1,
0.9691155, 1.254879, -0.5254308, 1, 0, 0.8705882, 1,
0.9757379, 0.5147846, 1.635915, 1, 0, 0.8627451, 1,
0.9813972, -0.5243989, 1.875429, 1, 0, 0.8588235, 1,
0.9837875, 0.7063406, 1.617442, 1, 0, 0.8509804, 1,
0.9851245, -2.306268, 3.547898, 1, 0, 0.8470588, 1,
0.9951487, 1.400404, -2.629176, 1, 0, 0.8392157, 1,
0.9960284, -0.2255383, 3.45206, 1, 0, 0.8352941, 1,
1.003486, 1.169161, 1.978466, 1, 0, 0.827451, 1,
1.005831, 2.197118, 0.1157041, 1, 0, 0.8235294, 1,
1.007747, 0.696147, 1.295532, 1, 0, 0.8156863, 1,
1.010785, 1.309781, 1.237373, 1, 0, 0.8117647, 1,
1.021364, 0.4777028, 2.907767, 1, 0, 0.8039216, 1,
1.027009, 1.004117, -0.5070364, 1, 0, 0.7960784, 1,
1.028921, 0.6642962, 0.8016992, 1, 0, 0.7921569, 1,
1.029074, -0.5384129, 2.382706, 1, 0, 0.7843137, 1,
1.031826, 0.245212, 1.223387, 1, 0, 0.7803922, 1,
1.040354, 1.043442, 2.031572, 1, 0, 0.772549, 1,
1.054674, -0.9436384, 3.508512, 1, 0, 0.7686275, 1,
1.058868, 0.05108741, 2.363284, 1, 0, 0.7607843, 1,
1.06751, -1.145459, 2.072403, 1, 0, 0.7568628, 1,
1.071899, -0.6524132, 0.9195186, 1, 0, 0.7490196, 1,
1.075847, 0.07495591, -0.07984237, 1, 0, 0.7450981, 1,
1.0791, -0.05133827, 2.251041, 1, 0, 0.7372549, 1,
1.080375, 0.3391773, -0.4993629, 1, 0, 0.7333333, 1,
1.084003, -1.028604, 2.820981, 1, 0, 0.7254902, 1,
1.091674, 0.1832183, 0.5754982, 1, 0, 0.7215686, 1,
1.102337, -3.317029, 2.254827, 1, 0, 0.7137255, 1,
1.103784, 0.6156324, -0.2004227, 1, 0, 0.7098039, 1,
1.122703, 0.03204382, 2.510546, 1, 0, 0.7019608, 1,
1.125079, -0.3709674, 0.9882292, 1, 0, 0.6941177, 1,
1.126341, -1.146391, 2.167405, 1, 0, 0.6901961, 1,
1.138213, -0.6135251, 1.628623, 1, 0, 0.682353, 1,
1.139418, -0.6224389, 3.226787, 1, 0, 0.6784314, 1,
1.142438, 1.076331, 1.985545, 1, 0, 0.6705883, 1,
1.146129, 0.09300666, 0.2884483, 1, 0, 0.6666667, 1,
1.158755, -2.411032, 3.437871, 1, 0, 0.6588235, 1,
1.161746, 0.952511, 1.637629, 1, 0, 0.654902, 1,
1.169092, -0.5857435, 2.034068, 1, 0, 0.6470588, 1,
1.169949, -0.693877, 2.094194, 1, 0, 0.6431373, 1,
1.17034, -0.5206747, 2.085496, 1, 0, 0.6352941, 1,
1.178852, -1.087751, 1.446349, 1, 0, 0.6313726, 1,
1.184057, -0.4269151, 2.02111, 1, 0, 0.6235294, 1,
1.18488, -1.987374, 4.408517, 1, 0, 0.6196079, 1,
1.189828, -0.5619102, 2.277491, 1, 0, 0.6117647, 1,
1.191426, -0.2273593, 2.019703, 1, 0, 0.6078432, 1,
1.193017, -1.24063, 2.236711, 1, 0, 0.6, 1,
1.211165, -0.5804935, 2.434823, 1, 0, 0.5921569, 1,
1.215378, 0.2970609, 1.022614, 1, 0, 0.5882353, 1,
1.219472, -0.9440501, 4.050536, 1, 0, 0.5803922, 1,
1.234291, 0.5924621, 1.779579, 1, 0, 0.5764706, 1,
1.24018, -0.2965471, 3.049456, 1, 0, 0.5686275, 1,
1.242445, 0.8851993, 1.778769, 1, 0, 0.5647059, 1,
1.265828, -1.619972, 2.295133, 1, 0, 0.5568628, 1,
1.266847, 0.8377634, 0.6252626, 1, 0, 0.5529412, 1,
1.271348, -0.005842435, 2.184202, 1, 0, 0.5450981, 1,
1.290726, -0.4529085, 0.3480931, 1, 0, 0.5411765, 1,
1.303739, 0.2164607, 1.920132, 1, 0, 0.5333334, 1,
1.307504, 2.720481, -0.09312943, 1, 0, 0.5294118, 1,
1.313595, -0.3554894, 1.357083, 1, 0, 0.5215687, 1,
1.316397, -1.707268, 2.944547, 1, 0, 0.5176471, 1,
1.317548, 0.4916241, 0.4204174, 1, 0, 0.509804, 1,
1.320119, -0.1407449, 1.941082, 1, 0, 0.5058824, 1,
1.326359, -1.154458, 1.726604, 1, 0, 0.4980392, 1,
1.329122, -0.2072671, 1.119147, 1, 0, 0.4901961, 1,
1.330524, -0.2894956, 4.263557, 1, 0, 0.4862745, 1,
1.335415, 0.06457262, 2.395922, 1, 0, 0.4784314, 1,
1.34197, 1.088891, 1.776927, 1, 0, 0.4745098, 1,
1.343927, 0.008771938, 1.502102, 1, 0, 0.4666667, 1,
1.344182, 1.878323, 0.8935921, 1, 0, 0.4627451, 1,
1.360255, 0.6053083, 0.4963922, 1, 0, 0.454902, 1,
1.370705, 0.3113305, 1.504045, 1, 0, 0.4509804, 1,
1.377862, 0.7218094, 3.235231, 1, 0, 0.4431373, 1,
1.38404, -1.345097, 2.439886, 1, 0, 0.4392157, 1,
1.386005, 1.284751, -0.2717078, 1, 0, 0.4313726, 1,
1.388161, 1.598244, 1.394098, 1, 0, 0.427451, 1,
1.406609, -0.5486686, 0.629181, 1, 0, 0.4196078, 1,
1.408324, -0.1917017, -0.5975069, 1, 0, 0.4156863, 1,
1.409735, -0.543568, 2.387366, 1, 0, 0.4078431, 1,
1.410455, -1.439989, 2.854478, 1, 0, 0.4039216, 1,
1.436946, -0.1974999, 2.316419, 1, 0, 0.3960784, 1,
1.437935, -0.3300553, -0.2753761, 1, 0, 0.3882353, 1,
1.443223, 0.9653865, -0.05039575, 1, 0, 0.3843137, 1,
1.44514, 1.092674, 0.1446036, 1, 0, 0.3764706, 1,
1.447055, -0.2501644, 2.512921, 1, 0, 0.372549, 1,
1.45156, 0.008139513, 0.4340574, 1, 0, 0.3647059, 1,
1.472951, -1.236568, 2.434348, 1, 0, 0.3607843, 1,
1.480512, -1.337814, 2.854085, 1, 0, 0.3529412, 1,
1.50682, -0.6690013, 1.658637, 1, 0, 0.3490196, 1,
1.508765, 1.243808, -0.7493955, 1, 0, 0.3411765, 1,
1.514354, -1.637589, 3.055944, 1, 0, 0.3372549, 1,
1.523041, -1.137578, 1.071245, 1, 0, 0.3294118, 1,
1.526252, -0.3594979, 1.953878, 1, 0, 0.3254902, 1,
1.52631, -0.9887355, 2.029111, 1, 0, 0.3176471, 1,
1.528625, 0.386894, 1.374472, 1, 0, 0.3137255, 1,
1.528793, 0.3083542, 0.276504, 1, 0, 0.3058824, 1,
1.545356, 0.6612315, 1.056058, 1, 0, 0.2980392, 1,
1.568595, 0.05464607, 1.674899, 1, 0, 0.2941177, 1,
1.569413, -1.040664, 2.199222, 1, 0, 0.2862745, 1,
1.570197, -0.6350355, 2.905482, 1, 0, 0.282353, 1,
1.581946, -0.8362672, 1.13489, 1, 0, 0.2745098, 1,
1.598034, -0.3070143, 1.651157, 1, 0, 0.2705882, 1,
1.643015, -1.165909, 0.648412, 1, 0, 0.2627451, 1,
1.645122, 0.7146997, 1.004927, 1, 0, 0.2588235, 1,
1.645568, 0.4838791, 1.542868, 1, 0, 0.2509804, 1,
1.6622, 1.438991, 2.137657, 1, 0, 0.2470588, 1,
1.677727, -1.972389, 2.439646, 1, 0, 0.2392157, 1,
1.681183, 0.4748403, 0.8060319, 1, 0, 0.2352941, 1,
1.6951, 1.556341, 1.853975, 1, 0, 0.227451, 1,
1.703776, -0.8565509, 2.321058, 1, 0, 0.2235294, 1,
1.705236, 0.2910658, 1.849339, 1, 0, 0.2156863, 1,
1.734628, -0.5290959, 1.044624, 1, 0, 0.2117647, 1,
1.740944, -0.3946083, 3.69827, 1, 0, 0.2039216, 1,
1.785422, 0.6412596, 2.109643, 1, 0, 0.1960784, 1,
1.793502, 1.638837, 0.8130381, 1, 0, 0.1921569, 1,
1.795048, 0.5214647, 2.750926, 1, 0, 0.1843137, 1,
1.814678, -0.5780435, 1.857692, 1, 0, 0.1803922, 1,
1.830576, -0.8406473, 2.01714, 1, 0, 0.172549, 1,
1.842103, -0.1734168, 2.748239, 1, 0, 0.1686275, 1,
1.844574, -1.127078, 3.476367, 1, 0, 0.1607843, 1,
1.864064, 0.6557822, -0.3325919, 1, 0, 0.1568628, 1,
1.865922, -1.019475, 2.484218, 1, 0, 0.1490196, 1,
1.901513, 0.2182561, 1.096641, 1, 0, 0.145098, 1,
1.923791, -0.6405638, 1.659004, 1, 0, 0.1372549, 1,
1.944986, -0.6972637, 2.377039, 1, 0, 0.1333333, 1,
2.048601, 0.7771571, 1.010367, 1, 0, 0.1254902, 1,
2.056345, -0.3310824, 1.248495, 1, 0, 0.1215686, 1,
2.075922, 0.5444668, 1.589234, 1, 0, 0.1137255, 1,
2.076126, -0.901503, 1.701763, 1, 0, 0.1098039, 1,
2.076213, 0.02792981, 0.8333918, 1, 0, 0.1019608, 1,
2.083251, 0.9245363, 1.31754, 1, 0, 0.09411765, 1,
2.093772, 0.2664714, 1.825407, 1, 0, 0.09019608, 1,
2.109524, -0.9992169, 3.954613, 1, 0, 0.08235294, 1,
2.119113, 0.8783022, 1.182323, 1, 0, 0.07843138, 1,
2.120524, 0.04585583, 1.956803, 1, 0, 0.07058824, 1,
2.128683, 0.9860134, 0.5509663, 1, 0, 0.06666667, 1,
2.156322, 1.081961, 1.540439, 1, 0, 0.05882353, 1,
2.175402, 0.2150315, 2.098341, 1, 0, 0.05490196, 1,
2.248556, 0.4313869, 0.2227258, 1, 0, 0.04705882, 1,
2.267741, 1.407868, 0.08008017, 1, 0, 0.04313726, 1,
2.425124, 0.7539535, 1.903583, 1, 0, 0.03529412, 1,
2.45569, -0.5612906, 3.185424, 1, 0, 0.03137255, 1,
2.476718, 0.6120726, 0.08549131, 1, 0, 0.02352941, 1,
2.76666, 0.1293469, 1.783074, 1, 0, 0.01960784, 1,
2.908675, 1.624625, 0.8065916, 1, 0, 0.01176471, 1,
3.103849, -0.2565515, 1.381505, 1, 0, 0.007843138, 1
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
0.2387307, -4.731846, -7.272759, 0, -0.5, 0.5, 0.5,
0.2387307, -4.731846, -7.272759, 1, -0.5, 0.5, 0.5,
0.2387307, -4.731846, -7.272759, 1, 1.5, 0.5, 0.5,
0.2387307, -4.731846, -7.272759, 0, 1.5, 0.5, 0.5
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
-3.597662, -0.2442896, -7.272759, 0, -0.5, 0.5, 0.5,
-3.597662, -0.2442896, -7.272759, 1, -0.5, 0.5, 0.5,
-3.597662, -0.2442896, -7.272759, 1, 1.5, 0.5, 0.5,
-3.597662, -0.2442896, -7.272759, 0, 1.5, 0.5, 0.5
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
-3.597662, -4.731846, 0.06148672, 0, -0.5, 0.5, 0.5,
-3.597662, -4.731846, 0.06148672, 1, -0.5, 0.5, 0.5,
-3.597662, -4.731846, 0.06148672, 1, 1.5, 0.5, 0.5,
-3.597662, -4.731846, 0.06148672, 0, 1.5, 0.5, 0.5
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
-2, -3.696256, -5.580241,
3, -3.696256, -5.580241,
-2, -3.696256, -5.580241,
-2, -3.868855, -5.862328,
-1, -3.696256, -5.580241,
-1, -3.868855, -5.862328,
0, -3.696256, -5.580241,
0, -3.868855, -5.862328,
1, -3.696256, -5.580241,
1, -3.868855, -5.862328,
2, -3.696256, -5.580241,
2, -3.868855, -5.862328,
3, -3.696256, -5.580241,
3, -3.868855, -5.862328
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
-2, -4.214051, -6.4265, 0, -0.5, 0.5, 0.5,
-2, -4.214051, -6.4265, 1, -0.5, 0.5, 0.5,
-2, -4.214051, -6.4265, 1, 1.5, 0.5, 0.5,
-2, -4.214051, -6.4265, 0, 1.5, 0.5, 0.5,
-1, -4.214051, -6.4265, 0, -0.5, 0.5, 0.5,
-1, -4.214051, -6.4265, 1, -0.5, 0.5, 0.5,
-1, -4.214051, -6.4265, 1, 1.5, 0.5, 0.5,
-1, -4.214051, -6.4265, 0, 1.5, 0.5, 0.5,
0, -4.214051, -6.4265, 0, -0.5, 0.5, 0.5,
0, -4.214051, -6.4265, 1, -0.5, 0.5, 0.5,
0, -4.214051, -6.4265, 1, 1.5, 0.5, 0.5,
0, -4.214051, -6.4265, 0, 1.5, 0.5, 0.5,
1, -4.214051, -6.4265, 0, -0.5, 0.5, 0.5,
1, -4.214051, -6.4265, 1, -0.5, 0.5, 0.5,
1, -4.214051, -6.4265, 1, 1.5, 0.5, 0.5,
1, -4.214051, -6.4265, 0, 1.5, 0.5, 0.5,
2, -4.214051, -6.4265, 0, -0.5, 0.5, 0.5,
2, -4.214051, -6.4265, 1, -0.5, 0.5, 0.5,
2, -4.214051, -6.4265, 1, 1.5, 0.5, 0.5,
2, -4.214051, -6.4265, 0, 1.5, 0.5, 0.5,
3, -4.214051, -6.4265, 0, -0.5, 0.5, 0.5,
3, -4.214051, -6.4265, 1, -0.5, 0.5, 0.5,
3, -4.214051, -6.4265, 1, 1.5, 0.5, 0.5,
3, -4.214051, -6.4265, 0, 1.5, 0.5, 0.5
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
-2.712341, -3, -5.580241,
-2.712341, 3, -5.580241,
-2.712341, -3, -5.580241,
-2.859895, -3, -5.862328,
-2.712341, -2, -5.580241,
-2.859895, -2, -5.862328,
-2.712341, -1, -5.580241,
-2.859895, -1, -5.862328,
-2.712341, 0, -5.580241,
-2.859895, 0, -5.862328,
-2.712341, 1, -5.580241,
-2.859895, 1, -5.862328,
-2.712341, 2, -5.580241,
-2.859895, 2, -5.862328,
-2.712341, 3, -5.580241,
-2.859895, 3, -5.862328
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
-3.155002, -3, -6.4265, 0, -0.5, 0.5, 0.5,
-3.155002, -3, -6.4265, 1, -0.5, 0.5, 0.5,
-3.155002, -3, -6.4265, 1, 1.5, 0.5, 0.5,
-3.155002, -3, -6.4265, 0, 1.5, 0.5, 0.5,
-3.155002, -2, -6.4265, 0, -0.5, 0.5, 0.5,
-3.155002, -2, -6.4265, 1, -0.5, 0.5, 0.5,
-3.155002, -2, -6.4265, 1, 1.5, 0.5, 0.5,
-3.155002, -2, -6.4265, 0, 1.5, 0.5, 0.5,
-3.155002, -1, -6.4265, 0, -0.5, 0.5, 0.5,
-3.155002, -1, -6.4265, 1, -0.5, 0.5, 0.5,
-3.155002, -1, -6.4265, 1, 1.5, 0.5, 0.5,
-3.155002, -1, -6.4265, 0, 1.5, 0.5, 0.5,
-3.155002, 0, -6.4265, 0, -0.5, 0.5, 0.5,
-3.155002, 0, -6.4265, 1, -0.5, 0.5, 0.5,
-3.155002, 0, -6.4265, 1, 1.5, 0.5, 0.5,
-3.155002, 0, -6.4265, 0, 1.5, 0.5, 0.5,
-3.155002, 1, -6.4265, 0, -0.5, 0.5, 0.5,
-3.155002, 1, -6.4265, 1, -0.5, 0.5, 0.5,
-3.155002, 1, -6.4265, 1, 1.5, 0.5, 0.5,
-3.155002, 1, -6.4265, 0, 1.5, 0.5, 0.5,
-3.155002, 2, -6.4265, 0, -0.5, 0.5, 0.5,
-3.155002, 2, -6.4265, 1, -0.5, 0.5, 0.5,
-3.155002, 2, -6.4265, 1, 1.5, 0.5, 0.5,
-3.155002, 2, -6.4265, 0, 1.5, 0.5, 0.5,
-3.155002, 3, -6.4265, 0, -0.5, 0.5, 0.5,
-3.155002, 3, -6.4265, 1, -0.5, 0.5, 0.5,
-3.155002, 3, -6.4265, 1, 1.5, 0.5, 0.5,
-3.155002, 3, -6.4265, 0, 1.5, 0.5, 0.5
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
-2.712341, -3.696256, -4,
-2.712341, -3.696256, 4,
-2.712341, -3.696256, -4,
-2.859895, -3.868855, -4,
-2.712341, -3.696256, -2,
-2.859895, -3.868855, -2,
-2.712341, -3.696256, 0,
-2.859895, -3.868855, 0,
-2.712341, -3.696256, 2,
-2.859895, -3.868855, 2,
-2.712341, -3.696256, 4,
-2.859895, -3.868855, 4
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
-3.155002, -4.214051, -4, 0, -0.5, 0.5, 0.5,
-3.155002, -4.214051, -4, 1, -0.5, 0.5, 0.5,
-3.155002, -4.214051, -4, 1, 1.5, 0.5, 0.5,
-3.155002, -4.214051, -4, 0, 1.5, 0.5, 0.5,
-3.155002, -4.214051, -2, 0, -0.5, 0.5, 0.5,
-3.155002, -4.214051, -2, 1, -0.5, 0.5, 0.5,
-3.155002, -4.214051, -2, 1, 1.5, 0.5, 0.5,
-3.155002, -4.214051, -2, 0, 1.5, 0.5, 0.5,
-3.155002, -4.214051, 0, 0, -0.5, 0.5, 0.5,
-3.155002, -4.214051, 0, 1, -0.5, 0.5, 0.5,
-3.155002, -4.214051, 0, 1, 1.5, 0.5, 0.5,
-3.155002, -4.214051, 0, 0, 1.5, 0.5, 0.5,
-3.155002, -4.214051, 2, 0, -0.5, 0.5, 0.5,
-3.155002, -4.214051, 2, 1, -0.5, 0.5, 0.5,
-3.155002, -4.214051, 2, 1, 1.5, 0.5, 0.5,
-3.155002, -4.214051, 2, 0, 1.5, 0.5, 0.5,
-3.155002, -4.214051, 4, 0, -0.5, 0.5, 0.5,
-3.155002, -4.214051, 4, 1, -0.5, 0.5, 0.5,
-3.155002, -4.214051, 4, 1, 1.5, 0.5, 0.5,
-3.155002, -4.214051, 4, 0, 1.5, 0.5, 0.5
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
-2.712341, -3.696256, -5.580241,
-2.712341, 3.207677, -5.580241,
-2.712341, -3.696256, 5.703215,
-2.712341, 3.207677, 5.703215,
-2.712341, -3.696256, -5.580241,
-2.712341, -3.696256, 5.703215,
-2.712341, 3.207677, -5.580241,
-2.712341, 3.207677, 5.703215,
-2.712341, -3.696256, -5.580241,
3.189802, -3.696256, -5.580241,
-2.712341, -3.696256, 5.703215,
3.189802, -3.696256, 5.703215,
-2.712341, 3.207677, -5.580241,
3.189802, 3.207677, -5.580241,
-2.712341, 3.207677, 5.703215,
3.189802, 3.207677, 5.703215,
3.189802, -3.696256, -5.580241,
3.189802, 3.207677, -5.580241,
3.189802, -3.696256, 5.703215,
3.189802, 3.207677, 5.703215,
3.189802, -3.696256, -5.580241,
3.189802, -3.696256, 5.703215,
3.189802, 3.207677, -5.580241,
3.189802, 3.207677, 5.703215
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
var radius = 7.734722;
var distance = 34.41265;
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
mvMatrix.translate( -0.2387307, 0.2442896, -0.06148672 );
mvMatrix.scale( 1.416932, 1.211329, 0.7411677 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.41265);
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

