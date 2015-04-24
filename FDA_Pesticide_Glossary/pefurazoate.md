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
-2.864377, 0.2633344, -0.1802515, 1, 0, 0, 1,
-2.789744, 1.077676, -0.7148058, 1, 0.007843138, 0, 1,
-2.768472, 1.216028, -0.3205356, 1, 0.01176471, 0, 1,
-2.768147, -1.222236, -3.560639, 1, 0.01960784, 0, 1,
-2.535334, 1.588776, -1.591847, 1, 0.02352941, 0, 1,
-2.444785, 1.981554, -0.6232576, 1, 0.03137255, 0, 1,
-2.414181, 1.90851, -2.233923, 1, 0.03529412, 0, 1,
-2.300278, -0.8616421, -2.748116, 1, 0.04313726, 0, 1,
-2.263015, -0.5826913, -0.8782891, 1, 0.04705882, 0, 1,
-2.230839, -2.547388, -1.923769, 1, 0.05490196, 0, 1,
-2.22888, -1.097229, -2.515005, 1, 0.05882353, 0, 1,
-2.193035, -0.06516732, -1.744334, 1, 0.06666667, 0, 1,
-2.182249, -0.4564711, -2.260009, 1, 0.07058824, 0, 1,
-2.162988, 0.3118968, -2.885297, 1, 0.07843138, 0, 1,
-2.149385, -1.702167, -2.536086, 1, 0.08235294, 0, 1,
-2.138621, -0.8016776, -2.93587, 1, 0.09019608, 0, 1,
-2.136373, 0.04536274, -0.8068, 1, 0.09411765, 0, 1,
-2.117979, 1.032055, -2.050513, 1, 0.1019608, 0, 1,
-2.093956, 0.4008404, -1.939184, 1, 0.1098039, 0, 1,
-2.076683, -1.100591, -3.424717, 1, 0.1137255, 0, 1,
-2.054467, 0.7585493, -2.196731, 1, 0.1215686, 0, 1,
-2.041787, 2.195458, 0.6376333, 1, 0.1254902, 0, 1,
-2.014805, -0.7092441, -3.000166, 1, 0.1333333, 0, 1,
-2.003287, -0.4094129, -0.4979128, 1, 0.1372549, 0, 1,
-1.990299, 1.241782, -2.238618, 1, 0.145098, 0, 1,
-1.988585, -0.7300457, -3.568723, 1, 0.1490196, 0, 1,
-1.979519, 1.273619, -2.109368, 1, 0.1568628, 0, 1,
-1.942454, -1.078117, -2.328762, 1, 0.1607843, 0, 1,
-1.937387, 0.2491967, -1.380103, 1, 0.1686275, 0, 1,
-1.934293, -0.6718254, -0.4001736, 1, 0.172549, 0, 1,
-1.914237, -0.6704464, -0.8936972, 1, 0.1803922, 0, 1,
-1.905483, -1.049939, -0.3004232, 1, 0.1843137, 0, 1,
-1.894154, 0.06487892, -1.51212, 1, 0.1921569, 0, 1,
-1.868437, -0.4241614, -1.467627, 1, 0.1960784, 0, 1,
-1.860351, -2.813481, -2.444398, 1, 0.2039216, 0, 1,
-1.841054, -1.294531, -1.783524, 1, 0.2117647, 0, 1,
-1.834699, -0.7528046, -3.476572, 1, 0.2156863, 0, 1,
-1.81192, 0.4061766, -0.6958359, 1, 0.2235294, 0, 1,
-1.807642, -0.6016775, -2.661043, 1, 0.227451, 0, 1,
-1.789615, 0.8772495, -0.7012434, 1, 0.2352941, 0, 1,
-1.780359, 0.4448568, -3.438735, 1, 0.2392157, 0, 1,
-1.776664, -1.147932, -2.258515, 1, 0.2470588, 0, 1,
-1.762478, 0.4329918, 0.5263458, 1, 0.2509804, 0, 1,
-1.750978, 0.08877073, -1.803745, 1, 0.2588235, 0, 1,
-1.729035, -1.082825, -2.657744, 1, 0.2627451, 0, 1,
-1.718284, 0.5143168, 0.2616442, 1, 0.2705882, 0, 1,
-1.712985, 1.111026, -2.290184, 1, 0.2745098, 0, 1,
-1.707272, 0.5290783, -1.531121, 1, 0.282353, 0, 1,
-1.683707, -0.6816218, -2.752763, 1, 0.2862745, 0, 1,
-1.672252, 1.200416, -1.532064, 1, 0.2941177, 0, 1,
-1.669797, 1.238791, -2.581024, 1, 0.3019608, 0, 1,
-1.664897, -0.2541526, -2.583924, 1, 0.3058824, 0, 1,
-1.659568, -0.06397455, -2.915909, 1, 0.3137255, 0, 1,
-1.658531, 0.09104974, -0.5336937, 1, 0.3176471, 0, 1,
-1.658527, -1.422105, -2.855053, 1, 0.3254902, 0, 1,
-1.623438, 1.566244, 0.5259394, 1, 0.3294118, 0, 1,
-1.614251, -0.09545255, -0.8448255, 1, 0.3372549, 0, 1,
-1.607152, 1.093109, -1.412606, 1, 0.3411765, 0, 1,
-1.606511, 0.7341856, -0.9186934, 1, 0.3490196, 0, 1,
-1.582992, -0.2082458, -3.099786, 1, 0.3529412, 0, 1,
-1.582446, 1.607597, -2.061817, 1, 0.3607843, 0, 1,
-1.579284, -1.056188, -1.812234, 1, 0.3647059, 0, 1,
-1.546243, 1.27275, -0.60152, 1, 0.372549, 0, 1,
-1.541347, -0.6597404, -0.9330508, 1, 0.3764706, 0, 1,
-1.518556, -1.446334, -3.427283, 1, 0.3843137, 0, 1,
-1.504635, -0.2171631, -2.367069, 1, 0.3882353, 0, 1,
-1.504247, 1.113003, -0.07087103, 1, 0.3960784, 0, 1,
-1.49832, 0.7033048, 0.1161427, 1, 0.4039216, 0, 1,
-1.492654, -0.1410642, -0.672942, 1, 0.4078431, 0, 1,
-1.459593, 0.2110206, -1.903625, 1, 0.4156863, 0, 1,
-1.457521, 0.1061499, -1.119262, 1, 0.4196078, 0, 1,
-1.447711, 0.3550133, 0.03427961, 1, 0.427451, 0, 1,
-1.439425, -0.1352391, 0.0002220253, 1, 0.4313726, 0, 1,
-1.436474, 0.5621675, -1.087904, 1, 0.4392157, 0, 1,
-1.427403, -2.011492, -1.366376, 1, 0.4431373, 0, 1,
-1.40578, -1.613015, -2.640919, 1, 0.4509804, 0, 1,
-1.390149, 1.293898, -0.2235914, 1, 0.454902, 0, 1,
-1.389868, 0.6305722, 1.34139, 1, 0.4627451, 0, 1,
-1.389791, 0.6386975, -1.11627, 1, 0.4666667, 0, 1,
-1.387437, -0.5029894, -2.990798, 1, 0.4745098, 0, 1,
-1.377318, 0.8395148, -1.475538, 1, 0.4784314, 0, 1,
-1.374548, 0.6122684, 1.500924, 1, 0.4862745, 0, 1,
-1.37391, 0.7235787, -0.8899421, 1, 0.4901961, 0, 1,
-1.361905, 1.471815, 0.8370701, 1, 0.4980392, 0, 1,
-1.361514, -1.486637, -2.850876, 1, 0.5058824, 0, 1,
-1.359867, 0.6330862, -1.569418, 1, 0.509804, 0, 1,
-1.356388, -1.514878, -2.148594, 1, 0.5176471, 0, 1,
-1.344386, 0.1772675, -0.9676593, 1, 0.5215687, 0, 1,
-1.331223, -0.9015518, -0.3699015, 1, 0.5294118, 0, 1,
-1.320105, -0.9740114, -2.337271, 1, 0.5333334, 0, 1,
-1.318895, 1.725255, -2.389888, 1, 0.5411765, 0, 1,
-1.317469, 1.498502, -0.4626208, 1, 0.5450981, 0, 1,
-1.309891, -0.3576272, -2.986823, 1, 0.5529412, 0, 1,
-1.308154, 0.6547723, 0.06537037, 1, 0.5568628, 0, 1,
-1.280854, -0.6654567, -0.7243242, 1, 0.5647059, 0, 1,
-1.280292, 0.3573419, -1.260137, 1, 0.5686275, 0, 1,
-1.277401, -0.6216074, -2.635362, 1, 0.5764706, 0, 1,
-1.277037, -1.0106, -4.115, 1, 0.5803922, 0, 1,
-1.262629, 0.5713577, 0.9857005, 1, 0.5882353, 0, 1,
-1.258056, -0.6131243, -0.3489308, 1, 0.5921569, 0, 1,
-1.253921, -1.226868, -2.095474, 1, 0.6, 0, 1,
-1.252191, -0.9012435, -1.089073, 1, 0.6078432, 0, 1,
-1.250682, -0.1929491, -0.7189604, 1, 0.6117647, 0, 1,
-1.249816, 1.094034, -1.798777, 1, 0.6196079, 0, 1,
-1.242892, 0.9490777, 0.811308, 1, 0.6235294, 0, 1,
-1.239237, 2.154398, -0.3860168, 1, 0.6313726, 0, 1,
-1.230576, 1.120607, -1.861011, 1, 0.6352941, 0, 1,
-1.229457, -1.36174, -1.557681, 1, 0.6431373, 0, 1,
-1.22462, -1.232962, -0.7059532, 1, 0.6470588, 0, 1,
-1.210343, 0.1082192, -2.125804, 1, 0.654902, 0, 1,
-1.199656, 1.38281, -1.296934, 1, 0.6588235, 0, 1,
-1.189821, 0.4440131, -0.02153456, 1, 0.6666667, 0, 1,
-1.185875, 0.3774853, -1.774026, 1, 0.6705883, 0, 1,
-1.1776, -1.826357, -3.284374, 1, 0.6784314, 0, 1,
-1.177508, -0.1292776, -1.129634, 1, 0.682353, 0, 1,
-1.175128, -1.542607, -2.446986, 1, 0.6901961, 0, 1,
-1.168607, 1.426984, -0.4292606, 1, 0.6941177, 0, 1,
-1.161845, 0.6781604, -0.5553414, 1, 0.7019608, 0, 1,
-1.15753, -1.093335, -2.161785, 1, 0.7098039, 0, 1,
-1.139751, 0.2872546, -0.139959, 1, 0.7137255, 0, 1,
-1.135164, 0.6301679, -0.69571, 1, 0.7215686, 0, 1,
-1.129313, -1.581498, -2.366149, 1, 0.7254902, 0, 1,
-1.116996, -0.019311, 0.08698542, 1, 0.7333333, 0, 1,
-1.11553, 0.2922778, -1.577585, 1, 0.7372549, 0, 1,
-1.112202, 1.465015, -0.05868223, 1, 0.7450981, 0, 1,
-1.10579, -0.1809029, -1.744357, 1, 0.7490196, 0, 1,
-1.104522, -0.4292094, -2.262635, 1, 0.7568628, 0, 1,
-1.103134, 0.1540773, -1.092431, 1, 0.7607843, 0, 1,
-1.096612, -1.551641, -1.623094, 1, 0.7686275, 0, 1,
-1.092057, 0.1943996, -1.716008, 1, 0.772549, 0, 1,
-1.08999, -1.353808, -3.17778, 1, 0.7803922, 0, 1,
-1.088435, -2.213343, -2.664601, 1, 0.7843137, 0, 1,
-1.078463, 0.3153571, -0.5373508, 1, 0.7921569, 0, 1,
-1.071596, -1.411224, -2.545437, 1, 0.7960784, 0, 1,
-1.059955, -0.7102118, -0.7872632, 1, 0.8039216, 0, 1,
-1.05605, 0.6075518, 0.15955, 1, 0.8117647, 0, 1,
-1.055986, 1.090392, -0.1574166, 1, 0.8156863, 0, 1,
-1.049635, 0.4308506, -0.4328331, 1, 0.8235294, 0, 1,
-1.047323, -0.3726802, -2.492848, 1, 0.827451, 0, 1,
-1.046062, -0.7165549, -2.751899, 1, 0.8352941, 0, 1,
-1.04343, -2.469655, -1.613125, 1, 0.8392157, 0, 1,
-1.04296, 0.3456259, -1.239748, 1, 0.8470588, 0, 1,
-1.042365, 0.8005282, -0.2922808, 1, 0.8509804, 0, 1,
-1.037973, -1.069463, -2.050176, 1, 0.8588235, 0, 1,
-1.034965, 0.5791883, -0.9136497, 1, 0.8627451, 0, 1,
-1.028762, 0.8744041, 0.3229312, 1, 0.8705882, 0, 1,
-1.027871, -0.4507796, -2.412334, 1, 0.8745098, 0, 1,
-1.027436, -0.6369305, -2.829209, 1, 0.8823529, 0, 1,
-1.026814, -0.8444082, -3.342021, 1, 0.8862745, 0, 1,
-1.011011, 0.6918202, -1.001637, 1, 0.8941177, 0, 1,
-0.9969496, 0.02223011, -0.5053322, 1, 0.8980392, 0, 1,
-0.9957115, -0.3951531, -1.261342, 1, 0.9058824, 0, 1,
-0.9902273, 1.350934, -1.763168, 1, 0.9137255, 0, 1,
-0.9900977, -0.951789, -2.271511, 1, 0.9176471, 0, 1,
-0.9892454, -1.039763, -2.963373, 1, 0.9254902, 0, 1,
-0.9890848, -0.3914236, -3.123427, 1, 0.9294118, 0, 1,
-0.9868006, 1.174924, -1.277738, 1, 0.9372549, 0, 1,
-0.9840409, -0.08173791, -3.445527, 1, 0.9411765, 0, 1,
-0.9834654, 0.9176913, -0.6347361, 1, 0.9490196, 0, 1,
-0.9814862, 1.072876, -1.205643, 1, 0.9529412, 0, 1,
-0.976459, -0.1250079, -1.430679, 1, 0.9607843, 0, 1,
-0.9721942, 0.2863151, -1.82155, 1, 0.9647059, 0, 1,
-0.9697473, 0.8281463, -1.657725, 1, 0.972549, 0, 1,
-0.9656017, 0.3001319, -0.9310918, 1, 0.9764706, 0, 1,
-0.9642254, 1.08446, 1.118088, 1, 0.9843137, 0, 1,
-0.9617362, 1.151036, -1.366504, 1, 0.9882353, 0, 1,
-0.9576781, 0.7658228, -0.8442516, 1, 0.9960784, 0, 1,
-0.9559721, -0.8559759, -1.092306, 0.9960784, 1, 0, 1,
-0.9531943, 0.8962021, -2.195837, 0.9921569, 1, 0, 1,
-0.9357035, -1.118679, 0.4229127, 0.9843137, 1, 0, 1,
-0.9305952, 0.4691571, -0.4969632, 0.9803922, 1, 0, 1,
-0.9291009, 0.2877028, -1.836881, 0.972549, 1, 0, 1,
-0.9277528, 0.6889448, -0.9969569, 0.9686275, 1, 0, 1,
-0.9157573, -0.9104166, -1.461846, 0.9607843, 1, 0, 1,
-0.9013361, 0.8297298, -2.403687, 0.9568627, 1, 0, 1,
-0.8980029, -1.094506, -2.81559, 0.9490196, 1, 0, 1,
-0.8960047, -0.4481947, -4.255428, 0.945098, 1, 0, 1,
-0.8891062, 1.083999, 0.4250447, 0.9372549, 1, 0, 1,
-0.8861219, -0.6321625, -3.190938, 0.9333333, 1, 0, 1,
-0.8843147, 0.1666724, -2.269761, 0.9254902, 1, 0, 1,
-0.8816687, -0.9171928, -0.9382033, 0.9215686, 1, 0, 1,
-0.8761992, 0.08338805, -1.292031, 0.9137255, 1, 0, 1,
-0.8730699, -0.3017893, -0.365837, 0.9098039, 1, 0, 1,
-0.8715601, 0.1436731, -1.411923, 0.9019608, 1, 0, 1,
-0.8710784, 0.69322, -0.874401, 0.8941177, 1, 0, 1,
-0.8671747, -2.476188, -3.778415, 0.8901961, 1, 0, 1,
-0.8609174, 0.2095962, -1.542855, 0.8823529, 1, 0, 1,
-0.858083, -0.5301382, -1.094478, 0.8784314, 1, 0, 1,
-0.8537316, -0.7859718, -1.380956, 0.8705882, 1, 0, 1,
-0.8516847, 1.668129, -0.2562161, 0.8666667, 1, 0, 1,
-0.8482706, -1.075046, -0.4937474, 0.8588235, 1, 0, 1,
-0.8396374, -1.466859, -3.422503, 0.854902, 1, 0, 1,
-0.8365119, 0.9184844, -2.149548, 0.8470588, 1, 0, 1,
-0.8319297, 0.7452428, -0.9309886, 0.8431373, 1, 0, 1,
-0.8307137, 0.2190963, -1.280484, 0.8352941, 1, 0, 1,
-0.8283944, -0.6760138, -3.341538, 0.8313726, 1, 0, 1,
-0.8280684, 1.606859, -2.720176, 0.8235294, 1, 0, 1,
-0.8258428, -0.1551433, -1.378276, 0.8196079, 1, 0, 1,
-0.8227018, -1.583787, -0.7407228, 0.8117647, 1, 0, 1,
-0.8150889, 0.09491326, -1.821383, 0.8078431, 1, 0, 1,
-0.8107473, -0.4890628, -0.0233523, 0.8, 1, 0, 1,
-0.8106709, -1.618825, -1.53548, 0.7921569, 1, 0, 1,
-0.7995101, 0.02138531, -3.208223, 0.7882353, 1, 0, 1,
-0.7955032, -0.9728124, -2.952258, 0.7803922, 1, 0, 1,
-0.7896658, -0.7907534, -3.145283, 0.7764706, 1, 0, 1,
-0.7829, 1.0357, -0.5462303, 0.7686275, 1, 0, 1,
-0.7806844, 0.1296156, -1.785784, 0.7647059, 1, 0, 1,
-0.7794667, -0.6517041, -1.721049, 0.7568628, 1, 0, 1,
-0.7721483, 0.6615877, -0.7374319, 0.7529412, 1, 0, 1,
-0.7686068, -0.9706606, -1.908681, 0.7450981, 1, 0, 1,
-0.7599729, 1.882774, 0.3796527, 0.7411765, 1, 0, 1,
-0.7598627, 0.1299015, -0.9763835, 0.7333333, 1, 0, 1,
-0.7592359, -2.626822, -2.683164, 0.7294118, 1, 0, 1,
-0.7566326, -0.5283656, -1.718997, 0.7215686, 1, 0, 1,
-0.7534949, 2.632773, -1.150498, 0.7176471, 1, 0, 1,
-0.7513611, 0.2678026, -2.259589, 0.7098039, 1, 0, 1,
-0.7502934, 1.056558, -1.992057, 0.7058824, 1, 0, 1,
-0.7499571, -1.943739, -0.579923, 0.6980392, 1, 0, 1,
-0.7492862, -1.742107, -2.985985, 0.6901961, 1, 0, 1,
-0.7491484, -0.7315218, -2.311791, 0.6862745, 1, 0, 1,
-0.7460526, 0.02146576, -0.7031874, 0.6784314, 1, 0, 1,
-0.7421992, -0.1890626, -0.4558789, 0.6745098, 1, 0, 1,
-0.7403479, -1.097679, -2.713351, 0.6666667, 1, 0, 1,
-0.7363861, -1.264234, -1.337935, 0.6627451, 1, 0, 1,
-0.7295787, 0.3779978, -0.9238071, 0.654902, 1, 0, 1,
-0.7279189, 1.327882, -1.959425, 0.6509804, 1, 0, 1,
-0.7208222, 0.4737317, -0.8255677, 0.6431373, 1, 0, 1,
-0.7132756, -0.08408929, -0.6806032, 0.6392157, 1, 0, 1,
-0.7116488, -1.972473, -2.564352, 0.6313726, 1, 0, 1,
-0.7102407, -0.1322785, -1.369, 0.627451, 1, 0, 1,
-0.7069126, -1.480686, -6.306202, 0.6196079, 1, 0, 1,
-0.7067283, 0.4570585, -1.782302, 0.6156863, 1, 0, 1,
-0.7056804, -0.1411168, -3.644646, 0.6078432, 1, 0, 1,
-0.700005, 2.266624, -0.7773233, 0.6039216, 1, 0, 1,
-0.6959257, -1.42479, -1.050415, 0.5960785, 1, 0, 1,
-0.6906819, -1.295416, -3.05496, 0.5882353, 1, 0, 1,
-0.6888513, -1.207223, -1.117473, 0.5843138, 1, 0, 1,
-0.685285, 0.145193, 0.04996936, 0.5764706, 1, 0, 1,
-0.6811157, -0.1984975, -1.424785, 0.572549, 1, 0, 1,
-0.6809062, -2.190776, -2.149757, 0.5647059, 1, 0, 1,
-0.6797165, -0.223425, -2.181385, 0.5607843, 1, 0, 1,
-0.6776562, -0.8123281, -2.670323, 0.5529412, 1, 0, 1,
-0.6690546, -0.7681904, -1.173442, 0.5490196, 1, 0, 1,
-0.6639737, -0.4558274, -2.036632, 0.5411765, 1, 0, 1,
-0.662011, 0.2910867, -0.08985135, 0.5372549, 1, 0, 1,
-0.6613677, 0.2832882, -0.8721536, 0.5294118, 1, 0, 1,
-0.6582882, -0.7401547, -1.689873, 0.5254902, 1, 0, 1,
-0.6572509, -0.1795201, -0.1768676, 0.5176471, 1, 0, 1,
-0.6566756, 0.3886148, -1.464604, 0.5137255, 1, 0, 1,
-0.6560435, -0.9046389, -1.648653, 0.5058824, 1, 0, 1,
-0.655288, -1.030548, -3.430284, 0.5019608, 1, 0, 1,
-0.6533253, 0.4597116, -2.233369, 0.4941176, 1, 0, 1,
-0.6503435, 1.735872, -1.096982, 0.4862745, 1, 0, 1,
-0.6483583, 0.2610111, -0.8539041, 0.4823529, 1, 0, 1,
-0.6475226, -1.588192, -3.110729, 0.4745098, 1, 0, 1,
-0.6474056, -2.015949, -3.590314, 0.4705882, 1, 0, 1,
-0.6372824, -1.047105, -2.197998, 0.4627451, 1, 0, 1,
-0.6357471, 0.03930306, -0.9656014, 0.4588235, 1, 0, 1,
-0.6291949, -2.693721, -2.479332, 0.4509804, 1, 0, 1,
-0.6216075, 1.003204, 0.03668226, 0.4470588, 1, 0, 1,
-0.6185905, 0.5217543, -0.1957683, 0.4392157, 1, 0, 1,
-0.617711, -0.3838955, -1.500424, 0.4352941, 1, 0, 1,
-0.6157769, -1.795102, -2.105602, 0.427451, 1, 0, 1,
-0.6092728, -2.122284, -3.729782, 0.4235294, 1, 0, 1,
-0.6053981, 1.715437, -0.8999834, 0.4156863, 1, 0, 1,
-0.6052023, 0.8865066, -1.046038, 0.4117647, 1, 0, 1,
-0.6005965, 1.411294, 0.0277551, 0.4039216, 1, 0, 1,
-0.5993801, -1.915451, -2.428928, 0.3960784, 1, 0, 1,
-0.5970746, 0.2740858, -0.7904538, 0.3921569, 1, 0, 1,
-0.5945376, 0.3511165, -1.472167, 0.3843137, 1, 0, 1,
-0.5689229, -1.260635, -2.41928, 0.3803922, 1, 0, 1,
-0.5675922, 1.528935, 0.9632797, 0.372549, 1, 0, 1,
-0.5611205, 0.1072894, -2.253913, 0.3686275, 1, 0, 1,
-0.557779, 0.5481781, -0.8655568, 0.3607843, 1, 0, 1,
-0.5560885, 0.1880006, -2.104484, 0.3568628, 1, 0, 1,
-0.5546477, -0.5537785, -3.495684, 0.3490196, 1, 0, 1,
-0.5490886, 0.1111785, -1.119968, 0.345098, 1, 0, 1,
-0.5484987, 0.6405821, -1.20714, 0.3372549, 1, 0, 1,
-0.5462454, 0.2713768, -2.175246, 0.3333333, 1, 0, 1,
-0.544424, 1.198119, 2.45732, 0.3254902, 1, 0, 1,
-0.543411, -0.5895285, -2.611057, 0.3215686, 1, 0, 1,
-0.5411931, -0.4199245, -1.283101, 0.3137255, 1, 0, 1,
-0.540843, 0.2790152, -2.195038, 0.3098039, 1, 0, 1,
-0.5387275, 1.488158, -0.256752, 0.3019608, 1, 0, 1,
-0.5359651, -1.41068, -2.676389, 0.2941177, 1, 0, 1,
-0.5354689, 0.457365, -1.485295, 0.2901961, 1, 0, 1,
-0.5265844, -0.6178412, -2.744222, 0.282353, 1, 0, 1,
-0.5258496, 0.5170157, -0.2640279, 0.2784314, 1, 0, 1,
-0.5243698, -0.3600476, -0.7780102, 0.2705882, 1, 0, 1,
-0.5239475, -0.2989745, -2.891967, 0.2666667, 1, 0, 1,
-0.5225675, -0.1118538, -1.246855, 0.2588235, 1, 0, 1,
-0.5202786, -2.335999, -3.980678, 0.254902, 1, 0, 1,
-0.5163919, -0.4301943, -2.875026, 0.2470588, 1, 0, 1,
-0.5126039, -1.901173, -0.7973719, 0.2431373, 1, 0, 1,
-0.5034266, 0.3544238, 0.8404822, 0.2352941, 1, 0, 1,
-0.5004896, -1.785716, -2.483132, 0.2313726, 1, 0, 1,
-0.500163, -0.8170157, -3.864186, 0.2235294, 1, 0, 1,
-0.4967875, 0.8683205, 0.1882932, 0.2196078, 1, 0, 1,
-0.4943824, 0.2554684, -2.465404, 0.2117647, 1, 0, 1,
-0.4871963, 1.127731, -0.9493998, 0.2078431, 1, 0, 1,
-0.4851859, -0.8560475, -2.378241, 0.2, 1, 0, 1,
-0.4846688, -0.2837324, -3.427125, 0.1921569, 1, 0, 1,
-0.4845271, -0.5285741, -1.834632, 0.1882353, 1, 0, 1,
-0.4833841, -0.4963801, -2.718683, 0.1803922, 1, 0, 1,
-0.4826189, 1.671884, 0.5126556, 0.1764706, 1, 0, 1,
-0.4820875, -0.729961, -1.515552, 0.1686275, 1, 0, 1,
-0.4781763, -0.07552547, -1.507412, 0.1647059, 1, 0, 1,
-0.4775461, -0.8347961, -0.9218292, 0.1568628, 1, 0, 1,
-0.476497, 0.0165317, -0.05124604, 0.1529412, 1, 0, 1,
-0.4735444, -1.257069, -4.123083, 0.145098, 1, 0, 1,
-0.4716094, 0.05807548, -2.290287, 0.1411765, 1, 0, 1,
-0.4667891, 1.802394, 0.1882867, 0.1333333, 1, 0, 1,
-0.4657417, 0.7515996, -0.7569673, 0.1294118, 1, 0, 1,
-0.461645, 0.5097019, -0.6298966, 0.1215686, 1, 0, 1,
-0.4547913, 0.8263324, -1.097314, 0.1176471, 1, 0, 1,
-0.4543009, -0.5906767, -1.366626, 0.1098039, 1, 0, 1,
-0.4538751, -3.549607, -3.705947, 0.1058824, 1, 0, 1,
-0.4527875, -0.5105376, -2.175648, 0.09803922, 1, 0, 1,
-0.4513968, -0.7368997, -4.309951, 0.09019608, 1, 0, 1,
-0.4510176, 1.031716, 0.1074494, 0.08627451, 1, 0, 1,
-0.4500217, 0.01563013, -1.56289, 0.07843138, 1, 0, 1,
-0.4499676, 0.3118009, -0.2879227, 0.07450981, 1, 0, 1,
-0.4490325, 0.655849, -0.4573423, 0.06666667, 1, 0, 1,
-0.445675, -0.4704611, -2.829528, 0.0627451, 1, 0, 1,
-0.4453596, 1.380102, -0.3333309, 0.05490196, 1, 0, 1,
-0.4411161, -0.2662665, -1.253721, 0.05098039, 1, 0, 1,
-0.4401233, 1.573079, -0.3142567, 0.04313726, 1, 0, 1,
-0.432331, 0.8346211, -1.003896, 0.03921569, 1, 0, 1,
-0.4323056, 0.2364634, -0.6212451, 0.03137255, 1, 0, 1,
-0.4263429, 1.422374, -0.2657332, 0.02745098, 1, 0, 1,
-0.4239006, 1.287342, -1.324447, 0.01960784, 1, 0, 1,
-0.4220433, 0.8994486, -0.7584521, 0.01568628, 1, 0, 1,
-0.4214859, -0.6806489, -5.294042, 0.007843138, 1, 0, 1,
-0.4121579, -0.4139283, -1.529092, 0.003921569, 1, 0, 1,
-0.4114123, -0.4796957, -1.787917, 0, 1, 0.003921569, 1,
-0.409754, 1.350365, -1.49121, 0, 1, 0.01176471, 1,
-0.4091421, -0.7634178, -1.278292, 0, 1, 0.01568628, 1,
-0.4084575, -0.09205684, -1.026369, 0, 1, 0.02352941, 1,
-0.406515, -0.1403252, -1.759505, 0, 1, 0.02745098, 1,
-0.4030689, -0.4169419, -2.160622, 0, 1, 0.03529412, 1,
-0.4019426, -0.1396372, -1.725489, 0, 1, 0.03921569, 1,
-0.3986585, 0.5458099, -0.3120511, 0, 1, 0.04705882, 1,
-0.3985892, 1.895799, 1.030706, 0, 1, 0.05098039, 1,
-0.3921627, 0.4633621, -1.074314, 0, 1, 0.05882353, 1,
-0.3752573, 0.205977, -3.163036, 0, 1, 0.0627451, 1,
-0.3584259, -0.1127849, -3.001818, 0, 1, 0.07058824, 1,
-0.3538298, -1.547783, -3.736787, 0, 1, 0.07450981, 1,
-0.3528916, -1.120113, -3.745493, 0, 1, 0.08235294, 1,
-0.3522417, -0.2369654, -1.570085, 0, 1, 0.08627451, 1,
-0.3487342, -0.6491794, -4.1869, 0, 1, 0.09411765, 1,
-0.3458739, 1.066612, -0.06508791, 0, 1, 0.1019608, 1,
-0.3410033, 1.117821, 0.6582401, 0, 1, 0.1058824, 1,
-0.3404732, -0.6764741, -2.723523, 0, 1, 0.1137255, 1,
-0.340467, -0.08981911, -0.3493957, 0, 1, 0.1176471, 1,
-0.3359095, 1.242547, 0.6453865, 0, 1, 0.1254902, 1,
-0.3345577, -0.3733479, -0.9641616, 0, 1, 0.1294118, 1,
-0.3343162, 0.5914959, -1.589518, 0, 1, 0.1372549, 1,
-0.3287406, 1.638631, -1.146857, 0, 1, 0.1411765, 1,
-0.3278787, -0.3178852, -3.064445, 0, 1, 0.1490196, 1,
-0.3246904, -0.262426, -1.076872, 0, 1, 0.1529412, 1,
-0.3225029, 0.2630019, 0.3254191, 0, 1, 0.1607843, 1,
-0.319246, 0.1005086, -2.789691, 0, 1, 0.1647059, 1,
-0.3178126, 0.7642673, -1.699645, 0, 1, 0.172549, 1,
-0.3172655, -0.7178937, -2.016062, 0, 1, 0.1764706, 1,
-0.315735, -0.481103, -2.991864, 0, 1, 0.1843137, 1,
-0.3155463, -0.3712011, -2.9981, 0, 1, 0.1882353, 1,
-0.3155187, 0.4957175, -1.882699, 0, 1, 0.1960784, 1,
-0.3131904, 0.1615926, -2.010896, 0, 1, 0.2039216, 1,
-0.3130821, 1.189459, -0.7621688, 0, 1, 0.2078431, 1,
-0.3096288, 1.492329, -0.8124029, 0, 1, 0.2156863, 1,
-0.3085521, -0.09411617, -0.4369653, 0, 1, 0.2196078, 1,
-0.3073308, -1.1265, -4.278553, 0, 1, 0.227451, 1,
-0.3050567, -1.726929, -3.506392, 0, 1, 0.2313726, 1,
-0.3046041, 0.3215683, -0.5774336, 0, 1, 0.2392157, 1,
-0.2969776, -0.8967565, -1.583849, 0, 1, 0.2431373, 1,
-0.2960037, 1.713395, 1.851962, 0, 1, 0.2509804, 1,
-0.2956995, -0.3511297, -2.788258, 0, 1, 0.254902, 1,
-0.2946591, -0.17634, -1.380469, 0, 1, 0.2627451, 1,
-0.2938457, 1.70013, -0.198198, 0, 1, 0.2666667, 1,
-0.2911093, 0.6527076, 0.3153147, 0, 1, 0.2745098, 1,
-0.2900866, 0.2684529, -1.320631, 0, 1, 0.2784314, 1,
-0.2889057, 1.919894, 0.2233718, 0, 1, 0.2862745, 1,
-0.2879655, 0.1465292, -1.027774, 0, 1, 0.2901961, 1,
-0.287035, 1.643173, 0.2856128, 0, 1, 0.2980392, 1,
-0.2857381, -0.5072881, -3.25116, 0, 1, 0.3058824, 1,
-0.2737536, 0.05571654, -0.8288009, 0, 1, 0.3098039, 1,
-0.2731818, 0.3985324, -0.2426843, 0, 1, 0.3176471, 1,
-0.2690752, -0.5282063, -3.146997, 0, 1, 0.3215686, 1,
-0.2677822, 0.09256408, -2.143794, 0, 1, 0.3294118, 1,
-0.260677, -0.1589432, -2.756095, 0, 1, 0.3333333, 1,
-0.2605112, 1.183851, -0.114432, 0, 1, 0.3411765, 1,
-0.259344, -1.820206, -3.880835, 0, 1, 0.345098, 1,
-0.259166, 0.2960063, -0.3675815, 0, 1, 0.3529412, 1,
-0.2532881, 2.013967, -0.7483961, 0, 1, 0.3568628, 1,
-0.2529745, -1.299288, -4.206383, 0, 1, 0.3647059, 1,
-0.2516851, -0.4544492, -3.678558, 0, 1, 0.3686275, 1,
-0.2488048, -2.656999, -2.887858, 0, 1, 0.3764706, 1,
-0.2479262, 1.947525, -2.141194, 0, 1, 0.3803922, 1,
-0.2473915, -0.8533469, -3.346492, 0, 1, 0.3882353, 1,
-0.2466396, 0.1665331, -0.160205, 0, 1, 0.3921569, 1,
-0.2451296, 0.6010557, -0.4805833, 0, 1, 0.4, 1,
-0.2434716, -0.6457674, -2.762614, 0, 1, 0.4078431, 1,
-0.2425995, -0.6862684, -2.835521, 0, 1, 0.4117647, 1,
-0.2419656, 0.4510359, 0.557111, 0, 1, 0.4196078, 1,
-0.2415439, 0.3975191, -0.1973895, 0, 1, 0.4235294, 1,
-0.2400763, -0.6380154, -2.339942, 0, 1, 0.4313726, 1,
-0.2392548, -0.6492075, -1.937224, 0, 1, 0.4352941, 1,
-0.2326114, -0.8125335, -4.280973, 0, 1, 0.4431373, 1,
-0.2302878, 0.9777614, -2.558913, 0, 1, 0.4470588, 1,
-0.2266307, -1.182326, -2.803868, 0, 1, 0.454902, 1,
-0.2262793, 0.1549448, -2.683234, 0, 1, 0.4588235, 1,
-0.2210436, 0.5336413, -0.7274356, 0, 1, 0.4666667, 1,
-0.2195643, -0.4021938, -2.314914, 0, 1, 0.4705882, 1,
-0.2194999, -0.5768226, -2.434165, 0, 1, 0.4784314, 1,
-0.2154631, -0.4766167, -2.111035, 0, 1, 0.4823529, 1,
-0.2145732, -0.8349859, -2.542617, 0, 1, 0.4901961, 1,
-0.2126898, -1.56985, -4.500964, 0, 1, 0.4941176, 1,
-0.2119021, 0.1920085, 0.1669895, 0, 1, 0.5019608, 1,
-0.2110381, -0.7216346, -3.948511, 0, 1, 0.509804, 1,
-0.2109866, 1.43996, 0.2075464, 0, 1, 0.5137255, 1,
-0.2069379, 1.303464, 0.02211513, 0, 1, 0.5215687, 1,
-0.2068646, -0.2266919, -4.840093, 0, 1, 0.5254902, 1,
-0.1995356, -0.4001918, -2.618107, 0, 1, 0.5333334, 1,
-0.1962129, -0.7759963, -1.341195, 0, 1, 0.5372549, 1,
-0.1897672, -1.813164, -4.570058, 0, 1, 0.5450981, 1,
-0.1860317, 0.6105875, -1.923592, 0, 1, 0.5490196, 1,
-0.1806328, 1.028435, -0.2465724, 0, 1, 0.5568628, 1,
-0.1773664, 1.342645, -1.356308, 0, 1, 0.5607843, 1,
-0.177003, -0.3081822, -3.282668, 0, 1, 0.5686275, 1,
-0.1769365, 1.212842, -2.209091, 0, 1, 0.572549, 1,
-0.1764743, 0.8925402, 0.9217513, 0, 1, 0.5803922, 1,
-0.1736296, 1.255996, 1.320915, 0, 1, 0.5843138, 1,
-0.1715511, -0.656176, -3.178871, 0, 1, 0.5921569, 1,
-0.1708895, -0.5227647, -3.355809, 0, 1, 0.5960785, 1,
-0.1697879, 1.224129, 0.5167913, 0, 1, 0.6039216, 1,
-0.1679791, -1.092427, 0.8568195, 0, 1, 0.6117647, 1,
-0.155617, 0.2052392, -0.975746, 0, 1, 0.6156863, 1,
-0.1539789, -0.8210251, -1.703278, 0, 1, 0.6235294, 1,
-0.1537963, -1.056306, -3.035338, 0, 1, 0.627451, 1,
-0.1522486, 0.3977154, -1.702662, 0, 1, 0.6352941, 1,
-0.1510408, -1.976496, -4.982136, 0, 1, 0.6392157, 1,
-0.1491816, -1.047243, -3.371615, 0, 1, 0.6470588, 1,
-0.1480019, 0.7480626, -0.2156205, 0, 1, 0.6509804, 1,
-0.1477533, -0.7958499, -3.795904, 0, 1, 0.6588235, 1,
-0.1446765, -0.4420815, -2.436202, 0, 1, 0.6627451, 1,
-0.1411941, 0.794992, -0.1011713, 0, 1, 0.6705883, 1,
-0.1374419, 1.161639, -3.397331, 0, 1, 0.6745098, 1,
-0.135966, 0.1360464, -1.853284, 0, 1, 0.682353, 1,
-0.134222, -0.3512401, -2.876364, 0, 1, 0.6862745, 1,
-0.1325916, 1.050976, 0.9558532, 0, 1, 0.6941177, 1,
-0.1325445, -0.05531909, -3.487286, 0, 1, 0.7019608, 1,
-0.1310689, 0.4390045, -2.022115, 0, 1, 0.7058824, 1,
-0.1288169, 0.2250164, -0.08922842, 0, 1, 0.7137255, 1,
-0.1288035, -1.420277, -3.180728, 0, 1, 0.7176471, 1,
-0.1284867, -0.9615402, -2.166672, 0, 1, 0.7254902, 1,
-0.1257134, 1.237993, 0.4115879, 0, 1, 0.7294118, 1,
-0.124708, -0.2508066, -1.338621, 0, 1, 0.7372549, 1,
-0.124538, 0.5470017, -1.595037, 0, 1, 0.7411765, 1,
-0.1211936, -1.080651, -4.319104, 0, 1, 0.7490196, 1,
-0.1197712, 0.3999036, -0.9145212, 0, 1, 0.7529412, 1,
-0.1180413, -0.9620982, -3.350448, 0, 1, 0.7607843, 1,
-0.1160142, 1.655239, -1.99453, 0, 1, 0.7647059, 1,
-0.1105473, -0.848996, -1.277696, 0, 1, 0.772549, 1,
-0.1097688, -1.026863, -3.613072, 0, 1, 0.7764706, 1,
-0.1084768, -1.918931, -3.759815, 0, 1, 0.7843137, 1,
-0.1067526, 1.805321, 0.09696186, 0, 1, 0.7882353, 1,
-0.1064509, -0.009236605, -1.229469, 0, 1, 0.7960784, 1,
-0.10622, -2.573449, -2.60195, 0, 1, 0.8039216, 1,
-0.1049976, 0.2209545, 0.337414, 0, 1, 0.8078431, 1,
-0.1041526, 0.8399916, -1.324111, 0, 1, 0.8156863, 1,
-0.09736981, -0.8478438, -2.635682, 0, 1, 0.8196079, 1,
-0.09382402, -0.5958175, -3.718598, 0, 1, 0.827451, 1,
-0.09049536, 1.049957, -0.898917, 0, 1, 0.8313726, 1,
-0.08996083, -0.04419426, -2.272424, 0, 1, 0.8392157, 1,
-0.08678003, -0.6684662, -4.030889, 0, 1, 0.8431373, 1,
-0.08574968, 0.8667708, 1.061167, 0, 1, 0.8509804, 1,
-0.08507092, -0.6776191, -4.675388, 0, 1, 0.854902, 1,
-0.08431966, -1.22458, -2.199803, 0, 1, 0.8627451, 1,
-0.08063858, -0.8336387, -3.937398, 0, 1, 0.8666667, 1,
-0.07812072, -0.2438726, -0.6754283, 0, 1, 0.8745098, 1,
-0.07772896, 0.6071741, 0.3731893, 0, 1, 0.8784314, 1,
-0.077445, -0.5759338, -2.363173, 0, 1, 0.8862745, 1,
-0.07383093, 0.5418901, 0.4585656, 0, 1, 0.8901961, 1,
-0.07357208, -0.375255, -1.950226, 0, 1, 0.8980392, 1,
-0.07309641, 0.03834, 0.6524922, 0, 1, 0.9058824, 1,
-0.07268344, -1.248452, -2.023127, 0, 1, 0.9098039, 1,
-0.07256784, 1.912268, -0.8872398, 0, 1, 0.9176471, 1,
-0.0714126, 0.08271262, -1.424776, 0, 1, 0.9215686, 1,
-0.06876715, 0.4036463, -1.122575, 0, 1, 0.9294118, 1,
-0.06749801, -1.011386, -4.837292, 0, 1, 0.9333333, 1,
-0.06728235, 0.8834147, 0.099204, 0, 1, 0.9411765, 1,
-0.06725389, -1.163614, -4.460694, 0, 1, 0.945098, 1,
-0.06388451, 0.04276238, -1.804151, 0, 1, 0.9529412, 1,
-0.06340368, 1.747999, 1.074084, 0, 1, 0.9568627, 1,
-0.06207807, 1.079812, 0.4300945, 0, 1, 0.9647059, 1,
-0.05975689, -0.07279322, -2.857634, 0, 1, 0.9686275, 1,
-0.05871233, 0.0782856, 0.1343068, 0, 1, 0.9764706, 1,
-0.05620341, -0.1022179, -3.266899, 0, 1, 0.9803922, 1,
-0.05587116, 1.75284, 0.7998778, 0, 1, 0.9882353, 1,
-0.05272909, -0.6695632, -2.64318, 0, 1, 0.9921569, 1,
-0.05149784, 0.3383886, -1.855071, 0, 1, 1, 1,
-0.05034015, -0.8395073, -3.782823, 0, 0.9921569, 1, 1,
-0.04933314, 1.206976, -0.9692007, 0, 0.9882353, 1, 1,
-0.04803906, -1.043539, -4.216166, 0, 0.9803922, 1, 1,
-0.04796803, -0.08764732, -1.990518, 0, 0.9764706, 1, 1,
-0.0443788, -1.31004, -4.064807, 0, 0.9686275, 1, 1,
-0.03762754, 0.06998707, 0.01206748, 0, 0.9647059, 1, 1,
-0.03598043, -0.522862, -1.495564, 0, 0.9568627, 1, 1,
-0.03132531, -0.5433822, -2.974761, 0, 0.9529412, 1, 1,
-0.03131665, -0.6661191, -2.045282, 0, 0.945098, 1, 1,
-0.02934454, 0.3759903, 0.2505211, 0, 0.9411765, 1, 1,
-0.02634798, -0.1811191, -2.49106, 0, 0.9333333, 1, 1,
-0.01965594, 0.4565196, -0.9755262, 0, 0.9294118, 1, 1,
-0.01841198, -0.61801, -3.994606, 0, 0.9215686, 1, 1,
-0.01777217, -0.2127862, -3.453836, 0, 0.9176471, 1, 1,
-0.01501369, -1.557197, -1.999021, 0, 0.9098039, 1, 1,
-0.01419378, -0.03409296, -2.06274, 0, 0.9058824, 1, 1,
-0.01246656, 1.283847, -1.082735, 0, 0.8980392, 1, 1,
-0.009574841, 0.6523834, 1.262307, 0, 0.8901961, 1, 1,
-0.009268347, 0.4650034, 0.3776884, 0, 0.8862745, 1, 1,
-0.008769075, 1.584504, -0.6299108, 0, 0.8784314, 1, 1,
-0.008698441, 0.6961777, 0.4353043, 0, 0.8745098, 1, 1,
-0.001386251, -0.07017431, -2.955, 0, 0.8666667, 1, 1,
0.00396205, 0.07561337, -0.2680234, 0, 0.8627451, 1, 1,
0.005212809, -0.3275341, 3.806044, 0, 0.854902, 1, 1,
0.005747162, -0.3677308, 1.5108, 0, 0.8509804, 1, 1,
0.00808418, -0.1809908, 3.847971, 0, 0.8431373, 1, 1,
0.008841956, 0.06500869, -0.2315011, 0, 0.8392157, 1, 1,
0.008844694, -0.126386, 2.256211, 0, 0.8313726, 1, 1,
0.009717983, 1.490695, 0.5780447, 0, 0.827451, 1, 1,
0.01064409, 0.7338051, 0.3926619, 0, 0.8196079, 1, 1,
0.01163007, 1.31776, -0.6239909, 0, 0.8156863, 1, 1,
0.01328268, 0.1415077, 0.7602023, 0, 0.8078431, 1, 1,
0.01337545, -1.151059, 2.659673, 0, 0.8039216, 1, 1,
0.01367985, -0.0103732, 2.288454, 0, 0.7960784, 1, 1,
0.01684335, 0.08092616, 0.8028678, 0, 0.7882353, 1, 1,
0.01955399, -0.2715692, 1.578867, 0, 0.7843137, 1, 1,
0.02040547, -1.159389, 2.690855, 0, 0.7764706, 1, 1,
0.02263665, -0.212198, 3.380101, 0, 0.772549, 1, 1,
0.0269652, -0.7528884, 2.935383, 0, 0.7647059, 1, 1,
0.03315096, -0.3989077, 2.112539, 0, 0.7607843, 1, 1,
0.03442851, -0.8634123, 3.059644, 0, 0.7529412, 1, 1,
0.04003884, 1.038788, 1.163041, 0, 0.7490196, 1, 1,
0.04034476, -0.8850885, 5.193218, 0, 0.7411765, 1, 1,
0.04181056, -0.4968864, 2.735733, 0, 0.7372549, 1, 1,
0.04375502, 0.5334824, 0.5542166, 0, 0.7294118, 1, 1,
0.04395814, 0.4714587, -1.217686, 0, 0.7254902, 1, 1,
0.04681166, 0.2372314, -0.7848549, 0, 0.7176471, 1, 1,
0.05929152, -1.939685, 3.538107, 0, 0.7137255, 1, 1,
0.06417865, 0.6964965, 0.3499357, 0, 0.7058824, 1, 1,
0.06651115, -0.1993024, 1.460629, 0, 0.6980392, 1, 1,
0.06763426, -0.3022578, 4.640113, 0, 0.6941177, 1, 1,
0.06974689, -0.3203101, 3.435779, 0, 0.6862745, 1, 1,
0.07460934, -0.364162, 4.38523, 0, 0.682353, 1, 1,
0.07607468, 0.1142987, 1.370484, 0, 0.6745098, 1, 1,
0.07704774, 0.869328, 2.074155, 0, 0.6705883, 1, 1,
0.07714429, 1.00951, 1.516604, 0, 0.6627451, 1, 1,
0.09130963, -0.2767991, 3.885292, 0, 0.6588235, 1, 1,
0.09156306, 0.03790893, -0.09578252, 0, 0.6509804, 1, 1,
0.09440179, 0.8842868, 0.6638212, 0, 0.6470588, 1, 1,
0.09460999, 1.430113, -2.677621, 0, 0.6392157, 1, 1,
0.09484532, -0.3336582, 2.672834, 0, 0.6352941, 1, 1,
0.1010867, 0.09855876, 1.815724, 0, 0.627451, 1, 1,
0.1082387, -1.130961, 2.536362, 0, 0.6235294, 1, 1,
0.108625, 0.8503169, 0.8198752, 0, 0.6156863, 1, 1,
0.1101364, 1.417636, 0.1802308, 0, 0.6117647, 1, 1,
0.1103295, 1.08853, -0.6256386, 0, 0.6039216, 1, 1,
0.1117908, 0.09695426, 1.219221, 0, 0.5960785, 1, 1,
0.1122218, -1.40203, 2.964333, 0, 0.5921569, 1, 1,
0.1125436, 2.076715, -0.06093449, 0, 0.5843138, 1, 1,
0.1212639, 1.363027, -0.5318191, 0, 0.5803922, 1, 1,
0.1216241, 2.399858, -0.6233624, 0, 0.572549, 1, 1,
0.1235183, -0.829547, 3.420597, 0, 0.5686275, 1, 1,
0.1255102, 0.4354727, -0.6559058, 0, 0.5607843, 1, 1,
0.1255665, 0.1600608, -0.5011774, 0, 0.5568628, 1, 1,
0.1271621, 0.8626727, 1.321134, 0, 0.5490196, 1, 1,
0.1272331, 0.197528, 0.5506884, 0, 0.5450981, 1, 1,
0.1288004, -1.441101, 3.766854, 0, 0.5372549, 1, 1,
0.1291833, -1.168179, 3.497104, 0, 0.5333334, 1, 1,
0.1320649, -0.8199835, 2.1118, 0, 0.5254902, 1, 1,
0.133121, 1.494484, 0.01542716, 0, 0.5215687, 1, 1,
0.1336447, -0.9489442, 1.185435, 0, 0.5137255, 1, 1,
0.1418198, -1.477673, 3.451845, 0, 0.509804, 1, 1,
0.1557737, 0.4431643, 0.2466565, 0, 0.5019608, 1, 1,
0.1580144, 1.019679, 1.844425, 0, 0.4941176, 1, 1,
0.1622117, 0.4685166, 2.221946, 0, 0.4901961, 1, 1,
0.164213, 1.084462, -1.190892, 0, 0.4823529, 1, 1,
0.1789667, 0.1750489, 1.533627, 0, 0.4784314, 1, 1,
0.1832093, -0.05598911, 1.362011, 0, 0.4705882, 1, 1,
0.1841892, 0.5968716, -1.063407, 0, 0.4666667, 1, 1,
0.1902301, 0.5016744, 1.08519, 0, 0.4588235, 1, 1,
0.1905579, 0.2786378, 0.1973984, 0, 0.454902, 1, 1,
0.1916219, 1.297058, -0.4801609, 0, 0.4470588, 1, 1,
0.191993, 0.4573203, -0.4150995, 0, 0.4431373, 1, 1,
0.1919933, 0.9619746, -0.3718175, 0, 0.4352941, 1, 1,
0.193211, -0.8568312, 2.152425, 0, 0.4313726, 1, 1,
0.2009582, 0.0105519, 1.019054, 0, 0.4235294, 1, 1,
0.205521, -0.7660541, 1.750227, 0, 0.4196078, 1, 1,
0.2056057, -0.07885402, 1.812621, 0, 0.4117647, 1, 1,
0.2067671, -2.227831, 3.232278, 0, 0.4078431, 1, 1,
0.2090803, -0.1186252, 3.168117, 0, 0.4, 1, 1,
0.2112542, 1.630095, -0.3376265, 0, 0.3921569, 1, 1,
0.2133934, 0.3727784, 1.307428, 0, 0.3882353, 1, 1,
0.2146374, 0.7371433, -0.1941225, 0, 0.3803922, 1, 1,
0.2194666, -0.6962095, 3.714366, 0, 0.3764706, 1, 1,
0.2241535, 0.0678526, 0.9710993, 0, 0.3686275, 1, 1,
0.2243379, 0.009170962, 1.949488, 0, 0.3647059, 1, 1,
0.2247876, -0.008575151, 0.3107422, 0, 0.3568628, 1, 1,
0.2258549, 0.672238, 0.6868652, 0, 0.3529412, 1, 1,
0.2293551, -0.6751163, 3.491538, 0, 0.345098, 1, 1,
0.2310595, 1.415738, 1.765957, 0, 0.3411765, 1, 1,
0.2360854, 1.006676, 0.8551927, 0, 0.3333333, 1, 1,
0.239209, 1.159965, 0.1893761, 0, 0.3294118, 1, 1,
0.2406422, -1.632005, 3.24258, 0, 0.3215686, 1, 1,
0.2430596, 0.3588945, 2.049588, 0, 0.3176471, 1, 1,
0.2454818, 0.9119471, -0.9341404, 0, 0.3098039, 1, 1,
0.2457111, 0.8299944, -0.05926508, 0, 0.3058824, 1, 1,
0.2464065, -0.9648179, 4.012396, 0, 0.2980392, 1, 1,
0.2475329, 0.1899079, 0.8007146, 0, 0.2901961, 1, 1,
0.2482009, 0.2103458, 0.5664992, 0, 0.2862745, 1, 1,
0.2491156, 0.09299842, 1.575153, 0, 0.2784314, 1, 1,
0.2504135, -0.3887653, 2.085076, 0, 0.2745098, 1, 1,
0.2539077, -0.7066913, 1.369203, 0, 0.2666667, 1, 1,
0.2540411, 0.361687, 0.6268172, 0, 0.2627451, 1, 1,
0.2565557, -0.3583661, 3.326918, 0, 0.254902, 1, 1,
0.2606538, 0.3985022, 0.9807595, 0, 0.2509804, 1, 1,
0.264135, -0.7502314, 2.539861, 0, 0.2431373, 1, 1,
0.2644387, 1.057138, 0.3952734, 0, 0.2392157, 1, 1,
0.266138, 0.9416552, 0.1938166, 0, 0.2313726, 1, 1,
0.2663523, 0.8722565, -0.07404216, 0, 0.227451, 1, 1,
0.2675173, -0.6328135, 2.526326, 0, 0.2196078, 1, 1,
0.2691867, 0.5465656, 2.149673, 0, 0.2156863, 1, 1,
0.2728897, -0.02622564, 0.007339471, 0, 0.2078431, 1, 1,
0.2730899, 0.2365528, 1.749649, 0, 0.2039216, 1, 1,
0.2745162, 0.9428272, 1.228563, 0, 0.1960784, 1, 1,
0.2758171, 0.8204877, -0.2766419, 0, 0.1882353, 1, 1,
0.2763208, -2.014589, 4.864293, 0, 0.1843137, 1, 1,
0.2778554, -0.4589659, 3.225131, 0, 0.1764706, 1, 1,
0.2787921, -1.646278, 2.915228, 0, 0.172549, 1, 1,
0.2793422, -0.7696443, 1.978792, 0, 0.1647059, 1, 1,
0.2801161, 0.8149921, 0.8530691, 0, 0.1607843, 1, 1,
0.2807703, 0.8461069, 1.597477, 0, 0.1529412, 1, 1,
0.2812997, -0.1978322, 2.74055, 0, 0.1490196, 1, 1,
0.2829957, -0.5360705, 3.133959, 0, 0.1411765, 1, 1,
0.2904576, -0.1076899, 1.286836, 0, 0.1372549, 1, 1,
0.290794, 0.5586162, -0.09654722, 0, 0.1294118, 1, 1,
0.2921976, 0.6007986, 0.7316034, 0, 0.1254902, 1, 1,
0.2925196, -0.6931788, 1.858579, 0, 0.1176471, 1, 1,
0.2978219, 0.7215334, -0.1591102, 0, 0.1137255, 1, 1,
0.3051541, -0.8290257, 2.718801, 0, 0.1058824, 1, 1,
0.3084701, 1.197533, 0.6097645, 0, 0.09803922, 1, 1,
0.3093425, -0.5063348, 4.4911, 0, 0.09411765, 1, 1,
0.3101251, 0.2312365, 2.173262, 0, 0.08627451, 1, 1,
0.3120326, -0.7718995, 4.191393, 0, 0.08235294, 1, 1,
0.3128819, -0.5297325, 2.683733, 0, 0.07450981, 1, 1,
0.3133906, -0.3147667, 1.527609, 0, 0.07058824, 1, 1,
0.3152648, -1.337917, 4.495012, 0, 0.0627451, 1, 1,
0.3257633, -0.7284999, 2.592704, 0, 0.05882353, 1, 1,
0.3282829, 0.2592628, 1.376506, 0, 0.05098039, 1, 1,
0.3315189, 1.441242, -0.07206625, 0, 0.04705882, 1, 1,
0.339224, 1.436412, 2.005879, 0, 0.03921569, 1, 1,
0.3405378, -0.1033146, 1.125612, 0, 0.03529412, 1, 1,
0.3493212, 0.1159889, 1.95511, 0, 0.02745098, 1, 1,
0.3500374, -1.160197, 3.156828, 0, 0.02352941, 1, 1,
0.3503077, -1.49787, 3.950389, 0, 0.01568628, 1, 1,
0.3546549, -0.1337924, 0.7677826, 0, 0.01176471, 1, 1,
0.3627681, -0.1301598, 4.005478, 0, 0.003921569, 1, 1,
0.3666783, -0.05961074, 2.131515, 0.003921569, 0, 1, 1,
0.3710682, 0.9711118, 0.2858741, 0.007843138, 0, 1, 1,
0.3733697, -1.566674, 2.305156, 0.01568628, 0, 1, 1,
0.3736234, -0.7708417, 3.383675, 0.01960784, 0, 1, 1,
0.3822918, 0.349406, 2.290124, 0.02745098, 0, 1, 1,
0.3881313, -2.275453, 2.287886, 0.03137255, 0, 1, 1,
0.392391, 0.7092505, -1.544452, 0.03921569, 0, 1, 1,
0.3938071, 1.208158, 0.4184844, 0.04313726, 0, 1, 1,
0.3967752, 0.575592, 1.574775, 0.05098039, 0, 1, 1,
0.3998397, -0.4140013, 2.202528, 0.05490196, 0, 1, 1,
0.4015801, 0.3471479, 0.8778802, 0.0627451, 0, 1, 1,
0.4023032, -0.5609413, 3.691788, 0.06666667, 0, 1, 1,
0.4043224, -0.5459784, 2.14315, 0.07450981, 0, 1, 1,
0.4057151, 0.593332, -0.3120936, 0.07843138, 0, 1, 1,
0.4093995, -0.6923027, 5.211412, 0.08627451, 0, 1, 1,
0.4103586, -0.3428209, 2.851619, 0.09019608, 0, 1, 1,
0.411365, 0.8136458, -0.6921412, 0.09803922, 0, 1, 1,
0.4126088, -0.4298392, 3.382301, 0.1058824, 0, 1, 1,
0.4131501, 2.092754, 0.6595517, 0.1098039, 0, 1, 1,
0.4193595, -1.062265, 3.523758, 0.1176471, 0, 1, 1,
0.4206682, 0.2574203, -0.1317017, 0.1215686, 0, 1, 1,
0.4255569, -1.325723, 2.779712, 0.1294118, 0, 1, 1,
0.4265353, 0.337083, 2.16233, 0.1333333, 0, 1, 1,
0.4273531, -1.715834, 2.603956, 0.1411765, 0, 1, 1,
0.4281493, 0.6190047, 1.331964, 0.145098, 0, 1, 1,
0.4303242, 0.4580355, 2.524516, 0.1529412, 0, 1, 1,
0.4426538, -1.674537, 3.818767, 0.1568628, 0, 1, 1,
0.4432419, -1.047596, 3.456384, 0.1647059, 0, 1, 1,
0.4435324, 0.04259453, 2.342586, 0.1686275, 0, 1, 1,
0.4458542, -0.6284847, 1.532864, 0.1764706, 0, 1, 1,
0.4479046, 1.54644, -0.6906478, 0.1803922, 0, 1, 1,
0.4481339, 1.699818, 1.143899, 0.1882353, 0, 1, 1,
0.4499997, -0.6903908, 4.041296, 0.1921569, 0, 1, 1,
0.450772, 0.5668778, -0.5607567, 0.2, 0, 1, 1,
0.451371, 0.1136496, 1.092428, 0.2078431, 0, 1, 1,
0.4555913, 1.271074, -0.6716069, 0.2117647, 0, 1, 1,
0.4585855, -1.781329, -0.30466, 0.2196078, 0, 1, 1,
0.460389, 0.3091014, 1.780955, 0.2235294, 0, 1, 1,
0.4605508, -2.26018, 4.138489, 0.2313726, 0, 1, 1,
0.4687279, -0.7858121, 2.351563, 0.2352941, 0, 1, 1,
0.4762131, -0.4251817, 1.932955, 0.2431373, 0, 1, 1,
0.4790677, -0.1174549, 1.951681, 0.2470588, 0, 1, 1,
0.4865763, -0.8210279, 1.756555, 0.254902, 0, 1, 1,
0.4914724, -0.6736847, 2.401172, 0.2588235, 0, 1, 1,
0.4970048, 0.3504169, 1.299582, 0.2666667, 0, 1, 1,
0.5010374, -0.2551738, 3.400438, 0.2705882, 0, 1, 1,
0.5012708, 0.5065372, -0.3297972, 0.2784314, 0, 1, 1,
0.5021363, 0.007973637, 1.831171, 0.282353, 0, 1, 1,
0.5038978, -0.4714144, 2.430331, 0.2901961, 0, 1, 1,
0.503952, 0.07535409, 0.4453762, 0.2941177, 0, 1, 1,
0.5058651, 0.08150791, 1.942471, 0.3019608, 0, 1, 1,
0.5101531, 0.07532921, 0.9924392, 0.3098039, 0, 1, 1,
0.5105377, -0.8589308, 2.797642, 0.3137255, 0, 1, 1,
0.5135667, 0.2149754, 1.047286, 0.3215686, 0, 1, 1,
0.5139057, -0.358069, 0.5412102, 0.3254902, 0, 1, 1,
0.5141847, 0.4057358, 2.49053, 0.3333333, 0, 1, 1,
0.5182358, 0.4320858, 0.002045784, 0.3372549, 0, 1, 1,
0.5194952, -0.8562999, 1.830392, 0.345098, 0, 1, 1,
0.5214971, 0.6866131, 0.1141833, 0.3490196, 0, 1, 1,
0.5244683, -1.013967, 2.593926, 0.3568628, 0, 1, 1,
0.5256273, -0.239412, 3.492098, 0.3607843, 0, 1, 1,
0.5263281, -0.06269904, 1.775861, 0.3686275, 0, 1, 1,
0.5265429, -0.5211957, 3.734581, 0.372549, 0, 1, 1,
0.5277874, 0.640238, 0.6639254, 0.3803922, 0, 1, 1,
0.5286742, -0.5649367, 2.382824, 0.3843137, 0, 1, 1,
0.5289047, 0.8542037, -0.0009845125, 0.3921569, 0, 1, 1,
0.5353108, 0.1633326, 0.3245589, 0.3960784, 0, 1, 1,
0.5388518, 0.01885684, 2.586662, 0.4039216, 0, 1, 1,
0.5444862, -0.8191819, 2.325803, 0.4117647, 0, 1, 1,
0.5482515, -0.158777, 1.371701, 0.4156863, 0, 1, 1,
0.5484961, 0.6564372, 0.2391995, 0.4235294, 0, 1, 1,
0.5510444, -0.3644907, 1.814364, 0.427451, 0, 1, 1,
0.5547814, -1.172294, 4.143981, 0.4352941, 0, 1, 1,
0.5576956, 0.456758, 0.7875768, 0.4392157, 0, 1, 1,
0.5612725, 0.6022645, -0.4586077, 0.4470588, 0, 1, 1,
0.5648835, 0.06684957, 1.248583, 0.4509804, 0, 1, 1,
0.5667375, 0.9004036, 1.170474, 0.4588235, 0, 1, 1,
0.5686321, -0.2272094, 2.524411, 0.4627451, 0, 1, 1,
0.571124, -0.908505, 3.774925, 0.4705882, 0, 1, 1,
0.5719103, 2.094677, -0.4059014, 0.4745098, 0, 1, 1,
0.5730127, -0.1342314, 1.279114, 0.4823529, 0, 1, 1,
0.5758762, -2.184902, 2.518953, 0.4862745, 0, 1, 1,
0.5763184, 0.6797733, 1.445036, 0.4941176, 0, 1, 1,
0.5767925, 0.7529173, 0.2848478, 0.5019608, 0, 1, 1,
0.5782902, 1.416024, 2.51985, 0.5058824, 0, 1, 1,
0.5860847, 0.4440021, 1.132225, 0.5137255, 0, 1, 1,
0.5881095, -0.8611814, 1.300623, 0.5176471, 0, 1, 1,
0.590176, 0.6602865, 0.6058279, 0.5254902, 0, 1, 1,
0.5947962, 0.6747231, 0.5713271, 0.5294118, 0, 1, 1,
0.594821, -0.539224, 3.639198, 0.5372549, 0, 1, 1,
0.5959849, 0.4310755, -0.05125434, 0.5411765, 0, 1, 1,
0.5961277, 0.04912699, 1.828963, 0.5490196, 0, 1, 1,
0.5971702, -0.2043086, 1.956381, 0.5529412, 0, 1, 1,
0.5987526, 0.5527768, 1.057881, 0.5607843, 0, 1, 1,
0.6001491, 0.1752136, 0.3028447, 0.5647059, 0, 1, 1,
0.6025867, 0.4046939, -0.06517164, 0.572549, 0, 1, 1,
0.6061691, -0.4116152, 1.821189, 0.5764706, 0, 1, 1,
0.6090697, -0.8335632, 1.827029, 0.5843138, 0, 1, 1,
0.6151744, -0.02841042, 0.4031841, 0.5882353, 0, 1, 1,
0.6231821, -0.9627482, 3.944334, 0.5960785, 0, 1, 1,
0.629055, 1.357488, -0.3063979, 0.6039216, 0, 1, 1,
0.631996, -0.8600672, 3.078022, 0.6078432, 0, 1, 1,
0.6332479, -0.2108703, 3.835971, 0.6156863, 0, 1, 1,
0.6397405, 1.661316, -1.672496, 0.6196079, 0, 1, 1,
0.6440677, -0.878018, 4.04469, 0.627451, 0, 1, 1,
0.6449383, 0.4060488, 2.312987, 0.6313726, 0, 1, 1,
0.6483489, -1.221961, 1.452074, 0.6392157, 0, 1, 1,
0.6493034, -0.7053505, 2.719918, 0.6431373, 0, 1, 1,
0.6517579, -2.178982, 2.578207, 0.6509804, 0, 1, 1,
0.6535788, -0.9013721, 0.7570473, 0.654902, 0, 1, 1,
0.6551863, 1.576401, 2.594619, 0.6627451, 0, 1, 1,
0.6575781, -1.956924, 1.966806, 0.6666667, 0, 1, 1,
0.660458, -2.341968, 2.54811, 0.6745098, 0, 1, 1,
0.6620457, 1.272674, 2.4177, 0.6784314, 0, 1, 1,
0.6645769, -0.0117049, 0.4970316, 0.6862745, 0, 1, 1,
0.6646662, 0.791807, 1.977195, 0.6901961, 0, 1, 1,
0.66861, 0.03448603, 0.7911249, 0.6980392, 0, 1, 1,
0.6687478, 0.3387333, 1.551148, 0.7058824, 0, 1, 1,
0.6795775, 0.7814334, -1.452661, 0.7098039, 0, 1, 1,
0.6797576, 2.560814, 1.806311, 0.7176471, 0, 1, 1,
0.6888877, 1.767895, -0.496253, 0.7215686, 0, 1, 1,
0.6919353, 1.532399, 0.1130637, 0.7294118, 0, 1, 1,
0.7037349, -0.7888622, 3.153767, 0.7333333, 0, 1, 1,
0.7061815, -0.3582479, 1.785198, 0.7411765, 0, 1, 1,
0.7103984, -0.1549899, 1.778823, 0.7450981, 0, 1, 1,
0.7137366, -0.5285861, 1.199252, 0.7529412, 0, 1, 1,
0.7178741, -0.118572, 0.3151837, 0.7568628, 0, 1, 1,
0.7220736, 0.293079, 1.224528, 0.7647059, 0, 1, 1,
0.7245427, -1.041711, 1.110445, 0.7686275, 0, 1, 1,
0.7301522, -0.3172625, 0.576484, 0.7764706, 0, 1, 1,
0.7308927, 2.580784, 0.5807772, 0.7803922, 0, 1, 1,
0.7350517, -1.133826, 1.48273, 0.7882353, 0, 1, 1,
0.7401873, 0.4478021, 0.7360854, 0.7921569, 0, 1, 1,
0.7476059, 1.810239, 1.315344, 0.8, 0, 1, 1,
0.7530482, 1.270056, -1.163111, 0.8078431, 0, 1, 1,
0.7533416, -1.771777, 2.797856, 0.8117647, 0, 1, 1,
0.7561377, 1.361324, -0.2939622, 0.8196079, 0, 1, 1,
0.7565006, -0.5565702, 5.11251, 0.8235294, 0, 1, 1,
0.7594782, -1.922197, 3.178965, 0.8313726, 0, 1, 1,
0.760825, 1.076503, 1.019265, 0.8352941, 0, 1, 1,
0.7637089, 0.9946966, 0.6391261, 0.8431373, 0, 1, 1,
0.7637998, 0.5209972, 1.298543, 0.8470588, 0, 1, 1,
0.7643459, 0.0061023, 2.093177, 0.854902, 0, 1, 1,
0.7683911, 0.06515995, 1.566974, 0.8588235, 0, 1, 1,
0.7690259, -0.9270847, 1.937182, 0.8666667, 0, 1, 1,
0.7692549, 0.1359809, 3.583829, 0.8705882, 0, 1, 1,
0.7817292, -0.8790357, 3.383831, 0.8784314, 0, 1, 1,
0.7864325, -0.8458285, 2.032417, 0.8823529, 0, 1, 1,
0.7867098, 2.565202, -0.2934458, 0.8901961, 0, 1, 1,
0.7950386, -0.4604512, 1.850931, 0.8941177, 0, 1, 1,
0.8001325, 0.02104697, 1.299281, 0.9019608, 0, 1, 1,
0.8028033, 0.7195645, 1.799268, 0.9098039, 0, 1, 1,
0.8039576, 1.067756, 2.018497, 0.9137255, 0, 1, 1,
0.8042593, 0.4391619, 0.6577505, 0.9215686, 0, 1, 1,
0.8104877, -1.137384, 2.619151, 0.9254902, 0, 1, 1,
0.810818, -1.04378, 2.952137, 0.9333333, 0, 1, 1,
0.8169224, -0.7707669, 1.260797, 0.9372549, 0, 1, 1,
0.8195475, -0.5330173, 1.621004, 0.945098, 0, 1, 1,
0.8220738, 0.709886, 0.241116, 0.9490196, 0, 1, 1,
0.8241474, 1.133081, 0.9701476, 0.9568627, 0, 1, 1,
0.8262352, -2.044427, 6.10616, 0.9607843, 0, 1, 1,
0.8291892, 0.591486, 1.078447, 0.9686275, 0, 1, 1,
0.830171, 0.5940431, 0.8371899, 0.972549, 0, 1, 1,
0.8335449, -0.5809814, 1.597279, 0.9803922, 0, 1, 1,
0.8404751, -0.7021022, 1.987514, 0.9843137, 0, 1, 1,
0.8443408, 0.2195484, 2.537941, 0.9921569, 0, 1, 1,
0.8507211, 1.19652, 1.563848, 0.9960784, 0, 1, 1,
0.8524626, 0.02941876, 1.333477, 1, 0, 0.9960784, 1,
0.8570241, -0.1714647, 2.964718, 1, 0, 0.9882353, 1,
0.8583573, 1.329257, 1.964335, 1, 0, 0.9843137, 1,
0.8594074, -1.719615, 0.4161381, 1, 0, 0.9764706, 1,
0.8615652, -1.465367, 2.522141, 1, 0, 0.972549, 1,
0.8638867, 0.9379503, 2.020092, 1, 0, 0.9647059, 1,
0.8643715, -0.5911641, 1.90708, 1, 0, 0.9607843, 1,
0.8688304, 2.07023, 1.182174, 1, 0, 0.9529412, 1,
0.870469, 1.480037, 0.6799039, 1, 0, 0.9490196, 1,
0.8729997, -0.3002512, 2.327438, 1, 0, 0.9411765, 1,
0.8758805, -0.6579049, 1.097521, 1, 0, 0.9372549, 1,
0.876657, 0.7255452, 2.477244, 1, 0, 0.9294118, 1,
0.8771337, 1.363951, 1.277298, 1, 0, 0.9254902, 1,
0.8804109, -0.009184483, 1.668126, 1, 0, 0.9176471, 1,
0.8874434, 0.5504224, 0.9360179, 1, 0, 0.9137255, 1,
0.8981694, 0.3064565, 2.386531, 1, 0, 0.9058824, 1,
0.9040134, -0.7591984, 2.087776, 1, 0, 0.9019608, 1,
0.908392, 1.096145, 1.320213, 1, 0, 0.8941177, 1,
0.917698, 0.6769617, 0.8182684, 1, 0, 0.8862745, 1,
0.9209634, 0.8966346, 4.018988, 1, 0, 0.8823529, 1,
0.9227605, 0.06965063, 1.647653, 1, 0, 0.8745098, 1,
0.9244592, 0.6596439, -0.03345672, 1, 0, 0.8705882, 1,
0.9357268, 0.09003105, 1.056438, 1, 0, 0.8627451, 1,
0.9402058, 0.8891048, 0.9985322, 1, 0, 0.8588235, 1,
0.9446645, -0.05917158, 1.249361, 1, 0, 0.8509804, 1,
0.9525541, 1.096656, 0.3706183, 1, 0, 0.8470588, 1,
0.9583526, -1.509478, 4.246872, 1, 0, 0.8392157, 1,
0.9646477, -0.3956663, 0.9145144, 1, 0, 0.8352941, 1,
0.9648129, -0.9386683, 2.557083, 1, 0, 0.827451, 1,
0.9703972, -1.020493, 1.110002, 1, 0, 0.8235294, 1,
0.9785025, 0.1239112, -0.06558425, 1, 0, 0.8156863, 1,
0.9807823, -0.4230737, 2.049543, 1, 0, 0.8117647, 1,
0.9827321, 0.4866536, 2.328505, 1, 0, 0.8039216, 1,
0.9862886, -0.2633033, 3.162835, 1, 0, 0.7960784, 1,
0.9900214, -0.1098793, 1.121074, 1, 0, 0.7921569, 1,
0.9989568, -0.2146233, 1.747607, 1, 0, 0.7843137, 1,
1.000382, 1.083632, -0.8796873, 1, 0, 0.7803922, 1,
1.00096, 0.02310932, 3.220678, 1, 0, 0.772549, 1,
1.00418, 0.3157961, 0.3956265, 1, 0, 0.7686275, 1,
1.009041, 1.210675, 1.282985, 1, 0, 0.7607843, 1,
1.010587, 0.8051828, 2.384143, 1, 0, 0.7568628, 1,
1.012131, -0.3179459, 1.980757, 1, 0, 0.7490196, 1,
1.017628, -0.7610633, 3.153397, 1, 0, 0.7450981, 1,
1.02301, -0.168498, 1.982126, 1, 0, 0.7372549, 1,
1.033887, 0.8052634, 1.625319, 1, 0, 0.7333333, 1,
1.034272, 0.151415, 1.88593, 1, 0, 0.7254902, 1,
1.040552, 0.5819107, 0.2777086, 1, 0, 0.7215686, 1,
1.044419, -0.1135601, 3.942227, 1, 0, 0.7137255, 1,
1.048221, -0.7809644, 2.611049, 1, 0, 0.7098039, 1,
1.053767, 1.9013, -0.8327873, 1, 0, 0.7019608, 1,
1.057758, 0.1991978, 1.785437, 1, 0, 0.6941177, 1,
1.060267, 0.3574516, 0.1086638, 1, 0, 0.6901961, 1,
1.067653, -0.2967287, 2.124299, 1, 0, 0.682353, 1,
1.069393, 1.597406, 1.28615, 1, 0, 0.6784314, 1,
1.077156, -0.6883541, 2.147499, 1, 0, 0.6705883, 1,
1.089829, 0.1691556, 1.355147, 1, 0, 0.6666667, 1,
1.09538, 0.5767152, 0.8981507, 1, 0, 0.6588235, 1,
1.101684, 1.502988, -0.2743758, 1, 0, 0.654902, 1,
1.107995, -0.484929, 1.610257, 1, 0, 0.6470588, 1,
1.114596, 0.2599896, 1.60351, 1, 0, 0.6431373, 1,
1.117438, -0.6750571, 2.081916, 1, 0, 0.6352941, 1,
1.118464, 0.1745004, 1.131533, 1, 0, 0.6313726, 1,
1.129379, -0.01254814, 1.933533, 1, 0, 0.6235294, 1,
1.132242, 1.102107, 1.390191, 1, 0, 0.6196079, 1,
1.138443, -0.37978, 2.165164, 1, 0, 0.6117647, 1,
1.140517, -0.7218795, 1.4177, 1, 0, 0.6078432, 1,
1.143183, -1.08715, 1.766084, 1, 0, 0.6, 1,
1.146683, -0.4536559, 0.2799614, 1, 0, 0.5921569, 1,
1.153769, 0.1921487, 0.6047072, 1, 0, 0.5882353, 1,
1.162863, -0.2989935, 1.517457, 1, 0, 0.5803922, 1,
1.163715, 0.5768231, 1.880619, 1, 0, 0.5764706, 1,
1.166098, -0.7589079, 2.357096, 1, 0, 0.5686275, 1,
1.168122, -0.2049078, 1.327033, 1, 0, 0.5647059, 1,
1.177889, -1.714002, 3.591016, 1, 0, 0.5568628, 1,
1.186789, -0.1863494, 0.6472907, 1, 0, 0.5529412, 1,
1.202264, -2.10076, 3.339708, 1, 0, 0.5450981, 1,
1.211267, 0.7828293, 0.7559133, 1, 0, 0.5411765, 1,
1.211608, 1.361694, 1.190635, 1, 0, 0.5333334, 1,
1.218834, 0.357446, 0.5166448, 1, 0, 0.5294118, 1,
1.224819, 2.522537, 0.8634068, 1, 0, 0.5215687, 1,
1.229695, -0.7648323, 2.499845, 1, 0, 0.5176471, 1,
1.235401, -0.9707887, 1.733223, 1, 0, 0.509804, 1,
1.238091, -0.05684152, 1.049168, 1, 0, 0.5058824, 1,
1.242267, -1.967732, 2.585902, 1, 0, 0.4980392, 1,
1.266734, -0.004848386, 1.747792, 1, 0, 0.4901961, 1,
1.267829, -1.512424, 2.00832, 1, 0, 0.4862745, 1,
1.268901, 0.5201054, 1.641219, 1, 0, 0.4784314, 1,
1.277727, 1.504908, 0.5452665, 1, 0, 0.4745098, 1,
1.280394, -0.8682284, 1.450149, 1, 0, 0.4666667, 1,
1.28109, -0.4479591, 1.536595, 1, 0, 0.4627451, 1,
1.286138, 0.05367986, 2.071452, 1, 0, 0.454902, 1,
1.287991, 1.631011, 1.132068, 1, 0, 0.4509804, 1,
1.29582, 0.4625276, 0.8134272, 1, 0, 0.4431373, 1,
1.314074, 0.08678859, 1.668928, 1, 0, 0.4392157, 1,
1.315431, 0.2078589, -0.5737178, 1, 0, 0.4313726, 1,
1.318931, -1.496575, 0.9087669, 1, 0, 0.427451, 1,
1.335107, -1.282952, 2.22456, 1, 0, 0.4196078, 1,
1.338254, 0.1053606, 3.083194, 1, 0, 0.4156863, 1,
1.351967, 0.9983223, 0.7040271, 1, 0, 0.4078431, 1,
1.38556, -0.2518555, 0.8513879, 1, 0, 0.4039216, 1,
1.411124, 1.413828, 1.907519, 1, 0, 0.3960784, 1,
1.418594, 0.5198661, 0.3494708, 1, 0, 0.3882353, 1,
1.419163, -1.611155, 2.621118, 1, 0, 0.3843137, 1,
1.424424, -0.9179658, 1.424749, 1, 0, 0.3764706, 1,
1.42574, 0.7679681, -0.8453358, 1, 0, 0.372549, 1,
1.429438, 0.4577126, 2.533401, 1, 0, 0.3647059, 1,
1.445396, -2.474001, 2.108464, 1, 0, 0.3607843, 1,
1.451461, 1.110885, 1.529739, 1, 0, 0.3529412, 1,
1.453468, -1.162208, 3.72262, 1, 0, 0.3490196, 1,
1.459735, -1.151792, 2.417691, 1, 0, 0.3411765, 1,
1.461478, -1.371433, 3.196169, 1, 0, 0.3372549, 1,
1.47987, 1.500061, 1.372547, 1, 0, 0.3294118, 1,
1.494646, 0.1956905, 2.46465, 1, 0, 0.3254902, 1,
1.497811, -0.8447683, 2.118259, 1, 0, 0.3176471, 1,
1.5074, -0.5189837, 2.641782, 1, 0, 0.3137255, 1,
1.512179, -0.3007334, 0.88008, 1, 0, 0.3058824, 1,
1.513757, -1.08938, 2.683665, 1, 0, 0.2980392, 1,
1.519552, 0.235231, 1.257069, 1, 0, 0.2941177, 1,
1.526478, 1.350479, 2.002083, 1, 0, 0.2862745, 1,
1.545587, 1.716761, 0.4282829, 1, 0, 0.282353, 1,
1.575245, 0.3668355, 1.211008, 1, 0, 0.2745098, 1,
1.580499, 0.7339513, 0.7276486, 1, 0, 0.2705882, 1,
1.581056, -0.4505, 0.9416696, 1, 0, 0.2627451, 1,
1.584172, -0.1205442, 2.397294, 1, 0, 0.2588235, 1,
1.600303, -2.144037, 4.052603, 1, 0, 0.2509804, 1,
1.675402, 0.4067585, 1.695219, 1, 0, 0.2470588, 1,
1.681976, -1.391271, 2.980854, 1, 0, 0.2392157, 1,
1.691461, -1.100571, 3.087354, 1, 0, 0.2352941, 1,
1.692737, 0.360979, 1.892095, 1, 0, 0.227451, 1,
1.694882, -1.079725, 4.762002, 1, 0, 0.2235294, 1,
1.718263, 0.4594069, 0.6774017, 1, 0, 0.2156863, 1,
1.720822, 0.1513453, 1.389628, 1, 0, 0.2117647, 1,
1.731566, 1.541318, 0.3580334, 1, 0, 0.2039216, 1,
1.734847, -0.08640004, -0.3170134, 1, 0, 0.1960784, 1,
1.734895, 1.280775, 0.2700307, 1, 0, 0.1921569, 1,
1.77068, -0.3022809, 2.438236, 1, 0, 0.1843137, 1,
1.780174, 0.2756505, 2.124597, 1, 0, 0.1803922, 1,
1.798665, -0.3339336, 1.312924, 1, 0, 0.172549, 1,
1.840778, 0.1107075, 1.621072, 1, 0, 0.1686275, 1,
1.8752, -0.7264534, 2.603781, 1, 0, 0.1607843, 1,
1.916427, -0.4496529, 2.844836, 1, 0, 0.1568628, 1,
1.929768, -1.108464, 1.752536, 1, 0, 0.1490196, 1,
1.955692, -0.3176394, 2.70454, 1, 0, 0.145098, 1,
1.977096, -0.0165219, 0.1149268, 1, 0, 0.1372549, 1,
1.978416, 0.9441171, -0.2012331, 1, 0, 0.1333333, 1,
2.023055, 0.03574171, 0.5200288, 1, 0, 0.1254902, 1,
2.078913, 0.4429123, 0.4626978, 1, 0, 0.1215686, 1,
2.119828, -0.1454991, 2.364996, 1, 0, 0.1137255, 1,
2.122368, -1.731514, 4.895679, 1, 0, 0.1098039, 1,
2.145948, 0.2363963, 1.109249, 1, 0, 0.1019608, 1,
2.156871, -0.9335394, 2.051859, 1, 0, 0.09411765, 1,
2.191974, -1.702717, 2.748616, 1, 0, 0.09019608, 1,
2.213319, 0.5366499, 1.115862, 1, 0, 0.08235294, 1,
2.231605, -0.2140504, 4.176341, 1, 0, 0.07843138, 1,
2.23424, -0.008662229, 3.47955, 1, 0, 0.07058824, 1,
2.252393, 0.5290077, 1.507513, 1, 0, 0.06666667, 1,
2.314467, 0.006772803, 1.498641, 1, 0, 0.05882353, 1,
2.359574, 0.5387684, 0.6883085, 1, 0, 0.05490196, 1,
2.380926, -0.467495, 1.948034, 1, 0, 0.04705882, 1,
2.403614, 1.354243, 2.274187, 1, 0, 0.04313726, 1,
2.41001, -0.5813871, 2.160575, 1, 0, 0.03529412, 1,
2.447697, 0.9076162, 0.2205144, 1, 0, 0.03137255, 1,
2.539777, -0.1766553, 2.444297, 1, 0, 0.02352941, 1,
2.574283, -1.058399, 2.614577, 1, 0, 0.01960784, 1,
2.778248, -0.4546583, 1.723581, 1, 0, 0.01176471, 1,
2.779774, -0.3804138, 1.344785, 1, 0, 0.007843138, 1
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
-0.04230154, -4.597521, -8.410098, 0, -0.5, 0.5, 0.5,
-0.04230154, -4.597521, -8.410098, 1, -0.5, 0.5, 0.5,
-0.04230154, -4.597521, -8.410098, 1, 1.5, 0.5, 0.5,
-0.04230154, -4.597521, -8.410098, 0, 1.5, 0.5, 0.5
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
-3.821061, -0.4584171, -8.410098, 0, -0.5, 0.5, 0.5,
-3.821061, -0.4584171, -8.410098, 1, -0.5, 0.5, 0.5,
-3.821061, -0.4584171, -8.410098, 1, 1.5, 0.5, 0.5,
-3.821061, -0.4584171, -8.410098, 0, 1.5, 0.5, 0.5
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
-3.821061, -4.597521, -0.1000211, 0, -0.5, 0.5, 0.5,
-3.821061, -4.597521, -0.1000211, 1, -0.5, 0.5, 0.5,
-3.821061, -4.597521, -0.1000211, 1, 1.5, 0.5, 0.5,
-3.821061, -4.597521, -0.1000211, 0, 1.5, 0.5, 0.5
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
-2, -3.642343, -6.492388,
2, -3.642343, -6.492388,
-2, -3.642343, -6.492388,
-2, -3.801539, -6.812006,
-1, -3.642343, -6.492388,
-1, -3.801539, -6.812006,
0, -3.642343, -6.492388,
0, -3.801539, -6.812006,
1, -3.642343, -6.492388,
1, -3.801539, -6.812006,
2, -3.642343, -6.492388,
2, -3.801539, -6.812006
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
-2, -4.119932, -7.451243, 0, -0.5, 0.5, 0.5,
-2, -4.119932, -7.451243, 1, -0.5, 0.5, 0.5,
-2, -4.119932, -7.451243, 1, 1.5, 0.5, 0.5,
-2, -4.119932, -7.451243, 0, 1.5, 0.5, 0.5,
-1, -4.119932, -7.451243, 0, -0.5, 0.5, 0.5,
-1, -4.119932, -7.451243, 1, -0.5, 0.5, 0.5,
-1, -4.119932, -7.451243, 1, 1.5, 0.5, 0.5,
-1, -4.119932, -7.451243, 0, 1.5, 0.5, 0.5,
0, -4.119932, -7.451243, 0, -0.5, 0.5, 0.5,
0, -4.119932, -7.451243, 1, -0.5, 0.5, 0.5,
0, -4.119932, -7.451243, 1, 1.5, 0.5, 0.5,
0, -4.119932, -7.451243, 0, 1.5, 0.5, 0.5,
1, -4.119932, -7.451243, 0, -0.5, 0.5, 0.5,
1, -4.119932, -7.451243, 1, -0.5, 0.5, 0.5,
1, -4.119932, -7.451243, 1, 1.5, 0.5, 0.5,
1, -4.119932, -7.451243, 0, 1.5, 0.5, 0.5,
2, -4.119932, -7.451243, 0, -0.5, 0.5, 0.5,
2, -4.119932, -7.451243, 1, -0.5, 0.5, 0.5,
2, -4.119932, -7.451243, 1, 1.5, 0.5, 0.5,
2, -4.119932, -7.451243, 0, 1.5, 0.5, 0.5
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
-2.949039, -3, -6.492388,
-2.949039, 2, -6.492388,
-2.949039, -3, -6.492388,
-3.094376, -3, -6.812006,
-2.949039, -2, -6.492388,
-3.094376, -2, -6.812006,
-2.949039, -1, -6.492388,
-3.094376, -1, -6.812006,
-2.949039, 0, -6.492388,
-3.094376, 0, -6.812006,
-2.949039, 1, -6.492388,
-3.094376, 1, -6.812006,
-2.949039, 2, -6.492388,
-3.094376, 2, -6.812006
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
-3.38505, -3, -7.451243, 0, -0.5, 0.5, 0.5,
-3.38505, -3, -7.451243, 1, -0.5, 0.5, 0.5,
-3.38505, -3, -7.451243, 1, 1.5, 0.5, 0.5,
-3.38505, -3, -7.451243, 0, 1.5, 0.5, 0.5,
-3.38505, -2, -7.451243, 0, -0.5, 0.5, 0.5,
-3.38505, -2, -7.451243, 1, -0.5, 0.5, 0.5,
-3.38505, -2, -7.451243, 1, 1.5, 0.5, 0.5,
-3.38505, -2, -7.451243, 0, 1.5, 0.5, 0.5,
-3.38505, -1, -7.451243, 0, -0.5, 0.5, 0.5,
-3.38505, -1, -7.451243, 1, -0.5, 0.5, 0.5,
-3.38505, -1, -7.451243, 1, 1.5, 0.5, 0.5,
-3.38505, -1, -7.451243, 0, 1.5, 0.5, 0.5,
-3.38505, 0, -7.451243, 0, -0.5, 0.5, 0.5,
-3.38505, 0, -7.451243, 1, -0.5, 0.5, 0.5,
-3.38505, 0, -7.451243, 1, 1.5, 0.5, 0.5,
-3.38505, 0, -7.451243, 0, 1.5, 0.5, 0.5,
-3.38505, 1, -7.451243, 0, -0.5, 0.5, 0.5,
-3.38505, 1, -7.451243, 1, -0.5, 0.5, 0.5,
-3.38505, 1, -7.451243, 1, 1.5, 0.5, 0.5,
-3.38505, 1, -7.451243, 0, 1.5, 0.5, 0.5,
-3.38505, 2, -7.451243, 0, -0.5, 0.5, 0.5,
-3.38505, 2, -7.451243, 1, -0.5, 0.5, 0.5,
-3.38505, 2, -7.451243, 1, 1.5, 0.5, 0.5,
-3.38505, 2, -7.451243, 0, 1.5, 0.5, 0.5
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
-2.949039, -3.642343, -6,
-2.949039, -3.642343, 6,
-2.949039, -3.642343, -6,
-3.094376, -3.801539, -6,
-2.949039, -3.642343, -4,
-3.094376, -3.801539, -4,
-2.949039, -3.642343, -2,
-3.094376, -3.801539, -2,
-2.949039, -3.642343, 0,
-3.094376, -3.801539, 0,
-2.949039, -3.642343, 2,
-3.094376, -3.801539, 2,
-2.949039, -3.642343, 4,
-3.094376, -3.801539, 4,
-2.949039, -3.642343, 6,
-3.094376, -3.801539, 6
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
-3.38505, -4.119932, -6, 0, -0.5, 0.5, 0.5,
-3.38505, -4.119932, -6, 1, -0.5, 0.5, 0.5,
-3.38505, -4.119932, -6, 1, 1.5, 0.5, 0.5,
-3.38505, -4.119932, -6, 0, 1.5, 0.5, 0.5,
-3.38505, -4.119932, -4, 0, -0.5, 0.5, 0.5,
-3.38505, -4.119932, -4, 1, -0.5, 0.5, 0.5,
-3.38505, -4.119932, -4, 1, 1.5, 0.5, 0.5,
-3.38505, -4.119932, -4, 0, 1.5, 0.5, 0.5,
-3.38505, -4.119932, -2, 0, -0.5, 0.5, 0.5,
-3.38505, -4.119932, -2, 1, -0.5, 0.5, 0.5,
-3.38505, -4.119932, -2, 1, 1.5, 0.5, 0.5,
-3.38505, -4.119932, -2, 0, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 0, 0, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 0, 1, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 0, 1, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 0, 0, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 2, 0, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 2, 1, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 2, 1, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 2, 0, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 4, 0, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 4, 1, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 4, 1, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 4, 0, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 6, 0, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 6, 1, -0.5, 0.5, 0.5,
-3.38505, -4.119932, 6, 1, 1.5, 0.5, 0.5,
-3.38505, -4.119932, 6, 0, 1.5, 0.5, 0.5
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
-2.949039, -3.642343, -6.492388,
-2.949039, 2.725509, -6.492388,
-2.949039, -3.642343, 6.292346,
-2.949039, 2.725509, 6.292346,
-2.949039, -3.642343, -6.492388,
-2.949039, -3.642343, 6.292346,
-2.949039, 2.725509, -6.492388,
-2.949039, 2.725509, 6.292346,
-2.949039, -3.642343, -6.492388,
2.864436, -3.642343, -6.492388,
-2.949039, -3.642343, 6.292346,
2.864436, -3.642343, 6.292346,
-2.949039, 2.725509, -6.492388,
2.864436, 2.725509, -6.492388,
-2.949039, 2.725509, 6.292346,
2.864436, 2.725509, 6.292346,
2.864436, -3.642343, -6.492388,
2.864436, 2.725509, -6.492388,
2.864436, -3.642343, 6.292346,
2.864436, 2.725509, 6.292346,
2.864436, -3.642343, -6.492388,
2.864436, -3.642343, 6.292346,
2.864436, 2.725509, -6.492388,
2.864436, 2.725509, 6.292346
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
var radius = 8.23431;
var distance = 36.63538;
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
mvMatrix.translate( 0.04230154, 0.4584171, 0.1000211 );
mvMatrix.scale( 1.531459, 1.398132, 0.6963851 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.63538);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
pefurazoate<-read.table("pefurazoate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pefurazoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
```

```r
y<-pefurazoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
```

```r
z<-pefurazoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
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
-2.864377, 0.2633344, -0.1802515, 0, 0, 1, 1, 1,
-2.789744, 1.077676, -0.7148058, 1, 0, 0, 1, 1,
-2.768472, 1.216028, -0.3205356, 1, 0, 0, 1, 1,
-2.768147, -1.222236, -3.560639, 1, 0, 0, 1, 1,
-2.535334, 1.588776, -1.591847, 1, 0, 0, 1, 1,
-2.444785, 1.981554, -0.6232576, 1, 0, 0, 1, 1,
-2.414181, 1.90851, -2.233923, 0, 0, 0, 1, 1,
-2.300278, -0.8616421, -2.748116, 0, 0, 0, 1, 1,
-2.263015, -0.5826913, -0.8782891, 0, 0, 0, 1, 1,
-2.230839, -2.547388, -1.923769, 0, 0, 0, 1, 1,
-2.22888, -1.097229, -2.515005, 0, 0, 0, 1, 1,
-2.193035, -0.06516732, -1.744334, 0, 0, 0, 1, 1,
-2.182249, -0.4564711, -2.260009, 0, 0, 0, 1, 1,
-2.162988, 0.3118968, -2.885297, 1, 1, 1, 1, 1,
-2.149385, -1.702167, -2.536086, 1, 1, 1, 1, 1,
-2.138621, -0.8016776, -2.93587, 1, 1, 1, 1, 1,
-2.136373, 0.04536274, -0.8068, 1, 1, 1, 1, 1,
-2.117979, 1.032055, -2.050513, 1, 1, 1, 1, 1,
-2.093956, 0.4008404, -1.939184, 1, 1, 1, 1, 1,
-2.076683, -1.100591, -3.424717, 1, 1, 1, 1, 1,
-2.054467, 0.7585493, -2.196731, 1, 1, 1, 1, 1,
-2.041787, 2.195458, 0.6376333, 1, 1, 1, 1, 1,
-2.014805, -0.7092441, -3.000166, 1, 1, 1, 1, 1,
-2.003287, -0.4094129, -0.4979128, 1, 1, 1, 1, 1,
-1.990299, 1.241782, -2.238618, 1, 1, 1, 1, 1,
-1.988585, -0.7300457, -3.568723, 1, 1, 1, 1, 1,
-1.979519, 1.273619, -2.109368, 1, 1, 1, 1, 1,
-1.942454, -1.078117, -2.328762, 1, 1, 1, 1, 1,
-1.937387, 0.2491967, -1.380103, 0, 0, 1, 1, 1,
-1.934293, -0.6718254, -0.4001736, 1, 0, 0, 1, 1,
-1.914237, -0.6704464, -0.8936972, 1, 0, 0, 1, 1,
-1.905483, -1.049939, -0.3004232, 1, 0, 0, 1, 1,
-1.894154, 0.06487892, -1.51212, 1, 0, 0, 1, 1,
-1.868437, -0.4241614, -1.467627, 1, 0, 0, 1, 1,
-1.860351, -2.813481, -2.444398, 0, 0, 0, 1, 1,
-1.841054, -1.294531, -1.783524, 0, 0, 0, 1, 1,
-1.834699, -0.7528046, -3.476572, 0, 0, 0, 1, 1,
-1.81192, 0.4061766, -0.6958359, 0, 0, 0, 1, 1,
-1.807642, -0.6016775, -2.661043, 0, 0, 0, 1, 1,
-1.789615, 0.8772495, -0.7012434, 0, 0, 0, 1, 1,
-1.780359, 0.4448568, -3.438735, 0, 0, 0, 1, 1,
-1.776664, -1.147932, -2.258515, 1, 1, 1, 1, 1,
-1.762478, 0.4329918, 0.5263458, 1, 1, 1, 1, 1,
-1.750978, 0.08877073, -1.803745, 1, 1, 1, 1, 1,
-1.729035, -1.082825, -2.657744, 1, 1, 1, 1, 1,
-1.718284, 0.5143168, 0.2616442, 1, 1, 1, 1, 1,
-1.712985, 1.111026, -2.290184, 1, 1, 1, 1, 1,
-1.707272, 0.5290783, -1.531121, 1, 1, 1, 1, 1,
-1.683707, -0.6816218, -2.752763, 1, 1, 1, 1, 1,
-1.672252, 1.200416, -1.532064, 1, 1, 1, 1, 1,
-1.669797, 1.238791, -2.581024, 1, 1, 1, 1, 1,
-1.664897, -0.2541526, -2.583924, 1, 1, 1, 1, 1,
-1.659568, -0.06397455, -2.915909, 1, 1, 1, 1, 1,
-1.658531, 0.09104974, -0.5336937, 1, 1, 1, 1, 1,
-1.658527, -1.422105, -2.855053, 1, 1, 1, 1, 1,
-1.623438, 1.566244, 0.5259394, 1, 1, 1, 1, 1,
-1.614251, -0.09545255, -0.8448255, 0, 0, 1, 1, 1,
-1.607152, 1.093109, -1.412606, 1, 0, 0, 1, 1,
-1.606511, 0.7341856, -0.9186934, 1, 0, 0, 1, 1,
-1.582992, -0.2082458, -3.099786, 1, 0, 0, 1, 1,
-1.582446, 1.607597, -2.061817, 1, 0, 0, 1, 1,
-1.579284, -1.056188, -1.812234, 1, 0, 0, 1, 1,
-1.546243, 1.27275, -0.60152, 0, 0, 0, 1, 1,
-1.541347, -0.6597404, -0.9330508, 0, 0, 0, 1, 1,
-1.518556, -1.446334, -3.427283, 0, 0, 0, 1, 1,
-1.504635, -0.2171631, -2.367069, 0, 0, 0, 1, 1,
-1.504247, 1.113003, -0.07087103, 0, 0, 0, 1, 1,
-1.49832, 0.7033048, 0.1161427, 0, 0, 0, 1, 1,
-1.492654, -0.1410642, -0.672942, 0, 0, 0, 1, 1,
-1.459593, 0.2110206, -1.903625, 1, 1, 1, 1, 1,
-1.457521, 0.1061499, -1.119262, 1, 1, 1, 1, 1,
-1.447711, 0.3550133, 0.03427961, 1, 1, 1, 1, 1,
-1.439425, -0.1352391, 0.0002220253, 1, 1, 1, 1, 1,
-1.436474, 0.5621675, -1.087904, 1, 1, 1, 1, 1,
-1.427403, -2.011492, -1.366376, 1, 1, 1, 1, 1,
-1.40578, -1.613015, -2.640919, 1, 1, 1, 1, 1,
-1.390149, 1.293898, -0.2235914, 1, 1, 1, 1, 1,
-1.389868, 0.6305722, 1.34139, 1, 1, 1, 1, 1,
-1.389791, 0.6386975, -1.11627, 1, 1, 1, 1, 1,
-1.387437, -0.5029894, -2.990798, 1, 1, 1, 1, 1,
-1.377318, 0.8395148, -1.475538, 1, 1, 1, 1, 1,
-1.374548, 0.6122684, 1.500924, 1, 1, 1, 1, 1,
-1.37391, 0.7235787, -0.8899421, 1, 1, 1, 1, 1,
-1.361905, 1.471815, 0.8370701, 1, 1, 1, 1, 1,
-1.361514, -1.486637, -2.850876, 0, 0, 1, 1, 1,
-1.359867, 0.6330862, -1.569418, 1, 0, 0, 1, 1,
-1.356388, -1.514878, -2.148594, 1, 0, 0, 1, 1,
-1.344386, 0.1772675, -0.9676593, 1, 0, 0, 1, 1,
-1.331223, -0.9015518, -0.3699015, 1, 0, 0, 1, 1,
-1.320105, -0.9740114, -2.337271, 1, 0, 0, 1, 1,
-1.318895, 1.725255, -2.389888, 0, 0, 0, 1, 1,
-1.317469, 1.498502, -0.4626208, 0, 0, 0, 1, 1,
-1.309891, -0.3576272, -2.986823, 0, 0, 0, 1, 1,
-1.308154, 0.6547723, 0.06537037, 0, 0, 0, 1, 1,
-1.280854, -0.6654567, -0.7243242, 0, 0, 0, 1, 1,
-1.280292, 0.3573419, -1.260137, 0, 0, 0, 1, 1,
-1.277401, -0.6216074, -2.635362, 0, 0, 0, 1, 1,
-1.277037, -1.0106, -4.115, 1, 1, 1, 1, 1,
-1.262629, 0.5713577, 0.9857005, 1, 1, 1, 1, 1,
-1.258056, -0.6131243, -0.3489308, 1, 1, 1, 1, 1,
-1.253921, -1.226868, -2.095474, 1, 1, 1, 1, 1,
-1.252191, -0.9012435, -1.089073, 1, 1, 1, 1, 1,
-1.250682, -0.1929491, -0.7189604, 1, 1, 1, 1, 1,
-1.249816, 1.094034, -1.798777, 1, 1, 1, 1, 1,
-1.242892, 0.9490777, 0.811308, 1, 1, 1, 1, 1,
-1.239237, 2.154398, -0.3860168, 1, 1, 1, 1, 1,
-1.230576, 1.120607, -1.861011, 1, 1, 1, 1, 1,
-1.229457, -1.36174, -1.557681, 1, 1, 1, 1, 1,
-1.22462, -1.232962, -0.7059532, 1, 1, 1, 1, 1,
-1.210343, 0.1082192, -2.125804, 1, 1, 1, 1, 1,
-1.199656, 1.38281, -1.296934, 1, 1, 1, 1, 1,
-1.189821, 0.4440131, -0.02153456, 1, 1, 1, 1, 1,
-1.185875, 0.3774853, -1.774026, 0, 0, 1, 1, 1,
-1.1776, -1.826357, -3.284374, 1, 0, 0, 1, 1,
-1.177508, -0.1292776, -1.129634, 1, 0, 0, 1, 1,
-1.175128, -1.542607, -2.446986, 1, 0, 0, 1, 1,
-1.168607, 1.426984, -0.4292606, 1, 0, 0, 1, 1,
-1.161845, 0.6781604, -0.5553414, 1, 0, 0, 1, 1,
-1.15753, -1.093335, -2.161785, 0, 0, 0, 1, 1,
-1.139751, 0.2872546, -0.139959, 0, 0, 0, 1, 1,
-1.135164, 0.6301679, -0.69571, 0, 0, 0, 1, 1,
-1.129313, -1.581498, -2.366149, 0, 0, 0, 1, 1,
-1.116996, -0.019311, 0.08698542, 0, 0, 0, 1, 1,
-1.11553, 0.2922778, -1.577585, 0, 0, 0, 1, 1,
-1.112202, 1.465015, -0.05868223, 0, 0, 0, 1, 1,
-1.10579, -0.1809029, -1.744357, 1, 1, 1, 1, 1,
-1.104522, -0.4292094, -2.262635, 1, 1, 1, 1, 1,
-1.103134, 0.1540773, -1.092431, 1, 1, 1, 1, 1,
-1.096612, -1.551641, -1.623094, 1, 1, 1, 1, 1,
-1.092057, 0.1943996, -1.716008, 1, 1, 1, 1, 1,
-1.08999, -1.353808, -3.17778, 1, 1, 1, 1, 1,
-1.088435, -2.213343, -2.664601, 1, 1, 1, 1, 1,
-1.078463, 0.3153571, -0.5373508, 1, 1, 1, 1, 1,
-1.071596, -1.411224, -2.545437, 1, 1, 1, 1, 1,
-1.059955, -0.7102118, -0.7872632, 1, 1, 1, 1, 1,
-1.05605, 0.6075518, 0.15955, 1, 1, 1, 1, 1,
-1.055986, 1.090392, -0.1574166, 1, 1, 1, 1, 1,
-1.049635, 0.4308506, -0.4328331, 1, 1, 1, 1, 1,
-1.047323, -0.3726802, -2.492848, 1, 1, 1, 1, 1,
-1.046062, -0.7165549, -2.751899, 1, 1, 1, 1, 1,
-1.04343, -2.469655, -1.613125, 0, 0, 1, 1, 1,
-1.04296, 0.3456259, -1.239748, 1, 0, 0, 1, 1,
-1.042365, 0.8005282, -0.2922808, 1, 0, 0, 1, 1,
-1.037973, -1.069463, -2.050176, 1, 0, 0, 1, 1,
-1.034965, 0.5791883, -0.9136497, 1, 0, 0, 1, 1,
-1.028762, 0.8744041, 0.3229312, 1, 0, 0, 1, 1,
-1.027871, -0.4507796, -2.412334, 0, 0, 0, 1, 1,
-1.027436, -0.6369305, -2.829209, 0, 0, 0, 1, 1,
-1.026814, -0.8444082, -3.342021, 0, 0, 0, 1, 1,
-1.011011, 0.6918202, -1.001637, 0, 0, 0, 1, 1,
-0.9969496, 0.02223011, -0.5053322, 0, 0, 0, 1, 1,
-0.9957115, -0.3951531, -1.261342, 0, 0, 0, 1, 1,
-0.9902273, 1.350934, -1.763168, 0, 0, 0, 1, 1,
-0.9900977, -0.951789, -2.271511, 1, 1, 1, 1, 1,
-0.9892454, -1.039763, -2.963373, 1, 1, 1, 1, 1,
-0.9890848, -0.3914236, -3.123427, 1, 1, 1, 1, 1,
-0.9868006, 1.174924, -1.277738, 1, 1, 1, 1, 1,
-0.9840409, -0.08173791, -3.445527, 1, 1, 1, 1, 1,
-0.9834654, 0.9176913, -0.6347361, 1, 1, 1, 1, 1,
-0.9814862, 1.072876, -1.205643, 1, 1, 1, 1, 1,
-0.976459, -0.1250079, -1.430679, 1, 1, 1, 1, 1,
-0.9721942, 0.2863151, -1.82155, 1, 1, 1, 1, 1,
-0.9697473, 0.8281463, -1.657725, 1, 1, 1, 1, 1,
-0.9656017, 0.3001319, -0.9310918, 1, 1, 1, 1, 1,
-0.9642254, 1.08446, 1.118088, 1, 1, 1, 1, 1,
-0.9617362, 1.151036, -1.366504, 1, 1, 1, 1, 1,
-0.9576781, 0.7658228, -0.8442516, 1, 1, 1, 1, 1,
-0.9559721, -0.8559759, -1.092306, 1, 1, 1, 1, 1,
-0.9531943, 0.8962021, -2.195837, 0, 0, 1, 1, 1,
-0.9357035, -1.118679, 0.4229127, 1, 0, 0, 1, 1,
-0.9305952, 0.4691571, -0.4969632, 1, 0, 0, 1, 1,
-0.9291009, 0.2877028, -1.836881, 1, 0, 0, 1, 1,
-0.9277528, 0.6889448, -0.9969569, 1, 0, 0, 1, 1,
-0.9157573, -0.9104166, -1.461846, 1, 0, 0, 1, 1,
-0.9013361, 0.8297298, -2.403687, 0, 0, 0, 1, 1,
-0.8980029, -1.094506, -2.81559, 0, 0, 0, 1, 1,
-0.8960047, -0.4481947, -4.255428, 0, 0, 0, 1, 1,
-0.8891062, 1.083999, 0.4250447, 0, 0, 0, 1, 1,
-0.8861219, -0.6321625, -3.190938, 0, 0, 0, 1, 1,
-0.8843147, 0.1666724, -2.269761, 0, 0, 0, 1, 1,
-0.8816687, -0.9171928, -0.9382033, 0, 0, 0, 1, 1,
-0.8761992, 0.08338805, -1.292031, 1, 1, 1, 1, 1,
-0.8730699, -0.3017893, -0.365837, 1, 1, 1, 1, 1,
-0.8715601, 0.1436731, -1.411923, 1, 1, 1, 1, 1,
-0.8710784, 0.69322, -0.874401, 1, 1, 1, 1, 1,
-0.8671747, -2.476188, -3.778415, 1, 1, 1, 1, 1,
-0.8609174, 0.2095962, -1.542855, 1, 1, 1, 1, 1,
-0.858083, -0.5301382, -1.094478, 1, 1, 1, 1, 1,
-0.8537316, -0.7859718, -1.380956, 1, 1, 1, 1, 1,
-0.8516847, 1.668129, -0.2562161, 1, 1, 1, 1, 1,
-0.8482706, -1.075046, -0.4937474, 1, 1, 1, 1, 1,
-0.8396374, -1.466859, -3.422503, 1, 1, 1, 1, 1,
-0.8365119, 0.9184844, -2.149548, 1, 1, 1, 1, 1,
-0.8319297, 0.7452428, -0.9309886, 1, 1, 1, 1, 1,
-0.8307137, 0.2190963, -1.280484, 1, 1, 1, 1, 1,
-0.8283944, -0.6760138, -3.341538, 1, 1, 1, 1, 1,
-0.8280684, 1.606859, -2.720176, 0, 0, 1, 1, 1,
-0.8258428, -0.1551433, -1.378276, 1, 0, 0, 1, 1,
-0.8227018, -1.583787, -0.7407228, 1, 0, 0, 1, 1,
-0.8150889, 0.09491326, -1.821383, 1, 0, 0, 1, 1,
-0.8107473, -0.4890628, -0.0233523, 1, 0, 0, 1, 1,
-0.8106709, -1.618825, -1.53548, 1, 0, 0, 1, 1,
-0.7995101, 0.02138531, -3.208223, 0, 0, 0, 1, 1,
-0.7955032, -0.9728124, -2.952258, 0, 0, 0, 1, 1,
-0.7896658, -0.7907534, -3.145283, 0, 0, 0, 1, 1,
-0.7829, 1.0357, -0.5462303, 0, 0, 0, 1, 1,
-0.7806844, 0.1296156, -1.785784, 0, 0, 0, 1, 1,
-0.7794667, -0.6517041, -1.721049, 0, 0, 0, 1, 1,
-0.7721483, 0.6615877, -0.7374319, 0, 0, 0, 1, 1,
-0.7686068, -0.9706606, -1.908681, 1, 1, 1, 1, 1,
-0.7599729, 1.882774, 0.3796527, 1, 1, 1, 1, 1,
-0.7598627, 0.1299015, -0.9763835, 1, 1, 1, 1, 1,
-0.7592359, -2.626822, -2.683164, 1, 1, 1, 1, 1,
-0.7566326, -0.5283656, -1.718997, 1, 1, 1, 1, 1,
-0.7534949, 2.632773, -1.150498, 1, 1, 1, 1, 1,
-0.7513611, 0.2678026, -2.259589, 1, 1, 1, 1, 1,
-0.7502934, 1.056558, -1.992057, 1, 1, 1, 1, 1,
-0.7499571, -1.943739, -0.579923, 1, 1, 1, 1, 1,
-0.7492862, -1.742107, -2.985985, 1, 1, 1, 1, 1,
-0.7491484, -0.7315218, -2.311791, 1, 1, 1, 1, 1,
-0.7460526, 0.02146576, -0.7031874, 1, 1, 1, 1, 1,
-0.7421992, -0.1890626, -0.4558789, 1, 1, 1, 1, 1,
-0.7403479, -1.097679, -2.713351, 1, 1, 1, 1, 1,
-0.7363861, -1.264234, -1.337935, 1, 1, 1, 1, 1,
-0.7295787, 0.3779978, -0.9238071, 0, 0, 1, 1, 1,
-0.7279189, 1.327882, -1.959425, 1, 0, 0, 1, 1,
-0.7208222, 0.4737317, -0.8255677, 1, 0, 0, 1, 1,
-0.7132756, -0.08408929, -0.6806032, 1, 0, 0, 1, 1,
-0.7116488, -1.972473, -2.564352, 1, 0, 0, 1, 1,
-0.7102407, -0.1322785, -1.369, 1, 0, 0, 1, 1,
-0.7069126, -1.480686, -6.306202, 0, 0, 0, 1, 1,
-0.7067283, 0.4570585, -1.782302, 0, 0, 0, 1, 1,
-0.7056804, -0.1411168, -3.644646, 0, 0, 0, 1, 1,
-0.700005, 2.266624, -0.7773233, 0, 0, 0, 1, 1,
-0.6959257, -1.42479, -1.050415, 0, 0, 0, 1, 1,
-0.6906819, -1.295416, -3.05496, 0, 0, 0, 1, 1,
-0.6888513, -1.207223, -1.117473, 0, 0, 0, 1, 1,
-0.685285, 0.145193, 0.04996936, 1, 1, 1, 1, 1,
-0.6811157, -0.1984975, -1.424785, 1, 1, 1, 1, 1,
-0.6809062, -2.190776, -2.149757, 1, 1, 1, 1, 1,
-0.6797165, -0.223425, -2.181385, 1, 1, 1, 1, 1,
-0.6776562, -0.8123281, -2.670323, 1, 1, 1, 1, 1,
-0.6690546, -0.7681904, -1.173442, 1, 1, 1, 1, 1,
-0.6639737, -0.4558274, -2.036632, 1, 1, 1, 1, 1,
-0.662011, 0.2910867, -0.08985135, 1, 1, 1, 1, 1,
-0.6613677, 0.2832882, -0.8721536, 1, 1, 1, 1, 1,
-0.6582882, -0.7401547, -1.689873, 1, 1, 1, 1, 1,
-0.6572509, -0.1795201, -0.1768676, 1, 1, 1, 1, 1,
-0.6566756, 0.3886148, -1.464604, 1, 1, 1, 1, 1,
-0.6560435, -0.9046389, -1.648653, 1, 1, 1, 1, 1,
-0.655288, -1.030548, -3.430284, 1, 1, 1, 1, 1,
-0.6533253, 0.4597116, -2.233369, 1, 1, 1, 1, 1,
-0.6503435, 1.735872, -1.096982, 0, 0, 1, 1, 1,
-0.6483583, 0.2610111, -0.8539041, 1, 0, 0, 1, 1,
-0.6475226, -1.588192, -3.110729, 1, 0, 0, 1, 1,
-0.6474056, -2.015949, -3.590314, 1, 0, 0, 1, 1,
-0.6372824, -1.047105, -2.197998, 1, 0, 0, 1, 1,
-0.6357471, 0.03930306, -0.9656014, 1, 0, 0, 1, 1,
-0.6291949, -2.693721, -2.479332, 0, 0, 0, 1, 1,
-0.6216075, 1.003204, 0.03668226, 0, 0, 0, 1, 1,
-0.6185905, 0.5217543, -0.1957683, 0, 0, 0, 1, 1,
-0.617711, -0.3838955, -1.500424, 0, 0, 0, 1, 1,
-0.6157769, -1.795102, -2.105602, 0, 0, 0, 1, 1,
-0.6092728, -2.122284, -3.729782, 0, 0, 0, 1, 1,
-0.6053981, 1.715437, -0.8999834, 0, 0, 0, 1, 1,
-0.6052023, 0.8865066, -1.046038, 1, 1, 1, 1, 1,
-0.6005965, 1.411294, 0.0277551, 1, 1, 1, 1, 1,
-0.5993801, -1.915451, -2.428928, 1, 1, 1, 1, 1,
-0.5970746, 0.2740858, -0.7904538, 1, 1, 1, 1, 1,
-0.5945376, 0.3511165, -1.472167, 1, 1, 1, 1, 1,
-0.5689229, -1.260635, -2.41928, 1, 1, 1, 1, 1,
-0.5675922, 1.528935, 0.9632797, 1, 1, 1, 1, 1,
-0.5611205, 0.1072894, -2.253913, 1, 1, 1, 1, 1,
-0.557779, 0.5481781, -0.8655568, 1, 1, 1, 1, 1,
-0.5560885, 0.1880006, -2.104484, 1, 1, 1, 1, 1,
-0.5546477, -0.5537785, -3.495684, 1, 1, 1, 1, 1,
-0.5490886, 0.1111785, -1.119968, 1, 1, 1, 1, 1,
-0.5484987, 0.6405821, -1.20714, 1, 1, 1, 1, 1,
-0.5462454, 0.2713768, -2.175246, 1, 1, 1, 1, 1,
-0.544424, 1.198119, 2.45732, 1, 1, 1, 1, 1,
-0.543411, -0.5895285, -2.611057, 0, 0, 1, 1, 1,
-0.5411931, -0.4199245, -1.283101, 1, 0, 0, 1, 1,
-0.540843, 0.2790152, -2.195038, 1, 0, 0, 1, 1,
-0.5387275, 1.488158, -0.256752, 1, 0, 0, 1, 1,
-0.5359651, -1.41068, -2.676389, 1, 0, 0, 1, 1,
-0.5354689, 0.457365, -1.485295, 1, 0, 0, 1, 1,
-0.5265844, -0.6178412, -2.744222, 0, 0, 0, 1, 1,
-0.5258496, 0.5170157, -0.2640279, 0, 0, 0, 1, 1,
-0.5243698, -0.3600476, -0.7780102, 0, 0, 0, 1, 1,
-0.5239475, -0.2989745, -2.891967, 0, 0, 0, 1, 1,
-0.5225675, -0.1118538, -1.246855, 0, 0, 0, 1, 1,
-0.5202786, -2.335999, -3.980678, 0, 0, 0, 1, 1,
-0.5163919, -0.4301943, -2.875026, 0, 0, 0, 1, 1,
-0.5126039, -1.901173, -0.7973719, 1, 1, 1, 1, 1,
-0.5034266, 0.3544238, 0.8404822, 1, 1, 1, 1, 1,
-0.5004896, -1.785716, -2.483132, 1, 1, 1, 1, 1,
-0.500163, -0.8170157, -3.864186, 1, 1, 1, 1, 1,
-0.4967875, 0.8683205, 0.1882932, 1, 1, 1, 1, 1,
-0.4943824, 0.2554684, -2.465404, 1, 1, 1, 1, 1,
-0.4871963, 1.127731, -0.9493998, 1, 1, 1, 1, 1,
-0.4851859, -0.8560475, -2.378241, 1, 1, 1, 1, 1,
-0.4846688, -0.2837324, -3.427125, 1, 1, 1, 1, 1,
-0.4845271, -0.5285741, -1.834632, 1, 1, 1, 1, 1,
-0.4833841, -0.4963801, -2.718683, 1, 1, 1, 1, 1,
-0.4826189, 1.671884, 0.5126556, 1, 1, 1, 1, 1,
-0.4820875, -0.729961, -1.515552, 1, 1, 1, 1, 1,
-0.4781763, -0.07552547, -1.507412, 1, 1, 1, 1, 1,
-0.4775461, -0.8347961, -0.9218292, 1, 1, 1, 1, 1,
-0.476497, 0.0165317, -0.05124604, 0, 0, 1, 1, 1,
-0.4735444, -1.257069, -4.123083, 1, 0, 0, 1, 1,
-0.4716094, 0.05807548, -2.290287, 1, 0, 0, 1, 1,
-0.4667891, 1.802394, 0.1882867, 1, 0, 0, 1, 1,
-0.4657417, 0.7515996, -0.7569673, 1, 0, 0, 1, 1,
-0.461645, 0.5097019, -0.6298966, 1, 0, 0, 1, 1,
-0.4547913, 0.8263324, -1.097314, 0, 0, 0, 1, 1,
-0.4543009, -0.5906767, -1.366626, 0, 0, 0, 1, 1,
-0.4538751, -3.549607, -3.705947, 0, 0, 0, 1, 1,
-0.4527875, -0.5105376, -2.175648, 0, 0, 0, 1, 1,
-0.4513968, -0.7368997, -4.309951, 0, 0, 0, 1, 1,
-0.4510176, 1.031716, 0.1074494, 0, 0, 0, 1, 1,
-0.4500217, 0.01563013, -1.56289, 0, 0, 0, 1, 1,
-0.4499676, 0.3118009, -0.2879227, 1, 1, 1, 1, 1,
-0.4490325, 0.655849, -0.4573423, 1, 1, 1, 1, 1,
-0.445675, -0.4704611, -2.829528, 1, 1, 1, 1, 1,
-0.4453596, 1.380102, -0.3333309, 1, 1, 1, 1, 1,
-0.4411161, -0.2662665, -1.253721, 1, 1, 1, 1, 1,
-0.4401233, 1.573079, -0.3142567, 1, 1, 1, 1, 1,
-0.432331, 0.8346211, -1.003896, 1, 1, 1, 1, 1,
-0.4323056, 0.2364634, -0.6212451, 1, 1, 1, 1, 1,
-0.4263429, 1.422374, -0.2657332, 1, 1, 1, 1, 1,
-0.4239006, 1.287342, -1.324447, 1, 1, 1, 1, 1,
-0.4220433, 0.8994486, -0.7584521, 1, 1, 1, 1, 1,
-0.4214859, -0.6806489, -5.294042, 1, 1, 1, 1, 1,
-0.4121579, -0.4139283, -1.529092, 1, 1, 1, 1, 1,
-0.4114123, -0.4796957, -1.787917, 1, 1, 1, 1, 1,
-0.409754, 1.350365, -1.49121, 1, 1, 1, 1, 1,
-0.4091421, -0.7634178, -1.278292, 0, 0, 1, 1, 1,
-0.4084575, -0.09205684, -1.026369, 1, 0, 0, 1, 1,
-0.406515, -0.1403252, -1.759505, 1, 0, 0, 1, 1,
-0.4030689, -0.4169419, -2.160622, 1, 0, 0, 1, 1,
-0.4019426, -0.1396372, -1.725489, 1, 0, 0, 1, 1,
-0.3986585, 0.5458099, -0.3120511, 1, 0, 0, 1, 1,
-0.3985892, 1.895799, 1.030706, 0, 0, 0, 1, 1,
-0.3921627, 0.4633621, -1.074314, 0, 0, 0, 1, 1,
-0.3752573, 0.205977, -3.163036, 0, 0, 0, 1, 1,
-0.3584259, -0.1127849, -3.001818, 0, 0, 0, 1, 1,
-0.3538298, -1.547783, -3.736787, 0, 0, 0, 1, 1,
-0.3528916, -1.120113, -3.745493, 0, 0, 0, 1, 1,
-0.3522417, -0.2369654, -1.570085, 0, 0, 0, 1, 1,
-0.3487342, -0.6491794, -4.1869, 1, 1, 1, 1, 1,
-0.3458739, 1.066612, -0.06508791, 1, 1, 1, 1, 1,
-0.3410033, 1.117821, 0.6582401, 1, 1, 1, 1, 1,
-0.3404732, -0.6764741, -2.723523, 1, 1, 1, 1, 1,
-0.340467, -0.08981911, -0.3493957, 1, 1, 1, 1, 1,
-0.3359095, 1.242547, 0.6453865, 1, 1, 1, 1, 1,
-0.3345577, -0.3733479, -0.9641616, 1, 1, 1, 1, 1,
-0.3343162, 0.5914959, -1.589518, 1, 1, 1, 1, 1,
-0.3287406, 1.638631, -1.146857, 1, 1, 1, 1, 1,
-0.3278787, -0.3178852, -3.064445, 1, 1, 1, 1, 1,
-0.3246904, -0.262426, -1.076872, 1, 1, 1, 1, 1,
-0.3225029, 0.2630019, 0.3254191, 1, 1, 1, 1, 1,
-0.319246, 0.1005086, -2.789691, 1, 1, 1, 1, 1,
-0.3178126, 0.7642673, -1.699645, 1, 1, 1, 1, 1,
-0.3172655, -0.7178937, -2.016062, 1, 1, 1, 1, 1,
-0.315735, -0.481103, -2.991864, 0, 0, 1, 1, 1,
-0.3155463, -0.3712011, -2.9981, 1, 0, 0, 1, 1,
-0.3155187, 0.4957175, -1.882699, 1, 0, 0, 1, 1,
-0.3131904, 0.1615926, -2.010896, 1, 0, 0, 1, 1,
-0.3130821, 1.189459, -0.7621688, 1, 0, 0, 1, 1,
-0.3096288, 1.492329, -0.8124029, 1, 0, 0, 1, 1,
-0.3085521, -0.09411617, -0.4369653, 0, 0, 0, 1, 1,
-0.3073308, -1.1265, -4.278553, 0, 0, 0, 1, 1,
-0.3050567, -1.726929, -3.506392, 0, 0, 0, 1, 1,
-0.3046041, 0.3215683, -0.5774336, 0, 0, 0, 1, 1,
-0.2969776, -0.8967565, -1.583849, 0, 0, 0, 1, 1,
-0.2960037, 1.713395, 1.851962, 0, 0, 0, 1, 1,
-0.2956995, -0.3511297, -2.788258, 0, 0, 0, 1, 1,
-0.2946591, -0.17634, -1.380469, 1, 1, 1, 1, 1,
-0.2938457, 1.70013, -0.198198, 1, 1, 1, 1, 1,
-0.2911093, 0.6527076, 0.3153147, 1, 1, 1, 1, 1,
-0.2900866, 0.2684529, -1.320631, 1, 1, 1, 1, 1,
-0.2889057, 1.919894, 0.2233718, 1, 1, 1, 1, 1,
-0.2879655, 0.1465292, -1.027774, 1, 1, 1, 1, 1,
-0.287035, 1.643173, 0.2856128, 1, 1, 1, 1, 1,
-0.2857381, -0.5072881, -3.25116, 1, 1, 1, 1, 1,
-0.2737536, 0.05571654, -0.8288009, 1, 1, 1, 1, 1,
-0.2731818, 0.3985324, -0.2426843, 1, 1, 1, 1, 1,
-0.2690752, -0.5282063, -3.146997, 1, 1, 1, 1, 1,
-0.2677822, 0.09256408, -2.143794, 1, 1, 1, 1, 1,
-0.260677, -0.1589432, -2.756095, 1, 1, 1, 1, 1,
-0.2605112, 1.183851, -0.114432, 1, 1, 1, 1, 1,
-0.259344, -1.820206, -3.880835, 1, 1, 1, 1, 1,
-0.259166, 0.2960063, -0.3675815, 0, 0, 1, 1, 1,
-0.2532881, 2.013967, -0.7483961, 1, 0, 0, 1, 1,
-0.2529745, -1.299288, -4.206383, 1, 0, 0, 1, 1,
-0.2516851, -0.4544492, -3.678558, 1, 0, 0, 1, 1,
-0.2488048, -2.656999, -2.887858, 1, 0, 0, 1, 1,
-0.2479262, 1.947525, -2.141194, 1, 0, 0, 1, 1,
-0.2473915, -0.8533469, -3.346492, 0, 0, 0, 1, 1,
-0.2466396, 0.1665331, -0.160205, 0, 0, 0, 1, 1,
-0.2451296, 0.6010557, -0.4805833, 0, 0, 0, 1, 1,
-0.2434716, -0.6457674, -2.762614, 0, 0, 0, 1, 1,
-0.2425995, -0.6862684, -2.835521, 0, 0, 0, 1, 1,
-0.2419656, 0.4510359, 0.557111, 0, 0, 0, 1, 1,
-0.2415439, 0.3975191, -0.1973895, 0, 0, 0, 1, 1,
-0.2400763, -0.6380154, -2.339942, 1, 1, 1, 1, 1,
-0.2392548, -0.6492075, -1.937224, 1, 1, 1, 1, 1,
-0.2326114, -0.8125335, -4.280973, 1, 1, 1, 1, 1,
-0.2302878, 0.9777614, -2.558913, 1, 1, 1, 1, 1,
-0.2266307, -1.182326, -2.803868, 1, 1, 1, 1, 1,
-0.2262793, 0.1549448, -2.683234, 1, 1, 1, 1, 1,
-0.2210436, 0.5336413, -0.7274356, 1, 1, 1, 1, 1,
-0.2195643, -0.4021938, -2.314914, 1, 1, 1, 1, 1,
-0.2194999, -0.5768226, -2.434165, 1, 1, 1, 1, 1,
-0.2154631, -0.4766167, -2.111035, 1, 1, 1, 1, 1,
-0.2145732, -0.8349859, -2.542617, 1, 1, 1, 1, 1,
-0.2126898, -1.56985, -4.500964, 1, 1, 1, 1, 1,
-0.2119021, 0.1920085, 0.1669895, 1, 1, 1, 1, 1,
-0.2110381, -0.7216346, -3.948511, 1, 1, 1, 1, 1,
-0.2109866, 1.43996, 0.2075464, 1, 1, 1, 1, 1,
-0.2069379, 1.303464, 0.02211513, 0, 0, 1, 1, 1,
-0.2068646, -0.2266919, -4.840093, 1, 0, 0, 1, 1,
-0.1995356, -0.4001918, -2.618107, 1, 0, 0, 1, 1,
-0.1962129, -0.7759963, -1.341195, 1, 0, 0, 1, 1,
-0.1897672, -1.813164, -4.570058, 1, 0, 0, 1, 1,
-0.1860317, 0.6105875, -1.923592, 1, 0, 0, 1, 1,
-0.1806328, 1.028435, -0.2465724, 0, 0, 0, 1, 1,
-0.1773664, 1.342645, -1.356308, 0, 0, 0, 1, 1,
-0.177003, -0.3081822, -3.282668, 0, 0, 0, 1, 1,
-0.1769365, 1.212842, -2.209091, 0, 0, 0, 1, 1,
-0.1764743, 0.8925402, 0.9217513, 0, 0, 0, 1, 1,
-0.1736296, 1.255996, 1.320915, 0, 0, 0, 1, 1,
-0.1715511, -0.656176, -3.178871, 0, 0, 0, 1, 1,
-0.1708895, -0.5227647, -3.355809, 1, 1, 1, 1, 1,
-0.1697879, 1.224129, 0.5167913, 1, 1, 1, 1, 1,
-0.1679791, -1.092427, 0.8568195, 1, 1, 1, 1, 1,
-0.155617, 0.2052392, -0.975746, 1, 1, 1, 1, 1,
-0.1539789, -0.8210251, -1.703278, 1, 1, 1, 1, 1,
-0.1537963, -1.056306, -3.035338, 1, 1, 1, 1, 1,
-0.1522486, 0.3977154, -1.702662, 1, 1, 1, 1, 1,
-0.1510408, -1.976496, -4.982136, 1, 1, 1, 1, 1,
-0.1491816, -1.047243, -3.371615, 1, 1, 1, 1, 1,
-0.1480019, 0.7480626, -0.2156205, 1, 1, 1, 1, 1,
-0.1477533, -0.7958499, -3.795904, 1, 1, 1, 1, 1,
-0.1446765, -0.4420815, -2.436202, 1, 1, 1, 1, 1,
-0.1411941, 0.794992, -0.1011713, 1, 1, 1, 1, 1,
-0.1374419, 1.161639, -3.397331, 1, 1, 1, 1, 1,
-0.135966, 0.1360464, -1.853284, 1, 1, 1, 1, 1,
-0.134222, -0.3512401, -2.876364, 0, 0, 1, 1, 1,
-0.1325916, 1.050976, 0.9558532, 1, 0, 0, 1, 1,
-0.1325445, -0.05531909, -3.487286, 1, 0, 0, 1, 1,
-0.1310689, 0.4390045, -2.022115, 1, 0, 0, 1, 1,
-0.1288169, 0.2250164, -0.08922842, 1, 0, 0, 1, 1,
-0.1288035, -1.420277, -3.180728, 1, 0, 0, 1, 1,
-0.1284867, -0.9615402, -2.166672, 0, 0, 0, 1, 1,
-0.1257134, 1.237993, 0.4115879, 0, 0, 0, 1, 1,
-0.124708, -0.2508066, -1.338621, 0, 0, 0, 1, 1,
-0.124538, 0.5470017, -1.595037, 0, 0, 0, 1, 1,
-0.1211936, -1.080651, -4.319104, 0, 0, 0, 1, 1,
-0.1197712, 0.3999036, -0.9145212, 0, 0, 0, 1, 1,
-0.1180413, -0.9620982, -3.350448, 0, 0, 0, 1, 1,
-0.1160142, 1.655239, -1.99453, 1, 1, 1, 1, 1,
-0.1105473, -0.848996, -1.277696, 1, 1, 1, 1, 1,
-0.1097688, -1.026863, -3.613072, 1, 1, 1, 1, 1,
-0.1084768, -1.918931, -3.759815, 1, 1, 1, 1, 1,
-0.1067526, 1.805321, 0.09696186, 1, 1, 1, 1, 1,
-0.1064509, -0.009236605, -1.229469, 1, 1, 1, 1, 1,
-0.10622, -2.573449, -2.60195, 1, 1, 1, 1, 1,
-0.1049976, 0.2209545, 0.337414, 1, 1, 1, 1, 1,
-0.1041526, 0.8399916, -1.324111, 1, 1, 1, 1, 1,
-0.09736981, -0.8478438, -2.635682, 1, 1, 1, 1, 1,
-0.09382402, -0.5958175, -3.718598, 1, 1, 1, 1, 1,
-0.09049536, 1.049957, -0.898917, 1, 1, 1, 1, 1,
-0.08996083, -0.04419426, -2.272424, 1, 1, 1, 1, 1,
-0.08678003, -0.6684662, -4.030889, 1, 1, 1, 1, 1,
-0.08574968, 0.8667708, 1.061167, 1, 1, 1, 1, 1,
-0.08507092, -0.6776191, -4.675388, 0, 0, 1, 1, 1,
-0.08431966, -1.22458, -2.199803, 1, 0, 0, 1, 1,
-0.08063858, -0.8336387, -3.937398, 1, 0, 0, 1, 1,
-0.07812072, -0.2438726, -0.6754283, 1, 0, 0, 1, 1,
-0.07772896, 0.6071741, 0.3731893, 1, 0, 0, 1, 1,
-0.077445, -0.5759338, -2.363173, 1, 0, 0, 1, 1,
-0.07383093, 0.5418901, 0.4585656, 0, 0, 0, 1, 1,
-0.07357208, -0.375255, -1.950226, 0, 0, 0, 1, 1,
-0.07309641, 0.03834, 0.6524922, 0, 0, 0, 1, 1,
-0.07268344, -1.248452, -2.023127, 0, 0, 0, 1, 1,
-0.07256784, 1.912268, -0.8872398, 0, 0, 0, 1, 1,
-0.0714126, 0.08271262, -1.424776, 0, 0, 0, 1, 1,
-0.06876715, 0.4036463, -1.122575, 0, 0, 0, 1, 1,
-0.06749801, -1.011386, -4.837292, 1, 1, 1, 1, 1,
-0.06728235, 0.8834147, 0.099204, 1, 1, 1, 1, 1,
-0.06725389, -1.163614, -4.460694, 1, 1, 1, 1, 1,
-0.06388451, 0.04276238, -1.804151, 1, 1, 1, 1, 1,
-0.06340368, 1.747999, 1.074084, 1, 1, 1, 1, 1,
-0.06207807, 1.079812, 0.4300945, 1, 1, 1, 1, 1,
-0.05975689, -0.07279322, -2.857634, 1, 1, 1, 1, 1,
-0.05871233, 0.0782856, 0.1343068, 1, 1, 1, 1, 1,
-0.05620341, -0.1022179, -3.266899, 1, 1, 1, 1, 1,
-0.05587116, 1.75284, 0.7998778, 1, 1, 1, 1, 1,
-0.05272909, -0.6695632, -2.64318, 1, 1, 1, 1, 1,
-0.05149784, 0.3383886, -1.855071, 1, 1, 1, 1, 1,
-0.05034015, -0.8395073, -3.782823, 1, 1, 1, 1, 1,
-0.04933314, 1.206976, -0.9692007, 1, 1, 1, 1, 1,
-0.04803906, -1.043539, -4.216166, 1, 1, 1, 1, 1,
-0.04796803, -0.08764732, -1.990518, 0, 0, 1, 1, 1,
-0.0443788, -1.31004, -4.064807, 1, 0, 0, 1, 1,
-0.03762754, 0.06998707, 0.01206748, 1, 0, 0, 1, 1,
-0.03598043, -0.522862, -1.495564, 1, 0, 0, 1, 1,
-0.03132531, -0.5433822, -2.974761, 1, 0, 0, 1, 1,
-0.03131665, -0.6661191, -2.045282, 1, 0, 0, 1, 1,
-0.02934454, 0.3759903, 0.2505211, 0, 0, 0, 1, 1,
-0.02634798, -0.1811191, -2.49106, 0, 0, 0, 1, 1,
-0.01965594, 0.4565196, -0.9755262, 0, 0, 0, 1, 1,
-0.01841198, -0.61801, -3.994606, 0, 0, 0, 1, 1,
-0.01777217, -0.2127862, -3.453836, 0, 0, 0, 1, 1,
-0.01501369, -1.557197, -1.999021, 0, 0, 0, 1, 1,
-0.01419378, -0.03409296, -2.06274, 0, 0, 0, 1, 1,
-0.01246656, 1.283847, -1.082735, 1, 1, 1, 1, 1,
-0.009574841, 0.6523834, 1.262307, 1, 1, 1, 1, 1,
-0.009268347, 0.4650034, 0.3776884, 1, 1, 1, 1, 1,
-0.008769075, 1.584504, -0.6299108, 1, 1, 1, 1, 1,
-0.008698441, 0.6961777, 0.4353043, 1, 1, 1, 1, 1,
-0.001386251, -0.07017431, -2.955, 1, 1, 1, 1, 1,
0.00396205, 0.07561337, -0.2680234, 1, 1, 1, 1, 1,
0.005212809, -0.3275341, 3.806044, 1, 1, 1, 1, 1,
0.005747162, -0.3677308, 1.5108, 1, 1, 1, 1, 1,
0.00808418, -0.1809908, 3.847971, 1, 1, 1, 1, 1,
0.008841956, 0.06500869, -0.2315011, 1, 1, 1, 1, 1,
0.008844694, -0.126386, 2.256211, 1, 1, 1, 1, 1,
0.009717983, 1.490695, 0.5780447, 1, 1, 1, 1, 1,
0.01064409, 0.7338051, 0.3926619, 1, 1, 1, 1, 1,
0.01163007, 1.31776, -0.6239909, 1, 1, 1, 1, 1,
0.01328268, 0.1415077, 0.7602023, 0, 0, 1, 1, 1,
0.01337545, -1.151059, 2.659673, 1, 0, 0, 1, 1,
0.01367985, -0.0103732, 2.288454, 1, 0, 0, 1, 1,
0.01684335, 0.08092616, 0.8028678, 1, 0, 0, 1, 1,
0.01955399, -0.2715692, 1.578867, 1, 0, 0, 1, 1,
0.02040547, -1.159389, 2.690855, 1, 0, 0, 1, 1,
0.02263665, -0.212198, 3.380101, 0, 0, 0, 1, 1,
0.0269652, -0.7528884, 2.935383, 0, 0, 0, 1, 1,
0.03315096, -0.3989077, 2.112539, 0, 0, 0, 1, 1,
0.03442851, -0.8634123, 3.059644, 0, 0, 0, 1, 1,
0.04003884, 1.038788, 1.163041, 0, 0, 0, 1, 1,
0.04034476, -0.8850885, 5.193218, 0, 0, 0, 1, 1,
0.04181056, -0.4968864, 2.735733, 0, 0, 0, 1, 1,
0.04375502, 0.5334824, 0.5542166, 1, 1, 1, 1, 1,
0.04395814, 0.4714587, -1.217686, 1, 1, 1, 1, 1,
0.04681166, 0.2372314, -0.7848549, 1, 1, 1, 1, 1,
0.05929152, -1.939685, 3.538107, 1, 1, 1, 1, 1,
0.06417865, 0.6964965, 0.3499357, 1, 1, 1, 1, 1,
0.06651115, -0.1993024, 1.460629, 1, 1, 1, 1, 1,
0.06763426, -0.3022578, 4.640113, 1, 1, 1, 1, 1,
0.06974689, -0.3203101, 3.435779, 1, 1, 1, 1, 1,
0.07460934, -0.364162, 4.38523, 1, 1, 1, 1, 1,
0.07607468, 0.1142987, 1.370484, 1, 1, 1, 1, 1,
0.07704774, 0.869328, 2.074155, 1, 1, 1, 1, 1,
0.07714429, 1.00951, 1.516604, 1, 1, 1, 1, 1,
0.09130963, -0.2767991, 3.885292, 1, 1, 1, 1, 1,
0.09156306, 0.03790893, -0.09578252, 1, 1, 1, 1, 1,
0.09440179, 0.8842868, 0.6638212, 1, 1, 1, 1, 1,
0.09460999, 1.430113, -2.677621, 0, 0, 1, 1, 1,
0.09484532, -0.3336582, 2.672834, 1, 0, 0, 1, 1,
0.1010867, 0.09855876, 1.815724, 1, 0, 0, 1, 1,
0.1082387, -1.130961, 2.536362, 1, 0, 0, 1, 1,
0.108625, 0.8503169, 0.8198752, 1, 0, 0, 1, 1,
0.1101364, 1.417636, 0.1802308, 1, 0, 0, 1, 1,
0.1103295, 1.08853, -0.6256386, 0, 0, 0, 1, 1,
0.1117908, 0.09695426, 1.219221, 0, 0, 0, 1, 1,
0.1122218, -1.40203, 2.964333, 0, 0, 0, 1, 1,
0.1125436, 2.076715, -0.06093449, 0, 0, 0, 1, 1,
0.1212639, 1.363027, -0.5318191, 0, 0, 0, 1, 1,
0.1216241, 2.399858, -0.6233624, 0, 0, 0, 1, 1,
0.1235183, -0.829547, 3.420597, 0, 0, 0, 1, 1,
0.1255102, 0.4354727, -0.6559058, 1, 1, 1, 1, 1,
0.1255665, 0.1600608, -0.5011774, 1, 1, 1, 1, 1,
0.1271621, 0.8626727, 1.321134, 1, 1, 1, 1, 1,
0.1272331, 0.197528, 0.5506884, 1, 1, 1, 1, 1,
0.1288004, -1.441101, 3.766854, 1, 1, 1, 1, 1,
0.1291833, -1.168179, 3.497104, 1, 1, 1, 1, 1,
0.1320649, -0.8199835, 2.1118, 1, 1, 1, 1, 1,
0.133121, 1.494484, 0.01542716, 1, 1, 1, 1, 1,
0.1336447, -0.9489442, 1.185435, 1, 1, 1, 1, 1,
0.1418198, -1.477673, 3.451845, 1, 1, 1, 1, 1,
0.1557737, 0.4431643, 0.2466565, 1, 1, 1, 1, 1,
0.1580144, 1.019679, 1.844425, 1, 1, 1, 1, 1,
0.1622117, 0.4685166, 2.221946, 1, 1, 1, 1, 1,
0.164213, 1.084462, -1.190892, 1, 1, 1, 1, 1,
0.1789667, 0.1750489, 1.533627, 1, 1, 1, 1, 1,
0.1832093, -0.05598911, 1.362011, 0, 0, 1, 1, 1,
0.1841892, 0.5968716, -1.063407, 1, 0, 0, 1, 1,
0.1902301, 0.5016744, 1.08519, 1, 0, 0, 1, 1,
0.1905579, 0.2786378, 0.1973984, 1, 0, 0, 1, 1,
0.1916219, 1.297058, -0.4801609, 1, 0, 0, 1, 1,
0.191993, 0.4573203, -0.4150995, 1, 0, 0, 1, 1,
0.1919933, 0.9619746, -0.3718175, 0, 0, 0, 1, 1,
0.193211, -0.8568312, 2.152425, 0, 0, 0, 1, 1,
0.2009582, 0.0105519, 1.019054, 0, 0, 0, 1, 1,
0.205521, -0.7660541, 1.750227, 0, 0, 0, 1, 1,
0.2056057, -0.07885402, 1.812621, 0, 0, 0, 1, 1,
0.2067671, -2.227831, 3.232278, 0, 0, 0, 1, 1,
0.2090803, -0.1186252, 3.168117, 0, 0, 0, 1, 1,
0.2112542, 1.630095, -0.3376265, 1, 1, 1, 1, 1,
0.2133934, 0.3727784, 1.307428, 1, 1, 1, 1, 1,
0.2146374, 0.7371433, -0.1941225, 1, 1, 1, 1, 1,
0.2194666, -0.6962095, 3.714366, 1, 1, 1, 1, 1,
0.2241535, 0.0678526, 0.9710993, 1, 1, 1, 1, 1,
0.2243379, 0.009170962, 1.949488, 1, 1, 1, 1, 1,
0.2247876, -0.008575151, 0.3107422, 1, 1, 1, 1, 1,
0.2258549, 0.672238, 0.6868652, 1, 1, 1, 1, 1,
0.2293551, -0.6751163, 3.491538, 1, 1, 1, 1, 1,
0.2310595, 1.415738, 1.765957, 1, 1, 1, 1, 1,
0.2360854, 1.006676, 0.8551927, 1, 1, 1, 1, 1,
0.239209, 1.159965, 0.1893761, 1, 1, 1, 1, 1,
0.2406422, -1.632005, 3.24258, 1, 1, 1, 1, 1,
0.2430596, 0.3588945, 2.049588, 1, 1, 1, 1, 1,
0.2454818, 0.9119471, -0.9341404, 1, 1, 1, 1, 1,
0.2457111, 0.8299944, -0.05926508, 0, 0, 1, 1, 1,
0.2464065, -0.9648179, 4.012396, 1, 0, 0, 1, 1,
0.2475329, 0.1899079, 0.8007146, 1, 0, 0, 1, 1,
0.2482009, 0.2103458, 0.5664992, 1, 0, 0, 1, 1,
0.2491156, 0.09299842, 1.575153, 1, 0, 0, 1, 1,
0.2504135, -0.3887653, 2.085076, 1, 0, 0, 1, 1,
0.2539077, -0.7066913, 1.369203, 0, 0, 0, 1, 1,
0.2540411, 0.361687, 0.6268172, 0, 0, 0, 1, 1,
0.2565557, -0.3583661, 3.326918, 0, 0, 0, 1, 1,
0.2606538, 0.3985022, 0.9807595, 0, 0, 0, 1, 1,
0.264135, -0.7502314, 2.539861, 0, 0, 0, 1, 1,
0.2644387, 1.057138, 0.3952734, 0, 0, 0, 1, 1,
0.266138, 0.9416552, 0.1938166, 0, 0, 0, 1, 1,
0.2663523, 0.8722565, -0.07404216, 1, 1, 1, 1, 1,
0.2675173, -0.6328135, 2.526326, 1, 1, 1, 1, 1,
0.2691867, 0.5465656, 2.149673, 1, 1, 1, 1, 1,
0.2728897, -0.02622564, 0.007339471, 1, 1, 1, 1, 1,
0.2730899, 0.2365528, 1.749649, 1, 1, 1, 1, 1,
0.2745162, 0.9428272, 1.228563, 1, 1, 1, 1, 1,
0.2758171, 0.8204877, -0.2766419, 1, 1, 1, 1, 1,
0.2763208, -2.014589, 4.864293, 1, 1, 1, 1, 1,
0.2778554, -0.4589659, 3.225131, 1, 1, 1, 1, 1,
0.2787921, -1.646278, 2.915228, 1, 1, 1, 1, 1,
0.2793422, -0.7696443, 1.978792, 1, 1, 1, 1, 1,
0.2801161, 0.8149921, 0.8530691, 1, 1, 1, 1, 1,
0.2807703, 0.8461069, 1.597477, 1, 1, 1, 1, 1,
0.2812997, -0.1978322, 2.74055, 1, 1, 1, 1, 1,
0.2829957, -0.5360705, 3.133959, 1, 1, 1, 1, 1,
0.2904576, -0.1076899, 1.286836, 0, 0, 1, 1, 1,
0.290794, 0.5586162, -0.09654722, 1, 0, 0, 1, 1,
0.2921976, 0.6007986, 0.7316034, 1, 0, 0, 1, 1,
0.2925196, -0.6931788, 1.858579, 1, 0, 0, 1, 1,
0.2978219, 0.7215334, -0.1591102, 1, 0, 0, 1, 1,
0.3051541, -0.8290257, 2.718801, 1, 0, 0, 1, 1,
0.3084701, 1.197533, 0.6097645, 0, 0, 0, 1, 1,
0.3093425, -0.5063348, 4.4911, 0, 0, 0, 1, 1,
0.3101251, 0.2312365, 2.173262, 0, 0, 0, 1, 1,
0.3120326, -0.7718995, 4.191393, 0, 0, 0, 1, 1,
0.3128819, -0.5297325, 2.683733, 0, 0, 0, 1, 1,
0.3133906, -0.3147667, 1.527609, 0, 0, 0, 1, 1,
0.3152648, -1.337917, 4.495012, 0, 0, 0, 1, 1,
0.3257633, -0.7284999, 2.592704, 1, 1, 1, 1, 1,
0.3282829, 0.2592628, 1.376506, 1, 1, 1, 1, 1,
0.3315189, 1.441242, -0.07206625, 1, 1, 1, 1, 1,
0.339224, 1.436412, 2.005879, 1, 1, 1, 1, 1,
0.3405378, -0.1033146, 1.125612, 1, 1, 1, 1, 1,
0.3493212, 0.1159889, 1.95511, 1, 1, 1, 1, 1,
0.3500374, -1.160197, 3.156828, 1, 1, 1, 1, 1,
0.3503077, -1.49787, 3.950389, 1, 1, 1, 1, 1,
0.3546549, -0.1337924, 0.7677826, 1, 1, 1, 1, 1,
0.3627681, -0.1301598, 4.005478, 1, 1, 1, 1, 1,
0.3666783, -0.05961074, 2.131515, 1, 1, 1, 1, 1,
0.3710682, 0.9711118, 0.2858741, 1, 1, 1, 1, 1,
0.3733697, -1.566674, 2.305156, 1, 1, 1, 1, 1,
0.3736234, -0.7708417, 3.383675, 1, 1, 1, 1, 1,
0.3822918, 0.349406, 2.290124, 1, 1, 1, 1, 1,
0.3881313, -2.275453, 2.287886, 0, 0, 1, 1, 1,
0.392391, 0.7092505, -1.544452, 1, 0, 0, 1, 1,
0.3938071, 1.208158, 0.4184844, 1, 0, 0, 1, 1,
0.3967752, 0.575592, 1.574775, 1, 0, 0, 1, 1,
0.3998397, -0.4140013, 2.202528, 1, 0, 0, 1, 1,
0.4015801, 0.3471479, 0.8778802, 1, 0, 0, 1, 1,
0.4023032, -0.5609413, 3.691788, 0, 0, 0, 1, 1,
0.4043224, -0.5459784, 2.14315, 0, 0, 0, 1, 1,
0.4057151, 0.593332, -0.3120936, 0, 0, 0, 1, 1,
0.4093995, -0.6923027, 5.211412, 0, 0, 0, 1, 1,
0.4103586, -0.3428209, 2.851619, 0, 0, 0, 1, 1,
0.411365, 0.8136458, -0.6921412, 0, 0, 0, 1, 1,
0.4126088, -0.4298392, 3.382301, 0, 0, 0, 1, 1,
0.4131501, 2.092754, 0.6595517, 1, 1, 1, 1, 1,
0.4193595, -1.062265, 3.523758, 1, 1, 1, 1, 1,
0.4206682, 0.2574203, -0.1317017, 1, 1, 1, 1, 1,
0.4255569, -1.325723, 2.779712, 1, 1, 1, 1, 1,
0.4265353, 0.337083, 2.16233, 1, 1, 1, 1, 1,
0.4273531, -1.715834, 2.603956, 1, 1, 1, 1, 1,
0.4281493, 0.6190047, 1.331964, 1, 1, 1, 1, 1,
0.4303242, 0.4580355, 2.524516, 1, 1, 1, 1, 1,
0.4426538, -1.674537, 3.818767, 1, 1, 1, 1, 1,
0.4432419, -1.047596, 3.456384, 1, 1, 1, 1, 1,
0.4435324, 0.04259453, 2.342586, 1, 1, 1, 1, 1,
0.4458542, -0.6284847, 1.532864, 1, 1, 1, 1, 1,
0.4479046, 1.54644, -0.6906478, 1, 1, 1, 1, 1,
0.4481339, 1.699818, 1.143899, 1, 1, 1, 1, 1,
0.4499997, -0.6903908, 4.041296, 1, 1, 1, 1, 1,
0.450772, 0.5668778, -0.5607567, 0, 0, 1, 1, 1,
0.451371, 0.1136496, 1.092428, 1, 0, 0, 1, 1,
0.4555913, 1.271074, -0.6716069, 1, 0, 0, 1, 1,
0.4585855, -1.781329, -0.30466, 1, 0, 0, 1, 1,
0.460389, 0.3091014, 1.780955, 1, 0, 0, 1, 1,
0.4605508, -2.26018, 4.138489, 1, 0, 0, 1, 1,
0.4687279, -0.7858121, 2.351563, 0, 0, 0, 1, 1,
0.4762131, -0.4251817, 1.932955, 0, 0, 0, 1, 1,
0.4790677, -0.1174549, 1.951681, 0, 0, 0, 1, 1,
0.4865763, -0.8210279, 1.756555, 0, 0, 0, 1, 1,
0.4914724, -0.6736847, 2.401172, 0, 0, 0, 1, 1,
0.4970048, 0.3504169, 1.299582, 0, 0, 0, 1, 1,
0.5010374, -0.2551738, 3.400438, 0, 0, 0, 1, 1,
0.5012708, 0.5065372, -0.3297972, 1, 1, 1, 1, 1,
0.5021363, 0.007973637, 1.831171, 1, 1, 1, 1, 1,
0.5038978, -0.4714144, 2.430331, 1, 1, 1, 1, 1,
0.503952, 0.07535409, 0.4453762, 1, 1, 1, 1, 1,
0.5058651, 0.08150791, 1.942471, 1, 1, 1, 1, 1,
0.5101531, 0.07532921, 0.9924392, 1, 1, 1, 1, 1,
0.5105377, -0.8589308, 2.797642, 1, 1, 1, 1, 1,
0.5135667, 0.2149754, 1.047286, 1, 1, 1, 1, 1,
0.5139057, -0.358069, 0.5412102, 1, 1, 1, 1, 1,
0.5141847, 0.4057358, 2.49053, 1, 1, 1, 1, 1,
0.5182358, 0.4320858, 0.002045784, 1, 1, 1, 1, 1,
0.5194952, -0.8562999, 1.830392, 1, 1, 1, 1, 1,
0.5214971, 0.6866131, 0.1141833, 1, 1, 1, 1, 1,
0.5244683, -1.013967, 2.593926, 1, 1, 1, 1, 1,
0.5256273, -0.239412, 3.492098, 1, 1, 1, 1, 1,
0.5263281, -0.06269904, 1.775861, 0, 0, 1, 1, 1,
0.5265429, -0.5211957, 3.734581, 1, 0, 0, 1, 1,
0.5277874, 0.640238, 0.6639254, 1, 0, 0, 1, 1,
0.5286742, -0.5649367, 2.382824, 1, 0, 0, 1, 1,
0.5289047, 0.8542037, -0.0009845125, 1, 0, 0, 1, 1,
0.5353108, 0.1633326, 0.3245589, 1, 0, 0, 1, 1,
0.5388518, 0.01885684, 2.586662, 0, 0, 0, 1, 1,
0.5444862, -0.8191819, 2.325803, 0, 0, 0, 1, 1,
0.5482515, -0.158777, 1.371701, 0, 0, 0, 1, 1,
0.5484961, 0.6564372, 0.2391995, 0, 0, 0, 1, 1,
0.5510444, -0.3644907, 1.814364, 0, 0, 0, 1, 1,
0.5547814, -1.172294, 4.143981, 0, 0, 0, 1, 1,
0.5576956, 0.456758, 0.7875768, 0, 0, 0, 1, 1,
0.5612725, 0.6022645, -0.4586077, 1, 1, 1, 1, 1,
0.5648835, 0.06684957, 1.248583, 1, 1, 1, 1, 1,
0.5667375, 0.9004036, 1.170474, 1, 1, 1, 1, 1,
0.5686321, -0.2272094, 2.524411, 1, 1, 1, 1, 1,
0.571124, -0.908505, 3.774925, 1, 1, 1, 1, 1,
0.5719103, 2.094677, -0.4059014, 1, 1, 1, 1, 1,
0.5730127, -0.1342314, 1.279114, 1, 1, 1, 1, 1,
0.5758762, -2.184902, 2.518953, 1, 1, 1, 1, 1,
0.5763184, 0.6797733, 1.445036, 1, 1, 1, 1, 1,
0.5767925, 0.7529173, 0.2848478, 1, 1, 1, 1, 1,
0.5782902, 1.416024, 2.51985, 1, 1, 1, 1, 1,
0.5860847, 0.4440021, 1.132225, 1, 1, 1, 1, 1,
0.5881095, -0.8611814, 1.300623, 1, 1, 1, 1, 1,
0.590176, 0.6602865, 0.6058279, 1, 1, 1, 1, 1,
0.5947962, 0.6747231, 0.5713271, 1, 1, 1, 1, 1,
0.594821, -0.539224, 3.639198, 0, 0, 1, 1, 1,
0.5959849, 0.4310755, -0.05125434, 1, 0, 0, 1, 1,
0.5961277, 0.04912699, 1.828963, 1, 0, 0, 1, 1,
0.5971702, -0.2043086, 1.956381, 1, 0, 0, 1, 1,
0.5987526, 0.5527768, 1.057881, 1, 0, 0, 1, 1,
0.6001491, 0.1752136, 0.3028447, 1, 0, 0, 1, 1,
0.6025867, 0.4046939, -0.06517164, 0, 0, 0, 1, 1,
0.6061691, -0.4116152, 1.821189, 0, 0, 0, 1, 1,
0.6090697, -0.8335632, 1.827029, 0, 0, 0, 1, 1,
0.6151744, -0.02841042, 0.4031841, 0, 0, 0, 1, 1,
0.6231821, -0.9627482, 3.944334, 0, 0, 0, 1, 1,
0.629055, 1.357488, -0.3063979, 0, 0, 0, 1, 1,
0.631996, -0.8600672, 3.078022, 0, 0, 0, 1, 1,
0.6332479, -0.2108703, 3.835971, 1, 1, 1, 1, 1,
0.6397405, 1.661316, -1.672496, 1, 1, 1, 1, 1,
0.6440677, -0.878018, 4.04469, 1, 1, 1, 1, 1,
0.6449383, 0.4060488, 2.312987, 1, 1, 1, 1, 1,
0.6483489, -1.221961, 1.452074, 1, 1, 1, 1, 1,
0.6493034, -0.7053505, 2.719918, 1, 1, 1, 1, 1,
0.6517579, -2.178982, 2.578207, 1, 1, 1, 1, 1,
0.6535788, -0.9013721, 0.7570473, 1, 1, 1, 1, 1,
0.6551863, 1.576401, 2.594619, 1, 1, 1, 1, 1,
0.6575781, -1.956924, 1.966806, 1, 1, 1, 1, 1,
0.660458, -2.341968, 2.54811, 1, 1, 1, 1, 1,
0.6620457, 1.272674, 2.4177, 1, 1, 1, 1, 1,
0.6645769, -0.0117049, 0.4970316, 1, 1, 1, 1, 1,
0.6646662, 0.791807, 1.977195, 1, 1, 1, 1, 1,
0.66861, 0.03448603, 0.7911249, 1, 1, 1, 1, 1,
0.6687478, 0.3387333, 1.551148, 0, 0, 1, 1, 1,
0.6795775, 0.7814334, -1.452661, 1, 0, 0, 1, 1,
0.6797576, 2.560814, 1.806311, 1, 0, 0, 1, 1,
0.6888877, 1.767895, -0.496253, 1, 0, 0, 1, 1,
0.6919353, 1.532399, 0.1130637, 1, 0, 0, 1, 1,
0.7037349, -0.7888622, 3.153767, 1, 0, 0, 1, 1,
0.7061815, -0.3582479, 1.785198, 0, 0, 0, 1, 1,
0.7103984, -0.1549899, 1.778823, 0, 0, 0, 1, 1,
0.7137366, -0.5285861, 1.199252, 0, 0, 0, 1, 1,
0.7178741, -0.118572, 0.3151837, 0, 0, 0, 1, 1,
0.7220736, 0.293079, 1.224528, 0, 0, 0, 1, 1,
0.7245427, -1.041711, 1.110445, 0, 0, 0, 1, 1,
0.7301522, -0.3172625, 0.576484, 0, 0, 0, 1, 1,
0.7308927, 2.580784, 0.5807772, 1, 1, 1, 1, 1,
0.7350517, -1.133826, 1.48273, 1, 1, 1, 1, 1,
0.7401873, 0.4478021, 0.7360854, 1, 1, 1, 1, 1,
0.7476059, 1.810239, 1.315344, 1, 1, 1, 1, 1,
0.7530482, 1.270056, -1.163111, 1, 1, 1, 1, 1,
0.7533416, -1.771777, 2.797856, 1, 1, 1, 1, 1,
0.7561377, 1.361324, -0.2939622, 1, 1, 1, 1, 1,
0.7565006, -0.5565702, 5.11251, 1, 1, 1, 1, 1,
0.7594782, -1.922197, 3.178965, 1, 1, 1, 1, 1,
0.760825, 1.076503, 1.019265, 1, 1, 1, 1, 1,
0.7637089, 0.9946966, 0.6391261, 1, 1, 1, 1, 1,
0.7637998, 0.5209972, 1.298543, 1, 1, 1, 1, 1,
0.7643459, 0.0061023, 2.093177, 1, 1, 1, 1, 1,
0.7683911, 0.06515995, 1.566974, 1, 1, 1, 1, 1,
0.7690259, -0.9270847, 1.937182, 1, 1, 1, 1, 1,
0.7692549, 0.1359809, 3.583829, 0, 0, 1, 1, 1,
0.7817292, -0.8790357, 3.383831, 1, 0, 0, 1, 1,
0.7864325, -0.8458285, 2.032417, 1, 0, 0, 1, 1,
0.7867098, 2.565202, -0.2934458, 1, 0, 0, 1, 1,
0.7950386, -0.4604512, 1.850931, 1, 0, 0, 1, 1,
0.8001325, 0.02104697, 1.299281, 1, 0, 0, 1, 1,
0.8028033, 0.7195645, 1.799268, 0, 0, 0, 1, 1,
0.8039576, 1.067756, 2.018497, 0, 0, 0, 1, 1,
0.8042593, 0.4391619, 0.6577505, 0, 0, 0, 1, 1,
0.8104877, -1.137384, 2.619151, 0, 0, 0, 1, 1,
0.810818, -1.04378, 2.952137, 0, 0, 0, 1, 1,
0.8169224, -0.7707669, 1.260797, 0, 0, 0, 1, 1,
0.8195475, -0.5330173, 1.621004, 0, 0, 0, 1, 1,
0.8220738, 0.709886, 0.241116, 1, 1, 1, 1, 1,
0.8241474, 1.133081, 0.9701476, 1, 1, 1, 1, 1,
0.8262352, -2.044427, 6.10616, 1, 1, 1, 1, 1,
0.8291892, 0.591486, 1.078447, 1, 1, 1, 1, 1,
0.830171, 0.5940431, 0.8371899, 1, 1, 1, 1, 1,
0.8335449, -0.5809814, 1.597279, 1, 1, 1, 1, 1,
0.8404751, -0.7021022, 1.987514, 1, 1, 1, 1, 1,
0.8443408, 0.2195484, 2.537941, 1, 1, 1, 1, 1,
0.8507211, 1.19652, 1.563848, 1, 1, 1, 1, 1,
0.8524626, 0.02941876, 1.333477, 1, 1, 1, 1, 1,
0.8570241, -0.1714647, 2.964718, 1, 1, 1, 1, 1,
0.8583573, 1.329257, 1.964335, 1, 1, 1, 1, 1,
0.8594074, -1.719615, 0.4161381, 1, 1, 1, 1, 1,
0.8615652, -1.465367, 2.522141, 1, 1, 1, 1, 1,
0.8638867, 0.9379503, 2.020092, 1, 1, 1, 1, 1,
0.8643715, -0.5911641, 1.90708, 0, 0, 1, 1, 1,
0.8688304, 2.07023, 1.182174, 1, 0, 0, 1, 1,
0.870469, 1.480037, 0.6799039, 1, 0, 0, 1, 1,
0.8729997, -0.3002512, 2.327438, 1, 0, 0, 1, 1,
0.8758805, -0.6579049, 1.097521, 1, 0, 0, 1, 1,
0.876657, 0.7255452, 2.477244, 1, 0, 0, 1, 1,
0.8771337, 1.363951, 1.277298, 0, 0, 0, 1, 1,
0.8804109, -0.009184483, 1.668126, 0, 0, 0, 1, 1,
0.8874434, 0.5504224, 0.9360179, 0, 0, 0, 1, 1,
0.8981694, 0.3064565, 2.386531, 0, 0, 0, 1, 1,
0.9040134, -0.7591984, 2.087776, 0, 0, 0, 1, 1,
0.908392, 1.096145, 1.320213, 0, 0, 0, 1, 1,
0.917698, 0.6769617, 0.8182684, 0, 0, 0, 1, 1,
0.9209634, 0.8966346, 4.018988, 1, 1, 1, 1, 1,
0.9227605, 0.06965063, 1.647653, 1, 1, 1, 1, 1,
0.9244592, 0.6596439, -0.03345672, 1, 1, 1, 1, 1,
0.9357268, 0.09003105, 1.056438, 1, 1, 1, 1, 1,
0.9402058, 0.8891048, 0.9985322, 1, 1, 1, 1, 1,
0.9446645, -0.05917158, 1.249361, 1, 1, 1, 1, 1,
0.9525541, 1.096656, 0.3706183, 1, 1, 1, 1, 1,
0.9583526, -1.509478, 4.246872, 1, 1, 1, 1, 1,
0.9646477, -0.3956663, 0.9145144, 1, 1, 1, 1, 1,
0.9648129, -0.9386683, 2.557083, 1, 1, 1, 1, 1,
0.9703972, -1.020493, 1.110002, 1, 1, 1, 1, 1,
0.9785025, 0.1239112, -0.06558425, 1, 1, 1, 1, 1,
0.9807823, -0.4230737, 2.049543, 1, 1, 1, 1, 1,
0.9827321, 0.4866536, 2.328505, 1, 1, 1, 1, 1,
0.9862886, -0.2633033, 3.162835, 1, 1, 1, 1, 1,
0.9900214, -0.1098793, 1.121074, 0, 0, 1, 1, 1,
0.9989568, -0.2146233, 1.747607, 1, 0, 0, 1, 1,
1.000382, 1.083632, -0.8796873, 1, 0, 0, 1, 1,
1.00096, 0.02310932, 3.220678, 1, 0, 0, 1, 1,
1.00418, 0.3157961, 0.3956265, 1, 0, 0, 1, 1,
1.009041, 1.210675, 1.282985, 1, 0, 0, 1, 1,
1.010587, 0.8051828, 2.384143, 0, 0, 0, 1, 1,
1.012131, -0.3179459, 1.980757, 0, 0, 0, 1, 1,
1.017628, -0.7610633, 3.153397, 0, 0, 0, 1, 1,
1.02301, -0.168498, 1.982126, 0, 0, 0, 1, 1,
1.033887, 0.8052634, 1.625319, 0, 0, 0, 1, 1,
1.034272, 0.151415, 1.88593, 0, 0, 0, 1, 1,
1.040552, 0.5819107, 0.2777086, 0, 0, 0, 1, 1,
1.044419, -0.1135601, 3.942227, 1, 1, 1, 1, 1,
1.048221, -0.7809644, 2.611049, 1, 1, 1, 1, 1,
1.053767, 1.9013, -0.8327873, 1, 1, 1, 1, 1,
1.057758, 0.1991978, 1.785437, 1, 1, 1, 1, 1,
1.060267, 0.3574516, 0.1086638, 1, 1, 1, 1, 1,
1.067653, -0.2967287, 2.124299, 1, 1, 1, 1, 1,
1.069393, 1.597406, 1.28615, 1, 1, 1, 1, 1,
1.077156, -0.6883541, 2.147499, 1, 1, 1, 1, 1,
1.089829, 0.1691556, 1.355147, 1, 1, 1, 1, 1,
1.09538, 0.5767152, 0.8981507, 1, 1, 1, 1, 1,
1.101684, 1.502988, -0.2743758, 1, 1, 1, 1, 1,
1.107995, -0.484929, 1.610257, 1, 1, 1, 1, 1,
1.114596, 0.2599896, 1.60351, 1, 1, 1, 1, 1,
1.117438, -0.6750571, 2.081916, 1, 1, 1, 1, 1,
1.118464, 0.1745004, 1.131533, 1, 1, 1, 1, 1,
1.129379, -0.01254814, 1.933533, 0, 0, 1, 1, 1,
1.132242, 1.102107, 1.390191, 1, 0, 0, 1, 1,
1.138443, -0.37978, 2.165164, 1, 0, 0, 1, 1,
1.140517, -0.7218795, 1.4177, 1, 0, 0, 1, 1,
1.143183, -1.08715, 1.766084, 1, 0, 0, 1, 1,
1.146683, -0.4536559, 0.2799614, 1, 0, 0, 1, 1,
1.153769, 0.1921487, 0.6047072, 0, 0, 0, 1, 1,
1.162863, -0.2989935, 1.517457, 0, 0, 0, 1, 1,
1.163715, 0.5768231, 1.880619, 0, 0, 0, 1, 1,
1.166098, -0.7589079, 2.357096, 0, 0, 0, 1, 1,
1.168122, -0.2049078, 1.327033, 0, 0, 0, 1, 1,
1.177889, -1.714002, 3.591016, 0, 0, 0, 1, 1,
1.186789, -0.1863494, 0.6472907, 0, 0, 0, 1, 1,
1.202264, -2.10076, 3.339708, 1, 1, 1, 1, 1,
1.211267, 0.7828293, 0.7559133, 1, 1, 1, 1, 1,
1.211608, 1.361694, 1.190635, 1, 1, 1, 1, 1,
1.218834, 0.357446, 0.5166448, 1, 1, 1, 1, 1,
1.224819, 2.522537, 0.8634068, 1, 1, 1, 1, 1,
1.229695, -0.7648323, 2.499845, 1, 1, 1, 1, 1,
1.235401, -0.9707887, 1.733223, 1, 1, 1, 1, 1,
1.238091, -0.05684152, 1.049168, 1, 1, 1, 1, 1,
1.242267, -1.967732, 2.585902, 1, 1, 1, 1, 1,
1.266734, -0.004848386, 1.747792, 1, 1, 1, 1, 1,
1.267829, -1.512424, 2.00832, 1, 1, 1, 1, 1,
1.268901, 0.5201054, 1.641219, 1, 1, 1, 1, 1,
1.277727, 1.504908, 0.5452665, 1, 1, 1, 1, 1,
1.280394, -0.8682284, 1.450149, 1, 1, 1, 1, 1,
1.28109, -0.4479591, 1.536595, 1, 1, 1, 1, 1,
1.286138, 0.05367986, 2.071452, 0, 0, 1, 1, 1,
1.287991, 1.631011, 1.132068, 1, 0, 0, 1, 1,
1.29582, 0.4625276, 0.8134272, 1, 0, 0, 1, 1,
1.314074, 0.08678859, 1.668928, 1, 0, 0, 1, 1,
1.315431, 0.2078589, -0.5737178, 1, 0, 0, 1, 1,
1.318931, -1.496575, 0.9087669, 1, 0, 0, 1, 1,
1.335107, -1.282952, 2.22456, 0, 0, 0, 1, 1,
1.338254, 0.1053606, 3.083194, 0, 0, 0, 1, 1,
1.351967, 0.9983223, 0.7040271, 0, 0, 0, 1, 1,
1.38556, -0.2518555, 0.8513879, 0, 0, 0, 1, 1,
1.411124, 1.413828, 1.907519, 0, 0, 0, 1, 1,
1.418594, 0.5198661, 0.3494708, 0, 0, 0, 1, 1,
1.419163, -1.611155, 2.621118, 0, 0, 0, 1, 1,
1.424424, -0.9179658, 1.424749, 1, 1, 1, 1, 1,
1.42574, 0.7679681, -0.8453358, 1, 1, 1, 1, 1,
1.429438, 0.4577126, 2.533401, 1, 1, 1, 1, 1,
1.445396, -2.474001, 2.108464, 1, 1, 1, 1, 1,
1.451461, 1.110885, 1.529739, 1, 1, 1, 1, 1,
1.453468, -1.162208, 3.72262, 1, 1, 1, 1, 1,
1.459735, -1.151792, 2.417691, 1, 1, 1, 1, 1,
1.461478, -1.371433, 3.196169, 1, 1, 1, 1, 1,
1.47987, 1.500061, 1.372547, 1, 1, 1, 1, 1,
1.494646, 0.1956905, 2.46465, 1, 1, 1, 1, 1,
1.497811, -0.8447683, 2.118259, 1, 1, 1, 1, 1,
1.5074, -0.5189837, 2.641782, 1, 1, 1, 1, 1,
1.512179, -0.3007334, 0.88008, 1, 1, 1, 1, 1,
1.513757, -1.08938, 2.683665, 1, 1, 1, 1, 1,
1.519552, 0.235231, 1.257069, 1, 1, 1, 1, 1,
1.526478, 1.350479, 2.002083, 0, 0, 1, 1, 1,
1.545587, 1.716761, 0.4282829, 1, 0, 0, 1, 1,
1.575245, 0.3668355, 1.211008, 1, 0, 0, 1, 1,
1.580499, 0.7339513, 0.7276486, 1, 0, 0, 1, 1,
1.581056, -0.4505, 0.9416696, 1, 0, 0, 1, 1,
1.584172, -0.1205442, 2.397294, 1, 0, 0, 1, 1,
1.600303, -2.144037, 4.052603, 0, 0, 0, 1, 1,
1.675402, 0.4067585, 1.695219, 0, 0, 0, 1, 1,
1.681976, -1.391271, 2.980854, 0, 0, 0, 1, 1,
1.691461, -1.100571, 3.087354, 0, 0, 0, 1, 1,
1.692737, 0.360979, 1.892095, 0, 0, 0, 1, 1,
1.694882, -1.079725, 4.762002, 0, 0, 0, 1, 1,
1.718263, 0.4594069, 0.6774017, 0, 0, 0, 1, 1,
1.720822, 0.1513453, 1.389628, 1, 1, 1, 1, 1,
1.731566, 1.541318, 0.3580334, 1, 1, 1, 1, 1,
1.734847, -0.08640004, -0.3170134, 1, 1, 1, 1, 1,
1.734895, 1.280775, 0.2700307, 1, 1, 1, 1, 1,
1.77068, -0.3022809, 2.438236, 1, 1, 1, 1, 1,
1.780174, 0.2756505, 2.124597, 1, 1, 1, 1, 1,
1.798665, -0.3339336, 1.312924, 1, 1, 1, 1, 1,
1.840778, 0.1107075, 1.621072, 1, 1, 1, 1, 1,
1.8752, -0.7264534, 2.603781, 1, 1, 1, 1, 1,
1.916427, -0.4496529, 2.844836, 1, 1, 1, 1, 1,
1.929768, -1.108464, 1.752536, 1, 1, 1, 1, 1,
1.955692, -0.3176394, 2.70454, 1, 1, 1, 1, 1,
1.977096, -0.0165219, 0.1149268, 1, 1, 1, 1, 1,
1.978416, 0.9441171, -0.2012331, 1, 1, 1, 1, 1,
2.023055, 0.03574171, 0.5200288, 1, 1, 1, 1, 1,
2.078913, 0.4429123, 0.4626978, 0, 0, 1, 1, 1,
2.119828, -0.1454991, 2.364996, 1, 0, 0, 1, 1,
2.122368, -1.731514, 4.895679, 1, 0, 0, 1, 1,
2.145948, 0.2363963, 1.109249, 1, 0, 0, 1, 1,
2.156871, -0.9335394, 2.051859, 1, 0, 0, 1, 1,
2.191974, -1.702717, 2.748616, 1, 0, 0, 1, 1,
2.213319, 0.5366499, 1.115862, 0, 0, 0, 1, 1,
2.231605, -0.2140504, 4.176341, 0, 0, 0, 1, 1,
2.23424, -0.008662229, 3.47955, 0, 0, 0, 1, 1,
2.252393, 0.5290077, 1.507513, 0, 0, 0, 1, 1,
2.314467, 0.006772803, 1.498641, 0, 0, 0, 1, 1,
2.359574, 0.5387684, 0.6883085, 0, 0, 0, 1, 1,
2.380926, -0.467495, 1.948034, 0, 0, 0, 1, 1,
2.403614, 1.354243, 2.274187, 1, 1, 1, 1, 1,
2.41001, -0.5813871, 2.160575, 1, 1, 1, 1, 1,
2.447697, 0.9076162, 0.2205144, 1, 1, 1, 1, 1,
2.539777, -0.1766553, 2.444297, 1, 1, 1, 1, 1,
2.574283, -1.058399, 2.614577, 1, 1, 1, 1, 1,
2.778248, -0.4546583, 1.723581, 1, 1, 1, 1, 1,
2.779774, -0.3804138, 1.344785, 1, 1, 1, 1, 1
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
var radius = 10.03807;
var distance = 35.25831;
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
mvMatrix.translate( 0.04230154, 0.4584171, 0.1000211 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.25831);
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