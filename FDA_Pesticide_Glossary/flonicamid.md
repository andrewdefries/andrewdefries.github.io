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
-3.021962, 2.209133, 0.8953198, 1, 0, 0, 1,
-2.925107, 0.0661492, 0.3219275, 1, 0.007843138, 0, 1,
-2.838325, 1.378953, -1.921864, 1, 0.01176471, 0, 1,
-2.823163, 0.2616238, -3.033397, 1, 0.01960784, 0, 1,
-2.571265, 0.6501043, -1.61264, 1, 0.02352941, 0, 1,
-2.559547, -0.6747725, -2.81555, 1, 0.03137255, 0, 1,
-2.519789, -0.5078915, -3.437456, 1, 0.03529412, 0, 1,
-2.514264, -0.1019214, -2.073745, 1, 0.04313726, 0, 1,
-2.474595, -0.3956461, -2.774514, 1, 0.04705882, 0, 1,
-2.459269, 2.393193, -0.6030491, 1, 0.05490196, 0, 1,
-2.441535, 1.236276, -0.2896177, 1, 0.05882353, 0, 1,
-2.430448, -0.1755102, -2.041843, 1, 0.06666667, 0, 1,
-2.415016, 0.8226658, -0.758334, 1, 0.07058824, 0, 1,
-2.3737, -1.252492, -1.485855, 1, 0.07843138, 0, 1,
-2.277566, -1.309639, -0.8341088, 1, 0.08235294, 0, 1,
-2.213813, 0.09306893, -1.20222, 1, 0.09019608, 0, 1,
-2.191517, -0.01085504, -0.2372192, 1, 0.09411765, 0, 1,
-2.17804, -1.330652, -2.680568, 1, 0.1019608, 0, 1,
-2.131609, -0.5397412, -3.863561, 1, 0.1098039, 0, 1,
-2.124645, -0.8181382, -2.737265, 1, 0.1137255, 0, 1,
-2.085056, 0.419283, -2.441905, 1, 0.1215686, 0, 1,
-2.079508, -0.8164964, -1.909879, 1, 0.1254902, 0, 1,
-2.051951, -0.392573, -1.862403, 1, 0.1333333, 0, 1,
-2.04784, -1.083732, -0.7607405, 1, 0.1372549, 0, 1,
-1.905308, -0.7662032, -1.499052, 1, 0.145098, 0, 1,
-1.888443, -1.089841, -2.020261, 1, 0.1490196, 0, 1,
-1.878448, -1.663717, -2.777091, 1, 0.1568628, 0, 1,
-1.865446, 2.950542, -1.747229, 1, 0.1607843, 0, 1,
-1.864775, -0.5457134, -1.21621, 1, 0.1686275, 0, 1,
-1.863197, 0.02427916, 0.1835192, 1, 0.172549, 0, 1,
-1.862354, -0.6320852, -2.022641, 1, 0.1803922, 0, 1,
-1.807337, -1.307977, -2.545421, 1, 0.1843137, 0, 1,
-1.807179, 0.6309227, 0.3340186, 1, 0.1921569, 0, 1,
-1.7917, -0.0543084, -0.6021264, 1, 0.1960784, 0, 1,
-1.783247, -0.6121176, -1.292069, 1, 0.2039216, 0, 1,
-1.764332, 1.02729, -2.290818, 1, 0.2117647, 0, 1,
-1.755055, -0.0545233, -1.765781, 1, 0.2156863, 0, 1,
-1.739361, 0.08880084, -0.885265, 1, 0.2235294, 0, 1,
-1.735192, -1.106395, -2.373724, 1, 0.227451, 0, 1,
-1.735137, -0.6224884, -2.387205, 1, 0.2352941, 0, 1,
-1.731667, -0.9714259, -1.73172, 1, 0.2392157, 0, 1,
-1.729576, 1.295732, -1.919295, 1, 0.2470588, 0, 1,
-1.72867, 0.0246098, -1.799288, 1, 0.2509804, 0, 1,
-1.717914, -0.3548568, -1.085365, 1, 0.2588235, 0, 1,
-1.697613, -1.761929, -2.934451, 1, 0.2627451, 0, 1,
-1.697499, -0.9641398, -1.469393, 1, 0.2705882, 0, 1,
-1.688427, 0.3852906, -1.74629, 1, 0.2745098, 0, 1,
-1.681385, -0.5498382, -2.637409, 1, 0.282353, 0, 1,
-1.669379, -0.5594748, -0.3597445, 1, 0.2862745, 0, 1,
-1.666754, -1.045292, -1.034312, 1, 0.2941177, 0, 1,
-1.66178, -1.300327, -2.477735, 1, 0.3019608, 0, 1,
-1.661253, 0.3310451, 0.2120254, 1, 0.3058824, 0, 1,
-1.654883, -0.3672575, -1.903794, 1, 0.3137255, 0, 1,
-1.641944, 2.697387, -1.645274, 1, 0.3176471, 0, 1,
-1.613117, -0.1728466, -2.331969, 1, 0.3254902, 0, 1,
-1.60525, 1.467168, -2.127476, 1, 0.3294118, 0, 1,
-1.603859, 1.702159, 0.2718133, 1, 0.3372549, 0, 1,
-1.599264, -1.583691, -2.008996, 1, 0.3411765, 0, 1,
-1.588379, 0.5307285, -1.705633, 1, 0.3490196, 0, 1,
-1.587276, 0.4381759, -0.7055084, 1, 0.3529412, 0, 1,
-1.582622, -0.5635708, -1.842866, 1, 0.3607843, 0, 1,
-1.582499, -1.829082, -0.9714721, 1, 0.3647059, 0, 1,
-1.5817, 0.8046454, -1.358496, 1, 0.372549, 0, 1,
-1.58002, -1.466262, -1.576783, 1, 0.3764706, 0, 1,
-1.571815, 0.1986219, -3.78142, 1, 0.3843137, 0, 1,
-1.554864, -0.4956375, -1.917105, 1, 0.3882353, 0, 1,
-1.55486, -1.162109, -3.10747, 1, 0.3960784, 0, 1,
-1.554142, -0.5912154, 0.135355, 1, 0.4039216, 0, 1,
-1.540961, 1.447176, -1.025114, 1, 0.4078431, 0, 1,
-1.535784, -0.1269619, -2.301906, 1, 0.4156863, 0, 1,
-1.530946, -0.9928614, -0.1172247, 1, 0.4196078, 0, 1,
-1.530622, 1.210313, -1.409685, 1, 0.427451, 0, 1,
-1.508122, 0.8439673, 0.6780463, 1, 0.4313726, 0, 1,
-1.485127, 1.398096, -1.306699, 1, 0.4392157, 0, 1,
-1.484347, 0.02121741, -3.846189, 1, 0.4431373, 0, 1,
-1.479241, 0.4107203, -3.507932, 1, 0.4509804, 0, 1,
-1.47765, 0.9243487, -1.353446, 1, 0.454902, 0, 1,
-1.473047, 0.4988509, -1.478793, 1, 0.4627451, 0, 1,
-1.460755, -0.349261, -0.0769286, 1, 0.4666667, 0, 1,
-1.457908, -0.9240307, -2.085424, 1, 0.4745098, 0, 1,
-1.456135, 0.6867818, -1.259985, 1, 0.4784314, 0, 1,
-1.45529, -0.8964546, -1.655065, 1, 0.4862745, 0, 1,
-1.453744, 1.363819, -2.017599, 1, 0.4901961, 0, 1,
-1.445217, 0.5220277, 2.639064, 1, 0.4980392, 0, 1,
-1.443748, 0.07122723, -2.726123, 1, 0.5058824, 0, 1,
-1.440481, -0.6406139, -2.316856, 1, 0.509804, 0, 1,
-1.436993, -1.562667, 0.296212, 1, 0.5176471, 0, 1,
-1.436195, -1.112668, -1.334372, 1, 0.5215687, 0, 1,
-1.419325, -1.94214, -2.821422, 1, 0.5294118, 0, 1,
-1.41657, 0.7668279, 0.8509951, 1, 0.5333334, 0, 1,
-1.41535, -0.08084135, -0.7457944, 1, 0.5411765, 0, 1,
-1.411983, -1.597085, -0.7693781, 1, 0.5450981, 0, 1,
-1.410656, 0.1089754, -1.482224, 1, 0.5529412, 0, 1,
-1.41047, 1.974941, -1.838354, 1, 0.5568628, 0, 1,
-1.397161, 0.4057809, -2.118373, 1, 0.5647059, 0, 1,
-1.386989, 0.9123641, -0.7864439, 1, 0.5686275, 0, 1,
-1.386622, -0.5296962, -3.569066, 1, 0.5764706, 0, 1,
-1.384362, -0.7357747, -2.682024, 1, 0.5803922, 0, 1,
-1.377062, -1.203882, -4.521413, 1, 0.5882353, 0, 1,
-1.375912, 1.275187, -1.136599, 1, 0.5921569, 0, 1,
-1.369717, 1.339702, -1.17054, 1, 0.6, 0, 1,
-1.361415, -0.162509, -1.886367, 1, 0.6078432, 0, 1,
-1.357442, -0.07195795, -2.178648, 1, 0.6117647, 0, 1,
-1.353849, -0.112861, -1.962511, 1, 0.6196079, 0, 1,
-1.352269, 1.44932, -1.704491, 1, 0.6235294, 0, 1,
-1.346174, -0.4247424, -1.589634, 1, 0.6313726, 0, 1,
-1.344624, -0.2855344, -2.069003, 1, 0.6352941, 0, 1,
-1.339263, 0.09186865, -1.582244, 1, 0.6431373, 0, 1,
-1.336417, 0.8747594, -0.519154, 1, 0.6470588, 0, 1,
-1.332535, 0.0866714, -3.416155, 1, 0.654902, 0, 1,
-1.329184, -1.240145, -3.329407, 1, 0.6588235, 0, 1,
-1.318957, 0.2622449, -1.776267, 1, 0.6666667, 0, 1,
-1.306538, -1.165779, -2.148003, 1, 0.6705883, 0, 1,
-1.301212, 0.9900874, -1.272243, 1, 0.6784314, 0, 1,
-1.285618, 0.205442, -1.658586, 1, 0.682353, 0, 1,
-1.283182, -0.7718926, -3.37972, 1, 0.6901961, 0, 1,
-1.265672, 0.8854312, 1.264678, 1, 0.6941177, 0, 1,
-1.26244, 0.421208, 0.01145895, 1, 0.7019608, 0, 1,
-1.252762, -0.9777645, -2.362414, 1, 0.7098039, 0, 1,
-1.246279, -1.450734, -2.585075, 1, 0.7137255, 0, 1,
-1.232679, -0.4859018, -1.453972, 1, 0.7215686, 0, 1,
-1.229301, 0.1987173, -1.832076, 1, 0.7254902, 0, 1,
-1.224279, 1.810899, -0.4881284, 1, 0.7333333, 0, 1,
-1.216745, 0.3550699, -2.203189, 1, 0.7372549, 0, 1,
-1.213815, 0.9295342, -1.152598, 1, 0.7450981, 0, 1,
-1.204177, 1.146705, -2.081115, 1, 0.7490196, 0, 1,
-1.198094, -2.146775, -2.034514, 1, 0.7568628, 0, 1,
-1.1976, 0.5901007, -0.3098355, 1, 0.7607843, 0, 1,
-1.196356, 0.350475, -0.825756, 1, 0.7686275, 0, 1,
-1.18199, 1.370901, 1.10442, 1, 0.772549, 0, 1,
-1.180972, 0.2326576, -1.707464, 1, 0.7803922, 0, 1,
-1.160834, -1.558922, -2.959854, 1, 0.7843137, 0, 1,
-1.160299, -0.7388531, -0.1244841, 1, 0.7921569, 0, 1,
-1.154082, 0.8031775, -2.512768, 1, 0.7960784, 0, 1,
-1.146377, -0.1185032, -3.35451, 1, 0.8039216, 0, 1,
-1.145256, -0.1557375, -1.19762, 1, 0.8117647, 0, 1,
-1.140229, -0.924698, -2.382708, 1, 0.8156863, 0, 1,
-1.140112, -1.287517, -1.560193, 1, 0.8235294, 0, 1,
-1.136729, -1.106358, -4.341681, 1, 0.827451, 0, 1,
-1.135435, 0.764401, 0.9085904, 1, 0.8352941, 0, 1,
-1.127339, 0.1795154, -2.53464, 1, 0.8392157, 0, 1,
-1.121455, -0.6905899, -2.964037, 1, 0.8470588, 0, 1,
-1.111062, 0.2828907, -1.239165, 1, 0.8509804, 0, 1,
-1.103453, -0.1526098, -1.691556, 1, 0.8588235, 0, 1,
-1.102823, 2.12019, 0.090599, 1, 0.8627451, 0, 1,
-1.096413, 0.08526506, -0.3011051, 1, 0.8705882, 0, 1,
-1.093085, -0.1313307, -1.349185, 1, 0.8745098, 0, 1,
-1.083495, 0.7852231, -0.1067662, 1, 0.8823529, 0, 1,
-1.080337, -0.8646373, -1.810458, 1, 0.8862745, 0, 1,
-1.077978, -0.46861, -1.90485, 1, 0.8941177, 0, 1,
-1.074602, 1.715335, -1.257962, 1, 0.8980392, 0, 1,
-1.074431, 0.2704634, -3.264919, 1, 0.9058824, 0, 1,
-1.073487, 1.900153, -0.9201182, 1, 0.9137255, 0, 1,
-1.068915, -0.3113821, -1.31627, 1, 0.9176471, 0, 1,
-1.067692, -1.562114, -1.62468, 1, 0.9254902, 0, 1,
-1.063389, 1.057985, -0.7780616, 1, 0.9294118, 0, 1,
-1.061634, 0.05209268, 0.6556862, 1, 0.9372549, 0, 1,
-1.058152, -0.03827315, -2.671145, 1, 0.9411765, 0, 1,
-1.054052, -0.4222333, -1.273202, 1, 0.9490196, 0, 1,
-1.051453, 0.4023378, -1.799991, 1, 0.9529412, 0, 1,
-1.048206, -0.9600088, -1.600369, 1, 0.9607843, 0, 1,
-1.047479, -1.778681, -3.085357, 1, 0.9647059, 0, 1,
-1.042828, 0.1959541, -0.7065674, 1, 0.972549, 0, 1,
-1.038168, -0.9234966, -3.21359, 1, 0.9764706, 0, 1,
-1.037595, 0.8915675, -1.525165, 1, 0.9843137, 0, 1,
-1.037029, 0.5467037, -0.6341065, 1, 0.9882353, 0, 1,
-1.026922, -0.08032955, -3.959578, 1, 0.9960784, 0, 1,
-1.025881, -0.3231332, -3.383479, 0.9960784, 1, 0, 1,
-1.023928, 0.9412611, -0.8124875, 0.9921569, 1, 0, 1,
-1.018077, 1.628451, -1.290996, 0.9843137, 1, 0, 1,
-1.017645, -0.2940823, -1.228812, 0.9803922, 1, 0, 1,
-1.012799, 0.4869741, -1.295364, 0.972549, 1, 0, 1,
-1.003332, 0.4786559, -2.899933, 0.9686275, 1, 0, 1,
-1.002884, 0.6313887, -0.100016, 0.9607843, 1, 0, 1,
-1.000745, -1.855048, -2.824119, 0.9568627, 1, 0, 1,
-0.9976516, 0.9518752, -1.42916, 0.9490196, 1, 0, 1,
-0.9859402, 1.27872, 0.7137132, 0.945098, 1, 0, 1,
-0.985108, -0.8882672, -3.017016, 0.9372549, 1, 0, 1,
-0.9818813, -0.3439733, -3.094333, 0.9333333, 1, 0, 1,
-0.9706497, -0.7251916, -1.333792, 0.9254902, 1, 0, 1,
-0.9686566, 0.122338, 1.542102, 0.9215686, 1, 0, 1,
-0.9611573, -2.012554, -0.913175, 0.9137255, 1, 0, 1,
-0.950978, 1.432773, 1.288399, 0.9098039, 1, 0, 1,
-0.9463638, 0.3794297, -0.38281, 0.9019608, 1, 0, 1,
-0.9441051, 0.07169662, -3.243476, 0.8941177, 1, 0, 1,
-0.9393837, 0.8925669, -0.9194574, 0.8901961, 1, 0, 1,
-0.9389153, -0.839321, -0.9529475, 0.8823529, 1, 0, 1,
-0.9368027, 0.6821312, -1.544428, 0.8784314, 1, 0, 1,
-0.9346562, 0.9365196, -0.3081622, 0.8705882, 1, 0, 1,
-0.9323061, 0.9105839, 0.6014889, 0.8666667, 1, 0, 1,
-0.9320039, -2.345675, -3.677137, 0.8588235, 1, 0, 1,
-0.9308918, 0.7091447, -2.659323, 0.854902, 1, 0, 1,
-0.9249225, 0.2613254, -1.237135, 0.8470588, 1, 0, 1,
-0.9210064, -0.6300004, -0.4462266, 0.8431373, 1, 0, 1,
-0.9141127, 0.7120501, -0.1112742, 0.8352941, 1, 0, 1,
-0.9113239, -0.8265132, -0.7219574, 0.8313726, 1, 0, 1,
-0.9103915, 0.07713579, 1.238906, 0.8235294, 1, 0, 1,
-0.9079375, -0.7692225, -2.317388, 0.8196079, 1, 0, 1,
-0.9057238, 0.7828528, -1.437114, 0.8117647, 1, 0, 1,
-0.9043567, 1.588044, -0.7759835, 0.8078431, 1, 0, 1,
-0.8983724, -1.627534, -2.071769, 0.8, 1, 0, 1,
-0.8934554, 1.790508, 0.9683523, 0.7921569, 1, 0, 1,
-0.888293, -0.09229613, -0.8804945, 0.7882353, 1, 0, 1,
-0.8882103, -0.692813, -2.386121, 0.7803922, 1, 0, 1,
-0.8875523, -0.456468, -2.102115, 0.7764706, 1, 0, 1,
-0.8831182, -0.3078803, -3.337076, 0.7686275, 1, 0, 1,
-0.8786264, 1.533656, -2.604641, 0.7647059, 1, 0, 1,
-0.8695833, 0.04141141, -1.693097, 0.7568628, 1, 0, 1,
-0.8674086, 0.1699898, -0.346082, 0.7529412, 1, 0, 1,
-0.8662539, -2.050882, -4.082672, 0.7450981, 1, 0, 1,
-0.8622403, -0.4025314, -3.00442, 0.7411765, 1, 0, 1,
-0.8599828, 0.2831666, -1.13733, 0.7333333, 1, 0, 1,
-0.8581858, 0.477844, 0.2419357, 0.7294118, 1, 0, 1,
-0.8575267, 2.564548, -1.651945, 0.7215686, 1, 0, 1,
-0.8530731, 1.143833, -0.7208529, 0.7176471, 1, 0, 1,
-0.8501744, -0.4523869, -2.987604, 0.7098039, 1, 0, 1,
-0.8496262, -0.9402239, -1.895307, 0.7058824, 1, 0, 1,
-0.8440254, 0.4923943, -1.160606, 0.6980392, 1, 0, 1,
-0.8434958, -1.150961, -1.895783, 0.6901961, 1, 0, 1,
-0.8295851, 1.56857, -1.2219, 0.6862745, 1, 0, 1,
-0.829062, -1.0406, -3.238731, 0.6784314, 1, 0, 1,
-0.8175377, -1.069481, -2.275335, 0.6745098, 1, 0, 1,
-0.8138155, 0.4076253, -0.2797547, 0.6666667, 1, 0, 1,
-0.806004, -0.3083296, 0.2429142, 0.6627451, 1, 0, 1,
-0.8030897, 0.849504, 0.1685283, 0.654902, 1, 0, 1,
-0.8007042, -1.716981, -1.18445, 0.6509804, 1, 0, 1,
-0.7998349, -0.1356038, -2.31876, 0.6431373, 1, 0, 1,
-0.7969435, 0.7620611, -0.7334215, 0.6392157, 1, 0, 1,
-0.7952092, 0.07107747, -0.8483031, 0.6313726, 1, 0, 1,
-0.7911623, 0.4015311, -0.8907223, 0.627451, 1, 0, 1,
-0.790206, 1.144995, 0.8885188, 0.6196079, 1, 0, 1,
-0.7893225, 1.017644, 0.6353042, 0.6156863, 1, 0, 1,
-0.788919, -1.010293, -2.010253, 0.6078432, 1, 0, 1,
-0.7821705, -0.1980078, 0.5171336, 0.6039216, 1, 0, 1,
-0.7818311, -0.2965148, -1.232507, 0.5960785, 1, 0, 1,
-0.7816007, -0.1255582, -2.311892, 0.5882353, 1, 0, 1,
-0.771338, -0.4136853, -2.37824, 0.5843138, 1, 0, 1,
-0.764084, 0.2375308, -1.058152, 0.5764706, 1, 0, 1,
-0.763568, 0.611572, 0.2514624, 0.572549, 1, 0, 1,
-0.762448, 1.01231, -0.1447019, 0.5647059, 1, 0, 1,
-0.7619305, -0.5554755, 0.4824795, 0.5607843, 1, 0, 1,
-0.7612652, -0.5651107, -2.195846, 0.5529412, 1, 0, 1,
-0.7589311, 0.6914302, -2.118427, 0.5490196, 1, 0, 1,
-0.7568027, 0.1927041, -2.89062, 0.5411765, 1, 0, 1,
-0.7564034, 0.5542449, -2.085363, 0.5372549, 1, 0, 1,
-0.7456327, 0.8058376, -0.6560263, 0.5294118, 1, 0, 1,
-0.7357535, 0.2993402, -0.2969489, 0.5254902, 1, 0, 1,
-0.7344899, 1.664168, -0.6253661, 0.5176471, 1, 0, 1,
-0.7336959, 1.448516, 0.8580638, 0.5137255, 1, 0, 1,
-0.7309483, -0.6455753, -1.257986, 0.5058824, 1, 0, 1,
-0.7267683, -1.06751, -1.426886, 0.5019608, 1, 0, 1,
-0.7238889, 0.801185, -0.4175979, 0.4941176, 1, 0, 1,
-0.715213, 0.8172892, -0.2111709, 0.4862745, 1, 0, 1,
-0.7143289, 0.5927866, -0.444215, 0.4823529, 1, 0, 1,
-0.7088754, 2.139243, 0.2512326, 0.4745098, 1, 0, 1,
-0.708755, 0.04275168, -2.581651, 0.4705882, 1, 0, 1,
-0.697892, 1.698268, -2.25543, 0.4627451, 1, 0, 1,
-0.69504, -0.07963112, -0.7435656, 0.4588235, 1, 0, 1,
-0.688562, 0.2554964, -1.563978, 0.4509804, 1, 0, 1,
-0.6821485, -1.028928, -3.172169, 0.4470588, 1, 0, 1,
-0.6813132, 1.605232, -0.1694142, 0.4392157, 1, 0, 1,
-0.6760916, -1.971352, -3.065468, 0.4352941, 1, 0, 1,
-0.6738366, -1.512109, -1.461574, 0.427451, 1, 0, 1,
-0.6726397, -2.040806, -3.955267, 0.4235294, 1, 0, 1,
-0.6663118, -1.351722, -1.745387, 0.4156863, 1, 0, 1,
-0.6605963, -0.1474295, -0.1909117, 0.4117647, 1, 0, 1,
-0.6589283, -1.078677, -2.084009, 0.4039216, 1, 0, 1,
-0.6557607, 0.01111815, -0.7606358, 0.3960784, 1, 0, 1,
-0.6556627, -1.288431, -1.950852, 0.3921569, 1, 0, 1,
-0.6547285, 0.9497723, -0.6112809, 0.3843137, 1, 0, 1,
-0.6525685, 0.5310783, 0.2985153, 0.3803922, 1, 0, 1,
-0.6503363, -0.704868, -3.91393, 0.372549, 1, 0, 1,
-0.6457423, 1.02345, 0.6708425, 0.3686275, 1, 0, 1,
-0.6454927, 2.041357, 2.248412, 0.3607843, 1, 0, 1,
-0.6414691, -1.559039, -2.099166, 0.3568628, 1, 0, 1,
-0.6354959, 2.284501, -2.399552, 0.3490196, 1, 0, 1,
-0.6318047, 1.341798, 0.04343208, 0.345098, 1, 0, 1,
-0.6253237, -0.9703256, -1.731516, 0.3372549, 1, 0, 1,
-0.6250296, 0.4223424, -1.456594, 0.3333333, 1, 0, 1,
-0.6245669, 0.1178261, -0.3894325, 0.3254902, 1, 0, 1,
-0.62023, -0.5033267, -1.357261, 0.3215686, 1, 0, 1,
-0.6176064, -1.322013, -0.7839718, 0.3137255, 1, 0, 1,
-0.6172995, 0.6127324, -0.9700273, 0.3098039, 1, 0, 1,
-0.6144999, 0.2335988, -1.158583, 0.3019608, 1, 0, 1,
-0.6130465, -0.3199803, -2.08494, 0.2941177, 1, 0, 1,
-0.6082938, 0.1519002, -0.4395041, 0.2901961, 1, 0, 1,
-0.6043131, 0.5380624, -1.699814, 0.282353, 1, 0, 1,
-0.6040878, 1.047859, -0.5060875, 0.2784314, 1, 0, 1,
-0.600976, -0.08159876, -2.037345, 0.2705882, 1, 0, 1,
-0.5941441, 1.169513, -1.411095, 0.2666667, 1, 0, 1,
-0.5903114, -1.598882, -3.182715, 0.2588235, 1, 0, 1,
-0.5857334, -0.5274462, -2.754969, 0.254902, 1, 0, 1,
-0.5851564, 0.8977761, -1.785545, 0.2470588, 1, 0, 1,
-0.5801046, -0.206452, -2.378997, 0.2431373, 1, 0, 1,
-0.5787343, 0.1632862, -0.05786099, 0.2352941, 1, 0, 1,
-0.5770873, 1.552816, -1.494852, 0.2313726, 1, 0, 1,
-0.5644982, 0.4970812, -0.4758117, 0.2235294, 1, 0, 1,
-0.5641429, -0.3088075, -1.845436, 0.2196078, 1, 0, 1,
-0.5560297, 0.02248065, -0.8515623, 0.2117647, 1, 0, 1,
-0.5521308, 0.1530409, -3.559134, 0.2078431, 1, 0, 1,
-0.5510582, -0.4881818, -1.51357, 0.2, 1, 0, 1,
-0.5508428, 0.1008117, 0.2473014, 0.1921569, 1, 0, 1,
-0.5486126, 1.268796, -0.4426579, 0.1882353, 1, 0, 1,
-0.5457928, 0.1438335, -1.018863, 0.1803922, 1, 0, 1,
-0.545218, 0.7985025, 1.911684, 0.1764706, 1, 0, 1,
-0.5401452, -1.740751, -5.581277, 0.1686275, 1, 0, 1,
-0.540032, 1.667978, 0.5073192, 0.1647059, 1, 0, 1,
-0.5356818, -1.395843, -3.279677, 0.1568628, 1, 0, 1,
-0.5335798, 1.138677, 0.7156654, 0.1529412, 1, 0, 1,
-0.5305967, 1.174775, -0.2038365, 0.145098, 1, 0, 1,
-0.5238227, 0.6818092, -0.5731169, 0.1411765, 1, 0, 1,
-0.5207797, -2.164057, -3.646996, 0.1333333, 1, 0, 1,
-0.5197145, -0.3708659, -0.5684021, 0.1294118, 1, 0, 1,
-0.5156157, -1.948747, -2.292452, 0.1215686, 1, 0, 1,
-0.5156119, -0.817477, -3.947095, 0.1176471, 1, 0, 1,
-0.5110056, -2.494005, -3.821225, 0.1098039, 1, 0, 1,
-0.5067058, -0.7895932, -3.146082, 0.1058824, 1, 0, 1,
-0.5049672, -0.7177725, -1.678051, 0.09803922, 1, 0, 1,
-0.501633, -0.6638182, -3.375046, 0.09019608, 1, 0, 1,
-0.4999841, -0.1392682, -2.486096, 0.08627451, 1, 0, 1,
-0.4989946, 0.4398144, -0.7291836, 0.07843138, 1, 0, 1,
-0.4978947, -0.5223699, -2.848858, 0.07450981, 1, 0, 1,
-0.4967642, -1.285419, -4.668283, 0.06666667, 1, 0, 1,
-0.4932114, 1.26237, 0.1756884, 0.0627451, 1, 0, 1,
-0.4917958, 1.20145, -0.6516641, 0.05490196, 1, 0, 1,
-0.4912226, 0.3629902, -0.9261255, 0.05098039, 1, 0, 1,
-0.4907571, -0.2419103, -0.9282117, 0.04313726, 1, 0, 1,
-0.4903504, -0.6887411, -2.415262, 0.03921569, 1, 0, 1,
-0.4887285, -1.578894, -5.585726, 0.03137255, 1, 0, 1,
-0.483693, -0.4428802, -2.555773, 0.02745098, 1, 0, 1,
-0.4836318, 0.02874912, -2.243435, 0.01960784, 1, 0, 1,
-0.4835683, 0.4192981, -2.115392, 0.01568628, 1, 0, 1,
-0.4812863, -0.7905377, -1.72626, 0.007843138, 1, 0, 1,
-0.4808059, 0.1599021, -0.7654217, 0.003921569, 1, 0, 1,
-0.4748248, 1.924077, -1.283273, 0, 1, 0.003921569, 1,
-0.4723651, -0.5588381, -4.644797, 0, 1, 0.01176471, 1,
-0.4620018, 0.4375326, 0.3055658, 0, 1, 0.01568628, 1,
-0.4584013, 1.117281, -0.1901523, 0, 1, 0.02352941, 1,
-0.4562012, 1.724158, -0.6440406, 0, 1, 0.02745098, 1,
-0.4561018, 0.3097449, -1.777287, 0, 1, 0.03529412, 1,
-0.4560852, 0.8629892, 0.6621192, 0, 1, 0.03921569, 1,
-0.4540397, -0.1279301, -2.622084, 0, 1, 0.04705882, 1,
-0.447088, -1.110825, -3.872566, 0, 1, 0.05098039, 1,
-0.4459765, 0.3553912, 0.3521883, 0, 1, 0.05882353, 1,
-0.438026, 0.4235768, -1.0485, 0, 1, 0.0627451, 1,
-0.4352146, -0.8632098, -3.457051, 0, 1, 0.07058824, 1,
-0.43489, 1.600159, -1.353436, 0, 1, 0.07450981, 1,
-0.4331265, 0.07264468, -0.04705317, 0, 1, 0.08235294, 1,
-0.4324537, -0.6369345, -1.945809, 0, 1, 0.08627451, 1,
-0.4300209, 0.2375512, -0.01993483, 0, 1, 0.09411765, 1,
-0.4298995, -1.462111, -0.249611, 0, 1, 0.1019608, 1,
-0.4268129, 1.275373, 1.058543, 0, 1, 0.1058824, 1,
-0.4187107, 1.563243, -1.999058, 0, 1, 0.1137255, 1,
-0.4184799, 1.971138, -0.2109949, 0, 1, 0.1176471, 1,
-0.4181399, -0.1891958, -3.361542, 0, 1, 0.1254902, 1,
-0.4137485, -1.184222, -3.722298, 0, 1, 0.1294118, 1,
-0.4131396, 0.158712, 0.1764414, 0, 1, 0.1372549, 1,
-0.4074636, 0.5034769, -0.3798766, 0, 1, 0.1411765, 1,
-0.4060527, -0.3944482, -3.172693, 0, 1, 0.1490196, 1,
-0.4004706, 0.07365393, -0.3488729, 0, 1, 0.1529412, 1,
-0.4001177, 1.714236, -0.1280341, 0, 1, 0.1607843, 1,
-0.3973353, -1.351239, -4.994142, 0, 1, 0.1647059, 1,
-0.3969595, -0.889115, -4.6206, 0, 1, 0.172549, 1,
-0.3956829, 0.7218324, -0.4704785, 0, 1, 0.1764706, 1,
-0.391659, -0.8402174, -1.151112, 0, 1, 0.1843137, 1,
-0.3912904, 1.020585, -0.3524577, 0, 1, 0.1882353, 1,
-0.3909129, -0.5682618, -1.578796, 0, 1, 0.1960784, 1,
-0.389463, 0.3189387, -2.502769, 0, 1, 0.2039216, 1,
-0.3886942, -0.3591543, -2.460116, 0, 1, 0.2078431, 1,
-0.3883651, -0.6355757, -3.711853, 0, 1, 0.2156863, 1,
-0.3870021, 2.376488, 2.502495, 0, 1, 0.2196078, 1,
-0.3850782, -1.333827, -3.296518, 0, 1, 0.227451, 1,
-0.3842092, 0.1136013, -1.109616, 0, 1, 0.2313726, 1,
-0.3809082, -0.674343, -3.046868, 0, 1, 0.2392157, 1,
-0.3774612, -1.275459, -2.301056, 0, 1, 0.2431373, 1,
-0.3742357, 0.3306697, -1.151899, 0, 1, 0.2509804, 1,
-0.3726173, -0.1540269, -2.328441, 0, 1, 0.254902, 1,
-0.3637906, 1.524166, -0.471339, 0, 1, 0.2627451, 1,
-0.3628213, -0.1583055, -1.265126, 0, 1, 0.2666667, 1,
-0.3607525, -1.549449, -2.032869, 0, 1, 0.2745098, 1,
-0.360278, 0.2826054, 1.162676, 0, 1, 0.2784314, 1,
-0.35937, 0.2931564, 1.113116, 0, 1, 0.2862745, 1,
-0.3493369, 1.110201, 0.2074358, 0, 1, 0.2901961, 1,
-0.3458289, -0.05840306, -2.092976, 0, 1, 0.2980392, 1,
-0.3456944, 0.2002916, 1.209867, 0, 1, 0.3058824, 1,
-0.3450982, -0.1933281, -2.039543, 0, 1, 0.3098039, 1,
-0.3448053, 1.361926, -1.616535, 0, 1, 0.3176471, 1,
-0.3435891, -2.114301, -1.756702, 0, 1, 0.3215686, 1,
-0.3387246, 0.5200933, -1.478501, 0, 1, 0.3294118, 1,
-0.3367983, 0.1565371, -2.999162, 0, 1, 0.3333333, 1,
-0.3325252, -0.5268811, -3.003625, 0, 1, 0.3411765, 1,
-0.3270845, 0.2731293, 0.1382928, 0, 1, 0.345098, 1,
-0.3249792, -0.507899, -3.081572, 0, 1, 0.3529412, 1,
-0.3233087, 0.6100348, -0.834105, 0, 1, 0.3568628, 1,
-0.3207254, -1.146304, -4.003164, 0, 1, 0.3647059, 1,
-0.3189756, 1.197128, -0.7238702, 0, 1, 0.3686275, 1,
-0.3167299, -1.046013, -2.191947, 0, 1, 0.3764706, 1,
-0.3161673, 0.6428829, -1.167165, 0, 1, 0.3803922, 1,
-0.3132902, 0.6751537, 0.02612388, 0, 1, 0.3882353, 1,
-0.301101, 1.371403, -1.570019, 0, 1, 0.3921569, 1,
-0.3001187, 1.757539, -0.3607643, 0, 1, 0.4, 1,
-0.299577, -0.46641, -3.570007, 0, 1, 0.4078431, 1,
-0.2968982, 0.6360157, 1.202634, 0, 1, 0.4117647, 1,
-0.292312, 0.3587187, 0.2471576, 0, 1, 0.4196078, 1,
-0.2920601, -1.451506, -4.31415, 0, 1, 0.4235294, 1,
-0.2898708, -0.7998018, -2.029111, 0, 1, 0.4313726, 1,
-0.2874491, 1.487743, -1.172994, 0, 1, 0.4352941, 1,
-0.2862345, -0.1701063, -2.469048, 0, 1, 0.4431373, 1,
-0.2826444, 0.2512077, -2.297089, 0, 1, 0.4470588, 1,
-0.2822511, 0.6746676, 0.06958211, 0, 1, 0.454902, 1,
-0.2812922, -0.7743492, -3.693365, 0, 1, 0.4588235, 1,
-0.2801545, 2.173218, -1.031439, 0, 1, 0.4666667, 1,
-0.2779136, 1.764315, -0.4593137, 0, 1, 0.4705882, 1,
-0.2777032, -0.7341825, -2.218126, 0, 1, 0.4784314, 1,
-0.2737445, -2.471246, -3.160354, 0, 1, 0.4823529, 1,
-0.2729602, 0.09565951, -2.413131, 0, 1, 0.4901961, 1,
-0.2713583, 0.5148238, 1.597195, 0, 1, 0.4941176, 1,
-0.2660883, 0.5806288, -0.2162402, 0, 1, 0.5019608, 1,
-0.2607045, 2.510616, 0.1895795, 0, 1, 0.509804, 1,
-0.2586544, -0.16089, -2.32637, 0, 1, 0.5137255, 1,
-0.2585314, 0.7186893, -0.9095259, 0, 1, 0.5215687, 1,
-0.2565652, -0.7979495, -4.568483, 0, 1, 0.5254902, 1,
-0.2501386, 0.7644106, -1.641601, 0, 1, 0.5333334, 1,
-0.2500827, -1.060875, -3.711946, 0, 1, 0.5372549, 1,
-0.2495144, 0.3328315, -1.489029, 0, 1, 0.5450981, 1,
-0.2484737, -1.368157, -2.607482, 0, 1, 0.5490196, 1,
-0.2414, 1.88041, -0.07247951, 0, 1, 0.5568628, 1,
-0.2396583, -0.05630445, -1.354986, 0, 1, 0.5607843, 1,
-0.2389692, 1.090233, 1.591632, 0, 1, 0.5686275, 1,
-0.2388381, 0.4212052, -0.8142875, 0, 1, 0.572549, 1,
-0.2370434, 1.152153, -1.693497, 0, 1, 0.5803922, 1,
-0.2293579, 0.8877691, -0.3790717, 0, 1, 0.5843138, 1,
-0.2292012, 1.141678, -0.450341, 0, 1, 0.5921569, 1,
-0.2238534, -1.755191, -2.51421, 0, 1, 0.5960785, 1,
-0.2212603, -2.026459, -3.194744, 0, 1, 0.6039216, 1,
-0.2211845, -0.7260062, -2.529372, 0, 1, 0.6117647, 1,
-0.2141194, -0.2605924, -3.295595, 0, 1, 0.6156863, 1,
-0.2116033, -0.3089917, -1.940557, 0, 1, 0.6235294, 1,
-0.2096693, 0.1574361, -1.093946, 0, 1, 0.627451, 1,
-0.2068208, 1.314558, -0.7033714, 0, 1, 0.6352941, 1,
-0.2008274, -0.3718224, -3.29992, 0, 1, 0.6392157, 1,
-0.1970851, -0.1325503, -3.238886, 0, 1, 0.6470588, 1,
-0.1958436, 0.6395503, 0.2514891, 0, 1, 0.6509804, 1,
-0.1933563, 1.692128, -0.9581867, 0, 1, 0.6588235, 1,
-0.1932166, 1.376492, 0.5069633, 0, 1, 0.6627451, 1,
-0.192668, 1.207521, 0.6986109, 0, 1, 0.6705883, 1,
-0.1917764, -1.100272, -2.682847, 0, 1, 0.6745098, 1,
-0.1898397, -1.799268, -4.263288, 0, 1, 0.682353, 1,
-0.1886266, 1.047731, -1.240219, 0, 1, 0.6862745, 1,
-0.1831025, -0.5900264, -3.591057, 0, 1, 0.6941177, 1,
-0.180547, -1.462572, -3.542279, 0, 1, 0.7019608, 1,
-0.1799313, -0.3410541, -2.918221, 0, 1, 0.7058824, 1,
-0.1790745, -1.802581, -3.8648, 0, 1, 0.7137255, 1,
-0.1773002, 0.4044133, 0.2453833, 0, 1, 0.7176471, 1,
-0.1741528, -0.9911246, -4.17661, 0, 1, 0.7254902, 1,
-0.1721712, -0.0850425, -1.389087, 0, 1, 0.7294118, 1,
-0.1658218, -1.568529, -3.631086, 0, 1, 0.7372549, 1,
-0.165659, -0.5842686, -2.490671, 0, 1, 0.7411765, 1,
-0.1649633, -1.050527, -3.857711, 0, 1, 0.7490196, 1,
-0.1649623, -1.529632, -2.397923, 0, 1, 0.7529412, 1,
-0.1638262, -0.9358363, -3.182692, 0, 1, 0.7607843, 1,
-0.1598708, -0.9879226, -3.439057, 0, 1, 0.7647059, 1,
-0.1569923, 0.2896698, -0.3158358, 0, 1, 0.772549, 1,
-0.1563068, -0.3203135, -3.74787, 0, 1, 0.7764706, 1,
-0.1561046, -2.089166, -1.858758, 0, 1, 0.7843137, 1,
-0.154344, -0.1695533, -2.479681, 0, 1, 0.7882353, 1,
-0.153928, 1.489276, 1.279406, 0, 1, 0.7960784, 1,
-0.1522353, -0.02408754, -3.203829, 0, 1, 0.8039216, 1,
-0.1490153, -0.2767495, -3.065889, 0, 1, 0.8078431, 1,
-0.147799, 1.045737, 1.051144, 0, 1, 0.8156863, 1,
-0.1417292, -0.6983373, -3.001302, 0, 1, 0.8196079, 1,
-0.1404759, -0.2344717, -2.818956, 0, 1, 0.827451, 1,
-0.1293741, 0.5848169, -0.8412379, 0, 1, 0.8313726, 1,
-0.1282725, -0.4122951, -2.762619, 0, 1, 0.8392157, 1,
-0.1263549, -0.154891, -2.23218, 0, 1, 0.8431373, 1,
-0.1245866, 1.715714, 0.1165889, 0, 1, 0.8509804, 1,
-0.1207367, 0.6962222, 1.614684, 0, 1, 0.854902, 1,
-0.1202538, 0.950601, -1.365987, 0, 1, 0.8627451, 1,
-0.1193081, -0.5155234, -3.238791, 0, 1, 0.8666667, 1,
-0.1138156, 1.87291, -0.4482279, 0, 1, 0.8745098, 1,
-0.1104203, -0.8661911, -4.738256, 0, 1, 0.8784314, 1,
-0.1085204, -0.5447722, -3.017265, 0, 1, 0.8862745, 1,
-0.1070081, -1.316016, -3.589068, 0, 1, 0.8901961, 1,
-0.103539, 0.5244079, 1.106741, 0, 1, 0.8980392, 1,
-0.1015911, 0.2649387, -0.8236337, 0, 1, 0.9058824, 1,
-0.1006834, 0.3315363, -0.7551587, 0, 1, 0.9098039, 1,
-0.09914949, -1.301434, -2.195769, 0, 1, 0.9176471, 1,
-0.09836005, 0.2056004, 0.09049696, 0, 1, 0.9215686, 1,
-0.097776, -0.5899162, -3.428277, 0, 1, 0.9294118, 1,
-0.09354403, 1.799071, -0.9969202, 0, 1, 0.9333333, 1,
-0.09140753, -0.02278378, -0.7935638, 0, 1, 0.9411765, 1,
-0.08852983, -0.3995661, -4.074608, 0, 1, 0.945098, 1,
-0.08666372, -0.1884139, -2.431393, 0, 1, 0.9529412, 1,
-0.08188465, 1.747018, 0.6521646, 0, 1, 0.9568627, 1,
-0.08162227, -0.2182889, -2.312908, 0, 1, 0.9647059, 1,
-0.07931183, -0.1421262, -3.467426, 0, 1, 0.9686275, 1,
-0.07181548, 0.1031208, -0.1479627, 0, 1, 0.9764706, 1,
-0.07067503, 1.372205, 0.5171919, 0, 1, 0.9803922, 1,
-0.07026746, -0.1537789, -3.954804, 0, 1, 0.9882353, 1,
-0.06893751, 0.4997608, -1.167554, 0, 1, 0.9921569, 1,
-0.0679386, -0.05902341, -2.08355, 0, 1, 1, 1,
-0.06462597, 0.4908282, -0.03413777, 0, 0.9921569, 1, 1,
-0.06458618, 0.2111332, -1.243636, 0, 0.9882353, 1, 1,
-0.06450108, -1.415765, -2.060319, 0, 0.9803922, 1, 1,
-0.06425893, -0.5742248, -3.183003, 0, 0.9764706, 1, 1,
-0.0584967, -0.8489974, -0.9116654, 0, 0.9686275, 1, 1,
-0.05675413, -2.630161, -3.243546, 0, 0.9647059, 1, 1,
-0.04766224, -1.453158, -3.302449, 0, 0.9568627, 1, 1,
-0.04765537, -0.1319019, -3.984024, 0, 0.9529412, 1, 1,
-0.04643576, -1.443184, -3.466979, 0, 0.945098, 1, 1,
-0.04189541, 0.4449045, -0.8501309, 0, 0.9411765, 1, 1,
-0.04111757, 1.302906, 0.4093014, 0, 0.9333333, 1, 1,
-0.04070945, -0.372627, -3.294499, 0, 0.9294118, 1, 1,
-0.03959097, -2.094681, -2.3312, 0, 0.9215686, 1, 1,
-0.03888847, -0.5906106, -2.531097, 0, 0.9176471, 1, 1,
-0.03797606, -0.509516, -3.711733, 0, 0.9098039, 1, 1,
-0.03758852, 1.408759, -0.4499425, 0, 0.9058824, 1, 1,
-0.03676942, -0.4447352, -4.932889, 0, 0.8980392, 1, 1,
-0.0356034, -0.7901446, -3.732651, 0, 0.8901961, 1, 1,
-0.03210609, -0.2979168, -1.470831, 0, 0.8862745, 1, 1,
-0.03180616, 1.343822, -0.7398353, 0, 0.8784314, 1, 1,
-0.03053126, 1.550408, 1.663226, 0, 0.8745098, 1, 1,
-0.02982176, 0.620303, 0.2861844, 0, 0.8666667, 1, 1,
-0.02478391, 1.730705, -0.2424073, 0, 0.8627451, 1, 1,
-0.02025379, 2.264671, 1.595337, 0, 0.854902, 1, 1,
-0.01765103, 0.9327163, 0.6511453, 0, 0.8509804, 1, 1,
-0.01730377, -0.0714329, -3.855938, 0, 0.8431373, 1, 1,
-0.01434148, 0.6962323, -0.07622749, 0, 0.8392157, 1, 1,
-0.0141029, -0.9717638, -3.142282, 0, 0.8313726, 1, 1,
-0.01170032, 1.753742, 0.6717482, 0, 0.827451, 1, 1,
-0.01079009, 0.1292018, 0.3046237, 0, 0.8196079, 1, 1,
-0.009329123, -0.7507117, -2.438824, 0, 0.8156863, 1, 1,
-0.008231683, 1.415733, 0.208474, 0, 0.8078431, 1, 1,
-0.006635078, 1.330885, 0.447366, 0, 0.8039216, 1, 1,
-0.00488801, -1.187359, -2.25865, 0, 0.7960784, 1, 1,
-0.001938266, 0.4486841, 0.8877487, 0, 0.7882353, 1, 1,
0.002919165, -1.527892, 3.067871, 0, 0.7843137, 1, 1,
0.007440964, -0.3880281, 3.553333, 0, 0.7764706, 1, 1,
0.00800541, 0.6272684, 1.196077, 0, 0.772549, 1, 1,
0.01041062, 1.567508, 0.1343772, 0, 0.7647059, 1, 1,
0.0158391, -0.1669956, 3.520521, 0, 0.7607843, 1, 1,
0.01653164, -1.318221, 3.819291, 0, 0.7529412, 1, 1,
0.01906822, 0.2930005, 0.4700524, 0, 0.7490196, 1, 1,
0.02436859, 0.6798373, 1.728895, 0, 0.7411765, 1, 1,
0.02678585, 1.222847, -0.7738488, 0, 0.7372549, 1, 1,
0.03382384, 0.6530961, 0.503811, 0, 0.7294118, 1, 1,
0.03627059, -0.1093663, 2.801212, 0, 0.7254902, 1, 1,
0.03793251, -0.8007372, 4.518295, 0, 0.7176471, 1, 1,
0.0383872, -0.5423083, 2.186345, 0, 0.7137255, 1, 1,
0.05155142, -0.2514159, 1.386585, 0, 0.7058824, 1, 1,
0.05297657, -0.527383, 2.672844, 0, 0.6980392, 1, 1,
0.05508897, 0.1856484, 1.637823, 0, 0.6941177, 1, 1,
0.0556714, -0.9383483, 1.17446, 0, 0.6862745, 1, 1,
0.05769666, -0.07861114, 2.582018, 0, 0.682353, 1, 1,
0.05824671, -0.1527974, 3.442005, 0, 0.6745098, 1, 1,
0.06020634, 0.1436562, 1.874241, 0, 0.6705883, 1, 1,
0.06123409, -0.1699013, 2.915105, 0, 0.6627451, 1, 1,
0.06152278, -0.1725737, 1.485566, 0, 0.6588235, 1, 1,
0.06375971, 0.5964352, 0.3343259, 0, 0.6509804, 1, 1,
0.06432503, -0.8389455, 2.976079, 0, 0.6470588, 1, 1,
0.07152223, -0.3569582, 2.535511, 0, 0.6392157, 1, 1,
0.07209819, 0.3744312, -1.096031, 0, 0.6352941, 1, 1,
0.07572293, 0.3013235, -0.5821152, 0, 0.627451, 1, 1,
0.07694488, -0.1578494, 2.539542, 0, 0.6235294, 1, 1,
0.09930401, -1.487823, 3.238879, 0, 0.6156863, 1, 1,
0.09970914, 0.07799901, 0.5240576, 0, 0.6117647, 1, 1,
0.1065005, -0.5288146, 1.198971, 0, 0.6039216, 1, 1,
0.1091232, 2.163577, 1.534412, 0, 0.5960785, 1, 1,
0.112984, 1.6912, -0.04620804, 0, 0.5921569, 1, 1,
0.1166489, -0.3283246, 3.960918, 0, 0.5843138, 1, 1,
0.1194322, 0.09274703, 0.919733, 0, 0.5803922, 1, 1,
0.1206343, 1.114075, 0.613448, 0, 0.572549, 1, 1,
0.1234263, 1.013592, -0.8004305, 0, 0.5686275, 1, 1,
0.1235557, -1.033992, 3.624368, 0, 0.5607843, 1, 1,
0.1252195, 0.1281639, 1.129282, 0, 0.5568628, 1, 1,
0.1266543, 0.596052, -1.798084, 0, 0.5490196, 1, 1,
0.1300731, 0.2577904, 1.406469, 0, 0.5450981, 1, 1,
0.1374669, -2.444901, 1.604889, 0, 0.5372549, 1, 1,
0.1424975, 1.747334, -0.6949607, 0, 0.5333334, 1, 1,
0.1438906, 0.9351873, 0.8037502, 0, 0.5254902, 1, 1,
0.1500292, -0.7904937, 2.410158, 0, 0.5215687, 1, 1,
0.1563649, 1.70869, 1.751618, 0, 0.5137255, 1, 1,
0.1568988, -0.8647526, 2.730184, 0, 0.509804, 1, 1,
0.1589352, 0.8368849, -0.928724, 0, 0.5019608, 1, 1,
0.1604059, 0.6289436, 0.08381067, 0, 0.4941176, 1, 1,
0.1644396, 1.333617, 0.1272277, 0, 0.4901961, 1, 1,
0.1672916, 0.2856195, 0.4789831, 0, 0.4823529, 1, 1,
0.1821677, -0.1650214, 2.949043, 0, 0.4784314, 1, 1,
0.1849234, 0.5831931, 0.1977812, 0, 0.4705882, 1, 1,
0.1877601, 1.081017, 1.028057, 0, 0.4666667, 1, 1,
0.1878847, -1.478623, 5.777363, 0, 0.4588235, 1, 1,
0.1921721, 0.6017152, 0.632488, 0, 0.454902, 1, 1,
0.1937104, 0.467449, 0.05302031, 0, 0.4470588, 1, 1,
0.1945127, 0.2312678, 1.048596, 0, 0.4431373, 1, 1,
0.1956092, -0.6980428, 2.637258, 0, 0.4352941, 1, 1,
0.1968335, 0.2609141, 0.4702543, 0, 0.4313726, 1, 1,
0.1973321, 0.3862983, -0.7838657, 0, 0.4235294, 1, 1,
0.1992411, 0.8453685, -0.4742527, 0, 0.4196078, 1, 1,
0.2056162, 0.8305932, 2.083836, 0, 0.4117647, 1, 1,
0.2061286, -0.1133003, 2.520606, 0, 0.4078431, 1, 1,
0.2089825, 0.8093185, 0.1544787, 0, 0.4, 1, 1,
0.2126894, -1.094247, 2.625982, 0, 0.3921569, 1, 1,
0.2167753, 0.6956391, 1.569308, 0, 0.3882353, 1, 1,
0.2217086, -0.1112451, 2.019945, 0, 0.3803922, 1, 1,
0.2223833, 0.03688319, 1.488557, 0, 0.3764706, 1, 1,
0.2241663, 0.4682197, 0.2284028, 0, 0.3686275, 1, 1,
0.2243162, -1.291643, 3.209242, 0, 0.3647059, 1, 1,
0.2281047, 1.173849, -0.5463625, 0, 0.3568628, 1, 1,
0.2330383, 0.006640651, 0.8391433, 0, 0.3529412, 1, 1,
0.2358735, -1.224831, 4.087825, 0, 0.345098, 1, 1,
0.2403534, 0.6635116, -1.244527, 0, 0.3411765, 1, 1,
0.2421567, 0.3448521, 2.074443, 0, 0.3333333, 1, 1,
0.2424248, -0.4856826, 3.429342, 0, 0.3294118, 1, 1,
0.2431476, -1.064441, 2.945066, 0, 0.3215686, 1, 1,
0.244351, 0.3201119, 0.5957714, 0, 0.3176471, 1, 1,
0.245669, -0.985715, 2.996514, 0, 0.3098039, 1, 1,
0.2472591, -0.2983597, 1.678952, 0, 0.3058824, 1, 1,
0.2478966, 0.5240222, 2.131231, 0, 0.2980392, 1, 1,
0.2500689, -1.076761, 4.569498, 0, 0.2901961, 1, 1,
0.251192, 0.3633554, 1.476122, 0, 0.2862745, 1, 1,
0.251237, 1.208975, 2.091346, 0, 0.2784314, 1, 1,
0.2519915, 0.3543667, 1.043057, 0, 0.2745098, 1, 1,
0.2550167, 2.067267, 0.957038, 0, 0.2666667, 1, 1,
0.2564592, 1.616305, 0.1001102, 0, 0.2627451, 1, 1,
0.2575267, -0.227814, 2.162767, 0, 0.254902, 1, 1,
0.2598851, 0.6815389, 0.6583967, 0, 0.2509804, 1, 1,
0.2611286, -1.906068, 2.281233, 0, 0.2431373, 1, 1,
0.2630391, 1.466456, -0.5268149, 0, 0.2392157, 1, 1,
0.2653334, 0.8483717, 0.145289, 0, 0.2313726, 1, 1,
0.2658811, 1.490656, 1.500068, 0, 0.227451, 1, 1,
0.2679078, -1.217449, 3.12293, 0, 0.2196078, 1, 1,
0.2706277, -0.4504829, 2.178028, 0, 0.2156863, 1, 1,
0.2768022, -0.9004163, 3.082426, 0, 0.2078431, 1, 1,
0.2823523, 0.5037627, -0.6765689, 0, 0.2039216, 1, 1,
0.2841913, 0.8236316, 0.8972209, 0, 0.1960784, 1, 1,
0.2844948, 1.946194, 2.229528, 0, 0.1882353, 1, 1,
0.2869024, -1.331692, 3.538555, 0, 0.1843137, 1, 1,
0.2878734, 0.6940286, -1.577987, 0, 0.1764706, 1, 1,
0.2919568, -0.502716, 3.349829, 0, 0.172549, 1, 1,
0.2938381, -2.307784, 2.701192, 0, 0.1647059, 1, 1,
0.2940404, -0.7829381, 2.357767, 0, 0.1607843, 1, 1,
0.2989853, -0.2982916, 1.354124, 0, 0.1529412, 1, 1,
0.2995128, -0.7670181, 4.630661, 0, 0.1490196, 1, 1,
0.3017153, -0.04713802, -0.6303591, 0, 0.1411765, 1, 1,
0.3080823, -0.03337263, 1.275681, 0, 0.1372549, 1, 1,
0.3092111, -0.05569744, 2.642412, 0, 0.1294118, 1, 1,
0.3109696, 1.468854, -0.4487412, 0, 0.1254902, 1, 1,
0.3138548, -0.8069953, 2.034498, 0, 0.1176471, 1, 1,
0.3152364, 1.028882, 0.3450355, 0, 0.1137255, 1, 1,
0.3201858, 0.2153104, 1.586815, 0, 0.1058824, 1, 1,
0.3237927, -0.07907612, 0.2800296, 0, 0.09803922, 1, 1,
0.3249439, 0.4910539, -0.04048504, 0, 0.09411765, 1, 1,
0.3264222, 0.2584695, 0.2439416, 0, 0.08627451, 1, 1,
0.3299819, 0.4056551, 0.3452998, 0, 0.08235294, 1, 1,
0.3342337, -0.8534079, 3.289055, 0, 0.07450981, 1, 1,
0.3360053, -0.1671625, 2.519637, 0, 0.07058824, 1, 1,
0.3374597, 0.795826, 0.4238104, 0, 0.0627451, 1, 1,
0.340347, -0.8119533, 0.6692906, 0, 0.05882353, 1, 1,
0.340703, -0.6542289, 2.363729, 0, 0.05098039, 1, 1,
0.3414452, 1.447298, -1.846004, 0, 0.04705882, 1, 1,
0.348361, -1.041809, 1.666744, 0, 0.03921569, 1, 1,
0.3552202, 0.01469692, 0.6924438, 0, 0.03529412, 1, 1,
0.3554807, -1.001603, 1.875326, 0, 0.02745098, 1, 1,
0.3558857, 0.2244818, 1.481912, 0, 0.02352941, 1, 1,
0.3615532, -0.9511864, 2.597979, 0, 0.01568628, 1, 1,
0.3642687, 0.5624315, 0.7633687, 0, 0.01176471, 1, 1,
0.3672701, 1.973904, -1.040468, 0, 0.003921569, 1, 1,
0.3681132, -0.2639562, 1.769065, 0.003921569, 0, 1, 1,
0.3682654, -0.6337098, 0.4225982, 0.007843138, 0, 1, 1,
0.3692411, 0.3941848, 1.971565, 0.01568628, 0, 1, 1,
0.3721818, 0.3155567, 0.5412238, 0.01960784, 0, 1, 1,
0.3805713, 0.07451127, 2.444683, 0.02745098, 0, 1, 1,
0.380887, -0.5941767, 2.859843, 0.03137255, 0, 1, 1,
0.387126, -0.5646873, 2.033928, 0.03921569, 0, 1, 1,
0.387351, 1.100359, -0.2785026, 0.04313726, 0, 1, 1,
0.3879071, 0.8157939, 0.8285332, 0.05098039, 0, 1, 1,
0.3887414, -0.7144383, 1.817359, 0.05490196, 0, 1, 1,
0.3945933, -1.196612, 1.641866, 0.0627451, 0, 1, 1,
0.3959342, 0.8480336, 4.409522, 0.06666667, 0, 1, 1,
0.3959463, -0.02465203, 2.691907, 0.07450981, 0, 1, 1,
0.4005932, 0.3487839, 2.817264, 0.07843138, 0, 1, 1,
0.4030005, -0.7074694, 3.090917, 0.08627451, 0, 1, 1,
0.4074143, 1.15018, 1.304168, 0.09019608, 0, 1, 1,
0.4084305, -0.1135881, 2.120439, 0.09803922, 0, 1, 1,
0.4092486, -0.425835, 2.24053, 0.1058824, 0, 1, 1,
0.4162455, 0.7986299, 1.062779, 0.1098039, 0, 1, 1,
0.4167344, -0.7978649, 1.983827, 0.1176471, 0, 1, 1,
0.4192797, -1.560176, 2.780681, 0.1215686, 0, 1, 1,
0.4215119, -0.7123336, 2.628116, 0.1294118, 0, 1, 1,
0.4242416, 0.08476645, 2.205251, 0.1333333, 0, 1, 1,
0.4282516, 0.01233223, 2.678046, 0.1411765, 0, 1, 1,
0.4320057, 0.5577435, -1.244985, 0.145098, 0, 1, 1,
0.4321287, 0.0164597, -0.6995965, 0.1529412, 0, 1, 1,
0.4326522, 0.05773453, 1.234652, 0.1568628, 0, 1, 1,
0.4328417, -0.3500233, 2.706363, 0.1647059, 0, 1, 1,
0.4424503, 0.5827159, 1.764636, 0.1686275, 0, 1, 1,
0.4428744, -0.4368209, 1.956899, 0.1764706, 0, 1, 1,
0.4446976, 1.199561, 0.9995887, 0.1803922, 0, 1, 1,
0.4494089, -0.07492901, 1.240058, 0.1882353, 0, 1, 1,
0.4496908, 0.2991621, 1.361968, 0.1921569, 0, 1, 1,
0.4521607, -0.4605491, 2.005446, 0.2, 0, 1, 1,
0.4522454, -1.168889, 2.147543, 0.2078431, 0, 1, 1,
0.4545802, 0.4246525, -0.7937733, 0.2117647, 0, 1, 1,
0.4553452, -0.2950601, -0.1420766, 0.2196078, 0, 1, 1,
0.4590023, -1.037948, 1.023258, 0.2235294, 0, 1, 1,
0.4610201, 2.593748, 0.1711739, 0.2313726, 0, 1, 1,
0.4627923, 0.416675, 1.305652, 0.2352941, 0, 1, 1,
0.4630463, -1.155016, 3.142841, 0.2431373, 0, 1, 1,
0.4639346, 0.8651455, 0.9305022, 0.2470588, 0, 1, 1,
0.4766942, -1.14737, 2.443506, 0.254902, 0, 1, 1,
0.4780848, 0.008568476, -0.5208634, 0.2588235, 0, 1, 1,
0.4817666, 0.224957, 1.890759, 0.2666667, 0, 1, 1,
0.4836042, 0.02202143, 0.9616082, 0.2705882, 0, 1, 1,
0.4837098, 0.4443896, 0.7487559, 0.2784314, 0, 1, 1,
0.4941856, -0.493963, 3.674153, 0.282353, 0, 1, 1,
0.4958707, -0.9850077, 3.814236, 0.2901961, 0, 1, 1,
0.4962968, 1.689872, 0.6529544, 0.2941177, 0, 1, 1,
0.4977895, -1.28432, 4.467745, 0.3019608, 0, 1, 1,
0.4978859, 0.7483321, -0.833727, 0.3098039, 0, 1, 1,
0.4988418, -1.135869, 1.58579, 0.3137255, 0, 1, 1,
0.5026397, 0.9030353, 0.4456718, 0.3215686, 0, 1, 1,
0.5028813, 1.193191, -1.329175, 0.3254902, 0, 1, 1,
0.5054963, 1.163743, 0.6935848, 0.3333333, 0, 1, 1,
0.5096771, -0.5379337, 2.240187, 0.3372549, 0, 1, 1,
0.5116897, -0.3977796, 1.615933, 0.345098, 0, 1, 1,
0.5196438, -0.9223083, 3.394815, 0.3490196, 0, 1, 1,
0.5261948, 0.4471408, -0.1009808, 0.3568628, 0, 1, 1,
0.5368311, 1.322237, -0.6686289, 0.3607843, 0, 1, 1,
0.536979, -0.201089, 2.687818, 0.3686275, 0, 1, 1,
0.5389242, 0.6163195, 1.915558, 0.372549, 0, 1, 1,
0.5390263, 0.1994274, 2.253246, 0.3803922, 0, 1, 1,
0.5413395, -2.378446, 3.513866, 0.3843137, 0, 1, 1,
0.5413747, -0.9664066, 2.785386, 0.3921569, 0, 1, 1,
0.545938, 0.6296005, 0.5238938, 0.3960784, 0, 1, 1,
0.5522934, -0.9236829, 2.735004, 0.4039216, 0, 1, 1,
0.5554136, 0.6089167, 2.087273, 0.4117647, 0, 1, 1,
0.5596042, 1.093809, -0.4015053, 0.4156863, 0, 1, 1,
0.5596297, -0.02997646, 0.7038544, 0.4235294, 0, 1, 1,
0.5630737, -0.3004438, 0.7048539, 0.427451, 0, 1, 1,
0.5665113, 0.6579522, 0.6814743, 0.4352941, 0, 1, 1,
0.5734838, 0.6174804, 1.325397, 0.4392157, 0, 1, 1,
0.5758896, -1.159751, 3.837684, 0.4470588, 0, 1, 1,
0.5771106, 0.415992, 0.4879857, 0.4509804, 0, 1, 1,
0.5801204, 0.7371969, -1.024086, 0.4588235, 0, 1, 1,
0.5824609, 1.692879, -0.2777857, 0.4627451, 0, 1, 1,
0.5834051, -1.078804, 3.448621, 0.4705882, 0, 1, 1,
0.5847543, 0.1632769, 0.6434624, 0.4745098, 0, 1, 1,
0.5850092, -1.195327, 2.057641, 0.4823529, 0, 1, 1,
0.5863745, -1.920532, 2.050932, 0.4862745, 0, 1, 1,
0.5869447, 0.284275, 1.770204, 0.4941176, 0, 1, 1,
0.5888099, -0.4452495, 4.183168, 0.5019608, 0, 1, 1,
0.5895951, -0.9014108, 1.737332, 0.5058824, 0, 1, 1,
0.5958277, 1.797503, 2.013079, 0.5137255, 0, 1, 1,
0.5967155, 0.2783674, -0.1029725, 0.5176471, 0, 1, 1,
0.5985748, -0.7422878, 3.208632, 0.5254902, 0, 1, 1,
0.6059335, 1.825682, -0.9455751, 0.5294118, 0, 1, 1,
0.6068056, -0.09686333, 1.570868, 0.5372549, 0, 1, 1,
0.6120887, 1.788085, 0.3719929, 0.5411765, 0, 1, 1,
0.6151878, -0.006774921, 3.979746, 0.5490196, 0, 1, 1,
0.6208933, -0.9907513, 2.548373, 0.5529412, 0, 1, 1,
0.62395, 2.20769, 0.640581, 0.5607843, 0, 1, 1,
0.6255582, 0.6443424, 1.635295, 0.5647059, 0, 1, 1,
0.6257184, -0.1272591, 1.28703, 0.572549, 0, 1, 1,
0.6259426, 0.2870944, 2.751201, 0.5764706, 0, 1, 1,
0.6260557, 1.370858, -0.06338867, 0.5843138, 0, 1, 1,
0.6284731, -0.941268, 1.79974, 0.5882353, 0, 1, 1,
0.6286888, -0.5795417, 1.761481, 0.5960785, 0, 1, 1,
0.6291555, -2.116052, 1.658684, 0.6039216, 0, 1, 1,
0.6332061, 0.5574859, 0.6218274, 0.6078432, 0, 1, 1,
0.6356046, -0.9450219, 1.905704, 0.6156863, 0, 1, 1,
0.6443436, -0.9018446, 3.447542, 0.6196079, 0, 1, 1,
0.6447847, 0.1617097, 1.049483, 0.627451, 0, 1, 1,
0.6464339, 1.057825, 1.966864, 0.6313726, 0, 1, 1,
0.6464558, 0.3241184, -0.2022659, 0.6392157, 0, 1, 1,
0.6507512, -0.6062645, 4.013085, 0.6431373, 0, 1, 1,
0.6574504, -0.8958622, 4.504609, 0.6509804, 0, 1, 1,
0.6627102, 1.698539, 0.463618, 0.654902, 0, 1, 1,
0.669943, 0.8289222, 1.885611, 0.6627451, 0, 1, 1,
0.6737837, 1.166928, -0.07405134, 0.6666667, 0, 1, 1,
0.6773829, -0.9577703, 1.249538, 0.6745098, 0, 1, 1,
0.6998456, -0.6466283, 1.643116, 0.6784314, 0, 1, 1,
0.7102982, 0.1425342, 1.33461, 0.6862745, 0, 1, 1,
0.7108452, 0.7048647, 1.841945, 0.6901961, 0, 1, 1,
0.7123781, -0.2944665, 0.4769343, 0.6980392, 0, 1, 1,
0.7188799, -0.2479933, 2.106376, 0.7058824, 0, 1, 1,
0.7217361, -1.520486, 1.782465, 0.7098039, 0, 1, 1,
0.7253779, -0.7723526, 4.10876, 0.7176471, 0, 1, 1,
0.7274569, -0.06217628, 1.22338, 0.7215686, 0, 1, 1,
0.7481539, -1.293531, 0.7046841, 0.7294118, 0, 1, 1,
0.7487916, 0.5428641, -0.462873, 0.7333333, 0, 1, 1,
0.7492223, -1.384321, 2.228999, 0.7411765, 0, 1, 1,
0.7494381, 0.6750206, 0.02117433, 0.7450981, 0, 1, 1,
0.7503572, -0.3720944, 3.6616, 0.7529412, 0, 1, 1,
0.7512706, 0.4269508, -0.6382423, 0.7568628, 0, 1, 1,
0.7541416, -0.5080008, 0.5899799, 0.7647059, 0, 1, 1,
0.7593055, -0.723773, 4.65585, 0.7686275, 0, 1, 1,
0.7609563, 0.03186865, 0.9124619, 0.7764706, 0, 1, 1,
0.7670788, 1.307376, 1.753537, 0.7803922, 0, 1, 1,
0.7739474, -0.02775514, 1.58052, 0.7882353, 0, 1, 1,
0.7747707, -1.466514, 2.331226, 0.7921569, 0, 1, 1,
0.7750759, -0.4602764, 1.830266, 0.8, 0, 1, 1,
0.7777261, 0.5474272, 0.2101468, 0.8078431, 0, 1, 1,
0.778836, 0.08376319, 1.109344, 0.8117647, 0, 1, 1,
0.7795017, 0.969861, 0.02503355, 0.8196079, 0, 1, 1,
0.7828274, 0.01545195, -0.03525013, 0.8235294, 0, 1, 1,
0.7906612, 1.484562, 0.2476179, 0.8313726, 0, 1, 1,
0.7909876, 0.2008543, 0.9535041, 0.8352941, 0, 1, 1,
0.7968034, 0.3440166, 2.11027, 0.8431373, 0, 1, 1,
0.7970626, 1.378051, 0.6551166, 0.8470588, 0, 1, 1,
0.8079427, 0.03893759, 0.9234348, 0.854902, 0, 1, 1,
0.813027, 0.01357967, -0.4555044, 0.8588235, 0, 1, 1,
0.8235253, 0.5934166, -0.4030655, 0.8666667, 0, 1, 1,
0.8255102, -0.4742693, 2.09479, 0.8705882, 0, 1, 1,
0.8260275, 0.010708, 0.7134289, 0.8784314, 0, 1, 1,
0.8453191, -0.7014781, 2.44084, 0.8823529, 0, 1, 1,
0.8461916, 0.7394494, 2.152137, 0.8901961, 0, 1, 1,
0.8564407, -0.2262205, 4.827507, 0.8941177, 0, 1, 1,
0.8581553, -0.2193217, 2.73171, 0.9019608, 0, 1, 1,
0.8640843, -0.4260632, 3.193962, 0.9098039, 0, 1, 1,
0.8687988, -0.9249811, 2.47456, 0.9137255, 0, 1, 1,
0.8696277, -0.322218, 1.400606, 0.9215686, 0, 1, 1,
0.876039, -0.208902, 1.712304, 0.9254902, 0, 1, 1,
0.881265, 0.8038841, 2.822701, 0.9333333, 0, 1, 1,
0.8916745, -0.07697624, 1.650458, 0.9372549, 0, 1, 1,
0.8943072, 1.392143, 0.8657271, 0.945098, 0, 1, 1,
0.9077349, -0.5284454, 0.552391, 0.9490196, 0, 1, 1,
0.9131287, 0.01022417, 1.767616, 0.9568627, 0, 1, 1,
0.9191883, -0.04466026, 2.90998, 0.9607843, 0, 1, 1,
0.920543, -0.9795273, 2.030052, 0.9686275, 0, 1, 1,
0.9216506, -0.2962971, 1.871855, 0.972549, 0, 1, 1,
0.923468, 0.1362531, 1.105635, 0.9803922, 0, 1, 1,
0.9235291, 0.2593821, 2.574658, 0.9843137, 0, 1, 1,
0.9269012, -1.552404, 2.818706, 0.9921569, 0, 1, 1,
0.9315184, -0.9462395, 3.695198, 0.9960784, 0, 1, 1,
0.9486139, -0.02814236, 2.256943, 1, 0, 0.9960784, 1,
0.957992, 0.6268319, 1.639209, 1, 0, 0.9882353, 1,
0.9620895, 0.5986162, 1.142067, 1, 0, 0.9843137, 1,
0.9655899, 0.01984149, 2.762371, 1, 0, 0.9764706, 1,
0.9835082, -1.629759, 2.021565, 1, 0, 0.972549, 1,
0.9848531, 0.3795033, 2.898861, 1, 0, 0.9647059, 1,
0.9941381, 0.1464354, 1.201877, 1, 0, 0.9607843, 1,
0.9965643, -0.7891089, 2.293458, 1, 0, 0.9529412, 1,
0.9975502, -1.200348, 2.566484, 1, 0, 0.9490196, 1,
0.9975646, -1.368348, 2.224541, 1, 0, 0.9411765, 1,
1.008763, -0.5747409, 1.524127, 1, 0, 0.9372549, 1,
1.019428, -0.9159009, 3.055534, 1, 0, 0.9294118, 1,
1.020851, -0.5443707, 2.068506, 1, 0, 0.9254902, 1,
1.03281, -1.56247, 3.307208, 1, 0, 0.9176471, 1,
1.033275, 0.7304197, 1.351289, 1, 0, 0.9137255, 1,
1.034499, -0.8542927, 2.947368, 1, 0, 0.9058824, 1,
1.039518, 0.8617157, 2.039783, 1, 0, 0.9019608, 1,
1.04248, 0.243644, 2.446018, 1, 0, 0.8941177, 1,
1.054699, 0.9223805, 0.115777, 1, 0, 0.8862745, 1,
1.05861, -0.3697271, 3.626372, 1, 0, 0.8823529, 1,
1.06604, 3.004947, 1.191453, 1, 0, 0.8745098, 1,
1.066171, -0.1926886, 1.601903, 1, 0, 0.8705882, 1,
1.068357, 0.9956294, 0.2694769, 1, 0, 0.8627451, 1,
1.072752, 0.1451031, 1.461558, 1, 0, 0.8588235, 1,
1.081453, -0.192967, 1.093684, 1, 0, 0.8509804, 1,
1.10747, -1.741517, 2.268511, 1, 0, 0.8470588, 1,
1.109986, -0.0769809, 2.900168, 1, 0, 0.8392157, 1,
1.1102, -0.03832071, 2.30772, 1, 0, 0.8352941, 1,
1.119989, -0.03171793, 0.4789137, 1, 0, 0.827451, 1,
1.136288, -0.5407444, 2.085778, 1, 0, 0.8235294, 1,
1.140229, 2.822277, -0.3752953, 1, 0, 0.8156863, 1,
1.141824, 0.3293285, 1.508499, 1, 0, 0.8117647, 1,
1.146542, 0.4573499, 2.320504, 1, 0, 0.8039216, 1,
1.148272, -1.043854, 3.308306, 1, 0, 0.7960784, 1,
1.155647, -0.3154092, 2.68598, 1, 0, 0.7921569, 1,
1.156731, -2.151675, 1.866574, 1, 0, 0.7843137, 1,
1.161137, -0.5486352, 2.271961, 1, 0, 0.7803922, 1,
1.161168, -1.03783, 2.342798, 1, 0, 0.772549, 1,
1.170142, -0.3116381, 1.782756, 1, 0, 0.7686275, 1,
1.173935, -1.026734, 4.215744, 1, 0, 0.7607843, 1,
1.182757, -0.4250942, 1.073854, 1, 0, 0.7568628, 1,
1.199721, -0.03144066, 0.8559764, 1, 0, 0.7490196, 1,
1.19975, 0.188935, 0.8090767, 1, 0, 0.7450981, 1,
1.204887, 1.229139, -1.453262, 1, 0, 0.7372549, 1,
1.213042, 1.772529, -0.1027139, 1, 0, 0.7333333, 1,
1.215673, 3.452781, -0.5855671, 1, 0, 0.7254902, 1,
1.217523, 0.8924796, 1.316692, 1, 0, 0.7215686, 1,
1.219908, -2.836242, 1.676627, 1, 0, 0.7137255, 1,
1.220379, -0.3380483, 2.274988, 1, 0, 0.7098039, 1,
1.230351, 0.4643356, 2.772249, 1, 0, 0.7019608, 1,
1.240366, 0.8379005, 2.031956, 1, 0, 0.6941177, 1,
1.248766, -0.2246594, 1.350824, 1, 0, 0.6901961, 1,
1.251533, -0.383995, 0.4938395, 1, 0, 0.682353, 1,
1.253377, -0.4019025, 0.9594504, 1, 0, 0.6784314, 1,
1.257815, -0.5005547, 0.6831462, 1, 0, 0.6705883, 1,
1.258992, 4.378549, -0.02569101, 1, 0, 0.6666667, 1,
1.263324, 0.6717687, -0.2183192, 1, 0, 0.6588235, 1,
1.265889, -0.9095234, 2.790569, 1, 0, 0.654902, 1,
1.267698, -0.7234834, 1.884027, 1, 0, 0.6470588, 1,
1.273129, -0.6899378, 2.485175, 1, 0, 0.6431373, 1,
1.276208, 0.3069103, 1.411888, 1, 0, 0.6352941, 1,
1.278696, 0.341635, 2.601493, 1, 0, 0.6313726, 1,
1.280994, -1.708431, 2.996691, 1, 0, 0.6235294, 1,
1.287082, 1.498195, 1.006171, 1, 0, 0.6196079, 1,
1.296503, -0.5651309, -0.4938582, 1, 0, 0.6117647, 1,
1.297098, -1.022075, 1.929106, 1, 0, 0.6078432, 1,
1.302947, -0.3204834, 2.068437, 1, 0, 0.6, 1,
1.303011, 0.4181118, 1.593615, 1, 0, 0.5921569, 1,
1.311029, -2.111961, 1.861729, 1, 0, 0.5882353, 1,
1.321134, 1.685522, 1.355993, 1, 0, 0.5803922, 1,
1.327125, 2.017639, 1.124004, 1, 0, 0.5764706, 1,
1.327702, 0.6242161, 0.9887699, 1, 0, 0.5686275, 1,
1.331437, 0.5608155, -0.6416221, 1, 0, 0.5647059, 1,
1.335279, -0.4179667, 1.481109, 1, 0, 0.5568628, 1,
1.340644, -1.155369, 3.291243, 1, 0, 0.5529412, 1,
1.343055, 1.821718, 0.7825347, 1, 0, 0.5450981, 1,
1.349909, -0.4804634, 3.170224, 1, 0, 0.5411765, 1,
1.358279, -0.04141671, 0.496814, 1, 0, 0.5333334, 1,
1.366092, 0.5140393, 0.7744823, 1, 0, 0.5294118, 1,
1.367501, -1.194654, 3.473932, 1, 0, 0.5215687, 1,
1.371818, 1.475692, 1.375173, 1, 0, 0.5176471, 1,
1.372495, 0.9946186, 1.115124, 1, 0, 0.509804, 1,
1.38363, -1.359211, 3.006003, 1, 0, 0.5058824, 1,
1.386357, 0.004910703, 1.687996, 1, 0, 0.4980392, 1,
1.39076, -0.5613047, 1.978359, 1, 0, 0.4901961, 1,
1.398358, -1.710971, 2.485622, 1, 0, 0.4862745, 1,
1.40202, -1.742909, 3.626861, 1, 0, 0.4784314, 1,
1.403307, -0.2823251, 1.425809, 1, 0, 0.4745098, 1,
1.411738, -1.864224, 3.233037, 1, 0, 0.4666667, 1,
1.448327, -0.4378911, 1.672513, 1, 0, 0.4627451, 1,
1.451661, -0.1492781, 1.685798, 1, 0, 0.454902, 1,
1.452149, -0.1453051, 1.255836, 1, 0, 0.4509804, 1,
1.471995, 1.629379, -0.1367578, 1, 0, 0.4431373, 1,
1.474463, -0.09694617, 1.289185, 1, 0, 0.4392157, 1,
1.48807, -0.6353574, -0.1984504, 1, 0, 0.4313726, 1,
1.498638, 0.09584626, 2.017456, 1, 0, 0.427451, 1,
1.506804, -0.8076416, 0.7856856, 1, 0, 0.4196078, 1,
1.518861, 1.068767, 1.959099, 1, 0, 0.4156863, 1,
1.526816, 0.5277985, 0.7515385, 1, 0, 0.4078431, 1,
1.530224, 0.8281777, 3.508241, 1, 0, 0.4039216, 1,
1.539071, 2.398372, 0.8024508, 1, 0, 0.3960784, 1,
1.541308, -0.6604705, 3.122401, 1, 0, 0.3882353, 1,
1.546244, -1.831833, 3.280116, 1, 0, 0.3843137, 1,
1.547252, 0.04152956, 2.931152, 1, 0, 0.3764706, 1,
1.555946, 0.6795351, 1.19677, 1, 0, 0.372549, 1,
1.585769, 0.3134456, 1.104739, 1, 0, 0.3647059, 1,
1.594592, -0.1137907, 2.294392, 1, 0, 0.3607843, 1,
1.605235, -0.1806763, 0.3981273, 1, 0, 0.3529412, 1,
1.61139, -1.602689, 1.571305, 1, 0, 0.3490196, 1,
1.629016, 1.455401, 0.6080177, 1, 0, 0.3411765, 1,
1.639762, -0.2684071, 0.5015159, 1, 0, 0.3372549, 1,
1.652535, 0.9064646, 0.7982092, 1, 0, 0.3294118, 1,
1.666538, -0.2216171, 1.1449, 1, 0, 0.3254902, 1,
1.680138, -0.6378579, 2.060763, 1, 0, 0.3176471, 1,
1.681779, 1.306597, 1.301077, 1, 0, 0.3137255, 1,
1.685009, -0.009878529, 2.431111, 1, 0, 0.3058824, 1,
1.689313, -0.1350819, 3.613655, 1, 0, 0.2980392, 1,
1.69363, -0.2719443, 2.628326, 1, 0, 0.2941177, 1,
1.698084, -0.07498623, 1.463822, 1, 0, 0.2862745, 1,
1.706049, -0.2466571, 2.96557, 1, 0, 0.282353, 1,
1.70828, 0.05265411, 2.141298, 1, 0, 0.2745098, 1,
1.71422, -0.731907, 0.9467587, 1, 0, 0.2705882, 1,
1.734069, -0.04761901, 3.363431, 1, 0, 0.2627451, 1,
1.739625, -1.167774, 2.295161, 1, 0, 0.2588235, 1,
1.769734, 0.4784088, 0.500801, 1, 0, 0.2509804, 1,
1.776483, 1.165932, 0.8248991, 1, 0, 0.2470588, 1,
1.780384, -0.1695651, -0.3324438, 1, 0, 0.2392157, 1,
1.80142, 0.3868625, 3.271444, 1, 0, 0.2352941, 1,
1.803763, -2.027388, 3.515779, 1, 0, 0.227451, 1,
1.818359, 1.77225, -1.819848, 1, 0, 0.2235294, 1,
1.823205, 0.1463629, 0.06615834, 1, 0, 0.2156863, 1,
1.851591, -1.125763, 1.716521, 1, 0, 0.2117647, 1,
1.858759, -0.06274166, 1.892933, 1, 0, 0.2039216, 1,
1.874134, 1.19669, 1.147967, 1, 0, 0.1960784, 1,
1.88105, 1.298664, 3.183774, 1, 0, 0.1921569, 1,
1.883373, 0.2212405, 0.5933902, 1, 0, 0.1843137, 1,
1.917249, -1.929504, 3.453641, 1, 0, 0.1803922, 1,
1.91912, 0.3380697, 0.2800287, 1, 0, 0.172549, 1,
1.942153, -0.6723024, 0.4490935, 1, 0, 0.1686275, 1,
2.003039, 0.01321496, -0.1029677, 1, 0, 0.1607843, 1,
2.01076, 1.842045, -0.01939973, 1, 0, 0.1568628, 1,
2.017046, 0.04980888, 2.795141, 1, 0, 0.1490196, 1,
2.03282, 1.103197, 2.165488, 1, 0, 0.145098, 1,
2.041449, -0.1710706, 1.677111, 1, 0, 0.1372549, 1,
2.057011, 0.2790475, 1.473835, 1, 0, 0.1333333, 1,
2.057559, 0.3696362, 2.522408, 1, 0, 0.1254902, 1,
2.154363, -0.1854791, -0.5696899, 1, 0, 0.1215686, 1,
2.168601, -0.3382591, -0.1760615, 1, 0, 0.1137255, 1,
2.179856, 0.5936072, 2.062697, 1, 0, 0.1098039, 1,
2.208717, 2.178065, 0.486563, 1, 0, 0.1019608, 1,
2.21619, -0.551899, 3.042277, 1, 0, 0.09411765, 1,
2.266509, 2.090033, 0.1051381, 1, 0, 0.09019608, 1,
2.267074, 0.2912917, 0.2555449, 1, 0, 0.08235294, 1,
2.281009, 0.2072175, 0.9532766, 1, 0, 0.07843138, 1,
2.319768, 0.4078162, 2.15167, 1, 0, 0.07058824, 1,
2.365551, 0.2290131, 0.7947895, 1, 0, 0.06666667, 1,
2.440396, 0.4705628, -0.1114928, 1, 0, 0.05882353, 1,
2.454673, 0.1008815, 0.5008487, 1, 0, 0.05490196, 1,
2.477182, 2.365392, 1.67394, 1, 0, 0.04705882, 1,
2.480115, 0.3244312, 1.33213, 1, 0, 0.04313726, 1,
2.495471, -0.6394383, 1.704803, 1, 0, 0.03529412, 1,
2.560749, 1.654871, -0.5339518, 1, 0, 0.03137255, 1,
2.647698, 1.112898, 0.6888848, 1, 0, 0.02352941, 1,
2.996082, -1.508919, 2.285177, 1, 0, 0.01960784, 1,
3.105311, 0.704108, 0.6168737, 1, 0, 0.01176471, 1,
3.328828, -1.088844, 3.046745, 1, 0, 0.007843138, 1
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
0.1534332, -4.059149, -7.511769, 0, -0.5, 0.5, 0.5,
0.1534332, -4.059149, -7.511769, 1, -0.5, 0.5, 0.5,
0.1534332, -4.059149, -7.511769, 1, 1.5, 0.5, 0.5,
0.1534332, -4.059149, -7.511769, 0, 1.5, 0.5, 0.5
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
-4.098421, 0.7711535, -7.511769, 0, -0.5, 0.5, 0.5,
-4.098421, 0.7711535, -7.511769, 1, -0.5, 0.5, 0.5,
-4.098421, 0.7711535, -7.511769, 1, 1.5, 0.5, 0.5,
-4.098421, 0.7711535, -7.511769, 0, 1.5, 0.5, 0.5
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
-4.098421, -4.059149, 0.09581876, 0, -0.5, 0.5, 0.5,
-4.098421, -4.059149, 0.09581876, 1, -0.5, 0.5, 0.5,
-4.098421, -4.059149, 0.09581876, 1, 1.5, 0.5, 0.5,
-4.098421, -4.059149, 0.09581876, 0, 1.5, 0.5, 0.5
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
-3, -2.944464, -5.756172,
3, -2.944464, -5.756172,
-3, -2.944464, -5.756172,
-3, -3.130245, -6.048772,
-2, -2.944464, -5.756172,
-2, -3.130245, -6.048772,
-1, -2.944464, -5.756172,
-1, -3.130245, -6.048772,
0, -2.944464, -5.756172,
0, -3.130245, -6.048772,
1, -2.944464, -5.756172,
1, -3.130245, -6.048772,
2, -2.944464, -5.756172,
2, -3.130245, -6.048772,
3, -2.944464, -5.756172,
3, -3.130245, -6.048772
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
-3, -3.501807, -6.633971, 0, -0.5, 0.5, 0.5,
-3, -3.501807, -6.633971, 1, -0.5, 0.5, 0.5,
-3, -3.501807, -6.633971, 1, 1.5, 0.5, 0.5,
-3, -3.501807, -6.633971, 0, 1.5, 0.5, 0.5,
-2, -3.501807, -6.633971, 0, -0.5, 0.5, 0.5,
-2, -3.501807, -6.633971, 1, -0.5, 0.5, 0.5,
-2, -3.501807, -6.633971, 1, 1.5, 0.5, 0.5,
-2, -3.501807, -6.633971, 0, 1.5, 0.5, 0.5,
-1, -3.501807, -6.633971, 0, -0.5, 0.5, 0.5,
-1, -3.501807, -6.633971, 1, -0.5, 0.5, 0.5,
-1, -3.501807, -6.633971, 1, 1.5, 0.5, 0.5,
-1, -3.501807, -6.633971, 0, 1.5, 0.5, 0.5,
0, -3.501807, -6.633971, 0, -0.5, 0.5, 0.5,
0, -3.501807, -6.633971, 1, -0.5, 0.5, 0.5,
0, -3.501807, -6.633971, 1, 1.5, 0.5, 0.5,
0, -3.501807, -6.633971, 0, 1.5, 0.5, 0.5,
1, -3.501807, -6.633971, 0, -0.5, 0.5, 0.5,
1, -3.501807, -6.633971, 1, -0.5, 0.5, 0.5,
1, -3.501807, -6.633971, 1, 1.5, 0.5, 0.5,
1, -3.501807, -6.633971, 0, 1.5, 0.5, 0.5,
2, -3.501807, -6.633971, 0, -0.5, 0.5, 0.5,
2, -3.501807, -6.633971, 1, -0.5, 0.5, 0.5,
2, -3.501807, -6.633971, 1, 1.5, 0.5, 0.5,
2, -3.501807, -6.633971, 0, 1.5, 0.5, 0.5,
3, -3.501807, -6.633971, 0, -0.5, 0.5, 0.5,
3, -3.501807, -6.633971, 1, -0.5, 0.5, 0.5,
3, -3.501807, -6.633971, 1, 1.5, 0.5, 0.5,
3, -3.501807, -6.633971, 0, 1.5, 0.5, 0.5
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
-3.117224, -2, -5.756172,
-3.117224, 4, -5.756172,
-3.117224, -2, -5.756172,
-3.280757, -2, -6.048772,
-3.117224, 0, -5.756172,
-3.280757, 0, -6.048772,
-3.117224, 2, -5.756172,
-3.280757, 2, -6.048772,
-3.117224, 4, -5.756172,
-3.280757, 4, -6.048772
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
-3.607822, -2, -6.633971, 0, -0.5, 0.5, 0.5,
-3.607822, -2, -6.633971, 1, -0.5, 0.5, 0.5,
-3.607822, -2, -6.633971, 1, 1.5, 0.5, 0.5,
-3.607822, -2, -6.633971, 0, 1.5, 0.5, 0.5,
-3.607822, 0, -6.633971, 0, -0.5, 0.5, 0.5,
-3.607822, 0, -6.633971, 1, -0.5, 0.5, 0.5,
-3.607822, 0, -6.633971, 1, 1.5, 0.5, 0.5,
-3.607822, 0, -6.633971, 0, 1.5, 0.5, 0.5,
-3.607822, 2, -6.633971, 0, -0.5, 0.5, 0.5,
-3.607822, 2, -6.633971, 1, -0.5, 0.5, 0.5,
-3.607822, 2, -6.633971, 1, 1.5, 0.5, 0.5,
-3.607822, 2, -6.633971, 0, 1.5, 0.5, 0.5,
-3.607822, 4, -6.633971, 0, -0.5, 0.5, 0.5,
-3.607822, 4, -6.633971, 1, -0.5, 0.5, 0.5,
-3.607822, 4, -6.633971, 1, 1.5, 0.5, 0.5,
-3.607822, 4, -6.633971, 0, 1.5, 0.5, 0.5
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
-3.117224, -2.944464, -4,
-3.117224, -2.944464, 4,
-3.117224, -2.944464, -4,
-3.280757, -3.130245, -4,
-3.117224, -2.944464, -2,
-3.280757, -3.130245, -2,
-3.117224, -2.944464, 0,
-3.280757, -3.130245, 0,
-3.117224, -2.944464, 2,
-3.280757, -3.130245, 2,
-3.117224, -2.944464, 4,
-3.280757, -3.130245, 4
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
-3.607822, -3.501807, -4, 0, -0.5, 0.5, 0.5,
-3.607822, -3.501807, -4, 1, -0.5, 0.5, 0.5,
-3.607822, -3.501807, -4, 1, 1.5, 0.5, 0.5,
-3.607822, -3.501807, -4, 0, 1.5, 0.5, 0.5,
-3.607822, -3.501807, -2, 0, -0.5, 0.5, 0.5,
-3.607822, -3.501807, -2, 1, -0.5, 0.5, 0.5,
-3.607822, -3.501807, -2, 1, 1.5, 0.5, 0.5,
-3.607822, -3.501807, -2, 0, 1.5, 0.5, 0.5,
-3.607822, -3.501807, 0, 0, -0.5, 0.5, 0.5,
-3.607822, -3.501807, 0, 1, -0.5, 0.5, 0.5,
-3.607822, -3.501807, 0, 1, 1.5, 0.5, 0.5,
-3.607822, -3.501807, 0, 0, 1.5, 0.5, 0.5,
-3.607822, -3.501807, 2, 0, -0.5, 0.5, 0.5,
-3.607822, -3.501807, 2, 1, -0.5, 0.5, 0.5,
-3.607822, -3.501807, 2, 1, 1.5, 0.5, 0.5,
-3.607822, -3.501807, 2, 0, 1.5, 0.5, 0.5,
-3.607822, -3.501807, 4, 0, -0.5, 0.5, 0.5,
-3.607822, -3.501807, 4, 1, -0.5, 0.5, 0.5,
-3.607822, -3.501807, 4, 1, 1.5, 0.5, 0.5,
-3.607822, -3.501807, 4, 0, 1.5, 0.5, 0.5
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
-3.117224, -2.944464, -5.756172,
-3.117224, 4.486771, -5.756172,
-3.117224, -2.944464, 5.94781,
-3.117224, 4.486771, 5.94781,
-3.117224, -2.944464, -5.756172,
-3.117224, -2.944464, 5.94781,
-3.117224, 4.486771, -5.756172,
-3.117224, 4.486771, 5.94781,
-3.117224, -2.944464, -5.756172,
3.42409, -2.944464, -5.756172,
-3.117224, -2.944464, 5.94781,
3.42409, -2.944464, 5.94781,
-3.117224, 4.486771, -5.756172,
3.42409, 4.486771, -5.756172,
-3.117224, 4.486771, 5.94781,
3.42409, 4.486771, 5.94781,
3.42409, -2.944464, -5.756172,
3.42409, 4.486771, -5.756172,
3.42409, -2.944464, 5.94781,
3.42409, 4.486771, 5.94781,
3.42409, -2.944464, -5.756172,
3.42409, -2.944464, 5.94781,
3.42409, 4.486771, -5.756172,
3.42409, 4.486771, 5.94781
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
var radius = 8.185684;
var distance = 36.41903;
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
mvMatrix.translate( -0.1534332, -0.7711535, -0.09581876 );
mvMatrix.scale( 1.353019, 1.190989, 0.7561976 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.41903);
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
flonicamid<-read.table("flonicamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flonicamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'flonicamid' not found
```

```r
y<-flonicamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'flonicamid' not found
```

```r
z<-flonicamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'flonicamid' not found
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
-3.021962, 2.209133, 0.8953198, 0, 0, 1, 1, 1,
-2.925107, 0.0661492, 0.3219275, 1, 0, 0, 1, 1,
-2.838325, 1.378953, -1.921864, 1, 0, 0, 1, 1,
-2.823163, 0.2616238, -3.033397, 1, 0, 0, 1, 1,
-2.571265, 0.6501043, -1.61264, 1, 0, 0, 1, 1,
-2.559547, -0.6747725, -2.81555, 1, 0, 0, 1, 1,
-2.519789, -0.5078915, -3.437456, 0, 0, 0, 1, 1,
-2.514264, -0.1019214, -2.073745, 0, 0, 0, 1, 1,
-2.474595, -0.3956461, -2.774514, 0, 0, 0, 1, 1,
-2.459269, 2.393193, -0.6030491, 0, 0, 0, 1, 1,
-2.441535, 1.236276, -0.2896177, 0, 0, 0, 1, 1,
-2.430448, -0.1755102, -2.041843, 0, 0, 0, 1, 1,
-2.415016, 0.8226658, -0.758334, 0, 0, 0, 1, 1,
-2.3737, -1.252492, -1.485855, 1, 1, 1, 1, 1,
-2.277566, -1.309639, -0.8341088, 1, 1, 1, 1, 1,
-2.213813, 0.09306893, -1.20222, 1, 1, 1, 1, 1,
-2.191517, -0.01085504, -0.2372192, 1, 1, 1, 1, 1,
-2.17804, -1.330652, -2.680568, 1, 1, 1, 1, 1,
-2.131609, -0.5397412, -3.863561, 1, 1, 1, 1, 1,
-2.124645, -0.8181382, -2.737265, 1, 1, 1, 1, 1,
-2.085056, 0.419283, -2.441905, 1, 1, 1, 1, 1,
-2.079508, -0.8164964, -1.909879, 1, 1, 1, 1, 1,
-2.051951, -0.392573, -1.862403, 1, 1, 1, 1, 1,
-2.04784, -1.083732, -0.7607405, 1, 1, 1, 1, 1,
-1.905308, -0.7662032, -1.499052, 1, 1, 1, 1, 1,
-1.888443, -1.089841, -2.020261, 1, 1, 1, 1, 1,
-1.878448, -1.663717, -2.777091, 1, 1, 1, 1, 1,
-1.865446, 2.950542, -1.747229, 1, 1, 1, 1, 1,
-1.864775, -0.5457134, -1.21621, 0, 0, 1, 1, 1,
-1.863197, 0.02427916, 0.1835192, 1, 0, 0, 1, 1,
-1.862354, -0.6320852, -2.022641, 1, 0, 0, 1, 1,
-1.807337, -1.307977, -2.545421, 1, 0, 0, 1, 1,
-1.807179, 0.6309227, 0.3340186, 1, 0, 0, 1, 1,
-1.7917, -0.0543084, -0.6021264, 1, 0, 0, 1, 1,
-1.783247, -0.6121176, -1.292069, 0, 0, 0, 1, 1,
-1.764332, 1.02729, -2.290818, 0, 0, 0, 1, 1,
-1.755055, -0.0545233, -1.765781, 0, 0, 0, 1, 1,
-1.739361, 0.08880084, -0.885265, 0, 0, 0, 1, 1,
-1.735192, -1.106395, -2.373724, 0, 0, 0, 1, 1,
-1.735137, -0.6224884, -2.387205, 0, 0, 0, 1, 1,
-1.731667, -0.9714259, -1.73172, 0, 0, 0, 1, 1,
-1.729576, 1.295732, -1.919295, 1, 1, 1, 1, 1,
-1.72867, 0.0246098, -1.799288, 1, 1, 1, 1, 1,
-1.717914, -0.3548568, -1.085365, 1, 1, 1, 1, 1,
-1.697613, -1.761929, -2.934451, 1, 1, 1, 1, 1,
-1.697499, -0.9641398, -1.469393, 1, 1, 1, 1, 1,
-1.688427, 0.3852906, -1.74629, 1, 1, 1, 1, 1,
-1.681385, -0.5498382, -2.637409, 1, 1, 1, 1, 1,
-1.669379, -0.5594748, -0.3597445, 1, 1, 1, 1, 1,
-1.666754, -1.045292, -1.034312, 1, 1, 1, 1, 1,
-1.66178, -1.300327, -2.477735, 1, 1, 1, 1, 1,
-1.661253, 0.3310451, 0.2120254, 1, 1, 1, 1, 1,
-1.654883, -0.3672575, -1.903794, 1, 1, 1, 1, 1,
-1.641944, 2.697387, -1.645274, 1, 1, 1, 1, 1,
-1.613117, -0.1728466, -2.331969, 1, 1, 1, 1, 1,
-1.60525, 1.467168, -2.127476, 1, 1, 1, 1, 1,
-1.603859, 1.702159, 0.2718133, 0, 0, 1, 1, 1,
-1.599264, -1.583691, -2.008996, 1, 0, 0, 1, 1,
-1.588379, 0.5307285, -1.705633, 1, 0, 0, 1, 1,
-1.587276, 0.4381759, -0.7055084, 1, 0, 0, 1, 1,
-1.582622, -0.5635708, -1.842866, 1, 0, 0, 1, 1,
-1.582499, -1.829082, -0.9714721, 1, 0, 0, 1, 1,
-1.5817, 0.8046454, -1.358496, 0, 0, 0, 1, 1,
-1.58002, -1.466262, -1.576783, 0, 0, 0, 1, 1,
-1.571815, 0.1986219, -3.78142, 0, 0, 0, 1, 1,
-1.554864, -0.4956375, -1.917105, 0, 0, 0, 1, 1,
-1.55486, -1.162109, -3.10747, 0, 0, 0, 1, 1,
-1.554142, -0.5912154, 0.135355, 0, 0, 0, 1, 1,
-1.540961, 1.447176, -1.025114, 0, 0, 0, 1, 1,
-1.535784, -0.1269619, -2.301906, 1, 1, 1, 1, 1,
-1.530946, -0.9928614, -0.1172247, 1, 1, 1, 1, 1,
-1.530622, 1.210313, -1.409685, 1, 1, 1, 1, 1,
-1.508122, 0.8439673, 0.6780463, 1, 1, 1, 1, 1,
-1.485127, 1.398096, -1.306699, 1, 1, 1, 1, 1,
-1.484347, 0.02121741, -3.846189, 1, 1, 1, 1, 1,
-1.479241, 0.4107203, -3.507932, 1, 1, 1, 1, 1,
-1.47765, 0.9243487, -1.353446, 1, 1, 1, 1, 1,
-1.473047, 0.4988509, -1.478793, 1, 1, 1, 1, 1,
-1.460755, -0.349261, -0.0769286, 1, 1, 1, 1, 1,
-1.457908, -0.9240307, -2.085424, 1, 1, 1, 1, 1,
-1.456135, 0.6867818, -1.259985, 1, 1, 1, 1, 1,
-1.45529, -0.8964546, -1.655065, 1, 1, 1, 1, 1,
-1.453744, 1.363819, -2.017599, 1, 1, 1, 1, 1,
-1.445217, 0.5220277, 2.639064, 1, 1, 1, 1, 1,
-1.443748, 0.07122723, -2.726123, 0, 0, 1, 1, 1,
-1.440481, -0.6406139, -2.316856, 1, 0, 0, 1, 1,
-1.436993, -1.562667, 0.296212, 1, 0, 0, 1, 1,
-1.436195, -1.112668, -1.334372, 1, 0, 0, 1, 1,
-1.419325, -1.94214, -2.821422, 1, 0, 0, 1, 1,
-1.41657, 0.7668279, 0.8509951, 1, 0, 0, 1, 1,
-1.41535, -0.08084135, -0.7457944, 0, 0, 0, 1, 1,
-1.411983, -1.597085, -0.7693781, 0, 0, 0, 1, 1,
-1.410656, 0.1089754, -1.482224, 0, 0, 0, 1, 1,
-1.41047, 1.974941, -1.838354, 0, 0, 0, 1, 1,
-1.397161, 0.4057809, -2.118373, 0, 0, 0, 1, 1,
-1.386989, 0.9123641, -0.7864439, 0, 0, 0, 1, 1,
-1.386622, -0.5296962, -3.569066, 0, 0, 0, 1, 1,
-1.384362, -0.7357747, -2.682024, 1, 1, 1, 1, 1,
-1.377062, -1.203882, -4.521413, 1, 1, 1, 1, 1,
-1.375912, 1.275187, -1.136599, 1, 1, 1, 1, 1,
-1.369717, 1.339702, -1.17054, 1, 1, 1, 1, 1,
-1.361415, -0.162509, -1.886367, 1, 1, 1, 1, 1,
-1.357442, -0.07195795, -2.178648, 1, 1, 1, 1, 1,
-1.353849, -0.112861, -1.962511, 1, 1, 1, 1, 1,
-1.352269, 1.44932, -1.704491, 1, 1, 1, 1, 1,
-1.346174, -0.4247424, -1.589634, 1, 1, 1, 1, 1,
-1.344624, -0.2855344, -2.069003, 1, 1, 1, 1, 1,
-1.339263, 0.09186865, -1.582244, 1, 1, 1, 1, 1,
-1.336417, 0.8747594, -0.519154, 1, 1, 1, 1, 1,
-1.332535, 0.0866714, -3.416155, 1, 1, 1, 1, 1,
-1.329184, -1.240145, -3.329407, 1, 1, 1, 1, 1,
-1.318957, 0.2622449, -1.776267, 1, 1, 1, 1, 1,
-1.306538, -1.165779, -2.148003, 0, 0, 1, 1, 1,
-1.301212, 0.9900874, -1.272243, 1, 0, 0, 1, 1,
-1.285618, 0.205442, -1.658586, 1, 0, 0, 1, 1,
-1.283182, -0.7718926, -3.37972, 1, 0, 0, 1, 1,
-1.265672, 0.8854312, 1.264678, 1, 0, 0, 1, 1,
-1.26244, 0.421208, 0.01145895, 1, 0, 0, 1, 1,
-1.252762, -0.9777645, -2.362414, 0, 0, 0, 1, 1,
-1.246279, -1.450734, -2.585075, 0, 0, 0, 1, 1,
-1.232679, -0.4859018, -1.453972, 0, 0, 0, 1, 1,
-1.229301, 0.1987173, -1.832076, 0, 0, 0, 1, 1,
-1.224279, 1.810899, -0.4881284, 0, 0, 0, 1, 1,
-1.216745, 0.3550699, -2.203189, 0, 0, 0, 1, 1,
-1.213815, 0.9295342, -1.152598, 0, 0, 0, 1, 1,
-1.204177, 1.146705, -2.081115, 1, 1, 1, 1, 1,
-1.198094, -2.146775, -2.034514, 1, 1, 1, 1, 1,
-1.1976, 0.5901007, -0.3098355, 1, 1, 1, 1, 1,
-1.196356, 0.350475, -0.825756, 1, 1, 1, 1, 1,
-1.18199, 1.370901, 1.10442, 1, 1, 1, 1, 1,
-1.180972, 0.2326576, -1.707464, 1, 1, 1, 1, 1,
-1.160834, -1.558922, -2.959854, 1, 1, 1, 1, 1,
-1.160299, -0.7388531, -0.1244841, 1, 1, 1, 1, 1,
-1.154082, 0.8031775, -2.512768, 1, 1, 1, 1, 1,
-1.146377, -0.1185032, -3.35451, 1, 1, 1, 1, 1,
-1.145256, -0.1557375, -1.19762, 1, 1, 1, 1, 1,
-1.140229, -0.924698, -2.382708, 1, 1, 1, 1, 1,
-1.140112, -1.287517, -1.560193, 1, 1, 1, 1, 1,
-1.136729, -1.106358, -4.341681, 1, 1, 1, 1, 1,
-1.135435, 0.764401, 0.9085904, 1, 1, 1, 1, 1,
-1.127339, 0.1795154, -2.53464, 0, 0, 1, 1, 1,
-1.121455, -0.6905899, -2.964037, 1, 0, 0, 1, 1,
-1.111062, 0.2828907, -1.239165, 1, 0, 0, 1, 1,
-1.103453, -0.1526098, -1.691556, 1, 0, 0, 1, 1,
-1.102823, 2.12019, 0.090599, 1, 0, 0, 1, 1,
-1.096413, 0.08526506, -0.3011051, 1, 0, 0, 1, 1,
-1.093085, -0.1313307, -1.349185, 0, 0, 0, 1, 1,
-1.083495, 0.7852231, -0.1067662, 0, 0, 0, 1, 1,
-1.080337, -0.8646373, -1.810458, 0, 0, 0, 1, 1,
-1.077978, -0.46861, -1.90485, 0, 0, 0, 1, 1,
-1.074602, 1.715335, -1.257962, 0, 0, 0, 1, 1,
-1.074431, 0.2704634, -3.264919, 0, 0, 0, 1, 1,
-1.073487, 1.900153, -0.9201182, 0, 0, 0, 1, 1,
-1.068915, -0.3113821, -1.31627, 1, 1, 1, 1, 1,
-1.067692, -1.562114, -1.62468, 1, 1, 1, 1, 1,
-1.063389, 1.057985, -0.7780616, 1, 1, 1, 1, 1,
-1.061634, 0.05209268, 0.6556862, 1, 1, 1, 1, 1,
-1.058152, -0.03827315, -2.671145, 1, 1, 1, 1, 1,
-1.054052, -0.4222333, -1.273202, 1, 1, 1, 1, 1,
-1.051453, 0.4023378, -1.799991, 1, 1, 1, 1, 1,
-1.048206, -0.9600088, -1.600369, 1, 1, 1, 1, 1,
-1.047479, -1.778681, -3.085357, 1, 1, 1, 1, 1,
-1.042828, 0.1959541, -0.7065674, 1, 1, 1, 1, 1,
-1.038168, -0.9234966, -3.21359, 1, 1, 1, 1, 1,
-1.037595, 0.8915675, -1.525165, 1, 1, 1, 1, 1,
-1.037029, 0.5467037, -0.6341065, 1, 1, 1, 1, 1,
-1.026922, -0.08032955, -3.959578, 1, 1, 1, 1, 1,
-1.025881, -0.3231332, -3.383479, 1, 1, 1, 1, 1,
-1.023928, 0.9412611, -0.8124875, 0, 0, 1, 1, 1,
-1.018077, 1.628451, -1.290996, 1, 0, 0, 1, 1,
-1.017645, -0.2940823, -1.228812, 1, 0, 0, 1, 1,
-1.012799, 0.4869741, -1.295364, 1, 0, 0, 1, 1,
-1.003332, 0.4786559, -2.899933, 1, 0, 0, 1, 1,
-1.002884, 0.6313887, -0.100016, 1, 0, 0, 1, 1,
-1.000745, -1.855048, -2.824119, 0, 0, 0, 1, 1,
-0.9976516, 0.9518752, -1.42916, 0, 0, 0, 1, 1,
-0.9859402, 1.27872, 0.7137132, 0, 0, 0, 1, 1,
-0.985108, -0.8882672, -3.017016, 0, 0, 0, 1, 1,
-0.9818813, -0.3439733, -3.094333, 0, 0, 0, 1, 1,
-0.9706497, -0.7251916, -1.333792, 0, 0, 0, 1, 1,
-0.9686566, 0.122338, 1.542102, 0, 0, 0, 1, 1,
-0.9611573, -2.012554, -0.913175, 1, 1, 1, 1, 1,
-0.950978, 1.432773, 1.288399, 1, 1, 1, 1, 1,
-0.9463638, 0.3794297, -0.38281, 1, 1, 1, 1, 1,
-0.9441051, 0.07169662, -3.243476, 1, 1, 1, 1, 1,
-0.9393837, 0.8925669, -0.9194574, 1, 1, 1, 1, 1,
-0.9389153, -0.839321, -0.9529475, 1, 1, 1, 1, 1,
-0.9368027, 0.6821312, -1.544428, 1, 1, 1, 1, 1,
-0.9346562, 0.9365196, -0.3081622, 1, 1, 1, 1, 1,
-0.9323061, 0.9105839, 0.6014889, 1, 1, 1, 1, 1,
-0.9320039, -2.345675, -3.677137, 1, 1, 1, 1, 1,
-0.9308918, 0.7091447, -2.659323, 1, 1, 1, 1, 1,
-0.9249225, 0.2613254, -1.237135, 1, 1, 1, 1, 1,
-0.9210064, -0.6300004, -0.4462266, 1, 1, 1, 1, 1,
-0.9141127, 0.7120501, -0.1112742, 1, 1, 1, 1, 1,
-0.9113239, -0.8265132, -0.7219574, 1, 1, 1, 1, 1,
-0.9103915, 0.07713579, 1.238906, 0, 0, 1, 1, 1,
-0.9079375, -0.7692225, -2.317388, 1, 0, 0, 1, 1,
-0.9057238, 0.7828528, -1.437114, 1, 0, 0, 1, 1,
-0.9043567, 1.588044, -0.7759835, 1, 0, 0, 1, 1,
-0.8983724, -1.627534, -2.071769, 1, 0, 0, 1, 1,
-0.8934554, 1.790508, 0.9683523, 1, 0, 0, 1, 1,
-0.888293, -0.09229613, -0.8804945, 0, 0, 0, 1, 1,
-0.8882103, -0.692813, -2.386121, 0, 0, 0, 1, 1,
-0.8875523, -0.456468, -2.102115, 0, 0, 0, 1, 1,
-0.8831182, -0.3078803, -3.337076, 0, 0, 0, 1, 1,
-0.8786264, 1.533656, -2.604641, 0, 0, 0, 1, 1,
-0.8695833, 0.04141141, -1.693097, 0, 0, 0, 1, 1,
-0.8674086, 0.1699898, -0.346082, 0, 0, 0, 1, 1,
-0.8662539, -2.050882, -4.082672, 1, 1, 1, 1, 1,
-0.8622403, -0.4025314, -3.00442, 1, 1, 1, 1, 1,
-0.8599828, 0.2831666, -1.13733, 1, 1, 1, 1, 1,
-0.8581858, 0.477844, 0.2419357, 1, 1, 1, 1, 1,
-0.8575267, 2.564548, -1.651945, 1, 1, 1, 1, 1,
-0.8530731, 1.143833, -0.7208529, 1, 1, 1, 1, 1,
-0.8501744, -0.4523869, -2.987604, 1, 1, 1, 1, 1,
-0.8496262, -0.9402239, -1.895307, 1, 1, 1, 1, 1,
-0.8440254, 0.4923943, -1.160606, 1, 1, 1, 1, 1,
-0.8434958, -1.150961, -1.895783, 1, 1, 1, 1, 1,
-0.8295851, 1.56857, -1.2219, 1, 1, 1, 1, 1,
-0.829062, -1.0406, -3.238731, 1, 1, 1, 1, 1,
-0.8175377, -1.069481, -2.275335, 1, 1, 1, 1, 1,
-0.8138155, 0.4076253, -0.2797547, 1, 1, 1, 1, 1,
-0.806004, -0.3083296, 0.2429142, 1, 1, 1, 1, 1,
-0.8030897, 0.849504, 0.1685283, 0, 0, 1, 1, 1,
-0.8007042, -1.716981, -1.18445, 1, 0, 0, 1, 1,
-0.7998349, -0.1356038, -2.31876, 1, 0, 0, 1, 1,
-0.7969435, 0.7620611, -0.7334215, 1, 0, 0, 1, 1,
-0.7952092, 0.07107747, -0.8483031, 1, 0, 0, 1, 1,
-0.7911623, 0.4015311, -0.8907223, 1, 0, 0, 1, 1,
-0.790206, 1.144995, 0.8885188, 0, 0, 0, 1, 1,
-0.7893225, 1.017644, 0.6353042, 0, 0, 0, 1, 1,
-0.788919, -1.010293, -2.010253, 0, 0, 0, 1, 1,
-0.7821705, -0.1980078, 0.5171336, 0, 0, 0, 1, 1,
-0.7818311, -0.2965148, -1.232507, 0, 0, 0, 1, 1,
-0.7816007, -0.1255582, -2.311892, 0, 0, 0, 1, 1,
-0.771338, -0.4136853, -2.37824, 0, 0, 0, 1, 1,
-0.764084, 0.2375308, -1.058152, 1, 1, 1, 1, 1,
-0.763568, 0.611572, 0.2514624, 1, 1, 1, 1, 1,
-0.762448, 1.01231, -0.1447019, 1, 1, 1, 1, 1,
-0.7619305, -0.5554755, 0.4824795, 1, 1, 1, 1, 1,
-0.7612652, -0.5651107, -2.195846, 1, 1, 1, 1, 1,
-0.7589311, 0.6914302, -2.118427, 1, 1, 1, 1, 1,
-0.7568027, 0.1927041, -2.89062, 1, 1, 1, 1, 1,
-0.7564034, 0.5542449, -2.085363, 1, 1, 1, 1, 1,
-0.7456327, 0.8058376, -0.6560263, 1, 1, 1, 1, 1,
-0.7357535, 0.2993402, -0.2969489, 1, 1, 1, 1, 1,
-0.7344899, 1.664168, -0.6253661, 1, 1, 1, 1, 1,
-0.7336959, 1.448516, 0.8580638, 1, 1, 1, 1, 1,
-0.7309483, -0.6455753, -1.257986, 1, 1, 1, 1, 1,
-0.7267683, -1.06751, -1.426886, 1, 1, 1, 1, 1,
-0.7238889, 0.801185, -0.4175979, 1, 1, 1, 1, 1,
-0.715213, 0.8172892, -0.2111709, 0, 0, 1, 1, 1,
-0.7143289, 0.5927866, -0.444215, 1, 0, 0, 1, 1,
-0.7088754, 2.139243, 0.2512326, 1, 0, 0, 1, 1,
-0.708755, 0.04275168, -2.581651, 1, 0, 0, 1, 1,
-0.697892, 1.698268, -2.25543, 1, 0, 0, 1, 1,
-0.69504, -0.07963112, -0.7435656, 1, 0, 0, 1, 1,
-0.688562, 0.2554964, -1.563978, 0, 0, 0, 1, 1,
-0.6821485, -1.028928, -3.172169, 0, 0, 0, 1, 1,
-0.6813132, 1.605232, -0.1694142, 0, 0, 0, 1, 1,
-0.6760916, -1.971352, -3.065468, 0, 0, 0, 1, 1,
-0.6738366, -1.512109, -1.461574, 0, 0, 0, 1, 1,
-0.6726397, -2.040806, -3.955267, 0, 0, 0, 1, 1,
-0.6663118, -1.351722, -1.745387, 0, 0, 0, 1, 1,
-0.6605963, -0.1474295, -0.1909117, 1, 1, 1, 1, 1,
-0.6589283, -1.078677, -2.084009, 1, 1, 1, 1, 1,
-0.6557607, 0.01111815, -0.7606358, 1, 1, 1, 1, 1,
-0.6556627, -1.288431, -1.950852, 1, 1, 1, 1, 1,
-0.6547285, 0.9497723, -0.6112809, 1, 1, 1, 1, 1,
-0.6525685, 0.5310783, 0.2985153, 1, 1, 1, 1, 1,
-0.6503363, -0.704868, -3.91393, 1, 1, 1, 1, 1,
-0.6457423, 1.02345, 0.6708425, 1, 1, 1, 1, 1,
-0.6454927, 2.041357, 2.248412, 1, 1, 1, 1, 1,
-0.6414691, -1.559039, -2.099166, 1, 1, 1, 1, 1,
-0.6354959, 2.284501, -2.399552, 1, 1, 1, 1, 1,
-0.6318047, 1.341798, 0.04343208, 1, 1, 1, 1, 1,
-0.6253237, -0.9703256, -1.731516, 1, 1, 1, 1, 1,
-0.6250296, 0.4223424, -1.456594, 1, 1, 1, 1, 1,
-0.6245669, 0.1178261, -0.3894325, 1, 1, 1, 1, 1,
-0.62023, -0.5033267, -1.357261, 0, 0, 1, 1, 1,
-0.6176064, -1.322013, -0.7839718, 1, 0, 0, 1, 1,
-0.6172995, 0.6127324, -0.9700273, 1, 0, 0, 1, 1,
-0.6144999, 0.2335988, -1.158583, 1, 0, 0, 1, 1,
-0.6130465, -0.3199803, -2.08494, 1, 0, 0, 1, 1,
-0.6082938, 0.1519002, -0.4395041, 1, 0, 0, 1, 1,
-0.6043131, 0.5380624, -1.699814, 0, 0, 0, 1, 1,
-0.6040878, 1.047859, -0.5060875, 0, 0, 0, 1, 1,
-0.600976, -0.08159876, -2.037345, 0, 0, 0, 1, 1,
-0.5941441, 1.169513, -1.411095, 0, 0, 0, 1, 1,
-0.5903114, -1.598882, -3.182715, 0, 0, 0, 1, 1,
-0.5857334, -0.5274462, -2.754969, 0, 0, 0, 1, 1,
-0.5851564, 0.8977761, -1.785545, 0, 0, 0, 1, 1,
-0.5801046, -0.206452, -2.378997, 1, 1, 1, 1, 1,
-0.5787343, 0.1632862, -0.05786099, 1, 1, 1, 1, 1,
-0.5770873, 1.552816, -1.494852, 1, 1, 1, 1, 1,
-0.5644982, 0.4970812, -0.4758117, 1, 1, 1, 1, 1,
-0.5641429, -0.3088075, -1.845436, 1, 1, 1, 1, 1,
-0.5560297, 0.02248065, -0.8515623, 1, 1, 1, 1, 1,
-0.5521308, 0.1530409, -3.559134, 1, 1, 1, 1, 1,
-0.5510582, -0.4881818, -1.51357, 1, 1, 1, 1, 1,
-0.5508428, 0.1008117, 0.2473014, 1, 1, 1, 1, 1,
-0.5486126, 1.268796, -0.4426579, 1, 1, 1, 1, 1,
-0.5457928, 0.1438335, -1.018863, 1, 1, 1, 1, 1,
-0.545218, 0.7985025, 1.911684, 1, 1, 1, 1, 1,
-0.5401452, -1.740751, -5.581277, 1, 1, 1, 1, 1,
-0.540032, 1.667978, 0.5073192, 1, 1, 1, 1, 1,
-0.5356818, -1.395843, -3.279677, 1, 1, 1, 1, 1,
-0.5335798, 1.138677, 0.7156654, 0, 0, 1, 1, 1,
-0.5305967, 1.174775, -0.2038365, 1, 0, 0, 1, 1,
-0.5238227, 0.6818092, -0.5731169, 1, 0, 0, 1, 1,
-0.5207797, -2.164057, -3.646996, 1, 0, 0, 1, 1,
-0.5197145, -0.3708659, -0.5684021, 1, 0, 0, 1, 1,
-0.5156157, -1.948747, -2.292452, 1, 0, 0, 1, 1,
-0.5156119, -0.817477, -3.947095, 0, 0, 0, 1, 1,
-0.5110056, -2.494005, -3.821225, 0, 0, 0, 1, 1,
-0.5067058, -0.7895932, -3.146082, 0, 0, 0, 1, 1,
-0.5049672, -0.7177725, -1.678051, 0, 0, 0, 1, 1,
-0.501633, -0.6638182, -3.375046, 0, 0, 0, 1, 1,
-0.4999841, -0.1392682, -2.486096, 0, 0, 0, 1, 1,
-0.4989946, 0.4398144, -0.7291836, 0, 0, 0, 1, 1,
-0.4978947, -0.5223699, -2.848858, 1, 1, 1, 1, 1,
-0.4967642, -1.285419, -4.668283, 1, 1, 1, 1, 1,
-0.4932114, 1.26237, 0.1756884, 1, 1, 1, 1, 1,
-0.4917958, 1.20145, -0.6516641, 1, 1, 1, 1, 1,
-0.4912226, 0.3629902, -0.9261255, 1, 1, 1, 1, 1,
-0.4907571, -0.2419103, -0.9282117, 1, 1, 1, 1, 1,
-0.4903504, -0.6887411, -2.415262, 1, 1, 1, 1, 1,
-0.4887285, -1.578894, -5.585726, 1, 1, 1, 1, 1,
-0.483693, -0.4428802, -2.555773, 1, 1, 1, 1, 1,
-0.4836318, 0.02874912, -2.243435, 1, 1, 1, 1, 1,
-0.4835683, 0.4192981, -2.115392, 1, 1, 1, 1, 1,
-0.4812863, -0.7905377, -1.72626, 1, 1, 1, 1, 1,
-0.4808059, 0.1599021, -0.7654217, 1, 1, 1, 1, 1,
-0.4748248, 1.924077, -1.283273, 1, 1, 1, 1, 1,
-0.4723651, -0.5588381, -4.644797, 1, 1, 1, 1, 1,
-0.4620018, 0.4375326, 0.3055658, 0, 0, 1, 1, 1,
-0.4584013, 1.117281, -0.1901523, 1, 0, 0, 1, 1,
-0.4562012, 1.724158, -0.6440406, 1, 0, 0, 1, 1,
-0.4561018, 0.3097449, -1.777287, 1, 0, 0, 1, 1,
-0.4560852, 0.8629892, 0.6621192, 1, 0, 0, 1, 1,
-0.4540397, -0.1279301, -2.622084, 1, 0, 0, 1, 1,
-0.447088, -1.110825, -3.872566, 0, 0, 0, 1, 1,
-0.4459765, 0.3553912, 0.3521883, 0, 0, 0, 1, 1,
-0.438026, 0.4235768, -1.0485, 0, 0, 0, 1, 1,
-0.4352146, -0.8632098, -3.457051, 0, 0, 0, 1, 1,
-0.43489, 1.600159, -1.353436, 0, 0, 0, 1, 1,
-0.4331265, 0.07264468, -0.04705317, 0, 0, 0, 1, 1,
-0.4324537, -0.6369345, -1.945809, 0, 0, 0, 1, 1,
-0.4300209, 0.2375512, -0.01993483, 1, 1, 1, 1, 1,
-0.4298995, -1.462111, -0.249611, 1, 1, 1, 1, 1,
-0.4268129, 1.275373, 1.058543, 1, 1, 1, 1, 1,
-0.4187107, 1.563243, -1.999058, 1, 1, 1, 1, 1,
-0.4184799, 1.971138, -0.2109949, 1, 1, 1, 1, 1,
-0.4181399, -0.1891958, -3.361542, 1, 1, 1, 1, 1,
-0.4137485, -1.184222, -3.722298, 1, 1, 1, 1, 1,
-0.4131396, 0.158712, 0.1764414, 1, 1, 1, 1, 1,
-0.4074636, 0.5034769, -0.3798766, 1, 1, 1, 1, 1,
-0.4060527, -0.3944482, -3.172693, 1, 1, 1, 1, 1,
-0.4004706, 0.07365393, -0.3488729, 1, 1, 1, 1, 1,
-0.4001177, 1.714236, -0.1280341, 1, 1, 1, 1, 1,
-0.3973353, -1.351239, -4.994142, 1, 1, 1, 1, 1,
-0.3969595, -0.889115, -4.6206, 1, 1, 1, 1, 1,
-0.3956829, 0.7218324, -0.4704785, 1, 1, 1, 1, 1,
-0.391659, -0.8402174, -1.151112, 0, 0, 1, 1, 1,
-0.3912904, 1.020585, -0.3524577, 1, 0, 0, 1, 1,
-0.3909129, -0.5682618, -1.578796, 1, 0, 0, 1, 1,
-0.389463, 0.3189387, -2.502769, 1, 0, 0, 1, 1,
-0.3886942, -0.3591543, -2.460116, 1, 0, 0, 1, 1,
-0.3883651, -0.6355757, -3.711853, 1, 0, 0, 1, 1,
-0.3870021, 2.376488, 2.502495, 0, 0, 0, 1, 1,
-0.3850782, -1.333827, -3.296518, 0, 0, 0, 1, 1,
-0.3842092, 0.1136013, -1.109616, 0, 0, 0, 1, 1,
-0.3809082, -0.674343, -3.046868, 0, 0, 0, 1, 1,
-0.3774612, -1.275459, -2.301056, 0, 0, 0, 1, 1,
-0.3742357, 0.3306697, -1.151899, 0, 0, 0, 1, 1,
-0.3726173, -0.1540269, -2.328441, 0, 0, 0, 1, 1,
-0.3637906, 1.524166, -0.471339, 1, 1, 1, 1, 1,
-0.3628213, -0.1583055, -1.265126, 1, 1, 1, 1, 1,
-0.3607525, -1.549449, -2.032869, 1, 1, 1, 1, 1,
-0.360278, 0.2826054, 1.162676, 1, 1, 1, 1, 1,
-0.35937, 0.2931564, 1.113116, 1, 1, 1, 1, 1,
-0.3493369, 1.110201, 0.2074358, 1, 1, 1, 1, 1,
-0.3458289, -0.05840306, -2.092976, 1, 1, 1, 1, 1,
-0.3456944, 0.2002916, 1.209867, 1, 1, 1, 1, 1,
-0.3450982, -0.1933281, -2.039543, 1, 1, 1, 1, 1,
-0.3448053, 1.361926, -1.616535, 1, 1, 1, 1, 1,
-0.3435891, -2.114301, -1.756702, 1, 1, 1, 1, 1,
-0.3387246, 0.5200933, -1.478501, 1, 1, 1, 1, 1,
-0.3367983, 0.1565371, -2.999162, 1, 1, 1, 1, 1,
-0.3325252, -0.5268811, -3.003625, 1, 1, 1, 1, 1,
-0.3270845, 0.2731293, 0.1382928, 1, 1, 1, 1, 1,
-0.3249792, -0.507899, -3.081572, 0, 0, 1, 1, 1,
-0.3233087, 0.6100348, -0.834105, 1, 0, 0, 1, 1,
-0.3207254, -1.146304, -4.003164, 1, 0, 0, 1, 1,
-0.3189756, 1.197128, -0.7238702, 1, 0, 0, 1, 1,
-0.3167299, -1.046013, -2.191947, 1, 0, 0, 1, 1,
-0.3161673, 0.6428829, -1.167165, 1, 0, 0, 1, 1,
-0.3132902, 0.6751537, 0.02612388, 0, 0, 0, 1, 1,
-0.301101, 1.371403, -1.570019, 0, 0, 0, 1, 1,
-0.3001187, 1.757539, -0.3607643, 0, 0, 0, 1, 1,
-0.299577, -0.46641, -3.570007, 0, 0, 0, 1, 1,
-0.2968982, 0.6360157, 1.202634, 0, 0, 0, 1, 1,
-0.292312, 0.3587187, 0.2471576, 0, 0, 0, 1, 1,
-0.2920601, -1.451506, -4.31415, 0, 0, 0, 1, 1,
-0.2898708, -0.7998018, -2.029111, 1, 1, 1, 1, 1,
-0.2874491, 1.487743, -1.172994, 1, 1, 1, 1, 1,
-0.2862345, -0.1701063, -2.469048, 1, 1, 1, 1, 1,
-0.2826444, 0.2512077, -2.297089, 1, 1, 1, 1, 1,
-0.2822511, 0.6746676, 0.06958211, 1, 1, 1, 1, 1,
-0.2812922, -0.7743492, -3.693365, 1, 1, 1, 1, 1,
-0.2801545, 2.173218, -1.031439, 1, 1, 1, 1, 1,
-0.2779136, 1.764315, -0.4593137, 1, 1, 1, 1, 1,
-0.2777032, -0.7341825, -2.218126, 1, 1, 1, 1, 1,
-0.2737445, -2.471246, -3.160354, 1, 1, 1, 1, 1,
-0.2729602, 0.09565951, -2.413131, 1, 1, 1, 1, 1,
-0.2713583, 0.5148238, 1.597195, 1, 1, 1, 1, 1,
-0.2660883, 0.5806288, -0.2162402, 1, 1, 1, 1, 1,
-0.2607045, 2.510616, 0.1895795, 1, 1, 1, 1, 1,
-0.2586544, -0.16089, -2.32637, 1, 1, 1, 1, 1,
-0.2585314, 0.7186893, -0.9095259, 0, 0, 1, 1, 1,
-0.2565652, -0.7979495, -4.568483, 1, 0, 0, 1, 1,
-0.2501386, 0.7644106, -1.641601, 1, 0, 0, 1, 1,
-0.2500827, -1.060875, -3.711946, 1, 0, 0, 1, 1,
-0.2495144, 0.3328315, -1.489029, 1, 0, 0, 1, 1,
-0.2484737, -1.368157, -2.607482, 1, 0, 0, 1, 1,
-0.2414, 1.88041, -0.07247951, 0, 0, 0, 1, 1,
-0.2396583, -0.05630445, -1.354986, 0, 0, 0, 1, 1,
-0.2389692, 1.090233, 1.591632, 0, 0, 0, 1, 1,
-0.2388381, 0.4212052, -0.8142875, 0, 0, 0, 1, 1,
-0.2370434, 1.152153, -1.693497, 0, 0, 0, 1, 1,
-0.2293579, 0.8877691, -0.3790717, 0, 0, 0, 1, 1,
-0.2292012, 1.141678, -0.450341, 0, 0, 0, 1, 1,
-0.2238534, -1.755191, -2.51421, 1, 1, 1, 1, 1,
-0.2212603, -2.026459, -3.194744, 1, 1, 1, 1, 1,
-0.2211845, -0.7260062, -2.529372, 1, 1, 1, 1, 1,
-0.2141194, -0.2605924, -3.295595, 1, 1, 1, 1, 1,
-0.2116033, -0.3089917, -1.940557, 1, 1, 1, 1, 1,
-0.2096693, 0.1574361, -1.093946, 1, 1, 1, 1, 1,
-0.2068208, 1.314558, -0.7033714, 1, 1, 1, 1, 1,
-0.2008274, -0.3718224, -3.29992, 1, 1, 1, 1, 1,
-0.1970851, -0.1325503, -3.238886, 1, 1, 1, 1, 1,
-0.1958436, 0.6395503, 0.2514891, 1, 1, 1, 1, 1,
-0.1933563, 1.692128, -0.9581867, 1, 1, 1, 1, 1,
-0.1932166, 1.376492, 0.5069633, 1, 1, 1, 1, 1,
-0.192668, 1.207521, 0.6986109, 1, 1, 1, 1, 1,
-0.1917764, -1.100272, -2.682847, 1, 1, 1, 1, 1,
-0.1898397, -1.799268, -4.263288, 1, 1, 1, 1, 1,
-0.1886266, 1.047731, -1.240219, 0, 0, 1, 1, 1,
-0.1831025, -0.5900264, -3.591057, 1, 0, 0, 1, 1,
-0.180547, -1.462572, -3.542279, 1, 0, 0, 1, 1,
-0.1799313, -0.3410541, -2.918221, 1, 0, 0, 1, 1,
-0.1790745, -1.802581, -3.8648, 1, 0, 0, 1, 1,
-0.1773002, 0.4044133, 0.2453833, 1, 0, 0, 1, 1,
-0.1741528, -0.9911246, -4.17661, 0, 0, 0, 1, 1,
-0.1721712, -0.0850425, -1.389087, 0, 0, 0, 1, 1,
-0.1658218, -1.568529, -3.631086, 0, 0, 0, 1, 1,
-0.165659, -0.5842686, -2.490671, 0, 0, 0, 1, 1,
-0.1649633, -1.050527, -3.857711, 0, 0, 0, 1, 1,
-0.1649623, -1.529632, -2.397923, 0, 0, 0, 1, 1,
-0.1638262, -0.9358363, -3.182692, 0, 0, 0, 1, 1,
-0.1598708, -0.9879226, -3.439057, 1, 1, 1, 1, 1,
-0.1569923, 0.2896698, -0.3158358, 1, 1, 1, 1, 1,
-0.1563068, -0.3203135, -3.74787, 1, 1, 1, 1, 1,
-0.1561046, -2.089166, -1.858758, 1, 1, 1, 1, 1,
-0.154344, -0.1695533, -2.479681, 1, 1, 1, 1, 1,
-0.153928, 1.489276, 1.279406, 1, 1, 1, 1, 1,
-0.1522353, -0.02408754, -3.203829, 1, 1, 1, 1, 1,
-0.1490153, -0.2767495, -3.065889, 1, 1, 1, 1, 1,
-0.147799, 1.045737, 1.051144, 1, 1, 1, 1, 1,
-0.1417292, -0.6983373, -3.001302, 1, 1, 1, 1, 1,
-0.1404759, -0.2344717, -2.818956, 1, 1, 1, 1, 1,
-0.1293741, 0.5848169, -0.8412379, 1, 1, 1, 1, 1,
-0.1282725, -0.4122951, -2.762619, 1, 1, 1, 1, 1,
-0.1263549, -0.154891, -2.23218, 1, 1, 1, 1, 1,
-0.1245866, 1.715714, 0.1165889, 1, 1, 1, 1, 1,
-0.1207367, 0.6962222, 1.614684, 0, 0, 1, 1, 1,
-0.1202538, 0.950601, -1.365987, 1, 0, 0, 1, 1,
-0.1193081, -0.5155234, -3.238791, 1, 0, 0, 1, 1,
-0.1138156, 1.87291, -0.4482279, 1, 0, 0, 1, 1,
-0.1104203, -0.8661911, -4.738256, 1, 0, 0, 1, 1,
-0.1085204, -0.5447722, -3.017265, 1, 0, 0, 1, 1,
-0.1070081, -1.316016, -3.589068, 0, 0, 0, 1, 1,
-0.103539, 0.5244079, 1.106741, 0, 0, 0, 1, 1,
-0.1015911, 0.2649387, -0.8236337, 0, 0, 0, 1, 1,
-0.1006834, 0.3315363, -0.7551587, 0, 0, 0, 1, 1,
-0.09914949, -1.301434, -2.195769, 0, 0, 0, 1, 1,
-0.09836005, 0.2056004, 0.09049696, 0, 0, 0, 1, 1,
-0.097776, -0.5899162, -3.428277, 0, 0, 0, 1, 1,
-0.09354403, 1.799071, -0.9969202, 1, 1, 1, 1, 1,
-0.09140753, -0.02278378, -0.7935638, 1, 1, 1, 1, 1,
-0.08852983, -0.3995661, -4.074608, 1, 1, 1, 1, 1,
-0.08666372, -0.1884139, -2.431393, 1, 1, 1, 1, 1,
-0.08188465, 1.747018, 0.6521646, 1, 1, 1, 1, 1,
-0.08162227, -0.2182889, -2.312908, 1, 1, 1, 1, 1,
-0.07931183, -0.1421262, -3.467426, 1, 1, 1, 1, 1,
-0.07181548, 0.1031208, -0.1479627, 1, 1, 1, 1, 1,
-0.07067503, 1.372205, 0.5171919, 1, 1, 1, 1, 1,
-0.07026746, -0.1537789, -3.954804, 1, 1, 1, 1, 1,
-0.06893751, 0.4997608, -1.167554, 1, 1, 1, 1, 1,
-0.0679386, -0.05902341, -2.08355, 1, 1, 1, 1, 1,
-0.06462597, 0.4908282, -0.03413777, 1, 1, 1, 1, 1,
-0.06458618, 0.2111332, -1.243636, 1, 1, 1, 1, 1,
-0.06450108, -1.415765, -2.060319, 1, 1, 1, 1, 1,
-0.06425893, -0.5742248, -3.183003, 0, 0, 1, 1, 1,
-0.0584967, -0.8489974, -0.9116654, 1, 0, 0, 1, 1,
-0.05675413, -2.630161, -3.243546, 1, 0, 0, 1, 1,
-0.04766224, -1.453158, -3.302449, 1, 0, 0, 1, 1,
-0.04765537, -0.1319019, -3.984024, 1, 0, 0, 1, 1,
-0.04643576, -1.443184, -3.466979, 1, 0, 0, 1, 1,
-0.04189541, 0.4449045, -0.8501309, 0, 0, 0, 1, 1,
-0.04111757, 1.302906, 0.4093014, 0, 0, 0, 1, 1,
-0.04070945, -0.372627, -3.294499, 0, 0, 0, 1, 1,
-0.03959097, -2.094681, -2.3312, 0, 0, 0, 1, 1,
-0.03888847, -0.5906106, -2.531097, 0, 0, 0, 1, 1,
-0.03797606, -0.509516, -3.711733, 0, 0, 0, 1, 1,
-0.03758852, 1.408759, -0.4499425, 0, 0, 0, 1, 1,
-0.03676942, -0.4447352, -4.932889, 1, 1, 1, 1, 1,
-0.0356034, -0.7901446, -3.732651, 1, 1, 1, 1, 1,
-0.03210609, -0.2979168, -1.470831, 1, 1, 1, 1, 1,
-0.03180616, 1.343822, -0.7398353, 1, 1, 1, 1, 1,
-0.03053126, 1.550408, 1.663226, 1, 1, 1, 1, 1,
-0.02982176, 0.620303, 0.2861844, 1, 1, 1, 1, 1,
-0.02478391, 1.730705, -0.2424073, 1, 1, 1, 1, 1,
-0.02025379, 2.264671, 1.595337, 1, 1, 1, 1, 1,
-0.01765103, 0.9327163, 0.6511453, 1, 1, 1, 1, 1,
-0.01730377, -0.0714329, -3.855938, 1, 1, 1, 1, 1,
-0.01434148, 0.6962323, -0.07622749, 1, 1, 1, 1, 1,
-0.0141029, -0.9717638, -3.142282, 1, 1, 1, 1, 1,
-0.01170032, 1.753742, 0.6717482, 1, 1, 1, 1, 1,
-0.01079009, 0.1292018, 0.3046237, 1, 1, 1, 1, 1,
-0.009329123, -0.7507117, -2.438824, 1, 1, 1, 1, 1,
-0.008231683, 1.415733, 0.208474, 0, 0, 1, 1, 1,
-0.006635078, 1.330885, 0.447366, 1, 0, 0, 1, 1,
-0.00488801, -1.187359, -2.25865, 1, 0, 0, 1, 1,
-0.001938266, 0.4486841, 0.8877487, 1, 0, 0, 1, 1,
0.002919165, -1.527892, 3.067871, 1, 0, 0, 1, 1,
0.007440964, -0.3880281, 3.553333, 1, 0, 0, 1, 1,
0.00800541, 0.6272684, 1.196077, 0, 0, 0, 1, 1,
0.01041062, 1.567508, 0.1343772, 0, 0, 0, 1, 1,
0.0158391, -0.1669956, 3.520521, 0, 0, 0, 1, 1,
0.01653164, -1.318221, 3.819291, 0, 0, 0, 1, 1,
0.01906822, 0.2930005, 0.4700524, 0, 0, 0, 1, 1,
0.02436859, 0.6798373, 1.728895, 0, 0, 0, 1, 1,
0.02678585, 1.222847, -0.7738488, 0, 0, 0, 1, 1,
0.03382384, 0.6530961, 0.503811, 1, 1, 1, 1, 1,
0.03627059, -0.1093663, 2.801212, 1, 1, 1, 1, 1,
0.03793251, -0.8007372, 4.518295, 1, 1, 1, 1, 1,
0.0383872, -0.5423083, 2.186345, 1, 1, 1, 1, 1,
0.05155142, -0.2514159, 1.386585, 1, 1, 1, 1, 1,
0.05297657, -0.527383, 2.672844, 1, 1, 1, 1, 1,
0.05508897, 0.1856484, 1.637823, 1, 1, 1, 1, 1,
0.0556714, -0.9383483, 1.17446, 1, 1, 1, 1, 1,
0.05769666, -0.07861114, 2.582018, 1, 1, 1, 1, 1,
0.05824671, -0.1527974, 3.442005, 1, 1, 1, 1, 1,
0.06020634, 0.1436562, 1.874241, 1, 1, 1, 1, 1,
0.06123409, -0.1699013, 2.915105, 1, 1, 1, 1, 1,
0.06152278, -0.1725737, 1.485566, 1, 1, 1, 1, 1,
0.06375971, 0.5964352, 0.3343259, 1, 1, 1, 1, 1,
0.06432503, -0.8389455, 2.976079, 1, 1, 1, 1, 1,
0.07152223, -0.3569582, 2.535511, 0, 0, 1, 1, 1,
0.07209819, 0.3744312, -1.096031, 1, 0, 0, 1, 1,
0.07572293, 0.3013235, -0.5821152, 1, 0, 0, 1, 1,
0.07694488, -0.1578494, 2.539542, 1, 0, 0, 1, 1,
0.09930401, -1.487823, 3.238879, 1, 0, 0, 1, 1,
0.09970914, 0.07799901, 0.5240576, 1, 0, 0, 1, 1,
0.1065005, -0.5288146, 1.198971, 0, 0, 0, 1, 1,
0.1091232, 2.163577, 1.534412, 0, 0, 0, 1, 1,
0.112984, 1.6912, -0.04620804, 0, 0, 0, 1, 1,
0.1166489, -0.3283246, 3.960918, 0, 0, 0, 1, 1,
0.1194322, 0.09274703, 0.919733, 0, 0, 0, 1, 1,
0.1206343, 1.114075, 0.613448, 0, 0, 0, 1, 1,
0.1234263, 1.013592, -0.8004305, 0, 0, 0, 1, 1,
0.1235557, -1.033992, 3.624368, 1, 1, 1, 1, 1,
0.1252195, 0.1281639, 1.129282, 1, 1, 1, 1, 1,
0.1266543, 0.596052, -1.798084, 1, 1, 1, 1, 1,
0.1300731, 0.2577904, 1.406469, 1, 1, 1, 1, 1,
0.1374669, -2.444901, 1.604889, 1, 1, 1, 1, 1,
0.1424975, 1.747334, -0.6949607, 1, 1, 1, 1, 1,
0.1438906, 0.9351873, 0.8037502, 1, 1, 1, 1, 1,
0.1500292, -0.7904937, 2.410158, 1, 1, 1, 1, 1,
0.1563649, 1.70869, 1.751618, 1, 1, 1, 1, 1,
0.1568988, -0.8647526, 2.730184, 1, 1, 1, 1, 1,
0.1589352, 0.8368849, -0.928724, 1, 1, 1, 1, 1,
0.1604059, 0.6289436, 0.08381067, 1, 1, 1, 1, 1,
0.1644396, 1.333617, 0.1272277, 1, 1, 1, 1, 1,
0.1672916, 0.2856195, 0.4789831, 1, 1, 1, 1, 1,
0.1821677, -0.1650214, 2.949043, 1, 1, 1, 1, 1,
0.1849234, 0.5831931, 0.1977812, 0, 0, 1, 1, 1,
0.1877601, 1.081017, 1.028057, 1, 0, 0, 1, 1,
0.1878847, -1.478623, 5.777363, 1, 0, 0, 1, 1,
0.1921721, 0.6017152, 0.632488, 1, 0, 0, 1, 1,
0.1937104, 0.467449, 0.05302031, 1, 0, 0, 1, 1,
0.1945127, 0.2312678, 1.048596, 1, 0, 0, 1, 1,
0.1956092, -0.6980428, 2.637258, 0, 0, 0, 1, 1,
0.1968335, 0.2609141, 0.4702543, 0, 0, 0, 1, 1,
0.1973321, 0.3862983, -0.7838657, 0, 0, 0, 1, 1,
0.1992411, 0.8453685, -0.4742527, 0, 0, 0, 1, 1,
0.2056162, 0.8305932, 2.083836, 0, 0, 0, 1, 1,
0.2061286, -0.1133003, 2.520606, 0, 0, 0, 1, 1,
0.2089825, 0.8093185, 0.1544787, 0, 0, 0, 1, 1,
0.2126894, -1.094247, 2.625982, 1, 1, 1, 1, 1,
0.2167753, 0.6956391, 1.569308, 1, 1, 1, 1, 1,
0.2217086, -0.1112451, 2.019945, 1, 1, 1, 1, 1,
0.2223833, 0.03688319, 1.488557, 1, 1, 1, 1, 1,
0.2241663, 0.4682197, 0.2284028, 1, 1, 1, 1, 1,
0.2243162, -1.291643, 3.209242, 1, 1, 1, 1, 1,
0.2281047, 1.173849, -0.5463625, 1, 1, 1, 1, 1,
0.2330383, 0.006640651, 0.8391433, 1, 1, 1, 1, 1,
0.2358735, -1.224831, 4.087825, 1, 1, 1, 1, 1,
0.2403534, 0.6635116, -1.244527, 1, 1, 1, 1, 1,
0.2421567, 0.3448521, 2.074443, 1, 1, 1, 1, 1,
0.2424248, -0.4856826, 3.429342, 1, 1, 1, 1, 1,
0.2431476, -1.064441, 2.945066, 1, 1, 1, 1, 1,
0.244351, 0.3201119, 0.5957714, 1, 1, 1, 1, 1,
0.245669, -0.985715, 2.996514, 1, 1, 1, 1, 1,
0.2472591, -0.2983597, 1.678952, 0, 0, 1, 1, 1,
0.2478966, 0.5240222, 2.131231, 1, 0, 0, 1, 1,
0.2500689, -1.076761, 4.569498, 1, 0, 0, 1, 1,
0.251192, 0.3633554, 1.476122, 1, 0, 0, 1, 1,
0.251237, 1.208975, 2.091346, 1, 0, 0, 1, 1,
0.2519915, 0.3543667, 1.043057, 1, 0, 0, 1, 1,
0.2550167, 2.067267, 0.957038, 0, 0, 0, 1, 1,
0.2564592, 1.616305, 0.1001102, 0, 0, 0, 1, 1,
0.2575267, -0.227814, 2.162767, 0, 0, 0, 1, 1,
0.2598851, 0.6815389, 0.6583967, 0, 0, 0, 1, 1,
0.2611286, -1.906068, 2.281233, 0, 0, 0, 1, 1,
0.2630391, 1.466456, -0.5268149, 0, 0, 0, 1, 1,
0.2653334, 0.8483717, 0.145289, 0, 0, 0, 1, 1,
0.2658811, 1.490656, 1.500068, 1, 1, 1, 1, 1,
0.2679078, -1.217449, 3.12293, 1, 1, 1, 1, 1,
0.2706277, -0.4504829, 2.178028, 1, 1, 1, 1, 1,
0.2768022, -0.9004163, 3.082426, 1, 1, 1, 1, 1,
0.2823523, 0.5037627, -0.6765689, 1, 1, 1, 1, 1,
0.2841913, 0.8236316, 0.8972209, 1, 1, 1, 1, 1,
0.2844948, 1.946194, 2.229528, 1, 1, 1, 1, 1,
0.2869024, -1.331692, 3.538555, 1, 1, 1, 1, 1,
0.2878734, 0.6940286, -1.577987, 1, 1, 1, 1, 1,
0.2919568, -0.502716, 3.349829, 1, 1, 1, 1, 1,
0.2938381, -2.307784, 2.701192, 1, 1, 1, 1, 1,
0.2940404, -0.7829381, 2.357767, 1, 1, 1, 1, 1,
0.2989853, -0.2982916, 1.354124, 1, 1, 1, 1, 1,
0.2995128, -0.7670181, 4.630661, 1, 1, 1, 1, 1,
0.3017153, -0.04713802, -0.6303591, 1, 1, 1, 1, 1,
0.3080823, -0.03337263, 1.275681, 0, 0, 1, 1, 1,
0.3092111, -0.05569744, 2.642412, 1, 0, 0, 1, 1,
0.3109696, 1.468854, -0.4487412, 1, 0, 0, 1, 1,
0.3138548, -0.8069953, 2.034498, 1, 0, 0, 1, 1,
0.3152364, 1.028882, 0.3450355, 1, 0, 0, 1, 1,
0.3201858, 0.2153104, 1.586815, 1, 0, 0, 1, 1,
0.3237927, -0.07907612, 0.2800296, 0, 0, 0, 1, 1,
0.3249439, 0.4910539, -0.04048504, 0, 0, 0, 1, 1,
0.3264222, 0.2584695, 0.2439416, 0, 0, 0, 1, 1,
0.3299819, 0.4056551, 0.3452998, 0, 0, 0, 1, 1,
0.3342337, -0.8534079, 3.289055, 0, 0, 0, 1, 1,
0.3360053, -0.1671625, 2.519637, 0, 0, 0, 1, 1,
0.3374597, 0.795826, 0.4238104, 0, 0, 0, 1, 1,
0.340347, -0.8119533, 0.6692906, 1, 1, 1, 1, 1,
0.340703, -0.6542289, 2.363729, 1, 1, 1, 1, 1,
0.3414452, 1.447298, -1.846004, 1, 1, 1, 1, 1,
0.348361, -1.041809, 1.666744, 1, 1, 1, 1, 1,
0.3552202, 0.01469692, 0.6924438, 1, 1, 1, 1, 1,
0.3554807, -1.001603, 1.875326, 1, 1, 1, 1, 1,
0.3558857, 0.2244818, 1.481912, 1, 1, 1, 1, 1,
0.3615532, -0.9511864, 2.597979, 1, 1, 1, 1, 1,
0.3642687, 0.5624315, 0.7633687, 1, 1, 1, 1, 1,
0.3672701, 1.973904, -1.040468, 1, 1, 1, 1, 1,
0.3681132, -0.2639562, 1.769065, 1, 1, 1, 1, 1,
0.3682654, -0.6337098, 0.4225982, 1, 1, 1, 1, 1,
0.3692411, 0.3941848, 1.971565, 1, 1, 1, 1, 1,
0.3721818, 0.3155567, 0.5412238, 1, 1, 1, 1, 1,
0.3805713, 0.07451127, 2.444683, 1, 1, 1, 1, 1,
0.380887, -0.5941767, 2.859843, 0, 0, 1, 1, 1,
0.387126, -0.5646873, 2.033928, 1, 0, 0, 1, 1,
0.387351, 1.100359, -0.2785026, 1, 0, 0, 1, 1,
0.3879071, 0.8157939, 0.8285332, 1, 0, 0, 1, 1,
0.3887414, -0.7144383, 1.817359, 1, 0, 0, 1, 1,
0.3945933, -1.196612, 1.641866, 1, 0, 0, 1, 1,
0.3959342, 0.8480336, 4.409522, 0, 0, 0, 1, 1,
0.3959463, -0.02465203, 2.691907, 0, 0, 0, 1, 1,
0.4005932, 0.3487839, 2.817264, 0, 0, 0, 1, 1,
0.4030005, -0.7074694, 3.090917, 0, 0, 0, 1, 1,
0.4074143, 1.15018, 1.304168, 0, 0, 0, 1, 1,
0.4084305, -0.1135881, 2.120439, 0, 0, 0, 1, 1,
0.4092486, -0.425835, 2.24053, 0, 0, 0, 1, 1,
0.4162455, 0.7986299, 1.062779, 1, 1, 1, 1, 1,
0.4167344, -0.7978649, 1.983827, 1, 1, 1, 1, 1,
0.4192797, -1.560176, 2.780681, 1, 1, 1, 1, 1,
0.4215119, -0.7123336, 2.628116, 1, 1, 1, 1, 1,
0.4242416, 0.08476645, 2.205251, 1, 1, 1, 1, 1,
0.4282516, 0.01233223, 2.678046, 1, 1, 1, 1, 1,
0.4320057, 0.5577435, -1.244985, 1, 1, 1, 1, 1,
0.4321287, 0.0164597, -0.6995965, 1, 1, 1, 1, 1,
0.4326522, 0.05773453, 1.234652, 1, 1, 1, 1, 1,
0.4328417, -0.3500233, 2.706363, 1, 1, 1, 1, 1,
0.4424503, 0.5827159, 1.764636, 1, 1, 1, 1, 1,
0.4428744, -0.4368209, 1.956899, 1, 1, 1, 1, 1,
0.4446976, 1.199561, 0.9995887, 1, 1, 1, 1, 1,
0.4494089, -0.07492901, 1.240058, 1, 1, 1, 1, 1,
0.4496908, 0.2991621, 1.361968, 1, 1, 1, 1, 1,
0.4521607, -0.4605491, 2.005446, 0, 0, 1, 1, 1,
0.4522454, -1.168889, 2.147543, 1, 0, 0, 1, 1,
0.4545802, 0.4246525, -0.7937733, 1, 0, 0, 1, 1,
0.4553452, -0.2950601, -0.1420766, 1, 0, 0, 1, 1,
0.4590023, -1.037948, 1.023258, 1, 0, 0, 1, 1,
0.4610201, 2.593748, 0.1711739, 1, 0, 0, 1, 1,
0.4627923, 0.416675, 1.305652, 0, 0, 0, 1, 1,
0.4630463, -1.155016, 3.142841, 0, 0, 0, 1, 1,
0.4639346, 0.8651455, 0.9305022, 0, 0, 0, 1, 1,
0.4766942, -1.14737, 2.443506, 0, 0, 0, 1, 1,
0.4780848, 0.008568476, -0.5208634, 0, 0, 0, 1, 1,
0.4817666, 0.224957, 1.890759, 0, 0, 0, 1, 1,
0.4836042, 0.02202143, 0.9616082, 0, 0, 0, 1, 1,
0.4837098, 0.4443896, 0.7487559, 1, 1, 1, 1, 1,
0.4941856, -0.493963, 3.674153, 1, 1, 1, 1, 1,
0.4958707, -0.9850077, 3.814236, 1, 1, 1, 1, 1,
0.4962968, 1.689872, 0.6529544, 1, 1, 1, 1, 1,
0.4977895, -1.28432, 4.467745, 1, 1, 1, 1, 1,
0.4978859, 0.7483321, -0.833727, 1, 1, 1, 1, 1,
0.4988418, -1.135869, 1.58579, 1, 1, 1, 1, 1,
0.5026397, 0.9030353, 0.4456718, 1, 1, 1, 1, 1,
0.5028813, 1.193191, -1.329175, 1, 1, 1, 1, 1,
0.5054963, 1.163743, 0.6935848, 1, 1, 1, 1, 1,
0.5096771, -0.5379337, 2.240187, 1, 1, 1, 1, 1,
0.5116897, -0.3977796, 1.615933, 1, 1, 1, 1, 1,
0.5196438, -0.9223083, 3.394815, 1, 1, 1, 1, 1,
0.5261948, 0.4471408, -0.1009808, 1, 1, 1, 1, 1,
0.5368311, 1.322237, -0.6686289, 1, 1, 1, 1, 1,
0.536979, -0.201089, 2.687818, 0, 0, 1, 1, 1,
0.5389242, 0.6163195, 1.915558, 1, 0, 0, 1, 1,
0.5390263, 0.1994274, 2.253246, 1, 0, 0, 1, 1,
0.5413395, -2.378446, 3.513866, 1, 0, 0, 1, 1,
0.5413747, -0.9664066, 2.785386, 1, 0, 0, 1, 1,
0.545938, 0.6296005, 0.5238938, 1, 0, 0, 1, 1,
0.5522934, -0.9236829, 2.735004, 0, 0, 0, 1, 1,
0.5554136, 0.6089167, 2.087273, 0, 0, 0, 1, 1,
0.5596042, 1.093809, -0.4015053, 0, 0, 0, 1, 1,
0.5596297, -0.02997646, 0.7038544, 0, 0, 0, 1, 1,
0.5630737, -0.3004438, 0.7048539, 0, 0, 0, 1, 1,
0.5665113, 0.6579522, 0.6814743, 0, 0, 0, 1, 1,
0.5734838, 0.6174804, 1.325397, 0, 0, 0, 1, 1,
0.5758896, -1.159751, 3.837684, 1, 1, 1, 1, 1,
0.5771106, 0.415992, 0.4879857, 1, 1, 1, 1, 1,
0.5801204, 0.7371969, -1.024086, 1, 1, 1, 1, 1,
0.5824609, 1.692879, -0.2777857, 1, 1, 1, 1, 1,
0.5834051, -1.078804, 3.448621, 1, 1, 1, 1, 1,
0.5847543, 0.1632769, 0.6434624, 1, 1, 1, 1, 1,
0.5850092, -1.195327, 2.057641, 1, 1, 1, 1, 1,
0.5863745, -1.920532, 2.050932, 1, 1, 1, 1, 1,
0.5869447, 0.284275, 1.770204, 1, 1, 1, 1, 1,
0.5888099, -0.4452495, 4.183168, 1, 1, 1, 1, 1,
0.5895951, -0.9014108, 1.737332, 1, 1, 1, 1, 1,
0.5958277, 1.797503, 2.013079, 1, 1, 1, 1, 1,
0.5967155, 0.2783674, -0.1029725, 1, 1, 1, 1, 1,
0.5985748, -0.7422878, 3.208632, 1, 1, 1, 1, 1,
0.6059335, 1.825682, -0.9455751, 1, 1, 1, 1, 1,
0.6068056, -0.09686333, 1.570868, 0, 0, 1, 1, 1,
0.6120887, 1.788085, 0.3719929, 1, 0, 0, 1, 1,
0.6151878, -0.006774921, 3.979746, 1, 0, 0, 1, 1,
0.6208933, -0.9907513, 2.548373, 1, 0, 0, 1, 1,
0.62395, 2.20769, 0.640581, 1, 0, 0, 1, 1,
0.6255582, 0.6443424, 1.635295, 1, 0, 0, 1, 1,
0.6257184, -0.1272591, 1.28703, 0, 0, 0, 1, 1,
0.6259426, 0.2870944, 2.751201, 0, 0, 0, 1, 1,
0.6260557, 1.370858, -0.06338867, 0, 0, 0, 1, 1,
0.6284731, -0.941268, 1.79974, 0, 0, 0, 1, 1,
0.6286888, -0.5795417, 1.761481, 0, 0, 0, 1, 1,
0.6291555, -2.116052, 1.658684, 0, 0, 0, 1, 1,
0.6332061, 0.5574859, 0.6218274, 0, 0, 0, 1, 1,
0.6356046, -0.9450219, 1.905704, 1, 1, 1, 1, 1,
0.6443436, -0.9018446, 3.447542, 1, 1, 1, 1, 1,
0.6447847, 0.1617097, 1.049483, 1, 1, 1, 1, 1,
0.6464339, 1.057825, 1.966864, 1, 1, 1, 1, 1,
0.6464558, 0.3241184, -0.2022659, 1, 1, 1, 1, 1,
0.6507512, -0.6062645, 4.013085, 1, 1, 1, 1, 1,
0.6574504, -0.8958622, 4.504609, 1, 1, 1, 1, 1,
0.6627102, 1.698539, 0.463618, 1, 1, 1, 1, 1,
0.669943, 0.8289222, 1.885611, 1, 1, 1, 1, 1,
0.6737837, 1.166928, -0.07405134, 1, 1, 1, 1, 1,
0.6773829, -0.9577703, 1.249538, 1, 1, 1, 1, 1,
0.6998456, -0.6466283, 1.643116, 1, 1, 1, 1, 1,
0.7102982, 0.1425342, 1.33461, 1, 1, 1, 1, 1,
0.7108452, 0.7048647, 1.841945, 1, 1, 1, 1, 1,
0.7123781, -0.2944665, 0.4769343, 1, 1, 1, 1, 1,
0.7188799, -0.2479933, 2.106376, 0, 0, 1, 1, 1,
0.7217361, -1.520486, 1.782465, 1, 0, 0, 1, 1,
0.7253779, -0.7723526, 4.10876, 1, 0, 0, 1, 1,
0.7274569, -0.06217628, 1.22338, 1, 0, 0, 1, 1,
0.7481539, -1.293531, 0.7046841, 1, 0, 0, 1, 1,
0.7487916, 0.5428641, -0.462873, 1, 0, 0, 1, 1,
0.7492223, -1.384321, 2.228999, 0, 0, 0, 1, 1,
0.7494381, 0.6750206, 0.02117433, 0, 0, 0, 1, 1,
0.7503572, -0.3720944, 3.6616, 0, 0, 0, 1, 1,
0.7512706, 0.4269508, -0.6382423, 0, 0, 0, 1, 1,
0.7541416, -0.5080008, 0.5899799, 0, 0, 0, 1, 1,
0.7593055, -0.723773, 4.65585, 0, 0, 0, 1, 1,
0.7609563, 0.03186865, 0.9124619, 0, 0, 0, 1, 1,
0.7670788, 1.307376, 1.753537, 1, 1, 1, 1, 1,
0.7739474, -0.02775514, 1.58052, 1, 1, 1, 1, 1,
0.7747707, -1.466514, 2.331226, 1, 1, 1, 1, 1,
0.7750759, -0.4602764, 1.830266, 1, 1, 1, 1, 1,
0.7777261, 0.5474272, 0.2101468, 1, 1, 1, 1, 1,
0.778836, 0.08376319, 1.109344, 1, 1, 1, 1, 1,
0.7795017, 0.969861, 0.02503355, 1, 1, 1, 1, 1,
0.7828274, 0.01545195, -0.03525013, 1, 1, 1, 1, 1,
0.7906612, 1.484562, 0.2476179, 1, 1, 1, 1, 1,
0.7909876, 0.2008543, 0.9535041, 1, 1, 1, 1, 1,
0.7968034, 0.3440166, 2.11027, 1, 1, 1, 1, 1,
0.7970626, 1.378051, 0.6551166, 1, 1, 1, 1, 1,
0.8079427, 0.03893759, 0.9234348, 1, 1, 1, 1, 1,
0.813027, 0.01357967, -0.4555044, 1, 1, 1, 1, 1,
0.8235253, 0.5934166, -0.4030655, 1, 1, 1, 1, 1,
0.8255102, -0.4742693, 2.09479, 0, 0, 1, 1, 1,
0.8260275, 0.010708, 0.7134289, 1, 0, 0, 1, 1,
0.8453191, -0.7014781, 2.44084, 1, 0, 0, 1, 1,
0.8461916, 0.7394494, 2.152137, 1, 0, 0, 1, 1,
0.8564407, -0.2262205, 4.827507, 1, 0, 0, 1, 1,
0.8581553, -0.2193217, 2.73171, 1, 0, 0, 1, 1,
0.8640843, -0.4260632, 3.193962, 0, 0, 0, 1, 1,
0.8687988, -0.9249811, 2.47456, 0, 0, 0, 1, 1,
0.8696277, -0.322218, 1.400606, 0, 0, 0, 1, 1,
0.876039, -0.208902, 1.712304, 0, 0, 0, 1, 1,
0.881265, 0.8038841, 2.822701, 0, 0, 0, 1, 1,
0.8916745, -0.07697624, 1.650458, 0, 0, 0, 1, 1,
0.8943072, 1.392143, 0.8657271, 0, 0, 0, 1, 1,
0.9077349, -0.5284454, 0.552391, 1, 1, 1, 1, 1,
0.9131287, 0.01022417, 1.767616, 1, 1, 1, 1, 1,
0.9191883, -0.04466026, 2.90998, 1, 1, 1, 1, 1,
0.920543, -0.9795273, 2.030052, 1, 1, 1, 1, 1,
0.9216506, -0.2962971, 1.871855, 1, 1, 1, 1, 1,
0.923468, 0.1362531, 1.105635, 1, 1, 1, 1, 1,
0.9235291, 0.2593821, 2.574658, 1, 1, 1, 1, 1,
0.9269012, -1.552404, 2.818706, 1, 1, 1, 1, 1,
0.9315184, -0.9462395, 3.695198, 1, 1, 1, 1, 1,
0.9486139, -0.02814236, 2.256943, 1, 1, 1, 1, 1,
0.957992, 0.6268319, 1.639209, 1, 1, 1, 1, 1,
0.9620895, 0.5986162, 1.142067, 1, 1, 1, 1, 1,
0.9655899, 0.01984149, 2.762371, 1, 1, 1, 1, 1,
0.9835082, -1.629759, 2.021565, 1, 1, 1, 1, 1,
0.9848531, 0.3795033, 2.898861, 1, 1, 1, 1, 1,
0.9941381, 0.1464354, 1.201877, 0, 0, 1, 1, 1,
0.9965643, -0.7891089, 2.293458, 1, 0, 0, 1, 1,
0.9975502, -1.200348, 2.566484, 1, 0, 0, 1, 1,
0.9975646, -1.368348, 2.224541, 1, 0, 0, 1, 1,
1.008763, -0.5747409, 1.524127, 1, 0, 0, 1, 1,
1.019428, -0.9159009, 3.055534, 1, 0, 0, 1, 1,
1.020851, -0.5443707, 2.068506, 0, 0, 0, 1, 1,
1.03281, -1.56247, 3.307208, 0, 0, 0, 1, 1,
1.033275, 0.7304197, 1.351289, 0, 0, 0, 1, 1,
1.034499, -0.8542927, 2.947368, 0, 0, 0, 1, 1,
1.039518, 0.8617157, 2.039783, 0, 0, 0, 1, 1,
1.04248, 0.243644, 2.446018, 0, 0, 0, 1, 1,
1.054699, 0.9223805, 0.115777, 0, 0, 0, 1, 1,
1.05861, -0.3697271, 3.626372, 1, 1, 1, 1, 1,
1.06604, 3.004947, 1.191453, 1, 1, 1, 1, 1,
1.066171, -0.1926886, 1.601903, 1, 1, 1, 1, 1,
1.068357, 0.9956294, 0.2694769, 1, 1, 1, 1, 1,
1.072752, 0.1451031, 1.461558, 1, 1, 1, 1, 1,
1.081453, -0.192967, 1.093684, 1, 1, 1, 1, 1,
1.10747, -1.741517, 2.268511, 1, 1, 1, 1, 1,
1.109986, -0.0769809, 2.900168, 1, 1, 1, 1, 1,
1.1102, -0.03832071, 2.30772, 1, 1, 1, 1, 1,
1.119989, -0.03171793, 0.4789137, 1, 1, 1, 1, 1,
1.136288, -0.5407444, 2.085778, 1, 1, 1, 1, 1,
1.140229, 2.822277, -0.3752953, 1, 1, 1, 1, 1,
1.141824, 0.3293285, 1.508499, 1, 1, 1, 1, 1,
1.146542, 0.4573499, 2.320504, 1, 1, 1, 1, 1,
1.148272, -1.043854, 3.308306, 1, 1, 1, 1, 1,
1.155647, -0.3154092, 2.68598, 0, 0, 1, 1, 1,
1.156731, -2.151675, 1.866574, 1, 0, 0, 1, 1,
1.161137, -0.5486352, 2.271961, 1, 0, 0, 1, 1,
1.161168, -1.03783, 2.342798, 1, 0, 0, 1, 1,
1.170142, -0.3116381, 1.782756, 1, 0, 0, 1, 1,
1.173935, -1.026734, 4.215744, 1, 0, 0, 1, 1,
1.182757, -0.4250942, 1.073854, 0, 0, 0, 1, 1,
1.199721, -0.03144066, 0.8559764, 0, 0, 0, 1, 1,
1.19975, 0.188935, 0.8090767, 0, 0, 0, 1, 1,
1.204887, 1.229139, -1.453262, 0, 0, 0, 1, 1,
1.213042, 1.772529, -0.1027139, 0, 0, 0, 1, 1,
1.215673, 3.452781, -0.5855671, 0, 0, 0, 1, 1,
1.217523, 0.8924796, 1.316692, 0, 0, 0, 1, 1,
1.219908, -2.836242, 1.676627, 1, 1, 1, 1, 1,
1.220379, -0.3380483, 2.274988, 1, 1, 1, 1, 1,
1.230351, 0.4643356, 2.772249, 1, 1, 1, 1, 1,
1.240366, 0.8379005, 2.031956, 1, 1, 1, 1, 1,
1.248766, -0.2246594, 1.350824, 1, 1, 1, 1, 1,
1.251533, -0.383995, 0.4938395, 1, 1, 1, 1, 1,
1.253377, -0.4019025, 0.9594504, 1, 1, 1, 1, 1,
1.257815, -0.5005547, 0.6831462, 1, 1, 1, 1, 1,
1.258992, 4.378549, -0.02569101, 1, 1, 1, 1, 1,
1.263324, 0.6717687, -0.2183192, 1, 1, 1, 1, 1,
1.265889, -0.9095234, 2.790569, 1, 1, 1, 1, 1,
1.267698, -0.7234834, 1.884027, 1, 1, 1, 1, 1,
1.273129, -0.6899378, 2.485175, 1, 1, 1, 1, 1,
1.276208, 0.3069103, 1.411888, 1, 1, 1, 1, 1,
1.278696, 0.341635, 2.601493, 1, 1, 1, 1, 1,
1.280994, -1.708431, 2.996691, 0, 0, 1, 1, 1,
1.287082, 1.498195, 1.006171, 1, 0, 0, 1, 1,
1.296503, -0.5651309, -0.4938582, 1, 0, 0, 1, 1,
1.297098, -1.022075, 1.929106, 1, 0, 0, 1, 1,
1.302947, -0.3204834, 2.068437, 1, 0, 0, 1, 1,
1.303011, 0.4181118, 1.593615, 1, 0, 0, 1, 1,
1.311029, -2.111961, 1.861729, 0, 0, 0, 1, 1,
1.321134, 1.685522, 1.355993, 0, 0, 0, 1, 1,
1.327125, 2.017639, 1.124004, 0, 0, 0, 1, 1,
1.327702, 0.6242161, 0.9887699, 0, 0, 0, 1, 1,
1.331437, 0.5608155, -0.6416221, 0, 0, 0, 1, 1,
1.335279, -0.4179667, 1.481109, 0, 0, 0, 1, 1,
1.340644, -1.155369, 3.291243, 0, 0, 0, 1, 1,
1.343055, 1.821718, 0.7825347, 1, 1, 1, 1, 1,
1.349909, -0.4804634, 3.170224, 1, 1, 1, 1, 1,
1.358279, -0.04141671, 0.496814, 1, 1, 1, 1, 1,
1.366092, 0.5140393, 0.7744823, 1, 1, 1, 1, 1,
1.367501, -1.194654, 3.473932, 1, 1, 1, 1, 1,
1.371818, 1.475692, 1.375173, 1, 1, 1, 1, 1,
1.372495, 0.9946186, 1.115124, 1, 1, 1, 1, 1,
1.38363, -1.359211, 3.006003, 1, 1, 1, 1, 1,
1.386357, 0.004910703, 1.687996, 1, 1, 1, 1, 1,
1.39076, -0.5613047, 1.978359, 1, 1, 1, 1, 1,
1.398358, -1.710971, 2.485622, 1, 1, 1, 1, 1,
1.40202, -1.742909, 3.626861, 1, 1, 1, 1, 1,
1.403307, -0.2823251, 1.425809, 1, 1, 1, 1, 1,
1.411738, -1.864224, 3.233037, 1, 1, 1, 1, 1,
1.448327, -0.4378911, 1.672513, 1, 1, 1, 1, 1,
1.451661, -0.1492781, 1.685798, 0, 0, 1, 1, 1,
1.452149, -0.1453051, 1.255836, 1, 0, 0, 1, 1,
1.471995, 1.629379, -0.1367578, 1, 0, 0, 1, 1,
1.474463, -0.09694617, 1.289185, 1, 0, 0, 1, 1,
1.48807, -0.6353574, -0.1984504, 1, 0, 0, 1, 1,
1.498638, 0.09584626, 2.017456, 1, 0, 0, 1, 1,
1.506804, -0.8076416, 0.7856856, 0, 0, 0, 1, 1,
1.518861, 1.068767, 1.959099, 0, 0, 0, 1, 1,
1.526816, 0.5277985, 0.7515385, 0, 0, 0, 1, 1,
1.530224, 0.8281777, 3.508241, 0, 0, 0, 1, 1,
1.539071, 2.398372, 0.8024508, 0, 0, 0, 1, 1,
1.541308, -0.6604705, 3.122401, 0, 0, 0, 1, 1,
1.546244, -1.831833, 3.280116, 0, 0, 0, 1, 1,
1.547252, 0.04152956, 2.931152, 1, 1, 1, 1, 1,
1.555946, 0.6795351, 1.19677, 1, 1, 1, 1, 1,
1.585769, 0.3134456, 1.104739, 1, 1, 1, 1, 1,
1.594592, -0.1137907, 2.294392, 1, 1, 1, 1, 1,
1.605235, -0.1806763, 0.3981273, 1, 1, 1, 1, 1,
1.61139, -1.602689, 1.571305, 1, 1, 1, 1, 1,
1.629016, 1.455401, 0.6080177, 1, 1, 1, 1, 1,
1.639762, -0.2684071, 0.5015159, 1, 1, 1, 1, 1,
1.652535, 0.9064646, 0.7982092, 1, 1, 1, 1, 1,
1.666538, -0.2216171, 1.1449, 1, 1, 1, 1, 1,
1.680138, -0.6378579, 2.060763, 1, 1, 1, 1, 1,
1.681779, 1.306597, 1.301077, 1, 1, 1, 1, 1,
1.685009, -0.009878529, 2.431111, 1, 1, 1, 1, 1,
1.689313, -0.1350819, 3.613655, 1, 1, 1, 1, 1,
1.69363, -0.2719443, 2.628326, 1, 1, 1, 1, 1,
1.698084, -0.07498623, 1.463822, 0, 0, 1, 1, 1,
1.706049, -0.2466571, 2.96557, 1, 0, 0, 1, 1,
1.70828, 0.05265411, 2.141298, 1, 0, 0, 1, 1,
1.71422, -0.731907, 0.9467587, 1, 0, 0, 1, 1,
1.734069, -0.04761901, 3.363431, 1, 0, 0, 1, 1,
1.739625, -1.167774, 2.295161, 1, 0, 0, 1, 1,
1.769734, 0.4784088, 0.500801, 0, 0, 0, 1, 1,
1.776483, 1.165932, 0.8248991, 0, 0, 0, 1, 1,
1.780384, -0.1695651, -0.3324438, 0, 0, 0, 1, 1,
1.80142, 0.3868625, 3.271444, 0, 0, 0, 1, 1,
1.803763, -2.027388, 3.515779, 0, 0, 0, 1, 1,
1.818359, 1.77225, -1.819848, 0, 0, 0, 1, 1,
1.823205, 0.1463629, 0.06615834, 0, 0, 0, 1, 1,
1.851591, -1.125763, 1.716521, 1, 1, 1, 1, 1,
1.858759, -0.06274166, 1.892933, 1, 1, 1, 1, 1,
1.874134, 1.19669, 1.147967, 1, 1, 1, 1, 1,
1.88105, 1.298664, 3.183774, 1, 1, 1, 1, 1,
1.883373, 0.2212405, 0.5933902, 1, 1, 1, 1, 1,
1.917249, -1.929504, 3.453641, 1, 1, 1, 1, 1,
1.91912, 0.3380697, 0.2800287, 1, 1, 1, 1, 1,
1.942153, -0.6723024, 0.4490935, 1, 1, 1, 1, 1,
2.003039, 0.01321496, -0.1029677, 1, 1, 1, 1, 1,
2.01076, 1.842045, -0.01939973, 1, 1, 1, 1, 1,
2.017046, 0.04980888, 2.795141, 1, 1, 1, 1, 1,
2.03282, 1.103197, 2.165488, 1, 1, 1, 1, 1,
2.041449, -0.1710706, 1.677111, 1, 1, 1, 1, 1,
2.057011, 0.2790475, 1.473835, 1, 1, 1, 1, 1,
2.057559, 0.3696362, 2.522408, 1, 1, 1, 1, 1,
2.154363, -0.1854791, -0.5696899, 0, 0, 1, 1, 1,
2.168601, -0.3382591, -0.1760615, 1, 0, 0, 1, 1,
2.179856, 0.5936072, 2.062697, 1, 0, 0, 1, 1,
2.208717, 2.178065, 0.486563, 1, 0, 0, 1, 1,
2.21619, -0.551899, 3.042277, 1, 0, 0, 1, 1,
2.266509, 2.090033, 0.1051381, 1, 0, 0, 1, 1,
2.267074, 0.2912917, 0.2555449, 0, 0, 0, 1, 1,
2.281009, 0.2072175, 0.9532766, 0, 0, 0, 1, 1,
2.319768, 0.4078162, 2.15167, 0, 0, 0, 1, 1,
2.365551, 0.2290131, 0.7947895, 0, 0, 0, 1, 1,
2.440396, 0.4705628, -0.1114928, 0, 0, 0, 1, 1,
2.454673, 0.1008815, 0.5008487, 0, 0, 0, 1, 1,
2.477182, 2.365392, 1.67394, 0, 0, 0, 1, 1,
2.480115, 0.3244312, 1.33213, 1, 1, 1, 1, 1,
2.495471, -0.6394383, 1.704803, 1, 1, 1, 1, 1,
2.560749, 1.654871, -0.5339518, 1, 1, 1, 1, 1,
2.647698, 1.112898, 0.6888848, 1, 1, 1, 1, 1,
2.996082, -1.508919, 2.285177, 1, 1, 1, 1, 1,
3.105311, 0.704108, 0.6168737, 1, 1, 1, 1, 1,
3.328828, -1.088844, 3.046745, 1, 1, 1, 1, 1
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
var radius = 10.03988;
var distance = 35.26464;
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
mvMatrix.translate( -0.1534331, -0.7711535, -0.09581876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.26464);
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
