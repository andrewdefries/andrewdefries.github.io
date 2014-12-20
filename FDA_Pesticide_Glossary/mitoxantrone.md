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
-3.13876, 0.1308351, 0.07303798, 1, 0, 0, 1,
-3.082385, -0.0004773562, -1.9589, 1, 0.007843138, 0, 1,
-2.829263, 0.6850166, -1.298155, 1, 0.01176471, 0, 1,
-2.757812, 1.899565, -0.48888, 1, 0.01960784, 0, 1,
-2.737246, 0.8920724, -1.719134, 1, 0.02352941, 0, 1,
-2.58962, 0.0469193, -2.590189, 1, 0.03137255, 0, 1,
-2.504626, 0.4825992, -1.799883, 1, 0.03529412, 0, 1,
-2.498999, 0.5895094, -1.634568, 1, 0.04313726, 0, 1,
-2.477147, 1.743943, -0.4294364, 1, 0.04705882, 0, 1,
-2.476964, 0.6039926, -0.2674826, 1, 0.05490196, 0, 1,
-2.454774, -0.4083113, -3.309355, 1, 0.05882353, 0, 1,
-2.453062, -0.7420771, -0.387216, 1, 0.06666667, 0, 1,
-2.419245, 1.644167, 0.1687239, 1, 0.07058824, 0, 1,
-2.417113, -0.4778832, -2.046457, 1, 0.07843138, 0, 1,
-2.416428, 0.3459646, -2.834647, 1, 0.08235294, 0, 1,
-2.327968, -0.3320111, -1.534701, 1, 0.09019608, 0, 1,
-2.28848, 2.525264, 0.1784752, 1, 0.09411765, 0, 1,
-2.282743, 0.3936842, -0.8767061, 1, 0.1019608, 0, 1,
-2.280131, 0.5340914, -1.430846, 1, 0.1098039, 0, 1,
-2.227314, -1.47895, -2.825302, 1, 0.1137255, 0, 1,
-2.202108, 1.193972, -1.367775, 1, 0.1215686, 0, 1,
-2.189269, -1.769246, -2.901248, 1, 0.1254902, 0, 1,
-2.112996, -1.799858, -3.455954, 1, 0.1333333, 0, 1,
-2.094059, 1.943059, 0.4036606, 1, 0.1372549, 0, 1,
-2.090444, 0.2082723, -1.540136, 1, 0.145098, 0, 1,
-2.087003, -1.298263, -2.969115, 1, 0.1490196, 0, 1,
-2.07782, -3.087228, -3.687064, 1, 0.1568628, 0, 1,
-2.067082, -0.5292076, -1.636588, 1, 0.1607843, 0, 1,
-2.028424, -1.148108, -2.865232, 1, 0.1686275, 0, 1,
-2.020907, -0.5285642, -3.345631, 1, 0.172549, 0, 1,
-1.958875, 0.3044486, -1.403224, 1, 0.1803922, 0, 1,
-1.940884, 0.4071513, -1.026813, 1, 0.1843137, 0, 1,
-1.914526, -1.998762, -2.063981, 1, 0.1921569, 0, 1,
-1.913302, -0.7941933, -1.729801, 1, 0.1960784, 0, 1,
-1.90603, 0.2763986, -1.771459, 1, 0.2039216, 0, 1,
-1.900114, -0.02027225, -2.184124, 1, 0.2117647, 0, 1,
-1.882414, 0.3428335, -0.3019007, 1, 0.2156863, 0, 1,
-1.870177, 0.06217408, -1.815877, 1, 0.2235294, 0, 1,
-1.853225, -1.229442, -1.093109, 1, 0.227451, 0, 1,
-1.812618, 0.1988423, -3.1693, 1, 0.2352941, 0, 1,
-1.798401, 0.4194845, -1.21874, 1, 0.2392157, 0, 1,
-1.767811, 1.925365, -0.466499, 1, 0.2470588, 0, 1,
-1.76008, 0.0223824, -1.910403, 1, 0.2509804, 0, 1,
-1.739801, 1.575873, -1.090969, 1, 0.2588235, 0, 1,
-1.712485, 1.124739, 0.3603859, 1, 0.2627451, 0, 1,
-1.70557, 0.2906978, -1.060707, 1, 0.2705882, 0, 1,
-1.705404, 0.8101307, -0.5501513, 1, 0.2745098, 0, 1,
-1.704397, 1.873627, 0.6274253, 1, 0.282353, 0, 1,
-1.702162, -0.6468264, -3.692157, 1, 0.2862745, 0, 1,
-1.682273, -0.9229972, -1.139618, 1, 0.2941177, 0, 1,
-1.680408, -0.1841132, -2.725778, 1, 0.3019608, 0, 1,
-1.679862, 0.2219793, -0.9877773, 1, 0.3058824, 0, 1,
-1.64966, 0.01438855, -1.572012, 1, 0.3137255, 0, 1,
-1.642348, -1.074543, -1.278135, 1, 0.3176471, 0, 1,
-1.607593, -0.1998189, -0.6137139, 1, 0.3254902, 0, 1,
-1.600589, -1.124002, -2.472379, 1, 0.3294118, 0, 1,
-1.599159, 0.3596828, -0.6716367, 1, 0.3372549, 0, 1,
-1.587313, 0.9583772, -1.585761, 1, 0.3411765, 0, 1,
-1.583737, 0.0146388, -2.563386, 1, 0.3490196, 0, 1,
-1.560747, 0.4560615, -1.807666, 1, 0.3529412, 0, 1,
-1.549017, 0.4124149, -1.993099, 1, 0.3607843, 0, 1,
-1.543036, 0.8137596, -1.015283, 1, 0.3647059, 0, 1,
-1.526875, 1.254647, -0.4259916, 1, 0.372549, 0, 1,
-1.51251, -0.9865601, -3.530058, 1, 0.3764706, 0, 1,
-1.502938, -0.3328508, -2.168208, 1, 0.3843137, 0, 1,
-1.501762, -0.3729744, -0.7301181, 1, 0.3882353, 0, 1,
-1.498183, 0.1658792, -1.466487, 1, 0.3960784, 0, 1,
-1.496924, 0.8266757, -0.7778078, 1, 0.4039216, 0, 1,
-1.490933, -0.5998837, -2.796108, 1, 0.4078431, 0, 1,
-1.490517, 1.779702, -0.8860772, 1, 0.4156863, 0, 1,
-1.481348, -0.1398169, -0.8561896, 1, 0.4196078, 0, 1,
-1.466729, 2.397321, -0.8145721, 1, 0.427451, 0, 1,
-1.466019, 1.014158, 1.328071, 1, 0.4313726, 0, 1,
-1.44668, 0.5590096, -2.608271, 1, 0.4392157, 0, 1,
-1.438951, 1.064779, -2.404265, 1, 0.4431373, 0, 1,
-1.43394, -0.05803464, -0.6261333, 1, 0.4509804, 0, 1,
-1.433425, 0.07998869, -0.173775, 1, 0.454902, 0, 1,
-1.408705, 1.329185, -1.715145, 1, 0.4627451, 0, 1,
-1.395095, 2.441895, -0.2788514, 1, 0.4666667, 0, 1,
-1.39299, 1.478, -1.535357, 1, 0.4745098, 0, 1,
-1.387884, -0.1133066, -2.689611, 1, 0.4784314, 0, 1,
-1.381358, 0.2440709, -2.735643, 1, 0.4862745, 0, 1,
-1.375166, 0.3006314, -1.511234, 1, 0.4901961, 0, 1,
-1.372941, 1.284967, -1.386973, 1, 0.4980392, 0, 1,
-1.35573, -0.7319408, -4.132619, 1, 0.5058824, 0, 1,
-1.354479, -0.1503789, -2.648381, 1, 0.509804, 0, 1,
-1.344796, 0.6460302, -1.642796, 1, 0.5176471, 0, 1,
-1.339914, -0.03611005, -2.476275, 1, 0.5215687, 0, 1,
-1.329957, -0.5389971, -1.784819, 1, 0.5294118, 0, 1,
-1.32674, 0.7740864, -1.523267, 1, 0.5333334, 0, 1,
-1.323902, -1.321388, -2.291948, 1, 0.5411765, 0, 1,
-1.323007, -0.9492236, -2.343413, 1, 0.5450981, 0, 1,
-1.321126, 0.3827389, -1.42157, 1, 0.5529412, 0, 1,
-1.317232, 0.4892879, -1.200721, 1, 0.5568628, 0, 1,
-1.311683, -1.144186, -1.466451, 1, 0.5647059, 0, 1,
-1.303849, 0.559494, -0.3507483, 1, 0.5686275, 0, 1,
-1.301027, -0.7942863, -2.475019, 1, 0.5764706, 0, 1,
-1.300962, -1.66289, -3.431796, 1, 0.5803922, 0, 1,
-1.286502, 0.1828521, -1.693479, 1, 0.5882353, 0, 1,
-1.280268, -0.09710287, -0.7270156, 1, 0.5921569, 0, 1,
-1.274115, 0.621889, -2.59121, 1, 0.6, 0, 1,
-1.273781, 2.291315, -0.8995957, 1, 0.6078432, 0, 1,
-1.272384, 0.5624205, -2.982561, 1, 0.6117647, 0, 1,
-1.26357, 0.01629275, -2.775916, 1, 0.6196079, 0, 1,
-1.25629, -1.261996, -2.124818, 1, 0.6235294, 0, 1,
-1.254081, -1.313591, -2.767892, 1, 0.6313726, 0, 1,
-1.248705, -0.3175937, -1.432809, 1, 0.6352941, 0, 1,
-1.248269, 0.4885346, 0.2517843, 1, 0.6431373, 0, 1,
-1.246781, 0.4038637, -1.542265, 1, 0.6470588, 0, 1,
-1.22683, -0.9223534, -1.846664, 1, 0.654902, 0, 1,
-1.225754, -0.6305, -2.610219, 1, 0.6588235, 0, 1,
-1.225292, 0.9969481, -0.9002011, 1, 0.6666667, 0, 1,
-1.221583, -0.5150886, -3.112241, 1, 0.6705883, 0, 1,
-1.220269, -0.1332854, -0.8543323, 1, 0.6784314, 0, 1,
-1.200364, -0.4609044, -1.219035, 1, 0.682353, 0, 1,
-1.194995, 0.6572813, -1.28711, 1, 0.6901961, 0, 1,
-1.193521, -0.7018918, -2.898092, 1, 0.6941177, 0, 1,
-1.192223, 1.448704, -1.189704, 1, 0.7019608, 0, 1,
-1.181618, 0.4723157, -1.03602, 1, 0.7098039, 0, 1,
-1.177178, 1.185901, 0.5627594, 1, 0.7137255, 0, 1,
-1.172569, -0.3083696, -2.894087, 1, 0.7215686, 0, 1,
-1.164182, 1.279168, -0.6186319, 1, 0.7254902, 0, 1,
-1.157934, -0.6419851, -2.839646, 1, 0.7333333, 0, 1,
-1.157806, 0.1381269, -0.9089749, 1, 0.7372549, 0, 1,
-1.145911, 1.64034, -0.9358004, 1, 0.7450981, 0, 1,
-1.135043, -0.2849942, -1.678182, 1, 0.7490196, 0, 1,
-1.13228, 0.9100009, -2.246756, 1, 0.7568628, 0, 1,
-1.13188, 0.842505, -1.169104, 1, 0.7607843, 0, 1,
-1.124343, 0.2429731, -3.183985, 1, 0.7686275, 0, 1,
-1.120399, -1.956218, -2.890889, 1, 0.772549, 0, 1,
-1.114258, 0.5145453, -0.04197566, 1, 0.7803922, 0, 1,
-1.107999, 1.339248, -0.1923919, 1, 0.7843137, 0, 1,
-1.097535, 0.1593099, -1.006425, 1, 0.7921569, 0, 1,
-1.097289, 1.460402, -1.134152, 1, 0.7960784, 0, 1,
-1.089083, -0.7485288, -2.39917, 1, 0.8039216, 0, 1,
-1.087273, -1.664894, -1.00212, 1, 0.8117647, 0, 1,
-1.080946, -1.358864, -1.637884, 1, 0.8156863, 0, 1,
-1.074929, -0.1353399, -2.687853, 1, 0.8235294, 0, 1,
-1.067549, 0.3576297, -1.346092, 1, 0.827451, 0, 1,
-1.065891, -0.9689896, -4.090174, 1, 0.8352941, 0, 1,
-1.061468, 0.6342824, -0.6722224, 1, 0.8392157, 0, 1,
-1.05782, 1.458321, -0.1815778, 1, 0.8470588, 0, 1,
-1.054294, -0.2286111, -1.319325, 1, 0.8509804, 0, 1,
-1.051001, 0.3904449, 0.02379248, 1, 0.8588235, 0, 1,
-1.049434, 0.609521, -1.529151, 1, 0.8627451, 0, 1,
-1.048527, -2.091217, -4.435309, 1, 0.8705882, 0, 1,
-1.048072, 0.8776936, -2.775158, 1, 0.8745098, 0, 1,
-1.044474, -0.5153385, -1.992153, 1, 0.8823529, 0, 1,
-1.043546, -0.6367472, -2.944112, 1, 0.8862745, 0, 1,
-1.038646, -0.811897, -2.862093, 1, 0.8941177, 0, 1,
-1.033448, 1.627308, -1.05476, 1, 0.8980392, 0, 1,
-1.028045, -1.978938, -0.9833364, 1, 0.9058824, 0, 1,
-1.026968, -0.8053238, -3.045769, 1, 0.9137255, 0, 1,
-1.020812, -1.195442, -2.416356, 1, 0.9176471, 0, 1,
-1.020741, 0.6881971, -0.7156756, 1, 0.9254902, 0, 1,
-1.015331, 1.511957, -1.202391, 1, 0.9294118, 0, 1,
-1.012949, 0.0287069, -2.254653, 1, 0.9372549, 0, 1,
-1.01266, -0.3710307, -2.586203, 1, 0.9411765, 0, 1,
-0.9970303, 0.5863352, 0.4704043, 1, 0.9490196, 0, 1,
-0.9965727, 1.07356, -1.296677, 1, 0.9529412, 0, 1,
-0.9920356, -1.308282, -2.416137, 1, 0.9607843, 0, 1,
-0.9898335, 0.22684, -1.797218, 1, 0.9647059, 0, 1,
-0.9878258, 1.279456, -0.5641255, 1, 0.972549, 0, 1,
-0.9805852, 0.4310592, -2.556889, 1, 0.9764706, 0, 1,
-0.9794909, 1.516765, 0.2173987, 1, 0.9843137, 0, 1,
-0.9784684, -0.3082605, -1.897757, 1, 0.9882353, 0, 1,
-0.9677538, -0.5488579, -2.937731, 1, 0.9960784, 0, 1,
-0.967082, 0.631109, -0.2980773, 0.9960784, 1, 0, 1,
-0.9610189, -0.2349494, -2.984205, 0.9921569, 1, 0, 1,
-0.9589238, 0.08170258, -1.890251, 0.9843137, 1, 0, 1,
-0.9357081, -1.358637, -2.794723, 0.9803922, 1, 0, 1,
-0.9319765, -2.087181, -1.827988, 0.972549, 1, 0, 1,
-0.9313825, -0.4903644, -0.9500806, 0.9686275, 1, 0, 1,
-0.9264313, 0.6738168, -0.2328601, 0.9607843, 1, 0, 1,
-0.9237962, -0.215995, -1.739347, 0.9568627, 1, 0, 1,
-0.9219781, 1.226674, 0.2621178, 0.9490196, 1, 0, 1,
-0.9189131, 0.01286878, -0.9562525, 0.945098, 1, 0, 1,
-0.9143687, -0.231648, -2.485179, 0.9372549, 1, 0, 1,
-0.913746, -0.7169989, -1.192987, 0.9333333, 1, 0, 1,
-0.9131663, -0.8266641, -2.141855, 0.9254902, 1, 0, 1,
-0.9100122, 0.9174125, -0.254358, 0.9215686, 1, 0, 1,
-0.907328, -0.06489402, -1.34389, 0.9137255, 1, 0, 1,
-0.9062541, 1.302922, -0.2943442, 0.9098039, 1, 0, 1,
-0.8976768, -0.2227269, -1.766631, 0.9019608, 1, 0, 1,
-0.8918416, 0.9054847, -1.715547, 0.8941177, 1, 0, 1,
-0.8897454, -0.4244263, -1.222167, 0.8901961, 1, 0, 1,
-0.8883479, 0.4041623, -0.8386585, 0.8823529, 1, 0, 1,
-0.8873844, 0.4643356, -1.039174, 0.8784314, 1, 0, 1,
-0.8852364, -0.5499989, -1.969095, 0.8705882, 1, 0, 1,
-0.8845766, 1.3661, -0.1559386, 0.8666667, 1, 0, 1,
-0.8713132, 1.847826, 0.03366174, 0.8588235, 1, 0, 1,
-0.8684558, 0.04219653, -2.111407, 0.854902, 1, 0, 1,
-0.8674078, -1.0625, -2.528736, 0.8470588, 1, 0, 1,
-0.8667415, -1.292804, -3.406165, 0.8431373, 1, 0, 1,
-0.8636187, -0.2388424, -3.493034, 0.8352941, 1, 0, 1,
-0.8602451, -0.01045603, -0.04737975, 0.8313726, 1, 0, 1,
-0.8587137, -0.01270901, -1.340793, 0.8235294, 1, 0, 1,
-0.8571017, -0.3267792, -3.668852, 0.8196079, 1, 0, 1,
-0.8569949, 2.518895, -1.801703, 0.8117647, 1, 0, 1,
-0.854373, 0.2617521, -3.827474, 0.8078431, 1, 0, 1,
-0.8482924, -0.2444875, -2.776822, 0.8, 1, 0, 1,
-0.8435602, -0.5551867, -2.914013, 0.7921569, 1, 0, 1,
-0.8424539, 0.3631217, -0.5588363, 0.7882353, 1, 0, 1,
-0.8396225, -0.3631876, -0.9503939, 0.7803922, 1, 0, 1,
-0.8355355, 0.08042075, -2.673589, 0.7764706, 1, 0, 1,
-0.8295612, 0.2692488, -1.177892, 0.7686275, 1, 0, 1,
-0.8231138, -0.3476541, -4.364999, 0.7647059, 1, 0, 1,
-0.8193585, 0.5464664, -2.76098, 0.7568628, 1, 0, 1,
-0.8126069, -1.676263, -4.306399, 0.7529412, 1, 0, 1,
-0.807639, 0.06916137, -0.7317481, 0.7450981, 1, 0, 1,
-0.8055952, 0.5677659, -0.9750088, 0.7411765, 1, 0, 1,
-0.8043729, 0.2076528, -0.8782972, 0.7333333, 1, 0, 1,
-0.7963452, 0.4609022, -0.0611047, 0.7294118, 1, 0, 1,
-0.7952571, 0.7577396, -0.4169042, 0.7215686, 1, 0, 1,
-0.7889304, 0.6677012, -1.04721, 0.7176471, 1, 0, 1,
-0.7818022, -0.3125301, -1.207508, 0.7098039, 1, 0, 1,
-0.77715, 1.431263, 0.5355055, 0.7058824, 1, 0, 1,
-0.775531, 0.7213503, 0.03736497, 0.6980392, 1, 0, 1,
-0.7716487, -0.4349128, -2.173265, 0.6901961, 1, 0, 1,
-0.7634466, -0.5918339, -1.642536, 0.6862745, 1, 0, 1,
-0.7599535, -0.9026237, -2.355708, 0.6784314, 1, 0, 1,
-0.7564051, -0.2166355, -1.47577, 0.6745098, 1, 0, 1,
-0.7555552, 0.8501084, 0.01346331, 0.6666667, 1, 0, 1,
-0.7519688, -2.080442, -3.279362, 0.6627451, 1, 0, 1,
-0.7478712, -0.2605135, -2.413267, 0.654902, 1, 0, 1,
-0.7354358, 0.3508734, 0.4877297, 0.6509804, 1, 0, 1,
-0.733409, -1.214507, -1.260171, 0.6431373, 1, 0, 1,
-0.7318359, -0.2773295, -1.931019, 0.6392157, 1, 0, 1,
-0.7294922, 0.1770901, -1.12443, 0.6313726, 1, 0, 1,
-0.7271484, -0.2383098, -2.583984, 0.627451, 1, 0, 1,
-0.7269591, -0.1079434, -2.516466, 0.6196079, 1, 0, 1,
-0.7267529, 0.01268762, -1.595891, 0.6156863, 1, 0, 1,
-0.7233177, -0.9572948, -2.638542, 0.6078432, 1, 0, 1,
-0.7228703, 1.336581, 1.033607, 0.6039216, 1, 0, 1,
-0.7219811, 0.4805957, -2.523235, 0.5960785, 1, 0, 1,
-0.7212042, 0.2519702, -1.55382, 0.5882353, 1, 0, 1,
-0.7198542, 1.365304, -0.7622269, 0.5843138, 1, 0, 1,
-0.7180847, -0.1027267, -2.043234, 0.5764706, 1, 0, 1,
-0.7169925, 0.639867, -1.067925, 0.572549, 1, 0, 1,
-0.7157584, -0.1523763, -1.988985, 0.5647059, 1, 0, 1,
-0.7151577, 0.2229943, -1.264506, 0.5607843, 1, 0, 1,
-0.7148024, 0.5749819, -0.2216446, 0.5529412, 1, 0, 1,
-0.7144986, 0.1466074, -0.6524561, 0.5490196, 1, 0, 1,
-0.7114467, 0.8798107, -0.2324538, 0.5411765, 1, 0, 1,
-0.7097882, -0.1184488, -0.3289012, 0.5372549, 1, 0, 1,
-0.7088981, 2.047308, -0.2615059, 0.5294118, 1, 0, 1,
-0.7063898, 0.5186527, -2.626221, 0.5254902, 1, 0, 1,
-0.7035869, -1.647022, -4.436319, 0.5176471, 1, 0, 1,
-0.7002752, -0.6970407, -3.672158, 0.5137255, 1, 0, 1,
-0.6869211, 0.2797219, -0.8483549, 0.5058824, 1, 0, 1,
-0.6840078, 0.6432252, -1.490245, 0.5019608, 1, 0, 1,
-0.6769214, 0.2503756, -0.5459622, 0.4941176, 1, 0, 1,
-0.6743898, -0.5646396, -3.09242, 0.4862745, 1, 0, 1,
-0.6732334, -0.07297248, -1.307355, 0.4823529, 1, 0, 1,
-0.6694497, -0.5199056, -2.106958, 0.4745098, 1, 0, 1,
-0.667922, -0.7702821, -1.717641, 0.4705882, 1, 0, 1,
-0.6640583, 0.627201, -0.6270435, 0.4627451, 1, 0, 1,
-0.6627511, 0.3375223, -1.937057, 0.4588235, 1, 0, 1,
-0.6620646, -0.09948886, -0.9786581, 0.4509804, 1, 0, 1,
-0.6546265, -0.5358952, -2.291754, 0.4470588, 1, 0, 1,
-0.6533632, -1.328816, -1.332712, 0.4392157, 1, 0, 1,
-0.6496097, 0.6568254, -1.603769, 0.4352941, 1, 0, 1,
-0.64749, -0.4420566, -0.2439432, 0.427451, 1, 0, 1,
-0.6467323, 0.1219433, -2.175314, 0.4235294, 1, 0, 1,
-0.6460261, -0.4583334, -3.799958, 0.4156863, 1, 0, 1,
-0.6422716, -0.6939373, -2.242411, 0.4117647, 1, 0, 1,
-0.6386145, -1.549037, -2.230035, 0.4039216, 1, 0, 1,
-0.6366022, 0.03370851, -0.2177992, 0.3960784, 1, 0, 1,
-0.6362845, 1.337075, -0.1172746, 0.3921569, 1, 0, 1,
-0.634095, 1.039462, -0.6592982, 0.3843137, 1, 0, 1,
-0.6232727, -1.408258, -4.467246, 0.3803922, 1, 0, 1,
-0.621678, 3.095766, -0.6457548, 0.372549, 1, 0, 1,
-0.6206856, 0.9180998, -0.2383082, 0.3686275, 1, 0, 1,
-0.6156817, -1.302474, -1.499097, 0.3607843, 1, 0, 1,
-0.6130264, 0.3813077, -3.68671, 0.3568628, 1, 0, 1,
-0.6106524, -0.6388749, -2.585168, 0.3490196, 1, 0, 1,
-0.6082352, 1.160605, -0.832853, 0.345098, 1, 0, 1,
-0.6069732, 0.5433937, 0.07194337, 0.3372549, 1, 0, 1,
-0.6019731, -1.450351, -2.273374, 0.3333333, 1, 0, 1,
-0.5992935, -0.6334159, -3.64953, 0.3254902, 1, 0, 1,
-0.5945685, -1.329366, -1.821859, 0.3215686, 1, 0, 1,
-0.5906122, -0.8810085, -2.262826, 0.3137255, 1, 0, 1,
-0.5905771, 0.3014479, -1.894899, 0.3098039, 1, 0, 1,
-0.5905096, -0.6228852, -2.864777, 0.3019608, 1, 0, 1,
-0.5901215, -1.29416, -2.611033, 0.2941177, 1, 0, 1,
-0.5889804, -1.110441, -3.181498, 0.2901961, 1, 0, 1,
-0.5869551, 1.852796, -1.230247, 0.282353, 1, 0, 1,
-0.5865465, -2.005582, -2.267024, 0.2784314, 1, 0, 1,
-0.584401, -0.2157077, -1.771744, 0.2705882, 1, 0, 1,
-0.5837664, 0.5791246, -0.6259528, 0.2666667, 1, 0, 1,
-0.5813354, -0.298014, -4.145134, 0.2588235, 1, 0, 1,
-0.5803665, -0.8703089, -3.096387, 0.254902, 1, 0, 1,
-0.5792179, -0.2497293, 0.7338089, 0.2470588, 1, 0, 1,
-0.5774572, -0.8196327, -3.05555, 0.2431373, 1, 0, 1,
-0.5724609, -1.058532, -1.990635, 0.2352941, 1, 0, 1,
-0.5696713, -0.3645193, -2.635282, 0.2313726, 1, 0, 1,
-0.5689033, -1.332876, -2.924294, 0.2235294, 1, 0, 1,
-0.568004, -0.9764532, -2.109244, 0.2196078, 1, 0, 1,
-0.5674828, 0.5026366, -3.095734, 0.2117647, 1, 0, 1,
-0.5660447, 0.1427183, -2.069621, 0.2078431, 1, 0, 1,
-0.5647646, -1.032382, -1.500202, 0.2, 1, 0, 1,
-0.5611259, 0.5807208, -1.367433, 0.1921569, 1, 0, 1,
-0.560065, 0.5863891, 0.5984376, 0.1882353, 1, 0, 1,
-0.5565434, 0.1905371, -0.7884011, 0.1803922, 1, 0, 1,
-0.5554562, -0.4855391, -2.452282, 0.1764706, 1, 0, 1,
-0.5548371, -0.6379972, -1.779652, 0.1686275, 1, 0, 1,
-0.5451086, 1.068936, 1.421839, 0.1647059, 1, 0, 1,
-0.5449916, 1.94076, -1.976957, 0.1568628, 1, 0, 1,
-0.5447327, 0.3545403, 0.5613468, 0.1529412, 1, 0, 1,
-0.5441565, 0.04785698, -2.395565, 0.145098, 1, 0, 1,
-0.5388769, -1.005247, -2.953673, 0.1411765, 1, 0, 1,
-0.5373412, -0.4238497, -2.542048, 0.1333333, 1, 0, 1,
-0.5363325, -0.2090794, 0.548713, 0.1294118, 1, 0, 1,
-0.5339168, 0.5428959, -0.5257974, 0.1215686, 1, 0, 1,
-0.5336289, 1.480912, -0.1135568, 0.1176471, 1, 0, 1,
-0.5293657, 0.5714044, -0.1821714, 0.1098039, 1, 0, 1,
-0.5233923, 0.5536193, -1.002322, 0.1058824, 1, 0, 1,
-0.5226841, 2.12419, -1.400661, 0.09803922, 1, 0, 1,
-0.5217668, 0.485462, -0.4968513, 0.09019608, 1, 0, 1,
-0.5159164, -0.3222703, -2.809841, 0.08627451, 1, 0, 1,
-0.513324, 0.5123104, -1.241497, 0.07843138, 1, 0, 1,
-0.5068425, -0.1028941, -1.455736, 0.07450981, 1, 0, 1,
-0.4992873, 1.492638, 1.225337, 0.06666667, 1, 0, 1,
-0.4989768, 0.4409175, 0.8195001, 0.0627451, 1, 0, 1,
-0.487814, -0.4312408, -1.507964, 0.05490196, 1, 0, 1,
-0.4862591, 0.5894489, -1.185726, 0.05098039, 1, 0, 1,
-0.4830089, 1.764188, -0.8584849, 0.04313726, 1, 0, 1,
-0.4825037, 1.090123, -1.234381, 0.03921569, 1, 0, 1,
-0.4808308, 0.7894152, 0.8906738, 0.03137255, 1, 0, 1,
-0.4791995, -1.178549, -1.967784, 0.02745098, 1, 0, 1,
-0.4786849, 0.131163, -1.222501, 0.01960784, 1, 0, 1,
-0.4781422, -0.2592863, -2.150328, 0.01568628, 1, 0, 1,
-0.4773881, -0.3545851, -2.18214, 0.007843138, 1, 0, 1,
-0.4641726, -1.206664, -3.379422, 0.003921569, 1, 0, 1,
-0.462826, -0.4800763, -2.80539, 0, 1, 0.003921569, 1,
-0.4586229, -0.03868196, -2.636528, 0, 1, 0.01176471, 1,
-0.4492564, 0.02927515, -1.352234, 0, 1, 0.01568628, 1,
-0.4481336, -0.6269335, -1.675806, 0, 1, 0.02352941, 1,
-0.4476828, 0.1832634, -1.711354, 0, 1, 0.02745098, 1,
-0.4456644, -2.26161, -1.294584, 0, 1, 0.03529412, 1,
-0.4426305, -2.293139, -2.914527, 0, 1, 0.03921569, 1,
-0.4404406, 0.138639, -3.460372, 0, 1, 0.04705882, 1,
-0.4366818, 1.697551, -0.5165021, 0, 1, 0.05098039, 1,
-0.4321451, -1.823122, -3.719132, 0, 1, 0.05882353, 1,
-0.4308883, 0.6750949, 0.6023749, 0, 1, 0.0627451, 1,
-0.4282818, -2.126093, -4.088664, 0, 1, 0.07058824, 1,
-0.4275457, 0.01004494, -1.960609, 0, 1, 0.07450981, 1,
-0.4269555, -0.1239812, -1.764293, 0, 1, 0.08235294, 1,
-0.4247301, 0.1947471, -3.443794, 0, 1, 0.08627451, 1,
-0.4246527, 0.29839, -2.869598, 0, 1, 0.09411765, 1,
-0.4205446, 2.276334, 1.063853, 0, 1, 0.1019608, 1,
-0.4204326, 0.5504272, -0.1738055, 0, 1, 0.1058824, 1,
-0.4153929, 0.6156538, 0.9656433, 0, 1, 0.1137255, 1,
-0.41273, 1.227777, -0.5779162, 0, 1, 0.1176471, 1,
-0.4089259, -0.8628643, -2.969001, 0, 1, 0.1254902, 1,
-0.4062978, -0.3857988, -2.3964, 0, 1, 0.1294118, 1,
-0.4041592, -1.980154, -1.95641, 0, 1, 0.1372549, 1,
-0.4034742, -0.5282809, -2.980819, 0, 1, 0.1411765, 1,
-0.3982912, -1.053208, -1.138378, 0, 1, 0.1490196, 1,
-0.3962362, 0.6375915, -1.226972, 0, 1, 0.1529412, 1,
-0.388894, -0.4821701, -2.667461, 0, 1, 0.1607843, 1,
-0.3876733, -0.8127378, -2.49966, 0, 1, 0.1647059, 1,
-0.3842703, -0.2579384, -2.087977, 0, 1, 0.172549, 1,
-0.3840671, -2.148788, -2.963776, 0, 1, 0.1764706, 1,
-0.3821576, -1.152462, -3.292719, 0, 1, 0.1843137, 1,
-0.3815338, -0.01031436, -2.275022, 0, 1, 0.1882353, 1,
-0.3786921, -0.04899838, -1.926692, 0, 1, 0.1960784, 1,
-0.377701, -1.027962, -2.10652, 0, 1, 0.2039216, 1,
-0.3762468, 0.4776941, -0.3556152, 0, 1, 0.2078431, 1,
-0.3753402, 1.670683, -0.2354129, 0, 1, 0.2156863, 1,
-0.3687785, 1.148203, 2.176913, 0, 1, 0.2196078, 1,
-0.3674386, -1.314632, -2.254947, 0, 1, 0.227451, 1,
-0.366943, -0.3343615, -3.006124, 0, 1, 0.2313726, 1,
-0.3575751, -1.872546, -2.468319, 0, 1, 0.2392157, 1,
-0.3564208, 0.1363772, -1.764497, 0, 1, 0.2431373, 1,
-0.3521185, -0.2655179, -3.385458, 0, 1, 0.2509804, 1,
-0.3516491, 1.58905, -0.7571119, 0, 1, 0.254902, 1,
-0.3501131, -0.1442998, -1.300565, 0, 1, 0.2627451, 1,
-0.3495816, -0.03683679, -0.7131925, 0, 1, 0.2666667, 1,
-0.3342554, -0.205262, -1.782692, 0, 1, 0.2745098, 1,
-0.3326958, 0.09056759, -2.10878, 0, 1, 0.2784314, 1,
-0.3314245, -2.052736, -3.024937, 0, 1, 0.2862745, 1,
-0.330914, -0.8681703, -2.050049, 0, 1, 0.2901961, 1,
-0.3302698, 2.464727, 0.412942, 0, 1, 0.2980392, 1,
-0.3244549, 0.8181704, 0.8642843, 0, 1, 0.3058824, 1,
-0.3232563, -0.4432582, -2.547626, 0, 1, 0.3098039, 1,
-0.3226939, -1.364921, -3.308078, 0, 1, 0.3176471, 1,
-0.3212186, 1.99395, -0.3683962, 0, 1, 0.3215686, 1,
-0.3191102, 0.8223854, -0.3402432, 0, 1, 0.3294118, 1,
-0.3164113, -0.8482096, -1.673844, 0, 1, 0.3333333, 1,
-0.3147896, -0.1662587, -1.387961, 0, 1, 0.3411765, 1,
-0.3131908, 1.175794, -0.9093612, 0, 1, 0.345098, 1,
-0.3122818, 0.06641869, -0.7456837, 0, 1, 0.3529412, 1,
-0.2920845, -0.4472591, -2.07919, 0, 1, 0.3568628, 1,
-0.2904248, -1.399297, -4.262552, 0, 1, 0.3647059, 1,
-0.2873043, -1.038632, -5.725542, 0, 1, 0.3686275, 1,
-0.286836, 1.156959, -2.3662, 0, 1, 0.3764706, 1,
-0.2850163, -1.582806, -3.844979, 0, 1, 0.3803922, 1,
-0.2849967, -0.7345653, -2.603038, 0, 1, 0.3882353, 1,
-0.2823889, 0.5569687, 0.8105425, 0, 1, 0.3921569, 1,
-0.2756054, 1.996198, -1.095335, 0, 1, 0.4, 1,
-0.2750806, -0.01699381, -2.840318, 0, 1, 0.4078431, 1,
-0.2741406, -0.1610691, -1.637592, 0, 1, 0.4117647, 1,
-0.2733164, -1.577889, -3.870683, 0, 1, 0.4196078, 1,
-0.270256, 0.2333542, -1.275591, 0, 1, 0.4235294, 1,
-0.2619641, 1.053303, 2.134903, 0, 1, 0.4313726, 1,
-0.258839, 0.2695359, -2.46197, 0, 1, 0.4352941, 1,
-0.2578603, 0.1242345, -1.425215, 0, 1, 0.4431373, 1,
-0.2498776, -0.8094774, -4.66993, 0, 1, 0.4470588, 1,
-0.2488797, 0.7967361, -0.3474762, 0, 1, 0.454902, 1,
-0.2442857, 0.09930554, -0.6739385, 0, 1, 0.4588235, 1,
-0.2424019, 1.059987, 0.1714141, 0, 1, 0.4666667, 1,
-0.2408408, 1.349607, -0.9492968, 0, 1, 0.4705882, 1,
-0.2370477, 0.5457904, -0.6910291, 0, 1, 0.4784314, 1,
-0.2350772, -1.060574, -2.666611, 0, 1, 0.4823529, 1,
-0.229879, -1.461438, -3.558145, 0, 1, 0.4901961, 1,
-0.2249731, -0.3090172, -0.7622286, 0, 1, 0.4941176, 1,
-0.2225885, 1.538262, 0.1493566, 0, 1, 0.5019608, 1,
-0.2145384, -0.9543521, -3.036146, 0, 1, 0.509804, 1,
-0.2118842, -0.2915241, -1.880131, 0, 1, 0.5137255, 1,
-0.211446, -0.8334032, -3.459162, 0, 1, 0.5215687, 1,
-0.2109703, -0.4535256, -1.815946, 0, 1, 0.5254902, 1,
-0.2075335, 0.7154455, -0.4231856, 0, 1, 0.5333334, 1,
-0.2049723, 0.6765857, -1.101842, 0, 1, 0.5372549, 1,
-0.2001758, 1.325781, 0.1142031, 0, 1, 0.5450981, 1,
-0.1994736, -1.819971, -1.267554, 0, 1, 0.5490196, 1,
-0.1994011, 0.6372325, -2.43476, 0, 1, 0.5568628, 1,
-0.1984064, -0.1777275, -1.664834, 0, 1, 0.5607843, 1,
-0.1942833, -1.394958, -3.277874, 0, 1, 0.5686275, 1,
-0.1935371, 0.2377423, -1.281893, 0, 1, 0.572549, 1,
-0.1933975, -0.001667652, -0.2844096, 0, 1, 0.5803922, 1,
-0.1929873, -0.619946, -2.936325, 0, 1, 0.5843138, 1,
-0.192803, -2.334911, -4.342126, 0, 1, 0.5921569, 1,
-0.1926242, -1.367495, -3.166372, 0, 1, 0.5960785, 1,
-0.1908531, -1.695606, -1.297313, 0, 1, 0.6039216, 1,
-0.1863351, -0.9423779, -3.479087, 0, 1, 0.6117647, 1,
-0.1817214, 0.0223122, -0.5833793, 0, 1, 0.6156863, 1,
-0.1800221, 1.187455, 0.7470955, 0, 1, 0.6235294, 1,
-0.1756141, 0.81293, -0.673853, 0, 1, 0.627451, 1,
-0.1689778, -1.904034, -5.503523, 0, 1, 0.6352941, 1,
-0.1682361, -0.3982188, -1.594245, 0, 1, 0.6392157, 1,
-0.1648104, 0.3296878, -0.4476448, 0, 1, 0.6470588, 1,
-0.1638029, -0.05097708, -1.460395, 0, 1, 0.6509804, 1,
-0.1629815, 1.026788, 0.7638754, 0, 1, 0.6588235, 1,
-0.1547841, 1.012607, 0.565276, 0, 1, 0.6627451, 1,
-0.1535164, 0.3320202, -0.9943175, 0, 1, 0.6705883, 1,
-0.1490317, 0.173649, 0.6611107, 0, 1, 0.6745098, 1,
-0.1485726, -0.5222048, -3.706075, 0, 1, 0.682353, 1,
-0.1453976, 1.067298, 0.3952246, 0, 1, 0.6862745, 1,
-0.1438998, -0.183031, -2.606969, 0, 1, 0.6941177, 1,
-0.1322166, 0.293108, -0.4812324, 0, 1, 0.7019608, 1,
-0.1312915, 1.48482, 0.6385374, 0, 1, 0.7058824, 1,
-0.1272937, 0.3215122, -0.6986675, 0, 1, 0.7137255, 1,
-0.1249934, -0.1875433, -3.127293, 0, 1, 0.7176471, 1,
-0.1240916, -0.4979397, -4.027526, 0, 1, 0.7254902, 1,
-0.123135, -0.1407473, -0.7584953, 0, 1, 0.7294118, 1,
-0.1214157, -0.8322704, -3.813928, 0, 1, 0.7372549, 1,
-0.1193195, 0.7569354, -0.988965, 0, 1, 0.7411765, 1,
-0.1145388, 0.6409289, -1.564869, 0, 1, 0.7490196, 1,
-0.1129905, 0.1234483, -0.5431746, 0, 1, 0.7529412, 1,
-0.1105438, -0.1969451, -2.634825, 0, 1, 0.7607843, 1,
-0.1093078, -2.459275, -1.962438, 0, 1, 0.7647059, 1,
-0.1091115, 0.9219118, -0.5192494, 0, 1, 0.772549, 1,
-0.1044395, 0.2473285, -0.1536399, 0, 1, 0.7764706, 1,
-0.1025637, 0.9608352, -0.6543829, 0, 1, 0.7843137, 1,
-0.1021226, -0.01892872, -2.503033, 0, 1, 0.7882353, 1,
-0.1007396, 0.5795606, -0.02762928, 0, 1, 0.7960784, 1,
-0.09731936, 0.7570335, -0.3941872, 0, 1, 0.8039216, 1,
-0.09568918, 0.0283134, -1.134018, 0, 1, 0.8078431, 1,
-0.09467313, 0.3708036, 0.1136789, 0, 1, 0.8156863, 1,
-0.09239162, 0.06906266, -2.463176, 0, 1, 0.8196079, 1,
-0.09214882, 0.375626, -0.6518762, 0, 1, 0.827451, 1,
-0.0920217, -1.101853, -1.846334, 0, 1, 0.8313726, 1,
-0.08819978, 0.1298631, 0.09005401, 0, 1, 0.8392157, 1,
-0.08583128, 0.8559886, 0.03652095, 0, 1, 0.8431373, 1,
-0.08338979, 1.105358, -0.4720168, 0, 1, 0.8509804, 1,
-0.08193706, -2.01343, -4.369241, 0, 1, 0.854902, 1,
-0.08124442, 0.331568, -0.09870127, 0, 1, 0.8627451, 1,
-0.07622174, 0.03864301, -2.610057, 0, 1, 0.8666667, 1,
-0.07529184, 0.9481111, 0.1847448, 0, 1, 0.8745098, 1,
-0.07528348, -0.6763184, -3.768595, 0, 1, 0.8784314, 1,
-0.06967488, -0.5023628, -3.130476, 0, 1, 0.8862745, 1,
-0.06435847, 1.379016, 0.6575911, 0, 1, 0.8901961, 1,
-0.05519402, 1.837866, 0.4476888, 0, 1, 0.8980392, 1,
-0.05500079, 0.6092548, -1.162862, 0, 1, 0.9058824, 1,
-0.05353802, 0.09440055, -0.8873252, 0, 1, 0.9098039, 1,
-0.05327334, -1.195827, -1.452359, 0, 1, 0.9176471, 1,
-0.05165591, -0.7094771, -4.109355, 0, 1, 0.9215686, 1,
-0.05161486, -0.102327, -3.495413, 0, 1, 0.9294118, 1,
-0.05084828, 0.3840248, 0.7901141, 0, 1, 0.9333333, 1,
-0.04871635, 0.6250825, 1.884727, 0, 1, 0.9411765, 1,
-0.04806206, 1.528056, -0.1869235, 0, 1, 0.945098, 1,
-0.04743025, 0.4510487, -1.975818, 0, 1, 0.9529412, 1,
-0.04591634, 0.4054641, -0.7332244, 0, 1, 0.9568627, 1,
-0.04457192, -0.4605083, -3.368393, 0, 1, 0.9647059, 1,
-0.04202668, -0.5693556, -3.246193, 0, 1, 0.9686275, 1,
-0.04188427, 0.8417454, -1.46606, 0, 1, 0.9764706, 1,
-0.03733783, 0.655709, 0.006681108, 0, 1, 0.9803922, 1,
-0.03571465, 0.08239207, -0.4070338, 0, 1, 0.9882353, 1,
-0.03018057, -0.3927411, -4.211518, 0, 1, 0.9921569, 1,
-0.02916532, 0.9707596, -0.2973584, 0, 1, 1, 1,
-0.02704626, 0.03357768, -0.6385015, 0, 0.9921569, 1, 1,
-0.02300715, 1.874715, 1.098723, 0, 0.9882353, 1, 1,
-0.02070681, -0.450086, -2.447123, 0, 0.9803922, 1, 1,
-0.02009756, -1.771226, -3.202874, 0, 0.9764706, 1, 1,
-0.01992703, -0.8143101, -3.943472, 0, 0.9686275, 1, 1,
-0.01753499, -1.691668, -3.354488, 0, 0.9647059, 1, 1,
-0.0174935, -0.9005579, -2.737605, 0, 0.9568627, 1, 1,
-0.01626667, -0.08659378, -2.636926, 0, 0.9529412, 1, 1,
-0.01607953, -0.2240562, -3.446937, 0, 0.945098, 1, 1,
-0.01501906, -1.264977, -2.092512, 0, 0.9411765, 1, 1,
-0.01108973, -0.3618912, -1.77819, 0, 0.9333333, 1, 1,
-0.008568281, 1.514952, 0.8235525, 0, 0.9294118, 1, 1,
-0.007503096, 0.7699981, 0.8371773, 0, 0.9215686, 1, 1,
-0.001716372, 1.329242, -0.5363891, 0, 0.9176471, 1, 1,
0.0004543039, -0.3202041, 2.538982, 0, 0.9098039, 1, 1,
0.002623799, -0.5326795, 1.117538, 0, 0.9058824, 1, 1,
0.00825489, 0.4930582, -0.4910535, 0, 0.8980392, 1, 1,
0.009368114, -1.554741, 3.100372, 0, 0.8901961, 1, 1,
0.01467637, 1.169096, -0.5594258, 0, 0.8862745, 1, 1,
0.02042754, 0.09547841, 1.138816, 0, 0.8784314, 1, 1,
0.02532407, 0.8803471, 1.208289, 0, 0.8745098, 1, 1,
0.02628112, -1.727757, 3.175731, 0, 0.8666667, 1, 1,
0.02927178, 0.03721491, 2.430974, 0, 0.8627451, 1, 1,
0.03092361, 0.449119, -0.1461347, 0, 0.854902, 1, 1,
0.03660057, 1.230271, 0.1844771, 0, 0.8509804, 1, 1,
0.03915147, 0.4448155, 0.4078319, 0, 0.8431373, 1, 1,
0.04346385, -0.4501599, 3.369393, 0, 0.8392157, 1, 1,
0.04471224, 0.7206453, 1.050313, 0, 0.8313726, 1, 1,
0.0453511, 0.1666201, 1.590269, 0, 0.827451, 1, 1,
0.04552754, -0.533819, 3.294401, 0, 0.8196079, 1, 1,
0.04983421, 1.332948, 0.1955184, 0, 0.8156863, 1, 1,
0.05040364, -0.1365344, 0.7292729, 0, 0.8078431, 1, 1,
0.05419191, 1.424539, -0.3429331, 0, 0.8039216, 1, 1,
0.0581438, -0.7932026, 1.683644, 0, 0.7960784, 1, 1,
0.05827686, -0.2455594, 2.447247, 0, 0.7882353, 1, 1,
0.05908729, -0.6558301, 2.180192, 0, 0.7843137, 1, 1,
0.06143166, -1.968066, 2.789014, 0, 0.7764706, 1, 1,
0.06323218, 0.5368394, 0.3166806, 0, 0.772549, 1, 1,
0.06391516, -0.64723, 2.029609, 0, 0.7647059, 1, 1,
0.06465448, -0.006067944, -0.4157761, 0, 0.7607843, 1, 1,
0.0661239, -0.6183394, 3.897099, 0, 0.7529412, 1, 1,
0.06752735, 0.1834113, 1.329228, 0, 0.7490196, 1, 1,
0.07570565, -1.67254, 5.281488, 0, 0.7411765, 1, 1,
0.07859062, -0.2210376, 2.837334, 0, 0.7372549, 1, 1,
0.08000755, 0.395585, 1.480397, 0, 0.7294118, 1, 1,
0.08222361, 0.9063476, -2.018976, 0, 0.7254902, 1, 1,
0.08525293, -0.9442193, 1.815728, 0, 0.7176471, 1, 1,
0.08551742, 0.1379439, -0.9620148, 0, 0.7137255, 1, 1,
0.0861459, 1.8372, 0.2341995, 0, 0.7058824, 1, 1,
0.08645988, 0.5954351, 0.1888884, 0, 0.6980392, 1, 1,
0.08776543, 0.9486371, -0.4455814, 0, 0.6941177, 1, 1,
0.0879495, 0.55558, 0.4308735, 0, 0.6862745, 1, 1,
0.08851428, -0.4381754, 1.352804, 0, 0.682353, 1, 1,
0.08886981, -0.5824143, 3.919126, 0, 0.6745098, 1, 1,
0.09428778, -0.06381481, 1.319803, 0, 0.6705883, 1, 1,
0.09507867, 0.4552988, -0.1325863, 0, 0.6627451, 1, 1,
0.09528748, 2.267243, -0.7781612, 0, 0.6588235, 1, 1,
0.09788696, -0.5240515, 2.863926, 0, 0.6509804, 1, 1,
0.1023452, 0.6769072, -0.5657207, 0, 0.6470588, 1, 1,
0.1027504, -1.348823, 3.424655, 0, 0.6392157, 1, 1,
0.1041678, -0.8308721, 2.7277, 0, 0.6352941, 1, 1,
0.1062081, -1.189925, 1.622468, 0, 0.627451, 1, 1,
0.1098811, 0.4568207, 0.4057359, 0, 0.6235294, 1, 1,
0.1106998, 0.7616976, -0.2367191, 0, 0.6156863, 1, 1,
0.1121954, 0.1269926, -0.8445249, 0, 0.6117647, 1, 1,
0.1131645, -0.9247259, 2.206613, 0, 0.6039216, 1, 1,
0.1137477, 1.969694, 0.6463592, 0, 0.5960785, 1, 1,
0.1150326, 0.05619935, 0.9244087, 0, 0.5921569, 1, 1,
0.1180746, 0.3367107, -0.05210537, 0, 0.5843138, 1, 1,
0.1186255, 0.588979, 0.1834396, 0, 0.5803922, 1, 1,
0.1205454, 1.628656, -0.3109624, 0, 0.572549, 1, 1,
0.1208745, 1.510574, 0.1333438, 0, 0.5686275, 1, 1,
0.1214938, -0.5615962, 3.664493, 0, 0.5607843, 1, 1,
0.1231278, 0.6759558, 1.55767, 0, 0.5568628, 1, 1,
0.1261986, -0.3267058, 2.622803, 0, 0.5490196, 1, 1,
0.1267369, -1.005078, 2.853693, 0, 0.5450981, 1, 1,
0.1288899, 0.3906287, -1.372118, 0, 0.5372549, 1, 1,
0.1295381, -0.1727549, 2.756465, 0, 0.5333334, 1, 1,
0.1298177, -0.2826414, 1.921857, 0, 0.5254902, 1, 1,
0.1339217, -0.2786453, 2.256559, 0, 0.5215687, 1, 1,
0.1403522, 0.2133747, -0.06434492, 0, 0.5137255, 1, 1,
0.1404776, -0.5643468, 3.397653, 0, 0.509804, 1, 1,
0.1439681, -0.4824529, 4.043857, 0, 0.5019608, 1, 1,
0.1444227, 0.8930357, 1.236634, 0, 0.4941176, 1, 1,
0.1445456, 0.3171959, 0.7576386, 0, 0.4901961, 1, 1,
0.1463793, 0.173108, 1.353972, 0, 0.4823529, 1, 1,
0.1464895, 0.5717391, 0.8723406, 0, 0.4784314, 1, 1,
0.1507987, -0.7071346, 1.833831, 0, 0.4705882, 1, 1,
0.1511958, 1.818154, -0.7794911, 0, 0.4666667, 1, 1,
0.1587093, -0.3692034, 4.354675, 0, 0.4588235, 1, 1,
0.1606948, 1.017291, 0.401842, 0, 0.454902, 1, 1,
0.1620083, -1.917619, 3.201143, 0, 0.4470588, 1, 1,
0.163317, -0.2083005, 4.102909, 0, 0.4431373, 1, 1,
0.1633762, -0.7356001, 1.58801, 0, 0.4352941, 1, 1,
0.1659617, 1.128291, 0.08712715, 0, 0.4313726, 1, 1,
0.166514, 0.2742837, 0.3383383, 0, 0.4235294, 1, 1,
0.1666132, 1.295455, -0.2828593, 0, 0.4196078, 1, 1,
0.1672691, 1.221529, 0.4272355, 0, 0.4117647, 1, 1,
0.1676549, -1.012572, 3.487127, 0, 0.4078431, 1, 1,
0.1697566, -0.5683197, 3.154701, 0, 0.4, 1, 1,
0.1716797, 0.02520183, 1.408538, 0, 0.3921569, 1, 1,
0.172535, 0.08560161, 1.979293, 0, 0.3882353, 1, 1,
0.1848612, 0.6477936, 0.1937508, 0, 0.3803922, 1, 1,
0.1853287, -0.1834164, 1.243661, 0, 0.3764706, 1, 1,
0.1893218, -1.057615, 3.073222, 0, 0.3686275, 1, 1,
0.1911492, -1.040464, 3.648945, 0, 0.3647059, 1, 1,
0.1988777, 1.32087, 0.6874477, 0, 0.3568628, 1, 1,
0.2020233, 0.6845511, 0.4498334, 0, 0.3529412, 1, 1,
0.2056963, 0.8755308, 2.340203, 0, 0.345098, 1, 1,
0.2064391, -1.470401, 2.553377, 0, 0.3411765, 1, 1,
0.2069541, -1.419278, 1.514566, 0, 0.3333333, 1, 1,
0.208367, -0.6539314, 3.649764, 0, 0.3294118, 1, 1,
0.2125656, -0.2960955, 2.832964, 0, 0.3215686, 1, 1,
0.2135908, 1.214575, -0.4673007, 0, 0.3176471, 1, 1,
0.2185288, 0.6824138, -0.6969143, 0, 0.3098039, 1, 1,
0.2211315, 0.1040011, 2.566186, 0, 0.3058824, 1, 1,
0.2246951, 2.462051, 0.7525353, 0, 0.2980392, 1, 1,
0.2336153, -0.4757115, 2.929932, 0, 0.2901961, 1, 1,
0.2344984, 1.929009, -1.134491, 0, 0.2862745, 1, 1,
0.2361211, -1.562164, 4.361378, 0, 0.2784314, 1, 1,
0.2398719, -0.1654838, 0.033446, 0, 0.2745098, 1, 1,
0.2434592, -0.9679258, 3.728327, 0, 0.2666667, 1, 1,
0.2487433, -0.9560058, 2.777149, 0, 0.2627451, 1, 1,
0.2514431, 0.1064576, 0.5202712, 0, 0.254902, 1, 1,
0.2544378, 1.133191, -0.4310497, 0, 0.2509804, 1, 1,
0.2565853, -0.5082957, 0.5354546, 0, 0.2431373, 1, 1,
0.2604264, 0.3354954, 1.780688, 0, 0.2392157, 1, 1,
0.2685503, -0.9352037, 3.114673, 0, 0.2313726, 1, 1,
0.2718847, -2.169317, 2.406432, 0, 0.227451, 1, 1,
0.2734941, 0.5813453, -0.6876509, 0, 0.2196078, 1, 1,
0.2785779, -0.1385173, 1.397651, 0, 0.2156863, 1, 1,
0.2791156, 0.5242906, 0.6949708, 0, 0.2078431, 1, 1,
0.2828349, 0.006499461, 0.790813, 0, 0.2039216, 1, 1,
0.2858065, -1.028038, 2.775105, 0, 0.1960784, 1, 1,
0.2882261, -1.330387, 4.27037, 0, 0.1882353, 1, 1,
0.3012465, 0.7195292, 0.1904355, 0, 0.1843137, 1, 1,
0.3019279, -2.935282, 3.989298, 0, 0.1764706, 1, 1,
0.3062105, -1.036248, 1.849686, 0, 0.172549, 1, 1,
0.3110093, -0.6867607, 1.102018, 0, 0.1647059, 1, 1,
0.3113297, 1.516595, 1.152658, 0, 0.1607843, 1, 1,
0.3122746, 1.487638, -0.08154508, 0, 0.1529412, 1, 1,
0.3146023, 0.6450522, -0.3129492, 0, 0.1490196, 1, 1,
0.3156402, 0.4633044, 1.9325, 0, 0.1411765, 1, 1,
0.3173828, 0.2101155, 0.6814832, 0, 0.1372549, 1, 1,
0.3201471, -0.3613395, 2.385034, 0, 0.1294118, 1, 1,
0.3202353, 0.2164954, -1.249255, 0, 0.1254902, 1, 1,
0.3204518, 0.9819757, -0.7213544, 0, 0.1176471, 1, 1,
0.3248372, -0.5540366, 3.7102, 0, 0.1137255, 1, 1,
0.3295735, 0.1285352, 2.211106, 0, 0.1058824, 1, 1,
0.3317853, -1.235305, 2.133518, 0, 0.09803922, 1, 1,
0.3360845, 0.3415134, -0.4226559, 0, 0.09411765, 1, 1,
0.3424579, 0.1229444, 0.8384703, 0, 0.08627451, 1, 1,
0.3426302, -0.9519767, 1.501937, 0, 0.08235294, 1, 1,
0.3464842, 0.8068923, -0.9742749, 0, 0.07450981, 1, 1,
0.3520209, 0.0861314, -0.5182261, 0, 0.07058824, 1, 1,
0.3521043, -1.212273, 1.924263, 0, 0.0627451, 1, 1,
0.3522539, -0.006314332, 1.410535, 0, 0.05882353, 1, 1,
0.3543572, -0.531505, 0.8405514, 0, 0.05098039, 1, 1,
0.354584, 0.4239946, 1.577293, 0, 0.04705882, 1, 1,
0.356155, -0.04607951, 1.634165, 0, 0.03921569, 1, 1,
0.3602544, -0.5656816, 0.6518006, 0, 0.03529412, 1, 1,
0.362011, 0.7068115, -0.03300276, 0, 0.02745098, 1, 1,
0.3622606, -0.1216454, 1.650158, 0, 0.02352941, 1, 1,
0.3680395, 0.9402378, -1.733953, 0, 0.01568628, 1, 1,
0.3697327, -0.9008086, 2.409623, 0, 0.01176471, 1, 1,
0.3744605, 1.412736, 1.511142, 0, 0.003921569, 1, 1,
0.3800804, -0.3009316, 3.259101, 0.003921569, 0, 1, 1,
0.3812912, 0.1770785, 1.145745, 0.007843138, 0, 1, 1,
0.3836928, 0.9306438, 2.30914, 0.01568628, 0, 1, 1,
0.3856861, -2.079571, 2.980731, 0.01960784, 0, 1, 1,
0.3911859, 0.1882866, 0.4848515, 0.02745098, 0, 1, 1,
0.391831, -0.5132726, 1.500476, 0.03137255, 0, 1, 1,
0.3927269, -0.6175073, 2.498829, 0.03921569, 0, 1, 1,
0.3938438, 1.663484, 0.9007284, 0.04313726, 0, 1, 1,
0.3956197, -0.6868215, 2.556746, 0.05098039, 0, 1, 1,
0.4020808, -1.462143, 4.49596, 0.05490196, 0, 1, 1,
0.4023621, -0.4678747, 1.506046, 0.0627451, 0, 1, 1,
0.4035348, -0.7078348, 2.531369, 0.06666667, 0, 1, 1,
0.4070458, 0.9672809, -2.468454, 0.07450981, 0, 1, 1,
0.4080231, 0.2509974, 1.366452, 0.07843138, 0, 1, 1,
0.4098648, -0.9082742, 2.522762, 0.08627451, 0, 1, 1,
0.4134392, -1.819866, 3.291423, 0.09019608, 0, 1, 1,
0.4135542, -0.9827022, 3.066088, 0.09803922, 0, 1, 1,
0.4204265, 0.5608277, 1.655481, 0.1058824, 0, 1, 1,
0.4220431, -0.9308739, 2.967063, 0.1098039, 0, 1, 1,
0.4243429, 2.034654, -0.1044857, 0.1176471, 0, 1, 1,
0.4258597, -0.3085001, 1.34969, 0.1215686, 0, 1, 1,
0.4270493, -2.246735, 2.312644, 0.1294118, 0, 1, 1,
0.4277693, -0.4102405, 2.498213, 0.1333333, 0, 1, 1,
0.4291121, 0.5137351, 0.156716, 0.1411765, 0, 1, 1,
0.4362743, 1.72315, 1.301755, 0.145098, 0, 1, 1,
0.4393797, -0.640216, 1.076244, 0.1529412, 0, 1, 1,
0.4576649, 0.01482716, 1.523156, 0.1568628, 0, 1, 1,
0.465656, -2.72068, 2.35529, 0.1647059, 0, 1, 1,
0.4768077, 0.1863333, 0.7711476, 0.1686275, 0, 1, 1,
0.4782733, 1.759137, 2.093877, 0.1764706, 0, 1, 1,
0.4829302, -1.290121, 2.773474, 0.1803922, 0, 1, 1,
0.4834955, -0.06620043, 2.305933, 0.1882353, 0, 1, 1,
0.4843756, -0.5535684, 0.7995853, 0.1921569, 0, 1, 1,
0.4859036, -0.2578573, 0.9884158, 0.2, 0, 1, 1,
0.487629, 0.05358433, 0.7511187, 0.2078431, 0, 1, 1,
0.4884521, 0.5497586, 2.147408, 0.2117647, 0, 1, 1,
0.4907266, 0.303708, 1.051975, 0.2196078, 0, 1, 1,
0.4943603, -0.9093648, 2.830647, 0.2235294, 0, 1, 1,
0.5049057, -0.4778609, 1.262176, 0.2313726, 0, 1, 1,
0.5135415, 1.458408, 0.5032247, 0.2352941, 0, 1, 1,
0.5185984, 0.6785793, 1.795005, 0.2431373, 0, 1, 1,
0.518803, -0.1612784, 0.9791944, 0.2470588, 0, 1, 1,
0.5199136, -0.1320122, 4.513182, 0.254902, 0, 1, 1,
0.5253552, 0.3731945, 0.4693617, 0.2588235, 0, 1, 1,
0.5262669, 0.807591, 0.9337969, 0.2666667, 0, 1, 1,
0.528369, -0.1769394, 1.725856, 0.2705882, 0, 1, 1,
0.5303361, -0.8066403, 2.056277, 0.2784314, 0, 1, 1,
0.5304469, 0.04243679, 1.695172, 0.282353, 0, 1, 1,
0.5307815, -0.9665512, 2.40944, 0.2901961, 0, 1, 1,
0.5422058, -0.3876743, 3.583951, 0.2941177, 0, 1, 1,
0.5431926, 0.4828778, 1.168697, 0.3019608, 0, 1, 1,
0.545198, 0.3959493, -0.1887395, 0.3098039, 0, 1, 1,
0.5479332, -0.2259826, 1.753636, 0.3137255, 0, 1, 1,
0.5511562, 1.492072, 0.2582671, 0.3215686, 0, 1, 1,
0.5537328, 2.283194, -1.898267, 0.3254902, 0, 1, 1,
0.5598441, -0.06978133, 0.6569135, 0.3333333, 0, 1, 1,
0.5608617, -0.8008971, 3.62126, 0.3372549, 0, 1, 1,
0.5624294, 1.038971, -0.09615332, 0.345098, 0, 1, 1,
0.5625235, -0.8601644, 3.39668, 0.3490196, 0, 1, 1,
0.5696595, -0.1629345, 1.588, 0.3568628, 0, 1, 1,
0.5705919, 2.262364, 0.8137898, 0.3607843, 0, 1, 1,
0.5721173, -0.1985952, 2.747291, 0.3686275, 0, 1, 1,
0.5759301, -0.6380908, 2.753218, 0.372549, 0, 1, 1,
0.5764534, -0.27944, 0.2739677, 0.3803922, 0, 1, 1,
0.5790711, 0.7671924, 0.3722331, 0.3843137, 0, 1, 1,
0.5835825, 0.1289675, -0.8154603, 0.3921569, 0, 1, 1,
0.590854, 0.484333, 0.8295178, 0.3960784, 0, 1, 1,
0.6019515, 0.1398894, 1.942968, 0.4039216, 0, 1, 1,
0.6056438, -0.1519219, 0.6029974, 0.4117647, 0, 1, 1,
0.6085833, -0.2749657, 1.251972, 0.4156863, 0, 1, 1,
0.6131416, -1.606706, 2.444291, 0.4235294, 0, 1, 1,
0.6132497, -0.06934444, -1.107038, 0.427451, 0, 1, 1,
0.6142255, 1.386856, 1.949902, 0.4352941, 0, 1, 1,
0.6162726, 1.939401, -1.839455, 0.4392157, 0, 1, 1,
0.6165589, 0.1802939, 1.158809, 0.4470588, 0, 1, 1,
0.618192, -0.5908204, 1.291319, 0.4509804, 0, 1, 1,
0.6212161, 0.1856962, 1.385332, 0.4588235, 0, 1, 1,
0.6217857, 0.457964, 1.351673, 0.4627451, 0, 1, 1,
0.6357535, -0.7010065, 3.327229, 0.4705882, 0, 1, 1,
0.6392793, 0.3757441, 0.7768583, 0.4745098, 0, 1, 1,
0.6404041, 0.9428012, 2.554437, 0.4823529, 0, 1, 1,
0.6436862, -0.4986134, 2.148177, 0.4862745, 0, 1, 1,
0.6478152, -0.4792514, 2.166749, 0.4941176, 0, 1, 1,
0.6525235, 0.4032782, 1.094402, 0.5019608, 0, 1, 1,
0.6641434, -0.6062143, 1.753044, 0.5058824, 0, 1, 1,
0.6716673, -0.3541118, 0.7671013, 0.5137255, 0, 1, 1,
0.6743075, -0.8518889, 0.308635, 0.5176471, 0, 1, 1,
0.6763998, -0.0362744, 2.647495, 0.5254902, 0, 1, 1,
0.6823294, 0.5038596, 0.358804, 0.5294118, 0, 1, 1,
0.6840584, 0.7297109, 1.80294, 0.5372549, 0, 1, 1,
0.6920679, -0.7049046, 0.1823148, 0.5411765, 0, 1, 1,
0.6958189, 0.1865261, 0.3575387, 0.5490196, 0, 1, 1,
0.6968603, 1.596342, 0.7461117, 0.5529412, 0, 1, 1,
0.6995924, 0.4869848, 0.9873661, 0.5607843, 0, 1, 1,
0.7007357, -0.5843218, 4.263131, 0.5647059, 0, 1, 1,
0.7007396, -0.7759421, 2.774265, 0.572549, 0, 1, 1,
0.7008489, 0.4654789, -0.2802593, 0.5764706, 0, 1, 1,
0.7041109, 1.18851, 0.5105818, 0.5843138, 0, 1, 1,
0.707119, 0.2374134, 1.499038, 0.5882353, 0, 1, 1,
0.722469, 0.5904183, 1.373085, 0.5960785, 0, 1, 1,
0.7232822, -0.7151242, 3.706379, 0.6039216, 0, 1, 1,
0.7244526, 0.373697, 1.867654, 0.6078432, 0, 1, 1,
0.7253983, 0.5800254, 0.4313946, 0.6156863, 0, 1, 1,
0.7296582, -0.8848098, 2.137992, 0.6196079, 0, 1, 1,
0.7331043, 1.858341, -0.02887619, 0.627451, 0, 1, 1,
0.7370432, -0.2662121, 2.54518, 0.6313726, 0, 1, 1,
0.73715, -0.01213188, 1.001855, 0.6392157, 0, 1, 1,
0.7404124, -0.1843817, 2.018873, 0.6431373, 0, 1, 1,
0.7455987, -0.4716286, 2.889596, 0.6509804, 0, 1, 1,
0.7492145, 0.3565185, 1.82154, 0.654902, 0, 1, 1,
0.749458, -0.2044726, 2.005384, 0.6627451, 0, 1, 1,
0.7572131, 0.5297288, 2.131067, 0.6666667, 0, 1, 1,
0.7575164, -1.621331, 2.648379, 0.6745098, 0, 1, 1,
0.759724, 0.1826739, 1.58048, 0.6784314, 0, 1, 1,
0.7617844, 0.469538, -1.05424, 0.6862745, 0, 1, 1,
0.7669599, -0.3173334, -0.6099791, 0.6901961, 0, 1, 1,
0.7732797, -0.02251396, 0.8720057, 0.6980392, 0, 1, 1,
0.7740806, 1.596083, 1.448075, 0.7058824, 0, 1, 1,
0.7757856, -2.47279, 2.974984, 0.7098039, 0, 1, 1,
0.7774501, 1.479724, 1.503429, 0.7176471, 0, 1, 1,
0.7785401, -1.394236, 2.570517, 0.7215686, 0, 1, 1,
0.7865742, -1.313398, 2.24539, 0.7294118, 0, 1, 1,
0.7963775, 0.08555059, 1.52127, 0.7333333, 0, 1, 1,
0.8029833, -0.6028789, 0.8261132, 0.7411765, 0, 1, 1,
0.8051562, 0.8239595, 1.197689, 0.7450981, 0, 1, 1,
0.8109451, -2.034113, 2.279181, 0.7529412, 0, 1, 1,
0.8123108, 0.2645572, 2.215637, 0.7568628, 0, 1, 1,
0.8130953, 0.2051687, 2.708716, 0.7647059, 0, 1, 1,
0.8202667, 1.456193, -0.44301, 0.7686275, 0, 1, 1,
0.8207555, -0.1236523, 2.293796, 0.7764706, 0, 1, 1,
0.8223727, 0.7865993, -0.1952701, 0.7803922, 0, 1, 1,
0.833198, -0.02439103, -0.3904769, 0.7882353, 0, 1, 1,
0.8368893, 0.0135611, -0.7970112, 0.7921569, 0, 1, 1,
0.846925, 1.687071, -1.321647, 0.8, 0, 1, 1,
0.8480383, -0.1911532, 2.253191, 0.8078431, 0, 1, 1,
0.8481367, 0.9193916, -0.4580061, 0.8117647, 0, 1, 1,
0.8555581, -1.22357, 3.227401, 0.8196079, 0, 1, 1,
0.8565897, 0.6412463, 1.121395, 0.8235294, 0, 1, 1,
0.8585952, -0.851561, 2.629586, 0.8313726, 0, 1, 1,
0.8614378, 0.4496329, 1.613523, 0.8352941, 0, 1, 1,
0.8744494, -1.438113, 3.057351, 0.8431373, 0, 1, 1,
0.8746169, -0.1447393, 0.3031964, 0.8470588, 0, 1, 1,
0.8782792, -0.3171071, 2.463904, 0.854902, 0, 1, 1,
0.8783904, 0.4918137, 1.271243, 0.8588235, 0, 1, 1,
0.8861385, -1.593556, 2.889501, 0.8666667, 0, 1, 1,
0.8866011, -0.7383158, 1.172626, 0.8705882, 0, 1, 1,
0.8894324, -0.3256744, 1.939396, 0.8784314, 0, 1, 1,
0.8907642, 0.7095832, 3.049821, 0.8823529, 0, 1, 1,
0.8934613, 0.3817654, 1.54706, 0.8901961, 0, 1, 1,
0.8940414, -2.32652, 1.210629, 0.8941177, 0, 1, 1,
0.9105123, -0.02713827, 2.697921, 0.9019608, 0, 1, 1,
0.916064, 0.9641109, -0.3524098, 0.9098039, 0, 1, 1,
0.920141, -1.821166, 3.443418, 0.9137255, 0, 1, 1,
0.9202077, 0.1606909, 0.52626, 0.9215686, 0, 1, 1,
0.9310374, -0.1372183, 2.124088, 0.9254902, 0, 1, 1,
0.9332374, 0.6421383, 1.583438, 0.9333333, 0, 1, 1,
0.9339437, -0.07473601, 1.405788, 0.9372549, 0, 1, 1,
0.9364136, -0.4843192, 1.471399, 0.945098, 0, 1, 1,
0.9451291, -0.05434472, 3.249975, 0.9490196, 0, 1, 1,
0.9508886, 0.8018356, 0.8703431, 0.9568627, 0, 1, 1,
0.951081, 1.694553, 1.344018, 0.9607843, 0, 1, 1,
0.9643479, -0.3874096, 1.820624, 0.9686275, 0, 1, 1,
0.9673734, 2.250099, -0.9782428, 0.972549, 0, 1, 1,
0.9719623, 0.3044168, 1.675889, 0.9803922, 0, 1, 1,
0.9763414, 0.22226, 0.7278889, 0.9843137, 0, 1, 1,
0.9768766, 0.7974058, -0.3817898, 0.9921569, 0, 1, 1,
0.9807598, -0.7175783, 3.878108, 0.9960784, 0, 1, 1,
0.9831249, 0.8314214, 1.203784, 1, 0, 0.9960784, 1,
0.9851653, 1.859003, 0.7157168, 1, 0, 0.9882353, 1,
0.9882642, -1.285006, 2.559506, 1, 0, 0.9843137, 1,
0.9884373, 0.3602933, -0.1178439, 1, 0, 0.9764706, 1,
0.9900769, -0.1164533, 1.062675, 1, 0, 0.972549, 1,
0.9986939, 0.2410902, 1.793383, 1, 0, 0.9647059, 1,
1.005319, -0.06719936, 2.369472, 1, 0, 0.9607843, 1,
1.008533, -1.358807, 2.063884, 1, 0, 0.9529412, 1,
1.01399, 0.5001808, 2.256555, 1, 0, 0.9490196, 1,
1.016446, 0.9730695, 1.776548, 1, 0, 0.9411765, 1,
1.017728, 0.4037129, 1.917498, 1, 0, 0.9372549, 1,
1.026701, -0.5093153, 2.225652, 1, 0, 0.9294118, 1,
1.027592, -1.230664, 1.950869, 1, 0, 0.9254902, 1,
1.02889, 0.9552727, 0.6662763, 1, 0, 0.9176471, 1,
1.029184, 0.08063047, 1.352214, 1, 0, 0.9137255, 1,
1.029689, 0.5909691, 0.1761575, 1, 0, 0.9058824, 1,
1.043492, -1.718762, 3.093161, 1, 0, 0.9019608, 1,
1.043591, -0.8007191, 2.770266, 1, 0, 0.8941177, 1,
1.044395, 0.1191968, 2.352223, 1, 0, 0.8862745, 1,
1.055329, 0.2947939, 1.373811, 1, 0, 0.8823529, 1,
1.058822, 1.16042, 1.097363, 1, 0, 0.8745098, 1,
1.062306, 0.05407291, 1.912966, 1, 0, 0.8705882, 1,
1.064264, -0.3026868, 1.498978, 1, 0, 0.8627451, 1,
1.068253, -0.1669921, 3.329868, 1, 0, 0.8588235, 1,
1.074443, 0.2826141, -0.7266468, 1, 0, 0.8509804, 1,
1.075609, -0.2809322, 1.657387, 1, 0, 0.8470588, 1,
1.089273, -0.04868484, 2.235004, 1, 0, 0.8392157, 1,
1.096334, 1.100752, 0.5280674, 1, 0, 0.8352941, 1,
1.106017, 1.769708, -0.5274795, 1, 0, 0.827451, 1,
1.111065, -1.553521, 2.63316, 1, 0, 0.8235294, 1,
1.116024, 0.3275758, 1.422804, 1, 0, 0.8156863, 1,
1.122918, -0.3605382, 1.995127, 1, 0, 0.8117647, 1,
1.12384, 0.4899276, 0.7161664, 1, 0, 0.8039216, 1,
1.128488, -0.2676095, 2.052029, 1, 0, 0.7960784, 1,
1.128986, 0.267801, 1.136325, 1, 0, 0.7921569, 1,
1.144643, 0.167075, 0.9243453, 1, 0, 0.7843137, 1,
1.146411, -0.3289335, 1.613718, 1, 0, 0.7803922, 1,
1.156518, -0.5514835, 0.2784882, 1, 0, 0.772549, 1,
1.164239, 0.3257351, 0.3452829, 1, 0, 0.7686275, 1,
1.168897, -0.3356768, 0.4771248, 1, 0, 0.7607843, 1,
1.180787, -0.58893, 0.7636878, 1, 0, 0.7568628, 1,
1.18178, -0.8997051, 0.551061, 1, 0, 0.7490196, 1,
1.183065, 1.003527, 1.518305, 1, 0, 0.7450981, 1,
1.188638, 0.3432859, 0.596216, 1, 0, 0.7372549, 1,
1.19483, 0.5832532, 3.31684, 1, 0, 0.7333333, 1,
1.20182, 0.5720195, 1.012015, 1, 0, 0.7254902, 1,
1.204813, -2.030273, 1.871762, 1, 0, 0.7215686, 1,
1.212935, -0.2645188, 2.440197, 1, 0, 0.7137255, 1,
1.215056, -1.971911, 0.4470393, 1, 0, 0.7098039, 1,
1.217779, -0.2776019, 0.5166231, 1, 0, 0.7019608, 1,
1.237687, 0.2357928, 1.04519, 1, 0, 0.6941177, 1,
1.250891, -0.3123191, -0.5100998, 1, 0, 0.6901961, 1,
1.251021, 0.3289083, 1.598567, 1, 0, 0.682353, 1,
1.251486, 0.1579597, 1.107989, 1, 0, 0.6784314, 1,
1.254282, -0.8303902, 1.605657, 1, 0, 0.6705883, 1,
1.254908, -0.6718359, 1.455686, 1, 0, 0.6666667, 1,
1.264273, 0.2742067, 1.79729, 1, 0, 0.6588235, 1,
1.265644, 1.027881, 0.7845864, 1, 0, 0.654902, 1,
1.268952, -1.620284, 1.953736, 1, 0, 0.6470588, 1,
1.27175, 0.07882573, 1.865743, 1, 0, 0.6431373, 1,
1.272943, 0.1849378, 2.359377, 1, 0, 0.6352941, 1,
1.276102, 0.04363566, 3.174991, 1, 0, 0.6313726, 1,
1.27889, -0.2794094, 0.69718, 1, 0, 0.6235294, 1,
1.281021, -0.08260249, 1.875639, 1, 0, 0.6196079, 1,
1.281482, 0.513392, 0.9524902, 1, 0, 0.6117647, 1,
1.284498, -0.8492607, 2.233755, 1, 0, 0.6078432, 1,
1.315044, 0.9356113, -0.8229095, 1, 0, 0.6, 1,
1.317901, 0.8093013, 2.076714, 1, 0, 0.5921569, 1,
1.328617, -1.514922, 3.14273, 1, 0, 0.5882353, 1,
1.347954, 0.7141075, -1.632858, 1, 0, 0.5803922, 1,
1.351062, -0.4345174, 0.9225097, 1, 0, 0.5764706, 1,
1.351234, 1.05716, 0.5160787, 1, 0, 0.5686275, 1,
1.355533, 0.08950023, 2.641071, 1, 0, 0.5647059, 1,
1.359666, 0.1973689, 2.118611, 1, 0, 0.5568628, 1,
1.370461, -1.374177, 0.7648625, 1, 0, 0.5529412, 1,
1.371233, 1.869125, 0.2543865, 1, 0, 0.5450981, 1,
1.37174, -1.476663, 1.306329, 1, 0, 0.5411765, 1,
1.378756, -2.285728, 2.5639, 1, 0, 0.5333334, 1,
1.385674, -1.293208, 2.73376, 1, 0, 0.5294118, 1,
1.397835, 0.2310976, 1.904717, 1, 0, 0.5215687, 1,
1.421508, 1.037933, 0.8086519, 1, 0, 0.5176471, 1,
1.427136, -0.4523509, 0.6021075, 1, 0, 0.509804, 1,
1.433136, -1.436489, 3.792925, 1, 0, 0.5058824, 1,
1.435485, 1.637657, -0.2364502, 1, 0, 0.4980392, 1,
1.453866, 1.725245, 0.02314667, 1, 0, 0.4901961, 1,
1.466236, -0.4169704, 2.454482, 1, 0, 0.4862745, 1,
1.472502, 0.2041876, 3.938709, 1, 0, 0.4784314, 1,
1.476606, -1.184473, 1.898111, 1, 0, 0.4745098, 1,
1.495241, -0.6256247, 1.698918, 1, 0, 0.4666667, 1,
1.507088, 0.4708458, 0.3386053, 1, 0, 0.4627451, 1,
1.50838, -1.082136, 1.788642, 1, 0, 0.454902, 1,
1.527292, 0.3223547, 2.559375, 1, 0, 0.4509804, 1,
1.533409, 0.9246263, 0.3441982, 1, 0, 0.4431373, 1,
1.534738, 0.5573956, 2.459507, 1, 0, 0.4392157, 1,
1.538766, -0.9121128, 1.919587, 1, 0, 0.4313726, 1,
1.548211, 0.09946906, -0.4932098, 1, 0, 0.427451, 1,
1.548438, -0.1787892, 0.1772226, 1, 0, 0.4196078, 1,
1.553175, -0.1743492, 1.406519, 1, 0, 0.4156863, 1,
1.555695, 0.7643783, 0.3513575, 1, 0, 0.4078431, 1,
1.559444, 0.8088203, 2.128599, 1, 0, 0.4039216, 1,
1.574109, -0.636675, 0.6179802, 1, 0, 0.3960784, 1,
1.580687, 0.5456508, 0.7079204, 1, 0, 0.3882353, 1,
1.5854, -1.789526, 3.001176, 1, 0, 0.3843137, 1,
1.592573, 1.123855, 1.288458, 1, 0, 0.3764706, 1,
1.622903, -1.772406, 3.260972, 1, 0, 0.372549, 1,
1.638023, -0.05156874, 2.704077, 1, 0, 0.3647059, 1,
1.654151, 0.6242783, 0.8788837, 1, 0, 0.3607843, 1,
1.654668, -1.270762, 0.838465, 1, 0, 0.3529412, 1,
1.661185, -1.019267, 1.291856, 1, 0, 0.3490196, 1,
1.663432, 0.6841583, 1.099451, 1, 0, 0.3411765, 1,
1.668191, 0.5067035, 1.173558, 1, 0, 0.3372549, 1,
1.678744, -0.5573902, 1.970101, 1, 0, 0.3294118, 1,
1.679009, -1.864209, 2.215966, 1, 0, 0.3254902, 1,
1.681143, -1.661024, 3.392331, 1, 0, 0.3176471, 1,
1.68256, -0.1873939, 1.819191, 1, 0, 0.3137255, 1,
1.688128, 0.1497276, 1.529974, 1, 0, 0.3058824, 1,
1.701812, 1.262245, 0.5088556, 1, 0, 0.2980392, 1,
1.754464, 0.2781908, 0.7501545, 1, 0, 0.2941177, 1,
1.756664, -0.4882376, 0.5334284, 1, 0, 0.2862745, 1,
1.762074, -1.641754, 3.405787, 1, 0, 0.282353, 1,
1.762798, 1.211183, 3.080829, 1, 0, 0.2745098, 1,
1.784927, -1.374676, 3.383135, 1, 0, 0.2705882, 1,
1.80221, -0.4343705, 1.732123, 1, 0, 0.2627451, 1,
1.8197, -0.5012003, -0.03158908, 1, 0, 0.2588235, 1,
1.823445, -0.8751489, 1.708947, 1, 0, 0.2509804, 1,
1.82497, -0.9936148, 1.236405, 1, 0, 0.2470588, 1,
1.83223, -0.4788809, 1.18681, 1, 0, 0.2392157, 1,
1.83628, -2.582542, 3.480177, 1, 0, 0.2352941, 1,
1.850231, 0.06666164, 0.6008814, 1, 0, 0.227451, 1,
1.866887, -0.1074002, 3.25622, 1, 0, 0.2235294, 1,
1.871929, 0.5003381, 2.994593, 1, 0, 0.2156863, 1,
1.878011, 0.1802635, 0.1945079, 1, 0, 0.2117647, 1,
1.880046, 0.5664758, 1.108754, 1, 0, 0.2039216, 1,
1.89446, 0.6191265, 0.7476522, 1, 0, 0.1960784, 1,
1.89497, -0.559813, 2.325513, 1, 0, 0.1921569, 1,
1.896298, -0.3966765, 2.951817, 1, 0, 0.1843137, 1,
1.897967, 2.641084, 0.8879021, 1, 0, 0.1803922, 1,
1.9433, -1.226828, 1.905861, 1, 0, 0.172549, 1,
1.956859, 1.550564, 1.619457, 1, 0, 0.1686275, 1,
1.971194, 0.4856371, 1.926954, 1, 0, 0.1607843, 1,
1.989635, 0.4179213, 2.786439, 1, 0, 0.1568628, 1,
2.004623, 0.195437, 2.302728, 1, 0, 0.1490196, 1,
2.007773, -0.5918658, 1.664298, 1, 0, 0.145098, 1,
2.021182, -0.1035189, 0.2498555, 1, 0, 0.1372549, 1,
2.051311, -1.378189, 3.68582, 1, 0, 0.1333333, 1,
2.058209, 1.975114, 1.610896, 1, 0, 0.1254902, 1,
2.08598, -0.3625437, 1.831789, 1, 0, 0.1215686, 1,
2.107772, 0.01040262, 2.555688, 1, 0, 0.1137255, 1,
2.113553, 0.8423913, 2.979981, 1, 0, 0.1098039, 1,
2.148928, -0.8655269, 2.315764, 1, 0, 0.1019608, 1,
2.183263, 0.5306748, 2.088959, 1, 0, 0.09411765, 1,
2.187811, 0.2504542, 0.2575103, 1, 0, 0.09019608, 1,
2.192407, -0.4756877, 1.187119, 1, 0, 0.08235294, 1,
2.199294, -0.07474331, 2.878467, 1, 0, 0.07843138, 1,
2.209824, -0.3575106, 1.508692, 1, 0, 0.07058824, 1,
2.254493, 0.4957342, 1.403154, 1, 0, 0.06666667, 1,
2.295401, -1.049136, 3.413704, 1, 0, 0.05882353, 1,
2.298875, -0.3102918, 2.063766, 1, 0, 0.05490196, 1,
2.347445, -2.220234, 2.33925, 1, 0, 0.04705882, 1,
2.398464, 1.450335, 1.090952, 1, 0, 0.04313726, 1,
2.469592, -0.2695723, 2.301863, 1, 0, 0.03529412, 1,
2.532199, -1.447201, 2.023764, 1, 0, 0.03137255, 1,
2.532573, -0.05393617, 2.109927, 1, 0, 0.02352941, 1,
2.549011, 0.03097696, 1.98392, 1, 0, 0.01960784, 1,
2.691246, 0.1476493, 1.12109, 1, 0, 0.01176471, 1,
2.747683, -1.684573, 1.622556, 1, 0, 0.007843138, 1
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
-0.1955385, -4.135245, -7.591233, 0, -0.5, 0.5, 0.5,
-0.1955385, -4.135245, -7.591233, 1, -0.5, 0.5, 0.5,
-0.1955385, -4.135245, -7.591233, 1, 1.5, 0.5, 0.5,
-0.1955385, -4.135245, -7.591233, 0, 1.5, 0.5, 0.5
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
-4.136513, 0.004269123, -7.591233, 0, -0.5, 0.5, 0.5,
-4.136513, 0.004269123, -7.591233, 1, -0.5, 0.5, 0.5,
-4.136513, 0.004269123, -7.591233, 1, 1.5, 0.5, 0.5,
-4.136513, 0.004269123, -7.591233, 0, 1.5, 0.5, 0.5
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
-4.136513, -4.135245, -0.2220266, 0, -0.5, 0.5, 0.5,
-4.136513, -4.135245, -0.2220266, 1, -0.5, 0.5, 0.5,
-4.136513, -4.135245, -0.2220266, 1, 1.5, 0.5, 0.5,
-4.136513, -4.135245, -0.2220266, 0, 1.5, 0.5, 0.5
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
-3, -3.179972, -5.890647,
2, -3.179972, -5.890647,
-3, -3.179972, -5.890647,
-3, -3.339185, -6.174078,
-2, -3.179972, -5.890647,
-2, -3.339185, -6.174078,
-1, -3.179972, -5.890647,
-1, -3.339185, -6.174078,
0, -3.179972, -5.890647,
0, -3.339185, -6.174078,
1, -3.179972, -5.890647,
1, -3.339185, -6.174078,
2, -3.179972, -5.890647,
2, -3.339185, -6.174078
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
-3, -3.657609, -6.74094, 0, -0.5, 0.5, 0.5,
-3, -3.657609, -6.74094, 1, -0.5, 0.5, 0.5,
-3, -3.657609, -6.74094, 1, 1.5, 0.5, 0.5,
-3, -3.657609, -6.74094, 0, 1.5, 0.5, 0.5,
-2, -3.657609, -6.74094, 0, -0.5, 0.5, 0.5,
-2, -3.657609, -6.74094, 1, -0.5, 0.5, 0.5,
-2, -3.657609, -6.74094, 1, 1.5, 0.5, 0.5,
-2, -3.657609, -6.74094, 0, 1.5, 0.5, 0.5,
-1, -3.657609, -6.74094, 0, -0.5, 0.5, 0.5,
-1, -3.657609, -6.74094, 1, -0.5, 0.5, 0.5,
-1, -3.657609, -6.74094, 1, 1.5, 0.5, 0.5,
-1, -3.657609, -6.74094, 0, 1.5, 0.5, 0.5,
0, -3.657609, -6.74094, 0, -0.5, 0.5, 0.5,
0, -3.657609, -6.74094, 1, -0.5, 0.5, 0.5,
0, -3.657609, -6.74094, 1, 1.5, 0.5, 0.5,
0, -3.657609, -6.74094, 0, 1.5, 0.5, 0.5,
1, -3.657609, -6.74094, 0, -0.5, 0.5, 0.5,
1, -3.657609, -6.74094, 1, -0.5, 0.5, 0.5,
1, -3.657609, -6.74094, 1, 1.5, 0.5, 0.5,
1, -3.657609, -6.74094, 0, 1.5, 0.5, 0.5,
2, -3.657609, -6.74094, 0, -0.5, 0.5, 0.5,
2, -3.657609, -6.74094, 1, -0.5, 0.5, 0.5,
2, -3.657609, -6.74094, 1, 1.5, 0.5, 0.5,
2, -3.657609, -6.74094, 0, 1.5, 0.5, 0.5
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
-3.227057, -3, -5.890647,
-3.227057, 3, -5.890647,
-3.227057, -3, -5.890647,
-3.378633, -3, -6.174078,
-3.227057, -2, -5.890647,
-3.378633, -2, -6.174078,
-3.227057, -1, -5.890647,
-3.378633, -1, -6.174078,
-3.227057, 0, -5.890647,
-3.378633, 0, -6.174078,
-3.227057, 1, -5.890647,
-3.378633, 1, -6.174078,
-3.227057, 2, -5.890647,
-3.378633, 2, -6.174078,
-3.227057, 3, -5.890647,
-3.378633, 3, -6.174078
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
-3.681785, -3, -6.74094, 0, -0.5, 0.5, 0.5,
-3.681785, -3, -6.74094, 1, -0.5, 0.5, 0.5,
-3.681785, -3, -6.74094, 1, 1.5, 0.5, 0.5,
-3.681785, -3, -6.74094, 0, 1.5, 0.5, 0.5,
-3.681785, -2, -6.74094, 0, -0.5, 0.5, 0.5,
-3.681785, -2, -6.74094, 1, -0.5, 0.5, 0.5,
-3.681785, -2, -6.74094, 1, 1.5, 0.5, 0.5,
-3.681785, -2, -6.74094, 0, 1.5, 0.5, 0.5,
-3.681785, -1, -6.74094, 0, -0.5, 0.5, 0.5,
-3.681785, -1, -6.74094, 1, -0.5, 0.5, 0.5,
-3.681785, -1, -6.74094, 1, 1.5, 0.5, 0.5,
-3.681785, -1, -6.74094, 0, 1.5, 0.5, 0.5,
-3.681785, 0, -6.74094, 0, -0.5, 0.5, 0.5,
-3.681785, 0, -6.74094, 1, -0.5, 0.5, 0.5,
-3.681785, 0, -6.74094, 1, 1.5, 0.5, 0.5,
-3.681785, 0, -6.74094, 0, 1.5, 0.5, 0.5,
-3.681785, 1, -6.74094, 0, -0.5, 0.5, 0.5,
-3.681785, 1, -6.74094, 1, -0.5, 0.5, 0.5,
-3.681785, 1, -6.74094, 1, 1.5, 0.5, 0.5,
-3.681785, 1, -6.74094, 0, 1.5, 0.5, 0.5,
-3.681785, 2, -6.74094, 0, -0.5, 0.5, 0.5,
-3.681785, 2, -6.74094, 1, -0.5, 0.5, 0.5,
-3.681785, 2, -6.74094, 1, 1.5, 0.5, 0.5,
-3.681785, 2, -6.74094, 0, 1.5, 0.5, 0.5,
-3.681785, 3, -6.74094, 0, -0.5, 0.5, 0.5,
-3.681785, 3, -6.74094, 1, -0.5, 0.5, 0.5,
-3.681785, 3, -6.74094, 1, 1.5, 0.5, 0.5,
-3.681785, 3, -6.74094, 0, 1.5, 0.5, 0.5
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
-3.227057, -3.179972, -4,
-3.227057, -3.179972, 4,
-3.227057, -3.179972, -4,
-3.378633, -3.339185, -4,
-3.227057, -3.179972, -2,
-3.378633, -3.339185, -2,
-3.227057, -3.179972, 0,
-3.378633, -3.339185, 0,
-3.227057, -3.179972, 2,
-3.378633, -3.339185, 2,
-3.227057, -3.179972, 4,
-3.378633, -3.339185, 4
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
-3.681785, -3.657609, -4, 0, -0.5, 0.5, 0.5,
-3.681785, -3.657609, -4, 1, -0.5, 0.5, 0.5,
-3.681785, -3.657609, -4, 1, 1.5, 0.5, 0.5,
-3.681785, -3.657609, -4, 0, 1.5, 0.5, 0.5,
-3.681785, -3.657609, -2, 0, -0.5, 0.5, 0.5,
-3.681785, -3.657609, -2, 1, -0.5, 0.5, 0.5,
-3.681785, -3.657609, -2, 1, 1.5, 0.5, 0.5,
-3.681785, -3.657609, -2, 0, 1.5, 0.5, 0.5,
-3.681785, -3.657609, 0, 0, -0.5, 0.5, 0.5,
-3.681785, -3.657609, 0, 1, -0.5, 0.5, 0.5,
-3.681785, -3.657609, 0, 1, 1.5, 0.5, 0.5,
-3.681785, -3.657609, 0, 0, 1.5, 0.5, 0.5,
-3.681785, -3.657609, 2, 0, -0.5, 0.5, 0.5,
-3.681785, -3.657609, 2, 1, -0.5, 0.5, 0.5,
-3.681785, -3.657609, 2, 1, 1.5, 0.5, 0.5,
-3.681785, -3.657609, 2, 0, 1.5, 0.5, 0.5,
-3.681785, -3.657609, 4, 0, -0.5, 0.5, 0.5,
-3.681785, -3.657609, 4, 1, -0.5, 0.5, 0.5,
-3.681785, -3.657609, 4, 1, 1.5, 0.5, 0.5,
-3.681785, -3.657609, 4, 0, 1.5, 0.5, 0.5
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
-3.227057, -3.179972, -5.890647,
-3.227057, 3.188511, -5.890647,
-3.227057, -3.179972, 5.446594,
-3.227057, 3.188511, 5.446594,
-3.227057, -3.179972, -5.890647,
-3.227057, -3.179972, 5.446594,
-3.227057, 3.188511, -5.890647,
-3.227057, 3.188511, 5.446594,
-3.227057, -3.179972, -5.890647,
2.83598, -3.179972, -5.890647,
-3.227057, -3.179972, 5.446594,
2.83598, -3.179972, 5.446594,
-3.227057, 3.188511, -5.890647,
2.83598, 3.188511, -5.890647,
-3.227057, 3.188511, 5.446594,
2.83598, 3.188511, 5.446594,
2.83598, -3.179972, -5.890647,
2.83598, 3.188511, -5.890647,
2.83598, -3.179972, 5.446594,
2.83598, 3.188511, 5.446594,
2.83598, -3.179972, -5.890647,
2.83598, -3.179972, 5.446594,
2.83598, 3.188511, -5.890647,
2.83598, 3.188511, 5.446594
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
var radius = 7.661291;
var distance = 34.08595;
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
mvMatrix.translate( 0.1955385, -0.004269123, 0.2220266 );
mvMatrix.scale( 1.366236, 1.300708, 0.7306485 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.08595);
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
mitoxantrone<-read.table("mitoxantrone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mitoxantrone$V2
```

```
## Error in eval(expr, envir, enclos): object 'mitoxantrone' not found
```

```r
y<-mitoxantrone$V3
```

```
## Error in eval(expr, envir, enclos): object 'mitoxantrone' not found
```

```r
z<-mitoxantrone$V4
```

```
## Error in eval(expr, envir, enclos): object 'mitoxantrone' not found
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
-3.13876, 0.1308351, 0.07303798, 0, 0, 1, 1, 1,
-3.082385, -0.0004773562, -1.9589, 1, 0, 0, 1, 1,
-2.829263, 0.6850166, -1.298155, 1, 0, 0, 1, 1,
-2.757812, 1.899565, -0.48888, 1, 0, 0, 1, 1,
-2.737246, 0.8920724, -1.719134, 1, 0, 0, 1, 1,
-2.58962, 0.0469193, -2.590189, 1, 0, 0, 1, 1,
-2.504626, 0.4825992, -1.799883, 0, 0, 0, 1, 1,
-2.498999, 0.5895094, -1.634568, 0, 0, 0, 1, 1,
-2.477147, 1.743943, -0.4294364, 0, 0, 0, 1, 1,
-2.476964, 0.6039926, -0.2674826, 0, 0, 0, 1, 1,
-2.454774, -0.4083113, -3.309355, 0, 0, 0, 1, 1,
-2.453062, -0.7420771, -0.387216, 0, 0, 0, 1, 1,
-2.419245, 1.644167, 0.1687239, 0, 0, 0, 1, 1,
-2.417113, -0.4778832, -2.046457, 1, 1, 1, 1, 1,
-2.416428, 0.3459646, -2.834647, 1, 1, 1, 1, 1,
-2.327968, -0.3320111, -1.534701, 1, 1, 1, 1, 1,
-2.28848, 2.525264, 0.1784752, 1, 1, 1, 1, 1,
-2.282743, 0.3936842, -0.8767061, 1, 1, 1, 1, 1,
-2.280131, 0.5340914, -1.430846, 1, 1, 1, 1, 1,
-2.227314, -1.47895, -2.825302, 1, 1, 1, 1, 1,
-2.202108, 1.193972, -1.367775, 1, 1, 1, 1, 1,
-2.189269, -1.769246, -2.901248, 1, 1, 1, 1, 1,
-2.112996, -1.799858, -3.455954, 1, 1, 1, 1, 1,
-2.094059, 1.943059, 0.4036606, 1, 1, 1, 1, 1,
-2.090444, 0.2082723, -1.540136, 1, 1, 1, 1, 1,
-2.087003, -1.298263, -2.969115, 1, 1, 1, 1, 1,
-2.07782, -3.087228, -3.687064, 1, 1, 1, 1, 1,
-2.067082, -0.5292076, -1.636588, 1, 1, 1, 1, 1,
-2.028424, -1.148108, -2.865232, 0, 0, 1, 1, 1,
-2.020907, -0.5285642, -3.345631, 1, 0, 0, 1, 1,
-1.958875, 0.3044486, -1.403224, 1, 0, 0, 1, 1,
-1.940884, 0.4071513, -1.026813, 1, 0, 0, 1, 1,
-1.914526, -1.998762, -2.063981, 1, 0, 0, 1, 1,
-1.913302, -0.7941933, -1.729801, 1, 0, 0, 1, 1,
-1.90603, 0.2763986, -1.771459, 0, 0, 0, 1, 1,
-1.900114, -0.02027225, -2.184124, 0, 0, 0, 1, 1,
-1.882414, 0.3428335, -0.3019007, 0, 0, 0, 1, 1,
-1.870177, 0.06217408, -1.815877, 0, 0, 0, 1, 1,
-1.853225, -1.229442, -1.093109, 0, 0, 0, 1, 1,
-1.812618, 0.1988423, -3.1693, 0, 0, 0, 1, 1,
-1.798401, 0.4194845, -1.21874, 0, 0, 0, 1, 1,
-1.767811, 1.925365, -0.466499, 1, 1, 1, 1, 1,
-1.76008, 0.0223824, -1.910403, 1, 1, 1, 1, 1,
-1.739801, 1.575873, -1.090969, 1, 1, 1, 1, 1,
-1.712485, 1.124739, 0.3603859, 1, 1, 1, 1, 1,
-1.70557, 0.2906978, -1.060707, 1, 1, 1, 1, 1,
-1.705404, 0.8101307, -0.5501513, 1, 1, 1, 1, 1,
-1.704397, 1.873627, 0.6274253, 1, 1, 1, 1, 1,
-1.702162, -0.6468264, -3.692157, 1, 1, 1, 1, 1,
-1.682273, -0.9229972, -1.139618, 1, 1, 1, 1, 1,
-1.680408, -0.1841132, -2.725778, 1, 1, 1, 1, 1,
-1.679862, 0.2219793, -0.9877773, 1, 1, 1, 1, 1,
-1.64966, 0.01438855, -1.572012, 1, 1, 1, 1, 1,
-1.642348, -1.074543, -1.278135, 1, 1, 1, 1, 1,
-1.607593, -0.1998189, -0.6137139, 1, 1, 1, 1, 1,
-1.600589, -1.124002, -2.472379, 1, 1, 1, 1, 1,
-1.599159, 0.3596828, -0.6716367, 0, 0, 1, 1, 1,
-1.587313, 0.9583772, -1.585761, 1, 0, 0, 1, 1,
-1.583737, 0.0146388, -2.563386, 1, 0, 0, 1, 1,
-1.560747, 0.4560615, -1.807666, 1, 0, 0, 1, 1,
-1.549017, 0.4124149, -1.993099, 1, 0, 0, 1, 1,
-1.543036, 0.8137596, -1.015283, 1, 0, 0, 1, 1,
-1.526875, 1.254647, -0.4259916, 0, 0, 0, 1, 1,
-1.51251, -0.9865601, -3.530058, 0, 0, 0, 1, 1,
-1.502938, -0.3328508, -2.168208, 0, 0, 0, 1, 1,
-1.501762, -0.3729744, -0.7301181, 0, 0, 0, 1, 1,
-1.498183, 0.1658792, -1.466487, 0, 0, 0, 1, 1,
-1.496924, 0.8266757, -0.7778078, 0, 0, 0, 1, 1,
-1.490933, -0.5998837, -2.796108, 0, 0, 0, 1, 1,
-1.490517, 1.779702, -0.8860772, 1, 1, 1, 1, 1,
-1.481348, -0.1398169, -0.8561896, 1, 1, 1, 1, 1,
-1.466729, 2.397321, -0.8145721, 1, 1, 1, 1, 1,
-1.466019, 1.014158, 1.328071, 1, 1, 1, 1, 1,
-1.44668, 0.5590096, -2.608271, 1, 1, 1, 1, 1,
-1.438951, 1.064779, -2.404265, 1, 1, 1, 1, 1,
-1.43394, -0.05803464, -0.6261333, 1, 1, 1, 1, 1,
-1.433425, 0.07998869, -0.173775, 1, 1, 1, 1, 1,
-1.408705, 1.329185, -1.715145, 1, 1, 1, 1, 1,
-1.395095, 2.441895, -0.2788514, 1, 1, 1, 1, 1,
-1.39299, 1.478, -1.535357, 1, 1, 1, 1, 1,
-1.387884, -0.1133066, -2.689611, 1, 1, 1, 1, 1,
-1.381358, 0.2440709, -2.735643, 1, 1, 1, 1, 1,
-1.375166, 0.3006314, -1.511234, 1, 1, 1, 1, 1,
-1.372941, 1.284967, -1.386973, 1, 1, 1, 1, 1,
-1.35573, -0.7319408, -4.132619, 0, 0, 1, 1, 1,
-1.354479, -0.1503789, -2.648381, 1, 0, 0, 1, 1,
-1.344796, 0.6460302, -1.642796, 1, 0, 0, 1, 1,
-1.339914, -0.03611005, -2.476275, 1, 0, 0, 1, 1,
-1.329957, -0.5389971, -1.784819, 1, 0, 0, 1, 1,
-1.32674, 0.7740864, -1.523267, 1, 0, 0, 1, 1,
-1.323902, -1.321388, -2.291948, 0, 0, 0, 1, 1,
-1.323007, -0.9492236, -2.343413, 0, 0, 0, 1, 1,
-1.321126, 0.3827389, -1.42157, 0, 0, 0, 1, 1,
-1.317232, 0.4892879, -1.200721, 0, 0, 0, 1, 1,
-1.311683, -1.144186, -1.466451, 0, 0, 0, 1, 1,
-1.303849, 0.559494, -0.3507483, 0, 0, 0, 1, 1,
-1.301027, -0.7942863, -2.475019, 0, 0, 0, 1, 1,
-1.300962, -1.66289, -3.431796, 1, 1, 1, 1, 1,
-1.286502, 0.1828521, -1.693479, 1, 1, 1, 1, 1,
-1.280268, -0.09710287, -0.7270156, 1, 1, 1, 1, 1,
-1.274115, 0.621889, -2.59121, 1, 1, 1, 1, 1,
-1.273781, 2.291315, -0.8995957, 1, 1, 1, 1, 1,
-1.272384, 0.5624205, -2.982561, 1, 1, 1, 1, 1,
-1.26357, 0.01629275, -2.775916, 1, 1, 1, 1, 1,
-1.25629, -1.261996, -2.124818, 1, 1, 1, 1, 1,
-1.254081, -1.313591, -2.767892, 1, 1, 1, 1, 1,
-1.248705, -0.3175937, -1.432809, 1, 1, 1, 1, 1,
-1.248269, 0.4885346, 0.2517843, 1, 1, 1, 1, 1,
-1.246781, 0.4038637, -1.542265, 1, 1, 1, 1, 1,
-1.22683, -0.9223534, -1.846664, 1, 1, 1, 1, 1,
-1.225754, -0.6305, -2.610219, 1, 1, 1, 1, 1,
-1.225292, 0.9969481, -0.9002011, 1, 1, 1, 1, 1,
-1.221583, -0.5150886, -3.112241, 0, 0, 1, 1, 1,
-1.220269, -0.1332854, -0.8543323, 1, 0, 0, 1, 1,
-1.200364, -0.4609044, -1.219035, 1, 0, 0, 1, 1,
-1.194995, 0.6572813, -1.28711, 1, 0, 0, 1, 1,
-1.193521, -0.7018918, -2.898092, 1, 0, 0, 1, 1,
-1.192223, 1.448704, -1.189704, 1, 0, 0, 1, 1,
-1.181618, 0.4723157, -1.03602, 0, 0, 0, 1, 1,
-1.177178, 1.185901, 0.5627594, 0, 0, 0, 1, 1,
-1.172569, -0.3083696, -2.894087, 0, 0, 0, 1, 1,
-1.164182, 1.279168, -0.6186319, 0, 0, 0, 1, 1,
-1.157934, -0.6419851, -2.839646, 0, 0, 0, 1, 1,
-1.157806, 0.1381269, -0.9089749, 0, 0, 0, 1, 1,
-1.145911, 1.64034, -0.9358004, 0, 0, 0, 1, 1,
-1.135043, -0.2849942, -1.678182, 1, 1, 1, 1, 1,
-1.13228, 0.9100009, -2.246756, 1, 1, 1, 1, 1,
-1.13188, 0.842505, -1.169104, 1, 1, 1, 1, 1,
-1.124343, 0.2429731, -3.183985, 1, 1, 1, 1, 1,
-1.120399, -1.956218, -2.890889, 1, 1, 1, 1, 1,
-1.114258, 0.5145453, -0.04197566, 1, 1, 1, 1, 1,
-1.107999, 1.339248, -0.1923919, 1, 1, 1, 1, 1,
-1.097535, 0.1593099, -1.006425, 1, 1, 1, 1, 1,
-1.097289, 1.460402, -1.134152, 1, 1, 1, 1, 1,
-1.089083, -0.7485288, -2.39917, 1, 1, 1, 1, 1,
-1.087273, -1.664894, -1.00212, 1, 1, 1, 1, 1,
-1.080946, -1.358864, -1.637884, 1, 1, 1, 1, 1,
-1.074929, -0.1353399, -2.687853, 1, 1, 1, 1, 1,
-1.067549, 0.3576297, -1.346092, 1, 1, 1, 1, 1,
-1.065891, -0.9689896, -4.090174, 1, 1, 1, 1, 1,
-1.061468, 0.6342824, -0.6722224, 0, 0, 1, 1, 1,
-1.05782, 1.458321, -0.1815778, 1, 0, 0, 1, 1,
-1.054294, -0.2286111, -1.319325, 1, 0, 0, 1, 1,
-1.051001, 0.3904449, 0.02379248, 1, 0, 0, 1, 1,
-1.049434, 0.609521, -1.529151, 1, 0, 0, 1, 1,
-1.048527, -2.091217, -4.435309, 1, 0, 0, 1, 1,
-1.048072, 0.8776936, -2.775158, 0, 0, 0, 1, 1,
-1.044474, -0.5153385, -1.992153, 0, 0, 0, 1, 1,
-1.043546, -0.6367472, -2.944112, 0, 0, 0, 1, 1,
-1.038646, -0.811897, -2.862093, 0, 0, 0, 1, 1,
-1.033448, 1.627308, -1.05476, 0, 0, 0, 1, 1,
-1.028045, -1.978938, -0.9833364, 0, 0, 0, 1, 1,
-1.026968, -0.8053238, -3.045769, 0, 0, 0, 1, 1,
-1.020812, -1.195442, -2.416356, 1, 1, 1, 1, 1,
-1.020741, 0.6881971, -0.7156756, 1, 1, 1, 1, 1,
-1.015331, 1.511957, -1.202391, 1, 1, 1, 1, 1,
-1.012949, 0.0287069, -2.254653, 1, 1, 1, 1, 1,
-1.01266, -0.3710307, -2.586203, 1, 1, 1, 1, 1,
-0.9970303, 0.5863352, 0.4704043, 1, 1, 1, 1, 1,
-0.9965727, 1.07356, -1.296677, 1, 1, 1, 1, 1,
-0.9920356, -1.308282, -2.416137, 1, 1, 1, 1, 1,
-0.9898335, 0.22684, -1.797218, 1, 1, 1, 1, 1,
-0.9878258, 1.279456, -0.5641255, 1, 1, 1, 1, 1,
-0.9805852, 0.4310592, -2.556889, 1, 1, 1, 1, 1,
-0.9794909, 1.516765, 0.2173987, 1, 1, 1, 1, 1,
-0.9784684, -0.3082605, -1.897757, 1, 1, 1, 1, 1,
-0.9677538, -0.5488579, -2.937731, 1, 1, 1, 1, 1,
-0.967082, 0.631109, -0.2980773, 1, 1, 1, 1, 1,
-0.9610189, -0.2349494, -2.984205, 0, 0, 1, 1, 1,
-0.9589238, 0.08170258, -1.890251, 1, 0, 0, 1, 1,
-0.9357081, -1.358637, -2.794723, 1, 0, 0, 1, 1,
-0.9319765, -2.087181, -1.827988, 1, 0, 0, 1, 1,
-0.9313825, -0.4903644, -0.9500806, 1, 0, 0, 1, 1,
-0.9264313, 0.6738168, -0.2328601, 1, 0, 0, 1, 1,
-0.9237962, -0.215995, -1.739347, 0, 0, 0, 1, 1,
-0.9219781, 1.226674, 0.2621178, 0, 0, 0, 1, 1,
-0.9189131, 0.01286878, -0.9562525, 0, 0, 0, 1, 1,
-0.9143687, -0.231648, -2.485179, 0, 0, 0, 1, 1,
-0.913746, -0.7169989, -1.192987, 0, 0, 0, 1, 1,
-0.9131663, -0.8266641, -2.141855, 0, 0, 0, 1, 1,
-0.9100122, 0.9174125, -0.254358, 0, 0, 0, 1, 1,
-0.907328, -0.06489402, -1.34389, 1, 1, 1, 1, 1,
-0.9062541, 1.302922, -0.2943442, 1, 1, 1, 1, 1,
-0.8976768, -0.2227269, -1.766631, 1, 1, 1, 1, 1,
-0.8918416, 0.9054847, -1.715547, 1, 1, 1, 1, 1,
-0.8897454, -0.4244263, -1.222167, 1, 1, 1, 1, 1,
-0.8883479, 0.4041623, -0.8386585, 1, 1, 1, 1, 1,
-0.8873844, 0.4643356, -1.039174, 1, 1, 1, 1, 1,
-0.8852364, -0.5499989, -1.969095, 1, 1, 1, 1, 1,
-0.8845766, 1.3661, -0.1559386, 1, 1, 1, 1, 1,
-0.8713132, 1.847826, 0.03366174, 1, 1, 1, 1, 1,
-0.8684558, 0.04219653, -2.111407, 1, 1, 1, 1, 1,
-0.8674078, -1.0625, -2.528736, 1, 1, 1, 1, 1,
-0.8667415, -1.292804, -3.406165, 1, 1, 1, 1, 1,
-0.8636187, -0.2388424, -3.493034, 1, 1, 1, 1, 1,
-0.8602451, -0.01045603, -0.04737975, 1, 1, 1, 1, 1,
-0.8587137, -0.01270901, -1.340793, 0, 0, 1, 1, 1,
-0.8571017, -0.3267792, -3.668852, 1, 0, 0, 1, 1,
-0.8569949, 2.518895, -1.801703, 1, 0, 0, 1, 1,
-0.854373, 0.2617521, -3.827474, 1, 0, 0, 1, 1,
-0.8482924, -0.2444875, -2.776822, 1, 0, 0, 1, 1,
-0.8435602, -0.5551867, -2.914013, 1, 0, 0, 1, 1,
-0.8424539, 0.3631217, -0.5588363, 0, 0, 0, 1, 1,
-0.8396225, -0.3631876, -0.9503939, 0, 0, 0, 1, 1,
-0.8355355, 0.08042075, -2.673589, 0, 0, 0, 1, 1,
-0.8295612, 0.2692488, -1.177892, 0, 0, 0, 1, 1,
-0.8231138, -0.3476541, -4.364999, 0, 0, 0, 1, 1,
-0.8193585, 0.5464664, -2.76098, 0, 0, 0, 1, 1,
-0.8126069, -1.676263, -4.306399, 0, 0, 0, 1, 1,
-0.807639, 0.06916137, -0.7317481, 1, 1, 1, 1, 1,
-0.8055952, 0.5677659, -0.9750088, 1, 1, 1, 1, 1,
-0.8043729, 0.2076528, -0.8782972, 1, 1, 1, 1, 1,
-0.7963452, 0.4609022, -0.0611047, 1, 1, 1, 1, 1,
-0.7952571, 0.7577396, -0.4169042, 1, 1, 1, 1, 1,
-0.7889304, 0.6677012, -1.04721, 1, 1, 1, 1, 1,
-0.7818022, -0.3125301, -1.207508, 1, 1, 1, 1, 1,
-0.77715, 1.431263, 0.5355055, 1, 1, 1, 1, 1,
-0.775531, 0.7213503, 0.03736497, 1, 1, 1, 1, 1,
-0.7716487, -0.4349128, -2.173265, 1, 1, 1, 1, 1,
-0.7634466, -0.5918339, -1.642536, 1, 1, 1, 1, 1,
-0.7599535, -0.9026237, -2.355708, 1, 1, 1, 1, 1,
-0.7564051, -0.2166355, -1.47577, 1, 1, 1, 1, 1,
-0.7555552, 0.8501084, 0.01346331, 1, 1, 1, 1, 1,
-0.7519688, -2.080442, -3.279362, 1, 1, 1, 1, 1,
-0.7478712, -0.2605135, -2.413267, 0, 0, 1, 1, 1,
-0.7354358, 0.3508734, 0.4877297, 1, 0, 0, 1, 1,
-0.733409, -1.214507, -1.260171, 1, 0, 0, 1, 1,
-0.7318359, -0.2773295, -1.931019, 1, 0, 0, 1, 1,
-0.7294922, 0.1770901, -1.12443, 1, 0, 0, 1, 1,
-0.7271484, -0.2383098, -2.583984, 1, 0, 0, 1, 1,
-0.7269591, -0.1079434, -2.516466, 0, 0, 0, 1, 1,
-0.7267529, 0.01268762, -1.595891, 0, 0, 0, 1, 1,
-0.7233177, -0.9572948, -2.638542, 0, 0, 0, 1, 1,
-0.7228703, 1.336581, 1.033607, 0, 0, 0, 1, 1,
-0.7219811, 0.4805957, -2.523235, 0, 0, 0, 1, 1,
-0.7212042, 0.2519702, -1.55382, 0, 0, 0, 1, 1,
-0.7198542, 1.365304, -0.7622269, 0, 0, 0, 1, 1,
-0.7180847, -0.1027267, -2.043234, 1, 1, 1, 1, 1,
-0.7169925, 0.639867, -1.067925, 1, 1, 1, 1, 1,
-0.7157584, -0.1523763, -1.988985, 1, 1, 1, 1, 1,
-0.7151577, 0.2229943, -1.264506, 1, 1, 1, 1, 1,
-0.7148024, 0.5749819, -0.2216446, 1, 1, 1, 1, 1,
-0.7144986, 0.1466074, -0.6524561, 1, 1, 1, 1, 1,
-0.7114467, 0.8798107, -0.2324538, 1, 1, 1, 1, 1,
-0.7097882, -0.1184488, -0.3289012, 1, 1, 1, 1, 1,
-0.7088981, 2.047308, -0.2615059, 1, 1, 1, 1, 1,
-0.7063898, 0.5186527, -2.626221, 1, 1, 1, 1, 1,
-0.7035869, -1.647022, -4.436319, 1, 1, 1, 1, 1,
-0.7002752, -0.6970407, -3.672158, 1, 1, 1, 1, 1,
-0.6869211, 0.2797219, -0.8483549, 1, 1, 1, 1, 1,
-0.6840078, 0.6432252, -1.490245, 1, 1, 1, 1, 1,
-0.6769214, 0.2503756, -0.5459622, 1, 1, 1, 1, 1,
-0.6743898, -0.5646396, -3.09242, 0, 0, 1, 1, 1,
-0.6732334, -0.07297248, -1.307355, 1, 0, 0, 1, 1,
-0.6694497, -0.5199056, -2.106958, 1, 0, 0, 1, 1,
-0.667922, -0.7702821, -1.717641, 1, 0, 0, 1, 1,
-0.6640583, 0.627201, -0.6270435, 1, 0, 0, 1, 1,
-0.6627511, 0.3375223, -1.937057, 1, 0, 0, 1, 1,
-0.6620646, -0.09948886, -0.9786581, 0, 0, 0, 1, 1,
-0.6546265, -0.5358952, -2.291754, 0, 0, 0, 1, 1,
-0.6533632, -1.328816, -1.332712, 0, 0, 0, 1, 1,
-0.6496097, 0.6568254, -1.603769, 0, 0, 0, 1, 1,
-0.64749, -0.4420566, -0.2439432, 0, 0, 0, 1, 1,
-0.6467323, 0.1219433, -2.175314, 0, 0, 0, 1, 1,
-0.6460261, -0.4583334, -3.799958, 0, 0, 0, 1, 1,
-0.6422716, -0.6939373, -2.242411, 1, 1, 1, 1, 1,
-0.6386145, -1.549037, -2.230035, 1, 1, 1, 1, 1,
-0.6366022, 0.03370851, -0.2177992, 1, 1, 1, 1, 1,
-0.6362845, 1.337075, -0.1172746, 1, 1, 1, 1, 1,
-0.634095, 1.039462, -0.6592982, 1, 1, 1, 1, 1,
-0.6232727, -1.408258, -4.467246, 1, 1, 1, 1, 1,
-0.621678, 3.095766, -0.6457548, 1, 1, 1, 1, 1,
-0.6206856, 0.9180998, -0.2383082, 1, 1, 1, 1, 1,
-0.6156817, -1.302474, -1.499097, 1, 1, 1, 1, 1,
-0.6130264, 0.3813077, -3.68671, 1, 1, 1, 1, 1,
-0.6106524, -0.6388749, -2.585168, 1, 1, 1, 1, 1,
-0.6082352, 1.160605, -0.832853, 1, 1, 1, 1, 1,
-0.6069732, 0.5433937, 0.07194337, 1, 1, 1, 1, 1,
-0.6019731, -1.450351, -2.273374, 1, 1, 1, 1, 1,
-0.5992935, -0.6334159, -3.64953, 1, 1, 1, 1, 1,
-0.5945685, -1.329366, -1.821859, 0, 0, 1, 1, 1,
-0.5906122, -0.8810085, -2.262826, 1, 0, 0, 1, 1,
-0.5905771, 0.3014479, -1.894899, 1, 0, 0, 1, 1,
-0.5905096, -0.6228852, -2.864777, 1, 0, 0, 1, 1,
-0.5901215, -1.29416, -2.611033, 1, 0, 0, 1, 1,
-0.5889804, -1.110441, -3.181498, 1, 0, 0, 1, 1,
-0.5869551, 1.852796, -1.230247, 0, 0, 0, 1, 1,
-0.5865465, -2.005582, -2.267024, 0, 0, 0, 1, 1,
-0.584401, -0.2157077, -1.771744, 0, 0, 0, 1, 1,
-0.5837664, 0.5791246, -0.6259528, 0, 0, 0, 1, 1,
-0.5813354, -0.298014, -4.145134, 0, 0, 0, 1, 1,
-0.5803665, -0.8703089, -3.096387, 0, 0, 0, 1, 1,
-0.5792179, -0.2497293, 0.7338089, 0, 0, 0, 1, 1,
-0.5774572, -0.8196327, -3.05555, 1, 1, 1, 1, 1,
-0.5724609, -1.058532, -1.990635, 1, 1, 1, 1, 1,
-0.5696713, -0.3645193, -2.635282, 1, 1, 1, 1, 1,
-0.5689033, -1.332876, -2.924294, 1, 1, 1, 1, 1,
-0.568004, -0.9764532, -2.109244, 1, 1, 1, 1, 1,
-0.5674828, 0.5026366, -3.095734, 1, 1, 1, 1, 1,
-0.5660447, 0.1427183, -2.069621, 1, 1, 1, 1, 1,
-0.5647646, -1.032382, -1.500202, 1, 1, 1, 1, 1,
-0.5611259, 0.5807208, -1.367433, 1, 1, 1, 1, 1,
-0.560065, 0.5863891, 0.5984376, 1, 1, 1, 1, 1,
-0.5565434, 0.1905371, -0.7884011, 1, 1, 1, 1, 1,
-0.5554562, -0.4855391, -2.452282, 1, 1, 1, 1, 1,
-0.5548371, -0.6379972, -1.779652, 1, 1, 1, 1, 1,
-0.5451086, 1.068936, 1.421839, 1, 1, 1, 1, 1,
-0.5449916, 1.94076, -1.976957, 1, 1, 1, 1, 1,
-0.5447327, 0.3545403, 0.5613468, 0, 0, 1, 1, 1,
-0.5441565, 0.04785698, -2.395565, 1, 0, 0, 1, 1,
-0.5388769, -1.005247, -2.953673, 1, 0, 0, 1, 1,
-0.5373412, -0.4238497, -2.542048, 1, 0, 0, 1, 1,
-0.5363325, -0.2090794, 0.548713, 1, 0, 0, 1, 1,
-0.5339168, 0.5428959, -0.5257974, 1, 0, 0, 1, 1,
-0.5336289, 1.480912, -0.1135568, 0, 0, 0, 1, 1,
-0.5293657, 0.5714044, -0.1821714, 0, 0, 0, 1, 1,
-0.5233923, 0.5536193, -1.002322, 0, 0, 0, 1, 1,
-0.5226841, 2.12419, -1.400661, 0, 0, 0, 1, 1,
-0.5217668, 0.485462, -0.4968513, 0, 0, 0, 1, 1,
-0.5159164, -0.3222703, -2.809841, 0, 0, 0, 1, 1,
-0.513324, 0.5123104, -1.241497, 0, 0, 0, 1, 1,
-0.5068425, -0.1028941, -1.455736, 1, 1, 1, 1, 1,
-0.4992873, 1.492638, 1.225337, 1, 1, 1, 1, 1,
-0.4989768, 0.4409175, 0.8195001, 1, 1, 1, 1, 1,
-0.487814, -0.4312408, -1.507964, 1, 1, 1, 1, 1,
-0.4862591, 0.5894489, -1.185726, 1, 1, 1, 1, 1,
-0.4830089, 1.764188, -0.8584849, 1, 1, 1, 1, 1,
-0.4825037, 1.090123, -1.234381, 1, 1, 1, 1, 1,
-0.4808308, 0.7894152, 0.8906738, 1, 1, 1, 1, 1,
-0.4791995, -1.178549, -1.967784, 1, 1, 1, 1, 1,
-0.4786849, 0.131163, -1.222501, 1, 1, 1, 1, 1,
-0.4781422, -0.2592863, -2.150328, 1, 1, 1, 1, 1,
-0.4773881, -0.3545851, -2.18214, 1, 1, 1, 1, 1,
-0.4641726, -1.206664, -3.379422, 1, 1, 1, 1, 1,
-0.462826, -0.4800763, -2.80539, 1, 1, 1, 1, 1,
-0.4586229, -0.03868196, -2.636528, 1, 1, 1, 1, 1,
-0.4492564, 0.02927515, -1.352234, 0, 0, 1, 1, 1,
-0.4481336, -0.6269335, -1.675806, 1, 0, 0, 1, 1,
-0.4476828, 0.1832634, -1.711354, 1, 0, 0, 1, 1,
-0.4456644, -2.26161, -1.294584, 1, 0, 0, 1, 1,
-0.4426305, -2.293139, -2.914527, 1, 0, 0, 1, 1,
-0.4404406, 0.138639, -3.460372, 1, 0, 0, 1, 1,
-0.4366818, 1.697551, -0.5165021, 0, 0, 0, 1, 1,
-0.4321451, -1.823122, -3.719132, 0, 0, 0, 1, 1,
-0.4308883, 0.6750949, 0.6023749, 0, 0, 0, 1, 1,
-0.4282818, -2.126093, -4.088664, 0, 0, 0, 1, 1,
-0.4275457, 0.01004494, -1.960609, 0, 0, 0, 1, 1,
-0.4269555, -0.1239812, -1.764293, 0, 0, 0, 1, 1,
-0.4247301, 0.1947471, -3.443794, 0, 0, 0, 1, 1,
-0.4246527, 0.29839, -2.869598, 1, 1, 1, 1, 1,
-0.4205446, 2.276334, 1.063853, 1, 1, 1, 1, 1,
-0.4204326, 0.5504272, -0.1738055, 1, 1, 1, 1, 1,
-0.4153929, 0.6156538, 0.9656433, 1, 1, 1, 1, 1,
-0.41273, 1.227777, -0.5779162, 1, 1, 1, 1, 1,
-0.4089259, -0.8628643, -2.969001, 1, 1, 1, 1, 1,
-0.4062978, -0.3857988, -2.3964, 1, 1, 1, 1, 1,
-0.4041592, -1.980154, -1.95641, 1, 1, 1, 1, 1,
-0.4034742, -0.5282809, -2.980819, 1, 1, 1, 1, 1,
-0.3982912, -1.053208, -1.138378, 1, 1, 1, 1, 1,
-0.3962362, 0.6375915, -1.226972, 1, 1, 1, 1, 1,
-0.388894, -0.4821701, -2.667461, 1, 1, 1, 1, 1,
-0.3876733, -0.8127378, -2.49966, 1, 1, 1, 1, 1,
-0.3842703, -0.2579384, -2.087977, 1, 1, 1, 1, 1,
-0.3840671, -2.148788, -2.963776, 1, 1, 1, 1, 1,
-0.3821576, -1.152462, -3.292719, 0, 0, 1, 1, 1,
-0.3815338, -0.01031436, -2.275022, 1, 0, 0, 1, 1,
-0.3786921, -0.04899838, -1.926692, 1, 0, 0, 1, 1,
-0.377701, -1.027962, -2.10652, 1, 0, 0, 1, 1,
-0.3762468, 0.4776941, -0.3556152, 1, 0, 0, 1, 1,
-0.3753402, 1.670683, -0.2354129, 1, 0, 0, 1, 1,
-0.3687785, 1.148203, 2.176913, 0, 0, 0, 1, 1,
-0.3674386, -1.314632, -2.254947, 0, 0, 0, 1, 1,
-0.366943, -0.3343615, -3.006124, 0, 0, 0, 1, 1,
-0.3575751, -1.872546, -2.468319, 0, 0, 0, 1, 1,
-0.3564208, 0.1363772, -1.764497, 0, 0, 0, 1, 1,
-0.3521185, -0.2655179, -3.385458, 0, 0, 0, 1, 1,
-0.3516491, 1.58905, -0.7571119, 0, 0, 0, 1, 1,
-0.3501131, -0.1442998, -1.300565, 1, 1, 1, 1, 1,
-0.3495816, -0.03683679, -0.7131925, 1, 1, 1, 1, 1,
-0.3342554, -0.205262, -1.782692, 1, 1, 1, 1, 1,
-0.3326958, 0.09056759, -2.10878, 1, 1, 1, 1, 1,
-0.3314245, -2.052736, -3.024937, 1, 1, 1, 1, 1,
-0.330914, -0.8681703, -2.050049, 1, 1, 1, 1, 1,
-0.3302698, 2.464727, 0.412942, 1, 1, 1, 1, 1,
-0.3244549, 0.8181704, 0.8642843, 1, 1, 1, 1, 1,
-0.3232563, -0.4432582, -2.547626, 1, 1, 1, 1, 1,
-0.3226939, -1.364921, -3.308078, 1, 1, 1, 1, 1,
-0.3212186, 1.99395, -0.3683962, 1, 1, 1, 1, 1,
-0.3191102, 0.8223854, -0.3402432, 1, 1, 1, 1, 1,
-0.3164113, -0.8482096, -1.673844, 1, 1, 1, 1, 1,
-0.3147896, -0.1662587, -1.387961, 1, 1, 1, 1, 1,
-0.3131908, 1.175794, -0.9093612, 1, 1, 1, 1, 1,
-0.3122818, 0.06641869, -0.7456837, 0, 0, 1, 1, 1,
-0.2920845, -0.4472591, -2.07919, 1, 0, 0, 1, 1,
-0.2904248, -1.399297, -4.262552, 1, 0, 0, 1, 1,
-0.2873043, -1.038632, -5.725542, 1, 0, 0, 1, 1,
-0.286836, 1.156959, -2.3662, 1, 0, 0, 1, 1,
-0.2850163, -1.582806, -3.844979, 1, 0, 0, 1, 1,
-0.2849967, -0.7345653, -2.603038, 0, 0, 0, 1, 1,
-0.2823889, 0.5569687, 0.8105425, 0, 0, 0, 1, 1,
-0.2756054, 1.996198, -1.095335, 0, 0, 0, 1, 1,
-0.2750806, -0.01699381, -2.840318, 0, 0, 0, 1, 1,
-0.2741406, -0.1610691, -1.637592, 0, 0, 0, 1, 1,
-0.2733164, -1.577889, -3.870683, 0, 0, 0, 1, 1,
-0.270256, 0.2333542, -1.275591, 0, 0, 0, 1, 1,
-0.2619641, 1.053303, 2.134903, 1, 1, 1, 1, 1,
-0.258839, 0.2695359, -2.46197, 1, 1, 1, 1, 1,
-0.2578603, 0.1242345, -1.425215, 1, 1, 1, 1, 1,
-0.2498776, -0.8094774, -4.66993, 1, 1, 1, 1, 1,
-0.2488797, 0.7967361, -0.3474762, 1, 1, 1, 1, 1,
-0.2442857, 0.09930554, -0.6739385, 1, 1, 1, 1, 1,
-0.2424019, 1.059987, 0.1714141, 1, 1, 1, 1, 1,
-0.2408408, 1.349607, -0.9492968, 1, 1, 1, 1, 1,
-0.2370477, 0.5457904, -0.6910291, 1, 1, 1, 1, 1,
-0.2350772, -1.060574, -2.666611, 1, 1, 1, 1, 1,
-0.229879, -1.461438, -3.558145, 1, 1, 1, 1, 1,
-0.2249731, -0.3090172, -0.7622286, 1, 1, 1, 1, 1,
-0.2225885, 1.538262, 0.1493566, 1, 1, 1, 1, 1,
-0.2145384, -0.9543521, -3.036146, 1, 1, 1, 1, 1,
-0.2118842, -0.2915241, -1.880131, 1, 1, 1, 1, 1,
-0.211446, -0.8334032, -3.459162, 0, 0, 1, 1, 1,
-0.2109703, -0.4535256, -1.815946, 1, 0, 0, 1, 1,
-0.2075335, 0.7154455, -0.4231856, 1, 0, 0, 1, 1,
-0.2049723, 0.6765857, -1.101842, 1, 0, 0, 1, 1,
-0.2001758, 1.325781, 0.1142031, 1, 0, 0, 1, 1,
-0.1994736, -1.819971, -1.267554, 1, 0, 0, 1, 1,
-0.1994011, 0.6372325, -2.43476, 0, 0, 0, 1, 1,
-0.1984064, -0.1777275, -1.664834, 0, 0, 0, 1, 1,
-0.1942833, -1.394958, -3.277874, 0, 0, 0, 1, 1,
-0.1935371, 0.2377423, -1.281893, 0, 0, 0, 1, 1,
-0.1933975, -0.001667652, -0.2844096, 0, 0, 0, 1, 1,
-0.1929873, -0.619946, -2.936325, 0, 0, 0, 1, 1,
-0.192803, -2.334911, -4.342126, 0, 0, 0, 1, 1,
-0.1926242, -1.367495, -3.166372, 1, 1, 1, 1, 1,
-0.1908531, -1.695606, -1.297313, 1, 1, 1, 1, 1,
-0.1863351, -0.9423779, -3.479087, 1, 1, 1, 1, 1,
-0.1817214, 0.0223122, -0.5833793, 1, 1, 1, 1, 1,
-0.1800221, 1.187455, 0.7470955, 1, 1, 1, 1, 1,
-0.1756141, 0.81293, -0.673853, 1, 1, 1, 1, 1,
-0.1689778, -1.904034, -5.503523, 1, 1, 1, 1, 1,
-0.1682361, -0.3982188, -1.594245, 1, 1, 1, 1, 1,
-0.1648104, 0.3296878, -0.4476448, 1, 1, 1, 1, 1,
-0.1638029, -0.05097708, -1.460395, 1, 1, 1, 1, 1,
-0.1629815, 1.026788, 0.7638754, 1, 1, 1, 1, 1,
-0.1547841, 1.012607, 0.565276, 1, 1, 1, 1, 1,
-0.1535164, 0.3320202, -0.9943175, 1, 1, 1, 1, 1,
-0.1490317, 0.173649, 0.6611107, 1, 1, 1, 1, 1,
-0.1485726, -0.5222048, -3.706075, 1, 1, 1, 1, 1,
-0.1453976, 1.067298, 0.3952246, 0, 0, 1, 1, 1,
-0.1438998, -0.183031, -2.606969, 1, 0, 0, 1, 1,
-0.1322166, 0.293108, -0.4812324, 1, 0, 0, 1, 1,
-0.1312915, 1.48482, 0.6385374, 1, 0, 0, 1, 1,
-0.1272937, 0.3215122, -0.6986675, 1, 0, 0, 1, 1,
-0.1249934, -0.1875433, -3.127293, 1, 0, 0, 1, 1,
-0.1240916, -0.4979397, -4.027526, 0, 0, 0, 1, 1,
-0.123135, -0.1407473, -0.7584953, 0, 0, 0, 1, 1,
-0.1214157, -0.8322704, -3.813928, 0, 0, 0, 1, 1,
-0.1193195, 0.7569354, -0.988965, 0, 0, 0, 1, 1,
-0.1145388, 0.6409289, -1.564869, 0, 0, 0, 1, 1,
-0.1129905, 0.1234483, -0.5431746, 0, 0, 0, 1, 1,
-0.1105438, -0.1969451, -2.634825, 0, 0, 0, 1, 1,
-0.1093078, -2.459275, -1.962438, 1, 1, 1, 1, 1,
-0.1091115, 0.9219118, -0.5192494, 1, 1, 1, 1, 1,
-0.1044395, 0.2473285, -0.1536399, 1, 1, 1, 1, 1,
-0.1025637, 0.9608352, -0.6543829, 1, 1, 1, 1, 1,
-0.1021226, -0.01892872, -2.503033, 1, 1, 1, 1, 1,
-0.1007396, 0.5795606, -0.02762928, 1, 1, 1, 1, 1,
-0.09731936, 0.7570335, -0.3941872, 1, 1, 1, 1, 1,
-0.09568918, 0.0283134, -1.134018, 1, 1, 1, 1, 1,
-0.09467313, 0.3708036, 0.1136789, 1, 1, 1, 1, 1,
-0.09239162, 0.06906266, -2.463176, 1, 1, 1, 1, 1,
-0.09214882, 0.375626, -0.6518762, 1, 1, 1, 1, 1,
-0.0920217, -1.101853, -1.846334, 1, 1, 1, 1, 1,
-0.08819978, 0.1298631, 0.09005401, 1, 1, 1, 1, 1,
-0.08583128, 0.8559886, 0.03652095, 1, 1, 1, 1, 1,
-0.08338979, 1.105358, -0.4720168, 1, 1, 1, 1, 1,
-0.08193706, -2.01343, -4.369241, 0, 0, 1, 1, 1,
-0.08124442, 0.331568, -0.09870127, 1, 0, 0, 1, 1,
-0.07622174, 0.03864301, -2.610057, 1, 0, 0, 1, 1,
-0.07529184, 0.9481111, 0.1847448, 1, 0, 0, 1, 1,
-0.07528348, -0.6763184, -3.768595, 1, 0, 0, 1, 1,
-0.06967488, -0.5023628, -3.130476, 1, 0, 0, 1, 1,
-0.06435847, 1.379016, 0.6575911, 0, 0, 0, 1, 1,
-0.05519402, 1.837866, 0.4476888, 0, 0, 0, 1, 1,
-0.05500079, 0.6092548, -1.162862, 0, 0, 0, 1, 1,
-0.05353802, 0.09440055, -0.8873252, 0, 0, 0, 1, 1,
-0.05327334, -1.195827, -1.452359, 0, 0, 0, 1, 1,
-0.05165591, -0.7094771, -4.109355, 0, 0, 0, 1, 1,
-0.05161486, -0.102327, -3.495413, 0, 0, 0, 1, 1,
-0.05084828, 0.3840248, 0.7901141, 1, 1, 1, 1, 1,
-0.04871635, 0.6250825, 1.884727, 1, 1, 1, 1, 1,
-0.04806206, 1.528056, -0.1869235, 1, 1, 1, 1, 1,
-0.04743025, 0.4510487, -1.975818, 1, 1, 1, 1, 1,
-0.04591634, 0.4054641, -0.7332244, 1, 1, 1, 1, 1,
-0.04457192, -0.4605083, -3.368393, 1, 1, 1, 1, 1,
-0.04202668, -0.5693556, -3.246193, 1, 1, 1, 1, 1,
-0.04188427, 0.8417454, -1.46606, 1, 1, 1, 1, 1,
-0.03733783, 0.655709, 0.006681108, 1, 1, 1, 1, 1,
-0.03571465, 0.08239207, -0.4070338, 1, 1, 1, 1, 1,
-0.03018057, -0.3927411, -4.211518, 1, 1, 1, 1, 1,
-0.02916532, 0.9707596, -0.2973584, 1, 1, 1, 1, 1,
-0.02704626, 0.03357768, -0.6385015, 1, 1, 1, 1, 1,
-0.02300715, 1.874715, 1.098723, 1, 1, 1, 1, 1,
-0.02070681, -0.450086, -2.447123, 1, 1, 1, 1, 1,
-0.02009756, -1.771226, -3.202874, 0, 0, 1, 1, 1,
-0.01992703, -0.8143101, -3.943472, 1, 0, 0, 1, 1,
-0.01753499, -1.691668, -3.354488, 1, 0, 0, 1, 1,
-0.0174935, -0.9005579, -2.737605, 1, 0, 0, 1, 1,
-0.01626667, -0.08659378, -2.636926, 1, 0, 0, 1, 1,
-0.01607953, -0.2240562, -3.446937, 1, 0, 0, 1, 1,
-0.01501906, -1.264977, -2.092512, 0, 0, 0, 1, 1,
-0.01108973, -0.3618912, -1.77819, 0, 0, 0, 1, 1,
-0.008568281, 1.514952, 0.8235525, 0, 0, 0, 1, 1,
-0.007503096, 0.7699981, 0.8371773, 0, 0, 0, 1, 1,
-0.001716372, 1.329242, -0.5363891, 0, 0, 0, 1, 1,
0.0004543039, -0.3202041, 2.538982, 0, 0, 0, 1, 1,
0.002623799, -0.5326795, 1.117538, 0, 0, 0, 1, 1,
0.00825489, 0.4930582, -0.4910535, 1, 1, 1, 1, 1,
0.009368114, -1.554741, 3.100372, 1, 1, 1, 1, 1,
0.01467637, 1.169096, -0.5594258, 1, 1, 1, 1, 1,
0.02042754, 0.09547841, 1.138816, 1, 1, 1, 1, 1,
0.02532407, 0.8803471, 1.208289, 1, 1, 1, 1, 1,
0.02628112, -1.727757, 3.175731, 1, 1, 1, 1, 1,
0.02927178, 0.03721491, 2.430974, 1, 1, 1, 1, 1,
0.03092361, 0.449119, -0.1461347, 1, 1, 1, 1, 1,
0.03660057, 1.230271, 0.1844771, 1, 1, 1, 1, 1,
0.03915147, 0.4448155, 0.4078319, 1, 1, 1, 1, 1,
0.04346385, -0.4501599, 3.369393, 1, 1, 1, 1, 1,
0.04471224, 0.7206453, 1.050313, 1, 1, 1, 1, 1,
0.0453511, 0.1666201, 1.590269, 1, 1, 1, 1, 1,
0.04552754, -0.533819, 3.294401, 1, 1, 1, 1, 1,
0.04983421, 1.332948, 0.1955184, 1, 1, 1, 1, 1,
0.05040364, -0.1365344, 0.7292729, 0, 0, 1, 1, 1,
0.05419191, 1.424539, -0.3429331, 1, 0, 0, 1, 1,
0.0581438, -0.7932026, 1.683644, 1, 0, 0, 1, 1,
0.05827686, -0.2455594, 2.447247, 1, 0, 0, 1, 1,
0.05908729, -0.6558301, 2.180192, 1, 0, 0, 1, 1,
0.06143166, -1.968066, 2.789014, 1, 0, 0, 1, 1,
0.06323218, 0.5368394, 0.3166806, 0, 0, 0, 1, 1,
0.06391516, -0.64723, 2.029609, 0, 0, 0, 1, 1,
0.06465448, -0.006067944, -0.4157761, 0, 0, 0, 1, 1,
0.0661239, -0.6183394, 3.897099, 0, 0, 0, 1, 1,
0.06752735, 0.1834113, 1.329228, 0, 0, 0, 1, 1,
0.07570565, -1.67254, 5.281488, 0, 0, 0, 1, 1,
0.07859062, -0.2210376, 2.837334, 0, 0, 0, 1, 1,
0.08000755, 0.395585, 1.480397, 1, 1, 1, 1, 1,
0.08222361, 0.9063476, -2.018976, 1, 1, 1, 1, 1,
0.08525293, -0.9442193, 1.815728, 1, 1, 1, 1, 1,
0.08551742, 0.1379439, -0.9620148, 1, 1, 1, 1, 1,
0.0861459, 1.8372, 0.2341995, 1, 1, 1, 1, 1,
0.08645988, 0.5954351, 0.1888884, 1, 1, 1, 1, 1,
0.08776543, 0.9486371, -0.4455814, 1, 1, 1, 1, 1,
0.0879495, 0.55558, 0.4308735, 1, 1, 1, 1, 1,
0.08851428, -0.4381754, 1.352804, 1, 1, 1, 1, 1,
0.08886981, -0.5824143, 3.919126, 1, 1, 1, 1, 1,
0.09428778, -0.06381481, 1.319803, 1, 1, 1, 1, 1,
0.09507867, 0.4552988, -0.1325863, 1, 1, 1, 1, 1,
0.09528748, 2.267243, -0.7781612, 1, 1, 1, 1, 1,
0.09788696, -0.5240515, 2.863926, 1, 1, 1, 1, 1,
0.1023452, 0.6769072, -0.5657207, 1, 1, 1, 1, 1,
0.1027504, -1.348823, 3.424655, 0, 0, 1, 1, 1,
0.1041678, -0.8308721, 2.7277, 1, 0, 0, 1, 1,
0.1062081, -1.189925, 1.622468, 1, 0, 0, 1, 1,
0.1098811, 0.4568207, 0.4057359, 1, 0, 0, 1, 1,
0.1106998, 0.7616976, -0.2367191, 1, 0, 0, 1, 1,
0.1121954, 0.1269926, -0.8445249, 1, 0, 0, 1, 1,
0.1131645, -0.9247259, 2.206613, 0, 0, 0, 1, 1,
0.1137477, 1.969694, 0.6463592, 0, 0, 0, 1, 1,
0.1150326, 0.05619935, 0.9244087, 0, 0, 0, 1, 1,
0.1180746, 0.3367107, -0.05210537, 0, 0, 0, 1, 1,
0.1186255, 0.588979, 0.1834396, 0, 0, 0, 1, 1,
0.1205454, 1.628656, -0.3109624, 0, 0, 0, 1, 1,
0.1208745, 1.510574, 0.1333438, 0, 0, 0, 1, 1,
0.1214938, -0.5615962, 3.664493, 1, 1, 1, 1, 1,
0.1231278, 0.6759558, 1.55767, 1, 1, 1, 1, 1,
0.1261986, -0.3267058, 2.622803, 1, 1, 1, 1, 1,
0.1267369, -1.005078, 2.853693, 1, 1, 1, 1, 1,
0.1288899, 0.3906287, -1.372118, 1, 1, 1, 1, 1,
0.1295381, -0.1727549, 2.756465, 1, 1, 1, 1, 1,
0.1298177, -0.2826414, 1.921857, 1, 1, 1, 1, 1,
0.1339217, -0.2786453, 2.256559, 1, 1, 1, 1, 1,
0.1403522, 0.2133747, -0.06434492, 1, 1, 1, 1, 1,
0.1404776, -0.5643468, 3.397653, 1, 1, 1, 1, 1,
0.1439681, -0.4824529, 4.043857, 1, 1, 1, 1, 1,
0.1444227, 0.8930357, 1.236634, 1, 1, 1, 1, 1,
0.1445456, 0.3171959, 0.7576386, 1, 1, 1, 1, 1,
0.1463793, 0.173108, 1.353972, 1, 1, 1, 1, 1,
0.1464895, 0.5717391, 0.8723406, 1, 1, 1, 1, 1,
0.1507987, -0.7071346, 1.833831, 0, 0, 1, 1, 1,
0.1511958, 1.818154, -0.7794911, 1, 0, 0, 1, 1,
0.1587093, -0.3692034, 4.354675, 1, 0, 0, 1, 1,
0.1606948, 1.017291, 0.401842, 1, 0, 0, 1, 1,
0.1620083, -1.917619, 3.201143, 1, 0, 0, 1, 1,
0.163317, -0.2083005, 4.102909, 1, 0, 0, 1, 1,
0.1633762, -0.7356001, 1.58801, 0, 0, 0, 1, 1,
0.1659617, 1.128291, 0.08712715, 0, 0, 0, 1, 1,
0.166514, 0.2742837, 0.3383383, 0, 0, 0, 1, 1,
0.1666132, 1.295455, -0.2828593, 0, 0, 0, 1, 1,
0.1672691, 1.221529, 0.4272355, 0, 0, 0, 1, 1,
0.1676549, -1.012572, 3.487127, 0, 0, 0, 1, 1,
0.1697566, -0.5683197, 3.154701, 0, 0, 0, 1, 1,
0.1716797, 0.02520183, 1.408538, 1, 1, 1, 1, 1,
0.172535, 0.08560161, 1.979293, 1, 1, 1, 1, 1,
0.1848612, 0.6477936, 0.1937508, 1, 1, 1, 1, 1,
0.1853287, -0.1834164, 1.243661, 1, 1, 1, 1, 1,
0.1893218, -1.057615, 3.073222, 1, 1, 1, 1, 1,
0.1911492, -1.040464, 3.648945, 1, 1, 1, 1, 1,
0.1988777, 1.32087, 0.6874477, 1, 1, 1, 1, 1,
0.2020233, 0.6845511, 0.4498334, 1, 1, 1, 1, 1,
0.2056963, 0.8755308, 2.340203, 1, 1, 1, 1, 1,
0.2064391, -1.470401, 2.553377, 1, 1, 1, 1, 1,
0.2069541, -1.419278, 1.514566, 1, 1, 1, 1, 1,
0.208367, -0.6539314, 3.649764, 1, 1, 1, 1, 1,
0.2125656, -0.2960955, 2.832964, 1, 1, 1, 1, 1,
0.2135908, 1.214575, -0.4673007, 1, 1, 1, 1, 1,
0.2185288, 0.6824138, -0.6969143, 1, 1, 1, 1, 1,
0.2211315, 0.1040011, 2.566186, 0, 0, 1, 1, 1,
0.2246951, 2.462051, 0.7525353, 1, 0, 0, 1, 1,
0.2336153, -0.4757115, 2.929932, 1, 0, 0, 1, 1,
0.2344984, 1.929009, -1.134491, 1, 0, 0, 1, 1,
0.2361211, -1.562164, 4.361378, 1, 0, 0, 1, 1,
0.2398719, -0.1654838, 0.033446, 1, 0, 0, 1, 1,
0.2434592, -0.9679258, 3.728327, 0, 0, 0, 1, 1,
0.2487433, -0.9560058, 2.777149, 0, 0, 0, 1, 1,
0.2514431, 0.1064576, 0.5202712, 0, 0, 0, 1, 1,
0.2544378, 1.133191, -0.4310497, 0, 0, 0, 1, 1,
0.2565853, -0.5082957, 0.5354546, 0, 0, 0, 1, 1,
0.2604264, 0.3354954, 1.780688, 0, 0, 0, 1, 1,
0.2685503, -0.9352037, 3.114673, 0, 0, 0, 1, 1,
0.2718847, -2.169317, 2.406432, 1, 1, 1, 1, 1,
0.2734941, 0.5813453, -0.6876509, 1, 1, 1, 1, 1,
0.2785779, -0.1385173, 1.397651, 1, 1, 1, 1, 1,
0.2791156, 0.5242906, 0.6949708, 1, 1, 1, 1, 1,
0.2828349, 0.006499461, 0.790813, 1, 1, 1, 1, 1,
0.2858065, -1.028038, 2.775105, 1, 1, 1, 1, 1,
0.2882261, -1.330387, 4.27037, 1, 1, 1, 1, 1,
0.3012465, 0.7195292, 0.1904355, 1, 1, 1, 1, 1,
0.3019279, -2.935282, 3.989298, 1, 1, 1, 1, 1,
0.3062105, -1.036248, 1.849686, 1, 1, 1, 1, 1,
0.3110093, -0.6867607, 1.102018, 1, 1, 1, 1, 1,
0.3113297, 1.516595, 1.152658, 1, 1, 1, 1, 1,
0.3122746, 1.487638, -0.08154508, 1, 1, 1, 1, 1,
0.3146023, 0.6450522, -0.3129492, 1, 1, 1, 1, 1,
0.3156402, 0.4633044, 1.9325, 1, 1, 1, 1, 1,
0.3173828, 0.2101155, 0.6814832, 0, 0, 1, 1, 1,
0.3201471, -0.3613395, 2.385034, 1, 0, 0, 1, 1,
0.3202353, 0.2164954, -1.249255, 1, 0, 0, 1, 1,
0.3204518, 0.9819757, -0.7213544, 1, 0, 0, 1, 1,
0.3248372, -0.5540366, 3.7102, 1, 0, 0, 1, 1,
0.3295735, 0.1285352, 2.211106, 1, 0, 0, 1, 1,
0.3317853, -1.235305, 2.133518, 0, 0, 0, 1, 1,
0.3360845, 0.3415134, -0.4226559, 0, 0, 0, 1, 1,
0.3424579, 0.1229444, 0.8384703, 0, 0, 0, 1, 1,
0.3426302, -0.9519767, 1.501937, 0, 0, 0, 1, 1,
0.3464842, 0.8068923, -0.9742749, 0, 0, 0, 1, 1,
0.3520209, 0.0861314, -0.5182261, 0, 0, 0, 1, 1,
0.3521043, -1.212273, 1.924263, 0, 0, 0, 1, 1,
0.3522539, -0.006314332, 1.410535, 1, 1, 1, 1, 1,
0.3543572, -0.531505, 0.8405514, 1, 1, 1, 1, 1,
0.354584, 0.4239946, 1.577293, 1, 1, 1, 1, 1,
0.356155, -0.04607951, 1.634165, 1, 1, 1, 1, 1,
0.3602544, -0.5656816, 0.6518006, 1, 1, 1, 1, 1,
0.362011, 0.7068115, -0.03300276, 1, 1, 1, 1, 1,
0.3622606, -0.1216454, 1.650158, 1, 1, 1, 1, 1,
0.3680395, 0.9402378, -1.733953, 1, 1, 1, 1, 1,
0.3697327, -0.9008086, 2.409623, 1, 1, 1, 1, 1,
0.3744605, 1.412736, 1.511142, 1, 1, 1, 1, 1,
0.3800804, -0.3009316, 3.259101, 1, 1, 1, 1, 1,
0.3812912, 0.1770785, 1.145745, 1, 1, 1, 1, 1,
0.3836928, 0.9306438, 2.30914, 1, 1, 1, 1, 1,
0.3856861, -2.079571, 2.980731, 1, 1, 1, 1, 1,
0.3911859, 0.1882866, 0.4848515, 1, 1, 1, 1, 1,
0.391831, -0.5132726, 1.500476, 0, 0, 1, 1, 1,
0.3927269, -0.6175073, 2.498829, 1, 0, 0, 1, 1,
0.3938438, 1.663484, 0.9007284, 1, 0, 0, 1, 1,
0.3956197, -0.6868215, 2.556746, 1, 0, 0, 1, 1,
0.4020808, -1.462143, 4.49596, 1, 0, 0, 1, 1,
0.4023621, -0.4678747, 1.506046, 1, 0, 0, 1, 1,
0.4035348, -0.7078348, 2.531369, 0, 0, 0, 1, 1,
0.4070458, 0.9672809, -2.468454, 0, 0, 0, 1, 1,
0.4080231, 0.2509974, 1.366452, 0, 0, 0, 1, 1,
0.4098648, -0.9082742, 2.522762, 0, 0, 0, 1, 1,
0.4134392, -1.819866, 3.291423, 0, 0, 0, 1, 1,
0.4135542, -0.9827022, 3.066088, 0, 0, 0, 1, 1,
0.4204265, 0.5608277, 1.655481, 0, 0, 0, 1, 1,
0.4220431, -0.9308739, 2.967063, 1, 1, 1, 1, 1,
0.4243429, 2.034654, -0.1044857, 1, 1, 1, 1, 1,
0.4258597, -0.3085001, 1.34969, 1, 1, 1, 1, 1,
0.4270493, -2.246735, 2.312644, 1, 1, 1, 1, 1,
0.4277693, -0.4102405, 2.498213, 1, 1, 1, 1, 1,
0.4291121, 0.5137351, 0.156716, 1, 1, 1, 1, 1,
0.4362743, 1.72315, 1.301755, 1, 1, 1, 1, 1,
0.4393797, -0.640216, 1.076244, 1, 1, 1, 1, 1,
0.4576649, 0.01482716, 1.523156, 1, 1, 1, 1, 1,
0.465656, -2.72068, 2.35529, 1, 1, 1, 1, 1,
0.4768077, 0.1863333, 0.7711476, 1, 1, 1, 1, 1,
0.4782733, 1.759137, 2.093877, 1, 1, 1, 1, 1,
0.4829302, -1.290121, 2.773474, 1, 1, 1, 1, 1,
0.4834955, -0.06620043, 2.305933, 1, 1, 1, 1, 1,
0.4843756, -0.5535684, 0.7995853, 1, 1, 1, 1, 1,
0.4859036, -0.2578573, 0.9884158, 0, 0, 1, 1, 1,
0.487629, 0.05358433, 0.7511187, 1, 0, 0, 1, 1,
0.4884521, 0.5497586, 2.147408, 1, 0, 0, 1, 1,
0.4907266, 0.303708, 1.051975, 1, 0, 0, 1, 1,
0.4943603, -0.9093648, 2.830647, 1, 0, 0, 1, 1,
0.5049057, -0.4778609, 1.262176, 1, 0, 0, 1, 1,
0.5135415, 1.458408, 0.5032247, 0, 0, 0, 1, 1,
0.5185984, 0.6785793, 1.795005, 0, 0, 0, 1, 1,
0.518803, -0.1612784, 0.9791944, 0, 0, 0, 1, 1,
0.5199136, -0.1320122, 4.513182, 0, 0, 0, 1, 1,
0.5253552, 0.3731945, 0.4693617, 0, 0, 0, 1, 1,
0.5262669, 0.807591, 0.9337969, 0, 0, 0, 1, 1,
0.528369, -0.1769394, 1.725856, 0, 0, 0, 1, 1,
0.5303361, -0.8066403, 2.056277, 1, 1, 1, 1, 1,
0.5304469, 0.04243679, 1.695172, 1, 1, 1, 1, 1,
0.5307815, -0.9665512, 2.40944, 1, 1, 1, 1, 1,
0.5422058, -0.3876743, 3.583951, 1, 1, 1, 1, 1,
0.5431926, 0.4828778, 1.168697, 1, 1, 1, 1, 1,
0.545198, 0.3959493, -0.1887395, 1, 1, 1, 1, 1,
0.5479332, -0.2259826, 1.753636, 1, 1, 1, 1, 1,
0.5511562, 1.492072, 0.2582671, 1, 1, 1, 1, 1,
0.5537328, 2.283194, -1.898267, 1, 1, 1, 1, 1,
0.5598441, -0.06978133, 0.6569135, 1, 1, 1, 1, 1,
0.5608617, -0.8008971, 3.62126, 1, 1, 1, 1, 1,
0.5624294, 1.038971, -0.09615332, 1, 1, 1, 1, 1,
0.5625235, -0.8601644, 3.39668, 1, 1, 1, 1, 1,
0.5696595, -0.1629345, 1.588, 1, 1, 1, 1, 1,
0.5705919, 2.262364, 0.8137898, 1, 1, 1, 1, 1,
0.5721173, -0.1985952, 2.747291, 0, 0, 1, 1, 1,
0.5759301, -0.6380908, 2.753218, 1, 0, 0, 1, 1,
0.5764534, -0.27944, 0.2739677, 1, 0, 0, 1, 1,
0.5790711, 0.7671924, 0.3722331, 1, 0, 0, 1, 1,
0.5835825, 0.1289675, -0.8154603, 1, 0, 0, 1, 1,
0.590854, 0.484333, 0.8295178, 1, 0, 0, 1, 1,
0.6019515, 0.1398894, 1.942968, 0, 0, 0, 1, 1,
0.6056438, -0.1519219, 0.6029974, 0, 0, 0, 1, 1,
0.6085833, -0.2749657, 1.251972, 0, 0, 0, 1, 1,
0.6131416, -1.606706, 2.444291, 0, 0, 0, 1, 1,
0.6132497, -0.06934444, -1.107038, 0, 0, 0, 1, 1,
0.6142255, 1.386856, 1.949902, 0, 0, 0, 1, 1,
0.6162726, 1.939401, -1.839455, 0, 0, 0, 1, 1,
0.6165589, 0.1802939, 1.158809, 1, 1, 1, 1, 1,
0.618192, -0.5908204, 1.291319, 1, 1, 1, 1, 1,
0.6212161, 0.1856962, 1.385332, 1, 1, 1, 1, 1,
0.6217857, 0.457964, 1.351673, 1, 1, 1, 1, 1,
0.6357535, -0.7010065, 3.327229, 1, 1, 1, 1, 1,
0.6392793, 0.3757441, 0.7768583, 1, 1, 1, 1, 1,
0.6404041, 0.9428012, 2.554437, 1, 1, 1, 1, 1,
0.6436862, -0.4986134, 2.148177, 1, 1, 1, 1, 1,
0.6478152, -0.4792514, 2.166749, 1, 1, 1, 1, 1,
0.6525235, 0.4032782, 1.094402, 1, 1, 1, 1, 1,
0.6641434, -0.6062143, 1.753044, 1, 1, 1, 1, 1,
0.6716673, -0.3541118, 0.7671013, 1, 1, 1, 1, 1,
0.6743075, -0.8518889, 0.308635, 1, 1, 1, 1, 1,
0.6763998, -0.0362744, 2.647495, 1, 1, 1, 1, 1,
0.6823294, 0.5038596, 0.358804, 1, 1, 1, 1, 1,
0.6840584, 0.7297109, 1.80294, 0, 0, 1, 1, 1,
0.6920679, -0.7049046, 0.1823148, 1, 0, 0, 1, 1,
0.6958189, 0.1865261, 0.3575387, 1, 0, 0, 1, 1,
0.6968603, 1.596342, 0.7461117, 1, 0, 0, 1, 1,
0.6995924, 0.4869848, 0.9873661, 1, 0, 0, 1, 1,
0.7007357, -0.5843218, 4.263131, 1, 0, 0, 1, 1,
0.7007396, -0.7759421, 2.774265, 0, 0, 0, 1, 1,
0.7008489, 0.4654789, -0.2802593, 0, 0, 0, 1, 1,
0.7041109, 1.18851, 0.5105818, 0, 0, 0, 1, 1,
0.707119, 0.2374134, 1.499038, 0, 0, 0, 1, 1,
0.722469, 0.5904183, 1.373085, 0, 0, 0, 1, 1,
0.7232822, -0.7151242, 3.706379, 0, 0, 0, 1, 1,
0.7244526, 0.373697, 1.867654, 0, 0, 0, 1, 1,
0.7253983, 0.5800254, 0.4313946, 1, 1, 1, 1, 1,
0.7296582, -0.8848098, 2.137992, 1, 1, 1, 1, 1,
0.7331043, 1.858341, -0.02887619, 1, 1, 1, 1, 1,
0.7370432, -0.2662121, 2.54518, 1, 1, 1, 1, 1,
0.73715, -0.01213188, 1.001855, 1, 1, 1, 1, 1,
0.7404124, -0.1843817, 2.018873, 1, 1, 1, 1, 1,
0.7455987, -0.4716286, 2.889596, 1, 1, 1, 1, 1,
0.7492145, 0.3565185, 1.82154, 1, 1, 1, 1, 1,
0.749458, -0.2044726, 2.005384, 1, 1, 1, 1, 1,
0.7572131, 0.5297288, 2.131067, 1, 1, 1, 1, 1,
0.7575164, -1.621331, 2.648379, 1, 1, 1, 1, 1,
0.759724, 0.1826739, 1.58048, 1, 1, 1, 1, 1,
0.7617844, 0.469538, -1.05424, 1, 1, 1, 1, 1,
0.7669599, -0.3173334, -0.6099791, 1, 1, 1, 1, 1,
0.7732797, -0.02251396, 0.8720057, 1, 1, 1, 1, 1,
0.7740806, 1.596083, 1.448075, 0, 0, 1, 1, 1,
0.7757856, -2.47279, 2.974984, 1, 0, 0, 1, 1,
0.7774501, 1.479724, 1.503429, 1, 0, 0, 1, 1,
0.7785401, -1.394236, 2.570517, 1, 0, 0, 1, 1,
0.7865742, -1.313398, 2.24539, 1, 0, 0, 1, 1,
0.7963775, 0.08555059, 1.52127, 1, 0, 0, 1, 1,
0.8029833, -0.6028789, 0.8261132, 0, 0, 0, 1, 1,
0.8051562, 0.8239595, 1.197689, 0, 0, 0, 1, 1,
0.8109451, -2.034113, 2.279181, 0, 0, 0, 1, 1,
0.8123108, 0.2645572, 2.215637, 0, 0, 0, 1, 1,
0.8130953, 0.2051687, 2.708716, 0, 0, 0, 1, 1,
0.8202667, 1.456193, -0.44301, 0, 0, 0, 1, 1,
0.8207555, -0.1236523, 2.293796, 0, 0, 0, 1, 1,
0.8223727, 0.7865993, -0.1952701, 1, 1, 1, 1, 1,
0.833198, -0.02439103, -0.3904769, 1, 1, 1, 1, 1,
0.8368893, 0.0135611, -0.7970112, 1, 1, 1, 1, 1,
0.846925, 1.687071, -1.321647, 1, 1, 1, 1, 1,
0.8480383, -0.1911532, 2.253191, 1, 1, 1, 1, 1,
0.8481367, 0.9193916, -0.4580061, 1, 1, 1, 1, 1,
0.8555581, -1.22357, 3.227401, 1, 1, 1, 1, 1,
0.8565897, 0.6412463, 1.121395, 1, 1, 1, 1, 1,
0.8585952, -0.851561, 2.629586, 1, 1, 1, 1, 1,
0.8614378, 0.4496329, 1.613523, 1, 1, 1, 1, 1,
0.8744494, -1.438113, 3.057351, 1, 1, 1, 1, 1,
0.8746169, -0.1447393, 0.3031964, 1, 1, 1, 1, 1,
0.8782792, -0.3171071, 2.463904, 1, 1, 1, 1, 1,
0.8783904, 0.4918137, 1.271243, 1, 1, 1, 1, 1,
0.8861385, -1.593556, 2.889501, 1, 1, 1, 1, 1,
0.8866011, -0.7383158, 1.172626, 0, 0, 1, 1, 1,
0.8894324, -0.3256744, 1.939396, 1, 0, 0, 1, 1,
0.8907642, 0.7095832, 3.049821, 1, 0, 0, 1, 1,
0.8934613, 0.3817654, 1.54706, 1, 0, 0, 1, 1,
0.8940414, -2.32652, 1.210629, 1, 0, 0, 1, 1,
0.9105123, -0.02713827, 2.697921, 1, 0, 0, 1, 1,
0.916064, 0.9641109, -0.3524098, 0, 0, 0, 1, 1,
0.920141, -1.821166, 3.443418, 0, 0, 0, 1, 1,
0.9202077, 0.1606909, 0.52626, 0, 0, 0, 1, 1,
0.9310374, -0.1372183, 2.124088, 0, 0, 0, 1, 1,
0.9332374, 0.6421383, 1.583438, 0, 0, 0, 1, 1,
0.9339437, -0.07473601, 1.405788, 0, 0, 0, 1, 1,
0.9364136, -0.4843192, 1.471399, 0, 0, 0, 1, 1,
0.9451291, -0.05434472, 3.249975, 1, 1, 1, 1, 1,
0.9508886, 0.8018356, 0.8703431, 1, 1, 1, 1, 1,
0.951081, 1.694553, 1.344018, 1, 1, 1, 1, 1,
0.9643479, -0.3874096, 1.820624, 1, 1, 1, 1, 1,
0.9673734, 2.250099, -0.9782428, 1, 1, 1, 1, 1,
0.9719623, 0.3044168, 1.675889, 1, 1, 1, 1, 1,
0.9763414, 0.22226, 0.7278889, 1, 1, 1, 1, 1,
0.9768766, 0.7974058, -0.3817898, 1, 1, 1, 1, 1,
0.9807598, -0.7175783, 3.878108, 1, 1, 1, 1, 1,
0.9831249, 0.8314214, 1.203784, 1, 1, 1, 1, 1,
0.9851653, 1.859003, 0.7157168, 1, 1, 1, 1, 1,
0.9882642, -1.285006, 2.559506, 1, 1, 1, 1, 1,
0.9884373, 0.3602933, -0.1178439, 1, 1, 1, 1, 1,
0.9900769, -0.1164533, 1.062675, 1, 1, 1, 1, 1,
0.9986939, 0.2410902, 1.793383, 1, 1, 1, 1, 1,
1.005319, -0.06719936, 2.369472, 0, 0, 1, 1, 1,
1.008533, -1.358807, 2.063884, 1, 0, 0, 1, 1,
1.01399, 0.5001808, 2.256555, 1, 0, 0, 1, 1,
1.016446, 0.9730695, 1.776548, 1, 0, 0, 1, 1,
1.017728, 0.4037129, 1.917498, 1, 0, 0, 1, 1,
1.026701, -0.5093153, 2.225652, 1, 0, 0, 1, 1,
1.027592, -1.230664, 1.950869, 0, 0, 0, 1, 1,
1.02889, 0.9552727, 0.6662763, 0, 0, 0, 1, 1,
1.029184, 0.08063047, 1.352214, 0, 0, 0, 1, 1,
1.029689, 0.5909691, 0.1761575, 0, 0, 0, 1, 1,
1.043492, -1.718762, 3.093161, 0, 0, 0, 1, 1,
1.043591, -0.8007191, 2.770266, 0, 0, 0, 1, 1,
1.044395, 0.1191968, 2.352223, 0, 0, 0, 1, 1,
1.055329, 0.2947939, 1.373811, 1, 1, 1, 1, 1,
1.058822, 1.16042, 1.097363, 1, 1, 1, 1, 1,
1.062306, 0.05407291, 1.912966, 1, 1, 1, 1, 1,
1.064264, -0.3026868, 1.498978, 1, 1, 1, 1, 1,
1.068253, -0.1669921, 3.329868, 1, 1, 1, 1, 1,
1.074443, 0.2826141, -0.7266468, 1, 1, 1, 1, 1,
1.075609, -0.2809322, 1.657387, 1, 1, 1, 1, 1,
1.089273, -0.04868484, 2.235004, 1, 1, 1, 1, 1,
1.096334, 1.100752, 0.5280674, 1, 1, 1, 1, 1,
1.106017, 1.769708, -0.5274795, 1, 1, 1, 1, 1,
1.111065, -1.553521, 2.63316, 1, 1, 1, 1, 1,
1.116024, 0.3275758, 1.422804, 1, 1, 1, 1, 1,
1.122918, -0.3605382, 1.995127, 1, 1, 1, 1, 1,
1.12384, 0.4899276, 0.7161664, 1, 1, 1, 1, 1,
1.128488, -0.2676095, 2.052029, 1, 1, 1, 1, 1,
1.128986, 0.267801, 1.136325, 0, 0, 1, 1, 1,
1.144643, 0.167075, 0.9243453, 1, 0, 0, 1, 1,
1.146411, -0.3289335, 1.613718, 1, 0, 0, 1, 1,
1.156518, -0.5514835, 0.2784882, 1, 0, 0, 1, 1,
1.164239, 0.3257351, 0.3452829, 1, 0, 0, 1, 1,
1.168897, -0.3356768, 0.4771248, 1, 0, 0, 1, 1,
1.180787, -0.58893, 0.7636878, 0, 0, 0, 1, 1,
1.18178, -0.8997051, 0.551061, 0, 0, 0, 1, 1,
1.183065, 1.003527, 1.518305, 0, 0, 0, 1, 1,
1.188638, 0.3432859, 0.596216, 0, 0, 0, 1, 1,
1.19483, 0.5832532, 3.31684, 0, 0, 0, 1, 1,
1.20182, 0.5720195, 1.012015, 0, 0, 0, 1, 1,
1.204813, -2.030273, 1.871762, 0, 0, 0, 1, 1,
1.212935, -0.2645188, 2.440197, 1, 1, 1, 1, 1,
1.215056, -1.971911, 0.4470393, 1, 1, 1, 1, 1,
1.217779, -0.2776019, 0.5166231, 1, 1, 1, 1, 1,
1.237687, 0.2357928, 1.04519, 1, 1, 1, 1, 1,
1.250891, -0.3123191, -0.5100998, 1, 1, 1, 1, 1,
1.251021, 0.3289083, 1.598567, 1, 1, 1, 1, 1,
1.251486, 0.1579597, 1.107989, 1, 1, 1, 1, 1,
1.254282, -0.8303902, 1.605657, 1, 1, 1, 1, 1,
1.254908, -0.6718359, 1.455686, 1, 1, 1, 1, 1,
1.264273, 0.2742067, 1.79729, 1, 1, 1, 1, 1,
1.265644, 1.027881, 0.7845864, 1, 1, 1, 1, 1,
1.268952, -1.620284, 1.953736, 1, 1, 1, 1, 1,
1.27175, 0.07882573, 1.865743, 1, 1, 1, 1, 1,
1.272943, 0.1849378, 2.359377, 1, 1, 1, 1, 1,
1.276102, 0.04363566, 3.174991, 1, 1, 1, 1, 1,
1.27889, -0.2794094, 0.69718, 0, 0, 1, 1, 1,
1.281021, -0.08260249, 1.875639, 1, 0, 0, 1, 1,
1.281482, 0.513392, 0.9524902, 1, 0, 0, 1, 1,
1.284498, -0.8492607, 2.233755, 1, 0, 0, 1, 1,
1.315044, 0.9356113, -0.8229095, 1, 0, 0, 1, 1,
1.317901, 0.8093013, 2.076714, 1, 0, 0, 1, 1,
1.328617, -1.514922, 3.14273, 0, 0, 0, 1, 1,
1.347954, 0.7141075, -1.632858, 0, 0, 0, 1, 1,
1.351062, -0.4345174, 0.9225097, 0, 0, 0, 1, 1,
1.351234, 1.05716, 0.5160787, 0, 0, 0, 1, 1,
1.355533, 0.08950023, 2.641071, 0, 0, 0, 1, 1,
1.359666, 0.1973689, 2.118611, 0, 0, 0, 1, 1,
1.370461, -1.374177, 0.7648625, 0, 0, 0, 1, 1,
1.371233, 1.869125, 0.2543865, 1, 1, 1, 1, 1,
1.37174, -1.476663, 1.306329, 1, 1, 1, 1, 1,
1.378756, -2.285728, 2.5639, 1, 1, 1, 1, 1,
1.385674, -1.293208, 2.73376, 1, 1, 1, 1, 1,
1.397835, 0.2310976, 1.904717, 1, 1, 1, 1, 1,
1.421508, 1.037933, 0.8086519, 1, 1, 1, 1, 1,
1.427136, -0.4523509, 0.6021075, 1, 1, 1, 1, 1,
1.433136, -1.436489, 3.792925, 1, 1, 1, 1, 1,
1.435485, 1.637657, -0.2364502, 1, 1, 1, 1, 1,
1.453866, 1.725245, 0.02314667, 1, 1, 1, 1, 1,
1.466236, -0.4169704, 2.454482, 1, 1, 1, 1, 1,
1.472502, 0.2041876, 3.938709, 1, 1, 1, 1, 1,
1.476606, -1.184473, 1.898111, 1, 1, 1, 1, 1,
1.495241, -0.6256247, 1.698918, 1, 1, 1, 1, 1,
1.507088, 0.4708458, 0.3386053, 1, 1, 1, 1, 1,
1.50838, -1.082136, 1.788642, 0, 0, 1, 1, 1,
1.527292, 0.3223547, 2.559375, 1, 0, 0, 1, 1,
1.533409, 0.9246263, 0.3441982, 1, 0, 0, 1, 1,
1.534738, 0.5573956, 2.459507, 1, 0, 0, 1, 1,
1.538766, -0.9121128, 1.919587, 1, 0, 0, 1, 1,
1.548211, 0.09946906, -0.4932098, 1, 0, 0, 1, 1,
1.548438, -0.1787892, 0.1772226, 0, 0, 0, 1, 1,
1.553175, -0.1743492, 1.406519, 0, 0, 0, 1, 1,
1.555695, 0.7643783, 0.3513575, 0, 0, 0, 1, 1,
1.559444, 0.8088203, 2.128599, 0, 0, 0, 1, 1,
1.574109, -0.636675, 0.6179802, 0, 0, 0, 1, 1,
1.580687, 0.5456508, 0.7079204, 0, 0, 0, 1, 1,
1.5854, -1.789526, 3.001176, 0, 0, 0, 1, 1,
1.592573, 1.123855, 1.288458, 1, 1, 1, 1, 1,
1.622903, -1.772406, 3.260972, 1, 1, 1, 1, 1,
1.638023, -0.05156874, 2.704077, 1, 1, 1, 1, 1,
1.654151, 0.6242783, 0.8788837, 1, 1, 1, 1, 1,
1.654668, -1.270762, 0.838465, 1, 1, 1, 1, 1,
1.661185, -1.019267, 1.291856, 1, 1, 1, 1, 1,
1.663432, 0.6841583, 1.099451, 1, 1, 1, 1, 1,
1.668191, 0.5067035, 1.173558, 1, 1, 1, 1, 1,
1.678744, -0.5573902, 1.970101, 1, 1, 1, 1, 1,
1.679009, -1.864209, 2.215966, 1, 1, 1, 1, 1,
1.681143, -1.661024, 3.392331, 1, 1, 1, 1, 1,
1.68256, -0.1873939, 1.819191, 1, 1, 1, 1, 1,
1.688128, 0.1497276, 1.529974, 1, 1, 1, 1, 1,
1.701812, 1.262245, 0.5088556, 1, 1, 1, 1, 1,
1.754464, 0.2781908, 0.7501545, 1, 1, 1, 1, 1,
1.756664, -0.4882376, 0.5334284, 0, 0, 1, 1, 1,
1.762074, -1.641754, 3.405787, 1, 0, 0, 1, 1,
1.762798, 1.211183, 3.080829, 1, 0, 0, 1, 1,
1.784927, -1.374676, 3.383135, 1, 0, 0, 1, 1,
1.80221, -0.4343705, 1.732123, 1, 0, 0, 1, 1,
1.8197, -0.5012003, -0.03158908, 1, 0, 0, 1, 1,
1.823445, -0.8751489, 1.708947, 0, 0, 0, 1, 1,
1.82497, -0.9936148, 1.236405, 0, 0, 0, 1, 1,
1.83223, -0.4788809, 1.18681, 0, 0, 0, 1, 1,
1.83628, -2.582542, 3.480177, 0, 0, 0, 1, 1,
1.850231, 0.06666164, 0.6008814, 0, 0, 0, 1, 1,
1.866887, -0.1074002, 3.25622, 0, 0, 0, 1, 1,
1.871929, 0.5003381, 2.994593, 0, 0, 0, 1, 1,
1.878011, 0.1802635, 0.1945079, 1, 1, 1, 1, 1,
1.880046, 0.5664758, 1.108754, 1, 1, 1, 1, 1,
1.89446, 0.6191265, 0.7476522, 1, 1, 1, 1, 1,
1.89497, -0.559813, 2.325513, 1, 1, 1, 1, 1,
1.896298, -0.3966765, 2.951817, 1, 1, 1, 1, 1,
1.897967, 2.641084, 0.8879021, 1, 1, 1, 1, 1,
1.9433, -1.226828, 1.905861, 1, 1, 1, 1, 1,
1.956859, 1.550564, 1.619457, 1, 1, 1, 1, 1,
1.971194, 0.4856371, 1.926954, 1, 1, 1, 1, 1,
1.989635, 0.4179213, 2.786439, 1, 1, 1, 1, 1,
2.004623, 0.195437, 2.302728, 1, 1, 1, 1, 1,
2.007773, -0.5918658, 1.664298, 1, 1, 1, 1, 1,
2.021182, -0.1035189, 0.2498555, 1, 1, 1, 1, 1,
2.051311, -1.378189, 3.68582, 1, 1, 1, 1, 1,
2.058209, 1.975114, 1.610896, 1, 1, 1, 1, 1,
2.08598, -0.3625437, 1.831789, 0, 0, 1, 1, 1,
2.107772, 0.01040262, 2.555688, 1, 0, 0, 1, 1,
2.113553, 0.8423913, 2.979981, 1, 0, 0, 1, 1,
2.148928, -0.8655269, 2.315764, 1, 0, 0, 1, 1,
2.183263, 0.5306748, 2.088959, 1, 0, 0, 1, 1,
2.187811, 0.2504542, 0.2575103, 1, 0, 0, 1, 1,
2.192407, -0.4756877, 1.187119, 0, 0, 0, 1, 1,
2.199294, -0.07474331, 2.878467, 0, 0, 0, 1, 1,
2.209824, -0.3575106, 1.508692, 0, 0, 0, 1, 1,
2.254493, 0.4957342, 1.403154, 0, 0, 0, 1, 1,
2.295401, -1.049136, 3.413704, 0, 0, 0, 1, 1,
2.298875, -0.3102918, 2.063766, 0, 0, 0, 1, 1,
2.347445, -2.220234, 2.33925, 0, 0, 0, 1, 1,
2.398464, 1.450335, 1.090952, 1, 1, 1, 1, 1,
2.469592, -0.2695723, 2.301863, 1, 1, 1, 1, 1,
2.532199, -1.447201, 2.023764, 1, 1, 1, 1, 1,
2.532573, -0.05393617, 2.109927, 1, 1, 1, 1, 1,
2.549011, 0.03097696, 1.98392, 1, 1, 1, 1, 1,
2.691246, 0.1476493, 1.12109, 1, 1, 1, 1, 1,
2.747683, -1.684573, 1.622556, 1, 1, 1, 1, 1
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
var radius = 9.49989;
var distance = 33.36796;
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
mvMatrix.translate( 0.1955386, -0.004269123, 0.2220266 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36796);
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
