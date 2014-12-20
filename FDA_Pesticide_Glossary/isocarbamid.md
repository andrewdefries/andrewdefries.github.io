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
-3.146375, -0.5162023, -2.053633, 1, 0, 0, 1,
-2.781384, -0.9628069, -1.831228, 1, 0.007843138, 0, 1,
-2.659519, -0.9354793, -2.507839, 1, 0.01176471, 0, 1,
-2.557819, -0.9170992, -0.3856227, 1, 0.01960784, 0, 1,
-2.491, -1.601353, -3.507029, 1, 0.02352941, 0, 1,
-2.421087, -1.010998, -1.457871, 1, 0.03137255, 0, 1,
-2.370209, -0.6560892, -3.351099, 1, 0.03529412, 0, 1,
-2.34121, 0.8455486, -1.330943, 1, 0.04313726, 0, 1,
-2.324736, -0.5932409, -2.330698, 1, 0.04705882, 0, 1,
-2.259847, 0.9501222, -1.483608, 1, 0.05490196, 0, 1,
-2.251399, 0.4439976, -0.2417903, 1, 0.05882353, 0, 1,
-2.216326, 1.045665, -0.6079859, 1, 0.06666667, 0, 1,
-2.196171, -0.1556579, -1.13998, 1, 0.07058824, 0, 1,
-2.17973, 0.7594215, -0.7189618, 1, 0.07843138, 0, 1,
-2.163353, 0.3430409, -0.3049794, 1, 0.08235294, 0, 1,
-2.142131, 0.5885754, -1.023648, 1, 0.09019608, 0, 1,
-2.113587, 0.8397607, -1.007104, 1, 0.09411765, 0, 1,
-2.106589, -1.098734, -2.96309, 1, 0.1019608, 0, 1,
-2.088997, 1.470983, -1.384897, 1, 0.1098039, 0, 1,
-2.078911, 0.3222321, -0.8346601, 1, 0.1137255, 0, 1,
-2.061942, -1.268468, -3.048634, 1, 0.1215686, 0, 1,
-2.031249, 0.2159399, -1.30921, 1, 0.1254902, 0, 1,
-2.031051, -0.314668, -0.8768511, 1, 0.1333333, 0, 1,
-2.023124, -0.6844015, -1.258859, 1, 0.1372549, 0, 1,
-1.994619, 0.6180287, -1.626888, 1, 0.145098, 0, 1,
-1.993954, 0.4909771, -1.369258, 1, 0.1490196, 0, 1,
-1.992862, -1.235879, -1.886783, 1, 0.1568628, 0, 1,
-1.990373, 0.5815044, -1.365109, 1, 0.1607843, 0, 1,
-1.985993, 1.276865, -0.45325, 1, 0.1686275, 0, 1,
-1.969715, 1.290536, -1.926031, 1, 0.172549, 0, 1,
-1.96017, 0.03073836, -0.3599727, 1, 0.1803922, 0, 1,
-1.948665, 0.5398185, -0.8347204, 1, 0.1843137, 0, 1,
-1.937956, 1.275324, -0.5801492, 1, 0.1921569, 0, 1,
-1.910499, 0.7707214, -1.69906, 1, 0.1960784, 0, 1,
-1.90351, -0.1283425, -3.138458, 1, 0.2039216, 0, 1,
-1.894643, -0.0121017, -0.06073989, 1, 0.2117647, 0, 1,
-1.887737, -1.251887, -1.011148, 1, 0.2156863, 0, 1,
-1.885288, 0.414672, -2.055586, 1, 0.2235294, 0, 1,
-1.885288, -0.2691893, -3.087825, 1, 0.227451, 0, 1,
-1.881915, 1.337321, -2.386398, 1, 0.2352941, 0, 1,
-1.874102, 1.116706, -1.071679, 1, 0.2392157, 0, 1,
-1.871641, -0.6837658, -3.626406, 1, 0.2470588, 0, 1,
-1.852317, -0.581625, -1.660058, 1, 0.2509804, 0, 1,
-1.840048, -0.5556869, -1.726397, 1, 0.2588235, 0, 1,
-1.833751, -0.07444804, -0.7882538, 1, 0.2627451, 0, 1,
-1.833541, 1.366951, 0.2076983, 1, 0.2705882, 0, 1,
-1.83229, -0.7659873, -2.491752, 1, 0.2745098, 0, 1,
-1.831309, 1.432008, -0.9384401, 1, 0.282353, 0, 1,
-1.809578, -0.2266648, 0.5668512, 1, 0.2862745, 0, 1,
-1.808943, 0.7867949, -0.8717154, 1, 0.2941177, 0, 1,
-1.805816, 1.029784, -0.1530479, 1, 0.3019608, 0, 1,
-1.794446, -0.9931215, -2.701331, 1, 0.3058824, 0, 1,
-1.779429, 0.7863205, -1.630239, 1, 0.3137255, 0, 1,
-1.76248, -0.7796739, -3.722158, 1, 0.3176471, 0, 1,
-1.758627, -2.02358, -1.264613, 1, 0.3254902, 0, 1,
-1.722911, 0.2898542, -1.810693, 1, 0.3294118, 0, 1,
-1.696546, -1.519791, -2.327092, 1, 0.3372549, 0, 1,
-1.679391, -0.4639915, 0.707265, 1, 0.3411765, 0, 1,
-1.678765, 0.08414591, -1.892633, 1, 0.3490196, 0, 1,
-1.677499, 0.02455433, -1.392249, 1, 0.3529412, 0, 1,
-1.667567, 0.5539354, -0.5408987, 1, 0.3607843, 0, 1,
-1.659961, 0.4402276, -0.7307075, 1, 0.3647059, 0, 1,
-1.646868, -0.5211869, -1.977336, 1, 0.372549, 0, 1,
-1.645048, -0.1121289, -0.302595, 1, 0.3764706, 0, 1,
-1.638547, -1.09147, -3.954912, 1, 0.3843137, 0, 1,
-1.62333, 1.798422, -1.51578, 1, 0.3882353, 0, 1,
-1.612689, 0.2285214, -0.6792909, 1, 0.3960784, 0, 1,
-1.604558, -0.6659766, -0.3127967, 1, 0.4039216, 0, 1,
-1.601492, -0.1179833, -1.960507, 1, 0.4078431, 0, 1,
-1.590253, 0.9725856, -0.9693732, 1, 0.4156863, 0, 1,
-1.573553, 0.7494981, -2.379957, 1, 0.4196078, 0, 1,
-1.551933, -1.226791, -3.025794, 1, 0.427451, 0, 1,
-1.549653, -0.545062, -2.457434, 1, 0.4313726, 0, 1,
-1.549309, -1.276682, -2.742841, 1, 0.4392157, 0, 1,
-1.540018, 0.6871946, -0.1745165, 1, 0.4431373, 0, 1,
-1.536881, -0.6847247, -2.732588, 1, 0.4509804, 0, 1,
-1.536768, -0.2339662, -2.774575, 1, 0.454902, 0, 1,
-1.526442, 0.1568739, -1.788263, 1, 0.4627451, 0, 1,
-1.509272, 0.04452592, -1.485965, 1, 0.4666667, 0, 1,
-1.506122, 0.7086583, 0.3364354, 1, 0.4745098, 0, 1,
-1.487444, -0.2933097, -1.545918, 1, 0.4784314, 0, 1,
-1.480297, -0.8093056, 0.4518532, 1, 0.4862745, 0, 1,
-1.479076, 0.350234, -2.259776, 1, 0.4901961, 0, 1,
-1.476938, -0.948768, -2.178123, 1, 0.4980392, 0, 1,
-1.473081, 1.100491, 0.9147361, 1, 0.5058824, 0, 1,
-1.436935, 0.4002286, -4.069934, 1, 0.509804, 0, 1,
-1.425705, -1.42582, -2.638882, 1, 0.5176471, 0, 1,
-1.413139, -1.978696, -3.233323, 1, 0.5215687, 0, 1,
-1.412772, -1.370385, -2.578839, 1, 0.5294118, 0, 1,
-1.381407, 1.265977, -0.6614925, 1, 0.5333334, 0, 1,
-1.379253, 2.371298, -0.1110982, 1, 0.5411765, 0, 1,
-1.378071, -0.447021, -0.2806333, 1, 0.5450981, 0, 1,
-1.372914, 0.2040817, -3.478018, 1, 0.5529412, 0, 1,
-1.367969, 1.533447, -1.099277, 1, 0.5568628, 0, 1,
-1.365727, 0.1988381, -1.483658, 1, 0.5647059, 0, 1,
-1.344393, -1.216372, -2.886385, 1, 0.5686275, 0, 1,
-1.338171, -1.096262, -3.408112, 1, 0.5764706, 0, 1,
-1.335844, 0.5609127, -2.386809, 1, 0.5803922, 0, 1,
-1.327122, 0.3119958, -2.415648, 1, 0.5882353, 0, 1,
-1.321111, -0.8347183, -2.484032, 1, 0.5921569, 0, 1,
-1.317409, -0.2466526, -0.382628, 1, 0.6, 0, 1,
-1.311948, -0.7838394, -1.923255, 1, 0.6078432, 0, 1,
-1.306649, -0.05140293, -0.5626613, 1, 0.6117647, 0, 1,
-1.302246, 0.9329978, -0.8850427, 1, 0.6196079, 0, 1,
-1.299049, -0.8926739, -2.539377, 1, 0.6235294, 0, 1,
-1.29348, -0.6926454, -1.883073, 1, 0.6313726, 0, 1,
-1.274278, -0.2966375, -2.056492, 1, 0.6352941, 0, 1,
-1.271543, 0.3762136, -2.792802, 1, 0.6431373, 0, 1,
-1.264858, 0.4540454, -0.9137843, 1, 0.6470588, 0, 1,
-1.262449, 0.6073892, -1.049244, 1, 0.654902, 0, 1,
-1.261038, 0.1968315, 0.3285322, 1, 0.6588235, 0, 1,
-1.25427, 1.448918, 0.05277773, 1, 0.6666667, 0, 1,
-1.243281, -0.3885747, -2.71272, 1, 0.6705883, 0, 1,
-1.242231, -0.5849923, -2.266492, 1, 0.6784314, 0, 1,
-1.234226, 0.7328839, 0.9048555, 1, 0.682353, 0, 1,
-1.228526, 0.2413581, -2.286929, 1, 0.6901961, 0, 1,
-1.224899, -0.290048, -0.9931077, 1, 0.6941177, 0, 1,
-1.214239, -1.171616, -2.120023, 1, 0.7019608, 0, 1,
-1.20586, -0.3373287, -2.317945, 1, 0.7098039, 0, 1,
-1.197951, -0.6488435, 0.02246568, 1, 0.7137255, 0, 1,
-1.195536, -1.028466, -2.754128, 1, 0.7215686, 0, 1,
-1.195073, -1.358756, -2.533763, 1, 0.7254902, 0, 1,
-1.190309, 1.25271, 0.1677961, 1, 0.7333333, 0, 1,
-1.184573, 0.5673466, 0.8298784, 1, 0.7372549, 0, 1,
-1.176208, 2.49008, -1.014851, 1, 0.7450981, 0, 1,
-1.173561, -0.2415471, -1.397551, 1, 0.7490196, 0, 1,
-1.172437, 0.7481067, -0.4597534, 1, 0.7568628, 0, 1,
-1.142739, -1.00379, -1.820362, 1, 0.7607843, 0, 1,
-1.141725, 0.5941907, -0.2304485, 1, 0.7686275, 0, 1,
-1.141493, 0.1905315, -2.102061, 1, 0.772549, 0, 1,
-1.136101, 0.6957132, 1.060856, 1, 0.7803922, 0, 1,
-1.133626, 1.652057, -0.06941038, 1, 0.7843137, 0, 1,
-1.130726, -1.263221, -4.264517, 1, 0.7921569, 0, 1,
-1.12734, 0.2718117, -1.737928, 1, 0.7960784, 0, 1,
-1.124658, 1.017807, 0.3954033, 1, 0.8039216, 0, 1,
-1.120245, -0.5767424, -1.25891, 1, 0.8117647, 0, 1,
-1.118725, 0.3833678, -1.590844, 1, 0.8156863, 0, 1,
-1.113267, -0.7755203, -2.667115, 1, 0.8235294, 0, 1,
-1.108842, -0.1455395, -1.029579, 1, 0.827451, 0, 1,
-1.087985, 0.0377183, -2.134593, 1, 0.8352941, 0, 1,
-1.087034, -0.8207107, -0.7319598, 1, 0.8392157, 0, 1,
-1.084972, -1.205154, -3.392029, 1, 0.8470588, 0, 1,
-1.070942, -0.2444147, -0.7992142, 1, 0.8509804, 0, 1,
-1.063722, 0.8207704, 0.8067687, 1, 0.8588235, 0, 1,
-1.04088, 0.318038, -0.3151316, 1, 0.8627451, 0, 1,
-1.037547, -0.4758546, -2.367887, 1, 0.8705882, 0, 1,
-1.024182, 0.02526793, -3.037558, 1, 0.8745098, 0, 1,
-1.023412, -0.654686, -1.858152, 1, 0.8823529, 0, 1,
-1.022071, 0.8135511, -1.468582, 1, 0.8862745, 0, 1,
-1.020852, 0.1731581, -0.1924523, 1, 0.8941177, 0, 1,
-1.018447, 0.08592571, -3.241185, 1, 0.8980392, 0, 1,
-1.01703, -1.014306, -0.841956, 1, 0.9058824, 0, 1,
-1.013371, -1.802971, -2.692987, 1, 0.9137255, 0, 1,
-1.002848, -0.2611109, -0.7829806, 1, 0.9176471, 0, 1,
-1.00078, -0.9481331, -1.333205, 1, 0.9254902, 0, 1,
-0.9987772, 0.9685342, -1.383138, 1, 0.9294118, 0, 1,
-0.9980804, -0.6804683, -1.535301, 1, 0.9372549, 0, 1,
-0.9925559, -1.728897, -1.772001, 1, 0.9411765, 0, 1,
-0.9912168, -0.7386796, -2.223479, 1, 0.9490196, 0, 1,
-0.988466, 0.6947507, -1.604126, 1, 0.9529412, 0, 1,
-0.9848233, 0.4766322, -1.532626, 1, 0.9607843, 0, 1,
-0.9809896, 0.5985526, -1.646934, 1, 0.9647059, 0, 1,
-0.9738438, 0.9152571, -1.135346, 1, 0.972549, 0, 1,
-0.9725385, -0.8614179, -0.9190904, 1, 0.9764706, 0, 1,
-0.9631752, 0.3483624, -2.821766, 1, 0.9843137, 0, 1,
-0.9622756, -0.9598816, -2.036954, 1, 0.9882353, 0, 1,
-0.9583809, -0.8361202, -0.9029172, 1, 0.9960784, 0, 1,
-0.9575079, -2.491609, -2.781912, 0.9960784, 1, 0, 1,
-0.9455515, -0.2236109, -1.553562, 0.9921569, 1, 0, 1,
-0.9346561, 0.2578303, -2.038519, 0.9843137, 1, 0, 1,
-0.9297286, 0.3690084, -0.2028977, 0.9803922, 1, 0, 1,
-0.928699, -1.224515, -3.41399, 0.972549, 1, 0, 1,
-0.9075155, 0.3926574, -0.9960428, 0.9686275, 1, 0, 1,
-0.9073295, -1.102257, -5.541212, 0.9607843, 1, 0, 1,
-0.8982434, 0.4681514, -1.20342, 0.9568627, 1, 0, 1,
-0.8946197, -1.18672, -3.188946, 0.9490196, 1, 0, 1,
-0.8813779, -2.144757, -4.495186, 0.945098, 1, 0, 1,
-0.8757355, -0.222779, -2.752742, 0.9372549, 1, 0, 1,
-0.8749502, 2.175868, -1.072295, 0.9333333, 1, 0, 1,
-0.8529751, 0.5038731, -1.003011, 0.9254902, 1, 0, 1,
-0.8500522, -1.49965, -1.005752, 0.9215686, 1, 0, 1,
-0.8457867, -0.8354785, -3.041161, 0.9137255, 1, 0, 1,
-0.8430792, -0.4017565, -2.189361, 0.9098039, 1, 0, 1,
-0.8400854, 1.018279, 1.038633, 0.9019608, 1, 0, 1,
-0.8387131, -1.054076, -2.884627, 0.8941177, 1, 0, 1,
-0.8383518, -0.3922915, -0.5464118, 0.8901961, 1, 0, 1,
-0.8291411, 1.038133, 0.2332229, 0.8823529, 1, 0, 1,
-0.8259181, -0.7420305, -2.105062, 0.8784314, 1, 0, 1,
-0.8225988, 0.6739466, -1.279185, 0.8705882, 1, 0, 1,
-0.8219055, 0.1544317, 0.1503495, 0.8666667, 1, 0, 1,
-0.8204778, -2.287772, -3.204736, 0.8588235, 1, 0, 1,
-0.8203772, -0.8925732, -4.216348, 0.854902, 1, 0, 1,
-0.8178716, -0.5677726, -1.153189, 0.8470588, 1, 0, 1,
-0.8173124, 2.802793, -0.7927241, 0.8431373, 1, 0, 1,
-0.8166956, 0.7644794, -1.053782, 0.8352941, 1, 0, 1,
-0.8070381, -0.5783042, -1.356333, 0.8313726, 1, 0, 1,
-0.8059104, 1.513746, -0.3362299, 0.8235294, 1, 0, 1,
-0.8039464, -0.7120506, -0.9373904, 0.8196079, 1, 0, 1,
-0.7992071, -0.07574176, -2.857138, 0.8117647, 1, 0, 1,
-0.7971856, -0.01751405, -1.831715, 0.8078431, 1, 0, 1,
-0.7949758, -1.112973, -3.443259, 0.8, 1, 0, 1,
-0.7926509, 0.8345457, -0.1840093, 0.7921569, 1, 0, 1,
-0.7888837, -0.6509089, -3.865184, 0.7882353, 1, 0, 1,
-0.785979, 0.7004508, 0.1982374, 0.7803922, 1, 0, 1,
-0.7757013, -0.4110853, -2.548246, 0.7764706, 1, 0, 1,
-0.7739405, 1.17807, -2.513097, 0.7686275, 1, 0, 1,
-0.7707662, 0.9758465, -1.925301, 0.7647059, 1, 0, 1,
-0.7703904, 0.4977654, -0.6227403, 0.7568628, 1, 0, 1,
-0.769922, 0.2553208, 0.04710915, 0.7529412, 1, 0, 1,
-0.7625017, 1.53106, -0.8821467, 0.7450981, 1, 0, 1,
-0.7612353, -1.080142, -2.176025, 0.7411765, 1, 0, 1,
-0.7582464, -0.1783009, -0.9454882, 0.7333333, 1, 0, 1,
-0.7530393, 1.208481, 0.01551136, 0.7294118, 1, 0, 1,
-0.752313, 0.05509055, -1.880502, 0.7215686, 1, 0, 1,
-0.7409922, 0.2478888, -0.451002, 0.7176471, 1, 0, 1,
-0.7348171, 0.1408864, -1.358618, 0.7098039, 1, 0, 1,
-0.7315654, 0.4648631, -3.399078, 0.7058824, 1, 0, 1,
-0.7309238, -0.1766565, -0.7496975, 0.6980392, 1, 0, 1,
-0.7309019, 0.3522234, 0.7422692, 0.6901961, 1, 0, 1,
-0.7244965, -0.5047435, -3.399601, 0.6862745, 1, 0, 1,
-0.7235309, 0.7801793, 0.5808801, 0.6784314, 1, 0, 1,
-0.7131642, 0.6145371, -0.9937578, 0.6745098, 1, 0, 1,
-0.7127658, 0.5470203, -1.033512, 0.6666667, 1, 0, 1,
-0.7095442, -0.0346469, -1.820679, 0.6627451, 1, 0, 1,
-0.7042987, 0.5183452, -0.2843769, 0.654902, 1, 0, 1,
-0.6974372, -0.1354051, -1.596142, 0.6509804, 1, 0, 1,
-0.6953269, 1.136166, -1.202478, 0.6431373, 1, 0, 1,
-0.694398, -0.3021292, -2.214211, 0.6392157, 1, 0, 1,
-0.6933337, -0.799094, -1.363339, 0.6313726, 1, 0, 1,
-0.6915141, -1.934098, -2.25643, 0.627451, 1, 0, 1,
-0.6914112, -0.452993, -3.781839, 0.6196079, 1, 0, 1,
-0.68268, 0.9036055, 0.07442459, 0.6156863, 1, 0, 1,
-0.6817343, 0.5218424, -0.09399106, 0.6078432, 1, 0, 1,
-0.6758172, -0.5149706, -3.882193, 0.6039216, 1, 0, 1,
-0.6733332, -0.820311, -2.543391, 0.5960785, 1, 0, 1,
-0.6719341, -0.403298, -1.37789, 0.5882353, 1, 0, 1,
-0.6710961, -0.7460934, -3.739311, 0.5843138, 1, 0, 1,
-0.6705253, 2.47992, 0.4888403, 0.5764706, 1, 0, 1,
-0.6643125, -0.8948684, -1.499172, 0.572549, 1, 0, 1,
-0.6638653, 0.7842481, 1.034667, 0.5647059, 1, 0, 1,
-0.6616067, 1.837492, -0.3718889, 0.5607843, 1, 0, 1,
-0.6612795, -0.8185733, -2.029461, 0.5529412, 1, 0, 1,
-0.6579978, -2.063276, -1.445192, 0.5490196, 1, 0, 1,
-0.653406, 1.239972, 0.46821, 0.5411765, 1, 0, 1,
-0.6531759, -0.2839943, -0.8207307, 0.5372549, 1, 0, 1,
-0.6469079, -0.4088399, -3.285536, 0.5294118, 1, 0, 1,
-0.6462774, -2.183806, -1.827424, 0.5254902, 1, 0, 1,
-0.631671, 2.479622, 0.8350408, 0.5176471, 1, 0, 1,
-0.6263838, 0.9592035, -1.082984, 0.5137255, 1, 0, 1,
-0.6255068, -2.142764, -2.30034, 0.5058824, 1, 0, 1,
-0.6247076, -0.6367772, -1.972818, 0.5019608, 1, 0, 1,
-0.620382, 0.3039625, -0.817793, 0.4941176, 1, 0, 1,
-0.6157322, -1.951165, -3.439324, 0.4862745, 1, 0, 1,
-0.6136782, 0.3193367, -1.366079, 0.4823529, 1, 0, 1,
-0.601402, 1.201524, -0.2993895, 0.4745098, 1, 0, 1,
-0.6009754, 0.2589581, -0.389209, 0.4705882, 1, 0, 1,
-0.5918137, -0.4970683, -2.63641, 0.4627451, 1, 0, 1,
-0.5887266, -0.4337445, -2.528035, 0.4588235, 1, 0, 1,
-0.5881056, -1.206822, -0.8750899, 0.4509804, 1, 0, 1,
-0.587644, 2.223093, 0.2812301, 0.4470588, 1, 0, 1,
-0.5855779, -0.7693206, -0.5187671, 0.4392157, 1, 0, 1,
-0.5834364, 1.066821, -0.2278161, 0.4352941, 1, 0, 1,
-0.580799, -0.4200734, -2.615513, 0.427451, 1, 0, 1,
-0.5769869, -0.400247, -3.854681, 0.4235294, 1, 0, 1,
-0.5757343, 0.8141466, -0.8420314, 0.4156863, 1, 0, 1,
-0.5690081, 0.04598667, -0.6828765, 0.4117647, 1, 0, 1,
-0.5681432, 0.3586814, -0.8027687, 0.4039216, 1, 0, 1,
-0.5606226, 0.5719248, 0.04054204, 0.3960784, 1, 0, 1,
-0.557075, -0.4330797, -5.089562, 0.3921569, 1, 0, 1,
-0.5555364, -0.6881481, -1.590126, 0.3843137, 1, 0, 1,
-0.553669, 0.02190902, -0.2394241, 0.3803922, 1, 0, 1,
-0.5496202, 1.475373, -0.6142489, 0.372549, 1, 0, 1,
-0.5484767, 0.2766417, -2.675138, 0.3686275, 1, 0, 1,
-0.5459696, 0.3202601, 0.02303185, 0.3607843, 1, 0, 1,
-0.5435454, -1.313426, -3.944849, 0.3568628, 1, 0, 1,
-0.5428811, 0.5008424, -2.575201, 0.3490196, 1, 0, 1,
-0.5379677, 1.343127, -0.5011159, 0.345098, 1, 0, 1,
-0.5293627, 1.23371, -0.7150623, 0.3372549, 1, 0, 1,
-0.5281096, 1.44116, -0.5712631, 0.3333333, 1, 0, 1,
-0.52735, 0.9015082, 0.427443, 0.3254902, 1, 0, 1,
-0.5266561, -0.7125875, -1.936698, 0.3215686, 1, 0, 1,
-0.5233917, -0.1464709, -2.750188, 0.3137255, 1, 0, 1,
-0.5221046, -0.3048881, -3.662122, 0.3098039, 1, 0, 1,
-0.5134039, -0.7869421, -1.946009, 0.3019608, 1, 0, 1,
-0.5120548, -0.07980467, -1.473528, 0.2941177, 1, 0, 1,
-0.5074478, -0.1973615, -1.426458, 0.2901961, 1, 0, 1,
-0.5004507, -0.4995689, -2.125524, 0.282353, 1, 0, 1,
-0.492038, -1.481062, -3.47337, 0.2784314, 1, 0, 1,
-0.4896209, 0.3883552, 0.05593142, 0.2705882, 1, 0, 1,
-0.4847386, -1.507604, -2.671549, 0.2666667, 1, 0, 1,
-0.4804099, -1.038186, -3.299819, 0.2588235, 1, 0, 1,
-0.4740645, 1.731675, -1.133713, 0.254902, 1, 0, 1,
-0.4717521, -0.3941211, -1.557964, 0.2470588, 1, 0, 1,
-0.4708485, 0.1779775, -0.5262381, 0.2431373, 1, 0, 1,
-0.4707533, -0.2559595, -0.8374748, 0.2352941, 1, 0, 1,
-0.4690876, -0.3816283, -1.936813, 0.2313726, 1, 0, 1,
-0.4687647, -0.2289202, -1.94546, 0.2235294, 1, 0, 1,
-0.4682175, -0.262686, -0.7700794, 0.2196078, 1, 0, 1,
-0.4658354, -0.2063905, -3.096376, 0.2117647, 1, 0, 1,
-0.4637018, -1.175517, -3.160086, 0.2078431, 1, 0, 1,
-0.4623107, 1.115511, -0.5514969, 0.2, 1, 0, 1,
-0.4572802, -0.4522447, -1.926817, 0.1921569, 1, 0, 1,
-0.4562163, 0.6361967, -0.08541349, 0.1882353, 1, 0, 1,
-0.4490656, 0.8504165, -1.756177, 0.1803922, 1, 0, 1,
-0.448819, 0.4090861, -2.446031, 0.1764706, 1, 0, 1,
-0.4456191, 0.8026249, -0.3354802, 0.1686275, 1, 0, 1,
-0.4356288, -1.10425, -1.79827, 0.1647059, 1, 0, 1,
-0.4264994, -0.2394916, -0.7352605, 0.1568628, 1, 0, 1,
-0.4260546, 0.2680425, -2.643195, 0.1529412, 1, 0, 1,
-0.4251758, 0.7478867, 0.1412525, 0.145098, 1, 0, 1,
-0.4248357, -1.377034, -1.417892, 0.1411765, 1, 0, 1,
-0.4189159, -0.9083483, -3.868645, 0.1333333, 1, 0, 1,
-0.4188794, 0.2795646, -1.495067, 0.1294118, 1, 0, 1,
-0.4167565, 0.3612741, 0.152739, 0.1215686, 1, 0, 1,
-0.4070398, 1.132757, 0.05380822, 0.1176471, 1, 0, 1,
-0.4002218, -0.4150247, -2.204955, 0.1098039, 1, 0, 1,
-0.3983176, -0.8627546, -2.133907, 0.1058824, 1, 0, 1,
-0.3979111, 2.446638, 0.1243962, 0.09803922, 1, 0, 1,
-0.3976995, 0.4718622, 1.114908, 0.09019608, 1, 0, 1,
-0.393936, 0.6330038, -1.341061, 0.08627451, 1, 0, 1,
-0.3820086, -0.2400235, -3.063354, 0.07843138, 1, 0, 1,
-0.3809849, 0.2786728, -0.6092786, 0.07450981, 1, 0, 1,
-0.3786131, 0.07840328, 0.7297837, 0.06666667, 1, 0, 1,
-0.378133, 0.2502962, -1.043692, 0.0627451, 1, 0, 1,
-0.3776843, -0.4562793, -4.059276, 0.05490196, 1, 0, 1,
-0.3694042, 0.9097155, 1.141519, 0.05098039, 1, 0, 1,
-0.3687323, 1.059726, 1.353635, 0.04313726, 1, 0, 1,
-0.3682682, 0.03477186, -0.8174353, 0.03921569, 1, 0, 1,
-0.3618879, 2.184579, 0.2933246, 0.03137255, 1, 0, 1,
-0.3602544, -0.5588061, -2.634467, 0.02745098, 1, 0, 1,
-0.3533394, -0.9522234, -2.545103, 0.01960784, 1, 0, 1,
-0.3490617, -0.3035004, -3.316061, 0.01568628, 1, 0, 1,
-0.3438583, -2.04156, -1.588384, 0.007843138, 1, 0, 1,
-0.3332757, 0.2197147, 0.06226567, 0.003921569, 1, 0, 1,
-0.3331979, 3.086218, 0.1476661, 0, 1, 0.003921569, 1,
-0.3292, 0.01805125, -0.4008937, 0, 1, 0.01176471, 1,
-0.3242282, -0.5430126, -2.664166, 0, 1, 0.01568628, 1,
-0.3239292, -1.111977, -3.765036, 0, 1, 0.02352941, 1,
-0.3196757, 1.275946, 0.1638797, 0, 1, 0.02745098, 1,
-0.3161182, 1.771986, 0.7568428, 0, 1, 0.03529412, 1,
-0.3155566, -0.1930546, -0.4773124, 0, 1, 0.03921569, 1,
-0.3142096, -0.7901566, -3.584997, 0, 1, 0.04705882, 1,
-0.3133588, 0.813653, -2.428573, 0, 1, 0.05098039, 1,
-0.3084503, -0.264194, -1.389947, 0, 1, 0.05882353, 1,
-0.3080532, -0.1865354, -1.160397, 0, 1, 0.0627451, 1,
-0.3076732, -0.8270139, -3.276371, 0, 1, 0.07058824, 1,
-0.3054655, -2.124429, -3.39344, 0, 1, 0.07450981, 1,
-0.3032663, 0.0594736, -1.180589, 0, 1, 0.08235294, 1,
-0.3031014, 0.7772427, 0.6451653, 0, 1, 0.08627451, 1,
-0.3016313, -0.6817611, -2.973394, 0, 1, 0.09411765, 1,
-0.29923, 0.1685264, -2.802768, 0, 1, 0.1019608, 1,
-0.2953287, -1.431229, -2.173008, 0, 1, 0.1058824, 1,
-0.2910268, 1.69415, -1.95218, 0, 1, 0.1137255, 1,
-0.2890511, 0.6961965, 0.2514314, 0, 1, 0.1176471, 1,
-0.28894, -0.3970475, -2.062436, 0, 1, 0.1254902, 1,
-0.287937, 0.08368541, -0.920908, 0, 1, 0.1294118, 1,
-0.2789184, -0.8353711, -3.072687, 0, 1, 0.1372549, 1,
-0.2766904, -0.9658628, -2.865622, 0, 1, 0.1411765, 1,
-0.2743867, 0.8364822, -0.525637, 0, 1, 0.1490196, 1,
-0.2704263, -0.7694364, -4.932785, 0, 1, 0.1529412, 1,
-0.2695938, 0.01156956, -0.7851028, 0, 1, 0.1607843, 1,
-0.2693571, -0.06823628, -2.586316, 0, 1, 0.1647059, 1,
-0.2686442, -0.9901087, -2.734732, 0, 1, 0.172549, 1,
-0.2654094, -1.365727, -2.097215, 0, 1, 0.1764706, 1,
-0.263003, 0.3500785, 0.5513623, 0, 1, 0.1843137, 1,
-0.260669, -2.349327, -1.319685, 0, 1, 0.1882353, 1,
-0.2569813, -0.3995756, -2.179529, 0, 1, 0.1960784, 1,
-0.2541996, 2.575698, -1.537157, 0, 1, 0.2039216, 1,
-0.2532226, -1.919273, -2.995018, 0, 1, 0.2078431, 1,
-0.2511697, -0.338128, -1.900398, 0, 1, 0.2156863, 1,
-0.2449502, 0.7810205, -1.204185, 0, 1, 0.2196078, 1,
-0.2401398, -0.7337837, -5.356939, 0, 1, 0.227451, 1,
-0.2397286, -0.5131711, -2.68107, 0, 1, 0.2313726, 1,
-0.2392572, 0.2025405, -1.02855, 0, 1, 0.2392157, 1,
-0.2337714, -1.648281, -2.898904, 0, 1, 0.2431373, 1,
-0.2316488, 0.1831461, 0.6644387, 0, 1, 0.2509804, 1,
-0.2315628, 0.9083104, 0.6051167, 0, 1, 0.254902, 1,
-0.2311074, -0.7743666, -3.435485, 0, 1, 0.2627451, 1,
-0.229796, -2.580371, -2.796502, 0, 1, 0.2666667, 1,
-0.2293393, -1.005684, -2.131913, 0, 1, 0.2745098, 1,
-0.2264315, -0.02540269, 0.270148, 0, 1, 0.2784314, 1,
-0.2235613, 2.294512, -0.1053998, 0, 1, 0.2862745, 1,
-0.2187825, -0.6194056, -2.45991, 0, 1, 0.2901961, 1,
-0.2186473, -0.7191393, -1.482064, 0, 1, 0.2980392, 1,
-0.2181817, -0.4998449, -1.681256, 0, 1, 0.3058824, 1,
-0.2181571, -1.123641, -3.888947, 0, 1, 0.3098039, 1,
-0.2138663, -1.808034, -3.822088, 0, 1, 0.3176471, 1,
-0.2091021, -0.5904577, -3.420034, 0, 1, 0.3215686, 1,
-0.2021876, -0.9468977, -2.077885, 0, 1, 0.3294118, 1,
-0.1996683, -2.23003, -3.991991, 0, 1, 0.3333333, 1,
-0.19959, 0.2719032, -0.9859481, 0, 1, 0.3411765, 1,
-0.1994555, -1.46141, -3.17587, 0, 1, 0.345098, 1,
-0.1977683, 0.6146081, 0.238271, 0, 1, 0.3529412, 1,
-0.1975687, -0.212129, -3.193555, 0, 1, 0.3568628, 1,
-0.1974728, -1.930718, -2.971537, 0, 1, 0.3647059, 1,
-0.1955032, -0.4694237, -2.937871, 0, 1, 0.3686275, 1,
-0.1934495, 1.11235, -0.4900067, 0, 1, 0.3764706, 1,
-0.1850326, 1.53489, -1.33171, 0, 1, 0.3803922, 1,
-0.1824814, 0.6815111, -0.2400976, 0, 1, 0.3882353, 1,
-0.1810964, -0.9668815, -2.190193, 0, 1, 0.3921569, 1,
-0.1779239, -0.2295355, -1.524995, 0, 1, 0.4, 1,
-0.1774888, -1.056675, -1.377981, 0, 1, 0.4078431, 1,
-0.1729344, -2.232731, -4.132957, 0, 1, 0.4117647, 1,
-0.1705241, -0.3672933, -1.426675, 0, 1, 0.4196078, 1,
-0.1666651, -0.1856817, -1.629075, 0, 1, 0.4235294, 1,
-0.1663211, 1.98026, -0.3829411, 0, 1, 0.4313726, 1,
-0.1655553, 1.044811, -0.9771656, 0, 1, 0.4352941, 1,
-0.1649814, 0.07206459, -1.911655, 0, 1, 0.4431373, 1,
-0.1559281, 0.3794733, 0.9822153, 0, 1, 0.4470588, 1,
-0.151667, -1.091575, -2.763993, 0, 1, 0.454902, 1,
-0.1512753, 0.0452578, -2.369392, 0, 1, 0.4588235, 1,
-0.1459735, 0.7894856, 0.5787412, 0, 1, 0.4666667, 1,
-0.1431074, -0.5304143, -2.129113, 0, 1, 0.4705882, 1,
-0.1423921, 0.9146847, -0.2222703, 0, 1, 0.4784314, 1,
-0.1407439, -0.3674292, -2.180872, 0, 1, 0.4823529, 1,
-0.1407054, 0.4485827, 0.0004454598, 0, 1, 0.4901961, 1,
-0.1362041, -1.529404, -3.24371, 0, 1, 0.4941176, 1,
-0.1357496, 1.638406, 0.4968537, 0, 1, 0.5019608, 1,
-0.1325871, 0.003866673, -2.18639, 0, 1, 0.509804, 1,
-0.1306846, 0.5118383, -0.697232, 0, 1, 0.5137255, 1,
-0.1282195, 1.996415, -1.732456, 0, 1, 0.5215687, 1,
-0.1272305, -0.7224035, -3.092659, 0, 1, 0.5254902, 1,
-0.1252097, -0.6336424, -2.920512, 0, 1, 0.5333334, 1,
-0.1243071, -0.3859032, -2.230559, 0, 1, 0.5372549, 1,
-0.1218117, -1.486515, -2.513077, 0, 1, 0.5450981, 1,
-0.1194389, 0.05619286, 0.6746743, 0, 1, 0.5490196, 1,
-0.1165049, 0.08229733, 0.0620654, 0, 1, 0.5568628, 1,
-0.1163463, 0.4900548, 0.9050545, 0, 1, 0.5607843, 1,
-0.1121587, -0.1666915, -3.041197, 0, 1, 0.5686275, 1,
-0.1098684, -1.24387, -1.357326, 0, 1, 0.572549, 1,
-0.1048239, -0.6524855, -3.486381, 0, 1, 0.5803922, 1,
-0.1012886, 0.4632895, -0.007331455, 0, 1, 0.5843138, 1,
-0.1012374, -0.3991292, -2.64143, 0, 1, 0.5921569, 1,
-0.09703325, -0.9431264, -2.957163, 0, 1, 0.5960785, 1,
-0.09567907, 0.07421001, -1.273384, 0, 1, 0.6039216, 1,
-0.09407063, -0.2609758, -2.948768, 0, 1, 0.6117647, 1,
-0.09362877, -1.877727, -3.606225, 0, 1, 0.6156863, 1,
-0.09325843, -1.080188, -2.289567, 0, 1, 0.6235294, 1,
-0.09104121, 0.2495302, -0.3209276, 0, 1, 0.627451, 1,
-0.08898205, -1.690604, -4.735716, 0, 1, 0.6352941, 1,
-0.08820108, -3.207176, -3.309207, 0, 1, 0.6392157, 1,
-0.08701389, -0.4498322, -3.184985, 0, 1, 0.6470588, 1,
-0.08686782, 1.272779, -0.6514313, 0, 1, 0.6509804, 1,
-0.08216788, 1.475989, -1.143578, 0, 1, 0.6588235, 1,
-0.07913262, 0.5253285, -1.015083, 0, 1, 0.6627451, 1,
-0.0760579, 0.06611393, -0.9002275, 0, 1, 0.6705883, 1,
-0.07584617, 0.3907872, 0.6509535, 0, 1, 0.6745098, 1,
-0.06258976, -0.319546, -2.693311, 0, 1, 0.682353, 1,
-0.06104734, -0.1332868, -3.965728, 0, 1, 0.6862745, 1,
-0.06010597, -1.091672, -1.570578, 0, 1, 0.6941177, 1,
-0.05903045, -0.8099489, -2.98177, 0, 1, 0.7019608, 1,
-0.05534986, 0.1580655, -1.036827, 0, 1, 0.7058824, 1,
-0.05515843, 0.8175471, -0.4269843, 0, 1, 0.7137255, 1,
-0.05370558, 0.3126212, 0.2676046, 0, 1, 0.7176471, 1,
-0.05085643, -1.158384, -4.065063, 0, 1, 0.7254902, 1,
-0.04374529, -1.983361, -3.827293, 0, 1, 0.7294118, 1,
-0.04367722, -0.7697073, -3.545932, 0, 1, 0.7372549, 1,
-0.04180804, 0.1279705, -0.5667634, 0, 1, 0.7411765, 1,
-0.03971834, 0.7138652, -1.616582, 0, 1, 0.7490196, 1,
-0.03908024, 0.06829382, -0.8066067, 0, 1, 0.7529412, 1,
-0.03769319, 0.5816088, -0.1900819, 0, 1, 0.7607843, 1,
-0.03445134, -0.2157483, -1.962899, 0, 1, 0.7647059, 1,
-0.03425646, 0.06688349, -0.4967775, 0, 1, 0.772549, 1,
-0.0316119, -1.464616, -5.24192, 0, 1, 0.7764706, 1,
-0.03125341, 0.2520528, 0.5758088, 0, 1, 0.7843137, 1,
-0.02486513, 0.08558254, -0.983871, 0, 1, 0.7882353, 1,
-0.02455906, 0.1727285, -1.161167, 0, 1, 0.7960784, 1,
-0.02350464, 1.72736, -0.1452439, 0, 1, 0.8039216, 1,
-0.02133793, -2.428728, -2.836346, 0, 1, 0.8078431, 1,
-0.01841613, 0.07796106, -1.504401, 0, 1, 0.8156863, 1,
-0.01731968, -0.6385573, -3.343708, 0, 1, 0.8196079, 1,
-0.01668616, 0.7296923, -0.1083135, 0, 1, 0.827451, 1,
-0.01472032, 0.8369161, -0.4374423, 0, 1, 0.8313726, 1,
-0.0116786, -0.05597341, -2.666209, 0, 1, 0.8392157, 1,
-0.01145951, -0.351895, -4.050862, 0, 1, 0.8431373, 1,
-0.01025395, -0.7107856, -3.993132, 0, 1, 0.8509804, 1,
-0.007157506, 2.450817, -1.095716, 0, 1, 0.854902, 1,
-0.006068805, 1.275738, -0.2935881, 0, 1, 0.8627451, 1,
-0.00393656, -0.3875383, -2.684127, 0, 1, 0.8666667, 1,
-0.003479937, 0.6340801, 0.488257, 0, 1, 0.8745098, 1,
0.000164248, -1.779218, 3.130436, 0, 1, 0.8784314, 1,
0.006044316, 1.097935, -0.8820699, 0, 1, 0.8862745, 1,
0.007264555, 0.9567642, -0.3496144, 0, 1, 0.8901961, 1,
0.008972582, -0.3685589, 3.555387, 0, 1, 0.8980392, 1,
0.01031303, 0.3802677, 1.558532, 0, 1, 0.9058824, 1,
0.01232302, 1.865372, -0.3413168, 0, 1, 0.9098039, 1,
0.01232605, -1.60947, 2.328869, 0, 1, 0.9176471, 1,
0.01259369, -0.3575866, 2.015447, 0, 1, 0.9215686, 1,
0.01453888, -0.5857759, 5.005321, 0, 1, 0.9294118, 1,
0.02187434, -0.4188999, 3.952358, 0, 1, 0.9333333, 1,
0.02315457, -0.1281185, 3.556871, 0, 1, 0.9411765, 1,
0.03391417, -0.3739584, 3.005997, 0, 1, 0.945098, 1,
0.03456229, 1.372141, -0.7976235, 0, 1, 0.9529412, 1,
0.04255042, 0.5871961, 0.623863, 0, 1, 0.9568627, 1,
0.04297563, -0.1513006, 2.27368, 0, 1, 0.9647059, 1,
0.04352109, -0.4783525, 1.938843, 0, 1, 0.9686275, 1,
0.04487279, 0.9311318, -0.3411971, 0, 1, 0.9764706, 1,
0.0475781, 0.2458143, 0.1279864, 0, 1, 0.9803922, 1,
0.04859533, -0.6298835, 2.660383, 0, 1, 0.9882353, 1,
0.0523296, 0.2493694, -0.2196135, 0, 1, 0.9921569, 1,
0.05705718, -0.1111217, 1.322304, 0, 1, 1, 1,
0.05950103, -0.9969831, 3.104151, 0, 0.9921569, 1, 1,
0.06023479, 0.1209491, 0.1816071, 0, 0.9882353, 1, 1,
0.0655479, 1.496196, -0.9493089, 0, 0.9803922, 1, 1,
0.07060061, 0.1905584, 0.1242812, 0, 0.9764706, 1, 1,
0.07229565, -0.4427962, 2.251698, 0, 0.9686275, 1, 1,
0.07244337, -0.5285093, 1.888875, 0, 0.9647059, 1, 1,
0.07534871, 0.3265415, -1.857437, 0, 0.9568627, 1, 1,
0.08013929, -0.5958984, 3.391532, 0, 0.9529412, 1, 1,
0.0816262, 0.3919803, 0.01821492, 0, 0.945098, 1, 1,
0.08164275, 0.5445634, 0.7044426, 0, 0.9411765, 1, 1,
0.08221013, -0.5344104, 4.081667, 0, 0.9333333, 1, 1,
0.08302765, -0.8968583, 2.781591, 0, 0.9294118, 1, 1,
0.08604354, 0.819529, -0.5149534, 0, 0.9215686, 1, 1,
0.08878931, -0.08319388, 3.018864, 0, 0.9176471, 1, 1,
0.09081219, -0.5308204, 1.468781, 0, 0.9098039, 1, 1,
0.09082244, -0.2498184, 3.4119, 0, 0.9058824, 1, 1,
0.09109378, -0.5045277, 4.125168, 0, 0.8980392, 1, 1,
0.09522927, -1.052323, 0.5909743, 0, 0.8901961, 1, 1,
0.09603592, -0.5918955, 3.820447, 0, 0.8862745, 1, 1,
0.09611075, 0.1617239, 1.249797, 0, 0.8784314, 1, 1,
0.1014186, -0.6819988, 2.438185, 0, 0.8745098, 1, 1,
0.1031446, -1.120177, 1.580068, 0, 0.8666667, 1, 1,
0.1057767, -0.2216637, 2.972849, 0, 0.8627451, 1, 1,
0.1080233, -0.4770832, 3.775376, 0, 0.854902, 1, 1,
0.1104011, 1.155156, 1.377817, 0, 0.8509804, 1, 1,
0.1125136, -0.006812744, 1.571491, 0, 0.8431373, 1, 1,
0.1161815, -1.471696, 3.07702, 0, 0.8392157, 1, 1,
0.1192802, -0.0262001, 2.303607, 0, 0.8313726, 1, 1,
0.1246732, 0.3955619, -0.9828199, 0, 0.827451, 1, 1,
0.1253823, 0.5755289, 0.9328768, 0, 0.8196079, 1, 1,
0.1291815, 1.115086, -0.2404287, 0, 0.8156863, 1, 1,
0.1300294, 0.6878536, -0.2510855, 0, 0.8078431, 1, 1,
0.1395717, -0.4458752, 3.383365, 0, 0.8039216, 1, 1,
0.1411138, 0.2401213, 0.8260032, 0, 0.7960784, 1, 1,
0.1480657, 1.215833, 1.941659, 0, 0.7882353, 1, 1,
0.1485488, -0.2494896, 2.606936, 0, 0.7843137, 1, 1,
0.1542557, 0.7818779, 2.851786, 0, 0.7764706, 1, 1,
0.1570034, -0.4337556, 1.425547, 0, 0.772549, 1, 1,
0.1654299, 0.8633352, -0.8058424, 0, 0.7647059, 1, 1,
0.1666776, -1.520707, 2.393715, 0, 0.7607843, 1, 1,
0.1667196, -1.944424, 2.671069, 0, 0.7529412, 1, 1,
0.1717889, -0.7103248, 1.035391, 0, 0.7490196, 1, 1,
0.1724923, -0.4925684, 4.008511, 0, 0.7411765, 1, 1,
0.176358, -1.883067, 4.093514, 0, 0.7372549, 1, 1,
0.1862158, 1.554458, -0.09937814, 0, 0.7294118, 1, 1,
0.1872906, 0.8485943, 0.2989884, 0, 0.7254902, 1, 1,
0.1932287, -0.6341309, 1.029177, 0, 0.7176471, 1, 1,
0.1949023, 0.2089955, 0.4028285, 0, 0.7137255, 1, 1,
0.1950126, 0.6274892, 0.7695448, 0, 0.7058824, 1, 1,
0.1996585, 1.96674, 2.038545, 0, 0.6980392, 1, 1,
0.2018488, 0.02723464, 0.7016864, 0, 0.6941177, 1, 1,
0.2018552, 0.60799, -0.6168878, 0, 0.6862745, 1, 1,
0.2091324, -0.8277808, 0.5705383, 0, 0.682353, 1, 1,
0.2112771, -0.08328572, 2.141419, 0, 0.6745098, 1, 1,
0.2151426, -0.3384877, 3.605498, 0, 0.6705883, 1, 1,
0.2206972, 0.1136592, 1.348624, 0, 0.6627451, 1, 1,
0.2235891, 1.477505, -0.1014214, 0, 0.6588235, 1, 1,
0.2325384, -0.9907864, 3.751265, 0, 0.6509804, 1, 1,
0.2343731, 0.289553, 1.674114, 0, 0.6470588, 1, 1,
0.2362479, 0.5898776, -0.7153012, 0, 0.6392157, 1, 1,
0.2364404, -0.08229393, 0.05578298, 0, 0.6352941, 1, 1,
0.237353, -1.89209, 2.779792, 0, 0.627451, 1, 1,
0.2382273, -0.02104944, 1.539541, 0, 0.6235294, 1, 1,
0.244513, 0.2287564, 0.7413499, 0, 0.6156863, 1, 1,
0.2449337, 1.080649, -0.8832227, 0, 0.6117647, 1, 1,
0.2513113, 2.512946, 1.955707, 0, 0.6039216, 1, 1,
0.2521576, 0.3772733, 0.01006616, 0, 0.5960785, 1, 1,
0.2523261, 0.7282294, -0.06172297, 0, 0.5921569, 1, 1,
0.2552274, -2.360812, 3.001202, 0, 0.5843138, 1, 1,
0.257215, 1.394454, 0.03345855, 0, 0.5803922, 1, 1,
0.2577568, 0.01100319, 0.9435456, 0, 0.572549, 1, 1,
0.2618222, 1.042262, 0.01629335, 0, 0.5686275, 1, 1,
0.26192, -0.3623672, 2.377991, 0, 0.5607843, 1, 1,
0.2629825, -0.7698314, 2.469229, 0, 0.5568628, 1, 1,
0.2640178, 0.9490719, 1.187947, 0, 0.5490196, 1, 1,
0.2643424, -0.3461534, 2.555601, 0, 0.5450981, 1, 1,
0.2680604, -1.178276, 3.300347, 0, 0.5372549, 1, 1,
0.2685609, -0.916239, 3.176258, 0, 0.5333334, 1, 1,
0.271478, -2.403757, 2.476421, 0, 0.5254902, 1, 1,
0.2716441, 0.208746, 2.054953, 0, 0.5215687, 1, 1,
0.2730963, -0.150028, 1.504972, 0, 0.5137255, 1, 1,
0.2743019, 1.310247, -0.6256064, 0, 0.509804, 1, 1,
0.2770793, -0.1617264, 2.895217, 0, 0.5019608, 1, 1,
0.2774308, -1.049178, 3.294495, 0, 0.4941176, 1, 1,
0.2782647, 0.1925081, 0.7017711, 0, 0.4901961, 1, 1,
0.2793672, -0.5588674, 2.099173, 0, 0.4823529, 1, 1,
0.2805068, -1.423789, 3.615846, 0, 0.4784314, 1, 1,
0.2827018, 1.054178, 0.0835091, 0, 0.4705882, 1, 1,
0.2847347, 0.2281244, 0.6220812, 0, 0.4666667, 1, 1,
0.2852833, 0.1058889, 0.7052919, 0, 0.4588235, 1, 1,
0.2867377, -0.9745923, 3.857767, 0, 0.454902, 1, 1,
0.2926077, -0.7023562, 3.50801, 0, 0.4470588, 1, 1,
0.2945937, -1.05955, 2.227362, 0, 0.4431373, 1, 1,
0.2969888, 0.4739562, 0.1345152, 0, 0.4352941, 1, 1,
0.2999322, 0.1891965, 0.8935491, 0, 0.4313726, 1, 1,
0.3019338, -0.2158248, 1.429867, 0, 0.4235294, 1, 1,
0.3037112, 0.2559751, -0.3773836, 0, 0.4196078, 1, 1,
0.3037651, 0.803411, -0.6540898, 0, 0.4117647, 1, 1,
0.3071161, -0.4072689, 3.286782, 0, 0.4078431, 1, 1,
0.3120827, -1.741046, 2.494627, 0, 0.4, 1, 1,
0.3123732, -0.334335, 2.372145, 0, 0.3921569, 1, 1,
0.3132912, 0.9157909, -0.2213822, 0, 0.3882353, 1, 1,
0.3156343, -1.105078, 1.985081, 0, 0.3803922, 1, 1,
0.316817, 1.834032, -0.3885048, 0, 0.3764706, 1, 1,
0.319868, 0.03892391, 3.156705, 0, 0.3686275, 1, 1,
0.3227736, 0.6006257, 2.054381, 0, 0.3647059, 1, 1,
0.3233189, 1.614768, 0.4544137, 0, 0.3568628, 1, 1,
0.3254631, 0.1831363, 1.255904, 0, 0.3529412, 1, 1,
0.3261441, 0.7007304, -0.293034, 0, 0.345098, 1, 1,
0.3270734, 0.3582932, 0.4036031, 0, 0.3411765, 1, 1,
0.3273681, -0.784501, 2.641331, 0, 0.3333333, 1, 1,
0.3275971, 1.502764, 0.01619654, 0, 0.3294118, 1, 1,
0.3286051, -0.7986315, 2.460735, 0, 0.3215686, 1, 1,
0.3292888, 0.8947566, 0.1458939, 0, 0.3176471, 1, 1,
0.3318715, -0.4247397, 1.933136, 0, 0.3098039, 1, 1,
0.335569, 0.4436275, 1.341519, 0, 0.3058824, 1, 1,
0.3358081, -0.6667826, 1.758724, 0, 0.2980392, 1, 1,
0.3412299, -1.998925, 3.752637, 0, 0.2901961, 1, 1,
0.3437804, 0.572114, 0.8121558, 0, 0.2862745, 1, 1,
0.3477336, -0.1425135, 1.558553, 0, 0.2784314, 1, 1,
0.3510209, 0.2116473, 0.4596949, 0, 0.2745098, 1, 1,
0.3521531, -0.190346, 2.261425, 0, 0.2666667, 1, 1,
0.3537152, -0.4975342, 2.679904, 0, 0.2627451, 1, 1,
0.3594815, 1.503574, 1.69137, 0, 0.254902, 1, 1,
0.3613759, 0.7486603, -0.5731813, 0, 0.2509804, 1, 1,
0.363053, 1.841533, 1.091713, 0, 0.2431373, 1, 1,
0.3640066, 1.039326, -0.1063387, 0, 0.2392157, 1, 1,
0.3676769, 1.867391, -0.1025927, 0, 0.2313726, 1, 1,
0.3694632, 2.137103, 1.259225, 0, 0.227451, 1, 1,
0.3702694, 1.044407, 0.866221, 0, 0.2196078, 1, 1,
0.3735575, -2.584979, 4.699956, 0, 0.2156863, 1, 1,
0.3763574, 0.66289, -0.3680364, 0, 0.2078431, 1, 1,
0.3784277, 0.3417196, 1.29082, 0, 0.2039216, 1, 1,
0.3812551, 0.3232189, 1.927323, 0, 0.1960784, 1, 1,
0.3826558, 0.2496396, 0.194395, 0, 0.1882353, 1, 1,
0.3827023, -1.705028, 3.992575, 0, 0.1843137, 1, 1,
0.3839425, -1.306564, 2.501364, 0, 0.1764706, 1, 1,
0.3944144, 1.111808, 1.166355, 0, 0.172549, 1, 1,
0.3964693, 0.004722861, 1.203969, 0, 0.1647059, 1, 1,
0.4010073, 0.2535651, 1.101944, 0, 0.1607843, 1, 1,
0.4015475, 0.0843645, 1.850745, 0, 0.1529412, 1, 1,
0.410992, 0.6044177, 1.014384, 0, 0.1490196, 1, 1,
0.4157889, -1.818033, 3.516562, 0, 0.1411765, 1, 1,
0.418473, 0.902523, -1.119346, 0, 0.1372549, 1, 1,
0.4202977, 1.345747, 1.859494, 0, 0.1294118, 1, 1,
0.4205339, 0.7310498, -0.02245203, 0, 0.1254902, 1, 1,
0.421152, -0.4216538, 3.126811, 0, 0.1176471, 1, 1,
0.4303665, -0.1208812, 0.9985759, 0, 0.1137255, 1, 1,
0.434087, 0.6881279, 2.343875, 0, 0.1058824, 1, 1,
0.4345126, -1.137822, 3.394117, 0, 0.09803922, 1, 1,
0.4363988, 0.8764428, -0.3123658, 0, 0.09411765, 1, 1,
0.4392742, 1.334552, 0.5398827, 0, 0.08627451, 1, 1,
0.4453795, -0.453359, 2.364107, 0, 0.08235294, 1, 1,
0.448243, 0.1040558, 0.3335983, 0, 0.07450981, 1, 1,
0.4491292, 1.725222, -0.05296462, 0, 0.07058824, 1, 1,
0.4495642, 0.3655946, 1.857439, 0, 0.0627451, 1, 1,
0.4499948, -1.019198, 1.46105, 0, 0.05882353, 1, 1,
0.4551846, -0.618265, 2.313574, 0, 0.05098039, 1, 1,
0.4566326, 0.5161551, -0.2561736, 0, 0.04705882, 1, 1,
0.4580714, 2.84053, -0.8821686, 0, 0.03921569, 1, 1,
0.4589047, 0.6890812, 0.9580941, 0, 0.03529412, 1, 1,
0.4607157, 0.1927663, 2.06195, 0, 0.02745098, 1, 1,
0.4669557, 0.1765823, 1.497666, 0, 0.02352941, 1, 1,
0.4670523, -2.50747, 1.935046, 0, 0.01568628, 1, 1,
0.468747, 0.8026235, 1.645042, 0, 0.01176471, 1, 1,
0.471619, 1.065231, 0.3556343, 0, 0.003921569, 1, 1,
0.4724461, 1.250974, 2.256649, 0.003921569, 0, 1, 1,
0.4773239, -0.8141772, 1.918337, 0.007843138, 0, 1, 1,
0.4784032, 1.980931, 0.4825329, 0.01568628, 0, 1, 1,
0.4825515, -1.061139, 2.759883, 0.01960784, 0, 1, 1,
0.4889096, -0.5798358, 1.865218, 0.02745098, 0, 1, 1,
0.4890588, 0.5812815, -1.054346, 0.03137255, 0, 1, 1,
0.489586, 1.79409, 1.786772, 0.03921569, 0, 1, 1,
0.490649, -0.7343984, 3.032902, 0.04313726, 0, 1, 1,
0.4914485, -0.333097, 1.349261, 0.05098039, 0, 1, 1,
0.4920454, 0.124706, 2.823556, 0.05490196, 0, 1, 1,
0.4983722, -1.204521, 0.9382668, 0.0627451, 0, 1, 1,
0.4990704, 0.3296302, 0.8084534, 0.06666667, 0, 1, 1,
0.4994049, -0.5403901, 1.738381, 0.07450981, 0, 1, 1,
0.5013604, 1.178893, -0.7414755, 0.07843138, 0, 1, 1,
0.5035197, 0.7013062, -0.6417735, 0.08627451, 0, 1, 1,
0.506449, 0.6952484, -0.523869, 0.09019608, 0, 1, 1,
0.508238, 0.06774085, 0.7415997, 0.09803922, 0, 1, 1,
0.5084101, -1.124245, 3.16512, 0.1058824, 0, 1, 1,
0.5085086, 1.388252, -1.486944, 0.1098039, 0, 1, 1,
0.5203373, 0.2798605, 0.2662888, 0.1176471, 0, 1, 1,
0.5237318, 0.4444058, -0.2128038, 0.1215686, 0, 1, 1,
0.5272758, 0.3216538, 1.531214, 0.1294118, 0, 1, 1,
0.5278794, -1.003248, 2.810571, 0.1333333, 0, 1, 1,
0.5340327, 0.4529828, 1.248579, 0.1411765, 0, 1, 1,
0.5380163, -0.5939533, 2.345378, 0.145098, 0, 1, 1,
0.5411116, 1.676596, -0.6288648, 0.1529412, 0, 1, 1,
0.5444916, -0.3419916, 1.535085, 0.1568628, 0, 1, 1,
0.5459366, -1.221084, 3.804413, 0.1647059, 0, 1, 1,
0.5494006, -1.299516, 3.9234, 0.1686275, 0, 1, 1,
0.549514, 0.6487384, 2.381793, 0.1764706, 0, 1, 1,
0.5518407, 0.8116638, 1.377414, 0.1803922, 0, 1, 1,
0.5534373, -1.195693, 3.613354, 0.1882353, 0, 1, 1,
0.5587613, -0.6783763, 3.996694, 0.1921569, 0, 1, 1,
0.559825, -0.5561151, 2.652097, 0.2, 0, 1, 1,
0.5610626, 0.1982891, -0.09140301, 0.2078431, 0, 1, 1,
0.5622816, -0.5154757, 1.114959, 0.2117647, 0, 1, 1,
0.5640977, -1.54359, 2.460551, 0.2196078, 0, 1, 1,
0.5672516, -0.6553819, 2.004288, 0.2235294, 0, 1, 1,
0.5672567, -0.6998073, 2.351229, 0.2313726, 0, 1, 1,
0.5700824, 1.438123, 1.684179, 0.2352941, 0, 1, 1,
0.5735086, 0.5109504, 1.26037, 0.2431373, 0, 1, 1,
0.5780423, -0.25433, 2.47843, 0.2470588, 0, 1, 1,
0.5780957, 0.01392357, 0.5206222, 0.254902, 0, 1, 1,
0.5818154, 1.920885, 1.885888, 0.2588235, 0, 1, 1,
0.5984306, 0.4736034, -1.192183, 0.2666667, 0, 1, 1,
0.6003391, 0.5711175, 0.4111768, 0.2705882, 0, 1, 1,
0.6018153, -0.4124514, 3.423922, 0.2784314, 0, 1, 1,
0.6020293, -0.5127721, 3.295734, 0.282353, 0, 1, 1,
0.6034132, 0.2979877, 0.2943658, 0.2901961, 0, 1, 1,
0.6108623, -0.1206682, 1.934584, 0.2941177, 0, 1, 1,
0.6147028, -1.317919, 1.18386, 0.3019608, 0, 1, 1,
0.616967, 1.761227, 0.6683799, 0.3098039, 0, 1, 1,
0.6210022, 0.4251372, 1.343916, 0.3137255, 0, 1, 1,
0.6210852, -0.1489076, 1.072038, 0.3215686, 0, 1, 1,
0.6211035, -0.9089298, 3.104672, 0.3254902, 0, 1, 1,
0.6232646, -1.10564, 0.2660719, 0.3333333, 0, 1, 1,
0.6235988, 0.5905441, 2.534582, 0.3372549, 0, 1, 1,
0.6276928, -1.826624, 2.845653, 0.345098, 0, 1, 1,
0.6302875, 0.3835783, 0.7167597, 0.3490196, 0, 1, 1,
0.6323838, 1.799673, 0.8572569, 0.3568628, 0, 1, 1,
0.6331826, 0.4714035, 1.058643, 0.3607843, 0, 1, 1,
0.6400176, 0.9670457, -0.3591236, 0.3686275, 0, 1, 1,
0.6437888, -2.009958, 3.828066, 0.372549, 0, 1, 1,
0.6438057, 2.165563, 2.159303, 0.3803922, 0, 1, 1,
0.6441844, -0.3121647, 2.211277, 0.3843137, 0, 1, 1,
0.6465352, -0.9608086, 1.151543, 0.3921569, 0, 1, 1,
0.6479343, -0.590757, 2.648398, 0.3960784, 0, 1, 1,
0.6492982, 0.0146545, 1.398509, 0.4039216, 0, 1, 1,
0.6524001, 1.708146, -1.359222, 0.4117647, 0, 1, 1,
0.6548735, 4.213812, -0.2796025, 0.4156863, 0, 1, 1,
0.6555914, -0.8754062, 2.190525, 0.4235294, 0, 1, 1,
0.6567984, 2.009004, -1.009271, 0.427451, 0, 1, 1,
0.6694654, -0.4309164, 1.507202, 0.4352941, 0, 1, 1,
0.6699079, 0.2531894, 1.404374, 0.4392157, 0, 1, 1,
0.6705315, -1.77361, 2.551679, 0.4470588, 0, 1, 1,
0.6734374, -0.5004292, 0.09681999, 0.4509804, 0, 1, 1,
0.675523, 1.961459, 0.3789252, 0.4588235, 0, 1, 1,
0.6761361, -0.3588543, 2.885417, 0.4627451, 0, 1, 1,
0.6811045, 0.7653815, 2.178123, 0.4705882, 0, 1, 1,
0.6812607, -0.614512, 2.996533, 0.4745098, 0, 1, 1,
0.6824771, -0.0208096, 2.086831, 0.4823529, 0, 1, 1,
0.6840145, -1.079557, 1.263987, 0.4862745, 0, 1, 1,
0.6855831, -1.929551, 1.943474, 0.4941176, 0, 1, 1,
0.6855899, 1.090488, 0.3765186, 0.5019608, 0, 1, 1,
0.6875349, -1.36234, 2.870503, 0.5058824, 0, 1, 1,
0.6922401, -0.5965528, 3.290905, 0.5137255, 0, 1, 1,
0.7003887, -0.4657116, 1.872738, 0.5176471, 0, 1, 1,
0.7016687, 0.08134444, 1.765785, 0.5254902, 0, 1, 1,
0.7060738, 2.18646, 1.845476, 0.5294118, 0, 1, 1,
0.7107813, 0.2170862, 0.6347998, 0.5372549, 0, 1, 1,
0.7167841, 0.8746511, 1.454694, 0.5411765, 0, 1, 1,
0.7266667, -0.1908876, 2.964331, 0.5490196, 0, 1, 1,
0.7290634, 0.4165245, -0.7356775, 0.5529412, 0, 1, 1,
0.7320524, 0.09457372, 0.6579024, 0.5607843, 0, 1, 1,
0.7329298, -0.1348584, 2.694492, 0.5647059, 0, 1, 1,
0.736523, 2.121506, 1.180331, 0.572549, 0, 1, 1,
0.737834, -1.389644, 1.980755, 0.5764706, 0, 1, 1,
0.739314, 2.085056, -1.675412, 0.5843138, 0, 1, 1,
0.7410774, -0.2688639, 0.6613926, 0.5882353, 0, 1, 1,
0.749294, 0.2059666, 0.8105345, 0.5960785, 0, 1, 1,
0.7555146, 1.616511, 1.600778, 0.6039216, 0, 1, 1,
0.7580355, 0.7090284, -0.5243965, 0.6078432, 0, 1, 1,
0.7589227, -0.1484501, 2.066566, 0.6156863, 0, 1, 1,
0.7601244, -0.3547248, 0.5890683, 0.6196079, 0, 1, 1,
0.760458, -0.5605612, 2.685168, 0.627451, 0, 1, 1,
0.762334, -1.697114, 2.023631, 0.6313726, 0, 1, 1,
0.7722248, -0.3339844, 2.261372, 0.6392157, 0, 1, 1,
0.7747159, 1.910205, 0.9026923, 0.6431373, 0, 1, 1,
0.778293, -1.56639, 3.109632, 0.6509804, 0, 1, 1,
0.7785526, -0.9695444, 3.59463, 0.654902, 0, 1, 1,
0.7797324, -2.213608, 4.360582, 0.6627451, 0, 1, 1,
0.780565, -0.08326118, 2.339375, 0.6666667, 0, 1, 1,
0.7845874, -1.604876, 1.513574, 0.6745098, 0, 1, 1,
0.7876732, -1.255212, 2.449657, 0.6784314, 0, 1, 1,
0.7937106, -0.2629832, 2.24801, 0.6862745, 0, 1, 1,
0.7997606, -0.5891295, 1.88844, 0.6901961, 0, 1, 1,
0.8009369, -0.05510414, 2.350339, 0.6980392, 0, 1, 1,
0.8035553, 1.717421, 1.968033, 0.7058824, 0, 1, 1,
0.8064935, -0.1947785, 1.942744, 0.7098039, 0, 1, 1,
0.8115261, 1.011934, -0.1035084, 0.7176471, 0, 1, 1,
0.816787, -0.1126628, 1.003967, 0.7215686, 0, 1, 1,
0.823972, -0.01621139, 1.076605, 0.7294118, 0, 1, 1,
0.825469, 1.068202, 1.942023, 0.7333333, 0, 1, 1,
0.8273568, -0.1996323, 2.174605, 0.7411765, 0, 1, 1,
0.8357739, -0.62665, 0.4331469, 0.7450981, 0, 1, 1,
0.8397378, 0.1634447, 2.469478, 0.7529412, 0, 1, 1,
0.8422904, -0.586745, 0.04137682, 0.7568628, 0, 1, 1,
0.8439333, 1.576508, 0.3104897, 0.7647059, 0, 1, 1,
0.8460904, -1.109241, 2.565444, 0.7686275, 0, 1, 1,
0.8479871, -0.8916367, 1.657066, 0.7764706, 0, 1, 1,
0.8489895, -0.6955218, 2.262514, 0.7803922, 0, 1, 1,
0.858776, 1.118222, 2.437772, 0.7882353, 0, 1, 1,
0.862266, -0.8599936, 3.355244, 0.7921569, 0, 1, 1,
0.8641073, -0.4675661, 2.34568, 0.8, 0, 1, 1,
0.8645066, -0.8344715, 3.276648, 0.8078431, 0, 1, 1,
0.8660568, 0.2726781, 1.799563, 0.8117647, 0, 1, 1,
0.8717997, -0.1174037, 2.310102, 0.8196079, 0, 1, 1,
0.8738603, -0.1961144, 2.108026, 0.8235294, 0, 1, 1,
0.8762568, 0.5898835, 1.996023, 0.8313726, 0, 1, 1,
0.8789963, 0.1084308, 0.6281176, 0.8352941, 0, 1, 1,
0.8828102, -0.7918066, -0.3352245, 0.8431373, 0, 1, 1,
0.8858699, -0.4049966, 4.282359, 0.8470588, 0, 1, 1,
0.8862969, -0.7827501, 2.166733, 0.854902, 0, 1, 1,
0.8875703, -1.310253, 3.031798, 0.8588235, 0, 1, 1,
0.897842, 0.00966306, 2.976789, 0.8666667, 0, 1, 1,
0.8999583, 0.3773285, 1.734704, 0.8705882, 0, 1, 1,
0.9011372, 0.5386708, 1.22878, 0.8784314, 0, 1, 1,
0.9023868, 0.02532957, 0.590959, 0.8823529, 0, 1, 1,
0.9107468, 1.635368, 3.110892, 0.8901961, 0, 1, 1,
0.9165334, 0.1250574, 2.2685, 0.8941177, 0, 1, 1,
0.9167231, 1.134556, 1.925084, 0.9019608, 0, 1, 1,
0.9167683, 0.1038325, 2.471784, 0.9098039, 0, 1, 1,
0.9213309, 0.3473178, 0.1451086, 0.9137255, 0, 1, 1,
0.9241791, 0.2578257, 2.160366, 0.9215686, 0, 1, 1,
0.9287757, -0.8489513, 1.090443, 0.9254902, 0, 1, 1,
0.931127, -1.364909, 3.209168, 0.9333333, 0, 1, 1,
0.9346794, 0.7604954, 1.690562, 0.9372549, 0, 1, 1,
0.9371449, 0.9135143, 0.5641631, 0.945098, 0, 1, 1,
0.9381109, -1.266825, 3.059091, 0.9490196, 0, 1, 1,
0.9470051, 0.408856, 0.5541504, 0.9568627, 0, 1, 1,
0.9506764, 0.3268776, 1.584113, 0.9607843, 0, 1, 1,
0.9608315, 0.5995295, -0.9437923, 0.9686275, 0, 1, 1,
0.9611812, -0.1155722, 1.179077, 0.972549, 0, 1, 1,
0.9634935, -0.2861714, 1.31419, 0.9803922, 0, 1, 1,
0.967261, 0.08348723, 1.09216, 0.9843137, 0, 1, 1,
0.9746137, 0.133207, 1.184515, 0.9921569, 0, 1, 1,
0.9812894, 1.503146, -0.741418, 0.9960784, 0, 1, 1,
0.9860303, -0.9597275, 3.316798, 1, 0, 0.9960784, 1,
0.9872326, -0.7470466, 2.140047, 1, 0, 0.9882353, 1,
0.9891264, 1.515429, 0.4653282, 1, 0, 0.9843137, 1,
0.9904456, 0.03544377, 0.1488416, 1, 0, 0.9764706, 1,
0.9923015, 1.313401, -0.7054151, 1, 0, 0.972549, 1,
1.002426, -0.05630454, 1.566749, 1, 0, 0.9647059, 1,
1.007252, -0.4417433, 2.116999, 1, 0, 0.9607843, 1,
1.010936, 0.7865661, 0.5842363, 1, 0, 0.9529412, 1,
1.016116, 1.207138, 1.291334, 1, 0, 0.9490196, 1,
1.022387, 1.273217, 1.263865, 1, 0, 0.9411765, 1,
1.023828, 1.157132, 0.6120415, 1, 0, 0.9372549, 1,
1.024372, 1.036462, 2.167642, 1, 0, 0.9294118, 1,
1.028558, -0.2002441, 2.893454, 1, 0, 0.9254902, 1,
1.032684, -0.1124944, 2.736063, 1, 0, 0.9176471, 1,
1.035191, 1.062089, 1.28851, 1, 0, 0.9137255, 1,
1.045977, 0.3529832, 2.549854, 1, 0, 0.9058824, 1,
1.046743, 0.4466842, 1.131553, 1, 0, 0.9019608, 1,
1.048665, -0.2648496, 2.200026, 1, 0, 0.8941177, 1,
1.049939, -0.1214126, 0.8167949, 1, 0, 0.8862745, 1,
1.05678, -0.2090698, 1.83983, 1, 0, 0.8823529, 1,
1.05793, -0.03253227, 2.1935, 1, 0, 0.8745098, 1,
1.064703, -0.7270182, 1.725525, 1, 0, 0.8705882, 1,
1.077754, -0.1172918, -0.8617151, 1, 0, 0.8627451, 1,
1.087284, -2.444592, 2.864342, 1, 0, 0.8588235, 1,
1.099431, -0.1791433, 1.566248, 1, 0, 0.8509804, 1,
1.101717, -1.59671, 2.606027, 1, 0, 0.8470588, 1,
1.11191, 0.9824657, 2.017372, 1, 0, 0.8392157, 1,
1.116839, 0.263345, 1.925125, 1, 0, 0.8352941, 1,
1.120572, 0.2384517, -0.5265294, 1, 0, 0.827451, 1,
1.126178, -0.8366894, 3.559259, 1, 0, 0.8235294, 1,
1.129251, 1.035082, 0.06645653, 1, 0, 0.8156863, 1,
1.133666, -0.7208053, 1.113302, 1, 0, 0.8117647, 1,
1.134143, 0.4044553, 2.372874, 1, 0, 0.8039216, 1,
1.135616, 1.250866, 1.682234, 1, 0, 0.7960784, 1,
1.13889, -0.7000099, 2.167446, 1, 0, 0.7921569, 1,
1.139947, 1.279617, 0.5523741, 1, 0, 0.7843137, 1,
1.145441, -0.290646, 1.979807, 1, 0, 0.7803922, 1,
1.150358, -0.9907325, 1.71478, 1, 0, 0.772549, 1,
1.151352, 0.6042782, 2.352779, 1, 0, 0.7686275, 1,
1.162083, -1.56412, 3.383641, 1, 0, 0.7607843, 1,
1.165177, -1.450698, 1.490258, 1, 0, 0.7568628, 1,
1.166926, 0.1521054, 3.580736, 1, 0, 0.7490196, 1,
1.166971, 1.436453, 1.56223, 1, 0, 0.7450981, 1,
1.168468, -0.5038967, 3.159655, 1, 0, 0.7372549, 1,
1.17602, 2.401639, 0.1721906, 1, 0, 0.7333333, 1,
1.19952, -0.469107, 3.238343, 1, 0, 0.7254902, 1,
1.224306, 0.5612596, 2.251949, 1, 0, 0.7215686, 1,
1.226348, 0.7362549, 2.74399, 1, 0, 0.7137255, 1,
1.229511, 0.8102574, -0.3317313, 1, 0, 0.7098039, 1,
1.240654, 0.3324586, 2.822845, 1, 0, 0.7019608, 1,
1.259378, 2.266744, -0.9480776, 1, 0, 0.6941177, 1,
1.270554, -0.460748, 2.513209, 1, 0, 0.6901961, 1,
1.280629, 1.188942, 0.2142997, 1, 0, 0.682353, 1,
1.280835, -1.373078, 3.632524, 1, 0, 0.6784314, 1,
1.282527, -2.434101, 4.02408, 1, 0, 0.6705883, 1,
1.284212, 0.4435067, 1.900302, 1, 0, 0.6666667, 1,
1.293429, -0.3812574, 3.339502, 1, 0, 0.6588235, 1,
1.294693, -1.959225, 3.322019, 1, 0, 0.654902, 1,
1.296835, 0.9853697, 1.472172, 1, 0, 0.6470588, 1,
1.299469, 1.261049, 0.578971, 1, 0, 0.6431373, 1,
1.299505, -1.104102, 1.712111, 1, 0, 0.6352941, 1,
1.306531, 0.053317, 1.862301, 1, 0, 0.6313726, 1,
1.309351, -0.1635501, 0.8705369, 1, 0, 0.6235294, 1,
1.315145, -0.05099958, 2.11041, 1, 0, 0.6196079, 1,
1.330255, 0.8094348, 1.517048, 1, 0, 0.6117647, 1,
1.333013, 0.1862698, 1.299816, 1, 0, 0.6078432, 1,
1.338909, 0.3247254, -0.2290229, 1, 0, 0.6, 1,
1.350016, -0.8768152, 3.413386, 1, 0, 0.5921569, 1,
1.350224, 0.628932, 1.654981, 1, 0, 0.5882353, 1,
1.363466, 0.9102409, 1.695711, 1, 0, 0.5803922, 1,
1.379253, -0.8345643, 2.012954, 1, 0, 0.5764706, 1,
1.380356, -0.03923109, -0.8087109, 1, 0, 0.5686275, 1,
1.380692, 1.490477, 0.7835089, 1, 0, 0.5647059, 1,
1.391892, -1.299145, 1.764199, 1, 0, 0.5568628, 1,
1.393693, 0.04724223, 1.055288, 1, 0, 0.5529412, 1,
1.401181, 0.1887906, 2.572562, 1, 0, 0.5450981, 1,
1.403389, -0.1752556, 1.639905, 1, 0, 0.5411765, 1,
1.406591, -1.018486, 1.944548, 1, 0, 0.5333334, 1,
1.422242, 0.5267884, 1.636575, 1, 0, 0.5294118, 1,
1.423625, -0.6114352, 2.759273, 1, 0, 0.5215687, 1,
1.431388, -0.5862696, 1.085436, 1, 0, 0.5176471, 1,
1.438559, -0.9979053, 2.952071, 1, 0, 0.509804, 1,
1.444126, -0.7051508, 1.293575, 1, 0, 0.5058824, 1,
1.455653, 1.05414, 1.431484, 1, 0, 0.4980392, 1,
1.458775, -0.9181588, 2.656507, 1, 0, 0.4901961, 1,
1.464462, 1.341907, -0.4275188, 1, 0, 0.4862745, 1,
1.468317, 1.766385, -0.2136443, 1, 0, 0.4784314, 1,
1.488011, -1.292417, 1.786248, 1, 0, 0.4745098, 1,
1.496291, -0.00447495, 1.432878, 1, 0, 0.4666667, 1,
1.497626, 0.2207174, -0.5982282, 1, 0, 0.4627451, 1,
1.513934, -0.6609378, 1.670752, 1, 0, 0.454902, 1,
1.515972, -1.057074, 2.105599, 1, 0, 0.4509804, 1,
1.518735, -1.349249, 2.959054, 1, 0, 0.4431373, 1,
1.527569, -0.918723, 1.439689, 1, 0, 0.4392157, 1,
1.535369, 0.07877231, 3.126147, 1, 0, 0.4313726, 1,
1.541432, 1.802863, 1.029047, 1, 0, 0.427451, 1,
1.544403, -0.01332666, 0.4275805, 1, 0, 0.4196078, 1,
1.547976, 0.4388632, 1.352017, 1, 0, 0.4156863, 1,
1.557411, 0.5934276, -0.1776717, 1, 0, 0.4078431, 1,
1.561975, -1.667772, 2.755457, 1, 0, 0.4039216, 1,
1.562578, -1.207299, 1.035316, 1, 0, 0.3960784, 1,
1.563523, -0.6465008, 1.883821, 1, 0, 0.3882353, 1,
1.567075, 1.095465, 1.975834, 1, 0, 0.3843137, 1,
1.576251, 0.05911927, -0.2416181, 1, 0, 0.3764706, 1,
1.581348, -0.7622714, 1.444957, 1, 0, 0.372549, 1,
1.582629, 1.58702, 0.6250991, 1, 0, 0.3647059, 1,
1.592695, -0.5230614, 2.509374, 1, 0, 0.3607843, 1,
1.611626, -0.717712, 2.279399, 1, 0, 0.3529412, 1,
1.636343, -0.2830699, 2.179186, 1, 0, 0.3490196, 1,
1.637258, -0.7282205, 3.756154, 1, 0, 0.3411765, 1,
1.643917, 0.5630408, 3.349945, 1, 0, 0.3372549, 1,
1.646308, 1.322228, -0.7398292, 1, 0, 0.3294118, 1,
1.652714, 0.5331233, 0.3732357, 1, 0, 0.3254902, 1,
1.672073, -1.088722, 3.221752, 1, 0, 0.3176471, 1,
1.684261, 0.9294429, 0.6020784, 1, 0, 0.3137255, 1,
1.687874, 1.542647, 1.348879, 1, 0, 0.3058824, 1,
1.702761, 1.598335, 1.943566, 1, 0, 0.2980392, 1,
1.713803, 0.3115891, 3.014712, 1, 0, 0.2941177, 1,
1.736392, 0.3194288, 1.058117, 1, 0, 0.2862745, 1,
1.770984, 0.274167, 1.418083, 1, 0, 0.282353, 1,
1.799216, -2.369754, 2.652535, 1, 0, 0.2745098, 1,
1.811504, 0.392105, 2.37448, 1, 0, 0.2705882, 1,
1.82861, 0.6071507, 2.465032, 1, 0, 0.2627451, 1,
1.83262, 0.4837655, 1.954069, 1, 0, 0.2588235, 1,
1.833154, 1.090116, 0.3717471, 1, 0, 0.2509804, 1,
1.844216, 0.09681679, 0.6156446, 1, 0, 0.2470588, 1,
1.852075, 0.1576294, 0.9526111, 1, 0, 0.2392157, 1,
1.89581, 0.0272956, 2.814249, 1, 0, 0.2352941, 1,
1.910934, 0.3914507, -0.2886758, 1, 0, 0.227451, 1,
1.914937, -0.8714975, 2.019635, 1, 0, 0.2235294, 1,
1.921623, 0.6667427, 1.975594, 1, 0, 0.2156863, 1,
1.928913, 0.5385609, 1.329, 1, 0, 0.2117647, 1,
1.946459, -2.234457, 2.101507, 1, 0, 0.2039216, 1,
1.968372, -1.987638, 1.803314, 1, 0, 0.1960784, 1,
1.989563, 1.272385, 0.8330213, 1, 0, 0.1921569, 1,
2.000605, 0.2860321, 0.9202999, 1, 0, 0.1843137, 1,
2.011407, -0.1430978, 1.411232, 1, 0, 0.1803922, 1,
2.034233, -1.74007, 1.497167, 1, 0, 0.172549, 1,
2.0467, -1.176039, 4.595359, 1, 0, 0.1686275, 1,
2.072803, -0.2705169, 1.076461, 1, 0, 0.1607843, 1,
2.093704, 0.4869634, 0.1398102, 1, 0, 0.1568628, 1,
2.114357, -0.09461447, 2.668718, 1, 0, 0.1490196, 1,
2.128331, -1.477203, 0.9305741, 1, 0, 0.145098, 1,
2.13436, -0.01974055, 2.133109, 1, 0, 0.1372549, 1,
2.151834, -1.547016, 3.206667, 1, 0, 0.1333333, 1,
2.176262, 1.250029, 0.7626567, 1, 0, 0.1254902, 1,
2.185304, -0.8654563, 3.222343, 1, 0, 0.1215686, 1,
2.213543, -0.116758, 1.616183, 1, 0, 0.1137255, 1,
2.35695, 0.4922823, 3.309904, 1, 0, 0.1098039, 1,
2.465529, -0.3559449, 2.95694, 1, 0, 0.1019608, 1,
2.496258, -3.679668, 3.002145, 1, 0, 0.09411765, 1,
2.502389, -0.09454548, 3.779819, 1, 0, 0.09019608, 1,
2.514789, -0.7024642, 2.249136, 1, 0, 0.08235294, 1,
2.552987, 0.1134817, 0.8544002, 1, 0, 0.07843138, 1,
2.623926, -1.396589, 3.423089, 1, 0, 0.07058824, 1,
2.626552, -0.884044, 2.985671, 1, 0, 0.06666667, 1,
2.682631, -0.3776193, 1.297972, 1, 0, 0.05882353, 1,
2.705509, -1.432405, 0.9661852, 1, 0, 0.05490196, 1,
2.72387, 0.5741403, 2.447888, 1, 0, 0.04705882, 1,
2.797473, -0.996546, 1.581677, 1, 0, 0.04313726, 1,
2.798741, 0.6175183, 0.1296776, 1, 0, 0.03529412, 1,
2.811602, -0.181333, 1.664399, 1, 0, 0.03137255, 1,
2.851387, -0.5056809, 0.9462681, 1, 0, 0.02352941, 1,
2.877687, 1.714779, 2.896875, 1, 0, 0.01960784, 1,
2.955607, 1.126857, 1.510446, 1, 0, 0.01176471, 1,
3.298939, -0.3525365, 1.781966, 1, 0, 0.007843138, 1
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
0.07628214, -5.017613, -7.328849, 0, -0.5, 0.5, 0.5,
0.07628214, -5.017613, -7.328849, 1, -0.5, 0.5, 0.5,
0.07628214, -5.017613, -7.328849, 1, 1.5, 0.5, 0.5,
0.07628214, -5.017613, -7.328849, 0, 1.5, 0.5, 0.5
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
-4.238856, 0.2670722, -7.328849, 0, -0.5, 0.5, 0.5,
-4.238856, 0.2670722, -7.328849, 1, -0.5, 0.5, 0.5,
-4.238856, 0.2670722, -7.328849, 1, 1.5, 0.5, 0.5,
-4.238856, 0.2670722, -7.328849, 0, 1.5, 0.5, 0.5
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
-4.238856, -5.017613, -0.2679453, 0, -0.5, 0.5, 0.5,
-4.238856, -5.017613, -0.2679453, 1, -0.5, 0.5, 0.5,
-4.238856, -5.017613, -0.2679453, 1, 1.5, 0.5, 0.5,
-4.238856, -5.017613, -0.2679453, 0, 1.5, 0.5, 0.5
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
-3, -3.79807, -5.699409,
3, -3.79807, -5.699409,
-3, -3.79807, -5.699409,
-3, -4.001327, -5.970983,
-2, -3.79807, -5.699409,
-2, -4.001327, -5.970983,
-1, -3.79807, -5.699409,
-1, -4.001327, -5.970983,
0, -3.79807, -5.699409,
0, -4.001327, -5.970983,
1, -3.79807, -5.699409,
1, -4.001327, -5.970983,
2, -3.79807, -5.699409,
2, -4.001327, -5.970983,
3, -3.79807, -5.699409,
3, -4.001327, -5.970983
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
-3, -4.407842, -6.514129, 0, -0.5, 0.5, 0.5,
-3, -4.407842, -6.514129, 1, -0.5, 0.5, 0.5,
-3, -4.407842, -6.514129, 1, 1.5, 0.5, 0.5,
-3, -4.407842, -6.514129, 0, 1.5, 0.5, 0.5,
-2, -4.407842, -6.514129, 0, -0.5, 0.5, 0.5,
-2, -4.407842, -6.514129, 1, -0.5, 0.5, 0.5,
-2, -4.407842, -6.514129, 1, 1.5, 0.5, 0.5,
-2, -4.407842, -6.514129, 0, 1.5, 0.5, 0.5,
-1, -4.407842, -6.514129, 0, -0.5, 0.5, 0.5,
-1, -4.407842, -6.514129, 1, -0.5, 0.5, 0.5,
-1, -4.407842, -6.514129, 1, 1.5, 0.5, 0.5,
-1, -4.407842, -6.514129, 0, 1.5, 0.5, 0.5,
0, -4.407842, -6.514129, 0, -0.5, 0.5, 0.5,
0, -4.407842, -6.514129, 1, -0.5, 0.5, 0.5,
0, -4.407842, -6.514129, 1, 1.5, 0.5, 0.5,
0, -4.407842, -6.514129, 0, 1.5, 0.5, 0.5,
1, -4.407842, -6.514129, 0, -0.5, 0.5, 0.5,
1, -4.407842, -6.514129, 1, -0.5, 0.5, 0.5,
1, -4.407842, -6.514129, 1, 1.5, 0.5, 0.5,
1, -4.407842, -6.514129, 0, 1.5, 0.5, 0.5,
2, -4.407842, -6.514129, 0, -0.5, 0.5, 0.5,
2, -4.407842, -6.514129, 1, -0.5, 0.5, 0.5,
2, -4.407842, -6.514129, 1, 1.5, 0.5, 0.5,
2, -4.407842, -6.514129, 0, 1.5, 0.5, 0.5,
3, -4.407842, -6.514129, 0, -0.5, 0.5, 0.5,
3, -4.407842, -6.514129, 1, -0.5, 0.5, 0.5,
3, -4.407842, -6.514129, 1, 1.5, 0.5, 0.5,
3, -4.407842, -6.514129, 0, 1.5, 0.5, 0.5
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
-3.243055, -2, -5.699409,
-3.243055, 4, -5.699409,
-3.243055, -2, -5.699409,
-3.409022, -2, -5.970983,
-3.243055, 0, -5.699409,
-3.409022, 0, -5.970983,
-3.243055, 2, -5.699409,
-3.409022, 2, -5.970983,
-3.243055, 4, -5.699409,
-3.409022, 4, -5.970983
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
-3.740955, -2, -6.514129, 0, -0.5, 0.5, 0.5,
-3.740955, -2, -6.514129, 1, -0.5, 0.5, 0.5,
-3.740955, -2, -6.514129, 1, 1.5, 0.5, 0.5,
-3.740955, -2, -6.514129, 0, 1.5, 0.5, 0.5,
-3.740955, 0, -6.514129, 0, -0.5, 0.5, 0.5,
-3.740955, 0, -6.514129, 1, -0.5, 0.5, 0.5,
-3.740955, 0, -6.514129, 1, 1.5, 0.5, 0.5,
-3.740955, 0, -6.514129, 0, 1.5, 0.5, 0.5,
-3.740955, 2, -6.514129, 0, -0.5, 0.5, 0.5,
-3.740955, 2, -6.514129, 1, -0.5, 0.5, 0.5,
-3.740955, 2, -6.514129, 1, 1.5, 0.5, 0.5,
-3.740955, 2, -6.514129, 0, 1.5, 0.5, 0.5,
-3.740955, 4, -6.514129, 0, -0.5, 0.5, 0.5,
-3.740955, 4, -6.514129, 1, -0.5, 0.5, 0.5,
-3.740955, 4, -6.514129, 1, 1.5, 0.5, 0.5,
-3.740955, 4, -6.514129, 0, 1.5, 0.5, 0.5
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
-3.243055, -3.79807, -4,
-3.243055, -3.79807, 4,
-3.243055, -3.79807, -4,
-3.409022, -4.001327, -4,
-3.243055, -3.79807, -2,
-3.409022, -4.001327, -2,
-3.243055, -3.79807, 0,
-3.409022, -4.001327, 0,
-3.243055, -3.79807, 2,
-3.409022, -4.001327, 2,
-3.243055, -3.79807, 4,
-3.409022, -4.001327, 4
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
-3.740955, -4.407842, -4, 0, -0.5, 0.5, 0.5,
-3.740955, -4.407842, -4, 1, -0.5, 0.5, 0.5,
-3.740955, -4.407842, -4, 1, 1.5, 0.5, 0.5,
-3.740955, -4.407842, -4, 0, 1.5, 0.5, 0.5,
-3.740955, -4.407842, -2, 0, -0.5, 0.5, 0.5,
-3.740955, -4.407842, -2, 1, -0.5, 0.5, 0.5,
-3.740955, -4.407842, -2, 1, 1.5, 0.5, 0.5,
-3.740955, -4.407842, -2, 0, 1.5, 0.5, 0.5,
-3.740955, -4.407842, 0, 0, -0.5, 0.5, 0.5,
-3.740955, -4.407842, 0, 1, -0.5, 0.5, 0.5,
-3.740955, -4.407842, 0, 1, 1.5, 0.5, 0.5,
-3.740955, -4.407842, 0, 0, 1.5, 0.5, 0.5,
-3.740955, -4.407842, 2, 0, -0.5, 0.5, 0.5,
-3.740955, -4.407842, 2, 1, -0.5, 0.5, 0.5,
-3.740955, -4.407842, 2, 1, 1.5, 0.5, 0.5,
-3.740955, -4.407842, 2, 0, 1.5, 0.5, 0.5,
-3.740955, -4.407842, 4, 0, -0.5, 0.5, 0.5,
-3.740955, -4.407842, 4, 1, -0.5, 0.5, 0.5,
-3.740955, -4.407842, 4, 1, 1.5, 0.5, 0.5,
-3.740955, -4.407842, 4, 0, 1.5, 0.5, 0.5
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
-3.243055, -3.79807, -5.699409,
-3.243055, 4.332214, -5.699409,
-3.243055, -3.79807, 5.163519,
-3.243055, 4.332214, 5.163519,
-3.243055, -3.79807, -5.699409,
-3.243055, -3.79807, 5.163519,
-3.243055, 4.332214, -5.699409,
-3.243055, 4.332214, 5.163519,
-3.243055, -3.79807, -5.699409,
3.395619, -3.79807, -5.699409,
-3.243055, -3.79807, 5.163519,
3.395619, -3.79807, 5.163519,
-3.243055, 4.332214, -5.699409,
3.395619, 4.332214, -5.699409,
-3.243055, 4.332214, 5.163519,
3.395619, 4.332214, 5.163519,
3.395619, -3.79807, -5.699409,
3.395619, 4.332214, -5.699409,
3.395619, -3.79807, 5.163519,
3.395619, 4.332214, 5.163519,
3.395619, -3.79807, -5.699409,
3.395619, -3.79807, 5.163519,
3.395619, 4.332214, -5.699409,
3.395619, 4.332214, 5.163519
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
var radius = 8.066054;
var distance = 35.88679;
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
mvMatrix.translate( -0.07628214, -0.2670722, 0.2679453 );
mvMatrix.scale( 1.313692, 1.072678, 0.8028384 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.88679);
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
isocarbamid<-read.table("isocarbamid.xyz")
```

```
## Error in read.table("isocarbamid.xyz"): no lines available in input
```

```r
x<-isocarbamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'isocarbamid' not found
```

```r
y<-isocarbamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'isocarbamid' not found
```

```r
z<-isocarbamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'isocarbamid' not found
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
-3.146375, -0.5162023, -2.053633, 0, 0, 1, 1, 1,
-2.781384, -0.9628069, -1.831228, 1, 0, 0, 1, 1,
-2.659519, -0.9354793, -2.507839, 1, 0, 0, 1, 1,
-2.557819, -0.9170992, -0.3856227, 1, 0, 0, 1, 1,
-2.491, -1.601353, -3.507029, 1, 0, 0, 1, 1,
-2.421087, -1.010998, -1.457871, 1, 0, 0, 1, 1,
-2.370209, -0.6560892, -3.351099, 0, 0, 0, 1, 1,
-2.34121, 0.8455486, -1.330943, 0, 0, 0, 1, 1,
-2.324736, -0.5932409, -2.330698, 0, 0, 0, 1, 1,
-2.259847, 0.9501222, -1.483608, 0, 0, 0, 1, 1,
-2.251399, 0.4439976, -0.2417903, 0, 0, 0, 1, 1,
-2.216326, 1.045665, -0.6079859, 0, 0, 0, 1, 1,
-2.196171, -0.1556579, -1.13998, 0, 0, 0, 1, 1,
-2.17973, 0.7594215, -0.7189618, 1, 1, 1, 1, 1,
-2.163353, 0.3430409, -0.3049794, 1, 1, 1, 1, 1,
-2.142131, 0.5885754, -1.023648, 1, 1, 1, 1, 1,
-2.113587, 0.8397607, -1.007104, 1, 1, 1, 1, 1,
-2.106589, -1.098734, -2.96309, 1, 1, 1, 1, 1,
-2.088997, 1.470983, -1.384897, 1, 1, 1, 1, 1,
-2.078911, 0.3222321, -0.8346601, 1, 1, 1, 1, 1,
-2.061942, -1.268468, -3.048634, 1, 1, 1, 1, 1,
-2.031249, 0.2159399, -1.30921, 1, 1, 1, 1, 1,
-2.031051, -0.314668, -0.8768511, 1, 1, 1, 1, 1,
-2.023124, -0.6844015, -1.258859, 1, 1, 1, 1, 1,
-1.994619, 0.6180287, -1.626888, 1, 1, 1, 1, 1,
-1.993954, 0.4909771, -1.369258, 1, 1, 1, 1, 1,
-1.992862, -1.235879, -1.886783, 1, 1, 1, 1, 1,
-1.990373, 0.5815044, -1.365109, 1, 1, 1, 1, 1,
-1.985993, 1.276865, -0.45325, 0, 0, 1, 1, 1,
-1.969715, 1.290536, -1.926031, 1, 0, 0, 1, 1,
-1.96017, 0.03073836, -0.3599727, 1, 0, 0, 1, 1,
-1.948665, 0.5398185, -0.8347204, 1, 0, 0, 1, 1,
-1.937956, 1.275324, -0.5801492, 1, 0, 0, 1, 1,
-1.910499, 0.7707214, -1.69906, 1, 0, 0, 1, 1,
-1.90351, -0.1283425, -3.138458, 0, 0, 0, 1, 1,
-1.894643, -0.0121017, -0.06073989, 0, 0, 0, 1, 1,
-1.887737, -1.251887, -1.011148, 0, 0, 0, 1, 1,
-1.885288, 0.414672, -2.055586, 0, 0, 0, 1, 1,
-1.885288, -0.2691893, -3.087825, 0, 0, 0, 1, 1,
-1.881915, 1.337321, -2.386398, 0, 0, 0, 1, 1,
-1.874102, 1.116706, -1.071679, 0, 0, 0, 1, 1,
-1.871641, -0.6837658, -3.626406, 1, 1, 1, 1, 1,
-1.852317, -0.581625, -1.660058, 1, 1, 1, 1, 1,
-1.840048, -0.5556869, -1.726397, 1, 1, 1, 1, 1,
-1.833751, -0.07444804, -0.7882538, 1, 1, 1, 1, 1,
-1.833541, 1.366951, 0.2076983, 1, 1, 1, 1, 1,
-1.83229, -0.7659873, -2.491752, 1, 1, 1, 1, 1,
-1.831309, 1.432008, -0.9384401, 1, 1, 1, 1, 1,
-1.809578, -0.2266648, 0.5668512, 1, 1, 1, 1, 1,
-1.808943, 0.7867949, -0.8717154, 1, 1, 1, 1, 1,
-1.805816, 1.029784, -0.1530479, 1, 1, 1, 1, 1,
-1.794446, -0.9931215, -2.701331, 1, 1, 1, 1, 1,
-1.779429, 0.7863205, -1.630239, 1, 1, 1, 1, 1,
-1.76248, -0.7796739, -3.722158, 1, 1, 1, 1, 1,
-1.758627, -2.02358, -1.264613, 1, 1, 1, 1, 1,
-1.722911, 0.2898542, -1.810693, 1, 1, 1, 1, 1,
-1.696546, -1.519791, -2.327092, 0, 0, 1, 1, 1,
-1.679391, -0.4639915, 0.707265, 1, 0, 0, 1, 1,
-1.678765, 0.08414591, -1.892633, 1, 0, 0, 1, 1,
-1.677499, 0.02455433, -1.392249, 1, 0, 0, 1, 1,
-1.667567, 0.5539354, -0.5408987, 1, 0, 0, 1, 1,
-1.659961, 0.4402276, -0.7307075, 1, 0, 0, 1, 1,
-1.646868, -0.5211869, -1.977336, 0, 0, 0, 1, 1,
-1.645048, -0.1121289, -0.302595, 0, 0, 0, 1, 1,
-1.638547, -1.09147, -3.954912, 0, 0, 0, 1, 1,
-1.62333, 1.798422, -1.51578, 0, 0, 0, 1, 1,
-1.612689, 0.2285214, -0.6792909, 0, 0, 0, 1, 1,
-1.604558, -0.6659766, -0.3127967, 0, 0, 0, 1, 1,
-1.601492, -0.1179833, -1.960507, 0, 0, 0, 1, 1,
-1.590253, 0.9725856, -0.9693732, 1, 1, 1, 1, 1,
-1.573553, 0.7494981, -2.379957, 1, 1, 1, 1, 1,
-1.551933, -1.226791, -3.025794, 1, 1, 1, 1, 1,
-1.549653, -0.545062, -2.457434, 1, 1, 1, 1, 1,
-1.549309, -1.276682, -2.742841, 1, 1, 1, 1, 1,
-1.540018, 0.6871946, -0.1745165, 1, 1, 1, 1, 1,
-1.536881, -0.6847247, -2.732588, 1, 1, 1, 1, 1,
-1.536768, -0.2339662, -2.774575, 1, 1, 1, 1, 1,
-1.526442, 0.1568739, -1.788263, 1, 1, 1, 1, 1,
-1.509272, 0.04452592, -1.485965, 1, 1, 1, 1, 1,
-1.506122, 0.7086583, 0.3364354, 1, 1, 1, 1, 1,
-1.487444, -0.2933097, -1.545918, 1, 1, 1, 1, 1,
-1.480297, -0.8093056, 0.4518532, 1, 1, 1, 1, 1,
-1.479076, 0.350234, -2.259776, 1, 1, 1, 1, 1,
-1.476938, -0.948768, -2.178123, 1, 1, 1, 1, 1,
-1.473081, 1.100491, 0.9147361, 0, 0, 1, 1, 1,
-1.436935, 0.4002286, -4.069934, 1, 0, 0, 1, 1,
-1.425705, -1.42582, -2.638882, 1, 0, 0, 1, 1,
-1.413139, -1.978696, -3.233323, 1, 0, 0, 1, 1,
-1.412772, -1.370385, -2.578839, 1, 0, 0, 1, 1,
-1.381407, 1.265977, -0.6614925, 1, 0, 0, 1, 1,
-1.379253, 2.371298, -0.1110982, 0, 0, 0, 1, 1,
-1.378071, -0.447021, -0.2806333, 0, 0, 0, 1, 1,
-1.372914, 0.2040817, -3.478018, 0, 0, 0, 1, 1,
-1.367969, 1.533447, -1.099277, 0, 0, 0, 1, 1,
-1.365727, 0.1988381, -1.483658, 0, 0, 0, 1, 1,
-1.344393, -1.216372, -2.886385, 0, 0, 0, 1, 1,
-1.338171, -1.096262, -3.408112, 0, 0, 0, 1, 1,
-1.335844, 0.5609127, -2.386809, 1, 1, 1, 1, 1,
-1.327122, 0.3119958, -2.415648, 1, 1, 1, 1, 1,
-1.321111, -0.8347183, -2.484032, 1, 1, 1, 1, 1,
-1.317409, -0.2466526, -0.382628, 1, 1, 1, 1, 1,
-1.311948, -0.7838394, -1.923255, 1, 1, 1, 1, 1,
-1.306649, -0.05140293, -0.5626613, 1, 1, 1, 1, 1,
-1.302246, 0.9329978, -0.8850427, 1, 1, 1, 1, 1,
-1.299049, -0.8926739, -2.539377, 1, 1, 1, 1, 1,
-1.29348, -0.6926454, -1.883073, 1, 1, 1, 1, 1,
-1.274278, -0.2966375, -2.056492, 1, 1, 1, 1, 1,
-1.271543, 0.3762136, -2.792802, 1, 1, 1, 1, 1,
-1.264858, 0.4540454, -0.9137843, 1, 1, 1, 1, 1,
-1.262449, 0.6073892, -1.049244, 1, 1, 1, 1, 1,
-1.261038, 0.1968315, 0.3285322, 1, 1, 1, 1, 1,
-1.25427, 1.448918, 0.05277773, 1, 1, 1, 1, 1,
-1.243281, -0.3885747, -2.71272, 0, 0, 1, 1, 1,
-1.242231, -0.5849923, -2.266492, 1, 0, 0, 1, 1,
-1.234226, 0.7328839, 0.9048555, 1, 0, 0, 1, 1,
-1.228526, 0.2413581, -2.286929, 1, 0, 0, 1, 1,
-1.224899, -0.290048, -0.9931077, 1, 0, 0, 1, 1,
-1.214239, -1.171616, -2.120023, 1, 0, 0, 1, 1,
-1.20586, -0.3373287, -2.317945, 0, 0, 0, 1, 1,
-1.197951, -0.6488435, 0.02246568, 0, 0, 0, 1, 1,
-1.195536, -1.028466, -2.754128, 0, 0, 0, 1, 1,
-1.195073, -1.358756, -2.533763, 0, 0, 0, 1, 1,
-1.190309, 1.25271, 0.1677961, 0, 0, 0, 1, 1,
-1.184573, 0.5673466, 0.8298784, 0, 0, 0, 1, 1,
-1.176208, 2.49008, -1.014851, 0, 0, 0, 1, 1,
-1.173561, -0.2415471, -1.397551, 1, 1, 1, 1, 1,
-1.172437, 0.7481067, -0.4597534, 1, 1, 1, 1, 1,
-1.142739, -1.00379, -1.820362, 1, 1, 1, 1, 1,
-1.141725, 0.5941907, -0.2304485, 1, 1, 1, 1, 1,
-1.141493, 0.1905315, -2.102061, 1, 1, 1, 1, 1,
-1.136101, 0.6957132, 1.060856, 1, 1, 1, 1, 1,
-1.133626, 1.652057, -0.06941038, 1, 1, 1, 1, 1,
-1.130726, -1.263221, -4.264517, 1, 1, 1, 1, 1,
-1.12734, 0.2718117, -1.737928, 1, 1, 1, 1, 1,
-1.124658, 1.017807, 0.3954033, 1, 1, 1, 1, 1,
-1.120245, -0.5767424, -1.25891, 1, 1, 1, 1, 1,
-1.118725, 0.3833678, -1.590844, 1, 1, 1, 1, 1,
-1.113267, -0.7755203, -2.667115, 1, 1, 1, 1, 1,
-1.108842, -0.1455395, -1.029579, 1, 1, 1, 1, 1,
-1.087985, 0.0377183, -2.134593, 1, 1, 1, 1, 1,
-1.087034, -0.8207107, -0.7319598, 0, 0, 1, 1, 1,
-1.084972, -1.205154, -3.392029, 1, 0, 0, 1, 1,
-1.070942, -0.2444147, -0.7992142, 1, 0, 0, 1, 1,
-1.063722, 0.8207704, 0.8067687, 1, 0, 0, 1, 1,
-1.04088, 0.318038, -0.3151316, 1, 0, 0, 1, 1,
-1.037547, -0.4758546, -2.367887, 1, 0, 0, 1, 1,
-1.024182, 0.02526793, -3.037558, 0, 0, 0, 1, 1,
-1.023412, -0.654686, -1.858152, 0, 0, 0, 1, 1,
-1.022071, 0.8135511, -1.468582, 0, 0, 0, 1, 1,
-1.020852, 0.1731581, -0.1924523, 0, 0, 0, 1, 1,
-1.018447, 0.08592571, -3.241185, 0, 0, 0, 1, 1,
-1.01703, -1.014306, -0.841956, 0, 0, 0, 1, 1,
-1.013371, -1.802971, -2.692987, 0, 0, 0, 1, 1,
-1.002848, -0.2611109, -0.7829806, 1, 1, 1, 1, 1,
-1.00078, -0.9481331, -1.333205, 1, 1, 1, 1, 1,
-0.9987772, 0.9685342, -1.383138, 1, 1, 1, 1, 1,
-0.9980804, -0.6804683, -1.535301, 1, 1, 1, 1, 1,
-0.9925559, -1.728897, -1.772001, 1, 1, 1, 1, 1,
-0.9912168, -0.7386796, -2.223479, 1, 1, 1, 1, 1,
-0.988466, 0.6947507, -1.604126, 1, 1, 1, 1, 1,
-0.9848233, 0.4766322, -1.532626, 1, 1, 1, 1, 1,
-0.9809896, 0.5985526, -1.646934, 1, 1, 1, 1, 1,
-0.9738438, 0.9152571, -1.135346, 1, 1, 1, 1, 1,
-0.9725385, -0.8614179, -0.9190904, 1, 1, 1, 1, 1,
-0.9631752, 0.3483624, -2.821766, 1, 1, 1, 1, 1,
-0.9622756, -0.9598816, -2.036954, 1, 1, 1, 1, 1,
-0.9583809, -0.8361202, -0.9029172, 1, 1, 1, 1, 1,
-0.9575079, -2.491609, -2.781912, 1, 1, 1, 1, 1,
-0.9455515, -0.2236109, -1.553562, 0, 0, 1, 1, 1,
-0.9346561, 0.2578303, -2.038519, 1, 0, 0, 1, 1,
-0.9297286, 0.3690084, -0.2028977, 1, 0, 0, 1, 1,
-0.928699, -1.224515, -3.41399, 1, 0, 0, 1, 1,
-0.9075155, 0.3926574, -0.9960428, 1, 0, 0, 1, 1,
-0.9073295, -1.102257, -5.541212, 1, 0, 0, 1, 1,
-0.8982434, 0.4681514, -1.20342, 0, 0, 0, 1, 1,
-0.8946197, -1.18672, -3.188946, 0, 0, 0, 1, 1,
-0.8813779, -2.144757, -4.495186, 0, 0, 0, 1, 1,
-0.8757355, -0.222779, -2.752742, 0, 0, 0, 1, 1,
-0.8749502, 2.175868, -1.072295, 0, 0, 0, 1, 1,
-0.8529751, 0.5038731, -1.003011, 0, 0, 0, 1, 1,
-0.8500522, -1.49965, -1.005752, 0, 0, 0, 1, 1,
-0.8457867, -0.8354785, -3.041161, 1, 1, 1, 1, 1,
-0.8430792, -0.4017565, -2.189361, 1, 1, 1, 1, 1,
-0.8400854, 1.018279, 1.038633, 1, 1, 1, 1, 1,
-0.8387131, -1.054076, -2.884627, 1, 1, 1, 1, 1,
-0.8383518, -0.3922915, -0.5464118, 1, 1, 1, 1, 1,
-0.8291411, 1.038133, 0.2332229, 1, 1, 1, 1, 1,
-0.8259181, -0.7420305, -2.105062, 1, 1, 1, 1, 1,
-0.8225988, 0.6739466, -1.279185, 1, 1, 1, 1, 1,
-0.8219055, 0.1544317, 0.1503495, 1, 1, 1, 1, 1,
-0.8204778, -2.287772, -3.204736, 1, 1, 1, 1, 1,
-0.8203772, -0.8925732, -4.216348, 1, 1, 1, 1, 1,
-0.8178716, -0.5677726, -1.153189, 1, 1, 1, 1, 1,
-0.8173124, 2.802793, -0.7927241, 1, 1, 1, 1, 1,
-0.8166956, 0.7644794, -1.053782, 1, 1, 1, 1, 1,
-0.8070381, -0.5783042, -1.356333, 1, 1, 1, 1, 1,
-0.8059104, 1.513746, -0.3362299, 0, 0, 1, 1, 1,
-0.8039464, -0.7120506, -0.9373904, 1, 0, 0, 1, 1,
-0.7992071, -0.07574176, -2.857138, 1, 0, 0, 1, 1,
-0.7971856, -0.01751405, -1.831715, 1, 0, 0, 1, 1,
-0.7949758, -1.112973, -3.443259, 1, 0, 0, 1, 1,
-0.7926509, 0.8345457, -0.1840093, 1, 0, 0, 1, 1,
-0.7888837, -0.6509089, -3.865184, 0, 0, 0, 1, 1,
-0.785979, 0.7004508, 0.1982374, 0, 0, 0, 1, 1,
-0.7757013, -0.4110853, -2.548246, 0, 0, 0, 1, 1,
-0.7739405, 1.17807, -2.513097, 0, 0, 0, 1, 1,
-0.7707662, 0.9758465, -1.925301, 0, 0, 0, 1, 1,
-0.7703904, 0.4977654, -0.6227403, 0, 0, 0, 1, 1,
-0.769922, 0.2553208, 0.04710915, 0, 0, 0, 1, 1,
-0.7625017, 1.53106, -0.8821467, 1, 1, 1, 1, 1,
-0.7612353, -1.080142, -2.176025, 1, 1, 1, 1, 1,
-0.7582464, -0.1783009, -0.9454882, 1, 1, 1, 1, 1,
-0.7530393, 1.208481, 0.01551136, 1, 1, 1, 1, 1,
-0.752313, 0.05509055, -1.880502, 1, 1, 1, 1, 1,
-0.7409922, 0.2478888, -0.451002, 1, 1, 1, 1, 1,
-0.7348171, 0.1408864, -1.358618, 1, 1, 1, 1, 1,
-0.7315654, 0.4648631, -3.399078, 1, 1, 1, 1, 1,
-0.7309238, -0.1766565, -0.7496975, 1, 1, 1, 1, 1,
-0.7309019, 0.3522234, 0.7422692, 1, 1, 1, 1, 1,
-0.7244965, -0.5047435, -3.399601, 1, 1, 1, 1, 1,
-0.7235309, 0.7801793, 0.5808801, 1, 1, 1, 1, 1,
-0.7131642, 0.6145371, -0.9937578, 1, 1, 1, 1, 1,
-0.7127658, 0.5470203, -1.033512, 1, 1, 1, 1, 1,
-0.7095442, -0.0346469, -1.820679, 1, 1, 1, 1, 1,
-0.7042987, 0.5183452, -0.2843769, 0, 0, 1, 1, 1,
-0.6974372, -0.1354051, -1.596142, 1, 0, 0, 1, 1,
-0.6953269, 1.136166, -1.202478, 1, 0, 0, 1, 1,
-0.694398, -0.3021292, -2.214211, 1, 0, 0, 1, 1,
-0.6933337, -0.799094, -1.363339, 1, 0, 0, 1, 1,
-0.6915141, -1.934098, -2.25643, 1, 0, 0, 1, 1,
-0.6914112, -0.452993, -3.781839, 0, 0, 0, 1, 1,
-0.68268, 0.9036055, 0.07442459, 0, 0, 0, 1, 1,
-0.6817343, 0.5218424, -0.09399106, 0, 0, 0, 1, 1,
-0.6758172, -0.5149706, -3.882193, 0, 0, 0, 1, 1,
-0.6733332, -0.820311, -2.543391, 0, 0, 0, 1, 1,
-0.6719341, -0.403298, -1.37789, 0, 0, 0, 1, 1,
-0.6710961, -0.7460934, -3.739311, 0, 0, 0, 1, 1,
-0.6705253, 2.47992, 0.4888403, 1, 1, 1, 1, 1,
-0.6643125, -0.8948684, -1.499172, 1, 1, 1, 1, 1,
-0.6638653, 0.7842481, 1.034667, 1, 1, 1, 1, 1,
-0.6616067, 1.837492, -0.3718889, 1, 1, 1, 1, 1,
-0.6612795, -0.8185733, -2.029461, 1, 1, 1, 1, 1,
-0.6579978, -2.063276, -1.445192, 1, 1, 1, 1, 1,
-0.653406, 1.239972, 0.46821, 1, 1, 1, 1, 1,
-0.6531759, -0.2839943, -0.8207307, 1, 1, 1, 1, 1,
-0.6469079, -0.4088399, -3.285536, 1, 1, 1, 1, 1,
-0.6462774, -2.183806, -1.827424, 1, 1, 1, 1, 1,
-0.631671, 2.479622, 0.8350408, 1, 1, 1, 1, 1,
-0.6263838, 0.9592035, -1.082984, 1, 1, 1, 1, 1,
-0.6255068, -2.142764, -2.30034, 1, 1, 1, 1, 1,
-0.6247076, -0.6367772, -1.972818, 1, 1, 1, 1, 1,
-0.620382, 0.3039625, -0.817793, 1, 1, 1, 1, 1,
-0.6157322, -1.951165, -3.439324, 0, 0, 1, 1, 1,
-0.6136782, 0.3193367, -1.366079, 1, 0, 0, 1, 1,
-0.601402, 1.201524, -0.2993895, 1, 0, 0, 1, 1,
-0.6009754, 0.2589581, -0.389209, 1, 0, 0, 1, 1,
-0.5918137, -0.4970683, -2.63641, 1, 0, 0, 1, 1,
-0.5887266, -0.4337445, -2.528035, 1, 0, 0, 1, 1,
-0.5881056, -1.206822, -0.8750899, 0, 0, 0, 1, 1,
-0.587644, 2.223093, 0.2812301, 0, 0, 0, 1, 1,
-0.5855779, -0.7693206, -0.5187671, 0, 0, 0, 1, 1,
-0.5834364, 1.066821, -0.2278161, 0, 0, 0, 1, 1,
-0.580799, -0.4200734, -2.615513, 0, 0, 0, 1, 1,
-0.5769869, -0.400247, -3.854681, 0, 0, 0, 1, 1,
-0.5757343, 0.8141466, -0.8420314, 0, 0, 0, 1, 1,
-0.5690081, 0.04598667, -0.6828765, 1, 1, 1, 1, 1,
-0.5681432, 0.3586814, -0.8027687, 1, 1, 1, 1, 1,
-0.5606226, 0.5719248, 0.04054204, 1, 1, 1, 1, 1,
-0.557075, -0.4330797, -5.089562, 1, 1, 1, 1, 1,
-0.5555364, -0.6881481, -1.590126, 1, 1, 1, 1, 1,
-0.553669, 0.02190902, -0.2394241, 1, 1, 1, 1, 1,
-0.5496202, 1.475373, -0.6142489, 1, 1, 1, 1, 1,
-0.5484767, 0.2766417, -2.675138, 1, 1, 1, 1, 1,
-0.5459696, 0.3202601, 0.02303185, 1, 1, 1, 1, 1,
-0.5435454, -1.313426, -3.944849, 1, 1, 1, 1, 1,
-0.5428811, 0.5008424, -2.575201, 1, 1, 1, 1, 1,
-0.5379677, 1.343127, -0.5011159, 1, 1, 1, 1, 1,
-0.5293627, 1.23371, -0.7150623, 1, 1, 1, 1, 1,
-0.5281096, 1.44116, -0.5712631, 1, 1, 1, 1, 1,
-0.52735, 0.9015082, 0.427443, 1, 1, 1, 1, 1,
-0.5266561, -0.7125875, -1.936698, 0, 0, 1, 1, 1,
-0.5233917, -0.1464709, -2.750188, 1, 0, 0, 1, 1,
-0.5221046, -0.3048881, -3.662122, 1, 0, 0, 1, 1,
-0.5134039, -0.7869421, -1.946009, 1, 0, 0, 1, 1,
-0.5120548, -0.07980467, -1.473528, 1, 0, 0, 1, 1,
-0.5074478, -0.1973615, -1.426458, 1, 0, 0, 1, 1,
-0.5004507, -0.4995689, -2.125524, 0, 0, 0, 1, 1,
-0.492038, -1.481062, -3.47337, 0, 0, 0, 1, 1,
-0.4896209, 0.3883552, 0.05593142, 0, 0, 0, 1, 1,
-0.4847386, -1.507604, -2.671549, 0, 0, 0, 1, 1,
-0.4804099, -1.038186, -3.299819, 0, 0, 0, 1, 1,
-0.4740645, 1.731675, -1.133713, 0, 0, 0, 1, 1,
-0.4717521, -0.3941211, -1.557964, 0, 0, 0, 1, 1,
-0.4708485, 0.1779775, -0.5262381, 1, 1, 1, 1, 1,
-0.4707533, -0.2559595, -0.8374748, 1, 1, 1, 1, 1,
-0.4690876, -0.3816283, -1.936813, 1, 1, 1, 1, 1,
-0.4687647, -0.2289202, -1.94546, 1, 1, 1, 1, 1,
-0.4682175, -0.262686, -0.7700794, 1, 1, 1, 1, 1,
-0.4658354, -0.2063905, -3.096376, 1, 1, 1, 1, 1,
-0.4637018, -1.175517, -3.160086, 1, 1, 1, 1, 1,
-0.4623107, 1.115511, -0.5514969, 1, 1, 1, 1, 1,
-0.4572802, -0.4522447, -1.926817, 1, 1, 1, 1, 1,
-0.4562163, 0.6361967, -0.08541349, 1, 1, 1, 1, 1,
-0.4490656, 0.8504165, -1.756177, 1, 1, 1, 1, 1,
-0.448819, 0.4090861, -2.446031, 1, 1, 1, 1, 1,
-0.4456191, 0.8026249, -0.3354802, 1, 1, 1, 1, 1,
-0.4356288, -1.10425, -1.79827, 1, 1, 1, 1, 1,
-0.4264994, -0.2394916, -0.7352605, 1, 1, 1, 1, 1,
-0.4260546, 0.2680425, -2.643195, 0, 0, 1, 1, 1,
-0.4251758, 0.7478867, 0.1412525, 1, 0, 0, 1, 1,
-0.4248357, -1.377034, -1.417892, 1, 0, 0, 1, 1,
-0.4189159, -0.9083483, -3.868645, 1, 0, 0, 1, 1,
-0.4188794, 0.2795646, -1.495067, 1, 0, 0, 1, 1,
-0.4167565, 0.3612741, 0.152739, 1, 0, 0, 1, 1,
-0.4070398, 1.132757, 0.05380822, 0, 0, 0, 1, 1,
-0.4002218, -0.4150247, -2.204955, 0, 0, 0, 1, 1,
-0.3983176, -0.8627546, -2.133907, 0, 0, 0, 1, 1,
-0.3979111, 2.446638, 0.1243962, 0, 0, 0, 1, 1,
-0.3976995, 0.4718622, 1.114908, 0, 0, 0, 1, 1,
-0.393936, 0.6330038, -1.341061, 0, 0, 0, 1, 1,
-0.3820086, -0.2400235, -3.063354, 0, 0, 0, 1, 1,
-0.3809849, 0.2786728, -0.6092786, 1, 1, 1, 1, 1,
-0.3786131, 0.07840328, 0.7297837, 1, 1, 1, 1, 1,
-0.378133, 0.2502962, -1.043692, 1, 1, 1, 1, 1,
-0.3776843, -0.4562793, -4.059276, 1, 1, 1, 1, 1,
-0.3694042, 0.9097155, 1.141519, 1, 1, 1, 1, 1,
-0.3687323, 1.059726, 1.353635, 1, 1, 1, 1, 1,
-0.3682682, 0.03477186, -0.8174353, 1, 1, 1, 1, 1,
-0.3618879, 2.184579, 0.2933246, 1, 1, 1, 1, 1,
-0.3602544, -0.5588061, -2.634467, 1, 1, 1, 1, 1,
-0.3533394, -0.9522234, -2.545103, 1, 1, 1, 1, 1,
-0.3490617, -0.3035004, -3.316061, 1, 1, 1, 1, 1,
-0.3438583, -2.04156, -1.588384, 1, 1, 1, 1, 1,
-0.3332757, 0.2197147, 0.06226567, 1, 1, 1, 1, 1,
-0.3331979, 3.086218, 0.1476661, 1, 1, 1, 1, 1,
-0.3292, 0.01805125, -0.4008937, 1, 1, 1, 1, 1,
-0.3242282, -0.5430126, -2.664166, 0, 0, 1, 1, 1,
-0.3239292, -1.111977, -3.765036, 1, 0, 0, 1, 1,
-0.3196757, 1.275946, 0.1638797, 1, 0, 0, 1, 1,
-0.3161182, 1.771986, 0.7568428, 1, 0, 0, 1, 1,
-0.3155566, -0.1930546, -0.4773124, 1, 0, 0, 1, 1,
-0.3142096, -0.7901566, -3.584997, 1, 0, 0, 1, 1,
-0.3133588, 0.813653, -2.428573, 0, 0, 0, 1, 1,
-0.3084503, -0.264194, -1.389947, 0, 0, 0, 1, 1,
-0.3080532, -0.1865354, -1.160397, 0, 0, 0, 1, 1,
-0.3076732, -0.8270139, -3.276371, 0, 0, 0, 1, 1,
-0.3054655, -2.124429, -3.39344, 0, 0, 0, 1, 1,
-0.3032663, 0.0594736, -1.180589, 0, 0, 0, 1, 1,
-0.3031014, 0.7772427, 0.6451653, 0, 0, 0, 1, 1,
-0.3016313, -0.6817611, -2.973394, 1, 1, 1, 1, 1,
-0.29923, 0.1685264, -2.802768, 1, 1, 1, 1, 1,
-0.2953287, -1.431229, -2.173008, 1, 1, 1, 1, 1,
-0.2910268, 1.69415, -1.95218, 1, 1, 1, 1, 1,
-0.2890511, 0.6961965, 0.2514314, 1, 1, 1, 1, 1,
-0.28894, -0.3970475, -2.062436, 1, 1, 1, 1, 1,
-0.287937, 0.08368541, -0.920908, 1, 1, 1, 1, 1,
-0.2789184, -0.8353711, -3.072687, 1, 1, 1, 1, 1,
-0.2766904, -0.9658628, -2.865622, 1, 1, 1, 1, 1,
-0.2743867, 0.8364822, -0.525637, 1, 1, 1, 1, 1,
-0.2704263, -0.7694364, -4.932785, 1, 1, 1, 1, 1,
-0.2695938, 0.01156956, -0.7851028, 1, 1, 1, 1, 1,
-0.2693571, -0.06823628, -2.586316, 1, 1, 1, 1, 1,
-0.2686442, -0.9901087, -2.734732, 1, 1, 1, 1, 1,
-0.2654094, -1.365727, -2.097215, 1, 1, 1, 1, 1,
-0.263003, 0.3500785, 0.5513623, 0, 0, 1, 1, 1,
-0.260669, -2.349327, -1.319685, 1, 0, 0, 1, 1,
-0.2569813, -0.3995756, -2.179529, 1, 0, 0, 1, 1,
-0.2541996, 2.575698, -1.537157, 1, 0, 0, 1, 1,
-0.2532226, -1.919273, -2.995018, 1, 0, 0, 1, 1,
-0.2511697, -0.338128, -1.900398, 1, 0, 0, 1, 1,
-0.2449502, 0.7810205, -1.204185, 0, 0, 0, 1, 1,
-0.2401398, -0.7337837, -5.356939, 0, 0, 0, 1, 1,
-0.2397286, -0.5131711, -2.68107, 0, 0, 0, 1, 1,
-0.2392572, 0.2025405, -1.02855, 0, 0, 0, 1, 1,
-0.2337714, -1.648281, -2.898904, 0, 0, 0, 1, 1,
-0.2316488, 0.1831461, 0.6644387, 0, 0, 0, 1, 1,
-0.2315628, 0.9083104, 0.6051167, 0, 0, 0, 1, 1,
-0.2311074, -0.7743666, -3.435485, 1, 1, 1, 1, 1,
-0.229796, -2.580371, -2.796502, 1, 1, 1, 1, 1,
-0.2293393, -1.005684, -2.131913, 1, 1, 1, 1, 1,
-0.2264315, -0.02540269, 0.270148, 1, 1, 1, 1, 1,
-0.2235613, 2.294512, -0.1053998, 1, 1, 1, 1, 1,
-0.2187825, -0.6194056, -2.45991, 1, 1, 1, 1, 1,
-0.2186473, -0.7191393, -1.482064, 1, 1, 1, 1, 1,
-0.2181817, -0.4998449, -1.681256, 1, 1, 1, 1, 1,
-0.2181571, -1.123641, -3.888947, 1, 1, 1, 1, 1,
-0.2138663, -1.808034, -3.822088, 1, 1, 1, 1, 1,
-0.2091021, -0.5904577, -3.420034, 1, 1, 1, 1, 1,
-0.2021876, -0.9468977, -2.077885, 1, 1, 1, 1, 1,
-0.1996683, -2.23003, -3.991991, 1, 1, 1, 1, 1,
-0.19959, 0.2719032, -0.9859481, 1, 1, 1, 1, 1,
-0.1994555, -1.46141, -3.17587, 1, 1, 1, 1, 1,
-0.1977683, 0.6146081, 0.238271, 0, 0, 1, 1, 1,
-0.1975687, -0.212129, -3.193555, 1, 0, 0, 1, 1,
-0.1974728, -1.930718, -2.971537, 1, 0, 0, 1, 1,
-0.1955032, -0.4694237, -2.937871, 1, 0, 0, 1, 1,
-0.1934495, 1.11235, -0.4900067, 1, 0, 0, 1, 1,
-0.1850326, 1.53489, -1.33171, 1, 0, 0, 1, 1,
-0.1824814, 0.6815111, -0.2400976, 0, 0, 0, 1, 1,
-0.1810964, -0.9668815, -2.190193, 0, 0, 0, 1, 1,
-0.1779239, -0.2295355, -1.524995, 0, 0, 0, 1, 1,
-0.1774888, -1.056675, -1.377981, 0, 0, 0, 1, 1,
-0.1729344, -2.232731, -4.132957, 0, 0, 0, 1, 1,
-0.1705241, -0.3672933, -1.426675, 0, 0, 0, 1, 1,
-0.1666651, -0.1856817, -1.629075, 0, 0, 0, 1, 1,
-0.1663211, 1.98026, -0.3829411, 1, 1, 1, 1, 1,
-0.1655553, 1.044811, -0.9771656, 1, 1, 1, 1, 1,
-0.1649814, 0.07206459, -1.911655, 1, 1, 1, 1, 1,
-0.1559281, 0.3794733, 0.9822153, 1, 1, 1, 1, 1,
-0.151667, -1.091575, -2.763993, 1, 1, 1, 1, 1,
-0.1512753, 0.0452578, -2.369392, 1, 1, 1, 1, 1,
-0.1459735, 0.7894856, 0.5787412, 1, 1, 1, 1, 1,
-0.1431074, -0.5304143, -2.129113, 1, 1, 1, 1, 1,
-0.1423921, 0.9146847, -0.2222703, 1, 1, 1, 1, 1,
-0.1407439, -0.3674292, -2.180872, 1, 1, 1, 1, 1,
-0.1407054, 0.4485827, 0.0004454598, 1, 1, 1, 1, 1,
-0.1362041, -1.529404, -3.24371, 1, 1, 1, 1, 1,
-0.1357496, 1.638406, 0.4968537, 1, 1, 1, 1, 1,
-0.1325871, 0.003866673, -2.18639, 1, 1, 1, 1, 1,
-0.1306846, 0.5118383, -0.697232, 1, 1, 1, 1, 1,
-0.1282195, 1.996415, -1.732456, 0, 0, 1, 1, 1,
-0.1272305, -0.7224035, -3.092659, 1, 0, 0, 1, 1,
-0.1252097, -0.6336424, -2.920512, 1, 0, 0, 1, 1,
-0.1243071, -0.3859032, -2.230559, 1, 0, 0, 1, 1,
-0.1218117, -1.486515, -2.513077, 1, 0, 0, 1, 1,
-0.1194389, 0.05619286, 0.6746743, 1, 0, 0, 1, 1,
-0.1165049, 0.08229733, 0.0620654, 0, 0, 0, 1, 1,
-0.1163463, 0.4900548, 0.9050545, 0, 0, 0, 1, 1,
-0.1121587, -0.1666915, -3.041197, 0, 0, 0, 1, 1,
-0.1098684, -1.24387, -1.357326, 0, 0, 0, 1, 1,
-0.1048239, -0.6524855, -3.486381, 0, 0, 0, 1, 1,
-0.1012886, 0.4632895, -0.007331455, 0, 0, 0, 1, 1,
-0.1012374, -0.3991292, -2.64143, 0, 0, 0, 1, 1,
-0.09703325, -0.9431264, -2.957163, 1, 1, 1, 1, 1,
-0.09567907, 0.07421001, -1.273384, 1, 1, 1, 1, 1,
-0.09407063, -0.2609758, -2.948768, 1, 1, 1, 1, 1,
-0.09362877, -1.877727, -3.606225, 1, 1, 1, 1, 1,
-0.09325843, -1.080188, -2.289567, 1, 1, 1, 1, 1,
-0.09104121, 0.2495302, -0.3209276, 1, 1, 1, 1, 1,
-0.08898205, -1.690604, -4.735716, 1, 1, 1, 1, 1,
-0.08820108, -3.207176, -3.309207, 1, 1, 1, 1, 1,
-0.08701389, -0.4498322, -3.184985, 1, 1, 1, 1, 1,
-0.08686782, 1.272779, -0.6514313, 1, 1, 1, 1, 1,
-0.08216788, 1.475989, -1.143578, 1, 1, 1, 1, 1,
-0.07913262, 0.5253285, -1.015083, 1, 1, 1, 1, 1,
-0.0760579, 0.06611393, -0.9002275, 1, 1, 1, 1, 1,
-0.07584617, 0.3907872, 0.6509535, 1, 1, 1, 1, 1,
-0.06258976, -0.319546, -2.693311, 1, 1, 1, 1, 1,
-0.06104734, -0.1332868, -3.965728, 0, 0, 1, 1, 1,
-0.06010597, -1.091672, -1.570578, 1, 0, 0, 1, 1,
-0.05903045, -0.8099489, -2.98177, 1, 0, 0, 1, 1,
-0.05534986, 0.1580655, -1.036827, 1, 0, 0, 1, 1,
-0.05515843, 0.8175471, -0.4269843, 1, 0, 0, 1, 1,
-0.05370558, 0.3126212, 0.2676046, 1, 0, 0, 1, 1,
-0.05085643, -1.158384, -4.065063, 0, 0, 0, 1, 1,
-0.04374529, -1.983361, -3.827293, 0, 0, 0, 1, 1,
-0.04367722, -0.7697073, -3.545932, 0, 0, 0, 1, 1,
-0.04180804, 0.1279705, -0.5667634, 0, 0, 0, 1, 1,
-0.03971834, 0.7138652, -1.616582, 0, 0, 0, 1, 1,
-0.03908024, 0.06829382, -0.8066067, 0, 0, 0, 1, 1,
-0.03769319, 0.5816088, -0.1900819, 0, 0, 0, 1, 1,
-0.03445134, -0.2157483, -1.962899, 1, 1, 1, 1, 1,
-0.03425646, 0.06688349, -0.4967775, 1, 1, 1, 1, 1,
-0.0316119, -1.464616, -5.24192, 1, 1, 1, 1, 1,
-0.03125341, 0.2520528, 0.5758088, 1, 1, 1, 1, 1,
-0.02486513, 0.08558254, -0.983871, 1, 1, 1, 1, 1,
-0.02455906, 0.1727285, -1.161167, 1, 1, 1, 1, 1,
-0.02350464, 1.72736, -0.1452439, 1, 1, 1, 1, 1,
-0.02133793, -2.428728, -2.836346, 1, 1, 1, 1, 1,
-0.01841613, 0.07796106, -1.504401, 1, 1, 1, 1, 1,
-0.01731968, -0.6385573, -3.343708, 1, 1, 1, 1, 1,
-0.01668616, 0.7296923, -0.1083135, 1, 1, 1, 1, 1,
-0.01472032, 0.8369161, -0.4374423, 1, 1, 1, 1, 1,
-0.0116786, -0.05597341, -2.666209, 1, 1, 1, 1, 1,
-0.01145951, -0.351895, -4.050862, 1, 1, 1, 1, 1,
-0.01025395, -0.7107856, -3.993132, 1, 1, 1, 1, 1,
-0.007157506, 2.450817, -1.095716, 0, 0, 1, 1, 1,
-0.006068805, 1.275738, -0.2935881, 1, 0, 0, 1, 1,
-0.00393656, -0.3875383, -2.684127, 1, 0, 0, 1, 1,
-0.003479937, 0.6340801, 0.488257, 1, 0, 0, 1, 1,
0.000164248, -1.779218, 3.130436, 1, 0, 0, 1, 1,
0.006044316, 1.097935, -0.8820699, 1, 0, 0, 1, 1,
0.007264555, 0.9567642, -0.3496144, 0, 0, 0, 1, 1,
0.008972582, -0.3685589, 3.555387, 0, 0, 0, 1, 1,
0.01031303, 0.3802677, 1.558532, 0, 0, 0, 1, 1,
0.01232302, 1.865372, -0.3413168, 0, 0, 0, 1, 1,
0.01232605, -1.60947, 2.328869, 0, 0, 0, 1, 1,
0.01259369, -0.3575866, 2.015447, 0, 0, 0, 1, 1,
0.01453888, -0.5857759, 5.005321, 0, 0, 0, 1, 1,
0.02187434, -0.4188999, 3.952358, 1, 1, 1, 1, 1,
0.02315457, -0.1281185, 3.556871, 1, 1, 1, 1, 1,
0.03391417, -0.3739584, 3.005997, 1, 1, 1, 1, 1,
0.03456229, 1.372141, -0.7976235, 1, 1, 1, 1, 1,
0.04255042, 0.5871961, 0.623863, 1, 1, 1, 1, 1,
0.04297563, -0.1513006, 2.27368, 1, 1, 1, 1, 1,
0.04352109, -0.4783525, 1.938843, 1, 1, 1, 1, 1,
0.04487279, 0.9311318, -0.3411971, 1, 1, 1, 1, 1,
0.0475781, 0.2458143, 0.1279864, 1, 1, 1, 1, 1,
0.04859533, -0.6298835, 2.660383, 1, 1, 1, 1, 1,
0.0523296, 0.2493694, -0.2196135, 1, 1, 1, 1, 1,
0.05705718, -0.1111217, 1.322304, 1, 1, 1, 1, 1,
0.05950103, -0.9969831, 3.104151, 1, 1, 1, 1, 1,
0.06023479, 0.1209491, 0.1816071, 1, 1, 1, 1, 1,
0.0655479, 1.496196, -0.9493089, 1, 1, 1, 1, 1,
0.07060061, 0.1905584, 0.1242812, 0, 0, 1, 1, 1,
0.07229565, -0.4427962, 2.251698, 1, 0, 0, 1, 1,
0.07244337, -0.5285093, 1.888875, 1, 0, 0, 1, 1,
0.07534871, 0.3265415, -1.857437, 1, 0, 0, 1, 1,
0.08013929, -0.5958984, 3.391532, 1, 0, 0, 1, 1,
0.0816262, 0.3919803, 0.01821492, 1, 0, 0, 1, 1,
0.08164275, 0.5445634, 0.7044426, 0, 0, 0, 1, 1,
0.08221013, -0.5344104, 4.081667, 0, 0, 0, 1, 1,
0.08302765, -0.8968583, 2.781591, 0, 0, 0, 1, 1,
0.08604354, 0.819529, -0.5149534, 0, 0, 0, 1, 1,
0.08878931, -0.08319388, 3.018864, 0, 0, 0, 1, 1,
0.09081219, -0.5308204, 1.468781, 0, 0, 0, 1, 1,
0.09082244, -0.2498184, 3.4119, 0, 0, 0, 1, 1,
0.09109378, -0.5045277, 4.125168, 1, 1, 1, 1, 1,
0.09522927, -1.052323, 0.5909743, 1, 1, 1, 1, 1,
0.09603592, -0.5918955, 3.820447, 1, 1, 1, 1, 1,
0.09611075, 0.1617239, 1.249797, 1, 1, 1, 1, 1,
0.1014186, -0.6819988, 2.438185, 1, 1, 1, 1, 1,
0.1031446, -1.120177, 1.580068, 1, 1, 1, 1, 1,
0.1057767, -0.2216637, 2.972849, 1, 1, 1, 1, 1,
0.1080233, -0.4770832, 3.775376, 1, 1, 1, 1, 1,
0.1104011, 1.155156, 1.377817, 1, 1, 1, 1, 1,
0.1125136, -0.006812744, 1.571491, 1, 1, 1, 1, 1,
0.1161815, -1.471696, 3.07702, 1, 1, 1, 1, 1,
0.1192802, -0.0262001, 2.303607, 1, 1, 1, 1, 1,
0.1246732, 0.3955619, -0.9828199, 1, 1, 1, 1, 1,
0.1253823, 0.5755289, 0.9328768, 1, 1, 1, 1, 1,
0.1291815, 1.115086, -0.2404287, 1, 1, 1, 1, 1,
0.1300294, 0.6878536, -0.2510855, 0, 0, 1, 1, 1,
0.1395717, -0.4458752, 3.383365, 1, 0, 0, 1, 1,
0.1411138, 0.2401213, 0.8260032, 1, 0, 0, 1, 1,
0.1480657, 1.215833, 1.941659, 1, 0, 0, 1, 1,
0.1485488, -0.2494896, 2.606936, 1, 0, 0, 1, 1,
0.1542557, 0.7818779, 2.851786, 1, 0, 0, 1, 1,
0.1570034, -0.4337556, 1.425547, 0, 0, 0, 1, 1,
0.1654299, 0.8633352, -0.8058424, 0, 0, 0, 1, 1,
0.1666776, -1.520707, 2.393715, 0, 0, 0, 1, 1,
0.1667196, -1.944424, 2.671069, 0, 0, 0, 1, 1,
0.1717889, -0.7103248, 1.035391, 0, 0, 0, 1, 1,
0.1724923, -0.4925684, 4.008511, 0, 0, 0, 1, 1,
0.176358, -1.883067, 4.093514, 0, 0, 0, 1, 1,
0.1862158, 1.554458, -0.09937814, 1, 1, 1, 1, 1,
0.1872906, 0.8485943, 0.2989884, 1, 1, 1, 1, 1,
0.1932287, -0.6341309, 1.029177, 1, 1, 1, 1, 1,
0.1949023, 0.2089955, 0.4028285, 1, 1, 1, 1, 1,
0.1950126, 0.6274892, 0.7695448, 1, 1, 1, 1, 1,
0.1996585, 1.96674, 2.038545, 1, 1, 1, 1, 1,
0.2018488, 0.02723464, 0.7016864, 1, 1, 1, 1, 1,
0.2018552, 0.60799, -0.6168878, 1, 1, 1, 1, 1,
0.2091324, -0.8277808, 0.5705383, 1, 1, 1, 1, 1,
0.2112771, -0.08328572, 2.141419, 1, 1, 1, 1, 1,
0.2151426, -0.3384877, 3.605498, 1, 1, 1, 1, 1,
0.2206972, 0.1136592, 1.348624, 1, 1, 1, 1, 1,
0.2235891, 1.477505, -0.1014214, 1, 1, 1, 1, 1,
0.2325384, -0.9907864, 3.751265, 1, 1, 1, 1, 1,
0.2343731, 0.289553, 1.674114, 1, 1, 1, 1, 1,
0.2362479, 0.5898776, -0.7153012, 0, 0, 1, 1, 1,
0.2364404, -0.08229393, 0.05578298, 1, 0, 0, 1, 1,
0.237353, -1.89209, 2.779792, 1, 0, 0, 1, 1,
0.2382273, -0.02104944, 1.539541, 1, 0, 0, 1, 1,
0.244513, 0.2287564, 0.7413499, 1, 0, 0, 1, 1,
0.2449337, 1.080649, -0.8832227, 1, 0, 0, 1, 1,
0.2513113, 2.512946, 1.955707, 0, 0, 0, 1, 1,
0.2521576, 0.3772733, 0.01006616, 0, 0, 0, 1, 1,
0.2523261, 0.7282294, -0.06172297, 0, 0, 0, 1, 1,
0.2552274, -2.360812, 3.001202, 0, 0, 0, 1, 1,
0.257215, 1.394454, 0.03345855, 0, 0, 0, 1, 1,
0.2577568, 0.01100319, 0.9435456, 0, 0, 0, 1, 1,
0.2618222, 1.042262, 0.01629335, 0, 0, 0, 1, 1,
0.26192, -0.3623672, 2.377991, 1, 1, 1, 1, 1,
0.2629825, -0.7698314, 2.469229, 1, 1, 1, 1, 1,
0.2640178, 0.9490719, 1.187947, 1, 1, 1, 1, 1,
0.2643424, -0.3461534, 2.555601, 1, 1, 1, 1, 1,
0.2680604, -1.178276, 3.300347, 1, 1, 1, 1, 1,
0.2685609, -0.916239, 3.176258, 1, 1, 1, 1, 1,
0.271478, -2.403757, 2.476421, 1, 1, 1, 1, 1,
0.2716441, 0.208746, 2.054953, 1, 1, 1, 1, 1,
0.2730963, -0.150028, 1.504972, 1, 1, 1, 1, 1,
0.2743019, 1.310247, -0.6256064, 1, 1, 1, 1, 1,
0.2770793, -0.1617264, 2.895217, 1, 1, 1, 1, 1,
0.2774308, -1.049178, 3.294495, 1, 1, 1, 1, 1,
0.2782647, 0.1925081, 0.7017711, 1, 1, 1, 1, 1,
0.2793672, -0.5588674, 2.099173, 1, 1, 1, 1, 1,
0.2805068, -1.423789, 3.615846, 1, 1, 1, 1, 1,
0.2827018, 1.054178, 0.0835091, 0, 0, 1, 1, 1,
0.2847347, 0.2281244, 0.6220812, 1, 0, 0, 1, 1,
0.2852833, 0.1058889, 0.7052919, 1, 0, 0, 1, 1,
0.2867377, -0.9745923, 3.857767, 1, 0, 0, 1, 1,
0.2926077, -0.7023562, 3.50801, 1, 0, 0, 1, 1,
0.2945937, -1.05955, 2.227362, 1, 0, 0, 1, 1,
0.2969888, 0.4739562, 0.1345152, 0, 0, 0, 1, 1,
0.2999322, 0.1891965, 0.8935491, 0, 0, 0, 1, 1,
0.3019338, -0.2158248, 1.429867, 0, 0, 0, 1, 1,
0.3037112, 0.2559751, -0.3773836, 0, 0, 0, 1, 1,
0.3037651, 0.803411, -0.6540898, 0, 0, 0, 1, 1,
0.3071161, -0.4072689, 3.286782, 0, 0, 0, 1, 1,
0.3120827, -1.741046, 2.494627, 0, 0, 0, 1, 1,
0.3123732, -0.334335, 2.372145, 1, 1, 1, 1, 1,
0.3132912, 0.9157909, -0.2213822, 1, 1, 1, 1, 1,
0.3156343, -1.105078, 1.985081, 1, 1, 1, 1, 1,
0.316817, 1.834032, -0.3885048, 1, 1, 1, 1, 1,
0.319868, 0.03892391, 3.156705, 1, 1, 1, 1, 1,
0.3227736, 0.6006257, 2.054381, 1, 1, 1, 1, 1,
0.3233189, 1.614768, 0.4544137, 1, 1, 1, 1, 1,
0.3254631, 0.1831363, 1.255904, 1, 1, 1, 1, 1,
0.3261441, 0.7007304, -0.293034, 1, 1, 1, 1, 1,
0.3270734, 0.3582932, 0.4036031, 1, 1, 1, 1, 1,
0.3273681, -0.784501, 2.641331, 1, 1, 1, 1, 1,
0.3275971, 1.502764, 0.01619654, 1, 1, 1, 1, 1,
0.3286051, -0.7986315, 2.460735, 1, 1, 1, 1, 1,
0.3292888, 0.8947566, 0.1458939, 1, 1, 1, 1, 1,
0.3318715, -0.4247397, 1.933136, 1, 1, 1, 1, 1,
0.335569, 0.4436275, 1.341519, 0, 0, 1, 1, 1,
0.3358081, -0.6667826, 1.758724, 1, 0, 0, 1, 1,
0.3412299, -1.998925, 3.752637, 1, 0, 0, 1, 1,
0.3437804, 0.572114, 0.8121558, 1, 0, 0, 1, 1,
0.3477336, -0.1425135, 1.558553, 1, 0, 0, 1, 1,
0.3510209, 0.2116473, 0.4596949, 1, 0, 0, 1, 1,
0.3521531, -0.190346, 2.261425, 0, 0, 0, 1, 1,
0.3537152, -0.4975342, 2.679904, 0, 0, 0, 1, 1,
0.3594815, 1.503574, 1.69137, 0, 0, 0, 1, 1,
0.3613759, 0.7486603, -0.5731813, 0, 0, 0, 1, 1,
0.363053, 1.841533, 1.091713, 0, 0, 0, 1, 1,
0.3640066, 1.039326, -0.1063387, 0, 0, 0, 1, 1,
0.3676769, 1.867391, -0.1025927, 0, 0, 0, 1, 1,
0.3694632, 2.137103, 1.259225, 1, 1, 1, 1, 1,
0.3702694, 1.044407, 0.866221, 1, 1, 1, 1, 1,
0.3735575, -2.584979, 4.699956, 1, 1, 1, 1, 1,
0.3763574, 0.66289, -0.3680364, 1, 1, 1, 1, 1,
0.3784277, 0.3417196, 1.29082, 1, 1, 1, 1, 1,
0.3812551, 0.3232189, 1.927323, 1, 1, 1, 1, 1,
0.3826558, 0.2496396, 0.194395, 1, 1, 1, 1, 1,
0.3827023, -1.705028, 3.992575, 1, 1, 1, 1, 1,
0.3839425, -1.306564, 2.501364, 1, 1, 1, 1, 1,
0.3944144, 1.111808, 1.166355, 1, 1, 1, 1, 1,
0.3964693, 0.004722861, 1.203969, 1, 1, 1, 1, 1,
0.4010073, 0.2535651, 1.101944, 1, 1, 1, 1, 1,
0.4015475, 0.0843645, 1.850745, 1, 1, 1, 1, 1,
0.410992, 0.6044177, 1.014384, 1, 1, 1, 1, 1,
0.4157889, -1.818033, 3.516562, 1, 1, 1, 1, 1,
0.418473, 0.902523, -1.119346, 0, 0, 1, 1, 1,
0.4202977, 1.345747, 1.859494, 1, 0, 0, 1, 1,
0.4205339, 0.7310498, -0.02245203, 1, 0, 0, 1, 1,
0.421152, -0.4216538, 3.126811, 1, 0, 0, 1, 1,
0.4303665, -0.1208812, 0.9985759, 1, 0, 0, 1, 1,
0.434087, 0.6881279, 2.343875, 1, 0, 0, 1, 1,
0.4345126, -1.137822, 3.394117, 0, 0, 0, 1, 1,
0.4363988, 0.8764428, -0.3123658, 0, 0, 0, 1, 1,
0.4392742, 1.334552, 0.5398827, 0, 0, 0, 1, 1,
0.4453795, -0.453359, 2.364107, 0, 0, 0, 1, 1,
0.448243, 0.1040558, 0.3335983, 0, 0, 0, 1, 1,
0.4491292, 1.725222, -0.05296462, 0, 0, 0, 1, 1,
0.4495642, 0.3655946, 1.857439, 0, 0, 0, 1, 1,
0.4499948, -1.019198, 1.46105, 1, 1, 1, 1, 1,
0.4551846, -0.618265, 2.313574, 1, 1, 1, 1, 1,
0.4566326, 0.5161551, -0.2561736, 1, 1, 1, 1, 1,
0.4580714, 2.84053, -0.8821686, 1, 1, 1, 1, 1,
0.4589047, 0.6890812, 0.9580941, 1, 1, 1, 1, 1,
0.4607157, 0.1927663, 2.06195, 1, 1, 1, 1, 1,
0.4669557, 0.1765823, 1.497666, 1, 1, 1, 1, 1,
0.4670523, -2.50747, 1.935046, 1, 1, 1, 1, 1,
0.468747, 0.8026235, 1.645042, 1, 1, 1, 1, 1,
0.471619, 1.065231, 0.3556343, 1, 1, 1, 1, 1,
0.4724461, 1.250974, 2.256649, 1, 1, 1, 1, 1,
0.4773239, -0.8141772, 1.918337, 1, 1, 1, 1, 1,
0.4784032, 1.980931, 0.4825329, 1, 1, 1, 1, 1,
0.4825515, -1.061139, 2.759883, 1, 1, 1, 1, 1,
0.4889096, -0.5798358, 1.865218, 1, 1, 1, 1, 1,
0.4890588, 0.5812815, -1.054346, 0, 0, 1, 1, 1,
0.489586, 1.79409, 1.786772, 1, 0, 0, 1, 1,
0.490649, -0.7343984, 3.032902, 1, 0, 0, 1, 1,
0.4914485, -0.333097, 1.349261, 1, 0, 0, 1, 1,
0.4920454, 0.124706, 2.823556, 1, 0, 0, 1, 1,
0.4983722, -1.204521, 0.9382668, 1, 0, 0, 1, 1,
0.4990704, 0.3296302, 0.8084534, 0, 0, 0, 1, 1,
0.4994049, -0.5403901, 1.738381, 0, 0, 0, 1, 1,
0.5013604, 1.178893, -0.7414755, 0, 0, 0, 1, 1,
0.5035197, 0.7013062, -0.6417735, 0, 0, 0, 1, 1,
0.506449, 0.6952484, -0.523869, 0, 0, 0, 1, 1,
0.508238, 0.06774085, 0.7415997, 0, 0, 0, 1, 1,
0.5084101, -1.124245, 3.16512, 0, 0, 0, 1, 1,
0.5085086, 1.388252, -1.486944, 1, 1, 1, 1, 1,
0.5203373, 0.2798605, 0.2662888, 1, 1, 1, 1, 1,
0.5237318, 0.4444058, -0.2128038, 1, 1, 1, 1, 1,
0.5272758, 0.3216538, 1.531214, 1, 1, 1, 1, 1,
0.5278794, -1.003248, 2.810571, 1, 1, 1, 1, 1,
0.5340327, 0.4529828, 1.248579, 1, 1, 1, 1, 1,
0.5380163, -0.5939533, 2.345378, 1, 1, 1, 1, 1,
0.5411116, 1.676596, -0.6288648, 1, 1, 1, 1, 1,
0.5444916, -0.3419916, 1.535085, 1, 1, 1, 1, 1,
0.5459366, -1.221084, 3.804413, 1, 1, 1, 1, 1,
0.5494006, -1.299516, 3.9234, 1, 1, 1, 1, 1,
0.549514, 0.6487384, 2.381793, 1, 1, 1, 1, 1,
0.5518407, 0.8116638, 1.377414, 1, 1, 1, 1, 1,
0.5534373, -1.195693, 3.613354, 1, 1, 1, 1, 1,
0.5587613, -0.6783763, 3.996694, 1, 1, 1, 1, 1,
0.559825, -0.5561151, 2.652097, 0, 0, 1, 1, 1,
0.5610626, 0.1982891, -0.09140301, 1, 0, 0, 1, 1,
0.5622816, -0.5154757, 1.114959, 1, 0, 0, 1, 1,
0.5640977, -1.54359, 2.460551, 1, 0, 0, 1, 1,
0.5672516, -0.6553819, 2.004288, 1, 0, 0, 1, 1,
0.5672567, -0.6998073, 2.351229, 1, 0, 0, 1, 1,
0.5700824, 1.438123, 1.684179, 0, 0, 0, 1, 1,
0.5735086, 0.5109504, 1.26037, 0, 0, 0, 1, 1,
0.5780423, -0.25433, 2.47843, 0, 0, 0, 1, 1,
0.5780957, 0.01392357, 0.5206222, 0, 0, 0, 1, 1,
0.5818154, 1.920885, 1.885888, 0, 0, 0, 1, 1,
0.5984306, 0.4736034, -1.192183, 0, 0, 0, 1, 1,
0.6003391, 0.5711175, 0.4111768, 0, 0, 0, 1, 1,
0.6018153, -0.4124514, 3.423922, 1, 1, 1, 1, 1,
0.6020293, -0.5127721, 3.295734, 1, 1, 1, 1, 1,
0.6034132, 0.2979877, 0.2943658, 1, 1, 1, 1, 1,
0.6108623, -0.1206682, 1.934584, 1, 1, 1, 1, 1,
0.6147028, -1.317919, 1.18386, 1, 1, 1, 1, 1,
0.616967, 1.761227, 0.6683799, 1, 1, 1, 1, 1,
0.6210022, 0.4251372, 1.343916, 1, 1, 1, 1, 1,
0.6210852, -0.1489076, 1.072038, 1, 1, 1, 1, 1,
0.6211035, -0.9089298, 3.104672, 1, 1, 1, 1, 1,
0.6232646, -1.10564, 0.2660719, 1, 1, 1, 1, 1,
0.6235988, 0.5905441, 2.534582, 1, 1, 1, 1, 1,
0.6276928, -1.826624, 2.845653, 1, 1, 1, 1, 1,
0.6302875, 0.3835783, 0.7167597, 1, 1, 1, 1, 1,
0.6323838, 1.799673, 0.8572569, 1, 1, 1, 1, 1,
0.6331826, 0.4714035, 1.058643, 1, 1, 1, 1, 1,
0.6400176, 0.9670457, -0.3591236, 0, 0, 1, 1, 1,
0.6437888, -2.009958, 3.828066, 1, 0, 0, 1, 1,
0.6438057, 2.165563, 2.159303, 1, 0, 0, 1, 1,
0.6441844, -0.3121647, 2.211277, 1, 0, 0, 1, 1,
0.6465352, -0.9608086, 1.151543, 1, 0, 0, 1, 1,
0.6479343, -0.590757, 2.648398, 1, 0, 0, 1, 1,
0.6492982, 0.0146545, 1.398509, 0, 0, 0, 1, 1,
0.6524001, 1.708146, -1.359222, 0, 0, 0, 1, 1,
0.6548735, 4.213812, -0.2796025, 0, 0, 0, 1, 1,
0.6555914, -0.8754062, 2.190525, 0, 0, 0, 1, 1,
0.6567984, 2.009004, -1.009271, 0, 0, 0, 1, 1,
0.6694654, -0.4309164, 1.507202, 0, 0, 0, 1, 1,
0.6699079, 0.2531894, 1.404374, 0, 0, 0, 1, 1,
0.6705315, -1.77361, 2.551679, 1, 1, 1, 1, 1,
0.6734374, -0.5004292, 0.09681999, 1, 1, 1, 1, 1,
0.675523, 1.961459, 0.3789252, 1, 1, 1, 1, 1,
0.6761361, -0.3588543, 2.885417, 1, 1, 1, 1, 1,
0.6811045, 0.7653815, 2.178123, 1, 1, 1, 1, 1,
0.6812607, -0.614512, 2.996533, 1, 1, 1, 1, 1,
0.6824771, -0.0208096, 2.086831, 1, 1, 1, 1, 1,
0.6840145, -1.079557, 1.263987, 1, 1, 1, 1, 1,
0.6855831, -1.929551, 1.943474, 1, 1, 1, 1, 1,
0.6855899, 1.090488, 0.3765186, 1, 1, 1, 1, 1,
0.6875349, -1.36234, 2.870503, 1, 1, 1, 1, 1,
0.6922401, -0.5965528, 3.290905, 1, 1, 1, 1, 1,
0.7003887, -0.4657116, 1.872738, 1, 1, 1, 1, 1,
0.7016687, 0.08134444, 1.765785, 1, 1, 1, 1, 1,
0.7060738, 2.18646, 1.845476, 1, 1, 1, 1, 1,
0.7107813, 0.2170862, 0.6347998, 0, 0, 1, 1, 1,
0.7167841, 0.8746511, 1.454694, 1, 0, 0, 1, 1,
0.7266667, -0.1908876, 2.964331, 1, 0, 0, 1, 1,
0.7290634, 0.4165245, -0.7356775, 1, 0, 0, 1, 1,
0.7320524, 0.09457372, 0.6579024, 1, 0, 0, 1, 1,
0.7329298, -0.1348584, 2.694492, 1, 0, 0, 1, 1,
0.736523, 2.121506, 1.180331, 0, 0, 0, 1, 1,
0.737834, -1.389644, 1.980755, 0, 0, 0, 1, 1,
0.739314, 2.085056, -1.675412, 0, 0, 0, 1, 1,
0.7410774, -0.2688639, 0.6613926, 0, 0, 0, 1, 1,
0.749294, 0.2059666, 0.8105345, 0, 0, 0, 1, 1,
0.7555146, 1.616511, 1.600778, 0, 0, 0, 1, 1,
0.7580355, 0.7090284, -0.5243965, 0, 0, 0, 1, 1,
0.7589227, -0.1484501, 2.066566, 1, 1, 1, 1, 1,
0.7601244, -0.3547248, 0.5890683, 1, 1, 1, 1, 1,
0.760458, -0.5605612, 2.685168, 1, 1, 1, 1, 1,
0.762334, -1.697114, 2.023631, 1, 1, 1, 1, 1,
0.7722248, -0.3339844, 2.261372, 1, 1, 1, 1, 1,
0.7747159, 1.910205, 0.9026923, 1, 1, 1, 1, 1,
0.778293, -1.56639, 3.109632, 1, 1, 1, 1, 1,
0.7785526, -0.9695444, 3.59463, 1, 1, 1, 1, 1,
0.7797324, -2.213608, 4.360582, 1, 1, 1, 1, 1,
0.780565, -0.08326118, 2.339375, 1, 1, 1, 1, 1,
0.7845874, -1.604876, 1.513574, 1, 1, 1, 1, 1,
0.7876732, -1.255212, 2.449657, 1, 1, 1, 1, 1,
0.7937106, -0.2629832, 2.24801, 1, 1, 1, 1, 1,
0.7997606, -0.5891295, 1.88844, 1, 1, 1, 1, 1,
0.8009369, -0.05510414, 2.350339, 1, 1, 1, 1, 1,
0.8035553, 1.717421, 1.968033, 0, 0, 1, 1, 1,
0.8064935, -0.1947785, 1.942744, 1, 0, 0, 1, 1,
0.8115261, 1.011934, -0.1035084, 1, 0, 0, 1, 1,
0.816787, -0.1126628, 1.003967, 1, 0, 0, 1, 1,
0.823972, -0.01621139, 1.076605, 1, 0, 0, 1, 1,
0.825469, 1.068202, 1.942023, 1, 0, 0, 1, 1,
0.8273568, -0.1996323, 2.174605, 0, 0, 0, 1, 1,
0.8357739, -0.62665, 0.4331469, 0, 0, 0, 1, 1,
0.8397378, 0.1634447, 2.469478, 0, 0, 0, 1, 1,
0.8422904, -0.586745, 0.04137682, 0, 0, 0, 1, 1,
0.8439333, 1.576508, 0.3104897, 0, 0, 0, 1, 1,
0.8460904, -1.109241, 2.565444, 0, 0, 0, 1, 1,
0.8479871, -0.8916367, 1.657066, 0, 0, 0, 1, 1,
0.8489895, -0.6955218, 2.262514, 1, 1, 1, 1, 1,
0.858776, 1.118222, 2.437772, 1, 1, 1, 1, 1,
0.862266, -0.8599936, 3.355244, 1, 1, 1, 1, 1,
0.8641073, -0.4675661, 2.34568, 1, 1, 1, 1, 1,
0.8645066, -0.8344715, 3.276648, 1, 1, 1, 1, 1,
0.8660568, 0.2726781, 1.799563, 1, 1, 1, 1, 1,
0.8717997, -0.1174037, 2.310102, 1, 1, 1, 1, 1,
0.8738603, -0.1961144, 2.108026, 1, 1, 1, 1, 1,
0.8762568, 0.5898835, 1.996023, 1, 1, 1, 1, 1,
0.8789963, 0.1084308, 0.6281176, 1, 1, 1, 1, 1,
0.8828102, -0.7918066, -0.3352245, 1, 1, 1, 1, 1,
0.8858699, -0.4049966, 4.282359, 1, 1, 1, 1, 1,
0.8862969, -0.7827501, 2.166733, 1, 1, 1, 1, 1,
0.8875703, -1.310253, 3.031798, 1, 1, 1, 1, 1,
0.897842, 0.00966306, 2.976789, 1, 1, 1, 1, 1,
0.8999583, 0.3773285, 1.734704, 0, 0, 1, 1, 1,
0.9011372, 0.5386708, 1.22878, 1, 0, 0, 1, 1,
0.9023868, 0.02532957, 0.590959, 1, 0, 0, 1, 1,
0.9107468, 1.635368, 3.110892, 1, 0, 0, 1, 1,
0.9165334, 0.1250574, 2.2685, 1, 0, 0, 1, 1,
0.9167231, 1.134556, 1.925084, 1, 0, 0, 1, 1,
0.9167683, 0.1038325, 2.471784, 0, 0, 0, 1, 1,
0.9213309, 0.3473178, 0.1451086, 0, 0, 0, 1, 1,
0.9241791, 0.2578257, 2.160366, 0, 0, 0, 1, 1,
0.9287757, -0.8489513, 1.090443, 0, 0, 0, 1, 1,
0.931127, -1.364909, 3.209168, 0, 0, 0, 1, 1,
0.9346794, 0.7604954, 1.690562, 0, 0, 0, 1, 1,
0.9371449, 0.9135143, 0.5641631, 0, 0, 0, 1, 1,
0.9381109, -1.266825, 3.059091, 1, 1, 1, 1, 1,
0.9470051, 0.408856, 0.5541504, 1, 1, 1, 1, 1,
0.9506764, 0.3268776, 1.584113, 1, 1, 1, 1, 1,
0.9608315, 0.5995295, -0.9437923, 1, 1, 1, 1, 1,
0.9611812, -0.1155722, 1.179077, 1, 1, 1, 1, 1,
0.9634935, -0.2861714, 1.31419, 1, 1, 1, 1, 1,
0.967261, 0.08348723, 1.09216, 1, 1, 1, 1, 1,
0.9746137, 0.133207, 1.184515, 1, 1, 1, 1, 1,
0.9812894, 1.503146, -0.741418, 1, 1, 1, 1, 1,
0.9860303, -0.9597275, 3.316798, 1, 1, 1, 1, 1,
0.9872326, -0.7470466, 2.140047, 1, 1, 1, 1, 1,
0.9891264, 1.515429, 0.4653282, 1, 1, 1, 1, 1,
0.9904456, 0.03544377, 0.1488416, 1, 1, 1, 1, 1,
0.9923015, 1.313401, -0.7054151, 1, 1, 1, 1, 1,
1.002426, -0.05630454, 1.566749, 1, 1, 1, 1, 1,
1.007252, -0.4417433, 2.116999, 0, 0, 1, 1, 1,
1.010936, 0.7865661, 0.5842363, 1, 0, 0, 1, 1,
1.016116, 1.207138, 1.291334, 1, 0, 0, 1, 1,
1.022387, 1.273217, 1.263865, 1, 0, 0, 1, 1,
1.023828, 1.157132, 0.6120415, 1, 0, 0, 1, 1,
1.024372, 1.036462, 2.167642, 1, 0, 0, 1, 1,
1.028558, -0.2002441, 2.893454, 0, 0, 0, 1, 1,
1.032684, -0.1124944, 2.736063, 0, 0, 0, 1, 1,
1.035191, 1.062089, 1.28851, 0, 0, 0, 1, 1,
1.045977, 0.3529832, 2.549854, 0, 0, 0, 1, 1,
1.046743, 0.4466842, 1.131553, 0, 0, 0, 1, 1,
1.048665, -0.2648496, 2.200026, 0, 0, 0, 1, 1,
1.049939, -0.1214126, 0.8167949, 0, 0, 0, 1, 1,
1.05678, -0.2090698, 1.83983, 1, 1, 1, 1, 1,
1.05793, -0.03253227, 2.1935, 1, 1, 1, 1, 1,
1.064703, -0.7270182, 1.725525, 1, 1, 1, 1, 1,
1.077754, -0.1172918, -0.8617151, 1, 1, 1, 1, 1,
1.087284, -2.444592, 2.864342, 1, 1, 1, 1, 1,
1.099431, -0.1791433, 1.566248, 1, 1, 1, 1, 1,
1.101717, -1.59671, 2.606027, 1, 1, 1, 1, 1,
1.11191, 0.9824657, 2.017372, 1, 1, 1, 1, 1,
1.116839, 0.263345, 1.925125, 1, 1, 1, 1, 1,
1.120572, 0.2384517, -0.5265294, 1, 1, 1, 1, 1,
1.126178, -0.8366894, 3.559259, 1, 1, 1, 1, 1,
1.129251, 1.035082, 0.06645653, 1, 1, 1, 1, 1,
1.133666, -0.7208053, 1.113302, 1, 1, 1, 1, 1,
1.134143, 0.4044553, 2.372874, 1, 1, 1, 1, 1,
1.135616, 1.250866, 1.682234, 1, 1, 1, 1, 1,
1.13889, -0.7000099, 2.167446, 0, 0, 1, 1, 1,
1.139947, 1.279617, 0.5523741, 1, 0, 0, 1, 1,
1.145441, -0.290646, 1.979807, 1, 0, 0, 1, 1,
1.150358, -0.9907325, 1.71478, 1, 0, 0, 1, 1,
1.151352, 0.6042782, 2.352779, 1, 0, 0, 1, 1,
1.162083, -1.56412, 3.383641, 1, 0, 0, 1, 1,
1.165177, -1.450698, 1.490258, 0, 0, 0, 1, 1,
1.166926, 0.1521054, 3.580736, 0, 0, 0, 1, 1,
1.166971, 1.436453, 1.56223, 0, 0, 0, 1, 1,
1.168468, -0.5038967, 3.159655, 0, 0, 0, 1, 1,
1.17602, 2.401639, 0.1721906, 0, 0, 0, 1, 1,
1.19952, -0.469107, 3.238343, 0, 0, 0, 1, 1,
1.224306, 0.5612596, 2.251949, 0, 0, 0, 1, 1,
1.226348, 0.7362549, 2.74399, 1, 1, 1, 1, 1,
1.229511, 0.8102574, -0.3317313, 1, 1, 1, 1, 1,
1.240654, 0.3324586, 2.822845, 1, 1, 1, 1, 1,
1.259378, 2.266744, -0.9480776, 1, 1, 1, 1, 1,
1.270554, -0.460748, 2.513209, 1, 1, 1, 1, 1,
1.280629, 1.188942, 0.2142997, 1, 1, 1, 1, 1,
1.280835, -1.373078, 3.632524, 1, 1, 1, 1, 1,
1.282527, -2.434101, 4.02408, 1, 1, 1, 1, 1,
1.284212, 0.4435067, 1.900302, 1, 1, 1, 1, 1,
1.293429, -0.3812574, 3.339502, 1, 1, 1, 1, 1,
1.294693, -1.959225, 3.322019, 1, 1, 1, 1, 1,
1.296835, 0.9853697, 1.472172, 1, 1, 1, 1, 1,
1.299469, 1.261049, 0.578971, 1, 1, 1, 1, 1,
1.299505, -1.104102, 1.712111, 1, 1, 1, 1, 1,
1.306531, 0.053317, 1.862301, 1, 1, 1, 1, 1,
1.309351, -0.1635501, 0.8705369, 0, 0, 1, 1, 1,
1.315145, -0.05099958, 2.11041, 1, 0, 0, 1, 1,
1.330255, 0.8094348, 1.517048, 1, 0, 0, 1, 1,
1.333013, 0.1862698, 1.299816, 1, 0, 0, 1, 1,
1.338909, 0.3247254, -0.2290229, 1, 0, 0, 1, 1,
1.350016, -0.8768152, 3.413386, 1, 0, 0, 1, 1,
1.350224, 0.628932, 1.654981, 0, 0, 0, 1, 1,
1.363466, 0.9102409, 1.695711, 0, 0, 0, 1, 1,
1.379253, -0.8345643, 2.012954, 0, 0, 0, 1, 1,
1.380356, -0.03923109, -0.8087109, 0, 0, 0, 1, 1,
1.380692, 1.490477, 0.7835089, 0, 0, 0, 1, 1,
1.391892, -1.299145, 1.764199, 0, 0, 0, 1, 1,
1.393693, 0.04724223, 1.055288, 0, 0, 0, 1, 1,
1.401181, 0.1887906, 2.572562, 1, 1, 1, 1, 1,
1.403389, -0.1752556, 1.639905, 1, 1, 1, 1, 1,
1.406591, -1.018486, 1.944548, 1, 1, 1, 1, 1,
1.422242, 0.5267884, 1.636575, 1, 1, 1, 1, 1,
1.423625, -0.6114352, 2.759273, 1, 1, 1, 1, 1,
1.431388, -0.5862696, 1.085436, 1, 1, 1, 1, 1,
1.438559, -0.9979053, 2.952071, 1, 1, 1, 1, 1,
1.444126, -0.7051508, 1.293575, 1, 1, 1, 1, 1,
1.455653, 1.05414, 1.431484, 1, 1, 1, 1, 1,
1.458775, -0.9181588, 2.656507, 1, 1, 1, 1, 1,
1.464462, 1.341907, -0.4275188, 1, 1, 1, 1, 1,
1.468317, 1.766385, -0.2136443, 1, 1, 1, 1, 1,
1.488011, -1.292417, 1.786248, 1, 1, 1, 1, 1,
1.496291, -0.00447495, 1.432878, 1, 1, 1, 1, 1,
1.497626, 0.2207174, -0.5982282, 1, 1, 1, 1, 1,
1.513934, -0.6609378, 1.670752, 0, 0, 1, 1, 1,
1.515972, -1.057074, 2.105599, 1, 0, 0, 1, 1,
1.518735, -1.349249, 2.959054, 1, 0, 0, 1, 1,
1.527569, -0.918723, 1.439689, 1, 0, 0, 1, 1,
1.535369, 0.07877231, 3.126147, 1, 0, 0, 1, 1,
1.541432, 1.802863, 1.029047, 1, 0, 0, 1, 1,
1.544403, -0.01332666, 0.4275805, 0, 0, 0, 1, 1,
1.547976, 0.4388632, 1.352017, 0, 0, 0, 1, 1,
1.557411, 0.5934276, -0.1776717, 0, 0, 0, 1, 1,
1.561975, -1.667772, 2.755457, 0, 0, 0, 1, 1,
1.562578, -1.207299, 1.035316, 0, 0, 0, 1, 1,
1.563523, -0.6465008, 1.883821, 0, 0, 0, 1, 1,
1.567075, 1.095465, 1.975834, 0, 0, 0, 1, 1,
1.576251, 0.05911927, -0.2416181, 1, 1, 1, 1, 1,
1.581348, -0.7622714, 1.444957, 1, 1, 1, 1, 1,
1.582629, 1.58702, 0.6250991, 1, 1, 1, 1, 1,
1.592695, -0.5230614, 2.509374, 1, 1, 1, 1, 1,
1.611626, -0.717712, 2.279399, 1, 1, 1, 1, 1,
1.636343, -0.2830699, 2.179186, 1, 1, 1, 1, 1,
1.637258, -0.7282205, 3.756154, 1, 1, 1, 1, 1,
1.643917, 0.5630408, 3.349945, 1, 1, 1, 1, 1,
1.646308, 1.322228, -0.7398292, 1, 1, 1, 1, 1,
1.652714, 0.5331233, 0.3732357, 1, 1, 1, 1, 1,
1.672073, -1.088722, 3.221752, 1, 1, 1, 1, 1,
1.684261, 0.9294429, 0.6020784, 1, 1, 1, 1, 1,
1.687874, 1.542647, 1.348879, 1, 1, 1, 1, 1,
1.702761, 1.598335, 1.943566, 1, 1, 1, 1, 1,
1.713803, 0.3115891, 3.014712, 1, 1, 1, 1, 1,
1.736392, 0.3194288, 1.058117, 0, 0, 1, 1, 1,
1.770984, 0.274167, 1.418083, 1, 0, 0, 1, 1,
1.799216, -2.369754, 2.652535, 1, 0, 0, 1, 1,
1.811504, 0.392105, 2.37448, 1, 0, 0, 1, 1,
1.82861, 0.6071507, 2.465032, 1, 0, 0, 1, 1,
1.83262, 0.4837655, 1.954069, 1, 0, 0, 1, 1,
1.833154, 1.090116, 0.3717471, 0, 0, 0, 1, 1,
1.844216, 0.09681679, 0.6156446, 0, 0, 0, 1, 1,
1.852075, 0.1576294, 0.9526111, 0, 0, 0, 1, 1,
1.89581, 0.0272956, 2.814249, 0, 0, 0, 1, 1,
1.910934, 0.3914507, -0.2886758, 0, 0, 0, 1, 1,
1.914937, -0.8714975, 2.019635, 0, 0, 0, 1, 1,
1.921623, 0.6667427, 1.975594, 0, 0, 0, 1, 1,
1.928913, 0.5385609, 1.329, 1, 1, 1, 1, 1,
1.946459, -2.234457, 2.101507, 1, 1, 1, 1, 1,
1.968372, -1.987638, 1.803314, 1, 1, 1, 1, 1,
1.989563, 1.272385, 0.8330213, 1, 1, 1, 1, 1,
2.000605, 0.2860321, 0.9202999, 1, 1, 1, 1, 1,
2.011407, -0.1430978, 1.411232, 1, 1, 1, 1, 1,
2.034233, -1.74007, 1.497167, 1, 1, 1, 1, 1,
2.0467, -1.176039, 4.595359, 1, 1, 1, 1, 1,
2.072803, -0.2705169, 1.076461, 1, 1, 1, 1, 1,
2.093704, 0.4869634, 0.1398102, 1, 1, 1, 1, 1,
2.114357, -0.09461447, 2.668718, 1, 1, 1, 1, 1,
2.128331, -1.477203, 0.9305741, 1, 1, 1, 1, 1,
2.13436, -0.01974055, 2.133109, 1, 1, 1, 1, 1,
2.151834, -1.547016, 3.206667, 1, 1, 1, 1, 1,
2.176262, 1.250029, 0.7626567, 1, 1, 1, 1, 1,
2.185304, -0.8654563, 3.222343, 0, 0, 1, 1, 1,
2.213543, -0.116758, 1.616183, 1, 0, 0, 1, 1,
2.35695, 0.4922823, 3.309904, 1, 0, 0, 1, 1,
2.465529, -0.3559449, 2.95694, 1, 0, 0, 1, 1,
2.496258, -3.679668, 3.002145, 1, 0, 0, 1, 1,
2.502389, -0.09454548, 3.779819, 1, 0, 0, 1, 1,
2.514789, -0.7024642, 2.249136, 0, 0, 0, 1, 1,
2.552987, 0.1134817, 0.8544002, 0, 0, 0, 1, 1,
2.623926, -1.396589, 3.423089, 0, 0, 0, 1, 1,
2.626552, -0.884044, 2.985671, 0, 0, 0, 1, 1,
2.682631, -0.3776193, 1.297972, 0, 0, 0, 1, 1,
2.705509, -1.432405, 0.9661852, 0, 0, 0, 1, 1,
2.72387, 0.5741403, 2.447888, 0, 0, 0, 1, 1,
2.797473, -0.996546, 1.581677, 1, 1, 1, 1, 1,
2.798741, 0.6175183, 0.1296776, 1, 1, 1, 1, 1,
2.811602, -0.181333, 1.664399, 1, 1, 1, 1, 1,
2.851387, -0.5056809, 0.9462681, 1, 1, 1, 1, 1,
2.877687, 1.714779, 2.896875, 1, 1, 1, 1, 1,
2.955607, 1.126857, 1.510446, 1, 1, 1, 1, 1,
3.298939, -0.3525365, 1.781966, 1, 1, 1, 1, 1
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
var radius = 9.939944;
var distance = 34.91363;
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
mvMatrix.translate( -0.07628226, -0.2670722, 0.2679453 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.91363);
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
