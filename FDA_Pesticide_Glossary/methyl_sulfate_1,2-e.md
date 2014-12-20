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
-2.94332, -0.7812095, -1.381525, 1, 0, 0, 1,
-2.739611, 1.295702, -0.9620474, 1, 0.007843138, 0, 1,
-2.690265, -0.2971946, -0.5739695, 1, 0.01176471, 0, 1,
-2.66305, -1.647874, -2.618305, 1, 0.01960784, 0, 1,
-2.641681, -0.8192539, -0.9919527, 1, 0.02352941, 0, 1,
-2.639407, -0.8989077, -1.917403, 1, 0.03137255, 0, 1,
-2.610547, 0.2698695, -1.79309, 1, 0.03529412, 0, 1,
-2.538025, -1.193459, -0.9773431, 1, 0.04313726, 0, 1,
-2.43666, 0.3251115, -2.468187, 1, 0.04705882, 0, 1,
-2.354276, 0.1945986, -0.9241003, 1, 0.05490196, 0, 1,
-2.294579, 0.2423413, -1.27699, 1, 0.05882353, 0, 1,
-2.29207, 0.1488509, -2.089617, 1, 0.06666667, 0, 1,
-2.242337, -0.1352611, -0.3306635, 1, 0.07058824, 0, 1,
-2.23264, 0.6061789, -2.072823, 1, 0.07843138, 0, 1,
-2.22817, 0.9568747, -0.4348266, 1, 0.08235294, 0, 1,
-2.191934, -0.5717779, -1.209363, 1, 0.09019608, 0, 1,
-2.160018, -0.5043947, -1.240736, 1, 0.09411765, 0, 1,
-2.158328, -2.461312, -1.247919, 1, 0.1019608, 0, 1,
-2.12338, 2.264943, 0.4464172, 1, 0.1098039, 0, 1,
-2.102723, 0.9768057, -1.519401, 1, 0.1137255, 0, 1,
-2.093915, -3.363673, -5.650602, 1, 0.1215686, 0, 1,
-2.068364, -0.143875, -2.0632, 1, 0.1254902, 0, 1,
-2.065068, 1.494177, -2.699209, 1, 0.1333333, 0, 1,
-2.040101, -1.180368, -2.406066, 1, 0.1372549, 0, 1,
-2.002164, 1.18918, -0.004074323, 1, 0.145098, 0, 1,
-1.993528, -1.069619, -2.289561, 1, 0.1490196, 0, 1,
-1.989469, 0.5329554, -1.137988, 1, 0.1568628, 0, 1,
-1.980652, -0.2775172, -0.7522225, 1, 0.1607843, 0, 1,
-1.954837, 1.117791, -0.632322, 1, 0.1686275, 0, 1,
-1.941527, 2.530111, -1.311481, 1, 0.172549, 0, 1,
-1.885603, -1.958056, -2.271118, 1, 0.1803922, 0, 1,
-1.874085, 0.3086965, -1.08255, 1, 0.1843137, 0, 1,
-1.868383, -0.1662921, -3.028302, 1, 0.1921569, 0, 1,
-1.85413, -1.145616, -3.559662, 1, 0.1960784, 0, 1,
-1.846243, -2.125252, -2.187332, 1, 0.2039216, 0, 1,
-1.842062, 1.290629, -1.676561, 1, 0.2117647, 0, 1,
-1.818158, -0.5836546, -1.681311, 1, 0.2156863, 0, 1,
-1.80507, 0.3895633, -0.1299121, 1, 0.2235294, 0, 1,
-1.798457, 1.19136, 1.870011, 1, 0.227451, 0, 1,
-1.785791, -1.461167, -1.391218, 1, 0.2352941, 0, 1,
-1.777115, 0.8139672, 0.6651126, 1, 0.2392157, 0, 1,
-1.770707, 0.4228004, 0.4166539, 1, 0.2470588, 0, 1,
-1.766123, -1.387236, -2.624965, 1, 0.2509804, 0, 1,
-1.765824, 1.051757, -0.5152955, 1, 0.2588235, 0, 1,
-1.764135, 0.3581209, -2.686133, 1, 0.2627451, 0, 1,
-1.760973, 0.7757933, -0.6145241, 1, 0.2705882, 0, 1,
-1.753294, -0.02260208, -2.317649, 1, 0.2745098, 0, 1,
-1.732469, 0.5748194, -0.002571471, 1, 0.282353, 0, 1,
-1.732257, 0.190107, -1.79566, 1, 0.2862745, 0, 1,
-1.695112, -0.8440307, -2.642771, 1, 0.2941177, 0, 1,
-1.686913, 1.817764, -0.8617151, 1, 0.3019608, 0, 1,
-1.683807, 0.7426385, -0.527965, 1, 0.3058824, 0, 1,
-1.673904, -0.915343, -3.543688, 1, 0.3137255, 0, 1,
-1.667773, 0.6109486, -1.669937, 1, 0.3176471, 0, 1,
-1.659389, -0.2818428, -0.09290075, 1, 0.3254902, 0, 1,
-1.659273, -0.6420041, -1.317978, 1, 0.3294118, 0, 1,
-1.646325, 0.5273089, -1.265351, 1, 0.3372549, 0, 1,
-1.646238, -1.175, -1.482478, 1, 0.3411765, 0, 1,
-1.621428, 0.2391907, -0.844149, 1, 0.3490196, 0, 1,
-1.612649, 1.319789, -1.689355, 1, 0.3529412, 0, 1,
-1.609734, -0.1052643, -2.089576, 1, 0.3607843, 0, 1,
-1.608924, -0.4512881, -3.373809, 1, 0.3647059, 0, 1,
-1.607037, -0.6550956, -1.473483, 1, 0.372549, 0, 1,
-1.606675, -0.08634324, -1.282663, 1, 0.3764706, 0, 1,
-1.60475, -0.5429865, -2.25737, 1, 0.3843137, 0, 1,
-1.603821, 0.7489025, -0.6668811, 1, 0.3882353, 0, 1,
-1.591036, -0.617683, -1.204512, 1, 0.3960784, 0, 1,
-1.567524, 0.3222547, 0.01831277, 1, 0.4039216, 0, 1,
-1.553077, 1.474098, -0.2382804, 1, 0.4078431, 0, 1,
-1.552857, 1.091496, -0.3457019, 1, 0.4156863, 0, 1,
-1.546471, 0.8217018, -3.155555, 1, 0.4196078, 0, 1,
-1.531225, -1.153739, -1.529696, 1, 0.427451, 0, 1,
-1.521801, -1.130597, -2.158699, 1, 0.4313726, 0, 1,
-1.504572, 0.4159058, -1.160149, 1, 0.4392157, 0, 1,
-1.478588, 0.8262688, -0.9611158, 1, 0.4431373, 0, 1,
-1.467454, 2.028955, -1.213392, 1, 0.4509804, 0, 1,
-1.454667, -0.9344862, -2.432289, 1, 0.454902, 0, 1,
-1.445888, -0.6711546, -1.555535, 1, 0.4627451, 0, 1,
-1.440859, 1.367703, 0.431673, 1, 0.4666667, 0, 1,
-1.437387, 0.09503878, -2.178509, 1, 0.4745098, 0, 1,
-1.424905, 0.1765592, -0.3946404, 1, 0.4784314, 0, 1,
-1.419499, -0.6042072, -2.09984, 1, 0.4862745, 0, 1,
-1.416871, 0.7639123, -0.1279438, 1, 0.4901961, 0, 1,
-1.402333, -0.2703642, -0.4991541, 1, 0.4980392, 0, 1,
-1.394067, -0.5167244, -2.318596, 1, 0.5058824, 0, 1,
-1.382698, -1.567278, -1.639983, 1, 0.509804, 0, 1,
-1.381329, 0.9242227, -1.885306, 1, 0.5176471, 0, 1,
-1.36737, -0.7037817, -2.19337, 1, 0.5215687, 0, 1,
-1.363938, 0.5906194, -2.979172, 1, 0.5294118, 0, 1,
-1.361231, -1.187606, 0.3342093, 1, 0.5333334, 0, 1,
-1.360806, 0.341291, 0.3208203, 1, 0.5411765, 0, 1,
-1.349379, -0.5628174, -2.164285, 1, 0.5450981, 0, 1,
-1.3466, -0.7213948, -1.624278, 1, 0.5529412, 0, 1,
-1.345499, -2.581322, -2.793778, 1, 0.5568628, 0, 1,
-1.335575, -0.5049431, -2.535668, 1, 0.5647059, 0, 1,
-1.326162, -1.450532, -1.413107, 1, 0.5686275, 0, 1,
-1.321175, -0.4374734, -0.06617207, 1, 0.5764706, 0, 1,
-1.319558, 1.5341, 0.0220059, 1, 0.5803922, 0, 1,
-1.318709, -0.08889166, -2.700305, 1, 0.5882353, 0, 1,
-1.318346, -0.8501687, -3.061405, 1, 0.5921569, 0, 1,
-1.315453, 0.6269808, -0.3467175, 1, 0.6, 0, 1,
-1.314562, -0.003945699, -1.395232, 1, 0.6078432, 0, 1,
-1.30819, 0.09226862, -0.9649209, 1, 0.6117647, 0, 1,
-1.298629, -0.4790872, -2.689371, 1, 0.6196079, 0, 1,
-1.298271, 0.6573282, -0.1622721, 1, 0.6235294, 0, 1,
-1.297961, -1.434977, -2.339418, 1, 0.6313726, 0, 1,
-1.288656, 1.003248, -1.183354, 1, 0.6352941, 0, 1,
-1.285289, -0.5678077, -1.314474, 1, 0.6431373, 0, 1,
-1.276829, -0.1137442, -2.530486, 1, 0.6470588, 0, 1,
-1.274277, -0.9686168, -1.678166, 1, 0.654902, 0, 1,
-1.270889, 0.1277441, -1.03021, 1, 0.6588235, 0, 1,
-1.26862, -0.7516363, -1.292885, 1, 0.6666667, 0, 1,
-1.267514, 0.871477, -3.450042, 1, 0.6705883, 0, 1,
-1.265792, 0.1280472, -2.987644, 1, 0.6784314, 0, 1,
-1.2615, 0.8517001, -0.9705457, 1, 0.682353, 0, 1,
-1.257873, -0.04496971, -1.069474, 1, 0.6901961, 0, 1,
-1.257267, -0.6772245, -0.7026889, 1, 0.6941177, 0, 1,
-1.256765, 1.635629, -1.216105, 1, 0.7019608, 0, 1,
-1.25673, 0.2644597, -2.884475, 1, 0.7098039, 0, 1,
-1.249558, 0.8762547, -1.684798, 1, 0.7137255, 0, 1,
-1.248741, 1.525059, -0.05265726, 1, 0.7215686, 0, 1,
-1.230387, -1.037541, -0.6519705, 1, 0.7254902, 0, 1,
-1.228826, 0.691691, -0.9530775, 1, 0.7333333, 0, 1,
-1.227834, -0.7447994, -3.436013, 1, 0.7372549, 0, 1,
-1.222461, -0.5362887, 0.1873938, 1, 0.7450981, 0, 1,
-1.218534, 1.286075, -1.983416, 1, 0.7490196, 0, 1,
-1.2149, 0.8779606, 0.9693958, 1, 0.7568628, 0, 1,
-1.203174, 0.1608182, -1.764126, 1, 0.7607843, 0, 1,
-1.202234, 0.5175708, -1.503008, 1, 0.7686275, 0, 1,
-1.197111, -0.7370216, -1.783111, 1, 0.772549, 0, 1,
-1.194634, 0.6804856, -0.2475619, 1, 0.7803922, 0, 1,
-1.185841, -0.2867241, -1.656673, 1, 0.7843137, 0, 1,
-1.184728, 0.7911625, -2.237298, 1, 0.7921569, 0, 1,
-1.178003, -1.960811, -3.839389, 1, 0.7960784, 0, 1,
-1.175152, 0.6582052, -2.495219, 1, 0.8039216, 0, 1,
-1.172386, 0.2665992, -2.504474, 1, 0.8117647, 0, 1,
-1.170889, 1.725817, 0.2572659, 1, 0.8156863, 0, 1,
-1.169168, -0.9297825, -2.892736, 1, 0.8235294, 0, 1,
-1.166393, 0.4783814, -0.3372444, 1, 0.827451, 0, 1,
-1.164953, 0.2232178, -0.02441676, 1, 0.8352941, 0, 1,
-1.152925, 0.07273028, -2.079991, 1, 0.8392157, 0, 1,
-1.151221, 0.1184992, -2.555431, 1, 0.8470588, 0, 1,
-1.145648, -0.5453471, -3.375797, 1, 0.8509804, 0, 1,
-1.138324, 0.01320655, -1.885174, 1, 0.8588235, 0, 1,
-1.130857, -1.581407, -0.8407868, 1, 0.8627451, 0, 1,
-1.115125, -1.350944, -3.339753, 1, 0.8705882, 0, 1,
-1.109456, -1.357616, -3.164014, 1, 0.8745098, 0, 1,
-1.107005, 0.3559152, -2.081586, 1, 0.8823529, 0, 1,
-1.103009, -0.4716782, -2.284104, 1, 0.8862745, 0, 1,
-1.101924, -0.4919198, -4.308833, 1, 0.8941177, 0, 1,
-1.095417, 1.355729, -2.004443, 1, 0.8980392, 0, 1,
-1.089004, 1.433947, -1.145391, 1, 0.9058824, 0, 1,
-1.0871, 0.7654983, -1.489223, 1, 0.9137255, 0, 1,
-1.084152, 1.175726, 0.6245131, 1, 0.9176471, 0, 1,
-1.07968, -0.7105496, -2.234212, 1, 0.9254902, 0, 1,
-1.077039, 1.282957, -1.739505, 1, 0.9294118, 0, 1,
-1.063079, -1.810026, -2.549869, 1, 0.9372549, 0, 1,
-1.058154, -1.154893, -1.142226, 1, 0.9411765, 0, 1,
-1.045226, -0.08516284, -1.612668, 1, 0.9490196, 0, 1,
-1.044394, 1.292801, 1.494102, 1, 0.9529412, 0, 1,
-1.040719, -1.141742, -0.7419743, 1, 0.9607843, 0, 1,
-1.038139, 0.2804455, -1.454993, 1, 0.9647059, 0, 1,
-1.034294, 1.15757, -0.5809709, 1, 0.972549, 0, 1,
-1.031797, -2.64999, -3.75215, 1, 0.9764706, 0, 1,
-1.029611, -1.028131, -1.868213, 1, 0.9843137, 0, 1,
-1.017707, -0.284492, -1.265474, 1, 0.9882353, 0, 1,
-1.010508, 2.448575, -0.6169217, 1, 0.9960784, 0, 1,
-1.00901, -1.077718, -2.417691, 0.9960784, 1, 0, 1,
-1.00869, -0.05267584, 0.8886808, 0.9921569, 1, 0, 1,
-0.9990569, -0.2709692, -2.621334, 0.9843137, 1, 0, 1,
-0.998971, -0.03057883, 0.2433374, 0.9803922, 1, 0, 1,
-0.9938944, -0.8276495, 0.009876397, 0.972549, 1, 0, 1,
-0.9931471, -0.212952, -0.7959166, 0.9686275, 1, 0, 1,
-0.988212, -0.4755724, -1.567239, 0.9607843, 1, 0, 1,
-0.983868, -0.06901384, -1.028831, 0.9568627, 1, 0, 1,
-0.9774394, -0.1954233, -0.738501, 0.9490196, 1, 0, 1,
-0.9718904, -0.256175, -0.7873502, 0.945098, 1, 0, 1,
-0.9716477, 0.926286, -0.7863879, 0.9372549, 1, 0, 1,
-0.9703612, 1.599819, -0.1541561, 0.9333333, 1, 0, 1,
-0.9696224, -0.3017277, -2.392378, 0.9254902, 1, 0, 1,
-0.9695593, -0.09498295, -1.653791, 0.9215686, 1, 0, 1,
-0.9611484, -0.9623104, -3.394842, 0.9137255, 1, 0, 1,
-0.959859, -1.385682, -3.189412, 0.9098039, 1, 0, 1,
-0.9576256, 0.7145121, -0.5914839, 0.9019608, 1, 0, 1,
-0.9548781, 1.553103, -0.6692822, 0.8941177, 1, 0, 1,
-0.9543374, 1.702046, -2.000049, 0.8901961, 1, 0, 1,
-0.942433, 0.5897209, -0.2105813, 0.8823529, 1, 0, 1,
-0.935519, -0.423585, -0.02918469, 0.8784314, 1, 0, 1,
-0.930927, -0.9407888, -2.60534, 0.8705882, 1, 0, 1,
-0.9285873, 0.7411674, -1.655133, 0.8666667, 1, 0, 1,
-0.9234498, -0.8544577, -1.419835, 0.8588235, 1, 0, 1,
-0.9151816, -0.3444013, -2.233909, 0.854902, 1, 0, 1,
-0.9137982, -0.7378292, -2.093901, 0.8470588, 1, 0, 1,
-0.9123375, 0.3009156, -2.953221, 0.8431373, 1, 0, 1,
-0.9112003, 0.8396919, -2.858632, 0.8352941, 1, 0, 1,
-0.9033815, 0.4789876, -1.803402, 0.8313726, 1, 0, 1,
-0.9002836, -0.2653254, -0.5583823, 0.8235294, 1, 0, 1,
-0.8970479, -0.7508203, -2.935724, 0.8196079, 1, 0, 1,
-0.896072, -2.354736, -3.010268, 0.8117647, 1, 0, 1,
-0.8933372, -0.2460338, -2.43856, 0.8078431, 1, 0, 1,
-0.890055, -0.5779312, -1.301261, 0.8, 1, 0, 1,
-0.8857694, -1.334599, -3.218624, 0.7921569, 1, 0, 1,
-0.8748419, 0.1458365, -1.25411, 0.7882353, 1, 0, 1,
-0.8739595, -2.663601, -2.786807, 0.7803922, 1, 0, 1,
-0.8712217, -1.494748, -1.976445, 0.7764706, 1, 0, 1,
-0.8638449, 0.2165003, -0.001700968, 0.7686275, 1, 0, 1,
-0.8590308, -1.442922, -1.903112, 0.7647059, 1, 0, 1,
-0.8588915, 0.3966298, -0.4566215, 0.7568628, 1, 0, 1,
-0.8556799, -0.53015, -2.77631, 0.7529412, 1, 0, 1,
-0.8553161, 0.8840963, 0.9416832, 0.7450981, 1, 0, 1,
-0.8455654, 1.09685, -1.310193, 0.7411765, 1, 0, 1,
-0.8385596, -2.046229, -1.596667, 0.7333333, 1, 0, 1,
-0.8280793, 0.443435, -1.328917, 0.7294118, 1, 0, 1,
-0.8204377, -0.8519242, -2.295161, 0.7215686, 1, 0, 1,
-0.8163105, -0.4843945, -2.796152, 0.7176471, 1, 0, 1,
-0.8155257, -0.05429141, -1.753232, 0.7098039, 1, 0, 1,
-0.8142269, -1.142952, -3.747347, 0.7058824, 1, 0, 1,
-0.8136982, 1.020731, 0.2862749, 0.6980392, 1, 0, 1,
-0.8048421, -0.03884481, -2.30098, 0.6901961, 1, 0, 1,
-0.8045604, -0.8815566, -2.498797, 0.6862745, 1, 0, 1,
-0.800408, 1.676093, 0.07058243, 0.6784314, 1, 0, 1,
-0.7884042, -0.5940642, -1.766997, 0.6745098, 1, 0, 1,
-0.7872564, 1.319576, -0.213216, 0.6666667, 1, 0, 1,
-0.7853616, 1.800316, -1.226207, 0.6627451, 1, 0, 1,
-0.7818359, 0.04582976, -0.7436808, 0.654902, 1, 0, 1,
-0.7749185, -1.267132, -3.321144, 0.6509804, 1, 0, 1,
-0.7713345, 1.413047, -1.351424, 0.6431373, 1, 0, 1,
-0.7687735, 1.653477, -0.09265102, 0.6392157, 1, 0, 1,
-0.7604353, 0.1872133, -0.4312441, 0.6313726, 1, 0, 1,
-0.7506291, 1.064122, -1.05692, 0.627451, 1, 0, 1,
-0.7504951, 0.4553077, -3.504243, 0.6196079, 1, 0, 1,
-0.7442251, 0.8913782, -0.4945801, 0.6156863, 1, 0, 1,
-0.7259595, -1.527876, -3.061339, 0.6078432, 1, 0, 1,
-0.718529, 1.170479, -0.4424431, 0.6039216, 1, 0, 1,
-0.7145698, 0.3844248, -0.5798708, 0.5960785, 1, 0, 1,
-0.7145287, 0.4539441, -0.2029956, 0.5882353, 1, 0, 1,
-0.7120618, -1.812453, -3.532505, 0.5843138, 1, 0, 1,
-0.7106918, -0.2451607, -1.294973, 0.5764706, 1, 0, 1,
-0.708075, 0.3796359, -0.5735577, 0.572549, 1, 0, 1,
-0.7068253, 2.15223, -0.4086896, 0.5647059, 1, 0, 1,
-0.705626, -0.4897481, -0.3351245, 0.5607843, 1, 0, 1,
-0.7026284, -0.07124408, -1.787679, 0.5529412, 1, 0, 1,
-0.6998519, -0.2651877, -4.15061, 0.5490196, 1, 0, 1,
-0.6990704, -0.1793799, -0.9952578, 0.5411765, 1, 0, 1,
-0.6956197, -0.2296915, -0.9565347, 0.5372549, 1, 0, 1,
-0.69073, 1.068823, -1.9807, 0.5294118, 1, 0, 1,
-0.6886879, 1.145812, -0.8548008, 0.5254902, 1, 0, 1,
-0.6886609, 0.7771612, -0.9772571, 0.5176471, 1, 0, 1,
-0.6831183, -0.9322757, -3.289345, 0.5137255, 1, 0, 1,
-0.6728186, 0.6735235, -1.728421, 0.5058824, 1, 0, 1,
-0.6688483, -1.629524, -3.017565, 0.5019608, 1, 0, 1,
-0.6653503, 1.149433, -1.772649, 0.4941176, 1, 0, 1,
-0.6646841, 0.9083268, -1.783704, 0.4862745, 1, 0, 1,
-0.6639017, -0.8859803, -3.015216, 0.4823529, 1, 0, 1,
-0.6599928, 0.8303095, -1.338648, 0.4745098, 1, 0, 1,
-0.6593625, 0.9350352, -0.1252492, 0.4705882, 1, 0, 1,
-0.6564774, -0.3059429, -2.114769, 0.4627451, 1, 0, 1,
-0.6535405, -0.602731, -1.282234, 0.4588235, 1, 0, 1,
-0.6483158, -0.872447, -2.248915, 0.4509804, 1, 0, 1,
-0.639653, -0.3577516, -2.670683, 0.4470588, 1, 0, 1,
-0.6395102, 0.6948742, -0.3521866, 0.4392157, 1, 0, 1,
-0.6351421, -0.8318086, -5.135513, 0.4352941, 1, 0, 1,
-0.6299548, 0.9133835, 0.5003787, 0.427451, 1, 0, 1,
-0.62636, -0.9059431, -1.967194, 0.4235294, 1, 0, 1,
-0.6222211, 1.142702, -1.212616, 0.4156863, 1, 0, 1,
-0.6170361, 0.09730256, -3.021645, 0.4117647, 1, 0, 1,
-0.6121115, -1.3292, -3.091651, 0.4039216, 1, 0, 1,
-0.6113377, 0.5387796, -0.514584, 0.3960784, 1, 0, 1,
-0.6111873, -0.4120865, -2.617162, 0.3921569, 1, 0, 1,
-0.6099945, 1.791524, -2.649415, 0.3843137, 1, 0, 1,
-0.607425, -0.8109523, -5.63161, 0.3803922, 1, 0, 1,
-0.6052188, 1.250733, -0.6362728, 0.372549, 1, 0, 1,
-0.6042032, 0.08822662, -1.040095, 0.3686275, 1, 0, 1,
-0.5979507, 0.4907084, -2.326684, 0.3607843, 1, 0, 1,
-0.5937913, 0.7042822, -1.315084, 0.3568628, 1, 0, 1,
-0.591436, 0.2540876, -2.614257, 0.3490196, 1, 0, 1,
-0.5898957, -1.080079, -4.753658, 0.345098, 1, 0, 1,
-0.5889858, -1.435938, -2.981288, 0.3372549, 1, 0, 1,
-0.5888513, 1.50192, 0.06683076, 0.3333333, 1, 0, 1,
-0.5857431, 1.234596, -0.1105778, 0.3254902, 1, 0, 1,
-0.5850571, -0.03810849, -1.137088, 0.3215686, 1, 0, 1,
-0.5843749, -0.6038749, -2.665635, 0.3137255, 1, 0, 1,
-0.5772513, -0.08393912, -2.180358, 0.3098039, 1, 0, 1,
-0.5752578, -0.7072265, -0.5689558, 0.3019608, 1, 0, 1,
-0.5733206, 0.9551722, -0.7283244, 0.2941177, 1, 0, 1,
-0.5723834, -1.329868, -2.126343, 0.2901961, 1, 0, 1,
-0.5640277, -0.6400192, -1.732884, 0.282353, 1, 0, 1,
-0.5622574, 0.6812001, -0.8793742, 0.2784314, 1, 0, 1,
-0.5604826, 0.1047389, -0.9714707, 0.2705882, 1, 0, 1,
-0.5601913, 0.2127873, -1.362398, 0.2666667, 1, 0, 1,
-0.5586308, -0.2626306, -0.4982743, 0.2588235, 1, 0, 1,
-0.553924, -1.451917, -3.276986, 0.254902, 1, 0, 1,
-0.5538676, -0.3234853, -2.312018, 0.2470588, 1, 0, 1,
-0.5500427, -0.4184151, -2.145406, 0.2431373, 1, 0, 1,
-0.5472152, -0.894197, -2.664209, 0.2352941, 1, 0, 1,
-0.5421339, -0.14333, -2.040982, 0.2313726, 1, 0, 1,
-0.5400577, 1.315022, 0.2062569, 0.2235294, 1, 0, 1,
-0.53757, -2.00419, -3.72288, 0.2196078, 1, 0, 1,
-0.5369533, -0.5233732, -2.057195, 0.2117647, 1, 0, 1,
-0.5369061, -1.224857, -4.256861, 0.2078431, 1, 0, 1,
-0.5362593, -1.159771, -3.04721, 0.2, 1, 0, 1,
-0.5317702, 0.8866242, -0.3805538, 0.1921569, 1, 0, 1,
-0.528708, 0.4996915, -0.712253, 0.1882353, 1, 0, 1,
-0.5246426, -1.509364, 0.1287997, 0.1803922, 1, 0, 1,
-0.5219317, 1.653219, -0.5897495, 0.1764706, 1, 0, 1,
-0.5196984, -0.1944429, -2.352212, 0.1686275, 1, 0, 1,
-0.5080442, -0.198799, -2.800792, 0.1647059, 1, 0, 1,
-0.50636, 0.02816808, -1.239969, 0.1568628, 1, 0, 1,
-0.5060043, 1.21126, -2.196225, 0.1529412, 1, 0, 1,
-0.5050124, 0.3270291, 0.3138946, 0.145098, 1, 0, 1,
-0.5017077, -0.3265586, -1.372051, 0.1411765, 1, 0, 1,
-0.5000888, -0.7404028, -2.900817, 0.1333333, 1, 0, 1,
-0.4952364, 0.463055, 1.029076, 0.1294118, 1, 0, 1,
-0.4946968, -1.313318, -4.085759, 0.1215686, 1, 0, 1,
-0.4926764, -0.2664689, -0.9061379, 0.1176471, 1, 0, 1,
-0.4873922, 0.1935467, -1.357222, 0.1098039, 1, 0, 1,
-0.4871899, 0.6080423, -0.0275627, 0.1058824, 1, 0, 1,
-0.4811871, 0.6598064, -0.1428774, 0.09803922, 1, 0, 1,
-0.4789163, -0.1800276, -4.20061, 0.09019608, 1, 0, 1,
-0.478688, 2.062426, -0.3327162, 0.08627451, 1, 0, 1,
-0.4758968, -0.6464446, -3.504656, 0.07843138, 1, 0, 1,
-0.4750813, 2.12585, -0.4868355, 0.07450981, 1, 0, 1,
-0.473172, 1.326607, 0.486913, 0.06666667, 1, 0, 1,
-0.4730317, 0.08848546, 0.01542827, 0.0627451, 1, 0, 1,
-0.4644322, 1.565443, -0.4225243, 0.05490196, 1, 0, 1,
-0.4612649, -0.5910735, -2.904458, 0.05098039, 1, 0, 1,
-0.4547959, -0.6782697, -2.400275, 0.04313726, 1, 0, 1,
-0.4523491, -0.8380966, -1.285103, 0.03921569, 1, 0, 1,
-0.4457305, -0.01692741, -3.314427, 0.03137255, 1, 0, 1,
-0.4446012, -1.100114, -3.217289, 0.02745098, 1, 0, 1,
-0.4402195, -0.3121279, -1.19708, 0.01960784, 1, 0, 1,
-0.4397282, -1.169678, -2.9713, 0.01568628, 1, 0, 1,
-0.4354459, -0.7506832, -4.015069, 0.007843138, 1, 0, 1,
-0.4352631, 0.4289284, 0.20026, 0.003921569, 1, 0, 1,
-0.4295108, -1.085017, -2.911917, 0, 1, 0.003921569, 1,
-0.4294926, 0.165623, -1.225372, 0, 1, 0.01176471, 1,
-0.4273725, 0.5746799, -1.083429, 0, 1, 0.01568628, 1,
-0.4204904, 0.1587901, -1.307255, 0, 1, 0.02352941, 1,
-0.4200361, 2.040698, -0.3266548, 0, 1, 0.02745098, 1,
-0.414938, 0.2627148, -0.7904176, 0, 1, 0.03529412, 1,
-0.4131281, 1.141976, -0.04704538, 0, 1, 0.03921569, 1,
-0.4124123, -0.03831808, -2.567029, 0, 1, 0.04705882, 1,
-0.4119652, 0.1499594, -1.604944, 0, 1, 0.05098039, 1,
-0.408529, -0.4492934, -1.899396, 0, 1, 0.05882353, 1,
-0.4078475, -0.09448791, -2.542675, 0, 1, 0.0627451, 1,
-0.4058419, -0.1681743, -0.9309619, 0, 1, 0.07058824, 1,
-0.3968216, -0.4309286, -4.805485, 0, 1, 0.07450981, 1,
-0.3952307, -0.3655269, -2.697753, 0, 1, 0.08235294, 1,
-0.3934954, -0.7429587, -4.284109, 0, 1, 0.08627451, 1,
-0.3908441, -0.2262149, -3.130715, 0, 1, 0.09411765, 1,
-0.3888096, -1.335557, -2.637014, 0, 1, 0.1019608, 1,
-0.3779895, -0.09967087, -1.018089, 0, 1, 0.1058824, 1,
-0.3750626, -1.919177, -3.830171, 0, 1, 0.1137255, 1,
-0.3718163, -0.9006335, -1.562615, 0, 1, 0.1176471, 1,
-0.3686683, -0.06267482, -2.628787, 0, 1, 0.1254902, 1,
-0.366154, 0.9194024, -1.170565, 0, 1, 0.1294118, 1,
-0.3629341, 0.4854587, -0.5083263, 0, 1, 0.1372549, 1,
-0.3609607, 0.8812264, 0.3961546, 0, 1, 0.1411765, 1,
-0.3591989, 1.488796, -2.086605, 0, 1, 0.1490196, 1,
-0.3588143, -0.1077782, 0.2746965, 0, 1, 0.1529412, 1,
-0.357459, -1.691679, -5.46698, 0, 1, 0.1607843, 1,
-0.3552697, -1.351848, -4.012361, 0, 1, 0.1647059, 1,
-0.3548578, 0.1680547, -0.311912, 0, 1, 0.172549, 1,
-0.352814, 1.242261, -0.2701364, 0, 1, 0.1764706, 1,
-0.3523482, -0.126739, -2.323947, 0, 1, 0.1843137, 1,
-0.3421247, -0.5443277, -1.108855, 0, 1, 0.1882353, 1,
-0.3389213, -1.856793, -4.009655, 0, 1, 0.1960784, 1,
-0.3386857, -1.079212, -2.409666, 0, 1, 0.2039216, 1,
-0.3353437, -1.663684, -2.317995, 0, 1, 0.2078431, 1,
-0.3353123, -2.777499, -3.762904, 0, 1, 0.2156863, 1,
-0.3318781, 1.077323, -0.3428294, 0, 1, 0.2196078, 1,
-0.3307859, -0.5102684, -1.43154, 0, 1, 0.227451, 1,
-0.3295636, 0.5831572, 0.5255408, 0, 1, 0.2313726, 1,
-0.3278508, 0.4233021, -0.2991899, 0, 1, 0.2392157, 1,
-0.3277777, -0.2152971, -2.607797, 0, 1, 0.2431373, 1,
-0.3250839, 0.3317644, -1.832043, 0, 1, 0.2509804, 1,
-0.3240336, 1.392689, 1.446126, 0, 1, 0.254902, 1,
-0.3209752, 1.653157, -1.117998, 0, 1, 0.2627451, 1,
-0.3202134, 0.358937, -1.309908, 0, 1, 0.2666667, 1,
-0.3197759, -0.01386757, -0.6772099, 0, 1, 0.2745098, 1,
-0.319075, 0.5520566, -2.373998, 0, 1, 0.2784314, 1,
-0.3185137, -1.588932, -2.331682, 0, 1, 0.2862745, 1,
-0.3126606, 1.586777, -0.1413248, 0, 1, 0.2901961, 1,
-0.3109719, 0.8610647, -0.8690534, 0, 1, 0.2980392, 1,
-0.3089564, -1.302997, -2.024228, 0, 1, 0.3058824, 1,
-0.3064652, -0.6638985, -2.763562, 0, 1, 0.3098039, 1,
-0.3062021, -0.5086362, -5.048122, 0, 1, 0.3176471, 1,
-0.3048865, -1.607852, -4.267393, 0, 1, 0.3215686, 1,
-0.3006229, 1.298831, -1.277217, 0, 1, 0.3294118, 1,
-0.2975433, 0.4626543, 0.62507, 0, 1, 0.3333333, 1,
-0.2961298, -0.4448711, -4.165702, 0, 1, 0.3411765, 1,
-0.2944801, -0.6479501, -1.50832, 0, 1, 0.345098, 1,
-0.2933791, -1.24746, -3.902202, 0, 1, 0.3529412, 1,
-0.2784979, -2.448448, -3.521965, 0, 1, 0.3568628, 1,
-0.2770739, -0.4458173, -0.7094831, 0, 1, 0.3647059, 1,
-0.2748902, -1.724985, -2.309736, 0, 1, 0.3686275, 1,
-0.2746997, -1.134466, -1.808378, 0, 1, 0.3764706, 1,
-0.2735629, 2.111771, -1.212805, 0, 1, 0.3803922, 1,
-0.2700462, 0.2525223, -0.9177108, 0, 1, 0.3882353, 1,
-0.2650869, -0.694005, -3.557403, 0, 1, 0.3921569, 1,
-0.263085, 0.5416764, -0.5261778, 0, 1, 0.4, 1,
-0.2585672, 0.1531278, -0.513988, 0, 1, 0.4078431, 1,
-0.2521884, -0.06256783, -3.207335, 0, 1, 0.4117647, 1,
-0.2485969, 0.9009401, -0.8586624, 0, 1, 0.4196078, 1,
-0.2481105, 0.2308123, -3.326162, 0, 1, 0.4235294, 1,
-0.2464646, -1.09322, -2.078779, 0, 1, 0.4313726, 1,
-0.2460272, -0.8952, -3.464481, 0, 1, 0.4352941, 1,
-0.2450743, 1.025487, 0.5219965, 0, 1, 0.4431373, 1,
-0.2443803, -0.1267701, -3.534228, 0, 1, 0.4470588, 1,
-0.2433305, 0.1020229, -0.3788333, 0, 1, 0.454902, 1,
-0.241045, 0.5708568, -0.7237329, 0, 1, 0.4588235, 1,
-0.2368878, 1.499769, -0.4780434, 0, 1, 0.4666667, 1,
-0.231924, 0.9400735, -0.9314059, 0, 1, 0.4705882, 1,
-0.2298258, -2.701359, -2.385675, 0, 1, 0.4784314, 1,
-0.2217692, 0.7160131, 0.2783839, 0, 1, 0.4823529, 1,
-0.2214129, 0.2210056, -0.4981965, 0, 1, 0.4901961, 1,
-0.2168681, 1.011748, 0.3009345, 0, 1, 0.4941176, 1,
-0.2104127, -0.1578472, -2.128002, 0, 1, 0.5019608, 1,
-0.2084772, 0.1004622, -0.07772052, 0, 1, 0.509804, 1,
-0.2065936, 1.698595, -1.480628, 0, 1, 0.5137255, 1,
-0.2056023, 1.085469, 0.5640177, 0, 1, 0.5215687, 1,
-0.2013444, 1.445768, 1.23759, 0, 1, 0.5254902, 1,
-0.2005466, -0.3511701, -4.6524, 0, 1, 0.5333334, 1,
-0.1966873, -0.569347, -1.514872, 0, 1, 0.5372549, 1,
-0.1954815, -1.048846, -4.731015, 0, 1, 0.5450981, 1,
-0.1937997, 0.3882574, 1.059287, 0, 1, 0.5490196, 1,
-0.1915995, -0.6305314, -3.952639, 0, 1, 0.5568628, 1,
-0.1902654, 1.78555, -2.09299, 0, 1, 0.5607843, 1,
-0.1879842, -1.278279, -3.421048, 0, 1, 0.5686275, 1,
-0.1841794, -0.4498852, -0.9424288, 0, 1, 0.572549, 1,
-0.1833099, -1.205568, -4.588199, 0, 1, 0.5803922, 1,
-0.179597, 0.5290092, -2.454963, 0, 1, 0.5843138, 1,
-0.1794821, -1.682437, -1.563217, 0, 1, 0.5921569, 1,
-0.1626936, 1.448495, -0.6159896, 0, 1, 0.5960785, 1,
-0.1611831, 1.519228, -0.1128233, 0, 1, 0.6039216, 1,
-0.1475352, -0.9547737, -3.154818, 0, 1, 0.6117647, 1,
-0.1471996, -1.153828, -1.644021, 0, 1, 0.6156863, 1,
-0.1466092, -0.1973916, -0.9859149, 0, 1, 0.6235294, 1,
-0.1440704, -0.63998, -2.190404, 0, 1, 0.627451, 1,
-0.1388254, 0.14788, -2.559641, 0, 1, 0.6352941, 1,
-0.1365044, 0.366269, -2.836762, 0, 1, 0.6392157, 1,
-0.1363996, -0.2027963, -0.3040929, 0, 1, 0.6470588, 1,
-0.1319764, -1.075464, -3.748837, 0, 1, 0.6509804, 1,
-0.1285803, -0.1878913, -3.088022, 0, 1, 0.6588235, 1,
-0.1213265, -0.9599725, -2.675475, 0, 1, 0.6627451, 1,
-0.1183242, 0.4771922, -0.7509207, 0, 1, 0.6705883, 1,
-0.11681, 0.6180358, 0.7667577, 0, 1, 0.6745098, 1,
-0.1153476, 0.3679875, -1.33515, 0, 1, 0.682353, 1,
-0.115088, -0.9022291, -2.863773, 0, 1, 0.6862745, 1,
-0.1079168, -0.3822273, -2.637265, 0, 1, 0.6941177, 1,
-0.106934, -0.8671067, -2.518559, 0, 1, 0.7019608, 1,
-0.1029845, 0.6140694, -0.9872687, 0, 1, 0.7058824, 1,
-0.09694225, -0.7411183, -3.657958, 0, 1, 0.7137255, 1,
-0.09142473, 1.110686, -0.02094757, 0, 1, 0.7176471, 1,
-0.08929128, 1.167541, 0.775478, 0, 1, 0.7254902, 1,
-0.08358528, -0.4914167, -4.364619, 0, 1, 0.7294118, 1,
-0.08320917, -0.4598164, -2.2969, 0, 1, 0.7372549, 1,
-0.08222958, 0.1002406, -0.846189, 0, 1, 0.7411765, 1,
-0.08015648, 0.4776004, -0.4932729, 0, 1, 0.7490196, 1,
-0.07817053, -0.4908133, -2.164326, 0, 1, 0.7529412, 1,
-0.07721506, 1.818772, 0.4947714, 0, 1, 0.7607843, 1,
-0.07664349, -0.005522253, -4.496641, 0, 1, 0.7647059, 1,
-0.07623991, 0.7419822, 1.525283, 0, 1, 0.772549, 1,
-0.07614192, -0.2270522, -4.023092, 0, 1, 0.7764706, 1,
-0.07508305, -0.8371316, -0.9791608, 0, 1, 0.7843137, 1,
-0.07354441, -0.2238123, -3.131618, 0, 1, 0.7882353, 1,
-0.06836316, -0.4571551, -2.334221, 0, 1, 0.7960784, 1,
-0.06665411, -0.6800843, -4.027024, 0, 1, 0.8039216, 1,
-0.06354204, 1.038734, -1.732624, 0, 1, 0.8078431, 1,
-0.05513145, -0.4140089, -3.355705, 0, 1, 0.8156863, 1,
-0.05213232, -0.4983854, -2.011211, 0, 1, 0.8196079, 1,
-0.05065827, -1.031245, -3.847591, 0, 1, 0.827451, 1,
-0.04348065, -1.245104, -2.757679, 0, 1, 0.8313726, 1,
-0.03875469, -1.619401, -3.138222, 0, 1, 0.8392157, 1,
-0.03600391, 1.525459, -1.495528, 0, 1, 0.8431373, 1,
-0.03407991, -1.528945, -3.199577, 0, 1, 0.8509804, 1,
-0.03365843, 0.549328, 0.8912082, 0, 1, 0.854902, 1,
-0.03356824, 0.7023191, -1.932105, 0, 1, 0.8627451, 1,
-0.03216059, 1.70978, 1.797603, 0, 1, 0.8666667, 1,
-0.03043389, -0.4472884, -0.6436878, 0, 1, 0.8745098, 1,
-0.02990205, -2.239687, -2.661997, 0, 1, 0.8784314, 1,
-0.02839236, 1.239829, -0.8114155, 0, 1, 0.8862745, 1,
-0.02232589, 1.395828, -1.127619, 0, 1, 0.8901961, 1,
-0.01928601, -0.8660527, -1.814062, 0, 1, 0.8980392, 1,
-0.01406138, -2.135495, -3.125467, 0, 1, 0.9058824, 1,
-0.0123644, -1.056734, -3.052784, 0, 1, 0.9098039, 1,
-0.01170173, -0.8501182, -3.262671, 0, 1, 0.9176471, 1,
-0.002875421, -0.8240188, -3.942252, 0, 1, 0.9215686, 1,
0.0001491008, 0.008371806, 1.477855, 0, 1, 0.9294118, 1,
0.00362961, -0.4398585, 3.140022, 0, 1, 0.9333333, 1,
0.006785846, 1.343794, -1.766083, 0, 1, 0.9411765, 1,
0.01246067, 0.5453393, -0.2895832, 0, 1, 0.945098, 1,
0.01414105, 0.5766993, 0.2172136, 0, 1, 0.9529412, 1,
0.01592743, -1.890408, 3.414417, 0, 1, 0.9568627, 1,
0.01894378, 0.6363603, 0.2434986, 0, 1, 0.9647059, 1,
0.01956565, -0.1980188, 2.481168, 0, 1, 0.9686275, 1,
0.01965941, 2.390082, 1.330207, 0, 1, 0.9764706, 1,
0.01976911, 0.04684133, 1.67359, 0, 1, 0.9803922, 1,
0.02054796, 1.231486, 1.382247, 0, 1, 0.9882353, 1,
0.02272362, 0.5635105, 0.3349947, 0, 1, 0.9921569, 1,
0.02877769, 1.655462, 0.8019046, 0, 1, 1, 1,
0.0358514, 0.6522675, -1.101636, 0, 0.9921569, 1, 1,
0.03611958, -0.01600663, 0.9680051, 0, 0.9882353, 1, 1,
0.05236131, -0.1727461, 2.418814, 0, 0.9803922, 1, 1,
0.06050166, 0.7942844, -0.8663455, 0, 0.9764706, 1, 1,
0.06297139, -0.6221224, 4.305749, 0, 0.9686275, 1, 1,
0.06370498, -2.386568, 1.246815, 0, 0.9647059, 1, 1,
0.06415962, 0.2286643, 0.2117622, 0, 0.9568627, 1, 1,
0.07169962, -0.3670203, 3.01401, 0, 0.9529412, 1, 1,
0.07238136, 0.2058467, -0.8416172, 0, 0.945098, 1, 1,
0.07354878, -1.445729, 3.766784, 0, 0.9411765, 1, 1,
0.07383942, 1.40141, -0.5576679, 0, 0.9333333, 1, 1,
0.07432771, -0.1830501, 0.3269559, 0, 0.9294118, 1, 1,
0.07619369, 2.347495, 1.615563, 0, 0.9215686, 1, 1,
0.07710261, 1.703137, 0.2777761, 0, 0.9176471, 1, 1,
0.0808769, 0.6755485, 1.671408, 0, 0.9098039, 1, 1,
0.08234476, -0.1758859, 2.090296, 0, 0.9058824, 1, 1,
0.08889559, 1.081233, 1.207137, 0, 0.8980392, 1, 1,
0.09112683, -0.7313856, 2.578774, 0, 0.8901961, 1, 1,
0.09485318, -0.6338037, 5.027256, 0, 0.8862745, 1, 1,
0.09806852, -2.584316, 3.414698, 0, 0.8784314, 1, 1,
0.09899546, -0.4763502, 3.356778, 0, 0.8745098, 1, 1,
0.09937174, -0.9322068, 4.214947, 0, 0.8666667, 1, 1,
0.09954757, -0.03057214, 1.657488, 0, 0.8627451, 1, 1,
0.1031445, 0.2710597, -0.05373855, 0, 0.854902, 1, 1,
0.1086309, 1.326785, -1.697006, 0, 0.8509804, 1, 1,
0.1087241, -1.516728, 1.57307, 0, 0.8431373, 1, 1,
0.1104172, 1.088937, -0.5654556, 0, 0.8392157, 1, 1,
0.1114135, 1.795996, -0.1479896, 0, 0.8313726, 1, 1,
0.1118793, 0.09518779, 2.611302, 0, 0.827451, 1, 1,
0.1142497, 1.665485, 0.8206775, 0, 0.8196079, 1, 1,
0.1144566, 0.9891884, 1.061067, 0, 0.8156863, 1, 1,
0.1175972, 1.206796, 0.4866607, 0, 0.8078431, 1, 1,
0.1178733, -2.092542, 4.386997, 0, 0.8039216, 1, 1,
0.1182321, -0.5015757, 4.143195, 0, 0.7960784, 1, 1,
0.1226992, 0.1196835, 0.5624406, 0, 0.7882353, 1, 1,
0.1239969, -1.152167, 3.690042, 0, 0.7843137, 1, 1,
0.1242976, -0.3784724, 3.155839, 0, 0.7764706, 1, 1,
0.1244392, 0.7826524, 0.9670288, 0, 0.772549, 1, 1,
0.1259558, -1.695042, 3.041799, 0, 0.7647059, 1, 1,
0.1317624, -0.9623982, 0.9950702, 0, 0.7607843, 1, 1,
0.1348203, -1.032837, 1.898087, 0, 0.7529412, 1, 1,
0.1352655, -1.300858, 1.81197, 0, 0.7490196, 1, 1,
0.1367082, 1.847409, 2.465647, 0, 0.7411765, 1, 1,
0.1382149, 1.710969, -0.3998304, 0, 0.7372549, 1, 1,
0.138427, 0.832839, 1.233742, 0, 0.7294118, 1, 1,
0.1402742, -0.8060786, 2.208552, 0, 0.7254902, 1, 1,
0.1470998, 0.3964953, 2.05023, 0, 0.7176471, 1, 1,
0.1475259, 1.66648, 0.7240551, 0, 0.7137255, 1, 1,
0.1489506, 0.3434667, -0.09641813, 0, 0.7058824, 1, 1,
0.1493166, 1.151778, 0.6272195, 0, 0.6980392, 1, 1,
0.1509193, 0.4966024, 0.4196572, 0, 0.6941177, 1, 1,
0.150942, -0.2405896, 3.130675, 0, 0.6862745, 1, 1,
0.1513605, -1.764965, 4.56943, 0, 0.682353, 1, 1,
0.1579784, 0.5909415, 0.5389611, 0, 0.6745098, 1, 1,
0.1612373, 1.381159, -1.019837, 0, 0.6705883, 1, 1,
0.1631847, 0.3127356, -0.9582936, 0, 0.6627451, 1, 1,
0.1659389, -0.3503123, 3.36263, 0, 0.6588235, 1, 1,
0.1674617, 1.120046, -1.281395, 0, 0.6509804, 1, 1,
0.1705167, 1.307691, -0.1839897, 0, 0.6470588, 1, 1,
0.1705918, -0.09919325, 2.721908, 0, 0.6392157, 1, 1,
0.1722468, -0.3507926, 3.032789, 0, 0.6352941, 1, 1,
0.173187, -1.826463, 2.769861, 0, 0.627451, 1, 1,
0.1755223, -0.04316917, 1.374101, 0, 0.6235294, 1, 1,
0.1802079, -1.203301, 2.707162, 0, 0.6156863, 1, 1,
0.1803235, 1.938529, -0.9498724, 0, 0.6117647, 1, 1,
0.1808393, -0.05428616, 2.252514, 0, 0.6039216, 1, 1,
0.1812696, 2.629456, 1.971878, 0, 0.5960785, 1, 1,
0.1829041, 0.3114684, 0.9173631, 0, 0.5921569, 1, 1,
0.1839215, 1.186434, 0.503392, 0, 0.5843138, 1, 1,
0.190454, 1.275997, -1.573977, 0, 0.5803922, 1, 1,
0.1920631, -0.631974, 3.412788, 0, 0.572549, 1, 1,
0.1979483, -0.9972894, 3.987351, 0, 0.5686275, 1, 1,
0.1991076, 0.5159341, -0.8862122, 0, 0.5607843, 1, 1,
0.1992054, -0.5533948, 3.005703, 0, 0.5568628, 1, 1,
0.2033411, -1.735552, 2.926704, 0, 0.5490196, 1, 1,
0.2047251, -0.1366828, 2.641957, 0, 0.5450981, 1, 1,
0.2057502, 0.9750303, 1.037322, 0, 0.5372549, 1, 1,
0.2072223, 0.5382472, 0.6216391, 0, 0.5333334, 1, 1,
0.2074752, -0.3746162, 3.275691, 0, 0.5254902, 1, 1,
0.2093779, -0.3471003, 4.253988, 0, 0.5215687, 1, 1,
0.2176425, 0.9120068, 0.8979207, 0, 0.5137255, 1, 1,
0.2177095, -0.9895636, 2.948845, 0, 0.509804, 1, 1,
0.2204242, -0.3722622, 1.480809, 0, 0.5019608, 1, 1,
0.220712, -1.134481, 3.97397, 0, 0.4941176, 1, 1,
0.2209315, 0.2334455, 2.56533, 0, 0.4901961, 1, 1,
0.2214753, -0.1585925, 2.43637, 0, 0.4823529, 1, 1,
0.2220499, -0.03330684, 0.7676049, 0, 0.4784314, 1, 1,
0.2229643, -0.4339828, 0.4773967, 0, 0.4705882, 1, 1,
0.2276626, -0.04559162, 1.958377, 0, 0.4666667, 1, 1,
0.2278698, 0.429199, 0.2202629, 0, 0.4588235, 1, 1,
0.2281273, -0.1523409, 1.421969, 0, 0.454902, 1, 1,
0.2299477, 0.3226683, -0.2001393, 0, 0.4470588, 1, 1,
0.2357017, 0.1619166, 1.067697, 0, 0.4431373, 1, 1,
0.236213, 0.28078, -0.6052656, 0, 0.4352941, 1, 1,
0.2368924, -0.6019379, 3.159914, 0, 0.4313726, 1, 1,
0.2421491, 0.3937395, 1.995411, 0, 0.4235294, 1, 1,
0.2445143, -0.6555538, 3.201679, 0, 0.4196078, 1, 1,
0.2446846, 0.4217847, 1.483651, 0, 0.4117647, 1, 1,
0.2452614, -0.2963153, 2.691705, 0, 0.4078431, 1, 1,
0.2468053, 1.746447, -0.4046873, 0, 0.4, 1, 1,
0.25023, 2.055842, -0.4790612, 0, 0.3921569, 1, 1,
0.2560901, -0.4083613, 1.616154, 0, 0.3882353, 1, 1,
0.257863, 0.4849479, 0.5968781, 0, 0.3803922, 1, 1,
0.2581341, 0.5853148, -0.4016391, 0, 0.3764706, 1, 1,
0.2590196, -0.2546571, 4.739279, 0, 0.3686275, 1, 1,
0.260748, -0.3669419, 2.241852, 0, 0.3647059, 1, 1,
0.2630874, 1.352956, 1.050037, 0, 0.3568628, 1, 1,
0.2661956, 1.097561, -0.5138887, 0, 0.3529412, 1, 1,
0.2671733, -0.7270924, 3.611324, 0, 0.345098, 1, 1,
0.2713246, 2.399558, -0.9831955, 0, 0.3411765, 1, 1,
0.2714335, 0.4923458, -0.1934102, 0, 0.3333333, 1, 1,
0.2736971, 1.981987, 0.6878965, 0, 0.3294118, 1, 1,
0.2744198, -0.8720778, 4.618032, 0, 0.3215686, 1, 1,
0.2779182, -1.442613, 0.1180603, 0, 0.3176471, 1, 1,
0.2781781, -0.5057802, 3.680829, 0, 0.3098039, 1, 1,
0.2791434, 1.882665, 1.618131, 0, 0.3058824, 1, 1,
0.2791483, 0.2522368, 1.572531, 0, 0.2980392, 1, 1,
0.280405, -1.566931, 3.410914, 0, 0.2901961, 1, 1,
0.2864935, -1.322956, 2.33521, 0, 0.2862745, 1, 1,
0.2876823, 0.7818247, 0.2722076, 0, 0.2784314, 1, 1,
0.2922997, -0.3888875, 3.641308, 0, 0.2745098, 1, 1,
0.2924099, -1.51697, 3.878713, 0, 0.2666667, 1, 1,
0.2942297, 0.8437996, -1.289326, 0, 0.2627451, 1, 1,
0.2952754, 0.2597363, 1.414581, 0, 0.254902, 1, 1,
0.2975489, 1.444807, 0.7170762, 0, 0.2509804, 1, 1,
0.3011878, -0.03180504, 2.369081, 0, 0.2431373, 1, 1,
0.3199703, -0.9304044, 4.793486, 0, 0.2392157, 1, 1,
0.320131, -0.6060902, 3.591463, 0, 0.2313726, 1, 1,
0.323613, -1.072189, 3.244638, 0, 0.227451, 1, 1,
0.3273081, 1.039322, 1.650986, 0, 0.2196078, 1, 1,
0.3308026, 0.6856027, 1.010133, 0, 0.2156863, 1, 1,
0.3345065, -1.493085, 1.571638, 0, 0.2078431, 1, 1,
0.3367083, -1.16037, 3.961093, 0, 0.2039216, 1, 1,
0.3369237, -0.2300546, 1.707116, 0, 0.1960784, 1, 1,
0.3388192, 0.8810267, 1.582682, 0, 0.1882353, 1, 1,
0.3398462, -0.3054993, 2.78159, 0, 0.1843137, 1, 1,
0.3473938, 0.4302116, 0.3386534, 0, 0.1764706, 1, 1,
0.3509317, -0.04625487, 1.743237, 0, 0.172549, 1, 1,
0.3550715, -0.2364788, 2.462235, 0, 0.1647059, 1, 1,
0.3609596, -0.3869569, 2.682864, 0, 0.1607843, 1, 1,
0.3656214, 0.1159503, 2.707415, 0, 0.1529412, 1, 1,
0.3657401, -0.6738417, 2.042863, 0, 0.1490196, 1, 1,
0.3693037, 0.7089061, -0.155229, 0, 0.1411765, 1, 1,
0.3730122, 1.717152, 0.7919886, 0, 0.1372549, 1, 1,
0.373787, 0.1868384, 0.2216651, 0, 0.1294118, 1, 1,
0.3739612, 2.545435, -1.756197, 0, 0.1254902, 1, 1,
0.3766221, 0.3390083, -1.150166, 0, 0.1176471, 1, 1,
0.3841788, 0.4542041, -0.7495164, 0, 0.1137255, 1, 1,
0.3846001, 1.346189, -1.246711, 0, 0.1058824, 1, 1,
0.3852832, -0.3481471, 3.036197, 0, 0.09803922, 1, 1,
0.3864449, -0.4248805, 3.384608, 0, 0.09411765, 1, 1,
0.3867401, 0.5274976, 1.313554, 0, 0.08627451, 1, 1,
0.3885983, 0.1460556, 4.457055, 0, 0.08235294, 1, 1,
0.3910803, 1.046569, -0.2656935, 0, 0.07450981, 1, 1,
0.3944268, -0.3530147, 2.988889, 0, 0.07058824, 1, 1,
0.3965983, 1.572986, -0.3538263, 0, 0.0627451, 1, 1,
0.3969451, 0.8997473, -0.2040287, 0, 0.05882353, 1, 1,
0.3986871, 0.9130176, -0.2042261, 0, 0.05098039, 1, 1,
0.3993805, -0.183816, 1.637514, 0, 0.04705882, 1, 1,
0.401034, -0.7882754, 2.380436, 0, 0.03921569, 1, 1,
0.4143333, 2.032167, 0.3833494, 0, 0.03529412, 1, 1,
0.4236699, 1.29838, -0.8221892, 0, 0.02745098, 1, 1,
0.4346034, 0.5692153, -0.3760889, 0, 0.02352941, 1, 1,
0.4407564, -1.583347, 1.189967, 0, 0.01568628, 1, 1,
0.4427322, -0.8036597, 1.300813, 0, 0.01176471, 1, 1,
0.4428761, -1.302824, 1.912175, 0, 0.003921569, 1, 1,
0.4433896, 0.7751651, 0.007162527, 0.003921569, 0, 1, 1,
0.4478309, -1.899337, 2.487369, 0.007843138, 0, 1, 1,
0.4548221, 2.248224, -0.2969389, 0.01568628, 0, 1, 1,
0.457315, -0.5827702, 3.715816, 0.01960784, 0, 1, 1,
0.4654137, -1.938926, 2.402466, 0.02745098, 0, 1, 1,
0.4666833, 0.3076611, 1.487381, 0.03137255, 0, 1, 1,
0.4674458, 0.7565596, -0.1667504, 0.03921569, 0, 1, 1,
0.469828, -0.1649941, 1.56489, 0.04313726, 0, 1, 1,
0.473049, -0.1392493, 0.8648, 0.05098039, 0, 1, 1,
0.4739982, 1.793937, -0.9583613, 0.05490196, 0, 1, 1,
0.4756586, 0.6412789, -0.298756, 0.0627451, 0, 1, 1,
0.4762653, 0.5368766, 2.389594, 0.06666667, 0, 1, 1,
0.4765422, -1.442114, 3.170256, 0.07450981, 0, 1, 1,
0.4775898, 0.45663, 0.6398503, 0.07843138, 0, 1, 1,
0.4789319, 0.2582444, -0.1240494, 0.08627451, 0, 1, 1,
0.4860488, 0.902094, 0.6824347, 0.09019608, 0, 1, 1,
0.4883693, 1.278075, -0.06191076, 0.09803922, 0, 1, 1,
0.488788, -0.2606604, 1.987275, 0.1058824, 0, 1, 1,
0.4914663, -0.1424212, 2.052171, 0.1098039, 0, 1, 1,
0.4932765, 1.486121, 0.8460469, 0.1176471, 0, 1, 1,
0.4938625, 1.498664, 0.2332261, 0.1215686, 0, 1, 1,
0.4963783, -0.5006593, 3.309093, 0.1294118, 0, 1, 1,
0.4988044, 0.02300016, 1.016865, 0.1333333, 0, 1, 1,
0.5007268, 0.9861436, 0.2992288, 0.1411765, 0, 1, 1,
0.5018806, -2.273362, 2.443734, 0.145098, 0, 1, 1,
0.5026911, 0.4892307, 0.3074149, 0.1529412, 0, 1, 1,
0.5033649, 0.4031024, -0.4121771, 0.1568628, 0, 1, 1,
0.5061626, 0.4118608, 0.8107243, 0.1647059, 0, 1, 1,
0.5087895, -0.5697971, 2.977562, 0.1686275, 0, 1, 1,
0.5117816, -1.077707, 3.407744, 0.1764706, 0, 1, 1,
0.5147855, 0.05848442, 3.807935, 0.1803922, 0, 1, 1,
0.5203719, -1.681992, 3.743138, 0.1882353, 0, 1, 1,
0.5283421, -0.3133282, 2.227728, 0.1921569, 0, 1, 1,
0.5318109, 0.4814937, 0.6115021, 0.2, 0, 1, 1,
0.5327586, -0.5471048, 2.629975, 0.2078431, 0, 1, 1,
0.5383842, 1.978568, 0.5908648, 0.2117647, 0, 1, 1,
0.5391155, 0.6465127, 0.301409, 0.2196078, 0, 1, 1,
0.5438806, -0.6538045, 0.7191964, 0.2235294, 0, 1, 1,
0.5443062, -0.2719147, 3.058025, 0.2313726, 0, 1, 1,
0.545482, -0.3246996, 2.97726, 0.2352941, 0, 1, 1,
0.5494364, 0.9990121, 1.558239, 0.2431373, 0, 1, 1,
0.5502195, -0.13275, 2.066306, 0.2470588, 0, 1, 1,
0.5513002, -0.5584808, 2.899035, 0.254902, 0, 1, 1,
0.5514548, -0.5015177, 1.010635, 0.2588235, 0, 1, 1,
0.5520169, -0.55355, 2.934568, 0.2666667, 0, 1, 1,
0.5555385, 0.9219403, 1.534418, 0.2705882, 0, 1, 1,
0.5561939, -0.1100251, 2.985288, 0.2784314, 0, 1, 1,
0.5593218, -0.5684221, 2.012427, 0.282353, 0, 1, 1,
0.5596586, -0.4123521, 3.561265, 0.2901961, 0, 1, 1,
0.5616024, -1.294482, 2.183642, 0.2941177, 0, 1, 1,
0.564531, -0.4284777, 1.705271, 0.3019608, 0, 1, 1,
0.5662563, 1.602257, 0.3154655, 0.3098039, 0, 1, 1,
0.566855, -1.265107, 3.286475, 0.3137255, 0, 1, 1,
0.5720786, 0.8413621, 0.9756818, 0.3215686, 0, 1, 1,
0.5784263, 0.8066694, 0.2507855, 0.3254902, 0, 1, 1,
0.579514, 1.610015, 1.152672, 0.3333333, 0, 1, 1,
0.5850527, -0.203087, 2.959509, 0.3372549, 0, 1, 1,
0.5866418, -0.8484287, 1.563243, 0.345098, 0, 1, 1,
0.5891323, 0.2464196, -0.9144713, 0.3490196, 0, 1, 1,
0.5903237, 1.630032, -0.6995879, 0.3568628, 0, 1, 1,
0.5905715, 0.04215812, 1.694595, 0.3607843, 0, 1, 1,
0.5920852, -0.3808675, 3.605723, 0.3686275, 0, 1, 1,
0.5971965, 1.015486, 1.17035, 0.372549, 0, 1, 1,
0.6017358, 0.3736326, 2.040298, 0.3803922, 0, 1, 1,
0.6029104, 1.552576, 1.148418, 0.3843137, 0, 1, 1,
0.6033566, -0.6230401, 3.083311, 0.3921569, 0, 1, 1,
0.6134856, -0.4681721, 3.746734, 0.3960784, 0, 1, 1,
0.6171854, 0.2107925, 1.28492, 0.4039216, 0, 1, 1,
0.6196815, -0.7973807, 1.998202, 0.4117647, 0, 1, 1,
0.6199431, -0.1572126, 1.938013, 0.4156863, 0, 1, 1,
0.6221402, 0.5675752, 0.3788552, 0.4235294, 0, 1, 1,
0.622829, -0.566321, 1.961222, 0.427451, 0, 1, 1,
0.6285586, -0.7328718, 2.546688, 0.4352941, 0, 1, 1,
0.6296235, 0.3234203, -0.6040792, 0.4392157, 0, 1, 1,
0.6341379, -0.01375534, 1.375227, 0.4470588, 0, 1, 1,
0.6432233, 0.6203948, 2.073974, 0.4509804, 0, 1, 1,
0.6439838, 0.5520849, 1.883606, 0.4588235, 0, 1, 1,
0.6455547, -0.3021081, 1.225929, 0.4627451, 0, 1, 1,
0.6534309, 0.8911989, 1.409689, 0.4705882, 0, 1, 1,
0.6539032, 0.8264125, -0.9711864, 0.4745098, 0, 1, 1,
0.6543862, 0.9029737, -1.291194, 0.4823529, 0, 1, 1,
0.6557391, -0.5632278, 1.341757, 0.4862745, 0, 1, 1,
0.6579419, -0.5521553, 2.78765, 0.4941176, 0, 1, 1,
0.6580107, -0.1266916, 2.464118, 0.5019608, 0, 1, 1,
0.6647255, -1.794522, 3.893611, 0.5058824, 0, 1, 1,
0.6658983, -0.006024504, 1.950742, 0.5137255, 0, 1, 1,
0.67125, -0.3512278, 1.19015, 0.5176471, 0, 1, 1,
0.6714408, 2.115348, 0.01590253, 0.5254902, 0, 1, 1,
0.6718218, -0.5969388, 2.86407, 0.5294118, 0, 1, 1,
0.6775415, 0.2323334, 1.634888, 0.5372549, 0, 1, 1,
0.6813758, -0.833405, 1.038994, 0.5411765, 0, 1, 1,
0.6821805, 0.4550448, 0.5516793, 0.5490196, 0, 1, 1,
0.6856, 1.171431, 1.3322, 0.5529412, 0, 1, 1,
0.6949222, 2.639333, 1.524671, 0.5607843, 0, 1, 1,
0.697535, 0.2390726, 1.911977, 0.5647059, 0, 1, 1,
0.7207142, -0.3824264, 1.201993, 0.572549, 0, 1, 1,
0.7234694, -0.8118295, 2.192712, 0.5764706, 0, 1, 1,
0.7282339, -0.7007043, 2.101464, 0.5843138, 0, 1, 1,
0.7307445, -0.8023642, 4.005751, 0.5882353, 0, 1, 1,
0.7384808, 0.4148332, 0.5891091, 0.5960785, 0, 1, 1,
0.7426474, -0.4100811, 2.58482, 0.6039216, 0, 1, 1,
0.7498974, -0.05944024, 1.669581, 0.6078432, 0, 1, 1,
0.7576733, 0.58898, 0.421053, 0.6156863, 0, 1, 1,
0.7579718, -1.362783, 2.277825, 0.6196079, 0, 1, 1,
0.7592331, -1.488123, 2.499477, 0.627451, 0, 1, 1,
0.7648287, -1.37884, 1.223293, 0.6313726, 0, 1, 1,
0.7655651, 1.445188, 0.6559882, 0.6392157, 0, 1, 1,
0.7671341, -0.5722249, 1.620807, 0.6431373, 0, 1, 1,
0.7746971, -0.3985702, 3.334577, 0.6509804, 0, 1, 1,
0.7761341, 1.021081, 1.603576, 0.654902, 0, 1, 1,
0.7808576, -0.28993, 2.455684, 0.6627451, 0, 1, 1,
0.7818761, -2.16415, 1.103902, 0.6666667, 0, 1, 1,
0.7927592, 0.2479685, -1.105122, 0.6745098, 0, 1, 1,
0.7980321, 0.8860878, 1.026333, 0.6784314, 0, 1, 1,
0.7985337, 1.088256, 2.270082, 0.6862745, 0, 1, 1,
0.8001712, 0.006990926, 0.4074461, 0.6901961, 0, 1, 1,
0.8087179, 0.3878715, 1.459405, 0.6980392, 0, 1, 1,
0.8096643, 0.09765363, 1.029673, 0.7058824, 0, 1, 1,
0.8131402, -0.8576197, 1.829538, 0.7098039, 0, 1, 1,
0.8136554, -0.3997592, 1.706009, 0.7176471, 0, 1, 1,
0.8138555, -2.45087, 2.183918, 0.7215686, 0, 1, 1,
0.8208507, 0.6616676, 0.6652969, 0.7294118, 0, 1, 1,
0.8211387, 0.1085755, 2.176365, 0.7333333, 0, 1, 1,
0.8219637, 1.134817, 0.6438942, 0.7411765, 0, 1, 1,
0.826449, -0.2472432, 2.296587, 0.7450981, 0, 1, 1,
0.8303236, -1.447205, 2.405397, 0.7529412, 0, 1, 1,
0.8326517, -0.5626508, 1.468434, 0.7568628, 0, 1, 1,
0.8373705, 0.3562495, 1.245384, 0.7647059, 0, 1, 1,
0.8381013, 0.588693, 0.7128673, 0.7686275, 0, 1, 1,
0.8436638, 0.6417014, 1.988324, 0.7764706, 0, 1, 1,
0.844583, 0.9405736, 1.713804, 0.7803922, 0, 1, 1,
0.8545265, -1.02711, 1.435656, 0.7882353, 0, 1, 1,
0.8562297, 0.1711212, 0.4987901, 0.7921569, 0, 1, 1,
0.8564894, 1.421945, 0.4734477, 0.8, 0, 1, 1,
0.8566653, -0.6000605, 3.500391, 0.8078431, 0, 1, 1,
0.8587631, 0.2152625, 0.813295, 0.8117647, 0, 1, 1,
0.8613376, 0.6998328, 2.212355, 0.8196079, 0, 1, 1,
0.8621631, -0.6496681, 1.527775, 0.8235294, 0, 1, 1,
0.8641486, -1.597725, 2.389048, 0.8313726, 0, 1, 1,
0.8686121, 1.70325, 1.085192, 0.8352941, 0, 1, 1,
0.8725531, 0.397231, 0.3063868, 0.8431373, 0, 1, 1,
0.8780636, 0.6979337, 1.255483, 0.8470588, 0, 1, 1,
0.8890657, 1.087937, 2.053626, 0.854902, 0, 1, 1,
0.8897434, -1.245743, 1.430183, 0.8588235, 0, 1, 1,
0.8909842, 0.05920333, 2.618893, 0.8666667, 0, 1, 1,
0.8981931, -0.8024473, 3.264642, 0.8705882, 0, 1, 1,
0.898822, -0.3689879, 2.730438, 0.8784314, 0, 1, 1,
0.9072141, 0.6240724, 2.297085, 0.8823529, 0, 1, 1,
0.9076641, -0.6717089, 1.60018, 0.8901961, 0, 1, 1,
0.90866, 0.2484999, 0.04442996, 0.8941177, 0, 1, 1,
0.9109954, 0.3273293, 2.128915, 0.9019608, 0, 1, 1,
0.9149211, -0.001962483, 0.4157072, 0.9098039, 0, 1, 1,
0.9316657, 0.7529767, 0.7331671, 0.9137255, 0, 1, 1,
0.9320993, 0.2025612, 0.01813042, 0.9215686, 0, 1, 1,
0.9346504, -1.055908, 2.42923, 0.9254902, 0, 1, 1,
0.9357184, 1.122942, 1.510899, 0.9333333, 0, 1, 1,
0.9374428, -1.167001, 0.6706183, 0.9372549, 0, 1, 1,
0.9376587, -0.3458111, 2.448608, 0.945098, 0, 1, 1,
0.941419, 1.192538, 2.285747, 0.9490196, 0, 1, 1,
0.9432995, 0.3142274, 1.421241, 0.9568627, 0, 1, 1,
0.9540198, -1.444775, 2.706783, 0.9607843, 0, 1, 1,
0.9545353, 0.03247031, 2.687699, 0.9686275, 0, 1, 1,
0.955631, -0.5380819, 0.9785193, 0.972549, 0, 1, 1,
0.9620216, 0.01748398, 3.00495, 0.9803922, 0, 1, 1,
0.9669564, 0.8100209, 0.8063137, 0.9843137, 0, 1, 1,
0.9729334, -1.156244, 1.62509, 0.9921569, 0, 1, 1,
0.9759125, -0.4447732, 3.232413, 0.9960784, 0, 1, 1,
0.9763745, 0.03356858, 1.860166, 1, 0, 0.9960784, 1,
0.9814842, -0.4501985, 2.656963, 1, 0, 0.9882353, 1,
0.9823105, -0.04291603, 0.7509833, 1, 0, 0.9843137, 1,
0.9851986, -0.5998703, 0.1065115, 1, 0, 0.9764706, 1,
0.9857527, 0.1345498, 1.86938, 1, 0, 0.972549, 1,
0.9974145, -0.4408769, 2.940386, 1, 0, 0.9647059, 1,
1.002166, 0.8582423, 0.07124177, 1, 0, 0.9607843, 1,
1.007161, 0.09904993, 2.079593, 1, 0, 0.9529412, 1,
1.009579, -0.4265861, -0.2187122, 1, 0, 0.9490196, 1,
1.01384, -0.6291111, 3.472572, 1, 0, 0.9411765, 1,
1.019495, -0.1226414, 2.759177, 1, 0, 0.9372549, 1,
1.032083, 1.815552, 1.560185, 1, 0, 0.9294118, 1,
1.032241, -0.7517357, 1.645608, 1, 0, 0.9254902, 1,
1.0337, 0.6943904, 1.155553, 1, 0, 0.9176471, 1,
1.033936, -0.5050079, 2.421129, 1, 0, 0.9137255, 1,
1.034546, -2.008603, 2.715289, 1, 0, 0.9058824, 1,
1.038368, 0.8918314, 0.5681054, 1, 0, 0.9019608, 1,
1.040964, 0.2518887, 2.999719, 1, 0, 0.8941177, 1,
1.050903, -0.02235386, 2.156786, 1, 0, 0.8862745, 1,
1.061532, 1.152808, 1.453428, 1, 0, 0.8823529, 1,
1.065122, -1.615961, 4.925461, 1, 0, 0.8745098, 1,
1.067695, 1.665857, -0.07074592, 1, 0, 0.8705882, 1,
1.069035, 0.6268125, -0.6355426, 1, 0, 0.8627451, 1,
1.07026, 0.9154663, 1.247077, 1, 0, 0.8588235, 1,
1.07145, 0.7696172, 1.146741, 1, 0, 0.8509804, 1,
1.07608, -0.7036589, 3.938588, 1, 0, 0.8470588, 1,
1.078818, 0.6475219, 1.010563, 1, 0, 0.8392157, 1,
1.081415, 0.88554, 0.535618, 1, 0, 0.8352941, 1,
1.083003, -0.4696505, 1.480532, 1, 0, 0.827451, 1,
1.084154, 0.4907854, -0.7018172, 1, 0, 0.8235294, 1,
1.094881, 0.7870672, 2.105, 1, 0, 0.8156863, 1,
1.101986, 0.6635783, 2.104544, 1, 0, 0.8117647, 1,
1.105128, 0.5360721, -0.1408225, 1, 0, 0.8039216, 1,
1.105489, 1.683944, -0.8903748, 1, 0, 0.7960784, 1,
1.108276, -0.1275799, 2.241879, 1, 0, 0.7921569, 1,
1.10867, 0.9022378, 0.7224191, 1, 0, 0.7843137, 1,
1.1091, 0.8265234, 1.669977, 1, 0, 0.7803922, 1,
1.122675, 0.4260435, 1.927272, 1, 0, 0.772549, 1,
1.124025, 1.049413, -0.02400248, 1, 0, 0.7686275, 1,
1.128006, -0.6067514, 0.8285365, 1, 0, 0.7607843, 1,
1.131185, -1.749746, 2.422195, 1, 0, 0.7568628, 1,
1.131806, 1.661205, 0.5362324, 1, 0, 0.7490196, 1,
1.135204, 0.3394468, 0.5378051, 1, 0, 0.7450981, 1,
1.137174, 1.431497, 0.6444664, 1, 0, 0.7372549, 1,
1.155802, 0.8251671, 3.232517, 1, 0, 0.7333333, 1,
1.156142, 0.5638292, 1.696502, 1, 0, 0.7254902, 1,
1.156282, 0.4474368, 2.196025, 1, 0, 0.7215686, 1,
1.166218, -0.1330881, 1.700193, 1, 0, 0.7137255, 1,
1.169887, -1.376233, 2.439034, 1, 0, 0.7098039, 1,
1.179225, -0.1828826, 2.406449, 1, 0, 0.7019608, 1,
1.179589, -1.386912, 2.426486, 1, 0, 0.6941177, 1,
1.185908, 1.15599, 1.197209, 1, 0, 0.6901961, 1,
1.190727, -1.1735, 1.483236, 1, 0, 0.682353, 1,
1.205792, 0.6599002, 0.4264593, 1, 0, 0.6784314, 1,
1.209233, 1.32547, 0.182877, 1, 0, 0.6705883, 1,
1.210674, -0.5711131, 3.252255, 1, 0, 0.6666667, 1,
1.213739, 1.018518, 0.5743597, 1, 0, 0.6588235, 1,
1.219582, 0.5461363, 0.2992383, 1, 0, 0.654902, 1,
1.23909, 0.01106282, 4.165633, 1, 0, 0.6470588, 1,
1.253182, 1.249359, -0.3841864, 1, 0, 0.6431373, 1,
1.260266, -1.32821, 2.275653, 1, 0, 0.6352941, 1,
1.280264, -0.8341759, 1.863223, 1, 0, 0.6313726, 1,
1.292363, 0.5471212, 0.70153, 1, 0, 0.6235294, 1,
1.301216, -0.5518725, 0.4833558, 1, 0, 0.6196079, 1,
1.314874, -0.387046, 0.1873163, 1, 0, 0.6117647, 1,
1.318353, -0.1099384, 1.552922, 1, 0, 0.6078432, 1,
1.326729, -0.6088247, 1.478032, 1, 0, 0.6, 1,
1.33084, -0.6397414, 2.095565, 1, 0, 0.5921569, 1,
1.35583, 1.918588, 1.176994, 1, 0, 0.5882353, 1,
1.359504, -0.1606849, 4.036145, 1, 0, 0.5803922, 1,
1.36552, 1.388576, 0.1486802, 1, 0, 0.5764706, 1,
1.372927, -1.056529, 1.949781, 1, 0, 0.5686275, 1,
1.379432, 1.142734, 0.1186757, 1, 0, 0.5647059, 1,
1.390566, 0.7926598, -0.258009, 1, 0, 0.5568628, 1,
1.393652, 0.3867347, 1.883993, 1, 0, 0.5529412, 1,
1.393807, -0.3229534, 0.5212703, 1, 0, 0.5450981, 1,
1.405797, -0.1755712, 0.09355813, 1, 0, 0.5411765, 1,
1.408153, 0.4503951, 2.089906, 1, 0, 0.5333334, 1,
1.412979, -1.016102, 1.581652, 1, 0, 0.5294118, 1,
1.414238, -1.40302, 1.626596, 1, 0, 0.5215687, 1,
1.420418, 0.4422098, 0.7187427, 1, 0, 0.5176471, 1,
1.425471, 0.4950925, 1.040287, 1, 0, 0.509804, 1,
1.431545, -1.475229, 1.589825, 1, 0, 0.5058824, 1,
1.433565, -1.82058, 2.287367, 1, 0, 0.4980392, 1,
1.444282, -0.08820723, 1.962369, 1, 0, 0.4901961, 1,
1.447951, -2.427504, 0.1777934, 1, 0, 0.4862745, 1,
1.449729, -0.3605303, 1.436378, 1, 0, 0.4784314, 1,
1.458685, 0.6928288, 1.485903, 1, 0, 0.4745098, 1,
1.459404, -0.3911589, 1.232277, 1, 0, 0.4666667, 1,
1.471311, 0.3718847, 0.8479782, 1, 0, 0.4627451, 1,
1.480813, -1.354986, 4.129112, 1, 0, 0.454902, 1,
1.493003, -0.9898034, 0.3083514, 1, 0, 0.4509804, 1,
1.512332, -1.019329, 2.16686, 1, 0, 0.4431373, 1,
1.512994, 0.1607959, 0.4500419, 1, 0, 0.4392157, 1,
1.533482, -0.01017332, 1.859016, 1, 0, 0.4313726, 1,
1.564186, -1.06907, 2.312002, 1, 0, 0.427451, 1,
1.570557, -1.713548, 1.078342, 1, 0, 0.4196078, 1,
1.578149, 0.3776007, 1.19853, 1, 0, 0.4156863, 1,
1.584682, -0.791139, 2.67378, 1, 0, 0.4078431, 1,
1.587203, 0.6356077, 1.247449, 1, 0, 0.4039216, 1,
1.590044, -1.756902, 3.349061, 1, 0, 0.3960784, 1,
1.610682, 2.17594, 0.1613443, 1, 0, 0.3882353, 1,
1.629994, 0.7039191, -0.5086343, 1, 0, 0.3843137, 1,
1.642534, 0.6581374, -1.312165, 1, 0, 0.3764706, 1,
1.654902, 0.9040474, 0.9496197, 1, 0, 0.372549, 1,
1.657196, 0.8162045, 1.433739, 1, 0, 0.3647059, 1,
1.659774, 0.3206987, 1.472588, 1, 0, 0.3607843, 1,
1.66942, 0.4001642, 1.788851, 1, 0, 0.3529412, 1,
1.674753, 0.9217724, 2.037631, 1, 0, 0.3490196, 1,
1.685487, -0.3049913, 2.258524, 1, 0, 0.3411765, 1,
1.691556, -0.5907913, 1.470358, 1, 0, 0.3372549, 1,
1.691648, -0.05610896, 0.4374849, 1, 0, 0.3294118, 1,
1.692522, -0.6201136, 2.926201, 1, 0, 0.3254902, 1,
1.69712, 1.890258, -0.2086397, 1, 0, 0.3176471, 1,
1.700626, -1.376026, 0.8264824, 1, 0, 0.3137255, 1,
1.702154, 0.7610639, 1.20981, 1, 0, 0.3058824, 1,
1.711231, 0.7279131, 0.827441, 1, 0, 0.2980392, 1,
1.721198, -0.6813847, 3.346414, 1, 0, 0.2941177, 1,
1.725887, 1.307021, 2.216908, 1, 0, 0.2862745, 1,
1.733401, -0.3211549, 1.604634, 1, 0, 0.282353, 1,
1.744667, 1.276825, 1.228334, 1, 0, 0.2745098, 1,
1.747104, -1.490046, 4.218006, 1, 0, 0.2705882, 1,
1.764243, 0.4051634, 1.405911, 1, 0, 0.2627451, 1,
1.795472, -0.06476102, 0.8898304, 1, 0, 0.2588235, 1,
1.808806, -1.744571, 2.10472, 1, 0, 0.2509804, 1,
1.819885, 0.6276096, 1.211008, 1, 0, 0.2470588, 1,
1.820377, -1.919853, 3.533185, 1, 0, 0.2392157, 1,
1.824643, -0.6347611, 2.28652, 1, 0, 0.2352941, 1,
1.841843, 1.589445, 1.319988, 1, 0, 0.227451, 1,
1.856178, 0.1747794, 2.824398, 1, 0, 0.2235294, 1,
1.860008, -0.3777451, 4.183656, 1, 0, 0.2156863, 1,
1.887693, 0.639106, 2.382141, 1, 0, 0.2117647, 1,
1.959237, -0.5577509, 2.991781, 1, 0, 0.2039216, 1,
1.966017, 0.6304393, 2.82042, 1, 0, 0.1960784, 1,
1.979434, 2.122161, 2.253461, 1, 0, 0.1921569, 1,
2.037436, 0.97106, 0.1191748, 1, 0, 0.1843137, 1,
2.044872, -0.5046809, 1.836275, 1, 0, 0.1803922, 1,
2.064615, -0.03851245, 3.064806, 1, 0, 0.172549, 1,
2.094188, -0.1717781, 2.653444, 1, 0, 0.1686275, 1,
2.104528, 0.40353, 0.9913227, 1, 0, 0.1607843, 1,
2.13572, 0.2734269, 2.025303, 1, 0, 0.1568628, 1,
2.14937, 0.3176836, 1.721658, 1, 0, 0.1490196, 1,
2.149994, 0.3149522, 2.112282, 1, 0, 0.145098, 1,
2.19026, 1.3784, 1.99441, 1, 0, 0.1372549, 1,
2.205217, -0.3020495, 2.945232, 1, 0, 0.1333333, 1,
2.246998, -1.566971, 1.815537, 1, 0, 0.1254902, 1,
2.256946, -1.307065, 0.8894998, 1, 0, 0.1215686, 1,
2.305403, -0.7080981, 2.072681, 1, 0, 0.1137255, 1,
2.321408, -0.5379908, 1.189554, 1, 0, 0.1098039, 1,
2.322205, 1.123769, 1.433267, 1, 0, 0.1019608, 1,
2.328521, 0.9057878, 0.909079, 1, 0, 0.09411765, 1,
2.330946, 0.5177794, 2.649922, 1, 0, 0.09019608, 1,
2.369042, 0.8385538, 1.218346, 1, 0, 0.08235294, 1,
2.450474, 0.6317078, 1.22307, 1, 0, 0.07843138, 1,
2.506239, -0.2575461, 1.914395, 1, 0, 0.07058824, 1,
2.558828, -2.511168, 1.816643, 1, 0, 0.06666667, 1,
2.682138, 2.062505, 0.6886153, 1, 0, 0.05882353, 1,
2.715553, -0.8274969, -0.6178462, 1, 0, 0.05490196, 1,
2.738461, 0.8044198, 0.4317161, 1, 0, 0.04705882, 1,
2.762187, 0.1564743, 0.7761385, 1, 0, 0.04313726, 1,
2.774826, 0.5338537, 2.64426, 1, 0, 0.03529412, 1,
2.779351, -0.9946944, 0.1617441, 1, 0, 0.03137255, 1,
2.828887, 0.6415209, 3.39202, 1, 0, 0.02352941, 1,
2.872126, 1.908595, 0.674484, 1, 0, 0.01960784, 1,
2.876332, 1.576959, 0.4704783, 1, 0, 0.01176471, 1,
3.02751, -0.3115677, 0.3203273, 1, 0, 0.007843138, 1
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
0.04209495, -4.381183, -7.460499, 0, -0.5, 0.5, 0.5,
0.04209495, -4.381183, -7.460499, 1, -0.5, 0.5, 0.5,
0.04209495, -4.381183, -7.460499, 1, 1.5, 0.5, 0.5,
0.04209495, -4.381183, -7.460499, 0, 1.5, 0.5, 0.5
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
-3.955376, -0.3621703, -7.460499, 0, -0.5, 0.5, 0.5,
-3.955376, -0.3621703, -7.460499, 1, -0.5, 0.5, 0.5,
-3.955376, -0.3621703, -7.460499, 1, 1.5, 0.5, 0.5,
-3.955376, -0.3621703, -7.460499, 0, 1.5, 0.5, 0.5
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
-3.955376, -4.381183, -0.3116732, 0, -0.5, 0.5, 0.5,
-3.955376, -4.381183, -0.3116732, 1, -0.5, 0.5, 0.5,
-3.955376, -4.381183, -0.3116732, 1, 1.5, 0.5, 0.5,
-3.955376, -4.381183, -0.3116732, 0, 1.5, 0.5, 0.5
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
-2, -3.453718, -5.81077,
3, -3.453718, -5.81077,
-2, -3.453718, -5.81077,
-2, -3.608296, -6.085725,
-1, -3.453718, -5.81077,
-1, -3.608296, -6.085725,
0, -3.453718, -5.81077,
0, -3.608296, -6.085725,
1, -3.453718, -5.81077,
1, -3.608296, -6.085725,
2, -3.453718, -5.81077,
2, -3.608296, -6.085725,
3, -3.453718, -5.81077,
3, -3.608296, -6.085725
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
-2, -3.91745, -6.635635, 0, -0.5, 0.5, 0.5,
-2, -3.91745, -6.635635, 1, -0.5, 0.5, 0.5,
-2, -3.91745, -6.635635, 1, 1.5, 0.5, 0.5,
-2, -3.91745, -6.635635, 0, 1.5, 0.5, 0.5,
-1, -3.91745, -6.635635, 0, -0.5, 0.5, 0.5,
-1, -3.91745, -6.635635, 1, -0.5, 0.5, 0.5,
-1, -3.91745, -6.635635, 1, 1.5, 0.5, 0.5,
-1, -3.91745, -6.635635, 0, 1.5, 0.5, 0.5,
0, -3.91745, -6.635635, 0, -0.5, 0.5, 0.5,
0, -3.91745, -6.635635, 1, -0.5, 0.5, 0.5,
0, -3.91745, -6.635635, 1, 1.5, 0.5, 0.5,
0, -3.91745, -6.635635, 0, 1.5, 0.5, 0.5,
1, -3.91745, -6.635635, 0, -0.5, 0.5, 0.5,
1, -3.91745, -6.635635, 1, -0.5, 0.5, 0.5,
1, -3.91745, -6.635635, 1, 1.5, 0.5, 0.5,
1, -3.91745, -6.635635, 0, 1.5, 0.5, 0.5,
2, -3.91745, -6.635635, 0, -0.5, 0.5, 0.5,
2, -3.91745, -6.635635, 1, -0.5, 0.5, 0.5,
2, -3.91745, -6.635635, 1, 1.5, 0.5, 0.5,
2, -3.91745, -6.635635, 0, 1.5, 0.5, 0.5,
3, -3.91745, -6.635635, 0, -0.5, 0.5, 0.5,
3, -3.91745, -6.635635, 1, -0.5, 0.5, 0.5,
3, -3.91745, -6.635635, 1, 1.5, 0.5, 0.5,
3, -3.91745, -6.635635, 0, 1.5, 0.5, 0.5
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
-3.032883, -3, -5.81077,
-3.032883, 2, -5.81077,
-3.032883, -3, -5.81077,
-3.186632, -3, -6.085725,
-3.032883, -2, -5.81077,
-3.186632, -2, -6.085725,
-3.032883, -1, -5.81077,
-3.186632, -1, -6.085725,
-3.032883, 0, -5.81077,
-3.186632, 0, -6.085725,
-3.032883, 1, -5.81077,
-3.186632, 1, -6.085725,
-3.032883, 2, -5.81077,
-3.186632, 2, -6.085725
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
-3.494129, -3, -6.635635, 0, -0.5, 0.5, 0.5,
-3.494129, -3, -6.635635, 1, -0.5, 0.5, 0.5,
-3.494129, -3, -6.635635, 1, 1.5, 0.5, 0.5,
-3.494129, -3, -6.635635, 0, 1.5, 0.5, 0.5,
-3.494129, -2, -6.635635, 0, -0.5, 0.5, 0.5,
-3.494129, -2, -6.635635, 1, -0.5, 0.5, 0.5,
-3.494129, -2, -6.635635, 1, 1.5, 0.5, 0.5,
-3.494129, -2, -6.635635, 0, 1.5, 0.5, 0.5,
-3.494129, -1, -6.635635, 0, -0.5, 0.5, 0.5,
-3.494129, -1, -6.635635, 1, -0.5, 0.5, 0.5,
-3.494129, -1, -6.635635, 1, 1.5, 0.5, 0.5,
-3.494129, -1, -6.635635, 0, 1.5, 0.5, 0.5,
-3.494129, 0, -6.635635, 0, -0.5, 0.5, 0.5,
-3.494129, 0, -6.635635, 1, -0.5, 0.5, 0.5,
-3.494129, 0, -6.635635, 1, 1.5, 0.5, 0.5,
-3.494129, 0, -6.635635, 0, 1.5, 0.5, 0.5,
-3.494129, 1, -6.635635, 0, -0.5, 0.5, 0.5,
-3.494129, 1, -6.635635, 1, -0.5, 0.5, 0.5,
-3.494129, 1, -6.635635, 1, 1.5, 0.5, 0.5,
-3.494129, 1, -6.635635, 0, 1.5, 0.5, 0.5,
-3.494129, 2, -6.635635, 0, -0.5, 0.5, 0.5,
-3.494129, 2, -6.635635, 1, -0.5, 0.5, 0.5,
-3.494129, 2, -6.635635, 1, 1.5, 0.5, 0.5,
-3.494129, 2, -6.635635, 0, 1.5, 0.5, 0.5
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
-3.032883, -3.453718, -4,
-3.032883, -3.453718, 4,
-3.032883, -3.453718, -4,
-3.186632, -3.608296, -4,
-3.032883, -3.453718, -2,
-3.186632, -3.608296, -2,
-3.032883, -3.453718, 0,
-3.186632, -3.608296, 0,
-3.032883, -3.453718, 2,
-3.186632, -3.608296, 2,
-3.032883, -3.453718, 4,
-3.186632, -3.608296, 4
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
-3.494129, -3.91745, -4, 0, -0.5, 0.5, 0.5,
-3.494129, -3.91745, -4, 1, -0.5, 0.5, 0.5,
-3.494129, -3.91745, -4, 1, 1.5, 0.5, 0.5,
-3.494129, -3.91745, -4, 0, 1.5, 0.5, 0.5,
-3.494129, -3.91745, -2, 0, -0.5, 0.5, 0.5,
-3.494129, -3.91745, -2, 1, -0.5, 0.5, 0.5,
-3.494129, -3.91745, -2, 1, 1.5, 0.5, 0.5,
-3.494129, -3.91745, -2, 0, 1.5, 0.5, 0.5,
-3.494129, -3.91745, 0, 0, -0.5, 0.5, 0.5,
-3.494129, -3.91745, 0, 1, -0.5, 0.5, 0.5,
-3.494129, -3.91745, 0, 1, 1.5, 0.5, 0.5,
-3.494129, -3.91745, 0, 0, 1.5, 0.5, 0.5,
-3.494129, -3.91745, 2, 0, -0.5, 0.5, 0.5,
-3.494129, -3.91745, 2, 1, -0.5, 0.5, 0.5,
-3.494129, -3.91745, 2, 1, 1.5, 0.5, 0.5,
-3.494129, -3.91745, 2, 0, 1.5, 0.5, 0.5,
-3.494129, -3.91745, 4, 0, -0.5, 0.5, 0.5,
-3.494129, -3.91745, 4, 1, -0.5, 0.5, 0.5,
-3.494129, -3.91745, 4, 1, 1.5, 0.5, 0.5,
-3.494129, -3.91745, 4, 0, 1.5, 0.5, 0.5
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
-3.032883, -3.453718, -5.81077,
-3.032883, 2.729378, -5.81077,
-3.032883, -3.453718, 5.187424,
-3.032883, 2.729378, 5.187424,
-3.032883, -3.453718, -5.81077,
-3.032883, -3.453718, 5.187424,
-3.032883, 2.729378, -5.81077,
-3.032883, 2.729378, 5.187424,
-3.032883, -3.453718, -5.81077,
3.117073, -3.453718, -5.81077,
-3.032883, -3.453718, 5.187424,
3.117073, -3.453718, 5.187424,
-3.032883, 2.729378, -5.81077,
3.117073, 2.729378, -5.81077,
-3.032883, 2.729378, 5.187424,
3.117073, 2.729378, 5.187424,
3.117073, -3.453718, -5.81077,
3.117073, 2.729378, -5.81077,
3.117073, -3.453718, 5.187424,
3.117073, 2.729378, 5.187424,
3.117073, -3.453718, -5.81077,
3.117073, -3.453718, 5.187424,
3.117073, 2.729378, -5.81077,
3.117073, 2.729378, 5.187424
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
var radius = 7.49502;
var distance = 33.34619;
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
mvMatrix.translate( -0.04209495, 0.3621703, 0.3116732 );
mvMatrix.scale( 1.317695, 1.310632, 0.7368267 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.34619);
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


