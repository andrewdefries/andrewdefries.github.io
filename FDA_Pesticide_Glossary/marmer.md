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
-3.112799, 0.982533, -0.611639, 1, 0, 0, 1,
-3.111511, -1.369144, -0.6175057, 1, 0.007843138, 0, 1,
-3.032898, 0.5397089, 0.248579, 1, 0.01176471, 0, 1,
-2.915462, -1.058759, -2.154335, 1, 0.01960784, 0, 1,
-2.911848, 0.279465, -0.06403524, 1, 0.02352941, 0, 1,
-2.466134, 0.6833639, -2.207863, 1, 0.03137255, 0, 1,
-2.414883, -1.341761, -0.8453712, 1, 0.03529412, 0, 1,
-2.310735, 0.7998614, -0.4266833, 1, 0.04313726, 0, 1,
-2.284814, -0.5210639, -2.920101, 1, 0.04705882, 0, 1,
-2.239193, -1.433759, -1.106939, 1, 0.05490196, 0, 1,
-2.238774, 1.350313, -2.695809, 1, 0.05882353, 0, 1,
-2.232854, -0.1809245, -1.605483, 1, 0.06666667, 0, 1,
-2.178092, 0.7201918, -1.658315, 1, 0.07058824, 0, 1,
-2.176725, -0.7378329, -0.5611376, 1, 0.07843138, 0, 1,
-2.167362, 0.1492598, -1.879601, 1, 0.08235294, 0, 1,
-2.155432, -0.8475638, -5.342711, 1, 0.09019608, 0, 1,
-2.153624, -0.3600189, -0.1252642, 1, 0.09411765, 0, 1,
-2.14421, 1.359313, -0.3461094, 1, 0.1019608, 0, 1,
-2.140006, -1.887491, -4.621002, 1, 0.1098039, 0, 1,
-2.129189, -0.09967603, 1.068046, 1, 0.1137255, 0, 1,
-2.090864, 0.2317439, -1.505334, 1, 0.1215686, 0, 1,
-2.087276, -0.453186, -0.6469048, 1, 0.1254902, 0, 1,
-2.052438, 0.4856038, -0.8752443, 1, 0.1333333, 0, 1,
-2.027134, -0.1018374, -2.711534, 1, 0.1372549, 0, 1,
-1.999518, -0.7911, -1.941114, 1, 0.145098, 0, 1,
-1.992461, 1.140114, -1.869299, 1, 0.1490196, 0, 1,
-1.969686, 1.206676, -0.892344, 1, 0.1568628, 0, 1,
-1.953521, 0.05253577, -0.7412096, 1, 0.1607843, 0, 1,
-1.948367, 0.8741239, -2.502469, 1, 0.1686275, 0, 1,
-1.947944, -0.5225206, -1.758147, 1, 0.172549, 0, 1,
-1.947327, 0.9668002, 0.1329688, 1, 0.1803922, 0, 1,
-1.90599, -1.241948, -2.437978, 1, 0.1843137, 0, 1,
-1.881644, -0.6239274, -2.606067, 1, 0.1921569, 0, 1,
-1.877441, -2.917562, -1.651957, 1, 0.1960784, 0, 1,
-1.862353, 1.516835, -1.00367, 1, 0.2039216, 0, 1,
-1.862036, -0.1052646, -2.354203, 1, 0.2117647, 0, 1,
-1.84062, 0.8569388, 0.6909333, 1, 0.2156863, 0, 1,
-1.834276, 0.2907307, -1.131859, 1, 0.2235294, 0, 1,
-1.75955, -0.1257999, -0.9566982, 1, 0.227451, 0, 1,
-1.748471, 1.663074, -0.5216086, 1, 0.2352941, 0, 1,
-1.723815, 0.4115436, -1.227887, 1, 0.2392157, 0, 1,
-1.723302, -2.7145, -2.387079, 1, 0.2470588, 0, 1,
-1.723002, 0.2424053, -0.9864732, 1, 0.2509804, 0, 1,
-1.72242, -0.9698437, -2.547974, 1, 0.2588235, 0, 1,
-1.699639, 1.229225, -2.103441, 1, 0.2627451, 0, 1,
-1.671369, -0.06235682, -2.456475, 1, 0.2705882, 0, 1,
-1.669799, -1.126132, -2.217372, 1, 0.2745098, 0, 1,
-1.657442, -0.107408, -0.9431224, 1, 0.282353, 0, 1,
-1.636249, 0.9977645, -0.9253107, 1, 0.2862745, 0, 1,
-1.621848, 0.5065958, -1.436514, 1, 0.2941177, 0, 1,
-1.619455, -0.6268396, -0.5441002, 1, 0.3019608, 0, 1,
-1.616606, 0.9397665, -0.4428012, 1, 0.3058824, 0, 1,
-1.612811, -1.590191, -2.072791, 1, 0.3137255, 0, 1,
-1.59663, 0.8728703, 0.262861, 1, 0.3176471, 0, 1,
-1.567003, 0.3323792, -2.101837, 1, 0.3254902, 0, 1,
-1.552836, -0.306409, -2.247, 1, 0.3294118, 0, 1,
-1.55068, 0.7019625, -0.8997306, 1, 0.3372549, 0, 1,
-1.550162, 0.696618, -2.208436, 1, 0.3411765, 0, 1,
-1.536109, -0.4003244, -2.35661, 1, 0.3490196, 0, 1,
-1.530092, -2.654304, -4.278087, 1, 0.3529412, 0, 1,
-1.528088, -1.432081, -1.975503, 1, 0.3607843, 0, 1,
-1.477438, -1.451362, -2.937486, 1, 0.3647059, 0, 1,
-1.470931, -1.182649, -2.201741, 1, 0.372549, 0, 1,
-1.456374, -1.479641, -1.442925, 1, 0.3764706, 0, 1,
-1.44106, 0.4548842, -0.3767926, 1, 0.3843137, 0, 1,
-1.438076, 0.4204367, -2.572582, 1, 0.3882353, 0, 1,
-1.437901, -1.243652, -3.740145, 1, 0.3960784, 0, 1,
-1.434982, 2.529752, -1.5707, 1, 0.4039216, 0, 1,
-1.426925, -0.3262836, -1.371686, 1, 0.4078431, 0, 1,
-1.416422, -0.571009, 0.2390013, 1, 0.4156863, 0, 1,
-1.401233, 1.953784, 0.7852491, 1, 0.4196078, 0, 1,
-1.391736, 0.1854825, -0.5721079, 1, 0.427451, 0, 1,
-1.378934, -0.01169438, -0.804906, 1, 0.4313726, 0, 1,
-1.364388, -0.02468939, -1.120278, 1, 0.4392157, 0, 1,
-1.350735, 0.3639271, -1.971792, 1, 0.4431373, 0, 1,
-1.346991, 0.9272932, 0.2506878, 1, 0.4509804, 0, 1,
-1.346504, 1.089617, -0.5914596, 1, 0.454902, 0, 1,
-1.336686, -0.003995263, -1.895741, 1, 0.4627451, 0, 1,
-1.327076, -0.666988, -2.229039, 1, 0.4666667, 0, 1,
-1.327046, 0.3565349, -0.751313, 1, 0.4745098, 0, 1,
-1.326543, -0.1618301, 0.3560318, 1, 0.4784314, 0, 1,
-1.324205, -1.274903, -1.12669, 1, 0.4862745, 0, 1,
-1.317042, -0.4758541, -2.527591, 1, 0.4901961, 0, 1,
-1.315272, -1.039705, -1.167768, 1, 0.4980392, 0, 1,
-1.29627, 1.756556, -1.098287, 1, 0.5058824, 0, 1,
-1.29582, -0.7915523, -1.945312, 1, 0.509804, 0, 1,
-1.294229, -1.111555, -1.585963, 1, 0.5176471, 0, 1,
-1.290873, 0.9699397, -2.007814, 1, 0.5215687, 0, 1,
-1.277988, -0.8989773, -2.075183, 1, 0.5294118, 0, 1,
-1.274526, -1.287244, -3.23371, 1, 0.5333334, 0, 1,
-1.271741, 0.2062134, -0.2829283, 1, 0.5411765, 0, 1,
-1.269632, 1.343004, -1.823254, 1, 0.5450981, 0, 1,
-1.264848, 1.22908, 0.3082699, 1, 0.5529412, 0, 1,
-1.260091, 0.9797203, -3.117361, 1, 0.5568628, 0, 1,
-1.248201, -0.8233176, -3.227707, 1, 0.5647059, 0, 1,
-1.237837, -0.7668839, -1.66666, 1, 0.5686275, 0, 1,
-1.237137, 0.4289224, -3.270145, 1, 0.5764706, 0, 1,
-1.233213, -0.4547796, -2.942523, 1, 0.5803922, 0, 1,
-1.232438, 0.6118891, -0.2086052, 1, 0.5882353, 0, 1,
-1.214686, -2.448068, -2.480664, 1, 0.5921569, 0, 1,
-1.204591, 0.7960184, -2.543932, 1, 0.6, 0, 1,
-1.203007, 0.8827221, 0.197721, 1, 0.6078432, 0, 1,
-1.194438, 0.5666028, -1.417687, 1, 0.6117647, 0, 1,
-1.193235, -0.6464114, -1.948053, 1, 0.6196079, 0, 1,
-1.192199, 0.4308685, -1.087493, 1, 0.6235294, 0, 1,
-1.184948, 0.5758118, -2.317152, 1, 0.6313726, 0, 1,
-1.178982, -1.356329, -2.198263, 1, 0.6352941, 0, 1,
-1.178033, -0.7228488, -2.339618, 1, 0.6431373, 0, 1,
-1.165322, 0.5902817, -0.9503347, 1, 0.6470588, 0, 1,
-1.163369, 1.025195, 0.3891395, 1, 0.654902, 0, 1,
-1.160748, 2.251755, -1.439633, 1, 0.6588235, 0, 1,
-1.158692, 0.9373965, -0.1702466, 1, 0.6666667, 0, 1,
-1.15608, 0.8199301, 0.02189972, 1, 0.6705883, 0, 1,
-1.153456, 0.8102692, -1.503737, 1, 0.6784314, 0, 1,
-1.152076, -0.2513424, -1.337771, 1, 0.682353, 0, 1,
-1.145866, -0.5139178, -1.371033, 1, 0.6901961, 0, 1,
-1.145142, 1.687853, -0.1632786, 1, 0.6941177, 0, 1,
-1.139001, 0.4008635, -3.008506, 1, 0.7019608, 0, 1,
-1.12211, 0.3363052, -0.07728554, 1, 0.7098039, 0, 1,
-1.115312, 1.598967, -0.2303058, 1, 0.7137255, 0, 1,
-1.110157, -0.3167827, -0.2969556, 1, 0.7215686, 0, 1,
-1.107817, 0.3520542, -2.357192, 1, 0.7254902, 0, 1,
-1.104152, 1.129533, -0.3047107, 1, 0.7333333, 0, 1,
-1.103163, -1.20566, -1.147669, 1, 0.7372549, 0, 1,
-1.101958, 0.4959522, -0.61648, 1, 0.7450981, 0, 1,
-1.100387, -0.6576762, -0.4896651, 1, 0.7490196, 0, 1,
-1.097635, -0.9698082, -4.52632, 1, 0.7568628, 0, 1,
-1.096567, 0.1698751, -2.485599, 1, 0.7607843, 0, 1,
-1.09604, -0.05096927, -2.047893, 1, 0.7686275, 0, 1,
-1.090839, -0.2151243, -2.520808, 1, 0.772549, 0, 1,
-1.089954, 0.03513737, -0.1771268, 1, 0.7803922, 0, 1,
-1.089908, -0.4830219, -2.950022, 1, 0.7843137, 0, 1,
-1.089854, 1.339423, -0.6143261, 1, 0.7921569, 0, 1,
-1.085559, -1.022583, -3.595343, 1, 0.7960784, 0, 1,
-1.07758, -0.6313264, -2.765606, 1, 0.8039216, 0, 1,
-1.05602, -2.062439, -2.853397, 1, 0.8117647, 0, 1,
-1.054484, -1.21937, -2.081759, 1, 0.8156863, 0, 1,
-1.053595, -1.662843, -2.822766, 1, 0.8235294, 0, 1,
-1.050862, -0.03730327, -1.860694, 1, 0.827451, 0, 1,
-1.04024, 0.8626667, -0.5261468, 1, 0.8352941, 0, 1,
-1.03998, 0.3106434, -1.110601, 1, 0.8392157, 0, 1,
-1.037959, -0.414961, -1.993326, 1, 0.8470588, 0, 1,
-1.03782, 1.069294, -0.9343963, 1, 0.8509804, 0, 1,
-1.033554, 0.5647092, -1.192212, 1, 0.8588235, 0, 1,
-1.032912, 0.3806885, 0.5284072, 1, 0.8627451, 0, 1,
-1.030599, 1.270463, 0.01677471, 1, 0.8705882, 0, 1,
-1.030008, 0.930084, -0.9887332, 1, 0.8745098, 0, 1,
-1.023978, 1.520285, -2.506349, 1, 0.8823529, 0, 1,
-1.023297, 1.703319, -0.5203188, 1, 0.8862745, 0, 1,
-1.015461, 1.825938, 0.38864, 1, 0.8941177, 0, 1,
-1.008687, -0.7610414, -4.249109, 1, 0.8980392, 0, 1,
-1.004833, -0.2417092, -2.173668, 1, 0.9058824, 0, 1,
-1.000104, 0.2147037, -2.3168, 1, 0.9137255, 0, 1,
-0.9978558, 1.30722, -2.503017, 1, 0.9176471, 0, 1,
-0.9877611, 0.818195, -1.349984, 1, 0.9254902, 0, 1,
-0.972463, -0.8594181, -1.36513, 1, 0.9294118, 0, 1,
-0.9607381, -1.147801, -1.590896, 1, 0.9372549, 0, 1,
-0.9591362, 1.089796, -1.168185, 1, 0.9411765, 0, 1,
-0.958271, -0.7134102, -2.656148, 1, 0.9490196, 0, 1,
-0.9582509, -0.06539184, -1.381154, 1, 0.9529412, 0, 1,
-0.9501101, -2.165748, -3.236202, 1, 0.9607843, 0, 1,
-0.9489441, -0.21193, -1.149939, 1, 0.9647059, 0, 1,
-0.9421863, -0.4223504, -2.488053, 1, 0.972549, 0, 1,
-0.9359326, -0.4666091, -3.118553, 1, 0.9764706, 0, 1,
-0.9308984, 0.7456301, -2.307734, 1, 0.9843137, 0, 1,
-0.9259101, 0.8284609, -1.451405, 1, 0.9882353, 0, 1,
-0.9188973, 0.1098899, -2.061661, 1, 0.9960784, 0, 1,
-0.9155037, 0.1515432, -3.419348, 0.9960784, 1, 0, 1,
-0.9152395, 0.6478364, -0.7805907, 0.9921569, 1, 0, 1,
-0.9098054, -0.4279819, -3.366903, 0.9843137, 1, 0, 1,
-0.9096402, -1.115606, -2.957947, 0.9803922, 1, 0, 1,
-0.9080999, -0.5721366, -2.28892, 0.972549, 1, 0, 1,
-0.9071625, -0.3245052, -3.778704, 0.9686275, 1, 0, 1,
-0.8972033, 0.3602116, -1.9694, 0.9607843, 1, 0, 1,
-0.8966203, 1.232822, -0.9624557, 0.9568627, 1, 0, 1,
-0.8959095, -0.8843416, -1.188329, 0.9490196, 1, 0, 1,
-0.8867755, -1.050559, -3.05512, 0.945098, 1, 0, 1,
-0.8829378, 0.1894956, -1.077347, 0.9372549, 1, 0, 1,
-0.8794721, -0.858694, -0.5203785, 0.9333333, 1, 0, 1,
-0.876566, -1.515123, -3.23918, 0.9254902, 1, 0, 1,
-0.8751674, -1.076863, -2.302047, 0.9215686, 1, 0, 1,
-0.8746516, -0.4178665, -3.213387, 0.9137255, 1, 0, 1,
-0.8591108, 1.421661, 0.4087155, 0.9098039, 1, 0, 1,
-0.8530449, 2.020232, 1.984134, 0.9019608, 1, 0, 1,
-0.8523669, 0.006484283, -2.234467, 0.8941177, 1, 0, 1,
-0.8320873, 1.228986, -0.4953938, 0.8901961, 1, 0, 1,
-0.8320468, 0.4683443, -2.025841, 0.8823529, 1, 0, 1,
-0.8272331, 0.5559006, -1.632466, 0.8784314, 1, 0, 1,
-0.8253244, 0.2464687, -1.43759, 0.8705882, 1, 0, 1,
-0.8241439, -0.8123944, -2.397911, 0.8666667, 1, 0, 1,
-0.8222433, -1.570652, -2.253372, 0.8588235, 1, 0, 1,
-0.8211647, -1.38418, -2.576681, 0.854902, 1, 0, 1,
-0.8198673, 0.5799956, 0.1582192, 0.8470588, 1, 0, 1,
-0.819706, -0.4367756, -1.525324, 0.8431373, 1, 0, 1,
-0.8181893, -0.2639358, -2.328364, 0.8352941, 1, 0, 1,
-0.8172726, 0.2157523, 0.9891613, 0.8313726, 1, 0, 1,
-0.8162463, -0.4504958, -2.082787, 0.8235294, 1, 0, 1,
-0.813481, 0.03548266, -1.216506, 0.8196079, 1, 0, 1,
-0.8134184, -0.3039434, -2.125911, 0.8117647, 1, 0, 1,
-0.8131022, 0.3286235, -2.339978, 0.8078431, 1, 0, 1,
-0.8097517, 0.6670871, -0.07104596, 0.8, 1, 0, 1,
-0.8086742, 0.2082253, -0.5960594, 0.7921569, 1, 0, 1,
-0.8074276, -0.2914747, -2.28598, 0.7882353, 1, 0, 1,
-0.8066342, 0.3603137, -0.1091456, 0.7803922, 1, 0, 1,
-0.8029501, -1.323676, -1.38327, 0.7764706, 1, 0, 1,
-0.7945896, -0.08715276, -0.9893767, 0.7686275, 1, 0, 1,
-0.7940208, -0.3287828, -2.397662, 0.7647059, 1, 0, 1,
-0.7910263, -0.4235658, -1.51513, 0.7568628, 1, 0, 1,
-0.7837508, 2.947137, 0.01486373, 0.7529412, 1, 0, 1,
-0.7836391, -0.1716308, -4.095447, 0.7450981, 1, 0, 1,
-0.7809802, -0.8160267, -2.770139, 0.7411765, 1, 0, 1,
-0.7782889, 2.089961, 0.3084975, 0.7333333, 1, 0, 1,
-0.7723692, -0.06961649, -2.120897, 0.7294118, 1, 0, 1,
-0.769456, -0.8435269, -0.9272414, 0.7215686, 1, 0, 1,
-0.7693927, 2.160864, 0.3071612, 0.7176471, 1, 0, 1,
-0.7685044, -0.4002313, -3.94697, 0.7098039, 1, 0, 1,
-0.7652477, 0.8168089, -1.848073, 0.7058824, 1, 0, 1,
-0.7650546, -0.4274785, -2.243876, 0.6980392, 1, 0, 1,
-0.7650513, -1.179813, -0.7905012, 0.6901961, 1, 0, 1,
-0.7615749, -0.6322113, -2.741823, 0.6862745, 1, 0, 1,
-0.7600673, 0.5090539, -1.037902, 0.6784314, 1, 0, 1,
-0.7598291, -0.02402393, -0.03255158, 0.6745098, 1, 0, 1,
-0.757839, 0.8717537, 0.2549319, 0.6666667, 1, 0, 1,
-0.7571202, 1.324289, -2.20505, 0.6627451, 1, 0, 1,
-0.7542872, 0.5499908, -1.428932, 0.654902, 1, 0, 1,
-0.7526315, -0.7626838, -1.778908, 0.6509804, 1, 0, 1,
-0.7401205, 2.076533, -0.05317656, 0.6431373, 1, 0, 1,
-0.7374439, -0.9778723, -2.818783, 0.6392157, 1, 0, 1,
-0.7351017, -1.018165, -2.007573, 0.6313726, 1, 0, 1,
-0.7350137, -0.03207185, -1.392779, 0.627451, 1, 0, 1,
-0.7306498, 0.2076528, -1.000447, 0.6196079, 1, 0, 1,
-0.7296271, -0.2121076, -2.615605, 0.6156863, 1, 0, 1,
-0.7235961, 0.7224446, -0.679131, 0.6078432, 1, 0, 1,
-0.7224286, -0.7387516, -1.615019, 0.6039216, 1, 0, 1,
-0.7224151, 0.09767043, -2.951043, 0.5960785, 1, 0, 1,
-0.7205288, 0.05683922, -0.7335955, 0.5882353, 1, 0, 1,
-0.7137999, -0.8243748, 0.5348378, 0.5843138, 1, 0, 1,
-0.7044822, 2.933634, -1.122522, 0.5764706, 1, 0, 1,
-0.699109, -0.8994828, -1.738713, 0.572549, 1, 0, 1,
-0.6983739, -0.5083528, -1.705952, 0.5647059, 1, 0, 1,
-0.6942344, -0.5421759, -4.079668, 0.5607843, 1, 0, 1,
-0.6930565, 1.297093, -2.259385, 0.5529412, 1, 0, 1,
-0.6907197, -1.371085, -4.69861, 0.5490196, 1, 0, 1,
-0.6888137, -0.848824, -3.166277, 0.5411765, 1, 0, 1,
-0.6868601, -0.5678291, -2.80129, 0.5372549, 1, 0, 1,
-0.6857585, -2.211015, -0.6296, 0.5294118, 1, 0, 1,
-0.6809216, 1.372372, 1.775397, 0.5254902, 1, 0, 1,
-0.6751958, 0.4719817, -1.351674, 0.5176471, 1, 0, 1,
-0.6709681, -0.8628947, -2.167917, 0.5137255, 1, 0, 1,
-0.670456, 0.6865662, -0.1987826, 0.5058824, 1, 0, 1,
-0.667914, 1.784359, -2.671544, 0.5019608, 1, 0, 1,
-0.6576833, -0.5188604, -1.896137, 0.4941176, 1, 0, 1,
-0.6574336, 0.730696, -1.639854, 0.4862745, 1, 0, 1,
-0.6451787, 0.8275473, 1.164836, 0.4823529, 1, 0, 1,
-0.6436703, -1.444583, -3.090212, 0.4745098, 1, 0, 1,
-0.6373155, 1.150527, -0.05436121, 0.4705882, 1, 0, 1,
-0.6362177, 0.8728704, -1.714161, 0.4627451, 1, 0, 1,
-0.6328619, -1.486578, -3.437972, 0.4588235, 1, 0, 1,
-0.626527, 1.693231, 0.08027376, 0.4509804, 1, 0, 1,
-0.6218427, 1.364484, 0.5121826, 0.4470588, 1, 0, 1,
-0.6188496, -0.7238439, -2.830467, 0.4392157, 1, 0, 1,
-0.61843, 0.3742126, -1.592565, 0.4352941, 1, 0, 1,
-0.6176623, 0.7455119, -1.502492, 0.427451, 1, 0, 1,
-0.6119181, -0.8472537, -1.84157, 0.4235294, 1, 0, 1,
-0.6046508, 1.246525, -1.075076, 0.4156863, 1, 0, 1,
-0.601615, 1.183474, 0.5908549, 0.4117647, 1, 0, 1,
-0.5999658, -0.6365084, -2.78041, 0.4039216, 1, 0, 1,
-0.5963073, -1.488477, -2.647584, 0.3960784, 1, 0, 1,
-0.594305, -1.004372, -3.586358, 0.3921569, 1, 0, 1,
-0.5933857, 0.3669587, 1.271152, 0.3843137, 1, 0, 1,
-0.5804754, 0.3436331, -1.652848, 0.3803922, 1, 0, 1,
-0.5783688, -1.795123, -3.952115, 0.372549, 1, 0, 1,
-0.5774153, -1.723693, -3.032847, 0.3686275, 1, 0, 1,
-0.5646076, -2.041395, -4.309319, 0.3607843, 1, 0, 1,
-0.5624583, -1.105004, -1.757968, 0.3568628, 1, 0, 1,
-0.5623723, 0.02765918, -1.972966, 0.3490196, 1, 0, 1,
-0.5611928, 1.842484, 0.04685046, 0.345098, 1, 0, 1,
-0.5599571, 0.05328608, 0.4148231, 0.3372549, 1, 0, 1,
-0.5563354, 2.082308, 0.5378125, 0.3333333, 1, 0, 1,
-0.5554365, -0.4896301, -1.413678, 0.3254902, 1, 0, 1,
-0.5553362, -0.6727448, -0.9008908, 0.3215686, 1, 0, 1,
-0.5543339, -0.4964679, -2.033493, 0.3137255, 1, 0, 1,
-0.5521934, -1.345002, -3.123127, 0.3098039, 1, 0, 1,
-0.5502151, -0.5311917, -3.373823, 0.3019608, 1, 0, 1,
-0.5499324, -0.426058, -2.585631, 0.2941177, 1, 0, 1,
-0.548393, 0.5346227, -0.4463232, 0.2901961, 1, 0, 1,
-0.5460327, -0.6852381, -2.160048, 0.282353, 1, 0, 1,
-0.545972, 1.244818, -0.05489508, 0.2784314, 1, 0, 1,
-0.5458745, 0.1906178, -2.415204, 0.2705882, 1, 0, 1,
-0.5456481, 0.4042815, 0.8883125, 0.2666667, 1, 0, 1,
-0.541662, 0.7730882, -2.666326, 0.2588235, 1, 0, 1,
-0.5402046, 0.966164, -0.1860886, 0.254902, 1, 0, 1,
-0.538727, 0.3373615, 1.838701, 0.2470588, 1, 0, 1,
-0.5377587, -0.4367642, -3.634732, 0.2431373, 1, 0, 1,
-0.5369837, -0.8961208, -3.116182, 0.2352941, 1, 0, 1,
-0.5350279, 0.1020948, -0.4376609, 0.2313726, 1, 0, 1,
-0.529969, -0.5507094, -3.628972, 0.2235294, 1, 0, 1,
-0.5269513, -0.5002864, -1.705428, 0.2196078, 1, 0, 1,
-0.5248909, 2.362141, 0.1125719, 0.2117647, 1, 0, 1,
-0.5225238, 0.9978278, 0.5693305, 0.2078431, 1, 0, 1,
-0.5220217, -0.2776973, 0.1272601, 0.2, 1, 0, 1,
-0.5209076, -0.2197585, -1.519995, 0.1921569, 1, 0, 1,
-0.5206664, 1.596443, 1.071565, 0.1882353, 1, 0, 1,
-0.5181241, -3.160439, -3.296863, 0.1803922, 1, 0, 1,
-0.515859, 0.6800568, -1.335295, 0.1764706, 1, 0, 1,
-0.511893, 0.2470998, 0.6027706, 0.1686275, 1, 0, 1,
-0.5095076, -1.469459, -1.123045, 0.1647059, 1, 0, 1,
-0.5009892, 0.07147849, -1.194819, 0.1568628, 1, 0, 1,
-0.4968472, 0.9621671, 0.3249334, 0.1529412, 1, 0, 1,
-0.4948959, 0.4184996, 0.1192145, 0.145098, 1, 0, 1,
-0.4936137, 0.1483552, -1.005029, 0.1411765, 1, 0, 1,
-0.4912102, -0.4815064, -0.3466046, 0.1333333, 1, 0, 1,
-0.4898684, -1.077443, -1.521263, 0.1294118, 1, 0, 1,
-0.4885625, -0.3531527, -2.04343, 0.1215686, 1, 0, 1,
-0.4858381, -0.02406627, -2.308887, 0.1176471, 1, 0, 1,
-0.4856033, -0.154902, -3.017786, 0.1098039, 1, 0, 1,
-0.4851448, 0.3042577, -2.747811, 0.1058824, 1, 0, 1,
-0.480825, 1.032189, 0.5788286, 0.09803922, 1, 0, 1,
-0.4794559, -0.9566823, -3.153884, 0.09019608, 1, 0, 1,
-0.476186, 1.249639, 1.367941, 0.08627451, 1, 0, 1,
-0.4758983, 0.5761108, 0.2716145, 0.07843138, 1, 0, 1,
-0.4747779, 1.430309, -2.206139, 0.07450981, 1, 0, 1,
-0.4719707, -1.692006, -3.666352, 0.06666667, 1, 0, 1,
-0.4692702, 0.7753493, 1.682767, 0.0627451, 1, 0, 1,
-0.4671987, -1.212523, -1.971644, 0.05490196, 1, 0, 1,
-0.466283, 0.04730453, -1.92349, 0.05098039, 1, 0, 1,
-0.4655292, 1.044815, -0.1642595, 0.04313726, 1, 0, 1,
-0.4621519, -1.108474, -3.187335, 0.03921569, 1, 0, 1,
-0.4607682, -2.230341, -3.741995, 0.03137255, 1, 0, 1,
-0.456309, -0.9108903, -3.643257, 0.02745098, 1, 0, 1,
-0.4562404, -0.8477634, -3.842758, 0.01960784, 1, 0, 1,
-0.453978, 1.440205, -0.3984745, 0.01568628, 1, 0, 1,
-0.4510414, 1.803352, 0.6790609, 0.007843138, 1, 0, 1,
-0.4508178, 0.2363459, -0.8490989, 0.003921569, 1, 0, 1,
-0.4448367, 1.464965, 0.1024264, 0, 1, 0.003921569, 1,
-0.4429632, 1.409103, -1.682462, 0, 1, 0.01176471, 1,
-0.4420239, 0.8348882, -1.000358, 0, 1, 0.01568628, 1,
-0.4392737, -0.5778155, -2.200317, 0, 1, 0.02352941, 1,
-0.4373616, 0.9646602, 0.06192299, 0, 1, 0.02745098, 1,
-0.4365073, -1.146966, -3.051748, 0, 1, 0.03529412, 1,
-0.4364023, 0.4140007, -0.9876252, 0, 1, 0.03921569, 1,
-0.4361194, -0.5534478, -2.863994, 0, 1, 0.04705882, 1,
-0.4349413, -0.2720042, -2.43094, 0, 1, 0.05098039, 1,
-0.4338109, 0.2727403, -2.184097, 0, 1, 0.05882353, 1,
-0.4305629, -0.46267, -2.908379, 0, 1, 0.0627451, 1,
-0.4304413, -0.9086422, -1.504997, 0, 1, 0.07058824, 1,
-0.430389, -0.1035238, -1.356416, 0, 1, 0.07450981, 1,
-0.4239344, -0.4178325, -1.415475, 0, 1, 0.08235294, 1,
-0.4176343, 0.3133417, -1.113166, 0, 1, 0.08627451, 1,
-0.4171569, -0.0762045, -1.085315, 0, 1, 0.09411765, 1,
-0.4150096, 1.348337, -0.3629158, 0, 1, 0.1019608, 1,
-0.4118369, -0.2317579, -1.837018, 0, 1, 0.1058824, 1,
-0.4054031, 0.01475752, -0.5265294, 0, 1, 0.1137255, 1,
-0.4050012, 0.3536998, -1.719643, 0, 1, 0.1176471, 1,
-0.4035994, 0.428315, -1.047207, 0, 1, 0.1254902, 1,
-0.4008919, 1.049968, 0.5930407, 0, 1, 0.1294118, 1,
-0.396231, 0.1441129, -0.7233462, 0, 1, 0.1372549, 1,
-0.3956559, 0.6031297, -2.563989, 0, 1, 0.1411765, 1,
-0.3939246, 0.06913068, -0.4780266, 0, 1, 0.1490196, 1,
-0.3936052, -0.2777619, -2.807238, 0, 1, 0.1529412, 1,
-0.3915055, -1.589616, -2.882649, 0, 1, 0.1607843, 1,
-0.3902354, -1.363007, -2.930607, 0, 1, 0.1647059, 1,
-0.3871969, -0.07020183, -2.804605, 0, 1, 0.172549, 1,
-0.3871371, 0.09638609, -0.9542697, 0, 1, 0.1764706, 1,
-0.3782755, -0.5894579, -2.947364, 0, 1, 0.1843137, 1,
-0.3751634, -0.3803047, -2.931177, 0, 1, 0.1882353, 1,
-0.3683202, -1.136332, -3.116701, 0, 1, 0.1960784, 1,
-0.3680448, -1.157649, -2.64243, 0, 1, 0.2039216, 1,
-0.3572042, -1.125433, -3.674774, 0, 1, 0.2078431, 1,
-0.355544, 0.2871288, 0.531703, 0, 1, 0.2156863, 1,
-0.3542459, 1.103789, -0.4384312, 0, 1, 0.2196078, 1,
-0.3520652, 0.6222299, -0.1858887, 0, 1, 0.227451, 1,
-0.3519121, -1.159699, -3.932554, 0, 1, 0.2313726, 1,
-0.3447054, 0.7688743, -0.7383871, 0, 1, 0.2392157, 1,
-0.3432761, -0.7455974, -0.4103834, 0, 1, 0.2431373, 1,
-0.339613, -0.7565546, -2.071808, 0, 1, 0.2509804, 1,
-0.3379304, 0.1492703, -2.340664, 0, 1, 0.254902, 1,
-0.3333234, 0.4776771, -0.3787021, 0, 1, 0.2627451, 1,
-0.3187149, 0.2315366, -1.61418, 0, 1, 0.2666667, 1,
-0.3076259, -0.7491917, -2.529556, 0, 1, 0.2745098, 1,
-0.3050542, 0.5484849, -1.379255, 0, 1, 0.2784314, 1,
-0.3040497, 1.102521, -1.538748, 0, 1, 0.2862745, 1,
-0.298996, -1.176582, -3.285524, 0, 1, 0.2901961, 1,
-0.2982655, 1.199877, 1.453815, 0, 1, 0.2980392, 1,
-0.2965526, -1.544601, -3.683753, 0, 1, 0.3058824, 1,
-0.2954123, -0.1133548, -2.243324, 0, 1, 0.3098039, 1,
-0.2953053, 1.517941, 1.398263, 0, 1, 0.3176471, 1,
-0.293791, 0.4164614, -0.5744351, 0, 1, 0.3215686, 1,
-0.2928815, 0.7197034, -0.156875, 0, 1, 0.3294118, 1,
-0.2899606, 0.03988915, -3.008235, 0, 1, 0.3333333, 1,
-0.2876846, 0.5796134, -0.3181227, 0, 1, 0.3411765, 1,
-0.2867024, 0.8702943, -0.2027247, 0, 1, 0.345098, 1,
-0.2855667, 0.574503, 0.07503373, 0, 1, 0.3529412, 1,
-0.2853262, -1.506751, -2.469577, 0, 1, 0.3568628, 1,
-0.2815167, -0.2940913, -0.6534882, 0, 1, 0.3647059, 1,
-0.2795531, 0.3544988, -0.7686279, 0, 1, 0.3686275, 1,
-0.2784142, -0.1676604, -2.459072, 0, 1, 0.3764706, 1,
-0.2748249, 0.3523448, 0.6073227, 0, 1, 0.3803922, 1,
-0.2689063, -0.3031895, -1.036042, 0, 1, 0.3882353, 1,
-0.2675793, -0.86249, -1.917209, 0, 1, 0.3921569, 1,
-0.2660026, 0.05791353, -1.705616, 0, 1, 0.4, 1,
-0.2560559, -1.595944, -3.589045, 0, 1, 0.4078431, 1,
-0.2559025, 1.465639, -0.6523381, 0, 1, 0.4117647, 1,
-0.2539807, 0.330966, -1.371524, 0, 1, 0.4196078, 1,
-0.2536036, -0.8159798, -3.207439, 0, 1, 0.4235294, 1,
-0.2531662, 0.04165483, -1.814141, 0, 1, 0.4313726, 1,
-0.2517385, -0.1819964, -0.6886926, 0, 1, 0.4352941, 1,
-0.2417152, 1.059338, -1.243847, 0, 1, 0.4431373, 1,
-0.2415091, 1.436265, -0.6180648, 0, 1, 0.4470588, 1,
-0.2382589, -0.05240358, -1.595163, 0, 1, 0.454902, 1,
-0.2345149, 1.174651, -0.05564317, 0, 1, 0.4588235, 1,
-0.2335493, -1.226679, -3.808195, 0, 1, 0.4666667, 1,
-0.232721, 0.5378152, -0.9433075, 0, 1, 0.4705882, 1,
-0.2309989, 0.5238412, -1.963482, 0, 1, 0.4784314, 1,
-0.2305132, 0.8973773, 1.018278, 0, 1, 0.4823529, 1,
-0.2280672, -0.8230227, -2.671956, 0, 1, 0.4901961, 1,
-0.2248845, -0.3340121, -1.85315, 0, 1, 0.4941176, 1,
-0.2193062, -0.7351094, -3.653646, 0, 1, 0.5019608, 1,
-0.2127934, 0.4071923, -1.127922, 0, 1, 0.509804, 1,
-0.2083812, -0.58493, -4.245898, 0, 1, 0.5137255, 1,
-0.2010585, -0.1441852, -1.121768, 0, 1, 0.5215687, 1,
-0.200789, -0.6604537, -3.463781, 0, 1, 0.5254902, 1,
-0.1997754, -0.2535744, -1.923443, 0, 1, 0.5333334, 1,
-0.1960217, 1.170661, -0.5188322, 0, 1, 0.5372549, 1,
-0.193918, 1.848775, -0.2103554, 0, 1, 0.5450981, 1,
-0.1909536, -0.01457357, 0.1157461, 0, 1, 0.5490196, 1,
-0.1906309, 0.1085311, 0.5975536, 0, 1, 0.5568628, 1,
-0.1899847, 1.084164, -2.143666, 0, 1, 0.5607843, 1,
-0.1874927, 1.525029, -2.232316, 0, 1, 0.5686275, 1,
-0.1752821, -1.818849, -1.937193, 0, 1, 0.572549, 1,
-0.1738165, -0.1471517, -0.8340591, 0, 1, 0.5803922, 1,
-0.1716046, 0.6497974, -0.7558112, 0, 1, 0.5843138, 1,
-0.1613911, 0.8995753, 0.7328991, 0, 1, 0.5921569, 1,
-0.1606527, -0.4933354, -2.81532, 0, 1, 0.5960785, 1,
-0.1593096, -0.6862501, -4.012691, 0, 1, 0.6039216, 1,
-0.1584761, 0.7556064, -0.3819061, 0, 1, 0.6117647, 1,
-0.1535463, 0.10031, -0.9328303, 0, 1, 0.6156863, 1,
-0.1461995, 1.670166, -1.523573, 0, 1, 0.6235294, 1,
-0.1401352, -0.8547299, -2.858148, 0, 1, 0.627451, 1,
-0.1363678, -1.998124, -2.9487, 0, 1, 0.6352941, 1,
-0.1359978, 0.4328573, -2.744592, 0, 1, 0.6392157, 1,
-0.1335925, -0.4283715, -2.722609, 0, 1, 0.6470588, 1,
-0.1316189, -1.277362, -2.896972, 0, 1, 0.6509804, 1,
-0.1285585, 0.5784312, -0.266644, 0, 1, 0.6588235, 1,
-0.128327, 0.6641042, -1.221934, 0, 1, 0.6627451, 1,
-0.1282671, 0.8396279, 0.8083635, 0, 1, 0.6705883, 1,
-0.1258288, -1.109484, -3.489032, 0, 1, 0.6745098, 1,
-0.1231088, 0.1509187, 1.696667, 0, 1, 0.682353, 1,
-0.1092799, -0.2530198, -3.494895, 0, 1, 0.6862745, 1,
-0.1027945, -0.3768117, -3.192261, 0, 1, 0.6941177, 1,
-0.1023409, -1.282603, -1.326264, 0, 1, 0.7019608, 1,
-0.1021335, 0.6963755, 0.3826855, 0, 1, 0.7058824, 1,
-0.09880406, 0.2752468, -0.3261365, 0, 1, 0.7137255, 1,
-0.09800374, 1.240911, 1.813429, 0, 1, 0.7176471, 1,
-0.09623285, -0.5144879, -3.69409, 0, 1, 0.7254902, 1,
-0.09061506, -0.3028789, -3.051774, 0, 1, 0.7294118, 1,
-0.08748797, 1.778288, -0.2182383, 0, 1, 0.7372549, 1,
-0.08368973, -1.116985, -1.763962, 0, 1, 0.7411765, 1,
-0.0825255, 0.09413076, -2.362118, 0, 1, 0.7490196, 1,
-0.08207168, 0.06560902, -0.986816, 0, 1, 0.7529412, 1,
-0.08088957, 0.8658006, 0.4054178, 0, 1, 0.7607843, 1,
-0.07489537, -0.2537103, -2.530868, 0, 1, 0.7647059, 1,
-0.06689294, -1.387754, -2.685985, 0, 1, 0.772549, 1,
-0.06497637, -1.515753, -2.250813, 0, 1, 0.7764706, 1,
-0.06142089, 0.4790795, -0.3487319, 0, 1, 0.7843137, 1,
-0.06014381, 0.1961387, -1.352577, 0, 1, 0.7882353, 1,
-0.05361163, 0.4451691, 0.4557067, 0, 1, 0.7960784, 1,
-0.04752164, -0.1906345, -2.103199, 0, 1, 0.8039216, 1,
-0.04398509, 0.5142558, -0.8895583, 0, 1, 0.8078431, 1,
-0.04322403, 0.764178, 0.02366824, 0, 1, 0.8156863, 1,
-0.03799082, -1.601969, -3.596146, 0, 1, 0.8196079, 1,
-0.03678171, -1.952727, -5.283476, 0, 1, 0.827451, 1,
-0.03675658, -1.678788, -3.388985, 0, 1, 0.8313726, 1,
-0.03250005, -0.3456923, -3.256943, 0, 1, 0.8392157, 1,
-0.02932096, 0.3669746, 0.4639322, 0, 1, 0.8431373, 1,
-0.02854503, -1.048442, -4.055619, 0, 1, 0.8509804, 1,
-0.02472641, 0.255183, -0.7479851, 0, 1, 0.854902, 1,
-0.02441434, 0.4228947, -0.4862314, 0, 1, 0.8627451, 1,
-0.01948437, -0.3667751, -3.998456, 0, 1, 0.8666667, 1,
-0.01340493, -1.932132, -4.107928, 0, 1, 0.8745098, 1,
-0.01244439, -1.296838, -3.432473, 0, 1, 0.8784314, 1,
-0.009022069, 1.459791, 0.2473305, 0, 1, 0.8862745, 1,
-0.0006578759, 1.296577, 0.03797121, 0, 1, 0.8901961, 1,
-6.873788e-05, 1.538574, -0.1028212, 0, 1, 0.8980392, 1,
0.0001963568, 0.4797491, -2.103279, 0, 1, 0.9058824, 1,
0.003557399, -0.8626291, 3.215832, 0, 1, 0.9098039, 1,
0.004603709, 0.01678542, 2.139934, 0, 1, 0.9176471, 1,
0.005650856, 0.3054723, 0.2444726, 0, 1, 0.9215686, 1,
0.01072713, -1.163594, 3.2378, 0, 1, 0.9294118, 1,
0.0135882, 0.7879756, -1.344972, 0, 1, 0.9333333, 1,
0.01677196, 0.2537616, -0.5089089, 0, 1, 0.9411765, 1,
0.01805404, 1.065741, -1.893457, 0, 1, 0.945098, 1,
0.02022901, 1.166635, 0.3045071, 0, 1, 0.9529412, 1,
0.02305598, 0.4476807, -0.9272851, 0, 1, 0.9568627, 1,
0.02529273, -0.1112044, 2.88314, 0, 1, 0.9647059, 1,
0.02766914, 0.04598964, -0.5898346, 0, 1, 0.9686275, 1,
0.03323759, 0.4236417, 0.6049968, 0, 1, 0.9764706, 1,
0.03701692, 0.6091267, 1.243863, 0, 1, 0.9803922, 1,
0.03821484, 1.670217, -1.249934, 0, 1, 0.9882353, 1,
0.03852875, 0.351858, 0.2387156, 0, 1, 0.9921569, 1,
0.04032378, -0.6822002, 3.194169, 0, 1, 1, 1,
0.04984716, 0.2833144, -0.9076567, 0, 0.9921569, 1, 1,
0.05365571, -0.7243234, 3.528147, 0, 0.9882353, 1, 1,
0.05772993, -1.043083, 3.460199, 0, 0.9803922, 1, 1,
0.0583066, -0.2560982, 2.834262, 0, 0.9764706, 1, 1,
0.06162579, -1.297469, 2.607833, 0, 0.9686275, 1, 1,
0.06208879, -1.416033, 3.29542, 0, 0.9647059, 1, 1,
0.06303732, -0.4064818, 2.504004, 0, 0.9568627, 1, 1,
0.06600548, -0.288043, 2.091361, 0, 0.9529412, 1, 1,
0.0660743, 3.026564, -3.041069, 0, 0.945098, 1, 1,
0.06812707, 1.111839, 2.38965, 0, 0.9411765, 1, 1,
0.07234209, -1.482844, 4.161675, 0, 0.9333333, 1, 1,
0.07591823, -0.5339893, 4.038651, 0, 0.9294118, 1, 1,
0.07699896, -1.484398, 2.860362, 0, 0.9215686, 1, 1,
0.07840724, -1.737097, 3.609872, 0, 0.9176471, 1, 1,
0.0819053, 1.057067, -0.5466339, 0, 0.9098039, 1, 1,
0.08331143, -1.999969, 4.732517, 0, 0.9058824, 1, 1,
0.08451769, -0.1791944, 2.886611, 0, 0.8980392, 1, 1,
0.08839148, -1.719648, 3.964003, 0, 0.8901961, 1, 1,
0.09442258, 1.611284, -0.9762775, 0, 0.8862745, 1, 1,
0.09505198, -0.1687469, 1.661474, 0, 0.8784314, 1, 1,
0.09875974, 0.4838907, 1.204517, 0, 0.8745098, 1, 1,
0.09876657, -3.353397, 1.336627, 0, 0.8666667, 1, 1,
0.09957055, 1.329221, -0.3594125, 0, 0.8627451, 1, 1,
0.1041365, 0.1355377, 0.5579551, 0, 0.854902, 1, 1,
0.1050723, 1.96042, -0.49387, 0, 0.8509804, 1, 1,
0.1051029, -0.6422959, 1.217432, 0, 0.8431373, 1, 1,
0.1057637, 1.346286, 1.190028, 0, 0.8392157, 1, 1,
0.1064127, -0.5676374, 2.531311, 0, 0.8313726, 1, 1,
0.1068693, 0.05921345, 1.134446, 0, 0.827451, 1, 1,
0.1073043, 0.3730287, 0.9174082, 0, 0.8196079, 1, 1,
0.1093862, 0.4217091, -1.769108, 0, 0.8156863, 1, 1,
0.1105419, 1.588716, -0.4897807, 0, 0.8078431, 1, 1,
0.1133654, 0.3808412, 0.4070781, 0, 0.8039216, 1, 1,
0.1146455, -1.043221, 1.712714, 0, 0.7960784, 1, 1,
0.1165226, -0.3549132, 3.302272, 0, 0.7882353, 1, 1,
0.119189, -0.6036311, 1.641281, 0, 0.7843137, 1, 1,
0.1211631, 1.543913, 0.6846728, 0, 0.7764706, 1, 1,
0.1211684, 0.1535411, 0.9234327, 0, 0.772549, 1, 1,
0.124765, -1.07959, 0.8304151, 0, 0.7647059, 1, 1,
0.1263898, 0.1921444, 2.318531, 0, 0.7607843, 1, 1,
0.1269201, 0.8792356, 0.9380333, 0, 0.7529412, 1, 1,
0.1271661, 0.8429387, -0.3429673, 0, 0.7490196, 1, 1,
0.1293629, 0.04713031, 1.294873, 0, 0.7411765, 1, 1,
0.1299981, 0.6676286, -0.8026538, 0, 0.7372549, 1, 1,
0.1305829, 1.513883, 1.010471, 0, 0.7294118, 1, 1,
0.1337802, 1.631634, -0.02119548, 0, 0.7254902, 1, 1,
0.1350494, 0.4157604, -1.099745, 0, 0.7176471, 1, 1,
0.1379355, -0.2665613, 1.60487, 0, 0.7137255, 1, 1,
0.144366, 0.02225338, 1.708737, 0, 0.7058824, 1, 1,
0.1467401, 0.3619463, 1.264163, 0, 0.6980392, 1, 1,
0.1473238, 3.166906, -2.581405, 0, 0.6941177, 1, 1,
0.1489278, -1.400918, 3.734753, 0, 0.6862745, 1, 1,
0.1497019, -1.356191, 1.467664, 0, 0.682353, 1, 1,
0.1523336, -0.04763833, 2.113375, 0, 0.6745098, 1, 1,
0.1544482, -1.229833, 1.885101, 0, 0.6705883, 1, 1,
0.1552055, 0.01407714, 1.838925, 0, 0.6627451, 1, 1,
0.1575791, -1.510013, 3.797262, 0, 0.6588235, 1, 1,
0.1577629, 0.1018993, 1.300504, 0, 0.6509804, 1, 1,
0.159233, 0.7458333, 0.5713295, 0, 0.6470588, 1, 1,
0.1603393, 1.008446, 0.6597477, 0, 0.6392157, 1, 1,
0.1608354, -1.390366, 2.679351, 0, 0.6352941, 1, 1,
0.1665815, 0.338196, 1.391096, 0, 0.627451, 1, 1,
0.171664, 1.128281, -0.5485826, 0, 0.6235294, 1, 1,
0.1735167, 1.602403, -0.2342718, 0, 0.6156863, 1, 1,
0.1761129, 1.280071, -0.8342419, 0, 0.6117647, 1, 1,
0.1762795, 1.231578, -1.099571, 0, 0.6039216, 1, 1,
0.1764732, 0.2422563, 0.2894715, 0, 0.5960785, 1, 1,
0.177121, -2.082767, 4.234034, 0, 0.5921569, 1, 1,
0.1774143, -1.603263, 1.725933, 0, 0.5843138, 1, 1,
0.1774966, 1.242504, 1.533956, 0, 0.5803922, 1, 1,
0.1775085, 0.07752973, 0.009868489, 0, 0.572549, 1, 1,
0.1775239, -0.5265274, 2.88493, 0, 0.5686275, 1, 1,
0.1804552, -0.407837, 2.166541, 0, 0.5607843, 1, 1,
0.1806257, -0.5865097, 1.070941, 0, 0.5568628, 1, 1,
0.1864804, 0.1481854, -0.2545244, 0, 0.5490196, 1, 1,
0.1867667, 0.6707447, 1.156063, 0, 0.5450981, 1, 1,
0.1911037, -0.4854315, 2.934306, 0, 0.5372549, 1, 1,
0.2004357, -0.2861459, 3.57718, 0, 0.5333334, 1, 1,
0.2046317, -2.780187, 3.461708, 0, 0.5254902, 1, 1,
0.2074924, -0.3935147, 2.872133, 0, 0.5215687, 1, 1,
0.2087383, -0.2818059, 2.297058, 0, 0.5137255, 1, 1,
0.2089838, 0.7533628, 0.1260004, 0, 0.509804, 1, 1,
0.2096548, 1.897648, 2.008911, 0, 0.5019608, 1, 1,
0.2122774, 0.0659234, 1.49108, 0, 0.4941176, 1, 1,
0.2185085, -0.4148192, 4.016622, 0, 0.4901961, 1, 1,
0.2195669, -2.056953, 3.386907, 0, 0.4823529, 1, 1,
0.2206582, -1.00137, 3.305681, 0, 0.4784314, 1, 1,
0.2225456, 1.582724, 0.8104165, 0, 0.4705882, 1, 1,
0.2291241, 0.2555679, 0.7258379, 0, 0.4666667, 1, 1,
0.2348397, 1.160927, 0.2853196, 0, 0.4588235, 1, 1,
0.2417079, -2.218141, 2.86025, 0, 0.454902, 1, 1,
0.2433887, -0.6474819, 3.621575, 0, 0.4470588, 1, 1,
0.2439916, 0.3144362, 1.79221, 0, 0.4431373, 1, 1,
0.2463094, 0.2964197, 2.795505, 0, 0.4352941, 1, 1,
0.2475971, 0.5919774, -0.3919681, 0, 0.4313726, 1, 1,
0.2477728, 2.296316, 0.7470216, 0, 0.4235294, 1, 1,
0.2625239, -1.344476, 2.813978, 0, 0.4196078, 1, 1,
0.2688165, 0.5923499, 1.173188, 0, 0.4117647, 1, 1,
0.2695689, 1.299349, 1.159284, 0, 0.4078431, 1, 1,
0.2697845, 0.1003312, 2.836555, 0, 0.4, 1, 1,
0.2732584, 0.1705685, 3.682878, 0, 0.3921569, 1, 1,
0.2766484, -0.9839935, 4.276863, 0, 0.3882353, 1, 1,
0.2768323, 0.08248399, 2.346372, 0, 0.3803922, 1, 1,
0.2817783, 0.9292797, 2.424368, 0, 0.3764706, 1, 1,
0.2824539, 0.8876321, -0.3696196, 0, 0.3686275, 1, 1,
0.2841344, -0.2293908, 3.077339, 0, 0.3647059, 1, 1,
0.2853109, -0.7311041, 2.116553, 0, 0.3568628, 1, 1,
0.2865626, -1.240771, 5.135625, 0, 0.3529412, 1, 1,
0.2878866, -0.9098052, 3.077, 0, 0.345098, 1, 1,
0.2897647, -0.321655, 0.5568204, 0, 0.3411765, 1, 1,
0.2897903, 1.544522, 1.516335, 0, 0.3333333, 1, 1,
0.2907443, 0.4297556, -0.4822387, 0, 0.3294118, 1, 1,
0.2932695, -0.2656386, 2.987407, 0, 0.3215686, 1, 1,
0.2961866, 0.3071066, -0.2979283, 0, 0.3176471, 1, 1,
0.2983002, 0.4586217, 1.070014, 0, 0.3098039, 1, 1,
0.2983422, 0.230581, 0.8482887, 0, 0.3058824, 1, 1,
0.3003359, -0.6262259, 3.260323, 0, 0.2980392, 1, 1,
0.3054249, -1.184211, 2.407356, 0, 0.2901961, 1, 1,
0.3060809, 0.3681817, 0.8847383, 0, 0.2862745, 1, 1,
0.307021, 0.3450457, 0.5487577, 0, 0.2784314, 1, 1,
0.3077995, 0.3423085, 1.177462, 0, 0.2745098, 1, 1,
0.3097101, 0.4270924, 0.5771118, 0, 0.2666667, 1, 1,
0.3141711, 0.3306835, -1.739002, 0, 0.2627451, 1, 1,
0.3155911, -0.840804, 2.731755, 0, 0.254902, 1, 1,
0.3156266, 0.4779611, 0.06139826, 0, 0.2509804, 1, 1,
0.315764, 0.1088522, 0.7301863, 0, 0.2431373, 1, 1,
0.3163353, 0.3006589, 1.26772, 0, 0.2392157, 1, 1,
0.3189486, 0.5557277, -0.1525168, 0, 0.2313726, 1, 1,
0.3198887, -0.01991259, 1.836611, 0, 0.227451, 1, 1,
0.3202287, -0.9066989, 4.378039, 0, 0.2196078, 1, 1,
0.3233841, -0.912921, 4.561743, 0, 0.2156863, 1, 1,
0.326989, -2.347943, 3.076107, 0, 0.2078431, 1, 1,
0.3298121, -0.6403816, 2.567494, 0, 0.2039216, 1, 1,
0.3311053, -0.5586566, 2.891863, 0, 0.1960784, 1, 1,
0.3312713, 0.8888811, 1.128286, 0, 0.1882353, 1, 1,
0.3335361, 0.8701217, 1.164673, 0, 0.1843137, 1, 1,
0.333667, -0.8401689, 1.727912, 0, 0.1764706, 1, 1,
0.3350618, -0.928494, 1.85959, 0, 0.172549, 1, 1,
0.3352725, -0.3538598, 3.61974, 0, 0.1647059, 1, 1,
0.3358024, -0.9273426, 2.215672, 0, 0.1607843, 1, 1,
0.3367019, -0.3401898, 2.022573, 0, 0.1529412, 1, 1,
0.340031, -0.2208166, 1.922862, 0, 0.1490196, 1, 1,
0.3441463, -1.552696, 4.215955, 0, 0.1411765, 1, 1,
0.3447849, 1.616851, 0.8231194, 0, 0.1372549, 1, 1,
0.3501778, -0.7050968, 2.997282, 0, 0.1294118, 1, 1,
0.3516849, -0.741576, 3.56899, 0, 0.1254902, 1, 1,
0.3521402, -0.1494875, 2.376211, 0, 0.1176471, 1, 1,
0.3571703, -0.0864381, 1.929192, 0, 0.1137255, 1, 1,
0.3577487, 0.8551443, -0.9916024, 0, 0.1058824, 1, 1,
0.3577658, -1.33211, 1.362506, 0, 0.09803922, 1, 1,
0.3616042, 0.98562, -0.101792, 0, 0.09411765, 1, 1,
0.3630068, 0.8486811, 1.021035, 0, 0.08627451, 1, 1,
0.3636375, -1.136632, 3.501289, 0, 0.08235294, 1, 1,
0.3646218, -0.9103167, 2.577157, 0, 0.07450981, 1, 1,
0.3676332, 0.7139177, -0.431911, 0, 0.07058824, 1, 1,
0.3739818, -2.230346, 3.871928, 0, 0.0627451, 1, 1,
0.3818916, 0.5360738, -0.9973958, 0, 0.05882353, 1, 1,
0.3832693, -0.4866323, 3.853954, 0, 0.05098039, 1, 1,
0.3864106, -0.4319311, 1.941014, 0, 0.04705882, 1, 1,
0.3864721, 0.6112396, 1.786831, 0, 0.03921569, 1, 1,
0.3875192, -0.881216, 3.464906, 0, 0.03529412, 1, 1,
0.3879047, 1.266917, 1.819337, 0, 0.02745098, 1, 1,
0.3896151, 0.7115732, 0.2984721, 0, 0.02352941, 1, 1,
0.3912848, -2.32567, 3.536224, 0, 0.01568628, 1, 1,
0.3931208, 1.065881, 0.627335, 0, 0.01176471, 1, 1,
0.3969712, -0.6332905, 1.133219, 0, 0.003921569, 1, 1,
0.4082709, 1.363288, 0.5293409, 0.003921569, 0, 1, 1,
0.4117502, -0.6216955, 2.434207, 0.007843138, 0, 1, 1,
0.413176, -0.8792984, 3.214332, 0.01568628, 0, 1, 1,
0.4174423, -0.7830536, 2.279635, 0.01960784, 0, 1, 1,
0.4285223, 0.4839457, -0.06346829, 0.02745098, 0, 1, 1,
0.4343351, 1.013647, -1.018773, 0.03137255, 0, 1, 1,
0.4378887, 0.7301671, 0.7982714, 0.03921569, 0, 1, 1,
0.4385673, -0.1284669, 0.6709456, 0.04313726, 0, 1, 1,
0.4404078, -1.182045, 4.430295, 0.05098039, 0, 1, 1,
0.4417279, -0.5746239, 4.332152, 0.05490196, 0, 1, 1,
0.4425132, 0.3932292, 0.4375314, 0.0627451, 0, 1, 1,
0.4434243, 1.344794, 0.001193422, 0.06666667, 0, 1, 1,
0.4449567, -0.2701054, 3.42913, 0.07450981, 0, 1, 1,
0.4476519, 1.18945, -1.450831, 0.07843138, 0, 1, 1,
0.4478236, 0.2374373, 2.138605, 0.08627451, 0, 1, 1,
0.4478803, 0.7364277, -2.201874, 0.09019608, 0, 1, 1,
0.4522623, 0.1940587, 0.5907735, 0.09803922, 0, 1, 1,
0.4566457, -1.414115, 4.299403, 0.1058824, 0, 1, 1,
0.4604584, 1.092951, 0.9215474, 0.1098039, 0, 1, 1,
0.461267, 1.255703, -0.2485241, 0.1176471, 0, 1, 1,
0.4648703, 0.5581014, -0.7539397, 0.1215686, 0, 1, 1,
0.4656185, 0.4883436, 0.8639042, 0.1294118, 0, 1, 1,
0.4657914, -0.05902332, 1.349305, 0.1333333, 0, 1, 1,
0.4660121, 1.385067, 0.5366753, 0.1411765, 0, 1, 1,
0.4671226, -1.768188, 3.673531, 0.145098, 0, 1, 1,
0.4761852, -0.5877833, 3.420342, 0.1529412, 0, 1, 1,
0.4765934, 2.219332, -0.7708961, 0.1568628, 0, 1, 1,
0.4804872, -1.369644, 2.697721, 0.1647059, 0, 1, 1,
0.4811001, 1.492707, -0.25217, 0.1686275, 0, 1, 1,
0.4822981, 2.178734, -0.08905291, 0.1764706, 0, 1, 1,
0.4926799, -1.211572, 1.616284, 0.1803922, 0, 1, 1,
0.4931737, -1.227806, 3.66484, 0.1882353, 0, 1, 1,
0.4941537, -0.3376541, 2.180832, 0.1921569, 0, 1, 1,
0.4946035, -0.7897207, 2.552853, 0.2, 0, 1, 1,
0.4955192, -1.662451, 2.58161, 0.2078431, 0, 1, 1,
0.505745, 0.7862079, 1.307189, 0.2117647, 0, 1, 1,
0.5072649, -1.42703, 3.024112, 0.2196078, 0, 1, 1,
0.5154438, 0.4201636, -0.5831713, 0.2235294, 0, 1, 1,
0.5227883, 0.2051816, 1.254882, 0.2313726, 0, 1, 1,
0.5230454, 0.6254036, 1.237786, 0.2352941, 0, 1, 1,
0.525674, 1.273127, -1.612499, 0.2431373, 0, 1, 1,
0.5268748, 0.6528616, -0.4267355, 0.2470588, 0, 1, 1,
0.5271915, -1.019674, 3.042186, 0.254902, 0, 1, 1,
0.5308745, -0.1483705, 1.994529, 0.2588235, 0, 1, 1,
0.5344895, 0.7279749, 1.408758, 0.2666667, 0, 1, 1,
0.5348796, 0.4092594, 0.03497132, 0.2705882, 0, 1, 1,
0.537725, -0.6352385, 1.043143, 0.2784314, 0, 1, 1,
0.5395311, 1.446677, -0.2056494, 0.282353, 0, 1, 1,
0.5455325, -0.1925677, 3.394042, 0.2901961, 0, 1, 1,
0.5532738, 0.5662606, 1.262474, 0.2941177, 0, 1, 1,
0.5540729, 0.6388237, 1.560741, 0.3019608, 0, 1, 1,
0.5562584, 0.07787138, 0.8316717, 0.3098039, 0, 1, 1,
0.5576122, 0.3904174, 0.3840729, 0.3137255, 0, 1, 1,
0.5591754, 0.7328675, -0.8118266, 0.3215686, 0, 1, 1,
0.5604658, 2.724405, 1.657409, 0.3254902, 0, 1, 1,
0.5612788, 1.146568, 0.5396857, 0.3333333, 0, 1, 1,
0.5695838, 0.2032094, 0.7452986, 0.3372549, 0, 1, 1,
0.5708564, 0.06657751, 1.293024, 0.345098, 0, 1, 1,
0.5733105, -1.273661, 3.078195, 0.3490196, 0, 1, 1,
0.584398, -0.4770485, 1.185322, 0.3568628, 0, 1, 1,
0.592568, -0.4492162, 3.648813, 0.3607843, 0, 1, 1,
0.594043, 0.08418725, 0.401643, 0.3686275, 0, 1, 1,
0.5968713, -1.073518, 1.952708, 0.372549, 0, 1, 1,
0.5972855, 0.2153825, 1.34433, 0.3803922, 0, 1, 1,
0.6118529, 0.04990781, 1.581636, 0.3843137, 0, 1, 1,
0.6125813, -0.331297, 2.23756, 0.3921569, 0, 1, 1,
0.6141525, 0.7928364, 1.605233, 0.3960784, 0, 1, 1,
0.6149198, -0.09811167, 3.910543, 0.4039216, 0, 1, 1,
0.6168333, 1.64023, 2.035655, 0.4117647, 0, 1, 1,
0.6178637, -1.065375, 3.52336, 0.4156863, 0, 1, 1,
0.6213517, -0.1796623, 0.09073479, 0.4235294, 0, 1, 1,
0.6263047, -1.353589, 3.684692, 0.427451, 0, 1, 1,
0.6286525, -0.05715644, 1.486024, 0.4352941, 0, 1, 1,
0.6338378, -0.06469779, 2.35731, 0.4392157, 0, 1, 1,
0.6378106, -1.220591, 4.212054, 0.4470588, 0, 1, 1,
0.6387506, -1.334159, 3.434901, 0.4509804, 0, 1, 1,
0.6399323, 0.4114503, 0.4161326, 0.4588235, 0, 1, 1,
0.6401738, 0.8634964, -0.006974235, 0.4627451, 0, 1, 1,
0.6463398, 0.3044974, -0.2423831, 0.4705882, 0, 1, 1,
0.6468716, -0.4205731, 1.586203, 0.4745098, 0, 1, 1,
0.6470093, 0.1030041, 1.07321, 0.4823529, 0, 1, 1,
0.6473467, 0.1620111, 1.624812, 0.4862745, 0, 1, 1,
0.6624516, 0.2707404, 1.342702, 0.4941176, 0, 1, 1,
0.6647992, -0.1075629, 1.364792, 0.5019608, 0, 1, 1,
0.6659114, 2.345723, -0.3441977, 0.5058824, 0, 1, 1,
0.6718623, -0.7353567, 2.901213, 0.5137255, 0, 1, 1,
0.6736996, -1.533199, 0.6627969, 0.5176471, 0, 1, 1,
0.6750966, -0.1309172, 2.174849, 0.5254902, 0, 1, 1,
0.6809494, 0.4937448, -0.8407557, 0.5294118, 0, 1, 1,
0.6820937, 1.216006, 0.3430937, 0.5372549, 0, 1, 1,
0.6877925, 1.743319, 0.5383912, 0.5411765, 0, 1, 1,
0.6905283, -0.5764101, 2.189639, 0.5490196, 0, 1, 1,
0.6908058, 0.7171283, -2.210718, 0.5529412, 0, 1, 1,
0.6921694, -0.7865553, 3.561874, 0.5607843, 0, 1, 1,
0.6953489, 1.143191, 2.066975, 0.5647059, 0, 1, 1,
0.6979755, 0.738041, 0.3615734, 0.572549, 0, 1, 1,
0.7146391, 0.1470304, 0.5093955, 0.5764706, 0, 1, 1,
0.7200869, -0.3344582, 1.879912, 0.5843138, 0, 1, 1,
0.7245499, 1.832015, -0.1433264, 0.5882353, 0, 1, 1,
0.7296906, 0.4838683, 0.09261812, 0.5960785, 0, 1, 1,
0.7298787, -0.7838689, 3.882342, 0.6039216, 0, 1, 1,
0.7335916, 0.03006097, 0.5316297, 0.6078432, 0, 1, 1,
0.7346809, 0.3902954, 0.612151, 0.6156863, 0, 1, 1,
0.7357054, -1.715771, 0.8449185, 0.6196079, 0, 1, 1,
0.7395915, 0.1129351, 3.540142, 0.627451, 0, 1, 1,
0.749387, -2.008401, 3.019645, 0.6313726, 0, 1, 1,
0.7517253, 0.3105725, 1.219163, 0.6392157, 0, 1, 1,
0.7537799, 1.160614, -0.394486, 0.6431373, 0, 1, 1,
0.7562359, 2.067852, 0.3990617, 0.6509804, 0, 1, 1,
0.7703989, -2.909005, 0.9605808, 0.654902, 0, 1, 1,
0.7719302, 0.1247355, 1.122431, 0.6627451, 0, 1, 1,
0.7723767, -0.3067021, 0.6310949, 0.6666667, 0, 1, 1,
0.7785985, -1.429178, 3.137841, 0.6745098, 0, 1, 1,
0.7834725, -0.02939898, 0.4260285, 0.6784314, 0, 1, 1,
0.7861047, 1.539585, 0.9578407, 0.6862745, 0, 1, 1,
0.7868742, -0.1737912, 3.427433, 0.6901961, 0, 1, 1,
0.7921124, -1.357663, 1.368326, 0.6980392, 0, 1, 1,
0.7925538, 0.2193437, 1.135773, 0.7058824, 0, 1, 1,
0.7925985, 0.06215696, 0.8324594, 0.7098039, 0, 1, 1,
0.795265, 1.535134, 1.29397, 0.7176471, 0, 1, 1,
0.8010899, -0.3552046, 1.548088, 0.7215686, 0, 1, 1,
0.8030466, -0.3685113, 0.6830414, 0.7294118, 0, 1, 1,
0.8088807, -1.03471, 3.642006, 0.7333333, 0, 1, 1,
0.8089318, 1.842425, 2.250546, 0.7411765, 0, 1, 1,
0.8208284, 0.08601751, 1.162235, 0.7450981, 0, 1, 1,
0.8222359, -0.2741322, 3.005599, 0.7529412, 0, 1, 1,
0.8257368, 0.1492935, 1.849284, 0.7568628, 0, 1, 1,
0.8260897, -0.03168824, 2.637336, 0.7647059, 0, 1, 1,
0.8286434, -1.153427, 4.864642, 0.7686275, 0, 1, 1,
0.8290679, 0.2523212, 3.929943, 0.7764706, 0, 1, 1,
0.8313656, -0.9968095, 4.06958, 0.7803922, 0, 1, 1,
0.8333114, -1.311478, 3.49629, 0.7882353, 0, 1, 1,
0.8334019, 1.655453, 0.08454644, 0.7921569, 0, 1, 1,
0.8385456, -0.3249622, 0.6491309, 0.8, 0, 1, 1,
0.8412759, -0.9093915, 1.982444, 0.8078431, 0, 1, 1,
0.8427043, 0.8684044, 1.301648, 0.8117647, 0, 1, 1,
0.8537982, 0.5879233, 0.4314066, 0.8196079, 0, 1, 1,
0.8549178, -1.192286, 2.781471, 0.8235294, 0, 1, 1,
0.8566684, 0.1364823, 2.2481, 0.8313726, 0, 1, 1,
0.859355, 1.267954, 0.6163253, 0.8352941, 0, 1, 1,
0.863526, -0.3695978, 3.457718, 0.8431373, 0, 1, 1,
0.8693352, -0.5815259, 2.764691, 0.8470588, 0, 1, 1,
0.8717874, -0.9472415, 2.252251, 0.854902, 0, 1, 1,
0.8770884, -1.617075, 3.438046, 0.8588235, 0, 1, 1,
0.8779871, -0.1782613, 1.260786, 0.8666667, 0, 1, 1,
0.8788478, -1.412802, 2.961756, 0.8705882, 0, 1, 1,
0.8795751, -1.164237, 1.792104, 0.8784314, 0, 1, 1,
0.8813866, 0.4333918, 0.9872524, 0.8823529, 0, 1, 1,
0.8819991, -3.20082, 1.481389, 0.8901961, 0, 1, 1,
0.8893823, -0.2396262, 1.630811, 0.8941177, 0, 1, 1,
0.8905888, -0.9809078, 3.394895, 0.9019608, 0, 1, 1,
0.9008263, 0.2659414, 1.064538, 0.9098039, 0, 1, 1,
0.9025244, -1.821824, 0.8697528, 0.9137255, 0, 1, 1,
0.9058883, 1.212925, 1.320328, 0.9215686, 0, 1, 1,
0.9088023, -0.7051141, 1.755227, 0.9254902, 0, 1, 1,
0.910486, -0.2398097, 2.03486, 0.9333333, 0, 1, 1,
0.9108004, 0.9367141, 0.7964134, 0.9372549, 0, 1, 1,
0.9161599, 0.07924549, 2.179483, 0.945098, 0, 1, 1,
0.9177895, 0.8183507, 1.350986, 0.9490196, 0, 1, 1,
0.9199199, -1.187108, 2.438113, 0.9568627, 0, 1, 1,
0.9206299, -0.9533617, 2.3033, 0.9607843, 0, 1, 1,
0.9208468, -0.4894222, 1.339938, 0.9686275, 0, 1, 1,
0.9209159, 0.5818647, 0.9498953, 0.972549, 0, 1, 1,
0.9283364, -0.559702, 0.1184349, 0.9803922, 0, 1, 1,
0.9374923, -1.019218, 1.576006, 0.9843137, 0, 1, 1,
0.9407383, -1.439705, 3.793063, 0.9921569, 0, 1, 1,
0.9488209, -0.7908338, 2.649148, 0.9960784, 0, 1, 1,
0.9495627, -0.491409, 2.622823, 1, 0, 0.9960784, 1,
0.9534147, -1.777186, 2.247446, 1, 0, 0.9882353, 1,
0.9544973, 0.5007998, 0.9991504, 1, 0, 0.9843137, 1,
0.9582637, -0.5095214, 2.699439, 1, 0, 0.9764706, 1,
0.9613714, 0.751691, 0.06412589, 1, 0, 0.972549, 1,
0.9630954, 0.7456858, 2.639533, 1, 0, 0.9647059, 1,
0.9667672, 1.546476, 0.1826617, 1, 0, 0.9607843, 1,
0.9725917, -0.3600557, 3.241532, 1, 0, 0.9529412, 1,
0.9743279, 0.304305, 2.026426, 1, 0, 0.9490196, 1,
0.9805092, -2.17622, 2.503658, 1, 0, 0.9411765, 1,
0.9899434, -0.2112768, 1.980866, 1, 0, 0.9372549, 1,
0.9910002, 0.7302614, 1.929858, 1, 0, 0.9294118, 1,
0.9992248, -0.05366779, 1.740925, 1, 0, 0.9254902, 1,
1.003579, -1.493578, 1.465357, 1, 0, 0.9176471, 1,
1.012092, 0.1667082, -0.05965027, 1, 0, 0.9137255, 1,
1.016392, -2.267392, 3.247079, 1, 0, 0.9058824, 1,
1.01895, -1.565181, 0.7573919, 1, 0, 0.9019608, 1,
1.023219, 0.2755379, 0.7805009, 1, 0, 0.8941177, 1,
1.028785, 0.4191399, 2.063324, 1, 0, 0.8862745, 1,
1.030967, -0.297625, -0.242592, 1, 0, 0.8823529, 1,
1.039831, -2.184057, 0.6603147, 1, 0, 0.8745098, 1,
1.047106, -0.1244069, 1.656157, 1, 0, 0.8705882, 1,
1.048723, 0.115393, 3.128003, 1, 0, 0.8627451, 1,
1.051723, -1.098223, 2.482846, 1, 0, 0.8588235, 1,
1.056549, -0.2925877, 1.739137, 1, 0, 0.8509804, 1,
1.057783, 0.2655175, 1.994146, 1, 0, 0.8470588, 1,
1.070189, 2.045692, 0.5239969, 1, 0, 0.8392157, 1,
1.072223, 0.5635521, 0.7663694, 1, 0, 0.8352941, 1,
1.074993, -1.963521, 1.488401, 1, 0, 0.827451, 1,
1.075923, 0.352733, 0.8383937, 1, 0, 0.8235294, 1,
1.077209, 0.03138418, -0.6550341, 1, 0, 0.8156863, 1,
1.079417, -1.101797, 1.638708, 1, 0, 0.8117647, 1,
1.084198, -0.09198973, 2.564965, 1, 0, 0.8039216, 1,
1.088623, -1.175867, 1.383869, 1, 0, 0.7960784, 1,
1.093028, 1.587762, 0.5449976, 1, 0, 0.7921569, 1,
1.093405, -0.6318871, 4.402326, 1, 0, 0.7843137, 1,
1.095387, 1.000365, 1.101721, 1, 0, 0.7803922, 1,
1.099784, 0.6696525, 1.278815, 1, 0, 0.772549, 1,
1.100139, -0.2956578, 2.574339, 1, 0, 0.7686275, 1,
1.103233, 1.552132, -0.8025473, 1, 0, 0.7607843, 1,
1.109666, -0.7993375, 2.638239, 1, 0, 0.7568628, 1,
1.11908, 1.139855, 0.9528279, 1, 0, 0.7490196, 1,
1.124712, 0.3425683, 1.146148, 1, 0, 0.7450981, 1,
1.128109, -0.8875201, 1.74421, 1, 0, 0.7372549, 1,
1.136631, 0.386793, -0.3819204, 1, 0, 0.7333333, 1,
1.144209, 1.870232, -0.5418256, 1, 0, 0.7254902, 1,
1.147507, -0.2463467, 1.385792, 1, 0, 0.7215686, 1,
1.15412, 0.4283943, 1.523857, 1, 0, 0.7137255, 1,
1.167992, 0.7415794, 1.377584, 1, 0, 0.7098039, 1,
1.172491, 0.2453452, 2.150223, 1, 0, 0.7019608, 1,
1.182197, -0.864892, 2.443003, 1, 0, 0.6941177, 1,
1.196138, -0.2105104, 1.500348, 1, 0, 0.6901961, 1,
1.200198, -1.230696, 0.9996099, 1, 0, 0.682353, 1,
1.201256, 1.522826, 1.410689, 1, 0, 0.6784314, 1,
1.203556, -0.492404, 1.564439, 1, 0, 0.6705883, 1,
1.206789, 1.587245, -1.526216, 1, 0, 0.6666667, 1,
1.213581, -0.655366, 2.920088, 1, 0, 0.6588235, 1,
1.217958, -0.5876442, 1.133939, 1, 0, 0.654902, 1,
1.226276, -0.5062858, 2.420541, 1, 0, 0.6470588, 1,
1.239734, 1.118583, 1.558604, 1, 0, 0.6431373, 1,
1.245611, 1.069282, 1.836668, 1, 0, 0.6352941, 1,
1.254778, 0.3285045, 1.216405, 1, 0, 0.6313726, 1,
1.264469, -0.8634486, 4.85018, 1, 0, 0.6235294, 1,
1.269234, -0.9213272, 2.772068, 1, 0, 0.6196079, 1,
1.272903, 0.4148272, 2.536522, 1, 0, 0.6117647, 1,
1.272978, 0.5006189, 1.566298, 1, 0, 0.6078432, 1,
1.279467, 0.6012712, 1.664499, 1, 0, 0.6, 1,
1.286917, -0.3468393, 2.093467, 1, 0, 0.5921569, 1,
1.293589, 0.09528113, 2.447712, 1, 0, 0.5882353, 1,
1.298111, 0.54854, 1.561478, 1, 0, 0.5803922, 1,
1.298128, 1.584407, 1.165953, 1, 0, 0.5764706, 1,
1.315469, -0.1220495, 1.797771, 1, 0, 0.5686275, 1,
1.324743, -0.2605066, 0.4923023, 1, 0, 0.5647059, 1,
1.325794, -0.1913337, 2.323736, 1, 0, 0.5568628, 1,
1.326848, 1.15059, 1.7205, 1, 0, 0.5529412, 1,
1.330563, 0.881925, 0.1135086, 1, 0, 0.5450981, 1,
1.336306, 0.4817387, 0.8357805, 1, 0, 0.5411765, 1,
1.341707, -1.648327, 0.3484812, 1, 0, 0.5333334, 1,
1.342679, -1.336118, 2.491272, 1, 0, 0.5294118, 1,
1.343199, -1.005489, 1.129797, 1, 0, 0.5215687, 1,
1.345289, 1.103989, 0.4759304, 1, 0, 0.5176471, 1,
1.352659, -1.777333, 2.356088, 1, 0, 0.509804, 1,
1.357668, -1.268531, 2.464516, 1, 0, 0.5058824, 1,
1.375417, -0.1770788, 2.81371, 1, 0, 0.4980392, 1,
1.383587, 1.083189, 0.4203884, 1, 0, 0.4901961, 1,
1.389731, -1.04233, 2.571707, 1, 0, 0.4862745, 1,
1.399861, -0.4047907, 1.562724, 1, 0, 0.4784314, 1,
1.406799, -1.399738, 2.362114, 1, 0, 0.4745098, 1,
1.408331, 1.300357, 0.5807792, 1, 0, 0.4666667, 1,
1.420688, 1.01007, 1.576586, 1, 0, 0.4627451, 1,
1.421896, -1.126624, 3.497562, 1, 0, 0.454902, 1,
1.426453, -0.2320391, 2.13305, 1, 0, 0.4509804, 1,
1.427476, -2.121794, 2.848139, 1, 0, 0.4431373, 1,
1.429569, -0.6433775, 1.014998, 1, 0, 0.4392157, 1,
1.431569, 0.9725688, 0.8232999, 1, 0, 0.4313726, 1,
1.433438, 0.8740964, 1.740044, 1, 0, 0.427451, 1,
1.434069, 0.6333904, 1.410162, 1, 0, 0.4196078, 1,
1.443188, 0.1566092, 1.518759, 1, 0, 0.4156863, 1,
1.447606, -1.239344, 1.529771, 1, 0, 0.4078431, 1,
1.456437, -0.4048809, 0.2292063, 1, 0, 0.4039216, 1,
1.463817, -1.147305, 0.4935369, 1, 0, 0.3960784, 1,
1.468846, -1.906456, 3.503478, 1, 0, 0.3882353, 1,
1.47384, 0.5167522, 2.535188, 1, 0, 0.3843137, 1,
1.474181, 0.1367843, 0.883312, 1, 0, 0.3764706, 1,
1.477625, 1.261013, 3.535432, 1, 0, 0.372549, 1,
1.484581, -0.08720043, 0.7090995, 1, 0, 0.3647059, 1,
1.528359, -0.8906499, 2.262862, 1, 0, 0.3607843, 1,
1.53073, 0.06282368, 1.704393, 1, 0, 0.3529412, 1,
1.536591, 0.6305814, 0.08169123, 1, 0, 0.3490196, 1,
1.548359, -0.2604328, 0.186894, 1, 0, 0.3411765, 1,
1.561844, -0.4479422, 0.8105737, 1, 0, 0.3372549, 1,
1.56516, -1.058502, 1.837422, 1, 0, 0.3294118, 1,
1.572709, -0.5068784, 3.180543, 1, 0, 0.3254902, 1,
1.584454, -0.1260219, 2.089868, 1, 0, 0.3176471, 1,
1.595471, -0.5729532, 1.335059, 1, 0, 0.3137255, 1,
1.597696, -0.72254, 2.440413, 1, 0, 0.3058824, 1,
1.608877, 1.444879, 2.039164, 1, 0, 0.2980392, 1,
1.616629, 0.3998792, 1.48139, 1, 0, 0.2941177, 1,
1.623615, 0.6876968, 2.232233, 1, 0, 0.2862745, 1,
1.652517, -1.220683, 3.154346, 1, 0, 0.282353, 1,
1.665555, 0.4033879, 0.503331, 1, 0, 0.2745098, 1,
1.693344, 0.6039804, 0.3545005, 1, 0, 0.2705882, 1,
1.708855, 0.4740012, 2.148867, 1, 0, 0.2627451, 1,
1.729319, 0.3593031, 1.715559, 1, 0, 0.2588235, 1,
1.746875, 0.5393863, 0.9416935, 1, 0, 0.2509804, 1,
1.760298, 1.900254, 1.954158, 1, 0, 0.2470588, 1,
1.761124, -0.2360511, 2.771504, 1, 0, 0.2392157, 1,
1.775499, -1.291054, 0.1174767, 1, 0, 0.2352941, 1,
1.781585, -0.6455588, 1.286102, 1, 0, 0.227451, 1,
1.782777, 0.0004308661, 2.691294, 1, 0, 0.2235294, 1,
1.785571, -0.9589403, 0.8991145, 1, 0, 0.2156863, 1,
1.804935, 0.7887285, 1.588424, 1, 0, 0.2117647, 1,
1.817354, -1.106704, 2.629901, 1, 0, 0.2039216, 1,
1.86393, 0.05005484, 1.532065, 1, 0, 0.1960784, 1,
1.884828, 0.7368826, 0.1412075, 1, 0, 0.1921569, 1,
1.891367, 1.407245, 1.621152, 1, 0, 0.1843137, 1,
1.899326, -1.106009, 1.190613, 1, 0, 0.1803922, 1,
1.905607, -1.416979, 2.149348, 1, 0, 0.172549, 1,
1.906134, -0.871041, -0.02403543, 1, 0, 0.1686275, 1,
1.937844, 0.3047918, 0.203926, 1, 0, 0.1607843, 1,
1.949333, 0.5581717, 0.7493871, 1, 0, 0.1568628, 1,
1.97198, -2.169703, 4.509425, 1, 0, 0.1490196, 1,
1.972973, -1.166464, 1.962108, 1, 0, 0.145098, 1,
1.997694, 1.459823, 0.3550674, 1, 0, 0.1372549, 1,
2.002729, 0.1433769, 0.1482607, 1, 0, 0.1333333, 1,
2.007066, 0.3883551, 1.756515, 1, 0, 0.1254902, 1,
2.028055, -0.4936411, 0.3358891, 1, 0, 0.1215686, 1,
2.028265, -0.5086991, 0.4568211, 1, 0, 0.1137255, 1,
2.037868, -8.561537e-05, 2.063135, 1, 0, 0.1098039, 1,
2.09763, 1.659964, 0.8933126, 1, 0, 0.1019608, 1,
2.098953, -0.2410109, 2.07392, 1, 0, 0.09411765, 1,
2.103781, -0.606882, 1.841601, 1, 0, 0.09019608, 1,
2.121513, -0.006626855, 0.8693735, 1, 0, 0.08235294, 1,
2.212923, 0.05995673, 0.06625651, 1, 0, 0.07843138, 1,
2.240893, 0.9006796, 1.383567, 1, 0, 0.07058824, 1,
2.249141, 1.709885, 2.260536, 1, 0, 0.06666667, 1,
2.254103, 0.8510547, 0.5910041, 1, 0, 0.05882353, 1,
2.257366, 0.3086411, 0.6855466, 1, 0, 0.05490196, 1,
2.304177, -0.216391, 1.993088, 1, 0, 0.04705882, 1,
2.311236, 0.2027799, 1.86677, 1, 0, 0.04313726, 1,
2.431813, 0.2808989, 2.042834, 1, 0, 0.03529412, 1,
2.44235, -0.2511179, 2.822036, 1, 0, 0.03137255, 1,
2.444805, -1.46726, 3.373072, 1, 0, 0.02352941, 1,
2.595171, -0.6618461, 0.08504458, 1, 0, 0.01960784, 1,
2.667624, 0.2037327, 2.898541, 1, 0, 0.01176471, 1,
2.733438, 0.4895017, 3.727528, 1, 0, 0.007843138, 1
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
-0.1896806, -4.458589, -7.11879, 0, -0.5, 0.5, 0.5,
-0.1896806, -4.458589, -7.11879, 1, -0.5, 0.5, 0.5,
-0.1896806, -4.458589, -7.11879, 1, 1.5, 0.5, 0.5,
-0.1896806, -4.458589, -7.11879, 0, 1.5, 0.5, 0.5
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
-4.103736, -0.09324586, -7.11879, 0, -0.5, 0.5, 0.5,
-4.103736, -0.09324586, -7.11879, 1, -0.5, 0.5, 0.5,
-4.103736, -0.09324586, -7.11879, 1, 1.5, 0.5, 0.5,
-4.103736, -0.09324586, -7.11879, 0, 1.5, 0.5, 0.5
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
-4.103736, -4.458589, -0.103543, 0, -0.5, 0.5, 0.5,
-4.103736, -4.458589, -0.103543, 1, -0.5, 0.5, 0.5,
-4.103736, -4.458589, -0.103543, 1, 1.5, 0.5, 0.5,
-4.103736, -4.458589, -0.103543, 0, 1.5, 0.5, 0.5
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
-3, -3.451202, -5.499887,
2, -3.451202, -5.499887,
-3, -3.451202, -5.499887,
-3, -3.6191, -5.769704,
-2, -3.451202, -5.499887,
-2, -3.6191, -5.769704,
-1, -3.451202, -5.499887,
-1, -3.6191, -5.769704,
0, -3.451202, -5.499887,
0, -3.6191, -5.769704,
1, -3.451202, -5.499887,
1, -3.6191, -5.769704,
2, -3.451202, -5.499887,
2, -3.6191, -5.769704
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
-3, -3.954895, -6.309338, 0, -0.5, 0.5, 0.5,
-3, -3.954895, -6.309338, 1, -0.5, 0.5, 0.5,
-3, -3.954895, -6.309338, 1, 1.5, 0.5, 0.5,
-3, -3.954895, -6.309338, 0, 1.5, 0.5, 0.5,
-2, -3.954895, -6.309338, 0, -0.5, 0.5, 0.5,
-2, -3.954895, -6.309338, 1, -0.5, 0.5, 0.5,
-2, -3.954895, -6.309338, 1, 1.5, 0.5, 0.5,
-2, -3.954895, -6.309338, 0, 1.5, 0.5, 0.5,
-1, -3.954895, -6.309338, 0, -0.5, 0.5, 0.5,
-1, -3.954895, -6.309338, 1, -0.5, 0.5, 0.5,
-1, -3.954895, -6.309338, 1, 1.5, 0.5, 0.5,
-1, -3.954895, -6.309338, 0, 1.5, 0.5, 0.5,
0, -3.954895, -6.309338, 0, -0.5, 0.5, 0.5,
0, -3.954895, -6.309338, 1, -0.5, 0.5, 0.5,
0, -3.954895, -6.309338, 1, 1.5, 0.5, 0.5,
0, -3.954895, -6.309338, 0, 1.5, 0.5, 0.5,
1, -3.954895, -6.309338, 0, -0.5, 0.5, 0.5,
1, -3.954895, -6.309338, 1, -0.5, 0.5, 0.5,
1, -3.954895, -6.309338, 1, 1.5, 0.5, 0.5,
1, -3.954895, -6.309338, 0, 1.5, 0.5, 0.5,
2, -3.954895, -6.309338, 0, -0.5, 0.5, 0.5,
2, -3.954895, -6.309338, 1, -0.5, 0.5, 0.5,
2, -3.954895, -6.309338, 1, 1.5, 0.5, 0.5,
2, -3.954895, -6.309338, 0, 1.5, 0.5, 0.5
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
-3.200493, -3, -5.499887,
-3.200493, 3, -5.499887,
-3.200493, -3, -5.499887,
-3.351033, -3, -5.769704,
-3.200493, -2, -5.499887,
-3.351033, -2, -5.769704,
-3.200493, -1, -5.499887,
-3.351033, -1, -5.769704,
-3.200493, 0, -5.499887,
-3.351033, 0, -5.769704,
-3.200493, 1, -5.499887,
-3.351033, 1, -5.769704,
-3.200493, 2, -5.499887,
-3.351033, 2, -5.769704,
-3.200493, 3, -5.499887,
-3.351033, 3, -5.769704
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
-3.652115, -3, -6.309338, 0, -0.5, 0.5, 0.5,
-3.652115, -3, -6.309338, 1, -0.5, 0.5, 0.5,
-3.652115, -3, -6.309338, 1, 1.5, 0.5, 0.5,
-3.652115, -3, -6.309338, 0, 1.5, 0.5, 0.5,
-3.652115, -2, -6.309338, 0, -0.5, 0.5, 0.5,
-3.652115, -2, -6.309338, 1, -0.5, 0.5, 0.5,
-3.652115, -2, -6.309338, 1, 1.5, 0.5, 0.5,
-3.652115, -2, -6.309338, 0, 1.5, 0.5, 0.5,
-3.652115, -1, -6.309338, 0, -0.5, 0.5, 0.5,
-3.652115, -1, -6.309338, 1, -0.5, 0.5, 0.5,
-3.652115, -1, -6.309338, 1, 1.5, 0.5, 0.5,
-3.652115, -1, -6.309338, 0, 1.5, 0.5, 0.5,
-3.652115, 0, -6.309338, 0, -0.5, 0.5, 0.5,
-3.652115, 0, -6.309338, 1, -0.5, 0.5, 0.5,
-3.652115, 0, -6.309338, 1, 1.5, 0.5, 0.5,
-3.652115, 0, -6.309338, 0, 1.5, 0.5, 0.5,
-3.652115, 1, -6.309338, 0, -0.5, 0.5, 0.5,
-3.652115, 1, -6.309338, 1, -0.5, 0.5, 0.5,
-3.652115, 1, -6.309338, 1, 1.5, 0.5, 0.5,
-3.652115, 1, -6.309338, 0, 1.5, 0.5, 0.5,
-3.652115, 2, -6.309338, 0, -0.5, 0.5, 0.5,
-3.652115, 2, -6.309338, 1, -0.5, 0.5, 0.5,
-3.652115, 2, -6.309338, 1, 1.5, 0.5, 0.5,
-3.652115, 2, -6.309338, 0, 1.5, 0.5, 0.5,
-3.652115, 3, -6.309338, 0, -0.5, 0.5, 0.5,
-3.652115, 3, -6.309338, 1, -0.5, 0.5, 0.5,
-3.652115, 3, -6.309338, 1, 1.5, 0.5, 0.5,
-3.652115, 3, -6.309338, 0, 1.5, 0.5, 0.5
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
-3.200493, -3.451202, -4,
-3.200493, -3.451202, 4,
-3.200493, -3.451202, -4,
-3.351033, -3.6191, -4,
-3.200493, -3.451202, -2,
-3.351033, -3.6191, -2,
-3.200493, -3.451202, 0,
-3.351033, -3.6191, 0,
-3.200493, -3.451202, 2,
-3.351033, -3.6191, 2,
-3.200493, -3.451202, 4,
-3.351033, -3.6191, 4
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
-3.652115, -3.954895, -4, 0, -0.5, 0.5, 0.5,
-3.652115, -3.954895, -4, 1, -0.5, 0.5, 0.5,
-3.652115, -3.954895, -4, 1, 1.5, 0.5, 0.5,
-3.652115, -3.954895, -4, 0, 1.5, 0.5, 0.5,
-3.652115, -3.954895, -2, 0, -0.5, 0.5, 0.5,
-3.652115, -3.954895, -2, 1, -0.5, 0.5, 0.5,
-3.652115, -3.954895, -2, 1, 1.5, 0.5, 0.5,
-3.652115, -3.954895, -2, 0, 1.5, 0.5, 0.5,
-3.652115, -3.954895, 0, 0, -0.5, 0.5, 0.5,
-3.652115, -3.954895, 0, 1, -0.5, 0.5, 0.5,
-3.652115, -3.954895, 0, 1, 1.5, 0.5, 0.5,
-3.652115, -3.954895, 0, 0, 1.5, 0.5, 0.5,
-3.652115, -3.954895, 2, 0, -0.5, 0.5, 0.5,
-3.652115, -3.954895, 2, 1, -0.5, 0.5, 0.5,
-3.652115, -3.954895, 2, 1, 1.5, 0.5, 0.5,
-3.652115, -3.954895, 2, 0, 1.5, 0.5, 0.5,
-3.652115, -3.954895, 4, 0, -0.5, 0.5, 0.5,
-3.652115, -3.954895, 4, 1, -0.5, 0.5, 0.5,
-3.652115, -3.954895, 4, 1, 1.5, 0.5, 0.5,
-3.652115, -3.954895, 4, 0, 1.5, 0.5, 0.5
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
-3.200493, -3.451202, -5.499887,
-3.200493, 3.26471, -5.499887,
-3.200493, -3.451202, 5.2928,
-3.200493, 3.26471, 5.2928,
-3.200493, -3.451202, -5.499887,
-3.200493, -3.451202, 5.2928,
-3.200493, 3.26471, -5.499887,
-3.200493, 3.26471, 5.2928,
-3.200493, -3.451202, -5.499887,
2.821131, -3.451202, -5.499887,
-3.200493, -3.451202, 5.2928,
2.821131, -3.451202, 5.2928,
-3.200493, 3.26471, -5.499887,
2.821131, 3.26471, -5.499887,
-3.200493, 3.26471, 5.2928,
2.821131, 3.26471, 5.2928,
2.821131, -3.451202, -5.499887,
2.821131, 3.26471, -5.499887,
2.821131, -3.451202, 5.2928,
2.821131, 3.26471, 5.2928,
2.821131, -3.451202, -5.499887,
2.821131, -3.451202, 5.2928,
2.821131, 3.26471, -5.499887,
2.821131, 3.26471, 5.2928
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
var radius = 7.510842;
var distance = 33.41658;
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
mvMatrix.translate( 0.1896806, 0.09324586, 0.103543 );
mvMatrix.scale( 1.348618, 1.209198, 0.7524418 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.41658);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
marmer<-read.table("marmer.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-marmer$V2
```

```
## Error in eval(expr, envir, enclos): object 'marmer' not found
```

```r
y<-marmer$V3
```

```
## Error in eval(expr, envir, enclos): object 'marmer' not found
```

```r
z<-marmer$V4
```

```
## Error in eval(expr, envir, enclos): object 'marmer' not found
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
-3.112799, 0.982533, -0.611639, 0, 0, 1, 1, 1,
-3.111511, -1.369144, -0.6175057, 1, 0, 0, 1, 1,
-3.032898, 0.5397089, 0.248579, 1, 0, 0, 1, 1,
-2.915462, -1.058759, -2.154335, 1, 0, 0, 1, 1,
-2.911848, 0.279465, -0.06403524, 1, 0, 0, 1, 1,
-2.466134, 0.6833639, -2.207863, 1, 0, 0, 1, 1,
-2.414883, -1.341761, -0.8453712, 0, 0, 0, 1, 1,
-2.310735, 0.7998614, -0.4266833, 0, 0, 0, 1, 1,
-2.284814, -0.5210639, -2.920101, 0, 0, 0, 1, 1,
-2.239193, -1.433759, -1.106939, 0, 0, 0, 1, 1,
-2.238774, 1.350313, -2.695809, 0, 0, 0, 1, 1,
-2.232854, -0.1809245, -1.605483, 0, 0, 0, 1, 1,
-2.178092, 0.7201918, -1.658315, 0, 0, 0, 1, 1,
-2.176725, -0.7378329, -0.5611376, 1, 1, 1, 1, 1,
-2.167362, 0.1492598, -1.879601, 1, 1, 1, 1, 1,
-2.155432, -0.8475638, -5.342711, 1, 1, 1, 1, 1,
-2.153624, -0.3600189, -0.1252642, 1, 1, 1, 1, 1,
-2.14421, 1.359313, -0.3461094, 1, 1, 1, 1, 1,
-2.140006, -1.887491, -4.621002, 1, 1, 1, 1, 1,
-2.129189, -0.09967603, 1.068046, 1, 1, 1, 1, 1,
-2.090864, 0.2317439, -1.505334, 1, 1, 1, 1, 1,
-2.087276, -0.453186, -0.6469048, 1, 1, 1, 1, 1,
-2.052438, 0.4856038, -0.8752443, 1, 1, 1, 1, 1,
-2.027134, -0.1018374, -2.711534, 1, 1, 1, 1, 1,
-1.999518, -0.7911, -1.941114, 1, 1, 1, 1, 1,
-1.992461, 1.140114, -1.869299, 1, 1, 1, 1, 1,
-1.969686, 1.206676, -0.892344, 1, 1, 1, 1, 1,
-1.953521, 0.05253577, -0.7412096, 1, 1, 1, 1, 1,
-1.948367, 0.8741239, -2.502469, 0, 0, 1, 1, 1,
-1.947944, -0.5225206, -1.758147, 1, 0, 0, 1, 1,
-1.947327, 0.9668002, 0.1329688, 1, 0, 0, 1, 1,
-1.90599, -1.241948, -2.437978, 1, 0, 0, 1, 1,
-1.881644, -0.6239274, -2.606067, 1, 0, 0, 1, 1,
-1.877441, -2.917562, -1.651957, 1, 0, 0, 1, 1,
-1.862353, 1.516835, -1.00367, 0, 0, 0, 1, 1,
-1.862036, -0.1052646, -2.354203, 0, 0, 0, 1, 1,
-1.84062, 0.8569388, 0.6909333, 0, 0, 0, 1, 1,
-1.834276, 0.2907307, -1.131859, 0, 0, 0, 1, 1,
-1.75955, -0.1257999, -0.9566982, 0, 0, 0, 1, 1,
-1.748471, 1.663074, -0.5216086, 0, 0, 0, 1, 1,
-1.723815, 0.4115436, -1.227887, 0, 0, 0, 1, 1,
-1.723302, -2.7145, -2.387079, 1, 1, 1, 1, 1,
-1.723002, 0.2424053, -0.9864732, 1, 1, 1, 1, 1,
-1.72242, -0.9698437, -2.547974, 1, 1, 1, 1, 1,
-1.699639, 1.229225, -2.103441, 1, 1, 1, 1, 1,
-1.671369, -0.06235682, -2.456475, 1, 1, 1, 1, 1,
-1.669799, -1.126132, -2.217372, 1, 1, 1, 1, 1,
-1.657442, -0.107408, -0.9431224, 1, 1, 1, 1, 1,
-1.636249, 0.9977645, -0.9253107, 1, 1, 1, 1, 1,
-1.621848, 0.5065958, -1.436514, 1, 1, 1, 1, 1,
-1.619455, -0.6268396, -0.5441002, 1, 1, 1, 1, 1,
-1.616606, 0.9397665, -0.4428012, 1, 1, 1, 1, 1,
-1.612811, -1.590191, -2.072791, 1, 1, 1, 1, 1,
-1.59663, 0.8728703, 0.262861, 1, 1, 1, 1, 1,
-1.567003, 0.3323792, -2.101837, 1, 1, 1, 1, 1,
-1.552836, -0.306409, -2.247, 1, 1, 1, 1, 1,
-1.55068, 0.7019625, -0.8997306, 0, 0, 1, 1, 1,
-1.550162, 0.696618, -2.208436, 1, 0, 0, 1, 1,
-1.536109, -0.4003244, -2.35661, 1, 0, 0, 1, 1,
-1.530092, -2.654304, -4.278087, 1, 0, 0, 1, 1,
-1.528088, -1.432081, -1.975503, 1, 0, 0, 1, 1,
-1.477438, -1.451362, -2.937486, 1, 0, 0, 1, 1,
-1.470931, -1.182649, -2.201741, 0, 0, 0, 1, 1,
-1.456374, -1.479641, -1.442925, 0, 0, 0, 1, 1,
-1.44106, 0.4548842, -0.3767926, 0, 0, 0, 1, 1,
-1.438076, 0.4204367, -2.572582, 0, 0, 0, 1, 1,
-1.437901, -1.243652, -3.740145, 0, 0, 0, 1, 1,
-1.434982, 2.529752, -1.5707, 0, 0, 0, 1, 1,
-1.426925, -0.3262836, -1.371686, 0, 0, 0, 1, 1,
-1.416422, -0.571009, 0.2390013, 1, 1, 1, 1, 1,
-1.401233, 1.953784, 0.7852491, 1, 1, 1, 1, 1,
-1.391736, 0.1854825, -0.5721079, 1, 1, 1, 1, 1,
-1.378934, -0.01169438, -0.804906, 1, 1, 1, 1, 1,
-1.364388, -0.02468939, -1.120278, 1, 1, 1, 1, 1,
-1.350735, 0.3639271, -1.971792, 1, 1, 1, 1, 1,
-1.346991, 0.9272932, 0.2506878, 1, 1, 1, 1, 1,
-1.346504, 1.089617, -0.5914596, 1, 1, 1, 1, 1,
-1.336686, -0.003995263, -1.895741, 1, 1, 1, 1, 1,
-1.327076, -0.666988, -2.229039, 1, 1, 1, 1, 1,
-1.327046, 0.3565349, -0.751313, 1, 1, 1, 1, 1,
-1.326543, -0.1618301, 0.3560318, 1, 1, 1, 1, 1,
-1.324205, -1.274903, -1.12669, 1, 1, 1, 1, 1,
-1.317042, -0.4758541, -2.527591, 1, 1, 1, 1, 1,
-1.315272, -1.039705, -1.167768, 1, 1, 1, 1, 1,
-1.29627, 1.756556, -1.098287, 0, 0, 1, 1, 1,
-1.29582, -0.7915523, -1.945312, 1, 0, 0, 1, 1,
-1.294229, -1.111555, -1.585963, 1, 0, 0, 1, 1,
-1.290873, 0.9699397, -2.007814, 1, 0, 0, 1, 1,
-1.277988, -0.8989773, -2.075183, 1, 0, 0, 1, 1,
-1.274526, -1.287244, -3.23371, 1, 0, 0, 1, 1,
-1.271741, 0.2062134, -0.2829283, 0, 0, 0, 1, 1,
-1.269632, 1.343004, -1.823254, 0, 0, 0, 1, 1,
-1.264848, 1.22908, 0.3082699, 0, 0, 0, 1, 1,
-1.260091, 0.9797203, -3.117361, 0, 0, 0, 1, 1,
-1.248201, -0.8233176, -3.227707, 0, 0, 0, 1, 1,
-1.237837, -0.7668839, -1.66666, 0, 0, 0, 1, 1,
-1.237137, 0.4289224, -3.270145, 0, 0, 0, 1, 1,
-1.233213, -0.4547796, -2.942523, 1, 1, 1, 1, 1,
-1.232438, 0.6118891, -0.2086052, 1, 1, 1, 1, 1,
-1.214686, -2.448068, -2.480664, 1, 1, 1, 1, 1,
-1.204591, 0.7960184, -2.543932, 1, 1, 1, 1, 1,
-1.203007, 0.8827221, 0.197721, 1, 1, 1, 1, 1,
-1.194438, 0.5666028, -1.417687, 1, 1, 1, 1, 1,
-1.193235, -0.6464114, -1.948053, 1, 1, 1, 1, 1,
-1.192199, 0.4308685, -1.087493, 1, 1, 1, 1, 1,
-1.184948, 0.5758118, -2.317152, 1, 1, 1, 1, 1,
-1.178982, -1.356329, -2.198263, 1, 1, 1, 1, 1,
-1.178033, -0.7228488, -2.339618, 1, 1, 1, 1, 1,
-1.165322, 0.5902817, -0.9503347, 1, 1, 1, 1, 1,
-1.163369, 1.025195, 0.3891395, 1, 1, 1, 1, 1,
-1.160748, 2.251755, -1.439633, 1, 1, 1, 1, 1,
-1.158692, 0.9373965, -0.1702466, 1, 1, 1, 1, 1,
-1.15608, 0.8199301, 0.02189972, 0, 0, 1, 1, 1,
-1.153456, 0.8102692, -1.503737, 1, 0, 0, 1, 1,
-1.152076, -0.2513424, -1.337771, 1, 0, 0, 1, 1,
-1.145866, -0.5139178, -1.371033, 1, 0, 0, 1, 1,
-1.145142, 1.687853, -0.1632786, 1, 0, 0, 1, 1,
-1.139001, 0.4008635, -3.008506, 1, 0, 0, 1, 1,
-1.12211, 0.3363052, -0.07728554, 0, 0, 0, 1, 1,
-1.115312, 1.598967, -0.2303058, 0, 0, 0, 1, 1,
-1.110157, -0.3167827, -0.2969556, 0, 0, 0, 1, 1,
-1.107817, 0.3520542, -2.357192, 0, 0, 0, 1, 1,
-1.104152, 1.129533, -0.3047107, 0, 0, 0, 1, 1,
-1.103163, -1.20566, -1.147669, 0, 0, 0, 1, 1,
-1.101958, 0.4959522, -0.61648, 0, 0, 0, 1, 1,
-1.100387, -0.6576762, -0.4896651, 1, 1, 1, 1, 1,
-1.097635, -0.9698082, -4.52632, 1, 1, 1, 1, 1,
-1.096567, 0.1698751, -2.485599, 1, 1, 1, 1, 1,
-1.09604, -0.05096927, -2.047893, 1, 1, 1, 1, 1,
-1.090839, -0.2151243, -2.520808, 1, 1, 1, 1, 1,
-1.089954, 0.03513737, -0.1771268, 1, 1, 1, 1, 1,
-1.089908, -0.4830219, -2.950022, 1, 1, 1, 1, 1,
-1.089854, 1.339423, -0.6143261, 1, 1, 1, 1, 1,
-1.085559, -1.022583, -3.595343, 1, 1, 1, 1, 1,
-1.07758, -0.6313264, -2.765606, 1, 1, 1, 1, 1,
-1.05602, -2.062439, -2.853397, 1, 1, 1, 1, 1,
-1.054484, -1.21937, -2.081759, 1, 1, 1, 1, 1,
-1.053595, -1.662843, -2.822766, 1, 1, 1, 1, 1,
-1.050862, -0.03730327, -1.860694, 1, 1, 1, 1, 1,
-1.04024, 0.8626667, -0.5261468, 1, 1, 1, 1, 1,
-1.03998, 0.3106434, -1.110601, 0, 0, 1, 1, 1,
-1.037959, -0.414961, -1.993326, 1, 0, 0, 1, 1,
-1.03782, 1.069294, -0.9343963, 1, 0, 0, 1, 1,
-1.033554, 0.5647092, -1.192212, 1, 0, 0, 1, 1,
-1.032912, 0.3806885, 0.5284072, 1, 0, 0, 1, 1,
-1.030599, 1.270463, 0.01677471, 1, 0, 0, 1, 1,
-1.030008, 0.930084, -0.9887332, 0, 0, 0, 1, 1,
-1.023978, 1.520285, -2.506349, 0, 0, 0, 1, 1,
-1.023297, 1.703319, -0.5203188, 0, 0, 0, 1, 1,
-1.015461, 1.825938, 0.38864, 0, 0, 0, 1, 1,
-1.008687, -0.7610414, -4.249109, 0, 0, 0, 1, 1,
-1.004833, -0.2417092, -2.173668, 0, 0, 0, 1, 1,
-1.000104, 0.2147037, -2.3168, 0, 0, 0, 1, 1,
-0.9978558, 1.30722, -2.503017, 1, 1, 1, 1, 1,
-0.9877611, 0.818195, -1.349984, 1, 1, 1, 1, 1,
-0.972463, -0.8594181, -1.36513, 1, 1, 1, 1, 1,
-0.9607381, -1.147801, -1.590896, 1, 1, 1, 1, 1,
-0.9591362, 1.089796, -1.168185, 1, 1, 1, 1, 1,
-0.958271, -0.7134102, -2.656148, 1, 1, 1, 1, 1,
-0.9582509, -0.06539184, -1.381154, 1, 1, 1, 1, 1,
-0.9501101, -2.165748, -3.236202, 1, 1, 1, 1, 1,
-0.9489441, -0.21193, -1.149939, 1, 1, 1, 1, 1,
-0.9421863, -0.4223504, -2.488053, 1, 1, 1, 1, 1,
-0.9359326, -0.4666091, -3.118553, 1, 1, 1, 1, 1,
-0.9308984, 0.7456301, -2.307734, 1, 1, 1, 1, 1,
-0.9259101, 0.8284609, -1.451405, 1, 1, 1, 1, 1,
-0.9188973, 0.1098899, -2.061661, 1, 1, 1, 1, 1,
-0.9155037, 0.1515432, -3.419348, 1, 1, 1, 1, 1,
-0.9152395, 0.6478364, -0.7805907, 0, 0, 1, 1, 1,
-0.9098054, -0.4279819, -3.366903, 1, 0, 0, 1, 1,
-0.9096402, -1.115606, -2.957947, 1, 0, 0, 1, 1,
-0.9080999, -0.5721366, -2.28892, 1, 0, 0, 1, 1,
-0.9071625, -0.3245052, -3.778704, 1, 0, 0, 1, 1,
-0.8972033, 0.3602116, -1.9694, 1, 0, 0, 1, 1,
-0.8966203, 1.232822, -0.9624557, 0, 0, 0, 1, 1,
-0.8959095, -0.8843416, -1.188329, 0, 0, 0, 1, 1,
-0.8867755, -1.050559, -3.05512, 0, 0, 0, 1, 1,
-0.8829378, 0.1894956, -1.077347, 0, 0, 0, 1, 1,
-0.8794721, -0.858694, -0.5203785, 0, 0, 0, 1, 1,
-0.876566, -1.515123, -3.23918, 0, 0, 0, 1, 1,
-0.8751674, -1.076863, -2.302047, 0, 0, 0, 1, 1,
-0.8746516, -0.4178665, -3.213387, 1, 1, 1, 1, 1,
-0.8591108, 1.421661, 0.4087155, 1, 1, 1, 1, 1,
-0.8530449, 2.020232, 1.984134, 1, 1, 1, 1, 1,
-0.8523669, 0.006484283, -2.234467, 1, 1, 1, 1, 1,
-0.8320873, 1.228986, -0.4953938, 1, 1, 1, 1, 1,
-0.8320468, 0.4683443, -2.025841, 1, 1, 1, 1, 1,
-0.8272331, 0.5559006, -1.632466, 1, 1, 1, 1, 1,
-0.8253244, 0.2464687, -1.43759, 1, 1, 1, 1, 1,
-0.8241439, -0.8123944, -2.397911, 1, 1, 1, 1, 1,
-0.8222433, -1.570652, -2.253372, 1, 1, 1, 1, 1,
-0.8211647, -1.38418, -2.576681, 1, 1, 1, 1, 1,
-0.8198673, 0.5799956, 0.1582192, 1, 1, 1, 1, 1,
-0.819706, -0.4367756, -1.525324, 1, 1, 1, 1, 1,
-0.8181893, -0.2639358, -2.328364, 1, 1, 1, 1, 1,
-0.8172726, 0.2157523, 0.9891613, 1, 1, 1, 1, 1,
-0.8162463, -0.4504958, -2.082787, 0, 0, 1, 1, 1,
-0.813481, 0.03548266, -1.216506, 1, 0, 0, 1, 1,
-0.8134184, -0.3039434, -2.125911, 1, 0, 0, 1, 1,
-0.8131022, 0.3286235, -2.339978, 1, 0, 0, 1, 1,
-0.8097517, 0.6670871, -0.07104596, 1, 0, 0, 1, 1,
-0.8086742, 0.2082253, -0.5960594, 1, 0, 0, 1, 1,
-0.8074276, -0.2914747, -2.28598, 0, 0, 0, 1, 1,
-0.8066342, 0.3603137, -0.1091456, 0, 0, 0, 1, 1,
-0.8029501, -1.323676, -1.38327, 0, 0, 0, 1, 1,
-0.7945896, -0.08715276, -0.9893767, 0, 0, 0, 1, 1,
-0.7940208, -0.3287828, -2.397662, 0, 0, 0, 1, 1,
-0.7910263, -0.4235658, -1.51513, 0, 0, 0, 1, 1,
-0.7837508, 2.947137, 0.01486373, 0, 0, 0, 1, 1,
-0.7836391, -0.1716308, -4.095447, 1, 1, 1, 1, 1,
-0.7809802, -0.8160267, -2.770139, 1, 1, 1, 1, 1,
-0.7782889, 2.089961, 0.3084975, 1, 1, 1, 1, 1,
-0.7723692, -0.06961649, -2.120897, 1, 1, 1, 1, 1,
-0.769456, -0.8435269, -0.9272414, 1, 1, 1, 1, 1,
-0.7693927, 2.160864, 0.3071612, 1, 1, 1, 1, 1,
-0.7685044, -0.4002313, -3.94697, 1, 1, 1, 1, 1,
-0.7652477, 0.8168089, -1.848073, 1, 1, 1, 1, 1,
-0.7650546, -0.4274785, -2.243876, 1, 1, 1, 1, 1,
-0.7650513, -1.179813, -0.7905012, 1, 1, 1, 1, 1,
-0.7615749, -0.6322113, -2.741823, 1, 1, 1, 1, 1,
-0.7600673, 0.5090539, -1.037902, 1, 1, 1, 1, 1,
-0.7598291, -0.02402393, -0.03255158, 1, 1, 1, 1, 1,
-0.757839, 0.8717537, 0.2549319, 1, 1, 1, 1, 1,
-0.7571202, 1.324289, -2.20505, 1, 1, 1, 1, 1,
-0.7542872, 0.5499908, -1.428932, 0, 0, 1, 1, 1,
-0.7526315, -0.7626838, -1.778908, 1, 0, 0, 1, 1,
-0.7401205, 2.076533, -0.05317656, 1, 0, 0, 1, 1,
-0.7374439, -0.9778723, -2.818783, 1, 0, 0, 1, 1,
-0.7351017, -1.018165, -2.007573, 1, 0, 0, 1, 1,
-0.7350137, -0.03207185, -1.392779, 1, 0, 0, 1, 1,
-0.7306498, 0.2076528, -1.000447, 0, 0, 0, 1, 1,
-0.7296271, -0.2121076, -2.615605, 0, 0, 0, 1, 1,
-0.7235961, 0.7224446, -0.679131, 0, 0, 0, 1, 1,
-0.7224286, -0.7387516, -1.615019, 0, 0, 0, 1, 1,
-0.7224151, 0.09767043, -2.951043, 0, 0, 0, 1, 1,
-0.7205288, 0.05683922, -0.7335955, 0, 0, 0, 1, 1,
-0.7137999, -0.8243748, 0.5348378, 0, 0, 0, 1, 1,
-0.7044822, 2.933634, -1.122522, 1, 1, 1, 1, 1,
-0.699109, -0.8994828, -1.738713, 1, 1, 1, 1, 1,
-0.6983739, -0.5083528, -1.705952, 1, 1, 1, 1, 1,
-0.6942344, -0.5421759, -4.079668, 1, 1, 1, 1, 1,
-0.6930565, 1.297093, -2.259385, 1, 1, 1, 1, 1,
-0.6907197, -1.371085, -4.69861, 1, 1, 1, 1, 1,
-0.6888137, -0.848824, -3.166277, 1, 1, 1, 1, 1,
-0.6868601, -0.5678291, -2.80129, 1, 1, 1, 1, 1,
-0.6857585, -2.211015, -0.6296, 1, 1, 1, 1, 1,
-0.6809216, 1.372372, 1.775397, 1, 1, 1, 1, 1,
-0.6751958, 0.4719817, -1.351674, 1, 1, 1, 1, 1,
-0.6709681, -0.8628947, -2.167917, 1, 1, 1, 1, 1,
-0.670456, 0.6865662, -0.1987826, 1, 1, 1, 1, 1,
-0.667914, 1.784359, -2.671544, 1, 1, 1, 1, 1,
-0.6576833, -0.5188604, -1.896137, 1, 1, 1, 1, 1,
-0.6574336, 0.730696, -1.639854, 0, 0, 1, 1, 1,
-0.6451787, 0.8275473, 1.164836, 1, 0, 0, 1, 1,
-0.6436703, -1.444583, -3.090212, 1, 0, 0, 1, 1,
-0.6373155, 1.150527, -0.05436121, 1, 0, 0, 1, 1,
-0.6362177, 0.8728704, -1.714161, 1, 0, 0, 1, 1,
-0.6328619, -1.486578, -3.437972, 1, 0, 0, 1, 1,
-0.626527, 1.693231, 0.08027376, 0, 0, 0, 1, 1,
-0.6218427, 1.364484, 0.5121826, 0, 0, 0, 1, 1,
-0.6188496, -0.7238439, -2.830467, 0, 0, 0, 1, 1,
-0.61843, 0.3742126, -1.592565, 0, 0, 0, 1, 1,
-0.6176623, 0.7455119, -1.502492, 0, 0, 0, 1, 1,
-0.6119181, -0.8472537, -1.84157, 0, 0, 0, 1, 1,
-0.6046508, 1.246525, -1.075076, 0, 0, 0, 1, 1,
-0.601615, 1.183474, 0.5908549, 1, 1, 1, 1, 1,
-0.5999658, -0.6365084, -2.78041, 1, 1, 1, 1, 1,
-0.5963073, -1.488477, -2.647584, 1, 1, 1, 1, 1,
-0.594305, -1.004372, -3.586358, 1, 1, 1, 1, 1,
-0.5933857, 0.3669587, 1.271152, 1, 1, 1, 1, 1,
-0.5804754, 0.3436331, -1.652848, 1, 1, 1, 1, 1,
-0.5783688, -1.795123, -3.952115, 1, 1, 1, 1, 1,
-0.5774153, -1.723693, -3.032847, 1, 1, 1, 1, 1,
-0.5646076, -2.041395, -4.309319, 1, 1, 1, 1, 1,
-0.5624583, -1.105004, -1.757968, 1, 1, 1, 1, 1,
-0.5623723, 0.02765918, -1.972966, 1, 1, 1, 1, 1,
-0.5611928, 1.842484, 0.04685046, 1, 1, 1, 1, 1,
-0.5599571, 0.05328608, 0.4148231, 1, 1, 1, 1, 1,
-0.5563354, 2.082308, 0.5378125, 1, 1, 1, 1, 1,
-0.5554365, -0.4896301, -1.413678, 1, 1, 1, 1, 1,
-0.5553362, -0.6727448, -0.9008908, 0, 0, 1, 1, 1,
-0.5543339, -0.4964679, -2.033493, 1, 0, 0, 1, 1,
-0.5521934, -1.345002, -3.123127, 1, 0, 0, 1, 1,
-0.5502151, -0.5311917, -3.373823, 1, 0, 0, 1, 1,
-0.5499324, -0.426058, -2.585631, 1, 0, 0, 1, 1,
-0.548393, 0.5346227, -0.4463232, 1, 0, 0, 1, 1,
-0.5460327, -0.6852381, -2.160048, 0, 0, 0, 1, 1,
-0.545972, 1.244818, -0.05489508, 0, 0, 0, 1, 1,
-0.5458745, 0.1906178, -2.415204, 0, 0, 0, 1, 1,
-0.5456481, 0.4042815, 0.8883125, 0, 0, 0, 1, 1,
-0.541662, 0.7730882, -2.666326, 0, 0, 0, 1, 1,
-0.5402046, 0.966164, -0.1860886, 0, 0, 0, 1, 1,
-0.538727, 0.3373615, 1.838701, 0, 0, 0, 1, 1,
-0.5377587, -0.4367642, -3.634732, 1, 1, 1, 1, 1,
-0.5369837, -0.8961208, -3.116182, 1, 1, 1, 1, 1,
-0.5350279, 0.1020948, -0.4376609, 1, 1, 1, 1, 1,
-0.529969, -0.5507094, -3.628972, 1, 1, 1, 1, 1,
-0.5269513, -0.5002864, -1.705428, 1, 1, 1, 1, 1,
-0.5248909, 2.362141, 0.1125719, 1, 1, 1, 1, 1,
-0.5225238, 0.9978278, 0.5693305, 1, 1, 1, 1, 1,
-0.5220217, -0.2776973, 0.1272601, 1, 1, 1, 1, 1,
-0.5209076, -0.2197585, -1.519995, 1, 1, 1, 1, 1,
-0.5206664, 1.596443, 1.071565, 1, 1, 1, 1, 1,
-0.5181241, -3.160439, -3.296863, 1, 1, 1, 1, 1,
-0.515859, 0.6800568, -1.335295, 1, 1, 1, 1, 1,
-0.511893, 0.2470998, 0.6027706, 1, 1, 1, 1, 1,
-0.5095076, -1.469459, -1.123045, 1, 1, 1, 1, 1,
-0.5009892, 0.07147849, -1.194819, 1, 1, 1, 1, 1,
-0.4968472, 0.9621671, 0.3249334, 0, 0, 1, 1, 1,
-0.4948959, 0.4184996, 0.1192145, 1, 0, 0, 1, 1,
-0.4936137, 0.1483552, -1.005029, 1, 0, 0, 1, 1,
-0.4912102, -0.4815064, -0.3466046, 1, 0, 0, 1, 1,
-0.4898684, -1.077443, -1.521263, 1, 0, 0, 1, 1,
-0.4885625, -0.3531527, -2.04343, 1, 0, 0, 1, 1,
-0.4858381, -0.02406627, -2.308887, 0, 0, 0, 1, 1,
-0.4856033, -0.154902, -3.017786, 0, 0, 0, 1, 1,
-0.4851448, 0.3042577, -2.747811, 0, 0, 0, 1, 1,
-0.480825, 1.032189, 0.5788286, 0, 0, 0, 1, 1,
-0.4794559, -0.9566823, -3.153884, 0, 0, 0, 1, 1,
-0.476186, 1.249639, 1.367941, 0, 0, 0, 1, 1,
-0.4758983, 0.5761108, 0.2716145, 0, 0, 0, 1, 1,
-0.4747779, 1.430309, -2.206139, 1, 1, 1, 1, 1,
-0.4719707, -1.692006, -3.666352, 1, 1, 1, 1, 1,
-0.4692702, 0.7753493, 1.682767, 1, 1, 1, 1, 1,
-0.4671987, -1.212523, -1.971644, 1, 1, 1, 1, 1,
-0.466283, 0.04730453, -1.92349, 1, 1, 1, 1, 1,
-0.4655292, 1.044815, -0.1642595, 1, 1, 1, 1, 1,
-0.4621519, -1.108474, -3.187335, 1, 1, 1, 1, 1,
-0.4607682, -2.230341, -3.741995, 1, 1, 1, 1, 1,
-0.456309, -0.9108903, -3.643257, 1, 1, 1, 1, 1,
-0.4562404, -0.8477634, -3.842758, 1, 1, 1, 1, 1,
-0.453978, 1.440205, -0.3984745, 1, 1, 1, 1, 1,
-0.4510414, 1.803352, 0.6790609, 1, 1, 1, 1, 1,
-0.4508178, 0.2363459, -0.8490989, 1, 1, 1, 1, 1,
-0.4448367, 1.464965, 0.1024264, 1, 1, 1, 1, 1,
-0.4429632, 1.409103, -1.682462, 1, 1, 1, 1, 1,
-0.4420239, 0.8348882, -1.000358, 0, 0, 1, 1, 1,
-0.4392737, -0.5778155, -2.200317, 1, 0, 0, 1, 1,
-0.4373616, 0.9646602, 0.06192299, 1, 0, 0, 1, 1,
-0.4365073, -1.146966, -3.051748, 1, 0, 0, 1, 1,
-0.4364023, 0.4140007, -0.9876252, 1, 0, 0, 1, 1,
-0.4361194, -0.5534478, -2.863994, 1, 0, 0, 1, 1,
-0.4349413, -0.2720042, -2.43094, 0, 0, 0, 1, 1,
-0.4338109, 0.2727403, -2.184097, 0, 0, 0, 1, 1,
-0.4305629, -0.46267, -2.908379, 0, 0, 0, 1, 1,
-0.4304413, -0.9086422, -1.504997, 0, 0, 0, 1, 1,
-0.430389, -0.1035238, -1.356416, 0, 0, 0, 1, 1,
-0.4239344, -0.4178325, -1.415475, 0, 0, 0, 1, 1,
-0.4176343, 0.3133417, -1.113166, 0, 0, 0, 1, 1,
-0.4171569, -0.0762045, -1.085315, 1, 1, 1, 1, 1,
-0.4150096, 1.348337, -0.3629158, 1, 1, 1, 1, 1,
-0.4118369, -0.2317579, -1.837018, 1, 1, 1, 1, 1,
-0.4054031, 0.01475752, -0.5265294, 1, 1, 1, 1, 1,
-0.4050012, 0.3536998, -1.719643, 1, 1, 1, 1, 1,
-0.4035994, 0.428315, -1.047207, 1, 1, 1, 1, 1,
-0.4008919, 1.049968, 0.5930407, 1, 1, 1, 1, 1,
-0.396231, 0.1441129, -0.7233462, 1, 1, 1, 1, 1,
-0.3956559, 0.6031297, -2.563989, 1, 1, 1, 1, 1,
-0.3939246, 0.06913068, -0.4780266, 1, 1, 1, 1, 1,
-0.3936052, -0.2777619, -2.807238, 1, 1, 1, 1, 1,
-0.3915055, -1.589616, -2.882649, 1, 1, 1, 1, 1,
-0.3902354, -1.363007, -2.930607, 1, 1, 1, 1, 1,
-0.3871969, -0.07020183, -2.804605, 1, 1, 1, 1, 1,
-0.3871371, 0.09638609, -0.9542697, 1, 1, 1, 1, 1,
-0.3782755, -0.5894579, -2.947364, 0, 0, 1, 1, 1,
-0.3751634, -0.3803047, -2.931177, 1, 0, 0, 1, 1,
-0.3683202, -1.136332, -3.116701, 1, 0, 0, 1, 1,
-0.3680448, -1.157649, -2.64243, 1, 0, 0, 1, 1,
-0.3572042, -1.125433, -3.674774, 1, 0, 0, 1, 1,
-0.355544, 0.2871288, 0.531703, 1, 0, 0, 1, 1,
-0.3542459, 1.103789, -0.4384312, 0, 0, 0, 1, 1,
-0.3520652, 0.6222299, -0.1858887, 0, 0, 0, 1, 1,
-0.3519121, -1.159699, -3.932554, 0, 0, 0, 1, 1,
-0.3447054, 0.7688743, -0.7383871, 0, 0, 0, 1, 1,
-0.3432761, -0.7455974, -0.4103834, 0, 0, 0, 1, 1,
-0.339613, -0.7565546, -2.071808, 0, 0, 0, 1, 1,
-0.3379304, 0.1492703, -2.340664, 0, 0, 0, 1, 1,
-0.3333234, 0.4776771, -0.3787021, 1, 1, 1, 1, 1,
-0.3187149, 0.2315366, -1.61418, 1, 1, 1, 1, 1,
-0.3076259, -0.7491917, -2.529556, 1, 1, 1, 1, 1,
-0.3050542, 0.5484849, -1.379255, 1, 1, 1, 1, 1,
-0.3040497, 1.102521, -1.538748, 1, 1, 1, 1, 1,
-0.298996, -1.176582, -3.285524, 1, 1, 1, 1, 1,
-0.2982655, 1.199877, 1.453815, 1, 1, 1, 1, 1,
-0.2965526, -1.544601, -3.683753, 1, 1, 1, 1, 1,
-0.2954123, -0.1133548, -2.243324, 1, 1, 1, 1, 1,
-0.2953053, 1.517941, 1.398263, 1, 1, 1, 1, 1,
-0.293791, 0.4164614, -0.5744351, 1, 1, 1, 1, 1,
-0.2928815, 0.7197034, -0.156875, 1, 1, 1, 1, 1,
-0.2899606, 0.03988915, -3.008235, 1, 1, 1, 1, 1,
-0.2876846, 0.5796134, -0.3181227, 1, 1, 1, 1, 1,
-0.2867024, 0.8702943, -0.2027247, 1, 1, 1, 1, 1,
-0.2855667, 0.574503, 0.07503373, 0, 0, 1, 1, 1,
-0.2853262, -1.506751, -2.469577, 1, 0, 0, 1, 1,
-0.2815167, -0.2940913, -0.6534882, 1, 0, 0, 1, 1,
-0.2795531, 0.3544988, -0.7686279, 1, 0, 0, 1, 1,
-0.2784142, -0.1676604, -2.459072, 1, 0, 0, 1, 1,
-0.2748249, 0.3523448, 0.6073227, 1, 0, 0, 1, 1,
-0.2689063, -0.3031895, -1.036042, 0, 0, 0, 1, 1,
-0.2675793, -0.86249, -1.917209, 0, 0, 0, 1, 1,
-0.2660026, 0.05791353, -1.705616, 0, 0, 0, 1, 1,
-0.2560559, -1.595944, -3.589045, 0, 0, 0, 1, 1,
-0.2559025, 1.465639, -0.6523381, 0, 0, 0, 1, 1,
-0.2539807, 0.330966, -1.371524, 0, 0, 0, 1, 1,
-0.2536036, -0.8159798, -3.207439, 0, 0, 0, 1, 1,
-0.2531662, 0.04165483, -1.814141, 1, 1, 1, 1, 1,
-0.2517385, -0.1819964, -0.6886926, 1, 1, 1, 1, 1,
-0.2417152, 1.059338, -1.243847, 1, 1, 1, 1, 1,
-0.2415091, 1.436265, -0.6180648, 1, 1, 1, 1, 1,
-0.2382589, -0.05240358, -1.595163, 1, 1, 1, 1, 1,
-0.2345149, 1.174651, -0.05564317, 1, 1, 1, 1, 1,
-0.2335493, -1.226679, -3.808195, 1, 1, 1, 1, 1,
-0.232721, 0.5378152, -0.9433075, 1, 1, 1, 1, 1,
-0.2309989, 0.5238412, -1.963482, 1, 1, 1, 1, 1,
-0.2305132, 0.8973773, 1.018278, 1, 1, 1, 1, 1,
-0.2280672, -0.8230227, -2.671956, 1, 1, 1, 1, 1,
-0.2248845, -0.3340121, -1.85315, 1, 1, 1, 1, 1,
-0.2193062, -0.7351094, -3.653646, 1, 1, 1, 1, 1,
-0.2127934, 0.4071923, -1.127922, 1, 1, 1, 1, 1,
-0.2083812, -0.58493, -4.245898, 1, 1, 1, 1, 1,
-0.2010585, -0.1441852, -1.121768, 0, 0, 1, 1, 1,
-0.200789, -0.6604537, -3.463781, 1, 0, 0, 1, 1,
-0.1997754, -0.2535744, -1.923443, 1, 0, 0, 1, 1,
-0.1960217, 1.170661, -0.5188322, 1, 0, 0, 1, 1,
-0.193918, 1.848775, -0.2103554, 1, 0, 0, 1, 1,
-0.1909536, -0.01457357, 0.1157461, 1, 0, 0, 1, 1,
-0.1906309, 0.1085311, 0.5975536, 0, 0, 0, 1, 1,
-0.1899847, 1.084164, -2.143666, 0, 0, 0, 1, 1,
-0.1874927, 1.525029, -2.232316, 0, 0, 0, 1, 1,
-0.1752821, -1.818849, -1.937193, 0, 0, 0, 1, 1,
-0.1738165, -0.1471517, -0.8340591, 0, 0, 0, 1, 1,
-0.1716046, 0.6497974, -0.7558112, 0, 0, 0, 1, 1,
-0.1613911, 0.8995753, 0.7328991, 0, 0, 0, 1, 1,
-0.1606527, -0.4933354, -2.81532, 1, 1, 1, 1, 1,
-0.1593096, -0.6862501, -4.012691, 1, 1, 1, 1, 1,
-0.1584761, 0.7556064, -0.3819061, 1, 1, 1, 1, 1,
-0.1535463, 0.10031, -0.9328303, 1, 1, 1, 1, 1,
-0.1461995, 1.670166, -1.523573, 1, 1, 1, 1, 1,
-0.1401352, -0.8547299, -2.858148, 1, 1, 1, 1, 1,
-0.1363678, -1.998124, -2.9487, 1, 1, 1, 1, 1,
-0.1359978, 0.4328573, -2.744592, 1, 1, 1, 1, 1,
-0.1335925, -0.4283715, -2.722609, 1, 1, 1, 1, 1,
-0.1316189, -1.277362, -2.896972, 1, 1, 1, 1, 1,
-0.1285585, 0.5784312, -0.266644, 1, 1, 1, 1, 1,
-0.128327, 0.6641042, -1.221934, 1, 1, 1, 1, 1,
-0.1282671, 0.8396279, 0.8083635, 1, 1, 1, 1, 1,
-0.1258288, -1.109484, -3.489032, 1, 1, 1, 1, 1,
-0.1231088, 0.1509187, 1.696667, 1, 1, 1, 1, 1,
-0.1092799, -0.2530198, -3.494895, 0, 0, 1, 1, 1,
-0.1027945, -0.3768117, -3.192261, 1, 0, 0, 1, 1,
-0.1023409, -1.282603, -1.326264, 1, 0, 0, 1, 1,
-0.1021335, 0.6963755, 0.3826855, 1, 0, 0, 1, 1,
-0.09880406, 0.2752468, -0.3261365, 1, 0, 0, 1, 1,
-0.09800374, 1.240911, 1.813429, 1, 0, 0, 1, 1,
-0.09623285, -0.5144879, -3.69409, 0, 0, 0, 1, 1,
-0.09061506, -0.3028789, -3.051774, 0, 0, 0, 1, 1,
-0.08748797, 1.778288, -0.2182383, 0, 0, 0, 1, 1,
-0.08368973, -1.116985, -1.763962, 0, 0, 0, 1, 1,
-0.0825255, 0.09413076, -2.362118, 0, 0, 0, 1, 1,
-0.08207168, 0.06560902, -0.986816, 0, 0, 0, 1, 1,
-0.08088957, 0.8658006, 0.4054178, 0, 0, 0, 1, 1,
-0.07489537, -0.2537103, -2.530868, 1, 1, 1, 1, 1,
-0.06689294, -1.387754, -2.685985, 1, 1, 1, 1, 1,
-0.06497637, -1.515753, -2.250813, 1, 1, 1, 1, 1,
-0.06142089, 0.4790795, -0.3487319, 1, 1, 1, 1, 1,
-0.06014381, 0.1961387, -1.352577, 1, 1, 1, 1, 1,
-0.05361163, 0.4451691, 0.4557067, 1, 1, 1, 1, 1,
-0.04752164, -0.1906345, -2.103199, 1, 1, 1, 1, 1,
-0.04398509, 0.5142558, -0.8895583, 1, 1, 1, 1, 1,
-0.04322403, 0.764178, 0.02366824, 1, 1, 1, 1, 1,
-0.03799082, -1.601969, -3.596146, 1, 1, 1, 1, 1,
-0.03678171, -1.952727, -5.283476, 1, 1, 1, 1, 1,
-0.03675658, -1.678788, -3.388985, 1, 1, 1, 1, 1,
-0.03250005, -0.3456923, -3.256943, 1, 1, 1, 1, 1,
-0.02932096, 0.3669746, 0.4639322, 1, 1, 1, 1, 1,
-0.02854503, -1.048442, -4.055619, 1, 1, 1, 1, 1,
-0.02472641, 0.255183, -0.7479851, 0, 0, 1, 1, 1,
-0.02441434, 0.4228947, -0.4862314, 1, 0, 0, 1, 1,
-0.01948437, -0.3667751, -3.998456, 1, 0, 0, 1, 1,
-0.01340493, -1.932132, -4.107928, 1, 0, 0, 1, 1,
-0.01244439, -1.296838, -3.432473, 1, 0, 0, 1, 1,
-0.009022069, 1.459791, 0.2473305, 1, 0, 0, 1, 1,
-0.0006578759, 1.296577, 0.03797121, 0, 0, 0, 1, 1,
-6.873788e-05, 1.538574, -0.1028212, 0, 0, 0, 1, 1,
0.0001963568, 0.4797491, -2.103279, 0, 0, 0, 1, 1,
0.003557399, -0.8626291, 3.215832, 0, 0, 0, 1, 1,
0.004603709, 0.01678542, 2.139934, 0, 0, 0, 1, 1,
0.005650856, 0.3054723, 0.2444726, 0, 0, 0, 1, 1,
0.01072713, -1.163594, 3.2378, 0, 0, 0, 1, 1,
0.0135882, 0.7879756, -1.344972, 1, 1, 1, 1, 1,
0.01677196, 0.2537616, -0.5089089, 1, 1, 1, 1, 1,
0.01805404, 1.065741, -1.893457, 1, 1, 1, 1, 1,
0.02022901, 1.166635, 0.3045071, 1, 1, 1, 1, 1,
0.02305598, 0.4476807, -0.9272851, 1, 1, 1, 1, 1,
0.02529273, -0.1112044, 2.88314, 1, 1, 1, 1, 1,
0.02766914, 0.04598964, -0.5898346, 1, 1, 1, 1, 1,
0.03323759, 0.4236417, 0.6049968, 1, 1, 1, 1, 1,
0.03701692, 0.6091267, 1.243863, 1, 1, 1, 1, 1,
0.03821484, 1.670217, -1.249934, 1, 1, 1, 1, 1,
0.03852875, 0.351858, 0.2387156, 1, 1, 1, 1, 1,
0.04032378, -0.6822002, 3.194169, 1, 1, 1, 1, 1,
0.04984716, 0.2833144, -0.9076567, 1, 1, 1, 1, 1,
0.05365571, -0.7243234, 3.528147, 1, 1, 1, 1, 1,
0.05772993, -1.043083, 3.460199, 1, 1, 1, 1, 1,
0.0583066, -0.2560982, 2.834262, 0, 0, 1, 1, 1,
0.06162579, -1.297469, 2.607833, 1, 0, 0, 1, 1,
0.06208879, -1.416033, 3.29542, 1, 0, 0, 1, 1,
0.06303732, -0.4064818, 2.504004, 1, 0, 0, 1, 1,
0.06600548, -0.288043, 2.091361, 1, 0, 0, 1, 1,
0.0660743, 3.026564, -3.041069, 1, 0, 0, 1, 1,
0.06812707, 1.111839, 2.38965, 0, 0, 0, 1, 1,
0.07234209, -1.482844, 4.161675, 0, 0, 0, 1, 1,
0.07591823, -0.5339893, 4.038651, 0, 0, 0, 1, 1,
0.07699896, -1.484398, 2.860362, 0, 0, 0, 1, 1,
0.07840724, -1.737097, 3.609872, 0, 0, 0, 1, 1,
0.0819053, 1.057067, -0.5466339, 0, 0, 0, 1, 1,
0.08331143, -1.999969, 4.732517, 0, 0, 0, 1, 1,
0.08451769, -0.1791944, 2.886611, 1, 1, 1, 1, 1,
0.08839148, -1.719648, 3.964003, 1, 1, 1, 1, 1,
0.09442258, 1.611284, -0.9762775, 1, 1, 1, 1, 1,
0.09505198, -0.1687469, 1.661474, 1, 1, 1, 1, 1,
0.09875974, 0.4838907, 1.204517, 1, 1, 1, 1, 1,
0.09876657, -3.353397, 1.336627, 1, 1, 1, 1, 1,
0.09957055, 1.329221, -0.3594125, 1, 1, 1, 1, 1,
0.1041365, 0.1355377, 0.5579551, 1, 1, 1, 1, 1,
0.1050723, 1.96042, -0.49387, 1, 1, 1, 1, 1,
0.1051029, -0.6422959, 1.217432, 1, 1, 1, 1, 1,
0.1057637, 1.346286, 1.190028, 1, 1, 1, 1, 1,
0.1064127, -0.5676374, 2.531311, 1, 1, 1, 1, 1,
0.1068693, 0.05921345, 1.134446, 1, 1, 1, 1, 1,
0.1073043, 0.3730287, 0.9174082, 1, 1, 1, 1, 1,
0.1093862, 0.4217091, -1.769108, 1, 1, 1, 1, 1,
0.1105419, 1.588716, -0.4897807, 0, 0, 1, 1, 1,
0.1133654, 0.3808412, 0.4070781, 1, 0, 0, 1, 1,
0.1146455, -1.043221, 1.712714, 1, 0, 0, 1, 1,
0.1165226, -0.3549132, 3.302272, 1, 0, 0, 1, 1,
0.119189, -0.6036311, 1.641281, 1, 0, 0, 1, 1,
0.1211631, 1.543913, 0.6846728, 1, 0, 0, 1, 1,
0.1211684, 0.1535411, 0.9234327, 0, 0, 0, 1, 1,
0.124765, -1.07959, 0.8304151, 0, 0, 0, 1, 1,
0.1263898, 0.1921444, 2.318531, 0, 0, 0, 1, 1,
0.1269201, 0.8792356, 0.9380333, 0, 0, 0, 1, 1,
0.1271661, 0.8429387, -0.3429673, 0, 0, 0, 1, 1,
0.1293629, 0.04713031, 1.294873, 0, 0, 0, 1, 1,
0.1299981, 0.6676286, -0.8026538, 0, 0, 0, 1, 1,
0.1305829, 1.513883, 1.010471, 1, 1, 1, 1, 1,
0.1337802, 1.631634, -0.02119548, 1, 1, 1, 1, 1,
0.1350494, 0.4157604, -1.099745, 1, 1, 1, 1, 1,
0.1379355, -0.2665613, 1.60487, 1, 1, 1, 1, 1,
0.144366, 0.02225338, 1.708737, 1, 1, 1, 1, 1,
0.1467401, 0.3619463, 1.264163, 1, 1, 1, 1, 1,
0.1473238, 3.166906, -2.581405, 1, 1, 1, 1, 1,
0.1489278, -1.400918, 3.734753, 1, 1, 1, 1, 1,
0.1497019, -1.356191, 1.467664, 1, 1, 1, 1, 1,
0.1523336, -0.04763833, 2.113375, 1, 1, 1, 1, 1,
0.1544482, -1.229833, 1.885101, 1, 1, 1, 1, 1,
0.1552055, 0.01407714, 1.838925, 1, 1, 1, 1, 1,
0.1575791, -1.510013, 3.797262, 1, 1, 1, 1, 1,
0.1577629, 0.1018993, 1.300504, 1, 1, 1, 1, 1,
0.159233, 0.7458333, 0.5713295, 1, 1, 1, 1, 1,
0.1603393, 1.008446, 0.6597477, 0, 0, 1, 1, 1,
0.1608354, -1.390366, 2.679351, 1, 0, 0, 1, 1,
0.1665815, 0.338196, 1.391096, 1, 0, 0, 1, 1,
0.171664, 1.128281, -0.5485826, 1, 0, 0, 1, 1,
0.1735167, 1.602403, -0.2342718, 1, 0, 0, 1, 1,
0.1761129, 1.280071, -0.8342419, 1, 0, 0, 1, 1,
0.1762795, 1.231578, -1.099571, 0, 0, 0, 1, 1,
0.1764732, 0.2422563, 0.2894715, 0, 0, 0, 1, 1,
0.177121, -2.082767, 4.234034, 0, 0, 0, 1, 1,
0.1774143, -1.603263, 1.725933, 0, 0, 0, 1, 1,
0.1774966, 1.242504, 1.533956, 0, 0, 0, 1, 1,
0.1775085, 0.07752973, 0.009868489, 0, 0, 0, 1, 1,
0.1775239, -0.5265274, 2.88493, 0, 0, 0, 1, 1,
0.1804552, -0.407837, 2.166541, 1, 1, 1, 1, 1,
0.1806257, -0.5865097, 1.070941, 1, 1, 1, 1, 1,
0.1864804, 0.1481854, -0.2545244, 1, 1, 1, 1, 1,
0.1867667, 0.6707447, 1.156063, 1, 1, 1, 1, 1,
0.1911037, -0.4854315, 2.934306, 1, 1, 1, 1, 1,
0.2004357, -0.2861459, 3.57718, 1, 1, 1, 1, 1,
0.2046317, -2.780187, 3.461708, 1, 1, 1, 1, 1,
0.2074924, -0.3935147, 2.872133, 1, 1, 1, 1, 1,
0.2087383, -0.2818059, 2.297058, 1, 1, 1, 1, 1,
0.2089838, 0.7533628, 0.1260004, 1, 1, 1, 1, 1,
0.2096548, 1.897648, 2.008911, 1, 1, 1, 1, 1,
0.2122774, 0.0659234, 1.49108, 1, 1, 1, 1, 1,
0.2185085, -0.4148192, 4.016622, 1, 1, 1, 1, 1,
0.2195669, -2.056953, 3.386907, 1, 1, 1, 1, 1,
0.2206582, -1.00137, 3.305681, 1, 1, 1, 1, 1,
0.2225456, 1.582724, 0.8104165, 0, 0, 1, 1, 1,
0.2291241, 0.2555679, 0.7258379, 1, 0, 0, 1, 1,
0.2348397, 1.160927, 0.2853196, 1, 0, 0, 1, 1,
0.2417079, -2.218141, 2.86025, 1, 0, 0, 1, 1,
0.2433887, -0.6474819, 3.621575, 1, 0, 0, 1, 1,
0.2439916, 0.3144362, 1.79221, 1, 0, 0, 1, 1,
0.2463094, 0.2964197, 2.795505, 0, 0, 0, 1, 1,
0.2475971, 0.5919774, -0.3919681, 0, 0, 0, 1, 1,
0.2477728, 2.296316, 0.7470216, 0, 0, 0, 1, 1,
0.2625239, -1.344476, 2.813978, 0, 0, 0, 1, 1,
0.2688165, 0.5923499, 1.173188, 0, 0, 0, 1, 1,
0.2695689, 1.299349, 1.159284, 0, 0, 0, 1, 1,
0.2697845, 0.1003312, 2.836555, 0, 0, 0, 1, 1,
0.2732584, 0.1705685, 3.682878, 1, 1, 1, 1, 1,
0.2766484, -0.9839935, 4.276863, 1, 1, 1, 1, 1,
0.2768323, 0.08248399, 2.346372, 1, 1, 1, 1, 1,
0.2817783, 0.9292797, 2.424368, 1, 1, 1, 1, 1,
0.2824539, 0.8876321, -0.3696196, 1, 1, 1, 1, 1,
0.2841344, -0.2293908, 3.077339, 1, 1, 1, 1, 1,
0.2853109, -0.7311041, 2.116553, 1, 1, 1, 1, 1,
0.2865626, -1.240771, 5.135625, 1, 1, 1, 1, 1,
0.2878866, -0.9098052, 3.077, 1, 1, 1, 1, 1,
0.2897647, -0.321655, 0.5568204, 1, 1, 1, 1, 1,
0.2897903, 1.544522, 1.516335, 1, 1, 1, 1, 1,
0.2907443, 0.4297556, -0.4822387, 1, 1, 1, 1, 1,
0.2932695, -0.2656386, 2.987407, 1, 1, 1, 1, 1,
0.2961866, 0.3071066, -0.2979283, 1, 1, 1, 1, 1,
0.2983002, 0.4586217, 1.070014, 1, 1, 1, 1, 1,
0.2983422, 0.230581, 0.8482887, 0, 0, 1, 1, 1,
0.3003359, -0.6262259, 3.260323, 1, 0, 0, 1, 1,
0.3054249, -1.184211, 2.407356, 1, 0, 0, 1, 1,
0.3060809, 0.3681817, 0.8847383, 1, 0, 0, 1, 1,
0.307021, 0.3450457, 0.5487577, 1, 0, 0, 1, 1,
0.3077995, 0.3423085, 1.177462, 1, 0, 0, 1, 1,
0.3097101, 0.4270924, 0.5771118, 0, 0, 0, 1, 1,
0.3141711, 0.3306835, -1.739002, 0, 0, 0, 1, 1,
0.3155911, -0.840804, 2.731755, 0, 0, 0, 1, 1,
0.3156266, 0.4779611, 0.06139826, 0, 0, 0, 1, 1,
0.315764, 0.1088522, 0.7301863, 0, 0, 0, 1, 1,
0.3163353, 0.3006589, 1.26772, 0, 0, 0, 1, 1,
0.3189486, 0.5557277, -0.1525168, 0, 0, 0, 1, 1,
0.3198887, -0.01991259, 1.836611, 1, 1, 1, 1, 1,
0.3202287, -0.9066989, 4.378039, 1, 1, 1, 1, 1,
0.3233841, -0.912921, 4.561743, 1, 1, 1, 1, 1,
0.326989, -2.347943, 3.076107, 1, 1, 1, 1, 1,
0.3298121, -0.6403816, 2.567494, 1, 1, 1, 1, 1,
0.3311053, -0.5586566, 2.891863, 1, 1, 1, 1, 1,
0.3312713, 0.8888811, 1.128286, 1, 1, 1, 1, 1,
0.3335361, 0.8701217, 1.164673, 1, 1, 1, 1, 1,
0.333667, -0.8401689, 1.727912, 1, 1, 1, 1, 1,
0.3350618, -0.928494, 1.85959, 1, 1, 1, 1, 1,
0.3352725, -0.3538598, 3.61974, 1, 1, 1, 1, 1,
0.3358024, -0.9273426, 2.215672, 1, 1, 1, 1, 1,
0.3367019, -0.3401898, 2.022573, 1, 1, 1, 1, 1,
0.340031, -0.2208166, 1.922862, 1, 1, 1, 1, 1,
0.3441463, -1.552696, 4.215955, 1, 1, 1, 1, 1,
0.3447849, 1.616851, 0.8231194, 0, 0, 1, 1, 1,
0.3501778, -0.7050968, 2.997282, 1, 0, 0, 1, 1,
0.3516849, -0.741576, 3.56899, 1, 0, 0, 1, 1,
0.3521402, -0.1494875, 2.376211, 1, 0, 0, 1, 1,
0.3571703, -0.0864381, 1.929192, 1, 0, 0, 1, 1,
0.3577487, 0.8551443, -0.9916024, 1, 0, 0, 1, 1,
0.3577658, -1.33211, 1.362506, 0, 0, 0, 1, 1,
0.3616042, 0.98562, -0.101792, 0, 0, 0, 1, 1,
0.3630068, 0.8486811, 1.021035, 0, 0, 0, 1, 1,
0.3636375, -1.136632, 3.501289, 0, 0, 0, 1, 1,
0.3646218, -0.9103167, 2.577157, 0, 0, 0, 1, 1,
0.3676332, 0.7139177, -0.431911, 0, 0, 0, 1, 1,
0.3739818, -2.230346, 3.871928, 0, 0, 0, 1, 1,
0.3818916, 0.5360738, -0.9973958, 1, 1, 1, 1, 1,
0.3832693, -0.4866323, 3.853954, 1, 1, 1, 1, 1,
0.3864106, -0.4319311, 1.941014, 1, 1, 1, 1, 1,
0.3864721, 0.6112396, 1.786831, 1, 1, 1, 1, 1,
0.3875192, -0.881216, 3.464906, 1, 1, 1, 1, 1,
0.3879047, 1.266917, 1.819337, 1, 1, 1, 1, 1,
0.3896151, 0.7115732, 0.2984721, 1, 1, 1, 1, 1,
0.3912848, -2.32567, 3.536224, 1, 1, 1, 1, 1,
0.3931208, 1.065881, 0.627335, 1, 1, 1, 1, 1,
0.3969712, -0.6332905, 1.133219, 1, 1, 1, 1, 1,
0.4082709, 1.363288, 0.5293409, 1, 1, 1, 1, 1,
0.4117502, -0.6216955, 2.434207, 1, 1, 1, 1, 1,
0.413176, -0.8792984, 3.214332, 1, 1, 1, 1, 1,
0.4174423, -0.7830536, 2.279635, 1, 1, 1, 1, 1,
0.4285223, 0.4839457, -0.06346829, 1, 1, 1, 1, 1,
0.4343351, 1.013647, -1.018773, 0, 0, 1, 1, 1,
0.4378887, 0.7301671, 0.7982714, 1, 0, 0, 1, 1,
0.4385673, -0.1284669, 0.6709456, 1, 0, 0, 1, 1,
0.4404078, -1.182045, 4.430295, 1, 0, 0, 1, 1,
0.4417279, -0.5746239, 4.332152, 1, 0, 0, 1, 1,
0.4425132, 0.3932292, 0.4375314, 1, 0, 0, 1, 1,
0.4434243, 1.344794, 0.001193422, 0, 0, 0, 1, 1,
0.4449567, -0.2701054, 3.42913, 0, 0, 0, 1, 1,
0.4476519, 1.18945, -1.450831, 0, 0, 0, 1, 1,
0.4478236, 0.2374373, 2.138605, 0, 0, 0, 1, 1,
0.4478803, 0.7364277, -2.201874, 0, 0, 0, 1, 1,
0.4522623, 0.1940587, 0.5907735, 0, 0, 0, 1, 1,
0.4566457, -1.414115, 4.299403, 0, 0, 0, 1, 1,
0.4604584, 1.092951, 0.9215474, 1, 1, 1, 1, 1,
0.461267, 1.255703, -0.2485241, 1, 1, 1, 1, 1,
0.4648703, 0.5581014, -0.7539397, 1, 1, 1, 1, 1,
0.4656185, 0.4883436, 0.8639042, 1, 1, 1, 1, 1,
0.4657914, -0.05902332, 1.349305, 1, 1, 1, 1, 1,
0.4660121, 1.385067, 0.5366753, 1, 1, 1, 1, 1,
0.4671226, -1.768188, 3.673531, 1, 1, 1, 1, 1,
0.4761852, -0.5877833, 3.420342, 1, 1, 1, 1, 1,
0.4765934, 2.219332, -0.7708961, 1, 1, 1, 1, 1,
0.4804872, -1.369644, 2.697721, 1, 1, 1, 1, 1,
0.4811001, 1.492707, -0.25217, 1, 1, 1, 1, 1,
0.4822981, 2.178734, -0.08905291, 1, 1, 1, 1, 1,
0.4926799, -1.211572, 1.616284, 1, 1, 1, 1, 1,
0.4931737, -1.227806, 3.66484, 1, 1, 1, 1, 1,
0.4941537, -0.3376541, 2.180832, 1, 1, 1, 1, 1,
0.4946035, -0.7897207, 2.552853, 0, 0, 1, 1, 1,
0.4955192, -1.662451, 2.58161, 1, 0, 0, 1, 1,
0.505745, 0.7862079, 1.307189, 1, 0, 0, 1, 1,
0.5072649, -1.42703, 3.024112, 1, 0, 0, 1, 1,
0.5154438, 0.4201636, -0.5831713, 1, 0, 0, 1, 1,
0.5227883, 0.2051816, 1.254882, 1, 0, 0, 1, 1,
0.5230454, 0.6254036, 1.237786, 0, 0, 0, 1, 1,
0.525674, 1.273127, -1.612499, 0, 0, 0, 1, 1,
0.5268748, 0.6528616, -0.4267355, 0, 0, 0, 1, 1,
0.5271915, -1.019674, 3.042186, 0, 0, 0, 1, 1,
0.5308745, -0.1483705, 1.994529, 0, 0, 0, 1, 1,
0.5344895, 0.7279749, 1.408758, 0, 0, 0, 1, 1,
0.5348796, 0.4092594, 0.03497132, 0, 0, 0, 1, 1,
0.537725, -0.6352385, 1.043143, 1, 1, 1, 1, 1,
0.5395311, 1.446677, -0.2056494, 1, 1, 1, 1, 1,
0.5455325, -0.1925677, 3.394042, 1, 1, 1, 1, 1,
0.5532738, 0.5662606, 1.262474, 1, 1, 1, 1, 1,
0.5540729, 0.6388237, 1.560741, 1, 1, 1, 1, 1,
0.5562584, 0.07787138, 0.8316717, 1, 1, 1, 1, 1,
0.5576122, 0.3904174, 0.3840729, 1, 1, 1, 1, 1,
0.5591754, 0.7328675, -0.8118266, 1, 1, 1, 1, 1,
0.5604658, 2.724405, 1.657409, 1, 1, 1, 1, 1,
0.5612788, 1.146568, 0.5396857, 1, 1, 1, 1, 1,
0.5695838, 0.2032094, 0.7452986, 1, 1, 1, 1, 1,
0.5708564, 0.06657751, 1.293024, 1, 1, 1, 1, 1,
0.5733105, -1.273661, 3.078195, 1, 1, 1, 1, 1,
0.584398, -0.4770485, 1.185322, 1, 1, 1, 1, 1,
0.592568, -0.4492162, 3.648813, 1, 1, 1, 1, 1,
0.594043, 0.08418725, 0.401643, 0, 0, 1, 1, 1,
0.5968713, -1.073518, 1.952708, 1, 0, 0, 1, 1,
0.5972855, 0.2153825, 1.34433, 1, 0, 0, 1, 1,
0.6118529, 0.04990781, 1.581636, 1, 0, 0, 1, 1,
0.6125813, -0.331297, 2.23756, 1, 0, 0, 1, 1,
0.6141525, 0.7928364, 1.605233, 1, 0, 0, 1, 1,
0.6149198, -0.09811167, 3.910543, 0, 0, 0, 1, 1,
0.6168333, 1.64023, 2.035655, 0, 0, 0, 1, 1,
0.6178637, -1.065375, 3.52336, 0, 0, 0, 1, 1,
0.6213517, -0.1796623, 0.09073479, 0, 0, 0, 1, 1,
0.6263047, -1.353589, 3.684692, 0, 0, 0, 1, 1,
0.6286525, -0.05715644, 1.486024, 0, 0, 0, 1, 1,
0.6338378, -0.06469779, 2.35731, 0, 0, 0, 1, 1,
0.6378106, -1.220591, 4.212054, 1, 1, 1, 1, 1,
0.6387506, -1.334159, 3.434901, 1, 1, 1, 1, 1,
0.6399323, 0.4114503, 0.4161326, 1, 1, 1, 1, 1,
0.6401738, 0.8634964, -0.006974235, 1, 1, 1, 1, 1,
0.6463398, 0.3044974, -0.2423831, 1, 1, 1, 1, 1,
0.6468716, -0.4205731, 1.586203, 1, 1, 1, 1, 1,
0.6470093, 0.1030041, 1.07321, 1, 1, 1, 1, 1,
0.6473467, 0.1620111, 1.624812, 1, 1, 1, 1, 1,
0.6624516, 0.2707404, 1.342702, 1, 1, 1, 1, 1,
0.6647992, -0.1075629, 1.364792, 1, 1, 1, 1, 1,
0.6659114, 2.345723, -0.3441977, 1, 1, 1, 1, 1,
0.6718623, -0.7353567, 2.901213, 1, 1, 1, 1, 1,
0.6736996, -1.533199, 0.6627969, 1, 1, 1, 1, 1,
0.6750966, -0.1309172, 2.174849, 1, 1, 1, 1, 1,
0.6809494, 0.4937448, -0.8407557, 1, 1, 1, 1, 1,
0.6820937, 1.216006, 0.3430937, 0, 0, 1, 1, 1,
0.6877925, 1.743319, 0.5383912, 1, 0, 0, 1, 1,
0.6905283, -0.5764101, 2.189639, 1, 0, 0, 1, 1,
0.6908058, 0.7171283, -2.210718, 1, 0, 0, 1, 1,
0.6921694, -0.7865553, 3.561874, 1, 0, 0, 1, 1,
0.6953489, 1.143191, 2.066975, 1, 0, 0, 1, 1,
0.6979755, 0.738041, 0.3615734, 0, 0, 0, 1, 1,
0.7146391, 0.1470304, 0.5093955, 0, 0, 0, 1, 1,
0.7200869, -0.3344582, 1.879912, 0, 0, 0, 1, 1,
0.7245499, 1.832015, -0.1433264, 0, 0, 0, 1, 1,
0.7296906, 0.4838683, 0.09261812, 0, 0, 0, 1, 1,
0.7298787, -0.7838689, 3.882342, 0, 0, 0, 1, 1,
0.7335916, 0.03006097, 0.5316297, 0, 0, 0, 1, 1,
0.7346809, 0.3902954, 0.612151, 1, 1, 1, 1, 1,
0.7357054, -1.715771, 0.8449185, 1, 1, 1, 1, 1,
0.7395915, 0.1129351, 3.540142, 1, 1, 1, 1, 1,
0.749387, -2.008401, 3.019645, 1, 1, 1, 1, 1,
0.7517253, 0.3105725, 1.219163, 1, 1, 1, 1, 1,
0.7537799, 1.160614, -0.394486, 1, 1, 1, 1, 1,
0.7562359, 2.067852, 0.3990617, 1, 1, 1, 1, 1,
0.7703989, -2.909005, 0.9605808, 1, 1, 1, 1, 1,
0.7719302, 0.1247355, 1.122431, 1, 1, 1, 1, 1,
0.7723767, -0.3067021, 0.6310949, 1, 1, 1, 1, 1,
0.7785985, -1.429178, 3.137841, 1, 1, 1, 1, 1,
0.7834725, -0.02939898, 0.4260285, 1, 1, 1, 1, 1,
0.7861047, 1.539585, 0.9578407, 1, 1, 1, 1, 1,
0.7868742, -0.1737912, 3.427433, 1, 1, 1, 1, 1,
0.7921124, -1.357663, 1.368326, 1, 1, 1, 1, 1,
0.7925538, 0.2193437, 1.135773, 0, 0, 1, 1, 1,
0.7925985, 0.06215696, 0.8324594, 1, 0, 0, 1, 1,
0.795265, 1.535134, 1.29397, 1, 0, 0, 1, 1,
0.8010899, -0.3552046, 1.548088, 1, 0, 0, 1, 1,
0.8030466, -0.3685113, 0.6830414, 1, 0, 0, 1, 1,
0.8088807, -1.03471, 3.642006, 1, 0, 0, 1, 1,
0.8089318, 1.842425, 2.250546, 0, 0, 0, 1, 1,
0.8208284, 0.08601751, 1.162235, 0, 0, 0, 1, 1,
0.8222359, -0.2741322, 3.005599, 0, 0, 0, 1, 1,
0.8257368, 0.1492935, 1.849284, 0, 0, 0, 1, 1,
0.8260897, -0.03168824, 2.637336, 0, 0, 0, 1, 1,
0.8286434, -1.153427, 4.864642, 0, 0, 0, 1, 1,
0.8290679, 0.2523212, 3.929943, 0, 0, 0, 1, 1,
0.8313656, -0.9968095, 4.06958, 1, 1, 1, 1, 1,
0.8333114, -1.311478, 3.49629, 1, 1, 1, 1, 1,
0.8334019, 1.655453, 0.08454644, 1, 1, 1, 1, 1,
0.8385456, -0.3249622, 0.6491309, 1, 1, 1, 1, 1,
0.8412759, -0.9093915, 1.982444, 1, 1, 1, 1, 1,
0.8427043, 0.8684044, 1.301648, 1, 1, 1, 1, 1,
0.8537982, 0.5879233, 0.4314066, 1, 1, 1, 1, 1,
0.8549178, -1.192286, 2.781471, 1, 1, 1, 1, 1,
0.8566684, 0.1364823, 2.2481, 1, 1, 1, 1, 1,
0.859355, 1.267954, 0.6163253, 1, 1, 1, 1, 1,
0.863526, -0.3695978, 3.457718, 1, 1, 1, 1, 1,
0.8693352, -0.5815259, 2.764691, 1, 1, 1, 1, 1,
0.8717874, -0.9472415, 2.252251, 1, 1, 1, 1, 1,
0.8770884, -1.617075, 3.438046, 1, 1, 1, 1, 1,
0.8779871, -0.1782613, 1.260786, 1, 1, 1, 1, 1,
0.8788478, -1.412802, 2.961756, 0, 0, 1, 1, 1,
0.8795751, -1.164237, 1.792104, 1, 0, 0, 1, 1,
0.8813866, 0.4333918, 0.9872524, 1, 0, 0, 1, 1,
0.8819991, -3.20082, 1.481389, 1, 0, 0, 1, 1,
0.8893823, -0.2396262, 1.630811, 1, 0, 0, 1, 1,
0.8905888, -0.9809078, 3.394895, 1, 0, 0, 1, 1,
0.9008263, 0.2659414, 1.064538, 0, 0, 0, 1, 1,
0.9025244, -1.821824, 0.8697528, 0, 0, 0, 1, 1,
0.9058883, 1.212925, 1.320328, 0, 0, 0, 1, 1,
0.9088023, -0.7051141, 1.755227, 0, 0, 0, 1, 1,
0.910486, -0.2398097, 2.03486, 0, 0, 0, 1, 1,
0.9108004, 0.9367141, 0.7964134, 0, 0, 0, 1, 1,
0.9161599, 0.07924549, 2.179483, 0, 0, 0, 1, 1,
0.9177895, 0.8183507, 1.350986, 1, 1, 1, 1, 1,
0.9199199, -1.187108, 2.438113, 1, 1, 1, 1, 1,
0.9206299, -0.9533617, 2.3033, 1, 1, 1, 1, 1,
0.9208468, -0.4894222, 1.339938, 1, 1, 1, 1, 1,
0.9209159, 0.5818647, 0.9498953, 1, 1, 1, 1, 1,
0.9283364, -0.559702, 0.1184349, 1, 1, 1, 1, 1,
0.9374923, -1.019218, 1.576006, 1, 1, 1, 1, 1,
0.9407383, -1.439705, 3.793063, 1, 1, 1, 1, 1,
0.9488209, -0.7908338, 2.649148, 1, 1, 1, 1, 1,
0.9495627, -0.491409, 2.622823, 1, 1, 1, 1, 1,
0.9534147, -1.777186, 2.247446, 1, 1, 1, 1, 1,
0.9544973, 0.5007998, 0.9991504, 1, 1, 1, 1, 1,
0.9582637, -0.5095214, 2.699439, 1, 1, 1, 1, 1,
0.9613714, 0.751691, 0.06412589, 1, 1, 1, 1, 1,
0.9630954, 0.7456858, 2.639533, 1, 1, 1, 1, 1,
0.9667672, 1.546476, 0.1826617, 0, 0, 1, 1, 1,
0.9725917, -0.3600557, 3.241532, 1, 0, 0, 1, 1,
0.9743279, 0.304305, 2.026426, 1, 0, 0, 1, 1,
0.9805092, -2.17622, 2.503658, 1, 0, 0, 1, 1,
0.9899434, -0.2112768, 1.980866, 1, 0, 0, 1, 1,
0.9910002, 0.7302614, 1.929858, 1, 0, 0, 1, 1,
0.9992248, -0.05366779, 1.740925, 0, 0, 0, 1, 1,
1.003579, -1.493578, 1.465357, 0, 0, 0, 1, 1,
1.012092, 0.1667082, -0.05965027, 0, 0, 0, 1, 1,
1.016392, -2.267392, 3.247079, 0, 0, 0, 1, 1,
1.01895, -1.565181, 0.7573919, 0, 0, 0, 1, 1,
1.023219, 0.2755379, 0.7805009, 0, 0, 0, 1, 1,
1.028785, 0.4191399, 2.063324, 0, 0, 0, 1, 1,
1.030967, -0.297625, -0.242592, 1, 1, 1, 1, 1,
1.039831, -2.184057, 0.6603147, 1, 1, 1, 1, 1,
1.047106, -0.1244069, 1.656157, 1, 1, 1, 1, 1,
1.048723, 0.115393, 3.128003, 1, 1, 1, 1, 1,
1.051723, -1.098223, 2.482846, 1, 1, 1, 1, 1,
1.056549, -0.2925877, 1.739137, 1, 1, 1, 1, 1,
1.057783, 0.2655175, 1.994146, 1, 1, 1, 1, 1,
1.070189, 2.045692, 0.5239969, 1, 1, 1, 1, 1,
1.072223, 0.5635521, 0.7663694, 1, 1, 1, 1, 1,
1.074993, -1.963521, 1.488401, 1, 1, 1, 1, 1,
1.075923, 0.352733, 0.8383937, 1, 1, 1, 1, 1,
1.077209, 0.03138418, -0.6550341, 1, 1, 1, 1, 1,
1.079417, -1.101797, 1.638708, 1, 1, 1, 1, 1,
1.084198, -0.09198973, 2.564965, 1, 1, 1, 1, 1,
1.088623, -1.175867, 1.383869, 1, 1, 1, 1, 1,
1.093028, 1.587762, 0.5449976, 0, 0, 1, 1, 1,
1.093405, -0.6318871, 4.402326, 1, 0, 0, 1, 1,
1.095387, 1.000365, 1.101721, 1, 0, 0, 1, 1,
1.099784, 0.6696525, 1.278815, 1, 0, 0, 1, 1,
1.100139, -0.2956578, 2.574339, 1, 0, 0, 1, 1,
1.103233, 1.552132, -0.8025473, 1, 0, 0, 1, 1,
1.109666, -0.7993375, 2.638239, 0, 0, 0, 1, 1,
1.11908, 1.139855, 0.9528279, 0, 0, 0, 1, 1,
1.124712, 0.3425683, 1.146148, 0, 0, 0, 1, 1,
1.128109, -0.8875201, 1.74421, 0, 0, 0, 1, 1,
1.136631, 0.386793, -0.3819204, 0, 0, 0, 1, 1,
1.144209, 1.870232, -0.5418256, 0, 0, 0, 1, 1,
1.147507, -0.2463467, 1.385792, 0, 0, 0, 1, 1,
1.15412, 0.4283943, 1.523857, 1, 1, 1, 1, 1,
1.167992, 0.7415794, 1.377584, 1, 1, 1, 1, 1,
1.172491, 0.2453452, 2.150223, 1, 1, 1, 1, 1,
1.182197, -0.864892, 2.443003, 1, 1, 1, 1, 1,
1.196138, -0.2105104, 1.500348, 1, 1, 1, 1, 1,
1.200198, -1.230696, 0.9996099, 1, 1, 1, 1, 1,
1.201256, 1.522826, 1.410689, 1, 1, 1, 1, 1,
1.203556, -0.492404, 1.564439, 1, 1, 1, 1, 1,
1.206789, 1.587245, -1.526216, 1, 1, 1, 1, 1,
1.213581, -0.655366, 2.920088, 1, 1, 1, 1, 1,
1.217958, -0.5876442, 1.133939, 1, 1, 1, 1, 1,
1.226276, -0.5062858, 2.420541, 1, 1, 1, 1, 1,
1.239734, 1.118583, 1.558604, 1, 1, 1, 1, 1,
1.245611, 1.069282, 1.836668, 1, 1, 1, 1, 1,
1.254778, 0.3285045, 1.216405, 1, 1, 1, 1, 1,
1.264469, -0.8634486, 4.85018, 0, 0, 1, 1, 1,
1.269234, -0.9213272, 2.772068, 1, 0, 0, 1, 1,
1.272903, 0.4148272, 2.536522, 1, 0, 0, 1, 1,
1.272978, 0.5006189, 1.566298, 1, 0, 0, 1, 1,
1.279467, 0.6012712, 1.664499, 1, 0, 0, 1, 1,
1.286917, -0.3468393, 2.093467, 1, 0, 0, 1, 1,
1.293589, 0.09528113, 2.447712, 0, 0, 0, 1, 1,
1.298111, 0.54854, 1.561478, 0, 0, 0, 1, 1,
1.298128, 1.584407, 1.165953, 0, 0, 0, 1, 1,
1.315469, -0.1220495, 1.797771, 0, 0, 0, 1, 1,
1.324743, -0.2605066, 0.4923023, 0, 0, 0, 1, 1,
1.325794, -0.1913337, 2.323736, 0, 0, 0, 1, 1,
1.326848, 1.15059, 1.7205, 0, 0, 0, 1, 1,
1.330563, 0.881925, 0.1135086, 1, 1, 1, 1, 1,
1.336306, 0.4817387, 0.8357805, 1, 1, 1, 1, 1,
1.341707, -1.648327, 0.3484812, 1, 1, 1, 1, 1,
1.342679, -1.336118, 2.491272, 1, 1, 1, 1, 1,
1.343199, -1.005489, 1.129797, 1, 1, 1, 1, 1,
1.345289, 1.103989, 0.4759304, 1, 1, 1, 1, 1,
1.352659, -1.777333, 2.356088, 1, 1, 1, 1, 1,
1.357668, -1.268531, 2.464516, 1, 1, 1, 1, 1,
1.375417, -0.1770788, 2.81371, 1, 1, 1, 1, 1,
1.383587, 1.083189, 0.4203884, 1, 1, 1, 1, 1,
1.389731, -1.04233, 2.571707, 1, 1, 1, 1, 1,
1.399861, -0.4047907, 1.562724, 1, 1, 1, 1, 1,
1.406799, -1.399738, 2.362114, 1, 1, 1, 1, 1,
1.408331, 1.300357, 0.5807792, 1, 1, 1, 1, 1,
1.420688, 1.01007, 1.576586, 1, 1, 1, 1, 1,
1.421896, -1.126624, 3.497562, 0, 0, 1, 1, 1,
1.426453, -0.2320391, 2.13305, 1, 0, 0, 1, 1,
1.427476, -2.121794, 2.848139, 1, 0, 0, 1, 1,
1.429569, -0.6433775, 1.014998, 1, 0, 0, 1, 1,
1.431569, 0.9725688, 0.8232999, 1, 0, 0, 1, 1,
1.433438, 0.8740964, 1.740044, 1, 0, 0, 1, 1,
1.434069, 0.6333904, 1.410162, 0, 0, 0, 1, 1,
1.443188, 0.1566092, 1.518759, 0, 0, 0, 1, 1,
1.447606, -1.239344, 1.529771, 0, 0, 0, 1, 1,
1.456437, -0.4048809, 0.2292063, 0, 0, 0, 1, 1,
1.463817, -1.147305, 0.4935369, 0, 0, 0, 1, 1,
1.468846, -1.906456, 3.503478, 0, 0, 0, 1, 1,
1.47384, 0.5167522, 2.535188, 0, 0, 0, 1, 1,
1.474181, 0.1367843, 0.883312, 1, 1, 1, 1, 1,
1.477625, 1.261013, 3.535432, 1, 1, 1, 1, 1,
1.484581, -0.08720043, 0.7090995, 1, 1, 1, 1, 1,
1.528359, -0.8906499, 2.262862, 1, 1, 1, 1, 1,
1.53073, 0.06282368, 1.704393, 1, 1, 1, 1, 1,
1.536591, 0.6305814, 0.08169123, 1, 1, 1, 1, 1,
1.548359, -0.2604328, 0.186894, 1, 1, 1, 1, 1,
1.561844, -0.4479422, 0.8105737, 1, 1, 1, 1, 1,
1.56516, -1.058502, 1.837422, 1, 1, 1, 1, 1,
1.572709, -0.5068784, 3.180543, 1, 1, 1, 1, 1,
1.584454, -0.1260219, 2.089868, 1, 1, 1, 1, 1,
1.595471, -0.5729532, 1.335059, 1, 1, 1, 1, 1,
1.597696, -0.72254, 2.440413, 1, 1, 1, 1, 1,
1.608877, 1.444879, 2.039164, 1, 1, 1, 1, 1,
1.616629, 0.3998792, 1.48139, 1, 1, 1, 1, 1,
1.623615, 0.6876968, 2.232233, 0, 0, 1, 1, 1,
1.652517, -1.220683, 3.154346, 1, 0, 0, 1, 1,
1.665555, 0.4033879, 0.503331, 1, 0, 0, 1, 1,
1.693344, 0.6039804, 0.3545005, 1, 0, 0, 1, 1,
1.708855, 0.4740012, 2.148867, 1, 0, 0, 1, 1,
1.729319, 0.3593031, 1.715559, 1, 0, 0, 1, 1,
1.746875, 0.5393863, 0.9416935, 0, 0, 0, 1, 1,
1.760298, 1.900254, 1.954158, 0, 0, 0, 1, 1,
1.761124, -0.2360511, 2.771504, 0, 0, 0, 1, 1,
1.775499, -1.291054, 0.1174767, 0, 0, 0, 1, 1,
1.781585, -0.6455588, 1.286102, 0, 0, 0, 1, 1,
1.782777, 0.0004308661, 2.691294, 0, 0, 0, 1, 1,
1.785571, -0.9589403, 0.8991145, 0, 0, 0, 1, 1,
1.804935, 0.7887285, 1.588424, 1, 1, 1, 1, 1,
1.817354, -1.106704, 2.629901, 1, 1, 1, 1, 1,
1.86393, 0.05005484, 1.532065, 1, 1, 1, 1, 1,
1.884828, 0.7368826, 0.1412075, 1, 1, 1, 1, 1,
1.891367, 1.407245, 1.621152, 1, 1, 1, 1, 1,
1.899326, -1.106009, 1.190613, 1, 1, 1, 1, 1,
1.905607, -1.416979, 2.149348, 1, 1, 1, 1, 1,
1.906134, -0.871041, -0.02403543, 1, 1, 1, 1, 1,
1.937844, 0.3047918, 0.203926, 1, 1, 1, 1, 1,
1.949333, 0.5581717, 0.7493871, 1, 1, 1, 1, 1,
1.97198, -2.169703, 4.509425, 1, 1, 1, 1, 1,
1.972973, -1.166464, 1.962108, 1, 1, 1, 1, 1,
1.997694, 1.459823, 0.3550674, 1, 1, 1, 1, 1,
2.002729, 0.1433769, 0.1482607, 1, 1, 1, 1, 1,
2.007066, 0.3883551, 1.756515, 1, 1, 1, 1, 1,
2.028055, -0.4936411, 0.3358891, 0, 0, 1, 1, 1,
2.028265, -0.5086991, 0.4568211, 1, 0, 0, 1, 1,
2.037868, -8.561537e-05, 2.063135, 1, 0, 0, 1, 1,
2.09763, 1.659964, 0.8933126, 1, 0, 0, 1, 1,
2.098953, -0.2410109, 2.07392, 1, 0, 0, 1, 1,
2.103781, -0.606882, 1.841601, 1, 0, 0, 1, 1,
2.121513, -0.006626855, 0.8693735, 0, 0, 0, 1, 1,
2.212923, 0.05995673, 0.06625651, 0, 0, 0, 1, 1,
2.240893, 0.9006796, 1.383567, 0, 0, 0, 1, 1,
2.249141, 1.709885, 2.260536, 0, 0, 0, 1, 1,
2.254103, 0.8510547, 0.5910041, 0, 0, 0, 1, 1,
2.257366, 0.3086411, 0.6855466, 0, 0, 0, 1, 1,
2.304177, -0.216391, 1.993088, 0, 0, 0, 1, 1,
2.311236, 0.2027799, 1.86677, 1, 1, 1, 1, 1,
2.431813, 0.2808989, 2.042834, 1, 1, 1, 1, 1,
2.44235, -0.2511179, 2.822036, 1, 1, 1, 1, 1,
2.444805, -1.46726, 3.373072, 1, 1, 1, 1, 1,
2.595171, -0.6618461, 0.08504458, 1, 1, 1, 1, 1,
2.667624, 0.2037327, 2.898541, 1, 1, 1, 1, 1,
2.733438, 0.4895017, 3.727528, 1, 1, 1, 1, 1
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
var radius = 9.364029;
var distance = 32.89075;
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
mvMatrix.translate( 0.1896806, 0.09324598, 0.103543 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89075);
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
