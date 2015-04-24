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
-3.723076, -1.152533, -1.913787, 1, 0, 0, 1,
-2.852349, -1.321145, -1.312698, 1, 0.007843138, 0, 1,
-2.835163, 0.476925, -2.32262, 1, 0.01176471, 0, 1,
-2.678788, 0.1259807, -2.034758, 1, 0.01960784, 0, 1,
-2.643056, -2.762787, -1.212788, 1, 0.02352941, 0, 1,
-2.551825, -0.5656523, -3.11071, 1, 0.03137255, 0, 1,
-2.539158, -0.5026582, -3.061924, 1, 0.03529412, 0, 1,
-2.400192, -0.7152249, -0.8415703, 1, 0.04313726, 0, 1,
-2.351812, 0.7734923, -0.4694125, 1, 0.04705882, 0, 1,
-2.342747, -0.852917, -2.403176, 1, 0.05490196, 0, 1,
-2.336607, -1.424375, -0.2436661, 1, 0.05882353, 0, 1,
-2.272742, 0.320092, -1.704578, 1, 0.06666667, 0, 1,
-2.268101, -1.384653, -2.323637, 1, 0.07058824, 0, 1,
-2.192967, -0.8723515, -2.824887, 1, 0.07843138, 0, 1,
-2.185588, 1.637346, 0.727153, 1, 0.08235294, 0, 1,
-2.182717, 0.1909865, -2.246349, 1, 0.09019608, 0, 1,
-2.181602, 0.1395313, -1.229033, 1, 0.09411765, 0, 1,
-2.161654, -1.110191, -0.792141, 1, 0.1019608, 0, 1,
-2.145512, 0.2706765, -2.204938, 1, 0.1098039, 0, 1,
-2.136683, -0.7920393, -3.492735, 1, 0.1137255, 0, 1,
-2.119276, 0.1871071, -0.3381486, 1, 0.1215686, 0, 1,
-2.105302, 1.158134, -0.3511046, 1, 0.1254902, 0, 1,
-2.094468, 0.06270777, -1.454439, 1, 0.1333333, 0, 1,
-2.073668, -0.2284597, -1.272414, 1, 0.1372549, 0, 1,
-2.062713, 0.9465098, -0.7014503, 1, 0.145098, 0, 1,
-2.030706, -0.7773858, -2.83046, 1, 0.1490196, 0, 1,
-2.025614, -2.433281, -1.609957, 1, 0.1568628, 0, 1,
-1.994489, -0.1293319, -2.667125, 1, 0.1607843, 0, 1,
-1.979516, 1.353954, -2.331168, 1, 0.1686275, 0, 1,
-1.970833, 0.5126523, -1.158746, 1, 0.172549, 0, 1,
-1.944465, 0.3846639, -2.442082, 1, 0.1803922, 0, 1,
-1.938017, 0.7885212, 0.6964718, 1, 0.1843137, 0, 1,
-1.930629, 0.8523197, -0.4768195, 1, 0.1921569, 0, 1,
-1.906757, 0.7511396, -1.102057, 1, 0.1960784, 0, 1,
-1.88392, -0.4252836, -1.974382, 1, 0.2039216, 0, 1,
-1.875413, 0.01601909, -2.349826, 1, 0.2117647, 0, 1,
-1.861657, -0.5383965, -2.906624, 1, 0.2156863, 0, 1,
-1.855242, -0.2984654, -2.325267, 1, 0.2235294, 0, 1,
-1.844723, 0.233484, -0.07178889, 1, 0.227451, 0, 1,
-1.842171, 1.033337, 0.6226547, 1, 0.2352941, 0, 1,
-1.820334, 0.1979994, -2.345935, 1, 0.2392157, 0, 1,
-1.819331, 1.193725, -0.4070059, 1, 0.2470588, 0, 1,
-1.816487, -0.5488373, -0.6434098, 1, 0.2509804, 0, 1,
-1.791651, -0.7198654, -1.107428, 1, 0.2588235, 0, 1,
-1.788752, -1.746106, -1.78705, 1, 0.2627451, 0, 1,
-1.782545, -1.012305, -2.281939, 1, 0.2705882, 0, 1,
-1.776817, 0.5447976, 2.217228, 1, 0.2745098, 0, 1,
-1.755506, 0.6253037, -0.468577, 1, 0.282353, 0, 1,
-1.734504, -0.4274878, -2.436039, 1, 0.2862745, 0, 1,
-1.731498, 0.483186, -0.6593549, 1, 0.2941177, 0, 1,
-1.725476, 0.1201267, -0.8971738, 1, 0.3019608, 0, 1,
-1.722309, 1.458813, -0.5289025, 1, 0.3058824, 0, 1,
-1.721283, -1.70548, -1.776497, 1, 0.3137255, 0, 1,
-1.707437, -0.1041592, -2.418775, 1, 0.3176471, 0, 1,
-1.696051, -0.1904187, -1.048265, 1, 0.3254902, 0, 1,
-1.679877, 0.5336252, -1.02117, 1, 0.3294118, 0, 1,
-1.671384, 0.1058868, -1.390168, 1, 0.3372549, 0, 1,
-1.668108, 1.438733, -0.8336101, 1, 0.3411765, 0, 1,
-1.664142, 1.346393, -0.620817, 1, 0.3490196, 0, 1,
-1.656119, 0.5011442, 0.5559962, 1, 0.3529412, 0, 1,
-1.637693, 1.95843, -3.713248, 1, 0.3607843, 0, 1,
-1.627297, -0.9298078, -2.826255, 1, 0.3647059, 0, 1,
-1.620492, 0.4725727, -0.7031581, 1, 0.372549, 0, 1,
-1.613427, 1.179067, -2.41719, 1, 0.3764706, 0, 1,
-1.607974, 1.027953, -1.784889, 1, 0.3843137, 0, 1,
-1.602009, 0.3758157, -1.242619, 1, 0.3882353, 0, 1,
-1.600942, 0.02612435, -1.937558, 1, 0.3960784, 0, 1,
-1.589152, 0.4675423, -1.186119, 1, 0.4039216, 0, 1,
-1.588801, 0.2461133, 0.281396, 1, 0.4078431, 0, 1,
-1.584574, 0.1778835, -1.35065, 1, 0.4156863, 0, 1,
-1.584361, -2.227126, -2.215094, 1, 0.4196078, 0, 1,
-1.573024, -1.045649, -1.76263, 1, 0.427451, 0, 1,
-1.572591, 1.06501, -0.9787835, 1, 0.4313726, 0, 1,
-1.572241, 1.384515, 0.7750036, 1, 0.4392157, 0, 1,
-1.56778, -0.24698, -1.020917, 1, 0.4431373, 0, 1,
-1.565671, -0.7613419, -2.155716, 1, 0.4509804, 0, 1,
-1.558424, -0.7787631, -1.129889, 1, 0.454902, 0, 1,
-1.550942, -0.8043684, -1.399571, 1, 0.4627451, 0, 1,
-1.543536, 0.007273517, 0.005680199, 1, 0.4666667, 0, 1,
-1.539297, 1.25795, -2.326043, 1, 0.4745098, 0, 1,
-1.538512, -1.209647, 0.3743938, 1, 0.4784314, 0, 1,
-1.529119, -0.6791368, -2.461018, 1, 0.4862745, 0, 1,
-1.528746, 0.05046445, -2.339449, 1, 0.4901961, 0, 1,
-1.523522, 2.261179, -0.2407967, 1, 0.4980392, 0, 1,
-1.515174, -0.6122402, -1.86663, 1, 0.5058824, 0, 1,
-1.511396, 0.3543696, -2.403877, 1, 0.509804, 0, 1,
-1.50297, 0.8197655, -0.9469777, 1, 0.5176471, 0, 1,
-1.496086, 2.131253, -1.195997, 1, 0.5215687, 0, 1,
-1.486902, -0.2011472, -2.281465, 1, 0.5294118, 0, 1,
-1.469635, -0.1044265, -0.982302, 1, 0.5333334, 0, 1,
-1.452383, 0.06915214, -1.844318, 1, 0.5411765, 0, 1,
-1.450737, -1.290136, -3.383551, 1, 0.5450981, 0, 1,
-1.430906, -2.27426, -3.451141, 1, 0.5529412, 0, 1,
-1.429048, -0.5028692, -2.706355, 1, 0.5568628, 0, 1,
-1.423929, 0.378451, -0.2804905, 1, 0.5647059, 0, 1,
-1.416165, 0.1856136, -0.5097917, 1, 0.5686275, 0, 1,
-1.402691, 0.8660424, -1.849063, 1, 0.5764706, 0, 1,
-1.39817, -0.3338489, -2.823141, 1, 0.5803922, 0, 1,
-1.394039, 0.9554871, -2.631832, 1, 0.5882353, 0, 1,
-1.392685, 0.5888153, -0.8838754, 1, 0.5921569, 0, 1,
-1.387474, -0.9618306, -1.672892, 1, 0.6, 0, 1,
-1.375007, -0.8299955, -2.06352, 1, 0.6078432, 0, 1,
-1.369956, -0.6797554, -2.487805, 1, 0.6117647, 0, 1,
-1.365647, -0.1919127, -1.744286, 1, 0.6196079, 0, 1,
-1.357195, 1.293566, -0.7529587, 1, 0.6235294, 0, 1,
-1.354063, 1.591982, -0.6597143, 1, 0.6313726, 0, 1,
-1.349311, 0.5490121, -0.7506494, 1, 0.6352941, 0, 1,
-1.349011, -0.2463359, -0.545341, 1, 0.6431373, 0, 1,
-1.327821, 0.01849876, -1.520916, 1, 0.6470588, 0, 1,
-1.324067, 0.7477172, -2.818341, 1, 0.654902, 0, 1,
-1.319013, -0.2740745, -1.461602, 1, 0.6588235, 0, 1,
-1.303579, -0.312651, -1.041125, 1, 0.6666667, 0, 1,
-1.299572, -0.2605276, -2.302143, 1, 0.6705883, 0, 1,
-1.28126, -0.6459963, -1.417207, 1, 0.6784314, 0, 1,
-1.268075, -2.040756, -3.59302, 1, 0.682353, 0, 1,
-1.263279, -1.426889, -1.72727, 1, 0.6901961, 0, 1,
-1.260661, 0.5593336, -1.883991, 1, 0.6941177, 0, 1,
-1.253245, 0.7187399, -2.228943, 1, 0.7019608, 0, 1,
-1.251456, 1.168858, -1.226668, 1, 0.7098039, 0, 1,
-1.24305, -0.05757102, -1.65135, 1, 0.7137255, 0, 1,
-1.239514, -1.10453, -1.612651, 1, 0.7215686, 0, 1,
-1.23899, 1.159164, -0.7268469, 1, 0.7254902, 0, 1,
-1.234632, 0.727927, -1.875597, 1, 0.7333333, 0, 1,
-1.23408, -1.464622, -5.076699, 1, 0.7372549, 0, 1,
-1.233858, -0.6937236, -1.877427, 1, 0.7450981, 0, 1,
-1.226843, -1.726303, -2.462985, 1, 0.7490196, 0, 1,
-1.22642, -1.151097, -3.287685, 1, 0.7568628, 0, 1,
-1.225601, 0.6642067, -0.3190588, 1, 0.7607843, 0, 1,
-1.224878, -0.1354984, -1.040109, 1, 0.7686275, 0, 1,
-1.219541, -0.6546378, -2.353648, 1, 0.772549, 0, 1,
-1.21045, 1.260434, -3.145051, 1, 0.7803922, 0, 1,
-1.204467, 0.9055854, -2.573596, 1, 0.7843137, 0, 1,
-1.203813, 0.3417015, -2.245501, 1, 0.7921569, 0, 1,
-1.199262, -0.4665318, -2.15801, 1, 0.7960784, 0, 1,
-1.198378, -0.2472985, -2.590928, 1, 0.8039216, 0, 1,
-1.193796, 0.8131213, -0.1059294, 1, 0.8117647, 0, 1,
-1.187163, -0.2330678, -1.842343, 1, 0.8156863, 0, 1,
-1.181861, 1.120525, -0.9897562, 1, 0.8235294, 0, 1,
-1.178751, -0.2581853, -1.452479, 1, 0.827451, 0, 1,
-1.177526, 0.5866705, -0.6125594, 1, 0.8352941, 0, 1,
-1.171978, 0.07022561, -3.02153, 1, 0.8392157, 0, 1,
-1.169539, -0.1541623, -2.746098, 1, 0.8470588, 0, 1,
-1.161913, 1.388049, -0.7423856, 1, 0.8509804, 0, 1,
-1.160057, -0.9430872, -2.580224, 1, 0.8588235, 0, 1,
-1.148044, -0.8466519, -0.5132315, 1, 0.8627451, 0, 1,
-1.137185, 1.147398, -1.862715, 1, 0.8705882, 0, 1,
-1.13623, 0.4286155, -2.115028, 1, 0.8745098, 0, 1,
-1.134561, 0.5058669, -0.6260797, 1, 0.8823529, 0, 1,
-1.133468, 0.3470012, -1.905457, 1, 0.8862745, 0, 1,
-1.132093, -0.0190893, -1.487566, 1, 0.8941177, 0, 1,
-1.116936, 0.9370918, -2.076012, 1, 0.8980392, 0, 1,
-1.111322, -0.80084, -3.333604, 1, 0.9058824, 0, 1,
-1.108053, 0.1019728, -0.5530971, 1, 0.9137255, 0, 1,
-1.103554, 1.043683, -0.8471524, 1, 0.9176471, 0, 1,
-1.095997, -1.156551, -1.541355, 1, 0.9254902, 0, 1,
-1.076749, -0.784902, 1.154888, 1, 0.9294118, 0, 1,
-1.07351, -0.6100012, -1.837254, 1, 0.9372549, 0, 1,
-1.06119, 1.318832, -0.8189057, 1, 0.9411765, 0, 1,
-1.059117, -0.4070489, -3.322711, 1, 0.9490196, 0, 1,
-1.056208, 1.349863, -1.639072, 1, 0.9529412, 0, 1,
-1.050562, -1.854269, -1.079814, 1, 0.9607843, 0, 1,
-1.050544, 0.9973528, -0.4680263, 1, 0.9647059, 0, 1,
-1.046432, -1.837756, -2.865339, 1, 0.972549, 0, 1,
-1.043417, -0.1016522, 1.492046, 1, 0.9764706, 0, 1,
-1.039886, 1.03265, -0.07905511, 1, 0.9843137, 0, 1,
-1.035461, -1.920283, -4.5051, 1, 0.9882353, 0, 1,
-1.033703, 1.491856, -0.3529695, 1, 0.9960784, 0, 1,
-1.033312, 0.9913109, -1.539951, 0.9960784, 1, 0, 1,
-1.031266, 0.7194387, -1.509885, 0.9921569, 1, 0, 1,
-1.022341, 0.8124757, -1.317579, 0.9843137, 1, 0, 1,
-1.021958, 0.4620432, -1.988352, 0.9803922, 1, 0, 1,
-1.019111, 0.6358724, -1.269359, 0.972549, 1, 0, 1,
-1.014163, 0.695551, -0.4480099, 0.9686275, 1, 0, 1,
-1.007898, 0.04672942, -1.005723, 0.9607843, 1, 0, 1,
-1.004755, 2.250995, -0.2888626, 0.9568627, 1, 0, 1,
-1.004116, 0.8229507, -0.2928976, 0.9490196, 1, 0, 1,
-0.9975935, -0.1844037, -1.204225, 0.945098, 1, 0, 1,
-0.9917561, 0.7855556, -0.3657078, 0.9372549, 1, 0, 1,
-0.988562, 0.6937174, -2.070973, 0.9333333, 1, 0, 1,
-0.9882022, -1.172531, -1.845163, 0.9254902, 1, 0, 1,
-0.9828547, 2.095998, 1.407692, 0.9215686, 1, 0, 1,
-0.982404, -0.3387679, -3.116256, 0.9137255, 1, 0, 1,
-0.9817538, 1.051405, -1.782726, 0.9098039, 1, 0, 1,
-0.9810271, 1.798084, -1.207145, 0.9019608, 1, 0, 1,
-0.9699746, 1.691121, 0.7922593, 0.8941177, 1, 0, 1,
-0.9696712, 0.09186758, -0.9641828, 0.8901961, 1, 0, 1,
-0.953096, 0.311219, -1.114768, 0.8823529, 1, 0, 1,
-0.9518256, -0.9770367, -2.27565, 0.8784314, 1, 0, 1,
-0.9478099, 0.1414346, -1.701834, 0.8705882, 1, 0, 1,
-0.9474381, -1.110043, -3.441325, 0.8666667, 1, 0, 1,
-0.9473255, 2.182353, 1.061383, 0.8588235, 1, 0, 1,
-0.9469249, 0.5616452, -1.612613, 0.854902, 1, 0, 1,
-0.9429327, -1.7517, -2.952195, 0.8470588, 1, 0, 1,
-0.937422, -1.512083, -1.758017, 0.8431373, 1, 0, 1,
-0.9335905, -0.6403263, -4.171855, 0.8352941, 1, 0, 1,
-0.9243308, -1.523747, -1.386233, 0.8313726, 1, 0, 1,
-0.9081863, 0.4301402, -1.740691, 0.8235294, 1, 0, 1,
-0.9058595, 0.4233055, -2.925334, 0.8196079, 1, 0, 1,
-0.8990163, 0.6137123, -0.564722, 0.8117647, 1, 0, 1,
-0.8971537, 1.095179, -2.174942, 0.8078431, 1, 0, 1,
-0.8962601, -0.3223361, -2.693081, 0.8, 1, 0, 1,
-0.8905963, 0.3429031, -1.005199, 0.7921569, 1, 0, 1,
-0.8893983, -1.574348, -2.748887, 0.7882353, 1, 0, 1,
-0.8877763, -0.02092493, -0.4532664, 0.7803922, 1, 0, 1,
-0.887503, 0.7496065, 0.1712287, 0.7764706, 1, 0, 1,
-0.887123, 1.530451, -0.5906311, 0.7686275, 1, 0, 1,
-0.8844393, 1.560865, -0.5465293, 0.7647059, 1, 0, 1,
-0.8830523, -1.434689, -3.108858, 0.7568628, 1, 0, 1,
-0.8794028, -2.233013, -3.004583, 0.7529412, 1, 0, 1,
-0.8770521, 0.452076, -0.5497862, 0.7450981, 1, 0, 1,
-0.8665655, -0.3422251, -4.194281, 0.7411765, 1, 0, 1,
-0.8658485, -1.070886, -3.222038, 0.7333333, 1, 0, 1,
-0.8590049, 0.1003663, -2.689839, 0.7294118, 1, 0, 1,
-0.8518931, -0.5459956, -1.028422, 0.7215686, 1, 0, 1,
-0.8481393, -0.9493007, -0.684077, 0.7176471, 1, 0, 1,
-0.8429922, -0.7954146, -2.403079, 0.7098039, 1, 0, 1,
-0.8276929, -0.9502129, -2.409588, 0.7058824, 1, 0, 1,
-0.8260072, 0.535901, -1.802663, 0.6980392, 1, 0, 1,
-0.8237024, -0.1005853, -0.6591997, 0.6901961, 1, 0, 1,
-0.8211451, -1.20093, -4.319662, 0.6862745, 1, 0, 1,
-0.8187034, 0.4029845, -1.434306, 0.6784314, 1, 0, 1,
-0.8175123, 0.2161568, -1.506821, 0.6745098, 1, 0, 1,
-0.8174731, -1.03924, -2.771592, 0.6666667, 1, 0, 1,
-0.8117954, 0.203734, -1.033283, 0.6627451, 1, 0, 1,
-0.806245, 1.190787, -0.9515933, 0.654902, 1, 0, 1,
-0.8016428, -0.4525325, 0.3773199, 0.6509804, 1, 0, 1,
-0.7961178, -0.8535204, 0.5078853, 0.6431373, 1, 0, 1,
-0.7954713, 0.7254817, -1.356572, 0.6392157, 1, 0, 1,
-0.7909992, -0.4222893, -2.117658, 0.6313726, 1, 0, 1,
-0.7893708, -1.86742, -1.018447, 0.627451, 1, 0, 1,
-0.7886959, 0.586278, -2.548021, 0.6196079, 1, 0, 1,
-0.7885396, -0.505684, -1.681078, 0.6156863, 1, 0, 1,
-0.7879768, 1.140873, -1.333632, 0.6078432, 1, 0, 1,
-0.7765946, -0.6928946, -1.952868, 0.6039216, 1, 0, 1,
-0.7622479, -0.5556511, -3.046204, 0.5960785, 1, 0, 1,
-0.7616533, 1.211872, 0.4877141, 0.5882353, 1, 0, 1,
-0.7575833, 0.7771794, -1.584773, 0.5843138, 1, 0, 1,
-0.7531446, 0.3509589, -1.801075, 0.5764706, 1, 0, 1,
-0.750926, -1.296726, -1.29862, 0.572549, 1, 0, 1,
-0.7475169, -1.129023, -3.444947, 0.5647059, 1, 0, 1,
-0.7419837, -0.7051463, -4.010818, 0.5607843, 1, 0, 1,
-0.7330785, -0.6638823, -3.092695, 0.5529412, 1, 0, 1,
-0.7249923, 2.514345, -0.5757551, 0.5490196, 1, 0, 1,
-0.7168539, 1.036623, -1.481662, 0.5411765, 1, 0, 1,
-0.715312, -1.326203, -3.337558, 0.5372549, 1, 0, 1,
-0.7083779, 0.5886248, -1.249344, 0.5294118, 1, 0, 1,
-0.7057564, 0.4166825, -0.9911064, 0.5254902, 1, 0, 1,
-0.7034091, 0.5485728, -1.852887, 0.5176471, 1, 0, 1,
-0.6986755, -1.079282, -1.128854, 0.5137255, 1, 0, 1,
-0.697494, 0.126866, -1.66079, 0.5058824, 1, 0, 1,
-0.6957667, -0.2050911, -1.215661, 0.5019608, 1, 0, 1,
-0.6916503, 0.9253947, -0.01874237, 0.4941176, 1, 0, 1,
-0.6912121, -1.052318, -3.318661, 0.4862745, 1, 0, 1,
-0.6898389, -0.6938145, -1.874222, 0.4823529, 1, 0, 1,
-0.6794434, -1.752871, -3.018955, 0.4745098, 1, 0, 1,
-0.6782839, 1.58651, -0.5164618, 0.4705882, 1, 0, 1,
-0.6780725, -1.075701, -1.934373, 0.4627451, 1, 0, 1,
-0.6768577, 0.3863727, -2.084495, 0.4588235, 1, 0, 1,
-0.6747004, -2.130847, -2.677192, 0.4509804, 1, 0, 1,
-0.6731808, -0.643597, -1.492937, 0.4470588, 1, 0, 1,
-0.6711621, -0.7541208, -3.488034, 0.4392157, 1, 0, 1,
-0.6699547, 1.160606, 0.9746457, 0.4352941, 1, 0, 1,
-0.6641729, 0.3285412, -0.6326931, 0.427451, 1, 0, 1,
-0.6602686, 1.578301, -2.946843, 0.4235294, 1, 0, 1,
-0.6586825, 0.3461546, -0.975729, 0.4156863, 1, 0, 1,
-0.6575764, 0.3561382, -3.137527, 0.4117647, 1, 0, 1,
-0.6543707, 0.3084774, 1.266141, 0.4039216, 1, 0, 1,
-0.6510451, 1.281346, 0.1683443, 0.3960784, 1, 0, 1,
-0.6503096, 0.02630219, -1.42553, 0.3921569, 1, 0, 1,
-0.6502534, -0.8677985, -1.58715, 0.3843137, 1, 0, 1,
-0.6481119, -0.1895478, -2.49681, 0.3803922, 1, 0, 1,
-0.6444367, 2.025033, -0.8245668, 0.372549, 1, 0, 1,
-0.6433036, 0.6775252, -0.1604433, 0.3686275, 1, 0, 1,
-0.6387127, -0.2574113, -2.649832, 0.3607843, 1, 0, 1,
-0.635186, -1.2913, -2.466524, 0.3568628, 1, 0, 1,
-0.6328838, 0.7065168, -1.517147, 0.3490196, 1, 0, 1,
-0.6314007, -0.02117317, -4.04023, 0.345098, 1, 0, 1,
-0.629166, -1.147945, -3.454167, 0.3372549, 1, 0, 1,
-0.6236393, 1.143218, -1.980535, 0.3333333, 1, 0, 1,
-0.620337, 1.924668, 0.1150031, 0.3254902, 1, 0, 1,
-0.6164917, -1.575997, -2.565305, 0.3215686, 1, 0, 1,
-0.6164868, -0.3373273, -1.002444, 0.3137255, 1, 0, 1,
-0.6134281, -0.9187036, -3.528017, 0.3098039, 1, 0, 1,
-0.6124376, 0.0251877, -0.7095734, 0.3019608, 1, 0, 1,
-0.6093985, 1.94671, -0.814458, 0.2941177, 1, 0, 1,
-0.6087595, -1.595977, -4.071737, 0.2901961, 1, 0, 1,
-0.6076509, -0.4860104, -1.560831, 0.282353, 1, 0, 1,
-0.604173, 1.765791, 0.122778, 0.2784314, 1, 0, 1,
-0.5999408, -0.6259159, -4.139118, 0.2705882, 1, 0, 1,
-0.5992907, 0.9884437, 0.8794875, 0.2666667, 1, 0, 1,
-0.5990661, 0.6076309, 0.6608378, 0.2588235, 1, 0, 1,
-0.5920249, 1.138996, -1.660582, 0.254902, 1, 0, 1,
-0.5906294, 0.9290417, -1.619334, 0.2470588, 1, 0, 1,
-0.5899096, -0.03429009, -1.965443, 0.2431373, 1, 0, 1,
-0.5878063, 0.9965887, -0.2248025, 0.2352941, 1, 0, 1,
-0.5868348, 1.689212, -2.69377, 0.2313726, 1, 0, 1,
-0.5852789, -1.365055, -1.611154, 0.2235294, 1, 0, 1,
-0.5805098, 0.5447069, -1.818875, 0.2196078, 1, 0, 1,
-0.5802264, 0.7709009, 0.4198517, 0.2117647, 1, 0, 1,
-0.5696431, -2.237743, -2.27436, 0.2078431, 1, 0, 1,
-0.5688103, 0.8232629, -0.472721, 0.2, 1, 0, 1,
-0.5608068, 0.4654888, 0.5019461, 0.1921569, 1, 0, 1,
-0.558441, -1.118633, -2.44685, 0.1882353, 1, 0, 1,
-0.5577115, 0.9469802, -0.4084069, 0.1803922, 1, 0, 1,
-0.5568723, -1.340613, -1.940012, 0.1764706, 1, 0, 1,
-0.5528104, 0.4932346, -2.517758, 0.1686275, 1, 0, 1,
-0.5525044, 1.177104, -0.7451365, 0.1647059, 1, 0, 1,
-0.5519914, -0.2593233, -2.422771, 0.1568628, 1, 0, 1,
-0.5485382, -1.636178, -2.64675, 0.1529412, 1, 0, 1,
-0.5431439, -0.7418727, -2.481228, 0.145098, 1, 0, 1,
-0.5340018, 2.402571, 0.5689466, 0.1411765, 1, 0, 1,
-0.5326361, -0.2161718, -4.124249, 0.1333333, 1, 0, 1,
-0.5267828, -0.4815248, -2.006233, 0.1294118, 1, 0, 1,
-0.5235789, -0.8267691, -2.174085, 0.1215686, 1, 0, 1,
-0.5201686, 0.5038667, 0.3932629, 0.1176471, 1, 0, 1,
-0.5143679, 0.6105577, -2.281435, 0.1098039, 1, 0, 1,
-0.5126221, -0.5744439, -3.39738, 0.1058824, 1, 0, 1,
-0.5053824, -0.8064744, -2.170178, 0.09803922, 1, 0, 1,
-0.5013391, 0.4864879, -0.5665116, 0.09019608, 1, 0, 1,
-0.4991454, -0.04609706, -0.9971126, 0.08627451, 1, 0, 1,
-0.4971687, 0.4132709, -0.247242, 0.07843138, 1, 0, 1,
-0.4897874, 0.6694138, 1.23603, 0.07450981, 1, 0, 1,
-0.4777423, -0.1328572, -1.602333, 0.06666667, 1, 0, 1,
-0.4770583, -0.2684768, -4.316129, 0.0627451, 1, 0, 1,
-0.4763456, -1.174479, -2.820323, 0.05490196, 1, 0, 1,
-0.4761143, 0.7821925, -1.148303, 0.05098039, 1, 0, 1,
-0.4702613, 0.5202168, 1.179496, 0.04313726, 1, 0, 1,
-0.4674136, 0.8155585, 0.3805622, 0.03921569, 1, 0, 1,
-0.4553948, 1.451112, -1.466875, 0.03137255, 1, 0, 1,
-0.4531265, -0.5136747, -0.2294592, 0.02745098, 1, 0, 1,
-0.4449018, 0.6755695, 0.04237099, 0.01960784, 1, 0, 1,
-0.4430038, 1.822864, 0.3190561, 0.01568628, 1, 0, 1,
-0.435631, 0.1406426, -0.4791942, 0.007843138, 1, 0, 1,
-0.4331777, 0.053181, -2.739232, 0.003921569, 1, 0, 1,
-0.4312328, 0.3240933, -0.3033459, 0, 1, 0.003921569, 1,
-0.4306618, -0.4953534, -1.904981, 0, 1, 0.01176471, 1,
-0.4212745, 0.9049515, -1.571583, 0, 1, 0.01568628, 1,
-0.4195786, -0.1985877, -2.48211, 0, 1, 0.02352941, 1,
-0.413473, 0.2512125, -2.333266, 0, 1, 0.02745098, 1,
-0.408572, -0.4800826, -2.361433, 0, 1, 0.03529412, 1,
-0.4079599, -0.1117469, -1.520241, 0, 1, 0.03921569, 1,
-0.4071579, -0.4793923, -2.523134, 0, 1, 0.04705882, 1,
-0.4048466, -1.630523, -1.02976, 0, 1, 0.05098039, 1,
-0.4041, -1.118846, -1.973953, 0, 1, 0.05882353, 1,
-0.4005363, -0.3744407, -4.28818, 0, 1, 0.0627451, 1,
-0.4002734, 0.9832568, -0.7996944, 0, 1, 0.07058824, 1,
-0.3977768, 1.036524, -0.7576338, 0, 1, 0.07450981, 1,
-0.3948521, 0.1354402, -2.175451, 0, 1, 0.08235294, 1,
-0.3919461, -0.3668057, -2.460609, 0, 1, 0.08627451, 1,
-0.3905297, -0.7407559, -4.561801, 0, 1, 0.09411765, 1,
-0.3900773, -0.7733137, -1.697571, 0, 1, 0.1019608, 1,
-0.3878934, 0.7649181, -1.522093, 0, 1, 0.1058824, 1,
-0.3863871, 1.816509, 0.7309158, 0, 1, 0.1137255, 1,
-0.3827755, -0.7416833, -2.965911, 0, 1, 0.1176471, 1,
-0.3792695, 0.9239781, 0.1493683, 0, 1, 0.1254902, 1,
-0.3718262, -0.3804471, -3.246087, 0, 1, 0.1294118, 1,
-0.3711097, 1.900313, 0.0009482469, 0, 1, 0.1372549, 1,
-0.3694911, 2.106258, 0.7391385, 0, 1, 0.1411765, 1,
-0.3690525, -0.3456026, 0.197798, 0, 1, 0.1490196, 1,
-0.363417, 1.106114, -2.165885, 0, 1, 0.1529412, 1,
-0.361333, 1.020468, -0.3630049, 0, 1, 0.1607843, 1,
-0.3603396, -0.4726577, -0.4980362, 0, 1, 0.1647059, 1,
-0.3591698, -0.7515209, -3.79553, 0, 1, 0.172549, 1,
-0.3579708, -1.680426, -4.424408, 0, 1, 0.1764706, 1,
-0.3541212, 1.081949, -0.06795247, 0, 1, 0.1843137, 1,
-0.3498651, -0.4446703, -3.251093, 0, 1, 0.1882353, 1,
-0.3473736, -0.5575647, -1.579273, 0, 1, 0.1960784, 1,
-0.3462704, 0.1053079, -1.336468, 0, 1, 0.2039216, 1,
-0.3456573, -0.2410037, -0.2280903, 0, 1, 0.2078431, 1,
-0.3434605, 1.524582, 0.8378662, 0, 1, 0.2156863, 1,
-0.3419114, -2.218678, -1.076984, 0, 1, 0.2196078, 1,
-0.3330598, -2.247303, -3.273576, 0, 1, 0.227451, 1,
-0.3329704, 1.152572, 0.03966993, 0, 1, 0.2313726, 1,
-0.3300624, -0.1530173, -2.260104, 0, 1, 0.2392157, 1,
-0.3252347, 0.7271727, 1.914612, 0, 1, 0.2431373, 1,
-0.3232549, 0.3507594, 0.4704061, 0, 1, 0.2509804, 1,
-0.3159011, 0.6873705, -0.4139377, 0, 1, 0.254902, 1,
-0.3140759, 1.376674, -1.676179, 0, 1, 0.2627451, 1,
-0.3134637, 0.04332531, -0.3280405, 0, 1, 0.2666667, 1,
-0.3107527, -0.1822562, -2.211742, 0, 1, 0.2745098, 1,
-0.310065, -0.8119745, -3.227133, 0, 1, 0.2784314, 1,
-0.3068941, 0.3383278, -1.455635, 0, 1, 0.2862745, 1,
-0.3021034, 0.9828544, -1.628524, 0, 1, 0.2901961, 1,
-0.3002558, -0.96311, -4.348917, 0, 1, 0.2980392, 1,
-0.2977507, 0.5300055, -0.630231, 0, 1, 0.3058824, 1,
-0.2973316, 1.128535, 1.616809, 0, 1, 0.3098039, 1,
-0.2966544, 2.017884, 0.7675673, 0, 1, 0.3176471, 1,
-0.2930606, -2.275916, -3.567825, 0, 1, 0.3215686, 1,
-0.2919331, -0.6042365, -2.441396, 0, 1, 0.3294118, 1,
-0.2899325, -0.6791309, -2.747437, 0, 1, 0.3333333, 1,
-0.2852427, -0.5910079, -5.066432, 0, 1, 0.3411765, 1,
-0.2835726, 0.2469952, -1.445821, 0, 1, 0.345098, 1,
-0.2832045, 0.7588626, -0.1226051, 0, 1, 0.3529412, 1,
-0.2822878, 2.193783, -0.6805364, 0, 1, 0.3568628, 1,
-0.2796616, -0.38412, -2.431276, 0, 1, 0.3647059, 1,
-0.2793964, -1.74839, -2.625113, 0, 1, 0.3686275, 1,
-0.2775881, 0.9619673, -1.76691, 0, 1, 0.3764706, 1,
-0.2752866, 1.177168, -2.424309, 0, 1, 0.3803922, 1,
-0.2654087, 0.6835876, 0.3168854, 0, 1, 0.3882353, 1,
-0.263778, 0.7754401, -1.156176, 0, 1, 0.3921569, 1,
-0.2584712, -0.0914413, -2.020741, 0, 1, 0.4, 1,
-0.2577543, 0.4141131, -0.7606394, 0, 1, 0.4078431, 1,
-0.2543071, 0.8699828, -0.3629467, 0, 1, 0.4117647, 1,
-0.2521616, -0.2858656, -3.008857, 0, 1, 0.4196078, 1,
-0.2515694, -0.1047932, -1.423628, 0, 1, 0.4235294, 1,
-0.2503652, -0.2512359, -3.582951, 0, 1, 0.4313726, 1,
-0.2480914, -0.2858844, -2.036657, 0, 1, 0.4352941, 1,
-0.2443038, 0.01112599, -1.788305, 0, 1, 0.4431373, 1,
-0.243545, 0.1489782, -0.3061732, 0, 1, 0.4470588, 1,
-0.242694, -1.695258, -2.564984, 0, 1, 0.454902, 1,
-0.2421206, -0.8389244, -3.234881, 0, 1, 0.4588235, 1,
-0.2406245, -0.9336093, -2.868443, 0, 1, 0.4666667, 1,
-0.2405791, -1.98344, -3.690735, 0, 1, 0.4705882, 1,
-0.2348672, -1.400346, -4.45938, 0, 1, 0.4784314, 1,
-0.2335453, -0.8229974, -1.227225, 0, 1, 0.4823529, 1,
-0.2333358, -0.5140282, -4.541406, 0, 1, 0.4901961, 1,
-0.23092, -1.122903, -2.003622, 0, 1, 0.4941176, 1,
-0.229008, 0.930492, -1.223826, 0, 1, 0.5019608, 1,
-0.2274874, 3.530374, 0.5889648, 0, 1, 0.509804, 1,
-0.2251405, -0.5882323, -2.754817, 0, 1, 0.5137255, 1,
-0.2227062, 0.293031, 0.02793362, 0, 1, 0.5215687, 1,
-0.2225483, 0.6027329, -0.5816849, 0, 1, 0.5254902, 1,
-0.2110888, -1.185972, -3.605701, 0, 1, 0.5333334, 1,
-0.2044644, 2.151601, 0.4473098, 0, 1, 0.5372549, 1,
-0.2021269, 0.05746166, -0.5840771, 0, 1, 0.5450981, 1,
-0.2007848, -1.222034, -2.332256, 0, 1, 0.5490196, 1,
-0.1963565, 1.396843, 1.567448, 0, 1, 0.5568628, 1,
-0.1946128, -0.1033926, -2.608381, 0, 1, 0.5607843, 1,
-0.1923279, -1.593234, -2.810719, 0, 1, 0.5686275, 1,
-0.1904468, -0.9130859, -2.328354, 0, 1, 0.572549, 1,
-0.1903524, 1.523161, 1.259478, 0, 1, 0.5803922, 1,
-0.1866376, -2.41345, -3.019571, 0, 1, 0.5843138, 1,
-0.186599, 0.9927546, -0.8181957, 0, 1, 0.5921569, 1,
-0.1865663, 0.8382365, -0.1536939, 0, 1, 0.5960785, 1,
-0.1847176, 2.287384, -0.5040099, 0, 1, 0.6039216, 1,
-0.1786549, -1.261311, -2.056046, 0, 1, 0.6117647, 1,
-0.1778963, 0.1867848, -2.669175, 0, 1, 0.6156863, 1,
-0.1755865, -1.926249, -3.39165, 0, 1, 0.6235294, 1,
-0.1750751, -0.1416011, -2.442228, 0, 1, 0.627451, 1,
-0.1717149, 0.7200021, -1.009029, 0, 1, 0.6352941, 1,
-0.1660649, -0.3303532, -2.034097, 0, 1, 0.6392157, 1,
-0.1653822, -0.4527458, -2.432426, 0, 1, 0.6470588, 1,
-0.1593988, 1.505367, 1.896416, 0, 1, 0.6509804, 1,
-0.1561888, -0.3619446, -2.135621, 0, 1, 0.6588235, 1,
-0.1535991, -0.3287245, -3.271587, 0, 1, 0.6627451, 1,
-0.1504981, 0.4039069, -0.9660206, 0, 1, 0.6705883, 1,
-0.1503411, 1.047706, 0.3002302, 0, 1, 0.6745098, 1,
-0.1502156, -1.888877, -3.221099, 0, 1, 0.682353, 1,
-0.1445604, 0.6516862, -0.2191353, 0, 1, 0.6862745, 1,
-0.1445044, -0.6338625, -2.372111, 0, 1, 0.6941177, 1,
-0.1434182, 0.8632331, -0.641229, 0, 1, 0.7019608, 1,
-0.1425736, -0.8246177, -1.731042, 0, 1, 0.7058824, 1,
-0.1405067, 0.6649292, -0.8790997, 0, 1, 0.7137255, 1,
-0.137345, -2.246237, -1.950378, 0, 1, 0.7176471, 1,
-0.1347279, 2.106128, -0.7276973, 0, 1, 0.7254902, 1,
-0.1324386, -0.4209723, -3.011228, 0, 1, 0.7294118, 1,
-0.1322236, -1.685349, -1.887371, 0, 1, 0.7372549, 1,
-0.1302339, -1.020178, -4.136066, 0, 1, 0.7411765, 1,
-0.126533, 0.7078463, 0.7702178, 0, 1, 0.7490196, 1,
-0.125531, -0.08191663, -1.414365, 0, 1, 0.7529412, 1,
-0.1218664, 0.640842, 0.1179446, 0, 1, 0.7607843, 1,
-0.1216252, -0.4068607, -3.92703, 0, 1, 0.7647059, 1,
-0.1204478, 1.913277, 0.7632936, 0, 1, 0.772549, 1,
-0.1154309, 1.685393, 0.1507547, 0, 1, 0.7764706, 1,
-0.1144247, 0.5578278, 0.1459258, 0, 1, 0.7843137, 1,
-0.1126763, 0.8722033, -0.4420061, 0, 1, 0.7882353, 1,
-0.1093875, 1.367483, 0.3092145, 0, 1, 0.7960784, 1,
-0.1079061, -0.5796486, -1.311785, 0, 1, 0.8039216, 1,
-0.1077538, 0.5845346, -0.5918375, 0, 1, 0.8078431, 1,
-0.103777, -0.4856731, -0.2924158, 0, 1, 0.8156863, 1,
-0.1018858, 1.96619, -1.220337, 0, 1, 0.8196079, 1,
-0.1012041, -0.005057311, 0.3465049, 0, 1, 0.827451, 1,
-0.09995986, 1.135473, -0.497724, 0, 1, 0.8313726, 1,
-0.09994946, 0.1294093, -1.537976, 0, 1, 0.8392157, 1,
-0.08913036, -0.6190529, -3.651473, 0, 1, 0.8431373, 1,
-0.08874848, -0.359619, -4.745628, 0, 1, 0.8509804, 1,
-0.08662843, 1.584073, 0.2612166, 0, 1, 0.854902, 1,
-0.08658037, 1.927011, -0.4361423, 0, 1, 0.8627451, 1,
-0.08097657, -0.1598641, -3.232534, 0, 1, 0.8666667, 1,
-0.07890568, -0.3573915, -0.8281169, 0, 1, 0.8745098, 1,
-0.06930534, -0.2120749, -1.826654, 0, 1, 0.8784314, 1,
-0.06837908, 0.4896255, 1.223753, 0, 1, 0.8862745, 1,
-0.06717841, 0.165834, -0.6009957, 0, 1, 0.8901961, 1,
-0.06650016, -0.7728757, -2.889477, 0, 1, 0.8980392, 1,
-0.0655586, -0.9008743, -3.660058, 0, 1, 0.9058824, 1,
-0.06206152, 0.6445114, -1.156416, 0, 1, 0.9098039, 1,
-0.05920111, -0.8090975, -0.8742707, 0, 1, 0.9176471, 1,
-0.05914393, 0.9560488, 1.371174, 0, 1, 0.9215686, 1,
-0.05854261, -0.6471012, -2.591496, 0, 1, 0.9294118, 1,
-0.05797185, 0.6705688, -0.6028768, 0, 1, 0.9333333, 1,
-0.05622487, -0.6094036, -1.912525, 0, 1, 0.9411765, 1,
-0.04905595, 0.9562314, 1.061875, 0, 1, 0.945098, 1,
-0.04892116, -0.7055792, -3.964075, 0, 1, 0.9529412, 1,
-0.04416754, 0.12752, -0.6035203, 0, 1, 0.9568627, 1,
-0.04363416, 2.963489, -0.2475161, 0, 1, 0.9647059, 1,
-0.04176744, -0.3035738, -2.630988, 0, 1, 0.9686275, 1,
-0.04081157, -1.007358, -2.687297, 0, 1, 0.9764706, 1,
-0.03914026, -2.488116, -1.612342, 0, 1, 0.9803922, 1,
-0.03911255, 1.364509, -0.5057085, 0, 1, 0.9882353, 1,
-0.03800406, 0.7068555, 2.493991, 0, 1, 0.9921569, 1,
-0.03655536, 1.484407, -0.9105435, 0, 1, 1, 1,
-0.03620166, 1.002204, -0.8466285, 0, 0.9921569, 1, 1,
-0.03413878, 0.8935353, 1.605528, 0, 0.9882353, 1, 1,
-0.03194956, -0.09644085, -2.751742, 0, 0.9803922, 1, 1,
-0.03091877, -0.6330951, -2.493782, 0, 0.9764706, 1, 1,
-0.03032067, 0.4210966, 0.7451871, 0, 0.9686275, 1, 1,
-0.02205006, -1.260235, -2.991733, 0, 0.9647059, 1, 1,
-0.01956517, 0.3330911, -0.6519762, 0, 0.9568627, 1, 1,
-0.01240962, 2.176581, 0.6497146, 0, 0.9529412, 1, 1,
-0.01140131, -0.6601984, -4.524695, 0, 0.945098, 1, 1,
-0.01035636, -0.5194588, -3.678492, 0, 0.9411765, 1, 1,
-0.008451903, -1.252976, -2.866426, 0, 0.9333333, 1, 1,
-0.00438996, 0.6138261, 0.2702951, 0, 0.9294118, 1, 1,
0.001698143, 0.7503868, -0.751645, 0, 0.9215686, 1, 1,
0.007816343, 1.274036, -2.522959, 0, 0.9176471, 1, 1,
0.008428483, -2.117974, 3.045481, 0, 0.9098039, 1, 1,
0.009363904, 1.173915, -0.5896021, 0, 0.9058824, 1, 1,
0.009654537, 0.7803468, -0.5851148, 0, 0.8980392, 1, 1,
0.01282373, -1.555346, 4.478071, 0, 0.8901961, 1, 1,
0.01852372, 0.9457692, 0.3408767, 0, 0.8862745, 1, 1,
0.02022988, -0.829501, -0.9971737, 0, 0.8784314, 1, 1,
0.02119719, -0.4905451, 2.208348, 0, 0.8745098, 1, 1,
0.02432089, -0.2438495, 2.836411, 0, 0.8666667, 1, 1,
0.0254257, 1.424139, 1.430639, 0, 0.8627451, 1, 1,
0.0260724, -0.4846517, 3.948612, 0, 0.854902, 1, 1,
0.02866901, 1.014591, -0.1939612, 0, 0.8509804, 1, 1,
0.03124263, -0.6249211, 3.766038, 0, 0.8431373, 1, 1,
0.03136016, 0.9861873, 0.3113427, 0, 0.8392157, 1, 1,
0.04039482, 0.6929029, -0.5985358, 0, 0.8313726, 1, 1,
0.0425099, 0.197384, 0.1438961, 0, 0.827451, 1, 1,
0.04263489, -2.251211, 2.773804, 0, 0.8196079, 1, 1,
0.04610292, 1.256617, 0.7505304, 0, 0.8156863, 1, 1,
0.04934749, -0.9255117, 4.509209, 0, 0.8078431, 1, 1,
0.05041347, -0.3959475, 2.252119, 0, 0.8039216, 1, 1,
0.05275322, 0.3004157, 0.1745421, 0, 0.7960784, 1, 1,
0.05645915, 1.847548, -0.2204819, 0, 0.7882353, 1, 1,
0.05821764, 0.2064518, -0.6081728, 0, 0.7843137, 1, 1,
0.06536602, -0.05275423, 3.151448, 0, 0.7764706, 1, 1,
0.0684714, 0.1122796, 0.1947418, 0, 0.772549, 1, 1,
0.06848467, 0.4809297, -0.3726014, 0, 0.7647059, 1, 1,
0.0690417, 0.3233067, -0.4860394, 0, 0.7607843, 1, 1,
0.06943721, 0.243466, 0.124615, 0, 0.7529412, 1, 1,
0.07261427, -0.3163662, 2.982867, 0, 0.7490196, 1, 1,
0.07311826, -0.3545388, 3.695076, 0, 0.7411765, 1, 1,
0.07425705, -0.8945432, 3.291479, 0, 0.7372549, 1, 1,
0.07661381, 0.1972074, 3.090618, 0, 0.7294118, 1, 1,
0.07805614, 0.5739051, -0.0304065, 0, 0.7254902, 1, 1,
0.07961464, 1.041236, 1.408686, 0, 0.7176471, 1, 1,
0.08941632, 0.4710115, 0.07523046, 0, 0.7137255, 1, 1,
0.0913207, -0.1481043, 2.939638, 0, 0.7058824, 1, 1,
0.09136137, 0.07856821, 0.0274214, 0, 0.6980392, 1, 1,
0.09592338, -0.6048859, 2.497036, 0, 0.6941177, 1, 1,
0.1039297, -0.2604078, 5.66889, 0, 0.6862745, 1, 1,
0.1040723, -1.062721, 3.401457, 0, 0.682353, 1, 1,
0.1060667, 0.9017085, 0.05310325, 0, 0.6745098, 1, 1,
0.1079739, 0.08416275, 2.098944, 0, 0.6705883, 1, 1,
0.1090888, 1.04642, -0.1749966, 0, 0.6627451, 1, 1,
0.1108688, 1.958906, 0.2373244, 0, 0.6588235, 1, 1,
0.1115628, -0.05705936, 2.07766, 0, 0.6509804, 1, 1,
0.1135866, 0.8119971, -1.080068, 0, 0.6470588, 1, 1,
0.1138726, 0.01420681, 2.972884, 0, 0.6392157, 1, 1,
0.1179404, 0.08583737, 1.997903, 0, 0.6352941, 1, 1,
0.1204453, -0.09455626, 2.125217, 0, 0.627451, 1, 1,
0.1205368, -1.485217, 2.956809, 0, 0.6235294, 1, 1,
0.1235419, 1.46662, -1.636922, 0, 0.6156863, 1, 1,
0.1254942, 1.137972, -0.2692289, 0, 0.6117647, 1, 1,
0.1296088, -0.1325005, 2.566514, 0, 0.6039216, 1, 1,
0.1348086, 0.8621062, -0.6984119, 0, 0.5960785, 1, 1,
0.1363524, 1.297864, 0.7741341, 0, 0.5921569, 1, 1,
0.1421205, 0.5591348, 0.006864245, 0, 0.5843138, 1, 1,
0.1433702, 0.8279705, 1.29866, 0, 0.5803922, 1, 1,
0.1439662, -0.9891769, 3.589094, 0, 0.572549, 1, 1,
0.1449704, -0.3056941, 4.095365, 0, 0.5686275, 1, 1,
0.1536058, -0.5481133, 2.895136, 0, 0.5607843, 1, 1,
0.1551586, 0.310739, 1.370211, 0, 0.5568628, 1, 1,
0.1661667, -0.6119276, 3.573734, 0, 0.5490196, 1, 1,
0.1666975, 0.2257482, 1.538236, 0, 0.5450981, 1, 1,
0.1686947, -1.275891, 3.156554, 0, 0.5372549, 1, 1,
0.1734897, 0.4370019, 0.552057, 0, 0.5333334, 1, 1,
0.1847003, -0.3453397, 1.360829, 0, 0.5254902, 1, 1,
0.1888402, -0.8288961, 2.510685, 0, 0.5215687, 1, 1,
0.1891347, 0.5887462, 1.46212, 0, 0.5137255, 1, 1,
0.1908169, 0.9597142, -0.2290422, 0, 0.509804, 1, 1,
0.1948483, 0.8525041, -0.1920121, 0, 0.5019608, 1, 1,
0.2112176, -0.5276628, 2.807231, 0, 0.4941176, 1, 1,
0.211967, -2.093213, 4.167506, 0, 0.4901961, 1, 1,
0.2146614, 0.1879935, 0.3987828, 0, 0.4823529, 1, 1,
0.2170142, -0.5408735, 3.331961, 0, 0.4784314, 1, 1,
0.2179413, -0.5714697, 2.188561, 0, 0.4705882, 1, 1,
0.2186763, -0.97862, 3.159809, 0, 0.4666667, 1, 1,
0.2189072, 0.2544307, 1.588515, 0, 0.4588235, 1, 1,
0.2220307, -1.837506, 0.9758425, 0, 0.454902, 1, 1,
0.2221326, -1.187521, 2.651347, 0, 0.4470588, 1, 1,
0.2245956, -0.9367295, 3.660891, 0, 0.4431373, 1, 1,
0.2252211, -0.8726621, 3.827634, 0, 0.4352941, 1, 1,
0.2327143, 1.211056, 1.303045, 0, 0.4313726, 1, 1,
0.2338502, -0.9373907, 2.938738, 0, 0.4235294, 1, 1,
0.2347944, 0.6378435, -0.9419666, 0, 0.4196078, 1, 1,
0.2356176, -0.2529565, 2.6483, 0, 0.4117647, 1, 1,
0.2400819, -0.0671722, 2.768008, 0, 0.4078431, 1, 1,
0.2428596, -0.1647799, 1.960735, 0, 0.4, 1, 1,
0.2433879, -0.4306868, 1.999522, 0, 0.3921569, 1, 1,
0.2446735, 0.2998087, -0.04759137, 0, 0.3882353, 1, 1,
0.2469463, 0.2580614, 1.391874, 0, 0.3803922, 1, 1,
0.2510757, -0.2025985, 1.950485, 0, 0.3764706, 1, 1,
0.2559652, -0.5677067, 2.781246, 0, 0.3686275, 1, 1,
0.255985, -0.578565, 4.081511, 0, 0.3647059, 1, 1,
0.2583674, 0.458299, -0.5429658, 0, 0.3568628, 1, 1,
0.2599481, 0.8853642, 0.05391226, 0, 0.3529412, 1, 1,
0.2626866, -0.3194931, 0.9108561, 0, 0.345098, 1, 1,
0.2641398, 0.2527254, 2.121789, 0, 0.3411765, 1, 1,
0.264954, -0.271176, 1.485281, 0, 0.3333333, 1, 1,
0.2696732, -0.01685512, 2.059903, 0, 0.3294118, 1, 1,
0.2705008, 0.5695035, 0.8049955, 0, 0.3215686, 1, 1,
0.2725537, 0.2913182, 0.7518889, 0, 0.3176471, 1, 1,
0.2731716, -0.1977822, 2.723322, 0, 0.3098039, 1, 1,
0.2739802, 0.4426773, 1.122138, 0, 0.3058824, 1, 1,
0.2742127, -0.2103341, 1.858168, 0, 0.2980392, 1, 1,
0.2818867, -0.04801907, 1.949258, 0, 0.2901961, 1, 1,
0.2895958, -0.2263706, 3.197494, 0, 0.2862745, 1, 1,
0.2901217, 0.9839414, 0.1686701, 0, 0.2784314, 1, 1,
0.2901727, 0.4053331, -0.1353944, 0, 0.2745098, 1, 1,
0.2906411, -2.759037, 2.497371, 0, 0.2666667, 1, 1,
0.293118, 1.512337, 1.315584, 0, 0.2627451, 1, 1,
0.2963114, 0.5695741, 0.606687, 0, 0.254902, 1, 1,
0.3032321, 1.468134, -2.246995, 0, 0.2509804, 1, 1,
0.304824, -0.3371279, 1.999179, 0, 0.2431373, 1, 1,
0.3059536, 1.059209, -0.3246075, 0, 0.2392157, 1, 1,
0.3071553, 0.1039868, 1.970515, 0, 0.2313726, 1, 1,
0.3095278, -1.435413, 3.356105, 0, 0.227451, 1, 1,
0.3159293, -0.08431089, 0.09036686, 0, 0.2196078, 1, 1,
0.3210388, -0.1941387, 2.88278, 0, 0.2156863, 1, 1,
0.3217908, -0.0591004, 1.565043, 0, 0.2078431, 1, 1,
0.3218056, 0.5568797, 1.207748, 0, 0.2039216, 1, 1,
0.3237105, 1.028565, -0.5723568, 0, 0.1960784, 1, 1,
0.3254432, -0.4848084, 3.196035, 0, 0.1882353, 1, 1,
0.326745, -0.3645706, 2.575888, 0, 0.1843137, 1, 1,
0.328898, 0.8692114, -1.729819, 0, 0.1764706, 1, 1,
0.3289331, -0.2187684, 2.806413, 0, 0.172549, 1, 1,
0.3291043, 0.8332265, 1.766387, 0, 0.1647059, 1, 1,
0.3303086, -0.01050615, 2.244388, 0, 0.1607843, 1, 1,
0.3376361, 0.7490711, 2.764791, 0, 0.1529412, 1, 1,
0.3389555, -0.17459, 3.741087, 0, 0.1490196, 1, 1,
0.3449733, -0.7934634, 3.255889, 0, 0.1411765, 1, 1,
0.3455783, -0.048584, 2.408455, 0, 0.1372549, 1, 1,
0.3455934, -0.6035597, 2.396223, 0, 0.1294118, 1, 1,
0.3470437, -0.1722041, 2.851814, 0, 0.1254902, 1, 1,
0.3490594, -0.8135002, 3.333004, 0, 0.1176471, 1, 1,
0.3547246, -0.4230382, 1.194726, 0, 0.1137255, 1, 1,
0.3587661, 0.03031823, 2.26646, 0, 0.1058824, 1, 1,
0.3604294, -0.07839304, 1.847227, 0, 0.09803922, 1, 1,
0.3640288, -1.068328, 3.596287, 0, 0.09411765, 1, 1,
0.3646376, -1.768023, 2.925606, 0, 0.08627451, 1, 1,
0.3682496, 0.8365681, 1.914495, 0, 0.08235294, 1, 1,
0.3748127, -1.166174, 1.626873, 0, 0.07450981, 1, 1,
0.3775709, -0.5636369, 2.886334, 0, 0.07058824, 1, 1,
0.3803865, 1.70862, 0.08785269, 0, 0.0627451, 1, 1,
0.38782, 3.478339, 0.7007357, 0, 0.05882353, 1, 1,
0.3885498, -0.7993382, 0.5943766, 0, 0.05098039, 1, 1,
0.392906, 1.67257, 0.7754835, 0, 0.04705882, 1, 1,
0.3986413, -2.795552, 2.685622, 0, 0.03921569, 1, 1,
0.3986776, 0.460614, 1.663172, 0, 0.03529412, 1, 1,
0.4016339, -0.2600865, 2.793553, 0, 0.02745098, 1, 1,
0.4061346, 0.1058622, 0.4559643, 0, 0.02352941, 1, 1,
0.4077887, 1.058378, 1.564157, 0, 0.01568628, 1, 1,
0.4083941, 0.283405, 1.044386, 0, 0.01176471, 1, 1,
0.4085723, 0.6774086, 1.677948, 0, 0.003921569, 1, 1,
0.4153126, -0.4988901, 0.9710668, 0.003921569, 0, 1, 1,
0.4156032, -1.082411, 3.079745, 0.007843138, 0, 1, 1,
0.416623, 0.2116585, 2.249655, 0.01568628, 0, 1, 1,
0.4189107, -0.3101118, 1.435244, 0.01960784, 0, 1, 1,
0.4190904, 1.449629, 0.4996626, 0.02745098, 0, 1, 1,
0.4274401, -0.2023664, 1.322216, 0.03137255, 0, 1, 1,
0.4310807, 0.8017629, 1.062587, 0.03921569, 0, 1, 1,
0.4362216, 1.675076, -1.127449, 0.04313726, 0, 1, 1,
0.4367172, 1.195683, 0.1154434, 0.05098039, 0, 1, 1,
0.4377182, 0.5681131, 2.014818, 0.05490196, 0, 1, 1,
0.4380031, 0.3351087, 0.6962417, 0.0627451, 0, 1, 1,
0.4396965, 1.441834, 0.3176301, 0.06666667, 0, 1, 1,
0.4429374, 0.5991626, 1.020935, 0.07450981, 0, 1, 1,
0.445351, -1.191277, 1.750608, 0.07843138, 0, 1, 1,
0.448994, 0.02553843, 1.243572, 0.08627451, 0, 1, 1,
0.4512646, -0.7826788, 2.50741, 0.09019608, 0, 1, 1,
0.4551216, 0.3279622, 1.445684, 0.09803922, 0, 1, 1,
0.4575673, -0.4644127, 3.529759, 0.1058824, 0, 1, 1,
0.4608337, -0.4053603, 2.595547, 0.1098039, 0, 1, 1,
0.4680169, 1.252521, 0.2747859, 0.1176471, 0, 1, 1,
0.4700187, 0.3667461, 2.193258, 0.1215686, 0, 1, 1,
0.471653, -0.3053989, 3.594923, 0.1294118, 0, 1, 1,
0.4729059, -0.4747654, 1.710408, 0.1333333, 0, 1, 1,
0.4750535, -0.9361624, 3.977952, 0.1411765, 0, 1, 1,
0.4801963, -1.081132, 2.369605, 0.145098, 0, 1, 1,
0.4831439, -0.239168, 2.841067, 0.1529412, 0, 1, 1,
0.4879029, -0.8272249, 1.26186, 0.1568628, 0, 1, 1,
0.4883872, -0.427529, 2.775819, 0.1647059, 0, 1, 1,
0.4885753, -0.6141926, 1.522078, 0.1686275, 0, 1, 1,
0.4933518, -0.3327471, 1.346007, 0.1764706, 0, 1, 1,
0.4953542, 1.737329, -0.3338388, 0.1803922, 0, 1, 1,
0.4964622, -0.5022887, 2.109075, 0.1882353, 0, 1, 1,
0.497079, -0.2879502, 3.825944, 0.1921569, 0, 1, 1,
0.4981843, 0.139589, 1.050568, 0.2, 0, 1, 1,
0.499658, -1.457179, 2.374092, 0.2078431, 0, 1, 1,
0.5023954, -0.1295362, 1.7866, 0.2117647, 0, 1, 1,
0.5072066, 0.008936546, 3.870447, 0.2196078, 0, 1, 1,
0.5088574, 0.6057511, -0.08847117, 0.2235294, 0, 1, 1,
0.5130987, 0.8094392, 0.9609829, 0.2313726, 0, 1, 1,
0.5176625, -1.017789, 4.260509, 0.2352941, 0, 1, 1,
0.5197209, 0.8772104, 0.5180603, 0.2431373, 0, 1, 1,
0.5201985, -1.105293, 2.828615, 0.2470588, 0, 1, 1,
0.5234621, -0.7529913, 3.626662, 0.254902, 0, 1, 1,
0.5260718, -0.3446265, 0.2067696, 0.2588235, 0, 1, 1,
0.5267676, 1.249125, -0.2110367, 0.2666667, 0, 1, 1,
0.5276128, 1.098623, 0.03656264, 0.2705882, 0, 1, 1,
0.528752, 1.193547, 2.588247, 0.2784314, 0, 1, 1,
0.5366101, 0.5942631, 1.41701, 0.282353, 0, 1, 1,
0.5379071, -0.0936335, 1.836578, 0.2901961, 0, 1, 1,
0.5382419, -0.521811, 2.427926, 0.2941177, 0, 1, 1,
0.542116, -0.5201653, 4.119803, 0.3019608, 0, 1, 1,
0.542634, -0.1930294, 0.7273172, 0.3098039, 0, 1, 1,
0.5444146, -0.8832588, 1.296196, 0.3137255, 0, 1, 1,
0.5444365, -0.5735988, 2.636846, 0.3215686, 0, 1, 1,
0.5454414, -2.039436, 2.939547, 0.3254902, 0, 1, 1,
0.5493171, -0.8529252, 3.078409, 0.3333333, 0, 1, 1,
0.5506659, -0.4931986, 2.544746, 0.3372549, 0, 1, 1,
0.5512298, -0.2020059, 0.9415792, 0.345098, 0, 1, 1,
0.5529612, 0.49036, 1.749861, 0.3490196, 0, 1, 1,
0.5539911, 1.750818, 1.388781, 0.3568628, 0, 1, 1,
0.556643, 0.4411807, -0.9625122, 0.3607843, 0, 1, 1,
0.5594024, 1.171095, -1.663444, 0.3686275, 0, 1, 1,
0.5596748, 0.1750706, 1.159123, 0.372549, 0, 1, 1,
0.5610287, 0.3771442, -0.6854702, 0.3803922, 0, 1, 1,
0.5652266, 1.616089, -0.7057367, 0.3843137, 0, 1, 1,
0.5658969, 0.408917, 2.328307, 0.3921569, 0, 1, 1,
0.5672409, -0.3597845, 2.848051, 0.3960784, 0, 1, 1,
0.5741138, 0.9484683, -0.1428864, 0.4039216, 0, 1, 1,
0.5785964, -0.00590415, 0.871646, 0.4117647, 0, 1, 1,
0.5788512, 0.3380656, 1.578125, 0.4156863, 0, 1, 1,
0.5817887, 2.082483, 1.272032, 0.4235294, 0, 1, 1,
0.5829101, -2.448438, 4.664066, 0.427451, 0, 1, 1,
0.5835707, -0.2628286, 2.603877, 0.4352941, 0, 1, 1,
0.5852409, -1.059499, 2.111596, 0.4392157, 0, 1, 1,
0.5862327, -1.37285, 2.760798, 0.4470588, 0, 1, 1,
0.5863004, -0.5891642, 1.556058, 0.4509804, 0, 1, 1,
0.5888878, 0.5321823, 2.640429, 0.4588235, 0, 1, 1,
0.5902521, 1.735566, 0.2906619, 0.4627451, 0, 1, 1,
0.59071, -0.3698881, 2.239637, 0.4705882, 0, 1, 1,
0.593236, 0.04060811, 0.7934648, 0.4745098, 0, 1, 1,
0.6023237, -1.222923, 1.772534, 0.4823529, 0, 1, 1,
0.6055983, 0.4692928, 0.4191738, 0.4862745, 0, 1, 1,
0.6075718, -0.07541043, -0.007896471, 0.4941176, 0, 1, 1,
0.6126759, 0.8691587, 1.243393, 0.5019608, 0, 1, 1,
0.6163419, -0.3226923, 2.537277, 0.5058824, 0, 1, 1,
0.6227399, -0.4063729, 2.927322, 0.5137255, 0, 1, 1,
0.6238726, 0.5524008, -0.02091804, 0.5176471, 0, 1, 1,
0.630924, -0.1577043, 2.672578, 0.5254902, 0, 1, 1,
0.6348889, -1.292635, 2.329552, 0.5294118, 0, 1, 1,
0.6351855, 0.4974571, -0.6905169, 0.5372549, 0, 1, 1,
0.6424507, 1.535946, -0.6395755, 0.5411765, 0, 1, 1,
0.6428744, 1.773512, 1.465075, 0.5490196, 0, 1, 1,
0.6437747, 0.1851378, 0.1926734, 0.5529412, 0, 1, 1,
0.6467079, -0.9337932, 2.775322, 0.5607843, 0, 1, 1,
0.6470605, -1.229736, 4.583173, 0.5647059, 0, 1, 1,
0.6489875, 0.8299553, 1.808013, 0.572549, 0, 1, 1,
0.6504133, 1.233344, 1.549236, 0.5764706, 0, 1, 1,
0.651055, -0.8343663, 3.906153, 0.5843138, 0, 1, 1,
0.6515027, 1.599625, 1.055709, 0.5882353, 0, 1, 1,
0.6529518, 0.3167787, 1.936833, 0.5960785, 0, 1, 1,
0.6547881, 0.9285361, -0.5494866, 0.6039216, 0, 1, 1,
0.6562892, 1.657096, -0.7317538, 0.6078432, 0, 1, 1,
0.6585652, 1.610863, 0.5008702, 0.6156863, 0, 1, 1,
0.6626646, -0.8598659, 2.200541, 0.6196079, 0, 1, 1,
0.6705775, -0.5731664, 1.253944, 0.627451, 0, 1, 1,
0.6713467, -0.6488843, 3.045877, 0.6313726, 0, 1, 1,
0.6722987, -1.490395, 2.858196, 0.6392157, 0, 1, 1,
0.6723716, 1.177519, -0.008634151, 0.6431373, 0, 1, 1,
0.6727796, -0.1008041, 2.836826, 0.6509804, 0, 1, 1,
0.6753361, 0.4074868, 0.4447065, 0.654902, 0, 1, 1,
0.6767701, -0.2220813, 1.70321, 0.6627451, 0, 1, 1,
0.6773966, 0.9409257, 0.7324371, 0.6666667, 0, 1, 1,
0.6789038, 0.02036291, 0.9100727, 0.6745098, 0, 1, 1,
0.6799292, 1.055487, -0.5927925, 0.6784314, 0, 1, 1,
0.6812317, 0.5094821, 0.2712384, 0.6862745, 0, 1, 1,
0.6950691, 0.1453954, 1.096945, 0.6901961, 0, 1, 1,
0.7031301, -0.7651597, 1.808656, 0.6980392, 0, 1, 1,
0.7032703, 0.9074602, -1.380109, 0.7058824, 0, 1, 1,
0.7121065, 2.889943, -0.06005322, 0.7098039, 0, 1, 1,
0.7146184, 0.01875867, 0.7025562, 0.7176471, 0, 1, 1,
0.7234424, 0.3821667, 1.242244, 0.7215686, 0, 1, 1,
0.724622, 0.2233258, 1.452445, 0.7294118, 0, 1, 1,
0.7279295, 0.4444883, 2.158639, 0.7333333, 0, 1, 1,
0.729691, 1.247165, 0.4109912, 0.7411765, 0, 1, 1,
0.7306706, 0.4537759, 0.4034823, 0.7450981, 0, 1, 1,
0.7362593, 0.7590086, 0.4165255, 0.7529412, 0, 1, 1,
0.7386276, -0.2303182, -0.05395642, 0.7568628, 0, 1, 1,
0.7395183, -0.2417867, 2.070566, 0.7647059, 0, 1, 1,
0.7434931, -0.3628186, 5.12371, 0.7686275, 0, 1, 1,
0.750941, -0.4204244, 1.834615, 0.7764706, 0, 1, 1,
0.7542443, 0.05002125, 0.984396, 0.7803922, 0, 1, 1,
0.7647834, 0.1020017, -0.2111786, 0.7882353, 0, 1, 1,
0.7684019, 0.471002, 0.8291968, 0.7921569, 0, 1, 1,
0.7713195, -1.20249, 3.852476, 0.8, 0, 1, 1,
0.7720605, 0.6005161, 1.20606, 0.8078431, 0, 1, 1,
0.7756304, -1.23128, 3.094872, 0.8117647, 0, 1, 1,
0.7790316, 0.4890032, 2.747599, 0.8196079, 0, 1, 1,
0.783775, -0.861742, 2.472122, 0.8235294, 0, 1, 1,
0.7868159, 0.732745, 0.4326927, 0.8313726, 0, 1, 1,
0.7934356, 1.957648, 0.8579763, 0.8352941, 0, 1, 1,
0.7954993, 0.667723, 1.667417, 0.8431373, 0, 1, 1,
0.7988545, 1.65698, -0.4258432, 0.8470588, 0, 1, 1,
0.8060464, -0.1932883, 1.87675, 0.854902, 0, 1, 1,
0.81103, -0.5062191, 2.210588, 0.8588235, 0, 1, 1,
0.8173246, 0.3678953, 0.6211057, 0.8666667, 0, 1, 1,
0.8195767, -0.02325047, 2.602313, 0.8705882, 0, 1, 1,
0.8226256, -0.2530053, 1.038352, 0.8784314, 0, 1, 1,
0.8306423, 0.1855976, 1.075897, 0.8823529, 0, 1, 1,
0.8307117, 1.079831, -0.4399288, 0.8901961, 0, 1, 1,
0.8366597, 1.13066, 1.198148, 0.8941177, 0, 1, 1,
0.8397068, -0.8869759, 3.699702, 0.9019608, 0, 1, 1,
0.8405383, 0.2544489, 0.1646667, 0.9098039, 0, 1, 1,
0.8425723, -0.8515597, 2.425304, 0.9137255, 0, 1, 1,
0.8444938, -0.5711728, 2.324916, 0.9215686, 0, 1, 1,
0.8451185, 0.8151215, 0.5019755, 0.9254902, 0, 1, 1,
0.8500382, 0.4148269, 0.6242595, 0.9333333, 0, 1, 1,
0.8544025, 0.1089628, 2.423826, 0.9372549, 0, 1, 1,
0.8545024, 2.198602, 0.502176, 0.945098, 0, 1, 1,
0.8634197, 0.7642446, -0.1606022, 0.9490196, 0, 1, 1,
0.8636665, 0.8740141, 1.577276, 0.9568627, 0, 1, 1,
0.8645062, 1.518277, 2.566254, 0.9607843, 0, 1, 1,
0.8760371, 1.15324, 0.209162, 0.9686275, 0, 1, 1,
0.8795027, 0.9452077, -0.90831, 0.972549, 0, 1, 1,
0.8925927, 0.8759426, 1.619322, 0.9803922, 0, 1, 1,
0.8962836, -1.070281, 2.145856, 0.9843137, 0, 1, 1,
0.9028319, -0.159744, 3.247319, 0.9921569, 0, 1, 1,
0.9064689, -0.1205981, 2.33152, 0.9960784, 0, 1, 1,
0.9070355, 0.1343465, 2.774522, 1, 0, 0.9960784, 1,
0.9248011, 0.1379433, -0.09619177, 1, 0, 0.9882353, 1,
0.9362644, -0.1268001, 1.504161, 1, 0, 0.9843137, 1,
0.9500733, 1.241606, -0.6403987, 1, 0, 0.9764706, 1,
0.9518876, 0.546993, 1.598873, 1, 0, 0.972549, 1,
0.9528779, -0.9688835, 1.105951, 1, 0, 0.9647059, 1,
0.9536647, 0.9639177, 0.9418899, 1, 0, 0.9607843, 1,
0.9595814, 1.701219, 0.6324854, 1, 0, 0.9529412, 1,
0.9874363, 0.267559, 2.237105, 1, 0, 0.9490196, 1,
0.9944074, -0.7701224, 3.901194, 1, 0, 0.9411765, 1,
0.9981754, 0.09705386, 2.119898, 1, 0, 0.9372549, 1,
1.001692, -0.9088625, 2.48725, 1, 0, 0.9294118, 1,
1.00265, 2.410513, 0.2894119, 1, 0, 0.9254902, 1,
1.008718, 1.148818, -0.218515, 1, 0, 0.9176471, 1,
1.017581, -1.355036, 4.657679, 1, 0, 0.9137255, 1,
1.021376, 0.4421691, 0.9306771, 1, 0, 0.9058824, 1,
1.023989, 0.8345749, 1.631195, 1, 0, 0.9019608, 1,
1.024855, 0.4830193, 1.659555, 1, 0, 0.8941177, 1,
1.043383, 0.195879, 2.042429, 1, 0, 0.8862745, 1,
1.045334, 0.9032189, 1.594547, 1, 0, 0.8823529, 1,
1.045773, -0.5520692, 2.674554, 1, 0, 0.8745098, 1,
1.046778, -1.030351, 2.58168, 1, 0, 0.8705882, 1,
1.050494, -0.5334535, 2.049807, 1, 0, 0.8627451, 1,
1.051888, 0.09022537, 0.6679584, 1, 0, 0.8588235, 1,
1.052545, -0.4045821, 1.584602, 1, 0, 0.8509804, 1,
1.058401, 1.059173, 0.223353, 1, 0, 0.8470588, 1,
1.058798, 1.628236, 1.509021, 1, 0, 0.8392157, 1,
1.061114, -0.7146714, 2.036599, 1, 0, 0.8352941, 1,
1.066598, 1.175356, 1.534356, 1, 0, 0.827451, 1,
1.072374, -1.053941, 3.735711, 1, 0, 0.8235294, 1,
1.088426, 0.8800332, 2.205755, 1, 0, 0.8156863, 1,
1.092462, 0.129466, 0.2200187, 1, 0, 0.8117647, 1,
1.110791, 0.1651476, 1.049104, 1, 0, 0.8039216, 1,
1.111122, 0.5574328, 1.735798, 1, 0, 0.7960784, 1,
1.130204, 0.2343378, 0.5592013, 1, 0, 0.7921569, 1,
1.130447, -1.140337, 1.443058, 1, 0, 0.7843137, 1,
1.138234, -0.5801144, 3.667705, 1, 0, 0.7803922, 1,
1.138399, -0.2213728, 0.3951882, 1, 0, 0.772549, 1,
1.150461, -0.2288272, 1.756076, 1, 0, 0.7686275, 1,
1.151537, -0.4897627, 2.271778, 1, 0, 0.7607843, 1,
1.156191, 0.3808608, 0.650422, 1, 0, 0.7568628, 1,
1.157134, 0.2958941, 1.159534, 1, 0, 0.7490196, 1,
1.161092, -0.5578689, 1.836544, 1, 0, 0.7450981, 1,
1.164034, 0.270261, 1.723095, 1, 0, 0.7372549, 1,
1.167052, 0.07975981, 1.779995, 1, 0, 0.7333333, 1,
1.176583, -0.262697, 1.288346, 1, 0, 0.7254902, 1,
1.177722, -0.6604394, 0.389619, 1, 0, 0.7215686, 1,
1.18309, -1.053842, 2.21356, 1, 0, 0.7137255, 1,
1.185948, -0.4987554, 1.099685, 1, 0, 0.7098039, 1,
1.188991, -0.2741249, -0.07454059, 1, 0, 0.7019608, 1,
1.189927, -1.46887, 3.311536, 1, 0, 0.6941177, 1,
1.200642, 0.5674195, 1.714699, 1, 0, 0.6901961, 1,
1.201348, -0.905412, 2.988133, 1, 0, 0.682353, 1,
1.201568, 0.08354525, 3.721323, 1, 0, 0.6784314, 1,
1.203696, 0.09513742, 1.144866, 1, 0, 0.6705883, 1,
1.206682, 1.379255, 0.5910458, 1, 0, 0.6666667, 1,
1.208799, -0.8868099, 1.932039, 1, 0, 0.6588235, 1,
1.213841, 0.106732, 1.772843, 1, 0, 0.654902, 1,
1.214469, 1.681558, 0.58027, 1, 0, 0.6470588, 1,
1.225623, -0.2631033, 2.274336, 1, 0, 0.6431373, 1,
1.225917, -0.7240801, 1.393841, 1, 0, 0.6352941, 1,
1.234746, -0.2841034, 2.672916, 1, 0, 0.6313726, 1,
1.235544, -0.3738549, 2.521824, 1, 0, 0.6235294, 1,
1.235777, 2.323752, -0.1602204, 1, 0, 0.6196079, 1,
1.239698, 2.338886, 0.2228565, 1, 0, 0.6117647, 1,
1.24164, 0.7021757, 0.6868491, 1, 0, 0.6078432, 1,
1.243951, 0.9190206, -0.09459231, 1, 0, 0.6, 1,
1.251558, 0.7255916, 1.944985, 1, 0, 0.5921569, 1,
1.261241, -0.849331, 1.183909, 1, 0, 0.5882353, 1,
1.274932, 0.1725602, 0.6944085, 1, 0, 0.5803922, 1,
1.281564, -0.3823822, 1.268821, 1, 0, 0.5764706, 1,
1.291854, -0.4595533, 1.731155, 1, 0, 0.5686275, 1,
1.298265, 0.9960943, 2.630677, 1, 0, 0.5647059, 1,
1.300923, 1.049008, 1.441925, 1, 0, 0.5568628, 1,
1.315398, -0.5304515, 1.173737, 1, 0, 0.5529412, 1,
1.32326, 0.4916865, 2.060737, 1, 0, 0.5450981, 1,
1.33289, 0.2068557, 0.7969548, 1, 0, 0.5411765, 1,
1.340297, 0.5674249, 1.880495, 1, 0, 0.5333334, 1,
1.345374, 0.1301186, 2.532239, 1, 0, 0.5294118, 1,
1.346667, 0.7313033, 2.919148, 1, 0, 0.5215687, 1,
1.347406, -0.2662227, 2.509904, 1, 0, 0.5176471, 1,
1.350837, -0.9377397, 4.473368, 1, 0, 0.509804, 1,
1.360635, -0.2241104, 1.371328, 1, 0, 0.5058824, 1,
1.361673, 0.7343585, -0.27286, 1, 0, 0.4980392, 1,
1.364229, 0.3049489, 3.723714, 1, 0, 0.4901961, 1,
1.380561, 1.157554, 1.819247, 1, 0, 0.4862745, 1,
1.391923, -0.3776878, 2.700402, 1, 0, 0.4784314, 1,
1.393559, -0.03446174, 1.867549, 1, 0, 0.4745098, 1,
1.406729, -0.6765095, 2.382627, 1, 0, 0.4666667, 1,
1.413177, 0.6972713, -0.5910051, 1, 0, 0.4627451, 1,
1.450235, 0.104964, 3.348547, 1, 0, 0.454902, 1,
1.454265, 1.138247, 1.462631, 1, 0, 0.4509804, 1,
1.455456, -0.2879467, 0.7660522, 1, 0, 0.4431373, 1,
1.462404, -1.215504, 2.562158, 1, 0, 0.4392157, 1,
1.465015, -2.513822, 1.593485, 1, 0, 0.4313726, 1,
1.466866, -1.700391, 1.623595, 1, 0, 0.427451, 1,
1.485042, -1.815219, 3.607517, 1, 0, 0.4196078, 1,
1.486564, -0.8253662, 1.77639, 1, 0, 0.4156863, 1,
1.487658, 1.104603, -0.02843226, 1, 0, 0.4078431, 1,
1.49537, -0.4262664, 2.954491, 1, 0, 0.4039216, 1,
1.496595, 0.7941421, 2.428514, 1, 0, 0.3960784, 1,
1.498168, 0.7520521, 0.7142903, 1, 0, 0.3882353, 1,
1.511528, -0.2685943, 1.552455, 1, 0, 0.3843137, 1,
1.514385, -1.496497, 1.582666, 1, 0, 0.3764706, 1,
1.526446, 1.488804, -0.02230792, 1, 0, 0.372549, 1,
1.528422, -0.6125776, 3.418287, 1, 0, 0.3647059, 1,
1.529376, 0.8351991, 1.963603, 1, 0, 0.3607843, 1,
1.535483, 0.6589859, 0.18327, 1, 0, 0.3529412, 1,
1.547059, -1.104136, 0.4615549, 1, 0, 0.3490196, 1,
1.548646, -0.1921833, 0.6260761, 1, 0, 0.3411765, 1,
1.550633, -1.598653, 1.14554, 1, 0, 0.3372549, 1,
1.552696, 0.8631509, 0.3131422, 1, 0, 0.3294118, 1,
1.552708, 0.9997949, 0.9369139, 1, 0, 0.3254902, 1,
1.571174, 0.1005176, 2.587043, 1, 0, 0.3176471, 1,
1.572372, 1.824434, 1.226923, 1, 0, 0.3137255, 1,
1.577256, -0.8444561, 2.48527, 1, 0, 0.3058824, 1,
1.584626, -0.4178082, 2.534072, 1, 0, 0.2980392, 1,
1.588015, 0.879538, 2.153028, 1, 0, 0.2941177, 1,
1.595028, 0.1637363, 2.108028, 1, 0, 0.2862745, 1,
1.598467, -0.5977708, 2.804645, 1, 0, 0.282353, 1,
1.600974, -0.8558449, 3.09222, 1, 0, 0.2745098, 1,
1.607062, -0.06949586, 2.243168, 1, 0, 0.2705882, 1,
1.638266, -1.105838, 1.44536, 1, 0, 0.2627451, 1,
1.649674, 1.751668, 0.5743505, 1, 0, 0.2588235, 1,
1.694845, -0.08171334, 2.310314, 1, 0, 0.2509804, 1,
1.704699, 0.1538049, 0.7297996, 1, 0, 0.2470588, 1,
1.710086, -1.374067, 1.614298, 1, 0, 0.2392157, 1,
1.723046, 0.1983209, -0.8063844, 1, 0, 0.2352941, 1,
1.725771, -0.7461807, 1.973978, 1, 0, 0.227451, 1,
1.738378, 1.317479, -0.08104153, 1, 0, 0.2235294, 1,
1.740676, -0.7651244, -0.2655671, 1, 0, 0.2156863, 1,
1.741577, -1.621585, 1.34855, 1, 0, 0.2117647, 1,
1.743734, 0.3866225, 2.343773, 1, 0, 0.2039216, 1,
1.747132, -0.154314, 2.231133, 1, 0, 0.1960784, 1,
1.768757, -0.1991663, 2.366441, 1, 0, 0.1921569, 1,
1.779154, -0.686898, -0.3218985, 1, 0, 0.1843137, 1,
1.782392, -2.177289, 3.813833, 1, 0, 0.1803922, 1,
1.797965, 0.7843257, 0.1452584, 1, 0, 0.172549, 1,
1.84374, 2.142703, 0.6547253, 1, 0, 0.1686275, 1,
1.84955, -0.1080784, 2.206118, 1, 0, 0.1607843, 1,
1.865206, 1.84482, 0.4883535, 1, 0, 0.1568628, 1,
1.875364, -1.422656, 2.008067, 1, 0, 0.1490196, 1,
1.912995, 1.577057, 0.9213063, 1, 0, 0.145098, 1,
1.965486, -0.8515075, 2.263489, 1, 0, 0.1372549, 1,
1.984749, -0.2444635, 3.739357, 1, 0, 0.1333333, 1,
2.001471, 0.4531666, 2.072088, 1, 0, 0.1254902, 1,
2.004532, 0.6118736, 3.021919, 1, 0, 0.1215686, 1,
2.024003, 0.0002121395, 0.7017393, 1, 0, 0.1137255, 1,
2.036581, 0.6618462, 1.260266, 1, 0, 0.1098039, 1,
2.04742, -0.06626804, 2.151775, 1, 0, 0.1019608, 1,
2.052416, -0.08274645, 0.2612234, 1, 0, 0.09411765, 1,
2.05399, -0.05367494, 1.841041, 1, 0, 0.09019608, 1,
2.057412, -0.3057778, 1.097468, 1, 0, 0.08235294, 1,
2.072603, 1.873485, 1.736189, 1, 0, 0.07843138, 1,
2.076007, 0.6907836, 0.2991937, 1, 0, 0.07058824, 1,
2.15378, -0.7394061, 2.235594, 1, 0, 0.06666667, 1,
2.352531, -2.508057, 1.596113, 1, 0, 0.05882353, 1,
2.361947, 0.6052844, 0.05615759, 1, 0, 0.05490196, 1,
2.402611, -0.332019, -0.0393225, 1, 0, 0.04705882, 1,
2.421214, -0.7604693, 2.595972, 1, 0, 0.04313726, 1,
2.465074, -0.723559, 3.957354, 1, 0, 0.03529412, 1,
2.542457, -1.524201, 1.132801, 1, 0, 0.03137255, 1,
2.651572, -0.3662595, 2.590399, 1, 0, 0.02352941, 1,
2.991579, -1.338469, 2.359798, 1, 0, 0.01960784, 1,
3.0383, 1.055675, 0.6777036, 1, 0, 0.01176471, 1,
3.068144, -0.5849541, 1.729046, 1, 0, 0.007843138, 1
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
-0.3274658, -3.867796, -6.898077, 0, -0.5, 0.5, 0.5,
-0.3274658, -3.867796, -6.898077, 1, -0.5, 0.5, 0.5,
-0.3274658, -3.867796, -6.898077, 1, 1.5, 0.5, 0.5,
-0.3274658, -3.867796, -6.898077, 0, 1.5, 0.5, 0.5
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
-4.874187, 0.3674114, -6.898077, 0, -0.5, 0.5, 0.5,
-4.874187, 0.3674114, -6.898077, 1, -0.5, 0.5, 0.5,
-4.874187, 0.3674114, -6.898077, 1, 1.5, 0.5, 0.5,
-4.874187, 0.3674114, -6.898077, 0, 1.5, 0.5, 0.5
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
-4.874187, -3.867796, 0.2960951, 0, -0.5, 0.5, 0.5,
-4.874187, -3.867796, 0.2960951, 1, -0.5, 0.5, 0.5,
-4.874187, -3.867796, 0.2960951, 1, 1.5, 0.5, 0.5,
-4.874187, -3.867796, 0.2960951, 0, 1.5, 0.5, 0.5
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
-3, -2.89044, -5.237883,
3, -2.89044, -5.237883,
-3, -2.89044, -5.237883,
-3, -3.053333, -5.514582,
-2, -2.89044, -5.237883,
-2, -3.053333, -5.514582,
-1, -2.89044, -5.237883,
-1, -3.053333, -5.514582,
0, -2.89044, -5.237883,
0, -3.053333, -5.514582,
1, -2.89044, -5.237883,
1, -3.053333, -5.514582,
2, -2.89044, -5.237883,
2, -3.053333, -5.514582,
3, -2.89044, -5.237883,
3, -3.053333, -5.514582
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
-3, -3.379118, -6.06798, 0, -0.5, 0.5, 0.5,
-3, -3.379118, -6.06798, 1, -0.5, 0.5, 0.5,
-3, -3.379118, -6.06798, 1, 1.5, 0.5, 0.5,
-3, -3.379118, -6.06798, 0, 1.5, 0.5, 0.5,
-2, -3.379118, -6.06798, 0, -0.5, 0.5, 0.5,
-2, -3.379118, -6.06798, 1, -0.5, 0.5, 0.5,
-2, -3.379118, -6.06798, 1, 1.5, 0.5, 0.5,
-2, -3.379118, -6.06798, 0, 1.5, 0.5, 0.5,
-1, -3.379118, -6.06798, 0, -0.5, 0.5, 0.5,
-1, -3.379118, -6.06798, 1, -0.5, 0.5, 0.5,
-1, -3.379118, -6.06798, 1, 1.5, 0.5, 0.5,
-1, -3.379118, -6.06798, 0, 1.5, 0.5, 0.5,
0, -3.379118, -6.06798, 0, -0.5, 0.5, 0.5,
0, -3.379118, -6.06798, 1, -0.5, 0.5, 0.5,
0, -3.379118, -6.06798, 1, 1.5, 0.5, 0.5,
0, -3.379118, -6.06798, 0, 1.5, 0.5, 0.5,
1, -3.379118, -6.06798, 0, -0.5, 0.5, 0.5,
1, -3.379118, -6.06798, 1, -0.5, 0.5, 0.5,
1, -3.379118, -6.06798, 1, 1.5, 0.5, 0.5,
1, -3.379118, -6.06798, 0, 1.5, 0.5, 0.5,
2, -3.379118, -6.06798, 0, -0.5, 0.5, 0.5,
2, -3.379118, -6.06798, 1, -0.5, 0.5, 0.5,
2, -3.379118, -6.06798, 1, 1.5, 0.5, 0.5,
2, -3.379118, -6.06798, 0, 1.5, 0.5, 0.5,
3, -3.379118, -6.06798, 0, -0.5, 0.5, 0.5,
3, -3.379118, -6.06798, 1, -0.5, 0.5, 0.5,
3, -3.379118, -6.06798, 1, 1.5, 0.5, 0.5,
3, -3.379118, -6.06798, 0, 1.5, 0.5, 0.5
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
-3.824944, -2, -5.237883,
-3.824944, 3, -5.237883,
-3.824944, -2, -5.237883,
-3.999818, -2, -5.514582,
-3.824944, -1, -5.237883,
-3.999818, -1, -5.514582,
-3.824944, 0, -5.237883,
-3.999818, 0, -5.514582,
-3.824944, 1, -5.237883,
-3.999818, 1, -5.514582,
-3.824944, 2, -5.237883,
-3.999818, 2, -5.514582,
-3.824944, 3, -5.237883,
-3.999818, 3, -5.514582
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
-4.349566, -2, -6.06798, 0, -0.5, 0.5, 0.5,
-4.349566, -2, -6.06798, 1, -0.5, 0.5, 0.5,
-4.349566, -2, -6.06798, 1, 1.5, 0.5, 0.5,
-4.349566, -2, -6.06798, 0, 1.5, 0.5, 0.5,
-4.349566, -1, -6.06798, 0, -0.5, 0.5, 0.5,
-4.349566, -1, -6.06798, 1, -0.5, 0.5, 0.5,
-4.349566, -1, -6.06798, 1, 1.5, 0.5, 0.5,
-4.349566, -1, -6.06798, 0, 1.5, 0.5, 0.5,
-4.349566, 0, -6.06798, 0, -0.5, 0.5, 0.5,
-4.349566, 0, -6.06798, 1, -0.5, 0.5, 0.5,
-4.349566, 0, -6.06798, 1, 1.5, 0.5, 0.5,
-4.349566, 0, -6.06798, 0, 1.5, 0.5, 0.5,
-4.349566, 1, -6.06798, 0, -0.5, 0.5, 0.5,
-4.349566, 1, -6.06798, 1, -0.5, 0.5, 0.5,
-4.349566, 1, -6.06798, 1, 1.5, 0.5, 0.5,
-4.349566, 1, -6.06798, 0, 1.5, 0.5, 0.5,
-4.349566, 2, -6.06798, 0, -0.5, 0.5, 0.5,
-4.349566, 2, -6.06798, 1, -0.5, 0.5, 0.5,
-4.349566, 2, -6.06798, 1, 1.5, 0.5, 0.5,
-4.349566, 2, -6.06798, 0, 1.5, 0.5, 0.5,
-4.349566, 3, -6.06798, 0, -0.5, 0.5, 0.5,
-4.349566, 3, -6.06798, 1, -0.5, 0.5, 0.5,
-4.349566, 3, -6.06798, 1, 1.5, 0.5, 0.5,
-4.349566, 3, -6.06798, 0, 1.5, 0.5, 0.5
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
-3.824944, -2.89044, -4,
-3.824944, -2.89044, 4,
-3.824944, -2.89044, -4,
-3.999818, -3.053333, -4,
-3.824944, -2.89044, -2,
-3.999818, -3.053333, -2,
-3.824944, -2.89044, 0,
-3.999818, -3.053333, 0,
-3.824944, -2.89044, 2,
-3.999818, -3.053333, 2,
-3.824944, -2.89044, 4,
-3.999818, -3.053333, 4
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
-4.349566, -3.379118, -4, 0, -0.5, 0.5, 0.5,
-4.349566, -3.379118, -4, 1, -0.5, 0.5, 0.5,
-4.349566, -3.379118, -4, 1, 1.5, 0.5, 0.5,
-4.349566, -3.379118, -4, 0, 1.5, 0.5, 0.5,
-4.349566, -3.379118, -2, 0, -0.5, 0.5, 0.5,
-4.349566, -3.379118, -2, 1, -0.5, 0.5, 0.5,
-4.349566, -3.379118, -2, 1, 1.5, 0.5, 0.5,
-4.349566, -3.379118, -2, 0, 1.5, 0.5, 0.5,
-4.349566, -3.379118, 0, 0, -0.5, 0.5, 0.5,
-4.349566, -3.379118, 0, 1, -0.5, 0.5, 0.5,
-4.349566, -3.379118, 0, 1, 1.5, 0.5, 0.5,
-4.349566, -3.379118, 0, 0, 1.5, 0.5, 0.5,
-4.349566, -3.379118, 2, 0, -0.5, 0.5, 0.5,
-4.349566, -3.379118, 2, 1, -0.5, 0.5, 0.5,
-4.349566, -3.379118, 2, 1, 1.5, 0.5, 0.5,
-4.349566, -3.379118, 2, 0, 1.5, 0.5, 0.5,
-4.349566, -3.379118, 4, 0, -0.5, 0.5, 0.5,
-4.349566, -3.379118, 4, 1, -0.5, 0.5, 0.5,
-4.349566, -3.379118, 4, 1, 1.5, 0.5, 0.5,
-4.349566, -3.379118, 4, 0, 1.5, 0.5, 0.5
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
-3.824944, -2.89044, -5.237883,
-3.824944, 3.625263, -5.237883,
-3.824944, -2.89044, 5.830073,
-3.824944, 3.625263, 5.830073,
-3.824944, -2.89044, -5.237883,
-3.824944, -2.89044, 5.830073,
-3.824944, 3.625263, -5.237883,
-3.824944, 3.625263, 5.830073,
-3.824944, -2.89044, -5.237883,
3.170013, -2.89044, -5.237883,
-3.824944, -2.89044, 5.830073,
3.170013, -2.89044, 5.830073,
-3.824944, 3.625263, -5.237883,
3.170013, 3.625263, -5.237883,
-3.824944, 3.625263, 5.830073,
3.170013, 3.625263, 5.830073,
3.170013, -2.89044, -5.237883,
3.170013, 3.625263, -5.237883,
3.170013, -2.89044, 5.830073,
3.170013, 3.625263, 5.830073,
3.170013, -2.89044, -5.237883,
3.170013, -2.89044, 5.830073,
3.170013, 3.625263, -5.237883,
3.170013, 3.625263, 5.830073
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
var radius = 7.809335;
var distance = 34.74461;
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
mvMatrix.translate( 0.3274658, -0.3674114, -0.2960951 );
mvMatrix.scale( 1.207099, 1.295886, 0.7628876 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74461);
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
etofenprox<-read.table("etofenprox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etofenprox$V2
```

```
## Error in eval(expr, envir, enclos): object 'etofenprox' not found
```

```r
y<-etofenprox$V3
```

```
## Error in eval(expr, envir, enclos): object 'etofenprox' not found
```

```r
z<-etofenprox$V4
```

```
## Error in eval(expr, envir, enclos): object 'etofenprox' not found
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
-3.723076, -1.152533, -1.913787, 0, 0, 1, 1, 1,
-2.852349, -1.321145, -1.312698, 1, 0, 0, 1, 1,
-2.835163, 0.476925, -2.32262, 1, 0, 0, 1, 1,
-2.678788, 0.1259807, -2.034758, 1, 0, 0, 1, 1,
-2.643056, -2.762787, -1.212788, 1, 0, 0, 1, 1,
-2.551825, -0.5656523, -3.11071, 1, 0, 0, 1, 1,
-2.539158, -0.5026582, -3.061924, 0, 0, 0, 1, 1,
-2.400192, -0.7152249, -0.8415703, 0, 0, 0, 1, 1,
-2.351812, 0.7734923, -0.4694125, 0, 0, 0, 1, 1,
-2.342747, -0.852917, -2.403176, 0, 0, 0, 1, 1,
-2.336607, -1.424375, -0.2436661, 0, 0, 0, 1, 1,
-2.272742, 0.320092, -1.704578, 0, 0, 0, 1, 1,
-2.268101, -1.384653, -2.323637, 0, 0, 0, 1, 1,
-2.192967, -0.8723515, -2.824887, 1, 1, 1, 1, 1,
-2.185588, 1.637346, 0.727153, 1, 1, 1, 1, 1,
-2.182717, 0.1909865, -2.246349, 1, 1, 1, 1, 1,
-2.181602, 0.1395313, -1.229033, 1, 1, 1, 1, 1,
-2.161654, -1.110191, -0.792141, 1, 1, 1, 1, 1,
-2.145512, 0.2706765, -2.204938, 1, 1, 1, 1, 1,
-2.136683, -0.7920393, -3.492735, 1, 1, 1, 1, 1,
-2.119276, 0.1871071, -0.3381486, 1, 1, 1, 1, 1,
-2.105302, 1.158134, -0.3511046, 1, 1, 1, 1, 1,
-2.094468, 0.06270777, -1.454439, 1, 1, 1, 1, 1,
-2.073668, -0.2284597, -1.272414, 1, 1, 1, 1, 1,
-2.062713, 0.9465098, -0.7014503, 1, 1, 1, 1, 1,
-2.030706, -0.7773858, -2.83046, 1, 1, 1, 1, 1,
-2.025614, -2.433281, -1.609957, 1, 1, 1, 1, 1,
-1.994489, -0.1293319, -2.667125, 1, 1, 1, 1, 1,
-1.979516, 1.353954, -2.331168, 0, 0, 1, 1, 1,
-1.970833, 0.5126523, -1.158746, 1, 0, 0, 1, 1,
-1.944465, 0.3846639, -2.442082, 1, 0, 0, 1, 1,
-1.938017, 0.7885212, 0.6964718, 1, 0, 0, 1, 1,
-1.930629, 0.8523197, -0.4768195, 1, 0, 0, 1, 1,
-1.906757, 0.7511396, -1.102057, 1, 0, 0, 1, 1,
-1.88392, -0.4252836, -1.974382, 0, 0, 0, 1, 1,
-1.875413, 0.01601909, -2.349826, 0, 0, 0, 1, 1,
-1.861657, -0.5383965, -2.906624, 0, 0, 0, 1, 1,
-1.855242, -0.2984654, -2.325267, 0, 0, 0, 1, 1,
-1.844723, 0.233484, -0.07178889, 0, 0, 0, 1, 1,
-1.842171, 1.033337, 0.6226547, 0, 0, 0, 1, 1,
-1.820334, 0.1979994, -2.345935, 0, 0, 0, 1, 1,
-1.819331, 1.193725, -0.4070059, 1, 1, 1, 1, 1,
-1.816487, -0.5488373, -0.6434098, 1, 1, 1, 1, 1,
-1.791651, -0.7198654, -1.107428, 1, 1, 1, 1, 1,
-1.788752, -1.746106, -1.78705, 1, 1, 1, 1, 1,
-1.782545, -1.012305, -2.281939, 1, 1, 1, 1, 1,
-1.776817, 0.5447976, 2.217228, 1, 1, 1, 1, 1,
-1.755506, 0.6253037, -0.468577, 1, 1, 1, 1, 1,
-1.734504, -0.4274878, -2.436039, 1, 1, 1, 1, 1,
-1.731498, 0.483186, -0.6593549, 1, 1, 1, 1, 1,
-1.725476, 0.1201267, -0.8971738, 1, 1, 1, 1, 1,
-1.722309, 1.458813, -0.5289025, 1, 1, 1, 1, 1,
-1.721283, -1.70548, -1.776497, 1, 1, 1, 1, 1,
-1.707437, -0.1041592, -2.418775, 1, 1, 1, 1, 1,
-1.696051, -0.1904187, -1.048265, 1, 1, 1, 1, 1,
-1.679877, 0.5336252, -1.02117, 1, 1, 1, 1, 1,
-1.671384, 0.1058868, -1.390168, 0, 0, 1, 1, 1,
-1.668108, 1.438733, -0.8336101, 1, 0, 0, 1, 1,
-1.664142, 1.346393, -0.620817, 1, 0, 0, 1, 1,
-1.656119, 0.5011442, 0.5559962, 1, 0, 0, 1, 1,
-1.637693, 1.95843, -3.713248, 1, 0, 0, 1, 1,
-1.627297, -0.9298078, -2.826255, 1, 0, 0, 1, 1,
-1.620492, 0.4725727, -0.7031581, 0, 0, 0, 1, 1,
-1.613427, 1.179067, -2.41719, 0, 0, 0, 1, 1,
-1.607974, 1.027953, -1.784889, 0, 0, 0, 1, 1,
-1.602009, 0.3758157, -1.242619, 0, 0, 0, 1, 1,
-1.600942, 0.02612435, -1.937558, 0, 0, 0, 1, 1,
-1.589152, 0.4675423, -1.186119, 0, 0, 0, 1, 1,
-1.588801, 0.2461133, 0.281396, 0, 0, 0, 1, 1,
-1.584574, 0.1778835, -1.35065, 1, 1, 1, 1, 1,
-1.584361, -2.227126, -2.215094, 1, 1, 1, 1, 1,
-1.573024, -1.045649, -1.76263, 1, 1, 1, 1, 1,
-1.572591, 1.06501, -0.9787835, 1, 1, 1, 1, 1,
-1.572241, 1.384515, 0.7750036, 1, 1, 1, 1, 1,
-1.56778, -0.24698, -1.020917, 1, 1, 1, 1, 1,
-1.565671, -0.7613419, -2.155716, 1, 1, 1, 1, 1,
-1.558424, -0.7787631, -1.129889, 1, 1, 1, 1, 1,
-1.550942, -0.8043684, -1.399571, 1, 1, 1, 1, 1,
-1.543536, 0.007273517, 0.005680199, 1, 1, 1, 1, 1,
-1.539297, 1.25795, -2.326043, 1, 1, 1, 1, 1,
-1.538512, -1.209647, 0.3743938, 1, 1, 1, 1, 1,
-1.529119, -0.6791368, -2.461018, 1, 1, 1, 1, 1,
-1.528746, 0.05046445, -2.339449, 1, 1, 1, 1, 1,
-1.523522, 2.261179, -0.2407967, 1, 1, 1, 1, 1,
-1.515174, -0.6122402, -1.86663, 0, 0, 1, 1, 1,
-1.511396, 0.3543696, -2.403877, 1, 0, 0, 1, 1,
-1.50297, 0.8197655, -0.9469777, 1, 0, 0, 1, 1,
-1.496086, 2.131253, -1.195997, 1, 0, 0, 1, 1,
-1.486902, -0.2011472, -2.281465, 1, 0, 0, 1, 1,
-1.469635, -0.1044265, -0.982302, 1, 0, 0, 1, 1,
-1.452383, 0.06915214, -1.844318, 0, 0, 0, 1, 1,
-1.450737, -1.290136, -3.383551, 0, 0, 0, 1, 1,
-1.430906, -2.27426, -3.451141, 0, 0, 0, 1, 1,
-1.429048, -0.5028692, -2.706355, 0, 0, 0, 1, 1,
-1.423929, 0.378451, -0.2804905, 0, 0, 0, 1, 1,
-1.416165, 0.1856136, -0.5097917, 0, 0, 0, 1, 1,
-1.402691, 0.8660424, -1.849063, 0, 0, 0, 1, 1,
-1.39817, -0.3338489, -2.823141, 1, 1, 1, 1, 1,
-1.394039, 0.9554871, -2.631832, 1, 1, 1, 1, 1,
-1.392685, 0.5888153, -0.8838754, 1, 1, 1, 1, 1,
-1.387474, -0.9618306, -1.672892, 1, 1, 1, 1, 1,
-1.375007, -0.8299955, -2.06352, 1, 1, 1, 1, 1,
-1.369956, -0.6797554, -2.487805, 1, 1, 1, 1, 1,
-1.365647, -0.1919127, -1.744286, 1, 1, 1, 1, 1,
-1.357195, 1.293566, -0.7529587, 1, 1, 1, 1, 1,
-1.354063, 1.591982, -0.6597143, 1, 1, 1, 1, 1,
-1.349311, 0.5490121, -0.7506494, 1, 1, 1, 1, 1,
-1.349011, -0.2463359, -0.545341, 1, 1, 1, 1, 1,
-1.327821, 0.01849876, -1.520916, 1, 1, 1, 1, 1,
-1.324067, 0.7477172, -2.818341, 1, 1, 1, 1, 1,
-1.319013, -0.2740745, -1.461602, 1, 1, 1, 1, 1,
-1.303579, -0.312651, -1.041125, 1, 1, 1, 1, 1,
-1.299572, -0.2605276, -2.302143, 0, 0, 1, 1, 1,
-1.28126, -0.6459963, -1.417207, 1, 0, 0, 1, 1,
-1.268075, -2.040756, -3.59302, 1, 0, 0, 1, 1,
-1.263279, -1.426889, -1.72727, 1, 0, 0, 1, 1,
-1.260661, 0.5593336, -1.883991, 1, 0, 0, 1, 1,
-1.253245, 0.7187399, -2.228943, 1, 0, 0, 1, 1,
-1.251456, 1.168858, -1.226668, 0, 0, 0, 1, 1,
-1.24305, -0.05757102, -1.65135, 0, 0, 0, 1, 1,
-1.239514, -1.10453, -1.612651, 0, 0, 0, 1, 1,
-1.23899, 1.159164, -0.7268469, 0, 0, 0, 1, 1,
-1.234632, 0.727927, -1.875597, 0, 0, 0, 1, 1,
-1.23408, -1.464622, -5.076699, 0, 0, 0, 1, 1,
-1.233858, -0.6937236, -1.877427, 0, 0, 0, 1, 1,
-1.226843, -1.726303, -2.462985, 1, 1, 1, 1, 1,
-1.22642, -1.151097, -3.287685, 1, 1, 1, 1, 1,
-1.225601, 0.6642067, -0.3190588, 1, 1, 1, 1, 1,
-1.224878, -0.1354984, -1.040109, 1, 1, 1, 1, 1,
-1.219541, -0.6546378, -2.353648, 1, 1, 1, 1, 1,
-1.21045, 1.260434, -3.145051, 1, 1, 1, 1, 1,
-1.204467, 0.9055854, -2.573596, 1, 1, 1, 1, 1,
-1.203813, 0.3417015, -2.245501, 1, 1, 1, 1, 1,
-1.199262, -0.4665318, -2.15801, 1, 1, 1, 1, 1,
-1.198378, -0.2472985, -2.590928, 1, 1, 1, 1, 1,
-1.193796, 0.8131213, -0.1059294, 1, 1, 1, 1, 1,
-1.187163, -0.2330678, -1.842343, 1, 1, 1, 1, 1,
-1.181861, 1.120525, -0.9897562, 1, 1, 1, 1, 1,
-1.178751, -0.2581853, -1.452479, 1, 1, 1, 1, 1,
-1.177526, 0.5866705, -0.6125594, 1, 1, 1, 1, 1,
-1.171978, 0.07022561, -3.02153, 0, 0, 1, 1, 1,
-1.169539, -0.1541623, -2.746098, 1, 0, 0, 1, 1,
-1.161913, 1.388049, -0.7423856, 1, 0, 0, 1, 1,
-1.160057, -0.9430872, -2.580224, 1, 0, 0, 1, 1,
-1.148044, -0.8466519, -0.5132315, 1, 0, 0, 1, 1,
-1.137185, 1.147398, -1.862715, 1, 0, 0, 1, 1,
-1.13623, 0.4286155, -2.115028, 0, 0, 0, 1, 1,
-1.134561, 0.5058669, -0.6260797, 0, 0, 0, 1, 1,
-1.133468, 0.3470012, -1.905457, 0, 0, 0, 1, 1,
-1.132093, -0.0190893, -1.487566, 0, 0, 0, 1, 1,
-1.116936, 0.9370918, -2.076012, 0, 0, 0, 1, 1,
-1.111322, -0.80084, -3.333604, 0, 0, 0, 1, 1,
-1.108053, 0.1019728, -0.5530971, 0, 0, 0, 1, 1,
-1.103554, 1.043683, -0.8471524, 1, 1, 1, 1, 1,
-1.095997, -1.156551, -1.541355, 1, 1, 1, 1, 1,
-1.076749, -0.784902, 1.154888, 1, 1, 1, 1, 1,
-1.07351, -0.6100012, -1.837254, 1, 1, 1, 1, 1,
-1.06119, 1.318832, -0.8189057, 1, 1, 1, 1, 1,
-1.059117, -0.4070489, -3.322711, 1, 1, 1, 1, 1,
-1.056208, 1.349863, -1.639072, 1, 1, 1, 1, 1,
-1.050562, -1.854269, -1.079814, 1, 1, 1, 1, 1,
-1.050544, 0.9973528, -0.4680263, 1, 1, 1, 1, 1,
-1.046432, -1.837756, -2.865339, 1, 1, 1, 1, 1,
-1.043417, -0.1016522, 1.492046, 1, 1, 1, 1, 1,
-1.039886, 1.03265, -0.07905511, 1, 1, 1, 1, 1,
-1.035461, -1.920283, -4.5051, 1, 1, 1, 1, 1,
-1.033703, 1.491856, -0.3529695, 1, 1, 1, 1, 1,
-1.033312, 0.9913109, -1.539951, 1, 1, 1, 1, 1,
-1.031266, 0.7194387, -1.509885, 0, 0, 1, 1, 1,
-1.022341, 0.8124757, -1.317579, 1, 0, 0, 1, 1,
-1.021958, 0.4620432, -1.988352, 1, 0, 0, 1, 1,
-1.019111, 0.6358724, -1.269359, 1, 0, 0, 1, 1,
-1.014163, 0.695551, -0.4480099, 1, 0, 0, 1, 1,
-1.007898, 0.04672942, -1.005723, 1, 0, 0, 1, 1,
-1.004755, 2.250995, -0.2888626, 0, 0, 0, 1, 1,
-1.004116, 0.8229507, -0.2928976, 0, 0, 0, 1, 1,
-0.9975935, -0.1844037, -1.204225, 0, 0, 0, 1, 1,
-0.9917561, 0.7855556, -0.3657078, 0, 0, 0, 1, 1,
-0.988562, 0.6937174, -2.070973, 0, 0, 0, 1, 1,
-0.9882022, -1.172531, -1.845163, 0, 0, 0, 1, 1,
-0.9828547, 2.095998, 1.407692, 0, 0, 0, 1, 1,
-0.982404, -0.3387679, -3.116256, 1, 1, 1, 1, 1,
-0.9817538, 1.051405, -1.782726, 1, 1, 1, 1, 1,
-0.9810271, 1.798084, -1.207145, 1, 1, 1, 1, 1,
-0.9699746, 1.691121, 0.7922593, 1, 1, 1, 1, 1,
-0.9696712, 0.09186758, -0.9641828, 1, 1, 1, 1, 1,
-0.953096, 0.311219, -1.114768, 1, 1, 1, 1, 1,
-0.9518256, -0.9770367, -2.27565, 1, 1, 1, 1, 1,
-0.9478099, 0.1414346, -1.701834, 1, 1, 1, 1, 1,
-0.9474381, -1.110043, -3.441325, 1, 1, 1, 1, 1,
-0.9473255, 2.182353, 1.061383, 1, 1, 1, 1, 1,
-0.9469249, 0.5616452, -1.612613, 1, 1, 1, 1, 1,
-0.9429327, -1.7517, -2.952195, 1, 1, 1, 1, 1,
-0.937422, -1.512083, -1.758017, 1, 1, 1, 1, 1,
-0.9335905, -0.6403263, -4.171855, 1, 1, 1, 1, 1,
-0.9243308, -1.523747, -1.386233, 1, 1, 1, 1, 1,
-0.9081863, 0.4301402, -1.740691, 0, 0, 1, 1, 1,
-0.9058595, 0.4233055, -2.925334, 1, 0, 0, 1, 1,
-0.8990163, 0.6137123, -0.564722, 1, 0, 0, 1, 1,
-0.8971537, 1.095179, -2.174942, 1, 0, 0, 1, 1,
-0.8962601, -0.3223361, -2.693081, 1, 0, 0, 1, 1,
-0.8905963, 0.3429031, -1.005199, 1, 0, 0, 1, 1,
-0.8893983, -1.574348, -2.748887, 0, 0, 0, 1, 1,
-0.8877763, -0.02092493, -0.4532664, 0, 0, 0, 1, 1,
-0.887503, 0.7496065, 0.1712287, 0, 0, 0, 1, 1,
-0.887123, 1.530451, -0.5906311, 0, 0, 0, 1, 1,
-0.8844393, 1.560865, -0.5465293, 0, 0, 0, 1, 1,
-0.8830523, -1.434689, -3.108858, 0, 0, 0, 1, 1,
-0.8794028, -2.233013, -3.004583, 0, 0, 0, 1, 1,
-0.8770521, 0.452076, -0.5497862, 1, 1, 1, 1, 1,
-0.8665655, -0.3422251, -4.194281, 1, 1, 1, 1, 1,
-0.8658485, -1.070886, -3.222038, 1, 1, 1, 1, 1,
-0.8590049, 0.1003663, -2.689839, 1, 1, 1, 1, 1,
-0.8518931, -0.5459956, -1.028422, 1, 1, 1, 1, 1,
-0.8481393, -0.9493007, -0.684077, 1, 1, 1, 1, 1,
-0.8429922, -0.7954146, -2.403079, 1, 1, 1, 1, 1,
-0.8276929, -0.9502129, -2.409588, 1, 1, 1, 1, 1,
-0.8260072, 0.535901, -1.802663, 1, 1, 1, 1, 1,
-0.8237024, -0.1005853, -0.6591997, 1, 1, 1, 1, 1,
-0.8211451, -1.20093, -4.319662, 1, 1, 1, 1, 1,
-0.8187034, 0.4029845, -1.434306, 1, 1, 1, 1, 1,
-0.8175123, 0.2161568, -1.506821, 1, 1, 1, 1, 1,
-0.8174731, -1.03924, -2.771592, 1, 1, 1, 1, 1,
-0.8117954, 0.203734, -1.033283, 1, 1, 1, 1, 1,
-0.806245, 1.190787, -0.9515933, 0, 0, 1, 1, 1,
-0.8016428, -0.4525325, 0.3773199, 1, 0, 0, 1, 1,
-0.7961178, -0.8535204, 0.5078853, 1, 0, 0, 1, 1,
-0.7954713, 0.7254817, -1.356572, 1, 0, 0, 1, 1,
-0.7909992, -0.4222893, -2.117658, 1, 0, 0, 1, 1,
-0.7893708, -1.86742, -1.018447, 1, 0, 0, 1, 1,
-0.7886959, 0.586278, -2.548021, 0, 0, 0, 1, 1,
-0.7885396, -0.505684, -1.681078, 0, 0, 0, 1, 1,
-0.7879768, 1.140873, -1.333632, 0, 0, 0, 1, 1,
-0.7765946, -0.6928946, -1.952868, 0, 0, 0, 1, 1,
-0.7622479, -0.5556511, -3.046204, 0, 0, 0, 1, 1,
-0.7616533, 1.211872, 0.4877141, 0, 0, 0, 1, 1,
-0.7575833, 0.7771794, -1.584773, 0, 0, 0, 1, 1,
-0.7531446, 0.3509589, -1.801075, 1, 1, 1, 1, 1,
-0.750926, -1.296726, -1.29862, 1, 1, 1, 1, 1,
-0.7475169, -1.129023, -3.444947, 1, 1, 1, 1, 1,
-0.7419837, -0.7051463, -4.010818, 1, 1, 1, 1, 1,
-0.7330785, -0.6638823, -3.092695, 1, 1, 1, 1, 1,
-0.7249923, 2.514345, -0.5757551, 1, 1, 1, 1, 1,
-0.7168539, 1.036623, -1.481662, 1, 1, 1, 1, 1,
-0.715312, -1.326203, -3.337558, 1, 1, 1, 1, 1,
-0.7083779, 0.5886248, -1.249344, 1, 1, 1, 1, 1,
-0.7057564, 0.4166825, -0.9911064, 1, 1, 1, 1, 1,
-0.7034091, 0.5485728, -1.852887, 1, 1, 1, 1, 1,
-0.6986755, -1.079282, -1.128854, 1, 1, 1, 1, 1,
-0.697494, 0.126866, -1.66079, 1, 1, 1, 1, 1,
-0.6957667, -0.2050911, -1.215661, 1, 1, 1, 1, 1,
-0.6916503, 0.9253947, -0.01874237, 1, 1, 1, 1, 1,
-0.6912121, -1.052318, -3.318661, 0, 0, 1, 1, 1,
-0.6898389, -0.6938145, -1.874222, 1, 0, 0, 1, 1,
-0.6794434, -1.752871, -3.018955, 1, 0, 0, 1, 1,
-0.6782839, 1.58651, -0.5164618, 1, 0, 0, 1, 1,
-0.6780725, -1.075701, -1.934373, 1, 0, 0, 1, 1,
-0.6768577, 0.3863727, -2.084495, 1, 0, 0, 1, 1,
-0.6747004, -2.130847, -2.677192, 0, 0, 0, 1, 1,
-0.6731808, -0.643597, -1.492937, 0, 0, 0, 1, 1,
-0.6711621, -0.7541208, -3.488034, 0, 0, 0, 1, 1,
-0.6699547, 1.160606, 0.9746457, 0, 0, 0, 1, 1,
-0.6641729, 0.3285412, -0.6326931, 0, 0, 0, 1, 1,
-0.6602686, 1.578301, -2.946843, 0, 0, 0, 1, 1,
-0.6586825, 0.3461546, -0.975729, 0, 0, 0, 1, 1,
-0.6575764, 0.3561382, -3.137527, 1, 1, 1, 1, 1,
-0.6543707, 0.3084774, 1.266141, 1, 1, 1, 1, 1,
-0.6510451, 1.281346, 0.1683443, 1, 1, 1, 1, 1,
-0.6503096, 0.02630219, -1.42553, 1, 1, 1, 1, 1,
-0.6502534, -0.8677985, -1.58715, 1, 1, 1, 1, 1,
-0.6481119, -0.1895478, -2.49681, 1, 1, 1, 1, 1,
-0.6444367, 2.025033, -0.8245668, 1, 1, 1, 1, 1,
-0.6433036, 0.6775252, -0.1604433, 1, 1, 1, 1, 1,
-0.6387127, -0.2574113, -2.649832, 1, 1, 1, 1, 1,
-0.635186, -1.2913, -2.466524, 1, 1, 1, 1, 1,
-0.6328838, 0.7065168, -1.517147, 1, 1, 1, 1, 1,
-0.6314007, -0.02117317, -4.04023, 1, 1, 1, 1, 1,
-0.629166, -1.147945, -3.454167, 1, 1, 1, 1, 1,
-0.6236393, 1.143218, -1.980535, 1, 1, 1, 1, 1,
-0.620337, 1.924668, 0.1150031, 1, 1, 1, 1, 1,
-0.6164917, -1.575997, -2.565305, 0, 0, 1, 1, 1,
-0.6164868, -0.3373273, -1.002444, 1, 0, 0, 1, 1,
-0.6134281, -0.9187036, -3.528017, 1, 0, 0, 1, 1,
-0.6124376, 0.0251877, -0.7095734, 1, 0, 0, 1, 1,
-0.6093985, 1.94671, -0.814458, 1, 0, 0, 1, 1,
-0.6087595, -1.595977, -4.071737, 1, 0, 0, 1, 1,
-0.6076509, -0.4860104, -1.560831, 0, 0, 0, 1, 1,
-0.604173, 1.765791, 0.122778, 0, 0, 0, 1, 1,
-0.5999408, -0.6259159, -4.139118, 0, 0, 0, 1, 1,
-0.5992907, 0.9884437, 0.8794875, 0, 0, 0, 1, 1,
-0.5990661, 0.6076309, 0.6608378, 0, 0, 0, 1, 1,
-0.5920249, 1.138996, -1.660582, 0, 0, 0, 1, 1,
-0.5906294, 0.9290417, -1.619334, 0, 0, 0, 1, 1,
-0.5899096, -0.03429009, -1.965443, 1, 1, 1, 1, 1,
-0.5878063, 0.9965887, -0.2248025, 1, 1, 1, 1, 1,
-0.5868348, 1.689212, -2.69377, 1, 1, 1, 1, 1,
-0.5852789, -1.365055, -1.611154, 1, 1, 1, 1, 1,
-0.5805098, 0.5447069, -1.818875, 1, 1, 1, 1, 1,
-0.5802264, 0.7709009, 0.4198517, 1, 1, 1, 1, 1,
-0.5696431, -2.237743, -2.27436, 1, 1, 1, 1, 1,
-0.5688103, 0.8232629, -0.472721, 1, 1, 1, 1, 1,
-0.5608068, 0.4654888, 0.5019461, 1, 1, 1, 1, 1,
-0.558441, -1.118633, -2.44685, 1, 1, 1, 1, 1,
-0.5577115, 0.9469802, -0.4084069, 1, 1, 1, 1, 1,
-0.5568723, -1.340613, -1.940012, 1, 1, 1, 1, 1,
-0.5528104, 0.4932346, -2.517758, 1, 1, 1, 1, 1,
-0.5525044, 1.177104, -0.7451365, 1, 1, 1, 1, 1,
-0.5519914, -0.2593233, -2.422771, 1, 1, 1, 1, 1,
-0.5485382, -1.636178, -2.64675, 0, 0, 1, 1, 1,
-0.5431439, -0.7418727, -2.481228, 1, 0, 0, 1, 1,
-0.5340018, 2.402571, 0.5689466, 1, 0, 0, 1, 1,
-0.5326361, -0.2161718, -4.124249, 1, 0, 0, 1, 1,
-0.5267828, -0.4815248, -2.006233, 1, 0, 0, 1, 1,
-0.5235789, -0.8267691, -2.174085, 1, 0, 0, 1, 1,
-0.5201686, 0.5038667, 0.3932629, 0, 0, 0, 1, 1,
-0.5143679, 0.6105577, -2.281435, 0, 0, 0, 1, 1,
-0.5126221, -0.5744439, -3.39738, 0, 0, 0, 1, 1,
-0.5053824, -0.8064744, -2.170178, 0, 0, 0, 1, 1,
-0.5013391, 0.4864879, -0.5665116, 0, 0, 0, 1, 1,
-0.4991454, -0.04609706, -0.9971126, 0, 0, 0, 1, 1,
-0.4971687, 0.4132709, -0.247242, 0, 0, 0, 1, 1,
-0.4897874, 0.6694138, 1.23603, 1, 1, 1, 1, 1,
-0.4777423, -0.1328572, -1.602333, 1, 1, 1, 1, 1,
-0.4770583, -0.2684768, -4.316129, 1, 1, 1, 1, 1,
-0.4763456, -1.174479, -2.820323, 1, 1, 1, 1, 1,
-0.4761143, 0.7821925, -1.148303, 1, 1, 1, 1, 1,
-0.4702613, 0.5202168, 1.179496, 1, 1, 1, 1, 1,
-0.4674136, 0.8155585, 0.3805622, 1, 1, 1, 1, 1,
-0.4553948, 1.451112, -1.466875, 1, 1, 1, 1, 1,
-0.4531265, -0.5136747, -0.2294592, 1, 1, 1, 1, 1,
-0.4449018, 0.6755695, 0.04237099, 1, 1, 1, 1, 1,
-0.4430038, 1.822864, 0.3190561, 1, 1, 1, 1, 1,
-0.435631, 0.1406426, -0.4791942, 1, 1, 1, 1, 1,
-0.4331777, 0.053181, -2.739232, 1, 1, 1, 1, 1,
-0.4312328, 0.3240933, -0.3033459, 1, 1, 1, 1, 1,
-0.4306618, -0.4953534, -1.904981, 1, 1, 1, 1, 1,
-0.4212745, 0.9049515, -1.571583, 0, 0, 1, 1, 1,
-0.4195786, -0.1985877, -2.48211, 1, 0, 0, 1, 1,
-0.413473, 0.2512125, -2.333266, 1, 0, 0, 1, 1,
-0.408572, -0.4800826, -2.361433, 1, 0, 0, 1, 1,
-0.4079599, -0.1117469, -1.520241, 1, 0, 0, 1, 1,
-0.4071579, -0.4793923, -2.523134, 1, 0, 0, 1, 1,
-0.4048466, -1.630523, -1.02976, 0, 0, 0, 1, 1,
-0.4041, -1.118846, -1.973953, 0, 0, 0, 1, 1,
-0.4005363, -0.3744407, -4.28818, 0, 0, 0, 1, 1,
-0.4002734, 0.9832568, -0.7996944, 0, 0, 0, 1, 1,
-0.3977768, 1.036524, -0.7576338, 0, 0, 0, 1, 1,
-0.3948521, 0.1354402, -2.175451, 0, 0, 0, 1, 1,
-0.3919461, -0.3668057, -2.460609, 0, 0, 0, 1, 1,
-0.3905297, -0.7407559, -4.561801, 1, 1, 1, 1, 1,
-0.3900773, -0.7733137, -1.697571, 1, 1, 1, 1, 1,
-0.3878934, 0.7649181, -1.522093, 1, 1, 1, 1, 1,
-0.3863871, 1.816509, 0.7309158, 1, 1, 1, 1, 1,
-0.3827755, -0.7416833, -2.965911, 1, 1, 1, 1, 1,
-0.3792695, 0.9239781, 0.1493683, 1, 1, 1, 1, 1,
-0.3718262, -0.3804471, -3.246087, 1, 1, 1, 1, 1,
-0.3711097, 1.900313, 0.0009482469, 1, 1, 1, 1, 1,
-0.3694911, 2.106258, 0.7391385, 1, 1, 1, 1, 1,
-0.3690525, -0.3456026, 0.197798, 1, 1, 1, 1, 1,
-0.363417, 1.106114, -2.165885, 1, 1, 1, 1, 1,
-0.361333, 1.020468, -0.3630049, 1, 1, 1, 1, 1,
-0.3603396, -0.4726577, -0.4980362, 1, 1, 1, 1, 1,
-0.3591698, -0.7515209, -3.79553, 1, 1, 1, 1, 1,
-0.3579708, -1.680426, -4.424408, 1, 1, 1, 1, 1,
-0.3541212, 1.081949, -0.06795247, 0, 0, 1, 1, 1,
-0.3498651, -0.4446703, -3.251093, 1, 0, 0, 1, 1,
-0.3473736, -0.5575647, -1.579273, 1, 0, 0, 1, 1,
-0.3462704, 0.1053079, -1.336468, 1, 0, 0, 1, 1,
-0.3456573, -0.2410037, -0.2280903, 1, 0, 0, 1, 1,
-0.3434605, 1.524582, 0.8378662, 1, 0, 0, 1, 1,
-0.3419114, -2.218678, -1.076984, 0, 0, 0, 1, 1,
-0.3330598, -2.247303, -3.273576, 0, 0, 0, 1, 1,
-0.3329704, 1.152572, 0.03966993, 0, 0, 0, 1, 1,
-0.3300624, -0.1530173, -2.260104, 0, 0, 0, 1, 1,
-0.3252347, 0.7271727, 1.914612, 0, 0, 0, 1, 1,
-0.3232549, 0.3507594, 0.4704061, 0, 0, 0, 1, 1,
-0.3159011, 0.6873705, -0.4139377, 0, 0, 0, 1, 1,
-0.3140759, 1.376674, -1.676179, 1, 1, 1, 1, 1,
-0.3134637, 0.04332531, -0.3280405, 1, 1, 1, 1, 1,
-0.3107527, -0.1822562, -2.211742, 1, 1, 1, 1, 1,
-0.310065, -0.8119745, -3.227133, 1, 1, 1, 1, 1,
-0.3068941, 0.3383278, -1.455635, 1, 1, 1, 1, 1,
-0.3021034, 0.9828544, -1.628524, 1, 1, 1, 1, 1,
-0.3002558, -0.96311, -4.348917, 1, 1, 1, 1, 1,
-0.2977507, 0.5300055, -0.630231, 1, 1, 1, 1, 1,
-0.2973316, 1.128535, 1.616809, 1, 1, 1, 1, 1,
-0.2966544, 2.017884, 0.7675673, 1, 1, 1, 1, 1,
-0.2930606, -2.275916, -3.567825, 1, 1, 1, 1, 1,
-0.2919331, -0.6042365, -2.441396, 1, 1, 1, 1, 1,
-0.2899325, -0.6791309, -2.747437, 1, 1, 1, 1, 1,
-0.2852427, -0.5910079, -5.066432, 1, 1, 1, 1, 1,
-0.2835726, 0.2469952, -1.445821, 1, 1, 1, 1, 1,
-0.2832045, 0.7588626, -0.1226051, 0, 0, 1, 1, 1,
-0.2822878, 2.193783, -0.6805364, 1, 0, 0, 1, 1,
-0.2796616, -0.38412, -2.431276, 1, 0, 0, 1, 1,
-0.2793964, -1.74839, -2.625113, 1, 0, 0, 1, 1,
-0.2775881, 0.9619673, -1.76691, 1, 0, 0, 1, 1,
-0.2752866, 1.177168, -2.424309, 1, 0, 0, 1, 1,
-0.2654087, 0.6835876, 0.3168854, 0, 0, 0, 1, 1,
-0.263778, 0.7754401, -1.156176, 0, 0, 0, 1, 1,
-0.2584712, -0.0914413, -2.020741, 0, 0, 0, 1, 1,
-0.2577543, 0.4141131, -0.7606394, 0, 0, 0, 1, 1,
-0.2543071, 0.8699828, -0.3629467, 0, 0, 0, 1, 1,
-0.2521616, -0.2858656, -3.008857, 0, 0, 0, 1, 1,
-0.2515694, -0.1047932, -1.423628, 0, 0, 0, 1, 1,
-0.2503652, -0.2512359, -3.582951, 1, 1, 1, 1, 1,
-0.2480914, -0.2858844, -2.036657, 1, 1, 1, 1, 1,
-0.2443038, 0.01112599, -1.788305, 1, 1, 1, 1, 1,
-0.243545, 0.1489782, -0.3061732, 1, 1, 1, 1, 1,
-0.242694, -1.695258, -2.564984, 1, 1, 1, 1, 1,
-0.2421206, -0.8389244, -3.234881, 1, 1, 1, 1, 1,
-0.2406245, -0.9336093, -2.868443, 1, 1, 1, 1, 1,
-0.2405791, -1.98344, -3.690735, 1, 1, 1, 1, 1,
-0.2348672, -1.400346, -4.45938, 1, 1, 1, 1, 1,
-0.2335453, -0.8229974, -1.227225, 1, 1, 1, 1, 1,
-0.2333358, -0.5140282, -4.541406, 1, 1, 1, 1, 1,
-0.23092, -1.122903, -2.003622, 1, 1, 1, 1, 1,
-0.229008, 0.930492, -1.223826, 1, 1, 1, 1, 1,
-0.2274874, 3.530374, 0.5889648, 1, 1, 1, 1, 1,
-0.2251405, -0.5882323, -2.754817, 1, 1, 1, 1, 1,
-0.2227062, 0.293031, 0.02793362, 0, 0, 1, 1, 1,
-0.2225483, 0.6027329, -0.5816849, 1, 0, 0, 1, 1,
-0.2110888, -1.185972, -3.605701, 1, 0, 0, 1, 1,
-0.2044644, 2.151601, 0.4473098, 1, 0, 0, 1, 1,
-0.2021269, 0.05746166, -0.5840771, 1, 0, 0, 1, 1,
-0.2007848, -1.222034, -2.332256, 1, 0, 0, 1, 1,
-0.1963565, 1.396843, 1.567448, 0, 0, 0, 1, 1,
-0.1946128, -0.1033926, -2.608381, 0, 0, 0, 1, 1,
-0.1923279, -1.593234, -2.810719, 0, 0, 0, 1, 1,
-0.1904468, -0.9130859, -2.328354, 0, 0, 0, 1, 1,
-0.1903524, 1.523161, 1.259478, 0, 0, 0, 1, 1,
-0.1866376, -2.41345, -3.019571, 0, 0, 0, 1, 1,
-0.186599, 0.9927546, -0.8181957, 0, 0, 0, 1, 1,
-0.1865663, 0.8382365, -0.1536939, 1, 1, 1, 1, 1,
-0.1847176, 2.287384, -0.5040099, 1, 1, 1, 1, 1,
-0.1786549, -1.261311, -2.056046, 1, 1, 1, 1, 1,
-0.1778963, 0.1867848, -2.669175, 1, 1, 1, 1, 1,
-0.1755865, -1.926249, -3.39165, 1, 1, 1, 1, 1,
-0.1750751, -0.1416011, -2.442228, 1, 1, 1, 1, 1,
-0.1717149, 0.7200021, -1.009029, 1, 1, 1, 1, 1,
-0.1660649, -0.3303532, -2.034097, 1, 1, 1, 1, 1,
-0.1653822, -0.4527458, -2.432426, 1, 1, 1, 1, 1,
-0.1593988, 1.505367, 1.896416, 1, 1, 1, 1, 1,
-0.1561888, -0.3619446, -2.135621, 1, 1, 1, 1, 1,
-0.1535991, -0.3287245, -3.271587, 1, 1, 1, 1, 1,
-0.1504981, 0.4039069, -0.9660206, 1, 1, 1, 1, 1,
-0.1503411, 1.047706, 0.3002302, 1, 1, 1, 1, 1,
-0.1502156, -1.888877, -3.221099, 1, 1, 1, 1, 1,
-0.1445604, 0.6516862, -0.2191353, 0, 0, 1, 1, 1,
-0.1445044, -0.6338625, -2.372111, 1, 0, 0, 1, 1,
-0.1434182, 0.8632331, -0.641229, 1, 0, 0, 1, 1,
-0.1425736, -0.8246177, -1.731042, 1, 0, 0, 1, 1,
-0.1405067, 0.6649292, -0.8790997, 1, 0, 0, 1, 1,
-0.137345, -2.246237, -1.950378, 1, 0, 0, 1, 1,
-0.1347279, 2.106128, -0.7276973, 0, 0, 0, 1, 1,
-0.1324386, -0.4209723, -3.011228, 0, 0, 0, 1, 1,
-0.1322236, -1.685349, -1.887371, 0, 0, 0, 1, 1,
-0.1302339, -1.020178, -4.136066, 0, 0, 0, 1, 1,
-0.126533, 0.7078463, 0.7702178, 0, 0, 0, 1, 1,
-0.125531, -0.08191663, -1.414365, 0, 0, 0, 1, 1,
-0.1218664, 0.640842, 0.1179446, 0, 0, 0, 1, 1,
-0.1216252, -0.4068607, -3.92703, 1, 1, 1, 1, 1,
-0.1204478, 1.913277, 0.7632936, 1, 1, 1, 1, 1,
-0.1154309, 1.685393, 0.1507547, 1, 1, 1, 1, 1,
-0.1144247, 0.5578278, 0.1459258, 1, 1, 1, 1, 1,
-0.1126763, 0.8722033, -0.4420061, 1, 1, 1, 1, 1,
-0.1093875, 1.367483, 0.3092145, 1, 1, 1, 1, 1,
-0.1079061, -0.5796486, -1.311785, 1, 1, 1, 1, 1,
-0.1077538, 0.5845346, -0.5918375, 1, 1, 1, 1, 1,
-0.103777, -0.4856731, -0.2924158, 1, 1, 1, 1, 1,
-0.1018858, 1.96619, -1.220337, 1, 1, 1, 1, 1,
-0.1012041, -0.005057311, 0.3465049, 1, 1, 1, 1, 1,
-0.09995986, 1.135473, -0.497724, 1, 1, 1, 1, 1,
-0.09994946, 0.1294093, -1.537976, 1, 1, 1, 1, 1,
-0.08913036, -0.6190529, -3.651473, 1, 1, 1, 1, 1,
-0.08874848, -0.359619, -4.745628, 1, 1, 1, 1, 1,
-0.08662843, 1.584073, 0.2612166, 0, 0, 1, 1, 1,
-0.08658037, 1.927011, -0.4361423, 1, 0, 0, 1, 1,
-0.08097657, -0.1598641, -3.232534, 1, 0, 0, 1, 1,
-0.07890568, -0.3573915, -0.8281169, 1, 0, 0, 1, 1,
-0.06930534, -0.2120749, -1.826654, 1, 0, 0, 1, 1,
-0.06837908, 0.4896255, 1.223753, 1, 0, 0, 1, 1,
-0.06717841, 0.165834, -0.6009957, 0, 0, 0, 1, 1,
-0.06650016, -0.7728757, -2.889477, 0, 0, 0, 1, 1,
-0.0655586, -0.9008743, -3.660058, 0, 0, 0, 1, 1,
-0.06206152, 0.6445114, -1.156416, 0, 0, 0, 1, 1,
-0.05920111, -0.8090975, -0.8742707, 0, 0, 0, 1, 1,
-0.05914393, 0.9560488, 1.371174, 0, 0, 0, 1, 1,
-0.05854261, -0.6471012, -2.591496, 0, 0, 0, 1, 1,
-0.05797185, 0.6705688, -0.6028768, 1, 1, 1, 1, 1,
-0.05622487, -0.6094036, -1.912525, 1, 1, 1, 1, 1,
-0.04905595, 0.9562314, 1.061875, 1, 1, 1, 1, 1,
-0.04892116, -0.7055792, -3.964075, 1, 1, 1, 1, 1,
-0.04416754, 0.12752, -0.6035203, 1, 1, 1, 1, 1,
-0.04363416, 2.963489, -0.2475161, 1, 1, 1, 1, 1,
-0.04176744, -0.3035738, -2.630988, 1, 1, 1, 1, 1,
-0.04081157, -1.007358, -2.687297, 1, 1, 1, 1, 1,
-0.03914026, -2.488116, -1.612342, 1, 1, 1, 1, 1,
-0.03911255, 1.364509, -0.5057085, 1, 1, 1, 1, 1,
-0.03800406, 0.7068555, 2.493991, 1, 1, 1, 1, 1,
-0.03655536, 1.484407, -0.9105435, 1, 1, 1, 1, 1,
-0.03620166, 1.002204, -0.8466285, 1, 1, 1, 1, 1,
-0.03413878, 0.8935353, 1.605528, 1, 1, 1, 1, 1,
-0.03194956, -0.09644085, -2.751742, 1, 1, 1, 1, 1,
-0.03091877, -0.6330951, -2.493782, 0, 0, 1, 1, 1,
-0.03032067, 0.4210966, 0.7451871, 1, 0, 0, 1, 1,
-0.02205006, -1.260235, -2.991733, 1, 0, 0, 1, 1,
-0.01956517, 0.3330911, -0.6519762, 1, 0, 0, 1, 1,
-0.01240962, 2.176581, 0.6497146, 1, 0, 0, 1, 1,
-0.01140131, -0.6601984, -4.524695, 1, 0, 0, 1, 1,
-0.01035636, -0.5194588, -3.678492, 0, 0, 0, 1, 1,
-0.008451903, -1.252976, -2.866426, 0, 0, 0, 1, 1,
-0.00438996, 0.6138261, 0.2702951, 0, 0, 0, 1, 1,
0.001698143, 0.7503868, -0.751645, 0, 0, 0, 1, 1,
0.007816343, 1.274036, -2.522959, 0, 0, 0, 1, 1,
0.008428483, -2.117974, 3.045481, 0, 0, 0, 1, 1,
0.009363904, 1.173915, -0.5896021, 0, 0, 0, 1, 1,
0.009654537, 0.7803468, -0.5851148, 1, 1, 1, 1, 1,
0.01282373, -1.555346, 4.478071, 1, 1, 1, 1, 1,
0.01852372, 0.9457692, 0.3408767, 1, 1, 1, 1, 1,
0.02022988, -0.829501, -0.9971737, 1, 1, 1, 1, 1,
0.02119719, -0.4905451, 2.208348, 1, 1, 1, 1, 1,
0.02432089, -0.2438495, 2.836411, 1, 1, 1, 1, 1,
0.0254257, 1.424139, 1.430639, 1, 1, 1, 1, 1,
0.0260724, -0.4846517, 3.948612, 1, 1, 1, 1, 1,
0.02866901, 1.014591, -0.1939612, 1, 1, 1, 1, 1,
0.03124263, -0.6249211, 3.766038, 1, 1, 1, 1, 1,
0.03136016, 0.9861873, 0.3113427, 1, 1, 1, 1, 1,
0.04039482, 0.6929029, -0.5985358, 1, 1, 1, 1, 1,
0.0425099, 0.197384, 0.1438961, 1, 1, 1, 1, 1,
0.04263489, -2.251211, 2.773804, 1, 1, 1, 1, 1,
0.04610292, 1.256617, 0.7505304, 1, 1, 1, 1, 1,
0.04934749, -0.9255117, 4.509209, 0, 0, 1, 1, 1,
0.05041347, -0.3959475, 2.252119, 1, 0, 0, 1, 1,
0.05275322, 0.3004157, 0.1745421, 1, 0, 0, 1, 1,
0.05645915, 1.847548, -0.2204819, 1, 0, 0, 1, 1,
0.05821764, 0.2064518, -0.6081728, 1, 0, 0, 1, 1,
0.06536602, -0.05275423, 3.151448, 1, 0, 0, 1, 1,
0.0684714, 0.1122796, 0.1947418, 0, 0, 0, 1, 1,
0.06848467, 0.4809297, -0.3726014, 0, 0, 0, 1, 1,
0.0690417, 0.3233067, -0.4860394, 0, 0, 0, 1, 1,
0.06943721, 0.243466, 0.124615, 0, 0, 0, 1, 1,
0.07261427, -0.3163662, 2.982867, 0, 0, 0, 1, 1,
0.07311826, -0.3545388, 3.695076, 0, 0, 0, 1, 1,
0.07425705, -0.8945432, 3.291479, 0, 0, 0, 1, 1,
0.07661381, 0.1972074, 3.090618, 1, 1, 1, 1, 1,
0.07805614, 0.5739051, -0.0304065, 1, 1, 1, 1, 1,
0.07961464, 1.041236, 1.408686, 1, 1, 1, 1, 1,
0.08941632, 0.4710115, 0.07523046, 1, 1, 1, 1, 1,
0.0913207, -0.1481043, 2.939638, 1, 1, 1, 1, 1,
0.09136137, 0.07856821, 0.0274214, 1, 1, 1, 1, 1,
0.09592338, -0.6048859, 2.497036, 1, 1, 1, 1, 1,
0.1039297, -0.2604078, 5.66889, 1, 1, 1, 1, 1,
0.1040723, -1.062721, 3.401457, 1, 1, 1, 1, 1,
0.1060667, 0.9017085, 0.05310325, 1, 1, 1, 1, 1,
0.1079739, 0.08416275, 2.098944, 1, 1, 1, 1, 1,
0.1090888, 1.04642, -0.1749966, 1, 1, 1, 1, 1,
0.1108688, 1.958906, 0.2373244, 1, 1, 1, 1, 1,
0.1115628, -0.05705936, 2.07766, 1, 1, 1, 1, 1,
0.1135866, 0.8119971, -1.080068, 1, 1, 1, 1, 1,
0.1138726, 0.01420681, 2.972884, 0, 0, 1, 1, 1,
0.1179404, 0.08583737, 1.997903, 1, 0, 0, 1, 1,
0.1204453, -0.09455626, 2.125217, 1, 0, 0, 1, 1,
0.1205368, -1.485217, 2.956809, 1, 0, 0, 1, 1,
0.1235419, 1.46662, -1.636922, 1, 0, 0, 1, 1,
0.1254942, 1.137972, -0.2692289, 1, 0, 0, 1, 1,
0.1296088, -0.1325005, 2.566514, 0, 0, 0, 1, 1,
0.1348086, 0.8621062, -0.6984119, 0, 0, 0, 1, 1,
0.1363524, 1.297864, 0.7741341, 0, 0, 0, 1, 1,
0.1421205, 0.5591348, 0.006864245, 0, 0, 0, 1, 1,
0.1433702, 0.8279705, 1.29866, 0, 0, 0, 1, 1,
0.1439662, -0.9891769, 3.589094, 0, 0, 0, 1, 1,
0.1449704, -0.3056941, 4.095365, 0, 0, 0, 1, 1,
0.1536058, -0.5481133, 2.895136, 1, 1, 1, 1, 1,
0.1551586, 0.310739, 1.370211, 1, 1, 1, 1, 1,
0.1661667, -0.6119276, 3.573734, 1, 1, 1, 1, 1,
0.1666975, 0.2257482, 1.538236, 1, 1, 1, 1, 1,
0.1686947, -1.275891, 3.156554, 1, 1, 1, 1, 1,
0.1734897, 0.4370019, 0.552057, 1, 1, 1, 1, 1,
0.1847003, -0.3453397, 1.360829, 1, 1, 1, 1, 1,
0.1888402, -0.8288961, 2.510685, 1, 1, 1, 1, 1,
0.1891347, 0.5887462, 1.46212, 1, 1, 1, 1, 1,
0.1908169, 0.9597142, -0.2290422, 1, 1, 1, 1, 1,
0.1948483, 0.8525041, -0.1920121, 1, 1, 1, 1, 1,
0.2112176, -0.5276628, 2.807231, 1, 1, 1, 1, 1,
0.211967, -2.093213, 4.167506, 1, 1, 1, 1, 1,
0.2146614, 0.1879935, 0.3987828, 1, 1, 1, 1, 1,
0.2170142, -0.5408735, 3.331961, 1, 1, 1, 1, 1,
0.2179413, -0.5714697, 2.188561, 0, 0, 1, 1, 1,
0.2186763, -0.97862, 3.159809, 1, 0, 0, 1, 1,
0.2189072, 0.2544307, 1.588515, 1, 0, 0, 1, 1,
0.2220307, -1.837506, 0.9758425, 1, 0, 0, 1, 1,
0.2221326, -1.187521, 2.651347, 1, 0, 0, 1, 1,
0.2245956, -0.9367295, 3.660891, 1, 0, 0, 1, 1,
0.2252211, -0.8726621, 3.827634, 0, 0, 0, 1, 1,
0.2327143, 1.211056, 1.303045, 0, 0, 0, 1, 1,
0.2338502, -0.9373907, 2.938738, 0, 0, 0, 1, 1,
0.2347944, 0.6378435, -0.9419666, 0, 0, 0, 1, 1,
0.2356176, -0.2529565, 2.6483, 0, 0, 0, 1, 1,
0.2400819, -0.0671722, 2.768008, 0, 0, 0, 1, 1,
0.2428596, -0.1647799, 1.960735, 0, 0, 0, 1, 1,
0.2433879, -0.4306868, 1.999522, 1, 1, 1, 1, 1,
0.2446735, 0.2998087, -0.04759137, 1, 1, 1, 1, 1,
0.2469463, 0.2580614, 1.391874, 1, 1, 1, 1, 1,
0.2510757, -0.2025985, 1.950485, 1, 1, 1, 1, 1,
0.2559652, -0.5677067, 2.781246, 1, 1, 1, 1, 1,
0.255985, -0.578565, 4.081511, 1, 1, 1, 1, 1,
0.2583674, 0.458299, -0.5429658, 1, 1, 1, 1, 1,
0.2599481, 0.8853642, 0.05391226, 1, 1, 1, 1, 1,
0.2626866, -0.3194931, 0.9108561, 1, 1, 1, 1, 1,
0.2641398, 0.2527254, 2.121789, 1, 1, 1, 1, 1,
0.264954, -0.271176, 1.485281, 1, 1, 1, 1, 1,
0.2696732, -0.01685512, 2.059903, 1, 1, 1, 1, 1,
0.2705008, 0.5695035, 0.8049955, 1, 1, 1, 1, 1,
0.2725537, 0.2913182, 0.7518889, 1, 1, 1, 1, 1,
0.2731716, -0.1977822, 2.723322, 1, 1, 1, 1, 1,
0.2739802, 0.4426773, 1.122138, 0, 0, 1, 1, 1,
0.2742127, -0.2103341, 1.858168, 1, 0, 0, 1, 1,
0.2818867, -0.04801907, 1.949258, 1, 0, 0, 1, 1,
0.2895958, -0.2263706, 3.197494, 1, 0, 0, 1, 1,
0.2901217, 0.9839414, 0.1686701, 1, 0, 0, 1, 1,
0.2901727, 0.4053331, -0.1353944, 1, 0, 0, 1, 1,
0.2906411, -2.759037, 2.497371, 0, 0, 0, 1, 1,
0.293118, 1.512337, 1.315584, 0, 0, 0, 1, 1,
0.2963114, 0.5695741, 0.606687, 0, 0, 0, 1, 1,
0.3032321, 1.468134, -2.246995, 0, 0, 0, 1, 1,
0.304824, -0.3371279, 1.999179, 0, 0, 0, 1, 1,
0.3059536, 1.059209, -0.3246075, 0, 0, 0, 1, 1,
0.3071553, 0.1039868, 1.970515, 0, 0, 0, 1, 1,
0.3095278, -1.435413, 3.356105, 1, 1, 1, 1, 1,
0.3159293, -0.08431089, 0.09036686, 1, 1, 1, 1, 1,
0.3210388, -0.1941387, 2.88278, 1, 1, 1, 1, 1,
0.3217908, -0.0591004, 1.565043, 1, 1, 1, 1, 1,
0.3218056, 0.5568797, 1.207748, 1, 1, 1, 1, 1,
0.3237105, 1.028565, -0.5723568, 1, 1, 1, 1, 1,
0.3254432, -0.4848084, 3.196035, 1, 1, 1, 1, 1,
0.326745, -0.3645706, 2.575888, 1, 1, 1, 1, 1,
0.328898, 0.8692114, -1.729819, 1, 1, 1, 1, 1,
0.3289331, -0.2187684, 2.806413, 1, 1, 1, 1, 1,
0.3291043, 0.8332265, 1.766387, 1, 1, 1, 1, 1,
0.3303086, -0.01050615, 2.244388, 1, 1, 1, 1, 1,
0.3376361, 0.7490711, 2.764791, 1, 1, 1, 1, 1,
0.3389555, -0.17459, 3.741087, 1, 1, 1, 1, 1,
0.3449733, -0.7934634, 3.255889, 1, 1, 1, 1, 1,
0.3455783, -0.048584, 2.408455, 0, 0, 1, 1, 1,
0.3455934, -0.6035597, 2.396223, 1, 0, 0, 1, 1,
0.3470437, -0.1722041, 2.851814, 1, 0, 0, 1, 1,
0.3490594, -0.8135002, 3.333004, 1, 0, 0, 1, 1,
0.3547246, -0.4230382, 1.194726, 1, 0, 0, 1, 1,
0.3587661, 0.03031823, 2.26646, 1, 0, 0, 1, 1,
0.3604294, -0.07839304, 1.847227, 0, 0, 0, 1, 1,
0.3640288, -1.068328, 3.596287, 0, 0, 0, 1, 1,
0.3646376, -1.768023, 2.925606, 0, 0, 0, 1, 1,
0.3682496, 0.8365681, 1.914495, 0, 0, 0, 1, 1,
0.3748127, -1.166174, 1.626873, 0, 0, 0, 1, 1,
0.3775709, -0.5636369, 2.886334, 0, 0, 0, 1, 1,
0.3803865, 1.70862, 0.08785269, 0, 0, 0, 1, 1,
0.38782, 3.478339, 0.7007357, 1, 1, 1, 1, 1,
0.3885498, -0.7993382, 0.5943766, 1, 1, 1, 1, 1,
0.392906, 1.67257, 0.7754835, 1, 1, 1, 1, 1,
0.3986413, -2.795552, 2.685622, 1, 1, 1, 1, 1,
0.3986776, 0.460614, 1.663172, 1, 1, 1, 1, 1,
0.4016339, -0.2600865, 2.793553, 1, 1, 1, 1, 1,
0.4061346, 0.1058622, 0.4559643, 1, 1, 1, 1, 1,
0.4077887, 1.058378, 1.564157, 1, 1, 1, 1, 1,
0.4083941, 0.283405, 1.044386, 1, 1, 1, 1, 1,
0.4085723, 0.6774086, 1.677948, 1, 1, 1, 1, 1,
0.4153126, -0.4988901, 0.9710668, 1, 1, 1, 1, 1,
0.4156032, -1.082411, 3.079745, 1, 1, 1, 1, 1,
0.416623, 0.2116585, 2.249655, 1, 1, 1, 1, 1,
0.4189107, -0.3101118, 1.435244, 1, 1, 1, 1, 1,
0.4190904, 1.449629, 0.4996626, 1, 1, 1, 1, 1,
0.4274401, -0.2023664, 1.322216, 0, 0, 1, 1, 1,
0.4310807, 0.8017629, 1.062587, 1, 0, 0, 1, 1,
0.4362216, 1.675076, -1.127449, 1, 0, 0, 1, 1,
0.4367172, 1.195683, 0.1154434, 1, 0, 0, 1, 1,
0.4377182, 0.5681131, 2.014818, 1, 0, 0, 1, 1,
0.4380031, 0.3351087, 0.6962417, 1, 0, 0, 1, 1,
0.4396965, 1.441834, 0.3176301, 0, 0, 0, 1, 1,
0.4429374, 0.5991626, 1.020935, 0, 0, 0, 1, 1,
0.445351, -1.191277, 1.750608, 0, 0, 0, 1, 1,
0.448994, 0.02553843, 1.243572, 0, 0, 0, 1, 1,
0.4512646, -0.7826788, 2.50741, 0, 0, 0, 1, 1,
0.4551216, 0.3279622, 1.445684, 0, 0, 0, 1, 1,
0.4575673, -0.4644127, 3.529759, 0, 0, 0, 1, 1,
0.4608337, -0.4053603, 2.595547, 1, 1, 1, 1, 1,
0.4680169, 1.252521, 0.2747859, 1, 1, 1, 1, 1,
0.4700187, 0.3667461, 2.193258, 1, 1, 1, 1, 1,
0.471653, -0.3053989, 3.594923, 1, 1, 1, 1, 1,
0.4729059, -0.4747654, 1.710408, 1, 1, 1, 1, 1,
0.4750535, -0.9361624, 3.977952, 1, 1, 1, 1, 1,
0.4801963, -1.081132, 2.369605, 1, 1, 1, 1, 1,
0.4831439, -0.239168, 2.841067, 1, 1, 1, 1, 1,
0.4879029, -0.8272249, 1.26186, 1, 1, 1, 1, 1,
0.4883872, -0.427529, 2.775819, 1, 1, 1, 1, 1,
0.4885753, -0.6141926, 1.522078, 1, 1, 1, 1, 1,
0.4933518, -0.3327471, 1.346007, 1, 1, 1, 1, 1,
0.4953542, 1.737329, -0.3338388, 1, 1, 1, 1, 1,
0.4964622, -0.5022887, 2.109075, 1, 1, 1, 1, 1,
0.497079, -0.2879502, 3.825944, 1, 1, 1, 1, 1,
0.4981843, 0.139589, 1.050568, 0, 0, 1, 1, 1,
0.499658, -1.457179, 2.374092, 1, 0, 0, 1, 1,
0.5023954, -0.1295362, 1.7866, 1, 0, 0, 1, 1,
0.5072066, 0.008936546, 3.870447, 1, 0, 0, 1, 1,
0.5088574, 0.6057511, -0.08847117, 1, 0, 0, 1, 1,
0.5130987, 0.8094392, 0.9609829, 1, 0, 0, 1, 1,
0.5176625, -1.017789, 4.260509, 0, 0, 0, 1, 1,
0.5197209, 0.8772104, 0.5180603, 0, 0, 0, 1, 1,
0.5201985, -1.105293, 2.828615, 0, 0, 0, 1, 1,
0.5234621, -0.7529913, 3.626662, 0, 0, 0, 1, 1,
0.5260718, -0.3446265, 0.2067696, 0, 0, 0, 1, 1,
0.5267676, 1.249125, -0.2110367, 0, 0, 0, 1, 1,
0.5276128, 1.098623, 0.03656264, 0, 0, 0, 1, 1,
0.528752, 1.193547, 2.588247, 1, 1, 1, 1, 1,
0.5366101, 0.5942631, 1.41701, 1, 1, 1, 1, 1,
0.5379071, -0.0936335, 1.836578, 1, 1, 1, 1, 1,
0.5382419, -0.521811, 2.427926, 1, 1, 1, 1, 1,
0.542116, -0.5201653, 4.119803, 1, 1, 1, 1, 1,
0.542634, -0.1930294, 0.7273172, 1, 1, 1, 1, 1,
0.5444146, -0.8832588, 1.296196, 1, 1, 1, 1, 1,
0.5444365, -0.5735988, 2.636846, 1, 1, 1, 1, 1,
0.5454414, -2.039436, 2.939547, 1, 1, 1, 1, 1,
0.5493171, -0.8529252, 3.078409, 1, 1, 1, 1, 1,
0.5506659, -0.4931986, 2.544746, 1, 1, 1, 1, 1,
0.5512298, -0.2020059, 0.9415792, 1, 1, 1, 1, 1,
0.5529612, 0.49036, 1.749861, 1, 1, 1, 1, 1,
0.5539911, 1.750818, 1.388781, 1, 1, 1, 1, 1,
0.556643, 0.4411807, -0.9625122, 1, 1, 1, 1, 1,
0.5594024, 1.171095, -1.663444, 0, 0, 1, 1, 1,
0.5596748, 0.1750706, 1.159123, 1, 0, 0, 1, 1,
0.5610287, 0.3771442, -0.6854702, 1, 0, 0, 1, 1,
0.5652266, 1.616089, -0.7057367, 1, 0, 0, 1, 1,
0.5658969, 0.408917, 2.328307, 1, 0, 0, 1, 1,
0.5672409, -0.3597845, 2.848051, 1, 0, 0, 1, 1,
0.5741138, 0.9484683, -0.1428864, 0, 0, 0, 1, 1,
0.5785964, -0.00590415, 0.871646, 0, 0, 0, 1, 1,
0.5788512, 0.3380656, 1.578125, 0, 0, 0, 1, 1,
0.5817887, 2.082483, 1.272032, 0, 0, 0, 1, 1,
0.5829101, -2.448438, 4.664066, 0, 0, 0, 1, 1,
0.5835707, -0.2628286, 2.603877, 0, 0, 0, 1, 1,
0.5852409, -1.059499, 2.111596, 0, 0, 0, 1, 1,
0.5862327, -1.37285, 2.760798, 1, 1, 1, 1, 1,
0.5863004, -0.5891642, 1.556058, 1, 1, 1, 1, 1,
0.5888878, 0.5321823, 2.640429, 1, 1, 1, 1, 1,
0.5902521, 1.735566, 0.2906619, 1, 1, 1, 1, 1,
0.59071, -0.3698881, 2.239637, 1, 1, 1, 1, 1,
0.593236, 0.04060811, 0.7934648, 1, 1, 1, 1, 1,
0.6023237, -1.222923, 1.772534, 1, 1, 1, 1, 1,
0.6055983, 0.4692928, 0.4191738, 1, 1, 1, 1, 1,
0.6075718, -0.07541043, -0.007896471, 1, 1, 1, 1, 1,
0.6126759, 0.8691587, 1.243393, 1, 1, 1, 1, 1,
0.6163419, -0.3226923, 2.537277, 1, 1, 1, 1, 1,
0.6227399, -0.4063729, 2.927322, 1, 1, 1, 1, 1,
0.6238726, 0.5524008, -0.02091804, 1, 1, 1, 1, 1,
0.630924, -0.1577043, 2.672578, 1, 1, 1, 1, 1,
0.6348889, -1.292635, 2.329552, 1, 1, 1, 1, 1,
0.6351855, 0.4974571, -0.6905169, 0, 0, 1, 1, 1,
0.6424507, 1.535946, -0.6395755, 1, 0, 0, 1, 1,
0.6428744, 1.773512, 1.465075, 1, 0, 0, 1, 1,
0.6437747, 0.1851378, 0.1926734, 1, 0, 0, 1, 1,
0.6467079, -0.9337932, 2.775322, 1, 0, 0, 1, 1,
0.6470605, -1.229736, 4.583173, 1, 0, 0, 1, 1,
0.6489875, 0.8299553, 1.808013, 0, 0, 0, 1, 1,
0.6504133, 1.233344, 1.549236, 0, 0, 0, 1, 1,
0.651055, -0.8343663, 3.906153, 0, 0, 0, 1, 1,
0.6515027, 1.599625, 1.055709, 0, 0, 0, 1, 1,
0.6529518, 0.3167787, 1.936833, 0, 0, 0, 1, 1,
0.6547881, 0.9285361, -0.5494866, 0, 0, 0, 1, 1,
0.6562892, 1.657096, -0.7317538, 0, 0, 0, 1, 1,
0.6585652, 1.610863, 0.5008702, 1, 1, 1, 1, 1,
0.6626646, -0.8598659, 2.200541, 1, 1, 1, 1, 1,
0.6705775, -0.5731664, 1.253944, 1, 1, 1, 1, 1,
0.6713467, -0.6488843, 3.045877, 1, 1, 1, 1, 1,
0.6722987, -1.490395, 2.858196, 1, 1, 1, 1, 1,
0.6723716, 1.177519, -0.008634151, 1, 1, 1, 1, 1,
0.6727796, -0.1008041, 2.836826, 1, 1, 1, 1, 1,
0.6753361, 0.4074868, 0.4447065, 1, 1, 1, 1, 1,
0.6767701, -0.2220813, 1.70321, 1, 1, 1, 1, 1,
0.6773966, 0.9409257, 0.7324371, 1, 1, 1, 1, 1,
0.6789038, 0.02036291, 0.9100727, 1, 1, 1, 1, 1,
0.6799292, 1.055487, -0.5927925, 1, 1, 1, 1, 1,
0.6812317, 0.5094821, 0.2712384, 1, 1, 1, 1, 1,
0.6950691, 0.1453954, 1.096945, 1, 1, 1, 1, 1,
0.7031301, -0.7651597, 1.808656, 1, 1, 1, 1, 1,
0.7032703, 0.9074602, -1.380109, 0, 0, 1, 1, 1,
0.7121065, 2.889943, -0.06005322, 1, 0, 0, 1, 1,
0.7146184, 0.01875867, 0.7025562, 1, 0, 0, 1, 1,
0.7234424, 0.3821667, 1.242244, 1, 0, 0, 1, 1,
0.724622, 0.2233258, 1.452445, 1, 0, 0, 1, 1,
0.7279295, 0.4444883, 2.158639, 1, 0, 0, 1, 1,
0.729691, 1.247165, 0.4109912, 0, 0, 0, 1, 1,
0.7306706, 0.4537759, 0.4034823, 0, 0, 0, 1, 1,
0.7362593, 0.7590086, 0.4165255, 0, 0, 0, 1, 1,
0.7386276, -0.2303182, -0.05395642, 0, 0, 0, 1, 1,
0.7395183, -0.2417867, 2.070566, 0, 0, 0, 1, 1,
0.7434931, -0.3628186, 5.12371, 0, 0, 0, 1, 1,
0.750941, -0.4204244, 1.834615, 0, 0, 0, 1, 1,
0.7542443, 0.05002125, 0.984396, 1, 1, 1, 1, 1,
0.7647834, 0.1020017, -0.2111786, 1, 1, 1, 1, 1,
0.7684019, 0.471002, 0.8291968, 1, 1, 1, 1, 1,
0.7713195, -1.20249, 3.852476, 1, 1, 1, 1, 1,
0.7720605, 0.6005161, 1.20606, 1, 1, 1, 1, 1,
0.7756304, -1.23128, 3.094872, 1, 1, 1, 1, 1,
0.7790316, 0.4890032, 2.747599, 1, 1, 1, 1, 1,
0.783775, -0.861742, 2.472122, 1, 1, 1, 1, 1,
0.7868159, 0.732745, 0.4326927, 1, 1, 1, 1, 1,
0.7934356, 1.957648, 0.8579763, 1, 1, 1, 1, 1,
0.7954993, 0.667723, 1.667417, 1, 1, 1, 1, 1,
0.7988545, 1.65698, -0.4258432, 1, 1, 1, 1, 1,
0.8060464, -0.1932883, 1.87675, 1, 1, 1, 1, 1,
0.81103, -0.5062191, 2.210588, 1, 1, 1, 1, 1,
0.8173246, 0.3678953, 0.6211057, 1, 1, 1, 1, 1,
0.8195767, -0.02325047, 2.602313, 0, 0, 1, 1, 1,
0.8226256, -0.2530053, 1.038352, 1, 0, 0, 1, 1,
0.8306423, 0.1855976, 1.075897, 1, 0, 0, 1, 1,
0.8307117, 1.079831, -0.4399288, 1, 0, 0, 1, 1,
0.8366597, 1.13066, 1.198148, 1, 0, 0, 1, 1,
0.8397068, -0.8869759, 3.699702, 1, 0, 0, 1, 1,
0.8405383, 0.2544489, 0.1646667, 0, 0, 0, 1, 1,
0.8425723, -0.8515597, 2.425304, 0, 0, 0, 1, 1,
0.8444938, -0.5711728, 2.324916, 0, 0, 0, 1, 1,
0.8451185, 0.8151215, 0.5019755, 0, 0, 0, 1, 1,
0.8500382, 0.4148269, 0.6242595, 0, 0, 0, 1, 1,
0.8544025, 0.1089628, 2.423826, 0, 0, 0, 1, 1,
0.8545024, 2.198602, 0.502176, 0, 0, 0, 1, 1,
0.8634197, 0.7642446, -0.1606022, 1, 1, 1, 1, 1,
0.8636665, 0.8740141, 1.577276, 1, 1, 1, 1, 1,
0.8645062, 1.518277, 2.566254, 1, 1, 1, 1, 1,
0.8760371, 1.15324, 0.209162, 1, 1, 1, 1, 1,
0.8795027, 0.9452077, -0.90831, 1, 1, 1, 1, 1,
0.8925927, 0.8759426, 1.619322, 1, 1, 1, 1, 1,
0.8962836, -1.070281, 2.145856, 1, 1, 1, 1, 1,
0.9028319, -0.159744, 3.247319, 1, 1, 1, 1, 1,
0.9064689, -0.1205981, 2.33152, 1, 1, 1, 1, 1,
0.9070355, 0.1343465, 2.774522, 1, 1, 1, 1, 1,
0.9248011, 0.1379433, -0.09619177, 1, 1, 1, 1, 1,
0.9362644, -0.1268001, 1.504161, 1, 1, 1, 1, 1,
0.9500733, 1.241606, -0.6403987, 1, 1, 1, 1, 1,
0.9518876, 0.546993, 1.598873, 1, 1, 1, 1, 1,
0.9528779, -0.9688835, 1.105951, 1, 1, 1, 1, 1,
0.9536647, 0.9639177, 0.9418899, 0, 0, 1, 1, 1,
0.9595814, 1.701219, 0.6324854, 1, 0, 0, 1, 1,
0.9874363, 0.267559, 2.237105, 1, 0, 0, 1, 1,
0.9944074, -0.7701224, 3.901194, 1, 0, 0, 1, 1,
0.9981754, 0.09705386, 2.119898, 1, 0, 0, 1, 1,
1.001692, -0.9088625, 2.48725, 1, 0, 0, 1, 1,
1.00265, 2.410513, 0.2894119, 0, 0, 0, 1, 1,
1.008718, 1.148818, -0.218515, 0, 0, 0, 1, 1,
1.017581, -1.355036, 4.657679, 0, 0, 0, 1, 1,
1.021376, 0.4421691, 0.9306771, 0, 0, 0, 1, 1,
1.023989, 0.8345749, 1.631195, 0, 0, 0, 1, 1,
1.024855, 0.4830193, 1.659555, 0, 0, 0, 1, 1,
1.043383, 0.195879, 2.042429, 0, 0, 0, 1, 1,
1.045334, 0.9032189, 1.594547, 1, 1, 1, 1, 1,
1.045773, -0.5520692, 2.674554, 1, 1, 1, 1, 1,
1.046778, -1.030351, 2.58168, 1, 1, 1, 1, 1,
1.050494, -0.5334535, 2.049807, 1, 1, 1, 1, 1,
1.051888, 0.09022537, 0.6679584, 1, 1, 1, 1, 1,
1.052545, -0.4045821, 1.584602, 1, 1, 1, 1, 1,
1.058401, 1.059173, 0.223353, 1, 1, 1, 1, 1,
1.058798, 1.628236, 1.509021, 1, 1, 1, 1, 1,
1.061114, -0.7146714, 2.036599, 1, 1, 1, 1, 1,
1.066598, 1.175356, 1.534356, 1, 1, 1, 1, 1,
1.072374, -1.053941, 3.735711, 1, 1, 1, 1, 1,
1.088426, 0.8800332, 2.205755, 1, 1, 1, 1, 1,
1.092462, 0.129466, 0.2200187, 1, 1, 1, 1, 1,
1.110791, 0.1651476, 1.049104, 1, 1, 1, 1, 1,
1.111122, 0.5574328, 1.735798, 1, 1, 1, 1, 1,
1.130204, 0.2343378, 0.5592013, 0, 0, 1, 1, 1,
1.130447, -1.140337, 1.443058, 1, 0, 0, 1, 1,
1.138234, -0.5801144, 3.667705, 1, 0, 0, 1, 1,
1.138399, -0.2213728, 0.3951882, 1, 0, 0, 1, 1,
1.150461, -0.2288272, 1.756076, 1, 0, 0, 1, 1,
1.151537, -0.4897627, 2.271778, 1, 0, 0, 1, 1,
1.156191, 0.3808608, 0.650422, 0, 0, 0, 1, 1,
1.157134, 0.2958941, 1.159534, 0, 0, 0, 1, 1,
1.161092, -0.5578689, 1.836544, 0, 0, 0, 1, 1,
1.164034, 0.270261, 1.723095, 0, 0, 0, 1, 1,
1.167052, 0.07975981, 1.779995, 0, 0, 0, 1, 1,
1.176583, -0.262697, 1.288346, 0, 0, 0, 1, 1,
1.177722, -0.6604394, 0.389619, 0, 0, 0, 1, 1,
1.18309, -1.053842, 2.21356, 1, 1, 1, 1, 1,
1.185948, -0.4987554, 1.099685, 1, 1, 1, 1, 1,
1.188991, -0.2741249, -0.07454059, 1, 1, 1, 1, 1,
1.189927, -1.46887, 3.311536, 1, 1, 1, 1, 1,
1.200642, 0.5674195, 1.714699, 1, 1, 1, 1, 1,
1.201348, -0.905412, 2.988133, 1, 1, 1, 1, 1,
1.201568, 0.08354525, 3.721323, 1, 1, 1, 1, 1,
1.203696, 0.09513742, 1.144866, 1, 1, 1, 1, 1,
1.206682, 1.379255, 0.5910458, 1, 1, 1, 1, 1,
1.208799, -0.8868099, 1.932039, 1, 1, 1, 1, 1,
1.213841, 0.106732, 1.772843, 1, 1, 1, 1, 1,
1.214469, 1.681558, 0.58027, 1, 1, 1, 1, 1,
1.225623, -0.2631033, 2.274336, 1, 1, 1, 1, 1,
1.225917, -0.7240801, 1.393841, 1, 1, 1, 1, 1,
1.234746, -0.2841034, 2.672916, 1, 1, 1, 1, 1,
1.235544, -0.3738549, 2.521824, 0, 0, 1, 1, 1,
1.235777, 2.323752, -0.1602204, 1, 0, 0, 1, 1,
1.239698, 2.338886, 0.2228565, 1, 0, 0, 1, 1,
1.24164, 0.7021757, 0.6868491, 1, 0, 0, 1, 1,
1.243951, 0.9190206, -0.09459231, 1, 0, 0, 1, 1,
1.251558, 0.7255916, 1.944985, 1, 0, 0, 1, 1,
1.261241, -0.849331, 1.183909, 0, 0, 0, 1, 1,
1.274932, 0.1725602, 0.6944085, 0, 0, 0, 1, 1,
1.281564, -0.3823822, 1.268821, 0, 0, 0, 1, 1,
1.291854, -0.4595533, 1.731155, 0, 0, 0, 1, 1,
1.298265, 0.9960943, 2.630677, 0, 0, 0, 1, 1,
1.300923, 1.049008, 1.441925, 0, 0, 0, 1, 1,
1.315398, -0.5304515, 1.173737, 0, 0, 0, 1, 1,
1.32326, 0.4916865, 2.060737, 1, 1, 1, 1, 1,
1.33289, 0.2068557, 0.7969548, 1, 1, 1, 1, 1,
1.340297, 0.5674249, 1.880495, 1, 1, 1, 1, 1,
1.345374, 0.1301186, 2.532239, 1, 1, 1, 1, 1,
1.346667, 0.7313033, 2.919148, 1, 1, 1, 1, 1,
1.347406, -0.2662227, 2.509904, 1, 1, 1, 1, 1,
1.350837, -0.9377397, 4.473368, 1, 1, 1, 1, 1,
1.360635, -0.2241104, 1.371328, 1, 1, 1, 1, 1,
1.361673, 0.7343585, -0.27286, 1, 1, 1, 1, 1,
1.364229, 0.3049489, 3.723714, 1, 1, 1, 1, 1,
1.380561, 1.157554, 1.819247, 1, 1, 1, 1, 1,
1.391923, -0.3776878, 2.700402, 1, 1, 1, 1, 1,
1.393559, -0.03446174, 1.867549, 1, 1, 1, 1, 1,
1.406729, -0.6765095, 2.382627, 1, 1, 1, 1, 1,
1.413177, 0.6972713, -0.5910051, 1, 1, 1, 1, 1,
1.450235, 0.104964, 3.348547, 0, 0, 1, 1, 1,
1.454265, 1.138247, 1.462631, 1, 0, 0, 1, 1,
1.455456, -0.2879467, 0.7660522, 1, 0, 0, 1, 1,
1.462404, -1.215504, 2.562158, 1, 0, 0, 1, 1,
1.465015, -2.513822, 1.593485, 1, 0, 0, 1, 1,
1.466866, -1.700391, 1.623595, 1, 0, 0, 1, 1,
1.485042, -1.815219, 3.607517, 0, 0, 0, 1, 1,
1.486564, -0.8253662, 1.77639, 0, 0, 0, 1, 1,
1.487658, 1.104603, -0.02843226, 0, 0, 0, 1, 1,
1.49537, -0.4262664, 2.954491, 0, 0, 0, 1, 1,
1.496595, 0.7941421, 2.428514, 0, 0, 0, 1, 1,
1.498168, 0.7520521, 0.7142903, 0, 0, 0, 1, 1,
1.511528, -0.2685943, 1.552455, 0, 0, 0, 1, 1,
1.514385, -1.496497, 1.582666, 1, 1, 1, 1, 1,
1.526446, 1.488804, -0.02230792, 1, 1, 1, 1, 1,
1.528422, -0.6125776, 3.418287, 1, 1, 1, 1, 1,
1.529376, 0.8351991, 1.963603, 1, 1, 1, 1, 1,
1.535483, 0.6589859, 0.18327, 1, 1, 1, 1, 1,
1.547059, -1.104136, 0.4615549, 1, 1, 1, 1, 1,
1.548646, -0.1921833, 0.6260761, 1, 1, 1, 1, 1,
1.550633, -1.598653, 1.14554, 1, 1, 1, 1, 1,
1.552696, 0.8631509, 0.3131422, 1, 1, 1, 1, 1,
1.552708, 0.9997949, 0.9369139, 1, 1, 1, 1, 1,
1.571174, 0.1005176, 2.587043, 1, 1, 1, 1, 1,
1.572372, 1.824434, 1.226923, 1, 1, 1, 1, 1,
1.577256, -0.8444561, 2.48527, 1, 1, 1, 1, 1,
1.584626, -0.4178082, 2.534072, 1, 1, 1, 1, 1,
1.588015, 0.879538, 2.153028, 1, 1, 1, 1, 1,
1.595028, 0.1637363, 2.108028, 0, 0, 1, 1, 1,
1.598467, -0.5977708, 2.804645, 1, 0, 0, 1, 1,
1.600974, -0.8558449, 3.09222, 1, 0, 0, 1, 1,
1.607062, -0.06949586, 2.243168, 1, 0, 0, 1, 1,
1.638266, -1.105838, 1.44536, 1, 0, 0, 1, 1,
1.649674, 1.751668, 0.5743505, 1, 0, 0, 1, 1,
1.694845, -0.08171334, 2.310314, 0, 0, 0, 1, 1,
1.704699, 0.1538049, 0.7297996, 0, 0, 0, 1, 1,
1.710086, -1.374067, 1.614298, 0, 0, 0, 1, 1,
1.723046, 0.1983209, -0.8063844, 0, 0, 0, 1, 1,
1.725771, -0.7461807, 1.973978, 0, 0, 0, 1, 1,
1.738378, 1.317479, -0.08104153, 0, 0, 0, 1, 1,
1.740676, -0.7651244, -0.2655671, 0, 0, 0, 1, 1,
1.741577, -1.621585, 1.34855, 1, 1, 1, 1, 1,
1.743734, 0.3866225, 2.343773, 1, 1, 1, 1, 1,
1.747132, -0.154314, 2.231133, 1, 1, 1, 1, 1,
1.768757, -0.1991663, 2.366441, 1, 1, 1, 1, 1,
1.779154, -0.686898, -0.3218985, 1, 1, 1, 1, 1,
1.782392, -2.177289, 3.813833, 1, 1, 1, 1, 1,
1.797965, 0.7843257, 0.1452584, 1, 1, 1, 1, 1,
1.84374, 2.142703, 0.6547253, 1, 1, 1, 1, 1,
1.84955, -0.1080784, 2.206118, 1, 1, 1, 1, 1,
1.865206, 1.84482, 0.4883535, 1, 1, 1, 1, 1,
1.875364, -1.422656, 2.008067, 1, 1, 1, 1, 1,
1.912995, 1.577057, 0.9213063, 1, 1, 1, 1, 1,
1.965486, -0.8515075, 2.263489, 1, 1, 1, 1, 1,
1.984749, -0.2444635, 3.739357, 1, 1, 1, 1, 1,
2.001471, 0.4531666, 2.072088, 1, 1, 1, 1, 1,
2.004532, 0.6118736, 3.021919, 0, 0, 1, 1, 1,
2.024003, 0.0002121395, 0.7017393, 1, 0, 0, 1, 1,
2.036581, 0.6618462, 1.260266, 1, 0, 0, 1, 1,
2.04742, -0.06626804, 2.151775, 1, 0, 0, 1, 1,
2.052416, -0.08274645, 0.2612234, 1, 0, 0, 1, 1,
2.05399, -0.05367494, 1.841041, 1, 0, 0, 1, 1,
2.057412, -0.3057778, 1.097468, 0, 0, 0, 1, 1,
2.072603, 1.873485, 1.736189, 0, 0, 0, 1, 1,
2.076007, 0.6907836, 0.2991937, 0, 0, 0, 1, 1,
2.15378, -0.7394061, 2.235594, 0, 0, 0, 1, 1,
2.352531, -2.508057, 1.596113, 0, 0, 0, 1, 1,
2.361947, 0.6052844, 0.05615759, 0, 0, 0, 1, 1,
2.402611, -0.332019, -0.0393225, 0, 0, 0, 1, 1,
2.421214, -0.7604693, 2.595972, 1, 1, 1, 1, 1,
2.465074, -0.723559, 3.957354, 1, 1, 1, 1, 1,
2.542457, -1.524201, 1.132801, 1, 1, 1, 1, 1,
2.651572, -0.3662595, 2.590399, 1, 1, 1, 1, 1,
2.991579, -1.338469, 2.359798, 1, 1, 1, 1, 1,
3.0383, 1.055675, 0.6777036, 1, 1, 1, 1, 1,
3.068144, -0.5849541, 1.729046, 1, 1, 1, 1, 1
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
var radius = 9.669004;
var distance = 33.96196;
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
mvMatrix.translate( 0.3274658, -0.3674115, -0.2960951 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96196);
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