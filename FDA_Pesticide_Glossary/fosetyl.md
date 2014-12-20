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
-3.241945, 0.5498969, -0.5900046, 1, 0, 0, 1,
-3.047076, 1.795345, -2.584175, 1, 0.007843138, 0, 1,
-3.043631, 1.685659, -0.4302224, 1, 0.01176471, 0, 1,
-3.016251, 0.2152079, -2.168132, 1, 0.01960784, 0, 1,
-2.914075, 1.092269, -2.584322, 1, 0.02352941, 0, 1,
-2.907032, 2.694847, -2.48547, 1, 0.03137255, 0, 1,
-2.752707, -0.1226251, -1.723867, 1, 0.03529412, 0, 1,
-2.66287, -0.6326338, -0.4751629, 1, 0.04313726, 0, 1,
-2.596768, -0.1616262, -1.776026, 1, 0.04705882, 0, 1,
-2.506905, -2.214378, -3.59758, 1, 0.05490196, 0, 1,
-2.428099, 0.9537928, -1.026354, 1, 0.05882353, 0, 1,
-2.409653, 0.6707681, -0.3069241, 1, 0.06666667, 0, 1,
-2.409027, -1.113586, -3.312229, 1, 0.07058824, 0, 1,
-2.377249, 1.75082, -0.8259675, 1, 0.07843138, 0, 1,
-2.348142, -0.002628886, -0.7840099, 1, 0.08235294, 0, 1,
-2.346389, -1.575952, -0.6992651, 1, 0.09019608, 0, 1,
-2.28136, -1.464043, -1.694861, 1, 0.09411765, 0, 1,
-2.278423, -1.252888, -3.790153, 1, 0.1019608, 0, 1,
-2.271672, -1.282198, -1.929601, 1, 0.1098039, 0, 1,
-2.23419, -0.1325595, -0.02413212, 1, 0.1137255, 0, 1,
-2.223403, -0.1686301, -1.959767, 1, 0.1215686, 0, 1,
-2.222215, 0.6357514, -3.03541, 1, 0.1254902, 0, 1,
-2.216258, 0.4178774, -1.298399, 1, 0.1333333, 0, 1,
-2.193511, -0.1200345, -1.080254, 1, 0.1372549, 0, 1,
-2.160923, -0.6846898, -2.931339, 1, 0.145098, 0, 1,
-2.146206, -0.1303196, -2.722354, 1, 0.1490196, 0, 1,
-2.11911, -0.1199921, -2.440651, 1, 0.1568628, 0, 1,
-2.103201, 0.6102026, -2.337739, 1, 0.1607843, 0, 1,
-2.0655, -0.05464585, -1.326953, 1, 0.1686275, 0, 1,
-2.053316, 0.5925232, 0.6356603, 1, 0.172549, 0, 1,
-2.043643, -1.029997, -1.589299, 1, 0.1803922, 0, 1,
-2.031655, 2.415611, -0.3258407, 1, 0.1843137, 0, 1,
-2.001833, -0.1852347, -1.83217, 1, 0.1921569, 0, 1,
-1.956244, -1.121006, -2.593988, 1, 0.1960784, 0, 1,
-1.955198, 0.567394, -1.497361, 1, 0.2039216, 0, 1,
-1.945578, -1.04935, -3.415003, 1, 0.2117647, 0, 1,
-1.945571, 1.148891, -2.215305, 1, 0.2156863, 0, 1,
-1.901699, 0.2746179, -2.41695, 1, 0.2235294, 0, 1,
-1.89785, 0.5830784, -0.07716149, 1, 0.227451, 0, 1,
-1.89037, -0.9895557, -1.07466, 1, 0.2352941, 0, 1,
-1.890196, 1.757316, -0.8837259, 1, 0.2392157, 0, 1,
-1.889761, -0.6522021, -3.473988, 1, 0.2470588, 0, 1,
-1.882077, -0.6353804, -2.516089, 1, 0.2509804, 0, 1,
-1.87983, -0.5578884, -2.272429, 1, 0.2588235, 0, 1,
-1.842157, -0.2309039, -0.8576624, 1, 0.2627451, 0, 1,
-1.808432, -2.000435, -2.668275, 1, 0.2705882, 0, 1,
-1.795934, 0.5412977, -0.09569278, 1, 0.2745098, 0, 1,
-1.770798, -1.305207, -0.6230696, 1, 0.282353, 0, 1,
-1.762761, -0.2675517, -2.428428, 1, 0.2862745, 0, 1,
-1.762611, 0.1834033, -2.831796, 1, 0.2941177, 0, 1,
-1.759342, -0.5702713, -1.692675, 1, 0.3019608, 0, 1,
-1.751672, -0.9127749, -1.092556, 1, 0.3058824, 0, 1,
-1.748523, -0.4299689, -1.58459, 1, 0.3137255, 0, 1,
-1.743147, 1.270231, -1.533511, 1, 0.3176471, 0, 1,
-1.742565, 0.8120402, -1.978024, 1, 0.3254902, 0, 1,
-1.730752, 1.35699, 0.5479926, 1, 0.3294118, 0, 1,
-1.717286, -0.6143677, -2.04308, 1, 0.3372549, 0, 1,
-1.678151, -0.6406961, -1.820062, 1, 0.3411765, 0, 1,
-1.677473, 0.6218219, -1.021369, 1, 0.3490196, 0, 1,
-1.663063, 0.2792936, -2.898853, 1, 0.3529412, 0, 1,
-1.66134, -1.237989, -1.65304, 1, 0.3607843, 0, 1,
-1.65773, 0.4864487, -0.6384989, 1, 0.3647059, 0, 1,
-1.645843, 0.1915969, 0.04128071, 1, 0.372549, 0, 1,
-1.622731, -1.08074, -2.342987, 1, 0.3764706, 0, 1,
-1.619544, -0.2804656, -1.465237, 1, 0.3843137, 0, 1,
-1.605133, -0.2594835, -0.2090811, 1, 0.3882353, 0, 1,
-1.600916, 0.6023635, -2.146574, 1, 0.3960784, 0, 1,
-1.590589, -0.07688466, -0.7022495, 1, 0.4039216, 0, 1,
-1.583796, -0.5963596, -0.6621948, 1, 0.4078431, 0, 1,
-1.571016, -0.68119, -1.693603, 1, 0.4156863, 0, 1,
-1.564945, 0.6196837, -0.1196554, 1, 0.4196078, 0, 1,
-1.543543, -0.725615, -1.243414, 1, 0.427451, 0, 1,
-1.542922, 0.3043166, -1.634686, 1, 0.4313726, 0, 1,
-1.541137, -1.290097, -2.906826, 1, 0.4392157, 0, 1,
-1.537085, -0.09404098, -2.755774, 1, 0.4431373, 0, 1,
-1.521193, -0.5028196, -1.690816, 1, 0.4509804, 0, 1,
-1.506896, -1.689047, -1.80605, 1, 0.454902, 0, 1,
-1.500041, -0.6356342, -2.390119, 1, 0.4627451, 0, 1,
-1.495439, 1.001052, -1.836574, 1, 0.4666667, 0, 1,
-1.467055, -0.5977834, -0.7692388, 1, 0.4745098, 0, 1,
-1.463251, -0.9675972, -2.378858, 1, 0.4784314, 0, 1,
-1.455552, -0.9165995, -3.568776, 1, 0.4862745, 0, 1,
-1.452845, 0.4915324, -1.804671, 1, 0.4901961, 0, 1,
-1.452511, -0.2845282, -1.705298, 1, 0.4980392, 0, 1,
-1.451941, 1.630574, 0.4608755, 1, 0.5058824, 0, 1,
-1.451352, 1.70888, 0.05979412, 1, 0.509804, 0, 1,
-1.446809, -0.3290024, -0.06630852, 1, 0.5176471, 0, 1,
-1.442832, 0.543368, -0.04146059, 1, 0.5215687, 0, 1,
-1.44036, -1.581234, -4.103781, 1, 0.5294118, 0, 1,
-1.422292, 0.4255421, -0.639781, 1, 0.5333334, 0, 1,
-1.41336, 1.775023, -2.405159, 1, 0.5411765, 0, 1,
-1.394152, -0.759831, -0.154955, 1, 0.5450981, 0, 1,
-1.39356, 1.125884, -0.6700875, 1, 0.5529412, 0, 1,
-1.391961, -0.7217053, -0.9600716, 1, 0.5568628, 0, 1,
-1.383797, 0.06889314, -1.268611, 1, 0.5647059, 0, 1,
-1.377712, 0.5588951, -1.383708, 1, 0.5686275, 0, 1,
-1.373656, -0.8764111, -2.798567, 1, 0.5764706, 0, 1,
-1.369658, 0.1109408, -2.673886, 1, 0.5803922, 0, 1,
-1.360946, -1.398319, -3.639885, 1, 0.5882353, 0, 1,
-1.357633, 0.5746936, -3.245451, 1, 0.5921569, 0, 1,
-1.354898, -0.3720483, -1.370069, 1, 0.6, 0, 1,
-1.340447, -0.009756943, -0.3260605, 1, 0.6078432, 0, 1,
-1.338913, 0.7356879, -1.478058, 1, 0.6117647, 0, 1,
-1.337939, 0.6879187, -1.269488, 1, 0.6196079, 0, 1,
-1.332968, -1.299298, -2.610678, 1, 0.6235294, 0, 1,
-1.323878, 0.5642195, -0.8458902, 1, 0.6313726, 0, 1,
-1.322744, -0.1621222, -1.085312, 1, 0.6352941, 0, 1,
-1.321712, 0.520548, -0.7126574, 1, 0.6431373, 0, 1,
-1.317717, 0.9915007, -1.354455, 1, 0.6470588, 0, 1,
-1.314169, 0.3846594, -2.094211, 1, 0.654902, 0, 1,
-1.312847, 0.5423248, -0.6942736, 1, 0.6588235, 0, 1,
-1.282093, 0.384534, -1.724499, 1, 0.6666667, 0, 1,
-1.280745, -0.7384542, -2.920143, 1, 0.6705883, 0, 1,
-1.275885, -0.8631107, -2.769942, 1, 0.6784314, 0, 1,
-1.270724, -0.6297164, -2.206376, 1, 0.682353, 0, 1,
-1.270083, -1.601775, -2.125911, 1, 0.6901961, 0, 1,
-1.266434, -1.06976, -1.650339, 1, 0.6941177, 0, 1,
-1.263151, 0.204044, 0.5663747, 1, 0.7019608, 0, 1,
-1.25985, -0.7294149, -2.290647, 1, 0.7098039, 0, 1,
-1.248768, -0.1475556, -2.521336, 1, 0.7137255, 0, 1,
-1.245904, 0.2295785, -1.508169, 1, 0.7215686, 0, 1,
-1.230326, 0.9932055, -1.674827, 1, 0.7254902, 0, 1,
-1.228963, -0.1413501, -1.892048, 1, 0.7333333, 0, 1,
-1.228031, 0.8869596, -0.2169149, 1, 0.7372549, 0, 1,
-1.225586, 0.8164346, -1.069176, 1, 0.7450981, 0, 1,
-1.22468, -1.500568, -3.064288, 1, 0.7490196, 0, 1,
-1.204767, 0.4930793, -0.201435, 1, 0.7568628, 0, 1,
-1.20157, 0.7609758, -0.1319972, 1, 0.7607843, 0, 1,
-1.193669, 0.03167498, -0.9564939, 1, 0.7686275, 0, 1,
-1.190299, -0.7528477, -1.125366, 1, 0.772549, 0, 1,
-1.187506, 0.8909816, -1.146516, 1, 0.7803922, 0, 1,
-1.187117, 0.8332196, -0.01441669, 1, 0.7843137, 0, 1,
-1.182901, 0.9918627, -2.139584, 1, 0.7921569, 0, 1,
-1.181078, 1.407003, -1.812377, 1, 0.7960784, 0, 1,
-1.180741, -0.9253192, -1.11932, 1, 0.8039216, 0, 1,
-1.172266, -1.470529, -4.156098, 1, 0.8117647, 0, 1,
-1.166065, 0.4361396, -0.0123536, 1, 0.8156863, 0, 1,
-1.159207, -0.6580964, -1.866324, 1, 0.8235294, 0, 1,
-1.154075, 0.08951794, -0.6058272, 1, 0.827451, 0, 1,
-1.144514, -1.226612, -1.449989, 1, 0.8352941, 0, 1,
-1.1219, 0.005477912, -3.848773, 1, 0.8392157, 0, 1,
-1.121655, 0.8368867, -0.3392838, 1, 0.8470588, 0, 1,
-1.12017, 0.9978708, 0.2970022, 1, 0.8509804, 0, 1,
-1.114959, 0.4162944, -2.569467, 1, 0.8588235, 0, 1,
-1.109673, 0.4331823, 0.08880873, 1, 0.8627451, 0, 1,
-1.109485, -0.1094661, -1.786811, 1, 0.8705882, 0, 1,
-1.100844, 0.439813, -2.837205, 1, 0.8745098, 0, 1,
-1.087636, 0.3521699, -1.224289, 1, 0.8823529, 0, 1,
-1.086171, 2.040592, -1.108356, 1, 0.8862745, 0, 1,
-1.083583, -0.3037109, -0.7230054, 1, 0.8941177, 0, 1,
-1.083469, 0.8510292, -2.401064, 1, 0.8980392, 0, 1,
-1.083081, 0.9874615, -1.075783, 1, 0.9058824, 0, 1,
-1.070974, -0.612653, -2.073701, 1, 0.9137255, 0, 1,
-1.066494, -1.685927, -3.134148, 1, 0.9176471, 0, 1,
-1.058475, 1.447758, -0.8504436, 1, 0.9254902, 0, 1,
-1.049775, 2.376211, 1.392763, 1, 0.9294118, 0, 1,
-1.046436, 0.0883757, -1.93897, 1, 0.9372549, 0, 1,
-1.036429, 0.3604817, -1.980895, 1, 0.9411765, 0, 1,
-1.027089, -1.287048, -2.400887, 1, 0.9490196, 0, 1,
-1.022055, 0.3134516, -1.586413, 1, 0.9529412, 0, 1,
-1.019781, 0.5132025, 0.3187257, 1, 0.9607843, 0, 1,
-1.01934, 0.222795, -1.24391, 1, 0.9647059, 0, 1,
-1.014318, -0.9419591, -2.353886, 1, 0.972549, 0, 1,
-1.010611, 0.3306783, -0.7989329, 1, 0.9764706, 0, 1,
-0.998388, -0.0609141, -0.2056152, 1, 0.9843137, 0, 1,
-0.9957642, -0.9143813, -3.301234, 1, 0.9882353, 0, 1,
-0.9954708, -1.122154, -2.575076, 1, 0.9960784, 0, 1,
-0.9891788, 1.387404, -0.8652962, 0.9960784, 1, 0, 1,
-0.9836699, -0.1816778, -2.588274, 0.9921569, 1, 0, 1,
-0.9830424, 1.124979, -0.6505108, 0.9843137, 1, 0, 1,
-0.9815323, 0.2921759, 0.03816834, 0.9803922, 1, 0, 1,
-0.9806447, 0.3047383, -0.8808234, 0.972549, 1, 0, 1,
-0.9794988, -0.9701292, -2.207989, 0.9686275, 1, 0, 1,
-0.978794, -1.065391, -1.098727, 0.9607843, 1, 0, 1,
-0.9646819, 0.6832077, -1.848261, 0.9568627, 1, 0, 1,
-0.9637251, -1.158207, -3.498342, 0.9490196, 1, 0, 1,
-0.9635412, 0.4920937, -1.121083, 0.945098, 1, 0, 1,
-0.9627457, -1.390657, -2.242491, 0.9372549, 1, 0, 1,
-0.9571471, -0.1230228, -0.9231012, 0.9333333, 1, 0, 1,
-0.95285, -0.6611205, -1.220777, 0.9254902, 1, 0, 1,
-0.9451616, 0.2918452, -0.2521811, 0.9215686, 1, 0, 1,
-0.9324394, 1.387661, -1.247414, 0.9137255, 1, 0, 1,
-0.9322757, 0.5741973, -0.7603486, 0.9098039, 1, 0, 1,
-0.9300868, -0.2726166, -0.9934745, 0.9019608, 1, 0, 1,
-0.9289992, -0.1113392, -0.2966175, 0.8941177, 1, 0, 1,
-0.927, -0.05092155, -3.974972, 0.8901961, 1, 0, 1,
-0.9253367, -0.03793845, -2.181352, 0.8823529, 1, 0, 1,
-0.9178682, 0.2117685, -0.636507, 0.8784314, 1, 0, 1,
-0.915979, 0.5347525, -0.814137, 0.8705882, 1, 0, 1,
-0.9062125, 0.04539814, 0.1751342, 0.8666667, 1, 0, 1,
-0.8979274, 0.6597784, -2.30598, 0.8588235, 1, 0, 1,
-0.8976409, -0.684275, -2.753798, 0.854902, 1, 0, 1,
-0.897405, 0.7312412, -1.879775, 0.8470588, 1, 0, 1,
-0.8889611, 0.1938765, -2.115714, 0.8431373, 1, 0, 1,
-0.8824775, -0.4234256, -1.474073, 0.8352941, 1, 0, 1,
-0.8814166, -0.5916442, -3.555271, 0.8313726, 1, 0, 1,
-0.8795712, -0.05472362, -0.4549508, 0.8235294, 1, 0, 1,
-0.8781949, 0.8317825, -0.816511, 0.8196079, 1, 0, 1,
-0.8758975, 0.9513612, -1.103184, 0.8117647, 1, 0, 1,
-0.8669345, 0.07046889, -2.684527, 0.8078431, 1, 0, 1,
-0.8645552, 0.7470222, 1.273359, 0.8, 1, 0, 1,
-0.8535241, -0.7972292, -1.761547, 0.7921569, 1, 0, 1,
-0.8526602, -0.8946866, -1.50292, 0.7882353, 1, 0, 1,
-0.8506243, 1.917965, 0.4513254, 0.7803922, 1, 0, 1,
-0.8502951, -0.759187, -2.168316, 0.7764706, 1, 0, 1,
-0.8401296, -1.685975, -3.782132, 0.7686275, 1, 0, 1,
-0.8388907, 0.6603677, -0.4372412, 0.7647059, 1, 0, 1,
-0.8368676, 0.6948693, -0.8946379, 0.7568628, 1, 0, 1,
-0.8299718, -0.1048378, -3.48036, 0.7529412, 1, 0, 1,
-0.8191624, 0.9808992, -0.6138078, 0.7450981, 1, 0, 1,
-0.811699, -0.2332501, -0.8669739, 0.7411765, 1, 0, 1,
-0.8057353, 1.069295, -1.014443, 0.7333333, 1, 0, 1,
-0.8048745, 0.113493, -1.568824, 0.7294118, 1, 0, 1,
-0.8046736, -0.5770661, -3.378958, 0.7215686, 1, 0, 1,
-0.8039686, 0.6747226, -0.8200871, 0.7176471, 1, 0, 1,
-0.7956564, -0.02486679, -2.357264, 0.7098039, 1, 0, 1,
-0.794131, -0.1143867, 0.1583496, 0.7058824, 1, 0, 1,
-0.7842722, -1.415002, -3.963582, 0.6980392, 1, 0, 1,
-0.7764108, -0.569128, -1.523807, 0.6901961, 1, 0, 1,
-0.7756905, 0.03629223, -0.3482753, 0.6862745, 1, 0, 1,
-0.7735498, -0.09400651, -1.768624, 0.6784314, 1, 0, 1,
-0.7643209, 0.06816035, -1.239735, 0.6745098, 1, 0, 1,
-0.7620115, -0.2681348, -2.809394, 0.6666667, 1, 0, 1,
-0.7606515, 0.4250483, -2.870066, 0.6627451, 1, 0, 1,
-0.7575393, 0.9331002, -0.5978459, 0.654902, 1, 0, 1,
-0.7574646, 0.8190176, -0.7955763, 0.6509804, 1, 0, 1,
-0.7532297, -0.509789, -1.393194, 0.6431373, 1, 0, 1,
-0.7497179, 0.1066007, -2.230595, 0.6392157, 1, 0, 1,
-0.7478257, -0.03373368, -2.366298, 0.6313726, 1, 0, 1,
-0.7459038, -0.3385316, -1.734025, 0.627451, 1, 0, 1,
-0.7400897, 0.94961, -1.223653, 0.6196079, 1, 0, 1,
-0.7367949, 0.05246144, -2.89167, 0.6156863, 1, 0, 1,
-0.7358019, -0.9101157, -2.740961, 0.6078432, 1, 0, 1,
-0.7346454, 2.38817, -0.9149612, 0.6039216, 1, 0, 1,
-0.7341795, 1.845379, -0.989608, 0.5960785, 1, 0, 1,
-0.7337873, 0.5551541, -1.004871, 0.5882353, 1, 0, 1,
-0.7286441, 0.1020886, -3.766639, 0.5843138, 1, 0, 1,
-0.724344, -1.228144, -2.343446, 0.5764706, 1, 0, 1,
-0.7161367, 0.0603235, -2.446489, 0.572549, 1, 0, 1,
-0.7153729, 0.2348709, 0.3924171, 0.5647059, 1, 0, 1,
-0.70893, 0.2520096, -1.651641, 0.5607843, 1, 0, 1,
-0.702145, -0.8630686, -3.418299, 0.5529412, 1, 0, 1,
-0.6988986, -0.7852911, -2.618811, 0.5490196, 1, 0, 1,
-0.6967059, -0.4538754, -1.057608, 0.5411765, 1, 0, 1,
-0.6902366, -0.700594, -1.580177, 0.5372549, 1, 0, 1,
-0.6884684, -0.8428686, -2.573796, 0.5294118, 1, 0, 1,
-0.6880277, -0.8617623, -2.395947, 0.5254902, 1, 0, 1,
-0.687219, 1.548313, -2.252482, 0.5176471, 1, 0, 1,
-0.6869912, 0.1898407, -0.2772183, 0.5137255, 1, 0, 1,
-0.68446, 0.1630581, -0.8802732, 0.5058824, 1, 0, 1,
-0.6790219, 0.957559, -0.06835791, 0.5019608, 1, 0, 1,
-0.6725796, 0.9756977, -0.3176221, 0.4941176, 1, 0, 1,
-0.6686584, 1.031409, -0.6438279, 0.4862745, 1, 0, 1,
-0.6686065, 1.281895, -0.7501308, 0.4823529, 1, 0, 1,
-0.6676192, 1.89031, -0.08993319, 0.4745098, 1, 0, 1,
-0.6664669, 0.9938196, 0.8271, 0.4705882, 1, 0, 1,
-0.6636295, 0.3513845, -0.6269559, 0.4627451, 1, 0, 1,
-0.6574671, 0.7694008, 0.7636137, 0.4588235, 1, 0, 1,
-0.6477069, -0.5699672, -2.032526, 0.4509804, 1, 0, 1,
-0.6476622, 0.02328833, -0.9481452, 0.4470588, 1, 0, 1,
-0.6436818, 1.025695, -0.4478886, 0.4392157, 1, 0, 1,
-0.6431297, -0.5418736, -1.160765, 0.4352941, 1, 0, 1,
-0.6395243, 0.6554429, 0.7009022, 0.427451, 1, 0, 1,
-0.6325871, 0.4570336, 0.1416783, 0.4235294, 1, 0, 1,
-0.632301, -2.093749, -3.292959, 0.4156863, 1, 0, 1,
-0.6229579, 1.734212, 0.01483209, 0.4117647, 1, 0, 1,
-0.6213239, 0.3463001, -1.136651, 0.4039216, 1, 0, 1,
-0.6201754, -0.3981434, -1.862531, 0.3960784, 1, 0, 1,
-0.6152355, 0.5717131, 0.3820509, 0.3921569, 1, 0, 1,
-0.6134616, 0.2787497, -0.3089859, 0.3843137, 1, 0, 1,
-0.6055335, -0.4389812, -3.084508, 0.3803922, 1, 0, 1,
-0.6032018, -2.116544, -3.28916, 0.372549, 1, 0, 1,
-0.6031204, 0.3048742, -0.3885165, 0.3686275, 1, 0, 1,
-0.6019897, 0.1081501, -0.950591, 0.3607843, 1, 0, 1,
-0.5969028, 1.269692, -1.832077, 0.3568628, 1, 0, 1,
-0.5896615, 0.1997295, -0.3122658, 0.3490196, 1, 0, 1,
-0.5877708, -1.09695, -1.848421, 0.345098, 1, 0, 1,
-0.5853276, 0.8545271, -0.6665499, 0.3372549, 1, 0, 1,
-0.5845043, -0.1181408, -2.027946, 0.3333333, 1, 0, 1,
-0.58395, 0.02740102, -1.061486, 0.3254902, 1, 0, 1,
-0.5743355, 0.5154136, -0.3120876, 0.3215686, 1, 0, 1,
-0.5732142, 0.2633808, -3.504748, 0.3137255, 1, 0, 1,
-0.572153, 0.4516062, -0.6521726, 0.3098039, 1, 0, 1,
-0.5703936, 0.3027151, -0.8501221, 0.3019608, 1, 0, 1,
-0.5661637, 1.101555, 0.1462693, 0.2941177, 1, 0, 1,
-0.5660409, 0.6726919, -0.5062315, 0.2901961, 1, 0, 1,
-0.5632679, 1.34387, -1.201829, 0.282353, 1, 0, 1,
-0.5616634, -1.337178, -2.962362, 0.2784314, 1, 0, 1,
-0.5553884, -0.09756103, -1.390363, 0.2705882, 1, 0, 1,
-0.5534856, -0.9781388, -0.2213514, 0.2666667, 1, 0, 1,
-0.5527412, -0.3061366, -3.801061, 0.2588235, 1, 0, 1,
-0.5523514, -0.4123161, -2.000839, 0.254902, 1, 0, 1,
-0.5444813, -1.594847, -2.89459, 0.2470588, 1, 0, 1,
-0.5426935, 1.007711, -1.865528, 0.2431373, 1, 0, 1,
-0.5422658, -0.7137377, -3.747136, 0.2352941, 1, 0, 1,
-0.5350851, -1.92225, -0.8830768, 0.2313726, 1, 0, 1,
-0.5326284, -0.01210759, -1.177813, 0.2235294, 1, 0, 1,
-0.5300832, 1.003595, 0.6543144, 0.2196078, 1, 0, 1,
-0.5253971, 0.923418, -0.3426509, 0.2117647, 1, 0, 1,
-0.5198115, -1.307697, -1.94, 0.2078431, 1, 0, 1,
-0.5128042, 0.3541316, -1.93468, 0.2, 1, 0, 1,
-0.5110027, 0.1403647, -0.4648888, 0.1921569, 1, 0, 1,
-0.5103472, -0.617594, -1.81351, 0.1882353, 1, 0, 1,
-0.5082439, 0.4226229, -2.465012, 0.1803922, 1, 0, 1,
-0.5066788, -0.9783373, -3.221054, 0.1764706, 1, 0, 1,
-0.5042019, -1.148938, -1.95476, 0.1686275, 1, 0, 1,
-0.5039269, -1.463117, -2.733236, 0.1647059, 1, 0, 1,
-0.5014711, 0.5307366, 0.1436251, 0.1568628, 1, 0, 1,
-0.4990734, 0.026003, -1.81229, 0.1529412, 1, 0, 1,
-0.4976428, 0.6554055, -0.8195605, 0.145098, 1, 0, 1,
-0.4955975, -0.8966406, -2.940953, 0.1411765, 1, 0, 1,
-0.4948176, 0.1619307, -1.945457, 0.1333333, 1, 0, 1,
-0.4946567, -0.7749428, -2.007311, 0.1294118, 1, 0, 1,
-0.4920804, -0.04870978, -1.988806, 0.1215686, 1, 0, 1,
-0.4897027, 0.1329461, 0.1294314, 0.1176471, 1, 0, 1,
-0.4888028, -0.2109939, -3.426737, 0.1098039, 1, 0, 1,
-0.484816, -1.069689, -3.967408, 0.1058824, 1, 0, 1,
-0.4844988, -0.1405087, 0.4761316, 0.09803922, 1, 0, 1,
-0.481925, -0.7729248, -2.735136, 0.09019608, 1, 0, 1,
-0.4805987, -2.330911, -2.759266, 0.08627451, 1, 0, 1,
-0.4768625, 0.05543379, -1.751304, 0.07843138, 1, 0, 1,
-0.4741734, 1.222795, -0.1589874, 0.07450981, 1, 0, 1,
-0.4696351, 0.4877821, -1.489858, 0.06666667, 1, 0, 1,
-0.4683723, -1.006686, -2.261869, 0.0627451, 1, 0, 1,
-0.4674817, -0.7742227, -3.081889, 0.05490196, 1, 0, 1,
-0.4670666, -0.3115444, -2.349861, 0.05098039, 1, 0, 1,
-0.4668193, 1.066723, 0.5080911, 0.04313726, 1, 0, 1,
-0.4655496, 1.999295, 0.03761921, 0.03921569, 1, 0, 1,
-0.4582211, 0.4310097, 0.8451042, 0.03137255, 1, 0, 1,
-0.4562668, 0.2727261, -1.234653, 0.02745098, 1, 0, 1,
-0.4536709, -0.7302641, -3.060419, 0.01960784, 1, 0, 1,
-0.4514574, -1.636302, -4.017376, 0.01568628, 1, 0, 1,
-0.4506906, 0.05861271, -2.071941, 0.007843138, 1, 0, 1,
-0.4469314, 1.647313, -0.3216979, 0.003921569, 1, 0, 1,
-0.4416764, -1.528399, -4.757977, 0, 1, 0.003921569, 1,
-0.4340494, -0.661047, -2.814899, 0, 1, 0.01176471, 1,
-0.4312457, -0.3374009, -4.95433, 0, 1, 0.01568628, 1,
-0.4294119, 0.2322714, -1.850899, 0, 1, 0.02352941, 1,
-0.4278702, -1.370891, -2.274314, 0, 1, 0.02745098, 1,
-0.4230053, 0.06545687, -1.626456, 0, 1, 0.03529412, 1,
-0.4197746, -0.7046866, -1.105158, 0, 1, 0.03921569, 1,
-0.4180803, 0.3604176, -0.9463298, 0, 1, 0.04705882, 1,
-0.4123964, 0.6684949, -2.050777, 0, 1, 0.05098039, 1,
-0.4120476, 0.3162163, 0.03547699, 0, 1, 0.05882353, 1,
-0.4092966, 0.4166257, -3.50429, 0, 1, 0.0627451, 1,
-0.4084374, 0.7718451, -1.353141, 0, 1, 0.07058824, 1,
-0.407216, 1.613017, -1.071442, 0, 1, 0.07450981, 1,
-0.397973, 0.8849813, -1.201854, 0, 1, 0.08235294, 1,
-0.3962649, 0.5595341, -0.3343045, 0, 1, 0.08627451, 1,
-0.3959334, -0.209479, -1.831098, 0, 1, 0.09411765, 1,
-0.3945518, -0.6517585, -1.273392, 0, 1, 0.1019608, 1,
-0.3872647, -0.7011735, -1.493792, 0, 1, 0.1058824, 1,
-0.386337, -1.035999, -2.588511, 0, 1, 0.1137255, 1,
-0.3861235, 0.2414477, -0.4883766, 0, 1, 0.1176471, 1,
-0.3852703, 0.2495874, -2.181284, 0, 1, 0.1254902, 1,
-0.3786807, -0.8175598, -2.286183, 0, 1, 0.1294118, 1,
-0.3781691, -0.2742126, -1.873727, 0, 1, 0.1372549, 1,
-0.3746825, -0.6459523, -2.617966, 0, 1, 0.1411765, 1,
-0.370959, 0.4540644, -0.5615572, 0, 1, 0.1490196, 1,
-0.3708622, -0.6237984, -1.95728, 0, 1, 0.1529412, 1,
-0.3696005, -1.035755, -2.615303, 0, 1, 0.1607843, 1,
-0.3695869, 0.6699587, -1.009019, 0, 1, 0.1647059, 1,
-0.3665565, -1.894987, -1.906851, 0, 1, 0.172549, 1,
-0.3644969, 1.245858, -2.01075, 0, 1, 0.1764706, 1,
-0.3644311, -1.62522, -3.876126, 0, 1, 0.1843137, 1,
-0.360777, -0.9849193, -2.907872, 0, 1, 0.1882353, 1,
-0.3602076, -0.9919058, -3.185209, 0, 1, 0.1960784, 1,
-0.3547664, 0.9373116, -0.8474795, 0, 1, 0.2039216, 1,
-0.3472978, 0.5240161, -2.455031, 0, 1, 0.2078431, 1,
-0.3443367, -0.8014309, -3.906945, 0, 1, 0.2156863, 1,
-0.3375151, 0.5334472, -0.4381966, 0, 1, 0.2196078, 1,
-0.332598, -0.1909817, -2.113868, 0, 1, 0.227451, 1,
-0.3304603, -1.026487, -3.875779, 0, 1, 0.2313726, 1,
-0.3257648, 0.7641295, -1.293918, 0, 1, 0.2392157, 1,
-0.3245434, 0.4962229, -0.4369714, 0, 1, 0.2431373, 1,
-0.3160701, -0.5389122, -2.222243, 0, 1, 0.2509804, 1,
-0.3031577, 0.9128092, -0.178326, 0, 1, 0.254902, 1,
-0.2995901, 0.4903814, -2.309321, 0, 1, 0.2627451, 1,
-0.2993541, -1.740658, -2.637605, 0, 1, 0.2666667, 1,
-0.2951526, -0.6868836, -0.5190916, 0, 1, 0.2745098, 1,
-0.2938988, 0.03048871, -1.211774, 0, 1, 0.2784314, 1,
-0.2915906, 0.1624513, -2.409038, 0, 1, 0.2862745, 1,
-0.2866791, 0.02435549, -1.621079, 0, 1, 0.2901961, 1,
-0.2854291, 0.09017375, -1.990738, 0, 1, 0.2980392, 1,
-0.2853577, -0.1721131, -1.714373, 0, 1, 0.3058824, 1,
-0.2852693, 1.165944, 0.1571554, 0, 1, 0.3098039, 1,
-0.2773907, 0.06919511, -1.044481, 0, 1, 0.3176471, 1,
-0.2731467, -0.5297697, -4.002488, 0, 1, 0.3215686, 1,
-0.272649, -1.090565, -3.320062, 0, 1, 0.3294118, 1,
-0.2723938, -0.4857984, -2.437251, 0, 1, 0.3333333, 1,
-0.2691135, 1.099301, 0.3471867, 0, 1, 0.3411765, 1,
-0.2677556, 0.9156626, 0.5421317, 0, 1, 0.345098, 1,
-0.2671734, 1.073512, -0.6084059, 0, 1, 0.3529412, 1,
-0.2656162, -0.3238814, -2.629543, 0, 1, 0.3568628, 1,
-0.2627924, -1.284856, -0.651158, 0, 1, 0.3647059, 1,
-0.2627668, 2.089417, -0.355097, 0, 1, 0.3686275, 1,
-0.2618474, -1.062035, -4.505146, 0, 1, 0.3764706, 1,
-0.2569983, -0.1357536, -2.245379, 0, 1, 0.3803922, 1,
-0.2532953, 0.873313, -2.39117, 0, 1, 0.3882353, 1,
-0.2528143, 0.05773557, -1.232849, 0, 1, 0.3921569, 1,
-0.2518356, 1.32622, -0.5659354, 0, 1, 0.4, 1,
-0.251389, -1.656496, -3.217434, 0, 1, 0.4078431, 1,
-0.2510702, -0.4254768, 0.380393, 0, 1, 0.4117647, 1,
-0.2467081, 0.04589403, -3.014791, 0, 1, 0.4196078, 1,
-0.2460864, -2.026809, -0.7889416, 0, 1, 0.4235294, 1,
-0.242706, 1.003715, 0.9358439, 0, 1, 0.4313726, 1,
-0.2424116, -0.5744578, -1.317636, 0, 1, 0.4352941, 1,
-0.2421528, 0.8080657, -1.217202, 0, 1, 0.4431373, 1,
-0.2404786, -0.8429798, -3.791401, 0, 1, 0.4470588, 1,
-0.2401252, -1.200498, -3.012934, 0, 1, 0.454902, 1,
-0.2385048, -2.421502, -2.319991, 0, 1, 0.4588235, 1,
-0.2368329, -0.9583737, -2.923276, 0, 1, 0.4666667, 1,
-0.2335122, -0.8053786, -3.137168, 0, 1, 0.4705882, 1,
-0.2305853, -0.2209093, -2.469755, 0, 1, 0.4784314, 1,
-0.2303125, 0.1389153, -0.1146209, 0, 1, 0.4823529, 1,
-0.228153, -0.7341726, -2.650182, 0, 1, 0.4901961, 1,
-0.2277801, 0.560307, -0.2371874, 0, 1, 0.4941176, 1,
-0.226175, -0.2487336, -2.19736, 0, 1, 0.5019608, 1,
-0.2259567, 0.9796205, -0.09472963, 0, 1, 0.509804, 1,
-0.2246783, -0.3617399, -2.297779, 0, 1, 0.5137255, 1,
-0.2220305, 1.5168, 1.449934, 0, 1, 0.5215687, 1,
-0.2162227, 0.219573, -0.01121986, 0, 1, 0.5254902, 1,
-0.2128767, 1.362902, -0.7587458, 0, 1, 0.5333334, 1,
-0.2114012, -0.3203078, -2.711812, 0, 1, 0.5372549, 1,
-0.2105162, 1.06267, 0.3877573, 0, 1, 0.5450981, 1,
-0.2096182, 0.1979586, 0.3488651, 0, 1, 0.5490196, 1,
-0.2067765, 0.8972949, -1.13349, 0, 1, 0.5568628, 1,
-0.2017199, 0.4423635, -0.6408374, 0, 1, 0.5607843, 1,
-0.1943984, -1.01094, -2.328816, 0, 1, 0.5686275, 1,
-0.1923669, -1.280468, -3.656563, 0, 1, 0.572549, 1,
-0.1919936, 1.482653, 1.262963, 0, 1, 0.5803922, 1,
-0.1822466, 1.226975, -1.274155, 0, 1, 0.5843138, 1,
-0.1813984, 1.506667, -0.9468566, 0, 1, 0.5921569, 1,
-0.1799166, -0.9975853, -2.860718, 0, 1, 0.5960785, 1,
-0.1773907, 1.358137, -0.6418914, 0, 1, 0.6039216, 1,
-0.1728497, 0.4690465, -0.1259631, 0, 1, 0.6117647, 1,
-0.1696133, -0.8293494, -0.5988632, 0, 1, 0.6156863, 1,
-0.1687826, -1.690457, -2.391097, 0, 1, 0.6235294, 1,
-0.1683717, 1.354005, -1.677739, 0, 1, 0.627451, 1,
-0.1676913, 0.4992881, -0.7373688, 0, 1, 0.6352941, 1,
-0.1667384, -0.8568714, -3.096035, 0, 1, 0.6392157, 1,
-0.1658751, -0.9157383, -1.433011, 0, 1, 0.6470588, 1,
-0.1644859, 0.09499645, -1.248653, 0, 1, 0.6509804, 1,
-0.1637691, -0.2495508, -4.25878, 0, 1, 0.6588235, 1,
-0.1614457, 1.638979, -0.1133461, 0, 1, 0.6627451, 1,
-0.1609653, 1.477599, -0.3591615, 0, 1, 0.6705883, 1,
-0.1605721, -1.291992, -1.888606, 0, 1, 0.6745098, 1,
-0.1583712, -0.1324148, -1.184728, 0, 1, 0.682353, 1,
-0.1558484, 0.4993249, -0.708168, 0, 1, 0.6862745, 1,
-0.1554235, -1.539891, -1.971933, 0, 1, 0.6941177, 1,
-0.1533424, -0.6667755, -2.324517, 0, 1, 0.7019608, 1,
-0.1489289, 0.03047917, -1.901613, 0, 1, 0.7058824, 1,
-0.1473861, 2.456846, -1.161833, 0, 1, 0.7137255, 1,
-0.1445024, 0.1076142, 0.2901719, 0, 1, 0.7176471, 1,
-0.1418113, 0.9274588, 1.089005, 0, 1, 0.7254902, 1,
-0.1407284, 1.873458, 0.4788294, 0, 1, 0.7294118, 1,
-0.1387167, 0.5704883, 0.05246556, 0, 1, 0.7372549, 1,
-0.1366735, -1.959692, -2.324109, 0, 1, 0.7411765, 1,
-0.1360922, -0.6787863, -2.41225, 0, 1, 0.7490196, 1,
-0.1331523, 0.3958957, 0.5933451, 0, 1, 0.7529412, 1,
-0.1292039, -0.2804498, -2.690282, 0, 1, 0.7607843, 1,
-0.1286386, -1.190328, -4.206113, 0, 1, 0.7647059, 1,
-0.1229804, -0.818566, -1.906275, 0, 1, 0.772549, 1,
-0.1175608, -0.7124381, -4.49333, 0, 1, 0.7764706, 1,
-0.116547, -0.6077027, -3.266073, 0, 1, 0.7843137, 1,
-0.1154982, 0.7182481, -0.7606398, 0, 1, 0.7882353, 1,
-0.1149705, -0.139697, -2.403905, 0, 1, 0.7960784, 1,
-0.1148338, 1.78577, 1.02786, 0, 1, 0.8039216, 1,
-0.1095001, -1.332556, -2.893662, 0, 1, 0.8078431, 1,
-0.1073406, 0.6357294, 0.6778892, 0, 1, 0.8156863, 1,
-0.1072654, -0.3812925, -3.619178, 0, 1, 0.8196079, 1,
-0.1068135, 0.07630099, -2.826286, 0, 1, 0.827451, 1,
-0.1057102, 0.6048645, 0.3350585, 0, 1, 0.8313726, 1,
-0.1009213, -0.03307612, -1.54798, 0, 1, 0.8392157, 1,
-0.09924024, 1.133808, -0.2226777, 0, 1, 0.8431373, 1,
-0.09738141, -1.309865, -3.961746, 0, 1, 0.8509804, 1,
-0.08759844, 0.5961369, 1.34338, 0, 1, 0.854902, 1,
-0.08458327, 0.2768051, 0.7909738, 0, 1, 0.8627451, 1,
-0.07884263, 2.868736, -0.4027921, 0, 1, 0.8666667, 1,
-0.07879893, -1.89891, -4.650237, 0, 1, 0.8745098, 1,
-0.07344357, 0.9299898, -2.585006, 0, 1, 0.8784314, 1,
-0.07054843, -1.195634, -2.242041, 0, 1, 0.8862745, 1,
-0.0666118, 0.4300418, 1.931257, 0, 1, 0.8901961, 1,
-0.0638143, -1.934841, -2.561307, 0, 1, 0.8980392, 1,
-0.06189359, 1.142573, -0.09250824, 0, 1, 0.9058824, 1,
-0.06084136, -0.07680249, -1.088638, 0, 1, 0.9098039, 1,
-0.06064266, 0.09464163, -1.288755, 0, 1, 0.9176471, 1,
-0.06008853, 1.857217, -1.311862, 0, 1, 0.9215686, 1,
-0.05652906, 0.4299161, -0.763503, 0, 1, 0.9294118, 1,
-0.05408012, -0.0516269, -3.006326, 0, 1, 0.9333333, 1,
-0.05042984, 0.8373753, 1.018551, 0, 1, 0.9411765, 1,
-0.04932595, 0.8440403, 1.073629, 0, 1, 0.945098, 1,
-0.04451786, -0.3612499, -2.198624, 0, 1, 0.9529412, 1,
-0.04035663, -1.071659, -3.350027, 0, 1, 0.9568627, 1,
-0.03765877, -1.266866, -3.814392, 0, 1, 0.9647059, 1,
-0.03613642, 0.8123221, 1.072736, 0, 1, 0.9686275, 1,
-0.03559854, 0.09946364, 0.8272387, 0, 1, 0.9764706, 1,
-0.0294771, 0.7969683, 1.363039, 0, 1, 0.9803922, 1,
-0.02866348, -0.1913492, -1.398208, 0, 1, 0.9882353, 1,
-0.02744337, -0.4935529, -2.998865, 0, 1, 0.9921569, 1,
-0.02562225, -0.4617338, -4.867958, 0, 1, 1, 1,
-0.02343819, -1.170735, -3.347085, 0, 0.9921569, 1, 1,
-0.02021988, 1.059608, -0.2663455, 0, 0.9882353, 1, 1,
-0.01899664, -0.8512883, -3.702636, 0, 0.9803922, 1, 1,
-0.01858255, 0.4887317, -0.3228749, 0, 0.9764706, 1, 1,
-0.01627515, 0.1630797, 0.5913215, 0, 0.9686275, 1, 1,
-0.01229706, -0.5913623, -1.499269, 0, 0.9647059, 1, 1,
-0.009245394, 1.462664, 0.7898059, 0, 0.9568627, 1, 1,
-0.002074105, 2.008193, -2.844894, 0, 0.9529412, 1, 1,
-0.001727221, 0.192606, 0.121653, 0, 0.945098, 1, 1,
0.003176997, -0.316511, 2.200228, 0, 0.9411765, 1, 1,
0.005524023, 0.3228425, 1.69126, 0, 0.9333333, 1, 1,
0.006237471, -0.8515143, 2.084928, 0, 0.9294118, 1, 1,
0.009014625, 0.1708399, 0.841419, 0, 0.9215686, 1, 1,
0.01033044, -0.1230055, 2.985453, 0, 0.9176471, 1, 1,
0.01278712, 1.10288, -0.113202, 0, 0.9098039, 1, 1,
0.01619761, 0.4717248, 0.7984294, 0, 0.9058824, 1, 1,
0.01688291, 1.397411, 0.6491721, 0, 0.8980392, 1, 1,
0.01751083, 0.8376169, 0.1569712, 0, 0.8901961, 1, 1,
0.0197941, 1.538392, -0.6491849, 0, 0.8862745, 1, 1,
0.02394219, 1.014659, 0.003701263, 0, 0.8784314, 1, 1,
0.0249652, -1.483762, 3.690066, 0, 0.8745098, 1, 1,
0.02609446, -0.34644, 1.120761, 0, 0.8666667, 1, 1,
0.02731611, 0.4402222, 0.4537621, 0, 0.8627451, 1, 1,
0.02959725, -0.2099306, 3.812761, 0, 0.854902, 1, 1,
0.02984364, 0.7628548, 1.205054, 0, 0.8509804, 1, 1,
0.03359088, 1.800753, 0.7976702, 0, 0.8431373, 1, 1,
0.03405444, -0.726068, 3.021396, 0, 0.8392157, 1, 1,
0.0384596, -0.9596152, 2.590356, 0, 0.8313726, 1, 1,
0.03950693, -0.916898, 2.137398, 0, 0.827451, 1, 1,
0.04027314, -1.01494, 3.166205, 0, 0.8196079, 1, 1,
0.04197881, 0.7872627, 0.1792233, 0, 0.8156863, 1, 1,
0.0421222, 0.003439446, 1.994089, 0, 0.8078431, 1, 1,
0.04607335, 0.6283555, -0.08978141, 0, 0.8039216, 1, 1,
0.0466125, 1.35194, -1.256539, 0, 0.7960784, 1, 1,
0.04828561, -1.098131, 3.233497, 0, 0.7882353, 1, 1,
0.04862268, 1.079359, 1.399266, 0, 0.7843137, 1, 1,
0.05149515, 1.502923, -1.171041, 0, 0.7764706, 1, 1,
0.05219407, 0.8390891, -0.0538627, 0, 0.772549, 1, 1,
0.05238256, 0.5627034, -0.5670308, 0, 0.7647059, 1, 1,
0.0552816, -0.1829608, 3.158377, 0, 0.7607843, 1, 1,
0.06290721, -1.981139, 2.878657, 0, 0.7529412, 1, 1,
0.06731676, -1.701906, 4.598074, 0, 0.7490196, 1, 1,
0.06871197, 0.4431859, -1.031109, 0, 0.7411765, 1, 1,
0.07507267, 1.944586, 1.24789, 0, 0.7372549, 1, 1,
0.0841706, -1.483907, 1.555814, 0, 0.7294118, 1, 1,
0.08457751, 0.68762, 0.07033396, 0, 0.7254902, 1, 1,
0.08689289, -0.866062, 3.673448, 0, 0.7176471, 1, 1,
0.08969116, 0.03384432, 0.2549707, 0, 0.7137255, 1, 1,
0.09598385, -1.354321, 3.439356, 0, 0.7058824, 1, 1,
0.09604871, 0.1131694, 0.1828174, 0, 0.6980392, 1, 1,
0.09753992, -0.7402443, 2.349064, 0, 0.6941177, 1, 1,
0.101224, -0.5311605, 3.587621, 0, 0.6862745, 1, 1,
0.1036238, -0.4069034, 3.532788, 0, 0.682353, 1, 1,
0.1062542, -0.9759676, 2.157151, 0, 0.6745098, 1, 1,
0.1091258, -0.8749781, 3.201953, 0, 0.6705883, 1, 1,
0.1174367, -1.366612, 2.128066, 0, 0.6627451, 1, 1,
0.1220871, -0.4940033, 3.687279, 0, 0.6588235, 1, 1,
0.131791, -0.1295152, 3.008333, 0, 0.6509804, 1, 1,
0.1405615, 0.4510723, -0.8882123, 0, 0.6470588, 1, 1,
0.1444232, 0.4055431, 0.4890583, 0, 0.6392157, 1, 1,
0.1456203, 0.3408477, 0.4952936, 0, 0.6352941, 1, 1,
0.1456939, -2.395319, 3.004216, 0, 0.627451, 1, 1,
0.1490363, -2.043037, 3.123879, 0, 0.6235294, 1, 1,
0.1490791, -2.009123, 3.057512, 0, 0.6156863, 1, 1,
0.1493944, 0.1993199, -1.815949, 0, 0.6117647, 1, 1,
0.1502458, -0.889958, 2.784755, 0, 0.6039216, 1, 1,
0.1506643, 0.1354144, -0.02216578, 0, 0.5960785, 1, 1,
0.1542372, 1.209752, 0.2163945, 0, 0.5921569, 1, 1,
0.156896, 3.087033, -0.02575946, 0, 0.5843138, 1, 1,
0.157052, 0.6195837, -0.1141513, 0, 0.5803922, 1, 1,
0.1581185, -0.2064737, 2.120097, 0, 0.572549, 1, 1,
0.1586796, -0.3521385, 2.130055, 0, 0.5686275, 1, 1,
0.1610419, -0.006346373, 2.772085, 0, 0.5607843, 1, 1,
0.1667908, -1.33426, 4.383655, 0, 0.5568628, 1, 1,
0.1673076, 0.4257978, 2.318006, 0, 0.5490196, 1, 1,
0.1677496, 1.899797, -0.5972984, 0, 0.5450981, 1, 1,
0.1731607, -0.08162823, 2.28229, 0, 0.5372549, 1, 1,
0.1786084, -1.296062, 2.373081, 0, 0.5333334, 1, 1,
0.1790571, -1.080293, 1.716851, 0, 0.5254902, 1, 1,
0.1797487, 0.4522424, 0.3285259, 0, 0.5215687, 1, 1,
0.180797, 0.5310631, 0.4110145, 0, 0.5137255, 1, 1,
0.1808944, -0.5322905, 3.940212, 0, 0.509804, 1, 1,
0.1826017, 0.4383772, 2.261128, 0, 0.5019608, 1, 1,
0.1900394, 0.2474068, 2.481998, 0, 0.4941176, 1, 1,
0.1927796, 0.3874555, -0.74532, 0, 0.4901961, 1, 1,
0.1987766, 0.3426015, 1.306739, 0, 0.4823529, 1, 1,
0.1997862, -1.027981, 3.346919, 0, 0.4784314, 1, 1,
0.2008026, 0.03083169, 1.384866, 0, 0.4705882, 1, 1,
0.201004, -0.8178375, 2.630899, 0, 0.4666667, 1, 1,
0.2033315, 1.033587, 0.1110799, 0, 0.4588235, 1, 1,
0.2049994, -0.889006, 3.74023, 0, 0.454902, 1, 1,
0.2072164, 0.1290961, 2.375948, 0, 0.4470588, 1, 1,
0.2097086, -0.2892196, 3.823415, 0, 0.4431373, 1, 1,
0.2103758, -0.9420081, 2.140141, 0, 0.4352941, 1, 1,
0.2141752, -0.8386069, 2.316226, 0, 0.4313726, 1, 1,
0.2161867, -1.204268, 2.732821, 0, 0.4235294, 1, 1,
0.2163278, -0.587769, 1.877429, 0, 0.4196078, 1, 1,
0.2184358, -0.1629719, 2.434348, 0, 0.4117647, 1, 1,
0.2188409, 1.540942, -1.188961, 0, 0.4078431, 1, 1,
0.2206657, -1.214247, 3.256758, 0, 0.4, 1, 1,
0.223291, -1.382833, 4.655086, 0, 0.3921569, 1, 1,
0.2256754, -0.9728874, 2.886466, 0, 0.3882353, 1, 1,
0.227354, -0.3266355, 1.491454, 0, 0.3803922, 1, 1,
0.2305496, -1.705128, 3.177253, 0, 0.3764706, 1, 1,
0.2310039, -1.043957, 2.221526, 0, 0.3686275, 1, 1,
0.2317244, 1.191055, -1.352484, 0, 0.3647059, 1, 1,
0.2355606, -1.493242, 1.705178, 0, 0.3568628, 1, 1,
0.2374697, -0.8126336, 3.666451, 0, 0.3529412, 1, 1,
0.2387692, 1.211573, 1.444601, 0, 0.345098, 1, 1,
0.2467162, 0.2429839, -0.02930675, 0, 0.3411765, 1, 1,
0.2472706, -2.06418, 3.466384, 0, 0.3333333, 1, 1,
0.2499028, -0.02356235, 1.530235, 0, 0.3294118, 1, 1,
0.2517435, 0.5201988, 0.8858446, 0, 0.3215686, 1, 1,
0.2585791, -0.6993666, 2.940305, 0, 0.3176471, 1, 1,
0.2613107, -0.7808372, 2.763041, 0, 0.3098039, 1, 1,
0.2622766, -0.4320415, 2.320734, 0, 0.3058824, 1, 1,
0.2628471, 1.627808, 1.568721, 0, 0.2980392, 1, 1,
0.263418, -0.2654908, 2.06506, 0, 0.2901961, 1, 1,
0.263492, 0.2065882, 0.7970291, 0, 0.2862745, 1, 1,
0.2685187, -0.1545417, 0.89113, 0, 0.2784314, 1, 1,
0.2777582, -0.6363396, 1.48583, 0, 0.2745098, 1, 1,
0.2811012, -0.331507, 2.898392, 0, 0.2666667, 1, 1,
0.29423, 1.491991, 0.6162419, 0, 0.2627451, 1, 1,
0.2951781, 1.213897, -1.42346, 0, 0.254902, 1, 1,
0.299165, 1.752276, -1.286468, 0, 0.2509804, 1, 1,
0.3073175, 2.353583, -1.246799, 0, 0.2431373, 1, 1,
0.3111756, -0.09892905, 3.680695, 0, 0.2392157, 1, 1,
0.3143412, -0.2716987, 0.852259, 0, 0.2313726, 1, 1,
0.3149088, 0.487295, 3.545664, 0, 0.227451, 1, 1,
0.3156659, 0.6482891, -0.1723519, 0, 0.2196078, 1, 1,
0.3172268, 0.08816513, 1.318871, 0, 0.2156863, 1, 1,
0.318636, 0.9524829, 0.5773432, 0, 0.2078431, 1, 1,
0.3186868, 1.102099, -1.346291, 0, 0.2039216, 1, 1,
0.3190449, 0.7998579, 0.6427321, 0, 0.1960784, 1, 1,
0.3226837, 1.105828, -0.6363428, 0, 0.1882353, 1, 1,
0.323604, 0.0700976, 0.7923325, 0, 0.1843137, 1, 1,
0.3257851, -1.284156, 1.864968, 0, 0.1764706, 1, 1,
0.3264348, -0.7140431, 2.339508, 0, 0.172549, 1, 1,
0.3281451, -0.06807923, 2.381729, 0, 0.1647059, 1, 1,
0.3312292, 0.3240365, 1.182955, 0, 0.1607843, 1, 1,
0.331791, 1.488878, -0.4616014, 0, 0.1529412, 1, 1,
0.3320642, 0.3152643, 1.744045, 0, 0.1490196, 1, 1,
0.3375165, -0.1473342, 1.164001, 0, 0.1411765, 1, 1,
0.3411349, -2.214088, 4.522572, 0, 0.1372549, 1, 1,
0.3429374, 0.8650001, 0.4654502, 0, 0.1294118, 1, 1,
0.3455911, 0.2450669, 0.8673651, 0, 0.1254902, 1, 1,
0.3479652, 0.4106858, -0.3415262, 0, 0.1176471, 1, 1,
0.350302, -2.429788, 2.192386, 0, 0.1137255, 1, 1,
0.3515285, 0.8994091, -2.387707, 0, 0.1058824, 1, 1,
0.3541296, 0.5659408, 1.122407, 0, 0.09803922, 1, 1,
0.3541324, -0.4030273, 4.422068, 0, 0.09411765, 1, 1,
0.3550045, -0.02953939, 1.633116, 0, 0.08627451, 1, 1,
0.3551359, -1.614927, 1.759846, 0, 0.08235294, 1, 1,
0.3559439, 0.9856018, -1.126562, 0, 0.07450981, 1, 1,
0.3599529, -0.8233644, 2.832638, 0, 0.07058824, 1, 1,
0.366643, -0.6602403, 1.122364, 0, 0.0627451, 1, 1,
0.3670495, 1.069416, 1.336681, 0, 0.05882353, 1, 1,
0.3706642, 2.32689, 1.099091, 0, 0.05098039, 1, 1,
0.3710368, 0.4857738, -1.018879, 0, 0.04705882, 1, 1,
0.3716392, 0.01917245, 2.225654, 0, 0.03921569, 1, 1,
0.3725778, -0.1399694, -0.154255, 0, 0.03529412, 1, 1,
0.3747024, 1.12536, -0.4301253, 0, 0.02745098, 1, 1,
0.3904714, 0.4083691, -1.568518, 0, 0.02352941, 1, 1,
0.3911273, 0.205359, -1.060475, 0, 0.01568628, 1, 1,
0.3916851, -0.8860898, 2.637896, 0, 0.01176471, 1, 1,
0.3946831, -0.3673612, 0.7796019, 0, 0.003921569, 1, 1,
0.4036651, -2.735713, 1.368925, 0.003921569, 0, 1, 1,
0.4045808, -0.01661697, 2.296516, 0.007843138, 0, 1, 1,
0.4049819, -0.4930619, 2.913509, 0.01568628, 0, 1, 1,
0.4062132, 0.7358885, 1.055873, 0.01960784, 0, 1, 1,
0.4069869, 0.3313926, -0.429978, 0.02745098, 0, 1, 1,
0.4106304, -0.7071009, 1.256722, 0.03137255, 0, 1, 1,
0.4157892, 0.3387517, -0.2216783, 0.03921569, 0, 1, 1,
0.4183585, -0.1633041, 0.7365747, 0.04313726, 0, 1, 1,
0.4188191, -0.06082597, 1.777505, 0.05098039, 0, 1, 1,
0.4188367, 0.7081807, -1.096569, 0.05490196, 0, 1, 1,
0.4233825, -1.643339, 3.388316, 0.0627451, 0, 1, 1,
0.4236514, -0.056529, 2.400549, 0.06666667, 0, 1, 1,
0.4257249, 2.234337, -0.2793226, 0.07450981, 0, 1, 1,
0.4274998, 1.098975, 0.7599467, 0.07843138, 0, 1, 1,
0.4276816, 0.7687898, 2.587686, 0.08627451, 0, 1, 1,
0.4343124, 0.4918338, 1.104476, 0.09019608, 0, 1, 1,
0.4360806, 0.7138151, 0.9570226, 0.09803922, 0, 1, 1,
0.4375667, 0.1719555, 1.3398, 0.1058824, 0, 1, 1,
0.4452397, 0.2204074, 0.2248324, 0.1098039, 0, 1, 1,
0.4464223, -0.9253045, 2.829341, 0.1176471, 0, 1, 1,
0.4477514, -0.4902395, 3.739275, 0.1215686, 0, 1, 1,
0.4504849, -0.6127839, 2.513401, 0.1294118, 0, 1, 1,
0.451469, 1.07521, 1.247278, 0.1333333, 0, 1, 1,
0.4544749, 0.617698, 0.3903632, 0.1411765, 0, 1, 1,
0.4551268, 1.114694, 0.8931037, 0.145098, 0, 1, 1,
0.4553129, -1.058861, 3.038847, 0.1529412, 0, 1, 1,
0.4601708, -0.06812298, 1.380655, 0.1568628, 0, 1, 1,
0.4642235, -0.7515901, 3.111892, 0.1647059, 0, 1, 1,
0.4648557, 1.207504, -1.084175, 0.1686275, 0, 1, 1,
0.4676321, -1.500353, 4.801582, 0.1764706, 0, 1, 1,
0.4686323, 0.5671867, -0.2740356, 0.1803922, 0, 1, 1,
0.4744734, -1.069952, 2.110386, 0.1882353, 0, 1, 1,
0.476054, -0.7939339, 2.894027, 0.1921569, 0, 1, 1,
0.479583, -0.4327022, 2.773922, 0.2, 0, 1, 1,
0.480559, -0.5225241, 2.638945, 0.2078431, 0, 1, 1,
0.4828227, 1.701416, 0.8229541, 0.2117647, 0, 1, 1,
0.4852029, 1.318238, 1.048057, 0.2196078, 0, 1, 1,
0.4862782, 0.06177951, -0.09953982, 0.2235294, 0, 1, 1,
0.4893434, -0.08125521, 3.484724, 0.2313726, 0, 1, 1,
0.4898034, 0.0999668, 1.142598, 0.2352941, 0, 1, 1,
0.4910265, 0.1132445, 1.811443, 0.2431373, 0, 1, 1,
0.4922616, -1.301278, 3.267277, 0.2470588, 0, 1, 1,
0.4923611, 0.404895, 2.996972, 0.254902, 0, 1, 1,
0.4960802, 1.236644, 1.666188, 0.2588235, 0, 1, 1,
0.5006233, 0.861469, 1.5127, 0.2666667, 0, 1, 1,
0.5018473, -0.5816514, 1.995832, 0.2705882, 0, 1, 1,
0.5179046, -1.110048, 4.319904, 0.2784314, 0, 1, 1,
0.5194278, -0.5743898, 3.358183, 0.282353, 0, 1, 1,
0.520479, -0.5906394, 3.260435, 0.2901961, 0, 1, 1,
0.5209135, -0.1867555, 2.880705, 0.2941177, 0, 1, 1,
0.5246726, 1.643108, -0.8310749, 0.3019608, 0, 1, 1,
0.5252373, 1.311802, -0.7367066, 0.3098039, 0, 1, 1,
0.5259872, 1.497974, 1.609077, 0.3137255, 0, 1, 1,
0.5366858, -1.357662, 1.603049, 0.3215686, 0, 1, 1,
0.5380927, -0.7883568, 0.7781267, 0.3254902, 0, 1, 1,
0.5426839, 0.6409181, 1.343094, 0.3333333, 0, 1, 1,
0.5429493, 0.8414179, -1.14062, 0.3372549, 0, 1, 1,
0.5455013, 0.3355575, 0.2682821, 0.345098, 0, 1, 1,
0.5460189, 0.7672531, 0.8873033, 0.3490196, 0, 1, 1,
0.5491059, 1.269969, 0.7856149, 0.3568628, 0, 1, 1,
0.5513821, 0.1492444, 2.227787, 0.3607843, 0, 1, 1,
0.5515934, 2.300695, 0.935114, 0.3686275, 0, 1, 1,
0.5563647, -0.6865453, 2.207937, 0.372549, 0, 1, 1,
0.557014, -0.9691526, 2.376276, 0.3803922, 0, 1, 1,
0.5589256, -2.245467, 2.483417, 0.3843137, 0, 1, 1,
0.5640248, 0.1299203, 1.790466, 0.3921569, 0, 1, 1,
0.5666335, -1.384679, 2.133171, 0.3960784, 0, 1, 1,
0.5726202, 1.006956, 1.394595, 0.4039216, 0, 1, 1,
0.5758125, 0.3218148, 0.8284704, 0.4117647, 0, 1, 1,
0.5803499, -0.8748954, 1.770643, 0.4156863, 0, 1, 1,
0.5819184, -0.102006, 2.052334, 0.4235294, 0, 1, 1,
0.5822903, -0.6498879, 2.727884, 0.427451, 0, 1, 1,
0.5848508, 0.4816189, 0.7364494, 0.4352941, 0, 1, 1,
0.5863254, -0.4630443, 3.173097, 0.4392157, 0, 1, 1,
0.5872191, -0.006668056, 2.145006, 0.4470588, 0, 1, 1,
0.5909423, -1.486913, 1.984604, 0.4509804, 0, 1, 1,
0.5914608, 0.3330472, -0.5319279, 0.4588235, 0, 1, 1,
0.5924339, 0.3423249, 0.5820212, 0.4627451, 0, 1, 1,
0.5945201, 0.6183645, 0.3118818, 0.4705882, 0, 1, 1,
0.5968013, 2.43825, -0.3264916, 0.4745098, 0, 1, 1,
0.5979956, 0.8049264, 0.1634225, 0.4823529, 0, 1, 1,
0.6005681, -1.02585, 1.2921, 0.4862745, 0, 1, 1,
0.6018292, 1.449302, -1.662603, 0.4941176, 0, 1, 1,
0.6031938, -0.1343468, 2.429096, 0.5019608, 0, 1, 1,
0.6042123, -2.292089, 1.112911, 0.5058824, 0, 1, 1,
0.6076663, 0.1664562, 2.734993, 0.5137255, 0, 1, 1,
0.6093676, 0.4509476, -1.290529, 0.5176471, 0, 1, 1,
0.61041, 0.9069481, 0.7508208, 0.5254902, 0, 1, 1,
0.6116443, -0.08103924, 1.951756, 0.5294118, 0, 1, 1,
0.6124988, 2.325917, -0.7096812, 0.5372549, 0, 1, 1,
0.6191773, -0.6637058, 3.669909, 0.5411765, 0, 1, 1,
0.622416, -0.9037774, 1.215596, 0.5490196, 0, 1, 1,
0.6238915, -0.693419, 1.282719, 0.5529412, 0, 1, 1,
0.6250702, -0.4935399, 2.676709, 0.5607843, 0, 1, 1,
0.6340964, -0.3440129, 2.636337, 0.5647059, 0, 1, 1,
0.6389653, 0.6070483, 2.252268, 0.572549, 0, 1, 1,
0.6398323, 1.767923, 0.8999277, 0.5764706, 0, 1, 1,
0.6475143, -1.140218, 3.718968, 0.5843138, 0, 1, 1,
0.6495309, -0.7454332, 2.670784, 0.5882353, 0, 1, 1,
0.6496187, 0.6539098, 2.791878, 0.5960785, 0, 1, 1,
0.6498472, -0.3682002, 3.405935, 0.6039216, 0, 1, 1,
0.6523406, -0.08042448, 1.553312, 0.6078432, 0, 1, 1,
0.6545966, -0.08588567, -0.5495031, 0.6156863, 0, 1, 1,
0.6603407, 0.8083476, 1.19608, 0.6196079, 0, 1, 1,
0.6619818, -1.141166, 2.678999, 0.627451, 0, 1, 1,
0.6654276, 0.2562889, 0.6863163, 0.6313726, 0, 1, 1,
0.6661993, 0.4824, 0.2164896, 0.6392157, 0, 1, 1,
0.6685345, 0.1622509, 0.8685551, 0.6431373, 0, 1, 1,
0.6759683, -1.178469, 2.908211, 0.6509804, 0, 1, 1,
0.6765062, 0.5773367, 1.864752, 0.654902, 0, 1, 1,
0.6774381, -0.4046232, 3.918047, 0.6627451, 0, 1, 1,
0.6835346, 0.5284187, -0.5509248, 0.6666667, 0, 1, 1,
0.6881104, 1.977272, 0.5462298, 0.6745098, 0, 1, 1,
0.6893529, 1.332874, -0.9551131, 0.6784314, 0, 1, 1,
0.6940387, -0.1698033, 1.637011, 0.6862745, 0, 1, 1,
0.6989018, 0.7419811, 0.5595924, 0.6901961, 0, 1, 1,
0.7031226, 1.306986, 0.6879501, 0.6980392, 0, 1, 1,
0.7083682, 0.4280081, -0.9478549, 0.7058824, 0, 1, 1,
0.7086142, -0.1206327, 2.304748, 0.7098039, 0, 1, 1,
0.713626, 0.06018061, 0.956141, 0.7176471, 0, 1, 1,
0.7149119, -0.2759922, 1.245362, 0.7215686, 0, 1, 1,
0.7152028, 0.4158277, 0.0278145, 0.7294118, 0, 1, 1,
0.7177599, 1.778226, 1.257915, 0.7333333, 0, 1, 1,
0.7261837, -0.4899115, 1.355291, 0.7411765, 0, 1, 1,
0.7278196, 0.9076884, -0.4980208, 0.7450981, 0, 1, 1,
0.7286317, -0.7212514, 2.234602, 0.7529412, 0, 1, 1,
0.731315, 0.9715132, -0.3326609, 0.7568628, 0, 1, 1,
0.7345217, -1.6043, 3.150437, 0.7647059, 0, 1, 1,
0.7367654, -1.007345, 1.886618, 0.7686275, 0, 1, 1,
0.7412058, -0.8558321, 1.1358, 0.7764706, 0, 1, 1,
0.7416029, 0.03481254, 1.596434, 0.7803922, 0, 1, 1,
0.7445543, 0.7275862, 3.043193, 0.7882353, 0, 1, 1,
0.7456835, -0.6711599, 2.678317, 0.7921569, 0, 1, 1,
0.7466929, -1.606797, 2.719964, 0.8, 0, 1, 1,
0.7473884, 0.9915544, 1.649015, 0.8078431, 0, 1, 1,
0.7477723, 0.6903798, 0.9739164, 0.8117647, 0, 1, 1,
0.749831, 1.581993, -1.640033, 0.8196079, 0, 1, 1,
0.7514495, -0.3729863, 2.524754, 0.8235294, 0, 1, 1,
0.7601479, 0.1870323, 0.1328229, 0.8313726, 0, 1, 1,
0.7639049, 0.5856986, 0.2647204, 0.8352941, 0, 1, 1,
0.7703284, -0.8562046, 1.001604, 0.8431373, 0, 1, 1,
0.7751855, 0.02778402, 1.775761, 0.8470588, 0, 1, 1,
0.7804504, -0.6907386, 1.046627, 0.854902, 0, 1, 1,
0.782212, 0.2152773, 2.327946, 0.8588235, 0, 1, 1,
0.7854369, 0.8793268, 0.07722235, 0.8666667, 0, 1, 1,
0.7895788, -1.711043, 1.467561, 0.8705882, 0, 1, 1,
0.7918817, -0.9281521, 2.533948, 0.8784314, 0, 1, 1,
0.8013403, -0.05823067, 0.4081373, 0.8823529, 0, 1, 1,
0.8023344, -1.850693, 0.9129991, 0.8901961, 0, 1, 1,
0.8109353, -0.6155633, 3.441753, 0.8941177, 0, 1, 1,
0.8147301, 0.935006, 1.539426, 0.9019608, 0, 1, 1,
0.8157235, 0.6711249, 0.1920628, 0.9098039, 0, 1, 1,
0.8168463, 1.151485, 1.491797, 0.9137255, 0, 1, 1,
0.822169, 0.6001876, -0.3502591, 0.9215686, 0, 1, 1,
0.8268574, 1.446415, 1.213798, 0.9254902, 0, 1, 1,
0.8353458, -0.3589988, 1.987789, 0.9333333, 0, 1, 1,
0.8358467, -0.5450124, 3.4433, 0.9372549, 0, 1, 1,
0.8388833, -1.224527, 1.020902, 0.945098, 0, 1, 1,
0.8393129, -0.3944654, 0.4433452, 0.9490196, 0, 1, 1,
0.8440426, -0.2406982, 1.887401, 0.9568627, 0, 1, 1,
0.8476521, 0.7509491, 0.5338956, 0.9607843, 0, 1, 1,
0.8477771, 1.044, -0.1588771, 0.9686275, 0, 1, 1,
0.8680273, -0.7883798, 1.569515, 0.972549, 0, 1, 1,
0.8749378, 0.9511724, 1.267819, 0.9803922, 0, 1, 1,
0.8871275, -0.5980319, 3.651607, 0.9843137, 0, 1, 1,
0.8874231, 0.8446269, -0.8857762, 0.9921569, 0, 1, 1,
0.890453, 1.103928, 0.6729466, 0.9960784, 0, 1, 1,
0.8910917, -0.4359533, 3.030882, 1, 0, 0.9960784, 1,
0.8929545, -0.5783218, 1.273921, 1, 0, 0.9882353, 1,
0.8973436, -1.627968, 3.34786, 1, 0, 0.9843137, 1,
0.9002142, -1.364718, 2.232108, 1, 0, 0.9764706, 1,
0.9075561, -0.4869747, 3.331446, 1, 0, 0.972549, 1,
0.9094177, -1.669627, 3.475674, 1, 0, 0.9647059, 1,
0.9125828, 1.32805, -1.384796, 1, 0, 0.9607843, 1,
0.9145129, -1.150968, 2.72005, 1, 0, 0.9529412, 1,
0.9198157, 0.001575426, 1.363637, 1, 0, 0.9490196, 1,
0.9231902, 0.3321728, 1.858309, 1, 0, 0.9411765, 1,
0.9267778, -0.2855365, 1.115057, 1, 0, 0.9372549, 1,
0.9471449, -0.5363646, 2.005015, 1, 0, 0.9294118, 1,
0.9496319, -0.5845243, 1.245171, 1, 0, 0.9254902, 1,
0.9532046, -0.7635686, 0.3419717, 1, 0, 0.9176471, 1,
0.9546844, -0.1532234, 2.309472, 1, 0, 0.9137255, 1,
0.9550167, 0.3047187, 0.2324365, 1, 0, 0.9058824, 1,
0.9571099, 1.736678, 1.184476, 1, 0, 0.9019608, 1,
0.9724318, -0.4889769, 1.969715, 1, 0, 0.8941177, 1,
0.9810755, 2.745103, 1.392286, 1, 0, 0.8862745, 1,
0.9816105, -0.2644669, 3.100763, 1, 0, 0.8823529, 1,
0.9853107, 0.5293093, -0.676126, 1, 0, 0.8745098, 1,
0.9871461, 0.2323109, -0.9016398, 1, 0, 0.8705882, 1,
0.987254, 1.937801, -0.4325762, 1, 0, 0.8627451, 1,
0.9914024, -0.7695207, 0.5372654, 1, 0, 0.8588235, 1,
0.9980181, -0.4658913, 1.894852, 1, 0, 0.8509804, 1,
1.005771, 0.2328551, 0.02236295, 1, 0, 0.8470588, 1,
1.009601, 0.5302764, 2.192429, 1, 0, 0.8392157, 1,
1.016569, 1.880242, -0.7005724, 1, 0, 0.8352941, 1,
1.024178, 1.207521, -0.7341228, 1, 0, 0.827451, 1,
1.029815, 1.355785, -0.9189043, 1, 0, 0.8235294, 1,
1.038673, 0.1967416, 1.916835, 1, 0, 0.8156863, 1,
1.042642, 1.300388, -0.7957889, 1, 0, 0.8117647, 1,
1.052561, 0.1524985, 0.1255196, 1, 0, 0.8039216, 1,
1.062951, -0.1841318, 2.68031, 1, 0, 0.7960784, 1,
1.064587, 1.228477, 1.27275, 1, 0, 0.7921569, 1,
1.081581, 0.1864047, -0.07353026, 1, 0, 0.7843137, 1,
1.089372, -1.954861, 3.351652, 1, 0, 0.7803922, 1,
1.09126, 0.4283981, 1.310494, 1, 0, 0.772549, 1,
1.092885, -0.04198381, 2.656694, 1, 0, 0.7686275, 1,
1.104435, -0.8151336, 1.238797, 1, 0, 0.7607843, 1,
1.107277, -1.808968, 1.477139, 1, 0, 0.7568628, 1,
1.108209, -0.3202194, 3.961475, 1, 0, 0.7490196, 1,
1.113642, 0.255751, 0.5844568, 1, 0, 0.7450981, 1,
1.117337, -0.802603, 1.862568, 1, 0, 0.7372549, 1,
1.122487, -0.4842948, 1.963811, 1, 0, 0.7333333, 1,
1.123427, 0.9273319, 0.1481342, 1, 0, 0.7254902, 1,
1.128477, 0.0368168, 1.89375, 1, 0, 0.7215686, 1,
1.133613, 0.5066416, 1.194593, 1, 0, 0.7137255, 1,
1.144788, -0.3592827, 2.097033, 1, 0, 0.7098039, 1,
1.151111, -0.7829741, 2.436179, 1, 0, 0.7019608, 1,
1.154937, -1.02323, 1.765919, 1, 0, 0.6941177, 1,
1.157977, 1.530581, 2.629784, 1, 0, 0.6901961, 1,
1.159221, -1.221791, 3.024794, 1, 0, 0.682353, 1,
1.160036, 0.4402032, -0.6568292, 1, 0, 0.6784314, 1,
1.166808, -0.1276571, 1.629949, 1, 0, 0.6705883, 1,
1.166936, -0.2361902, 1.147888, 1, 0, 0.6666667, 1,
1.178473, 0.740774, 1.141795, 1, 0, 0.6588235, 1,
1.190294, -0.6632972, 3.9208, 1, 0, 0.654902, 1,
1.195865, -0.2869996, 0.2115668, 1, 0, 0.6470588, 1,
1.196948, 0.6955112, 0.6881749, 1, 0, 0.6431373, 1,
1.204754, -0.1543476, 1.605049, 1, 0, 0.6352941, 1,
1.207108, 0.7114562, 0.4939282, 1, 0, 0.6313726, 1,
1.22038, -1.730598, 3.708195, 1, 0, 0.6235294, 1,
1.221991, -1.342534, 0.8627664, 1, 0, 0.6196079, 1,
1.226984, -1.104204, 1.708263, 1, 0, 0.6117647, 1,
1.229954, 0.4988958, 2.834396, 1, 0, 0.6078432, 1,
1.232055, 1.429066, -1.429158, 1, 0, 0.6, 1,
1.242768, -0.4032407, 2.089249, 1, 0, 0.5921569, 1,
1.254624, -0.487818, 3.394749, 1, 0, 0.5882353, 1,
1.275202, 0.7439572, 0.1089348, 1, 0, 0.5803922, 1,
1.280709, -0.9839768, 3.280916, 1, 0, 0.5764706, 1,
1.284376, -0.3112656, 1.466669, 1, 0, 0.5686275, 1,
1.296815, 0.06647212, 2.029815, 1, 0, 0.5647059, 1,
1.30423, -0.7539383, 1.537179, 1, 0, 0.5568628, 1,
1.310047, -0.8956552, 3.520375, 1, 0, 0.5529412, 1,
1.340214, -1.059047, 3.383694, 1, 0, 0.5450981, 1,
1.34817, -1.332394, 3.514672, 1, 0, 0.5411765, 1,
1.369203, -1.103541, 2.346241, 1, 0, 0.5333334, 1,
1.373007, 1.642679, 0.9804234, 1, 0, 0.5294118, 1,
1.373574, 1.312373, 0.4881035, 1, 0, 0.5215687, 1,
1.378415, -1.273697, 1.768558, 1, 0, 0.5176471, 1,
1.381813, 0.5039763, 2.309243, 1, 0, 0.509804, 1,
1.384613, -0.09674218, 2.514091, 1, 0, 0.5058824, 1,
1.398607, 1.078802, 1.5732, 1, 0, 0.4980392, 1,
1.407619, -0.9661223, 2.238405, 1, 0, 0.4901961, 1,
1.41474, -0.2645298, 2.343423, 1, 0, 0.4862745, 1,
1.423177, 0.6799719, -0.2662552, 1, 0, 0.4784314, 1,
1.426545, 0.1131151, 2.601585, 1, 0, 0.4745098, 1,
1.45044, -0.3330774, 0.8920682, 1, 0, 0.4666667, 1,
1.450538, 1.233441, 1.297111, 1, 0, 0.4627451, 1,
1.455187, 0.7069017, -0.9745938, 1, 0, 0.454902, 1,
1.462792, -0.4988635, 2.660482, 1, 0, 0.4509804, 1,
1.464582, -0.4209072, 3.348984, 1, 0, 0.4431373, 1,
1.470169, 0.5277113, 1.505854, 1, 0, 0.4392157, 1,
1.476435, 2.02793, 0.08402262, 1, 0, 0.4313726, 1,
1.507933, 1.824607, 2.489985, 1, 0, 0.427451, 1,
1.512771, -0.4845427, 1.484689, 1, 0, 0.4196078, 1,
1.521585, -0.9572282, 1.693538, 1, 0, 0.4156863, 1,
1.5234, 0.7589398, 1.186135, 1, 0, 0.4078431, 1,
1.540992, -1.321921, 3.861093, 1, 0, 0.4039216, 1,
1.545249, 1.005407, 1.36254, 1, 0, 0.3960784, 1,
1.553849, -0.2306504, 2.083316, 1, 0, 0.3882353, 1,
1.561206, -1.166855, 2.118398, 1, 0, 0.3843137, 1,
1.608897, 0.6861956, -0.3410741, 1, 0, 0.3764706, 1,
1.618353, -0.3521599, 1.755379, 1, 0, 0.372549, 1,
1.622609, -0.1865033, 0.5476227, 1, 0, 0.3647059, 1,
1.636631, -0.2690305, 1.119411, 1, 0, 0.3607843, 1,
1.643844, 0.6109762, 1.51518, 1, 0, 0.3529412, 1,
1.651119, -1.816984, 2.529173, 1, 0, 0.3490196, 1,
1.654183, 0.7641456, 1.229559, 1, 0, 0.3411765, 1,
1.65912, 1.765074, 0.9418779, 1, 0, 0.3372549, 1,
1.695795, -0.1040005, 2.72595, 1, 0, 0.3294118, 1,
1.702201, 0.06802937, 3.317932, 1, 0, 0.3254902, 1,
1.71965, 0.1761723, 0.4118744, 1, 0, 0.3176471, 1,
1.730777, -1.417239, 3.735811, 1, 0, 0.3137255, 1,
1.751466, -0.5496649, 2.680694, 1, 0, 0.3058824, 1,
1.752556, 0.3002589, -0.4555322, 1, 0, 0.2980392, 1,
1.787324, -0.314833, 1.812609, 1, 0, 0.2941177, 1,
1.78871, -0.3056408, 2.551414, 1, 0, 0.2862745, 1,
1.790906, 0.7349004, 2.669099, 1, 0, 0.282353, 1,
1.791909, 0.9890356, 2.071192, 1, 0, 0.2745098, 1,
1.810224, 0.9027647, 0.1593977, 1, 0, 0.2705882, 1,
1.810365, 1.451476, 1.03464, 1, 0, 0.2627451, 1,
1.815197, -1.106763, 1.97686, 1, 0, 0.2588235, 1,
1.829582, -0.4324899, 4.023818, 1, 0, 0.2509804, 1,
1.831573, -0.487373, 1.790121, 1, 0, 0.2470588, 1,
1.834018, 0.6528424, 1.075967, 1, 0, 0.2392157, 1,
1.884893, 0.2744808, 1.396917, 1, 0, 0.2352941, 1,
1.894322, 1.085944, 2.025949, 1, 0, 0.227451, 1,
1.902711, -0.3745759, 2.602142, 1, 0, 0.2235294, 1,
1.910851, 0.2760432, 1.877045, 1, 0, 0.2156863, 1,
1.911289, 0.6276011, 1.474417, 1, 0, 0.2117647, 1,
1.917567, -0.2059151, 1.072345, 1, 0, 0.2039216, 1,
1.962093, 0.3710659, 1.3393, 1, 0, 0.1960784, 1,
1.968725, 0.1989368, 0.4102376, 1, 0, 0.1921569, 1,
1.968739, 1.024707, 0.499249, 1, 0, 0.1843137, 1,
1.982859, -0.7955924, 0.7883363, 1, 0, 0.1803922, 1,
2.005941, -0.005843237, 1.315477, 1, 0, 0.172549, 1,
2.008789, 1.846111, 0.544253, 1, 0, 0.1686275, 1,
2.016035, 0.3527887, 0.9454949, 1, 0, 0.1607843, 1,
2.019595, -2.090214, 1.919742, 1, 0, 0.1568628, 1,
2.026394, 1.659985, 1.32626, 1, 0, 0.1490196, 1,
2.095597, -0.5048409, 2.220897, 1, 0, 0.145098, 1,
2.118194, -0.3263018, 1.850736, 1, 0, 0.1372549, 1,
2.158742, -0.738198, 3.428495, 1, 0, 0.1333333, 1,
2.162332, -0.7531332, 2.193691, 1, 0, 0.1254902, 1,
2.192315, 0.5193177, 1.854867, 1, 0, 0.1215686, 1,
2.211631, 0.5921433, 0.9491662, 1, 0, 0.1137255, 1,
2.225347, 1.012141, -0.6636857, 1, 0, 0.1098039, 1,
2.245164, 2.392979, 1.108247, 1, 0, 0.1019608, 1,
2.294319, 0.6472769, 0.05520678, 1, 0, 0.09411765, 1,
2.294584, 0.7656876, 0.9519516, 1, 0, 0.09019608, 1,
2.321979, -0.7211949, -0.02359355, 1, 0, 0.08235294, 1,
2.33774, -0.4218532, 2.588, 1, 0, 0.07843138, 1,
2.348199, -2.567464, -1.127569, 1, 0, 0.07058824, 1,
2.37826, -0.6693867, 0.3795811, 1, 0, 0.06666667, 1,
2.432593, 2.093861, -0.3407654, 1, 0, 0.05882353, 1,
2.440299, -1.801546, 1.446829, 1, 0, 0.05490196, 1,
2.504935, 0.7259437, 0.9971506, 1, 0, 0.04705882, 1,
2.520298, 0.1084741, 3.887363, 1, 0, 0.04313726, 1,
2.622201, 0.6718665, 1.966188, 1, 0, 0.03529412, 1,
2.675594, -1.626232, 2.380471, 1, 0, 0.03137255, 1,
2.709708, -1.191313, 2.664316, 1, 0, 0.02352941, 1,
3.010221, -0.4815187, 0.4194818, 1, 0, 0.01960784, 1,
3.162722, -0.1592424, 2.837004, 1, 0, 0.01176471, 1,
3.508662, -0.1155053, 1.569085, 1, 0, 0.007843138, 1
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
0.1333586, -3.722669, -6.607957, 0, -0.5, 0.5, 0.5,
0.1333586, -3.722669, -6.607957, 1, -0.5, 0.5, 0.5,
0.1333586, -3.722669, -6.607957, 1, 1.5, 0.5, 0.5,
0.1333586, -3.722669, -6.607957, 0, 1.5, 0.5, 0.5
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
-4.386173, 0.1756597, -6.607957, 0, -0.5, 0.5, 0.5,
-4.386173, 0.1756597, -6.607957, 1, -0.5, 0.5, 0.5,
-4.386173, 0.1756597, -6.607957, 1, 1.5, 0.5, 0.5,
-4.386173, 0.1756597, -6.607957, 0, 1.5, 0.5, 0.5
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
-4.386173, -3.722669, -0.07637382, 0, -0.5, 0.5, 0.5,
-4.386173, -3.722669, -0.07637382, 1, -0.5, 0.5, 0.5,
-4.386173, -3.722669, -0.07637382, 1, 1.5, 0.5, 0.5,
-4.386173, -3.722669, -0.07637382, 0, 1.5, 0.5, 0.5
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
-3, -2.823055, -5.100668,
3, -2.823055, -5.100668,
-3, -2.823055, -5.100668,
-3, -2.97299, -5.351883,
-2, -2.823055, -5.100668,
-2, -2.97299, -5.351883,
-1, -2.823055, -5.100668,
-1, -2.97299, -5.351883,
0, -2.823055, -5.100668,
0, -2.97299, -5.351883,
1, -2.823055, -5.100668,
1, -2.97299, -5.351883,
2, -2.823055, -5.100668,
2, -2.97299, -5.351883,
3, -2.823055, -5.100668,
3, -2.97299, -5.351883
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
-3, -3.272862, -5.854313, 0, -0.5, 0.5, 0.5,
-3, -3.272862, -5.854313, 1, -0.5, 0.5, 0.5,
-3, -3.272862, -5.854313, 1, 1.5, 0.5, 0.5,
-3, -3.272862, -5.854313, 0, 1.5, 0.5, 0.5,
-2, -3.272862, -5.854313, 0, -0.5, 0.5, 0.5,
-2, -3.272862, -5.854313, 1, -0.5, 0.5, 0.5,
-2, -3.272862, -5.854313, 1, 1.5, 0.5, 0.5,
-2, -3.272862, -5.854313, 0, 1.5, 0.5, 0.5,
-1, -3.272862, -5.854313, 0, -0.5, 0.5, 0.5,
-1, -3.272862, -5.854313, 1, -0.5, 0.5, 0.5,
-1, -3.272862, -5.854313, 1, 1.5, 0.5, 0.5,
-1, -3.272862, -5.854313, 0, 1.5, 0.5, 0.5,
0, -3.272862, -5.854313, 0, -0.5, 0.5, 0.5,
0, -3.272862, -5.854313, 1, -0.5, 0.5, 0.5,
0, -3.272862, -5.854313, 1, 1.5, 0.5, 0.5,
0, -3.272862, -5.854313, 0, 1.5, 0.5, 0.5,
1, -3.272862, -5.854313, 0, -0.5, 0.5, 0.5,
1, -3.272862, -5.854313, 1, -0.5, 0.5, 0.5,
1, -3.272862, -5.854313, 1, 1.5, 0.5, 0.5,
1, -3.272862, -5.854313, 0, 1.5, 0.5, 0.5,
2, -3.272862, -5.854313, 0, -0.5, 0.5, 0.5,
2, -3.272862, -5.854313, 1, -0.5, 0.5, 0.5,
2, -3.272862, -5.854313, 1, 1.5, 0.5, 0.5,
2, -3.272862, -5.854313, 0, 1.5, 0.5, 0.5,
3, -3.272862, -5.854313, 0, -0.5, 0.5, 0.5,
3, -3.272862, -5.854313, 1, -0.5, 0.5, 0.5,
3, -3.272862, -5.854313, 1, 1.5, 0.5, 0.5,
3, -3.272862, -5.854313, 0, 1.5, 0.5, 0.5
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
-3.343204, -2, -5.100668,
-3.343204, 3, -5.100668,
-3.343204, -2, -5.100668,
-3.517032, -2, -5.351883,
-3.343204, -1, -5.100668,
-3.517032, -1, -5.351883,
-3.343204, 0, -5.100668,
-3.517032, 0, -5.351883,
-3.343204, 1, -5.100668,
-3.517032, 1, -5.351883,
-3.343204, 2, -5.100668,
-3.517032, 2, -5.351883,
-3.343204, 3, -5.100668,
-3.517032, 3, -5.351883
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
-3.864689, -2, -5.854313, 0, -0.5, 0.5, 0.5,
-3.864689, -2, -5.854313, 1, -0.5, 0.5, 0.5,
-3.864689, -2, -5.854313, 1, 1.5, 0.5, 0.5,
-3.864689, -2, -5.854313, 0, 1.5, 0.5, 0.5,
-3.864689, -1, -5.854313, 0, -0.5, 0.5, 0.5,
-3.864689, -1, -5.854313, 1, -0.5, 0.5, 0.5,
-3.864689, -1, -5.854313, 1, 1.5, 0.5, 0.5,
-3.864689, -1, -5.854313, 0, 1.5, 0.5, 0.5,
-3.864689, 0, -5.854313, 0, -0.5, 0.5, 0.5,
-3.864689, 0, -5.854313, 1, -0.5, 0.5, 0.5,
-3.864689, 0, -5.854313, 1, 1.5, 0.5, 0.5,
-3.864689, 0, -5.854313, 0, 1.5, 0.5, 0.5,
-3.864689, 1, -5.854313, 0, -0.5, 0.5, 0.5,
-3.864689, 1, -5.854313, 1, -0.5, 0.5, 0.5,
-3.864689, 1, -5.854313, 1, 1.5, 0.5, 0.5,
-3.864689, 1, -5.854313, 0, 1.5, 0.5, 0.5,
-3.864689, 2, -5.854313, 0, -0.5, 0.5, 0.5,
-3.864689, 2, -5.854313, 1, -0.5, 0.5, 0.5,
-3.864689, 2, -5.854313, 1, 1.5, 0.5, 0.5,
-3.864689, 2, -5.854313, 0, 1.5, 0.5, 0.5,
-3.864689, 3, -5.854313, 0, -0.5, 0.5, 0.5,
-3.864689, 3, -5.854313, 1, -0.5, 0.5, 0.5,
-3.864689, 3, -5.854313, 1, 1.5, 0.5, 0.5,
-3.864689, 3, -5.854313, 0, 1.5, 0.5, 0.5
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
-3.343204, -2.823055, -4,
-3.343204, -2.823055, 4,
-3.343204, -2.823055, -4,
-3.517032, -2.97299, -4,
-3.343204, -2.823055, -2,
-3.517032, -2.97299, -2,
-3.343204, -2.823055, 0,
-3.517032, -2.97299, 0,
-3.343204, -2.823055, 2,
-3.517032, -2.97299, 2,
-3.343204, -2.823055, 4,
-3.517032, -2.97299, 4
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
-3.864689, -3.272862, -4, 0, -0.5, 0.5, 0.5,
-3.864689, -3.272862, -4, 1, -0.5, 0.5, 0.5,
-3.864689, -3.272862, -4, 1, 1.5, 0.5, 0.5,
-3.864689, -3.272862, -4, 0, 1.5, 0.5, 0.5,
-3.864689, -3.272862, -2, 0, -0.5, 0.5, 0.5,
-3.864689, -3.272862, -2, 1, -0.5, 0.5, 0.5,
-3.864689, -3.272862, -2, 1, 1.5, 0.5, 0.5,
-3.864689, -3.272862, -2, 0, 1.5, 0.5, 0.5,
-3.864689, -3.272862, 0, 0, -0.5, 0.5, 0.5,
-3.864689, -3.272862, 0, 1, -0.5, 0.5, 0.5,
-3.864689, -3.272862, 0, 1, 1.5, 0.5, 0.5,
-3.864689, -3.272862, 0, 0, 1.5, 0.5, 0.5,
-3.864689, -3.272862, 2, 0, -0.5, 0.5, 0.5,
-3.864689, -3.272862, 2, 1, -0.5, 0.5, 0.5,
-3.864689, -3.272862, 2, 1, 1.5, 0.5, 0.5,
-3.864689, -3.272862, 2, 0, 1.5, 0.5, 0.5,
-3.864689, -3.272862, 4, 0, -0.5, 0.5, 0.5,
-3.864689, -3.272862, 4, 1, -0.5, 0.5, 0.5,
-3.864689, -3.272862, 4, 1, 1.5, 0.5, 0.5,
-3.864689, -3.272862, 4, 0, 1.5, 0.5, 0.5
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
-3.343204, -2.823055, -5.100668,
-3.343204, 3.174374, -5.100668,
-3.343204, -2.823055, 4.947921,
-3.343204, 3.174374, 4.947921,
-3.343204, -2.823055, -5.100668,
-3.343204, -2.823055, 4.947921,
-3.343204, 3.174374, -5.100668,
-3.343204, 3.174374, 4.947921,
-3.343204, -2.823055, -5.100668,
3.609921, -2.823055, -5.100668,
-3.343204, -2.823055, 4.947921,
3.609921, -2.823055, 4.947921,
-3.343204, 3.174374, -5.100668,
3.609921, 3.174374, -5.100668,
-3.343204, 3.174374, 4.947921,
3.609921, 3.174374, 4.947921,
3.609921, -2.823055, -5.100668,
3.609921, 3.174374, -5.100668,
3.609921, -2.823055, 4.947921,
3.609921, 3.174374, 4.947921,
3.609921, -2.823055, -5.100668,
3.609921, -2.823055, 4.947921,
3.609921, 3.174374, -5.100668,
3.609921, 3.174374, 4.947921
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
var radius = 7.268597;
var distance = 32.33881;
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
mvMatrix.translate( -0.1333586, -0.1756597, 0.07637382 );
mvMatrix.scale( 1.130276, 1.310387, 0.7820948 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.33881);
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
fosetyl<-read.table("fosetyl.xyz")
```

```
## Error in read.table("fosetyl.xyz"): no lines available in input
```

```r
x<-fosetyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fosetyl' not found
```

```r
y<-fosetyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fosetyl' not found
```

```r
z<-fosetyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fosetyl' not found
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
-3.241945, 0.5498969, -0.5900046, 0, 0, 1, 1, 1,
-3.047076, 1.795345, -2.584175, 1, 0, 0, 1, 1,
-3.043631, 1.685659, -0.4302224, 1, 0, 0, 1, 1,
-3.016251, 0.2152079, -2.168132, 1, 0, 0, 1, 1,
-2.914075, 1.092269, -2.584322, 1, 0, 0, 1, 1,
-2.907032, 2.694847, -2.48547, 1, 0, 0, 1, 1,
-2.752707, -0.1226251, -1.723867, 0, 0, 0, 1, 1,
-2.66287, -0.6326338, -0.4751629, 0, 0, 0, 1, 1,
-2.596768, -0.1616262, -1.776026, 0, 0, 0, 1, 1,
-2.506905, -2.214378, -3.59758, 0, 0, 0, 1, 1,
-2.428099, 0.9537928, -1.026354, 0, 0, 0, 1, 1,
-2.409653, 0.6707681, -0.3069241, 0, 0, 0, 1, 1,
-2.409027, -1.113586, -3.312229, 0, 0, 0, 1, 1,
-2.377249, 1.75082, -0.8259675, 1, 1, 1, 1, 1,
-2.348142, -0.002628886, -0.7840099, 1, 1, 1, 1, 1,
-2.346389, -1.575952, -0.6992651, 1, 1, 1, 1, 1,
-2.28136, -1.464043, -1.694861, 1, 1, 1, 1, 1,
-2.278423, -1.252888, -3.790153, 1, 1, 1, 1, 1,
-2.271672, -1.282198, -1.929601, 1, 1, 1, 1, 1,
-2.23419, -0.1325595, -0.02413212, 1, 1, 1, 1, 1,
-2.223403, -0.1686301, -1.959767, 1, 1, 1, 1, 1,
-2.222215, 0.6357514, -3.03541, 1, 1, 1, 1, 1,
-2.216258, 0.4178774, -1.298399, 1, 1, 1, 1, 1,
-2.193511, -0.1200345, -1.080254, 1, 1, 1, 1, 1,
-2.160923, -0.6846898, -2.931339, 1, 1, 1, 1, 1,
-2.146206, -0.1303196, -2.722354, 1, 1, 1, 1, 1,
-2.11911, -0.1199921, -2.440651, 1, 1, 1, 1, 1,
-2.103201, 0.6102026, -2.337739, 1, 1, 1, 1, 1,
-2.0655, -0.05464585, -1.326953, 0, 0, 1, 1, 1,
-2.053316, 0.5925232, 0.6356603, 1, 0, 0, 1, 1,
-2.043643, -1.029997, -1.589299, 1, 0, 0, 1, 1,
-2.031655, 2.415611, -0.3258407, 1, 0, 0, 1, 1,
-2.001833, -0.1852347, -1.83217, 1, 0, 0, 1, 1,
-1.956244, -1.121006, -2.593988, 1, 0, 0, 1, 1,
-1.955198, 0.567394, -1.497361, 0, 0, 0, 1, 1,
-1.945578, -1.04935, -3.415003, 0, 0, 0, 1, 1,
-1.945571, 1.148891, -2.215305, 0, 0, 0, 1, 1,
-1.901699, 0.2746179, -2.41695, 0, 0, 0, 1, 1,
-1.89785, 0.5830784, -0.07716149, 0, 0, 0, 1, 1,
-1.89037, -0.9895557, -1.07466, 0, 0, 0, 1, 1,
-1.890196, 1.757316, -0.8837259, 0, 0, 0, 1, 1,
-1.889761, -0.6522021, -3.473988, 1, 1, 1, 1, 1,
-1.882077, -0.6353804, -2.516089, 1, 1, 1, 1, 1,
-1.87983, -0.5578884, -2.272429, 1, 1, 1, 1, 1,
-1.842157, -0.2309039, -0.8576624, 1, 1, 1, 1, 1,
-1.808432, -2.000435, -2.668275, 1, 1, 1, 1, 1,
-1.795934, 0.5412977, -0.09569278, 1, 1, 1, 1, 1,
-1.770798, -1.305207, -0.6230696, 1, 1, 1, 1, 1,
-1.762761, -0.2675517, -2.428428, 1, 1, 1, 1, 1,
-1.762611, 0.1834033, -2.831796, 1, 1, 1, 1, 1,
-1.759342, -0.5702713, -1.692675, 1, 1, 1, 1, 1,
-1.751672, -0.9127749, -1.092556, 1, 1, 1, 1, 1,
-1.748523, -0.4299689, -1.58459, 1, 1, 1, 1, 1,
-1.743147, 1.270231, -1.533511, 1, 1, 1, 1, 1,
-1.742565, 0.8120402, -1.978024, 1, 1, 1, 1, 1,
-1.730752, 1.35699, 0.5479926, 1, 1, 1, 1, 1,
-1.717286, -0.6143677, -2.04308, 0, 0, 1, 1, 1,
-1.678151, -0.6406961, -1.820062, 1, 0, 0, 1, 1,
-1.677473, 0.6218219, -1.021369, 1, 0, 0, 1, 1,
-1.663063, 0.2792936, -2.898853, 1, 0, 0, 1, 1,
-1.66134, -1.237989, -1.65304, 1, 0, 0, 1, 1,
-1.65773, 0.4864487, -0.6384989, 1, 0, 0, 1, 1,
-1.645843, 0.1915969, 0.04128071, 0, 0, 0, 1, 1,
-1.622731, -1.08074, -2.342987, 0, 0, 0, 1, 1,
-1.619544, -0.2804656, -1.465237, 0, 0, 0, 1, 1,
-1.605133, -0.2594835, -0.2090811, 0, 0, 0, 1, 1,
-1.600916, 0.6023635, -2.146574, 0, 0, 0, 1, 1,
-1.590589, -0.07688466, -0.7022495, 0, 0, 0, 1, 1,
-1.583796, -0.5963596, -0.6621948, 0, 0, 0, 1, 1,
-1.571016, -0.68119, -1.693603, 1, 1, 1, 1, 1,
-1.564945, 0.6196837, -0.1196554, 1, 1, 1, 1, 1,
-1.543543, -0.725615, -1.243414, 1, 1, 1, 1, 1,
-1.542922, 0.3043166, -1.634686, 1, 1, 1, 1, 1,
-1.541137, -1.290097, -2.906826, 1, 1, 1, 1, 1,
-1.537085, -0.09404098, -2.755774, 1, 1, 1, 1, 1,
-1.521193, -0.5028196, -1.690816, 1, 1, 1, 1, 1,
-1.506896, -1.689047, -1.80605, 1, 1, 1, 1, 1,
-1.500041, -0.6356342, -2.390119, 1, 1, 1, 1, 1,
-1.495439, 1.001052, -1.836574, 1, 1, 1, 1, 1,
-1.467055, -0.5977834, -0.7692388, 1, 1, 1, 1, 1,
-1.463251, -0.9675972, -2.378858, 1, 1, 1, 1, 1,
-1.455552, -0.9165995, -3.568776, 1, 1, 1, 1, 1,
-1.452845, 0.4915324, -1.804671, 1, 1, 1, 1, 1,
-1.452511, -0.2845282, -1.705298, 1, 1, 1, 1, 1,
-1.451941, 1.630574, 0.4608755, 0, 0, 1, 1, 1,
-1.451352, 1.70888, 0.05979412, 1, 0, 0, 1, 1,
-1.446809, -0.3290024, -0.06630852, 1, 0, 0, 1, 1,
-1.442832, 0.543368, -0.04146059, 1, 0, 0, 1, 1,
-1.44036, -1.581234, -4.103781, 1, 0, 0, 1, 1,
-1.422292, 0.4255421, -0.639781, 1, 0, 0, 1, 1,
-1.41336, 1.775023, -2.405159, 0, 0, 0, 1, 1,
-1.394152, -0.759831, -0.154955, 0, 0, 0, 1, 1,
-1.39356, 1.125884, -0.6700875, 0, 0, 0, 1, 1,
-1.391961, -0.7217053, -0.9600716, 0, 0, 0, 1, 1,
-1.383797, 0.06889314, -1.268611, 0, 0, 0, 1, 1,
-1.377712, 0.5588951, -1.383708, 0, 0, 0, 1, 1,
-1.373656, -0.8764111, -2.798567, 0, 0, 0, 1, 1,
-1.369658, 0.1109408, -2.673886, 1, 1, 1, 1, 1,
-1.360946, -1.398319, -3.639885, 1, 1, 1, 1, 1,
-1.357633, 0.5746936, -3.245451, 1, 1, 1, 1, 1,
-1.354898, -0.3720483, -1.370069, 1, 1, 1, 1, 1,
-1.340447, -0.009756943, -0.3260605, 1, 1, 1, 1, 1,
-1.338913, 0.7356879, -1.478058, 1, 1, 1, 1, 1,
-1.337939, 0.6879187, -1.269488, 1, 1, 1, 1, 1,
-1.332968, -1.299298, -2.610678, 1, 1, 1, 1, 1,
-1.323878, 0.5642195, -0.8458902, 1, 1, 1, 1, 1,
-1.322744, -0.1621222, -1.085312, 1, 1, 1, 1, 1,
-1.321712, 0.520548, -0.7126574, 1, 1, 1, 1, 1,
-1.317717, 0.9915007, -1.354455, 1, 1, 1, 1, 1,
-1.314169, 0.3846594, -2.094211, 1, 1, 1, 1, 1,
-1.312847, 0.5423248, -0.6942736, 1, 1, 1, 1, 1,
-1.282093, 0.384534, -1.724499, 1, 1, 1, 1, 1,
-1.280745, -0.7384542, -2.920143, 0, 0, 1, 1, 1,
-1.275885, -0.8631107, -2.769942, 1, 0, 0, 1, 1,
-1.270724, -0.6297164, -2.206376, 1, 0, 0, 1, 1,
-1.270083, -1.601775, -2.125911, 1, 0, 0, 1, 1,
-1.266434, -1.06976, -1.650339, 1, 0, 0, 1, 1,
-1.263151, 0.204044, 0.5663747, 1, 0, 0, 1, 1,
-1.25985, -0.7294149, -2.290647, 0, 0, 0, 1, 1,
-1.248768, -0.1475556, -2.521336, 0, 0, 0, 1, 1,
-1.245904, 0.2295785, -1.508169, 0, 0, 0, 1, 1,
-1.230326, 0.9932055, -1.674827, 0, 0, 0, 1, 1,
-1.228963, -0.1413501, -1.892048, 0, 0, 0, 1, 1,
-1.228031, 0.8869596, -0.2169149, 0, 0, 0, 1, 1,
-1.225586, 0.8164346, -1.069176, 0, 0, 0, 1, 1,
-1.22468, -1.500568, -3.064288, 1, 1, 1, 1, 1,
-1.204767, 0.4930793, -0.201435, 1, 1, 1, 1, 1,
-1.20157, 0.7609758, -0.1319972, 1, 1, 1, 1, 1,
-1.193669, 0.03167498, -0.9564939, 1, 1, 1, 1, 1,
-1.190299, -0.7528477, -1.125366, 1, 1, 1, 1, 1,
-1.187506, 0.8909816, -1.146516, 1, 1, 1, 1, 1,
-1.187117, 0.8332196, -0.01441669, 1, 1, 1, 1, 1,
-1.182901, 0.9918627, -2.139584, 1, 1, 1, 1, 1,
-1.181078, 1.407003, -1.812377, 1, 1, 1, 1, 1,
-1.180741, -0.9253192, -1.11932, 1, 1, 1, 1, 1,
-1.172266, -1.470529, -4.156098, 1, 1, 1, 1, 1,
-1.166065, 0.4361396, -0.0123536, 1, 1, 1, 1, 1,
-1.159207, -0.6580964, -1.866324, 1, 1, 1, 1, 1,
-1.154075, 0.08951794, -0.6058272, 1, 1, 1, 1, 1,
-1.144514, -1.226612, -1.449989, 1, 1, 1, 1, 1,
-1.1219, 0.005477912, -3.848773, 0, 0, 1, 1, 1,
-1.121655, 0.8368867, -0.3392838, 1, 0, 0, 1, 1,
-1.12017, 0.9978708, 0.2970022, 1, 0, 0, 1, 1,
-1.114959, 0.4162944, -2.569467, 1, 0, 0, 1, 1,
-1.109673, 0.4331823, 0.08880873, 1, 0, 0, 1, 1,
-1.109485, -0.1094661, -1.786811, 1, 0, 0, 1, 1,
-1.100844, 0.439813, -2.837205, 0, 0, 0, 1, 1,
-1.087636, 0.3521699, -1.224289, 0, 0, 0, 1, 1,
-1.086171, 2.040592, -1.108356, 0, 0, 0, 1, 1,
-1.083583, -0.3037109, -0.7230054, 0, 0, 0, 1, 1,
-1.083469, 0.8510292, -2.401064, 0, 0, 0, 1, 1,
-1.083081, 0.9874615, -1.075783, 0, 0, 0, 1, 1,
-1.070974, -0.612653, -2.073701, 0, 0, 0, 1, 1,
-1.066494, -1.685927, -3.134148, 1, 1, 1, 1, 1,
-1.058475, 1.447758, -0.8504436, 1, 1, 1, 1, 1,
-1.049775, 2.376211, 1.392763, 1, 1, 1, 1, 1,
-1.046436, 0.0883757, -1.93897, 1, 1, 1, 1, 1,
-1.036429, 0.3604817, -1.980895, 1, 1, 1, 1, 1,
-1.027089, -1.287048, -2.400887, 1, 1, 1, 1, 1,
-1.022055, 0.3134516, -1.586413, 1, 1, 1, 1, 1,
-1.019781, 0.5132025, 0.3187257, 1, 1, 1, 1, 1,
-1.01934, 0.222795, -1.24391, 1, 1, 1, 1, 1,
-1.014318, -0.9419591, -2.353886, 1, 1, 1, 1, 1,
-1.010611, 0.3306783, -0.7989329, 1, 1, 1, 1, 1,
-0.998388, -0.0609141, -0.2056152, 1, 1, 1, 1, 1,
-0.9957642, -0.9143813, -3.301234, 1, 1, 1, 1, 1,
-0.9954708, -1.122154, -2.575076, 1, 1, 1, 1, 1,
-0.9891788, 1.387404, -0.8652962, 1, 1, 1, 1, 1,
-0.9836699, -0.1816778, -2.588274, 0, 0, 1, 1, 1,
-0.9830424, 1.124979, -0.6505108, 1, 0, 0, 1, 1,
-0.9815323, 0.2921759, 0.03816834, 1, 0, 0, 1, 1,
-0.9806447, 0.3047383, -0.8808234, 1, 0, 0, 1, 1,
-0.9794988, -0.9701292, -2.207989, 1, 0, 0, 1, 1,
-0.978794, -1.065391, -1.098727, 1, 0, 0, 1, 1,
-0.9646819, 0.6832077, -1.848261, 0, 0, 0, 1, 1,
-0.9637251, -1.158207, -3.498342, 0, 0, 0, 1, 1,
-0.9635412, 0.4920937, -1.121083, 0, 0, 0, 1, 1,
-0.9627457, -1.390657, -2.242491, 0, 0, 0, 1, 1,
-0.9571471, -0.1230228, -0.9231012, 0, 0, 0, 1, 1,
-0.95285, -0.6611205, -1.220777, 0, 0, 0, 1, 1,
-0.9451616, 0.2918452, -0.2521811, 0, 0, 0, 1, 1,
-0.9324394, 1.387661, -1.247414, 1, 1, 1, 1, 1,
-0.9322757, 0.5741973, -0.7603486, 1, 1, 1, 1, 1,
-0.9300868, -0.2726166, -0.9934745, 1, 1, 1, 1, 1,
-0.9289992, -0.1113392, -0.2966175, 1, 1, 1, 1, 1,
-0.927, -0.05092155, -3.974972, 1, 1, 1, 1, 1,
-0.9253367, -0.03793845, -2.181352, 1, 1, 1, 1, 1,
-0.9178682, 0.2117685, -0.636507, 1, 1, 1, 1, 1,
-0.915979, 0.5347525, -0.814137, 1, 1, 1, 1, 1,
-0.9062125, 0.04539814, 0.1751342, 1, 1, 1, 1, 1,
-0.8979274, 0.6597784, -2.30598, 1, 1, 1, 1, 1,
-0.8976409, -0.684275, -2.753798, 1, 1, 1, 1, 1,
-0.897405, 0.7312412, -1.879775, 1, 1, 1, 1, 1,
-0.8889611, 0.1938765, -2.115714, 1, 1, 1, 1, 1,
-0.8824775, -0.4234256, -1.474073, 1, 1, 1, 1, 1,
-0.8814166, -0.5916442, -3.555271, 1, 1, 1, 1, 1,
-0.8795712, -0.05472362, -0.4549508, 0, 0, 1, 1, 1,
-0.8781949, 0.8317825, -0.816511, 1, 0, 0, 1, 1,
-0.8758975, 0.9513612, -1.103184, 1, 0, 0, 1, 1,
-0.8669345, 0.07046889, -2.684527, 1, 0, 0, 1, 1,
-0.8645552, 0.7470222, 1.273359, 1, 0, 0, 1, 1,
-0.8535241, -0.7972292, -1.761547, 1, 0, 0, 1, 1,
-0.8526602, -0.8946866, -1.50292, 0, 0, 0, 1, 1,
-0.8506243, 1.917965, 0.4513254, 0, 0, 0, 1, 1,
-0.8502951, -0.759187, -2.168316, 0, 0, 0, 1, 1,
-0.8401296, -1.685975, -3.782132, 0, 0, 0, 1, 1,
-0.8388907, 0.6603677, -0.4372412, 0, 0, 0, 1, 1,
-0.8368676, 0.6948693, -0.8946379, 0, 0, 0, 1, 1,
-0.8299718, -0.1048378, -3.48036, 0, 0, 0, 1, 1,
-0.8191624, 0.9808992, -0.6138078, 1, 1, 1, 1, 1,
-0.811699, -0.2332501, -0.8669739, 1, 1, 1, 1, 1,
-0.8057353, 1.069295, -1.014443, 1, 1, 1, 1, 1,
-0.8048745, 0.113493, -1.568824, 1, 1, 1, 1, 1,
-0.8046736, -0.5770661, -3.378958, 1, 1, 1, 1, 1,
-0.8039686, 0.6747226, -0.8200871, 1, 1, 1, 1, 1,
-0.7956564, -0.02486679, -2.357264, 1, 1, 1, 1, 1,
-0.794131, -0.1143867, 0.1583496, 1, 1, 1, 1, 1,
-0.7842722, -1.415002, -3.963582, 1, 1, 1, 1, 1,
-0.7764108, -0.569128, -1.523807, 1, 1, 1, 1, 1,
-0.7756905, 0.03629223, -0.3482753, 1, 1, 1, 1, 1,
-0.7735498, -0.09400651, -1.768624, 1, 1, 1, 1, 1,
-0.7643209, 0.06816035, -1.239735, 1, 1, 1, 1, 1,
-0.7620115, -0.2681348, -2.809394, 1, 1, 1, 1, 1,
-0.7606515, 0.4250483, -2.870066, 1, 1, 1, 1, 1,
-0.7575393, 0.9331002, -0.5978459, 0, 0, 1, 1, 1,
-0.7574646, 0.8190176, -0.7955763, 1, 0, 0, 1, 1,
-0.7532297, -0.509789, -1.393194, 1, 0, 0, 1, 1,
-0.7497179, 0.1066007, -2.230595, 1, 0, 0, 1, 1,
-0.7478257, -0.03373368, -2.366298, 1, 0, 0, 1, 1,
-0.7459038, -0.3385316, -1.734025, 1, 0, 0, 1, 1,
-0.7400897, 0.94961, -1.223653, 0, 0, 0, 1, 1,
-0.7367949, 0.05246144, -2.89167, 0, 0, 0, 1, 1,
-0.7358019, -0.9101157, -2.740961, 0, 0, 0, 1, 1,
-0.7346454, 2.38817, -0.9149612, 0, 0, 0, 1, 1,
-0.7341795, 1.845379, -0.989608, 0, 0, 0, 1, 1,
-0.7337873, 0.5551541, -1.004871, 0, 0, 0, 1, 1,
-0.7286441, 0.1020886, -3.766639, 0, 0, 0, 1, 1,
-0.724344, -1.228144, -2.343446, 1, 1, 1, 1, 1,
-0.7161367, 0.0603235, -2.446489, 1, 1, 1, 1, 1,
-0.7153729, 0.2348709, 0.3924171, 1, 1, 1, 1, 1,
-0.70893, 0.2520096, -1.651641, 1, 1, 1, 1, 1,
-0.702145, -0.8630686, -3.418299, 1, 1, 1, 1, 1,
-0.6988986, -0.7852911, -2.618811, 1, 1, 1, 1, 1,
-0.6967059, -0.4538754, -1.057608, 1, 1, 1, 1, 1,
-0.6902366, -0.700594, -1.580177, 1, 1, 1, 1, 1,
-0.6884684, -0.8428686, -2.573796, 1, 1, 1, 1, 1,
-0.6880277, -0.8617623, -2.395947, 1, 1, 1, 1, 1,
-0.687219, 1.548313, -2.252482, 1, 1, 1, 1, 1,
-0.6869912, 0.1898407, -0.2772183, 1, 1, 1, 1, 1,
-0.68446, 0.1630581, -0.8802732, 1, 1, 1, 1, 1,
-0.6790219, 0.957559, -0.06835791, 1, 1, 1, 1, 1,
-0.6725796, 0.9756977, -0.3176221, 1, 1, 1, 1, 1,
-0.6686584, 1.031409, -0.6438279, 0, 0, 1, 1, 1,
-0.6686065, 1.281895, -0.7501308, 1, 0, 0, 1, 1,
-0.6676192, 1.89031, -0.08993319, 1, 0, 0, 1, 1,
-0.6664669, 0.9938196, 0.8271, 1, 0, 0, 1, 1,
-0.6636295, 0.3513845, -0.6269559, 1, 0, 0, 1, 1,
-0.6574671, 0.7694008, 0.7636137, 1, 0, 0, 1, 1,
-0.6477069, -0.5699672, -2.032526, 0, 0, 0, 1, 1,
-0.6476622, 0.02328833, -0.9481452, 0, 0, 0, 1, 1,
-0.6436818, 1.025695, -0.4478886, 0, 0, 0, 1, 1,
-0.6431297, -0.5418736, -1.160765, 0, 0, 0, 1, 1,
-0.6395243, 0.6554429, 0.7009022, 0, 0, 0, 1, 1,
-0.6325871, 0.4570336, 0.1416783, 0, 0, 0, 1, 1,
-0.632301, -2.093749, -3.292959, 0, 0, 0, 1, 1,
-0.6229579, 1.734212, 0.01483209, 1, 1, 1, 1, 1,
-0.6213239, 0.3463001, -1.136651, 1, 1, 1, 1, 1,
-0.6201754, -0.3981434, -1.862531, 1, 1, 1, 1, 1,
-0.6152355, 0.5717131, 0.3820509, 1, 1, 1, 1, 1,
-0.6134616, 0.2787497, -0.3089859, 1, 1, 1, 1, 1,
-0.6055335, -0.4389812, -3.084508, 1, 1, 1, 1, 1,
-0.6032018, -2.116544, -3.28916, 1, 1, 1, 1, 1,
-0.6031204, 0.3048742, -0.3885165, 1, 1, 1, 1, 1,
-0.6019897, 0.1081501, -0.950591, 1, 1, 1, 1, 1,
-0.5969028, 1.269692, -1.832077, 1, 1, 1, 1, 1,
-0.5896615, 0.1997295, -0.3122658, 1, 1, 1, 1, 1,
-0.5877708, -1.09695, -1.848421, 1, 1, 1, 1, 1,
-0.5853276, 0.8545271, -0.6665499, 1, 1, 1, 1, 1,
-0.5845043, -0.1181408, -2.027946, 1, 1, 1, 1, 1,
-0.58395, 0.02740102, -1.061486, 1, 1, 1, 1, 1,
-0.5743355, 0.5154136, -0.3120876, 0, 0, 1, 1, 1,
-0.5732142, 0.2633808, -3.504748, 1, 0, 0, 1, 1,
-0.572153, 0.4516062, -0.6521726, 1, 0, 0, 1, 1,
-0.5703936, 0.3027151, -0.8501221, 1, 0, 0, 1, 1,
-0.5661637, 1.101555, 0.1462693, 1, 0, 0, 1, 1,
-0.5660409, 0.6726919, -0.5062315, 1, 0, 0, 1, 1,
-0.5632679, 1.34387, -1.201829, 0, 0, 0, 1, 1,
-0.5616634, -1.337178, -2.962362, 0, 0, 0, 1, 1,
-0.5553884, -0.09756103, -1.390363, 0, 0, 0, 1, 1,
-0.5534856, -0.9781388, -0.2213514, 0, 0, 0, 1, 1,
-0.5527412, -0.3061366, -3.801061, 0, 0, 0, 1, 1,
-0.5523514, -0.4123161, -2.000839, 0, 0, 0, 1, 1,
-0.5444813, -1.594847, -2.89459, 0, 0, 0, 1, 1,
-0.5426935, 1.007711, -1.865528, 1, 1, 1, 1, 1,
-0.5422658, -0.7137377, -3.747136, 1, 1, 1, 1, 1,
-0.5350851, -1.92225, -0.8830768, 1, 1, 1, 1, 1,
-0.5326284, -0.01210759, -1.177813, 1, 1, 1, 1, 1,
-0.5300832, 1.003595, 0.6543144, 1, 1, 1, 1, 1,
-0.5253971, 0.923418, -0.3426509, 1, 1, 1, 1, 1,
-0.5198115, -1.307697, -1.94, 1, 1, 1, 1, 1,
-0.5128042, 0.3541316, -1.93468, 1, 1, 1, 1, 1,
-0.5110027, 0.1403647, -0.4648888, 1, 1, 1, 1, 1,
-0.5103472, -0.617594, -1.81351, 1, 1, 1, 1, 1,
-0.5082439, 0.4226229, -2.465012, 1, 1, 1, 1, 1,
-0.5066788, -0.9783373, -3.221054, 1, 1, 1, 1, 1,
-0.5042019, -1.148938, -1.95476, 1, 1, 1, 1, 1,
-0.5039269, -1.463117, -2.733236, 1, 1, 1, 1, 1,
-0.5014711, 0.5307366, 0.1436251, 1, 1, 1, 1, 1,
-0.4990734, 0.026003, -1.81229, 0, 0, 1, 1, 1,
-0.4976428, 0.6554055, -0.8195605, 1, 0, 0, 1, 1,
-0.4955975, -0.8966406, -2.940953, 1, 0, 0, 1, 1,
-0.4948176, 0.1619307, -1.945457, 1, 0, 0, 1, 1,
-0.4946567, -0.7749428, -2.007311, 1, 0, 0, 1, 1,
-0.4920804, -0.04870978, -1.988806, 1, 0, 0, 1, 1,
-0.4897027, 0.1329461, 0.1294314, 0, 0, 0, 1, 1,
-0.4888028, -0.2109939, -3.426737, 0, 0, 0, 1, 1,
-0.484816, -1.069689, -3.967408, 0, 0, 0, 1, 1,
-0.4844988, -0.1405087, 0.4761316, 0, 0, 0, 1, 1,
-0.481925, -0.7729248, -2.735136, 0, 0, 0, 1, 1,
-0.4805987, -2.330911, -2.759266, 0, 0, 0, 1, 1,
-0.4768625, 0.05543379, -1.751304, 0, 0, 0, 1, 1,
-0.4741734, 1.222795, -0.1589874, 1, 1, 1, 1, 1,
-0.4696351, 0.4877821, -1.489858, 1, 1, 1, 1, 1,
-0.4683723, -1.006686, -2.261869, 1, 1, 1, 1, 1,
-0.4674817, -0.7742227, -3.081889, 1, 1, 1, 1, 1,
-0.4670666, -0.3115444, -2.349861, 1, 1, 1, 1, 1,
-0.4668193, 1.066723, 0.5080911, 1, 1, 1, 1, 1,
-0.4655496, 1.999295, 0.03761921, 1, 1, 1, 1, 1,
-0.4582211, 0.4310097, 0.8451042, 1, 1, 1, 1, 1,
-0.4562668, 0.2727261, -1.234653, 1, 1, 1, 1, 1,
-0.4536709, -0.7302641, -3.060419, 1, 1, 1, 1, 1,
-0.4514574, -1.636302, -4.017376, 1, 1, 1, 1, 1,
-0.4506906, 0.05861271, -2.071941, 1, 1, 1, 1, 1,
-0.4469314, 1.647313, -0.3216979, 1, 1, 1, 1, 1,
-0.4416764, -1.528399, -4.757977, 1, 1, 1, 1, 1,
-0.4340494, -0.661047, -2.814899, 1, 1, 1, 1, 1,
-0.4312457, -0.3374009, -4.95433, 0, 0, 1, 1, 1,
-0.4294119, 0.2322714, -1.850899, 1, 0, 0, 1, 1,
-0.4278702, -1.370891, -2.274314, 1, 0, 0, 1, 1,
-0.4230053, 0.06545687, -1.626456, 1, 0, 0, 1, 1,
-0.4197746, -0.7046866, -1.105158, 1, 0, 0, 1, 1,
-0.4180803, 0.3604176, -0.9463298, 1, 0, 0, 1, 1,
-0.4123964, 0.6684949, -2.050777, 0, 0, 0, 1, 1,
-0.4120476, 0.3162163, 0.03547699, 0, 0, 0, 1, 1,
-0.4092966, 0.4166257, -3.50429, 0, 0, 0, 1, 1,
-0.4084374, 0.7718451, -1.353141, 0, 0, 0, 1, 1,
-0.407216, 1.613017, -1.071442, 0, 0, 0, 1, 1,
-0.397973, 0.8849813, -1.201854, 0, 0, 0, 1, 1,
-0.3962649, 0.5595341, -0.3343045, 0, 0, 0, 1, 1,
-0.3959334, -0.209479, -1.831098, 1, 1, 1, 1, 1,
-0.3945518, -0.6517585, -1.273392, 1, 1, 1, 1, 1,
-0.3872647, -0.7011735, -1.493792, 1, 1, 1, 1, 1,
-0.386337, -1.035999, -2.588511, 1, 1, 1, 1, 1,
-0.3861235, 0.2414477, -0.4883766, 1, 1, 1, 1, 1,
-0.3852703, 0.2495874, -2.181284, 1, 1, 1, 1, 1,
-0.3786807, -0.8175598, -2.286183, 1, 1, 1, 1, 1,
-0.3781691, -0.2742126, -1.873727, 1, 1, 1, 1, 1,
-0.3746825, -0.6459523, -2.617966, 1, 1, 1, 1, 1,
-0.370959, 0.4540644, -0.5615572, 1, 1, 1, 1, 1,
-0.3708622, -0.6237984, -1.95728, 1, 1, 1, 1, 1,
-0.3696005, -1.035755, -2.615303, 1, 1, 1, 1, 1,
-0.3695869, 0.6699587, -1.009019, 1, 1, 1, 1, 1,
-0.3665565, -1.894987, -1.906851, 1, 1, 1, 1, 1,
-0.3644969, 1.245858, -2.01075, 1, 1, 1, 1, 1,
-0.3644311, -1.62522, -3.876126, 0, 0, 1, 1, 1,
-0.360777, -0.9849193, -2.907872, 1, 0, 0, 1, 1,
-0.3602076, -0.9919058, -3.185209, 1, 0, 0, 1, 1,
-0.3547664, 0.9373116, -0.8474795, 1, 0, 0, 1, 1,
-0.3472978, 0.5240161, -2.455031, 1, 0, 0, 1, 1,
-0.3443367, -0.8014309, -3.906945, 1, 0, 0, 1, 1,
-0.3375151, 0.5334472, -0.4381966, 0, 0, 0, 1, 1,
-0.332598, -0.1909817, -2.113868, 0, 0, 0, 1, 1,
-0.3304603, -1.026487, -3.875779, 0, 0, 0, 1, 1,
-0.3257648, 0.7641295, -1.293918, 0, 0, 0, 1, 1,
-0.3245434, 0.4962229, -0.4369714, 0, 0, 0, 1, 1,
-0.3160701, -0.5389122, -2.222243, 0, 0, 0, 1, 1,
-0.3031577, 0.9128092, -0.178326, 0, 0, 0, 1, 1,
-0.2995901, 0.4903814, -2.309321, 1, 1, 1, 1, 1,
-0.2993541, -1.740658, -2.637605, 1, 1, 1, 1, 1,
-0.2951526, -0.6868836, -0.5190916, 1, 1, 1, 1, 1,
-0.2938988, 0.03048871, -1.211774, 1, 1, 1, 1, 1,
-0.2915906, 0.1624513, -2.409038, 1, 1, 1, 1, 1,
-0.2866791, 0.02435549, -1.621079, 1, 1, 1, 1, 1,
-0.2854291, 0.09017375, -1.990738, 1, 1, 1, 1, 1,
-0.2853577, -0.1721131, -1.714373, 1, 1, 1, 1, 1,
-0.2852693, 1.165944, 0.1571554, 1, 1, 1, 1, 1,
-0.2773907, 0.06919511, -1.044481, 1, 1, 1, 1, 1,
-0.2731467, -0.5297697, -4.002488, 1, 1, 1, 1, 1,
-0.272649, -1.090565, -3.320062, 1, 1, 1, 1, 1,
-0.2723938, -0.4857984, -2.437251, 1, 1, 1, 1, 1,
-0.2691135, 1.099301, 0.3471867, 1, 1, 1, 1, 1,
-0.2677556, 0.9156626, 0.5421317, 1, 1, 1, 1, 1,
-0.2671734, 1.073512, -0.6084059, 0, 0, 1, 1, 1,
-0.2656162, -0.3238814, -2.629543, 1, 0, 0, 1, 1,
-0.2627924, -1.284856, -0.651158, 1, 0, 0, 1, 1,
-0.2627668, 2.089417, -0.355097, 1, 0, 0, 1, 1,
-0.2618474, -1.062035, -4.505146, 1, 0, 0, 1, 1,
-0.2569983, -0.1357536, -2.245379, 1, 0, 0, 1, 1,
-0.2532953, 0.873313, -2.39117, 0, 0, 0, 1, 1,
-0.2528143, 0.05773557, -1.232849, 0, 0, 0, 1, 1,
-0.2518356, 1.32622, -0.5659354, 0, 0, 0, 1, 1,
-0.251389, -1.656496, -3.217434, 0, 0, 0, 1, 1,
-0.2510702, -0.4254768, 0.380393, 0, 0, 0, 1, 1,
-0.2467081, 0.04589403, -3.014791, 0, 0, 0, 1, 1,
-0.2460864, -2.026809, -0.7889416, 0, 0, 0, 1, 1,
-0.242706, 1.003715, 0.9358439, 1, 1, 1, 1, 1,
-0.2424116, -0.5744578, -1.317636, 1, 1, 1, 1, 1,
-0.2421528, 0.8080657, -1.217202, 1, 1, 1, 1, 1,
-0.2404786, -0.8429798, -3.791401, 1, 1, 1, 1, 1,
-0.2401252, -1.200498, -3.012934, 1, 1, 1, 1, 1,
-0.2385048, -2.421502, -2.319991, 1, 1, 1, 1, 1,
-0.2368329, -0.9583737, -2.923276, 1, 1, 1, 1, 1,
-0.2335122, -0.8053786, -3.137168, 1, 1, 1, 1, 1,
-0.2305853, -0.2209093, -2.469755, 1, 1, 1, 1, 1,
-0.2303125, 0.1389153, -0.1146209, 1, 1, 1, 1, 1,
-0.228153, -0.7341726, -2.650182, 1, 1, 1, 1, 1,
-0.2277801, 0.560307, -0.2371874, 1, 1, 1, 1, 1,
-0.226175, -0.2487336, -2.19736, 1, 1, 1, 1, 1,
-0.2259567, 0.9796205, -0.09472963, 1, 1, 1, 1, 1,
-0.2246783, -0.3617399, -2.297779, 1, 1, 1, 1, 1,
-0.2220305, 1.5168, 1.449934, 0, 0, 1, 1, 1,
-0.2162227, 0.219573, -0.01121986, 1, 0, 0, 1, 1,
-0.2128767, 1.362902, -0.7587458, 1, 0, 0, 1, 1,
-0.2114012, -0.3203078, -2.711812, 1, 0, 0, 1, 1,
-0.2105162, 1.06267, 0.3877573, 1, 0, 0, 1, 1,
-0.2096182, 0.1979586, 0.3488651, 1, 0, 0, 1, 1,
-0.2067765, 0.8972949, -1.13349, 0, 0, 0, 1, 1,
-0.2017199, 0.4423635, -0.6408374, 0, 0, 0, 1, 1,
-0.1943984, -1.01094, -2.328816, 0, 0, 0, 1, 1,
-0.1923669, -1.280468, -3.656563, 0, 0, 0, 1, 1,
-0.1919936, 1.482653, 1.262963, 0, 0, 0, 1, 1,
-0.1822466, 1.226975, -1.274155, 0, 0, 0, 1, 1,
-0.1813984, 1.506667, -0.9468566, 0, 0, 0, 1, 1,
-0.1799166, -0.9975853, -2.860718, 1, 1, 1, 1, 1,
-0.1773907, 1.358137, -0.6418914, 1, 1, 1, 1, 1,
-0.1728497, 0.4690465, -0.1259631, 1, 1, 1, 1, 1,
-0.1696133, -0.8293494, -0.5988632, 1, 1, 1, 1, 1,
-0.1687826, -1.690457, -2.391097, 1, 1, 1, 1, 1,
-0.1683717, 1.354005, -1.677739, 1, 1, 1, 1, 1,
-0.1676913, 0.4992881, -0.7373688, 1, 1, 1, 1, 1,
-0.1667384, -0.8568714, -3.096035, 1, 1, 1, 1, 1,
-0.1658751, -0.9157383, -1.433011, 1, 1, 1, 1, 1,
-0.1644859, 0.09499645, -1.248653, 1, 1, 1, 1, 1,
-0.1637691, -0.2495508, -4.25878, 1, 1, 1, 1, 1,
-0.1614457, 1.638979, -0.1133461, 1, 1, 1, 1, 1,
-0.1609653, 1.477599, -0.3591615, 1, 1, 1, 1, 1,
-0.1605721, -1.291992, -1.888606, 1, 1, 1, 1, 1,
-0.1583712, -0.1324148, -1.184728, 1, 1, 1, 1, 1,
-0.1558484, 0.4993249, -0.708168, 0, 0, 1, 1, 1,
-0.1554235, -1.539891, -1.971933, 1, 0, 0, 1, 1,
-0.1533424, -0.6667755, -2.324517, 1, 0, 0, 1, 1,
-0.1489289, 0.03047917, -1.901613, 1, 0, 0, 1, 1,
-0.1473861, 2.456846, -1.161833, 1, 0, 0, 1, 1,
-0.1445024, 0.1076142, 0.2901719, 1, 0, 0, 1, 1,
-0.1418113, 0.9274588, 1.089005, 0, 0, 0, 1, 1,
-0.1407284, 1.873458, 0.4788294, 0, 0, 0, 1, 1,
-0.1387167, 0.5704883, 0.05246556, 0, 0, 0, 1, 1,
-0.1366735, -1.959692, -2.324109, 0, 0, 0, 1, 1,
-0.1360922, -0.6787863, -2.41225, 0, 0, 0, 1, 1,
-0.1331523, 0.3958957, 0.5933451, 0, 0, 0, 1, 1,
-0.1292039, -0.2804498, -2.690282, 0, 0, 0, 1, 1,
-0.1286386, -1.190328, -4.206113, 1, 1, 1, 1, 1,
-0.1229804, -0.818566, -1.906275, 1, 1, 1, 1, 1,
-0.1175608, -0.7124381, -4.49333, 1, 1, 1, 1, 1,
-0.116547, -0.6077027, -3.266073, 1, 1, 1, 1, 1,
-0.1154982, 0.7182481, -0.7606398, 1, 1, 1, 1, 1,
-0.1149705, -0.139697, -2.403905, 1, 1, 1, 1, 1,
-0.1148338, 1.78577, 1.02786, 1, 1, 1, 1, 1,
-0.1095001, -1.332556, -2.893662, 1, 1, 1, 1, 1,
-0.1073406, 0.6357294, 0.6778892, 1, 1, 1, 1, 1,
-0.1072654, -0.3812925, -3.619178, 1, 1, 1, 1, 1,
-0.1068135, 0.07630099, -2.826286, 1, 1, 1, 1, 1,
-0.1057102, 0.6048645, 0.3350585, 1, 1, 1, 1, 1,
-0.1009213, -0.03307612, -1.54798, 1, 1, 1, 1, 1,
-0.09924024, 1.133808, -0.2226777, 1, 1, 1, 1, 1,
-0.09738141, -1.309865, -3.961746, 1, 1, 1, 1, 1,
-0.08759844, 0.5961369, 1.34338, 0, 0, 1, 1, 1,
-0.08458327, 0.2768051, 0.7909738, 1, 0, 0, 1, 1,
-0.07884263, 2.868736, -0.4027921, 1, 0, 0, 1, 1,
-0.07879893, -1.89891, -4.650237, 1, 0, 0, 1, 1,
-0.07344357, 0.9299898, -2.585006, 1, 0, 0, 1, 1,
-0.07054843, -1.195634, -2.242041, 1, 0, 0, 1, 1,
-0.0666118, 0.4300418, 1.931257, 0, 0, 0, 1, 1,
-0.0638143, -1.934841, -2.561307, 0, 0, 0, 1, 1,
-0.06189359, 1.142573, -0.09250824, 0, 0, 0, 1, 1,
-0.06084136, -0.07680249, -1.088638, 0, 0, 0, 1, 1,
-0.06064266, 0.09464163, -1.288755, 0, 0, 0, 1, 1,
-0.06008853, 1.857217, -1.311862, 0, 0, 0, 1, 1,
-0.05652906, 0.4299161, -0.763503, 0, 0, 0, 1, 1,
-0.05408012, -0.0516269, -3.006326, 1, 1, 1, 1, 1,
-0.05042984, 0.8373753, 1.018551, 1, 1, 1, 1, 1,
-0.04932595, 0.8440403, 1.073629, 1, 1, 1, 1, 1,
-0.04451786, -0.3612499, -2.198624, 1, 1, 1, 1, 1,
-0.04035663, -1.071659, -3.350027, 1, 1, 1, 1, 1,
-0.03765877, -1.266866, -3.814392, 1, 1, 1, 1, 1,
-0.03613642, 0.8123221, 1.072736, 1, 1, 1, 1, 1,
-0.03559854, 0.09946364, 0.8272387, 1, 1, 1, 1, 1,
-0.0294771, 0.7969683, 1.363039, 1, 1, 1, 1, 1,
-0.02866348, -0.1913492, -1.398208, 1, 1, 1, 1, 1,
-0.02744337, -0.4935529, -2.998865, 1, 1, 1, 1, 1,
-0.02562225, -0.4617338, -4.867958, 1, 1, 1, 1, 1,
-0.02343819, -1.170735, -3.347085, 1, 1, 1, 1, 1,
-0.02021988, 1.059608, -0.2663455, 1, 1, 1, 1, 1,
-0.01899664, -0.8512883, -3.702636, 1, 1, 1, 1, 1,
-0.01858255, 0.4887317, -0.3228749, 0, 0, 1, 1, 1,
-0.01627515, 0.1630797, 0.5913215, 1, 0, 0, 1, 1,
-0.01229706, -0.5913623, -1.499269, 1, 0, 0, 1, 1,
-0.009245394, 1.462664, 0.7898059, 1, 0, 0, 1, 1,
-0.002074105, 2.008193, -2.844894, 1, 0, 0, 1, 1,
-0.001727221, 0.192606, 0.121653, 1, 0, 0, 1, 1,
0.003176997, -0.316511, 2.200228, 0, 0, 0, 1, 1,
0.005524023, 0.3228425, 1.69126, 0, 0, 0, 1, 1,
0.006237471, -0.8515143, 2.084928, 0, 0, 0, 1, 1,
0.009014625, 0.1708399, 0.841419, 0, 0, 0, 1, 1,
0.01033044, -0.1230055, 2.985453, 0, 0, 0, 1, 1,
0.01278712, 1.10288, -0.113202, 0, 0, 0, 1, 1,
0.01619761, 0.4717248, 0.7984294, 0, 0, 0, 1, 1,
0.01688291, 1.397411, 0.6491721, 1, 1, 1, 1, 1,
0.01751083, 0.8376169, 0.1569712, 1, 1, 1, 1, 1,
0.0197941, 1.538392, -0.6491849, 1, 1, 1, 1, 1,
0.02394219, 1.014659, 0.003701263, 1, 1, 1, 1, 1,
0.0249652, -1.483762, 3.690066, 1, 1, 1, 1, 1,
0.02609446, -0.34644, 1.120761, 1, 1, 1, 1, 1,
0.02731611, 0.4402222, 0.4537621, 1, 1, 1, 1, 1,
0.02959725, -0.2099306, 3.812761, 1, 1, 1, 1, 1,
0.02984364, 0.7628548, 1.205054, 1, 1, 1, 1, 1,
0.03359088, 1.800753, 0.7976702, 1, 1, 1, 1, 1,
0.03405444, -0.726068, 3.021396, 1, 1, 1, 1, 1,
0.0384596, -0.9596152, 2.590356, 1, 1, 1, 1, 1,
0.03950693, -0.916898, 2.137398, 1, 1, 1, 1, 1,
0.04027314, -1.01494, 3.166205, 1, 1, 1, 1, 1,
0.04197881, 0.7872627, 0.1792233, 1, 1, 1, 1, 1,
0.0421222, 0.003439446, 1.994089, 0, 0, 1, 1, 1,
0.04607335, 0.6283555, -0.08978141, 1, 0, 0, 1, 1,
0.0466125, 1.35194, -1.256539, 1, 0, 0, 1, 1,
0.04828561, -1.098131, 3.233497, 1, 0, 0, 1, 1,
0.04862268, 1.079359, 1.399266, 1, 0, 0, 1, 1,
0.05149515, 1.502923, -1.171041, 1, 0, 0, 1, 1,
0.05219407, 0.8390891, -0.0538627, 0, 0, 0, 1, 1,
0.05238256, 0.5627034, -0.5670308, 0, 0, 0, 1, 1,
0.0552816, -0.1829608, 3.158377, 0, 0, 0, 1, 1,
0.06290721, -1.981139, 2.878657, 0, 0, 0, 1, 1,
0.06731676, -1.701906, 4.598074, 0, 0, 0, 1, 1,
0.06871197, 0.4431859, -1.031109, 0, 0, 0, 1, 1,
0.07507267, 1.944586, 1.24789, 0, 0, 0, 1, 1,
0.0841706, -1.483907, 1.555814, 1, 1, 1, 1, 1,
0.08457751, 0.68762, 0.07033396, 1, 1, 1, 1, 1,
0.08689289, -0.866062, 3.673448, 1, 1, 1, 1, 1,
0.08969116, 0.03384432, 0.2549707, 1, 1, 1, 1, 1,
0.09598385, -1.354321, 3.439356, 1, 1, 1, 1, 1,
0.09604871, 0.1131694, 0.1828174, 1, 1, 1, 1, 1,
0.09753992, -0.7402443, 2.349064, 1, 1, 1, 1, 1,
0.101224, -0.5311605, 3.587621, 1, 1, 1, 1, 1,
0.1036238, -0.4069034, 3.532788, 1, 1, 1, 1, 1,
0.1062542, -0.9759676, 2.157151, 1, 1, 1, 1, 1,
0.1091258, -0.8749781, 3.201953, 1, 1, 1, 1, 1,
0.1174367, -1.366612, 2.128066, 1, 1, 1, 1, 1,
0.1220871, -0.4940033, 3.687279, 1, 1, 1, 1, 1,
0.131791, -0.1295152, 3.008333, 1, 1, 1, 1, 1,
0.1405615, 0.4510723, -0.8882123, 1, 1, 1, 1, 1,
0.1444232, 0.4055431, 0.4890583, 0, 0, 1, 1, 1,
0.1456203, 0.3408477, 0.4952936, 1, 0, 0, 1, 1,
0.1456939, -2.395319, 3.004216, 1, 0, 0, 1, 1,
0.1490363, -2.043037, 3.123879, 1, 0, 0, 1, 1,
0.1490791, -2.009123, 3.057512, 1, 0, 0, 1, 1,
0.1493944, 0.1993199, -1.815949, 1, 0, 0, 1, 1,
0.1502458, -0.889958, 2.784755, 0, 0, 0, 1, 1,
0.1506643, 0.1354144, -0.02216578, 0, 0, 0, 1, 1,
0.1542372, 1.209752, 0.2163945, 0, 0, 0, 1, 1,
0.156896, 3.087033, -0.02575946, 0, 0, 0, 1, 1,
0.157052, 0.6195837, -0.1141513, 0, 0, 0, 1, 1,
0.1581185, -0.2064737, 2.120097, 0, 0, 0, 1, 1,
0.1586796, -0.3521385, 2.130055, 0, 0, 0, 1, 1,
0.1610419, -0.006346373, 2.772085, 1, 1, 1, 1, 1,
0.1667908, -1.33426, 4.383655, 1, 1, 1, 1, 1,
0.1673076, 0.4257978, 2.318006, 1, 1, 1, 1, 1,
0.1677496, 1.899797, -0.5972984, 1, 1, 1, 1, 1,
0.1731607, -0.08162823, 2.28229, 1, 1, 1, 1, 1,
0.1786084, -1.296062, 2.373081, 1, 1, 1, 1, 1,
0.1790571, -1.080293, 1.716851, 1, 1, 1, 1, 1,
0.1797487, 0.4522424, 0.3285259, 1, 1, 1, 1, 1,
0.180797, 0.5310631, 0.4110145, 1, 1, 1, 1, 1,
0.1808944, -0.5322905, 3.940212, 1, 1, 1, 1, 1,
0.1826017, 0.4383772, 2.261128, 1, 1, 1, 1, 1,
0.1900394, 0.2474068, 2.481998, 1, 1, 1, 1, 1,
0.1927796, 0.3874555, -0.74532, 1, 1, 1, 1, 1,
0.1987766, 0.3426015, 1.306739, 1, 1, 1, 1, 1,
0.1997862, -1.027981, 3.346919, 1, 1, 1, 1, 1,
0.2008026, 0.03083169, 1.384866, 0, 0, 1, 1, 1,
0.201004, -0.8178375, 2.630899, 1, 0, 0, 1, 1,
0.2033315, 1.033587, 0.1110799, 1, 0, 0, 1, 1,
0.2049994, -0.889006, 3.74023, 1, 0, 0, 1, 1,
0.2072164, 0.1290961, 2.375948, 1, 0, 0, 1, 1,
0.2097086, -0.2892196, 3.823415, 1, 0, 0, 1, 1,
0.2103758, -0.9420081, 2.140141, 0, 0, 0, 1, 1,
0.2141752, -0.8386069, 2.316226, 0, 0, 0, 1, 1,
0.2161867, -1.204268, 2.732821, 0, 0, 0, 1, 1,
0.2163278, -0.587769, 1.877429, 0, 0, 0, 1, 1,
0.2184358, -0.1629719, 2.434348, 0, 0, 0, 1, 1,
0.2188409, 1.540942, -1.188961, 0, 0, 0, 1, 1,
0.2206657, -1.214247, 3.256758, 0, 0, 0, 1, 1,
0.223291, -1.382833, 4.655086, 1, 1, 1, 1, 1,
0.2256754, -0.9728874, 2.886466, 1, 1, 1, 1, 1,
0.227354, -0.3266355, 1.491454, 1, 1, 1, 1, 1,
0.2305496, -1.705128, 3.177253, 1, 1, 1, 1, 1,
0.2310039, -1.043957, 2.221526, 1, 1, 1, 1, 1,
0.2317244, 1.191055, -1.352484, 1, 1, 1, 1, 1,
0.2355606, -1.493242, 1.705178, 1, 1, 1, 1, 1,
0.2374697, -0.8126336, 3.666451, 1, 1, 1, 1, 1,
0.2387692, 1.211573, 1.444601, 1, 1, 1, 1, 1,
0.2467162, 0.2429839, -0.02930675, 1, 1, 1, 1, 1,
0.2472706, -2.06418, 3.466384, 1, 1, 1, 1, 1,
0.2499028, -0.02356235, 1.530235, 1, 1, 1, 1, 1,
0.2517435, 0.5201988, 0.8858446, 1, 1, 1, 1, 1,
0.2585791, -0.6993666, 2.940305, 1, 1, 1, 1, 1,
0.2613107, -0.7808372, 2.763041, 1, 1, 1, 1, 1,
0.2622766, -0.4320415, 2.320734, 0, 0, 1, 1, 1,
0.2628471, 1.627808, 1.568721, 1, 0, 0, 1, 1,
0.263418, -0.2654908, 2.06506, 1, 0, 0, 1, 1,
0.263492, 0.2065882, 0.7970291, 1, 0, 0, 1, 1,
0.2685187, -0.1545417, 0.89113, 1, 0, 0, 1, 1,
0.2777582, -0.6363396, 1.48583, 1, 0, 0, 1, 1,
0.2811012, -0.331507, 2.898392, 0, 0, 0, 1, 1,
0.29423, 1.491991, 0.6162419, 0, 0, 0, 1, 1,
0.2951781, 1.213897, -1.42346, 0, 0, 0, 1, 1,
0.299165, 1.752276, -1.286468, 0, 0, 0, 1, 1,
0.3073175, 2.353583, -1.246799, 0, 0, 0, 1, 1,
0.3111756, -0.09892905, 3.680695, 0, 0, 0, 1, 1,
0.3143412, -0.2716987, 0.852259, 0, 0, 0, 1, 1,
0.3149088, 0.487295, 3.545664, 1, 1, 1, 1, 1,
0.3156659, 0.6482891, -0.1723519, 1, 1, 1, 1, 1,
0.3172268, 0.08816513, 1.318871, 1, 1, 1, 1, 1,
0.318636, 0.9524829, 0.5773432, 1, 1, 1, 1, 1,
0.3186868, 1.102099, -1.346291, 1, 1, 1, 1, 1,
0.3190449, 0.7998579, 0.6427321, 1, 1, 1, 1, 1,
0.3226837, 1.105828, -0.6363428, 1, 1, 1, 1, 1,
0.323604, 0.0700976, 0.7923325, 1, 1, 1, 1, 1,
0.3257851, -1.284156, 1.864968, 1, 1, 1, 1, 1,
0.3264348, -0.7140431, 2.339508, 1, 1, 1, 1, 1,
0.3281451, -0.06807923, 2.381729, 1, 1, 1, 1, 1,
0.3312292, 0.3240365, 1.182955, 1, 1, 1, 1, 1,
0.331791, 1.488878, -0.4616014, 1, 1, 1, 1, 1,
0.3320642, 0.3152643, 1.744045, 1, 1, 1, 1, 1,
0.3375165, -0.1473342, 1.164001, 1, 1, 1, 1, 1,
0.3411349, -2.214088, 4.522572, 0, 0, 1, 1, 1,
0.3429374, 0.8650001, 0.4654502, 1, 0, 0, 1, 1,
0.3455911, 0.2450669, 0.8673651, 1, 0, 0, 1, 1,
0.3479652, 0.4106858, -0.3415262, 1, 0, 0, 1, 1,
0.350302, -2.429788, 2.192386, 1, 0, 0, 1, 1,
0.3515285, 0.8994091, -2.387707, 1, 0, 0, 1, 1,
0.3541296, 0.5659408, 1.122407, 0, 0, 0, 1, 1,
0.3541324, -0.4030273, 4.422068, 0, 0, 0, 1, 1,
0.3550045, -0.02953939, 1.633116, 0, 0, 0, 1, 1,
0.3551359, -1.614927, 1.759846, 0, 0, 0, 1, 1,
0.3559439, 0.9856018, -1.126562, 0, 0, 0, 1, 1,
0.3599529, -0.8233644, 2.832638, 0, 0, 0, 1, 1,
0.366643, -0.6602403, 1.122364, 0, 0, 0, 1, 1,
0.3670495, 1.069416, 1.336681, 1, 1, 1, 1, 1,
0.3706642, 2.32689, 1.099091, 1, 1, 1, 1, 1,
0.3710368, 0.4857738, -1.018879, 1, 1, 1, 1, 1,
0.3716392, 0.01917245, 2.225654, 1, 1, 1, 1, 1,
0.3725778, -0.1399694, -0.154255, 1, 1, 1, 1, 1,
0.3747024, 1.12536, -0.4301253, 1, 1, 1, 1, 1,
0.3904714, 0.4083691, -1.568518, 1, 1, 1, 1, 1,
0.3911273, 0.205359, -1.060475, 1, 1, 1, 1, 1,
0.3916851, -0.8860898, 2.637896, 1, 1, 1, 1, 1,
0.3946831, -0.3673612, 0.7796019, 1, 1, 1, 1, 1,
0.4036651, -2.735713, 1.368925, 1, 1, 1, 1, 1,
0.4045808, -0.01661697, 2.296516, 1, 1, 1, 1, 1,
0.4049819, -0.4930619, 2.913509, 1, 1, 1, 1, 1,
0.4062132, 0.7358885, 1.055873, 1, 1, 1, 1, 1,
0.4069869, 0.3313926, -0.429978, 1, 1, 1, 1, 1,
0.4106304, -0.7071009, 1.256722, 0, 0, 1, 1, 1,
0.4157892, 0.3387517, -0.2216783, 1, 0, 0, 1, 1,
0.4183585, -0.1633041, 0.7365747, 1, 0, 0, 1, 1,
0.4188191, -0.06082597, 1.777505, 1, 0, 0, 1, 1,
0.4188367, 0.7081807, -1.096569, 1, 0, 0, 1, 1,
0.4233825, -1.643339, 3.388316, 1, 0, 0, 1, 1,
0.4236514, -0.056529, 2.400549, 0, 0, 0, 1, 1,
0.4257249, 2.234337, -0.2793226, 0, 0, 0, 1, 1,
0.4274998, 1.098975, 0.7599467, 0, 0, 0, 1, 1,
0.4276816, 0.7687898, 2.587686, 0, 0, 0, 1, 1,
0.4343124, 0.4918338, 1.104476, 0, 0, 0, 1, 1,
0.4360806, 0.7138151, 0.9570226, 0, 0, 0, 1, 1,
0.4375667, 0.1719555, 1.3398, 0, 0, 0, 1, 1,
0.4452397, 0.2204074, 0.2248324, 1, 1, 1, 1, 1,
0.4464223, -0.9253045, 2.829341, 1, 1, 1, 1, 1,
0.4477514, -0.4902395, 3.739275, 1, 1, 1, 1, 1,
0.4504849, -0.6127839, 2.513401, 1, 1, 1, 1, 1,
0.451469, 1.07521, 1.247278, 1, 1, 1, 1, 1,
0.4544749, 0.617698, 0.3903632, 1, 1, 1, 1, 1,
0.4551268, 1.114694, 0.8931037, 1, 1, 1, 1, 1,
0.4553129, -1.058861, 3.038847, 1, 1, 1, 1, 1,
0.4601708, -0.06812298, 1.380655, 1, 1, 1, 1, 1,
0.4642235, -0.7515901, 3.111892, 1, 1, 1, 1, 1,
0.4648557, 1.207504, -1.084175, 1, 1, 1, 1, 1,
0.4676321, -1.500353, 4.801582, 1, 1, 1, 1, 1,
0.4686323, 0.5671867, -0.2740356, 1, 1, 1, 1, 1,
0.4744734, -1.069952, 2.110386, 1, 1, 1, 1, 1,
0.476054, -0.7939339, 2.894027, 1, 1, 1, 1, 1,
0.479583, -0.4327022, 2.773922, 0, 0, 1, 1, 1,
0.480559, -0.5225241, 2.638945, 1, 0, 0, 1, 1,
0.4828227, 1.701416, 0.8229541, 1, 0, 0, 1, 1,
0.4852029, 1.318238, 1.048057, 1, 0, 0, 1, 1,
0.4862782, 0.06177951, -0.09953982, 1, 0, 0, 1, 1,
0.4893434, -0.08125521, 3.484724, 1, 0, 0, 1, 1,
0.4898034, 0.0999668, 1.142598, 0, 0, 0, 1, 1,
0.4910265, 0.1132445, 1.811443, 0, 0, 0, 1, 1,
0.4922616, -1.301278, 3.267277, 0, 0, 0, 1, 1,
0.4923611, 0.404895, 2.996972, 0, 0, 0, 1, 1,
0.4960802, 1.236644, 1.666188, 0, 0, 0, 1, 1,
0.5006233, 0.861469, 1.5127, 0, 0, 0, 1, 1,
0.5018473, -0.5816514, 1.995832, 0, 0, 0, 1, 1,
0.5179046, -1.110048, 4.319904, 1, 1, 1, 1, 1,
0.5194278, -0.5743898, 3.358183, 1, 1, 1, 1, 1,
0.520479, -0.5906394, 3.260435, 1, 1, 1, 1, 1,
0.5209135, -0.1867555, 2.880705, 1, 1, 1, 1, 1,
0.5246726, 1.643108, -0.8310749, 1, 1, 1, 1, 1,
0.5252373, 1.311802, -0.7367066, 1, 1, 1, 1, 1,
0.5259872, 1.497974, 1.609077, 1, 1, 1, 1, 1,
0.5366858, -1.357662, 1.603049, 1, 1, 1, 1, 1,
0.5380927, -0.7883568, 0.7781267, 1, 1, 1, 1, 1,
0.5426839, 0.6409181, 1.343094, 1, 1, 1, 1, 1,
0.5429493, 0.8414179, -1.14062, 1, 1, 1, 1, 1,
0.5455013, 0.3355575, 0.2682821, 1, 1, 1, 1, 1,
0.5460189, 0.7672531, 0.8873033, 1, 1, 1, 1, 1,
0.5491059, 1.269969, 0.7856149, 1, 1, 1, 1, 1,
0.5513821, 0.1492444, 2.227787, 1, 1, 1, 1, 1,
0.5515934, 2.300695, 0.935114, 0, 0, 1, 1, 1,
0.5563647, -0.6865453, 2.207937, 1, 0, 0, 1, 1,
0.557014, -0.9691526, 2.376276, 1, 0, 0, 1, 1,
0.5589256, -2.245467, 2.483417, 1, 0, 0, 1, 1,
0.5640248, 0.1299203, 1.790466, 1, 0, 0, 1, 1,
0.5666335, -1.384679, 2.133171, 1, 0, 0, 1, 1,
0.5726202, 1.006956, 1.394595, 0, 0, 0, 1, 1,
0.5758125, 0.3218148, 0.8284704, 0, 0, 0, 1, 1,
0.5803499, -0.8748954, 1.770643, 0, 0, 0, 1, 1,
0.5819184, -0.102006, 2.052334, 0, 0, 0, 1, 1,
0.5822903, -0.6498879, 2.727884, 0, 0, 0, 1, 1,
0.5848508, 0.4816189, 0.7364494, 0, 0, 0, 1, 1,
0.5863254, -0.4630443, 3.173097, 0, 0, 0, 1, 1,
0.5872191, -0.006668056, 2.145006, 1, 1, 1, 1, 1,
0.5909423, -1.486913, 1.984604, 1, 1, 1, 1, 1,
0.5914608, 0.3330472, -0.5319279, 1, 1, 1, 1, 1,
0.5924339, 0.3423249, 0.5820212, 1, 1, 1, 1, 1,
0.5945201, 0.6183645, 0.3118818, 1, 1, 1, 1, 1,
0.5968013, 2.43825, -0.3264916, 1, 1, 1, 1, 1,
0.5979956, 0.8049264, 0.1634225, 1, 1, 1, 1, 1,
0.6005681, -1.02585, 1.2921, 1, 1, 1, 1, 1,
0.6018292, 1.449302, -1.662603, 1, 1, 1, 1, 1,
0.6031938, -0.1343468, 2.429096, 1, 1, 1, 1, 1,
0.6042123, -2.292089, 1.112911, 1, 1, 1, 1, 1,
0.6076663, 0.1664562, 2.734993, 1, 1, 1, 1, 1,
0.6093676, 0.4509476, -1.290529, 1, 1, 1, 1, 1,
0.61041, 0.9069481, 0.7508208, 1, 1, 1, 1, 1,
0.6116443, -0.08103924, 1.951756, 1, 1, 1, 1, 1,
0.6124988, 2.325917, -0.7096812, 0, 0, 1, 1, 1,
0.6191773, -0.6637058, 3.669909, 1, 0, 0, 1, 1,
0.622416, -0.9037774, 1.215596, 1, 0, 0, 1, 1,
0.6238915, -0.693419, 1.282719, 1, 0, 0, 1, 1,
0.6250702, -0.4935399, 2.676709, 1, 0, 0, 1, 1,
0.6340964, -0.3440129, 2.636337, 1, 0, 0, 1, 1,
0.6389653, 0.6070483, 2.252268, 0, 0, 0, 1, 1,
0.6398323, 1.767923, 0.8999277, 0, 0, 0, 1, 1,
0.6475143, -1.140218, 3.718968, 0, 0, 0, 1, 1,
0.6495309, -0.7454332, 2.670784, 0, 0, 0, 1, 1,
0.6496187, 0.6539098, 2.791878, 0, 0, 0, 1, 1,
0.6498472, -0.3682002, 3.405935, 0, 0, 0, 1, 1,
0.6523406, -0.08042448, 1.553312, 0, 0, 0, 1, 1,
0.6545966, -0.08588567, -0.5495031, 1, 1, 1, 1, 1,
0.6603407, 0.8083476, 1.19608, 1, 1, 1, 1, 1,
0.6619818, -1.141166, 2.678999, 1, 1, 1, 1, 1,
0.6654276, 0.2562889, 0.6863163, 1, 1, 1, 1, 1,
0.6661993, 0.4824, 0.2164896, 1, 1, 1, 1, 1,
0.6685345, 0.1622509, 0.8685551, 1, 1, 1, 1, 1,
0.6759683, -1.178469, 2.908211, 1, 1, 1, 1, 1,
0.6765062, 0.5773367, 1.864752, 1, 1, 1, 1, 1,
0.6774381, -0.4046232, 3.918047, 1, 1, 1, 1, 1,
0.6835346, 0.5284187, -0.5509248, 1, 1, 1, 1, 1,
0.6881104, 1.977272, 0.5462298, 1, 1, 1, 1, 1,
0.6893529, 1.332874, -0.9551131, 1, 1, 1, 1, 1,
0.6940387, -0.1698033, 1.637011, 1, 1, 1, 1, 1,
0.6989018, 0.7419811, 0.5595924, 1, 1, 1, 1, 1,
0.7031226, 1.306986, 0.6879501, 1, 1, 1, 1, 1,
0.7083682, 0.4280081, -0.9478549, 0, 0, 1, 1, 1,
0.7086142, -0.1206327, 2.304748, 1, 0, 0, 1, 1,
0.713626, 0.06018061, 0.956141, 1, 0, 0, 1, 1,
0.7149119, -0.2759922, 1.245362, 1, 0, 0, 1, 1,
0.7152028, 0.4158277, 0.0278145, 1, 0, 0, 1, 1,
0.7177599, 1.778226, 1.257915, 1, 0, 0, 1, 1,
0.7261837, -0.4899115, 1.355291, 0, 0, 0, 1, 1,
0.7278196, 0.9076884, -0.4980208, 0, 0, 0, 1, 1,
0.7286317, -0.7212514, 2.234602, 0, 0, 0, 1, 1,
0.731315, 0.9715132, -0.3326609, 0, 0, 0, 1, 1,
0.7345217, -1.6043, 3.150437, 0, 0, 0, 1, 1,
0.7367654, -1.007345, 1.886618, 0, 0, 0, 1, 1,
0.7412058, -0.8558321, 1.1358, 0, 0, 0, 1, 1,
0.7416029, 0.03481254, 1.596434, 1, 1, 1, 1, 1,
0.7445543, 0.7275862, 3.043193, 1, 1, 1, 1, 1,
0.7456835, -0.6711599, 2.678317, 1, 1, 1, 1, 1,
0.7466929, -1.606797, 2.719964, 1, 1, 1, 1, 1,
0.7473884, 0.9915544, 1.649015, 1, 1, 1, 1, 1,
0.7477723, 0.6903798, 0.9739164, 1, 1, 1, 1, 1,
0.749831, 1.581993, -1.640033, 1, 1, 1, 1, 1,
0.7514495, -0.3729863, 2.524754, 1, 1, 1, 1, 1,
0.7601479, 0.1870323, 0.1328229, 1, 1, 1, 1, 1,
0.7639049, 0.5856986, 0.2647204, 1, 1, 1, 1, 1,
0.7703284, -0.8562046, 1.001604, 1, 1, 1, 1, 1,
0.7751855, 0.02778402, 1.775761, 1, 1, 1, 1, 1,
0.7804504, -0.6907386, 1.046627, 1, 1, 1, 1, 1,
0.782212, 0.2152773, 2.327946, 1, 1, 1, 1, 1,
0.7854369, 0.8793268, 0.07722235, 1, 1, 1, 1, 1,
0.7895788, -1.711043, 1.467561, 0, 0, 1, 1, 1,
0.7918817, -0.9281521, 2.533948, 1, 0, 0, 1, 1,
0.8013403, -0.05823067, 0.4081373, 1, 0, 0, 1, 1,
0.8023344, -1.850693, 0.9129991, 1, 0, 0, 1, 1,
0.8109353, -0.6155633, 3.441753, 1, 0, 0, 1, 1,
0.8147301, 0.935006, 1.539426, 1, 0, 0, 1, 1,
0.8157235, 0.6711249, 0.1920628, 0, 0, 0, 1, 1,
0.8168463, 1.151485, 1.491797, 0, 0, 0, 1, 1,
0.822169, 0.6001876, -0.3502591, 0, 0, 0, 1, 1,
0.8268574, 1.446415, 1.213798, 0, 0, 0, 1, 1,
0.8353458, -0.3589988, 1.987789, 0, 0, 0, 1, 1,
0.8358467, -0.5450124, 3.4433, 0, 0, 0, 1, 1,
0.8388833, -1.224527, 1.020902, 0, 0, 0, 1, 1,
0.8393129, -0.3944654, 0.4433452, 1, 1, 1, 1, 1,
0.8440426, -0.2406982, 1.887401, 1, 1, 1, 1, 1,
0.8476521, 0.7509491, 0.5338956, 1, 1, 1, 1, 1,
0.8477771, 1.044, -0.1588771, 1, 1, 1, 1, 1,
0.8680273, -0.7883798, 1.569515, 1, 1, 1, 1, 1,
0.8749378, 0.9511724, 1.267819, 1, 1, 1, 1, 1,
0.8871275, -0.5980319, 3.651607, 1, 1, 1, 1, 1,
0.8874231, 0.8446269, -0.8857762, 1, 1, 1, 1, 1,
0.890453, 1.103928, 0.6729466, 1, 1, 1, 1, 1,
0.8910917, -0.4359533, 3.030882, 1, 1, 1, 1, 1,
0.8929545, -0.5783218, 1.273921, 1, 1, 1, 1, 1,
0.8973436, -1.627968, 3.34786, 1, 1, 1, 1, 1,
0.9002142, -1.364718, 2.232108, 1, 1, 1, 1, 1,
0.9075561, -0.4869747, 3.331446, 1, 1, 1, 1, 1,
0.9094177, -1.669627, 3.475674, 1, 1, 1, 1, 1,
0.9125828, 1.32805, -1.384796, 0, 0, 1, 1, 1,
0.9145129, -1.150968, 2.72005, 1, 0, 0, 1, 1,
0.9198157, 0.001575426, 1.363637, 1, 0, 0, 1, 1,
0.9231902, 0.3321728, 1.858309, 1, 0, 0, 1, 1,
0.9267778, -0.2855365, 1.115057, 1, 0, 0, 1, 1,
0.9471449, -0.5363646, 2.005015, 1, 0, 0, 1, 1,
0.9496319, -0.5845243, 1.245171, 0, 0, 0, 1, 1,
0.9532046, -0.7635686, 0.3419717, 0, 0, 0, 1, 1,
0.9546844, -0.1532234, 2.309472, 0, 0, 0, 1, 1,
0.9550167, 0.3047187, 0.2324365, 0, 0, 0, 1, 1,
0.9571099, 1.736678, 1.184476, 0, 0, 0, 1, 1,
0.9724318, -0.4889769, 1.969715, 0, 0, 0, 1, 1,
0.9810755, 2.745103, 1.392286, 0, 0, 0, 1, 1,
0.9816105, -0.2644669, 3.100763, 1, 1, 1, 1, 1,
0.9853107, 0.5293093, -0.676126, 1, 1, 1, 1, 1,
0.9871461, 0.2323109, -0.9016398, 1, 1, 1, 1, 1,
0.987254, 1.937801, -0.4325762, 1, 1, 1, 1, 1,
0.9914024, -0.7695207, 0.5372654, 1, 1, 1, 1, 1,
0.9980181, -0.4658913, 1.894852, 1, 1, 1, 1, 1,
1.005771, 0.2328551, 0.02236295, 1, 1, 1, 1, 1,
1.009601, 0.5302764, 2.192429, 1, 1, 1, 1, 1,
1.016569, 1.880242, -0.7005724, 1, 1, 1, 1, 1,
1.024178, 1.207521, -0.7341228, 1, 1, 1, 1, 1,
1.029815, 1.355785, -0.9189043, 1, 1, 1, 1, 1,
1.038673, 0.1967416, 1.916835, 1, 1, 1, 1, 1,
1.042642, 1.300388, -0.7957889, 1, 1, 1, 1, 1,
1.052561, 0.1524985, 0.1255196, 1, 1, 1, 1, 1,
1.062951, -0.1841318, 2.68031, 1, 1, 1, 1, 1,
1.064587, 1.228477, 1.27275, 0, 0, 1, 1, 1,
1.081581, 0.1864047, -0.07353026, 1, 0, 0, 1, 1,
1.089372, -1.954861, 3.351652, 1, 0, 0, 1, 1,
1.09126, 0.4283981, 1.310494, 1, 0, 0, 1, 1,
1.092885, -0.04198381, 2.656694, 1, 0, 0, 1, 1,
1.104435, -0.8151336, 1.238797, 1, 0, 0, 1, 1,
1.107277, -1.808968, 1.477139, 0, 0, 0, 1, 1,
1.108209, -0.3202194, 3.961475, 0, 0, 0, 1, 1,
1.113642, 0.255751, 0.5844568, 0, 0, 0, 1, 1,
1.117337, -0.802603, 1.862568, 0, 0, 0, 1, 1,
1.122487, -0.4842948, 1.963811, 0, 0, 0, 1, 1,
1.123427, 0.9273319, 0.1481342, 0, 0, 0, 1, 1,
1.128477, 0.0368168, 1.89375, 0, 0, 0, 1, 1,
1.133613, 0.5066416, 1.194593, 1, 1, 1, 1, 1,
1.144788, -0.3592827, 2.097033, 1, 1, 1, 1, 1,
1.151111, -0.7829741, 2.436179, 1, 1, 1, 1, 1,
1.154937, -1.02323, 1.765919, 1, 1, 1, 1, 1,
1.157977, 1.530581, 2.629784, 1, 1, 1, 1, 1,
1.159221, -1.221791, 3.024794, 1, 1, 1, 1, 1,
1.160036, 0.4402032, -0.6568292, 1, 1, 1, 1, 1,
1.166808, -0.1276571, 1.629949, 1, 1, 1, 1, 1,
1.166936, -0.2361902, 1.147888, 1, 1, 1, 1, 1,
1.178473, 0.740774, 1.141795, 1, 1, 1, 1, 1,
1.190294, -0.6632972, 3.9208, 1, 1, 1, 1, 1,
1.195865, -0.2869996, 0.2115668, 1, 1, 1, 1, 1,
1.196948, 0.6955112, 0.6881749, 1, 1, 1, 1, 1,
1.204754, -0.1543476, 1.605049, 1, 1, 1, 1, 1,
1.207108, 0.7114562, 0.4939282, 1, 1, 1, 1, 1,
1.22038, -1.730598, 3.708195, 0, 0, 1, 1, 1,
1.221991, -1.342534, 0.8627664, 1, 0, 0, 1, 1,
1.226984, -1.104204, 1.708263, 1, 0, 0, 1, 1,
1.229954, 0.4988958, 2.834396, 1, 0, 0, 1, 1,
1.232055, 1.429066, -1.429158, 1, 0, 0, 1, 1,
1.242768, -0.4032407, 2.089249, 1, 0, 0, 1, 1,
1.254624, -0.487818, 3.394749, 0, 0, 0, 1, 1,
1.275202, 0.7439572, 0.1089348, 0, 0, 0, 1, 1,
1.280709, -0.9839768, 3.280916, 0, 0, 0, 1, 1,
1.284376, -0.3112656, 1.466669, 0, 0, 0, 1, 1,
1.296815, 0.06647212, 2.029815, 0, 0, 0, 1, 1,
1.30423, -0.7539383, 1.537179, 0, 0, 0, 1, 1,
1.310047, -0.8956552, 3.520375, 0, 0, 0, 1, 1,
1.340214, -1.059047, 3.383694, 1, 1, 1, 1, 1,
1.34817, -1.332394, 3.514672, 1, 1, 1, 1, 1,
1.369203, -1.103541, 2.346241, 1, 1, 1, 1, 1,
1.373007, 1.642679, 0.9804234, 1, 1, 1, 1, 1,
1.373574, 1.312373, 0.4881035, 1, 1, 1, 1, 1,
1.378415, -1.273697, 1.768558, 1, 1, 1, 1, 1,
1.381813, 0.5039763, 2.309243, 1, 1, 1, 1, 1,
1.384613, -0.09674218, 2.514091, 1, 1, 1, 1, 1,
1.398607, 1.078802, 1.5732, 1, 1, 1, 1, 1,
1.407619, -0.9661223, 2.238405, 1, 1, 1, 1, 1,
1.41474, -0.2645298, 2.343423, 1, 1, 1, 1, 1,
1.423177, 0.6799719, -0.2662552, 1, 1, 1, 1, 1,
1.426545, 0.1131151, 2.601585, 1, 1, 1, 1, 1,
1.45044, -0.3330774, 0.8920682, 1, 1, 1, 1, 1,
1.450538, 1.233441, 1.297111, 1, 1, 1, 1, 1,
1.455187, 0.7069017, -0.9745938, 0, 0, 1, 1, 1,
1.462792, -0.4988635, 2.660482, 1, 0, 0, 1, 1,
1.464582, -0.4209072, 3.348984, 1, 0, 0, 1, 1,
1.470169, 0.5277113, 1.505854, 1, 0, 0, 1, 1,
1.476435, 2.02793, 0.08402262, 1, 0, 0, 1, 1,
1.507933, 1.824607, 2.489985, 1, 0, 0, 1, 1,
1.512771, -0.4845427, 1.484689, 0, 0, 0, 1, 1,
1.521585, -0.9572282, 1.693538, 0, 0, 0, 1, 1,
1.5234, 0.7589398, 1.186135, 0, 0, 0, 1, 1,
1.540992, -1.321921, 3.861093, 0, 0, 0, 1, 1,
1.545249, 1.005407, 1.36254, 0, 0, 0, 1, 1,
1.553849, -0.2306504, 2.083316, 0, 0, 0, 1, 1,
1.561206, -1.166855, 2.118398, 0, 0, 0, 1, 1,
1.608897, 0.6861956, -0.3410741, 1, 1, 1, 1, 1,
1.618353, -0.3521599, 1.755379, 1, 1, 1, 1, 1,
1.622609, -0.1865033, 0.5476227, 1, 1, 1, 1, 1,
1.636631, -0.2690305, 1.119411, 1, 1, 1, 1, 1,
1.643844, 0.6109762, 1.51518, 1, 1, 1, 1, 1,
1.651119, -1.816984, 2.529173, 1, 1, 1, 1, 1,
1.654183, 0.7641456, 1.229559, 1, 1, 1, 1, 1,
1.65912, 1.765074, 0.9418779, 1, 1, 1, 1, 1,
1.695795, -0.1040005, 2.72595, 1, 1, 1, 1, 1,
1.702201, 0.06802937, 3.317932, 1, 1, 1, 1, 1,
1.71965, 0.1761723, 0.4118744, 1, 1, 1, 1, 1,
1.730777, -1.417239, 3.735811, 1, 1, 1, 1, 1,
1.751466, -0.5496649, 2.680694, 1, 1, 1, 1, 1,
1.752556, 0.3002589, -0.4555322, 1, 1, 1, 1, 1,
1.787324, -0.314833, 1.812609, 1, 1, 1, 1, 1,
1.78871, -0.3056408, 2.551414, 0, 0, 1, 1, 1,
1.790906, 0.7349004, 2.669099, 1, 0, 0, 1, 1,
1.791909, 0.9890356, 2.071192, 1, 0, 0, 1, 1,
1.810224, 0.9027647, 0.1593977, 1, 0, 0, 1, 1,
1.810365, 1.451476, 1.03464, 1, 0, 0, 1, 1,
1.815197, -1.106763, 1.97686, 1, 0, 0, 1, 1,
1.829582, -0.4324899, 4.023818, 0, 0, 0, 1, 1,
1.831573, -0.487373, 1.790121, 0, 0, 0, 1, 1,
1.834018, 0.6528424, 1.075967, 0, 0, 0, 1, 1,
1.884893, 0.2744808, 1.396917, 0, 0, 0, 1, 1,
1.894322, 1.085944, 2.025949, 0, 0, 0, 1, 1,
1.902711, -0.3745759, 2.602142, 0, 0, 0, 1, 1,
1.910851, 0.2760432, 1.877045, 0, 0, 0, 1, 1,
1.911289, 0.6276011, 1.474417, 1, 1, 1, 1, 1,
1.917567, -0.2059151, 1.072345, 1, 1, 1, 1, 1,
1.962093, 0.3710659, 1.3393, 1, 1, 1, 1, 1,
1.968725, 0.1989368, 0.4102376, 1, 1, 1, 1, 1,
1.968739, 1.024707, 0.499249, 1, 1, 1, 1, 1,
1.982859, -0.7955924, 0.7883363, 1, 1, 1, 1, 1,
2.005941, -0.005843237, 1.315477, 1, 1, 1, 1, 1,
2.008789, 1.846111, 0.544253, 1, 1, 1, 1, 1,
2.016035, 0.3527887, 0.9454949, 1, 1, 1, 1, 1,
2.019595, -2.090214, 1.919742, 1, 1, 1, 1, 1,
2.026394, 1.659985, 1.32626, 1, 1, 1, 1, 1,
2.095597, -0.5048409, 2.220897, 1, 1, 1, 1, 1,
2.118194, -0.3263018, 1.850736, 1, 1, 1, 1, 1,
2.158742, -0.738198, 3.428495, 1, 1, 1, 1, 1,
2.162332, -0.7531332, 2.193691, 1, 1, 1, 1, 1,
2.192315, 0.5193177, 1.854867, 0, 0, 1, 1, 1,
2.211631, 0.5921433, 0.9491662, 1, 0, 0, 1, 1,
2.225347, 1.012141, -0.6636857, 1, 0, 0, 1, 1,
2.245164, 2.392979, 1.108247, 1, 0, 0, 1, 1,
2.294319, 0.6472769, 0.05520678, 1, 0, 0, 1, 1,
2.294584, 0.7656876, 0.9519516, 1, 0, 0, 1, 1,
2.321979, -0.7211949, -0.02359355, 0, 0, 0, 1, 1,
2.33774, -0.4218532, 2.588, 0, 0, 0, 1, 1,
2.348199, -2.567464, -1.127569, 0, 0, 0, 1, 1,
2.37826, -0.6693867, 0.3795811, 0, 0, 0, 1, 1,
2.432593, 2.093861, -0.3407654, 0, 0, 0, 1, 1,
2.440299, -1.801546, 1.446829, 0, 0, 0, 1, 1,
2.504935, 0.7259437, 0.9971506, 0, 0, 0, 1, 1,
2.520298, 0.1084741, 3.887363, 1, 1, 1, 1, 1,
2.622201, 0.6718665, 1.966188, 1, 1, 1, 1, 1,
2.675594, -1.626232, 2.380471, 1, 1, 1, 1, 1,
2.709708, -1.191313, 2.664316, 1, 1, 1, 1, 1,
3.010221, -0.4815187, 0.4194818, 1, 1, 1, 1, 1,
3.162722, -0.1592424, 2.837004, 1, 1, 1, 1, 1,
3.508662, -0.1155053, 1.569085, 1, 1, 1, 1, 1
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
var radius = 9.136789;
var distance = 32.09259;
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
mvMatrix.translate( -0.1333585, -0.1756597, 0.07637382 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.09259);
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
