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
-2.726021, 2.110123, -0.6349403, 1, 0, 0, 1,
-2.565985, 0.7446123, 0.3362835, 1, 0.007843138, 0, 1,
-2.534342, 0.004627118, -1.111119, 1, 0.01176471, 0, 1,
-2.531939, -0.7586324, -0.866298, 1, 0.01960784, 0, 1,
-2.462322, 1.677413, -0.7737496, 1, 0.02352941, 0, 1,
-2.411526, 1.330386, -2.076048, 1, 0.03137255, 0, 1,
-2.381281, -0.2881364, -0.07194898, 1, 0.03529412, 0, 1,
-2.367216, -0.08016197, -0.1988772, 1, 0.04313726, 0, 1,
-2.294681, 1.195887, 0.6176415, 1, 0.04705882, 0, 1,
-2.290841, 1.971454, -0.3509715, 1, 0.05490196, 0, 1,
-2.26474, -0.3642082, -3.0756, 1, 0.05882353, 0, 1,
-2.260146, -0.8084828, -3.100216, 1, 0.06666667, 0, 1,
-2.247925, 0.5464945, -0.5551733, 1, 0.07058824, 0, 1,
-2.229849, 0.2949705, -0.8057875, 1, 0.07843138, 0, 1,
-2.179844, -0.05302329, -1.481871, 1, 0.08235294, 0, 1,
-2.164222, 0.4361317, 0.03104611, 1, 0.09019608, 0, 1,
-2.093778, -1.338154, -2.869771, 1, 0.09411765, 0, 1,
-2.06652, 1.088021, -1.575903, 1, 0.1019608, 0, 1,
-2.044664, -0.0794708, 0.76767, 1, 0.1098039, 0, 1,
-2.044615, 0.6623989, -3.922131, 1, 0.1137255, 0, 1,
-2.044243, 0.2757472, -2.26708, 1, 0.1215686, 0, 1,
-2.043174, 1.176445, -0.6552163, 1, 0.1254902, 0, 1,
-2.026911, -1.101574, -1.997948, 1, 0.1333333, 0, 1,
-2.011953, 1.045488, -0.2692675, 1, 0.1372549, 0, 1,
-1.994702, 0.6845915, -1.608163, 1, 0.145098, 0, 1,
-1.976339, 2.34567, -1.361366, 1, 0.1490196, 0, 1,
-1.947067, 1.519186, -1.566073, 1, 0.1568628, 0, 1,
-1.94407, 0.693024, -1.927033, 1, 0.1607843, 0, 1,
-1.888503, -0.2397264, 0.6738673, 1, 0.1686275, 0, 1,
-1.881367, -0.9329716, -0.9704553, 1, 0.172549, 0, 1,
-1.858636, 0.8871743, -1.10929, 1, 0.1803922, 0, 1,
-1.854515, 1.508821, -1.558365, 1, 0.1843137, 0, 1,
-1.842387, 0.3730575, -1.38713, 1, 0.1921569, 0, 1,
-1.842263, -0.8979682, -3.227964, 1, 0.1960784, 0, 1,
-1.836533, -0.4840285, -0.2923266, 1, 0.2039216, 0, 1,
-1.835801, 0.1186258, -2.016833, 1, 0.2117647, 0, 1,
-1.831729, 0.8532749, -0.4101297, 1, 0.2156863, 0, 1,
-1.826482, -0.826279, -2.284837, 1, 0.2235294, 0, 1,
-1.825929, -0.6931188, -2.142955, 1, 0.227451, 0, 1,
-1.815197, -1.670543, -3.330407, 1, 0.2352941, 0, 1,
-1.785715, 0.6795303, -0.5493718, 1, 0.2392157, 0, 1,
-1.747317, -1.299111, -2.27754, 1, 0.2470588, 0, 1,
-1.740809, 0.06192343, -0.895164, 1, 0.2509804, 0, 1,
-1.721787, 0.07305284, 0.902888, 1, 0.2588235, 0, 1,
-1.72089, -1.082939, -4.053927, 1, 0.2627451, 0, 1,
-1.710551, 2.167715, -1.581977, 1, 0.2705882, 0, 1,
-1.672701, -0.2433464, -1.723994, 1, 0.2745098, 0, 1,
-1.657227, 0.6973475, -1.59149, 1, 0.282353, 0, 1,
-1.656357, 1.079754, -0.6318979, 1, 0.2862745, 0, 1,
-1.640898, 0.009803723, -1.414017, 1, 0.2941177, 0, 1,
-1.63654, -0.9667934, -3.641962, 1, 0.3019608, 0, 1,
-1.629156, -0.6806083, -1.936697, 1, 0.3058824, 0, 1,
-1.626457, 0.2447885, -0.6912823, 1, 0.3137255, 0, 1,
-1.621682, 0.02510715, -1.339418, 1, 0.3176471, 0, 1,
-1.617441, -0.5866734, -0.3647063, 1, 0.3254902, 0, 1,
-1.617348, -0.04265494, -1.187081, 1, 0.3294118, 0, 1,
-1.610451, -0.7059067, -3.913168, 1, 0.3372549, 0, 1,
-1.601718, -0.7283822, -1.963294, 1, 0.3411765, 0, 1,
-1.594463, 1.380619, -1.871546, 1, 0.3490196, 0, 1,
-1.589144, -0.3047151, -1.957081, 1, 0.3529412, 0, 1,
-1.552854, 0.3613276, -2.826783, 1, 0.3607843, 0, 1,
-1.546459, -1.404443, -1.918961, 1, 0.3647059, 0, 1,
-1.525039, -1.979603, -1.675331, 1, 0.372549, 0, 1,
-1.522296, -1.171841, -3.68146, 1, 0.3764706, 0, 1,
-1.496914, 1.025926, -1.54879, 1, 0.3843137, 0, 1,
-1.491702, 1.586433, 0.6461276, 1, 0.3882353, 0, 1,
-1.482901, 2.300934, 0.1028874, 1, 0.3960784, 0, 1,
-1.480737, -0.8861225, -3.194697, 1, 0.4039216, 0, 1,
-1.477893, 1.492252, -0.2132412, 1, 0.4078431, 0, 1,
-1.471988, 2.598722, -0.8042463, 1, 0.4156863, 0, 1,
-1.461836, -0.0461552, -3.181675, 1, 0.4196078, 0, 1,
-1.457544, -0.03873951, 0.008436471, 1, 0.427451, 0, 1,
-1.446627, -0.6406398, -1.259173, 1, 0.4313726, 0, 1,
-1.438975, -0.757518, -0.1857048, 1, 0.4392157, 0, 1,
-1.433516, -1.137455, -3.403563, 1, 0.4431373, 0, 1,
-1.430707, -0.0571584, -0.8067211, 1, 0.4509804, 0, 1,
-1.410897, 0.1471834, 1.101304, 1, 0.454902, 0, 1,
-1.408747, 0.1326864, -2.056839, 1, 0.4627451, 0, 1,
-1.407524, 0.9407713, -0.09409605, 1, 0.4666667, 0, 1,
-1.393642, 0.9379354, -2.702377, 1, 0.4745098, 0, 1,
-1.389152, -1.321831, -2.880481, 1, 0.4784314, 0, 1,
-1.388584, 1.805326, -1.549598, 1, 0.4862745, 0, 1,
-1.384062, -0.9996641, -2.650324, 1, 0.4901961, 0, 1,
-1.37436, 0.01532369, -0.6470228, 1, 0.4980392, 0, 1,
-1.357042, -0.03680528, -2.406542, 1, 0.5058824, 0, 1,
-1.356839, 2.327358, 0.9939616, 1, 0.509804, 0, 1,
-1.354681, 0.915374, -1.686906, 1, 0.5176471, 0, 1,
-1.352392, -2.086159, -1.089524, 1, 0.5215687, 0, 1,
-1.352287, -0.3535985, -1.523871, 1, 0.5294118, 0, 1,
-1.350833, -0.7842889, -3.715171, 1, 0.5333334, 0, 1,
-1.347778, 1.111557, -0.9775587, 1, 0.5411765, 0, 1,
-1.347509, -1.081431, -3.898649, 1, 0.5450981, 0, 1,
-1.342734, 0.6201246, -1.271482, 1, 0.5529412, 0, 1,
-1.33331, 0.792953, -1.604792, 1, 0.5568628, 0, 1,
-1.326739, 0.1836383, -1.106699, 1, 0.5647059, 0, 1,
-1.312664, 0.4754258, 0.1398004, 1, 0.5686275, 0, 1,
-1.308687, 1.229935, -0.01612077, 1, 0.5764706, 0, 1,
-1.307828, 1.881413, 1.607667, 1, 0.5803922, 0, 1,
-1.295297, -0.970158, -2.835452, 1, 0.5882353, 0, 1,
-1.287434, 0.3346657, -2.09516, 1, 0.5921569, 0, 1,
-1.287252, -0.5653313, -2.950886, 1, 0.6, 0, 1,
-1.2802, -2.149029, -2.396346, 1, 0.6078432, 0, 1,
-1.273007, -2.079544, -1.566427, 1, 0.6117647, 0, 1,
-1.272447, -1.657817, -2.293087, 1, 0.6196079, 0, 1,
-1.264863, -0.07381872, 0.1058447, 1, 0.6235294, 0, 1,
-1.259254, -0.1394155, -2.209195, 1, 0.6313726, 0, 1,
-1.249786, -1.840204, -1.598184, 1, 0.6352941, 0, 1,
-1.248939, -0.683, 0.112767, 1, 0.6431373, 0, 1,
-1.248583, 0.6468417, 1.100153, 1, 0.6470588, 0, 1,
-1.245159, 0.422768, -0.7209139, 1, 0.654902, 0, 1,
-1.245049, -0.8415962, -3.101655, 1, 0.6588235, 0, 1,
-1.239879, 0.3766519, -1.678321, 1, 0.6666667, 0, 1,
-1.228426, -0.3260916, -1.83545, 1, 0.6705883, 0, 1,
-1.227809, 0.3815837, -0.5815768, 1, 0.6784314, 0, 1,
-1.227715, -0.2419511, -1.799718, 1, 0.682353, 0, 1,
-1.22363, -0.5075603, -3.161261, 1, 0.6901961, 0, 1,
-1.217903, -0.1066196, -1.678717, 1, 0.6941177, 0, 1,
-1.213413, -1.00433, -2.132144, 1, 0.7019608, 0, 1,
-1.205652, 0.6078967, -2.165515, 1, 0.7098039, 0, 1,
-1.205169, 0.2205558, -1.70883, 1, 0.7137255, 0, 1,
-1.199819, -1.274634, -1.157989, 1, 0.7215686, 0, 1,
-1.198263, 0.9354852, 0.473832, 1, 0.7254902, 0, 1,
-1.196273, 1.939704, -0.9477926, 1, 0.7333333, 0, 1,
-1.189959, -1.217534, -3.431851, 1, 0.7372549, 0, 1,
-1.185612, 1.491807, 0.3197985, 1, 0.7450981, 0, 1,
-1.181334, -1.159133, -0.4622675, 1, 0.7490196, 0, 1,
-1.179338, 0.705155, 0.5036699, 1, 0.7568628, 0, 1,
-1.17468, 0.373235, -2.722213, 1, 0.7607843, 0, 1,
-1.173313, 0.3502453, -0.7899715, 1, 0.7686275, 0, 1,
-1.172605, 0.3498489, -0.9968311, 1, 0.772549, 0, 1,
-1.172136, 0.1155383, -1.557956, 1, 0.7803922, 0, 1,
-1.162868, 1.390713, -0.9955034, 1, 0.7843137, 0, 1,
-1.15953, -1.114966, -3.789271, 1, 0.7921569, 0, 1,
-1.156936, 0.08694758, -0.7440847, 1, 0.7960784, 0, 1,
-1.134642, 0.4951365, 0.2053924, 1, 0.8039216, 0, 1,
-1.12244, 0.4758942, -2.757595, 1, 0.8117647, 0, 1,
-1.120755, 1.388324, -2.064666, 1, 0.8156863, 0, 1,
-1.106335, 0.4150478, -1.665214, 1, 0.8235294, 0, 1,
-1.105254, 1.32858, 0.3725705, 1, 0.827451, 0, 1,
-1.098277, 1.958857, -0.5115044, 1, 0.8352941, 0, 1,
-1.094268, -0.6226062, -3.329522, 1, 0.8392157, 0, 1,
-1.093068, -1.517737, -1.945079, 1, 0.8470588, 0, 1,
-1.092805, 2.600713, -1.065726, 1, 0.8509804, 0, 1,
-1.087605, -2.054774, -2.050145, 1, 0.8588235, 0, 1,
-1.085805, 1.076753, -2.455757, 1, 0.8627451, 0, 1,
-1.076466, 1.074068, 0.07174553, 1, 0.8705882, 0, 1,
-1.072901, -3.034223, -1.815043, 1, 0.8745098, 0, 1,
-1.067996, 0.1983263, -2.575794, 1, 0.8823529, 0, 1,
-1.063828, 0.3157052, 0.4975721, 1, 0.8862745, 0, 1,
-1.061728, 1.133093, 0.5198871, 1, 0.8941177, 0, 1,
-1.060861, -1.604366, -2.478949, 1, 0.8980392, 0, 1,
-1.04858, 0.09502395, -1.385978, 1, 0.9058824, 0, 1,
-1.046914, -0.9787028, -3.22198, 1, 0.9137255, 0, 1,
-1.045393, -0.6428457, -2.66494, 1, 0.9176471, 0, 1,
-1.044232, 0.3848578, -0.8021467, 1, 0.9254902, 0, 1,
-1.042616, 0.562389, -0.6195489, 1, 0.9294118, 0, 1,
-1.040204, 0.2280193, -1.506719, 1, 0.9372549, 0, 1,
-1.032303, 0.2688394, -2.242273, 1, 0.9411765, 0, 1,
-1.022836, 0.523558, -1.777155, 1, 0.9490196, 0, 1,
-1.022801, 0.5231277, -0.1165358, 1, 0.9529412, 0, 1,
-1.018867, -0.1746314, -2.851058, 1, 0.9607843, 0, 1,
-1.016468, -2.138657, -1.820263, 1, 0.9647059, 0, 1,
-1.013302, 1.064225, 0.4548584, 1, 0.972549, 0, 1,
-1.008621, 0.7079338, 0.06900094, 1, 0.9764706, 0, 1,
-1.005769, -0.1237492, 0.3219068, 1, 0.9843137, 0, 1,
-1.002967, -0.6174991, 0.4522676, 1, 0.9882353, 0, 1,
-1.001823, 0.4317971, -0.5086622, 1, 0.9960784, 0, 1,
-1.000725, -0.72975, -2.356982, 0.9960784, 1, 0, 1,
-0.9998153, -0.900982, -2.453163, 0.9921569, 1, 0, 1,
-0.9989319, -0.8905376, -1.984501, 0.9843137, 1, 0, 1,
-0.9926255, -0.7030781, -1.095092, 0.9803922, 1, 0, 1,
-0.9917278, 0.08921397, -0.9250079, 0.972549, 1, 0, 1,
-0.9913879, -1.268596, -3.078532, 0.9686275, 1, 0, 1,
-0.9872565, 0.8810839, -0.2560381, 0.9607843, 1, 0, 1,
-0.9869878, -1.921409, -1.894267, 0.9568627, 1, 0, 1,
-0.9721826, 0.5344811, -1.714799, 0.9490196, 1, 0, 1,
-0.9671746, -0.6717188, -1.126123, 0.945098, 1, 0, 1,
-0.9659813, 0.4807376, -2.354836, 0.9372549, 1, 0, 1,
-0.9653214, 0.09624779, -0.6687094, 0.9333333, 1, 0, 1,
-0.9621521, 1.252128, -1.190646, 0.9254902, 1, 0, 1,
-0.960861, 0.9117206, -1.627433, 0.9215686, 1, 0, 1,
-0.9445392, -1.085751, -4.395702, 0.9137255, 1, 0, 1,
-0.942529, 0.6475788, -2.973625, 0.9098039, 1, 0, 1,
-0.9396573, -0.607136, -3.856533, 0.9019608, 1, 0, 1,
-0.9380519, -0.5609202, -2.589092, 0.8941177, 1, 0, 1,
-0.9289464, -2.227242, -2.384718, 0.8901961, 1, 0, 1,
-0.9283957, -0.4180951, -2.135363, 0.8823529, 1, 0, 1,
-0.9164656, -0.1288479, -0.9938004, 0.8784314, 1, 0, 1,
-0.9109942, -0.2834469, -1.473414, 0.8705882, 1, 0, 1,
-0.9078901, 1.123216, -1.598966, 0.8666667, 1, 0, 1,
-0.9072341, 0.06801303, -2.608707, 0.8588235, 1, 0, 1,
-0.9067784, -0.3534961, -1.690114, 0.854902, 1, 0, 1,
-0.9010473, -2.177075, -2.025628, 0.8470588, 1, 0, 1,
-0.8974399, 0.140405, -0.8295632, 0.8431373, 1, 0, 1,
-0.8831353, -1.625275, -2.263606, 0.8352941, 1, 0, 1,
-0.8785573, -1.721124, -3.357095, 0.8313726, 1, 0, 1,
-0.8781043, -1.289501, -4.003763, 0.8235294, 1, 0, 1,
-0.8754063, 0.7910419, 0.9601715, 0.8196079, 1, 0, 1,
-0.8730678, -0.4910507, -2.343584, 0.8117647, 1, 0, 1,
-0.8728162, 0.2371195, 0.6266285, 0.8078431, 1, 0, 1,
-0.8686836, -1.038149, -2.767607, 0.8, 1, 0, 1,
-0.862045, -0.5753278, -1.998018, 0.7921569, 1, 0, 1,
-0.8609995, -1.989641, -3.815012, 0.7882353, 1, 0, 1,
-0.860921, 1.552934, 1.397268, 0.7803922, 1, 0, 1,
-0.8563954, -1.32217, -2.291565, 0.7764706, 1, 0, 1,
-0.856095, 0.7522769, -0.6748306, 0.7686275, 1, 0, 1,
-0.8553506, 0.5694987, -0.9558943, 0.7647059, 1, 0, 1,
-0.8553066, 1.034023, -1.95058, 0.7568628, 1, 0, 1,
-0.8520027, -0.7965475, -2.121784, 0.7529412, 1, 0, 1,
-0.8518504, 1.721448, -1.325885, 0.7450981, 1, 0, 1,
-0.8430405, 1.030638, 0.3107879, 0.7411765, 1, 0, 1,
-0.8305803, 0.418101, 0.1735576, 0.7333333, 1, 0, 1,
-0.8294319, -1.454772, -2.609748, 0.7294118, 1, 0, 1,
-0.8241286, -3.202307, -2.923299, 0.7215686, 1, 0, 1,
-0.8213807, -0.008970711, -0.6203292, 0.7176471, 1, 0, 1,
-0.8208101, -1.131693, -4.298653, 0.7098039, 1, 0, 1,
-0.8192537, -1.056519, -1.722835, 0.7058824, 1, 0, 1,
-0.8192247, -0.7441521, -2.558006, 0.6980392, 1, 0, 1,
-0.8188704, 0.06560423, -0.65809, 0.6901961, 1, 0, 1,
-0.8055795, -0.4732828, -2.114249, 0.6862745, 1, 0, 1,
-0.8038534, 1.049466, -2.333344, 0.6784314, 1, 0, 1,
-0.8027269, -0.6558865, -1.111087, 0.6745098, 1, 0, 1,
-0.8019143, -0.845765, -2.813873, 0.6666667, 1, 0, 1,
-0.7809968, -0.04149681, -2.9103, 0.6627451, 1, 0, 1,
-0.7738833, 0.5954937, -0.1611488, 0.654902, 1, 0, 1,
-0.7655308, 0.731378, -1.690466, 0.6509804, 1, 0, 1,
-0.7582747, -0.09484518, -3.152847, 0.6431373, 1, 0, 1,
-0.7581614, -0.9645959, -3.06909, 0.6392157, 1, 0, 1,
-0.7524026, 0.6352405, -0.4929965, 0.6313726, 1, 0, 1,
-0.7522419, 1.336631, -0.01088979, 0.627451, 1, 0, 1,
-0.7469835, -0.5312223, -3.621537, 0.6196079, 1, 0, 1,
-0.7407476, -1.070808, -3.069235, 0.6156863, 1, 0, 1,
-0.739942, 1.427827, -0.1273559, 0.6078432, 1, 0, 1,
-0.7336187, 1.756383, -0.5241245, 0.6039216, 1, 0, 1,
-0.7274026, 0.684699, 0.09979151, 0.5960785, 1, 0, 1,
-0.7228116, -0.3042818, -0.2311777, 0.5882353, 1, 0, 1,
-0.7176771, -0.9445666, -2.054261, 0.5843138, 1, 0, 1,
-0.7167709, -2.430591, -1.118082, 0.5764706, 1, 0, 1,
-0.7160064, 0.2985609, -1.367648, 0.572549, 1, 0, 1,
-0.709994, 0.2952801, -2.260014, 0.5647059, 1, 0, 1,
-0.7099597, 1.820591, 0.09198848, 0.5607843, 1, 0, 1,
-0.7092002, -0.6160305, -0.4276605, 0.5529412, 1, 0, 1,
-0.7063199, 0.01101191, -0.9230047, 0.5490196, 1, 0, 1,
-0.7048764, -1.319909, -1.664089, 0.5411765, 1, 0, 1,
-0.7033461, -0.8506116, -3.075657, 0.5372549, 1, 0, 1,
-0.7017634, 1.190403, -1.388369, 0.5294118, 1, 0, 1,
-0.6970682, 1.277551, 0.2441366, 0.5254902, 1, 0, 1,
-0.6963717, 0.4220311, -2.240642, 0.5176471, 1, 0, 1,
-0.6946711, -0.1687678, -4.042065, 0.5137255, 1, 0, 1,
-0.6945027, 1.0174, 0.5453433, 0.5058824, 1, 0, 1,
-0.6935816, -0.447422, -2.917717, 0.5019608, 1, 0, 1,
-0.6881069, -1.214244, -3.20597, 0.4941176, 1, 0, 1,
-0.6862291, 1.825857, -0.1282182, 0.4862745, 1, 0, 1,
-0.6860019, -0.2545825, -1.286877, 0.4823529, 1, 0, 1,
-0.6819209, 1.037085, 1.0166, 0.4745098, 1, 0, 1,
-0.6788405, -1.913481, -2.446263, 0.4705882, 1, 0, 1,
-0.6700857, 0.3281265, -2.900845, 0.4627451, 1, 0, 1,
-0.6676114, -0.8610396, -2.047799, 0.4588235, 1, 0, 1,
-0.664754, 0.2129712, -2.395835, 0.4509804, 1, 0, 1,
-0.6631924, 2.682652, 0.9813361, 0.4470588, 1, 0, 1,
-0.6624662, -0.3876433, -1.721828, 0.4392157, 1, 0, 1,
-0.6530992, -1.400233, -2.126625, 0.4352941, 1, 0, 1,
-0.6517923, 1.587443, -0.2444485, 0.427451, 1, 0, 1,
-0.6506655, -0.2345067, -0.883349, 0.4235294, 1, 0, 1,
-0.6422549, -0.4895966, -0.4981943, 0.4156863, 1, 0, 1,
-0.6415144, 1.013365, -1.502046, 0.4117647, 1, 0, 1,
-0.640761, 1.657163, -0.5546341, 0.4039216, 1, 0, 1,
-0.6344171, -0.2400681, -1.856014, 0.3960784, 1, 0, 1,
-0.629228, 1.8303, 0.4514176, 0.3921569, 1, 0, 1,
-0.6248106, -0.7761565, -2.007293, 0.3843137, 1, 0, 1,
-0.623731, -0.236158, -2.597488, 0.3803922, 1, 0, 1,
-0.6192477, -0.7517374, -2.781383, 0.372549, 1, 0, 1,
-0.6162967, 0.508337, -1.126029, 0.3686275, 1, 0, 1,
-0.6100807, -1.217806, -2.080442, 0.3607843, 1, 0, 1,
-0.606505, -1.79739, -2.710687, 0.3568628, 1, 0, 1,
-0.5939686, 0.7765811, -1.860007, 0.3490196, 1, 0, 1,
-0.591754, -0.2118347, -1.081598, 0.345098, 1, 0, 1,
-0.5915077, -0.4428533, -3.718823, 0.3372549, 1, 0, 1,
-0.5858808, -0.3595948, -3.366123, 0.3333333, 1, 0, 1,
-0.5823658, 0.05919008, -0.2893108, 0.3254902, 1, 0, 1,
-0.5816251, 0.5732148, 0.003703091, 0.3215686, 1, 0, 1,
-0.5772794, -2.333816, -2.93225, 0.3137255, 1, 0, 1,
-0.576692, 0.2168074, -1.093381, 0.3098039, 1, 0, 1,
-0.5744552, 0.3014013, -2.495851, 0.3019608, 1, 0, 1,
-0.5706367, 0.4668973, 0.4661397, 0.2941177, 1, 0, 1,
-0.566059, -0.1589281, -2.548231, 0.2901961, 1, 0, 1,
-0.5657825, -0.973951, -2.527481, 0.282353, 1, 0, 1,
-0.5631874, -0.6171705, -3.152874, 0.2784314, 1, 0, 1,
-0.5627683, -1.485019, -3.401581, 0.2705882, 1, 0, 1,
-0.5610989, 1.361163, -1.959522, 0.2666667, 1, 0, 1,
-0.5539699, 0.6538345, -1.505221, 0.2588235, 1, 0, 1,
-0.546253, 0.2482362, -0.9615278, 0.254902, 1, 0, 1,
-0.5460917, 0.6185603, -1.982727, 0.2470588, 1, 0, 1,
-0.5456525, 0.7377478, 0.1447403, 0.2431373, 1, 0, 1,
-0.5445022, 1.850812, 0.3893044, 0.2352941, 1, 0, 1,
-0.53767, 0.3918177, -0.5360713, 0.2313726, 1, 0, 1,
-0.5353957, -0.08856368, -1.706751, 0.2235294, 1, 0, 1,
-0.5352073, 1.809488, -0.7954416, 0.2196078, 1, 0, 1,
-0.5257299, 0.02468095, -1.380378, 0.2117647, 1, 0, 1,
-0.5225157, -0.5262842, -2.928535, 0.2078431, 1, 0, 1,
-0.5213228, -1.440778, -3.306857, 0.2, 1, 0, 1,
-0.5207327, -1.294792, -4.007054, 0.1921569, 1, 0, 1,
-0.518667, 0.792817, -2.162793, 0.1882353, 1, 0, 1,
-0.5145746, -0.1729465, -1.640989, 0.1803922, 1, 0, 1,
-0.5064188, 0.04599205, -3.127461, 0.1764706, 1, 0, 1,
-0.5021742, 0.9025897, -1.50887, 0.1686275, 1, 0, 1,
-0.4928508, 0.6778893, -0.6281281, 0.1647059, 1, 0, 1,
-0.4888824, -0.7799528, -3.657306, 0.1568628, 1, 0, 1,
-0.4839736, -0.1180393, -0.5619085, 0.1529412, 1, 0, 1,
-0.479534, 1.158873, 0.2936776, 0.145098, 1, 0, 1,
-0.4764653, -0.343964, -2.989586, 0.1411765, 1, 0, 1,
-0.4696234, 0.236101, -1.351884, 0.1333333, 1, 0, 1,
-0.4656242, 0.6301771, -1.32103, 0.1294118, 1, 0, 1,
-0.4622442, 0.4289208, -0.8718127, 0.1215686, 1, 0, 1,
-0.4594009, 0.4387538, -0.7584755, 0.1176471, 1, 0, 1,
-0.4568144, -0.9899636, -3.06068, 0.1098039, 1, 0, 1,
-0.4560479, -0.5399393, -5.315754, 0.1058824, 1, 0, 1,
-0.4559422, 0.9671012, 0.6828631, 0.09803922, 1, 0, 1,
-0.4549592, 1.344147, -0.7393293, 0.09019608, 1, 0, 1,
-0.4510378, 0.6127797, 0.292592, 0.08627451, 1, 0, 1,
-0.4499162, -3.352434, -3.280674, 0.07843138, 1, 0, 1,
-0.447417, -0.8698146, -2.635359, 0.07450981, 1, 0, 1,
-0.4470298, -0.2096666, -3.246305, 0.06666667, 1, 0, 1,
-0.4466321, 0.6506584, -0.8090122, 0.0627451, 1, 0, 1,
-0.4425489, -0.7972281, -2.550046, 0.05490196, 1, 0, 1,
-0.441633, 0.3011922, -1.099297, 0.05098039, 1, 0, 1,
-0.4405432, -0.7344477, -3.216465, 0.04313726, 1, 0, 1,
-0.4389247, 2.76724, 1.593066, 0.03921569, 1, 0, 1,
-0.4382905, -0.5136936, -0.7897633, 0.03137255, 1, 0, 1,
-0.4354702, 0.1324237, -0.8067515, 0.02745098, 1, 0, 1,
-0.4346074, 0.2922801, -0.4681218, 0.01960784, 1, 0, 1,
-0.4344414, -1.421837, -2.163675, 0.01568628, 1, 0, 1,
-0.4339069, -0.8950631, -3.075701, 0.007843138, 1, 0, 1,
-0.4338045, -0.7901509, -3.132607, 0.003921569, 1, 0, 1,
-0.4328667, 1.033493, -0.5780972, 0, 1, 0.003921569, 1,
-0.4309155, 2.203555, 0.2379316, 0, 1, 0.01176471, 1,
-0.4286715, -0.6660195, -5.118488, 0, 1, 0.01568628, 1,
-0.4259409, 0.1115253, -0.989001, 0, 1, 0.02352941, 1,
-0.4250554, -1.714994, -1.93857, 0, 1, 0.02745098, 1,
-0.4207708, 0.9739649, -0.5710075, 0, 1, 0.03529412, 1,
-0.410245, 0.3206218, -0.09398406, 0, 1, 0.03921569, 1,
-0.4101865, -0.2872877, -2.073634, 0, 1, 0.04705882, 1,
-0.4086765, -1.227329, -3.966999, 0, 1, 0.05098039, 1,
-0.4086342, -1.30836, -0.3548237, 0, 1, 0.05882353, 1,
-0.4051415, -0.05577196, -3.993578, 0, 1, 0.0627451, 1,
-0.4048182, -0.9073098, -4.063313, 0, 1, 0.07058824, 1,
-0.4045784, 1.604472, -0.8202136, 0, 1, 0.07450981, 1,
-0.402977, -0.2696832, -2.103843, 0, 1, 0.08235294, 1,
-0.394543, -0.2882217, -0.4759891, 0, 1, 0.08627451, 1,
-0.3897386, -2.089384, -3.052961, 0, 1, 0.09411765, 1,
-0.3877628, 1.585692, -0.6966147, 0, 1, 0.1019608, 1,
-0.3877074, -1.824706, -3.0855, 0, 1, 0.1058824, 1,
-0.3863201, 0.451116, -0.7047076, 0, 1, 0.1137255, 1,
-0.3854207, -1.15566, -1.815241, 0, 1, 0.1176471, 1,
-0.3829053, -0.04602885, -0.4204341, 0, 1, 0.1254902, 1,
-0.3818664, 1.926015, -0.4424153, 0, 1, 0.1294118, 1,
-0.3813846, -0.1198395, -3.336333, 0, 1, 0.1372549, 1,
-0.3754365, 0.7048048, -2.500086, 0, 1, 0.1411765, 1,
-0.3707974, -0.7671264, -2.306519, 0, 1, 0.1490196, 1,
-0.3677245, 0.8610967, -0.7601793, 0, 1, 0.1529412, 1,
-0.3658149, 0.5128348, -0.7206434, 0, 1, 0.1607843, 1,
-0.3585996, -0.2258814, -1.210474, 0, 1, 0.1647059, 1,
-0.3576336, 0.7828774, -0.3549891, 0, 1, 0.172549, 1,
-0.3494869, -0.9138567, -2.685729, 0, 1, 0.1764706, 1,
-0.3465123, -0.1437071, -2.37436, 0, 1, 0.1843137, 1,
-0.3464997, -0.9749805, -3.659873, 0, 1, 0.1882353, 1,
-0.3438155, 1.74876, -1.084191, 0, 1, 0.1960784, 1,
-0.3425675, -0.3421381, -2.84782, 0, 1, 0.2039216, 1,
-0.342099, -0.02667567, -0.9712143, 0, 1, 0.2078431, 1,
-0.3416278, 0.2408189, -1.567868, 0, 1, 0.2156863, 1,
-0.3402519, -0.2621373, -1.133549, 0, 1, 0.2196078, 1,
-0.3373188, 1.572044, 0.4889448, 0, 1, 0.227451, 1,
-0.3361571, -1.348446, -3.831634, 0, 1, 0.2313726, 1,
-0.3342287, -0.05210201, -1.382358, 0, 1, 0.2392157, 1,
-0.3290849, 0.1471978, 0.09761287, 0, 1, 0.2431373, 1,
-0.3274578, -0.577642, -2.347303, 0, 1, 0.2509804, 1,
-0.325797, -0.3289948, -2.571611, 0, 1, 0.254902, 1,
-0.3210259, -0.9314185, -2.323322, 0, 1, 0.2627451, 1,
-0.3132159, 1.618777, -1.719334, 0, 1, 0.2666667, 1,
-0.3088963, 1.414468, -0.1285769, 0, 1, 0.2745098, 1,
-0.3083996, 0.8553809, -0.4668397, 0, 1, 0.2784314, 1,
-0.3040427, -0.2929548, -1.929056, 0, 1, 0.2862745, 1,
-0.30226, -0.5293229, -3.314981, 0, 1, 0.2901961, 1,
-0.3011583, 1.564288, 0.4701377, 0, 1, 0.2980392, 1,
-0.2955377, 0.1502818, -1.512363, 0, 1, 0.3058824, 1,
-0.2924234, 0.6876076, -0.4502423, 0, 1, 0.3098039, 1,
-0.2882015, 0.5891363, 1.488439, 0, 1, 0.3176471, 1,
-0.2829738, -0.8251204, -2.859816, 0, 1, 0.3215686, 1,
-0.2797923, -0.2970876, -1.329957, 0, 1, 0.3294118, 1,
-0.2764089, 0.3899532, -1.178217, 0, 1, 0.3333333, 1,
-0.2732333, -0.5903163, -3.073128, 0, 1, 0.3411765, 1,
-0.2716267, -0.6496024, -1.752261, 0, 1, 0.345098, 1,
-0.2697402, 0.3279402, -0.5125461, 0, 1, 0.3529412, 1,
-0.2696691, 1.257996, -0.3485585, 0, 1, 0.3568628, 1,
-0.2671169, -1.01746, -2.745478, 0, 1, 0.3647059, 1,
-0.2670823, 0.3343177, -1.573917, 0, 1, 0.3686275, 1,
-0.2666597, -0.6834488, -2.266391, 0, 1, 0.3764706, 1,
-0.2654569, 1.903631, 1.984814, 0, 1, 0.3803922, 1,
-0.2642372, -0.391046, -1.015075, 0, 1, 0.3882353, 1,
-0.2641991, -2.191369, -2.825351, 0, 1, 0.3921569, 1,
-0.2616441, -1.291256, -3.004261, 0, 1, 0.4, 1,
-0.2598996, 2.035783, 0.04383965, 0, 1, 0.4078431, 1,
-0.2583178, -0.9255323, -2.771365, 0, 1, 0.4117647, 1,
-0.2561398, 0.004491, -0.7539058, 0, 1, 0.4196078, 1,
-0.2532186, -0.1922863, -1.563545, 0, 1, 0.4235294, 1,
-0.2530853, 1.397857, -0.0806209, 0, 1, 0.4313726, 1,
-0.2483263, -0.5842158, -3.916304, 0, 1, 0.4352941, 1,
-0.2405339, -0.4068434, -2.920785, 0, 1, 0.4431373, 1,
-0.2353707, -0.8822898, -3.596321, 0, 1, 0.4470588, 1,
-0.2316749, -0.5752333, -4.206343, 0, 1, 0.454902, 1,
-0.2311452, 0.5104988, 0.1261343, 0, 1, 0.4588235, 1,
-0.2225014, -1.371145, -3.670533, 0, 1, 0.4666667, 1,
-0.2194056, 1.460226, 0.7782311, 0, 1, 0.4705882, 1,
-0.2187712, -0.08604779, -2.109747, 0, 1, 0.4784314, 1,
-0.2178736, -0.3680318, -2.90449, 0, 1, 0.4823529, 1,
-0.2160605, 0.1237679, -0.8763809, 0, 1, 0.4901961, 1,
-0.214851, -1.120904, -1.961367, 0, 1, 0.4941176, 1,
-0.2145854, 0.2952953, -1.256546, 0, 1, 0.5019608, 1,
-0.2128203, -1.160943, -3.250025, 0, 1, 0.509804, 1,
-0.2074908, 0.6317737, -0.2703621, 0, 1, 0.5137255, 1,
-0.2070639, -0.2980256, -2.089407, 0, 1, 0.5215687, 1,
-0.203767, 2.3772, 0.4945147, 0, 1, 0.5254902, 1,
-0.2012503, 0.5931036, 1.412274, 0, 1, 0.5333334, 1,
-0.1993845, -0.7407083, -1.510502, 0, 1, 0.5372549, 1,
-0.1981607, -0.3929579, -2.94026, 0, 1, 0.5450981, 1,
-0.1957535, 1.240021, -0.6526514, 0, 1, 0.5490196, 1,
-0.1836676, 0.8256592, -1.38478, 0, 1, 0.5568628, 1,
-0.1833916, 0.5380762, 0.7069048, 0, 1, 0.5607843, 1,
-0.1815268, -1.477877, -2.030327, 0, 1, 0.5686275, 1,
-0.1806437, -0.218993, -4.089701, 0, 1, 0.572549, 1,
-0.1786436, -0.9325758, -3.361012, 0, 1, 0.5803922, 1,
-0.166388, 0.9552131, -0.7649477, 0, 1, 0.5843138, 1,
-0.1590035, 1.722115, -0.06807517, 0, 1, 0.5921569, 1,
-0.1567633, -1.247169, -2.848679, 0, 1, 0.5960785, 1,
-0.1549222, 1.058773, -2.099741, 0, 1, 0.6039216, 1,
-0.1491187, -0.1158923, -2.735878, 0, 1, 0.6117647, 1,
-0.1486128, 0.9971719, 1.233189, 0, 1, 0.6156863, 1,
-0.1463996, -1.779112, -4.458631, 0, 1, 0.6235294, 1,
-0.1455206, 0.03603476, -1.759837, 0, 1, 0.627451, 1,
-0.1422956, -1.499871, -3.299672, 0, 1, 0.6352941, 1,
-0.1340933, 1.090102, 0.724111, 0, 1, 0.6392157, 1,
-0.1252389, 0.4142848, -0.9400469, 0, 1, 0.6470588, 1,
-0.1239965, -1.823765, -2.006882, 0, 1, 0.6509804, 1,
-0.123373, 0.07105204, 0.5158713, 0, 1, 0.6588235, 1,
-0.116248, 1.064499, 0.6547652, 0, 1, 0.6627451, 1,
-0.1140128, 1.511706, -0.543869, 0, 1, 0.6705883, 1,
-0.1119112, 0.8047526, 1.201342, 0, 1, 0.6745098, 1,
-0.1112899, -1.191829, -4.405039, 0, 1, 0.682353, 1,
-0.1096948, -0.8682894, -1.86485, 0, 1, 0.6862745, 1,
-0.1085921, -2.290937, -1.598323, 0, 1, 0.6941177, 1,
-0.1081976, 0.3715962, -0.482654, 0, 1, 0.7019608, 1,
-0.1063398, -0.007595693, -1.093048, 0, 1, 0.7058824, 1,
-0.1049385, -2.298513, -3.60907, 0, 1, 0.7137255, 1,
-0.1006986, -0.2213576, -1.823588, 0, 1, 0.7176471, 1,
-0.09742794, -0.1216536, -0.8727236, 0, 1, 0.7254902, 1,
-0.09285869, 0.396735, 0.4687739, 0, 1, 0.7294118, 1,
-0.09238835, 1.037018, 0.2391435, 0, 1, 0.7372549, 1,
-0.0911577, 1.771916, 0.2519538, 0, 1, 0.7411765, 1,
-0.08892045, -0.5240664, -1.573729, 0, 1, 0.7490196, 1,
-0.08803261, 0.523594, -0.0108773, 0, 1, 0.7529412, 1,
-0.08240629, -0.4473769, -3.676083, 0, 1, 0.7607843, 1,
-0.07790851, 1.739647, -0.8586094, 0, 1, 0.7647059, 1,
-0.07784669, -0.5727257, -3.007156, 0, 1, 0.772549, 1,
-0.07768012, -0.5838271, -3.095231, 0, 1, 0.7764706, 1,
-0.07687172, -0.4285941, -3.846816, 0, 1, 0.7843137, 1,
-0.07643835, 0.1514212, -0.1105408, 0, 1, 0.7882353, 1,
-0.06844066, -0.6960892, -3.82553, 0, 1, 0.7960784, 1,
-0.06809636, 0.476777, -0.2776078, 0, 1, 0.8039216, 1,
-0.06642512, 0.8033465, 1.196818, 0, 1, 0.8078431, 1,
-0.06592617, 0.432234, -0.3980035, 0, 1, 0.8156863, 1,
-0.06152141, 0.6511062, -0.5650039, 0, 1, 0.8196079, 1,
-0.0558614, 0.9376424, -1.229597, 0, 1, 0.827451, 1,
-0.05440554, 0.3697365, -0.01615102, 0, 1, 0.8313726, 1,
-0.05344235, 0.4253616, 0.5885191, 0, 1, 0.8392157, 1,
-0.04849641, 0.01047663, -0.771413, 0, 1, 0.8431373, 1,
-0.04564416, -0.01637643, -3.169578, 0, 1, 0.8509804, 1,
-0.04158871, 0.6769651, -0.3520936, 0, 1, 0.854902, 1,
-0.03743475, -1.607238, -2.429497, 0, 1, 0.8627451, 1,
-0.03384348, -0.2835208, -3.267048, 0, 1, 0.8666667, 1,
-0.0334564, 0.5285327, 0.991107, 0, 1, 0.8745098, 1,
-0.03097048, -0.3961534, -2.714048, 0, 1, 0.8784314, 1,
-0.02910046, -1.318342, -4.03882, 0, 1, 0.8862745, 1,
-0.02589484, 0.8064315, 0.8842241, 0, 1, 0.8901961, 1,
-0.02118298, -1.028879, -3.361138, 0, 1, 0.8980392, 1,
-0.02100897, 1.39101, -0.5048583, 0, 1, 0.9058824, 1,
-0.02027125, 0.8321831, 1.201026, 0, 1, 0.9098039, 1,
-0.01942053, -0.2550441, -3.888376, 0, 1, 0.9176471, 1,
-0.01736302, -0.2257662, -4.443936, 0, 1, 0.9215686, 1,
-0.01342713, 0.2473301, -0.7893116, 0, 1, 0.9294118, 1,
-0.012617, 0.4757906, 0.2485187, 0, 1, 0.9333333, 1,
-0.01093816, -0.2122743, -4.563214, 0, 1, 0.9411765, 1,
-0.008050294, 0.06335986, 0.1594129, 0, 1, 0.945098, 1,
-0.005543376, -0.5221937, -2.791266, 0, 1, 0.9529412, 1,
-0.005450443, -0.9541344, -4.383893, 0, 1, 0.9568627, 1,
-0.001898315, 0.2947338, 1.214906, 0, 1, 0.9647059, 1,
-0.0001070862, 1.137171, 0.8908629, 0, 1, 0.9686275, 1,
0.0003864868, -1.082415, 2.945904, 0, 1, 0.9764706, 1,
0.001110031, 0.2248487, 0.1183536, 0, 1, 0.9803922, 1,
0.00248289, -1.159021, 2.862957, 0, 1, 0.9882353, 1,
0.007169609, 0.8165139, 0.2009899, 0, 1, 0.9921569, 1,
0.008988292, 1.953352, 0.2057469, 0, 1, 1, 1,
0.013996, -0.9307234, 2.496816, 0, 0.9921569, 1, 1,
0.01758915, -0.3841253, 2.588842, 0, 0.9882353, 1, 1,
0.01800631, -0.3681111, 4.14244, 0, 0.9803922, 1, 1,
0.02317992, 0.3822146, 0.7078179, 0, 0.9764706, 1, 1,
0.0416279, 0.3467354, -2.229182, 0, 0.9686275, 1, 1,
0.04628441, -1.193949, 4.639492, 0, 0.9647059, 1, 1,
0.04654203, -1.033066, 2.931863, 0, 0.9568627, 1, 1,
0.05171845, 0.3789403, -0.3067644, 0, 0.9529412, 1, 1,
0.05283365, -0.3786662, 2.809085, 0, 0.945098, 1, 1,
0.05328885, -1.888942, 3.608394, 0, 0.9411765, 1, 1,
0.0562512, -0.6412029, 3.890654, 0, 0.9333333, 1, 1,
0.05698868, 1.135536, 0.8591204, 0, 0.9294118, 1, 1,
0.06030108, 0.6926006, -0.2768317, 0, 0.9215686, 1, 1,
0.06148268, 1.486815, -2.116814, 0, 0.9176471, 1, 1,
0.0659899, 0.4433835, -0.7000468, 0, 0.9098039, 1, 1,
0.06795484, -0.1998738, 1.540061, 0, 0.9058824, 1, 1,
0.06901138, 0.4584915, -0.8116936, 0, 0.8980392, 1, 1,
0.0737046, -0.3408169, 4.148, 0, 0.8901961, 1, 1,
0.07720286, 0.8977699, -0.2081243, 0, 0.8862745, 1, 1,
0.07856099, -0.02776396, 2.077915, 0, 0.8784314, 1, 1,
0.08749922, -0.8353357, 2.570337, 0, 0.8745098, 1, 1,
0.09107993, -1.177849, 2.704387, 0, 0.8666667, 1, 1,
0.09249827, -0.2810421, 2.128565, 0, 0.8627451, 1, 1,
0.09473242, 0.04071878, 2.041776, 0, 0.854902, 1, 1,
0.09555074, -0.6292539, 4.170549, 0, 0.8509804, 1, 1,
0.09982062, -0.8645985, 2.972234, 0, 0.8431373, 1, 1,
0.1048922, -0.8579077, 4.427687, 0, 0.8392157, 1, 1,
0.1069011, 0.8352282, 1.257952, 0, 0.8313726, 1, 1,
0.1093687, 0.163963, 0.0441335, 0, 0.827451, 1, 1,
0.1124087, 0.1826215, 0.5448273, 0, 0.8196079, 1, 1,
0.1124882, 1.197126, 0.03752944, 0, 0.8156863, 1, 1,
0.1126277, 0.8424283, 2.05489, 0, 0.8078431, 1, 1,
0.1145017, 0.3862695, -0.05712073, 0, 0.8039216, 1, 1,
0.1212176, 0.3165528, 0.7248443, 0, 0.7960784, 1, 1,
0.1230073, -0.662003, 4.764221, 0, 0.7882353, 1, 1,
0.1239547, -0.8611579, 2.567786, 0, 0.7843137, 1, 1,
0.1240235, 0.3288558, -0.7677607, 0, 0.7764706, 1, 1,
0.1255537, -0.169871, 0.9469879, 0, 0.772549, 1, 1,
0.1360958, -1.19437, 3.321702, 0, 0.7647059, 1, 1,
0.1376066, 0.5054509, -0.01911326, 0, 0.7607843, 1, 1,
0.139241, 0.3856044, 0.4660623, 0, 0.7529412, 1, 1,
0.1425981, 1.171671, 0.1188783, 0, 0.7490196, 1, 1,
0.1433457, 0.9476702, -1.047411, 0, 0.7411765, 1, 1,
0.1485962, 0.8630487, -0.2537082, 0, 0.7372549, 1, 1,
0.1522154, 0.9716812, 0.4689124, 0, 0.7294118, 1, 1,
0.1553346, 1.99132, 1.674701, 0, 0.7254902, 1, 1,
0.1562734, -0.3804837, 2.255242, 0, 0.7176471, 1, 1,
0.158239, 0.9673582, 1.311407, 0, 0.7137255, 1, 1,
0.1584922, 0.5272838, 0.02570427, 0, 0.7058824, 1, 1,
0.1599374, 0.03423006, 0.4143982, 0, 0.6980392, 1, 1,
0.1667646, 0.07280488, 1.218533, 0, 0.6941177, 1, 1,
0.1668766, 0.9288602, -0.4578961, 0, 0.6862745, 1, 1,
0.1700822, -1.432787, 3.58041, 0, 0.682353, 1, 1,
0.1717092, -1.42803, 4.299122, 0, 0.6745098, 1, 1,
0.1722025, -2.221927, 4.243004, 0, 0.6705883, 1, 1,
0.1738036, 1.552699, 0.2761449, 0, 0.6627451, 1, 1,
0.17784, 2.431688, 1.941053, 0, 0.6588235, 1, 1,
0.1802364, 0.9865249, -0.01283138, 0, 0.6509804, 1, 1,
0.1870193, -0.8215073, 4.057954, 0, 0.6470588, 1, 1,
0.188125, -0.1984217, 2.690012, 0, 0.6392157, 1, 1,
0.1903397, -1.474054, 2.204286, 0, 0.6352941, 1, 1,
0.1910381, 1.156952, 0.23068, 0, 0.627451, 1, 1,
0.1929683, -0.7678256, 1.989143, 0, 0.6235294, 1, 1,
0.1941994, 1.016921, 0.757018, 0, 0.6156863, 1, 1,
0.1949801, -1.041249, 5.198235, 0, 0.6117647, 1, 1,
0.195995, -0.504109, 1.82792, 0, 0.6039216, 1, 1,
0.1993835, -1.151151, 2.978434, 0, 0.5960785, 1, 1,
0.1997717, 0.5541249, -0.1894712, 0, 0.5921569, 1, 1,
0.2020547, 1.755445, 1.481037, 0, 0.5843138, 1, 1,
0.2030284, -0.2396345, 3.701576, 0, 0.5803922, 1, 1,
0.2045393, 0.5105532, -0.1058114, 0, 0.572549, 1, 1,
0.206295, -0.4523441, 4.504526, 0, 0.5686275, 1, 1,
0.2116791, 0.05347228, 1.067816, 0, 0.5607843, 1, 1,
0.2119078, -0.579064, 3.97085, 0, 0.5568628, 1, 1,
0.2158203, 0.9939142, -0.03268237, 0, 0.5490196, 1, 1,
0.2458389, 0.8009554, 0.584187, 0, 0.5450981, 1, 1,
0.2503206, -0.5316165, 1.903798, 0, 0.5372549, 1, 1,
0.2506669, 0.2355039, 1.948393, 0, 0.5333334, 1, 1,
0.2528117, -1.114371, 2.799203, 0, 0.5254902, 1, 1,
0.255273, 0.889886, 1.135063, 0, 0.5215687, 1, 1,
0.2565238, 1.159933, -0.4545753, 0, 0.5137255, 1, 1,
0.2649256, 0.07300425, 2.216086, 0, 0.509804, 1, 1,
0.266121, -0.1125631, 1.63945, 0, 0.5019608, 1, 1,
0.2676608, 2.033187, -0.4502916, 0, 0.4941176, 1, 1,
0.269859, -0.004623146, 0.6401685, 0, 0.4901961, 1, 1,
0.27108, -1.300367, 2.020515, 0, 0.4823529, 1, 1,
0.2714496, 0.4260958, 0.3325545, 0, 0.4784314, 1, 1,
0.2832682, -0.2874368, 3.209356, 0, 0.4705882, 1, 1,
0.2838402, -1.005645, 1.863267, 0, 0.4666667, 1, 1,
0.289877, 0.03098385, 1.994294, 0, 0.4588235, 1, 1,
0.2914677, -1.215246, 3.393742, 0, 0.454902, 1, 1,
0.2927169, -0.6127548, 1.278823, 0, 0.4470588, 1, 1,
0.2957667, -0.2941152, 2.065126, 0, 0.4431373, 1, 1,
0.2960787, 1.002502, 0.8633899, 0, 0.4352941, 1, 1,
0.3034194, 1.189506, -0.440247, 0, 0.4313726, 1, 1,
0.3073718, 1.178977, 0.5523334, 0, 0.4235294, 1, 1,
0.3075828, 0.01991108, 0.05514941, 0, 0.4196078, 1, 1,
0.3082237, -0.1961973, 1.73577, 0, 0.4117647, 1, 1,
0.3186882, 0.02232636, 1.837232, 0, 0.4078431, 1, 1,
0.3222989, 0.4950496, 0.2872163, 0, 0.4, 1, 1,
0.3223428, -0.3821294, 1.621231, 0, 0.3921569, 1, 1,
0.3234158, -0.2785851, 2.635215, 0, 0.3882353, 1, 1,
0.3251081, 0.5167988, -0.2778656, 0, 0.3803922, 1, 1,
0.3320049, 0.2893949, 3.2646, 0, 0.3764706, 1, 1,
0.3331238, -1.131233, 3.879487, 0, 0.3686275, 1, 1,
0.3396653, 0.6208751, -0.3337339, 0, 0.3647059, 1, 1,
0.3406189, 0.016568, 1.965791, 0, 0.3568628, 1, 1,
0.3428801, 0.02234977, 0.5071837, 0, 0.3529412, 1, 1,
0.3463176, 0.3027581, 0.6829101, 0, 0.345098, 1, 1,
0.3465955, -0.6412028, 4.220803, 0, 0.3411765, 1, 1,
0.3510914, -0.8517015, 1.483753, 0, 0.3333333, 1, 1,
0.3547206, -0.7024811, 2.710997, 0, 0.3294118, 1, 1,
0.3559938, 0.2925966, 0.9889579, 0, 0.3215686, 1, 1,
0.3568734, 0.2468182, 1.308736, 0, 0.3176471, 1, 1,
0.3573788, 0.2300235, 1.133662, 0, 0.3098039, 1, 1,
0.361197, -0.7385408, 2.098607, 0, 0.3058824, 1, 1,
0.3619011, 0.01822926, 1.760283, 0, 0.2980392, 1, 1,
0.362397, 0.5420455, 0.1030093, 0, 0.2901961, 1, 1,
0.3641936, -0.7737446, 1.435528, 0, 0.2862745, 1, 1,
0.3687657, -0.3536017, 1.923508, 0, 0.2784314, 1, 1,
0.3692712, 0.06083531, 1.487975, 0, 0.2745098, 1, 1,
0.3779411, 0.925948, -0.7374556, 0, 0.2666667, 1, 1,
0.3835139, 0.7407362, 0.0421675, 0, 0.2627451, 1, 1,
0.3911523, 0.3081062, 1.117079, 0, 0.254902, 1, 1,
0.3954574, -1.266749, 2.648538, 0, 0.2509804, 1, 1,
0.3971628, -0.4712587, 2.175304, 0, 0.2431373, 1, 1,
0.3978084, 0.134985, -0.3800864, 0, 0.2392157, 1, 1,
0.3984035, -0.7828512, 4.743647, 0, 0.2313726, 1, 1,
0.4032806, 0.6545129, 1.190437, 0, 0.227451, 1, 1,
0.4053425, -0.1851948, 3.612304, 0, 0.2196078, 1, 1,
0.409789, -0.9691898, 4.623635, 0, 0.2156863, 1, 1,
0.4100555, -0.1668723, 2.146181, 0, 0.2078431, 1, 1,
0.4126059, 1.642978, -0.2304932, 0, 0.2039216, 1, 1,
0.4162582, -0.5536512, 2.010993, 0, 0.1960784, 1, 1,
0.4176285, 2.41479, 0.1488259, 0, 0.1882353, 1, 1,
0.4184871, -0.8505558, 2.741343, 0, 0.1843137, 1, 1,
0.4202646, 0.1885371, 0.1656117, 0, 0.1764706, 1, 1,
0.4235751, -0.4792193, 2.389566, 0, 0.172549, 1, 1,
0.4279672, -1.680886, 2.584177, 0, 0.1647059, 1, 1,
0.4296188, 1.398403, 1.779037, 0, 0.1607843, 1, 1,
0.4307859, 1.228868, 1.741395, 0, 0.1529412, 1, 1,
0.4315307, 0.420908, 2.942906, 0, 0.1490196, 1, 1,
0.4368561, -0.809049, 2.590044, 0, 0.1411765, 1, 1,
0.438089, -0.1594983, 1.890434, 0, 0.1372549, 1, 1,
0.4392625, -0.4994354, 3.794051, 0, 0.1294118, 1, 1,
0.4414271, -0.4460848, 2.657756, 0, 0.1254902, 1, 1,
0.4431952, -1.594142, 4.357356, 0, 0.1176471, 1, 1,
0.4453544, -1.341075, 4.258858, 0, 0.1137255, 1, 1,
0.4472983, 1.127738, 1.980538, 0, 0.1058824, 1, 1,
0.4536387, -0.6871367, 2.337253, 0, 0.09803922, 1, 1,
0.4543468, -0.005293476, 1.276363, 0, 0.09411765, 1, 1,
0.4653836, 0.6494029, -0.7370525, 0, 0.08627451, 1, 1,
0.4657764, -0.1756315, 1.009171, 0, 0.08235294, 1, 1,
0.4667822, 1.460867, -0.2511365, 0, 0.07450981, 1, 1,
0.4681759, 1.925436, 0.1867431, 0, 0.07058824, 1, 1,
0.4692203, -0.01959143, 3.077953, 0, 0.0627451, 1, 1,
0.4698018, -0.3212048, 0.7178981, 0, 0.05882353, 1, 1,
0.4718558, 1.465386, 0.5554971, 0, 0.05098039, 1, 1,
0.4781325, 0.3850202, 0.8782361, 0, 0.04705882, 1, 1,
0.4783962, 1.022186, 0.006520717, 0, 0.03921569, 1, 1,
0.4829868, 1.225071, 0.9275839, 0, 0.03529412, 1, 1,
0.4947573, 0.9577543, 1.273764, 0, 0.02745098, 1, 1,
0.4974166, -0.2527809, 2.893049, 0, 0.02352941, 1, 1,
0.5060575, 0.6475694, 2.393692, 0, 0.01568628, 1, 1,
0.5068923, -0.8112687, 3.647247, 0, 0.01176471, 1, 1,
0.5099329, 0.06813965, 1.768809, 0, 0.003921569, 1, 1,
0.5100152, -0.3152952, 2.208352, 0.003921569, 0, 1, 1,
0.5104824, -0.7120393, 2.031867, 0.007843138, 0, 1, 1,
0.5105687, 0.0886418, 1.348518, 0.01568628, 0, 1, 1,
0.5110641, 0.3118078, 0.5283692, 0.01960784, 0, 1, 1,
0.5115695, -1.336823, 2.577906, 0.02745098, 0, 1, 1,
0.5136002, 0.0329353, 1.617474, 0.03137255, 0, 1, 1,
0.5174388, -0.2502163, 0.6609812, 0.03921569, 0, 1, 1,
0.522355, 0.02677615, 1.277725, 0.04313726, 0, 1, 1,
0.5269613, 0.173953, 1.513786, 0.05098039, 0, 1, 1,
0.5270262, 0.2865937, 0.0798031, 0.05490196, 0, 1, 1,
0.5293146, 0.03903372, -0.7209703, 0.0627451, 0, 1, 1,
0.5296986, 0.1783752, 0.4320776, 0.06666667, 0, 1, 1,
0.5307009, 1.016371, -0.80686, 0.07450981, 0, 1, 1,
0.5308819, 1.962542, 0.7417629, 0.07843138, 0, 1, 1,
0.5351695, -0.5451047, 2.583582, 0.08627451, 0, 1, 1,
0.5361274, -0.7721731, 2.911138, 0.09019608, 0, 1, 1,
0.5380821, -0.3280807, 0.07838233, 0.09803922, 0, 1, 1,
0.5432736, -0.1044511, -0.258599, 0.1058824, 0, 1, 1,
0.5433337, 0.9019921, 0.2786186, 0.1098039, 0, 1, 1,
0.5477516, 0.2581507, -0.2641295, 0.1176471, 0, 1, 1,
0.5504679, -0.5977613, 2.539399, 0.1215686, 0, 1, 1,
0.5650417, -0.2462869, 3.014496, 0.1294118, 0, 1, 1,
0.5723873, 0.4167309, -1.439681, 0.1333333, 0, 1, 1,
0.5737544, 0.2238433, -0.317879, 0.1411765, 0, 1, 1,
0.574775, 1.626667, -0.6259859, 0.145098, 0, 1, 1,
0.5764111, 0.7537819, -0.554638, 0.1529412, 0, 1, 1,
0.5774255, 1.518089, -1.246047, 0.1568628, 0, 1, 1,
0.580615, -0.2458397, 1.681897, 0.1647059, 0, 1, 1,
0.5821465, -1.009879, 3.28537, 0.1686275, 0, 1, 1,
0.5822392, -0.09896964, 0.4014917, 0.1764706, 0, 1, 1,
0.5869071, 0.7724587, -2.625685, 0.1803922, 0, 1, 1,
0.5873972, 0.9794194, 0.8875084, 0.1882353, 0, 1, 1,
0.5909085, -0.6434191, 3.245358, 0.1921569, 0, 1, 1,
0.592523, 0.3326998, 2.601326, 0.2, 0, 1, 1,
0.5926904, 1.644702, 0.2498408, 0.2078431, 0, 1, 1,
0.5998165, 0.6274189, -0.4755104, 0.2117647, 0, 1, 1,
0.6072058, -0.810739, 1.734048, 0.2196078, 0, 1, 1,
0.618158, 0.004670655, 0.4472851, 0.2235294, 0, 1, 1,
0.6183444, -0.3417796, 2.561435, 0.2313726, 0, 1, 1,
0.6188924, 1.459675, -0.3055083, 0.2352941, 0, 1, 1,
0.6191196, -0.9238527, 4.265583, 0.2431373, 0, 1, 1,
0.6249043, 0.3171873, 1.525105, 0.2470588, 0, 1, 1,
0.625291, -1.251519, 3.820882, 0.254902, 0, 1, 1,
0.6294142, -1.327619, 4.497952, 0.2588235, 0, 1, 1,
0.6332495, 0.5551378, 0.319049, 0.2666667, 0, 1, 1,
0.6342185, 0.4143641, 1.309095, 0.2705882, 0, 1, 1,
0.6375492, -0.6056265, 0.9791741, 0.2784314, 0, 1, 1,
0.6464401, 0.5779501, 0.6257356, 0.282353, 0, 1, 1,
0.6498228, -2.280128, 3.276224, 0.2901961, 0, 1, 1,
0.652837, -0.1003067, 2.07596, 0.2941177, 0, 1, 1,
0.655486, 1.038315, 0.7348167, 0.3019608, 0, 1, 1,
0.6563405, -1.053743, 0.8040394, 0.3098039, 0, 1, 1,
0.6580827, 0.275696, 3.011185, 0.3137255, 0, 1, 1,
0.659436, 1.567394, 0.6871615, 0.3215686, 0, 1, 1,
0.6627466, 0.4421038, 2.190871, 0.3254902, 0, 1, 1,
0.6706821, -1.751656, 1.80652, 0.3333333, 0, 1, 1,
0.6740823, -0.006889955, 3.845581, 0.3372549, 0, 1, 1,
0.6770769, -1.483876, 2.494216, 0.345098, 0, 1, 1,
0.6788216, 1.608757, 0.6350842, 0.3490196, 0, 1, 1,
0.6788448, 0.1050642, -1.090064, 0.3568628, 0, 1, 1,
0.6818813, -1.825448, 4.000277, 0.3607843, 0, 1, 1,
0.6843672, 1.413907, 0.6956083, 0.3686275, 0, 1, 1,
0.6897819, -2.215347, 1.91568, 0.372549, 0, 1, 1,
0.6903591, 0.7833737, 0.1445286, 0.3803922, 0, 1, 1,
0.6938319, 0.8723265, 1.572467, 0.3843137, 0, 1, 1,
0.7002597, 1.000841, 1.623539, 0.3921569, 0, 1, 1,
0.702281, 0.02700302, 1.225332, 0.3960784, 0, 1, 1,
0.7057757, -2.386216, 2.341912, 0.4039216, 0, 1, 1,
0.7089177, 1.46199, 1.427901, 0.4117647, 0, 1, 1,
0.7101165, -0.7334963, 1.775971, 0.4156863, 0, 1, 1,
0.7127446, 1.104298, 1.562971, 0.4235294, 0, 1, 1,
0.7127617, 0.285741, 1.226929, 0.427451, 0, 1, 1,
0.7141779, 0.6456853, 0.9970409, 0.4352941, 0, 1, 1,
0.7172419, 0.4757706, -0.4717129, 0.4392157, 0, 1, 1,
0.7294893, 0.7365016, 0.8649763, 0.4470588, 0, 1, 1,
0.7299109, 0.1300635, 2.264988, 0.4509804, 0, 1, 1,
0.7325253, 1.246053, 0.5134782, 0.4588235, 0, 1, 1,
0.7365124, 0.6379804, -1.14893, 0.4627451, 0, 1, 1,
0.7378983, 0.6059577, 0.3837209, 0.4705882, 0, 1, 1,
0.7444555, -0.5446243, 1.068077, 0.4745098, 0, 1, 1,
0.7509011, 0.1811105, 0.9615644, 0.4823529, 0, 1, 1,
0.7514646, 0.5766078, -1.523808, 0.4862745, 0, 1, 1,
0.7567976, -0.6496103, 2.391476, 0.4941176, 0, 1, 1,
0.7578707, 0.4519317, 2.745647, 0.5019608, 0, 1, 1,
0.7580453, -0.3507937, 2.160209, 0.5058824, 0, 1, 1,
0.7656894, 0.9261205, 1.403441, 0.5137255, 0, 1, 1,
0.7692811, 1.336316, 1.958324, 0.5176471, 0, 1, 1,
0.7696786, 1.148104, 0.08270536, 0.5254902, 0, 1, 1,
0.7716187, -0.1180375, 2.521734, 0.5294118, 0, 1, 1,
0.7725094, 1.739478, 0.4346378, 0.5372549, 0, 1, 1,
0.7735246, 1.097705, 0.4605601, 0.5411765, 0, 1, 1,
0.7738907, 0.0216863, 1.400054, 0.5490196, 0, 1, 1,
0.7749651, -0.9850806, 3.478028, 0.5529412, 0, 1, 1,
0.7772387, 0.4554289, 2.522976, 0.5607843, 0, 1, 1,
0.7789301, 2.105906, 2.568983, 0.5647059, 0, 1, 1,
0.7824485, 0.03052779, 1.251045, 0.572549, 0, 1, 1,
0.7873633, -0.07507781, 1.591421, 0.5764706, 0, 1, 1,
0.7886321, 0.5689004, 4.303377, 0.5843138, 0, 1, 1,
0.7916024, -0.1463718, 2.487652, 0.5882353, 0, 1, 1,
0.8018973, -1.677187, 1.669419, 0.5960785, 0, 1, 1,
0.803372, -0.01991588, 2.308192, 0.6039216, 0, 1, 1,
0.8104364, 0.2974851, 1.052176, 0.6078432, 0, 1, 1,
0.8110222, 1.405261, -0.1425982, 0.6156863, 0, 1, 1,
0.811123, 0.5309422, 0.9434563, 0.6196079, 0, 1, 1,
0.8113073, 1.287287, -0.8884848, 0.627451, 0, 1, 1,
0.8128974, -2.067746, 3.39598, 0.6313726, 0, 1, 1,
0.8153047, 1.149081, -0.8780233, 0.6392157, 0, 1, 1,
0.8207444, -0.1808463, 2.076046, 0.6431373, 0, 1, 1,
0.8213208, 1.781781, 0.4658237, 0.6509804, 0, 1, 1,
0.8354526, -1.392992, 2.802937, 0.654902, 0, 1, 1,
0.8368195, 0.9025036, 1.410336, 0.6627451, 0, 1, 1,
0.8370966, 0.8660451, 0.5070401, 0.6666667, 0, 1, 1,
0.8423558, 0.01299385, 2.306278, 0.6745098, 0, 1, 1,
0.8425407, 0.5984267, 0.2955955, 0.6784314, 0, 1, 1,
0.8435924, 1.597275, -1.434479, 0.6862745, 0, 1, 1,
0.8450251, -0.2433674, 3.126019, 0.6901961, 0, 1, 1,
0.8457525, 1.368525, 0.7260066, 0.6980392, 0, 1, 1,
0.8465044, 1.387059, -0.2415945, 0.7058824, 0, 1, 1,
0.8560227, -0.4449252, 1.91861, 0.7098039, 0, 1, 1,
0.8565581, 1.077297, 0.08585897, 0.7176471, 0, 1, 1,
0.8572915, 0.3417859, 0.4371677, 0.7215686, 0, 1, 1,
0.8584963, 0.1007588, 1.272545, 0.7294118, 0, 1, 1,
0.8637917, -0.909834, 3.891237, 0.7333333, 0, 1, 1,
0.8652112, -1.254309, 3.636242, 0.7411765, 0, 1, 1,
0.8695005, 0.5875198, 0.1444513, 0.7450981, 0, 1, 1,
0.8717115, 0.868396, 2.03004, 0.7529412, 0, 1, 1,
0.8720587, 1.871228, 0.1869852, 0.7568628, 0, 1, 1,
0.8804927, 0.4230788, -0.4617161, 0.7647059, 0, 1, 1,
0.8809407, 0.9832193, 0.6453698, 0.7686275, 0, 1, 1,
0.8824342, -1.327035, 3.162529, 0.7764706, 0, 1, 1,
0.8864429, -1.882988, 3.652987, 0.7803922, 0, 1, 1,
0.8886353, 0.1971694, 1.605447, 0.7882353, 0, 1, 1,
0.8917251, 0.7517856, 1.246889, 0.7921569, 0, 1, 1,
0.8923389, 0.6374143, -0.08530272, 0.8, 0, 1, 1,
0.8959528, 0.5572799, 0.7433763, 0.8078431, 0, 1, 1,
0.9024588, -0.9850306, 3.035028, 0.8117647, 0, 1, 1,
0.9028507, 1.215552, -1.839476, 0.8196079, 0, 1, 1,
0.912459, 1.192879, 1.33059, 0.8235294, 0, 1, 1,
0.9143227, -0.8457344, 3.034739, 0.8313726, 0, 1, 1,
0.9219935, -0.4887853, 1.50524, 0.8352941, 0, 1, 1,
0.9226136, -1.578106, 2.210294, 0.8431373, 0, 1, 1,
0.9239887, 0.106527, 1.291279, 0.8470588, 0, 1, 1,
0.9262664, -1.13004, 1.443304, 0.854902, 0, 1, 1,
0.9274709, 1.174361, -0.3647791, 0.8588235, 0, 1, 1,
0.9314291, -1.111535, 2.276618, 0.8666667, 0, 1, 1,
0.9467594, -0.7648559, -0.138035, 0.8705882, 0, 1, 1,
0.9470068, -0.8881173, 3.783297, 0.8784314, 0, 1, 1,
0.9483845, 0.3199819, 2.199211, 0.8823529, 0, 1, 1,
0.9560292, 1.132876, 0.5774546, 0.8901961, 0, 1, 1,
0.9561769, -0.2070184, 2.360594, 0.8941177, 0, 1, 1,
0.9600856, -0.7811846, 0.5914025, 0.9019608, 0, 1, 1,
0.9617679, -0.87578, 1.518459, 0.9098039, 0, 1, 1,
0.9657947, 1.071495, 1.850651, 0.9137255, 0, 1, 1,
0.9664907, 1.370974, 2.136298, 0.9215686, 0, 1, 1,
0.9715958, -1.59437, 1.99638, 0.9254902, 0, 1, 1,
0.9775649, 0.06998724, 1.096583, 0.9333333, 0, 1, 1,
0.9804528, 0.439373, -2.157995, 0.9372549, 0, 1, 1,
0.9822736, -1.108289, 2.00493, 0.945098, 0, 1, 1,
0.9831047, 1.068338, 2.220517, 0.9490196, 0, 1, 1,
0.9846266, 1.741885, 0.5030075, 0.9568627, 0, 1, 1,
0.9905581, -1.871889, 2.544584, 0.9607843, 0, 1, 1,
0.9936058, -1.953327, 3.9497, 0.9686275, 0, 1, 1,
1.002864, 0.07659212, 2.544575, 0.972549, 0, 1, 1,
1.003134, -2.480518, 2.519637, 0.9803922, 0, 1, 1,
1.005399, 0.2698193, 3.35791, 0.9843137, 0, 1, 1,
1.006424, -1.442425, 2.04152, 0.9921569, 0, 1, 1,
1.012152, 0.1804424, 2.150902, 0.9960784, 0, 1, 1,
1.014438, 0.133299, 1.201074, 1, 0, 0.9960784, 1,
1.016586, -0.1110532, 2.730755, 1, 0, 0.9882353, 1,
1.018606, -0.09870199, 1.877031, 1, 0, 0.9843137, 1,
1.023412, 0.1469255, 0.8418026, 1, 0, 0.9764706, 1,
1.027057, 1.769199, -0.3542866, 1, 0, 0.972549, 1,
1.029038, -0.4197021, 2.913173, 1, 0, 0.9647059, 1,
1.029534, 0.02682856, 2.135516, 1, 0, 0.9607843, 1,
1.029921, -0.7453881, 2.017942, 1, 0, 0.9529412, 1,
1.030092, -2.126996, 0.895528, 1, 0, 0.9490196, 1,
1.038503, -0.798728, 0.1080084, 1, 0, 0.9411765, 1,
1.041898, 0.2957892, 1.832882, 1, 0, 0.9372549, 1,
1.044618, 0.9750137, 2.083452, 1, 0, 0.9294118, 1,
1.044649, -1.541383, 2.382951, 1, 0, 0.9254902, 1,
1.05408, 1.728799, 0.4781718, 1, 0, 0.9176471, 1,
1.058047, -0.9090368, 0.08110645, 1, 0, 0.9137255, 1,
1.061539, -1.003758, 2.226378, 1, 0, 0.9058824, 1,
1.065911, -0.1719544, 1.291509, 1, 0, 0.9019608, 1,
1.076627, 2.024887, 0.5459603, 1, 0, 0.8941177, 1,
1.081979, 0.2734569, 1.155775, 1, 0, 0.8862745, 1,
1.086525, 0.7381768, 1.241139, 1, 0, 0.8823529, 1,
1.087269, 0.5076035, 3.047264, 1, 0, 0.8745098, 1,
1.089868, 0.0156182, 2.137471, 1, 0, 0.8705882, 1,
1.091661, -0.002296113, 1.037663, 1, 0, 0.8627451, 1,
1.093356, -0.1652943, 2.007708, 1, 0, 0.8588235, 1,
1.094213, -1.746389, 1.624142, 1, 0, 0.8509804, 1,
1.095268, 0.7705266, 0.7371695, 1, 0, 0.8470588, 1,
1.107874, -0.7568208, 1.260685, 1, 0, 0.8392157, 1,
1.110706, -1.047007, 0.996472, 1, 0, 0.8352941, 1,
1.121199, -0.4085832, 2.443319, 1, 0, 0.827451, 1,
1.121773, 0.6013365, 1.726776, 1, 0, 0.8235294, 1,
1.124957, 0.06246454, 1.422283, 1, 0, 0.8156863, 1,
1.125918, -0.4912055, 0.6092105, 1, 0, 0.8117647, 1,
1.126692, 1.175629, 1.375353, 1, 0, 0.8039216, 1,
1.132716, 0.6257588, 1.018432, 1, 0, 0.7960784, 1,
1.140366, 0.5920218, -1.042454, 1, 0, 0.7921569, 1,
1.145963, 0.8814312, 0.5953532, 1, 0, 0.7843137, 1,
1.153177, 0.8944445, 1.565337, 1, 0, 0.7803922, 1,
1.159793, 1.615457, -0.3109748, 1, 0, 0.772549, 1,
1.162062, -0.4966486, 1.64335, 1, 0, 0.7686275, 1,
1.162729, -1.197181, 0.8048745, 1, 0, 0.7607843, 1,
1.163929, -1.106302, 3.758694, 1, 0, 0.7568628, 1,
1.16648, 0.09124497, 1.815797, 1, 0, 0.7490196, 1,
1.16846, -1.000616, 3.303424, 1, 0, 0.7450981, 1,
1.173115, 1.335244, 2.291876, 1, 0, 0.7372549, 1,
1.187372, -1.187485, 3.181495, 1, 0, 0.7333333, 1,
1.19213, -0.5109059, 1.691755, 1, 0, 0.7254902, 1,
1.192997, 0.226094, 0.6139048, 1, 0, 0.7215686, 1,
1.194881, 0.5203543, 0.6783729, 1, 0, 0.7137255, 1,
1.195061, 1.154617, 1.464998, 1, 0, 0.7098039, 1,
1.195952, -0.7863188, 2.132032, 1, 0, 0.7019608, 1,
1.198116, 1.608631, 0.8560752, 1, 0, 0.6941177, 1,
1.205792, -0.08264881, 0.2654725, 1, 0, 0.6901961, 1,
1.210027, 0.3398871, 0.5358075, 1, 0, 0.682353, 1,
1.216981, -1.273941, 1.512995, 1, 0, 0.6784314, 1,
1.227891, 0.03203773, 1.059708, 1, 0, 0.6705883, 1,
1.230126, -1.910063, 3.928086, 1, 0, 0.6666667, 1,
1.231414, -0.2246733, 1.216537, 1, 0, 0.6588235, 1,
1.235433, 1.238294, 1.409945, 1, 0, 0.654902, 1,
1.236152, -0.8237288, 2.040286, 1, 0, 0.6470588, 1,
1.236927, 0.006350987, 0.1108629, 1, 0, 0.6431373, 1,
1.244583, -1.115446, 2.941695, 1, 0, 0.6352941, 1,
1.254673, 0.3793593, 1.404419, 1, 0, 0.6313726, 1,
1.260242, -1.772565, 2.087325, 1, 0, 0.6235294, 1,
1.264156, 1.707208, 0.7375143, 1, 0, 0.6196079, 1,
1.264876, 0.7882562, 1.0441, 1, 0, 0.6117647, 1,
1.269835, 0.1261261, -0.4497595, 1, 0, 0.6078432, 1,
1.285668, -0.1054678, 2.764399, 1, 0, 0.6, 1,
1.28998, 0.1919114, 1.236663, 1, 0, 0.5921569, 1,
1.290516, -1.300865, 2.637118, 1, 0, 0.5882353, 1,
1.297693, 0.4901176, 1.520989, 1, 0, 0.5803922, 1,
1.299577, 0.7222452, 1.219883, 1, 0, 0.5764706, 1,
1.301426, 0.5741356, 1.074279, 1, 0, 0.5686275, 1,
1.302412, 0.9195158, 0.5676611, 1, 0, 0.5647059, 1,
1.305696, 0.9744042, 0.6830631, 1, 0, 0.5568628, 1,
1.305744, -0.6945879, 0.5490131, 1, 0, 0.5529412, 1,
1.311324, -0.3952402, 3.317744, 1, 0, 0.5450981, 1,
1.315586, -0.02012412, 2.113312, 1, 0, 0.5411765, 1,
1.31754, -1.015073, 1.778422, 1, 0, 0.5333334, 1,
1.333246, -0.1488775, -0.01122116, 1, 0, 0.5294118, 1,
1.337632, 0.5249564, 1.318673, 1, 0, 0.5215687, 1,
1.341294, -0.2023336, 0.6982227, 1, 0, 0.5176471, 1,
1.342423, 1.406253, -0.5964597, 1, 0, 0.509804, 1,
1.34265, -1.447114, 1.479122, 1, 0, 0.5058824, 1,
1.345764, -0.4548196, 1.984912, 1, 0, 0.4980392, 1,
1.347492, -2.605966, 0.9971485, 1, 0, 0.4901961, 1,
1.351143, -0.2768229, 1.864393, 1, 0, 0.4862745, 1,
1.356759, 0.04385622, 0.08602675, 1, 0, 0.4784314, 1,
1.362905, 0.006119748, 1.013408, 1, 0, 0.4745098, 1,
1.363845, 0.8187704, 1.623564, 1, 0, 0.4666667, 1,
1.366005, -0.9900936, 1.450587, 1, 0, 0.4627451, 1,
1.386327, -1.149042, 3.204645, 1, 0, 0.454902, 1,
1.388568, 0.220593, 1.530977, 1, 0, 0.4509804, 1,
1.419071, 0.2639266, 0.823993, 1, 0, 0.4431373, 1,
1.423121, 0.1402792, 1.058553, 1, 0, 0.4392157, 1,
1.425902, 1.159651, 0.8364783, 1, 0, 0.4313726, 1,
1.426324, -1.065943, 1.629672, 1, 0, 0.427451, 1,
1.453053, -1.112621, 3.867033, 1, 0, 0.4196078, 1,
1.456282, -0.0004592345, 3.032373, 1, 0, 0.4156863, 1,
1.47052, -1.505496, 1.617122, 1, 0, 0.4078431, 1,
1.484341, 0.03639813, 1.236791, 1, 0, 0.4039216, 1,
1.498378, -0.1708363, 1.48754, 1, 0, 0.3960784, 1,
1.501508, 0.2625467, 1.735996, 1, 0, 0.3882353, 1,
1.507388, 1.039441, 3.305273, 1, 0, 0.3843137, 1,
1.507636, -1.090338, 0.6912828, 1, 0, 0.3764706, 1,
1.5112, 1.408375, 1.12914, 1, 0, 0.372549, 1,
1.53662, -1.028959, 3.629271, 1, 0, 0.3647059, 1,
1.553835, 0.228377, 1.070043, 1, 0, 0.3607843, 1,
1.588386, 1.459833, 0.3017482, 1, 0, 0.3529412, 1,
1.606308, 0.05477079, 2.438872, 1, 0, 0.3490196, 1,
1.609037, 0.8831985, 0.5894933, 1, 0, 0.3411765, 1,
1.632297, 0.05976958, 2.443321, 1, 0, 0.3372549, 1,
1.662369, -0.316085, 2.597715, 1, 0, 0.3294118, 1,
1.663557, 0.465232, 1.285095, 1, 0, 0.3254902, 1,
1.675716, -1.425978, 1.774261, 1, 0, 0.3176471, 1,
1.688404, -0.2395463, 2.250891, 1, 0, 0.3137255, 1,
1.692408, -0.1503208, 0.2891187, 1, 0, 0.3058824, 1,
1.693343, 1.337344, 1.343757, 1, 0, 0.2980392, 1,
1.716555, -1.6018, 2.208868, 1, 0, 0.2941177, 1,
1.718239, 1.041538, -0.07778586, 1, 0, 0.2862745, 1,
1.725243, 1.356544, 1.991436, 1, 0, 0.282353, 1,
1.731068, 1.000506, 1.692955, 1, 0, 0.2745098, 1,
1.737373, -0.2056869, 2.149287, 1, 0, 0.2705882, 1,
1.753324, 0.9028952, 1.724183, 1, 0, 0.2627451, 1,
1.76823, 0.4130206, 0.7268562, 1, 0, 0.2588235, 1,
1.783322, 0.07419691, 0.2994607, 1, 0, 0.2509804, 1,
1.793363, 1.79142, 1.547324, 1, 0, 0.2470588, 1,
1.799102, -0.8299079, 1.790269, 1, 0, 0.2392157, 1,
1.810667, -0.294935, 3.44837, 1, 0, 0.2352941, 1,
1.821271, -1.200022, 1.433774, 1, 0, 0.227451, 1,
1.822881, 0.2185791, 2.125702, 1, 0, 0.2235294, 1,
1.825779, 0.9572418, 1.042038, 1, 0, 0.2156863, 1,
1.857942, 0.1656935, 0.6619406, 1, 0, 0.2117647, 1,
1.873923, -0.0278265, 1.328135, 1, 0, 0.2039216, 1,
1.895183, -1.095399, 2.386911, 1, 0, 0.1960784, 1,
1.911594, -0.4502002, 2.928062, 1, 0, 0.1921569, 1,
1.912888, 0.2879697, 2.720174, 1, 0, 0.1843137, 1,
1.914108, -0.5094606, 0.7620788, 1, 0, 0.1803922, 1,
1.958707, 0.01441643, 1.814267, 1, 0, 0.172549, 1,
2.016628, 0.6307757, 0.4061844, 1, 0, 0.1686275, 1,
2.024304, 1.571537, 2.336135, 1, 0, 0.1607843, 1,
2.059378, -0.8875303, 2.095771, 1, 0, 0.1568628, 1,
2.071512, 0.9034146, 0.2998887, 1, 0, 0.1490196, 1,
2.083569, 0.5676662, 0.6734436, 1, 0, 0.145098, 1,
2.088358, -0.09668687, 0.9516152, 1, 0, 0.1372549, 1,
2.118656, -0.06796409, 0.2573426, 1, 0, 0.1333333, 1,
2.146178, -0.8824819, 0.9407294, 1, 0, 0.1254902, 1,
2.16212, 0.8714513, 2.523448, 1, 0, 0.1215686, 1,
2.182773, 1.686856, 1.624809, 1, 0, 0.1137255, 1,
2.195271, -0.5256711, 3.472417, 1, 0, 0.1098039, 1,
2.249491, 1.373887, 0.7249765, 1, 0, 0.1019608, 1,
2.284702, 1.576118, 0.7035336, 1, 0, 0.09411765, 1,
2.286705, -1.679771, 4.26914, 1, 0, 0.09019608, 1,
2.296405, 1.270874, 1.229621, 1, 0, 0.08235294, 1,
2.347999, 1.69597, 0.2840976, 1, 0, 0.07843138, 1,
2.359614, 0.1500629, 0.8433377, 1, 0, 0.07058824, 1,
2.359982, -0.5043518, 2.032358, 1, 0, 0.06666667, 1,
2.421293, 1.142308, 0.2269246, 1, 0, 0.05882353, 1,
2.468928, 0.1407545, 1.238171, 1, 0, 0.05490196, 1,
2.496633, 1.446483, -0.3301368, 1, 0, 0.04705882, 1,
2.499904, -0.3768073, 1.413648, 1, 0, 0.04313726, 1,
2.523528, 0.8278839, 0.939141, 1, 0, 0.03529412, 1,
2.619411, -0.5058926, 2.164992, 1, 0, 0.03137255, 1,
2.7112, -1.718923, 3.054358, 1, 0, 0.02352941, 1,
2.89144, -0.9493583, 1.550322, 1, 0, 0.01960784, 1,
2.907154, -1.480223, 3.076097, 1, 0, 0.01176471, 1,
3.315134, 0.8186652, 0.9479604, 1, 0, 0.007843138, 1
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
0.2945565, -4.389719, -7.097876, 0, -0.5, 0.5, 0.5,
0.2945565, -4.389719, -7.097876, 1, -0.5, 0.5, 0.5,
0.2945565, -4.389719, -7.097876, 1, 1.5, 0.5, 0.5,
0.2945565, -4.389719, -7.097876, 0, 1.5, 0.5, 0.5
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
-3.749996, -0.2925973, -7.097876, 0, -0.5, 0.5, 0.5,
-3.749996, -0.2925973, -7.097876, 1, -0.5, 0.5, 0.5,
-3.749996, -0.2925973, -7.097876, 1, 1.5, 0.5, 0.5,
-3.749996, -0.2925973, -7.097876, 0, 1.5, 0.5, 0.5
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
-3.749996, -4.389719, -0.05875993, 0, -0.5, 0.5, 0.5,
-3.749996, -4.389719, -0.05875993, 1, -0.5, 0.5, 0.5,
-3.749996, -4.389719, -0.05875993, 1, 1.5, 0.5, 0.5,
-3.749996, -4.389719, -0.05875993, 0, 1.5, 0.5, 0.5
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
-2, -3.44423, -5.473464,
3, -3.44423, -5.473464,
-2, -3.44423, -5.473464,
-2, -3.601811, -5.744199,
-1, -3.44423, -5.473464,
-1, -3.601811, -5.744199,
0, -3.44423, -5.473464,
0, -3.601811, -5.744199,
1, -3.44423, -5.473464,
1, -3.601811, -5.744199,
2, -3.44423, -5.473464,
2, -3.601811, -5.744199,
3, -3.44423, -5.473464,
3, -3.601811, -5.744199
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
-2, -3.916974, -6.28567, 0, -0.5, 0.5, 0.5,
-2, -3.916974, -6.28567, 1, -0.5, 0.5, 0.5,
-2, -3.916974, -6.28567, 1, 1.5, 0.5, 0.5,
-2, -3.916974, -6.28567, 0, 1.5, 0.5, 0.5,
-1, -3.916974, -6.28567, 0, -0.5, 0.5, 0.5,
-1, -3.916974, -6.28567, 1, -0.5, 0.5, 0.5,
-1, -3.916974, -6.28567, 1, 1.5, 0.5, 0.5,
-1, -3.916974, -6.28567, 0, 1.5, 0.5, 0.5,
0, -3.916974, -6.28567, 0, -0.5, 0.5, 0.5,
0, -3.916974, -6.28567, 1, -0.5, 0.5, 0.5,
0, -3.916974, -6.28567, 1, 1.5, 0.5, 0.5,
0, -3.916974, -6.28567, 0, 1.5, 0.5, 0.5,
1, -3.916974, -6.28567, 0, -0.5, 0.5, 0.5,
1, -3.916974, -6.28567, 1, -0.5, 0.5, 0.5,
1, -3.916974, -6.28567, 1, 1.5, 0.5, 0.5,
1, -3.916974, -6.28567, 0, 1.5, 0.5, 0.5,
2, -3.916974, -6.28567, 0, -0.5, 0.5, 0.5,
2, -3.916974, -6.28567, 1, -0.5, 0.5, 0.5,
2, -3.916974, -6.28567, 1, 1.5, 0.5, 0.5,
2, -3.916974, -6.28567, 0, 1.5, 0.5, 0.5,
3, -3.916974, -6.28567, 0, -0.5, 0.5, 0.5,
3, -3.916974, -6.28567, 1, -0.5, 0.5, 0.5,
3, -3.916974, -6.28567, 1, 1.5, 0.5, 0.5,
3, -3.916974, -6.28567, 0, 1.5, 0.5, 0.5
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
-2.816638, -3, -5.473464,
-2.816638, 2, -5.473464,
-2.816638, -3, -5.473464,
-2.972198, -3, -5.744199,
-2.816638, -2, -5.473464,
-2.972198, -2, -5.744199,
-2.816638, -1, -5.473464,
-2.972198, -1, -5.744199,
-2.816638, 0, -5.473464,
-2.972198, 0, -5.744199,
-2.816638, 1, -5.473464,
-2.972198, 1, -5.744199,
-2.816638, 2, -5.473464,
-2.972198, 2, -5.744199
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
-3.283317, -3, -6.28567, 0, -0.5, 0.5, 0.5,
-3.283317, -3, -6.28567, 1, -0.5, 0.5, 0.5,
-3.283317, -3, -6.28567, 1, 1.5, 0.5, 0.5,
-3.283317, -3, -6.28567, 0, 1.5, 0.5, 0.5,
-3.283317, -2, -6.28567, 0, -0.5, 0.5, 0.5,
-3.283317, -2, -6.28567, 1, -0.5, 0.5, 0.5,
-3.283317, -2, -6.28567, 1, 1.5, 0.5, 0.5,
-3.283317, -2, -6.28567, 0, 1.5, 0.5, 0.5,
-3.283317, -1, -6.28567, 0, -0.5, 0.5, 0.5,
-3.283317, -1, -6.28567, 1, -0.5, 0.5, 0.5,
-3.283317, -1, -6.28567, 1, 1.5, 0.5, 0.5,
-3.283317, -1, -6.28567, 0, 1.5, 0.5, 0.5,
-3.283317, 0, -6.28567, 0, -0.5, 0.5, 0.5,
-3.283317, 0, -6.28567, 1, -0.5, 0.5, 0.5,
-3.283317, 0, -6.28567, 1, 1.5, 0.5, 0.5,
-3.283317, 0, -6.28567, 0, 1.5, 0.5, 0.5,
-3.283317, 1, -6.28567, 0, -0.5, 0.5, 0.5,
-3.283317, 1, -6.28567, 1, -0.5, 0.5, 0.5,
-3.283317, 1, -6.28567, 1, 1.5, 0.5, 0.5,
-3.283317, 1, -6.28567, 0, 1.5, 0.5, 0.5,
-3.283317, 2, -6.28567, 0, -0.5, 0.5, 0.5,
-3.283317, 2, -6.28567, 1, -0.5, 0.5, 0.5,
-3.283317, 2, -6.28567, 1, 1.5, 0.5, 0.5,
-3.283317, 2, -6.28567, 0, 1.5, 0.5, 0.5
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
-2.816638, -3.44423, -4,
-2.816638, -3.44423, 4,
-2.816638, -3.44423, -4,
-2.972198, -3.601811, -4,
-2.816638, -3.44423, -2,
-2.972198, -3.601811, -2,
-2.816638, -3.44423, 0,
-2.972198, -3.601811, 0,
-2.816638, -3.44423, 2,
-2.972198, -3.601811, 2,
-2.816638, -3.44423, 4,
-2.972198, -3.601811, 4
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
-3.283317, -3.916974, -4, 0, -0.5, 0.5, 0.5,
-3.283317, -3.916974, -4, 1, -0.5, 0.5, 0.5,
-3.283317, -3.916974, -4, 1, 1.5, 0.5, 0.5,
-3.283317, -3.916974, -4, 0, 1.5, 0.5, 0.5,
-3.283317, -3.916974, -2, 0, -0.5, 0.5, 0.5,
-3.283317, -3.916974, -2, 1, -0.5, 0.5, 0.5,
-3.283317, -3.916974, -2, 1, 1.5, 0.5, 0.5,
-3.283317, -3.916974, -2, 0, 1.5, 0.5, 0.5,
-3.283317, -3.916974, 0, 0, -0.5, 0.5, 0.5,
-3.283317, -3.916974, 0, 1, -0.5, 0.5, 0.5,
-3.283317, -3.916974, 0, 1, 1.5, 0.5, 0.5,
-3.283317, -3.916974, 0, 0, 1.5, 0.5, 0.5,
-3.283317, -3.916974, 2, 0, -0.5, 0.5, 0.5,
-3.283317, -3.916974, 2, 1, -0.5, 0.5, 0.5,
-3.283317, -3.916974, 2, 1, 1.5, 0.5, 0.5,
-3.283317, -3.916974, 2, 0, 1.5, 0.5, 0.5,
-3.283317, -3.916974, 4, 0, -0.5, 0.5, 0.5,
-3.283317, -3.916974, 4, 1, -0.5, 0.5, 0.5,
-3.283317, -3.916974, 4, 1, 1.5, 0.5, 0.5,
-3.283317, -3.916974, 4, 0, 1.5, 0.5, 0.5
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
-2.816638, -3.44423, -5.473464,
-2.816638, 2.859035, -5.473464,
-2.816638, -3.44423, 5.355944,
-2.816638, 2.859035, 5.355944,
-2.816638, -3.44423, -5.473464,
-2.816638, -3.44423, 5.355944,
-2.816638, 2.859035, -5.473464,
-2.816638, 2.859035, 5.355944,
-2.816638, -3.44423, -5.473464,
3.405751, -3.44423, -5.473464,
-2.816638, -3.44423, 5.355944,
3.405751, -3.44423, 5.355944,
-2.816638, 2.859035, -5.473464,
3.405751, 2.859035, -5.473464,
-2.816638, 2.859035, 5.355944,
3.405751, 2.859035, 5.355944,
3.405751, -3.44423, -5.473464,
3.405751, 2.859035, -5.473464,
3.405751, -3.44423, 5.355944,
3.405751, 2.859035, 5.355944,
3.405751, -3.44423, -5.473464,
3.405751, -3.44423, 5.355944,
3.405751, 2.859035, -5.473464,
3.405751, 2.859035, 5.355944
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
var radius = 7.470489;
var distance = 33.23705;
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
mvMatrix.translate( -0.2945565, 0.2925973, 0.05875993 );
mvMatrix.scale( 1.298093, 1.281437, 0.7458615 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.23705);
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
methfuroxam<-read.table("methfuroxam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methfuroxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
```

```r
y<-methfuroxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
```

```r
z<-methfuroxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
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
-2.726021, 2.110123, -0.6349403, 0, 0, 1, 1, 1,
-2.565985, 0.7446123, 0.3362835, 1, 0, 0, 1, 1,
-2.534342, 0.004627118, -1.111119, 1, 0, 0, 1, 1,
-2.531939, -0.7586324, -0.866298, 1, 0, 0, 1, 1,
-2.462322, 1.677413, -0.7737496, 1, 0, 0, 1, 1,
-2.411526, 1.330386, -2.076048, 1, 0, 0, 1, 1,
-2.381281, -0.2881364, -0.07194898, 0, 0, 0, 1, 1,
-2.367216, -0.08016197, -0.1988772, 0, 0, 0, 1, 1,
-2.294681, 1.195887, 0.6176415, 0, 0, 0, 1, 1,
-2.290841, 1.971454, -0.3509715, 0, 0, 0, 1, 1,
-2.26474, -0.3642082, -3.0756, 0, 0, 0, 1, 1,
-2.260146, -0.8084828, -3.100216, 0, 0, 0, 1, 1,
-2.247925, 0.5464945, -0.5551733, 0, 0, 0, 1, 1,
-2.229849, 0.2949705, -0.8057875, 1, 1, 1, 1, 1,
-2.179844, -0.05302329, -1.481871, 1, 1, 1, 1, 1,
-2.164222, 0.4361317, 0.03104611, 1, 1, 1, 1, 1,
-2.093778, -1.338154, -2.869771, 1, 1, 1, 1, 1,
-2.06652, 1.088021, -1.575903, 1, 1, 1, 1, 1,
-2.044664, -0.0794708, 0.76767, 1, 1, 1, 1, 1,
-2.044615, 0.6623989, -3.922131, 1, 1, 1, 1, 1,
-2.044243, 0.2757472, -2.26708, 1, 1, 1, 1, 1,
-2.043174, 1.176445, -0.6552163, 1, 1, 1, 1, 1,
-2.026911, -1.101574, -1.997948, 1, 1, 1, 1, 1,
-2.011953, 1.045488, -0.2692675, 1, 1, 1, 1, 1,
-1.994702, 0.6845915, -1.608163, 1, 1, 1, 1, 1,
-1.976339, 2.34567, -1.361366, 1, 1, 1, 1, 1,
-1.947067, 1.519186, -1.566073, 1, 1, 1, 1, 1,
-1.94407, 0.693024, -1.927033, 1, 1, 1, 1, 1,
-1.888503, -0.2397264, 0.6738673, 0, 0, 1, 1, 1,
-1.881367, -0.9329716, -0.9704553, 1, 0, 0, 1, 1,
-1.858636, 0.8871743, -1.10929, 1, 0, 0, 1, 1,
-1.854515, 1.508821, -1.558365, 1, 0, 0, 1, 1,
-1.842387, 0.3730575, -1.38713, 1, 0, 0, 1, 1,
-1.842263, -0.8979682, -3.227964, 1, 0, 0, 1, 1,
-1.836533, -0.4840285, -0.2923266, 0, 0, 0, 1, 1,
-1.835801, 0.1186258, -2.016833, 0, 0, 0, 1, 1,
-1.831729, 0.8532749, -0.4101297, 0, 0, 0, 1, 1,
-1.826482, -0.826279, -2.284837, 0, 0, 0, 1, 1,
-1.825929, -0.6931188, -2.142955, 0, 0, 0, 1, 1,
-1.815197, -1.670543, -3.330407, 0, 0, 0, 1, 1,
-1.785715, 0.6795303, -0.5493718, 0, 0, 0, 1, 1,
-1.747317, -1.299111, -2.27754, 1, 1, 1, 1, 1,
-1.740809, 0.06192343, -0.895164, 1, 1, 1, 1, 1,
-1.721787, 0.07305284, 0.902888, 1, 1, 1, 1, 1,
-1.72089, -1.082939, -4.053927, 1, 1, 1, 1, 1,
-1.710551, 2.167715, -1.581977, 1, 1, 1, 1, 1,
-1.672701, -0.2433464, -1.723994, 1, 1, 1, 1, 1,
-1.657227, 0.6973475, -1.59149, 1, 1, 1, 1, 1,
-1.656357, 1.079754, -0.6318979, 1, 1, 1, 1, 1,
-1.640898, 0.009803723, -1.414017, 1, 1, 1, 1, 1,
-1.63654, -0.9667934, -3.641962, 1, 1, 1, 1, 1,
-1.629156, -0.6806083, -1.936697, 1, 1, 1, 1, 1,
-1.626457, 0.2447885, -0.6912823, 1, 1, 1, 1, 1,
-1.621682, 0.02510715, -1.339418, 1, 1, 1, 1, 1,
-1.617441, -0.5866734, -0.3647063, 1, 1, 1, 1, 1,
-1.617348, -0.04265494, -1.187081, 1, 1, 1, 1, 1,
-1.610451, -0.7059067, -3.913168, 0, 0, 1, 1, 1,
-1.601718, -0.7283822, -1.963294, 1, 0, 0, 1, 1,
-1.594463, 1.380619, -1.871546, 1, 0, 0, 1, 1,
-1.589144, -0.3047151, -1.957081, 1, 0, 0, 1, 1,
-1.552854, 0.3613276, -2.826783, 1, 0, 0, 1, 1,
-1.546459, -1.404443, -1.918961, 1, 0, 0, 1, 1,
-1.525039, -1.979603, -1.675331, 0, 0, 0, 1, 1,
-1.522296, -1.171841, -3.68146, 0, 0, 0, 1, 1,
-1.496914, 1.025926, -1.54879, 0, 0, 0, 1, 1,
-1.491702, 1.586433, 0.6461276, 0, 0, 0, 1, 1,
-1.482901, 2.300934, 0.1028874, 0, 0, 0, 1, 1,
-1.480737, -0.8861225, -3.194697, 0, 0, 0, 1, 1,
-1.477893, 1.492252, -0.2132412, 0, 0, 0, 1, 1,
-1.471988, 2.598722, -0.8042463, 1, 1, 1, 1, 1,
-1.461836, -0.0461552, -3.181675, 1, 1, 1, 1, 1,
-1.457544, -0.03873951, 0.008436471, 1, 1, 1, 1, 1,
-1.446627, -0.6406398, -1.259173, 1, 1, 1, 1, 1,
-1.438975, -0.757518, -0.1857048, 1, 1, 1, 1, 1,
-1.433516, -1.137455, -3.403563, 1, 1, 1, 1, 1,
-1.430707, -0.0571584, -0.8067211, 1, 1, 1, 1, 1,
-1.410897, 0.1471834, 1.101304, 1, 1, 1, 1, 1,
-1.408747, 0.1326864, -2.056839, 1, 1, 1, 1, 1,
-1.407524, 0.9407713, -0.09409605, 1, 1, 1, 1, 1,
-1.393642, 0.9379354, -2.702377, 1, 1, 1, 1, 1,
-1.389152, -1.321831, -2.880481, 1, 1, 1, 1, 1,
-1.388584, 1.805326, -1.549598, 1, 1, 1, 1, 1,
-1.384062, -0.9996641, -2.650324, 1, 1, 1, 1, 1,
-1.37436, 0.01532369, -0.6470228, 1, 1, 1, 1, 1,
-1.357042, -0.03680528, -2.406542, 0, 0, 1, 1, 1,
-1.356839, 2.327358, 0.9939616, 1, 0, 0, 1, 1,
-1.354681, 0.915374, -1.686906, 1, 0, 0, 1, 1,
-1.352392, -2.086159, -1.089524, 1, 0, 0, 1, 1,
-1.352287, -0.3535985, -1.523871, 1, 0, 0, 1, 1,
-1.350833, -0.7842889, -3.715171, 1, 0, 0, 1, 1,
-1.347778, 1.111557, -0.9775587, 0, 0, 0, 1, 1,
-1.347509, -1.081431, -3.898649, 0, 0, 0, 1, 1,
-1.342734, 0.6201246, -1.271482, 0, 0, 0, 1, 1,
-1.33331, 0.792953, -1.604792, 0, 0, 0, 1, 1,
-1.326739, 0.1836383, -1.106699, 0, 0, 0, 1, 1,
-1.312664, 0.4754258, 0.1398004, 0, 0, 0, 1, 1,
-1.308687, 1.229935, -0.01612077, 0, 0, 0, 1, 1,
-1.307828, 1.881413, 1.607667, 1, 1, 1, 1, 1,
-1.295297, -0.970158, -2.835452, 1, 1, 1, 1, 1,
-1.287434, 0.3346657, -2.09516, 1, 1, 1, 1, 1,
-1.287252, -0.5653313, -2.950886, 1, 1, 1, 1, 1,
-1.2802, -2.149029, -2.396346, 1, 1, 1, 1, 1,
-1.273007, -2.079544, -1.566427, 1, 1, 1, 1, 1,
-1.272447, -1.657817, -2.293087, 1, 1, 1, 1, 1,
-1.264863, -0.07381872, 0.1058447, 1, 1, 1, 1, 1,
-1.259254, -0.1394155, -2.209195, 1, 1, 1, 1, 1,
-1.249786, -1.840204, -1.598184, 1, 1, 1, 1, 1,
-1.248939, -0.683, 0.112767, 1, 1, 1, 1, 1,
-1.248583, 0.6468417, 1.100153, 1, 1, 1, 1, 1,
-1.245159, 0.422768, -0.7209139, 1, 1, 1, 1, 1,
-1.245049, -0.8415962, -3.101655, 1, 1, 1, 1, 1,
-1.239879, 0.3766519, -1.678321, 1, 1, 1, 1, 1,
-1.228426, -0.3260916, -1.83545, 0, 0, 1, 1, 1,
-1.227809, 0.3815837, -0.5815768, 1, 0, 0, 1, 1,
-1.227715, -0.2419511, -1.799718, 1, 0, 0, 1, 1,
-1.22363, -0.5075603, -3.161261, 1, 0, 0, 1, 1,
-1.217903, -0.1066196, -1.678717, 1, 0, 0, 1, 1,
-1.213413, -1.00433, -2.132144, 1, 0, 0, 1, 1,
-1.205652, 0.6078967, -2.165515, 0, 0, 0, 1, 1,
-1.205169, 0.2205558, -1.70883, 0, 0, 0, 1, 1,
-1.199819, -1.274634, -1.157989, 0, 0, 0, 1, 1,
-1.198263, 0.9354852, 0.473832, 0, 0, 0, 1, 1,
-1.196273, 1.939704, -0.9477926, 0, 0, 0, 1, 1,
-1.189959, -1.217534, -3.431851, 0, 0, 0, 1, 1,
-1.185612, 1.491807, 0.3197985, 0, 0, 0, 1, 1,
-1.181334, -1.159133, -0.4622675, 1, 1, 1, 1, 1,
-1.179338, 0.705155, 0.5036699, 1, 1, 1, 1, 1,
-1.17468, 0.373235, -2.722213, 1, 1, 1, 1, 1,
-1.173313, 0.3502453, -0.7899715, 1, 1, 1, 1, 1,
-1.172605, 0.3498489, -0.9968311, 1, 1, 1, 1, 1,
-1.172136, 0.1155383, -1.557956, 1, 1, 1, 1, 1,
-1.162868, 1.390713, -0.9955034, 1, 1, 1, 1, 1,
-1.15953, -1.114966, -3.789271, 1, 1, 1, 1, 1,
-1.156936, 0.08694758, -0.7440847, 1, 1, 1, 1, 1,
-1.134642, 0.4951365, 0.2053924, 1, 1, 1, 1, 1,
-1.12244, 0.4758942, -2.757595, 1, 1, 1, 1, 1,
-1.120755, 1.388324, -2.064666, 1, 1, 1, 1, 1,
-1.106335, 0.4150478, -1.665214, 1, 1, 1, 1, 1,
-1.105254, 1.32858, 0.3725705, 1, 1, 1, 1, 1,
-1.098277, 1.958857, -0.5115044, 1, 1, 1, 1, 1,
-1.094268, -0.6226062, -3.329522, 0, 0, 1, 1, 1,
-1.093068, -1.517737, -1.945079, 1, 0, 0, 1, 1,
-1.092805, 2.600713, -1.065726, 1, 0, 0, 1, 1,
-1.087605, -2.054774, -2.050145, 1, 0, 0, 1, 1,
-1.085805, 1.076753, -2.455757, 1, 0, 0, 1, 1,
-1.076466, 1.074068, 0.07174553, 1, 0, 0, 1, 1,
-1.072901, -3.034223, -1.815043, 0, 0, 0, 1, 1,
-1.067996, 0.1983263, -2.575794, 0, 0, 0, 1, 1,
-1.063828, 0.3157052, 0.4975721, 0, 0, 0, 1, 1,
-1.061728, 1.133093, 0.5198871, 0, 0, 0, 1, 1,
-1.060861, -1.604366, -2.478949, 0, 0, 0, 1, 1,
-1.04858, 0.09502395, -1.385978, 0, 0, 0, 1, 1,
-1.046914, -0.9787028, -3.22198, 0, 0, 0, 1, 1,
-1.045393, -0.6428457, -2.66494, 1, 1, 1, 1, 1,
-1.044232, 0.3848578, -0.8021467, 1, 1, 1, 1, 1,
-1.042616, 0.562389, -0.6195489, 1, 1, 1, 1, 1,
-1.040204, 0.2280193, -1.506719, 1, 1, 1, 1, 1,
-1.032303, 0.2688394, -2.242273, 1, 1, 1, 1, 1,
-1.022836, 0.523558, -1.777155, 1, 1, 1, 1, 1,
-1.022801, 0.5231277, -0.1165358, 1, 1, 1, 1, 1,
-1.018867, -0.1746314, -2.851058, 1, 1, 1, 1, 1,
-1.016468, -2.138657, -1.820263, 1, 1, 1, 1, 1,
-1.013302, 1.064225, 0.4548584, 1, 1, 1, 1, 1,
-1.008621, 0.7079338, 0.06900094, 1, 1, 1, 1, 1,
-1.005769, -0.1237492, 0.3219068, 1, 1, 1, 1, 1,
-1.002967, -0.6174991, 0.4522676, 1, 1, 1, 1, 1,
-1.001823, 0.4317971, -0.5086622, 1, 1, 1, 1, 1,
-1.000725, -0.72975, -2.356982, 1, 1, 1, 1, 1,
-0.9998153, -0.900982, -2.453163, 0, 0, 1, 1, 1,
-0.9989319, -0.8905376, -1.984501, 1, 0, 0, 1, 1,
-0.9926255, -0.7030781, -1.095092, 1, 0, 0, 1, 1,
-0.9917278, 0.08921397, -0.9250079, 1, 0, 0, 1, 1,
-0.9913879, -1.268596, -3.078532, 1, 0, 0, 1, 1,
-0.9872565, 0.8810839, -0.2560381, 1, 0, 0, 1, 1,
-0.9869878, -1.921409, -1.894267, 0, 0, 0, 1, 1,
-0.9721826, 0.5344811, -1.714799, 0, 0, 0, 1, 1,
-0.9671746, -0.6717188, -1.126123, 0, 0, 0, 1, 1,
-0.9659813, 0.4807376, -2.354836, 0, 0, 0, 1, 1,
-0.9653214, 0.09624779, -0.6687094, 0, 0, 0, 1, 1,
-0.9621521, 1.252128, -1.190646, 0, 0, 0, 1, 1,
-0.960861, 0.9117206, -1.627433, 0, 0, 0, 1, 1,
-0.9445392, -1.085751, -4.395702, 1, 1, 1, 1, 1,
-0.942529, 0.6475788, -2.973625, 1, 1, 1, 1, 1,
-0.9396573, -0.607136, -3.856533, 1, 1, 1, 1, 1,
-0.9380519, -0.5609202, -2.589092, 1, 1, 1, 1, 1,
-0.9289464, -2.227242, -2.384718, 1, 1, 1, 1, 1,
-0.9283957, -0.4180951, -2.135363, 1, 1, 1, 1, 1,
-0.9164656, -0.1288479, -0.9938004, 1, 1, 1, 1, 1,
-0.9109942, -0.2834469, -1.473414, 1, 1, 1, 1, 1,
-0.9078901, 1.123216, -1.598966, 1, 1, 1, 1, 1,
-0.9072341, 0.06801303, -2.608707, 1, 1, 1, 1, 1,
-0.9067784, -0.3534961, -1.690114, 1, 1, 1, 1, 1,
-0.9010473, -2.177075, -2.025628, 1, 1, 1, 1, 1,
-0.8974399, 0.140405, -0.8295632, 1, 1, 1, 1, 1,
-0.8831353, -1.625275, -2.263606, 1, 1, 1, 1, 1,
-0.8785573, -1.721124, -3.357095, 1, 1, 1, 1, 1,
-0.8781043, -1.289501, -4.003763, 0, 0, 1, 1, 1,
-0.8754063, 0.7910419, 0.9601715, 1, 0, 0, 1, 1,
-0.8730678, -0.4910507, -2.343584, 1, 0, 0, 1, 1,
-0.8728162, 0.2371195, 0.6266285, 1, 0, 0, 1, 1,
-0.8686836, -1.038149, -2.767607, 1, 0, 0, 1, 1,
-0.862045, -0.5753278, -1.998018, 1, 0, 0, 1, 1,
-0.8609995, -1.989641, -3.815012, 0, 0, 0, 1, 1,
-0.860921, 1.552934, 1.397268, 0, 0, 0, 1, 1,
-0.8563954, -1.32217, -2.291565, 0, 0, 0, 1, 1,
-0.856095, 0.7522769, -0.6748306, 0, 0, 0, 1, 1,
-0.8553506, 0.5694987, -0.9558943, 0, 0, 0, 1, 1,
-0.8553066, 1.034023, -1.95058, 0, 0, 0, 1, 1,
-0.8520027, -0.7965475, -2.121784, 0, 0, 0, 1, 1,
-0.8518504, 1.721448, -1.325885, 1, 1, 1, 1, 1,
-0.8430405, 1.030638, 0.3107879, 1, 1, 1, 1, 1,
-0.8305803, 0.418101, 0.1735576, 1, 1, 1, 1, 1,
-0.8294319, -1.454772, -2.609748, 1, 1, 1, 1, 1,
-0.8241286, -3.202307, -2.923299, 1, 1, 1, 1, 1,
-0.8213807, -0.008970711, -0.6203292, 1, 1, 1, 1, 1,
-0.8208101, -1.131693, -4.298653, 1, 1, 1, 1, 1,
-0.8192537, -1.056519, -1.722835, 1, 1, 1, 1, 1,
-0.8192247, -0.7441521, -2.558006, 1, 1, 1, 1, 1,
-0.8188704, 0.06560423, -0.65809, 1, 1, 1, 1, 1,
-0.8055795, -0.4732828, -2.114249, 1, 1, 1, 1, 1,
-0.8038534, 1.049466, -2.333344, 1, 1, 1, 1, 1,
-0.8027269, -0.6558865, -1.111087, 1, 1, 1, 1, 1,
-0.8019143, -0.845765, -2.813873, 1, 1, 1, 1, 1,
-0.7809968, -0.04149681, -2.9103, 1, 1, 1, 1, 1,
-0.7738833, 0.5954937, -0.1611488, 0, 0, 1, 1, 1,
-0.7655308, 0.731378, -1.690466, 1, 0, 0, 1, 1,
-0.7582747, -0.09484518, -3.152847, 1, 0, 0, 1, 1,
-0.7581614, -0.9645959, -3.06909, 1, 0, 0, 1, 1,
-0.7524026, 0.6352405, -0.4929965, 1, 0, 0, 1, 1,
-0.7522419, 1.336631, -0.01088979, 1, 0, 0, 1, 1,
-0.7469835, -0.5312223, -3.621537, 0, 0, 0, 1, 1,
-0.7407476, -1.070808, -3.069235, 0, 0, 0, 1, 1,
-0.739942, 1.427827, -0.1273559, 0, 0, 0, 1, 1,
-0.7336187, 1.756383, -0.5241245, 0, 0, 0, 1, 1,
-0.7274026, 0.684699, 0.09979151, 0, 0, 0, 1, 1,
-0.7228116, -0.3042818, -0.2311777, 0, 0, 0, 1, 1,
-0.7176771, -0.9445666, -2.054261, 0, 0, 0, 1, 1,
-0.7167709, -2.430591, -1.118082, 1, 1, 1, 1, 1,
-0.7160064, 0.2985609, -1.367648, 1, 1, 1, 1, 1,
-0.709994, 0.2952801, -2.260014, 1, 1, 1, 1, 1,
-0.7099597, 1.820591, 0.09198848, 1, 1, 1, 1, 1,
-0.7092002, -0.6160305, -0.4276605, 1, 1, 1, 1, 1,
-0.7063199, 0.01101191, -0.9230047, 1, 1, 1, 1, 1,
-0.7048764, -1.319909, -1.664089, 1, 1, 1, 1, 1,
-0.7033461, -0.8506116, -3.075657, 1, 1, 1, 1, 1,
-0.7017634, 1.190403, -1.388369, 1, 1, 1, 1, 1,
-0.6970682, 1.277551, 0.2441366, 1, 1, 1, 1, 1,
-0.6963717, 0.4220311, -2.240642, 1, 1, 1, 1, 1,
-0.6946711, -0.1687678, -4.042065, 1, 1, 1, 1, 1,
-0.6945027, 1.0174, 0.5453433, 1, 1, 1, 1, 1,
-0.6935816, -0.447422, -2.917717, 1, 1, 1, 1, 1,
-0.6881069, -1.214244, -3.20597, 1, 1, 1, 1, 1,
-0.6862291, 1.825857, -0.1282182, 0, 0, 1, 1, 1,
-0.6860019, -0.2545825, -1.286877, 1, 0, 0, 1, 1,
-0.6819209, 1.037085, 1.0166, 1, 0, 0, 1, 1,
-0.6788405, -1.913481, -2.446263, 1, 0, 0, 1, 1,
-0.6700857, 0.3281265, -2.900845, 1, 0, 0, 1, 1,
-0.6676114, -0.8610396, -2.047799, 1, 0, 0, 1, 1,
-0.664754, 0.2129712, -2.395835, 0, 0, 0, 1, 1,
-0.6631924, 2.682652, 0.9813361, 0, 0, 0, 1, 1,
-0.6624662, -0.3876433, -1.721828, 0, 0, 0, 1, 1,
-0.6530992, -1.400233, -2.126625, 0, 0, 0, 1, 1,
-0.6517923, 1.587443, -0.2444485, 0, 0, 0, 1, 1,
-0.6506655, -0.2345067, -0.883349, 0, 0, 0, 1, 1,
-0.6422549, -0.4895966, -0.4981943, 0, 0, 0, 1, 1,
-0.6415144, 1.013365, -1.502046, 1, 1, 1, 1, 1,
-0.640761, 1.657163, -0.5546341, 1, 1, 1, 1, 1,
-0.6344171, -0.2400681, -1.856014, 1, 1, 1, 1, 1,
-0.629228, 1.8303, 0.4514176, 1, 1, 1, 1, 1,
-0.6248106, -0.7761565, -2.007293, 1, 1, 1, 1, 1,
-0.623731, -0.236158, -2.597488, 1, 1, 1, 1, 1,
-0.6192477, -0.7517374, -2.781383, 1, 1, 1, 1, 1,
-0.6162967, 0.508337, -1.126029, 1, 1, 1, 1, 1,
-0.6100807, -1.217806, -2.080442, 1, 1, 1, 1, 1,
-0.606505, -1.79739, -2.710687, 1, 1, 1, 1, 1,
-0.5939686, 0.7765811, -1.860007, 1, 1, 1, 1, 1,
-0.591754, -0.2118347, -1.081598, 1, 1, 1, 1, 1,
-0.5915077, -0.4428533, -3.718823, 1, 1, 1, 1, 1,
-0.5858808, -0.3595948, -3.366123, 1, 1, 1, 1, 1,
-0.5823658, 0.05919008, -0.2893108, 1, 1, 1, 1, 1,
-0.5816251, 0.5732148, 0.003703091, 0, 0, 1, 1, 1,
-0.5772794, -2.333816, -2.93225, 1, 0, 0, 1, 1,
-0.576692, 0.2168074, -1.093381, 1, 0, 0, 1, 1,
-0.5744552, 0.3014013, -2.495851, 1, 0, 0, 1, 1,
-0.5706367, 0.4668973, 0.4661397, 1, 0, 0, 1, 1,
-0.566059, -0.1589281, -2.548231, 1, 0, 0, 1, 1,
-0.5657825, -0.973951, -2.527481, 0, 0, 0, 1, 1,
-0.5631874, -0.6171705, -3.152874, 0, 0, 0, 1, 1,
-0.5627683, -1.485019, -3.401581, 0, 0, 0, 1, 1,
-0.5610989, 1.361163, -1.959522, 0, 0, 0, 1, 1,
-0.5539699, 0.6538345, -1.505221, 0, 0, 0, 1, 1,
-0.546253, 0.2482362, -0.9615278, 0, 0, 0, 1, 1,
-0.5460917, 0.6185603, -1.982727, 0, 0, 0, 1, 1,
-0.5456525, 0.7377478, 0.1447403, 1, 1, 1, 1, 1,
-0.5445022, 1.850812, 0.3893044, 1, 1, 1, 1, 1,
-0.53767, 0.3918177, -0.5360713, 1, 1, 1, 1, 1,
-0.5353957, -0.08856368, -1.706751, 1, 1, 1, 1, 1,
-0.5352073, 1.809488, -0.7954416, 1, 1, 1, 1, 1,
-0.5257299, 0.02468095, -1.380378, 1, 1, 1, 1, 1,
-0.5225157, -0.5262842, -2.928535, 1, 1, 1, 1, 1,
-0.5213228, -1.440778, -3.306857, 1, 1, 1, 1, 1,
-0.5207327, -1.294792, -4.007054, 1, 1, 1, 1, 1,
-0.518667, 0.792817, -2.162793, 1, 1, 1, 1, 1,
-0.5145746, -0.1729465, -1.640989, 1, 1, 1, 1, 1,
-0.5064188, 0.04599205, -3.127461, 1, 1, 1, 1, 1,
-0.5021742, 0.9025897, -1.50887, 1, 1, 1, 1, 1,
-0.4928508, 0.6778893, -0.6281281, 1, 1, 1, 1, 1,
-0.4888824, -0.7799528, -3.657306, 1, 1, 1, 1, 1,
-0.4839736, -0.1180393, -0.5619085, 0, 0, 1, 1, 1,
-0.479534, 1.158873, 0.2936776, 1, 0, 0, 1, 1,
-0.4764653, -0.343964, -2.989586, 1, 0, 0, 1, 1,
-0.4696234, 0.236101, -1.351884, 1, 0, 0, 1, 1,
-0.4656242, 0.6301771, -1.32103, 1, 0, 0, 1, 1,
-0.4622442, 0.4289208, -0.8718127, 1, 0, 0, 1, 1,
-0.4594009, 0.4387538, -0.7584755, 0, 0, 0, 1, 1,
-0.4568144, -0.9899636, -3.06068, 0, 0, 0, 1, 1,
-0.4560479, -0.5399393, -5.315754, 0, 0, 0, 1, 1,
-0.4559422, 0.9671012, 0.6828631, 0, 0, 0, 1, 1,
-0.4549592, 1.344147, -0.7393293, 0, 0, 0, 1, 1,
-0.4510378, 0.6127797, 0.292592, 0, 0, 0, 1, 1,
-0.4499162, -3.352434, -3.280674, 0, 0, 0, 1, 1,
-0.447417, -0.8698146, -2.635359, 1, 1, 1, 1, 1,
-0.4470298, -0.2096666, -3.246305, 1, 1, 1, 1, 1,
-0.4466321, 0.6506584, -0.8090122, 1, 1, 1, 1, 1,
-0.4425489, -0.7972281, -2.550046, 1, 1, 1, 1, 1,
-0.441633, 0.3011922, -1.099297, 1, 1, 1, 1, 1,
-0.4405432, -0.7344477, -3.216465, 1, 1, 1, 1, 1,
-0.4389247, 2.76724, 1.593066, 1, 1, 1, 1, 1,
-0.4382905, -0.5136936, -0.7897633, 1, 1, 1, 1, 1,
-0.4354702, 0.1324237, -0.8067515, 1, 1, 1, 1, 1,
-0.4346074, 0.2922801, -0.4681218, 1, 1, 1, 1, 1,
-0.4344414, -1.421837, -2.163675, 1, 1, 1, 1, 1,
-0.4339069, -0.8950631, -3.075701, 1, 1, 1, 1, 1,
-0.4338045, -0.7901509, -3.132607, 1, 1, 1, 1, 1,
-0.4328667, 1.033493, -0.5780972, 1, 1, 1, 1, 1,
-0.4309155, 2.203555, 0.2379316, 1, 1, 1, 1, 1,
-0.4286715, -0.6660195, -5.118488, 0, 0, 1, 1, 1,
-0.4259409, 0.1115253, -0.989001, 1, 0, 0, 1, 1,
-0.4250554, -1.714994, -1.93857, 1, 0, 0, 1, 1,
-0.4207708, 0.9739649, -0.5710075, 1, 0, 0, 1, 1,
-0.410245, 0.3206218, -0.09398406, 1, 0, 0, 1, 1,
-0.4101865, -0.2872877, -2.073634, 1, 0, 0, 1, 1,
-0.4086765, -1.227329, -3.966999, 0, 0, 0, 1, 1,
-0.4086342, -1.30836, -0.3548237, 0, 0, 0, 1, 1,
-0.4051415, -0.05577196, -3.993578, 0, 0, 0, 1, 1,
-0.4048182, -0.9073098, -4.063313, 0, 0, 0, 1, 1,
-0.4045784, 1.604472, -0.8202136, 0, 0, 0, 1, 1,
-0.402977, -0.2696832, -2.103843, 0, 0, 0, 1, 1,
-0.394543, -0.2882217, -0.4759891, 0, 0, 0, 1, 1,
-0.3897386, -2.089384, -3.052961, 1, 1, 1, 1, 1,
-0.3877628, 1.585692, -0.6966147, 1, 1, 1, 1, 1,
-0.3877074, -1.824706, -3.0855, 1, 1, 1, 1, 1,
-0.3863201, 0.451116, -0.7047076, 1, 1, 1, 1, 1,
-0.3854207, -1.15566, -1.815241, 1, 1, 1, 1, 1,
-0.3829053, -0.04602885, -0.4204341, 1, 1, 1, 1, 1,
-0.3818664, 1.926015, -0.4424153, 1, 1, 1, 1, 1,
-0.3813846, -0.1198395, -3.336333, 1, 1, 1, 1, 1,
-0.3754365, 0.7048048, -2.500086, 1, 1, 1, 1, 1,
-0.3707974, -0.7671264, -2.306519, 1, 1, 1, 1, 1,
-0.3677245, 0.8610967, -0.7601793, 1, 1, 1, 1, 1,
-0.3658149, 0.5128348, -0.7206434, 1, 1, 1, 1, 1,
-0.3585996, -0.2258814, -1.210474, 1, 1, 1, 1, 1,
-0.3576336, 0.7828774, -0.3549891, 1, 1, 1, 1, 1,
-0.3494869, -0.9138567, -2.685729, 1, 1, 1, 1, 1,
-0.3465123, -0.1437071, -2.37436, 0, 0, 1, 1, 1,
-0.3464997, -0.9749805, -3.659873, 1, 0, 0, 1, 1,
-0.3438155, 1.74876, -1.084191, 1, 0, 0, 1, 1,
-0.3425675, -0.3421381, -2.84782, 1, 0, 0, 1, 1,
-0.342099, -0.02667567, -0.9712143, 1, 0, 0, 1, 1,
-0.3416278, 0.2408189, -1.567868, 1, 0, 0, 1, 1,
-0.3402519, -0.2621373, -1.133549, 0, 0, 0, 1, 1,
-0.3373188, 1.572044, 0.4889448, 0, 0, 0, 1, 1,
-0.3361571, -1.348446, -3.831634, 0, 0, 0, 1, 1,
-0.3342287, -0.05210201, -1.382358, 0, 0, 0, 1, 1,
-0.3290849, 0.1471978, 0.09761287, 0, 0, 0, 1, 1,
-0.3274578, -0.577642, -2.347303, 0, 0, 0, 1, 1,
-0.325797, -0.3289948, -2.571611, 0, 0, 0, 1, 1,
-0.3210259, -0.9314185, -2.323322, 1, 1, 1, 1, 1,
-0.3132159, 1.618777, -1.719334, 1, 1, 1, 1, 1,
-0.3088963, 1.414468, -0.1285769, 1, 1, 1, 1, 1,
-0.3083996, 0.8553809, -0.4668397, 1, 1, 1, 1, 1,
-0.3040427, -0.2929548, -1.929056, 1, 1, 1, 1, 1,
-0.30226, -0.5293229, -3.314981, 1, 1, 1, 1, 1,
-0.3011583, 1.564288, 0.4701377, 1, 1, 1, 1, 1,
-0.2955377, 0.1502818, -1.512363, 1, 1, 1, 1, 1,
-0.2924234, 0.6876076, -0.4502423, 1, 1, 1, 1, 1,
-0.2882015, 0.5891363, 1.488439, 1, 1, 1, 1, 1,
-0.2829738, -0.8251204, -2.859816, 1, 1, 1, 1, 1,
-0.2797923, -0.2970876, -1.329957, 1, 1, 1, 1, 1,
-0.2764089, 0.3899532, -1.178217, 1, 1, 1, 1, 1,
-0.2732333, -0.5903163, -3.073128, 1, 1, 1, 1, 1,
-0.2716267, -0.6496024, -1.752261, 1, 1, 1, 1, 1,
-0.2697402, 0.3279402, -0.5125461, 0, 0, 1, 1, 1,
-0.2696691, 1.257996, -0.3485585, 1, 0, 0, 1, 1,
-0.2671169, -1.01746, -2.745478, 1, 0, 0, 1, 1,
-0.2670823, 0.3343177, -1.573917, 1, 0, 0, 1, 1,
-0.2666597, -0.6834488, -2.266391, 1, 0, 0, 1, 1,
-0.2654569, 1.903631, 1.984814, 1, 0, 0, 1, 1,
-0.2642372, -0.391046, -1.015075, 0, 0, 0, 1, 1,
-0.2641991, -2.191369, -2.825351, 0, 0, 0, 1, 1,
-0.2616441, -1.291256, -3.004261, 0, 0, 0, 1, 1,
-0.2598996, 2.035783, 0.04383965, 0, 0, 0, 1, 1,
-0.2583178, -0.9255323, -2.771365, 0, 0, 0, 1, 1,
-0.2561398, 0.004491, -0.7539058, 0, 0, 0, 1, 1,
-0.2532186, -0.1922863, -1.563545, 0, 0, 0, 1, 1,
-0.2530853, 1.397857, -0.0806209, 1, 1, 1, 1, 1,
-0.2483263, -0.5842158, -3.916304, 1, 1, 1, 1, 1,
-0.2405339, -0.4068434, -2.920785, 1, 1, 1, 1, 1,
-0.2353707, -0.8822898, -3.596321, 1, 1, 1, 1, 1,
-0.2316749, -0.5752333, -4.206343, 1, 1, 1, 1, 1,
-0.2311452, 0.5104988, 0.1261343, 1, 1, 1, 1, 1,
-0.2225014, -1.371145, -3.670533, 1, 1, 1, 1, 1,
-0.2194056, 1.460226, 0.7782311, 1, 1, 1, 1, 1,
-0.2187712, -0.08604779, -2.109747, 1, 1, 1, 1, 1,
-0.2178736, -0.3680318, -2.90449, 1, 1, 1, 1, 1,
-0.2160605, 0.1237679, -0.8763809, 1, 1, 1, 1, 1,
-0.214851, -1.120904, -1.961367, 1, 1, 1, 1, 1,
-0.2145854, 0.2952953, -1.256546, 1, 1, 1, 1, 1,
-0.2128203, -1.160943, -3.250025, 1, 1, 1, 1, 1,
-0.2074908, 0.6317737, -0.2703621, 1, 1, 1, 1, 1,
-0.2070639, -0.2980256, -2.089407, 0, 0, 1, 1, 1,
-0.203767, 2.3772, 0.4945147, 1, 0, 0, 1, 1,
-0.2012503, 0.5931036, 1.412274, 1, 0, 0, 1, 1,
-0.1993845, -0.7407083, -1.510502, 1, 0, 0, 1, 1,
-0.1981607, -0.3929579, -2.94026, 1, 0, 0, 1, 1,
-0.1957535, 1.240021, -0.6526514, 1, 0, 0, 1, 1,
-0.1836676, 0.8256592, -1.38478, 0, 0, 0, 1, 1,
-0.1833916, 0.5380762, 0.7069048, 0, 0, 0, 1, 1,
-0.1815268, -1.477877, -2.030327, 0, 0, 0, 1, 1,
-0.1806437, -0.218993, -4.089701, 0, 0, 0, 1, 1,
-0.1786436, -0.9325758, -3.361012, 0, 0, 0, 1, 1,
-0.166388, 0.9552131, -0.7649477, 0, 0, 0, 1, 1,
-0.1590035, 1.722115, -0.06807517, 0, 0, 0, 1, 1,
-0.1567633, -1.247169, -2.848679, 1, 1, 1, 1, 1,
-0.1549222, 1.058773, -2.099741, 1, 1, 1, 1, 1,
-0.1491187, -0.1158923, -2.735878, 1, 1, 1, 1, 1,
-0.1486128, 0.9971719, 1.233189, 1, 1, 1, 1, 1,
-0.1463996, -1.779112, -4.458631, 1, 1, 1, 1, 1,
-0.1455206, 0.03603476, -1.759837, 1, 1, 1, 1, 1,
-0.1422956, -1.499871, -3.299672, 1, 1, 1, 1, 1,
-0.1340933, 1.090102, 0.724111, 1, 1, 1, 1, 1,
-0.1252389, 0.4142848, -0.9400469, 1, 1, 1, 1, 1,
-0.1239965, -1.823765, -2.006882, 1, 1, 1, 1, 1,
-0.123373, 0.07105204, 0.5158713, 1, 1, 1, 1, 1,
-0.116248, 1.064499, 0.6547652, 1, 1, 1, 1, 1,
-0.1140128, 1.511706, -0.543869, 1, 1, 1, 1, 1,
-0.1119112, 0.8047526, 1.201342, 1, 1, 1, 1, 1,
-0.1112899, -1.191829, -4.405039, 1, 1, 1, 1, 1,
-0.1096948, -0.8682894, -1.86485, 0, 0, 1, 1, 1,
-0.1085921, -2.290937, -1.598323, 1, 0, 0, 1, 1,
-0.1081976, 0.3715962, -0.482654, 1, 0, 0, 1, 1,
-0.1063398, -0.007595693, -1.093048, 1, 0, 0, 1, 1,
-0.1049385, -2.298513, -3.60907, 1, 0, 0, 1, 1,
-0.1006986, -0.2213576, -1.823588, 1, 0, 0, 1, 1,
-0.09742794, -0.1216536, -0.8727236, 0, 0, 0, 1, 1,
-0.09285869, 0.396735, 0.4687739, 0, 0, 0, 1, 1,
-0.09238835, 1.037018, 0.2391435, 0, 0, 0, 1, 1,
-0.0911577, 1.771916, 0.2519538, 0, 0, 0, 1, 1,
-0.08892045, -0.5240664, -1.573729, 0, 0, 0, 1, 1,
-0.08803261, 0.523594, -0.0108773, 0, 0, 0, 1, 1,
-0.08240629, -0.4473769, -3.676083, 0, 0, 0, 1, 1,
-0.07790851, 1.739647, -0.8586094, 1, 1, 1, 1, 1,
-0.07784669, -0.5727257, -3.007156, 1, 1, 1, 1, 1,
-0.07768012, -0.5838271, -3.095231, 1, 1, 1, 1, 1,
-0.07687172, -0.4285941, -3.846816, 1, 1, 1, 1, 1,
-0.07643835, 0.1514212, -0.1105408, 1, 1, 1, 1, 1,
-0.06844066, -0.6960892, -3.82553, 1, 1, 1, 1, 1,
-0.06809636, 0.476777, -0.2776078, 1, 1, 1, 1, 1,
-0.06642512, 0.8033465, 1.196818, 1, 1, 1, 1, 1,
-0.06592617, 0.432234, -0.3980035, 1, 1, 1, 1, 1,
-0.06152141, 0.6511062, -0.5650039, 1, 1, 1, 1, 1,
-0.0558614, 0.9376424, -1.229597, 1, 1, 1, 1, 1,
-0.05440554, 0.3697365, -0.01615102, 1, 1, 1, 1, 1,
-0.05344235, 0.4253616, 0.5885191, 1, 1, 1, 1, 1,
-0.04849641, 0.01047663, -0.771413, 1, 1, 1, 1, 1,
-0.04564416, -0.01637643, -3.169578, 1, 1, 1, 1, 1,
-0.04158871, 0.6769651, -0.3520936, 0, 0, 1, 1, 1,
-0.03743475, -1.607238, -2.429497, 1, 0, 0, 1, 1,
-0.03384348, -0.2835208, -3.267048, 1, 0, 0, 1, 1,
-0.0334564, 0.5285327, 0.991107, 1, 0, 0, 1, 1,
-0.03097048, -0.3961534, -2.714048, 1, 0, 0, 1, 1,
-0.02910046, -1.318342, -4.03882, 1, 0, 0, 1, 1,
-0.02589484, 0.8064315, 0.8842241, 0, 0, 0, 1, 1,
-0.02118298, -1.028879, -3.361138, 0, 0, 0, 1, 1,
-0.02100897, 1.39101, -0.5048583, 0, 0, 0, 1, 1,
-0.02027125, 0.8321831, 1.201026, 0, 0, 0, 1, 1,
-0.01942053, -0.2550441, -3.888376, 0, 0, 0, 1, 1,
-0.01736302, -0.2257662, -4.443936, 0, 0, 0, 1, 1,
-0.01342713, 0.2473301, -0.7893116, 0, 0, 0, 1, 1,
-0.012617, 0.4757906, 0.2485187, 1, 1, 1, 1, 1,
-0.01093816, -0.2122743, -4.563214, 1, 1, 1, 1, 1,
-0.008050294, 0.06335986, 0.1594129, 1, 1, 1, 1, 1,
-0.005543376, -0.5221937, -2.791266, 1, 1, 1, 1, 1,
-0.005450443, -0.9541344, -4.383893, 1, 1, 1, 1, 1,
-0.001898315, 0.2947338, 1.214906, 1, 1, 1, 1, 1,
-0.0001070862, 1.137171, 0.8908629, 1, 1, 1, 1, 1,
0.0003864868, -1.082415, 2.945904, 1, 1, 1, 1, 1,
0.001110031, 0.2248487, 0.1183536, 1, 1, 1, 1, 1,
0.00248289, -1.159021, 2.862957, 1, 1, 1, 1, 1,
0.007169609, 0.8165139, 0.2009899, 1, 1, 1, 1, 1,
0.008988292, 1.953352, 0.2057469, 1, 1, 1, 1, 1,
0.013996, -0.9307234, 2.496816, 1, 1, 1, 1, 1,
0.01758915, -0.3841253, 2.588842, 1, 1, 1, 1, 1,
0.01800631, -0.3681111, 4.14244, 1, 1, 1, 1, 1,
0.02317992, 0.3822146, 0.7078179, 0, 0, 1, 1, 1,
0.0416279, 0.3467354, -2.229182, 1, 0, 0, 1, 1,
0.04628441, -1.193949, 4.639492, 1, 0, 0, 1, 1,
0.04654203, -1.033066, 2.931863, 1, 0, 0, 1, 1,
0.05171845, 0.3789403, -0.3067644, 1, 0, 0, 1, 1,
0.05283365, -0.3786662, 2.809085, 1, 0, 0, 1, 1,
0.05328885, -1.888942, 3.608394, 0, 0, 0, 1, 1,
0.0562512, -0.6412029, 3.890654, 0, 0, 0, 1, 1,
0.05698868, 1.135536, 0.8591204, 0, 0, 0, 1, 1,
0.06030108, 0.6926006, -0.2768317, 0, 0, 0, 1, 1,
0.06148268, 1.486815, -2.116814, 0, 0, 0, 1, 1,
0.0659899, 0.4433835, -0.7000468, 0, 0, 0, 1, 1,
0.06795484, -0.1998738, 1.540061, 0, 0, 0, 1, 1,
0.06901138, 0.4584915, -0.8116936, 1, 1, 1, 1, 1,
0.0737046, -0.3408169, 4.148, 1, 1, 1, 1, 1,
0.07720286, 0.8977699, -0.2081243, 1, 1, 1, 1, 1,
0.07856099, -0.02776396, 2.077915, 1, 1, 1, 1, 1,
0.08749922, -0.8353357, 2.570337, 1, 1, 1, 1, 1,
0.09107993, -1.177849, 2.704387, 1, 1, 1, 1, 1,
0.09249827, -0.2810421, 2.128565, 1, 1, 1, 1, 1,
0.09473242, 0.04071878, 2.041776, 1, 1, 1, 1, 1,
0.09555074, -0.6292539, 4.170549, 1, 1, 1, 1, 1,
0.09982062, -0.8645985, 2.972234, 1, 1, 1, 1, 1,
0.1048922, -0.8579077, 4.427687, 1, 1, 1, 1, 1,
0.1069011, 0.8352282, 1.257952, 1, 1, 1, 1, 1,
0.1093687, 0.163963, 0.0441335, 1, 1, 1, 1, 1,
0.1124087, 0.1826215, 0.5448273, 1, 1, 1, 1, 1,
0.1124882, 1.197126, 0.03752944, 1, 1, 1, 1, 1,
0.1126277, 0.8424283, 2.05489, 0, 0, 1, 1, 1,
0.1145017, 0.3862695, -0.05712073, 1, 0, 0, 1, 1,
0.1212176, 0.3165528, 0.7248443, 1, 0, 0, 1, 1,
0.1230073, -0.662003, 4.764221, 1, 0, 0, 1, 1,
0.1239547, -0.8611579, 2.567786, 1, 0, 0, 1, 1,
0.1240235, 0.3288558, -0.7677607, 1, 0, 0, 1, 1,
0.1255537, -0.169871, 0.9469879, 0, 0, 0, 1, 1,
0.1360958, -1.19437, 3.321702, 0, 0, 0, 1, 1,
0.1376066, 0.5054509, -0.01911326, 0, 0, 0, 1, 1,
0.139241, 0.3856044, 0.4660623, 0, 0, 0, 1, 1,
0.1425981, 1.171671, 0.1188783, 0, 0, 0, 1, 1,
0.1433457, 0.9476702, -1.047411, 0, 0, 0, 1, 1,
0.1485962, 0.8630487, -0.2537082, 0, 0, 0, 1, 1,
0.1522154, 0.9716812, 0.4689124, 1, 1, 1, 1, 1,
0.1553346, 1.99132, 1.674701, 1, 1, 1, 1, 1,
0.1562734, -0.3804837, 2.255242, 1, 1, 1, 1, 1,
0.158239, 0.9673582, 1.311407, 1, 1, 1, 1, 1,
0.1584922, 0.5272838, 0.02570427, 1, 1, 1, 1, 1,
0.1599374, 0.03423006, 0.4143982, 1, 1, 1, 1, 1,
0.1667646, 0.07280488, 1.218533, 1, 1, 1, 1, 1,
0.1668766, 0.9288602, -0.4578961, 1, 1, 1, 1, 1,
0.1700822, -1.432787, 3.58041, 1, 1, 1, 1, 1,
0.1717092, -1.42803, 4.299122, 1, 1, 1, 1, 1,
0.1722025, -2.221927, 4.243004, 1, 1, 1, 1, 1,
0.1738036, 1.552699, 0.2761449, 1, 1, 1, 1, 1,
0.17784, 2.431688, 1.941053, 1, 1, 1, 1, 1,
0.1802364, 0.9865249, -0.01283138, 1, 1, 1, 1, 1,
0.1870193, -0.8215073, 4.057954, 1, 1, 1, 1, 1,
0.188125, -0.1984217, 2.690012, 0, 0, 1, 1, 1,
0.1903397, -1.474054, 2.204286, 1, 0, 0, 1, 1,
0.1910381, 1.156952, 0.23068, 1, 0, 0, 1, 1,
0.1929683, -0.7678256, 1.989143, 1, 0, 0, 1, 1,
0.1941994, 1.016921, 0.757018, 1, 0, 0, 1, 1,
0.1949801, -1.041249, 5.198235, 1, 0, 0, 1, 1,
0.195995, -0.504109, 1.82792, 0, 0, 0, 1, 1,
0.1993835, -1.151151, 2.978434, 0, 0, 0, 1, 1,
0.1997717, 0.5541249, -0.1894712, 0, 0, 0, 1, 1,
0.2020547, 1.755445, 1.481037, 0, 0, 0, 1, 1,
0.2030284, -0.2396345, 3.701576, 0, 0, 0, 1, 1,
0.2045393, 0.5105532, -0.1058114, 0, 0, 0, 1, 1,
0.206295, -0.4523441, 4.504526, 0, 0, 0, 1, 1,
0.2116791, 0.05347228, 1.067816, 1, 1, 1, 1, 1,
0.2119078, -0.579064, 3.97085, 1, 1, 1, 1, 1,
0.2158203, 0.9939142, -0.03268237, 1, 1, 1, 1, 1,
0.2458389, 0.8009554, 0.584187, 1, 1, 1, 1, 1,
0.2503206, -0.5316165, 1.903798, 1, 1, 1, 1, 1,
0.2506669, 0.2355039, 1.948393, 1, 1, 1, 1, 1,
0.2528117, -1.114371, 2.799203, 1, 1, 1, 1, 1,
0.255273, 0.889886, 1.135063, 1, 1, 1, 1, 1,
0.2565238, 1.159933, -0.4545753, 1, 1, 1, 1, 1,
0.2649256, 0.07300425, 2.216086, 1, 1, 1, 1, 1,
0.266121, -0.1125631, 1.63945, 1, 1, 1, 1, 1,
0.2676608, 2.033187, -0.4502916, 1, 1, 1, 1, 1,
0.269859, -0.004623146, 0.6401685, 1, 1, 1, 1, 1,
0.27108, -1.300367, 2.020515, 1, 1, 1, 1, 1,
0.2714496, 0.4260958, 0.3325545, 1, 1, 1, 1, 1,
0.2832682, -0.2874368, 3.209356, 0, 0, 1, 1, 1,
0.2838402, -1.005645, 1.863267, 1, 0, 0, 1, 1,
0.289877, 0.03098385, 1.994294, 1, 0, 0, 1, 1,
0.2914677, -1.215246, 3.393742, 1, 0, 0, 1, 1,
0.2927169, -0.6127548, 1.278823, 1, 0, 0, 1, 1,
0.2957667, -0.2941152, 2.065126, 1, 0, 0, 1, 1,
0.2960787, 1.002502, 0.8633899, 0, 0, 0, 1, 1,
0.3034194, 1.189506, -0.440247, 0, 0, 0, 1, 1,
0.3073718, 1.178977, 0.5523334, 0, 0, 0, 1, 1,
0.3075828, 0.01991108, 0.05514941, 0, 0, 0, 1, 1,
0.3082237, -0.1961973, 1.73577, 0, 0, 0, 1, 1,
0.3186882, 0.02232636, 1.837232, 0, 0, 0, 1, 1,
0.3222989, 0.4950496, 0.2872163, 0, 0, 0, 1, 1,
0.3223428, -0.3821294, 1.621231, 1, 1, 1, 1, 1,
0.3234158, -0.2785851, 2.635215, 1, 1, 1, 1, 1,
0.3251081, 0.5167988, -0.2778656, 1, 1, 1, 1, 1,
0.3320049, 0.2893949, 3.2646, 1, 1, 1, 1, 1,
0.3331238, -1.131233, 3.879487, 1, 1, 1, 1, 1,
0.3396653, 0.6208751, -0.3337339, 1, 1, 1, 1, 1,
0.3406189, 0.016568, 1.965791, 1, 1, 1, 1, 1,
0.3428801, 0.02234977, 0.5071837, 1, 1, 1, 1, 1,
0.3463176, 0.3027581, 0.6829101, 1, 1, 1, 1, 1,
0.3465955, -0.6412028, 4.220803, 1, 1, 1, 1, 1,
0.3510914, -0.8517015, 1.483753, 1, 1, 1, 1, 1,
0.3547206, -0.7024811, 2.710997, 1, 1, 1, 1, 1,
0.3559938, 0.2925966, 0.9889579, 1, 1, 1, 1, 1,
0.3568734, 0.2468182, 1.308736, 1, 1, 1, 1, 1,
0.3573788, 0.2300235, 1.133662, 1, 1, 1, 1, 1,
0.361197, -0.7385408, 2.098607, 0, 0, 1, 1, 1,
0.3619011, 0.01822926, 1.760283, 1, 0, 0, 1, 1,
0.362397, 0.5420455, 0.1030093, 1, 0, 0, 1, 1,
0.3641936, -0.7737446, 1.435528, 1, 0, 0, 1, 1,
0.3687657, -0.3536017, 1.923508, 1, 0, 0, 1, 1,
0.3692712, 0.06083531, 1.487975, 1, 0, 0, 1, 1,
0.3779411, 0.925948, -0.7374556, 0, 0, 0, 1, 1,
0.3835139, 0.7407362, 0.0421675, 0, 0, 0, 1, 1,
0.3911523, 0.3081062, 1.117079, 0, 0, 0, 1, 1,
0.3954574, -1.266749, 2.648538, 0, 0, 0, 1, 1,
0.3971628, -0.4712587, 2.175304, 0, 0, 0, 1, 1,
0.3978084, 0.134985, -0.3800864, 0, 0, 0, 1, 1,
0.3984035, -0.7828512, 4.743647, 0, 0, 0, 1, 1,
0.4032806, 0.6545129, 1.190437, 1, 1, 1, 1, 1,
0.4053425, -0.1851948, 3.612304, 1, 1, 1, 1, 1,
0.409789, -0.9691898, 4.623635, 1, 1, 1, 1, 1,
0.4100555, -0.1668723, 2.146181, 1, 1, 1, 1, 1,
0.4126059, 1.642978, -0.2304932, 1, 1, 1, 1, 1,
0.4162582, -0.5536512, 2.010993, 1, 1, 1, 1, 1,
0.4176285, 2.41479, 0.1488259, 1, 1, 1, 1, 1,
0.4184871, -0.8505558, 2.741343, 1, 1, 1, 1, 1,
0.4202646, 0.1885371, 0.1656117, 1, 1, 1, 1, 1,
0.4235751, -0.4792193, 2.389566, 1, 1, 1, 1, 1,
0.4279672, -1.680886, 2.584177, 1, 1, 1, 1, 1,
0.4296188, 1.398403, 1.779037, 1, 1, 1, 1, 1,
0.4307859, 1.228868, 1.741395, 1, 1, 1, 1, 1,
0.4315307, 0.420908, 2.942906, 1, 1, 1, 1, 1,
0.4368561, -0.809049, 2.590044, 1, 1, 1, 1, 1,
0.438089, -0.1594983, 1.890434, 0, 0, 1, 1, 1,
0.4392625, -0.4994354, 3.794051, 1, 0, 0, 1, 1,
0.4414271, -0.4460848, 2.657756, 1, 0, 0, 1, 1,
0.4431952, -1.594142, 4.357356, 1, 0, 0, 1, 1,
0.4453544, -1.341075, 4.258858, 1, 0, 0, 1, 1,
0.4472983, 1.127738, 1.980538, 1, 0, 0, 1, 1,
0.4536387, -0.6871367, 2.337253, 0, 0, 0, 1, 1,
0.4543468, -0.005293476, 1.276363, 0, 0, 0, 1, 1,
0.4653836, 0.6494029, -0.7370525, 0, 0, 0, 1, 1,
0.4657764, -0.1756315, 1.009171, 0, 0, 0, 1, 1,
0.4667822, 1.460867, -0.2511365, 0, 0, 0, 1, 1,
0.4681759, 1.925436, 0.1867431, 0, 0, 0, 1, 1,
0.4692203, -0.01959143, 3.077953, 0, 0, 0, 1, 1,
0.4698018, -0.3212048, 0.7178981, 1, 1, 1, 1, 1,
0.4718558, 1.465386, 0.5554971, 1, 1, 1, 1, 1,
0.4781325, 0.3850202, 0.8782361, 1, 1, 1, 1, 1,
0.4783962, 1.022186, 0.006520717, 1, 1, 1, 1, 1,
0.4829868, 1.225071, 0.9275839, 1, 1, 1, 1, 1,
0.4947573, 0.9577543, 1.273764, 1, 1, 1, 1, 1,
0.4974166, -0.2527809, 2.893049, 1, 1, 1, 1, 1,
0.5060575, 0.6475694, 2.393692, 1, 1, 1, 1, 1,
0.5068923, -0.8112687, 3.647247, 1, 1, 1, 1, 1,
0.5099329, 0.06813965, 1.768809, 1, 1, 1, 1, 1,
0.5100152, -0.3152952, 2.208352, 1, 1, 1, 1, 1,
0.5104824, -0.7120393, 2.031867, 1, 1, 1, 1, 1,
0.5105687, 0.0886418, 1.348518, 1, 1, 1, 1, 1,
0.5110641, 0.3118078, 0.5283692, 1, 1, 1, 1, 1,
0.5115695, -1.336823, 2.577906, 1, 1, 1, 1, 1,
0.5136002, 0.0329353, 1.617474, 0, 0, 1, 1, 1,
0.5174388, -0.2502163, 0.6609812, 1, 0, 0, 1, 1,
0.522355, 0.02677615, 1.277725, 1, 0, 0, 1, 1,
0.5269613, 0.173953, 1.513786, 1, 0, 0, 1, 1,
0.5270262, 0.2865937, 0.0798031, 1, 0, 0, 1, 1,
0.5293146, 0.03903372, -0.7209703, 1, 0, 0, 1, 1,
0.5296986, 0.1783752, 0.4320776, 0, 0, 0, 1, 1,
0.5307009, 1.016371, -0.80686, 0, 0, 0, 1, 1,
0.5308819, 1.962542, 0.7417629, 0, 0, 0, 1, 1,
0.5351695, -0.5451047, 2.583582, 0, 0, 0, 1, 1,
0.5361274, -0.7721731, 2.911138, 0, 0, 0, 1, 1,
0.5380821, -0.3280807, 0.07838233, 0, 0, 0, 1, 1,
0.5432736, -0.1044511, -0.258599, 0, 0, 0, 1, 1,
0.5433337, 0.9019921, 0.2786186, 1, 1, 1, 1, 1,
0.5477516, 0.2581507, -0.2641295, 1, 1, 1, 1, 1,
0.5504679, -0.5977613, 2.539399, 1, 1, 1, 1, 1,
0.5650417, -0.2462869, 3.014496, 1, 1, 1, 1, 1,
0.5723873, 0.4167309, -1.439681, 1, 1, 1, 1, 1,
0.5737544, 0.2238433, -0.317879, 1, 1, 1, 1, 1,
0.574775, 1.626667, -0.6259859, 1, 1, 1, 1, 1,
0.5764111, 0.7537819, -0.554638, 1, 1, 1, 1, 1,
0.5774255, 1.518089, -1.246047, 1, 1, 1, 1, 1,
0.580615, -0.2458397, 1.681897, 1, 1, 1, 1, 1,
0.5821465, -1.009879, 3.28537, 1, 1, 1, 1, 1,
0.5822392, -0.09896964, 0.4014917, 1, 1, 1, 1, 1,
0.5869071, 0.7724587, -2.625685, 1, 1, 1, 1, 1,
0.5873972, 0.9794194, 0.8875084, 1, 1, 1, 1, 1,
0.5909085, -0.6434191, 3.245358, 1, 1, 1, 1, 1,
0.592523, 0.3326998, 2.601326, 0, 0, 1, 1, 1,
0.5926904, 1.644702, 0.2498408, 1, 0, 0, 1, 1,
0.5998165, 0.6274189, -0.4755104, 1, 0, 0, 1, 1,
0.6072058, -0.810739, 1.734048, 1, 0, 0, 1, 1,
0.618158, 0.004670655, 0.4472851, 1, 0, 0, 1, 1,
0.6183444, -0.3417796, 2.561435, 1, 0, 0, 1, 1,
0.6188924, 1.459675, -0.3055083, 0, 0, 0, 1, 1,
0.6191196, -0.9238527, 4.265583, 0, 0, 0, 1, 1,
0.6249043, 0.3171873, 1.525105, 0, 0, 0, 1, 1,
0.625291, -1.251519, 3.820882, 0, 0, 0, 1, 1,
0.6294142, -1.327619, 4.497952, 0, 0, 0, 1, 1,
0.6332495, 0.5551378, 0.319049, 0, 0, 0, 1, 1,
0.6342185, 0.4143641, 1.309095, 0, 0, 0, 1, 1,
0.6375492, -0.6056265, 0.9791741, 1, 1, 1, 1, 1,
0.6464401, 0.5779501, 0.6257356, 1, 1, 1, 1, 1,
0.6498228, -2.280128, 3.276224, 1, 1, 1, 1, 1,
0.652837, -0.1003067, 2.07596, 1, 1, 1, 1, 1,
0.655486, 1.038315, 0.7348167, 1, 1, 1, 1, 1,
0.6563405, -1.053743, 0.8040394, 1, 1, 1, 1, 1,
0.6580827, 0.275696, 3.011185, 1, 1, 1, 1, 1,
0.659436, 1.567394, 0.6871615, 1, 1, 1, 1, 1,
0.6627466, 0.4421038, 2.190871, 1, 1, 1, 1, 1,
0.6706821, -1.751656, 1.80652, 1, 1, 1, 1, 1,
0.6740823, -0.006889955, 3.845581, 1, 1, 1, 1, 1,
0.6770769, -1.483876, 2.494216, 1, 1, 1, 1, 1,
0.6788216, 1.608757, 0.6350842, 1, 1, 1, 1, 1,
0.6788448, 0.1050642, -1.090064, 1, 1, 1, 1, 1,
0.6818813, -1.825448, 4.000277, 1, 1, 1, 1, 1,
0.6843672, 1.413907, 0.6956083, 0, 0, 1, 1, 1,
0.6897819, -2.215347, 1.91568, 1, 0, 0, 1, 1,
0.6903591, 0.7833737, 0.1445286, 1, 0, 0, 1, 1,
0.6938319, 0.8723265, 1.572467, 1, 0, 0, 1, 1,
0.7002597, 1.000841, 1.623539, 1, 0, 0, 1, 1,
0.702281, 0.02700302, 1.225332, 1, 0, 0, 1, 1,
0.7057757, -2.386216, 2.341912, 0, 0, 0, 1, 1,
0.7089177, 1.46199, 1.427901, 0, 0, 0, 1, 1,
0.7101165, -0.7334963, 1.775971, 0, 0, 0, 1, 1,
0.7127446, 1.104298, 1.562971, 0, 0, 0, 1, 1,
0.7127617, 0.285741, 1.226929, 0, 0, 0, 1, 1,
0.7141779, 0.6456853, 0.9970409, 0, 0, 0, 1, 1,
0.7172419, 0.4757706, -0.4717129, 0, 0, 0, 1, 1,
0.7294893, 0.7365016, 0.8649763, 1, 1, 1, 1, 1,
0.7299109, 0.1300635, 2.264988, 1, 1, 1, 1, 1,
0.7325253, 1.246053, 0.5134782, 1, 1, 1, 1, 1,
0.7365124, 0.6379804, -1.14893, 1, 1, 1, 1, 1,
0.7378983, 0.6059577, 0.3837209, 1, 1, 1, 1, 1,
0.7444555, -0.5446243, 1.068077, 1, 1, 1, 1, 1,
0.7509011, 0.1811105, 0.9615644, 1, 1, 1, 1, 1,
0.7514646, 0.5766078, -1.523808, 1, 1, 1, 1, 1,
0.7567976, -0.6496103, 2.391476, 1, 1, 1, 1, 1,
0.7578707, 0.4519317, 2.745647, 1, 1, 1, 1, 1,
0.7580453, -0.3507937, 2.160209, 1, 1, 1, 1, 1,
0.7656894, 0.9261205, 1.403441, 1, 1, 1, 1, 1,
0.7692811, 1.336316, 1.958324, 1, 1, 1, 1, 1,
0.7696786, 1.148104, 0.08270536, 1, 1, 1, 1, 1,
0.7716187, -0.1180375, 2.521734, 1, 1, 1, 1, 1,
0.7725094, 1.739478, 0.4346378, 0, 0, 1, 1, 1,
0.7735246, 1.097705, 0.4605601, 1, 0, 0, 1, 1,
0.7738907, 0.0216863, 1.400054, 1, 0, 0, 1, 1,
0.7749651, -0.9850806, 3.478028, 1, 0, 0, 1, 1,
0.7772387, 0.4554289, 2.522976, 1, 0, 0, 1, 1,
0.7789301, 2.105906, 2.568983, 1, 0, 0, 1, 1,
0.7824485, 0.03052779, 1.251045, 0, 0, 0, 1, 1,
0.7873633, -0.07507781, 1.591421, 0, 0, 0, 1, 1,
0.7886321, 0.5689004, 4.303377, 0, 0, 0, 1, 1,
0.7916024, -0.1463718, 2.487652, 0, 0, 0, 1, 1,
0.8018973, -1.677187, 1.669419, 0, 0, 0, 1, 1,
0.803372, -0.01991588, 2.308192, 0, 0, 0, 1, 1,
0.8104364, 0.2974851, 1.052176, 0, 0, 0, 1, 1,
0.8110222, 1.405261, -0.1425982, 1, 1, 1, 1, 1,
0.811123, 0.5309422, 0.9434563, 1, 1, 1, 1, 1,
0.8113073, 1.287287, -0.8884848, 1, 1, 1, 1, 1,
0.8128974, -2.067746, 3.39598, 1, 1, 1, 1, 1,
0.8153047, 1.149081, -0.8780233, 1, 1, 1, 1, 1,
0.8207444, -0.1808463, 2.076046, 1, 1, 1, 1, 1,
0.8213208, 1.781781, 0.4658237, 1, 1, 1, 1, 1,
0.8354526, -1.392992, 2.802937, 1, 1, 1, 1, 1,
0.8368195, 0.9025036, 1.410336, 1, 1, 1, 1, 1,
0.8370966, 0.8660451, 0.5070401, 1, 1, 1, 1, 1,
0.8423558, 0.01299385, 2.306278, 1, 1, 1, 1, 1,
0.8425407, 0.5984267, 0.2955955, 1, 1, 1, 1, 1,
0.8435924, 1.597275, -1.434479, 1, 1, 1, 1, 1,
0.8450251, -0.2433674, 3.126019, 1, 1, 1, 1, 1,
0.8457525, 1.368525, 0.7260066, 1, 1, 1, 1, 1,
0.8465044, 1.387059, -0.2415945, 0, 0, 1, 1, 1,
0.8560227, -0.4449252, 1.91861, 1, 0, 0, 1, 1,
0.8565581, 1.077297, 0.08585897, 1, 0, 0, 1, 1,
0.8572915, 0.3417859, 0.4371677, 1, 0, 0, 1, 1,
0.8584963, 0.1007588, 1.272545, 1, 0, 0, 1, 1,
0.8637917, -0.909834, 3.891237, 1, 0, 0, 1, 1,
0.8652112, -1.254309, 3.636242, 0, 0, 0, 1, 1,
0.8695005, 0.5875198, 0.1444513, 0, 0, 0, 1, 1,
0.8717115, 0.868396, 2.03004, 0, 0, 0, 1, 1,
0.8720587, 1.871228, 0.1869852, 0, 0, 0, 1, 1,
0.8804927, 0.4230788, -0.4617161, 0, 0, 0, 1, 1,
0.8809407, 0.9832193, 0.6453698, 0, 0, 0, 1, 1,
0.8824342, -1.327035, 3.162529, 0, 0, 0, 1, 1,
0.8864429, -1.882988, 3.652987, 1, 1, 1, 1, 1,
0.8886353, 0.1971694, 1.605447, 1, 1, 1, 1, 1,
0.8917251, 0.7517856, 1.246889, 1, 1, 1, 1, 1,
0.8923389, 0.6374143, -0.08530272, 1, 1, 1, 1, 1,
0.8959528, 0.5572799, 0.7433763, 1, 1, 1, 1, 1,
0.9024588, -0.9850306, 3.035028, 1, 1, 1, 1, 1,
0.9028507, 1.215552, -1.839476, 1, 1, 1, 1, 1,
0.912459, 1.192879, 1.33059, 1, 1, 1, 1, 1,
0.9143227, -0.8457344, 3.034739, 1, 1, 1, 1, 1,
0.9219935, -0.4887853, 1.50524, 1, 1, 1, 1, 1,
0.9226136, -1.578106, 2.210294, 1, 1, 1, 1, 1,
0.9239887, 0.106527, 1.291279, 1, 1, 1, 1, 1,
0.9262664, -1.13004, 1.443304, 1, 1, 1, 1, 1,
0.9274709, 1.174361, -0.3647791, 1, 1, 1, 1, 1,
0.9314291, -1.111535, 2.276618, 1, 1, 1, 1, 1,
0.9467594, -0.7648559, -0.138035, 0, 0, 1, 1, 1,
0.9470068, -0.8881173, 3.783297, 1, 0, 0, 1, 1,
0.9483845, 0.3199819, 2.199211, 1, 0, 0, 1, 1,
0.9560292, 1.132876, 0.5774546, 1, 0, 0, 1, 1,
0.9561769, -0.2070184, 2.360594, 1, 0, 0, 1, 1,
0.9600856, -0.7811846, 0.5914025, 1, 0, 0, 1, 1,
0.9617679, -0.87578, 1.518459, 0, 0, 0, 1, 1,
0.9657947, 1.071495, 1.850651, 0, 0, 0, 1, 1,
0.9664907, 1.370974, 2.136298, 0, 0, 0, 1, 1,
0.9715958, -1.59437, 1.99638, 0, 0, 0, 1, 1,
0.9775649, 0.06998724, 1.096583, 0, 0, 0, 1, 1,
0.9804528, 0.439373, -2.157995, 0, 0, 0, 1, 1,
0.9822736, -1.108289, 2.00493, 0, 0, 0, 1, 1,
0.9831047, 1.068338, 2.220517, 1, 1, 1, 1, 1,
0.9846266, 1.741885, 0.5030075, 1, 1, 1, 1, 1,
0.9905581, -1.871889, 2.544584, 1, 1, 1, 1, 1,
0.9936058, -1.953327, 3.9497, 1, 1, 1, 1, 1,
1.002864, 0.07659212, 2.544575, 1, 1, 1, 1, 1,
1.003134, -2.480518, 2.519637, 1, 1, 1, 1, 1,
1.005399, 0.2698193, 3.35791, 1, 1, 1, 1, 1,
1.006424, -1.442425, 2.04152, 1, 1, 1, 1, 1,
1.012152, 0.1804424, 2.150902, 1, 1, 1, 1, 1,
1.014438, 0.133299, 1.201074, 1, 1, 1, 1, 1,
1.016586, -0.1110532, 2.730755, 1, 1, 1, 1, 1,
1.018606, -0.09870199, 1.877031, 1, 1, 1, 1, 1,
1.023412, 0.1469255, 0.8418026, 1, 1, 1, 1, 1,
1.027057, 1.769199, -0.3542866, 1, 1, 1, 1, 1,
1.029038, -0.4197021, 2.913173, 1, 1, 1, 1, 1,
1.029534, 0.02682856, 2.135516, 0, 0, 1, 1, 1,
1.029921, -0.7453881, 2.017942, 1, 0, 0, 1, 1,
1.030092, -2.126996, 0.895528, 1, 0, 0, 1, 1,
1.038503, -0.798728, 0.1080084, 1, 0, 0, 1, 1,
1.041898, 0.2957892, 1.832882, 1, 0, 0, 1, 1,
1.044618, 0.9750137, 2.083452, 1, 0, 0, 1, 1,
1.044649, -1.541383, 2.382951, 0, 0, 0, 1, 1,
1.05408, 1.728799, 0.4781718, 0, 0, 0, 1, 1,
1.058047, -0.9090368, 0.08110645, 0, 0, 0, 1, 1,
1.061539, -1.003758, 2.226378, 0, 0, 0, 1, 1,
1.065911, -0.1719544, 1.291509, 0, 0, 0, 1, 1,
1.076627, 2.024887, 0.5459603, 0, 0, 0, 1, 1,
1.081979, 0.2734569, 1.155775, 0, 0, 0, 1, 1,
1.086525, 0.7381768, 1.241139, 1, 1, 1, 1, 1,
1.087269, 0.5076035, 3.047264, 1, 1, 1, 1, 1,
1.089868, 0.0156182, 2.137471, 1, 1, 1, 1, 1,
1.091661, -0.002296113, 1.037663, 1, 1, 1, 1, 1,
1.093356, -0.1652943, 2.007708, 1, 1, 1, 1, 1,
1.094213, -1.746389, 1.624142, 1, 1, 1, 1, 1,
1.095268, 0.7705266, 0.7371695, 1, 1, 1, 1, 1,
1.107874, -0.7568208, 1.260685, 1, 1, 1, 1, 1,
1.110706, -1.047007, 0.996472, 1, 1, 1, 1, 1,
1.121199, -0.4085832, 2.443319, 1, 1, 1, 1, 1,
1.121773, 0.6013365, 1.726776, 1, 1, 1, 1, 1,
1.124957, 0.06246454, 1.422283, 1, 1, 1, 1, 1,
1.125918, -0.4912055, 0.6092105, 1, 1, 1, 1, 1,
1.126692, 1.175629, 1.375353, 1, 1, 1, 1, 1,
1.132716, 0.6257588, 1.018432, 1, 1, 1, 1, 1,
1.140366, 0.5920218, -1.042454, 0, 0, 1, 1, 1,
1.145963, 0.8814312, 0.5953532, 1, 0, 0, 1, 1,
1.153177, 0.8944445, 1.565337, 1, 0, 0, 1, 1,
1.159793, 1.615457, -0.3109748, 1, 0, 0, 1, 1,
1.162062, -0.4966486, 1.64335, 1, 0, 0, 1, 1,
1.162729, -1.197181, 0.8048745, 1, 0, 0, 1, 1,
1.163929, -1.106302, 3.758694, 0, 0, 0, 1, 1,
1.16648, 0.09124497, 1.815797, 0, 0, 0, 1, 1,
1.16846, -1.000616, 3.303424, 0, 0, 0, 1, 1,
1.173115, 1.335244, 2.291876, 0, 0, 0, 1, 1,
1.187372, -1.187485, 3.181495, 0, 0, 0, 1, 1,
1.19213, -0.5109059, 1.691755, 0, 0, 0, 1, 1,
1.192997, 0.226094, 0.6139048, 0, 0, 0, 1, 1,
1.194881, 0.5203543, 0.6783729, 1, 1, 1, 1, 1,
1.195061, 1.154617, 1.464998, 1, 1, 1, 1, 1,
1.195952, -0.7863188, 2.132032, 1, 1, 1, 1, 1,
1.198116, 1.608631, 0.8560752, 1, 1, 1, 1, 1,
1.205792, -0.08264881, 0.2654725, 1, 1, 1, 1, 1,
1.210027, 0.3398871, 0.5358075, 1, 1, 1, 1, 1,
1.216981, -1.273941, 1.512995, 1, 1, 1, 1, 1,
1.227891, 0.03203773, 1.059708, 1, 1, 1, 1, 1,
1.230126, -1.910063, 3.928086, 1, 1, 1, 1, 1,
1.231414, -0.2246733, 1.216537, 1, 1, 1, 1, 1,
1.235433, 1.238294, 1.409945, 1, 1, 1, 1, 1,
1.236152, -0.8237288, 2.040286, 1, 1, 1, 1, 1,
1.236927, 0.006350987, 0.1108629, 1, 1, 1, 1, 1,
1.244583, -1.115446, 2.941695, 1, 1, 1, 1, 1,
1.254673, 0.3793593, 1.404419, 1, 1, 1, 1, 1,
1.260242, -1.772565, 2.087325, 0, 0, 1, 1, 1,
1.264156, 1.707208, 0.7375143, 1, 0, 0, 1, 1,
1.264876, 0.7882562, 1.0441, 1, 0, 0, 1, 1,
1.269835, 0.1261261, -0.4497595, 1, 0, 0, 1, 1,
1.285668, -0.1054678, 2.764399, 1, 0, 0, 1, 1,
1.28998, 0.1919114, 1.236663, 1, 0, 0, 1, 1,
1.290516, -1.300865, 2.637118, 0, 0, 0, 1, 1,
1.297693, 0.4901176, 1.520989, 0, 0, 0, 1, 1,
1.299577, 0.7222452, 1.219883, 0, 0, 0, 1, 1,
1.301426, 0.5741356, 1.074279, 0, 0, 0, 1, 1,
1.302412, 0.9195158, 0.5676611, 0, 0, 0, 1, 1,
1.305696, 0.9744042, 0.6830631, 0, 0, 0, 1, 1,
1.305744, -0.6945879, 0.5490131, 0, 0, 0, 1, 1,
1.311324, -0.3952402, 3.317744, 1, 1, 1, 1, 1,
1.315586, -0.02012412, 2.113312, 1, 1, 1, 1, 1,
1.31754, -1.015073, 1.778422, 1, 1, 1, 1, 1,
1.333246, -0.1488775, -0.01122116, 1, 1, 1, 1, 1,
1.337632, 0.5249564, 1.318673, 1, 1, 1, 1, 1,
1.341294, -0.2023336, 0.6982227, 1, 1, 1, 1, 1,
1.342423, 1.406253, -0.5964597, 1, 1, 1, 1, 1,
1.34265, -1.447114, 1.479122, 1, 1, 1, 1, 1,
1.345764, -0.4548196, 1.984912, 1, 1, 1, 1, 1,
1.347492, -2.605966, 0.9971485, 1, 1, 1, 1, 1,
1.351143, -0.2768229, 1.864393, 1, 1, 1, 1, 1,
1.356759, 0.04385622, 0.08602675, 1, 1, 1, 1, 1,
1.362905, 0.006119748, 1.013408, 1, 1, 1, 1, 1,
1.363845, 0.8187704, 1.623564, 1, 1, 1, 1, 1,
1.366005, -0.9900936, 1.450587, 1, 1, 1, 1, 1,
1.386327, -1.149042, 3.204645, 0, 0, 1, 1, 1,
1.388568, 0.220593, 1.530977, 1, 0, 0, 1, 1,
1.419071, 0.2639266, 0.823993, 1, 0, 0, 1, 1,
1.423121, 0.1402792, 1.058553, 1, 0, 0, 1, 1,
1.425902, 1.159651, 0.8364783, 1, 0, 0, 1, 1,
1.426324, -1.065943, 1.629672, 1, 0, 0, 1, 1,
1.453053, -1.112621, 3.867033, 0, 0, 0, 1, 1,
1.456282, -0.0004592345, 3.032373, 0, 0, 0, 1, 1,
1.47052, -1.505496, 1.617122, 0, 0, 0, 1, 1,
1.484341, 0.03639813, 1.236791, 0, 0, 0, 1, 1,
1.498378, -0.1708363, 1.48754, 0, 0, 0, 1, 1,
1.501508, 0.2625467, 1.735996, 0, 0, 0, 1, 1,
1.507388, 1.039441, 3.305273, 0, 0, 0, 1, 1,
1.507636, -1.090338, 0.6912828, 1, 1, 1, 1, 1,
1.5112, 1.408375, 1.12914, 1, 1, 1, 1, 1,
1.53662, -1.028959, 3.629271, 1, 1, 1, 1, 1,
1.553835, 0.228377, 1.070043, 1, 1, 1, 1, 1,
1.588386, 1.459833, 0.3017482, 1, 1, 1, 1, 1,
1.606308, 0.05477079, 2.438872, 1, 1, 1, 1, 1,
1.609037, 0.8831985, 0.5894933, 1, 1, 1, 1, 1,
1.632297, 0.05976958, 2.443321, 1, 1, 1, 1, 1,
1.662369, -0.316085, 2.597715, 1, 1, 1, 1, 1,
1.663557, 0.465232, 1.285095, 1, 1, 1, 1, 1,
1.675716, -1.425978, 1.774261, 1, 1, 1, 1, 1,
1.688404, -0.2395463, 2.250891, 1, 1, 1, 1, 1,
1.692408, -0.1503208, 0.2891187, 1, 1, 1, 1, 1,
1.693343, 1.337344, 1.343757, 1, 1, 1, 1, 1,
1.716555, -1.6018, 2.208868, 1, 1, 1, 1, 1,
1.718239, 1.041538, -0.07778586, 0, 0, 1, 1, 1,
1.725243, 1.356544, 1.991436, 1, 0, 0, 1, 1,
1.731068, 1.000506, 1.692955, 1, 0, 0, 1, 1,
1.737373, -0.2056869, 2.149287, 1, 0, 0, 1, 1,
1.753324, 0.9028952, 1.724183, 1, 0, 0, 1, 1,
1.76823, 0.4130206, 0.7268562, 1, 0, 0, 1, 1,
1.783322, 0.07419691, 0.2994607, 0, 0, 0, 1, 1,
1.793363, 1.79142, 1.547324, 0, 0, 0, 1, 1,
1.799102, -0.8299079, 1.790269, 0, 0, 0, 1, 1,
1.810667, -0.294935, 3.44837, 0, 0, 0, 1, 1,
1.821271, -1.200022, 1.433774, 0, 0, 0, 1, 1,
1.822881, 0.2185791, 2.125702, 0, 0, 0, 1, 1,
1.825779, 0.9572418, 1.042038, 0, 0, 0, 1, 1,
1.857942, 0.1656935, 0.6619406, 1, 1, 1, 1, 1,
1.873923, -0.0278265, 1.328135, 1, 1, 1, 1, 1,
1.895183, -1.095399, 2.386911, 1, 1, 1, 1, 1,
1.911594, -0.4502002, 2.928062, 1, 1, 1, 1, 1,
1.912888, 0.2879697, 2.720174, 1, 1, 1, 1, 1,
1.914108, -0.5094606, 0.7620788, 1, 1, 1, 1, 1,
1.958707, 0.01441643, 1.814267, 1, 1, 1, 1, 1,
2.016628, 0.6307757, 0.4061844, 1, 1, 1, 1, 1,
2.024304, 1.571537, 2.336135, 1, 1, 1, 1, 1,
2.059378, -0.8875303, 2.095771, 1, 1, 1, 1, 1,
2.071512, 0.9034146, 0.2998887, 1, 1, 1, 1, 1,
2.083569, 0.5676662, 0.6734436, 1, 1, 1, 1, 1,
2.088358, -0.09668687, 0.9516152, 1, 1, 1, 1, 1,
2.118656, -0.06796409, 0.2573426, 1, 1, 1, 1, 1,
2.146178, -0.8824819, 0.9407294, 1, 1, 1, 1, 1,
2.16212, 0.8714513, 2.523448, 0, 0, 1, 1, 1,
2.182773, 1.686856, 1.624809, 1, 0, 0, 1, 1,
2.195271, -0.5256711, 3.472417, 1, 0, 0, 1, 1,
2.249491, 1.373887, 0.7249765, 1, 0, 0, 1, 1,
2.284702, 1.576118, 0.7035336, 1, 0, 0, 1, 1,
2.286705, -1.679771, 4.26914, 1, 0, 0, 1, 1,
2.296405, 1.270874, 1.229621, 0, 0, 0, 1, 1,
2.347999, 1.69597, 0.2840976, 0, 0, 0, 1, 1,
2.359614, 0.1500629, 0.8433377, 0, 0, 0, 1, 1,
2.359982, -0.5043518, 2.032358, 0, 0, 0, 1, 1,
2.421293, 1.142308, 0.2269246, 0, 0, 0, 1, 1,
2.468928, 0.1407545, 1.238171, 0, 0, 0, 1, 1,
2.496633, 1.446483, -0.3301368, 0, 0, 0, 1, 1,
2.499904, -0.3768073, 1.413648, 1, 1, 1, 1, 1,
2.523528, 0.8278839, 0.939141, 1, 1, 1, 1, 1,
2.619411, -0.5058926, 2.164992, 1, 1, 1, 1, 1,
2.7112, -1.718923, 3.054358, 1, 1, 1, 1, 1,
2.89144, -0.9493583, 1.550322, 1, 1, 1, 1, 1,
2.907154, -1.480223, 3.076097, 1, 1, 1, 1, 1,
3.315134, 0.8186652, 0.9479604, 1, 1, 1, 1, 1
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
var radius = 9.320662;
var distance = 32.73843;
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
mvMatrix.translate( -0.2945566, 0.2925972, 0.05875993 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73843);
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
