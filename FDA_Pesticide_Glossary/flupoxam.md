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
-3.825938, -0.7820362, -1.233055, 1, 0, 0, 1,
-2.802894, -0.2216018, -1.497693, 1, 0.007843138, 0, 1,
-2.67479, 0.6685323, -1.752372, 1, 0.01176471, 0, 1,
-2.547096, 0.3027833, -2.071182, 1, 0.01960784, 0, 1,
-2.540146, -0.676942, -0.9188709, 1, 0.02352941, 0, 1,
-2.516368, 2.31365, -0.6200989, 1, 0.03137255, 0, 1,
-2.398503, -1.29502, -2.79498, 1, 0.03529412, 0, 1,
-2.384471, -0.08356287, -0.8759973, 1, 0.04313726, 0, 1,
-2.325479, -0.366611, -1.67788, 1, 0.04705882, 0, 1,
-2.315072, -2.014901, -2.723099, 1, 0.05490196, 0, 1,
-2.280054, 3.178459, -0.6203638, 1, 0.05882353, 0, 1,
-2.245087, 0.1640307, -2.417442, 1, 0.06666667, 0, 1,
-2.225529, -0.4740771, -1.452928, 1, 0.07058824, 0, 1,
-2.16857, 0.8336666, -1.484616, 1, 0.07843138, 0, 1,
-2.122669, 1.497155, -1.332642, 1, 0.08235294, 0, 1,
-2.097004, 0.02129416, -2.095298, 1, 0.09019608, 0, 1,
-2.091026, 1.858981, -1.596891, 1, 0.09411765, 0, 1,
-2.079932, -0.3407095, -2.224696, 1, 0.1019608, 0, 1,
-2.071141, -0.8639695, 0.06014944, 1, 0.1098039, 0, 1,
-2.068757, -1.361106, -2.982271, 1, 0.1137255, 0, 1,
-2.063177, -1.029161, -1.10815, 1, 0.1215686, 0, 1,
-2.056824, 0.5564605, -0.8464311, 1, 0.1254902, 0, 1,
-2.039706, -0.6757712, -3.164792, 1, 0.1333333, 0, 1,
-1.998214, -0.2385827, -0.7238696, 1, 0.1372549, 0, 1,
-1.976789, 0.1258353, -0.9937758, 1, 0.145098, 0, 1,
-1.965303, -0.07267396, -2.566606, 1, 0.1490196, 0, 1,
-1.962491, -0.5858672, -0.7667584, 1, 0.1568628, 0, 1,
-1.917118, 1.227735, -1.285853, 1, 0.1607843, 0, 1,
-1.884792, -1.776463, -2.047135, 1, 0.1686275, 0, 1,
-1.879441, -0.433486, -3.060445, 1, 0.172549, 0, 1,
-1.849741, 0.08575572, -1.929628, 1, 0.1803922, 0, 1,
-1.833412, -0.5788879, -3.796316, 1, 0.1843137, 0, 1,
-1.831981, -0.787189, -3.317389, 1, 0.1921569, 0, 1,
-1.797711, 0.04074867, -2.22213, 1, 0.1960784, 0, 1,
-1.793048, 0.2729116, -1.731622, 1, 0.2039216, 0, 1,
-1.783061, 0.8768263, -1.920103, 1, 0.2117647, 0, 1,
-1.774869, -0.7501744, -3.016019, 1, 0.2156863, 0, 1,
-1.759617, -0.6423359, -1.800704, 1, 0.2235294, 0, 1,
-1.725698, 0.2922169, -2.279075, 1, 0.227451, 0, 1,
-1.717517, -0.9340776, -2.933812, 1, 0.2352941, 0, 1,
-1.712895, 0.698327, -0.5943346, 1, 0.2392157, 0, 1,
-1.712639, -0.2768311, -1.082694, 1, 0.2470588, 0, 1,
-1.707768, -0.08565155, -0.3451971, 1, 0.2509804, 0, 1,
-1.704977, 0.612416, -2.083912, 1, 0.2588235, 0, 1,
-1.702303, 0.5253469, -1.865847, 1, 0.2627451, 0, 1,
-1.686649, -0.3952822, -2.040821, 1, 0.2705882, 0, 1,
-1.68444, 1.252343, -1.88172, 1, 0.2745098, 0, 1,
-1.681516, 1.701043, -0.9913335, 1, 0.282353, 0, 1,
-1.667719, 0.5821943, -0.4045413, 1, 0.2862745, 0, 1,
-1.659694, -0.0205684, -2.466695, 1, 0.2941177, 0, 1,
-1.655768, -0.002828201, -0.899084, 1, 0.3019608, 0, 1,
-1.655475, -0.484373, -1.582495, 1, 0.3058824, 0, 1,
-1.634287, 0.5428995, -1.312589, 1, 0.3137255, 0, 1,
-1.632115, -1.219341, -0.8764896, 1, 0.3176471, 0, 1,
-1.626627, 0.7068343, 0.9435561, 1, 0.3254902, 0, 1,
-1.598779, 0.5168031, -1.278507, 1, 0.3294118, 0, 1,
-1.554681, -0.04180972, -2.612303, 1, 0.3372549, 0, 1,
-1.553862, 0.9855617, 0.4565341, 1, 0.3411765, 0, 1,
-1.553545, -0.9628818, -0.05515135, 1, 0.3490196, 0, 1,
-1.553204, -0.5414692, -3.430153, 1, 0.3529412, 0, 1,
-1.550415, 0.01820069, -2.083041, 1, 0.3607843, 0, 1,
-1.549366, 1.399114, 0.2804078, 1, 0.3647059, 0, 1,
-1.548458, 1.446035, -2.083451, 1, 0.372549, 0, 1,
-1.523938, 1.151979, -1.753457, 1, 0.3764706, 0, 1,
-1.516518, 0.9898096, -1.763683, 1, 0.3843137, 0, 1,
-1.511155, 0.1382384, -2.000449, 1, 0.3882353, 0, 1,
-1.499379, -0.9522374, -0.4079579, 1, 0.3960784, 0, 1,
-1.490914, -0.9939823, -0.7493058, 1, 0.4039216, 0, 1,
-1.487254, -0.02603005, -3.036475, 1, 0.4078431, 0, 1,
-1.483064, -0.9452337, -2.991977, 1, 0.4156863, 0, 1,
-1.480868, -0.3376875, -1.928089, 1, 0.4196078, 0, 1,
-1.472408, 0.7822273, 0.1482581, 1, 0.427451, 0, 1,
-1.470712, 0.1022937, -1.455625, 1, 0.4313726, 0, 1,
-1.457511, 0.3133152, -0.401144, 1, 0.4392157, 0, 1,
-1.448586, -1.018941, -3.499048, 1, 0.4431373, 0, 1,
-1.443253, -0.8301488, -4.066468, 1, 0.4509804, 0, 1,
-1.430156, 0.08028367, -3.193742, 1, 0.454902, 0, 1,
-1.429041, 0.5333354, -0.6453204, 1, 0.4627451, 0, 1,
-1.428361, -0.4182969, -3.205575, 1, 0.4666667, 0, 1,
-1.419875, -2.336331, -3.433318, 1, 0.4745098, 0, 1,
-1.412322, 0.2347347, -2.300524, 1, 0.4784314, 0, 1,
-1.406766, 0.7727293, -0.9834522, 1, 0.4862745, 0, 1,
-1.405548, -1.089816, -3.028629, 1, 0.4901961, 0, 1,
-1.401962, -0.4362232, -3.076965, 1, 0.4980392, 0, 1,
-1.377736, 1.416194, -0.2894412, 1, 0.5058824, 0, 1,
-1.376997, -0.09111785, -0.5462852, 1, 0.509804, 0, 1,
-1.363018, 0.2792704, 0.214414, 1, 0.5176471, 0, 1,
-1.339287, -0.7841378, -2.571856, 1, 0.5215687, 0, 1,
-1.328727, 0.1179333, 0.1752934, 1, 0.5294118, 0, 1,
-1.318925, 0.1775423, -3.253931, 1, 0.5333334, 0, 1,
-1.311352, -0.3363008, -0.7450197, 1, 0.5411765, 0, 1,
-1.302812, 0.2916382, -2.203899, 1, 0.5450981, 0, 1,
-1.294315, 0.01946133, -1.658604, 1, 0.5529412, 0, 1,
-1.276872, 1.062146, -0.3904691, 1, 0.5568628, 0, 1,
-1.275393, -0.2832757, -2.270275, 1, 0.5647059, 0, 1,
-1.274212, 0.9915861, -1.220547, 1, 0.5686275, 0, 1,
-1.273043, -0.1307763, -1.419847, 1, 0.5764706, 0, 1,
-1.270461, 0.9722947, -0.8233529, 1, 0.5803922, 0, 1,
-1.266394, -0.5664435, -1.509106, 1, 0.5882353, 0, 1,
-1.247153, 0.81788, -0.1932904, 1, 0.5921569, 0, 1,
-1.240578, -0.5436857, -0.916474, 1, 0.6, 0, 1,
-1.239969, 0.9508198, -0.5688969, 1, 0.6078432, 0, 1,
-1.234398, 0.507818, 0.1000201, 1, 0.6117647, 0, 1,
-1.218075, -0.2208932, -2.210147, 1, 0.6196079, 0, 1,
-1.217596, 1.156572, 0.01363366, 1, 0.6235294, 0, 1,
-1.215044, 0.7191739, -0.7005622, 1, 0.6313726, 0, 1,
-1.213784, 1.148311, -1.135144, 1, 0.6352941, 0, 1,
-1.208305, 0.613939, -0.4605582, 1, 0.6431373, 0, 1,
-1.199304, 0.3165514, -2.584679, 1, 0.6470588, 0, 1,
-1.196898, -0.06211217, -1.380269, 1, 0.654902, 0, 1,
-1.190498, -1.022244, -1.30624, 1, 0.6588235, 0, 1,
-1.189377, -0.2923353, -2.030906, 1, 0.6666667, 0, 1,
-1.189112, 0.5198992, 0.5637342, 1, 0.6705883, 0, 1,
-1.171202, 0.4212725, 0.03173117, 1, 0.6784314, 0, 1,
-1.16893, 0.1017953, -1.732109, 1, 0.682353, 0, 1,
-1.167758, 0.614441, -1.341928, 1, 0.6901961, 0, 1,
-1.160592, -1.650318, -3.622124, 1, 0.6941177, 0, 1,
-1.156672, 1.04313, -1.388787, 1, 0.7019608, 0, 1,
-1.154799, -0.8313886, -3.253364, 1, 0.7098039, 0, 1,
-1.146161, -1.677257, -4.466832, 1, 0.7137255, 0, 1,
-1.144863, -0.4804158, -3.89469, 1, 0.7215686, 0, 1,
-1.138902, -1.299975, -1.849558, 1, 0.7254902, 0, 1,
-1.133375, -0.9043542, -1.759198, 1, 0.7333333, 0, 1,
-1.129023, 0.0909034, -1.970575, 1, 0.7372549, 0, 1,
-1.126243, -0.36987, -2.544664, 1, 0.7450981, 0, 1,
-1.118547, -0.2542741, 0.2581384, 1, 0.7490196, 0, 1,
-1.116561, -0.8940418, -3.446937, 1, 0.7568628, 0, 1,
-1.098915, -0.7572687, -1.949441, 1, 0.7607843, 0, 1,
-1.083935, -1.703976, -1.490027, 1, 0.7686275, 0, 1,
-1.078451, -0.5263348, -4.472369, 1, 0.772549, 0, 1,
-1.07069, 1.439669, -0.4957641, 1, 0.7803922, 0, 1,
-1.055931, 1.499606, -1.468165, 1, 0.7843137, 0, 1,
-1.055177, -0.247384, -2.344035, 1, 0.7921569, 0, 1,
-1.049756, 0.10202, -1.332282, 1, 0.7960784, 0, 1,
-1.048047, -1.405278, -3.521153, 1, 0.8039216, 0, 1,
-1.041285, 0.5838796, -2.303324, 1, 0.8117647, 0, 1,
-1.038325, -0.3343438, -0.5002513, 1, 0.8156863, 0, 1,
-1.036346, -0.08293284, -3.067121, 1, 0.8235294, 0, 1,
-1.035504, -1.186326, -2.178011, 1, 0.827451, 0, 1,
-1.027659, -0.2685196, -3.175759, 1, 0.8352941, 0, 1,
-1.025817, -0.3375938, -0.5134909, 1, 0.8392157, 0, 1,
-1.020677, -3.66808, -4.148511, 1, 0.8470588, 0, 1,
-1.017562, 1.856616, -0.4610395, 1, 0.8509804, 0, 1,
-1.015809, 0.4122114, -1.650792, 1, 0.8588235, 0, 1,
-1.013451, -0.1161119, -2.736915, 1, 0.8627451, 0, 1,
-1.01304, 2.447108, -1.370742, 1, 0.8705882, 0, 1,
-1.00817, -0.3029362, -1.812753, 1, 0.8745098, 0, 1,
-1.004947, -1.059211, -2.028233, 1, 0.8823529, 0, 1,
-1.004458, -0.01312736, -2.071754, 1, 0.8862745, 0, 1,
-1.003368, 0.009139312, -1.519011, 1, 0.8941177, 0, 1,
-1.001462, -0.5301462, -1.712018, 1, 0.8980392, 0, 1,
-0.9996746, 1.364468, 0.2571719, 1, 0.9058824, 0, 1,
-0.9987174, 0.9791276, -0.004250096, 1, 0.9137255, 0, 1,
-0.996273, -0.3674757, -2.22753, 1, 0.9176471, 0, 1,
-0.9956287, -0.1284962, -2.271395, 1, 0.9254902, 0, 1,
-0.9945598, -1.054196, -3.730392, 1, 0.9294118, 0, 1,
-0.9937147, -0.1206378, -1.039339, 1, 0.9372549, 0, 1,
-0.9919309, 0.8794621, -1.20357, 1, 0.9411765, 0, 1,
-0.989969, -0.1668689, -1.616583, 1, 0.9490196, 0, 1,
-0.9893658, -0.3049378, -1.108909, 1, 0.9529412, 0, 1,
-0.9831652, -0.177973, -3.8215, 1, 0.9607843, 0, 1,
-0.9774217, 0.1012918, -0.6462112, 1, 0.9647059, 0, 1,
-0.9766383, -1.418515, -2.418917, 1, 0.972549, 0, 1,
-0.9750052, 0.7165495, -1.554512, 1, 0.9764706, 0, 1,
-0.9695218, 0.1641075, -2.731497, 1, 0.9843137, 0, 1,
-0.9592089, 0.2858041, 0.7108324, 1, 0.9882353, 0, 1,
-0.954669, -0.3848687, -1.330541, 1, 0.9960784, 0, 1,
-0.9533018, 0.04245131, -2.096511, 0.9960784, 1, 0, 1,
-0.9450804, 0.4127735, -3.096789, 0.9921569, 1, 0, 1,
-0.9425839, -1.936921, -3.583477, 0.9843137, 1, 0, 1,
-0.9400569, -0.3441036, -1.471585, 0.9803922, 1, 0, 1,
-0.9342973, -0.06001512, 0.1788189, 0.972549, 1, 0, 1,
-0.9317213, -0.9135333, -0.6769902, 0.9686275, 1, 0, 1,
-0.9305791, -1.903232, -1.894213, 0.9607843, 1, 0, 1,
-0.9293066, 0.7318865, -1.267959, 0.9568627, 1, 0, 1,
-0.9262127, 0.7803692, -0.008869723, 0.9490196, 1, 0, 1,
-0.923774, -0.144409, -1.723767, 0.945098, 1, 0, 1,
-0.9206817, 0.7819865, -1.9189, 0.9372549, 1, 0, 1,
-0.9152101, 0.4189251, -0.7669818, 0.9333333, 1, 0, 1,
-0.9141006, -0.256771, -1.89311, 0.9254902, 1, 0, 1,
-0.9137416, 0.0006254932, -1.32655, 0.9215686, 1, 0, 1,
-0.9067172, -1.112749, -4.106652, 0.9137255, 1, 0, 1,
-0.9048434, 0.9221234, -0.7476254, 0.9098039, 1, 0, 1,
-0.9046203, -0.1321489, -2.411324, 0.9019608, 1, 0, 1,
-0.9020891, -0.5796744, -1.189648, 0.8941177, 1, 0, 1,
-0.8914369, 0.4926898, 0.4824787, 0.8901961, 1, 0, 1,
-0.8792427, 0.5974247, -0.7430353, 0.8823529, 1, 0, 1,
-0.8785037, 0.2523687, -1.657954, 0.8784314, 1, 0, 1,
-0.8784173, -1.451299, -2.726042, 0.8705882, 1, 0, 1,
-0.8780086, -0.5148357, -1.834123, 0.8666667, 1, 0, 1,
-0.8757352, -1.013555, -1.804515, 0.8588235, 1, 0, 1,
-0.875695, -1.852083, -4.76693, 0.854902, 1, 0, 1,
-0.8753885, 2.334942, -0.6713081, 0.8470588, 1, 0, 1,
-0.8715377, -1.487167, -2.728303, 0.8431373, 1, 0, 1,
-0.867206, 0.544053, -0.8803373, 0.8352941, 1, 0, 1,
-0.8628682, 1.173723, -1.465998, 0.8313726, 1, 0, 1,
-0.8594771, 0.9704118, -1.06816, 0.8235294, 1, 0, 1,
-0.858968, -1.571174, -1.723315, 0.8196079, 1, 0, 1,
-0.8589592, -1.131183, -0.7730894, 0.8117647, 1, 0, 1,
-0.8558411, -0.9974827, -3.038568, 0.8078431, 1, 0, 1,
-0.8537393, -0.5891063, -2.215519, 0.8, 1, 0, 1,
-0.8530528, 0.5621135, -0.8304021, 0.7921569, 1, 0, 1,
-0.8514039, -0.01294601, -2.08388, 0.7882353, 1, 0, 1,
-0.8440208, 1.50799, -0.2751696, 0.7803922, 1, 0, 1,
-0.8431581, -0.9066479, -3.126137, 0.7764706, 1, 0, 1,
-0.8423188, -1.795101, -1.693158, 0.7686275, 1, 0, 1,
-0.8396234, 0.4978569, -0.06877305, 0.7647059, 1, 0, 1,
-0.8374327, -1.338029, -3.422779, 0.7568628, 1, 0, 1,
-0.8367872, 0.2397032, -1.299027, 0.7529412, 1, 0, 1,
-0.8354384, 0.1666601, 0.4411722, 0.7450981, 1, 0, 1,
-0.8337661, 0.5578262, -0.05035079, 0.7411765, 1, 0, 1,
-0.8289533, 1.01165, -1.865806, 0.7333333, 1, 0, 1,
-0.8226508, 0.5860243, -0.02728316, 0.7294118, 1, 0, 1,
-0.8193405, 0.1706191, -2.008723, 0.7215686, 1, 0, 1,
-0.8070785, 1.404052, -0.2384746, 0.7176471, 1, 0, 1,
-0.8061965, -0.1125729, -3.022281, 0.7098039, 1, 0, 1,
-0.8015838, 0.7606999, -0.6628593, 0.7058824, 1, 0, 1,
-0.8003901, 1.315901, -0.2030291, 0.6980392, 1, 0, 1,
-0.7994218, -1.132255, -4.497488, 0.6901961, 1, 0, 1,
-0.7962, 0.08085847, -1.781453, 0.6862745, 1, 0, 1,
-0.7911236, -1.762753, -1.659437, 0.6784314, 1, 0, 1,
-0.7859966, 0.3164553, -1.900582, 0.6745098, 1, 0, 1,
-0.7849097, -0.7105542, -2.156801, 0.6666667, 1, 0, 1,
-0.7840613, -0.8589465, -1.650084, 0.6627451, 1, 0, 1,
-0.7833484, 0.612317, -1.305299, 0.654902, 1, 0, 1,
-0.7789789, 1.015145, -1.896231, 0.6509804, 1, 0, 1,
-0.7754841, 1.552658, -0.7160372, 0.6431373, 1, 0, 1,
-0.7689179, 0.597966, 1.820919, 0.6392157, 1, 0, 1,
-0.7676194, -1.303272, -2.740329, 0.6313726, 1, 0, 1,
-0.7664443, 0.8771165, -1.138462, 0.627451, 1, 0, 1,
-0.7662566, -1.329352, -2.058594, 0.6196079, 1, 0, 1,
-0.7613682, -0.6133037, -0.8923941, 0.6156863, 1, 0, 1,
-0.7583517, -1.549322, -1.616799, 0.6078432, 1, 0, 1,
-0.7570328, 0.5318167, -1.719783, 0.6039216, 1, 0, 1,
-0.7524313, 0.1030591, -1.220379, 0.5960785, 1, 0, 1,
-0.7517436, 0.4056878, 0.7907262, 0.5882353, 1, 0, 1,
-0.7505912, 1.33698, -2.164821, 0.5843138, 1, 0, 1,
-0.74818, -0.8234962, -3.432652, 0.5764706, 1, 0, 1,
-0.7448128, 0.05298076, -2.313488, 0.572549, 1, 0, 1,
-0.7413234, -0.1543627, -1.442168, 0.5647059, 1, 0, 1,
-0.7400721, 0.8229004, 0.6182256, 0.5607843, 1, 0, 1,
-0.7373164, 0.6975129, -0.752281, 0.5529412, 1, 0, 1,
-0.7329879, 0.2496337, -1.73129, 0.5490196, 1, 0, 1,
-0.7314469, -0.3534584, 0.3777317, 0.5411765, 1, 0, 1,
-0.7300417, 0.5101946, -2.389935, 0.5372549, 1, 0, 1,
-0.7288344, 0.5478879, -1.630286, 0.5294118, 1, 0, 1,
-0.7194328, -2.451613, -2.949476, 0.5254902, 1, 0, 1,
-0.7178891, -1.186643, -3.486298, 0.5176471, 1, 0, 1,
-0.7127904, -0.7809597, -2.90994, 0.5137255, 1, 0, 1,
-0.711396, -0.9353306, -2.367749, 0.5058824, 1, 0, 1,
-0.7046785, -1.159424, -3.935847, 0.5019608, 1, 0, 1,
-0.7018787, 0.3449658, -0.821841, 0.4941176, 1, 0, 1,
-0.7006313, 0.1854422, -0.4467915, 0.4862745, 1, 0, 1,
-0.6992414, 0.4162213, 0.266261, 0.4823529, 1, 0, 1,
-0.6951416, 1.205974, -0.264827, 0.4745098, 1, 0, 1,
-0.6950827, -1.060398, -3.583889, 0.4705882, 1, 0, 1,
-0.6909645, -0.2484188, -3.721584, 0.4627451, 1, 0, 1,
-0.6902779, 0.1354636, -2.411644, 0.4588235, 1, 0, 1,
-0.6892976, -0.0502419, -0.7384872, 0.4509804, 1, 0, 1,
-0.6891857, 0.5511678, 0.3502659, 0.4470588, 1, 0, 1,
-0.6852396, -0.906647, -2.380157, 0.4392157, 1, 0, 1,
-0.6797109, -0.6952426, -0.6437768, 0.4352941, 1, 0, 1,
-0.6735466, -0.3219428, -1.479519, 0.427451, 1, 0, 1,
-0.6707219, 1.029281, 0.1793018, 0.4235294, 1, 0, 1,
-0.6676468, 1.215101, -0.4453418, 0.4156863, 1, 0, 1,
-0.6672806, 0.02036561, -1.393524, 0.4117647, 1, 0, 1,
-0.6649997, 0.3649821, -0.327337, 0.4039216, 1, 0, 1,
-0.6616847, 0.4318513, 0.8104278, 0.3960784, 1, 0, 1,
-0.6612283, -0.6432157, -3.022089, 0.3921569, 1, 0, 1,
-0.6563232, 1.040501, 1.085067, 0.3843137, 1, 0, 1,
-0.6555662, 0.4951729, -1.969096, 0.3803922, 1, 0, 1,
-0.6552306, -0.2740656, -3.510566, 0.372549, 1, 0, 1,
-0.6532302, -0.3464164, -1.89954, 0.3686275, 1, 0, 1,
-0.6524701, -0.5154663, -1.269929, 0.3607843, 1, 0, 1,
-0.651924, -2.39279, -3.78404, 0.3568628, 1, 0, 1,
-0.645759, 2.028282, -0.1566192, 0.3490196, 1, 0, 1,
-0.6442642, -0.1895738, -1.077996, 0.345098, 1, 0, 1,
-0.6351348, 2.223503, -0.8315238, 0.3372549, 1, 0, 1,
-0.6317621, -0.8080574, -2.269788, 0.3333333, 1, 0, 1,
-0.6290621, -0.1310617, -0.2272011, 0.3254902, 1, 0, 1,
-0.6271825, -1.373106, -4.240747, 0.3215686, 1, 0, 1,
-0.6258194, -1.354938, -2.030577, 0.3137255, 1, 0, 1,
-0.6252146, -0.8665477, -1.703977, 0.3098039, 1, 0, 1,
-0.6213652, -2.054304, -1.441879, 0.3019608, 1, 0, 1,
-0.6186308, -1.465137, -4.014266, 0.2941177, 1, 0, 1,
-0.6181725, 1.613206, -0.1683808, 0.2901961, 1, 0, 1,
-0.6169727, 0.7850199, -1.856824, 0.282353, 1, 0, 1,
-0.6051158, -0.08152326, -0.972338, 0.2784314, 1, 0, 1,
-0.6014802, 1.848264, 0.478442, 0.2705882, 1, 0, 1,
-0.5968973, 0.5920792, -0.3546456, 0.2666667, 1, 0, 1,
-0.5953444, -0.3241257, -3.308761, 0.2588235, 1, 0, 1,
-0.5917369, -0.4348108, -1.144529, 0.254902, 1, 0, 1,
-0.5844391, -0.09052959, -1.394893, 0.2470588, 1, 0, 1,
-0.5827041, 0.09408413, -2.522582, 0.2431373, 1, 0, 1,
-0.5790107, -0.6085567, -2.473322, 0.2352941, 1, 0, 1,
-0.5736154, 0.6571343, -0.4797306, 0.2313726, 1, 0, 1,
-0.5714478, 0.2733724, -1.152128, 0.2235294, 1, 0, 1,
-0.5707874, 0.2760405, -1.274508, 0.2196078, 1, 0, 1,
-0.5702136, 0.6524156, -0.4154632, 0.2117647, 1, 0, 1,
-0.5697454, 0.2440251, 0.08730028, 0.2078431, 1, 0, 1,
-0.5686453, 1.534863, 0.003698158, 0.2, 1, 0, 1,
-0.567762, -2.039421, -3.073166, 0.1921569, 1, 0, 1,
-0.5669792, -0.3371704, -2.85403, 0.1882353, 1, 0, 1,
-0.5631242, -2.277731, -2.906393, 0.1803922, 1, 0, 1,
-0.5617999, 0.1151775, -1.061046, 0.1764706, 1, 0, 1,
-0.558599, 0.04011148, -2.269473, 0.1686275, 1, 0, 1,
-0.5574712, -1.267519, -2.548081, 0.1647059, 1, 0, 1,
-0.5527756, 1.114004, -1.558059, 0.1568628, 1, 0, 1,
-0.5509219, 0.2024671, -0.1378451, 0.1529412, 1, 0, 1,
-0.5431921, -0.6206941, -1.039116, 0.145098, 1, 0, 1,
-0.5362359, 2.174786, 0.3806567, 0.1411765, 1, 0, 1,
-0.5286919, -0.8565777, -4.646029, 0.1333333, 1, 0, 1,
-0.5267001, 1.227812, -1.599125, 0.1294118, 1, 0, 1,
-0.5241599, -0.8129534, -1.176128, 0.1215686, 1, 0, 1,
-0.5233781, 3.367148, -0.7176061, 0.1176471, 1, 0, 1,
-0.5226563, 0.1457294, -0.3774613, 0.1098039, 1, 0, 1,
-0.5203217, 2.001343, -0.3864946, 0.1058824, 1, 0, 1,
-0.5197952, -0.707582, -2.756834, 0.09803922, 1, 0, 1,
-0.5180776, -0.1045351, -1.073904, 0.09019608, 1, 0, 1,
-0.5162218, -1.340721, -0.5103495, 0.08627451, 1, 0, 1,
-0.5094944, -0.6472542, -2.570756, 0.07843138, 1, 0, 1,
-0.5082119, 1.371992, -0.4851708, 0.07450981, 1, 0, 1,
-0.4946548, -0.4817541, -2.904758, 0.06666667, 1, 0, 1,
-0.4928002, -0.8486837, -2.231822, 0.0627451, 1, 0, 1,
-0.4918991, -1.356003, -2.482099, 0.05490196, 1, 0, 1,
-0.4891995, -0.2867748, -0.00491133, 0.05098039, 1, 0, 1,
-0.4855892, 0.1473334, -0.4068704, 0.04313726, 1, 0, 1,
-0.4780649, -0.4015498, -0.5817429, 0.03921569, 1, 0, 1,
-0.4776945, 0.4358382, -1.393481, 0.03137255, 1, 0, 1,
-0.4761344, -0.7785429, -3.095139, 0.02745098, 1, 0, 1,
-0.4707447, 0.5133191, 0.1065242, 0.01960784, 1, 0, 1,
-0.4704161, 1.38326, -2.65686, 0.01568628, 1, 0, 1,
-0.4674878, -0.8897688, -2.686739, 0.007843138, 1, 0, 1,
-0.465489, -0.5098252, -2.883885, 0.003921569, 1, 0, 1,
-0.4623868, -0.4181081, -0.8628054, 0, 1, 0.003921569, 1,
-0.4620987, -1.200778, -1.337774, 0, 1, 0.01176471, 1,
-0.4620063, 0.1973701, -1.468772, 0, 1, 0.01568628, 1,
-0.4608419, -2.738168, -2.005742, 0, 1, 0.02352941, 1,
-0.4584926, 0.01169578, -0.9596039, 0, 1, 0.02745098, 1,
-0.457954, 0.03582032, -2.167851, 0, 1, 0.03529412, 1,
-0.4536376, 1.080085, -1.514805, 0, 1, 0.03921569, 1,
-0.4486688, 0.02384578, -1.506713, 0, 1, 0.04705882, 1,
-0.4387385, -0.6870562, -2.781228, 0, 1, 0.05098039, 1,
-0.4366219, 0.8750055, 0.9953239, 0, 1, 0.05882353, 1,
-0.4342419, 0.2514195, -1.58338, 0, 1, 0.0627451, 1,
-0.4327191, -0.1259142, -1.100434, 0, 1, 0.07058824, 1,
-0.4325953, -0.710924, -1.925202, 0, 1, 0.07450981, 1,
-0.4230498, -0.6067716, -1.777097, 0, 1, 0.08235294, 1,
-0.4206966, 0.8635844, -0.5986366, 0, 1, 0.08627451, 1,
-0.4164569, 1.284462, 0.337308, 0, 1, 0.09411765, 1,
-0.4117806, -0.7162944, -3.225441, 0, 1, 0.1019608, 1,
-0.4085596, -1.237783, -3.952712, 0, 1, 0.1058824, 1,
-0.4058561, -0.6090295, -0.9117103, 0, 1, 0.1137255, 1,
-0.3989197, -0.4783113, -2.886258, 0, 1, 0.1176471, 1,
-0.3967713, -1.610682, -2.685706, 0, 1, 0.1254902, 1,
-0.3967397, -0.04631349, -1.293497, 0, 1, 0.1294118, 1,
-0.3919373, 0.3579865, -1.668631, 0, 1, 0.1372549, 1,
-0.3906015, 1.008113, -0.3397541, 0, 1, 0.1411765, 1,
-0.3905917, 0.5215864, 0.3236884, 0, 1, 0.1490196, 1,
-0.38225, -0.4947421, -0.8991107, 0, 1, 0.1529412, 1,
-0.3791027, -0.3136941, -2.143052, 0, 1, 0.1607843, 1,
-0.3762509, -0.7093071, -5.050866, 0, 1, 0.1647059, 1,
-0.3757989, -0.6349152, -1.138583, 0, 1, 0.172549, 1,
-0.3754024, 0.1161788, -1.358714, 0, 1, 0.1764706, 1,
-0.3752407, -0.1065407, -1.79395, 0, 1, 0.1843137, 1,
-0.3719071, -0.8790621, -1.867582, 0, 1, 0.1882353, 1,
-0.3679624, -1.064452, -4.323415, 0, 1, 0.1960784, 1,
-0.3646336, -0.687183, -2.16865, 0, 1, 0.2039216, 1,
-0.3579159, -1.301858, -4.202943, 0, 1, 0.2078431, 1,
-0.3573858, -0.1318977, -2.483588, 0, 1, 0.2156863, 1,
-0.3537049, -1.282586, -3.264269, 0, 1, 0.2196078, 1,
-0.3518944, 0.1130973, -1.45762, 0, 1, 0.227451, 1,
-0.3488213, -0.1492414, -2.861464, 0, 1, 0.2313726, 1,
-0.3480993, 1.729861, 0.1797686, 0, 1, 0.2392157, 1,
-0.3474761, -0.2099348, -2.698561, 0, 1, 0.2431373, 1,
-0.3454164, 1.209422, 0.8493291, 0, 1, 0.2509804, 1,
-0.3442997, -0.919283, -3.472869, 0, 1, 0.254902, 1,
-0.3394998, -0.1543422, -1.214984, 0, 1, 0.2627451, 1,
-0.3381949, -1.181526, -2.871225, 0, 1, 0.2666667, 1,
-0.3370349, -0.1771539, -1.946425, 0, 1, 0.2745098, 1,
-0.331107, 1.463145, 1.449789, 0, 1, 0.2784314, 1,
-0.3302823, 2.114969, -0.5538646, 0, 1, 0.2862745, 1,
-0.3284286, -0.4556609, -3.397661, 0, 1, 0.2901961, 1,
-0.3259833, 0.03492153, -0.7730135, 0, 1, 0.2980392, 1,
-0.3241822, 1.136419, -2.117604, 0, 1, 0.3058824, 1,
-0.3220133, 0.510901, -1.744739, 0, 1, 0.3098039, 1,
-0.3218605, 0.7053031, 0.5936698, 0, 1, 0.3176471, 1,
-0.3215481, 1.008421, -0.05783139, 0, 1, 0.3215686, 1,
-0.3184676, -1.117902, -2.680103, 0, 1, 0.3294118, 1,
-0.3169623, 0.9896945, -0.17925, 0, 1, 0.3333333, 1,
-0.3113778, -0.6675513, -3.066282, 0, 1, 0.3411765, 1,
-0.3018496, -0.008547826, -2.049456, 0, 1, 0.345098, 1,
-0.3006224, -0.6339833, -2.564805, 0, 1, 0.3529412, 1,
-0.2935835, -0.96802, -4.161074, 0, 1, 0.3568628, 1,
-0.2924795, -0.9464666, -2.780494, 0, 1, 0.3647059, 1,
-0.2892228, 0.3817399, -1.415725, 0, 1, 0.3686275, 1,
-0.2873155, -0.02940707, -1.302412, 0, 1, 0.3764706, 1,
-0.2868585, 0.4310971, -1.878216, 0, 1, 0.3803922, 1,
-0.2865057, -1.091473, -3.230582, 0, 1, 0.3882353, 1,
-0.2841749, -1.43004, -2.197696, 0, 1, 0.3921569, 1,
-0.2811292, -0.7297812, -1.785129, 0, 1, 0.4, 1,
-0.2808045, -1.05533, -2.422362, 0, 1, 0.4078431, 1,
-0.2755844, 0.4216128, -1.502027, 0, 1, 0.4117647, 1,
-0.2742366, -1.767812, -3.367224, 0, 1, 0.4196078, 1,
-0.2710135, 0.2973051, 1.474832, 0, 1, 0.4235294, 1,
-0.2692472, 0.4547412, 0.3382219, 0, 1, 0.4313726, 1,
-0.269195, -0.4924877, -2.591424, 0, 1, 0.4352941, 1,
-0.2665475, 1.133779, -1.838736, 0, 1, 0.4431373, 1,
-0.2652932, 1.832799, -0.7278184, 0, 1, 0.4470588, 1,
-0.2486101, 0.9257417, 0.9912201, 0, 1, 0.454902, 1,
-0.241788, 0.472751, -0.472553, 0, 1, 0.4588235, 1,
-0.2407596, -0.7082748, -3.409456, 0, 1, 0.4666667, 1,
-0.2386408, 0.1639725, -0.763706, 0, 1, 0.4705882, 1,
-0.2361978, -1.239976, -4.456117, 0, 1, 0.4784314, 1,
-0.2357287, -0.07478053, -2.852368, 0, 1, 0.4823529, 1,
-0.2345109, -0.1607651, -1.296382, 0, 1, 0.4901961, 1,
-0.2310717, -0.6070927, -3.283467, 0, 1, 0.4941176, 1,
-0.2302822, 0.7812445, 0.413932, 0, 1, 0.5019608, 1,
-0.2281705, -0.3964759, -3.268944, 0, 1, 0.509804, 1,
-0.2279951, 0.7437391, -1.98652, 0, 1, 0.5137255, 1,
-0.226247, 0.9623812, 0.9846434, 0, 1, 0.5215687, 1,
-0.2249643, 0.395259, -0.004785627, 0, 1, 0.5254902, 1,
-0.2248241, -0.8291221, -1.783692, 0, 1, 0.5333334, 1,
-0.222054, 0.1332179, -0.474432, 0, 1, 0.5372549, 1,
-0.2205212, 0.3679873, -1.698361, 0, 1, 0.5450981, 1,
-0.2199718, 0.5184457, 0.4667674, 0, 1, 0.5490196, 1,
-0.2172247, -0.5592873, -3.637513, 0, 1, 0.5568628, 1,
-0.2166979, -1.212525, -3.492371, 0, 1, 0.5607843, 1,
-0.2140733, -1.510344, -4.291552, 0, 1, 0.5686275, 1,
-0.2115722, -0.219617, -2.76291, 0, 1, 0.572549, 1,
-0.208746, 1.38549, -0.2519987, 0, 1, 0.5803922, 1,
-0.2085171, 0.9685894, 0.06621402, 0, 1, 0.5843138, 1,
-0.2054121, -0.3021995, -4.565059, 0, 1, 0.5921569, 1,
-0.2036528, 0.06324083, -1.300685, 0, 1, 0.5960785, 1,
-0.2010995, 3.470651, 0.770988, 0, 1, 0.6039216, 1,
-0.1978706, 0.9349291, -0.0753231, 0, 1, 0.6117647, 1,
-0.1973171, 0.5723519, 0.06054169, 0, 1, 0.6156863, 1,
-0.1947143, 0.7589302, -0.9898509, 0, 1, 0.6235294, 1,
-0.1915991, 0.8624179, -1.682068, 0, 1, 0.627451, 1,
-0.1901073, -0.3064707, -1.677021, 0, 1, 0.6352941, 1,
-0.1897561, 0.3561755, -0.422672, 0, 1, 0.6392157, 1,
-0.1891168, 0.0593382, -0.2277968, 0, 1, 0.6470588, 1,
-0.1891038, -0.5960985, -1.93145, 0, 1, 0.6509804, 1,
-0.1890202, 0.825276, 0.4280085, 0, 1, 0.6588235, 1,
-0.1885368, 1.669239, 0.1244983, 0, 1, 0.6627451, 1,
-0.1868938, 0.2120366, -0.2072921, 0, 1, 0.6705883, 1,
-0.1865486, -1.037979, -3.219664, 0, 1, 0.6745098, 1,
-0.1799372, 0.6521574, 0.3714663, 0, 1, 0.682353, 1,
-0.1782219, -0.8053854, -3.13145, 0, 1, 0.6862745, 1,
-0.1775762, 1.236459, -0.9387842, 0, 1, 0.6941177, 1,
-0.1771156, 0.9830245, 0.8167824, 0, 1, 0.7019608, 1,
-0.1749395, -0.9957076, -1.732157, 0, 1, 0.7058824, 1,
-0.1727189, -0.3221669, -1.321395, 0, 1, 0.7137255, 1,
-0.1725852, 0.1936002, -4.639221, 0, 1, 0.7176471, 1,
-0.1700053, -2.435792, -2.011332, 0, 1, 0.7254902, 1,
-0.1678817, -1.127296, -2.656833, 0, 1, 0.7294118, 1,
-0.1618728, 0.3725421, -0.9323241, 0, 1, 0.7372549, 1,
-0.1585676, 0.1488695, -0.3633426, 0, 1, 0.7411765, 1,
-0.1571887, 0.8243336, 0.1779771, 0, 1, 0.7490196, 1,
-0.1523216, 0.07757093, -1.638187, 0, 1, 0.7529412, 1,
-0.1505413, -0.2361115, -1.038608, 0, 1, 0.7607843, 1,
-0.1471121, 0.04699884, -1.804634, 0, 1, 0.7647059, 1,
-0.1456342, 0.191649, 0.500138, 0, 1, 0.772549, 1,
-0.1453176, 0.5383388, -1.358737, 0, 1, 0.7764706, 1,
-0.1326929, -0.6498882, -4.303092, 0, 1, 0.7843137, 1,
-0.131811, -2.147573, -1.643512, 0, 1, 0.7882353, 1,
-0.1296932, -0.5610785, -1.645597, 0, 1, 0.7960784, 1,
-0.1267837, 0.3346092, -0.6609875, 0, 1, 0.8039216, 1,
-0.1200877, -0.2338071, -2.856733, 0, 1, 0.8078431, 1,
-0.1184133, 1.901433, 1.011798, 0, 1, 0.8156863, 1,
-0.1143635, 0.08453853, 0.9161124, 0, 1, 0.8196079, 1,
-0.1141142, 2.154383, 1.386712, 0, 1, 0.827451, 1,
-0.1092207, 0.6441235, 0.5657989, 0, 1, 0.8313726, 1,
-0.108507, 1.683195, -1.381474, 0, 1, 0.8392157, 1,
-0.1066278, -0.3563904, -2.731503, 0, 1, 0.8431373, 1,
-0.1025611, 0.4213684, 0.5297278, 0, 1, 0.8509804, 1,
-0.09830406, 1.080346, -0.01192283, 0, 1, 0.854902, 1,
-0.0926032, 0.4532885, -1.526573, 0, 1, 0.8627451, 1,
-0.09116323, -0.1502319, -1.704167, 0, 1, 0.8666667, 1,
-0.09056679, 0.3881663, -0.02822067, 0, 1, 0.8745098, 1,
-0.08915491, -1.363475, -3.738681, 0, 1, 0.8784314, 1,
-0.08862784, 0.1087636, -1.719704, 0, 1, 0.8862745, 1,
-0.08480735, 0.4990808, 1.497904, 0, 1, 0.8901961, 1,
-0.08298342, -0.5391718, -1.402025, 0, 1, 0.8980392, 1,
-0.08198275, -0.1865943, -3.671994, 0, 1, 0.9058824, 1,
-0.08156391, -0.5098053, -3.174366, 0, 1, 0.9098039, 1,
-0.08062553, 1.254477, 0.3639221, 0, 1, 0.9176471, 1,
-0.08039079, 0.5987164, 2.29056, 0, 1, 0.9215686, 1,
-0.08003352, 2.107102, 1.428161, 0, 1, 0.9294118, 1,
-0.07955997, -0.6837228, -2.820289, 0, 1, 0.9333333, 1,
-0.0791028, 0.1311612, -1.048822, 0, 1, 0.9411765, 1,
-0.07867137, -1.18139, -4.40639, 0, 1, 0.945098, 1,
-0.07244439, 0.2748905, 0.6853808, 0, 1, 0.9529412, 1,
-0.0600464, -0.3817639, -2.472314, 0, 1, 0.9568627, 1,
-0.05947074, 0.05869602, -1.435885, 0, 1, 0.9647059, 1,
-0.059396, 0.0211083, 0.04160969, 0, 1, 0.9686275, 1,
-0.05674677, 0.3460733, 1.560616, 0, 1, 0.9764706, 1,
-0.05645752, -0.5913819, -1.051237, 0, 1, 0.9803922, 1,
-0.05503824, -0.2761274, -2.935565, 0, 1, 0.9882353, 1,
-0.05480801, 2.201991, -0.02803973, 0, 1, 0.9921569, 1,
-0.05300443, 0.3828125, -0.741621, 0, 1, 1, 1,
-0.05024324, -1.83241, -3.577028, 0, 0.9921569, 1, 1,
-0.04862381, -0.7825504, -3.241462, 0, 0.9882353, 1, 1,
-0.04535547, -0.5189275, -2.069471, 0, 0.9803922, 1, 1,
-0.04347267, -0.4435904, -2.599023, 0, 0.9764706, 1, 1,
-0.04286862, 0.5293124, 0.7935998, 0, 0.9686275, 1, 1,
-0.04115932, 0.184364, -1.110293, 0, 0.9647059, 1, 1,
-0.0398088, 0.2691713, 1.198802, 0, 0.9568627, 1, 1,
-0.03900479, -0.9552897, -2.995843, 0, 0.9529412, 1, 1,
-0.03537259, 0.1623312, -1.530476, 0, 0.945098, 1, 1,
-0.03275004, 1.365933, 1.809998, 0, 0.9411765, 1, 1,
-0.03145662, -0.2454085, -3.118719, 0, 0.9333333, 1, 1,
-0.02921987, -1.475843, -4.191747, 0, 0.9294118, 1, 1,
-0.02795773, -0.5850033, -4.020816, 0, 0.9215686, 1, 1,
-0.02718744, 0.4158481, 0.05164824, 0, 0.9176471, 1, 1,
-0.02714957, 2.151865, -0.3204317, 0, 0.9098039, 1, 1,
-0.0236501, 1.628161, 0.4016729, 0, 0.9058824, 1, 1,
-0.02037816, 0.5110572, -1.556134, 0, 0.8980392, 1, 1,
-0.02023806, 0.1223075, -0.5022017, 0, 0.8901961, 1, 1,
-0.01676162, -1.880075, -3.463033, 0, 0.8862745, 1, 1,
-0.01528735, 1.271763, -0.1953355, 0, 0.8784314, 1, 1,
-0.01339364, -1.45195, -4.590995, 0, 0.8745098, 1, 1,
-0.01123968, 1.005702, -0.06074229, 0, 0.8666667, 1, 1,
-0.006661291, -0.2197399, -4.152945, 0, 0.8627451, 1, 1,
-0.005891579, -2.324741, -2.455534, 0, 0.854902, 1, 1,
-0.00477907, -1.451943, -5.319676, 0, 0.8509804, 1, 1,
0.005323127, 0.4302277, -0.1907243, 0, 0.8431373, 1, 1,
0.007681339, -0.7595139, 3.148036, 0, 0.8392157, 1, 1,
0.008039893, -0.08918777, 4.82626, 0, 0.8313726, 1, 1,
0.008145638, 0.2049559, -0.007678064, 0, 0.827451, 1, 1,
0.0104766, 0.005902303, -0.7580333, 0, 0.8196079, 1, 1,
0.01262039, 0.4338948, -0.4303009, 0, 0.8156863, 1, 1,
0.02109097, 0.5332512, 0.3973905, 0, 0.8078431, 1, 1,
0.02787372, 1.081766, -1.28346, 0, 0.8039216, 1, 1,
0.02956092, -0.23661, 1.782765, 0, 0.7960784, 1, 1,
0.03029234, 0.4688313, 0.596314, 0, 0.7882353, 1, 1,
0.03029943, -0.8617895, 3.043093, 0, 0.7843137, 1, 1,
0.0315308, 1.191138, 1.930349, 0, 0.7764706, 1, 1,
0.03170316, 1.5954, -1.368615, 0, 0.772549, 1, 1,
0.03295622, -1.769082, 4.711039, 0, 0.7647059, 1, 1,
0.03401043, -1.929208, 3.364827, 0, 0.7607843, 1, 1,
0.03462308, -2.357184, 2.640754, 0, 0.7529412, 1, 1,
0.03598135, -0.1950267, 2.094057, 0, 0.7490196, 1, 1,
0.03874534, 0.7165754, -0.3405786, 0, 0.7411765, 1, 1,
0.04125085, -0.3813938, 2.511902, 0, 0.7372549, 1, 1,
0.0415789, -0.08686166, 1.726908, 0, 0.7294118, 1, 1,
0.04361423, -0.7098655, 2.319189, 0, 0.7254902, 1, 1,
0.04394938, -0.9817563, 1.061672, 0, 0.7176471, 1, 1,
0.04400345, 1.746266, 0.2527684, 0, 0.7137255, 1, 1,
0.04506771, 0.2059964, -1.484136, 0, 0.7058824, 1, 1,
0.04530884, -0.3352599, 2.763112, 0, 0.6980392, 1, 1,
0.05095234, -1.072022, 3.271164, 0, 0.6941177, 1, 1,
0.05150785, 1.004333, -0.1749752, 0, 0.6862745, 1, 1,
0.05384677, -0.2147966, 2.293665, 0, 0.682353, 1, 1,
0.0591038, 1.249238, 0.008593612, 0, 0.6745098, 1, 1,
0.06493104, -1.243732, 4.515409, 0, 0.6705883, 1, 1,
0.06641272, 1.413227, 0.5995184, 0, 0.6627451, 1, 1,
0.06989209, 0.3279626, 1.073289, 0, 0.6588235, 1, 1,
0.07020141, 0.2150127, 0.1998989, 0, 0.6509804, 1, 1,
0.07387835, 0.6877362, 0.2173205, 0, 0.6470588, 1, 1,
0.08719519, 1.527733, -0.3932951, 0, 0.6392157, 1, 1,
0.08759847, 2.397402, 0.6573533, 0, 0.6352941, 1, 1,
0.08966937, 1.397957, -0.4293324, 0, 0.627451, 1, 1,
0.09357271, -0.7839313, 3.626555, 0, 0.6235294, 1, 1,
0.09582839, -0.4079471, 4.487485, 0, 0.6156863, 1, 1,
0.09820837, -0.4720966, 4.488526, 0, 0.6117647, 1, 1,
0.1050753, 0.497124, 1.338418, 0, 0.6039216, 1, 1,
0.1052645, -0.7463474, 1.870478, 0, 0.5960785, 1, 1,
0.106132, -0.2490421, 1.319405, 0, 0.5921569, 1, 1,
0.1073177, -0.6852923, 2.536252, 0, 0.5843138, 1, 1,
0.1096378, -0.7442917, 3.38588, 0, 0.5803922, 1, 1,
0.1102254, -0.5516002, 2.983519, 0, 0.572549, 1, 1,
0.1112122, -0.9837993, 3.488398, 0, 0.5686275, 1, 1,
0.1121692, -0.05357668, 0.6769999, 0, 0.5607843, 1, 1,
0.1175986, -1.146783, 3.251201, 0, 0.5568628, 1, 1,
0.1228219, 0.7597949, -0.1903901, 0, 0.5490196, 1, 1,
0.1293328, -0.170621, 3.396698, 0, 0.5450981, 1, 1,
0.1306134, -1.278965, 2.59312, 0, 0.5372549, 1, 1,
0.1338489, 0.4719472, -0.4528759, 0, 0.5333334, 1, 1,
0.1346428, 0.8267092, -0.1419685, 0, 0.5254902, 1, 1,
0.1357662, 0.8123279, -1.195239, 0, 0.5215687, 1, 1,
0.146876, -1.456475, 4.515286, 0, 0.5137255, 1, 1,
0.1483683, -0.2314051, 3.771817, 0, 0.509804, 1, 1,
0.1496861, 0.403979, 1.447581, 0, 0.5019608, 1, 1,
0.1547022, -0.8716266, 4.235902, 0, 0.4941176, 1, 1,
0.1568272, 0.2327479, -0.07785021, 0, 0.4901961, 1, 1,
0.1573761, 0.1938866, -0.4262793, 0, 0.4823529, 1, 1,
0.159561, -1.371337, 2.961004, 0, 0.4784314, 1, 1,
0.1631816, 0.2676646, 0.01809002, 0, 0.4705882, 1, 1,
0.1636132, -0.9075176, 2.138385, 0, 0.4666667, 1, 1,
0.1679398, 0.948411, 1.92798, 0, 0.4588235, 1, 1,
0.1745679, -0.1618518, 2.282804, 0, 0.454902, 1, 1,
0.1808219, 0.9658424, -0.5304602, 0, 0.4470588, 1, 1,
0.185538, -1.24686, 3.089265, 0, 0.4431373, 1, 1,
0.1862998, 1.254694, 0.8937164, 0, 0.4352941, 1, 1,
0.189308, -1.594676, 3.038267, 0, 0.4313726, 1, 1,
0.1930794, 0.3731856, -1.74787, 0, 0.4235294, 1, 1,
0.1960072, 1.12215, -0.3602395, 0, 0.4196078, 1, 1,
0.1989015, 1.132774, -0.8556066, 0, 0.4117647, 1, 1,
0.2000122, -0.7337333, 1.971824, 0, 0.4078431, 1, 1,
0.2088858, 0.3234747, 1.256539, 0, 0.4, 1, 1,
0.2098331, -1.687469, 2.421342, 0, 0.3921569, 1, 1,
0.2135407, -1.11715, 4.147723, 0, 0.3882353, 1, 1,
0.2141433, 0.2970464, 0.9675003, 0, 0.3803922, 1, 1,
0.2172322, -1.20528, 0.8710501, 0, 0.3764706, 1, 1,
0.2181247, 0.9487891, -1.506129, 0, 0.3686275, 1, 1,
0.2279459, 1.512364, 0.04649536, 0, 0.3647059, 1, 1,
0.2315871, -0.5377598, 1.669901, 0, 0.3568628, 1, 1,
0.232549, -0.2202945, 2.106482, 0, 0.3529412, 1, 1,
0.2361118, 0.4290809, 0.9255949, 0, 0.345098, 1, 1,
0.2410776, 0.9885415, -0.7816377, 0, 0.3411765, 1, 1,
0.2430237, -1.121015, 2.523686, 0, 0.3333333, 1, 1,
0.2435676, 0.7440349, -0.02610162, 0, 0.3294118, 1, 1,
0.2443795, -0.7314425, 2.393002, 0, 0.3215686, 1, 1,
0.2444872, 0.3125988, -0.2292232, 0, 0.3176471, 1, 1,
0.2459912, -0.6315817, 1.363821, 0, 0.3098039, 1, 1,
0.2463096, -0.8441411, 2.032066, 0, 0.3058824, 1, 1,
0.2467951, 0.3544084, 1.919225, 0, 0.2980392, 1, 1,
0.2497237, -0.1950144, 3.657015, 0, 0.2901961, 1, 1,
0.2505359, -1.008958, 2.80406, 0, 0.2862745, 1, 1,
0.2508619, -0.3539746, 2.312436, 0, 0.2784314, 1, 1,
0.2560147, -1.168804, 3.916836, 0, 0.2745098, 1, 1,
0.2602132, 1.243706, -2.424943, 0, 0.2666667, 1, 1,
0.263095, 0.7449446, -0.2982771, 0, 0.2627451, 1, 1,
0.2648586, 0.2189956, 1.867342, 0, 0.254902, 1, 1,
0.267922, 0.8673295, -0.01390127, 0, 0.2509804, 1, 1,
0.2691756, -0.6618924, 3.825539, 0, 0.2431373, 1, 1,
0.270492, -0.9071581, 3.153342, 0, 0.2392157, 1, 1,
0.2712526, 0.1503927, 1.513987, 0, 0.2313726, 1, 1,
0.274349, -0.5919497, 2.232026, 0, 0.227451, 1, 1,
0.2747446, 1.623082, 0.01604459, 0, 0.2196078, 1, 1,
0.2753981, -0.2066947, 2.879594, 0, 0.2156863, 1, 1,
0.2794618, 0.8693986, 2.421439, 0, 0.2078431, 1, 1,
0.2811027, -0.5326849, 3.482179, 0, 0.2039216, 1, 1,
0.2830912, -1.144479, 3.381858, 0, 0.1960784, 1, 1,
0.2845908, 1.605097, -1.367759, 0, 0.1882353, 1, 1,
0.2869867, -1.213712, 2.399678, 0, 0.1843137, 1, 1,
0.2874812, 0.5221705, -1.843832, 0, 0.1764706, 1, 1,
0.2904701, -0.3784401, 1.543027, 0, 0.172549, 1, 1,
0.2942208, -0.05489893, -0.7196635, 0, 0.1647059, 1, 1,
0.300512, -0.2464814, 2.710303, 0, 0.1607843, 1, 1,
0.3048971, 0.3209058, 2.227762, 0, 0.1529412, 1, 1,
0.3102986, -0.268116, 1.211248, 0, 0.1490196, 1, 1,
0.3119695, -0.01522041, 2.574069, 0, 0.1411765, 1, 1,
0.3135843, 0.2320387, 1.765705, 0, 0.1372549, 1, 1,
0.3171412, 0.7016081, 0.06155696, 0, 0.1294118, 1, 1,
0.3183774, 0.2673034, 1.369121, 0, 0.1254902, 1, 1,
0.3188113, 1.121445, 1.113038, 0, 0.1176471, 1, 1,
0.3194869, 1.430112, 0.3664597, 0, 0.1137255, 1, 1,
0.3256746, -0.1779491, 1.614591, 0, 0.1058824, 1, 1,
0.3277863, -1.181409, 3.538764, 0, 0.09803922, 1, 1,
0.3374312, 0.1986538, -1.236652, 0, 0.09411765, 1, 1,
0.3419261, -0.1875501, 1.181859, 0, 0.08627451, 1, 1,
0.3426588, -0.5888067, 1.57691, 0, 0.08235294, 1, 1,
0.3433784, 1.212416, -0.4076996, 0, 0.07450981, 1, 1,
0.3437499, -0.5598546, 1.824349, 0, 0.07058824, 1, 1,
0.3522129, -0.1189279, 1.592224, 0, 0.0627451, 1, 1,
0.3546726, 0.7382504, 0.07082686, 0, 0.05882353, 1, 1,
0.3595673, 0.2942655, -2.959666, 0, 0.05098039, 1, 1,
0.3600243, 2.228184, 1.301839, 0, 0.04705882, 1, 1,
0.3636758, -0.3496056, 2.674695, 0, 0.03921569, 1, 1,
0.3688063, -0.03629601, 0.913749, 0, 0.03529412, 1, 1,
0.3707865, 0.1921776, -0.3333559, 0, 0.02745098, 1, 1,
0.3715124, 0.02869328, 2.433393, 0, 0.02352941, 1, 1,
0.3726336, -0.7854792, 2.576327, 0, 0.01568628, 1, 1,
0.3743891, -1.272941, 2.256505, 0, 0.01176471, 1, 1,
0.3759469, -0.5898802, 4.174653, 0, 0.003921569, 1, 1,
0.3794325, -1.050749, 2.685373, 0.003921569, 0, 1, 1,
0.3856112, -0.8558985, 3.618915, 0.007843138, 0, 1, 1,
0.3859665, -1.274977, 3.03277, 0.01568628, 0, 1, 1,
0.386048, -0.9559489, 1.280867, 0.01960784, 0, 1, 1,
0.386803, -1.033992, 3.793672, 0.02745098, 0, 1, 1,
0.3881486, -0.3983399, 1.260182, 0.03137255, 0, 1, 1,
0.3906803, -0.1343336, 1.449532, 0.03921569, 0, 1, 1,
0.391023, -1.201174, 3.67967, 0.04313726, 0, 1, 1,
0.3975713, -1.155289, 1.440558, 0.05098039, 0, 1, 1,
0.3980054, 1.860316, 0.9127765, 0.05490196, 0, 1, 1,
0.3983469, -1.507283, 1.700356, 0.0627451, 0, 1, 1,
0.4004934, 0.5802336, 1.987488, 0.06666667, 0, 1, 1,
0.4102627, 0.8182374, -0.06045784, 0.07450981, 0, 1, 1,
0.4130754, -0.3475849, 3.494833, 0.07843138, 0, 1, 1,
0.4145862, -0.7064476, 3.296916, 0.08627451, 0, 1, 1,
0.4162536, -0.4700653, 1.557255, 0.09019608, 0, 1, 1,
0.4177606, -0.3243917, 1.443239, 0.09803922, 0, 1, 1,
0.4189282, 1.857139, -0.01114538, 0.1058824, 0, 1, 1,
0.4200988, -1.423058, 2.866612, 0.1098039, 0, 1, 1,
0.4226107, 1.31095, 0.6042644, 0.1176471, 0, 1, 1,
0.4264975, 0.1777123, 1.436156, 0.1215686, 0, 1, 1,
0.4306115, -0.3355628, 0.5967388, 0.1294118, 0, 1, 1,
0.4310349, 1.341502, 1.196345, 0.1333333, 0, 1, 1,
0.4319241, 0.8445354, 2.434719, 0.1411765, 0, 1, 1,
0.4321105, 0.3283626, 0.1558341, 0.145098, 0, 1, 1,
0.4326182, 0.6024417, 0.3790368, 0.1529412, 0, 1, 1,
0.4333123, -1.455006, 1.47162, 0.1568628, 0, 1, 1,
0.4408582, -0.1053221, 0.1009889, 0.1647059, 0, 1, 1,
0.442886, -0.3736348, 1.496498, 0.1686275, 0, 1, 1,
0.4437355, 0.7340749, 2.701069, 0.1764706, 0, 1, 1,
0.4493439, 1.111437, 1.343368, 0.1803922, 0, 1, 1,
0.452632, -0.3487538, 2.402684, 0.1882353, 0, 1, 1,
0.4536752, 0.7175882, 0.3268202, 0.1921569, 0, 1, 1,
0.4562343, 0.3665982, 0.4003557, 0.2, 0, 1, 1,
0.4584578, 0.3306357, 3.035513, 0.2078431, 0, 1, 1,
0.4611156, 0.1241724, 2.060442, 0.2117647, 0, 1, 1,
0.4618913, -0.4898148, 1.751976, 0.2196078, 0, 1, 1,
0.4637237, -0.01675281, 2.077034, 0.2235294, 0, 1, 1,
0.4639398, -0.3853704, 2.233165, 0.2313726, 0, 1, 1,
0.4671733, -2.644422, 2.98021, 0.2352941, 0, 1, 1,
0.4694573, 1.563248, 0.8032845, 0.2431373, 0, 1, 1,
0.4710914, -1.277987, 2.763572, 0.2470588, 0, 1, 1,
0.4745875, -0.6873061, 1.330723, 0.254902, 0, 1, 1,
0.4806821, 0.823762, 1.162066, 0.2588235, 0, 1, 1,
0.4818629, -1.258495, 0.8007864, 0.2666667, 0, 1, 1,
0.4856708, 1.389977, -0.09890159, 0.2705882, 0, 1, 1,
0.4995547, -0.06770542, 1.74183, 0.2784314, 0, 1, 1,
0.5012274, -0.8905298, 0.2746429, 0.282353, 0, 1, 1,
0.5022988, 2.121553, -0.4394506, 0.2901961, 0, 1, 1,
0.5055801, -0.168256, 2.546452, 0.2941177, 0, 1, 1,
0.5072852, -0.5426828, 1.003548, 0.3019608, 0, 1, 1,
0.511192, -0.1252853, 2.839798, 0.3098039, 0, 1, 1,
0.5114182, 0.1070869, 1.874604, 0.3137255, 0, 1, 1,
0.5172643, 0.4007885, -0.4748665, 0.3215686, 0, 1, 1,
0.5197341, -1.205635, 2.088507, 0.3254902, 0, 1, 1,
0.519888, 1.719026, 0.7909542, 0.3333333, 0, 1, 1,
0.5249485, -0.09910347, 1.674088, 0.3372549, 0, 1, 1,
0.527962, 0.9427045, 1.829038, 0.345098, 0, 1, 1,
0.529029, 0.6208393, 0.638113, 0.3490196, 0, 1, 1,
0.5353652, -1.586532, 1.607054, 0.3568628, 0, 1, 1,
0.5363861, 1.471412, 0.4958289, 0.3607843, 0, 1, 1,
0.5521762, 0.6770234, -0.02521333, 0.3686275, 0, 1, 1,
0.5548466, 0.2517743, 0.5653741, 0.372549, 0, 1, 1,
0.5592412, 0.009959416, 3.043238, 0.3803922, 0, 1, 1,
0.5611705, -0.2733909, 3.998671, 0.3843137, 0, 1, 1,
0.5615358, 1.156892, -1.384818, 0.3921569, 0, 1, 1,
0.5663354, 0.8442448, 1.030632, 0.3960784, 0, 1, 1,
0.5672411, 0.6049621, 0.0215919, 0.4039216, 0, 1, 1,
0.568114, -1.422381, 2.503924, 0.4117647, 0, 1, 1,
0.5713075, -0.8603056, 1.609531, 0.4156863, 0, 1, 1,
0.5772764, -1.390719, 3.178265, 0.4235294, 0, 1, 1,
0.5790796, 0.1981556, 0.6481077, 0.427451, 0, 1, 1,
0.5831049, -0.5001275, 1.6769, 0.4352941, 0, 1, 1,
0.5850269, 1.795602, -1.076955, 0.4392157, 0, 1, 1,
0.5852286, -0.005212734, 2.830967, 0.4470588, 0, 1, 1,
0.5854328, 0.1172773, 3.003078, 0.4509804, 0, 1, 1,
0.5923772, -1.096597, 1.640387, 0.4588235, 0, 1, 1,
0.5937338, -1.000392, 1.550652, 0.4627451, 0, 1, 1,
0.5970015, 0.0349549, 2.025965, 0.4705882, 0, 1, 1,
0.6018142, 1.432116, -0.150256, 0.4745098, 0, 1, 1,
0.607581, 1.221803, -1.03503, 0.4823529, 0, 1, 1,
0.6108225, -1.693705, 3.956675, 0.4862745, 0, 1, 1,
0.6181624, 0.7214583, -0.3581529, 0.4941176, 0, 1, 1,
0.6190344, 0.006823535, 1.731462, 0.5019608, 0, 1, 1,
0.6193159, 1.002979, 1.258675, 0.5058824, 0, 1, 1,
0.6216858, -0.6135992, 3.02013, 0.5137255, 0, 1, 1,
0.6262836, 1.120438, -1.534336, 0.5176471, 0, 1, 1,
0.6495334, -0.8758137, 2.55532, 0.5254902, 0, 1, 1,
0.6510829, 0.6552569, 1.715739, 0.5294118, 0, 1, 1,
0.651872, 1.364832, 3.073484, 0.5372549, 0, 1, 1,
0.6542976, -0.0472827, 1.298321, 0.5411765, 0, 1, 1,
0.6569276, -0.7723911, 2.956268, 0.5490196, 0, 1, 1,
0.6589666, -0.4308823, 1.6279, 0.5529412, 0, 1, 1,
0.6592659, -0.5287356, 2.496726, 0.5607843, 0, 1, 1,
0.6657722, 1.760108, 1.016631, 0.5647059, 0, 1, 1,
0.6684098, 0.2910914, 2.945221, 0.572549, 0, 1, 1,
0.668923, 1.292394, 1.150082, 0.5764706, 0, 1, 1,
0.6735882, 0.689243, 1.008922, 0.5843138, 0, 1, 1,
0.6769051, -1.824777, 2.114791, 0.5882353, 0, 1, 1,
0.6833078, 1.899384, -1.72365, 0.5960785, 0, 1, 1,
0.6846119, -0.6661676, 1.909047, 0.6039216, 0, 1, 1,
0.686414, -1.912611, 2.312453, 0.6078432, 0, 1, 1,
0.6908087, -1.092995, 2.509994, 0.6156863, 0, 1, 1,
0.6915097, -0.4932376, 2.33815, 0.6196079, 0, 1, 1,
0.6915826, -0.9713446, 2.248496, 0.627451, 0, 1, 1,
0.6972194, -0.7060069, 0.8756144, 0.6313726, 0, 1, 1,
0.699083, 1.865088, 0.05431284, 0.6392157, 0, 1, 1,
0.7038004, 1.747315, -0.0790454, 0.6431373, 0, 1, 1,
0.7107947, -1.986279, 1.350841, 0.6509804, 0, 1, 1,
0.7127486, -0.7390963, 3.286118, 0.654902, 0, 1, 1,
0.7192391, -0.4490314, 2.946583, 0.6627451, 0, 1, 1,
0.7216313, 1.184978, 0.4155306, 0.6666667, 0, 1, 1,
0.7255889, 0.2690974, 0.7163139, 0.6745098, 0, 1, 1,
0.7272214, -0.5751129, 1.786727, 0.6784314, 0, 1, 1,
0.729196, 1.34919, 0.5136394, 0.6862745, 0, 1, 1,
0.7353935, -1.014226, 1.58156, 0.6901961, 0, 1, 1,
0.7359146, -0.5969416, 1.412979, 0.6980392, 0, 1, 1,
0.7416018, -1.199853, 2.617827, 0.7058824, 0, 1, 1,
0.7506768, -0.07936398, 0.6070388, 0.7098039, 0, 1, 1,
0.7513465, 0.4939187, -0.8465083, 0.7176471, 0, 1, 1,
0.75293, 0.6597863, -0.2278044, 0.7215686, 0, 1, 1,
0.7559485, -2.402552, 1.802621, 0.7294118, 0, 1, 1,
0.7577762, -0.9208791, 0.6182014, 0.7333333, 0, 1, 1,
0.7599102, 0.8421352, 0.5929258, 0.7411765, 0, 1, 1,
0.7610611, 0.2950512, 2.125919, 0.7450981, 0, 1, 1,
0.7611657, -0.1349762, 2.569992, 0.7529412, 0, 1, 1,
0.763605, 0.2089276, 1.196038, 0.7568628, 0, 1, 1,
0.7648537, 0.3604142, 1.009858, 0.7647059, 0, 1, 1,
0.7715611, -0.1040023, 1.386064, 0.7686275, 0, 1, 1,
0.773547, -0.6288186, 2.236121, 0.7764706, 0, 1, 1,
0.7742241, 1.745292, 0.3439353, 0.7803922, 0, 1, 1,
0.7926484, -0.2999239, 0.601666, 0.7882353, 0, 1, 1,
0.8040785, 0.5098318, 3.025537, 0.7921569, 0, 1, 1,
0.8137015, 0.6336479, 0.3249449, 0.8, 0, 1, 1,
0.8165653, -0.02470024, 2.332584, 0.8078431, 0, 1, 1,
0.8201118, -0.2911417, 2.246626, 0.8117647, 0, 1, 1,
0.8289934, -0.671662, 2.927888, 0.8196079, 0, 1, 1,
0.829744, 1.794469, 0.1830576, 0.8235294, 0, 1, 1,
0.8374762, 1.070482, 0.304178, 0.8313726, 0, 1, 1,
0.8399252, 0.3388385, -2.535374, 0.8352941, 0, 1, 1,
0.8421369, 0.0007327613, 1.388332, 0.8431373, 0, 1, 1,
0.8554352, -0.64977, 2.639558, 0.8470588, 0, 1, 1,
0.858878, 1.363324, 1.69563, 0.854902, 0, 1, 1,
0.8630059, 0.7693996, 2.652786, 0.8588235, 0, 1, 1,
0.8631881, 1.914652, -0.8932866, 0.8666667, 0, 1, 1,
0.8639355, -0.1747682, 1.434846, 0.8705882, 0, 1, 1,
0.8736891, -1.429025, 3.082744, 0.8784314, 0, 1, 1,
0.8747627, 0.8931388, 0.9409785, 0.8823529, 0, 1, 1,
0.8842055, -0.2497259, 0.7209759, 0.8901961, 0, 1, 1,
0.8920009, -2.435427, 2.184718, 0.8941177, 0, 1, 1,
0.9012957, -3.048284, 1.343907, 0.9019608, 0, 1, 1,
0.9130536, 0.1090982, 0.905875, 0.9098039, 0, 1, 1,
0.9166551, 1.29743, 1.392724, 0.9137255, 0, 1, 1,
0.9181834, 0.2964438, 0.8381004, 0.9215686, 0, 1, 1,
0.923036, -0.8193111, 1.464603, 0.9254902, 0, 1, 1,
0.9271922, 1.497706, 1.057221, 0.9333333, 0, 1, 1,
0.9428038, 0.2616524, 1.655186, 0.9372549, 0, 1, 1,
0.9511418, -0.7191097, 1.4508, 0.945098, 0, 1, 1,
0.9522601, 0.8237166, 1.351265, 0.9490196, 0, 1, 1,
0.9551988, -0.5635528, 2.331515, 0.9568627, 0, 1, 1,
0.9561542, -0.4073751, 2.76305, 0.9607843, 0, 1, 1,
0.9582239, 0.4539632, -0.2065197, 0.9686275, 0, 1, 1,
0.9587119, 0.0801122, 0.5205051, 0.972549, 0, 1, 1,
0.9598442, 0.4291208, 0.009534242, 0.9803922, 0, 1, 1,
0.9613216, 0.6272339, 0.9138631, 0.9843137, 0, 1, 1,
0.9634693, 1.076473, 1.373949, 0.9921569, 0, 1, 1,
0.9638033, -0.5536249, 1.589846, 0.9960784, 0, 1, 1,
0.9645565, -2.582681, 4.532778, 1, 0, 0.9960784, 1,
0.9806501, -0.9569699, 0.8754959, 1, 0, 0.9882353, 1,
0.9871647, 0.1703546, -0.05036774, 1, 0, 0.9843137, 1,
0.9908175, -0.7270536, 3.14248, 1, 0, 0.9764706, 1,
0.9916068, 0.08049304, 1.685991, 1, 0, 0.972549, 1,
1.001564, -2.460112, 1.724512, 1, 0, 0.9647059, 1,
1.002079, 0.7550648, 0.2850392, 1, 0, 0.9607843, 1,
1.002757, -0.07946832, 0.7215515, 1, 0, 0.9529412, 1,
1.006176, 1.484378, 0.8812832, 1, 0, 0.9490196, 1,
1.016337, 0.06380102, 2.485134, 1, 0, 0.9411765, 1,
1.022116, 0.7190187, 0.9922981, 1, 0, 0.9372549, 1,
1.024514, -0.908597, 1.280285, 1, 0, 0.9294118, 1,
1.029536, 0.6501363, -0.5129221, 1, 0, 0.9254902, 1,
1.036638, 2.096443, 0.6638429, 1, 0, 0.9176471, 1,
1.04012, 0.7999378, 1.749529, 1, 0, 0.9137255, 1,
1.040483, 1.766593, -0.4745886, 1, 0, 0.9058824, 1,
1.041418, 0.2707414, 1.440691, 1, 0, 0.9019608, 1,
1.045698, 1.091472, 1.071824, 1, 0, 0.8941177, 1,
1.046303, 1.403088, 1.000692, 1, 0, 0.8862745, 1,
1.0482, 0.4167855, 1.561041, 1, 0, 0.8823529, 1,
1.054364, -0.2982949, 1.330145, 1, 0, 0.8745098, 1,
1.057845, -0.3285639, 0.9292697, 1, 0, 0.8705882, 1,
1.058113, -1.69008, 0.06276309, 1, 0, 0.8627451, 1,
1.058826, -0.3559411, 2.759769, 1, 0, 0.8588235, 1,
1.064058, 0.07955363, 1.433025, 1, 0, 0.8509804, 1,
1.072321, -1.025503, 2.953254, 1, 0, 0.8470588, 1,
1.073061, 0.328534, 2.128591, 1, 0, 0.8392157, 1,
1.082228, 0.4271942, 1.025136, 1, 0, 0.8352941, 1,
1.083736, 1.431042, 1.354691, 1, 0, 0.827451, 1,
1.087002, -0.7018002, 2.864679, 1, 0, 0.8235294, 1,
1.102636, 0.6746771, 0.7820188, 1, 0, 0.8156863, 1,
1.104093, 0.7692727, 1.247844, 1, 0, 0.8117647, 1,
1.110019, 0.7272335, 0.9601371, 1, 0, 0.8039216, 1,
1.110098, 4.022754, -0.3197512, 1, 0, 0.7960784, 1,
1.126881, 0.3385973, 1.126923, 1, 0, 0.7921569, 1,
1.131275, -0.132768, 1.997635, 1, 0, 0.7843137, 1,
1.134061, -2.316153, 1.443349, 1, 0, 0.7803922, 1,
1.146942, 1.644221, 0.7599826, 1, 0, 0.772549, 1,
1.15061, 0.7127434, 2.014412, 1, 0, 0.7686275, 1,
1.15142, -0.4585457, 2.871568, 1, 0, 0.7607843, 1,
1.157964, -0.386295, 1.866386, 1, 0, 0.7568628, 1,
1.163399, 1.663175, 0.5765319, 1, 0, 0.7490196, 1,
1.17364, 0.5921847, 1.435651, 1, 0, 0.7450981, 1,
1.177475, 0.8373587, 0.8452713, 1, 0, 0.7372549, 1,
1.177697, -1.706416, 2.326787, 1, 0, 0.7333333, 1,
1.182055, 0.8638541, 1.820259, 1, 0, 0.7254902, 1,
1.187486, 3.511602, 1.294502, 1, 0, 0.7215686, 1,
1.21143, 0.9537209, -0.8283814, 1, 0, 0.7137255, 1,
1.214398, -0.106311, 0.1429146, 1, 0, 0.7098039, 1,
1.225487, 0.1552692, 0.7407761, 1, 0, 0.7019608, 1,
1.226666, -2.049621, 3.14753, 1, 0, 0.6941177, 1,
1.2285, 1.079192, 0.2856856, 1, 0, 0.6901961, 1,
1.229595, -2.187427, 2.761139, 1, 0, 0.682353, 1,
1.236925, 0.02696783, 1.205174, 1, 0, 0.6784314, 1,
1.237545, -1.324265, 2.54447, 1, 0, 0.6705883, 1,
1.238352, -0.3901818, 0.5057424, 1, 0, 0.6666667, 1,
1.239907, -2.05686, 3.507501, 1, 0, 0.6588235, 1,
1.244143, 0.7034835, 1.721531, 1, 0, 0.654902, 1,
1.24737, 0.3133403, 1.448952, 1, 0, 0.6470588, 1,
1.25754, -0.5365086, 1.279259, 1, 0, 0.6431373, 1,
1.260321, 0.6862109, -0.3069718, 1, 0, 0.6352941, 1,
1.269426, -0.6138645, 1.685713, 1, 0, 0.6313726, 1,
1.273543, 0.2537026, -0.08369206, 1, 0, 0.6235294, 1,
1.281305, -1.439312, 2.856812, 1, 0, 0.6196079, 1,
1.282859, -1.114304, 2.989867, 1, 0, 0.6117647, 1,
1.283733, -2.399091, 1.273883, 1, 0, 0.6078432, 1,
1.284213, 0.5109744, 0.9229049, 1, 0, 0.6, 1,
1.304572, 0.8044851, 2.033652, 1, 0, 0.5921569, 1,
1.310063, 1.321316, 0.7539639, 1, 0, 0.5882353, 1,
1.313192, -1.613851, 2.63434, 1, 0, 0.5803922, 1,
1.313716, -0.5020111, 0.2115097, 1, 0, 0.5764706, 1,
1.315944, 0.5362207, 0.4311741, 1, 0, 0.5686275, 1,
1.324158, -1.646899, 3.244375, 1, 0, 0.5647059, 1,
1.334053, 0.8632211, 0.7033116, 1, 0, 0.5568628, 1,
1.334677, 0.4799784, -0.1618594, 1, 0, 0.5529412, 1,
1.334816, 0.7739831, -0.06549804, 1, 0, 0.5450981, 1,
1.336164, 0.9013082, 0.0141989, 1, 0, 0.5411765, 1,
1.348844, 0.1783206, 1.373646, 1, 0, 0.5333334, 1,
1.369292, -0.5430653, 2.622887, 1, 0, 0.5294118, 1,
1.371736, -1.09296, 3.553776, 1, 0, 0.5215687, 1,
1.374569, -1.309552, 0.4781988, 1, 0, 0.5176471, 1,
1.376196, 0.2366894, 0.6091439, 1, 0, 0.509804, 1,
1.380137, 1.518308, 0.06120428, 1, 0, 0.5058824, 1,
1.38083, -0.2743299, 0.7625842, 1, 0, 0.4980392, 1,
1.381875, -0.2941098, 3.336326, 1, 0, 0.4901961, 1,
1.397046, 1.402968, 0.09305487, 1, 0, 0.4862745, 1,
1.40055, 0.264935, 2.182168, 1, 0, 0.4784314, 1,
1.404398, -1.272242, 2.554229, 1, 0, 0.4745098, 1,
1.406099, 1.332511, 0.7380053, 1, 0, 0.4666667, 1,
1.41106, -0.03098333, 2.838614, 1, 0, 0.4627451, 1,
1.420942, 0.9817684, 1.583583, 1, 0, 0.454902, 1,
1.440634, -0.2197148, 3.968341, 1, 0, 0.4509804, 1,
1.454566, -0.6104026, 3.160833, 1, 0, 0.4431373, 1,
1.455167, 1.24497, 0.7617671, 1, 0, 0.4392157, 1,
1.467439, -1.487257, 3.138062, 1, 0, 0.4313726, 1,
1.469273, 0.3925616, 0.8575941, 1, 0, 0.427451, 1,
1.470298, 1.336146, -1.299541, 1, 0, 0.4196078, 1,
1.476144, 1.190452, 1.683817, 1, 0, 0.4156863, 1,
1.482963, 1.961327, 1.57991, 1, 0, 0.4078431, 1,
1.483939, 1.143626, 0.3911966, 1, 0, 0.4039216, 1,
1.486545, -0.2477936, 0.2306324, 1, 0, 0.3960784, 1,
1.489257, 0.452993, -0.1308291, 1, 0, 0.3882353, 1,
1.490102, -0.3137596, 1.523943, 1, 0, 0.3843137, 1,
1.515778, -0.2556597, 1.091929, 1, 0, 0.3764706, 1,
1.520033, -1.456924, -0.03103571, 1, 0, 0.372549, 1,
1.528127, -1.223939, 4.047771, 1, 0, 0.3647059, 1,
1.533934, -0.3810627, 2.699481, 1, 0, 0.3607843, 1,
1.549352, -0.3078182, 3.211832, 1, 0, 0.3529412, 1,
1.560681, 0.708167, 3.886709, 1, 0, 0.3490196, 1,
1.563135, 0.6131434, -0.9246756, 1, 0, 0.3411765, 1,
1.566274, -1.858923, 2.469753, 1, 0, 0.3372549, 1,
1.573241, -0.3247532, 2.591911, 1, 0, 0.3294118, 1,
1.575181, -0.05434393, 1.62061, 1, 0, 0.3254902, 1,
1.591241, 0.2752485, 1.065475, 1, 0, 0.3176471, 1,
1.598575, -0.4288296, 2.558067, 1, 0, 0.3137255, 1,
1.604353, -1.182017, -0.3674114, 1, 0, 0.3058824, 1,
1.60757, 0.5754009, 0.6461911, 1, 0, 0.2980392, 1,
1.615972, -0.9455014, 0.3882895, 1, 0, 0.2941177, 1,
1.616428, -0.562448, 2.368129, 1, 0, 0.2862745, 1,
1.621218, 0.5578795, 0.9663589, 1, 0, 0.282353, 1,
1.629314, -1.688146, 2.564326, 1, 0, 0.2745098, 1,
1.63008, -0.3920282, 2.710385, 1, 0, 0.2705882, 1,
1.633726, 0.4720795, 1.738671, 1, 0, 0.2627451, 1,
1.634353, -1.186927, 3.387369, 1, 0, 0.2588235, 1,
1.635822, -1.648887, 1.610196, 1, 0, 0.2509804, 1,
1.652399, 0.1658272, 1.752858, 1, 0, 0.2470588, 1,
1.673251, -0.6761087, 3.44308, 1, 0, 0.2392157, 1,
1.686981, 0.1458209, 2.920177, 1, 0, 0.2352941, 1,
1.693824, -1.266972, 3.970431, 1, 0, 0.227451, 1,
1.696984, -2.417815, 3.161545, 1, 0, 0.2235294, 1,
1.704923, -0.4247528, 3.591195, 1, 0, 0.2156863, 1,
1.70794, -0.06766757, 1.484712, 1, 0, 0.2117647, 1,
1.718361, 0.3132658, 0.558569, 1, 0, 0.2039216, 1,
1.764094, -0.6158307, 1.878621, 1, 0, 0.1960784, 1,
1.767315, 1.917421, 1.040208, 1, 0, 0.1921569, 1,
1.770543, 0.3166583, 2.655579, 1, 0, 0.1843137, 1,
1.77592, 0.4485598, 3.745322, 1, 0, 0.1803922, 1,
1.799352, -1.390816, 1.47712, 1, 0, 0.172549, 1,
1.803479, -0.5534604, 0.4870319, 1, 0, 0.1686275, 1,
1.816671, -0.3068651, 0.5909695, 1, 0, 0.1607843, 1,
1.848269, -0.8646057, 1.321439, 1, 0, 0.1568628, 1,
1.891143, -0.5972599, 1.710508, 1, 0, 0.1490196, 1,
1.912443, -0.52674, 1.660668, 1, 0, 0.145098, 1,
1.914851, 1.100169, -0.4885034, 1, 0, 0.1372549, 1,
1.915404, -2.38639, 1.141816, 1, 0, 0.1333333, 1,
1.925804, 0.3234563, -0.8586356, 1, 0, 0.1254902, 1,
2.010522, -0.5150178, 1.787749, 1, 0, 0.1215686, 1,
2.045459, 0.1229613, 3.094826, 1, 0, 0.1137255, 1,
2.060858, -0.4914417, 2.396232, 1, 0, 0.1098039, 1,
2.104185, 1.00985, 0.5804675, 1, 0, 0.1019608, 1,
2.129549, 2.161005, 0.1718187, 1, 0, 0.09411765, 1,
2.156025, -1.036983, 1.696956, 1, 0, 0.09019608, 1,
2.162214, -3.123508, 1.862181, 1, 0, 0.08235294, 1,
2.170928, 0.7310646, 1.261313, 1, 0, 0.07843138, 1,
2.20732, -0.8577422, 0.7125655, 1, 0, 0.07058824, 1,
2.216621, -1.478352, 2.960958, 1, 0, 0.06666667, 1,
2.337831, 0.07685229, 3.169259, 1, 0, 0.05882353, 1,
2.510198, -0.5687579, 2.133335, 1, 0, 0.05490196, 1,
2.519733, -0.6626238, 0.8641048, 1, 0, 0.04705882, 1,
2.619665, 0.989362, 2.324767, 1, 0, 0.04313726, 1,
2.720902, 0.1362516, 2.725928, 1, 0, 0.03529412, 1,
2.729933, -1.531272, 1.932007, 1, 0, 0.03137255, 1,
2.806687, -0.2682988, 0.8421707, 1, 0, 0.02352941, 1,
2.813633, 1.743978, 0.7072624, 1, 0, 0.01960784, 1,
2.917478, -0.2825505, 2.203475, 1, 0, 0.01176471, 1,
3.237318, -0.01325765, -0.7465296, 1, 0, 0.007843138, 1
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
-0.2943099, -4.971676, -7.039412, 0, -0.5, 0.5, 0.5,
-0.2943099, -4.971676, -7.039412, 1, -0.5, 0.5, 0.5,
-0.2943099, -4.971676, -7.039412, 1, 1.5, 0.5, 0.5,
-0.2943099, -4.971676, -7.039412, 0, 1.5, 0.5, 0.5
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
-5.02316, 0.1773368, -7.039412, 0, -0.5, 0.5, 0.5,
-5.02316, 0.1773368, -7.039412, 1, -0.5, 0.5, 0.5,
-5.02316, 0.1773368, -7.039412, 1, 1.5, 0.5, 0.5,
-5.02316, 0.1773368, -7.039412, 0, 1.5, 0.5, 0.5
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
-5.02316, -4.971676, -0.2467082, 0, -0.5, 0.5, 0.5,
-5.02316, -4.971676, -0.2467082, 1, -0.5, 0.5, 0.5,
-5.02316, -4.971676, -0.2467082, 1, 1.5, 0.5, 0.5,
-5.02316, -4.971676, -0.2467082, 0, 1.5, 0.5, 0.5
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
-2, -3.783442, -5.471866,
2, -3.783442, -5.471866,
-2, -3.783442, -5.471866,
-2, -3.981482, -5.733123,
0, -3.783442, -5.471866,
0, -3.981482, -5.733123,
2, -3.783442, -5.471866,
2, -3.981482, -5.733123
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
"0",
"2"
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
-2, -4.37756, -6.255639, 0, -0.5, 0.5, 0.5,
-2, -4.37756, -6.255639, 1, -0.5, 0.5, 0.5,
-2, -4.37756, -6.255639, 1, 1.5, 0.5, 0.5,
-2, -4.37756, -6.255639, 0, 1.5, 0.5, 0.5,
0, -4.37756, -6.255639, 0, -0.5, 0.5, 0.5,
0, -4.37756, -6.255639, 1, -0.5, 0.5, 0.5,
0, -4.37756, -6.255639, 1, 1.5, 0.5, 0.5,
0, -4.37756, -6.255639, 0, 1.5, 0.5, 0.5,
2, -4.37756, -6.255639, 0, -0.5, 0.5, 0.5,
2, -4.37756, -6.255639, 1, -0.5, 0.5, 0.5,
2, -4.37756, -6.255639, 1, 1.5, 0.5, 0.5,
2, -4.37756, -6.255639, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.931887, -2, -5.471866,
-3.931887, 4, -5.471866,
-3.931887, -2, -5.471866,
-4.113766, -2, -5.733123,
-3.931887, 0, -5.471866,
-4.113766, 0, -5.733123,
-3.931887, 2, -5.471866,
-4.113766, 2, -5.733123,
-3.931887, 4, -5.471866,
-4.113766, 4, -5.733123
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
-4.477523, -2, -6.255639, 0, -0.5, 0.5, 0.5,
-4.477523, -2, -6.255639, 1, -0.5, 0.5, 0.5,
-4.477523, -2, -6.255639, 1, 1.5, 0.5, 0.5,
-4.477523, -2, -6.255639, 0, 1.5, 0.5, 0.5,
-4.477523, 0, -6.255639, 0, -0.5, 0.5, 0.5,
-4.477523, 0, -6.255639, 1, -0.5, 0.5, 0.5,
-4.477523, 0, -6.255639, 1, 1.5, 0.5, 0.5,
-4.477523, 0, -6.255639, 0, 1.5, 0.5, 0.5,
-4.477523, 2, -6.255639, 0, -0.5, 0.5, 0.5,
-4.477523, 2, -6.255639, 1, -0.5, 0.5, 0.5,
-4.477523, 2, -6.255639, 1, 1.5, 0.5, 0.5,
-4.477523, 2, -6.255639, 0, 1.5, 0.5, 0.5,
-4.477523, 4, -6.255639, 0, -0.5, 0.5, 0.5,
-4.477523, 4, -6.255639, 1, -0.5, 0.5, 0.5,
-4.477523, 4, -6.255639, 1, 1.5, 0.5, 0.5,
-4.477523, 4, -6.255639, 0, 1.5, 0.5, 0.5
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
-3.931887, -3.783442, -4,
-3.931887, -3.783442, 4,
-3.931887, -3.783442, -4,
-4.113766, -3.981482, -4,
-3.931887, -3.783442, -2,
-4.113766, -3.981482, -2,
-3.931887, -3.783442, 0,
-4.113766, -3.981482, 0,
-3.931887, -3.783442, 2,
-4.113766, -3.981482, 2,
-3.931887, -3.783442, 4,
-4.113766, -3.981482, 4
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
-4.477523, -4.37756, -4, 0, -0.5, 0.5, 0.5,
-4.477523, -4.37756, -4, 1, -0.5, 0.5, 0.5,
-4.477523, -4.37756, -4, 1, 1.5, 0.5, 0.5,
-4.477523, -4.37756, -4, 0, 1.5, 0.5, 0.5,
-4.477523, -4.37756, -2, 0, -0.5, 0.5, 0.5,
-4.477523, -4.37756, -2, 1, -0.5, 0.5, 0.5,
-4.477523, -4.37756, -2, 1, 1.5, 0.5, 0.5,
-4.477523, -4.37756, -2, 0, 1.5, 0.5, 0.5,
-4.477523, -4.37756, 0, 0, -0.5, 0.5, 0.5,
-4.477523, -4.37756, 0, 1, -0.5, 0.5, 0.5,
-4.477523, -4.37756, 0, 1, 1.5, 0.5, 0.5,
-4.477523, -4.37756, 0, 0, 1.5, 0.5, 0.5,
-4.477523, -4.37756, 2, 0, -0.5, 0.5, 0.5,
-4.477523, -4.37756, 2, 1, -0.5, 0.5, 0.5,
-4.477523, -4.37756, 2, 1, 1.5, 0.5, 0.5,
-4.477523, -4.37756, 2, 0, 1.5, 0.5, 0.5,
-4.477523, -4.37756, 4, 0, -0.5, 0.5, 0.5,
-4.477523, -4.37756, 4, 1, -0.5, 0.5, 0.5,
-4.477523, -4.37756, 4, 1, 1.5, 0.5, 0.5,
-4.477523, -4.37756, 4, 0, 1.5, 0.5, 0.5
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
-3.931887, -3.783442, -5.471866,
-3.931887, 4.138116, -5.471866,
-3.931887, -3.783442, 4.978449,
-3.931887, 4.138116, 4.978449,
-3.931887, -3.783442, -5.471866,
-3.931887, -3.783442, 4.978449,
-3.931887, 4.138116, -5.471866,
-3.931887, 4.138116, 4.978449,
-3.931887, -3.783442, -5.471866,
3.343267, -3.783442, -5.471866,
-3.931887, -3.783442, 4.978449,
3.343267, -3.783442, 4.978449,
-3.931887, 4.138116, -5.471866,
3.343267, 4.138116, -5.471866,
-3.931887, 4.138116, 4.978449,
3.343267, 4.138116, 4.978449,
3.343267, -3.783442, -5.471866,
3.343267, 4.138116, -5.471866,
3.343267, -3.783442, 4.978449,
3.343267, 4.138116, 4.978449,
3.343267, -3.783442, -5.471866,
3.343267, -3.783442, 4.978449,
3.343267, 4.138116, -5.471866,
3.343267, 4.138116, 4.978449
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
var radius = 8.007716;
var distance = 35.62723;
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
mvMatrix.translate( 0.2943099, -0.1773368, 0.2467082 );
mvMatrix.scale( 1.190091, 1.092979, 0.8285013 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.62723);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
flupoxam<-read.table("flupoxam.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flupoxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'flupoxam' not found
```

```r
y<-flupoxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'flupoxam' not found
```

```r
z<-flupoxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'flupoxam' not found
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
-3.825938, -0.7820362, -1.233055, 0, 0, 1, 1, 1,
-2.802894, -0.2216018, -1.497693, 1, 0, 0, 1, 1,
-2.67479, 0.6685323, -1.752372, 1, 0, 0, 1, 1,
-2.547096, 0.3027833, -2.071182, 1, 0, 0, 1, 1,
-2.540146, -0.676942, -0.9188709, 1, 0, 0, 1, 1,
-2.516368, 2.31365, -0.6200989, 1, 0, 0, 1, 1,
-2.398503, -1.29502, -2.79498, 0, 0, 0, 1, 1,
-2.384471, -0.08356287, -0.8759973, 0, 0, 0, 1, 1,
-2.325479, -0.366611, -1.67788, 0, 0, 0, 1, 1,
-2.315072, -2.014901, -2.723099, 0, 0, 0, 1, 1,
-2.280054, 3.178459, -0.6203638, 0, 0, 0, 1, 1,
-2.245087, 0.1640307, -2.417442, 0, 0, 0, 1, 1,
-2.225529, -0.4740771, -1.452928, 0, 0, 0, 1, 1,
-2.16857, 0.8336666, -1.484616, 1, 1, 1, 1, 1,
-2.122669, 1.497155, -1.332642, 1, 1, 1, 1, 1,
-2.097004, 0.02129416, -2.095298, 1, 1, 1, 1, 1,
-2.091026, 1.858981, -1.596891, 1, 1, 1, 1, 1,
-2.079932, -0.3407095, -2.224696, 1, 1, 1, 1, 1,
-2.071141, -0.8639695, 0.06014944, 1, 1, 1, 1, 1,
-2.068757, -1.361106, -2.982271, 1, 1, 1, 1, 1,
-2.063177, -1.029161, -1.10815, 1, 1, 1, 1, 1,
-2.056824, 0.5564605, -0.8464311, 1, 1, 1, 1, 1,
-2.039706, -0.6757712, -3.164792, 1, 1, 1, 1, 1,
-1.998214, -0.2385827, -0.7238696, 1, 1, 1, 1, 1,
-1.976789, 0.1258353, -0.9937758, 1, 1, 1, 1, 1,
-1.965303, -0.07267396, -2.566606, 1, 1, 1, 1, 1,
-1.962491, -0.5858672, -0.7667584, 1, 1, 1, 1, 1,
-1.917118, 1.227735, -1.285853, 1, 1, 1, 1, 1,
-1.884792, -1.776463, -2.047135, 0, 0, 1, 1, 1,
-1.879441, -0.433486, -3.060445, 1, 0, 0, 1, 1,
-1.849741, 0.08575572, -1.929628, 1, 0, 0, 1, 1,
-1.833412, -0.5788879, -3.796316, 1, 0, 0, 1, 1,
-1.831981, -0.787189, -3.317389, 1, 0, 0, 1, 1,
-1.797711, 0.04074867, -2.22213, 1, 0, 0, 1, 1,
-1.793048, 0.2729116, -1.731622, 0, 0, 0, 1, 1,
-1.783061, 0.8768263, -1.920103, 0, 0, 0, 1, 1,
-1.774869, -0.7501744, -3.016019, 0, 0, 0, 1, 1,
-1.759617, -0.6423359, -1.800704, 0, 0, 0, 1, 1,
-1.725698, 0.2922169, -2.279075, 0, 0, 0, 1, 1,
-1.717517, -0.9340776, -2.933812, 0, 0, 0, 1, 1,
-1.712895, 0.698327, -0.5943346, 0, 0, 0, 1, 1,
-1.712639, -0.2768311, -1.082694, 1, 1, 1, 1, 1,
-1.707768, -0.08565155, -0.3451971, 1, 1, 1, 1, 1,
-1.704977, 0.612416, -2.083912, 1, 1, 1, 1, 1,
-1.702303, 0.5253469, -1.865847, 1, 1, 1, 1, 1,
-1.686649, -0.3952822, -2.040821, 1, 1, 1, 1, 1,
-1.68444, 1.252343, -1.88172, 1, 1, 1, 1, 1,
-1.681516, 1.701043, -0.9913335, 1, 1, 1, 1, 1,
-1.667719, 0.5821943, -0.4045413, 1, 1, 1, 1, 1,
-1.659694, -0.0205684, -2.466695, 1, 1, 1, 1, 1,
-1.655768, -0.002828201, -0.899084, 1, 1, 1, 1, 1,
-1.655475, -0.484373, -1.582495, 1, 1, 1, 1, 1,
-1.634287, 0.5428995, -1.312589, 1, 1, 1, 1, 1,
-1.632115, -1.219341, -0.8764896, 1, 1, 1, 1, 1,
-1.626627, 0.7068343, 0.9435561, 1, 1, 1, 1, 1,
-1.598779, 0.5168031, -1.278507, 1, 1, 1, 1, 1,
-1.554681, -0.04180972, -2.612303, 0, 0, 1, 1, 1,
-1.553862, 0.9855617, 0.4565341, 1, 0, 0, 1, 1,
-1.553545, -0.9628818, -0.05515135, 1, 0, 0, 1, 1,
-1.553204, -0.5414692, -3.430153, 1, 0, 0, 1, 1,
-1.550415, 0.01820069, -2.083041, 1, 0, 0, 1, 1,
-1.549366, 1.399114, 0.2804078, 1, 0, 0, 1, 1,
-1.548458, 1.446035, -2.083451, 0, 0, 0, 1, 1,
-1.523938, 1.151979, -1.753457, 0, 0, 0, 1, 1,
-1.516518, 0.9898096, -1.763683, 0, 0, 0, 1, 1,
-1.511155, 0.1382384, -2.000449, 0, 0, 0, 1, 1,
-1.499379, -0.9522374, -0.4079579, 0, 0, 0, 1, 1,
-1.490914, -0.9939823, -0.7493058, 0, 0, 0, 1, 1,
-1.487254, -0.02603005, -3.036475, 0, 0, 0, 1, 1,
-1.483064, -0.9452337, -2.991977, 1, 1, 1, 1, 1,
-1.480868, -0.3376875, -1.928089, 1, 1, 1, 1, 1,
-1.472408, 0.7822273, 0.1482581, 1, 1, 1, 1, 1,
-1.470712, 0.1022937, -1.455625, 1, 1, 1, 1, 1,
-1.457511, 0.3133152, -0.401144, 1, 1, 1, 1, 1,
-1.448586, -1.018941, -3.499048, 1, 1, 1, 1, 1,
-1.443253, -0.8301488, -4.066468, 1, 1, 1, 1, 1,
-1.430156, 0.08028367, -3.193742, 1, 1, 1, 1, 1,
-1.429041, 0.5333354, -0.6453204, 1, 1, 1, 1, 1,
-1.428361, -0.4182969, -3.205575, 1, 1, 1, 1, 1,
-1.419875, -2.336331, -3.433318, 1, 1, 1, 1, 1,
-1.412322, 0.2347347, -2.300524, 1, 1, 1, 1, 1,
-1.406766, 0.7727293, -0.9834522, 1, 1, 1, 1, 1,
-1.405548, -1.089816, -3.028629, 1, 1, 1, 1, 1,
-1.401962, -0.4362232, -3.076965, 1, 1, 1, 1, 1,
-1.377736, 1.416194, -0.2894412, 0, 0, 1, 1, 1,
-1.376997, -0.09111785, -0.5462852, 1, 0, 0, 1, 1,
-1.363018, 0.2792704, 0.214414, 1, 0, 0, 1, 1,
-1.339287, -0.7841378, -2.571856, 1, 0, 0, 1, 1,
-1.328727, 0.1179333, 0.1752934, 1, 0, 0, 1, 1,
-1.318925, 0.1775423, -3.253931, 1, 0, 0, 1, 1,
-1.311352, -0.3363008, -0.7450197, 0, 0, 0, 1, 1,
-1.302812, 0.2916382, -2.203899, 0, 0, 0, 1, 1,
-1.294315, 0.01946133, -1.658604, 0, 0, 0, 1, 1,
-1.276872, 1.062146, -0.3904691, 0, 0, 0, 1, 1,
-1.275393, -0.2832757, -2.270275, 0, 0, 0, 1, 1,
-1.274212, 0.9915861, -1.220547, 0, 0, 0, 1, 1,
-1.273043, -0.1307763, -1.419847, 0, 0, 0, 1, 1,
-1.270461, 0.9722947, -0.8233529, 1, 1, 1, 1, 1,
-1.266394, -0.5664435, -1.509106, 1, 1, 1, 1, 1,
-1.247153, 0.81788, -0.1932904, 1, 1, 1, 1, 1,
-1.240578, -0.5436857, -0.916474, 1, 1, 1, 1, 1,
-1.239969, 0.9508198, -0.5688969, 1, 1, 1, 1, 1,
-1.234398, 0.507818, 0.1000201, 1, 1, 1, 1, 1,
-1.218075, -0.2208932, -2.210147, 1, 1, 1, 1, 1,
-1.217596, 1.156572, 0.01363366, 1, 1, 1, 1, 1,
-1.215044, 0.7191739, -0.7005622, 1, 1, 1, 1, 1,
-1.213784, 1.148311, -1.135144, 1, 1, 1, 1, 1,
-1.208305, 0.613939, -0.4605582, 1, 1, 1, 1, 1,
-1.199304, 0.3165514, -2.584679, 1, 1, 1, 1, 1,
-1.196898, -0.06211217, -1.380269, 1, 1, 1, 1, 1,
-1.190498, -1.022244, -1.30624, 1, 1, 1, 1, 1,
-1.189377, -0.2923353, -2.030906, 1, 1, 1, 1, 1,
-1.189112, 0.5198992, 0.5637342, 0, 0, 1, 1, 1,
-1.171202, 0.4212725, 0.03173117, 1, 0, 0, 1, 1,
-1.16893, 0.1017953, -1.732109, 1, 0, 0, 1, 1,
-1.167758, 0.614441, -1.341928, 1, 0, 0, 1, 1,
-1.160592, -1.650318, -3.622124, 1, 0, 0, 1, 1,
-1.156672, 1.04313, -1.388787, 1, 0, 0, 1, 1,
-1.154799, -0.8313886, -3.253364, 0, 0, 0, 1, 1,
-1.146161, -1.677257, -4.466832, 0, 0, 0, 1, 1,
-1.144863, -0.4804158, -3.89469, 0, 0, 0, 1, 1,
-1.138902, -1.299975, -1.849558, 0, 0, 0, 1, 1,
-1.133375, -0.9043542, -1.759198, 0, 0, 0, 1, 1,
-1.129023, 0.0909034, -1.970575, 0, 0, 0, 1, 1,
-1.126243, -0.36987, -2.544664, 0, 0, 0, 1, 1,
-1.118547, -0.2542741, 0.2581384, 1, 1, 1, 1, 1,
-1.116561, -0.8940418, -3.446937, 1, 1, 1, 1, 1,
-1.098915, -0.7572687, -1.949441, 1, 1, 1, 1, 1,
-1.083935, -1.703976, -1.490027, 1, 1, 1, 1, 1,
-1.078451, -0.5263348, -4.472369, 1, 1, 1, 1, 1,
-1.07069, 1.439669, -0.4957641, 1, 1, 1, 1, 1,
-1.055931, 1.499606, -1.468165, 1, 1, 1, 1, 1,
-1.055177, -0.247384, -2.344035, 1, 1, 1, 1, 1,
-1.049756, 0.10202, -1.332282, 1, 1, 1, 1, 1,
-1.048047, -1.405278, -3.521153, 1, 1, 1, 1, 1,
-1.041285, 0.5838796, -2.303324, 1, 1, 1, 1, 1,
-1.038325, -0.3343438, -0.5002513, 1, 1, 1, 1, 1,
-1.036346, -0.08293284, -3.067121, 1, 1, 1, 1, 1,
-1.035504, -1.186326, -2.178011, 1, 1, 1, 1, 1,
-1.027659, -0.2685196, -3.175759, 1, 1, 1, 1, 1,
-1.025817, -0.3375938, -0.5134909, 0, 0, 1, 1, 1,
-1.020677, -3.66808, -4.148511, 1, 0, 0, 1, 1,
-1.017562, 1.856616, -0.4610395, 1, 0, 0, 1, 1,
-1.015809, 0.4122114, -1.650792, 1, 0, 0, 1, 1,
-1.013451, -0.1161119, -2.736915, 1, 0, 0, 1, 1,
-1.01304, 2.447108, -1.370742, 1, 0, 0, 1, 1,
-1.00817, -0.3029362, -1.812753, 0, 0, 0, 1, 1,
-1.004947, -1.059211, -2.028233, 0, 0, 0, 1, 1,
-1.004458, -0.01312736, -2.071754, 0, 0, 0, 1, 1,
-1.003368, 0.009139312, -1.519011, 0, 0, 0, 1, 1,
-1.001462, -0.5301462, -1.712018, 0, 0, 0, 1, 1,
-0.9996746, 1.364468, 0.2571719, 0, 0, 0, 1, 1,
-0.9987174, 0.9791276, -0.004250096, 0, 0, 0, 1, 1,
-0.996273, -0.3674757, -2.22753, 1, 1, 1, 1, 1,
-0.9956287, -0.1284962, -2.271395, 1, 1, 1, 1, 1,
-0.9945598, -1.054196, -3.730392, 1, 1, 1, 1, 1,
-0.9937147, -0.1206378, -1.039339, 1, 1, 1, 1, 1,
-0.9919309, 0.8794621, -1.20357, 1, 1, 1, 1, 1,
-0.989969, -0.1668689, -1.616583, 1, 1, 1, 1, 1,
-0.9893658, -0.3049378, -1.108909, 1, 1, 1, 1, 1,
-0.9831652, -0.177973, -3.8215, 1, 1, 1, 1, 1,
-0.9774217, 0.1012918, -0.6462112, 1, 1, 1, 1, 1,
-0.9766383, -1.418515, -2.418917, 1, 1, 1, 1, 1,
-0.9750052, 0.7165495, -1.554512, 1, 1, 1, 1, 1,
-0.9695218, 0.1641075, -2.731497, 1, 1, 1, 1, 1,
-0.9592089, 0.2858041, 0.7108324, 1, 1, 1, 1, 1,
-0.954669, -0.3848687, -1.330541, 1, 1, 1, 1, 1,
-0.9533018, 0.04245131, -2.096511, 1, 1, 1, 1, 1,
-0.9450804, 0.4127735, -3.096789, 0, 0, 1, 1, 1,
-0.9425839, -1.936921, -3.583477, 1, 0, 0, 1, 1,
-0.9400569, -0.3441036, -1.471585, 1, 0, 0, 1, 1,
-0.9342973, -0.06001512, 0.1788189, 1, 0, 0, 1, 1,
-0.9317213, -0.9135333, -0.6769902, 1, 0, 0, 1, 1,
-0.9305791, -1.903232, -1.894213, 1, 0, 0, 1, 1,
-0.9293066, 0.7318865, -1.267959, 0, 0, 0, 1, 1,
-0.9262127, 0.7803692, -0.008869723, 0, 0, 0, 1, 1,
-0.923774, -0.144409, -1.723767, 0, 0, 0, 1, 1,
-0.9206817, 0.7819865, -1.9189, 0, 0, 0, 1, 1,
-0.9152101, 0.4189251, -0.7669818, 0, 0, 0, 1, 1,
-0.9141006, -0.256771, -1.89311, 0, 0, 0, 1, 1,
-0.9137416, 0.0006254932, -1.32655, 0, 0, 0, 1, 1,
-0.9067172, -1.112749, -4.106652, 1, 1, 1, 1, 1,
-0.9048434, 0.9221234, -0.7476254, 1, 1, 1, 1, 1,
-0.9046203, -0.1321489, -2.411324, 1, 1, 1, 1, 1,
-0.9020891, -0.5796744, -1.189648, 1, 1, 1, 1, 1,
-0.8914369, 0.4926898, 0.4824787, 1, 1, 1, 1, 1,
-0.8792427, 0.5974247, -0.7430353, 1, 1, 1, 1, 1,
-0.8785037, 0.2523687, -1.657954, 1, 1, 1, 1, 1,
-0.8784173, -1.451299, -2.726042, 1, 1, 1, 1, 1,
-0.8780086, -0.5148357, -1.834123, 1, 1, 1, 1, 1,
-0.8757352, -1.013555, -1.804515, 1, 1, 1, 1, 1,
-0.875695, -1.852083, -4.76693, 1, 1, 1, 1, 1,
-0.8753885, 2.334942, -0.6713081, 1, 1, 1, 1, 1,
-0.8715377, -1.487167, -2.728303, 1, 1, 1, 1, 1,
-0.867206, 0.544053, -0.8803373, 1, 1, 1, 1, 1,
-0.8628682, 1.173723, -1.465998, 1, 1, 1, 1, 1,
-0.8594771, 0.9704118, -1.06816, 0, 0, 1, 1, 1,
-0.858968, -1.571174, -1.723315, 1, 0, 0, 1, 1,
-0.8589592, -1.131183, -0.7730894, 1, 0, 0, 1, 1,
-0.8558411, -0.9974827, -3.038568, 1, 0, 0, 1, 1,
-0.8537393, -0.5891063, -2.215519, 1, 0, 0, 1, 1,
-0.8530528, 0.5621135, -0.8304021, 1, 0, 0, 1, 1,
-0.8514039, -0.01294601, -2.08388, 0, 0, 0, 1, 1,
-0.8440208, 1.50799, -0.2751696, 0, 0, 0, 1, 1,
-0.8431581, -0.9066479, -3.126137, 0, 0, 0, 1, 1,
-0.8423188, -1.795101, -1.693158, 0, 0, 0, 1, 1,
-0.8396234, 0.4978569, -0.06877305, 0, 0, 0, 1, 1,
-0.8374327, -1.338029, -3.422779, 0, 0, 0, 1, 1,
-0.8367872, 0.2397032, -1.299027, 0, 0, 0, 1, 1,
-0.8354384, 0.1666601, 0.4411722, 1, 1, 1, 1, 1,
-0.8337661, 0.5578262, -0.05035079, 1, 1, 1, 1, 1,
-0.8289533, 1.01165, -1.865806, 1, 1, 1, 1, 1,
-0.8226508, 0.5860243, -0.02728316, 1, 1, 1, 1, 1,
-0.8193405, 0.1706191, -2.008723, 1, 1, 1, 1, 1,
-0.8070785, 1.404052, -0.2384746, 1, 1, 1, 1, 1,
-0.8061965, -0.1125729, -3.022281, 1, 1, 1, 1, 1,
-0.8015838, 0.7606999, -0.6628593, 1, 1, 1, 1, 1,
-0.8003901, 1.315901, -0.2030291, 1, 1, 1, 1, 1,
-0.7994218, -1.132255, -4.497488, 1, 1, 1, 1, 1,
-0.7962, 0.08085847, -1.781453, 1, 1, 1, 1, 1,
-0.7911236, -1.762753, -1.659437, 1, 1, 1, 1, 1,
-0.7859966, 0.3164553, -1.900582, 1, 1, 1, 1, 1,
-0.7849097, -0.7105542, -2.156801, 1, 1, 1, 1, 1,
-0.7840613, -0.8589465, -1.650084, 1, 1, 1, 1, 1,
-0.7833484, 0.612317, -1.305299, 0, 0, 1, 1, 1,
-0.7789789, 1.015145, -1.896231, 1, 0, 0, 1, 1,
-0.7754841, 1.552658, -0.7160372, 1, 0, 0, 1, 1,
-0.7689179, 0.597966, 1.820919, 1, 0, 0, 1, 1,
-0.7676194, -1.303272, -2.740329, 1, 0, 0, 1, 1,
-0.7664443, 0.8771165, -1.138462, 1, 0, 0, 1, 1,
-0.7662566, -1.329352, -2.058594, 0, 0, 0, 1, 1,
-0.7613682, -0.6133037, -0.8923941, 0, 0, 0, 1, 1,
-0.7583517, -1.549322, -1.616799, 0, 0, 0, 1, 1,
-0.7570328, 0.5318167, -1.719783, 0, 0, 0, 1, 1,
-0.7524313, 0.1030591, -1.220379, 0, 0, 0, 1, 1,
-0.7517436, 0.4056878, 0.7907262, 0, 0, 0, 1, 1,
-0.7505912, 1.33698, -2.164821, 0, 0, 0, 1, 1,
-0.74818, -0.8234962, -3.432652, 1, 1, 1, 1, 1,
-0.7448128, 0.05298076, -2.313488, 1, 1, 1, 1, 1,
-0.7413234, -0.1543627, -1.442168, 1, 1, 1, 1, 1,
-0.7400721, 0.8229004, 0.6182256, 1, 1, 1, 1, 1,
-0.7373164, 0.6975129, -0.752281, 1, 1, 1, 1, 1,
-0.7329879, 0.2496337, -1.73129, 1, 1, 1, 1, 1,
-0.7314469, -0.3534584, 0.3777317, 1, 1, 1, 1, 1,
-0.7300417, 0.5101946, -2.389935, 1, 1, 1, 1, 1,
-0.7288344, 0.5478879, -1.630286, 1, 1, 1, 1, 1,
-0.7194328, -2.451613, -2.949476, 1, 1, 1, 1, 1,
-0.7178891, -1.186643, -3.486298, 1, 1, 1, 1, 1,
-0.7127904, -0.7809597, -2.90994, 1, 1, 1, 1, 1,
-0.711396, -0.9353306, -2.367749, 1, 1, 1, 1, 1,
-0.7046785, -1.159424, -3.935847, 1, 1, 1, 1, 1,
-0.7018787, 0.3449658, -0.821841, 1, 1, 1, 1, 1,
-0.7006313, 0.1854422, -0.4467915, 0, 0, 1, 1, 1,
-0.6992414, 0.4162213, 0.266261, 1, 0, 0, 1, 1,
-0.6951416, 1.205974, -0.264827, 1, 0, 0, 1, 1,
-0.6950827, -1.060398, -3.583889, 1, 0, 0, 1, 1,
-0.6909645, -0.2484188, -3.721584, 1, 0, 0, 1, 1,
-0.6902779, 0.1354636, -2.411644, 1, 0, 0, 1, 1,
-0.6892976, -0.0502419, -0.7384872, 0, 0, 0, 1, 1,
-0.6891857, 0.5511678, 0.3502659, 0, 0, 0, 1, 1,
-0.6852396, -0.906647, -2.380157, 0, 0, 0, 1, 1,
-0.6797109, -0.6952426, -0.6437768, 0, 0, 0, 1, 1,
-0.6735466, -0.3219428, -1.479519, 0, 0, 0, 1, 1,
-0.6707219, 1.029281, 0.1793018, 0, 0, 0, 1, 1,
-0.6676468, 1.215101, -0.4453418, 0, 0, 0, 1, 1,
-0.6672806, 0.02036561, -1.393524, 1, 1, 1, 1, 1,
-0.6649997, 0.3649821, -0.327337, 1, 1, 1, 1, 1,
-0.6616847, 0.4318513, 0.8104278, 1, 1, 1, 1, 1,
-0.6612283, -0.6432157, -3.022089, 1, 1, 1, 1, 1,
-0.6563232, 1.040501, 1.085067, 1, 1, 1, 1, 1,
-0.6555662, 0.4951729, -1.969096, 1, 1, 1, 1, 1,
-0.6552306, -0.2740656, -3.510566, 1, 1, 1, 1, 1,
-0.6532302, -0.3464164, -1.89954, 1, 1, 1, 1, 1,
-0.6524701, -0.5154663, -1.269929, 1, 1, 1, 1, 1,
-0.651924, -2.39279, -3.78404, 1, 1, 1, 1, 1,
-0.645759, 2.028282, -0.1566192, 1, 1, 1, 1, 1,
-0.6442642, -0.1895738, -1.077996, 1, 1, 1, 1, 1,
-0.6351348, 2.223503, -0.8315238, 1, 1, 1, 1, 1,
-0.6317621, -0.8080574, -2.269788, 1, 1, 1, 1, 1,
-0.6290621, -0.1310617, -0.2272011, 1, 1, 1, 1, 1,
-0.6271825, -1.373106, -4.240747, 0, 0, 1, 1, 1,
-0.6258194, -1.354938, -2.030577, 1, 0, 0, 1, 1,
-0.6252146, -0.8665477, -1.703977, 1, 0, 0, 1, 1,
-0.6213652, -2.054304, -1.441879, 1, 0, 0, 1, 1,
-0.6186308, -1.465137, -4.014266, 1, 0, 0, 1, 1,
-0.6181725, 1.613206, -0.1683808, 1, 0, 0, 1, 1,
-0.6169727, 0.7850199, -1.856824, 0, 0, 0, 1, 1,
-0.6051158, -0.08152326, -0.972338, 0, 0, 0, 1, 1,
-0.6014802, 1.848264, 0.478442, 0, 0, 0, 1, 1,
-0.5968973, 0.5920792, -0.3546456, 0, 0, 0, 1, 1,
-0.5953444, -0.3241257, -3.308761, 0, 0, 0, 1, 1,
-0.5917369, -0.4348108, -1.144529, 0, 0, 0, 1, 1,
-0.5844391, -0.09052959, -1.394893, 0, 0, 0, 1, 1,
-0.5827041, 0.09408413, -2.522582, 1, 1, 1, 1, 1,
-0.5790107, -0.6085567, -2.473322, 1, 1, 1, 1, 1,
-0.5736154, 0.6571343, -0.4797306, 1, 1, 1, 1, 1,
-0.5714478, 0.2733724, -1.152128, 1, 1, 1, 1, 1,
-0.5707874, 0.2760405, -1.274508, 1, 1, 1, 1, 1,
-0.5702136, 0.6524156, -0.4154632, 1, 1, 1, 1, 1,
-0.5697454, 0.2440251, 0.08730028, 1, 1, 1, 1, 1,
-0.5686453, 1.534863, 0.003698158, 1, 1, 1, 1, 1,
-0.567762, -2.039421, -3.073166, 1, 1, 1, 1, 1,
-0.5669792, -0.3371704, -2.85403, 1, 1, 1, 1, 1,
-0.5631242, -2.277731, -2.906393, 1, 1, 1, 1, 1,
-0.5617999, 0.1151775, -1.061046, 1, 1, 1, 1, 1,
-0.558599, 0.04011148, -2.269473, 1, 1, 1, 1, 1,
-0.5574712, -1.267519, -2.548081, 1, 1, 1, 1, 1,
-0.5527756, 1.114004, -1.558059, 1, 1, 1, 1, 1,
-0.5509219, 0.2024671, -0.1378451, 0, 0, 1, 1, 1,
-0.5431921, -0.6206941, -1.039116, 1, 0, 0, 1, 1,
-0.5362359, 2.174786, 0.3806567, 1, 0, 0, 1, 1,
-0.5286919, -0.8565777, -4.646029, 1, 0, 0, 1, 1,
-0.5267001, 1.227812, -1.599125, 1, 0, 0, 1, 1,
-0.5241599, -0.8129534, -1.176128, 1, 0, 0, 1, 1,
-0.5233781, 3.367148, -0.7176061, 0, 0, 0, 1, 1,
-0.5226563, 0.1457294, -0.3774613, 0, 0, 0, 1, 1,
-0.5203217, 2.001343, -0.3864946, 0, 0, 0, 1, 1,
-0.5197952, -0.707582, -2.756834, 0, 0, 0, 1, 1,
-0.5180776, -0.1045351, -1.073904, 0, 0, 0, 1, 1,
-0.5162218, -1.340721, -0.5103495, 0, 0, 0, 1, 1,
-0.5094944, -0.6472542, -2.570756, 0, 0, 0, 1, 1,
-0.5082119, 1.371992, -0.4851708, 1, 1, 1, 1, 1,
-0.4946548, -0.4817541, -2.904758, 1, 1, 1, 1, 1,
-0.4928002, -0.8486837, -2.231822, 1, 1, 1, 1, 1,
-0.4918991, -1.356003, -2.482099, 1, 1, 1, 1, 1,
-0.4891995, -0.2867748, -0.00491133, 1, 1, 1, 1, 1,
-0.4855892, 0.1473334, -0.4068704, 1, 1, 1, 1, 1,
-0.4780649, -0.4015498, -0.5817429, 1, 1, 1, 1, 1,
-0.4776945, 0.4358382, -1.393481, 1, 1, 1, 1, 1,
-0.4761344, -0.7785429, -3.095139, 1, 1, 1, 1, 1,
-0.4707447, 0.5133191, 0.1065242, 1, 1, 1, 1, 1,
-0.4704161, 1.38326, -2.65686, 1, 1, 1, 1, 1,
-0.4674878, -0.8897688, -2.686739, 1, 1, 1, 1, 1,
-0.465489, -0.5098252, -2.883885, 1, 1, 1, 1, 1,
-0.4623868, -0.4181081, -0.8628054, 1, 1, 1, 1, 1,
-0.4620987, -1.200778, -1.337774, 1, 1, 1, 1, 1,
-0.4620063, 0.1973701, -1.468772, 0, 0, 1, 1, 1,
-0.4608419, -2.738168, -2.005742, 1, 0, 0, 1, 1,
-0.4584926, 0.01169578, -0.9596039, 1, 0, 0, 1, 1,
-0.457954, 0.03582032, -2.167851, 1, 0, 0, 1, 1,
-0.4536376, 1.080085, -1.514805, 1, 0, 0, 1, 1,
-0.4486688, 0.02384578, -1.506713, 1, 0, 0, 1, 1,
-0.4387385, -0.6870562, -2.781228, 0, 0, 0, 1, 1,
-0.4366219, 0.8750055, 0.9953239, 0, 0, 0, 1, 1,
-0.4342419, 0.2514195, -1.58338, 0, 0, 0, 1, 1,
-0.4327191, -0.1259142, -1.100434, 0, 0, 0, 1, 1,
-0.4325953, -0.710924, -1.925202, 0, 0, 0, 1, 1,
-0.4230498, -0.6067716, -1.777097, 0, 0, 0, 1, 1,
-0.4206966, 0.8635844, -0.5986366, 0, 0, 0, 1, 1,
-0.4164569, 1.284462, 0.337308, 1, 1, 1, 1, 1,
-0.4117806, -0.7162944, -3.225441, 1, 1, 1, 1, 1,
-0.4085596, -1.237783, -3.952712, 1, 1, 1, 1, 1,
-0.4058561, -0.6090295, -0.9117103, 1, 1, 1, 1, 1,
-0.3989197, -0.4783113, -2.886258, 1, 1, 1, 1, 1,
-0.3967713, -1.610682, -2.685706, 1, 1, 1, 1, 1,
-0.3967397, -0.04631349, -1.293497, 1, 1, 1, 1, 1,
-0.3919373, 0.3579865, -1.668631, 1, 1, 1, 1, 1,
-0.3906015, 1.008113, -0.3397541, 1, 1, 1, 1, 1,
-0.3905917, 0.5215864, 0.3236884, 1, 1, 1, 1, 1,
-0.38225, -0.4947421, -0.8991107, 1, 1, 1, 1, 1,
-0.3791027, -0.3136941, -2.143052, 1, 1, 1, 1, 1,
-0.3762509, -0.7093071, -5.050866, 1, 1, 1, 1, 1,
-0.3757989, -0.6349152, -1.138583, 1, 1, 1, 1, 1,
-0.3754024, 0.1161788, -1.358714, 1, 1, 1, 1, 1,
-0.3752407, -0.1065407, -1.79395, 0, 0, 1, 1, 1,
-0.3719071, -0.8790621, -1.867582, 1, 0, 0, 1, 1,
-0.3679624, -1.064452, -4.323415, 1, 0, 0, 1, 1,
-0.3646336, -0.687183, -2.16865, 1, 0, 0, 1, 1,
-0.3579159, -1.301858, -4.202943, 1, 0, 0, 1, 1,
-0.3573858, -0.1318977, -2.483588, 1, 0, 0, 1, 1,
-0.3537049, -1.282586, -3.264269, 0, 0, 0, 1, 1,
-0.3518944, 0.1130973, -1.45762, 0, 0, 0, 1, 1,
-0.3488213, -0.1492414, -2.861464, 0, 0, 0, 1, 1,
-0.3480993, 1.729861, 0.1797686, 0, 0, 0, 1, 1,
-0.3474761, -0.2099348, -2.698561, 0, 0, 0, 1, 1,
-0.3454164, 1.209422, 0.8493291, 0, 0, 0, 1, 1,
-0.3442997, -0.919283, -3.472869, 0, 0, 0, 1, 1,
-0.3394998, -0.1543422, -1.214984, 1, 1, 1, 1, 1,
-0.3381949, -1.181526, -2.871225, 1, 1, 1, 1, 1,
-0.3370349, -0.1771539, -1.946425, 1, 1, 1, 1, 1,
-0.331107, 1.463145, 1.449789, 1, 1, 1, 1, 1,
-0.3302823, 2.114969, -0.5538646, 1, 1, 1, 1, 1,
-0.3284286, -0.4556609, -3.397661, 1, 1, 1, 1, 1,
-0.3259833, 0.03492153, -0.7730135, 1, 1, 1, 1, 1,
-0.3241822, 1.136419, -2.117604, 1, 1, 1, 1, 1,
-0.3220133, 0.510901, -1.744739, 1, 1, 1, 1, 1,
-0.3218605, 0.7053031, 0.5936698, 1, 1, 1, 1, 1,
-0.3215481, 1.008421, -0.05783139, 1, 1, 1, 1, 1,
-0.3184676, -1.117902, -2.680103, 1, 1, 1, 1, 1,
-0.3169623, 0.9896945, -0.17925, 1, 1, 1, 1, 1,
-0.3113778, -0.6675513, -3.066282, 1, 1, 1, 1, 1,
-0.3018496, -0.008547826, -2.049456, 1, 1, 1, 1, 1,
-0.3006224, -0.6339833, -2.564805, 0, 0, 1, 1, 1,
-0.2935835, -0.96802, -4.161074, 1, 0, 0, 1, 1,
-0.2924795, -0.9464666, -2.780494, 1, 0, 0, 1, 1,
-0.2892228, 0.3817399, -1.415725, 1, 0, 0, 1, 1,
-0.2873155, -0.02940707, -1.302412, 1, 0, 0, 1, 1,
-0.2868585, 0.4310971, -1.878216, 1, 0, 0, 1, 1,
-0.2865057, -1.091473, -3.230582, 0, 0, 0, 1, 1,
-0.2841749, -1.43004, -2.197696, 0, 0, 0, 1, 1,
-0.2811292, -0.7297812, -1.785129, 0, 0, 0, 1, 1,
-0.2808045, -1.05533, -2.422362, 0, 0, 0, 1, 1,
-0.2755844, 0.4216128, -1.502027, 0, 0, 0, 1, 1,
-0.2742366, -1.767812, -3.367224, 0, 0, 0, 1, 1,
-0.2710135, 0.2973051, 1.474832, 0, 0, 0, 1, 1,
-0.2692472, 0.4547412, 0.3382219, 1, 1, 1, 1, 1,
-0.269195, -0.4924877, -2.591424, 1, 1, 1, 1, 1,
-0.2665475, 1.133779, -1.838736, 1, 1, 1, 1, 1,
-0.2652932, 1.832799, -0.7278184, 1, 1, 1, 1, 1,
-0.2486101, 0.9257417, 0.9912201, 1, 1, 1, 1, 1,
-0.241788, 0.472751, -0.472553, 1, 1, 1, 1, 1,
-0.2407596, -0.7082748, -3.409456, 1, 1, 1, 1, 1,
-0.2386408, 0.1639725, -0.763706, 1, 1, 1, 1, 1,
-0.2361978, -1.239976, -4.456117, 1, 1, 1, 1, 1,
-0.2357287, -0.07478053, -2.852368, 1, 1, 1, 1, 1,
-0.2345109, -0.1607651, -1.296382, 1, 1, 1, 1, 1,
-0.2310717, -0.6070927, -3.283467, 1, 1, 1, 1, 1,
-0.2302822, 0.7812445, 0.413932, 1, 1, 1, 1, 1,
-0.2281705, -0.3964759, -3.268944, 1, 1, 1, 1, 1,
-0.2279951, 0.7437391, -1.98652, 1, 1, 1, 1, 1,
-0.226247, 0.9623812, 0.9846434, 0, 0, 1, 1, 1,
-0.2249643, 0.395259, -0.004785627, 1, 0, 0, 1, 1,
-0.2248241, -0.8291221, -1.783692, 1, 0, 0, 1, 1,
-0.222054, 0.1332179, -0.474432, 1, 0, 0, 1, 1,
-0.2205212, 0.3679873, -1.698361, 1, 0, 0, 1, 1,
-0.2199718, 0.5184457, 0.4667674, 1, 0, 0, 1, 1,
-0.2172247, -0.5592873, -3.637513, 0, 0, 0, 1, 1,
-0.2166979, -1.212525, -3.492371, 0, 0, 0, 1, 1,
-0.2140733, -1.510344, -4.291552, 0, 0, 0, 1, 1,
-0.2115722, -0.219617, -2.76291, 0, 0, 0, 1, 1,
-0.208746, 1.38549, -0.2519987, 0, 0, 0, 1, 1,
-0.2085171, 0.9685894, 0.06621402, 0, 0, 0, 1, 1,
-0.2054121, -0.3021995, -4.565059, 0, 0, 0, 1, 1,
-0.2036528, 0.06324083, -1.300685, 1, 1, 1, 1, 1,
-0.2010995, 3.470651, 0.770988, 1, 1, 1, 1, 1,
-0.1978706, 0.9349291, -0.0753231, 1, 1, 1, 1, 1,
-0.1973171, 0.5723519, 0.06054169, 1, 1, 1, 1, 1,
-0.1947143, 0.7589302, -0.9898509, 1, 1, 1, 1, 1,
-0.1915991, 0.8624179, -1.682068, 1, 1, 1, 1, 1,
-0.1901073, -0.3064707, -1.677021, 1, 1, 1, 1, 1,
-0.1897561, 0.3561755, -0.422672, 1, 1, 1, 1, 1,
-0.1891168, 0.0593382, -0.2277968, 1, 1, 1, 1, 1,
-0.1891038, -0.5960985, -1.93145, 1, 1, 1, 1, 1,
-0.1890202, 0.825276, 0.4280085, 1, 1, 1, 1, 1,
-0.1885368, 1.669239, 0.1244983, 1, 1, 1, 1, 1,
-0.1868938, 0.2120366, -0.2072921, 1, 1, 1, 1, 1,
-0.1865486, -1.037979, -3.219664, 1, 1, 1, 1, 1,
-0.1799372, 0.6521574, 0.3714663, 1, 1, 1, 1, 1,
-0.1782219, -0.8053854, -3.13145, 0, 0, 1, 1, 1,
-0.1775762, 1.236459, -0.9387842, 1, 0, 0, 1, 1,
-0.1771156, 0.9830245, 0.8167824, 1, 0, 0, 1, 1,
-0.1749395, -0.9957076, -1.732157, 1, 0, 0, 1, 1,
-0.1727189, -0.3221669, -1.321395, 1, 0, 0, 1, 1,
-0.1725852, 0.1936002, -4.639221, 1, 0, 0, 1, 1,
-0.1700053, -2.435792, -2.011332, 0, 0, 0, 1, 1,
-0.1678817, -1.127296, -2.656833, 0, 0, 0, 1, 1,
-0.1618728, 0.3725421, -0.9323241, 0, 0, 0, 1, 1,
-0.1585676, 0.1488695, -0.3633426, 0, 0, 0, 1, 1,
-0.1571887, 0.8243336, 0.1779771, 0, 0, 0, 1, 1,
-0.1523216, 0.07757093, -1.638187, 0, 0, 0, 1, 1,
-0.1505413, -0.2361115, -1.038608, 0, 0, 0, 1, 1,
-0.1471121, 0.04699884, -1.804634, 1, 1, 1, 1, 1,
-0.1456342, 0.191649, 0.500138, 1, 1, 1, 1, 1,
-0.1453176, 0.5383388, -1.358737, 1, 1, 1, 1, 1,
-0.1326929, -0.6498882, -4.303092, 1, 1, 1, 1, 1,
-0.131811, -2.147573, -1.643512, 1, 1, 1, 1, 1,
-0.1296932, -0.5610785, -1.645597, 1, 1, 1, 1, 1,
-0.1267837, 0.3346092, -0.6609875, 1, 1, 1, 1, 1,
-0.1200877, -0.2338071, -2.856733, 1, 1, 1, 1, 1,
-0.1184133, 1.901433, 1.011798, 1, 1, 1, 1, 1,
-0.1143635, 0.08453853, 0.9161124, 1, 1, 1, 1, 1,
-0.1141142, 2.154383, 1.386712, 1, 1, 1, 1, 1,
-0.1092207, 0.6441235, 0.5657989, 1, 1, 1, 1, 1,
-0.108507, 1.683195, -1.381474, 1, 1, 1, 1, 1,
-0.1066278, -0.3563904, -2.731503, 1, 1, 1, 1, 1,
-0.1025611, 0.4213684, 0.5297278, 1, 1, 1, 1, 1,
-0.09830406, 1.080346, -0.01192283, 0, 0, 1, 1, 1,
-0.0926032, 0.4532885, -1.526573, 1, 0, 0, 1, 1,
-0.09116323, -0.1502319, -1.704167, 1, 0, 0, 1, 1,
-0.09056679, 0.3881663, -0.02822067, 1, 0, 0, 1, 1,
-0.08915491, -1.363475, -3.738681, 1, 0, 0, 1, 1,
-0.08862784, 0.1087636, -1.719704, 1, 0, 0, 1, 1,
-0.08480735, 0.4990808, 1.497904, 0, 0, 0, 1, 1,
-0.08298342, -0.5391718, -1.402025, 0, 0, 0, 1, 1,
-0.08198275, -0.1865943, -3.671994, 0, 0, 0, 1, 1,
-0.08156391, -0.5098053, -3.174366, 0, 0, 0, 1, 1,
-0.08062553, 1.254477, 0.3639221, 0, 0, 0, 1, 1,
-0.08039079, 0.5987164, 2.29056, 0, 0, 0, 1, 1,
-0.08003352, 2.107102, 1.428161, 0, 0, 0, 1, 1,
-0.07955997, -0.6837228, -2.820289, 1, 1, 1, 1, 1,
-0.0791028, 0.1311612, -1.048822, 1, 1, 1, 1, 1,
-0.07867137, -1.18139, -4.40639, 1, 1, 1, 1, 1,
-0.07244439, 0.2748905, 0.6853808, 1, 1, 1, 1, 1,
-0.0600464, -0.3817639, -2.472314, 1, 1, 1, 1, 1,
-0.05947074, 0.05869602, -1.435885, 1, 1, 1, 1, 1,
-0.059396, 0.0211083, 0.04160969, 1, 1, 1, 1, 1,
-0.05674677, 0.3460733, 1.560616, 1, 1, 1, 1, 1,
-0.05645752, -0.5913819, -1.051237, 1, 1, 1, 1, 1,
-0.05503824, -0.2761274, -2.935565, 1, 1, 1, 1, 1,
-0.05480801, 2.201991, -0.02803973, 1, 1, 1, 1, 1,
-0.05300443, 0.3828125, -0.741621, 1, 1, 1, 1, 1,
-0.05024324, -1.83241, -3.577028, 1, 1, 1, 1, 1,
-0.04862381, -0.7825504, -3.241462, 1, 1, 1, 1, 1,
-0.04535547, -0.5189275, -2.069471, 1, 1, 1, 1, 1,
-0.04347267, -0.4435904, -2.599023, 0, 0, 1, 1, 1,
-0.04286862, 0.5293124, 0.7935998, 1, 0, 0, 1, 1,
-0.04115932, 0.184364, -1.110293, 1, 0, 0, 1, 1,
-0.0398088, 0.2691713, 1.198802, 1, 0, 0, 1, 1,
-0.03900479, -0.9552897, -2.995843, 1, 0, 0, 1, 1,
-0.03537259, 0.1623312, -1.530476, 1, 0, 0, 1, 1,
-0.03275004, 1.365933, 1.809998, 0, 0, 0, 1, 1,
-0.03145662, -0.2454085, -3.118719, 0, 0, 0, 1, 1,
-0.02921987, -1.475843, -4.191747, 0, 0, 0, 1, 1,
-0.02795773, -0.5850033, -4.020816, 0, 0, 0, 1, 1,
-0.02718744, 0.4158481, 0.05164824, 0, 0, 0, 1, 1,
-0.02714957, 2.151865, -0.3204317, 0, 0, 0, 1, 1,
-0.0236501, 1.628161, 0.4016729, 0, 0, 0, 1, 1,
-0.02037816, 0.5110572, -1.556134, 1, 1, 1, 1, 1,
-0.02023806, 0.1223075, -0.5022017, 1, 1, 1, 1, 1,
-0.01676162, -1.880075, -3.463033, 1, 1, 1, 1, 1,
-0.01528735, 1.271763, -0.1953355, 1, 1, 1, 1, 1,
-0.01339364, -1.45195, -4.590995, 1, 1, 1, 1, 1,
-0.01123968, 1.005702, -0.06074229, 1, 1, 1, 1, 1,
-0.006661291, -0.2197399, -4.152945, 1, 1, 1, 1, 1,
-0.005891579, -2.324741, -2.455534, 1, 1, 1, 1, 1,
-0.00477907, -1.451943, -5.319676, 1, 1, 1, 1, 1,
0.005323127, 0.4302277, -0.1907243, 1, 1, 1, 1, 1,
0.007681339, -0.7595139, 3.148036, 1, 1, 1, 1, 1,
0.008039893, -0.08918777, 4.82626, 1, 1, 1, 1, 1,
0.008145638, 0.2049559, -0.007678064, 1, 1, 1, 1, 1,
0.0104766, 0.005902303, -0.7580333, 1, 1, 1, 1, 1,
0.01262039, 0.4338948, -0.4303009, 1, 1, 1, 1, 1,
0.02109097, 0.5332512, 0.3973905, 0, 0, 1, 1, 1,
0.02787372, 1.081766, -1.28346, 1, 0, 0, 1, 1,
0.02956092, -0.23661, 1.782765, 1, 0, 0, 1, 1,
0.03029234, 0.4688313, 0.596314, 1, 0, 0, 1, 1,
0.03029943, -0.8617895, 3.043093, 1, 0, 0, 1, 1,
0.0315308, 1.191138, 1.930349, 1, 0, 0, 1, 1,
0.03170316, 1.5954, -1.368615, 0, 0, 0, 1, 1,
0.03295622, -1.769082, 4.711039, 0, 0, 0, 1, 1,
0.03401043, -1.929208, 3.364827, 0, 0, 0, 1, 1,
0.03462308, -2.357184, 2.640754, 0, 0, 0, 1, 1,
0.03598135, -0.1950267, 2.094057, 0, 0, 0, 1, 1,
0.03874534, 0.7165754, -0.3405786, 0, 0, 0, 1, 1,
0.04125085, -0.3813938, 2.511902, 0, 0, 0, 1, 1,
0.0415789, -0.08686166, 1.726908, 1, 1, 1, 1, 1,
0.04361423, -0.7098655, 2.319189, 1, 1, 1, 1, 1,
0.04394938, -0.9817563, 1.061672, 1, 1, 1, 1, 1,
0.04400345, 1.746266, 0.2527684, 1, 1, 1, 1, 1,
0.04506771, 0.2059964, -1.484136, 1, 1, 1, 1, 1,
0.04530884, -0.3352599, 2.763112, 1, 1, 1, 1, 1,
0.05095234, -1.072022, 3.271164, 1, 1, 1, 1, 1,
0.05150785, 1.004333, -0.1749752, 1, 1, 1, 1, 1,
0.05384677, -0.2147966, 2.293665, 1, 1, 1, 1, 1,
0.0591038, 1.249238, 0.008593612, 1, 1, 1, 1, 1,
0.06493104, -1.243732, 4.515409, 1, 1, 1, 1, 1,
0.06641272, 1.413227, 0.5995184, 1, 1, 1, 1, 1,
0.06989209, 0.3279626, 1.073289, 1, 1, 1, 1, 1,
0.07020141, 0.2150127, 0.1998989, 1, 1, 1, 1, 1,
0.07387835, 0.6877362, 0.2173205, 1, 1, 1, 1, 1,
0.08719519, 1.527733, -0.3932951, 0, 0, 1, 1, 1,
0.08759847, 2.397402, 0.6573533, 1, 0, 0, 1, 1,
0.08966937, 1.397957, -0.4293324, 1, 0, 0, 1, 1,
0.09357271, -0.7839313, 3.626555, 1, 0, 0, 1, 1,
0.09582839, -0.4079471, 4.487485, 1, 0, 0, 1, 1,
0.09820837, -0.4720966, 4.488526, 1, 0, 0, 1, 1,
0.1050753, 0.497124, 1.338418, 0, 0, 0, 1, 1,
0.1052645, -0.7463474, 1.870478, 0, 0, 0, 1, 1,
0.106132, -0.2490421, 1.319405, 0, 0, 0, 1, 1,
0.1073177, -0.6852923, 2.536252, 0, 0, 0, 1, 1,
0.1096378, -0.7442917, 3.38588, 0, 0, 0, 1, 1,
0.1102254, -0.5516002, 2.983519, 0, 0, 0, 1, 1,
0.1112122, -0.9837993, 3.488398, 0, 0, 0, 1, 1,
0.1121692, -0.05357668, 0.6769999, 1, 1, 1, 1, 1,
0.1175986, -1.146783, 3.251201, 1, 1, 1, 1, 1,
0.1228219, 0.7597949, -0.1903901, 1, 1, 1, 1, 1,
0.1293328, -0.170621, 3.396698, 1, 1, 1, 1, 1,
0.1306134, -1.278965, 2.59312, 1, 1, 1, 1, 1,
0.1338489, 0.4719472, -0.4528759, 1, 1, 1, 1, 1,
0.1346428, 0.8267092, -0.1419685, 1, 1, 1, 1, 1,
0.1357662, 0.8123279, -1.195239, 1, 1, 1, 1, 1,
0.146876, -1.456475, 4.515286, 1, 1, 1, 1, 1,
0.1483683, -0.2314051, 3.771817, 1, 1, 1, 1, 1,
0.1496861, 0.403979, 1.447581, 1, 1, 1, 1, 1,
0.1547022, -0.8716266, 4.235902, 1, 1, 1, 1, 1,
0.1568272, 0.2327479, -0.07785021, 1, 1, 1, 1, 1,
0.1573761, 0.1938866, -0.4262793, 1, 1, 1, 1, 1,
0.159561, -1.371337, 2.961004, 1, 1, 1, 1, 1,
0.1631816, 0.2676646, 0.01809002, 0, 0, 1, 1, 1,
0.1636132, -0.9075176, 2.138385, 1, 0, 0, 1, 1,
0.1679398, 0.948411, 1.92798, 1, 0, 0, 1, 1,
0.1745679, -0.1618518, 2.282804, 1, 0, 0, 1, 1,
0.1808219, 0.9658424, -0.5304602, 1, 0, 0, 1, 1,
0.185538, -1.24686, 3.089265, 1, 0, 0, 1, 1,
0.1862998, 1.254694, 0.8937164, 0, 0, 0, 1, 1,
0.189308, -1.594676, 3.038267, 0, 0, 0, 1, 1,
0.1930794, 0.3731856, -1.74787, 0, 0, 0, 1, 1,
0.1960072, 1.12215, -0.3602395, 0, 0, 0, 1, 1,
0.1989015, 1.132774, -0.8556066, 0, 0, 0, 1, 1,
0.2000122, -0.7337333, 1.971824, 0, 0, 0, 1, 1,
0.2088858, 0.3234747, 1.256539, 0, 0, 0, 1, 1,
0.2098331, -1.687469, 2.421342, 1, 1, 1, 1, 1,
0.2135407, -1.11715, 4.147723, 1, 1, 1, 1, 1,
0.2141433, 0.2970464, 0.9675003, 1, 1, 1, 1, 1,
0.2172322, -1.20528, 0.8710501, 1, 1, 1, 1, 1,
0.2181247, 0.9487891, -1.506129, 1, 1, 1, 1, 1,
0.2279459, 1.512364, 0.04649536, 1, 1, 1, 1, 1,
0.2315871, -0.5377598, 1.669901, 1, 1, 1, 1, 1,
0.232549, -0.2202945, 2.106482, 1, 1, 1, 1, 1,
0.2361118, 0.4290809, 0.9255949, 1, 1, 1, 1, 1,
0.2410776, 0.9885415, -0.7816377, 1, 1, 1, 1, 1,
0.2430237, -1.121015, 2.523686, 1, 1, 1, 1, 1,
0.2435676, 0.7440349, -0.02610162, 1, 1, 1, 1, 1,
0.2443795, -0.7314425, 2.393002, 1, 1, 1, 1, 1,
0.2444872, 0.3125988, -0.2292232, 1, 1, 1, 1, 1,
0.2459912, -0.6315817, 1.363821, 1, 1, 1, 1, 1,
0.2463096, -0.8441411, 2.032066, 0, 0, 1, 1, 1,
0.2467951, 0.3544084, 1.919225, 1, 0, 0, 1, 1,
0.2497237, -0.1950144, 3.657015, 1, 0, 0, 1, 1,
0.2505359, -1.008958, 2.80406, 1, 0, 0, 1, 1,
0.2508619, -0.3539746, 2.312436, 1, 0, 0, 1, 1,
0.2560147, -1.168804, 3.916836, 1, 0, 0, 1, 1,
0.2602132, 1.243706, -2.424943, 0, 0, 0, 1, 1,
0.263095, 0.7449446, -0.2982771, 0, 0, 0, 1, 1,
0.2648586, 0.2189956, 1.867342, 0, 0, 0, 1, 1,
0.267922, 0.8673295, -0.01390127, 0, 0, 0, 1, 1,
0.2691756, -0.6618924, 3.825539, 0, 0, 0, 1, 1,
0.270492, -0.9071581, 3.153342, 0, 0, 0, 1, 1,
0.2712526, 0.1503927, 1.513987, 0, 0, 0, 1, 1,
0.274349, -0.5919497, 2.232026, 1, 1, 1, 1, 1,
0.2747446, 1.623082, 0.01604459, 1, 1, 1, 1, 1,
0.2753981, -0.2066947, 2.879594, 1, 1, 1, 1, 1,
0.2794618, 0.8693986, 2.421439, 1, 1, 1, 1, 1,
0.2811027, -0.5326849, 3.482179, 1, 1, 1, 1, 1,
0.2830912, -1.144479, 3.381858, 1, 1, 1, 1, 1,
0.2845908, 1.605097, -1.367759, 1, 1, 1, 1, 1,
0.2869867, -1.213712, 2.399678, 1, 1, 1, 1, 1,
0.2874812, 0.5221705, -1.843832, 1, 1, 1, 1, 1,
0.2904701, -0.3784401, 1.543027, 1, 1, 1, 1, 1,
0.2942208, -0.05489893, -0.7196635, 1, 1, 1, 1, 1,
0.300512, -0.2464814, 2.710303, 1, 1, 1, 1, 1,
0.3048971, 0.3209058, 2.227762, 1, 1, 1, 1, 1,
0.3102986, -0.268116, 1.211248, 1, 1, 1, 1, 1,
0.3119695, -0.01522041, 2.574069, 1, 1, 1, 1, 1,
0.3135843, 0.2320387, 1.765705, 0, 0, 1, 1, 1,
0.3171412, 0.7016081, 0.06155696, 1, 0, 0, 1, 1,
0.3183774, 0.2673034, 1.369121, 1, 0, 0, 1, 1,
0.3188113, 1.121445, 1.113038, 1, 0, 0, 1, 1,
0.3194869, 1.430112, 0.3664597, 1, 0, 0, 1, 1,
0.3256746, -0.1779491, 1.614591, 1, 0, 0, 1, 1,
0.3277863, -1.181409, 3.538764, 0, 0, 0, 1, 1,
0.3374312, 0.1986538, -1.236652, 0, 0, 0, 1, 1,
0.3419261, -0.1875501, 1.181859, 0, 0, 0, 1, 1,
0.3426588, -0.5888067, 1.57691, 0, 0, 0, 1, 1,
0.3433784, 1.212416, -0.4076996, 0, 0, 0, 1, 1,
0.3437499, -0.5598546, 1.824349, 0, 0, 0, 1, 1,
0.3522129, -0.1189279, 1.592224, 0, 0, 0, 1, 1,
0.3546726, 0.7382504, 0.07082686, 1, 1, 1, 1, 1,
0.3595673, 0.2942655, -2.959666, 1, 1, 1, 1, 1,
0.3600243, 2.228184, 1.301839, 1, 1, 1, 1, 1,
0.3636758, -0.3496056, 2.674695, 1, 1, 1, 1, 1,
0.3688063, -0.03629601, 0.913749, 1, 1, 1, 1, 1,
0.3707865, 0.1921776, -0.3333559, 1, 1, 1, 1, 1,
0.3715124, 0.02869328, 2.433393, 1, 1, 1, 1, 1,
0.3726336, -0.7854792, 2.576327, 1, 1, 1, 1, 1,
0.3743891, -1.272941, 2.256505, 1, 1, 1, 1, 1,
0.3759469, -0.5898802, 4.174653, 1, 1, 1, 1, 1,
0.3794325, -1.050749, 2.685373, 1, 1, 1, 1, 1,
0.3856112, -0.8558985, 3.618915, 1, 1, 1, 1, 1,
0.3859665, -1.274977, 3.03277, 1, 1, 1, 1, 1,
0.386048, -0.9559489, 1.280867, 1, 1, 1, 1, 1,
0.386803, -1.033992, 3.793672, 1, 1, 1, 1, 1,
0.3881486, -0.3983399, 1.260182, 0, 0, 1, 1, 1,
0.3906803, -0.1343336, 1.449532, 1, 0, 0, 1, 1,
0.391023, -1.201174, 3.67967, 1, 0, 0, 1, 1,
0.3975713, -1.155289, 1.440558, 1, 0, 0, 1, 1,
0.3980054, 1.860316, 0.9127765, 1, 0, 0, 1, 1,
0.3983469, -1.507283, 1.700356, 1, 0, 0, 1, 1,
0.4004934, 0.5802336, 1.987488, 0, 0, 0, 1, 1,
0.4102627, 0.8182374, -0.06045784, 0, 0, 0, 1, 1,
0.4130754, -0.3475849, 3.494833, 0, 0, 0, 1, 1,
0.4145862, -0.7064476, 3.296916, 0, 0, 0, 1, 1,
0.4162536, -0.4700653, 1.557255, 0, 0, 0, 1, 1,
0.4177606, -0.3243917, 1.443239, 0, 0, 0, 1, 1,
0.4189282, 1.857139, -0.01114538, 0, 0, 0, 1, 1,
0.4200988, -1.423058, 2.866612, 1, 1, 1, 1, 1,
0.4226107, 1.31095, 0.6042644, 1, 1, 1, 1, 1,
0.4264975, 0.1777123, 1.436156, 1, 1, 1, 1, 1,
0.4306115, -0.3355628, 0.5967388, 1, 1, 1, 1, 1,
0.4310349, 1.341502, 1.196345, 1, 1, 1, 1, 1,
0.4319241, 0.8445354, 2.434719, 1, 1, 1, 1, 1,
0.4321105, 0.3283626, 0.1558341, 1, 1, 1, 1, 1,
0.4326182, 0.6024417, 0.3790368, 1, 1, 1, 1, 1,
0.4333123, -1.455006, 1.47162, 1, 1, 1, 1, 1,
0.4408582, -0.1053221, 0.1009889, 1, 1, 1, 1, 1,
0.442886, -0.3736348, 1.496498, 1, 1, 1, 1, 1,
0.4437355, 0.7340749, 2.701069, 1, 1, 1, 1, 1,
0.4493439, 1.111437, 1.343368, 1, 1, 1, 1, 1,
0.452632, -0.3487538, 2.402684, 1, 1, 1, 1, 1,
0.4536752, 0.7175882, 0.3268202, 1, 1, 1, 1, 1,
0.4562343, 0.3665982, 0.4003557, 0, 0, 1, 1, 1,
0.4584578, 0.3306357, 3.035513, 1, 0, 0, 1, 1,
0.4611156, 0.1241724, 2.060442, 1, 0, 0, 1, 1,
0.4618913, -0.4898148, 1.751976, 1, 0, 0, 1, 1,
0.4637237, -0.01675281, 2.077034, 1, 0, 0, 1, 1,
0.4639398, -0.3853704, 2.233165, 1, 0, 0, 1, 1,
0.4671733, -2.644422, 2.98021, 0, 0, 0, 1, 1,
0.4694573, 1.563248, 0.8032845, 0, 0, 0, 1, 1,
0.4710914, -1.277987, 2.763572, 0, 0, 0, 1, 1,
0.4745875, -0.6873061, 1.330723, 0, 0, 0, 1, 1,
0.4806821, 0.823762, 1.162066, 0, 0, 0, 1, 1,
0.4818629, -1.258495, 0.8007864, 0, 0, 0, 1, 1,
0.4856708, 1.389977, -0.09890159, 0, 0, 0, 1, 1,
0.4995547, -0.06770542, 1.74183, 1, 1, 1, 1, 1,
0.5012274, -0.8905298, 0.2746429, 1, 1, 1, 1, 1,
0.5022988, 2.121553, -0.4394506, 1, 1, 1, 1, 1,
0.5055801, -0.168256, 2.546452, 1, 1, 1, 1, 1,
0.5072852, -0.5426828, 1.003548, 1, 1, 1, 1, 1,
0.511192, -0.1252853, 2.839798, 1, 1, 1, 1, 1,
0.5114182, 0.1070869, 1.874604, 1, 1, 1, 1, 1,
0.5172643, 0.4007885, -0.4748665, 1, 1, 1, 1, 1,
0.5197341, -1.205635, 2.088507, 1, 1, 1, 1, 1,
0.519888, 1.719026, 0.7909542, 1, 1, 1, 1, 1,
0.5249485, -0.09910347, 1.674088, 1, 1, 1, 1, 1,
0.527962, 0.9427045, 1.829038, 1, 1, 1, 1, 1,
0.529029, 0.6208393, 0.638113, 1, 1, 1, 1, 1,
0.5353652, -1.586532, 1.607054, 1, 1, 1, 1, 1,
0.5363861, 1.471412, 0.4958289, 1, 1, 1, 1, 1,
0.5521762, 0.6770234, -0.02521333, 0, 0, 1, 1, 1,
0.5548466, 0.2517743, 0.5653741, 1, 0, 0, 1, 1,
0.5592412, 0.009959416, 3.043238, 1, 0, 0, 1, 1,
0.5611705, -0.2733909, 3.998671, 1, 0, 0, 1, 1,
0.5615358, 1.156892, -1.384818, 1, 0, 0, 1, 1,
0.5663354, 0.8442448, 1.030632, 1, 0, 0, 1, 1,
0.5672411, 0.6049621, 0.0215919, 0, 0, 0, 1, 1,
0.568114, -1.422381, 2.503924, 0, 0, 0, 1, 1,
0.5713075, -0.8603056, 1.609531, 0, 0, 0, 1, 1,
0.5772764, -1.390719, 3.178265, 0, 0, 0, 1, 1,
0.5790796, 0.1981556, 0.6481077, 0, 0, 0, 1, 1,
0.5831049, -0.5001275, 1.6769, 0, 0, 0, 1, 1,
0.5850269, 1.795602, -1.076955, 0, 0, 0, 1, 1,
0.5852286, -0.005212734, 2.830967, 1, 1, 1, 1, 1,
0.5854328, 0.1172773, 3.003078, 1, 1, 1, 1, 1,
0.5923772, -1.096597, 1.640387, 1, 1, 1, 1, 1,
0.5937338, -1.000392, 1.550652, 1, 1, 1, 1, 1,
0.5970015, 0.0349549, 2.025965, 1, 1, 1, 1, 1,
0.6018142, 1.432116, -0.150256, 1, 1, 1, 1, 1,
0.607581, 1.221803, -1.03503, 1, 1, 1, 1, 1,
0.6108225, -1.693705, 3.956675, 1, 1, 1, 1, 1,
0.6181624, 0.7214583, -0.3581529, 1, 1, 1, 1, 1,
0.6190344, 0.006823535, 1.731462, 1, 1, 1, 1, 1,
0.6193159, 1.002979, 1.258675, 1, 1, 1, 1, 1,
0.6216858, -0.6135992, 3.02013, 1, 1, 1, 1, 1,
0.6262836, 1.120438, -1.534336, 1, 1, 1, 1, 1,
0.6495334, -0.8758137, 2.55532, 1, 1, 1, 1, 1,
0.6510829, 0.6552569, 1.715739, 1, 1, 1, 1, 1,
0.651872, 1.364832, 3.073484, 0, 0, 1, 1, 1,
0.6542976, -0.0472827, 1.298321, 1, 0, 0, 1, 1,
0.6569276, -0.7723911, 2.956268, 1, 0, 0, 1, 1,
0.6589666, -0.4308823, 1.6279, 1, 0, 0, 1, 1,
0.6592659, -0.5287356, 2.496726, 1, 0, 0, 1, 1,
0.6657722, 1.760108, 1.016631, 1, 0, 0, 1, 1,
0.6684098, 0.2910914, 2.945221, 0, 0, 0, 1, 1,
0.668923, 1.292394, 1.150082, 0, 0, 0, 1, 1,
0.6735882, 0.689243, 1.008922, 0, 0, 0, 1, 1,
0.6769051, -1.824777, 2.114791, 0, 0, 0, 1, 1,
0.6833078, 1.899384, -1.72365, 0, 0, 0, 1, 1,
0.6846119, -0.6661676, 1.909047, 0, 0, 0, 1, 1,
0.686414, -1.912611, 2.312453, 0, 0, 0, 1, 1,
0.6908087, -1.092995, 2.509994, 1, 1, 1, 1, 1,
0.6915097, -0.4932376, 2.33815, 1, 1, 1, 1, 1,
0.6915826, -0.9713446, 2.248496, 1, 1, 1, 1, 1,
0.6972194, -0.7060069, 0.8756144, 1, 1, 1, 1, 1,
0.699083, 1.865088, 0.05431284, 1, 1, 1, 1, 1,
0.7038004, 1.747315, -0.0790454, 1, 1, 1, 1, 1,
0.7107947, -1.986279, 1.350841, 1, 1, 1, 1, 1,
0.7127486, -0.7390963, 3.286118, 1, 1, 1, 1, 1,
0.7192391, -0.4490314, 2.946583, 1, 1, 1, 1, 1,
0.7216313, 1.184978, 0.4155306, 1, 1, 1, 1, 1,
0.7255889, 0.2690974, 0.7163139, 1, 1, 1, 1, 1,
0.7272214, -0.5751129, 1.786727, 1, 1, 1, 1, 1,
0.729196, 1.34919, 0.5136394, 1, 1, 1, 1, 1,
0.7353935, -1.014226, 1.58156, 1, 1, 1, 1, 1,
0.7359146, -0.5969416, 1.412979, 1, 1, 1, 1, 1,
0.7416018, -1.199853, 2.617827, 0, 0, 1, 1, 1,
0.7506768, -0.07936398, 0.6070388, 1, 0, 0, 1, 1,
0.7513465, 0.4939187, -0.8465083, 1, 0, 0, 1, 1,
0.75293, 0.6597863, -0.2278044, 1, 0, 0, 1, 1,
0.7559485, -2.402552, 1.802621, 1, 0, 0, 1, 1,
0.7577762, -0.9208791, 0.6182014, 1, 0, 0, 1, 1,
0.7599102, 0.8421352, 0.5929258, 0, 0, 0, 1, 1,
0.7610611, 0.2950512, 2.125919, 0, 0, 0, 1, 1,
0.7611657, -0.1349762, 2.569992, 0, 0, 0, 1, 1,
0.763605, 0.2089276, 1.196038, 0, 0, 0, 1, 1,
0.7648537, 0.3604142, 1.009858, 0, 0, 0, 1, 1,
0.7715611, -0.1040023, 1.386064, 0, 0, 0, 1, 1,
0.773547, -0.6288186, 2.236121, 0, 0, 0, 1, 1,
0.7742241, 1.745292, 0.3439353, 1, 1, 1, 1, 1,
0.7926484, -0.2999239, 0.601666, 1, 1, 1, 1, 1,
0.8040785, 0.5098318, 3.025537, 1, 1, 1, 1, 1,
0.8137015, 0.6336479, 0.3249449, 1, 1, 1, 1, 1,
0.8165653, -0.02470024, 2.332584, 1, 1, 1, 1, 1,
0.8201118, -0.2911417, 2.246626, 1, 1, 1, 1, 1,
0.8289934, -0.671662, 2.927888, 1, 1, 1, 1, 1,
0.829744, 1.794469, 0.1830576, 1, 1, 1, 1, 1,
0.8374762, 1.070482, 0.304178, 1, 1, 1, 1, 1,
0.8399252, 0.3388385, -2.535374, 1, 1, 1, 1, 1,
0.8421369, 0.0007327613, 1.388332, 1, 1, 1, 1, 1,
0.8554352, -0.64977, 2.639558, 1, 1, 1, 1, 1,
0.858878, 1.363324, 1.69563, 1, 1, 1, 1, 1,
0.8630059, 0.7693996, 2.652786, 1, 1, 1, 1, 1,
0.8631881, 1.914652, -0.8932866, 1, 1, 1, 1, 1,
0.8639355, -0.1747682, 1.434846, 0, 0, 1, 1, 1,
0.8736891, -1.429025, 3.082744, 1, 0, 0, 1, 1,
0.8747627, 0.8931388, 0.9409785, 1, 0, 0, 1, 1,
0.8842055, -0.2497259, 0.7209759, 1, 0, 0, 1, 1,
0.8920009, -2.435427, 2.184718, 1, 0, 0, 1, 1,
0.9012957, -3.048284, 1.343907, 1, 0, 0, 1, 1,
0.9130536, 0.1090982, 0.905875, 0, 0, 0, 1, 1,
0.9166551, 1.29743, 1.392724, 0, 0, 0, 1, 1,
0.9181834, 0.2964438, 0.8381004, 0, 0, 0, 1, 1,
0.923036, -0.8193111, 1.464603, 0, 0, 0, 1, 1,
0.9271922, 1.497706, 1.057221, 0, 0, 0, 1, 1,
0.9428038, 0.2616524, 1.655186, 0, 0, 0, 1, 1,
0.9511418, -0.7191097, 1.4508, 0, 0, 0, 1, 1,
0.9522601, 0.8237166, 1.351265, 1, 1, 1, 1, 1,
0.9551988, -0.5635528, 2.331515, 1, 1, 1, 1, 1,
0.9561542, -0.4073751, 2.76305, 1, 1, 1, 1, 1,
0.9582239, 0.4539632, -0.2065197, 1, 1, 1, 1, 1,
0.9587119, 0.0801122, 0.5205051, 1, 1, 1, 1, 1,
0.9598442, 0.4291208, 0.009534242, 1, 1, 1, 1, 1,
0.9613216, 0.6272339, 0.9138631, 1, 1, 1, 1, 1,
0.9634693, 1.076473, 1.373949, 1, 1, 1, 1, 1,
0.9638033, -0.5536249, 1.589846, 1, 1, 1, 1, 1,
0.9645565, -2.582681, 4.532778, 1, 1, 1, 1, 1,
0.9806501, -0.9569699, 0.8754959, 1, 1, 1, 1, 1,
0.9871647, 0.1703546, -0.05036774, 1, 1, 1, 1, 1,
0.9908175, -0.7270536, 3.14248, 1, 1, 1, 1, 1,
0.9916068, 0.08049304, 1.685991, 1, 1, 1, 1, 1,
1.001564, -2.460112, 1.724512, 1, 1, 1, 1, 1,
1.002079, 0.7550648, 0.2850392, 0, 0, 1, 1, 1,
1.002757, -0.07946832, 0.7215515, 1, 0, 0, 1, 1,
1.006176, 1.484378, 0.8812832, 1, 0, 0, 1, 1,
1.016337, 0.06380102, 2.485134, 1, 0, 0, 1, 1,
1.022116, 0.7190187, 0.9922981, 1, 0, 0, 1, 1,
1.024514, -0.908597, 1.280285, 1, 0, 0, 1, 1,
1.029536, 0.6501363, -0.5129221, 0, 0, 0, 1, 1,
1.036638, 2.096443, 0.6638429, 0, 0, 0, 1, 1,
1.04012, 0.7999378, 1.749529, 0, 0, 0, 1, 1,
1.040483, 1.766593, -0.4745886, 0, 0, 0, 1, 1,
1.041418, 0.2707414, 1.440691, 0, 0, 0, 1, 1,
1.045698, 1.091472, 1.071824, 0, 0, 0, 1, 1,
1.046303, 1.403088, 1.000692, 0, 0, 0, 1, 1,
1.0482, 0.4167855, 1.561041, 1, 1, 1, 1, 1,
1.054364, -0.2982949, 1.330145, 1, 1, 1, 1, 1,
1.057845, -0.3285639, 0.9292697, 1, 1, 1, 1, 1,
1.058113, -1.69008, 0.06276309, 1, 1, 1, 1, 1,
1.058826, -0.3559411, 2.759769, 1, 1, 1, 1, 1,
1.064058, 0.07955363, 1.433025, 1, 1, 1, 1, 1,
1.072321, -1.025503, 2.953254, 1, 1, 1, 1, 1,
1.073061, 0.328534, 2.128591, 1, 1, 1, 1, 1,
1.082228, 0.4271942, 1.025136, 1, 1, 1, 1, 1,
1.083736, 1.431042, 1.354691, 1, 1, 1, 1, 1,
1.087002, -0.7018002, 2.864679, 1, 1, 1, 1, 1,
1.102636, 0.6746771, 0.7820188, 1, 1, 1, 1, 1,
1.104093, 0.7692727, 1.247844, 1, 1, 1, 1, 1,
1.110019, 0.7272335, 0.9601371, 1, 1, 1, 1, 1,
1.110098, 4.022754, -0.3197512, 1, 1, 1, 1, 1,
1.126881, 0.3385973, 1.126923, 0, 0, 1, 1, 1,
1.131275, -0.132768, 1.997635, 1, 0, 0, 1, 1,
1.134061, -2.316153, 1.443349, 1, 0, 0, 1, 1,
1.146942, 1.644221, 0.7599826, 1, 0, 0, 1, 1,
1.15061, 0.7127434, 2.014412, 1, 0, 0, 1, 1,
1.15142, -0.4585457, 2.871568, 1, 0, 0, 1, 1,
1.157964, -0.386295, 1.866386, 0, 0, 0, 1, 1,
1.163399, 1.663175, 0.5765319, 0, 0, 0, 1, 1,
1.17364, 0.5921847, 1.435651, 0, 0, 0, 1, 1,
1.177475, 0.8373587, 0.8452713, 0, 0, 0, 1, 1,
1.177697, -1.706416, 2.326787, 0, 0, 0, 1, 1,
1.182055, 0.8638541, 1.820259, 0, 0, 0, 1, 1,
1.187486, 3.511602, 1.294502, 0, 0, 0, 1, 1,
1.21143, 0.9537209, -0.8283814, 1, 1, 1, 1, 1,
1.214398, -0.106311, 0.1429146, 1, 1, 1, 1, 1,
1.225487, 0.1552692, 0.7407761, 1, 1, 1, 1, 1,
1.226666, -2.049621, 3.14753, 1, 1, 1, 1, 1,
1.2285, 1.079192, 0.2856856, 1, 1, 1, 1, 1,
1.229595, -2.187427, 2.761139, 1, 1, 1, 1, 1,
1.236925, 0.02696783, 1.205174, 1, 1, 1, 1, 1,
1.237545, -1.324265, 2.54447, 1, 1, 1, 1, 1,
1.238352, -0.3901818, 0.5057424, 1, 1, 1, 1, 1,
1.239907, -2.05686, 3.507501, 1, 1, 1, 1, 1,
1.244143, 0.7034835, 1.721531, 1, 1, 1, 1, 1,
1.24737, 0.3133403, 1.448952, 1, 1, 1, 1, 1,
1.25754, -0.5365086, 1.279259, 1, 1, 1, 1, 1,
1.260321, 0.6862109, -0.3069718, 1, 1, 1, 1, 1,
1.269426, -0.6138645, 1.685713, 1, 1, 1, 1, 1,
1.273543, 0.2537026, -0.08369206, 0, 0, 1, 1, 1,
1.281305, -1.439312, 2.856812, 1, 0, 0, 1, 1,
1.282859, -1.114304, 2.989867, 1, 0, 0, 1, 1,
1.283733, -2.399091, 1.273883, 1, 0, 0, 1, 1,
1.284213, 0.5109744, 0.9229049, 1, 0, 0, 1, 1,
1.304572, 0.8044851, 2.033652, 1, 0, 0, 1, 1,
1.310063, 1.321316, 0.7539639, 0, 0, 0, 1, 1,
1.313192, -1.613851, 2.63434, 0, 0, 0, 1, 1,
1.313716, -0.5020111, 0.2115097, 0, 0, 0, 1, 1,
1.315944, 0.5362207, 0.4311741, 0, 0, 0, 1, 1,
1.324158, -1.646899, 3.244375, 0, 0, 0, 1, 1,
1.334053, 0.8632211, 0.7033116, 0, 0, 0, 1, 1,
1.334677, 0.4799784, -0.1618594, 0, 0, 0, 1, 1,
1.334816, 0.7739831, -0.06549804, 1, 1, 1, 1, 1,
1.336164, 0.9013082, 0.0141989, 1, 1, 1, 1, 1,
1.348844, 0.1783206, 1.373646, 1, 1, 1, 1, 1,
1.369292, -0.5430653, 2.622887, 1, 1, 1, 1, 1,
1.371736, -1.09296, 3.553776, 1, 1, 1, 1, 1,
1.374569, -1.309552, 0.4781988, 1, 1, 1, 1, 1,
1.376196, 0.2366894, 0.6091439, 1, 1, 1, 1, 1,
1.380137, 1.518308, 0.06120428, 1, 1, 1, 1, 1,
1.38083, -0.2743299, 0.7625842, 1, 1, 1, 1, 1,
1.381875, -0.2941098, 3.336326, 1, 1, 1, 1, 1,
1.397046, 1.402968, 0.09305487, 1, 1, 1, 1, 1,
1.40055, 0.264935, 2.182168, 1, 1, 1, 1, 1,
1.404398, -1.272242, 2.554229, 1, 1, 1, 1, 1,
1.406099, 1.332511, 0.7380053, 1, 1, 1, 1, 1,
1.41106, -0.03098333, 2.838614, 1, 1, 1, 1, 1,
1.420942, 0.9817684, 1.583583, 0, 0, 1, 1, 1,
1.440634, -0.2197148, 3.968341, 1, 0, 0, 1, 1,
1.454566, -0.6104026, 3.160833, 1, 0, 0, 1, 1,
1.455167, 1.24497, 0.7617671, 1, 0, 0, 1, 1,
1.467439, -1.487257, 3.138062, 1, 0, 0, 1, 1,
1.469273, 0.3925616, 0.8575941, 1, 0, 0, 1, 1,
1.470298, 1.336146, -1.299541, 0, 0, 0, 1, 1,
1.476144, 1.190452, 1.683817, 0, 0, 0, 1, 1,
1.482963, 1.961327, 1.57991, 0, 0, 0, 1, 1,
1.483939, 1.143626, 0.3911966, 0, 0, 0, 1, 1,
1.486545, -0.2477936, 0.2306324, 0, 0, 0, 1, 1,
1.489257, 0.452993, -0.1308291, 0, 0, 0, 1, 1,
1.490102, -0.3137596, 1.523943, 0, 0, 0, 1, 1,
1.515778, -0.2556597, 1.091929, 1, 1, 1, 1, 1,
1.520033, -1.456924, -0.03103571, 1, 1, 1, 1, 1,
1.528127, -1.223939, 4.047771, 1, 1, 1, 1, 1,
1.533934, -0.3810627, 2.699481, 1, 1, 1, 1, 1,
1.549352, -0.3078182, 3.211832, 1, 1, 1, 1, 1,
1.560681, 0.708167, 3.886709, 1, 1, 1, 1, 1,
1.563135, 0.6131434, -0.9246756, 1, 1, 1, 1, 1,
1.566274, -1.858923, 2.469753, 1, 1, 1, 1, 1,
1.573241, -0.3247532, 2.591911, 1, 1, 1, 1, 1,
1.575181, -0.05434393, 1.62061, 1, 1, 1, 1, 1,
1.591241, 0.2752485, 1.065475, 1, 1, 1, 1, 1,
1.598575, -0.4288296, 2.558067, 1, 1, 1, 1, 1,
1.604353, -1.182017, -0.3674114, 1, 1, 1, 1, 1,
1.60757, 0.5754009, 0.6461911, 1, 1, 1, 1, 1,
1.615972, -0.9455014, 0.3882895, 1, 1, 1, 1, 1,
1.616428, -0.562448, 2.368129, 0, 0, 1, 1, 1,
1.621218, 0.5578795, 0.9663589, 1, 0, 0, 1, 1,
1.629314, -1.688146, 2.564326, 1, 0, 0, 1, 1,
1.63008, -0.3920282, 2.710385, 1, 0, 0, 1, 1,
1.633726, 0.4720795, 1.738671, 1, 0, 0, 1, 1,
1.634353, -1.186927, 3.387369, 1, 0, 0, 1, 1,
1.635822, -1.648887, 1.610196, 0, 0, 0, 1, 1,
1.652399, 0.1658272, 1.752858, 0, 0, 0, 1, 1,
1.673251, -0.6761087, 3.44308, 0, 0, 0, 1, 1,
1.686981, 0.1458209, 2.920177, 0, 0, 0, 1, 1,
1.693824, -1.266972, 3.970431, 0, 0, 0, 1, 1,
1.696984, -2.417815, 3.161545, 0, 0, 0, 1, 1,
1.704923, -0.4247528, 3.591195, 0, 0, 0, 1, 1,
1.70794, -0.06766757, 1.484712, 1, 1, 1, 1, 1,
1.718361, 0.3132658, 0.558569, 1, 1, 1, 1, 1,
1.764094, -0.6158307, 1.878621, 1, 1, 1, 1, 1,
1.767315, 1.917421, 1.040208, 1, 1, 1, 1, 1,
1.770543, 0.3166583, 2.655579, 1, 1, 1, 1, 1,
1.77592, 0.4485598, 3.745322, 1, 1, 1, 1, 1,
1.799352, -1.390816, 1.47712, 1, 1, 1, 1, 1,
1.803479, -0.5534604, 0.4870319, 1, 1, 1, 1, 1,
1.816671, -0.3068651, 0.5909695, 1, 1, 1, 1, 1,
1.848269, -0.8646057, 1.321439, 1, 1, 1, 1, 1,
1.891143, -0.5972599, 1.710508, 1, 1, 1, 1, 1,
1.912443, -0.52674, 1.660668, 1, 1, 1, 1, 1,
1.914851, 1.100169, -0.4885034, 1, 1, 1, 1, 1,
1.915404, -2.38639, 1.141816, 1, 1, 1, 1, 1,
1.925804, 0.3234563, -0.8586356, 1, 1, 1, 1, 1,
2.010522, -0.5150178, 1.787749, 0, 0, 1, 1, 1,
2.045459, 0.1229613, 3.094826, 1, 0, 0, 1, 1,
2.060858, -0.4914417, 2.396232, 1, 0, 0, 1, 1,
2.104185, 1.00985, 0.5804675, 1, 0, 0, 1, 1,
2.129549, 2.161005, 0.1718187, 1, 0, 0, 1, 1,
2.156025, -1.036983, 1.696956, 1, 0, 0, 1, 1,
2.162214, -3.123508, 1.862181, 0, 0, 0, 1, 1,
2.170928, 0.7310646, 1.261313, 0, 0, 0, 1, 1,
2.20732, -0.8577422, 0.7125655, 0, 0, 0, 1, 1,
2.216621, -1.478352, 2.960958, 0, 0, 0, 1, 1,
2.337831, 0.07685229, 3.169259, 0, 0, 0, 1, 1,
2.510198, -0.5687579, 2.133335, 0, 0, 0, 1, 1,
2.519733, -0.6626238, 0.8641048, 0, 0, 0, 1, 1,
2.619665, 0.989362, 2.324767, 1, 1, 1, 1, 1,
2.720902, 0.1362516, 2.725928, 1, 1, 1, 1, 1,
2.729933, -1.531272, 1.932007, 1, 1, 1, 1, 1,
2.806687, -0.2682988, 0.8421707, 1, 1, 1, 1, 1,
2.813633, 1.743978, 0.7072624, 1, 1, 1, 1, 1,
2.917478, -0.2825505, 2.203475, 1, 1, 1, 1, 1,
3.237318, -0.01325765, -0.7465296, 1, 1, 1, 1, 1
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
var radius = 9.893561;
var distance = 34.75071;
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
mvMatrix.translate( 0.2943101, -0.1773367, 0.2467082 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.75071);
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
