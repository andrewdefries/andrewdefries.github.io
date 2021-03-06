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
-3.174544, 0.07516574, -0.6976711, 1, 0, 0, 1,
-3.057208, 0.5884858, -2.015213, 1, 0.007843138, 0, 1,
-3.013554, 0.05458624, -2.018622, 1, 0.01176471, 0, 1,
-2.871146, -2.486871, -1.162554, 1, 0.01960784, 0, 1,
-2.870119, -0.8245913, -0.3149585, 1, 0.02352941, 0, 1,
-2.534545, 0.502326, 2.307882, 1, 0.03137255, 0, 1,
-2.47267, 1.566184, 0.1021443, 1, 0.03529412, 0, 1,
-2.395721, 0.4440052, -1.669769, 1, 0.04313726, 0, 1,
-2.372795, -0.3657677, -0.788843, 1, 0.04705882, 0, 1,
-2.353944, -1.634826, -3.454309, 1, 0.05490196, 0, 1,
-2.302896, 0.40246, -2.441967, 1, 0.05882353, 0, 1,
-2.293144, -0.7949922, -1.777317, 1, 0.06666667, 0, 1,
-2.254901, 0.05153433, -1.945793, 1, 0.07058824, 0, 1,
-2.223204, 0.4442796, -0.371596, 1, 0.07843138, 0, 1,
-2.170492, -0.949265, -2.029682, 1, 0.08235294, 0, 1,
-2.064062, -0.7097471, -2.676022, 1, 0.09019608, 0, 1,
-2.055212, 0.3361203, 0.6297234, 1, 0.09411765, 0, 1,
-2.039778, -1.144338, -1.955348, 1, 0.1019608, 0, 1,
-2.012217, 1.850318, -1.59457, 1, 0.1098039, 0, 1,
-1.970983, 0.5123343, 0.6115623, 1, 0.1137255, 0, 1,
-1.970071, 0.09034885, -1.777542, 1, 0.1215686, 0, 1,
-1.965194, -0.1454229, -0.6826725, 1, 0.1254902, 0, 1,
-1.928353, -0.07850916, -1.237007, 1, 0.1333333, 0, 1,
-1.9275, -1.456768, -2.884213, 1, 0.1372549, 0, 1,
-1.923897, 1.279189, -0.4415677, 1, 0.145098, 0, 1,
-1.923513, -1.965791, -2.293717, 1, 0.1490196, 0, 1,
-1.919575, -1.657009, -1.926179, 1, 0.1568628, 0, 1,
-1.896355, 0.8074979, -0.3566233, 1, 0.1607843, 0, 1,
-1.896169, 0.1772269, 0.2658653, 1, 0.1686275, 0, 1,
-1.894352, -0.5014451, -0.9676529, 1, 0.172549, 0, 1,
-1.880539, 0.2744206, -0.8814158, 1, 0.1803922, 0, 1,
-1.833574, -0.3018093, -1.498874, 1, 0.1843137, 0, 1,
-1.826696, 0.04638068, -1.567179, 1, 0.1921569, 0, 1,
-1.803754, 0.07262013, -1.612395, 1, 0.1960784, 0, 1,
-1.801811, -0.3103057, -1.130021, 1, 0.2039216, 0, 1,
-1.797917, -0.6194204, -0.5746081, 1, 0.2117647, 0, 1,
-1.792853, 0.3437097, -1.732377, 1, 0.2156863, 0, 1,
-1.775481, -0.08979485, -2.847301, 1, 0.2235294, 0, 1,
-1.746392, 0.590201, -0.8727757, 1, 0.227451, 0, 1,
-1.727233, -0.7759546, -0.3016234, 1, 0.2352941, 0, 1,
-1.718423, 0.2203134, -1.430713, 1, 0.2392157, 0, 1,
-1.715976, -0.1039809, -2.681538, 1, 0.2470588, 0, 1,
-1.71567, -0.5838279, -2.381023, 1, 0.2509804, 0, 1,
-1.698446, -0.334925, -0.3778875, 1, 0.2588235, 0, 1,
-1.694817, -2.203673, -1.979102, 1, 0.2627451, 0, 1,
-1.694187, -1.310628, -1.706947, 1, 0.2705882, 0, 1,
-1.689712, -0.5553886, -0.8306924, 1, 0.2745098, 0, 1,
-1.67824, -1.368268, -1.916359, 1, 0.282353, 0, 1,
-1.646323, -0.7600282, -4.275399, 1, 0.2862745, 0, 1,
-1.613351, 1.105812, 0.3014038, 1, 0.2941177, 0, 1,
-1.609039, 0.4296309, -1.07681, 1, 0.3019608, 0, 1,
-1.60859, -0.8258265, -2.627091, 1, 0.3058824, 0, 1,
-1.589293, -0.4300866, -0.5561913, 1, 0.3137255, 0, 1,
-1.572471, 1.263095, 1.17955, 1, 0.3176471, 0, 1,
-1.572006, -1.295547, -1.463903, 1, 0.3254902, 0, 1,
-1.568385, 1.626988, -1.585568, 1, 0.3294118, 0, 1,
-1.568021, 0.9886065, 0.2940139, 1, 0.3372549, 0, 1,
-1.548573, -0.9609669, -2.744188, 1, 0.3411765, 0, 1,
-1.52993, 0.6242257, -1.15077, 1, 0.3490196, 0, 1,
-1.526682, 0.6311573, -0.1927628, 1, 0.3529412, 0, 1,
-1.52252, 0.1613582, -1.465865, 1, 0.3607843, 0, 1,
-1.509929, 0.06187895, -2.964182, 1, 0.3647059, 0, 1,
-1.501141, -1.841128, -2.542695, 1, 0.372549, 0, 1,
-1.490685, -0.2993752, -2.192137, 1, 0.3764706, 0, 1,
-1.48622, -0.8517065, -0.5559132, 1, 0.3843137, 0, 1,
-1.48289, -0.02496565, -1.121176, 1, 0.3882353, 0, 1,
-1.473101, -1.694103, -0.5465801, 1, 0.3960784, 0, 1,
-1.459776, 1.368851, -2.243054, 1, 0.4039216, 0, 1,
-1.445478, 0.5508457, -0.4096324, 1, 0.4078431, 0, 1,
-1.434365, -0.4322189, -1.159597, 1, 0.4156863, 0, 1,
-1.428525, 0.01207901, -1.396755, 1, 0.4196078, 0, 1,
-1.426117, -0.2211137, -1.223187, 1, 0.427451, 0, 1,
-1.420826, -1.373439, -1.521987, 1, 0.4313726, 0, 1,
-1.411663, -0.4299447, -2.282593, 1, 0.4392157, 0, 1,
-1.404127, 0.6828938, -1.008229, 1, 0.4431373, 0, 1,
-1.389453, -0.3615682, -3.949963, 1, 0.4509804, 0, 1,
-1.385119, -0.3515636, -4.020471, 1, 0.454902, 0, 1,
-1.384743, 1.16955, -2.296062, 1, 0.4627451, 0, 1,
-1.378805, -1.054965, -2.679079, 1, 0.4666667, 0, 1,
-1.372234, 0.1770914, -2.557393, 1, 0.4745098, 0, 1,
-1.357694, 1.661994, -0.6913826, 1, 0.4784314, 0, 1,
-1.346737, -0.1493638, -2.57251, 1, 0.4862745, 0, 1,
-1.344743, 0.2382228, -1.179268, 1, 0.4901961, 0, 1,
-1.336907, -0.9928725, -1.573135, 1, 0.4980392, 0, 1,
-1.333997, -0.3601982, -1.987557, 1, 0.5058824, 0, 1,
-1.331358, 0.618671, -1.827543, 1, 0.509804, 0, 1,
-1.323683, -0.005202208, -2.852919, 1, 0.5176471, 0, 1,
-1.319209, 0.3091874, -0.9321316, 1, 0.5215687, 0, 1,
-1.312009, -0.8659558, -2.188997, 1, 0.5294118, 0, 1,
-1.307889, 1.315426, 0.438444, 1, 0.5333334, 0, 1,
-1.304885, 0.06472358, -1.716456, 1, 0.5411765, 0, 1,
-1.30257, -2.74638, -3.578676, 1, 0.5450981, 0, 1,
-1.299488, -0.3238759, -3.222392, 1, 0.5529412, 0, 1,
-1.299118, 1.776122, -0.7388341, 1, 0.5568628, 0, 1,
-1.2967, -1.180067, -2.402033, 1, 0.5647059, 0, 1,
-1.29148, -1.22634, -1.688155, 1, 0.5686275, 0, 1,
-1.287108, -0.3688478, -2.507874, 1, 0.5764706, 0, 1,
-1.285065, -1.156393, -2.563091, 1, 0.5803922, 0, 1,
-1.283922, 0.342033, -3.115844, 1, 0.5882353, 0, 1,
-1.282001, 0.364328, -2.15351, 1, 0.5921569, 0, 1,
-1.279185, 0.3559668, 0.6470574, 1, 0.6, 0, 1,
-1.276667, -1.995253, -1.76856, 1, 0.6078432, 0, 1,
-1.260185, 0.5198808, -0.4428417, 1, 0.6117647, 0, 1,
-1.246265, -0.783727, -2.861264, 1, 0.6196079, 0, 1,
-1.241588, -0.5358009, -1.199876, 1, 0.6235294, 0, 1,
-1.22846, 0.08233954, -1.691564, 1, 0.6313726, 0, 1,
-1.21314, 1.73854, -0.2351634, 1, 0.6352941, 0, 1,
-1.205486, 0.6630052, -0.3197089, 1, 0.6431373, 0, 1,
-1.20245, 0.7059327, -1.53841, 1, 0.6470588, 0, 1,
-1.191476, 2.142509, -2.147377, 1, 0.654902, 0, 1,
-1.184704, 0.1935704, -1.24897, 1, 0.6588235, 0, 1,
-1.179007, 0.5327972, -0.6907253, 1, 0.6666667, 0, 1,
-1.176715, -1.282538, -3.392653, 1, 0.6705883, 0, 1,
-1.167431, 0.7577574, -2.601405, 1, 0.6784314, 0, 1,
-1.161509, 0.6337369, -0.7981246, 1, 0.682353, 0, 1,
-1.158443, 1.966566, -0.1567905, 1, 0.6901961, 0, 1,
-1.142121, 1.115168, -0.8222018, 1, 0.6941177, 0, 1,
-1.138172, -0.4288912, -0.4613303, 1, 0.7019608, 0, 1,
-1.135684, 0.6511982, -1.203051, 1, 0.7098039, 0, 1,
-1.115971, 1.550826, -0.5420984, 1, 0.7137255, 0, 1,
-1.112662, 0.5149115, -1.863548, 1, 0.7215686, 0, 1,
-1.110421, 1.340348, -1.502524, 1, 0.7254902, 0, 1,
-1.105823, -0.5791061, -2.596887, 1, 0.7333333, 0, 1,
-1.103925, -0.2416795, -2.226667, 1, 0.7372549, 0, 1,
-1.102468, 0.09274606, -2.98699, 1, 0.7450981, 0, 1,
-1.101928, -1.595595, -0.5827348, 1, 0.7490196, 0, 1,
-1.096918, 0.1319133, 0.3301695, 1, 0.7568628, 0, 1,
-1.095787, 0.7591293, -0.04802092, 1, 0.7607843, 0, 1,
-1.091539, -0.443164, -2.193125, 1, 0.7686275, 0, 1,
-1.087774, 0.7050316, -1.880826, 1, 0.772549, 0, 1,
-1.086542, 1.387613, -0.5082216, 1, 0.7803922, 0, 1,
-1.075833, 0.5709038, -0.5068016, 1, 0.7843137, 0, 1,
-1.072562, 0.3471299, -1.274076, 1, 0.7921569, 0, 1,
-1.070077, -0.2014914, -2.01794, 1, 0.7960784, 0, 1,
-1.066978, -0.4038869, -2.611446, 1, 0.8039216, 0, 1,
-1.05992, 1.100372, -2.426078, 1, 0.8117647, 0, 1,
-1.057732, 1.002625, -2.046557, 1, 0.8156863, 0, 1,
-1.05597, -1.109034, -2.359903, 1, 0.8235294, 0, 1,
-1.055954, 0.01407776, -2.560021, 1, 0.827451, 0, 1,
-1.05251, 1.673014, -2.90337, 1, 0.8352941, 0, 1,
-1.049615, -1.660598, -2.996253, 1, 0.8392157, 0, 1,
-1.04758, 0.038359, -1.802705, 1, 0.8470588, 0, 1,
-1.042404, 0.9930617, 0.67348, 1, 0.8509804, 0, 1,
-1.037615, 0.2231903, -1.361844, 1, 0.8588235, 0, 1,
-1.0346, -0.6132332, -3.336624, 1, 0.8627451, 0, 1,
-1.024173, -0.910944, -1.573706, 1, 0.8705882, 0, 1,
-1.015449, -1.717166, -3.121203, 1, 0.8745098, 0, 1,
-1.013268, -1.831759, -4.861316, 1, 0.8823529, 0, 1,
-1.010174, 0.06692705, -1.045702, 1, 0.8862745, 0, 1,
-1.002989, -0.46896, -2.736641, 1, 0.8941177, 0, 1,
-1.001073, -0.7376694, -3.066843, 1, 0.8980392, 0, 1,
-0.9822748, 1.574873, -0.1872957, 1, 0.9058824, 0, 1,
-0.9820309, 1.809303, 0.7216678, 1, 0.9137255, 0, 1,
-0.9808239, 0.4539202, -1.529504, 1, 0.9176471, 0, 1,
-0.9799612, -0.9005116, -2.227672, 1, 0.9254902, 0, 1,
-0.9716865, -0.4180321, -2.146633, 1, 0.9294118, 0, 1,
-0.9690107, -0.203117, -1.213581, 1, 0.9372549, 0, 1,
-0.9622868, 0.3811017, -0.6740106, 1, 0.9411765, 0, 1,
-0.9570381, 0.6753029, -2.142601, 1, 0.9490196, 0, 1,
-0.9533019, -0.03135733, -0.2295232, 1, 0.9529412, 0, 1,
-0.9525472, 0.9008685, -1.518528, 1, 0.9607843, 0, 1,
-0.9518622, -0.6960936, -2.389511, 1, 0.9647059, 0, 1,
-0.9461441, -0.1684208, -1.811668, 1, 0.972549, 0, 1,
-0.945729, -0.8614879, -2.863684, 1, 0.9764706, 0, 1,
-0.9395351, 0.566117, -1.813917, 1, 0.9843137, 0, 1,
-0.9378392, -2.159439, -3.376153, 1, 0.9882353, 0, 1,
-0.9370608, -0.3702007, -2.523844, 1, 0.9960784, 0, 1,
-0.9334776, 0.517205, -1.067127, 0.9960784, 1, 0, 1,
-0.9271526, 0.04863737, -0.5425021, 0.9921569, 1, 0, 1,
-0.9246052, -1.238251, -3.315737, 0.9843137, 1, 0, 1,
-0.9197168, 0.4524898, -0.8544835, 0.9803922, 1, 0, 1,
-0.9126852, -0.214764, -1.507374, 0.972549, 1, 0, 1,
-0.9121836, 0.1706185, -1.200797, 0.9686275, 1, 0, 1,
-0.8988664, 0.8383383, 0.2098947, 0.9607843, 1, 0, 1,
-0.8987871, 1.189189, 0.3495921, 0.9568627, 1, 0, 1,
-0.8967115, 0.5669342, -2.533151, 0.9490196, 1, 0, 1,
-0.8944245, -0.1289379, -1.662279, 0.945098, 1, 0, 1,
-0.8832902, 0.01670667, -3.477357, 0.9372549, 1, 0, 1,
-0.8807655, 2.100453, 0.5950282, 0.9333333, 1, 0, 1,
-0.8737646, -0.6681796, -1.099086, 0.9254902, 1, 0, 1,
-0.8632208, -1.119511, -0.7611198, 0.9215686, 1, 0, 1,
-0.8623514, -0.4092074, -2.449735, 0.9137255, 1, 0, 1,
-0.8590013, -0.7306529, -3.460266, 0.9098039, 1, 0, 1,
-0.8488736, -1.20368, -1.291022, 0.9019608, 1, 0, 1,
-0.8464385, -2.358816, -4.636539, 0.8941177, 1, 0, 1,
-0.8332223, -0.2760156, -0.536692, 0.8901961, 1, 0, 1,
-0.8320365, -0.6892856, -0.729906, 0.8823529, 1, 0, 1,
-0.8189678, -1.320093, -1.582576, 0.8784314, 1, 0, 1,
-0.8149151, -0.9105663, -2.024814, 0.8705882, 1, 0, 1,
-0.8108675, 1.021826, -1.664442, 0.8666667, 1, 0, 1,
-0.8088861, 1.104156, 0.8549739, 0.8588235, 1, 0, 1,
-0.8062822, -1.314936, -2.091036, 0.854902, 1, 0, 1,
-0.80056, 0.008997909, -2.063839, 0.8470588, 1, 0, 1,
-0.7974747, 0.6775364, -1.344745, 0.8431373, 1, 0, 1,
-0.794193, 0.2885263, -2.77706, 0.8352941, 1, 0, 1,
-0.7915401, 0.8264733, -0.7979308, 0.8313726, 1, 0, 1,
-0.7865589, 0.5683156, -1.584377, 0.8235294, 1, 0, 1,
-0.7836674, -0.3396089, -3.049914, 0.8196079, 1, 0, 1,
-0.7796137, 0.05064316, -0.3932362, 0.8117647, 1, 0, 1,
-0.7793487, -0.1015355, -2.678279, 0.8078431, 1, 0, 1,
-0.7782962, -0.3149403, -2.799311, 0.8, 1, 0, 1,
-0.776925, -1.945236, -2.639605, 0.7921569, 1, 0, 1,
-0.7767373, -0.7543086, -0.739618, 0.7882353, 1, 0, 1,
-0.7766744, 0.735254, -2.001328, 0.7803922, 1, 0, 1,
-0.7740744, 0.06372178, -1.163595, 0.7764706, 1, 0, 1,
-0.7740502, 0.7875378, -1.259336, 0.7686275, 1, 0, 1,
-0.7733365, 1.140785, -1.734179, 0.7647059, 1, 0, 1,
-0.7666855, -0.7810292, -3.278652, 0.7568628, 1, 0, 1,
-0.7652323, -1.252701, -1.748042, 0.7529412, 1, 0, 1,
-0.7644565, -0.2613317, -2.179847, 0.7450981, 1, 0, 1,
-0.7571191, 2.357068, -2.241649, 0.7411765, 1, 0, 1,
-0.757031, -0.5471441, -0.992585, 0.7333333, 1, 0, 1,
-0.755843, -0.3031898, -1.162445, 0.7294118, 1, 0, 1,
-0.7505742, -0.6585517, -1.386025, 0.7215686, 1, 0, 1,
-0.7502509, 0.1152229, 0.01747461, 0.7176471, 1, 0, 1,
-0.7455939, 0.6587886, -0.7880914, 0.7098039, 1, 0, 1,
-0.7453936, -0.003217379, -4.540148, 0.7058824, 1, 0, 1,
-0.7424048, -0.2020898, -1.729665, 0.6980392, 1, 0, 1,
-0.7344189, 2.236953, -1.607365, 0.6901961, 1, 0, 1,
-0.7301515, 0.01205347, -1.515311, 0.6862745, 1, 0, 1,
-0.7299705, -0.3928107, -2.723753, 0.6784314, 1, 0, 1,
-0.7294809, 0.1911838, -1.4988, 0.6745098, 1, 0, 1,
-0.7294576, -1.386918, -1.915642, 0.6666667, 1, 0, 1,
-0.7263203, -0.6264232, -3.841766, 0.6627451, 1, 0, 1,
-0.7252063, 0.4783026, -2.264028, 0.654902, 1, 0, 1,
-0.7206813, 0.2533921, -0.7697683, 0.6509804, 1, 0, 1,
-0.7205628, -0.5785165, -3.340384, 0.6431373, 1, 0, 1,
-0.7173308, -0.8922933, -2.645617, 0.6392157, 1, 0, 1,
-0.7072895, -0.1279904, -0.4466657, 0.6313726, 1, 0, 1,
-0.7042232, 0.3096107, -1.021879, 0.627451, 1, 0, 1,
-0.6990528, -0.7774653, -3.159615, 0.6196079, 1, 0, 1,
-0.6986833, -0.6756281, -2.123465, 0.6156863, 1, 0, 1,
-0.6965225, 1.11031, -1.46586, 0.6078432, 1, 0, 1,
-0.6954834, 1.396358, 0.6311902, 0.6039216, 1, 0, 1,
-0.6934553, -1.615399, -2.176087, 0.5960785, 1, 0, 1,
-0.6881136, 1.615542, 0.1522365, 0.5882353, 1, 0, 1,
-0.6844077, -1.013657, -2.291761, 0.5843138, 1, 0, 1,
-0.6781271, -0.6517675, -3.594173, 0.5764706, 1, 0, 1,
-0.6755551, 0.7717656, -1.09776, 0.572549, 1, 0, 1,
-0.6739584, -1.966699, -3.294428, 0.5647059, 1, 0, 1,
-0.6730835, -1.078509, -1.937184, 0.5607843, 1, 0, 1,
-0.670024, 0.319062, -2.601494, 0.5529412, 1, 0, 1,
-0.6585165, -0.8902944, -2.952965, 0.5490196, 1, 0, 1,
-0.6486999, 1.142709, -0.3332313, 0.5411765, 1, 0, 1,
-0.6484722, -2.220088, -2.649101, 0.5372549, 1, 0, 1,
-0.6453625, -0.4271021, 0.4144236, 0.5294118, 1, 0, 1,
-0.643307, -0.8316997, -3.378968, 0.5254902, 1, 0, 1,
-0.6333624, 2.22299, 0.8288195, 0.5176471, 1, 0, 1,
-0.6330754, -2.036012, -3.894339, 0.5137255, 1, 0, 1,
-0.6201168, 1.206482, 0.5103288, 0.5058824, 1, 0, 1,
-0.6190282, 0.5413134, -1.039916, 0.5019608, 1, 0, 1,
-0.617622, -0.4178615, -1.383574, 0.4941176, 1, 0, 1,
-0.6138952, 0.1454361, -1.803229, 0.4862745, 1, 0, 1,
-0.6133692, 1.244829, 0.8788729, 0.4823529, 1, 0, 1,
-0.6109016, 0.3022971, -1.216181, 0.4745098, 1, 0, 1,
-0.6051678, -0.5612646, -0.274641, 0.4705882, 1, 0, 1,
-0.6046301, 0.7144154, 0.03685776, 0.4627451, 1, 0, 1,
-0.6042955, -0.4364048, -1.636713, 0.4588235, 1, 0, 1,
-0.6014426, -1.081723, -1.533154, 0.4509804, 1, 0, 1,
-0.6010295, 0.4864407, -0.9556304, 0.4470588, 1, 0, 1,
-0.5990414, 2.18434, -1.262395, 0.4392157, 1, 0, 1,
-0.5980706, -0.9244949, -2.783095, 0.4352941, 1, 0, 1,
-0.591708, 0.6121231, 0.2130472, 0.427451, 1, 0, 1,
-0.5886019, 0.7990933, -0.5155322, 0.4235294, 1, 0, 1,
-0.5882033, -1.616204, -3.162969, 0.4156863, 1, 0, 1,
-0.5874496, 1.003214, -0.9429174, 0.4117647, 1, 0, 1,
-0.5853458, -0.09981467, -3.223311, 0.4039216, 1, 0, 1,
-0.5853024, 1.253177, -1.487997, 0.3960784, 1, 0, 1,
-0.5810294, 2.266517, 0.2035307, 0.3921569, 1, 0, 1,
-0.5784212, -1.532873, -2.559179, 0.3843137, 1, 0, 1,
-0.5731424, -1.434779, -4.106658, 0.3803922, 1, 0, 1,
-0.5707176, 0.2527674, -3.014297, 0.372549, 1, 0, 1,
-0.5693702, 0.5938984, -0.4895242, 0.3686275, 1, 0, 1,
-0.5685552, -0.7651416, -1.223696, 0.3607843, 1, 0, 1,
-0.5651804, 0.634699, -0.2800804, 0.3568628, 1, 0, 1,
-0.5650085, 1.475386, -0.7740397, 0.3490196, 1, 0, 1,
-0.5643641, 0.6637778, -2.25478, 0.345098, 1, 0, 1,
-0.5640994, 1.229954, 0.1559584, 0.3372549, 1, 0, 1,
-0.5640402, -0.9621022, -3.27193, 0.3333333, 1, 0, 1,
-0.56001, -1.600585, -2.418768, 0.3254902, 1, 0, 1,
-0.5509374, -1.649203, -3.765867, 0.3215686, 1, 0, 1,
-0.5477399, 0.6871183, 0.09048768, 0.3137255, 1, 0, 1,
-0.5373879, -0.02050993, -1.167077, 0.3098039, 1, 0, 1,
-0.5366374, 0.006103095, -1.173313, 0.3019608, 1, 0, 1,
-0.5362663, -0.0289066, -2.026176, 0.2941177, 1, 0, 1,
-0.534463, 2.400761, -1.027021, 0.2901961, 1, 0, 1,
-0.532761, 1.084705, -1.327811, 0.282353, 1, 0, 1,
-0.5326671, -1.145046, -2.741197, 0.2784314, 1, 0, 1,
-0.5318056, -2.079321, -2.792701, 0.2705882, 1, 0, 1,
-0.5294178, -0.2436575, -1.415456, 0.2666667, 1, 0, 1,
-0.5200459, -0.6980064, -1.178026, 0.2588235, 1, 0, 1,
-0.5196123, 1.728774, -0.05193478, 0.254902, 1, 0, 1,
-0.5195262, -0.9705968, -2.4141, 0.2470588, 1, 0, 1,
-0.5113035, 2.895157, 0.296422, 0.2431373, 1, 0, 1,
-0.5110552, 0.7827054, -0.0908105, 0.2352941, 1, 0, 1,
-0.5036075, 0.563201, -0.02720365, 0.2313726, 1, 0, 1,
-0.4943527, 0.5398958, 0.2695338, 0.2235294, 1, 0, 1,
-0.4882385, -0.9623275, -2.049016, 0.2196078, 1, 0, 1,
-0.48655, 0.2243755, 1.210114, 0.2117647, 1, 0, 1,
-0.4798917, 1.197449, 2.682421, 0.2078431, 1, 0, 1,
-0.4789693, 1.687899, -0.4916197, 0.2, 1, 0, 1,
-0.4783905, 1.768638, -1.878493, 0.1921569, 1, 0, 1,
-0.4773419, 0.4535684, -1.503019, 0.1882353, 1, 0, 1,
-0.4769768, 1.339189, -0.7959295, 0.1803922, 1, 0, 1,
-0.4681625, -0.01492372, -1.237596, 0.1764706, 1, 0, 1,
-0.4652963, 0.6914154, 2.102348, 0.1686275, 1, 0, 1,
-0.4626393, -1.403152, -2.406581, 0.1647059, 1, 0, 1,
-0.4613585, -1.388149, -3.912879, 0.1568628, 1, 0, 1,
-0.4584193, 0.9278758, -0.9002565, 0.1529412, 1, 0, 1,
-0.457249, 0.2989272, -1.68713, 0.145098, 1, 0, 1,
-0.4557063, 0.9501973, 1.427043, 0.1411765, 1, 0, 1,
-0.4534469, 1.013451, -1.039748, 0.1333333, 1, 0, 1,
-0.4382772, -1.288514, -3.20981, 0.1294118, 1, 0, 1,
-0.4369953, 1.42321, -1.596253, 0.1215686, 1, 0, 1,
-0.4354898, -0.9358374, -1.437675, 0.1176471, 1, 0, 1,
-0.4302794, 0.7342824, 0.7237691, 0.1098039, 1, 0, 1,
-0.429268, 0.244539, 0.9228693, 0.1058824, 1, 0, 1,
-0.4275531, -0.340591, -2.792903, 0.09803922, 1, 0, 1,
-0.4270101, -1.033282, -1.32039, 0.09019608, 1, 0, 1,
-0.4260413, 0.3234033, -0.6208989, 0.08627451, 1, 0, 1,
-0.423592, -0.334272, -2.235119, 0.07843138, 1, 0, 1,
-0.4206348, -0.5216041, -1.812027, 0.07450981, 1, 0, 1,
-0.4201862, 2.059072, 1.062669, 0.06666667, 1, 0, 1,
-0.4163442, 0.3365722, -4.104984, 0.0627451, 1, 0, 1,
-0.4027228, 0.4996678, -0.6466382, 0.05490196, 1, 0, 1,
-0.3957711, -0.5426363, -3.174598, 0.05098039, 1, 0, 1,
-0.3930906, -1.596466, -1.575359, 0.04313726, 1, 0, 1,
-0.3914835, -0.9827931, -2.86543, 0.03921569, 1, 0, 1,
-0.3886674, -0.6098577, -2.344078, 0.03137255, 1, 0, 1,
-0.3869163, -1.638186, -4.425349, 0.02745098, 1, 0, 1,
-0.3848823, 0.5659752, 0.8535464, 0.01960784, 1, 0, 1,
-0.3793553, 0.4439637, -2.13807, 0.01568628, 1, 0, 1,
-0.3778493, 1.689437, 0.8216503, 0.007843138, 1, 0, 1,
-0.3771648, 0.4623275, -0.263115, 0.003921569, 1, 0, 1,
-0.3732378, -1.376234, -2.41504, 0, 1, 0.003921569, 1,
-0.3677341, -0.4453661, -1.700743, 0, 1, 0.01176471, 1,
-0.3606218, -0.4024663, -1.576215, 0, 1, 0.01568628, 1,
-0.3510632, -1.107831, -2.627449, 0, 1, 0.02352941, 1,
-0.3491939, 0.4039051, 0.1632371, 0, 1, 0.02745098, 1,
-0.3488551, 0.07070851, -1.116437, 0, 1, 0.03529412, 1,
-0.3455461, 1.809272, -0.5528181, 0, 1, 0.03921569, 1,
-0.344404, 1.497249, 0.7128296, 0, 1, 0.04705882, 1,
-0.3415997, 1.433372, -0.3680048, 0, 1, 0.05098039, 1,
-0.3391307, -1.676434, -2.977227, 0, 1, 0.05882353, 1,
-0.334655, 0.2033657, -1.04604, 0, 1, 0.0627451, 1,
-0.3312837, -2.085956, -2.209919, 0, 1, 0.07058824, 1,
-0.3294556, 0.03877385, -2.265148, 0, 1, 0.07450981, 1,
-0.3260392, 0.17154, -1.927966, 0, 1, 0.08235294, 1,
-0.3226959, 1.261423, -0.4760308, 0, 1, 0.08627451, 1,
-0.3115766, -0.8183712, -4.076986, 0, 1, 0.09411765, 1,
-0.3102026, 1.55167, 0.189477, 0, 1, 0.1019608, 1,
-0.3058317, 0.5489857, 0.5835848, 0, 1, 0.1058824, 1,
-0.3024148, -0.4203672, -3.058214, 0, 1, 0.1137255, 1,
-0.3001882, -1.104084, -3.814992, 0, 1, 0.1176471, 1,
-0.298308, -0.1124334, -0.7745072, 0, 1, 0.1254902, 1,
-0.2956493, 0.5905268, -2.654021, 0, 1, 0.1294118, 1,
-0.2948305, -0.1567636, -2.691041, 0, 1, 0.1372549, 1,
-0.289822, 0.8605108, 1.077704, 0, 1, 0.1411765, 1,
-0.2892785, 1.143756, -2.599993, 0, 1, 0.1490196, 1,
-0.2855335, -1.065371, -2.596215, 0, 1, 0.1529412, 1,
-0.2842936, 0.5252707, -0.6157729, 0, 1, 0.1607843, 1,
-0.2815986, -0.1338979, -2.62941, 0, 1, 0.1647059, 1,
-0.2730349, 0.7805358, 0.2256737, 0, 1, 0.172549, 1,
-0.2714983, 2.04365, -0.5420555, 0, 1, 0.1764706, 1,
-0.2696767, -0.9584432, -2.515134, 0, 1, 0.1843137, 1,
-0.2657969, -0.05025434, -2.166919, 0, 1, 0.1882353, 1,
-0.2602693, 0.9321886, -0.666872, 0, 1, 0.1960784, 1,
-0.2541736, 0.08141294, -1.620389, 0, 1, 0.2039216, 1,
-0.251298, -0.6079548, -1.894579, 0, 1, 0.2078431, 1,
-0.2509369, 0.7209748, 1.807058, 0, 1, 0.2156863, 1,
-0.2491705, 1.121027, -0.07035796, 0, 1, 0.2196078, 1,
-0.2384521, 0.6102762, -1.50368, 0, 1, 0.227451, 1,
-0.2357233, -0.7603908, -3.463634, 0, 1, 0.2313726, 1,
-0.234198, -0.5065286, -3.112938, 0, 1, 0.2392157, 1,
-0.2305086, -0.4972644, -2.48883, 0, 1, 0.2431373, 1,
-0.2267327, -1.62748, -1.087859, 0, 1, 0.2509804, 1,
-0.2213172, -0.4403906, -1.743307, 0, 1, 0.254902, 1,
-0.2204333, 0.4119905, 0.1730772, 0, 1, 0.2627451, 1,
-0.2183406, 1.77113, 1.811831, 0, 1, 0.2666667, 1,
-0.2140832, 0.9063824, -0.5948284, 0, 1, 0.2745098, 1,
-0.2101533, -1.137768, -3.471827, 0, 1, 0.2784314, 1,
-0.1996498, -1.300838, -1.727342, 0, 1, 0.2862745, 1,
-0.1949215, -0.2001377, -2.619168, 0, 1, 0.2901961, 1,
-0.1922334, -0.5666192, -1.797886, 0, 1, 0.2980392, 1,
-0.1909058, -0.2192802, -1.75387, 0, 1, 0.3058824, 1,
-0.1870116, 1.473962, -0.4794741, 0, 1, 0.3098039, 1,
-0.1861262, 0.2112753, -1.773698, 0, 1, 0.3176471, 1,
-0.1861004, -0.2774588, -1.700513, 0, 1, 0.3215686, 1,
-0.1847781, 1.769862, 0.9880868, 0, 1, 0.3294118, 1,
-0.1832954, 0.1489473, -2.039393, 0, 1, 0.3333333, 1,
-0.1789657, 0.6444784, -0.504337, 0, 1, 0.3411765, 1,
-0.1771325, 0.2598684, -0.6257649, 0, 1, 0.345098, 1,
-0.176666, -0.4088563, -3.262502, 0, 1, 0.3529412, 1,
-0.1759748, 2.241016, -0.646713, 0, 1, 0.3568628, 1,
-0.1731238, 0.9316829, -1.400973, 0, 1, 0.3647059, 1,
-0.1690696, -1.109978, -4.156188, 0, 1, 0.3686275, 1,
-0.1661766, -1.058238, -4.206796, 0, 1, 0.3764706, 1,
-0.164783, 0.2944075, 0.2685856, 0, 1, 0.3803922, 1,
-0.1635381, -0.7076656, -1.35106, 0, 1, 0.3882353, 1,
-0.1593246, -1.297795, -3.115433, 0, 1, 0.3921569, 1,
-0.1593184, 0.1369053, -0.9543173, 0, 1, 0.4, 1,
-0.1570709, -0.5806593, -2.413707, 0, 1, 0.4078431, 1,
-0.1560516, 0.4211435, -0.2956508, 0, 1, 0.4117647, 1,
-0.1551751, -1.029693, -2.685516, 0, 1, 0.4196078, 1,
-0.1500059, 0.4541666, -2.051542, 0, 1, 0.4235294, 1,
-0.1474308, -0.7332659, -2.115682, 0, 1, 0.4313726, 1,
-0.1470769, 1.141481, 1.038594, 0, 1, 0.4352941, 1,
-0.1386172, -0.6921549, -3.996135, 0, 1, 0.4431373, 1,
-0.1367482, -0.2601705, -2.965178, 0, 1, 0.4470588, 1,
-0.1335569, 0.8534676, -0.3825456, 0, 1, 0.454902, 1,
-0.1320207, 0.06632006, -0.8800415, 0, 1, 0.4588235, 1,
-0.1300258, 0.2079569, 0.357913, 0, 1, 0.4666667, 1,
-0.1256481, -1.803483, -4.207176, 0, 1, 0.4705882, 1,
-0.1234051, -0.2845249, -3.774569, 0, 1, 0.4784314, 1,
-0.1208798, -0.8304344, -1.32969, 0, 1, 0.4823529, 1,
-0.1184509, 0.2700949, -2.369319, 0, 1, 0.4901961, 1,
-0.1174865, -1.350663, -3.641576, 0, 1, 0.4941176, 1,
-0.114945, -0.5236337, -3.786465, 0, 1, 0.5019608, 1,
-0.1148332, 1.013173, 0.5589489, 0, 1, 0.509804, 1,
-0.1148137, 0.975104, -2.335636, 0, 1, 0.5137255, 1,
-0.1110139, -1.264434, -3.368281, 0, 1, 0.5215687, 1,
-0.1093737, -2.024552, -1.522433, 0, 1, 0.5254902, 1,
-0.1065381, -0.5598429, -3.850008, 0, 1, 0.5333334, 1,
-0.1023826, -0.1043611, -3.36812, 0, 1, 0.5372549, 1,
-0.1001625, 1.948913, 1.001283, 0, 1, 0.5450981, 1,
-0.09726828, -0.7772624, -2.819676, 0, 1, 0.5490196, 1,
-0.08816548, 1.003657, -1.002178, 0, 1, 0.5568628, 1,
-0.08785503, -0.8732494, -3.84471, 0, 1, 0.5607843, 1,
-0.08596499, -0.1284723, -3.597795, 0, 1, 0.5686275, 1,
-0.08427693, 0.791763, 1.321564, 0, 1, 0.572549, 1,
-0.08064329, 0.4340211, 0.5690894, 0, 1, 0.5803922, 1,
-0.07894447, -0.1787846, -3.097075, 0, 1, 0.5843138, 1,
-0.07755905, -0.7256742, -3.566682, 0, 1, 0.5921569, 1,
-0.0773517, 2.40324, -0.0831281, 0, 1, 0.5960785, 1,
-0.07624595, 1.609267, -0.5860804, 0, 1, 0.6039216, 1,
-0.0697884, 0.4142474, 0.3258404, 0, 1, 0.6117647, 1,
-0.06718912, -1.14021, -2.836157, 0, 1, 0.6156863, 1,
-0.06370315, -0.5070874, -2.401785, 0, 1, 0.6235294, 1,
-0.06030982, -0.6063492, -5.535584, 0, 1, 0.627451, 1,
-0.05599202, -1.052166, -1.628831, 0, 1, 0.6352941, 1,
-0.05553253, 0.8572276, 1.795562, 0, 1, 0.6392157, 1,
-0.05484163, 1.164458, 0.4482866, 0, 1, 0.6470588, 1,
-0.05305358, 0.03071685, -1.069422, 0, 1, 0.6509804, 1,
-0.05163412, -0.2054404, -3.202617, 0, 1, 0.6588235, 1,
-0.05099115, -1.205757, -4.285629, 0, 1, 0.6627451, 1,
-0.0505874, 1.160076, -1.219869, 0, 1, 0.6705883, 1,
-0.04856227, -0.6170709, -3.305859, 0, 1, 0.6745098, 1,
-0.04850056, -0.4792996, -2.626868, 0, 1, 0.682353, 1,
-0.04302596, -0.07305969, -4.069641, 0, 1, 0.6862745, 1,
-0.04231005, -0.6674761, -3.606886, 0, 1, 0.6941177, 1,
-0.03489666, 0.6962509, 1.333693, 0, 1, 0.7019608, 1,
-0.03460575, 0.1498526, -1.802684, 0, 1, 0.7058824, 1,
-0.03426494, -0.7197689, -3.1061, 0, 1, 0.7137255, 1,
-0.03097185, -0.7480225, -3.685542, 0, 1, 0.7176471, 1,
-0.0307176, 0.01110856, 0.4065064, 0, 1, 0.7254902, 1,
-0.0305243, 1.117471, 2.5493, 0, 1, 0.7294118, 1,
-0.0291594, 0.003827791, -3.095754, 0, 1, 0.7372549, 1,
-0.02786333, -1.730471, -3.687772, 0, 1, 0.7411765, 1,
-0.02688754, 1.016503, -0.5397676, 0, 1, 0.7490196, 1,
-0.02245262, -2.11133, -0.7386202, 0, 1, 0.7529412, 1,
-0.01977291, -0.1236758, -0.8121951, 0, 1, 0.7607843, 1,
-0.01889732, 2.172266, -1.079882, 0, 1, 0.7647059, 1,
-0.01790152, 1.296977, -0.3097773, 0, 1, 0.772549, 1,
-0.01774183, 1.126363, -1.081338, 0, 1, 0.7764706, 1,
-0.01610127, -0.4440006, -2.580915, 0, 1, 0.7843137, 1,
-0.01567323, 0.5423185, 0.5096295, 0, 1, 0.7882353, 1,
-0.00615005, 0.03988799, 0.449626, 0, 1, 0.7960784, 1,
-0.0005980107, -0.7200065, -1.308973, 0, 1, 0.8039216, 1,
0.0008477327, 0.508543, -0.1070852, 0, 1, 0.8078431, 1,
0.001479459, -0.6867078, 4.026821, 0, 1, 0.8156863, 1,
0.001657376, 1.03064, 0.5509658, 0, 1, 0.8196079, 1,
0.001714672, -1.540416, 2.149575, 0, 1, 0.827451, 1,
0.002639498, 1.386759, -0.2814851, 0, 1, 0.8313726, 1,
0.002984084, -1.194613, 3.581655, 0, 1, 0.8392157, 1,
0.00952537, -0.9202063, 4.159118, 0, 1, 0.8431373, 1,
0.01212704, -0.9538161, 2.30778, 0, 1, 0.8509804, 1,
0.01441723, 0.1718726, 0.4584499, 0, 1, 0.854902, 1,
0.01498578, -0.9128067, 2.396422, 0, 1, 0.8627451, 1,
0.01508499, -0.01496352, 3.625196, 0, 1, 0.8666667, 1,
0.02132655, 0.1760178, 0.7813816, 0, 1, 0.8745098, 1,
0.02146178, -1.088944, 3.925256, 0, 1, 0.8784314, 1,
0.02161113, -0.3607451, 2.329886, 0, 1, 0.8862745, 1,
0.02250177, 0.4868548, -1.48259, 0, 1, 0.8901961, 1,
0.02501609, 1.33621, -0.3321786, 0, 1, 0.8980392, 1,
0.02529546, 0.2259824, 0.2089364, 0, 1, 0.9058824, 1,
0.02933702, -0.1075794, 1.948418, 0, 1, 0.9098039, 1,
0.03150979, -0.5908259, 1.386225, 0, 1, 0.9176471, 1,
0.03468392, -1.202264, 4.717388, 0, 1, 0.9215686, 1,
0.04161063, -0.4498739, 2.912654, 0, 1, 0.9294118, 1,
0.0418934, 0.03959835, -0.035065, 0, 1, 0.9333333, 1,
0.04198038, -1.297546, 3.486969, 0, 1, 0.9411765, 1,
0.04286861, -0.8993052, 2.663579, 0, 1, 0.945098, 1,
0.04498037, 0.5688333, 0.07786024, 0, 1, 0.9529412, 1,
0.04649151, -0.8655694, 2.226098, 0, 1, 0.9568627, 1,
0.04725813, -0.9181711, 2.223429, 0, 1, 0.9647059, 1,
0.04995321, -0.2820396, 1.7383, 0, 1, 0.9686275, 1,
0.05245103, -0.6181887, 2.695828, 0, 1, 0.9764706, 1,
0.05259439, 0.3892114, -0.5948017, 0, 1, 0.9803922, 1,
0.05349969, -0.6284704, 1.760252, 0, 1, 0.9882353, 1,
0.05424418, -1.868987, 4.055618, 0, 1, 0.9921569, 1,
0.05553114, 1.017565, -1.057449, 0, 1, 1, 1,
0.06242054, -0.1609505, 3.15113, 0, 0.9921569, 1, 1,
0.06844701, 0.1152679, -0.4008669, 0, 0.9882353, 1, 1,
0.07279259, 0.4554262, -1.193084, 0, 0.9803922, 1, 1,
0.07296181, 0.179149, -1.27024, 0, 0.9764706, 1, 1,
0.07506709, 0.3047929, 2.429437, 0, 0.9686275, 1, 1,
0.07578972, -0.9465937, 2.588027, 0, 0.9647059, 1, 1,
0.07831611, 1.828763, 0.7767318, 0, 0.9568627, 1, 1,
0.08204097, 0.4187557, 1.40223, 0, 0.9529412, 1, 1,
0.08204223, 0.7416506, 0.5496462, 0, 0.945098, 1, 1,
0.08274679, 0.225763, 0.03514087, 0, 0.9411765, 1, 1,
0.08351123, -2.863677, 3.378926, 0, 0.9333333, 1, 1,
0.08564808, -0.1016903, 3.130678, 0, 0.9294118, 1, 1,
0.08593984, 0.9537765, 0.07430982, 0, 0.9215686, 1, 1,
0.08873168, 0.9415511, 0.3481823, 0, 0.9176471, 1, 1,
0.09046132, 0.209362, 0.2266701, 0, 0.9098039, 1, 1,
0.09102599, 0.6441036, -0.5842179, 0, 0.9058824, 1, 1,
0.09508437, 0.8658506, 2.835528, 0, 0.8980392, 1, 1,
0.09729093, -0.3567423, 3.351657, 0, 0.8901961, 1, 1,
0.09918635, 0.5422819, 0.2570984, 0, 0.8862745, 1, 1,
0.1027086, 0.09530305, 2.015819, 0, 0.8784314, 1, 1,
0.1058643, -0.9000895, 3.415623, 0, 0.8745098, 1, 1,
0.1093558, -0.6297456, 4.768789, 0, 0.8666667, 1, 1,
0.1163532, 1.058571, -1.47538, 0, 0.8627451, 1, 1,
0.1174458, 1.433316, 0.2118955, 0, 0.854902, 1, 1,
0.118021, 0.1549854, 0.2438327, 0, 0.8509804, 1, 1,
0.1191092, -1.082583, 3.667466, 0, 0.8431373, 1, 1,
0.1197757, -0.1016675, 2.560469, 0, 0.8392157, 1, 1,
0.1223165, 0.4461147, 0.5781167, 0, 0.8313726, 1, 1,
0.1228837, -0.9467015, 2.036436, 0, 0.827451, 1, 1,
0.1260184, -0.2299646, 3.081522, 0, 0.8196079, 1, 1,
0.1318021, 0.4076991, -0.3174278, 0, 0.8156863, 1, 1,
0.1346805, -0.200592, 1.059509, 0, 0.8078431, 1, 1,
0.1372947, -0.09210848, 1.575151, 0, 0.8039216, 1, 1,
0.1419979, 0.06734217, 2.521095, 0, 0.7960784, 1, 1,
0.1430968, 1.821676, -0.8500857, 0, 0.7882353, 1, 1,
0.1508559, 0.180885, -1.610783, 0, 0.7843137, 1, 1,
0.163456, -0.5823406, 2.370697, 0, 0.7764706, 1, 1,
0.1642714, 1.196863, -1.50498, 0, 0.772549, 1, 1,
0.1658018, 0.05564035, 2.106424, 0, 0.7647059, 1, 1,
0.1670292, -0.8903613, 2.37853, 0, 0.7607843, 1, 1,
0.1684696, 2.08145, 0.3884947, 0, 0.7529412, 1, 1,
0.1700492, -1.23899, 3.552623, 0, 0.7490196, 1, 1,
0.1702319, 1.177409, 0.4914979, 0, 0.7411765, 1, 1,
0.1712579, -0.4655934, 2.240821, 0, 0.7372549, 1, 1,
0.1783002, -1.420022, 3.031709, 0, 0.7294118, 1, 1,
0.1823108, -0.5765527, 1.388948, 0, 0.7254902, 1, 1,
0.1834391, 0.1322404, 0.5961742, 0, 0.7176471, 1, 1,
0.1852771, -2.217796, 1.974001, 0, 0.7137255, 1, 1,
0.1868099, 0.9172212, 0.3863474, 0, 0.7058824, 1, 1,
0.1927771, 0.3070785, 1.510212, 0, 0.6980392, 1, 1,
0.1961085, -0.06115092, 0.6857615, 0, 0.6941177, 1, 1,
0.2000467, 0.2029453, 1.035264, 0, 0.6862745, 1, 1,
0.2004706, 0.8265145, -0.4778037, 0, 0.682353, 1, 1,
0.2025364, 0.0714155, 0.7483876, 0, 0.6745098, 1, 1,
0.2058953, -1.190686, 2.964521, 0, 0.6705883, 1, 1,
0.207638, 0.5651694, 1.804883, 0, 0.6627451, 1, 1,
0.2109119, -0.5409237, 4.066189, 0, 0.6588235, 1, 1,
0.2142521, -1.375187, 3.969706, 0, 0.6509804, 1, 1,
0.2170533, -0.5126006, 3.166952, 0, 0.6470588, 1, 1,
0.217402, 0.2574252, 0.7141344, 0, 0.6392157, 1, 1,
0.2233815, -1.305749, 4.281458, 0, 0.6352941, 1, 1,
0.227432, 0.9926577, 1.419206, 0, 0.627451, 1, 1,
0.2277849, 0.898156, 0.1003412, 0, 0.6235294, 1, 1,
0.2281976, 0.5658746, -0.2172485, 0, 0.6156863, 1, 1,
0.230156, -0.9290562, 2.435422, 0, 0.6117647, 1, 1,
0.234898, 0.6998947, 0.8350053, 0, 0.6039216, 1, 1,
0.2452926, -0.5473519, 2.504173, 0, 0.5960785, 1, 1,
0.2472214, 1.425184, 0.7898105, 0, 0.5921569, 1, 1,
0.2483217, 0.9077227, 0.6243263, 0, 0.5843138, 1, 1,
0.249232, 0.3520847, 2.020255, 0, 0.5803922, 1, 1,
0.249633, -0.862406, 4.328039, 0, 0.572549, 1, 1,
0.2520536, 0.7310879, 0.1625173, 0, 0.5686275, 1, 1,
0.2535295, -2.02481, 2.130502, 0, 0.5607843, 1, 1,
0.2555203, 0.8340153, 1.26886, 0, 0.5568628, 1, 1,
0.2599807, -0.3171085, 2.777135, 0, 0.5490196, 1, 1,
0.2606051, 0.474259, -1.066473, 0, 0.5450981, 1, 1,
0.2636564, 0.06820715, 2.152985, 0, 0.5372549, 1, 1,
0.2651524, 0.8632053, 0.753196, 0, 0.5333334, 1, 1,
0.2675031, -0.4665468, 3.242106, 0, 0.5254902, 1, 1,
0.271541, -0.2690878, 2.680665, 0, 0.5215687, 1, 1,
0.2729275, -0.9094129, 1.434734, 0, 0.5137255, 1, 1,
0.2746412, -0.4641972, 2.848305, 0, 0.509804, 1, 1,
0.2751969, 0.9451754, 1.533413, 0, 0.5019608, 1, 1,
0.2762755, -1.15239, 1.222855, 0, 0.4941176, 1, 1,
0.2779426, -1.219683, 3.078887, 0, 0.4901961, 1, 1,
0.2796757, -0.4812899, 2.22494, 0, 0.4823529, 1, 1,
0.2835094, 1.020416, -0.1949796, 0, 0.4784314, 1, 1,
0.2866717, 0.2705221, 1.591691, 0, 0.4705882, 1, 1,
0.2869825, 0.04198621, 1.631266, 0, 0.4666667, 1, 1,
0.2894228, -0.2936816, 1.713964, 0, 0.4588235, 1, 1,
0.2916088, -0.4189506, 2.041691, 0, 0.454902, 1, 1,
0.2966999, 0.7888912, 1.060896, 0, 0.4470588, 1, 1,
0.2979433, 0.9350361, -1.236431, 0, 0.4431373, 1, 1,
0.2981932, 0.7252693, 0.9802058, 0, 0.4352941, 1, 1,
0.3034741, -0.3066962, 1.351539, 0, 0.4313726, 1, 1,
0.3044116, -0.133998, 2.090373, 0, 0.4235294, 1, 1,
0.3106557, -0.2726536, 1.702262, 0, 0.4196078, 1, 1,
0.3121525, 0.4021999, -0.06563758, 0, 0.4117647, 1, 1,
0.3129595, 0.3518924, -0.1757788, 0, 0.4078431, 1, 1,
0.3179286, -0.3820971, 2.171258, 0, 0.4, 1, 1,
0.3184328, 0.8281186, 1.68144, 0, 0.3921569, 1, 1,
0.3185342, -0.5068651, 1.805438, 0, 0.3882353, 1, 1,
0.3256874, -0.2276462, 3.17084, 0, 0.3803922, 1, 1,
0.3260552, 0.006447313, 2.358176, 0, 0.3764706, 1, 1,
0.3261295, 0.585884, 0.2938396, 0, 0.3686275, 1, 1,
0.3277465, 1.441436, 0.956989, 0, 0.3647059, 1, 1,
0.3280668, -0.501788, 2.426749, 0, 0.3568628, 1, 1,
0.3356852, -1.345417, 2.115105, 0, 0.3529412, 1, 1,
0.3359753, 0.7454621, -1.063745, 0, 0.345098, 1, 1,
0.3365785, -0.2792791, 3.747357, 0, 0.3411765, 1, 1,
0.3365861, -0.158226, 2.218291, 0, 0.3333333, 1, 1,
0.3393244, 1.815041, 0.03296778, 0, 0.3294118, 1, 1,
0.3407463, -0.6283352, 2.130627, 0, 0.3215686, 1, 1,
0.341389, 0.08094977, 2.349609, 0, 0.3176471, 1, 1,
0.3452207, -0.3260671, 3.54899, 0, 0.3098039, 1, 1,
0.3480694, 0.5290416, -0.8695678, 0, 0.3058824, 1, 1,
0.3488882, 0.1755903, 0.5250607, 0, 0.2980392, 1, 1,
0.3493785, -0.1817183, 1.656664, 0, 0.2901961, 1, 1,
0.3502207, 0.6960987, -0.1271786, 0, 0.2862745, 1, 1,
0.3503945, 0.6850583, -0.1003691, 0, 0.2784314, 1, 1,
0.3507598, -0.4768333, 2.94836, 0, 0.2745098, 1, 1,
0.3508061, 0.1158939, 1.438038, 0, 0.2666667, 1, 1,
0.3530516, 1.573023, 1.447034, 0, 0.2627451, 1, 1,
0.3582042, 1.420243, -1.053121, 0, 0.254902, 1, 1,
0.3597419, 0.02857883, 1.690444, 0, 0.2509804, 1, 1,
0.3621404, -0.4724964, 2.392718, 0, 0.2431373, 1, 1,
0.3658907, -0.4560761, 2.902145, 0, 0.2392157, 1, 1,
0.3672144, 1.377423, 0.6480902, 0, 0.2313726, 1, 1,
0.3689794, -0.8044721, 1.799679, 0, 0.227451, 1, 1,
0.3745096, 0.4318295, -0.5911668, 0, 0.2196078, 1, 1,
0.3786112, -1.16539, 3.843847, 0, 0.2156863, 1, 1,
0.3790992, -1.647492, 1.753932, 0, 0.2078431, 1, 1,
0.3836715, -0.5724142, 2.30514, 0, 0.2039216, 1, 1,
0.3903828, 0.3222208, 1.253433, 0, 0.1960784, 1, 1,
0.3909123, 0.9087037, -0.09738714, 0, 0.1882353, 1, 1,
0.3957123, -0.2001219, 2.772292, 0, 0.1843137, 1, 1,
0.3958353, -2.097755, -0.1777767, 0, 0.1764706, 1, 1,
0.3987049, 1.149251, 0.3407932, 0, 0.172549, 1, 1,
0.3987167, 0.9343675, 1.115967, 0, 0.1647059, 1, 1,
0.3999874, 0.1112069, 1.36012, 0, 0.1607843, 1, 1,
0.4034003, -1.536142, 3.989387, 0, 0.1529412, 1, 1,
0.4034214, 0.3680137, 1.819625, 0, 0.1490196, 1, 1,
0.4042137, 0.3069176, 1.06377, 0, 0.1411765, 1, 1,
0.4044995, -0.5077949, 3.677279, 0, 0.1372549, 1, 1,
0.408187, -1.012875, 3.211392, 0, 0.1294118, 1, 1,
0.4096018, -0.6132355, 1.242549, 0, 0.1254902, 1, 1,
0.4130867, 1.170509, 1.13953, 0, 0.1176471, 1, 1,
0.4146106, -0.1516421, 0.4467419, 0, 0.1137255, 1, 1,
0.425496, -0.5319182, 1.758571, 0, 0.1058824, 1, 1,
0.4327663, 0.9479737, 1.907694, 0, 0.09803922, 1, 1,
0.4334535, -1.566599, 1.939169, 0, 0.09411765, 1, 1,
0.4354182, 0.4057437, -0.3872272, 0, 0.08627451, 1, 1,
0.436229, -0.3478372, 3.750445, 0, 0.08235294, 1, 1,
0.4394356, 0.5058649, 3.181801, 0, 0.07450981, 1, 1,
0.4519355, 0.7251437, 1.954971, 0, 0.07058824, 1, 1,
0.4547632, -0.2131057, 2.537607, 0, 0.0627451, 1, 1,
0.4571613, 1.18345, 0.3121673, 0, 0.05882353, 1, 1,
0.4579863, 1.100802, 0.58409, 0, 0.05098039, 1, 1,
0.4585357, -0.1506185, 0.6078213, 0, 0.04705882, 1, 1,
0.4612364, 0.7846615, -0.5427219, 0, 0.03921569, 1, 1,
0.4657446, 0.03484707, 1.560176, 0, 0.03529412, 1, 1,
0.4726966, 0.6570078, -0.01136293, 0, 0.02745098, 1, 1,
0.4742851, 1.225905, -0.2635551, 0, 0.02352941, 1, 1,
0.4773157, -0.6221799, 2.740381, 0, 0.01568628, 1, 1,
0.4823423, 0.4446845, 1.906458, 0, 0.01176471, 1, 1,
0.4853073, 1.111585, -0.1918217, 0, 0.003921569, 1, 1,
0.4861902, -1.266786, 3.124935, 0.003921569, 0, 1, 1,
0.4890569, -0.7934848, 1.983107, 0.007843138, 0, 1, 1,
0.4894513, 0.01036636, 1.788842, 0.01568628, 0, 1, 1,
0.497468, -0.4359664, 1.052191, 0.01960784, 0, 1, 1,
0.4984493, 0.09131165, 0.445567, 0.02745098, 0, 1, 1,
0.5004624, -1.461933, 3.994342, 0.03137255, 0, 1, 1,
0.5013787, 0.2302939, 0.9623976, 0.03921569, 0, 1, 1,
0.5075155, 0.6319225, 1.598882, 0.04313726, 0, 1, 1,
0.5111781, 0.05591311, 2.267945, 0.05098039, 0, 1, 1,
0.5123066, 1.601337, 0.5096478, 0.05490196, 0, 1, 1,
0.5128323, 0.4328524, 0.6076425, 0.0627451, 0, 1, 1,
0.5173241, 1.178428, 0.6327594, 0.06666667, 0, 1, 1,
0.517536, 0.7791263, -0.4845188, 0.07450981, 0, 1, 1,
0.5208158, 0.5782334, -0.075831, 0.07843138, 0, 1, 1,
0.5248775, 0.6368428, 1.581926, 0.08627451, 0, 1, 1,
0.5281076, 0.3314419, 0.6445463, 0.09019608, 0, 1, 1,
0.5301887, 1.05781, 0.2050671, 0.09803922, 0, 1, 1,
0.5306079, -1.762212, 1.302683, 0.1058824, 0, 1, 1,
0.5312453, -0.03521857, 1.099167, 0.1098039, 0, 1, 1,
0.535802, -0.5143149, 2.493588, 0.1176471, 0, 1, 1,
0.5379837, -1.623371, 1.866506, 0.1215686, 0, 1, 1,
0.5392491, 0.4356176, 0.9012337, 0.1294118, 0, 1, 1,
0.5411755, 0.3058204, 1.114085, 0.1333333, 0, 1, 1,
0.5412272, 1.38596, 0.4338212, 0.1411765, 0, 1, 1,
0.5463256, -0.4650111, 1.04718, 0.145098, 0, 1, 1,
0.5530914, -0.4164428, 2.39931, 0.1529412, 0, 1, 1,
0.5537034, 0.6577028, 0.8130063, 0.1568628, 0, 1, 1,
0.5546649, -0.6193326, 2.301703, 0.1647059, 0, 1, 1,
0.5547907, 0.7827163, 1.644141, 0.1686275, 0, 1, 1,
0.559697, 0.2540647, 0.253235, 0.1764706, 0, 1, 1,
0.5598024, 0.8957044, 0.3114135, 0.1803922, 0, 1, 1,
0.5598894, -1.931265, 5.624605, 0.1882353, 0, 1, 1,
0.5610142, 0.5057952, 2.179707, 0.1921569, 0, 1, 1,
0.5611163, -0.07453838, 1.709718, 0.2, 0, 1, 1,
0.5655316, -1.085626, 3.578518, 0.2078431, 0, 1, 1,
0.5673954, -0.5473837, 1.831511, 0.2117647, 0, 1, 1,
0.5684242, -0.08563203, 1.677629, 0.2196078, 0, 1, 1,
0.5703555, -0.1419612, 0.02332265, 0.2235294, 0, 1, 1,
0.5712006, 1.241313, 1.845338, 0.2313726, 0, 1, 1,
0.5811703, -1.732552, 2.958576, 0.2352941, 0, 1, 1,
0.5817152, -0.00729237, 2.434427, 0.2431373, 0, 1, 1,
0.5835588, 2.446789, -2.395682, 0.2470588, 0, 1, 1,
0.5857206, -1.032971, 3.519267, 0.254902, 0, 1, 1,
0.5871754, 0.3084583, 1.327794, 0.2588235, 0, 1, 1,
0.5895495, -1.569554, 3.18282, 0.2666667, 0, 1, 1,
0.5961717, 0.2731113, -0.01945053, 0.2705882, 0, 1, 1,
0.5965163, 0.1091648, 2.032886, 0.2784314, 0, 1, 1,
0.5969695, 0.8969692, -0.5141947, 0.282353, 0, 1, 1,
0.6029318, -1.202436, 3.790685, 0.2901961, 0, 1, 1,
0.6049587, 1.211793, -1.255999, 0.2941177, 0, 1, 1,
0.6058512, -0.5982631, 2.76478, 0.3019608, 0, 1, 1,
0.6064101, 0.7932982, 2.960787, 0.3098039, 0, 1, 1,
0.6107301, 0.2388982, 1.937882, 0.3137255, 0, 1, 1,
0.6268992, 0.6645684, 1.519129, 0.3215686, 0, 1, 1,
0.6292726, -1.192399, 2.089176, 0.3254902, 0, 1, 1,
0.6294317, 0.0713627, 0.6129426, 0.3333333, 0, 1, 1,
0.630284, 0.03267778, 1.337853, 0.3372549, 0, 1, 1,
0.6316813, -0.01601254, 1.972724, 0.345098, 0, 1, 1,
0.6343536, -0.5586799, 1.823883, 0.3490196, 0, 1, 1,
0.6363117, -0.6251213, 1.062124, 0.3568628, 0, 1, 1,
0.6436214, 1.410003, -0.02960635, 0.3607843, 0, 1, 1,
0.6453647, -0.05370282, -0.1902728, 0.3686275, 0, 1, 1,
0.6471283, -0.4684379, 0.7526658, 0.372549, 0, 1, 1,
0.650869, 2.131073, -0.9540981, 0.3803922, 0, 1, 1,
0.6547816, 0.3442731, 0.7144492, 0.3843137, 0, 1, 1,
0.6578842, 1.875834, 0.1620411, 0.3921569, 0, 1, 1,
0.6608623, 0.1721223, 0.2401438, 0.3960784, 0, 1, 1,
0.6721349, 0.7719195, 0.4491515, 0.4039216, 0, 1, 1,
0.6755913, -1.069481, 4.290604, 0.4117647, 0, 1, 1,
0.6768082, -0.5927055, 2.396208, 0.4156863, 0, 1, 1,
0.6769189, -1.751867, 1.594469, 0.4235294, 0, 1, 1,
0.679997, -2.078852, 0.6524072, 0.427451, 0, 1, 1,
0.6808206, 0.5084096, 0.5164097, 0.4352941, 0, 1, 1,
0.6911945, 0.3624639, 1.486107, 0.4392157, 0, 1, 1,
0.6923527, 1.031377, -0.2251275, 0.4470588, 0, 1, 1,
0.6949562, 1.987119, -0.6297309, 0.4509804, 0, 1, 1,
0.6960743, 0.5113075, 1.421089, 0.4588235, 0, 1, 1,
0.6963218, -2.416375, 4.109535, 0.4627451, 0, 1, 1,
0.6976514, 1.212746, 0.5043224, 0.4705882, 0, 1, 1,
0.6994992, -0.8241923, 4.1054, 0.4745098, 0, 1, 1,
0.701951, -0.4009521, 0.6337094, 0.4823529, 0, 1, 1,
0.7022656, -2.618582, 1.339943, 0.4862745, 0, 1, 1,
0.7027351, -0.9848706, 2.072607, 0.4941176, 0, 1, 1,
0.7033917, 0.5260001, -0.1526644, 0.5019608, 0, 1, 1,
0.707465, -0.2584528, 2.567695, 0.5058824, 0, 1, 1,
0.7137148, 1.098283, 1.624534, 0.5137255, 0, 1, 1,
0.7151271, -0.6822416, 2.396097, 0.5176471, 0, 1, 1,
0.7167983, -1.932918, 2.706868, 0.5254902, 0, 1, 1,
0.7243726, -0.8825861, 1.632006, 0.5294118, 0, 1, 1,
0.7255875, 2.039912, -0.08616666, 0.5372549, 0, 1, 1,
0.7329161, -1.466107, 2.955194, 0.5411765, 0, 1, 1,
0.7363133, 0.5399656, 2.857735, 0.5490196, 0, 1, 1,
0.7373807, -0.9954616, 2.60452, 0.5529412, 0, 1, 1,
0.7454573, -0.3017029, 1.405405, 0.5607843, 0, 1, 1,
0.7475361, -2.250575, 2.294379, 0.5647059, 0, 1, 1,
0.7483743, -0.3618253, 0.2531488, 0.572549, 0, 1, 1,
0.7506469, -1.218368, 3.041869, 0.5764706, 0, 1, 1,
0.753505, 0.2340938, 2.404042, 0.5843138, 0, 1, 1,
0.757676, 0.7364466, -0.69594, 0.5882353, 0, 1, 1,
0.7650308, -0.1959181, 3.139144, 0.5960785, 0, 1, 1,
0.7661766, 1.249805, 0.5579224, 0.6039216, 0, 1, 1,
0.7677057, 1.188397, 1.660995, 0.6078432, 0, 1, 1,
0.7809365, 0.9193335, 0.735409, 0.6156863, 0, 1, 1,
0.7819256, 0.4889882, 1.72009, 0.6196079, 0, 1, 1,
0.7822629, -1.09986, 2.85407, 0.627451, 0, 1, 1,
0.7856136, 0.4299735, 1.1648, 0.6313726, 0, 1, 1,
0.7890096, 0.9988618, 1.254258, 0.6392157, 0, 1, 1,
0.7942845, -1.705345, 1.656021, 0.6431373, 0, 1, 1,
0.7991278, -0.1305334, 2.364288, 0.6509804, 0, 1, 1,
0.7992657, 1.726453, 0.7893746, 0.654902, 0, 1, 1,
0.8051216, 1.697481, -0.07276859, 0.6627451, 0, 1, 1,
0.8053994, 0.8223844, 1.559705, 0.6666667, 0, 1, 1,
0.8082121, -1.20251, 1.871246, 0.6745098, 0, 1, 1,
0.8138251, -1.590753, 2.748385, 0.6784314, 0, 1, 1,
0.8161765, -1.030522, 2.151852, 0.6862745, 0, 1, 1,
0.8163252, -0.317186, 0.5601529, 0.6901961, 0, 1, 1,
0.8257118, 0.3394519, -0.9253413, 0.6980392, 0, 1, 1,
0.8264194, -0.6942546, 2.190889, 0.7058824, 0, 1, 1,
0.8359471, 0.768103, -1.178559, 0.7098039, 0, 1, 1,
0.8364987, 0.2169644, -0.4191937, 0.7176471, 0, 1, 1,
0.8394962, -0.3893035, 2.89677, 0.7215686, 0, 1, 1,
0.8400923, 0.6074363, 1.868083, 0.7294118, 0, 1, 1,
0.8407952, 0.4260246, 0.5997653, 0.7333333, 0, 1, 1,
0.8458091, -1.206207, 2.918596, 0.7411765, 0, 1, 1,
0.8464549, 0.5855837, 1.732365, 0.7450981, 0, 1, 1,
0.8555549, 0.5746059, 3.728042, 0.7529412, 0, 1, 1,
0.8584392, -2.028173, 3.396989, 0.7568628, 0, 1, 1,
0.8608286, -0.9529705, 4.776641, 0.7647059, 0, 1, 1,
0.8636018, 1.460413, -0.4153383, 0.7686275, 0, 1, 1,
0.8655829, 0.1585585, 1.682622, 0.7764706, 0, 1, 1,
0.8780543, -0.113777, 1.215158, 0.7803922, 0, 1, 1,
0.8788818, -0.2851064, 2.764, 0.7882353, 0, 1, 1,
0.8791854, 1.670575, -1.354832, 0.7921569, 0, 1, 1,
0.8872847, 0.8592641, 0.7263804, 0.8, 0, 1, 1,
0.887298, -0.1662801, 2.278942, 0.8078431, 0, 1, 1,
0.8904799, 0.1774341, 2.37702, 0.8117647, 0, 1, 1,
0.8937229, -0.3115744, 2.229029, 0.8196079, 0, 1, 1,
0.8948209, 0.5328691, -0.2419457, 0.8235294, 0, 1, 1,
0.8964168, 0.3032988, 1.201003, 0.8313726, 0, 1, 1,
0.8976156, -0.3434832, 3.536391, 0.8352941, 0, 1, 1,
0.8993925, 0.2871712, 1.296482, 0.8431373, 0, 1, 1,
0.9055899, 0.905213, 3.444102, 0.8470588, 0, 1, 1,
0.9060211, -1.197531, 3.960972, 0.854902, 0, 1, 1,
0.9112725, -0.7311043, 1.743196, 0.8588235, 0, 1, 1,
0.9155008, 0.5046123, 2.283492, 0.8666667, 0, 1, 1,
0.9170799, -1.628715, 3.318539, 0.8705882, 0, 1, 1,
0.9200812, 0.5336395, 0.4944438, 0.8784314, 0, 1, 1,
0.9203089, -1.860978, 1.709941, 0.8823529, 0, 1, 1,
0.9217721, 0.1276525, 0.06404101, 0.8901961, 0, 1, 1,
0.9245614, -0.5623488, 1.695792, 0.8941177, 0, 1, 1,
0.9335189, 1.124265, 1.470702, 0.9019608, 0, 1, 1,
0.9341182, -0.6109245, 0.6759307, 0.9098039, 0, 1, 1,
0.935705, 0.2567234, 1.613348, 0.9137255, 0, 1, 1,
0.9360745, -0.7759052, 2.364443, 0.9215686, 0, 1, 1,
0.9361397, 0.09387771, 2.38028, 0.9254902, 0, 1, 1,
0.9398597, 1.156544, 0.520784, 0.9333333, 0, 1, 1,
0.9427006, -1.525351, 2.3698, 0.9372549, 0, 1, 1,
0.9437792, 0.4254209, 1.50023, 0.945098, 0, 1, 1,
0.9458851, 0.1839097, 1.482584, 0.9490196, 0, 1, 1,
0.9478401, 0.9237313, 0.9899293, 0.9568627, 0, 1, 1,
0.9527645, 1.065241, 1.884701, 0.9607843, 0, 1, 1,
0.9609546, -1.976759, 2.62931, 0.9686275, 0, 1, 1,
0.9664007, -1.805451, 2.763474, 0.972549, 0, 1, 1,
0.970181, 0.1691064, 3.757519, 0.9803922, 0, 1, 1,
0.985074, 0.1236795, 0.3409933, 0.9843137, 0, 1, 1,
0.9877409, -0.8788531, 1.14837, 0.9921569, 0, 1, 1,
0.9880688, 0.328765, 4.027932, 0.9960784, 0, 1, 1,
0.9899056, -0.6197079, 2.394162, 1, 0, 0.9960784, 1,
0.9934319, 0.4458994, 1.109742, 1, 0, 0.9882353, 1,
0.9939697, -2.308592, 4.551793, 1, 0, 0.9843137, 1,
0.9955359, 0.104582, 2.482494, 1, 0, 0.9764706, 1,
0.9977237, 0.1238743, 1.498614, 1, 0, 0.972549, 1,
0.9985065, -0.08893423, 0.3887845, 1, 0, 0.9647059, 1,
1.000367, -1.506999, 2.402218, 1, 0, 0.9607843, 1,
1.006002, -1.667386, 2.484869, 1, 0, 0.9529412, 1,
1.009044, 0.6716383, 1.315824, 1, 0, 0.9490196, 1,
1.010158, -0.1415015, 1.707471, 1, 0, 0.9411765, 1,
1.011649, -0.4586531, 1.109414, 1, 0, 0.9372549, 1,
1.012316, 1.175993, -1.289806, 1, 0, 0.9294118, 1,
1.015707, 0.598737, 0.7491989, 1, 0, 0.9254902, 1,
1.019289, -0.1543525, 2.275571, 1, 0, 0.9176471, 1,
1.027894, 0.3050569, 1.86774, 1, 0, 0.9137255, 1,
1.038652, -0.312296, 0.4446637, 1, 0, 0.9058824, 1,
1.0512, -1.391096, 1.627593, 1, 0, 0.9019608, 1,
1.052678, -1.311904, 1.925755, 1, 0, 0.8941177, 1,
1.05886, -0.2122677, 0.62141, 1, 0, 0.8862745, 1,
1.059253, 0.6299134, 0.1337922, 1, 0, 0.8823529, 1,
1.06235, -0.1913315, 0.5937009, 1, 0, 0.8745098, 1,
1.06475, -0.7892911, 2.968889, 1, 0, 0.8705882, 1,
1.071163, 1.538101, 0.3477531, 1, 0, 0.8627451, 1,
1.072931, -1.591005, 2.172411, 1, 0, 0.8588235, 1,
1.085501, -0.5020398, 3.567452, 1, 0, 0.8509804, 1,
1.089694, 2.226935, 1.397534, 1, 0, 0.8470588, 1,
1.093112, -0.1949552, 1.369996, 1, 0, 0.8392157, 1,
1.102137, -1.743782, 3.594975, 1, 0, 0.8352941, 1,
1.107191, 0.4811253, 2.572817, 1, 0, 0.827451, 1,
1.109005, -2.208295, 0.8139832, 1, 0, 0.8235294, 1,
1.112907, 0.339622, 1.588676, 1, 0, 0.8156863, 1,
1.13668, -0.4936637, 0.7386173, 1, 0, 0.8117647, 1,
1.138973, -1.673102, 2.397319, 1, 0, 0.8039216, 1,
1.1395, 1.409958, 0.8574153, 1, 0, 0.7960784, 1,
1.1404, -0.601, 1.831825, 1, 0, 0.7921569, 1,
1.144306, -1.311979, 5.901729, 1, 0, 0.7843137, 1,
1.147205, 0.934879, 1.197748, 1, 0, 0.7803922, 1,
1.148919, -1.247545, 2.696298, 1, 0, 0.772549, 1,
1.148975, 0.2976865, 1.538609, 1, 0, 0.7686275, 1,
1.151199, -0.6584435, 3.378465, 1, 0, 0.7607843, 1,
1.163491, 0.6776231, 0.959624, 1, 0, 0.7568628, 1,
1.164967, 0.5489569, 3.045885, 1, 0, 0.7490196, 1,
1.179578, 0.2285139, 0.455229, 1, 0, 0.7450981, 1,
1.1797, 0.4041612, -0.4545338, 1, 0, 0.7372549, 1,
1.187326, -0.7849188, 2.901712, 1, 0, 0.7333333, 1,
1.187573, 1.592549, 1.453429, 1, 0, 0.7254902, 1,
1.190618, -0.6171986, 3.163017, 1, 0, 0.7215686, 1,
1.193767, -1.839008, 2.223984, 1, 0, 0.7137255, 1,
1.201085, 0.1096217, 1.512499, 1, 0, 0.7098039, 1,
1.215426, -1.733654, 3.613179, 1, 0, 0.7019608, 1,
1.219447, -1.985722, 2.870153, 1, 0, 0.6941177, 1,
1.222443, 0.3887412, 0.6266904, 1, 0, 0.6901961, 1,
1.228498, -1.217803, 1.92002, 1, 0, 0.682353, 1,
1.238315, 0.1924025, 1.866154, 1, 0, 0.6784314, 1,
1.248385, -0.009148753, 1.919195, 1, 0, 0.6705883, 1,
1.258423, 0.7047867, 2.637226, 1, 0, 0.6666667, 1,
1.270898, 0.9465598, -0.08306338, 1, 0, 0.6588235, 1,
1.27638, -1.368307, 2.372697, 1, 0, 0.654902, 1,
1.280793, -0.1764777, 3.960847, 1, 0, 0.6470588, 1,
1.28306, 0.621872, 0.5944206, 1, 0, 0.6431373, 1,
1.28417, 0.3274072, 1.215718, 1, 0, 0.6352941, 1,
1.28585, 0.4315824, 0.9833236, 1, 0, 0.6313726, 1,
1.29943, 0.03502692, 1.792565, 1, 0, 0.6235294, 1,
1.309109, 0.7539734, 0.3432397, 1, 0, 0.6196079, 1,
1.312365, -0.5716927, 1.923294, 1, 0, 0.6117647, 1,
1.326382, -0.01915533, 0.7127267, 1, 0, 0.6078432, 1,
1.342762, -1.000781, 2.117062, 1, 0, 0.6, 1,
1.345547, 1.463581, 1.390473, 1, 0, 0.5921569, 1,
1.346363, 0.199346, 1.529345, 1, 0, 0.5882353, 1,
1.34742, 0.4567424, 0.1116366, 1, 0, 0.5803922, 1,
1.348011, -0.8950047, 2.056734, 1, 0, 0.5764706, 1,
1.350105, 0.655836, 1.217288, 1, 0, 0.5686275, 1,
1.354642, 1.08147, 1.815325, 1, 0, 0.5647059, 1,
1.371137, 0.1892986, 2.385405, 1, 0, 0.5568628, 1,
1.372369, 1.887908, -2.144401, 1, 0, 0.5529412, 1,
1.38399, -0.6462399, 2.695633, 1, 0, 0.5450981, 1,
1.385922, 0.3244655, 1.716206, 1, 0, 0.5411765, 1,
1.399637, -0.8057415, 1.799073, 1, 0, 0.5333334, 1,
1.401778, -0.9186321, 2.514394, 1, 0, 0.5294118, 1,
1.405663, 2.531488, -0.6137506, 1, 0, 0.5215687, 1,
1.421937, -1.212257, 2.944739, 1, 0, 0.5176471, 1,
1.432515, 0.006042794, 0.5642469, 1, 0, 0.509804, 1,
1.436018, -0.6050986, 3.900434, 1, 0, 0.5058824, 1,
1.449704, -0.729218, 1.502378, 1, 0, 0.4980392, 1,
1.451233, 0.7468719, -0.004777652, 1, 0, 0.4901961, 1,
1.454433, -0.1242148, 1.612451, 1, 0, 0.4862745, 1,
1.468363, 0.3536844, 2.116923, 1, 0, 0.4784314, 1,
1.469113, -0.1515752, 1.386352, 1, 0, 0.4745098, 1,
1.471496, 0.4561766, -0.4674794, 1, 0, 0.4666667, 1,
1.478026, -0.2454527, 2.031473, 1, 0, 0.4627451, 1,
1.478678, 0.1012776, 1.593948, 1, 0, 0.454902, 1,
1.479912, 1.647136, 0.4873976, 1, 0, 0.4509804, 1,
1.485937, -0.4809657, 1.953148, 1, 0, 0.4431373, 1,
1.487429, -0.4719913, 2.199696, 1, 0, 0.4392157, 1,
1.50635, -1.0881, 2.056139, 1, 0, 0.4313726, 1,
1.508069, 1.034783, 0.2088041, 1, 0, 0.427451, 1,
1.509443, -0.1114037, 1.559002, 1, 0, 0.4196078, 1,
1.510434, -0.1958565, 2.182672, 1, 0, 0.4156863, 1,
1.515595, 0.4826606, 0.8672452, 1, 0, 0.4078431, 1,
1.522493, -1.176242, 1.626065, 1, 0, 0.4039216, 1,
1.52277, -0.5457084, 2.568918, 1, 0, 0.3960784, 1,
1.53278, 1.071014, -0.06604674, 1, 0, 0.3882353, 1,
1.534697, 1.273937, 1.517219, 1, 0, 0.3843137, 1,
1.539718, -0.6828166, 2.044338, 1, 0, 0.3764706, 1,
1.542271, -1.282461, 3.937155, 1, 0, 0.372549, 1,
1.5427, -0.03282153, 3.451797, 1, 0, 0.3647059, 1,
1.545744, 1.258149, 1.03276, 1, 0, 0.3607843, 1,
1.564708, -0.4223718, 1.103559, 1, 0, 0.3529412, 1,
1.568442, 1.154169, 1.729502, 1, 0, 0.3490196, 1,
1.57343, -0.4896758, 2.556853, 1, 0, 0.3411765, 1,
1.595525, 0.06323305, 0.8001165, 1, 0, 0.3372549, 1,
1.6027, 3.076384, -0.3231502, 1, 0, 0.3294118, 1,
1.619341, 1.023427, 1.528793, 1, 0, 0.3254902, 1,
1.623117, -0.3022816, 0.2550063, 1, 0, 0.3176471, 1,
1.634013, -0.6438785, 1.004926, 1, 0, 0.3137255, 1,
1.637028, -1.498175, 3.020823, 1, 0, 0.3058824, 1,
1.650847, -0.6120277, 2.537622, 1, 0, 0.2980392, 1,
1.673644, -0.4990188, 2.543777, 1, 0, 0.2941177, 1,
1.696235, -1.496038, 3.148216, 1, 0, 0.2862745, 1,
1.711275, -0.7689068, 1.413076, 1, 0, 0.282353, 1,
1.712871, -2.59176, 1.613007, 1, 0, 0.2745098, 1,
1.718796, -0.2903664, 1.58332, 1, 0, 0.2705882, 1,
1.728728, 0.4920487, 1.145991, 1, 0, 0.2627451, 1,
1.751164, -0.3085481, 2.818256, 1, 0, 0.2588235, 1,
1.752907, 0.2243857, 2.275003, 1, 0, 0.2509804, 1,
1.764711, -0.4259104, 2.805745, 1, 0, 0.2470588, 1,
1.796639, 0.5707826, -0.3282602, 1, 0, 0.2392157, 1,
1.828043, -0.1330531, 2.019767, 1, 0, 0.2352941, 1,
1.840972, -2.340609, 2.217901, 1, 0, 0.227451, 1,
1.873817, -0.9221606, 0.7086515, 1, 0, 0.2235294, 1,
1.877605, 1.46675, 1.704397, 1, 0, 0.2156863, 1,
1.880133, -0.8440274, 1.345079, 1, 0, 0.2117647, 1,
1.89155, 0.5376908, 1.676679, 1, 0, 0.2039216, 1,
1.891724, -2.557278, 2.271493, 1, 0, 0.1960784, 1,
1.896678, 0.5797319, -0.4341554, 1, 0, 0.1921569, 1,
1.913966, 1.852309, 1.29704, 1, 0, 0.1843137, 1,
1.916384, -0.2381488, 2.263645, 1, 0, 0.1803922, 1,
1.96205, -0.2372402, 0.03104036, 1, 0, 0.172549, 1,
2.02898, -0.3508597, 1.249841, 1, 0, 0.1686275, 1,
2.035291, -0.05556909, 0.4660399, 1, 0, 0.1607843, 1,
2.04375, -0.5526838, -0.4376462, 1, 0, 0.1568628, 1,
2.088729, -0.1948321, 1.279721, 1, 0, 0.1490196, 1,
2.116467, 0.3394987, 0.170409, 1, 0, 0.145098, 1,
2.13523, 0.3118679, 2.647579, 1, 0, 0.1372549, 1,
2.142469, 1.777327, 0.7348594, 1, 0, 0.1333333, 1,
2.156633, -0.8651935, 1.160856, 1, 0, 0.1254902, 1,
2.169719, 1.202529, 1.538238, 1, 0, 0.1215686, 1,
2.20419, 0.02153806, -0.6410841, 1, 0, 0.1137255, 1,
2.213811, -0.006630529, 1.148655, 1, 0, 0.1098039, 1,
2.237753, -0.2241603, 1.742076, 1, 0, 0.1019608, 1,
2.256674, 0.8572878, 0.2835087, 1, 0, 0.09411765, 1,
2.30988, -1.116538, 1.771091, 1, 0, 0.09019608, 1,
2.339152, 0.2699177, 2.616326, 1, 0, 0.08235294, 1,
2.353216, -0.7676821, 1.245497, 1, 0, 0.07843138, 1,
2.363204, 1.167696, 0.66868, 1, 0, 0.07058824, 1,
2.365297, 0.6574997, 2.194143, 1, 0, 0.06666667, 1,
2.383538, 0.2997114, 1.63249, 1, 0, 0.05882353, 1,
2.56229, 0.3478695, 1.884059, 1, 0, 0.05490196, 1,
2.562701, 0.5649126, -0.2202239, 1, 0, 0.04705882, 1,
2.564513, 0.9041441, 0.7771236, 1, 0, 0.04313726, 1,
2.583591, 0.5739389, -0.07424069, 1, 0, 0.03529412, 1,
2.609468, 1.290563, 2.015403, 1, 0, 0.03137255, 1,
2.681839, -0.01857152, 2.505017, 1, 0, 0.02352941, 1,
2.798603, -2.24644, 1.425042, 1, 0, 0.01960784, 1,
2.853745, -0.5273901, 0.07927442, 1, 0, 0.01176471, 1,
2.946801, 0.720173, 1.741408, 1, 0, 0.007843138, 1
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
-0.1138716, -3.870517, -7.474209, 0, -0.5, 0.5, 0.5,
-0.1138716, -3.870517, -7.474209, 1, -0.5, 0.5, 0.5,
-0.1138716, -3.870517, -7.474209, 1, 1.5, 0.5, 0.5,
-0.1138716, -3.870517, -7.474209, 0, 1.5, 0.5, 0.5
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
-4.212112, 0.1063535, -7.474209, 0, -0.5, 0.5, 0.5,
-4.212112, 0.1063535, -7.474209, 1, -0.5, 0.5, 0.5,
-4.212112, 0.1063535, -7.474209, 1, 1.5, 0.5, 0.5,
-4.212112, 0.1063535, -7.474209, 0, 1.5, 0.5, 0.5
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
-4.212112, -3.870517, 0.1830721, 0, -0.5, 0.5, 0.5,
-4.212112, -3.870517, 0.1830721, 1, -0.5, 0.5, 0.5,
-4.212112, -3.870517, 0.1830721, 1, 1.5, 0.5, 0.5,
-4.212112, -3.870517, 0.1830721, 0, 1.5, 0.5, 0.5
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
-3, -2.952778, -5.707144,
2, -2.952778, -5.707144,
-3, -2.952778, -5.707144,
-3, -3.105735, -6.001655,
-2, -2.952778, -5.707144,
-2, -3.105735, -6.001655,
-1, -2.952778, -5.707144,
-1, -3.105735, -6.001655,
0, -2.952778, -5.707144,
0, -3.105735, -6.001655,
1, -2.952778, -5.707144,
1, -3.105735, -6.001655,
2, -2.952778, -5.707144,
2, -3.105735, -6.001655
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
-3, -3.411648, -6.590677, 0, -0.5, 0.5, 0.5,
-3, -3.411648, -6.590677, 1, -0.5, 0.5, 0.5,
-3, -3.411648, -6.590677, 1, 1.5, 0.5, 0.5,
-3, -3.411648, -6.590677, 0, 1.5, 0.5, 0.5,
-2, -3.411648, -6.590677, 0, -0.5, 0.5, 0.5,
-2, -3.411648, -6.590677, 1, -0.5, 0.5, 0.5,
-2, -3.411648, -6.590677, 1, 1.5, 0.5, 0.5,
-2, -3.411648, -6.590677, 0, 1.5, 0.5, 0.5,
-1, -3.411648, -6.590677, 0, -0.5, 0.5, 0.5,
-1, -3.411648, -6.590677, 1, -0.5, 0.5, 0.5,
-1, -3.411648, -6.590677, 1, 1.5, 0.5, 0.5,
-1, -3.411648, -6.590677, 0, 1.5, 0.5, 0.5,
0, -3.411648, -6.590677, 0, -0.5, 0.5, 0.5,
0, -3.411648, -6.590677, 1, -0.5, 0.5, 0.5,
0, -3.411648, -6.590677, 1, 1.5, 0.5, 0.5,
0, -3.411648, -6.590677, 0, 1.5, 0.5, 0.5,
1, -3.411648, -6.590677, 0, -0.5, 0.5, 0.5,
1, -3.411648, -6.590677, 1, -0.5, 0.5, 0.5,
1, -3.411648, -6.590677, 1, 1.5, 0.5, 0.5,
1, -3.411648, -6.590677, 0, 1.5, 0.5, 0.5,
2, -3.411648, -6.590677, 0, -0.5, 0.5, 0.5,
2, -3.411648, -6.590677, 1, -0.5, 0.5, 0.5,
2, -3.411648, -6.590677, 1, 1.5, 0.5, 0.5,
2, -3.411648, -6.590677, 0, 1.5, 0.5, 0.5
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
-3.266364, -2, -5.707144,
-3.266364, 3, -5.707144,
-3.266364, -2, -5.707144,
-3.423989, -2, -6.001655,
-3.266364, -1, -5.707144,
-3.423989, -1, -6.001655,
-3.266364, 0, -5.707144,
-3.423989, 0, -6.001655,
-3.266364, 1, -5.707144,
-3.423989, 1, -6.001655,
-3.266364, 2, -5.707144,
-3.423989, 2, -6.001655,
-3.266364, 3, -5.707144,
-3.423989, 3, -6.001655
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
-3.739238, -2, -6.590677, 0, -0.5, 0.5, 0.5,
-3.739238, -2, -6.590677, 1, -0.5, 0.5, 0.5,
-3.739238, -2, -6.590677, 1, 1.5, 0.5, 0.5,
-3.739238, -2, -6.590677, 0, 1.5, 0.5, 0.5,
-3.739238, -1, -6.590677, 0, -0.5, 0.5, 0.5,
-3.739238, -1, -6.590677, 1, -0.5, 0.5, 0.5,
-3.739238, -1, -6.590677, 1, 1.5, 0.5, 0.5,
-3.739238, -1, -6.590677, 0, 1.5, 0.5, 0.5,
-3.739238, 0, -6.590677, 0, -0.5, 0.5, 0.5,
-3.739238, 0, -6.590677, 1, -0.5, 0.5, 0.5,
-3.739238, 0, -6.590677, 1, 1.5, 0.5, 0.5,
-3.739238, 0, -6.590677, 0, 1.5, 0.5, 0.5,
-3.739238, 1, -6.590677, 0, -0.5, 0.5, 0.5,
-3.739238, 1, -6.590677, 1, -0.5, 0.5, 0.5,
-3.739238, 1, -6.590677, 1, 1.5, 0.5, 0.5,
-3.739238, 1, -6.590677, 0, 1.5, 0.5, 0.5,
-3.739238, 2, -6.590677, 0, -0.5, 0.5, 0.5,
-3.739238, 2, -6.590677, 1, -0.5, 0.5, 0.5,
-3.739238, 2, -6.590677, 1, 1.5, 0.5, 0.5,
-3.739238, 2, -6.590677, 0, 1.5, 0.5, 0.5,
-3.739238, 3, -6.590677, 0, -0.5, 0.5, 0.5,
-3.739238, 3, -6.590677, 1, -0.5, 0.5, 0.5,
-3.739238, 3, -6.590677, 1, 1.5, 0.5, 0.5,
-3.739238, 3, -6.590677, 0, 1.5, 0.5, 0.5
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
-3.266364, -2.952778, -4,
-3.266364, -2.952778, 4,
-3.266364, -2.952778, -4,
-3.423989, -3.105735, -4,
-3.266364, -2.952778, -2,
-3.423989, -3.105735, -2,
-3.266364, -2.952778, 0,
-3.423989, -3.105735, 0,
-3.266364, -2.952778, 2,
-3.423989, -3.105735, 2,
-3.266364, -2.952778, 4,
-3.423989, -3.105735, 4
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
-3.739238, -3.411648, -4, 0, -0.5, 0.5, 0.5,
-3.739238, -3.411648, -4, 1, -0.5, 0.5, 0.5,
-3.739238, -3.411648, -4, 1, 1.5, 0.5, 0.5,
-3.739238, -3.411648, -4, 0, 1.5, 0.5, 0.5,
-3.739238, -3.411648, -2, 0, -0.5, 0.5, 0.5,
-3.739238, -3.411648, -2, 1, -0.5, 0.5, 0.5,
-3.739238, -3.411648, -2, 1, 1.5, 0.5, 0.5,
-3.739238, -3.411648, -2, 0, 1.5, 0.5, 0.5,
-3.739238, -3.411648, 0, 0, -0.5, 0.5, 0.5,
-3.739238, -3.411648, 0, 1, -0.5, 0.5, 0.5,
-3.739238, -3.411648, 0, 1, 1.5, 0.5, 0.5,
-3.739238, -3.411648, 0, 0, 1.5, 0.5, 0.5,
-3.739238, -3.411648, 2, 0, -0.5, 0.5, 0.5,
-3.739238, -3.411648, 2, 1, -0.5, 0.5, 0.5,
-3.739238, -3.411648, 2, 1, 1.5, 0.5, 0.5,
-3.739238, -3.411648, 2, 0, 1.5, 0.5, 0.5,
-3.739238, -3.411648, 4, 0, -0.5, 0.5, 0.5,
-3.739238, -3.411648, 4, 1, -0.5, 0.5, 0.5,
-3.739238, -3.411648, 4, 1, 1.5, 0.5, 0.5,
-3.739238, -3.411648, 4, 0, 1.5, 0.5, 0.5
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
-3.266364, -2.952778, -5.707144,
-3.266364, 3.165485, -5.707144,
-3.266364, -2.952778, 6.073288,
-3.266364, 3.165485, 6.073288,
-3.266364, -2.952778, -5.707144,
-3.266364, -2.952778, 6.073288,
-3.266364, 3.165485, -5.707144,
-3.266364, 3.165485, 6.073288,
-3.266364, -2.952778, -5.707144,
3.038621, -2.952778, -5.707144,
-3.266364, -2.952778, 6.073288,
3.038621, -2.952778, 6.073288,
-3.266364, 3.165485, -5.707144,
3.038621, 3.165485, -5.707144,
-3.266364, 3.165485, 6.073288,
3.038621, 3.165485, 6.073288,
3.038621, -2.952778, -5.707144,
3.038621, 3.165485, -5.707144,
3.038621, -2.952778, 6.073288,
3.038621, 3.165485, 6.073288,
3.038621, -2.952778, -5.707144,
3.038621, -2.952778, 6.073288,
3.038621, 3.165485, -5.707144,
3.038621, 3.165485, 6.073288
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
var radius = 7.847236;
var distance = 34.91324;
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
mvMatrix.translate( 0.1138716, -0.1063535, -0.1830721 );
mvMatrix.scale( 1.345695, 1.386764, 0.720227 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91324);
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
haloxyfop<-read.table("haloxyfop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-haloxyfop$V2
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
y<-haloxyfop$V3
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
z<-haloxyfop$V4
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
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
-3.174544, 0.07516574, -0.6976711, 0, 0, 1, 1, 1,
-3.057208, 0.5884858, -2.015213, 1, 0, 0, 1, 1,
-3.013554, 0.05458624, -2.018622, 1, 0, 0, 1, 1,
-2.871146, -2.486871, -1.162554, 1, 0, 0, 1, 1,
-2.870119, -0.8245913, -0.3149585, 1, 0, 0, 1, 1,
-2.534545, 0.502326, 2.307882, 1, 0, 0, 1, 1,
-2.47267, 1.566184, 0.1021443, 0, 0, 0, 1, 1,
-2.395721, 0.4440052, -1.669769, 0, 0, 0, 1, 1,
-2.372795, -0.3657677, -0.788843, 0, 0, 0, 1, 1,
-2.353944, -1.634826, -3.454309, 0, 0, 0, 1, 1,
-2.302896, 0.40246, -2.441967, 0, 0, 0, 1, 1,
-2.293144, -0.7949922, -1.777317, 0, 0, 0, 1, 1,
-2.254901, 0.05153433, -1.945793, 0, 0, 0, 1, 1,
-2.223204, 0.4442796, -0.371596, 1, 1, 1, 1, 1,
-2.170492, -0.949265, -2.029682, 1, 1, 1, 1, 1,
-2.064062, -0.7097471, -2.676022, 1, 1, 1, 1, 1,
-2.055212, 0.3361203, 0.6297234, 1, 1, 1, 1, 1,
-2.039778, -1.144338, -1.955348, 1, 1, 1, 1, 1,
-2.012217, 1.850318, -1.59457, 1, 1, 1, 1, 1,
-1.970983, 0.5123343, 0.6115623, 1, 1, 1, 1, 1,
-1.970071, 0.09034885, -1.777542, 1, 1, 1, 1, 1,
-1.965194, -0.1454229, -0.6826725, 1, 1, 1, 1, 1,
-1.928353, -0.07850916, -1.237007, 1, 1, 1, 1, 1,
-1.9275, -1.456768, -2.884213, 1, 1, 1, 1, 1,
-1.923897, 1.279189, -0.4415677, 1, 1, 1, 1, 1,
-1.923513, -1.965791, -2.293717, 1, 1, 1, 1, 1,
-1.919575, -1.657009, -1.926179, 1, 1, 1, 1, 1,
-1.896355, 0.8074979, -0.3566233, 1, 1, 1, 1, 1,
-1.896169, 0.1772269, 0.2658653, 0, 0, 1, 1, 1,
-1.894352, -0.5014451, -0.9676529, 1, 0, 0, 1, 1,
-1.880539, 0.2744206, -0.8814158, 1, 0, 0, 1, 1,
-1.833574, -0.3018093, -1.498874, 1, 0, 0, 1, 1,
-1.826696, 0.04638068, -1.567179, 1, 0, 0, 1, 1,
-1.803754, 0.07262013, -1.612395, 1, 0, 0, 1, 1,
-1.801811, -0.3103057, -1.130021, 0, 0, 0, 1, 1,
-1.797917, -0.6194204, -0.5746081, 0, 0, 0, 1, 1,
-1.792853, 0.3437097, -1.732377, 0, 0, 0, 1, 1,
-1.775481, -0.08979485, -2.847301, 0, 0, 0, 1, 1,
-1.746392, 0.590201, -0.8727757, 0, 0, 0, 1, 1,
-1.727233, -0.7759546, -0.3016234, 0, 0, 0, 1, 1,
-1.718423, 0.2203134, -1.430713, 0, 0, 0, 1, 1,
-1.715976, -0.1039809, -2.681538, 1, 1, 1, 1, 1,
-1.71567, -0.5838279, -2.381023, 1, 1, 1, 1, 1,
-1.698446, -0.334925, -0.3778875, 1, 1, 1, 1, 1,
-1.694817, -2.203673, -1.979102, 1, 1, 1, 1, 1,
-1.694187, -1.310628, -1.706947, 1, 1, 1, 1, 1,
-1.689712, -0.5553886, -0.8306924, 1, 1, 1, 1, 1,
-1.67824, -1.368268, -1.916359, 1, 1, 1, 1, 1,
-1.646323, -0.7600282, -4.275399, 1, 1, 1, 1, 1,
-1.613351, 1.105812, 0.3014038, 1, 1, 1, 1, 1,
-1.609039, 0.4296309, -1.07681, 1, 1, 1, 1, 1,
-1.60859, -0.8258265, -2.627091, 1, 1, 1, 1, 1,
-1.589293, -0.4300866, -0.5561913, 1, 1, 1, 1, 1,
-1.572471, 1.263095, 1.17955, 1, 1, 1, 1, 1,
-1.572006, -1.295547, -1.463903, 1, 1, 1, 1, 1,
-1.568385, 1.626988, -1.585568, 1, 1, 1, 1, 1,
-1.568021, 0.9886065, 0.2940139, 0, 0, 1, 1, 1,
-1.548573, -0.9609669, -2.744188, 1, 0, 0, 1, 1,
-1.52993, 0.6242257, -1.15077, 1, 0, 0, 1, 1,
-1.526682, 0.6311573, -0.1927628, 1, 0, 0, 1, 1,
-1.52252, 0.1613582, -1.465865, 1, 0, 0, 1, 1,
-1.509929, 0.06187895, -2.964182, 1, 0, 0, 1, 1,
-1.501141, -1.841128, -2.542695, 0, 0, 0, 1, 1,
-1.490685, -0.2993752, -2.192137, 0, 0, 0, 1, 1,
-1.48622, -0.8517065, -0.5559132, 0, 0, 0, 1, 1,
-1.48289, -0.02496565, -1.121176, 0, 0, 0, 1, 1,
-1.473101, -1.694103, -0.5465801, 0, 0, 0, 1, 1,
-1.459776, 1.368851, -2.243054, 0, 0, 0, 1, 1,
-1.445478, 0.5508457, -0.4096324, 0, 0, 0, 1, 1,
-1.434365, -0.4322189, -1.159597, 1, 1, 1, 1, 1,
-1.428525, 0.01207901, -1.396755, 1, 1, 1, 1, 1,
-1.426117, -0.2211137, -1.223187, 1, 1, 1, 1, 1,
-1.420826, -1.373439, -1.521987, 1, 1, 1, 1, 1,
-1.411663, -0.4299447, -2.282593, 1, 1, 1, 1, 1,
-1.404127, 0.6828938, -1.008229, 1, 1, 1, 1, 1,
-1.389453, -0.3615682, -3.949963, 1, 1, 1, 1, 1,
-1.385119, -0.3515636, -4.020471, 1, 1, 1, 1, 1,
-1.384743, 1.16955, -2.296062, 1, 1, 1, 1, 1,
-1.378805, -1.054965, -2.679079, 1, 1, 1, 1, 1,
-1.372234, 0.1770914, -2.557393, 1, 1, 1, 1, 1,
-1.357694, 1.661994, -0.6913826, 1, 1, 1, 1, 1,
-1.346737, -0.1493638, -2.57251, 1, 1, 1, 1, 1,
-1.344743, 0.2382228, -1.179268, 1, 1, 1, 1, 1,
-1.336907, -0.9928725, -1.573135, 1, 1, 1, 1, 1,
-1.333997, -0.3601982, -1.987557, 0, 0, 1, 1, 1,
-1.331358, 0.618671, -1.827543, 1, 0, 0, 1, 1,
-1.323683, -0.005202208, -2.852919, 1, 0, 0, 1, 1,
-1.319209, 0.3091874, -0.9321316, 1, 0, 0, 1, 1,
-1.312009, -0.8659558, -2.188997, 1, 0, 0, 1, 1,
-1.307889, 1.315426, 0.438444, 1, 0, 0, 1, 1,
-1.304885, 0.06472358, -1.716456, 0, 0, 0, 1, 1,
-1.30257, -2.74638, -3.578676, 0, 0, 0, 1, 1,
-1.299488, -0.3238759, -3.222392, 0, 0, 0, 1, 1,
-1.299118, 1.776122, -0.7388341, 0, 0, 0, 1, 1,
-1.2967, -1.180067, -2.402033, 0, 0, 0, 1, 1,
-1.29148, -1.22634, -1.688155, 0, 0, 0, 1, 1,
-1.287108, -0.3688478, -2.507874, 0, 0, 0, 1, 1,
-1.285065, -1.156393, -2.563091, 1, 1, 1, 1, 1,
-1.283922, 0.342033, -3.115844, 1, 1, 1, 1, 1,
-1.282001, 0.364328, -2.15351, 1, 1, 1, 1, 1,
-1.279185, 0.3559668, 0.6470574, 1, 1, 1, 1, 1,
-1.276667, -1.995253, -1.76856, 1, 1, 1, 1, 1,
-1.260185, 0.5198808, -0.4428417, 1, 1, 1, 1, 1,
-1.246265, -0.783727, -2.861264, 1, 1, 1, 1, 1,
-1.241588, -0.5358009, -1.199876, 1, 1, 1, 1, 1,
-1.22846, 0.08233954, -1.691564, 1, 1, 1, 1, 1,
-1.21314, 1.73854, -0.2351634, 1, 1, 1, 1, 1,
-1.205486, 0.6630052, -0.3197089, 1, 1, 1, 1, 1,
-1.20245, 0.7059327, -1.53841, 1, 1, 1, 1, 1,
-1.191476, 2.142509, -2.147377, 1, 1, 1, 1, 1,
-1.184704, 0.1935704, -1.24897, 1, 1, 1, 1, 1,
-1.179007, 0.5327972, -0.6907253, 1, 1, 1, 1, 1,
-1.176715, -1.282538, -3.392653, 0, 0, 1, 1, 1,
-1.167431, 0.7577574, -2.601405, 1, 0, 0, 1, 1,
-1.161509, 0.6337369, -0.7981246, 1, 0, 0, 1, 1,
-1.158443, 1.966566, -0.1567905, 1, 0, 0, 1, 1,
-1.142121, 1.115168, -0.8222018, 1, 0, 0, 1, 1,
-1.138172, -0.4288912, -0.4613303, 1, 0, 0, 1, 1,
-1.135684, 0.6511982, -1.203051, 0, 0, 0, 1, 1,
-1.115971, 1.550826, -0.5420984, 0, 0, 0, 1, 1,
-1.112662, 0.5149115, -1.863548, 0, 0, 0, 1, 1,
-1.110421, 1.340348, -1.502524, 0, 0, 0, 1, 1,
-1.105823, -0.5791061, -2.596887, 0, 0, 0, 1, 1,
-1.103925, -0.2416795, -2.226667, 0, 0, 0, 1, 1,
-1.102468, 0.09274606, -2.98699, 0, 0, 0, 1, 1,
-1.101928, -1.595595, -0.5827348, 1, 1, 1, 1, 1,
-1.096918, 0.1319133, 0.3301695, 1, 1, 1, 1, 1,
-1.095787, 0.7591293, -0.04802092, 1, 1, 1, 1, 1,
-1.091539, -0.443164, -2.193125, 1, 1, 1, 1, 1,
-1.087774, 0.7050316, -1.880826, 1, 1, 1, 1, 1,
-1.086542, 1.387613, -0.5082216, 1, 1, 1, 1, 1,
-1.075833, 0.5709038, -0.5068016, 1, 1, 1, 1, 1,
-1.072562, 0.3471299, -1.274076, 1, 1, 1, 1, 1,
-1.070077, -0.2014914, -2.01794, 1, 1, 1, 1, 1,
-1.066978, -0.4038869, -2.611446, 1, 1, 1, 1, 1,
-1.05992, 1.100372, -2.426078, 1, 1, 1, 1, 1,
-1.057732, 1.002625, -2.046557, 1, 1, 1, 1, 1,
-1.05597, -1.109034, -2.359903, 1, 1, 1, 1, 1,
-1.055954, 0.01407776, -2.560021, 1, 1, 1, 1, 1,
-1.05251, 1.673014, -2.90337, 1, 1, 1, 1, 1,
-1.049615, -1.660598, -2.996253, 0, 0, 1, 1, 1,
-1.04758, 0.038359, -1.802705, 1, 0, 0, 1, 1,
-1.042404, 0.9930617, 0.67348, 1, 0, 0, 1, 1,
-1.037615, 0.2231903, -1.361844, 1, 0, 0, 1, 1,
-1.0346, -0.6132332, -3.336624, 1, 0, 0, 1, 1,
-1.024173, -0.910944, -1.573706, 1, 0, 0, 1, 1,
-1.015449, -1.717166, -3.121203, 0, 0, 0, 1, 1,
-1.013268, -1.831759, -4.861316, 0, 0, 0, 1, 1,
-1.010174, 0.06692705, -1.045702, 0, 0, 0, 1, 1,
-1.002989, -0.46896, -2.736641, 0, 0, 0, 1, 1,
-1.001073, -0.7376694, -3.066843, 0, 0, 0, 1, 1,
-0.9822748, 1.574873, -0.1872957, 0, 0, 0, 1, 1,
-0.9820309, 1.809303, 0.7216678, 0, 0, 0, 1, 1,
-0.9808239, 0.4539202, -1.529504, 1, 1, 1, 1, 1,
-0.9799612, -0.9005116, -2.227672, 1, 1, 1, 1, 1,
-0.9716865, -0.4180321, -2.146633, 1, 1, 1, 1, 1,
-0.9690107, -0.203117, -1.213581, 1, 1, 1, 1, 1,
-0.9622868, 0.3811017, -0.6740106, 1, 1, 1, 1, 1,
-0.9570381, 0.6753029, -2.142601, 1, 1, 1, 1, 1,
-0.9533019, -0.03135733, -0.2295232, 1, 1, 1, 1, 1,
-0.9525472, 0.9008685, -1.518528, 1, 1, 1, 1, 1,
-0.9518622, -0.6960936, -2.389511, 1, 1, 1, 1, 1,
-0.9461441, -0.1684208, -1.811668, 1, 1, 1, 1, 1,
-0.945729, -0.8614879, -2.863684, 1, 1, 1, 1, 1,
-0.9395351, 0.566117, -1.813917, 1, 1, 1, 1, 1,
-0.9378392, -2.159439, -3.376153, 1, 1, 1, 1, 1,
-0.9370608, -0.3702007, -2.523844, 1, 1, 1, 1, 1,
-0.9334776, 0.517205, -1.067127, 1, 1, 1, 1, 1,
-0.9271526, 0.04863737, -0.5425021, 0, 0, 1, 1, 1,
-0.9246052, -1.238251, -3.315737, 1, 0, 0, 1, 1,
-0.9197168, 0.4524898, -0.8544835, 1, 0, 0, 1, 1,
-0.9126852, -0.214764, -1.507374, 1, 0, 0, 1, 1,
-0.9121836, 0.1706185, -1.200797, 1, 0, 0, 1, 1,
-0.8988664, 0.8383383, 0.2098947, 1, 0, 0, 1, 1,
-0.8987871, 1.189189, 0.3495921, 0, 0, 0, 1, 1,
-0.8967115, 0.5669342, -2.533151, 0, 0, 0, 1, 1,
-0.8944245, -0.1289379, -1.662279, 0, 0, 0, 1, 1,
-0.8832902, 0.01670667, -3.477357, 0, 0, 0, 1, 1,
-0.8807655, 2.100453, 0.5950282, 0, 0, 0, 1, 1,
-0.8737646, -0.6681796, -1.099086, 0, 0, 0, 1, 1,
-0.8632208, -1.119511, -0.7611198, 0, 0, 0, 1, 1,
-0.8623514, -0.4092074, -2.449735, 1, 1, 1, 1, 1,
-0.8590013, -0.7306529, -3.460266, 1, 1, 1, 1, 1,
-0.8488736, -1.20368, -1.291022, 1, 1, 1, 1, 1,
-0.8464385, -2.358816, -4.636539, 1, 1, 1, 1, 1,
-0.8332223, -0.2760156, -0.536692, 1, 1, 1, 1, 1,
-0.8320365, -0.6892856, -0.729906, 1, 1, 1, 1, 1,
-0.8189678, -1.320093, -1.582576, 1, 1, 1, 1, 1,
-0.8149151, -0.9105663, -2.024814, 1, 1, 1, 1, 1,
-0.8108675, 1.021826, -1.664442, 1, 1, 1, 1, 1,
-0.8088861, 1.104156, 0.8549739, 1, 1, 1, 1, 1,
-0.8062822, -1.314936, -2.091036, 1, 1, 1, 1, 1,
-0.80056, 0.008997909, -2.063839, 1, 1, 1, 1, 1,
-0.7974747, 0.6775364, -1.344745, 1, 1, 1, 1, 1,
-0.794193, 0.2885263, -2.77706, 1, 1, 1, 1, 1,
-0.7915401, 0.8264733, -0.7979308, 1, 1, 1, 1, 1,
-0.7865589, 0.5683156, -1.584377, 0, 0, 1, 1, 1,
-0.7836674, -0.3396089, -3.049914, 1, 0, 0, 1, 1,
-0.7796137, 0.05064316, -0.3932362, 1, 0, 0, 1, 1,
-0.7793487, -0.1015355, -2.678279, 1, 0, 0, 1, 1,
-0.7782962, -0.3149403, -2.799311, 1, 0, 0, 1, 1,
-0.776925, -1.945236, -2.639605, 1, 0, 0, 1, 1,
-0.7767373, -0.7543086, -0.739618, 0, 0, 0, 1, 1,
-0.7766744, 0.735254, -2.001328, 0, 0, 0, 1, 1,
-0.7740744, 0.06372178, -1.163595, 0, 0, 0, 1, 1,
-0.7740502, 0.7875378, -1.259336, 0, 0, 0, 1, 1,
-0.7733365, 1.140785, -1.734179, 0, 0, 0, 1, 1,
-0.7666855, -0.7810292, -3.278652, 0, 0, 0, 1, 1,
-0.7652323, -1.252701, -1.748042, 0, 0, 0, 1, 1,
-0.7644565, -0.2613317, -2.179847, 1, 1, 1, 1, 1,
-0.7571191, 2.357068, -2.241649, 1, 1, 1, 1, 1,
-0.757031, -0.5471441, -0.992585, 1, 1, 1, 1, 1,
-0.755843, -0.3031898, -1.162445, 1, 1, 1, 1, 1,
-0.7505742, -0.6585517, -1.386025, 1, 1, 1, 1, 1,
-0.7502509, 0.1152229, 0.01747461, 1, 1, 1, 1, 1,
-0.7455939, 0.6587886, -0.7880914, 1, 1, 1, 1, 1,
-0.7453936, -0.003217379, -4.540148, 1, 1, 1, 1, 1,
-0.7424048, -0.2020898, -1.729665, 1, 1, 1, 1, 1,
-0.7344189, 2.236953, -1.607365, 1, 1, 1, 1, 1,
-0.7301515, 0.01205347, -1.515311, 1, 1, 1, 1, 1,
-0.7299705, -0.3928107, -2.723753, 1, 1, 1, 1, 1,
-0.7294809, 0.1911838, -1.4988, 1, 1, 1, 1, 1,
-0.7294576, -1.386918, -1.915642, 1, 1, 1, 1, 1,
-0.7263203, -0.6264232, -3.841766, 1, 1, 1, 1, 1,
-0.7252063, 0.4783026, -2.264028, 0, 0, 1, 1, 1,
-0.7206813, 0.2533921, -0.7697683, 1, 0, 0, 1, 1,
-0.7205628, -0.5785165, -3.340384, 1, 0, 0, 1, 1,
-0.7173308, -0.8922933, -2.645617, 1, 0, 0, 1, 1,
-0.7072895, -0.1279904, -0.4466657, 1, 0, 0, 1, 1,
-0.7042232, 0.3096107, -1.021879, 1, 0, 0, 1, 1,
-0.6990528, -0.7774653, -3.159615, 0, 0, 0, 1, 1,
-0.6986833, -0.6756281, -2.123465, 0, 0, 0, 1, 1,
-0.6965225, 1.11031, -1.46586, 0, 0, 0, 1, 1,
-0.6954834, 1.396358, 0.6311902, 0, 0, 0, 1, 1,
-0.6934553, -1.615399, -2.176087, 0, 0, 0, 1, 1,
-0.6881136, 1.615542, 0.1522365, 0, 0, 0, 1, 1,
-0.6844077, -1.013657, -2.291761, 0, 0, 0, 1, 1,
-0.6781271, -0.6517675, -3.594173, 1, 1, 1, 1, 1,
-0.6755551, 0.7717656, -1.09776, 1, 1, 1, 1, 1,
-0.6739584, -1.966699, -3.294428, 1, 1, 1, 1, 1,
-0.6730835, -1.078509, -1.937184, 1, 1, 1, 1, 1,
-0.670024, 0.319062, -2.601494, 1, 1, 1, 1, 1,
-0.6585165, -0.8902944, -2.952965, 1, 1, 1, 1, 1,
-0.6486999, 1.142709, -0.3332313, 1, 1, 1, 1, 1,
-0.6484722, -2.220088, -2.649101, 1, 1, 1, 1, 1,
-0.6453625, -0.4271021, 0.4144236, 1, 1, 1, 1, 1,
-0.643307, -0.8316997, -3.378968, 1, 1, 1, 1, 1,
-0.6333624, 2.22299, 0.8288195, 1, 1, 1, 1, 1,
-0.6330754, -2.036012, -3.894339, 1, 1, 1, 1, 1,
-0.6201168, 1.206482, 0.5103288, 1, 1, 1, 1, 1,
-0.6190282, 0.5413134, -1.039916, 1, 1, 1, 1, 1,
-0.617622, -0.4178615, -1.383574, 1, 1, 1, 1, 1,
-0.6138952, 0.1454361, -1.803229, 0, 0, 1, 1, 1,
-0.6133692, 1.244829, 0.8788729, 1, 0, 0, 1, 1,
-0.6109016, 0.3022971, -1.216181, 1, 0, 0, 1, 1,
-0.6051678, -0.5612646, -0.274641, 1, 0, 0, 1, 1,
-0.6046301, 0.7144154, 0.03685776, 1, 0, 0, 1, 1,
-0.6042955, -0.4364048, -1.636713, 1, 0, 0, 1, 1,
-0.6014426, -1.081723, -1.533154, 0, 0, 0, 1, 1,
-0.6010295, 0.4864407, -0.9556304, 0, 0, 0, 1, 1,
-0.5990414, 2.18434, -1.262395, 0, 0, 0, 1, 1,
-0.5980706, -0.9244949, -2.783095, 0, 0, 0, 1, 1,
-0.591708, 0.6121231, 0.2130472, 0, 0, 0, 1, 1,
-0.5886019, 0.7990933, -0.5155322, 0, 0, 0, 1, 1,
-0.5882033, -1.616204, -3.162969, 0, 0, 0, 1, 1,
-0.5874496, 1.003214, -0.9429174, 1, 1, 1, 1, 1,
-0.5853458, -0.09981467, -3.223311, 1, 1, 1, 1, 1,
-0.5853024, 1.253177, -1.487997, 1, 1, 1, 1, 1,
-0.5810294, 2.266517, 0.2035307, 1, 1, 1, 1, 1,
-0.5784212, -1.532873, -2.559179, 1, 1, 1, 1, 1,
-0.5731424, -1.434779, -4.106658, 1, 1, 1, 1, 1,
-0.5707176, 0.2527674, -3.014297, 1, 1, 1, 1, 1,
-0.5693702, 0.5938984, -0.4895242, 1, 1, 1, 1, 1,
-0.5685552, -0.7651416, -1.223696, 1, 1, 1, 1, 1,
-0.5651804, 0.634699, -0.2800804, 1, 1, 1, 1, 1,
-0.5650085, 1.475386, -0.7740397, 1, 1, 1, 1, 1,
-0.5643641, 0.6637778, -2.25478, 1, 1, 1, 1, 1,
-0.5640994, 1.229954, 0.1559584, 1, 1, 1, 1, 1,
-0.5640402, -0.9621022, -3.27193, 1, 1, 1, 1, 1,
-0.56001, -1.600585, -2.418768, 1, 1, 1, 1, 1,
-0.5509374, -1.649203, -3.765867, 0, 0, 1, 1, 1,
-0.5477399, 0.6871183, 0.09048768, 1, 0, 0, 1, 1,
-0.5373879, -0.02050993, -1.167077, 1, 0, 0, 1, 1,
-0.5366374, 0.006103095, -1.173313, 1, 0, 0, 1, 1,
-0.5362663, -0.0289066, -2.026176, 1, 0, 0, 1, 1,
-0.534463, 2.400761, -1.027021, 1, 0, 0, 1, 1,
-0.532761, 1.084705, -1.327811, 0, 0, 0, 1, 1,
-0.5326671, -1.145046, -2.741197, 0, 0, 0, 1, 1,
-0.5318056, -2.079321, -2.792701, 0, 0, 0, 1, 1,
-0.5294178, -0.2436575, -1.415456, 0, 0, 0, 1, 1,
-0.5200459, -0.6980064, -1.178026, 0, 0, 0, 1, 1,
-0.5196123, 1.728774, -0.05193478, 0, 0, 0, 1, 1,
-0.5195262, -0.9705968, -2.4141, 0, 0, 0, 1, 1,
-0.5113035, 2.895157, 0.296422, 1, 1, 1, 1, 1,
-0.5110552, 0.7827054, -0.0908105, 1, 1, 1, 1, 1,
-0.5036075, 0.563201, -0.02720365, 1, 1, 1, 1, 1,
-0.4943527, 0.5398958, 0.2695338, 1, 1, 1, 1, 1,
-0.4882385, -0.9623275, -2.049016, 1, 1, 1, 1, 1,
-0.48655, 0.2243755, 1.210114, 1, 1, 1, 1, 1,
-0.4798917, 1.197449, 2.682421, 1, 1, 1, 1, 1,
-0.4789693, 1.687899, -0.4916197, 1, 1, 1, 1, 1,
-0.4783905, 1.768638, -1.878493, 1, 1, 1, 1, 1,
-0.4773419, 0.4535684, -1.503019, 1, 1, 1, 1, 1,
-0.4769768, 1.339189, -0.7959295, 1, 1, 1, 1, 1,
-0.4681625, -0.01492372, -1.237596, 1, 1, 1, 1, 1,
-0.4652963, 0.6914154, 2.102348, 1, 1, 1, 1, 1,
-0.4626393, -1.403152, -2.406581, 1, 1, 1, 1, 1,
-0.4613585, -1.388149, -3.912879, 1, 1, 1, 1, 1,
-0.4584193, 0.9278758, -0.9002565, 0, 0, 1, 1, 1,
-0.457249, 0.2989272, -1.68713, 1, 0, 0, 1, 1,
-0.4557063, 0.9501973, 1.427043, 1, 0, 0, 1, 1,
-0.4534469, 1.013451, -1.039748, 1, 0, 0, 1, 1,
-0.4382772, -1.288514, -3.20981, 1, 0, 0, 1, 1,
-0.4369953, 1.42321, -1.596253, 1, 0, 0, 1, 1,
-0.4354898, -0.9358374, -1.437675, 0, 0, 0, 1, 1,
-0.4302794, 0.7342824, 0.7237691, 0, 0, 0, 1, 1,
-0.429268, 0.244539, 0.9228693, 0, 0, 0, 1, 1,
-0.4275531, -0.340591, -2.792903, 0, 0, 0, 1, 1,
-0.4270101, -1.033282, -1.32039, 0, 0, 0, 1, 1,
-0.4260413, 0.3234033, -0.6208989, 0, 0, 0, 1, 1,
-0.423592, -0.334272, -2.235119, 0, 0, 0, 1, 1,
-0.4206348, -0.5216041, -1.812027, 1, 1, 1, 1, 1,
-0.4201862, 2.059072, 1.062669, 1, 1, 1, 1, 1,
-0.4163442, 0.3365722, -4.104984, 1, 1, 1, 1, 1,
-0.4027228, 0.4996678, -0.6466382, 1, 1, 1, 1, 1,
-0.3957711, -0.5426363, -3.174598, 1, 1, 1, 1, 1,
-0.3930906, -1.596466, -1.575359, 1, 1, 1, 1, 1,
-0.3914835, -0.9827931, -2.86543, 1, 1, 1, 1, 1,
-0.3886674, -0.6098577, -2.344078, 1, 1, 1, 1, 1,
-0.3869163, -1.638186, -4.425349, 1, 1, 1, 1, 1,
-0.3848823, 0.5659752, 0.8535464, 1, 1, 1, 1, 1,
-0.3793553, 0.4439637, -2.13807, 1, 1, 1, 1, 1,
-0.3778493, 1.689437, 0.8216503, 1, 1, 1, 1, 1,
-0.3771648, 0.4623275, -0.263115, 1, 1, 1, 1, 1,
-0.3732378, -1.376234, -2.41504, 1, 1, 1, 1, 1,
-0.3677341, -0.4453661, -1.700743, 1, 1, 1, 1, 1,
-0.3606218, -0.4024663, -1.576215, 0, 0, 1, 1, 1,
-0.3510632, -1.107831, -2.627449, 1, 0, 0, 1, 1,
-0.3491939, 0.4039051, 0.1632371, 1, 0, 0, 1, 1,
-0.3488551, 0.07070851, -1.116437, 1, 0, 0, 1, 1,
-0.3455461, 1.809272, -0.5528181, 1, 0, 0, 1, 1,
-0.344404, 1.497249, 0.7128296, 1, 0, 0, 1, 1,
-0.3415997, 1.433372, -0.3680048, 0, 0, 0, 1, 1,
-0.3391307, -1.676434, -2.977227, 0, 0, 0, 1, 1,
-0.334655, 0.2033657, -1.04604, 0, 0, 0, 1, 1,
-0.3312837, -2.085956, -2.209919, 0, 0, 0, 1, 1,
-0.3294556, 0.03877385, -2.265148, 0, 0, 0, 1, 1,
-0.3260392, 0.17154, -1.927966, 0, 0, 0, 1, 1,
-0.3226959, 1.261423, -0.4760308, 0, 0, 0, 1, 1,
-0.3115766, -0.8183712, -4.076986, 1, 1, 1, 1, 1,
-0.3102026, 1.55167, 0.189477, 1, 1, 1, 1, 1,
-0.3058317, 0.5489857, 0.5835848, 1, 1, 1, 1, 1,
-0.3024148, -0.4203672, -3.058214, 1, 1, 1, 1, 1,
-0.3001882, -1.104084, -3.814992, 1, 1, 1, 1, 1,
-0.298308, -0.1124334, -0.7745072, 1, 1, 1, 1, 1,
-0.2956493, 0.5905268, -2.654021, 1, 1, 1, 1, 1,
-0.2948305, -0.1567636, -2.691041, 1, 1, 1, 1, 1,
-0.289822, 0.8605108, 1.077704, 1, 1, 1, 1, 1,
-0.2892785, 1.143756, -2.599993, 1, 1, 1, 1, 1,
-0.2855335, -1.065371, -2.596215, 1, 1, 1, 1, 1,
-0.2842936, 0.5252707, -0.6157729, 1, 1, 1, 1, 1,
-0.2815986, -0.1338979, -2.62941, 1, 1, 1, 1, 1,
-0.2730349, 0.7805358, 0.2256737, 1, 1, 1, 1, 1,
-0.2714983, 2.04365, -0.5420555, 1, 1, 1, 1, 1,
-0.2696767, -0.9584432, -2.515134, 0, 0, 1, 1, 1,
-0.2657969, -0.05025434, -2.166919, 1, 0, 0, 1, 1,
-0.2602693, 0.9321886, -0.666872, 1, 0, 0, 1, 1,
-0.2541736, 0.08141294, -1.620389, 1, 0, 0, 1, 1,
-0.251298, -0.6079548, -1.894579, 1, 0, 0, 1, 1,
-0.2509369, 0.7209748, 1.807058, 1, 0, 0, 1, 1,
-0.2491705, 1.121027, -0.07035796, 0, 0, 0, 1, 1,
-0.2384521, 0.6102762, -1.50368, 0, 0, 0, 1, 1,
-0.2357233, -0.7603908, -3.463634, 0, 0, 0, 1, 1,
-0.234198, -0.5065286, -3.112938, 0, 0, 0, 1, 1,
-0.2305086, -0.4972644, -2.48883, 0, 0, 0, 1, 1,
-0.2267327, -1.62748, -1.087859, 0, 0, 0, 1, 1,
-0.2213172, -0.4403906, -1.743307, 0, 0, 0, 1, 1,
-0.2204333, 0.4119905, 0.1730772, 1, 1, 1, 1, 1,
-0.2183406, 1.77113, 1.811831, 1, 1, 1, 1, 1,
-0.2140832, 0.9063824, -0.5948284, 1, 1, 1, 1, 1,
-0.2101533, -1.137768, -3.471827, 1, 1, 1, 1, 1,
-0.1996498, -1.300838, -1.727342, 1, 1, 1, 1, 1,
-0.1949215, -0.2001377, -2.619168, 1, 1, 1, 1, 1,
-0.1922334, -0.5666192, -1.797886, 1, 1, 1, 1, 1,
-0.1909058, -0.2192802, -1.75387, 1, 1, 1, 1, 1,
-0.1870116, 1.473962, -0.4794741, 1, 1, 1, 1, 1,
-0.1861262, 0.2112753, -1.773698, 1, 1, 1, 1, 1,
-0.1861004, -0.2774588, -1.700513, 1, 1, 1, 1, 1,
-0.1847781, 1.769862, 0.9880868, 1, 1, 1, 1, 1,
-0.1832954, 0.1489473, -2.039393, 1, 1, 1, 1, 1,
-0.1789657, 0.6444784, -0.504337, 1, 1, 1, 1, 1,
-0.1771325, 0.2598684, -0.6257649, 1, 1, 1, 1, 1,
-0.176666, -0.4088563, -3.262502, 0, 0, 1, 1, 1,
-0.1759748, 2.241016, -0.646713, 1, 0, 0, 1, 1,
-0.1731238, 0.9316829, -1.400973, 1, 0, 0, 1, 1,
-0.1690696, -1.109978, -4.156188, 1, 0, 0, 1, 1,
-0.1661766, -1.058238, -4.206796, 1, 0, 0, 1, 1,
-0.164783, 0.2944075, 0.2685856, 1, 0, 0, 1, 1,
-0.1635381, -0.7076656, -1.35106, 0, 0, 0, 1, 1,
-0.1593246, -1.297795, -3.115433, 0, 0, 0, 1, 1,
-0.1593184, 0.1369053, -0.9543173, 0, 0, 0, 1, 1,
-0.1570709, -0.5806593, -2.413707, 0, 0, 0, 1, 1,
-0.1560516, 0.4211435, -0.2956508, 0, 0, 0, 1, 1,
-0.1551751, -1.029693, -2.685516, 0, 0, 0, 1, 1,
-0.1500059, 0.4541666, -2.051542, 0, 0, 0, 1, 1,
-0.1474308, -0.7332659, -2.115682, 1, 1, 1, 1, 1,
-0.1470769, 1.141481, 1.038594, 1, 1, 1, 1, 1,
-0.1386172, -0.6921549, -3.996135, 1, 1, 1, 1, 1,
-0.1367482, -0.2601705, -2.965178, 1, 1, 1, 1, 1,
-0.1335569, 0.8534676, -0.3825456, 1, 1, 1, 1, 1,
-0.1320207, 0.06632006, -0.8800415, 1, 1, 1, 1, 1,
-0.1300258, 0.2079569, 0.357913, 1, 1, 1, 1, 1,
-0.1256481, -1.803483, -4.207176, 1, 1, 1, 1, 1,
-0.1234051, -0.2845249, -3.774569, 1, 1, 1, 1, 1,
-0.1208798, -0.8304344, -1.32969, 1, 1, 1, 1, 1,
-0.1184509, 0.2700949, -2.369319, 1, 1, 1, 1, 1,
-0.1174865, -1.350663, -3.641576, 1, 1, 1, 1, 1,
-0.114945, -0.5236337, -3.786465, 1, 1, 1, 1, 1,
-0.1148332, 1.013173, 0.5589489, 1, 1, 1, 1, 1,
-0.1148137, 0.975104, -2.335636, 1, 1, 1, 1, 1,
-0.1110139, -1.264434, -3.368281, 0, 0, 1, 1, 1,
-0.1093737, -2.024552, -1.522433, 1, 0, 0, 1, 1,
-0.1065381, -0.5598429, -3.850008, 1, 0, 0, 1, 1,
-0.1023826, -0.1043611, -3.36812, 1, 0, 0, 1, 1,
-0.1001625, 1.948913, 1.001283, 1, 0, 0, 1, 1,
-0.09726828, -0.7772624, -2.819676, 1, 0, 0, 1, 1,
-0.08816548, 1.003657, -1.002178, 0, 0, 0, 1, 1,
-0.08785503, -0.8732494, -3.84471, 0, 0, 0, 1, 1,
-0.08596499, -0.1284723, -3.597795, 0, 0, 0, 1, 1,
-0.08427693, 0.791763, 1.321564, 0, 0, 0, 1, 1,
-0.08064329, 0.4340211, 0.5690894, 0, 0, 0, 1, 1,
-0.07894447, -0.1787846, -3.097075, 0, 0, 0, 1, 1,
-0.07755905, -0.7256742, -3.566682, 0, 0, 0, 1, 1,
-0.0773517, 2.40324, -0.0831281, 1, 1, 1, 1, 1,
-0.07624595, 1.609267, -0.5860804, 1, 1, 1, 1, 1,
-0.0697884, 0.4142474, 0.3258404, 1, 1, 1, 1, 1,
-0.06718912, -1.14021, -2.836157, 1, 1, 1, 1, 1,
-0.06370315, -0.5070874, -2.401785, 1, 1, 1, 1, 1,
-0.06030982, -0.6063492, -5.535584, 1, 1, 1, 1, 1,
-0.05599202, -1.052166, -1.628831, 1, 1, 1, 1, 1,
-0.05553253, 0.8572276, 1.795562, 1, 1, 1, 1, 1,
-0.05484163, 1.164458, 0.4482866, 1, 1, 1, 1, 1,
-0.05305358, 0.03071685, -1.069422, 1, 1, 1, 1, 1,
-0.05163412, -0.2054404, -3.202617, 1, 1, 1, 1, 1,
-0.05099115, -1.205757, -4.285629, 1, 1, 1, 1, 1,
-0.0505874, 1.160076, -1.219869, 1, 1, 1, 1, 1,
-0.04856227, -0.6170709, -3.305859, 1, 1, 1, 1, 1,
-0.04850056, -0.4792996, -2.626868, 1, 1, 1, 1, 1,
-0.04302596, -0.07305969, -4.069641, 0, 0, 1, 1, 1,
-0.04231005, -0.6674761, -3.606886, 1, 0, 0, 1, 1,
-0.03489666, 0.6962509, 1.333693, 1, 0, 0, 1, 1,
-0.03460575, 0.1498526, -1.802684, 1, 0, 0, 1, 1,
-0.03426494, -0.7197689, -3.1061, 1, 0, 0, 1, 1,
-0.03097185, -0.7480225, -3.685542, 1, 0, 0, 1, 1,
-0.0307176, 0.01110856, 0.4065064, 0, 0, 0, 1, 1,
-0.0305243, 1.117471, 2.5493, 0, 0, 0, 1, 1,
-0.0291594, 0.003827791, -3.095754, 0, 0, 0, 1, 1,
-0.02786333, -1.730471, -3.687772, 0, 0, 0, 1, 1,
-0.02688754, 1.016503, -0.5397676, 0, 0, 0, 1, 1,
-0.02245262, -2.11133, -0.7386202, 0, 0, 0, 1, 1,
-0.01977291, -0.1236758, -0.8121951, 0, 0, 0, 1, 1,
-0.01889732, 2.172266, -1.079882, 1, 1, 1, 1, 1,
-0.01790152, 1.296977, -0.3097773, 1, 1, 1, 1, 1,
-0.01774183, 1.126363, -1.081338, 1, 1, 1, 1, 1,
-0.01610127, -0.4440006, -2.580915, 1, 1, 1, 1, 1,
-0.01567323, 0.5423185, 0.5096295, 1, 1, 1, 1, 1,
-0.00615005, 0.03988799, 0.449626, 1, 1, 1, 1, 1,
-0.0005980107, -0.7200065, -1.308973, 1, 1, 1, 1, 1,
0.0008477327, 0.508543, -0.1070852, 1, 1, 1, 1, 1,
0.001479459, -0.6867078, 4.026821, 1, 1, 1, 1, 1,
0.001657376, 1.03064, 0.5509658, 1, 1, 1, 1, 1,
0.001714672, -1.540416, 2.149575, 1, 1, 1, 1, 1,
0.002639498, 1.386759, -0.2814851, 1, 1, 1, 1, 1,
0.002984084, -1.194613, 3.581655, 1, 1, 1, 1, 1,
0.00952537, -0.9202063, 4.159118, 1, 1, 1, 1, 1,
0.01212704, -0.9538161, 2.30778, 1, 1, 1, 1, 1,
0.01441723, 0.1718726, 0.4584499, 0, 0, 1, 1, 1,
0.01498578, -0.9128067, 2.396422, 1, 0, 0, 1, 1,
0.01508499, -0.01496352, 3.625196, 1, 0, 0, 1, 1,
0.02132655, 0.1760178, 0.7813816, 1, 0, 0, 1, 1,
0.02146178, -1.088944, 3.925256, 1, 0, 0, 1, 1,
0.02161113, -0.3607451, 2.329886, 1, 0, 0, 1, 1,
0.02250177, 0.4868548, -1.48259, 0, 0, 0, 1, 1,
0.02501609, 1.33621, -0.3321786, 0, 0, 0, 1, 1,
0.02529546, 0.2259824, 0.2089364, 0, 0, 0, 1, 1,
0.02933702, -0.1075794, 1.948418, 0, 0, 0, 1, 1,
0.03150979, -0.5908259, 1.386225, 0, 0, 0, 1, 1,
0.03468392, -1.202264, 4.717388, 0, 0, 0, 1, 1,
0.04161063, -0.4498739, 2.912654, 0, 0, 0, 1, 1,
0.0418934, 0.03959835, -0.035065, 1, 1, 1, 1, 1,
0.04198038, -1.297546, 3.486969, 1, 1, 1, 1, 1,
0.04286861, -0.8993052, 2.663579, 1, 1, 1, 1, 1,
0.04498037, 0.5688333, 0.07786024, 1, 1, 1, 1, 1,
0.04649151, -0.8655694, 2.226098, 1, 1, 1, 1, 1,
0.04725813, -0.9181711, 2.223429, 1, 1, 1, 1, 1,
0.04995321, -0.2820396, 1.7383, 1, 1, 1, 1, 1,
0.05245103, -0.6181887, 2.695828, 1, 1, 1, 1, 1,
0.05259439, 0.3892114, -0.5948017, 1, 1, 1, 1, 1,
0.05349969, -0.6284704, 1.760252, 1, 1, 1, 1, 1,
0.05424418, -1.868987, 4.055618, 1, 1, 1, 1, 1,
0.05553114, 1.017565, -1.057449, 1, 1, 1, 1, 1,
0.06242054, -0.1609505, 3.15113, 1, 1, 1, 1, 1,
0.06844701, 0.1152679, -0.4008669, 1, 1, 1, 1, 1,
0.07279259, 0.4554262, -1.193084, 1, 1, 1, 1, 1,
0.07296181, 0.179149, -1.27024, 0, 0, 1, 1, 1,
0.07506709, 0.3047929, 2.429437, 1, 0, 0, 1, 1,
0.07578972, -0.9465937, 2.588027, 1, 0, 0, 1, 1,
0.07831611, 1.828763, 0.7767318, 1, 0, 0, 1, 1,
0.08204097, 0.4187557, 1.40223, 1, 0, 0, 1, 1,
0.08204223, 0.7416506, 0.5496462, 1, 0, 0, 1, 1,
0.08274679, 0.225763, 0.03514087, 0, 0, 0, 1, 1,
0.08351123, -2.863677, 3.378926, 0, 0, 0, 1, 1,
0.08564808, -0.1016903, 3.130678, 0, 0, 0, 1, 1,
0.08593984, 0.9537765, 0.07430982, 0, 0, 0, 1, 1,
0.08873168, 0.9415511, 0.3481823, 0, 0, 0, 1, 1,
0.09046132, 0.209362, 0.2266701, 0, 0, 0, 1, 1,
0.09102599, 0.6441036, -0.5842179, 0, 0, 0, 1, 1,
0.09508437, 0.8658506, 2.835528, 1, 1, 1, 1, 1,
0.09729093, -0.3567423, 3.351657, 1, 1, 1, 1, 1,
0.09918635, 0.5422819, 0.2570984, 1, 1, 1, 1, 1,
0.1027086, 0.09530305, 2.015819, 1, 1, 1, 1, 1,
0.1058643, -0.9000895, 3.415623, 1, 1, 1, 1, 1,
0.1093558, -0.6297456, 4.768789, 1, 1, 1, 1, 1,
0.1163532, 1.058571, -1.47538, 1, 1, 1, 1, 1,
0.1174458, 1.433316, 0.2118955, 1, 1, 1, 1, 1,
0.118021, 0.1549854, 0.2438327, 1, 1, 1, 1, 1,
0.1191092, -1.082583, 3.667466, 1, 1, 1, 1, 1,
0.1197757, -0.1016675, 2.560469, 1, 1, 1, 1, 1,
0.1223165, 0.4461147, 0.5781167, 1, 1, 1, 1, 1,
0.1228837, -0.9467015, 2.036436, 1, 1, 1, 1, 1,
0.1260184, -0.2299646, 3.081522, 1, 1, 1, 1, 1,
0.1318021, 0.4076991, -0.3174278, 1, 1, 1, 1, 1,
0.1346805, -0.200592, 1.059509, 0, 0, 1, 1, 1,
0.1372947, -0.09210848, 1.575151, 1, 0, 0, 1, 1,
0.1419979, 0.06734217, 2.521095, 1, 0, 0, 1, 1,
0.1430968, 1.821676, -0.8500857, 1, 0, 0, 1, 1,
0.1508559, 0.180885, -1.610783, 1, 0, 0, 1, 1,
0.163456, -0.5823406, 2.370697, 1, 0, 0, 1, 1,
0.1642714, 1.196863, -1.50498, 0, 0, 0, 1, 1,
0.1658018, 0.05564035, 2.106424, 0, 0, 0, 1, 1,
0.1670292, -0.8903613, 2.37853, 0, 0, 0, 1, 1,
0.1684696, 2.08145, 0.3884947, 0, 0, 0, 1, 1,
0.1700492, -1.23899, 3.552623, 0, 0, 0, 1, 1,
0.1702319, 1.177409, 0.4914979, 0, 0, 0, 1, 1,
0.1712579, -0.4655934, 2.240821, 0, 0, 0, 1, 1,
0.1783002, -1.420022, 3.031709, 1, 1, 1, 1, 1,
0.1823108, -0.5765527, 1.388948, 1, 1, 1, 1, 1,
0.1834391, 0.1322404, 0.5961742, 1, 1, 1, 1, 1,
0.1852771, -2.217796, 1.974001, 1, 1, 1, 1, 1,
0.1868099, 0.9172212, 0.3863474, 1, 1, 1, 1, 1,
0.1927771, 0.3070785, 1.510212, 1, 1, 1, 1, 1,
0.1961085, -0.06115092, 0.6857615, 1, 1, 1, 1, 1,
0.2000467, 0.2029453, 1.035264, 1, 1, 1, 1, 1,
0.2004706, 0.8265145, -0.4778037, 1, 1, 1, 1, 1,
0.2025364, 0.0714155, 0.7483876, 1, 1, 1, 1, 1,
0.2058953, -1.190686, 2.964521, 1, 1, 1, 1, 1,
0.207638, 0.5651694, 1.804883, 1, 1, 1, 1, 1,
0.2109119, -0.5409237, 4.066189, 1, 1, 1, 1, 1,
0.2142521, -1.375187, 3.969706, 1, 1, 1, 1, 1,
0.2170533, -0.5126006, 3.166952, 1, 1, 1, 1, 1,
0.217402, 0.2574252, 0.7141344, 0, 0, 1, 1, 1,
0.2233815, -1.305749, 4.281458, 1, 0, 0, 1, 1,
0.227432, 0.9926577, 1.419206, 1, 0, 0, 1, 1,
0.2277849, 0.898156, 0.1003412, 1, 0, 0, 1, 1,
0.2281976, 0.5658746, -0.2172485, 1, 0, 0, 1, 1,
0.230156, -0.9290562, 2.435422, 1, 0, 0, 1, 1,
0.234898, 0.6998947, 0.8350053, 0, 0, 0, 1, 1,
0.2452926, -0.5473519, 2.504173, 0, 0, 0, 1, 1,
0.2472214, 1.425184, 0.7898105, 0, 0, 0, 1, 1,
0.2483217, 0.9077227, 0.6243263, 0, 0, 0, 1, 1,
0.249232, 0.3520847, 2.020255, 0, 0, 0, 1, 1,
0.249633, -0.862406, 4.328039, 0, 0, 0, 1, 1,
0.2520536, 0.7310879, 0.1625173, 0, 0, 0, 1, 1,
0.2535295, -2.02481, 2.130502, 1, 1, 1, 1, 1,
0.2555203, 0.8340153, 1.26886, 1, 1, 1, 1, 1,
0.2599807, -0.3171085, 2.777135, 1, 1, 1, 1, 1,
0.2606051, 0.474259, -1.066473, 1, 1, 1, 1, 1,
0.2636564, 0.06820715, 2.152985, 1, 1, 1, 1, 1,
0.2651524, 0.8632053, 0.753196, 1, 1, 1, 1, 1,
0.2675031, -0.4665468, 3.242106, 1, 1, 1, 1, 1,
0.271541, -0.2690878, 2.680665, 1, 1, 1, 1, 1,
0.2729275, -0.9094129, 1.434734, 1, 1, 1, 1, 1,
0.2746412, -0.4641972, 2.848305, 1, 1, 1, 1, 1,
0.2751969, 0.9451754, 1.533413, 1, 1, 1, 1, 1,
0.2762755, -1.15239, 1.222855, 1, 1, 1, 1, 1,
0.2779426, -1.219683, 3.078887, 1, 1, 1, 1, 1,
0.2796757, -0.4812899, 2.22494, 1, 1, 1, 1, 1,
0.2835094, 1.020416, -0.1949796, 1, 1, 1, 1, 1,
0.2866717, 0.2705221, 1.591691, 0, 0, 1, 1, 1,
0.2869825, 0.04198621, 1.631266, 1, 0, 0, 1, 1,
0.2894228, -0.2936816, 1.713964, 1, 0, 0, 1, 1,
0.2916088, -0.4189506, 2.041691, 1, 0, 0, 1, 1,
0.2966999, 0.7888912, 1.060896, 1, 0, 0, 1, 1,
0.2979433, 0.9350361, -1.236431, 1, 0, 0, 1, 1,
0.2981932, 0.7252693, 0.9802058, 0, 0, 0, 1, 1,
0.3034741, -0.3066962, 1.351539, 0, 0, 0, 1, 1,
0.3044116, -0.133998, 2.090373, 0, 0, 0, 1, 1,
0.3106557, -0.2726536, 1.702262, 0, 0, 0, 1, 1,
0.3121525, 0.4021999, -0.06563758, 0, 0, 0, 1, 1,
0.3129595, 0.3518924, -0.1757788, 0, 0, 0, 1, 1,
0.3179286, -0.3820971, 2.171258, 0, 0, 0, 1, 1,
0.3184328, 0.8281186, 1.68144, 1, 1, 1, 1, 1,
0.3185342, -0.5068651, 1.805438, 1, 1, 1, 1, 1,
0.3256874, -0.2276462, 3.17084, 1, 1, 1, 1, 1,
0.3260552, 0.006447313, 2.358176, 1, 1, 1, 1, 1,
0.3261295, 0.585884, 0.2938396, 1, 1, 1, 1, 1,
0.3277465, 1.441436, 0.956989, 1, 1, 1, 1, 1,
0.3280668, -0.501788, 2.426749, 1, 1, 1, 1, 1,
0.3356852, -1.345417, 2.115105, 1, 1, 1, 1, 1,
0.3359753, 0.7454621, -1.063745, 1, 1, 1, 1, 1,
0.3365785, -0.2792791, 3.747357, 1, 1, 1, 1, 1,
0.3365861, -0.158226, 2.218291, 1, 1, 1, 1, 1,
0.3393244, 1.815041, 0.03296778, 1, 1, 1, 1, 1,
0.3407463, -0.6283352, 2.130627, 1, 1, 1, 1, 1,
0.341389, 0.08094977, 2.349609, 1, 1, 1, 1, 1,
0.3452207, -0.3260671, 3.54899, 1, 1, 1, 1, 1,
0.3480694, 0.5290416, -0.8695678, 0, 0, 1, 1, 1,
0.3488882, 0.1755903, 0.5250607, 1, 0, 0, 1, 1,
0.3493785, -0.1817183, 1.656664, 1, 0, 0, 1, 1,
0.3502207, 0.6960987, -0.1271786, 1, 0, 0, 1, 1,
0.3503945, 0.6850583, -0.1003691, 1, 0, 0, 1, 1,
0.3507598, -0.4768333, 2.94836, 1, 0, 0, 1, 1,
0.3508061, 0.1158939, 1.438038, 0, 0, 0, 1, 1,
0.3530516, 1.573023, 1.447034, 0, 0, 0, 1, 1,
0.3582042, 1.420243, -1.053121, 0, 0, 0, 1, 1,
0.3597419, 0.02857883, 1.690444, 0, 0, 0, 1, 1,
0.3621404, -0.4724964, 2.392718, 0, 0, 0, 1, 1,
0.3658907, -0.4560761, 2.902145, 0, 0, 0, 1, 1,
0.3672144, 1.377423, 0.6480902, 0, 0, 0, 1, 1,
0.3689794, -0.8044721, 1.799679, 1, 1, 1, 1, 1,
0.3745096, 0.4318295, -0.5911668, 1, 1, 1, 1, 1,
0.3786112, -1.16539, 3.843847, 1, 1, 1, 1, 1,
0.3790992, -1.647492, 1.753932, 1, 1, 1, 1, 1,
0.3836715, -0.5724142, 2.30514, 1, 1, 1, 1, 1,
0.3903828, 0.3222208, 1.253433, 1, 1, 1, 1, 1,
0.3909123, 0.9087037, -0.09738714, 1, 1, 1, 1, 1,
0.3957123, -0.2001219, 2.772292, 1, 1, 1, 1, 1,
0.3958353, -2.097755, -0.1777767, 1, 1, 1, 1, 1,
0.3987049, 1.149251, 0.3407932, 1, 1, 1, 1, 1,
0.3987167, 0.9343675, 1.115967, 1, 1, 1, 1, 1,
0.3999874, 0.1112069, 1.36012, 1, 1, 1, 1, 1,
0.4034003, -1.536142, 3.989387, 1, 1, 1, 1, 1,
0.4034214, 0.3680137, 1.819625, 1, 1, 1, 1, 1,
0.4042137, 0.3069176, 1.06377, 1, 1, 1, 1, 1,
0.4044995, -0.5077949, 3.677279, 0, 0, 1, 1, 1,
0.408187, -1.012875, 3.211392, 1, 0, 0, 1, 1,
0.4096018, -0.6132355, 1.242549, 1, 0, 0, 1, 1,
0.4130867, 1.170509, 1.13953, 1, 0, 0, 1, 1,
0.4146106, -0.1516421, 0.4467419, 1, 0, 0, 1, 1,
0.425496, -0.5319182, 1.758571, 1, 0, 0, 1, 1,
0.4327663, 0.9479737, 1.907694, 0, 0, 0, 1, 1,
0.4334535, -1.566599, 1.939169, 0, 0, 0, 1, 1,
0.4354182, 0.4057437, -0.3872272, 0, 0, 0, 1, 1,
0.436229, -0.3478372, 3.750445, 0, 0, 0, 1, 1,
0.4394356, 0.5058649, 3.181801, 0, 0, 0, 1, 1,
0.4519355, 0.7251437, 1.954971, 0, 0, 0, 1, 1,
0.4547632, -0.2131057, 2.537607, 0, 0, 0, 1, 1,
0.4571613, 1.18345, 0.3121673, 1, 1, 1, 1, 1,
0.4579863, 1.100802, 0.58409, 1, 1, 1, 1, 1,
0.4585357, -0.1506185, 0.6078213, 1, 1, 1, 1, 1,
0.4612364, 0.7846615, -0.5427219, 1, 1, 1, 1, 1,
0.4657446, 0.03484707, 1.560176, 1, 1, 1, 1, 1,
0.4726966, 0.6570078, -0.01136293, 1, 1, 1, 1, 1,
0.4742851, 1.225905, -0.2635551, 1, 1, 1, 1, 1,
0.4773157, -0.6221799, 2.740381, 1, 1, 1, 1, 1,
0.4823423, 0.4446845, 1.906458, 1, 1, 1, 1, 1,
0.4853073, 1.111585, -0.1918217, 1, 1, 1, 1, 1,
0.4861902, -1.266786, 3.124935, 1, 1, 1, 1, 1,
0.4890569, -0.7934848, 1.983107, 1, 1, 1, 1, 1,
0.4894513, 0.01036636, 1.788842, 1, 1, 1, 1, 1,
0.497468, -0.4359664, 1.052191, 1, 1, 1, 1, 1,
0.4984493, 0.09131165, 0.445567, 1, 1, 1, 1, 1,
0.5004624, -1.461933, 3.994342, 0, 0, 1, 1, 1,
0.5013787, 0.2302939, 0.9623976, 1, 0, 0, 1, 1,
0.5075155, 0.6319225, 1.598882, 1, 0, 0, 1, 1,
0.5111781, 0.05591311, 2.267945, 1, 0, 0, 1, 1,
0.5123066, 1.601337, 0.5096478, 1, 0, 0, 1, 1,
0.5128323, 0.4328524, 0.6076425, 1, 0, 0, 1, 1,
0.5173241, 1.178428, 0.6327594, 0, 0, 0, 1, 1,
0.517536, 0.7791263, -0.4845188, 0, 0, 0, 1, 1,
0.5208158, 0.5782334, -0.075831, 0, 0, 0, 1, 1,
0.5248775, 0.6368428, 1.581926, 0, 0, 0, 1, 1,
0.5281076, 0.3314419, 0.6445463, 0, 0, 0, 1, 1,
0.5301887, 1.05781, 0.2050671, 0, 0, 0, 1, 1,
0.5306079, -1.762212, 1.302683, 0, 0, 0, 1, 1,
0.5312453, -0.03521857, 1.099167, 1, 1, 1, 1, 1,
0.535802, -0.5143149, 2.493588, 1, 1, 1, 1, 1,
0.5379837, -1.623371, 1.866506, 1, 1, 1, 1, 1,
0.5392491, 0.4356176, 0.9012337, 1, 1, 1, 1, 1,
0.5411755, 0.3058204, 1.114085, 1, 1, 1, 1, 1,
0.5412272, 1.38596, 0.4338212, 1, 1, 1, 1, 1,
0.5463256, -0.4650111, 1.04718, 1, 1, 1, 1, 1,
0.5530914, -0.4164428, 2.39931, 1, 1, 1, 1, 1,
0.5537034, 0.6577028, 0.8130063, 1, 1, 1, 1, 1,
0.5546649, -0.6193326, 2.301703, 1, 1, 1, 1, 1,
0.5547907, 0.7827163, 1.644141, 1, 1, 1, 1, 1,
0.559697, 0.2540647, 0.253235, 1, 1, 1, 1, 1,
0.5598024, 0.8957044, 0.3114135, 1, 1, 1, 1, 1,
0.5598894, -1.931265, 5.624605, 1, 1, 1, 1, 1,
0.5610142, 0.5057952, 2.179707, 1, 1, 1, 1, 1,
0.5611163, -0.07453838, 1.709718, 0, 0, 1, 1, 1,
0.5655316, -1.085626, 3.578518, 1, 0, 0, 1, 1,
0.5673954, -0.5473837, 1.831511, 1, 0, 0, 1, 1,
0.5684242, -0.08563203, 1.677629, 1, 0, 0, 1, 1,
0.5703555, -0.1419612, 0.02332265, 1, 0, 0, 1, 1,
0.5712006, 1.241313, 1.845338, 1, 0, 0, 1, 1,
0.5811703, -1.732552, 2.958576, 0, 0, 0, 1, 1,
0.5817152, -0.00729237, 2.434427, 0, 0, 0, 1, 1,
0.5835588, 2.446789, -2.395682, 0, 0, 0, 1, 1,
0.5857206, -1.032971, 3.519267, 0, 0, 0, 1, 1,
0.5871754, 0.3084583, 1.327794, 0, 0, 0, 1, 1,
0.5895495, -1.569554, 3.18282, 0, 0, 0, 1, 1,
0.5961717, 0.2731113, -0.01945053, 0, 0, 0, 1, 1,
0.5965163, 0.1091648, 2.032886, 1, 1, 1, 1, 1,
0.5969695, 0.8969692, -0.5141947, 1, 1, 1, 1, 1,
0.6029318, -1.202436, 3.790685, 1, 1, 1, 1, 1,
0.6049587, 1.211793, -1.255999, 1, 1, 1, 1, 1,
0.6058512, -0.5982631, 2.76478, 1, 1, 1, 1, 1,
0.6064101, 0.7932982, 2.960787, 1, 1, 1, 1, 1,
0.6107301, 0.2388982, 1.937882, 1, 1, 1, 1, 1,
0.6268992, 0.6645684, 1.519129, 1, 1, 1, 1, 1,
0.6292726, -1.192399, 2.089176, 1, 1, 1, 1, 1,
0.6294317, 0.0713627, 0.6129426, 1, 1, 1, 1, 1,
0.630284, 0.03267778, 1.337853, 1, 1, 1, 1, 1,
0.6316813, -0.01601254, 1.972724, 1, 1, 1, 1, 1,
0.6343536, -0.5586799, 1.823883, 1, 1, 1, 1, 1,
0.6363117, -0.6251213, 1.062124, 1, 1, 1, 1, 1,
0.6436214, 1.410003, -0.02960635, 1, 1, 1, 1, 1,
0.6453647, -0.05370282, -0.1902728, 0, 0, 1, 1, 1,
0.6471283, -0.4684379, 0.7526658, 1, 0, 0, 1, 1,
0.650869, 2.131073, -0.9540981, 1, 0, 0, 1, 1,
0.6547816, 0.3442731, 0.7144492, 1, 0, 0, 1, 1,
0.6578842, 1.875834, 0.1620411, 1, 0, 0, 1, 1,
0.6608623, 0.1721223, 0.2401438, 1, 0, 0, 1, 1,
0.6721349, 0.7719195, 0.4491515, 0, 0, 0, 1, 1,
0.6755913, -1.069481, 4.290604, 0, 0, 0, 1, 1,
0.6768082, -0.5927055, 2.396208, 0, 0, 0, 1, 1,
0.6769189, -1.751867, 1.594469, 0, 0, 0, 1, 1,
0.679997, -2.078852, 0.6524072, 0, 0, 0, 1, 1,
0.6808206, 0.5084096, 0.5164097, 0, 0, 0, 1, 1,
0.6911945, 0.3624639, 1.486107, 0, 0, 0, 1, 1,
0.6923527, 1.031377, -0.2251275, 1, 1, 1, 1, 1,
0.6949562, 1.987119, -0.6297309, 1, 1, 1, 1, 1,
0.6960743, 0.5113075, 1.421089, 1, 1, 1, 1, 1,
0.6963218, -2.416375, 4.109535, 1, 1, 1, 1, 1,
0.6976514, 1.212746, 0.5043224, 1, 1, 1, 1, 1,
0.6994992, -0.8241923, 4.1054, 1, 1, 1, 1, 1,
0.701951, -0.4009521, 0.6337094, 1, 1, 1, 1, 1,
0.7022656, -2.618582, 1.339943, 1, 1, 1, 1, 1,
0.7027351, -0.9848706, 2.072607, 1, 1, 1, 1, 1,
0.7033917, 0.5260001, -0.1526644, 1, 1, 1, 1, 1,
0.707465, -0.2584528, 2.567695, 1, 1, 1, 1, 1,
0.7137148, 1.098283, 1.624534, 1, 1, 1, 1, 1,
0.7151271, -0.6822416, 2.396097, 1, 1, 1, 1, 1,
0.7167983, -1.932918, 2.706868, 1, 1, 1, 1, 1,
0.7243726, -0.8825861, 1.632006, 1, 1, 1, 1, 1,
0.7255875, 2.039912, -0.08616666, 0, 0, 1, 1, 1,
0.7329161, -1.466107, 2.955194, 1, 0, 0, 1, 1,
0.7363133, 0.5399656, 2.857735, 1, 0, 0, 1, 1,
0.7373807, -0.9954616, 2.60452, 1, 0, 0, 1, 1,
0.7454573, -0.3017029, 1.405405, 1, 0, 0, 1, 1,
0.7475361, -2.250575, 2.294379, 1, 0, 0, 1, 1,
0.7483743, -0.3618253, 0.2531488, 0, 0, 0, 1, 1,
0.7506469, -1.218368, 3.041869, 0, 0, 0, 1, 1,
0.753505, 0.2340938, 2.404042, 0, 0, 0, 1, 1,
0.757676, 0.7364466, -0.69594, 0, 0, 0, 1, 1,
0.7650308, -0.1959181, 3.139144, 0, 0, 0, 1, 1,
0.7661766, 1.249805, 0.5579224, 0, 0, 0, 1, 1,
0.7677057, 1.188397, 1.660995, 0, 0, 0, 1, 1,
0.7809365, 0.9193335, 0.735409, 1, 1, 1, 1, 1,
0.7819256, 0.4889882, 1.72009, 1, 1, 1, 1, 1,
0.7822629, -1.09986, 2.85407, 1, 1, 1, 1, 1,
0.7856136, 0.4299735, 1.1648, 1, 1, 1, 1, 1,
0.7890096, 0.9988618, 1.254258, 1, 1, 1, 1, 1,
0.7942845, -1.705345, 1.656021, 1, 1, 1, 1, 1,
0.7991278, -0.1305334, 2.364288, 1, 1, 1, 1, 1,
0.7992657, 1.726453, 0.7893746, 1, 1, 1, 1, 1,
0.8051216, 1.697481, -0.07276859, 1, 1, 1, 1, 1,
0.8053994, 0.8223844, 1.559705, 1, 1, 1, 1, 1,
0.8082121, -1.20251, 1.871246, 1, 1, 1, 1, 1,
0.8138251, -1.590753, 2.748385, 1, 1, 1, 1, 1,
0.8161765, -1.030522, 2.151852, 1, 1, 1, 1, 1,
0.8163252, -0.317186, 0.5601529, 1, 1, 1, 1, 1,
0.8257118, 0.3394519, -0.9253413, 1, 1, 1, 1, 1,
0.8264194, -0.6942546, 2.190889, 0, 0, 1, 1, 1,
0.8359471, 0.768103, -1.178559, 1, 0, 0, 1, 1,
0.8364987, 0.2169644, -0.4191937, 1, 0, 0, 1, 1,
0.8394962, -0.3893035, 2.89677, 1, 0, 0, 1, 1,
0.8400923, 0.6074363, 1.868083, 1, 0, 0, 1, 1,
0.8407952, 0.4260246, 0.5997653, 1, 0, 0, 1, 1,
0.8458091, -1.206207, 2.918596, 0, 0, 0, 1, 1,
0.8464549, 0.5855837, 1.732365, 0, 0, 0, 1, 1,
0.8555549, 0.5746059, 3.728042, 0, 0, 0, 1, 1,
0.8584392, -2.028173, 3.396989, 0, 0, 0, 1, 1,
0.8608286, -0.9529705, 4.776641, 0, 0, 0, 1, 1,
0.8636018, 1.460413, -0.4153383, 0, 0, 0, 1, 1,
0.8655829, 0.1585585, 1.682622, 0, 0, 0, 1, 1,
0.8780543, -0.113777, 1.215158, 1, 1, 1, 1, 1,
0.8788818, -0.2851064, 2.764, 1, 1, 1, 1, 1,
0.8791854, 1.670575, -1.354832, 1, 1, 1, 1, 1,
0.8872847, 0.8592641, 0.7263804, 1, 1, 1, 1, 1,
0.887298, -0.1662801, 2.278942, 1, 1, 1, 1, 1,
0.8904799, 0.1774341, 2.37702, 1, 1, 1, 1, 1,
0.8937229, -0.3115744, 2.229029, 1, 1, 1, 1, 1,
0.8948209, 0.5328691, -0.2419457, 1, 1, 1, 1, 1,
0.8964168, 0.3032988, 1.201003, 1, 1, 1, 1, 1,
0.8976156, -0.3434832, 3.536391, 1, 1, 1, 1, 1,
0.8993925, 0.2871712, 1.296482, 1, 1, 1, 1, 1,
0.9055899, 0.905213, 3.444102, 1, 1, 1, 1, 1,
0.9060211, -1.197531, 3.960972, 1, 1, 1, 1, 1,
0.9112725, -0.7311043, 1.743196, 1, 1, 1, 1, 1,
0.9155008, 0.5046123, 2.283492, 1, 1, 1, 1, 1,
0.9170799, -1.628715, 3.318539, 0, 0, 1, 1, 1,
0.9200812, 0.5336395, 0.4944438, 1, 0, 0, 1, 1,
0.9203089, -1.860978, 1.709941, 1, 0, 0, 1, 1,
0.9217721, 0.1276525, 0.06404101, 1, 0, 0, 1, 1,
0.9245614, -0.5623488, 1.695792, 1, 0, 0, 1, 1,
0.9335189, 1.124265, 1.470702, 1, 0, 0, 1, 1,
0.9341182, -0.6109245, 0.6759307, 0, 0, 0, 1, 1,
0.935705, 0.2567234, 1.613348, 0, 0, 0, 1, 1,
0.9360745, -0.7759052, 2.364443, 0, 0, 0, 1, 1,
0.9361397, 0.09387771, 2.38028, 0, 0, 0, 1, 1,
0.9398597, 1.156544, 0.520784, 0, 0, 0, 1, 1,
0.9427006, -1.525351, 2.3698, 0, 0, 0, 1, 1,
0.9437792, 0.4254209, 1.50023, 0, 0, 0, 1, 1,
0.9458851, 0.1839097, 1.482584, 1, 1, 1, 1, 1,
0.9478401, 0.9237313, 0.9899293, 1, 1, 1, 1, 1,
0.9527645, 1.065241, 1.884701, 1, 1, 1, 1, 1,
0.9609546, -1.976759, 2.62931, 1, 1, 1, 1, 1,
0.9664007, -1.805451, 2.763474, 1, 1, 1, 1, 1,
0.970181, 0.1691064, 3.757519, 1, 1, 1, 1, 1,
0.985074, 0.1236795, 0.3409933, 1, 1, 1, 1, 1,
0.9877409, -0.8788531, 1.14837, 1, 1, 1, 1, 1,
0.9880688, 0.328765, 4.027932, 1, 1, 1, 1, 1,
0.9899056, -0.6197079, 2.394162, 1, 1, 1, 1, 1,
0.9934319, 0.4458994, 1.109742, 1, 1, 1, 1, 1,
0.9939697, -2.308592, 4.551793, 1, 1, 1, 1, 1,
0.9955359, 0.104582, 2.482494, 1, 1, 1, 1, 1,
0.9977237, 0.1238743, 1.498614, 1, 1, 1, 1, 1,
0.9985065, -0.08893423, 0.3887845, 1, 1, 1, 1, 1,
1.000367, -1.506999, 2.402218, 0, 0, 1, 1, 1,
1.006002, -1.667386, 2.484869, 1, 0, 0, 1, 1,
1.009044, 0.6716383, 1.315824, 1, 0, 0, 1, 1,
1.010158, -0.1415015, 1.707471, 1, 0, 0, 1, 1,
1.011649, -0.4586531, 1.109414, 1, 0, 0, 1, 1,
1.012316, 1.175993, -1.289806, 1, 0, 0, 1, 1,
1.015707, 0.598737, 0.7491989, 0, 0, 0, 1, 1,
1.019289, -0.1543525, 2.275571, 0, 0, 0, 1, 1,
1.027894, 0.3050569, 1.86774, 0, 0, 0, 1, 1,
1.038652, -0.312296, 0.4446637, 0, 0, 0, 1, 1,
1.0512, -1.391096, 1.627593, 0, 0, 0, 1, 1,
1.052678, -1.311904, 1.925755, 0, 0, 0, 1, 1,
1.05886, -0.2122677, 0.62141, 0, 0, 0, 1, 1,
1.059253, 0.6299134, 0.1337922, 1, 1, 1, 1, 1,
1.06235, -0.1913315, 0.5937009, 1, 1, 1, 1, 1,
1.06475, -0.7892911, 2.968889, 1, 1, 1, 1, 1,
1.071163, 1.538101, 0.3477531, 1, 1, 1, 1, 1,
1.072931, -1.591005, 2.172411, 1, 1, 1, 1, 1,
1.085501, -0.5020398, 3.567452, 1, 1, 1, 1, 1,
1.089694, 2.226935, 1.397534, 1, 1, 1, 1, 1,
1.093112, -0.1949552, 1.369996, 1, 1, 1, 1, 1,
1.102137, -1.743782, 3.594975, 1, 1, 1, 1, 1,
1.107191, 0.4811253, 2.572817, 1, 1, 1, 1, 1,
1.109005, -2.208295, 0.8139832, 1, 1, 1, 1, 1,
1.112907, 0.339622, 1.588676, 1, 1, 1, 1, 1,
1.13668, -0.4936637, 0.7386173, 1, 1, 1, 1, 1,
1.138973, -1.673102, 2.397319, 1, 1, 1, 1, 1,
1.1395, 1.409958, 0.8574153, 1, 1, 1, 1, 1,
1.1404, -0.601, 1.831825, 0, 0, 1, 1, 1,
1.144306, -1.311979, 5.901729, 1, 0, 0, 1, 1,
1.147205, 0.934879, 1.197748, 1, 0, 0, 1, 1,
1.148919, -1.247545, 2.696298, 1, 0, 0, 1, 1,
1.148975, 0.2976865, 1.538609, 1, 0, 0, 1, 1,
1.151199, -0.6584435, 3.378465, 1, 0, 0, 1, 1,
1.163491, 0.6776231, 0.959624, 0, 0, 0, 1, 1,
1.164967, 0.5489569, 3.045885, 0, 0, 0, 1, 1,
1.179578, 0.2285139, 0.455229, 0, 0, 0, 1, 1,
1.1797, 0.4041612, -0.4545338, 0, 0, 0, 1, 1,
1.187326, -0.7849188, 2.901712, 0, 0, 0, 1, 1,
1.187573, 1.592549, 1.453429, 0, 0, 0, 1, 1,
1.190618, -0.6171986, 3.163017, 0, 0, 0, 1, 1,
1.193767, -1.839008, 2.223984, 1, 1, 1, 1, 1,
1.201085, 0.1096217, 1.512499, 1, 1, 1, 1, 1,
1.215426, -1.733654, 3.613179, 1, 1, 1, 1, 1,
1.219447, -1.985722, 2.870153, 1, 1, 1, 1, 1,
1.222443, 0.3887412, 0.6266904, 1, 1, 1, 1, 1,
1.228498, -1.217803, 1.92002, 1, 1, 1, 1, 1,
1.238315, 0.1924025, 1.866154, 1, 1, 1, 1, 1,
1.248385, -0.009148753, 1.919195, 1, 1, 1, 1, 1,
1.258423, 0.7047867, 2.637226, 1, 1, 1, 1, 1,
1.270898, 0.9465598, -0.08306338, 1, 1, 1, 1, 1,
1.27638, -1.368307, 2.372697, 1, 1, 1, 1, 1,
1.280793, -0.1764777, 3.960847, 1, 1, 1, 1, 1,
1.28306, 0.621872, 0.5944206, 1, 1, 1, 1, 1,
1.28417, 0.3274072, 1.215718, 1, 1, 1, 1, 1,
1.28585, 0.4315824, 0.9833236, 1, 1, 1, 1, 1,
1.29943, 0.03502692, 1.792565, 0, 0, 1, 1, 1,
1.309109, 0.7539734, 0.3432397, 1, 0, 0, 1, 1,
1.312365, -0.5716927, 1.923294, 1, 0, 0, 1, 1,
1.326382, -0.01915533, 0.7127267, 1, 0, 0, 1, 1,
1.342762, -1.000781, 2.117062, 1, 0, 0, 1, 1,
1.345547, 1.463581, 1.390473, 1, 0, 0, 1, 1,
1.346363, 0.199346, 1.529345, 0, 0, 0, 1, 1,
1.34742, 0.4567424, 0.1116366, 0, 0, 0, 1, 1,
1.348011, -0.8950047, 2.056734, 0, 0, 0, 1, 1,
1.350105, 0.655836, 1.217288, 0, 0, 0, 1, 1,
1.354642, 1.08147, 1.815325, 0, 0, 0, 1, 1,
1.371137, 0.1892986, 2.385405, 0, 0, 0, 1, 1,
1.372369, 1.887908, -2.144401, 0, 0, 0, 1, 1,
1.38399, -0.6462399, 2.695633, 1, 1, 1, 1, 1,
1.385922, 0.3244655, 1.716206, 1, 1, 1, 1, 1,
1.399637, -0.8057415, 1.799073, 1, 1, 1, 1, 1,
1.401778, -0.9186321, 2.514394, 1, 1, 1, 1, 1,
1.405663, 2.531488, -0.6137506, 1, 1, 1, 1, 1,
1.421937, -1.212257, 2.944739, 1, 1, 1, 1, 1,
1.432515, 0.006042794, 0.5642469, 1, 1, 1, 1, 1,
1.436018, -0.6050986, 3.900434, 1, 1, 1, 1, 1,
1.449704, -0.729218, 1.502378, 1, 1, 1, 1, 1,
1.451233, 0.7468719, -0.004777652, 1, 1, 1, 1, 1,
1.454433, -0.1242148, 1.612451, 1, 1, 1, 1, 1,
1.468363, 0.3536844, 2.116923, 1, 1, 1, 1, 1,
1.469113, -0.1515752, 1.386352, 1, 1, 1, 1, 1,
1.471496, 0.4561766, -0.4674794, 1, 1, 1, 1, 1,
1.478026, -0.2454527, 2.031473, 1, 1, 1, 1, 1,
1.478678, 0.1012776, 1.593948, 0, 0, 1, 1, 1,
1.479912, 1.647136, 0.4873976, 1, 0, 0, 1, 1,
1.485937, -0.4809657, 1.953148, 1, 0, 0, 1, 1,
1.487429, -0.4719913, 2.199696, 1, 0, 0, 1, 1,
1.50635, -1.0881, 2.056139, 1, 0, 0, 1, 1,
1.508069, 1.034783, 0.2088041, 1, 0, 0, 1, 1,
1.509443, -0.1114037, 1.559002, 0, 0, 0, 1, 1,
1.510434, -0.1958565, 2.182672, 0, 0, 0, 1, 1,
1.515595, 0.4826606, 0.8672452, 0, 0, 0, 1, 1,
1.522493, -1.176242, 1.626065, 0, 0, 0, 1, 1,
1.52277, -0.5457084, 2.568918, 0, 0, 0, 1, 1,
1.53278, 1.071014, -0.06604674, 0, 0, 0, 1, 1,
1.534697, 1.273937, 1.517219, 0, 0, 0, 1, 1,
1.539718, -0.6828166, 2.044338, 1, 1, 1, 1, 1,
1.542271, -1.282461, 3.937155, 1, 1, 1, 1, 1,
1.5427, -0.03282153, 3.451797, 1, 1, 1, 1, 1,
1.545744, 1.258149, 1.03276, 1, 1, 1, 1, 1,
1.564708, -0.4223718, 1.103559, 1, 1, 1, 1, 1,
1.568442, 1.154169, 1.729502, 1, 1, 1, 1, 1,
1.57343, -0.4896758, 2.556853, 1, 1, 1, 1, 1,
1.595525, 0.06323305, 0.8001165, 1, 1, 1, 1, 1,
1.6027, 3.076384, -0.3231502, 1, 1, 1, 1, 1,
1.619341, 1.023427, 1.528793, 1, 1, 1, 1, 1,
1.623117, -0.3022816, 0.2550063, 1, 1, 1, 1, 1,
1.634013, -0.6438785, 1.004926, 1, 1, 1, 1, 1,
1.637028, -1.498175, 3.020823, 1, 1, 1, 1, 1,
1.650847, -0.6120277, 2.537622, 1, 1, 1, 1, 1,
1.673644, -0.4990188, 2.543777, 1, 1, 1, 1, 1,
1.696235, -1.496038, 3.148216, 0, 0, 1, 1, 1,
1.711275, -0.7689068, 1.413076, 1, 0, 0, 1, 1,
1.712871, -2.59176, 1.613007, 1, 0, 0, 1, 1,
1.718796, -0.2903664, 1.58332, 1, 0, 0, 1, 1,
1.728728, 0.4920487, 1.145991, 1, 0, 0, 1, 1,
1.751164, -0.3085481, 2.818256, 1, 0, 0, 1, 1,
1.752907, 0.2243857, 2.275003, 0, 0, 0, 1, 1,
1.764711, -0.4259104, 2.805745, 0, 0, 0, 1, 1,
1.796639, 0.5707826, -0.3282602, 0, 0, 0, 1, 1,
1.828043, -0.1330531, 2.019767, 0, 0, 0, 1, 1,
1.840972, -2.340609, 2.217901, 0, 0, 0, 1, 1,
1.873817, -0.9221606, 0.7086515, 0, 0, 0, 1, 1,
1.877605, 1.46675, 1.704397, 0, 0, 0, 1, 1,
1.880133, -0.8440274, 1.345079, 1, 1, 1, 1, 1,
1.89155, 0.5376908, 1.676679, 1, 1, 1, 1, 1,
1.891724, -2.557278, 2.271493, 1, 1, 1, 1, 1,
1.896678, 0.5797319, -0.4341554, 1, 1, 1, 1, 1,
1.913966, 1.852309, 1.29704, 1, 1, 1, 1, 1,
1.916384, -0.2381488, 2.263645, 1, 1, 1, 1, 1,
1.96205, -0.2372402, 0.03104036, 1, 1, 1, 1, 1,
2.02898, -0.3508597, 1.249841, 1, 1, 1, 1, 1,
2.035291, -0.05556909, 0.4660399, 1, 1, 1, 1, 1,
2.04375, -0.5526838, -0.4376462, 1, 1, 1, 1, 1,
2.088729, -0.1948321, 1.279721, 1, 1, 1, 1, 1,
2.116467, 0.3394987, 0.170409, 1, 1, 1, 1, 1,
2.13523, 0.3118679, 2.647579, 1, 1, 1, 1, 1,
2.142469, 1.777327, 0.7348594, 1, 1, 1, 1, 1,
2.156633, -0.8651935, 1.160856, 1, 1, 1, 1, 1,
2.169719, 1.202529, 1.538238, 0, 0, 1, 1, 1,
2.20419, 0.02153806, -0.6410841, 1, 0, 0, 1, 1,
2.213811, -0.006630529, 1.148655, 1, 0, 0, 1, 1,
2.237753, -0.2241603, 1.742076, 1, 0, 0, 1, 1,
2.256674, 0.8572878, 0.2835087, 1, 0, 0, 1, 1,
2.30988, -1.116538, 1.771091, 1, 0, 0, 1, 1,
2.339152, 0.2699177, 2.616326, 0, 0, 0, 1, 1,
2.353216, -0.7676821, 1.245497, 0, 0, 0, 1, 1,
2.363204, 1.167696, 0.66868, 0, 0, 0, 1, 1,
2.365297, 0.6574997, 2.194143, 0, 0, 0, 1, 1,
2.383538, 0.2997114, 1.63249, 0, 0, 0, 1, 1,
2.56229, 0.3478695, 1.884059, 0, 0, 0, 1, 1,
2.562701, 0.5649126, -0.2202239, 0, 0, 0, 1, 1,
2.564513, 0.9041441, 0.7771236, 1, 1, 1, 1, 1,
2.583591, 0.5739389, -0.07424069, 1, 1, 1, 1, 1,
2.609468, 1.290563, 2.015403, 1, 1, 1, 1, 1,
2.681839, -0.01857152, 2.505017, 1, 1, 1, 1, 1,
2.798603, -2.24644, 1.425042, 1, 1, 1, 1, 1,
2.853745, -0.5273901, 0.07927442, 1, 1, 1, 1, 1,
2.946801, 0.720173, 1.741408, 1, 1, 1, 1, 1
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
var radius = 9.676909;
var distance = 33.98973;
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
mvMatrix.translate( 0.1138716, -0.1063535, -0.1830721 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.98973);
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
