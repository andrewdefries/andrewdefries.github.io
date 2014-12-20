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
-2.988849, -2.199008, -1.492079, 1, 0, 0, 1,
-2.650385, 1.255671, -1.038391, 1, 0.007843138, 0, 1,
-2.444766, 0.4487043, -1.746769, 1, 0.01176471, 0, 1,
-2.416898, 1.026153, -0.7497658, 1, 0.01960784, 0, 1,
-2.410594, 1.630748, 1.593279, 1, 0.02352941, 0, 1,
-2.385272, -0.447286, -2.473774, 1, 0.03137255, 0, 1,
-2.175604, -0.5232015, -2.821048, 1, 0.03529412, 0, 1,
-2.134235, 2.308517, -0.8424123, 1, 0.04313726, 0, 1,
-2.120198, 1.583387, -0.9266422, 1, 0.04705882, 0, 1,
-2.117727, -0.8439655, -1.560522, 1, 0.05490196, 0, 1,
-2.061137, 1.464833, -0.4547524, 1, 0.05882353, 0, 1,
-2.052525, 0.4648293, -1.707142, 1, 0.06666667, 0, 1,
-2.052203, 2.242247, -1.51051, 1, 0.07058824, 0, 1,
-1.995993, 0.238465, -1.199353, 1, 0.07843138, 0, 1,
-1.944491, 0.1691983, -1.263652, 1, 0.08235294, 0, 1,
-1.88737, 2.759996, -0.7701652, 1, 0.09019608, 0, 1,
-1.880079, -1.353338, -3.092344, 1, 0.09411765, 0, 1,
-1.813123, 0.03655895, -0.7877479, 1, 0.1019608, 0, 1,
-1.798107, 0.8394479, -0.1695196, 1, 0.1098039, 0, 1,
-1.787626, 0.5331474, -2.180539, 1, 0.1137255, 0, 1,
-1.756214, -1.239699, -2.353738, 1, 0.1215686, 0, 1,
-1.751508, -1.081814, -1.530318, 1, 0.1254902, 0, 1,
-1.746635, -0.958806, -0.3155689, 1, 0.1333333, 0, 1,
-1.74365, 0.3920014, -1.614193, 1, 0.1372549, 0, 1,
-1.741436, -1.865229, -1.478752, 1, 0.145098, 0, 1,
-1.738536, -0.1775019, -1.115956, 1, 0.1490196, 0, 1,
-1.730249, 0.9239925, 0.4202446, 1, 0.1568628, 0, 1,
-1.716211, 0.7456474, -0.7593962, 1, 0.1607843, 0, 1,
-1.701435, 0.3612106, -1.175414, 1, 0.1686275, 0, 1,
-1.674773, 0.276618, -2.570488, 1, 0.172549, 0, 1,
-1.670889, -1.202699, -1.309285, 1, 0.1803922, 0, 1,
-1.661337, -0.6292622, -1.915584, 1, 0.1843137, 0, 1,
-1.649803, -0.5407251, -1.501572, 1, 0.1921569, 0, 1,
-1.639011, 2.19411, -2.019992, 1, 0.1960784, 0, 1,
-1.637507, -0.6349878, -1.927298, 1, 0.2039216, 0, 1,
-1.615203, 0.1120974, -2.117724, 1, 0.2117647, 0, 1,
-1.602485, 0.08995898, -1.520826, 1, 0.2156863, 0, 1,
-1.594961, -1.088627, -2.358481, 1, 0.2235294, 0, 1,
-1.588778, -0.3994121, -1.602048, 1, 0.227451, 0, 1,
-1.587589, -1.311483, -2.105172, 1, 0.2352941, 0, 1,
-1.580147, 0.9324101, -0.6749674, 1, 0.2392157, 0, 1,
-1.559823, 2.23386, -1.293991, 1, 0.2470588, 0, 1,
-1.553755, 0.6559902, -1.89632, 1, 0.2509804, 0, 1,
-1.550095, -0.4293379, -1.236391, 1, 0.2588235, 0, 1,
-1.550015, -0.690437, -4.280965, 1, 0.2627451, 0, 1,
-1.544437, 1.211823, -1.33042, 1, 0.2705882, 0, 1,
-1.543932, -0.9669927, -0.7890339, 1, 0.2745098, 0, 1,
-1.538355, -1.271383, -2.654415, 1, 0.282353, 0, 1,
-1.511742, -0.04954549, -0.7867116, 1, 0.2862745, 0, 1,
-1.495092, -0.02214536, -0.6208884, 1, 0.2941177, 0, 1,
-1.491721, 1.094281, -2.522544, 1, 0.3019608, 0, 1,
-1.488641, 0.5705065, -0.01086277, 1, 0.3058824, 0, 1,
-1.457486, -1.565235, -2.394792, 1, 0.3137255, 0, 1,
-1.454886, -0.5096275, -1.835571, 1, 0.3176471, 0, 1,
-1.45299, 0.02724261, -3.527912, 1, 0.3254902, 0, 1,
-1.447989, 0.3269375, -1.122961, 1, 0.3294118, 0, 1,
-1.431558, 0.4331658, -0.4296255, 1, 0.3372549, 0, 1,
-1.421094, -0.75609, -1.939507, 1, 0.3411765, 0, 1,
-1.408211, 0.2558908, 0.708191, 1, 0.3490196, 0, 1,
-1.405528, 1.678538, -0.7545424, 1, 0.3529412, 0, 1,
-1.403471, -0.2864159, -0.6878383, 1, 0.3607843, 0, 1,
-1.385049, -0.1993924, -1.309654, 1, 0.3647059, 0, 1,
-1.368581, -0.03304333, -1.270801, 1, 0.372549, 0, 1,
-1.362738, -0.03684567, -2.559761, 1, 0.3764706, 0, 1,
-1.362621, 1.267295, -0.5174159, 1, 0.3843137, 0, 1,
-1.353033, 0.6485837, -0.4127454, 1, 0.3882353, 0, 1,
-1.34833, -0.5214632, -2.696724, 1, 0.3960784, 0, 1,
-1.343617, 0.681899, 0.1150455, 1, 0.4039216, 0, 1,
-1.341923, 0.487283, -1.786108, 1, 0.4078431, 0, 1,
-1.340034, -0.03646982, -1.02512, 1, 0.4156863, 0, 1,
-1.335018, 0.1792024, -2.504508, 1, 0.4196078, 0, 1,
-1.334356, 0.78976, -1.551818, 1, 0.427451, 0, 1,
-1.331151, -0.960235, -3.051893, 1, 0.4313726, 0, 1,
-1.324709, 0.7662001, 0.4698281, 1, 0.4392157, 0, 1,
-1.32302, 0.3672136, -1.63943, 1, 0.4431373, 0, 1,
-1.316032, -1.126221, -3.046827, 1, 0.4509804, 0, 1,
-1.309953, -0.1050965, -1.33913, 1, 0.454902, 0, 1,
-1.296678, -0.3365331, -2.312749, 1, 0.4627451, 0, 1,
-1.296139, 0.3665211, -0.8207611, 1, 0.4666667, 0, 1,
-1.290895, 1.565459, 0.7495196, 1, 0.4745098, 0, 1,
-1.283325, 1.810833, -1.027548, 1, 0.4784314, 0, 1,
-1.281018, 0.8985502, -0.7280304, 1, 0.4862745, 0, 1,
-1.279808, -0.9505244, -1.709241, 1, 0.4901961, 0, 1,
-1.278079, -0.1243051, -2.125605, 1, 0.4980392, 0, 1,
-1.270916, 0.1397651, -0.6517909, 1, 0.5058824, 0, 1,
-1.269925, -0.492003, -2.647291, 1, 0.509804, 0, 1,
-1.267514, 1.269195, -0.9120028, 1, 0.5176471, 0, 1,
-1.265372, 0.2269446, -1.576772, 1, 0.5215687, 0, 1,
-1.261417, -0.2527854, -0.9850477, 1, 0.5294118, 0, 1,
-1.255291, -2.901998, -1.573465, 1, 0.5333334, 0, 1,
-1.248195, -0.2945741, -0.3785376, 1, 0.5411765, 0, 1,
-1.245474, -0.312927, -2.735729, 1, 0.5450981, 0, 1,
-1.234956, -1.780059, -2.222943, 1, 0.5529412, 0, 1,
-1.222974, -0.1857658, -0.551361, 1, 0.5568628, 0, 1,
-1.220033, 1.949192, -1.572, 1, 0.5647059, 0, 1,
-1.219283, -2.026789, -1.899465, 1, 0.5686275, 0, 1,
-1.215135, 1.418352, -0.7046976, 1, 0.5764706, 0, 1,
-1.21291, 1.489696, -0.3940031, 1, 0.5803922, 0, 1,
-1.19273, 0.4762255, -0.7296609, 1, 0.5882353, 0, 1,
-1.178037, -0.5297152, -0.7295027, 1, 0.5921569, 0, 1,
-1.174194, 0.4630788, -1.981839, 1, 0.6, 0, 1,
-1.168977, -1.691919, -1.24445, 1, 0.6078432, 0, 1,
-1.168343, 1.277591, -0.1125843, 1, 0.6117647, 0, 1,
-1.167052, 0.4864329, -0.6956006, 1, 0.6196079, 0, 1,
-1.152794, 1.052213, -1.149858, 1, 0.6235294, 0, 1,
-1.150485, 0.3378043, -1.41235, 1, 0.6313726, 0, 1,
-1.137734, 0.0580134, -1.614431, 1, 0.6352941, 0, 1,
-1.133196, -1.34834, -2.877237, 1, 0.6431373, 0, 1,
-1.119332, 0.4865021, 0.5657191, 1, 0.6470588, 0, 1,
-1.117567, 1.324429, -0.01194221, 1, 0.654902, 0, 1,
-1.111985, -1.920483, -2.599294, 1, 0.6588235, 0, 1,
-1.103594, -0.254773, -2.065481, 1, 0.6666667, 0, 1,
-1.103521, -0.4989752, -3.606677, 1, 0.6705883, 0, 1,
-1.099611, -1.473117, -3.027544, 1, 0.6784314, 0, 1,
-1.098881, 1.15249, 1.48794, 1, 0.682353, 0, 1,
-1.098831, -0.5756049, -2.838713, 1, 0.6901961, 0, 1,
-1.085038, -2.043015, -1.71907, 1, 0.6941177, 0, 1,
-1.080519, 0.1928246, -1.014687, 1, 0.7019608, 0, 1,
-1.075356, 1.199636, -1.708554, 1, 0.7098039, 0, 1,
-1.073822, -0.8747011, -2.013053, 1, 0.7137255, 0, 1,
-1.073173, 0.1243316, -0.6357528, 1, 0.7215686, 0, 1,
-1.071144, 0.7351205, -1.121065, 1, 0.7254902, 0, 1,
-1.070689, -0.4932608, -1.825284, 1, 0.7333333, 0, 1,
-1.066695, -2.047673, -4.008377, 1, 0.7372549, 0, 1,
-1.064096, 0.349668, -1.528918, 1, 0.7450981, 0, 1,
-1.063384, -0.1248574, -1.832958, 1, 0.7490196, 0, 1,
-1.059836, 2.427927, -0.09863892, 1, 0.7568628, 0, 1,
-1.052725, 0.5261739, -0.01620898, 1, 0.7607843, 0, 1,
-1.049753, 2.21692, -0.683848, 1, 0.7686275, 0, 1,
-1.048889, -0.317575, -3.916305, 1, 0.772549, 0, 1,
-1.034378, 1.007717, -3.082453, 1, 0.7803922, 0, 1,
-1.03306, -0.5773202, -4.546485, 1, 0.7843137, 0, 1,
-1.02357, 0.3946322, -1.418991, 1, 0.7921569, 0, 1,
-1.017787, 1.536682, -0.7423295, 1, 0.7960784, 0, 1,
-1.014485, -1.759335, -3.197316, 1, 0.8039216, 0, 1,
-1.008226, -0.6627391, -1.335761, 1, 0.8117647, 0, 1,
-1.001302, 1.756615, -0.1095196, 1, 0.8156863, 0, 1,
-0.9976625, 0.1835292, -3.020759, 1, 0.8235294, 0, 1,
-0.9925944, -0.7358154, -1.185555, 1, 0.827451, 0, 1,
-0.9909773, -0.6084219, -2.857753, 1, 0.8352941, 0, 1,
-0.9873909, -0.1598186, -2.650757, 1, 0.8392157, 0, 1,
-0.9776747, -0.1172675, -2.178076, 1, 0.8470588, 0, 1,
-0.9763417, 0.2272358, -0.5800035, 1, 0.8509804, 0, 1,
-0.9732957, 1.177487, -1.343242, 1, 0.8588235, 0, 1,
-0.9655211, -1.714643, -3.065293, 1, 0.8627451, 0, 1,
-0.9537485, 0.8107359, -1.389362, 1, 0.8705882, 0, 1,
-0.9393126, -0.1394192, -1.01824, 1, 0.8745098, 0, 1,
-0.9314437, -0.1243725, -0.4621233, 1, 0.8823529, 0, 1,
-0.9255351, 0.1587897, -3.134625, 1, 0.8862745, 0, 1,
-0.9248174, 0.5310259, -2.059935, 1, 0.8941177, 0, 1,
-0.9220011, 0.5186889, -1.914489, 1, 0.8980392, 0, 1,
-0.9152166, 0.3220949, -2.218177, 1, 0.9058824, 0, 1,
-0.9051198, 0.7757759, -0.4942425, 1, 0.9137255, 0, 1,
-0.9010096, 0.01078354, -1.934434, 1, 0.9176471, 0, 1,
-0.8986052, 1.207865, 0.2315922, 1, 0.9254902, 0, 1,
-0.8909358, -0.7195869, -3.222143, 1, 0.9294118, 0, 1,
-0.8852896, 0.5284262, 0.3882823, 1, 0.9372549, 0, 1,
-0.8822194, 0.815101, -1.963188, 1, 0.9411765, 0, 1,
-0.8820031, -0.975686, -2.262199, 1, 0.9490196, 0, 1,
-0.8819013, -2.182317, -2.965311, 1, 0.9529412, 0, 1,
-0.8813601, 1.437959, -0.2268087, 1, 0.9607843, 0, 1,
-0.8790992, -0.05124155, -0.8673677, 1, 0.9647059, 0, 1,
-0.8684017, 1.175381, 1.082724, 1, 0.972549, 0, 1,
-0.8681253, -0.2966461, -2.903915, 1, 0.9764706, 0, 1,
-0.8672817, 0.7955637, 0.1198346, 1, 0.9843137, 0, 1,
-0.8562109, -0.07939231, -0.4263095, 1, 0.9882353, 0, 1,
-0.8546919, -1.49621, -2.928631, 1, 0.9960784, 0, 1,
-0.8519686, -0.02392221, 0.3779625, 0.9960784, 1, 0, 1,
-0.8498517, 0.09626798, -0.2473439, 0.9921569, 1, 0, 1,
-0.8469594, 0.6052534, 0.1417414, 0.9843137, 1, 0, 1,
-0.8422053, -0.4207653, -2.528713, 0.9803922, 1, 0, 1,
-0.8290783, -0.5565671, -1.820899, 0.972549, 1, 0, 1,
-0.8223584, -0.5900576, -2.017217, 0.9686275, 1, 0, 1,
-0.8209399, -2.116132, -4.205399, 0.9607843, 1, 0, 1,
-0.8144334, -1.015146, -1.602765, 0.9568627, 1, 0, 1,
-0.8118367, -0.5030645, -1.969265, 0.9490196, 1, 0, 1,
-0.8087624, 1.46205, 1.866863, 0.945098, 1, 0, 1,
-0.8016459, 0.9403931, 0.7013089, 0.9372549, 1, 0, 1,
-0.8008762, 0.5983994, 0.6660715, 0.9333333, 1, 0, 1,
-0.7969637, -0.3293545, -1.299775, 0.9254902, 1, 0, 1,
-0.7922478, 0.5574229, -0.7338279, 0.9215686, 1, 0, 1,
-0.79017, 0.2681599, -1.667859, 0.9137255, 1, 0, 1,
-0.7889409, 0.1539185, -1.320365, 0.9098039, 1, 0, 1,
-0.7885457, 0.6873771, -1.154039, 0.9019608, 1, 0, 1,
-0.786195, 0.8659502, -0.5156573, 0.8941177, 1, 0, 1,
-0.7852518, -0.7678043, -3.079399, 0.8901961, 1, 0, 1,
-0.7814111, -0.3867246, -3.164749, 0.8823529, 1, 0, 1,
-0.7814032, 1.458409, -0.5549617, 0.8784314, 1, 0, 1,
-0.7811505, 1.127535, 1.092127, 0.8705882, 1, 0, 1,
-0.7797917, 0.4020027, -2.965382, 0.8666667, 1, 0, 1,
-0.7795881, 0.5315624, -3.407165, 0.8588235, 1, 0, 1,
-0.7752229, 0.7498586, -0.8877218, 0.854902, 1, 0, 1,
-0.7743611, 0.7745158, -0.4748111, 0.8470588, 1, 0, 1,
-0.7717801, -1.094482, -4.199567, 0.8431373, 1, 0, 1,
-0.7649478, 0.1716957, -0.4986536, 0.8352941, 1, 0, 1,
-0.7642769, 1.924378, 1.20538, 0.8313726, 1, 0, 1,
-0.739997, -0.1583181, -2.621718, 0.8235294, 1, 0, 1,
-0.7363137, 2.22148, -1.267902, 0.8196079, 1, 0, 1,
-0.7347225, 0.5773914, -0.3385206, 0.8117647, 1, 0, 1,
-0.7341122, -0.1248132, -1.22368, 0.8078431, 1, 0, 1,
-0.7324514, 0.7421764, -0.4672936, 0.8, 1, 0, 1,
-0.729998, -1.323375, -3.176441, 0.7921569, 1, 0, 1,
-0.7297558, -1.20462, -2.86147, 0.7882353, 1, 0, 1,
-0.7262152, 1.663708, -0.6066296, 0.7803922, 1, 0, 1,
-0.7235246, -1.456753, -2.736086, 0.7764706, 1, 0, 1,
-0.7177268, 1.333012, -1.527036, 0.7686275, 1, 0, 1,
-0.7171561, -0.875464, -2.717957, 0.7647059, 1, 0, 1,
-0.7090181, -0.3852365, -1.310558, 0.7568628, 1, 0, 1,
-0.7080288, -1.273863, -1.574724, 0.7529412, 1, 0, 1,
-0.7054712, 0.03222082, -0.5030268, 0.7450981, 1, 0, 1,
-0.6960155, -0.5531347, -0.7441074, 0.7411765, 1, 0, 1,
-0.692402, -0.2291824, -1.362959, 0.7333333, 1, 0, 1,
-0.6921805, -0.3039891, -1.475934, 0.7294118, 1, 0, 1,
-0.6899756, 1.307962, -0.4280864, 0.7215686, 1, 0, 1,
-0.6882161, 0.5195324, 0.9701203, 0.7176471, 1, 0, 1,
-0.6777638, 0.7511299, -0.6279935, 0.7098039, 1, 0, 1,
-0.6764151, 0.7448984, 0.0929804, 0.7058824, 1, 0, 1,
-0.6739289, -1.353084, -1.633961, 0.6980392, 1, 0, 1,
-0.6704082, 0.1481703, -1.352343, 0.6901961, 1, 0, 1,
-0.6697927, 0.1214239, -0.8539372, 0.6862745, 1, 0, 1,
-0.6673107, -0.818729, -3.246427, 0.6784314, 1, 0, 1,
-0.6662052, -1.484292, -3.663851, 0.6745098, 1, 0, 1,
-0.6655861, -1.22484, -1.842691, 0.6666667, 1, 0, 1,
-0.6640278, -1.800944, -2.651344, 0.6627451, 1, 0, 1,
-0.6616896, 1.346786, -0.9039997, 0.654902, 1, 0, 1,
-0.6610802, 0.009241085, -0.7878448, 0.6509804, 1, 0, 1,
-0.6608628, 0.6281568, 1.774305, 0.6431373, 1, 0, 1,
-0.6589379, -0.6827384, -4.227811, 0.6392157, 1, 0, 1,
-0.6579099, 1.042906, 0.009779768, 0.6313726, 1, 0, 1,
-0.6535243, -0.7646942, -2.280984, 0.627451, 1, 0, 1,
-0.6527268, -2.704664, -3.483822, 0.6196079, 1, 0, 1,
-0.6512014, 0.376873, -2.665477, 0.6156863, 1, 0, 1,
-0.6511285, 0.4520143, 0.4440399, 0.6078432, 1, 0, 1,
-0.6509104, -0.4296506, -2.671929, 0.6039216, 1, 0, 1,
-0.6463175, 0.3696433, -0.4884387, 0.5960785, 1, 0, 1,
-0.637975, -0.8536173, -1.051886, 0.5882353, 1, 0, 1,
-0.6370482, 0.3649727, -0.09225314, 0.5843138, 1, 0, 1,
-0.6359993, 0.383878, -0.9016716, 0.5764706, 1, 0, 1,
-0.6342415, 0.3249455, -2.526824, 0.572549, 1, 0, 1,
-0.6336773, -1.962749, -4.994846, 0.5647059, 1, 0, 1,
-0.6333954, 0.3447655, -1.082654, 0.5607843, 1, 0, 1,
-0.6294188, -1.003813, -2.153036, 0.5529412, 1, 0, 1,
-0.6280227, -1.246443, -0.5365231, 0.5490196, 1, 0, 1,
-0.6278821, -1.9602, -2.942752, 0.5411765, 1, 0, 1,
-0.6207247, -0.9649143, -3.166683, 0.5372549, 1, 0, 1,
-0.6176621, -1.334758, -1.297959, 0.5294118, 1, 0, 1,
-0.615664, 0.9799498, 0.09479184, 0.5254902, 1, 0, 1,
-0.6119849, 1.235201, -0.6491951, 0.5176471, 1, 0, 1,
-0.6114159, 0.9359083, -0.3876913, 0.5137255, 1, 0, 1,
-0.6099923, -0.5155064, -1.211501, 0.5058824, 1, 0, 1,
-0.6052167, 0.2432243, -0.5422397, 0.5019608, 1, 0, 1,
-0.6027141, 1.059847, -1.010078, 0.4941176, 1, 0, 1,
-0.5996692, -0.09550595, -1.283411, 0.4862745, 1, 0, 1,
-0.5978448, -0.7044265, -3.2264, 0.4823529, 1, 0, 1,
-0.5962679, 0.411467, -0.03128837, 0.4745098, 1, 0, 1,
-0.5951558, -0.1601581, 0.1330474, 0.4705882, 1, 0, 1,
-0.5920568, -0.07510113, -1.972403, 0.4627451, 1, 0, 1,
-0.5910055, -0.2755202, -1.648262, 0.4588235, 1, 0, 1,
-0.5894017, -1.091092, -3.650841, 0.4509804, 1, 0, 1,
-0.587827, 0.4592492, -2.250198, 0.4470588, 1, 0, 1,
-0.5872889, -0.1887371, -0.6023147, 0.4392157, 1, 0, 1,
-0.5833606, 0.2934844, -1.527393, 0.4352941, 1, 0, 1,
-0.5773567, -0.05089609, -2.678304, 0.427451, 1, 0, 1,
-0.5746211, 1.550766, 0.308107, 0.4235294, 1, 0, 1,
-0.5735805, -0.5651077, -2.911544, 0.4156863, 1, 0, 1,
-0.5725517, -0.1925191, -2.767101, 0.4117647, 1, 0, 1,
-0.5659612, -1.665335, -4.02878, 0.4039216, 1, 0, 1,
-0.5652152, -0.0356039, -0.6352501, 0.3960784, 1, 0, 1,
-0.5643893, 0.4017731, -1.858017, 0.3921569, 1, 0, 1,
-0.5619541, 1.366203, -0.4836526, 0.3843137, 1, 0, 1,
-0.5605531, -0.4213982, -2.77528, 0.3803922, 1, 0, 1,
-0.5602868, 1.576351, -1.879833, 0.372549, 1, 0, 1,
-0.5592483, 1.599632, 1.272298, 0.3686275, 1, 0, 1,
-0.5575502, 0.01413253, -0.7407416, 0.3607843, 1, 0, 1,
-0.5539532, -0.6487894, -0.6895553, 0.3568628, 1, 0, 1,
-0.5491459, 1.678989, -0.317348, 0.3490196, 1, 0, 1,
-0.5481903, -0.004383686, -1.137675, 0.345098, 1, 0, 1,
-0.5475266, 0.6264013, -0.3335501, 0.3372549, 1, 0, 1,
-0.5438899, 1.339692, -0.9523596, 0.3333333, 1, 0, 1,
-0.5358157, 1.211447, 0.8835353, 0.3254902, 1, 0, 1,
-0.5342403, -0.5829816, -2.39205, 0.3215686, 1, 0, 1,
-0.5312777, 1.127095, -0.8381983, 0.3137255, 1, 0, 1,
-0.5265334, -1.053157, -1.936548, 0.3098039, 1, 0, 1,
-0.5242018, 0.4867425, -1.320086, 0.3019608, 1, 0, 1,
-0.5128819, 0.2526109, -1.425825, 0.2941177, 1, 0, 1,
-0.510148, -0.4940509, -0.8505337, 0.2901961, 1, 0, 1,
-0.5019559, -1.487766, -3.230383, 0.282353, 1, 0, 1,
-0.4945061, 2.010056, -1.665677, 0.2784314, 1, 0, 1,
-0.4917825, -0.285039, -2.024989, 0.2705882, 1, 0, 1,
-0.4911229, -0.7868155, -1.729207, 0.2666667, 1, 0, 1,
-0.4901657, -0.4160846, -3.058534, 0.2588235, 1, 0, 1,
-0.4882417, -1.730319, -3.145289, 0.254902, 1, 0, 1,
-0.4832575, -0.4463001, -2.017335, 0.2470588, 1, 0, 1,
-0.4801479, 0.6360931, -1.150293, 0.2431373, 1, 0, 1,
-0.4795641, -1.826097, -3.053613, 0.2352941, 1, 0, 1,
-0.4758139, -0.04383549, -1.8937, 0.2313726, 1, 0, 1,
-0.4713174, -1.318105, -1.752994, 0.2235294, 1, 0, 1,
-0.4617628, -0.6659765, -2.488588, 0.2196078, 1, 0, 1,
-0.4589837, -1.635247, -2.618376, 0.2117647, 1, 0, 1,
-0.4580191, -3.009783, -1.059315, 0.2078431, 1, 0, 1,
-0.4521043, 0.04955576, -1.597094, 0.2, 1, 0, 1,
-0.4519824, 1.482747, -0.7675319, 0.1921569, 1, 0, 1,
-0.4500755, -0.8554133, -1.241237, 0.1882353, 1, 0, 1,
-0.4494531, 1.135655, -1.806177, 0.1803922, 1, 0, 1,
-0.445378, -0.02661553, -0.1320465, 0.1764706, 1, 0, 1,
-0.4437194, -0.5231038, -3.517902, 0.1686275, 1, 0, 1,
-0.441843, -2.652034, -3.123896, 0.1647059, 1, 0, 1,
-0.4396627, -0.9235049, -2.387184, 0.1568628, 1, 0, 1,
-0.4383519, -2.653467, -1.902794, 0.1529412, 1, 0, 1,
-0.4363508, -2.53797, -4.779834, 0.145098, 1, 0, 1,
-0.4351173, -0.0664978, -2.157999, 0.1411765, 1, 0, 1,
-0.4302985, -1.170171, -1.972379, 0.1333333, 1, 0, 1,
-0.4239437, 0.4686915, 0.8242332, 0.1294118, 1, 0, 1,
-0.4229596, -1.003962, -2.982773, 0.1215686, 1, 0, 1,
-0.4206552, 1.244463, -0.4480896, 0.1176471, 1, 0, 1,
-0.417528, -0.0705261, -2.479081, 0.1098039, 1, 0, 1,
-0.4144048, 0.3298959, -0.6759052, 0.1058824, 1, 0, 1,
-0.4132344, 0.4276174, -0.2040882, 0.09803922, 1, 0, 1,
-0.4131938, 1.213026, -0.5768591, 0.09019608, 1, 0, 1,
-0.4111069, 0.2145147, -1.52652, 0.08627451, 1, 0, 1,
-0.4108775, 1.373457, 1.137584, 0.07843138, 1, 0, 1,
-0.4095006, -0.3823798, -1.225829, 0.07450981, 1, 0, 1,
-0.4065779, 1.04246, -0.2781932, 0.06666667, 1, 0, 1,
-0.4024335, -1.386946, -3.734556, 0.0627451, 1, 0, 1,
-0.3973659, 1.498014, 0.2825654, 0.05490196, 1, 0, 1,
-0.3971852, -1.737316, -1.929332, 0.05098039, 1, 0, 1,
-0.3822301, 1.432215, 1.441292, 0.04313726, 1, 0, 1,
-0.3804374, -0.9754166, -4.085773, 0.03921569, 1, 0, 1,
-0.3785522, 0.8502988, -0.7700555, 0.03137255, 1, 0, 1,
-0.3775477, 0.8990007, -0.3361909, 0.02745098, 1, 0, 1,
-0.377434, 0.7221613, 0.7306295, 0.01960784, 1, 0, 1,
-0.3717667, 2.454596, 0.5137614, 0.01568628, 1, 0, 1,
-0.3706588, -1.994612, -3.265079, 0.007843138, 1, 0, 1,
-0.3645439, -0.379749, -3.650384, 0.003921569, 1, 0, 1,
-0.3640814, -0.2477282, -1.323411, 0, 1, 0.003921569, 1,
-0.3634282, 1.163266, 1.436133, 0, 1, 0.01176471, 1,
-0.3614021, -0.04721174, -1.131021, 0, 1, 0.01568628, 1,
-0.3603489, 1.97718, -0.737912, 0, 1, 0.02352941, 1,
-0.3569637, 0.5509458, -2.420083, 0, 1, 0.02745098, 1,
-0.3552315, 0.3170961, -0.416078, 0, 1, 0.03529412, 1,
-0.3544953, -0.2925957, -3.261772, 0, 1, 0.03921569, 1,
-0.3542859, 0.5197535, -1.176414, 0, 1, 0.04705882, 1,
-0.350957, 0.134613, -2.675016, 0, 1, 0.05098039, 1,
-0.3504627, -1.586588, -0.5757899, 0, 1, 0.05882353, 1,
-0.3496929, 0.6591356, -1.729049, 0, 1, 0.0627451, 1,
-0.3479337, 0.1946155, -0.3476369, 0, 1, 0.07058824, 1,
-0.3462699, 0.9192563, -0.5245463, 0, 1, 0.07450981, 1,
-0.3452177, -0.659595, -2.611297, 0, 1, 0.08235294, 1,
-0.3451949, 2.017644, 0.6716651, 0, 1, 0.08627451, 1,
-0.3421368, -0.6614155, -3.746499, 0, 1, 0.09411765, 1,
-0.3406868, 0.5179882, -0.8091972, 0, 1, 0.1019608, 1,
-0.3382632, -1.566236, -1.473834, 0, 1, 0.1058824, 1,
-0.3338082, -1.145055, -3.044795, 0, 1, 0.1137255, 1,
-0.3331792, -0.460684, -1.715401, 0, 1, 0.1176471, 1,
-0.332837, -0.7948754, -1.231628, 0, 1, 0.1254902, 1,
-0.3306113, -1.004475, -2.550536, 0, 1, 0.1294118, 1,
-0.3276818, 0.03238641, -3.053011, 0, 1, 0.1372549, 1,
-0.3273676, -1.354955, -3.250679, 0, 1, 0.1411765, 1,
-0.3258038, -0.4166741, -2.907585, 0, 1, 0.1490196, 1,
-0.3249471, 1.350224, 0.2486192, 0, 1, 0.1529412, 1,
-0.3244135, -0.6421172, -1.746173, 0, 1, 0.1607843, 1,
-0.3174855, 0.02973368, 0.1110106, 0, 1, 0.1647059, 1,
-0.31601, 0.6151115, 0.6793889, 0, 1, 0.172549, 1,
-0.3155147, 0.2275952, -1.160388, 0, 1, 0.1764706, 1,
-0.3118756, 0.3911225, -1.615098, 0, 1, 0.1843137, 1,
-0.3104738, 0.9682595, -1.566332, 0, 1, 0.1882353, 1,
-0.3103647, -0.1850274, -1.938772, 0, 1, 0.1960784, 1,
-0.3079124, -1.534989, -4.434232, 0, 1, 0.2039216, 1,
-0.3070345, -0.6359354, -3.562052, 0, 1, 0.2078431, 1,
-0.3052823, -0.08827373, -3.00768, 0, 1, 0.2156863, 1,
-0.3051308, -0.03662821, -1.036651, 0, 1, 0.2196078, 1,
-0.3043709, 3.294578, -1.324179, 0, 1, 0.227451, 1,
-0.2992605, 1.231603, -1.287699, 0, 1, 0.2313726, 1,
-0.2966685, 0.4662055, 0.01651444, 0, 1, 0.2392157, 1,
-0.295159, 0.7898616, 0.4292519, 0, 1, 0.2431373, 1,
-0.2947709, -0.4748226, -0.5011371, 0, 1, 0.2509804, 1,
-0.2909557, -0.9427107, -3.033955, 0, 1, 0.254902, 1,
-0.2894007, -0.7005913, -2.260858, 0, 1, 0.2627451, 1,
-0.2893304, -0.2575373, -1.354313, 0, 1, 0.2666667, 1,
-0.289095, -0.3327506, -1.303973, 0, 1, 0.2745098, 1,
-0.2850689, -0.08794905, -3.562171, 0, 1, 0.2784314, 1,
-0.2829498, 1.285141, -1.335892, 0, 1, 0.2862745, 1,
-0.2818224, -0.120587, -2.786026, 0, 1, 0.2901961, 1,
-0.2814598, 0.603308, -1.133543, 0, 1, 0.2980392, 1,
-0.2787583, -0.2076657, -1.5244, 0, 1, 0.3058824, 1,
-0.2750974, -0.837809, -6.1255, 0, 1, 0.3098039, 1,
-0.2657221, -1.30165, -4.163933, 0, 1, 0.3176471, 1,
-0.263805, -0.1698647, -2.106408, 0, 1, 0.3215686, 1,
-0.263711, -0.2395514, -2.261043, 0, 1, 0.3294118, 1,
-0.262695, 1.774655, 0.998763, 0, 1, 0.3333333, 1,
-0.2612295, 1.046344, -0.7979359, 0, 1, 0.3411765, 1,
-0.2569904, -1.562292, -3.404066, 0, 1, 0.345098, 1,
-0.2554269, -0.2533192, -2.176134, 0, 1, 0.3529412, 1,
-0.2518307, -1.942209, -3.709947, 0, 1, 0.3568628, 1,
-0.2484691, 0.382488, -1.562183, 0, 1, 0.3647059, 1,
-0.2447712, 0.3328231, 0.2590431, 0, 1, 0.3686275, 1,
-0.2446651, -0.177717, -3.106239, 0, 1, 0.3764706, 1,
-0.2443173, -1.467297, -2.523671, 0, 1, 0.3803922, 1,
-0.2440907, 0.1330401, -1.752622, 0, 1, 0.3882353, 1,
-0.2395142, 0.4410451, -1.441602, 0, 1, 0.3921569, 1,
-0.2390034, -1.79844, -3.186028, 0, 1, 0.4, 1,
-0.2377248, 0.4259116, 0.6763347, 0, 1, 0.4078431, 1,
-0.2309791, -0.3157718, -2.601349, 0, 1, 0.4117647, 1,
-0.225289, -1.672767, -3.508653, 0, 1, 0.4196078, 1,
-0.2202618, -0.9704061, -5.192513, 0, 1, 0.4235294, 1,
-0.217905, -1.011481, -4.883925, 0, 1, 0.4313726, 1,
-0.2167748, 1.577707, -0.3149081, 0, 1, 0.4352941, 1,
-0.2133471, -0.2817818, -3.094445, 0, 1, 0.4431373, 1,
-0.2122762, -0.3371549, -2.314266, 0, 1, 0.4470588, 1,
-0.2087384, 0.1341386, -1.325821, 0, 1, 0.454902, 1,
-0.205029, -1.958909, -4.602689, 0, 1, 0.4588235, 1,
-0.2040978, -0.03509632, -1.175152, 0, 1, 0.4666667, 1,
-0.1999139, -1.918964, -4.446328, 0, 1, 0.4705882, 1,
-0.1995472, 0.01939222, -4.249008, 0, 1, 0.4784314, 1,
-0.1946837, 0.1143447, 0.5814251, 0, 1, 0.4823529, 1,
-0.1886607, -0.5323256, -2.653081, 0, 1, 0.4901961, 1,
-0.1865484, -1.349282, -4.221942, 0, 1, 0.4941176, 1,
-0.1863482, -1.705044, -4.342276, 0, 1, 0.5019608, 1,
-0.1840065, 1.455059, 0.8079892, 0, 1, 0.509804, 1,
-0.1780185, -0.02412164, -2.81447, 0, 1, 0.5137255, 1,
-0.1751193, -1.255955, -2.178526, 0, 1, 0.5215687, 1,
-0.1679827, -0.4581666, -1.861327, 0, 1, 0.5254902, 1,
-0.1678244, -0.6862848, -1.966472, 0, 1, 0.5333334, 1,
-0.1637453, -2.186244, -3.228014, 0, 1, 0.5372549, 1,
-0.152549, -1.19564, -3.663375, 0, 1, 0.5450981, 1,
-0.1513749, 1.443781, -0.8308409, 0, 1, 0.5490196, 1,
-0.1500639, 2.125894, -0.3128722, 0, 1, 0.5568628, 1,
-0.1491568, -1.677238, -3.174773, 0, 1, 0.5607843, 1,
-0.1481152, 0.4020484, 0.7153808, 0, 1, 0.5686275, 1,
-0.1475475, -0.5921703, -2.616649, 0, 1, 0.572549, 1,
-0.1440337, -1.06332, -3.019051, 0, 1, 0.5803922, 1,
-0.1401871, 0.5188187, -1.508412, 0, 1, 0.5843138, 1,
-0.1395021, -1.888759, -3.475747, 0, 1, 0.5921569, 1,
-0.1380059, 0.5454236, 0.333751, 0, 1, 0.5960785, 1,
-0.1377924, 1.02567, -0.4996774, 0, 1, 0.6039216, 1,
-0.1315772, 0.5684001, -1.816442, 0, 1, 0.6117647, 1,
-0.1266221, -0.9387776, -1.10175, 0, 1, 0.6156863, 1,
-0.1261383, 0.3989209, -0.1639356, 0, 1, 0.6235294, 1,
-0.1252121, 1.910906, -0.01529032, 0, 1, 0.627451, 1,
-0.1231278, -0.1707742, -1.459177, 0, 1, 0.6352941, 1,
-0.1188738, -1.411445, -2.568431, 0, 1, 0.6392157, 1,
-0.115581, -0.4593112, -1.602287, 0, 1, 0.6470588, 1,
-0.1154603, 1.695125, -0.4917151, 0, 1, 0.6509804, 1,
-0.1153259, 0.5605674, 0.2241845, 0, 1, 0.6588235, 1,
-0.1132238, -0.1425186, -3.677687, 0, 1, 0.6627451, 1,
-0.1117006, 0.2995703, -0.2504909, 0, 1, 0.6705883, 1,
-0.1071911, -0.3502615, -2.33051, 0, 1, 0.6745098, 1,
-0.1023778, 0.7250527, -0.2579249, 0, 1, 0.682353, 1,
-0.0955539, -0.23414, -1.671541, 0, 1, 0.6862745, 1,
-0.09049068, 0.1619046, 0.2924131, 0, 1, 0.6941177, 1,
-0.08940608, 0.5545657, 0.08085812, 0, 1, 0.7019608, 1,
-0.08422986, 2.492353, 0.3758221, 0, 1, 0.7058824, 1,
-0.08353785, -0.243601, -1.921535, 0, 1, 0.7137255, 1,
-0.08169871, 0.5316747, -2.625576, 0, 1, 0.7176471, 1,
-0.07979882, 0.7344998, -0.9077009, 0, 1, 0.7254902, 1,
-0.07869297, 0.2669792, -0.06926232, 0, 1, 0.7294118, 1,
-0.07541239, -0.6382383, -3.75746, 0, 1, 0.7372549, 1,
-0.07463479, -0.5183661, -2.138898, 0, 1, 0.7411765, 1,
-0.07211658, -0.4329804, -4.043978, 0, 1, 0.7490196, 1,
-0.0713008, 1.287773, 0.3771573, 0, 1, 0.7529412, 1,
-0.06957345, -0.1207904, -4.260737, 0, 1, 0.7607843, 1,
-0.06491821, 0.08118176, 0.6033747, 0, 1, 0.7647059, 1,
-0.06374179, -0.8052954, -2.606092, 0, 1, 0.772549, 1,
-0.06249083, 0.7613503, 0.2850673, 0, 1, 0.7764706, 1,
-0.06122707, 1.852381, -0.8127562, 0, 1, 0.7843137, 1,
-0.05560993, -1.532016, -1.966834, 0, 1, 0.7882353, 1,
-0.05198867, 0.05412228, 0.07142263, 0, 1, 0.7960784, 1,
-0.05073927, -0.4263336, -2.193699, 0, 1, 0.8039216, 1,
-0.04903405, 0.3594196, -0.959789, 0, 1, 0.8078431, 1,
-0.04722308, -0.6403375, -2.979213, 0, 1, 0.8156863, 1,
-0.0434921, -0.4842444, -3.18341, 0, 1, 0.8196079, 1,
-0.03642084, 1.331094, 0.9628952, 0, 1, 0.827451, 1,
-0.03604248, -1.522583, -3.435217, 0, 1, 0.8313726, 1,
-0.03295332, -0.6820763, -2.160707, 0, 1, 0.8392157, 1,
-0.03223267, -0.7435077, -6.845229, 0, 1, 0.8431373, 1,
-0.02894936, 0.08769877, 0.6383063, 0, 1, 0.8509804, 1,
-0.02740518, 0.7602177, -0.001817717, 0, 1, 0.854902, 1,
-0.02435876, 2.121981, -0.6946036, 0, 1, 0.8627451, 1,
-0.0227557, 2.063421, -1.322686, 0, 1, 0.8666667, 1,
-0.02019123, -1.061789, -4.138529, 0, 1, 0.8745098, 1,
-0.01242918, -2.179016, -2.967892, 0, 1, 0.8784314, 1,
-0.007577226, -0.731461, -1.82517, 0, 1, 0.8862745, 1,
-0.00620722, -0.8129876, -3.181826, 0, 1, 0.8901961, 1,
-0.005166347, 1.133965, -0.06485348, 0, 1, 0.8980392, 1,
-0.004314384, -1.641118, -2.294477, 0, 1, 0.9058824, 1,
-0.00299361, 1.105307, -1.279666, 0, 1, 0.9098039, 1,
-0.001150869, -0.3232529, -3.519223, 0, 1, 0.9176471, 1,
-7.041528e-05, 0.7214977, -1.226913, 0, 1, 0.9215686, 1,
0.00691486, 0.7546453, 0.391148, 0, 1, 0.9294118, 1,
0.008723699, 0.2736465, 1.023454, 0, 1, 0.9333333, 1,
0.01030867, 0.8817075, -0.3330099, 0, 1, 0.9411765, 1,
0.01369592, 0.5859189, 1.028012, 0, 1, 0.945098, 1,
0.01390868, -0.398922, 2.701305, 0, 1, 0.9529412, 1,
0.01476796, -0.7747028, 3.316576, 0, 1, 0.9568627, 1,
0.01955397, 0.5610981, 0.05792421, 0, 1, 0.9647059, 1,
0.02476897, -0.1227727, 2.796168, 0, 1, 0.9686275, 1,
0.02656789, -0.1364429, 3.93634, 0, 1, 0.9764706, 1,
0.02762368, 0.462304, 0.7031922, 0, 1, 0.9803922, 1,
0.02911297, -1.411869, 2.16189, 0, 1, 0.9882353, 1,
0.030827, 0.522097, -0.02909687, 0, 1, 0.9921569, 1,
0.03150979, 0.8332828, 0.5844992, 0, 1, 1, 1,
0.03277785, -0.7910668, 3.998683, 0, 0.9921569, 1, 1,
0.03429892, 1.072444, 1.210343, 0, 0.9882353, 1, 1,
0.03592902, 0.4754664, -0.3795813, 0, 0.9803922, 1, 1,
0.03733992, -1.332146, 2.996648, 0, 0.9764706, 1, 1,
0.04130428, 1.305486, 1.602734, 0, 0.9686275, 1, 1,
0.04178874, -1.555028, 1.927507, 0, 0.9647059, 1, 1,
0.04496159, -1.994479, 2.734017, 0, 0.9568627, 1, 1,
0.04557784, -0.3448869, 5.011488, 0, 0.9529412, 1, 1,
0.04919098, 0.3760574, 0.5581191, 0, 0.945098, 1, 1,
0.04931462, 0.4579197, -2.318526, 0, 0.9411765, 1, 1,
0.04992123, 1.601229, -0.8330616, 0, 0.9333333, 1, 1,
0.05090952, 0.1866815, 3.100097, 0, 0.9294118, 1, 1,
0.05553729, 0.6159472, 0.2742606, 0, 0.9215686, 1, 1,
0.06186579, 0.7629562, -1.27844, 0, 0.9176471, 1, 1,
0.06235847, 2.430394, -0.4242878, 0, 0.9098039, 1, 1,
0.06664564, 0.5723359, -1.123793, 0, 0.9058824, 1, 1,
0.06729349, -2.674273, 1.922411, 0, 0.8980392, 1, 1,
0.07209174, -0.9609776, 3.111556, 0, 0.8901961, 1, 1,
0.07256192, -0.5626956, 2.656959, 0, 0.8862745, 1, 1,
0.07813401, -0.5334704, 3.020113, 0, 0.8784314, 1, 1,
0.07860131, 1.856029, 1.705262, 0, 0.8745098, 1, 1,
0.08056705, -1.063938, 2.54271, 0, 0.8666667, 1, 1,
0.08769304, -0.5477836, 3.514564, 0, 0.8627451, 1, 1,
0.08820721, -1.176568, 2.513704, 0, 0.854902, 1, 1,
0.08907662, 0.347234, 0.07519499, 0, 0.8509804, 1, 1,
0.09372504, 0.2355829, -1.234211, 0, 0.8431373, 1, 1,
0.09956637, -0.3238506, 3.754728, 0, 0.8392157, 1, 1,
0.1004915, 1.258916, 0.6352541, 0, 0.8313726, 1, 1,
0.1048557, -2.299186, 2.331308, 0, 0.827451, 1, 1,
0.1052284, 0.5107167, 0.1660999, 0, 0.8196079, 1, 1,
0.1052516, -0.2129991, 2.787819, 0, 0.8156863, 1, 1,
0.1061774, -1.129145, 3.1233, 0, 0.8078431, 1, 1,
0.1083493, -0.2498039, 3.711757, 0, 0.8039216, 1, 1,
0.1092185, -1.683572, 2.563424, 0, 0.7960784, 1, 1,
0.1126456, 0.6490992, -0.1533117, 0, 0.7882353, 1, 1,
0.1144352, -1.235951, 2.036748, 0, 0.7843137, 1, 1,
0.1158767, -0.4230612, 2.830759, 0, 0.7764706, 1, 1,
0.1171415, 0.1110662, 2.732963, 0, 0.772549, 1, 1,
0.1185975, -0.2697496, 1.998604, 0, 0.7647059, 1, 1,
0.1187328, -0.1959885, 3.512111, 0, 0.7607843, 1, 1,
0.1197567, 0.4687588, -0.4196189, 0, 0.7529412, 1, 1,
0.1202002, 0.1687155, 0.5565773, 0, 0.7490196, 1, 1,
0.1243742, -1.805639, 4.388127, 0, 0.7411765, 1, 1,
0.1295936, 0.3546353, -0.08582003, 0, 0.7372549, 1, 1,
0.1317206, -0.977641, 2.513343, 0, 0.7294118, 1, 1,
0.1325531, -0.700087, 2.943576, 0, 0.7254902, 1, 1,
0.1380871, -1.44312, 3.371544, 0, 0.7176471, 1, 1,
0.1382085, 1.231788, 0.3251231, 0, 0.7137255, 1, 1,
0.1388779, -0.3951159, 1.960541, 0, 0.7058824, 1, 1,
0.1393382, -0.6966312, 4.366774, 0, 0.6980392, 1, 1,
0.141172, 0.2373594, 0.9120883, 0, 0.6941177, 1, 1,
0.1431786, 0.04159521, 1.23331, 0, 0.6862745, 1, 1,
0.1505805, -1.793115, 3.973854, 0, 0.682353, 1, 1,
0.1515941, -1.070433, 3.940578, 0, 0.6745098, 1, 1,
0.1524478, -0.9282141, 0.6848996, 0, 0.6705883, 1, 1,
0.1528382, -1.100016, 3.263658, 0, 0.6627451, 1, 1,
0.1530987, 0.2914138, 1.335247, 0, 0.6588235, 1, 1,
0.1577383, -1.247318, 1.030307, 0, 0.6509804, 1, 1,
0.1609213, -0.2686794, 0.3498849, 0, 0.6470588, 1, 1,
0.165527, 0.9467614, 1.182643, 0, 0.6392157, 1, 1,
0.1701838, -0.8311567, 2.686066, 0, 0.6352941, 1, 1,
0.1709675, 0.2203564, 0.3207385, 0, 0.627451, 1, 1,
0.172687, 0.1892693, 0.3672697, 0, 0.6235294, 1, 1,
0.177933, 0.1656837, 1.757907, 0, 0.6156863, 1, 1,
0.1781925, -1.840548, 4.047581, 0, 0.6117647, 1, 1,
0.1784506, 1.396301, 0.7043163, 0, 0.6039216, 1, 1,
0.1864019, 0.4092714, -0.07181518, 0, 0.5960785, 1, 1,
0.1905629, 1.299933, -0.00771308, 0, 0.5921569, 1, 1,
0.1913447, -1.706921, 4.729414, 0, 0.5843138, 1, 1,
0.1917549, 1.57189, -0.5148798, 0, 0.5803922, 1, 1,
0.1930523, -0.595446, 1.739386, 0, 0.572549, 1, 1,
0.1940055, -1.092523, 3.791976, 0, 0.5686275, 1, 1,
0.1966673, 0.5123275, 0.4752735, 0, 0.5607843, 1, 1,
0.1993174, 1.850329, 0.7047538, 0, 0.5568628, 1, 1,
0.1995339, 0.2868487, 2.057107, 0, 0.5490196, 1, 1,
0.2014316, -1.419304, 4.051471, 0, 0.5450981, 1, 1,
0.2017142, -0.1346832, 2.805686, 0, 0.5372549, 1, 1,
0.2028204, 0.6942934, -0.3848267, 0, 0.5333334, 1, 1,
0.2061153, -0.5607139, 2.323989, 0, 0.5254902, 1, 1,
0.2082516, -0.264655, 2.788262, 0, 0.5215687, 1, 1,
0.2086793, -1.301152, 4.631443, 0, 0.5137255, 1, 1,
0.2151913, -0.3597707, 4.455698, 0, 0.509804, 1, 1,
0.2169368, 0.8953795, 0.1095079, 0, 0.5019608, 1, 1,
0.2188668, 0.1335899, -0.7529365, 0, 0.4941176, 1, 1,
0.2217404, -1.216518, 4.036962, 0, 0.4901961, 1, 1,
0.2230872, -0.2236777, 2.50585, 0, 0.4823529, 1, 1,
0.223266, 0.5345512, 0.435776, 0, 0.4784314, 1, 1,
0.2237204, -0.5470005, 1.823219, 0, 0.4705882, 1, 1,
0.2267846, -0.4166372, 4.229414, 0, 0.4666667, 1, 1,
0.227212, 0.2211567, 2.114155, 0, 0.4588235, 1, 1,
0.2286004, -1.939121, 2.769766, 0, 0.454902, 1, 1,
0.2369965, -1.570112, 4.088252, 0, 0.4470588, 1, 1,
0.2424066, -0.6452648, 2.337371, 0, 0.4431373, 1, 1,
0.2441237, -0.4269047, 3.198909, 0, 0.4352941, 1, 1,
0.250625, -0.6741883, 2.350139, 0, 0.4313726, 1, 1,
0.2521054, 0.1815004, -1.133422, 0, 0.4235294, 1, 1,
0.2528704, -1.073144, 3.197234, 0, 0.4196078, 1, 1,
0.2566762, 0.6922079, 0.5567684, 0, 0.4117647, 1, 1,
0.2572175, -0.6561682, 2.904445, 0, 0.4078431, 1, 1,
0.2616486, -0.3413242, 2.867795, 0, 0.4, 1, 1,
0.2622142, 0.6465305, 0.2939144, 0, 0.3921569, 1, 1,
0.2652024, 1.781036, -0.08254507, 0, 0.3882353, 1, 1,
0.2667503, 1.064961, 0.5224605, 0, 0.3803922, 1, 1,
0.2726289, 0.7489594, -1.12703, 0, 0.3764706, 1, 1,
0.2745484, -0.1547004, 2.544117, 0, 0.3686275, 1, 1,
0.2751682, -0.7681917, 4.855513, 0, 0.3647059, 1, 1,
0.2814275, 1.485876, -0.01596482, 0, 0.3568628, 1, 1,
0.2825513, -1.598288, 3.433042, 0, 0.3529412, 1, 1,
0.2852485, 0.8649558, 0.360276, 0, 0.345098, 1, 1,
0.2900927, -1.754491, 2.564605, 0, 0.3411765, 1, 1,
0.2914535, 0.8095296, 1.33439, 0, 0.3333333, 1, 1,
0.2932905, -1.409065, 3.368694, 0, 0.3294118, 1, 1,
0.2948308, 0.5605217, -0.01283375, 0, 0.3215686, 1, 1,
0.300241, -0.8284296, 1.32907, 0, 0.3176471, 1, 1,
0.3014228, 0.4441482, 0.0462612, 0, 0.3098039, 1, 1,
0.3033273, 0.3616827, 0.6118137, 0, 0.3058824, 1, 1,
0.3055482, 0.4170862, 0.6352634, 0, 0.2980392, 1, 1,
0.3103818, 1.200041, 1.357213, 0, 0.2901961, 1, 1,
0.3104342, -0.2582149, 3.624572, 0, 0.2862745, 1, 1,
0.3117274, 0.3607828, 0.07862172, 0, 0.2784314, 1, 1,
0.3119366, 0.7194279, -0.438371, 0, 0.2745098, 1, 1,
0.3126965, 0.2123423, 1.263208, 0, 0.2666667, 1, 1,
0.3137171, 0.5306383, -0.4238531, 0, 0.2627451, 1, 1,
0.3141531, -1.831696, 4.587982, 0, 0.254902, 1, 1,
0.3152462, 0.399975, 0.8037582, 0, 0.2509804, 1, 1,
0.3166931, 0.6527292, 0.5048291, 0, 0.2431373, 1, 1,
0.3208882, -2.213093, 2.857714, 0, 0.2392157, 1, 1,
0.3235458, -0.553799, 1.541769, 0, 0.2313726, 1, 1,
0.3249454, 1.57209, 1.022144, 0, 0.227451, 1, 1,
0.3286657, 0.9977825, -0.06036526, 0, 0.2196078, 1, 1,
0.3348632, -2.376726, 3.948347, 0, 0.2156863, 1, 1,
0.3357385, -1.846335, 3.742997, 0, 0.2078431, 1, 1,
0.3365113, -1.07247, 1.974543, 0, 0.2039216, 1, 1,
0.3368437, -0.5137939, 0.5860342, 0, 0.1960784, 1, 1,
0.3369675, 0.7158517, 1.651907, 0, 0.1882353, 1, 1,
0.3429463, -0.3351638, 2.205864, 0, 0.1843137, 1, 1,
0.3435297, 0.07923502, -0.4221384, 0, 0.1764706, 1, 1,
0.3438787, -1.966536, 4.566208, 0, 0.172549, 1, 1,
0.3444318, 0.3371647, 0.7167971, 0, 0.1647059, 1, 1,
0.3511572, -0.56023, 2.833392, 0, 0.1607843, 1, 1,
0.3561676, -0.2781555, 2.692465, 0, 0.1529412, 1, 1,
0.3602037, -0.6734518, 3.389601, 0, 0.1490196, 1, 1,
0.3620562, 0.3166494, -0.7019313, 0, 0.1411765, 1, 1,
0.3621683, -0.7735735, 2.761142, 0, 0.1372549, 1, 1,
0.3680455, 0.1403519, 0.3460797, 0, 0.1294118, 1, 1,
0.3690306, 0.4831702, -0.4136154, 0, 0.1254902, 1, 1,
0.3726505, -2.068652, 1.980673, 0, 0.1176471, 1, 1,
0.3741068, -1.193407, 3.863737, 0, 0.1137255, 1, 1,
0.37638, 0.9773836, 0.4341453, 0, 0.1058824, 1, 1,
0.3772173, -0.6036418, 1.351369, 0, 0.09803922, 1, 1,
0.3811425, 1.153424, -1.369673, 0, 0.09411765, 1, 1,
0.3881959, -0.01861127, 0.6805764, 0, 0.08627451, 1, 1,
0.3884337, 0.6560605, -0.2199629, 0, 0.08235294, 1, 1,
0.3917255, 1.227541, -0.2898725, 0, 0.07450981, 1, 1,
0.3952493, -0.288137, 0.7264969, 0, 0.07058824, 1, 1,
0.3962743, 0.4118437, -0.4715701, 0, 0.0627451, 1, 1,
0.3974704, 1.256045, -1.298615, 0, 0.05882353, 1, 1,
0.3978298, -0.9486789, 1.944433, 0, 0.05098039, 1, 1,
0.4001101, -0.3255601, 1.281782, 0, 0.04705882, 1, 1,
0.4005727, 0.2831725, -0.6059856, 0, 0.03921569, 1, 1,
0.4012434, 0.8833357, -0.5857511, 0, 0.03529412, 1, 1,
0.4087323, -1.299977, 3.848536, 0, 0.02745098, 1, 1,
0.4095481, 0.380749, 0.3234985, 0, 0.02352941, 1, 1,
0.4111935, -0.2844886, 3.750036, 0, 0.01568628, 1, 1,
0.4116396, 0.5081742, 3.752728, 0, 0.01176471, 1, 1,
0.4138755, -0.4968886, 1.716641, 0, 0.003921569, 1, 1,
0.4178738, 1.270541, -0.1241563, 0.003921569, 0, 1, 1,
0.4219182, -2.388946, 3.455237, 0.007843138, 0, 1, 1,
0.4291817, 2.35346, 0.9427797, 0.01568628, 0, 1, 1,
0.4295454, 0.6018111, 0.6121166, 0.01960784, 0, 1, 1,
0.4297971, -0.1061596, 1.974576, 0.02745098, 0, 1, 1,
0.4302134, -0.3551031, -0.9497683, 0.03137255, 0, 1, 1,
0.4385968, 0.639267, 0.2931197, 0.03921569, 0, 1, 1,
0.4468527, 2.00047, -0.2230956, 0.04313726, 0, 1, 1,
0.4525408, 0.3127877, 2.529583, 0.05098039, 0, 1, 1,
0.4581884, -0.8839718, 3.790751, 0.05490196, 0, 1, 1,
0.4662393, 1.115473, 1.005098, 0.0627451, 0, 1, 1,
0.4687068, 0.9842297, -0.2303977, 0.06666667, 0, 1, 1,
0.4705309, -0.9630405, 3.156408, 0.07450981, 0, 1, 1,
0.4730957, -0.7827399, 0.6985151, 0.07843138, 0, 1, 1,
0.482892, -0.1419522, 1.284871, 0.08627451, 0, 1, 1,
0.4904853, -1.085124, 2.925369, 0.09019608, 0, 1, 1,
0.492555, -0.1151348, 1.422178, 0.09803922, 0, 1, 1,
0.4938559, -0.854012, 4.307013, 0.1058824, 0, 1, 1,
0.4941431, 1.02377, 2.64955, 0.1098039, 0, 1, 1,
0.4952514, -0.2231033, 1.392647, 0.1176471, 0, 1, 1,
0.5005305, -0.1444492, 2.960997, 0.1215686, 0, 1, 1,
0.5014786, 0.6667934, 2.201727, 0.1294118, 0, 1, 1,
0.503932, 1.211536, 0.9013551, 0.1333333, 0, 1, 1,
0.5059927, -0.7222111, 1.985803, 0.1411765, 0, 1, 1,
0.5141562, -0.5673574, 0.3143375, 0.145098, 0, 1, 1,
0.515044, -1.013355, 2.943248, 0.1529412, 0, 1, 1,
0.5154041, -0.2150543, 2.226594, 0.1568628, 0, 1, 1,
0.5155017, 0.4628381, 1.512778, 0.1647059, 0, 1, 1,
0.5183994, -0.110653, 2.024069, 0.1686275, 0, 1, 1,
0.5187909, -0.5959088, 3.159528, 0.1764706, 0, 1, 1,
0.5195763, 1.19307, 0.9920299, 0.1803922, 0, 1, 1,
0.5204806, -0.4585352, 0.6651801, 0.1882353, 0, 1, 1,
0.5206422, 0.05567504, 1.50362, 0.1921569, 0, 1, 1,
0.5222993, 0.3831308, -1.4642, 0.2, 0, 1, 1,
0.526322, -0.3760644, 3.037519, 0.2078431, 0, 1, 1,
0.528877, -0.05839463, 1.526983, 0.2117647, 0, 1, 1,
0.5342692, -0.6959425, 3.039901, 0.2196078, 0, 1, 1,
0.5348225, 0.5809716, 0.823023, 0.2235294, 0, 1, 1,
0.5353243, -0.5808207, 2.193549, 0.2313726, 0, 1, 1,
0.5387168, 0.6506909, -1.795965, 0.2352941, 0, 1, 1,
0.5388312, 0.2363129, -0.2606444, 0.2431373, 0, 1, 1,
0.5405061, 0.4845473, 1.506705, 0.2470588, 0, 1, 1,
0.5441041, 1.760902, -0.03663897, 0.254902, 0, 1, 1,
0.5447532, -0.03180901, 1.672918, 0.2588235, 0, 1, 1,
0.5449013, 0.1578204, 0.2016583, 0.2666667, 0, 1, 1,
0.5497513, 1.087438, -1.026071, 0.2705882, 0, 1, 1,
0.551262, 0.2001349, 2.377584, 0.2784314, 0, 1, 1,
0.5521179, 0.2319453, 0.543178, 0.282353, 0, 1, 1,
0.5654813, -0.730479, 0.6366715, 0.2901961, 0, 1, 1,
0.5667517, -1.585813, 4.175909, 0.2941177, 0, 1, 1,
0.5679489, 0.2921362, -0.1741146, 0.3019608, 0, 1, 1,
0.5689042, -1.303592, 2.7477, 0.3098039, 0, 1, 1,
0.5727813, 0.7306805, 1.870919, 0.3137255, 0, 1, 1,
0.57337, -1.165416, 2.25267, 0.3215686, 0, 1, 1,
0.5738224, -0.8712581, 3.832625, 0.3254902, 0, 1, 1,
0.5797759, 0.8000441, 0.2899713, 0.3333333, 0, 1, 1,
0.5803427, 1.083042, 0.6607475, 0.3372549, 0, 1, 1,
0.581513, -0.5269302, 3.784352, 0.345098, 0, 1, 1,
0.584209, -0.4100122, 2.838976, 0.3490196, 0, 1, 1,
0.5856537, -0.737408, 1.751228, 0.3568628, 0, 1, 1,
0.5862265, -1.494241, 1.592336, 0.3607843, 0, 1, 1,
0.5914507, -0.2754176, 2.081019, 0.3686275, 0, 1, 1,
0.592159, 0.2429056, -1.887292, 0.372549, 0, 1, 1,
0.5937418, -0.9618949, 2.9798, 0.3803922, 0, 1, 1,
0.5942521, 0.6506127, 3.068435, 0.3843137, 0, 1, 1,
0.5961582, 0.7316802, -0.5091575, 0.3921569, 0, 1, 1,
0.596249, -1.157918, 1.303032, 0.3960784, 0, 1, 1,
0.5985416, -0.1718258, 0.8556463, 0.4039216, 0, 1, 1,
0.6025386, 0.8131447, 0.1206486, 0.4117647, 0, 1, 1,
0.6037115, 2.932221, 0.03008947, 0.4156863, 0, 1, 1,
0.604026, 1.479231, 2.734798, 0.4235294, 0, 1, 1,
0.6048933, 0.51986, 0.07010029, 0.427451, 0, 1, 1,
0.6100275, 0.5952566, -0.2506, 0.4352941, 0, 1, 1,
0.6118041, 0.4280855, 0.4464009, 0.4392157, 0, 1, 1,
0.6141226, 2.039293, 1.252638, 0.4470588, 0, 1, 1,
0.6170882, -0.6325999, 2.935222, 0.4509804, 0, 1, 1,
0.6172736, -0.1260898, 2.953398, 0.4588235, 0, 1, 1,
0.6206237, 1.639899, 0.8091597, 0.4627451, 0, 1, 1,
0.6238765, -0.8548673, 2.293099, 0.4705882, 0, 1, 1,
0.6275468, -1.670898, 2.756331, 0.4745098, 0, 1, 1,
0.6291341, -0.2703713, 2.468799, 0.4823529, 0, 1, 1,
0.6313655, -0.8141913, 0.6158885, 0.4862745, 0, 1, 1,
0.6327123, 0.3270901, 0.3821516, 0.4941176, 0, 1, 1,
0.6332488, 0.7661374, -0.1404496, 0.5019608, 0, 1, 1,
0.6346183, 1.341026, 1.433853, 0.5058824, 0, 1, 1,
0.6387089, 1.545768, 1.66066, 0.5137255, 0, 1, 1,
0.6389393, 0.180507, 1.355383, 0.5176471, 0, 1, 1,
0.6394457, -0.6168417, 1.663295, 0.5254902, 0, 1, 1,
0.6468329, -0.9780426, 3.576917, 0.5294118, 0, 1, 1,
0.6497684, -0.8219189, 2.25538, 0.5372549, 0, 1, 1,
0.654658, -1.020297, 1.037954, 0.5411765, 0, 1, 1,
0.665189, -1.016283, 1.999992, 0.5490196, 0, 1, 1,
0.6657156, 0.4277268, 0.3424562, 0.5529412, 0, 1, 1,
0.6660779, -0.224941, 3.028312, 0.5607843, 0, 1, 1,
0.6666675, 2.453387, -1.082725, 0.5647059, 0, 1, 1,
0.6695237, -1.06079, 3.613547, 0.572549, 0, 1, 1,
0.6738265, 0.8709765, 2.206317, 0.5764706, 0, 1, 1,
0.6756961, 1.898766, 1.145322, 0.5843138, 0, 1, 1,
0.6770433, -0.7428973, 3.803678, 0.5882353, 0, 1, 1,
0.6825728, -0.209048, 2.34737, 0.5960785, 0, 1, 1,
0.6837157, 0.4113866, 0.271853, 0.6039216, 0, 1, 1,
0.683833, 0.2439535, -0.2094077, 0.6078432, 0, 1, 1,
0.6918013, -0.6369233, 0.7745831, 0.6156863, 0, 1, 1,
0.6976196, 0.804888, 2.296888, 0.6196079, 0, 1, 1,
0.7009321, 0.2857292, 1.307865, 0.627451, 0, 1, 1,
0.7025419, 2.063265, 1.172985, 0.6313726, 0, 1, 1,
0.7073622, -1.014031, 0.2204861, 0.6392157, 0, 1, 1,
0.7088643, 0.1075569, 0.7101377, 0.6431373, 0, 1, 1,
0.7115927, 0.1316515, 2.315021, 0.6509804, 0, 1, 1,
0.7224734, 1.519108, -0.9081741, 0.654902, 0, 1, 1,
0.7226958, -0.7466446, 2.835362, 0.6627451, 0, 1, 1,
0.7284356, -0.1556807, 2.686897, 0.6666667, 0, 1, 1,
0.7364261, 0.1519922, 0.2527556, 0.6745098, 0, 1, 1,
0.7381005, 2.092273, 0.6392667, 0.6784314, 0, 1, 1,
0.7392492, -0.8015376, 2.553415, 0.6862745, 0, 1, 1,
0.7450791, -0.4128033, 2.469317, 0.6901961, 0, 1, 1,
0.7539676, -0.4676535, 2.780397, 0.6980392, 0, 1, 1,
0.7540854, -0.5132607, 2.729812, 0.7058824, 0, 1, 1,
0.7548529, -0.3580845, 3.374393, 0.7098039, 0, 1, 1,
0.7578775, 1.66914, 0.5510343, 0.7176471, 0, 1, 1,
0.7583963, -0.6928949, 1.842651, 0.7215686, 0, 1, 1,
0.7664579, -0.568265, 3.265506, 0.7294118, 0, 1, 1,
0.7682157, -1.093983, 4.182009, 0.7333333, 0, 1, 1,
0.7705592, -1.397678, 1.782518, 0.7411765, 0, 1, 1,
0.7837225, 0.6265781, 1.27523, 0.7450981, 0, 1, 1,
0.7849948, -0.06660498, 3.00195, 0.7529412, 0, 1, 1,
0.7883777, 0.611692, 0.7275903, 0.7568628, 0, 1, 1,
0.795368, -0.5188193, 2.356115, 0.7647059, 0, 1, 1,
0.799911, 0.7727861, 1.652145, 0.7686275, 0, 1, 1,
0.8009471, 1.158547, 0.05658785, 0.7764706, 0, 1, 1,
0.8010132, 0.2970486, 1.717302, 0.7803922, 0, 1, 1,
0.8115201, 1.428671, 1.239237, 0.7882353, 0, 1, 1,
0.8199065, 0.247407, -0.6425734, 0.7921569, 0, 1, 1,
0.8246194, 0.6801829, 2.445843, 0.8, 0, 1, 1,
0.8267404, 1.124698, 0.9209678, 0.8078431, 0, 1, 1,
0.8323632, -1.57405, 4.065547, 0.8117647, 0, 1, 1,
0.8323992, 0.367209, 1.332909, 0.8196079, 0, 1, 1,
0.8324043, -0.624033, 1.837378, 0.8235294, 0, 1, 1,
0.8355744, 1.186106, 0.2433861, 0.8313726, 0, 1, 1,
0.8394684, 1.224741, -0.1139995, 0.8352941, 0, 1, 1,
0.8434716, -0.8635297, 0.3184621, 0.8431373, 0, 1, 1,
0.8477531, 0.4304422, 0.4207179, 0.8470588, 0, 1, 1,
0.8480607, -0.3979446, 2.380335, 0.854902, 0, 1, 1,
0.853918, -0.2682156, 2.079922, 0.8588235, 0, 1, 1,
0.8571271, 0.696458, -0.03097742, 0.8666667, 0, 1, 1,
0.8635002, -1.194292, 0.5679886, 0.8705882, 0, 1, 1,
0.8653892, -0.5540159, 1.508214, 0.8784314, 0, 1, 1,
0.8664181, 0.2525965, 1.634519, 0.8823529, 0, 1, 1,
0.8727823, 0.7387856, 1.755039, 0.8901961, 0, 1, 1,
0.8759878, 0.07418074, 1.511682, 0.8941177, 0, 1, 1,
0.8831481, -0.2447523, 2.382246, 0.9019608, 0, 1, 1,
0.8854169, 1.220745, 0.9494183, 0.9098039, 0, 1, 1,
0.9019713, -0.2183914, -0.2166422, 0.9137255, 0, 1, 1,
0.9076113, 1.073377, 0.779828, 0.9215686, 0, 1, 1,
0.9076219, 0.4664777, 1.401952, 0.9254902, 0, 1, 1,
0.911494, 2.057119, 1.463133, 0.9333333, 0, 1, 1,
0.9115344, 1.155781, 1.236048, 0.9372549, 0, 1, 1,
0.9154773, -0.7688794, 2.249807, 0.945098, 0, 1, 1,
0.9178562, 0.07951313, 2.028355, 0.9490196, 0, 1, 1,
0.9195343, -0.9412426, 2.68237, 0.9568627, 0, 1, 1,
0.9219103, -1.789267, 3.660806, 0.9607843, 0, 1, 1,
0.9317386, -0.3468115, 1.559613, 0.9686275, 0, 1, 1,
0.9322479, 0.9750004, 1.739768, 0.972549, 0, 1, 1,
0.9338454, -2.008575, 1.021284, 0.9803922, 0, 1, 1,
0.9366714, -0.8723716, 1.773988, 0.9843137, 0, 1, 1,
0.9392416, 0.2695455, 0.3426841, 0.9921569, 0, 1, 1,
0.9433665, -0.8851001, -0.3264221, 0.9960784, 0, 1, 1,
0.9527442, 1.249367, -0.1717577, 1, 0, 0.9960784, 1,
0.9611061, -1.104661, 1.295442, 1, 0, 0.9882353, 1,
0.9625416, 0.5996271, 0.2482052, 1, 0, 0.9843137, 1,
0.9631385, -0.5383413, 1.257538, 1, 0, 0.9764706, 1,
0.9675384, -2.150415, 2.320316, 1, 0, 0.972549, 1,
0.9691268, -0.1204612, 2.58937, 1, 0, 0.9647059, 1,
0.9696395, -0.7031253, 2.205425, 1, 0, 0.9607843, 1,
0.9699463, 0.2674906, 0.5211298, 1, 0, 0.9529412, 1,
0.9715817, -0.1170443, 2.708233, 1, 0, 0.9490196, 1,
0.9716052, 0.7645336, 0.1049157, 1, 0, 0.9411765, 1,
0.9781152, 1.463005, 1.252089, 1, 0, 0.9372549, 1,
0.9804877, 1.768659, -0.6518188, 1, 0, 0.9294118, 1,
0.9847397, 0.649971, 2.001395, 1, 0, 0.9254902, 1,
0.9857071, -1.063279, 3.850184, 1, 0, 0.9176471, 1,
0.9862571, -0.2946731, 1.366588, 1, 0, 0.9137255, 1,
0.9867788, 0.9559752, 1.050094, 1, 0, 0.9058824, 1,
0.9957594, 1.916569, -1.051153, 1, 0, 0.9019608, 1,
1.003801, -1.131518, 1.845798, 1, 0, 0.8941177, 1,
1.004218, -2.169081, 2.411559, 1, 0, 0.8862745, 1,
1.011269, -2.432045, 3.096525, 1, 0, 0.8823529, 1,
1.030009, 2.309435, 0.97006, 1, 0, 0.8745098, 1,
1.033317, -0.1990077, -0.4530751, 1, 0, 0.8705882, 1,
1.033444, 2.455713, -0.01841546, 1, 0, 0.8627451, 1,
1.045668, -1.323134, 2.037916, 1, 0, 0.8588235, 1,
1.046532, -0.2623263, 1.282308, 1, 0, 0.8509804, 1,
1.058208, -0.4232742, 3.310208, 1, 0, 0.8470588, 1,
1.060298, 2.289121, 3.231134, 1, 0, 0.8392157, 1,
1.062283, -1.216217, 1.013708, 1, 0, 0.8352941, 1,
1.066186, 0.5020489, 1.114758, 1, 0, 0.827451, 1,
1.068081, -0.8456593, 1.710881, 1, 0, 0.8235294, 1,
1.077379, -1.146465, 2.303984, 1, 0, 0.8156863, 1,
1.08312, -0.5575873, 0.3520431, 1, 0, 0.8117647, 1,
1.083633, 2.060684, 0.9676915, 1, 0, 0.8039216, 1,
1.085919, 1.957583, -1.144032, 1, 0, 0.7960784, 1,
1.091508, 2.668706, -0.3617281, 1, 0, 0.7921569, 1,
1.095454, -0.3151267, 2.79107, 1, 0, 0.7843137, 1,
1.111233, 1.857247, 1.851631, 1, 0, 0.7803922, 1,
1.11164, 0.5182183, 1.347426, 1, 0, 0.772549, 1,
1.111742, -0.6882405, 0.6395286, 1, 0, 0.7686275, 1,
1.113249, 0.2609883, 1.227377, 1, 0, 0.7607843, 1,
1.116537, 0.3246649, 2.903223, 1, 0, 0.7568628, 1,
1.149955, 0.05918222, 1.177548, 1, 0, 0.7490196, 1,
1.159835, -0.6997015, 1.968108, 1, 0, 0.7450981, 1,
1.161134, 1.016589, 0.5353562, 1, 0, 0.7372549, 1,
1.162748, 0.1006818, 1.501964, 1, 0, 0.7333333, 1,
1.167648, -0.8392933, 1.63399, 1, 0, 0.7254902, 1,
1.176509, -1.622488, 1.914987, 1, 0, 0.7215686, 1,
1.177278, -0.3469377, 1.393598, 1, 0, 0.7137255, 1,
1.182934, 0.1407849, 1.184208, 1, 0, 0.7098039, 1,
1.183357, 0.5268099, -0.06110195, 1, 0, 0.7019608, 1,
1.183742, -0.02290847, 2.681204, 1, 0, 0.6941177, 1,
1.189265, 0.5083133, 2.08544, 1, 0, 0.6901961, 1,
1.201272, -0.5347671, 2.05905, 1, 0, 0.682353, 1,
1.210002, -0.123031, 0.7558677, 1, 0, 0.6784314, 1,
1.212256, 0.09110698, 2.590125, 1, 0, 0.6705883, 1,
1.212768, -0.4388438, 2.335644, 1, 0, 0.6666667, 1,
1.215175, -1.074333, 3.700681, 1, 0, 0.6588235, 1,
1.22045, 0.02214811, 1.893804, 1, 0, 0.654902, 1,
1.227854, 0.2555206, -0.7306798, 1, 0, 0.6470588, 1,
1.237469, 1.186172, -0.7304972, 1, 0, 0.6431373, 1,
1.247244, -0.07711041, 1.475689, 1, 0, 0.6352941, 1,
1.254361, 0.625088, 0.8394437, 1, 0, 0.6313726, 1,
1.256324, 0.1531028, 0.6346033, 1, 0, 0.6235294, 1,
1.256425, -1.465553, 0.5320842, 1, 0, 0.6196079, 1,
1.258424, 0.1466011, 0.698717, 1, 0, 0.6117647, 1,
1.258567, -1.060776, 2.580034, 1, 0, 0.6078432, 1,
1.269549, -0.9535096, 1.747541, 1, 0, 0.6, 1,
1.27906, 0.6646965, 0.2432219, 1, 0, 0.5921569, 1,
1.291556, -0.6857876, 1.265753, 1, 0, 0.5882353, 1,
1.299946, -1.777046, 1.911498, 1, 0, 0.5803922, 1,
1.304584, -0.1654509, 2.891528, 1, 0, 0.5764706, 1,
1.304643, 0.5730633, 1.083282, 1, 0, 0.5686275, 1,
1.305624, -1.947687, 3.130993, 1, 0, 0.5647059, 1,
1.315373, -0.05291567, 1.232138, 1, 0, 0.5568628, 1,
1.320994, 0.1261931, 1.590614, 1, 0, 0.5529412, 1,
1.323952, 0.08831865, -0.09529747, 1, 0, 0.5450981, 1,
1.328749, 1.587048, 0.03282871, 1, 0, 0.5411765, 1,
1.330038, -0.4287883, 1.28282, 1, 0, 0.5333334, 1,
1.339726, -0.4209163, 2.963297, 1, 0, 0.5294118, 1,
1.339824, 0.8188631, 0.5464385, 1, 0, 0.5215687, 1,
1.346614, -0.0830939, 3.456078, 1, 0, 0.5176471, 1,
1.361641, -0.8492715, 2.164684, 1, 0, 0.509804, 1,
1.362174, -0.8523397, 4.987062, 1, 0, 0.5058824, 1,
1.364227, -0.1351433, 2.254412, 1, 0, 0.4980392, 1,
1.375419, -2.347573, 2.662773, 1, 0, 0.4901961, 1,
1.376883, -0.04703383, 1.350745, 1, 0, 0.4862745, 1,
1.385041, 0.7296788, 1.899458, 1, 0, 0.4784314, 1,
1.42194, 0.2943549, 1.514181, 1, 0, 0.4745098, 1,
1.423059, -0.03011635, 2.701694, 1, 0, 0.4666667, 1,
1.448299, -0.9584959, 2.467762, 1, 0, 0.4627451, 1,
1.451975, 2.051658, 2.369981, 1, 0, 0.454902, 1,
1.454413, -0.851479, 1.872947, 1, 0, 0.4509804, 1,
1.457783, -1.444762, 2.462763, 1, 0, 0.4431373, 1,
1.486422, 0.02954964, 1.848423, 1, 0, 0.4392157, 1,
1.488943, -0.3485132, 2.128607, 1, 0, 0.4313726, 1,
1.489097, -0.5850157, 2.811702, 1, 0, 0.427451, 1,
1.493187, -0.949273, 2.259802, 1, 0, 0.4196078, 1,
1.506181, 0.05098468, 2.676595, 1, 0, 0.4156863, 1,
1.513081, -1.30352, 3.208138, 1, 0, 0.4078431, 1,
1.517861, -1.063831, 2.827674, 1, 0, 0.4039216, 1,
1.519264, 1.423887, -0.2218782, 1, 0, 0.3960784, 1,
1.525232, 1.957186, 0.8652021, 1, 0, 0.3882353, 1,
1.525329, -0.5525025, 1.873915, 1, 0, 0.3843137, 1,
1.538247, -0.1674931, 1.78569, 1, 0, 0.3764706, 1,
1.540907, 2.770393, 2.062242, 1, 0, 0.372549, 1,
1.548883, -0.5601899, 1.315487, 1, 0, 0.3647059, 1,
1.566209, -1.229223, 2.011505, 1, 0, 0.3607843, 1,
1.584465, 1.769909, 1.277349, 1, 0, 0.3529412, 1,
1.614411, 0.2934973, 2.176117, 1, 0, 0.3490196, 1,
1.620212, 0.4666044, 3.432498, 1, 0, 0.3411765, 1,
1.62129, 0.0800332, 1.809979, 1, 0, 0.3372549, 1,
1.627211, 0.1884308, 3.674289, 1, 0, 0.3294118, 1,
1.655882, 0.08991884, 1.450255, 1, 0, 0.3254902, 1,
1.668333, -0.3387828, 2.309468, 1, 0, 0.3176471, 1,
1.674032, 0.5983728, -0.9362953, 1, 0, 0.3137255, 1,
1.680794, -0.4418803, 2.194427, 1, 0, 0.3058824, 1,
1.683747, -0.2316312, 1.875137, 1, 0, 0.2980392, 1,
1.697216, -1.909926, 1.566913, 1, 0, 0.2941177, 1,
1.697605, -0.4957016, 0.5574876, 1, 0, 0.2862745, 1,
1.703421, 0.5002711, 0.6612238, 1, 0, 0.282353, 1,
1.708261, 0.4064452, 2.05511, 1, 0, 0.2745098, 1,
1.725057, 0.4451652, 3.53461, 1, 0, 0.2705882, 1,
1.739208, -0.7558913, 1.035635, 1, 0, 0.2627451, 1,
1.753729, 2.091477, -0.5904525, 1, 0, 0.2588235, 1,
1.764557, -1.362444, 3.703155, 1, 0, 0.2509804, 1,
1.775248, -0.3729798, 1.122762, 1, 0, 0.2470588, 1,
1.777388, 0.4212298, 1.021087, 1, 0, 0.2392157, 1,
1.793581, -1.194948, 1.33054, 1, 0, 0.2352941, 1,
1.798254, -0.4868694, 1.910596, 1, 0, 0.227451, 1,
1.801839, 1.522755, 2.416314, 1, 0, 0.2235294, 1,
1.807435, 0.009663141, -0.7106696, 1, 0, 0.2156863, 1,
1.808751, 0.277498, 0.6075147, 1, 0, 0.2117647, 1,
1.820069, -1.208584, 3.184783, 1, 0, 0.2039216, 1,
1.870753, -0.1938832, 1.762213, 1, 0, 0.1960784, 1,
1.876399, -2.642308, 2.773175, 1, 0, 0.1921569, 1,
1.892463, -0.1803633, 1.739295, 1, 0, 0.1843137, 1,
1.895603, -0.2586006, 1.341145, 1, 0, 0.1803922, 1,
1.910509, 0.9938847, 1.380148, 1, 0, 0.172549, 1,
1.911759, -1.262916, 1.22029, 1, 0, 0.1686275, 1,
1.913899, 0.7060028, 2.222475, 1, 0, 0.1607843, 1,
1.938406, -0.5109392, 1.70911, 1, 0, 0.1568628, 1,
1.951912, -1.384026, 2.96718, 1, 0, 0.1490196, 1,
1.954887, -1.078433, 3.731029, 1, 0, 0.145098, 1,
1.959707, 1.05793, 2.966783, 1, 0, 0.1372549, 1,
1.971978, 0.3351119, 3.073559, 1, 0, 0.1333333, 1,
2.003196, 0.9295272, 0.8251897, 1, 0, 0.1254902, 1,
2.009537, 0.2628503, 1.614086, 1, 0, 0.1215686, 1,
2.015571, -0.3800005, 0.3850337, 1, 0, 0.1137255, 1,
2.041317, 1.324915, 1.605495, 1, 0, 0.1098039, 1,
2.06437, 1.492425, -1.91213, 1, 0, 0.1019608, 1,
2.083634, -0.2090628, 2.892226, 1, 0, 0.09411765, 1,
2.09337, 0.8315862, 1.084488, 1, 0, 0.09019608, 1,
2.184563, -0.4268475, 1.392439, 1, 0, 0.08235294, 1,
2.207428, -0.6233652, 1.301161, 1, 0, 0.07843138, 1,
2.25142, -0.1372068, 2.056798, 1, 0, 0.07058824, 1,
2.325752, 2.021628, 2.409071, 1, 0, 0.06666667, 1,
2.392071, -0.6060622, 1.806625, 1, 0, 0.05882353, 1,
2.486461, 0.4146156, 0.4112538, 1, 0, 0.05490196, 1,
2.521858, 0.279469, 2.012332, 1, 0, 0.04705882, 1,
2.62466, 0.9900713, 2.225301, 1, 0, 0.04313726, 1,
2.680063, 0.1119757, 0.59295, 1, 0, 0.03529412, 1,
2.719388, -1.110331, 1.405856, 1, 0, 0.03137255, 1,
2.795969, -0.7205079, 2.306203, 1, 0, 0.02352941, 1,
2.805526, -1.488562, 3.653784, 1, 0, 0.01960784, 1,
2.828265, -1.453109, 2.17506, 1, 0, 0.01176471, 1,
2.983853, 1.025147, 2.633261, 1, 0, 0.007843138, 1
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
-0.002497911, -4.078372, -8.854942, 0, -0.5, 0.5, 0.5,
-0.002497911, -4.078372, -8.854942, 1, -0.5, 0.5, 0.5,
-0.002497911, -4.078372, -8.854942, 1, 1.5, 0.5, 0.5,
-0.002497911, -4.078372, -8.854942, 0, 1.5, 0.5, 0.5
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
-4.001222, 0.1423973, -8.854942, 0, -0.5, 0.5, 0.5,
-4.001222, 0.1423973, -8.854942, 1, -0.5, 0.5, 0.5,
-4.001222, 0.1423973, -8.854942, 1, 1.5, 0.5, 0.5,
-4.001222, 0.1423973, -8.854942, 0, 1.5, 0.5, 0.5
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
-4.001222, -4.078372, -0.9168704, 0, -0.5, 0.5, 0.5,
-4.001222, -4.078372, -0.9168704, 1, -0.5, 0.5, 0.5,
-4.001222, -4.078372, -0.9168704, 1, 1.5, 0.5, 0.5,
-4.001222, -4.078372, -0.9168704, 0, 1.5, 0.5, 0.5
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
-2, -3.104348, -7.023079,
2, -3.104348, -7.023079,
-2, -3.104348, -7.023079,
-2, -3.266686, -7.32839,
-1, -3.104348, -7.023079,
-1, -3.266686, -7.32839,
0, -3.104348, -7.023079,
0, -3.266686, -7.32839,
1, -3.104348, -7.023079,
1, -3.266686, -7.32839,
2, -3.104348, -7.023079,
2, -3.266686, -7.32839
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
-2, -3.59136, -7.939011, 0, -0.5, 0.5, 0.5,
-2, -3.59136, -7.939011, 1, -0.5, 0.5, 0.5,
-2, -3.59136, -7.939011, 1, 1.5, 0.5, 0.5,
-2, -3.59136, -7.939011, 0, 1.5, 0.5, 0.5,
-1, -3.59136, -7.939011, 0, -0.5, 0.5, 0.5,
-1, -3.59136, -7.939011, 1, -0.5, 0.5, 0.5,
-1, -3.59136, -7.939011, 1, 1.5, 0.5, 0.5,
-1, -3.59136, -7.939011, 0, 1.5, 0.5, 0.5,
0, -3.59136, -7.939011, 0, -0.5, 0.5, 0.5,
0, -3.59136, -7.939011, 1, -0.5, 0.5, 0.5,
0, -3.59136, -7.939011, 1, 1.5, 0.5, 0.5,
0, -3.59136, -7.939011, 0, 1.5, 0.5, 0.5,
1, -3.59136, -7.939011, 0, -0.5, 0.5, 0.5,
1, -3.59136, -7.939011, 1, -0.5, 0.5, 0.5,
1, -3.59136, -7.939011, 1, 1.5, 0.5, 0.5,
1, -3.59136, -7.939011, 0, 1.5, 0.5, 0.5,
2, -3.59136, -7.939011, 0, -0.5, 0.5, 0.5,
2, -3.59136, -7.939011, 1, -0.5, 0.5, 0.5,
2, -3.59136, -7.939011, 1, 1.5, 0.5, 0.5,
2, -3.59136, -7.939011, 0, 1.5, 0.5, 0.5
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
-3.078439, -3, -7.023079,
-3.078439, 3, -7.023079,
-3.078439, -3, -7.023079,
-3.232236, -3, -7.32839,
-3.078439, -2, -7.023079,
-3.232236, -2, -7.32839,
-3.078439, -1, -7.023079,
-3.232236, -1, -7.32839,
-3.078439, 0, -7.023079,
-3.232236, 0, -7.32839,
-3.078439, 1, -7.023079,
-3.232236, 1, -7.32839,
-3.078439, 2, -7.023079,
-3.232236, 2, -7.32839,
-3.078439, 3, -7.023079,
-3.232236, 3, -7.32839
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
-3.53983, -3, -7.939011, 0, -0.5, 0.5, 0.5,
-3.53983, -3, -7.939011, 1, -0.5, 0.5, 0.5,
-3.53983, -3, -7.939011, 1, 1.5, 0.5, 0.5,
-3.53983, -3, -7.939011, 0, 1.5, 0.5, 0.5,
-3.53983, -2, -7.939011, 0, -0.5, 0.5, 0.5,
-3.53983, -2, -7.939011, 1, -0.5, 0.5, 0.5,
-3.53983, -2, -7.939011, 1, 1.5, 0.5, 0.5,
-3.53983, -2, -7.939011, 0, 1.5, 0.5, 0.5,
-3.53983, -1, -7.939011, 0, -0.5, 0.5, 0.5,
-3.53983, -1, -7.939011, 1, -0.5, 0.5, 0.5,
-3.53983, -1, -7.939011, 1, 1.5, 0.5, 0.5,
-3.53983, -1, -7.939011, 0, 1.5, 0.5, 0.5,
-3.53983, 0, -7.939011, 0, -0.5, 0.5, 0.5,
-3.53983, 0, -7.939011, 1, -0.5, 0.5, 0.5,
-3.53983, 0, -7.939011, 1, 1.5, 0.5, 0.5,
-3.53983, 0, -7.939011, 0, 1.5, 0.5, 0.5,
-3.53983, 1, -7.939011, 0, -0.5, 0.5, 0.5,
-3.53983, 1, -7.939011, 1, -0.5, 0.5, 0.5,
-3.53983, 1, -7.939011, 1, 1.5, 0.5, 0.5,
-3.53983, 1, -7.939011, 0, 1.5, 0.5, 0.5,
-3.53983, 2, -7.939011, 0, -0.5, 0.5, 0.5,
-3.53983, 2, -7.939011, 1, -0.5, 0.5, 0.5,
-3.53983, 2, -7.939011, 1, 1.5, 0.5, 0.5,
-3.53983, 2, -7.939011, 0, 1.5, 0.5, 0.5,
-3.53983, 3, -7.939011, 0, -0.5, 0.5, 0.5,
-3.53983, 3, -7.939011, 1, -0.5, 0.5, 0.5,
-3.53983, 3, -7.939011, 1, 1.5, 0.5, 0.5,
-3.53983, 3, -7.939011, 0, 1.5, 0.5, 0.5
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
-3.078439, -3.104348, -6,
-3.078439, -3.104348, 4,
-3.078439, -3.104348, -6,
-3.232236, -3.266686, -6,
-3.078439, -3.104348, -4,
-3.232236, -3.266686, -4,
-3.078439, -3.104348, -2,
-3.232236, -3.266686, -2,
-3.078439, -3.104348, 0,
-3.232236, -3.266686, 0,
-3.078439, -3.104348, 2,
-3.232236, -3.266686, 2,
-3.078439, -3.104348, 4,
-3.232236, -3.266686, 4
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
-3.53983, -3.59136, -6, 0, -0.5, 0.5, 0.5,
-3.53983, -3.59136, -6, 1, -0.5, 0.5, 0.5,
-3.53983, -3.59136, -6, 1, 1.5, 0.5, 0.5,
-3.53983, -3.59136, -6, 0, 1.5, 0.5, 0.5,
-3.53983, -3.59136, -4, 0, -0.5, 0.5, 0.5,
-3.53983, -3.59136, -4, 1, -0.5, 0.5, 0.5,
-3.53983, -3.59136, -4, 1, 1.5, 0.5, 0.5,
-3.53983, -3.59136, -4, 0, 1.5, 0.5, 0.5,
-3.53983, -3.59136, -2, 0, -0.5, 0.5, 0.5,
-3.53983, -3.59136, -2, 1, -0.5, 0.5, 0.5,
-3.53983, -3.59136, -2, 1, 1.5, 0.5, 0.5,
-3.53983, -3.59136, -2, 0, 1.5, 0.5, 0.5,
-3.53983, -3.59136, 0, 0, -0.5, 0.5, 0.5,
-3.53983, -3.59136, 0, 1, -0.5, 0.5, 0.5,
-3.53983, -3.59136, 0, 1, 1.5, 0.5, 0.5,
-3.53983, -3.59136, 0, 0, 1.5, 0.5, 0.5,
-3.53983, -3.59136, 2, 0, -0.5, 0.5, 0.5,
-3.53983, -3.59136, 2, 1, -0.5, 0.5, 0.5,
-3.53983, -3.59136, 2, 1, 1.5, 0.5, 0.5,
-3.53983, -3.59136, 2, 0, 1.5, 0.5, 0.5,
-3.53983, -3.59136, 4, 0, -0.5, 0.5, 0.5,
-3.53983, -3.59136, 4, 1, -0.5, 0.5, 0.5,
-3.53983, -3.59136, 4, 1, 1.5, 0.5, 0.5,
-3.53983, -3.59136, 4, 0, 1.5, 0.5, 0.5
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
-3.078439, -3.104348, -7.023079,
-3.078439, 3.389143, -7.023079,
-3.078439, -3.104348, 5.189339,
-3.078439, 3.389143, 5.189339,
-3.078439, -3.104348, -7.023079,
-3.078439, -3.104348, 5.189339,
-3.078439, 3.389143, -7.023079,
-3.078439, 3.389143, 5.189339,
-3.078439, -3.104348, -7.023079,
3.073443, -3.104348, -7.023079,
-3.078439, -3.104348, 5.189339,
3.073443, -3.104348, 5.189339,
-3.078439, 3.389143, -7.023079,
3.073443, 3.389143, -7.023079,
-3.078439, 3.389143, 5.189339,
3.073443, 3.389143, 5.189339,
3.073443, -3.104348, -7.023079,
3.073443, 3.389143, -7.023079,
3.073443, -3.104348, 5.189339,
3.073443, 3.389143, 5.189339,
3.073443, -3.104348, -7.023079,
3.073443, -3.104348, 5.189339,
3.073443, 3.389143, -7.023079,
3.073443, 3.389143, 5.189339
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
var radius = 8.083313;
var distance = 35.96357;
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
mvMatrix.translate( 0.002497911, -0.1423973, 0.9168704 );
mvMatrix.scale( 1.420677, 1.345938, 0.7156516 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.96357);
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
oxalate_dimethylarsi<-read.table("oxalate_dimethylarsi.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxalate_dimethylarsi$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxalate_dimethylarsi' not found
```

```r
y<-oxalate_dimethylarsi$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxalate_dimethylarsi' not found
```

```r
z<-oxalate_dimethylarsi$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxalate_dimethylarsi' not found
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
-2.988849, -2.199008, -1.492079, 0, 0, 1, 1, 1,
-2.650385, 1.255671, -1.038391, 1, 0, 0, 1, 1,
-2.444766, 0.4487043, -1.746769, 1, 0, 0, 1, 1,
-2.416898, 1.026153, -0.7497658, 1, 0, 0, 1, 1,
-2.410594, 1.630748, 1.593279, 1, 0, 0, 1, 1,
-2.385272, -0.447286, -2.473774, 1, 0, 0, 1, 1,
-2.175604, -0.5232015, -2.821048, 0, 0, 0, 1, 1,
-2.134235, 2.308517, -0.8424123, 0, 0, 0, 1, 1,
-2.120198, 1.583387, -0.9266422, 0, 0, 0, 1, 1,
-2.117727, -0.8439655, -1.560522, 0, 0, 0, 1, 1,
-2.061137, 1.464833, -0.4547524, 0, 0, 0, 1, 1,
-2.052525, 0.4648293, -1.707142, 0, 0, 0, 1, 1,
-2.052203, 2.242247, -1.51051, 0, 0, 0, 1, 1,
-1.995993, 0.238465, -1.199353, 1, 1, 1, 1, 1,
-1.944491, 0.1691983, -1.263652, 1, 1, 1, 1, 1,
-1.88737, 2.759996, -0.7701652, 1, 1, 1, 1, 1,
-1.880079, -1.353338, -3.092344, 1, 1, 1, 1, 1,
-1.813123, 0.03655895, -0.7877479, 1, 1, 1, 1, 1,
-1.798107, 0.8394479, -0.1695196, 1, 1, 1, 1, 1,
-1.787626, 0.5331474, -2.180539, 1, 1, 1, 1, 1,
-1.756214, -1.239699, -2.353738, 1, 1, 1, 1, 1,
-1.751508, -1.081814, -1.530318, 1, 1, 1, 1, 1,
-1.746635, -0.958806, -0.3155689, 1, 1, 1, 1, 1,
-1.74365, 0.3920014, -1.614193, 1, 1, 1, 1, 1,
-1.741436, -1.865229, -1.478752, 1, 1, 1, 1, 1,
-1.738536, -0.1775019, -1.115956, 1, 1, 1, 1, 1,
-1.730249, 0.9239925, 0.4202446, 1, 1, 1, 1, 1,
-1.716211, 0.7456474, -0.7593962, 1, 1, 1, 1, 1,
-1.701435, 0.3612106, -1.175414, 0, 0, 1, 1, 1,
-1.674773, 0.276618, -2.570488, 1, 0, 0, 1, 1,
-1.670889, -1.202699, -1.309285, 1, 0, 0, 1, 1,
-1.661337, -0.6292622, -1.915584, 1, 0, 0, 1, 1,
-1.649803, -0.5407251, -1.501572, 1, 0, 0, 1, 1,
-1.639011, 2.19411, -2.019992, 1, 0, 0, 1, 1,
-1.637507, -0.6349878, -1.927298, 0, 0, 0, 1, 1,
-1.615203, 0.1120974, -2.117724, 0, 0, 0, 1, 1,
-1.602485, 0.08995898, -1.520826, 0, 0, 0, 1, 1,
-1.594961, -1.088627, -2.358481, 0, 0, 0, 1, 1,
-1.588778, -0.3994121, -1.602048, 0, 0, 0, 1, 1,
-1.587589, -1.311483, -2.105172, 0, 0, 0, 1, 1,
-1.580147, 0.9324101, -0.6749674, 0, 0, 0, 1, 1,
-1.559823, 2.23386, -1.293991, 1, 1, 1, 1, 1,
-1.553755, 0.6559902, -1.89632, 1, 1, 1, 1, 1,
-1.550095, -0.4293379, -1.236391, 1, 1, 1, 1, 1,
-1.550015, -0.690437, -4.280965, 1, 1, 1, 1, 1,
-1.544437, 1.211823, -1.33042, 1, 1, 1, 1, 1,
-1.543932, -0.9669927, -0.7890339, 1, 1, 1, 1, 1,
-1.538355, -1.271383, -2.654415, 1, 1, 1, 1, 1,
-1.511742, -0.04954549, -0.7867116, 1, 1, 1, 1, 1,
-1.495092, -0.02214536, -0.6208884, 1, 1, 1, 1, 1,
-1.491721, 1.094281, -2.522544, 1, 1, 1, 1, 1,
-1.488641, 0.5705065, -0.01086277, 1, 1, 1, 1, 1,
-1.457486, -1.565235, -2.394792, 1, 1, 1, 1, 1,
-1.454886, -0.5096275, -1.835571, 1, 1, 1, 1, 1,
-1.45299, 0.02724261, -3.527912, 1, 1, 1, 1, 1,
-1.447989, 0.3269375, -1.122961, 1, 1, 1, 1, 1,
-1.431558, 0.4331658, -0.4296255, 0, 0, 1, 1, 1,
-1.421094, -0.75609, -1.939507, 1, 0, 0, 1, 1,
-1.408211, 0.2558908, 0.708191, 1, 0, 0, 1, 1,
-1.405528, 1.678538, -0.7545424, 1, 0, 0, 1, 1,
-1.403471, -0.2864159, -0.6878383, 1, 0, 0, 1, 1,
-1.385049, -0.1993924, -1.309654, 1, 0, 0, 1, 1,
-1.368581, -0.03304333, -1.270801, 0, 0, 0, 1, 1,
-1.362738, -0.03684567, -2.559761, 0, 0, 0, 1, 1,
-1.362621, 1.267295, -0.5174159, 0, 0, 0, 1, 1,
-1.353033, 0.6485837, -0.4127454, 0, 0, 0, 1, 1,
-1.34833, -0.5214632, -2.696724, 0, 0, 0, 1, 1,
-1.343617, 0.681899, 0.1150455, 0, 0, 0, 1, 1,
-1.341923, 0.487283, -1.786108, 0, 0, 0, 1, 1,
-1.340034, -0.03646982, -1.02512, 1, 1, 1, 1, 1,
-1.335018, 0.1792024, -2.504508, 1, 1, 1, 1, 1,
-1.334356, 0.78976, -1.551818, 1, 1, 1, 1, 1,
-1.331151, -0.960235, -3.051893, 1, 1, 1, 1, 1,
-1.324709, 0.7662001, 0.4698281, 1, 1, 1, 1, 1,
-1.32302, 0.3672136, -1.63943, 1, 1, 1, 1, 1,
-1.316032, -1.126221, -3.046827, 1, 1, 1, 1, 1,
-1.309953, -0.1050965, -1.33913, 1, 1, 1, 1, 1,
-1.296678, -0.3365331, -2.312749, 1, 1, 1, 1, 1,
-1.296139, 0.3665211, -0.8207611, 1, 1, 1, 1, 1,
-1.290895, 1.565459, 0.7495196, 1, 1, 1, 1, 1,
-1.283325, 1.810833, -1.027548, 1, 1, 1, 1, 1,
-1.281018, 0.8985502, -0.7280304, 1, 1, 1, 1, 1,
-1.279808, -0.9505244, -1.709241, 1, 1, 1, 1, 1,
-1.278079, -0.1243051, -2.125605, 1, 1, 1, 1, 1,
-1.270916, 0.1397651, -0.6517909, 0, 0, 1, 1, 1,
-1.269925, -0.492003, -2.647291, 1, 0, 0, 1, 1,
-1.267514, 1.269195, -0.9120028, 1, 0, 0, 1, 1,
-1.265372, 0.2269446, -1.576772, 1, 0, 0, 1, 1,
-1.261417, -0.2527854, -0.9850477, 1, 0, 0, 1, 1,
-1.255291, -2.901998, -1.573465, 1, 0, 0, 1, 1,
-1.248195, -0.2945741, -0.3785376, 0, 0, 0, 1, 1,
-1.245474, -0.312927, -2.735729, 0, 0, 0, 1, 1,
-1.234956, -1.780059, -2.222943, 0, 0, 0, 1, 1,
-1.222974, -0.1857658, -0.551361, 0, 0, 0, 1, 1,
-1.220033, 1.949192, -1.572, 0, 0, 0, 1, 1,
-1.219283, -2.026789, -1.899465, 0, 0, 0, 1, 1,
-1.215135, 1.418352, -0.7046976, 0, 0, 0, 1, 1,
-1.21291, 1.489696, -0.3940031, 1, 1, 1, 1, 1,
-1.19273, 0.4762255, -0.7296609, 1, 1, 1, 1, 1,
-1.178037, -0.5297152, -0.7295027, 1, 1, 1, 1, 1,
-1.174194, 0.4630788, -1.981839, 1, 1, 1, 1, 1,
-1.168977, -1.691919, -1.24445, 1, 1, 1, 1, 1,
-1.168343, 1.277591, -0.1125843, 1, 1, 1, 1, 1,
-1.167052, 0.4864329, -0.6956006, 1, 1, 1, 1, 1,
-1.152794, 1.052213, -1.149858, 1, 1, 1, 1, 1,
-1.150485, 0.3378043, -1.41235, 1, 1, 1, 1, 1,
-1.137734, 0.0580134, -1.614431, 1, 1, 1, 1, 1,
-1.133196, -1.34834, -2.877237, 1, 1, 1, 1, 1,
-1.119332, 0.4865021, 0.5657191, 1, 1, 1, 1, 1,
-1.117567, 1.324429, -0.01194221, 1, 1, 1, 1, 1,
-1.111985, -1.920483, -2.599294, 1, 1, 1, 1, 1,
-1.103594, -0.254773, -2.065481, 1, 1, 1, 1, 1,
-1.103521, -0.4989752, -3.606677, 0, 0, 1, 1, 1,
-1.099611, -1.473117, -3.027544, 1, 0, 0, 1, 1,
-1.098881, 1.15249, 1.48794, 1, 0, 0, 1, 1,
-1.098831, -0.5756049, -2.838713, 1, 0, 0, 1, 1,
-1.085038, -2.043015, -1.71907, 1, 0, 0, 1, 1,
-1.080519, 0.1928246, -1.014687, 1, 0, 0, 1, 1,
-1.075356, 1.199636, -1.708554, 0, 0, 0, 1, 1,
-1.073822, -0.8747011, -2.013053, 0, 0, 0, 1, 1,
-1.073173, 0.1243316, -0.6357528, 0, 0, 0, 1, 1,
-1.071144, 0.7351205, -1.121065, 0, 0, 0, 1, 1,
-1.070689, -0.4932608, -1.825284, 0, 0, 0, 1, 1,
-1.066695, -2.047673, -4.008377, 0, 0, 0, 1, 1,
-1.064096, 0.349668, -1.528918, 0, 0, 0, 1, 1,
-1.063384, -0.1248574, -1.832958, 1, 1, 1, 1, 1,
-1.059836, 2.427927, -0.09863892, 1, 1, 1, 1, 1,
-1.052725, 0.5261739, -0.01620898, 1, 1, 1, 1, 1,
-1.049753, 2.21692, -0.683848, 1, 1, 1, 1, 1,
-1.048889, -0.317575, -3.916305, 1, 1, 1, 1, 1,
-1.034378, 1.007717, -3.082453, 1, 1, 1, 1, 1,
-1.03306, -0.5773202, -4.546485, 1, 1, 1, 1, 1,
-1.02357, 0.3946322, -1.418991, 1, 1, 1, 1, 1,
-1.017787, 1.536682, -0.7423295, 1, 1, 1, 1, 1,
-1.014485, -1.759335, -3.197316, 1, 1, 1, 1, 1,
-1.008226, -0.6627391, -1.335761, 1, 1, 1, 1, 1,
-1.001302, 1.756615, -0.1095196, 1, 1, 1, 1, 1,
-0.9976625, 0.1835292, -3.020759, 1, 1, 1, 1, 1,
-0.9925944, -0.7358154, -1.185555, 1, 1, 1, 1, 1,
-0.9909773, -0.6084219, -2.857753, 1, 1, 1, 1, 1,
-0.9873909, -0.1598186, -2.650757, 0, 0, 1, 1, 1,
-0.9776747, -0.1172675, -2.178076, 1, 0, 0, 1, 1,
-0.9763417, 0.2272358, -0.5800035, 1, 0, 0, 1, 1,
-0.9732957, 1.177487, -1.343242, 1, 0, 0, 1, 1,
-0.9655211, -1.714643, -3.065293, 1, 0, 0, 1, 1,
-0.9537485, 0.8107359, -1.389362, 1, 0, 0, 1, 1,
-0.9393126, -0.1394192, -1.01824, 0, 0, 0, 1, 1,
-0.9314437, -0.1243725, -0.4621233, 0, 0, 0, 1, 1,
-0.9255351, 0.1587897, -3.134625, 0, 0, 0, 1, 1,
-0.9248174, 0.5310259, -2.059935, 0, 0, 0, 1, 1,
-0.9220011, 0.5186889, -1.914489, 0, 0, 0, 1, 1,
-0.9152166, 0.3220949, -2.218177, 0, 0, 0, 1, 1,
-0.9051198, 0.7757759, -0.4942425, 0, 0, 0, 1, 1,
-0.9010096, 0.01078354, -1.934434, 1, 1, 1, 1, 1,
-0.8986052, 1.207865, 0.2315922, 1, 1, 1, 1, 1,
-0.8909358, -0.7195869, -3.222143, 1, 1, 1, 1, 1,
-0.8852896, 0.5284262, 0.3882823, 1, 1, 1, 1, 1,
-0.8822194, 0.815101, -1.963188, 1, 1, 1, 1, 1,
-0.8820031, -0.975686, -2.262199, 1, 1, 1, 1, 1,
-0.8819013, -2.182317, -2.965311, 1, 1, 1, 1, 1,
-0.8813601, 1.437959, -0.2268087, 1, 1, 1, 1, 1,
-0.8790992, -0.05124155, -0.8673677, 1, 1, 1, 1, 1,
-0.8684017, 1.175381, 1.082724, 1, 1, 1, 1, 1,
-0.8681253, -0.2966461, -2.903915, 1, 1, 1, 1, 1,
-0.8672817, 0.7955637, 0.1198346, 1, 1, 1, 1, 1,
-0.8562109, -0.07939231, -0.4263095, 1, 1, 1, 1, 1,
-0.8546919, -1.49621, -2.928631, 1, 1, 1, 1, 1,
-0.8519686, -0.02392221, 0.3779625, 1, 1, 1, 1, 1,
-0.8498517, 0.09626798, -0.2473439, 0, 0, 1, 1, 1,
-0.8469594, 0.6052534, 0.1417414, 1, 0, 0, 1, 1,
-0.8422053, -0.4207653, -2.528713, 1, 0, 0, 1, 1,
-0.8290783, -0.5565671, -1.820899, 1, 0, 0, 1, 1,
-0.8223584, -0.5900576, -2.017217, 1, 0, 0, 1, 1,
-0.8209399, -2.116132, -4.205399, 1, 0, 0, 1, 1,
-0.8144334, -1.015146, -1.602765, 0, 0, 0, 1, 1,
-0.8118367, -0.5030645, -1.969265, 0, 0, 0, 1, 1,
-0.8087624, 1.46205, 1.866863, 0, 0, 0, 1, 1,
-0.8016459, 0.9403931, 0.7013089, 0, 0, 0, 1, 1,
-0.8008762, 0.5983994, 0.6660715, 0, 0, 0, 1, 1,
-0.7969637, -0.3293545, -1.299775, 0, 0, 0, 1, 1,
-0.7922478, 0.5574229, -0.7338279, 0, 0, 0, 1, 1,
-0.79017, 0.2681599, -1.667859, 1, 1, 1, 1, 1,
-0.7889409, 0.1539185, -1.320365, 1, 1, 1, 1, 1,
-0.7885457, 0.6873771, -1.154039, 1, 1, 1, 1, 1,
-0.786195, 0.8659502, -0.5156573, 1, 1, 1, 1, 1,
-0.7852518, -0.7678043, -3.079399, 1, 1, 1, 1, 1,
-0.7814111, -0.3867246, -3.164749, 1, 1, 1, 1, 1,
-0.7814032, 1.458409, -0.5549617, 1, 1, 1, 1, 1,
-0.7811505, 1.127535, 1.092127, 1, 1, 1, 1, 1,
-0.7797917, 0.4020027, -2.965382, 1, 1, 1, 1, 1,
-0.7795881, 0.5315624, -3.407165, 1, 1, 1, 1, 1,
-0.7752229, 0.7498586, -0.8877218, 1, 1, 1, 1, 1,
-0.7743611, 0.7745158, -0.4748111, 1, 1, 1, 1, 1,
-0.7717801, -1.094482, -4.199567, 1, 1, 1, 1, 1,
-0.7649478, 0.1716957, -0.4986536, 1, 1, 1, 1, 1,
-0.7642769, 1.924378, 1.20538, 1, 1, 1, 1, 1,
-0.739997, -0.1583181, -2.621718, 0, 0, 1, 1, 1,
-0.7363137, 2.22148, -1.267902, 1, 0, 0, 1, 1,
-0.7347225, 0.5773914, -0.3385206, 1, 0, 0, 1, 1,
-0.7341122, -0.1248132, -1.22368, 1, 0, 0, 1, 1,
-0.7324514, 0.7421764, -0.4672936, 1, 0, 0, 1, 1,
-0.729998, -1.323375, -3.176441, 1, 0, 0, 1, 1,
-0.7297558, -1.20462, -2.86147, 0, 0, 0, 1, 1,
-0.7262152, 1.663708, -0.6066296, 0, 0, 0, 1, 1,
-0.7235246, -1.456753, -2.736086, 0, 0, 0, 1, 1,
-0.7177268, 1.333012, -1.527036, 0, 0, 0, 1, 1,
-0.7171561, -0.875464, -2.717957, 0, 0, 0, 1, 1,
-0.7090181, -0.3852365, -1.310558, 0, 0, 0, 1, 1,
-0.7080288, -1.273863, -1.574724, 0, 0, 0, 1, 1,
-0.7054712, 0.03222082, -0.5030268, 1, 1, 1, 1, 1,
-0.6960155, -0.5531347, -0.7441074, 1, 1, 1, 1, 1,
-0.692402, -0.2291824, -1.362959, 1, 1, 1, 1, 1,
-0.6921805, -0.3039891, -1.475934, 1, 1, 1, 1, 1,
-0.6899756, 1.307962, -0.4280864, 1, 1, 1, 1, 1,
-0.6882161, 0.5195324, 0.9701203, 1, 1, 1, 1, 1,
-0.6777638, 0.7511299, -0.6279935, 1, 1, 1, 1, 1,
-0.6764151, 0.7448984, 0.0929804, 1, 1, 1, 1, 1,
-0.6739289, -1.353084, -1.633961, 1, 1, 1, 1, 1,
-0.6704082, 0.1481703, -1.352343, 1, 1, 1, 1, 1,
-0.6697927, 0.1214239, -0.8539372, 1, 1, 1, 1, 1,
-0.6673107, -0.818729, -3.246427, 1, 1, 1, 1, 1,
-0.6662052, -1.484292, -3.663851, 1, 1, 1, 1, 1,
-0.6655861, -1.22484, -1.842691, 1, 1, 1, 1, 1,
-0.6640278, -1.800944, -2.651344, 1, 1, 1, 1, 1,
-0.6616896, 1.346786, -0.9039997, 0, 0, 1, 1, 1,
-0.6610802, 0.009241085, -0.7878448, 1, 0, 0, 1, 1,
-0.6608628, 0.6281568, 1.774305, 1, 0, 0, 1, 1,
-0.6589379, -0.6827384, -4.227811, 1, 0, 0, 1, 1,
-0.6579099, 1.042906, 0.009779768, 1, 0, 0, 1, 1,
-0.6535243, -0.7646942, -2.280984, 1, 0, 0, 1, 1,
-0.6527268, -2.704664, -3.483822, 0, 0, 0, 1, 1,
-0.6512014, 0.376873, -2.665477, 0, 0, 0, 1, 1,
-0.6511285, 0.4520143, 0.4440399, 0, 0, 0, 1, 1,
-0.6509104, -0.4296506, -2.671929, 0, 0, 0, 1, 1,
-0.6463175, 0.3696433, -0.4884387, 0, 0, 0, 1, 1,
-0.637975, -0.8536173, -1.051886, 0, 0, 0, 1, 1,
-0.6370482, 0.3649727, -0.09225314, 0, 0, 0, 1, 1,
-0.6359993, 0.383878, -0.9016716, 1, 1, 1, 1, 1,
-0.6342415, 0.3249455, -2.526824, 1, 1, 1, 1, 1,
-0.6336773, -1.962749, -4.994846, 1, 1, 1, 1, 1,
-0.6333954, 0.3447655, -1.082654, 1, 1, 1, 1, 1,
-0.6294188, -1.003813, -2.153036, 1, 1, 1, 1, 1,
-0.6280227, -1.246443, -0.5365231, 1, 1, 1, 1, 1,
-0.6278821, -1.9602, -2.942752, 1, 1, 1, 1, 1,
-0.6207247, -0.9649143, -3.166683, 1, 1, 1, 1, 1,
-0.6176621, -1.334758, -1.297959, 1, 1, 1, 1, 1,
-0.615664, 0.9799498, 0.09479184, 1, 1, 1, 1, 1,
-0.6119849, 1.235201, -0.6491951, 1, 1, 1, 1, 1,
-0.6114159, 0.9359083, -0.3876913, 1, 1, 1, 1, 1,
-0.6099923, -0.5155064, -1.211501, 1, 1, 1, 1, 1,
-0.6052167, 0.2432243, -0.5422397, 1, 1, 1, 1, 1,
-0.6027141, 1.059847, -1.010078, 1, 1, 1, 1, 1,
-0.5996692, -0.09550595, -1.283411, 0, 0, 1, 1, 1,
-0.5978448, -0.7044265, -3.2264, 1, 0, 0, 1, 1,
-0.5962679, 0.411467, -0.03128837, 1, 0, 0, 1, 1,
-0.5951558, -0.1601581, 0.1330474, 1, 0, 0, 1, 1,
-0.5920568, -0.07510113, -1.972403, 1, 0, 0, 1, 1,
-0.5910055, -0.2755202, -1.648262, 1, 0, 0, 1, 1,
-0.5894017, -1.091092, -3.650841, 0, 0, 0, 1, 1,
-0.587827, 0.4592492, -2.250198, 0, 0, 0, 1, 1,
-0.5872889, -0.1887371, -0.6023147, 0, 0, 0, 1, 1,
-0.5833606, 0.2934844, -1.527393, 0, 0, 0, 1, 1,
-0.5773567, -0.05089609, -2.678304, 0, 0, 0, 1, 1,
-0.5746211, 1.550766, 0.308107, 0, 0, 0, 1, 1,
-0.5735805, -0.5651077, -2.911544, 0, 0, 0, 1, 1,
-0.5725517, -0.1925191, -2.767101, 1, 1, 1, 1, 1,
-0.5659612, -1.665335, -4.02878, 1, 1, 1, 1, 1,
-0.5652152, -0.0356039, -0.6352501, 1, 1, 1, 1, 1,
-0.5643893, 0.4017731, -1.858017, 1, 1, 1, 1, 1,
-0.5619541, 1.366203, -0.4836526, 1, 1, 1, 1, 1,
-0.5605531, -0.4213982, -2.77528, 1, 1, 1, 1, 1,
-0.5602868, 1.576351, -1.879833, 1, 1, 1, 1, 1,
-0.5592483, 1.599632, 1.272298, 1, 1, 1, 1, 1,
-0.5575502, 0.01413253, -0.7407416, 1, 1, 1, 1, 1,
-0.5539532, -0.6487894, -0.6895553, 1, 1, 1, 1, 1,
-0.5491459, 1.678989, -0.317348, 1, 1, 1, 1, 1,
-0.5481903, -0.004383686, -1.137675, 1, 1, 1, 1, 1,
-0.5475266, 0.6264013, -0.3335501, 1, 1, 1, 1, 1,
-0.5438899, 1.339692, -0.9523596, 1, 1, 1, 1, 1,
-0.5358157, 1.211447, 0.8835353, 1, 1, 1, 1, 1,
-0.5342403, -0.5829816, -2.39205, 0, 0, 1, 1, 1,
-0.5312777, 1.127095, -0.8381983, 1, 0, 0, 1, 1,
-0.5265334, -1.053157, -1.936548, 1, 0, 0, 1, 1,
-0.5242018, 0.4867425, -1.320086, 1, 0, 0, 1, 1,
-0.5128819, 0.2526109, -1.425825, 1, 0, 0, 1, 1,
-0.510148, -0.4940509, -0.8505337, 1, 0, 0, 1, 1,
-0.5019559, -1.487766, -3.230383, 0, 0, 0, 1, 1,
-0.4945061, 2.010056, -1.665677, 0, 0, 0, 1, 1,
-0.4917825, -0.285039, -2.024989, 0, 0, 0, 1, 1,
-0.4911229, -0.7868155, -1.729207, 0, 0, 0, 1, 1,
-0.4901657, -0.4160846, -3.058534, 0, 0, 0, 1, 1,
-0.4882417, -1.730319, -3.145289, 0, 0, 0, 1, 1,
-0.4832575, -0.4463001, -2.017335, 0, 0, 0, 1, 1,
-0.4801479, 0.6360931, -1.150293, 1, 1, 1, 1, 1,
-0.4795641, -1.826097, -3.053613, 1, 1, 1, 1, 1,
-0.4758139, -0.04383549, -1.8937, 1, 1, 1, 1, 1,
-0.4713174, -1.318105, -1.752994, 1, 1, 1, 1, 1,
-0.4617628, -0.6659765, -2.488588, 1, 1, 1, 1, 1,
-0.4589837, -1.635247, -2.618376, 1, 1, 1, 1, 1,
-0.4580191, -3.009783, -1.059315, 1, 1, 1, 1, 1,
-0.4521043, 0.04955576, -1.597094, 1, 1, 1, 1, 1,
-0.4519824, 1.482747, -0.7675319, 1, 1, 1, 1, 1,
-0.4500755, -0.8554133, -1.241237, 1, 1, 1, 1, 1,
-0.4494531, 1.135655, -1.806177, 1, 1, 1, 1, 1,
-0.445378, -0.02661553, -0.1320465, 1, 1, 1, 1, 1,
-0.4437194, -0.5231038, -3.517902, 1, 1, 1, 1, 1,
-0.441843, -2.652034, -3.123896, 1, 1, 1, 1, 1,
-0.4396627, -0.9235049, -2.387184, 1, 1, 1, 1, 1,
-0.4383519, -2.653467, -1.902794, 0, 0, 1, 1, 1,
-0.4363508, -2.53797, -4.779834, 1, 0, 0, 1, 1,
-0.4351173, -0.0664978, -2.157999, 1, 0, 0, 1, 1,
-0.4302985, -1.170171, -1.972379, 1, 0, 0, 1, 1,
-0.4239437, 0.4686915, 0.8242332, 1, 0, 0, 1, 1,
-0.4229596, -1.003962, -2.982773, 1, 0, 0, 1, 1,
-0.4206552, 1.244463, -0.4480896, 0, 0, 0, 1, 1,
-0.417528, -0.0705261, -2.479081, 0, 0, 0, 1, 1,
-0.4144048, 0.3298959, -0.6759052, 0, 0, 0, 1, 1,
-0.4132344, 0.4276174, -0.2040882, 0, 0, 0, 1, 1,
-0.4131938, 1.213026, -0.5768591, 0, 0, 0, 1, 1,
-0.4111069, 0.2145147, -1.52652, 0, 0, 0, 1, 1,
-0.4108775, 1.373457, 1.137584, 0, 0, 0, 1, 1,
-0.4095006, -0.3823798, -1.225829, 1, 1, 1, 1, 1,
-0.4065779, 1.04246, -0.2781932, 1, 1, 1, 1, 1,
-0.4024335, -1.386946, -3.734556, 1, 1, 1, 1, 1,
-0.3973659, 1.498014, 0.2825654, 1, 1, 1, 1, 1,
-0.3971852, -1.737316, -1.929332, 1, 1, 1, 1, 1,
-0.3822301, 1.432215, 1.441292, 1, 1, 1, 1, 1,
-0.3804374, -0.9754166, -4.085773, 1, 1, 1, 1, 1,
-0.3785522, 0.8502988, -0.7700555, 1, 1, 1, 1, 1,
-0.3775477, 0.8990007, -0.3361909, 1, 1, 1, 1, 1,
-0.377434, 0.7221613, 0.7306295, 1, 1, 1, 1, 1,
-0.3717667, 2.454596, 0.5137614, 1, 1, 1, 1, 1,
-0.3706588, -1.994612, -3.265079, 1, 1, 1, 1, 1,
-0.3645439, -0.379749, -3.650384, 1, 1, 1, 1, 1,
-0.3640814, -0.2477282, -1.323411, 1, 1, 1, 1, 1,
-0.3634282, 1.163266, 1.436133, 1, 1, 1, 1, 1,
-0.3614021, -0.04721174, -1.131021, 0, 0, 1, 1, 1,
-0.3603489, 1.97718, -0.737912, 1, 0, 0, 1, 1,
-0.3569637, 0.5509458, -2.420083, 1, 0, 0, 1, 1,
-0.3552315, 0.3170961, -0.416078, 1, 0, 0, 1, 1,
-0.3544953, -0.2925957, -3.261772, 1, 0, 0, 1, 1,
-0.3542859, 0.5197535, -1.176414, 1, 0, 0, 1, 1,
-0.350957, 0.134613, -2.675016, 0, 0, 0, 1, 1,
-0.3504627, -1.586588, -0.5757899, 0, 0, 0, 1, 1,
-0.3496929, 0.6591356, -1.729049, 0, 0, 0, 1, 1,
-0.3479337, 0.1946155, -0.3476369, 0, 0, 0, 1, 1,
-0.3462699, 0.9192563, -0.5245463, 0, 0, 0, 1, 1,
-0.3452177, -0.659595, -2.611297, 0, 0, 0, 1, 1,
-0.3451949, 2.017644, 0.6716651, 0, 0, 0, 1, 1,
-0.3421368, -0.6614155, -3.746499, 1, 1, 1, 1, 1,
-0.3406868, 0.5179882, -0.8091972, 1, 1, 1, 1, 1,
-0.3382632, -1.566236, -1.473834, 1, 1, 1, 1, 1,
-0.3338082, -1.145055, -3.044795, 1, 1, 1, 1, 1,
-0.3331792, -0.460684, -1.715401, 1, 1, 1, 1, 1,
-0.332837, -0.7948754, -1.231628, 1, 1, 1, 1, 1,
-0.3306113, -1.004475, -2.550536, 1, 1, 1, 1, 1,
-0.3276818, 0.03238641, -3.053011, 1, 1, 1, 1, 1,
-0.3273676, -1.354955, -3.250679, 1, 1, 1, 1, 1,
-0.3258038, -0.4166741, -2.907585, 1, 1, 1, 1, 1,
-0.3249471, 1.350224, 0.2486192, 1, 1, 1, 1, 1,
-0.3244135, -0.6421172, -1.746173, 1, 1, 1, 1, 1,
-0.3174855, 0.02973368, 0.1110106, 1, 1, 1, 1, 1,
-0.31601, 0.6151115, 0.6793889, 1, 1, 1, 1, 1,
-0.3155147, 0.2275952, -1.160388, 1, 1, 1, 1, 1,
-0.3118756, 0.3911225, -1.615098, 0, 0, 1, 1, 1,
-0.3104738, 0.9682595, -1.566332, 1, 0, 0, 1, 1,
-0.3103647, -0.1850274, -1.938772, 1, 0, 0, 1, 1,
-0.3079124, -1.534989, -4.434232, 1, 0, 0, 1, 1,
-0.3070345, -0.6359354, -3.562052, 1, 0, 0, 1, 1,
-0.3052823, -0.08827373, -3.00768, 1, 0, 0, 1, 1,
-0.3051308, -0.03662821, -1.036651, 0, 0, 0, 1, 1,
-0.3043709, 3.294578, -1.324179, 0, 0, 0, 1, 1,
-0.2992605, 1.231603, -1.287699, 0, 0, 0, 1, 1,
-0.2966685, 0.4662055, 0.01651444, 0, 0, 0, 1, 1,
-0.295159, 0.7898616, 0.4292519, 0, 0, 0, 1, 1,
-0.2947709, -0.4748226, -0.5011371, 0, 0, 0, 1, 1,
-0.2909557, -0.9427107, -3.033955, 0, 0, 0, 1, 1,
-0.2894007, -0.7005913, -2.260858, 1, 1, 1, 1, 1,
-0.2893304, -0.2575373, -1.354313, 1, 1, 1, 1, 1,
-0.289095, -0.3327506, -1.303973, 1, 1, 1, 1, 1,
-0.2850689, -0.08794905, -3.562171, 1, 1, 1, 1, 1,
-0.2829498, 1.285141, -1.335892, 1, 1, 1, 1, 1,
-0.2818224, -0.120587, -2.786026, 1, 1, 1, 1, 1,
-0.2814598, 0.603308, -1.133543, 1, 1, 1, 1, 1,
-0.2787583, -0.2076657, -1.5244, 1, 1, 1, 1, 1,
-0.2750974, -0.837809, -6.1255, 1, 1, 1, 1, 1,
-0.2657221, -1.30165, -4.163933, 1, 1, 1, 1, 1,
-0.263805, -0.1698647, -2.106408, 1, 1, 1, 1, 1,
-0.263711, -0.2395514, -2.261043, 1, 1, 1, 1, 1,
-0.262695, 1.774655, 0.998763, 1, 1, 1, 1, 1,
-0.2612295, 1.046344, -0.7979359, 1, 1, 1, 1, 1,
-0.2569904, -1.562292, -3.404066, 1, 1, 1, 1, 1,
-0.2554269, -0.2533192, -2.176134, 0, 0, 1, 1, 1,
-0.2518307, -1.942209, -3.709947, 1, 0, 0, 1, 1,
-0.2484691, 0.382488, -1.562183, 1, 0, 0, 1, 1,
-0.2447712, 0.3328231, 0.2590431, 1, 0, 0, 1, 1,
-0.2446651, -0.177717, -3.106239, 1, 0, 0, 1, 1,
-0.2443173, -1.467297, -2.523671, 1, 0, 0, 1, 1,
-0.2440907, 0.1330401, -1.752622, 0, 0, 0, 1, 1,
-0.2395142, 0.4410451, -1.441602, 0, 0, 0, 1, 1,
-0.2390034, -1.79844, -3.186028, 0, 0, 0, 1, 1,
-0.2377248, 0.4259116, 0.6763347, 0, 0, 0, 1, 1,
-0.2309791, -0.3157718, -2.601349, 0, 0, 0, 1, 1,
-0.225289, -1.672767, -3.508653, 0, 0, 0, 1, 1,
-0.2202618, -0.9704061, -5.192513, 0, 0, 0, 1, 1,
-0.217905, -1.011481, -4.883925, 1, 1, 1, 1, 1,
-0.2167748, 1.577707, -0.3149081, 1, 1, 1, 1, 1,
-0.2133471, -0.2817818, -3.094445, 1, 1, 1, 1, 1,
-0.2122762, -0.3371549, -2.314266, 1, 1, 1, 1, 1,
-0.2087384, 0.1341386, -1.325821, 1, 1, 1, 1, 1,
-0.205029, -1.958909, -4.602689, 1, 1, 1, 1, 1,
-0.2040978, -0.03509632, -1.175152, 1, 1, 1, 1, 1,
-0.1999139, -1.918964, -4.446328, 1, 1, 1, 1, 1,
-0.1995472, 0.01939222, -4.249008, 1, 1, 1, 1, 1,
-0.1946837, 0.1143447, 0.5814251, 1, 1, 1, 1, 1,
-0.1886607, -0.5323256, -2.653081, 1, 1, 1, 1, 1,
-0.1865484, -1.349282, -4.221942, 1, 1, 1, 1, 1,
-0.1863482, -1.705044, -4.342276, 1, 1, 1, 1, 1,
-0.1840065, 1.455059, 0.8079892, 1, 1, 1, 1, 1,
-0.1780185, -0.02412164, -2.81447, 1, 1, 1, 1, 1,
-0.1751193, -1.255955, -2.178526, 0, 0, 1, 1, 1,
-0.1679827, -0.4581666, -1.861327, 1, 0, 0, 1, 1,
-0.1678244, -0.6862848, -1.966472, 1, 0, 0, 1, 1,
-0.1637453, -2.186244, -3.228014, 1, 0, 0, 1, 1,
-0.152549, -1.19564, -3.663375, 1, 0, 0, 1, 1,
-0.1513749, 1.443781, -0.8308409, 1, 0, 0, 1, 1,
-0.1500639, 2.125894, -0.3128722, 0, 0, 0, 1, 1,
-0.1491568, -1.677238, -3.174773, 0, 0, 0, 1, 1,
-0.1481152, 0.4020484, 0.7153808, 0, 0, 0, 1, 1,
-0.1475475, -0.5921703, -2.616649, 0, 0, 0, 1, 1,
-0.1440337, -1.06332, -3.019051, 0, 0, 0, 1, 1,
-0.1401871, 0.5188187, -1.508412, 0, 0, 0, 1, 1,
-0.1395021, -1.888759, -3.475747, 0, 0, 0, 1, 1,
-0.1380059, 0.5454236, 0.333751, 1, 1, 1, 1, 1,
-0.1377924, 1.02567, -0.4996774, 1, 1, 1, 1, 1,
-0.1315772, 0.5684001, -1.816442, 1, 1, 1, 1, 1,
-0.1266221, -0.9387776, -1.10175, 1, 1, 1, 1, 1,
-0.1261383, 0.3989209, -0.1639356, 1, 1, 1, 1, 1,
-0.1252121, 1.910906, -0.01529032, 1, 1, 1, 1, 1,
-0.1231278, -0.1707742, -1.459177, 1, 1, 1, 1, 1,
-0.1188738, -1.411445, -2.568431, 1, 1, 1, 1, 1,
-0.115581, -0.4593112, -1.602287, 1, 1, 1, 1, 1,
-0.1154603, 1.695125, -0.4917151, 1, 1, 1, 1, 1,
-0.1153259, 0.5605674, 0.2241845, 1, 1, 1, 1, 1,
-0.1132238, -0.1425186, -3.677687, 1, 1, 1, 1, 1,
-0.1117006, 0.2995703, -0.2504909, 1, 1, 1, 1, 1,
-0.1071911, -0.3502615, -2.33051, 1, 1, 1, 1, 1,
-0.1023778, 0.7250527, -0.2579249, 1, 1, 1, 1, 1,
-0.0955539, -0.23414, -1.671541, 0, 0, 1, 1, 1,
-0.09049068, 0.1619046, 0.2924131, 1, 0, 0, 1, 1,
-0.08940608, 0.5545657, 0.08085812, 1, 0, 0, 1, 1,
-0.08422986, 2.492353, 0.3758221, 1, 0, 0, 1, 1,
-0.08353785, -0.243601, -1.921535, 1, 0, 0, 1, 1,
-0.08169871, 0.5316747, -2.625576, 1, 0, 0, 1, 1,
-0.07979882, 0.7344998, -0.9077009, 0, 0, 0, 1, 1,
-0.07869297, 0.2669792, -0.06926232, 0, 0, 0, 1, 1,
-0.07541239, -0.6382383, -3.75746, 0, 0, 0, 1, 1,
-0.07463479, -0.5183661, -2.138898, 0, 0, 0, 1, 1,
-0.07211658, -0.4329804, -4.043978, 0, 0, 0, 1, 1,
-0.0713008, 1.287773, 0.3771573, 0, 0, 0, 1, 1,
-0.06957345, -0.1207904, -4.260737, 0, 0, 0, 1, 1,
-0.06491821, 0.08118176, 0.6033747, 1, 1, 1, 1, 1,
-0.06374179, -0.8052954, -2.606092, 1, 1, 1, 1, 1,
-0.06249083, 0.7613503, 0.2850673, 1, 1, 1, 1, 1,
-0.06122707, 1.852381, -0.8127562, 1, 1, 1, 1, 1,
-0.05560993, -1.532016, -1.966834, 1, 1, 1, 1, 1,
-0.05198867, 0.05412228, 0.07142263, 1, 1, 1, 1, 1,
-0.05073927, -0.4263336, -2.193699, 1, 1, 1, 1, 1,
-0.04903405, 0.3594196, -0.959789, 1, 1, 1, 1, 1,
-0.04722308, -0.6403375, -2.979213, 1, 1, 1, 1, 1,
-0.0434921, -0.4842444, -3.18341, 1, 1, 1, 1, 1,
-0.03642084, 1.331094, 0.9628952, 1, 1, 1, 1, 1,
-0.03604248, -1.522583, -3.435217, 1, 1, 1, 1, 1,
-0.03295332, -0.6820763, -2.160707, 1, 1, 1, 1, 1,
-0.03223267, -0.7435077, -6.845229, 1, 1, 1, 1, 1,
-0.02894936, 0.08769877, 0.6383063, 1, 1, 1, 1, 1,
-0.02740518, 0.7602177, -0.001817717, 0, 0, 1, 1, 1,
-0.02435876, 2.121981, -0.6946036, 1, 0, 0, 1, 1,
-0.0227557, 2.063421, -1.322686, 1, 0, 0, 1, 1,
-0.02019123, -1.061789, -4.138529, 1, 0, 0, 1, 1,
-0.01242918, -2.179016, -2.967892, 1, 0, 0, 1, 1,
-0.007577226, -0.731461, -1.82517, 1, 0, 0, 1, 1,
-0.00620722, -0.8129876, -3.181826, 0, 0, 0, 1, 1,
-0.005166347, 1.133965, -0.06485348, 0, 0, 0, 1, 1,
-0.004314384, -1.641118, -2.294477, 0, 0, 0, 1, 1,
-0.00299361, 1.105307, -1.279666, 0, 0, 0, 1, 1,
-0.001150869, -0.3232529, -3.519223, 0, 0, 0, 1, 1,
-7.041528e-05, 0.7214977, -1.226913, 0, 0, 0, 1, 1,
0.00691486, 0.7546453, 0.391148, 0, 0, 0, 1, 1,
0.008723699, 0.2736465, 1.023454, 1, 1, 1, 1, 1,
0.01030867, 0.8817075, -0.3330099, 1, 1, 1, 1, 1,
0.01369592, 0.5859189, 1.028012, 1, 1, 1, 1, 1,
0.01390868, -0.398922, 2.701305, 1, 1, 1, 1, 1,
0.01476796, -0.7747028, 3.316576, 1, 1, 1, 1, 1,
0.01955397, 0.5610981, 0.05792421, 1, 1, 1, 1, 1,
0.02476897, -0.1227727, 2.796168, 1, 1, 1, 1, 1,
0.02656789, -0.1364429, 3.93634, 1, 1, 1, 1, 1,
0.02762368, 0.462304, 0.7031922, 1, 1, 1, 1, 1,
0.02911297, -1.411869, 2.16189, 1, 1, 1, 1, 1,
0.030827, 0.522097, -0.02909687, 1, 1, 1, 1, 1,
0.03150979, 0.8332828, 0.5844992, 1, 1, 1, 1, 1,
0.03277785, -0.7910668, 3.998683, 1, 1, 1, 1, 1,
0.03429892, 1.072444, 1.210343, 1, 1, 1, 1, 1,
0.03592902, 0.4754664, -0.3795813, 1, 1, 1, 1, 1,
0.03733992, -1.332146, 2.996648, 0, 0, 1, 1, 1,
0.04130428, 1.305486, 1.602734, 1, 0, 0, 1, 1,
0.04178874, -1.555028, 1.927507, 1, 0, 0, 1, 1,
0.04496159, -1.994479, 2.734017, 1, 0, 0, 1, 1,
0.04557784, -0.3448869, 5.011488, 1, 0, 0, 1, 1,
0.04919098, 0.3760574, 0.5581191, 1, 0, 0, 1, 1,
0.04931462, 0.4579197, -2.318526, 0, 0, 0, 1, 1,
0.04992123, 1.601229, -0.8330616, 0, 0, 0, 1, 1,
0.05090952, 0.1866815, 3.100097, 0, 0, 0, 1, 1,
0.05553729, 0.6159472, 0.2742606, 0, 0, 0, 1, 1,
0.06186579, 0.7629562, -1.27844, 0, 0, 0, 1, 1,
0.06235847, 2.430394, -0.4242878, 0, 0, 0, 1, 1,
0.06664564, 0.5723359, -1.123793, 0, 0, 0, 1, 1,
0.06729349, -2.674273, 1.922411, 1, 1, 1, 1, 1,
0.07209174, -0.9609776, 3.111556, 1, 1, 1, 1, 1,
0.07256192, -0.5626956, 2.656959, 1, 1, 1, 1, 1,
0.07813401, -0.5334704, 3.020113, 1, 1, 1, 1, 1,
0.07860131, 1.856029, 1.705262, 1, 1, 1, 1, 1,
0.08056705, -1.063938, 2.54271, 1, 1, 1, 1, 1,
0.08769304, -0.5477836, 3.514564, 1, 1, 1, 1, 1,
0.08820721, -1.176568, 2.513704, 1, 1, 1, 1, 1,
0.08907662, 0.347234, 0.07519499, 1, 1, 1, 1, 1,
0.09372504, 0.2355829, -1.234211, 1, 1, 1, 1, 1,
0.09956637, -0.3238506, 3.754728, 1, 1, 1, 1, 1,
0.1004915, 1.258916, 0.6352541, 1, 1, 1, 1, 1,
0.1048557, -2.299186, 2.331308, 1, 1, 1, 1, 1,
0.1052284, 0.5107167, 0.1660999, 1, 1, 1, 1, 1,
0.1052516, -0.2129991, 2.787819, 1, 1, 1, 1, 1,
0.1061774, -1.129145, 3.1233, 0, 0, 1, 1, 1,
0.1083493, -0.2498039, 3.711757, 1, 0, 0, 1, 1,
0.1092185, -1.683572, 2.563424, 1, 0, 0, 1, 1,
0.1126456, 0.6490992, -0.1533117, 1, 0, 0, 1, 1,
0.1144352, -1.235951, 2.036748, 1, 0, 0, 1, 1,
0.1158767, -0.4230612, 2.830759, 1, 0, 0, 1, 1,
0.1171415, 0.1110662, 2.732963, 0, 0, 0, 1, 1,
0.1185975, -0.2697496, 1.998604, 0, 0, 0, 1, 1,
0.1187328, -0.1959885, 3.512111, 0, 0, 0, 1, 1,
0.1197567, 0.4687588, -0.4196189, 0, 0, 0, 1, 1,
0.1202002, 0.1687155, 0.5565773, 0, 0, 0, 1, 1,
0.1243742, -1.805639, 4.388127, 0, 0, 0, 1, 1,
0.1295936, 0.3546353, -0.08582003, 0, 0, 0, 1, 1,
0.1317206, -0.977641, 2.513343, 1, 1, 1, 1, 1,
0.1325531, -0.700087, 2.943576, 1, 1, 1, 1, 1,
0.1380871, -1.44312, 3.371544, 1, 1, 1, 1, 1,
0.1382085, 1.231788, 0.3251231, 1, 1, 1, 1, 1,
0.1388779, -0.3951159, 1.960541, 1, 1, 1, 1, 1,
0.1393382, -0.6966312, 4.366774, 1, 1, 1, 1, 1,
0.141172, 0.2373594, 0.9120883, 1, 1, 1, 1, 1,
0.1431786, 0.04159521, 1.23331, 1, 1, 1, 1, 1,
0.1505805, -1.793115, 3.973854, 1, 1, 1, 1, 1,
0.1515941, -1.070433, 3.940578, 1, 1, 1, 1, 1,
0.1524478, -0.9282141, 0.6848996, 1, 1, 1, 1, 1,
0.1528382, -1.100016, 3.263658, 1, 1, 1, 1, 1,
0.1530987, 0.2914138, 1.335247, 1, 1, 1, 1, 1,
0.1577383, -1.247318, 1.030307, 1, 1, 1, 1, 1,
0.1609213, -0.2686794, 0.3498849, 1, 1, 1, 1, 1,
0.165527, 0.9467614, 1.182643, 0, 0, 1, 1, 1,
0.1701838, -0.8311567, 2.686066, 1, 0, 0, 1, 1,
0.1709675, 0.2203564, 0.3207385, 1, 0, 0, 1, 1,
0.172687, 0.1892693, 0.3672697, 1, 0, 0, 1, 1,
0.177933, 0.1656837, 1.757907, 1, 0, 0, 1, 1,
0.1781925, -1.840548, 4.047581, 1, 0, 0, 1, 1,
0.1784506, 1.396301, 0.7043163, 0, 0, 0, 1, 1,
0.1864019, 0.4092714, -0.07181518, 0, 0, 0, 1, 1,
0.1905629, 1.299933, -0.00771308, 0, 0, 0, 1, 1,
0.1913447, -1.706921, 4.729414, 0, 0, 0, 1, 1,
0.1917549, 1.57189, -0.5148798, 0, 0, 0, 1, 1,
0.1930523, -0.595446, 1.739386, 0, 0, 0, 1, 1,
0.1940055, -1.092523, 3.791976, 0, 0, 0, 1, 1,
0.1966673, 0.5123275, 0.4752735, 1, 1, 1, 1, 1,
0.1993174, 1.850329, 0.7047538, 1, 1, 1, 1, 1,
0.1995339, 0.2868487, 2.057107, 1, 1, 1, 1, 1,
0.2014316, -1.419304, 4.051471, 1, 1, 1, 1, 1,
0.2017142, -0.1346832, 2.805686, 1, 1, 1, 1, 1,
0.2028204, 0.6942934, -0.3848267, 1, 1, 1, 1, 1,
0.2061153, -0.5607139, 2.323989, 1, 1, 1, 1, 1,
0.2082516, -0.264655, 2.788262, 1, 1, 1, 1, 1,
0.2086793, -1.301152, 4.631443, 1, 1, 1, 1, 1,
0.2151913, -0.3597707, 4.455698, 1, 1, 1, 1, 1,
0.2169368, 0.8953795, 0.1095079, 1, 1, 1, 1, 1,
0.2188668, 0.1335899, -0.7529365, 1, 1, 1, 1, 1,
0.2217404, -1.216518, 4.036962, 1, 1, 1, 1, 1,
0.2230872, -0.2236777, 2.50585, 1, 1, 1, 1, 1,
0.223266, 0.5345512, 0.435776, 1, 1, 1, 1, 1,
0.2237204, -0.5470005, 1.823219, 0, 0, 1, 1, 1,
0.2267846, -0.4166372, 4.229414, 1, 0, 0, 1, 1,
0.227212, 0.2211567, 2.114155, 1, 0, 0, 1, 1,
0.2286004, -1.939121, 2.769766, 1, 0, 0, 1, 1,
0.2369965, -1.570112, 4.088252, 1, 0, 0, 1, 1,
0.2424066, -0.6452648, 2.337371, 1, 0, 0, 1, 1,
0.2441237, -0.4269047, 3.198909, 0, 0, 0, 1, 1,
0.250625, -0.6741883, 2.350139, 0, 0, 0, 1, 1,
0.2521054, 0.1815004, -1.133422, 0, 0, 0, 1, 1,
0.2528704, -1.073144, 3.197234, 0, 0, 0, 1, 1,
0.2566762, 0.6922079, 0.5567684, 0, 0, 0, 1, 1,
0.2572175, -0.6561682, 2.904445, 0, 0, 0, 1, 1,
0.2616486, -0.3413242, 2.867795, 0, 0, 0, 1, 1,
0.2622142, 0.6465305, 0.2939144, 1, 1, 1, 1, 1,
0.2652024, 1.781036, -0.08254507, 1, 1, 1, 1, 1,
0.2667503, 1.064961, 0.5224605, 1, 1, 1, 1, 1,
0.2726289, 0.7489594, -1.12703, 1, 1, 1, 1, 1,
0.2745484, -0.1547004, 2.544117, 1, 1, 1, 1, 1,
0.2751682, -0.7681917, 4.855513, 1, 1, 1, 1, 1,
0.2814275, 1.485876, -0.01596482, 1, 1, 1, 1, 1,
0.2825513, -1.598288, 3.433042, 1, 1, 1, 1, 1,
0.2852485, 0.8649558, 0.360276, 1, 1, 1, 1, 1,
0.2900927, -1.754491, 2.564605, 1, 1, 1, 1, 1,
0.2914535, 0.8095296, 1.33439, 1, 1, 1, 1, 1,
0.2932905, -1.409065, 3.368694, 1, 1, 1, 1, 1,
0.2948308, 0.5605217, -0.01283375, 1, 1, 1, 1, 1,
0.300241, -0.8284296, 1.32907, 1, 1, 1, 1, 1,
0.3014228, 0.4441482, 0.0462612, 1, 1, 1, 1, 1,
0.3033273, 0.3616827, 0.6118137, 0, 0, 1, 1, 1,
0.3055482, 0.4170862, 0.6352634, 1, 0, 0, 1, 1,
0.3103818, 1.200041, 1.357213, 1, 0, 0, 1, 1,
0.3104342, -0.2582149, 3.624572, 1, 0, 0, 1, 1,
0.3117274, 0.3607828, 0.07862172, 1, 0, 0, 1, 1,
0.3119366, 0.7194279, -0.438371, 1, 0, 0, 1, 1,
0.3126965, 0.2123423, 1.263208, 0, 0, 0, 1, 1,
0.3137171, 0.5306383, -0.4238531, 0, 0, 0, 1, 1,
0.3141531, -1.831696, 4.587982, 0, 0, 0, 1, 1,
0.3152462, 0.399975, 0.8037582, 0, 0, 0, 1, 1,
0.3166931, 0.6527292, 0.5048291, 0, 0, 0, 1, 1,
0.3208882, -2.213093, 2.857714, 0, 0, 0, 1, 1,
0.3235458, -0.553799, 1.541769, 0, 0, 0, 1, 1,
0.3249454, 1.57209, 1.022144, 1, 1, 1, 1, 1,
0.3286657, 0.9977825, -0.06036526, 1, 1, 1, 1, 1,
0.3348632, -2.376726, 3.948347, 1, 1, 1, 1, 1,
0.3357385, -1.846335, 3.742997, 1, 1, 1, 1, 1,
0.3365113, -1.07247, 1.974543, 1, 1, 1, 1, 1,
0.3368437, -0.5137939, 0.5860342, 1, 1, 1, 1, 1,
0.3369675, 0.7158517, 1.651907, 1, 1, 1, 1, 1,
0.3429463, -0.3351638, 2.205864, 1, 1, 1, 1, 1,
0.3435297, 0.07923502, -0.4221384, 1, 1, 1, 1, 1,
0.3438787, -1.966536, 4.566208, 1, 1, 1, 1, 1,
0.3444318, 0.3371647, 0.7167971, 1, 1, 1, 1, 1,
0.3511572, -0.56023, 2.833392, 1, 1, 1, 1, 1,
0.3561676, -0.2781555, 2.692465, 1, 1, 1, 1, 1,
0.3602037, -0.6734518, 3.389601, 1, 1, 1, 1, 1,
0.3620562, 0.3166494, -0.7019313, 1, 1, 1, 1, 1,
0.3621683, -0.7735735, 2.761142, 0, 0, 1, 1, 1,
0.3680455, 0.1403519, 0.3460797, 1, 0, 0, 1, 1,
0.3690306, 0.4831702, -0.4136154, 1, 0, 0, 1, 1,
0.3726505, -2.068652, 1.980673, 1, 0, 0, 1, 1,
0.3741068, -1.193407, 3.863737, 1, 0, 0, 1, 1,
0.37638, 0.9773836, 0.4341453, 1, 0, 0, 1, 1,
0.3772173, -0.6036418, 1.351369, 0, 0, 0, 1, 1,
0.3811425, 1.153424, -1.369673, 0, 0, 0, 1, 1,
0.3881959, -0.01861127, 0.6805764, 0, 0, 0, 1, 1,
0.3884337, 0.6560605, -0.2199629, 0, 0, 0, 1, 1,
0.3917255, 1.227541, -0.2898725, 0, 0, 0, 1, 1,
0.3952493, -0.288137, 0.7264969, 0, 0, 0, 1, 1,
0.3962743, 0.4118437, -0.4715701, 0, 0, 0, 1, 1,
0.3974704, 1.256045, -1.298615, 1, 1, 1, 1, 1,
0.3978298, -0.9486789, 1.944433, 1, 1, 1, 1, 1,
0.4001101, -0.3255601, 1.281782, 1, 1, 1, 1, 1,
0.4005727, 0.2831725, -0.6059856, 1, 1, 1, 1, 1,
0.4012434, 0.8833357, -0.5857511, 1, 1, 1, 1, 1,
0.4087323, -1.299977, 3.848536, 1, 1, 1, 1, 1,
0.4095481, 0.380749, 0.3234985, 1, 1, 1, 1, 1,
0.4111935, -0.2844886, 3.750036, 1, 1, 1, 1, 1,
0.4116396, 0.5081742, 3.752728, 1, 1, 1, 1, 1,
0.4138755, -0.4968886, 1.716641, 1, 1, 1, 1, 1,
0.4178738, 1.270541, -0.1241563, 1, 1, 1, 1, 1,
0.4219182, -2.388946, 3.455237, 1, 1, 1, 1, 1,
0.4291817, 2.35346, 0.9427797, 1, 1, 1, 1, 1,
0.4295454, 0.6018111, 0.6121166, 1, 1, 1, 1, 1,
0.4297971, -0.1061596, 1.974576, 1, 1, 1, 1, 1,
0.4302134, -0.3551031, -0.9497683, 0, 0, 1, 1, 1,
0.4385968, 0.639267, 0.2931197, 1, 0, 0, 1, 1,
0.4468527, 2.00047, -0.2230956, 1, 0, 0, 1, 1,
0.4525408, 0.3127877, 2.529583, 1, 0, 0, 1, 1,
0.4581884, -0.8839718, 3.790751, 1, 0, 0, 1, 1,
0.4662393, 1.115473, 1.005098, 1, 0, 0, 1, 1,
0.4687068, 0.9842297, -0.2303977, 0, 0, 0, 1, 1,
0.4705309, -0.9630405, 3.156408, 0, 0, 0, 1, 1,
0.4730957, -0.7827399, 0.6985151, 0, 0, 0, 1, 1,
0.482892, -0.1419522, 1.284871, 0, 0, 0, 1, 1,
0.4904853, -1.085124, 2.925369, 0, 0, 0, 1, 1,
0.492555, -0.1151348, 1.422178, 0, 0, 0, 1, 1,
0.4938559, -0.854012, 4.307013, 0, 0, 0, 1, 1,
0.4941431, 1.02377, 2.64955, 1, 1, 1, 1, 1,
0.4952514, -0.2231033, 1.392647, 1, 1, 1, 1, 1,
0.5005305, -0.1444492, 2.960997, 1, 1, 1, 1, 1,
0.5014786, 0.6667934, 2.201727, 1, 1, 1, 1, 1,
0.503932, 1.211536, 0.9013551, 1, 1, 1, 1, 1,
0.5059927, -0.7222111, 1.985803, 1, 1, 1, 1, 1,
0.5141562, -0.5673574, 0.3143375, 1, 1, 1, 1, 1,
0.515044, -1.013355, 2.943248, 1, 1, 1, 1, 1,
0.5154041, -0.2150543, 2.226594, 1, 1, 1, 1, 1,
0.5155017, 0.4628381, 1.512778, 1, 1, 1, 1, 1,
0.5183994, -0.110653, 2.024069, 1, 1, 1, 1, 1,
0.5187909, -0.5959088, 3.159528, 1, 1, 1, 1, 1,
0.5195763, 1.19307, 0.9920299, 1, 1, 1, 1, 1,
0.5204806, -0.4585352, 0.6651801, 1, 1, 1, 1, 1,
0.5206422, 0.05567504, 1.50362, 1, 1, 1, 1, 1,
0.5222993, 0.3831308, -1.4642, 0, 0, 1, 1, 1,
0.526322, -0.3760644, 3.037519, 1, 0, 0, 1, 1,
0.528877, -0.05839463, 1.526983, 1, 0, 0, 1, 1,
0.5342692, -0.6959425, 3.039901, 1, 0, 0, 1, 1,
0.5348225, 0.5809716, 0.823023, 1, 0, 0, 1, 1,
0.5353243, -0.5808207, 2.193549, 1, 0, 0, 1, 1,
0.5387168, 0.6506909, -1.795965, 0, 0, 0, 1, 1,
0.5388312, 0.2363129, -0.2606444, 0, 0, 0, 1, 1,
0.5405061, 0.4845473, 1.506705, 0, 0, 0, 1, 1,
0.5441041, 1.760902, -0.03663897, 0, 0, 0, 1, 1,
0.5447532, -0.03180901, 1.672918, 0, 0, 0, 1, 1,
0.5449013, 0.1578204, 0.2016583, 0, 0, 0, 1, 1,
0.5497513, 1.087438, -1.026071, 0, 0, 0, 1, 1,
0.551262, 0.2001349, 2.377584, 1, 1, 1, 1, 1,
0.5521179, 0.2319453, 0.543178, 1, 1, 1, 1, 1,
0.5654813, -0.730479, 0.6366715, 1, 1, 1, 1, 1,
0.5667517, -1.585813, 4.175909, 1, 1, 1, 1, 1,
0.5679489, 0.2921362, -0.1741146, 1, 1, 1, 1, 1,
0.5689042, -1.303592, 2.7477, 1, 1, 1, 1, 1,
0.5727813, 0.7306805, 1.870919, 1, 1, 1, 1, 1,
0.57337, -1.165416, 2.25267, 1, 1, 1, 1, 1,
0.5738224, -0.8712581, 3.832625, 1, 1, 1, 1, 1,
0.5797759, 0.8000441, 0.2899713, 1, 1, 1, 1, 1,
0.5803427, 1.083042, 0.6607475, 1, 1, 1, 1, 1,
0.581513, -0.5269302, 3.784352, 1, 1, 1, 1, 1,
0.584209, -0.4100122, 2.838976, 1, 1, 1, 1, 1,
0.5856537, -0.737408, 1.751228, 1, 1, 1, 1, 1,
0.5862265, -1.494241, 1.592336, 1, 1, 1, 1, 1,
0.5914507, -0.2754176, 2.081019, 0, 0, 1, 1, 1,
0.592159, 0.2429056, -1.887292, 1, 0, 0, 1, 1,
0.5937418, -0.9618949, 2.9798, 1, 0, 0, 1, 1,
0.5942521, 0.6506127, 3.068435, 1, 0, 0, 1, 1,
0.5961582, 0.7316802, -0.5091575, 1, 0, 0, 1, 1,
0.596249, -1.157918, 1.303032, 1, 0, 0, 1, 1,
0.5985416, -0.1718258, 0.8556463, 0, 0, 0, 1, 1,
0.6025386, 0.8131447, 0.1206486, 0, 0, 0, 1, 1,
0.6037115, 2.932221, 0.03008947, 0, 0, 0, 1, 1,
0.604026, 1.479231, 2.734798, 0, 0, 0, 1, 1,
0.6048933, 0.51986, 0.07010029, 0, 0, 0, 1, 1,
0.6100275, 0.5952566, -0.2506, 0, 0, 0, 1, 1,
0.6118041, 0.4280855, 0.4464009, 0, 0, 0, 1, 1,
0.6141226, 2.039293, 1.252638, 1, 1, 1, 1, 1,
0.6170882, -0.6325999, 2.935222, 1, 1, 1, 1, 1,
0.6172736, -0.1260898, 2.953398, 1, 1, 1, 1, 1,
0.6206237, 1.639899, 0.8091597, 1, 1, 1, 1, 1,
0.6238765, -0.8548673, 2.293099, 1, 1, 1, 1, 1,
0.6275468, -1.670898, 2.756331, 1, 1, 1, 1, 1,
0.6291341, -0.2703713, 2.468799, 1, 1, 1, 1, 1,
0.6313655, -0.8141913, 0.6158885, 1, 1, 1, 1, 1,
0.6327123, 0.3270901, 0.3821516, 1, 1, 1, 1, 1,
0.6332488, 0.7661374, -0.1404496, 1, 1, 1, 1, 1,
0.6346183, 1.341026, 1.433853, 1, 1, 1, 1, 1,
0.6387089, 1.545768, 1.66066, 1, 1, 1, 1, 1,
0.6389393, 0.180507, 1.355383, 1, 1, 1, 1, 1,
0.6394457, -0.6168417, 1.663295, 1, 1, 1, 1, 1,
0.6468329, -0.9780426, 3.576917, 1, 1, 1, 1, 1,
0.6497684, -0.8219189, 2.25538, 0, 0, 1, 1, 1,
0.654658, -1.020297, 1.037954, 1, 0, 0, 1, 1,
0.665189, -1.016283, 1.999992, 1, 0, 0, 1, 1,
0.6657156, 0.4277268, 0.3424562, 1, 0, 0, 1, 1,
0.6660779, -0.224941, 3.028312, 1, 0, 0, 1, 1,
0.6666675, 2.453387, -1.082725, 1, 0, 0, 1, 1,
0.6695237, -1.06079, 3.613547, 0, 0, 0, 1, 1,
0.6738265, 0.8709765, 2.206317, 0, 0, 0, 1, 1,
0.6756961, 1.898766, 1.145322, 0, 0, 0, 1, 1,
0.6770433, -0.7428973, 3.803678, 0, 0, 0, 1, 1,
0.6825728, -0.209048, 2.34737, 0, 0, 0, 1, 1,
0.6837157, 0.4113866, 0.271853, 0, 0, 0, 1, 1,
0.683833, 0.2439535, -0.2094077, 0, 0, 0, 1, 1,
0.6918013, -0.6369233, 0.7745831, 1, 1, 1, 1, 1,
0.6976196, 0.804888, 2.296888, 1, 1, 1, 1, 1,
0.7009321, 0.2857292, 1.307865, 1, 1, 1, 1, 1,
0.7025419, 2.063265, 1.172985, 1, 1, 1, 1, 1,
0.7073622, -1.014031, 0.2204861, 1, 1, 1, 1, 1,
0.7088643, 0.1075569, 0.7101377, 1, 1, 1, 1, 1,
0.7115927, 0.1316515, 2.315021, 1, 1, 1, 1, 1,
0.7224734, 1.519108, -0.9081741, 1, 1, 1, 1, 1,
0.7226958, -0.7466446, 2.835362, 1, 1, 1, 1, 1,
0.7284356, -0.1556807, 2.686897, 1, 1, 1, 1, 1,
0.7364261, 0.1519922, 0.2527556, 1, 1, 1, 1, 1,
0.7381005, 2.092273, 0.6392667, 1, 1, 1, 1, 1,
0.7392492, -0.8015376, 2.553415, 1, 1, 1, 1, 1,
0.7450791, -0.4128033, 2.469317, 1, 1, 1, 1, 1,
0.7539676, -0.4676535, 2.780397, 1, 1, 1, 1, 1,
0.7540854, -0.5132607, 2.729812, 0, 0, 1, 1, 1,
0.7548529, -0.3580845, 3.374393, 1, 0, 0, 1, 1,
0.7578775, 1.66914, 0.5510343, 1, 0, 0, 1, 1,
0.7583963, -0.6928949, 1.842651, 1, 0, 0, 1, 1,
0.7664579, -0.568265, 3.265506, 1, 0, 0, 1, 1,
0.7682157, -1.093983, 4.182009, 1, 0, 0, 1, 1,
0.7705592, -1.397678, 1.782518, 0, 0, 0, 1, 1,
0.7837225, 0.6265781, 1.27523, 0, 0, 0, 1, 1,
0.7849948, -0.06660498, 3.00195, 0, 0, 0, 1, 1,
0.7883777, 0.611692, 0.7275903, 0, 0, 0, 1, 1,
0.795368, -0.5188193, 2.356115, 0, 0, 0, 1, 1,
0.799911, 0.7727861, 1.652145, 0, 0, 0, 1, 1,
0.8009471, 1.158547, 0.05658785, 0, 0, 0, 1, 1,
0.8010132, 0.2970486, 1.717302, 1, 1, 1, 1, 1,
0.8115201, 1.428671, 1.239237, 1, 1, 1, 1, 1,
0.8199065, 0.247407, -0.6425734, 1, 1, 1, 1, 1,
0.8246194, 0.6801829, 2.445843, 1, 1, 1, 1, 1,
0.8267404, 1.124698, 0.9209678, 1, 1, 1, 1, 1,
0.8323632, -1.57405, 4.065547, 1, 1, 1, 1, 1,
0.8323992, 0.367209, 1.332909, 1, 1, 1, 1, 1,
0.8324043, -0.624033, 1.837378, 1, 1, 1, 1, 1,
0.8355744, 1.186106, 0.2433861, 1, 1, 1, 1, 1,
0.8394684, 1.224741, -0.1139995, 1, 1, 1, 1, 1,
0.8434716, -0.8635297, 0.3184621, 1, 1, 1, 1, 1,
0.8477531, 0.4304422, 0.4207179, 1, 1, 1, 1, 1,
0.8480607, -0.3979446, 2.380335, 1, 1, 1, 1, 1,
0.853918, -0.2682156, 2.079922, 1, 1, 1, 1, 1,
0.8571271, 0.696458, -0.03097742, 1, 1, 1, 1, 1,
0.8635002, -1.194292, 0.5679886, 0, 0, 1, 1, 1,
0.8653892, -0.5540159, 1.508214, 1, 0, 0, 1, 1,
0.8664181, 0.2525965, 1.634519, 1, 0, 0, 1, 1,
0.8727823, 0.7387856, 1.755039, 1, 0, 0, 1, 1,
0.8759878, 0.07418074, 1.511682, 1, 0, 0, 1, 1,
0.8831481, -0.2447523, 2.382246, 1, 0, 0, 1, 1,
0.8854169, 1.220745, 0.9494183, 0, 0, 0, 1, 1,
0.9019713, -0.2183914, -0.2166422, 0, 0, 0, 1, 1,
0.9076113, 1.073377, 0.779828, 0, 0, 0, 1, 1,
0.9076219, 0.4664777, 1.401952, 0, 0, 0, 1, 1,
0.911494, 2.057119, 1.463133, 0, 0, 0, 1, 1,
0.9115344, 1.155781, 1.236048, 0, 0, 0, 1, 1,
0.9154773, -0.7688794, 2.249807, 0, 0, 0, 1, 1,
0.9178562, 0.07951313, 2.028355, 1, 1, 1, 1, 1,
0.9195343, -0.9412426, 2.68237, 1, 1, 1, 1, 1,
0.9219103, -1.789267, 3.660806, 1, 1, 1, 1, 1,
0.9317386, -0.3468115, 1.559613, 1, 1, 1, 1, 1,
0.9322479, 0.9750004, 1.739768, 1, 1, 1, 1, 1,
0.9338454, -2.008575, 1.021284, 1, 1, 1, 1, 1,
0.9366714, -0.8723716, 1.773988, 1, 1, 1, 1, 1,
0.9392416, 0.2695455, 0.3426841, 1, 1, 1, 1, 1,
0.9433665, -0.8851001, -0.3264221, 1, 1, 1, 1, 1,
0.9527442, 1.249367, -0.1717577, 1, 1, 1, 1, 1,
0.9611061, -1.104661, 1.295442, 1, 1, 1, 1, 1,
0.9625416, 0.5996271, 0.2482052, 1, 1, 1, 1, 1,
0.9631385, -0.5383413, 1.257538, 1, 1, 1, 1, 1,
0.9675384, -2.150415, 2.320316, 1, 1, 1, 1, 1,
0.9691268, -0.1204612, 2.58937, 1, 1, 1, 1, 1,
0.9696395, -0.7031253, 2.205425, 0, 0, 1, 1, 1,
0.9699463, 0.2674906, 0.5211298, 1, 0, 0, 1, 1,
0.9715817, -0.1170443, 2.708233, 1, 0, 0, 1, 1,
0.9716052, 0.7645336, 0.1049157, 1, 0, 0, 1, 1,
0.9781152, 1.463005, 1.252089, 1, 0, 0, 1, 1,
0.9804877, 1.768659, -0.6518188, 1, 0, 0, 1, 1,
0.9847397, 0.649971, 2.001395, 0, 0, 0, 1, 1,
0.9857071, -1.063279, 3.850184, 0, 0, 0, 1, 1,
0.9862571, -0.2946731, 1.366588, 0, 0, 0, 1, 1,
0.9867788, 0.9559752, 1.050094, 0, 0, 0, 1, 1,
0.9957594, 1.916569, -1.051153, 0, 0, 0, 1, 1,
1.003801, -1.131518, 1.845798, 0, 0, 0, 1, 1,
1.004218, -2.169081, 2.411559, 0, 0, 0, 1, 1,
1.011269, -2.432045, 3.096525, 1, 1, 1, 1, 1,
1.030009, 2.309435, 0.97006, 1, 1, 1, 1, 1,
1.033317, -0.1990077, -0.4530751, 1, 1, 1, 1, 1,
1.033444, 2.455713, -0.01841546, 1, 1, 1, 1, 1,
1.045668, -1.323134, 2.037916, 1, 1, 1, 1, 1,
1.046532, -0.2623263, 1.282308, 1, 1, 1, 1, 1,
1.058208, -0.4232742, 3.310208, 1, 1, 1, 1, 1,
1.060298, 2.289121, 3.231134, 1, 1, 1, 1, 1,
1.062283, -1.216217, 1.013708, 1, 1, 1, 1, 1,
1.066186, 0.5020489, 1.114758, 1, 1, 1, 1, 1,
1.068081, -0.8456593, 1.710881, 1, 1, 1, 1, 1,
1.077379, -1.146465, 2.303984, 1, 1, 1, 1, 1,
1.08312, -0.5575873, 0.3520431, 1, 1, 1, 1, 1,
1.083633, 2.060684, 0.9676915, 1, 1, 1, 1, 1,
1.085919, 1.957583, -1.144032, 1, 1, 1, 1, 1,
1.091508, 2.668706, -0.3617281, 0, 0, 1, 1, 1,
1.095454, -0.3151267, 2.79107, 1, 0, 0, 1, 1,
1.111233, 1.857247, 1.851631, 1, 0, 0, 1, 1,
1.11164, 0.5182183, 1.347426, 1, 0, 0, 1, 1,
1.111742, -0.6882405, 0.6395286, 1, 0, 0, 1, 1,
1.113249, 0.2609883, 1.227377, 1, 0, 0, 1, 1,
1.116537, 0.3246649, 2.903223, 0, 0, 0, 1, 1,
1.149955, 0.05918222, 1.177548, 0, 0, 0, 1, 1,
1.159835, -0.6997015, 1.968108, 0, 0, 0, 1, 1,
1.161134, 1.016589, 0.5353562, 0, 0, 0, 1, 1,
1.162748, 0.1006818, 1.501964, 0, 0, 0, 1, 1,
1.167648, -0.8392933, 1.63399, 0, 0, 0, 1, 1,
1.176509, -1.622488, 1.914987, 0, 0, 0, 1, 1,
1.177278, -0.3469377, 1.393598, 1, 1, 1, 1, 1,
1.182934, 0.1407849, 1.184208, 1, 1, 1, 1, 1,
1.183357, 0.5268099, -0.06110195, 1, 1, 1, 1, 1,
1.183742, -0.02290847, 2.681204, 1, 1, 1, 1, 1,
1.189265, 0.5083133, 2.08544, 1, 1, 1, 1, 1,
1.201272, -0.5347671, 2.05905, 1, 1, 1, 1, 1,
1.210002, -0.123031, 0.7558677, 1, 1, 1, 1, 1,
1.212256, 0.09110698, 2.590125, 1, 1, 1, 1, 1,
1.212768, -0.4388438, 2.335644, 1, 1, 1, 1, 1,
1.215175, -1.074333, 3.700681, 1, 1, 1, 1, 1,
1.22045, 0.02214811, 1.893804, 1, 1, 1, 1, 1,
1.227854, 0.2555206, -0.7306798, 1, 1, 1, 1, 1,
1.237469, 1.186172, -0.7304972, 1, 1, 1, 1, 1,
1.247244, -0.07711041, 1.475689, 1, 1, 1, 1, 1,
1.254361, 0.625088, 0.8394437, 1, 1, 1, 1, 1,
1.256324, 0.1531028, 0.6346033, 0, 0, 1, 1, 1,
1.256425, -1.465553, 0.5320842, 1, 0, 0, 1, 1,
1.258424, 0.1466011, 0.698717, 1, 0, 0, 1, 1,
1.258567, -1.060776, 2.580034, 1, 0, 0, 1, 1,
1.269549, -0.9535096, 1.747541, 1, 0, 0, 1, 1,
1.27906, 0.6646965, 0.2432219, 1, 0, 0, 1, 1,
1.291556, -0.6857876, 1.265753, 0, 0, 0, 1, 1,
1.299946, -1.777046, 1.911498, 0, 0, 0, 1, 1,
1.304584, -0.1654509, 2.891528, 0, 0, 0, 1, 1,
1.304643, 0.5730633, 1.083282, 0, 0, 0, 1, 1,
1.305624, -1.947687, 3.130993, 0, 0, 0, 1, 1,
1.315373, -0.05291567, 1.232138, 0, 0, 0, 1, 1,
1.320994, 0.1261931, 1.590614, 0, 0, 0, 1, 1,
1.323952, 0.08831865, -0.09529747, 1, 1, 1, 1, 1,
1.328749, 1.587048, 0.03282871, 1, 1, 1, 1, 1,
1.330038, -0.4287883, 1.28282, 1, 1, 1, 1, 1,
1.339726, -0.4209163, 2.963297, 1, 1, 1, 1, 1,
1.339824, 0.8188631, 0.5464385, 1, 1, 1, 1, 1,
1.346614, -0.0830939, 3.456078, 1, 1, 1, 1, 1,
1.361641, -0.8492715, 2.164684, 1, 1, 1, 1, 1,
1.362174, -0.8523397, 4.987062, 1, 1, 1, 1, 1,
1.364227, -0.1351433, 2.254412, 1, 1, 1, 1, 1,
1.375419, -2.347573, 2.662773, 1, 1, 1, 1, 1,
1.376883, -0.04703383, 1.350745, 1, 1, 1, 1, 1,
1.385041, 0.7296788, 1.899458, 1, 1, 1, 1, 1,
1.42194, 0.2943549, 1.514181, 1, 1, 1, 1, 1,
1.423059, -0.03011635, 2.701694, 1, 1, 1, 1, 1,
1.448299, -0.9584959, 2.467762, 1, 1, 1, 1, 1,
1.451975, 2.051658, 2.369981, 0, 0, 1, 1, 1,
1.454413, -0.851479, 1.872947, 1, 0, 0, 1, 1,
1.457783, -1.444762, 2.462763, 1, 0, 0, 1, 1,
1.486422, 0.02954964, 1.848423, 1, 0, 0, 1, 1,
1.488943, -0.3485132, 2.128607, 1, 0, 0, 1, 1,
1.489097, -0.5850157, 2.811702, 1, 0, 0, 1, 1,
1.493187, -0.949273, 2.259802, 0, 0, 0, 1, 1,
1.506181, 0.05098468, 2.676595, 0, 0, 0, 1, 1,
1.513081, -1.30352, 3.208138, 0, 0, 0, 1, 1,
1.517861, -1.063831, 2.827674, 0, 0, 0, 1, 1,
1.519264, 1.423887, -0.2218782, 0, 0, 0, 1, 1,
1.525232, 1.957186, 0.8652021, 0, 0, 0, 1, 1,
1.525329, -0.5525025, 1.873915, 0, 0, 0, 1, 1,
1.538247, -0.1674931, 1.78569, 1, 1, 1, 1, 1,
1.540907, 2.770393, 2.062242, 1, 1, 1, 1, 1,
1.548883, -0.5601899, 1.315487, 1, 1, 1, 1, 1,
1.566209, -1.229223, 2.011505, 1, 1, 1, 1, 1,
1.584465, 1.769909, 1.277349, 1, 1, 1, 1, 1,
1.614411, 0.2934973, 2.176117, 1, 1, 1, 1, 1,
1.620212, 0.4666044, 3.432498, 1, 1, 1, 1, 1,
1.62129, 0.0800332, 1.809979, 1, 1, 1, 1, 1,
1.627211, 0.1884308, 3.674289, 1, 1, 1, 1, 1,
1.655882, 0.08991884, 1.450255, 1, 1, 1, 1, 1,
1.668333, -0.3387828, 2.309468, 1, 1, 1, 1, 1,
1.674032, 0.5983728, -0.9362953, 1, 1, 1, 1, 1,
1.680794, -0.4418803, 2.194427, 1, 1, 1, 1, 1,
1.683747, -0.2316312, 1.875137, 1, 1, 1, 1, 1,
1.697216, -1.909926, 1.566913, 1, 1, 1, 1, 1,
1.697605, -0.4957016, 0.5574876, 0, 0, 1, 1, 1,
1.703421, 0.5002711, 0.6612238, 1, 0, 0, 1, 1,
1.708261, 0.4064452, 2.05511, 1, 0, 0, 1, 1,
1.725057, 0.4451652, 3.53461, 1, 0, 0, 1, 1,
1.739208, -0.7558913, 1.035635, 1, 0, 0, 1, 1,
1.753729, 2.091477, -0.5904525, 1, 0, 0, 1, 1,
1.764557, -1.362444, 3.703155, 0, 0, 0, 1, 1,
1.775248, -0.3729798, 1.122762, 0, 0, 0, 1, 1,
1.777388, 0.4212298, 1.021087, 0, 0, 0, 1, 1,
1.793581, -1.194948, 1.33054, 0, 0, 0, 1, 1,
1.798254, -0.4868694, 1.910596, 0, 0, 0, 1, 1,
1.801839, 1.522755, 2.416314, 0, 0, 0, 1, 1,
1.807435, 0.009663141, -0.7106696, 0, 0, 0, 1, 1,
1.808751, 0.277498, 0.6075147, 1, 1, 1, 1, 1,
1.820069, -1.208584, 3.184783, 1, 1, 1, 1, 1,
1.870753, -0.1938832, 1.762213, 1, 1, 1, 1, 1,
1.876399, -2.642308, 2.773175, 1, 1, 1, 1, 1,
1.892463, -0.1803633, 1.739295, 1, 1, 1, 1, 1,
1.895603, -0.2586006, 1.341145, 1, 1, 1, 1, 1,
1.910509, 0.9938847, 1.380148, 1, 1, 1, 1, 1,
1.911759, -1.262916, 1.22029, 1, 1, 1, 1, 1,
1.913899, 0.7060028, 2.222475, 1, 1, 1, 1, 1,
1.938406, -0.5109392, 1.70911, 1, 1, 1, 1, 1,
1.951912, -1.384026, 2.96718, 1, 1, 1, 1, 1,
1.954887, -1.078433, 3.731029, 1, 1, 1, 1, 1,
1.959707, 1.05793, 2.966783, 1, 1, 1, 1, 1,
1.971978, 0.3351119, 3.073559, 1, 1, 1, 1, 1,
2.003196, 0.9295272, 0.8251897, 1, 1, 1, 1, 1,
2.009537, 0.2628503, 1.614086, 0, 0, 1, 1, 1,
2.015571, -0.3800005, 0.3850337, 1, 0, 0, 1, 1,
2.041317, 1.324915, 1.605495, 1, 0, 0, 1, 1,
2.06437, 1.492425, -1.91213, 1, 0, 0, 1, 1,
2.083634, -0.2090628, 2.892226, 1, 0, 0, 1, 1,
2.09337, 0.8315862, 1.084488, 1, 0, 0, 1, 1,
2.184563, -0.4268475, 1.392439, 0, 0, 0, 1, 1,
2.207428, -0.6233652, 1.301161, 0, 0, 0, 1, 1,
2.25142, -0.1372068, 2.056798, 0, 0, 0, 1, 1,
2.325752, 2.021628, 2.409071, 0, 0, 0, 1, 1,
2.392071, -0.6060622, 1.806625, 0, 0, 0, 1, 1,
2.486461, 0.4146156, 0.4112538, 0, 0, 0, 1, 1,
2.521858, 0.279469, 2.012332, 0, 0, 0, 1, 1,
2.62466, 0.9900713, 2.225301, 1, 1, 1, 1, 1,
2.680063, 0.1119757, 0.59295, 1, 1, 1, 1, 1,
2.719388, -1.110331, 1.405856, 1, 1, 1, 1, 1,
2.795969, -0.7205079, 2.306203, 1, 1, 1, 1, 1,
2.805526, -1.488562, 3.653784, 1, 1, 1, 1, 1,
2.828265, -1.453109, 2.17506, 1, 1, 1, 1, 1,
2.983853, 1.025147, 2.633261, 1, 1, 1, 1, 1
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
var radius = 9.90817;
var distance = 34.80202;
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
mvMatrix.translate( 0.002497911, -0.1423974, 0.9168704 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.80202);
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
