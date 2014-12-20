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
-2.877619, -1.46828, -2.601372, 1, 0, 0, 1,
-2.803345, -0.4015757, -3.191243, 1, 0.007843138, 0, 1,
-2.785139, -0.2122398, -0.6210386, 1, 0.01176471, 0, 1,
-2.685454, 0.6275712, -2.706443, 1, 0.01960784, 0, 1,
-2.67921, -0.2402747, -0.1305476, 1, 0.02352941, 0, 1,
-2.50829, -2.415891, -2.76091, 1, 0.03137255, 0, 1,
-2.397524, -0.113114, -1.033404, 1, 0.03529412, 0, 1,
-2.362225, 0.3278235, -1.222165, 1, 0.04313726, 0, 1,
-2.323966, 0.05308196, -1.713684, 1, 0.04705882, 0, 1,
-2.294502, -0.4328122, -1.920359, 1, 0.05490196, 0, 1,
-2.251292, 0.07395604, 1.599632, 1, 0.05882353, 0, 1,
-2.244997, 1.057959, -0.8544247, 1, 0.06666667, 0, 1,
-2.230547, 0.7350067, 0.2600667, 1, 0.07058824, 0, 1,
-2.108034, -1.038567, -2.346124, 1, 0.07843138, 0, 1,
-2.103539, -0.1474102, -1.381301, 1, 0.08235294, 0, 1,
-2.102723, 1.498777, -0.6014494, 1, 0.09019608, 0, 1,
-2.096508, -0.9050766, -0.553308, 1, 0.09411765, 0, 1,
-2.065505, -0.3376035, -3.164726, 1, 0.1019608, 0, 1,
-2.02334, -0.8084438, -1.47839, 1, 0.1098039, 0, 1,
-1.966792, -0.485579, -1.717054, 1, 0.1137255, 0, 1,
-1.964905, 0.0541956, -2.822234, 1, 0.1215686, 0, 1,
-1.961587, -0.3868461, -1.738725, 1, 0.1254902, 0, 1,
-1.937568, 0.4396375, -2.613486, 1, 0.1333333, 0, 1,
-1.935153, 0.3466729, -2.700264, 1, 0.1372549, 0, 1,
-1.919442, -0.5268348, -1.760069, 1, 0.145098, 0, 1,
-1.887041, 0.4356602, -1.16172, 1, 0.1490196, 0, 1,
-1.870033, 1.449688, -1.884935, 1, 0.1568628, 0, 1,
-1.827688, 1.268049, -0.3230298, 1, 0.1607843, 0, 1,
-1.82554, -0.2572767, -0.8834597, 1, 0.1686275, 0, 1,
-1.779322, -0.4068519, -1.107951, 1, 0.172549, 0, 1,
-1.756743, -0.3971549, -0.9243211, 1, 0.1803922, 0, 1,
-1.752746, -0.06056923, -1.595998, 1, 0.1843137, 0, 1,
-1.752744, 0.3246757, -4.23948, 1, 0.1921569, 0, 1,
-1.744151, 1.216294, -0.05209858, 1, 0.1960784, 0, 1,
-1.736935, 0.4134143, -0.5082401, 1, 0.2039216, 0, 1,
-1.732276, -0.3091569, -2.403472, 1, 0.2117647, 0, 1,
-1.726973, -0.7877324, -0.7520234, 1, 0.2156863, 0, 1,
-1.721479, -0.1088272, -3.233406, 1, 0.2235294, 0, 1,
-1.709782, -1.30475, -2.684485, 1, 0.227451, 0, 1,
-1.696916, -1.013146, -2.109192, 1, 0.2352941, 0, 1,
-1.682023, 0.8546348, -2.007234, 1, 0.2392157, 0, 1,
-1.666289, 0.7012347, -1.313176, 1, 0.2470588, 0, 1,
-1.654127, 0.7849586, -1.068606, 1, 0.2509804, 0, 1,
-1.651489, 0.2514791, -1.893859, 1, 0.2588235, 0, 1,
-1.605778, -0.2012535, -1.369719, 1, 0.2627451, 0, 1,
-1.588716, -0.1700541, -0.5079769, 1, 0.2705882, 0, 1,
-1.567605, -1.071772, -2.482606, 1, 0.2745098, 0, 1,
-1.56127, 0.04910132, -1.195786, 1, 0.282353, 0, 1,
-1.559688, 0.5361115, -0.4523645, 1, 0.2862745, 0, 1,
-1.546038, 0.4411039, -1.663896, 1, 0.2941177, 0, 1,
-1.511232, 2.093839, -0.6988027, 1, 0.3019608, 0, 1,
-1.503198, 0.2525374, -0.05992097, 1, 0.3058824, 0, 1,
-1.489753, -1.663885, -1.226309, 1, 0.3137255, 0, 1,
-1.486791, 2.211216, -0.3229079, 1, 0.3176471, 0, 1,
-1.478616, -0.5241392, -1.147594, 1, 0.3254902, 0, 1,
-1.475612, -1.045814, -1.879377, 1, 0.3294118, 0, 1,
-1.47382, 1.641327, -1.684484, 1, 0.3372549, 0, 1,
-1.465922, 0.9960604, 0.1015447, 1, 0.3411765, 0, 1,
-1.461423, 0.405991, -0.8328943, 1, 0.3490196, 0, 1,
-1.452911, -0.9374633, -3.001813, 1, 0.3529412, 0, 1,
-1.435989, -0.5684305, -2.12271, 1, 0.3607843, 0, 1,
-1.433381, -0.4824715, -1.291604, 1, 0.3647059, 0, 1,
-1.431589, -0.3168773, -2.474991, 1, 0.372549, 0, 1,
-1.426709, 0.7370483, -0.7728114, 1, 0.3764706, 0, 1,
-1.423522, -0.3586936, -2.671437, 1, 0.3843137, 0, 1,
-1.421644, -0.7946924, -2.636446, 1, 0.3882353, 0, 1,
-1.420142, 0.6791016, -1.904638, 1, 0.3960784, 0, 1,
-1.416258, -0.141775, -2.463372, 1, 0.4039216, 0, 1,
-1.401478, -1.068496, -2.246643, 1, 0.4078431, 0, 1,
-1.393914, 0.9311211, -1.409755, 1, 0.4156863, 0, 1,
-1.391907, -0.1003824, -2.82713, 1, 0.4196078, 0, 1,
-1.381071, -0.3582653, -1.677025, 1, 0.427451, 0, 1,
-1.379109, -1.454274, -1.459586, 1, 0.4313726, 0, 1,
-1.376956, 1.083347, -0.548803, 1, 0.4392157, 0, 1,
-1.375476, -0.2161728, -0.425624, 1, 0.4431373, 0, 1,
-1.373299, -0.2670496, -0.9457023, 1, 0.4509804, 0, 1,
-1.367564, 0.4630757, -1.069413, 1, 0.454902, 0, 1,
-1.366808, -0.1133518, 0.1045054, 1, 0.4627451, 0, 1,
-1.364904, 0.9937847, -0.8954861, 1, 0.4666667, 0, 1,
-1.360285, -0.03742432, 0.508424, 1, 0.4745098, 0, 1,
-1.359096, 0.8346133, -1.187721, 1, 0.4784314, 0, 1,
-1.358535, -0.0506338, -2.172964, 1, 0.4862745, 0, 1,
-1.34709, 1.435716, -1.670894, 1, 0.4901961, 0, 1,
-1.344519, 0.955424, -1.883241, 1, 0.4980392, 0, 1,
-1.342741, 0.1908831, -0.5613701, 1, 0.5058824, 0, 1,
-1.335024, -0.0004922658, -0.1000557, 1, 0.509804, 0, 1,
-1.333485, -0.9319794, -0.8834801, 1, 0.5176471, 0, 1,
-1.331293, -0.9172186, -1.469796, 1, 0.5215687, 0, 1,
-1.314864, 0.8910779, -1.952867, 1, 0.5294118, 0, 1,
-1.309189, 0.9832962, 1.001065, 1, 0.5333334, 0, 1,
-1.29696, -2.584501, -0.8410589, 1, 0.5411765, 0, 1,
-1.293139, 0.01566513, -0.3125914, 1, 0.5450981, 0, 1,
-1.291956, -0.1038583, -2.485303, 1, 0.5529412, 0, 1,
-1.290117, -0.7415714, -1.959164, 1, 0.5568628, 0, 1,
-1.286244, -0.4433582, -2.015282, 1, 0.5647059, 0, 1,
-1.27879, -1.543335, -3.167881, 1, 0.5686275, 0, 1,
-1.277174, -0.05212775, -2.132285, 1, 0.5764706, 0, 1,
-1.267381, 0.5797977, -1.04082, 1, 0.5803922, 0, 1,
-1.266725, -0.6984388, -0.9395673, 1, 0.5882353, 0, 1,
-1.259618, -1.336343, -3.339862, 1, 0.5921569, 0, 1,
-1.257357, 0.003360506, -1.325194, 1, 0.6, 0, 1,
-1.255868, -2.298541, -4.22049, 1, 0.6078432, 0, 1,
-1.247042, 1.963558, -1.64814, 1, 0.6117647, 0, 1,
-1.241941, -0.1354999, -1.956079, 1, 0.6196079, 0, 1,
-1.240117, -0.2684514, -1.952727, 1, 0.6235294, 0, 1,
-1.239297, -0.3070129, -0.9813843, 1, 0.6313726, 0, 1,
-1.238456, 0.7527375, -1.225238, 1, 0.6352941, 0, 1,
-1.234422, 1.076843, -1.214212, 1, 0.6431373, 0, 1,
-1.23187, 0.0532711, -2.165591, 1, 0.6470588, 0, 1,
-1.216935, 0.2773408, -1.600142, 1, 0.654902, 0, 1,
-1.212968, -0.09436508, -2.862656, 1, 0.6588235, 0, 1,
-1.211071, 0.8553751, 1.131085, 1, 0.6666667, 0, 1,
-1.207795, -1.25063, -0.4001336, 1, 0.6705883, 0, 1,
-1.206693, -0.4684575, -1.20524, 1, 0.6784314, 0, 1,
-1.204636, 1.477571, -1.620282, 1, 0.682353, 0, 1,
-1.195992, -0.4616484, -1.670851, 1, 0.6901961, 0, 1,
-1.184895, 0.1005467, -1.625571, 1, 0.6941177, 0, 1,
-1.184044, 0.8242664, -1.716657, 1, 0.7019608, 0, 1,
-1.179196, -0.04632203, -1.143331, 1, 0.7098039, 0, 1,
-1.179157, 0.04636889, -1.664874, 1, 0.7137255, 0, 1,
-1.171109, 0.8651736, -1.711379, 1, 0.7215686, 0, 1,
-1.169653, -0.617938, -2.54292, 1, 0.7254902, 0, 1,
-1.169558, 2.180289, -0.4559608, 1, 0.7333333, 0, 1,
-1.167198, 1.311814, 0.5008621, 1, 0.7372549, 0, 1,
-1.157621, 0.9888439, -0.21109, 1, 0.7450981, 0, 1,
-1.149399, -1.28492, -1.806743, 1, 0.7490196, 0, 1,
-1.145432, -0.4843042, -1.675273, 1, 0.7568628, 0, 1,
-1.142519, 0.003133641, -2.52919, 1, 0.7607843, 0, 1,
-1.142475, -1.754481, -3.827659, 1, 0.7686275, 0, 1,
-1.130963, 0.9799774, -2.533708, 1, 0.772549, 0, 1,
-1.127998, 0.848339, -2.501136, 1, 0.7803922, 0, 1,
-1.127333, 0.3352852, -2.097405, 1, 0.7843137, 0, 1,
-1.12555, 0.7683746, -1.006605, 1, 0.7921569, 0, 1,
-1.123878, -1.214061, -1.900389, 1, 0.7960784, 0, 1,
-1.11773, -1.869067, -1.431939, 1, 0.8039216, 0, 1,
-1.11718, -0.4200049, -3.755327, 1, 0.8117647, 0, 1,
-1.111352, 0.9009454, 0.19976, 1, 0.8156863, 0, 1,
-1.107811, 0.0480908, -3.326032, 1, 0.8235294, 0, 1,
-1.10694, 0.5459797, 1.010869, 1, 0.827451, 0, 1,
-1.105062, 1.539101, -1.97281, 1, 0.8352941, 0, 1,
-1.100847, -0.3571722, -0.6699396, 1, 0.8392157, 0, 1,
-1.09208, 0.5783112, -1.927195, 1, 0.8470588, 0, 1,
-1.089728, -1.226537, -0.1759375, 1, 0.8509804, 0, 1,
-1.08535, 1.980295, -0.9812931, 1, 0.8588235, 0, 1,
-1.084633, -0.3702953, -1.804614, 1, 0.8627451, 0, 1,
-1.081723, 1.249277, -0.783744, 1, 0.8705882, 0, 1,
-1.080887, -0.016675, -2.71536, 1, 0.8745098, 0, 1,
-1.071632, -0.1182974, -3.027592, 1, 0.8823529, 0, 1,
-1.066188, -0.1628349, 0.05349101, 1, 0.8862745, 0, 1,
-1.059581, 1.021901, 0.2486159, 1, 0.8941177, 0, 1,
-1.047968, 1.314302, -0.9885091, 1, 0.8980392, 0, 1,
-1.047849, -1.683178, -3.637845, 1, 0.9058824, 0, 1,
-1.046114, 1.726274, 0.3559014, 1, 0.9137255, 0, 1,
-1.044494, 0.07483144, -0.7979129, 1, 0.9176471, 0, 1,
-1.033892, 0.3316599, -0.6291354, 1, 0.9254902, 0, 1,
-1.031752, -1.072105, -3.056081, 1, 0.9294118, 0, 1,
-1.03161, -0.4603634, -3.524668, 1, 0.9372549, 0, 1,
-1.030595, -0.9390064, -2.393604, 1, 0.9411765, 0, 1,
-1.022855, 0.2958041, 0.4800379, 1, 0.9490196, 0, 1,
-1.022485, -0.7338258, -1.012279, 1, 0.9529412, 0, 1,
-1.011978, -0.7466243, -1.589041, 1, 0.9607843, 0, 1,
-1.010458, 1.606806, -2.90647, 1, 0.9647059, 0, 1,
-1.010236, 1.196012, 0.7273251, 1, 0.972549, 0, 1,
-1.007976, -0.04138744, 0.5110976, 1, 0.9764706, 0, 1,
-1.006881, 1.595993, 0.5559918, 1, 0.9843137, 0, 1,
-1.00394, -1.456355, -2.321451, 1, 0.9882353, 0, 1,
-1.003207, -0.4089108, -2.4434, 1, 0.9960784, 0, 1,
-0.9994262, 1.886603, -0.250277, 0.9960784, 1, 0, 1,
-0.9972569, -1.023754, 0.4102868, 0.9921569, 1, 0, 1,
-0.9965376, 1.198233, 0.1297673, 0.9843137, 1, 0, 1,
-0.9964741, -0.2604417, -0.666828, 0.9803922, 1, 0, 1,
-0.9954969, 0.9950742, -0.6335731, 0.972549, 1, 0, 1,
-0.9942635, -1.774226, -3.160689, 0.9686275, 1, 0, 1,
-0.992396, 0.1236914, -0.0971073, 0.9607843, 1, 0, 1,
-0.9885553, 1.412658, 0.2407851, 0.9568627, 1, 0, 1,
-0.9868529, -2.270865, -3.40855, 0.9490196, 1, 0, 1,
-0.9858065, 0.6406402, -0.2503775, 0.945098, 1, 0, 1,
-0.9778864, -0.01267556, -1.73384, 0.9372549, 1, 0, 1,
-0.9766128, -0.5568109, -1.46415, 0.9333333, 1, 0, 1,
-0.9712549, -0.1255669, -1.688964, 0.9254902, 1, 0, 1,
-0.9661072, 1.176425, -0.2083064, 0.9215686, 1, 0, 1,
-0.964059, 0.2834016, -0.1180158, 0.9137255, 1, 0, 1,
-0.9633604, -0.5210251, -2.160778, 0.9098039, 1, 0, 1,
-0.9579436, 1.207007, -0.08426732, 0.9019608, 1, 0, 1,
-0.9536463, -0.3412829, -3.760997, 0.8941177, 1, 0, 1,
-0.9484001, 1.202788, -1.390953, 0.8901961, 1, 0, 1,
-0.9413475, -1.757854, -3.064487, 0.8823529, 1, 0, 1,
-0.9407514, -0.169716, 0.4178821, 0.8784314, 1, 0, 1,
-0.9393959, -0.4461195, -2.041435, 0.8705882, 1, 0, 1,
-0.9393007, -0.9585289, -2.117838, 0.8666667, 1, 0, 1,
-0.9311029, 0.09455571, -2.86651, 0.8588235, 1, 0, 1,
-0.9231777, -0.8417549, -2.861041, 0.854902, 1, 0, 1,
-0.9219479, -1.204514, -3.800051, 0.8470588, 1, 0, 1,
-0.9136089, 0.1178596, -1.610099, 0.8431373, 1, 0, 1,
-0.9132811, 0.06444542, -2.601006, 0.8352941, 1, 0, 1,
-0.9130587, 1.580588, -1.143281, 0.8313726, 1, 0, 1,
-0.9118413, 0.2763985, -0.758193, 0.8235294, 1, 0, 1,
-0.9114904, 0.1974323, -1.998222, 0.8196079, 1, 0, 1,
-0.9060533, 0.8371128, -0.4186603, 0.8117647, 1, 0, 1,
-0.9021749, 0.9147642, -0.8051128, 0.8078431, 1, 0, 1,
-0.8986236, -0.4465569, -2.071659, 0.8, 1, 0, 1,
-0.8972704, 0.3282697, -1.575574, 0.7921569, 1, 0, 1,
-0.8932464, 2.763399, -2.314575, 0.7882353, 1, 0, 1,
-0.8821295, -1.431482, -2.329588, 0.7803922, 1, 0, 1,
-0.8818648, -2.097802, -2.239936, 0.7764706, 1, 0, 1,
-0.8777151, -0.5702096, -1.829792, 0.7686275, 1, 0, 1,
-0.8773749, 1.427762, 0.008897577, 0.7647059, 1, 0, 1,
-0.8684959, -0.4565388, -1.551736, 0.7568628, 1, 0, 1,
-0.8586031, 0.7382676, -1.583118, 0.7529412, 1, 0, 1,
-0.8481901, -0.3883096, -3.413238, 0.7450981, 1, 0, 1,
-0.8453513, -1.125775, -4.394207, 0.7411765, 1, 0, 1,
-0.8361529, -0.8572606, -1.138566, 0.7333333, 1, 0, 1,
-0.836148, 1.53808, 0.04727894, 0.7294118, 1, 0, 1,
-0.8280998, -1.082715, -2.904106, 0.7215686, 1, 0, 1,
-0.8272857, 0.2076905, -1.074457, 0.7176471, 1, 0, 1,
-0.8270935, 0.4455399, -0.4284679, 0.7098039, 1, 0, 1,
-0.826808, 2.2493, 0.7188336, 0.7058824, 1, 0, 1,
-0.8250501, -2.307132, -3.281141, 0.6980392, 1, 0, 1,
-0.8237662, -0.8858128, -1.64583, 0.6901961, 1, 0, 1,
-0.8236182, -0.2726678, -2.256591, 0.6862745, 1, 0, 1,
-0.8230255, 1.489941, 0.0106924, 0.6784314, 1, 0, 1,
-0.8214326, -0.6169084, -0.07779592, 0.6745098, 1, 0, 1,
-0.8117028, 0.6582859, -0.8386043, 0.6666667, 1, 0, 1,
-0.8086221, -0.9149431, -2.240388, 0.6627451, 1, 0, 1,
-0.8076879, -0.2908966, -2.458619, 0.654902, 1, 0, 1,
-0.806798, 0.659428, -0.9131519, 0.6509804, 1, 0, 1,
-0.7947724, -2.115959, -4.420254, 0.6431373, 1, 0, 1,
-0.7935311, 0.25813, -2.91633, 0.6392157, 1, 0, 1,
-0.7856947, 0.9858493, -1.021516, 0.6313726, 1, 0, 1,
-0.784839, -0.2118658, -0.5995134, 0.627451, 1, 0, 1,
-0.7839068, 0.2357639, -0.09730554, 0.6196079, 1, 0, 1,
-0.7836803, -1.621857, -2.881375, 0.6156863, 1, 0, 1,
-0.7826664, -2.003085, -1.135441, 0.6078432, 1, 0, 1,
-0.7681175, -0.1700427, -3.118778, 0.6039216, 1, 0, 1,
-0.7642134, -0.09646652, -1.353042, 0.5960785, 1, 0, 1,
-0.7632006, 0.2408513, -0.8202158, 0.5882353, 1, 0, 1,
-0.7583184, -0.2818774, -3.981826, 0.5843138, 1, 0, 1,
-0.7533326, 1.104611, -2.691594, 0.5764706, 1, 0, 1,
-0.7528104, -0.4026313, -1.646212, 0.572549, 1, 0, 1,
-0.7496213, 0.08997914, -2.431014, 0.5647059, 1, 0, 1,
-0.7485566, 1.247645, 1.031221, 0.5607843, 1, 0, 1,
-0.744531, 1.360017, -0.4191942, 0.5529412, 1, 0, 1,
-0.737222, 0.724405, -0.6177194, 0.5490196, 1, 0, 1,
-0.7355031, 0.1270439, 0.2762223, 0.5411765, 1, 0, 1,
-0.7354718, -0.7471921, -1.43748, 0.5372549, 1, 0, 1,
-0.7353848, -2.420914, -2.161037, 0.5294118, 1, 0, 1,
-0.7309929, 0.2326362, 0.4447979, 0.5254902, 1, 0, 1,
-0.7272566, 1.621724, 0.4394448, 0.5176471, 1, 0, 1,
-0.7256862, -0.2074681, -0.7498899, 0.5137255, 1, 0, 1,
-0.7063475, 0.2337885, -0.660396, 0.5058824, 1, 0, 1,
-0.7032604, -0.06881265, -2.282743, 0.5019608, 1, 0, 1,
-0.6935681, 1.116964, 0.3856408, 0.4941176, 1, 0, 1,
-0.6928746, -0.3330685, -1.806666, 0.4862745, 1, 0, 1,
-0.6872644, 0.6414806, -0.518673, 0.4823529, 1, 0, 1,
-0.6854712, 0.7025421, -0.935568, 0.4745098, 1, 0, 1,
-0.6843557, 0.5416284, 0.6702631, 0.4705882, 1, 0, 1,
-0.6817774, 0.7791392, 0.8132909, 0.4627451, 1, 0, 1,
-0.6802726, -1.241999, -3.863096, 0.4588235, 1, 0, 1,
-0.6791185, -0.921161, -3.058546, 0.4509804, 1, 0, 1,
-0.6789326, -0.6770739, -2.341893, 0.4470588, 1, 0, 1,
-0.6765447, -1.647738, -2.731625, 0.4392157, 1, 0, 1,
-0.675657, 0.1811798, -1.595529, 0.4352941, 1, 0, 1,
-0.6749629, 1.123244, 1.809066, 0.427451, 1, 0, 1,
-0.6701925, -1.758918, -2.160375, 0.4235294, 1, 0, 1,
-0.6666161, -1.291599, -1.675451, 0.4156863, 1, 0, 1,
-0.6639414, -1.087575, -3.080614, 0.4117647, 1, 0, 1,
-0.663609, 0.6554789, -0.6932606, 0.4039216, 1, 0, 1,
-0.6609849, -0.1934564, -1.935246, 0.3960784, 1, 0, 1,
-0.6577853, 0.4928423, -1.860356, 0.3921569, 1, 0, 1,
-0.6567074, -0.4758575, 0.4488215, 0.3843137, 1, 0, 1,
-0.6481323, 1.730358, -0.7248313, 0.3803922, 1, 0, 1,
-0.6444475, 0.112116, -1.821494, 0.372549, 1, 0, 1,
-0.6420788, 0.5673908, -1.069203, 0.3686275, 1, 0, 1,
-0.6413801, -0.2487757, -1.671592, 0.3607843, 1, 0, 1,
-0.6412176, 1.631092, 0.09716118, 0.3568628, 1, 0, 1,
-0.6362835, 2.080059, 1.445786, 0.3490196, 1, 0, 1,
-0.633814, -2.100366, -3.222384, 0.345098, 1, 0, 1,
-0.6327312, 1.263449, -1.089674, 0.3372549, 1, 0, 1,
-0.6249938, 1.181005, -1.109926, 0.3333333, 1, 0, 1,
-0.6243899, -0.5260764, -1.355775, 0.3254902, 1, 0, 1,
-0.6192206, -1.095751, -2.234458, 0.3215686, 1, 0, 1,
-0.6174148, 1.102684, -1.692281, 0.3137255, 1, 0, 1,
-0.6163326, -1.082983, -2.688414, 0.3098039, 1, 0, 1,
-0.6147295, 1.045981, -0.723578, 0.3019608, 1, 0, 1,
-0.6041071, -0.1668661, -3.362384, 0.2941177, 1, 0, 1,
-0.6030665, 0.3727901, -0.4754824, 0.2901961, 1, 0, 1,
-0.5946222, -2.050462, -2.288138, 0.282353, 1, 0, 1,
-0.5929178, 1.228375, 0.01189852, 0.2784314, 1, 0, 1,
-0.5927618, 0.4278481, -0.4596081, 0.2705882, 1, 0, 1,
-0.5925695, 0.110045, -2.15372, 0.2666667, 1, 0, 1,
-0.5877079, -1.374766, -3.316203, 0.2588235, 1, 0, 1,
-0.5873601, 0.3286215, 0.8836998, 0.254902, 1, 0, 1,
-0.5869411, -0.4686901, -4.112095, 0.2470588, 1, 0, 1,
-0.5865527, -0.8496405, -1.85826, 0.2431373, 1, 0, 1,
-0.5593774, -0.5386233, -2.654661, 0.2352941, 1, 0, 1,
-0.5525559, -0.689212, -2.024609, 0.2313726, 1, 0, 1,
-0.5504526, 0.6389682, -0.0001461187, 0.2235294, 1, 0, 1,
-0.5458777, -0.4322471, -3.216269, 0.2196078, 1, 0, 1,
-0.5420732, 0.5125833, -1.079787, 0.2117647, 1, 0, 1,
-0.5395983, -0.6147686, -1.543773, 0.2078431, 1, 0, 1,
-0.5375158, -0.6287776, -1.819005, 0.2, 1, 0, 1,
-0.5312316, 1.074715, -1.02268, 0.1921569, 1, 0, 1,
-0.5310053, -1.401789, -2.818738, 0.1882353, 1, 0, 1,
-0.5290439, -0.4352077, -1.664193, 0.1803922, 1, 0, 1,
-0.5238675, -2.289057, -2.221433, 0.1764706, 1, 0, 1,
-0.5234364, -0.956947, -3.668905, 0.1686275, 1, 0, 1,
-0.5227438, -1.291612, -3.618144, 0.1647059, 1, 0, 1,
-0.5216367, 0.2124441, -0.808917, 0.1568628, 1, 0, 1,
-0.5163164, 0.6424101, 0.3879447, 0.1529412, 1, 0, 1,
-0.5148913, -0.5651242, -1.753259, 0.145098, 1, 0, 1,
-0.5098978, -0.6700956, -2.719614, 0.1411765, 1, 0, 1,
-0.5078104, 0.694038, -1.174654, 0.1333333, 1, 0, 1,
-0.5069484, 0.3191885, 0.9778388, 0.1294118, 1, 0, 1,
-0.5032513, 0.5363191, 1.298169, 0.1215686, 1, 0, 1,
-0.5019491, 0.3166987, -0.9917974, 0.1176471, 1, 0, 1,
-0.499879, -0.9782555, -4.436977, 0.1098039, 1, 0, 1,
-0.4975754, -1.01174, -3.14918, 0.1058824, 1, 0, 1,
-0.4968591, 1.292423, -0.7906825, 0.09803922, 1, 0, 1,
-0.4964308, 0.6245202, 0.2461783, 0.09019608, 1, 0, 1,
-0.4902822, 0.5540047, 0.2889933, 0.08627451, 1, 0, 1,
-0.4831805, 0.7873609, -1.876963, 0.07843138, 1, 0, 1,
-0.4727293, -0.6657611, -1.925554, 0.07450981, 1, 0, 1,
-0.4664492, 1.400084, -1.160373, 0.06666667, 1, 0, 1,
-0.4635683, -0.9597125, -1.348963, 0.0627451, 1, 0, 1,
-0.4614102, 1.467001, -0.2444971, 0.05490196, 1, 0, 1,
-0.4596519, 0.004743373, -2.0196, 0.05098039, 1, 0, 1,
-0.4595981, 0.1688848, -0.7901084, 0.04313726, 1, 0, 1,
-0.454752, -0.5784264, -2.15379, 0.03921569, 1, 0, 1,
-0.4523595, -0.144927, 0.153632, 0.03137255, 1, 0, 1,
-0.4470319, 0.04436789, -1.96975, 0.02745098, 1, 0, 1,
-0.44603, -0.3049451, -3.597739, 0.01960784, 1, 0, 1,
-0.4452072, 0.4622333, -1.36819, 0.01568628, 1, 0, 1,
-0.4392311, 1.131921, -0.09001897, 0.007843138, 1, 0, 1,
-0.4336707, 0.2356952, -0.7171096, 0.003921569, 1, 0, 1,
-0.430032, 0.7522828, -1.218162, 0, 1, 0.003921569, 1,
-0.4290919, -0.002331467, -1.495023, 0, 1, 0.01176471, 1,
-0.4266795, -0.3680694, -0.9111837, 0, 1, 0.01568628, 1,
-0.4240722, 0.1559489, -2.220476, 0, 1, 0.02352941, 1,
-0.4225859, -0.5176811, -2.652886, 0, 1, 0.02745098, 1,
-0.420862, 0.5826699, 0.3400593, 0, 1, 0.03529412, 1,
-0.4161427, -1.115704, -3.862461, 0, 1, 0.03921569, 1,
-0.4096697, 1.682412, 1.435022, 0, 1, 0.04705882, 1,
-0.4064577, -0.8762457, -1.906105, 0, 1, 0.05098039, 1,
-0.4060197, 0.4420049, 1.24967, 0, 1, 0.05882353, 1,
-0.4032892, 0.9957698, -0.7329804, 0, 1, 0.0627451, 1,
-0.3996563, -0.7313326, -2.987492, 0, 1, 0.07058824, 1,
-0.3931036, 1.228469, -1.534931, 0, 1, 0.07450981, 1,
-0.3913589, 2.186524, 2.620401, 0, 1, 0.08235294, 1,
-0.3896524, 1.502861, -1.378916, 0, 1, 0.08627451, 1,
-0.3833552, 0.8343114, -0.9178393, 0, 1, 0.09411765, 1,
-0.3800415, -1.677654, -2.517106, 0, 1, 0.1019608, 1,
-0.3788013, 0.8958504, 0.1602849, 0, 1, 0.1058824, 1,
-0.3703131, 1.054212, -1.37206, 0, 1, 0.1137255, 1,
-0.3696783, 0.3229686, -1.193345, 0, 1, 0.1176471, 1,
-0.3607167, 0.1377182, -1.954533, 0, 1, 0.1254902, 1,
-0.3574275, -0.1562079, -2.126773, 0, 1, 0.1294118, 1,
-0.3475812, 1.713594, 0.4750277, 0, 1, 0.1372549, 1,
-0.3464729, -0.465048, -1.869809, 0, 1, 0.1411765, 1,
-0.3430294, -0.990045, -2.952385, 0, 1, 0.1490196, 1,
-0.3404225, 1.039418, -0.07852992, 0, 1, 0.1529412, 1,
-0.3360704, -0.7978337, -4.665405, 0, 1, 0.1607843, 1,
-0.334592, 0.4220933, -0.508288, 0, 1, 0.1647059, 1,
-0.3345885, -0.3256448, -4.163918, 0, 1, 0.172549, 1,
-0.3345562, 0.1112655, -2.231342, 0, 1, 0.1764706, 1,
-0.3184614, 0.1577964, -1.291914, 0, 1, 0.1843137, 1,
-0.3165614, -0.2855521, -5.563652, 0, 1, 0.1882353, 1,
-0.3157647, -1.000532, -3.337475, 0, 1, 0.1960784, 1,
-0.3139432, -0.582233, -3.009172, 0, 1, 0.2039216, 1,
-0.3127311, -1.701298, -3.036601, 0, 1, 0.2078431, 1,
-0.3063783, 1.258568, 0.5716657, 0, 1, 0.2156863, 1,
-0.3058646, 0.3237135, -2.000668, 0, 1, 0.2196078, 1,
-0.3046978, 0.1104372, -0.7038382, 0, 1, 0.227451, 1,
-0.3032077, -1.037674, -1.15436, 0, 1, 0.2313726, 1,
-0.3018163, -0.00682458, -2.104653, 0, 1, 0.2392157, 1,
-0.3003068, 0.9466728, -0.9688472, 0, 1, 0.2431373, 1,
-0.2944188, 1.09486, 0.7070414, 0, 1, 0.2509804, 1,
-0.2919858, 0.5345918, -0.3670434, 0, 1, 0.254902, 1,
-0.2915262, 0.7302691, 0.9766089, 0, 1, 0.2627451, 1,
-0.2902432, 1.012612, 0.009425955, 0, 1, 0.2666667, 1,
-0.2883421, 1.181126, -0.5768942, 0, 1, 0.2745098, 1,
-0.2875335, 1.204322, 0.5298952, 0, 1, 0.2784314, 1,
-0.2859229, 0.1185855, -0.3735919, 0, 1, 0.2862745, 1,
-0.2857875, -1.025375, -3.118891, 0, 1, 0.2901961, 1,
-0.2852028, -0.08588693, -0.5320649, 0, 1, 0.2980392, 1,
-0.2744272, -0.03383234, -1.541272, 0, 1, 0.3058824, 1,
-0.2681671, -2.01792, -5.637892, 0, 1, 0.3098039, 1,
-0.2673661, 0.1424555, -1.496484, 0, 1, 0.3176471, 1,
-0.2658547, 2.57021, -0.9525563, 0, 1, 0.3215686, 1,
-0.2593598, 0.3763896, -1.116138, 0, 1, 0.3294118, 1,
-0.2578398, -0.3900667, -2.350496, 0, 1, 0.3333333, 1,
-0.2523916, -1.064492, -2.589976, 0, 1, 0.3411765, 1,
-0.25117, 0.843667, -0.1950624, 0, 1, 0.345098, 1,
-0.2334738, -1.015497, -2.971828, 0, 1, 0.3529412, 1,
-0.2309777, 0.7669286, -1.579279, 0, 1, 0.3568628, 1,
-0.2300441, -0.2189771, -2.844333, 0, 1, 0.3647059, 1,
-0.2279498, -1.697563, -2.164175, 0, 1, 0.3686275, 1,
-0.2259527, 0.8110589, -1.950654, 0, 1, 0.3764706, 1,
-0.225749, 1.577195, -1.021627, 0, 1, 0.3803922, 1,
-0.2252198, 1.034897, 0.5661966, 0, 1, 0.3882353, 1,
-0.2249417, -0.6672128, -4.321908, 0, 1, 0.3921569, 1,
-0.2221835, -1.031216, -1.753742, 0, 1, 0.4, 1,
-0.2171705, 0.852201, 1.138527, 0, 1, 0.4078431, 1,
-0.2146988, -0.340394, -2.392102, 0, 1, 0.4117647, 1,
-0.2131198, -0.2837801, -2.0015, 0, 1, 0.4196078, 1,
-0.21251, 0.4717395, -1.78512, 0, 1, 0.4235294, 1,
-0.2117528, 0.0739299, -1.684448, 0, 1, 0.4313726, 1,
-0.2113231, 0.1348071, -0.9359275, 0, 1, 0.4352941, 1,
-0.2081366, 1.023049, -1.785924, 0, 1, 0.4431373, 1,
-0.2079842, -1.741931, -3.531957, 0, 1, 0.4470588, 1,
-0.2053384, 0.8583729, -0.8982006, 0, 1, 0.454902, 1,
-0.2042599, 1.492077, -1.807585, 0, 1, 0.4588235, 1,
-0.2020792, 0.4523565, -0.360085, 0, 1, 0.4666667, 1,
-0.1980089, -1.242725, -1.828467, 0, 1, 0.4705882, 1,
-0.1962326, -0.7355481, -5.264071, 0, 1, 0.4784314, 1,
-0.1960681, -0.03448282, -1.449779, 0, 1, 0.4823529, 1,
-0.1922332, 0.4550863, 1.127528, 0, 1, 0.4901961, 1,
-0.187084, -0.2887062, -2.905417, 0, 1, 0.4941176, 1,
-0.1862048, 0.4966808, -0.8960236, 0, 1, 0.5019608, 1,
-0.1860961, 1.36601, 0.4903384, 0, 1, 0.509804, 1,
-0.1763026, -0.7104528, -1.500498, 0, 1, 0.5137255, 1,
-0.176042, 0.1985473, -0.770952, 0, 1, 0.5215687, 1,
-0.1721225, 2.684302, -0.1701748, 0, 1, 0.5254902, 1,
-0.1671195, 0.5200548, 0.07545669, 0, 1, 0.5333334, 1,
-0.1643768, 0.3084044, 0.2228871, 0, 1, 0.5372549, 1,
-0.1600429, 0.1062439, -1.993731, 0, 1, 0.5450981, 1,
-0.1549421, 1.342682, -1.591179, 0, 1, 0.5490196, 1,
-0.152066, -0.2520335, -1.539298, 0, 1, 0.5568628, 1,
-0.1413999, 0.5243606, 0.005854242, 0, 1, 0.5607843, 1,
-0.1405969, -0.7878881, -2.477359, 0, 1, 0.5686275, 1,
-0.140468, 0.8996453, -0.3788758, 0, 1, 0.572549, 1,
-0.137117, -0.2728027, -2.620008, 0, 1, 0.5803922, 1,
-0.1334933, 0.02862979, -3.060682, 0, 1, 0.5843138, 1,
-0.1326641, -0.1511711, -2.567539, 0, 1, 0.5921569, 1,
-0.1320339, 1.26876, 0.4013489, 0, 1, 0.5960785, 1,
-0.1316577, -1.158208, -6.599565, 0, 1, 0.6039216, 1,
-0.1312198, 3.033406, -1.082811, 0, 1, 0.6117647, 1,
-0.1268606, 1.987826, 2.087029, 0, 1, 0.6156863, 1,
-0.1247001, 0.1420869, -0.2274896, 0, 1, 0.6235294, 1,
-0.12289, -0.1711794, -0.1232749, 0, 1, 0.627451, 1,
-0.1208142, 0.7532399, -0.09620809, 0, 1, 0.6352941, 1,
-0.1177635, 0.4695852, 0.8250028, 0, 1, 0.6392157, 1,
-0.1168657, -0.2827996, -3.870845, 0, 1, 0.6470588, 1,
-0.09895063, -0.7610711, -1.385187, 0, 1, 0.6509804, 1,
-0.09851491, 0.7468697, -0.7912441, 0, 1, 0.6588235, 1,
-0.09770937, 1.144252, -0.8920886, 0, 1, 0.6627451, 1,
-0.09170288, -0.4723653, -2.302554, 0, 1, 0.6705883, 1,
-0.09047406, -0.5070095, -2.017542, 0, 1, 0.6745098, 1,
-0.08891515, 0.5292521, 0.9351963, 0, 1, 0.682353, 1,
-0.08631125, -2.001546, -3.778682, 0, 1, 0.6862745, 1,
-0.08402027, 0.1847638, -1.085165, 0, 1, 0.6941177, 1,
-0.07986869, 0.8197675, 0.1823146, 0, 1, 0.7019608, 1,
-0.07894597, 1.022286, -0.7875143, 0, 1, 0.7058824, 1,
-0.07831291, 0.3006134, -1.02891, 0, 1, 0.7137255, 1,
-0.07695912, 0.06540669, -1.77929, 0, 1, 0.7176471, 1,
-0.07436265, -0.5242383, -2.23492, 0, 1, 0.7254902, 1,
-0.07337255, 1.648543, 0.2457676, 0, 1, 0.7294118, 1,
-0.07051458, 0.1093566, 0.2873775, 0, 1, 0.7372549, 1,
-0.06651474, -1.21159, -2.352981, 0, 1, 0.7411765, 1,
-0.06447138, -2.095331, -5.464962, 0, 1, 0.7490196, 1,
-0.05970542, -0.2050074, -3.102797, 0, 1, 0.7529412, 1,
-0.05888924, 0.658514, 0.9956093, 0, 1, 0.7607843, 1,
-0.05672925, 0.5686928, 0.205178, 0, 1, 0.7647059, 1,
-0.0523291, -0.9519389, -2.362578, 0, 1, 0.772549, 1,
-0.05113927, -1.575943, -2.154536, 0, 1, 0.7764706, 1,
-0.0500432, -0.5510689, -3.236489, 0, 1, 0.7843137, 1,
-0.05002303, -3.289658, -4.638779, 0, 1, 0.7882353, 1,
-0.04654741, -0.9215073, -4.442555, 0, 1, 0.7960784, 1,
-0.04285287, 0.6208462, 0.03788157, 0, 1, 0.8039216, 1,
-0.04172814, 1.403144, -0.1325352, 0, 1, 0.8078431, 1,
-0.04156607, -0.9856547, -3.138002, 0, 1, 0.8156863, 1,
-0.04153345, -1.786675, -4.047753, 0, 1, 0.8196079, 1,
-0.03994731, 0.838108, 0.7665375, 0, 1, 0.827451, 1,
-0.03983472, 0.432373, 0.07031323, 0, 1, 0.8313726, 1,
-0.03809765, -0.5959743, -3.44947, 0, 1, 0.8392157, 1,
-0.03625073, 0.7261993, 1.583267, 0, 1, 0.8431373, 1,
-0.03349216, -1.202325, -1.549987, 0, 1, 0.8509804, 1,
-0.02896662, 0.9376841, 0.9938224, 0, 1, 0.854902, 1,
-0.02759086, 1.042757, 1.917433, 0, 1, 0.8627451, 1,
-0.02582568, 1.221867, -0.6878591, 0, 1, 0.8666667, 1,
-0.02580154, 1.125951, 0.6228129, 0, 1, 0.8745098, 1,
-0.0221416, -2.390243, -2.641198, 0, 1, 0.8784314, 1,
-0.02173914, -1.742753, -2.157344, 0, 1, 0.8862745, 1,
-0.01521062, -0.6754751, -3.548073, 0, 1, 0.8901961, 1,
-0.01501302, 0.1270561, -1.867342, 0, 1, 0.8980392, 1,
-0.01218986, -1.166033, -4.613599, 0, 1, 0.9058824, 1,
-0.0104195, 0.6607457, -0.6024429, 0, 1, 0.9098039, 1,
-0.009332721, 0.1139307, -1.865421, 0, 1, 0.9176471, 1,
-0.005733859, 0.4668721, -0.7772601, 0, 1, 0.9215686, 1,
0.005043615, 2.931289, -0.1144729, 0, 1, 0.9294118, 1,
0.006277655, -0.3977099, 1.853953, 0, 1, 0.9333333, 1,
0.007321831, 0.2120393, 2.400213, 0, 1, 0.9411765, 1,
0.007377392, -0.4890337, 3.34927, 0, 1, 0.945098, 1,
0.01151792, -0.8951429, 4.604088, 0, 1, 0.9529412, 1,
0.01459021, -1.414457, 2.377833, 0, 1, 0.9568627, 1,
0.01528024, -1.25248, 3.150645, 0, 1, 0.9647059, 1,
0.01629829, 1.48567, 1.134214, 0, 1, 0.9686275, 1,
0.01643068, 0.7001812, 2.174509, 0, 1, 0.9764706, 1,
0.01695508, -0.05438621, 3.835267, 0, 1, 0.9803922, 1,
0.01749452, 1.51197, -0.3479941, 0, 1, 0.9882353, 1,
0.01778699, -1.297242, 2.045767, 0, 1, 0.9921569, 1,
0.0197592, -0.008703931, 1.675321, 0, 1, 1, 1,
0.01996559, -1.165457, 2.821396, 0, 0.9921569, 1, 1,
0.02070383, -0.2346615, 2.217593, 0, 0.9882353, 1, 1,
0.02182811, -1.650044, 3.534055, 0, 0.9803922, 1, 1,
0.02392886, 0.7127913, -1.163862, 0, 0.9764706, 1, 1,
0.02518997, 0.793891, 0.6290774, 0, 0.9686275, 1, 1,
0.02525189, -0.3986418, 0.4770417, 0, 0.9647059, 1, 1,
0.02885427, -1.590588, 4.280376, 0, 0.9568627, 1, 1,
0.03706487, -0.115548, 2.836894, 0, 0.9529412, 1, 1,
0.0407244, -1.879789, 1.911925, 0, 0.945098, 1, 1,
0.04849863, 0.4546998, -0.4615267, 0, 0.9411765, 1, 1,
0.05471429, -0.08409645, 3.061357, 0, 0.9333333, 1, 1,
0.05531621, 1.134652, -1.473507, 0, 0.9294118, 1, 1,
0.05664506, -2.055274, 2.751434, 0, 0.9215686, 1, 1,
0.06362921, 0.8272281, 1.471038, 0, 0.9176471, 1, 1,
0.06609906, 1.37386, 1.818114, 0, 0.9098039, 1, 1,
0.06821729, -0.8328993, 3.058958, 0, 0.9058824, 1, 1,
0.06906001, -0.4407933, 1.671237, 0, 0.8980392, 1, 1,
0.07214845, 0.01158538, -1.254045, 0, 0.8901961, 1, 1,
0.07630952, -0.9994377, 2.194801, 0, 0.8862745, 1, 1,
0.07741112, 0.317466, 2.232145, 0, 0.8784314, 1, 1,
0.07746219, 3.05886, -0.1164478, 0, 0.8745098, 1, 1,
0.07894084, -1.599589, 3.725469, 0, 0.8666667, 1, 1,
0.07918997, 2.061002, -2.2434, 0, 0.8627451, 1, 1,
0.08047718, -0.4741468, 4.734929, 0, 0.854902, 1, 1,
0.08484077, 1.067057, -1.599591, 0, 0.8509804, 1, 1,
0.08725524, -0.7598978, 4.07878, 0, 0.8431373, 1, 1,
0.08731249, 1.122141, -0.003878253, 0, 0.8392157, 1, 1,
0.09362443, 1.523285, 0.546545, 0, 0.8313726, 1, 1,
0.0989784, 0.9192223, -2.206338, 0, 0.827451, 1, 1,
0.1005537, -0.1895564, 1.878643, 0, 0.8196079, 1, 1,
0.102398, 1.061056, 0.5390976, 0, 0.8156863, 1, 1,
0.1059599, 0.5905904, 0.7245647, 0, 0.8078431, 1, 1,
0.1071908, -0.7701039, 2.510113, 0, 0.8039216, 1, 1,
0.1121821, 1.271279, 0.09045007, 0, 0.7960784, 1, 1,
0.1141614, 0.1810535, 0.367018, 0, 0.7882353, 1, 1,
0.1163107, -0.2454478, 3.090517, 0, 0.7843137, 1, 1,
0.1167606, -0.962516, 1.170232, 0, 0.7764706, 1, 1,
0.1176516, 0.2616844, 0.2319009, 0, 0.772549, 1, 1,
0.121164, 0.3152421, 0.5352356, 0, 0.7647059, 1, 1,
0.1227897, -0.499863, 4.537989, 0, 0.7607843, 1, 1,
0.1239403, -1.241776, 3.170195, 0, 0.7529412, 1, 1,
0.1269926, 0.6216334, -0.5476543, 0, 0.7490196, 1, 1,
0.1306695, 0.04186584, 1.998315, 0, 0.7411765, 1, 1,
0.1387407, 1.003448, -1.816636, 0, 0.7372549, 1, 1,
0.1408895, 1.685913, 0.1918, 0, 0.7294118, 1, 1,
0.1412089, 0.2174358, 0.5821896, 0, 0.7254902, 1, 1,
0.1484662, -0.8905385, 2.338502, 0, 0.7176471, 1, 1,
0.1486986, -1.032473, 2.063086, 0, 0.7137255, 1, 1,
0.1597623, 0.3246053, 0.02678852, 0, 0.7058824, 1, 1,
0.1634259, 0.9733338, -0.6004172, 0, 0.6980392, 1, 1,
0.1710563, -0.3655791, 0.07451355, 0, 0.6941177, 1, 1,
0.1710842, -0.2668142, 2.1015, 0, 0.6862745, 1, 1,
0.1727175, 1.809802, -0.9733413, 0, 0.682353, 1, 1,
0.1786, 0.88434, 0.5927347, 0, 0.6745098, 1, 1,
0.180939, 0.109781, 3.414912, 0, 0.6705883, 1, 1,
0.1867621, -0.3715182, 2.032121, 0, 0.6627451, 1, 1,
0.1885025, -0.3566496, 2.767405, 0, 0.6588235, 1, 1,
0.1906133, -0.7489364, 2.002039, 0, 0.6509804, 1, 1,
0.1908619, 1.355305, -1.275944, 0, 0.6470588, 1, 1,
0.1910597, 1.136881, 0.03436073, 0, 0.6392157, 1, 1,
0.1912134, -0.3833427, 1.768892, 0, 0.6352941, 1, 1,
0.1918391, -1.406047, 0.8405666, 0, 0.627451, 1, 1,
0.1960874, 0.1289196, 2.271842, 0, 0.6235294, 1, 1,
0.1984627, 0.7185884, 0.1531355, 0, 0.6156863, 1, 1,
0.1992962, 1.486343, 0.4548087, 0, 0.6117647, 1, 1,
0.201233, -0.4889042, 1.628056, 0, 0.6039216, 1, 1,
0.2030227, 0.2692912, 1.464216, 0, 0.5960785, 1, 1,
0.2077067, 0.4596167, -0.439207, 0, 0.5921569, 1, 1,
0.2086284, -0.5792743, 2.132494, 0, 0.5843138, 1, 1,
0.2097458, 0.2471299, 1.31816, 0, 0.5803922, 1, 1,
0.2146611, -1.241622, 2.945604, 0, 0.572549, 1, 1,
0.2152104, 1.488192, -0.3945946, 0, 0.5686275, 1, 1,
0.2160983, -1.863903, 2.760491, 0, 0.5607843, 1, 1,
0.2165372, 0.7678236, 0.1726215, 0, 0.5568628, 1, 1,
0.2175383, 0.2847852, 0.4177889, 0, 0.5490196, 1, 1,
0.2226286, -1.789021, 3.144677, 0, 0.5450981, 1, 1,
0.2236104, 0.9994566, 0.5132183, 0, 0.5372549, 1, 1,
0.2236581, -1.070249, 2.495538, 0, 0.5333334, 1, 1,
0.2240609, 0.7773069, 0.8647758, 0, 0.5254902, 1, 1,
0.227094, -0.5270622, 3.999015, 0, 0.5215687, 1, 1,
0.2345408, -0.1732357, 2.670048, 0, 0.5137255, 1, 1,
0.2362245, -0.4615795, 2.531568, 0, 0.509804, 1, 1,
0.2365265, -0.8295543, 1.498952, 0, 0.5019608, 1, 1,
0.2408372, -0.2924135, 2.476847, 0, 0.4941176, 1, 1,
0.2432088, 1.356157, 0.9956269, 0, 0.4901961, 1, 1,
0.2458966, 2.583363, 0.4250765, 0, 0.4823529, 1, 1,
0.2468985, -0.8356807, 3.293135, 0, 0.4784314, 1, 1,
0.2469182, -0.4398738, 2.625083, 0, 0.4705882, 1, 1,
0.2543845, 1.399081, -0.3063586, 0, 0.4666667, 1, 1,
0.255043, -0.4234051, 3.882708, 0, 0.4588235, 1, 1,
0.2613092, 1.39537, 0.7063797, 0, 0.454902, 1, 1,
0.2634058, -0.6229122, 3.399701, 0, 0.4470588, 1, 1,
0.2665029, 0.4870677, 0.08226485, 0, 0.4431373, 1, 1,
0.2701401, 0.03282949, 0.722235, 0, 0.4352941, 1, 1,
0.2702098, -0.591442, 4.411104, 0, 0.4313726, 1, 1,
0.2731171, -0.07585664, 4.123348, 0, 0.4235294, 1, 1,
0.2745644, -0.2322965, 2.442176, 0, 0.4196078, 1, 1,
0.2748329, 0.6924718, 1.439962, 0, 0.4117647, 1, 1,
0.2768981, 2.217343, 0.3535862, 0, 0.4078431, 1, 1,
0.2788019, -1.472897, 3.244812, 0, 0.4, 1, 1,
0.2791545, 1.808889, -0.0663451, 0, 0.3921569, 1, 1,
0.2879016, -0.8953378, 2.214922, 0, 0.3882353, 1, 1,
0.290748, 0.06599251, 1.519607, 0, 0.3803922, 1, 1,
0.2926595, 0.8251158, 1.314262, 0, 0.3764706, 1, 1,
0.2949818, -1.005244, 2.415747, 0, 0.3686275, 1, 1,
0.2951449, 0.3702859, 0.7006708, 0, 0.3647059, 1, 1,
0.2954018, -0.7491531, 5.557248, 0, 0.3568628, 1, 1,
0.3002008, 0.1321766, -0.2612921, 0, 0.3529412, 1, 1,
0.303779, -0.4457079, 2.046048, 0, 0.345098, 1, 1,
0.3040052, 0.526591, -1.058546, 0, 0.3411765, 1, 1,
0.3041729, -0.2194737, 2.916848, 0, 0.3333333, 1, 1,
0.3042799, -0.01505617, 1.000196, 0, 0.3294118, 1, 1,
0.3047982, -1.390677, 1.356044, 0, 0.3215686, 1, 1,
0.3052871, 0.3381208, 1.156426, 0, 0.3176471, 1, 1,
0.3064612, 0.5152686, 1.718156, 0, 0.3098039, 1, 1,
0.308455, 0.8455498, 0.7425458, 0, 0.3058824, 1, 1,
0.3099957, -0.02565465, 1.911492, 0, 0.2980392, 1, 1,
0.3106757, 0.2788894, 1.058223, 0, 0.2901961, 1, 1,
0.31515, -0.3531065, 2.693272, 0, 0.2862745, 1, 1,
0.3157631, -0.8412559, 2.260639, 0, 0.2784314, 1, 1,
0.3207776, -1.053099, 2.18095, 0, 0.2745098, 1, 1,
0.3275611, -0.2711777, 3.027042, 0, 0.2666667, 1, 1,
0.3287209, 0.551017, -0.1770407, 0, 0.2627451, 1, 1,
0.3306927, -0.2874173, 0.5627605, 0, 0.254902, 1, 1,
0.333599, 1.472405, 0.1142756, 0, 0.2509804, 1, 1,
0.3336579, -0.8831142, 1.700679, 0, 0.2431373, 1, 1,
0.3347983, 0.4168096, 0.4707353, 0, 0.2392157, 1, 1,
0.3376487, -0.6833903, 3.500462, 0, 0.2313726, 1, 1,
0.3459039, -1.667553, 2.800086, 0, 0.227451, 1, 1,
0.3497334, 1.122351, 1.546273, 0, 0.2196078, 1, 1,
0.3525512, 0.4526904, 0.5434078, 0, 0.2156863, 1, 1,
0.3528876, 1.164909, -0.2337743, 0, 0.2078431, 1, 1,
0.3574728, -0.3016077, 2.771704, 0, 0.2039216, 1, 1,
0.3585295, -1.891365, 3.913231, 0, 0.1960784, 1, 1,
0.3591277, -0.09340078, 0.148534, 0, 0.1882353, 1, 1,
0.3591725, 0.3677348, 0.5080678, 0, 0.1843137, 1, 1,
0.3605046, 1.904463, 0.4885472, 0, 0.1764706, 1, 1,
0.3615232, 0.1773438, -0.8098008, 0, 0.172549, 1, 1,
0.3625621, 0.9225062, -0.2991309, 0, 0.1647059, 1, 1,
0.3647641, 0.8750644, -0.3530901, 0, 0.1607843, 1, 1,
0.3659073, 0.2002554, 0.8493615, 0, 0.1529412, 1, 1,
0.3674585, 1.722012, -1.315999, 0, 0.1490196, 1, 1,
0.3771822, -0.7976517, 3.775353, 0, 0.1411765, 1, 1,
0.3845301, 0.0439035, 0.3134225, 0, 0.1372549, 1, 1,
0.3845948, 0.3301083, 1.424844, 0, 0.1294118, 1, 1,
0.3873005, -1.462714, 2.513114, 0, 0.1254902, 1, 1,
0.3881383, 1.070211, -1.207151, 0, 0.1176471, 1, 1,
0.390101, 1.228745, 0.01468645, 0, 0.1137255, 1, 1,
0.3903774, -0.1520802, 1.899565, 0, 0.1058824, 1, 1,
0.3946524, 0.6636206, 1.253906, 0, 0.09803922, 1, 1,
0.3978634, -0.377833, 2.420227, 0, 0.09411765, 1, 1,
0.3988217, -1.029417, 2.453007, 0, 0.08627451, 1, 1,
0.400072, -0.4984713, 2.523264, 0, 0.08235294, 1, 1,
0.404209, 1.014012, 2.551922, 0, 0.07450981, 1, 1,
0.4101002, -0.9196144, 2.358268, 0, 0.07058824, 1, 1,
0.413865, 1.008207, 0.9490166, 0, 0.0627451, 1, 1,
0.4143915, -1.436554, 3.211413, 0, 0.05882353, 1, 1,
0.4150403, 0.1441169, 1.81636, 0, 0.05098039, 1, 1,
0.4161669, 0.099176, 1.282834, 0, 0.04705882, 1, 1,
0.4162312, 0.2684433, 0.03664084, 0, 0.03921569, 1, 1,
0.424432, 1.271277, -0.4481302, 0, 0.03529412, 1, 1,
0.4259618, 0.08717045, 0.6004672, 0, 0.02745098, 1, 1,
0.4262653, 0.525803, -0.4125148, 0, 0.02352941, 1, 1,
0.4302067, 1.812625, -2.136542, 0, 0.01568628, 1, 1,
0.4308909, 0.8703385, 1.289182, 0, 0.01176471, 1, 1,
0.4325836, 0.3425563, 0.8246005, 0, 0.003921569, 1, 1,
0.4331172, 1.137643, -0.0962418, 0.003921569, 0, 1, 1,
0.4350667, 0.5609054, 1.062775, 0.007843138, 0, 1, 1,
0.435184, 0.6485246, 0.3758565, 0.01568628, 0, 1, 1,
0.439396, -0.8270942, 3.044718, 0.01960784, 0, 1, 1,
0.4411674, 1.172383, 2.044549, 0.02745098, 0, 1, 1,
0.44273, -0.3656239, 3.780404, 0.03137255, 0, 1, 1,
0.4437477, -0.06067537, 2.157633, 0.03921569, 0, 1, 1,
0.4468096, -0.9356171, 1.50788, 0.04313726, 0, 1, 1,
0.4471709, -1.206849, 2.671992, 0.05098039, 0, 1, 1,
0.4474625, 1.556716, 0.4443943, 0.05490196, 0, 1, 1,
0.4476343, 0.1337249, 0.08758225, 0.0627451, 0, 1, 1,
0.4477917, -0.398177, 1.805462, 0.06666667, 0, 1, 1,
0.452303, -1.100027, 2.062493, 0.07450981, 0, 1, 1,
0.4581198, 0.6794144, -0.8896564, 0.07843138, 0, 1, 1,
0.4588193, 0.2985069, 0.4841627, 0.08627451, 0, 1, 1,
0.4609413, -1.102126, 4.260783, 0.09019608, 0, 1, 1,
0.4660405, -0.342907, 1.810881, 0.09803922, 0, 1, 1,
0.4712419, -0.4142823, 1.010038, 0.1058824, 0, 1, 1,
0.4716444, 2.07716, 0.6603394, 0.1098039, 0, 1, 1,
0.4727334, -2.164801, 3.889908, 0.1176471, 0, 1, 1,
0.4766017, 0.6763543, 0.7824028, 0.1215686, 0, 1, 1,
0.4771862, 0.7363763, 0.2907299, 0.1294118, 0, 1, 1,
0.4801174, 0.5911314, -0.231022, 0.1333333, 0, 1, 1,
0.4821532, -0.01438236, 3.869958, 0.1411765, 0, 1, 1,
0.4844278, -1.930861, 2.77712, 0.145098, 0, 1, 1,
0.4856055, -0.144626, 1.846932, 0.1529412, 0, 1, 1,
0.4888049, -0.03930968, 0.1727169, 0.1568628, 0, 1, 1,
0.4900677, 1.122413, 0.2624642, 0.1647059, 0, 1, 1,
0.4932527, 0.3450146, 2.190793, 0.1686275, 0, 1, 1,
0.4939743, 1.274166, 0.7404121, 0.1764706, 0, 1, 1,
0.4963745, -0.5851827, 2.767623, 0.1803922, 0, 1, 1,
0.4974325, 1.440976, -0.6949396, 0.1882353, 0, 1, 1,
0.4980053, 0.2500171, -0.5895507, 0.1921569, 0, 1, 1,
0.4992684, 0.9215825, 2.029168, 0.2, 0, 1, 1,
0.5006026, 1.476416, 1.237995, 0.2078431, 0, 1, 1,
0.5021781, -1.016745, 3.369298, 0.2117647, 0, 1, 1,
0.504297, 0.5504444, 0.7071379, 0.2196078, 0, 1, 1,
0.5078198, 0.7533901, 0.6287079, 0.2235294, 0, 1, 1,
0.5087716, 0.6860586, 1.658383, 0.2313726, 0, 1, 1,
0.5093291, 0.03188847, 2.114883, 0.2352941, 0, 1, 1,
0.5093636, -0.04796868, 2.389126, 0.2431373, 0, 1, 1,
0.5121889, 0.3512031, 1.216629, 0.2470588, 0, 1, 1,
0.5158009, 0.5567454, -0.507098, 0.254902, 0, 1, 1,
0.5182023, -0.6011001, 2.999979, 0.2588235, 0, 1, 1,
0.5182927, -0.2830673, 1.249345, 0.2666667, 0, 1, 1,
0.5241437, -0.004348991, -0.3645343, 0.2705882, 0, 1, 1,
0.5309064, -2.695843, 2.365719, 0.2784314, 0, 1, 1,
0.5310316, 0.3387109, 1.374384, 0.282353, 0, 1, 1,
0.535107, -0.9083452, 2.934011, 0.2901961, 0, 1, 1,
0.5372041, 0.08156694, 1.610882, 0.2941177, 0, 1, 1,
0.540149, -0.1653846, 0.5347196, 0.3019608, 0, 1, 1,
0.5405166, -0.9526447, 1.29703, 0.3098039, 0, 1, 1,
0.5460664, -0.6232352, 1.778533, 0.3137255, 0, 1, 1,
0.5462946, -0.5474905, 2.199176, 0.3215686, 0, 1, 1,
0.5472147, -0.8565524, 4.285228, 0.3254902, 0, 1, 1,
0.5492762, -0.6426351, 1.633077, 0.3333333, 0, 1, 1,
0.5579777, 0.7515756, 1.830288, 0.3372549, 0, 1, 1,
0.5636224, -0.8064442, 3.220519, 0.345098, 0, 1, 1,
0.5653786, 0.1272382, 1.518278, 0.3490196, 0, 1, 1,
0.5662144, 0.5692121, 1.033366, 0.3568628, 0, 1, 1,
0.56661, 1.640729, 0.5604194, 0.3607843, 0, 1, 1,
0.566984, -0.2318562, 1.374771, 0.3686275, 0, 1, 1,
0.5693844, 0.1691552, 1.038643, 0.372549, 0, 1, 1,
0.5746669, -1.841735, 2.222558, 0.3803922, 0, 1, 1,
0.5812205, 0.3977481, 1.749977, 0.3843137, 0, 1, 1,
0.5816343, -0.6445512, 0.6905818, 0.3921569, 0, 1, 1,
0.5822287, -0.3666461, 2.853942, 0.3960784, 0, 1, 1,
0.5886494, -0.3849266, 2.879964, 0.4039216, 0, 1, 1,
0.5888312, -0.7286747, 2.393026, 0.4117647, 0, 1, 1,
0.5893985, 1.073635, 0.3350313, 0.4156863, 0, 1, 1,
0.589481, 0.453091, 1.257248, 0.4235294, 0, 1, 1,
0.594492, -0.2520364, 1.349819, 0.427451, 0, 1, 1,
0.5982454, -0.1967409, 1.745601, 0.4352941, 0, 1, 1,
0.6018388, -3.014927, 5.175677, 0.4392157, 0, 1, 1,
0.6191929, 0.07147293, -0.3454032, 0.4470588, 0, 1, 1,
0.6219032, 1.229688, -0.1404926, 0.4509804, 0, 1, 1,
0.6244993, 0.7740739, 1.547979, 0.4588235, 0, 1, 1,
0.627027, 0.3437813, 1.209268, 0.4627451, 0, 1, 1,
0.6288657, 0.08143821, 2.905303, 0.4705882, 0, 1, 1,
0.6288757, 0.1570305, 1.569713, 0.4745098, 0, 1, 1,
0.6344619, -2.895917, 3.675985, 0.4823529, 0, 1, 1,
0.6362216, -0.7235975, 4.189158, 0.4862745, 0, 1, 1,
0.6366491, 0.01688965, 0.1303574, 0.4941176, 0, 1, 1,
0.6412034, -0.3971018, 0.7610732, 0.5019608, 0, 1, 1,
0.6420096, -1.664346, 2.978928, 0.5058824, 0, 1, 1,
0.6513379, -0.7864475, 1.91653, 0.5137255, 0, 1, 1,
0.65513, 1.095611, 0.2692311, 0.5176471, 0, 1, 1,
0.6596454, -0.7227237, 2.920784, 0.5254902, 0, 1, 1,
0.6678874, 0.1046495, 1.528161, 0.5294118, 0, 1, 1,
0.6734102, 1.698621, 1.184, 0.5372549, 0, 1, 1,
0.6742951, 0.624823, 2.162953, 0.5411765, 0, 1, 1,
0.6760747, 0.3834417, 1.706873, 0.5490196, 0, 1, 1,
0.677842, -1.038937, 1.342556, 0.5529412, 0, 1, 1,
0.6781784, -0.01246823, 1.999224, 0.5607843, 0, 1, 1,
0.6803827, -1.054356, 1.644096, 0.5647059, 0, 1, 1,
0.6869539, -0.05013574, 1.459182, 0.572549, 0, 1, 1,
0.6894554, 1.347443, -0.2316433, 0.5764706, 0, 1, 1,
0.6932935, -0.05129338, 0.9208021, 0.5843138, 0, 1, 1,
0.6955, 0.1829235, 1.770389, 0.5882353, 0, 1, 1,
0.6959262, -1.559989, 3.468306, 0.5960785, 0, 1, 1,
0.7059637, 1.163213, 0.9181863, 0.6039216, 0, 1, 1,
0.7075365, 1.905114, -1.588704, 0.6078432, 0, 1, 1,
0.7079797, -1.159637, 2.657121, 0.6156863, 0, 1, 1,
0.7095662, 0.07855719, 1.343009, 0.6196079, 0, 1, 1,
0.7101675, 2.050172, 1.501689, 0.627451, 0, 1, 1,
0.7102684, -0.9850066, 1.779836, 0.6313726, 0, 1, 1,
0.7116616, 0.6594819, 0.421239, 0.6392157, 0, 1, 1,
0.7143058, 0.6282812, 0.07867321, 0.6431373, 0, 1, 1,
0.7180057, 1.531465, 1.074787, 0.6509804, 0, 1, 1,
0.7193699, 0.02397358, 0.585577, 0.654902, 0, 1, 1,
0.7303634, 0.405982, 1.800622, 0.6627451, 0, 1, 1,
0.7322854, 0.8571125, 2.383867, 0.6666667, 0, 1, 1,
0.7392889, -0.5760837, 0.9236547, 0.6745098, 0, 1, 1,
0.74187, 0.8565276, 0.5670217, 0.6784314, 0, 1, 1,
0.7423978, 1.91457, 0.9397337, 0.6862745, 0, 1, 1,
0.7475787, 0.68319, -0.02488402, 0.6901961, 0, 1, 1,
0.7484245, 1.362789, 1.127301, 0.6980392, 0, 1, 1,
0.7488695, -1.148277, 2.842917, 0.7058824, 0, 1, 1,
0.7501103, 0.2476587, 1.323037, 0.7098039, 0, 1, 1,
0.7537619, -1.430271, 1.486495, 0.7176471, 0, 1, 1,
0.7576774, -1.117179, 1.56537, 0.7215686, 0, 1, 1,
0.7601733, 1.531746, -0.21733, 0.7294118, 0, 1, 1,
0.7679566, -1.305573, 1.859535, 0.7333333, 0, 1, 1,
0.7766609, -0.6343278, 2.6338, 0.7411765, 0, 1, 1,
0.7783105, -0.9734092, 2.157392, 0.7450981, 0, 1, 1,
0.7847356, -0.2934487, 2.782925, 0.7529412, 0, 1, 1,
0.7981482, 1.557009, 0.5959448, 0.7568628, 0, 1, 1,
0.799778, -1.089587, 3.190805, 0.7647059, 0, 1, 1,
0.8044156, 1.087939, 1.228461, 0.7686275, 0, 1, 1,
0.8104014, 1.541831, 2.183992, 0.7764706, 0, 1, 1,
0.8175245, 1.048371, 0.273674, 0.7803922, 0, 1, 1,
0.8184576, 1.328451, 0.7367204, 0.7882353, 0, 1, 1,
0.8187048, 0.25606, 1.654083, 0.7921569, 0, 1, 1,
0.8218257, 0.8111227, 0.04686248, 0.8, 0, 1, 1,
0.8245415, 0.4425144, 1.927305, 0.8078431, 0, 1, 1,
0.8250003, 0.3262593, 2.466492, 0.8117647, 0, 1, 1,
0.8257424, 1.248675, 0.2524835, 0.8196079, 0, 1, 1,
0.8262509, 1.151944, -0.1103928, 0.8235294, 0, 1, 1,
0.8268442, 0.5338483, 0.8674707, 0.8313726, 0, 1, 1,
0.8419625, 0.2731191, -0.1435064, 0.8352941, 0, 1, 1,
0.8423516, 0.5723322, 0.32803, 0.8431373, 0, 1, 1,
0.8430513, -1.746517, 3.023736, 0.8470588, 0, 1, 1,
0.8439652, -1.00531, 3.298014, 0.854902, 0, 1, 1,
0.8480324, 0.1134721, 1.568398, 0.8588235, 0, 1, 1,
0.8523357, 0.1288114, 1.80204, 0.8666667, 0, 1, 1,
0.8527979, -0.4187593, 1.339747, 0.8705882, 0, 1, 1,
0.8626917, 0.2657833, 0.5186594, 0.8784314, 0, 1, 1,
0.869422, -1.078228, 2.216418, 0.8823529, 0, 1, 1,
0.8699436, -0.02311815, 1.376088, 0.8901961, 0, 1, 1,
0.8707874, -0.4250863, 1.369065, 0.8941177, 0, 1, 1,
0.8777119, -0.4417343, 3.443467, 0.9019608, 0, 1, 1,
0.8777711, 1.049233, 3.031131, 0.9098039, 0, 1, 1,
0.8815589, -0.2822139, 1.474857, 0.9137255, 0, 1, 1,
0.8823147, -0.2723236, 0.139235, 0.9215686, 0, 1, 1,
0.8831332, -0.6910685, 2.391506, 0.9254902, 0, 1, 1,
0.8857726, -0.6157215, 2.57646, 0.9333333, 0, 1, 1,
0.8867059, -0.733829, 3.876032, 0.9372549, 0, 1, 1,
0.8887996, -0.5344164, 1.478144, 0.945098, 0, 1, 1,
0.8932615, -0.9359583, 1.086546, 0.9490196, 0, 1, 1,
0.8935102, -1.085901, 0.7148038, 0.9568627, 0, 1, 1,
0.897033, 0.630525, 2.387504, 0.9607843, 0, 1, 1,
0.8991764, -1.549694, 2.613687, 0.9686275, 0, 1, 1,
0.9067384, 0.2007588, -0.3259426, 0.972549, 0, 1, 1,
0.9084559, 1.007575, -0.5449445, 0.9803922, 0, 1, 1,
0.911229, 0.3083254, 0.4399859, 0.9843137, 0, 1, 1,
0.9115432, -2.097589, 2.9974, 0.9921569, 0, 1, 1,
0.9230559, -0.8128607, 2.777822, 0.9960784, 0, 1, 1,
0.930279, 0.6862655, 2.263067, 1, 0, 0.9960784, 1,
0.9383767, -0.568742, 1.416559, 1, 0, 0.9882353, 1,
0.9444957, -1.535262, 0.7325958, 1, 0, 0.9843137, 1,
0.9467248, -0.347593, 1.462116, 1, 0, 0.9764706, 1,
0.9512945, -0.2941619, 1.912904, 1, 0, 0.972549, 1,
0.9520714, 1.705221, 2.023709, 1, 0, 0.9647059, 1,
0.9549592, 1.419923, -0.6971556, 1, 0, 0.9607843, 1,
0.9596139, 0.3350986, 1.537875, 1, 0, 0.9529412, 1,
0.9630062, 0.1741142, 2.674947, 1, 0, 0.9490196, 1,
0.9647931, -0.3480321, 0.6463112, 1, 0, 0.9411765, 1,
0.9728478, 2.074713, -0.3180622, 1, 0, 0.9372549, 1,
0.9757826, 0.2526749, 1.131505, 1, 0, 0.9294118, 1,
0.9767956, 0.9317275, 1.083115, 1, 0, 0.9254902, 1,
0.9783403, 1.568065, -1.611223, 1, 0, 0.9176471, 1,
0.9841959, 1.863538, 1.88748, 1, 0, 0.9137255, 1,
0.9881102, -0.8577519, 3.065445, 1, 0, 0.9058824, 1,
0.9886674, -1.062131, 1.366771, 1, 0, 0.9019608, 1,
0.9991734, 2.011157, 1.100262, 1, 0, 0.8941177, 1,
1.002714, -0.6462564, 0.5321979, 1, 0, 0.8862745, 1,
1.002916, 1.103819, 1.582692, 1, 0, 0.8823529, 1,
1.018989, 1.19012, -0.5867227, 1, 0, 0.8745098, 1,
1.019554, 0.2227639, -1.36179, 1, 0, 0.8705882, 1,
1.021368, -0.06341608, 3.300903, 1, 0, 0.8627451, 1,
1.030748, -1.413536, 3.992756, 1, 0, 0.8588235, 1,
1.032391, -0.9585793, 3.293678, 1, 0, 0.8509804, 1,
1.03496, 1.57801, -0.7881624, 1, 0, 0.8470588, 1,
1.047083, -0.04818251, 3.047865, 1, 0, 0.8392157, 1,
1.047326, 1.813628, 2.101986, 1, 0, 0.8352941, 1,
1.052353, -0.7465429, 2.554083, 1, 0, 0.827451, 1,
1.081632, -1.54295, 2.406268, 1, 0, 0.8235294, 1,
1.082619, -0.1581901, 2.297196, 1, 0, 0.8156863, 1,
1.084284, -0.9987985, 0.9959182, 1, 0, 0.8117647, 1,
1.095676, 2.013596, -1.427046, 1, 0, 0.8039216, 1,
1.105058, 0.892759, 1.478087, 1, 0, 0.7960784, 1,
1.107492, 0.9615339, 1.535959, 1, 0, 0.7921569, 1,
1.116957, 1.082516, 0.6283519, 1, 0, 0.7843137, 1,
1.120288, -0.5514252, 2.182056, 1, 0, 0.7803922, 1,
1.128874, -0.2251511, 1.497533, 1, 0, 0.772549, 1,
1.131493, -1.161108, 1.449165, 1, 0, 0.7686275, 1,
1.132315, 0.7891008, -0.237234, 1, 0, 0.7607843, 1,
1.132701, 1.350505, 1.843063, 1, 0, 0.7568628, 1,
1.136898, -1.047576, 3.647226, 1, 0, 0.7490196, 1,
1.137794, -0.1404834, 2.216691, 1, 0, 0.7450981, 1,
1.138842, 0.5737451, 0.3451286, 1, 0, 0.7372549, 1,
1.140865, -0.5479903, 1.545473, 1, 0, 0.7333333, 1,
1.146571, -0.4358397, 2.194428, 1, 0, 0.7254902, 1,
1.154034, -0.3614644, 1.066387, 1, 0, 0.7215686, 1,
1.155381, -0.3289512, 0.5841984, 1, 0, 0.7137255, 1,
1.156464, -0.9073538, 0.9797536, 1, 0, 0.7098039, 1,
1.160857, 0.5740044, -1.216083, 1, 0, 0.7019608, 1,
1.164046, 0.993897, 0.4895352, 1, 0, 0.6941177, 1,
1.172718, 1.55323, 2.338983, 1, 0, 0.6901961, 1,
1.173307, -0.6931509, 2.172596, 1, 0, 0.682353, 1,
1.192531, -2.244298, 3.81766, 1, 0, 0.6784314, 1,
1.196426, 0.5299665, 1.240615, 1, 0, 0.6705883, 1,
1.199153, 1.60129, 0.2759277, 1, 0, 0.6666667, 1,
1.202149, 0.08541582, 3.293847, 1, 0, 0.6588235, 1,
1.20981, 0.5574657, -0.4264185, 1, 0, 0.654902, 1,
1.214577, 1.117497, 0.1833714, 1, 0, 0.6470588, 1,
1.223248, -0.9804229, 1.972628, 1, 0, 0.6431373, 1,
1.23906, -0.5521347, 1.882893, 1, 0, 0.6352941, 1,
1.247627, 0.3451732, 1.074237, 1, 0, 0.6313726, 1,
1.252176, 0.03890147, 1.784433, 1, 0, 0.6235294, 1,
1.257826, 0.2583587, 2.362149, 1, 0, 0.6196079, 1,
1.262694, -0.6565327, 1.400912, 1, 0, 0.6117647, 1,
1.264565, 2.314476, 0.3498214, 1, 0, 0.6078432, 1,
1.271579, -0.5959651, 0.8031583, 1, 0, 0.6, 1,
1.272587, 0.1021224, 0.9955042, 1, 0, 0.5921569, 1,
1.273906, 0.2011365, 1.872646, 1, 0, 0.5882353, 1,
1.274666, -1.667218, 3.174781, 1, 0, 0.5803922, 1,
1.278327, -0.4883463, 3.111914, 1, 0, 0.5764706, 1,
1.28415, 1.413101, 1.529587, 1, 0, 0.5686275, 1,
1.293206, -0.4507378, 2.066737, 1, 0, 0.5647059, 1,
1.304713, -0.4160467, 0.9379938, 1, 0, 0.5568628, 1,
1.311324, -0.2535692, 1.476324, 1, 0, 0.5529412, 1,
1.315518, -0.9772728, 2.665022, 1, 0, 0.5450981, 1,
1.321008, -0.78411, 2.295358, 1, 0, 0.5411765, 1,
1.323646, -0.2938626, 2.521593, 1, 0, 0.5333334, 1,
1.329067, -2.565877, 3.35403, 1, 0, 0.5294118, 1,
1.330706, 1.352936, 0.2695218, 1, 0, 0.5215687, 1,
1.331738, 0.9756109, 1.460639, 1, 0, 0.5176471, 1,
1.351868, 0.3091007, 1.479933, 1, 0, 0.509804, 1,
1.353972, -0.04206591, 1.903509, 1, 0, 0.5058824, 1,
1.357511, 0.5968371, 2.124778, 1, 0, 0.4980392, 1,
1.38184, -0.207104, 1.320594, 1, 0, 0.4901961, 1,
1.385661, 0.1453855, 3.076143, 1, 0, 0.4862745, 1,
1.389299, 0.5213962, 1.045648, 1, 0, 0.4784314, 1,
1.392267, 0.06164039, 2.077101, 1, 0, 0.4745098, 1,
1.394355, 0.1625403, 3.416053, 1, 0, 0.4666667, 1,
1.405792, -0.569933, 0.2675672, 1, 0, 0.4627451, 1,
1.406498, 0.04513399, 3.363518, 1, 0, 0.454902, 1,
1.406514, 1.151482, 1.64994, 1, 0, 0.4509804, 1,
1.41418, 0.547074, -0.1476342, 1, 0, 0.4431373, 1,
1.426653, 1.554143, 1.376104, 1, 0, 0.4392157, 1,
1.429224, -1.080335, 3.348088, 1, 0, 0.4313726, 1,
1.435301, 0.7725655, 1.481819, 1, 0, 0.427451, 1,
1.441647, -2.863961, 2.623916, 1, 0, 0.4196078, 1,
1.460326, -0.3448976, 2.380964, 1, 0, 0.4156863, 1,
1.465292, -1.019353, 3.346669, 1, 0, 0.4078431, 1,
1.466065, 1.416563, 0.6661142, 1, 0, 0.4039216, 1,
1.480436, 0.5167884, 0.9745898, 1, 0, 0.3960784, 1,
1.51493, 0.9500353, 1.759081, 1, 0, 0.3882353, 1,
1.517625, 1.545108, -0.4716532, 1, 0, 0.3843137, 1,
1.525048, 0.4427698, 1.181095, 1, 0, 0.3764706, 1,
1.553233, 1.298544, 1.715312, 1, 0, 0.372549, 1,
1.561258, -0.9205129, 3.022442, 1, 0, 0.3647059, 1,
1.564494, -0.925357, 3.874508, 1, 0, 0.3607843, 1,
1.569561, -1.356533, 2.099345, 1, 0, 0.3529412, 1,
1.570862, 0.153387, 1.817469, 1, 0, 0.3490196, 1,
1.572124, -1.81898, 3.592459, 1, 0, 0.3411765, 1,
1.589221, -0.984838, 2.492447, 1, 0, 0.3372549, 1,
1.60564, -0.1009836, 1.980534, 1, 0, 0.3294118, 1,
1.611095, 0.04582471, 0.2515268, 1, 0, 0.3254902, 1,
1.611869, 1.538967, 0.06648809, 1, 0, 0.3176471, 1,
1.62731, 0.6184641, 0.2133471, 1, 0, 0.3137255, 1,
1.629368, -0.3429082, 0.4230466, 1, 0, 0.3058824, 1,
1.637146, -0.4983517, 0.9682476, 1, 0, 0.2980392, 1,
1.646283, -0.119151, 0.5998799, 1, 0, 0.2941177, 1,
1.663306, -1.837531, 2.554296, 1, 0, 0.2862745, 1,
1.674906, 0.5244802, 2.394181, 1, 0, 0.282353, 1,
1.675607, 1.08791, 1.892574, 1, 0, 0.2745098, 1,
1.676716, 0.1654557, 1.685826, 1, 0, 0.2705882, 1,
1.678102, -1.111057, 2.764305, 1, 0, 0.2627451, 1,
1.690283, 0.6162431, -0.7249699, 1, 0, 0.2588235, 1,
1.692128, -1.818525, 2.387921, 1, 0, 0.2509804, 1,
1.70103, -0.2218351, 2.396646, 1, 0, 0.2470588, 1,
1.702408, 0.2070094, 1.70195, 1, 0, 0.2392157, 1,
1.702667, 0.4067679, -1.003174, 1, 0, 0.2352941, 1,
1.727929, -1.194593, 3.201658, 1, 0, 0.227451, 1,
1.743876, 2.959148, -0.6976675, 1, 0, 0.2235294, 1,
1.759667, -0.6609833, 1.811198, 1, 0, 0.2156863, 1,
1.761739, -0.06607132, 1.432656, 1, 0, 0.2117647, 1,
1.779373, -0.5055883, 2.421397, 1, 0, 0.2039216, 1,
1.801555, 0.7436485, 0.8916851, 1, 0, 0.1960784, 1,
1.808111, 0.2095086, 2.356633, 1, 0, 0.1921569, 1,
1.811165, 1.368202, 1.80769, 1, 0, 0.1843137, 1,
1.833723, -0.9488207, 2.192371, 1, 0, 0.1803922, 1,
1.861281, -0.6149298, -0.4799975, 1, 0, 0.172549, 1,
1.894886, -0.8121083, -0.1943808, 1, 0, 0.1686275, 1,
1.903533, 0.4476049, 2.804848, 1, 0, 0.1607843, 1,
1.920879, 0.5118916, 2.142564, 1, 0, 0.1568628, 1,
1.936824, -0.05183909, 0.1822332, 1, 0, 0.1490196, 1,
1.9468, -1.015595, 1.653332, 1, 0, 0.145098, 1,
1.951131, -1.155342, 2.21816, 1, 0, 0.1372549, 1,
2.017407, -0.2953746, 3.160963, 1, 0, 0.1333333, 1,
2.053926, 0.4774819, 1.22083, 1, 0, 0.1254902, 1,
2.075294, -1.221353, 0.04560955, 1, 0, 0.1215686, 1,
2.083533, 0.4870077, -0.1983201, 1, 0, 0.1137255, 1,
2.089855, 0.7725009, -0.9984029, 1, 0, 0.1098039, 1,
2.109978, -1.600974, 1.741862, 1, 0, 0.1019608, 1,
2.123525, 0.3710138, 2.262033, 1, 0, 0.09411765, 1,
2.136444, -0.5386425, 1.929976, 1, 0, 0.09019608, 1,
2.177275, -0.03975184, 1.039647, 1, 0, 0.08235294, 1,
2.259535, -1.260038, 2.734303, 1, 0, 0.07843138, 1,
2.265014, 1.451373, 1.664245, 1, 0, 0.07058824, 1,
2.278242, -0.7391184, 1.639398, 1, 0, 0.06666667, 1,
2.307114, -0.2659605, 3.442092, 1, 0, 0.05882353, 1,
2.44195, -1.591472, -0.04214464, 1, 0, 0.05490196, 1,
2.489259, -0.2249895, 0.0894649, 1, 0, 0.04705882, 1,
2.49143, 0.9028229, 1.82772, 1, 0, 0.04313726, 1,
2.608801, -0.4999701, 2.197081, 1, 0, 0.03529412, 1,
2.608807, 0.05839595, 2.386496, 1, 0, 0.03137255, 1,
2.63307, -2.549611, 2.449306, 1, 0, 0.02352941, 1,
2.686496, 0.4289928, 1.301288, 1, 0, 0.01960784, 1,
2.697818, -1.559126, 3.12892, 1, 0, 0.01176471, 1,
2.998168, -0.1161298, 1.956119, 1, 0, 0.007843138, 1
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
0.06027436, -4.365732, -8.660144, 0, -0.5, 0.5, 0.5,
0.06027436, -4.365732, -8.660144, 1, -0.5, 0.5, 0.5,
0.06027436, -4.365732, -8.660144, 1, 1.5, 0.5, 0.5,
0.06027436, -4.365732, -8.660144, 0, 1.5, 0.5, 0.5
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
-3.873565, -0.1153989, -8.660144, 0, -0.5, 0.5, 0.5,
-3.873565, -0.1153989, -8.660144, 1, -0.5, 0.5, 0.5,
-3.873565, -0.1153989, -8.660144, 1, 1.5, 0.5, 0.5,
-3.873565, -0.1153989, -8.660144, 0, 1.5, 0.5, 0.5
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
-3.873565, -4.365732, -0.5211585, 0, -0.5, 0.5, 0.5,
-3.873565, -4.365732, -0.5211585, 1, -0.5, 0.5, 0.5,
-3.873565, -4.365732, -0.5211585, 1, 1.5, 0.5, 0.5,
-3.873565, -4.365732, -0.5211585, 0, 1.5, 0.5, 0.5
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
-2, -3.384886, -6.781917,
2, -3.384886, -6.781917,
-2, -3.384886, -6.781917,
-2, -3.54836, -7.094954,
-1, -3.384886, -6.781917,
-1, -3.54836, -7.094954,
0, -3.384886, -6.781917,
0, -3.54836, -7.094954,
1, -3.384886, -6.781917,
1, -3.54836, -7.094954,
2, -3.384886, -6.781917,
2, -3.54836, -7.094954
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
-2, -3.875309, -7.721031, 0, -0.5, 0.5, 0.5,
-2, -3.875309, -7.721031, 1, -0.5, 0.5, 0.5,
-2, -3.875309, -7.721031, 1, 1.5, 0.5, 0.5,
-2, -3.875309, -7.721031, 0, 1.5, 0.5, 0.5,
-1, -3.875309, -7.721031, 0, -0.5, 0.5, 0.5,
-1, -3.875309, -7.721031, 1, -0.5, 0.5, 0.5,
-1, -3.875309, -7.721031, 1, 1.5, 0.5, 0.5,
-1, -3.875309, -7.721031, 0, 1.5, 0.5, 0.5,
0, -3.875309, -7.721031, 0, -0.5, 0.5, 0.5,
0, -3.875309, -7.721031, 1, -0.5, 0.5, 0.5,
0, -3.875309, -7.721031, 1, 1.5, 0.5, 0.5,
0, -3.875309, -7.721031, 0, 1.5, 0.5, 0.5,
1, -3.875309, -7.721031, 0, -0.5, 0.5, 0.5,
1, -3.875309, -7.721031, 1, -0.5, 0.5, 0.5,
1, -3.875309, -7.721031, 1, 1.5, 0.5, 0.5,
1, -3.875309, -7.721031, 0, 1.5, 0.5, 0.5,
2, -3.875309, -7.721031, 0, -0.5, 0.5, 0.5,
2, -3.875309, -7.721031, 1, -0.5, 0.5, 0.5,
2, -3.875309, -7.721031, 1, 1.5, 0.5, 0.5,
2, -3.875309, -7.721031, 0, 1.5, 0.5, 0.5
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
-2.965756, -3, -6.781917,
-2.965756, 3, -6.781917,
-2.965756, -3, -6.781917,
-3.117057, -3, -7.094954,
-2.965756, -2, -6.781917,
-3.117057, -2, -7.094954,
-2.965756, -1, -6.781917,
-3.117057, -1, -7.094954,
-2.965756, 0, -6.781917,
-3.117057, 0, -7.094954,
-2.965756, 1, -6.781917,
-3.117057, 1, -7.094954,
-2.965756, 2, -6.781917,
-3.117057, 2, -7.094954,
-2.965756, 3, -6.781917,
-3.117057, 3, -7.094954
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
-3.41966, -3, -7.721031, 0, -0.5, 0.5, 0.5,
-3.41966, -3, -7.721031, 1, -0.5, 0.5, 0.5,
-3.41966, -3, -7.721031, 1, 1.5, 0.5, 0.5,
-3.41966, -3, -7.721031, 0, 1.5, 0.5, 0.5,
-3.41966, -2, -7.721031, 0, -0.5, 0.5, 0.5,
-3.41966, -2, -7.721031, 1, -0.5, 0.5, 0.5,
-3.41966, -2, -7.721031, 1, 1.5, 0.5, 0.5,
-3.41966, -2, -7.721031, 0, 1.5, 0.5, 0.5,
-3.41966, -1, -7.721031, 0, -0.5, 0.5, 0.5,
-3.41966, -1, -7.721031, 1, -0.5, 0.5, 0.5,
-3.41966, -1, -7.721031, 1, 1.5, 0.5, 0.5,
-3.41966, -1, -7.721031, 0, 1.5, 0.5, 0.5,
-3.41966, 0, -7.721031, 0, -0.5, 0.5, 0.5,
-3.41966, 0, -7.721031, 1, -0.5, 0.5, 0.5,
-3.41966, 0, -7.721031, 1, 1.5, 0.5, 0.5,
-3.41966, 0, -7.721031, 0, 1.5, 0.5, 0.5,
-3.41966, 1, -7.721031, 0, -0.5, 0.5, 0.5,
-3.41966, 1, -7.721031, 1, -0.5, 0.5, 0.5,
-3.41966, 1, -7.721031, 1, 1.5, 0.5, 0.5,
-3.41966, 1, -7.721031, 0, 1.5, 0.5, 0.5,
-3.41966, 2, -7.721031, 0, -0.5, 0.5, 0.5,
-3.41966, 2, -7.721031, 1, -0.5, 0.5, 0.5,
-3.41966, 2, -7.721031, 1, 1.5, 0.5, 0.5,
-3.41966, 2, -7.721031, 0, 1.5, 0.5, 0.5,
-3.41966, 3, -7.721031, 0, -0.5, 0.5, 0.5,
-3.41966, 3, -7.721031, 1, -0.5, 0.5, 0.5,
-3.41966, 3, -7.721031, 1, 1.5, 0.5, 0.5,
-3.41966, 3, -7.721031, 0, 1.5, 0.5, 0.5
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
-2.965756, -3.384886, -6,
-2.965756, -3.384886, 4,
-2.965756, -3.384886, -6,
-3.117057, -3.54836, -6,
-2.965756, -3.384886, -4,
-3.117057, -3.54836, -4,
-2.965756, -3.384886, -2,
-3.117057, -3.54836, -2,
-2.965756, -3.384886, 0,
-3.117057, -3.54836, 0,
-2.965756, -3.384886, 2,
-3.117057, -3.54836, 2,
-2.965756, -3.384886, 4,
-3.117057, -3.54836, 4
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
-3.41966, -3.875309, -6, 0, -0.5, 0.5, 0.5,
-3.41966, -3.875309, -6, 1, -0.5, 0.5, 0.5,
-3.41966, -3.875309, -6, 1, 1.5, 0.5, 0.5,
-3.41966, -3.875309, -6, 0, 1.5, 0.5, 0.5,
-3.41966, -3.875309, -4, 0, -0.5, 0.5, 0.5,
-3.41966, -3.875309, -4, 1, -0.5, 0.5, 0.5,
-3.41966, -3.875309, -4, 1, 1.5, 0.5, 0.5,
-3.41966, -3.875309, -4, 0, 1.5, 0.5, 0.5,
-3.41966, -3.875309, -2, 0, -0.5, 0.5, 0.5,
-3.41966, -3.875309, -2, 1, -0.5, 0.5, 0.5,
-3.41966, -3.875309, -2, 1, 1.5, 0.5, 0.5,
-3.41966, -3.875309, -2, 0, 1.5, 0.5, 0.5,
-3.41966, -3.875309, 0, 0, -0.5, 0.5, 0.5,
-3.41966, -3.875309, 0, 1, -0.5, 0.5, 0.5,
-3.41966, -3.875309, 0, 1, 1.5, 0.5, 0.5,
-3.41966, -3.875309, 0, 0, 1.5, 0.5, 0.5,
-3.41966, -3.875309, 2, 0, -0.5, 0.5, 0.5,
-3.41966, -3.875309, 2, 1, -0.5, 0.5, 0.5,
-3.41966, -3.875309, 2, 1, 1.5, 0.5, 0.5,
-3.41966, -3.875309, 2, 0, 1.5, 0.5, 0.5,
-3.41966, -3.875309, 4, 0, -0.5, 0.5, 0.5,
-3.41966, -3.875309, 4, 1, -0.5, 0.5, 0.5,
-3.41966, -3.875309, 4, 1, 1.5, 0.5, 0.5,
-3.41966, -3.875309, 4, 0, 1.5, 0.5, 0.5
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
-2.965756, -3.384886, -6.781917,
-2.965756, 3.154088, -6.781917,
-2.965756, -3.384886, 5.7396,
-2.965756, 3.154088, 5.7396,
-2.965756, -3.384886, -6.781917,
-2.965756, -3.384886, 5.7396,
-2.965756, 3.154088, -6.781917,
-2.965756, 3.154088, 5.7396,
-2.965756, -3.384886, -6.781917,
3.086305, -3.384886, -6.781917,
-2.965756, -3.384886, 5.7396,
3.086305, -3.384886, 5.7396,
-2.965756, 3.154088, -6.781917,
3.086305, 3.154088, -6.781917,
-2.965756, 3.154088, 5.7396,
3.086305, 3.154088, 5.7396,
3.086305, -3.384886, -6.781917,
3.086305, 3.154088, -6.781917,
3.086305, -3.384886, 5.7396,
3.086305, 3.154088, 5.7396,
3.086305, -3.384886, -6.781917,
3.086305, -3.384886, 5.7396,
3.086305, 3.154088, -6.781917,
3.086305, 3.154088, 5.7396
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
var radius = 8.206188;
var distance = 36.51026;
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
mvMatrix.translate( -0.06027436, 0.1153989, 0.5211585 );
mvMatrix.scale( 1.466061, 1.356894, 0.7085956 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.51026);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
isoxazolidine<-read.table("isoxazolidine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxazolidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
```

```r
y<-isoxazolidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
```

```r
z<-isoxazolidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
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
-2.877619, -1.46828, -2.601372, 0, 0, 1, 1, 1,
-2.803345, -0.4015757, -3.191243, 1, 0, 0, 1, 1,
-2.785139, -0.2122398, -0.6210386, 1, 0, 0, 1, 1,
-2.685454, 0.6275712, -2.706443, 1, 0, 0, 1, 1,
-2.67921, -0.2402747, -0.1305476, 1, 0, 0, 1, 1,
-2.50829, -2.415891, -2.76091, 1, 0, 0, 1, 1,
-2.397524, -0.113114, -1.033404, 0, 0, 0, 1, 1,
-2.362225, 0.3278235, -1.222165, 0, 0, 0, 1, 1,
-2.323966, 0.05308196, -1.713684, 0, 0, 0, 1, 1,
-2.294502, -0.4328122, -1.920359, 0, 0, 0, 1, 1,
-2.251292, 0.07395604, 1.599632, 0, 0, 0, 1, 1,
-2.244997, 1.057959, -0.8544247, 0, 0, 0, 1, 1,
-2.230547, 0.7350067, 0.2600667, 0, 0, 0, 1, 1,
-2.108034, -1.038567, -2.346124, 1, 1, 1, 1, 1,
-2.103539, -0.1474102, -1.381301, 1, 1, 1, 1, 1,
-2.102723, 1.498777, -0.6014494, 1, 1, 1, 1, 1,
-2.096508, -0.9050766, -0.553308, 1, 1, 1, 1, 1,
-2.065505, -0.3376035, -3.164726, 1, 1, 1, 1, 1,
-2.02334, -0.8084438, -1.47839, 1, 1, 1, 1, 1,
-1.966792, -0.485579, -1.717054, 1, 1, 1, 1, 1,
-1.964905, 0.0541956, -2.822234, 1, 1, 1, 1, 1,
-1.961587, -0.3868461, -1.738725, 1, 1, 1, 1, 1,
-1.937568, 0.4396375, -2.613486, 1, 1, 1, 1, 1,
-1.935153, 0.3466729, -2.700264, 1, 1, 1, 1, 1,
-1.919442, -0.5268348, -1.760069, 1, 1, 1, 1, 1,
-1.887041, 0.4356602, -1.16172, 1, 1, 1, 1, 1,
-1.870033, 1.449688, -1.884935, 1, 1, 1, 1, 1,
-1.827688, 1.268049, -0.3230298, 1, 1, 1, 1, 1,
-1.82554, -0.2572767, -0.8834597, 0, 0, 1, 1, 1,
-1.779322, -0.4068519, -1.107951, 1, 0, 0, 1, 1,
-1.756743, -0.3971549, -0.9243211, 1, 0, 0, 1, 1,
-1.752746, -0.06056923, -1.595998, 1, 0, 0, 1, 1,
-1.752744, 0.3246757, -4.23948, 1, 0, 0, 1, 1,
-1.744151, 1.216294, -0.05209858, 1, 0, 0, 1, 1,
-1.736935, 0.4134143, -0.5082401, 0, 0, 0, 1, 1,
-1.732276, -0.3091569, -2.403472, 0, 0, 0, 1, 1,
-1.726973, -0.7877324, -0.7520234, 0, 0, 0, 1, 1,
-1.721479, -0.1088272, -3.233406, 0, 0, 0, 1, 1,
-1.709782, -1.30475, -2.684485, 0, 0, 0, 1, 1,
-1.696916, -1.013146, -2.109192, 0, 0, 0, 1, 1,
-1.682023, 0.8546348, -2.007234, 0, 0, 0, 1, 1,
-1.666289, 0.7012347, -1.313176, 1, 1, 1, 1, 1,
-1.654127, 0.7849586, -1.068606, 1, 1, 1, 1, 1,
-1.651489, 0.2514791, -1.893859, 1, 1, 1, 1, 1,
-1.605778, -0.2012535, -1.369719, 1, 1, 1, 1, 1,
-1.588716, -0.1700541, -0.5079769, 1, 1, 1, 1, 1,
-1.567605, -1.071772, -2.482606, 1, 1, 1, 1, 1,
-1.56127, 0.04910132, -1.195786, 1, 1, 1, 1, 1,
-1.559688, 0.5361115, -0.4523645, 1, 1, 1, 1, 1,
-1.546038, 0.4411039, -1.663896, 1, 1, 1, 1, 1,
-1.511232, 2.093839, -0.6988027, 1, 1, 1, 1, 1,
-1.503198, 0.2525374, -0.05992097, 1, 1, 1, 1, 1,
-1.489753, -1.663885, -1.226309, 1, 1, 1, 1, 1,
-1.486791, 2.211216, -0.3229079, 1, 1, 1, 1, 1,
-1.478616, -0.5241392, -1.147594, 1, 1, 1, 1, 1,
-1.475612, -1.045814, -1.879377, 1, 1, 1, 1, 1,
-1.47382, 1.641327, -1.684484, 0, 0, 1, 1, 1,
-1.465922, 0.9960604, 0.1015447, 1, 0, 0, 1, 1,
-1.461423, 0.405991, -0.8328943, 1, 0, 0, 1, 1,
-1.452911, -0.9374633, -3.001813, 1, 0, 0, 1, 1,
-1.435989, -0.5684305, -2.12271, 1, 0, 0, 1, 1,
-1.433381, -0.4824715, -1.291604, 1, 0, 0, 1, 1,
-1.431589, -0.3168773, -2.474991, 0, 0, 0, 1, 1,
-1.426709, 0.7370483, -0.7728114, 0, 0, 0, 1, 1,
-1.423522, -0.3586936, -2.671437, 0, 0, 0, 1, 1,
-1.421644, -0.7946924, -2.636446, 0, 0, 0, 1, 1,
-1.420142, 0.6791016, -1.904638, 0, 0, 0, 1, 1,
-1.416258, -0.141775, -2.463372, 0, 0, 0, 1, 1,
-1.401478, -1.068496, -2.246643, 0, 0, 0, 1, 1,
-1.393914, 0.9311211, -1.409755, 1, 1, 1, 1, 1,
-1.391907, -0.1003824, -2.82713, 1, 1, 1, 1, 1,
-1.381071, -0.3582653, -1.677025, 1, 1, 1, 1, 1,
-1.379109, -1.454274, -1.459586, 1, 1, 1, 1, 1,
-1.376956, 1.083347, -0.548803, 1, 1, 1, 1, 1,
-1.375476, -0.2161728, -0.425624, 1, 1, 1, 1, 1,
-1.373299, -0.2670496, -0.9457023, 1, 1, 1, 1, 1,
-1.367564, 0.4630757, -1.069413, 1, 1, 1, 1, 1,
-1.366808, -0.1133518, 0.1045054, 1, 1, 1, 1, 1,
-1.364904, 0.9937847, -0.8954861, 1, 1, 1, 1, 1,
-1.360285, -0.03742432, 0.508424, 1, 1, 1, 1, 1,
-1.359096, 0.8346133, -1.187721, 1, 1, 1, 1, 1,
-1.358535, -0.0506338, -2.172964, 1, 1, 1, 1, 1,
-1.34709, 1.435716, -1.670894, 1, 1, 1, 1, 1,
-1.344519, 0.955424, -1.883241, 1, 1, 1, 1, 1,
-1.342741, 0.1908831, -0.5613701, 0, 0, 1, 1, 1,
-1.335024, -0.0004922658, -0.1000557, 1, 0, 0, 1, 1,
-1.333485, -0.9319794, -0.8834801, 1, 0, 0, 1, 1,
-1.331293, -0.9172186, -1.469796, 1, 0, 0, 1, 1,
-1.314864, 0.8910779, -1.952867, 1, 0, 0, 1, 1,
-1.309189, 0.9832962, 1.001065, 1, 0, 0, 1, 1,
-1.29696, -2.584501, -0.8410589, 0, 0, 0, 1, 1,
-1.293139, 0.01566513, -0.3125914, 0, 0, 0, 1, 1,
-1.291956, -0.1038583, -2.485303, 0, 0, 0, 1, 1,
-1.290117, -0.7415714, -1.959164, 0, 0, 0, 1, 1,
-1.286244, -0.4433582, -2.015282, 0, 0, 0, 1, 1,
-1.27879, -1.543335, -3.167881, 0, 0, 0, 1, 1,
-1.277174, -0.05212775, -2.132285, 0, 0, 0, 1, 1,
-1.267381, 0.5797977, -1.04082, 1, 1, 1, 1, 1,
-1.266725, -0.6984388, -0.9395673, 1, 1, 1, 1, 1,
-1.259618, -1.336343, -3.339862, 1, 1, 1, 1, 1,
-1.257357, 0.003360506, -1.325194, 1, 1, 1, 1, 1,
-1.255868, -2.298541, -4.22049, 1, 1, 1, 1, 1,
-1.247042, 1.963558, -1.64814, 1, 1, 1, 1, 1,
-1.241941, -0.1354999, -1.956079, 1, 1, 1, 1, 1,
-1.240117, -0.2684514, -1.952727, 1, 1, 1, 1, 1,
-1.239297, -0.3070129, -0.9813843, 1, 1, 1, 1, 1,
-1.238456, 0.7527375, -1.225238, 1, 1, 1, 1, 1,
-1.234422, 1.076843, -1.214212, 1, 1, 1, 1, 1,
-1.23187, 0.0532711, -2.165591, 1, 1, 1, 1, 1,
-1.216935, 0.2773408, -1.600142, 1, 1, 1, 1, 1,
-1.212968, -0.09436508, -2.862656, 1, 1, 1, 1, 1,
-1.211071, 0.8553751, 1.131085, 1, 1, 1, 1, 1,
-1.207795, -1.25063, -0.4001336, 0, 0, 1, 1, 1,
-1.206693, -0.4684575, -1.20524, 1, 0, 0, 1, 1,
-1.204636, 1.477571, -1.620282, 1, 0, 0, 1, 1,
-1.195992, -0.4616484, -1.670851, 1, 0, 0, 1, 1,
-1.184895, 0.1005467, -1.625571, 1, 0, 0, 1, 1,
-1.184044, 0.8242664, -1.716657, 1, 0, 0, 1, 1,
-1.179196, -0.04632203, -1.143331, 0, 0, 0, 1, 1,
-1.179157, 0.04636889, -1.664874, 0, 0, 0, 1, 1,
-1.171109, 0.8651736, -1.711379, 0, 0, 0, 1, 1,
-1.169653, -0.617938, -2.54292, 0, 0, 0, 1, 1,
-1.169558, 2.180289, -0.4559608, 0, 0, 0, 1, 1,
-1.167198, 1.311814, 0.5008621, 0, 0, 0, 1, 1,
-1.157621, 0.9888439, -0.21109, 0, 0, 0, 1, 1,
-1.149399, -1.28492, -1.806743, 1, 1, 1, 1, 1,
-1.145432, -0.4843042, -1.675273, 1, 1, 1, 1, 1,
-1.142519, 0.003133641, -2.52919, 1, 1, 1, 1, 1,
-1.142475, -1.754481, -3.827659, 1, 1, 1, 1, 1,
-1.130963, 0.9799774, -2.533708, 1, 1, 1, 1, 1,
-1.127998, 0.848339, -2.501136, 1, 1, 1, 1, 1,
-1.127333, 0.3352852, -2.097405, 1, 1, 1, 1, 1,
-1.12555, 0.7683746, -1.006605, 1, 1, 1, 1, 1,
-1.123878, -1.214061, -1.900389, 1, 1, 1, 1, 1,
-1.11773, -1.869067, -1.431939, 1, 1, 1, 1, 1,
-1.11718, -0.4200049, -3.755327, 1, 1, 1, 1, 1,
-1.111352, 0.9009454, 0.19976, 1, 1, 1, 1, 1,
-1.107811, 0.0480908, -3.326032, 1, 1, 1, 1, 1,
-1.10694, 0.5459797, 1.010869, 1, 1, 1, 1, 1,
-1.105062, 1.539101, -1.97281, 1, 1, 1, 1, 1,
-1.100847, -0.3571722, -0.6699396, 0, 0, 1, 1, 1,
-1.09208, 0.5783112, -1.927195, 1, 0, 0, 1, 1,
-1.089728, -1.226537, -0.1759375, 1, 0, 0, 1, 1,
-1.08535, 1.980295, -0.9812931, 1, 0, 0, 1, 1,
-1.084633, -0.3702953, -1.804614, 1, 0, 0, 1, 1,
-1.081723, 1.249277, -0.783744, 1, 0, 0, 1, 1,
-1.080887, -0.016675, -2.71536, 0, 0, 0, 1, 1,
-1.071632, -0.1182974, -3.027592, 0, 0, 0, 1, 1,
-1.066188, -0.1628349, 0.05349101, 0, 0, 0, 1, 1,
-1.059581, 1.021901, 0.2486159, 0, 0, 0, 1, 1,
-1.047968, 1.314302, -0.9885091, 0, 0, 0, 1, 1,
-1.047849, -1.683178, -3.637845, 0, 0, 0, 1, 1,
-1.046114, 1.726274, 0.3559014, 0, 0, 0, 1, 1,
-1.044494, 0.07483144, -0.7979129, 1, 1, 1, 1, 1,
-1.033892, 0.3316599, -0.6291354, 1, 1, 1, 1, 1,
-1.031752, -1.072105, -3.056081, 1, 1, 1, 1, 1,
-1.03161, -0.4603634, -3.524668, 1, 1, 1, 1, 1,
-1.030595, -0.9390064, -2.393604, 1, 1, 1, 1, 1,
-1.022855, 0.2958041, 0.4800379, 1, 1, 1, 1, 1,
-1.022485, -0.7338258, -1.012279, 1, 1, 1, 1, 1,
-1.011978, -0.7466243, -1.589041, 1, 1, 1, 1, 1,
-1.010458, 1.606806, -2.90647, 1, 1, 1, 1, 1,
-1.010236, 1.196012, 0.7273251, 1, 1, 1, 1, 1,
-1.007976, -0.04138744, 0.5110976, 1, 1, 1, 1, 1,
-1.006881, 1.595993, 0.5559918, 1, 1, 1, 1, 1,
-1.00394, -1.456355, -2.321451, 1, 1, 1, 1, 1,
-1.003207, -0.4089108, -2.4434, 1, 1, 1, 1, 1,
-0.9994262, 1.886603, -0.250277, 1, 1, 1, 1, 1,
-0.9972569, -1.023754, 0.4102868, 0, 0, 1, 1, 1,
-0.9965376, 1.198233, 0.1297673, 1, 0, 0, 1, 1,
-0.9964741, -0.2604417, -0.666828, 1, 0, 0, 1, 1,
-0.9954969, 0.9950742, -0.6335731, 1, 0, 0, 1, 1,
-0.9942635, -1.774226, -3.160689, 1, 0, 0, 1, 1,
-0.992396, 0.1236914, -0.0971073, 1, 0, 0, 1, 1,
-0.9885553, 1.412658, 0.2407851, 0, 0, 0, 1, 1,
-0.9868529, -2.270865, -3.40855, 0, 0, 0, 1, 1,
-0.9858065, 0.6406402, -0.2503775, 0, 0, 0, 1, 1,
-0.9778864, -0.01267556, -1.73384, 0, 0, 0, 1, 1,
-0.9766128, -0.5568109, -1.46415, 0, 0, 0, 1, 1,
-0.9712549, -0.1255669, -1.688964, 0, 0, 0, 1, 1,
-0.9661072, 1.176425, -0.2083064, 0, 0, 0, 1, 1,
-0.964059, 0.2834016, -0.1180158, 1, 1, 1, 1, 1,
-0.9633604, -0.5210251, -2.160778, 1, 1, 1, 1, 1,
-0.9579436, 1.207007, -0.08426732, 1, 1, 1, 1, 1,
-0.9536463, -0.3412829, -3.760997, 1, 1, 1, 1, 1,
-0.9484001, 1.202788, -1.390953, 1, 1, 1, 1, 1,
-0.9413475, -1.757854, -3.064487, 1, 1, 1, 1, 1,
-0.9407514, -0.169716, 0.4178821, 1, 1, 1, 1, 1,
-0.9393959, -0.4461195, -2.041435, 1, 1, 1, 1, 1,
-0.9393007, -0.9585289, -2.117838, 1, 1, 1, 1, 1,
-0.9311029, 0.09455571, -2.86651, 1, 1, 1, 1, 1,
-0.9231777, -0.8417549, -2.861041, 1, 1, 1, 1, 1,
-0.9219479, -1.204514, -3.800051, 1, 1, 1, 1, 1,
-0.9136089, 0.1178596, -1.610099, 1, 1, 1, 1, 1,
-0.9132811, 0.06444542, -2.601006, 1, 1, 1, 1, 1,
-0.9130587, 1.580588, -1.143281, 1, 1, 1, 1, 1,
-0.9118413, 0.2763985, -0.758193, 0, 0, 1, 1, 1,
-0.9114904, 0.1974323, -1.998222, 1, 0, 0, 1, 1,
-0.9060533, 0.8371128, -0.4186603, 1, 0, 0, 1, 1,
-0.9021749, 0.9147642, -0.8051128, 1, 0, 0, 1, 1,
-0.8986236, -0.4465569, -2.071659, 1, 0, 0, 1, 1,
-0.8972704, 0.3282697, -1.575574, 1, 0, 0, 1, 1,
-0.8932464, 2.763399, -2.314575, 0, 0, 0, 1, 1,
-0.8821295, -1.431482, -2.329588, 0, 0, 0, 1, 1,
-0.8818648, -2.097802, -2.239936, 0, 0, 0, 1, 1,
-0.8777151, -0.5702096, -1.829792, 0, 0, 0, 1, 1,
-0.8773749, 1.427762, 0.008897577, 0, 0, 0, 1, 1,
-0.8684959, -0.4565388, -1.551736, 0, 0, 0, 1, 1,
-0.8586031, 0.7382676, -1.583118, 0, 0, 0, 1, 1,
-0.8481901, -0.3883096, -3.413238, 1, 1, 1, 1, 1,
-0.8453513, -1.125775, -4.394207, 1, 1, 1, 1, 1,
-0.8361529, -0.8572606, -1.138566, 1, 1, 1, 1, 1,
-0.836148, 1.53808, 0.04727894, 1, 1, 1, 1, 1,
-0.8280998, -1.082715, -2.904106, 1, 1, 1, 1, 1,
-0.8272857, 0.2076905, -1.074457, 1, 1, 1, 1, 1,
-0.8270935, 0.4455399, -0.4284679, 1, 1, 1, 1, 1,
-0.826808, 2.2493, 0.7188336, 1, 1, 1, 1, 1,
-0.8250501, -2.307132, -3.281141, 1, 1, 1, 1, 1,
-0.8237662, -0.8858128, -1.64583, 1, 1, 1, 1, 1,
-0.8236182, -0.2726678, -2.256591, 1, 1, 1, 1, 1,
-0.8230255, 1.489941, 0.0106924, 1, 1, 1, 1, 1,
-0.8214326, -0.6169084, -0.07779592, 1, 1, 1, 1, 1,
-0.8117028, 0.6582859, -0.8386043, 1, 1, 1, 1, 1,
-0.8086221, -0.9149431, -2.240388, 1, 1, 1, 1, 1,
-0.8076879, -0.2908966, -2.458619, 0, 0, 1, 1, 1,
-0.806798, 0.659428, -0.9131519, 1, 0, 0, 1, 1,
-0.7947724, -2.115959, -4.420254, 1, 0, 0, 1, 1,
-0.7935311, 0.25813, -2.91633, 1, 0, 0, 1, 1,
-0.7856947, 0.9858493, -1.021516, 1, 0, 0, 1, 1,
-0.784839, -0.2118658, -0.5995134, 1, 0, 0, 1, 1,
-0.7839068, 0.2357639, -0.09730554, 0, 0, 0, 1, 1,
-0.7836803, -1.621857, -2.881375, 0, 0, 0, 1, 1,
-0.7826664, -2.003085, -1.135441, 0, 0, 0, 1, 1,
-0.7681175, -0.1700427, -3.118778, 0, 0, 0, 1, 1,
-0.7642134, -0.09646652, -1.353042, 0, 0, 0, 1, 1,
-0.7632006, 0.2408513, -0.8202158, 0, 0, 0, 1, 1,
-0.7583184, -0.2818774, -3.981826, 0, 0, 0, 1, 1,
-0.7533326, 1.104611, -2.691594, 1, 1, 1, 1, 1,
-0.7528104, -0.4026313, -1.646212, 1, 1, 1, 1, 1,
-0.7496213, 0.08997914, -2.431014, 1, 1, 1, 1, 1,
-0.7485566, 1.247645, 1.031221, 1, 1, 1, 1, 1,
-0.744531, 1.360017, -0.4191942, 1, 1, 1, 1, 1,
-0.737222, 0.724405, -0.6177194, 1, 1, 1, 1, 1,
-0.7355031, 0.1270439, 0.2762223, 1, 1, 1, 1, 1,
-0.7354718, -0.7471921, -1.43748, 1, 1, 1, 1, 1,
-0.7353848, -2.420914, -2.161037, 1, 1, 1, 1, 1,
-0.7309929, 0.2326362, 0.4447979, 1, 1, 1, 1, 1,
-0.7272566, 1.621724, 0.4394448, 1, 1, 1, 1, 1,
-0.7256862, -0.2074681, -0.7498899, 1, 1, 1, 1, 1,
-0.7063475, 0.2337885, -0.660396, 1, 1, 1, 1, 1,
-0.7032604, -0.06881265, -2.282743, 1, 1, 1, 1, 1,
-0.6935681, 1.116964, 0.3856408, 1, 1, 1, 1, 1,
-0.6928746, -0.3330685, -1.806666, 0, 0, 1, 1, 1,
-0.6872644, 0.6414806, -0.518673, 1, 0, 0, 1, 1,
-0.6854712, 0.7025421, -0.935568, 1, 0, 0, 1, 1,
-0.6843557, 0.5416284, 0.6702631, 1, 0, 0, 1, 1,
-0.6817774, 0.7791392, 0.8132909, 1, 0, 0, 1, 1,
-0.6802726, -1.241999, -3.863096, 1, 0, 0, 1, 1,
-0.6791185, -0.921161, -3.058546, 0, 0, 0, 1, 1,
-0.6789326, -0.6770739, -2.341893, 0, 0, 0, 1, 1,
-0.6765447, -1.647738, -2.731625, 0, 0, 0, 1, 1,
-0.675657, 0.1811798, -1.595529, 0, 0, 0, 1, 1,
-0.6749629, 1.123244, 1.809066, 0, 0, 0, 1, 1,
-0.6701925, -1.758918, -2.160375, 0, 0, 0, 1, 1,
-0.6666161, -1.291599, -1.675451, 0, 0, 0, 1, 1,
-0.6639414, -1.087575, -3.080614, 1, 1, 1, 1, 1,
-0.663609, 0.6554789, -0.6932606, 1, 1, 1, 1, 1,
-0.6609849, -0.1934564, -1.935246, 1, 1, 1, 1, 1,
-0.6577853, 0.4928423, -1.860356, 1, 1, 1, 1, 1,
-0.6567074, -0.4758575, 0.4488215, 1, 1, 1, 1, 1,
-0.6481323, 1.730358, -0.7248313, 1, 1, 1, 1, 1,
-0.6444475, 0.112116, -1.821494, 1, 1, 1, 1, 1,
-0.6420788, 0.5673908, -1.069203, 1, 1, 1, 1, 1,
-0.6413801, -0.2487757, -1.671592, 1, 1, 1, 1, 1,
-0.6412176, 1.631092, 0.09716118, 1, 1, 1, 1, 1,
-0.6362835, 2.080059, 1.445786, 1, 1, 1, 1, 1,
-0.633814, -2.100366, -3.222384, 1, 1, 1, 1, 1,
-0.6327312, 1.263449, -1.089674, 1, 1, 1, 1, 1,
-0.6249938, 1.181005, -1.109926, 1, 1, 1, 1, 1,
-0.6243899, -0.5260764, -1.355775, 1, 1, 1, 1, 1,
-0.6192206, -1.095751, -2.234458, 0, 0, 1, 1, 1,
-0.6174148, 1.102684, -1.692281, 1, 0, 0, 1, 1,
-0.6163326, -1.082983, -2.688414, 1, 0, 0, 1, 1,
-0.6147295, 1.045981, -0.723578, 1, 0, 0, 1, 1,
-0.6041071, -0.1668661, -3.362384, 1, 0, 0, 1, 1,
-0.6030665, 0.3727901, -0.4754824, 1, 0, 0, 1, 1,
-0.5946222, -2.050462, -2.288138, 0, 0, 0, 1, 1,
-0.5929178, 1.228375, 0.01189852, 0, 0, 0, 1, 1,
-0.5927618, 0.4278481, -0.4596081, 0, 0, 0, 1, 1,
-0.5925695, 0.110045, -2.15372, 0, 0, 0, 1, 1,
-0.5877079, -1.374766, -3.316203, 0, 0, 0, 1, 1,
-0.5873601, 0.3286215, 0.8836998, 0, 0, 0, 1, 1,
-0.5869411, -0.4686901, -4.112095, 0, 0, 0, 1, 1,
-0.5865527, -0.8496405, -1.85826, 1, 1, 1, 1, 1,
-0.5593774, -0.5386233, -2.654661, 1, 1, 1, 1, 1,
-0.5525559, -0.689212, -2.024609, 1, 1, 1, 1, 1,
-0.5504526, 0.6389682, -0.0001461187, 1, 1, 1, 1, 1,
-0.5458777, -0.4322471, -3.216269, 1, 1, 1, 1, 1,
-0.5420732, 0.5125833, -1.079787, 1, 1, 1, 1, 1,
-0.5395983, -0.6147686, -1.543773, 1, 1, 1, 1, 1,
-0.5375158, -0.6287776, -1.819005, 1, 1, 1, 1, 1,
-0.5312316, 1.074715, -1.02268, 1, 1, 1, 1, 1,
-0.5310053, -1.401789, -2.818738, 1, 1, 1, 1, 1,
-0.5290439, -0.4352077, -1.664193, 1, 1, 1, 1, 1,
-0.5238675, -2.289057, -2.221433, 1, 1, 1, 1, 1,
-0.5234364, -0.956947, -3.668905, 1, 1, 1, 1, 1,
-0.5227438, -1.291612, -3.618144, 1, 1, 1, 1, 1,
-0.5216367, 0.2124441, -0.808917, 1, 1, 1, 1, 1,
-0.5163164, 0.6424101, 0.3879447, 0, 0, 1, 1, 1,
-0.5148913, -0.5651242, -1.753259, 1, 0, 0, 1, 1,
-0.5098978, -0.6700956, -2.719614, 1, 0, 0, 1, 1,
-0.5078104, 0.694038, -1.174654, 1, 0, 0, 1, 1,
-0.5069484, 0.3191885, 0.9778388, 1, 0, 0, 1, 1,
-0.5032513, 0.5363191, 1.298169, 1, 0, 0, 1, 1,
-0.5019491, 0.3166987, -0.9917974, 0, 0, 0, 1, 1,
-0.499879, -0.9782555, -4.436977, 0, 0, 0, 1, 1,
-0.4975754, -1.01174, -3.14918, 0, 0, 0, 1, 1,
-0.4968591, 1.292423, -0.7906825, 0, 0, 0, 1, 1,
-0.4964308, 0.6245202, 0.2461783, 0, 0, 0, 1, 1,
-0.4902822, 0.5540047, 0.2889933, 0, 0, 0, 1, 1,
-0.4831805, 0.7873609, -1.876963, 0, 0, 0, 1, 1,
-0.4727293, -0.6657611, -1.925554, 1, 1, 1, 1, 1,
-0.4664492, 1.400084, -1.160373, 1, 1, 1, 1, 1,
-0.4635683, -0.9597125, -1.348963, 1, 1, 1, 1, 1,
-0.4614102, 1.467001, -0.2444971, 1, 1, 1, 1, 1,
-0.4596519, 0.004743373, -2.0196, 1, 1, 1, 1, 1,
-0.4595981, 0.1688848, -0.7901084, 1, 1, 1, 1, 1,
-0.454752, -0.5784264, -2.15379, 1, 1, 1, 1, 1,
-0.4523595, -0.144927, 0.153632, 1, 1, 1, 1, 1,
-0.4470319, 0.04436789, -1.96975, 1, 1, 1, 1, 1,
-0.44603, -0.3049451, -3.597739, 1, 1, 1, 1, 1,
-0.4452072, 0.4622333, -1.36819, 1, 1, 1, 1, 1,
-0.4392311, 1.131921, -0.09001897, 1, 1, 1, 1, 1,
-0.4336707, 0.2356952, -0.7171096, 1, 1, 1, 1, 1,
-0.430032, 0.7522828, -1.218162, 1, 1, 1, 1, 1,
-0.4290919, -0.002331467, -1.495023, 1, 1, 1, 1, 1,
-0.4266795, -0.3680694, -0.9111837, 0, 0, 1, 1, 1,
-0.4240722, 0.1559489, -2.220476, 1, 0, 0, 1, 1,
-0.4225859, -0.5176811, -2.652886, 1, 0, 0, 1, 1,
-0.420862, 0.5826699, 0.3400593, 1, 0, 0, 1, 1,
-0.4161427, -1.115704, -3.862461, 1, 0, 0, 1, 1,
-0.4096697, 1.682412, 1.435022, 1, 0, 0, 1, 1,
-0.4064577, -0.8762457, -1.906105, 0, 0, 0, 1, 1,
-0.4060197, 0.4420049, 1.24967, 0, 0, 0, 1, 1,
-0.4032892, 0.9957698, -0.7329804, 0, 0, 0, 1, 1,
-0.3996563, -0.7313326, -2.987492, 0, 0, 0, 1, 1,
-0.3931036, 1.228469, -1.534931, 0, 0, 0, 1, 1,
-0.3913589, 2.186524, 2.620401, 0, 0, 0, 1, 1,
-0.3896524, 1.502861, -1.378916, 0, 0, 0, 1, 1,
-0.3833552, 0.8343114, -0.9178393, 1, 1, 1, 1, 1,
-0.3800415, -1.677654, -2.517106, 1, 1, 1, 1, 1,
-0.3788013, 0.8958504, 0.1602849, 1, 1, 1, 1, 1,
-0.3703131, 1.054212, -1.37206, 1, 1, 1, 1, 1,
-0.3696783, 0.3229686, -1.193345, 1, 1, 1, 1, 1,
-0.3607167, 0.1377182, -1.954533, 1, 1, 1, 1, 1,
-0.3574275, -0.1562079, -2.126773, 1, 1, 1, 1, 1,
-0.3475812, 1.713594, 0.4750277, 1, 1, 1, 1, 1,
-0.3464729, -0.465048, -1.869809, 1, 1, 1, 1, 1,
-0.3430294, -0.990045, -2.952385, 1, 1, 1, 1, 1,
-0.3404225, 1.039418, -0.07852992, 1, 1, 1, 1, 1,
-0.3360704, -0.7978337, -4.665405, 1, 1, 1, 1, 1,
-0.334592, 0.4220933, -0.508288, 1, 1, 1, 1, 1,
-0.3345885, -0.3256448, -4.163918, 1, 1, 1, 1, 1,
-0.3345562, 0.1112655, -2.231342, 1, 1, 1, 1, 1,
-0.3184614, 0.1577964, -1.291914, 0, 0, 1, 1, 1,
-0.3165614, -0.2855521, -5.563652, 1, 0, 0, 1, 1,
-0.3157647, -1.000532, -3.337475, 1, 0, 0, 1, 1,
-0.3139432, -0.582233, -3.009172, 1, 0, 0, 1, 1,
-0.3127311, -1.701298, -3.036601, 1, 0, 0, 1, 1,
-0.3063783, 1.258568, 0.5716657, 1, 0, 0, 1, 1,
-0.3058646, 0.3237135, -2.000668, 0, 0, 0, 1, 1,
-0.3046978, 0.1104372, -0.7038382, 0, 0, 0, 1, 1,
-0.3032077, -1.037674, -1.15436, 0, 0, 0, 1, 1,
-0.3018163, -0.00682458, -2.104653, 0, 0, 0, 1, 1,
-0.3003068, 0.9466728, -0.9688472, 0, 0, 0, 1, 1,
-0.2944188, 1.09486, 0.7070414, 0, 0, 0, 1, 1,
-0.2919858, 0.5345918, -0.3670434, 0, 0, 0, 1, 1,
-0.2915262, 0.7302691, 0.9766089, 1, 1, 1, 1, 1,
-0.2902432, 1.012612, 0.009425955, 1, 1, 1, 1, 1,
-0.2883421, 1.181126, -0.5768942, 1, 1, 1, 1, 1,
-0.2875335, 1.204322, 0.5298952, 1, 1, 1, 1, 1,
-0.2859229, 0.1185855, -0.3735919, 1, 1, 1, 1, 1,
-0.2857875, -1.025375, -3.118891, 1, 1, 1, 1, 1,
-0.2852028, -0.08588693, -0.5320649, 1, 1, 1, 1, 1,
-0.2744272, -0.03383234, -1.541272, 1, 1, 1, 1, 1,
-0.2681671, -2.01792, -5.637892, 1, 1, 1, 1, 1,
-0.2673661, 0.1424555, -1.496484, 1, 1, 1, 1, 1,
-0.2658547, 2.57021, -0.9525563, 1, 1, 1, 1, 1,
-0.2593598, 0.3763896, -1.116138, 1, 1, 1, 1, 1,
-0.2578398, -0.3900667, -2.350496, 1, 1, 1, 1, 1,
-0.2523916, -1.064492, -2.589976, 1, 1, 1, 1, 1,
-0.25117, 0.843667, -0.1950624, 1, 1, 1, 1, 1,
-0.2334738, -1.015497, -2.971828, 0, 0, 1, 1, 1,
-0.2309777, 0.7669286, -1.579279, 1, 0, 0, 1, 1,
-0.2300441, -0.2189771, -2.844333, 1, 0, 0, 1, 1,
-0.2279498, -1.697563, -2.164175, 1, 0, 0, 1, 1,
-0.2259527, 0.8110589, -1.950654, 1, 0, 0, 1, 1,
-0.225749, 1.577195, -1.021627, 1, 0, 0, 1, 1,
-0.2252198, 1.034897, 0.5661966, 0, 0, 0, 1, 1,
-0.2249417, -0.6672128, -4.321908, 0, 0, 0, 1, 1,
-0.2221835, -1.031216, -1.753742, 0, 0, 0, 1, 1,
-0.2171705, 0.852201, 1.138527, 0, 0, 0, 1, 1,
-0.2146988, -0.340394, -2.392102, 0, 0, 0, 1, 1,
-0.2131198, -0.2837801, -2.0015, 0, 0, 0, 1, 1,
-0.21251, 0.4717395, -1.78512, 0, 0, 0, 1, 1,
-0.2117528, 0.0739299, -1.684448, 1, 1, 1, 1, 1,
-0.2113231, 0.1348071, -0.9359275, 1, 1, 1, 1, 1,
-0.2081366, 1.023049, -1.785924, 1, 1, 1, 1, 1,
-0.2079842, -1.741931, -3.531957, 1, 1, 1, 1, 1,
-0.2053384, 0.8583729, -0.8982006, 1, 1, 1, 1, 1,
-0.2042599, 1.492077, -1.807585, 1, 1, 1, 1, 1,
-0.2020792, 0.4523565, -0.360085, 1, 1, 1, 1, 1,
-0.1980089, -1.242725, -1.828467, 1, 1, 1, 1, 1,
-0.1962326, -0.7355481, -5.264071, 1, 1, 1, 1, 1,
-0.1960681, -0.03448282, -1.449779, 1, 1, 1, 1, 1,
-0.1922332, 0.4550863, 1.127528, 1, 1, 1, 1, 1,
-0.187084, -0.2887062, -2.905417, 1, 1, 1, 1, 1,
-0.1862048, 0.4966808, -0.8960236, 1, 1, 1, 1, 1,
-0.1860961, 1.36601, 0.4903384, 1, 1, 1, 1, 1,
-0.1763026, -0.7104528, -1.500498, 1, 1, 1, 1, 1,
-0.176042, 0.1985473, -0.770952, 0, 0, 1, 1, 1,
-0.1721225, 2.684302, -0.1701748, 1, 0, 0, 1, 1,
-0.1671195, 0.5200548, 0.07545669, 1, 0, 0, 1, 1,
-0.1643768, 0.3084044, 0.2228871, 1, 0, 0, 1, 1,
-0.1600429, 0.1062439, -1.993731, 1, 0, 0, 1, 1,
-0.1549421, 1.342682, -1.591179, 1, 0, 0, 1, 1,
-0.152066, -0.2520335, -1.539298, 0, 0, 0, 1, 1,
-0.1413999, 0.5243606, 0.005854242, 0, 0, 0, 1, 1,
-0.1405969, -0.7878881, -2.477359, 0, 0, 0, 1, 1,
-0.140468, 0.8996453, -0.3788758, 0, 0, 0, 1, 1,
-0.137117, -0.2728027, -2.620008, 0, 0, 0, 1, 1,
-0.1334933, 0.02862979, -3.060682, 0, 0, 0, 1, 1,
-0.1326641, -0.1511711, -2.567539, 0, 0, 0, 1, 1,
-0.1320339, 1.26876, 0.4013489, 1, 1, 1, 1, 1,
-0.1316577, -1.158208, -6.599565, 1, 1, 1, 1, 1,
-0.1312198, 3.033406, -1.082811, 1, 1, 1, 1, 1,
-0.1268606, 1.987826, 2.087029, 1, 1, 1, 1, 1,
-0.1247001, 0.1420869, -0.2274896, 1, 1, 1, 1, 1,
-0.12289, -0.1711794, -0.1232749, 1, 1, 1, 1, 1,
-0.1208142, 0.7532399, -0.09620809, 1, 1, 1, 1, 1,
-0.1177635, 0.4695852, 0.8250028, 1, 1, 1, 1, 1,
-0.1168657, -0.2827996, -3.870845, 1, 1, 1, 1, 1,
-0.09895063, -0.7610711, -1.385187, 1, 1, 1, 1, 1,
-0.09851491, 0.7468697, -0.7912441, 1, 1, 1, 1, 1,
-0.09770937, 1.144252, -0.8920886, 1, 1, 1, 1, 1,
-0.09170288, -0.4723653, -2.302554, 1, 1, 1, 1, 1,
-0.09047406, -0.5070095, -2.017542, 1, 1, 1, 1, 1,
-0.08891515, 0.5292521, 0.9351963, 1, 1, 1, 1, 1,
-0.08631125, -2.001546, -3.778682, 0, 0, 1, 1, 1,
-0.08402027, 0.1847638, -1.085165, 1, 0, 0, 1, 1,
-0.07986869, 0.8197675, 0.1823146, 1, 0, 0, 1, 1,
-0.07894597, 1.022286, -0.7875143, 1, 0, 0, 1, 1,
-0.07831291, 0.3006134, -1.02891, 1, 0, 0, 1, 1,
-0.07695912, 0.06540669, -1.77929, 1, 0, 0, 1, 1,
-0.07436265, -0.5242383, -2.23492, 0, 0, 0, 1, 1,
-0.07337255, 1.648543, 0.2457676, 0, 0, 0, 1, 1,
-0.07051458, 0.1093566, 0.2873775, 0, 0, 0, 1, 1,
-0.06651474, -1.21159, -2.352981, 0, 0, 0, 1, 1,
-0.06447138, -2.095331, -5.464962, 0, 0, 0, 1, 1,
-0.05970542, -0.2050074, -3.102797, 0, 0, 0, 1, 1,
-0.05888924, 0.658514, 0.9956093, 0, 0, 0, 1, 1,
-0.05672925, 0.5686928, 0.205178, 1, 1, 1, 1, 1,
-0.0523291, -0.9519389, -2.362578, 1, 1, 1, 1, 1,
-0.05113927, -1.575943, -2.154536, 1, 1, 1, 1, 1,
-0.0500432, -0.5510689, -3.236489, 1, 1, 1, 1, 1,
-0.05002303, -3.289658, -4.638779, 1, 1, 1, 1, 1,
-0.04654741, -0.9215073, -4.442555, 1, 1, 1, 1, 1,
-0.04285287, 0.6208462, 0.03788157, 1, 1, 1, 1, 1,
-0.04172814, 1.403144, -0.1325352, 1, 1, 1, 1, 1,
-0.04156607, -0.9856547, -3.138002, 1, 1, 1, 1, 1,
-0.04153345, -1.786675, -4.047753, 1, 1, 1, 1, 1,
-0.03994731, 0.838108, 0.7665375, 1, 1, 1, 1, 1,
-0.03983472, 0.432373, 0.07031323, 1, 1, 1, 1, 1,
-0.03809765, -0.5959743, -3.44947, 1, 1, 1, 1, 1,
-0.03625073, 0.7261993, 1.583267, 1, 1, 1, 1, 1,
-0.03349216, -1.202325, -1.549987, 1, 1, 1, 1, 1,
-0.02896662, 0.9376841, 0.9938224, 0, 0, 1, 1, 1,
-0.02759086, 1.042757, 1.917433, 1, 0, 0, 1, 1,
-0.02582568, 1.221867, -0.6878591, 1, 0, 0, 1, 1,
-0.02580154, 1.125951, 0.6228129, 1, 0, 0, 1, 1,
-0.0221416, -2.390243, -2.641198, 1, 0, 0, 1, 1,
-0.02173914, -1.742753, -2.157344, 1, 0, 0, 1, 1,
-0.01521062, -0.6754751, -3.548073, 0, 0, 0, 1, 1,
-0.01501302, 0.1270561, -1.867342, 0, 0, 0, 1, 1,
-0.01218986, -1.166033, -4.613599, 0, 0, 0, 1, 1,
-0.0104195, 0.6607457, -0.6024429, 0, 0, 0, 1, 1,
-0.009332721, 0.1139307, -1.865421, 0, 0, 0, 1, 1,
-0.005733859, 0.4668721, -0.7772601, 0, 0, 0, 1, 1,
0.005043615, 2.931289, -0.1144729, 0, 0, 0, 1, 1,
0.006277655, -0.3977099, 1.853953, 1, 1, 1, 1, 1,
0.007321831, 0.2120393, 2.400213, 1, 1, 1, 1, 1,
0.007377392, -0.4890337, 3.34927, 1, 1, 1, 1, 1,
0.01151792, -0.8951429, 4.604088, 1, 1, 1, 1, 1,
0.01459021, -1.414457, 2.377833, 1, 1, 1, 1, 1,
0.01528024, -1.25248, 3.150645, 1, 1, 1, 1, 1,
0.01629829, 1.48567, 1.134214, 1, 1, 1, 1, 1,
0.01643068, 0.7001812, 2.174509, 1, 1, 1, 1, 1,
0.01695508, -0.05438621, 3.835267, 1, 1, 1, 1, 1,
0.01749452, 1.51197, -0.3479941, 1, 1, 1, 1, 1,
0.01778699, -1.297242, 2.045767, 1, 1, 1, 1, 1,
0.0197592, -0.008703931, 1.675321, 1, 1, 1, 1, 1,
0.01996559, -1.165457, 2.821396, 1, 1, 1, 1, 1,
0.02070383, -0.2346615, 2.217593, 1, 1, 1, 1, 1,
0.02182811, -1.650044, 3.534055, 1, 1, 1, 1, 1,
0.02392886, 0.7127913, -1.163862, 0, 0, 1, 1, 1,
0.02518997, 0.793891, 0.6290774, 1, 0, 0, 1, 1,
0.02525189, -0.3986418, 0.4770417, 1, 0, 0, 1, 1,
0.02885427, -1.590588, 4.280376, 1, 0, 0, 1, 1,
0.03706487, -0.115548, 2.836894, 1, 0, 0, 1, 1,
0.0407244, -1.879789, 1.911925, 1, 0, 0, 1, 1,
0.04849863, 0.4546998, -0.4615267, 0, 0, 0, 1, 1,
0.05471429, -0.08409645, 3.061357, 0, 0, 0, 1, 1,
0.05531621, 1.134652, -1.473507, 0, 0, 0, 1, 1,
0.05664506, -2.055274, 2.751434, 0, 0, 0, 1, 1,
0.06362921, 0.8272281, 1.471038, 0, 0, 0, 1, 1,
0.06609906, 1.37386, 1.818114, 0, 0, 0, 1, 1,
0.06821729, -0.8328993, 3.058958, 0, 0, 0, 1, 1,
0.06906001, -0.4407933, 1.671237, 1, 1, 1, 1, 1,
0.07214845, 0.01158538, -1.254045, 1, 1, 1, 1, 1,
0.07630952, -0.9994377, 2.194801, 1, 1, 1, 1, 1,
0.07741112, 0.317466, 2.232145, 1, 1, 1, 1, 1,
0.07746219, 3.05886, -0.1164478, 1, 1, 1, 1, 1,
0.07894084, -1.599589, 3.725469, 1, 1, 1, 1, 1,
0.07918997, 2.061002, -2.2434, 1, 1, 1, 1, 1,
0.08047718, -0.4741468, 4.734929, 1, 1, 1, 1, 1,
0.08484077, 1.067057, -1.599591, 1, 1, 1, 1, 1,
0.08725524, -0.7598978, 4.07878, 1, 1, 1, 1, 1,
0.08731249, 1.122141, -0.003878253, 1, 1, 1, 1, 1,
0.09362443, 1.523285, 0.546545, 1, 1, 1, 1, 1,
0.0989784, 0.9192223, -2.206338, 1, 1, 1, 1, 1,
0.1005537, -0.1895564, 1.878643, 1, 1, 1, 1, 1,
0.102398, 1.061056, 0.5390976, 1, 1, 1, 1, 1,
0.1059599, 0.5905904, 0.7245647, 0, 0, 1, 1, 1,
0.1071908, -0.7701039, 2.510113, 1, 0, 0, 1, 1,
0.1121821, 1.271279, 0.09045007, 1, 0, 0, 1, 1,
0.1141614, 0.1810535, 0.367018, 1, 0, 0, 1, 1,
0.1163107, -0.2454478, 3.090517, 1, 0, 0, 1, 1,
0.1167606, -0.962516, 1.170232, 1, 0, 0, 1, 1,
0.1176516, 0.2616844, 0.2319009, 0, 0, 0, 1, 1,
0.121164, 0.3152421, 0.5352356, 0, 0, 0, 1, 1,
0.1227897, -0.499863, 4.537989, 0, 0, 0, 1, 1,
0.1239403, -1.241776, 3.170195, 0, 0, 0, 1, 1,
0.1269926, 0.6216334, -0.5476543, 0, 0, 0, 1, 1,
0.1306695, 0.04186584, 1.998315, 0, 0, 0, 1, 1,
0.1387407, 1.003448, -1.816636, 0, 0, 0, 1, 1,
0.1408895, 1.685913, 0.1918, 1, 1, 1, 1, 1,
0.1412089, 0.2174358, 0.5821896, 1, 1, 1, 1, 1,
0.1484662, -0.8905385, 2.338502, 1, 1, 1, 1, 1,
0.1486986, -1.032473, 2.063086, 1, 1, 1, 1, 1,
0.1597623, 0.3246053, 0.02678852, 1, 1, 1, 1, 1,
0.1634259, 0.9733338, -0.6004172, 1, 1, 1, 1, 1,
0.1710563, -0.3655791, 0.07451355, 1, 1, 1, 1, 1,
0.1710842, -0.2668142, 2.1015, 1, 1, 1, 1, 1,
0.1727175, 1.809802, -0.9733413, 1, 1, 1, 1, 1,
0.1786, 0.88434, 0.5927347, 1, 1, 1, 1, 1,
0.180939, 0.109781, 3.414912, 1, 1, 1, 1, 1,
0.1867621, -0.3715182, 2.032121, 1, 1, 1, 1, 1,
0.1885025, -0.3566496, 2.767405, 1, 1, 1, 1, 1,
0.1906133, -0.7489364, 2.002039, 1, 1, 1, 1, 1,
0.1908619, 1.355305, -1.275944, 1, 1, 1, 1, 1,
0.1910597, 1.136881, 0.03436073, 0, 0, 1, 1, 1,
0.1912134, -0.3833427, 1.768892, 1, 0, 0, 1, 1,
0.1918391, -1.406047, 0.8405666, 1, 0, 0, 1, 1,
0.1960874, 0.1289196, 2.271842, 1, 0, 0, 1, 1,
0.1984627, 0.7185884, 0.1531355, 1, 0, 0, 1, 1,
0.1992962, 1.486343, 0.4548087, 1, 0, 0, 1, 1,
0.201233, -0.4889042, 1.628056, 0, 0, 0, 1, 1,
0.2030227, 0.2692912, 1.464216, 0, 0, 0, 1, 1,
0.2077067, 0.4596167, -0.439207, 0, 0, 0, 1, 1,
0.2086284, -0.5792743, 2.132494, 0, 0, 0, 1, 1,
0.2097458, 0.2471299, 1.31816, 0, 0, 0, 1, 1,
0.2146611, -1.241622, 2.945604, 0, 0, 0, 1, 1,
0.2152104, 1.488192, -0.3945946, 0, 0, 0, 1, 1,
0.2160983, -1.863903, 2.760491, 1, 1, 1, 1, 1,
0.2165372, 0.7678236, 0.1726215, 1, 1, 1, 1, 1,
0.2175383, 0.2847852, 0.4177889, 1, 1, 1, 1, 1,
0.2226286, -1.789021, 3.144677, 1, 1, 1, 1, 1,
0.2236104, 0.9994566, 0.5132183, 1, 1, 1, 1, 1,
0.2236581, -1.070249, 2.495538, 1, 1, 1, 1, 1,
0.2240609, 0.7773069, 0.8647758, 1, 1, 1, 1, 1,
0.227094, -0.5270622, 3.999015, 1, 1, 1, 1, 1,
0.2345408, -0.1732357, 2.670048, 1, 1, 1, 1, 1,
0.2362245, -0.4615795, 2.531568, 1, 1, 1, 1, 1,
0.2365265, -0.8295543, 1.498952, 1, 1, 1, 1, 1,
0.2408372, -0.2924135, 2.476847, 1, 1, 1, 1, 1,
0.2432088, 1.356157, 0.9956269, 1, 1, 1, 1, 1,
0.2458966, 2.583363, 0.4250765, 1, 1, 1, 1, 1,
0.2468985, -0.8356807, 3.293135, 1, 1, 1, 1, 1,
0.2469182, -0.4398738, 2.625083, 0, 0, 1, 1, 1,
0.2543845, 1.399081, -0.3063586, 1, 0, 0, 1, 1,
0.255043, -0.4234051, 3.882708, 1, 0, 0, 1, 1,
0.2613092, 1.39537, 0.7063797, 1, 0, 0, 1, 1,
0.2634058, -0.6229122, 3.399701, 1, 0, 0, 1, 1,
0.2665029, 0.4870677, 0.08226485, 1, 0, 0, 1, 1,
0.2701401, 0.03282949, 0.722235, 0, 0, 0, 1, 1,
0.2702098, -0.591442, 4.411104, 0, 0, 0, 1, 1,
0.2731171, -0.07585664, 4.123348, 0, 0, 0, 1, 1,
0.2745644, -0.2322965, 2.442176, 0, 0, 0, 1, 1,
0.2748329, 0.6924718, 1.439962, 0, 0, 0, 1, 1,
0.2768981, 2.217343, 0.3535862, 0, 0, 0, 1, 1,
0.2788019, -1.472897, 3.244812, 0, 0, 0, 1, 1,
0.2791545, 1.808889, -0.0663451, 1, 1, 1, 1, 1,
0.2879016, -0.8953378, 2.214922, 1, 1, 1, 1, 1,
0.290748, 0.06599251, 1.519607, 1, 1, 1, 1, 1,
0.2926595, 0.8251158, 1.314262, 1, 1, 1, 1, 1,
0.2949818, -1.005244, 2.415747, 1, 1, 1, 1, 1,
0.2951449, 0.3702859, 0.7006708, 1, 1, 1, 1, 1,
0.2954018, -0.7491531, 5.557248, 1, 1, 1, 1, 1,
0.3002008, 0.1321766, -0.2612921, 1, 1, 1, 1, 1,
0.303779, -0.4457079, 2.046048, 1, 1, 1, 1, 1,
0.3040052, 0.526591, -1.058546, 1, 1, 1, 1, 1,
0.3041729, -0.2194737, 2.916848, 1, 1, 1, 1, 1,
0.3042799, -0.01505617, 1.000196, 1, 1, 1, 1, 1,
0.3047982, -1.390677, 1.356044, 1, 1, 1, 1, 1,
0.3052871, 0.3381208, 1.156426, 1, 1, 1, 1, 1,
0.3064612, 0.5152686, 1.718156, 1, 1, 1, 1, 1,
0.308455, 0.8455498, 0.7425458, 0, 0, 1, 1, 1,
0.3099957, -0.02565465, 1.911492, 1, 0, 0, 1, 1,
0.3106757, 0.2788894, 1.058223, 1, 0, 0, 1, 1,
0.31515, -0.3531065, 2.693272, 1, 0, 0, 1, 1,
0.3157631, -0.8412559, 2.260639, 1, 0, 0, 1, 1,
0.3207776, -1.053099, 2.18095, 1, 0, 0, 1, 1,
0.3275611, -0.2711777, 3.027042, 0, 0, 0, 1, 1,
0.3287209, 0.551017, -0.1770407, 0, 0, 0, 1, 1,
0.3306927, -0.2874173, 0.5627605, 0, 0, 0, 1, 1,
0.333599, 1.472405, 0.1142756, 0, 0, 0, 1, 1,
0.3336579, -0.8831142, 1.700679, 0, 0, 0, 1, 1,
0.3347983, 0.4168096, 0.4707353, 0, 0, 0, 1, 1,
0.3376487, -0.6833903, 3.500462, 0, 0, 0, 1, 1,
0.3459039, -1.667553, 2.800086, 1, 1, 1, 1, 1,
0.3497334, 1.122351, 1.546273, 1, 1, 1, 1, 1,
0.3525512, 0.4526904, 0.5434078, 1, 1, 1, 1, 1,
0.3528876, 1.164909, -0.2337743, 1, 1, 1, 1, 1,
0.3574728, -0.3016077, 2.771704, 1, 1, 1, 1, 1,
0.3585295, -1.891365, 3.913231, 1, 1, 1, 1, 1,
0.3591277, -0.09340078, 0.148534, 1, 1, 1, 1, 1,
0.3591725, 0.3677348, 0.5080678, 1, 1, 1, 1, 1,
0.3605046, 1.904463, 0.4885472, 1, 1, 1, 1, 1,
0.3615232, 0.1773438, -0.8098008, 1, 1, 1, 1, 1,
0.3625621, 0.9225062, -0.2991309, 1, 1, 1, 1, 1,
0.3647641, 0.8750644, -0.3530901, 1, 1, 1, 1, 1,
0.3659073, 0.2002554, 0.8493615, 1, 1, 1, 1, 1,
0.3674585, 1.722012, -1.315999, 1, 1, 1, 1, 1,
0.3771822, -0.7976517, 3.775353, 1, 1, 1, 1, 1,
0.3845301, 0.0439035, 0.3134225, 0, 0, 1, 1, 1,
0.3845948, 0.3301083, 1.424844, 1, 0, 0, 1, 1,
0.3873005, -1.462714, 2.513114, 1, 0, 0, 1, 1,
0.3881383, 1.070211, -1.207151, 1, 0, 0, 1, 1,
0.390101, 1.228745, 0.01468645, 1, 0, 0, 1, 1,
0.3903774, -0.1520802, 1.899565, 1, 0, 0, 1, 1,
0.3946524, 0.6636206, 1.253906, 0, 0, 0, 1, 1,
0.3978634, -0.377833, 2.420227, 0, 0, 0, 1, 1,
0.3988217, -1.029417, 2.453007, 0, 0, 0, 1, 1,
0.400072, -0.4984713, 2.523264, 0, 0, 0, 1, 1,
0.404209, 1.014012, 2.551922, 0, 0, 0, 1, 1,
0.4101002, -0.9196144, 2.358268, 0, 0, 0, 1, 1,
0.413865, 1.008207, 0.9490166, 0, 0, 0, 1, 1,
0.4143915, -1.436554, 3.211413, 1, 1, 1, 1, 1,
0.4150403, 0.1441169, 1.81636, 1, 1, 1, 1, 1,
0.4161669, 0.099176, 1.282834, 1, 1, 1, 1, 1,
0.4162312, 0.2684433, 0.03664084, 1, 1, 1, 1, 1,
0.424432, 1.271277, -0.4481302, 1, 1, 1, 1, 1,
0.4259618, 0.08717045, 0.6004672, 1, 1, 1, 1, 1,
0.4262653, 0.525803, -0.4125148, 1, 1, 1, 1, 1,
0.4302067, 1.812625, -2.136542, 1, 1, 1, 1, 1,
0.4308909, 0.8703385, 1.289182, 1, 1, 1, 1, 1,
0.4325836, 0.3425563, 0.8246005, 1, 1, 1, 1, 1,
0.4331172, 1.137643, -0.0962418, 1, 1, 1, 1, 1,
0.4350667, 0.5609054, 1.062775, 1, 1, 1, 1, 1,
0.435184, 0.6485246, 0.3758565, 1, 1, 1, 1, 1,
0.439396, -0.8270942, 3.044718, 1, 1, 1, 1, 1,
0.4411674, 1.172383, 2.044549, 1, 1, 1, 1, 1,
0.44273, -0.3656239, 3.780404, 0, 0, 1, 1, 1,
0.4437477, -0.06067537, 2.157633, 1, 0, 0, 1, 1,
0.4468096, -0.9356171, 1.50788, 1, 0, 0, 1, 1,
0.4471709, -1.206849, 2.671992, 1, 0, 0, 1, 1,
0.4474625, 1.556716, 0.4443943, 1, 0, 0, 1, 1,
0.4476343, 0.1337249, 0.08758225, 1, 0, 0, 1, 1,
0.4477917, -0.398177, 1.805462, 0, 0, 0, 1, 1,
0.452303, -1.100027, 2.062493, 0, 0, 0, 1, 1,
0.4581198, 0.6794144, -0.8896564, 0, 0, 0, 1, 1,
0.4588193, 0.2985069, 0.4841627, 0, 0, 0, 1, 1,
0.4609413, -1.102126, 4.260783, 0, 0, 0, 1, 1,
0.4660405, -0.342907, 1.810881, 0, 0, 0, 1, 1,
0.4712419, -0.4142823, 1.010038, 0, 0, 0, 1, 1,
0.4716444, 2.07716, 0.6603394, 1, 1, 1, 1, 1,
0.4727334, -2.164801, 3.889908, 1, 1, 1, 1, 1,
0.4766017, 0.6763543, 0.7824028, 1, 1, 1, 1, 1,
0.4771862, 0.7363763, 0.2907299, 1, 1, 1, 1, 1,
0.4801174, 0.5911314, -0.231022, 1, 1, 1, 1, 1,
0.4821532, -0.01438236, 3.869958, 1, 1, 1, 1, 1,
0.4844278, -1.930861, 2.77712, 1, 1, 1, 1, 1,
0.4856055, -0.144626, 1.846932, 1, 1, 1, 1, 1,
0.4888049, -0.03930968, 0.1727169, 1, 1, 1, 1, 1,
0.4900677, 1.122413, 0.2624642, 1, 1, 1, 1, 1,
0.4932527, 0.3450146, 2.190793, 1, 1, 1, 1, 1,
0.4939743, 1.274166, 0.7404121, 1, 1, 1, 1, 1,
0.4963745, -0.5851827, 2.767623, 1, 1, 1, 1, 1,
0.4974325, 1.440976, -0.6949396, 1, 1, 1, 1, 1,
0.4980053, 0.2500171, -0.5895507, 1, 1, 1, 1, 1,
0.4992684, 0.9215825, 2.029168, 0, 0, 1, 1, 1,
0.5006026, 1.476416, 1.237995, 1, 0, 0, 1, 1,
0.5021781, -1.016745, 3.369298, 1, 0, 0, 1, 1,
0.504297, 0.5504444, 0.7071379, 1, 0, 0, 1, 1,
0.5078198, 0.7533901, 0.6287079, 1, 0, 0, 1, 1,
0.5087716, 0.6860586, 1.658383, 1, 0, 0, 1, 1,
0.5093291, 0.03188847, 2.114883, 0, 0, 0, 1, 1,
0.5093636, -0.04796868, 2.389126, 0, 0, 0, 1, 1,
0.5121889, 0.3512031, 1.216629, 0, 0, 0, 1, 1,
0.5158009, 0.5567454, -0.507098, 0, 0, 0, 1, 1,
0.5182023, -0.6011001, 2.999979, 0, 0, 0, 1, 1,
0.5182927, -0.2830673, 1.249345, 0, 0, 0, 1, 1,
0.5241437, -0.004348991, -0.3645343, 0, 0, 0, 1, 1,
0.5309064, -2.695843, 2.365719, 1, 1, 1, 1, 1,
0.5310316, 0.3387109, 1.374384, 1, 1, 1, 1, 1,
0.535107, -0.9083452, 2.934011, 1, 1, 1, 1, 1,
0.5372041, 0.08156694, 1.610882, 1, 1, 1, 1, 1,
0.540149, -0.1653846, 0.5347196, 1, 1, 1, 1, 1,
0.5405166, -0.9526447, 1.29703, 1, 1, 1, 1, 1,
0.5460664, -0.6232352, 1.778533, 1, 1, 1, 1, 1,
0.5462946, -0.5474905, 2.199176, 1, 1, 1, 1, 1,
0.5472147, -0.8565524, 4.285228, 1, 1, 1, 1, 1,
0.5492762, -0.6426351, 1.633077, 1, 1, 1, 1, 1,
0.5579777, 0.7515756, 1.830288, 1, 1, 1, 1, 1,
0.5636224, -0.8064442, 3.220519, 1, 1, 1, 1, 1,
0.5653786, 0.1272382, 1.518278, 1, 1, 1, 1, 1,
0.5662144, 0.5692121, 1.033366, 1, 1, 1, 1, 1,
0.56661, 1.640729, 0.5604194, 1, 1, 1, 1, 1,
0.566984, -0.2318562, 1.374771, 0, 0, 1, 1, 1,
0.5693844, 0.1691552, 1.038643, 1, 0, 0, 1, 1,
0.5746669, -1.841735, 2.222558, 1, 0, 0, 1, 1,
0.5812205, 0.3977481, 1.749977, 1, 0, 0, 1, 1,
0.5816343, -0.6445512, 0.6905818, 1, 0, 0, 1, 1,
0.5822287, -0.3666461, 2.853942, 1, 0, 0, 1, 1,
0.5886494, -0.3849266, 2.879964, 0, 0, 0, 1, 1,
0.5888312, -0.7286747, 2.393026, 0, 0, 0, 1, 1,
0.5893985, 1.073635, 0.3350313, 0, 0, 0, 1, 1,
0.589481, 0.453091, 1.257248, 0, 0, 0, 1, 1,
0.594492, -0.2520364, 1.349819, 0, 0, 0, 1, 1,
0.5982454, -0.1967409, 1.745601, 0, 0, 0, 1, 1,
0.6018388, -3.014927, 5.175677, 0, 0, 0, 1, 1,
0.6191929, 0.07147293, -0.3454032, 1, 1, 1, 1, 1,
0.6219032, 1.229688, -0.1404926, 1, 1, 1, 1, 1,
0.6244993, 0.7740739, 1.547979, 1, 1, 1, 1, 1,
0.627027, 0.3437813, 1.209268, 1, 1, 1, 1, 1,
0.6288657, 0.08143821, 2.905303, 1, 1, 1, 1, 1,
0.6288757, 0.1570305, 1.569713, 1, 1, 1, 1, 1,
0.6344619, -2.895917, 3.675985, 1, 1, 1, 1, 1,
0.6362216, -0.7235975, 4.189158, 1, 1, 1, 1, 1,
0.6366491, 0.01688965, 0.1303574, 1, 1, 1, 1, 1,
0.6412034, -0.3971018, 0.7610732, 1, 1, 1, 1, 1,
0.6420096, -1.664346, 2.978928, 1, 1, 1, 1, 1,
0.6513379, -0.7864475, 1.91653, 1, 1, 1, 1, 1,
0.65513, 1.095611, 0.2692311, 1, 1, 1, 1, 1,
0.6596454, -0.7227237, 2.920784, 1, 1, 1, 1, 1,
0.6678874, 0.1046495, 1.528161, 1, 1, 1, 1, 1,
0.6734102, 1.698621, 1.184, 0, 0, 1, 1, 1,
0.6742951, 0.624823, 2.162953, 1, 0, 0, 1, 1,
0.6760747, 0.3834417, 1.706873, 1, 0, 0, 1, 1,
0.677842, -1.038937, 1.342556, 1, 0, 0, 1, 1,
0.6781784, -0.01246823, 1.999224, 1, 0, 0, 1, 1,
0.6803827, -1.054356, 1.644096, 1, 0, 0, 1, 1,
0.6869539, -0.05013574, 1.459182, 0, 0, 0, 1, 1,
0.6894554, 1.347443, -0.2316433, 0, 0, 0, 1, 1,
0.6932935, -0.05129338, 0.9208021, 0, 0, 0, 1, 1,
0.6955, 0.1829235, 1.770389, 0, 0, 0, 1, 1,
0.6959262, -1.559989, 3.468306, 0, 0, 0, 1, 1,
0.7059637, 1.163213, 0.9181863, 0, 0, 0, 1, 1,
0.7075365, 1.905114, -1.588704, 0, 0, 0, 1, 1,
0.7079797, -1.159637, 2.657121, 1, 1, 1, 1, 1,
0.7095662, 0.07855719, 1.343009, 1, 1, 1, 1, 1,
0.7101675, 2.050172, 1.501689, 1, 1, 1, 1, 1,
0.7102684, -0.9850066, 1.779836, 1, 1, 1, 1, 1,
0.7116616, 0.6594819, 0.421239, 1, 1, 1, 1, 1,
0.7143058, 0.6282812, 0.07867321, 1, 1, 1, 1, 1,
0.7180057, 1.531465, 1.074787, 1, 1, 1, 1, 1,
0.7193699, 0.02397358, 0.585577, 1, 1, 1, 1, 1,
0.7303634, 0.405982, 1.800622, 1, 1, 1, 1, 1,
0.7322854, 0.8571125, 2.383867, 1, 1, 1, 1, 1,
0.7392889, -0.5760837, 0.9236547, 1, 1, 1, 1, 1,
0.74187, 0.8565276, 0.5670217, 1, 1, 1, 1, 1,
0.7423978, 1.91457, 0.9397337, 1, 1, 1, 1, 1,
0.7475787, 0.68319, -0.02488402, 1, 1, 1, 1, 1,
0.7484245, 1.362789, 1.127301, 1, 1, 1, 1, 1,
0.7488695, -1.148277, 2.842917, 0, 0, 1, 1, 1,
0.7501103, 0.2476587, 1.323037, 1, 0, 0, 1, 1,
0.7537619, -1.430271, 1.486495, 1, 0, 0, 1, 1,
0.7576774, -1.117179, 1.56537, 1, 0, 0, 1, 1,
0.7601733, 1.531746, -0.21733, 1, 0, 0, 1, 1,
0.7679566, -1.305573, 1.859535, 1, 0, 0, 1, 1,
0.7766609, -0.6343278, 2.6338, 0, 0, 0, 1, 1,
0.7783105, -0.9734092, 2.157392, 0, 0, 0, 1, 1,
0.7847356, -0.2934487, 2.782925, 0, 0, 0, 1, 1,
0.7981482, 1.557009, 0.5959448, 0, 0, 0, 1, 1,
0.799778, -1.089587, 3.190805, 0, 0, 0, 1, 1,
0.8044156, 1.087939, 1.228461, 0, 0, 0, 1, 1,
0.8104014, 1.541831, 2.183992, 0, 0, 0, 1, 1,
0.8175245, 1.048371, 0.273674, 1, 1, 1, 1, 1,
0.8184576, 1.328451, 0.7367204, 1, 1, 1, 1, 1,
0.8187048, 0.25606, 1.654083, 1, 1, 1, 1, 1,
0.8218257, 0.8111227, 0.04686248, 1, 1, 1, 1, 1,
0.8245415, 0.4425144, 1.927305, 1, 1, 1, 1, 1,
0.8250003, 0.3262593, 2.466492, 1, 1, 1, 1, 1,
0.8257424, 1.248675, 0.2524835, 1, 1, 1, 1, 1,
0.8262509, 1.151944, -0.1103928, 1, 1, 1, 1, 1,
0.8268442, 0.5338483, 0.8674707, 1, 1, 1, 1, 1,
0.8419625, 0.2731191, -0.1435064, 1, 1, 1, 1, 1,
0.8423516, 0.5723322, 0.32803, 1, 1, 1, 1, 1,
0.8430513, -1.746517, 3.023736, 1, 1, 1, 1, 1,
0.8439652, -1.00531, 3.298014, 1, 1, 1, 1, 1,
0.8480324, 0.1134721, 1.568398, 1, 1, 1, 1, 1,
0.8523357, 0.1288114, 1.80204, 1, 1, 1, 1, 1,
0.8527979, -0.4187593, 1.339747, 0, 0, 1, 1, 1,
0.8626917, 0.2657833, 0.5186594, 1, 0, 0, 1, 1,
0.869422, -1.078228, 2.216418, 1, 0, 0, 1, 1,
0.8699436, -0.02311815, 1.376088, 1, 0, 0, 1, 1,
0.8707874, -0.4250863, 1.369065, 1, 0, 0, 1, 1,
0.8777119, -0.4417343, 3.443467, 1, 0, 0, 1, 1,
0.8777711, 1.049233, 3.031131, 0, 0, 0, 1, 1,
0.8815589, -0.2822139, 1.474857, 0, 0, 0, 1, 1,
0.8823147, -0.2723236, 0.139235, 0, 0, 0, 1, 1,
0.8831332, -0.6910685, 2.391506, 0, 0, 0, 1, 1,
0.8857726, -0.6157215, 2.57646, 0, 0, 0, 1, 1,
0.8867059, -0.733829, 3.876032, 0, 0, 0, 1, 1,
0.8887996, -0.5344164, 1.478144, 0, 0, 0, 1, 1,
0.8932615, -0.9359583, 1.086546, 1, 1, 1, 1, 1,
0.8935102, -1.085901, 0.7148038, 1, 1, 1, 1, 1,
0.897033, 0.630525, 2.387504, 1, 1, 1, 1, 1,
0.8991764, -1.549694, 2.613687, 1, 1, 1, 1, 1,
0.9067384, 0.2007588, -0.3259426, 1, 1, 1, 1, 1,
0.9084559, 1.007575, -0.5449445, 1, 1, 1, 1, 1,
0.911229, 0.3083254, 0.4399859, 1, 1, 1, 1, 1,
0.9115432, -2.097589, 2.9974, 1, 1, 1, 1, 1,
0.9230559, -0.8128607, 2.777822, 1, 1, 1, 1, 1,
0.930279, 0.6862655, 2.263067, 1, 1, 1, 1, 1,
0.9383767, -0.568742, 1.416559, 1, 1, 1, 1, 1,
0.9444957, -1.535262, 0.7325958, 1, 1, 1, 1, 1,
0.9467248, -0.347593, 1.462116, 1, 1, 1, 1, 1,
0.9512945, -0.2941619, 1.912904, 1, 1, 1, 1, 1,
0.9520714, 1.705221, 2.023709, 1, 1, 1, 1, 1,
0.9549592, 1.419923, -0.6971556, 0, 0, 1, 1, 1,
0.9596139, 0.3350986, 1.537875, 1, 0, 0, 1, 1,
0.9630062, 0.1741142, 2.674947, 1, 0, 0, 1, 1,
0.9647931, -0.3480321, 0.6463112, 1, 0, 0, 1, 1,
0.9728478, 2.074713, -0.3180622, 1, 0, 0, 1, 1,
0.9757826, 0.2526749, 1.131505, 1, 0, 0, 1, 1,
0.9767956, 0.9317275, 1.083115, 0, 0, 0, 1, 1,
0.9783403, 1.568065, -1.611223, 0, 0, 0, 1, 1,
0.9841959, 1.863538, 1.88748, 0, 0, 0, 1, 1,
0.9881102, -0.8577519, 3.065445, 0, 0, 0, 1, 1,
0.9886674, -1.062131, 1.366771, 0, 0, 0, 1, 1,
0.9991734, 2.011157, 1.100262, 0, 0, 0, 1, 1,
1.002714, -0.6462564, 0.5321979, 0, 0, 0, 1, 1,
1.002916, 1.103819, 1.582692, 1, 1, 1, 1, 1,
1.018989, 1.19012, -0.5867227, 1, 1, 1, 1, 1,
1.019554, 0.2227639, -1.36179, 1, 1, 1, 1, 1,
1.021368, -0.06341608, 3.300903, 1, 1, 1, 1, 1,
1.030748, -1.413536, 3.992756, 1, 1, 1, 1, 1,
1.032391, -0.9585793, 3.293678, 1, 1, 1, 1, 1,
1.03496, 1.57801, -0.7881624, 1, 1, 1, 1, 1,
1.047083, -0.04818251, 3.047865, 1, 1, 1, 1, 1,
1.047326, 1.813628, 2.101986, 1, 1, 1, 1, 1,
1.052353, -0.7465429, 2.554083, 1, 1, 1, 1, 1,
1.081632, -1.54295, 2.406268, 1, 1, 1, 1, 1,
1.082619, -0.1581901, 2.297196, 1, 1, 1, 1, 1,
1.084284, -0.9987985, 0.9959182, 1, 1, 1, 1, 1,
1.095676, 2.013596, -1.427046, 1, 1, 1, 1, 1,
1.105058, 0.892759, 1.478087, 1, 1, 1, 1, 1,
1.107492, 0.9615339, 1.535959, 0, 0, 1, 1, 1,
1.116957, 1.082516, 0.6283519, 1, 0, 0, 1, 1,
1.120288, -0.5514252, 2.182056, 1, 0, 0, 1, 1,
1.128874, -0.2251511, 1.497533, 1, 0, 0, 1, 1,
1.131493, -1.161108, 1.449165, 1, 0, 0, 1, 1,
1.132315, 0.7891008, -0.237234, 1, 0, 0, 1, 1,
1.132701, 1.350505, 1.843063, 0, 0, 0, 1, 1,
1.136898, -1.047576, 3.647226, 0, 0, 0, 1, 1,
1.137794, -0.1404834, 2.216691, 0, 0, 0, 1, 1,
1.138842, 0.5737451, 0.3451286, 0, 0, 0, 1, 1,
1.140865, -0.5479903, 1.545473, 0, 0, 0, 1, 1,
1.146571, -0.4358397, 2.194428, 0, 0, 0, 1, 1,
1.154034, -0.3614644, 1.066387, 0, 0, 0, 1, 1,
1.155381, -0.3289512, 0.5841984, 1, 1, 1, 1, 1,
1.156464, -0.9073538, 0.9797536, 1, 1, 1, 1, 1,
1.160857, 0.5740044, -1.216083, 1, 1, 1, 1, 1,
1.164046, 0.993897, 0.4895352, 1, 1, 1, 1, 1,
1.172718, 1.55323, 2.338983, 1, 1, 1, 1, 1,
1.173307, -0.6931509, 2.172596, 1, 1, 1, 1, 1,
1.192531, -2.244298, 3.81766, 1, 1, 1, 1, 1,
1.196426, 0.5299665, 1.240615, 1, 1, 1, 1, 1,
1.199153, 1.60129, 0.2759277, 1, 1, 1, 1, 1,
1.202149, 0.08541582, 3.293847, 1, 1, 1, 1, 1,
1.20981, 0.5574657, -0.4264185, 1, 1, 1, 1, 1,
1.214577, 1.117497, 0.1833714, 1, 1, 1, 1, 1,
1.223248, -0.9804229, 1.972628, 1, 1, 1, 1, 1,
1.23906, -0.5521347, 1.882893, 1, 1, 1, 1, 1,
1.247627, 0.3451732, 1.074237, 1, 1, 1, 1, 1,
1.252176, 0.03890147, 1.784433, 0, 0, 1, 1, 1,
1.257826, 0.2583587, 2.362149, 1, 0, 0, 1, 1,
1.262694, -0.6565327, 1.400912, 1, 0, 0, 1, 1,
1.264565, 2.314476, 0.3498214, 1, 0, 0, 1, 1,
1.271579, -0.5959651, 0.8031583, 1, 0, 0, 1, 1,
1.272587, 0.1021224, 0.9955042, 1, 0, 0, 1, 1,
1.273906, 0.2011365, 1.872646, 0, 0, 0, 1, 1,
1.274666, -1.667218, 3.174781, 0, 0, 0, 1, 1,
1.278327, -0.4883463, 3.111914, 0, 0, 0, 1, 1,
1.28415, 1.413101, 1.529587, 0, 0, 0, 1, 1,
1.293206, -0.4507378, 2.066737, 0, 0, 0, 1, 1,
1.304713, -0.4160467, 0.9379938, 0, 0, 0, 1, 1,
1.311324, -0.2535692, 1.476324, 0, 0, 0, 1, 1,
1.315518, -0.9772728, 2.665022, 1, 1, 1, 1, 1,
1.321008, -0.78411, 2.295358, 1, 1, 1, 1, 1,
1.323646, -0.2938626, 2.521593, 1, 1, 1, 1, 1,
1.329067, -2.565877, 3.35403, 1, 1, 1, 1, 1,
1.330706, 1.352936, 0.2695218, 1, 1, 1, 1, 1,
1.331738, 0.9756109, 1.460639, 1, 1, 1, 1, 1,
1.351868, 0.3091007, 1.479933, 1, 1, 1, 1, 1,
1.353972, -0.04206591, 1.903509, 1, 1, 1, 1, 1,
1.357511, 0.5968371, 2.124778, 1, 1, 1, 1, 1,
1.38184, -0.207104, 1.320594, 1, 1, 1, 1, 1,
1.385661, 0.1453855, 3.076143, 1, 1, 1, 1, 1,
1.389299, 0.5213962, 1.045648, 1, 1, 1, 1, 1,
1.392267, 0.06164039, 2.077101, 1, 1, 1, 1, 1,
1.394355, 0.1625403, 3.416053, 1, 1, 1, 1, 1,
1.405792, -0.569933, 0.2675672, 1, 1, 1, 1, 1,
1.406498, 0.04513399, 3.363518, 0, 0, 1, 1, 1,
1.406514, 1.151482, 1.64994, 1, 0, 0, 1, 1,
1.41418, 0.547074, -0.1476342, 1, 0, 0, 1, 1,
1.426653, 1.554143, 1.376104, 1, 0, 0, 1, 1,
1.429224, -1.080335, 3.348088, 1, 0, 0, 1, 1,
1.435301, 0.7725655, 1.481819, 1, 0, 0, 1, 1,
1.441647, -2.863961, 2.623916, 0, 0, 0, 1, 1,
1.460326, -0.3448976, 2.380964, 0, 0, 0, 1, 1,
1.465292, -1.019353, 3.346669, 0, 0, 0, 1, 1,
1.466065, 1.416563, 0.6661142, 0, 0, 0, 1, 1,
1.480436, 0.5167884, 0.9745898, 0, 0, 0, 1, 1,
1.51493, 0.9500353, 1.759081, 0, 0, 0, 1, 1,
1.517625, 1.545108, -0.4716532, 0, 0, 0, 1, 1,
1.525048, 0.4427698, 1.181095, 1, 1, 1, 1, 1,
1.553233, 1.298544, 1.715312, 1, 1, 1, 1, 1,
1.561258, -0.9205129, 3.022442, 1, 1, 1, 1, 1,
1.564494, -0.925357, 3.874508, 1, 1, 1, 1, 1,
1.569561, -1.356533, 2.099345, 1, 1, 1, 1, 1,
1.570862, 0.153387, 1.817469, 1, 1, 1, 1, 1,
1.572124, -1.81898, 3.592459, 1, 1, 1, 1, 1,
1.589221, -0.984838, 2.492447, 1, 1, 1, 1, 1,
1.60564, -0.1009836, 1.980534, 1, 1, 1, 1, 1,
1.611095, 0.04582471, 0.2515268, 1, 1, 1, 1, 1,
1.611869, 1.538967, 0.06648809, 1, 1, 1, 1, 1,
1.62731, 0.6184641, 0.2133471, 1, 1, 1, 1, 1,
1.629368, -0.3429082, 0.4230466, 1, 1, 1, 1, 1,
1.637146, -0.4983517, 0.9682476, 1, 1, 1, 1, 1,
1.646283, -0.119151, 0.5998799, 1, 1, 1, 1, 1,
1.663306, -1.837531, 2.554296, 0, 0, 1, 1, 1,
1.674906, 0.5244802, 2.394181, 1, 0, 0, 1, 1,
1.675607, 1.08791, 1.892574, 1, 0, 0, 1, 1,
1.676716, 0.1654557, 1.685826, 1, 0, 0, 1, 1,
1.678102, -1.111057, 2.764305, 1, 0, 0, 1, 1,
1.690283, 0.6162431, -0.7249699, 1, 0, 0, 1, 1,
1.692128, -1.818525, 2.387921, 0, 0, 0, 1, 1,
1.70103, -0.2218351, 2.396646, 0, 0, 0, 1, 1,
1.702408, 0.2070094, 1.70195, 0, 0, 0, 1, 1,
1.702667, 0.4067679, -1.003174, 0, 0, 0, 1, 1,
1.727929, -1.194593, 3.201658, 0, 0, 0, 1, 1,
1.743876, 2.959148, -0.6976675, 0, 0, 0, 1, 1,
1.759667, -0.6609833, 1.811198, 0, 0, 0, 1, 1,
1.761739, -0.06607132, 1.432656, 1, 1, 1, 1, 1,
1.779373, -0.5055883, 2.421397, 1, 1, 1, 1, 1,
1.801555, 0.7436485, 0.8916851, 1, 1, 1, 1, 1,
1.808111, 0.2095086, 2.356633, 1, 1, 1, 1, 1,
1.811165, 1.368202, 1.80769, 1, 1, 1, 1, 1,
1.833723, -0.9488207, 2.192371, 1, 1, 1, 1, 1,
1.861281, -0.6149298, -0.4799975, 1, 1, 1, 1, 1,
1.894886, -0.8121083, -0.1943808, 1, 1, 1, 1, 1,
1.903533, 0.4476049, 2.804848, 1, 1, 1, 1, 1,
1.920879, 0.5118916, 2.142564, 1, 1, 1, 1, 1,
1.936824, -0.05183909, 0.1822332, 1, 1, 1, 1, 1,
1.9468, -1.015595, 1.653332, 1, 1, 1, 1, 1,
1.951131, -1.155342, 2.21816, 1, 1, 1, 1, 1,
2.017407, -0.2953746, 3.160963, 1, 1, 1, 1, 1,
2.053926, 0.4774819, 1.22083, 1, 1, 1, 1, 1,
2.075294, -1.221353, 0.04560955, 0, 0, 1, 1, 1,
2.083533, 0.4870077, -0.1983201, 1, 0, 0, 1, 1,
2.089855, 0.7725009, -0.9984029, 1, 0, 0, 1, 1,
2.109978, -1.600974, 1.741862, 1, 0, 0, 1, 1,
2.123525, 0.3710138, 2.262033, 1, 0, 0, 1, 1,
2.136444, -0.5386425, 1.929976, 1, 0, 0, 1, 1,
2.177275, -0.03975184, 1.039647, 0, 0, 0, 1, 1,
2.259535, -1.260038, 2.734303, 0, 0, 0, 1, 1,
2.265014, 1.451373, 1.664245, 0, 0, 0, 1, 1,
2.278242, -0.7391184, 1.639398, 0, 0, 0, 1, 1,
2.307114, -0.2659605, 3.442092, 0, 0, 0, 1, 1,
2.44195, -1.591472, -0.04214464, 0, 0, 0, 1, 1,
2.489259, -0.2249895, 0.0894649, 0, 0, 0, 1, 1,
2.49143, 0.9028229, 1.82772, 1, 1, 1, 1, 1,
2.608801, -0.4999701, 2.197081, 1, 1, 1, 1, 1,
2.608807, 0.05839595, 2.386496, 1, 1, 1, 1, 1,
2.63307, -2.549611, 2.449306, 1, 1, 1, 1, 1,
2.686496, 0.4289928, 1.301288, 1, 1, 1, 1, 1,
2.697818, -1.559126, 3.12892, 1, 1, 1, 1, 1,
2.998168, -0.1161298, 1.956119, 1, 1, 1, 1, 1
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
var radius = 10.02361;
var distance = 35.20749;
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
mvMatrix.translate( -0.06027436, 0.1153989, 0.5211585 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.20749);
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
