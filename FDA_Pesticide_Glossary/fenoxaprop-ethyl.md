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
-3.118898, -1.035485, -2.008364, 1, 0, 0, 1,
-3.053695, 0.08160283, -1.872964, 1, 0.007843138, 0, 1,
-2.745265, -0.7010444, -3.018297, 1, 0.01176471, 0, 1,
-2.477518, 0.0672989, -3.025019, 1, 0.01960784, 0, 1,
-2.44511, 1.192372, -0.9874839, 1, 0.02352941, 0, 1,
-2.443052, 1.232399, -3.246611, 1, 0.03137255, 0, 1,
-2.348281, 1.669939, -0.4264325, 1, 0.03529412, 0, 1,
-2.321486, 0.5654068, -2.238209, 1, 0.04313726, 0, 1,
-2.300333, 0.00941884, -3.813576, 1, 0.04705882, 0, 1,
-2.277969, 0.1331951, -2.587316, 1, 0.05490196, 0, 1,
-2.202149, 1.746776, -1.991995, 1, 0.05882353, 0, 1,
-2.13137, -0.7587609, -0.9825233, 1, 0.06666667, 0, 1,
-2.117619, 0.9639699, -1.049609, 1, 0.07058824, 0, 1,
-2.078654, 0.1678978, -1.837873, 1, 0.07843138, 0, 1,
-2.020606, -1.531362, -4.09108, 1, 0.08235294, 0, 1,
-2.0165, -0.6757478, -4.20162, 1, 0.09019608, 0, 1,
-1.993622, 0.547849, -0.1984251, 1, 0.09411765, 0, 1,
-1.906589, -1.068851, -2.709877, 1, 0.1019608, 0, 1,
-1.898299, -0.04521499, 0.2385461, 1, 0.1098039, 0, 1,
-1.88536, 0.6236379, -1.919933, 1, 0.1137255, 0, 1,
-1.880663, -0.4917636, -0.8201182, 1, 0.1215686, 0, 1,
-1.873281, -0.2619913, 0.276357, 1, 0.1254902, 0, 1,
-1.863461, -0.189047, -0.8640683, 1, 0.1333333, 0, 1,
-1.858077, 0.7338271, -1.391204, 1, 0.1372549, 0, 1,
-1.841741, -2.005029, -3.705372, 1, 0.145098, 0, 1,
-1.817789, -0.4926168, -1.608668, 1, 0.1490196, 0, 1,
-1.803316, -0.04240229, -0.9911629, 1, 0.1568628, 0, 1,
-1.791312, 0.5575407, -0.7427244, 1, 0.1607843, 0, 1,
-1.770988, -0.4227495, -1.910602, 1, 0.1686275, 0, 1,
-1.750591, 2.253599, 0.580023, 1, 0.172549, 0, 1,
-1.742213, 0.4063287, -3.517739, 1, 0.1803922, 0, 1,
-1.73442, 0.4693934, -0.2495853, 1, 0.1843137, 0, 1,
-1.733315, -0.9923872, -3.621402, 1, 0.1921569, 0, 1,
-1.713341, -0.5499716, -0.9883854, 1, 0.1960784, 0, 1,
-1.690272, 1.861559, 0.3658548, 1, 0.2039216, 0, 1,
-1.686751, -1.540417, -2.203642, 1, 0.2117647, 0, 1,
-1.684469, 0.5931942, -0.516866, 1, 0.2156863, 0, 1,
-1.682548, -0.1608979, -1.498559, 1, 0.2235294, 0, 1,
-1.67416, 0.8996448, -3.866819, 1, 0.227451, 0, 1,
-1.673951, 0.9425978, -0.989253, 1, 0.2352941, 0, 1,
-1.672107, -0.7734849, -2.135271, 1, 0.2392157, 0, 1,
-1.67115, -0.6730588, -1.189632, 1, 0.2470588, 0, 1,
-1.656683, -0.9176256, -1.767625, 1, 0.2509804, 0, 1,
-1.653079, 1.748401, -1.596483, 1, 0.2588235, 0, 1,
-1.628537, -0.9673576, -4.263802, 1, 0.2627451, 0, 1,
-1.62163, 1.260491, -0.9144914, 1, 0.2705882, 0, 1,
-1.606309, 2.085186, -0.7870702, 1, 0.2745098, 0, 1,
-1.599383, -0.03533971, -2.589912, 1, 0.282353, 0, 1,
-1.586098, 1.459134, -0.5464379, 1, 0.2862745, 0, 1,
-1.579311, 0.6249503, -0.8189096, 1, 0.2941177, 0, 1,
-1.560582, -0.245547, -4.230131, 1, 0.3019608, 0, 1,
-1.529653, -0.8096825, -1.625109, 1, 0.3058824, 0, 1,
-1.520761, 0.3446596, -1.732951, 1, 0.3137255, 0, 1,
-1.491734, -0.6121169, -3.412598, 1, 0.3176471, 0, 1,
-1.47297, -0.7522137, -2.087048, 1, 0.3254902, 0, 1,
-1.466681, -1.57616, -3.977942, 1, 0.3294118, 0, 1,
-1.461479, 0.9706014, -2.163023, 1, 0.3372549, 0, 1,
-1.461312, 0.2384659, 1.892255, 1, 0.3411765, 0, 1,
-1.45179, -0.2053021, 0.7076107, 1, 0.3490196, 0, 1,
-1.435906, -0.6339837, -2.223777, 1, 0.3529412, 0, 1,
-1.419834, 0.1653992, -1.82583, 1, 0.3607843, 0, 1,
-1.418298, -0.3799097, -2.697906, 1, 0.3647059, 0, 1,
-1.416881, -0.9902331, -3.245666, 1, 0.372549, 0, 1,
-1.416466, 0.2595687, -1.772878, 1, 0.3764706, 0, 1,
-1.416133, 0.627055, -0.5334342, 1, 0.3843137, 0, 1,
-1.402774, -0.3875336, -1.269999, 1, 0.3882353, 0, 1,
-1.381143, 1.255788, -2.264248, 1, 0.3960784, 0, 1,
-1.360199, 1.509666, -1.34479, 1, 0.4039216, 0, 1,
-1.335182, -0.8828449, -1.286205, 1, 0.4078431, 0, 1,
-1.328218, 0.05417332, -1.826976, 1, 0.4156863, 0, 1,
-1.327903, 0.2102723, -2.194736, 1, 0.4196078, 0, 1,
-1.320932, -0.5453255, 0.2154854, 1, 0.427451, 0, 1,
-1.299587, -1.584359, -3.82513, 1, 0.4313726, 0, 1,
-1.275002, -1.027684, -1.22122, 1, 0.4392157, 0, 1,
-1.271286, 1.268513, -1.34559, 1, 0.4431373, 0, 1,
-1.262933, -0.2042173, -2.723352, 1, 0.4509804, 0, 1,
-1.259542, -0.700528, -2.251206, 1, 0.454902, 0, 1,
-1.256953, 0.04144043, -2.647911, 1, 0.4627451, 0, 1,
-1.254912, 0.3663998, -1.602413, 1, 0.4666667, 0, 1,
-1.243821, 1.293787, -0.144185, 1, 0.4745098, 0, 1,
-1.240608, 0.8700954, -3.429613, 1, 0.4784314, 0, 1,
-1.239669, 0.6139078, -1.790149, 1, 0.4862745, 0, 1,
-1.237946, -0.7885097, -1.621218, 1, 0.4901961, 0, 1,
-1.2325, -0.8835563, -0.8296369, 1, 0.4980392, 0, 1,
-1.230122, -1.37146, -1.067188, 1, 0.5058824, 0, 1,
-1.224797, -0.2150403, -2.129308, 1, 0.509804, 0, 1,
-1.220088, 0.4602737, -1.515002, 1, 0.5176471, 0, 1,
-1.209012, -1.655966, -3.255475, 1, 0.5215687, 0, 1,
-1.193061, 0.5222026, -1.783222, 1, 0.5294118, 0, 1,
-1.193036, 0.5271827, 0.354389, 1, 0.5333334, 0, 1,
-1.186807, -0.3067746, -3.795217, 1, 0.5411765, 0, 1,
-1.185528, -0.01710448, -1.004879, 1, 0.5450981, 0, 1,
-1.174986, 2.043208, -1.280225, 1, 0.5529412, 0, 1,
-1.163912, 0.2591564, -1.844789, 1, 0.5568628, 0, 1,
-1.16223, 0.6147211, -1.960899, 1, 0.5647059, 0, 1,
-1.158887, -0.1113404, -1.792303, 1, 0.5686275, 0, 1,
-1.154617, 0.2925455, -1.836819, 1, 0.5764706, 0, 1,
-1.148806, 0.350369, 0.2068148, 1, 0.5803922, 0, 1,
-1.144997, 1.421513, -0.2495531, 1, 0.5882353, 0, 1,
-1.144432, 0.8609408, -0.3064281, 1, 0.5921569, 0, 1,
-1.143692, 1.588715, -0.5300627, 1, 0.6, 0, 1,
-1.143356, 0.4111394, -3.640316, 1, 0.6078432, 0, 1,
-1.140993, -0.4362728, -3.448864, 1, 0.6117647, 0, 1,
-1.140064, -2.376502, -2.876983, 1, 0.6196079, 0, 1,
-1.138024, 0.2932088, -2.330731, 1, 0.6235294, 0, 1,
-1.137149, 0.3983987, -2.822727, 1, 0.6313726, 0, 1,
-1.135863, -0.3739255, -1.502771, 1, 0.6352941, 0, 1,
-1.132774, 0.9781374, -1.006453, 1, 0.6431373, 0, 1,
-1.130739, 0.07338462, 1.491863, 1, 0.6470588, 0, 1,
-1.124579, 1.373496, -0.09560288, 1, 0.654902, 0, 1,
-1.12419, -1.351287, -3.958453, 1, 0.6588235, 0, 1,
-1.118245, 0.01723734, -0.7350101, 1, 0.6666667, 0, 1,
-1.111953, 2.045906, -0.1538523, 1, 0.6705883, 0, 1,
-1.110002, 0.1668007, 0.06756108, 1, 0.6784314, 0, 1,
-1.098978, 1.101664, -1.754619, 1, 0.682353, 0, 1,
-1.097486, -0.04025212, -0.2913152, 1, 0.6901961, 0, 1,
-1.081639, -0.8328488, -0.9258093, 1, 0.6941177, 0, 1,
-1.078127, 0.3491949, -1.39349, 1, 0.7019608, 0, 1,
-1.068221, 0.1358234, -0.6378646, 1, 0.7098039, 0, 1,
-1.054953, 0.1917241, -2.445746, 1, 0.7137255, 0, 1,
-1.052791, -0.4027669, -1.131049, 1, 0.7215686, 0, 1,
-1.044061, 1.034849, -1.806553, 1, 0.7254902, 0, 1,
-1.032901, -0.4075595, -2.056055, 1, 0.7333333, 0, 1,
-1.028003, -1.273224, -1.694272, 1, 0.7372549, 0, 1,
-1.020025, 0.3545908, -2.9955, 1, 0.7450981, 0, 1,
-1.018842, -1.756299, -2.796474, 1, 0.7490196, 0, 1,
-1.017491, 0.2474536, -2.782736, 1, 0.7568628, 0, 1,
-1.010956, -0.03957136, -1.881766, 1, 0.7607843, 0, 1,
-1.010927, -0.922657, -2.890349, 1, 0.7686275, 0, 1,
-0.9999241, -0.1457195, -0.3957323, 1, 0.772549, 0, 1,
-0.9923146, 0.4742934, -0.9670829, 1, 0.7803922, 0, 1,
-0.9912608, 0.2306389, -1.826595, 1, 0.7843137, 0, 1,
-0.9825246, 0.8246738, -1.626059, 1, 0.7921569, 0, 1,
-0.9820053, 0.01592533, -1.786454, 1, 0.7960784, 0, 1,
-0.9784004, -1.675109, -1.851788, 1, 0.8039216, 0, 1,
-0.9782271, 0.7567666, 1.08153, 1, 0.8117647, 0, 1,
-0.974139, -0.3370232, -1.687909, 1, 0.8156863, 0, 1,
-0.9627812, 0.4181461, -1.506702, 1, 0.8235294, 0, 1,
-0.9620938, 1.661923, -0.9108142, 1, 0.827451, 0, 1,
-0.9499096, 0.7705285, -0.555447, 1, 0.8352941, 0, 1,
-0.9492224, -0.7887019, -2.497596, 1, 0.8392157, 0, 1,
-0.943988, -0.09539996, -0.03676455, 1, 0.8470588, 0, 1,
-0.9308799, -1.194551, -1.845923, 1, 0.8509804, 0, 1,
-0.9152855, -0.2587654, -1.78029, 1, 0.8588235, 0, 1,
-0.9082147, -1.393283, -2.513909, 1, 0.8627451, 0, 1,
-0.9076899, -0.3157751, -2.007853, 1, 0.8705882, 0, 1,
-0.9016014, -1.29204, -3.157468, 1, 0.8745098, 0, 1,
-0.8964949, -0.735496, -1.942461, 1, 0.8823529, 0, 1,
-0.8944634, 0.7573588, -0.2673917, 1, 0.8862745, 0, 1,
-0.8925817, -0.1569161, -1.635497, 1, 0.8941177, 0, 1,
-0.8918341, -0.9979833, -2.813062, 1, 0.8980392, 0, 1,
-0.8909799, 0.06513461, -1.134551, 1, 0.9058824, 0, 1,
-0.8882178, 0.3140947, -0.7282152, 1, 0.9137255, 0, 1,
-0.8857234, -1.908125, -4.66223, 1, 0.9176471, 0, 1,
-0.8821794, -0.33254, -2.483054, 1, 0.9254902, 0, 1,
-0.881061, -0.9417912, -1.038051, 1, 0.9294118, 0, 1,
-0.8789995, -1.451509, -2.780026, 1, 0.9372549, 0, 1,
-0.8776288, -1.017468, -1.965265, 1, 0.9411765, 0, 1,
-0.8774765, 2.242337, 1.023144, 1, 0.9490196, 0, 1,
-0.8723081, 0.05034262, -0.7868298, 1, 0.9529412, 0, 1,
-0.869514, -0.3897683, -1.680714, 1, 0.9607843, 0, 1,
-0.8692578, -0.7996129, -2.53826, 1, 0.9647059, 0, 1,
-0.8663375, -0.1580352, -1.829347, 1, 0.972549, 0, 1,
-0.8650752, 0.5576458, -1.742053, 1, 0.9764706, 0, 1,
-0.8632079, 0.8213937, -2.292638, 1, 0.9843137, 0, 1,
-0.8619302, 0.06001228, -1.295583, 1, 0.9882353, 0, 1,
-0.854327, -0.8834081, -3.414281, 1, 0.9960784, 0, 1,
-0.8530637, -0.779607, 0.4328671, 0.9960784, 1, 0, 1,
-0.8501881, 2.508873, 1.722881, 0.9921569, 1, 0, 1,
-0.8484159, -0.01897504, -1.424641, 0.9843137, 1, 0, 1,
-0.8394193, 0.1710734, -0.03903829, 0.9803922, 1, 0, 1,
-0.832454, -0.3080323, -2.795405, 0.972549, 1, 0, 1,
-0.8293553, 0.7703346, -0.3472384, 0.9686275, 1, 0, 1,
-0.8286949, -0.7924264, -1.935322, 0.9607843, 1, 0, 1,
-0.8271267, 1.561548, -0.6372494, 0.9568627, 1, 0, 1,
-0.8259317, 0.7479483, 1.142847, 0.9490196, 1, 0, 1,
-0.8184683, 1.619881, -1.585942, 0.945098, 1, 0, 1,
-0.8164681, 1.979015, -0.2842122, 0.9372549, 1, 0, 1,
-0.800813, 0.2274925, -1.56184, 0.9333333, 1, 0, 1,
-0.7999871, 2.586125, -1.273096, 0.9254902, 1, 0, 1,
-0.7995254, 1.555107, -2.610301, 0.9215686, 1, 0, 1,
-0.7941597, -0.9123416, -2.730585, 0.9137255, 1, 0, 1,
-0.7929227, -1.043919, -1.116252, 0.9098039, 1, 0, 1,
-0.7914335, -0.2266076, -1.89087, 0.9019608, 1, 0, 1,
-0.789708, 0.8919301, -0.6146609, 0.8941177, 1, 0, 1,
-0.7894031, -0.9743502, -2.127152, 0.8901961, 1, 0, 1,
-0.7836645, -0.4193485, -3.055499, 0.8823529, 1, 0, 1,
-0.7825022, -0.7070698, -2.02271, 0.8784314, 1, 0, 1,
-0.780768, -0.1765057, -2.786688, 0.8705882, 1, 0, 1,
-0.7806012, 1.8866, 0.91732, 0.8666667, 1, 0, 1,
-0.7770857, -0.1592865, -0.9806885, 0.8588235, 1, 0, 1,
-0.7750511, -0.2746648, -2.469315, 0.854902, 1, 0, 1,
-0.7737532, 0.6806811, -0.5582489, 0.8470588, 1, 0, 1,
-0.7676203, -0.4684639, -1.999952, 0.8431373, 1, 0, 1,
-0.7650017, 0.6806473, 0.4530182, 0.8352941, 1, 0, 1,
-0.7638705, -1.254463, -2.646732, 0.8313726, 1, 0, 1,
-0.7622755, -0.7905039, -3.125316, 0.8235294, 1, 0, 1,
-0.760484, -0.2705142, -1.594622, 0.8196079, 1, 0, 1,
-0.7565637, -0.9483825, -3.439727, 0.8117647, 1, 0, 1,
-0.755976, 0.3659189, -2.243739, 0.8078431, 1, 0, 1,
-0.7442681, 0.5218402, -0.09779144, 0.8, 1, 0, 1,
-0.7431786, 2.071223, -0.5574748, 0.7921569, 1, 0, 1,
-0.7382605, -2.019405, -3.985575, 0.7882353, 1, 0, 1,
-0.7321851, -0.2630834, -1.990457, 0.7803922, 1, 0, 1,
-0.7171984, -1.257592, -3.11947, 0.7764706, 1, 0, 1,
-0.7042501, -1.309584, -3.442965, 0.7686275, 1, 0, 1,
-0.7018973, 1.253479, -1.700539, 0.7647059, 1, 0, 1,
-0.6969804, 0.608, -0.5143431, 0.7568628, 1, 0, 1,
-0.6860993, -0.6575318, -0.9237027, 0.7529412, 1, 0, 1,
-0.6855725, -0.3758154, -2.662506, 0.7450981, 1, 0, 1,
-0.6839122, -0.07510979, -3.320403, 0.7411765, 1, 0, 1,
-0.6805567, -0.8358396, -2.551763, 0.7333333, 1, 0, 1,
-0.678228, 0.06026255, -4.541914, 0.7294118, 1, 0, 1,
-0.6771342, -0.7514617, -4.125165, 0.7215686, 1, 0, 1,
-0.6734318, 0.2358499, -1.378514, 0.7176471, 1, 0, 1,
-0.6710811, 0.6278296, -1.154227, 0.7098039, 1, 0, 1,
-0.6708578, 2.549678, -1.284777, 0.7058824, 1, 0, 1,
-0.6693516, -0.3924741, -1.596376, 0.6980392, 1, 0, 1,
-0.6671216, -1.193607, -1.886019, 0.6901961, 1, 0, 1,
-0.6668977, 2.563195, -0.02137744, 0.6862745, 1, 0, 1,
-0.6654512, -0.002156724, -3.540979, 0.6784314, 1, 0, 1,
-0.6649442, -0.526559, -3.741701, 0.6745098, 1, 0, 1,
-0.6632506, -1.776926, -2.165915, 0.6666667, 1, 0, 1,
-0.6576257, -0.6830154, -2.827389, 0.6627451, 1, 0, 1,
-0.6569725, 0.1582286, -2.797328, 0.654902, 1, 0, 1,
-0.656749, 1.13773, -0.7694096, 0.6509804, 1, 0, 1,
-0.6562342, -0.06787512, -0.3529381, 0.6431373, 1, 0, 1,
-0.6515859, -1.098701, -4.859747, 0.6392157, 1, 0, 1,
-0.6474521, -0.18408, -0.3375142, 0.6313726, 1, 0, 1,
-0.6343126, 1.303653, -1.096034, 0.627451, 1, 0, 1,
-0.6343123, 1.0971, -1.292747, 0.6196079, 1, 0, 1,
-0.6322708, 0.08028414, -2.253247, 0.6156863, 1, 0, 1,
-0.6321431, -0.09431791, -0.7072619, 0.6078432, 1, 0, 1,
-0.63117, 0.1779648, -1.30606, 0.6039216, 1, 0, 1,
-0.6309003, -1.53214, -1.756691, 0.5960785, 1, 0, 1,
-0.6297594, -0.5616139, -2.810316, 0.5882353, 1, 0, 1,
-0.6160701, -0.9127526, -1.562293, 0.5843138, 1, 0, 1,
-0.6131217, 0.5734561, -1.18796, 0.5764706, 1, 0, 1,
-0.5993521, 0.5255632, -1.372792, 0.572549, 1, 0, 1,
-0.587073, -0.9191036, -3.567908, 0.5647059, 1, 0, 1,
-0.5856761, 0.6249068, -2.028833, 0.5607843, 1, 0, 1,
-0.5848134, 0.02077909, -0.906823, 0.5529412, 1, 0, 1,
-0.5804723, 1.387166, -1.330593, 0.5490196, 1, 0, 1,
-0.5776791, 0.2410474, -2.216891, 0.5411765, 1, 0, 1,
-0.5754921, 0.5668146, -0.444901, 0.5372549, 1, 0, 1,
-0.5749764, 1.705224, -1.891632, 0.5294118, 1, 0, 1,
-0.5733237, -0.6068524, -1.21976, 0.5254902, 1, 0, 1,
-0.5634729, 0.1764351, 0.3893661, 0.5176471, 1, 0, 1,
-0.562472, 0.7250019, -0.7663037, 0.5137255, 1, 0, 1,
-0.5593856, -0.2020613, -0.9630336, 0.5058824, 1, 0, 1,
-0.5592347, 0.05975933, -0.7752678, 0.5019608, 1, 0, 1,
-0.5551556, -1.694556, -1.981327, 0.4941176, 1, 0, 1,
-0.5515654, 0.513002, 0.3099723, 0.4862745, 1, 0, 1,
-0.5503024, 0.2641751, 0.02695925, 0.4823529, 1, 0, 1,
-0.5463838, 0.3991496, -2.738366, 0.4745098, 1, 0, 1,
-0.5451352, 0.4810461, -0.9114771, 0.4705882, 1, 0, 1,
-0.5451318, 0.08425373, -1.311285, 0.4627451, 1, 0, 1,
-0.5407305, 0.5870139, -0.1988373, 0.4588235, 1, 0, 1,
-0.5405467, -0.1687638, -1.817624, 0.4509804, 1, 0, 1,
-0.5402156, 0.86761, 0.769656, 0.4470588, 1, 0, 1,
-0.5400003, -0.236769, -0.6860421, 0.4392157, 1, 0, 1,
-0.5399069, 1.59962, 0.9332751, 0.4352941, 1, 0, 1,
-0.5359334, 0.9664358, -1.636437, 0.427451, 1, 0, 1,
-0.5338609, 0.4708949, -0.4870731, 0.4235294, 1, 0, 1,
-0.5207255, -0.4868755, -2.444207, 0.4156863, 1, 0, 1,
-0.5202903, -0.2677118, -0.6894235, 0.4117647, 1, 0, 1,
-0.5200776, -2.362708, -2.852002, 0.4039216, 1, 0, 1,
-0.5176787, 1.058768, -0.398743, 0.3960784, 1, 0, 1,
-0.5175388, -0.5577719, -2.847211, 0.3921569, 1, 0, 1,
-0.5160589, -0.6137826, -2.622351, 0.3843137, 1, 0, 1,
-0.5121109, -0.009237875, -1.149138, 0.3803922, 1, 0, 1,
-0.5072169, -0.7006419, -2.554691, 0.372549, 1, 0, 1,
-0.4988919, 0.006774601, -0.9521273, 0.3686275, 1, 0, 1,
-0.4924544, -0.1588445, -1.826705, 0.3607843, 1, 0, 1,
-0.4909901, 0.08168723, -1.483215, 0.3568628, 1, 0, 1,
-0.490422, 0.04928018, -1.503898, 0.3490196, 1, 0, 1,
-0.4892451, 0.1499914, 0.5829608, 0.345098, 1, 0, 1,
-0.488311, 1.29392, -0.6830789, 0.3372549, 1, 0, 1,
-0.4873086, -0.345498, -2.17328, 0.3333333, 1, 0, 1,
-0.4852763, 1.305622, -0.5602173, 0.3254902, 1, 0, 1,
-0.4838177, -1.051999, -2.641095, 0.3215686, 1, 0, 1,
-0.4830852, -0.1838363, -2.280213, 0.3137255, 1, 0, 1,
-0.4821866, -0.8416698, -2.259123, 0.3098039, 1, 0, 1,
-0.4817764, -0.6758541, -3.471769, 0.3019608, 1, 0, 1,
-0.4764956, -0.2779666, -3.340828, 0.2941177, 1, 0, 1,
-0.475581, -0.3019719, -1.983096, 0.2901961, 1, 0, 1,
-0.474783, 0.05155662, -1.403893, 0.282353, 1, 0, 1,
-0.4747403, 0.05424578, -0.8202969, 0.2784314, 1, 0, 1,
-0.4737627, 0.08746529, -0.1256015, 0.2705882, 1, 0, 1,
-0.4722639, -0.4174061, -1.14854, 0.2666667, 1, 0, 1,
-0.4674248, 0.1512618, -2.907932, 0.2588235, 1, 0, 1,
-0.4639536, 0.6342833, -0.4371803, 0.254902, 1, 0, 1,
-0.463949, 0.1888055, -0.01348777, 0.2470588, 1, 0, 1,
-0.4620574, 0.4858875, -0.0829122, 0.2431373, 1, 0, 1,
-0.4613923, -0.6051673, -1.195693, 0.2352941, 1, 0, 1,
-0.4580299, 0.2486518, -0.6746793, 0.2313726, 1, 0, 1,
-0.4514478, -0.3088383, -1.927723, 0.2235294, 1, 0, 1,
-0.4509724, -0.1028664, -0.3947053, 0.2196078, 1, 0, 1,
-0.4500276, -1.22176, -1.410042, 0.2117647, 1, 0, 1,
-0.4498951, -0.1858519, -3.847325, 0.2078431, 1, 0, 1,
-0.4494767, -0.5701185, -2.533066, 0.2, 1, 0, 1,
-0.4463835, -2.696873, -3.447689, 0.1921569, 1, 0, 1,
-0.4450555, 0.7035283, 0.2024964, 0.1882353, 1, 0, 1,
-0.4300691, 0.4616154, -1.193264, 0.1803922, 1, 0, 1,
-0.4263614, -0.9923813, -3.453651, 0.1764706, 1, 0, 1,
-0.4251821, 0.8109128, 0.2811098, 0.1686275, 1, 0, 1,
-0.4246287, -1.173442, -3.137906, 0.1647059, 1, 0, 1,
-0.423529, -0.3239181, -2.252918, 0.1568628, 1, 0, 1,
-0.4231524, 1.370962, -0.2945313, 0.1529412, 1, 0, 1,
-0.4155956, -1.932075, -2.026168, 0.145098, 1, 0, 1,
-0.4136792, 0.4822521, -1.416541, 0.1411765, 1, 0, 1,
-0.4132648, -2.394876, -2.454256, 0.1333333, 1, 0, 1,
-0.4088797, -1.53943, -2.025415, 0.1294118, 1, 0, 1,
-0.408032, 1.934966, 1.973164, 0.1215686, 1, 0, 1,
-0.406253, 0.2966807, -0.1184912, 0.1176471, 1, 0, 1,
-0.4053291, -2.788203, -2.795092, 0.1098039, 1, 0, 1,
-0.402586, -0.3817919, -1.526245, 0.1058824, 1, 0, 1,
-0.4002626, -0.1161073, -3.614421, 0.09803922, 1, 0, 1,
-0.3984288, -0.5405389, -1.430858, 0.09019608, 1, 0, 1,
-0.3874516, 0.1150794, 0.2115982, 0.08627451, 1, 0, 1,
-0.3869527, 0.2485933, 0.4202611, 0.07843138, 1, 0, 1,
-0.3804666, 1.453743, 1.505325, 0.07450981, 1, 0, 1,
-0.3782498, -1.194294, -2.528516, 0.06666667, 1, 0, 1,
-0.3749684, -0.5419953, -3.446943, 0.0627451, 1, 0, 1,
-0.3748457, -0.5371544, -3.302313, 0.05490196, 1, 0, 1,
-0.3730812, -0.3711537, -2.394524, 0.05098039, 1, 0, 1,
-0.360344, -0.8849593, -3.164235, 0.04313726, 1, 0, 1,
-0.3574373, -1.006959, -4.150418, 0.03921569, 1, 0, 1,
-0.3559232, -0.8156877, -1.887347, 0.03137255, 1, 0, 1,
-0.3536028, -2.054459, -2.708859, 0.02745098, 1, 0, 1,
-0.3534192, 1.138447, 0.3596646, 0.01960784, 1, 0, 1,
-0.3501696, 0.5497395, -1.496059, 0.01568628, 1, 0, 1,
-0.3476899, 0.5966036, -1.78689, 0.007843138, 1, 0, 1,
-0.3371465, -0.3265168, -1.460102, 0.003921569, 1, 0, 1,
-0.3335566, -0.5299851, -1.622963, 0, 1, 0.003921569, 1,
-0.3320021, 0.193207, -0.5646794, 0, 1, 0.01176471, 1,
-0.3305386, 1.000277, -0.0156894, 0, 1, 0.01568628, 1,
-0.3296622, -1.472915, -2.226609, 0, 1, 0.02352941, 1,
-0.3294849, 0.3197197, -0.2360127, 0, 1, 0.02745098, 1,
-0.3281753, 1.329515, -0.7383788, 0, 1, 0.03529412, 1,
-0.3102708, -1.060732, -1.410668, 0, 1, 0.03921569, 1,
-0.3087919, -1.34718, -2.765815, 0, 1, 0.04705882, 1,
-0.3021004, -1.439553, -2.831804, 0, 1, 0.05098039, 1,
-0.2944677, 1.738382, 0.216391, 0, 1, 0.05882353, 1,
-0.29386, -0.9894564, -1.620847, 0, 1, 0.0627451, 1,
-0.2931774, -0.1688571, -1.667668, 0, 1, 0.07058824, 1,
-0.2916982, -0.06928709, -1.082374, 0, 1, 0.07450981, 1,
-0.2885575, -0.6419864, -2.448076, 0, 1, 0.08235294, 1,
-0.2879441, -0.0545577, -1.447278, 0, 1, 0.08627451, 1,
-0.2878744, -2.052387, -4.505518, 0, 1, 0.09411765, 1,
-0.2862819, -0.1399972, -2.488714, 0, 1, 0.1019608, 1,
-0.2861032, 2.245725, -2.118284, 0, 1, 0.1058824, 1,
-0.284584, -1.203974, -4.696145, 0, 1, 0.1137255, 1,
-0.2834122, -0.4258783, -4.351257, 0, 1, 0.1176471, 1,
-0.2825804, -0.02530112, -2.218107, 0, 1, 0.1254902, 1,
-0.2801827, -0.3351036, -2.756825, 0, 1, 0.1294118, 1,
-0.2729686, 0.8555236, -1.908159, 0, 1, 0.1372549, 1,
-0.2718947, 1.381316, -0.06429593, 0, 1, 0.1411765, 1,
-0.2709541, 0.888016, 1.430741, 0, 1, 0.1490196, 1,
-0.269816, -1.420166, -0.3918609, 0, 1, 0.1529412, 1,
-0.267727, -0.440277, -3.035915, 0, 1, 0.1607843, 1,
-0.2661493, -0.3768963, -4.763754, 0, 1, 0.1647059, 1,
-0.2617472, -0.9852267, -2.352062, 0, 1, 0.172549, 1,
-0.2608924, 0.6913556, -0.08597215, 0, 1, 0.1764706, 1,
-0.2591589, 1.500124, 0.1491113, 0, 1, 0.1843137, 1,
-0.2590101, -0.05948281, -0.8038021, 0, 1, 0.1882353, 1,
-0.2583297, -0.6932024, -2.26313, 0, 1, 0.1960784, 1,
-0.2557818, 1.046697, 1.396328, 0, 1, 0.2039216, 1,
-0.2531303, 0.7055538, -0.4444627, 0, 1, 0.2078431, 1,
-0.2496949, 0.168033, -1.436425, 0, 1, 0.2156863, 1,
-0.2488495, -0.2317034, -1.659996, 0, 1, 0.2196078, 1,
-0.2465191, 0.2257314, -0.8591486, 0, 1, 0.227451, 1,
-0.2458728, -0.359977, -2.334849, 0, 1, 0.2313726, 1,
-0.2421797, 0.09390958, -1.764621, 0, 1, 0.2392157, 1,
-0.2402609, -2.788973, -4.367126, 0, 1, 0.2431373, 1,
-0.2376913, -0.9014795, -3.187736, 0, 1, 0.2509804, 1,
-0.2373555, -0.09501406, -2.601478, 0, 1, 0.254902, 1,
-0.2314999, 1.498837, -0.4595375, 0, 1, 0.2627451, 1,
-0.221375, -1.033349, -1.928341, 0, 1, 0.2666667, 1,
-0.2160617, -0.5780242, -3.14222, 0, 1, 0.2745098, 1,
-0.2114012, 2.166555, 0.6009515, 0, 1, 0.2784314, 1,
-0.2099275, 1.206475, 0.4464898, 0, 1, 0.2862745, 1,
-0.2095968, -0.5199327, -1.802262, 0, 1, 0.2901961, 1,
-0.2078572, 0.5780726, 0.04369079, 0, 1, 0.2980392, 1,
-0.2028743, 0.8275399, 0.5352386, 0, 1, 0.3058824, 1,
-0.1964348, -0.1264091, -1.171852, 0, 1, 0.3098039, 1,
-0.1964326, 0.5651885, -0.5790642, 0, 1, 0.3176471, 1,
-0.1905567, 0.1235165, 0.9289016, 0, 1, 0.3215686, 1,
-0.1829146, -2.074836, -3.76071, 0, 1, 0.3294118, 1,
-0.1799919, -0.5305541, -2.615767, 0, 1, 0.3333333, 1,
-0.1782292, -0.9521021, -3.702144, 0, 1, 0.3411765, 1,
-0.177009, -0.4342395, -4.325883, 0, 1, 0.345098, 1,
-0.1728755, -0.1360721, -3.272756, 0, 1, 0.3529412, 1,
-0.1671454, 0.2936205, -1.825011, 0, 1, 0.3568628, 1,
-0.1669769, -0.3208361, -2.85591, 0, 1, 0.3647059, 1,
-0.164762, -1.367537, -1.909983, 0, 1, 0.3686275, 1,
-0.1633155, 0.1645191, 0.1020321, 0, 1, 0.3764706, 1,
-0.1609427, 0.7266805, -1.255462, 0, 1, 0.3803922, 1,
-0.1603693, -0.5013109, -3.196865, 0, 1, 0.3882353, 1,
-0.1582723, 1.137514, 0.8304808, 0, 1, 0.3921569, 1,
-0.1557854, -1.706617, -2.672468, 0, 1, 0.4, 1,
-0.151559, 1.05783, 0.7522227, 0, 1, 0.4078431, 1,
-0.1496733, 0.6913931, -0.5497557, 0, 1, 0.4117647, 1,
-0.147522, -0.4835255, -3.108731, 0, 1, 0.4196078, 1,
-0.144284, 0.7098807, -0.753192, 0, 1, 0.4235294, 1,
-0.1429931, 1.387401, 0.4004033, 0, 1, 0.4313726, 1,
-0.1429872, -2.145284, -5.043124, 0, 1, 0.4352941, 1,
-0.1422063, 0.01460018, 0.04012433, 0, 1, 0.4431373, 1,
-0.1360606, -0.8412833, -3.633954, 0, 1, 0.4470588, 1,
-0.134168, -0.4803501, -1.866781, 0, 1, 0.454902, 1,
-0.1258569, -1.559403, -3.227139, 0, 1, 0.4588235, 1,
-0.1254146, 0.1153745, -1.791789, 0, 1, 0.4666667, 1,
-0.1233133, 0.9529058, 0.6178385, 0, 1, 0.4705882, 1,
-0.1225944, 0.8912755, 0.8770821, 0, 1, 0.4784314, 1,
-0.1145802, 0.6948475, -1.538492, 0, 1, 0.4823529, 1,
-0.1141728, -2.519817, -2.870299, 0, 1, 0.4901961, 1,
-0.1130722, -0.2401052, -3.179371, 0, 1, 0.4941176, 1,
-0.1130163, -1.738812, -4.040992, 0, 1, 0.5019608, 1,
-0.1119957, -1.092242, -2.141352, 0, 1, 0.509804, 1,
-0.1117526, -0.2001448, -0.7600127, 0, 1, 0.5137255, 1,
-0.1114711, 0.124085, -1.350001, 0, 1, 0.5215687, 1,
-0.1111134, -0.2490656, -4.72974, 0, 1, 0.5254902, 1,
-0.1064946, 0.131225, -2.097047, 0, 1, 0.5333334, 1,
-0.1061617, 0.3087017, -0.316067, 0, 1, 0.5372549, 1,
-0.1057522, 1.462536, -1.040738, 0, 1, 0.5450981, 1,
-0.104395, -0.9538904, -1.702946, 0, 1, 0.5490196, 1,
-0.1035628, 0.6029419, -0.657959, 0, 1, 0.5568628, 1,
-0.1031096, 0.3893385, -0.9374707, 0, 1, 0.5607843, 1,
-0.1022847, 0.1717011, 0.3622532, 0, 1, 0.5686275, 1,
-0.1013497, 1.434963, 0.2223869, 0, 1, 0.572549, 1,
-0.09967694, -1.085359, -2.991579, 0, 1, 0.5803922, 1,
-0.09917478, -2.199765, -2.403562, 0, 1, 0.5843138, 1,
-0.0982985, 0.2145098, 0.3299661, 0, 1, 0.5921569, 1,
-0.08722346, 0.6691608, -1.266032, 0, 1, 0.5960785, 1,
-0.08610082, 1.474047, -1.221688, 0, 1, 0.6039216, 1,
-0.08529182, 0.03404786, -0.04028961, 0, 1, 0.6117647, 1,
-0.08435873, -0.005166923, -1.735734, 0, 1, 0.6156863, 1,
-0.07949041, -0.2893266, -2.072315, 0, 1, 0.6235294, 1,
-0.07854784, -0.9142283, -3.029414, 0, 1, 0.627451, 1,
-0.07788545, 0.3042572, 1.712066, 0, 1, 0.6352941, 1,
-0.0773465, -0.5046451, -3.467983, 0, 1, 0.6392157, 1,
-0.07605341, -0.404159, -1.569587, 0, 1, 0.6470588, 1,
-0.07441635, -1.051871, -2.845612, 0, 1, 0.6509804, 1,
-0.07225749, 0.6765642, -0.4949711, 0, 1, 0.6588235, 1,
-0.07090952, 0.2771446, 0.01894649, 0, 1, 0.6627451, 1,
-0.06581479, -1.530949, -1.590654, 0, 1, 0.6705883, 1,
-0.06473032, -0.7971317, -2.686954, 0, 1, 0.6745098, 1,
-0.06123176, 0.9328389, 0.7550189, 0, 1, 0.682353, 1,
-0.0583501, 2.17853, -0.8815754, 0, 1, 0.6862745, 1,
-0.05791359, 1.040245, -0.7985045, 0, 1, 0.6941177, 1,
-0.04937225, -0.6208965, -2.037709, 0, 1, 0.7019608, 1,
-0.04914486, 0.5463725, 0.8322667, 0, 1, 0.7058824, 1,
-0.04784736, 0.086459, -0.798359, 0, 1, 0.7137255, 1,
-0.04589065, 2.758573, 0.2496245, 0, 1, 0.7176471, 1,
-0.04011497, 0.4196441, 0.0880699, 0, 1, 0.7254902, 1,
-0.03518002, -0.2231189, -2.108099, 0, 1, 0.7294118, 1,
-0.03189175, -0.5200766, -4.968292, 0, 1, 0.7372549, 1,
-0.03132312, 2.057633, -0.0714343, 0, 1, 0.7411765, 1,
-0.03025329, -1.389116, -3.451954, 0, 1, 0.7490196, 1,
-0.02929648, -1.750814, -3.754751, 0, 1, 0.7529412, 1,
-0.02104432, -0.1553967, -3.456279, 0, 1, 0.7607843, 1,
-0.02092534, 0.9646265, -0.9363742, 0, 1, 0.7647059, 1,
-0.01695649, -0.6444462, -2.065727, 0, 1, 0.772549, 1,
-0.01217487, -0.6243498, -4.08283, 0, 1, 0.7764706, 1,
-0.01179676, -0.8064792, -2.077512, 0, 1, 0.7843137, 1,
-0.01064245, -0.4144571, -3.283442, 0, 1, 0.7882353, 1,
-0.009702367, 0.06484123, -0.6265841, 0, 1, 0.7960784, 1,
-0.007140735, -1.622748, -3.300734, 0, 1, 0.8039216, 1,
-0.006912089, 0.84389, -0.9215969, 0, 1, 0.8078431, 1,
-0.0006895729, -0.4525173, -2.618433, 0, 1, 0.8156863, 1,
-0.0004149106, 1.845444, -0.5926906, 0, 1, 0.8196079, 1,
0.0006860812, -0.2832475, 3.081237, 0, 1, 0.827451, 1,
0.005559897, -0.1976231, 3.469868, 0, 1, 0.8313726, 1,
0.005765194, 1.528389, -2.033629, 0, 1, 0.8392157, 1,
0.006525895, -1.791329, 3.860671, 0, 1, 0.8431373, 1,
0.009376195, 1.030604, 0.1569212, 0, 1, 0.8509804, 1,
0.01047791, -0.0005480463, 2.697403, 0, 1, 0.854902, 1,
0.01861742, 0.139891, -2.060564, 0, 1, 0.8627451, 1,
0.01911983, -0.767949, 1.465625, 0, 1, 0.8666667, 1,
0.02115343, -1.171132, 4.070837, 0, 1, 0.8745098, 1,
0.02206378, -0.05387791, 4.300408, 0, 1, 0.8784314, 1,
0.02426816, -1.256943, 2.908907, 0, 1, 0.8862745, 1,
0.0255082, 0.5754097, 0.4692854, 0, 1, 0.8901961, 1,
0.02612332, 2.79083, 0.7061608, 0, 1, 0.8980392, 1,
0.0269062, -1.171733, 3.704, 0, 1, 0.9058824, 1,
0.0271189, -1.130746, 2.437649, 0, 1, 0.9098039, 1,
0.02849448, -0.3798301, 3.677599, 0, 1, 0.9176471, 1,
0.02914027, -0.1848046, 4.868461, 0, 1, 0.9215686, 1,
0.03068252, 0.343224, 1.903656, 0, 1, 0.9294118, 1,
0.03120388, 0.4844045, -0.448015, 0, 1, 0.9333333, 1,
0.03537249, 0.6865961, 0.8862183, 0, 1, 0.9411765, 1,
0.03612746, 0.5035639, 2.18295, 0, 1, 0.945098, 1,
0.05914407, -0.5272564, 2.45301, 0, 1, 0.9529412, 1,
0.06273292, -0.7479457, 3.583381, 0, 1, 0.9568627, 1,
0.0642253, -0.2581676, 1.285296, 0, 1, 0.9647059, 1,
0.06424018, -0.2424549, 3.031052, 0, 1, 0.9686275, 1,
0.06513959, 0.4202067, 0.1780565, 0, 1, 0.9764706, 1,
0.06555555, 0.5283493, -0.3785777, 0, 1, 0.9803922, 1,
0.0673518, -0.1713683, 1.74005, 0, 1, 0.9882353, 1,
0.07236747, -0.06052621, 3.844168, 0, 1, 0.9921569, 1,
0.07261307, 0.02136037, 2.312321, 0, 1, 1, 1,
0.07558182, -0.3516063, 1.3144, 0, 0.9921569, 1, 1,
0.07921778, -1.317124, 3.029129, 0, 0.9882353, 1, 1,
0.08078724, 0.9940704, 1.229105, 0, 0.9803922, 1, 1,
0.08121794, 0.1659655, 0.06657559, 0, 0.9764706, 1, 1,
0.08509709, 0.3727242, 0.6370738, 0, 0.9686275, 1, 1,
0.0895303, 0.7782137, -0.449549, 0, 0.9647059, 1, 1,
0.09364998, -0.7925844, 3.92638, 0, 0.9568627, 1, 1,
0.09521384, 0.7951121, -0.2372649, 0, 0.9529412, 1, 1,
0.1032008, -0.3012333, 1.194908, 0, 0.945098, 1, 1,
0.1069948, -0.5808282, 2.673521, 0, 0.9411765, 1, 1,
0.1072916, -0.2509092, 1.979594, 0, 0.9333333, 1, 1,
0.1082009, 1.703602, 1.017421, 0, 0.9294118, 1, 1,
0.1116508, 1.41702, 0.03413465, 0, 0.9215686, 1, 1,
0.1117827, -1.68617, 2.080314, 0, 0.9176471, 1, 1,
0.1137179, -0.616439, 3.089591, 0, 0.9098039, 1, 1,
0.1156226, 2.18784, -0.2187171, 0, 0.9058824, 1, 1,
0.1193379, 0.9357635, -0.3339286, 0, 0.8980392, 1, 1,
0.1199557, 1.604127, -0.7588567, 0, 0.8901961, 1, 1,
0.1213312, 0.3913338, 0.3300563, 0, 0.8862745, 1, 1,
0.1229114, -1.150986, 1.384967, 0, 0.8784314, 1, 1,
0.1242856, -1.71741, 3.427358, 0, 0.8745098, 1, 1,
0.1263698, -1.961401, 2.636141, 0, 0.8666667, 1, 1,
0.1295207, -0.05450765, 3.807899, 0, 0.8627451, 1, 1,
0.1296999, 1.426166, 2.348283, 0, 0.854902, 1, 1,
0.131362, 1.587473, -0.8899775, 0, 0.8509804, 1, 1,
0.1323038, -0.6187135, 2.053291, 0, 0.8431373, 1, 1,
0.132593, -0.963346, 4.562563, 0, 0.8392157, 1, 1,
0.1332209, -1.042014, 3.395517, 0, 0.8313726, 1, 1,
0.1385593, -0.3230405, 2.602863, 0, 0.827451, 1, 1,
0.1417705, -0.9020568, 1.733169, 0, 0.8196079, 1, 1,
0.1423986, -0.4788331, 2.376189, 0, 0.8156863, 1, 1,
0.1432963, -0.6674562, 2.153534, 0, 0.8078431, 1, 1,
0.143665, 0.5169342, -0.1211459, 0, 0.8039216, 1, 1,
0.147461, -0.7105218, 3.415293, 0, 0.7960784, 1, 1,
0.1499534, 0.5079774, 0.3794011, 0, 0.7882353, 1, 1,
0.150162, -1.240503, 4.390505, 0, 0.7843137, 1, 1,
0.1507728, -1.16128, 2.98807, 0, 0.7764706, 1, 1,
0.1515307, 0.6034722, -0.1817106, 0, 0.772549, 1, 1,
0.1541892, 0.8526087, -0.6563134, 0, 0.7647059, 1, 1,
0.1544045, -0.429619, 3.754262, 0, 0.7607843, 1, 1,
0.1566201, -0.1095062, 2.232541, 0, 0.7529412, 1, 1,
0.1574916, -0.2039987, 2.557993, 0, 0.7490196, 1, 1,
0.1576832, 0.1857167, 0.1095226, 0, 0.7411765, 1, 1,
0.1639994, -1.464454, 1.760809, 0, 0.7372549, 1, 1,
0.16547, -0.1003344, 3.15444, 0, 0.7294118, 1, 1,
0.1666021, -0.2986586, 0.5335459, 0, 0.7254902, 1, 1,
0.1681452, -0.2122305, 1.92279, 0, 0.7176471, 1, 1,
0.1688696, 1.304737, 0.7617559, 0, 0.7137255, 1, 1,
0.1709895, -0.278632, 3.128258, 0, 0.7058824, 1, 1,
0.1735725, 1.330119, 0.363938, 0, 0.6980392, 1, 1,
0.1758912, 0.5577934, 1.405038, 0, 0.6941177, 1, 1,
0.1784784, 0.6524317, -0.2078736, 0, 0.6862745, 1, 1,
0.1787515, -0.1594053, 2.8838, 0, 0.682353, 1, 1,
0.1809434, 0.2583868, 0.08907507, 0, 0.6745098, 1, 1,
0.1851305, -0.7577055, 2.716864, 0, 0.6705883, 1, 1,
0.1856715, 1.392018, 0.9418061, 0, 0.6627451, 1, 1,
0.1873012, -1.091609, 3.340234, 0, 0.6588235, 1, 1,
0.189451, 0.3835878, 0.2082446, 0, 0.6509804, 1, 1,
0.1896646, 1.904083, 1.959082, 0, 0.6470588, 1, 1,
0.1924399, 0.8860567, -0.144394, 0, 0.6392157, 1, 1,
0.1967423, -2.331136, 2.539109, 0, 0.6352941, 1, 1,
0.1971854, 0.2694457, 0.7383147, 0, 0.627451, 1, 1,
0.198283, -0.7795315, 1.405535, 0, 0.6235294, 1, 1,
0.2042466, -1.763754, 1.613784, 0, 0.6156863, 1, 1,
0.2047234, 0.1004741, 0.16039, 0, 0.6117647, 1, 1,
0.2062881, 1.271174, 0.5020627, 0, 0.6039216, 1, 1,
0.2075541, -2.442611, 3.441125, 0, 0.5960785, 1, 1,
0.2103405, -0.0880122, 1.772004, 0, 0.5921569, 1, 1,
0.2114014, -1.374906, 1.304019, 0, 0.5843138, 1, 1,
0.2126166, 0.7482862, 1.185141, 0, 0.5803922, 1, 1,
0.2154028, -1.124797, 4.189925, 0, 0.572549, 1, 1,
0.2166936, -0.511578, 2.858641, 0, 0.5686275, 1, 1,
0.2205436, -3.082683, 2.598574, 0, 0.5607843, 1, 1,
0.2213046, -0.8690709, 2.942197, 0, 0.5568628, 1, 1,
0.2228804, -1.176386, 5.313391, 0, 0.5490196, 1, 1,
0.2284723, 1.665719, -1.026938, 0, 0.5450981, 1, 1,
0.2299061, -0.3560046, 2.755554, 0, 0.5372549, 1, 1,
0.2336427, 0.4409431, 0.9576697, 0, 0.5333334, 1, 1,
0.233859, 1.141489, -0.7147639, 0, 0.5254902, 1, 1,
0.2352307, -0.8129705, 4.379092, 0, 0.5215687, 1, 1,
0.2367744, 2.368745, -1.740796, 0, 0.5137255, 1, 1,
0.237417, 1.535938, -0.1862834, 0, 0.509804, 1, 1,
0.2466026, -0.462939, 2.203774, 0, 0.5019608, 1, 1,
0.2475259, -0.3926747, 1.752338, 0, 0.4941176, 1, 1,
0.248561, -1.756986, 4.487561, 0, 0.4901961, 1, 1,
0.2515306, -0.7146556, 1.597354, 0, 0.4823529, 1, 1,
0.2518265, -0.7773343, 3.670882, 0, 0.4784314, 1, 1,
0.2519652, 0.3428932, 0.1272016, 0, 0.4705882, 1, 1,
0.2586544, -0.02501006, 2.21701, 0, 0.4666667, 1, 1,
0.259078, 0.8061901, 1.528195, 0, 0.4588235, 1, 1,
0.2627162, -0.4897879, 2.022667, 0, 0.454902, 1, 1,
0.2627497, -1.255017, 1.988288, 0, 0.4470588, 1, 1,
0.2669564, -1.159386, 1.93167, 0, 0.4431373, 1, 1,
0.2694928, 0.8573559, -1.097452, 0, 0.4352941, 1, 1,
0.2720864, -0.4048618, 3.513251, 0, 0.4313726, 1, 1,
0.2736319, 0.4318547, 2.55676, 0, 0.4235294, 1, 1,
0.2749276, -2.212933, 2.606673, 0, 0.4196078, 1, 1,
0.2773433, -1.097298, 2.226002, 0, 0.4117647, 1, 1,
0.2784182, -0.4685642, 3.318272, 0, 0.4078431, 1, 1,
0.2826966, 1.126038, -0.2881894, 0, 0.4, 1, 1,
0.2913862, 1.198734, -0.0627224, 0, 0.3921569, 1, 1,
0.2941386, -0.330065, 2.030183, 0, 0.3882353, 1, 1,
0.2943034, -0.3285783, 3.021697, 0, 0.3803922, 1, 1,
0.2961301, 0.9479693, -1.476262, 0, 0.3764706, 1, 1,
0.2969506, 1.975621, 1.315058, 0, 0.3686275, 1, 1,
0.2993951, -0.1151034, 2.057128, 0, 0.3647059, 1, 1,
0.3059227, 1.949586, 0.1368886, 0, 0.3568628, 1, 1,
0.3100943, -0.9195606, 0.7490295, 0, 0.3529412, 1, 1,
0.3168668, 1.170584, -0.1875424, 0, 0.345098, 1, 1,
0.3255977, 1.448698, 0.8703779, 0, 0.3411765, 1, 1,
0.3268185, -0.6191703, 3.22434, 0, 0.3333333, 1, 1,
0.3345933, 1.077158, 1.238594, 0, 0.3294118, 1, 1,
0.3356462, -1.14118, 3.785274, 0, 0.3215686, 1, 1,
0.3366839, -0.5874066, 1.887676, 0, 0.3176471, 1, 1,
0.3403804, -0.1970943, 1.703375, 0, 0.3098039, 1, 1,
0.3404045, -1.573454, 3.873593, 0, 0.3058824, 1, 1,
0.3419464, -1.261595, 3.285712, 0, 0.2980392, 1, 1,
0.3474732, 1.342445, 0.7442431, 0, 0.2901961, 1, 1,
0.3486815, 0.39808, 0.5068725, 0, 0.2862745, 1, 1,
0.3529709, -2.322183, 1.854356, 0, 0.2784314, 1, 1,
0.3558497, -1.404364, 1.564116, 0, 0.2745098, 1, 1,
0.3586528, 0.2153744, 0.1854782, 0, 0.2666667, 1, 1,
0.3595676, -0.04804684, 1.436659, 0, 0.2627451, 1, 1,
0.3597985, -0.4802395, 2.693068, 0, 0.254902, 1, 1,
0.3622776, -0.4210593, 3.273885, 0, 0.2509804, 1, 1,
0.3623172, -1.002255, 1.814621, 0, 0.2431373, 1, 1,
0.3650102, -0.1298319, 2.53463, 0, 0.2392157, 1, 1,
0.3657699, -0.364794, 2.463949, 0, 0.2313726, 1, 1,
0.3667438, 0.03342903, 0.9586983, 0, 0.227451, 1, 1,
0.3714009, -0.2904143, 2.275646, 0, 0.2196078, 1, 1,
0.3720276, -0.1499721, 1.276496, 0, 0.2156863, 1, 1,
0.3729842, -0.02987703, 2.205, 0, 0.2078431, 1, 1,
0.3748811, 0.116149, 0.9899192, 0, 0.2039216, 1, 1,
0.378443, -0.1285743, 0.4160592, 0, 0.1960784, 1, 1,
0.3826373, -0.4212733, 2.866493, 0, 0.1882353, 1, 1,
0.3832031, -0.2225146, 2.529643, 0, 0.1843137, 1, 1,
0.384836, 0.1772034, -0.2424988, 0, 0.1764706, 1, 1,
0.3903206, -0.3121325, 3.80095, 0, 0.172549, 1, 1,
0.3984574, -1.699318, 3.408098, 0, 0.1647059, 1, 1,
0.4017991, 1.679373, -0.01839458, 0, 0.1607843, 1, 1,
0.4022161, -0.235545, 2.492195, 0, 0.1529412, 1, 1,
0.4055573, 0.2091937, 0.7041432, 0, 0.1490196, 1, 1,
0.4073532, 1.544372, 2.557745, 0, 0.1411765, 1, 1,
0.4076695, -0.1687826, 1.598576, 0, 0.1372549, 1, 1,
0.4086879, 1.161335, 1.436402, 0, 0.1294118, 1, 1,
0.4102219, 0.1333415, 0.920746, 0, 0.1254902, 1, 1,
0.4127425, -0.5556972, 2.907425, 0, 0.1176471, 1, 1,
0.4128526, -1.033113, 3.222004, 0, 0.1137255, 1, 1,
0.4134884, -0.7872183, 1.983508, 0, 0.1058824, 1, 1,
0.4153659, -0.5635335, 1.976254, 0, 0.09803922, 1, 1,
0.4167119, 0.6125262, 0.1670335, 0, 0.09411765, 1, 1,
0.4171704, 0.3802857, -0.5391795, 0, 0.08627451, 1, 1,
0.4172944, 0.111138, 1.631159, 0, 0.08235294, 1, 1,
0.4246218, -0.4156763, 2.560782, 0, 0.07450981, 1, 1,
0.4273934, 0.5604622, 2.460602, 0, 0.07058824, 1, 1,
0.4277354, -0.4276066, 3.207242, 0, 0.0627451, 1, 1,
0.4288799, -0.3569244, 1.402493, 0, 0.05882353, 1, 1,
0.4309397, 0.5068001, 1.253145, 0, 0.05098039, 1, 1,
0.4317425, -0.4530024, 2.46872, 0, 0.04705882, 1, 1,
0.4323644, 0.3378055, 0.1959492, 0, 0.03921569, 1, 1,
0.4323746, -0.4864421, 1.688833, 0, 0.03529412, 1, 1,
0.4382366, 0.3981875, 1.214916, 0, 0.02745098, 1, 1,
0.4452896, 0.07817774, 2.585063, 0, 0.02352941, 1, 1,
0.4472887, 1.445837, 0.5421245, 0, 0.01568628, 1, 1,
0.4576975, 1.128215, 1.53805, 0, 0.01176471, 1, 1,
0.4612577, -2.673699, 4.672555, 0, 0.003921569, 1, 1,
0.4635724, 0.04124428, -0.3236265, 0.003921569, 0, 1, 1,
0.4636495, 0.9630537, 0.327261, 0.007843138, 0, 1, 1,
0.4680107, -0.5706238, 4.373447, 0.01568628, 0, 1, 1,
0.4708738, 0.2716117, 1.767608, 0.01960784, 0, 1, 1,
0.4734356, 0.009515941, 2.36299, 0.02745098, 0, 1, 1,
0.4746555, -0.4136045, 3.995805, 0.03137255, 0, 1, 1,
0.4746705, 1.824874, -0.09815186, 0.03921569, 0, 1, 1,
0.4823457, -0.47084, 1.930117, 0.04313726, 0, 1, 1,
0.4825499, 0.7999184, 0.9140069, 0.05098039, 0, 1, 1,
0.4836431, -1.340363, 3.037087, 0.05490196, 0, 1, 1,
0.4846413, -1.415311, 2.775845, 0.0627451, 0, 1, 1,
0.486946, -0.2672618, 1.997092, 0.06666667, 0, 1, 1,
0.4909258, -0.3537762, 2.811777, 0.07450981, 0, 1, 1,
0.494765, 1.429472, -0.1858745, 0.07843138, 0, 1, 1,
0.4959107, -0.1410385, 2.122569, 0.08627451, 0, 1, 1,
0.4975905, 0.7226816, 0.2530167, 0.09019608, 0, 1, 1,
0.4993869, -0.4548269, 3.388607, 0.09803922, 0, 1, 1,
0.4995749, -1.565327, 2.482402, 0.1058824, 0, 1, 1,
0.5002686, 1.374785, 0.4779537, 0.1098039, 0, 1, 1,
0.5003363, 1.206831, -0.1593, 0.1176471, 0, 1, 1,
0.500571, 0.6005111, 0.5611566, 0.1215686, 0, 1, 1,
0.502489, -1.135478, 4.162424, 0.1294118, 0, 1, 1,
0.5035542, 0.3973663, -1.028457, 0.1333333, 0, 1, 1,
0.5066925, -0.3955297, 1.947383, 0.1411765, 0, 1, 1,
0.5071369, -0.5067583, 3.552784, 0.145098, 0, 1, 1,
0.5107821, -0.7148963, 3.274451, 0.1529412, 0, 1, 1,
0.5118551, 2.891456, -1.477319, 0.1568628, 0, 1, 1,
0.5124108, 0.8889294, -0.07676082, 0.1647059, 0, 1, 1,
0.5132031, -0.08166365, 2.670568, 0.1686275, 0, 1, 1,
0.513646, -0.4545128, 2.679982, 0.1764706, 0, 1, 1,
0.5161524, -1.83974, 3.487108, 0.1803922, 0, 1, 1,
0.5210543, -0.3629594, 3.657336, 0.1882353, 0, 1, 1,
0.5229367, -1.366575, 1.336929, 0.1921569, 0, 1, 1,
0.5232661, 0.4626206, 1.094771, 0.2, 0, 1, 1,
0.5245323, 1.261268, 1.132223, 0.2078431, 0, 1, 1,
0.5286241, 0.1074256, 1.431917, 0.2117647, 0, 1, 1,
0.5332687, 0.7537528, 1.439019, 0.2196078, 0, 1, 1,
0.5349613, 0.2067773, 1.043042, 0.2235294, 0, 1, 1,
0.5358976, 1.243665, 0.26712, 0.2313726, 0, 1, 1,
0.5362329, -1.189787, 1.919758, 0.2352941, 0, 1, 1,
0.5464673, -1.80066, 4.827559, 0.2431373, 0, 1, 1,
0.5477948, -0.5089559, 2.805071, 0.2470588, 0, 1, 1,
0.5504468, -0.5347129, 1.869634, 0.254902, 0, 1, 1,
0.5510737, -1.928653, 4.271528, 0.2588235, 0, 1, 1,
0.5560856, -0.787831, 3.473344, 0.2666667, 0, 1, 1,
0.5578009, -0.8450015, 2.871031, 0.2705882, 0, 1, 1,
0.5632848, -0.2116743, 1.582634, 0.2784314, 0, 1, 1,
0.5634652, -1.049749, 3.321078, 0.282353, 0, 1, 1,
0.5794176, 0.04715089, 1.348522, 0.2901961, 0, 1, 1,
0.5838596, -0.559326, 2.278642, 0.2941177, 0, 1, 1,
0.5864534, 0.8370857, 0.0002403032, 0.3019608, 0, 1, 1,
0.5873874, 1.173047, 0.1087469, 0.3098039, 0, 1, 1,
0.5883, 0.07791501, 0.3466254, 0.3137255, 0, 1, 1,
0.6012169, 0.07035723, 1.68462, 0.3215686, 0, 1, 1,
0.6019241, 0.5758701, 1.516743, 0.3254902, 0, 1, 1,
0.6036637, -1.884966, 3.234434, 0.3333333, 0, 1, 1,
0.606866, 0.3510047, -0.06938058, 0.3372549, 0, 1, 1,
0.6131011, -0.2893248, 1.103131, 0.345098, 0, 1, 1,
0.6148089, -0.287414, 1.510244, 0.3490196, 0, 1, 1,
0.6160961, -0.5605541, 1.495407, 0.3568628, 0, 1, 1,
0.6181187, 1.070324, 0.7145549, 0.3607843, 0, 1, 1,
0.6188086, 0.7918755, 0.1684799, 0.3686275, 0, 1, 1,
0.6288617, 1.392815, 0.01048836, 0.372549, 0, 1, 1,
0.6312374, 3.691614, -0.1428327, 0.3803922, 0, 1, 1,
0.6345468, -0.7067754, 1.662698, 0.3843137, 0, 1, 1,
0.6358568, -0.1481131, 1.721418, 0.3921569, 0, 1, 1,
0.6360389, -0.8226411, 2.426229, 0.3960784, 0, 1, 1,
0.6380718, -2.736904, 2.777815, 0.4039216, 0, 1, 1,
0.6413583, 1.774597, -0.5368138, 0.4117647, 0, 1, 1,
0.6413759, -1.146113, 4.049588, 0.4156863, 0, 1, 1,
0.6581604, -0.7646508, 3.476087, 0.4235294, 0, 1, 1,
0.6637639, -0.6536738, 1.956383, 0.427451, 0, 1, 1,
0.6638319, 0.2079632, 3.196148, 0.4352941, 0, 1, 1,
0.6640571, -1.196302, 3.152534, 0.4392157, 0, 1, 1,
0.6666562, -0.7248646, 4.021449, 0.4470588, 0, 1, 1,
0.6722728, -0.2397449, 1.804259, 0.4509804, 0, 1, 1,
0.6834882, -1.912125, 3.429431, 0.4588235, 0, 1, 1,
0.6861949, 1.676734, -0.266872, 0.4627451, 0, 1, 1,
0.6862307, 0.1717337, 1.141236, 0.4705882, 0, 1, 1,
0.6881472, 0.003110962, 0.4893401, 0.4745098, 0, 1, 1,
0.6928003, -0.0009374085, 1.612022, 0.4823529, 0, 1, 1,
0.6948331, 1.494653, 0.5678465, 0.4862745, 0, 1, 1,
0.6980391, -0.08394948, 3.171671, 0.4941176, 0, 1, 1,
0.6987166, 1.301689, 0.7412481, 0.5019608, 0, 1, 1,
0.6989614, 0.02480321, 2.791625, 0.5058824, 0, 1, 1,
0.6997632, 0.6829304, 1.122228, 0.5137255, 0, 1, 1,
0.7000051, -0.7110054, 1.866814, 0.5176471, 0, 1, 1,
0.7015228, 0.8392704, 1.57135, 0.5254902, 0, 1, 1,
0.7060793, 0.8328053, 0.9897826, 0.5294118, 0, 1, 1,
0.7071208, 0.5281837, 1.166589, 0.5372549, 0, 1, 1,
0.7145764, 0.6095091, 0.5752012, 0.5411765, 0, 1, 1,
0.7185397, 0.9359261, 1.250184, 0.5490196, 0, 1, 1,
0.7212797, 0.2265859, 3.153242, 0.5529412, 0, 1, 1,
0.7250241, -0.4506011, 2.76893, 0.5607843, 0, 1, 1,
0.7304124, -0.6217324, 2.414085, 0.5647059, 0, 1, 1,
0.7315837, -0.19676, 2.21613, 0.572549, 0, 1, 1,
0.738476, -0.4346263, 1.902714, 0.5764706, 0, 1, 1,
0.7386097, -0.3344798, 1.951847, 0.5843138, 0, 1, 1,
0.7445714, -0.8649688, 0.8146561, 0.5882353, 0, 1, 1,
0.7499332, -0.08009722, 1.702067, 0.5960785, 0, 1, 1,
0.7499391, 0.03919513, 2.081221, 0.6039216, 0, 1, 1,
0.7575323, 0.5185099, 1.108259, 0.6078432, 0, 1, 1,
0.7579569, -1.738875, 3.11716, 0.6156863, 0, 1, 1,
0.7590439, -0.009796373, 2.393486, 0.6196079, 0, 1, 1,
0.7598936, 0.3416868, 0.33012, 0.627451, 0, 1, 1,
0.7648649, -1.132003, 2.556249, 0.6313726, 0, 1, 1,
0.7682849, -1.065905, 2.826025, 0.6392157, 0, 1, 1,
0.7688636, 0.01970168, 2.031197, 0.6431373, 0, 1, 1,
0.7726279, 1.498749, 1.573396, 0.6509804, 0, 1, 1,
0.7768869, -0.8743174, 2.45654, 0.654902, 0, 1, 1,
0.7783365, -0.7500635, 0.6537995, 0.6627451, 0, 1, 1,
0.7831751, 1.151828, 2.404831, 0.6666667, 0, 1, 1,
0.7835184, 1.265139, 0.5463635, 0.6745098, 0, 1, 1,
0.783558, 1.230439, 0.8209197, 0.6784314, 0, 1, 1,
0.7865161, 0.05827141, 0.4244798, 0.6862745, 0, 1, 1,
0.7892846, -1.051871, 4.232344, 0.6901961, 0, 1, 1,
0.7907465, -0.03408436, 0.6573987, 0.6980392, 0, 1, 1,
0.7934983, 0.3092903, 0.2389509, 0.7058824, 0, 1, 1,
0.7955032, -2.192232, 2.209497, 0.7098039, 0, 1, 1,
0.7986877, 0.6279553, -0.2585124, 0.7176471, 0, 1, 1,
0.8046765, -0.9383118, 1.822789, 0.7215686, 0, 1, 1,
0.806434, -0.6319685, 2.31732, 0.7294118, 0, 1, 1,
0.8088263, 0.250049, 2.103639, 0.7333333, 0, 1, 1,
0.812463, -0.002433314, 1.466692, 0.7411765, 0, 1, 1,
0.8159521, -0.0718932, 2.366001, 0.7450981, 0, 1, 1,
0.8166869, -0.9276204, 1.551542, 0.7529412, 0, 1, 1,
0.8271921, -0.1396549, 1.428352, 0.7568628, 0, 1, 1,
0.8303378, 0.04171958, 2.13504, 0.7647059, 0, 1, 1,
0.8342095, -0.09043478, 1.884567, 0.7686275, 0, 1, 1,
0.8367071, -1.297074, 1.423742, 0.7764706, 0, 1, 1,
0.8374808, -1.21971, 3.205025, 0.7803922, 0, 1, 1,
0.8385183, -1.268709, 3.211504, 0.7882353, 0, 1, 1,
0.838818, -0.5271098, 0.7857705, 0.7921569, 0, 1, 1,
0.8424322, 0.2930993, 1.810287, 0.8, 0, 1, 1,
0.8489094, -0.1225542, 2.710826, 0.8078431, 0, 1, 1,
0.8557821, 0.5801569, 1.004906, 0.8117647, 0, 1, 1,
0.8620259, 0.6615483, 1.206091, 0.8196079, 0, 1, 1,
0.8632612, -0.1148222, 3.034224, 0.8235294, 0, 1, 1,
0.863681, 1.022914, 0.000943939, 0.8313726, 0, 1, 1,
0.8709195, -0.6527604, 1.382688, 0.8352941, 0, 1, 1,
0.8739911, 0.687227, -1.121206, 0.8431373, 0, 1, 1,
0.8750613, 0.3650945, -0.378751, 0.8470588, 0, 1, 1,
0.877821, 1.04715, 2.229078, 0.854902, 0, 1, 1,
0.877932, -0.8875162, 2.862675, 0.8588235, 0, 1, 1,
0.8859207, -0.713613, 1.947583, 0.8666667, 0, 1, 1,
0.8864026, -0.06325849, 0.5664932, 0.8705882, 0, 1, 1,
0.8864431, 0.2200608, -0.7405787, 0.8784314, 0, 1, 1,
0.8890657, -0.2919164, 1.93997, 0.8823529, 0, 1, 1,
0.8908914, -1.226495, 2.150944, 0.8901961, 0, 1, 1,
0.895379, 2.114778, 0.4688438, 0.8941177, 0, 1, 1,
0.896253, -0.684242, 0.605572, 0.9019608, 0, 1, 1,
0.8984841, 1.613759, 1.366237, 0.9098039, 0, 1, 1,
0.9034166, 0.4373359, 0.6082894, 0.9137255, 0, 1, 1,
0.9074217, -0.7059898, 1.977915, 0.9215686, 0, 1, 1,
0.9092245, -1.960548, 1.648049, 0.9254902, 0, 1, 1,
0.9191012, 0.4169165, 2.077364, 0.9333333, 0, 1, 1,
0.9231419, 1.222711, 1.628643, 0.9372549, 0, 1, 1,
0.9234604, -0.2860517, 3.608356, 0.945098, 0, 1, 1,
0.9287001, -0.7427595, 1.398217, 0.9490196, 0, 1, 1,
0.9319388, 0.2546483, 1.834777, 0.9568627, 0, 1, 1,
0.9332257, 0.2483375, 0.7134888, 0.9607843, 0, 1, 1,
0.9482294, -1.575006, 1.342656, 0.9686275, 0, 1, 1,
0.9560556, -0.5041724, 1.296516, 0.972549, 0, 1, 1,
0.9567979, 0.7890039, 1.109691, 0.9803922, 0, 1, 1,
0.9744284, 0.8518276, 0.3086182, 0.9843137, 0, 1, 1,
0.9757934, -0.040989, -1.196997, 0.9921569, 0, 1, 1,
0.9777128, 2.225569, -0.209335, 0.9960784, 0, 1, 1,
0.9809275, 1.29689, 2.792439, 1, 0, 0.9960784, 1,
0.985384, 0.3978222, 2.632577, 1, 0, 0.9882353, 1,
0.9868048, -0.3547596, 2.078884, 1, 0, 0.9843137, 1,
0.9885314, -0.1032775, 1.297197, 1, 0, 0.9764706, 1,
0.992332, 0.3619895, 0.2952408, 1, 0, 0.972549, 1,
0.993421, -1.050065, 0.8350055, 1, 0, 0.9647059, 1,
0.9976162, 1.220855, -0.07159518, 1, 0, 0.9607843, 1,
1.000515, 0.6197776, 1.973816, 1, 0, 0.9529412, 1,
1.000623, -0.8526616, 1.389785, 1, 0, 0.9490196, 1,
1.01308, -0.09259251, 2.297819, 1, 0, 0.9411765, 1,
1.019072, 0.09576989, 2.755979, 1, 0, 0.9372549, 1,
1.022666, 0.8538827, 0.5328321, 1, 0, 0.9294118, 1,
1.024802, -0.2472353, 0.5336875, 1, 0, 0.9254902, 1,
1.025916, -0.4089443, -0.03005408, 1, 0, 0.9176471, 1,
1.026646, 1.175512, 0.7932561, 1, 0, 0.9137255, 1,
1.029701, 0.5070732, 0.8220029, 1, 0, 0.9058824, 1,
1.030711, -0.05834492, 3.325985, 1, 0, 0.9019608, 1,
1.039863, 1.485563, -1.470357, 1, 0, 0.8941177, 1,
1.046623, 1.158587, 0.2936217, 1, 0, 0.8862745, 1,
1.051944, -0.2661189, 0.247735, 1, 0, 0.8823529, 1,
1.05329, 1.189442, 1.979478, 1, 0, 0.8745098, 1,
1.067072, 0.6574697, 0.1590997, 1, 0, 0.8705882, 1,
1.068335, 0.6303766, 0.7585504, 1, 0, 0.8627451, 1,
1.076575, -1.607263, 1.465034, 1, 0, 0.8588235, 1,
1.076917, -1.965427, 2.210967, 1, 0, 0.8509804, 1,
1.07854, -0.3045379, 1.457385, 1, 0, 0.8470588, 1,
1.083847, 0.8825486, -0.3491154, 1, 0, 0.8392157, 1,
1.085714, 1.048326, 1.827677, 1, 0, 0.8352941, 1,
1.092698, 0.05888692, 1.750066, 1, 0, 0.827451, 1,
1.104566, 0.09075527, 0.5991542, 1, 0, 0.8235294, 1,
1.104587, 0.852779, 1.942765, 1, 0, 0.8156863, 1,
1.104804, -1.189085, 1.029626, 1, 0, 0.8117647, 1,
1.107407, -0.5263048, 2.679381, 1, 0, 0.8039216, 1,
1.109488, 0.877936, 1.024693, 1, 0, 0.7960784, 1,
1.109521, -0.4856988, 2.023648, 1, 0, 0.7921569, 1,
1.114319, 1.022413, 1.62847, 1, 0, 0.7843137, 1,
1.121822, 2.026134, -0.2353049, 1, 0, 0.7803922, 1,
1.122619, -1.514149, 2.880025, 1, 0, 0.772549, 1,
1.124496, -0.8629546, 0.4538188, 1, 0, 0.7686275, 1,
1.135638, -0.8743067, 2.219494, 1, 0, 0.7607843, 1,
1.137529, -0.8415847, 1.960548, 1, 0, 0.7568628, 1,
1.138097, 0.4554436, 1.370462, 1, 0, 0.7490196, 1,
1.141814, 0.787064, 1.057842, 1, 0, 0.7450981, 1,
1.158504, 0.337692, 3.553881, 1, 0, 0.7372549, 1,
1.168469, -0.5428382, 2.631582, 1, 0, 0.7333333, 1,
1.172077, 0.5239539, -0.4851575, 1, 0, 0.7254902, 1,
1.173365, -0.9812401, 2.047404, 1, 0, 0.7215686, 1,
1.182991, -1.334363, 2.930966, 1, 0, 0.7137255, 1,
1.183945, 0.3788155, 0.9239262, 1, 0, 0.7098039, 1,
1.188274, 0.07270864, 1.685223, 1, 0, 0.7019608, 1,
1.191048, 0.3920635, 1.109685, 1, 0, 0.6941177, 1,
1.210186, 1.633653, 1.235577, 1, 0, 0.6901961, 1,
1.210205, -0.1596559, 1.17658, 1, 0, 0.682353, 1,
1.213631, -0.1819033, 1.291217, 1, 0, 0.6784314, 1,
1.222234, -1.224904, 1.432145, 1, 0, 0.6705883, 1,
1.223524, -0.2947919, 1.52723, 1, 0, 0.6666667, 1,
1.233083, 0.3990097, 0.2246246, 1, 0, 0.6588235, 1,
1.236775, -0.327378, 0.7526593, 1, 0, 0.654902, 1,
1.238333, 2.126564, -0.5672044, 1, 0, 0.6470588, 1,
1.242758, -1.2204, 2.22555, 1, 0, 0.6431373, 1,
1.24404, -1.083558, 3.2811, 1, 0, 0.6352941, 1,
1.248373, 1.781216, 1.772451, 1, 0, 0.6313726, 1,
1.250524, 0.651888, -0.1806842, 1, 0, 0.6235294, 1,
1.251162, -0.3660737, -0.2892535, 1, 0, 0.6196079, 1,
1.257491, -0.2895228, 1.389906, 1, 0, 0.6117647, 1,
1.258656, -0.1614365, 1.251435, 1, 0, 0.6078432, 1,
1.266549, -0.6455836, 2.115761, 1, 0, 0.6, 1,
1.274505, -0.1060821, 1.690618, 1, 0, 0.5921569, 1,
1.275004, 0.7138832, 0.4633665, 1, 0, 0.5882353, 1,
1.275543, 1.161526, 0.4219567, 1, 0, 0.5803922, 1,
1.278674, 0.4298829, 0.918689, 1, 0, 0.5764706, 1,
1.279651, -0.4728405, -0.06903262, 1, 0, 0.5686275, 1,
1.282545, 0.1264019, 1.339979, 1, 0, 0.5647059, 1,
1.283288, -0.008962367, 3.470734, 1, 0, 0.5568628, 1,
1.289188, 0.420046, -0.3791078, 1, 0, 0.5529412, 1,
1.295627, 0.4133708, -0.0905467, 1, 0, 0.5450981, 1,
1.316028, 0.953784, -1.966051, 1, 0, 0.5411765, 1,
1.32062, 0.2858464, 0.8783002, 1, 0, 0.5333334, 1,
1.328021, -2.614118, 2.805485, 1, 0, 0.5294118, 1,
1.329261, -1.579895, 1.833034, 1, 0, 0.5215687, 1,
1.332507, -0.2499954, 1.813192, 1, 0, 0.5176471, 1,
1.343488, -1.401271, 4.975512, 1, 0, 0.509804, 1,
1.358413, 0.3058039, -0.6602758, 1, 0, 0.5058824, 1,
1.369985, 0.9737456, 2.442312, 1, 0, 0.4980392, 1,
1.376072, -1.232154, 3.367832, 1, 0, 0.4901961, 1,
1.376167, -0.3358932, 2.73361, 1, 0, 0.4862745, 1,
1.380096, -0.9748342, 1.313979, 1, 0, 0.4784314, 1,
1.384522, 0.1541364, 1.494646, 1, 0, 0.4745098, 1,
1.393536, -0.7286878, 2.890966, 1, 0, 0.4666667, 1,
1.395647, -1.350728, 2.869316, 1, 0, 0.4627451, 1,
1.445271, -1.056373, 1.781781, 1, 0, 0.454902, 1,
1.451816, -0.8126978, 3.16817, 1, 0, 0.4509804, 1,
1.463563, 0.1713217, 1.337453, 1, 0, 0.4431373, 1,
1.475282, -1.463737, 0.8670546, 1, 0, 0.4392157, 1,
1.493485, -1.953656, 4.023196, 1, 0, 0.4313726, 1,
1.497902, -1.162397, 2.159477, 1, 0, 0.427451, 1,
1.49813, -0.8250841, 1.716832, 1, 0, 0.4196078, 1,
1.506263, -0.7521489, 2.088187, 1, 0, 0.4156863, 1,
1.506661, 0.6393133, 0.4757639, 1, 0, 0.4078431, 1,
1.507337, 0.1955129, 0.3803479, 1, 0, 0.4039216, 1,
1.507687, 0.07309332, 0.1252358, 1, 0, 0.3960784, 1,
1.51672, 0.4038294, 0.8560563, 1, 0, 0.3882353, 1,
1.532501, -0.7361765, 2.846468, 1, 0, 0.3843137, 1,
1.543931, 0.9965415, 1.704621, 1, 0, 0.3764706, 1,
1.544896, -1.153787, 3.374278, 1, 0, 0.372549, 1,
1.561536, -0.3402516, 2.909911, 1, 0, 0.3647059, 1,
1.564331, -0.2583985, 0.005309994, 1, 0, 0.3607843, 1,
1.569042, -1.078153, 0.4291941, 1, 0, 0.3529412, 1,
1.578416, -1.274772, 1.025557, 1, 0, 0.3490196, 1,
1.589654, -1.00472, 2.652634, 1, 0, 0.3411765, 1,
1.591666, 1.962073, 0.8424394, 1, 0, 0.3372549, 1,
1.609184, -0.9651071, 1.579863, 1, 0, 0.3294118, 1,
1.6124, 0.5020901, 1.103291, 1, 0, 0.3254902, 1,
1.633165, -0.1049332, 1.187312, 1, 0, 0.3176471, 1,
1.638462, -1.749131, 3.251068, 1, 0, 0.3137255, 1,
1.644272, 0.005292472, 1.470555, 1, 0, 0.3058824, 1,
1.647036, -0.8803715, 1.923873, 1, 0, 0.2980392, 1,
1.655286, -1.068685, 1.922568, 1, 0, 0.2941177, 1,
1.65695, 1.37202, -0.1239531, 1, 0, 0.2862745, 1,
1.670961, 0.3192468, 1.700385, 1, 0, 0.282353, 1,
1.674827, 0.5998481, 1.421536, 1, 0, 0.2745098, 1,
1.681477, 1.174677, 0.9116975, 1, 0, 0.2705882, 1,
1.692646, 0.239011, -0.4213413, 1, 0, 0.2627451, 1,
1.693915, 1.074522, 2.143908, 1, 0, 0.2588235, 1,
1.71275, -0.1524193, 2.547937, 1, 0, 0.2509804, 1,
1.7217, 1.139792, 0.6276594, 1, 0, 0.2470588, 1,
1.730266, -0.6655714, 1.648346, 1, 0, 0.2392157, 1,
1.737036, -0.392615, 2.159218, 1, 0, 0.2352941, 1,
1.76696, -0.1206033, 1.601009, 1, 0, 0.227451, 1,
1.776102, -2.858114, 1.946138, 1, 0, 0.2235294, 1,
1.782365, 0.2996964, 2.428437, 1, 0, 0.2156863, 1,
1.804455, 0.2922316, 1.250285, 1, 0, 0.2117647, 1,
1.80791, -1.13096, 1.951565, 1, 0, 0.2039216, 1,
1.813282, 0.1859698, 2.905085, 1, 0, 0.1960784, 1,
1.847404, -0.9877397, 1.649181, 1, 0, 0.1921569, 1,
1.856426, -1.927178, 4.513191, 1, 0, 0.1843137, 1,
1.856631, 0.007930537, -1.355522, 1, 0, 0.1803922, 1,
1.857685, -0.346636, 1.139317, 1, 0, 0.172549, 1,
1.901662, 1.168995, -0.2306848, 1, 0, 0.1686275, 1,
1.92755, -0.9187112, 1.315992, 1, 0, 0.1607843, 1,
1.970278, -0.3489982, 0.00822232, 1, 0, 0.1568628, 1,
2.005863, 0.9564564, -0.3300647, 1, 0, 0.1490196, 1,
2.02251, 1.71433, 0.7816125, 1, 0, 0.145098, 1,
2.022872, -0.2153603, 1.251763, 1, 0, 0.1372549, 1,
2.030582, -0.5580019, 2.360222, 1, 0, 0.1333333, 1,
2.054163, 0.4355949, 0.6570503, 1, 0, 0.1254902, 1,
2.077941, -0.688163, 2.941411, 1, 0, 0.1215686, 1,
2.078769, -0.5347843, 0.915291, 1, 0, 0.1137255, 1,
2.093111, -1.190769, 3.36868, 1, 0, 0.1098039, 1,
2.127195, -0.5045735, 2.10067, 1, 0, 0.1019608, 1,
2.169436, -0.5580692, 3.427538, 1, 0, 0.09411765, 1,
2.187946, 1.086974, 1.620947, 1, 0, 0.09019608, 1,
2.285278, -0.3744021, 1.739224, 1, 0, 0.08235294, 1,
2.303288, -1.374864, 3.893952, 1, 0, 0.07843138, 1,
2.34961, -1.484276, 2.366256, 1, 0, 0.07058824, 1,
2.441543, 0.7014898, 1.69729, 1, 0, 0.06666667, 1,
2.457833, -1.937102, 2.126593, 1, 0, 0.05882353, 1,
2.463609, 0.9700451, 1.674912, 1, 0, 0.05490196, 1,
2.473153, 1.225175, -0.2325189, 1, 0, 0.04705882, 1,
2.498536, 0.9118258, 0.851835, 1, 0, 0.04313726, 1,
2.518397, 0.8793919, 0.4569391, 1, 0, 0.03529412, 1,
2.622878, -0.1199432, 1.99864, 1, 0, 0.03137255, 1,
2.634547, 1.171701, 0.7945606, 1, 0, 0.02352941, 1,
2.855911, -0.2695055, 3.095397, 1, 0, 0.01960784, 1,
2.890862, -0.2542679, 2.578767, 1, 0, 0.01176471, 1,
3.126171, 0.2310161, 0.1438984, 1, 0, 0.007843138, 1
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
0.003636241, -4.230927, -6.798553, 0, -0.5, 0.5, 0.5,
0.003636241, -4.230927, -6.798553, 1, -0.5, 0.5, 0.5,
0.003636241, -4.230927, -6.798553, 1, 1.5, 0.5, 0.5,
0.003636241, -4.230927, -6.798553, 0, 1.5, 0.5, 0.5
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
-4.177438, 0.3044655, -6.798553, 0, -0.5, 0.5, 0.5,
-4.177438, 0.3044655, -6.798553, 1, -0.5, 0.5, 0.5,
-4.177438, 0.3044655, -6.798553, 1, 1.5, 0.5, 0.5,
-4.177438, 0.3044655, -6.798553, 0, 1.5, 0.5, 0.5
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
-4.177438, -4.230927, 0.1351333, 0, -0.5, 0.5, 0.5,
-4.177438, -4.230927, 0.1351333, 1, -0.5, 0.5, 0.5,
-4.177438, -4.230927, 0.1351333, 1, 1.5, 0.5, 0.5,
-4.177438, -4.230927, 0.1351333, 0, 1.5, 0.5, 0.5
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
-3, -3.184298, -5.198472,
3, -3.184298, -5.198472,
-3, -3.184298, -5.198472,
-3, -3.358736, -5.465152,
-2, -3.184298, -5.198472,
-2, -3.358736, -5.465152,
-1, -3.184298, -5.198472,
-1, -3.358736, -5.465152,
0, -3.184298, -5.198472,
0, -3.358736, -5.465152,
1, -3.184298, -5.198472,
1, -3.358736, -5.465152,
2, -3.184298, -5.198472,
2, -3.358736, -5.465152,
3, -3.184298, -5.198472,
3, -3.358736, -5.465152
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
-3, -3.707612, -5.998513, 0, -0.5, 0.5, 0.5,
-3, -3.707612, -5.998513, 1, -0.5, 0.5, 0.5,
-3, -3.707612, -5.998513, 1, 1.5, 0.5, 0.5,
-3, -3.707612, -5.998513, 0, 1.5, 0.5, 0.5,
-2, -3.707612, -5.998513, 0, -0.5, 0.5, 0.5,
-2, -3.707612, -5.998513, 1, -0.5, 0.5, 0.5,
-2, -3.707612, -5.998513, 1, 1.5, 0.5, 0.5,
-2, -3.707612, -5.998513, 0, 1.5, 0.5, 0.5,
-1, -3.707612, -5.998513, 0, -0.5, 0.5, 0.5,
-1, -3.707612, -5.998513, 1, -0.5, 0.5, 0.5,
-1, -3.707612, -5.998513, 1, 1.5, 0.5, 0.5,
-1, -3.707612, -5.998513, 0, 1.5, 0.5, 0.5,
0, -3.707612, -5.998513, 0, -0.5, 0.5, 0.5,
0, -3.707612, -5.998513, 1, -0.5, 0.5, 0.5,
0, -3.707612, -5.998513, 1, 1.5, 0.5, 0.5,
0, -3.707612, -5.998513, 0, 1.5, 0.5, 0.5,
1, -3.707612, -5.998513, 0, -0.5, 0.5, 0.5,
1, -3.707612, -5.998513, 1, -0.5, 0.5, 0.5,
1, -3.707612, -5.998513, 1, 1.5, 0.5, 0.5,
1, -3.707612, -5.998513, 0, 1.5, 0.5, 0.5,
2, -3.707612, -5.998513, 0, -0.5, 0.5, 0.5,
2, -3.707612, -5.998513, 1, -0.5, 0.5, 0.5,
2, -3.707612, -5.998513, 1, 1.5, 0.5, 0.5,
2, -3.707612, -5.998513, 0, 1.5, 0.5, 0.5,
3, -3.707612, -5.998513, 0, -0.5, 0.5, 0.5,
3, -3.707612, -5.998513, 1, -0.5, 0.5, 0.5,
3, -3.707612, -5.998513, 1, 1.5, 0.5, 0.5,
3, -3.707612, -5.998513, 0, 1.5, 0.5, 0.5
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
-3.212574, -3, -5.198472,
-3.212574, 3, -5.198472,
-3.212574, -3, -5.198472,
-3.373385, -3, -5.465152,
-3.212574, -2, -5.198472,
-3.373385, -2, -5.465152,
-3.212574, -1, -5.198472,
-3.373385, -1, -5.465152,
-3.212574, 0, -5.198472,
-3.373385, 0, -5.465152,
-3.212574, 1, -5.198472,
-3.373385, 1, -5.465152,
-3.212574, 2, -5.198472,
-3.373385, 2, -5.465152,
-3.212574, 3, -5.198472,
-3.373385, 3, -5.465152
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
-3.695006, -3, -5.998513, 0, -0.5, 0.5, 0.5,
-3.695006, -3, -5.998513, 1, -0.5, 0.5, 0.5,
-3.695006, -3, -5.998513, 1, 1.5, 0.5, 0.5,
-3.695006, -3, -5.998513, 0, 1.5, 0.5, 0.5,
-3.695006, -2, -5.998513, 0, -0.5, 0.5, 0.5,
-3.695006, -2, -5.998513, 1, -0.5, 0.5, 0.5,
-3.695006, -2, -5.998513, 1, 1.5, 0.5, 0.5,
-3.695006, -2, -5.998513, 0, 1.5, 0.5, 0.5,
-3.695006, -1, -5.998513, 0, -0.5, 0.5, 0.5,
-3.695006, -1, -5.998513, 1, -0.5, 0.5, 0.5,
-3.695006, -1, -5.998513, 1, 1.5, 0.5, 0.5,
-3.695006, -1, -5.998513, 0, 1.5, 0.5, 0.5,
-3.695006, 0, -5.998513, 0, -0.5, 0.5, 0.5,
-3.695006, 0, -5.998513, 1, -0.5, 0.5, 0.5,
-3.695006, 0, -5.998513, 1, 1.5, 0.5, 0.5,
-3.695006, 0, -5.998513, 0, 1.5, 0.5, 0.5,
-3.695006, 1, -5.998513, 0, -0.5, 0.5, 0.5,
-3.695006, 1, -5.998513, 1, -0.5, 0.5, 0.5,
-3.695006, 1, -5.998513, 1, 1.5, 0.5, 0.5,
-3.695006, 1, -5.998513, 0, 1.5, 0.5, 0.5,
-3.695006, 2, -5.998513, 0, -0.5, 0.5, 0.5,
-3.695006, 2, -5.998513, 1, -0.5, 0.5, 0.5,
-3.695006, 2, -5.998513, 1, 1.5, 0.5, 0.5,
-3.695006, 2, -5.998513, 0, 1.5, 0.5, 0.5,
-3.695006, 3, -5.998513, 0, -0.5, 0.5, 0.5,
-3.695006, 3, -5.998513, 1, -0.5, 0.5, 0.5,
-3.695006, 3, -5.998513, 1, 1.5, 0.5, 0.5,
-3.695006, 3, -5.998513, 0, 1.5, 0.5, 0.5
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
-3.212574, -3.184298, -4,
-3.212574, -3.184298, 4,
-3.212574, -3.184298, -4,
-3.373385, -3.358736, -4,
-3.212574, -3.184298, -2,
-3.373385, -3.358736, -2,
-3.212574, -3.184298, 0,
-3.373385, -3.358736, 0,
-3.212574, -3.184298, 2,
-3.373385, -3.358736, 2,
-3.212574, -3.184298, 4,
-3.373385, -3.358736, 4
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
-3.695006, -3.707612, -4, 0, -0.5, 0.5, 0.5,
-3.695006, -3.707612, -4, 1, -0.5, 0.5, 0.5,
-3.695006, -3.707612, -4, 1, 1.5, 0.5, 0.5,
-3.695006, -3.707612, -4, 0, 1.5, 0.5, 0.5,
-3.695006, -3.707612, -2, 0, -0.5, 0.5, 0.5,
-3.695006, -3.707612, -2, 1, -0.5, 0.5, 0.5,
-3.695006, -3.707612, -2, 1, 1.5, 0.5, 0.5,
-3.695006, -3.707612, -2, 0, 1.5, 0.5, 0.5,
-3.695006, -3.707612, 0, 0, -0.5, 0.5, 0.5,
-3.695006, -3.707612, 0, 1, -0.5, 0.5, 0.5,
-3.695006, -3.707612, 0, 1, 1.5, 0.5, 0.5,
-3.695006, -3.707612, 0, 0, 1.5, 0.5, 0.5,
-3.695006, -3.707612, 2, 0, -0.5, 0.5, 0.5,
-3.695006, -3.707612, 2, 1, -0.5, 0.5, 0.5,
-3.695006, -3.707612, 2, 1, 1.5, 0.5, 0.5,
-3.695006, -3.707612, 2, 0, 1.5, 0.5, 0.5,
-3.695006, -3.707612, 4, 0, -0.5, 0.5, 0.5,
-3.695006, -3.707612, 4, 1, -0.5, 0.5, 0.5,
-3.695006, -3.707612, 4, 1, 1.5, 0.5, 0.5,
-3.695006, -3.707612, 4, 0, 1.5, 0.5, 0.5
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
-3.212574, -3.184298, -5.198472,
-3.212574, 3.793229, -5.198472,
-3.212574, -3.184298, 5.468739,
-3.212574, 3.793229, 5.468739,
-3.212574, -3.184298, -5.198472,
-3.212574, -3.184298, 5.468739,
-3.212574, 3.793229, -5.198472,
-3.212574, 3.793229, 5.468739,
-3.212574, -3.184298, -5.198472,
3.219847, -3.184298, -5.198472,
-3.212574, -3.184298, 5.468739,
3.219847, -3.184298, 5.468739,
-3.212574, 3.793229, -5.198472,
3.219847, 3.793229, -5.198472,
-3.212574, 3.793229, 5.468739,
3.219847, 3.793229, 5.468739,
3.219847, -3.184298, -5.198472,
3.219847, 3.793229, -5.198472,
3.219847, -3.184298, 5.468739,
3.219847, 3.793229, 5.468739,
3.219847, -3.184298, -5.198472,
3.219847, -3.184298, 5.468739,
3.219847, 3.793229, -5.198472,
3.219847, 3.793229, 5.468739
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
var radius = 7.623988;
var distance = 33.91998;
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
mvMatrix.translate( -0.003636241, -0.3044655, -0.1351333 );
mvMatrix.scale( 1.281509, 1.181394, 0.7727611 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91998);
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
fenoxaprop-ethyl<-read.table("fenoxaprop-ethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenoxaprop-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
y<-fenoxaprop-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
z<-fenoxaprop-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
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
-3.118898, -1.035485, -2.008364, 0, 0, 1, 1, 1,
-3.053695, 0.08160283, -1.872964, 1, 0, 0, 1, 1,
-2.745265, -0.7010444, -3.018297, 1, 0, 0, 1, 1,
-2.477518, 0.0672989, -3.025019, 1, 0, 0, 1, 1,
-2.44511, 1.192372, -0.9874839, 1, 0, 0, 1, 1,
-2.443052, 1.232399, -3.246611, 1, 0, 0, 1, 1,
-2.348281, 1.669939, -0.4264325, 0, 0, 0, 1, 1,
-2.321486, 0.5654068, -2.238209, 0, 0, 0, 1, 1,
-2.300333, 0.00941884, -3.813576, 0, 0, 0, 1, 1,
-2.277969, 0.1331951, -2.587316, 0, 0, 0, 1, 1,
-2.202149, 1.746776, -1.991995, 0, 0, 0, 1, 1,
-2.13137, -0.7587609, -0.9825233, 0, 0, 0, 1, 1,
-2.117619, 0.9639699, -1.049609, 0, 0, 0, 1, 1,
-2.078654, 0.1678978, -1.837873, 1, 1, 1, 1, 1,
-2.020606, -1.531362, -4.09108, 1, 1, 1, 1, 1,
-2.0165, -0.6757478, -4.20162, 1, 1, 1, 1, 1,
-1.993622, 0.547849, -0.1984251, 1, 1, 1, 1, 1,
-1.906589, -1.068851, -2.709877, 1, 1, 1, 1, 1,
-1.898299, -0.04521499, 0.2385461, 1, 1, 1, 1, 1,
-1.88536, 0.6236379, -1.919933, 1, 1, 1, 1, 1,
-1.880663, -0.4917636, -0.8201182, 1, 1, 1, 1, 1,
-1.873281, -0.2619913, 0.276357, 1, 1, 1, 1, 1,
-1.863461, -0.189047, -0.8640683, 1, 1, 1, 1, 1,
-1.858077, 0.7338271, -1.391204, 1, 1, 1, 1, 1,
-1.841741, -2.005029, -3.705372, 1, 1, 1, 1, 1,
-1.817789, -0.4926168, -1.608668, 1, 1, 1, 1, 1,
-1.803316, -0.04240229, -0.9911629, 1, 1, 1, 1, 1,
-1.791312, 0.5575407, -0.7427244, 1, 1, 1, 1, 1,
-1.770988, -0.4227495, -1.910602, 0, 0, 1, 1, 1,
-1.750591, 2.253599, 0.580023, 1, 0, 0, 1, 1,
-1.742213, 0.4063287, -3.517739, 1, 0, 0, 1, 1,
-1.73442, 0.4693934, -0.2495853, 1, 0, 0, 1, 1,
-1.733315, -0.9923872, -3.621402, 1, 0, 0, 1, 1,
-1.713341, -0.5499716, -0.9883854, 1, 0, 0, 1, 1,
-1.690272, 1.861559, 0.3658548, 0, 0, 0, 1, 1,
-1.686751, -1.540417, -2.203642, 0, 0, 0, 1, 1,
-1.684469, 0.5931942, -0.516866, 0, 0, 0, 1, 1,
-1.682548, -0.1608979, -1.498559, 0, 0, 0, 1, 1,
-1.67416, 0.8996448, -3.866819, 0, 0, 0, 1, 1,
-1.673951, 0.9425978, -0.989253, 0, 0, 0, 1, 1,
-1.672107, -0.7734849, -2.135271, 0, 0, 0, 1, 1,
-1.67115, -0.6730588, -1.189632, 1, 1, 1, 1, 1,
-1.656683, -0.9176256, -1.767625, 1, 1, 1, 1, 1,
-1.653079, 1.748401, -1.596483, 1, 1, 1, 1, 1,
-1.628537, -0.9673576, -4.263802, 1, 1, 1, 1, 1,
-1.62163, 1.260491, -0.9144914, 1, 1, 1, 1, 1,
-1.606309, 2.085186, -0.7870702, 1, 1, 1, 1, 1,
-1.599383, -0.03533971, -2.589912, 1, 1, 1, 1, 1,
-1.586098, 1.459134, -0.5464379, 1, 1, 1, 1, 1,
-1.579311, 0.6249503, -0.8189096, 1, 1, 1, 1, 1,
-1.560582, -0.245547, -4.230131, 1, 1, 1, 1, 1,
-1.529653, -0.8096825, -1.625109, 1, 1, 1, 1, 1,
-1.520761, 0.3446596, -1.732951, 1, 1, 1, 1, 1,
-1.491734, -0.6121169, -3.412598, 1, 1, 1, 1, 1,
-1.47297, -0.7522137, -2.087048, 1, 1, 1, 1, 1,
-1.466681, -1.57616, -3.977942, 1, 1, 1, 1, 1,
-1.461479, 0.9706014, -2.163023, 0, 0, 1, 1, 1,
-1.461312, 0.2384659, 1.892255, 1, 0, 0, 1, 1,
-1.45179, -0.2053021, 0.7076107, 1, 0, 0, 1, 1,
-1.435906, -0.6339837, -2.223777, 1, 0, 0, 1, 1,
-1.419834, 0.1653992, -1.82583, 1, 0, 0, 1, 1,
-1.418298, -0.3799097, -2.697906, 1, 0, 0, 1, 1,
-1.416881, -0.9902331, -3.245666, 0, 0, 0, 1, 1,
-1.416466, 0.2595687, -1.772878, 0, 0, 0, 1, 1,
-1.416133, 0.627055, -0.5334342, 0, 0, 0, 1, 1,
-1.402774, -0.3875336, -1.269999, 0, 0, 0, 1, 1,
-1.381143, 1.255788, -2.264248, 0, 0, 0, 1, 1,
-1.360199, 1.509666, -1.34479, 0, 0, 0, 1, 1,
-1.335182, -0.8828449, -1.286205, 0, 0, 0, 1, 1,
-1.328218, 0.05417332, -1.826976, 1, 1, 1, 1, 1,
-1.327903, 0.2102723, -2.194736, 1, 1, 1, 1, 1,
-1.320932, -0.5453255, 0.2154854, 1, 1, 1, 1, 1,
-1.299587, -1.584359, -3.82513, 1, 1, 1, 1, 1,
-1.275002, -1.027684, -1.22122, 1, 1, 1, 1, 1,
-1.271286, 1.268513, -1.34559, 1, 1, 1, 1, 1,
-1.262933, -0.2042173, -2.723352, 1, 1, 1, 1, 1,
-1.259542, -0.700528, -2.251206, 1, 1, 1, 1, 1,
-1.256953, 0.04144043, -2.647911, 1, 1, 1, 1, 1,
-1.254912, 0.3663998, -1.602413, 1, 1, 1, 1, 1,
-1.243821, 1.293787, -0.144185, 1, 1, 1, 1, 1,
-1.240608, 0.8700954, -3.429613, 1, 1, 1, 1, 1,
-1.239669, 0.6139078, -1.790149, 1, 1, 1, 1, 1,
-1.237946, -0.7885097, -1.621218, 1, 1, 1, 1, 1,
-1.2325, -0.8835563, -0.8296369, 1, 1, 1, 1, 1,
-1.230122, -1.37146, -1.067188, 0, 0, 1, 1, 1,
-1.224797, -0.2150403, -2.129308, 1, 0, 0, 1, 1,
-1.220088, 0.4602737, -1.515002, 1, 0, 0, 1, 1,
-1.209012, -1.655966, -3.255475, 1, 0, 0, 1, 1,
-1.193061, 0.5222026, -1.783222, 1, 0, 0, 1, 1,
-1.193036, 0.5271827, 0.354389, 1, 0, 0, 1, 1,
-1.186807, -0.3067746, -3.795217, 0, 0, 0, 1, 1,
-1.185528, -0.01710448, -1.004879, 0, 0, 0, 1, 1,
-1.174986, 2.043208, -1.280225, 0, 0, 0, 1, 1,
-1.163912, 0.2591564, -1.844789, 0, 0, 0, 1, 1,
-1.16223, 0.6147211, -1.960899, 0, 0, 0, 1, 1,
-1.158887, -0.1113404, -1.792303, 0, 0, 0, 1, 1,
-1.154617, 0.2925455, -1.836819, 0, 0, 0, 1, 1,
-1.148806, 0.350369, 0.2068148, 1, 1, 1, 1, 1,
-1.144997, 1.421513, -0.2495531, 1, 1, 1, 1, 1,
-1.144432, 0.8609408, -0.3064281, 1, 1, 1, 1, 1,
-1.143692, 1.588715, -0.5300627, 1, 1, 1, 1, 1,
-1.143356, 0.4111394, -3.640316, 1, 1, 1, 1, 1,
-1.140993, -0.4362728, -3.448864, 1, 1, 1, 1, 1,
-1.140064, -2.376502, -2.876983, 1, 1, 1, 1, 1,
-1.138024, 0.2932088, -2.330731, 1, 1, 1, 1, 1,
-1.137149, 0.3983987, -2.822727, 1, 1, 1, 1, 1,
-1.135863, -0.3739255, -1.502771, 1, 1, 1, 1, 1,
-1.132774, 0.9781374, -1.006453, 1, 1, 1, 1, 1,
-1.130739, 0.07338462, 1.491863, 1, 1, 1, 1, 1,
-1.124579, 1.373496, -0.09560288, 1, 1, 1, 1, 1,
-1.12419, -1.351287, -3.958453, 1, 1, 1, 1, 1,
-1.118245, 0.01723734, -0.7350101, 1, 1, 1, 1, 1,
-1.111953, 2.045906, -0.1538523, 0, 0, 1, 1, 1,
-1.110002, 0.1668007, 0.06756108, 1, 0, 0, 1, 1,
-1.098978, 1.101664, -1.754619, 1, 0, 0, 1, 1,
-1.097486, -0.04025212, -0.2913152, 1, 0, 0, 1, 1,
-1.081639, -0.8328488, -0.9258093, 1, 0, 0, 1, 1,
-1.078127, 0.3491949, -1.39349, 1, 0, 0, 1, 1,
-1.068221, 0.1358234, -0.6378646, 0, 0, 0, 1, 1,
-1.054953, 0.1917241, -2.445746, 0, 0, 0, 1, 1,
-1.052791, -0.4027669, -1.131049, 0, 0, 0, 1, 1,
-1.044061, 1.034849, -1.806553, 0, 0, 0, 1, 1,
-1.032901, -0.4075595, -2.056055, 0, 0, 0, 1, 1,
-1.028003, -1.273224, -1.694272, 0, 0, 0, 1, 1,
-1.020025, 0.3545908, -2.9955, 0, 0, 0, 1, 1,
-1.018842, -1.756299, -2.796474, 1, 1, 1, 1, 1,
-1.017491, 0.2474536, -2.782736, 1, 1, 1, 1, 1,
-1.010956, -0.03957136, -1.881766, 1, 1, 1, 1, 1,
-1.010927, -0.922657, -2.890349, 1, 1, 1, 1, 1,
-0.9999241, -0.1457195, -0.3957323, 1, 1, 1, 1, 1,
-0.9923146, 0.4742934, -0.9670829, 1, 1, 1, 1, 1,
-0.9912608, 0.2306389, -1.826595, 1, 1, 1, 1, 1,
-0.9825246, 0.8246738, -1.626059, 1, 1, 1, 1, 1,
-0.9820053, 0.01592533, -1.786454, 1, 1, 1, 1, 1,
-0.9784004, -1.675109, -1.851788, 1, 1, 1, 1, 1,
-0.9782271, 0.7567666, 1.08153, 1, 1, 1, 1, 1,
-0.974139, -0.3370232, -1.687909, 1, 1, 1, 1, 1,
-0.9627812, 0.4181461, -1.506702, 1, 1, 1, 1, 1,
-0.9620938, 1.661923, -0.9108142, 1, 1, 1, 1, 1,
-0.9499096, 0.7705285, -0.555447, 1, 1, 1, 1, 1,
-0.9492224, -0.7887019, -2.497596, 0, 0, 1, 1, 1,
-0.943988, -0.09539996, -0.03676455, 1, 0, 0, 1, 1,
-0.9308799, -1.194551, -1.845923, 1, 0, 0, 1, 1,
-0.9152855, -0.2587654, -1.78029, 1, 0, 0, 1, 1,
-0.9082147, -1.393283, -2.513909, 1, 0, 0, 1, 1,
-0.9076899, -0.3157751, -2.007853, 1, 0, 0, 1, 1,
-0.9016014, -1.29204, -3.157468, 0, 0, 0, 1, 1,
-0.8964949, -0.735496, -1.942461, 0, 0, 0, 1, 1,
-0.8944634, 0.7573588, -0.2673917, 0, 0, 0, 1, 1,
-0.8925817, -0.1569161, -1.635497, 0, 0, 0, 1, 1,
-0.8918341, -0.9979833, -2.813062, 0, 0, 0, 1, 1,
-0.8909799, 0.06513461, -1.134551, 0, 0, 0, 1, 1,
-0.8882178, 0.3140947, -0.7282152, 0, 0, 0, 1, 1,
-0.8857234, -1.908125, -4.66223, 1, 1, 1, 1, 1,
-0.8821794, -0.33254, -2.483054, 1, 1, 1, 1, 1,
-0.881061, -0.9417912, -1.038051, 1, 1, 1, 1, 1,
-0.8789995, -1.451509, -2.780026, 1, 1, 1, 1, 1,
-0.8776288, -1.017468, -1.965265, 1, 1, 1, 1, 1,
-0.8774765, 2.242337, 1.023144, 1, 1, 1, 1, 1,
-0.8723081, 0.05034262, -0.7868298, 1, 1, 1, 1, 1,
-0.869514, -0.3897683, -1.680714, 1, 1, 1, 1, 1,
-0.8692578, -0.7996129, -2.53826, 1, 1, 1, 1, 1,
-0.8663375, -0.1580352, -1.829347, 1, 1, 1, 1, 1,
-0.8650752, 0.5576458, -1.742053, 1, 1, 1, 1, 1,
-0.8632079, 0.8213937, -2.292638, 1, 1, 1, 1, 1,
-0.8619302, 0.06001228, -1.295583, 1, 1, 1, 1, 1,
-0.854327, -0.8834081, -3.414281, 1, 1, 1, 1, 1,
-0.8530637, -0.779607, 0.4328671, 1, 1, 1, 1, 1,
-0.8501881, 2.508873, 1.722881, 0, 0, 1, 1, 1,
-0.8484159, -0.01897504, -1.424641, 1, 0, 0, 1, 1,
-0.8394193, 0.1710734, -0.03903829, 1, 0, 0, 1, 1,
-0.832454, -0.3080323, -2.795405, 1, 0, 0, 1, 1,
-0.8293553, 0.7703346, -0.3472384, 1, 0, 0, 1, 1,
-0.8286949, -0.7924264, -1.935322, 1, 0, 0, 1, 1,
-0.8271267, 1.561548, -0.6372494, 0, 0, 0, 1, 1,
-0.8259317, 0.7479483, 1.142847, 0, 0, 0, 1, 1,
-0.8184683, 1.619881, -1.585942, 0, 0, 0, 1, 1,
-0.8164681, 1.979015, -0.2842122, 0, 0, 0, 1, 1,
-0.800813, 0.2274925, -1.56184, 0, 0, 0, 1, 1,
-0.7999871, 2.586125, -1.273096, 0, 0, 0, 1, 1,
-0.7995254, 1.555107, -2.610301, 0, 0, 0, 1, 1,
-0.7941597, -0.9123416, -2.730585, 1, 1, 1, 1, 1,
-0.7929227, -1.043919, -1.116252, 1, 1, 1, 1, 1,
-0.7914335, -0.2266076, -1.89087, 1, 1, 1, 1, 1,
-0.789708, 0.8919301, -0.6146609, 1, 1, 1, 1, 1,
-0.7894031, -0.9743502, -2.127152, 1, 1, 1, 1, 1,
-0.7836645, -0.4193485, -3.055499, 1, 1, 1, 1, 1,
-0.7825022, -0.7070698, -2.02271, 1, 1, 1, 1, 1,
-0.780768, -0.1765057, -2.786688, 1, 1, 1, 1, 1,
-0.7806012, 1.8866, 0.91732, 1, 1, 1, 1, 1,
-0.7770857, -0.1592865, -0.9806885, 1, 1, 1, 1, 1,
-0.7750511, -0.2746648, -2.469315, 1, 1, 1, 1, 1,
-0.7737532, 0.6806811, -0.5582489, 1, 1, 1, 1, 1,
-0.7676203, -0.4684639, -1.999952, 1, 1, 1, 1, 1,
-0.7650017, 0.6806473, 0.4530182, 1, 1, 1, 1, 1,
-0.7638705, -1.254463, -2.646732, 1, 1, 1, 1, 1,
-0.7622755, -0.7905039, -3.125316, 0, 0, 1, 1, 1,
-0.760484, -0.2705142, -1.594622, 1, 0, 0, 1, 1,
-0.7565637, -0.9483825, -3.439727, 1, 0, 0, 1, 1,
-0.755976, 0.3659189, -2.243739, 1, 0, 0, 1, 1,
-0.7442681, 0.5218402, -0.09779144, 1, 0, 0, 1, 1,
-0.7431786, 2.071223, -0.5574748, 1, 0, 0, 1, 1,
-0.7382605, -2.019405, -3.985575, 0, 0, 0, 1, 1,
-0.7321851, -0.2630834, -1.990457, 0, 0, 0, 1, 1,
-0.7171984, -1.257592, -3.11947, 0, 0, 0, 1, 1,
-0.7042501, -1.309584, -3.442965, 0, 0, 0, 1, 1,
-0.7018973, 1.253479, -1.700539, 0, 0, 0, 1, 1,
-0.6969804, 0.608, -0.5143431, 0, 0, 0, 1, 1,
-0.6860993, -0.6575318, -0.9237027, 0, 0, 0, 1, 1,
-0.6855725, -0.3758154, -2.662506, 1, 1, 1, 1, 1,
-0.6839122, -0.07510979, -3.320403, 1, 1, 1, 1, 1,
-0.6805567, -0.8358396, -2.551763, 1, 1, 1, 1, 1,
-0.678228, 0.06026255, -4.541914, 1, 1, 1, 1, 1,
-0.6771342, -0.7514617, -4.125165, 1, 1, 1, 1, 1,
-0.6734318, 0.2358499, -1.378514, 1, 1, 1, 1, 1,
-0.6710811, 0.6278296, -1.154227, 1, 1, 1, 1, 1,
-0.6708578, 2.549678, -1.284777, 1, 1, 1, 1, 1,
-0.6693516, -0.3924741, -1.596376, 1, 1, 1, 1, 1,
-0.6671216, -1.193607, -1.886019, 1, 1, 1, 1, 1,
-0.6668977, 2.563195, -0.02137744, 1, 1, 1, 1, 1,
-0.6654512, -0.002156724, -3.540979, 1, 1, 1, 1, 1,
-0.6649442, -0.526559, -3.741701, 1, 1, 1, 1, 1,
-0.6632506, -1.776926, -2.165915, 1, 1, 1, 1, 1,
-0.6576257, -0.6830154, -2.827389, 1, 1, 1, 1, 1,
-0.6569725, 0.1582286, -2.797328, 0, 0, 1, 1, 1,
-0.656749, 1.13773, -0.7694096, 1, 0, 0, 1, 1,
-0.6562342, -0.06787512, -0.3529381, 1, 0, 0, 1, 1,
-0.6515859, -1.098701, -4.859747, 1, 0, 0, 1, 1,
-0.6474521, -0.18408, -0.3375142, 1, 0, 0, 1, 1,
-0.6343126, 1.303653, -1.096034, 1, 0, 0, 1, 1,
-0.6343123, 1.0971, -1.292747, 0, 0, 0, 1, 1,
-0.6322708, 0.08028414, -2.253247, 0, 0, 0, 1, 1,
-0.6321431, -0.09431791, -0.7072619, 0, 0, 0, 1, 1,
-0.63117, 0.1779648, -1.30606, 0, 0, 0, 1, 1,
-0.6309003, -1.53214, -1.756691, 0, 0, 0, 1, 1,
-0.6297594, -0.5616139, -2.810316, 0, 0, 0, 1, 1,
-0.6160701, -0.9127526, -1.562293, 0, 0, 0, 1, 1,
-0.6131217, 0.5734561, -1.18796, 1, 1, 1, 1, 1,
-0.5993521, 0.5255632, -1.372792, 1, 1, 1, 1, 1,
-0.587073, -0.9191036, -3.567908, 1, 1, 1, 1, 1,
-0.5856761, 0.6249068, -2.028833, 1, 1, 1, 1, 1,
-0.5848134, 0.02077909, -0.906823, 1, 1, 1, 1, 1,
-0.5804723, 1.387166, -1.330593, 1, 1, 1, 1, 1,
-0.5776791, 0.2410474, -2.216891, 1, 1, 1, 1, 1,
-0.5754921, 0.5668146, -0.444901, 1, 1, 1, 1, 1,
-0.5749764, 1.705224, -1.891632, 1, 1, 1, 1, 1,
-0.5733237, -0.6068524, -1.21976, 1, 1, 1, 1, 1,
-0.5634729, 0.1764351, 0.3893661, 1, 1, 1, 1, 1,
-0.562472, 0.7250019, -0.7663037, 1, 1, 1, 1, 1,
-0.5593856, -0.2020613, -0.9630336, 1, 1, 1, 1, 1,
-0.5592347, 0.05975933, -0.7752678, 1, 1, 1, 1, 1,
-0.5551556, -1.694556, -1.981327, 1, 1, 1, 1, 1,
-0.5515654, 0.513002, 0.3099723, 0, 0, 1, 1, 1,
-0.5503024, 0.2641751, 0.02695925, 1, 0, 0, 1, 1,
-0.5463838, 0.3991496, -2.738366, 1, 0, 0, 1, 1,
-0.5451352, 0.4810461, -0.9114771, 1, 0, 0, 1, 1,
-0.5451318, 0.08425373, -1.311285, 1, 0, 0, 1, 1,
-0.5407305, 0.5870139, -0.1988373, 1, 0, 0, 1, 1,
-0.5405467, -0.1687638, -1.817624, 0, 0, 0, 1, 1,
-0.5402156, 0.86761, 0.769656, 0, 0, 0, 1, 1,
-0.5400003, -0.236769, -0.6860421, 0, 0, 0, 1, 1,
-0.5399069, 1.59962, 0.9332751, 0, 0, 0, 1, 1,
-0.5359334, 0.9664358, -1.636437, 0, 0, 0, 1, 1,
-0.5338609, 0.4708949, -0.4870731, 0, 0, 0, 1, 1,
-0.5207255, -0.4868755, -2.444207, 0, 0, 0, 1, 1,
-0.5202903, -0.2677118, -0.6894235, 1, 1, 1, 1, 1,
-0.5200776, -2.362708, -2.852002, 1, 1, 1, 1, 1,
-0.5176787, 1.058768, -0.398743, 1, 1, 1, 1, 1,
-0.5175388, -0.5577719, -2.847211, 1, 1, 1, 1, 1,
-0.5160589, -0.6137826, -2.622351, 1, 1, 1, 1, 1,
-0.5121109, -0.009237875, -1.149138, 1, 1, 1, 1, 1,
-0.5072169, -0.7006419, -2.554691, 1, 1, 1, 1, 1,
-0.4988919, 0.006774601, -0.9521273, 1, 1, 1, 1, 1,
-0.4924544, -0.1588445, -1.826705, 1, 1, 1, 1, 1,
-0.4909901, 0.08168723, -1.483215, 1, 1, 1, 1, 1,
-0.490422, 0.04928018, -1.503898, 1, 1, 1, 1, 1,
-0.4892451, 0.1499914, 0.5829608, 1, 1, 1, 1, 1,
-0.488311, 1.29392, -0.6830789, 1, 1, 1, 1, 1,
-0.4873086, -0.345498, -2.17328, 1, 1, 1, 1, 1,
-0.4852763, 1.305622, -0.5602173, 1, 1, 1, 1, 1,
-0.4838177, -1.051999, -2.641095, 0, 0, 1, 1, 1,
-0.4830852, -0.1838363, -2.280213, 1, 0, 0, 1, 1,
-0.4821866, -0.8416698, -2.259123, 1, 0, 0, 1, 1,
-0.4817764, -0.6758541, -3.471769, 1, 0, 0, 1, 1,
-0.4764956, -0.2779666, -3.340828, 1, 0, 0, 1, 1,
-0.475581, -0.3019719, -1.983096, 1, 0, 0, 1, 1,
-0.474783, 0.05155662, -1.403893, 0, 0, 0, 1, 1,
-0.4747403, 0.05424578, -0.8202969, 0, 0, 0, 1, 1,
-0.4737627, 0.08746529, -0.1256015, 0, 0, 0, 1, 1,
-0.4722639, -0.4174061, -1.14854, 0, 0, 0, 1, 1,
-0.4674248, 0.1512618, -2.907932, 0, 0, 0, 1, 1,
-0.4639536, 0.6342833, -0.4371803, 0, 0, 0, 1, 1,
-0.463949, 0.1888055, -0.01348777, 0, 0, 0, 1, 1,
-0.4620574, 0.4858875, -0.0829122, 1, 1, 1, 1, 1,
-0.4613923, -0.6051673, -1.195693, 1, 1, 1, 1, 1,
-0.4580299, 0.2486518, -0.6746793, 1, 1, 1, 1, 1,
-0.4514478, -0.3088383, -1.927723, 1, 1, 1, 1, 1,
-0.4509724, -0.1028664, -0.3947053, 1, 1, 1, 1, 1,
-0.4500276, -1.22176, -1.410042, 1, 1, 1, 1, 1,
-0.4498951, -0.1858519, -3.847325, 1, 1, 1, 1, 1,
-0.4494767, -0.5701185, -2.533066, 1, 1, 1, 1, 1,
-0.4463835, -2.696873, -3.447689, 1, 1, 1, 1, 1,
-0.4450555, 0.7035283, 0.2024964, 1, 1, 1, 1, 1,
-0.4300691, 0.4616154, -1.193264, 1, 1, 1, 1, 1,
-0.4263614, -0.9923813, -3.453651, 1, 1, 1, 1, 1,
-0.4251821, 0.8109128, 0.2811098, 1, 1, 1, 1, 1,
-0.4246287, -1.173442, -3.137906, 1, 1, 1, 1, 1,
-0.423529, -0.3239181, -2.252918, 1, 1, 1, 1, 1,
-0.4231524, 1.370962, -0.2945313, 0, 0, 1, 1, 1,
-0.4155956, -1.932075, -2.026168, 1, 0, 0, 1, 1,
-0.4136792, 0.4822521, -1.416541, 1, 0, 0, 1, 1,
-0.4132648, -2.394876, -2.454256, 1, 0, 0, 1, 1,
-0.4088797, -1.53943, -2.025415, 1, 0, 0, 1, 1,
-0.408032, 1.934966, 1.973164, 1, 0, 0, 1, 1,
-0.406253, 0.2966807, -0.1184912, 0, 0, 0, 1, 1,
-0.4053291, -2.788203, -2.795092, 0, 0, 0, 1, 1,
-0.402586, -0.3817919, -1.526245, 0, 0, 0, 1, 1,
-0.4002626, -0.1161073, -3.614421, 0, 0, 0, 1, 1,
-0.3984288, -0.5405389, -1.430858, 0, 0, 0, 1, 1,
-0.3874516, 0.1150794, 0.2115982, 0, 0, 0, 1, 1,
-0.3869527, 0.2485933, 0.4202611, 0, 0, 0, 1, 1,
-0.3804666, 1.453743, 1.505325, 1, 1, 1, 1, 1,
-0.3782498, -1.194294, -2.528516, 1, 1, 1, 1, 1,
-0.3749684, -0.5419953, -3.446943, 1, 1, 1, 1, 1,
-0.3748457, -0.5371544, -3.302313, 1, 1, 1, 1, 1,
-0.3730812, -0.3711537, -2.394524, 1, 1, 1, 1, 1,
-0.360344, -0.8849593, -3.164235, 1, 1, 1, 1, 1,
-0.3574373, -1.006959, -4.150418, 1, 1, 1, 1, 1,
-0.3559232, -0.8156877, -1.887347, 1, 1, 1, 1, 1,
-0.3536028, -2.054459, -2.708859, 1, 1, 1, 1, 1,
-0.3534192, 1.138447, 0.3596646, 1, 1, 1, 1, 1,
-0.3501696, 0.5497395, -1.496059, 1, 1, 1, 1, 1,
-0.3476899, 0.5966036, -1.78689, 1, 1, 1, 1, 1,
-0.3371465, -0.3265168, -1.460102, 1, 1, 1, 1, 1,
-0.3335566, -0.5299851, -1.622963, 1, 1, 1, 1, 1,
-0.3320021, 0.193207, -0.5646794, 1, 1, 1, 1, 1,
-0.3305386, 1.000277, -0.0156894, 0, 0, 1, 1, 1,
-0.3296622, -1.472915, -2.226609, 1, 0, 0, 1, 1,
-0.3294849, 0.3197197, -0.2360127, 1, 0, 0, 1, 1,
-0.3281753, 1.329515, -0.7383788, 1, 0, 0, 1, 1,
-0.3102708, -1.060732, -1.410668, 1, 0, 0, 1, 1,
-0.3087919, -1.34718, -2.765815, 1, 0, 0, 1, 1,
-0.3021004, -1.439553, -2.831804, 0, 0, 0, 1, 1,
-0.2944677, 1.738382, 0.216391, 0, 0, 0, 1, 1,
-0.29386, -0.9894564, -1.620847, 0, 0, 0, 1, 1,
-0.2931774, -0.1688571, -1.667668, 0, 0, 0, 1, 1,
-0.2916982, -0.06928709, -1.082374, 0, 0, 0, 1, 1,
-0.2885575, -0.6419864, -2.448076, 0, 0, 0, 1, 1,
-0.2879441, -0.0545577, -1.447278, 0, 0, 0, 1, 1,
-0.2878744, -2.052387, -4.505518, 1, 1, 1, 1, 1,
-0.2862819, -0.1399972, -2.488714, 1, 1, 1, 1, 1,
-0.2861032, 2.245725, -2.118284, 1, 1, 1, 1, 1,
-0.284584, -1.203974, -4.696145, 1, 1, 1, 1, 1,
-0.2834122, -0.4258783, -4.351257, 1, 1, 1, 1, 1,
-0.2825804, -0.02530112, -2.218107, 1, 1, 1, 1, 1,
-0.2801827, -0.3351036, -2.756825, 1, 1, 1, 1, 1,
-0.2729686, 0.8555236, -1.908159, 1, 1, 1, 1, 1,
-0.2718947, 1.381316, -0.06429593, 1, 1, 1, 1, 1,
-0.2709541, 0.888016, 1.430741, 1, 1, 1, 1, 1,
-0.269816, -1.420166, -0.3918609, 1, 1, 1, 1, 1,
-0.267727, -0.440277, -3.035915, 1, 1, 1, 1, 1,
-0.2661493, -0.3768963, -4.763754, 1, 1, 1, 1, 1,
-0.2617472, -0.9852267, -2.352062, 1, 1, 1, 1, 1,
-0.2608924, 0.6913556, -0.08597215, 1, 1, 1, 1, 1,
-0.2591589, 1.500124, 0.1491113, 0, 0, 1, 1, 1,
-0.2590101, -0.05948281, -0.8038021, 1, 0, 0, 1, 1,
-0.2583297, -0.6932024, -2.26313, 1, 0, 0, 1, 1,
-0.2557818, 1.046697, 1.396328, 1, 0, 0, 1, 1,
-0.2531303, 0.7055538, -0.4444627, 1, 0, 0, 1, 1,
-0.2496949, 0.168033, -1.436425, 1, 0, 0, 1, 1,
-0.2488495, -0.2317034, -1.659996, 0, 0, 0, 1, 1,
-0.2465191, 0.2257314, -0.8591486, 0, 0, 0, 1, 1,
-0.2458728, -0.359977, -2.334849, 0, 0, 0, 1, 1,
-0.2421797, 0.09390958, -1.764621, 0, 0, 0, 1, 1,
-0.2402609, -2.788973, -4.367126, 0, 0, 0, 1, 1,
-0.2376913, -0.9014795, -3.187736, 0, 0, 0, 1, 1,
-0.2373555, -0.09501406, -2.601478, 0, 0, 0, 1, 1,
-0.2314999, 1.498837, -0.4595375, 1, 1, 1, 1, 1,
-0.221375, -1.033349, -1.928341, 1, 1, 1, 1, 1,
-0.2160617, -0.5780242, -3.14222, 1, 1, 1, 1, 1,
-0.2114012, 2.166555, 0.6009515, 1, 1, 1, 1, 1,
-0.2099275, 1.206475, 0.4464898, 1, 1, 1, 1, 1,
-0.2095968, -0.5199327, -1.802262, 1, 1, 1, 1, 1,
-0.2078572, 0.5780726, 0.04369079, 1, 1, 1, 1, 1,
-0.2028743, 0.8275399, 0.5352386, 1, 1, 1, 1, 1,
-0.1964348, -0.1264091, -1.171852, 1, 1, 1, 1, 1,
-0.1964326, 0.5651885, -0.5790642, 1, 1, 1, 1, 1,
-0.1905567, 0.1235165, 0.9289016, 1, 1, 1, 1, 1,
-0.1829146, -2.074836, -3.76071, 1, 1, 1, 1, 1,
-0.1799919, -0.5305541, -2.615767, 1, 1, 1, 1, 1,
-0.1782292, -0.9521021, -3.702144, 1, 1, 1, 1, 1,
-0.177009, -0.4342395, -4.325883, 1, 1, 1, 1, 1,
-0.1728755, -0.1360721, -3.272756, 0, 0, 1, 1, 1,
-0.1671454, 0.2936205, -1.825011, 1, 0, 0, 1, 1,
-0.1669769, -0.3208361, -2.85591, 1, 0, 0, 1, 1,
-0.164762, -1.367537, -1.909983, 1, 0, 0, 1, 1,
-0.1633155, 0.1645191, 0.1020321, 1, 0, 0, 1, 1,
-0.1609427, 0.7266805, -1.255462, 1, 0, 0, 1, 1,
-0.1603693, -0.5013109, -3.196865, 0, 0, 0, 1, 1,
-0.1582723, 1.137514, 0.8304808, 0, 0, 0, 1, 1,
-0.1557854, -1.706617, -2.672468, 0, 0, 0, 1, 1,
-0.151559, 1.05783, 0.7522227, 0, 0, 0, 1, 1,
-0.1496733, 0.6913931, -0.5497557, 0, 0, 0, 1, 1,
-0.147522, -0.4835255, -3.108731, 0, 0, 0, 1, 1,
-0.144284, 0.7098807, -0.753192, 0, 0, 0, 1, 1,
-0.1429931, 1.387401, 0.4004033, 1, 1, 1, 1, 1,
-0.1429872, -2.145284, -5.043124, 1, 1, 1, 1, 1,
-0.1422063, 0.01460018, 0.04012433, 1, 1, 1, 1, 1,
-0.1360606, -0.8412833, -3.633954, 1, 1, 1, 1, 1,
-0.134168, -0.4803501, -1.866781, 1, 1, 1, 1, 1,
-0.1258569, -1.559403, -3.227139, 1, 1, 1, 1, 1,
-0.1254146, 0.1153745, -1.791789, 1, 1, 1, 1, 1,
-0.1233133, 0.9529058, 0.6178385, 1, 1, 1, 1, 1,
-0.1225944, 0.8912755, 0.8770821, 1, 1, 1, 1, 1,
-0.1145802, 0.6948475, -1.538492, 1, 1, 1, 1, 1,
-0.1141728, -2.519817, -2.870299, 1, 1, 1, 1, 1,
-0.1130722, -0.2401052, -3.179371, 1, 1, 1, 1, 1,
-0.1130163, -1.738812, -4.040992, 1, 1, 1, 1, 1,
-0.1119957, -1.092242, -2.141352, 1, 1, 1, 1, 1,
-0.1117526, -0.2001448, -0.7600127, 1, 1, 1, 1, 1,
-0.1114711, 0.124085, -1.350001, 0, 0, 1, 1, 1,
-0.1111134, -0.2490656, -4.72974, 1, 0, 0, 1, 1,
-0.1064946, 0.131225, -2.097047, 1, 0, 0, 1, 1,
-0.1061617, 0.3087017, -0.316067, 1, 0, 0, 1, 1,
-0.1057522, 1.462536, -1.040738, 1, 0, 0, 1, 1,
-0.104395, -0.9538904, -1.702946, 1, 0, 0, 1, 1,
-0.1035628, 0.6029419, -0.657959, 0, 0, 0, 1, 1,
-0.1031096, 0.3893385, -0.9374707, 0, 0, 0, 1, 1,
-0.1022847, 0.1717011, 0.3622532, 0, 0, 0, 1, 1,
-0.1013497, 1.434963, 0.2223869, 0, 0, 0, 1, 1,
-0.09967694, -1.085359, -2.991579, 0, 0, 0, 1, 1,
-0.09917478, -2.199765, -2.403562, 0, 0, 0, 1, 1,
-0.0982985, 0.2145098, 0.3299661, 0, 0, 0, 1, 1,
-0.08722346, 0.6691608, -1.266032, 1, 1, 1, 1, 1,
-0.08610082, 1.474047, -1.221688, 1, 1, 1, 1, 1,
-0.08529182, 0.03404786, -0.04028961, 1, 1, 1, 1, 1,
-0.08435873, -0.005166923, -1.735734, 1, 1, 1, 1, 1,
-0.07949041, -0.2893266, -2.072315, 1, 1, 1, 1, 1,
-0.07854784, -0.9142283, -3.029414, 1, 1, 1, 1, 1,
-0.07788545, 0.3042572, 1.712066, 1, 1, 1, 1, 1,
-0.0773465, -0.5046451, -3.467983, 1, 1, 1, 1, 1,
-0.07605341, -0.404159, -1.569587, 1, 1, 1, 1, 1,
-0.07441635, -1.051871, -2.845612, 1, 1, 1, 1, 1,
-0.07225749, 0.6765642, -0.4949711, 1, 1, 1, 1, 1,
-0.07090952, 0.2771446, 0.01894649, 1, 1, 1, 1, 1,
-0.06581479, -1.530949, -1.590654, 1, 1, 1, 1, 1,
-0.06473032, -0.7971317, -2.686954, 1, 1, 1, 1, 1,
-0.06123176, 0.9328389, 0.7550189, 1, 1, 1, 1, 1,
-0.0583501, 2.17853, -0.8815754, 0, 0, 1, 1, 1,
-0.05791359, 1.040245, -0.7985045, 1, 0, 0, 1, 1,
-0.04937225, -0.6208965, -2.037709, 1, 0, 0, 1, 1,
-0.04914486, 0.5463725, 0.8322667, 1, 0, 0, 1, 1,
-0.04784736, 0.086459, -0.798359, 1, 0, 0, 1, 1,
-0.04589065, 2.758573, 0.2496245, 1, 0, 0, 1, 1,
-0.04011497, 0.4196441, 0.0880699, 0, 0, 0, 1, 1,
-0.03518002, -0.2231189, -2.108099, 0, 0, 0, 1, 1,
-0.03189175, -0.5200766, -4.968292, 0, 0, 0, 1, 1,
-0.03132312, 2.057633, -0.0714343, 0, 0, 0, 1, 1,
-0.03025329, -1.389116, -3.451954, 0, 0, 0, 1, 1,
-0.02929648, -1.750814, -3.754751, 0, 0, 0, 1, 1,
-0.02104432, -0.1553967, -3.456279, 0, 0, 0, 1, 1,
-0.02092534, 0.9646265, -0.9363742, 1, 1, 1, 1, 1,
-0.01695649, -0.6444462, -2.065727, 1, 1, 1, 1, 1,
-0.01217487, -0.6243498, -4.08283, 1, 1, 1, 1, 1,
-0.01179676, -0.8064792, -2.077512, 1, 1, 1, 1, 1,
-0.01064245, -0.4144571, -3.283442, 1, 1, 1, 1, 1,
-0.009702367, 0.06484123, -0.6265841, 1, 1, 1, 1, 1,
-0.007140735, -1.622748, -3.300734, 1, 1, 1, 1, 1,
-0.006912089, 0.84389, -0.9215969, 1, 1, 1, 1, 1,
-0.0006895729, -0.4525173, -2.618433, 1, 1, 1, 1, 1,
-0.0004149106, 1.845444, -0.5926906, 1, 1, 1, 1, 1,
0.0006860812, -0.2832475, 3.081237, 1, 1, 1, 1, 1,
0.005559897, -0.1976231, 3.469868, 1, 1, 1, 1, 1,
0.005765194, 1.528389, -2.033629, 1, 1, 1, 1, 1,
0.006525895, -1.791329, 3.860671, 1, 1, 1, 1, 1,
0.009376195, 1.030604, 0.1569212, 1, 1, 1, 1, 1,
0.01047791, -0.0005480463, 2.697403, 0, 0, 1, 1, 1,
0.01861742, 0.139891, -2.060564, 1, 0, 0, 1, 1,
0.01911983, -0.767949, 1.465625, 1, 0, 0, 1, 1,
0.02115343, -1.171132, 4.070837, 1, 0, 0, 1, 1,
0.02206378, -0.05387791, 4.300408, 1, 0, 0, 1, 1,
0.02426816, -1.256943, 2.908907, 1, 0, 0, 1, 1,
0.0255082, 0.5754097, 0.4692854, 0, 0, 0, 1, 1,
0.02612332, 2.79083, 0.7061608, 0, 0, 0, 1, 1,
0.0269062, -1.171733, 3.704, 0, 0, 0, 1, 1,
0.0271189, -1.130746, 2.437649, 0, 0, 0, 1, 1,
0.02849448, -0.3798301, 3.677599, 0, 0, 0, 1, 1,
0.02914027, -0.1848046, 4.868461, 0, 0, 0, 1, 1,
0.03068252, 0.343224, 1.903656, 0, 0, 0, 1, 1,
0.03120388, 0.4844045, -0.448015, 1, 1, 1, 1, 1,
0.03537249, 0.6865961, 0.8862183, 1, 1, 1, 1, 1,
0.03612746, 0.5035639, 2.18295, 1, 1, 1, 1, 1,
0.05914407, -0.5272564, 2.45301, 1, 1, 1, 1, 1,
0.06273292, -0.7479457, 3.583381, 1, 1, 1, 1, 1,
0.0642253, -0.2581676, 1.285296, 1, 1, 1, 1, 1,
0.06424018, -0.2424549, 3.031052, 1, 1, 1, 1, 1,
0.06513959, 0.4202067, 0.1780565, 1, 1, 1, 1, 1,
0.06555555, 0.5283493, -0.3785777, 1, 1, 1, 1, 1,
0.0673518, -0.1713683, 1.74005, 1, 1, 1, 1, 1,
0.07236747, -0.06052621, 3.844168, 1, 1, 1, 1, 1,
0.07261307, 0.02136037, 2.312321, 1, 1, 1, 1, 1,
0.07558182, -0.3516063, 1.3144, 1, 1, 1, 1, 1,
0.07921778, -1.317124, 3.029129, 1, 1, 1, 1, 1,
0.08078724, 0.9940704, 1.229105, 1, 1, 1, 1, 1,
0.08121794, 0.1659655, 0.06657559, 0, 0, 1, 1, 1,
0.08509709, 0.3727242, 0.6370738, 1, 0, 0, 1, 1,
0.0895303, 0.7782137, -0.449549, 1, 0, 0, 1, 1,
0.09364998, -0.7925844, 3.92638, 1, 0, 0, 1, 1,
0.09521384, 0.7951121, -0.2372649, 1, 0, 0, 1, 1,
0.1032008, -0.3012333, 1.194908, 1, 0, 0, 1, 1,
0.1069948, -0.5808282, 2.673521, 0, 0, 0, 1, 1,
0.1072916, -0.2509092, 1.979594, 0, 0, 0, 1, 1,
0.1082009, 1.703602, 1.017421, 0, 0, 0, 1, 1,
0.1116508, 1.41702, 0.03413465, 0, 0, 0, 1, 1,
0.1117827, -1.68617, 2.080314, 0, 0, 0, 1, 1,
0.1137179, -0.616439, 3.089591, 0, 0, 0, 1, 1,
0.1156226, 2.18784, -0.2187171, 0, 0, 0, 1, 1,
0.1193379, 0.9357635, -0.3339286, 1, 1, 1, 1, 1,
0.1199557, 1.604127, -0.7588567, 1, 1, 1, 1, 1,
0.1213312, 0.3913338, 0.3300563, 1, 1, 1, 1, 1,
0.1229114, -1.150986, 1.384967, 1, 1, 1, 1, 1,
0.1242856, -1.71741, 3.427358, 1, 1, 1, 1, 1,
0.1263698, -1.961401, 2.636141, 1, 1, 1, 1, 1,
0.1295207, -0.05450765, 3.807899, 1, 1, 1, 1, 1,
0.1296999, 1.426166, 2.348283, 1, 1, 1, 1, 1,
0.131362, 1.587473, -0.8899775, 1, 1, 1, 1, 1,
0.1323038, -0.6187135, 2.053291, 1, 1, 1, 1, 1,
0.132593, -0.963346, 4.562563, 1, 1, 1, 1, 1,
0.1332209, -1.042014, 3.395517, 1, 1, 1, 1, 1,
0.1385593, -0.3230405, 2.602863, 1, 1, 1, 1, 1,
0.1417705, -0.9020568, 1.733169, 1, 1, 1, 1, 1,
0.1423986, -0.4788331, 2.376189, 1, 1, 1, 1, 1,
0.1432963, -0.6674562, 2.153534, 0, 0, 1, 1, 1,
0.143665, 0.5169342, -0.1211459, 1, 0, 0, 1, 1,
0.147461, -0.7105218, 3.415293, 1, 0, 0, 1, 1,
0.1499534, 0.5079774, 0.3794011, 1, 0, 0, 1, 1,
0.150162, -1.240503, 4.390505, 1, 0, 0, 1, 1,
0.1507728, -1.16128, 2.98807, 1, 0, 0, 1, 1,
0.1515307, 0.6034722, -0.1817106, 0, 0, 0, 1, 1,
0.1541892, 0.8526087, -0.6563134, 0, 0, 0, 1, 1,
0.1544045, -0.429619, 3.754262, 0, 0, 0, 1, 1,
0.1566201, -0.1095062, 2.232541, 0, 0, 0, 1, 1,
0.1574916, -0.2039987, 2.557993, 0, 0, 0, 1, 1,
0.1576832, 0.1857167, 0.1095226, 0, 0, 0, 1, 1,
0.1639994, -1.464454, 1.760809, 0, 0, 0, 1, 1,
0.16547, -0.1003344, 3.15444, 1, 1, 1, 1, 1,
0.1666021, -0.2986586, 0.5335459, 1, 1, 1, 1, 1,
0.1681452, -0.2122305, 1.92279, 1, 1, 1, 1, 1,
0.1688696, 1.304737, 0.7617559, 1, 1, 1, 1, 1,
0.1709895, -0.278632, 3.128258, 1, 1, 1, 1, 1,
0.1735725, 1.330119, 0.363938, 1, 1, 1, 1, 1,
0.1758912, 0.5577934, 1.405038, 1, 1, 1, 1, 1,
0.1784784, 0.6524317, -0.2078736, 1, 1, 1, 1, 1,
0.1787515, -0.1594053, 2.8838, 1, 1, 1, 1, 1,
0.1809434, 0.2583868, 0.08907507, 1, 1, 1, 1, 1,
0.1851305, -0.7577055, 2.716864, 1, 1, 1, 1, 1,
0.1856715, 1.392018, 0.9418061, 1, 1, 1, 1, 1,
0.1873012, -1.091609, 3.340234, 1, 1, 1, 1, 1,
0.189451, 0.3835878, 0.2082446, 1, 1, 1, 1, 1,
0.1896646, 1.904083, 1.959082, 1, 1, 1, 1, 1,
0.1924399, 0.8860567, -0.144394, 0, 0, 1, 1, 1,
0.1967423, -2.331136, 2.539109, 1, 0, 0, 1, 1,
0.1971854, 0.2694457, 0.7383147, 1, 0, 0, 1, 1,
0.198283, -0.7795315, 1.405535, 1, 0, 0, 1, 1,
0.2042466, -1.763754, 1.613784, 1, 0, 0, 1, 1,
0.2047234, 0.1004741, 0.16039, 1, 0, 0, 1, 1,
0.2062881, 1.271174, 0.5020627, 0, 0, 0, 1, 1,
0.2075541, -2.442611, 3.441125, 0, 0, 0, 1, 1,
0.2103405, -0.0880122, 1.772004, 0, 0, 0, 1, 1,
0.2114014, -1.374906, 1.304019, 0, 0, 0, 1, 1,
0.2126166, 0.7482862, 1.185141, 0, 0, 0, 1, 1,
0.2154028, -1.124797, 4.189925, 0, 0, 0, 1, 1,
0.2166936, -0.511578, 2.858641, 0, 0, 0, 1, 1,
0.2205436, -3.082683, 2.598574, 1, 1, 1, 1, 1,
0.2213046, -0.8690709, 2.942197, 1, 1, 1, 1, 1,
0.2228804, -1.176386, 5.313391, 1, 1, 1, 1, 1,
0.2284723, 1.665719, -1.026938, 1, 1, 1, 1, 1,
0.2299061, -0.3560046, 2.755554, 1, 1, 1, 1, 1,
0.2336427, 0.4409431, 0.9576697, 1, 1, 1, 1, 1,
0.233859, 1.141489, -0.7147639, 1, 1, 1, 1, 1,
0.2352307, -0.8129705, 4.379092, 1, 1, 1, 1, 1,
0.2367744, 2.368745, -1.740796, 1, 1, 1, 1, 1,
0.237417, 1.535938, -0.1862834, 1, 1, 1, 1, 1,
0.2466026, -0.462939, 2.203774, 1, 1, 1, 1, 1,
0.2475259, -0.3926747, 1.752338, 1, 1, 1, 1, 1,
0.248561, -1.756986, 4.487561, 1, 1, 1, 1, 1,
0.2515306, -0.7146556, 1.597354, 1, 1, 1, 1, 1,
0.2518265, -0.7773343, 3.670882, 1, 1, 1, 1, 1,
0.2519652, 0.3428932, 0.1272016, 0, 0, 1, 1, 1,
0.2586544, -0.02501006, 2.21701, 1, 0, 0, 1, 1,
0.259078, 0.8061901, 1.528195, 1, 0, 0, 1, 1,
0.2627162, -0.4897879, 2.022667, 1, 0, 0, 1, 1,
0.2627497, -1.255017, 1.988288, 1, 0, 0, 1, 1,
0.2669564, -1.159386, 1.93167, 1, 0, 0, 1, 1,
0.2694928, 0.8573559, -1.097452, 0, 0, 0, 1, 1,
0.2720864, -0.4048618, 3.513251, 0, 0, 0, 1, 1,
0.2736319, 0.4318547, 2.55676, 0, 0, 0, 1, 1,
0.2749276, -2.212933, 2.606673, 0, 0, 0, 1, 1,
0.2773433, -1.097298, 2.226002, 0, 0, 0, 1, 1,
0.2784182, -0.4685642, 3.318272, 0, 0, 0, 1, 1,
0.2826966, 1.126038, -0.2881894, 0, 0, 0, 1, 1,
0.2913862, 1.198734, -0.0627224, 1, 1, 1, 1, 1,
0.2941386, -0.330065, 2.030183, 1, 1, 1, 1, 1,
0.2943034, -0.3285783, 3.021697, 1, 1, 1, 1, 1,
0.2961301, 0.9479693, -1.476262, 1, 1, 1, 1, 1,
0.2969506, 1.975621, 1.315058, 1, 1, 1, 1, 1,
0.2993951, -0.1151034, 2.057128, 1, 1, 1, 1, 1,
0.3059227, 1.949586, 0.1368886, 1, 1, 1, 1, 1,
0.3100943, -0.9195606, 0.7490295, 1, 1, 1, 1, 1,
0.3168668, 1.170584, -0.1875424, 1, 1, 1, 1, 1,
0.3255977, 1.448698, 0.8703779, 1, 1, 1, 1, 1,
0.3268185, -0.6191703, 3.22434, 1, 1, 1, 1, 1,
0.3345933, 1.077158, 1.238594, 1, 1, 1, 1, 1,
0.3356462, -1.14118, 3.785274, 1, 1, 1, 1, 1,
0.3366839, -0.5874066, 1.887676, 1, 1, 1, 1, 1,
0.3403804, -0.1970943, 1.703375, 1, 1, 1, 1, 1,
0.3404045, -1.573454, 3.873593, 0, 0, 1, 1, 1,
0.3419464, -1.261595, 3.285712, 1, 0, 0, 1, 1,
0.3474732, 1.342445, 0.7442431, 1, 0, 0, 1, 1,
0.3486815, 0.39808, 0.5068725, 1, 0, 0, 1, 1,
0.3529709, -2.322183, 1.854356, 1, 0, 0, 1, 1,
0.3558497, -1.404364, 1.564116, 1, 0, 0, 1, 1,
0.3586528, 0.2153744, 0.1854782, 0, 0, 0, 1, 1,
0.3595676, -0.04804684, 1.436659, 0, 0, 0, 1, 1,
0.3597985, -0.4802395, 2.693068, 0, 0, 0, 1, 1,
0.3622776, -0.4210593, 3.273885, 0, 0, 0, 1, 1,
0.3623172, -1.002255, 1.814621, 0, 0, 0, 1, 1,
0.3650102, -0.1298319, 2.53463, 0, 0, 0, 1, 1,
0.3657699, -0.364794, 2.463949, 0, 0, 0, 1, 1,
0.3667438, 0.03342903, 0.9586983, 1, 1, 1, 1, 1,
0.3714009, -0.2904143, 2.275646, 1, 1, 1, 1, 1,
0.3720276, -0.1499721, 1.276496, 1, 1, 1, 1, 1,
0.3729842, -0.02987703, 2.205, 1, 1, 1, 1, 1,
0.3748811, 0.116149, 0.9899192, 1, 1, 1, 1, 1,
0.378443, -0.1285743, 0.4160592, 1, 1, 1, 1, 1,
0.3826373, -0.4212733, 2.866493, 1, 1, 1, 1, 1,
0.3832031, -0.2225146, 2.529643, 1, 1, 1, 1, 1,
0.384836, 0.1772034, -0.2424988, 1, 1, 1, 1, 1,
0.3903206, -0.3121325, 3.80095, 1, 1, 1, 1, 1,
0.3984574, -1.699318, 3.408098, 1, 1, 1, 1, 1,
0.4017991, 1.679373, -0.01839458, 1, 1, 1, 1, 1,
0.4022161, -0.235545, 2.492195, 1, 1, 1, 1, 1,
0.4055573, 0.2091937, 0.7041432, 1, 1, 1, 1, 1,
0.4073532, 1.544372, 2.557745, 1, 1, 1, 1, 1,
0.4076695, -0.1687826, 1.598576, 0, 0, 1, 1, 1,
0.4086879, 1.161335, 1.436402, 1, 0, 0, 1, 1,
0.4102219, 0.1333415, 0.920746, 1, 0, 0, 1, 1,
0.4127425, -0.5556972, 2.907425, 1, 0, 0, 1, 1,
0.4128526, -1.033113, 3.222004, 1, 0, 0, 1, 1,
0.4134884, -0.7872183, 1.983508, 1, 0, 0, 1, 1,
0.4153659, -0.5635335, 1.976254, 0, 0, 0, 1, 1,
0.4167119, 0.6125262, 0.1670335, 0, 0, 0, 1, 1,
0.4171704, 0.3802857, -0.5391795, 0, 0, 0, 1, 1,
0.4172944, 0.111138, 1.631159, 0, 0, 0, 1, 1,
0.4246218, -0.4156763, 2.560782, 0, 0, 0, 1, 1,
0.4273934, 0.5604622, 2.460602, 0, 0, 0, 1, 1,
0.4277354, -0.4276066, 3.207242, 0, 0, 0, 1, 1,
0.4288799, -0.3569244, 1.402493, 1, 1, 1, 1, 1,
0.4309397, 0.5068001, 1.253145, 1, 1, 1, 1, 1,
0.4317425, -0.4530024, 2.46872, 1, 1, 1, 1, 1,
0.4323644, 0.3378055, 0.1959492, 1, 1, 1, 1, 1,
0.4323746, -0.4864421, 1.688833, 1, 1, 1, 1, 1,
0.4382366, 0.3981875, 1.214916, 1, 1, 1, 1, 1,
0.4452896, 0.07817774, 2.585063, 1, 1, 1, 1, 1,
0.4472887, 1.445837, 0.5421245, 1, 1, 1, 1, 1,
0.4576975, 1.128215, 1.53805, 1, 1, 1, 1, 1,
0.4612577, -2.673699, 4.672555, 1, 1, 1, 1, 1,
0.4635724, 0.04124428, -0.3236265, 1, 1, 1, 1, 1,
0.4636495, 0.9630537, 0.327261, 1, 1, 1, 1, 1,
0.4680107, -0.5706238, 4.373447, 1, 1, 1, 1, 1,
0.4708738, 0.2716117, 1.767608, 1, 1, 1, 1, 1,
0.4734356, 0.009515941, 2.36299, 1, 1, 1, 1, 1,
0.4746555, -0.4136045, 3.995805, 0, 0, 1, 1, 1,
0.4746705, 1.824874, -0.09815186, 1, 0, 0, 1, 1,
0.4823457, -0.47084, 1.930117, 1, 0, 0, 1, 1,
0.4825499, 0.7999184, 0.9140069, 1, 0, 0, 1, 1,
0.4836431, -1.340363, 3.037087, 1, 0, 0, 1, 1,
0.4846413, -1.415311, 2.775845, 1, 0, 0, 1, 1,
0.486946, -0.2672618, 1.997092, 0, 0, 0, 1, 1,
0.4909258, -0.3537762, 2.811777, 0, 0, 0, 1, 1,
0.494765, 1.429472, -0.1858745, 0, 0, 0, 1, 1,
0.4959107, -0.1410385, 2.122569, 0, 0, 0, 1, 1,
0.4975905, 0.7226816, 0.2530167, 0, 0, 0, 1, 1,
0.4993869, -0.4548269, 3.388607, 0, 0, 0, 1, 1,
0.4995749, -1.565327, 2.482402, 0, 0, 0, 1, 1,
0.5002686, 1.374785, 0.4779537, 1, 1, 1, 1, 1,
0.5003363, 1.206831, -0.1593, 1, 1, 1, 1, 1,
0.500571, 0.6005111, 0.5611566, 1, 1, 1, 1, 1,
0.502489, -1.135478, 4.162424, 1, 1, 1, 1, 1,
0.5035542, 0.3973663, -1.028457, 1, 1, 1, 1, 1,
0.5066925, -0.3955297, 1.947383, 1, 1, 1, 1, 1,
0.5071369, -0.5067583, 3.552784, 1, 1, 1, 1, 1,
0.5107821, -0.7148963, 3.274451, 1, 1, 1, 1, 1,
0.5118551, 2.891456, -1.477319, 1, 1, 1, 1, 1,
0.5124108, 0.8889294, -0.07676082, 1, 1, 1, 1, 1,
0.5132031, -0.08166365, 2.670568, 1, 1, 1, 1, 1,
0.513646, -0.4545128, 2.679982, 1, 1, 1, 1, 1,
0.5161524, -1.83974, 3.487108, 1, 1, 1, 1, 1,
0.5210543, -0.3629594, 3.657336, 1, 1, 1, 1, 1,
0.5229367, -1.366575, 1.336929, 1, 1, 1, 1, 1,
0.5232661, 0.4626206, 1.094771, 0, 0, 1, 1, 1,
0.5245323, 1.261268, 1.132223, 1, 0, 0, 1, 1,
0.5286241, 0.1074256, 1.431917, 1, 0, 0, 1, 1,
0.5332687, 0.7537528, 1.439019, 1, 0, 0, 1, 1,
0.5349613, 0.2067773, 1.043042, 1, 0, 0, 1, 1,
0.5358976, 1.243665, 0.26712, 1, 0, 0, 1, 1,
0.5362329, -1.189787, 1.919758, 0, 0, 0, 1, 1,
0.5464673, -1.80066, 4.827559, 0, 0, 0, 1, 1,
0.5477948, -0.5089559, 2.805071, 0, 0, 0, 1, 1,
0.5504468, -0.5347129, 1.869634, 0, 0, 0, 1, 1,
0.5510737, -1.928653, 4.271528, 0, 0, 0, 1, 1,
0.5560856, -0.787831, 3.473344, 0, 0, 0, 1, 1,
0.5578009, -0.8450015, 2.871031, 0, 0, 0, 1, 1,
0.5632848, -0.2116743, 1.582634, 1, 1, 1, 1, 1,
0.5634652, -1.049749, 3.321078, 1, 1, 1, 1, 1,
0.5794176, 0.04715089, 1.348522, 1, 1, 1, 1, 1,
0.5838596, -0.559326, 2.278642, 1, 1, 1, 1, 1,
0.5864534, 0.8370857, 0.0002403032, 1, 1, 1, 1, 1,
0.5873874, 1.173047, 0.1087469, 1, 1, 1, 1, 1,
0.5883, 0.07791501, 0.3466254, 1, 1, 1, 1, 1,
0.6012169, 0.07035723, 1.68462, 1, 1, 1, 1, 1,
0.6019241, 0.5758701, 1.516743, 1, 1, 1, 1, 1,
0.6036637, -1.884966, 3.234434, 1, 1, 1, 1, 1,
0.606866, 0.3510047, -0.06938058, 1, 1, 1, 1, 1,
0.6131011, -0.2893248, 1.103131, 1, 1, 1, 1, 1,
0.6148089, -0.287414, 1.510244, 1, 1, 1, 1, 1,
0.6160961, -0.5605541, 1.495407, 1, 1, 1, 1, 1,
0.6181187, 1.070324, 0.7145549, 1, 1, 1, 1, 1,
0.6188086, 0.7918755, 0.1684799, 0, 0, 1, 1, 1,
0.6288617, 1.392815, 0.01048836, 1, 0, 0, 1, 1,
0.6312374, 3.691614, -0.1428327, 1, 0, 0, 1, 1,
0.6345468, -0.7067754, 1.662698, 1, 0, 0, 1, 1,
0.6358568, -0.1481131, 1.721418, 1, 0, 0, 1, 1,
0.6360389, -0.8226411, 2.426229, 1, 0, 0, 1, 1,
0.6380718, -2.736904, 2.777815, 0, 0, 0, 1, 1,
0.6413583, 1.774597, -0.5368138, 0, 0, 0, 1, 1,
0.6413759, -1.146113, 4.049588, 0, 0, 0, 1, 1,
0.6581604, -0.7646508, 3.476087, 0, 0, 0, 1, 1,
0.6637639, -0.6536738, 1.956383, 0, 0, 0, 1, 1,
0.6638319, 0.2079632, 3.196148, 0, 0, 0, 1, 1,
0.6640571, -1.196302, 3.152534, 0, 0, 0, 1, 1,
0.6666562, -0.7248646, 4.021449, 1, 1, 1, 1, 1,
0.6722728, -0.2397449, 1.804259, 1, 1, 1, 1, 1,
0.6834882, -1.912125, 3.429431, 1, 1, 1, 1, 1,
0.6861949, 1.676734, -0.266872, 1, 1, 1, 1, 1,
0.6862307, 0.1717337, 1.141236, 1, 1, 1, 1, 1,
0.6881472, 0.003110962, 0.4893401, 1, 1, 1, 1, 1,
0.6928003, -0.0009374085, 1.612022, 1, 1, 1, 1, 1,
0.6948331, 1.494653, 0.5678465, 1, 1, 1, 1, 1,
0.6980391, -0.08394948, 3.171671, 1, 1, 1, 1, 1,
0.6987166, 1.301689, 0.7412481, 1, 1, 1, 1, 1,
0.6989614, 0.02480321, 2.791625, 1, 1, 1, 1, 1,
0.6997632, 0.6829304, 1.122228, 1, 1, 1, 1, 1,
0.7000051, -0.7110054, 1.866814, 1, 1, 1, 1, 1,
0.7015228, 0.8392704, 1.57135, 1, 1, 1, 1, 1,
0.7060793, 0.8328053, 0.9897826, 1, 1, 1, 1, 1,
0.7071208, 0.5281837, 1.166589, 0, 0, 1, 1, 1,
0.7145764, 0.6095091, 0.5752012, 1, 0, 0, 1, 1,
0.7185397, 0.9359261, 1.250184, 1, 0, 0, 1, 1,
0.7212797, 0.2265859, 3.153242, 1, 0, 0, 1, 1,
0.7250241, -0.4506011, 2.76893, 1, 0, 0, 1, 1,
0.7304124, -0.6217324, 2.414085, 1, 0, 0, 1, 1,
0.7315837, -0.19676, 2.21613, 0, 0, 0, 1, 1,
0.738476, -0.4346263, 1.902714, 0, 0, 0, 1, 1,
0.7386097, -0.3344798, 1.951847, 0, 0, 0, 1, 1,
0.7445714, -0.8649688, 0.8146561, 0, 0, 0, 1, 1,
0.7499332, -0.08009722, 1.702067, 0, 0, 0, 1, 1,
0.7499391, 0.03919513, 2.081221, 0, 0, 0, 1, 1,
0.7575323, 0.5185099, 1.108259, 0, 0, 0, 1, 1,
0.7579569, -1.738875, 3.11716, 1, 1, 1, 1, 1,
0.7590439, -0.009796373, 2.393486, 1, 1, 1, 1, 1,
0.7598936, 0.3416868, 0.33012, 1, 1, 1, 1, 1,
0.7648649, -1.132003, 2.556249, 1, 1, 1, 1, 1,
0.7682849, -1.065905, 2.826025, 1, 1, 1, 1, 1,
0.7688636, 0.01970168, 2.031197, 1, 1, 1, 1, 1,
0.7726279, 1.498749, 1.573396, 1, 1, 1, 1, 1,
0.7768869, -0.8743174, 2.45654, 1, 1, 1, 1, 1,
0.7783365, -0.7500635, 0.6537995, 1, 1, 1, 1, 1,
0.7831751, 1.151828, 2.404831, 1, 1, 1, 1, 1,
0.7835184, 1.265139, 0.5463635, 1, 1, 1, 1, 1,
0.783558, 1.230439, 0.8209197, 1, 1, 1, 1, 1,
0.7865161, 0.05827141, 0.4244798, 1, 1, 1, 1, 1,
0.7892846, -1.051871, 4.232344, 1, 1, 1, 1, 1,
0.7907465, -0.03408436, 0.6573987, 1, 1, 1, 1, 1,
0.7934983, 0.3092903, 0.2389509, 0, 0, 1, 1, 1,
0.7955032, -2.192232, 2.209497, 1, 0, 0, 1, 1,
0.7986877, 0.6279553, -0.2585124, 1, 0, 0, 1, 1,
0.8046765, -0.9383118, 1.822789, 1, 0, 0, 1, 1,
0.806434, -0.6319685, 2.31732, 1, 0, 0, 1, 1,
0.8088263, 0.250049, 2.103639, 1, 0, 0, 1, 1,
0.812463, -0.002433314, 1.466692, 0, 0, 0, 1, 1,
0.8159521, -0.0718932, 2.366001, 0, 0, 0, 1, 1,
0.8166869, -0.9276204, 1.551542, 0, 0, 0, 1, 1,
0.8271921, -0.1396549, 1.428352, 0, 0, 0, 1, 1,
0.8303378, 0.04171958, 2.13504, 0, 0, 0, 1, 1,
0.8342095, -0.09043478, 1.884567, 0, 0, 0, 1, 1,
0.8367071, -1.297074, 1.423742, 0, 0, 0, 1, 1,
0.8374808, -1.21971, 3.205025, 1, 1, 1, 1, 1,
0.8385183, -1.268709, 3.211504, 1, 1, 1, 1, 1,
0.838818, -0.5271098, 0.7857705, 1, 1, 1, 1, 1,
0.8424322, 0.2930993, 1.810287, 1, 1, 1, 1, 1,
0.8489094, -0.1225542, 2.710826, 1, 1, 1, 1, 1,
0.8557821, 0.5801569, 1.004906, 1, 1, 1, 1, 1,
0.8620259, 0.6615483, 1.206091, 1, 1, 1, 1, 1,
0.8632612, -0.1148222, 3.034224, 1, 1, 1, 1, 1,
0.863681, 1.022914, 0.000943939, 1, 1, 1, 1, 1,
0.8709195, -0.6527604, 1.382688, 1, 1, 1, 1, 1,
0.8739911, 0.687227, -1.121206, 1, 1, 1, 1, 1,
0.8750613, 0.3650945, -0.378751, 1, 1, 1, 1, 1,
0.877821, 1.04715, 2.229078, 1, 1, 1, 1, 1,
0.877932, -0.8875162, 2.862675, 1, 1, 1, 1, 1,
0.8859207, -0.713613, 1.947583, 1, 1, 1, 1, 1,
0.8864026, -0.06325849, 0.5664932, 0, 0, 1, 1, 1,
0.8864431, 0.2200608, -0.7405787, 1, 0, 0, 1, 1,
0.8890657, -0.2919164, 1.93997, 1, 0, 0, 1, 1,
0.8908914, -1.226495, 2.150944, 1, 0, 0, 1, 1,
0.895379, 2.114778, 0.4688438, 1, 0, 0, 1, 1,
0.896253, -0.684242, 0.605572, 1, 0, 0, 1, 1,
0.8984841, 1.613759, 1.366237, 0, 0, 0, 1, 1,
0.9034166, 0.4373359, 0.6082894, 0, 0, 0, 1, 1,
0.9074217, -0.7059898, 1.977915, 0, 0, 0, 1, 1,
0.9092245, -1.960548, 1.648049, 0, 0, 0, 1, 1,
0.9191012, 0.4169165, 2.077364, 0, 0, 0, 1, 1,
0.9231419, 1.222711, 1.628643, 0, 0, 0, 1, 1,
0.9234604, -0.2860517, 3.608356, 0, 0, 0, 1, 1,
0.9287001, -0.7427595, 1.398217, 1, 1, 1, 1, 1,
0.9319388, 0.2546483, 1.834777, 1, 1, 1, 1, 1,
0.9332257, 0.2483375, 0.7134888, 1, 1, 1, 1, 1,
0.9482294, -1.575006, 1.342656, 1, 1, 1, 1, 1,
0.9560556, -0.5041724, 1.296516, 1, 1, 1, 1, 1,
0.9567979, 0.7890039, 1.109691, 1, 1, 1, 1, 1,
0.9744284, 0.8518276, 0.3086182, 1, 1, 1, 1, 1,
0.9757934, -0.040989, -1.196997, 1, 1, 1, 1, 1,
0.9777128, 2.225569, -0.209335, 1, 1, 1, 1, 1,
0.9809275, 1.29689, 2.792439, 1, 1, 1, 1, 1,
0.985384, 0.3978222, 2.632577, 1, 1, 1, 1, 1,
0.9868048, -0.3547596, 2.078884, 1, 1, 1, 1, 1,
0.9885314, -0.1032775, 1.297197, 1, 1, 1, 1, 1,
0.992332, 0.3619895, 0.2952408, 1, 1, 1, 1, 1,
0.993421, -1.050065, 0.8350055, 1, 1, 1, 1, 1,
0.9976162, 1.220855, -0.07159518, 0, 0, 1, 1, 1,
1.000515, 0.6197776, 1.973816, 1, 0, 0, 1, 1,
1.000623, -0.8526616, 1.389785, 1, 0, 0, 1, 1,
1.01308, -0.09259251, 2.297819, 1, 0, 0, 1, 1,
1.019072, 0.09576989, 2.755979, 1, 0, 0, 1, 1,
1.022666, 0.8538827, 0.5328321, 1, 0, 0, 1, 1,
1.024802, -0.2472353, 0.5336875, 0, 0, 0, 1, 1,
1.025916, -0.4089443, -0.03005408, 0, 0, 0, 1, 1,
1.026646, 1.175512, 0.7932561, 0, 0, 0, 1, 1,
1.029701, 0.5070732, 0.8220029, 0, 0, 0, 1, 1,
1.030711, -0.05834492, 3.325985, 0, 0, 0, 1, 1,
1.039863, 1.485563, -1.470357, 0, 0, 0, 1, 1,
1.046623, 1.158587, 0.2936217, 0, 0, 0, 1, 1,
1.051944, -0.2661189, 0.247735, 1, 1, 1, 1, 1,
1.05329, 1.189442, 1.979478, 1, 1, 1, 1, 1,
1.067072, 0.6574697, 0.1590997, 1, 1, 1, 1, 1,
1.068335, 0.6303766, 0.7585504, 1, 1, 1, 1, 1,
1.076575, -1.607263, 1.465034, 1, 1, 1, 1, 1,
1.076917, -1.965427, 2.210967, 1, 1, 1, 1, 1,
1.07854, -0.3045379, 1.457385, 1, 1, 1, 1, 1,
1.083847, 0.8825486, -0.3491154, 1, 1, 1, 1, 1,
1.085714, 1.048326, 1.827677, 1, 1, 1, 1, 1,
1.092698, 0.05888692, 1.750066, 1, 1, 1, 1, 1,
1.104566, 0.09075527, 0.5991542, 1, 1, 1, 1, 1,
1.104587, 0.852779, 1.942765, 1, 1, 1, 1, 1,
1.104804, -1.189085, 1.029626, 1, 1, 1, 1, 1,
1.107407, -0.5263048, 2.679381, 1, 1, 1, 1, 1,
1.109488, 0.877936, 1.024693, 1, 1, 1, 1, 1,
1.109521, -0.4856988, 2.023648, 0, 0, 1, 1, 1,
1.114319, 1.022413, 1.62847, 1, 0, 0, 1, 1,
1.121822, 2.026134, -0.2353049, 1, 0, 0, 1, 1,
1.122619, -1.514149, 2.880025, 1, 0, 0, 1, 1,
1.124496, -0.8629546, 0.4538188, 1, 0, 0, 1, 1,
1.135638, -0.8743067, 2.219494, 1, 0, 0, 1, 1,
1.137529, -0.8415847, 1.960548, 0, 0, 0, 1, 1,
1.138097, 0.4554436, 1.370462, 0, 0, 0, 1, 1,
1.141814, 0.787064, 1.057842, 0, 0, 0, 1, 1,
1.158504, 0.337692, 3.553881, 0, 0, 0, 1, 1,
1.168469, -0.5428382, 2.631582, 0, 0, 0, 1, 1,
1.172077, 0.5239539, -0.4851575, 0, 0, 0, 1, 1,
1.173365, -0.9812401, 2.047404, 0, 0, 0, 1, 1,
1.182991, -1.334363, 2.930966, 1, 1, 1, 1, 1,
1.183945, 0.3788155, 0.9239262, 1, 1, 1, 1, 1,
1.188274, 0.07270864, 1.685223, 1, 1, 1, 1, 1,
1.191048, 0.3920635, 1.109685, 1, 1, 1, 1, 1,
1.210186, 1.633653, 1.235577, 1, 1, 1, 1, 1,
1.210205, -0.1596559, 1.17658, 1, 1, 1, 1, 1,
1.213631, -0.1819033, 1.291217, 1, 1, 1, 1, 1,
1.222234, -1.224904, 1.432145, 1, 1, 1, 1, 1,
1.223524, -0.2947919, 1.52723, 1, 1, 1, 1, 1,
1.233083, 0.3990097, 0.2246246, 1, 1, 1, 1, 1,
1.236775, -0.327378, 0.7526593, 1, 1, 1, 1, 1,
1.238333, 2.126564, -0.5672044, 1, 1, 1, 1, 1,
1.242758, -1.2204, 2.22555, 1, 1, 1, 1, 1,
1.24404, -1.083558, 3.2811, 1, 1, 1, 1, 1,
1.248373, 1.781216, 1.772451, 1, 1, 1, 1, 1,
1.250524, 0.651888, -0.1806842, 0, 0, 1, 1, 1,
1.251162, -0.3660737, -0.2892535, 1, 0, 0, 1, 1,
1.257491, -0.2895228, 1.389906, 1, 0, 0, 1, 1,
1.258656, -0.1614365, 1.251435, 1, 0, 0, 1, 1,
1.266549, -0.6455836, 2.115761, 1, 0, 0, 1, 1,
1.274505, -0.1060821, 1.690618, 1, 0, 0, 1, 1,
1.275004, 0.7138832, 0.4633665, 0, 0, 0, 1, 1,
1.275543, 1.161526, 0.4219567, 0, 0, 0, 1, 1,
1.278674, 0.4298829, 0.918689, 0, 0, 0, 1, 1,
1.279651, -0.4728405, -0.06903262, 0, 0, 0, 1, 1,
1.282545, 0.1264019, 1.339979, 0, 0, 0, 1, 1,
1.283288, -0.008962367, 3.470734, 0, 0, 0, 1, 1,
1.289188, 0.420046, -0.3791078, 0, 0, 0, 1, 1,
1.295627, 0.4133708, -0.0905467, 1, 1, 1, 1, 1,
1.316028, 0.953784, -1.966051, 1, 1, 1, 1, 1,
1.32062, 0.2858464, 0.8783002, 1, 1, 1, 1, 1,
1.328021, -2.614118, 2.805485, 1, 1, 1, 1, 1,
1.329261, -1.579895, 1.833034, 1, 1, 1, 1, 1,
1.332507, -0.2499954, 1.813192, 1, 1, 1, 1, 1,
1.343488, -1.401271, 4.975512, 1, 1, 1, 1, 1,
1.358413, 0.3058039, -0.6602758, 1, 1, 1, 1, 1,
1.369985, 0.9737456, 2.442312, 1, 1, 1, 1, 1,
1.376072, -1.232154, 3.367832, 1, 1, 1, 1, 1,
1.376167, -0.3358932, 2.73361, 1, 1, 1, 1, 1,
1.380096, -0.9748342, 1.313979, 1, 1, 1, 1, 1,
1.384522, 0.1541364, 1.494646, 1, 1, 1, 1, 1,
1.393536, -0.7286878, 2.890966, 1, 1, 1, 1, 1,
1.395647, -1.350728, 2.869316, 1, 1, 1, 1, 1,
1.445271, -1.056373, 1.781781, 0, 0, 1, 1, 1,
1.451816, -0.8126978, 3.16817, 1, 0, 0, 1, 1,
1.463563, 0.1713217, 1.337453, 1, 0, 0, 1, 1,
1.475282, -1.463737, 0.8670546, 1, 0, 0, 1, 1,
1.493485, -1.953656, 4.023196, 1, 0, 0, 1, 1,
1.497902, -1.162397, 2.159477, 1, 0, 0, 1, 1,
1.49813, -0.8250841, 1.716832, 0, 0, 0, 1, 1,
1.506263, -0.7521489, 2.088187, 0, 0, 0, 1, 1,
1.506661, 0.6393133, 0.4757639, 0, 0, 0, 1, 1,
1.507337, 0.1955129, 0.3803479, 0, 0, 0, 1, 1,
1.507687, 0.07309332, 0.1252358, 0, 0, 0, 1, 1,
1.51672, 0.4038294, 0.8560563, 0, 0, 0, 1, 1,
1.532501, -0.7361765, 2.846468, 0, 0, 0, 1, 1,
1.543931, 0.9965415, 1.704621, 1, 1, 1, 1, 1,
1.544896, -1.153787, 3.374278, 1, 1, 1, 1, 1,
1.561536, -0.3402516, 2.909911, 1, 1, 1, 1, 1,
1.564331, -0.2583985, 0.005309994, 1, 1, 1, 1, 1,
1.569042, -1.078153, 0.4291941, 1, 1, 1, 1, 1,
1.578416, -1.274772, 1.025557, 1, 1, 1, 1, 1,
1.589654, -1.00472, 2.652634, 1, 1, 1, 1, 1,
1.591666, 1.962073, 0.8424394, 1, 1, 1, 1, 1,
1.609184, -0.9651071, 1.579863, 1, 1, 1, 1, 1,
1.6124, 0.5020901, 1.103291, 1, 1, 1, 1, 1,
1.633165, -0.1049332, 1.187312, 1, 1, 1, 1, 1,
1.638462, -1.749131, 3.251068, 1, 1, 1, 1, 1,
1.644272, 0.005292472, 1.470555, 1, 1, 1, 1, 1,
1.647036, -0.8803715, 1.923873, 1, 1, 1, 1, 1,
1.655286, -1.068685, 1.922568, 1, 1, 1, 1, 1,
1.65695, 1.37202, -0.1239531, 0, 0, 1, 1, 1,
1.670961, 0.3192468, 1.700385, 1, 0, 0, 1, 1,
1.674827, 0.5998481, 1.421536, 1, 0, 0, 1, 1,
1.681477, 1.174677, 0.9116975, 1, 0, 0, 1, 1,
1.692646, 0.239011, -0.4213413, 1, 0, 0, 1, 1,
1.693915, 1.074522, 2.143908, 1, 0, 0, 1, 1,
1.71275, -0.1524193, 2.547937, 0, 0, 0, 1, 1,
1.7217, 1.139792, 0.6276594, 0, 0, 0, 1, 1,
1.730266, -0.6655714, 1.648346, 0, 0, 0, 1, 1,
1.737036, -0.392615, 2.159218, 0, 0, 0, 1, 1,
1.76696, -0.1206033, 1.601009, 0, 0, 0, 1, 1,
1.776102, -2.858114, 1.946138, 0, 0, 0, 1, 1,
1.782365, 0.2996964, 2.428437, 0, 0, 0, 1, 1,
1.804455, 0.2922316, 1.250285, 1, 1, 1, 1, 1,
1.80791, -1.13096, 1.951565, 1, 1, 1, 1, 1,
1.813282, 0.1859698, 2.905085, 1, 1, 1, 1, 1,
1.847404, -0.9877397, 1.649181, 1, 1, 1, 1, 1,
1.856426, -1.927178, 4.513191, 1, 1, 1, 1, 1,
1.856631, 0.007930537, -1.355522, 1, 1, 1, 1, 1,
1.857685, -0.346636, 1.139317, 1, 1, 1, 1, 1,
1.901662, 1.168995, -0.2306848, 1, 1, 1, 1, 1,
1.92755, -0.9187112, 1.315992, 1, 1, 1, 1, 1,
1.970278, -0.3489982, 0.00822232, 1, 1, 1, 1, 1,
2.005863, 0.9564564, -0.3300647, 1, 1, 1, 1, 1,
2.02251, 1.71433, 0.7816125, 1, 1, 1, 1, 1,
2.022872, -0.2153603, 1.251763, 1, 1, 1, 1, 1,
2.030582, -0.5580019, 2.360222, 1, 1, 1, 1, 1,
2.054163, 0.4355949, 0.6570503, 1, 1, 1, 1, 1,
2.077941, -0.688163, 2.941411, 0, 0, 1, 1, 1,
2.078769, -0.5347843, 0.915291, 1, 0, 0, 1, 1,
2.093111, -1.190769, 3.36868, 1, 0, 0, 1, 1,
2.127195, -0.5045735, 2.10067, 1, 0, 0, 1, 1,
2.169436, -0.5580692, 3.427538, 1, 0, 0, 1, 1,
2.187946, 1.086974, 1.620947, 1, 0, 0, 1, 1,
2.285278, -0.3744021, 1.739224, 0, 0, 0, 1, 1,
2.303288, -1.374864, 3.893952, 0, 0, 0, 1, 1,
2.34961, -1.484276, 2.366256, 0, 0, 0, 1, 1,
2.441543, 0.7014898, 1.69729, 0, 0, 0, 1, 1,
2.457833, -1.937102, 2.126593, 0, 0, 0, 1, 1,
2.463609, 0.9700451, 1.674912, 0, 0, 0, 1, 1,
2.473153, 1.225175, -0.2325189, 0, 0, 0, 1, 1,
2.498536, 0.9118258, 0.851835, 1, 1, 1, 1, 1,
2.518397, 0.8793919, 0.4569391, 1, 1, 1, 1, 1,
2.622878, -0.1199432, 1.99864, 1, 1, 1, 1, 1,
2.634547, 1.171701, 0.7945606, 1, 1, 1, 1, 1,
2.855911, -0.2695055, 3.095397, 1, 1, 1, 1, 1,
2.890862, -0.2542679, 2.578767, 1, 1, 1, 1, 1,
3.126171, 0.2310161, 0.1438984, 1, 1, 1, 1, 1
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
var radius = 9.488941;
var distance = 33.32951;
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
mvMatrix.translate( -0.00363636, -0.3044655, -0.1351333 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32951);
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
