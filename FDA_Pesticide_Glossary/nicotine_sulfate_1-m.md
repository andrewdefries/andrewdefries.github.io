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
-3.326248, 1.285098, -0.2051919, 1, 0, 0, 1,
-2.990084, -1.764458, -3.461585, 1, 0.007843138, 0, 1,
-2.859655, 1.603696, 0.06325293, 1, 0.01176471, 0, 1,
-2.853249, -0.4101962, -2.523866, 1, 0.01960784, 0, 1,
-2.565863, -1.909453, -2.474359, 1, 0.02352941, 0, 1,
-2.513127, -0.5439877, -1.678524, 1, 0.03137255, 0, 1,
-2.481679, -0.08006828, -2.901566, 1, 0.03529412, 0, 1,
-2.475966, -0.1214654, -4.213498, 1, 0.04313726, 0, 1,
-2.446677, -0.2797356, -3.792723, 1, 0.04705882, 0, 1,
-2.373813, 0.2293772, -2.134011, 1, 0.05490196, 0, 1,
-2.368389, 1.267122, -0.3198139, 1, 0.05882353, 0, 1,
-2.352631, 0.6717473, -1.968618, 1, 0.06666667, 0, 1,
-2.307651, 0.8048022, -1.345533, 1, 0.07058824, 0, 1,
-2.30589, 0.3200751, -1.810036, 1, 0.07843138, 0, 1,
-2.305051, -0.1543683, -0.1214026, 1, 0.08235294, 0, 1,
-2.287404, 0.1181731, -1.384303, 1, 0.09019608, 0, 1,
-2.275669, 1.870014, 0.2160537, 1, 0.09411765, 0, 1,
-2.215416, -0.5672442, -1.094604, 1, 0.1019608, 0, 1,
-2.215003, -0.118752, -0.8421626, 1, 0.1098039, 0, 1,
-2.194491, 0.9455488, 0.4320454, 1, 0.1137255, 0, 1,
-2.162421, -0.9959448, -3.448135, 1, 0.1215686, 0, 1,
-2.14983, -1.525782, -0.09525836, 1, 0.1254902, 0, 1,
-2.146814, 1.250509, -1.369478, 1, 0.1333333, 0, 1,
-2.129087, 0.8440918, -1.16235, 1, 0.1372549, 0, 1,
-2.121582, -0.06816723, -3.737571, 1, 0.145098, 0, 1,
-2.118102, -0.9153851, -0.4728776, 1, 0.1490196, 0, 1,
-2.099885, -0.4540155, -2.099144, 1, 0.1568628, 0, 1,
-2.055474, 1.011977, -1.287241, 1, 0.1607843, 0, 1,
-2.030168, -0.6782722, -3.054485, 1, 0.1686275, 0, 1,
-2.015498, 0.8066898, -1.67158, 1, 0.172549, 0, 1,
-2.004398, 1.273758, -1.215352, 1, 0.1803922, 0, 1,
-1.996163, 0.4384278, -2.210251, 1, 0.1843137, 0, 1,
-1.994946, 0.4989783, -2.115241, 1, 0.1921569, 0, 1,
-1.968645, -1.207516, -2.226817, 1, 0.1960784, 0, 1,
-1.946584, 0.5794109, -1.631879, 1, 0.2039216, 0, 1,
-1.934159, 0.4710585, -3.001515, 1, 0.2117647, 0, 1,
-1.925982, 0.3469299, -0.8185741, 1, 0.2156863, 0, 1,
-1.905006, 0.3125996, -0.7441741, 1, 0.2235294, 0, 1,
-1.899618, -0.8826861, -3.642349, 1, 0.227451, 0, 1,
-1.897774, -0.1238849, -2.172777, 1, 0.2352941, 0, 1,
-1.88196, -0.5096151, -2.726345, 1, 0.2392157, 0, 1,
-1.871849, 0.08245026, 0.6573763, 1, 0.2470588, 0, 1,
-1.871027, 0.9805597, -2.20378, 1, 0.2509804, 0, 1,
-1.864844, 0.8989162, -0.5243421, 1, 0.2588235, 0, 1,
-1.863949, -0.5598716, -2.741653, 1, 0.2627451, 0, 1,
-1.857896, 0.7346931, -2.115429, 1, 0.2705882, 0, 1,
-1.846761, 0.4729306, -0.8189219, 1, 0.2745098, 0, 1,
-1.83701, 0.8104023, 1.07585, 1, 0.282353, 0, 1,
-1.806608, 0.5800159, -1.454024, 1, 0.2862745, 0, 1,
-1.801518, -0.6848903, -2.013827, 1, 0.2941177, 0, 1,
-1.800882, -0.2856294, -0.7122473, 1, 0.3019608, 0, 1,
-1.75521, 0.5160632, 0.07738124, 1, 0.3058824, 0, 1,
-1.725282, 0.6102929, -0.4629807, 1, 0.3137255, 0, 1,
-1.702329, -1.716103, -1.773332, 1, 0.3176471, 0, 1,
-1.679562, -0.7503697, -2.442073, 1, 0.3254902, 0, 1,
-1.67241, -0.9132593, -2.278472, 1, 0.3294118, 0, 1,
-1.665416, 1.187142, -1.191387, 1, 0.3372549, 0, 1,
-1.661239, -0.5848477, -2.822507, 1, 0.3411765, 0, 1,
-1.65974, 0.6939496, -1.056825, 1, 0.3490196, 0, 1,
-1.656512, 1.195979, -2.270082, 1, 0.3529412, 0, 1,
-1.639576, -0.3754546, 0.2563128, 1, 0.3607843, 0, 1,
-1.632708, -0.9302005, -3.33369, 1, 0.3647059, 0, 1,
-1.624053, -0.8845501, -3.331118, 1, 0.372549, 0, 1,
-1.623986, -0.08265062, -1.348383, 1, 0.3764706, 0, 1,
-1.62362, 1.609289, -2.036513, 1, 0.3843137, 0, 1,
-1.612885, 0.8908871, -2.607474, 1, 0.3882353, 0, 1,
-1.612323, -0.2915657, -0.9699948, 1, 0.3960784, 0, 1,
-1.592692, 0.70913, -1.048547, 1, 0.4039216, 0, 1,
-1.56034, 0.2995037, -1.166299, 1, 0.4078431, 0, 1,
-1.559, -0.4264167, -3.707921, 1, 0.4156863, 0, 1,
-1.544468, 0.2217202, -0.6785825, 1, 0.4196078, 0, 1,
-1.543722, 0.6231706, -3.276703, 1, 0.427451, 0, 1,
-1.540631, -0.6997907, -3.073755, 1, 0.4313726, 0, 1,
-1.533835, -1.744447, -2.347383, 1, 0.4392157, 0, 1,
-1.529345, 1.14986, -2.573387, 1, 0.4431373, 0, 1,
-1.528052, -0.6842235, -1.860997, 1, 0.4509804, 0, 1,
-1.523939, -2.504864, -2.428717, 1, 0.454902, 0, 1,
-1.521473, -0.3531496, -1.630005, 1, 0.4627451, 0, 1,
-1.506904, 1.023326, -1.852091, 1, 0.4666667, 0, 1,
-1.466225, 0.4307512, -3.233256, 1, 0.4745098, 0, 1,
-1.459459, -0.1508126, -2.287729, 1, 0.4784314, 0, 1,
-1.456044, 0.240071, -0.9425182, 1, 0.4862745, 0, 1,
-1.449282, -0.9962927, -2.294916, 1, 0.4901961, 0, 1,
-1.443859, 1.5155, 1.123103, 1, 0.4980392, 0, 1,
-1.44285, 1.387745, -0.6631013, 1, 0.5058824, 0, 1,
-1.437994, -1.803772, -2.861253, 1, 0.509804, 0, 1,
-1.437679, 0.006669577, -0.4759563, 1, 0.5176471, 0, 1,
-1.424827, -2.748224, -2.741907, 1, 0.5215687, 0, 1,
-1.41696, 0.34154, -1.188467, 1, 0.5294118, 0, 1,
-1.409804, 0.05195452, -1.400725, 1, 0.5333334, 0, 1,
-1.4037, -1.136039, -0.8771005, 1, 0.5411765, 0, 1,
-1.402088, 1.288641, -2.133214, 1, 0.5450981, 0, 1,
-1.398405, 0.37402, -1.672766, 1, 0.5529412, 0, 1,
-1.397316, 0.7522486, -2.093837, 1, 0.5568628, 0, 1,
-1.390135, -0.7501867, -2.639771, 1, 0.5647059, 0, 1,
-1.374312, 0.1880005, -2.405686, 1, 0.5686275, 0, 1,
-1.361279, 1.172341, 0.001115105, 1, 0.5764706, 0, 1,
-1.347938, 1.151468, -0.9373698, 1, 0.5803922, 0, 1,
-1.341985, 1.237308, -1.571363, 1, 0.5882353, 0, 1,
-1.336818, -0.7882512, -4.052618, 1, 0.5921569, 0, 1,
-1.318016, 1.731599, -0.6321648, 1, 0.6, 0, 1,
-1.313142, 1.320332, -1.646474, 1, 0.6078432, 0, 1,
-1.309624, -0.7862602, -2.081716, 1, 0.6117647, 0, 1,
-1.305903, 1.057055, -0.1466376, 1, 0.6196079, 0, 1,
-1.295316, 0.6431655, -1.373969, 1, 0.6235294, 0, 1,
-1.294939, 0.4560459, -0.5180348, 1, 0.6313726, 0, 1,
-1.283352, 0.1895927, -1.006659, 1, 0.6352941, 0, 1,
-1.280032, -0.4717882, -2.667784, 1, 0.6431373, 0, 1,
-1.279474, -2.272974, -2.492724, 1, 0.6470588, 0, 1,
-1.277379, 0.2274237, -2.663914, 1, 0.654902, 0, 1,
-1.27639, 0.3177721, -1.578178, 1, 0.6588235, 0, 1,
-1.273561, -0.8064405, -2.690401, 1, 0.6666667, 0, 1,
-1.273266, 0.5463433, -3.70032, 1, 0.6705883, 0, 1,
-1.268231, -0.6787022, -3.240372, 1, 0.6784314, 0, 1,
-1.261034, -0.9703777, -3.716765, 1, 0.682353, 0, 1,
-1.252735, -0.7110346, -1.475792, 1, 0.6901961, 0, 1,
-1.251256, 0.6909304, -1.68555, 1, 0.6941177, 0, 1,
-1.250144, 0.4733721, -1.84467, 1, 0.7019608, 0, 1,
-1.22782, 0.3339957, -2.215648, 1, 0.7098039, 0, 1,
-1.218887, 0.7927171, -0.8962024, 1, 0.7137255, 0, 1,
-1.218379, -0.5495989, -0.579392, 1, 0.7215686, 0, 1,
-1.210054, 0.9982757, -0.8370517, 1, 0.7254902, 0, 1,
-1.204805, 0.6540025, -0.8157964, 1, 0.7333333, 0, 1,
-1.203172, 0.2940236, -2.134117, 1, 0.7372549, 0, 1,
-1.20309, 0.417812, -1.81091, 1, 0.7450981, 0, 1,
-1.195564, -0.7976952, -2.178284, 1, 0.7490196, 0, 1,
-1.194212, 0.4468654, -1.167244, 1, 0.7568628, 0, 1,
-1.193123, -2.557444, -2.426555, 1, 0.7607843, 0, 1,
-1.177638, 0.3734682, -1.556442, 1, 0.7686275, 0, 1,
-1.161432, -0.8312663, -1.228496, 1, 0.772549, 0, 1,
-1.156598, 0.5490916, -1.409046, 1, 0.7803922, 0, 1,
-1.156382, -0.2968451, -0.5196283, 1, 0.7843137, 0, 1,
-1.154985, 1.731176, -1.253443, 1, 0.7921569, 0, 1,
-1.152802, -0.6942922, -1.967268, 1, 0.7960784, 0, 1,
-1.152164, -0.8253133, -2.188143, 1, 0.8039216, 0, 1,
-1.147523, 1.624666, -0.08160974, 1, 0.8117647, 0, 1,
-1.140884, -0.3063462, -2.31828, 1, 0.8156863, 0, 1,
-1.138495, 0.5237721, -1.633837, 1, 0.8235294, 0, 1,
-1.137529, 1.03762, -1.148675, 1, 0.827451, 0, 1,
-1.136934, -1.218421, -0.2144043, 1, 0.8352941, 0, 1,
-1.129472, -0.5754809, -2.801417, 1, 0.8392157, 0, 1,
-1.127606, 0.0903725, -1.224439, 1, 0.8470588, 0, 1,
-1.125394, -0.2876461, -3.270062, 1, 0.8509804, 0, 1,
-1.122342, 1.04451, -1.416792, 1, 0.8588235, 0, 1,
-1.119121, 0.2374004, -1.81458, 1, 0.8627451, 0, 1,
-1.114856, -0.5313103, -3.329744, 1, 0.8705882, 0, 1,
-1.113843, -0.6673902, -2.026638, 1, 0.8745098, 0, 1,
-1.111654, -0.2338657, -1.170548, 1, 0.8823529, 0, 1,
-1.110435, -0.1033599, -1.628232, 1, 0.8862745, 0, 1,
-1.106725, -0.7701178, -2.245269, 1, 0.8941177, 0, 1,
-1.105335, 0.810034, -0.04339691, 1, 0.8980392, 0, 1,
-1.104585, -3.170471, -2.422264, 1, 0.9058824, 0, 1,
-1.100816, -0.4515534, -0.4558968, 1, 0.9137255, 0, 1,
-1.094011, -1.047085, -1.141903, 1, 0.9176471, 0, 1,
-1.09093, 0.8479818, -0.9579489, 1, 0.9254902, 0, 1,
-1.0905, 1.251199, -0.1958691, 1, 0.9294118, 0, 1,
-1.082339, -0.6977571, -2.133915, 1, 0.9372549, 0, 1,
-1.07989, -1.269129, -1.156958, 1, 0.9411765, 0, 1,
-1.070453, 1.190223, -2.069917, 1, 0.9490196, 0, 1,
-1.070446, 0.3636726, -3.109235, 1, 0.9529412, 0, 1,
-1.068998, 0.5139167, -1.805681, 1, 0.9607843, 0, 1,
-1.052115, -0.2748009, -0.7088995, 1, 0.9647059, 0, 1,
-1.05144, 0.2819746, -2.020483, 1, 0.972549, 0, 1,
-1.034347, -0.2378463, -2.413009, 1, 0.9764706, 0, 1,
-1.032053, 0.2751576, -2.752458, 1, 0.9843137, 0, 1,
-1.029936, 0.2517187, -2.99857, 1, 0.9882353, 0, 1,
-1.022111, 0.2056479, -0.7757032, 1, 0.9960784, 0, 1,
-1.019574, 0.3030171, -0.6479344, 0.9960784, 1, 0, 1,
-1.019491, 0.7571014, -1.404288, 0.9921569, 1, 0, 1,
-1.017977, -0.3581615, -2.909386, 0.9843137, 1, 0, 1,
-1.017512, 0.7809553, -1.779578, 0.9803922, 1, 0, 1,
-1.01658, -3.354348, -2.721099, 0.972549, 1, 0, 1,
-1.012606, -1.836915, -1.793869, 0.9686275, 1, 0, 1,
-1.010204, -0.004387531, -0.4493796, 0.9607843, 1, 0, 1,
-1.00893, 0.3389073, -1.261331, 0.9568627, 1, 0, 1,
-1.00411, -1.087301, -1.665073, 0.9490196, 1, 0, 1,
-0.9957218, 0.5153595, -0.9478588, 0.945098, 1, 0, 1,
-0.9905225, 1.111416, -0.8458002, 0.9372549, 1, 0, 1,
-0.9875872, 0.3213374, -0.8691149, 0.9333333, 1, 0, 1,
-0.9728889, 0.6487739, -1.538656, 0.9254902, 1, 0, 1,
-0.9706402, 1.994426, -0.9468716, 0.9215686, 1, 0, 1,
-0.969663, 0.3928284, -0.4198957, 0.9137255, 1, 0, 1,
-0.9677193, -0.2026409, -1.006482, 0.9098039, 1, 0, 1,
-0.9667113, 0.2798611, -0.06104868, 0.9019608, 1, 0, 1,
-0.9647151, -1.189147, -1.637639, 0.8941177, 1, 0, 1,
-0.9614946, -0.7825982, -2.476453, 0.8901961, 1, 0, 1,
-0.9609085, 0.5379502, -0.006338059, 0.8823529, 1, 0, 1,
-0.9591842, -0.8277238, -0.6480645, 0.8784314, 1, 0, 1,
-0.957526, -0.5698845, -1.937579, 0.8705882, 1, 0, 1,
-0.9573993, -0.8984134, -1.942052, 0.8666667, 1, 0, 1,
-0.9508575, -0.6008554, -0.6131217, 0.8588235, 1, 0, 1,
-0.950425, 0.140193, -3.286279, 0.854902, 1, 0, 1,
-0.9453623, 1.183001, 0.4020284, 0.8470588, 1, 0, 1,
-0.9397179, -1.715702, -2.077858, 0.8431373, 1, 0, 1,
-0.930294, -0.02518887, -1.774448, 0.8352941, 1, 0, 1,
-0.9296174, -0.7034663, -4.273941, 0.8313726, 1, 0, 1,
-0.9232587, 0.1531861, -2.306877, 0.8235294, 1, 0, 1,
-0.9181069, -1.23262, -2.157869, 0.8196079, 1, 0, 1,
-0.9165776, 0.68982, -2.719794, 0.8117647, 1, 0, 1,
-0.9072362, -0.8586528, -2.696567, 0.8078431, 1, 0, 1,
-0.9005036, -0.0006461857, -0.4130606, 0.8, 1, 0, 1,
-0.8940679, -0.7731783, -2.467818, 0.7921569, 1, 0, 1,
-0.8912798, -0.07320756, -2.525077, 0.7882353, 1, 0, 1,
-0.8849899, -0.9867591, -1.38702, 0.7803922, 1, 0, 1,
-0.8809009, 0.2234748, -1.955868, 0.7764706, 1, 0, 1,
-0.874833, -0.3298184, -3.002825, 0.7686275, 1, 0, 1,
-0.8624805, -0.5303773, -2.465501, 0.7647059, 1, 0, 1,
-0.8541508, -0.2692968, -2.166912, 0.7568628, 1, 0, 1,
-0.850951, -0.2240219, -1.133703, 0.7529412, 1, 0, 1,
-0.8498725, -0.5971224, -1.423457, 0.7450981, 1, 0, 1,
-0.8474203, -0.1117416, -0.8250565, 0.7411765, 1, 0, 1,
-0.8437004, -0.3217647, 0.142019, 0.7333333, 1, 0, 1,
-0.8433372, -2.210277, -3.819171, 0.7294118, 1, 0, 1,
-0.8400971, 0.2642402, -0.96269, 0.7215686, 1, 0, 1,
-0.8397579, 0.2454975, -0.8848096, 0.7176471, 1, 0, 1,
-0.8287785, -0.8256899, -3.775797, 0.7098039, 1, 0, 1,
-0.8250207, 0.7384564, -0.1095327, 0.7058824, 1, 0, 1,
-0.8239076, -0.2726051, -1.003639, 0.6980392, 1, 0, 1,
-0.8205284, 0.02400854, -1.365496, 0.6901961, 1, 0, 1,
-0.8170131, -0.5504017, -2.399297, 0.6862745, 1, 0, 1,
-0.8138943, 1.208497, -1.042618, 0.6784314, 1, 0, 1,
-0.811686, 0.3776028, -1.659943, 0.6745098, 1, 0, 1,
-0.8028296, -0.7323301, -0.4994583, 0.6666667, 1, 0, 1,
-0.8026934, -0.4171538, -2.351173, 0.6627451, 1, 0, 1,
-0.7988325, -1.348577, -4.402375, 0.654902, 1, 0, 1,
-0.7927763, 1.056816, -1.39177, 0.6509804, 1, 0, 1,
-0.7676241, 0.4766493, -1.131586, 0.6431373, 1, 0, 1,
-0.7610909, -0.2354302, 1.201602, 0.6392157, 1, 0, 1,
-0.7609487, -0.01889091, -2.336721, 0.6313726, 1, 0, 1,
-0.7572381, -1.077801, -3.743507, 0.627451, 1, 0, 1,
-0.7562701, -0.2336345, -1.352678, 0.6196079, 1, 0, 1,
-0.7559137, -0.4577752, -4.701884, 0.6156863, 1, 0, 1,
-0.7550073, -1.597672, -3.205144, 0.6078432, 1, 0, 1,
-0.7521025, -0.3944087, -2.06953, 0.6039216, 1, 0, 1,
-0.7517852, 0.4016151, -0.3368245, 0.5960785, 1, 0, 1,
-0.747639, 0.3612386, -0.5283928, 0.5882353, 1, 0, 1,
-0.7446708, -0.4035772, -2.469918, 0.5843138, 1, 0, 1,
-0.741281, -0.3567191, -2.988928, 0.5764706, 1, 0, 1,
-0.7409315, 0.7261067, -1.932396, 0.572549, 1, 0, 1,
-0.7397233, 0.4873108, -0.5331776, 0.5647059, 1, 0, 1,
-0.7349216, 0.5098682, 0.4747573, 0.5607843, 1, 0, 1,
-0.7300051, 0.7506766, -1.036373, 0.5529412, 1, 0, 1,
-0.7260364, -1.648916, -3.120689, 0.5490196, 1, 0, 1,
-0.7175299, -1.119585, -3.812723, 0.5411765, 1, 0, 1,
-0.716588, 1.223003, -0.5457684, 0.5372549, 1, 0, 1,
-0.709047, -2.058092, -2.81208, 0.5294118, 1, 0, 1,
-0.7059639, 0.02334473, -3.467946, 0.5254902, 1, 0, 1,
-0.6975445, 0.4690456, 0.0732535, 0.5176471, 1, 0, 1,
-0.6969434, -0.07459484, -2.496223, 0.5137255, 1, 0, 1,
-0.6888877, -0.1815754, -2.350528, 0.5058824, 1, 0, 1,
-0.6825898, -0.8436978, -0.4012566, 0.5019608, 1, 0, 1,
-0.6821799, 1.490124, -0.4084508, 0.4941176, 1, 0, 1,
-0.6816078, 2.206484, -2.993007, 0.4862745, 1, 0, 1,
-0.6758364, 1.490461, -0.6080807, 0.4823529, 1, 0, 1,
-0.6747106, -1.289631, -2.956394, 0.4745098, 1, 0, 1,
-0.6700898, -0.4641615, -0.6450321, 0.4705882, 1, 0, 1,
-0.6692627, -1.751245, -3.311785, 0.4627451, 1, 0, 1,
-0.6642604, 0.6829017, -0.7494542, 0.4588235, 1, 0, 1,
-0.6632749, 1.627548, -0.8089598, 0.4509804, 1, 0, 1,
-0.6625323, 0.7823559, -1.555622, 0.4470588, 1, 0, 1,
-0.6528209, -0.2309709, 1.09893, 0.4392157, 1, 0, 1,
-0.6447124, 0.01478045, -1.715437, 0.4352941, 1, 0, 1,
-0.6387187, 0.3100561, -2.199484, 0.427451, 1, 0, 1,
-0.6374035, -0.3664213, -0.8063034, 0.4235294, 1, 0, 1,
-0.6333181, -0.5761526, -3.83374, 0.4156863, 1, 0, 1,
-0.6280506, -0.2304897, -2.387728, 0.4117647, 1, 0, 1,
-0.6176172, 0.3400148, 0.01432596, 0.4039216, 1, 0, 1,
-0.612736, 0.3677295, -2.146507, 0.3960784, 1, 0, 1,
-0.6077839, 0.2759572, -1.308396, 0.3921569, 1, 0, 1,
-0.5986162, -0.7200183, -2.905916, 0.3843137, 1, 0, 1,
-0.5913739, 0.8852811, -0.5432959, 0.3803922, 1, 0, 1,
-0.590069, -0.8424728, -1.192822, 0.372549, 1, 0, 1,
-0.5895495, -1.501023, -2.446536, 0.3686275, 1, 0, 1,
-0.5893696, -0.3092634, -1.175792, 0.3607843, 1, 0, 1,
-0.5856056, -0.1022038, -2.510249, 0.3568628, 1, 0, 1,
-0.5853702, 1.365162, 0.1580875, 0.3490196, 1, 0, 1,
-0.5834559, 2.954215, 0.8204417, 0.345098, 1, 0, 1,
-0.581917, -0.6428898, -1.413526, 0.3372549, 1, 0, 1,
-0.5792905, -0.1442627, -1.254032, 0.3333333, 1, 0, 1,
-0.5790435, 0.1370422, -2.095974, 0.3254902, 1, 0, 1,
-0.5753291, -0.05272024, -2.969723, 0.3215686, 1, 0, 1,
-0.5746593, -0.8693644, -1.659807, 0.3137255, 1, 0, 1,
-0.5644887, -1.66026, -2.202723, 0.3098039, 1, 0, 1,
-0.5615079, 1.709796, -1.060409, 0.3019608, 1, 0, 1,
-0.5583775, -1.04168, -2.586273, 0.2941177, 1, 0, 1,
-0.5496329, -0.3271368, -1.989705, 0.2901961, 1, 0, 1,
-0.5461535, 0.7119517, -0.1418539, 0.282353, 1, 0, 1,
-0.5428517, -0.5735645, -2.261688, 0.2784314, 1, 0, 1,
-0.5388221, 1.093818, -0.4804965, 0.2705882, 1, 0, 1,
-0.5344421, 0.3727819, -1.360529, 0.2666667, 1, 0, 1,
-0.5344088, 0.1278723, -0.9242662, 0.2588235, 1, 0, 1,
-0.5320352, -0.6860997, -2.129019, 0.254902, 1, 0, 1,
-0.5307227, -2.02033, -3.593014, 0.2470588, 1, 0, 1,
-0.5244874, -0.4235623, 0.1358745, 0.2431373, 1, 0, 1,
-0.524319, 0.3159523, -2.159286, 0.2352941, 1, 0, 1,
-0.5241698, -1.159634, -1.738001, 0.2313726, 1, 0, 1,
-0.5221134, 1.56458, 1.413568, 0.2235294, 1, 0, 1,
-0.5177395, 1.10311, 0.8875995, 0.2196078, 1, 0, 1,
-0.5130357, -0.1128545, -1.950294, 0.2117647, 1, 0, 1,
-0.5091844, 2.055172, -1.404081, 0.2078431, 1, 0, 1,
-0.5081473, 0.2101137, -1.388868, 0.2, 1, 0, 1,
-0.5055301, 0.35411, -0.9459576, 0.1921569, 1, 0, 1,
-0.5046751, -1.648739, -3.089794, 0.1882353, 1, 0, 1,
-0.5017368, 1.28607, 0.04417123, 0.1803922, 1, 0, 1,
-0.5012673, 1.437521, -1.586775, 0.1764706, 1, 0, 1,
-0.4970367, -3.559649, -4.054976, 0.1686275, 1, 0, 1,
-0.4962621, 1.484805, -0.7785306, 0.1647059, 1, 0, 1,
-0.496023, -0.6769762, -3.995018, 0.1568628, 1, 0, 1,
-0.4959605, 0.2919805, -0.7252852, 0.1529412, 1, 0, 1,
-0.489726, -1.130366, -2.197468, 0.145098, 1, 0, 1,
-0.4847133, 1.130155, -1.416064, 0.1411765, 1, 0, 1,
-0.481133, -1.848526, -3.544436, 0.1333333, 1, 0, 1,
-0.4803999, -0.7010026, -3.909754, 0.1294118, 1, 0, 1,
-0.4776132, -0.4232263, -3.614545, 0.1215686, 1, 0, 1,
-0.4771582, -0.1643655, -2.828073, 0.1176471, 1, 0, 1,
-0.4767944, -1.885079, -3.067967, 0.1098039, 1, 0, 1,
-0.4746607, -0.01827805, -1.771547, 0.1058824, 1, 0, 1,
-0.4732625, 0.05789441, -1.915259, 0.09803922, 1, 0, 1,
-0.4703153, -0.1940346, -2.658634, 0.09019608, 1, 0, 1,
-0.4671727, -1.377214, -2.098776, 0.08627451, 1, 0, 1,
-0.4636476, -0.467691, -2.154635, 0.07843138, 1, 0, 1,
-0.4631907, 0.9853253, -0.638274, 0.07450981, 1, 0, 1,
-0.4592062, 0.4957028, -0.1423005, 0.06666667, 1, 0, 1,
-0.4586961, 0.5823134, -0.5330986, 0.0627451, 1, 0, 1,
-0.4579422, -0.2986601, -0.9023254, 0.05490196, 1, 0, 1,
-0.4555664, 0.9885074, -2.252104, 0.05098039, 1, 0, 1,
-0.4547754, 1.032205, -3.614743, 0.04313726, 1, 0, 1,
-0.4516758, -1.812701, -3.732104, 0.03921569, 1, 0, 1,
-0.4512719, -0.4496644, -1.912446, 0.03137255, 1, 0, 1,
-0.4507467, 0.73111, -0.1860522, 0.02745098, 1, 0, 1,
-0.4432887, 1.011682, -0.1121433, 0.01960784, 1, 0, 1,
-0.442818, 0.8143313, -0.4851397, 0.01568628, 1, 0, 1,
-0.4419678, -0.8244396, -2.466245, 0.007843138, 1, 0, 1,
-0.4362412, 0.0343351, -0.6268973, 0.003921569, 1, 0, 1,
-0.4319734, 0.6421535, 1.954414, 0, 1, 0.003921569, 1,
-0.4258719, 0.7344164, 0.1172015, 0, 1, 0.01176471, 1,
-0.4258295, 0.4996993, -0.4199533, 0, 1, 0.01568628, 1,
-0.4239707, -1.231812, -3.5297, 0, 1, 0.02352941, 1,
-0.4195149, -1.733503, -2.666795, 0, 1, 0.02745098, 1,
-0.4024755, 0.8159186, -0.7383074, 0, 1, 0.03529412, 1,
-0.4018452, -0.7024551, -4.265793, 0, 1, 0.03921569, 1,
-0.3943485, -0.5143709, -2.176272, 0, 1, 0.04705882, 1,
-0.3915757, 1.049061, -0.5616468, 0, 1, 0.05098039, 1,
-0.3891068, -0.4181639, -2.732449, 0, 1, 0.05882353, 1,
-0.3868191, -0.6588135, -0.741545, 0, 1, 0.0627451, 1,
-0.3823764, 0.8462995, 0.2433941, 0, 1, 0.07058824, 1,
-0.3815269, -0.7763724, -1.482724, 0, 1, 0.07450981, 1,
-0.3794459, 1.38653, -0.2914447, 0, 1, 0.08235294, 1,
-0.379409, 0.6951145, -1.019394, 0, 1, 0.08627451, 1,
-0.3775695, 1.981486, -1.460861, 0, 1, 0.09411765, 1,
-0.3774747, -2.287694, -2.274388, 0, 1, 0.1019608, 1,
-0.3756407, 0.707606, -0.4914042, 0, 1, 0.1058824, 1,
-0.3750472, 0.2542437, 1.427913, 0, 1, 0.1137255, 1,
-0.3703364, 0.844408, -0.6142239, 0, 1, 0.1176471, 1,
-0.3630936, 0.1718241, -1.643107, 0, 1, 0.1254902, 1,
-0.362868, -0.5401354, -4.308482, 0, 1, 0.1294118, 1,
-0.3604558, -1.702018, -1.817499, 0, 1, 0.1372549, 1,
-0.3599861, 0.5597512, 1.015932, 0, 1, 0.1411765, 1,
-0.3577787, -0.01340438, -1.840361, 0, 1, 0.1490196, 1,
-0.3561125, 0.4909908, 1.327141, 0, 1, 0.1529412, 1,
-0.3539949, -1.748872, -2.475105, 0, 1, 0.1607843, 1,
-0.3529099, -0.6901944, -3.23806, 0, 1, 0.1647059, 1,
-0.3454619, 0.1039975, -0.9507833, 0, 1, 0.172549, 1,
-0.3450612, 0.1321525, -0.8932356, 0, 1, 0.1764706, 1,
-0.3379806, -0.1539874, -3.319763, 0, 1, 0.1843137, 1,
-0.3358087, 0.1871631, 0.2458916, 0, 1, 0.1882353, 1,
-0.335579, 0.7399677, -1.35014, 0, 1, 0.1960784, 1,
-0.33277, -0.5612827, -3.420787, 0, 1, 0.2039216, 1,
-0.3321236, -0.2332934, -3.926504, 0, 1, 0.2078431, 1,
-0.3293276, 0.7658557, -0.8823388, 0, 1, 0.2156863, 1,
-0.3287148, -0.5186107, -3.446976, 0, 1, 0.2196078, 1,
-0.3278358, 0.843786, 0.2141805, 0, 1, 0.227451, 1,
-0.3251718, -0.03571973, -2.024393, 0, 1, 0.2313726, 1,
-0.3216421, 0.1494668, -0.3593643, 0, 1, 0.2392157, 1,
-0.3177782, 2.694273, -0.383936, 0, 1, 0.2431373, 1,
-0.3120884, -0.5236366, -0.2313519, 0, 1, 0.2509804, 1,
-0.2989886, -0.4123357, -2.54036, 0, 1, 0.254902, 1,
-0.297929, 0.1881892, -2.32234, 0, 1, 0.2627451, 1,
-0.2957188, 1.457341, -0.432519, 0, 1, 0.2666667, 1,
-0.2948903, 0.6864922, -1.205643, 0, 1, 0.2745098, 1,
-0.2862732, 0.1530893, -0.7203053, 0, 1, 0.2784314, 1,
-0.2844661, -1.538679, -2.902261, 0, 1, 0.2862745, 1,
-0.2816734, -1.405824, -4.679711, 0, 1, 0.2901961, 1,
-0.2806652, -1.076636, -2.851411, 0, 1, 0.2980392, 1,
-0.2782332, -1.175601, -1.860727, 0, 1, 0.3058824, 1,
-0.2744386, 1.164859, -1.663437, 0, 1, 0.3098039, 1,
-0.2678346, 0.6139761, 0.4605882, 0, 1, 0.3176471, 1,
-0.2666893, 0.1613442, 0.05645139, 0, 1, 0.3215686, 1,
-0.2634665, 0.003436361, -2.59582, 0, 1, 0.3294118, 1,
-0.2611291, 1.444691, 1.105356, 0, 1, 0.3333333, 1,
-0.2561587, 0.8127985, -0.5841015, 0, 1, 0.3411765, 1,
-0.2540889, 0.08135982, -2.488868, 0, 1, 0.345098, 1,
-0.2537566, 0.179527, -3.35613, 0, 1, 0.3529412, 1,
-0.2490016, 0.1321899, -1.065734, 0, 1, 0.3568628, 1,
-0.2469799, 1.022747, 0.5597752, 0, 1, 0.3647059, 1,
-0.2462048, 2.248821, 2.411919, 0, 1, 0.3686275, 1,
-0.2448153, 2.420965, 0.2629039, 0, 1, 0.3764706, 1,
-0.2429441, 0.6782752, -0.5722401, 0, 1, 0.3803922, 1,
-0.2412582, -0.8010759, -3.542158, 0, 1, 0.3882353, 1,
-0.2388664, 0.09916989, -0.09526324, 0, 1, 0.3921569, 1,
-0.2365804, 0.4116877, 0.2732351, 0, 1, 0.4, 1,
-0.2334793, -1.000299, -3.506591, 0, 1, 0.4078431, 1,
-0.2326021, 0.5205873, 0.6943165, 0, 1, 0.4117647, 1,
-0.2244451, -0.3882557, -0.7430846, 0, 1, 0.4196078, 1,
-0.2199762, 0.02698881, -0.6501931, 0, 1, 0.4235294, 1,
-0.21735, 1.240992, 1.0584, 0, 1, 0.4313726, 1,
-0.2163498, 1.138932, -0.07636139, 0, 1, 0.4352941, 1,
-0.2156193, 3.82074, 0.6001577, 0, 1, 0.4431373, 1,
-0.2136959, 0.2822517, 0.2450334, 0, 1, 0.4470588, 1,
-0.212435, -0.9992112, -0.988952, 0, 1, 0.454902, 1,
-0.2059484, 0.2048861, -0.3532074, 0, 1, 0.4588235, 1,
-0.2031126, -0.8747777, -3.880257, 0, 1, 0.4666667, 1,
-0.2014833, 0.9804383, -0.5037573, 0, 1, 0.4705882, 1,
-0.2008775, 1.749688, 0.2569372, 0, 1, 0.4784314, 1,
-0.2000156, 0.06532167, -2.111429, 0, 1, 0.4823529, 1,
-0.1980505, 0.1663173, -1.235679, 0, 1, 0.4901961, 1,
-0.1969256, -0.3217632, -2.240675, 0, 1, 0.4941176, 1,
-0.1948838, 1.264306, -0.1103458, 0, 1, 0.5019608, 1,
-0.185555, 0.699743, -1.218103, 0, 1, 0.509804, 1,
-0.1804856, -0.8323103, -3.947724, 0, 1, 0.5137255, 1,
-0.1746097, -0.5222414, -1.941268, 0, 1, 0.5215687, 1,
-0.1695418, -0.9884303, -1.898299, 0, 1, 0.5254902, 1,
-0.1562369, -0.7501522, -2.562512, 0, 1, 0.5333334, 1,
-0.1540546, 0.8192945, -0.1791414, 0, 1, 0.5372549, 1,
-0.1523779, 1.502761, -1.538245, 0, 1, 0.5450981, 1,
-0.1482054, 0.7850937, 1.716873, 0, 1, 0.5490196, 1,
-0.1469351, 2.035384, -0.2795084, 0, 1, 0.5568628, 1,
-0.1446346, 1.254092, -0.7123058, 0, 1, 0.5607843, 1,
-0.1409248, -1.257514, -3.996744, 0, 1, 0.5686275, 1,
-0.1398447, 0.4451852, -0.3991776, 0, 1, 0.572549, 1,
-0.1396909, 0.6942676, 0.9733774, 0, 1, 0.5803922, 1,
-0.1332688, -1.461513, -2.375933, 0, 1, 0.5843138, 1,
-0.1328163, 1.337853, -0.6672459, 0, 1, 0.5921569, 1,
-0.1327718, -2.64749, -2.518414, 0, 1, 0.5960785, 1,
-0.1134109, -1.158163, -3.888136, 0, 1, 0.6039216, 1,
-0.1132443, -1.664426, -3.121875, 0, 1, 0.6117647, 1,
-0.1101537, -0.232308, -2.846687, 0, 1, 0.6156863, 1,
-0.1065146, 0.7001249, 0.8286639, 0, 1, 0.6235294, 1,
-0.1063224, -0.8487253, -3.455621, 0, 1, 0.627451, 1,
-0.1033456, -0.3387162, -3.079132, 0, 1, 0.6352941, 1,
-0.1010692, 1.068838, 0.9167823, 0, 1, 0.6392157, 1,
-0.1005404, 0.7326165, 0.9829187, 0, 1, 0.6470588, 1,
-0.1005037, 0.02803109, -3.372646, 0, 1, 0.6509804, 1,
-0.09967092, -1.717995, -0.6038333, 0, 1, 0.6588235, 1,
-0.09891062, 1.235959, 1.157113, 0, 1, 0.6627451, 1,
-0.09589262, -1.67644, -2.905958, 0, 1, 0.6705883, 1,
-0.09452718, 0.7224745, 0.4224941, 0, 1, 0.6745098, 1,
-0.09383686, -2.180212, -1.039373, 0, 1, 0.682353, 1,
-0.09295708, 0.7986258, -0.7451707, 0, 1, 0.6862745, 1,
-0.08979509, -1.44158, -4.873666, 0, 1, 0.6941177, 1,
-0.08718497, 0.5524123, -0.1760831, 0, 1, 0.7019608, 1,
-0.0815323, 1.724164, -0.7084597, 0, 1, 0.7058824, 1,
-0.0793466, 0.1122903, 1.158363, 0, 1, 0.7137255, 1,
-0.07748853, 1.842993, 0.8118949, 0, 1, 0.7176471, 1,
-0.07529109, -1.144276, -3.915234, 0, 1, 0.7254902, 1,
-0.07482049, 1.515824, 0.7383853, 0, 1, 0.7294118, 1,
-0.07389455, -0.1679074, -1.362873, 0, 1, 0.7372549, 1,
-0.07056504, -1.080754, -4.98582, 0, 1, 0.7411765, 1,
-0.07046216, -0.0574277, -2.34373, 0, 1, 0.7490196, 1,
-0.06304735, 1.322369, 0.4224767, 0, 1, 0.7529412, 1,
-0.06232961, -0.2478117, -1.75304, 0, 1, 0.7607843, 1,
-0.06031029, -0.7596794, -2.573989, 0, 1, 0.7647059, 1,
-0.05935683, 2.883016, -0.01431812, 0, 1, 0.772549, 1,
-0.05863635, -1.388418, -2.731401, 0, 1, 0.7764706, 1,
-0.05820467, 1.814338, 0.1366659, 0, 1, 0.7843137, 1,
-0.05246335, -0.1137611, -1.460618, 0, 1, 0.7882353, 1,
-0.05245675, 0.4963837, -1.197655, 0, 1, 0.7960784, 1,
-0.04609832, -0.2560242, -2.100355, 0, 1, 0.8039216, 1,
-0.04078368, -2.750705, -2.218591, 0, 1, 0.8078431, 1,
-0.03925867, 1.369994, 0.5068194, 0, 1, 0.8156863, 1,
-0.03722606, 0.6498119, -0.6689163, 0, 1, 0.8196079, 1,
-0.03631296, 1.285786, 0.8025634, 0, 1, 0.827451, 1,
-0.0345628, 0.5234685, 0.8246791, 0, 1, 0.8313726, 1,
-0.03304654, 2.548795, 1.152236, 0, 1, 0.8392157, 1,
-0.03065152, 0.920709, -0.1675089, 0, 1, 0.8431373, 1,
-0.02870305, -1.330385, -2.731656, 0, 1, 0.8509804, 1,
-0.02749358, -0.08223522, -2.984954, 0, 1, 0.854902, 1,
-0.02747115, -0.5199572, -2.202194, 0, 1, 0.8627451, 1,
-0.0256736, 1.535071, 0.3250157, 0, 1, 0.8666667, 1,
-0.02344909, -1.829359, -1.6235, 0, 1, 0.8745098, 1,
-0.02131561, 0.3349422, -0.7158129, 0, 1, 0.8784314, 1,
-0.01986754, -0.4266589, -2.775277, 0, 1, 0.8862745, 1,
-0.01975778, -1.048237, -3.618659, 0, 1, 0.8901961, 1,
-0.01787512, 0.3118593, -0.4762636, 0, 1, 0.8980392, 1,
-0.01778838, 0.0980396, -0.47577, 0, 1, 0.9058824, 1,
-0.0125422, 0.2387371, 1.164801, 0, 1, 0.9098039, 1,
-0.01124828, 0.9286848, -0.4794793, 0, 1, 0.9176471, 1,
-0.009488575, 0.3605029, 1.710703, 0, 1, 0.9215686, 1,
-0.008122412, -0.4854825, -2.380252, 0, 1, 0.9294118, 1,
-0.00535914, 0.9322509, -0.04143071, 0, 1, 0.9333333, 1,
-0.003073051, -0.6425592, -3.209342, 0, 1, 0.9411765, 1,
-0.001322732, 0.1054177, -0.756038, 0, 1, 0.945098, 1,
-5.949488e-05, 0.09663579, -2.021678, 0, 1, 0.9529412, 1,
0.001277177, 0.002432117, 0.6302367, 0, 1, 0.9568627, 1,
0.001773912, -0.2958283, 5.003815, 0, 1, 0.9647059, 1,
0.01172928, -0.6658413, 2.921852, 0, 1, 0.9686275, 1,
0.0158832, -0.4012343, 1.392257, 0, 1, 0.9764706, 1,
0.01834903, 0.1029409, 1.04059, 0, 1, 0.9803922, 1,
0.02109557, 1.266996, 0.1847439, 0, 1, 0.9882353, 1,
0.02218586, -0.8807908, 2.470581, 0, 1, 0.9921569, 1,
0.02328068, 0.6017362, -2.187209, 0, 1, 1, 1,
0.03101358, -0.4574217, 1.63591, 0, 0.9921569, 1, 1,
0.0323819, -0.7754506, 3.046868, 0, 0.9882353, 1, 1,
0.03340204, 0.2255845, 1.451433, 0, 0.9803922, 1, 1,
0.03574257, -1.237756, 3.764887, 0, 0.9764706, 1, 1,
0.03620487, 0.571911, -0.4390807, 0, 0.9686275, 1, 1,
0.03891893, 1.978047, 0.04709977, 0, 0.9647059, 1, 1,
0.05024786, -0.7067865, 4.96725, 0, 0.9568627, 1, 1,
0.05262453, 1.761108, 0.6580306, 0, 0.9529412, 1, 1,
0.0527923, 1.335226, 1.607889, 0, 0.945098, 1, 1,
0.053723, -0.376324, 3.934683, 0, 0.9411765, 1, 1,
0.05571528, -0.6799752, 4.194729, 0, 0.9333333, 1, 1,
0.05706063, -0.6348631, 3.013654, 0, 0.9294118, 1, 1,
0.06539334, -0.2661611, 6.419516, 0, 0.9215686, 1, 1,
0.07450613, -1.557981, 3.615424, 0, 0.9176471, 1, 1,
0.07478455, -0.7697751, 2.620219, 0, 0.9098039, 1, 1,
0.07577384, 1.417674, -0.4563726, 0, 0.9058824, 1, 1,
0.07701449, 1.310746, 0.714724, 0, 0.8980392, 1, 1,
0.07867081, 0.6792502, 0.4763441, 0, 0.8901961, 1, 1,
0.08577144, 0.01444039, 0.1227978, 0, 0.8862745, 1, 1,
0.08757786, -0.5780187, 2.845785, 0, 0.8784314, 1, 1,
0.08758067, -0.7253737, 2.963298, 0, 0.8745098, 1, 1,
0.09149334, -0.6501827, 2.705888, 0, 0.8666667, 1, 1,
0.09363081, 0.477116, 0.9643266, 0, 0.8627451, 1, 1,
0.09545203, -0.9724432, 4.311949, 0, 0.854902, 1, 1,
0.1013938, 1.735193, -1.012491, 0, 0.8509804, 1, 1,
0.1035279, 0.7632014, -0.8830367, 0, 0.8431373, 1, 1,
0.1036276, 0.4001766, -0.7102568, 0, 0.8392157, 1, 1,
0.103825, 0.6669887, 0.280562, 0, 0.8313726, 1, 1,
0.1061009, 0.5836371, -1.775224, 0, 0.827451, 1, 1,
0.1061825, 0.8483503, -0.08627176, 0, 0.8196079, 1, 1,
0.1072084, -0.1232713, 2.561104, 0, 0.8156863, 1, 1,
0.1073875, -1.441615, 4.241249, 0, 0.8078431, 1, 1,
0.1092285, 0.172322, 0.3229353, 0, 0.8039216, 1, 1,
0.1146569, 0.06241438, 0.5624969, 0, 0.7960784, 1, 1,
0.1200928, 1.074367, 0.6615133, 0, 0.7882353, 1, 1,
0.1242341, 1.927324, -1.320556, 0, 0.7843137, 1, 1,
0.1304769, -0.4671242, 4.012365, 0, 0.7764706, 1, 1,
0.136023, 0.06812666, 1.32175, 0, 0.772549, 1, 1,
0.1374664, -0.1471527, 4.285868, 0, 0.7647059, 1, 1,
0.138805, -1.764826, 5.100434, 0, 0.7607843, 1, 1,
0.1409601, -1.246459, 3.852602, 0, 0.7529412, 1, 1,
0.1448847, -0.82753, 4.313948, 0, 0.7490196, 1, 1,
0.1467562, 0.8459188, -0.08409603, 0, 0.7411765, 1, 1,
0.147283, 0.2290916, 0.004778617, 0, 0.7372549, 1, 1,
0.1493441, 0.8412527, 0.2043731, 0, 0.7294118, 1, 1,
0.1495441, -0.9598179, 3.598735, 0, 0.7254902, 1, 1,
0.1501295, 1.03012, -0.72111, 0, 0.7176471, 1, 1,
0.1544822, -0.01913253, 0.2875988, 0, 0.7137255, 1, 1,
0.1555417, -0.3057193, 1.573353, 0, 0.7058824, 1, 1,
0.1569173, -0.004608385, 2.85546, 0, 0.6980392, 1, 1,
0.1607017, -0.4937439, 2.999193, 0, 0.6941177, 1, 1,
0.1618187, 0.5964435, 0.7471719, 0, 0.6862745, 1, 1,
0.1626325, 1.674028, 1.312597, 0, 0.682353, 1, 1,
0.1689887, 0.9178932, 0.3891826, 0, 0.6745098, 1, 1,
0.169394, -0.5063016, 1.861961, 0, 0.6705883, 1, 1,
0.1754678, 0.5662197, 1.809392, 0, 0.6627451, 1, 1,
0.1772045, 0.2201033, 0.5059977, 0, 0.6588235, 1, 1,
0.178422, 0.2677885, -0.6651791, 0, 0.6509804, 1, 1,
0.1822481, -1.566614, 4.227083, 0, 0.6470588, 1, 1,
0.1827668, -0.6411994, 3.981089, 0, 0.6392157, 1, 1,
0.1836048, -0.1049389, 2.976465, 0, 0.6352941, 1, 1,
0.1862367, -0.3537403, 1.738645, 0, 0.627451, 1, 1,
0.1878242, -0.4261387, 2.702008, 0, 0.6235294, 1, 1,
0.19248, -0.5578156, 1.692105, 0, 0.6156863, 1, 1,
0.1928781, -0.3306203, 3.064356, 0, 0.6117647, 1, 1,
0.1941675, -0.3084182, 3.326714, 0, 0.6039216, 1, 1,
0.2003156, -3.471176, 3.736507, 0, 0.5960785, 1, 1,
0.2032645, -1.198897, 4.545875, 0, 0.5921569, 1, 1,
0.2037804, -0.2238493, 0.2439031, 0, 0.5843138, 1, 1,
0.2118091, -0.2190343, 3.062965, 0, 0.5803922, 1, 1,
0.2137221, 0.8097028, 2.000619, 0, 0.572549, 1, 1,
0.2159942, 1.362227, -0.0156078, 0, 0.5686275, 1, 1,
0.2204458, 0.8304573, 0.06366666, 0, 0.5607843, 1, 1,
0.2231795, -0.09948505, 3.537879, 0, 0.5568628, 1, 1,
0.2260889, 0.7800311, -0.2039707, 0, 0.5490196, 1, 1,
0.2301712, -0.2790138, 1.601107, 0, 0.5450981, 1, 1,
0.233384, -1.061792, 1.489254, 0, 0.5372549, 1, 1,
0.2338026, 1.506167, 1.020415, 0, 0.5333334, 1, 1,
0.237108, -1.485691, 4.781762, 0, 0.5254902, 1, 1,
0.2388853, -1.253704, 3.298107, 0, 0.5215687, 1, 1,
0.2398145, -0.4450362, 2.357474, 0, 0.5137255, 1, 1,
0.2415076, 0.01768794, 2.30394, 0, 0.509804, 1, 1,
0.254306, 0.452796, -0.03858793, 0, 0.5019608, 1, 1,
0.2618532, -2.441671, 2.162102, 0, 0.4941176, 1, 1,
0.2625751, -0.1500439, 0.4137977, 0, 0.4901961, 1, 1,
0.2675033, 0.1426203, 1.527041, 0, 0.4823529, 1, 1,
0.267899, 1.69427, -0.9727424, 0, 0.4784314, 1, 1,
0.2688785, 0.9120915, 1.272841, 0, 0.4705882, 1, 1,
0.2700803, 0.4481694, 1.359112, 0, 0.4666667, 1, 1,
0.2715001, 1.581402, 1.15338, 0, 0.4588235, 1, 1,
0.2740578, 0.01613908, 0.3957311, 0, 0.454902, 1, 1,
0.2781264, -2.130924, 2.098314, 0, 0.4470588, 1, 1,
0.2801723, -2.384153, 2.993576, 0, 0.4431373, 1, 1,
0.2812281, -0.5278271, 2.106465, 0, 0.4352941, 1, 1,
0.2883581, -1.668967, 1.996646, 0, 0.4313726, 1, 1,
0.2884236, 0.3230694, -0.5484759, 0, 0.4235294, 1, 1,
0.2892039, 0.6786645, 1.158192, 0, 0.4196078, 1, 1,
0.2898403, 0.8311297, -0.3063943, 0, 0.4117647, 1, 1,
0.2983549, -0.02955253, -0.6743284, 0, 0.4078431, 1, 1,
0.3003317, 0.9333992, -0.1315038, 0, 0.4, 1, 1,
0.3098277, -1.031637, 3.885067, 0, 0.3921569, 1, 1,
0.3115506, 0.4716014, 0.1794732, 0, 0.3882353, 1, 1,
0.3136123, -0.547033, 2.703745, 0, 0.3803922, 1, 1,
0.314196, -0.1165287, 2.10658, 0, 0.3764706, 1, 1,
0.3144853, -0.06406879, 1.162998, 0, 0.3686275, 1, 1,
0.3161674, 0.3674074, 0.6178927, 0, 0.3647059, 1, 1,
0.3170491, -0.4545733, 1.499271, 0, 0.3568628, 1, 1,
0.32264, 0.8174583, -0.601478, 0, 0.3529412, 1, 1,
0.3289157, -0.7475751, 2.972292, 0, 0.345098, 1, 1,
0.3299307, -1.13321, 3.580642, 0, 0.3411765, 1, 1,
0.3334943, -1.309597, 1.348168, 0, 0.3333333, 1, 1,
0.3363594, -0.3512474, 1.055635, 0, 0.3294118, 1, 1,
0.3376863, -1.245148, 2.424211, 0, 0.3215686, 1, 1,
0.339231, 0.143159, -0.3153027, 0, 0.3176471, 1, 1,
0.3405823, -0.5160719, 4.627332, 0, 0.3098039, 1, 1,
0.3445133, 1.708599, -1.279793, 0, 0.3058824, 1, 1,
0.3567702, 0.4906301, 1.101387, 0, 0.2980392, 1, 1,
0.3577009, 0.5444779, 1.108251, 0, 0.2901961, 1, 1,
0.3597205, 2.150422, 1.456129, 0, 0.2862745, 1, 1,
0.3603073, -0.6638343, 3.404494, 0, 0.2784314, 1, 1,
0.3624744, -0.3169217, 1.310383, 0, 0.2745098, 1, 1,
0.3626228, -0.5989682, 4.120303, 0, 0.2666667, 1, 1,
0.3667686, -1.762213, 2.745997, 0, 0.2627451, 1, 1,
0.367178, -2.228948, 3.928207, 0, 0.254902, 1, 1,
0.3706599, -1.012867, 2.667372, 0, 0.2509804, 1, 1,
0.3835649, -1.217179, 3.798607, 0, 0.2431373, 1, 1,
0.3837076, -0.4603856, 1.475932, 0, 0.2392157, 1, 1,
0.3840972, 0.5579901, 0.9820467, 0, 0.2313726, 1, 1,
0.3857194, 1.147176, 0.00628288, 0, 0.227451, 1, 1,
0.3864703, -0.1180335, 2.311932, 0, 0.2196078, 1, 1,
0.3865976, 0.859354, 0.8309402, 0, 0.2156863, 1, 1,
0.3888704, -0.3432078, 3.112669, 0, 0.2078431, 1, 1,
0.3893534, 0.273679, 1.887866, 0, 0.2039216, 1, 1,
0.3894973, -0.7127191, 1.781736, 0, 0.1960784, 1, 1,
0.3907308, 2.648767, -1.214963, 0, 0.1882353, 1, 1,
0.3941574, -0.5308821, 2.238398, 0, 0.1843137, 1, 1,
0.3953184, 0.2995742, 3.095596, 0, 0.1764706, 1, 1,
0.4036195, -0.7381362, 3.29842, 0, 0.172549, 1, 1,
0.4090863, -1.237676, 2.379428, 0, 0.1647059, 1, 1,
0.4119079, -0.869727, 2.31892, 0, 0.1607843, 1, 1,
0.4125528, 1.802826, -0.8027111, 0, 0.1529412, 1, 1,
0.4148416, 0.5694332, 2.64139, 0, 0.1490196, 1, 1,
0.4149744, -1.250059, 2.630408, 0, 0.1411765, 1, 1,
0.4164719, 0.5246184, 1.531115, 0, 0.1372549, 1, 1,
0.4185935, 0.4105026, 2.781434, 0, 0.1294118, 1, 1,
0.4193772, -0.361002, 2.173824, 0, 0.1254902, 1, 1,
0.4195918, -0.0959156, 2.216319, 0, 0.1176471, 1, 1,
0.4235543, -0.5346922, 3.717891, 0, 0.1137255, 1, 1,
0.4243423, -1.132593, 3.365202, 0, 0.1058824, 1, 1,
0.4249085, 0.7534165, -0.2948689, 0, 0.09803922, 1, 1,
0.4280411, 0.9193705, 1.464241, 0, 0.09411765, 1, 1,
0.4284593, -1.012995, 2.942685, 0, 0.08627451, 1, 1,
0.4303406, -0.03334644, 1.294642, 0, 0.08235294, 1, 1,
0.4328473, -0.5329802, 0.6395666, 0, 0.07450981, 1, 1,
0.4329593, 0.248734, 2.663112, 0, 0.07058824, 1, 1,
0.4331748, -1.660852, 2.010893, 0, 0.0627451, 1, 1,
0.4338432, 2.440546, -1.42317, 0, 0.05882353, 1, 1,
0.4403729, 0.1183678, -0.08190155, 0, 0.05098039, 1, 1,
0.4451505, 1.154566, 0.348927, 0, 0.04705882, 1, 1,
0.4533964, -0.4097861, 1.482238, 0, 0.03921569, 1, 1,
0.4575554, 0.4491653, 0.5491387, 0, 0.03529412, 1, 1,
0.4613156, -0.381759, 1.579428, 0, 0.02745098, 1, 1,
0.4616843, 0.4762227, 1.322064, 0, 0.02352941, 1, 1,
0.4637979, -0.2680995, 2.619087, 0, 0.01568628, 1, 1,
0.4659355, -0.6381052, 1.19796, 0, 0.01176471, 1, 1,
0.4662223, -0.191943, 1.808863, 0, 0.003921569, 1, 1,
0.4686084, 1.302847, 0.3951998, 0.003921569, 0, 1, 1,
0.4710799, -0.06519407, 2.310808, 0.007843138, 0, 1, 1,
0.4726697, -2.947937, 4.784223, 0.01568628, 0, 1, 1,
0.4739818, -2.410982, 2.740638, 0.01960784, 0, 1, 1,
0.4741827, -0.06241952, 1.479189, 0.02745098, 0, 1, 1,
0.474341, 1.166143, 2.085391, 0.03137255, 0, 1, 1,
0.4758997, -1.108258, 0.09871911, 0.03921569, 0, 1, 1,
0.4760371, 0.4599962, 0.2295717, 0.04313726, 0, 1, 1,
0.4774673, 0.07730306, 1.547847, 0.05098039, 0, 1, 1,
0.4775326, 1.69734, 0.1025859, 0.05490196, 0, 1, 1,
0.4784125, -0.7624788, 1.229558, 0.0627451, 0, 1, 1,
0.4890643, 0.9775264, 1.198481, 0.06666667, 0, 1, 1,
0.4904559, -0.01944084, 0.06544868, 0.07450981, 0, 1, 1,
0.4936871, 1.368609, 0.2152374, 0.07843138, 0, 1, 1,
0.4998019, -1.44544, 0.6155387, 0.08627451, 0, 1, 1,
0.5005053, -0.1209646, 3.242113, 0.09019608, 0, 1, 1,
0.5007461, 0.9091224, 0.4506733, 0.09803922, 0, 1, 1,
0.5020249, -1.055437, 2.295462, 0.1058824, 0, 1, 1,
0.5032572, -0.4916559, 2.549335, 0.1098039, 0, 1, 1,
0.5076156, -0.7218958, 3.530472, 0.1176471, 0, 1, 1,
0.5080528, 0.7810799, -0.4013231, 0.1215686, 0, 1, 1,
0.5084258, 0.3666348, 1.8147, 0.1294118, 0, 1, 1,
0.518311, -0.8881841, 4.359097, 0.1333333, 0, 1, 1,
0.5207018, 2.471636, -1.491141, 0.1411765, 0, 1, 1,
0.530644, 0.1692809, -0.4014695, 0.145098, 0, 1, 1,
0.5326997, 0.565027, 0.09098721, 0.1529412, 0, 1, 1,
0.5352098, 0.3622884, 0.6946415, 0.1568628, 0, 1, 1,
0.5378287, -0.5289617, 2.284875, 0.1647059, 0, 1, 1,
0.540675, -1.033487, 1.417294, 0.1686275, 0, 1, 1,
0.545369, -0.4911247, 3.387124, 0.1764706, 0, 1, 1,
0.5477676, -0.04416312, 0.9667156, 0.1803922, 0, 1, 1,
0.5493802, -0.2431567, 1.8346, 0.1882353, 0, 1, 1,
0.5499358, -1.554142, 2.639536, 0.1921569, 0, 1, 1,
0.5508895, -0.4776558, 2.438687, 0.2, 0, 1, 1,
0.5514751, -0.4084502, 2.489747, 0.2078431, 0, 1, 1,
0.5521821, 1.243158, 0.2801328, 0.2117647, 0, 1, 1,
0.5579621, 1.433921, -0.870432, 0.2196078, 0, 1, 1,
0.561639, -0.01604383, 3.143587, 0.2235294, 0, 1, 1,
0.5629106, -0.6912356, 2.210136, 0.2313726, 0, 1, 1,
0.5630371, -0.2141041, 1.857381, 0.2352941, 0, 1, 1,
0.5642572, 0.04827261, 1.302364, 0.2431373, 0, 1, 1,
0.5650731, 0.19159, 2.024319, 0.2470588, 0, 1, 1,
0.5666374, -0.9161114, 2.685327, 0.254902, 0, 1, 1,
0.5672033, 1.187117, 0.008237838, 0.2588235, 0, 1, 1,
0.5713309, -0.5062439, 3.290486, 0.2666667, 0, 1, 1,
0.5746316, 1.279928, 1.050567, 0.2705882, 0, 1, 1,
0.5753435, -1.463637, 1.877565, 0.2784314, 0, 1, 1,
0.5767892, 0.1301167, 1.427686, 0.282353, 0, 1, 1,
0.5813838, 0.4737157, -0.4267507, 0.2901961, 0, 1, 1,
0.5823616, -0.9168025, 2.703729, 0.2941177, 0, 1, 1,
0.5891228, 0.3849334, 2.032389, 0.3019608, 0, 1, 1,
0.5903091, -0.681052, 2.617293, 0.3098039, 0, 1, 1,
0.5993094, 0.6432862, 0.464942, 0.3137255, 0, 1, 1,
0.6000361, 0.002496494, 3.352597, 0.3215686, 0, 1, 1,
0.602708, -2.20044, 1.278801, 0.3254902, 0, 1, 1,
0.6058481, 1.210056, 0.933199, 0.3333333, 0, 1, 1,
0.6067369, 0.1390861, 0.9386876, 0.3372549, 0, 1, 1,
0.6078852, 0.7023211, 0.8544534, 0.345098, 0, 1, 1,
0.6106707, 1.959537, 1.013341, 0.3490196, 0, 1, 1,
0.6118122, -1.308657, 2.287264, 0.3568628, 0, 1, 1,
0.6163502, 2.098711, 0.8065307, 0.3607843, 0, 1, 1,
0.6177513, 0.0880549, 1.729743, 0.3686275, 0, 1, 1,
0.6192928, -1.271127, 3.715102, 0.372549, 0, 1, 1,
0.6287643, -1.438652, 3.664494, 0.3803922, 0, 1, 1,
0.6287804, 0.1723085, 1.557552, 0.3843137, 0, 1, 1,
0.6331289, 0.2533531, 0.7821695, 0.3921569, 0, 1, 1,
0.6344328, 1.283862, -0.2427208, 0.3960784, 0, 1, 1,
0.6352522, -0.292814, 3.831968, 0.4039216, 0, 1, 1,
0.6404377, -0.6708291, 2.68525, 0.4117647, 0, 1, 1,
0.6458895, 2.00651, -0.1632393, 0.4156863, 0, 1, 1,
0.6483043, 0.006785693, 3.576445, 0.4235294, 0, 1, 1,
0.6535597, -0.4340604, 1.166566, 0.427451, 0, 1, 1,
0.6546792, 0.6868341, 0.7656724, 0.4352941, 0, 1, 1,
0.6626741, -0.7645875, 2.996804, 0.4392157, 0, 1, 1,
0.6636478, 0.06011012, 2.460696, 0.4470588, 0, 1, 1,
0.6672812, -0.3208353, 1.82262, 0.4509804, 0, 1, 1,
0.6691009, 0.8867842, -1.043247, 0.4588235, 0, 1, 1,
0.6716956, 1.48753, 0.8866616, 0.4627451, 0, 1, 1,
0.6722886, 0.313973, 3.278016, 0.4705882, 0, 1, 1,
0.6723847, 0.5936774, 1.597353, 0.4745098, 0, 1, 1,
0.6740308, -0.1131533, 1.003581, 0.4823529, 0, 1, 1,
0.6756861, 0.916565, -0.7968102, 0.4862745, 0, 1, 1,
0.6766577, 0.1649275, 1.498574, 0.4941176, 0, 1, 1,
0.6781483, 2.805813, 1.80395, 0.5019608, 0, 1, 1,
0.6797127, -0.8327703, 2.441229, 0.5058824, 0, 1, 1,
0.6815926, -0.1796294, 2.842003, 0.5137255, 0, 1, 1,
0.6824939, 0.02842897, 2.505033, 0.5176471, 0, 1, 1,
0.6838373, -0.05733288, 2.074002, 0.5254902, 0, 1, 1,
0.6838415, -0.4271739, 1.323198, 0.5294118, 0, 1, 1,
0.6851053, 1.059408, 1.618114, 0.5372549, 0, 1, 1,
0.6869421, 0.7535756, -1.28804, 0.5411765, 0, 1, 1,
0.6873668, 0.2338801, -0.1140417, 0.5490196, 0, 1, 1,
0.691249, 0.0456596, 3.319821, 0.5529412, 0, 1, 1,
0.6959107, -1.496977, 2.945537, 0.5607843, 0, 1, 1,
0.6992227, 1.460778, 1.782548, 0.5647059, 0, 1, 1,
0.7009363, 0.3318993, 1.527114, 0.572549, 0, 1, 1,
0.7035531, -1.117175, 2.742951, 0.5764706, 0, 1, 1,
0.7047637, 0.6290887, 0.1712062, 0.5843138, 0, 1, 1,
0.7073346, 0.7811704, 0.8988088, 0.5882353, 0, 1, 1,
0.7085618, -1.128111, 2.171198, 0.5960785, 0, 1, 1,
0.7144623, 0.4441958, 1.692037, 0.6039216, 0, 1, 1,
0.7201222, -0.06670771, 0.984715, 0.6078432, 0, 1, 1,
0.7286741, -0.7212355, 2.266434, 0.6156863, 0, 1, 1,
0.7369929, 0.4144184, -0.3056932, 0.6196079, 0, 1, 1,
0.7388583, -3.701608, 3.615605, 0.627451, 0, 1, 1,
0.7391886, 1.584228, -0.8543598, 0.6313726, 0, 1, 1,
0.7396803, -1.003241, 2.888361, 0.6392157, 0, 1, 1,
0.7406458, 0.34711, -0.1606308, 0.6431373, 0, 1, 1,
0.7427093, -0.36643, 3.496224, 0.6509804, 0, 1, 1,
0.7446507, 1.641165, 0.4742685, 0.654902, 0, 1, 1,
0.7459062, 0.8412884, 1.315918, 0.6627451, 0, 1, 1,
0.7495401, -1.176966, 4.759078, 0.6666667, 0, 1, 1,
0.7511529, 1.599164, 0.5278625, 0.6745098, 0, 1, 1,
0.7540105, 1.921904, -0.3071757, 0.6784314, 0, 1, 1,
0.7620221, -1.942367, 4.72914, 0.6862745, 0, 1, 1,
0.7667904, 0.7962814, 0.8218348, 0.6901961, 0, 1, 1,
0.7670259, 1.408336, 0.01341785, 0.6980392, 0, 1, 1,
0.7688124, 0.730672, 1.716201, 0.7058824, 0, 1, 1,
0.7706106, 2.12201, 0.291742, 0.7098039, 0, 1, 1,
0.7740653, -0.2059499, 3.091672, 0.7176471, 0, 1, 1,
0.7787529, 0.6473734, -0.2636322, 0.7215686, 0, 1, 1,
0.7801079, -0.9610709, 1.806855, 0.7294118, 0, 1, 1,
0.7818915, 0.4312372, 1.534584, 0.7333333, 0, 1, 1,
0.7823287, -0.08925771, 1.740931, 0.7411765, 0, 1, 1,
0.7828729, 0.2507254, 0.8612188, 0.7450981, 0, 1, 1,
0.7837457, -0.6765674, 3.54501, 0.7529412, 0, 1, 1,
0.7848574, 1.018687, 1.765302, 0.7568628, 0, 1, 1,
0.790837, -0.1869631, 2.772976, 0.7647059, 0, 1, 1,
0.7921759, 2.04346, 1.221085, 0.7686275, 0, 1, 1,
0.7979081, -0.7143623, 3.438251, 0.7764706, 0, 1, 1,
0.7987323, 0.5497075, 0.04663123, 0.7803922, 0, 1, 1,
0.8036576, 0.3137708, -0.7241029, 0.7882353, 0, 1, 1,
0.8067643, 1.237287, 2.632393, 0.7921569, 0, 1, 1,
0.8093048, -1.773664, 2.376181, 0.8, 0, 1, 1,
0.8106483, 0.05278103, 1.346332, 0.8078431, 0, 1, 1,
0.8109695, -1.298576, 2.203947, 0.8117647, 0, 1, 1,
0.8114199, 0.6064714, 0.1845577, 0.8196079, 0, 1, 1,
0.817801, 0.7143289, -0.1561882, 0.8235294, 0, 1, 1,
0.8178751, 0.2575595, -0.2794245, 0.8313726, 0, 1, 1,
0.8193797, 0.3850169, -0.2446661, 0.8352941, 0, 1, 1,
0.8264879, 1.935855, -1.193371, 0.8431373, 0, 1, 1,
0.8266082, 0.1550895, 1.919573, 0.8470588, 0, 1, 1,
0.8321755, 1.26938, 0.8705698, 0.854902, 0, 1, 1,
0.8357462, -0.02543641, 1.768873, 0.8588235, 0, 1, 1,
0.8369119, -0.9758849, 3.009486, 0.8666667, 0, 1, 1,
0.8460316, -0.3157901, 1.880543, 0.8705882, 0, 1, 1,
0.8467836, 1.043178, 0.9472849, 0.8784314, 0, 1, 1,
0.8492979, -1.725488, 2.349156, 0.8823529, 0, 1, 1,
0.8518671, -1.606055, 2.673709, 0.8901961, 0, 1, 1,
0.8525825, -0.09600392, 2.201868, 0.8941177, 0, 1, 1,
0.8526546, 1.795147, -0.03519841, 0.9019608, 0, 1, 1,
0.8533344, 0.6876409, 0.5862731, 0.9098039, 0, 1, 1,
0.8583553, -0.1191702, 1.366137, 0.9137255, 0, 1, 1,
0.858777, 0.04616617, 1.401331, 0.9215686, 0, 1, 1,
0.8602888, -0.302608, 1.697426, 0.9254902, 0, 1, 1,
0.8615604, 0.7028549, -0.3635479, 0.9333333, 0, 1, 1,
0.8679713, -0.4602142, -0.7366151, 0.9372549, 0, 1, 1,
0.8728464, 0.6946209, -0.4095022, 0.945098, 0, 1, 1,
0.8730112, -1.995096, 4.046988, 0.9490196, 0, 1, 1,
0.8736169, -1.463336, 2.684583, 0.9568627, 0, 1, 1,
0.8740681, -1.482257, 0.848241, 0.9607843, 0, 1, 1,
0.8805494, 0.8558519, 0.8974428, 0.9686275, 0, 1, 1,
0.8811519, 0.3808548, 1.638925, 0.972549, 0, 1, 1,
0.8942088, -0.3029054, 0.9917462, 0.9803922, 0, 1, 1,
0.8995382, -0.15041, 1.722114, 0.9843137, 0, 1, 1,
0.9056545, 0.8082212, -0.6505058, 0.9921569, 0, 1, 1,
0.9116223, 1.217378, 0.2381749, 0.9960784, 0, 1, 1,
0.9141087, 0.07411356, 0.5562814, 1, 0, 0.9960784, 1,
0.9246804, -1.009918, 3.505782, 1, 0, 0.9882353, 1,
0.9409183, 0.9469063, 1.249156, 1, 0, 0.9843137, 1,
0.9462088, -0.9985762, 1.939379, 1, 0, 0.9764706, 1,
0.9517269, 1.900203, 0.7140607, 1, 0, 0.972549, 1,
0.9640772, -0.7282708, -0.1798895, 1, 0, 0.9647059, 1,
0.9671947, -0.07613716, 1.653403, 1, 0, 0.9607843, 1,
0.9675367, -0.9225613, 1.779853, 1, 0, 0.9529412, 1,
0.9695447, 1.293965, 2.581105, 1, 0, 0.9490196, 1,
0.9743037, 0.5939149, 1.642316, 1, 0, 0.9411765, 1,
0.9762633, 0.5385146, 0.6468021, 1, 0, 0.9372549, 1,
0.9764274, 0.006533498, 3.038165, 1, 0, 0.9294118, 1,
0.9794255, 0.436893, 0.5630504, 1, 0, 0.9254902, 1,
0.979472, 3.027208, -0.0464073, 1, 0, 0.9176471, 1,
0.9877971, 0.7683035, 1.193008, 1, 0, 0.9137255, 1,
0.9939129, 0.915895, 2.059086, 1, 0, 0.9058824, 1,
0.9959464, -0.03154416, 1.098059, 1, 0, 0.9019608, 1,
0.9972442, -1.27527, 3.856362, 1, 0, 0.8941177, 1,
0.9973285, -2.580423, 4.401536, 1, 0, 0.8862745, 1,
1.008463, 1.252633, 0.7776408, 1, 0, 0.8823529, 1,
1.010532, -1.411522, 2.631869, 1, 0, 0.8745098, 1,
1.01195, 0.4284112, 1.799994, 1, 0, 0.8705882, 1,
1.012047, -0.3645051, 3.676631, 1, 0, 0.8627451, 1,
1.014157, 1.538758, 1.149477, 1, 0, 0.8588235, 1,
1.016572, 1.184382, -0.05793555, 1, 0, 0.8509804, 1,
1.01948, 1.41739, 1.465241, 1, 0, 0.8470588, 1,
1.021667, -2.202533, 4.14888, 1, 0, 0.8392157, 1,
1.021987, 0.1605282, 1.180315, 1, 0, 0.8352941, 1,
1.026326, -1.200879, 2.91206, 1, 0, 0.827451, 1,
1.027214, 0.3236341, 0.5895754, 1, 0, 0.8235294, 1,
1.03229, -1.191345, 2.612114, 1, 0, 0.8156863, 1,
1.032377, -0.004861278, 0.3928656, 1, 0, 0.8117647, 1,
1.034277, -0.2710644, 0.7573812, 1, 0, 0.8039216, 1,
1.034455, 0.3789149, 1.433933, 1, 0, 0.7960784, 1,
1.034654, -0.13669, 2.580344, 1, 0, 0.7921569, 1,
1.043068, 0.0209886, 0.6657758, 1, 0, 0.7843137, 1,
1.046264, -0.2824571, 1.822617, 1, 0, 0.7803922, 1,
1.046403, -0.2393103, 1.472047, 1, 0, 0.772549, 1,
1.047161, 0.8425899, 2.340408, 1, 0, 0.7686275, 1,
1.050987, 0.3002128, 0.6646636, 1, 0, 0.7607843, 1,
1.058359, 3.520566, 1.11561, 1, 0, 0.7568628, 1,
1.073564, 0.3188264, 0.8979396, 1, 0, 0.7490196, 1,
1.084977, -1.366143, 1.786272, 1, 0, 0.7450981, 1,
1.0906, 0.2832648, -0.3175013, 1, 0, 0.7372549, 1,
1.09162, -1.979231, 1.783986, 1, 0, 0.7333333, 1,
1.091758, 1.215945, 1.230164, 1, 0, 0.7254902, 1,
1.094533, -0.5326871, 1.530006, 1, 0, 0.7215686, 1,
1.096208, -0.7607471, 2.057126, 1, 0, 0.7137255, 1,
1.10291, -0.1044365, 1.897658, 1, 0, 0.7098039, 1,
1.106138, -0.0321353, -0.06098243, 1, 0, 0.7019608, 1,
1.108105, -0.4302437, 2.072018, 1, 0, 0.6941177, 1,
1.112541, -2.52475, 2.129538, 1, 0, 0.6901961, 1,
1.117259, 0.1993876, 2.514003, 1, 0, 0.682353, 1,
1.12811, 1.142713, 1.183487, 1, 0, 0.6784314, 1,
1.130242, 0.9704221, -0.1964727, 1, 0, 0.6705883, 1,
1.130537, -0.1315778, 0.9539087, 1, 0, 0.6666667, 1,
1.136785, 0.2220901, -0.004221687, 1, 0, 0.6588235, 1,
1.140085, 0.767391, 1.747755, 1, 0, 0.654902, 1,
1.149394, 0.3707567, 0.5728947, 1, 0, 0.6470588, 1,
1.15396, -1.861902, 2.726918, 1, 0, 0.6431373, 1,
1.156359, -1.135893, 0.3689378, 1, 0, 0.6352941, 1,
1.156368, -0.342391, 1.027053, 1, 0, 0.6313726, 1,
1.156652, 0.3626783, 0.2697062, 1, 0, 0.6235294, 1,
1.158093, 2.009866, -0.5740418, 1, 0, 0.6196079, 1,
1.16291, 1.013351, 2.093812, 1, 0, 0.6117647, 1,
1.181526, -2.162485, 4.331566, 1, 0, 0.6078432, 1,
1.182365, 0.1962521, 1.594347, 1, 0, 0.6, 1,
1.183293, 0.01061188, 2.50153, 1, 0, 0.5921569, 1,
1.183742, 0.3998764, 0.1418155, 1, 0, 0.5882353, 1,
1.185532, 1.180962, 0.07091081, 1, 0, 0.5803922, 1,
1.188274, 0.4791373, 1.054588, 1, 0, 0.5764706, 1,
1.191666, 0.8678721, 2.873763, 1, 0, 0.5686275, 1,
1.195303, 0.3053204, 0.8350745, 1, 0, 0.5647059, 1,
1.209277, -1.193338, 3.195063, 1, 0, 0.5568628, 1,
1.21351, -1.024727, 0.947046, 1, 0, 0.5529412, 1,
1.215321, -2.49134, 1.504676, 1, 0, 0.5450981, 1,
1.239236, -1.130111, 1.742313, 1, 0, 0.5411765, 1,
1.242949, -0.07654387, 3.378524, 1, 0, 0.5333334, 1,
1.252007, -0.959361, 1.800261, 1, 0, 0.5294118, 1,
1.254394, -0.3471056, 2.425488, 1, 0, 0.5215687, 1,
1.25507, -0.02510788, 1.138881, 1, 0, 0.5176471, 1,
1.263165, 0.5702503, 2.242618, 1, 0, 0.509804, 1,
1.270992, 1.035188, 1.709742, 1, 0, 0.5058824, 1,
1.271865, -0.4494717, 2.292437, 1, 0, 0.4980392, 1,
1.27299, -1.419059, 3.190077, 1, 0, 0.4901961, 1,
1.27803, -1.696189, 0.9509037, 1, 0, 0.4862745, 1,
1.278462, -0.2841306, 0.6254358, 1, 0, 0.4784314, 1,
1.279076, 0.1013735, 3.192424, 1, 0, 0.4745098, 1,
1.279166, -2.345718, 1.833609, 1, 0, 0.4666667, 1,
1.279845, -0.07562783, 1.130462, 1, 0, 0.4627451, 1,
1.306123, -1.13921, 2.012692, 1, 0, 0.454902, 1,
1.311094, 0.8132688, -0.2274563, 1, 0, 0.4509804, 1,
1.318447, -0.2611678, 1.400496, 1, 0, 0.4431373, 1,
1.322633, 0.6845645, 2.189959, 1, 0, 0.4392157, 1,
1.329325, -1.201815, 2.986408, 1, 0, 0.4313726, 1,
1.332498, 0.1170527, 0.6624963, 1, 0, 0.427451, 1,
1.336264, 0.4863447, 2.223697, 1, 0, 0.4196078, 1,
1.339581, 1.2071, -0.8220965, 1, 0, 0.4156863, 1,
1.345894, -1.416141, 1.872734, 1, 0, 0.4078431, 1,
1.346655, 0.5528831, -0.8049459, 1, 0, 0.4039216, 1,
1.348622, -2.020552, 2.288902, 1, 0, 0.3960784, 1,
1.373687, -0.3359033, 2.049439, 1, 0, 0.3882353, 1,
1.380618, -0.38198, 0.9087485, 1, 0, 0.3843137, 1,
1.382995, 0.2820552, 2.47979, 1, 0, 0.3764706, 1,
1.384509, 1.030752, 0.09659161, 1, 0, 0.372549, 1,
1.403758, 0.1761208, 0.1606242, 1, 0, 0.3647059, 1,
1.407311, 1.13966, -0.5644625, 1, 0, 0.3607843, 1,
1.420178, 1.611771, -0.1186152, 1, 0, 0.3529412, 1,
1.429045, -1.537848, 3.266011, 1, 0, 0.3490196, 1,
1.441526, 0.8060275, 1.599714, 1, 0, 0.3411765, 1,
1.446309, -0.5440618, 0.7862707, 1, 0, 0.3372549, 1,
1.448702, 1.163688, 0.8929213, 1, 0, 0.3294118, 1,
1.452101, 0.7374626, 2.706836, 1, 0, 0.3254902, 1,
1.454094, 2.975884, 0.05642849, 1, 0, 0.3176471, 1,
1.484098, -0.1748323, 1.848551, 1, 0, 0.3137255, 1,
1.490873, -0.2226103, 1.610151, 1, 0, 0.3058824, 1,
1.492463, -0.7517397, 1.50216, 1, 0, 0.2980392, 1,
1.505788, -0.3047789, 1.28578, 1, 0, 0.2941177, 1,
1.511282, 1.214494, -0.5639718, 1, 0, 0.2862745, 1,
1.521065, 0.6460448, 2.22084, 1, 0, 0.282353, 1,
1.555583, -0.5008507, 2.933634, 1, 0, 0.2745098, 1,
1.558947, 0.05101697, -0.06425331, 1, 0, 0.2705882, 1,
1.574781, -1.052853, 3.612762, 1, 0, 0.2627451, 1,
1.579097, -0.436504, -0.7044798, 1, 0, 0.2588235, 1,
1.613687, 1.059969, 0.6715568, 1, 0, 0.2509804, 1,
1.619338, 0.1819663, 0.6432526, 1, 0, 0.2470588, 1,
1.623428, -1.021309, 2.960732, 1, 0, 0.2392157, 1,
1.625373, 0.5930224, 3.678653, 1, 0, 0.2352941, 1,
1.630368, -0.04424696, 2.594408, 1, 0, 0.227451, 1,
1.632495, 0.5453265, 1.573897, 1, 0, 0.2235294, 1,
1.665542, -0.7694792, 1.099019, 1, 0, 0.2156863, 1,
1.678616, 0.2395535, 2.434265, 1, 0, 0.2117647, 1,
1.687286, 0.4949264, 0.7218714, 1, 0, 0.2039216, 1,
1.692479, 0.6172173, 0.9291905, 1, 0, 0.1960784, 1,
1.705289, -0.5567687, 1.020652, 1, 0, 0.1921569, 1,
1.707864, 1.780326, 2.045473, 1, 0, 0.1843137, 1,
1.713731, 0.007156614, 1.296713, 1, 0, 0.1803922, 1,
1.716086, -0.02613012, 0.8734726, 1, 0, 0.172549, 1,
1.717226, -1.497558, 2.528039, 1, 0, 0.1686275, 1,
1.737479, 1.614287, 0.0933326, 1, 0, 0.1607843, 1,
1.742108, -2.224333, 4.138478, 1, 0, 0.1568628, 1,
1.827321, -1.568743, 1.502219, 1, 0, 0.1490196, 1,
1.828376, -0.5639277, 1.356175, 1, 0, 0.145098, 1,
1.843086, -2.860266, 2.84807, 1, 0, 0.1372549, 1,
1.854148, -2.045753, 1.594743, 1, 0, 0.1333333, 1,
1.86134, 0.8433795, 2.441796, 1, 0, 0.1254902, 1,
1.86747, 1.376057, 0.02660798, 1, 0, 0.1215686, 1,
1.883528, 0.08546463, 1.991509, 1, 0, 0.1137255, 1,
1.895512, -0.1979277, 1.377588, 1, 0, 0.1098039, 1,
1.921156, -0.06737137, 1.39478, 1, 0, 0.1019608, 1,
1.947417, -1.089524, 2.715951, 1, 0, 0.09411765, 1,
1.975702, -0.2648353, 0.2644461, 1, 0, 0.09019608, 1,
1.978751, -0.833218, 1.46172, 1, 0, 0.08235294, 1,
2.042352, -0.6495603, 2.395693, 1, 0, 0.07843138, 1,
2.127331, 0.08493809, 1.514822, 1, 0, 0.07058824, 1,
2.132999, 1.070747, 1.355649, 1, 0, 0.06666667, 1,
2.145067, -0.6662539, 1.716178, 1, 0, 0.05882353, 1,
2.152274, 0.9189854, 1.15475, 1, 0, 0.05490196, 1,
2.191858, -0.383044, 2.271079, 1, 0, 0.04705882, 1,
2.268477, -0.04559837, 3.023273, 1, 0, 0.04313726, 1,
2.382105, 1.223382, 1.827617, 1, 0, 0.03529412, 1,
2.410663, 0.6989322, 3.687242, 1, 0, 0.03137255, 1,
2.447798, -0.2449646, -0.7998875, 1, 0, 0.02352941, 1,
2.463242, 1.368913, 1.498799, 1, 0, 0.01960784, 1,
2.483578, -0.9958479, 2.256779, 1, 0, 0.01176471, 1,
2.617725, 0.8195733, 1.57814, 1, 0, 0.007843138, 1
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
-0.3542615, -4.976645, -6.919025, 0, -0.5, 0.5, 0.5,
-0.3542615, -4.976645, -6.919025, 1, -0.5, 0.5, 0.5,
-0.3542615, -4.976645, -6.919025, 1, 1.5, 0.5, 0.5,
-0.3542615, -4.976645, -6.919025, 0, 1.5, 0.5, 0.5
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
-4.333752, 0.05956614, -6.919025, 0, -0.5, 0.5, 0.5,
-4.333752, 0.05956614, -6.919025, 1, -0.5, 0.5, 0.5,
-4.333752, 0.05956614, -6.919025, 1, 1.5, 0.5, 0.5,
-4.333752, 0.05956614, -6.919025, 0, 1.5, 0.5, 0.5
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
-4.333752, -4.976645, 0.7168479, 0, -0.5, 0.5, 0.5,
-4.333752, -4.976645, 0.7168479, 1, -0.5, 0.5, 0.5,
-4.333752, -4.976645, 0.7168479, 1, 1.5, 0.5, 0.5,
-4.333752, -4.976645, 0.7168479, 0, 1.5, 0.5, 0.5
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
-3, -3.814443, -5.1569,
2, -3.814443, -5.1569,
-3, -3.814443, -5.1569,
-3, -4.008143, -5.450588,
-2, -3.814443, -5.1569,
-2, -4.008143, -5.450588,
-1, -3.814443, -5.1569,
-1, -4.008143, -5.450588,
0, -3.814443, -5.1569,
0, -4.008143, -5.450588,
1, -3.814443, -5.1569,
1, -4.008143, -5.450588,
2, -3.814443, -5.1569,
2, -4.008143, -5.450588
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
-3, -4.395544, -6.037962, 0, -0.5, 0.5, 0.5,
-3, -4.395544, -6.037962, 1, -0.5, 0.5, 0.5,
-3, -4.395544, -6.037962, 1, 1.5, 0.5, 0.5,
-3, -4.395544, -6.037962, 0, 1.5, 0.5, 0.5,
-2, -4.395544, -6.037962, 0, -0.5, 0.5, 0.5,
-2, -4.395544, -6.037962, 1, -0.5, 0.5, 0.5,
-2, -4.395544, -6.037962, 1, 1.5, 0.5, 0.5,
-2, -4.395544, -6.037962, 0, 1.5, 0.5, 0.5,
-1, -4.395544, -6.037962, 0, -0.5, 0.5, 0.5,
-1, -4.395544, -6.037962, 1, -0.5, 0.5, 0.5,
-1, -4.395544, -6.037962, 1, 1.5, 0.5, 0.5,
-1, -4.395544, -6.037962, 0, 1.5, 0.5, 0.5,
0, -4.395544, -6.037962, 0, -0.5, 0.5, 0.5,
0, -4.395544, -6.037962, 1, -0.5, 0.5, 0.5,
0, -4.395544, -6.037962, 1, 1.5, 0.5, 0.5,
0, -4.395544, -6.037962, 0, 1.5, 0.5, 0.5,
1, -4.395544, -6.037962, 0, -0.5, 0.5, 0.5,
1, -4.395544, -6.037962, 1, -0.5, 0.5, 0.5,
1, -4.395544, -6.037962, 1, 1.5, 0.5, 0.5,
1, -4.395544, -6.037962, 0, 1.5, 0.5, 0.5,
2, -4.395544, -6.037962, 0, -0.5, 0.5, 0.5,
2, -4.395544, -6.037962, 1, -0.5, 0.5, 0.5,
2, -4.395544, -6.037962, 1, 1.5, 0.5, 0.5,
2, -4.395544, -6.037962, 0, 1.5, 0.5, 0.5
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
-3.415408, -2, -5.1569,
-3.415408, 2, -5.1569,
-3.415408, -2, -5.1569,
-3.568465, -2, -5.450588,
-3.415408, 0, -5.1569,
-3.568465, 0, -5.450588,
-3.415408, 2, -5.1569,
-3.568465, 2, -5.450588
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
-3.87458, -2, -6.037962, 0, -0.5, 0.5, 0.5,
-3.87458, -2, -6.037962, 1, -0.5, 0.5, 0.5,
-3.87458, -2, -6.037962, 1, 1.5, 0.5, 0.5,
-3.87458, -2, -6.037962, 0, 1.5, 0.5, 0.5,
-3.87458, 0, -6.037962, 0, -0.5, 0.5, 0.5,
-3.87458, 0, -6.037962, 1, -0.5, 0.5, 0.5,
-3.87458, 0, -6.037962, 1, 1.5, 0.5, 0.5,
-3.87458, 0, -6.037962, 0, 1.5, 0.5, 0.5,
-3.87458, 2, -6.037962, 0, -0.5, 0.5, 0.5,
-3.87458, 2, -6.037962, 1, -0.5, 0.5, 0.5,
-3.87458, 2, -6.037962, 1, 1.5, 0.5, 0.5,
-3.87458, 2, -6.037962, 0, 1.5, 0.5, 0.5
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
-3.415408, -3.814443, -4,
-3.415408, -3.814443, 6,
-3.415408, -3.814443, -4,
-3.568465, -4.008143, -4,
-3.415408, -3.814443, -2,
-3.568465, -4.008143, -2,
-3.415408, -3.814443, 0,
-3.568465, -4.008143, 0,
-3.415408, -3.814443, 2,
-3.568465, -4.008143, 2,
-3.415408, -3.814443, 4,
-3.568465, -4.008143, 4,
-3.415408, -3.814443, 6,
-3.568465, -4.008143, 6
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
"4",
"6"
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
-3.87458, -4.395544, -4, 0, -0.5, 0.5, 0.5,
-3.87458, -4.395544, -4, 1, -0.5, 0.5, 0.5,
-3.87458, -4.395544, -4, 1, 1.5, 0.5, 0.5,
-3.87458, -4.395544, -4, 0, 1.5, 0.5, 0.5,
-3.87458, -4.395544, -2, 0, -0.5, 0.5, 0.5,
-3.87458, -4.395544, -2, 1, -0.5, 0.5, 0.5,
-3.87458, -4.395544, -2, 1, 1.5, 0.5, 0.5,
-3.87458, -4.395544, -2, 0, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 0, 0, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 0, 1, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 0, 1, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 0, 0, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 2, 0, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 2, 1, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 2, 1, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 2, 0, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 4, 0, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 4, 1, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 4, 1, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 4, 0, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 6, 0, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 6, 1, -0.5, 0.5, 0.5,
-3.87458, -4.395544, 6, 1, 1.5, 0.5, 0.5,
-3.87458, -4.395544, 6, 0, 1.5, 0.5, 0.5
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
-3.415408, -3.814443, -5.1569,
-3.415408, 3.933575, -5.1569,
-3.415408, -3.814443, 6.590596,
-3.415408, 3.933575, 6.590596,
-3.415408, -3.814443, -5.1569,
-3.415408, -3.814443, 6.590596,
-3.415408, 3.933575, -5.1569,
-3.415408, 3.933575, 6.590596,
-3.415408, -3.814443, -5.1569,
2.706885, -3.814443, -5.1569,
-3.415408, -3.814443, 6.590596,
2.706885, -3.814443, 6.590596,
-3.415408, 3.933575, -5.1569,
2.706885, 3.933575, -5.1569,
-3.415408, 3.933575, 6.590596,
2.706885, 3.933575, 6.590596,
2.706885, -3.814443, -5.1569,
2.706885, 3.933575, -5.1569,
2.706885, -3.814443, 6.590596,
2.706885, 3.933575, 6.590596,
2.706885, -3.814443, -5.1569,
2.706885, -3.814443, 6.590596,
2.706885, 3.933575, -5.1569,
2.706885, 3.933575, 6.590596
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
var radius = 8.194783;
var distance = 36.45951;
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
mvMatrix.translate( 0.3542615, -0.05956614, -0.7168479 );
mvMatrix.scale( 1.447229, 1.143565, 0.7542339 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.45951);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
nicotine_sulfate_1-m<-read.table("nicotine_sulfate_1-m.xyz", skip=1)
```

```
## Error in read.table("nicotine_sulfate_1-m.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-nicotine_sulfate_1-m$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_sulfate_1' not found
```

```r
y<-nicotine_sulfate_1-m$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_sulfate_1' not found
```

```r
z<-nicotine_sulfate_1-m$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_sulfate_1' not found
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
-3.326248, 1.285098, -0.2051919, 0, 0, 1, 1, 1,
-2.990084, -1.764458, -3.461585, 1, 0, 0, 1, 1,
-2.859655, 1.603696, 0.06325293, 1, 0, 0, 1, 1,
-2.853249, -0.4101962, -2.523866, 1, 0, 0, 1, 1,
-2.565863, -1.909453, -2.474359, 1, 0, 0, 1, 1,
-2.513127, -0.5439877, -1.678524, 1, 0, 0, 1, 1,
-2.481679, -0.08006828, -2.901566, 0, 0, 0, 1, 1,
-2.475966, -0.1214654, -4.213498, 0, 0, 0, 1, 1,
-2.446677, -0.2797356, -3.792723, 0, 0, 0, 1, 1,
-2.373813, 0.2293772, -2.134011, 0, 0, 0, 1, 1,
-2.368389, 1.267122, -0.3198139, 0, 0, 0, 1, 1,
-2.352631, 0.6717473, -1.968618, 0, 0, 0, 1, 1,
-2.307651, 0.8048022, -1.345533, 0, 0, 0, 1, 1,
-2.30589, 0.3200751, -1.810036, 1, 1, 1, 1, 1,
-2.305051, -0.1543683, -0.1214026, 1, 1, 1, 1, 1,
-2.287404, 0.1181731, -1.384303, 1, 1, 1, 1, 1,
-2.275669, 1.870014, 0.2160537, 1, 1, 1, 1, 1,
-2.215416, -0.5672442, -1.094604, 1, 1, 1, 1, 1,
-2.215003, -0.118752, -0.8421626, 1, 1, 1, 1, 1,
-2.194491, 0.9455488, 0.4320454, 1, 1, 1, 1, 1,
-2.162421, -0.9959448, -3.448135, 1, 1, 1, 1, 1,
-2.14983, -1.525782, -0.09525836, 1, 1, 1, 1, 1,
-2.146814, 1.250509, -1.369478, 1, 1, 1, 1, 1,
-2.129087, 0.8440918, -1.16235, 1, 1, 1, 1, 1,
-2.121582, -0.06816723, -3.737571, 1, 1, 1, 1, 1,
-2.118102, -0.9153851, -0.4728776, 1, 1, 1, 1, 1,
-2.099885, -0.4540155, -2.099144, 1, 1, 1, 1, 1,
-2.055474, 1.011977, -1.287241, 1, 1, 1, 1, 1,
-2.030168, -0.6782722, -3.054485, 0, 0, 1, 1, 1,
-2.015498, 0.8066898, -1.67158, 1, 0, 0, 1, 1,
-2.004398, 1.273758, -1.215352, 1, 0, 0, 1, 1,
-1.996163, 0.4384278, -2.210251, 1, 0, 0, 1, 1,
-1.994946, 0.4989783, -2.115241, 1, 0, 0, 1, 1,
-1.968645, -1.207516, -2.226817, 1, 0, 0, 1, 1,
-1.946584, 0.5794109, -1.631879, 0, 0, 0, 1, 1,
-1.934159, 0.4710585, -3.001515, 0, 0, 0, 1, 1,
-1.925982, 0.3469299, -0.8185741, 0, 0, 0, 1, 1,
-1.905006, 0.3125996, -0.7441741, 0, 0, 0, 1, 1,
-1.899618, -0.8826861, -3.642349, 0, 0, 0, 1, 1,
-1.897774, -0.1238849, -2.172777, 0, 0, 0, 1, 1,
-1.88196, -0.5096151, -2.726345, 0, 0, 0, 1, 1,
-1.871849, 0.08245026, 0.6573763, 1, 1, 1, 1, 1,
-1.871027, 0.9805597, -2.20378, 1, 1, 1, 1, 1,
-1.864844, 0.8989162, -0.5243421, 1, 1, 1, 1, 1,
-1.863949, -0.5598716, -2.741653, 1, 1, 1, 1, 1,
-1.857896, 0.7346931, -2.115429, 1, 1, 1, 1, 1,
-1.846761, 0.4729306, -0.8189219, 1, 1, 1, 1, 1,
-1.83701, 0.8104023, 1.07585, 1, 1, 1, 1, 1,
-1.806608, 0.5800159, -1.454024, 1, 1, 1, 1, 1,
-1.801518, -0.6848903, -2.013827, 1, 1, 1, 1, 1,
-1.800882, -0.2856294, -0.7122473, 1, 1, 1, 1, 1,
-1.75521, 0.5160632, 0.07738124, 1, 1, 1, 1, 1,
-1.725282, 0.6102929, -0.4629807, 1, 1, 1, 1, 1,
-1.702329, -1.716103, -1.773332, 1, 1, 1, 1, 1,
-1.679562, -0.7503697, -2.442073, 1, 1, 1, 1, 1,
-1.67241, -0.9132593, -2.278472, 1, 1, 1, 1, 1,
-1.665416, 1.187142, -1.191387, 0, 0, 1, 1, 1,
-1.661239, -0.5848477, -2.822507, 1, 0, 0, 1, 1,
-1.65974, 0.6939496, -1.056825, 1, 0, 0, 1, 1,
-1.656512, 1.195979, -2.270082, 1, 0, 0, 1, 1,
-1.639576, -0.3754546, 0.2563128, 1, 0, 0, 1, 1,
-1.632708, -0.9302005, -3.33369, 1, 0, 0, 1, 1,
-1.624053, -0.8845501, -3.331118, 0, 0, 0, 1, 1,
-1.623986, -0.08265062, -1.348383, 0, 0, 0, 1, 1,
-1.62362, 1.609289, -2.036513, 0, 0, 0, 1, 1,
-1.612885, 0.8908871, -2.607474, 0, 0, 0, 1, 1,
-1.612323, -0.2915657, -0.9699948, 0, 0, 0, 1, 1,
-1.592692, 0.70913, -1.048547, 0, 0, 0, 1, 1,
-1.56034, 0.2995037, -1.166299, 0, 0, 0, 1, 1,
-1.559, -0.4264167, -3.707921, 1, 1, 1, 1, 1,
-1.544468, 0.2217202, -0.6785825, 1, 1, 1, 1, 1,
-1.543722, 0.6231706, -3.276703, 1, 1, 1, 1, 1,
-1.540631, -0.6997907, -3.073755, 1, 1, 1, 1, 1,
-1.533835, -1.744447, -2.347383, 1, 1, 1, 1, 1,
-1.529345, 1.14986, -2.573387, 1, 1, 1, 1, 1,
-1.528052, -0.6842235, -1.860997, 1, 1, 1, 1, 1,
-1.523939, -2.504864, -2.428717, 1, 1, 1, 1, 1,
-1.521473, -0.3531496, -1.630005, 1, 1, 1, 1, 1,
-1.506904, 1.023326, -1.852091, 1, 1, 1, 1, 1,
-1.466225, 0.4307512, -3.233256, 1, 1, 1, 1, 1,
-1.459459, -0.1508126, -2.287729, 1, 1, 1, 1, 1,
-1.456044, 0.240071, -0.9425182, 1, 1, 1, 1, 1,
-1.449282, -0.9962927, -2.294916, 1, 1, 1, 1, 1,
-1.443859, 1.5155, 1.123103, 1, 1, 1, 1, 1,
-1.44285, 1.387745, -0.6631013, 0, 0, 1, 1, 1,
-1.437994, -1.803772, -2.861253, 1, 0, 0, 1, 1,
-1.437679, 0.006669577, -0.4759563, 1, 0, 0, 1, 1,
-1.424827, -2.748224, -2.741907, 1, 0, 0, 1, 1,
-1.41696, 0.34154, -1.188467, 1, 0, 0, 1, 1,
-1.409804, 0.05195452, -1.400725, 1, 0, 0, 1, 1,
-1.4037, -1.136039, -0.8771005, 0, 0, 0, 1, 1,
-1.402088, 1.288641, -2.133214, 0, 0, 0, 1, 1,
-1.398405, 0.37402, -1.672766, 0, 0, 0, 1, 1,
-1.397316, 0.7522486, -2.093837, 0, 0, 0, 1, 1,
-1.390135, -0.7501867, -2.639771, 0, 0, 0, 1, 1,
-1.374312, 0.1880005, -2.405686, 0, 0, 0, 1, 1,
-1.361279, 1.172341, 0.001115105, 0, 0, 0, 1, 1,
-1.347938, 1.151468, -0.9373698, 1, 1, 1, 1, 1,
-1.341985, 1.237308, -1.571363, 1, 1, 1, 1, 1,
-1.336818, -0.7882512, -4.052618, 1, 1, 1, 1, 1,
-1.318016, 1.731599, -0.6321648, 1, 1, 1, 1, 1,
-1.313142, 1.320332, -1.646474, 1, 1, 1, 1, 1,
-1.309624, -0.7862602, -2.081716, 1, 1, 1, 1, 1,
-1.305903, 1.057055, -0.1466376, 1, 1, 1, 1, 1,
-1.295316, 0.6431655, -1.373969, 1, 1, 1, 1, 1,
-1.294939, 0.4560459, -0.5180348, 1, 1, 1, 1, 1,
-1.283352, 0.1895927, -1.006659, 1, 1, 1, 1, 1,
-1.280032, -0.4717882, -2.667784, 1, 1, 1, 1, 1,
-1.279474, -2.272974, -2.492724, 1, 1, 1, 1, 1,
-1.277379, 0.2274237, -2.663914, 1, 1, 1, 1, 1,
-1.27639, 0.3177721, -1.578178, 1, 1, 1, 1, 1,
-1.273561, -0.8064405, -2.690401, 1, 1, 1, 1, 1,
-1.273266, 0.5463433, -3.70032, 0, 0, 1, 1, 1,
-1.268231, -0.6787022, -3.240372, 1, 0, 0, 1, 1,
-1.261034, -0.9703777, -3.716765, 1, 0, 0, 1, 1,
-1.252735, -0.7110346, -1.475792, 1, 0, 0, 1, 1,
-1.251256, 0.6909304, -1.68555, 1, 0, 0, 1, 1,
-1.250144, 0.4733721, -1.84467, 1, 0, 0, 1, 1,
-1.22782, 0.3339957, -2.215648, 0, 0, 0, 1, 1,
-1.218887, 0.7927171, -0.8962024, 0, 0, 0, 1, 1,
-1.218379, -0.5495989, -0.579392, 0, 0, 0, 1, 1,
-1.210054, 0.9982757, -0.8370517, 0, 0, 0, 1, 1,
-1.204805, 0.6540025, -0.8157964, 0, 0, 0, 1, 1,
-1.203172, 0.2940236, -2.134117, 0, 0, 0, 1, 1,
-1.20309, 0.417812, -1.81091, 0, 0, 0, 1, 1,
-1.195564, -0.7976952, -2.178284, 1, 1, 1, 1, 1,
-1.194212, 0.4468654, -1.167244, 1, 1, 1, 1, 1,
-1.193123, -2.557444, -2.426555, 1, 1, 1, 1, 1,
-1.177638, 0.3734682, -1.556442, 1, 1, 1, 1, 1,
-1.161432, -0.8312663, -1.228496, 1, 1, 1, 1, 1,
-1.156598, 0.5490916, -1.409046, 1, 1, 1, 1, 1,
-1.156382, -0.2968451, -0.5196283, 1, 1, 1, 1, 1,
-1.154985, 1.731176, -1.253443, 1, 1, 1, 1, 1,
-1.152802, -0.6942922, -1.967268, 1, 1, 1, 1, 1,
-1.152164, -0.8253133, -2.188143, 1, 1, 1, 1, 1,
-1.147523, 1.624666, -0.08160974, 1, 1, 1, 1, 1,
-1.140884, -0.3063462, -2.31828, 1, 1, 1, 1, 1,
-1.138495, 0.5237721, -1.633837, 1, 1, 1, 1, 1,
-1.137529, 1.03762, -1.148675, 1, 1, 1, 1, 1,
-1.136934, -1.218421, -0.2144043, 1, 1, 1, 1, 1,
-1.129472, -0.5754809, -2.801417, 0, 0, 1, 1, 1,
-1.127606, 0.0903725, -1.224439, 1, 0, 0, 1, 1,
-1.125394, -0.2876461, -3.270062, 1, 0, 0, 1, 1,
-1.122342, 1.04451, -1.416792, 1, 0, 0, 1, 1,
-1.119121, 0.2374004, -1.81458, 1, 0, 0, 1, 1,
-1.114856, -0.5313103, -3.329744, 1, 0, 0, 1, 1,
-1.113843, -0.6673902, -2.026638, 0, 0, 0, 1, 1,
-1.111654, -0.2338657, -1.170548, 0, 0, 0, 1, 1,
-1.110435, -0.1033599, -1.628232, 0, 0, 0, 1, 1,
-1.106725, -0.7701178, -2.245269, 0, 0, 0, 1, 1,
-1.105335, 0.810034, -0.04339691, 0, 0, 0, 1, 1,
-1.104585, -3.170471, -2.422264, 0, 0, 0, 1, 1,
-1.100816, -0.4515534, -0.4558968, 0, 0, 0, 1, 1,
-1.094011, -1.047085, -1.141903, 1, 1, 1, 1, 1,
-1.09093, 0.8479818, -0.9579489, 1, 1, 1, 1, 1,
-1.0905, 1.251199, -0.1958691, 1, 1, 1, 1, 1,
-1.082339, -0.6977571, -2.133915, 1, 1, 1, 1, 1,
-1.07989, -1.269129, -1.156958, 1, 1, 1, 1, 1,
-1.070453, 1.190223, -2.069917, 1, 1, 1, 1, 1,
-1.070446, 0.3636726, -3.109235, 1, 1, 1, 1, 1,
-1.068998, 0.5139167, -1.805681, 1, 1, 1, 1, 1,
-1.052115, -0.2748009, -0.7088995, 1, 1, 1, 1, 1,
-1.05144, 0.2819746, -2.020483, 1, 1, 1, 1, 1,
-1.034347, -0.2378463, -2.413009, 1, 1, 1, 1, 1,
-1.032053, 0.2751576, -2.752458, 1, 1, 1, 1, 1,
-1.029936, 0.2517187, -2.99857, 1, 1, 1, 1, 1,
-1.022111, 0.2056479, -0.7757032, 1, 1, 1, 1, 1,
-1.019574, 0.3030171, -0.6479344, 1, 1, 1, 1, 1,
-1.019491, 0.7571014, -1.404288, 0, 0, 1, 1, 1,
-1.017977, -0.3581615, -2.909386, 1, 0, 0, 1, 1,
-1.017512, 0.7809553, -1.779578, 1, 0, 0, 1, 1,
-1.01658, -3.354348, -2.721099, 1, 0, 0, 1, 1,
-1.012606, -1.836915, -1.793869, 1, 0, 0, 1, 1,
-1.010204, -0.004387531, -0.4493796, 1, 0, 0, 1, 1,
-1.00893, 0.3389073, -1.261331, 0, 0, 0, 1, 1,
-1.00411, -1.087301, -1.665073, 0, 0, 0, 1, 1,
-0.9957218, 0.5153595, -0.9478588, 0, 0, 0, 1, 1,
-0.9905225, 1.111416, -0.8458002, 0, 0, 0, 1, 1,
-0.9875872, 0.3213374, -0.8691149, 0, 0, 0, 1, 1,
-0.9728889, 0.6487739, -1.538656, 0, 0, 0, 1, 1,
-0.9706402, 1.994426, -0.9468716, 0, 0, 0, 1, 1,
-0.969663, 0.3928284, -0.4198957, 1, 1, 1, 1, 1,
-0.9677193, -0.2026409, -1.006482, 1, 1, 1, 1, 1,
-0.9667113, 0.2798611, -0.06104868, 1, 1, 1, 1, 1,
-0.9647151, -1.189147, -1.637639, 1, 1, 1, 1, 1,
-0.9614946, -0.7825982, -2.476453, 1, 1, 1, 1, 1,
-0.9609085, 0.5379502, -0.006338059, 1, 1, 1, 1, 1,
-0.9591842, -0.8277238, -0.6480645, 1, 1, 1, 1, 1,
-0.957526, -0.5698845, -1.937579, 1, 1, 1, 1, 1,
-0.9573993, -0.8984134, -1.942052, 1, 1, 1, 1, 1,
-0.9508575, -0.6008554, -0.6131217, 1, 1, 1, 1, 1,
-0.950425, 0.140193, -3.286279, 1, 1, 1, 1, 1,
-0.9453623, 1.183001, 0.4020284, 1, 1, 1, 1, 1,
-0.9397179, -1.715702, -2.077858, 1, 1, 1, 1, 1,
-0.930294, -0.02518887, -1.774448, 1, 1, 1, 1, 1,
-0.9296174, -0.7034663, -4.273941, 1, 1, 1, 1, 1,
-0.9232587, 0.1531861, -2.306877, 0, 0, 1, 1, 1,
-0.9181069, -1.23262, -2.157869, 1, 0, 0, 1, 1,
-0.9165776, 0.68982, -2.719794, 1, 0, 0, 1, 1,
-0.9072362, -0.8586528, -2.696567, 1, 0, 0, 1, 1,
-0.9005036, -0.0006461857, -0.4130606, 1, 0, 0, 1, 1,
-0.8940679, -0.7731783, -2.467818, 1, 0, 0, 1, 1,
-0.8912798, -0.07320756, -2.525077, 0, 0, 0, 1, 1,
-0.8849899, -0.9867591, -1.38702, 0, 0, 0, 1, 1,
-0.8809009, 0.2234748, -1.955868, 0, 0, 0, 1, 1,
-0.874833, -0.3298184, -3.002825, 0, 0, 0, 1, 1,
-0.8624805, -0.5303773, -2.465501, 0, 0, 0, 1, 1,
-0.8541508, -0.2692968, -2.166912, 0, 0, 0, 1, 1,
-0.850951, -0.2240219, -1.133703, 0, 0, 0, 1, 1,
-0.8498725, -0.5971224, -1.423457, 1, 1, 1, 1, 1,
-0.8474203, -0.1117416, -0.8250565, 1, 1, 1, 1, 1,
-0.8437004, -0.3217647, 0.142019, 1, 1, 1, 1, 1,
-0.8433372, -2.210277, -3.819171, 1, 1, 1, 1, 1,
-0.8400971, 0.2642402, -0.96269, 1, 1, 1, 1, 1,
-0.8397579, 0.2454975, -0.8848096, 1, 1, 1, 1, 1,
-0.8287785, -0.8256899, -3.775797, 1, 1, 1, 1, 1,
-0.8250207, 0.7384564, -0.1095327, 1, 1, 1, 1, 1,
-0.8239076, -0.2726051, -1.003639, 1, 1, 1, 1, 1,
-0.8205284, 0.02400854, -1.365496, 1, 1, 1, 1, 1,
-0.8170131, -0.5504017, -2.399297, 1, 1, 1, 1, 1,
-0.8138943, 1.208497, -1.042618, 1, 1, 1, 1, 1,
-0.811686, 0.3776028, -1.659943, 1, 1, 1, 1, 1,
-0.8028296, -0.7323301, -0.4994583, 1, 1, 1, 1, 1,
-0.8026934, -0.4171538, -2.351173, 1, 1, 1, 1, 1,
-0.7988325, -1.348577, -4.402375, 0, 0, 1, 1, 1,
-0.7927763, 1.056816, -1.39177, 1, 0, 0, 1, 1,
-0.7676241, 0.4766493, -1.131586, 1, 0, 0, 1, 1,
-0.7610909, -0.2354302, 1.201602, 1, 0, 0, 1, 1,
-0.7609487, -0.01889091, -2.336721, 1, 0, 0, 1, 1,
-0.7572381, -1.077801, -3.743507, 1, 0, 0, 1, 1,
-0.7562701, -0.2336345, -1.352678, 0, 0, 0, 1, 1,
-0.7559137, -0.4577752, -4.701884, 0, 0, 0, 1, 1,
-0.7550073, -1.597672, -3.205144, 0, 0, 0, 1, 1,
-0.7521025, -0.3944087, -2.06953, 0, 0, 0, 1, 1,
-0.7517852, 0.4016151, -0.3368245, 0, 0, 0, 1, 1,
-0.747639, 0.3612386, -0.5283928, 0, 0, 0, 1, 1,
-0.7446708, -0.4035772, -2.469918, 0, 0, 0, 1, 1,
-0.741281, -0.3567191, -2.988928, 1, 1, 1, 1, 1,
-0.7409315, 0.7261067, -1.932396, 1, 1, 1, 1, 1,
-0.7397233, 0.4873108, -0.5331776, 1, 1, 1, 1, 1,
-0.7349216, 0.5098682, 0.4747573, 1, 1, 1, 1, 1,
-0.7300051, 0.7506766, -1.036373, 1, 1, 1, 1, 1,
-0.7260364, -1.648916, -3.120689, 1, 1, 1, 1, 1,
-0.7175299, -1.119585, -3.812723, 1, 1, 1, 1, 1,
-0.716588, 1.223003, -0.5457684, 1, 1, 1, 1, 1,
-0.709047, -2.058092, -2.81208, 1, 1, 1, 1, 1,
-0.7059639, 0.02334473, -3.467946, 1, 1, 1, 1, 1,
-0.6975445, 0.4690456, 0.0732535, 1, 1, 1, 1, 1,
-0.6969434, -0.07459484, -2.496223, 1, 1, 1, 1, 1,
-0.6888877, -0.1815754, -2.350528, 1, 1, 1, 1, 1,
-0.6825898, -0.8436978, -0.4012566, 1, 1, 1, 1, 1,
-0.6821799, 1.490124, -0.4084508, 1, 1, 1, 1, 1,
-0.6816078, 2.206484, -2.993007, 0, 0, 1, 1, 1,
-0.6758364, 1.490461, -0.6080807, 1, 0, 0, 1, 1,
-0.6747106, -1.289631, -2.956394, 1, 0, 0, 1, 1,
-0.6700898, -0.4641615, -0.6450321, 1, 0, 0, 1, 1,
-0.6692627, -1.751245, -3.311785, 1, 0, 0, 1, 1,
-0.6642604, 0.6829017, -0.7494542, 1, 0, 0, 1, 1,
-0.6632749, 1.627548, -0.8089598, 0, 0, 0, 1, 1,
-0.6625323, 0.7823559, -1.555622, 0, 0, 0, 1, 1,
-0.6528209, -0.2309709, 1.09893, 0, 0, 0, 1, 1,
-0.6447124, 0.01478045, -1.715437, 0, 0, 0, 1, 1,
-0.6387187, 0.3100561, -2.199484, 0, 0, 0, 1, 1,
-0.6374035, -0.3664213, -0.8063034, 0, 0, 0, 1, 1,
-0.6333181, -0.5761526, -3.83374, 0, 0, 0, 1, 1,
-0.6280506, -0.2304897, -2.387728, 1, 1, 1, 1, 1,
-0.6176172, 0.3400148, 0.01432596, 1, 1, 1, 1, 1,
-0.612736, 0.3677295, -2.146507, 1, 1, 1, 1, 1,
-0.6077839, 0.2759572, -1.308396, 1, 1, 1, 1, 1,
-0.5986162, -0.7200183, -2.905916, 1, 1, 1, 1, 1,
-0.5913739, 0.8852811, -0.5432959, 1, 1, 1, 1, 1,
-0.590069, -0.8424728, -1.192822, 1, 1, 1, 1, 1,
-0.5895495, -1.501023, -2.446536, 1, 1, 1, 1, 1,
-0.5893696, -0.3092634, -1.175792, 1, 1, 1, 1, 1,
-0.5856056, -0.1022038, -2.510249, 1, 1, 1, 1, 1,
-0.5853702, 1.365162, 0.1580875, 1, 1, 1, 1, 1,
-0.5834559, 2.954215, 0.8204417, 1, 1, 1, 1, 1,
-0.581917, -0.6428898, -1.413526, 1, 1, 1, 1, 1,
-0.5792905, -0.1442627, -1.254032, 1, 1, 1, 1, 1,
-0.5790435, 0.1370422, -2.095974, 1, 1, 1, 1, 1,
-0.5753291, -0.05272024, -2.969723, 0, 0, 1, 1, 1,
-0.5746593, -0.8693644, -1.659807, 1, 0, 0, 1, 1,
-0.5644887, -1.66026, -2.202723, 1, 0, 0, 1, 1,
-0.5615079, 1.709796, -1.060409, 1, 0, 0, 1, 1,
-0.5583775, -1.04168, -2.586273, 1, 0, 0, 1, 1,
-0.5496329, -0.3271368, -1.989705, 1, 0, 0, 1, 1,
-0.5461535, 0.7119517, -0.1418539, 0, 0, 0, 1, 1,
-0.5428517, -0.5735645, -2.261688, 0, 0, 0, 1, 1,
-0.5388221, 1.093818, -0.4804965, 0, 0, 0, 1, 1,
-0.5344421, 0.3727819, -1.360529, 0, 0, 0, 1, 1,
-0.5344088, 0.1278723, -0.9242662, 0, 0, 0, 1, 1,
-0.5320352, -0.6860997, -2.129019, 0, 0, 0, 1, 1,
-0.5307227, -2.02033, -3.593014, 0, 0, 0, 1, 1,
-0.5244874, -0.4235623, 0.1358745, 1, 1, 1, 1, 1,
-0.524319, 0.3159523, -2.159286, 1, 1, 1, 1, 1,
-0.5241698, -1.159634, -1.738001, 1, 1, 1, 1, 1,
-0.5221134, 1.56458, 1.413568, 1, 1, 1, 1, 1,
-0.5177395, 1.10311, 0.8875995, 1, 1, 1, 1, 1,
-0.5130357, -0.1128545, -1.950294, 1, 1, 1, 1, 1,
-0.5091844, 2.055172, -1.404081, 1, 1, 1, 1, 1,
-0.5081473, 0.2101137, -1.388868, 1, 1, 1, 1, 1,
-0.5055301, 0.35411, -0.9459576, 1, 1, 1, 1, 1,
-0.5046751, -1.648739, -3.089794, 1, 1, 1, 1, 1,
-0.5017368, 1.28607, 0.04417123, 1, 1, 1, 1, 1,
-0.5012673, 1.437521, -1.586775, 1, 1, 1, 1, 1,
-0.4970367, -3.559649, -4.054976, 1, 1, 1, 1, 1,
-0.4962621, 1.484805, -0.7785306, 1, 1, 1, 1, 1,
-0.496023, -0.6769762, -3.995018, 1, 1, 1, 1, 1,
-0.4959605, 0.2919805, -0.7252852, 0, 0, 1, 1, 1,
-0.489726, -1.130366, -2.197468, 1, 0, 0, 1, 1,
-0.4847133, 1.130155, -1.416064, 1, 0, 0, 1, 1,
-0.481133, -1.848526, -3.544436, 1, 0, 0, 1, 1,
-0.4803999, -0.7010026, -3.909754, 1, 0, 0, 1, 1,
-0.4776132, -0.4232263, -3.614545, 1, 0, 0, 1, 1,
-0.4771582, -0.1643655, -2.828073, 0, 0, 0, 1, 1,
-0.4767944, -1.885079, -3.067967, 0, 0, 0, 1, 1,
-0.4746607, -0.01827805, -1.771547, 0, 0, 0, 1, 1,
-0.4732625, 0.05789441, -1.915259, 0, 0, 0, 1, 1,
-0.4703153, -0.1940346, -2.658634, 0, 0, 0, 1, 1,
-0.4671727, -1.377214, -2.098776, 0, 0, 0, 1, 1,
-0.4636476, -0.467691, -2.154635, 0, 0, 0, 1, 1,
-0.4631907, 0.9853253, -0.638274, 1, 1, 1, 1, 1,
-0.4592062, 0.4957028, -0.1423005, 1, 1, 1, 1, 1,
-0.4586961, 0.5823134, -0.5330986, 1, 1, 1, 1, 1,
-0.4579422, -0.2986601, -0.9023254, 1, 1, 1, 1, 1,
-0.4555664, 0.9885074, -2.252104, 1, 1, 1, 1, 1,
-0.4547754, 1.032205, -3.614743, 1, 1, 1, 1, 1,
-0.4516758, -1.812701, -3.732104, 1, 1, 1, 1, 1,
-0.4512719, -0.4496644, -1.912446, 1, 1, 1, 1, 1,
-0.4507467, 0.73111, -0.1860522, 1, 1, 1, 1, 1,
-0.4432887, 1.011682, -0.1121433, 1, 1, 1, 1, 1,
-0.442818, 0.8143313, -0.4851397, 1, 1, 1, 1, 1,
-0.4419678, -0.8244396, -2.466245, 1, 1, 1, 1, 1,
-0.4362412, 0.0343351, -0.6268973, 1, 1, 1, 1, 1,
-0.4319734, 0.6421535, 1.954414, 1, 1, 1, 1, 1,
-0.4258719, 0.7344164, 0.1172015, 1, 1, 1, 1, 1,
-0.4258295, 0.4996993, -0.4199533, 0, 0, 1, 1, 1,
-0.4239707, -1.231812, -3.5297, 1, 0, 0, 1, 1,
-0.4195149, -1.733503, -2.666795, 1, 0, 0, 1, 1,
-0.4024755, 0.8159186, -0.7383074, 1, 0, 0, 1, 1,
-0.4018452, -0.7024551, -4.265793, 1, 0, 0, 1, 1,
-0.3943485, -0.5143709, -2.176272, 1, 0, 0, 1, 1,
-0.3915757, 1.049061, -0.5616468, 0, 0, 0, 1, 1,
-0.3891068, -0.4181639, -2.732449, 0, 0, 0, 1, 1,
-0.3868191, -0.6588135, -0.741545, 0, 0, 0, 1, 1,
-0.3823764, 0.8462995, 0.2433941, 0, 0, 0, 1, 1,
-0.3815269, -0.7763724, -1.482724, 0, 0, 0, 1, 1,
-0.3794459, 1.38653, -0.2914447, 0, 0, 0, 1, 1,
-0.379409, 0.6951145, -1.019394, 0, 0, 0, 1, 1,
-0.3775695, 1.981486, -1.460861, 1, 1, 1, 1, 1,
-0.3774747, -2.287694, -2.274388, 1, 1, 1, 1, 1,
-0.3756407, 0.707606, -0.4914042, 1, 1, 1, 1, 1,
-0.3750472, 0.2542437, 1.427913, 1, 1, 1, 1, 1,
-0.3703364, 0.844408, -0.6142239, 1, 1, 1, 1, 1,
-0.3630936, 0.1718241, -1.643107, 1, 1, 1, 1, 1,
-0.362868, -0.5401354, -4.308482, 1, 1, 1, 1, 1,
-0.3604558, -1.702018, -1.817499, 1, 1, 1, 1, 1,
-0.3599861, 0.5597512, 1.015932, 1, 1, 1, 1, 1,
-0.3577787, -0.01340438, -1.840361, 1, 1, 1, 1, 1,
-0.3561125, 0.4909908, 1.327141, 1, 1, 1, 1, 1,
-0.3539949, -1.748872, -2.475105, 1, 1, 1, 1, 1,
-0.3529099, -0.6901944, -3.23806, 1, 1, 1, 1, 1,
-0.3454619, 0.1039975, -0.9507833, 1, 1, 1, 1, 1,
-0.3450612, 0.1321525, -0.8932356, 1, 1, 1, 1, 1,
-0.3379806, -0.1539874, -3.319763, 0, 0, 1, 1, 1,
-0.3358087, 0.1871631, 0.2458916, 1, 0, 0, 1, 1,
-0.335579, 0.7399677, -1.35014, 1, 0, 0, 1, 1,
-0.33277, -0.5612827, -3.420787, 1, 0, 0, 1, 1,
-0.3321236, -0.2332934, -3.926504, 1, 0, 0, 1, 1,
-0.3293276, 0.7658557, -0.8823388, 1, 0, 0, 1, 1,
-0.3287148, -0.5186107, -3.446976, 0, 0, 0, 1, 1,
-0.3278358, 0.843786, 0.2141805, 0, 0, 0, 1, 1,
-0.3251718, -0.03571973, -2.024393, 0, 0, 0, 1, 1,
-0.3216421, 0.1494668, -0.3593643, 0, 0, 0, 1, 1,
-0.3177782, 2.694273, -0.383936, 0, 0, 0, 1, 1,
-0.3120884, -0.5236366, -0.2313519, 0, 0, 0, 1, 1,
-0.2989886, -0.4123357, -2.54036, 0, 0, 0, 1, 1,
-0.297929, 0.1881892, -2.32234, 1, 1, 1, 1, 1,
-0.2957188, 1.457341, -0.432519, 1, 1, 1, 1, 1,
-0.2948903, 0.6864922, -1.205643, 1, 1, 1, 1, 1,
-0.2862732, 0.1530893, -0.7203053, 1, 1, 1, 1, 1,
-0.2844661, -1.538679, -2.902261, 1, 1, 1, 1, 1,
-0.2816734, -1.405824, -4.679711, 1, 1, 1, 1, 1,
-0.2806652, -1.076636, -2.851411, 1, 1, 1, 1, 1,
-0.2782332, -1.175601, -1.860727, 1, 1, 1, 1, 1,
-0.2744386, 1.164859, -1.663437, 1, 1, 1, 1, 1,
-0.2678346, 0.6139761, 0.4605882, 1, 1, 1, 1, 1,
-0.2666893, 0.1613442, 0.05645139, 1, 1, 1, 1, 1,
-0.2634665, 0.003436361, -2.59582, 1, 1, 1, 1, 1,
-0.2611291, 1.444691, 1.105356, 1, 1, 1, 1, 1,
-0.2561587, 0.8127985, -0.5841015, 1, 1, 1, 1, 1,
-0.2540889, 0.08135982, -2.488868, 1, 1, 1, 1, 1,
-0.2537566, 0.179527, -3.35613, 0, 0, 1, 1, 1,
-0.2490016, 0.1321899, -1.065734, 1, 0, 0, 1, 1,
-0.2469799, 1.022747, 0.5597752, 1, 0, 0, 1, 1,
-0.2462048, 2.248821, 2.411919, 1, 0, 0, 1, 1,
-0.2448153, 2.420965, 0.2629039, 1, 0, 0, 1, 1,
-0.2429441, 0.6782752, -0.5722401, 1, 0, 0, 1, 1,
-0.2412582, -0.8010759, -3.542158, 0, 0, 0, 1, 1,
-0.2388664, 0.09916989, -0.09526324, 0, 0, 0, 1, 1,
-0.2365804, 0.4116877, 0.2732351, 0, 0, 0, 1, 1,
-0.2334793, -1.000299, -3.506591, 0, 0, 0, 1, 1,
-0.2326021, 0.5205873, 0.6943165, 0, 0, 0, 1, 1,
-0.2244451, -0.3882557, -0.7430846, 0, 0, 0, 1, 1,
-0.2199762, 0.02698881, -0.6501931, 0, 0, 0, 1, 1,
-0.21735, 1.240992, 1.0584, 1, 1, 1, 1, 1,
-0.2163498, 1.138932, -0.07636139, 1, 1, 1, 1, 1,
-0.2156193, 3.82074, 0.6001577, 1, 1, 1, 1, 1,
-0.2136959, 0.2822517, 0.2450334, 1, 1, 1, 1, 1,
-0.212435, -0.9992112, -0.988952, 1, 1, 1, 1, 1,
-0.2059484, 0.2048861, -0.3532074, 1, 1, 1, 1, 1,
-0.2031126, -0.8747777, -3.880257, 1, 1, 1, 1, 1,
-0.2014833, 0.9804383, -0.5037573, 1, 1, 1, 1, 1,
-0.2008775, 1.749688, 0.2569372, 1, 1, 1, 1, 1,
-0.2000156, 0.06532167, -2.111429, 1, 1, 1, 1, 1,
-0.1980505, 0.1663173, -1.235679, 1, 1, 1, 1, 1,
-0.1969256, -0.3217632, -2.240675, 1, 1, 1, 1, 1,
-0.1948838, 1.264306, -0.1103458, 1, 1, 1, 1, 1,
-0.185555, 0.699743, -1.218103, 1, 1, 1, 1, 1,
-0.1804856, -0.8323103, -3.947724, 1, 1, 1, 1, 1,
-0.1746097, -0.5222414, -1.941268, 0, 0, 1, 1, 1,
-0.1695418, -0.9884303, -1.898299, 1, 0, 0, 1, 1,
-0.1562369, -0.7501522, -2.562512, 1, 0, 0, 1, 1,
-0.1540546, 0.8192945, -0.1791414, 1, 0, 0, 1, 1,
-0.1523779, 1.502761, -1.538245, 1, 0, 0, 1, 1,
-0.1482054, 0.7850937, 1.716873, 1, 0, 0, 1, 1,
-0.1469351, 2.035384, -0.2795084, 0, 0, 0, 1, 1,
-0.1446346, 1.254092, -0.7123058, 0, 0, 0, 1, 1,
-0.1409248, -1.257514, -3.996744, 0, 0, 0, 1, 1,
-0.1398447, 0.4451852, -0.3991776, 0, 0, 0, 1, 1,
-0.1396909, 0.6942676, 0.9733774, 0, 0, 0, 1, 1,
-0.1332688, -1.461513, -2.375933, 0, 0, 0, 1, 1,
-0.1328163, 1.337853, -0.6672459, 0, 0, 0, 1, 1,
-0.1327718, -2.64749, -2.518414, 1, 1, 1, 1, 1,
-0.1134109, -1.158163, -3.888136, 1, 1, 1, 1, 1,
-0.1132443, -1.664426, -3.121875, 1, 1, 1, 1, 1,
-0.1101537, -0.232308, -2.846687, 1, 1, 1, 1, 1,
-0.1065146, 0.7001249, 0.8286639, 1, 1, 1, 1, 1,
-0.1063224, -0.8487253, -3.455621, 1, 1, 1, 1, 1,
-0.1033456, -0.3387162, -3.079132, 1, 1, 1, 1, 1,
-0.1010692, 1.068838, 0.9167823, 1, 1, 1, 1, 1,
-0.1005404, 0.7326165, 0.9829187, 1, 1, 1, 1, 1,
-0.1005037, 0.02803109, -3.372646, 1, 1, 1, 1, 1,
-0.09967092, -1.717995, -0.6038333, 1, 1, 1, 1, 1,
-0.09891062, 1.235959, 1.157113, 1, 1, 1, 1, 1,
-0.09589262, -1.67644, -2.905958, 1, 1, 1, 1, 1,
-0.09452718, 0.7224745, 0.4224941, 1, 1, 1, 1, 1,
-0.09383686, -2.180212, -1.039373, 1, 1, 1, 1, 1,
-0.09295708, 0.7986258, -0.7451707, 0, 0, 1, 1, 1,
-0.08979509, -1.44158, -4.873666, 1, 0, 0, 1, 1,
-0.08718497, 0.5524123, -0.1760831, 1, 0, 0, 1, 1,
-0.0815323, 1.724164, -0.7084597, 1, 0, 0, 1, 1,
-0.0793466, 0.1122903, 1.158363, 1, 0, 0, 1, 1,
-0.07748853, 1.842993, 0.8118949, 1, 0, 0, 1, 1,
-0.07529109, -1.144276, -3.915234, 0, 0, 0, 1, 1,
-0.07482049, 1.515824, 0.7383853, 0, 0, 0, 1, 1,
-0.07389455, -0.1679074, -1.362873, 0, 0, 0, 1, 1,
-0.07056504, -1.080754, -4.98582, 0, 0, 0, 1, 1,
-0.07046216, -0.0574277, -2.34373, 0, 0, 0, 1, 1,
-0.06304735, 1.322369, 0.4224767, 0, 0, 0, 1, 1,
-0.06232961, -0.2478117, -1.75304, 0, 0, 0, 1, 1,
-0.06031029, -0.7596794, -2.573989, 1, 1, 1, 1, 1,
-0.05935683, 2.883016, -0.01431812, 1, 1, 1, 1, 1,
-0.05863635, -1.388418, -2.731401, 1, 1, 1, 1, 1,
-0.05820467, 1.814338, 0.1366659, 1, 1, 1, 1, 1,
-0.05246335, -0.1137611, -1.460618, 1, 1, 1, 1, 1,
-0.05245675, 0.4963837, -1.197655, 1, 1, 1, 1, 1,
-0.04609832, -0.2560242, -2.100355, 1, 1, 1, 1, 1,
-0.04078368, -2.750705, -2.218591, 1, 1, 1, 1, 1,
-0.03925867, 1.369994, 0.5068194, 1, 1, 1, 1, 1,
-0.03722606, 0.6498119, -0.6689163, 1, 1, 1, 1, 1,
-0.03631296, 1.285786, 0.8025634, 1, 1, 1, 1, 1,
-0.0345628, 0.5234685, 0.8246791, 1, 1, 1, 1, 1,
-0.03304654, 2.548795, 1.152236, 1, 1, 1, 1, 1,
-0.03065152, 0.920709, -0.1675089, 1, 1, 1, 1, 1,
-0.02870305, -1.330385, -2.731656, 1, 1, 1, 1, 1,
-0.02749358, -0.08223522, -2.984954, 0, 0, 1, 1, 1,
-0.02747115, -0.5199572, -2.202194, 1, 0, 0, 1, 1,
-0.0256736, 1.535071, 0.3250157, 1, 0, 0, 1, 1,
-0.02344909, -1.829359, -1.6235, 1, 0, 0, 1, 1,
-0.02131561, 0.3349422, -0.7158129, 1, 0, 0, 1, 1,
-0.01986754, -0.4266589, -2.775277, 1, 0, 0, 1, 1,
-0.01975778, -1.048237, -3.618659, 0, 0, 0, 1, 1,
-0.01787512, 0.3118593, -0.4762636, 0, 0, 0, 1, 1,
-0.01778838, 0.0980396, -0.47577, 0, 0, 0, 1, 1,
-0.0125422, 0.2387371, 1.164801, 0, 0, 0, 1, 1,
-0.01124828, 0.9286848, -0.4794793, 0, 0, 0, 1, 1,
-0.009488575, 0.3605029, 1.710703, 0, 0, 0, 1, 1,
-0.008122412, -0.4854825, -2.380252, 0, 0, 0, 1, 1,
-0.00535914, 0.9322509, -0.04143071, 1, 1, 1, 1, 1,
-0.003073051, -0.6425592, -3.209342, 1, 1, 1, 1, 1,
-0.001322732, 0.1054177, -0.756038, 1, 1, 1, 1, 1,
-5.949488e-05, 0.09663579, -2.021678, 1, 1, 1, 1, 1,
0.001277177, 0.002432117, 0.6302367, 1, 1, 1, 1, 1,
0.001773912, -0.2958283, 5.003815, 1, 1, 1, 1, 1,
0.01172928, -0.6658413, 2.921852, 1, 1, 1, 1, 1,
0.0158832, -0.4012343, 1.392257, 1, 1, 1, 1, 1,
0.01834903, 0.1029409, 1.04059, 1, 1, 1, 1, 1,
0.02109557, 1.266996, 0.1847439, 1, 1, 1, 1, 1,
0.02218586, -0.8807908, 2.470581, 1, 1, 1, 1, 1,
0.02328068, 0.6017362, -2.187209, 1, 1, 1, 1, 1,
0.03101358, -0.4574217, 1.63591, 1, 1, 1, 1, 1,
0.0323819, -0.7754506, 3.046868, 1, 1, 1, 1, 1,
0.03340204, 0.2255845, 1.451433, 1, 1, 1, 1, 1,
0.03574257, -1.237756, 3.764887, 0, 0, 1, 1, 1,
0.03620487, 0.571911, -0.4390807, 1, 0, 0, 1, 1,
0.03891893, 1.978047, 0.04709977, 1, 0, 0, 1, 1,
0.05024786, -0.7067865, 4.96725, 1, 0, 0, 1, 1,
0.05262453, 1.761108, 0.6580306, 1, 0, 0, 1, 1,
0.0527923, 1.335226, 1.607889, 1, 0, 0, 1, 1,
0.053723, -0.376324, 3.934683, 0, 0, 0, 1, 1,
0.05571528, -0.6799752, 4.194729, 0, 0, 0, 1, 1,
0.05706063, -0.6348631, 3.013654, 0, 0, 0, 1, 1,
0.06539334, -0.2661611, 6.419516, 0, 0, 0, 1, 1,
0.07450613, -1.557981, 3.615424, 0, 0, 0, 1, 1,
0.07478455, -0.7697751, 2.620219, 0, 0, 0, 1, 1,
0.07577384, 1.417674, -0.4563726, 0, 0, 0, 1, 1,
0.07701449, 1.310746, 0.714724, 1, 1, 1, 1, 1,
0.07867081, 0.6792502, 0.4763441, 1, 1, 1, 1, 1,
0.08577144, 0.01444039, 0.1227978, 1, 1, 1, 1, 1,
0.08757786, -0.5780187, 2.845785, 1, 1, 1, 1, 1,
0.08758067, -0.7253737, 2.963298, 1, 1, 1, 1, 1,
0.09149334, -0.6501827, 2.705888, 1, 1, 1, 1, 1,
0.09363081, 0.477116, 0.9643266, 1, 1, 1, 1, 1,
0.09545203, -0.9724432, 4.311949, 1, 1, 1, 1, 1,
0.1013938, 1.735193, -1.012491, 1, 1, 1, 1, 1,
0.1035279, 0.7632014, -0.8830367, 1, 1, 1, 1, 1,
0.1036276, 0.4001766, -0.7102568, 1, 1, 1, 1, 1,
0.103825, 0.6669887, 0.280562, 1, 1, 1, 1, 1,
0.1061009, 0.5836371, -1.775224, 1, 1, 1, 1, 1,
0.1061825, 0.8483503, -0.08627176, 1, 1, 1, 1, 1,
0.1072084, -0.1232713, 2.561104, 1, 1, 1, 1, 1,
0.1073875, -1.441615, 4.241249, 0, 0, 1, 1, 1,
0.1092285, 0.172322, 0.3229353, 1, 0, 0, 1, 1,
0.1146569, 0.06241438, 0.5624969, 1, 0, 0, 1, 1,
0.1200928, 1.074367, 0.6615133, 1, 0, 0, 1, 1,
0.1242341, 1.927324, -1.320556, 1, 0, 0, 1, 1,
0.1304769, -0.4671242, 4.012365, 1, 0, 0, 1, 1,
0.136023, 0.06812666, 1.32175, 0, 0, 0, 1, 1,
0.1374664, -0.1471527, 4.285868, 0, 0, 0, 1, 1,
0.138805, -1.764826, 5.100434, 0, 0, 0, 1, 1,
0.1409601, -1.246459, 3.852602, 0, 0, 0, 1, 1,
0.1448847, -0.82753, 4.313948, 0, 0, 0, 1, 1,
0.1467562, 0.8459188, -0.08409603, 0, 0, 0, 1, 1,
0.147283, 0.2290916, 0.004778617, 0, 0, 0, 1, 1,
0.1493441, 0.8412527, 0.2043731, 1, 1, 1, 1, 1,
0.1495441, -0.9598179, 3.598735, 1, 1, 1, 1, 1,
0.1501295, 1.03012, -0.72111, 1, 1, 1, 1, 1,
0.1544822, -0.01913253, 0.2875988, 1, 1, 1, 1, 1,
0.1555417, -0.3057193, 1.573353, 1, 1, 1, 1, 1,
0.1569173, -0.004608385, 2.85546, 1, 1, 1, 1, 1,
0.1607017, -0.4937439, 2.999193, 1, 1, 1, 1, 1,
0.1618187, 0.5964435, 0.7471719, 1, 1, 1, 1, 1,
0.1626325, 1.674028, 1.312597, 1, 1, 1, 1, 1,
0.1689887, 0.9178932, 0.3891826, 1, 1, 1, 1, 1,
0.169394, -0.5063016, 1.861961, 1, 1, 1, 1, 1,
0.1754678, 0.5662197, 1.809392, 1, 1, 1, 1, 1,
0.1772045, 0.2201033, 0.5059977, 1, 1, 1, 1, 1,
0.178422, 0.2677885, -0.6651791, 1, 1, 1, 1, 1,
0.1822481, -1.566614, 4.227083, 1, 1, 1, 1, 1,
0.1827668, -0.6411994, 3.981089, 0, 0, 1, 1, 1,
0.1836048, -0.1049389, 2.976465, 1, 0, 0, 1, 1,
0.1862367, -0.3537403, 1.738645, 1, 0, 0, 1, 1,
0.1878242, -0.4261387, 2.702008, 1, 0, 0, 1, 1,
0.19248, -0.5578156, 1.692105, 1, 0, 0, 1, 1,
0.1928781, -0.3306203, 3.064356, 1, 0, 0, 1, 1,
0.1941675, -0.3084182, 3.326714, 0, 0, 0, 1, 1,
0.2003156, -3.471176, 3.736507, 0, 0, 0, 1, 1,
0.2032645, -1.198897, 4.545875, 0, 0, 0, 1, 1,
0.2037804, -0.2238493, 0.2439031, 0, 0, 0, 1, 1,
0.2118091, -0.2190343, 3.062965, 0, 0, 0, 1, 1,
0.2137221, 0.8097028, 2.000619, 0, 0, 0, 1, 1,
0.2159942, 1.362227, -0.0156078, 0, 0, 0, 1, 1,
0.2204458, 0.8304573, 0.06366666, 1, 1, 1, 1, 1,
0.2231795, -0.09948505, 3.537879, 1, 1, 1, 1, 1,
0.2260889, 0.7800311, -0.2039707, 1, 1, 1, 1, 1,
0.2301712, -0.2790138, 1.601107, 1, 1, 1, 1, 1,
0.233384, -1.061792, 1.489254, 1, 1, 1, 1, 1,
0.2338026, 1.506167, 1.020415, 1, 1, 1, 1, 1,
0.237108, -1.485691, 4.781762, 1, 1, 1, 1, 1,
0.2388853, -1.253704, 3.298107, 1, 1, 1, 1, 1,
0.2398145, -0.4450362, 2.357474, 1, 1, 1, 1, 1,
0.2415076, 0.01768794, 2.30394, 1, 1, 1, 1, 1,
0.254306, 0.452796, -0.03858793, 1, 1, 1, 1, 1,
0.2618532, -2.441671, 2.162102, 1, 1, 1, 1, 1,
0.2625751, -0.1500439, 0.4137977, 1, 1, 1, 1, 1,
0.2675033, 0.1426203, 1.527041, 1, 1, 1, 1, 1,
0.267899, 1.69427, -0.9727424, 1, 1, 1, 1, 1,
0.2688785, 0.9120915, 1.272841, 0, 0, 1, 1, 1,
0.2700803, 0.4481694, 1.359112, 1, 0, 0, 1, 1,
0.2715001, 1.581402, 1.15338, 1, 0, 0, 1, 1,
0.2740578, 0.01613908, 0.3957311, 1, 0, 0, 1, 1,
0.2781264, -2.130924, 2.098314, 1, 0, 0, 1, 1,
0.2801723, -2.384153, 2.993576, 1, 0, 0, 1, 1,
0.2812281, -0.5278271, 2.106465, 0, 0, 0, 1, 1,
0.2883581, -1.668967, 1.996646, 0, 0, 0, 1, 1,
0.2884236, 0.3230694, -0.5484759, 0, 0, 0, 1, 1,
0.2892039, 0.6786645, 1.158192, 0, 0, 0, 1, 1,
0.2898403, 0.8311297, -0.3063943, 0, 0, 0, 1, 1,
0.2983549, -0.02955253, -0.6743284, 0, 0, 0, 1, 1,
0.3003317, 0.9333992, -0.1315038, 0, 0, 0, 1, 1,
0.3098277, -1.031637, 3.885067, 1, 1, 1, 1, 1,
0.3115506, 0.4716014, 0.1794732, 1, 1, 1, 1, 1,
0.3136123, -0.547033, 2.703745, 1, 1, 1, 1, 1,
0.314196, -0.1165287, 2.10658, 1, 1, 1, 1, 1,
0.3144853, -0.06406879, 1.162998, 1, 1, 1, 1, 1,
0.3161674, 0.3674074, 0.6178927, 1, 1, 1, 1, 1,
0.3170491, -0.4545733, 1.499271, 1, 1, 1, 1, 1,
0.32264, 0.8174583, -0.601478, 1, 1, 1, 1, 1,
0.3289157, -0.7475751, 2.972292, 1, 1, 1, 1, 1,
0.3299307, -1.13321, 3.580642, 1, 1, 1, 1, 1,
0.3334943, -1.309597, 1.348168, 1, 1, 1, 1, 1,
0.3363594, -0.3512474, 1.055635, 1, 1, 1, 1, 1,
0.3376863, -1.245148, 2.424211, 1, 1, 1, 1, 1,
0.339231, 0.143159, -0.3153027, 1, 1, 1, 1, 1,
0.3405823, -0.5160719, 4.627332, 1, 1, 1, 1, 1,
0.3445133, 1.708599, -1.279793, 0, 0, 1, 1, 1,
0.3567702, 0.4906301, 1.101387, 1, 0, 0, 1, 1,
0.3577009, 0.5444779, 1.108251, 1, 0, 0, 1, 1,
0.3597205, 2.150422, 1.456129, 1, 0, 0, 1, 1,
0.3603073, -0.6638343, 3.404494, 1, 0, 0, 1, 1,
0.3624744, -0.3169217, 1.310383, 1, 0, 0, 1, 1,
0.3626228, -0.5989682, 4.120303, 0, 0, 0, 1, 1,
0.3667686, -1.762213, 2.745997, 0, 0, 0, 1, 1,
0.367178, -2.228948, 3.928207, 0, 0, 0, 1, 1,
0.3706599, -1.012867, 2.667372, 0, 0, 0, 1, 1,
0.3835649, -1.217179, 3.798607, 0, 0, 0, 1, 1,
0.3837076, -0.4603856, 1.475932, 0, 0, 0, 1, 1,
0.3840972, 0.5579901, 0.9820467, 0, 0, 0, 1, 1,
0.3857194, 1.147176, 0.00628288, 1, 1, 1, 1, 1,
0.3864703, -0.1180335, 2.311932, 1, 1, 1, 1, 1,
0.3865976, 0.859354, 0.8309402, 1, 1, 1, 1, 1,
0.3888704, -0.3432078, 3.112669, 1, 1, 1, 1, 1,
0.3893534, 0.273679, 1.887866, 1, 1, 1, 1, 1,
0.3894973, -0.7127191, 1.781736, 1, 1, 1, 1, 1,
0.3907308, 2.648767, -1.214963, 1, 1, 1, 1, 1,
0.3941574, -0.5308821, 2.238398, 1, 1, 1, 1, 1,
0.3953184, 0.2995742, 3.095596, 1, 1, 1, 1, 1,
0.4036195, -0.7381362, 3.29842, 1, 1, 1, 1, 1,
0.4090863, -1.237676, 2.379428, 1, 1, 1, 1, 1,
0.4119079, -0.869727, 2.31892, 1, 1, 1, 1, 1,
0.4125528, 1.802826, -0.8027111, 1, 1, 1, 1, 1,
0.4148416, 0.5694332, 2.64139, 1, 1, 1, 1, 1,
0.4149744, -1.250059, 2.630408, 1, 1, 1, 1, 1,
0.4164719, 0.5246184, 1.531115, 0, 0, 1, 1, 1,
0.4185935, 0.4105026, 2.781434, 1, 0, 0, 1, 1,
0.4193772, -0.361002, 2.173824, 1, 0, 0, 1, 1,
0.4195918, -0.0959156, 2.216319, 1, 0, 0, 1, 1,
0.4235543, -0.5346922, 3.717891, 1, 0, 0, 1, 1,
0.4243423, -1.132593, 3.365202, 1, 0, 0, 1, 1,
0.4249085, 0.7534165, -0.2948689, 0, 0, 0, 1, 1,
0.4280411, 0.9193705, 1.464241, 0, 0, 0, 1, 1,
0.4284593, -1.012995, 2.942685, 0, 0, 0, 1, 1,
0.4303406, -0.03334644, 1.294642, 0, 0, 0, 1, 1,
0.4328473, -0.5329802, 0.6395666, 0, 0, 0, 1, 1,
0.4329593, 0.248734, 2.663112, 0, 0, 0, 1, 1,
0.4331748, -1.660852, 2.010893, 0, 0, 0, 1, 1,
0.4338432, 2.440546, -1.42317, 1, 1, 1, 1, 1,
0.4403729, 0.1183678, -0.08190155, 1, 1, 1, 1, 1,
0.4451505, 1.154566, 0.348927, 1, 1, 1, 1, 1,
0.4533964, -0.4097861, 1.482238, 1, 1, 1, 1, 1,
0.4575554, 0.4491653, 0.5491387, 1, 1, 1, 1, 1,
0.4613156, -0.381759, 1.579428, 1, 1, 1, 1, 1,
0.4616843, 0.4762227, 1.322064, 1, 1, 1, 1, 1,
0.4637979, -0.2680995, 2.619087, 1, 1, 1, 1, 1,
0.4659355, -0.6381052, 1.19796, 1, 1, 1, 1, 1,
0.4662223, -0.191943, 1.808863, 1, 1, 1, 1, 1,
0.4686084, 1.302847, 0.3951998, 1, 1, 1, 1, 1,
0.4710799, -0.06519407, 2.310808, 1, 1, 1, 1, 1,
0.4726697, -2.947937, 4.784223, 1, 1, 1, 1, 1,
0.4739818, -2.410982, 2.740638, 1, 1, 1, 1, 1,
0.4741827, -0.06241952, 1.479189, 1, 1, 1, 1, 1,
0.474341, 1.166143, 2.085391, 0, 0, 1, 1, 1,
0.4758997, -1.108258, 0.09871911, 1, 0, 0, 1, 1,
0.4760371, 0.4599962, 0.2295717, 1, 0, 0, 1, 1,
0.4774673, 0.07730306, 1.547847, 1, 0, 0, 1, 1,
0.4775326, 1.69734, 0.1025859, 1, 0, 0, 1, 1,
0.4784125, -0.7624788, 1.229558, 1, 0, 0, 1, 1,
0.4890643, 0.9775264, 1.198481, 0, 0, 0, 1, 1,
0.4904559, -0.01944084, 0.06544868, 0, 0, 0, 1, 1,
0.4936871, 1.368609, 0.2152374, 0, 0, 0, 1, 1,
0.4998019, -1.44544, 0.6155387, 0, 0, 0, 1, 1,
0.5005053, -0.1209646, 3.242113, 0, 0, 0, 1, 1,
0.5007461, 0.9091224, 0.4506733, 0, 0, 0, 1, 1,
0.5020249, -1.055437, 2.295462, 0, 0, 0, 1, 1,
0.5032572, -0.4916559, 2.549335, 1, 1, 1, 1, 1,
0.5076156, -0.7218958, 3.530472, 1, 1, 1, 1, 1,
0.5080528, 0.7810799, -0.4013231, 1, 1, 1, 1, 1,
0.5084258, 0.3666348, 1.8147, 1, 1, 1, 1, 1,
0.518311, -0.8881841, 4.359097, 1, 1, 1, 1, 1,
0.5207018, 2.471636, -1.491141, 1, 1, 1, 1, 1,
0.530644, 0.1692809, -0.4014695, 1, 1, 1, 1, 1,
0.5326997, 0.565027, 0.09098721, 1, 1, 1, 1, 1,
0.5352098, 0.3622884, 0.6946415, 1, 1, 1, 1, 1,
0.5378287, -0.5289617, 2.284875, 1, 1, 1, 1, 1,
0.540675, -1.033487, 1.417294, 1, 1, 1, 1, 1,
0.545369, -0.4911247, 3.387124, 1, 1, 1, 1, 1,
0.5477676, -0.04416312, 0.9667156, 1, 1, 1, 1, 1,
0.5493802, -0.2431567, 1.8346, 1, 1, 1, 1, 1,
0.5499358, -1.554142, 2.639536, 1, 1, 1, 1, 1,
0.5508895, -0.4776558, 2.438687, 0, 0, 1, 1, 1,
0.5514751, -0.4084502, 2.489747, 1, 0, 0, 1, 1,
0.5521821, 1.243158, 0.2801328, 1, 0, 0, 1, 1,
0.5579621, 1.433921, -0.870432, 1, 0, 0, 1, 1,
0.561639, -0.01604383, 3.143587, 1, 0, 0, 1, 1,
0.5629106, -0.6912356, 2.210136, 1, 0, 0, 1, 1,
0.5630371, -0.2141041, 1.857381, 0, 0, 0, 1, 1,
0.5642572, 0.04827261, 1.302364, 0, 0, 0, 1, 1,
0.5650731, 0.19159, 2.024319, 0, 0, 0, 1, 1,
0.5666374, -0.9161114, 2.685327, 0, 0, 0, 1, 1,
0.5672033, 1.187117, 0.008237838, 0, 0, 0, 1, 1,
0.5713309, -0.5062439, 3.290486, 0, 0, 0, 1, 1,
0.5746316, 1.279928, 1.050567, 0, 0, 0, 1, 1,
0.5753435, -1.463637, 1.877565, 1, 1, 1, 1, 1,
0.5767892, 0.1301167, 1.427686, 1, 1, 1, 1, 1,
0.5813838, 0.4737157, -0.4267507, 1, 1, 1, 1, 1,
0.5823616, -0.9168025, 2.703729, 1, 1, 1, 1, 1,
0.5891228, 0.3849334, 2.032389, 1, 1, 1, 1, 1,
0.5903091, -0.681052, 2.617293, 1, 1, 1, 1, 1,
0.5993094, 0.6432862, 0.464942, 1, 1, 1, 1, 1,
0.6000361, 0.002496494, 3.352597, 1, 1, 1, 1, 1,
0.602708, -2.20044, 1.278801, 1, 1, 1, 1, 1,
0.6058481, 1.210056, 0.933199, 1, 1, 1, 1, 1,
0.6067369, 0.1390861, 0.9386876, 1, 1, 1, 1, 1,
0.6078852, 0.7023211, 0.8544534, 1, 1, 1, 1, 1,
0.6106707, 1.959537, 1.013341, 1, 1, 1, 1, 1,
0.6118122, -1.308657, 2.287264, 1, 1, 1, 1, 1,
0.6163502, 2.098711, 0.8065307, 1, 1, 1, 1, 1,
0.6177513, 0.0880549, 1.729743, 0, 0, 1, 1, 1,
0.6192928, -1.271127, 3.715102, 1, 0, 0, 1, 1,
0.6287643, -1.438652, 3.664494, 1, 0, 0, 1, 1,
0.6287804, 0.1723085, 1.557552, 1, 0, 0, 1, 1,
0.6331289, 0.2533531, 0.7821695, 1, 0, 0, 1, 1,
0.6344328, 1.283862, -0.2427208, 1, 0, 0, 1, 1,
0.6352522, -0.292814, 3.831968, 0, 0, 0, 1, 1,
0.6404377, -0.6708291, 2.68525, 0, 0, 0, 1, 1,
0.6458895, 2.00651, -0.1632393, 0, 0, 0, 1, 1,
0.6483043, 0.006785693, 3.576445, 0, 0, 0, 1, 1,
0.6535597, -0.4340604, 1.166566, 0, 0, 0, 1, 1,
0.6546792, 0.6868341, 0.7656724, 0, 0, 0, 1, 1,
0.6626741, -0.7645875, 2.996804, 0, 0, 0, 1, 1,
0.6636478, 0.06011012, 2.460696, 1, 1, 1, 1, 1,
0.6672812, -0.3208353, 1.82262, 1, 1, 1, 1, 1,
0.6691009, 0.8867842, -1.043247, 1, 1, 1, 1, 1,
0.6716956, 1.48753, 0.8866616, 1, 1, 1, 1, 1,
0.6722886, 0.313973, 3.278016, 1, 1, 1, 1, 1,
0.6723847, 0.5936774, 1.597353, 1, 1, 1, 1, 1,
0.6740308, -0.1131533, 1.003581, 1, 1, 1, 1, 1,
0.6756861, 0.916565, -0.7968102, 1, 1, 1, 1, 1,
0.6766577, 0.1649275, 1.498574, 1, 1, 1, 1, 1,
0.6781483, 2.805813, 1.80395, 1, 1, 1, 1, 1,
0.6797127, -0.8327703, 2.441229, 1, 1, 1, 1, 1,
0.6815926, -0.1796294, 2.842003, 1, 1, 1, 1, 1,
0.6824939, 0.02842897, 2.505033, 1, 1, 1, 1, 1,
0.6838373, -0.05733288, 2.074002, 1, 1, 1, 1, 1,
0.6838415, -0.4271739, 1.323198, 1, 1, 1, 1, 1,
0.6851053, 1.059408, 1.618114, 0, 0, 1, 1, 1,
0.6869421, 0.7535756, -1.28804, 1, 0, 0, 1, 1,
0.6873668, 0.2338801, -0.1140417, 1, 0, 0, 1, 1,
0.691249, 0.0456596, 3.319821, 1, 0, 0, 1, 1,
0.6959107, -1.496977, 2.945537, 1, 0, 0, 1, 1,
0.6992227, 1.460778, 1.782548, 1, 0, 0, 1, 1,
0.7009363, 0.3318993, 1.527114, 0, 0, 0, 1, 1,
0.7035531, -1.117175, 2.742951, 0, 0, 0, 1, 1,
0.7047637, 0.6290887, 0.1712062, 0, 0, 0, 1, 1,
0.7073346, 0.7811704, 0.8988088, 0, 0, 0, 1, 1,
0.7085618, -1.128111, 2.171198, 0, 0, 0, 1, 1,
0.7144623, 0.4441958, 1.692037, 0, 0, 0, 1, 1,
0.7201222, -0.06670771, 0.984715, 0, 0, 0, 1, 1,
0.7286741, -0.7212355, 2.266434, 1, 1, 1, 1, 1,
0.7369929, 0.4144184, -0.3056932, 1, 1, 1, 1, 1,
0.7388583, -3.701608, 3.615605, 1, 1, 1, 1, 1,
0.7391886, 1.584228, -0.8543598, 1, 1, 1, 1, 1,
0.7396803, -1.003241, 2.888361, 1, 1, 1, 1, 1,
0.7406458, 0.34711, -0.1606308, 1, 1, 1, 1, 1,
0.7427093, -0.36643, 3.496224, 1, 1, 1, 1, 1,
0.7446507, 1.641165, 0.4742685, 1, 1, 1, 1, 1,
0.7459062, 0.8412884, 1.315918, 1, 1, 1, 1, 1,
0.7495401, -1.176966, 4.759078, 1, 1, 1, 1, 1,
0.7511529, 1.599164, 0.5278625, 1, 1, 1, 1, 1,
0.7540105, 1.921904, -0.3071757, 1, 1, 1, 1, 1,
0.7620221, -1.942367, 4.72914, 1, 1, 1, 1, 1,
0.7667904, 0.7962814, 0.8218348, 1, 1, 1, 1, 1,
0.7670259, 1.408336, 0.01341785, 1, 1, 1, 1, 1,
0.7688124, 0.730672, 1.716201, 0, 0, 1, 1, 1,
0.7706106, 2.12201, 0.291742, 1, 0, 0, 1, 1,
0.7740653, -0.2059499, 3.091672, 1, 0, 0, 1, 1,
0.7787529, 0.6473734, -0.2636322, 1, 0, 0, 1, 1,
0.7801079, -0.9610709, 1.806855, 1, 0, 0, 1, 1,
0.7818915, 0.4312372, 1.534584, 1, 0, 0, 1, 1,
0.7823287, -0.08925771, 1.740931, 0, 0, 0, 1, 1,
0.7828729, 0.2507254, 0.8612188, 0, 0, 0, 1, 1,
0.7837457, -0.6765674, 3.54501, 0, 0, 0, 1, 1,
0.7848574, 1.018687, 1.765302, 0, 0, 0, 1, 1,
0.790837, -0.1869631, 2.772976, 0, 0, 0, 1, 1,
0.7921759, 2.04346, 1.221085, 0, 0, 0, 1, 1,
0.7979081, -0.7143623, 3.438251, 0, 0, 0, 1, 1,
0.7987323, 0.5497075, 0.04663123, 1, 1, 1, 1, 1,
0.8036576, 0.3137708, -0.7241029, 1, 1, 1, 1, 1,
0.8067643, 1.237287, 2.632393, 1, 1, 1, 1, 1,
0.8093048, -1.773664, 2.376181, 1, 1, 1, 1, 1,
0.8106483, 0.05278103, 1.346332, 1, 1, 1, 1, 1,
0.8109695, -1.298576, 2.203947, 1, 1, 1, 1, 1,
0.8114199, 0.6064714, 0.1845577, 1, 1, 1, 1, 1,
0.817801, 0.7143289, -0.1561882, 1, 1, 1, 1, 1,
0.8178751, 0.2575595, -0.2794245, 1, 1, 1, 1, 1,
0.8193797, 0.3850169, -0.2446661, 1, 1, 1, 1, 1,
0.8264879, 1.935855, -1.193371, 1, 1, 1, 1, 1,
0.8266082, 0.1550895, 1.919573, 1, 1, 1, 1, 1,
0.8321755, 1.26938, 0.8705698, 1, 1, 1, 1, 1,
0.8357462, -0.02543641, 1.768873, 1, 1, 1, 1, 1,
0.8369119, -0.9758849, 3.009486, 1, 1, 1, 1, 1,
0.8460316, -0.3157901, 1.880543, 0, 0, 1, 1, 1,
0.8467836, 1.043178, 0.9472849, 1, 0, 0, 1, 1,
0.8492979, -1.725488, 2.349156, 1, 0, 0, 1, 1,
0.8518671, -1.606055, 2.673709, 1, 0, 0, 1, 1,
0.8525825, -0.09600392, 2.201868, 1, 0, 0, 1, 1,
0.8526546, 1.795147, -0.03519841, 1, 0, 0, 1, 1,
0.8533344, 0.6876409, 0.5862731, 0, 0, 0, 1, 1,
0.8583553, -0.1191702, 1.366137, 0, 0, 0, 1, 1,
0.858777, 0.04616617, 1.401331, 0, 0, 0, 1, 1,
0.8602888, -0.302608, 1.697426, 0, 0, 0, 1, 1,
0.8615604, 0.7028549, -0.3635479, 0, 0, 0, 1, 1,
0.8679713, -0.4602142, -0.7366151, 0, 0, 0, 1, 1,
0.8728464, 0.6946209, -0.4095022, 0, 0, 0, 1, 1,
0.8730112, -1.995096, 4.046988, 1, 1, 1, 1, 1,
0.8736169, -1.463336, 2.684583, 1, 1, 1, 1, 1,
0.8740681, -1.482257, 0.848241, 1, 1, 1, 1, 1,
0.8805494, 0.8558519, 0.8974428, 1, 1, 1, 1, 1,
0.8811519, 0.3808548, 1.638925, 1, 1, 1, 1, 1,
0.8942088, -0.3029054, 0.9917462, 1, 1, 1, 1, 1,
0.8995382, -0.15041, 1.722114, 1, 1, 1, 1, 1,
0.9056545, 0.8082212, -0.6505058, 1, 1, 1, 1, 1,
0.9116223, 1.217378, 0.2381749, 1, 1, 1, 1, 1,
0.9141087, 0.07411356, 0.5562814, 1, 1, 1, 1, 1,
0.9246804, -1.009918, 3.505782, 1, 1, 1, 1, 1,
0.9409183, 0.9469063, 1.249156, 1, 1, 1, 1, 1,
0.9462088, -0.9985762, 1.939379, 1, 1, 1, 1, 1,
0.9517269, 1.900203, 0.7140607, 1, 1, 1, 1, 1,
0.9640772, -0.7282708, -0.1798895, 1, 1, 1, 1, 1,
0.9671947, -0.07613716, 1.653403, 0, 0, 1, 1, 1,
0.9675367, -0.9225613, 1.779853, 1, 0, 0, 1, 1,
0.9695447, 1.293965, 2.581105, 1, 0, 0, 1, 1,
0.9743037, 0.5939149, 1.642316, 1, 0, 0, 1, 1,
0.9762633, 0.5385146, 0.6468021, 1, 0, 0, 1, 1,
0.9764274, 0.006533498, 3.038165, 1, 0, 0, 1, 1,
0.9794255, 0.436893, 0.5630504, 0, 0, 0, 1, 1,
0.979472, 3.027208, -0.0464073, 0, 0, 0, 1, 1,
0.9877971, 0.7683035, 1.193008, 0, 0, 0, 1, 1,
0.9939129, 0.915895, 2.059086, 0, 0, 0, 1, 1,
0.9959464, -0.03154416, 1.098059, 0, 0, 0, 1, 1,
0.9972442, -1.27527, 3.856362, 0, 0, 0, 1, 1,
0.9973285, -2.580423, 4.401536, 0, 0, 0, 1, 1,
1.008463, 1.252633, 0.7776408, 1, 1, 1, 1, 1,
1.010532, -1.411522, 2.631869, 1, 1, 1, 1, 1,
1.01195, 0.4284112, 1.799994, 1, 1, 1, 1, 1,
1.012047, -0.3645051, 3.676631, 1, 1, 1, 1, 1,
1.014157, 1.538758, 1.149477, 1, 1, 1, 1, 1,
1.016572, 1.184382, -0.05793555, 1, 1, 1, 1, 1,
1.01948, 1.41739, 1.465241, 1, 1, 1, 1, 1,
1.021667, -2.202533, 4.14888, 1, 1, 1, 1, 1,
1.021987, 0.1605282, 1.180315, 1, 1, 1, 1, 1,
1.026326, -1.200879, 2.91206, 1, 1, 1, 1, 1,
1.027214, 0.3236341, 0.5895754, 1, 1, 1, 1, 1,
1.03229, -1.191345, 2.612114, 1, 1, 1, 1, 1,
1.032377, -0.004861278, 0.3928656, 1, 1, 1, 1, 1,
1.034277, -0.2710644, 0.7573812, 1, 1, 1, 1, 1,
1.034455, 0.3789149, 1.433933, 1, 1, 1, 1, 1,
1.034654, -0.13669, 2.580344, 0, 0, 1, 1, 1,
1.043068, 0.0209886, 0.6657758, 1, 0, 0, 1, 1,
1.046264, -0.2824571, 1.822617, 1, 0, 0, 1, 1,
1.046403, -0.2393103, 1.472047, 1, 0, 0, 1, 1,
1.047161, 0.8425899, 2.340408, 1, 0, 0, 1, 1,
1.050987, 0.3002128, 0.6646636, 1, 0, 0, 1, 1,
1.058359, 3.520566, 1.11561, 0, 0, 0, 1, 1,
1.073564, 0.3188264, 0.8979396, 0, 0, 0, 1, 1,
1.084977, -1.366143, 1.786272, 0, 0, 0, 1, 1,
1.0906, 0.2832648, -0.3175013, 0, 0, 0, 1, 1,
1.09162, -1.979231, 1.783986, 0, 0, 0, 1, 1,
1.091758, 1.215945, 1.230164, 0, 0, 0, 1, 1,
1.094533, -0.5326871, 1.530006, 0, 0, 0, 1, 1,
1.096208, -0.7607471, 2.057126, 1, 1, 1, 1, 1,
1.10291, -0.1044365, 1.897658, 1, 1, 1, 1, 1,
1.106138, -0.0321353, -0.06098243, 1, 1, 1, 1, 1,
1.108105, -0.4302437, 2.072018, 1, 1, 1, 1, 1,
1.112541, -2.52475, 2.129538, 1, 1, 1, 1, 1,
1.117259, 0.1993876, 2.514003, 1, 1, 1, 1, 1,
1.12811, 1.142713, 1.183487, 1, 1, 1, 1, 1,
1.130242, 0.9704221, -0.1964727, 1, 1, 1, 1, 1,
1.130537, -0.1315778, 0.9539087, 1, 1, 1, 1, 1,
1.136785, 0.2220901, -0.004221687, 1, 1, 1, 1, 1,
1.140085, 0.767391, 1.747755, 1, 1, 1, 1, 1,
1.149394, 0.3707567, 0.5728947, 1, 1, 1, 1, 1,
1.15396, -1.861902, 2.726918, 1, 1, 1, 1, 1,
1.156359, -1.135893, 0.3689378, 1, 1, 1, 1, 1,
1.156368, -0.342391, 1.027053, 1, 1, 1, 1, 1,
1.156652, 0.3626783, 0.2697062, 0, 0, 1, 1, 1,
1.158093, 2.009866, -0.5740418, 1, 0, 0, 1, 1,
1.16291, 1.013351, 2.093812, 1, 0, 0, 1, 1,
1.181526, -2.162485, 4.331566, 1, 0, 0, 1, 1,
1.182365, 0.1962521, 1.594347, 1, 0, 0, 1, 1,
1.183293, 0.01061188, 2.50153, 1, 0, 0, 1, 1,
1.183742, 0.3998764, 0.1418155, 0, 0, 0, 1, 1,
1.185532, 1.180962, 0.07091081, 0, 0, 0, 1, 1,
1.188274, 0.4791373, 1.054588, 0, 0, 0, 1, 1,
1.191666, 0.8678721, 2.873763, 0, 0, 0, 1, 1,
1.195303, 0.3053204, 0.8350745, 0, 0, 0, 1, 1,
1.209277, -1.193338, 3.195063, 0, 0, 0, 1, 1,
1.21351, -1.024727, 0.947046, 0, 0, 0, 1, 1,
1.215321, -2.49134, 1.504676, 1, 1, 1, 1, 1,
1.239236, -1.130111, 1.742313, 1, 1, 1, 1, 1,
1.242949, -0.07654387, 3.378524, 1, 1, 1, 1, 1,
1.252007, -0.959361, 1.800261, 1, 1, 1, 1, 1,
1.254394, -0.3471056, 2.425488, 1, 1, 1, 1, 1,
1.25507, -0.02510788, 1.138881, 1, 1, 1, 1, 1,
1.263165, 0.5702503, 2.242618, 1, 1, 1, 1, 1,
1.270992, 1.035188, 1.709742, 1, 1, 1, 1, 1,
1.271865, -0.4494717, 2.292437, 1, 1, 1, 1, 1,
1.27299, -1.419059, 3.190077, 1, 1, 1, 1, 1,
1.27803, -1.696189, 0.9509037, 1, 1, 1, 1, 1,
1.278462, -0.2841306, 0.6254358, 1, 1, 1, 1, 1,
1.279076, 0.1013735, 3.192424, 1, 1, 1, 1, 1,
1.279166, -2.345718, 1.833609, 1, 1, 1, 1, 1,
1.279845, -0.07562783, 1.130462, 1, 1, 1, 1, 1,
1.306123, -1.13921, 2.012692, 0, 0, 1, 1, 1,
1.311094, 0.8132688, -0.2274563, 1, 0, 0, 1, 1,
1.318447, -0.2611678, 1.400496, 1, 0, 0, 1, 1,
1.322633, 0.6845645, 2.189959, 1, 0, 0, 1, 1,
1.329325, -1.201815, 2.986408, 1, 0, 0, 1, 1,
1.332498, 0.1170527, 0.6624963, 1, 0, 0, 1, 1,
1.336264, 0.4863447, 2.223697, 0, 0, 0, 1, 1,
1.339581, 1.2071, -0.8220965, 0, 0, 0, 1, 1,
1.345894, -1.416141, 1.872734, 0, 0, 0, 1, 1,
1.346655, 0.5528831, -0.8049459, 0, 0, 0, 1, 1,
1.348622, -2.020552, 2.288902, 0, 0, 0, 1, 1,
1.373687, -0.3359033, 2.049439, 0, 0, 0, 1, 1,
1.380618, -0.38198, 0.9087485, 0, 0, 0, 1, 1,
1.382995, 0.2820552, 2.47979, 1, 1, 1, 1, 1,
1.384509, 1.030752, 0.09659161, 1, 1, 1, 1, 1,
1.403758, 0.1761208, 0.1606242, 1, 1, 1, 1, 1,
1.407311, 1.13966, -0.5644625, 1, 1, 1, 1, 1,
1.420178, 1.611771, -0.1186152, 1, 1, 1, 1, 1,
1.429045, -1.537848, 3.266011, 1, 1, 1, 1, 1,
1.441526, 0.8060275, 1.599714, 1, 1, 1, 1, 1,
1.446309, -0.5440618, 0.7862707, 1, 1, 1, 1, 1,
1.448702, 1.163688, 0.8929213, 1, 1, 1, 1, 1,
1.452101, 0.7374626, 2.706836, 1, 1, 1, 1, 1,
1.454094, 2.975884, 0.05642849, 1, 1, 1, 1, 1,
1.484098, -0.1748323, 1.848551, 1, 1, 1, 1, 1,
1.490873, -0.2226103, 1.610151, 1, 1, 1, 1, 1,
1.492463, -0.7517397, 1.50216, 1, 1, 1, 1, 1,
1.505788, -0.3047789, 1.28578, 1, 1, 1, 1, 1,
1.511282, 1.214494, -0.5639718, 0, 0, 1, 1, 1,
1.521065, 0.6460448, 2.22084, 1, 0, 0, 1, 1,
1.555583, -0.5008507, 2.933634, 1, 0, 0, 1, 1,
1.558947, 0.05101697, -0.06425331, 1, 0, 0, 1, 1,
1.574781, -1.052853, 3.612762, 1, 0, 0, 1, 1,
1.579097, -0.436504, -0.7044798, 1, 0, 0, 1, 1,
1.613687, 1.059969, 0.6715568, 0, 0, 0, 1, 1,
1.619338, 0.1819663, 0.6432526, 0, 0, 0, 1, 1,
1.623428, -1.021309, 2.960732, 0, 0, 0, 1, 1,
1.625373, 0.5930224, 3.678653, 0, 0, 0, 1, 1,
1.630368, -0.04424696, 2.594408, 0, 0, 0, 1, 1,
1.632495, 0.5453265, 1.573897, 0, 0, 0, 1, 1,
1.665542, -0.7694792, 1.099019, 0, 0, 0, 1, 1,
1.678616, 0.2395535, 2.434265, 1, 1, 1, 1, 1,
1.687286, 0.4949264, 0.7218714, 1, 1, 1, 1, 1,
1.692479, 0.6172173, 0.9291905, 1, 1, 1, 1, 1,
1.705289, -0.5567687, 1.020652, 1, 1, 1, 1, 1,
1.707864, 1.780326, 2.045473, 1, 1, 1, 1, 1,
1.713731, 0.007156614, 1.296713, 1, 1, 1, 1, 1,
1.716086, -0.02613012, 0.8734726, 1, 1, 1, 1, 1,
1.717226, -1.497558, 2.528039, 1, 1, 1, 1, 1,
1.737479, 1.614287, 0.0933326, 1, 1, 1, 1, 1,
1.742108, -2.224333, 4.138478, 1, 1, 1, 1, 1,
1.827321, -1.568743, 1.502219, 1, 1, 1, 1, 1,
1.828376, -0.5639277, 1.356175, 1, 1, 1, 1, 1,
1.843086, -2.860266, 2.84807, 1, 1, 1, 1, 1,
1.854148, -2.045753, 1.594743, 1, 1, 1, 1, 1,
1.86134, 0.8433795, 2.441796, 1, 1, 1, 1, 1,
1.86747, 1.376057, 0.02660798, 0, 0, 1, 1, 1,
1.883528, 0.08546463, 1.991509, 1, 0, 0, 1, 1,
1.895512, -0.1979277, 1.377588, 1, 0, 0, 1, 1,
1.921156, -0.06737137, 1.39478, 1, 0, 0, 1, 1,
1.947417, -1.089524, 2.715951, 1, 0, 0, 1, 1,
1.975702, -0.2648353, 0.2644461, 1, 0, 0, 1, 1,
1.978751, -0.833218, 1.46172, 0, 0, 0, 1, 1,
2.042352, -0.6495603, 2.395693, 0, 0, 0, 1, 1,
2.127331, 0.08493809, 1.514822, 0, 0, 0, 1, 1,
2.132999, 1.070747, 1.355649, 0, 0, 0, 1, 1,
2.145067, -0.6662539, 1.716178, 0, 0, 0, 1, 1,
2.152274, 0.9189854, 1.15475, 0, 0, 0, 1, 1,
2.191858, -0.383044, 2.271079, 0, 0, 0, 1, 1,
2.268477, -0.04559837, 3.023273, 1, 1, 1, 1, 1,
2.382105, 1.223382, 1.827617, 1, 1, 1, 1, 1,
2.410663, 0.6989322, 3.687242, 1, 1, 1, 1, 1,
2.447798, -0.2449646, -0.7998875, 1, 1, 1, 1, 1,
2.463242, 1.368913, 1.498799, 1, 1, 1, 1, 1,
2.483578, -0.9958479, 2.256779, 1, 1, 1, 1, 1,
2.617725, 0.8195733, 1.57814, 1, 1, 1, 1, 1
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
var radius = 10.04386;
var distance = 35.27864;
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
mvMatrix.translate( 0.3542614, -0.05956602, -0.7168479 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.27864);
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
