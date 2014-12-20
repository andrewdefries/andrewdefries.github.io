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
-3.072736, -0.4808563, -1.036202, 1, 0, 0, 1,
-2.929503, -0.6051309, -2.006952, 1, 0.007843138, 0, 1,
-2.624659, 0.2714037, -2.137089, 1, 0.01176471, 0, 1,
-2.432764, -1.126994, -3.300017, 1, 0.01960784, 0, 1,
-2.430573, 1.431587, -2.672573, 1, 0.02352941, 0, 1,
-2.428487, -1.660031, -2.032106, 1, 0.03137255, 0, 1,
-2.387382, 0.4141341, -2.598359, 1, 0.03529412, 0, 1,
-2.370843, -1.010698, -1.083792, 1, 0.04313726, 0, 1,
-2.357072, -1.604328, -1.388158, 1, 0.04705882, 0, 1,
-2.348642, -0.290129, -0.5170823, 1, 0.05490196, 0, 1,
-2.337894, 0.5571451, -2.247105, 1, 0.05882353, 0, 1,
-2.277587, 0.5335935, -2.626099, 1, 0.06666667, 0, 1,
-2.269723, -0.9818379, -1.174063, 1, 0.07058824, 0, 1,
-2.249416, 0.6113117, 1.160387, 1, 0.07843138, 0, 1,
-2.213482, 0.676978, -1.103794, 1, 0.08235294, 0, 1,
-2.199177, -1.618185, -1.630491, 1, 0.09019608, 0, 1,
-2.186253, 0.2157248, -0.02489332, 1, 0.09411765, 0, 1,
-2.167094, -0.3531945, -0.7834358, 1, 0.1019608, 0, 1,
-2.165037, 0.3369411, -0.8815604, 1, 0.1098039, 0, 1,
-2.15745, 0.4847423, 0.3771985, 1, 0.1137255, 0, 1,
-2.103856, -0.4164901, -1.804057, 1, 0.1215686, 0, 1,
-2.088419, 0.6317809, -2.484318, 1, 0.1254902, 0, 1,
-2.066741, 0.4546333, 0.1202776, 1, 0.1333333, 0, 1,
-2.060307, 0.03721756, -1.679121, 1, 0.1372549, 0, 1,
-2.058041, 0.6576707, -1.340246, 1, 0.145098, 0, 1,
-2.001578, -0.7385681, -1.519574, 1, 0.1490196, 0, 1,
-1.996637, 0.02176693, -1.976513, 1, 0.1568628, 0, 1,
-1.956463, 0.9383714, -1.056079, 1, 0.1607843, 0, 1,
-1.947455, -0.1707189, -0.5202726, 1, 0.1686275, 0, 1,
-1.939819, -0.8962755, -1.729545, 1, 0.172549, 0, 1,
-1.928171, 0.01378513, -2.081929, 1, 0.1803922, 0, 1,
-1.907142, 0.3972446, -0.2951692, 1, 0.1843137, 0, 1,
-1.903132, 1.184378, -2.116013, 1, 0.1921569, 0, 1,
-1.88929, 0.4619009, -1.235638, 1, 0.1960784, 0, 1,
-1.881699, -0.4214635, 0.4053043, 1, 0.2039216, 0, 1,
-1.844662, 1.122574, -0.1695935, 1, 0.2117647, 0, 1,
-1.825773, 0.1922051, -1.788461, 1, 0.2156863, 0, 1,
-1.804135, -0.615705, 1.217017, 1, 0.2235294, 0, 1,
-1.784059, 0.1785277, -2.390569, 1, 0.227451, 0, 1,
-1.773063, 0.5343828, -1.742976, 1, 0.2352941, 0, 1,
-1.770275, 3.447664, -1.569599, 1, 0.2392157, 0, 1,
-1.744041, 0.5732019, -0.1460195, 1, 0.2470588, 0, 1,
-1.743881, -0.7013245, -0.9784144, 1, 0.2509804, 0, 1,
-1.728829, -1.712176, 0.1286075, 1, 0.2588235, 0, 1,
-1.723543, -1.308034, -3.833864, 1, 0.2627451, 0, 1,
-1.719621, 0.6097808, 0.5145869, 1, 0.2705882, 0, 1,
-1.712715, -0.1762781, -0.3107895, 1, 0.2745098, 0, 1,
-1.706776, 0.5228763, -0.3382146, 1, 0.282353, 0, 1,
-1.700497, 0.8782555, -0.6341386, 1, 0.2862745, 0, 1,
-1.676468, -0.6322488, -0.4300015, 1, 0.2941177, 0, 1,
-1.675338, 1.675739, -3.030905, 1, 0.3019608, 0, 1,
-1.665437, 0.2556788, -1.091074, 1, 0.3058824, 0, 1,
-1.6645, -0.3395113, -1.237752, 1, 0.3137255, 0, 1,
-1.650556, -0.8902856, -4.14822, 1, 0.3176471, 0, 1,
-1.647975, -0.5705003, -3.04722, 1, 0.3254902, 0, 1,
-1.641963, -1.388028, -3.881289, 1, 0.3294118, 0, 1,
-1.634183, -0.07614703, -0.5283802, 1, 0.3372549, 0, 1,
-1.630232, -0.1638217, -2.235629, 1, 0.3411765, 0, 1,
-1.591007, 1.405462, -1.086787, 1, 0.3490196, 0, 1,
-1.586465, 1.209882, -0.283048, 1, 0.3529412, 0, 1,
-1.58469, -0.1475008, -1.58546, 1, 0.3607843, 0, 1,
-1.553907, -0.4155326, -2.579527, 1, 0.3647059, 0, 1,
-1.552132, -1.034519, -3.479682, 1, 0.372549, 0, 1,
-1.547428, -0.1474539, -1.070836, 1, 0.3764706, 0, 1,
-1.53996, -0.0001241989, -1.923714, 1, 0.3843137, 0, 1,
-1.522382, 0.2634584, -2.387059, 1, 0.3882353, 0, 1,
-1.502561, -0.06650501, -1.327357, 1, 0.3960784, 0, 1,
-1.498147, 2.457434, -3.112327, 1, 0.4039216, 0, 1,
-1.486928, 0.3768934, -1.672026, 1, 0.4078431, 0, 1,
-1.485012, 0.5955035, -1.181525, 1, 0.4156863, 0, 1,
-1.461665, 0.0399259, -3.807686, 1, 0.4196078, 0, 1,
-1.437442, -0.9096065, -2.281708, 1, 0.427451, 0, 1,
-1.416863, 0.1716595, -3.032006, 1, 0.4313726, 0, 1,
-1.41584, -0.8786339, -2.262719, 1, 0.4392157, 0, 1,
-1.411814, -0.8919835, -1.43937, 1, 0.4431373, 0, 1,
-1.394959, 0.2315603, -0.3714992, 1, 0.4509804, 0, 1,
-1.393259, -0.5155191, 0.2540793, 1, 0.454902, 0, 1,
-1.388289, 0.7192346, -0.7587554, 1, 0.4627451, 0, 1,
-1.374844, -0.6294295, -0.3607054, 1, 0.4666667, 0, 1,
-1.348664, 0.9884464, 0.3744623, 1, 0.4745098, 0, 1,
-1.348441, 0.5815879, -4.522793, 1, 0.4784314, 0, 1,
-1.343332, -0.3290639, -1.198733, 1, 0.4862745, 0, 1,
-1.335322, -0.7502482, -3.23425, 1, 0.4901961, 0, 1,
-1.31961, -1.173832, -0.8426567, 1, 0.4980392, 0, 1,
-1.316056, -0.1488381, -0.9176535, 1, 0.5058824, 0, 1,
-1.303864, 1.615946, 0.6409096, 1, 0.509804, 0, 1,
-1.301794, 0.08796448, -2.506416, 1, 0.5176471, 0, 1,
-1.299797, 0.1650112, -2.350706, 1, 0.5215687, 0, 1,
-1.298382, 1.019146, -1.658385, 1, 0.5294118, 0, 1,
-1.297823, 1.588008, 0.5001006, 1, 0.5333334, 0, 1,
-1.297455, -2.148572, -3.729904, 1, 0.5411765, 0, 1,
-1.291881, -0.6404515, -1.801228, 1, 0.5450981, 0, 1,
-1.290798, -1.329665, -1.643309, 1, 0.5529412, 0, 1,
-1.284347, -0.5009413, -1.953503, 1, 0.5568628, 0, 1,
-1.280514, -0.4749638, -1.388999, 1, 0.5647059, 0, 1,
-1.278449, 2.447628, -0.2725421, 1, 0.5686275, 0, 1,
-1.273904, 1.417547, 1.008156, 1, 0.5764706, 0, 1,
-1.268883, -1.609365, -1.006878, 1, 0.5803922, 0, 1,
-1.268597, -0.3272087, -2.644599, 1, 0.5882353, 0, 1,
-1.266148, -0.333058, -0.949307, 1, 0.5921569, 0, 1,
-1.258818, 0.1371579, -0.2978038, 1, 0.6, 0, 1,
-1.249868, 0.3620608, 0.3040635, 1, 0.6078432, 0, 1,
-1.249549, 0.002125929, -2.109199, 1, 0.6117647, 0, 1,
-1.249066, 0.5034852, -0.05898711, 1, 0.6196079, 0, 1,
-1.247232, -0.3468801, -0.5578432, 1, 0.6235294, 0, 1,
-1.242877, -0.8269049, -1.496264, 1, 0.6313726, 0, 1,
-1.240361, 0.9514536, -0.2409404, 1, 0.6352941, 0, 1,
-1.234809, 0.1389248, -1.29089, 1, 0.6431373, 0, 1,
-1.220403, 0.9916785, -0.1215243, 1, 0.6470588, 0, 1,
-1.219779, -1.397231, -2.654272, 1, 0.654902, 0, 1,
-1.218239, 1.004915, -2.242504, 1, 0.6588235, 0, 1,
-1.21261, -1.364536, -3.380357, 1, 0.6666667, 0, 1,
-1.206493, 0.295887, -1.374399, 1, 0.6705883, 0, 1,
-1.200762, 0.788443, 0.2042836, 1, 0.6784314, 0, 1,
-1.194649, -0.5767029, -2.175827, 1, 0.682353, 0, 1,
-1.19398, 1.535242, -1.226641, 1, 0.6901961, 0, 1,
-1.19384, 1.077017, -1.080843, 1, 0.6941177, 0, 1,
-1.187367, 1.642301, -2.279816, 1, 0.7019608, 0, 1,
-1.183295, 1.126281, -0.2975802, 1, 0.7098039, 0, 1,
-1.172969, -0.3363079, -1.982124, 1, 0.7137255, 0, 1,
-1.172598, -1.672617, -3.173365, 1, 0.7215686, 0, 1,
-1.169673, -0.1739711, -3.572508, 1, 0.7254902, 0, 1,
-1.162297, -0.2710891, -3.234946, 1, 0.7333333, 0, 1,
-1.1529, 0.855473, 0.06884193, 1, 0.7372549, 0, 1,
-1.146746, -0.5784261, -0.4258608, 1, 0.7450981, 0, 1,
-1.143767, -1.061982, -3.120975, 1, 0.7490196, 0, 1,
-1.142354, 0.4380489, -0.07771699, 1, 0.7568628, 0, 1,
-1.141737, -1.411036, -1.977033, 1, 0.7607843, 0, 1,
-1.137313, 0.7454669, -0.4490044, 1, 0.7686275, 0, 1,
-1.137189, 0.6904869, -3.017784, 1, 0.772549, 0, 1,
-1.135303, 1.829746, -0.2900333, 1, 0.7803922, 0, 1,
-1.131772, -0.3523364, -1.861229, 1, 0.7843137, 0, 1,
-1.128206, -1.136318, -1.252777, 1, 0.7921569, 0, 1,
-1.127439, 0.02709564, -2.349674, 1, 0.7960784, 0, 1,
-1.125747, 1.813801, -0.4519442, 1, 0.8039216, 0, 1,
-1.120385, 0.2462337, -2.201748, 1, 0.8117647, 0, 1,
-1.11461, -1.020232, -2.094989, 1, 0.8156863, 0, 1,
-1.114573, -0.8449316, -1.700795, 1, 0.8235294, 0, 1,
-1.111372, -0.04581178, -0.5091331, 1, 0.827451, 0, 1,
-1.102049, -0.2277282, -0.8009299, 1, 0.8352941, 0, 1,
-1.07759, -0.9537708, -2.196668, 1, 0.8392157, 0, 1,
-1.077109, -0.1734808, -0.4424982, 1, 0.8470588, 0, 1,
-1.075443, -0.5835513, -1.750048, 1, 0.8509804, 0, 1,
-1.065906, -0.3545885, -0.6122588, 1, 0.8588235, 0, 1,
-1.058938, 0.6043834, -0.7901484, 1, 0.8627451, 0, 1,
-1.048707, 0.7816892, 0.4644055, 1, 0.8705882, 0, 1,
-1.044846, 0.1908036, -1.660623, 1, 0.8745098, 0, 1,
-1.037364, -1.124483, -2.559406, 1, 0.8823529, 0, 1,
-1.036342, -1.188503, -2.026083, 1, 0.8862745, 0, 1,
-1.035904, 0.7040268, -0.9694332, 1, 0.8941177, 0, 1,
-1.028055, -0.863788, -1.807402, 1, 0.8980392, 0, 1,
-1.02332, 0.8252332, -1.413412, 1, 0.9058824, 0, 1,
-1.020877, 0.3447548, -0.7784498, 1, 0.9137255, 0, 1,
-1.017062, -0.1407649, -0.8933035, 1, 0.9176471, 0, 1,
-1.015479, -1.91901, -2.003748, 1, 0.9254902, 0, 1,
-1.015011, 1.065609, -0.8956033, 1, 0.9294118, 0, 1,
-1.014549, -0.01844698, -2.688892, 1, 0.9372549, 0, 1,
-1.014339, 0.212295, -3.269222, 1, 0.9411765, 0, 1,
-1.009928, 2.343908, -0.3448993, 1, 0.9490196, 0, 1,
-0.9995018, -0.1837289, -2.35267, 1, 0.9529412, 0, 1,
-0.9957849, -0.08466254, -1.443852, 1, 0.9607843, 0, 1,
-0.9949594, -0.3617415, -1.258393, 1, 0.9647059, 0, 1,
-0.9864289, 0.4457142, -1.910675, 1, 0.972549, 0, 1,
-0.9788261, -0.6437554, -2.047551, 1, 0.9764706, 0, 1,
-0.9734807, 0.7066672, 0.6646575, 1, 0.9843137, 0, 1,
-0.9719344, 1.849612, -1.368778, 1, 0.9882353, 0, 1,
-0.971294, 0.6352377, -0.2799572, 1, 0.9960784, 0, 1,
-0.9663247, 0.2645042, -3.167817, 0.9960784, 1, 0, 1,
-0.9636343, -0.6822841, -0.7935324, 0.9921569, 1, 0, 1,
-0.9597799, 0.3009979, -1.825121, 0.9843137, 1, 0, 1,
-0.9535078, -0.3739988, -0.2023711, 0.9803922, 1, 0, 1,
-0.9504545, 2.282058, 0.5409266, 0.972549, 1, 0, 1,
-0.9462104, 1.816895, -0.3822168, 0.9686275, 1, 0, 1,
-0.9460709, 0.7354997, -1.32321, 0.9607843, 1, 0, 1,
-0.9440706, 0.3805728, -0.5359666, 0.9568627, 1, 0, 1,
-0.9434292, -0.1590037, -1.830783, 0.9490196, 1, 0, 1,
-0.9404591, 0.8525544, -1.224557, 0.945098, 1, 0, 1,
-0.9145548, 0.5529746, 0.5388724, 0.9372549, 1, 0, 1,
-0.9142041, 0.1310551, -0.4533635, 0.9333333, 1, 0, 1,
-0.913447, 0.75173, -2.288499, 0.9254902, 1, 0, 1,
-0.9113085, 0.1957051, -2.170691, 0.9215686, 1, 0, 1,
-0.9098362, -0.7470064, -0.9134136, 0.9137255, 1, 0, 1,
-0.9043857, 0.08088913, -3.748746, 0.9098039, 1, 0, 1,
-0.902637, 2.539905, -2.41089, 0.9019608, 1, 0, 1,
-0.9007286, -1.049042, -1.574562, 0.8941177, 1, 0, 1,
-0.8986831, -0.6119388, -2.688787, 0.8901961, 1, 0, 1,
-0.8977299, -1.118638, -1.38339, 0.8823529, 1, 0, 1,
-0.8960062, -0.4074341, -1.498, 0.8784314, 1, 0, 1,
-0.8950458, 0.4577881, 1.460913, 0.8705882, 1, 0, 1,
-0.8949255, 0.2870954, -2.729506, 0.8666667, 1, 0, 1,
-0.8897113, 1.263769, 0.3672386, 0.8588235, 1, 0, 1,
-0.8884773, -1.717565, -2.263807, 0.854902, 1, 0, 1,
-0.8876799, 1.720745, -0.1590236, 0.8470588, 1, 0, 1,
-0.8875887, -1.331967, -4.148628, 0.8431373, 1, 0, 1,
-0.8841112, -0.7869725, -1.79368, 0.8352941, 1, 0, 1,
-0.8839312, -0.1137402, -1.830949, 0.8313726, 1, 0, 1,
-0.8817492, -0.1777915, -0.9957768, 0.8235294, 1, 0, 1,
-0.8754799, 0.7260661, -3.290712, 0.8196079, 1, 0, 1,
-0.8748482, -0.7030716, -1.782893, 0.8117647, 1, 0, 1,
-0.8744718, -0.3598163, -0.9121734, 0.8078431, 1, 0, 1,
-0.8730977, 0.8749913, -0.6492413, 0.8, 1, 0, 1,
-0.8702173, 0.4864822, -1.092625, 0.7921569, 1, 0, 1,
-0.8683854, 0.9560948, -0.9135962, 0.7882353, 1, 0, 1,
-0.8645919, -1.631336, -2.26238, 0.7803922, 1, 0, 1,
-0.8638355, 0.08964656, -2.800797, 0.7764706, 1, 0, 1,
-0.8636979, -1.028023, -4.801638, 0.7686275, 1, 0, 1,
-0.8626158, -0.3595442, -0.2054929, 0.7647059, 1, 0, 1,
-0.8563617, -0.4488562, -3.804201, 0.7568628, 1, 0, 1,
-0.8523443, 0.8252603, -0.6491707, 0.7529412, 1, 0, 1,
-0.8431702, 2.714993, -0.4549207, 0.7450981, 1, 0, 1,
-0.8396717, -1.177705, -2.452447, 0.7411765, 1, 0, 1,
-0.8387863, 0.4819195, -1.34444, 0.7333333, 1, 0, 1,
-0.8340238, 2.236443, 0.4322118, 0.7294118, 1, 0, 1,
-0.8332658, 1.286598, -1.790447, 0.7215686, 1, 0, 1,
-0.8321152, -0.3299885, -1.952516, 0.7176471, 1, 0, 1,
-0.8288342, 0.199375, -0.9457782, 0.7098039, 1, 0, 1,
-0.821759, -0.1726072, -1.116582, 0.7058824, 1, 0, 1,
-0.8192188, 0.05612731, -3.427205, 0.6980392, 1, 0, 1,
-0.8190717, 0.9088622, -2.205748, 0.6901961, 1, 0, 1,
-0.8152935, -1.334914, -2.501598, 0.6862745, 1, 0, 1,
-0.8131737, -1.450126, -4.931837, 0.6784314, 1, 0, 1,
-0.8110976, -2.520857, -3.350223, 0.6745098, 1, 0, 1,
-0.8079686, 0.7152082, -0.7246239, 0.6666667, 1, 0, 1,
-0.8077206, -2.318255, -4.919333, 0.6627451, 1, 0, 1,
-0.8039953, 0.8987169, -1.832977, 0.654902, 1, 0, 1,
-0.8039461, -0.06738675, -1.25519, 0.6509804, 1, 0, 1,
-0.8020283, -1.06359, -1.873363, 0.6431373, 1, 0, 1,
-0.7994331, 0.8027241, -1.267137, 0.6392157, 1, 0, 1,
-0.7955672, 0.04005186, -1.551403, 0.6313726, 1, 0, 1,
-0.7939126, 0.7900075, -0.712148, 0.627451, 1, 0, 1,
-0.7924649, 1.641583, 0.3779625, 0.6196079, 1, 0, 1,
-0.7913382, -1.299379, -2.378954, 0.6156863, 1, 0, 1,
-0.7909272, -1.440792, -2.373711, 0.6078432, 1, 0, 1,
-0.7906895, 0.1286436, -1.57834, 0.6039216, 1, 0, 1,
-0.7875004, -0.3168986, -1.246596, 0.5960785, 1, 0, 1,
-0.7864223, -0.800414, -2.445723, 0.5882353, 1, 0, 1,
-0.7854013, 1.277712, -1.727093, 0.5843138, 1, 0, 1,
-0.7844262, 1.532702, -1.017029, 0.5764706, 1, 0, 1,
-0.7791903, -0.7994357, -1.758936, 0.572549, 1, 0, 1,
-0.7698172, 0.1655057, -2.892463, 0.5647059, 1, 0, 1,
-0.7646159, -0.09642219, -2.928513, 0.5607843, 1, 0, 1,
-0.7641146, -1.005396, -1.575026, 0.5529412, 1, 0, 1,
-0.7583897, 0.5041873, -1.908128, 0.5490196, 1, 0, 1,
-0.7539175, 1.235964, -0.9420695, 0.5411765, 1, 0, 1,
-0.7486212, 0.04566877, -1.842108, 0.5372549, 1, 0, 1,
-0.745742, -0.1263838, -2.4021, 0.5294118, 1, 0, 1,
-0.7407118, -0.2857882, -0.2287226, 0.5254902, 1, 0, 1,
-0.7400503, -1.129964, -4.479211, 0.5176471, 1, 0, 1,
-0.7308096, -0.4696248, -3.062421, 0.5137255, 1, 0, 1,
-0.718424, -1.625235, -4.008533, 0.5058824, 1, 0, 1,
-0.7181215, 0.9955705, -1.617287, 0.5019608, 1, 0, 1,
-0.7099462, 0.8579863, 1.218929, 0.4941176, 1, 0, 1,
-0.7098334, -0.3046385, -3.282931, 0.4862745, 1, 0, 1,
-0.7087156, -0.2026062, -3.533868, 0.4823529, 1, 0, 1,
-0.7065668, 1.206327, -1.059333, 0.4745098, 1, 0, 1,
-0.705132, -0.3174568, -2.259425, 0.4705882, 1, 0, 1,
-0.7012506, 0.137654, -2.080605, 0.4627451, 1, 0, 1,
-0.7010638, -1.645797, -2.387397, 0.4588235, 1, 0, 1,
-0.697631, 0.1213295, -1.462917, 0.4509804, 1, 0, 1,
-0.6970477, -0.0898168, -0.68541, 0.4470588, 1, 0, 1,
-0.6934726, -0.6350173, -1.565809, 0.4392157, 1, 0, 1,
-0.6929224, 1.224076, 0.537425, 0.4352941, 1, 0, 1,
-0.6926129, -1.520187, -1.930125, 0.427451, 1, 0, 1,
-0.6909924, 1.311663, -2.040767, 0.4235294, 1, 0, 1,
-0.6808146, -0.1288911, -1.687646, 0.4156863, 1, 0, 1,
-0.676266, -1.678852, -2.45671, 0.4117647, 1, 0, 1,
-0.6749552, -1.111537, -1.90228, 0.4039216, 1, 0, 1,
-0.6626601, -0.7628946, -3.289494, 0.3960784, 1, 0, 1,
-0.6544122, -0.6322021, -3.837417, 0.3921569, 1, 0, 1,
-0.6519138, 1.661569, -0.7601798, 0.3843137, 1, 0, 1,
-0.6503278, 0.6261509, 1.179453, 0.3803922, 1, 0, 1,
-0.6496227, 1.25379, -0.619962, 0.372549, 1, 0, 1,
-0.6478459, -0.8848292, -3.559618, 0.3686275, 1, 0, 1,
-0.6458794, 0.005304108, -0.9680858, 0.3607843, 1, 0, 1,
-0.6427959, -1.793808, -2.632571, 0.3568628, 1, 0, 1,
-0.6394916, -0.8137929, -1.850837, 0.3490196, 1, 0, 1,
-0.6384255, -1.287363, -1.732538, 0.345098, 1, 0, 1,
-0.6277663, 0.1297686, -0.5831424, 0.3372549, 1, 0, 1,
-0.6260552, -1.051266, -2.629999, 0.3333333, 1, 0, 1,
-0.6249033, -0.5069767, -1.785537, 0.3254902, 1, 0, 1,
-0.6177266, -0.5925682, -3.471772, 0.3215686, 1, 0, 1,
-0.614336, 0.2863302, -2.281643, 0.3137255, 1, 0, 1,
-0.6106424, 0.0612209, -1.020673, 0.3098039, 1, 0, 1,
-0.6042417, 0.5001637, -1.732998, 0.3019608, 1, 0, 1,
-0.6016298, 0.07509352, -2.358069, 0.2941177, 1, 0, 1,
-0.5925218, 0.6903563, -0.1153878, 0.2901961, 1, 0, 1,
-0.5898021, -0.4390383, -1.698585, 0.282353, 1, 0, 1,
-0.5872957, 1.749856, -0.6214694, 0.2784314, 1, 0, 1,
-0.5867643, -0.9455785, -1.329331, 0.2705882, 1, 0, 1,
-0.5856833, -0.05928697, -1.710396, 0.2666667, 1, 0, 1,
-0.5821896, 0.8788436, -0.006069788, 0.2588235, 1, 0, 1,
-0.580507, 0.4157454, -1.787954, 0.254902, 1, 0, 1,
-0.5797144, -0.7412652, -2.557843, 0.2470588, 1, 0, 1,
-0.5747545, 1.956515, -0.09532174, 0.2431373, 1, 0, 1,
-0.5738997, 0.9408903, -1.162327, 0.2352941, 1, 0, 1,
-0.5733309, -0.269534, -2.360896, 0.2313726, 1, 0, 1,
-0.5727054, -0.2108413, -1.438809, 0.2235294, 1, 0, 1,
-0.5713441, -0.1743277, -1.496108, 0.2196078, 1, 0, 1,
-0.5697393, -0.2671995, -2.07027, 0.2117647, 1, 0, 1,
-0.5592084, 1.336322, -0.4098387, 0.2078431, 1, 0, 1,
-0.5565389, 0.7517215, -0.5862575, 0.2, 1, 0, 1,
-0.5529528, -0.2830001, -3.163297, 0.1921569, 1, 0, 1,
-0.5511895, -0.5298542, -2.875457, 0.1882353, 1, 0, 1,
-0.5507773, 0.3359363, -3.273966, 0.1803922, 1, 0, 1,
-0.5501466, -0.5518863, -2.431674, 0.1764706, 1, 0, 1,
-0.5479553, -2.178361, -2.230966, 0.1686275, 1, 0, 1,
-0.5474082, 0.04068717, -3.129679, 0.1647059, 1, 0, 1,
-0.5395529, -1.008097, -2.761815, 0.1568628, 1, 0, 1,
-0.5378426, -0.4727282, -2.499278, 0.1529412, 1, 0, 1,
-0.5285134, 1.213474, -0.02102952, 0.145098, 1, 0, 1,
-0.5170872, 0.4429726, -1.528565, 0.1411765, 1, 0, 1,
-0.5143621, 0.02578077, 0.7276353, 0.1333333, 1, 0, 1,
-0.511135, 0.6535255, -2.456549, 0.1294118, 1, 0, 1,
-0.5081458, -1.582387, -3.777308, 0.1215686, 1, 0, 1,
-0.5059902, 0.09111057, 0.4278868, 0.1176471, 1, 0, 1,
-0.495673, -0.6997353, -2.299036, 0.1098039, 1, 0, 1,
-0.4956722, -0.260836, -1.363136, 0.1058824, 1, 0, 1,
-0.4944031, 0.9091281, 0.7602476, 0.09803922, 1, 0, 1,
-0.4893146, -2.474392, -4.356789, 0.09019608, 1, 0, 1,
-0.4848081, -0.710068, -3.041892, 0.08627451, 1, 0, 1,
-0.4845209, -0.2665369, -2.568051, 0.07843138, 1, 0, 1,
-0.4830487, -0.6751436, -1.648288, 0.07450981, 1, 0, 1,
-0.4770122, 1.536398, 1.125498, 0.06666667, 1, 0, 1,
-0.4710009, -0.465515, -2.277126, 0.0627451, 1, 0, 1,
-0.4689906, -0.2931359, -1.373284, 0.05490196, 1, 0, 1,
-0.4649382, -1.546658, -3.557814, 0.05098039, 1, 0, 1,
-0.4621544, -1.773208, -1.755501, 0.04313726, 1, 0, 1,
-0.4603727, 0.483239, -1.560544, 0.03921569, 1, 0, 1,
-0.4584378, 0.3297247, -1.254122, 0.03137255, 1, 0, 1,
-0.4562573, -1.167203, -2.840196, 0.02745098, 1, 0, 1,
-0.4516222, -1.027513, -2.197503, 0.01960784, 1, 0, 1,
-0.4466981, 0.2718849, 0.08550959, 0.01568628, 1, 0, 1,
-0.4442653, 0.228331, 0.384062, 0.007843138, 1, 0, 1,
-0.4435593, -0.09022099, -0.645847, 0.003921569, 1, 0, 1,
-0.4433608, -0.5746745, -2.390095, 0, 1, 0.003921569, 1,
-0.4392002, 0.3103089, -0.5876827, 0, 1, 0.01176471, 1,
-0.4321603, 1.761128, -1.477771, 0, 1, 0.01568628, 1,
-0.4319987, 2.097731, -1.120801, 0, 1, 0.02352941, 1,
-0.4274059, 0.4460665, -1.284406, 0, 1, 0.02745098, 1,
-0.4253274, -2.133793, -1.681781, 0, 1, 0.03529412, 1,
-0.421879, -1.051545, -2.06912, 0, 1, 0.03921569, 1,
-0.4206624, -0.676743, -4.514988, 0, 1, 0.04705882, 1,
-0.4202274, -1.046, -2.796968, 0, 1, 0.05098039, 1,
-0.418986, 2.003829, -1.561527, 0, 1, 0.05882353, 1,
-0.4179526, 0.5965584, -0.7011876, 0, 1, 0.0627451, 1,
-0.415651, 1.771203, -1.291608, 0, 1, 0.07058824, 1,
-0.4152213, -0.905479, -1.785237, 0, 1, 0.07450981, 1,
-0.4143376, -3.013397, -3.396999, 0, 1, 0.08235294, 1,
-0.4122992, -1.830285, -2.613288, 0, 1, 0.08627451, 1,
-0.4117274, -0.5933386, -4.268109, 0, 1, 0.09411765, 1,
-0.4116445, -1.973235, -3.123335, 0, 1, 0.1019608, 1,
-0.4076433, 0.5104324, -0.4256285, 0, 1, 0.1058824, 1,
-0.4028683, -1.252629, -1.400405, 0, 1, 0.1137255, 1,
-0.3972565, 1.212284, -1.012596, 0, 1, 0.1176471, 1,
-0.3945592, 1.408555, -0.07172173, 0, 1, 0.1254902, 1,
-0.3935274, 0.7601693, 1.398602, 0, 1, 0.1294118, 1,
-0.3900283, -1.766679, -2.973726, 0, 1, 0.1372549, 1,
-0.3868998, -0.6630278, -3.083843, 0, 1, 0.1411765, 1,
-0.3861773, -1.26575, -3.747784, 0, 1, 0.1490196, 1,
-0.3859722, -0.8483128, -2.846694, 0, 1, 0.1529412, 1,
-0.3853383, 0.8397133, -1.193649, 0, 1, 0.1607843, 1,
-0.3847916, -1.992566, -2.726413, 0, 1, 0.1647059, 1,
-0.3805763, -0.08688992, -2.2134, 0, 1, 0.172549, 1,
-0.3798328, 1.352543, 0.4281905, 0, 1, 0.1764706, 1,
-0.3775645, -2.391091, -2.267626, 0, 1, 0.1843137, 1,
-0.3774054, -0.3231964, -3.230506, 0, 1, 0.1882353, 1,
-0.3763315, -2.310213, -0.6394529, 0, 1, 0.1960784, 1,
-0.3747588, -0.747572, -2.603044, 0, 1, 0.2039216, 1,
-0.3738489, -0.2284413, -1.841564, 0, 1, 0.2078431, 1,
-0.3723654, 1.085874, -0.2942259, 0, 1, 0.2156863, 1,
-0.3709225, -0.009865332, -2.380123, 0, 1, 0.2196078, 1,
-0.3696536, 0.3404305, -0.5255941, 0, 1, 0.227451, 1,
-0.3682755, -1.639965, -3.254443, 0, 1, 0.2313726, 1,
-0.367895, 1.108337, -1.152253, 0, 1, 0.2392157, 1,
-0.3672359, 1.446373, -0.07991953, 0, 1, 0.2431373, 1,
-0.3663225, -0.5271834, -2.929916, 0, 1, 0.2509804, 1,
-0.3651673, -0.4605856, -2.631096, 0, 1, 0.254902, 1,
-0.364738, -1.344968, -2.085526, 0, 1, 0.2627451, 1,
-0.3600079, -0.03667342, -1.686446, 0, 1, 0.2666667, 1,
-0.3594713, -0.4183574, -2.576067, 0, 1, 0.2745098, 1,
-0.3561822, -0.6049053, -1.664267, 0, 1, 0.2784314, 1,
-0.3474725, -0.7988989, -2.394232, 0, 1, 0.2862745, 1,
-0.3432607, 0.134807, -1.769873, 0, 1, 0.2901961, 1,
-0.3431727, -0.2273253, -1.92761, 0, 1, 0.2980392, 1,
-0.343096, -1.102514, -2.029599, 0, 1, 0.3058824, 1,
-0.34068, -0.5821854, -1.990252, 0, 1, 0.3098039, 1,
-0.3373186, 1.225476, 0.4977144, 0, 1, 0.3176471, 1,
-0.3371179, 0.03777175, -1.074193, 0, 1, 0.3215686, 1,
-0.324695, 1.157695, 0.9129524, 0, 1, 0.3294118, 1,
-0.323981, 0.3177123, -1.683365, 0, 1, 0.3333333, 1,
-0.3200109, -0.4629726, -3.052164, 0, 1, 0.3411765, 1,
-0.3193716, -0.765155, -3.681126, 0, 1, 0.345098, 1,
-0.3180092, 0.08728897, -2.269264, 0, 1, 0.3529412, 1,
-0.3154977, 0.1729133, -0.5539017, 0, 1, 0.3568628, 1,
-0.3111869, 0.4839677, -2.063782, 0, 1, 0.3647059, 1,
-0.3097522, 0.2000803, -3.069123, 0, 1, 0.3686275, 1,
-0.3096459, 0.873485, 0.6787185, 0, 1, 0.3764706, 1,
-0.3056275, 0.5208594, 0.7118915, 0, 1, 0.3803922, 1,
-0.3030424, -0.891656, -2.392928, 0, 1, 0.3882353, 1,
-0.3029094, 1.684495, -1.806393, 0, 1, 0.3921569, 1,
-0.3016074, 0.1395752, -0.3483604, 0, 1, 0.4, 1,
-0.2988111, 0.4664522, -1.263741, 0, 1, 0.4078431, 1,
-0.2983159, -1.98537, -1.876841, 0, 1, 0.4117647, 1,
-0.297147, 0.5140415, -0.8428572, 0, 1, 0.4196078, 1,
-0.2929122, 2.100003, 0.4662946, 0, 1, 0.4235294, 1,
-0.2893122, -0.2382144, 0.7072952, 0, 1, 0.4313726, 1,
-0.2890131, -1.087854, -1.216195, 0, 1, 0.4352941, 1,
-0.2880858, -0.371592, -2.816742, 0, 1, 0.4431373, 1,
-0.2853824, -1.426683, -1.416602, 0, 1, 0.4470588, 1,
-0.2824455, 0.4470174, -0.09854786, 0, 1, 0.454902, 1,
-0.2805086, 1.461637, 1.221572, 0, 1, 0.4588235, 1,
-0.2774515, -1.683832, -1.580465, 0, 1, 0.4666667, 1,
-0.2612804, 0.2601393, -0.8644598, 0, 1, 0.4705882, 1,
-0.2587995, -0.9811662, -3.286976, 0, 1, 0.4784314, 1,
-0.25767, 1.468768, 1.456124, 0, 1, 0.4823529, 1,
-0.2432761, 1.130096, -0.7915193, 0, 1, 0.4901961, 1,
-0.2407085, 0.9473454, 0.1082757, 0, 1, 0.4941176, 1,
-0.2390397, 0.1298425, 1.324283, 0, 1, 0.5019608, 1,
-0.2365379, -1.228098, -1.913358, 0, 1, 0.509804, 1,
-0.2338581, 0.08261452, -2.487375, 0, 1, 0.5137255, 1,
-0.2329808, -0.1126999, -1.165077, 0, 1, 0.5215687, 1,
-0.232564, -1.317806, -3.127554, 0, 1, 0.5254902, 1,
-0.2309793, 0.4689563, 0.2916216, 0, 1, 0.5333334, 1,
-0.2309513, 0.5991609, -0.5943582, 0, 1, 0.5372549, 1,
-0.2257918, -0.9989311, -2.306836, 0, 1, 0.5450981, 1,
-0.2220573, 1.79273, 1.746581, 0, 1, 0.5490196, 1,
-0.2167661, -1.187829, -2.170588, 0, 1, 0.5568628, 1,
-0.2155515, -0.0767104, -1.844435, 0, 1, 0.5607843, 1,
-0.2100123, 2.07736, 1.779401, 0, 1, 0.5686275, 1,
-0.2096579, -0.3699472, -3.475876, 0, 1, 0.572549, 1,
-0.2078137, -0.6505469, -3.152195, 0, 1, 0.5803922, 1,
-0.2076612, 0.08027641, -2.592627, 0, 1, 0.5843138, 1,
-0.2067508, -0.8972322, -4.347134, 0, 1, 0.5921569, 1,
-0.2058778, 1.230642, 0.9100817, 0, 1, 0.5960785, 1,
-0.205511, -0.5622019, -0.7848837, 0, 1, 0.6039216, 1,
-0.2021185, -1.012512, -4.594604, 0, 1, 0.6117647, 1,
-0.199734, -1.798544, -4.868655, 0, 1, 0.6156863, 1,
-0.1986063, -1.338907, -4.728421, 0, 1, 0.6235294, 1,
-0.1977937, 1.021521, -0.5531763, 0, 1, 0.627451, 1,
-0.1937443, -0.7749796, -3.396089, 0, 1, 0.6352941, 1,
-0.1935379, 0.06695799, -2.34019, 0, 1, 0.6392157, 1,
-0.187372, -1.251095, -1.729187, 0, 1, 0.6470588, 1,
-0.1872149, -1.088905, -2.990307, 0, 1, 0.6509804, 1,
-0.1833411, 0.4497572, 0.8097242, 0, 1, 0.6588235, 1,
-0.1821755, -0.4627432, -4.653843, 0, 1, 0.6627451, 1,
-0.1807616, 0.4467864, -0.4596303, 0, 1, 0.6705883, 1,
-0.1794403, 0.450219, -0.9706595, 0, 1, 0.6745098, 1,
-0.1775744, -1.974606, -4.963214, 0, 1, 0.682353, 1,
-0.1723888, 1.609093, -0.01606519, 0, 1, 0.6862745, 1,
-0.1710356, 1.116649, -1.017767, 0, 1, 0.6941177, 1,
-0.1688791, -1.620131, -2.963687, 0, 1, 0.7019608, 1,
-0.1665037, 0.8059897, 0.1917504, 0, 1, 0.7058824, 1,
-0.1570998, 0.2681395, -0.8364847, 0, 1, 0.7137255, 1,
-0.1565865, -0.1891225, -2.082755, 0, 1, 0.7176471, 1,
-0.1561013, -0.5430187, -4.251821, 0, 1, 0.7254902, 1,
-0.1544658, -0.3309832, -1.629391, 0, 1, 0.7294118, 1,
-0.1538409, 0.05633081, -1.411828, 0, 1, 0.7372549, 1,
-0.1511307, 0.7858992, -0.683654, 0, 1, 0.7411765, 1,
-0.1498377, -0.695435, -2.594773, 0, 1, 0.7490196, 1,
-0.1420006, 1.56951, 1.048133, 0, 1, 0.7529412, 1,
-0.1406991, 1.589146, -0.02285684, 0, 1, 0.7607843, 1,
-0.1347108, -0.694345, -3.580044, 0, 1, 0.7647059, 1,
-0.1336061, 0.05719467, -1.779967, 0, 1, 0.772549, 1,
-0.1309129, 0.5311781, -1.26989, 0, 1, 0.7764706, 1,
-0.1281968, -0.601325, -3.12805, 0, 1, 0.7843137, 1,
-0.1272346, 0.8610913, -1.139158, 0, 1, 0.7882353, 1,
-0.1267166, 0.5444485, 0.7326422, 0, 1, 0.7960784, 1,
-0.1222804, 1.766991, -0.754645, 0, 1, 0.8039216, 1,
-0.1214613, 0.3190235, 0.6909204, 0, 1, 0.8078431, 1,
-0.1154789, -1.153678, -4.288139, 0, 1, 0.8156863, 1,
-0.1153938, -0.6817167, -1.290177, 0, 1, 0.8196079, 1,
-0.1144553, 0.7165124, -0.1210658, 0, 1, 0.827451, 1,
-0.1133504, -0.3960715, -1.836947, 0, 1, 0.8313726, 1,
-0.112419, 0.604657, 0.357409, 0, 1, 0.8392157, 1,
-0.1095858, 0.7940975, 0.3731837, 0, 1, 0.8431373, 1,
-0.1091794, -0.8705112, -3.519725, 0, 1, 0.8509804, 1,
-0.1076643, -0.5879556, -0.001725867, 0, 1, 0.854902, 1,
-0.1052804, -0.5146683, -1.776014, 0, 1, 0.8627451, 1,
-0.09640416, 0.4502279, 0.2616992, 0, 1, 0.8666667, 1,
-0.09584744, -1.290686, -3.40134, 0, 1, 0.8745098, 1,
-0.09521398, 1.992627, -0.2017366, 0, 1, 0.8784314, 1,
-0.09158766, -0.7185465, -3.821496, 0, 1, 0.8862745, 1,
-0.0898583, -0.7228271, -4.366571, 0, 1, 0.8901961, 1,
-0.08548896, 0.0787434, -0.6713706, 0, 1, 0.8980392, 1,
-0.08516441, 1.747033, 0.1996035, 0, 1, 0.9058824, 1,
-0.08488351, -0.4560393, -4.270841, 0, 1, 0.9098039, 1,
-0.08019806, 0.2714203, -1.878164, 0, 1, 0.9176471, 1,
-0.07937992, -0.7869699, -1.730013, 0, 1, 0.9215686, 1,
-0.07922443, 0.5566534, 0.6779018, 0, 1, 0.9294118, 1,
-0.07659253, 0.05691079, -1.80543, 0, 1, 0.9333333, 1,
-0.07207001, -0.9242644, -4.269507, 0, 1, 0.9411765, 1,
-0.0702673, -1.630567, -2.745405, 0, 1, 0.945098, 1,
-0.06919368, 0.3697799, -0.1533667, 0, 1, 0.9529412, 1,
-0.06864862, -0.5445088, -3.282835, 0, 1, 0.9568627, 1,
-0.06691238, -1.649517, -2.879651, 0, 1, 0.9647059, 1,
-0.05810965, -0.584425, -3.534341, 0, 1, 0.9686275, 1,
-0.05501539, -0.3295893, -3.027055, 0, 1, 0.9764706, 1,
-0.05372468, 0.1970957, -0.4953464, 0, 1, 0.9803922, 1,
-0.04751454, -1.065766, -3.505637, 0, 1, 0.9882353, 1,
-0.04165937, -0.8091873, -2.721948, 0, 1, 0.9921569, 1,
-0.04127671, 0.6543594, -1.304361, 0, 1, 1, 1,
-0.03729508, -0.4287166, -2.978485, 0, 0.9921569, 1, 1,
-0.03275157, -1.1353, -4.820271, 0, 0.9882353, 1, 1,
-0.02974691, 0.6710454, 0.3229587, 0, 0.9803922, 1, 1,
-0.02192066, 0.46865, 0.760228, 0, 0.9764706, 1, 1,
-0.02090188, -1.197019, -2.996067, 0, 0.9686275, 1, 1,
-0.02046141, -0.2512518, -4.918478, 0, 0.9647059, 1, 1,
-0.01865301, 0.1004771, -0.7073557, 0, 0.9568627, 1, 1,
-0.009269084, -1.214145, -3.118919, 0, 0.9529412, 1, 1,
-0.008633776, -1.136155, -3.132012, 0, 0.945098, 1, 1,
-0.004872344, -0.02589311, -3.082699, 0, 0.9411765, 1, 1,
-0.0009792261, -0.07719604, -4.203108, 0, 0.9333333, 1, 1,
-0.0001402734, 0.8675591, 1.251988, 0, 0.9294118, 1, 1,
0.0005395054, -0.2888997, 4.014388, 0, 0.9215686, 1, 1,
0.001346136, 1.467882, -0.731527, 0, 0.9176471, 1, 1,
0.004167239, -0.4706068, 3.363113, 0, 0.9098039, 1, 1,
0.004230756, 0.08901493, 0.7524426, 0, 0.9058824, 1, 1,
0.008156911, -0.8506577, 4.349986, 0, 0.8980392, 1, 1,
0.008815602, -0.8117099, 2.245501, 0, 0.8901961, 1, 1,
0.01059254, -0.160314, 2.454949, 0, 0.8862745, 1, 1,
0.0117349, -2.057414, 1.498532, 0, 0.8784314, 1, 1,
0.01230208, 1.271035, -0.7355398, 0, 0.8745098, 1, 1,
0.01304593, -0.8086339, 1.088129, 0, 0.8666667, 1, 1,
0.0140151, -1.710436, 4.075987, 0, 0.8627451, 1, 1,
0.01510724, 0.6200622, -0.6691975, 0, 0.854902, 1, 1,
0.01549444, 0.5188497, -0.3454267, 0, 0.8509804, 1, 1,
0.01559429, -1.641456, 2.835394, 0, 0.8431373, 1, 1,
0.01599253, -0.9750791, 2.363041, 0, 0.8392157, 1, 1,
0.01646205, -0.03794207, 1.341797, 0, 0.8313726, 1, 1,
0.01686241, -0.81075, 0.8556721, 0, 0.827451, 1, 1,
0.01797549, -0.763185, 2.442179, 0, 0.8196079, 1, 1,
0.02068379, 0.1047163, -0.5747626, 0, 0.8156863, 1, 1,
0.02196555, -0.5236785, 3.909472, 0, 0.8078431, 1, 1,
0.02217503, 0.4891903, -0.5545717, 0, 0.8039216, 1, 1,
0.02420437, -0.8433912, 3.283102, 0, 0.7960784, 1, 1,
0.02537392, -1.817069, 2.03964, 0, 0.7882353, 1, 1,
0.02790015, 0.4359056, 0.8614087, 0, 0.7843137, 1, 1,
0.0302392, 0.7537818, 0.8475841, 0, 0.7764706, 1, 1,
0.03391425, 0.8560105, 0.2554971, 0, 0.772549, 1, 1,
0.04374047, 1.22272, -0.1229993, 0, 0.7647059, 1, 1,
0.04714415, -1.032847, 2.489704, 0, 0.7607843, 1, 1,
0.04966533, -0.08727523, 2.97816, 0, 0.7529412, 1, 1,
0.05297657, 0.6430699, -0.2407749, 0, 0.7490196, 1, 1,
0.05845674, -1.956289, 4.053248, 0, 0.7411765, 1, 1,
0.0625529, 0.1680751, -0.235377, 0, 0.7372549, 1, 1,
0.06447813, 1.429295, -1.410726, 0, 0.7294118, 1, 1,
0.0674577, 1.676182, 1.213625, 0, 0.7254902, 1, 1,
0.06879726, -0.3871729, 3.427695, 0, 0.7176471, 1, 1,
0.07171996, -0.8324584, 1.599882, 0, 0.7137255, 1, 1,
0.07240742, -1.080088, 3.046756, 0, 0.7058824, 1, 1,
0.0767434, -2.499876, 2.882224, 0, 0.6980392, 1, 1,
0.08046546, 0.3999166, -0.473354, 0, 0.6941177, 1, 1,
0.0829085, -0.1077051, 2.582458, 0, 0.6862745, 1, 1,
0.08293878, 1.440999, -0.7259226, 0, 0.682353, 1, 1,
0.0957832, 0.8108003, 0.3110975, 0, 0.6745098, 1, 1,
0.09806225, 0.1668156, -0.4229159, 0, 0.6705883, 1, 1,
0.1002048, 0.7774518, 0.6009201, 0, 0.6627451, 1, 1,
0.1007634, -0.3252421, 1.401578, 0, 0.6588235, 1, 1,
0.1017918, -0.04913594, 1.618043, 0, 0.6509804, 1, 1,
0.1037129, -0.3236685, 3.782681, 0, 0.6470588, 1, 1,
0.1051339, -0.2015906, 1.932135, 0, 0.6392157, 1, 1,
0.1083263, -0.2505201, 1.460989, 0, 0.6352941, 1, 1,
0.1086179, 1.143469, -1.7309, 0, 0.627451, 1, 1,
0.1097125, 1.084846, -1.210006, 0, 0.6235294, 1, 1,
0.1140818, 1.56221, 2.000808, 0, 0.6156863, 1, 1,
0.1150404, 0.2653201, 1.030763, 0, 0.6117647, 1, 1,
0.1204105, -0.2085174, 3.625552, 0, 0.6039216, 1, 1,
0.1223403, -0.102386, 2.779421, 0, 0.5960785, 1, 1,
0.1233051, -1.336583, 2.591607, 0, 0.5921569, 1, 1,
0.1256031, 1.10626, 1.191306, 0, 0.5843138, 1, 1,
0.1257367, -0.0585401, 1.091243, 0, 0.5803922, 1, 1,
0.1260381, 0.8313155, 0.647535, 0, 0.572549, 1, 1,
0.1283616, 0.1606542, 0.4696172, 0, 0.5686275, 1, 1,
0.1287005, 0.6751848, 0.9421644, 0, 0.5607843, 1, 1,
0.1295452, 0.7191603, 0.4824212, 0, 0.5568628, 1, 1,
0.1341831, 0.450293, 1.479814, 0, 0.5490196, 1, 1,
0.1347503, -0.5453403, 3.757093, 0, 0.5450981, 1, 1,
0.1371324, 0.6639736, 1.331528, 0, 0.5372549, 1, 1,
0.1379611, -0.09068412, 0.9630339, 0, 0.5333334, 1, 1,
0.1384327, -0.939588, 2.680866, 0, 0.5254902, 1, 1,
0.1389635, -0.04295864, 3.03866, 0, 0.5215687, 1, 1,
0.1390914, 1.472119, -0.1217079, 0, 0.5137255, 1, 1,
0.1463313, 0.4458582, -1.082679, 0, 0.509804, 1, 1,
0.1502763, 1.13358, 0.3164195, 0, 0.5019608, 1, 1,
0.1596079, 0.7429329, 0.4097101, 0, 0.4941176, 1, 1,
0.1658285, 0.1690398, 1.245162, 0, 0.4901961, 1, 1,
0.1700498, 0.731271, 1.768027, 0, 0.4823529, 1, 1,
0.1713151, -1.401516, 4.184222, 0, 0.4784314, 1, 1,
0.172563, 0.930671, 0.1142693, 0, 0.4705882, 1, 1,
0.1727368, -0.4133942, 2.329461, 0, 0.4666667, 1, 1,
0.1764289, 1.601956, 0.67197, 0, 0.4588235, 1, 1,
0.1773645, 0.5654038, -0.3274543, 0, 0.454902, 1, 1,
0.1786648, 0.3540692, 0.3900392, 0, 0.4470588, 1, 1,
0.1861704, 0.9927455, -0.8092641, 0, 0.4431373, 1, 1,
0.1915284, -1.156126, 3.029913, 0, 0.4352941, 1, 1,
0.196351, -1.505492, 3.634915, 0, 0.4313726, 1, 1,
0.1997222, 0.1141863, 0.7855804, 0, 0.4235294, 1, 1,
0.199799, -0.4936325, 2.237755, 0, 0.4196078, 1, 1,
0.2001152, 0.4157858, 2.429524, 0, 0.4117647, 1, 1,
0.2008872, 0.04175076, -0.574011, 0, 0.4078431, 1, 1,
0.201697, -0.9545971, 1.005776, 0, 0.4, 1, 1,
0.2028058, 0.6280072, 1.994412, 0, 0.3921569, 1, 1,
0.2036556, -0.5031841, 2.034836, 0, 0.3882353, 1, 1,
0.2041739, 0.1402723, 0.3447964, 0, 0.3803922, 1, 1,
0.2050173, 1.084132, -1.519626, 0, 0.3764706, 1, 1,
0.2052783, 0.8393751, 0.6505579, 0, 0.3686275, 1, 1,
0.2083828, 1.590261, 1.490689, 0, 0.3647059, 1, 1,
0.2103898, 0.6412867, 0.6006073, 0, 0.3568628, 1, 1,
0.2226973, 1.181284, 0.9302319, 0, 0.3529412, 1, 1,
0.2233827, -0.5981321, 2.160464, 0, 0.345098, 1, 1,
0.2234166, -0.4957706, 1.459332, 0, 0.3411765, 1, 1,
0.2237183, 0.8946037, 0.3999731, 0, 0.3333333, 1, 1,
0.2397813, 1.346878, 1.355916, 0, 0.3294118, 1, 1,
0.2403058, -3.027954, 2.196839, 0, 0.3215686, 1, 1,
0.2419875, -0.7359046, 1.222116, 0, 0.3176471, 1, 1,
0.2436492, 0.2169316, -0.4018316, 0, 0.3098039, 1, 1,
0.2586418, 0.507397, 1.525274, 0, 0.3058824, 1, 1,
0.262879, 0.957092, -0.6679277, 0, 0.2980392, 1, 1,
0.2664481, 0.1882231, 0.9601244, 0, 0.2901961, 1, 1,
0.2687081, 1.558286, -0.5072567, 0, 0.2862745, 1, 1,
0.2731788, 0.1838158, 1.397161, 0, 0.2784314, 1, 1,
0.2784429, -0.8148447, 2.948063, 0, 0.2745098, 1, 1,
0.2806515, -0.3511409, 1.89054, 0, 0.2666667, 1, 1,
0.2809698, 0.2706545, 1.620693, 0, 0.2627451, 1, 1,
0.2868142, 0.9645662, -0.7597483, 0, 0.254902, 1, 1,
0.2931508, -0.6364302, 1.880365, 0, 0.2509804, 1, 1,
0.2941647, -0.3738302, 2.849904, 0, 0.2431373, 1, 1,
0.2946585, 1.146365, -0.9953185, 0, 0.2392157, 1, 1,
0.2957187, 1.584034, -0.9273565, 0, 0.2313726, 1, 1,
0.2985663, -0.559745, 2.533688, 0, 0.227451, 1, 1,
0.2986648, 1.864407, -0.5951695, 0, 0.2196078, 1, 1,
0.3007017, -0.5049226, 3.754439, 0, 0.2156863, 1, 1,
0.3011138, 0.6204218, 1.390517, 0, 0.2078431, 1, 1,
0.3025125, 0.7285399, 1.251677, 0, 0.2039216, 1, 1,
0.3029573, -0.5532973, 2.075685, 0, 0.1960784, 1, 1,
0.3058863, -1.078607, 2.083529, 0, 0.1882353, 1, 1,
0.3074217, -0.004236381, 3.856525, 0, 0.1843137, 1, 1,
0.3098201, -0.7721038, 3.170683, 0, 0.1764706, 1, 1,
0.3126424, -1.34212, 3.31497, 0, 0.172549, 1, 1,
0.3132349, -0.4241627, 2.107206, 0, 0.1647059, 1, 1,
0.3166396, -1.43258, 3.992828, 0, 0.1607843, 1, 1,
0.3187229, -0.791703, 1.453184, 0, 0.1529412, 1, 1,
0.3208696, 0.7491177, 1.542248, 0, 0.1490196, 1, 1,
0.3211119, 0.889376, 0.38366, 0, 0.1411765, 1, 1,
0.321371, -0.3140976, 1.881421, 0, 0.1372549, 1, 1,
0.3232274, -0.06960435, 2.924017, 0, 0.1294118, 1, 1,
0.3275553, -0.7335186, 1.419716, 0, 0.1254902, 1, 1,
0.329018, -1.776896, 2.198619, 0, 0.1176471, 1, 1,
0.3300785, -0.1687611, 1.294796, 0, 0.1137255, 1, 1,
0.3309062, 2.163292, -1.009053, 0, 0.1058824, 1, 1,
0.3327437, 0.9077193, 1.838745, 0, 0.09803922, 1, 1,
0.3352689, 0.6199915, 0.6068807, 0, 0.09411765, 1, 1,
0.3362306, 0.5033335, 0.1244496, 0, 0.08627451, 1, 1,
0.3391672, -0.3091179, 1.582834, 0, 0.08235294, 1, 1,
0.3423075, 1.525916, 0.5820634, 0, 0.07450981, 1, 1,
0.3427899, -1.375102, 2.741812, 0, 0.07058824, 1, 1,
0.3475902, 0.1725578, 0.8662321, 0, 0.0627451, 1, 1,
0.3489948, 1.16437, 1.0902, 0, 0.05882353, 1, 1,
0.3499762, -1.246407, 3.446255, 0, 0.05098039, 1, 1,
0.3606995, -0.01327608, 0.8058459, 0, 0.04705882, 1, 1,
0.362642, -2.31516, 2.354656, 0, 0.03921569, 1, 1,
0.3652, -0.8146426, 2.685678, 0, 0.03529412, 1, 1,
0.3677678, 1.187079, -0.4719475, 0, 0.02745098, 1, 1,
0.3691901, 0.3205794, 0.6336373, 0, 0.02352941, 1, 1,
0.3702138, 1.223257, -0.85675, 0, 0.01568628, 1, 1,
0.3723029, -0.4797232, 2.801696, 0, 0.01176471, 1, 1,
0.372396, -1.349295, 3.011904, 0, 0.003921569, 1, 1,
0.3813317, 1.156618, -0.04661286, 0.003921569, 0, 1, 1,
0.3814392, -0.346606, 2.204741, 0.007843138, 0, 1, 1,
0.3826101, 0.8314385, -0.07339634, 0.01568628, 0, 1, 1,
0.3877857, -0.07030755, 2.469981, 0.01960784, 0, 1, 1,
0.3979787, -1.183311, 1.852269, 0.02745098, 0, 1, 1,
0.3985614, -3.155517, 1.951246, 0.03137255, 0, 1, 1,
0.3992627, 1.179013, -0.767341, 0.03921569, 0, 1, 1,
0.3997355, -0.5082778, 3.793238, 0.04313726, 0, 1, 1,
0.4025446, 0.1009296, 1.294812, 0.05098039, 0, 1, 1,
0.4026712, -0.9916832, 1.050068, 0.05490196, 0, 1, 1,
0.4064402, 1.066153, 1.03017, 0.0627451, 0, 1, 1,
0.4104155, -1.410254, 2.830518, 0.06666667, 0, 1, 1,
0.4217901, -1.422957, 3.429734, 0.07450981, 0, 1, 1,
0.4228506, 1.161085, 0.2379432, 0.07843138, 0, 1, 1,
0.4261908, -0.07040135, 2.022524, 0.08627451, 0, 1, 1,
0.4317693, -0.2212935, 1.280588, 0.09019608, 0, 1, 1,
0.4349616, -0.3380577, 2.490713, 0.09803922, 0, 1, 1,
0.4359636, 0.7943374, -0.2734117, 0.1058824, 0, 1, 1,
0.4375662, -0.349864, 2.628, 0.1098039, 0, 1, 1,
0.4377992, 0.1699062, -0.4170485, 0.1176471, 0, 1, 1,
0.4378424, -1.581733, 3.790886, 0.1215686, 0, 1, 1,
0.4396769, 1.631962, 0.334098, 0.1294118, 0, 1, 1,
0.4440387, -1.823269, 1.225619, 0.1333333, 0, 1, 1,
0.4526075, 1.089347, 1.109383, 0.1411765, 0, 1, 1,
0.4527686, -1.137807, 3.387634, 0.145098, 0, 1, 1,
0.4639552, 0.5778924, 0.3392305, 0.1529412, 0, 1, 1,
0.4725724, -0.3211516, 1.844526, 0.1568628, 0, 1, 1,
0.4798587, -0.9585798, 2.047975, 0.1647059, 0, 1, 1,
0.4809481, 0.7912331, 1.366799, 0.1686275, 0, 1, 1,
0.4812042, 0.4824061, 0.3849071, 0.1764706, 0, 1, 1,
0.4837975, -0.09396325, 1.795459, 0.1803922, 0, 1, 1,
0.4842893, -0.9990994, 4.839687, 0.1882353, 0, 1, 1,
0.4860705, -0.5282533, 1.160338, 0.1921569, 0, 1, 1,
0.4878364, -0.8113694, 2.618917, 0.2, 0, 1, 1,
0.4890523, -1.257147, 2.195202, 0.2078431, 0, 1, 1,
0.492648, 0.5181327, -0.3294056, 0.2117647, 0, 1, 1,
0.4930121, 0.5859657, 0.09711856, 0.2196078, 0, 1, 1,
0.4930335, -1.111707, 1.769475, 0.2235294, 0, 1, 1,
0.4973359, 0.7100257, 1.019172, 0.2313726, 0, 1, 1,
0.4993006, -1.000171, 1.955618, 0.2352941, 0, 1, 1,
0.4999842, -0.1554323, 3.123011, 0.2431373, 0, 1, 1,
0.5039513, -0.7436384, 2.742344, 0.2470588, 0, 1, 1,
0.50427, 0.862343, 1.376542, 0.254902, 0, 1, 1,
0.5092976, -1.492956, 3.353724, 0.2588235, 0, 1, 1,
0.5109193, -0.2236221, 2.912345, 0.2666667, 0, 1, 1,
0.5122482, 0.02507746, 2.013311, 0.2705882, 0, 1, 1,
0.5152906, -0.4728926, 2.156546, 0.2784314, 0, 1, 1,
0.5183688, -1.330012, 3.055475, 0.282353, 0, 1, 1,
0.5185754, -0.6005021, 2.001053, 0.2901961, 0, 1, 1,
0.5209108, 1.088396, 0.960982, 0.2941177, 0, 1, 1,
0.5212037, -1.48646, 2.055556, 0.3019608, 0, 1, 1,
0.5233712, 0.6997639, 0.1009316, 0.3098039, 0, 1, 1,
0.5275059, -0.6523454, 3.569157, 0.3137255, 0, 1, 1,
0.5339814, 0.476608, 1.280395, 0.3215686, 0, 1, 1,
0.5384773, 0.3942018, 1.026396, 0.3254902, 0, 1, 1,
0.5409458, 1.289459, 1.031871, 0.3333333, 0, 1, 1,
0.5443179, -0.4364801, 1.049375, 0.3372549, 0, 1, 1,
0.5454355, -0.1122826, 3.380261, 0.345098, 0, 1, 1,
0.5463317, 2.345538, -0.1174051, 0.3490196, 0, 1, 1,
0.5482291, 0.3025597, 0.6470798, 0.3568628, 0, 1, 1,
0.5485417, -0.2976502, 2.030563, 0.3607843, 0, 1, 1,
0.5498396, -1.305492, 3.353144, 0.3686275, 0, 1, 1,
0.5514893, 1.27051, 1.445397, 0.372549, 0, 1, 1,
0.5520169, -0.2798618, -0.5072398, 0.3803922, 0, 1, 1,
0.5566361, -0.4954324, 3.312532, 0.3843137, 0, 1, 1,
0.5625104, 1.82332, 1.5869, 0.3921569, 0, 1, 1,
0.5689182, -0.5120464, 2.198295, 0.3960784, 0, 1, 1,
0.5699034, 1.365922, 1.837603, 0.4039216, 0, 1, 1,
0.571013, 1.009379, 0.3624035, 0.4117647, 0, 1, 1,
0.5713546, -0.1308821, -0.4220241, 0.4156863, 0, 1, 1,
0.5746394, 0.1507217, 1.402907, 0.4235294, 0, 1, 1,
0.5757439, 0.1020236, 0.6263098, 0.427451, 0, 1, 1,
0.5812081, 0.7512052, 0.1803562, 0.4352941, 0, 1, 1,
0.5847553, 0.1080017, 2.987889, 0.4392157, 0, 1, 1,
0.5904557, 0.9270435, 2.248325, 0.4470588, 0, 1, 1,
0.5909665, 1.279158, 1.249288, 0.4509804, 0, 1, 1,
0.5933813, 0.2338478, -0.0438321, 0.4588235, 0, 1, 1,
0.5940791, -0.6881128, 1.551659, 0.4627451, 0, 1, 1,
0.5947971, 1.037971, 1.253387, 0.4705882, 0, 1, 1,
0.5993143, -0.4010924, 1.373573, 0.4745098, 0, 1, 1,
0.6013642, 1.852582, 1.445661, 0.4823529, 0, 1, 1,
0.6017529, -0.7081521, 2.732716, 0.4862745, 0, 1, 1,
0.6100955, -0.677675, 2.327395, 0.4941176, 0, 1, 1,
0.6263956, 0.3673676, 0.9750887, 0.5019608, 0, 1, 1,
0.6281446, 1.204787, 0.4098352, 0.5058824, 0, 1, 1,
0.6286808, -0.2997357, 2.367357, 0.5137255, 0, 1, 1,
0.6307176, 2.602409, -1.910146, 0.5176471, 0, 1, 1,
0.6314635, 1.017126, 0.6868954, 0.5254902, 0, 1, 1,
0.6344858, -0.1759912, 2.080693, 0.5294118, 0, 1, 1,
0.6353467, -0.1841296, -0.1537298, 0.5372549, 0, 1, 1,
0.6364967, 0.8489364, 0.7676983, 0.5411765, 0, 1, 1,
0.6372783, 1.056819, 1.007897, 0.5490196, 0, 1, 1,
0.6385579, 0.6084527, 1.739331, 0.5529412, 0, 1, 1,
0.6400012, 0.0548934, 2.092947, 0.5607843, 0, 1, 1,
0.6414971, 0.423345, 2.194369, 0.5647059, 0, 1, 1,
0.6449314, -1.385593, 1.828665, 0.572549, 0, 1, 1,
0.6472246, 0.9565889, -0.6600108, 0.5764706, 0, 1, 1,
0.6572842, 0.08513697, 2.71688, 0.5843138, 0, 1, 1,
0.6575958, -0.3238011, 2.40207, 0.5882353, 0, 1, 1,
0.6599223, -0.45533, 2.707871, 0.5960785, 0, 1, 1,
0.6619956, 0.02630658, 2.121301, 0.6039216, 0, 1, 1,
0.6623404, 0.3210187, 0.4378783, 0.6078432, 0, 1, 1,
0.6648468, -0.6129764, 2.573434, 0.6156863, 0, 1, 1,
0.6661273, 1.215016, 0.6858631, 0.6196079, 0, 1, 1,
0.6662771, -0.45336, 2.578897, 0.627451, 0, 1, 1,
0.668618, -0.3897303, 2.628778, 0.6313726, 0, 1, 1,
0.6699625, 0.1695352, 0.05237254, 0.6392157, 0, 1, 1,
0.6710105, 0.0731122, 0.006429303, 0.6431373, 0, 1, 1,
0.6784343, -0.06664095, 1.408038, 0.6509804, 0, 1, 1,
0.6790812, -1.422956, 2.736526, 0.654902, 0, 1, 1,
0.6791179, -0.1376223, 0.4002051, 0.6627451, 0, 1, 1,
0.6808551, 0.9964869, 1.13715, 0.6666667, 0, 1, 1,
0.6931342, 0.5776044, 1.139285, 0.6745098, 0, 1, 1,
0.6946104, -1.070054, 1.174234, 0.6784314, 0, 1, 1,
0.6963862, -0.2107629, 2.130376, 0.6862745, 0, 1, 1,
0.6988602, -0.1397257, 2.183719, 0.6901961, 0, 1, 1,
0.6992139, -0.05112867, 0.8707252, 0.6980392, 0, 1, 1,
0.7029156, 0.7283619, 0.7540974, 0.7058824, 0, 1, 1,
0.7043384, -1.612914, 2.90637, 0.7098039, 0, 1, 1,
0.7095019, 1.334026, -0.7369414, 0.7176471, 0, 1, 1,
0.7100305, -0.8411407, 1.297583, 0.7215686, 0, 1, 1,
0.710539, -0.9269304, 1.238839, 0.7294118, 0, 1, 1,
0.7108808, 0.2434087, 1.647073, 0.7333333, 0, 1, 1,
0.7110203, 0.3245668, 1.006203, 0.7411765, 0, 1, 1,
0.7146205, 1.33771, -1.663512, 0.7450981, 0, 1, 1,
0.7243966, 0.1728919, 2.870739, 0.7529412, 0, 1, 1,
0.7257175, -0.8081804, 1.915308, 0.7568628, 0, 1, 1,
0.7271289, 2.156655, -0.04238619, 0.7647059, 0, 1, 1,
0.733216, 1.5068, 0.2070383, 0.7686275, 0, 1, 1,
0.7353414, 1.334751, 0.8159376, 0.7764706, 0, 1, 1,
0.7360669, 1.967365, 1.023934, 0.7803922, 0, 1, 1,
0.7368706, -0.6906347, 1.432265, 0.7882353, 0, 1, 1,
0.7380332, 0.1644013, 1.571108, 0.7921569, 0, 1, 1,
0.7483939, -0.1194153, 1.598828, 0.8, 0, 1, 1,
0.7491028, -1.807861, 1.869018, 0.8078431, 0, 1, 1,
0.7524585, 0.5324777, 0.7848608, 0.8117647, 0, 1, 1,
0.7555478, 1.303848, 0.7070192, 0.8196079, 0, 1, 1,
0.7609305, 0.7556841, 1.179843, 0.8235294, 0, 1, 1,
0.7662027, 0.789064, 0.3969944, 0.8313726, 0, 1, 1,
0.773288, -0.2372231, 1.96895, 0.8352941, 0, 1, 1,
0.7769008, -0.0264763, 1.306857, 0.8431373, 0, 1, 1,
0.7826469, 0.4448312, 1.372729, 0.8470588, 0, 1, 1,
0.7832574, 0.6830822, 1.278493, 0.854902, 0, 1, 1,
0.7976587, 0.1397648, 2.521122, 0.8588235, 0, 1, 1,
0.7983454, -0.1659277, 2.030416, 0.8666667, 0, 1, 1,
0.8086047, 0.2862305, 1.387683, 0.8705882, 0, 1, 1,
0.8104325, 2.55918, -0.2656062, 0.8784314, 0, 1, 1,
0.8138071, -0.8715141, 4.374738, 0.8823529, 0, 1, 1,
0.8144571, 0.1641107, 2.919379, 0.8901961, 0, 1, 1,
0.8180165, 1.395957, 1.6858, 0.8941177, 0, 1, 1,
0.8270513, -1.348846, 3.687842, 0.9019608, 0, 1, 1,
0.8293503, -0.117989, -0.642593, 0.9098039, 0, 1, 1,
0.832014, 0.945932, 0.6586576, 0.9137255, 0, 1, 1,
0.8506911, -0.2363659, 2.574515, 0.9215686, 0, 1, 1,
0.8816282, 0.2093216, 1.628882, 0.9254902, 0, 1, 1,
0.8959969, -0.5362722, 2.971701, 0.9333333, 0, 1, 1,
0.9050351, 0.6705927, 2.702033, 0.9372549, 0, 1, 1,
0.9100417, 0.4638698, 2.210196, 0.945098, 0, 1, 1,
0.9105628, -1.460436, 3.354533, 0.9490196, 0, 1, 1,
0.9148213, -1.824872, 2.233571, 0.9568627, 0, 1, 1,
0.9173961, -1.869104, 2.495438, 0.9607843, 0, 1, 1,
0.9197012, 0.6422868, -1.11826, 0.9686275, 0, 1, 1,
0.9211801, 0.4165271, 1.488292, 0.972549, 0, 1, 1,
0.9227837, -1.091146, 2.081609, 0.9803922, 0, 1, 1,
0.9351846, 0.3665866, -0.4246167, 0.9843137, 0, 1, 1,
0.9361439, -0.2248055, 1.18046, 0.9921569, 0, 1, 1,
0.9373764, 0.952182, 1.414549, 0.9960784, 0, 1, 1,
0.9397309, 0.7294309, 1.581127, 1, 0, 0.9960784, 1,
0.9483235, 2.349134, 0.149889, 1, 0, 0.9882353, 1,
0.9531785, 0.08437959, 0.4213802, 1, 0, 0.9843137, 1,
0.9556654, 0.97411, 1.111398, 1, 0, 0.9764706, 1,
0.9586602, 0.4853464, 0.2338347, 1, 0, 0.972549, 1,
0.9611954, 0.9869109, 0.0562642, 1, 0, 0.9647059, 1,
0.9652981, -0.2614182, 2.375775, 1, 0, 0.9607843, 1,
0.9653016, -1.042981, 3.685198, 1, 0, 0.9529412, 1,
0.9693334, -0.758292, 2.356259, 1, 0, 0.9490196, 1,
0.9748564, 2.217463, 1.678327, 1, 0, 0.9411765, 1,
0.9875489, 1.967229, -0.9132438, 1, 0, 0.9372549, 1,
0.9879705, 0.5953079, 1.389769, 1, 0, 0.9294118, 1,
0.9901485, 0.9015826, 1.933511, 1, 0, 0.9254902, 1,
0.9942524, 2.571195, 0.5113358, 1, 0, 0.9176471, 1,
1.002988, 1.193528, 0.4257097, 1, 0, 0.9137255, 1,
1.005219, 0.6769624, 0.5297455, 1, 0, 0.9058824, 1,
1.006358, 0.7781538, 1.838655, 1, 0, 0.9019608, 1,
1.00736, 0.0200337, 2.12392, 1, 0, 0.8941177, 1,
1.007789, -1.199627, 1.033462, 1, 0, 0.8862745, 1,
1.008415, -1.043213, 1.879844, 1, 0, 0.8823529, 1,
1.013164, 1.990252, 0.9930992, 1, 0, 0.8745098, 1,
1.01338, -0.1520612, 1.82085, 1, 0, 0.8705882, 1,
1.014168, 0.4912194, 3.574662, 1, 0, 0.8627451, 1,
1.028136, 0.03678991, 1.100881, 1, 0, 0.8588235, 1,
1.030439, -0.7232362, 3.47681, 1, 0, 0.8509804, 1,
1.032335, -1.483288, 2.848574, 1, 0, 0.8470588, 1,
1.032576, -0.6037682, 1.824983, 1, 0, 0.8392157, 1,
1.03885, 0.7805249, 0.625542, 1, 0, 0.8352941, 1,
1.045737, -0.7608572, 1.995564, 1, 0, 0.827451, 1,
1.049281, 0.6039824, -0.1778369, 1, 0, 0.8235294, 1,
1.050316, 0.09243681, 3.782999, 1, 0, 0.8156863, 1,
1.057763, 0.8544614, 1.282249, 1, 0, 0.8117647, 1,
1.058631, 0.9741197, 1.5009, 1, 0, 0.8039216, 1,
1.070054, -1.009151, 0.04779718, 1, 0, 0.7960784, 1,
1.072822, -0.2581776, 2.202053, 1, 0, 0.7921569, 1,
1.075342, 0.04894553, 0.845399, 1, 0, 0.7843137, 1,
1.077277, -0.1030356, 3.739225, 1, 0, 0.7803922, 1,
1.082014, 0.1281504, 2.443094, 1, 0, 0.772549, 1,
1.083136, -0.4238166, 1.070706, 1, 0, 0.7686275, 1,
1.083692, 0.7767082, 0.006443251, 1, 0, 0.7607843, 1,
1.088997, 1.471291, -0.06887608, 1, 0, 0.7568628, 1,
1.09092, 0.160849, 1.465288, 1, 0, 0.7490196, 1,
1.093036, -0.007251513, 1.897402, 1, 0, 0.7450981, 1,
1.098456, 0.8189572, -1.477271, 1, 0, 0.7372549, 1,
1.108114, -1.467123, 3.107941, 1, 0, 0.7333333, 1,
1.111979, 0.3379439, 1.639927, 1, 0, 0.7254902, 1,
1.13313, 0.5738071, 1.877159, 1, 0, 0.7215686, 1,
1.133808, -1.55431, 0.4724093, 1, 0, 0.7137255, 1,
1.135473, -0.5173746, 4.329387, 1, 0, 0.7098039, 1,
1.138974, -0.1004762, 2.341967, 1, 0, 0.7019608, 1,
1.150796, -0.09887243, 1.986771, 1, 0, 0.6941177, 1,
1.154516, -1.818005, 1.172254, 1, 0, 0.6901961, 1,
1.157804, -0.2988654, 2.813073, 1, 0, 0.682353, 1,
1.163735, -0.1339858, 1.607928, 1, 0, 0.6784314, 1,
1.168474, 0.5862002, 1.45568, 1, 0, 0.6705883, 1,
1.197577, 1.673457, 0.7220633, 1, 0, 0.6666667, 1,
1.198314, -0.3217977, 0.6407348, 1, 0, 0.6588235, 1,
1.202757, -0.9395116, 2.731168, 1, 0, 0.654902, 1,
1.203158, 1.746852, -1.938741, 1, 0, 0.6470588, 1,
1.205528, -1.229132, 3.16783, 1, 0, 0.6431373, 1,
1.209362, 0.5207662, 1.719063, 1, 0, 0.6352941, 1,
1.209566, -1.215521, 3.274755, 1, 0, 0.6313726, 1,
1.216089, 0.7437993, 2.110455, 1, 0, 0.6235294, 1,
1.218375, -0.2954582, 0.3147495, 1, 0, 0.6196079, 1,
1.224709, -1.337565, 2.118683, 1, 0, 0.6117647, 1,
1.241477, -0.4684277, 1.860607, 1, 0, 0.6078432, 1,
1.24843, 0.1793019, 1.817899, 1, 0, 0.6, 1,
1.253373, 0.686123, 0.2875237, 1, 0, 0.5921569, 1,
1.255751, -0.5795267, 4.209559, 1, 0, 0.5882353, 1,
1.256726, 0.306416, 0.8512409, 1, 0, 0.5803922, 1,
1.257117, -0.7489961, 0.9959404, 1, 0, 0.5764706, 1,
1.264279, 0.2751088, -0.1115482, 1, 0, 0.5686275, 1,
1.264918, 2.181927, 1.716717, 1, 0, 0.5647059, 1,
1.265749, 0.9649279, 0.1748233, 1, 0, 0.5568628, 1,
1.270209, -0.2383947, 1.528728, 1, 0, 0.5529412, 1,
1.271169, -0.1098853, 3.271393, 1, 0, 0.5450981, 1,
1.272364, 1.996794, 1.655623, 1, 0, 0.5411765, 1,
1.277303, -0.6831599, 1.69306, 1, 0, 0.5333334, 1,
1.287143, -1.673584, 1.964414, 1, 0, 0.5294118, 1,
1.288915, 1.806242, 0.5058337, 1, 0, 0.5215687, 1,
1.301939, -0.5915412, 2.911623, 1, 0, 0.5176471, 1,
1.303502, -1.517309, 3.528703, 1, 0, 0.509804, 1,
1.307109, -1.478541, 2.211518, 1, 0, 0.5058824, 1,
1.307303, 0.6442725, 2.634018, 1, 0, 0.4980392, 1,
1.308018, -0.2102223, 3.036557, 1, 0, 0.4901961, 1,
1.310547, 0.09466575, -0.2736934, 1, 0, 0.4862745, 1,
1.318444, -0.6512917, 2.928116, 1, 0, 0.4784314, 1,
1.331084, -0.7820256, 2.606553, 1, 0, 0.4745098, 1,
1.334383, 1.305536, -0.5635598, 1, 0, 0.4666667, 1,
1.336402, -1.333937, 1.954895, 1, 0, 0.4627451, 1,
1.341412, 0.4028721, -0.04719588, 1, 0, 0.454902, 1,
1.34209, -1.056263, 2.671718, 1, 0, 0.4509804, 1,
1.357725, 0.6730635, 1.292678, 1, 0, 0.4431373, 1,
1.368315, 1.477038, 1.407932, 1, 0, 0.4392157, 1,
1.373042, -0.6196155, 1.065575, 1, 0, 0.4313726, 1,
1.40327, -2.519775, 2.308529, 1, 0, 0.427451, 1,
1.407186, -0.8467243, 0.9260638, 1, 0, 0.4196078, 1,
1.431424, 0.1681017, 1.707625, 1, 0, 0.4156863, 1,
1.433311, 0.5562881, 1.79818, 1, 0, 0.4078431, 1,
1.44641, 0.4064619, 0.648383, 1, 0, 0.4039216, 1,
1.450117, -0.4647278, 3.376473, 1, 0, 0.3960784, 1,
1.463846, -1.191762, 1.281563, 1, 0, 0.3882353, 1,
1.465497, -1.71564, 2.694885, 1, 0, 0.3843137, 1,
1.47461, -3.019104, 3.26801, 1, 0, 0.3764706, 1,
1.475358, -0.2357536, 2.050076, 1, 0, 0.372549, 1,
1.488358, 0.1944544, 2.550228, 1, 0, 0.3647059, 1,
1.50331, 0.1633351, 2.441536, 1, 0, 0.3607843, 1,
1.514065, -0.07966337, 2.417007, 1, 0, 0.3529412, 1,
1.539085, -0.09613553, 2.387525, 1, 0, 0.3490196, 1,
1.545348, 2.108509, 2.730968, 1, 0, 0.3411765, 1,
1.552318, 0.8192914, 0.8455386, 1, 0, 0.3372549, 1,
1.560285, 2.594458, 0.1111636, 1, 0, 0.3294118, 1,
1.563705, -0.4992146, 1.070055, 1, 0, 0.3254902, 1,
1.568149, 0.1736763, 0.4785721, 1, 0, 0.3176471, 1,
1.569464, -2.054735, 3.176855, 1, 0, 0.3137255, 1,
1.579177, -0.5594487, 3.734363, 1, 0, 0.3058824, 1,
1.583646, -1.616865, 1.41493, 1, 0, 0.2980392, 1,
1.587509, 0.3088889, 0.7860543, 1, 0, 0.2941177, 1,
1.588665, 0.0802773, 0.6097988, 1, 0, 0.2862745, 1,
1.592301, -0.2421683, 1.876722, 1, 0, 0.282353, 1,
1.594269, 1.307002, 0.2529796, 1, 0, 0.2745098, 1,
1.597487, 0.1341173, 0.6356176, 1, 0, 0.2705882, 1,
1.617513, -0.6458008, 1.319141, 1, 0, 0.2627451, 1,
1.626397, 0.4747915, 3.614674, 1, 0, 0.2588235, 1,
1.641362, 0.8417878, 1.834795, 1, 0, 0.2509804, 1,
1.644736, 0.2828232, 1.872362, 1, 0, 0.2470588, 1,
1.647754, -0.7525987, 0.9705912, 1, 0, 0.2392157, 1,
1.679684, 0.5731249, -0.03040787, 1, 0, 0.2352941, 1,
1.685295, 0.08017237, 1.455817, 1, 0, 0.227451, 1,
1.70274, 0.1693631, 1.485568, 1, 0, 0.2235294, 1,
1.71323, 1.308726, 1.723534, 1, 0, 0.2156863, 1,
1.71924, 0.3720276, 1.166206, 1, 0, 0.2117647, 1,
1.724179, -0.5084149, 0.8939139, 1, 0, 0.2039216, 1,
1.748467, 1.427257, 3.346704, 1, 0, 0.1960784, 1,
1.754384, 0.3146082, 1.290362, 1, 0, 0.1921569, 1,
1.755789, -1.418122, 2.009607, 1, 0, 0.1843137, 1,
1.779228, -1.110889, 1.233398, 1, 0, 0.1803922, 1,
1.787594, 1.548448, 0.6517515, 1, 0, 0.172549, 1,
1.798403, 0.3445746, -0.6985404, 1, 0, 0.1686275, 1,
1.808607, -1.02203, 2.264906, 1, 0, 0.1607843, 1,
1.817465, -0.8967745, 3.298975, 1, 0, 0.1568628, 1,
1.85763, -0.6505197, 2.370631, 1, 0, 0.1490196, 1,
1.90221, -0.3581919, 0.9384686, 1, 0, 0.145098, 1,
1.918629, 0.05639604, 3.632933, 1, 0, 0.1372549, 1,
1.963852, 0.26818, 3.222069, 1, 0, 0.1333333, 1,
1.973855, 0.3074142, 2.665144, 1, 0, 0.1254902, 1,
1.982757, 0.6935577, 1.695266, 1, 0, 0.1215686, 1,
2.019819, 0.6611097, 0.8590696, 1, 0, 0.1137255, 1,
2.035017, 0.9778864, 0.4320383, 1, 0, 0.1098039, 1,
2.056282, 0.9714795, 2.513308, 1, 0, 0.1019608, 1,
2.068979, 0.2508091, 1.077083, 1, 0, 0.09411765, 1,
2.093622, -0.3230313, 0.4824438, 1, 0, 0.09019608, 1,
2.209394, 0.1176538, 1.825654, 1, 0, 0.08235294, 1,
2.226649, 0.7658981, -0.4724388, 1, 0, 0.07843138, 1,
2.228993, 0.05921814, 1.500626, 1, 0, 0.07058824, 1,
2.235988, 1.694288, 1.911957, 1, 0, 0.06666667, 1,
2.252278, -0.2029057, 0.7861632, 1, 0, 0.05882353, 1,
2.284889, -0.8931167, 1.322806, 1, 0, 0.05490196, 1,
2.297929, -0.5734199, 2.519557, 1, 0, 0.04705882, 1,
2.349386, 1.133999, -0.25944, 1, 0, 0.04313726, 1,
2.361502, 0.8710915, 1.725972, 1, 0, 0.03529412, 1,
2.406606, -0.636684, 2.464908, 1, 0, 0.03137255, 1,
2.458562, -0.6641781, 1.181577, 1, 0, 0.02352941, 1,
2.501331, 1.428709, 2.409833, 1, 0, 0.01960784, 1,
2.715865, 1.473504, -0.3000842, 1, 0, 0.01176471, 1,
2.728148, -0.4566128, 2.207046, 1, 0, 0.007843138, 1
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
-0.1722939, -4.274756, -6.624805, 0, -0.5, 0.5, 0.5,
-0.1722939, -4.274756, -6.624805, 1, -0.5, 0.5, 0.5,
-0.1722939, -4.274756, -6.624805, 1, 1.5, 0.5, 0.5,
-0.1722939, -4.274756, -6.624805, 0, 1.5, 0.5, 0.5
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
-4.055986, 0.1460733, -6.624805, 0, -0.5, 0.5, 0.5,
-4.055986, 0.1460733, -6.624805, 1, -0.5, 0.5, 0.5,
-4.055986, 0.1460733, -6.624805, 1, 1.5, 0.5, 0.5,
-4.055986, 0.1460733, -6.624805, 0, 1.5, 0.5, 0.5
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
-4.055986, -4.274756, -0.06176329, 0, -0.5, 0.5, 0.5,
-4.055986, -4.274756, -0.06176329, 1, -0.5, 0.5, 0.5,
-4.055986, -4.274756, -0.06176329, 1, 1.5, 0.5, 0.5,
-4.055986, -4.274756, -0.06176329, 0, 1.5, 0.5, 0.5
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
-3, -3.254565, -5.110258,
2, -3.254565, -5.110258,
-3, -3.254565, -5.110258,
-3, -3.424597, -5.362682,
-2, -3.254565, -5.110258,
-2, -3.424597, -5.362682,
-1, -3.254565, -5.110258,
-1, -3.424597, -5.362682,
0, -3.254565, -5.110258,
0, -3.424597, -5.362682,
1, -3.254565, -5.110258,
1, -3.424597, -5.362682,
2, -3.254565, -5.110258,
2, -3.424597, -5.362682
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
-3, -3.76466, -5.867532, 0, -0.5, 0.5, 0.5,
-3, -3.76466, -5.867532, 1, -0.5, 0.5, 0.5,
-3, -3.76466, -5.867532, 1, 1.5, 0.5, 0.5,
-3, -3.76466, -5.867532, 0, 1.5, 0.5, 0.5,
-2, -3.76466, -5.867532, 0, -0.5, 0.5, 0.5,
-2, -3.76466, -5.867532, 1, -0.5, 0.5, 0.5,
-2, -3.76466, -5.867532, 1, 1.5, 0.5, 0.5,
-2, -3.76466, -5.867532, 0, 1.5, 0.5, 0.5,
-1, -3.76466, -5.867532, 0, -0.5, 0.5, 0.5,
-1, -3.76466, -5.867532, 1, -0.5, 0.5, 0.5,
-1, -3.76466, -5.867532, 1, 1.5, 0.5, 0.5,
-1, -3.76466, -5.867532, 0, 1.5, 0.5, 0.5,
0, -3.76466, -5.867532, 0, -0.5, 0.5, 0.5,
0, -3.76466, -5.867532, 1, -0.5, 0.5, 0.5,
0, -3.76466, -5.867532, 1, 1.5, 0.5, 0.5,
0, -3.76466, -5.867532, 0, 1.5, 0.5, 0.5,
1, -3.76466, -5.867532, 0, -0.5, 0.5, 0.5,
1, -3.76466, -5.867532, 1, -0.5, 0.5, 0.5,
1, -3.76466, -5.867532, 1, 1.5, 0.5, 0.5,
1, -3.76466, -5.867532, 0, 1.5, 0.5, 0.5,
2, -3.76466, -5.867532, 0, -0.5, 0.5, 0.5,
2, -3.76466, -5.867532, 1, -0.5, 0.5, 0.5,
2, -3.76466, -5.867532, 1, 1.5, 0.5, 0.5,
2, -3.76466, -5.867532, 0, 1.5, 0.5, 0.5
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
-3.15975, -3, -5.110258,
-3.15975, 3, -5.110258,
-3.15975, -3, -5.110258,
-3.309122, -3, -5.362682,
-3.15975, -2, -5.110258,
-3.309122, -2, -5.362682,
-3.15975, -1, -5.110258,
-3.309122, -1, -5.362682,
-3.15975, 0, -5.110258,
-3.309122, 0, -5.362682,
-3.15975, 1, -5.110258,
-3.309122, 1, -5.362682,
-3.15975, 2, -5.110258,
-3.309122, 2, -5.362682,
-3.15975, 3, -5.110258,
-3.309122, 3, -5.362682
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
-3.607868, -3, -5.867532, 0, -0.5, 0.5, 0.5,
-3.607868, -3, -5.867532, 1, -0.5, 0.5, 0.5,
-3.607868, -3, -5.867532, 1, 1.5, 0.5, 0.5,
-3.607868, -3, -5.867532, 0, 1.5, 0.5, 0.5,
-3.607868, -2, -5.867532, 0, -0.5, 0.5, 0.5,
-3.607868, -2, -5.867532, 1, -0.5, 0.5, 0.5,
-3.607868, -2, -5.867532, 1, 1.5, 0.5, 0.5,
-3.607868, -2, -5.867532, 0, 1.5, 0.5, 0.5,
-3.607868, -1, -5.867532, 0, -0.5, 0.5, 0.5,
-3.607868, -1, -5.867532, 1, -0.5, 0.5, 0.5,
-3.607868, -1, -5.867532, 1, 1.5, 0.5, 0.5,
-3.607868, -1, -5.867532, 0, 1.5, 0.5, 0.5,
-3.607868, 0, -5.867532, 0, -0.5, 0.5, 0.5,
-3.607868, 0, -5.867532, 1, -0.5, 0.5, 0.5,
-3.607868, 0, -5.867532, 1, 1.5, 0.5, 0.5,
-3.607868, 0, -5.867532, 0, 1.5, 0.5, 0.5,
-3.607868, 1, -5.867532, 0, -0.5, 0.5, 0.5,
-3.607868, 1, -5.867532, 1, -0.5, 0.5, 0.5,
-3.607868, 1, -5.867532, 1, 1.5, 0.5, 0.5,
-3.607868, 1, -5.867532, 0, 1.5, 0.5, 0.5,
-3.607868, 2, -5.867532, 0, -0.5, 0.5, 0.5,
-3.607868, 2, -5.867532, 1, -0.5, 0.5, 0.5,
-3.607868, 2, -5.867532, 1, 1.5, 0.5, 0.5,
-3.607868, 2, -5.867532, 0, 1.5, 0.5, 0.5,
-3.607868, 3, -5.867532, 0, -0.5, 0.5, 0.5,
-3.607868, 3, -5.867532, 1, -0.5, 0.5, 0.5,
-3.607868, 3, -5.867532, 1, 1.5, 0.5, 0.5,
-3.607868, 3, -5.867532, 0, 1.5, 0.5, 0.5
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
-3.15975, -3.254565, -4,
-3.15975, -3.254565, 4,
-3.15975, -3.254565, -4,
-3.309122, -3.424597, -4,
-3.15975, -3.254565, -2,
-3.309122, -3.424597, -2,
-3.15975, -3.254565, 0,
-3.309122, -3.424597, 0,
-3.15975, -3.254565, 2,
-3.309122, -3.424597, 2,
-3.15975, -3.254565, 4,
-3.309122, -3.424597, 4
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
-3.607868, -3.76466, -4, 0, -0.5, 0.5, 0.5,
-3.607868, -3.76466, -4, 1, -0.5, 0.5, 0.5,
-3.607868, -3.76466, -4, 1, 1.5, 0.5, 0.5,
-3.607868, -3.76466, -4, 0, 1.5, 0.5, 0.5,
-3.607868, -3.76466, -2, 0, -0.5, 0.5, 0.5,
-3.607868, -3.76466, -2, 1, -0.5, 0.5, 0.5,
-3.607868, -3.76466, -2, 1, 1.5, 0.5, 0.5,
-3.607868, -3.76466, -2, 0, 1.5, 0.5, 0.5,
-3.607868, -3.76466, 0, 0, -0.5, 0.5, 0.5,
-3.607868, -3.76466, 0, 1, -0.5, 0.5, 0.5,
-3.607868, -3.76466, 0, 1, 1.5, 0.5, 0.5,
-3.607868, -3.76466, 0, 0, 1.5, 0.5, 0.5,
-3.607868, -3.76466, 2, 0, -0.5, 0.5, 0.5,
-3.607868, -3.76466, 2, 1, -0.5, 0.5, 0.5,
-3.607868, -3.76466, 2, 1, 1.5, 0.5, 0.5,
-3.607868, -3.76466, 2, 0, 1.5, 0.5, 0.5,
-3.607868, -3.76466, 4, 0, -0.5, 0.5, 0.5,
-3.607868, -3.76466, 4, 1, -0.5, 0.5, 0.5,
-3.607868, -3.76466, 4, 1, 1.5, 0.5, 0.5,
-3.607868, -3.76466, 4, 0, 1.5, 0.5, 0.5
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
-3.15975, -3.254565, -5.110258,
-3.15975, 3.546711, -5.110258,
-3.15975, -3.254565, 4.986731,
-3.15975, 3.546711, 4.986731,
-3.15975, -3.254565, -5.110258,
-3.15975, -3.254565, 4.986731,
-3.15975, 3.546711, -5.110258,
-3.15975, 3.546711, 4.986731,
-3.15975, -3.254565, -5.110258,
2.815162, -3.254565, -5.110258,
-3.15975, -3.254565, 4.986731,
2.815162, -3.254565, 4.986731,
-3.15975, 3.546711, -5.110258,
2.815162, 3.546711, -5.110258,
-3.15975, 3.546711, 4.986731,
2.815162, 3.546711, 4.986731,
2.815162, -3.254565, -5.110258,
2.815162, 3.546711, -5.110258,
2.815162, -3.254565, 4.986731,
2.815162, 3.546711, 4.986731,
2.815162, -3.254565, -5.110258,
2.815162, -3.254565, 4.986731,
2.815162, 3.546711, -5.110258,
2.815162, 3.546711, 4.986731
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
var radius = 7.241416;
var distance = 32.21788;
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
mvMatrix.translate( 0.1722939, -0.1460733, 0.06176329 );
mvMatrix.scale( 1.310406, 1.15119, 0.7754353 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.21788);
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
phosdiphen<-read.table("phosdiphen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosdiphen$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosdiphen' not found
```

```r
y<-phosdiphen$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosdiphen' not found
```

```r
z<-phosdiphen$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosdiphen' not found
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
-3.072736, -0.4808563, -1.036202, 0, 0, 1, 1, 1,
-2.929503, -0.6051309, -2.006952, 1, 0, 0, 1, 1,
-2.624659, 0.2714037, -2.137089, 1, 0, 0, 1, 1,
-2.432764, -1.126994, -3.300017, 1, 0, 0, 1, 1,
-2.430573, 1.431587, -2.672573, 1, 0, 0, 1, 1,
-2.428487, -1.660031, -2.032106, 1, 0, 0, 1, 1,
-2.387382, 0.4141341, -2.598359, 0, 0, 0, 1, 1,
-2.370843, -1.010698, -1.083792, 0, 0, 0, 1, 1,
-2.357072, -1.604328, -1.388158, 0, 0, 0, 1, 1,
-2.348642, -0.290129, -0.5170823, 0, 0, 0, 1, 1,
-2.337894, 0.5571451, -2.247105, 0, 0, 0, 1, 1,
-2.277587, 0.5335935, -2.626099, 0, 0, 0, 1, 1,
-2.269723, -0.9818379, -1.174063, 0, 0, 0, 1, 1,
-2.249416, 0.6113117, 1.160387, 1, 1, 1, 1, 1,
-2.213482, 0.676978, -1.103794, 1, 1, 1, 1, 1,
-2.199177, -1.618185, -1.630491, 1, 1, 1, 1, 1,
-2.186253, 0.2157248, -0.02489332, 1, 1, 1, 1, 1,
-2.167094, -0.3531945, -0.7834358, 1, 1, 1, 1, 1,
-2.165037, 0.3369411, -0.8815604, 1, 1, 1, 1, 1,
-2.15745, 0.4847423, 0.3771985, 1, 1, 1, 1, 1,
-2.103856, -0.4164901, -1.804057, 1, 1, 1, 1, 1,
-2.088419, 0.6317809, -2.484318, 1, 1, 1, 1, 1,
-2.066741, 0.4546333, 0.1202776, 1, 1, 1, 1, 1,
-2.060307, 0.03721756, -1.679121, 1, 1, 1, 1, 1,
-2.058041, 0.6576707, -1.340246, 1, 1, 1, 1, 1,
-2.001578, -0.7385681, -1.519574, 1, 1, 1, 1, 1,
-1.996637, 0.02176693, -1.976513, 1, 1, 1, 1, 1,
-1.956463, 0.9383714, -1.056079, 1, 1, 1, 1, 1,
-1.947455, -0.1707189, -0.5202726, 0, 0, 1, 1, 1,
-1.939819, -0.8962755, -1.729545, 1, 0, 0, 1, 1,
-1.928171, 0.01378513, -2.081929, 1, 0, 0, 1, 1,
-1.907142, 0.3972446, -0.2951692, 1, 0, 0, 1, 1,
-1.903132, 1.184378, -2.116013, 1, 0, 0, 1, 1,
-1.88929, 0.4619009, -1.235638, 1, 0, 0, 1, 1,
-1.881699, -0.4214635, 0.4053043, 0, 0, 0, 1, 1,
-1.844662, 1.122574, -0.1695935, 0, 0, 0, 1, 1,
-1.825773, 0.1922051, -1.788461, 0, 0, 0, 1, 1,
-1.804135, -0.615705, 1.217017, 0, 0, 0, 1, 1,
-1.784059, 0.1785277, -2.390569, 0, 0, 0, 1, 1,
-1.773063, 0.5343828, -1.742976, 0, 0, 0, 1, 1,
-1.770275, 3.447664, -1.569599, 0, 0, 0, 1, 1,
-1.744041, 0.5732019, -0.1460195, 1, 1, 1, 1, 1,
-1.743881, -0.7013245, -0.9784144, 1, 1, 1, 1, 1,
-1.728829, -1.712176, 0.1286075, 1, 1, 1, 1, 1,
-1.723543, -1.308034, -3.833864, 1, 1, 1, 1, 1,
-1.719621, 0.6097808, 0.5145869, 1, 1, 1, 1, 1,
-1.712715, -0.1762781, -0.3107895, 1, 1, 1, 1, 1,
-1.706776, 0.5228763, -0.3382146, 1, 1, 1, 1, 1,
-1.700497, 0.8782555, -0.6341386, 1, 1, 1, 1, 1,
-1.676468, -0.6322488, -0.4300015, 1, 1, 1, 1, 1,
-1.675338, 1.675739, -3.030905, 1, 1, 1, 1, 1,
-1.665437, 0.2556788, -1.091074, 1, 1, 1, 1, 1,
-1.6645, -0.3395113, -1.237752, 1, 1, 1, 1, 1,
-1.650556, -0.8902856, -4.14822, 1, 1, 1, 1, 1,
-1.647975, -0.5705003, -3.04722, 1, 1, 1, 1, 1,
-1.641963, -1.388028, -3.881289, 1, 1, 1, 1, 1,
-1.634183, -0.07614703, -0.5283802, 0, 0, 1, 1, 1,
-1.630232, -0.1638217, -2.235629, 1, 0, 0, 1, 1,
-1.591007, 1.405462, -1.086787, 1, 0, 0, 1, 1,
-1.586465, 1.209882, -0.283048, 1, 0, 0, 1, 1,
-1.58469, -0.1475008, -1.58546, 1, 0, 0, 1, 1,
-1.553907, -0.4155326, -2.579527, 1, 0, 0, 1, 1,
-1.552132, -1.034519, -3.479682, 0, 0, 0, 1, 1,
-1.547428, -0.1474539, -1.070836, 0, 0, 0, 1, 1,
-1.53996, -0.0001241989, -1.923714, 0, 0, 0, 1, 1,
-1.522382, 0.2634584, -2.387059, 0, 0, 0, 1, 1,
-1.502561, -0.06650501, -1.327357, 0, 0, 0, 1, 1,
-1.498147, 2.457434, -3.112327, 0, 0, 0, 1, 1,
-1.486928, 0.3768934, -1.672026, 0, 0, 0, 1, 1,
-1.485012, 0.5955035, -1.181525, 1, 1, 1, 1, 1,
-1.461665, 0.0399259, -3.807686, 1, 1, 1, 1, 1,
-1.437442, -0.9096065, -2.281708, 1, 1, 1, 1, 1,
-1.416863, 0.1716595, -3.032006, 1, 1, 1, 1, 1,
-1.41584, -0.8786339, -2.262719, 1, 1, 1, 1, 1,
-1.411814, -0.8919835, -1.43937, 1, 1, 1, 1, 1,
-1.394959, 0.2315603, -0.3714992, 1, 1, 1, 1, 1,
-1.393259, -0.5155191, 0.2540793, 1, 1, 1, 1, 1,
-1.388289, 0.7192346, -0.7587554, 1, 1, 1, 1, 1,
-1.374844, -0.6294295, -0.3607054, 1, 1, 1, 1, 1,
-1.348664, 0.9884464, 0.3744623, 1, 1, 1, 1, 1,
-1.348441, 0.5815879, -4.522793, 1, 1, 1, 1, 1,
-1.343332, -0.3290639, -1.198733, 1, 1, 1, 1, 1,
-1.335322, -0.7502482, -3.23425, 1, 1, 1, 1, 1,
-1.31961, -1.173832, -0.8426567, 1, 1, 1, 1, 1,
-1.316056, -0.1488381, -0.9176535, 0, 0, 1, 1, 1,
-1.303864, 1.615946, 0.6409096, 1, 0, 0, 1, 1,
-1.301794, 0.08796448, -2.506416, 1, 0, 0, 1, 1,
-1.299797, 0.1650112, -2.350706, 1, 0, 0, 1, 1,
-1.298382, 1.019146, -1.658385, 1, 0, 0, 1, 1,
-1.297823, 1.588008, 0.5001006, 1, 0, 0, 1, 1,
-1.297455, -2.148572, -3.729904, 0, 0, 0, 1, 1,
-1.291881, -0.6404515, -1.801228, 0, 0, 0, 1, 1,
-1.290798, -1.329665, -1.643309, 0, 0, 0, 1, 1,
-1.284347, -0.5009413, -1.953503, 0, 0, 0, 1, 1,
-1.280514, -0.4749638, -1.388999, 0, 0, 0, 1, 1,
-1.278449, 2.447628, -0.2725421, 0, 0, 0, 1, 1,
-1.273904, 1.417547, 1.008156, 0, 0, 0, 1, 1,
-1.268883, -1.609365, -1.006878, 1, 1, 1, 1, 1,
-1.268597, -0.3272087, -2.644599, 1, 1, 1, 1, 1,
-1.266148, -0.333058, -0.949307, 1, 1, 1, 1, 1,
-1.258818, 0.1371579, -0.2978038, 1, 1, 1, 1, 1,
-1.249868, 0.3620608, 0.3040635, 1, 1, 1, 1, 1,
-1.249549, 0.002125929, -2.109199, 1, 1, 1, 1, 1,
-1.249066, 0.5034852, -0.05898711, 1, 1, 1, 1, 1,
-1.247232, -0.3468801, -0.5578432, 1, 1, 1, 1, 1,
-1.242877, -0.8269049, -1.496264, 1, 1, 1, 1, 1,
-1.240361, 0.9514536, -0.2409404, 1, 1, 1, 1, 1,
-1.234809, 0.1389248, -1.29089, 1, 1, 1, 1, 1,
-1.220403, 0.9916785, -0.1215243, 1, 1, 1, 1, 1,
-1.219779, -1.397231, -2.654272, 1, 1, 1, 1, 1,
-1.218239, 1.004915, -2.242504, 1, 1, 1, 1, 1,
-1.21261, -1.364536, -3.380357, 1, 1, 1, 1, 1,
-1.206493, 0.295887, -1.374399, 0, 0, 1, 1, 1,
-1.200762, 0.788443, 0.2042836, 1, 0, 0, 1, 1,
-1.194649, -0.5767029, -2.175827, 1, 0, 0, 1, 1,
-1.19398, 1.535242, -1.226641, 1, 0, 0, 1, 1,
-1.19384, 1.077017, -1.080843, 1, 0, 0, 1, 1,
-1.187367, 1.642301, -2.279816, 1, 0, 0, 1, 1,
-1.183295, 1.126281, -0.2975802, 0, 0, 0, 1, 1,
-1.172969, -0.3363079, -1.982124, 0, 0, 0, 1, 1,
-1.172598, -1.672617, -3.173365, 0, 0, 0, 1, 1,
-1.169673, -0.1739711, -3.572508, 0, 0, 0, 1, 1,
-1.162297, -0.2710891, -3.234946, 0, 0, 0, 1, 1,
-1.1529, 0.855473, 0.06884193, 0, 0, 0, 1, 1,
-1.146746, -0.5784261, -0.4258608, 0, 0, 0, 1, 1,
-1.143767, -1.061982, -3.120975, 1, 1, 1, 1, 1,
-1.142354, 0.4380489, -0.07771699, 1, 1, 1, 1, 1,
-1.141737, -1.411036, -1.977033, 1, 1, 1, 1, 1,
-1.137313, 0.7454669, -0.4490044, 1, 1, 1, 1, 1,
-1.137189, 0.6904869, -3.017784, 1, 1, 1, 1, 1,
-1.135303, 1.829746, -0.2900333, 1, 1, 1, 1, 1,
-1.131772, -0.3523364, -1.861229, 1, 1, 1, 1, 1,
-1.128206, -1.136318, -1.252777, 1, 1, 1, 1, 1,
-1.127439, 0.02709564, -2.349674, 1, 1, 1, 1, 1,
-1.125747, 1.813801, -0.4519442, 1, 1, 1, 1, 1,
-1.120385, 0.2462337, -2.201748, 1, 1, 1, 1, 1,
-1.11461, -1.020232, -2.094989, 1, 1, 1, 1, 1,
-1.114573, -0.8449316, -1.700795, 1, 1, 1, 1, 1,
-1.111372, -0.04581178, -0.5091331, 1, 1, 1, 1, 1,
-1.102049, -0.2277282, -0.8009299, 1, 1, 1, 1, 1,
-1.07759, -0.9537708, -2.196668, 0, 0, 1, 1, 1,
-1.077109, -0.1734808, -0.4424982, 1, 0, 0, 1, 1,
-1.075443, -0.5835513, -1.750048, 1, 0, 0, 1, 1,
-1.065906, -0.3545885, -0.6122588, 1, 0, 0, 1, 1,
-1.058938, 0.6043834, -0.7901484, 1, 0, 0, 1, 1,
-1.048707, 0.7816892, 0.4644055, 1, 0, 0, 1, 1,
-1.044846, 0.1908036, -1.660623, 0, 0, 0, 1, 1,
-1.037364, -1.124483, -2.559406, 0, 0, 0, 1, 1,
-1.036342, -1.188503, -2.026083, 0, 0, 0, 1, 1,
-1.035904, 0.7040268, -0.9694332, 0, 0, 0, 1, 1,
-1.028055, -0.863788, -1.807402, 0, 0, 0, 1, 1,
-1.02332, 0.8252332, -1.413412, 0, 0, 0, 1, 1,
-1.020877, 0.3447548, -0.7784498, 0, 0, 0, 1, 1,
-1.017062, -0.1407649, -0.8933035, 1, 1, 1, 1, 1,
-1.015479, -1.91901, -2.003748, 1, 1, 1, 1, 1,
-1.015011, 1.065609, -0.8956033, 1, 1, 1, 1, 1,
-1.014549, -0.01844698, -2.688892, 1, 1, 1, 1, 1,
-1.014339, 0.212295, -3.269222, 1, 1, 1, 1, 1,
-1.009928, 2.343908, -0.3448993, 1, 1, 1, 1, 1,
-0.9995018, -0.1837289, -2.35267, 1, 1, 1, 1, 1,
-0.9957849, -0.08466254, -1.443852, 1, 1, 1, 1, 1,
-0.9949594, -0.3617415, -1.258393, 1, 1, 1, 1, 1,
-0.9864289, 0.4457142, -1.910675, 1, 1, 1, 1, 1,
-0.9788261, -0.6437554, -2.047551, 1, 1, 1, 1, 1,
-0.9734807, 0.7066672, 0.6646575, 1, 1, 1, 1, 1,
-0.9719344, 1.849612, -1.368778, 1, 1, 1, 1, 1,
-0.971294, 0.6352377, -0.2799572, 1, 1, 1, 1, 1,
-0.9663247, 0.2645042, -3.167817, 1, 1, 1, 1, 1,
-0.9636343, -0.6822841, -0.7935324, 0, 0, 1, 1, 1,
-0.9597799, 0.3009979, -1.825121, 1, 0, 0, 1, 1,
-0.9535078, -0.3739988, -0.2023711, 1, 0, 0, 1, 1,
-0.9504545, 2.282058, 0.5409266, 1, 0, 0, 1, 1,
-0.9462104, 1.816895, -0.3822168, 1, 0, 0, 1, 1,
-0.9460709, 0.7354997, -1.32321, 1, 0, 0, 1, 1,
-0.9440706, 0.3805728, -0.5359666, 0, 0, 0, 1, 1,
-0.9434292, -0.1590037, -1.830783, 0, 0, 0, 1, 1,
-0.9404591, 0.8525544, -1.224557, 0, 0, 0, 1, 1,
-0.9145548, 0.5529746, 0.5388724, 0, 0, 0, 1, 1,
-0.9142041, 0.1310551, -0.4533635, 0, 0, 0, 1, 1,
-0.913447, 0.75173, -2.288499, 0, 0, 0, 1, 1,
-0.9113085, 0.1957051, -2.170691, 0, 0, 0, 1, 1,
-0.9098362, -0.7470064, -0.9134136, 1, 1, 1, 1, 1,
-0.9043857, 0.08088913, -3.748746, 1, 1, 1, 1, 1,
-0.902637, 2.539905, -2.41089, 1, 1, 1, 1, 1,
-0.9007286, -1.049042, -1.574562, 1, 1, 1, 1, 1,
-0.8986831, -0.6119388, -2.688787, 1, 1, 1, 1, 1,
-0.8977299, -1.118638, -1.38339, 1, 1, 1, 1, 1,
-0.8960062, -0.4074341, -1.498, 1, 1, 1, 1, 1,
-0.8950458, 0.4577881, 1.460913, 1, 1, 1, 1, 1,
-0.8949255, 0.2870954, -2.729506, 1, 1, 1, 1, 1,
-0.8897113, 1.263769, 0.3672386, 1, 1, 1, 1, 1,
-0.8884773, -1.717565, -2.263807, 1, 1, 1, 1, 1,
-0.8876799, 1.720745, -0.1590236, 1, 1, 1, 1, 1,
-0.8875887, -1.331967, -4.148628, 1, 1, 1, 1, 1,
-0.8841112, -0.7869725, -1.79368, 1, 1, 1, 1, 1,
-0.8839312, -0.1137402, -1.830949, 1, 1, 1, 1, 1,
-0.8817492, -0.1777915, -0.9957768, 0, 0, 1, 1, 1,
-0.8754799, 0.7260661, -3.290712, 1, 0, 0, 1, 1,
-0.8748482, -0.7030716, -1.782893, 1, 0, 0, 1, 1,
-0.8744718, -0.3598163, -0.9121734, 1, 0, 0, 1, 1,
-0.8730977, 0.8749913, -0.6492413, 1, 0, 0, 1, 1,
-0.8702173, 0.4864822, -1.092625, 1, 0, 0, 1, 1,
-0.8683854, 0.9560948, -0.9135962, 0, 0, 0, 1, 1,
-0.8645919, -1.631336, -2.26238, 0, 0, 0, 1, 1,
-0.8638355, 0.08964656, -2.800797, 0, 0, 0, 1, 1,
-0.8636979, -1.028023, -4.801638, 0, 0, 0, 1, 1,
-0.8626158, -0.3595442, -0.2054929, 0, 0, 0, 1, 1,
-0.8563617, -0.4488562, -3.804201, 0, 0, 0, 1, 1,
-0.8523443, 0.8252603, -0.6491707, 0, 0, 0, 1, 1,
-0.8431702, 2.714993, -0.4549207, 1, 1, 1, 1, 1,
-0.8396717, -1.177705, -2.452447, 1, 1, 1, 1, 1,
-0.8387863, 0.4819195, -1.34444, 1, 1, 1, 1, 1,
-0.8340238, 2.236443, 0.4322118, 1, 1, 1, 1, 1,
-0.8332658, 1.286598, -1.790447, 1, 1, 1, 1, 1,
-0.8321152, -0.3299885, -1.952516, 1, 1, 1, 1, 1,
-0.8288342, 0.199375, -0.9457782, 1, 1, 1, 1, 1,
-0.821759, -0.1726072, -1.116582, 1, 1, 1, 1, 1,
-0.8192188, 0.05612731, -3.427205, 1, 1, 1, 1, 1,
-0.8190717, 0.9088622, -2.205748, 1, 1, 1, 1, 1,
-0.8152935, -1.334914, -2.501598, 1, 1, 1, 1, 1,
-0.8131737, -1.450126, -4.931837, 1, 1, 1, 1, 1,
-0.8110976, -2.520857, -3.350223, 1, 1, 1, 1, 1,
-0.8079686, 0.7152082, -0.7246239, 1, 1, 1, 1, 1,
-0.8077206, -2.318255, -4.919333, 1, 1, 1, 1, 1,
-0.8039953, 0.8987169, -1.832977, 0, 0, 1, 1, 1,
-0.8039461, -0.06738675, -1.25519, 1, 0, 0, 1, 1,
-0.8020283, -1.06359, -1.873363, 1, 0, 0, 1, 1,
-0.7994331, 0.8027241, -1.267137, 1, 0, 0, 1, 1,
-0.7955672, 0.04005186, -1.551403, 1, 0, 0, 1, 1,
-0.7939126, 0.7900075, -0.712148, 1, 0, 0, 1, 1,
-0.7924649, 1.641583, 0.3779625, 0, 0, 0, 1, 1,
-0.7913382, -1.299379, -2.378954, 0, 0, 0, 1, 1,
-0.7909272, -1.440792, -2.373711, 0, 0, 0, 1, 1,
-0.7906895, 0.1286436, -1.57834, 0, 0, 0, 1, 1,
-0.7875004, -0.3168986, -1.246596, 0, 0, 0, 1, 1,
-0.7864223, -0.800414, -2.445723, 0, 0, 0, 1, 1,
-0.7854013, 1.277712, -1.727093, 0, 0, 0, 1, 1,
-0.7844262, 1.532702, -1.017029, 1, 1, 1, 1, 1,
-0.7791903, -0.7994357, -1.758936, 1, 1, 1, 1, 1,
-0.7698172, 0.1655057, -2.892463, 1, 1, 1, 1, 1,
-0.7646159, -0.09642219, -2.928513, 1, 1, 1, 1, 1,
-0.7641146, -1.005396, -1.575026, 1, 1, 1, 1, 1,
-0.7583897, 0.5041873, -1.908128, 1, 1, 1, 1, 1,
-0.7539175, 1.235964, -0.9420695, 1, 1, 1, 1, 1,
-0.7486212, 0.04566877, -1.842108, 1, 1, 1, 1, 1,
-0.745742, -0.1263838, -2.4021, 1, 1, 1, 1, 1,
-0.7407118, -0.2857882, -0.2287226, 1, 1, 1, 1, 1,
-0.7400503, -1.129964, -4.479211, 1, 1, 1, 1, 1,
-0.7308096, -0.4696248, -3.062421, 1, 1, 1, 1, 1,
-0.718424, -1.625235, -4.008533, 1, 1, 1, 1, 1,
-0.7181215, 0.9955705, -1.617287, 1, 1, 1, 1, 1,
-0.7099462, 0.8579863, 1.218929, 1, 1, 1, 1, 1,
-0.7098334, -0.3046385, -3.282931, 0, 0, 1, 1, 1,
-0.7087156, -0.2026062, -3.533868, 1, 0, 0, 1, 1,
-0.7065668, 1.206327, -1.059333, 1, 0, 0, 1, 1,
-0.705132, -0.3174568, -2.259425, 1, 0, 0, 1, 1,
-0.7012506, 0.137654, -2.080605, 1, 0, 0, 1, 1,
-0.7010638, -1.645797, -2.387397, 1, 0, 0, 1, 1,
-0.697631, 0.1213295, -1.462917, 0, 0, 0, 1, 1,
-0.6970477, -0.0898168, -0.68541, 0, 0, 0, 1, 1,
-0.6934726, -0.6350173, -1.565809, 0, 0, 0, 1, 1,
-0.6929224, 1.224076, 0.537425, 0, 0, 0, 1, 1,
-0.6926129, -1.520187, -1.930125, 0, 0, 0, 1, 1,
-0.6909924, 1.311663, -2.040767, 0, 0, 0, 1, 1,
-0.6808146, -0.1288911, -1.687646, 0, 0, 0, 1, 1,
-0.676266, -1.678852, -2.45671, 1, 1, 1, 1, 1,
-0.6749552, -1.111537, -1.90228, 1, 1, 1, 1, 1,
-0.6626601, -0.7628946, -3.289494, 1, 1, 1, 1, 1,
-0.6544122, -0.6322021, -3.837417, 1, 1, 1, 1, 1,
-0.6519138, 1.661569, -0.7601798, 1, 1, 1, 1, 1,
-0.6503278, 0.6261509, 1.179453, 1, 1, 1, 1, 1,
-0.6496227, 1.25379, -0.619962, 1, 1, 1, 1, 1,
-0.6478459, -0.8848292, -3.559618, 1, 1, 1, 1, 1,
-0.6458794, 0.005304108, -0.9680858, 1, 1, 1, 1, 1,
-0.6427959, -1.793808, -2.632571, 1, 1, 1, 1, 1,
-0.6394916, -0.8137929, -1.850837, 1, 1, 1, 1, 1,
-0.6384255, -1.287363, -1.732538, 1, 1, 1, 1, 1,
-0.6277663, 0.1297686, -0.5831424, 1, 1, 1, 1, 1,
-0.6260552, -1.051266, -2.629999, 1, 1, 1, 1, 1,
-0.6249033, -0.5069767, -1.785537, 1, 1, 1, 1, 1,
-0.6177266, -0.5925682, -3.471772, 0, 0, 1, 1, 1,
-0.614336, 0.2863302, -2.281643, 1, 0, 0, 1, 1,
-0.6106424, 0.0612209, -1.020673, 1, 0, 0, 1, 1,
-0.6042417, 0.5001637, -1.732998, 1, 0, 0, 1, 1,
-0.6016298, 0.07509352, -2.358069, 1, 0, 0, 1, 1,
-0.5925218, 0.6903563, -0.1153878, 1, 0, 0, 1, 1,
-0.5898021, -0.4390383, -1.698585, 0, 0, 0, 1, 1,
-0.5872957, 1.749856, -0.6214694, 0, 0, 0, 1, 1,
-0.5867643, -0.9455785, -1.329331, 0, 0, 0, 1, 1,
-0.5856833, -0.05928697, -1.710396, 0, 0, 0, 1, 1,
-0.5821896, 0.8788436, -0.006069788, 0, 0, 0, 1, 1,
-0.580507, 0.4157454, -1.787954, 0, 0, 0, 1, 1,
-0.5797144, -0.7412652, -2.557843, 0, 0, 0, 1, 1,
-0.5747545, 1.956515, -0.09532174, 1, 1, 1, 1, 1,
-0.5738997, 0.9408903, -1.162327, 1, 1, 1, 1, 1,
-0.5733309, -0.269534, -2.360896, 1, 1, 1, 1, 1,
-0.5727054, -0.2108413, -1.438809, 1, 1, 1, 1, 1,
-0.5713441, -0.1743277, -1.496108, 1, 1, 1, 1, 1,
-0.5697393, -0.2671995, -2.07027, 1, 1, 1, 1, 1,
-0.5592084, 1.336322, -0.4098387, 1, 1, 1, 1, 1,
-0.5565389, 0.7517215, -0.5862575, 1, 1, 1, 1, 1,
-0.5529528, -0.2830001, -3.163297, 1, 1, 1, 1, 1,
-0.5511895, -0.5298542, -2.875457, 1, 1, 1, 1, 1,
-0.5507773, 0.3359363, -3.273966, 1, 1, 1, 1, 1,
-0.5501466, -0.5518863, -2.431674, 1, 1, 1, 1, 1,
-0.5479553, -2.178361, -2.230966, 1, 1, 1, 1, 1,
-0.5474082, 0.04068717, -3.129679, 1, 1, 1, 1, 1,
-0.5395529, -1.008097, -2.761815, 1, 1, 1, 1, 1,
-0.5378426, -0.4727282, -2.499278, 0, 0, 1, 1, 1,
-0.5285134, 1.213474, -0.02102952, 1, 0, 0, 1, 1,
-0.5170872, 0.4429726, -1.528565, 1, 0, 0, 1, 1,
-0.5143621, 0.02578077, 0.7276353, 1, 0, 0, 1, 1,
-0.511135, 0.6535255, -2.456549, 1, 0, 0, 1, 1,
-0.5081458, -1.582387, -3.777308, 1, 0, 0, 1, 1,
-0.5059902, 0.09111057, 0.4278868, 0, 0, 0, 1, 1,
-0.495673, -0.6997353, -2.299036, 0, 0, 0, 1, 1,
-0.4956722, -0.260836, -1.363136, 0, 0, 0, 1, 1,
-0.4944031, 0.9091281, 0.7602476, 0, 0, 0, 1, 1,
-0.4893146, -2.474392, -4.356789, 0, 0, 0, 1, 1,
-0.4848081, -0.710068, -3.041892, 0, 0, 0, 1, 1,
-0.4845209, -0.2665369, -2.568051, 0, 0, 0, 1, 1,
-0.4830487, -0.6751436, -1.648288, 1, 1, 1, 1, 1,
-0.4770122, 1.536398, 1.125498, 1, 1, 1, 1, 1,
-0.4710009, -0.465515, -2.277126, 1, 1, 1, 1, 1,
-0.4689906, -0.2931359, -1.373284, 1, 1, 1, 1, 1,
-0.4649382, -1.546658, -3.557814, 1, 1, 1, 1, 1,
-0.4621544, -1.773208, -1.755501, 1, 1, 1, 1, 1,
-0.4603727, 0.483239, -1.560544, 1, 1, 1, 1, 1,
-0.4584378, 0.3297247, -1.254122, 1, 1, 1, 1, 1,
-0.4562573, -1.167203, -2.840196, 1, 1, 1, 1, 1,
-0.4516222, -1.027513, -2.197503, 1, 1, 1, 1, 1,
-0.4466981, 0.2718849, 0.08550959, 1, 1, 1, 1, 1,
-0.4442653, 0.228331, 0.384062, 1, 1, 1, 1, 1,
-0.4435593, -0.09022099, -0.645847, 1, 1, 1, 1, 1,
-0.4433608, -0.5746745, -2.390095, 1, 1, 1, 1, 1,
-0.4392002, 0.3103089, -0.5876827, 1, 1, 1, 1, 1,
-0.4321603, 1.761128, -1.477771, 0, 0, 1, 1, 1,
-0.4319987, 2.097731, -1.120801, 1, 0, 0, 1, 1,
-0.4274059, 0.4460665, -1.284406, 1, 0, 0, 1, 1,
-0.4253274, -2.133793, -1.681781, 1, 0, 0, 1, 1,
-0.421879, -1.051545, -2.06912, 1, 0, 0, 1, 1,
-0.4206624, -0.676743, -4.514988, 1, 0, 0, 1, 1,
-0.4202274, -1.046, -2.796968, 0, 0, 0, 1, 1,
-0.418986, 2.003829, -1.561527, 0, 0, 0, 1, 1,
-0.4179526, 0.5965584, -0.7011876, 0, 0, 0, 1, 1,
-0.415651, 1.771203, -1.291608, 0, 0, 0, 1, 1,
-0.4152213, -0.905479, -1.785237, 0, 0, 0, 1, 1,
-0.4143376, -3.013397, -3.396999, 0, 0, 0, 1, 1,
-0.4122992, -1.830285, -2.613288, 0, 0, 0, 1, 1,
-0.4117274, -0.5933386, -4.268109, 1, 1, 1, 1, 1,
-0.4116445, -1.973235, -3.123335, 1, 1, 1, 1, 1,
-0.4076433, 0.5104324, -0.4256285, 1, 1, 1, 1, 1,
-0.4028683, -1.252629, -1.400405, 1, 1, 1, 1, 1,
-0.3972565, 1.212284, -1.012596, 1, 1, 1, 1, 1,
-0.3945592, 1.408555, -0.07172173, 1, 1, 1, 1, 1,
-0.3935274, 0.7601693, 1.398602, 1, 1, 1, 1, 1,
-0.3900283, -1.766679, -2.973726, 1, 1, 1, 1, 1,
-0.3868998, -0.6630278, -3.083843, 1, 1, 1, 1, 1,
-0.3861773, -1.26575, -3.747784, 1, 1, 1, 1, 1,
-0.3859722, -0.8483128, -2.846694, 1, 1, 1, 1, 1,
-0.3853383, 0.8397133, -1.193649, 1, 1, 1, 1, 1,
-0.3847916, -1.992566, -2.726413, 1, 1, 1, 1, 1,
-0.3805763, -0.08688992, -2.2134, 1, 1, 1, 1, 1,
-0.3798328, 1.352543, 0.4281905, 1, 1, 1, 1, 1,
-0.3775645, -2.391091, -2.267626, 0, 0, 1, 1, 1,
-0.3774054, -0.3231964, -3.230506, 1, 0, 0, 1, 1,
-0.3763315, -2.310213, -0.6394529, 1, 0, 0, 1, 1,
-0.3747588, -0.747572, -2.603044, 1, 0, 0, 1, 1,
-0.3738489, -0.2284413, -1.841564, 1, 0, 0, 1, 1,
-0.3723654, 1.085874, -0.2942259, 1, 0, 0, 1, 1,
-0.3709225, -0.009865332, -2.380123, 0, 0, 0, 1, 1,
-0.3696536, 0.3404305, -0.5255941, 0, 0, 0, 1, 1,
-0.3682755, -1.639965, -3.254443, 0, 0, 0, 1, 1,
-0.367895, 1.108337, -1.152253, 0, 0, 0, 1, 1,
-0.3672359, 1.446373, -0.07991953, 0, 0, 0, 1, 1,
-0.3663225, -0.5271834, -2.929916, 0, 0, 0, 1, 1,
-0.3651673, -0.4605856, -2.631096, 0, 0, 0, 1, 1,
-0.364738, -1.344968, -2.085526, 1, 1, 1, 1, 1,
-0.3600079, -0.03667342, -1.686446, 1, 1, 1, 1, 1,
-0.3594713, -0.4183574, -2.576067, 1, 1, 1, 1, 1,
-0.3561822, -0.6049053, -1.664267, 1, 1, 1, 1, 1,
-0.3474725, -0.7988989, -2.394232, 1, 1, 1, 1, 1,
-0.3432607, 0.134807, -1.769873, 1, 1, 1, 1, 1,
-0.3431727, -0.2273253, -1.92761, 1, 1, 1, 1, 1,
-0.343096, -1.102514, -2.029599, 1, 1, 1, 1, 1,
-0.34068, -0.5821854, -1.990252, 1, 1, 1, 1, 1,
-0.3373186, 1.225476, 0.4977144, 1, 1, 1, 1, 1,
-0.3371179, 0.03777175, -1.074193, 1, 1, 1, 1, 1,
-0.324695, 1.157695, 0.9129524, 1, 1, 1, 1, 1,
-0.323981, 0.3177123, -1.683365, 1, 1, 1, 1, 1,
-0.3200109, -0.4629726, -3.052164, 1, 1, 1, 1, 1,
-0.3193716, -0.765155, -3.681126, 1, 1, 1, 1, 1,
-0.3180092, 0.08728897, -2.269264, 0, 0, 1, 1, 1,
-0.3154977, 0.1729133, -0.5539017, 1, 0, 0, 1, 1,
-0.3111869, 0.4839677, -2.063782, 1, 0, 0, 1, 1,
-0.3097522, 0.2000803, -3.069123, 1, 0, 0, 1, 1,
-0.3096459, 0.873485, 0.6787185, 1, 0, 0, 1, 1,
-0.3056275, 0.5208594, 0.7118915, 1, 0, 0, 1, 1,
-0.3030424, -0.891656, -2.392928, 0, 0, 0, 1, 1,
-0.3029094, 1.684495, -1.806393, 0, 0, 0, 1, 1,
-0.3016074, 0.1395752, -0.3483604, 0, 0, 0, 1, 1,
-0.2988111, 0.4664522, -1.263741, 0, 0, 0, 1, 1,
-0.2983159, -1.98537, -1.876841, 0, 0, 0, 1, 1,
-0.297147, 0.5140415, -0.8428572, 0, 0, 0, 1, 1,
-0.2929122, 2.100003, 0.4662946, 0, 0, 0, 1, 1,
-0.2893122, -0.2382144, 0.7072952, 1, 1, 1, 1, 1,
-0.2890131, -1.087854, -1.216195, 1, 1, 1, 1, 1,
-0.2880858, -0.371592, -2.816742, 1, 1, 1, 1, 1,
-0.2853824, -1.426683, -1.416602, 1, 1, 1, 1, 1,
-0.2824455, 0.4470174, -0.09854786, 1, 1, 1, 1, 1,
-0.2805086, 1.461637, 1.221572, 1, 1, 1, 1, 1,
-0.2774515, -1.683832, -1.580465, 1, 1, 1, 1, 1,
-0.2612804, 0.2601393, -0.8644598, 1, 1, 1, 1, 1,
-0.2587995, -0.9811662, -3.286976, 1, 1, 1, 1, 1,
-0.25767, 1.468768, 1.456124, 1, 1, 1, 1, 1,
-0.2432761, 1.130096, -0.7915193, 1, 1, 1, 1, 1,
-0.2407085, 0.9473454, 0.1082757, 1, 1, 1, 1, 1,
-0.2390397, 0.1298425, 1.324283, 1, 1, 1, 1, 1,
-0.2365379, -1.228098, -1.913358, 1, 1, 1, 1, 1,
-0.2338581, 0.08261452, -2.487375, 1, 1, 1, 1, 1,
-0.2329808, -0.1126999, -1.165077, 0, 0, 1, 1, 1,
-0.232564, -1.317806, -3.127554, 1, 0, 0, 1, 1,
-0.2309793, 0.4689563, 0.2916216, 1, 0, 0, 1, 1,
-0.2309513, 0.5991609, -0.5943582, 1, 0, 0, 1, 1,
-0.2257918, -0.9989311, -2.306836, 1, 0, 0, 1, 1,
-0.2220573, 1.79273, 1.746581, 1, 0, 0, 1, 1,
-0.2167661, -1.187829, -2.170588, 0, 0, 0, 1, 1,
-0.2155515, -0.0767104, -1.844435, 0, 0, 0, 1, 1,
-0.2100123, 2.07736, 1.779401, 0, 0, 0, 1, 1,
-0.2096579, -0.3699472, -3.475876, 0, 0, 0, 1, 1,
-0.2078137, -0.6505469, -3.152195, 0, 0, 0, 1, 1,
-0.2076612, 0.08027641, -2.592627, 0, 0, 0, 1, 1,
-0.2067508, -0.8972322, -4.347134, 0, 0, 0, 1, 1,
-0.2058778, 1.230642, 0.9100817, 1, 1, 1, 1, 1,
-0.205511, -0.5622019, -0.7848837, 1, 1, 1, 1, 1,
-0.2021185, -1.012512, -4.594604, 1, 1, 1, 1, 1,
-0.199734, -1.798544, -4.868655, 1, 1, 1, 1, 1,
-0.1986063, -1.338907, -4.728421, 1, 1, 1, 1, 1,
-0.1977937, 1.021521, -0.5531763, 1, 1, 1, 1, 1,
-0.1937443, -0.7749796, -3.396089, 1, 1, 1, 1, 1,
-0.1935379, 0.06695799, -2.34019, 1, 1, 1, 1, 1,
-0.187372, -1.251095, -1.729187, 1, 1, 1, 1, 1,
-0.1872149, -1.088905, -2.990307, 1, 1, 1, 1, 1,
-0.1833411, 0.4497572, 0.8097242, 1, 1, 1, 1, 1,
-0.1821755, -0.4627432, -4.653843, 1, 1, 1, 1, 1,
-0.1807616, 0.4467864, -0.4596303, 1, 1, 1, 1, 1,
-0.1794403, 0.450219, -0.9706595, 1, 1, 1, 1, 1,
-0.1775744, -1.974606, -4.963214, 1, 1, 1, 1, 1,
-0.1723888, 1.609093, -0.01606519, 0, 0, 1, 1, 1,
-0.1710356, 1.116649, -1.017767, 1, 0, 0, 1, 1,
-0.1688791, -1.620131, -2.963687, 1, 0, 0, 1, 1,
-0.1665037, 0.8059897, 0.1917504, 1, 0, 0, 1, 1,
-0.1570998, 0.2681395, -0.8364847, 1, 0, 0, 1, 1,
-0.1565865, -0.1891225, -2.082755, 1, 0, 0, 1, 1,
-0.1561013, -0.5430187, -4.251821, 0, 0, 0, 1, 1,
-0.1544658, -0.3309832, -1.629391, 0, 0, 0, 1, 1,
-0.1538409, 0.05633081, -1.411828, 0, 0, 0, 1, 1,
-0.1511307, 0.7858992, -0.683654, 0, 0, 0, 1, 1,
-0.1498377, -0.695435, -2.594773, 0, 0, 0, 1, 1,
-0.1420006, 1.56951, 1.048133, 0, 0, 0, 1, 1,
-0.1406991, 1.589146, -0.02285684, 0, 0, 0, 1, 1,
-0.1347108, -0.694345, -3.580044, 1, 1, 1, 1, 1,
-0.1336061, 0.05719467, -1.779967, 1, 1, 1, 1, 1,
-0.1309129, 0.5311781, -1.26989, 1, 1, 1, 1, 1,
-0.1281968, -0.601325, -3.12805, 1, 1, 1, 1, 1,
-0.1272346, 0.8610913, -1.139158, 1, 1, 1, 1, 1,
-0.1267166, 0.5444485, 0.7326422, 1, 1, 1, 1, 1,
-0.1222804, 1.766991, -0.754645, 1, 1, 1, 1, 1,
-0.1214613, 0.3190235, 0.6909204, 1, 1, 1, 1, 1,
-0.1154789, -1.153678, -4.288139, 1, 1, 1, 1, 1,
-0.1153938, -0.6817167, -1.290177, 1, 1, 1, 1, 1,
-0.1144553, 0.7165124, -0.1210658, 1, 1, 1, 1, 1,
-0.1133504, -0.3960715, -1.836947, 1, 1, 1, 1, 1,
-0.112419, 0.604657, 0.357409, 1, 1, 1, 1, 1,
-0.1095858, 0.7940975, 0.3731837, 1, 1, 1, 1, 1,
-0.1091794, -0.8705112, -3.519725, 1, 1, 1, 1, 1,
-0.1076643, -0.5879556, -0.001725867, 0, 0, 1, 1, 1,
-0.1052804, -0.5146683, -1.776014, 1, 0, 0, 1, 1,
-0.09640416, 0.4502279, 0.2616992, 1, 0, 0, 1, 1,
-0.09584744, -1.290686, -3.40134, 1, 0, 0, 1, 1,
-0.09521398, 1.992627, -0.2017366, 1, 0, 0, 1, 1,
-0.09158766, -0.7185465, -3.821496, 1, 0, 0, 1, 1,
-0.0898583, -0.7228271, -4.366571, 0, 0, 0, 1, 1,
-0.08548896, 0.0787434, -0.6713706, 0, 0, 0, 1, 1,
-0.08516441, 1.747033, 0.1996035, 0, 0, 0, 1, 1,
-0.08488351, -0.4560393, -4.270841, 0, 0, 0, 1, 1,
-0.08019806, 0.2714203, -1.878164, 0, 0, 0, 1, 1,
-0.07937992, -0.7869699, -1.730013, 0, 0, 0, 1, 1,
-0.07922443, 0.5566534, 0.6779018, 0, 0, 0, 1, 1,
-0.07659253, 0.05691079, -1.80543, 1, 1, 1, 1, 1,
-0.07207001, -0.9242644, -4.269507, 1, 1, 1, 1, 1,
-0.0702673, -1.630567, -2.745405, 1, 1, 1, 1, 1,
-0.06919368, 0.3697799, -0.1533667, 1, 1, 1, 1, 1,
-0.06864862, -0.5445088, -3.282835, 1, 1, 1, 1, 1,
-0.06691238, -1.649517, -2.879651, 1, 1, 1, 1, 1,
-0.05810965, -0.584425, -3.534341, 1, 1, 1, 1, 1,
-0.05501539, -0.3295893, -3.027055, 1, 1, 1, 1, 1,
-0.05372468, 0.1970957, -0.4953464, 1, 1, 1, 1, 1,
-0.04751454, -1.065766, -3.505637, 1, 1, 1, 1, 1,
-0.04165937, -0.8091873, -2.721948, 1, 1, 1, 1, 1,
-0.04127671, 0.6543594, -1.304361, 1, 1, 1, 1, 1,
-0.03729508, -0.4287166, -2.978485, 1, 1, 1, 1, 1,
-0.03275157, -1.1353, -4.820271, 1, 1, 1, 1, 1,
-0.02974691, 0.6710454, 0.3229587, 1, 1, 1, 1, 1,
-0.02192066, 0.46865, 0.760228, 0, 0, 1, 1, 1,
-0.02090188, -1.197019, -2.996067, 1, 0, 0, 1, 1,
-0.02046141, -0.2512518, -4.918478, 1, 0, 0, 1, 1,
-0.01865301, 0.1004771, -0.7073557, 1, 0, 0, 1, 1,
-0.009269084, -1.214145, -3.118919, 1, 0, 0, 1, 1,
-0.008633776, -1.136155, -3.132012, 1, 0, 0, 1, 1,
-0.004872344, -0.02589311, -3.082699, 0, 0, 0, 1, 1,
-0.0009792261, -0.07719604, -4.203108, 0, 0, 0, 1, 1,
-0.0001402734, 0.8675591, 1.251988, 0, 0, 0, 1, 1,
0.0005395054, -0.2888997, 4.014388, 0, 0, 0, 1, 1,
0.001346136, 1.467882, -0.731527, 0, 0, 0, 1, 1,
0.004167239, -0.4706068, 3.363113, 0, 0, 0, 1, 1,
0.004230756, 0.08901493, 0.7524426, 0, 0, 0, 1, 1,
0.008156911, -0.8506577, 4.349986, 1, 1, 1, 1, 1,
0.008815602, -0.8117099, 2.245501, 1, 1, 1, 1, 1,
0.01059254, -0.160314, 2.454949, 1, 1, 1, 1, 1,
0.0117349, -2.057414, 1.498532, 1, 1, 1, 1, 1,
0.01230208, 1.271035, -0.7355398, 1, 1, 1, 1, 1,
0.01304593, -0.8086339, 1.088129, 1, 1, 1, 1, 1,
0.0140151, -1.710436, 4.075987, 1, 1, 1, 1, 1,
0.01510724, 0.6200622, -0.6691975, 1, 1, 1, 1, 1,
0.01549444, 0.5188497, -0.3454267, 1, 1, 1, 1, 1,
0.01559429, -1.641456, 2.835394, 1, 1, 1, 1, 1,
0.01599253, -0.9750791, 2.363041, 1, 1, 1, 1, 1,
0.01646205, -0.03794207, 1.341797, 1, 1, 1, 1, 1,
0.01686241, -0.81075, 0.8556721, 1, 1, 1, 1, 1,
0.01797549, -0.763185, 2.442179, 1, 1, 1, 1, 1,
0.02068379, 0.1047163, -0.5747626, 1, 1, 1, 1, 1,
0.02196555, -0.5236785, 3.909472, 0, 0, 1, 1, 1,
0.02217503, 0.4891903, -0.5545717, 1, 0, 0, 1, 1,
0.02420437, -0.8433912, 3.283102, 1, 0, 0, 1, 1,
0.02537392, -1.817069, 2.03964, 1, 0, 0, 1, 1,
0.02790015, 0.4359056, 0.8614087, 1, 0, 0, 1, 1,
0.0302392, 0.7537818, 0.8475841, 1, 0, 0, 1, 1,
0.03391425, 0.8560105, 0.2554971, 0, 0, 0, 1, 1,
0.04374047, 1.22272, -0.1229993, 0, 0, 0, 1, 1,
0.04714415, -1.032847, 2.489704, 0, 0, 0, 1, 1,
0.04966533, -0.08727523, 2.97816, 0, 0, 0, 1, 1,
0.05297657, 0.6430699, -0.2407749, 0, 0, 0, 1, 1,
0.05845674, -1.956289, 4.053248, 0, 0, 0, 1, 1,
0.0625529, 0.1680751, -0.235377, 0, 0, 0, 1, 1,
0.06447813, 1.429295, -1.410726, 1, 1, 1, 1, 1,
0.0674577, 1.676182, 1.213625, 1, 1, 1, 1, 1,
0.06879726, -0.3871729, 3.427695, 1, 1, 1, 1, 1,
0.07171996, -0.8324584, 1.599882, 1, 1, 1, 1, 1,
0.07240742, -1.080088, 3.046756, 1, 1, 1, 1, 1,
0.0767434, -2.499876, 2.882224, 1, 1, 1, 1, 1,
0.08046546, 0.3999166, -0.473354, 1, 1, 1, 1, 1,
0.0829085, -0.1077051, 2.582458, 1, 1, 1, 1, 1,
0.08293878, 1.440999, -0.7259226, 1, 1, 1, 1, 1,
0.0957832, 0.8108003, 0.3110975, 1, 1, 1, 1, 1,
0.09806225, 0.1668156, -0.4229159, 1, 1, 1, 1, 1,
0.1002048, 0.7774518, 0.6009201, 1, 1, 1, 1, 1,
0.1007634, -0.3252421, 1.401578, 1, 1, 1, 1, 1,
0.1017918, -0.04913594, 1.618043, 1, 1, 1, 1, 1,
0.1037129, -0.3236685, 3.782681, 1, 1, 1, 1, 1,
0.1051339, -0.2015906, 1.932135, 0, 0, 1, 1, 1,
0.1083263, -0.2505201, 1.460989, 1, 0, 0, 1, 1,
0.1086179, 1.143469, -1.7309, 1, 0, 0, 1, 1,
0.1097125, 1.084846, -1.210006, 1, 0, 0, 1, 1,
0.1140818, 1.56221, 2.000808, 1, 0, 0, 1, 1,
0.1150404, 0.2653201, 1.030763, 1, 0, 0, 1, 1,
0.1204105, -0.2085174, 3.625552, 0, 0, 0, 1, 1,
0.1223403, -0.102386, 2.779421, 0, 0, 0, 1, 1,
0.1233051, -1.336583, 2.591607, 0, 0, 0, 1, 1,
0.1256031, 1.10626, 1.191306, 0, 0, 0, 1, 1,
0.1257367, -0.0585401, 1.091243, 0, 0, 0, 1, 1,
0.1260381, 0.8313155, 0.647535, 0, 0, 0, 1, 1,
0.1283616, 0.1606542, 0.4696172, 0, 0, 0, 1, 1,
0.1287005, 0.6751848, 0.9421644, 1, 1, 1, 1, 1,
0.1295452, 0.7191603, 0.4824212, 1, 1, 1, 1, 1,
0.1341831, 0.450293, 1.479814, 1, 1, 1, 1, 1,
0.1347503, -0.5453403, 3.757093, 1, 1, 1, 1, 1,
0.1371324, 0.6639736, 1.331528, 1, 1, 1, 1, 1,
0.1379611, -0.09068412, 0.9630339, 1, 1, 1, 1, 1,
0.1384327, -0.939588, 2.680866, 1, 1, 1, 1, 1,
0.1389635, -0.04295864, 3.03866, 1, 1, 1, 1, 1,
0.1390914, 1.472119, -0.1217079, 1, 1, 1, 1, 1,
0.1463313, 0.4458582, -1.082679, 1, 1, 1, 1, 1,
0.1502763, 1.13358, 0.3164195, 1, 1, 1, 1, 1,
0.1596079, 0.7429329, 0.4097101, 1, 1, 1, 1, 1,
0.1658285, 0.1690398, 1.245162, 1, 1, 1, 1, 1,
0.1700498, 0.731271, 1.768027, 1, 1, 1, 1, 1,
0.1713151, -1.401516, 4.184222, 1, 1, 1, 1, 1,
0.172563, 0.930671, 0.1142693, 0, 0, 1, 1, 1,
0.1727368, -0.4133942, 2.329461, 1, 0, 0, 1, 1,
0.1764289, 1.601956, 0.67197, 1, 0, 0, 1, 1,
0.1773645, 0.5654038, -0.3274543, 1, 0, 0, 1, 1,
0.1786648, 0.3540692, 0.3900392, 1, 0, 0, 1, 1,
0.1861704, 0.9927455, -0.8092641, 1, 0, 0, 1, 1,
0.1915284, -1.156126, 3.029913, 0, 0, 0, 1, 1,
0.196351, -1.505492, 3.634915, 0, 0, 0, 1, 1,
0.1997222, 0.1141863, 0.7855804, 0, 0, 0, 1, 1,
0.199799, -0.4936325, 2.237755, 0, 0, 0, 1, 1,
0.2001152, 0.4157858, 2.429524, 0, 0, 0, 1, 1,
0.2008872, 0.04175076, -0.574011, 0, 0, 0, 1, 1,
0.201697, -0.9545971, 1.005776, 0, 0, 0, 1, 1,
0.2028058, 0.6280072, 1.994412, 1, 1, 1, 1, 1,
0.2036556, -0.5031841, 2.034836, 1, 1, 1, 1, 1,
0.2041739, 0.1402723, 0.3447964, 1, 1, 1, 1, 1,
0.2050173, 1.084132, -1.519626, 1, 1, 1, 1, 1,
0.2052783, 0.8393751, 0.6505579, 1, 1, 1, 1, 1,
0.2083828, 1.590261, 1.490689, 1, 1, 1, 1, 1,
0.2103898, 0.6412867, 0.6006073, 1, 1, 1, 1, 1,
0.2226973, 1.181284, 0.9302319, 1, 1, 1, 1, 1,
0.2233827, -0.5981321, 2.160464, 1, 1, 1, 1, 1,
0.2234166, -0.4957706, 1.459332, 1, 1, 1, 1, 1,
0.2237183, 0.8946037, 0.3999731, 1, 1, 1, 1, 1,
0.2397813, 1.346878, 1.355916, 1, 1, 1, 1, 1,
0.2403058, -3.027954, 2.196839, 1, 1, 1, 1, 1,
0.2419875, -0.7359046, 1.222116, 1, 1, 1, 1, 1,
0.2436492, 0.2169316, -0.4018316, 1, 1, 1, 1, 1,
0.2586418, 0.507397, 1.525274, 0, 0, 1, 1, 1,
0.262879, 0.957092, -0.6679277, 1, 0, 0, 1, 1,
0.2664481, 0.1882231, 0.9601244, 1, 0, 0, 1, 1,
0.2687081, 1.558286, -0.5072567, 1, 0, 0, 1, 1,
0.2731788, 0.1838158, 1.397161, 1, 0, 0, 1, 1,
0.2784429, -0.8148447, 2.948063, 1, 0, 0, 1, 1,
0.2806515, -0.3511409, 1.89054, 0, 0, 0, 1, 1,
0.2809698, 0.2706545, 1.620693, 0, 0, 0, 1, 1,
0.2868142, 0.9645662, -0.7597483, 0, 0, 0, 1, 1,
0.2931508, -0.6364302, 1.880365, 0, 0, 0, 1, 1,
0.2941647, -0.3738302, 2.849904, 0, 0, 0, 1, 1,
0.2946585, 1.146365, -0.9953185, 0, 0, 0, 1, 1,
0.2957187, 1.584034, -0.9273565, 0, 0, 0, 1, 1,
0.2985663, -0.559745, 2.533688, 1, 1, 1, 1, 1,
0.2986648, 1.864407, -0.5951695, 1, 1, 1, 1, 1,
0.3007017, -0.5049226, 3.754439, 1, 1, 1, 1, 1,
0.3011138, 0.6204218, 1.390517, 1, 1, 1, 1, 1,
0.3025125, 0.7285399, 1.251677, 1, 1, 1, 1, 1,
0.3029573, -0.5532973, 2.075685, 1, 1, 1, 1, 1,
0.3058863, -1.078607, 2.083529, 1, 1, 1, 1, 1,
0.3074217, -0.004236381, 3.856525, 1, 1, 1, 1, 1,
0.3098201, -0.7721038, 3.170683, 1, 1, 1, 1, 1,
0.3126424, -1.34212, 3.31497, 1, 1, 1, 1, 1,
0.3132349, -0.4241627, 2.107206, 1, 1, 1, 1, 1,
0.3166396, -1.43258, 3.992828, 1, 1, 1, 1, 1,
0.3187229, -0.791703, 1.453184, 1, 1, 1, 1, 1,
0.3208696, 0.7491177, 1.542248, 1, 1, 1, 1, 1,
0.3211119, 0.889376, 0.38366, 1, 1, 1, 1, 1,
0.321371, -0.3140976, 1.881421, 0, 0, 1, 1, 1,
0.3232274, -0.06960435, 2.924017, 1, 0, 0, 1, 1,
0.3275553, -0.7335186, 1.419716, 1, 0, 0, 1, 1,
0.329018, -1.776896, 2.198619, 1, 0, 0, 1, 1,
0.3300785, -0.1687611, 1.294796, 1, 0, 0, 1, 1,
0.3309062, 2.163292, -1.009053, 1, 0, 0, 1, 1,
0.3327437, 0.9077193, 1.838745, 0, 0, 0, 1, 1,
0.3352689, 0.6199915, 0.6068807, 0, 0, 0, 1, 1,
0.3362306, 0.5033335, 0.1244496, 0, 0, 0, 1, 1,
0.3391672, -0.3091179, 1.582834, 0, 0, 0, 1, 1,
0.3423075, 1.525916, 0.5820634, 0, 0, 0, 1, 1,
0.3427899, -1.375102, 2.741812, 0, 0, 0, 1, 1,
0.3475902, 0.1725578, 0.8662321, 0, 0, 0, 1, 1,
0.3489948, 1.16437, 1.0902, 1, 1, 1, 1, 1,
0.3499762, -1.246407, 3.446255, 1, 1, 1, 1, 1,
0.3606995, -0.01327608, 0.8058459, 1, 1, 1, 1, 1,
0.362642, -2.31516, 2.354656, 1, 1, 1, 1, 1,
0.3652, -0.8146426, 2.685678, 1, 1, 1, 1, 1,
0.3677678, 1.187079, -0.4719475, 1, 1, 1, 1, 1,
0.3691901, 0.3205794, 0.6336373, 1, 1, 1, 1, 1,
0.3702138, 1.223257, -0.85675, 1, 1, 1, 1, 1,
0.3723029, -0.4797232, 2.801696, 1, 1, 1, 1, 1,
0.372396, -1.349295, 3.011904, 1, 1, 1, 1, 1,
0.3813317, 1.156618, -0.04661286, 1, 1, 1, 1, 1,
0.3814392, -0.346606, 2.204741, 1, 1, 1, 1, 1,
0.3826101, 0.8314385, -0.07339634, 1, 1, 1, 1, 1,
0.3877857, -0.07030755, 2.469981, 1, 1, 1, 1, 1,
0.3979787, -1.183311, 1.852269, 1, 1, 1, 1, 1,
0.3985614, -3.155517, 1.951246, 0, 0, 1, 1, 1,
0.3992627, 1.179013, -0.767341, 1, 0, 0, 1, 1,
0.3997355, -0.5082778, 3.793238, 1, 0, 0, 1, 1,
0.4025446, 0.1009296, 1.294812, 1, 0, 0, 1, 1,
0.4026712, -0.9916832, 1.050068, 1, 0, 0, 1, 1,
0.4064402, 1.066153, 1.03017, 1, 0, 0, 1, 1,
0.4104155, -1.410254, 2.830518, 0, 0, 0, 1, 1,
0.4217901, -1.422957, 3.429734, 0, 0, 0, 1, 1,
0.4228506, 1.161085, 0.2379432, 0, 0, 0, 1, 1,
0.4261908, -0.07040135, 2.022524, 0, 0, 0, 1, 1,
0.4317693, -0.2212935, 1.280588, 0, 0, 0, 1, 1,
0.4349616, -0.3380577, 2.490713, 0, 0, 0, 1, 1,
0.4359636, 0.7943374, -0.2734117, 0, 0, 0, 1, 1,
0.4375662, -0.349864, 2.628, 1, 1, 1, 1, 1,
0.4377992, 0.1699062, -0.4170485, 1, 1, 1, 1, 1,
0.4378424, -1.581733, 3.790886, 1, 1, 1, 1, 1,
0.4396769, 1.631962, 0.334098, 1, 1, 1, 1, 1,
0.4440387, -1.823269, 1.225619, 1, 1, 1, 1, 1,
0.4526075, 1.089347, 1.109383, 1, 1, 1, 1, 1,
0.4527686, -1.137807, 3.387634, 1, 1, 1, 1, 1,
0.4639552, 0.5778924, 0.3392305, 1, 1, 1, 1, 1,
0.4725724, -0.3211516, 1.844526, 1, 1, 1, 1, 1,
0.4798587, -0.9585798, 2.047975, 1, 1, 1, 1, 1,
0.4809481, 0.7912331, 1.366799, 1, 1, 1, 1, 1,
0.4812042, 0.4824061, 0.3849071, 1, 1, 1, 1, 1,
0.4837975, -0.09396325, 1.795459, 1, 1, 1, 1, 1,
0.4842893, -0.9990994, 4.839687, 1, 1, 1, 1, 1,
0.4860705, -0.5282533, 1.160338, 1, 1, 1, 1, 1,
0.4878364, -0.8113694, 2.618917, 0, 0, 1, 1, 1,
0.4890523, -1.257147, 2.195202, 1, 0, 0, 1, 1,
0.492648, 0.5181327, -0.3294056, 1, 0, 0, 1, 1,
0.4930121, 0.5859657, 0.09711856, 1, 0, 0, 1, 1,
0.4930335, -1.111707, 1.769475, 1, 0, 0, 1, 1,
0.4973359, 0.7100257, 1.019172, 1, 0, 0, 1, 1,
0.4993006, -1.000171, 1.955618, 0, 0, 0, 1, 1,
0.4999842, -0.1554323, 3.123011, 0, 0, 0, 1, 1,
0.5039513, -0.7436384, 2.742344, 0, 0, 0, 1, 1,
0.50427, 0.862343, 1.376542, 0, 0, 0, 1, 1,
0.5092976, -1.492956, 3.353724, 0, 0, 0, 1, 1,
0.5109193, -0.2236221, 2.912345, 0, 0, 0, 1, 1,
0.5122482, 0.02507746, 2.013311, 0, 0, 0, 1, 1,
0.5152906, -0.4728926, 2.156546, 1, 1, 1, 1, 1,
0.5183688, -1.330012, 3.055475, 1, 1, 1, 1, 1,
0.5185754, -0.6005021, 2.001053, 1, 1, 1, 1, 1,
0.5209108, 1.088396, 0.960982, 1, 1, 1, 1, 1,
0.5212037, -1.48646, 2.055556, 1, 1, 1, 1, 1,
0.5233712, 0.6997639, 0.1009316, 1, 1, 1, 1, 1,
0.5275059, -0.6523454, 3.569157, 1, 1, 1, 1, 1,
0.5339814, 0.476608, 1.280395, 1, 1, 1, 1, 1,
0.5384773, 0.3942018, 1.026396, 1, 1, 1, 1, 1,
0.5409458, 1.289459, 1.031871, 1, 1, 1, 1, 1,
0.5443179, -0.4364801, 1.049375, 1, 1, 1, 1, 1,
0.5454355, -0.1122826, 3.380261, 1, 1, 1, 1, 1,
0.5463317, 2.345538, -0.1174051, 1, 1, 1, 1, 1,
0.5482291, 0.3025597, 0.6470798, 1, 1, 1, 1, 1,
0.5485417, -0.2976502, 2.030563, 1, 1, 1, 1, 1,
0.5498396, -1.305492, 3.353144, 0, 0, 1, 1, 1,
0.5514893, 1.27051, 1.445397, 1, 0, 0, 1, 1,
0.5520169, -0.2798618, -0.5072398, 1, 0, 0, 1, 1,
0.5566361, -0.4954324, 3.312532, 1, 0, 0, 1, 1,
0.5625104, 1.82332, 1.5869, 1, 0, 0, 1, 1,
0.5689182, -0.5120464, 2.198295, 1, 0, 0, 1, 1,
0.5699034, 1.365922, 1.837603, 0, 0, 0, 1, 1,
0.571013, 1.009379, 0.3624035, 0, 0, 0, 1, 1,
0.5713546, -0.1308821, -0.4220241, 0, 0, 0, 1, 1,
0.5746394, 0.1507217, 1.402907, 0, 0, 0, 1, 1,
0.5757439, 0.1020236, 0.6263098, 0, 0, 0, 1, 1,
0.5812081, 0.7512052, 0.1803562, 0, 0, 0, 1, 1,
0.5847553, 0.1080017, 2.987889, 0, 0, 0, 1, 1,
0.5904557, 0.9270435, 2.248325, 1, 1, 1, 1, 1,
0.5909665, 1.279158, 1.249288, 1, 1, 1, 1, 1,
0.5933813, 0.2338478, -0.0438321, 1, 1, 1, 1, 1,
0.5940791, -0.6881128, 1.551659, 1, 1, 1, 1, 1,
0.5947971, 1.037971, 1.253387, 1, 1, 1, 1, 1,
0.5993143, -0.4010924, 1.373573, 1, 1, 1, 1, 1,
0.6013642, 1.852582, 1.445661, 1, 1, 1, 1, 1,
0.6017529, -0.7081521, 2.732716, 1, 1, 1, 1, 1,
0.6100955, -0.677675, 2.327395, 1, 1, 1, 1, 1,
0.6263956, 0.3673676, 0.9750887, 1, 1, 1, 1, 1,
0.6281446, 1.204787, 0.4098352, 1, 1, 1, 1, 1,
0.6286808, -0.2997357, 2.367357, 1, 1, 1, 1, 1,
0.6307176, 2.602409, -1.910146, 1, 1, 1, 1, 1,
0.6314635, 1.017126, 0.6868954, 1, 1, 1, 1, 1,
0.6344858, -0.1759912, 2.080693, 1, 1, 1, 1, 1,
0.6353467, -0.1841296, -0.1537298, 0, 0, 1, 1, 1,
0.6364967, 0.8489364, 0.7676983, 1, 0, 0, 1, 1,
0.6372783, 1.056819, 1.007897, 1, 0, 0, 1, 1,
0.6385579, 0.6084527, 1.739331, 1, 0, 0, 1, 1,
0.6400012, 0.0548934, 2.092947, 1, 0, 0, 1, 1,
0.6414971, 0.423345, 2.194369, 1, 0, 0, 1, 1,
0.6449314, -1.385593, 1.828665, 0, 0, 0, 1, 1,
0.6472246, 0.9565889, -0.6600108, 0, 0, 0, 1, 1,
0.6572842, 0.08513697, 2.71688, 0, 0, 0, 1, 1,
0.6575958, -0.3238011, 2.40207, 0, 0, 0, 1, 1,
0.6599223, -0.45533, 2.707871, 0, 0, 0, 1, 1,
0.6619956, 0.02630658, 2.121301, 0, 0, 0, 1, 1,
0.6623404, 0.3210187, 0.4378783, 0, 0, 0, 1, 1,
0.6648468, -0.6129764, 2.573434, 1, 1, 1, 1, 1,
0.6661273, 1.215016, 0.6858631, 1, 1, 1, 1, 1,
0.6662771, -0.45336, 2.578897, 1, 1, 1, 1, 1,
0.668618, -0.3897303, 2.628778, 1, 1, 1, 1, 1,
0.6699625, 0.1695352, 0.05237254, 1, 1, 1, 1, 1,
0.6710105, 0.0731122, 0.006429303, 1, 1, 1, 1, 1,
0.6784343, -0.06664095, 1.408038, 1, 1, 1, 1, 1,
0.6790812, -1.422956, 2.736526, 1, 1, 1, 1, 1,
0.6791179, -0.1376223, 0.4002051, 1, 1, 1, 1, 1,
0.6808551, 0.9964869, 1.13715, 1, 1, 1, 1, 1,
0.6931342, 0.5776044, 1.139285, 1, 1, 1, 1, 1,
0.6946104, -1.070054, 1.174234, 1, 1, 1, 1, 1,
0.6963862, -0.2107629, 2.130376, 1, 1, 1, 1, 1,
0.6988602, -0.1397257, 2.183719, 1, 1, 1, 1, 1,
0.6992139, -0.05112867, 0.8707252, 1, 1, 1, 1, 1,
0.7029156, 0.7283619, 0.7540974, 0, 0, 1, 1, 1,
0.7043384, -1.612914, 2.90637, 1, 0, 0, 1, 1,
0.7095019, 1.334026, -0.7369414, 1, 0, 0, 1, 1,
0.7100305, -0.8411407, 1.297583, 1, 0, 0, 1, 1,
0.710539, -0.9269304, 1.238839, 1, 0, 0, 1, 1,
0.7108808, 0.2434087, 1.647073, 1, 0, 0, 1, 1,
0.7110203, 0.3245668, 1.006203, 0, 0, 0, 1, 1,
0.7146205, 1.33771, -1.663512, 0, 0, 0, 1, 1,
0.7243966, 0.1728919, 2.870739, 0, 0, 0, 1, 1,
0.7257175, -0.8081804, 1.915308, 0, 0, 0, 1, 1,
0.7271289, 2.156655, -0.04238619, 0, 0, 0, 1, 1,
0.733216, 1.5068, 0.2070383, 0, 0, 0, 1, 1,
0.7353414, 1.334751, 0.8159376, 0, 0, 0, 1, 1,
0.7360669, 1.967365, 1.023934, 1, 1, 1, 1, 1,
0.7368706, -0.6906347, 1.432265, 1, 1, 1, 1, 1,
0.7380332, 0.1644013, 1.571108, 1, 1, 1, 1, 1,
0.7483939, -0.1194153, 1.598828, 1, 1, 1, 1, 1,
0.7491028, -1.807861, 1.869018, 1, 1, 1, 1, 1,
0.7524585, 0.5324777, 0.7848608, 1, 1, 1, 1, 1,
0.7555478, 1.303848, 0.7070192, 1, 1, 1, 1, 1,
0.7609305, 0.7556841, 1.179843, 1, 1, 1, 1, 1,
0.7662027, 0.789064, 0.3969944, 1, 1, 1, 1, 1,
0.773288, -0.2372231, 1.96895, 1, 1, 1, 1, 1,
0.7769008, -0.0264763, 1.306857, 1, 1, 1, 1, 1,
0.7826469, 0.4448312, 1.372729, 1, 1, 1, 1, 1,
0.7832574, 0.6830822, 1.278493, 1, 1, 1, 1, 1,
0.7976587, 0.1397648, 2.521122, 1, 1, 1, 1, 1,
0.7983454, -0.1659277, 2.030416, 1, 1, 1, 1, 1,
0.8086047, 0.2862305, 1.387683, 0, 0, 1, 1, 1,
0.8104325, 2.55918, -0.2656062, 1, 0, 0, 1, 1,
0.8138071, -0.8715141, 4.374738, 1, 0, 0, 1, 1,
0.8144571, 0.1641107, 2.919379, 1, 0, 0, 1, 1,
0.8180165, 1.395957, 1.6858, 1, 0, 0, 1, 1,
0.8270513, -1.348846, 3.687842, 1, 0, 0, 1, 1,
0.8293503, -0.117989, -0.642593, 0, 0, 0, 1, 1,
0.832014, 0.945932, 0.6586576, 0, 0, 0, 1, 1,
0.8506911, -0.2363659, 2.574515, 0, 0, 0, 1, 1,
0.8816282, 0.2093216, 1.628882, 0, 0, 0, 1, 1,
0.8959969, -0.5362722, 2.971701, 0, 0, 0, 1, 1,
0.9050351, 0.6705927, 2.702033, 0, 0, 0, 1, 1,
0.9100417, 0.4638698, 2.210196, 0, 0, 0, 1, 1,
0.9105628, -1.460436, 3.354533, 1, 1, 1, 1, 1,
0.9148213, -1.824872, 2.233571, 1, 1, 1, 1, 1,
0.9173961, -1.869104, 2.495438, 1, 1, 1, 1, 1,
0.9197012, 0.6422868, -1.11826, 1, 1, 1, 1, 1,
0.9211801, 0.4165271, 1.488292, 1, 1, 1, 1, 1,
0.9227837, -1.091146, 2.081609, 1, 1, 1, 1, 1,
0.9351846, 0.3665866, -0.4246167, 1, 1, 1, 1, 1,
0.9361439, -0.2248055, 1.18046, 1, 1, 1, 1, 1,
0.9373764, 0.952182, 1.414549, 1, 1, 1, 1, 1,
0.9397309, 0.7294309, 1.581127, 1, 1, 1, 1, 1,
0.9483235, 2.349134, 0.149889, 1, 1, 1, 1, 1,
0.9531785, 0.08437959, 0.4213802, 1, 1, 1, 1, 1,
0.9556654, 0.97411, 1.111398, 1, 1, 1, 1, 1,
0.9586602, 0.4853464, 0.2338347, 1, 1, 1, 1, 1,
0.9611954, 0.9869109, 0.0562642, 1, 1, 1, 1, 1,
0.9652981, -0.2614182, 2.375775, 0, 0, 1, 1, 1,
0.9653016, -1.042981, 3.685198, 1, 0, 0, 1, 1,
0.9693334, -0.758292, 2.356259, 1, 0, 0, 1, 1,
0.9748564, 2.217463, 1.678327, 1, 0, 0, 1, 1,
0.9875489, 1.967229, -0.9132438, 1, 0, 0, 1, 1,
0.9879705, 0.5953079, 1.389769, 1, 0, 0, 1, 1,
0.9901485, 0.9015826, 1.933511, 0, 0, 0, 1, 1,
0.9942524, 2.571195, 0.5113358, 0, 0, 0, 1, 1,
1.002988, 1.193528, 0.4257097, 0, 0, 0, 1, 1,
1.005219, 0.6769624, 0.5297455, 0, 0, 0, 1, 1,
1.006358, 0.7781538, 1.838655, 0, 0, 0, 1, 1,
1.00736, 0.0200337, 2.12392, 0, 0, 0, 1, 1,
1.007789, -1.199627, 1.033462, 0, 0, 0, 1, 1,
1.008415, -1.043213, 1.879844, 1, 1, 1, 1, 1,
1.013164, 1.990252, 0.9930992, 1, 1, 1, 1, 1,
1.01338, -0.1520612, 1.82085, 1, 1, 1, 1, 1,
1.014168, 0.4912194, 3.574662, 1, 1, 1, 1, 1,
1.028136, 0.03678991, 1.100881, 1, 1, 1, 1, 1,
1.030439, -0.7232362, 3.47681, 1, 1, 1, 1, 1,
1.032335, -1.483288, 2.848574, 1, 1, 1, 1, 1,
1.032576, -0.6037682, 1.824983, 1, 1, 1, 1, 1,
1.03885, 0.7805249, 0.625542, 1, 1, 1, 1, 1,
1.045737, -0.7608572, 1.995564, 1, 1, 1, 1, 1,
1.049281, 0.6039824, -0.1778369, 1, 1, 1, 1, 1,
1.050316, 0.09243681, 3.782999, 1, 1, 1, 1, 1,
1.057763, 0.8544614, 1.282249, 1, 1, 1, 1, 1,
1.058631, 0.9741197, 1.5009, 1, 1, 1, 1, 1,
1.070054, -1.009151, 0.04779718, 1, 1, 1, 1, 1,
1.072822, -0.2581776, 2.202053, 0, 0, 1, 1, 1,
1.075342, 0.04894553, 0.845399, 1, 0, 0, 1, 1,
1.077277, -0.1030356, 3.739225, 1, 0, 0, 1, 1,
1.082014, 0.1281504, 2.443094, 1, 0, 0, 1, 1,
1.083136, -0.4238166, 1.070706, 1, 0, 0, 1, 1,
1.083692, 0.7767082, 0.006443251, 1, 0, 0, 1, 1,
1.088997, 1.471291, -0.06887608, 0, 0, 0, 1, 1,
1.09092, 0.160849, 1.465288, 0, 0, 0, 1, 1,
1.093036, -0.007251513, 1.897402, 0, 0, 0, 1, 1,
1.098456, 0.8189572, -1.477271, 0, 0, 0, 1, 1,
1.108114, -1.467123, 3.107941, 0, 0, 0, 1, 1,
1.111979, 0.3379439, 1.639927, 0, 0, 0, 1, 1,
1.13313, 0.5738071, 1.877159, 0, 0, 0, 1, 1,
1.133808, -1.55431, 0.4724093, 1, 1, 1, 1, 1,
1.135473, -0.5173746, 4.329387, 1, 1, 1, 1, 1,
1.138974, -0.1004762, 2.341967, 1, 1, 1, 1, 1,
1.150796, -0.09887243, 1.986771, 1, 1, 1, 1, 1,
1.154516, -1.818005, 1.172254, 1, 1, 1, 1, 1,
1.157804, -0.2988654, 2.813073, 1, 1, 1, 1, 1,
1.163735, -0.1339858, 1.607928, 1, 1, 1, 1, 1,
1.168474, 0.5862002, 1.45568, 1, 1, 1, 1, 1,
1.197577, 1.673457, 0.7220633, 1, 1, 1, 1, 1,
1.198314, -0.3217977, 0.6407348, 1, 1, 1, 1, 1,
1.202757, -0.9395116, 2.731168, 1, 1, 1, 1, 1,
1.203158, 1.746852, -1.938741, 1, 1, 1, 1, 1,
1.205528, -1.229132, 3.16783, 1, 1, 1, 1, 1,
1.209362, 0.5207662, 1.719063, 1, 1, 1, 1, 1,
1.209566, -1.215521, 3.274755, 1, 1, 1, 1, 1,
1.216089, 0.7437993, 2.110455, 0, 0, 1, 1, 1,
1.218375, -0.2954582, 0.3147495, 1, 0, 0, 1, 1,
1.224709, -1.337565, 2.118683, 1, 0, 0, 1, 1,
1.241477, -0.4684277, 1.860607, 1, 0, 0, 1, 1,
1.24843, 0.1793019, 1.817899, 1, 0, 0, 1, 1,
1.253373, 0.686123, 0.2875237, 1, 0, 0, 1, 1,
1.255751, -0.5795267, 4.209559, 0, 0, 0, 1, 1,
1.256726, 0.306416, 0.8512409, 0, 0, 0, 1, 1,
1.257117, -0.7489961, 0.9959404, 0, 0, 0, 1, 1,
1.264279, 0.2751088, -0.1115482, 0, 0, 0, 1, 1,
1.264918, 2.181927, 1.716717, 0, 0, 0, 1, 1,
1.265749, 0.9649279, 0.1748233, 0, 0, 0, 1, 1,
1.270209, -0.2383947, 1.528728, 0, 0, 0, 1, 1,
1.271169, -0.1098853, 3.271393, 1, 1, 1, 1, 1,
1.272364, 1.996794, 1.655623, 1, 1, 1, 1, 1,
1.277303, -0.6831599, 1.69306, 1, 1, 1, 1, 1,
1.287143, -1.673584, 1.964414, 1, 1, 1, 1, 1,
1.288915, 1.806242, 0.5058337, 1, 1, 1, 1, 1,
1.301939, -0.5915412, 2.911623, 1, 1, 1, 1, 1,
1.303502, -1.517309, 3.528703, 1, 1, 1, 1, 1,
1.307109, -1.478541, 2.211518, 1, 1, 1, 1, 1,
1.307303, 0.6442725, 2.634018, 1, 1, 1, 1, 1,
1.308018, -0.2102223, 3.036557, 1, 1, 1, 1, 1,
1.310547, 0.09466575, -0.2736934, 1, 1, 1, 1, 1,
1.318444, -0.6512917, 2.928116, 1, 1, 1, 1, 1,
1.331084, -0.7820256, 2.606553, 1, 1, 1, 1, 1,
1.334383, 1.305536, -0.5635598, 1, 1, 1, 1, 1,
1.336402, -1.333937, 1.954895, 1, 1, 1, 1, 1,
1.341412, 0.4028721, -0.04719588, 0, 0, 1, 1, 1,
1.34209, -1.056263, 2.671718, 1, 0, 0, 1, 1,
1.357725, 0.6730635, 1.292678, 1, 0, 0, 1, 1,
1.368315, 1.477038, 1.407932, 1, 0, 0, 1, 1,
1.373042, -0.6196155, 1.065575, 1, 0, 0, 1, 1,
1.40327, -2.519775, 2.308529, 1, 0, 0, 1, 1,
1.407186, -0.8467243, 0.9260638, 0, 0, 0, 1, 1,
1.431424, 0.1681017, 1.707625, 0, 0, 0, 1, 1,
1.433311, 0.5562881, 1.79818, 0, 0, 0, 1, 1,
1.44641, 0.4064619, 0.648383, 0, 0, 0, 1, 1,
1.450117, -0.4647278, 3.376473, 0, 0, 0, 1, 1,
1.463846, -1.191762, 1.281563, 0, 0, 0, 1, 1,
1.465497, -1.71564, 2.694885, 0, 0, 0, 1, 1,
1.47461, -3.019104, 3.26801, 1, 1, 1, 1, 1,
1.475358, -0.2357536, 2.050076, 1, 1, 1, 1, 1,
1.488358, 0.1944544, 2.550228, 1, 1, 1, 1, 1,
1.50331, 0.1633351, 2.441536, 1, 1, 1, 1, 1,
1.514065, -0.07966337, 2.417007, 1, 1, 1, 1, 1,
1.539085, -0.09613553, 2.387525, 1, 1, 1, 1, 1,
1.545348, 2.108509, 2.730968, 1, 1, 1, 1, 1,
1.552318, 0.8192914, 0.8455386, 1, 1, 1, 1, 1,
1.560285, 2.594458, 0.1111636, 1, 1, 1, 1, 1,
1.563705, -0.4992146, 1.070055, 1, 1, 1, 1, 1,
1.568149, 0.1736763, 0.4785721, 1, 1, 1, 1, 1,
1.569464, -2.054735, 3.176855, 1, 1, 1, 1, 1,
1.579177, -0.5594487, 3.734363, 1, 1, 1, 1, 1,
1.583646, -1.616865, 1.41493, 1, 1, 1, 1, 1,
1.587509, 0.3088889, 0.7860543, 1, 1, 1, 1, 1,
1.588665, 0.0802773, 0.6097988, 0, 0, 1, 1, 1,
1.592301, -0.2421683, 1.876722, 1, 0, 0, 1, 1,
1.594269, 1.307002, 0.2529796, 1, 0, 0, 1, 1,
1.597487, 0.1341173, 0.6356176, 1, 0, 0, 1, 1,
1.617513, -0.6458008, 1.319141, 1, 0, 0, 1, 1,
1.626397, 0.4747915, 3.614674, 1, 0, 0, 1, 1,
1.641362, 0.8417878, 1.834795, 0, 0, 0, 1, 1,
1.644736, 0.2828232, 1.872362, 0, 0, 0, 1, 1,
1.647754, -0.7525987, 0.9705912, 0, 0, 0, 1, 1,
1.679684, 0.5731249, -0.03040787, 0, 0, 0, 1, 1,
1.685295, 0.08017237, 1.455817, 0, 0, 0, 1, 1,
1.70274, 0.1693631, 1.485568, 0, 0, 0, 1, 1,
1.71323, 1.308726, 1.723534, 0, 0, 0, 1, 1,
1.71924, 0.3720276, 1.166206, 1, 1, 1, 1, 1,
1.724179, -0.5084149, 0.8939139, 1, 1, 1, 1, 1,
1.748467, 1.427257, 3.346704, 1, 1, 1, 1, 1,
1.754384, 0.3146082, 1.290362, 1, 1, 1, 1, 1,
1.755789, -1.418122, 2.009607, 1, 1, 1, 1, 1,
1.779228, -1.110889, 1.233398, 1, 1, 1, 1, 1,
1.787594, 1.548448, 0.6517515, 1, 1, 1, 1, 1,
1.798403, 0.3445746, -0.6985404, 1, 1, 1, 1, 1,
1.808607, -1.02203, 2.264906, 1, 1, 1, 1, 1,
1.817465, -0.8967745, 3.298975, 1, 1, 1, 1, 1,
1.85763, -0.6505197, 2.370631, 1, 1, 1, 1, 1,
1.90221, -0.3581919, 0.9384686, 1, 1, 1, 1, 1,
1.918629, 0.05639604, 3.632933, 1, 1, 1, 1, 1,
1.963852, 0.26818, 3.222069, 1, 1, 1, 1, 1,
1.973855, 0.3074142, 2.665144, 1, 1, 1, 1, 1,
1.982757, 0.6935577, 1.695266, 0, 0, 1, 1, 1,
2.019819, 0.6611097, 0.8590696, 1, 0, 0, 1, 1,
2.035017, 0.9778864, 0.4320383, 1, 0, 0, 1, 1,
2.056282, 0.9714795, 2.513308, 1, 0, 0, 1, 1,
2.068979, 0.2508091, 1.077083, 1, 0, 0, 1, 1,
2.093622, -0.3230313, 0.4824438, 1, 0, 0, 1, 1,
2.209394, 0.1176538, 1.825654, 0, 0, 0, 1, 1,
2.226649, 0.7658981, -0.4724388, 0, 0, 0, 1, 1,
2.228993, 0.05921814, 1.500626, 0, 0, 0, 1, 1,
2.235988, 1.694288, 1.911957, 0, 0, 0, 1, 1,
2.252278, -0.2029057, 0.7861632, 0, 0, 0, 1, 1,
2.284889, -0.8931167, 1.322806, 0, 0, 0, 1, 1,
2.297929, -0.5734199, 2.519557, 0, 0, 0, 1, 1,
2.349386, 1.133999, -0.25944, 1, 1, 1, 1, 1,
2.361502, 0.8710915, 1.725972, 1, 1, 1, 1, 1,
2.406606, -0.636684, 2.464908, 1, 1, 1, 1, 1,
2.458562, -0.6641781, 1.181577, 1, 1, 1, 1, 1,
2.501331, 1.428709, 2.409833, 1, 1, 1, 1, 1,
2.715865, 1.473504, -0.3000842, 1, 1, 1, 1, 1,
2.728148, -0.4566128, 2.207046, 1, 1, 1, 1, 1
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
var radius = 9.10706;
var distance = 31.98816;
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
mvMatrix.translate( 0.1722939, -0.1460733, 0.06176329 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.98816);
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
