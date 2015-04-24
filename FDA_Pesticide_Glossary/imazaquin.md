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
-3.205703, 0.02609231, -0.2662871, 1, 0, 0, 1,
-3.084594, 0.9663134, -0.9447864, 1, 0.007843138, 0, 1,
-2.7375, -0.7582687, -2.103309, 1, 0.01176471, 0, 1,
-2.678542, -0.6130958, -1.173909, 1, 0.01960784, 0, 1,
-2.662265, 0.08741675, -2.015342, 1, 0.02352941, 0, 1,
-2.540088, 0.1613463, -1.33354, 1, 0.03137255, 0, 1,
-2.420769, -0.426471, -0.8672155, 1, 0.03529412, 0, 1,
-2.417934, 0.05704652, -1.588651, 1, 0.04313726, 0, 1,
-2.390479, 1.415122, 0.006260794, 1, 0.04705882, 0, 1,
-2.381541, 0.3114125, -1.812832, 1, 0.05490196, 0, 1,
-2.3291, -0.5168926, -3.595792, 1, 0.05882353, 0, 1,
-2.321576, 0.4726534, -2.855172, 1, 0.06666667, 0, 1,
-2.256882, -0.09549588, -2.003975, 1, 0.07058824, 0, 1,
-2.242686, -0.4634567, -0.6307588, 1, 0.07843138, 0, 1,
-2.238889, -0.02484718, -0.8022673, 1, 0.08235294, 0, 1,
-2.192752, -1.148607, -3.566811, 1, 0.09019608, 0, 1,
-2.165203, -0.8233112, -1.548152, 1, 0.09411765, 0, 1,
-2.154397, -1.489252, -2.650351, 1, 0.1019608, 0, 1,
-2.129785, -2.025444, -2.642846, 1, 0.1098039, 0, 1,
-2.121768, -1.434296, -2.112535, 1, 0.1137255, 0, 1,
-2.116641, 1.804996, -2.026729, 1, 0.1215686, 0, 1,
-2.077267, -0.2642202, -2.61649, 1, 0.1254902, 0, 1,
-2.065403, -0.269798, -0.6543154, 1, 0.1333333, 0, 1,
-2.047367, -1.584039, -3.35858, 1, 0.1372549, 0, 1,
-2.046669, 0.6236352, -2.044439, 1, 0.145098, 0, 1,
-2.030433, 1.664437, -2.329313, 1, 0.1490196, 0, 1,
-2.017748, 1.082867, -1.420407, 1, 0.1568628, 0, 1,
-2.011812, -0.27887, -3.398652, 1, 0.1607843, 0, 1,
-1.966817, -0.7159299, -3.169838, 1, 0.1686275, 0, 1,
-1.943737, -0.2338317, -1.830813, 1, 0.172549, 0, 1,
-1.931636, -1.000757, -1.920685, 1, 0.1803922, 0, 1,
-1.890589, -0.7364404, -1.081517, 1, 0.1843137, 0, 1,
-1.889349, 0.4449089, -1.831853, 1, 0.1921569, 0, 1,
-1.850498, 0.5859106, 0.02537576, 1, 0.1960784, 0, 1,
-1.844148, 0.5989695, 0.5457395, 1, 0.2039216, 0, 1,
-1.836323, 0.5307376, -2.893176, 1, 0.2117647, 0, 1,
-1.828378, 0.05793765, -0.9051785, 1, 0.2156863, 0, 1,
-1.811286, -1.399825, -2.095456, 1, 0.2235294, 0, 1,
-1.786174, 0.07432199, -2.821738, 1, 0.227451, 0, 1,
-1.775537, -0.6542529, -2.486275, 1, 0.2352941, 0, 1,
-1.757744, 1.168623, -1.603097, 1, 0.2392157, 0, 1,
-1.732183, 0.6572874, 0.4813593, 1, 0.2470588, 0, 1,
-1.716614, -1.385606, -3.160056, 1, 0.2509804, 0, 1,
-1.715544, -0.4861524, -1.727333, 1, 0.2588235, 0, 1,
-1.700969, 0.4411818, -2.161563, 1, 0.2627451, 0, 1,
-1.694905, -0.579294, -0.2311828, 1, 0.2705882, 0, 1,
-1.693913, 0.500423, -1.874282, 1, 0.2745098, 0, 1,
-1.67679, 0.9236427, -0.6681324, 1, 0.282353, 0, 1,
-1.670305, 0.24437, -1.016564, 1, 0.2862745, 0, 1,
-1.668313, 0.7881463, -1.109907, 1, 0.2941177, 0, 1,
-1.6682, -1.115807, -2.95154, 1, 0.3019608, 0, 1,
-1.656329, 1.18686, -1.755566, 1, 0.3058824, 0, 1,
-1.640933, 0.02723273, 0.2413256, 1, 0.3137255, 0, 1,
-1.624874, 1.437786, -1.360044, 1, 0.3176471, 0, 1,
-1.608824, 1.434915, -2.604563, 1, 0.3254902, 0, 1,
-1.542018, -0.5280586, -2.355133, 1, 0.3294118, 0, 1,
-1.538121, -2.569484, -2.718477, 1, 0.3372549, 0, 1,
-1.523133, -0.6426426, -1.373807, 1, 0.3411765, 0, 1,
-1.522873, 0.066982, -2.661381, 1, 0.3490196, 0, 1,
-1.518238, 0.4918502, -0.7585211, 1, 0.3529412, 0, 1,
-1.517268, -0.143882, -0.6115326, 1, 0.3607843, 0, 1,
-1.503733, 0.4273014, 0.7029273, 1, 0.3647059, 0, 1,
-1.496933, -0.3049437, -2.580135, 1, 0.372549, 0, 1,
-1.490872, -0.3195367, -2.067405, 1, 0.3764706, 0, 1,
-1.481217, 1.20901, -0.8865442, 1, 0.3843137, 0, 1,
-1.474763, 2.351252, 0.4552356, 1, 0.3882353, 0, 1,
-1.469826, -2.077586, -3.83992, 1, 0.3960784, 0, 1,
-1.450406, 0.2300815, -1.508046, 1, 0.4039216, 0, 1,
-1.443605, -1.018519, -0.703397, 1, 0.4078431, 0, 1,
-1.428336, 1.88562, -3.644509, 1, 0.4156863, 0, 1,
-1.415589, 0.5383963, -1.134322, 1, 0.4196078, 0, 1,
-1.409493, -1.019788, -1.814452, 1, 0.427451, 0, 1,
-1.406786, -0.1538813, -1.089836, 1, 0.4313726, 0, 1,
-1.40109, 0.6985181, -0.7267619, 1, 0.4392157, 0, 1,
-1.397038, -0.6304252, -1.964303, 1, 0.4431373, 0, 1,
-1.395642, 0.2037812, 0.1488945, 1, 0.4509804, 0, 1,
-1.394391, 0.6269589, -0.9638742, 1, 0.454902, 0, 1,
-1.394249, -1.699193, -1.183365, 1, 0.4627451, 0, 1,
-1.391384, 0.008467941, -2.14424, 1, 0.4666667, 0, 1,
-1.390838, -0.8370583, -2.565475, 1, 0.4745098, 0, 1,
-1.389011, -1.237741, -1.029776, 1, 0.4784314, 0, 1,
-1.388619, -0.7761129, -1.526078, 1, 0.4862745, 0, 1,
-1.387152, -0.5766299, -1.958905, 1, 0.4901961, 0, 1,
-1.385473, 1.608581, -1.492135, 1, 0.4980392, 0, 1,
-1.382553, -0.2406191, -0.4632679, 1, 0.5058824, 0, 1,
-1.37425, 1.167134, -0.4351777, 1, 0.509804, 0, 1,
-1.368915, 0.5909656, -1.39188, 1, 0.5176471, 0, 1,
-1.365104, -1.911152, -2.661579, 1, 0.5215687, 0, 1,
-1.360639, 0.5034316, -1.300371, 1, 0.5294118, 0, 1,
-1.359965, 1.606255, -1.737045, 1, 0.5333334, 0, 1,
-1.354679, 0.613751, -1.929972, 1, 0.5411765, 0, 1,
-1.353396, -0.4537445, -1.647805, 1, 0.5450981, 0, 1,
-1.353182, -1.034544, -1.318227, 1, 0.5529412, 0, 1,
-1.351102, 1.752392, 0.4150059, 1, 0.5568628, 0, 1,
-1.347723, -0.5542837, -1.537106, 1, 0.5647059, 0, 1,
-1.342956, 0.2594824, -0.4280952, 1, 0.5686275, 0, 1,
-1.337519, -0.08831404, -2.105767, 1, 0.5764706, 0, 1,
-1.336853, -0.2934679, -0.9137942, 1, 0.5803922, 0, 1,
-1.336013, 0.1798157, -2.964647, 1, 0.5882353, 0, 1,
-1.335032, 0.7328213, 0.07684229, 1, 0.5921569, 0, 1,
-1.33313, -0.0886751, -0.94003, 1, 0.6, 0, 1,
-1.332519, 0.4309903, -0.7975833, 1, 0.6078432, 0, 1,
-1.328887, -1.029452, -3.686126, 1, 0.6117647, 0, 1,
-1.32809, 1.729776, -0.3207728, 1, 0.6196079, 0, 1,
-1.326523, 1.246533, -0.5818661, 1, 0.6235294, 0, 1,
-1.309461, 0.5740616, -0.1197019, 1, 0.6313726, 0, 1,
-1.306461, 1.513319, -1.011614, 1, 0.6352941, 0, 1,
-1.304777, 0.1662012, -1.440918, 1, 0.6431373, 0, 1,
-1.299505, 0.9310071, -0.4877281, 1, 0.6470588, 0, 1,
-1.295279, -0.1740539, -0.545431, 1, 0.654902, 0, 1,
-1.286044, 1.388767, -1.240521, 1, 0.6588235, 0, 1,
-1.283047, 0.251032, -0.9886487, 1, 0.6666667, 0, 1,
-1.281076, 0.4174973, -2.264221, 1, 0.6705883, 0, 1,
-1.280086, 1.459961, 0.2640734, 1, 0.6784314, 0, 1,
-1.27986, -0.9516434, -0.8199379, 1, 0.682353, 0, 1,
-1.272015, 0.2033591, -1.091892, 1, 0.6901961, 0, 1,
-1.266464, -2.567904, -3.686896, 1, 0.6941177, 0, 1,
-1.246732, 0.5950196, -1.628404, 1, 0.7019608, 0, 1,
-1.243023, 0.9724994, -2.251, 1, 0.7098039, 0, 1,
-1.242239, -1.812476, -2.31496, 1, 0.7137255, 0, 1,
-1.230589, 0.8001848, -0.282062, 1, 0.7215686, 0, 1,
-1.222025, -1.522051, -2.724952, 1, 0.7254902, 0, 1,
-1.22192, 0.4904507, -0.1230486, 1, 0.7333333, 0, 1,
-1.22184, -1.012872, -0.6615527, 1, 0.7372549, 0, 1,
-1.211662, 0.6315001, -1.051651, 1, 0.7450981, 0, 1,
-1.19942, -0.9823825, -1.889915, 1, 0.7490196, 0, 1,
-1.197826, -0.2360498, -2.672161, 1, 0.7568628, 0, 1,
-1.192324, 0.8997269, -0.3691644, 1, 0.7607843, 0, 1,
-1.190377, -1.383308, -4.120288, 1, 0.7686275, 0, 1,
-1.171947, 1.143583, -2.011581, 1, 0.772549, 0, 1,
-1.170421, 1.506706, -0.6853933, 1, 0.7803922, 0, 1,
-1.162478, 0.474149, -0.7364769, 1, 0.7843137, 0, 1,
-1.160686, 0.9128003, -2.176363, 1, 0.7921569, 0, 1,
-1.151157, -0.8116298, -3.963191, 1, 0.7960784, 0, 1,
-1.142812, 0.3014306, -0.5226135, 1, 0.8039216, 0, 1,
-1.142126, -0.74863, -1.25823, 1, 0.8117647, 0, 1,
-1.137401, -1.09865, -4.209952, 1, 0.8156863, 0, 1,
-1.136929, -0.09702357, -2.209112, 1, 0.8235294, 0, 1,
-1.133946, 0.05293772, -0.3442382, 1, 0.827451, 0, 1,
-1.131058, 0.3108846, -1.03536, 1, 0.8352941, 0, 1,
-1.130723, 0.3829359, 0.03873212, 1, 0.8392157, 0, 1,
-1.129983, 0.1060688, -2.077493, 1, 0.8470588, 0, 1,
-1.126233, -0.9477158, -0.4584163, 1, 0.8509804, 0, 1,
-1.123428, 0.9357163, -0.1249317, 1, 0.8588235, 0, 1,
-1.109459, 0.3426456, -1.959424, 1, 0.8627451, 0, 1,
-1.108326, 0.3490549, -1.041436, 1, 0.8705882, 0, 1,
-1.104235, -2.113662, -2.194028, 1, 0.8745098, 0, 1,
-1.102958, 0.3968915, -1.279377, 1, 0.8823529, 0, 1,
-1.101267, -0.06881233, 0.318907, 1, 0.8862745, 0, 1,
-1.099866, 0.1261173, -1.949243, 1, 0.8941177, 0, 1,
-1.092268, 1.767934, -0.5975205, 1, 0.8980392, 0, 1,
-1.087317, -0.1537193, -0.5820874, 1, 0.9058824, 0, 1,
-1.084768, 0.6625473, -1.223363, 1, 0.9137255, 0, 1,
-1.070895, 2.064203, 1.381753, 1, 0.9176471, 0, 1,
-1.066889, -0.661335, -3.081473, 1, 0.9254902, 0, 1,
-1.063079, 0.4176107, -0.2057648, 1, 0.9294118, 0, 1,
-1.055776, -0.5297604, -3.092822, 1, 0.9372549, 0, 1,
-1.055611, -0.3437985, -1.050758, 1, 0.9411765, 0, 1,
-1.054888, 0.2431111, -3.028724, 1, 0.9490196, 0, 1,
-1.053972, 1.783298, -1.446882, 1, 0.9529412, 0, 1,
-1.050424, -0.1403413, -0.4084508, 1, 0.9607843, 0, 1,
-1.048512, 1.013053, -1.378104, 1, 0.9647059, 0, 1,
-1.046995, 1.921023, 0.2150168, 1, 0.972549, 0, 1,
-1.04403, -0.1434906, -1.200952, 1, 0.9764706, 0, 1,
-1.039991, 0.7279546, 0.7391798, 1, 0.9843137, 0, 1,
-1.038225, -1.739163, -2.646942, 1, 0.9882353, 0, 1,
-1.035914, -0.6741771, -0.9622549, 1, 0.9960784, 0, 1,
-1.03308, -1.335433, -3.021994, 0.9960784, 1, 0, 1,
-1.032372, -0.9920375, -0.7102106, 0.9921569, 1, 0, 1,
-1.025473, 1.411871, -0.5455722, 0.9843137, 1, 0, 1,
-1.021065, -1.30067, -2.329726, 0.9803922, 1, 0, 1,
-1.0186, 0.3868202, -2.900095, 0.972549, 1, 0, 1,
-1.014077, -0.05312762, -0.9713271, 0.9686275, 1, 0, 1,
-1.00515, 0.7393854, -2.083218, 0.9607843, 1, 0, 1,
-0.9870316, -0.618571, -2.412998, 0.9568627, 1, 0, 1,
-0.9870013, -0.8567291, -3.969297, 0.9490196, 1, 0, 1,
-0.9839813, 0.4839969, -0.9141136, 0.945098, 1, 0, 1,
-0.9813746, 0.1643915, -0.7808716, 0.9372549, 1, 0, 1,
-0.9733052, 1.26359, -0.624698, 0.9333333, 1, 0, 1,
-0.9665063, 0.6240467, 0.5748463, 0.9254902, 1, 0, 1,
-0.9661191, -1.558407, -3.151406, 0.9215686, 1, 0, 1,
-0.9617543, -0.7341336, -1.616033, 0.9137255, 1, 0, 1,
-0.961564, -1.935644, -3.243915, 0.9098039, 1, 0, 1,
-0.9612635, 1.003318, 0.5490234, 0.9019608, 1, 0, 1,
-0.9594947, -0.6531787, -1.134151, 0.8941177, 1, 0, 1,
-0.9530054, 1.038173, -0.3777504, 0.8901961, 1, 0, 1,
-0.9518364, -2.054141, -2.090928, 0.8823529, 1, 0, 1,
-0.9508836, -1.142481, -4.395246, 0.8784314, 1, 0, 1,
-0.945314, 0.3211975, -0.4721673, 0.8705882, 1, 0, 1,
-0.9431943, 0.7145085, -2.23167, 0.8666667, 1, 0, 1,
-0.9384423, -0.1077696, -0.154201, 0.8588235, 1, 0, 1,
-0.936884, -2.506417, -1.940645, 0.854902, 1, 0, 1,
-0.9345331, 1.752123, -0.5482779, 0.8470588, 1, 0, 1,
-0.9239935, -2.278065, -2.406038, 0.8431373, 1, 0, 1,
-0.9208856, -0.509174, -2.058081, 0.8352941, 1, 0, 1,
-0.920047, -0.3223668, -1.393303, 0.8313726, 1, 0, 1,
-0.9177344, -0.7025921, 0.06559134, 0.8235294, 1, 0, 1,
-0.9160483, 0.03587988, -1.502347, 0.8196079, 1, 0, 1,
-0.904901, -0.2523508, -1.368734, 0.8117647, 1, 0, 1,
-0.900908, -1.493026, -2.763763, 0.8078431, 1, 0, 1,
-0.8976766, 0.4207345, -1.896791, 0.8, 1, 0, 1,
-0.8966609, -0.7189867, -1.254232, 0.7921569, 1, 0, 1,
-0.8941927, 1.133417, -0.7197586, 0.7882353, 1, 0, 1,
-0.8866304, -0.01332031, -1.555873, 0.7803922, 1, 0, 1,
-0.8765316, -1.279747, -1.790266, 0.7764706, 1, 0, 1,
-0.8639989, -0.9220965, -2.951532, 0.7686275, 1, 0, 1,
-0.8610615, -0.5448227, -4.157879, 0.7647059, 1, 0, 1,
-0.8529959, -1.159841, -1.290639, 0.7568628, 1, 0, 1,
-0.8525136, -0.5355213, -0.9694217, 0.7529412, 1, 0, 1,
-0.8520254, -1.076909, -3.066599, 0.7450981, 1, 0, 1,
-0.8445206, 0.5775314, -1.625508, 0.7411765, 1, 0, 1,
-0.8442382, 0.2681455, -3.399235, 0.7333333, 1, 0, 1,
-0.8400621, -0.07448556, -0.8000416, 0.7294118, 1, 0, 1,
-0.8356822, -0.8220291, -3.207759, 0.7215686, 1, 0, 1,
-0.8347281, -1.569261, -4.311038, 0.7176471, 1, 0, 1,
-0.8330411, -0.6578267, -1.710064, 0.7098039, 1, 0, 1,
-0.8276501, -0.1487788, -2.712775, 0.7058824, 1, 0, 1,
-0.8246715, -0.6773575, -1.876809, 0.6980392, 1, 0, 1,
-0.8192289, -0.3772742, -3.226738, 0.6901961, 1, 0, 1,
-0.8172486, 0.9199219, -1.95489, 0.6862745, 1, 0, 1,
-0.8170312, -1.610155, -2.294349, 0.6784314, 1, 0, 1,
-0.8129805, 0.8981671, 0.121777, 0.6745098, 1, 0, 1,
-0.8054991, 1.155299, -0.5645085, 0.6666667, 1, 0, 1,
-0.8031859, 1.003343, -1.467162, 0.6627451, 1, 0, 1,
-0.800571, 0.460373, 0.6811653, 0.654902, 1, 0, 1,
-0.7897165, 0.03575463, -2.701931, 0.6509804, 1, 0, 1,
-0.787763, -0.005769539, 0.6265208, 0.6431373, 1, 0, 1,
-0.7875184, -0.358881, -0.5539553, 0.6392157, 1, 0, 1,
-0.7853618, 1.752153, -1.052814, 0.6313726, 1, 0, 1,
-0.7803796, 0.6181585, 0.04888293, 0.627451, 1, 0, 1,
-0.778533, 1.320269, -0.7668212, 0.6196079, 1, 0, 1,
-0.7757362, -1.157461, -3.100271, 0.6156863, 1, 0, 1,
-0.7721204, -1.494096, -2.966219, 0.6078432, 1, 0, 1,
-0.7718605, -0.3453832, -3.334538, 0.6039216, 1, 0, 1,
-0.7694486, 0.3978249, 0.4043716, 0.5960785, 1, 0, 1,
-0.7628747, -0.9230441, -1.723386, 0.5882353, 1, 0, 1,
-0.7525966, -0.4289202, -4.647397, 0.5843138, 1, 0, 1,
-0.7501259, 0.08631096, -2.29648, 0.5764706, 1, 0, 1,
-0.749909, 0.6168693, -1.347986, 0.572549, 1, 0, 1,
-0.7482801, -0.2820962, -1.690188, 0.5647059, 1, 0, 1,
-0.7474687, -0.1499709, -0.9579489, 0.5607843, 1, 0, 1,
-0.7425947, -0.2434531, -2.386337, 0.5529412, 1, 0, 1,
-0.7400458, -0.4875465, -2.48564, 0.5490196, 1, 0, 1,
-0.7382539, 0.9103972, -0.3304511, 0.5411765, 1, 0, 1,
-0.7378218, -0.01435454, -1.755809, 0.5372549, 1, 0, 1,
-0.7376969, 0.9443394, 0.03201429, 0.5294118, 1, 0, 1,
-0.7367269, 0.3620351, 0.07960802, 0.5254902, 1, 0, 1,
-0.7264857, 1.409477, -0.4831996, 0.5176471, 1, 0, 1,
-0.7264712, -0.832288, -3.570251, 0.5137255, 1, 0, 1,
-0.7242772, 1.168774, -0.4506471, 0.5058824, 1, 0, 1,
-0.7217646, 0.03620685, -2.150558, 0.5019608, 1, 0, 1,
-0.721046, -2.462323, -2.509186, 0.4941176, 1, 0, 1,
-0.7190592, -0.4202156, -1.610872, 0.4862745, 1, 0, 1,
-0.7120703, -1.063225, -2.895299, 0.4823529, 1, 0, 1,
-0.7114931, 1.060555, -1.282916, 0.4745098, 1, 0, 1,
-0.710712, 1.200644, 0.5690265, 0.4705882, 1, 0, 1,
-0.7106742, 1.127677, -0.524236, 0.4627451, 1, 0, 1,
-0.7064999, 0.9860122, 0.2745003, 0.4588235, 1, 0, 1,
-0.7046869, -0.09740327, -1.103277, 0.4509804, 1, 0, 1,
-0.6976378, 1.247781, 0.7780489, 0.4470588, 1, 0, 1,
-0.6973851, -2.618959, -1.477056, 0.4392157, 1, 0, 1,
-0.6944883, -0.2810822, -1.283794, 0.4352941, 1, 0, 1,
-0.6927848, -0.62219, -3.416211, 0.427451, 1, 0, 1,
-0.6855835, -0.2042927, -2.510174, 0.4235294, 1, 0, 1,
-0.6805747, -1.590314, -2.703308, 0.4156863, 1, 0, 1,
-0.678565, -0.007225327, -1.529649, 0.4117647, 1, 0, 1,
-0.6770106, 1.271091, -0.7270527, 0.4039216, 1, 0, 1,
-0.6765658, 1.28067, 0.3660192, 0.3960784, 1, 0, 1,
-0.6734447, 0.924215, -0.6282751, 0.3921569, 1, 0, 1,
-0.6680491, -0.3978429, -2.735514, 0.3843137, 1, 0, 1,
-0.6616151, -0.1412478, -2.653796, 0.3803922, 1, 0, 1,
-0.6542404, -0.7114434, -3.830626, 0.372549, 1, 0, 1,
-0.6539143, -0.9252652, -2.26178, 0.3686275, 1, 0, 1,
-0.6538356, 1.392794, -1.458764, 0.3607843, 1, 0, 1,
-0.6512002, -0.3503145, -1.380387, 0.3568628, 1, 0, 1,
-0.6510317, -0.7138914, -3.37731, 0.3490196, 1, 0, 1,
-0.6474699, -0.9704471, -2.704254, 0.345098, 1, 0, 1,
-0.6441709, 0.6611557, -1.864429, 0.3372549, 1, 0, 1,
-0.6429049, -1.379888, -1.174586, 0.3333333, 1, 0, 1,
-0.6400427, 0.2232233, -1.026256, 0.3254902, 1, 0, 1,
-0.6392224, -1.232095, -2.779497, 0.3215686, 1, 0, 1,
-0.6312322, 0.5210771, -0.03410399, 0.3137255, 1, 0, 1,
-0.6236884, 0.0568869, 0.781579, 0.3098039, 1, 0, 1,
-0.6235377, -1.482301, -3.487504, 0.3019608, 1, 0, 1,
-0.6203905, -0.8626773, -2.323255, 0.2941177, 1, 0, 1,
-0.6186051, 2.116937, -0.2860715, 0.2901961, 1, 0, 1,
-0.6164778, -0.4215876, -2.393248, 0.282353, 1, 0, 1,
-0.6114666, -0.09433828, -2.859832, 0.2784314, 1, 0, 1,
-0.6083754, 0.05463256, -1.832, 0.2705882, 1, 0, 1,
-0.5977795, 0.953426, -0.8757868, 0.2666667, 1, 0, 1,
-0.5919102, 1.051062, 0.05784125, 0.2588235, 1, 0, 1,
-0.5858498, 0.3298705, -0.0491093, 0.254902, 1, 0, 1,
-0.5850429, -0.5539809, -2.856321, 0.2470588, 1, 0, 1,
-0.5744284, -0.8472107, -1.375906, 0.2431373, 1, 0, 1,
-0.5738339, 0.8718497, -0.9790736, 0.2352941, 1, 0, 1,
-0.5720382, 0.2926939, -0.7414697, 0.2313726, 1, 0, 1,
-0.5714946, 0.2799397, -3.035259, 0.2235294, 1, 0, 1,
-0.5666968, 1.097417, 0.7133614, 0.2196078, 1, 0, 1,
-0.5663539, 0.8061699, 0.7412313, 0.2117647, 1, 0, 1,
-0.561717, 2.265456, -0.4859675, 0.2078431, 1, 0, 1,
-0.5516853, -0.4292335, -1.600004, 0.2, 1, 0, 1,
-0.5498549, 0.1506758, -2.23843, 0.1921569, 1, 0, 1,
-0.549596, 0.6606911, -0.5741583, 0.1882353, 1, 0, 1,
-0.5460664, 0.6734589, -1.694019, 0.1803922, 1, 0, 1,
-0.5436631, -0.8931586, -2.895034, 0.1764706, 1, 0, 1,
-0.5387512, -0.9195719, -3.720037, 0.1686275, 1, 0, 1,
-0.5330839, 1.00976, -0.1360014, 0.1647059, 1, 0, 1,
-0.531377, 1.160264, -0.1108755, 0.1568628, 1, 0, 1,
-0.5300215, 0.6301646, -0.3019556, 0.1529412, 1, 0, 1,
-0.5277992, -1.238392, -2.38483, 0.145098, 1, 0, 1,
-0.5271604, 1.965621, -1.664337, 0.1411765, 1, 0, 1,
-0.5269488, 1.312536, -1.628381, 0.1333333, 1, 0, 1,
-0.524067, 1.672528, -0.8275375, 0.1294118, 1, 0, 1,
-0.5238095, -0.7387089, -3.157301, 0.1215686, 1, 0, 1,
-0.5192214, -0.2318642, -2.196409, 0.1176471, 1, 0, 1,
-0.5127671, 0.7855723, 0.2975905, 0.1098039, 1, 0, 1,
-0.5127578, 1.379771, -0.2215015, 0.1058824, 1, 0, 1,
-0.5096034, 0.3359986, -1.19072, 0.09803922, 1, 0, 1,
-0.5034269, -0.1981649, -2.120063, 0.09019608, 1, 0, 1,
-0.502667, 0.8283642, -0.3359801, 0.08627451, 1, 0, 1,
-0.5000567, 1.223316, 0.4523727, 0.07843138, 1, 0, 1,
-0.4993489, -0.09843956, 0.6368566, 0.07450981, 1, 0, 1,
-0.4989725, -1.17626, -1.768481, 0.06666667, 1, 0, 1,
-0.4984761, 0.3568212, -0.7427298, 0.0627451, 1, 0, 1,
-0.4983204, -0.570875, -2.631626, 0.05490196, 1, 0, 1,
-0.4965279, -1.505715, -4.621783, 0.05098039, 1, 0, 1,
-0.4943193, -0.4396896, -2.078403, 0.04313726, 1, 0, 1,
-0.4939162, -1.264879, -4.139222, 0.03921569, 1, 0, 1,
-0.4924488, -0.2620504, -1.520468, 0.03137255, 1, 0, 1,
-0.4903025, 0.5677923, -0.7294391, 0.02745098, 1, 0, 1,
-0.4882458, 0.9284102, -0.3468454, 0.01960784, 1, 0, 1,
-0.4881152, -0.3839049, -3.916562, 0.01568628, 1, 0, 1,
-0.4858343, 0.1729003, 1.037897, 0.007843138, 1, 0, 1,
-0.4826165, -1.544883, -1.861986, 0.003921569, 1, 0, 1,
-0.4757187, -0.1891879, -1.158177, 0, 1, 0.003921569, 1,
-0.4712439, 1.957816, -1.453807, 0, 1, 0.01176471, 1,
-0.4684196, -0.3840398, -2.345377, 0, 1, 0.01568628, 1,
-0.465037, -0.5569279, -0.6772132, 0, 1, 0.02352941, 1,
-0.4646896, -1.042452, -2.366482, 0, 1, 0.02745098, 1,
-0.4562861, 0.3325108, -1.228988, 0, 1, 0.03529412, 1,
-0.4482411, -1.38814, -1.492766, 0, 1, 0.03921569, 1,
-0.4480309, 1.474651, 0.1214995, 0, 1, 0.04705882, 1,
-0.4457938, -0.9903202, -3.186892, 0, 1, 0.05098039, 1,
-0.44175, -1.658148, -4.549553, 0, 1, 0.05882353, 1,
-0.4394533, -0.6877487, -2.317634, 0, 1, 0.0627451, 1,
-0.439309, 1.197775, 1.272579, 0, 1, 0.07058824, 1,
-0.4377368, -1.174151, -4.267468, 0, 1, 0.07450981, 1,
-0.4363291, -0.5082198, -0.4498849, 0, 1, 0.08235294, 1,
-0.4327949, -2.527667, -2.626235, 0, 1, 0.08627451, 1,
-0.430679, -2.02095, -2.981311, 0, 1, 0.09411765, 1,
-0.42896, -1.215675, -3.773212, 0, 1, 0.1019608, 1,
-0.4211557, -0.04603152, -2.991605, 0, 1, 0.1058824, 1,
-0.4202447, -1.179626, -2.358016, 0, 1, 0.1137255, 1,
-0.4190472, -0.6662284, -0.5167727, 0, 1, 0.1176471, 1,
-0.4184646, 2.252342, -0.607919, 0, 1, 0.1254902, 1,
-0.4166031, -0.4056765, -2.763201, 0, 1, 0.1294118, 1,
-0.4127108, -0.1657822, -2.576037, 0, 1, 0.1372549, 1,
-0.4082728, -0.03596853, 0.1554793, 0, 1, 0.1411765, 1,
-0.4045293, -0.9139689, -2.616089, 0, 1, 0.1490196, 1,
-0.402459, 2.857803, 0.1626463, 0, 1, 0.1529412, 1,
-0.3980307, -0.1493575, -0.2848128, 0, 1, 0.1607843, 1,
-0.3915777, -0.2357042, -2.957109, 0, 1, 0.1647059, 1,
-0.3860127, 0.4874761, -0.7546587, 0, 1, 0.172549, 1,
-0.3794636, -1.435349, -1.709085, 0, 1, 0.1764706, 1,
-0.3791752, -0.5271686, -2.801773, 0, 1, 0.1843137, 1,
-0.3788296, -0.1861636, -2.137085, 0, 1, 0.1882353, 1,
-0.3751903, -0.8541404, -3.222725, 0, 1, 0.1960784, 1,
-0.3749892, 0.6362104, -1.066443, 0, 1, 0.2039216, 1,
-0.374533, -1.650833, -3.445024, 0, 1, 0.2078431, 1,
-0.365701, -0.7910435, -3.177032, 0, 1, 0.2156863, 1,
-0.3654271, -0.2054504, -1.258701, 0, 1, 0.2196078, 1,
-0.3650823, -0.206598, -3.377362, 0, 1, 0.227451, 1,
-0.3641209, 0.458534, 0.1988346, 0, 1, 0.2313726, 1,
-0.3628795, 0.1533026, 0.0296994, 0, 1, 0.2392157, 1,
-0.3624845, -0.9539649, -2.749108, 0, 1, 0.2431373, 1,
-0.3607471, 0.5154041, -0.9136497, 0, 1, 0.2509804, 1,
-0.3582395, -0.500482, -1.842505, 0, 1, 0.254902, 1,
-0.3551179, 0.3217075, -2.622667, 0, 1, 0.2627451, 1,
-0.3544329, -0.0904912, -1.494612, 0, 1, 0.2666667, 1,
-0.3540336, 1.906782, -2.343178, 0, 1, 0.2745098, 1,
-0.3483843, -0.5812308, -2.870965, 0, 1, 0.2784314, 1,
-0.3474218, -0.5420533, -3.900638, 0, 1, 0.2862745, 1,
-0.3456649, -0.1130955, -0.9905909, 0, 1, 0.2901961, 1,
-0.3406154, -0.6651516, -1.886496, 0, 1, 0.2980392, 1,
-0.3361242, 1.036674, -1.454016, 0, 1, 0.3058824, 1,
-0.3293273, -1.195047, -3.939185, 0, 1, 0.3098039, 1,
-0.327222, 0.3476481, -1.038343, 0, 1, 0.3176471, 1,
-0.3236055, 1.218136, 0.4725237, 0, 1, 0.3215686, 1,
-0.318641, 0.8482483, -0.6152226, 0, 1, 0.3294118, 1,
-0.3108678, 0.2205803, -1.324886, 0, 1, 0.3333333, 1,
-0.3086794, -0.05925949, -1.742987, 0, 1, 0.3411765, 1,
-0.3069933, 1.640381, 1.010503, 0, 1, 0.345098, 1,
-0.3066625, 0.7593039, -1.38826, 0, 1, 0.3529412, 1,
-0.3056959, 0.06204218, -2.313987, 0, 1, 0.3568628, 1,
-0.3055234, -0.3222013, -2.806288, 0, 1, 0.3647059, 1,
-0.305163, -0.7260314, -2.488221, 0, 1, 0.3686275, 1,
-0.3026987, 0.1696334, -1.756177, 0, 1, 0.3764706, 1,
-0.2998374, -0.9409714, -1.92709, 0, 1, 0.3803922, 1,
-0.2921613, -0.6514181, -4.203682, 0, 1, 0.3882353, 1,
-0.279417, -2.56771, -3.367606, 0, 1, 0.3921569, 1,
-0.2785913, 1.150509, -1.29355, 0, 1, 0.4, 1,
-0.2768101, -1.880289, -1.906827, 0, 1, 0.4078431, 1,
-0.2764641, 1.864161, -0.5603412, 0, 1, 0.4117647, 1,
-0.2737603, 0.4475407, 0.5889857, 0, 1, 0.4196078, 1,
-0.2729186, -0.3125338, -1.612388, 0, 1, 0.4235294, 1,
-0.2719845, -2.301013, -3.082791, 0, 1, 0.4313726, 1,
-0.2703408, 0.5075083, 0.04714422, 0, 1, 0.4352941, 1,
-0.2645781, 0.748228, -0.1571204, 0, 1, 0.4431373, 1,
-0.2613319, 0.01262887, -2.185514, 0, 1, 0.4470588, 1,
-0.245993, -1.303275, -3.512614, 0, 1, 0.454902, 1,
-0.2421965, -0.2873019, -2.831412, 0, 1, 0.4588235, 1,
-0.2419025, -2.00524, -2.426454, 0, 1, 0.4666667, 1,
-0.2384887, 0.8616835, -1.011639, 0, 1, 0.4705882, 1,
-0.237908, 1.118265, 0.481869, 0, 1, 0.4784314, 1,
-0.2378216, 0.04349614, -1.982231, 0, 1, 0.4823529, 1,
-0.2355365, 0.06009958, -1.8424, 0, 1, 0.4901961, 1,
-0.2335177, 0.4625194, -3.157973, 0, 1, 0.4941176, 1,
-0.2296669, 0.6599598, 1.082725, 0, 1, 0.5019608, 1,
-0.22892, 0.8085165, 0.8682538, 0, 1, 0.509804, 1,
-0.2283639, -0.8867866, -1.489903, 0, 1, 0.5137255, 1,
-0.2244661, -0.3069037, -2.415016, 0, 1, 0.5215687, 1,
-0.2216764, 0.8648411, -0.07340918, 0, 1, 0.5254902, 1,
-0.2194085, -0.2666568, -1.277462, 0, 1, 0.5333334, 1,
-0.2176072, 0.9450553, -0.3514284, 0, 1, 0.5372549, 1,
-0.2174811, -0.08726419, -2.257613, 0, 1, 0.5450981, 1,
-0.2145632, 0.738497, -1.728861, 0, 1, 0.5490196, 1,
-0.2141515, -1.33467, -2.788805, 0, 1, 0.5568628, 1,
-0.2099676, 0.4972708, -0.6137831, 0, 1, 0.5607843, 1,
-0.2080706, 1.256261, 0.7597658, 0, 1, 0.5686275, 1,
-0.2051762, -1.706788, -1.328862, 0, 1, 0.572549, 1,
-0.2048369, -0.8169535, -3.648134, 0, 1, 0.5803922, 1,
-0.2035103, -0.8314384, -1.688936, 0, 1, 0.5843138, 1,
-0.2009828, 0.9916589, -0.4969555, 0, 1, 0.5921569, 1,
-0.1950961, 0.5052124, -0.6294852, 0, 1, 0.5960785, 1,
-0.194223, 0.8540125, -0.6817915, 0, 1, 0.6039216, 1,
-0.1922107, 0.1035989, -1.098, 0, 1, 0.6117647, 1,
-0.1833223, 0.1253925, -1.313035, 0, 1, 0.6156863, 1,
-0.1759323, -0.3931275, -2.674437, 0, 1, 0.6235294, 1,
-0.1733104, -1.045745, -2.488749, 0, 1, 0.627451, 1,
-0.172951, -0.6214113, -1.471395, 0, 1, 0.6352941, 1,
-0.1728823, 1.594449, -0.002831596, 0, 1, 0.6392157, 1,
-0.1701909, -0.09623725, -3.83326, 0, 1, 0.6470588, 1,
-0.1667888, -1.985058, -2.493225, 0, 1, 0.6509804, 1,
-0.1664316, -0.9957774, -1.650097, 0, 1, 0.6588235, 1,
-0.1664235, -0.2527113, -2.391082, 0, 1, 0.6627451, 1,
-0.1661189, -1.894973, -1.065272, 0, 1, 0.6705883, 1,
-0.1651907, -0.6938894, -2.433256, 0, 1, 0.6745098, 1,
-0.164259, -0.917811, -2.622386, 0, 1, 0.682353, 1,
-0.1634382, 0.4640456, -1.448072, 0, 1, 0.6862745, 1,
-0.1619168, 2.168324, -0.3367363, 0, 1, 0.6941177, 1,
-0.1617334, 1.358913, -1.816713, 0, 1, 0.7019608, 1,
-0.1490244, -0.2906809, -2.946535, 0, 1, 0.7058824, 1,
-0.1464953, -0.5314257, -2.319696, 0, 1, 0.7137255, 1,
-0.1452603, -1.446517, -1.121639, 0, 1, 0.7176471, 1,
-0.139313, -0.0009800537, -3.582339, 0, 1, 0.7254902, 1,
-0.1358301, -0.1129094, -1.573011, 0, 1, 0.7294118, 1,
-0.1324764, -1.37328, -1.965141, 0, 1, 0.7372549, 1,
-0.1302673, -0.4213269, -2.5734, 0, 1, 0.7411765, 1,
-0.1208255, 0.6020827, 0.09838714, 0, 1, 0.7490196, 1,
-0.1191585, -0.3442056, -1.52385, 0, 1, 0.7529412, 1,
-0.1123923, -0.007112549, -2.241426, 0, 1, 0.7607843, 1,
-0.1070574, -0.423276, -0.262538, 0, 1, 0.7647059, 1,
-0.1064343, -0.9746206, -1.004719, 0, 1, 0.772549, 1,
-0.1041499, 1.342514, 1.030241, 0, 1, 0.7764706, 1,
-0.1005717, 0.9843509, -0.9360111, 0, 1, 0.7843137, 1,
-0.09739417, -0.8273138, -2.382771, 0, 1, 0.7882353, 1,
-0.09555057, 0.1290876, -1.671167, 0, 1, 0.7960784, 1,
-0.09237652, 0.7310986, -0.6265861, 0, 1, 0.8039216, 1,
-0.09091999, -0.1803246, -1.917311, 0, 1, 0.8078431, 1,
-0.08754735, -1.712155, -2.433641, 0, 1, 0.8156863, 1,
-0.08644111, -0.481108, -2.739186, 0, 1, 0.8196079, 1,
-0.0815161, -0.1886492, -3.53711, 0, 1, 0.827451, 1,
-0.07904802, 1.072914, 0.4370788, 0, 1, 0.8313726, 1,
-0.07803825, 0.4671407, -0.03943765, 0, 1, 0.8392157, 1,
-0.0765949, 0.6563675, 0.6829234, 0, 1, 0.8431373, 1,
-0.07423423, -0.373707, -1.959828, 0, 1, 0.8509804, 1,
-0.07009321, -0.4492226, -3.105977, 0, 1, 0.854902, 1,
-0.06453869, 1.464738, 0.01420022, 0, 1, 0.8627451, 1,
-0.06194315, -1.151167, -2.599186, 0, 1, 0.8666667, 1,
-0.05884248, 0.9062157, 1.158816, 0, 1, 0.8745098, 1,
-0.05860374, -1.047406, -3.20816, 0, 1, 0.8784314, 1,
-0.05661789, -2.241459, -3.036725, 0, 1, 0.8862745, 1,
-0.0542446, 0.3294711, -0.905049, 0, 1, 0.8901961, 1,
-0.05373504, -0.1691423, -3.623825, 0, 1, 0.8980392, 1,
-0.05106692, -1.476011, -3.606484, 0, 1, 0.9058824, 1,
-0.04923512, 1.750328, -0.6434005, 0, 1, 0.9098039, 1,
-0.04877792, -0.543, -2.939705, 0, 1, 0.9176471, 1,
-0.04278922, 1.716668, 0.4512188, 0, 1, 0.9215686, 1,
-0.04130469, -2.171049, -1.947998, 0, 1, 0.9294118, 1,
-0.03509666, 2.262633, -1.368129, 0, 1, 0.9333333, 1,
-0.03293078, -0.6423644, -3.340196, 0, 1, 0.9411765, 1,
-0.03163967, -0.2831176, -0.5213498, 0, 1, 0.945098, 1,
-0.03119206, 1.086497, -0.506227, 0, 1, 0.9529412, 1,
-0.02841607, 1.336324, 0.7258688, 0, 1, 0.9568627, 1,
-0.02815227, 0.3688681, -0.1844677, 0, 1, 0.9647059, 1,
-0.02617939, -0.06894695, -4.587533, 0, 1, 0.9686275, 1,
-0.0234367, -0.5340641, -4.389463, 0, 1, 0.9764706, 1,
-0.02065437, -0.8557134, -4.528144, 0, 1, 0.9803922, 1,
-0.01631158, 0.5284525, -0.7116714, 0, 1, 0.9882353, 1,
-0.01619881, 0.5285254, 0.07046376, 0, 1, 0.9921569, 1,
-0.01594223, 0.8348292, 0.03019596, 0, 1, 1, 1,
-0.01312834, -2.619577, -3.527829, 0, 0.9921569, 1, 1,
-0.004545068, 0.6923652, 0.2255792, 0, 0.9882353, 1, 1,
-0.0007977112, 0.1020308, 2.253592, 0, 0.9803922, 1, 1,
-0.0002504277, 0.3295799, -0.5892938, 0, 0.9764706, 1, 1,
-0.0001177161, 0.3219773, -0.5343988, 0, 0.9686275, 1, 1,
0.001651886, 0.6663511, -0.9487284, 0, 0.9647059, 1, 1,
0.004681073, -0.4413424, 3.846643, 0, 0.9568627, 1, 1,
0.004758721, -0.78003, 2.46655, 0, 0.9529412, 1, 1,
0.009009483, 0.9699708, 2.54428, 0, 0.945098, 1, 1,
0.009595147, -1.427472, 2.034206, 0, 0.9411765, 1, 1,
0.01084185, 0.5693967, 0.8886671, 0, 0.9333333, 1, 1,
0.0115931, -1.57338, 3.190685, 0, 0.9294118, 1, 1,
0.01360007, 0.6014957, -1.233377, 0, 0.9215686, 1, 1,
0.01427805, -0.4333235, 3.330376, 0, 0.9176471, 1, 1,
0.01928907, -0.6311364, 3.432844, 0, 0.9098039, 1, 1,
0.02122737, -1.052294, 3.341514, 0, 0.9058824, 1, 1,
0.04326169, 0.8231196, 0.7088708, 0, 0.8980392, 1, 1,
0.04439897, -0.7114955, 3.10783, 0, 0.8901961, 1, 1,
0.05432149, -0.02571064, 0.9690925, 0, 0.8862745, 1, 1,
0.05608289, -0.5068342, 4.017665, 0, 0.8784314, 1, 1,
0.060532, 0.6771596, -1.171953, 0, 0.8745098, 1, 1,
0.0612941, 0.8553293, 0.6533996, 0, 0.8666667, 1, 1,
0.06134533, -0.2908145, 1.138159, 0, 0.8627451, 1, 1,
0.06459918, 0.2629479, 0.4164992, 0, 0.854902, 1, 1,
0.06513593, 1.98015, 0.8313808, 0, 0.8509804, 1, 1,
0.06515817, 0.3181061, -0.9894879, 0, 0.8431373, 1, 1,
0.06968886, -0.4328409, 3.796463, 0, 0.8392157, 1, 1,
0.0714349, 0.6366531, 0.5780334, 0, 0.8313726, 1, 1,
0.07421293, 1.251447, 0.1152513, 0, 0.827451, 1, 1,
0.0767419, 1.603711, -0.6827005, 0, 0.8196079, 1, 1,
0.0823104, -0.1346156, -0.0967656, 0, 0.8156863, 1, 1,
0.08526042, -1.269435, 2.358548, 0, 0.8078431, 1, 1,
0.08676462, 0.7807015, -1.116366, 0, 0.8039216, 1, 1,
0.08847584, -0.3491754, 1.025752, 0, 0.7960784, 1, 1,
0.09337617, 2.204832, 0.3986554, 0, 0.7882353, 1, 1,
0.09567658, -1.772082, 2.712528, 0, 0.7843137, 1, 1,
0.09621217, 0.2641547, 0.8343974, 0, 0.7764706, 1, 1,
0.09661797, -0.9081725, 3.830858, 0, 0.772549, 1, 1,
0.1030789, 0.5278999, 1.32234, 0, 0.7647059, 1, 1,
0.1126845, 2.470773, -3.530258, 0, 0.7607843, 1, 1,
0.1149524, -0.1296709, 3.140064, 0, 0.7529412, 1, 1,
0.1221834, 0.7050557, 0.5501615, 0, 0.7490196, 1, 1,
0.1331093, -0.8116894, 3.812719, 0, 0.7411765, 1, 1,
0.1357898, -1.920614, 3.028839, 0, 0.7372549, 1, 1,
0.1377976, 2.951727, -1.304178, 0, 0.7294118, 1, 1,
0.1476761, 0.5708237, 0.7915624, 0, 0.7254902, 1, 1,
0.152149, -0.0722124, 2.805322, 0, 0.7176471, 1, 1,
0.1548118, 0.6076191, 1.217918, 0, 0.7137255, 1, 1,
0.1578365, 0.2504722, -0.6842015, 0, 0.7058824, 1, 1,
0.157992, 0.03675523, -0.127109, 0, 0.6980392, 1, 1,
0.1582255, -1.165498, 3.707291, 0, 0.6941177, 1, 1,
0.159848, -1.634797, 2.173004, 0, 0.6862745, 1, 1,
0.1620862, -0.9633256, 4.252572, 0, 0.682353, 1, 1,
0.1625032, -0.8461125, 2.760759, 0, 0.6745098, 1, 1,
0.1680016, 0.9631836, 1.823076, 0, 0.6705883, 1, 1,
0.1692344, -0.6407738, 3.50689, 0, 0.6627451, 1, 1,
0.172686, 0.09980149, 1.668212, 0, 0.6588235, 1, 1,
0.1757526, 0.1388603, 2.125904, 0, 0.6509804, 1, 1,
0.1787669, 1.685116, 0.2236332, 0, 0.6470588, 1, 1,
0.1809885, -2.557729, 4.296518, 0, 0.6392157, 1, 1,
0.1816632, -0.6485529, 3.551681, 0, 0.6352941, 1, 1,
0.186134, 0.1488451, -1.534157, 0, 0.627451, 1, 1,
0.1861983, -1.969161, 3.225349, 0, 0.6235294, 1, 1,
0.1907839, -0.4300979, 2.316213, 0, 0.6156863, 1, 1,
0.194948, 1.386088, -0.4230902, 0, 0.6117647, 1, 1,
0.1970605, -1.663049, 3.051777, 0, 0.6039216, 1, 1,
0.1980684, -1.025207, 3.782021, 0, 0.5960785, 1, 1,
0.2014114, -0.9710318, 0.9423839, 0, 0.5921569, 1, 1,
0.2073719, 0.06379281, 1.074164, 0, 0.5843138, 1, 1,
0.2089523, -0.9250761, 4.018453, 0, 0.5803922, 1, 1,
0.2153922, 0.2905107, 0.9476897, 0, 0.572549, 1, 1,
0.21622, 0.6542243, 2.229901, 0, 0.5686275, 1, 1,
0.2198759, -0.4859631, 1.190079, 0, 0.5607843, 1, 1,
0.2227087, -0.5088574, 2.683003, 0, 0.5568628, 1, 1,
0.2227388, 1.280378, -1.072277, 0, 0.5490196, 1, 1,
0.2255175, -1.234325, 2.486892, 0, 0.5450981, 1, 1,
0.2273119, -1.555627, 2.550525, 0, 0.5372549, 1, 1,
0.2276008, 0.2490874, 1.72921, 0, 0.5333334, 1, 1,
0.2364321, -0.3765774, 2.475706, 0, 0.5254902, 1, 1,
0.2410432, -1.152524, 4.624454, 0, 0.5215687, 1, 1,
0.2431005, 0.2131677, 3.109834, 0, 0.5137255, 1, 1,
0.2443585, 0.9868405, 2.58649, 0, 0.509804, 1, 1,
0.2453152, -0.561573, 2.744703, 0, 0.5019608, 1, 1,
0.2459647, -0.9051544, 1.374621, 0, 0.4941176, 1, 1,
0.2489483, 0.5825797, 0.1083817, 0, 0.4901961, 1, 1,
0.2564378, -0.1550921, 0.3319029, 0, 0.4823529, 1, 1,
0.2577271, -0.5673627, 2.069461, 0, 0.4784314, 1, 1,
0.2580244, -1.765653, 0.7974594, 0, 0.4705882, 1, 1,
0.2614916, -0.01116769, 0.6372211, 0, 0.4666667, 1, 1,
0.2661068, -0.4107814, 4.00678, 0, 0.4588235, 1, 1,
0.2743637, 0.3282725, 0.8741652, 0, 0.454902, 1, 1,
0.2788996, -0.6757053, 2.617057, 0, 0.4470588, 1, 1,
0.2791947, 1.080849, 1.372671, 0, 0.4431373, 1, 1,
0.2792098, 0.519398, 0.9882334, 0, 0.4352941, 1, 1,
0.2792626, 1.060829, -0.7033861, 0, 0.4313726, 1, 1,
0.2817764, -1.611062, 3.568043, 0, 0.4235294, 1, 1,
0.2883443, 2.542515, 0.8355189, 0, 0.4196078, 1, 1,
0.2907631, 0.2375769, 2.239515, 0, 0.4117647, 1, 1,
0.2917151, -0.425471, 2.646183, 0, 0.4078431, 1, 1,
0.2920105, 0.2563714, -0.3393296, 0, 0.4, 1, 1,
0.2932777, -0.06610126, 0.4603241, 0, 0.3921569, 1, 1,
0.2962046, -0.2045538, 2.814265, 0, 0.3882353, 1, 1,
0.2963023, 0.1287249, 1.260027, 0, 0.3803922, 1, 1,
0.2966058, -0.5220008, 2.097674, 0, 0.3764706, 1, 1,
0.3010469, 2.821194, -0.7427088, 0, 0.3686275, 1, 1,
0.3021226, 0.4367302, -0.06986187, 0, 0.3647059, 1, 1,
0.3025618, -1.105882, 4.735579, 0, 0.3568628, 1, 1,
0.3044452, 0.9316013, 1.682961, 0, 0.3529412, 1, 1,
0.3180586, 0.2232465, 1.854208, 0, 0.345098, 1, 1,
0.3193212, -0.7888315, 2.792004, 0, 0.3411765, 1, 1,
0.3199464, 0.6037532, 0.9921441, 0, 0.3333333, 1, 1,
0.3208944, 2.035743, 1.443234, 0, 0.3294118, 1, 1,
0.3217414, 1.637282, 1.439862, 0, 0.3215686, 1, 1,
0.3232403, 0.2766402, 0.5496625, 0, 0.3176471, 1, 1,
0.332543, 0.947573, 0.9930055, 0, 0.3098039, 1, 1,
0.3344552, -0.2201933, 1.895178, 0, 0.3058824, 1, 1,
0.3345914, 0.4713201, -0.3335108, 0, 0.2980392, 1, 1,
0.3410774, -1.366964, 2.327682, 0, 0.2901961, 1, 1,
0.3468286, -0.9811442, 1.539807, 0, 0.2862745, 1, 1,
0.3468319, -1.375718, 4.321735, 0, 0.2784314, 1, 1,
0.34753, -0.7039781, 2.525108, 0, 0.2745098, 1, 1,
0.3523344, -1.165396, 3.5339, 0, 0.2666667, 1, 1,
0.3560897, 0.5414918, -0.1602016, 0, 0.2627451, 1, 1,
0.3567195, 1.022407, -0.3662014, 0, 0.254902, 1, 1,
0.3582401, 0.3689379, 1.40725, 0, 0.2509804, 1, 1,
0.366432, -0.4922118, 3.399125, 0, 0.2431373, 1, 1,
0.367657, 0.5071689, -0.164923, 0, 0.2392157, 1, 1,
0.3699123, 1.522704, 0.9736151, 0, 0.2313726, 1, 1,
0.3728002, 1.515756, -0.1107465, 0, 0.227451, 1, 1,
0.3769597, 0.7591258, -0.6531835, 0, 0.2196078, 1, 1,
0.3774261, -1.033767, 1.077386, 0, 0.2156863, 1, 1,
0.3818575, -0.730262, 1.814443, 0, 0.2078431, 1, 1,
0.3846144, 1.63679, 0.9476246, 0, 0.2039216, 1, 1,
0.3871295, 0.2035988, 0.925157, 0, 0.1960784, 1, 1,
0.3877442, -0.7368365, 2.623105, 0, 0.1882353, 1, 1,
0.3879265, 1.527733, 2.438026, 0, 0.1843137, 1, 1,
0.3881622, -0.5625967, 2.57648, 0, 0.1764706, 1, 1,
0.3894354, -0.4464512, 2.623025, 0, 0.172549, 1, 1,
0.3902506, -0.3717719, 2.81628, 0, 0.1647059, 1, 1,
0.3928033, 1.473914, 1.081762, 0, 0.1607843, 1, 1,
0.3974347, -1.02117, 3.313777, 0, 0.1529412, 1, 1,
0.397697, -0.6004415, 1.001664, 0, 0.1490196, 1, 1,
0.3992022, 0.6262212, 0.1458117, 0, 0.1411765, 1, 1,
0.399411, -0.6707458, 2.457953, 0, 0.1372549, 1, 1,
0.3998192, 1.49153, -1.245351, 0, 0.1294118, 1, 1,
0.4012522, 0.7438107, 0.6653063, 0, 0.1254902, 1, 1,
0.4028637, 0.3634213, 1.073736, 0, 0.1176471, 1, 1,
0.4037203, -1.819796, 4.963324, 0, 0.1137255, 1, 1,
0.4038976, -0.7903811, 1.775366, 0, 0.1058824, 1, 1,
0.4173903, 0.9990132, 1.93103, 0, 0.09803922, 1, 1,
0.4205028, -0.1165343, 1.707611, 0, 0.09411765, 1, 1,
0.4243923, 0.2954901, 1.711691, 0, 0.08627451, 1, 1,
0.4255148, -0.07816347, 2.029681, 0, 0.08235294, 1, 1,
0.4280924, -0.5093515, 2.395044, 0, 0.07450981, 1, 1,
0.4313908, 0.4667804, 0.1816729, 0, 0.07058824, 1, 1,
0.4318457, -0.8628609, 4.039078, 0, 0.0627451, 1, 1,
0.4356599, -1.097334, 2.031604, 0, 0.05882353, 1, 1,
0.4361221, -0.1541131, 1.897625, 0, 0.05098039, 1, 1,
0.4424556, -0.5514837, 4.239474, 0, 0.04705882, 1, 1,
0.4446796, 0.009354847, 1.358868, 0, 0.03921569, 1, 1,
0.4456701, -0.3287122, 3.821473, 0, 0.03529412, 1, 1,
0.4456981, 0.332565, 0.3506658, 0, 0.02745098, 1, 1,
0.4457093, 0.01624385, 1.793877, 0, 0.02352941, 1, 1,
0.4468298, 1.573471, 0.448947, 0, 0.01568628, 1, 1,
0.4494955, -1.234083, 2.019305, 0, 0.01176471, 1, 1,
0.4609898, -0.6902702, 0.4677876, 0, 0.003921569, 1, 1,
0.4642545, 1.904177, -0.6674192, 0.003921569, 0, 1, 1,
0.4721054, -0.3719437, 3.293736, 0.007843138, 0, 1, 1,
0.474267, -0.007311831, 2.995341, 0.01568628, 0, 1, 1,
0.4773537, 1.282959, 0.6914382, 0.01960784, 0, 1, 1,
0.4781517, -1.032672, 2.308201, 0.02745098, 0, 1, 1,
0.4822215, 1.251006, -1.125502, 0.03137255, 0, 1, 1,
0.4829998, 2.203147, 1.148407, 0.03921569, 0, 1, 1,
0.4897614, -1.06141, 2.27879, 0.04313726, 0, 1, 1,
0.4909867, -1.610229, 3.57047, 0.05098039, 0, 1, 1,
0.494205, 0.6711036, 1.011061, 0.05490196, 0, 1, 1,
0.5030627, -1.250577, 3.978643, 0.0627451, 0, 1, 1,
0.5044303, 1.118621, -0.6531407, 0.06666667, 0, 1, 1,
0.5060096, -0.9929444, 1.644, 0.07450981, 0, 1, 1,
0.5070914, 0.2615113, 0.6745473, 0.07843138, 0, 1, 1,
0.5083781, -1.253462, 2.295872, 0.08627451, 0, 1, 1,
0.5090978, 0.658787, -0.1296235, 0.09019608, 0, 1, 1,
0.5111303, 0.7504783, -0.8484711, 0.09803922, 0, 1, 1,
0.5138035, 0.597643, -1.42014, 0.1058824, 0, 1, 1,
0.5144095, 0.3206348, 0.1308099, 0.1098039, 0, 1, 1,
0.5165824, -0.2692375, 2.460568, 0.1176471, 0, 1, 1,
0.5289728, -0.7125207, 2.956945, 0.1215686, 0, 1, 1,
0.5304416, 0.6614491, 1.47098, 0.1294118, 0, 1, 1,
0.5307216, -0.6318504, 2.163678, 0.1333333, 0, 1, 1,
0.5309939, 0.4133272, -1.43228, 0.1411765, 0, 1, 1,
0.5361837, -1.596091, 2.105176, 0.145098, 0, 1, 1,
0.5372989, -1.185037, 1.107116, 0.1529412, 0, 1, 1,
0.5460437, 1.785369, 1.798466, 0.1568628, 0, 1, 1,
0.5475265, -0.9332574, 2.362894, 0.1647059, 0, 1, 1,
0.5483979, -0.6300132, 3.214127, 0.1686275, 0, 1, 1,
0.5486175, -2.511454, 1.228754, 0.1764706, 0, 1, 1,
0.5509037, -0.9574571, 1.695018, 0.1803922, 0, 1, 1,
0.5515956, -1.259418, 1.604215, 0.1882353, 0, 1, 1,
0.5529702, 0.2678398, 1.258938, 0.1921569, 0, 1, 1,
0.5542464, 1.219075, -0.2756507, 0.2, 0, 1, 1,
0.5591145, 1.271804, 4.241706, 0.2078431, 0, 1, 1,
0.5613537, -0.156676, 0.4278001, 0.2117647, 0, 1, 1,
0.564062, 1.098268, -0.3214401, 0.2196078, 0, 1, 1,
0.5672376, -1.902102, 3.373186, 0.2235294, 0, 1, 1,
0.5675662, -0.8630868, 2.139366, 0.2313726, 0, 1, 1,
0.5817764, 0.4291117, 0.8738933, 0.2352941, 0, 1, 1,
0.5881054, -0.0003732946, 1.090497, 0.2431373, 0, 1, 1,
0.5891243, -0.431453, 3.448251, 0.2470588, 0, 1, 1,
0.5922965, 0.5971314, 0.8402796, 0.254902, 0, 1, 1,
0.5952044, -0.1392928, 1.533502, 0.2588235, 0, 1, 1,
0.5979252, -0.9593938, 3.312699, 0.2666667, 0, 1, 1,
0.5988251, 1.595644, -0.902557, 0.2705882, 0, 1, 1,
0.5992674, -0.6968685, 3.094114, 0.2784314, 0, 1, 1,
0.5996583, 0.05457069, 0.9603059, 0.282353, 0, 1, 1,
0.6033283, -1.740587, 3.177513, 0.2901961, 0, 1, 1,
0.6063344, -0.1356429, 2.823524, 0.2941177, 0, 1, 1,
0.6071045, -0.1041086, 1.392063, 0.3019608, 0, 1, 1,
0.6092398, -2.378622, 1.523026, 0.3098039, 0, 1, 1,
0.6164539, -0.09049607, 0.678009, 0.3137255, 0, 1, 1,
0.6203547, -0.3078643, 1.570184, 0.3215686, 0, 1, 1,
0.6212626, -0.251163, 0.7905962, 0.3254902, 0, 1, 1,
0.6238052, -0.324141, 1.251278, 0.3333333, 0, 1, 1,
0.6252885, -1.039844, 3.633041, 0.3372549, 0, 1, 1,
0.6305302, 0.3500834, -0.4846771, 0.345098, 0, 1, 1,
0.6334563, 1.540652, -1.127576, 0.3490196, 0, 1, 1,
0.633687, 0.4165791, 1.400604, 0.3568628, 0, 1, 1,
0.6359391, 1.034611, -0.781049, 0.3607843, 0, 1, 1,
0.6387194, -0.4104706, 0.235663, 0.3686275, 0, 1, 1,
0.6390489, 1.532942, -0.06214476, 0.372549, 0, 1, 1,
0.6443398, 0.4969676, -0.0158957, 0.3803922, 0, 1, 1,
0.648039, -0.8702849, 0.9832402, 0.3843137, 0, 1, 1,
0.6513526, 0.4887517, 1.442106, 0.3921569, 0, 1, 1,
0.6526561, -0.5342612, 4.038116, 0.3960784, 0, 1, 1,
0.6545229, 1.303378, 0.01570036, 0.4039216, 0, 1, 1,
0.6568993, 1.663034, 0.9769422, 0.4117647, 0, 1, 1,
0.6599496, -0.4099534, 2.327214, 0.4156863, 0, 1, 1,
0.6655319, -0.4740293, 2.312165, 0.4235294, 0, 1, 1,
0.6663249, -0.5026976, 1.589586, 0.427451, 0, 1, 1,
0.667165, 0.5469559, -1.794103, 0.4352941, 0, 1, 1,
0.6693346, -0.434259, 2.362819, 0.4392157, 0, 1, 1,
0.6736724, -0.3179528, 0.3661066, 0.4470588, 0, 1, 1,
0.6751778, 1.493668, 0.8438337, 0.4509804, 0, 1, 1,
0.6777434, 0.4714766, 1.09768, 0.4588235, 0, 1, 1,
0.6778668, 1.365254, -1.467713, 0.4627451, 0, 1, 1,
0.6788414, 0.6932536, -0.4843392, 0.4705882, 0, 1, 1,
0.6858538, -0.304511, 1.611083, 0.4745098, 0, 1, 1,
0.6872092, 0.2627041, 0.4161685, 0.4823529, 0, 1, 1,
0.6900237, -1.629019, 2.573664, 0.4862745, 0, 1, 1,
0.6912794, -0.4190554, 4.143372, 0.4941176, 0, 1, 1,
0.6918447, 0.7647728, 0.1716028, 0.5019608, 0, 1, 1,
0.693076, -0.01656704, 0.5271392, 0.5058824, 0, 1, 1,
0.6952546, -1.459581, 3.184699, 0.5137255, 0, 1, 1,
0.6989596, 1.169155, 1.509318, 0.5176471, 0, 1, 1,
0.6997661, -0.4722922, 3.544208, 0.5254902, 0, 1, 1,
0.703437, -0.1255063, 1.142218, 0.5294118, 0, 1, 1,
0.7047822, -0.9384406, 2.992849, 0.5372549, 0, 1, 1,
0.7057319, 0.01178509, 0.9093315, 0.5411765, 0, 1, 1,
0.7070459, -0.2742819, 1.13806, 0.5490196, 0, 1, 1,
0.7071956, 0.7327928, 1.339193, 0.5529412, 0, 1, 1,
0.7085448, 0.2603191, 0.7153357, 0.5607843, 0, 1, 1,
0.7168649, 0.004850134, 2.162308, 0.5647059, 0, 1, 1,
0.717921, 0.5766876, 1.913999, 0.572549, 0, 1, 1,
0.7266171, -0.7442836, 2.634488, 0.5764706, 0, 1, 1,
0.7267658, 1.493396, -0.714009, 0.5843138, 0, 1, 1,
0.7301412, -0.4548177, 2.421704, 0.5882353, 0, 1, 1,
0.7462188, -1.367812, 2.145736, 0.5960785, 0, 1, 1,
0.7515584, -0.2381224, 1.532243, 0.6039216, 0, 1, 1,
0.7524898, -1.618341, 1.074953, 0.6078432, 0, 1, 1,
0.7596077, -0.01052861, 2.140565, 0.6156863, 0, 1, 1,
0.7604142, -0.001762085, 0.8057195, 0.6196079, 0, 1, 1,
0.7751494, -0.8979387, 3.002339, 0.627451, 0, 1, 1,
0.7753556, -1.397785, 2.76548, 0.6313726, 0, 1, 1,
0.775491, -1.145925, 1.821791, 0.6392157, 0, 1, 1,
0.7767974, 0.4559212, 0.3372308, 0.6431373, 0, 1, 1,
0.7777255, -2.03474, 2.112621, 0.6509804, 0, 1, 1,
0.7811524, -0.6954082, 1.7116, 0.654902, 0, 1, 1,
0.7814137, -1.233637, 3.220267, 0.6627451, 0, 1, 1,
0.7833452, -0.19062, 1.478037, 0.6666667, 0, 1, 1,
0.7842942, 1.046566, 1.987267, 0.6745098, 0, 1, 1,
0.7854662, 2.773857, 0.3331768, 0.6784314, 0, 1, 1,
0.7883571, -1.634739, 0.8821423, 0.6862745, 0, 1, 1,
0.7892513, 0.5729568, 1.054442, 0.6901961, 0, 1, 1,
0.7892984, 1.105012, 1.483996, 0.6980392, 0, 1, 1,
0.7901706, 0.2017313, 0.8435189, 0.7058824, 0, 1, 1,
0.7956323, -0.02335415, 2.730214, 0.7098039, 0, 1, 1,
0.7981707, 0.1211788, 0.5303365, 0.7176471, 0, 1, 1,
0.8071617, 1.464337, -0.3233958, 0.7215686, 0, 1, 1,
0.8145655, 0.8456856, 1.189785, 0.7294118, 0, 1, 1,
0.8149405, -0.402058, 0.4750904, 0.7333333, 0, 1, 1,
0.817805, 0.1835855, 1.462818, 0.7411765, 0, 1, 1,
0.820682, 1.102784, -0.5829011, 0.7450981, 0, 1, 1,
0.8215009, -0.1959736, 2.313073, 0.7529412, 0, 1, 1,
0.8225151, -0.1810305, 0.9409356, 0.7568628, 0, 1, 1,
0.823312, -0.8252389, 2.517822, 0.7647059, 0, 1, 1,
0.8330879, 0.9820821, 0.506667, 0.7686275, 0, 1, 1,
0.8362495, -0.6884874, 2.50524, 0.7764706, 0, 1, 1,
0.8396888, 0.09569399, 1.231875, 0.7803922, 0, 1, 1,
0.8496494, 1.637329, 0.815221, 0.7882353, 0, 1, 1,
0.8500412, 0.2462361, 2.500741, 0.7921569, 0, 1, 1,
0.8522889, -0.2012062, 2.461491, 0.8, 0, 1, 1,
0.8543552, 1.442291, 1.106449, 0.8078431, 0, 1, 1,
0.8556451, -1.995566, 1.821347, 0.8117647, 0, 1, 1,
0.8616652, -1.361119, 1.681438, 0.8196079, 0, 1, 1,
0.8656822, -0.5060961, 2.750581, 0.8235294, 0, 1, 1,
0.8659498, -0.8712185, 0.02087363, 0.8313726, 0, 1, 1,
0.8681896, -2.118373, 3.678532, 0.8352941, 0, 1, 1,
0.8720758, 0.1080458, 1.065351, 0.8431373, 0, 1, 1,
0.8721189, 1.069832, 0.6656803, 0.8470588, 0, 1, 1,
0.8730902, 0.6863527, 1.539119, 0.854902, 0, 1, 1,
0.8745964, 1.090698, 0.5816747, 0.8588235, 0, 1, 1,
0.8844618, -0.0842424, 2.233419, 0.8666667, 0, 1, 1,
0.8856986, -0.3402693, 2.690152, 0.8705882, 0, 1, 1,
0.8885241, -0.2200547, 0.3043148, 0.8784314, 0, 1, 1,
0.9005117, -0.282007, 1.131003, 0.8823529, 0, 1, 1,
0.9036168, 0.2723313, 1.717193, 0.8901961, 0, 1, 1,
0.9039283, -1.31051, 3.054048, 0.8941177, 0, 1, 1,
0.9041155, 0.041081, -0.5458733, 0.9019608, 0, 1, 1,
0.905331, -0.08646356, 3.072243, 0.9098039, 0, 1, 1,
0.9054217, 0.8148503, 0.1308372, 0.9137255, 0, 1, 1,
0.9102669, -0.8386677, 2.840249, 0.9215686, 0, 1, 1,
0.9143854, 0.6369368, 1.824531, 0.9254902, 0, 1, 1,
0.9149937, 0.7354244, 1.213415, 0.9333333, 0, 1, 1,
0.9253027, -1.749657, 4.284318, 0.9372549, 0, 1, 1,
0.9281614, -1.516083, 2.19535, 0.945098, 0, 1, 1,
0.9357358, -0.4552179, 2.651183, 0.9490196, 0, 1, 1,
0.9436851, 0.1983832, 1.718462, 0.9568627, 0, 1, 1,
0.9500338, 0.4214935, 1.161084, 0.9607843, 0, 1, 1,
0.9534587, 0.8582196, 1.3943, 0.9686275, 0, 1, 1,
0.9571624, 0.2565803, -0.3487383, 0.972549, 0, 1, 1,
0.9586653, -1.172247, 2.136532, 0.9803922, 0, 1, 1,
0.9594628, -0.564512, 2.453667, 0.9843137, 0, 1, 1,
0.9691603, 0.3241572, 2.047693, 0.9921569, 0, 1, 1,
0.9701217, -1.675317, 1.22289, 0.9960784, 0, 1, 1,
0.9858087, 0.7699518, 0.6748849, 1, 0, 0.9960784, 1,
0.9903704, -2.632475, 3.753516, 1, 0, 0.9882353, 1,
0.9912838, -1.844931, 0.9899929, 1, 0, 0.9843137, 1,
0.9960938, -1.189033, 2.805367, 1, 0, 0.9764706, 1,
1.000001, 0.4869132, 1.108838, 1, 0, 0.972549, 1,
1.002621, 1.110553, -0.8699501, 1, 0, 0.9647059, 1,
1.004502, -0.04903248, 1.198224, 1, 0, 0.9607843, 1,
1.006322, -1.098482, 3.791402, 1, 0, 0.9529412, 1,
1.016769, 1.028427, -0.6342534, 1, 0, 0.9490196, 1,
1.024007, 0.4648258, 0.9988704, 1, 0, 0.9411765, 1,
1.028551, -0.2855837, 1.944621, 1, 0, 0.9372549, 1,
1.049362, -2.153637, 1.485825, 1, 0, 0.9294118, 1,
1.058472, -1.932893, 2.018312, 1, 0, 0.9254902, 1,
1.0651, 0.4704826, -0.1669805, 1, 0, 0.9176471, 1,
1.070516, -0.4144853, 2.133736, 1, 0, 0.9137255, 1,
1.074644, 1.813971, 0.1353135, 1, 0, 0.9058824, 1,
1.076125, -0.004660347, 2.417144, 1, 0, 0.9019608, 1,
1.084425, -0.01623056, 3.101021, 1, 0, 0.8941177, 1,
1.090352, 0.2980073, 1.502074, 1, 0, 0.8862745, 1,
1.094818, -0.2039802, 3.362321, 1, 0, 0.8823529, 1,
1.110475, -0.9454062, 2.558177, 1, 0, 0.8745098, 1,
1.115476, -0.5318137, 0.8031272, 1, 0, 0.8705882, 1,
1.119952, 0.4157404, 0.3829446, 1, 0, 0.8627451, 1,
1.125923, 0.1536805, 2.128271, 1, 0, 0.8588235, 1,
1.128412, -0.3555726, 2.477864, 1, 0, 0.8509804, 1,
1.129549, 1.247907, -0.439934, 1, 0, 0.8470588, 1,
1.131665, -0.2052515, 1.833683, 1, 0, 0.8392157, 1,
1.132361, -0.3608484, 2.313554, 1, 0, 0.8352941, 1,
1.139802, 0.07237989, 1.377123, 1, 0, 0.827451, 1,
1.14039, -1.633894, 2.482013, 1, 0, 0.8235294, 1,
1.142083, 0.04288606, 2.764655, 1, 0, 0.8156863, 1,
1.151389, 1.333242, 0.664493, 1, 0, 0.8117647, 1,
1.151974, -1.08514, 2.898975, 1, 0, 0.8039216, 1,
1.152472, -0.1202, 0.6246464, 1, 0, 0.7960784, 1,
1.159849, 0.6294881, -0.1044879, 1, 0, 0.7921569, 1,
1.160647, 0.7101222, 1.994786, 1, 0, 0.7843137, 1,
1.162046, 1.681659, 0.497423, 1, 0, 0.7803922, 1,
1.164286, -0.4373492, 1.78293, 1, 0, 0.772549, 1,
1.165129, -0.7308534, 0.5818859, 1, 0, 0.7686275, 1,
1.171458, -1.785847, 3.378498, 1, 0, 0.7607843, 1,
1.175417, 0.8887234, -0.5097499, 1, 0, 0.7568628, 1,
1.177115, 1.864132, -0.1752938, 1, 0, 0.7490196, 1,
1.178059, 0.3542592, 1.232379, 1, 0, 0.7450981, 1,
1.183217, 0.8660892, 0.4448322, 1, 0, 0.7372549, 1,
1.184684, -0.2502747, 2.778968, 1, 0, 0.7333333, 1,
1.186188, -0.5738663, 2.389636, 1, 0, 0.7254902, 1,
1.186535, 0.9831604, -0.002831774, 1, 0, 0.7215686, 1,
1.189445, -0.1016746, 1.659915, 1, 0, 0.7137255, 1,
1.192336, -0.06837433, 1.756439, 1, 0, 0.7098039, 1,
1.194005, -0.4255474, 0.8852389, 1, 0, 0.7019608, 1,
1.202691, 1.029215, 1.404047, 1, 0, 0.6941177, 1,
1.225651, 0.1453039, 1.150352, 1, 0, 0.6901961, 1,
1.232205, 0.6661753, -1.098753, 1, 0, 0.682353, 1,
1.237007, 2.300482, 1.177809, 1, 0, 0.6784314, 1,
1.247638, 1.596636, 0.609241, 1, 0, 0.6705883, 1,
1.250785, 0.007950415, 1.369622, 1, 0, 0.6666667, 1,
1.25334, -0.1306609, 2.404589, 1, 0, 0.6588235, 1,
1.263711, 1.989688, 2.779561, 1, 0, 0.654902, 1,
1.274161, -0.8641494, 3.284637, 1, 0, 0.6470588, 1,
1.279343, 0.02287114, 2.187235, 1, 0, 0.6431373, 1,
1.280574, -1.014905, 1.317635, 1, 0, 0.6352941, 1,
1.281139, 0.2983224, 1.383961, 1, 0, 0.6313726, 1,
1.285141, 1.040556, 0.0855864, 1, 0, 0.6235294, 1,
1.293269, -1.310832, 2.427429, 1, 0, 0.6196079, 1,
1.29607, -1.12385, 3.58816, 1, 0, 0.6117647, 1,
1.29851, -2.668554, 4.004719, 1, 0, 0.6078432, 1,
1.298546, -0.9796472, 2.24911, 1, 0, 0.6, 1,
1.313863, -0.06381053, 2.523826, 1, 0, 0.5921569, 1,
1.32201, 1.800022, -0.4592191, 1, 0, 0.5882353, 1,
1.327007, -0.7039975, 3.519256, 1, 0, 0.5803922, 1,
1.327464, 0.0541111, 1.545187, 1, 0, 0.5764706, 1,
1.332774, 1.370826, 1.448888, 1, 0, 0.5686275, 1,
1.334212, -0.1902948, 2.540057, 1, 0, 0.5647059, 1,
1.344157, -1.505128, 1.878482, 1, 0, 0.5568628, 1,
1.354343, -1.793504, 3.779469, 1, 0, 0.5529412, 1,
1.357692, 1.47909, 0.3117723, 1, 0, 0.5450981, 1,
1.358867, 0.5117677, 2.123518, 1, 0, 0.5411765, 1,
1.362277, 0.1961039, 1.056067, 1, 0, 0.5333334, 1,
1.367643, 1.04776, 2.408493, 1, 0, 0.5294118, 1,
1.3682, -0.3585699, 1.53324, 1, 0, 0.5215687, 1,
1.375858, -0.574253, 1.853643, 1, 0, 0.5176471, 1,
1.376314, -0.004875282, 1.917531, 1, 0, 0.509804, 1,
1.378193, -0.6971051, 2.065123, 1, 0, 0.5058824, 1,
1.378399, 0.521565, 2.579263, 1, 0, 0.4980392, 1,
1.427904, -1.157312, 2.863841, 1, 0, 0.4901961, 1,
1.427982, 1.044413, 0.619907, 1, 0, 0.4862745, 1,
1.435964, -0.08074637, 0.5223835, 1, 0, 0.4784314, 1,
1.447317, 1.577616, 0.6836819, 1, 0, 0.4745098, 1,
1.450238, -1.512497, 1.339235, 1, 0, 0.4666667, 1,
1.451108, -0.5589961, 2.161354, 1, 0, 0.4627451, 1,
1.455221, -0.340295, 2.227435, 1, 0, 0.454902, 1,
1.458723, 0.5981073, 3.142614, 1, 0, 0.4509804, 1,
1.46538, 2.071217, 0.9373935, 1, 0, 0.4431373, 1,
1.475174, -1.05545, 0.8393111, 1, 0, 0.4392157, 1,
1.477524, -0.9683217, 2.156619, 1, 0, 0.4313726, 1,
1.494799, 0.5840601, 0.4926295, 1, 0, 0.427451, 1,
1.496856, -0.5308007, 0.510749, 1, 0, 0.4196078, 1,
1.4969, -0.1603633, 0.1920417, 1, 0, 0.4156863, 1,
1.498181, -0.3043627, 3.315939, 1, 0, 0.4078431, 1,
1.503696, -0.01877879, 1.17746, 1, 0, 0.4039216, 1,
1.524066, 0.1219372, 2.642986, 1, 0, 0.3960784, 1,
1.524272, 0.7260758, 2.272472, 1, 0, 0.3882353, 1,
1.52869, 0.7014232, 2.592228, 1, 0, 0.3843137, 1,
1.53521, -0.493131, 1.174828, 1, 0, 0.3764706, 1,
1.547463, -1.07778, 2.693612, 1, 0, 0.372549, 1,
1.554847, 0.7316262, 2.193321, 1, 0, 0.3647059, 1,
1.556909, -1.054381, 1.466155, 1, 0, 0.3607843, 1,
1.558623, 2.601827, 0.6393464, 1, 0, 0.3529412, 1,
1.563886, -0.4583878, 2.288248, 1, 0, 0.3490196, 1,
1.579285, -0.5507228, 3.674663, 1, 0, 0.3411765, 1,
1.57972, -0.4442458, 2.153493, 1, 0, 0.3372549, 1,
1.585398, -1.541849, 2.417549, 1, 0, 0.3294118, 1,
1.590396, -1.660365, 2.451766, 1, 0, 0.3254902, 1,
1.591126, 0.07632031, 1.745858, 1, 0, 0.3176471, 1,
1.594617, -0.6187502, 1.360157, 1, 0, 0.3137255, 1,
1.599344, 0.04449894, 1.766088, 1, 0, 0.3058824, 1,
1.604002, 1.732534, 1.528638, 1, 0, 0.2980392, 1,
1.60876, -1.336514, 1.155923, 1, 0, 0.2941177, 1,
1.612541, -0.4814786, 1.40435, 1, 0, 0.2862745, 1,
1.614313, 0.7795885, 0.2972872, 1, 0, 0.282353, 1,
1.61905, -0.368132, 1.58689, 1, 0, 0.2745098, 1,
1.622623, 0.721008, -0.3830557, 1, 0, 0.2705882, 1,
1.625892, 1.153414, 1.608174, 1, 0, 0.2627451, 1,
1.644004, -1.019764, 3.493806, 1, 0, 0.2588235, 1,
1.650416, -0.1499503, 1.257097, 1, 0, 0.2509804, 1,
1.680985, 0.3604796, 2.600868, 1, 0, 0.2470588, 1,
1.681528, 2.621139, -0.2934536, 1, 0, 0.2392157, 1,
1.682932, 0.4957169, -0.5222723, 1, 0, 0.2352941, 1,
1.706954, -0.6176295, 1.984905, 1, 0, 0.227451, 1,
1.710218, -2.163136, 3.876277, 1, 0, 0.2235294, 1,
1.719912, -1.735924, 0.7109281, 1, 0, 0.2156863, 1,
1.73323, -0.4768127, 3.096919, 1, 0, 0.2117647, 1,
1.743934, 1.790732, 2.790625, 1, 0, 0.2039216, 1,
1.768813, 2.497206, -0.04020368, 1, 0, 0.1960784, 1,
1.783827, 0.3883436, 2.197013, 1, 0, 0.1921569, 1,
1.801488, 0.8186601, 1.58088, 1, 0, 0.1843137, 1,
1.80985, -1.060576, 1.329452, 1, 0, 0.1803922, 1,
1.81049, -0.4297316, 0.7210557, 1, 0, 0.172549, 1,
1.82481, -0.3318883, 1.121116, 1, 0, 0.1686275, 1,
1.851417, 0.1994379, 1.310626, 1, 0, 0.1607843, 1,
1.87253, -1.243009, 1.70958, 1, 0, 0.1568628, 1,
1.87381, -1.002022, 2.356741, 1, 0, 0.1490196, 1,
1.890909, 0.1236346, 2.1909, 1, 0, 0.145098, 1,
1.93736, -0.1038302, 2.581088, 1, 0, 0.1372549, 1,
1.948346, -1.127859, 0.07777945, 1, 0, 0.1333333, 1,
1.970319, -0.5764858, 2.1843, 1, 0, 0.1254902, 1,
1.973836, -1.177864, -0.5711682, 1, 0, 0.1215686, 1,
1.991946, 0.5434664, 0.004472536, 1, 0, 0.1137255, 1,
2.004803, -0.9569825, 2.085089, 1, 0, 0.1098039, 1,
2.064499, 0.3242691, 0.2640232, 1, 0, 0.1019608, 1,
2.081158, -1.535158, 2.97177, 1, 0, 0.09411765, 1,
2.133084, 2.003554, 1.163332, 1, 0, 0.09019608, 1,
2.134176, -0.6809934, 1.911774, 1, 0, 0.08235294, 1,
2.144949, 0.09103318, 2.745831, 1, 0, 0.07843138, 1,
2.149837, -0.8282544, 1.844153, 1, 0, 0.07058824, 1,
2.224189, -1.240152, 2.754223, 1, 0, 0.06666667, 1,
2.244415, -0.2537111, 1.969271, 1, 0, 0.05882353, 1,
2.259975, -0.6754265, 3.694874, 1, 0, 0.05490196, 1,
2.45944, 0.8982728, 1.219378, 1, 0, 0.04705882, 1,
2.514251, -1.042028, 2.745266, 1, 0, 0.04313726, 1,
2.672659, 0.7788991, 0.3154609, 1, 0, 0.03529412, 1,
2.727573, 1.761989, 2.686882, 1, 0, 0.03137255, 1,
2.959349, -1.998579, 2.92199, 1, 0, 0.02352941, 1,
3.232085, -1.398628, 1.783619, 1, 0, 0.01960784, 1,
3.828468, 0.2505238, -0.1667549, 1, 0, 0.01176471, 1,
4.025702, -0.6792414, 0.6030053, 1, 0, 0.007843138, 1
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
0.4099997, -3.621192, -6.276414, 0, -0.5, 0.5, 0.5,
0.4099997, -3.621192, -6.276414, 1, -0.5, 0.5, 0.5,
0.4099997, -3.621192, -6.276414, 1, 1.5, 0.5, 0.5,
0.4099997, -3.621192, -6.276414, 0, 1.5, 0.5, 0.5
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
-4.431426, 0.1415864, -6.276414, 0, -0.5, 0.5, 0.5,
-4.431426, 0.1415864, -6.276414, 1, -0.5, 0.5, 0.5,
-4.431426, 0.1415864, -6.276414, 1, 1.5, 0.5, 0.5,
-4.431426, 0.1415864, -6.276414, 0, 1.5, 0.5, 0.5
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
-4.431426, -3.621192, 0.1579633, 0, -0.5, 0.5, 0.5,
-4.431426, -3.621192, 0.1579633, 1, -0.5, 0.5, 0.5,
-4.431426, -3.621192, 0.1579633, 1, 1.5, 0.5, 0.5,
-4.431426, -3.621192, 0.1579633, 0, 1.5, 0.5, 0.5
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
-2, -2.752859, -4.791558,
4, -2.752859, -4.791558,
-2, -2.752859, -4.791558,
-2, -2.897581, -5.039034,
0, -2.752859, -4.791558,
0, -2.897581, -5.039034,
2, -2.752859, -4.791558,
2, -2.897581, -5.039034,
4, -2.752859, -4.791558,
4, -2.897581, -5.039034
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
"2",
"4"
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
-2, -3.187025, -5.533986, 0, -0.5, 0.5, 0.5,
-2, -3.187025, -5.533986, 1, -0.5, 0.5, 0.5,
-2, -3.187025, -5.533986, 1, 1.5, 0.5, 0.5,
-2, -3.187025, -5.533986, 0, 1.5, 0.5, 0.5,
0, -3.187025, -5.533986, 0, -0.5, 0.5, 0.5,
0, -3.187025, -5.533986, 1, -0.5, 0.5, 0.5,
0, -3.187025, -5.533986, 1, 1.5, 0.5, 0.5,
0, -3.187025, -5.533986, 0, 1.5, 0.5, 0.5,
2, -3.187025, -5.533986, 0, -0.5, 0.5, 0.5,
2, -3.187025, -5.533986, 1, -0.5, 0.5, 0.5,
2, -3.187025, -5.533986, 1, 1.5, 0.5, 0.5,
2, -3.187025, -5.533986, 0, 1.5, 0.5, 0.5,
4, -3.187025, -5.533986, 0, -0.5, 0.5, 0.5,
4, -3.187025, -5.533986, 1, -0.5, 0.5, 0.5,
4, -3.187025, -5.533986, 1, 1.5, 0.5, 0.5,
4, -3.187025, -5.533986, 0, 1.5, 0.5, 0.5
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
-3.314174, -2, -4.791558,
-3.314174, 2, -4.791558,
-3.314174, -2, -4.791558,
-3.500382, -2, -5.039034,
-3.314174, -1, -4.791558,
-3.500382, -1, -5.039034,
-3.314174, 0, -4.791558,
-3.500382, 0, -5.039034,
-3.314174, 1, -4.791558,
-3.500382, 1, -5.039034,
-3.314174, 2, -4.791558,
-3.500382, 2, -5.039034
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
-3.8728, -2, -5.533986, 0, -0.5, 0.5, 0.5,
-3.8728, -2, -5.533986, 1, -0.5, 0.5, 0.5,
-3.8728, -2, -5.533986, 1, 1.5, 0.5, 0.5,
-3.8728, -2, -5.533986, 0, 1.5, 0.5, 0.5,
-3.8728, -1, -5.533986, 0, -0.5, 0.5, 0.5,
-3.8728, -1, -5.533986, 1, -0.5, 0.5, 0.5,
-3.8728, -1, -5.533986, 1, 1.5, 0.5, 0.5,
-3.8728, -1, -5.533986, 0, 1.5, 0.5, 0.5,
-3.8728, 0, -5.533986, 0, -0.5, 0.5, 0.5,
-3.8728, 0, -5.533986, 1, -0.5, 0.5, 0.5,
-3.8728, 0, -5.533986, 1, 1.5, 0.5, 0.5,
-3.8728, 0, -5.533986, 0, 1.5, 0.5, 0.5,
-3.8728, 1, -5.533986, 0, -0.5, 0.5, 0.5,
-3.8728, 1, -5.533986, 1, -0.5, 0.5, 0.5,
-3.8728, 1, -5.533986, 1, 1.5, 0.5, 0.5,
-3.8728, 1, -5.533986, 0, 1.5, 0.5, 0.5,
-3.8728, 2, -5.533986, 0, -0.5, 0.5, 0.5,
-3.8728, 2, -5.533986, 1, -0.5, 0.5, 0.5,
-3.8728, 2, -5.533986, 1, 1.5, 0.5, 0.5,
-3.8728, 2, -5.533986, 0, 1.5, 0.5, 0.5
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
-3.314174, -2.752859, -4,
-3.314174, -2.752859, 4,
-3.314174, -2.752859, -4,
-3.500382, -2.897581, -4,
-3.314174, -2.752859, -2,
-3.500382, -2.897581, -2,
-3.314174, -2.752859, 0,
-3.500382, -2.897581, 0,
-3.314174, -2.752859, 2,
-3.500382, -2.897581, 2,
-3.314174, -2.752859, 4,
-3.500382, -2.897581, 4
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
-3.8728, -3.187025, -4, 0, -0.5, 0.5, 0.5,
-3.8728, -3.187025, -4, 1, -0.5, 0.5, 0.5,
-3.8728, -3.187025, -4, 1, 1.5, 0.5, 0.5,
-3.8728, -3.187025, -4, 0, 1.5, 0.5, 0.5,
-3.8728, -3.187025, -2, 0, -0.5, 0.5, 0.5,
-3.8728, -3.187025, -2, 1, -0.5, 0.5, 0.5,
-3.8728, -3.187025, -2, 1, 1.5, 0.5, 0.5,
-3.8728, -3.187025, -2, 0, 1.5, 0.5, 0.5,
-3.8728, -3.187025, 0, 0, -0.5, 0.5, 0.5,
-3.8728, -3.187025, 0, 1, -0.5, 0.5, 0.5,
-3.8728, -3.187025, 0, 1, 1.5, 0.5, 0.5,
-3.8728, -3.187025, 0, 0, 1.5, 0.5, 0.5,
-3.8728, -3.187025, 2, 0, -0.5, 0.5, 0.5,
-3.8728, -3.187025, 2, 1, -0.5, 0.5, 0.5,
-3.8728, -3.187025, 2, 1, 1.5, 0.5, 0.5,
-3.8728, -3.187025, 2, 0, 1.5, 0.5, 0.5,
-3.8728, -3.187025, 4, 0, -0.5, 0.5, 0.5,
-3.8728, -3.187025, 4, 1, -0.5, 0.5, 0.5,
-3.8728, -3.187025, 4, 1, 1.5, 0.5, 0.5,
-3.8728, -3.187025, 4, 0, 1.5, 0.5, 0.5
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
-3.314174, -2.752859, -4.791558,
-3.314174, 3.036031, -4.791558,
-3.314174, -2.752859, 5.107484,
-3.314174, 3.036031, 5.107484,
-3.314174, -2.752859, -4.791558,
-3.314174, -2.752859, 5.107484,
-3.314174, 3.036031, -4.791558,
-3.314174, 3.036031, 5.107484,
-3.314174, -2.752859, -4.791558,
4.134173, -2.752859, -4.791558,
-3.314174, -2.752859, 5.107484,
4.134173, -2.752859, 5.107484,
-3.314174, 3.036031, -4.791558,
4.134173, 3.036031, -4.791558,
-3.314174, 3.036031, 5.107484,
4.134173, 3.036031, 5.107484,
4.134173, -2.752859, -4.791558,
4.134173, 3.036031, -4.791558,
4.134173, -2.752859, 5.107484,
4.134173, 3.036031, 5.107484,
4.134173, -2.752859, -4.791558,
4.134173, -2.752859, 5.107484,
4.134173, 3.036031, -4.791558,
4.134173, 3.036031, 5.107484
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
var radius = 7.301687;
var distance = 32.48603;
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
mvMatrix.translate( -0.4099997, -0.1415864, -0.1579633 );
mvMatrix.scale( 1.05993, 1.363772, 0.7975243 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.48603);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
imazaquin<-read.table("imazaquin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazaquin$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazaquin' not found
```

```r
y<-imazaquin$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazaquin' not found
```

```r
z<-imazaquin$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazaquin' not found
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
-3.205703, 0.02609231, -0.2662871, 0, 0, 1, 1, 1,
-3.084594, 0.9663134, -0.9447864, 1, 0, 0, 1, 1,
-2.7375, -0.7582687, -2.103309, 1, 0, 0, 1, 1,
-2.678542, -0.6130958, -1.173909, 1, 0, 0, 1, 1,
-2.662265, 0.08741675, -2.015342, 1, 0, 0, 1, 1,
-2.540088, 0.1613463, -1.33354, 1, 0, 0, 1, 1,
-2.420769, -0.426471, -0.8672155, 0, 0, 0, 1, 1,
-2.417934, 0.05704652, -1.588651, 0, 0, 0, 1, 1,
-2.390479, 1.415122, 0.006260794, 0, 0, 0, 1, 1,
-2.381541, 0.3114125, -1.812832, 0, 0, 0, 1, 1,
-2.3291, -0.5168926, -3.595792, 0, 0, 0, 1, 1,
-2.321576, 0.4726534, -2.855172, 0, 0, 0, 1, 1,
-2.256882, -0.09549588, -2.003975, 0, 0, 0, 1, 1,
-2.242686, -0.4634567, -0.6307588, 1, 1, 1, 1, 1,
-2.238889, -0.02484718, -0.8022673, 1, 1, 1, 1, 1,
-2.192752, -1.148607, -3.566811, 1, 1, 1, 1, 1,
-2.165203, -0.8233112, -1.548152, 1, 1, 1, 1, 1,
-2.154397, -1.489252, -2.650351, 1, 1, 1, 1, 1,
-2.129785, -2.025444, -2.642846, 1, 1, 1, 1, 1,
-2.121768, -1.434296, -2.112535, 1, 1, 1, 1, 1,
-2.116641, 1.804996, -2.026729, 1, 1, 1, 1, 1,
-2.077267, -0.2642202, -2.61649, 1, 1, 1, 1, 1,
-2.065403, -0.269798, -0.6543154, 1, 1, 1, 1, 1,
-2.047367, -1.584039, -3.35858, 1, 1, 1, 1, 1,
-2.046669, 0.6236352, -2.044439, 1, 1, 1, 1, 1,
-2.030433, 1.664437, -2.329313, 1, 1, 1, 1, 1,
-2.017748, 1.082867, -1.420407, 1, 1, 1, 1, 1,
-2.011812, -0.27887, -3.398652, 1, 1, 1, 1, 1,
-1.966817, -0.7159299, -3.169838, 0, 0, 1, 1, 1,
-1.943737, -0.2338317, -1.830813, 1, 0, 0, 1, 1,
-1.931636, -1.000757, -1.920685, 1, 0, 0, 1, 1,
-1.890589, -0.7364404, -1.081517, 1, 0, 0, 1, 1,
-1.889349, 0.4449089, -1.831853, 1, 0, 0, 1, 1,
-1.850498, 0.5859106, 0.02537576, 1, 0, 0, 1, 1,
-1.844148, 0.5989695, 0.5457395, 0, 0, 0, 1, 1,
-1.836323, 0.5307376, -2.893176, 0, 0, 0, 1, 1,
-1.828378, 0.05793765, -0.9051785, 0, 0, 0, 1, 1,
-1.811286, -1.399825, -2.095456, 0, 0, 0, 1, 1,
-1.786174, 0.07432199, -2.821738, 0, 0, 0, 1, 1,
-1.775537, -0.6542529, -2.486275, 0, 0, 0, 1, 1,
-1.757744, 1.168623, -1.603097, 0, 0, 0, 1, 1,
-1.732183, 0.6572874, 0.4813593, 1, 1, 1, 1, 1,
-1.716614, -1.385606, -3.160056, 1, 1, 1, 1, 1,
-1.715544, -0.4861524, -1.727333, 1, 1, 1, 1, 1,
-1.700969, 0.4411818, -2.161563, 1, 1, 1, 1, 1,
-1.694905, -0.579294, -0.2311828, 1, 1, 1, 1, 1,
-1.693913, 0.500423, -1.874282, 1, 1, 1, 1, 1,
-1.67679, 0.9236427, -0.6681324, 1, 1, 1, 1, 1,
-1.670305, 0.24437, -1.016564, 1, 1, 1, 1, 1,
-1.668313, 0.7881463, -1.109907, 1, 1, 1, 1, 1,
-1.6682, -1.115807, -2.95154, 1, 1, 1, 1, 1,
-1.656329, 1.18686, -1.755566, 1, 1, 1, 1, 1,
-1.640933, 0.02723273, 0.2413256, 1, 1, 1, 1, 1,
-1.624874, 1.437786, -1.360044, 1, 1, 1, 1, 1,
-1.608824, 1.434915, -2.604563, 1, 1, 1, 1, 1,
-1.542018, -0.5280586, -2.355133, 1, 1, 1, 1, 1,
-1.538121, -2.569484, -2.718477, 0, 0, 1, 1, 1,
-1.523133, -0.6426426, -1.373807, 1, 0, 0, 1, 1,
-1.522873, 0.066982, -2.661381, 1, 0, 0, 1, 1,
-1.518238, 0.4918502, -0.7585211, 1, 0, 0, 1, 1,
-1.517268, -0.143882, -0.6115326, 1, 0, 0, 1, 1,
-1.503733, 0.4273014, 0.7029273, 1, 0, 0, 1, 1,
-1.496933, -0.3049437, -2.580135, 0, 0, 0, 1, 1,
-1.490872, -0.3195367, -2.067405, 0, 0, 0, 1, 1,
-1.481217, 1.20901, -0.8865442, 0, 0, 0, 1, 1,
-1.474763, 2.351252, 0.4552356, 0, 0, 0, 1, 1,
-1.469826, -2.077586, -3.83992, 0, 0, 0, 1, 1,
-1.450406, 0.2300815, -1.508046, 0, 0, 0, 1, 1,
-1.443605, -1.018519, -0.703397, 0, 0, 0, 1, 1,
-1.428336, 1.88562, -3.644509, 1, 1, 1, 1, 1,
-1.415589, 0.5383963, -1.134322, 1, 1, 1, 1, 1,
-1.409493, -1.019788, -1.814452, 1, 1, 1, 1, 1,
-1.406786, -0.1538813, -1.089836, 1, 1, 1, 1, 1,
-1.40109, 0.6985181, -0.7267619, 1, 1, 1, 1, 1,
-1.397038, -0.6304252, -1.964303, 1, 1, 1, 1, 1,
-1.395642, 0.2037812, 0.1488945, 1, 1, 1, 1, 1,
-1.394391, 0.6269589, -0.9638742, 1, 1, 1, 1, 1,
-1.394249, -1.699193, -1.183365, 1, 1, 1, 1, 1,
-1.391384, 0.008467941, -2.14424, 1, 1, 1, 1, 1,
-1.390838, -0.8370583, -2.565475, 1, 1, 1, 1, 1,
-1.389011, -1.237741, -1.029776, 1, 1, 1, 1, 1,
-1.388619, -0.7761129, -1.526078, 1, 1, 1, 1, 1,
-1.387152, -0.5766299, -1.958905, 1, 1, 1, 1, 1,
-1.385473, 1.608581, -1.492135, 1, 1, 1, 1, 1,
-1.382553, -0.2406191, -0.4632679, 0, 0, 1, 1, 1,
-1.37425, 1.167134, -0.4351777, 1, 0, 0, 1, 1,
-1.368915, 0.5909656, -1.39188, 1, 0, 0, 1, 1,
-1.365104, -1.911152, -2.661579, 1, 0, 0, 1, 1,
-1.360639, 0.5034316, -1.300371, 1, 0, 0, 1, 1,
-1.359965, 1.606255, -1.737045, 1, 0, 0, 1, 1,
-1.354679, 0.613751, -1.929972, 0, 0, 0, 1, 1,
-1.353396, -0.4537445, -1.647805, 0, 0, 0, 1, 1,
-1.353182, -1.034544, -1.318227, 0, 0, 0, 1, 1,
-1.351102, 1.752392, 0.4150059, 0, 0, 0, 1, 1,
-1.347723, -0.5542837, -1.537106, 0, 0, 0, 1, 1,
-1.342956, 0.2594824, -0.4280952, 0, 0, 0, 1, 1,
-1.337519, -0.08831404, -2.105767, 0, 0, 0, 1, 1,
-1.336853, -0.2934679, -0.9137942, 1, 1, 1, 1, 1,
-1.336013, 0.1798157, -2.964647, 1, 1, 1, 1, 1,
-1.335032, 0.7328213, 0.07684229, 1, 1, 1, 1, 1,
-1.33313, -0.0886751, -0.94003, 1, 1, 1, 1, 1,
-1.332519, 0.4309903, -0.7975833, 1, 1, 1, 1, 1,
-1.328887, -1.029452, -3.686126, 1, 1, 1, 1, 1,
-1.32809, 1.729776, -0.3207728, 1, 1, 1, 1, 1,
-1.326523, 1.246533, -0.5818661, 1, 1, 1, 1, 1,
-1.309461, 0.5740616, -0.1197019, 1, 1, 1, 1, 1,
-1.306461, 1.513319, -1.011614, 1, 1, 1, 1, 1,
-1.304777, 0.1662012, -1.440918, 1, 1, 1, 1, 1,
-1.299505, 0.9310071, -0.4877281, 1, 1, 1, 1, 1,
-1.295279, -0.1740539, -0.545431, 1, 1, 1, 1, 1,
-1.286044, 1.388767, -1.240521, 1, 1, 1, 1, 1,
-1.283047, 0.251032, -0.9886487, 1, 1, 1, 1, 1,
-1.281076, 0.4174973, -2.264221, 0, 0, 1, 1, 1,
-1.280086, 1.459961, 0.2640734, 1, 0, 0, 1, 1,
-1.27986, -0.9516434, -0.8199379, 1, 0, 0, 1, 1,
-1.272015, 0.2033591, -1.091892, 1, 0, 0, 1, 1,
-1.266464, -2.567904, -3.686896, 1, 0, 0, 1, 1,
-1.246732, 0.5950196, -1.628404, 1, 0, 0, 1, 1,
-1.243023, 0.9724994, -2.251, 0, 0, 0, 1, 1,
-1.242239, -1.812476, -2.31496, 0, 0, 0, 1, 1,
-1.230589, 0.8001848, -0.282062, 0, 0, 0, 1, 1,
-1.222025, -1.522051, -2.724952, 0, 0, 0, 1, 1,
-1.22192, 0.4904507, -0.1230486, 0, 0, 0, 1, 1,
-1.22184, -1.012872, -0.6615527, 0, 0, 0, 1, 1,
-1.211662, 0.6315001, -1.051651, 0, 0, 0, 1, 1,
-1.19942, -0.9823825, -1.889915, 1, 1, 1, 1, 1,
-1.197826, -0.2360498, -2.672161, 1, 1, 1, 1, 1,
-1.192324, 0.8997269, -0.3691644, 1, 1, 1, 1, 1,
-1.190377, -1.383308, -4.120288, 1, 1, 1, 1, 1,
-1.171947, 1.143583, -2.011581, 1, 1, 1, 1, 1,
-1.170421, 1.506706, -0.6853933, 1, 1, 1, 1, 1,
-1.162478, 0.474149, -0.7364769, 1, 1, 1, 1, 1,
-1.160686, 0.9128003, -2.176363, 1, 1, 1, 1, 1,
-1.151157, -0.8116298, -3.963191, 1, 1, 1, 1, 1,
-1.142812, 0.3014306, -0.5226135, 1, 1, 1, 1, 1,
-1.142126, -0.74863, -1.25823, 1, 1, 1, 1, 1,
-1.137401, -1.09865, -4.209952, 1, 1, 1, 1, 1,
-1.136929, -0.09702357, -2.209112, 1, 1, 1, 1, 1,
-1.133946, 0.05293772, -0.3442382, 1, 1, 1, 1, 1,
-1.131058, 0.3108846, -1.03536, 1, 1, 1, 1, 1,
-1.130723, 0.3829359, 0.03873212, 0, 0, 1, 1, 1,
-1.129983, 0.1060688, -2.077493, 1, 0, 0, 1, 1,
-1.126233, -0.9477158, -0.4584163, 1, 0, 0, 1, 1,
-1.123428, 0.9357163, -0.1249317, 1, 0, 0, 1, 1,
-1.109459, 0.3426456, -1.959424, 1, 0, 0, 1, 1,
-1.108326, 0.3490549, -1.041436, 1, 0, 0, 1, 1,
-1.104235, -2.113662, -2.194028, 0, 0, 0, 1, 1,
-1.102958, 0.3968915, -1.279377, 0, 0, 0, 1, 1,
-1.101267, -0.06881233, 0.318907, 0, 0, 0, 1, 1,
-1.099866, 0.1261173, -1.949243, 0, 0, 0, 1, 1,
-1.092268, 1.767934, -0.5975205, 0, 0, 0, 1, 1,
-1.087317, -0.1537193, -0.5820874, 0, 0, 0, 1, 1,
-1.084768, 0.6625473, -1.223363, 0, 0, 0, 1, 1,
-1.070895, 2.064203, 1.381753, 1, 1, 1, 1, 1,
-1.066889, -0.661335, -3.081473, 1, 1, 1, 1, 1,
-1.063079, 0.4176107, -0.2057648, 1, 1, 1, 1, 1,
-1.055776, -0.5297604, -3.092822, 1, 1, 1, 1, 1,
-1.055611, -0.3437985, -1.050758, 1, 1, 1, 1, 1,
-1.054888, 0.2431111, -3.028724, 1, 1, 1, 1, 1,
-1.053972, 1.783298, -1.446882, 1, 1, 1, 1, 1,
-1.050424, -0.1403413, -0.4084508, 1, 1, 1, 1, 1,
-1.048512, 1.013053, -1.378104, 1, 1, 1, 1, 1,
-1.046995, 1.921023, 0.2150168, 1, 1, 1, 1, 1,
-1.04403, -0.1434906, -1.200952, 1, 1, 1, 1, 1,
-1.039991, 0.7279546, 0.7391798, 1, 1, 1, 1, 1,
-1.038225, -1.739163, -2.646942, 1, 1, 1, 1, 1,
-1.035914, -0.6741771, -0.9622549, 1, 1, 1, 1, 1,
-1.03308, -1.335433, -3.021994, 1, 1, 1, 1, 1,
-1.032372, -0.9920375, -0.7102106, 0, 0, 1, 1, 1,
-1.025473, 1.411871, -0.5455722, 1, 0, 0, 1, 1,
-1.021065, -1.30067, -2.329726, 1, 0, 0, 1, 1,
-1.0186, 0.3868202, -2.900095, 1, 0, 0, 1, 1,
-1.014077, -0.05312762, -0.9713271, 1, 0, 0, 1, 1,
-1.00515, 0.7393854, -2.083218, 1, 0, 0, 1, 1,
-0.9870316, -0.618571, -2.412998, 0, 0, 0, 1, 1,
-0.9870013, -0.8567291, -3.969297, 0, 0, 0, 1, 1,
-0.9839813, 0.4839969, -0.9141136, 0, 0, 0, 1, 1,
-0.9813746, 0.1643915, -0.7808716, 0, 0, 0, 1, 1,
-0.9733052, 1.26359, -0.624698, 0, 0, 0, 1, 1,
-0.9665063, 0.6240467, 0.5748463, 0, 0, 0, 1, 1,
-0.9661191, -1.558407, -3.151406, 0, 0, 0, 1, 1,
-0.9617543, -0.7341336, -1.616033, 1, 1, 1, 1, 1,
-0.961564, -1.935644, -3.243915, 1, 1, 1, 1, 1,
-0.9612635, 1.003318, 0.5490234, 1, 1, 1, 1, 1,
-0.9594947, -0.6531787, -1.134151, 1, 1, 1, 1, 1,
-0.9530054, 1.038173, -0.3777504, 1, 1, 1, 1, 1,
-0.9518364, -2.054141, -2.090928, 1, 1, 1, 1, 1,
-0.9508836, -1.142481, -4.395246, 1, 1, 1, 1, 1,
-0.945314, 0.3211975, -0.4721673, 1, 1, 1, 1, 1,
-0.9431943, 0.7145085, -2.23167, 1, 1, 1, 1, 1,
-0.9384423, -0.1077696, -0.154201, 1, 1, 1, 1, 1,
-0.936884, -2.506417, -1.940645, 1, 1, 1, 1, 1,
-0.9345331, 1.752123, -0.5482779, 1, 1, 1, 1, 1,
-0.9239935, -2.278065, -2.406038, 1, 1, 1, 1, 1,
-0.9208856, -0.509174, -2.058081, 1, 1, 1, 1, 1,
-0.920047, -0.3223668, -1.393303, 1, 1, 1, 1, 1,
-0.9177344, -0.7025921, 0.06559134, 0, 0, 1, 1, 1,
-0.9160483, 0.03587988, -1.502347, 1, 0, 0, 1, 1,
-0.904901, -0.2523508, -1.368734, 1, 0, 0, 1, 1,
-0.900908, -1.493026, -2.763763, 1, 0, 0, 1, 1,
-0.8976766, 0.4207345, -1.896791, 1, 0, 0, 1, 1,
-0.8966609, -0.7189867, -1.254232, 1, 0, 0, 1, 1,
-0.8941927, 1.133417, -0.7197586, 0, 0, 0, 1, 1,
-0.8866304, -0.01332031, -1.555873, 0, 0, 0, 1, 1,
-0.8765316, -1.279747, -1.790266, 0, 0, 0, 1, 1,
-0.8639989, -0.9220965, -2.951532, 0, 0, 0, 1, 1,
-0.8610615, -0.5448227, -4.157879, 0, 0, 0, 1, 1,
-0.8529959, -1.159841, -1.290639, 0, 0, 0, 1, 1,
-0.8525136, -0.5355213, -0.9694217, 0, 0, 0, 1, 1,
-0.8520254, -1.076909, -3.066599, 1, 1, 1, 1, 1,
-0.8445206, 0.5775314, -1.625508, 1, 1, 1, 1, 1,
-0.8442382, 0.2681455, -3.399235, 1, 1, 1, 1, 1,
-0.8400621, -0.07448556, -0.8000416, 1, 1, 1, 1, 1,
-0.8356822, -0.8220291, -3.207759, 1, 1, 1, 1, 1,
-0.8347281, -1.569261, -4.311038, 1, 1, 1, 1, 1,
-0.8330411, -0.6578267, -1.710064, 1, 1, 1, 1, 1,
-0.8276501, -0.1487788, -2.712775, 1, 1, 1, 1, 1,
-0.8246715, -0.6773575, -1.876809, 1, 1, 1, 1, 1,
-0.8192289, -0.3772742, -3.226738, 1, 1, 1, 1, 1,
-0.8172486, 0.9199219, -1.95489, 1, 1, 1, 1, 1,
-0.8170312, -1.610155, -2.294349, 1, 1, 1, 1, 1,
-0.8129805, 0.8981671, 0.121777, 1, 1, 1, 1, 1,
-0.8054991, 1.155299, -0.5645085, 1, 1, 1, 1, 1,
-0.8031859, 1.003343, -1.467162, 1, 1, 1, 1, 1,
-0.800571, 0.460373, 0.6811653, 0, 0, 1, 1, 1,
-0.7897165, 0.03575463, -2.701931, 1, 0, 0, 1, 1,
-0.787763, -0.005769539, 0.6265208, 1, 0, 0, 1, 1,
-0.7875184, -0.358881, -0.5539553, 1, 0, 0, 1, 1,
-0.7853618, 1.752153, -1.052814, 1, 0, 0, 1, 1,
-0.7803796, 0.6181585, 0.04888293, 1, 0, 0, 1, 1,
-0.778533, 1.320269, -0.7668212, 0, 0, 0, 1, 1,
-0.7757362, -1.157461, -3.100271, 0, 0, 0, 1, 1,
-0.7721204, -1.494096, -2.966219, 0, 0, 0, 1, 1,
-0.7718605, -0.3453832, -3.334538, 0, 0, 0, 1, 1,
-0.7694486, 0.3978249, 0.4043716, 0, 0, 0, 1, 1,
-0.7628747, -0.9230441, -1.723386, 0, 0, 0, 1, 1,
-0.7525966, -0.4289202, -4.647397, 0, 0, 0, 1, 1,
-0.7501259, 0.08631096, -2.29648, 1, 1, 1, 1, 1,
-0.749909, 0.6168693, -1.347986, 1, 1, 1, 1, 1,
-0.7482801, -0.2820962, -1.690188, 1, 1, 1, 1, 1,
-0.7474687, -0.1499709, -0.9579489, 1, 1, 1, 1, 1,
-0.7425947, -0.2434531, -2.386337, 1, 1, 1, 1, 1,
-0.7400458, -0.4875465, -2.48564, 1, 1, 1, 1, 1,
-0.7382539, 0.9103972, -0.3304511, 1, 1, 1, 1, 1,
-0.7378218, -0.01435454, -1.755809, 1, 1, 1, 1, 1,
-0.7376969, 0.9443394, 0.03201429, 1, 1, 1, 1, 1,
-0.7367269, 0.3620351, 0.07960802, 1, 1, 1, 1, 1,
-0.7264857, 1.409477, -0.4831996, 1, 1, 1, 1, 1,
-0.7264712, -0.832288, -3.570251, 1, 1, 1, 1, 1,
-0.7242772, 1.168774, -0.4506471, 1, 1, 1, 1, 1,
-0.7217646, 0.03620685, -2.150558, 1, 1, 1, 1, 1,
-0.721046, -2.462323, -2.509186, 1, 1, 1, 1, 1,
-0.7190592, -0.4202156, -1.610872, 0, 0, 1, 1, 1,
-0.7120703, -1.063225, -2.895299, 1, 0, 0, 1, 1,
-0.7114931, 1.060555, -1.282916, 1, 0, 0, 1, 1,
-0.710712, 1.200644, 0.5690265, 1, 0, 0, 1, 1,
-0.7106742, 1.127677, -0.524236, 1, 0, 0, 1, 1,
-0.7064999, 0.9860122, 0.2745003, 1, 0, 0, 1, 1,
-0.7046869, -0.09740327, -1.103277, 0, 0, 0, 1, 1,
-0.6976378, 1.247781, 0.7780489, 0, 0, 0, 1, 1,
-0.6973851, -2.618959, -1.477056, 0, 0, 0, 1, 1,
-0.6944883, -0.2810822, -1.283794, 0, 0, 0, 1, 1,
-0.6927848, -0.62219, -3.416211, 0, 0, 0, 1, 1,
-0.6855835, -0.2042927, -2.510174, 0, 0, 0, 1, 1,
-0.6805747, -1.590314, -2.703308, 0, 0, 0, 1, 1,
-0.678565, -0.007225327, -1.529649, 1, 1, 1, 1, 1,
-0.6770106, 1.271091, -0.7270527, 1, 1, 1, 1, 1,
-0.6765658, 1.28067, 0.3660192, 1, 1, 1, 1, 1,
-0.6734447, 0.924215, -0.6282751, 1, 1, 1, 1, 1,
-0.6680491, -0.3978429, -2.735514, 1, 1, 1, 1, 1,
-0.6616151, -0.1412478, -2.653796, 1, 1, 1, 1, 1,
-0.6542404, -0.7114434, -3.830626, 1, 1, 1, 1, 1,
-0.6539143, -0.9252652, -2.26178, 1, 1, 1, 1, 1,
-0.6538356, 1.392794, -1.458764, 1, 1, 1, 1, 1,
-0.6512002, -0.3503145, -1.380387, 1, 1, 1, 1, 1,
-0.6510317, -0.7138914, -3.37731, 1, 1, 1, 1, 1,
-0.6474699, -0.9704471, -2.704254, 1, 1, 1, 1, 1,
-0.6441709, 0.6611557, -1.864429, 1, 1, 1, 1, 1,
-0.6429049, -1.379888, -1.174586, 1, 1, 1, 1, 1,
-0.6400427, 0.2232233, -1.026256, 1, 1, 1, 1, 1,
-0.6392224, -1.232095, -2.779497, 0, 0, 1, 1, 1,
-0.6312322, 0.5210771, -0.03410399, 1, 0, 0, 1, 1,
-0.6236884, 0.0568869, 0.781579, 1, 0, 0, 1, 1,
-0.6235377, -1.482301, -3.487504, 1, 0, 0, 1, 1,
-0.6203905, -0.8626773, -2.323255, 1, 0, 0, 1, 1,
-0.6186051, 2.116937, -0.2860715, 1, 0, 0, 1, 1,
-0.6164778, -0.4215876, -2.393248, 0, 0, 0, 1, 1,
-0.6114666, -0.09433828, -2.859832, 0, 0, 0, 1, 1,
-0.6083754, 0.05463256, -1.832, 0, 0, 0, 1, 1,
-0.5977795, 0.953426, -0.8757868, 0, 0, 0, 1, 1,
-0.5919102, 1.051062, 0.05784125, 0, 0, 0, 1, 1,
-0.5858498, 0.3298705, -0.0491093, 0, 0, 0, 1, 1,
-0.5850429, -0.5539809, -2.856321, 0, 0, 0, 1, 1,
-0.5744284, -0.8472107, -1.375906, 1, 1, 1, 1, 1,
-0.5738339, 0.8718497, -0.9790736, 1, 1, 1, 1, 1,
-0.5720382, 0.2926939, -0.7414697, 1, 1, 1, 1, 1,
-0.5714946, 0.2799397, -3.035259, 1, 1, 1, 1, 1,
-0.5666968, 1.097417, 0.7133614, 1, 1, 1, 1, 1,
-0.5663539, 0.8061699, 0.7412313, 1, 1, 1, 1, 1,
-0.561717, 2.265456, -0.4859675, 1, 1, 1, 1, 1,
-0.5516853, -0.4292335, -1.600004, 1, 1, 1, 1, 1,
-0.5498549, 0.1506758, -2.23843, 1, 1, 1, 1, 1,
-0.549596, 0.6606911, -0.5741583, 1, 1, 1, 1, 1,
-0.5460664, 0.6734589, -1.694019, 1, 1, 1, 1, 1,
-0.5436631, -0.8931586, -2.895034, 1, 1, 1, 1, 1,
-0.5387512, -0.9195719, -3.720037, 1, 1, 1, 1, 1,
-0.5330839, 1.00976, -0.1360014, 1, 1, 1, 1, 1,
-0.531377, 1.160264, -0.1108755, 1, 1, 1, 1, 1,
-0.5300215, 0.6301646, -0.3019556, 0, 0, 1, 1, 1,
-0.5277992, -1.238392, -2.38483, 1, 0, 0, 1, 1,
-0.5271604, 1.965621, -1.664337, 1, 0, 0, 1, 1,
-0.5269488, 1.312536, -1.628381, 1, 0, 0, 1, 1,
-0.524067, 1.672528, -0.8275375, 1, 0, 0, 1, 1,
-0.5238095, -0.7387089, -3.157301, 1, 0, 0, 1, 1,
-0.5192214, -0.2318642, -2.196409, 0, 0, 0, 1, 1,
-0.5127671, 0.7855723, 0.2975905, 0, 0, 0, 1, 1,
-0.5127578, 1.379771, -0.2215015, 0, 0, 0, 1, 1,
-0.5096034, 0.3359986, -1.19072, 0, 0, 0, 1, 1,
-0.5034269, -0.1981649, -2.120063, 0, 0, 0, 1, 1,
-0.502667, 0.8283642, -0.3359801, 0, 0, 0, 1, 1,
-0.5000567, 1.223316, 0.4523727, 0, 0, 0, 1, 1,
-0.4993489, -0.09843956, 0.6368566, 1, 1, 1, 1, 1,
-0.4989725, -1.17626, -1.768481, 1, 1, 1, 1, 1,
-0.4984761, 0.3568212, -0.7427298, 1, 1, 1, 1, 1,
-0.4983204, -0.570875, -2.631626, 1, 1, 1, 1, 1,
-0.4965279, -1.505715, -4.621783, 1, 1, 1, 1, 1,
-0.4943193, -0.4396896, -2.078403, 1, 1, 1, 1, 1,
-0.4939162, -1.264879, -4.139222, 1, 1, 1, 1, 1,
-0.4924488, -0.2620504, -1.520468, 1, 1, 1, 1, 1,
-0.4903025, 0.5677923, -0.7294391, 1, 1, 1, 1, 1,
-0.4882458, 0.9284102, -0.3468454, 1, 1, 1, 1, 1,
-0.4881152, -0.3839049, -3.916562, 1, 1, 1, 1, 1,
-0.4858343, 0.1729003, 1.037897, 1, 1, 1, 1, 1,
-0.4826165, -1.544883, -1.861986, 1, 1, 1, 1, 1,
-0.4757187, -0.1891879, -1.158177, 1, 1, 1, 1, 1,
-0.4712439, 1.957816, -1.453807, 1, 1, 1, 1, 1,
-0.4684196, -0.3840398, -2.345377, 0, 0, 1, 1, 1,
-0.465037, -0.5569279, -0.6772132, 1, 0, 0, 1, 1,
-0.4646896, -1.042452, -2.366482, 1, 0, 0, 1, 1,
-0.4562861, 0.3325108, -1.228988, 1, 0, 0, 1, 1,
-0.4482411, -1.38814, -1.492766, 1, 0, 0, 1, 1,
-0.4480309, 1.474651, 0.1214995, 1, 0, 0, 1, 1,
-0.4457938, -0.9903202, -3.186892, 0, 0, 0, 1, 1,
-0.44175, -1.658148, -4.549553, 0, 0, 0, 1, 1,
-0.4394533, -0.6877487, -2.317634, 0, 0, 0, 1, 1,
-0.439309, 1.197775, 1.272579, 0, 0, 0, 1, 1,
-0.4377368, -1.174151, -4.267468, 0, 0, 0, 1, 1,
-0.4363291, -0.5082198, -0.4498849, 0, 0, 0, 1, 1,
-0.4327949, -2.527667, -2.626235, 0, 0, 0, 1, 1,
-0.430679, -2.02095, -2.981311, 1, 1, 1, 1, 1,
-0.42896, -1.215675, -3.773212, 1, 1, 1, 1, 1,
-0.4211557, -0.04603152, -2.991605, 1, 1, 1, 1, 1,
-0.4202447, -1.179626, -2.358016, 1, 1, 1, 1, 1,
-0.4190472, -0.6662284, -0.5167727, 1, 1, 1, 1, 1,
-0.4184646, 2.252342, -0.607919, 1, 1, 1, 1, 1,
-0.4166031, -0.4056765, -2.763201, 1, 1, 1, 1, 1,
-0.4127108, -0.1657822, -2.576037, 1, 1, 1, 1, 1,
-0.4082728, -0.03596853, 0.1554793, 1, 1, 1, 1, 1,
-0.4045293, -0.9139689, -2.616089, 1, 1, 1, 1, 1,
-0.402459, 2.857803, 0.1626463, 1, 1, 1, 1, 1,
-0.3980307, -0.1493575, -0.2848128, 1, 1, 1, 1, 1,
-0.3915777, -0.2357042, -2.957109, 1, 1, 1, 1, 1,
-0.3860127, 0.4874761, -0.7546587, 1, 1, 1, 1, 1,
-0.3794636, -1.435349, -1.709085, 1, 1, 1, 1, 1,
-0.3791752, -0.5271686, -2.801773, 0, 0, 1, 1, 1,
-0.3788296, -0.1861636, -2.137085, 1, 0, 0, 1, 1,
-0.3751903, -0.8541404, -3.222725, 1, 0, 0, 1, 1,
-0.3749892, 0.6362104, -1.066443, 1, 0, 0, 1, 1,
-0.374533, -1.650833, -3.445024, 1, 0, 0, 1, 1,
-0.365701, -0.7910435, -3.177032, 1, 0, 0, 1, 1,
-0.3654271, -0.2054504, -1.258701, 0, 0, 0, 1, 1,
-0.3650823, -0.206598, -3.377362, 0, 0, 0, 1, 1,
-0.3641209, 0.458534, 0.1988346, 0, 0, 0, 1, 1,
-0.3628795, 0.1533026, 0.0296994, 0, 0, 0, 1, 1,
-0.3624845, -0.9539649, -2.749108, 0, 0, 0, 1, 1,
-0.3607471, 0.5154041, -0.9136497, 0, 0, 0, 1, 1,
-0.3582395, -0.500482, -1.842505, 0, 0, 0, 1, 1,
-0.3551179, 0.3217075, -2.622667, 1, 1, 1, 1, 1,
-0.3544329, -0.0904912, -1.494612, 1, 1, 1, 1, 1,
-0.3540336, 1.906782, -2.343178, 1, 1, 1, 1, 1,
-0.3483843, -0.5812308, -2.870965, 1, 1, 1, 1, 1,
-0.3474218, -0.5420533, -3.900638, 1, 1, 1, 1, 1,
-0.3456649, -0.1130955, -0.9905909, 1, 1, 1, 1, 1,
-0.3406154, -0.6651516, -1.886496, 1, 1, 1, 1, 1,
-0.3361242, 1.036674, -1.454016, 1, 1, 1, 1, 1,
-0.3293273, -1.195047, -3.939185, 1, 1, 1, 1, 1,
-0.327222, 0.3476481, -1.038343, 1, 1, 1, 1, 1,
-0.3236055, 1.218136, 0.4725237, 1, 1, 1, 1, 1,
-0.318641, 0.8482483, -0.6152226, 1, 1, 1, 1, 1,
-0.3108678, 0.2205803, -1.324886, 1, 1, 1, 1, 1,
-0.3086794, -0.05925949, -1.742987, 1, 1, 1, 1, 1,
-0.3069933, 1.640381, 1.010503, 1, 1, 1, 1, 1,
-0.3066625, 0.7593039, -1.38826, 0, 0, 1, 1, 1,
-0.3056959, 0.06204218, -2.313987, 1, 0, 0, 1, 1,
-0.3055234, -0.3222013, -2.806288, 1, 0, 0, 1, 1,
-0.305163, -0.7260314, -2.488221, 1, 0, 0, 1, 1,
-0.3026987, 0.1696334, -1.756177, 1, 0, 0, 1, 1,
-0.2998374, -0.9409714, -1.92709, 1, 0, 0, 1, 1,
-0.2921613, -0.6514181, -4.203682, 0, 0, 0, 1, 1,
-0.279417, -2.56771, -3.367606, 0, 0, 0, 1, 1,
-0.2785913, 1.150509, -1.29355, 0, 0, 0, 1, 1,
-0.2768101, -1.880289, -1.906827, 0, 0, 0, 1, 1,
-0.2764641, 1.864161, -0.5603412, 0, 0, 0, 1, 1,
-0.2737603, 0.4475407, 0.5889857, 0, 0, 0, 1, 1,
-0.2729186, -0.3125338, -1.612388, 0, 0, 0, 1, 1,
-0.2719845, -2.301013, -3.082791, 1, 1, 1, 1, 1,
-0.2703408, 0.5075083, 0.04714422, 1, 1, 1, 1, 1,
-0.2645781, 0.748228, -0.1571204, 1, 1, 1, 1, 1,
-0.2613319, 0.01262887, -2.185514, 1, 1, 1, 1, 1,
-0.245993, -1.303275, -3.512614, 1, 1, 1, 1, 1,
-0.2421965, -0.2873019, -2.831412, 1, 1, 1, 1, 1,
-0.2419025, -2.00524, -2.426454, 1, 1, 1, 1, 1,
-0.2384887, 0.8616835, -1.011639, 1, 1, 1, 1, 1,
-0.237908, 1.118265, 0.481869, 1, 1, 1, 1, 1,
-0.2378216, 0.04349614, -1.982231, 1, 1, 1, 1, 1,
-0.2355365, 0.06009958, -1.8424, 1, 1, 1, 1, 1,
-0.2335177, 0.4625194, -3.157973, 1, 1, 1, 1, 1,
-0.2296669, 0.6599598, 1.082725, 1, 1, 1, 1, 1,
-0.22892, 0.8085165, 0.8682538, 1, 1, 1, 1, 1,
-0.2283639, -0.8867866, -1.489903, 1, 1, 1, 1, 1,
-0.2244661, -0.3069037, -2.415016, 0, 0, 1, 1, 1,
-0.2216764, 0.8648411, -0.07340918, 1, 0, 0, 1, 1,
-0.2194085, -0.2666568, -1.277462, 1, 0, 0, 1, 1,
-0.2176072, 0.9450553, -0.3514284, 1, 0, 0, 1, 1,
-0.2174811, -0.08726419, -2.257613, 1, 0, 0, 1, 1,
-0.2145632, 0.738497, -1.728861, 1, 0, 0, 1, 1,
-0.2141515, -1.33467, -2.788805, 0, 0, 0, 1, 1,
-0.2099676, 0.4972708, -0.6137831, 0, 0, 0, 1, 1,
-0.2080706, 1.256261, 0.7597658, 0, 0, 0, 1, 1,
-0.2051762, -1.706788, -1.328862, 0, 0, 0, 1, 1,
-0.2048369, -0.8169535, -3.648134, 0, 0, 0, 1, 1,
-0.2035103, -0.8314384, -1.688936, 0, 0, 0, 1, 1,
-0.2009828, 0.9916589, -0.4969555, 0, 0, 0, 1, 1,
-0.1950961, 0.5052124, -0.6294852, 1, 1, 1, 1, 1,
-0.194223, 0.8540125, -0.6817915, 1, 1, 1, 1, 1,
-0.1922107, 0.1035989, -1.098, 1, 1, 1, 1, 1,
-0.1833223, 0.1253925, -1.313035, 1, 1, 1, 1, 1,
-0.1759323, -0.3931275, -2.674437, 1, 1, 1, 1, 1,
-0.1733104, -1.045745, -2.488749, 1, 1, 1, 1, 1,
-0.172951, -0.6214113, -1.471395, 1, 1, 1, 1, 1,
-0.1728823, 1.594449, -0.002831596, 1, 1, 1, 1, 1,
-0.1701909, -0.09623725, -3.83326, 1, 1, 1, 1, 1,
-0.1667888, -1.985058, -2.493225, 1, 1, 1, 1, 1,
-0.1664316, -0.9957774, -1.650097, 1, 1, 1, 1, 1,
-0.1664235, -0.2527113, -2.391082, 1, 1, 1, 1, 1,
-0.1661189, -1.894973, -1.065272, 1, 1, 1, 1, 1,
-0.1651907, -0.6938894, -2.433256, 1, 1, 1, 1, 1,
-0.164259, -0.917811, -2.622386, 1, 1, 1, 1, 1,
-0.1634382, 0.4640456, -1.448072, 0, 0, 1, 1, 1,
-0.1619168, 2.168324, -0.3367363, 1, 0, 0, 1, 1,
-0.1617334, 1.358913, -1.816713, 1, 0, 0, 1, 1,
-0.1490244, -0.2906809, -2.946535, 1, 0, 0, 1, 1,
-0.1464953, -0.5314257, -2.319696, 1, 0, 0, 1, 1,
-0.1452603, -1.446517, -1.121639, 1, 0, 0, 1, 1,
-0.139313, -0.0009800537, -3.582339, 0, 0, 0, 1, 1,
-0.1358301, -0.1129094, -1.573011, 0, 0, 0, 1, 1,
-0.1324764, -1.37328, -1.965141, 0, 0, 0, 1, 1,
-0.1302673, -0.4213269, -2.5734, 0, 0, 0, 1, 1,
-0.1208255, 0.6020827, 0.09838714, 0, 0, 0, 1, 1,
-0.1191585, -0.3442056, -1.52385, 0, 0, 0, 1, 1,
-0.1123923, -0.007112549, -2.241426, 0, 0, 0, 1, 1,
-0.1070574, -0.423276, -0.262538, 1, 1, 1, 1, 1,
-0.1064343, -0.9746206, -1.004719, 1, 1, 1, 1, 1,
-0.1041499, 1.342514, 1.030241, 1, 1, 1, 1, 1,
-0.1005717, 0.9843509, -0.9360111, 1, 1, 1, 1, 1,
-0.09739417, -0.8273138, -2.382771, 1, 1, 1, 1, 1,
-0.09555057, 0.1290876, -1.671167, 1, 1, 1, 1, 1,
-0.09237652, 0.7310986, -0.6265861, 1, 1, 1, 1, 1,
-0.09091999, -0.1803246, -1.917311, 1, 1, 1, 1, 1,
-0.08754735, -1.712155, -2.433641, 1, 1, 1, 1, 1,
-0.08644111, -0.481108, -2.739186, 1, 1, 1, 1, 1,
-0.0815161, -0.1886492, -3.53711, 1, 1, 1, 1, 1,
-0.07904802, 1.072914, 0.4370788, 1, 1, 1, 1, 1,
-0.07803825, 0.4671407, -0.03943765, 1, 1, 1, 1, 1,
-0.0765949, 0.6563675, 0.6829234, 1, 1, 1, 1, 1,
-0.07423423, -0.373707, -1.959828, 1, 1, 1, 1, 1,
-0.07009321, -0.4492226, -3.105977, 0, 0, 1, 1, 1,
-0.06453869, 1.464738, 0.01420022, 1, 0, 0, 1, 1,
-0.06194315, -1.151167, -2.599186, 1, 0, 0, 1, 1,
-0.05884248, 0.9062157, 1.158816, 1, 0, 0, 1, 1,
-0.05860374, -1.047406, -3.20816, 1, 0, 0, 1, 1,
-0.05661789, -2.241459, -3.036725, 1, 0, 0, 1, 1,
-0.0542446, 0.3294711, -0.905049, 0, 0, 0, 1, 1,
-0.05373504, -0.1691423, -3.623825, 0, 0, 0, 1, 1,
-0.05106692, -1.476011, -3.606484, 0, 0, 0, 1, 1,
-0.04923512, 1.750328, -0.6434005, 0, 0, 0, 1, 1,
-0.04877792, -0.543, -2.939705, 0, 0, 0, 1, 1,
-0.04278922, 1.716668, 0.4512188, 0, 0, 0, 1, 1,
-0.04130469, -2.171049, -1.947998, 0, 0, 0, 1, 1,
-0.03509666, 2.262633, -1.368129, 1, 1, 1, 1, 1,
-0.03293078, -0.6423644, -3.340196, 1, 1, 1, 1, 1,
-0.03163967, -0.2831176, -0.5213498, 1, 1, 1, 1, 1,
-0.03119206, 1.086497, -0.506227, 1, 1, 1, 1, 1,
-0.02841607, 1.336324, 0.7258688, 1, 1, 1, 1, 1,
-0.02815227, 0.3688681, -0.1844677, 1, 1, 1, 1, 1,
-0.02617939, -0.06894695, -4.587533, 1, 1, 1, 1, 1,
-0.0234367, -0.5340641, -4.389463, 1, 1, 1, 1, 1,
-0.02065437, -0.8557134, -4.528144, 1, 1, 1, 1, 1,
-0.01631158, 0.5284525, -0.7116714, 1, 1, 1, 1, 1,
-0.01619881, 0.5285254, 0.07046376, 1, 1, 1, 1, 1,
-0.01594223, 0.8348292, 0.03019596, 1, 1, 1, 1, 1,
-0.01312834, -2.619577, -3.527829, 1, 1, 1, 1, 1,
-0.004545068, 0.6923652, 0.2255792, 1, 1, 1, 1, 1,
-0.0007977112, 0.1020308, 2.253592, 1, 1, 1, 1, 1,
-0.0002504277, 0.3295799, -0.5892938, 0, 0, 1, 1, 1,
-0.0001177161, 0.3219773, -0.5343988, 1, 0, 0, 1, 1,
0.001651886, 0.6663511, -0.9487284, 1, 0, 0, 1, 1,
0.004681073, -0.4413424, 3.846643, 1, 0, 0, 1, 1,
0.004758721, -0.78003, 2.46655, 1, 0, 0, 1, 1,
0.009009483, 0.9699708, 2.54428, 1, 0, 0, 1, 1,
0.009595147, -1.427472, 2.034206, 0, 0, 0, 1, 1,
0.01084185, 0.5693967, 0.8886671, 0, 0, 0, 1, 1,
0.0115931, -1.57338, 3.190685, 0, 0, 0, 1, 1,
0.01360007, 0.6014957, -1.233377, 0, 0, 0, 1, 1,
0.01427805, -0.4333235, 3.330376, 0, 0, 0, 1, 1,
0.01928907, -0.6311364, 3.432844, 0, 0, 0, 1, 1,
0.02122737, -1.052294, 3.341514, 0, 0, 0, 1, 1,
0.04326169, 0.8231196, 0.7088708, 1, 1, 1, 1, 1,
0.04439897, -0.7114955, 3.10783, 1, 1, 1, 1, 1,
0.05432149, -0.02571064, 0.9690925, 1, 1, 1, 1, 1,
0.05608289, -0.5068342, 4.017665, 1, 1, 1, 1, 1,
0.060532, 0.6771596, -1.171953, 1, 1, 1, 1, 1,
0.0612941, 0.8553293, 0.6533996, 1, 1, 1, 1, 1,
0.06134533, -0.2908145, 1.138159, 1, 1, 1, 1, 1,
0.06459918, 0.2629479, 0.4164992, 1, 1, 1, 1, 1,
0.06513593, 1.98015, 0.8313808, 1, 1, 1, 1, 1,
0.06515817, 0.3181061, -0.9894879, 1, 1, 1, 1, 1,
0.06968886, -0.4328409, 3.796463, 1, 1, 1, 1, 1,
0.0714349, 0.6366531, 0.5780334, 1, 1, 1, 1, 1,
0.07421293, 1.251447, 0.1152513, 1, 1, 1, 1, 1,
0.0767419, 1.603711, -0.6827005, 1, 1, 1, 1, 1,
0.0823104, -0.1346156, -0.0967656, 1, 1, 1, 1, 1,
0.08526042, -1.269435, 2.358548, 0, 0, 1, 1, 1,
0.08676462, 0.7807015, -1.116366, 1, 0, 0, 1, 1,
0.08847584, -0.3491754, 1.025752, 1, 0, 0, 1, 1,
0.09337617, 2.204832, 0.3986554, 1, 0, 0, 1, 1,
0.09567658, -1.772082, 2.712528, 1, 0, 0, 1, 1,
0.09621217, 0.2641547, 0.8343974, 1, 0, 0, 1, 1,
0.09661797, -0.9081725, 3.830858, 0, 0, 0, 1, 1,
0.1030789, 0.5278999, 1.32234, 0, 0, 0, 1, 1,
0.1126845, 2.470773, -3.530258, 0, 0, 0, 1, 1,
0.1149524, -0.1296709, 3.140064, 0, 0, 0, 1, 1,
0.1221834, 0.7050557, 0.5501615, 0, 0, 0, 1, 1,
0.1331093, -0.8116894, 3.812719, 0, 0, 0, 1, 1,
0.1357898, -1.920614, 3.028839, 0, 0, 0, 1, 1,
0.1377976, 2.951727, -1.304178, 1, 1, 1, 1, 1,
0.1476761, 0.5708237, 0.7915624, 1, 1, 1, 1, 1,
0.152149, -0.0722124, 2.805322, 1, 1, 1, 1, 1,
0.1548118, 0.6076191, 1.217918, 1, 1, 1, 1, 1,
0.1578365, 0.2504722, -0.6842015, 1, 1, 1, 1, 1,
0.157992, 0.03675523, -0.127109, 1, 1, 1, 1, 1,
0.1582255, -1.165498, 3.707291, 1, 1, 1, 1, 1,
0.159848, -1.634797, 2.173004, 1, 1, 1, 1, 1,
0.1620862, -0.9633256, 4.252572, 1, 1, 1, 1, 1,
0.1625032, -0.8461125, 2.760759, 1, 1, 1, 1, 1,
0.1680016, 0.9631836, 1.823076, 1, 1, 1, 1, 1,
0.1692344, -0.6407738, 3.50689, 1, 1, 1, 1, 1,
0.172686, 0.09980149, 1.668212, 1, 1, 1, 1, 1,
0.1757526, 0.1388603, 2.125904, 1, 1, 1, 1, 1,
0.1787669, 1.685116, 0.2236332, 1, 1, 1, 1, 1,
0.1809885, -2.557729, 4.296518, 0, 0, 1, 1, 1,
0.1816632, -0.6485529, 3.551681, 1, 0, 0, 1, 1,
0.186134, 0.1488451, -1.534157, 1, 0, 0, 1, 1,
0.1861983, -1.969161, 3.225349, 1, 0, 0, 1, 1,
0.1907839, -0.4300979, 2.316213, 1, 0, 0, 1, 1,
0.194948, 1.386088, -0.4230902, 1, 0, 0, 1, 1,
0.1970605, -1.663049, 3.051777, 0, 0, 0, 1, 1,
0.1980684, -1.025207, 3.782021, 0, 0, 0, 1, 1,
0.2014114, -0.9710318, 0.9423839, 0, 0, 0, 1, 1,
0.2073719, 0.06379281, 1.074164, 0, 0, 0, 1, 1,
0.2089523, -0.9250761, 4.018453, 0, 0, 0, 1, 1,
0.2153922, 0.2905107, 0.9476897, 0, 0, 0, 1, 1,
0.21622, 0.6542243, 2.229901, 0, 0, 0, 1, 1,
0.2198759, -0.4859631, 1.190079, 1, 1, 1, 1, 1,
0.2227087, -0.5088574, 2.683003, 1, 1, 1, 1, 1,
0.2227388, 1.280378, -1.072277, 1, 1, 1, 1, 1,
0.2255175, -1.234325, 2.486892, 1, 1, 1, 1, 1,
0.2273119, -1.555627, 2.550525, 1, 1, 1, 1, 1,
0.2276008, 0.2490874, 1.72921, 1, 1, 1, 1, 1,
0.2364321, -0.3765774, 2.475706, 1, 1, 1, 1, 1,
0.2410432, -1.152524, 4.624454, 1, 1, 1, 1, 1,
0.2431005, 0.2131677, 3.109834, 1, 1, 1, 1, 1,
0.2443585, 0.9868405, 2.58649, 1, 1, 1, 1, 1,
0.2453152, -0.561573, 2.744703, 1, 1, 1, 1, 1,
0.2459647, -0.9051544, 1.374621, 1, 1, 1, 1, 1,
0.2489483, 0.5825797, 0.1083817, 1, 1, 1, 1, 1,
0.2564378, -0.1550921, 0.3319029, 1, 1, 1, 1, 1,
0.2577271, -0.5673627, 2.069461, 1, 1, 1, 1, 1,
0.2580244, -1.765653, 0.7974594, 0, 0, 1, 1, 1,
0.2614916, -0.01116769, 0.6372211, 1, 0, 0, 1, 1,
0.2661068, -0.4107814, 4.00678, 1, 0, 0, 1, 1,
0.2743637, 0.3282725, 0.8741652, 1, 0, 0, 1, 1,
0.2788996, -0.6757053, 2.617057, 1, 0, 0, 1, 1,
0.2791947, 1.080849, 1.372671, 1, 0, 0, 1, 1,
0.2792098, 0.519398, 0.9882334, 0, 0, 0, 1, 1,
0.2792626, 1.060829, -0.7033861, 0, 0, 0, 1, 1,
0.2817764, -1.611062, 3.568043, 0, 0, 0, 1, 1,
0.2883443, 2.542515, 0.8355189, 0, 0, 0, 1, 1,
0.2907631, 0.2375769, 2.239515, 0, 0, 0, 1, 1,
0.2917151, -0.425471, 2.646183, 0, 0, 0, 1, 1,
0.2920105, 0.2563714, -0.3393296, 0, 0, 0, 1, 1,
0.2932777, -0.06610126, 0.4603241, 1, 1, 1, 1, 1,
0.2962046, -0.2045538, 2.814265, 1, 1, 1, 1, 1,
0.2963023, 0.1287249, 1.260027, 1, 1, 1, 1, 1,
0.2966058, -0.5220008, 2.097674, 1, 1, 1, 1, 1,
0.3010469, 2.821194, -0.7427088, 1, 1, 1, 1, 1,
0.3021226, 0.4367302, -0.06986187, 1, 1, 1, 1, 1,
0.3025618, -1.105882, 4.735579, 1, 1, 1, 1, 1,
0.3044452, 0.9316013, 1.682961, 1, 1, 1, 1, 1,
0.3180586, 0.2232465, 1.854208, 1, 1, 1, 1, 1,
0.3193212, -0.7888315, 2.792004, 1, 1, 1, 1, 1,
0.3199464, 0.6037532, 0.9921441, 1, 1, 1, 1, 1,
0.3208944, 2.035743, 1.443234, 1, 1, 1, 1, 1,
0.3217414, 1.637282, 1.439862, 1, 1, 1, 1, 1,
0.3232403, 0.2766402, 0.5496625, 1, 1, 1, 1, 1,
0.332543, 0.947573, 0.9930055, 1, 1, 1, 1, 1,
0.3344552, -0.2201933, 1.895178, 0, 0, 1, 1, 1,
0.3345914, 0.4713201, -0.3335108, 1, 0, 0, 1, 1,
0.3410774, -1.366964, 2.327682, 1, 0, 0, 1, 1,
0.3468286, -0.9811442, 1.539807, 1, 0, 0, 1, 1,
0.3468319, -1.375718, 4.321735, 1, 0, 0, 1, 1,
0.34753, -0.7039781, 2.525108, 1, 0, 0, 1, 1,
0.3523344, -1.165396, 3.5339, 0, 0, 0, 1, 1,
0.3560897, 0.5414918, -0.1602016, 0, 0, 0, 1, 1,
0.3567195, 1.022407, -0.3662014, 0, 0, 0, 1, 1,
0.3582401, 0.3689379, 1.40725, 0, 0, 0, 1, 1,
0.366432, -0.4922118, 3.399125, 0, 0, 0, 1, 1,
0.367657, 0.5071689, -0.164923, 0, 0, 0, 1, 1,
0.3699123, 1.522704, 0.9736151, 0, 0, 0, 1, 1,
0.3728002, 1.515756, -0.1107465, 1, 1, 1, 1, 1,
0.3769597, 0.7591258, -0.6531835, 1, 1, 1, 1, 1,
0.3774261, -1.033767, 1.077386, 1, 1, 1, 1, 1,
0.3818575, -0.730262, 1.814443, 1, 1, 1, 1, 1,
0.3846144, 1.63679, 0.9476246, 1, 1, 1, 1, 1,
0.3871295, 0.2035988, 0.925157, 1, 1, 1, 1, 1,
0.3877442, -0.7368365, 2.623105, 1, 1, 1, 1, 1,
0.3879265, 1.527733, 2.438026, 1, 1, 1, 1, 1,
0.3881622, -0.5625967, 2.57648, 1, 1, 1, 1, 1,
0.3894354, -0.4464512, 2.623025, 1, 1, 1, 1, 1,
0.3902506, -0.3717719, 2.81628, 1, 1, 1, 1, 1,
0.3928033, 1.473914, 1.081762, 1, 1, 1, 1, 1,
0.3974347, -1.02117, 3.313777, 1, 1, 1, 1, 1,
0.397697, -0.6004415, 1.001664, 1, 1, 1, 1, 1,
0.3992022, 0.6262212, 0.1458117, 1, 1, 1, 1, 1,
0.399411, -0.6707458, 2.457953, 0, 0, 1, 1, 1,
0.3998192, 1.49153, -1.245351, 1, 0, 0, 1, 1,
0.4012522, 0.7438107, 0.6653063, 1, 0, 0, 1, 1,
0.4028637, 0.3634213, 1.073736, 1, 0, 0, 1, 1,
0.4037203, -1.819796, 4.963324, 1, 0, 0, 1, 1,
0.4038976, -0.7903811, 1.775366, 1, 0, 0, 1, 1,
0.4173903, 0.9990132, 1.93103, 0, 0, 0, 1, 1,
0.4205028, -0.1165343, 1.707611, 0, 0, 0, 1, 1,
0.4243923, 0.2954901, 1.711691, 0, 0, 0, 1, 1,
0.4255148, -0.07816347, 2.029681, 0, 0, 0, 1, 1,
0.4280924, -0.5093515, 2.395044, 0, 0, 0, 1, 1,
0.4313908, 0.4667804, 0.1816729, 0, 0, 0, 1, 1,
0.4318457, -0.8628609, 4.039078, 0, 0, 0, 1, 1,
0.4356599, -1.097334, 2.031604, 1, 1, 1, 1, 1,
0.4361221, -0.1541131, 1.897625, 1, 1, 1, 1, 1,
0.4424556, -0.5514837, 4.239474, 1, 1, 1, 1, 1,
0.4446796, 0.009354847, 1.358868, 1, 1, 1, 1, 1,
0.4456701, -0.3287122, 3.821473, 1, 1, 1, 1, 1,
0.4456981, 0.332565, 0.3506658, 1, 1, 1, 1, 1,
0.4457093, 0.01624385, 1.793877, 1, 1, 1, 1, 1,
0.4468298, 1.573471, 0.448947, 1, 1, 1, 1, 1,
0.4494955, -1.234083, 2.019305, 1, 1, 1, 1, 1,
0.4609898, -0.6902702, 0.4677876, 1, 1, 1, 1, 1,
0.4642545, 1.904177, -0.6674192, 1, 1, 1, 1, 1,
0.4721054, -0.3719437, 3.293736, 1, 1, 1, 1, 1,
0.474267, -0.007311831, 2.995341, 1, 1, 1, 1, 1,
0.4773537, 1.282959, 0.6914382, 1, 1, 1, 1, 1,
0.4781517, -1.032672, 2.308201, 1, 1, 1, 1, 1,
0.4822215, 1.251006, -1.125502, 0, 0, 1, 1, 1,
0.4829998, 2.203147, 1.148407, 1, 0, 0, 1, 1,
0.4897614, -1.06141, 2.27879, 1, 0, 0, 1, 1,
0.4909867, -1.610229, 3.57047, 1, 0, 0, 1, 1,
0.494205, 0.6711036, 1.011061, 1, 0, 0, 1, 1,
0.5030627, -1.250577, 3.978643, 1, 0, 0, 1, 1,
0.5044303, 1.118621, -0.6531407, 0, 0, 0, 1, 1,
0.5060096, -0.9929444, 1.644, 0, 0, 0, 1, 1,
0.5070914, 0.2615113, 0.6745473, 0, 0, 0, 1, 1,
0.5083781, -1.253462, 2.295872, 0, 0, 0, 1, 1,
0.5090978, 0.658787, -0.1296235, 0, 0, 0, 1, 1,
0.5111303, 0.7504783, -0.8484711, 0, 0, 0, 1, 1,
0.5138035, 0.597643, -1.42014, 0, 0, 0, 1, 1,
0.5144095, 0.3206348, 0.1308099, 1, 1, 1, 1, 1,
0.5165824, -0.2692375, 2.460568, 1, 1, 1, 1, 1,
0.5289728, -0.7125207, 2.956945, 1, 1, 1, 1, 1,
0.5304416, 0.6614491, 1.47098, 1, 1, 1, 1, 1,
0.5307216, -0.6318504, 2.163678, 1, 1, 1, 1, 1,
0.5309939, 0.4133272, -1.43228, 1, 1, 1, 1, 1,
0.5361837, -1.596091, 2.105176, 1, 1, 1, 1, 1,
0.5372989, -1.185037, 1.107116, 1, 1, 1, 1, 1,
0.5460437, 1.785369, 1.798466, 1, 1, 1, 1, 1,
0.5475265, -0.9332574, 2.362894, 1, 1, 1, 1, 1,
0.5483979, -0.6300132, 3.214127, 1, 1, 1, 1, 1,
0.5486175, -2.511454, 1.228754, 1, 1, 1, 1, 1,
0.5509037, -0.9574571, 1.695018, 1, 1, 1, 1, 1,
0.5515956, -1.259418, 1.604215, 1, 1, 1, 1, 1,
0.5529702, 0.2678398, 1.258938, 1, 1, 1, 1, 1,
0.5542464, 1.219075, -0.2756507, 0, 0, 1, 1, 1,
0.5591145, 1.271804, 4.241706, 1, 0, 0, 1, 1,
0.5613537, -0.156676, 0.4278001, 1, 0, 0, 1, 1,
0.564062, 1.098268, -0.3214401, 1, 0, 0, 1, 1,
0.5672376, -1.902102, 3.373186, 1, 0, 0, 1, 1,
0.5675662, -0.8630868, 2.139366, 1, 0, 0, 1, 1,
0.5817764, 0.4291117, 0.8738933, 0, 0, 0, 1, 1,
0.5881054, -0.0003732946, 1.090497, 0, 0, 0, 1, 1,
0.5891243, -0.431453, 3.448251, 0, 0, 0, 1, 1,
0.5922965, 0.5971314, 0.8402796, 0, 0, 0, 1, 1,
0.5952044, -0.1392928, 1.533502, 0, 0, 0, 1, 1,
0.5979252, -0.9593938, 3.312699, 0, 0, 0, 1, 1,
0.5988251, 1.595644, -0.902557, 0, 0, 0, 1, 1,
0.5992674, -0.6968685, 3.094114, 1, 1, 1, 1, 1,
0.5996583, 0.05457069, 0.9603059, 1, 1, 1, 1, 1,
0.6033283, -1.740587, 3.177513, 1, 1, 1, 1, 1,
0.6063344, -0.1356429, 2.823524, 1, 1, 1, 1, 1,
0.6071045, -0.1041086, 1.392063, 1, 1, 1, 1, 1,
0.6092398, -2.378622, 1.523026, 1, 1, 1, 1, 1,
0.6164539, -0.09049607, 0.678009, 1, 1, 1, 1, 1,
0.6203547, -0.3078643, 1.570184, 1, 1, 1, 1, 1,
0.6212626, -0.251163, 0.7905962, 1, 1, 1, 1, 1,
0.6238052, -0.324141, 1.251278, 1, 1, 1, 1, 1,
0.6252885, -1.039844, 3.633041, 1, 1, 1, 1, 1,
0.6305302, 0.3500834, -0.4846771, 1, 1, 1, 1, 1,
0.6334563, 1.540652, -1.127576, 1, 1, 1, 1, 1,
0.633687, 0.4165791, 1.400604, 1, 1, 1, 1, 1,
0.6359391, 1.034611, -0.781049, 1, 1, 1, 1, 1,
0.6387194, -0.4104706, 0.235663, 0, 0, 1, 1, 1,
0.6390489, 1.532942, -0.06214476, 1, 0, 0, 1, 1,
0.6443398, 0.4969676, -0.0158957, 1, 0, 0, 1, 1,
0.648039, -0.8702849, 0.9832402, 1, 0, 0, 1, 1,
0.6513526, 0.4887517, 1.442106, 1, 0, 0, 1, 1,
0.6526561, -0.5342612, 4.038116, 1, 0, 0, 1, 1,
0.6545229, 1.303378, 0.01570036, 0, 0, 0, 1, 1,
0.6568993, 1.663034, 0.9769422, 0, 0, 0, 1, 1,
0.6599496, -0.4099534, 2.327214, 0, 0, 0, 1, 1,
0.6655319, -0.4740293, 2.312165, 0, 0, 0, 1, 1,
0.6663249, -0.5026976, 1.589586, 0, 0, 0, 1, 1,
0.667165, 0.5469559, -1.794103, 0, 0, 0, 1, 1,
0.6693346, -0.434259, 2.362819, 0, 0, 0, 1, 1,
0.6736724, -0.3179528, 0.3661066, 1, 1, 1, 1, 1,
0.6751778, 1.493668, 0.8438337, 1, 1, 1, 1, 1,
0.6777434, 0.4714766, 1.09768, 1, 1, 1, 1, 1,
0.6778668, 1.365254, -1.467713, 1, 1, 1, 1, 1,
0.6788414, 0.6932536, -0.4843392, 1, 1, 1, 1, 1,
0.6858538, -0.304511, 1.611083, 1, 1, 1, 1, 1,
0.6872092, 0.2627041, 0.4161685, 1, 1, 1, 1, 1,
0.6900237, -1.629019, 2.573664, 1, 1, 1, 1, 1,
0.6912794, -0.4190554, 4.143372, 1, 1, 1, 1, 1,
0.6918447, 0.7647728, 0.1716028, 1, 1, 1, 1, 1,
0.693076, -0.01656704, 0.5271392, 1, 1, 1, 1, 1,
0.6952546, -1.459581, 3.184699, 1, 1, 1, 1, 1,
0.6989596, 1.169155, 1.509318, 1, 1, 1, 1, 1,
0.6997661, -0.4722922, 3.544208, 1, 1, 1, 1, 1,
0.703437, -0.1255063, 1.142218, 1, 1, 1, 1, 1,
0.7047822, -0.9384406, 2.992849, 0, 0, 1, 1, 1,
0.7057319, 0.01178509, 0.9093315, 1, 0, 0, 1, 1,
0.7070459, -0.2742819, 1.13806, 1, 0, 0, 1, 1,
0.7071956, 0.7327928, 1.339193, 1, 0, 0, 1, 1,
0.7085448, 0.2603191, 0.7153357, 1, 0, 0, 1, 1,
0.7168649, 0.004850134, 2.162308, 1, 0, 0, 1, 1,
0.717921, 0.5766876, 1.913999, 0, 0, 0, 1, 1,
0.7266171, -0.7442836, 2.634488, 0, 0, 0, 1, 1,
0.7267658, 1.493396, -0.714009, 0, 0, 0, 1, 1,
0.7301412, -0.4548177, 2.421704, 0, 0, 0, 1, 1,
0.7462188, -1.367812, 2.145736, 0, 0, 0, 1, 1,
0.7515584, -0.2381224, 1.532243, 0, 0, 0, 1, 1,
0.7524898, -1.618341, 1.074953, 0, 0, 0, 1, 1,
0.7596077, -0.01052861, 2.140565, 1, 1, 1, 1, 1,
0.7604142, -0.001762085, 0.8057195, 1, 1, 1, 1, 1,
0.7751494, -0.8979387, 3.002339, 1, 1, 1, 1, 1,
0.7753556, -1.397785, 2.76548, 1, 1, 1, 1, 1,
0.775491, -1.145925, 1.821791, 1, 1, 1, 1, 1,
0.7767974, 0.4559212, 0.3372308, 1, 1, 1, 1, 1,
0.7777255, -2.03474, 2.112621, 1, 1, 1, 1, 1,
0.7811524, -0.6954082, 1.7116, 1, 1, 1, 1, 1,
0.7814137, -1.233637, 3.220267, 1, 1, 1, 1, 1,
0.7833452, -0.19062, 1.478037, 1, 1, 1, 1, 1,
0.7842942, 1.046566, 1.987267, 1, 1, 1, 1, 1,
0.7854662, 2.773857, 0.3331768, 1, 1, 1, 1, 1,
0.7883571, -1.634739, 0.8821423, 1, 1, 1, 1, 1,
0.7892513, 0.5729568, 1.054442, 1, 1, 1, 1, 1,
0.7892984, 1.105012, 1.483996, 1, 1, 1, 1, 1,
0.7901706, 0.2017313, 0.8435189, 0, 0, 1, 1, 1,
0.7956323, -0.02335415, 2.730214, 1, 0, 0, 1, 1,
0.7981707, 0.1211788, 0.5303365, 1, 0, 0, 1, 1,
0.8071617, 1.464337, -0.3233958, 1, 0, 0, 1, 1,
0.8145655, 0.8456856, 1.189785, 1, 0, 0, 1, 1,
0.8149405, -0.402058, 0.4750904, 1, 0, 0, 1, 1,
0.817805, 0.1835855, 1.462818, 0, 0, 0, 1, 1,
0.820682, 1.102784, -0.5829011, 0, 0, 0, 1, 1,
0.8215009, -0.1959736, 2.313073, 0, 0, 0, 1, 1,
0.8225151, -0.1810305, 0.9409356, 0, 0, 0, 1, 1,
0.823312, -0.8252389, 2.517822, 0, 0, 0, 1, 1,
0.8330879, 0.9820821, 0.506667, 0, 0, 0, 1, 1,
0.8362495, -0.6884874, 2.50524, 0, 0, 0, 1, 1,
0.8396888, 0.09569399, 1.231875, 1, 1, 1, 1, 1,
0.8496494, 1.637329, 0.815221, 1, 1, 1, 1, 1,
0.8500412, 0.2462361, 2.500741, 1, 1, 1, 1, 1,
0.8522889, -0.2012062, 2.461491, 1, 1, 1, 1, 1,
0.8543552, 1.442291, 1.106449, 1, 1, 1, 1, 1,
0.8556451, -1.995566, 1.821347, 1, 1, 1, 1, 1,
0.8616652, -1.361119, 1.681438, 1, 1, 1, 1, 1,
0.8656822, -0.5060961, 2.750581, 1, 1, 1, 1, 1,
0.8659498, -0.8712185, 0.02087363, 1, 1, 1, 1, 1,
0.8681896, -2.118373, 3.678532, 1, 1, 1, 1, 1,
0.8720758, 0.1080458, 1.065351, 1, 1, 1, 1, 1,
0.8721189, 1.069832, 0.6656803, 1, 1, 1, 1, 1,
0.8730902, 0.6863527, 1.539119, 1, 1, 1, 1, 1,
0.8745964, 1.090698, 0.5816747, 1, 1, 1, 1, 1,
0.8844618, -0.0842424, 2.233419, 1, 1, 1, 1, 1,
0.8856986, -0.3402693, 2.690152, 0, 0, 1, 1, 1,
0.8885241, -0.2200547, 0.3043148, 1, 0, 0, 1, 1,
0.9005117, -0.282007, 1.131003, 1, 0, 0, 1, 1,
0.9036168, 0.2723313, 1.717193, 1, 0, 0, 1, 1,
0.9039283, -1.31051, 3.054048, 1, 0, 0, 1, 1,
0.9041155, 0.041081, -0.5458733, 1, 0, 0, 1, 1,
0.905331, -0.08646356, 3.072243, 0, 0, 0, 1, 1,
0.9054217, 0.8148503, 0.1308372, 0, 0, 0, 1, 1,
0.9102669, -0.8386677, 2.840249, 0, 0, 0, 1, 1,
0.9143854, 0.6369368, 1.824531, 0, 0, 0, 1, 1,
0.9149937, 0.7354244, 1.213415, 0, 0, 0, 1, 1,
0.9253027, -1.749657, 4.284318, 0, 0, 0, 1, 1,
0.9281614, -1.516083, 2.19535, 0, 0, 0, 1, 1,
0.9357358, -0.4552179, 2.651183, 1, 1, 1, 1, 1,
0.9436851, 0.1983832, 1.718462, 1, 1, 1, 1, 1,
0.9500338, 0.4214935, 1.161084, 1, 1, 1, 1, 1,
0.9534587, 0.8582196, 1.3943, 1, 1, 1, 1, 1,
0.9571624, 0.2565803, -0.3487383, 1, 1, 1, 1, 1,
0.9586653, -1.172247, 2.136532, 1, 1, 1, 1, 1,
0.9594628, -0.564512, 2.453667, 1, 1, 1, 1, 1,
0.9691603, 0.3241572, 2.047693, 1, 1, 1, 1, 1,
0.9701217, -1.675317, 1.22289, 1, 1, 1, 1, 1,
0.9858087, 0.7699518, 0.6748849, 1, 1, 1, 1, 1,
0.9903704, -2.632475, 3.753516, 1, 1, 1, 1, 1,
0.9912838, -1.844931, 0.9899929, 1, 1, 1, 1, 1,
0.9960938, -1.189033, 2.805367, 1, 1, 1, 1, 1,
1.000001, 0.4869132, 1.108838, 1, 1, 1, 1, 1,
1.002621, 1.110553, -0.8699501, 1, 1, 1, 1, 1,
1.004502, -0.04903248, 1.198224, 0, 0, 1, 1, 1,
1.006322, -1.098482, 3.791402, 1, 0, 0, 1, 1,
1.016769, 1.028427, -0.6342534, 1, 0, 0, 1, 1,
1.024007, 0.4648258, 0.9988704, 1, 0, 0, 1, 1,
1.028551, -0.2855837, 1.944621, 1, 0, 0, 1, 1,
1.049362, -2.153637, 1.485825, 1, 0, 0, 1, 1,
1.058472, -1.932893, 2.018312, 0, 0, 0, 1, 1,
1.0651, 0.4704826, -0.1669805, 0, 0, 0, 1, 1,
1.070516, -0.4144853, 2.133736, 0, 0, 0, 1, 1,
1.074644, 1.813971, 0.1353135, 0, 0, 0, 1, 1,
1.076125, -0.004660347, 2.417144, 0, 0, 0, 1, 1,
1.084425, -0.01623056, 3.101021, 0, 0, 0, 1, 1,
1.090352, 0.2980073, 1.502074, 0, 0, 0, 1, 1,
1.094818, -0.2039802, 3.362321, 1, 1, 1, 1, 1,
1.110475, -0.9454062, 2.558177, 1, 1, 1, 1, 1,
1.115476, -0.5318137, 0.8031272, 1, 1, 1, 1, 1,
1.119952, 0.4157404, 0.3829446, 1, 1, 1, 1, 1,
1.125923, 0.1536805, 2.128271, 1, 1, 1, 1, 1,
1.128412, -0.3555726, 2.477864, 1, 1, 1, 1, 1,
1.129549, 1.247907, -0.439934, 1, 1, 1, 1, 1,
1.131665, -0.2052515, 1.833683, 1, 1, 1, 1, 1,
1.132361, -0.3608484, 2.313554, 1, 1, 1, 1, 1,
1.139802, 0.07237989, 1.377123, 1, 1, 1, 1, 1,
1.14039, -1.633894, 2.482013, 1, 1, 1, 1, 1,
1.142083, 0.04288606, 2.764655, 1, 1, 1, 1, 1,
1.151389, 1.333242, 0.664493, 1, 1, 1, 1, 1,
1.151974, -1.08514, 2.898975, 1, 1, 1, 1, 1,
1.152472, -0.1202, 0.6246464, 1, 1, 1, 1, 1,
1.159849, 0.6294881, -0.1044879, 0, 0, 1, 1, 1,
1.160647, 0.7101222, 1.994786, 1, 0, 0, 1, 1,
1.162046, 1.681659, 0.497423, 1, 0, 0, 1, 1,
1.164286, -0.4373492, 1.78293, 1, 0, 0, 1, 1,
1.165129, -0.7308534, 0.5818859, 1, 0, 0, 1, 1,
1.171458, -1.785847, 3.378498, 1, 0, 0, 1, 1,
1.175417, 0.8887234, -0.5097499, 0, 0, 0, 1, 1,
1.177115, 1.864132, -0.1752938, 0, 0, 0, 1, 1,
1.178059, 0.3542592, 1.232379, 0, 0, 0, 1, 1,
1.183217, 0.8660892, 0.4448322, 0, 0, 0, 1, 1,
1.184684, -0.2502747, 2.778968, 0, 0, 0, 1, 1,
1.186188, -0.5738663, 2.389636, 0, 0, 0, 1, 1,
1.186535, 0.9831604, -0.002831774, 0, 0, 0, 1, 1,
1.189445, -0.1016746, 1.659915, 1, 1, 1, 1, 1,
1.192336, -0.06837433, 1.756439, 1, 1, 1, 1, 1,
1.194005, -0.4255474, 0.8852389, 1, 1, 1, 1, 1,
1.202691, 1.029215, 1.404047, 1, 1, 1, 1, 1,
1.225651, 0.1453039, 1.150352, 1, 1, 1, 1, 1,
1.232205, 0.6661753, -1.098753, 1, 1, 1, 1, 1,
1.237007, 2.300482, 1.177809, 1, 1, 1, 1, 1,
1.247638, 1.596636, 0.609241, 1, 1, 1, 1, 1,
1.250785, 0.007950415, 1.369622, 1, 1, 1, 1, 1,
1.25334, -0.1306609, 2.404589, 1, 1, 1, 1, 1,
1.263711, 1.989688, 2.779561, 1, 1, 1, 1, 1,
1.274161, -0.8641494, 3.284637, 1, 1, 1, 1, 1,
1.279343, 0.02287114, 2.187235, 1, 1, 1, 1, 1,
1.280574, -1.014905, 1.317635, 1, 1, 1, 1, 1,
1.281139, 0.2983224, 1.383961, 1, 1, 1, 1, 1,
1.285141, 1.040556, 0.0855864, 0, 0, 1, 1, 1,
1.293269, -1.310832, 2.427429, 1, 0, 0, 1, 1,
1.29607, -1.12385, 3.58816, 1, 0, 0, 1, 1,
1.29851, -2.668554, 4.004719, 1, 0, 0, 1, 1,
1.298546, -0.9796472, 2.24911, 1, 0, 0, 1, 1,
1.313863, -0.06381053, 2.523826, 1, 0, 0, 1, 1,
1.32201, 1.800022, -0.4592191, 0, 0, 0, 1, 1,
1.327007, -0.7039975, 3.519256, 0, 0, 0, 1, 1,
1.327464, 0.0541111, 1.545187, 0, 0, 0, 1, 1,
1.332774, 1.370826, 1.448888, 0, 0, 0, 1, 1,
1.334212, -0.1902948, 2.540057, 0, 0, 0, 1, 1,
1.344157, -1.505128, 1.878482, 0, 0, 0, 1, 1,
1.354343, -1.793504, 3.779469, 0, 0, 0, 1, 1,
1.357692, 1.47909, 0.3117723, 1, 1, 1, 1, 1,
1.358867, 0.5117677, 2.123518, 1, 1, 1, 1, 1,
1.362277, 0.1961039, 1.056067, 1, 1, 1, 1, 1,
1.367643, 1.04776, 2.408493, 1, 1, 1, 1, 1,
1.3682, -0.3585699, 1.53324, 1, 1, 1, 1, 1,
1.375858, -0.574253, 1.853643, 1, 1, 1, 1, 1,
1.376314, -0.004875282, 1.917531, 1, 1, 1, 1, 1,
1.378193, -0.6971051, 2.065123, 1, 1, 1, 1, 1,
1.378399, 0.521565, 2.579263, 1, 1, 1, 1, 1,
1.427904, -1.157312, 2.863841, 1, 1, 1, 1, 1,
1.427982, 1.044413, 0.619907, 1, 1, 1, 1, 1,
1.435964, -0.08074637, 0.5223835, 1, 1, 1, 1, 1,
1.447317, 1.577616, 0.6836819, 1, 1, 1, 1, 1,
1.450238, -1.512497, 1.339235, 1, 1, 1, 1, 1,
1.451108, -0.5589961, 2.161354, 1, 1, 1, 1, 1,
1.455221, -0.340295, 2.227435, 0, 0, 1, 1, 1,
1.458723, 0.5981073, 3.142614, 1, 0, 0, 1, 1,
1.46538, 2.071217, 0.9373935, 1, 0, 0, 1, 1,
1.475174, -1.05545, 0.8393111, 1, 0, 0, 1, 1,
1.477524, -0.9683217, 2.156619, 1, 0, 0, 1, 1,
1.494799, 0.5840601, 0.4926295, 1, 0, 0, 1, 1,
1.496856, -0.5308007, 0.510749, 0, 0, 0, 1, 1,
1.4969, -0.1603633, 0.1920417, 0, 0, 0, 1, 1,
1.498181, -0.3043627, 3.315939, 0, 0, 0, 1, 1,
1.503696, -0.01877879, 1.17746, 0, 0, 0, 1, 1,
1.524066, 0.1219372, 2.642986, 0, 0, 0, 1, 1,
1.524272, 0.7260758, 2.272472, 0, 0, 0, 1, 1,
1.52869, 0.7014232, 2.592228, 0, 0, 0, 1, 1,
1.53521, -0.493131, 1.174828, 1, 1, 1, 1, 1,
1.547463, -1.07778, 2.693612, 1, 1, 1, 1, 1,
1.554847, 0.7316262, 2.193321, 1, 1, 1, 1, 1,
1.556909, -1.054381, 1.466155, 1, 1, 1, 1, 1,
1.558623, 2.601827, 0.6393464, 1, 1, 1, 1, 1,
1.563886, -0.4583878, 2.288248, 1, 1, 1, 1, 1,
1.579285, -0.5507228, 3.674663, 1, 1, 1, 1, 1,
1.57972, -0.4442458, 2.153493, 1, 1, 1, 1, 1,
1.585398, -1.541849, 2.417549, 1, 1, 1, 1, 1,
1.590396, -1.660365, 2.451766, 1, 1, 1, 1, 1,
1.591126, 0.07632031, 1.745858, 1, 1, 1, 1, 1,
1.594617, -0.6187502, 1.360157, 1, 1, 1, 1, 1,
1.599344, 0.04449894, 1.766088, 1, 1, 1, 1, 1,
1.604002, 1.732534, 1.528638, 1, 1, 1, 1, 1,
1.60876, -1.336514, 1.155923, 1, 1, 1, 1, 1,
1.612541, -0.4814786, 1.40435, 0, 0, 1, 1, 1,
1.614313, 0.7795885, 0.2972872, 1, 0, 0, 1, 1,
1.61905, -0.368132, 1.58689, 1, 0, 0, 1, 1,
1.622623, 0.721008, -0.3830557, 1, 0, 0, 1, 1,
1.625892, 1.153414, 1.608174, 1, 0, 0, 1, 1,
1.644004, -1.019764, 3.493806, 1, 0, 0, 1, 1,
1.650416, -0.1499503, 1.257097, 0, 0, 0, 1, 1,
1.680985, 0.3604796, 2.600868, 0, 0, 0, 1, 1,
1.681528, 2.621139, -0.2934536, 0, 0, 0, 1, 1,
1.682932, 0.4957169, -0.5222723, 0, 0, 0, 1, 1,
1.706954, -0.6176295, 1.984905, 0, 0, 0, 1, 1,
1.710218, -2.163136, 3.876277, 0, 0, 0, 1, 1,
1.719912, -1.735924, 0.7109281, 0, 0, 0, 1, 1,
1.73323, -0.4768127, 3.096919, 1, 1, 1, 1, 1,
1.743934, 1.790732, 2.790625, 1, 1, 1, 1, 1,
1.768813, 2.497206, -0.04020368, 1, 1, 1, 1, 1,
1.783827, 0.3883436, 2.197013, 1, 1, 1, 1, 1,
1.801488, 0.8186601, 1.58088, 1, 1, 1, 1, 1,
1.80985, -1.060576, 1.329452, 1, 1, 1, 1, 1,
1.81049, -0.4297316, 0.7210557, 1, 1, 1, 1, 1,
1.82481, -0.3318883, 1.121116, 1, 1, 1, 1, 1,
1.851417, 0.1994379, 1.310626, 1, 1, 1, 1, 1,
1.87253, -1.243009, 1.70958, 1, 1, 1, 1, 1,
1.87381, -1.002022, 2.356741, 1, 1, 1, 1, 1,
1.890909, 0.1236346, 2.1909, 1, 1, 1, 1, 1,
1.93736, -0.1038302, 2.581088, 1, 1, 1, 1, 1,
1.948346, -1.127859, 0.07777945, 1, 1, 1, 1, 1,
1.970319, -0.5764858, 2.1843, 1, 1, 1, 1, 1,
1.973836, -1.177864, -0.5711682, 0, 0, 1, 1, 1,
1.991946, 0.5434664, 0.004472536, 1, 0, 0, 1, 1,
2.004803, -0.9569825, 2.085089, 1, 0, 0, 1, 1,
2.064499, 0.3242691, 0.2640232, 1, 0, 0, 1, 1,
2.081158, -1.535158, 2.97177, 1, 0, 0, 1, 1,
2.133084, 2.003554, 1.163332, 1, 0, 0, 1, 1,
2.134176, -0.6809934, 1.911774, 0, 0, 0, 1, 1,
2.144949, 0.09103318, 2.745831, 0, 0, 0, 1, 1,
2.149837, -0.8282544, 1.844153, 0, 0, 0, 1, 1,
2.224189, -1.240152, 2.754223, 0, 0, 0, 1, 1,
2.244415, -0.2537111, 1.969271, 0, 0, 0, 1, 1,
2.259975, -0.6754265, 3.694874, 0, 0, 0, 1, 1,
2.45944, 0.8982728, 1.219378, 0, 0, 0, 1, 1,
2.514251, -1.042028, 2.745266, 1, 1, 1, 1, 1,
2.672659, 0.7788991, 0.3154609, 1, 1, 1, 1, 1,
2.727573, 1.761989, 2.686882, 1, 1, 1, 1, 1,
2.959349, -1.998579, 2.92199, 1, 1, 1, 1, 1,
3.232085, -1.398628, 1.783619, 1, 1, 1, 1, 1,
3.828468, 0.2505238, -0.1667549, 1, 1, 1, 1, 1,
4.025702, -0.6792414, 0.6030053, 1, 1, 1, 1, 1
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
var radius = 9.171922;
var distance = 32.21599;
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
mvMatrix.translate( -0.4099996, -0.1415864, -0.1579633 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.21599);
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