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
-2.814944, -1.340602, -4.010073, 1, 0, 0, 1,
-2.741302, 0.283103, -0.8826252, 1, 0.007843138, 0, 1,
-2.683363, -2.004403, -2.010062, 1, 0.01176471, 0, 1,
-2.628273, -0.06426674, 0.3021352, 1, 0.01960784, 0, 1,
-2.603215, -0.4201087, -1.557412, 1, 0.02352941, 0, 1,
-2.601462, 1.368243, -0.8637382, 1, 0.03137255, 0, 1,
-2.520594, 0.4010176, -2.075357, 1, 0.03529412, 0, 1,
-2.451412, 0.1893688, -2.25158, 1, 0.04313726, 0, 1,
-2.351324, 0.139221, -0.57188, 1, 0.04705882, 0, 1,
-2.341649, -0.9197562, -0.9333451, 1, 0.05490196, 0, 1,
-2.337273, 0.3160254, -1.132961, 1, 0.05882353, 0, 1,
-2.268257, 0.1536007, -2.015944, 1, 0.06666667, 0, 1,
-2.248136, 1.315403, -0.839919, 1, 0.07058824, 0, 1,
-2.231146, -0.8493027, -3.210879, 1, 0.07843138, 0, 1,
-2.19886, 0.3406219, -1.075273, 1, 0.08235294, 0, 1,
-2.193443, -1.074469, -3.695109, 1, 0.09019608, 0, 1,
-2.193038, -0.03701807, -2.498614, 1, 0.09411765, 0, 1,
-2.123397, -0.5920411, -1.289869, 1, 0.1019608, 0, 1,
-2.106105, 2.089115, -2.259016, 1, 0.1098039, 0, 1,
-2.054868, 0.5880891, -2.353651, 1, 0.1137255, 0, 1,
-2.05188, 1.246662, 0.2992233, 1, 0.1215686, 0, 1,
-2.047281, 1.183365, -1.718443, 1, 0.1254902, 0, 1,
-2.045482, 0.4838083, -3.198447, 1, 0.1333333, 0, 1,
-2.022016, 0.8209713, -0.580945, 1, 0.1372549, 0, 1,
-2.011583, -2.037049, -0.835423, 1, 0.145098, 0, 1,
-1.972969, -0.889702, -0.9133503, 1, 0.1490196, 0, 1,
-1.930327, 0.04765939, -0.2778394, 1, 0.1568628, 0, 1,
-1.92735, -0.2547675, -1.866317, 1, 0.1607843, 0, 1,
-1.925161, -0.372214, -1.578235, 1, 0.1686275, 0, 1,
-1.914221, 0.03022578, -1.858031, 1, 0.172549, 0, 1,
-1.909147, 0.6531785, -1.221575, 1, 0.1803922, 0, 1,
-1.896491, -1.482758, -0.5723127, 1, 0.1843137, 0, 1,
-1.874041, 1.316351, 0.4097508, 1, 0.1921569, 0, 1,
-1.844275, 1.174256, -1.81259, 1, 0.1960784, 0, 1,
-1.81567, -1.18809, -3.330648, 1, 0.2039216, 0, 1,
-1.813148, -0.159008, -2.990643, 1, 0.2117647, 0, 1,
-1.812677, -0.04227699, -0.1172721, 1, 0.2156863, 0, 1,
-1.807263, 0.2902535, -3.087442, 1, 0.2235294, 0, 1,
-1.775888, -0.9705339, -1.903634, 1, 0.227451, 0, 1,
-1.769892, 0.2101624, -1.206205, 1, 0.2352941, 0, 1,
-1.768143, -0.7511497, -1.236116, 1, 0.2392157, 0, 1,
-1.766095, 2.180959, -2.0466, 1, 0.2470588, 0, 1,
-1.730764, -0.4686352, -2.929255, 1, 0.2509804, 0, 1,
-1.725976, 1.403648, -0.9470056, 1, 0.2588235, 0, 1,
-1.677508, -0.2079863, -0.8042364, 1, 0.2627451, 0, 1,
-1.675943, 0.2354888, -1.620677, 1, 0.2705882, 0, 1,
-1.673752, 1.100325, -1.024043, 1, 0.2745098, 0, 1,
-1.672477, 0.5855466, -1.275895, 1, 0.282353, 0, 1,
-1.670813, 1.182054, -1.617061, 1, 0.2862745, 0, 1,
-1.66943, 0.4015855, -2.815017, 1, 0.2941177, 0, 1,
-1.662878, -0.5556648, -3.061035, 1, 0.3019608, 0, 1,
-1.655704, -0.9919585, -3.643667, 1, 0.3058824, 0, 1,
-1.650918, -0.4257243, -3.053422, 1, 0.3137255, 0, 1,
-1.621867, 1.270931, -0.8227186, 1, 0.3176471, 0, 1,
-1.610318, 1.063028, -1.075823, 1, 0.3254902, 0, 1,
-1.592472, -0.680869, -2.086957, 1, 0.3294118, 0, 1,
-1.586304, 0.06907407, -1.09817, 1, 0.3372549, 0, 1,
-1.577659, -1.010116, -2.628196, 1, 0.3411765, 0, 1,
-1.575397, 1.616721, -0.1786029, 1, 0.3490196, 0, 1,
-1.557702, 2.584176, -1.601586, 1, 0.3529412, 0, 1,
-1.553271, 2.750127, -0.7789165, 1, 0.3607843, 0, 1,
-1.543391, 0.6158816, -1.390609, 1, 0.3647059, 0, 1,
-1.539559, -0.9855814, -2.925351, 1, 0.372549, 0, 1,
-1.534628, -0.1050348, -2.793036, 1, 0.3764706, 0, 1,
-1.528497, 0.680172, -0.9008686, 1, 0.3843137, 0, 1,
-1.522296, -1.038024, -3.054918, 1, 0.3882353, 0, 1,
-1.513057, -0.7949188, -2.145913, 1, 0.3960784, 0, 1,
-1.508255, -0.6645714, -2.201013, 1, 0.4039216, 0, 1,
-1.507159, 1.757559, -1.155632, 1, 0.4078431, 0, 1,
-1.502816, 0.6041905, 0.3269022, 1, 0.4156863, 0, 1,
-1.462516, 1.066609, -1.060252, 1, 0.4196078, 0, 1,
-1.460785, 0.5884197, -1.422053, 1, 0.427451, 0, 1,
-1.460287, 0.02230553, -0.9479269, 1, 0.4313726, 0, 1,
-1.454146, -0.6683842, -2.330613, 1, 0.4392157, 0, 1,
-1.453657, -1.844078, -1.4638, 1, 0.4431373, 0, 1,
-1.451193, 0.3529081, -2.089615, 1, 0.4509804, 0, 1,
-1.451138, 0.3628519, 0.942953, 1, 0.454902, 0, 1,
-1.422208, -0.07666446, -1.969826, 1, 0.4627451, 0, 1,
-1.406843, -0.4193273, -1.96211, 1, 0.4666667, 0, 1,
-1.405214, -1.652063, -2.373107, 1, 0.4745098, 0, 1,
-1.397978, 0.2984422, -1.20443, 1, 0.4784314, 0, 1,
-1.389566, -0.02171522, -1.481705, 1, 0.4862745, 0, 1,
-1.375094, -1.515189, -1.930577, 1, 0.4901961, 0, 1,
-1.36261, 0.1639253, -3.143312, 1, 0.4980392, 0, 1,
-1.360876, -0.232108, -0.5225756, 1, 0.5058824, 0, 1,
-1.350149, -1.009601, -1.867013, 1, 0.509804, 0, 1,
-1.348938, -1.578424, -2.603128, 1, 0.5176471, 0, 1,
-1.342675, 1.472171, -0.9561717, 1, 0.5215687, 0, 1,
-1.342009, 1.494183, 0.8415368, 1, 0.5294118, 0, 1,
-1.331255, 0.2365769, -0.2731646, 1, 0.5333334, 0, 1,
-1.33002, 0.9352497, -1.056365, 1, 0.5411765, 0, 1,
-1.325211, -0.4649383, -2.307892, 1, 0.5450981, 0, 1,
-1.323901, -1.365158, -0.8960018, 1, 0.5529412, 0, 1,
-1.322542, 0.9958603, 0.4150482, 1, 0.5568628, 0, 1,
-1.309477, 0.1559047, -0.8690752, 1, 0.5647059, 0, 1,
-1.306159, 0.4146879, -1.569646, 1, 0.5686275, 0, 1,
-1.300881, -0.02283308, -1.898618, 1, 0.5764706, 0, 1,
-1.29928, -0.6509367, -0.5016564, 1, 0.5803922, 0, 1,
-1.292506, 1.979568, -0.7385399, 1, 0.5882353, 0, 1,
-1.291534, -1.839054, -3.722438, 1, 0.5921569, 0, 1,
-1.285877, 0.2631141, -2.676555, 1, 0.6, 0, 1,
-1.281642, -0.8605624, -3.057299, 1, 0.6078432, 0, 1,
-1.277707, 0.1046803, -1.681589, 1, 0.6117647, 0, 1,
-1.277438, -0.4913872, -0.773351, 1, 0.6196079, 0, 1,
-1.271134, 0.09496173, -1.558006, 1, 0.6235294, 0, 1,
-1.262966, -1.323662, -2.756199, 1, 0.6313726, 0, 1,
-1.25922, 0.3110023, -1.695465, 1, 0.6352941, 0, 1,
-1.254149, -1.490591, -0.5524777, 1, 0.6431373, 0, 1,
-1.253986, -0.04293396, -2.475796, 1, 0.6470588, 0, 1,
-1.244945, -0.8263364, -1.754212, 1, 0.654902, 0, 1,
-1.237728, -0.1213822, -1.775994, 1, 0.6588235, 0, 1,
-1.233315, -0.2128478, -1.086902, 1, 0.6666667, 0, 1,
-1.228835, 0.524752, 0.7888983, 1, 0.6705883, 0, 1,
-1.220023, -0.003835571, -1.812609, 1, 0.6784314, 0, 1,
-1.2121, -0.6854507, -2.148329, 1, 0.682353, 0, 1,
-1.2083, 0.450049, -2.776443, 1, 0.6901961, 0, 1,
-1.207423, -1.134912, -2.397974, 1, 0.6941177, 0, 1,
-1.193064, 1.272356, -0.6962882, 1, 0.7019608, 0, 1,
-1.191946, -0.3627784, -0.5875866, 1, 0.7098039, 0, 1,
-1.190819, 0.4225115, 0.3678008, 1, 0.7137255, 0, 1,
-1.188816, 0.1253325, -2.679901, 1, 0.7215686, 0, 1,
-1.184404, 1.170778, -0.5215324, 1, 0.7254902, 0, 1,
-1.182712, -0.7358291, -3.132386, 1, 0.7333333, 0, 1,
-1.179871, 1.606821, -0.5317662, 1, 0.7372549, 0, 1,
-1.173825, -0.3505271, -1.001656, 1, 0.7450981, 0, 1,
-1.169837, 1.123001, -1.837481, 1, 0.7490196, 0, 1,
-1.164427, -0.3442846, -3.070513, 1, 0.7568628, 0, 1,
-1.159773, 0.3770011, 1.340769, 1, 0.7607843, 0, 1,
-1.153967, 1.430683, -0.4420686, 1, 0.7686275, 0, 1,
-1.15174, -0.6754978, -2.310987, 1, 0.772549, 0, 1,
-1.146427, 0.2499518, -0.9726254, 1, 0.7803922, 0, 1,
-1.144157, 0.1180298, -3.567777, 1, 0.7843137, 0, 1,
-1.143376, 1.171081, -0.7949413, 1, 0.7921569, 0, 1,
-1.138909, 0.2853345, -1.485338, 1, 0.7960784, 0, 1,
-1.137261, 0.6202312, -1.403297, 1, 0.8039216, 0, 1,
-1.131539, -0.1585919, 0.1272532, 1, 0.8117647, 0, 1,
-1.129138, -1.464885, 0.9164076, 1, 0.8156863, 0, 1,
-1.11657, -0.1299622, -1.016111, 1, 0.8235294, 0, 1,
-1.112214, 0.0142155, -0.9947898, 1, 0.827451, 0, 1,
-1.108099, -1.119769, -2.000868, 1, 0.8352941, 0, 1,
-1.103127, -0.5278555, -3.48034, 1, 0.8392157, 0, 1,
-1.098501, 0.7045676, -1.959329, 1, 0.8470588, 0, 1,
-1.092911, -0.7344769, -1.698363, 1, 0.8509804, 0, 1,
-1.091669, -0.8641398, -2.544574, 1, 0.8588235, 0, 1,
-1.088202, 0.3072971, -1.139075, 1, 0.8627451, 0, 1,
-1.074722, 1.754178, -0.338725, 1, 0.8705882, 0, 1,
-1.072327, -2.648733, -3.905438, 1, 0.8745098, 0, 1,
-1.059718, -0.2078237, -1.912643, 1, 0.8823529, 0, 1,
-1.058782, 1.518092, 0.8911633, 1, 0.8862745, 0, 1,
-1.049307, -2.733342, -3.346987, 1, 0.8941177, 0, 1,
-1.047728, -0.2075184, -1.465157, 1, 0.8980392, 0, 1,
-1.044618, 0.008643733, -1.901813, 1, 0.9058824, 0, 1,
-1.043275, -2.012253, -2.650636, 1, 0.9137255, 0, 1,
-1.041051, -0.143509, -2.640482, 1, 0.9176471, 0, 1,
-1.03925, -0.9518909, -2.695154, 1, 0.9254902, 0, 1,
-1.028625, -0.1490915, -2.57555, 1, 0.9294118, 0, 1,
-1.027451, 1.076768, -2.29177, 1, 0.9372549, 0, 1,
-1.012998, 0.71803, -1.182154, 1, 0.9411765, 0, 1,
-1.010853, 0.0432547, -0.4753655, 1, 0.9490196, 0, 1,
-0.9989622, 0.5959263, -0.8298654, 1, 0.9529412, 0, 1,
-0.9976043, 1.311533, -1.794265, 1, 0.9607843, 0, 1,
-0.9880844, -0.4618503, -1.860967, 1, 0.9647059, 0, 1,
-0.9875613, 1.653573, 0.07340787, 1, 0.972549, 0, 1,
-0.9853053, -0.3313317, -2.092971, 1, 0.9764706, 0, 1,
-0.9818753, 1.124804, -1.300945, 1, 0.9843137, 0, 1,
-0.9803655, 0.193423, -0.9426526, 1, 0.9882353, 0, 1,
-0.9775555, 0.6395749, -1.462963, 1, 0.9960784, 0, 1,
-0.9361479, 0.2007199, -1.419688, 0.9960784, 1, 0, 1,
-0.9342433, -0.2372645, -0.240568, 0.9921569, 1, 0, 1,
-0.92844, 0.04983487, -1.391877, 0.9843137, 1, 0, 1,
-0.9270952, -1.04896, -3.357445, 0.9803922, 1, 0, 1,
-0.9259237, 0.05834085, -3.718532, 0.972549, 1, 0, 1,
-0.923115, -0.1431477, -1.093453, 0.9686275, 1, 0, 1,
-0.912809, 0.3278136, -0.2762353, 0.9607843, 1, 0, 1,
-0.9072375, 1.642408, 0.6059859, 0.9568627, 1, 0, 1,
-0.9057468, 0.531277, -0.8205133, 0.9490196, 1, 0, 1,
-0.9052557, 0.9892155, -0.873818, 0.945098, 1, 0, 1,
-0.9000964, 0.09760471, -2.189085, 0.9372549, 1, 0, 1,
-0.8991859, -0.6927862, -2.553631, 0.9333333, 1, 0, 1,
-0.8985723, 0.3912155, -0.6456171, 0.9254902, 1, 0, 1,
-0.8912703, 0.1811398, -0.6308867, 0.9215686, 1, 0, 1,
-0.8907676, -1.710294, -1.918931, 0.9137255, 1, 0, 1,
-0.8885795, -0.2173836, -2.880243, 0.9098039, 1, 0, 1,
-0.8850322, -0.1445812, -0.8327006, 0.9019608, 1, 0, 1,
-0.8689404, 0.2550367, -0.8228009, 0.8941177, 1, 0, 1,
-0.8685043, -1.813461, -2.133567, 0.8901961, 1, 0, 1,
-0.8603545, -0.967602, -2.208432, 0.8823529, 1, 0, 1,
-0.8579919, -0.02916952, -0.8750697, 0.8784314, 1, 0, 1,
-0.8543973, -1.748237, -1.326701, 0.8705882, 1, 0, 1,
-0.8479488, 1.136616, -1.10947, 0.8666667, 1, 0, 1,
-0.845742, -0.4090512, -0.976508, 0.8588235, 1, 0, 1,
-0.8428054, 0.3879566, -0.4252894, 0.854902, 1, 0, 1,
-0.8399702, 0.1588513, -0.9267751, 0.8470588, 1, 0, 1,
-0.8398423, 0.7079206, -1.622045, 0.8431373, 1, 0, 1,
-0.8364854, -0.02487452, -2.644679, 0.8352941, 1, 0, 1,
-0.8314739, -1.038276, -3.439369, 0.8313726, 1, 0, 1,
-0.8309174, 0.5237105, -3.319919, 0.8235294, 1, 0, 1,
-0.8285705, -0.1083982, -1.005341, 0.8196079, 1, 0, 1,
-0.824183, -1.821887, -2.970172, 0.8117647, 1, 0, 1,
-0.8224671, 0.3714409, 0.619014, 0.8078431, 1, 0, 1,
-0.815835, 0.1316142, 0.5746972, 0.8, 1, 0, 1,
-0.811042, -0.01127108, -2.822234, 0.7921569, 1, 0, 1,
-0.8104739, 0.3901557, -1.919013, 0.7882353, 1, 0, 1,
-0.8102555, 0.2885998, -0.1772528, 0.7803922, 1, 0, 1,
-0.8087896, 2.062406, 2.438262, 0.7764706, 1, 0, 1,
-0.8048043, 0.7629304, -1.061083, 0.7686275, 1, 0, 1,
-0.7957327, -1.097423, -1.894663, 0.7647059, 1, 0, 1,
-0.7881069, 0.5051804, -1.10179, 0.7568628, 1, 0, 1,
-0.7877948, -0.1324216, -1.214286, 0.7529412, 1, 0, 1,
-0.7815826, 0.007131425, -1.460422, 0.7450981, 1, 0, 1,
-0.7808437, -1.460338, -0.3777564, 0.7411765, 1, 0, 1,
-0.778811, 1.324762, -0.4902289, 0.7333333, 1, 0, 1,
-0.778315, 0.1967658, -1.438016, 0.7294118, 1, 0, 1,
-0.7759746, 1.981884, -0.702898, 0.7215686, 1, 0, 1,
-0.7754146, -0.3516584, -2.058855, 0.7176471, 1, 0, 1,
-0.7745553, 2.066599, -0.7796466, 0.7098039, 1, 0, 1,
-0.7685157, 0.4273306, -0.8423997, 0.7058824, 1, 0, 1,
-0.7652416, -0.750071, -2.390231, 0.6980392, 1, 0, 1,
-0.7597709, 0.2487393, -0.2913156, 0.6901961, 1, 0, 1,
-0.7504221, 0.3490424, -1.085723, 0.6862745, 1, 0, 1,
-0.7465765, 0.8669891, -1.437399, 0.6784314, 1, 0, 1,
-0.7446169, -0.7013991, -2.966453, 0.6745098, 1, 0, 1,
-0.7437294, 0.1372313, -2.093259, 0.6666667, 1, 0, 1,
-0.741362, 0.4934747, -1.017765, 0.6627451, 1, 0, 1,
-0.7381386, -0.4968532, -1.136362, 0.654902, 1, 0, 1,
-0.7375758, -0.1886154, -4.658859, 0.6509804, 1, 0, 1,
-0.7366479, -0.3287736, -2.588074, 0.6431373, 1, 0, 1,
-0.733709, 0.1965035, 0.3135028, 0.6392157, 1, 0, 1,
-0.7315376, 0.4459343, -2.229017, 0.6313726, 1, 0, 1,
-0.7270275, -2.812476, -2.285709, 0.627451, 1, 0, 1,
-0.7242234, 1.22836, -0.5096537, 0.6196079, 1, 0, 1,
-0.7195795, -0.708925, -3.860018, 0.6156863, 1, 0, 1,
-0.7168589, -0.5925275, -1.946225, 0.6078432, 1, 0, 1,
-0.7153248, -1.096325, -3.389701, 0.6039216, 1, 0, 1,
-0.7151569, -0.2665704, -2.962284, 0.5960785, 1, 0, 1,
-0.7146994, 2.084314, 0.2675138, 0.5882353, 1, 0, 1,
-0.713662, 0.1433419, -1.208188, 0.5843138, 1, 0, 1,
-0.7122477, -1.513382, -2.311507, 0.5764706, 1, 0, 1,
-0.7052742, -0.2287876, -2.609323, 0.572549, 1, 0, 1,
-0.6909182, -0.09751273, -3.326408, 0.5647059, 1, 0, 1,
-0.6903273, -1.618377, -3.4648, 0.5607843, 1, 0, 1,
-0.6874797, 0.7394114, -0.9364934, 0.5529412, 1, 0, 1,
-0.68535, -0.8765134, -3.170449, 0.5490196, 1, 0, 1,
-0.6800714, 0.8729854, 0.6447673, 0.5411765, 1, 0, 1,
-0.675575, 0.4677936, 0.03114298, 0.5372549, 1, 0, 1,
-0.672023, -1.007198, -3.015212, 0.5294118, 1, 0, 1,
-0.671607, 0.743367, -2.190533, 0.5254902, 1, 0, 1,
-0.6677239, 0.6080111, -0.793061, 0.5176471, 1, 0, 1,
-0.6644406, -0.7587491, -3.336229, 0.5137255, 1, 0, 1,
-0.6619861, 1.031669, -1.420793, 0.5058824, 1, 0, 1,
-0.6619781, 0.7646642, -1.596202, 0.5019608, 1, 0, 1,
-0.6615695, -0.2974387, -3.401834, 0.4941176, 1, 0, 1,
-0.6610187, -0.2746324, -2.643227, 0.4862745, 1, 0, 1,
-0.6602172, -0.2649891, -1.754096, 0.4823529, 1, 0, 1,
-0.6584625, 0.4466663, 0.1178231, 0.4745098, 1, 0, 1,
-0.6580641, 1.336685, -1.621572, 0.4705882, 1, 0, 1,
-0.6536564, -0.3886949, -1.214836, 0.4627451, 1, 0, 1,
-0.6520122, -0.2775792, 0.2498864, 0.4588235, 1, 0, 1,
-0.6421799, -1.192108, -3.387061, 0.4509804, 1, 0, 1,
-0.6392742, 1.241532, -0.3032687, 0.4470588, 1, 0, 1,
-0.6309055, 2.149925, -1.192429, 0.4392157, 1, 0, 1,
-0.6306035, 1.507523, -0.5995001, 0.4352941, 1, 0, 1,
-0.6301035, -0.8982176, -1.52554, 0.427451, 1, 0, 1,
-0.6300037, -0.6735403, -4.314413, 0.4235294, 1, 0, 1,
-0.6289712, -0.2729398, -1.596218, 0.4156863, 1, 0, 1,
-0.622338, -1.585451, -2.920255, 0.4117647, 1, 0, 1,
-0.621112, 0.863631, 0.0163765, 0.4039216, 1, 0, 1,
-0.6194883, 0.8138654, -1.940791, 0.3960784, 1, 0, 1,
-0.6101104, -0.9780744, -2.152616, 0.3921569, 1, 0, 1,
-0.6046079, 1.374916, -1.858937, 0.3843137, 1, 0, 1,
-0.5941982, 1.943258, -0.3350722, 0.3803922, 1, 0, 1,
-0.5928085, 1.22101, -1.667102, 0.372549, 1, 0, 1,
-0.5873217, -0.1066315, -3.276652, 0.3686275, 1, 0, 1,
-0.5863249, -1.39651, -3.317187, 0.3607843, 1, 0, 1,
-0.5780605, 0.187186, -1.056223, 0.3568628, 1, 0, 1,
-0.5743552, -0.3643472, -3.188635, 0.3490196, 1, 0, 1,
-0.5699592, -0.2417213, -2.048125, 0.345098, 1, 0, 1,
-0.5661765, -0.2724696, -2.264505, 0.3372549, 1, 0, 1,
-0.5587294, -0.3429036, -0.747669, 0.3333333, 1, 0, 1,
-0.5570058, -1.275001, -2.722766, 0.3254902, 1, 0, 1,
-0.5548034, 0.1562098, -3.215379, 0.3215686, 1, 0, 1,
-0.5547554, -1.423028, -3.763445, 0.3137255, 1, 0, 1,
-0.553587, -1.753463, -1.896721, 0.3098039, 1, 0, 1,
-0.5520143, 1.850816, -0.2792928, 0.3019608, 1, 0, 1,
-0.5519376, -0.5870058, -2.696738, 0.2941177, 1, 0, 1,
-0.5505611, -1.062025, -4.536528, 0.2901961, 1, 0, 1,
-0.5495517, 1.870753, 1.591591, 0.282353, 1, 0, 1,
-0.5441486, 0.09582465, -1.154183, 0.2784314, 1, 0, 1,
-0.5405048, -0.6224905, -1.066018, 0.2705882, 1, 0, 1,
-0.5397782, 1.735746, -2.068964, 0.2666667, 1, 0, 1,
-0.5353703, -0.2283283, -0.9026, 0.2588235, 1, 0, 1,
-0.5293577, 1.359092, 0.084972, 0.254902, 1, 0, 1,
-0.5292811, 0.1321837, -1.642888, 0.2470588, 1, 0, 1,
-0.5252467, -0.8500102, -2.8456, 0.2431373, 1, 0, 1,
-0.5159, 0.6071295, 0.9927617, 0.2352941, 1, 0, 1,
-0.5044844, -0.007480821, -0.4864894, 0.2313726, 1, 0, 1,
-0.5004632, -0.8398998, -2.659872, 0.2235294, 1, 0, 1,
-0.4993194, -0.69846, -1.675627, 0.2196078, 1, 0, 1,
-0.4985696, 1.187234, -1.399243, 0.2117647, 1, 0, 1,
-0.4923421, 2.100916, 2.058805, 0.2078431, 1, 0, 1,
-0.4902713, -0.961127, -2.64871, 0.2, 1, 0, 1,
-0.4828946, -0.1467451, -1.280267, 0.1921569, 1, 0, 1,
-0.4785142, -1.433737, -3.555236, 0.1882353, 1, 0, 1,
-0.4755813, 2.034964, -0.5479021, 0.1803922, 1, 0, 1,
-0.4746896, -0.4456677, -2.75412, 0.1764706, 1, 0, 1,
-0.4742196, -0.3352916, -2.134894, 0.1686275, 1, 0, 1,
-0.4735131, -1.201388, -3.36665, 0.1647059, 1, 0, 1,
-0.4730554, 0.1170354, -0.3738455, 0.1568628, 1, 0, 1,
-0.4648964, 0.3366356, -2.711188, 0.1529412, 1, 0, 1,
-0.4620084, -0.5532853, -2.903239, 0.145098, 1, 0, 1,
-0.460456, 0.3797618, -0.8400833, 0.1411765, 1, 0, 1,
-0.4489182, 0.6444159, -1.169263, 0.1333333, 1, 0, 1,
-0.4457529, -1.254369, -2.093326, 0.1294118, 1, 0, 1,
-0.4367176, 0.2276435, 0.2189782, 0.1215686, 1, 0, 1,
-0.4336294, -0.2657754, -2.107802, 0.1176471, 1, 0, 1,
-0.4327672, -0.5934036, -1.989497, 0.1098039, 1, 0, 1,
-0.423786, 0.2914827, 0.853084, 0.1058824, 1, 0, 1,
-0.4214298, -1.616889, -1.65778, 0.09803922, 1, 0, 1,
-0.4166923, -0.6721691, -2.383738, 0.09019608, 1, 0, 1,
-0.4146328, 0.2533606, -2.99524, 0.08627451, 1, 0, 1,
-0.4137155, -0.4839789, -0.6169345, 0.07843138, 1, 0, 1,
-0.4047809, -0.1775373, -2.86074, 0.07450981, 1, 0, 1,
-0.3953264, -0.7321475, -3.333462, 0.06666667, 1, 0, 1,
-0.3870453, -1.438844, -3.496386, 0.0627451, 1, 0, 1,
-0.3794638, -1.157557, -1.757273, 0.05490196, 1, 0, 1,
-0.3736388, -0.2524664, -0.984333, 0.05098039, 1, 0, 1,
-0.3729543, 1.049197, -0.5523807, 0.04313726, 1, 0, 1,
-0.3727404, -2.103769, -2.314777, 0.03921569, 1, 0, 1,
-0.3712828, -0.03091447, -1.221159, 0.03137255, 1, 0, 1,
-0.370877, -0.9456233, -3.007381, 0.02745098, 1, 0, 1,
-0.3619509, -0.4154857, -2.723887, 0.01960784, 1, 0, 1,
-0.36003, -1.448465, -0.8199352, 0.01568628, 1, 0, 1,
-0.3568082, -1.417056, -2.33101, 0.007843138, 1, 0, 1,
-0.3531085, 0.6386431, -0.6896177, 0.003921569, 1, 0, 1,
-0.3524271, 0.8255714, -1.703705, 0, 1, 0.003921569, 1,
-0.3461783, 1.430521, 0.07510342, 0, 1, 0.01176471, 1,
-0.3429333, 0.5059059, -0.3558894, 0, 1, 0.01568628, 1,
-0.3426216, -0.3025166, -2.000201, 0, 1, 0.02352941, 1,
-0.3420053, 0.5349611, -1.153327, 0, 1, 0.02745098, 1,
-0.3384135, 0.9586014, -1.289543, 0, 1, 0.03529412, 1,
-0.3367625, 0.6821191, -1.298983, 0, 1, 0.03921569, 1,
-0.3355131, -0.9101271, -2.31347, 0, 1, 0.04705882, 1,
-0.335212, -0.9876519, -2.137178, 0, 1, 0.05098039, 1,
-0.3327547, -1.293667, -5.09303, 0, 1, 0.05882353, 1,
-0.3323581, 2.179996, 0.3848283, 0, 1, 0.0627451, 1,
-0.3281968, 1.557714, 0.1070614, 0, 1, 0.07058824, 1,
-0.3275513, 0.5254505, 0.3157181, 0, 1, 0.07450981, 1,
-0.3250248, -1.553098, -5.033706, 0, 1, 0.08235294, 1,
-0.3223299, -2.090393, -4.21532, 0, 1, 0.08627451, 1,
-0.3141108, 0.3661667, -0.2122775, 0, 1, 0.09411765, 1,
-0.313891, 1.343344, -2.215368, 0, 1, 0.1019608, 1,
-0.2997756, -0.3696023, -3.71854, 0, 1, 0.1058824, 1,
-0.2988084, -0.01211307, -0.7202666, 0, 1, 0.1137255, 1,
-0.2987299, 0.6860101, -0.2635594, 0, 1, 0.1176471, 1,
-0.2977772, -0.4392678, -3.088869, 0, 1, 0.1254902, 1,
-0.2952318, 0.4095604, 0.8145353, 0, 1, 0.1294118, 1,
-0.2897726, 0.9057042, 0.6586594, 0, 1, 0.1372549, 1,
-0.2846996, 0.7687761, 0.1860077, 0, 1, 0.1411765, 1,
-0.2842456, -0.4005912, -2.57452, 0, 1, 0.1490196, 1,
-0.2839163, -1.640413, -2.614135, 0, 1, 0.1529412, 1,
-0.282611, 1.403584, -1.114756, 0, 1, 0.1607843, 1,
-0.2816258, -1.218429, -4.057801, 0, 1, 0.1647059, 1,
-0.2784397, 0.7240922, 1.396451, 0, 1, 0.172549, 1,
-0.2784105, 1.41167, -0.1310523, 0, 1, 0.1764706, 1,
-0.2769763, 1.253138, -0.03793793, 0, 1, 0.1843137, 1,
-0.2769066, 0.9879069, -0.5402576, 0, 1, 0.1882353, 1,
-0.2742212, 0.366631, -1.979674, 0, 1, 0.1960784, 1,
-0.2739964, 1.370848, 0.3817993, 0, 1, 0.2039216, 1,
-0.2736691, 1.006098, -0.12249, 0, 1, 0.2078431, 1,
-0.2722836, 0.548226, -0.1125947, 0, 1, 0.2156863, 1,
-0.2721952, -0.5564433, -2.23016, 0, 1, 0.2196078, 1,
-0.2680442, 1.381408, -1.11332, 0, 1, 0.227451, 1,
-0.2658395, 0.8701584, 1.450253, 0, 1, 0.2313726, 1,
-0.2655959, 1.618162, 0.4652521, 0, 1, 0.2392157, 1,
-0.2597398, -0.3112998, -4.100589, 0, 1, 0.2431373, 1,
-0.2591833, -1.972812, -1.880454, 0, 1, 0.2509804, 1,
-0.2552072, 1.228018, 0.805906, 0, 1, 0.254902, 1,
-0.2544872, -1.944617, -2.827369, 0, 1, 0.2627451, 1,
-0.2541711, -0.6703429, -2.566496, 0, 1, 0.2666667, 1,
-0.2512397, 0.1597137, -1.520504, 0, 1, 0.2745098, 1,
-0.2509011, -1.288225, -1.20787, 0, 1, 0.2784314, 1,
-0.2499176, -0.8070537, -2.849711, 0, 1, 0.2862745, 1,
-0.2495913, -0.2572277, -1.649912, 0, 1, 0.2901961, 1,
-0.2487312, -0.735918, -4.00227, 0, 1, 0.2980392, 1,
-0.2429666, 1.686057, -0.8233257, 0, 1, 0.3058824, 1,
-0.2426821, -0.1932423, -0.8785493, 0, 1, 0.3098039, 1,
-0.2382293, 2.427288, -0.02149858, 0, 1, 0.3176471, 1,
-0.237811, 0.1429108, -0.1857079, 0, 1, 0.3215686, 1,
-0.229646, -0.236669, -3.392008, 0, 1, 0.3294118, 1,
-0.2226132, -0.3010094, -1.254167, 0, 1, 0.3333333, 1,
-0.2186677, -0.4743786, -2.888418, 0, 1, 0.3411765, 1,
-0.2112326, -0.9190294, -4.236554, 0, 1, 0.345098, 1,
-0.209704, -0.3777928, -2.605297, 0, 1, 0.3529412, 1,
-0.2091749, -0.4216987, -0.6615476, 0, 1, 0.3568628, 1,
-0.2072472, 0.736097, -0.907043, 0, 1, 0.3647059, 1,
-0.2070737, -0.1426214, -1.554747, 0, 1, 0.3686275, 1,
-0.2066258, 0.04459912, -1.69269, 0, 1, 0.3764706, 1,
-0.2054676, -1.155879, -3.129866, 0, 1, 0.3803922, 1,
-0.2053825, 0.3951269, -0.05696634, 0, 1, 0.3882353, 1,
-0.2049753, -0.5303109, -3.429604, 0, 1, 0.3921569, 1,
-0.2045687, -0.3824499, -4.29863, 0, 1, 0.4, 1,
-0.1979901, -0.2939605, -3.26424, 0, 1, 0.4078431, 1,
-0.1969199, 0.582898, -1.221078, 0, 1, 0.4117647, 1,
-0.1941655, 0.08378239, -0.001985061, 0, 1, 0.4196078, 1,
-0.192624, -0.9613121, -3.29026, 0, 1, 0.4235294, 1,
-0.1911379, -0.05862537, -3.956249, 0, 1, 0.4313726, 1,
-0.1910971, 0.7017031, -1.069002, 0, 1, 0.4352941, 1,
-0.1891164, -1.527916, -2.37833, 0, 1, 0.4431373, 1,
-0.1849197, 1.591078, 1.12836, 0, 1, 0.4470588, 1,
-0.182661, 0.2540175, 0.5548291, 0, 1, 0.454902, 1,
-0.1823544, -0.9129947, -4.064405, 0, 1, 0.4588235, 1,
-0.1818394, -0.6934941, -1.775928, 0, 1, 0.4666667, 1,
-0.1808813, 2.607428, -0.7057503, 0, 1, 0.4705882, 1,
-0.1808369, 0.7620682, 0.7492504, 0, 1, 0.4784314, 1,
-0.1799771, -1.213361, -2.578966, 0, 1, 0.4823529, 1,
-0.1777212, 0.2632605, -1.642317, 0, 1, 0.4901961, 1,
-0.1683629, 0.1430868, -0.8421691, 0, 1, 0.4941176, 1,
-0.1664969, 0.1426037, -0.1976205, 0, 1, 0.5019608, 1,
-0.1643729, -0.1997401, -0.3150508, 0, 1, 0.509804, 1,
-0.1640896, 0.991414, 0.6451111, 0, 1, 0.5137255, 1,
-0.1610428, -0.5824035, -4.856109, 0, 1, 0.5215687, 1,
-0.1579016, 0.0619794, -1.0805, 0, 1, 0.5254902, 1,
-0.1545388, -1.019357, 0.7365319, 0, 1, 0.5333334, 1,
-0.1493374, -1.705933, -4.370734, 0, 1, 0.5372549, 1,
-0.147115, 0.9600198, 0.2546804, 0, 1, 0.5450981, 1,
-0.1457039, -0.8104406, -1.442116, 0, 1, 0.5490196, 1,
-0.1455773, 0.8102332, 2.002298, 0, 1, 0.5568628, 1,
-0.1401826, 1.127743, -0.4540841, 0, 1, 0.5607843, 1,
-0.1364325, -0.4791075, -2.658266, 0, 1, 0.5686275, 1,
-0.131147, 0.09934885, 0.7873185, 0, 1, 0.572549, 1,
-0.1307495, 0.04581084, -2.891202, 0, 1, 0.5803922, 1,
-0.1295628, -0.5323792, -0.6546074, 0, 1, 0.5843138, 1,
-0.1234043, -1.15163, -3.974681, 0, 1, 0.5921569, 1,
-0.122852, 0.4343002, 1.187684, 0, 1, 0.5960785, 1,
-0.1200718, -0.6843801, -3.013422, 0, 1, 0.6039216, 1,
-0.1184362, 0.2087537, 0.3822451, 0, 1, 0.6117647, 1,
-0.1168532, -0.2568348, -2.36393, 0, 1, 0.6156863, 1,
-0.1157595, 0.8133758, 0.4492699, 0, 1, 0.6235294, 1,
-0.1117416, -1.250174, -2.992465, 0, 1, 0.627451, 1,
-0.1077535, -1.818129, -3.606888, 0, 1, 0.6352941, 1,
-0.1067101, -0.2210336, -2.74665, 0, 1, 0.6392157, 1,
-0.103601, -0.05388986, -1.392623, 0, 1, 0.6470588, 1,
-0.1001801, -1.438566, -2.227308, 0, 1, 0.6509804, 1,
-0.09960154, 0.1180289, -0.8871035, 0, 1, 0.6588235, 1,
-0.09605585, -0.5350732, -2.763596, 0, 1, 0.6627451, 1,
-0.09580627, -0.8917825, 0.08564056, 0, 1, 0.6705883, 1,
-0.09268224, 2.881377, -1.532888, 0, 1, 0.6745098, 1,
-0.09259148, -0.8782714, -2.694858, 0, 1, 0.682353, 1,
-0.09046222, -0.597643, -4.354766, 0, 1, 0.6862745, 1,
-0.08315821, 0.6662862, -1.576319, 0, 1, 0.6941177, 1,
-0.08287257, -1.114546, -2.741688, 0, 1, 0.7019608, 1,
-0.07703891, -1.912908, -4.176127, 0, 1, 0.7058824, 1,
-0.0753583, -1.133985, -3.324535, 0, 1, 0.7137255, 1,
-0.07385441, 1.465765, 0.7516288, 0, 1, 0.7176471, 1,
-0.07209028, -0.1039331, -2.863405, 0, 1, 0.7254902, 1,
-0.07155371, -0.08320626, -1.76542, 0, 1, 0.7294118, 1,
-0.06934964, 0.7075827, -0.6586305, 0, 1, 0.7372549, 1,
-0.06862684, 0.3948312, 0.2415106, 0, 1, 0.7411765, 1,
-0.06684942, -1.185805, -2.098674, 0, 1, 0.7490196, 1,
-0.06413643, -0.5686525, -4.4116, 0, 1, 0.7529412, 1,
-0.06135496, 0.9332039, 1.450861, 0, 1, 0.7607843, 1,
-0.0562981, 0.8930777, 0.7592098, 0, 1, 0.7647059, 1,
-0.05328297, 0.1766185, -1.466627, 0, 1, 0.772549, 1,
-0.05194581, 0.6916903, -1.180621, 0, 1, 0.7764706, 1,
-0.04914903, 0.150141, -1.322531, 0, 1, 0.7843137, 1,
-0.04170563, -0.9328313, -2.405743, 0, 1, 0.7882353, 1,
-0.03862976, -0.8398646, -2.351118, 0, 1, 0.7960784, 1,
-0.03378174, -0.1131874, -4.675663, 0, 1, 0.8039216, 1,
-0.03355492, -0.9944398, -3.703025, 0, 1, 0.8078431, 1,
-0.03173318, 0.8217213, -0.5695493, 0, 1, 0.8156863, 1,
-0.02954959, 0.3959857, -0.4990197, 0, 1, 0.8196079, 1,
-0.02942146, -0.2759723, -3.482735, 0, 1, 0.827451, 1,
-0.02937076, 0.04556106, -1.490727, 0, 1, 0.8313726, 1,
-0.02857387, 0.2325001, -0.9782013, 0, 1, 0.8392157, 1,
-0.02567247, 0.7310864, 0.03068755, 0, 1, 0.8431373, 1,
-0.02533879, -0.8890841, -2.909557, 0, 1, 0.8509804, 1,
-0.02106867, -1.587508, -1.795537, 0, 1, 0.854902, 1,
-0.01998794, 0.5607818, 0.6006944, 0, 1, 0.8627451, 1,
-0.01969776, 0.1226502, -1.027009, 0, 1, 0.8666667, 1,
-0.01853365, 0.5453407, -0.08132512, 0, 1, 0.8745098, 1,
-0.01538789, 0.976949, -0.9603037, 0, 1, 0.8784314, 1,
-0.01193182, -1.036167, -2.425706, 0, 1, 0.8862745, 1,
-0.007418747, 0.3496523, 0.874651, 0, 1, 0.8901961, 1,
-0.004662515, -0.1317843, -2.591113, 0, 1, 0.8980392, 1,
0.001072474, 0.4551218, -0.3808958, 0, 1, 0.9058824, 1,
0.003357188, 1.394083, -1.329653, 0, 1, 0.9098039, 1,
0.005753026, 1.245794, -0.3191342, 0, 1, 0.9176471, 1,
0.006117106, -0.8262595, 0.959118, 0, 1, 0.9215686, 1,
0.00769761, -1.328779, 4.639633, 0, 1, 0.9294118, 1,
0.009253184, 1.465356, 0.2335507, 0, 1, 0.9333333, 1,
0.01005789, 0.4927997, 0.8485799, 0, 1, 0.9411765, 1,
0.01258507, -0.7888623, 2.328996, 0, 1, 0.945098, 1,
0.01267069, 0.848097, 0.5744905, 0, 1, 0.9529412, 1,
0.01439144, -0.6460147, 3.335842, 0, 1, 0.9568627, 1,
0.01442186, 0.8680673, -1.530238, 0, 1, 0.9647059, 1,
0.02115799, 0.3436229, 0.6610157, 0, 1, 0.9686275, 1,
0.02164592, -2.016841, 3.511061, 0, 1, 0.9764706, 1,
0.02174689, -1.081035, 2.762519, 0, 1, 0.9803922, 1,
0.02521848, 1.055296, -1.297347, 0, 1, 0.9882353, 1,
0.03157144, 1.024299, 0.6041117, 0, 1, 0.9921569, 1,
0.03351571, -0.7909548, 3.131086, 0, 1, 1, 1,
0.03412373, 1.582543, -0.9863619, 0, 0.9921569, 1, 1,
0.03534327, 1.346095, -0.8086918, 0, 0.9882353, 1, 1,
0.04070615, 2.942063, -1.214423, 0, 0.9803922, 1, 1,
0.04165302, -0.3783065, 3.945797, 0, 0.9764706, 1, 1,
0.04366012, 1.162808, 0.2584443, 0, 0.9686275, 1, 1,
0.04520864, 0.1785665, 1.338987, 0, 0.9647059, 1, 1,
0.04754615, 0.005678262, 0.1995389, 0, 0.9568627, 1, 1,
0.04811368, 1.626203, 0.9254786, 0, 0.9529412, 1, 1,
0.0483469, -1.387079, 3.411115, 0, 0.945098, 1, 1,
0.0488793, -1.474461, 3.881145, 0, 0.9411765, 1, 1,
0.04939126, 0.4328403, -0.7506539, 0, 0.9333333, 1, 1,
0.04951678, -1.624592, 2.371868, 0, 0.9294118, 1, 1,
0.05204485, -0.09691768, 1.671731, 0, 0.9215686, 1, 1,
0.0526773, -0.3644715, 3.571999, 0, 0.9176471, 1, 1,
0.0544465, -0.6384022, 1.873788, 0, 0.9098039, 1, 1,
0.05477799, -0.1968093, 2.814264, 0, 0.9058824, 1, 1,
0.05569295, 0.2764083, 1.52712, 0, 0.8980392, 1, 1,
0.05725688, -0.4942718, 3.109215, 0, 0.8901961, 1, 1,
0.05831254, 0.1568066, 0.1545832, 0, 0.8862745, 1, 1,
0.06177029, 3.310836, 1.077816, 0, 0.8784314, 1, 1,
0.06823459, -2.183856, 2.26575, 0, 0.8745098, 1, 1,
0.07046722, -0.7523742, 3.790822, 0, 0.8666667, 1, 1,
0.07254808, -1.379158, 4.77536, 0, 0.8627451, 1, 1,
0.07540908, 0.1392009, 0.1378372, 0, 0.854902, 1, 1,
0.08169511, -1.274023, 2.743831, 0, 0.8509804, 1, 1,
0.08341556, -0.8839481, 4.090549, 0, 0.8431373, 1, 1,
0.08463836, -1.458597, 2.571071, 0, 0.8392157, 1, 1,
0.08846133, -0.4874215, 3.387341, 0, 0.8313726, 1, 1,
0.09066033, 1.197441, 0.876608, 0, 0.827451, 1, 1,
0.09330765, -0.3047957, 2.168964, 0, 0.8196079, 1, 1,
0.1000253, -1.032121, 4.369251, 0, 0.8156863, 1, 1,
0.1003449, -0.1362409, 0.9355739, 0, 0.8078431, 1, 1,
0.1030143, 0.2478922, 1.596537, 0, 0.8039216, 1, 1,
0.10562, -1.56423, 3.062678, 0, 0.7960784, 1, 1,
0.1085102, 0.4146852, 1.456565, 0, 0.7882353, 1, 1,
0.1099118, -0.1136078, 1.227037, 0, 0.7843137, 1, 1,
0.1109209, -1.810498, 3.207157, 0, 0.7764706, 1, 1,
0.1138158, -0.2922111, 2.821473, 0, 0.772549, 1, 1,
0.1142488, -1.423815, 2.038907, 0, 0.7647059, 1, 1,
0.1180795, 0.9715453, -0.1607911, 0, 0.7607843, 1, 1,
0.1329893, -1.038186, 2.201303, 0, 0.7529412, 1, 1,
0.1338435, 2.375368, -2.818561, 0, 0.7490196, 1, 1,
0.1347354, -0.007599217, 0.9940792, 0, 0.7411765, 1, 1,
0.1410842, -0.4464795, 3.160386, 0, 0.7372549, 1, 1,
0.142703, -0.9142069, 1.948974, 0, 0.7294118, 1, 1,
0.1427763, 1.176787, -0.0738015, 0, 0.7254902, 1, 1,
0.1432054, -1.311195, 2.000608, 0, 0.7176471, 1, 1,
0.1447543, -0.31702, 4.142253, 0, 0.7137255, 1, 1,
0.1470858, 0.7512696, -0.4985929, 0, 0.7058824, 1, 1,
0.1491365, 3.020713, 0.3816363, 0, 0.6980392, 1, 1,
0.1534068, -0.1179414, 1.574014, 0, 0.6941177, 1, 1,
0.1595192, -0.1909467, 1.802951, 0, 0.6862745, 1, 1,
0.1623565, 1.400005, 1.474923, 0, 0.682353, 1, 1,
0.1642269, -0.02683434, 2.299489, 0, 0.6745098, 1, 1,
0.1657725, -0.0665875, 2.564201, 0, 0.6705883, 1, 1,
0.1673257, 0.1997748, 0.935801, 0, 0.6627451, 1, 1,
0.1693839, -1.379669, 2.452532, 0, 0.6588235, 1, 1,
0.169478, 1.07118, -1.015679, 0, 0.6509804, 1, 1,
0.1753325, 0.8759937, 2.483519, 0, 0.6470588, 1, 1,
0.1773558, 0.7284075, -0.1929023, 0, 0.6392157, 1, 1,
0.1783156, -1.954147, 3.469578, 0, 0.6352941, 1, 1,
0.1795825, -1.824477, 4.17706, 0, 0.627451, 1, 1,
0.1799582, 0.7302985, -0.5283169, 0, 0.6235294, 1, 1,
0.1879758, -1.315716, 3.082785, 0, 0.6156863, 1, 1,
0.1901396, 0.1615287, -0.3674999, 0, 0.6117647, 1, 1,
0.1967727, 0.5337039, 0.8939079, 0, 0.6039216, 1, 1,
0.2082485, -0.6920482, 4.091888, 0, 0.5960785, 1, 1,
0.2089442, -0.02613236, 3.945255, 0, 0.5921569, 1, 1,
0.2099559, 1.048928, 0.2754787, 0, 0.5843138, 1, 1,
0.2121813, -0.5513923, 3.078078, 0, 0.5803922, 1, 1,
0.214423, -1.172881, 3.392882, 0, 0.572549, 1, 1,
0.2160828, -2.308987, 3.799049, 0, 0.5686275, 1, 1,
0.2166597, -0.6830036, 4.96877, 0, 0.5607843, 1, 1,
0.2169463, -0.3865247, 3.072378, 0, 0.5568628, 1, 1,
0.2190164, -0.8589336, 2.814017, 0, 0.5490196, 1, 1,
0.2221039, 1.104472, 0.264773, 0, 0.5450981, 1, 1,
0.2228754, 0.2006756, 2.503934, 0, 0.5372549, 1, 1,
0.2266665, -1.161469, 4.986573, 0, 0.5333334, 1, 1,
0.227951, -0.1206931, 1.86427, 0, 0.5254902, 1, 1,
0.2288462, 0.78866, 0.6727979, 0, 0.5215687, 1, 1,
0.2302141, -0.5488298, 2.654545, 0, 0.5137255, 1, 1,
0.235379, -1.183615, 2.682532, 0, 0.509804, 1, 1,
0.2382468, 1.343676, 0.147392, 0, 0.5019608, 1, 1,
0.2393171, -1.320057, 2.620165, 0, 0.4941176, 1, 1,
0.2468233, -1.005114, 2.463092, 0, 0.4901961, 1, 1,
0.2470067, -1.254926, 4.810954, 0, 0.4823529, 1, 1,
0.2497409, 0.30575, 0.04259178, 0, 0.4784314, 1, 1,
0.2497888, -0.09932929, 0.5099666, 0, 0.4705882, 1, 1,
0.2524992, 0.5507619, 2.13644, 0, 0.4666667, 1, 1,
0.2531227, -1.304764, 2.121878, 0, 0.4588235, 1, 1,
0.2598264, 0.1325955, -0.3644527, 0, 0.454902, 1, 1,
0.2601228, -0.9109113, 4.872278, 0, 0.4470588, 1, 1,
0.2607331, -0.04115266, 1.263094, 0, 0.4431373, 1, 1,
0.2616901, -1.609836, 2.638987, 0, 0.4352941, 1, 1,
0.2623551, 0.3020755, 0.10109, 0, 0.4313726, 1, 1,
0.2632878, 0.2735315, 0.9345513, 0, 0.4235294, 1, 1,
0.2669119, -1.051774, 3.203971, 0, 0.4196078, 1, 1,
0.2745521, 1.710248, 1.039437, 0, 0.4117647, 1, 1,
0.274763, 0.6907774, -0.4278854, 0, 0.4078431, 1, 1,
0.2773534, 0.5237584, -1.53485, 0, 0.4, 1, 1,
0.2776836, -0.7163687, 3.287304, 0, 0.3921569, 1, 1,
0.2787477, 1.388527, 0.5767365, 0, 0.3882353, 1, 1,
0.2793846, 0.7415403, 0.8269672, 0, 0.3803922, 1, 1,
0.28224, 0.4972393, -1.063416, 0, 0.3764706, 1, 1,
0.2825549, 0.01217152, 1.138435, 0, 0.3686275, 1, 1,
0.2857196, 0.420898, 1.273296, 0, 0.3647059, 1, 1,
0.2880068, 2.349609, -0.3436592, 0, 0.3568628, 1, 1,
0.2903351, 0.8049666, -0.06986616, 0, 0.3529412, 1, 1,
0.2942776, 1.116989, 0.9947951, 0, 0.345098, 1, 1,
0.2987335, -0.89335, 2.713486, 0, 0.3411765, 1, 1,
0.2991084, 0.5000738, -0.616687, 0, 0.3333333, 1, 1,
0.2998018, 0.7644306, 0.03769975, 0, 0.3294118, 1, 1,
0.3096455, -0.6969596, 1.852487, 0, 0.3215686, 1, 1,
0.3101262, -2.10544, 2.987141, 0, 0.3176471, 1, 1,
0.3178407, -1.631516, 3.752107, 0, 0.3098039, 1, 1,
0.3194566, -0.9150203, 2.842432, 0, 0.3058824, 1, 1,
0.3217469, -0.321284, 3.128635, 0, 0.2980392, 1, 1,
0.322066, 0.5483124, -1.018198, 0, 0.2901961, 1, 1,
0.3241518, 0.7526449, 1.364593, 0, 0.2862745, 1, 1,
0.3270337, 1.37069, -0.002429585, 0, 0.2784314, 1, 1,
0.3287547, 1.490853, 0.6432882, 0, 0.2745098, 1, 1,
0.3331624, -0.9416122, 4.036007, 0, 0.2666667, 1, 1,
0.3334005, -0.8475252, 2.161942, 0, 0.2627451, 1, 1,
0.3518352, 1.101123, 1.9163, 0, 0.254902, 1, 1,
0.3558587, 0.6866747, 2.608498, 0, 0.2509804, 1, 1,
0.3559958, 0.9473405, 0.5441089, 0, 0.2431373, 1, 1,
0.3651483, -0.9099858, 3.45158, 0, 0.2392157, 1, 1,
0.3666843, 0.01200642, -0.587751, 0, 0.2313726, 1, 1,
0.3667836, -0.8288344, 4.331077, 0, 0.227451, 1, 1,
0.3675561, 0.07295938, -0.2451215, 0, 0.2196078, 1, 1,
0.3686167, 0.8605136, 1.884574, 0, 0.2156863, 1, 1,
0.3725734, -0.8705704, 2.116531, 0, 0.2078431, 1, 1,
0.3748377, 1.422366, 0.4524781, 0, 0.2039216, 1, 1,
0.3759331, -1.336936, 2.063922, 0, 0.1960784, 1, 1,
0.3817942, -0.6543164, 3.371781, 0, 0.1882353, 1, 1,
0.3847761, -0.6270987, 3.159871, 0, 0.1843137, 1, 1,
0.3853613, 0.7868293, 1.080207, 0, 0.1764706, 1, 1,
0.3872998, -0.7176749, 3.151546, 0, 0.172549, 1, 1,
0.3964082, -1.30787, 2.910542, 0, 0.1647059, 1, 1,
0.4008764, 2.346416, -0.3894335, 0, 0.1607843, 1, 1,
0.402014, -0.9377695, 2.807003, 0, 0.1529412, 1, 1,
0.4067207, -0.8715498, 1.147583, 0, 0.1490196, 1, 1,
0.4132617, 0.2816308, 2.130518, 0, 0.1411765, 1, 1,
0.4145372, 1.059804, 0.2330775, 0, 0.1372549, 1, 1,
0.4202919, -2.269778, 3.8064, 0, 0.1294118, 1, 1,
0.4323716, -0.9936512, 1.358225, 0, 0.1254902, 1, 1,
0.4357001, 1.065253, -1.312543, 0, 0.1176471, 1, 1,
0.4393313, 0.5877275, -0.1693172, 0, 0.1137255, 1, 1,
0.4432341, 0.7670667, 1.088002, 0, 0.1058824, 1, 1,
0.4434118, 1.243949, 1.684494, 0, 0.09803922, 1, 1,
0.4439973, -1.151596, 1.829443, 0, 0.09411765, 1, 1,
0.4486916, -0.09361146, 1.502201, 0, 0.08627451, 1, 1,
0.4495517, 0.01234778, -0.07937936, 0, 0.08235294, 1, 1,
0.4499333, 2.025571, -0.2909156, 0, 0.07450981, 1, 1,
0.4500762, -0.1978148, 1.430686, 0, 0.07058824, 1, 1,
0.4549527, 0.3997931, 1.700507, 0, 0.0627451, 1, 1,
0.4555233, -0.1296881, 0.3227287, 0, 0.05882353, 1, 1,
0.4576068, -1.957024, 2.622901, 0, 0.05098039, 1, 1,
0.4586833, -0.5283326, 1.921831, 0, 0.04705882, 1, 1,
0.4587722, -0.430972, 2.330576, 0, 0.03921569, 1, 1,
0.4646314, 0.7193511, 0.5095643, 0, 0.03529412, 1, 1,
0.4687599, 1.031891, 0.6623781, 0, 0.02745098, 1, 1,
0.4706039, -0.2650369, 1.516471, 0, 0.02352941, 1, 1,
0.4731814, 0.3838023, 1.037881, 0, 0.01568628, 1, 1,
0.473266, -0.3778814, 2.316944, 0, 0.01176471, 1, 1,
0.476416, -1.954577, 4.268641, 0, 0.003921569, 1, 1,
0.4844535, 0.6309896, 1.062998, 0.003921569, 0, 1, 1,
0.4896924, -0.3588249, 1.851572, 0.007843138, 0, 1, 1,
0.4899175, -0.2422478, 3.032368, 0.01568628, 0, 1, 1,
0.4911037, 1.368691, -0.9408078, 0.01960784, 0, 1, 1,
0.494013, -1.418663, 1.414684, 0.02745098, 0, 1, 1,
0.4961313, -0.04433948, 2.211123, 0.03137255, 0, 1, 1,
0.4999323, -0.1210771, 0.7282907, 0.03921569, 0, 1, 1,
0.5039367, -0.8351458, 1.993058, 0.04313726, 0, 1, 1,
0.5067129, -1.85067, 1.540576, 0.05098039, 0, 1, 1,
0.5069945, 0.398092, 0.3751587, 0.05490196, 0, 1, 1,
0.5077645, 1.139893, -0.09985758, 0.0627451, 0, 1, 1,
0.5109356, -0.4469782, 0.3332774, 0.06666667, 0, 1, 1,
0.5156286, -2.284203, 3.491188, 0.07450981, 0, 1, 1,
0.5183718, 0.5459087, 0.5664824, 0.07843138, 0, 1, 1,
0.5270435, -1.402097, 1.573032, 0.08627451, 0, 1, 1,
0.5343969, 0.5836003, 1.045737, 0.09019608, 0, 1, 1,
0.5348808, -1.01221, 1.742897, 0.09803922, 0, 1, 1,
0.5348887, 0.5387182, -0.7100115, 0.1058824, 0, 1, 1,
0.5402741, -0.3737842, 1.467429, 0.1098039, 0, 1, 1,
0.5419749, 0.2837151, 2.951799, 0.1176471, 0, 1, 1,
0.5429356, 0.522999, 0.1801451, 0.1215686, 0, 1, 1,
0.5442366, -2.766008, 3.507928, 0.1294118, 0, 1, 1,
0.5443262, 0.3303202, 2.801311, 0.1333333, 0, 1, 1,
0.5468234, -1.09028, 2.730588, 0.1411765, 0, 1, 1,
0.5489001, -0.3589404, 2.563864, 0.145098, 0, 1, 1,
0.5498244, 0.3042308, 0.4482153, 0.1529412, 0, 1, 1,
0.5501003, -0.16832, 2.486502, 0.1568628, 0, 1, 1,
0.5514434, 1.035829, -0.4878431, 0.1647059, 0, 1, 1,
0.5540129, -0.2160372, 1.648966, 0.1686275, 0, 1, 1,
0.5557883, -0.8218481, 2.056511, 0.1764706, 0, 1, 1,
0.5587505, -1.441162, 2.073894, 0.1803922, 0, 1, 1,
0.5593119, -1.052344, 1.696676, 0.1882353, 0, 1, 1,
0.5596906, -0.05256366, 3.064848, 0.1921569, 0, 1, 1,
0.5634134, -0.5824522, 3.71652, 0.2, 0, 1, 1,
0.5670503, 0.3958254, 2.123718, 0.2078431, 0, 1, 1,
0.5699842, 0.581798, 0.755062, 0.2117647, 0, 1, 1,
0.5707071, -2.55973, 3.485424, 0.2196078, 0, 1, 1,
0.5710981, -3.35464, 1.247717, 0.2235294, 0, 1, 1,
0.5758877, 0.755424, 1.801699, 0.2313726, 0, 1, 1,
0.5767803, -1.256914, 4.074758, 0.2352941, 0, 1, 1,
0.5772787, -0.7438014, 1.208397, 0.2431373, 0, 1, 1,
0.5785649, -0.1670293, 0.5154136, 0.2470588, 0, 1, 1,
0.5867494, 1.549932, 1.047546, 0.254902, 0, 1, 1,
0.587682, -0.1519961, 1.997398, 0.2588235, 0, 1, 1,
0.5928852, 1.285135, -0.316366, 0.2666667, 0, 1, 1,
0.5937583, -0.6827928, 2.107448, 0.2705882, 0, 1, 1,
0.6085278, -0.6526316, 2.652128, 0.2784314, 0, 1, 1,
0.6114563, 0.9513825, -0.5864576, 0.282353, 0, 1, 1,
0.6180962, -0.1197335, 1.883469, 0.2901961, 0, 1, 1,
0.6196631, 0.8865864, 0.3346104, 0.2941177, 0, 1, 1,
0.6220839, -0.7356573, 1.542297, 0.3019608, 0, 1, 1,
0.6247588, -1.383864, 3.167915, 0.3098039, 0, 1, 1,
0.632879, 0.1285837, 1.680348, 0.3137255, 0, 1, 1,
0.6364021, -0.4684044, 2.472586, 0.3215686, 0, 1, 1,
0.6473222, -0.4029364, 2.336598, 0.3254902, 0, 1, 1,
0.6542829, -0.4530687, 3.533808, 0.3333333, 0, 1, 1,
0.657433, 0.3532842, 0.6069804, 0.3372549, 0, 1, 1,
0.661799, 0.01713425, 1.539377, 0.345098, 0, 1, 1,
0.6695025, 1.209874, -0.778857, 0.3490196, 0, 1, 1,
0.6699795, 0.2961938, 1.74898, 0.3568628, 0, 1, 1,
0.6819761, 1.135605, 0.4274371, 0.3607843, 0, 1, 1,
0.682225, 0.6832016, -1.579367, 0.3686275, 0, 1, 1,
0.6893706, 0.2752677, 1.139336, 0.372549, 0, 1, 1,
0.6920484, -1.306705, 4.034586, 0.3803922, 0, 1, 1,
0.693948, 1.04948, 1.985174, 0.3843137, 0, 1, 1,
0.7013513, -2.354381, 2.796036, 0.3921569, 0, 1, 1,
0.7030583, 1.063032, 1.833557, 0.3960784, 0, 1, 1,
0.7135102, -0.1797086, 1.252134, 0.4039216, 0, 1, 1,
0.7148985, 1.047131, 0.05282972, 0.4117647, 0, 1, 1,
0.7281958, -0.4983959, 0.6637515, 0.4156863, 0, 1, 1,
0.7291911, 1.179944, 1.748119, 0.4235294, 0, 1, 1,
0.7297377, -0.8469939, 2.061605, 0.427451, 0, 1, 1,
0.7315214, -0.6402547, 1.073508, 0.4352941, 0, 1, 1,
0.7316827, -0.493306, 2.420558, 0.4392157, 0, 1, 1,
0.7320292, -0.5754079, 3.231996, 0.4470588, 0, 1, 1,
0.7321405, -0.1188506, 0.5995778, 0.4509804, 0, 1, 1,
0.7334369, -1.561171, 3.553966, 0.4588235, 0, 1, 1,
0.7366701, -1.504612, 2.700358, 0.4627451, 0, 1, 1,
0.738004, -0.4707574, 1.506407, 0.4705882, 0, 1, 1,
0.7419978, -2.335846, 0.9455125, 0.4745098, 0, 1, 1,
0.7435573, 0.399088, 2.337327, 0.4823529, 0, 1, 1,
0.7491421, -0.3206729, 0.8671146, 0.4862745, 0, 1, 1,
0.7545425, 0.2185291, -0.4693611, 0.4941176, 0, 1, 1,
0.7551564, 0.2559234, 0.9276227, 0.5019608, 0, 1, 1,
0.7551858, -0.7391613, 2.373279, 0.5058824, 0, 1, 1,
0.755307, 0.5941239, 1.697017, 0.5137255, 0, 1, 1,
0.7567455, 1.499856, 1.528516, 0.5176471, 0, 1, 1,
0.7603928, 0.07917938, 1.023864, 0.5254902, 0, 1, 1,
0.7618647, 0.6179443, -0.01327043, 0.5294118, 0, 1, 1,
0.7651743, 2.216234, -1.242282, 0.5372549, 0, 1, 1,
0.7659327, 1.676108, 1.355614, 0.5411765, 0, 1, 1,
0.7664901, 2.306803, 0.01556261, 0.5490196, 0, 1, 1,
0.7673168, -0.2950497, 2.843134, 0.5529412, 0, 1, 1,
0.7709351, -0.1029379, 3.25207, 0.5607843, 0, 1, 1,
0.77198, -0.652867, 4.043228, 0.5647059, 0, 1, 1,
0.7722728, -0.8211721, 3.039907, 0.572549, 0, 1, 1,
0.777867, -0.1295412, 2.325811, 0.5764706, 0, 1, 1,
0.7788644, -0.1424435, -0.7360414, 0.5843138, 0, 1, 1,
0.7850542, -1.044351, 2.344863, 0.5882353, 0, 1, 1,
0.7855121, -1.369778, 3.98594, 0.5960785, 0, 1, 1,
0.7910933, 0.5314822, 0.7436269, 0.6039216, 0, 1, 1,
0.7952126, -0.5360608, 2.592348, 0.6078432, 0, 1, 1,
0.7959434, 0.3977111, 1.884181, 0.6156863, 0, 1, 1,
0.7987142, 1.252929, 3.130578, 0.6196079, 0, 1, 1,
0.8007118, 1.756325, 0.04632429, 0.627451, 0, 1, 1,
0.8019614, 0.9369813, 0.7416694, 0.6313726, 0, 1, 1,
0.8054252, 2.731313, 1.441025, 0.6392157, 0, 1, 1,
0.8170908, 0.3666615, 0.1825454, 0.6431373, 0, 1, 1,
0.8182198, 0.3094068, 1.189782, 0.6509804, 0, 1, 1,
0.820343, 0.1686147, 0.5474951, 0.654902, 0, 1, 1,
0.8206384, 0.4867797, -0.04881723, 0.6627451, 0, 1, 1,
0.8219137, 0.2159989, 1.940908, 0.6666667, 0, 1, 1,
0.8294038, -2.296008, 3.934539, 0.6745098, 0, 1, 1,
0.8355464, -1.248787, 3.147514, 0.6784314, 0, 1, 1,
0.8574132, -1.33035, 3.117225, 0.6862745, 0, 1, 1,
0.8599869, -1.242132, 3.777971, 0.6901961, 0, 1, 1,
0.8614909, -1.13408, 2.772972, 0.6980392, 0, 1, 1,
0.8649213, 1.833329, 0.5231691, 0.7058824, 0, 1, 1,
0.8657972, -0.5777341, 2.92543, 0.7098039, 0, 1, 1,
0.8671682, 0.1505386, 2.161271, 0.7176471, 0, 1, 1,
0.8676666, -1.672199, 1.893183, 0.7215686, 0, 1, 1,
0.8679402, 1.504975, 0.2590093, 0.7294118, 0, 1, 1,
0.8685054, -0.2190154, 0.3009679, 0.7333333, 0, 1, 1,
0.8691341, -1.448664, 3.175349, 0.7411765, 0, 1, 1,
0.877957, -0.3624106, 2.759328, 0.7450981, 0, 1, 1,
0.8805917, 2.456031, 0.6415439, 0.7529412, 0, 1, 1,
0.8881756, -1.618147, 3.344544, 0.7568628, 0, 1, 1,
0.8916603, 0.9132978, 2.278409, 0.7647059, 0, 1, 1,
0.8967277, -1.60807, 3.580744, 0.7686275, 0, 1, 1,
0.9102675, -1.626781, 2.399858, 0.7764706, 0, 1, 1,
0.9249988, 1.243968, 0.9341835, 0.7803922, 0, 1, 1,
0.9268851, 0.5836906, -1.715181, 0.7882353, 0, 1, 1,
0.9278727, -0.7265546, 1.051798, 0.7921569, 0, 1, 1,
0.9337533, 0.9440882, 1.093157, 0.8, 0, 1, 1,
0.9377035, -1.363108, 2.900774, 0.8078431, 0, 1, 1,
0.9394605, -0.6408249, 2.478548, 0.8117647, 0, 1, 1,
0.9395996, -1.216882, 2.699174, 0.8196079, 0, 1, 1,
0.9403324, 0.1940034, 0.3351848, 0.8235294, 0, 1, 1,
0.9457154, -0.08156522, -0.3925838, 0.8313726, 0, 1, 1,
0.9460558, -0.3961189, 3.345371, 0.8352941, 0, 1, 1,
0.9494307, -2.562368, 4.716853, 0.8431373, 0, 1, 1,
0.9541934, -2.18064, 1.830528, 0.8470588, 0, 1, 1,
0.9573309, 1.199605, 0.1224069, 0.854902, 0, 1, 1,
0.9589, 2.142189, -0.4259523, 0.8588235, 0, 1, 1,
0.9608417, 1.718942, 2.370821, 0.8666667, 0, 1, 1,
0.9654063, 0.5375068, 2.109272, 0.8705882, 0, 1, 1,
0.9718326, 1.542361, 2.019228, 0.8784314, 0, 1, 1,
0.9739978, 1.596493, 0.9834062, 0.8823529, 0, 1, 1,
0.9741088, 0.147834, 1.416005, 0.8901961, 0, 1, 1,
0.9746386, -0.002763156, 1.439857, 0.8941177, 0, 1, 1,
0.9804109, -1.432773, 3.06315, 0.9019608, 0, 1, 1,
0.9847392, 0.2607885, 1.589023, 0.9098039, 0, 1, 1,
0.9930885, -0.5195754, 1.790073, 0.9137255, 0, 1, 1,
0.9980292, -0.5753221, 2.695208, 0.9215686, 0, 1, 1,
0.9983706, -0.5793121, 1.295534, 0.9254902, 0, 1, 1,
0.9993657, -1.014069, 1.46032, 0.9333333, 0, 1, 1,
1.010351, -0.549434, 1.882658, 0.9372549, 0, 1, 1,
1.01037, 1.691709, 1.437024, 0.945098, 0, 1, 1,
1.022398, -1.329203, 2.440482, 0.9490196, 0, 1, 1,
1.025741, 1.028596, -0.2992827, 0.9568627, 0, 1, 1,
1.035234, -0.1192976, 1.012128, 0.9607843, 0, 1, 1,
1.042946, -1.089159, 4.292274, 0.9686275, 0, 1, 1,
1.048709, 0.5169079, 0.0280193, 0.972549, 0, 1, 1,
1.051459, 1.9437, 1.512634, 0.9803922, 0, 1, 1,
1.05241, 0.4724101, -0.2562464, 0.9843137, 0, 1, 1,
1.055799, 0.7159216, 0.009901534, 0.9921569, 0, 1, 1,
1.060229, 0.45726, 2.437442, 0.9960784, 0, 1, 1,
1.060309, 2.727769, -1.436573, 1, 0, 0.9960784, 1,
1.072775, -0.7533358, 1.451638, 1, 0, 0.9882353, 1,
1.07291, -0.4586811, 2.684556, 1, 0, 0.9843137, 1,
1.073295, 0.9603553, 0.3005152, 1, 0, 0.9764706, 1,
1.073306, 0.3836495, 1.144683, 1, 0, 0.972549, 1,
1.076459, 0.5114822, 1.698013, 1, 0, 0.9647059, 1,
1.088323, 2.276625, -0.3872524, 1, 0, 0.9607843, 1,
1.089113, -0.1431289, 0.08753881, 1, 0, 0.9529412, 1,
1.09225, 0.4013349, 4.0114, 1, 0, 0.9490196, 1,
1.095361, -0.4339015, 1.930882, 1, 0, 0.9411765, 1,
1.095405, 0.7566814, 1.431565, 1, 0, 0.9372549, 1,
1.096715, -0.2854859, 2.343554, 1, 0, 0.9294118, 1,
1.097343, 1.200635, 0.315985, 1, 0, 0.9254902, 1,
1.099522, 0.8692114, 0.1336816, 1, 0, 0.9176471, 1,
1.103585, -0.5545844, 3.239173, 1, 0, 0.9137255, 1,
1.104005, -1.994659, 3.276199, 1, 0, 0.9058824, 1,
1.109363, -0.9153475, 1.962236, 1, 0, 0.9019608, 1,
1.109878, -0.4066057, 2.191888, 1, 0, 0.8941177, 1,
1.111765, 1.436018, 1.269907, 1, 0, 0.8862745, 1,
1.129179, -0.5644894, 2.046734, 1, 0, 0.8823529, 1,
1.130406, 1.073934, 2.346865, 1, 0, 0.8745098, 1,
1.136509, 1.050314, 0.7232489, 1, 0, 0.8705882, 1,
1.143176, -1.295563, 3.07957, 1, 0, 0.8627451, 1,
1.15149, 0.415131, 1.471168, 1, 0, 0.8588235, 1,
1.153904, 0.7754374, -0.2340921, 1, 0, 0.8509804, 1,
1.159032, 0.1273784, 2.583889, 1, 0, 0.8470588, 1,
1.159563, 0.2240893, 0.8694609, 1, 0, 0.8392157, 1,
1.16367, -1.178011, 2.74908, 1, 0, 0.8352941, 1,
1.166003, 0.89428, -0.3735045, 1, 0, 0.827451, 1,
1.167187, -0.07042881, 1.37885, 1, 0, 0.8235294, 1,
1.168486, 1.269854, 0.807619, 1, 0, 0.8156863, 1,
1.178265, 0.9530618, -0.2937729, 1, 0, 0.8117647, 1,
1.183812, 1.014329, -0.7181411, 1, 0, 0.8039216, 1,
1.187458, -1.127024, 3.656936, 1, 0, 0.7960784, 1,
1.198265, -1.139698, 1.251673, 1, 0, 0.7921569, 1,
1.201668, -0.6893458, 0.2582549, 1, 0, 0.7843137, 1,
1.204813, -2.386605, 4.090253, 1, 0, 0.7803922, 1,
1.214498, 0.09085684, -1.003313, 1, 0, 0.772549, 1,
1.231627, -1.084113, 1.657412, 1, 0, 0.7686275, 1,
1.234164, -1.664816, 2.854986, 1, 0, 0.7607843, 1,
1.239002, 0.1359321, 1.951436, 1, 0, 0.7568628, 1,
1.242389, -0.9214848, 2.801846, 1, 0, 0.7490196, 1,
1.245889, -1.485279, 2.93128, 1, 0, 0.7450981, 1,
1.246878, 1.166369, 0.7836787, 1, 0, 0.7372549, 1,
1.25019, 1.533979, 1.847536, 1, 0, 0.7333333, 1,
1.251281, 0.3806753, 0.821955, 1, 0, 0.7254902, 1,
1.252235, -0.5009131, 1.088299, 1, 0, 0.7215686, 1,
1.253993, -2.917735, 2.148437, 1, 0, 0.7137255, 1,
1.25486, -0.0751435, 0.6994302, 1, 0, 0.7098039, 1,
1.256907, 1.03568, 0.8031533, 1, 0, 0.7019608, 1,
1.258356, -0.8305377, 1.817845, 1, 0, 0.6941177, 1,
1.259764, -1.182588, 3.114132, 1, 0, 0.6901961, 1,
1.259945, 0.4464184, 0.8156032, 1, 0, 0.682353, 1,
1.263922, -1.916238, 1.888917, 1, 0, 0.6784314, 1,
1.271136, -0.6157677, 2.325334, 1, 0, 0.6705883, 1,
1.28672, 1.791972, 0.6643128, 1, 0, 0.6666667, 1,
1.28739, -0.330029, -0.4999297, 1, 0, 0.6588235, 1,
1.288625, -0.7853901, 1.678399, 1, 0, 0.654902, 1,
1.296423, 0.5193558, 1.445531, 1, 0, 0.6470588, 1,
1.296773, -1.919097, 0.05132809, 1, 0, 0.6431373, 1,
1.297086, -0.9336516, 3.63287, 1, 0, 0.6352941, 1,
1.307652, 1.303213, 0.8341877, 1, 0, 0.6313726, 1,
1.315467, -0.5645765, 2.621446, 1, 0, 0.6235294, 1,
1.321261, 1.785541, 0.8190033, 1, 0, 0.6196079, 1,
1.328727, 1.176742, -1.48902, 1, 0, 0.6117647, 1,
1.339285, -0.4224361, 1.119107, 1, 0, 0.6078432, 1,
1.346133, 1.106599, 0.3642512, 1, 0, 0.6, 1,
1.349401, -0.188561, 1.855554, 1, 0, 0.5921569, 1,
1.352252, -0.343352, 2.895342, 1, 0, 0.5882353, 1,
1.358675, 0.650286, 1.08315, 1, 0, 0.5803922, 1,
1.36809, 1.066291, 0.6652886, 1, 0, 0.5764706, 1,
1.368171, 0.6789849, 0.04026155, 1, 0, 0.5686275, 1,
1.369665, 1.0528, 1.180825, 1, 0, 0.5647059, 1,
1.387501, -0.04637435, 1.465999, 1, 0, 0.5568628, 1,
1.388022, -0.5594095, 2.301741, 1, 0, 0.5529412, 1,
1.390076, -1.037908, 2.837276, 1, 0, 0.5450981, 1,
1.394383, 0.827393, 2.914437, 1, 0, 0.5411765, 1,
1.396057, 0.4995048, 2.36051, 1, 0, 0.5333334, 1,
1.396404, 0.1743035, 3.369985, 1, 0, 0.5294118, 1,
1.406632, 0.9593784, 1.398739, 1, 0, 0.5215687, 1,
1.407125, 0.03066595, 3.238738, 1, 0, 0.5176471, 1,
1.407941, 0.4468882, -0.5446208, 1, 0, 0.509804, 1,
1.408584, 0.2653982, 1.858462, 1, 0, 0.5058824, 1,
1.41531, -1.333816, 0.6285692, 1, 0, 0.4980392, 1,
1.419253, -1.098205, 1.639019, 1, 0, 0.4901961, 1,
1.424208, -0.7466815, 3.167165, 1, 0, 0.4862745, 1,
1.431239, -0.8651093, 1.523211, 1, 0, 0.4784314, 1,
1.453096, 0.2190292, 1.382656, 1, 0, 0.4745098, 1,
1.465573, 0.009604747, 3.087717, 1, 0, 0.4666667, 1,
1.480288, 0.06237058, 2.668992, 1, 0, 0.4627451, 1,
1.483651, 0.2206968, 2.541162, 1, 0, 0.454902, 1,
1.485445, 0.88355, -0.2504209, 1, 0, 0.4509804, 1,
1.495974, -0.5932478, 2.009195, 1, 0, 0.4431373, 1,
1.499419, 0.7086318, 0.003062622, 1, 0, 0.4392157, 1,
1.516752, 0.9415252, 0.1021497, 1, 0, 0.4313726, 1,
1.52213, 0.890854, -0.3487573, 1, 0, 0.427451, 1,
1.536005, 0.6043893, -0.155498, 1, 0, 0.4196078, 1,
1.536167, -0.4045545, 2.528298, 1, 0, 0.4156863, 1,
1.538008, 1.424268, 1.979971, 1, 0, 0.4078431, 1,
1.54104, -0.2140187, 2.281633, 1, 0, 0.4039216, 1,
1.548808, -0.6927896, 1.049513, 1, 0, 0.3960784, 1,
1.549263, -1.127554, 3.212371, 1, 0, 0.3882353, 1,
1.556059, 2.147534, -0.2889088, 1, 0, 0.3843137, 1,
1.575898, 1.084319, 1.281248, 1, 0, 0.3764706, 1,
1.589878, -0.9533373, 2.645367, 1, 0, 0.372549, 1,
1.607404, -0.2363251, -0.8836496, 1, 0, 0.3647059, 1,
1.612022, 0.5221945, 2.143523, 1, 0, 0.3607843, 1,
1.613166, -1.194728, 3.705858, 1, 0, 0.3529412, 1,
1.622767, 2.292306, 1.353988, 1, 0, 0.3490196, 1,
1.629769, 1.359548, 0.08129734, 1, 0, 0.3411765, 1,
1.630282, 1.849639, 0.2585394, 1, 0, 0.3372549, 1,
1.64303, 0.01425067, 3.040496, 1, 0, 0.3294118, 1,
1.643628, -2.540214, 3.629904, 1, 0, 0.3254902, 1,
1.648812, -1.107462, 1.556046, 1, 0, 0.3176471, 1,
1.649446, 0.8090972, 0.6913701, 1, 0, 0.3137255, 1,
1.653472, 0.02961723, 3.091025, 1, 0, 0.3058824, 1,
1.653476, 0.7335067, 1.097197, 1, 0, 0.2980392, 1,
1.654014, -0.04176157, -0.6503403, 1, 0, 0.2941177, 1,
1.65875, -2.340319, 3.004263, 1, 0, 0.2862745, 1,
1.664158, 0.3459312, 1.768546, 1, 0, 0.282353, 1,
1.671312, 0.2774757, 1.710237, 1, 0, 0.2745098, 1,
1.673189, -1.871338, 2.979661, 1, 0, 0.2705882, 1,
1.676978, 0.01002713, 2.883293, 1, 0, 0.2627451, 1,
1.682026, -0.3732356, 2.663778, 1, 0, 0.2588235, 1,
1.694102, -1.439114, 0.6231341, 1, 0, 0.2509804, 1,
1.697825, 0.9410876, 2.299217, 1, 0, 0.2470588, 1,
1.703502, -0.001607549, -0.6150647, 1, 0, 0.2392157, 1,
1.720985, -2.131215, 1.178066, 1, 0, 0.2352941, 1,
1.730257, 0.4123541, 0.4021632, 1, 0, 0.227451, 1,
1.731078, 0.08981925, 1.727785, 1, 0, 0.2235294, 1,
1.740167, -0.9812704, 2.228341, 1, 0, 0.2156863, 1,
1.756166, -1.495088, 3.183158, 1, 0, 0.2117647, 1,
1.773241, 0.667359, 1.640124, 1, 0, 0.2039216, 1,
1.77621, 1.348802, 0.1743217, 1, 0, 0.1960784, 1,
1.780737, -1.561422, 1.968631, 1, 0, 0.1921569, 1,
1.784155, -0.01047477, 0.9843033, 1, 0, 0.1843137, 1,
1.834564, 0.6291413, 2.690406, 1, 0, 0.1803922, 1,
1.840245, -0.4068383, 0.9703541, 1, 0, 0.172549, 1,
1.865532, 0.05736109, 2.249227, 1, 0, 0.1686275, 1,
1.871937, -1.49047, 1.683941, 1, 0, 0.1607843, 1,
1.888836, 1.644745, 1.085316, 1, 0, 0.1568628, 1,
1.910648, -1.281105, 3.082348, 1, 0, 0.1490196, 1,
1.917718, 0.7621117, 0.1965125, 1, 0, 0.145098, 1,
1.919358, 0.6061731, 2.010216, 1, 0, 0.1372549, 1,
1.922378, -0.6773708, 1.673242, 1, 0, 0.1333333, 1,
1.930162, -1.289342, 0.8154612, 1, 0, 0.1254902, 1,
1.936302, -1.007319, 1.276875, 1, 0, 0.1215686, 1,
1.958325, -0.881054, 3.742703, 1, 0, 0.1137255, 1,
1.963786, 0.6794542, -0.2357715, 1, 0, 0.1098039, 1,
1.971625, -1.860046, 1.746743, 1, 0, 0.1019608, 1,
1.98008, -0.67923, 1.912775, 1, 0, 0.09411765, 1,
1.995232, -1.705459, 3.599203, 1, 0, 0.09019608, 1,
2.022729, 2.133083, -0.4125523, 1, 0, 0.08235294, 1,
2.084276, 0.4267259, 1.198128, 1, 0, 0.07843138, 1,
2.156721, 1.567663, 1.414515, 1, 0, 0.07058824, 1,
2.172041, -0.5630247, 0.7076222, 1, 0, 0.06666667, 1,
2.201753, -1.024773, 3.153549, 1, 0, 0.05882353, 1,
2.270733, -0.7862444, 1.069156, 1, 0, 0.05490196, 1,
2.295132, -0.7766025, 1.152032, 1, 0, 0.04705882, 1,
2.309847, -0.9177422, 2.184463, 1, 0, 0.04313726, 1,
2.458886, -0.621287, 0.8021817, 1, 0, 0.03529412, 1,
2.477422, 0.5276654, 1.939412, 1, 0, 0.03137255, 1,
2.601395, 0.6080548, 2.679324, 1, 0, 0.02352941, 1,
3.238683, -0.144459, 0.267598, 1, 0, 0.01960784, 1,
3.263983, 0.3974278, 0.5526273, 1, 0, 0.01176471, 1,
3.390365, 0.2325957, 2.034011, 1, 0, 0.007843138, 1
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
0.2877109, -4.484438, -6.801523, 0, -0.5, 0.5, 0.5,
0.2877109, -4.484438, -6.801523, 1, -0.5, 0.5, 0.5,
0.2877109, -4.484438, -6.801523, 1, 1.5, 0.5, 0.5,
0.2877109, -4.484438, -6.801523, 0, 1.5, 0.5, 0.5
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
-3.866743, -0.02190208, -6.801523, 0, -0.5, 0.5, 0.5,
-3.866743, -0.02190208, -6.801523, 1, -0.5, 0.5, 0.5,
-3.866743, -0.02190208, -6.801523, 1, 1.5, 0.5, 0.5,
-3.866743, -0.02190208, -6.801523, 0, 1.5, 0.5, 0.5
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
-3.866743, -4.484438, -0.05322862, 0, -0.5, 0.5, 0.5,
-3.866743, -4.484438, -0.05322862, 1, -0.5, 0.5, 0.5,
-3.866743, -4.484438, -0.05322862, 1, 1.5, 0.5, 0.5,
-3.866743, -4.484438, -0.05322862, 0, 1.5, 0.5, 0.5
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
-2, -3.454623, -5.244225,
3, -3.454623, -5.244225,
-2, -3.454623, -5.244225,
-2, -3.626258, -5.503774,
-1, -3.454623, -5.244225,
-1, -3.626258, -5.503774,
0, -3.454623, -5.244225,
0, -3.626258, -5.503774,
1, -3.454623, -5.244225,
1, -3.626258, -5.503774,
2, -3.454623, -5.244225,
2, -3.626258, -5.503774,
3, -3.454623, -5.244225,
3, -3.626258, -5.503774
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
-2, -3.96953, -6.022874, 0, -0.5, 0.5, 0.5,
-2, -3.96953, -6.022874, 1, -0.5, 0.5, 0.5,
-2, -3.96953, -6.022874, 1, 1.5, 0.5, 0.5,
-2, -3.96953, -6.022874, 0, 1.5, 0.5, 0.5,
-1, -3.96953, -6.022874, 0, -0.5, 0.5, 0.5,
-1, -3.96953, -6.022874, 1, -0.5, 0.5, 0.5,
-1, -3.96953, -6.022874, 1, 1.5, 0.5, 0.5,
-1, -3.96953, -6.022874, 0, 1.5, 0.5, 0.5,
0, -3.96953, -6.022874, 0, -0.5, 0.5, 0.5,
0, -3.96953, -6.022874, 1, -0.5, 0.5, 0.5,
0, -3.96953, -6.022874, 1, 1.5, 0.5, 0.5,
0, -3.96953, -6.022874, 0, 1.5, 0.5, 0.5,
1, -3.96953, -6.022874, 0, -0.5, 0.5, 0.5,
1, -3.96953, -6.022874, 1, -0.5, 0.5, 0.5,
1, -3.96953, -6.022874, 1, 1.5, 0.5, 0.5,
1, -3.96953, -6.022874, 0, 1.5, 0.5, 0.5,
2, -3.96953, -6.022874, 0, -0.5, 0.5, 0.5,
2, -3.96953, -6.022874, 1, -0.5, 0.5, 0.5,
2, -3.96953, -6.022874, 1, 1.5, 0.5, 0.5,
2, -3.96953, -6.022874, 0, 1.5, 0.5, 0.5,
3, -3.96953, -6.022874, 0, -0.5, 0.5, 0.5,
3, -3.96953, -6.022874, 1, -0.5, 0.5, 0.5,
3, -3.96953, -6.022874, 1, 1.5, 0.5, 0.5,
3, -3.96953, -6.022874, 0, 1.5, 0.5, 0.5
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
-2.908023, -3, -5.244225,
-2.908023, 3, -5.244225,
-2.908023, -3, -5.244225,
-3.06781, -3, -5.503774,
-2.908023, -2, -5.244225,
-3.06781, -2, -5.503774,
-2.908023, -1, -5.244225,
-3.06781, -1, -5.503774,
-2.908023, 0, -5.244225,
-3.06781, 0, -5.503774,
-2.908023, 1, -5.244225,
-3.06781, 1, -5.503774,
-2.908023, 2, -5.244225,
-3.06781, 2, -5.503774,
-2.908023, 3, -5.244225,
-3.06781, 3, -5.503774
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
-3.387383, -3, -6.022874, 0, -0.5, 0.5, 0.5,
-3.387383, -3, -6.022874, 1, -0.5, 0.5, 0.5,
-3.387383, -3, -6.022874, 1, 1.5, 0.5, 0.5,
-3.387383, -3, -6.022874, 0, 1.5, 0.5, 0.5,
-3.387383, -2, -6.022874, 0, -0.5, 0.5, 0.5,
-3.387383, -2, -6.022874, 1, -0.5, 0.5, 0.5,
-3.387383, -2, -6.022874, 1, 1.5, 0.5, 0.5,
-3.387383, -2, -6.022874, 0, 1.5, 0.5, 0.5,
-3.387383, -1, -6.022874, 0, -0.5, 0.5, 0.5,
-3.387383, -1, -6.022874, 1, -0.5, 0.5, 0.5,
-3.387383, -1, -6.022874, 1, 1.5, 0.5, 0.5,
-3.387383, -1, -6.022874, 0, 1.5, 0.5, 0.5,
-3.387383, 0, -6.022874, 0, -0.5, 0.5, 0.5,
-3.387383, 0, -6.022874, 1, -0.5, 0.5, 0.5,
-3.387383, 0, -6.022874, 1, 1.5, 0.5, 0.5,
-3.387383, 0, -6.022874, 0, 1.5, 0.5, 0.5,
-3.387383, 1, -6.022874, 0, -0.5, 0.5, 0.5,
-3.387383, 1, -6.022874, 1, -0.5, 0.5, 0.5,
-3.387383, 1, -6.022874, 1, 1.5, 0.5, 0.5,
-3.387383, 1, -6.022874, 0, 1.5, 0.5, 0.5,
-3.387383, 2, -6.022874, 0, -0.5, 0.5, 0.5,
-3.387383, 2, -6.022874, 1, -0.5, 0.5, 0.5,
-3.387383, 2, -6.022874, 1, 1.5, 0.5, 0.5,
-3.387383, 2, -6.022874, 0, 1.5, 0.5, 0.5,
-3.387383, 3, -6.022874, 0, -0.5, 0.5, 0.5,
-3.387383, 3, -6.022874, 1, -0.5, 0.5, 0.5,
-3.387383, 3, -6.022874, 1, 1.5, 0.5, 0.5,
-3.387383, 3, -6.022874, 0, 1.5, 0.5, 0.5
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
-2.908023, -3.454623, -4,
-2.908023, -3.454623, 4,
-2.908023, -3.454623, -4,
-3.06781, -3.626258, -4,
-2.908023, -3.454623, -2,
-3.06781, -3.626258, -2,
-2.908023, -3.454623, 0,
-3.06781, -3.626258, 0,
-2.908023, -3.454623, 2,
-3.06781, -3.626258, 2,
-2.908023, -3.454623, 4,
-3.06781, -3.626258, 4
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
-3.387383, -3.96953, -4, 0, -0.5, 0.5, 0.5,
-3.387383, -3.96953, -4, 1, -0.5, 0.5, 0.5,
-3.387383, -3.96953, -4, 1, 1.5, 0.5, 0.5,
-3.387383, -3.96953, -4, 0, 1.5, 0.5, 0.5,
-3.387383, -3.96953, -2, 0, -0.5, 0.5, 0.5,
-3.387383, -3.96953, -2, 1, -0.5, 0.5, 0.5,
-3.387383, -3.96953, -2, 1, 1.5, 0.5, 0.5,
-3.387383, -3.96953, -2, 0, 1.5, 0.5, 0.5,
-3.387383, -3.96953, 0, 0, -0.5, 0.5, 0.5,
-3.387383, -3.96953, 0, 1, -0.5, 0.5, 0.5,
-3.387383, -3.96953, 0, 1, 1.5, 0.5, 0.5,
-3.387383, -3.96953, 0, 0, 1.5, 0.5, 0.5,
-3.387383, -3.96953, 2, 0, -0.5, 0.5, 0.5,
-3.387383, -3.96953, 2, 1, -0.5, 0.5, 0.5,
-3.387383, -3.96953, 2, 1, 1.5, 0.5, 0.5,
-3.387383, -3.96953, 2, 0, 1.5, 0.5, 0.5,
-3.387383, -3.96953, 4, 0, -0.5, 0.5, 0.5,
-3.387383, -3.96953, 4, 1, -0.5, 0.5, 0.5,
-3.387383, -3.96953, 4, 1, 1.5, 0.5, 0.5,
-3.387383, -3.96953, 4, 0, 1.5, 0.5, 0.5
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
-2.908023, -3.454623, -5.244225,
-2.908023, 3.410818, -5.244225,
-2.908023, -3.454623, 5.137767,
-2.908023, 3.410818, 5.137767,
-2.908023, -3.454623, -5.244225,
-2.908023, -3.454623, 5.137767,
-2.908023, 3.410818, -5.244225,
-2.908023, 3.410818, 5.137767,
-2.908023, -3.454623, -5.244225,
3.483445, -3.454623, -5.244225,
-2.908023, -3.454623, 5.137767,
3.483445, -3.454623, 5.137767,
-2.908023, 3.410818, -5.244225,
3.483445, 3.410818, -5.244225,
-2.908023, 3.410818, 5.137767,
3.483445, 3.410818, 5.137767,
3.483445, -3.454623, -5.244225,
3.483445, 3.410818, -5.244225,
3.483445, -3.454623, 5.137767,
3.483445, 3.410818, 5.137767,
3.483445, -3.454623, -5.244225,
3.483445, -3.454623, 5.137767,
3.483445, 3.410818, -5.244225,
3.483445, 3.410818, 5.137767
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
var radius = 7.471358;
var distance = 33.24092;
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
mvMatrix.translate( -0.2877109, 0.02190208, 0.05322862 );
mvMatrix.scale( 1.2639, 1.176644, 0.7780952 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.24092);
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
pirimiphos_ethyl<-read.table("pirimiphos_ethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pirimiphos_ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
```

```r
y<-pirimiphos_ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
```

```r
z<-pirimiphos_ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
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
-2.814944, -1.340602, -4.010073, 0, 0, 1, 1, 1,
-2.741302, 0.283103, -0.8826252, 1, 0, 0, 1, 1,
-2.683363, -2.004403, -2.010062, 1, 0, 0, 1, 1,
-2.628273, -0.06426674, 0.3021352, 1, 0, 0, 1, 1,
-2.603215, -0.4201087, -1.557412, 1, 0, 0, 1, 1,
-2.601462, 1.368243, -0.8637382, 1, 0, 0, 1, 1,
-2.520594, 0.4010176, -2.075357, 0, 0, 0, 1, 1,
-2.451412, 0.1893688, -2.25158, 0, 0, 0, 1, 1,
-2.351324, 0.139221, -0.57188, 0, 0, 0, 1, 1,
-2.341649, -0.9197562, -0.9333451, 0, 0, 0, 1, 1,
-2.337273, 0.3160254, -1.132961, 0, 0, 0, 1, 1,
-2.268257, 0.1536007, -2.015944, 0, 0, 0, 1, 1,
-2.248136, 1.315403, -0.839919, 0, 0, 0, 1, 1,
-2.231146, -0.8493027, -3.210879, 1, 1, 1, 1, 1,
-2.19886, 0.3406219, -1.075273, 1, 1, 1, 1, 1,
-2.193443, -1.074469, -3.695109, 1, 1, 1, 1, 1,
-2.193038, -0.03701807, -2.498614, 1, 1, 1, 1, 1,
-2.123397, -0.5920411, -1.289869, 1, 1, 1, 1, 1,
-2.106105, 2.089115, -2.259016, 1, 1, 1, 1, 1,
-2.054868, 0.5880891, -2.353651, 1, 1, 1, 1, 1,
-2.05188, 1.246662, 0.2992233, 1, 1, 1, 1, 1,
-2.047281, 1.183365, -1.718443, 1, 1, 1, 1, 1,
-2.045482, 0.4838083, -3.198447, 1, 1, 1, 1, 1,
-2.022016, 0.8209713, -0.580945, 1, 1, 1, 1, 1,
-2.011583, -2.037049, -0.835423, 1, 1, 1, 1, 1,
-1.972969, -0.889702, -0.9133503, 1, 1, 1, 1, 1,
-1.930327, 0.04765939, -0.2778394, 1, 1, 1, 1, 1,
-1.92735, -0.2547675, -1.866317, 1, 1, 1, 1, 1,
-1.925161, -0.372214, -1.578235, 0, 0, 1, 1, 1,
-1.914221, 0.03022578, -1.858031, 1, 0, 0, 1, 1,
-1.909147, 0.6531785, -1.221575, 1, 0, 0, 1, 1,
-1.896491, -1.482758, -0.5723127, 1, 0, 0, 1, 1,
-1.874041, 1.316351, 0.4097508, 1, 0, 0, 1, 1,
-1.844275, 1.174256, -1.81259, 1, 0, 0, 1, 1,
-1.81567, -1.18809, -3.330648, 0, 0, 0, 1, 1,
-1.813148, -0.159008, -2.990643, 0, 0, 0, 1, 1,
-1.812677, -0.04227699, -0.1172721, 0, 0, 0, 1, 1,
-1.807263, 0.2902535, -3.087442, 0, 0, 0, 1, 1,
-1.775888, -0.9705339, -1.903634, 0, 0, 0, 1, 1,
-1.769892, 0.2101624, -1.206205, 0, 0, 0, 1, 1,
-1.768143, -0.7511497, -1.236116, 0, 0, 0, 1, 1,
-1.766095, 2.180959, -2.0466, 1, 1, 1, 1, 1,
-1.730764, -0.4686352, -2.929255, 1, 1, 1, 1, 1,
-1.725976, 1.403648, -0.9470056, 1, 1, 1, 1, 1,
-1.677508, -0.2079863, -0.8042364, 1, 1, 1, 1, 1,
-1.675943, 0.2354888, -1.620677, 1, 1, 1, 1, 1,
-1.673752, 1.100325, -1.024043, 1, 1, 1, 1, 1,
-1.672477, 0.5855466, -1.275895, 1, 1, 1, 1, 1,
-1.670813, 1.182054, -1.617061, 1, 1, 1, 1, 1,
-1.66943, 0.4015855, -2.815017, 1, 1, 1, 1, 1,
-1.662878, -0.5556648, -3.061035, 1, 1, 1, 1, 1,
-1.655704, -0.9919585, -3.643667, 1, 1, 1, 1, 1,
-1.650918, -0.4257243, -3.053422, 1, 1, 1, 1, 1,
-1.621867, 1.270931, -0.8227186, 1, 1, 1, 1, 1,
-1.610318, 1.063028, -1.075823, 1, 1, 1, 1, 1,
-1.592472, -0.680869, -2.086957, 1, 1, 1, 1, 1,
-1.586304, 0.06907407, -1.09817, 0, 0, 1, 1, 1,
-1.577659, -1.010116, -2.628196, 1, 0, 0, 1, 1,
-1.575397, 1.616721, -0.1786029, 1, 0, 0, 1, 1,
-1.557702, 2.584176, -1.601586, 1, 0, 0, 1, 1,
-1.553271, 2.750127, -0.7789165, 1, 0, 0, 1, 1,
-1.543391, 0.6158816, -1.390609, 1, 0, 0, 1, 1,
-1.539559, -0.9855814, -2.925351, 0, 0, 0, 1, 1,
-1.534628, -0.1050348, -2.793036, 0, 0, 0, 1, 1,
-1.528497, 0.680172, -0.9008686, 0, 0, 0, 1, 1,
-1.522296, -1.038024, -3.054918, 0, 0, 0, 1, 1,
-1.513057, -0.7949188, -2.145913, 0, 0, 0, 1, 1,
-1.508255, -0.6645714, -2.201013, 0, 0, 0, 1, 1,
-1.507159, 1.757559, -1.155632, 0, 0, 0, 1, 1,
-1.502816, 0.6041905, 0.3269022, 1, 1, 1, 1, 1,
-1.462516, 1.066609, -1.060252, 1, 1, 1, 1, 1,
-1.460785, 0.5884197, -1.422053, 1, 1, 1, 1, 1,
-1.460287, 0.02230553, -0.9479269, 1, 1, 1, 1, 1,
-1.454146, -0.6683842, -2.330613, 1, 1, 1, 1, 1,
-1.453657, -1.844078, -1.4638, 1, 1, 1, 1, 1,
-1.451193, 0.3529081, -2.089615, 1, 1, 1, 1, 1,
-1.451138, 0.3628519, 0.942953, 1, 1, 1, 1, 1,
-1.422208, -0.07666446, -1.969826, 1, 1, 1, 1, 1,
-1.406843, -0.4193273, -1.96211, 1, 1, 1, 1, 1,
-1.405214, -1.652063, -2.373107, 1, 1, 1, 1, 1,
-1.397978, 0.2984422, -1.20443, 1, 1, 1, 1, 1,
-1.389566, -0.02171522, -1.481705, 1, 1, 1, 1, 1,
-1.375094, -1.515189, -1.930577, 1, 1, 1, 1, 1,
-1.36261, 0.1639253, -3.143312, 1, 1, 1, 1, 1,
-1.360876, -0.232108, -0.5225756, 0, 0, 1, 1, 1,
-1.350149, -1.009601, -1.867013, 1, 0, 0, 1, 1,
-1.348938, -1.578424, -2.603128, 1, 0, 0, 1, 1,
-1.342675, 1.472171, -0.9561717, 1, 0, 0, 1, 1,
-1.342009, 1.494183, 0.8415368, 1, 0, 0, 1, 1,
-1.331255, 0.2365769, -0.2731646, 1, 0, 0, 1, 1,
-1.33002, 0.9352497, -1.056365, 0, 0, 0, 1, 1,
-1.325211, -0.4649383, -2.307892, 0, 0, 0, 1, 1,
-1.323901, -1.365158, -0.8960018, 0, 0, 0, 1, 1,
-1.322542, 0.9958603, 0.4150482, 0, 0, 0, 1, 1,
-1.309477, 0.1559047, -0.8690752, 0, 0, 0, 1, 1,
-1.306159, 0.4146879, -1.569646, 0, 0, 0, 1, 1,
-1.300881, -0.02283308, -1.898618, 0, 0, 0, 1, 1,
-1.29928, -0.6509367, -0.5016564, 1, 1, 1, 1, 1,
-1.292506, 1.979568, -0.7385399, 1, 1, 1, 1, 1,
-1.291534, -1.839054, -3.722438, 1, 1, 1, 1, 1,
-1.285877, 0.2631141, -2.676555, 1, 1, 1, 1, 1,
-1.281642, -0.8605624, -3.057299, 1, 1, 1, 1, 1,
-1.277707, 0.1046803, -1.681589, 1, 1, 1, 1, 1,
-1.277438, -0.4913872, -0.773351, 1, 1, 1, 1, 1,
-1.271134, 0.09496173, -1.558006, 1, 1, 1, 1, 1,
-1.262966, -1.323662, -2.756199, 1, 1, 1, 1, 1,
-1.25922, 0.3110023, -1.695465, 1, 1, 1, 1, 1,
-1.254149, -1.490591, -0.5524777, 1, 1, 1, 1, 1,
-1.253986, -0.04293396, -2.475796, 1, 1, 1, 1, 1,
-1.244945, -0.8263364, -1.754212, 1, 1, 1, 1, 1,
-1.237728, -0.1213822, -1.775994, 1, 1, 1, 1, 1,
-1.233315, -0.2128478, -1.086902, 1, 1, 1, 1, 1,
-1.228835, 0.524752, 0.7888983, 0, 0, 1, 1, 1,
-1.220023, -0.003835571, -1.812609, 1, 0, 0, 1, 1,
-1.2121, -0.6854507, -2.148329, 1, 0, 0, 1, 1,
-1.2083, 0.450049, -2.776443, 1, 0, 0, 1, 1,
-1.207423, -1.134912, -2.397974, 1, 0, 0, 1, 1,
-1.193064, 1.272356, -0.6962882, 1, 0, 0, 1, 1,
-1.191946, -0.3627784, -0.5875866, 0, 0, 0, 1, 1,
-1.190819, 0.4225115, 0.3678008, 0, 0, 0, 1, 1,
-1.188816, 0.1253325, -2.679901, 0, 0, 0, 1, 1,
-1.184404, 1.170778, -0.5215324, 0, 0, 0, 1, 1,
-1.182712, -0.7358291, -3.132386, 0, 0, 0, 1, 1,
-1.179871, 1.606821, -0.5317662, 0, 0, 0, 1, 1,
-1.173825, -0.3505271, -1.001656, 0, 0, 0, 1, 1,
-1.169837, 1.123001, -1.837481, 1, 1, 1, 1, 1,
-1.164427, -0.3442846, -3.070513, 1, 1, 1, 1, 1,
-1.159773, 0.3770011, 1.340769, 1, 1, 1, 1, 1,
-1.153967, 1.430683, -0.4420686, 1, 1, 1, 1, 1,
-1.15174, -0.6754978, -2.310987, 1, 1, 1, 1, 1,
-1.146427, 0.2499518, -0.9726254, 1, 1, 1, 1, 1,
-1.144157, 0.1180298, -3.567777, 1, 1, 1, 1, 1,
-1.143376, 1.171081, -0.7949413, 1, 1, 1, 1, 1,
-1.138909, 0.2853345, -1.485338, 1, 1, 1, 1, 1,
-1.137261, 0.6202312, -1.403297, 1, 1, 1, 1, 1,
-1.131539, -0.1585919, 0.1272532, 1, 1, 1, 1, 1,
-1.129138, -1.464885, 0.9164076, 1, 1, 1, 1, 1,
-1.11657, -0.1299622, -1.016111, 1, 1, 1, 1, 1,
-1.112214, 0.0142155, -0.9947898, 1, 1, 1, 1, 1,
-1.108099, -1.119769, -2.000868, 1, 1, 1, 1, 1,
-1.103127, -0.5278555, -3.48034, 0, 0, 1, 1, 1,
-1.098501, 0.7045676, -1.959329, 1, 0, 0, 1, 1,
-1.092911, -0.7344769, -1.698363, 1, 0, 0, 1, 1,
-1.091669, -0.8641398, -2.544574, 1, 0, 0, 1, 1,
-1.088202, 0.3072971, -1.139075, 1, 0, 0, 1, 1,
-1.074722, 1.754178, -0.338725, 1, 0, 0, 1, 1,
-1.072327, -2.648733, -3.905438, 0, 0, 0, 1, 1,
-1.059718, -0.2078237, -1.912643, 0, 0, 0, 1, 1,
-1.058782, 1.518092, 0.8911633, 0, 0, 0, 1, 1,
-1.049307, -2.733342, -3.346987, 0, 0, 0, 1, 1,
-1.047728, -0.2075184, -1.465157, 0, 0, 0, 1, 1,
-1.044618, 0.008643733, -1.901813, 0, 0, 0, 1, 1,
-1.043275, -2.012253, -2.650636, 0, 0, 0, 1, 1,
-1.041051, -0.143509, -2.640482, 1, 1, 1, 1, 1,
-1.03925, -0.9518909, -2.695154, 1, 1, 1, 1, 1,
-1.028625, -0.1490915, -2.57555, 1, 1, 1, 1, 1,
-1.027451, 1.076768, -2.29177, 1, 1, 1, 1, 1,
-1.012998, 0.71803, -1.182154, 1, 1, 1, 1, 1,
-1.010853, 0.0432547, -0.4753655, 1, 1, 1, 1, 1,
-0.9989622, 0.5959263, -0.8298654, 1, 1, 1, 1, 1,
-0.9976043, 1.311533, -1.794265, 1, 1, 1, 1, 1,
-0.9880844, -0.4618503, -1.860967, 1, 1, 1, 1, 1,
-0.9875613, 1.653573, 0.07340787, 1, 1, 1, 1, 1,
-0.9853053, -0.3313317, -2.092971, 1, 1, 1, 1, 1,
-0.9818753, 1.124804, -1.300945, 1, 1, 1, 1, 1,
-0.9803655, 0.193423, -0.9426526, 1, 1, 1, 1, 1,
-0.9775555, 0.6395749, -1.462963, 1, 1, 1, 1, 1,
-0.9361479, 0.2007199, -1.419688, 1, 1, 1, 1, 1,
-0.9342433, -0.2372645, -0.240568, 0, 0, 1, 1, 1,
-0.92844, 0.04983487, -1.391877, 1, 0, 0, 1, 1,
-0.9270952, -1.04896, -3.357445, 1, 0, 0, 1, 1,
-0.9259237, 0.05834085, -3.718532, 1, 0, 0, 1, 1,
-0.923115, -0.1431477, -1.093453, 1, 0, 0, 1, 1,
-0.912809, 0.3278136, -0.2762353, 1, 0, 0, 1, 1,
-0.9072375, 1.642408, 0.6059859, 0, 0, 0, 1, 1,
-0.9057468, 0.531277, -0.8205133, 0, 0, 0, 1, 1,
-0.9052557, 0.9892155, -0.873818, 0, 0, 0, 1, 1,
-0.9000964, 0.09760471, -2.189085, 0, 0, 0, 1, 1,
-0.8991859, -0.6927862, -2.553631, 0, 0, 0, 1, 1,
-0.8985723, 0.3912155, -0.6456171, 0, 0, 0, 1, 1,
-0.8912703, 0.1811398, -0.6308867, 0, 0, 0, 1, 1,
-0.8907676, -1.710294, -1.918931, 1, 1, 1, 1, 1,
-0.8885795, -0.2173836, -2.880243, 1, 1, 1, 1, 1,
-0.8850322, -0.1445812, -0.8327006, 1, 1, 1, 1, 1,
-0.8689404, 0.2550367, -0.8228009, 1, 1, 1, 1, 1,
-0.8685043, -1.813461, -2.133567, 1, 1, 1, 1, 1,
-0.8603545, -0.967602, -2.208432, 1, 1, 1, 1, 1,
-0.8579919, -0.02916952, -0.8750697, 1, 1, 1, 1, 1,
-0.8543973, -1.748237, -1.326701, 1, 1, 1, 1, 1,
-0.8479488, 1.136616, -1.10947, 1, 1, 1, 1, 1,
-0.845742, -0.4090512, -0.976508, 1, 1, 1, 1, 1,
-0.8428054, 0.3879566, -0.4252894, 1, 1, 1, 1, 1,
-0.8399702, 0.1588513, -0.9267751, 1, 1, 1, 1, 1,
-0.8398423, 0.7079206, -1.622045, 1, 1, 1, 1, 1,
-0.8364854, -0.02487452, -2.644679, 1, 1, 1, 1, 1,
-0.8314739, -1.038276, -3.439369, 1, 1, 1, 1, 1,
-0.8309174, 0.5237105, -3.319919, 0, 0, 1, 1, 1,
-0.8285705, -0.1083982, -1.005341, 1, 0, 0, 1, 1,
-0.824183, -1.821887, -2.970172, 1, 0, 0, 1, 1,
-0.8224671, 0.3714409, 0.619014, 1, 0, 0, 1, 1,
-0.815835, 0.1316142, 0.5746972, 1, 0, 0, 1, 1,
-0.811042, -0.01127108, -2.822234, 1, 0, 0, 1, 1,
-0.8104739, 0.3901557, -1.919013, 0, 0, 0, 1, 1,
-0.8102555, 0.2885998, -0.1772528, 0, 0, 0, 1, 1,
-0.8087896, 2.062406, 2.438262, 0, 0, 0, 1, 1,
-0.8048043, 0.7629304, -1.061083, 0, 0, 0, 1, 1,
-0.7957327, -1.097423, -1.894663, 0, 0, 0, 1, 1,
-0.7881069, 0.5051804, -1.10179, 0, 0, 0, 1, 1,
-0.7877948, -0.1324216, -1.214286, 0, 0, 0, 1, 1,
-0.7815826, 0.007131425, -1.460422, 1, 1, 1, 1, 1,
-0.7808437, -1.460338, -0.3777564, 1, 1, 1, 1, 1,
-0.778811, 1.324762, -0.4902289, 1, 1, 1, 1, 1,
-0.778315, 0.1967658, -1.438016, 1, 1, 1, 1, 1,
-0.7759746, 1.981884, -0.702898, 1, 1, 1, 1, 1,
-0.7754146, -0.3516584, -2.058855, 1, 1, 1, 1, 1,
-0.7745553, 2.066599, -0.7796466, 1, 1, 1, 1, 1,
-0.7685157, 0.4273306, -0.8423997, 1, 1, 1, 1, 1,
-0.7652416, -0.750071, -2.390231, 1, 1, 1, 1, 1,
-0.7597709, 0.2487393, -0.2913156, 1, 1, 1, 1, 1,
-0.7504221, 0.3490424, -1.085723, 1, 1, 1, 1, 1,
-0.7465765, 0.8669891, -1.437399, 1, 1, 1, 1, 1,
-0.7446169, -0.7013991, -2.966453, 1, 1, 1, 1, 1,
-0.7437294, 0.1372313, -2.093259, 1, 1, 1, 1, 1,
-0.741362, 0.4934747, -1.017765, 1, 1, 1, 1, 1,
-0.7381386, -0.4968532, -1.136362, 0, 0, 1, 1, 1,
-0.7375758, -0.1886154, -4.658859, 1, 0, 0, 1, 1,
-0.7366479, -0.3287736, -2.588074, 1, 0, 0, 1, 1,
-0.733709, 0.1965035, 0.3135028, 1, 0, 0, 1, 1,
-0.7315376, 0.4459343, -2.229017, 1, 0, 0, 1, 1,
-0.7270275, -2.812476, -2.285709, 1, 0, 0, 1, 1,
-0.7242234, 1.22836, -0.5096537, 0, 0, 0, 1, 1,
-0.7195795, -0.708925, -3.860018, 0, 0, 0, 1, 1,
-0.7168589, -0.5925275, -1.946225, 0, 0, 0, 1, 1,
-0.7153248, -1.096325, -3.389701, 0, 0, 0, 1, 1,
-0.7151569, -0.2665704, -2.962284, 0, 0, 0, 1, 1,
-0.7146994, 2.084314, 0.2675138, 0, 0, 0, 1, 1,
-0.713662, 0.1433419, -1.208188, 0, 0, 0, 1, 1,
-0.7122477, -1.513382, -2.311507, 1, 1, 1, 1, 1,
-0.7052742, -0.2287876, -2.609323, 1, 1, 1, 1, 1,
-0.6909182, -0.09751273, -3.326408, 1, 1, 1, 1, 1,
-0.6903273, -1.618377, -3.4648, 1, 1, 1, 1, 1,
-0.6874797, 0.7394114, -0.9364934, 1, 1, 1, 1, 1,
-0.68535, -0.8765134, -3.170449, 1, 1, 1, 1, 1,
-0.6800714, 0.8729854, 0.6447673, 1, 1, 1, 1, 1,
-0.675575, 0.4677936, 0.03114298, 1, 1, 1, 1, 1,
-0.672023, -1.007198, -3.015212, 1, 1, 1, 1, 1,
-0.671607, 0.743367, -2.190533, 1, 1, 1, 1, 1,
-0.6677239, 0.6080111, -0.793061, 1, 1, 1, 1, 1,
-0.6644406, -0.7587491, -3.336229, 1, 1, 1, 1, 1,
-0.6619861, 1.031669, -1.420793, 1, 1, 1, 1, 1,
-0.6619781, 0.7646642, -1.596202, 1, 1, 1, 1, 1,
-0.6615695, -0.2974387, -3.401834, 1, 1, 1, 1, 1,
-0.6610187, -0.2746324, -2.643227, 0, 0, 1, 1, 1,
-0.6602172, -0.2649891, -1.754096, 1, 0, 0, 1, 1,
-0.6584625, 0.4466663, 0.1178231, 1, 0, 0, 1, 1,
-0.6580641, 1.336685, -1.621572, 1, 0, 0, 1, 1,
-0.6536564, -0.3886949, -1.214836, 1, 0, 0, 1, 1,
-0.6520122, -0.2775792, 0.2498864, 1, 0, 0, 1, 1,
-0.6421799, -1.192108, -3.387061, 0, 0, 0, 1, 1,
-0.6392742, 1.241532, -0.3032687, 0, 0, 0, 1, 1,
-0.6309055, 2.149925, -1.192429, 0, 0, 0, 1, 1,
-0.6306035, 1.507523, -0.5995001, 0, 0, 0, 1, 1,
-0.6301035, -0.8982176, -1.52554, 0, 0, 0, 1, 1,
-0.6300037, -0.6735403, -4.314413, 0, 0, 0, 1, 1,
-0.6289712, -0.2729398, -1.596218, 0, 0, 0, 1, 1,
-0.622338, -1.585451, -2.920255, 1, 1, 1, 1, 1,
-0.621112, 0.863631, 0.0163765, 1, 1, 1, 1, 1,
-0.6194883, 0.8138654, -1.940791, 1, 1, 1, 1, 1,
-0.6101104, -0.9780744, -2.152616, 1, 1, 1, 1, 1,
-0.6046079, 1.374916, -1.858937, 1, 1, 1, 1, 1,
-0.5941982, 1.943258, -0.3350722, 1, 1, 1, 1, 1,
-0.5928085, 1.22101, -1.667102, 1, 1, 1, 1, 1,
-0.5873217, -0.1066315, -3.276652, 1, 1, 1, 1, 1,
-0.5863249, -1.39651, -3.317187, 1, 1, 1, 1, 1,
-0.5780605, 0.187186, -1.056223, 1, 1, 1, 1, 1,
-0.5743552, -0.3643472, -3.188635, 1, 1, 1, 1, 1,
-0.5699592, -0.2417213, -2.048125, 1, 1, 1, 1, 1,
-0.5661765, -0.2724696, -2.264505, 1, 1, 1, 1, 1,
-0.5587294, -0.3429036, -0.747669, 1, 1, 1, 1, 1,
-0.5570058, -1.275001, -2.722766, 1, 1, 1, 1, 1,
-0.5548034, 0.1562098, -3.215379, 0, 0, 1, 1, 1,
-0.5547554, -1.423028, -3.763445, 1, 0, 0, 1, 1,
-0.553587, -1.753463, -1.896721, 1, 0, 0, 1, 1,
-0.5520143, 1.850816, -0.2792928, 1, 0, 0, 1, 1,
-0.5519376, -0.5870058, -2.696738, 1, 0, 0, 1, 1,
-0.5505611, -1.062025, -4.536528, 1, 0, 0, 1, 1,
-0.5495517, 1.870753, 1.591591, 0, 0, 0, 1, 1,
-0.5441486, 0.09582465, -1.154183, 0, 0, 0, 1, 1,
-0.5405048, -0.6224905, -1.066018, 0, 0, 0, 1, 1,
-0.5397782, 1.735746, -2.068964, 0, 0, 0, 1, 1,
-0.5353703, -0.2283283, -0.9026, 0, 0, 0, 1, 1,
-0.5293577, 1.359092, 0.084972, 0, 0, 0, 1, 1,
-0.5292811, 0.1321837, -1.642888, 0, 0, 0, 1, 1,
-0.5252467, -0.8500102, -2.8456, 1, 1, 1, 1, 1,
-0.5159, 0.6071295, 0.9927617, 1, 1, 1, 1, 1,
-0.5044844, -0.007480821, -0.4864894, 1, 1, 1, 1, 1,
-0.5004632, -0.8398998, -2.659872, 1, 1, 1, 1, 1,
-0.4993194, -0.69846, -1.675627, 1, 1, 1, 1, 1,
-0.4985696, 1.187234, -1.399243, 1, 1, 1, 1, 1,
-0.4923421, 2.100916, 2.058805, 1, 1, 1, 1, 1,
-0.4902713, -0.961127, -2.64871, 1, 1, 1, 1, 1,
-0.4828946, -0.1467451, -1.280267, 1, 1, 1, 1, 1,
-0.4785142, -1.433737, -3.555236, 1, 1, 1, 1, 1,
-0.4755813, 2.034964, -0.5479021, 1, 1, 1, 1, 1,
-0.4746896, -0.4456677, -2.75412, 1, 1, 1, 1, 1,
-0.4742196, -0.3352916, -2.134894, 1, 1, 1, 1, 1,
-0.4735131, -1.201388, -3.36665, 1, 1, 1, 1, 1,
-0.4730554, 0.1170354, -0.3738455, 1, 1, 1, 1, 1,
-0.4648964, 0.3366356, -2.711188, 0, 0, 1, 1, 1,
-0.4620084, -0.5532853, -2.903239, 1, 0, 0, 1, 1,
-0.460456, 0.3797618, -0.8400833, 1, 0, 0, 1, 1,
-0.4489182, 0.6444159, -1.169263, 1, 0, 0, 1, 1,
-0.4457529, -1.254369, -2.093326, 1, 0, 0, 1, 1,
-0.4367176, 0.2276435, 0.2189782, 1, 0, 0, 1, 1,
-0.4336294, -0.2657754, -2.107802, 0, 0, 0, 1, 1,
-0.4327672, -0.5934036, -1.989497, 0, 0, 0, 1, 1,
-0.423786, 0.2914827, 0.853084, 0, 0, 0, 1, 1,
-0.4214298, -1.616889, -1.65778, 0, 0, 0, 1, 1,
-0.4166923, -0.6721691, -2.383738, 0, 0, 0, 1, 1,
-0.4146328, 0.2533606, -2.99524, 0, 0, 0, 1, 1,
-0.4137155, -0.4839789, -0.6169345, 0, 0, 0, 1, 1,
-0.4047809, -0.1775373, -2.86074, 1, 1, 1, 1, 1,
-0.3953264, -0.7321475, -3.333462, 1, 1, 1, 1, 1,
-0.3870453, -1.438844, -3.496386, 1, 1, 1, 1, 1,
-0.3794638, -1.157557, -1.757273, 1, 1, 1, 1, 1,
-0.3736388, -0.2524664, -0.984333, 1, 1, 1, 1, 1,
-0.3729543, 1.049197, -0.5523807, 1, 1, 1, 1, 1,
-0.3727404, -2.103769, -2.314777, 1, 1, 1, 1, 1,
-0.3712828, -0.03091447, -1.221159, 1, 1, 1, 1, 1,
-0.370877, -0.9456233, -3.007381, 1, 1, 1, 1, 1,
-0.3619509, -0.4154857, -2.723887, 1, 1, 1, 1, 1,
-0.36003, -1.448465, -0.8199352, 1, 1, 1, 1, 1,
-0.3568082, -1.417056, -2.33101, 1, 1, 1, 1, 1,
-0.3531085, 0.6386431, -0.6896177, 1, 1, 1, 1, 1,
-0.3524271, 0.8255714, -1.703705, 1, 1, 1, 1, 1,
-0.3461783, 1.430521, 0.07510342, 1, 1, 1, 1, 1,
-0.3429333, 0.5059059, -0.3558894, 0, 0, 1, 1, 1,
-0.3426216, -0.3025166, -2.000201, 1, 0, 0, 1, 1,
-0.3420053, 0.5349611, -1.153327, 1, 0, 0, 1, 1,
-0.3384135, 0.9586014, -1.289543, 1, 0, 0, 1, 1,
-0.3367625, 0.6821191, -1.298983, 1, 0, 0, 1, 1,
-0.3355131, -0.9101271, -2.31347, 1, 0, 0, 1, 1,
-0.335212, -0.9876519, -2.137178, 0, 0, 0, 1, 1,
-0.3327547, -1.293667, -5.09303, 0, 0, 0, 1, 1,
-0.3323581, 2.179996, 0.3848283, 0, 0, 0, 1, 1,
-0.3281968, 1.557714, 0.1070614, 0, 0, 0, 1, 1,
-0.3275513, 0.5254505, 0.3157181, 0, 0, 0, 1, 1,
-0.3250248, -1.553098, -5.033706, 0, 0, 0, 1, 1,
-0.3223299, -2.090393, -4.21532, 0, 0, 0, 1, 1,
-0.3141108, 0.3661667, -0.2122775, 1, 1, 1, 1, 1,
-0.313891, 1.343344, -2.215368, 1, 1, 1, 1, 1,
-0.2997756, -0.3696023, -3.71854, 1, 1, 1, 1, 1,
-0.2988084, -0.01211307, -0.7202666, 1, 1, 1, 1, 1,
-0.2987299, 0.6860101, -0.2635594, 1, 1, 1, 1, 1,
-0.2977772, -0.4392678, -3.088869, 1, 1, 1, 1, 1,
-0.2952318, 0.4095604, 0.8145353, 1, 1, 1, 1, 1,
-0.2897726, 0.9057042, 0.6586594, 1, 1, 1, 1, 1,
-0.2846996, 0.7687761, 0.1860077, 1, 1, 1, 1, 1,
-0.2842456, -0.4005912, -2.57452, 1, 1, 1, 1, 1,
-0.2839163, -1.640413, -2.614135, 1, 1, 1, 1, 1,
-0.282611, 1.403584, -1.114756, 1, 1, 1, 1, 1,
-0.2816258, -1.218429, -4.057801, 1, 1, 1, 1, 1,
-0.2784397, 0.7240922, 1.396451, 1, 1, 1, 1, 1,
-0.2784105, 1.41167, -0.1310523, 1, 1, 1, 1, 1,
-0.2769763, 1.253138, -0.03793793, 0, 0, 1, 1, 1,
-0.2769066, 0.9879069, -0.5402576, 1, 0, 0, 1, 1,
-0.2742212, 0.366631, -1.979674, 1, 0, 0, 1, 1,
-0.2739964, 1.370848, 0.3817993, 1, 0, 0, 1, 1,
-0.2736691, 1.006098, -0.12249, 1, 0, 0, 1, 1,
-0.2722836, 0.548226, -0.1125947, 1, 0, 0, 1, 1,
-0.2721952, -0.5564433, -2.23016, 0, 0, 0, 1, 1,
-0.2680442, 1.381408, -1.11332, 0, 0, 0, 1, 1,
-0.2658395, 0.8701584, 1.450253, 0, 0, 0, 1, 1,
-0.2655959, 1.618162, 0.4652521, 0, 0, 0, 1, 1,
-0.2597398, -0.3112998, -4.100589, 0, 0, 0, 1, 1,
-0.2591833, -1.972812, -1.880454, 0, 0, 0, 1, 1,
-0.2552072, 1.228018, 0.805906, 0, 0, 0, 1, 1,
-0.2544872, -1.944617, -2.827369, 1, 1, 1, 1, 1,
-0.2541711, -0.6703429, -2.566496, 1, 1, 1, 1, 1,
-0.2512397, 0.1597137, -1.520504, 1, 1, 1, 1, 1,
-0.2509011, -1.288225, -1.20787, 1, 1, 1, 1, 1,
-0.2499176, -0.8070537, -2.849711, 1, 1, 1, 1, 1,
-0.2495913, -0.2572277, -1.649912, 1, 1, 1, 1, 1,
-0.2487312, -0.735918, -4.00227, 1, 1, 1, 1, 1,
-0.2429666, 1.686057, -0.8233257, 1, 1, 1, 1, 1,
-0.2426821, -0.1932423, -0.8785493, 1, 1, 1, 1, 1,
-0.2382293, 2.427288, -0.02149858, 1, 1, 1, 1, 1,
-0.237811, 0.1429108, -0.1857079, 1, 1, 1, 1, 1,
-0.229646, -0.236669, -3.392008, 1, 1, 1, 1, 1,
-0.2226132, -0.3010094, -1.254167, 1, 1, 1, 1, 1,
-0.2186677, -0.4743786, -2.888418, 1, 1, 1, 1, 1,
-0.2112326, -0.9190294, -4.236554, 1, 1, 1, 1, 1,
-0.209704, -0.3777928, -2.605297, 0, 0, 1, 1, 1,
-0.2091749, -0.4216987, -0.6615476, 1, 0, 0, 1, 1,
-0.2072472, 0.736097, -0.907043, 1, 0, 0, 1, 1,
-0.2070737, -0.1426214, -1.554747, 1, 0, 0, 1, 1,
-0.2066258, 0.04459912, -1.69269, 1, 0, 0, 1, 1,
-0.2054676, -1.155879, -3.129866, 1, 0, 0, 1, 1,
-0.2053825, 0.3951269, -0.05696634, 0, 0, 0, 1, 1,
-0.2049753, -0.5303109, -3.429604, 0, 0, 0, 1, 1,
-0.2045687, -0.3824499, -4.29863, 0, 0, 0, 1, 1,
-0.1979901, -0.2939605, -3.26424, 0, 0, 0, 1, 1,
-0.1969199, 0.582898, -1.221078, 0, 0, 0, 1, 1,
-0.1941655, 0.08378239, -0.001985061, 0, 0, 0, 1, 1,
-0.192624, -0.9613121, -3.29026, 0, 0, 0, 1, 1,
-0.1911379, -0.05862537, -3.956249, 1, 1, 1, 1, 1,
-0.1910971, 0.7017031, -1.069002, 1, 1, 1, 1, 1,
-0.1891164, -1.527916, -2.37833, 1, 1, 1, 1, 1,
-0.1849197, 1.591078, 1.12836, 1, 1, 1, 1, 1,
-0.182661, 0.2540175, 0.5548291, 1, 1, 1, 1, 1,
-0.1823544, -0.9129947, -4.064405, 1, 1, 1, 1, 1,
-0.1818394, -0.6934941, -1.775928, 1, 1, 1, 1, 1,
-0.1808813, 2.607428, -0.7057503, 1, 1, 1, 1, 1,
-0.1808369, 0.7620682, 0.7492504, 1, 1, 1, 1, 1,
-0.1799771, -1.213361, -2.578966, 1, 1, 1, 1, 1,
-0.1777212, 0.2632605, -1.642317, 1, 1, 1, 1, 1,
-0.1683629, 0.1430868, -0.8421691, 1, 1, 1, 1, 1,
-0.1664969, 0.1426037, -0.1976205, 1, 1, 1, 1, 1,
-0.1643729, -0.1997401, -0.3150508, 1, 1, 1, 1, 1,
-0.1640896, 0.991414, 0.6451111, 1, 1, 1, 1, 1,
-0.1610428, -0.5824035, -4.856109, 0, 0, 1, 1, 1,
-0.1579016, 0.0619794, -1.0805, 1, 0, 0, 1, 1,
-0.1545388, -1.019357, 0.7365319, 1, 0, 0, 1, 1,
-0.1493374, -1.705933, -4.370734, 1, 0, 0, 1, 1,
-0.147115, 0.9600198, 0.2546804, 1, 0, 0, 1, 1,
-0.1457039, -0.8104406, -1.442116, 1, 0, 0, 1, 1,
-0.1455773, 0.8102332, 2.002298, 0, 0, 0, 1, 1,
-0.1401826, 1.127743, -0.4540841, 0, 0, 0, 1, 1,
-0.1364325, -0.4791075, -2.658266, 0, 0, 0, 1, 1,
-0.131147, 0.09934885, 0.7873185, 0, 0, 0, 1, 1,
-0.1307495, 0.04581084, -2.891202, 0, 0, 0, 1, 1,
-0.1295628, -0.5323792, -0.6546074, 0, 0, 0, 1, 1,
-0.1234043, -1.15163, -3.974681, 0, 0, 0, 1, 1,
-0.122852, 0.4343002, 1.187684, 1, 1, 1, 1, 1,
-0.1200718, -0.6843801, -3.013422, 1, 1, 1, 1, 1,
-0.1184362, 0.2087537, 0.3822451, 1, 1, 1, 1, 1,
-0.1168532, -0.2568348, -2.36393, 1, 1, 1, 1, 1,
-0.1157595, 0.8133758, 0.4492699, 1, 1, 1, 1, 1,
-0.1117416, -1.250174, -2.992465, 1, 1, 1, 1, 1,
-0.1077535, -1.818129, -3.606888, 1, 1, 1, 1, 1,
-0.1067101, -0.2210336, -2.74665, 1, 1, 1, 1, 1,
-0.103601, -0.05388986, -1.392623, 1, 1, 1, 1, 1,
-0.1001801, -1.438566, -2.227308, 1, 1, 1, 1, 1,
-0.09960154, 0.1180289, -0.8871035, 1, 1, 1, 1, 1,
-0.09605585, -0.5350732, -2.763596, 1, 1, 1, 1, 1,
-0.09580627, -0.8917825, 0.08564056, 1, 1, 1, 1, 1,
-0.09268224, 2.881377, -1.532888, 1, 1, 1, 1, 1,
-0.09259148, -0.8782714, -2.694858, 1, 1, 1, 1, 1,
-0.09046222, -0.597643, -4.354766, 0, 0, 1, 1, 1,
-0.08315821, 0.6662862, -1.576319, 1, 0, 0, 1, 1,
-0.08287257, -1.114546, -2.741688, 1, 0, 0, 1, 1,
-0.07703891, -1.912908, -4.176127, 1, 0, 0, 1, 1,
-0.0753583, -1.133985, -3.324535, 1, 0, 0, 1, 1,
-0.07385441, 1.465765, 0.7516288, 1, 0, 0, 1, 1,
-0.07209028, -0.1039331, -2.863405, 0, 0, 0, 1, 1,
-0.07155371, -0.08320626, -1.76542, 0, 0, 0, 1, 1,
-0.06934964, 0.7075827, -0.6586305, 0, 0, 0, 1, 1,
-0.06862684, 0.3948312, 0.2415106, 0, 0, 0, 1, 1,
-0.06684942, -1.185805, -2.098674, 0, 0, 0, 1, 1,
-0.06413643, -0.5686525, -4.4116, 0, 0, 0, 1, 1,
-0.06135496, 0.9332039, 1.450861, 0, 0, 0, 1, 1,
-0.0562981, 0.8930777, 0.7592098, 1, 1, 1, 1, 1,
-0.05328297, 0.1766185, -1.466627, 1, 1, 1, 1, 1,
-0.05194581, 0.6916903, -1.180621, 1, 1, 1, 1, 1,
-0.04914903, 0.150141, -1.322531, 1, 1, 1, 1, 1,
-0.04170563, -0.9328313, -2.405743, 1, 1, 1, 1, 1,
-0.03862976, -0.8398646, -2.351118, 1, 1, 1, 1, 1,
-0.03378174, -0.1131874, -4.675663, 1, 1, 1, 1, 1,
-0.03355492, -0.9944398, -3.703025, 1, 1, 1, 1, 1,
-0.03173318, 0.8217213, -0.5695493, 1, 1, 1, 1, 1,
-0.02954959, 0.3959857, -0.4990197, 1, 1, 1, 1, 1,
-0.02942146, -0.2759723, -3.482735, 1, 1, 1, 1, 1,
-0.02937076, 0.04556106, -1.490727, 1, 1, 1, 1, 1,
-0.02857387, 0.2325001, -0.9782013, 1, 1, 1, 1, 1,
-0.02567247, 0.7310864, 0.03068755, 1, 1, 1, 1, 1,
-0.02533879, -0.8890841, -2.909557, 1, 1, 1, 1, 1,
-0.02106867, -1.587508, -1.795537, 0, 0, 1, 1, 1,
-0.01998794, 0.5607818, 0.6006944, 1, 0, 0, 1, 1,
-0.01969776, 0.1226502, -1.027009, 1, 0, 0, 1, 1,
-0.01853365, 0.5453407, -0.08132512, 1, 0, 0, 1, 1,
-0.01538789, 0.976949, -0.9603037, 1, 0, 0, 1, 1,
-0.01193182, -1.036167, -2.425706, 1, 0, 0, 1, 1,
-0.007418747, 0.3496523, 0.874651, 0, 0, 0, 1, 1,
-0.004662515, -0.1317843, -2.591113, 0, 0, 0, 1, 1,
0.001072474, 0.4551218, -0.3808958, 0, 0, 0, 1, 1,
0.003357188, 1.394083, -1.329653, 0, 0, 0, 1, 1,
0.005753026, 1.245794, -0.3191342, 0, 0, 0, 1, 1,
0.006117106, -0.8262595, 0.959118, 0, 0, 0, 1, 1,
0.00769761, -1.328779, 4.639633, 0, 0, 0, 1, 1,
0.009253184, 1.465356, 0.2335507, 1, 1, 1, 1, 1,
0.01005789, 0.4927997, 0.8485799, 1, 1, 1, 1, 1,
0.01258507, -0.7888623, 2.328996, 1, 1, 1, 1, 1,
0.01267069, 0.848097, 0.5744905, 1, 1, 1, 1, 1,
0.01439144, -0.6460147, 3.335842, 1, 1, 1, 1, 1,
0.01442186, 0.8680673, -1.530238, 1, 1, 1, 1, 1,
0.02115799, 0.3436229, 0.6610157, 1, 1, 1, 1, 1,
0.02164592, -2.016841, 3.511061, 1, 1, 1, 1, 1,
0.02174689, -1.081035, 2.762519, 1, 1, 1, 1, 1,
0.02521848, 1.055296, -1.297347, 1, 1, 1, 1, 1,
0.03157144, 1.024299, 0.6041117, 1, 1, 1, 1, 1,
0.03351571, -0.7909548, 3.131086, 1, 1, 1, 1, 1,
0.03412373, 1.582543, -0.9863619, 1, 1, 1, 1, 1,
0.03534327, 1.346095, -0.8086918, 1, 1, 1, 1, 1,
0.04070615, 2.942063, -1.214423, 1, 1, 1, 1, 1,
0.04165302, -0.3783065, 3.945797, 0, 0, 1, 1, 1,
0.04366012, 1.162808, 0.2584443, 1, 0, 0, 1, 1,
0.04520864, 0.1785665, 1.338987, 1, 0, 0, 1, 1,
0.04754615, 0.005678262, 0.1995389, 1, 0, 0, 1, 1,
0.04811368, 1.626203, 0.9254786, 1, 0, 0, 1, 1,
0.0483469, -1.387079, 3.411115, 1, 0, 0, 1, 1,
0.0488793, -1.474461, 3.881145, 0, 0, 0, 1, 1,
0.04939126, 0.4328403, -0.7506539, 0, 0, 0, 1, 1,
0.04951678, -1.624592, 2.371868, 0, 0, 0, 1, 1,
0.05204485, -0.09691768, 1.671731, 0, 0, 0, 1, 1,
0.0526773, -0.3644715, 3.571999, 0, 0, 0, 1, 1,
0.0544465, -0.6384022, 1.873788, 0, 0, 0, 1, 1,
0.05477799, -0.1968093, 2.814264, 0, 0, 0, 1, 1,
0.05569295, 0.2764083, 1.52712, 1, 1, 1, 1, 1,
0.05725688, -0.4942718, 3.109215, 1, 1, 1, 1, 1,
0.05831254, 0.1568066, 0.1545832, 1, 1, 1, 1, 1,
0.06177029, 3.310836, 1.077816, 1, 1, 1, 1, 1,
0.06823459, -2.183856, 2.26575, 1, 1, 1, 1, 1,
0.07046722, -0.7523742, 3.790822, 1, 1, 1, 1, 1,
0.07254808, -1.379158, 4.77536, 1, 1, 1, 1, 1,
0.07540908, 0.1392009, 0.1378372, 1, 1, 1, 1, 1,
0.08169511, -1.274023, 2.743831, 1, 1, 1, 1, 1,
0.08341556, -0.8839481, 4.090549, 1, 1, 1, 1, 1,
0.08463836, -1.458597, 2.571071, 1, 1, 1, 1, 1,
0.08846133, -0.4874215, 3.387341, 1, 1, 1, 1, 1,
0.09066033, 1.197441, 0.876608, 1, 1, 1, 1, 1,
0.09330765, -0.3047957, 2.168964, 1, 1, 1, 1, 1,
0.1000253, -1.032121, 4.369251, 1, 1, 1, 1, 1,
0.1003449, -0.1362409, 0.9355739, 0, 0, 1, 1, 1,
0.1030143, 0.2478922, 1.596537, 1, 0, 0, 1, 1,
0.10562, -1.56423, 3.062678, 1, 0, 0, 1, 1,
0.1085102, 0.4146852, 1.456565, 1, 0, 0, 1, 1,
0.1099118, -0.1136078, 1.227037, 1, 0, 0, 1, 1,
0.1109209, -1.810498, 3.207157, 1, 0, 0, 1, 1,
0.1138158, -0.2922111, 2.821473, 0, 0, 0, 1, 1,
0.1142488, -1.423815, 2.038907, 0, 0, 0, 1, 1,
0.1180795, 0.9715453, -0.1607911, 0, 0, 0, 1, 1,
0.1329893, -1.038186, 2.201303, 0, 0, 0, 1, 1,
0.1338435, 2.375368, -2.818561, 0, 0, 0, 1, 1,
0.1347354, -0.007599217, 0.9940792, 0, 0, 0, 1, 1,
0.1410842, -0.4464795, 3.160386, 0, 0, 0, 1, 1,
0.142703, -0.9142069, 1.948974, 1, 1, 1, 1, 1,
0.1427763, 1.176787, -0.0738015, 1, 1, 1, 1, 1,
0.1432054, -1.311195, 2.000608, 1, 1, 1, 1, 1,
0.1447543, -0.31702, 4.142253, 1, 1, 1, 1, 1,
0.1470858, 0.7512696, -0.4985929, 1, 1, 1, 1, 1,
0.1491365, 3.020713, 0.3816363, 1, 1, 1, 1, 1,
0.1534068, -0.1179414, 1.574014, 1, 1, 1, 1, 1,
0.1595192, -0.1909467, 1.802951, 1, 1, 1, 1, 1,
0.1623565, 1.400005, 1.474923, 1, 1, 1, 1, 1,
0.1642269, -0.02683434, 2.299489, 1, 1, 1, 1, 1,
0.1657725, -0.0665875, 2.564201, 1, 1, 1, 1, 1,
0.1673257, 0.1997748, 0.935801, 1, 1, 1, 1, 1,
0.1693839, -1.379669, 2.452532, 1, 1, 1, 1, 1,
0.169478, 1.07118, -1.015679, 1, 1, 1, 1, 1,
0.1753325, 0.8759937, 2.483519, 1, 1, 1, 1, 1,
0.1773558, 0.7284075, -0.1929023, 0, 0, 1, 1, 1,
0.1783156, -1.954147, 3.469578, 1, 0, 0, 1, 1,
0.1795825, -1.824477, 4.17706, 1, 0, 0, 1, 1,
0.1799582, 0.7302985, -0.5283169, 1, 0, 0, 1, 1,
0.1879758, -1.315716, 3.082785, 1, 0, 0, 1, 1,
0.1901396, 0.1615287, -0.3674999, 1, 0, 0, 1, 1,
0.1967727, 0.5337039, 0.8939079, 0, 0, 0, 1, 1,
0.2082485, -0.6920482, 4.091888, 0, 0, 0, 1, 1,
0.2089442, -0.02613236, 3.945255, 0, 0, 0, 1, 1,
0.2099559, 1.048928, 0.2754787, 0, 0, 0, 1, 1,
0.2121813, -0.5513923, 3.078078, 0, 0, 0, 1, 1,
0.214423, -1.172881, 3.392882, 0, 0, 0, 1, 1,
0.2160828, -2.308987, 3.799049, 0, 0, 0, 1, 1,
0.2166597, -0.6830036, 4.96877, 1, 1, 1, 1, 1,
0.2169463, -0.3865247, 3.072378, 1, 1, 1, 1, 1,
0.2190164, -0.8589336, 2.814017, 1, 1, 1, 1, 1,
0.2221039, 1.104472, 0.264773, 1, 1, 1, 1, 1,
0.2228754, 0.2006756, 2.503934, 1, 1, 1, 1, 1,
0.2266665, -1.161469, 4.986573, 1, 1, 1, 1, 1,
0.227951, -0.1206931, 1.86427, 1, 1, 1, 1, 1,
0.2288462, 0.78866, 0.6727979, 1, 1, 1, 1, 1,
0.2302141, -0.5488298, 2.654545, 1, 1, 1, 1, 1,
0.235379, -1.183615, 2.682532, 1, 1, 1, 1, 1,
0.2382468, 1.343676, 0.147392, 1, 1, 1, 1, 1,
0.2393171, -1.320057, 2.620165, 1, 1, 1, 1, 1,
0.2468233, -1.005114, 2.463092, 1, 1, 1, 1, 1,
0.2470067, -1.254926, 4.810954, 1, 1, 1, 1, 1,
0.2497409, 0.30575, 0.04259178, 1, 1, 1, 1, 1,
0.2497888, -0.09932929, 0.5099666, 0, 0, 1, 1, 1,
0.2524992, 0.5507619, 2.13644, 1, 0, 0, 1, 1,
0.2531227, -1.304764, 2.121878, 1, 0, 0, 1, 1,
0.2598264, 0.1325955, -0.3644527, 1, 0, 0, 1, 1,
0.2601228, -0.9109113, 4.872278, 1, 0, 0, 1, 1,
0.2607331, -0.04115266, 1.263094, 1, 0, 0, 1, 1,
0.2616901, -1.609836, 2.638987, 0, 0, 0, 1, 1,
0.2623551, 0.3020755, 0.10109, 0, 0, 0, 1, 1,
0.2632878, 0.2735315, 0.9345513, 0, 0, 0, 1, 1,
0.2669119, -1.051774, 3.203971, 0, 0, 0, 1, 1,
0.2745521, 1.710248, 1.039437, 0, 0, 0, 1, 1,
0.274763, 0.6907774, -0.4278854, 0, 0, 0, 1, 1,
0.2773534, 0.5237584, -1.53485, 0, 0, 0, 1, 1,
0.2776836, -0.7163687, 3.287304, 1, 1, 1, 1, 1,
0.2787477, 1.388527, 0.5767365, 1, 1, 1, 1, 1,
0.2793846, 0.7415403, 0.8269672, 1, 1, 1, 1, 1,
0.28224, 0.4972393, -1.063416, 1, 1, 1, 1, 1,
0.2825549, 0.01217152, 1.138435, 1, 1, 1, 1, 1,
0.2857196, 0.420898, 1.273296, 1, 1, 1, 1, 1,
0.2880068, 2.349609, -0.3436592, 1, 1, 1, 1, 1,
0.2903351, 0.8049666, -0.06986616, 1, 1, 1, 1, 1,
0.2942776, 1.116989, 0.9947951, 1, 1, 1, 1, 1,
0.2987335, -0.89335, 2.713486, 1, 1, 1, 1, 1,
0.2991084, 0.5000738, -0.616687, 1, 1, 1, 1, 1,
0.2998018, 0.7644306, 0.03769975, 1, 1, 1, 1, 1,
0.3096455, -0.6969596, 1.852487, 1, 1, 1, 1, 1,
0.3101262, -2.10544, 2.987141, 1, 1, 1, 1, 1,
0.3178407, -1.631516, 3.752107, 1, 1, 1, 1, 1,
0.3194566, -0.9150203, 2.842432, 0, 0, 1, 1, 1,
0.3217469, -0.321284, 3.128635, 1, 0, 0, 1, 1,
0.322066, 0.5483124, -1.018198, 1, 0, 0, 1, 1,
0.3241518, 0.7526449, 1.364593, 1, 0, 0, 1, 1,
0.3270337, 1.37069, -0.002429585, 1, 0, 0, 1, 1,
0.3287547, 1.490853, 0.6432882, 1, 0, 0, 1, 1,
0.3331624, -0.9416122, 4.036007, 0, 0, 0, 1, 1,
0.3334005, -0.8475252, 2.161942, 0, 0, 0, 1, 1,
0.3518352, 1.101123, 1.9163, 0, 0, 0, 1, 1,
0.3558587, 0.6866747, 2.608498, 0, 0, 0, 1, 1,
0.3559958, 0.9473405, 0.5441089, 0, 0, 0, 1, 1,
0.3651483, -0.9099858, 3.45158, 0, 0, 0, 1, 1,
0.3666843, 0.01200642, -0.587751, 0, 0, 0, 1, 1,
0.3667836, -0.8288344, 4.331077, 1, 1, 1, 1, 1,
0.3675561, 0.07295938, -0.2451215, 1, 1, 1, 1, 1,
0.3686167, 0.8605136, 1.884574, 1, 1, 1, 1, 1,
0.3725734, -0.8705704, 2.116531, 1, 1, 1, 1, 1,
0.3748377, 1.422366, 0.4524781, 1, 1, 1, 1, 1,
0.3759331, -1.336936, 2.063922, 1, 1, 1, 1, 1,
0.3817942, -0.6543164, 3.371781, 1, 1, 1, 1, 1,
0.3847761, -0.6270987, 3.159871, 1, 1, 1, 1, 1,
0.3853613, 0.7868293, 1.080207, 1, 1, 1, 1, 1,
0.3872998, -0.7176749, 3.151546, 1, 1, 1, 1, 1,
0.3964082, -1.30787, 2.910542, 1, 1, 1, 1, 1,
0.4008764, 2.346416, -0.3894335, 1, 1, 1, 1, 1,
0.402014, -0.9377695, 2.807003, 1, 1, 1, 1, 1,
0.4067207, -0.8715498, 1.147583, 1, 1, 1, 1, 1,
0.4132617, 0.2816308, 2.130518, 1, 1, 1, 1, 1,
0.4145372, 1.059804, 0.2330775, 0, 0, 1, 1, 1,
0.4202919, -2.269778, 3.8064, 1, 0, 0, 1, 1,
0.4323716, -0.9936512, 1.358225, 1, 0, 0, 1, 1,
0.4357001, 1.065253, -1.312543, 1, 0, 0, 1, 1,
0.4393313, 0.5877275, -0.1693172, 1, 0, 0, 1, 1,
0.4432341, 0.7670667, 1.088002, 1, 0, 0, 1, 1,
0.4434118, 1.243949, 1.684494, 0, 0, 0, 1, 1,
0.4439973, -1.151596, 1.829443, 0, 0, 0, 1, 1,
0.4486916, -0.09361146, 1.502201, 0, 0, 0, 1, 1,
0.4495517, 0.01234778, -0.07937936, 0, 0, 0, 1, 1,
0.4499333, 2.025571, -0.2909156, 0, 0, 0, 1, 1,
0.4500762, -0.1978148, 1.430686, 0, 0, 0, 1, 1,
0.4549527, 0.3997931, 1.700507, 0, 0, 0, 1, 1,
0.4555233, -0.1296881, 0.3227287, 1, 1, 1, 1, 1,
0.4576068, -1.957024, 2.622901, 1, 1, 1, 1, 1,
0.4586833, -0.5283326, 1.921831, 1, 1, 1, 1, 1,
0.4587722, -0.430972, 2.330576, 1, 1, 1, 1, 1,
0.4646314, 0.7193511, 0.5095643, 1, 1, 1, 1, 1,
0.4687599, 1.031891, 0.6623781, 1, 1, 1, 1, 1,
0.4706039, -0.2650369, 1.516471, 1, 1, 1, 1, 1,
0.4731814, 0.3838023, 1.037881, 1, 1, 1, 1, 1,
0.473266, -0.3778814, 2.316944, 1, 1, 1, 1, 1,
0.476416, -1.954577, 4.268641, 1, 1, 1, 1, 1,
0.4844535, 0.6309896, 1.062998, 1, 1, 1, 1, 1,
0.4896924, -0.3588249, 1.851572, 1, 1, 1, 1, 1,
0.4899175, -0.2422478, 3.032368, 1, 1, 1, 1, 1,
0.4911037, 1.368691, -0.9408078, 1, 1, 1, 1, 1,
0.494013, -1.418663, 1.414684, 1, 1, 1, 1, 1,
0.4961313, -0.04433948, 2.211123, 0, 0, 1, 1, 1,
0.4999323, -0.1210771, 0.7282907, 1, 0, 0, 1, 1,
0.5039367, -0.8351458, 1.993058, 1, 0, 0, 1, 1,
0.5067129, -1.85067, 1.540576, 1, 0, 0, 1, 1,
0.5069945, 0.398092, 0.3751587, 1, 0, 0, 1, 1,
0.5077645, 1.139893, -0.09985758, 1, 0, 0, 1, 1,
0.5109356, -0.4469782, 0.3332774, 0, 0, 0, 1, 1,
0.5156286, -2.284203, 3.491188, 0, 0, 0, 1, 1,
0.5183718, 0.5459087, 0.5664824, 0, 0, 0, 1, 1,
0.5270435, -1.402097, 1.573032, 0, 0, 0, 1, 1,
0.5343969, 0.5836003, 1.045737, 0, 0, 0, 1, 1,
0.5348808, -1.01221, 1.742897, 0, 0, 0, 1, 1,
0.5348887, 0.5387182, -0.7100115, 0, 0, 0, 1, 1,
0.5402741, -0.3737842, 1.467429, 1, 1, 1, 1, 1,
0.5419749, 0.2837151, 2.951799, 1, 1, 1, 1, 1,
0.5429356, 0.522999, 0.1801451, 1, 1, 1, 1, 1,
0.5442366, -2.766008, 3.507928, 1, 1, 1, 1, 1,
0.5443262, 0.3303202, 2.801311, 1, 1, 1, 1, 1,
0.5468234, -1.09028, 2.730588, 1, 1, 1, 1, 1,
0.5489001, -0.3589404, 2.563864, 1, 1, 1, 1, 1,
0.5498244, 0.3042308, 0.4482153, 1, 1, 1, 1, 1,
0.5501003, -0.16832, 2.486502, 1, 1, 1, 1, 1,
0.5514434, 1.035829, -0.4878431, 1, 1, 1, 1, 1,
0.5540129, -0.2160372, 1.648966, 1, 1, 1, 1, 1,
0.5557883, -0.8218481, 2.056511, 1, 1, 1, 1, 1,
0.5587505, -1.441162, 2.073894, 1, 1, 1, 1, 1,
0.5593119, -1.052344, 1.696676, 1, 1, 1, 1, 1,
0.5596906, -0.05256366, 3.064848, 1, 1, 1, 1, 1,
0.5634134, -0.5824522, 3.71652, 0, 0, 1, 1, 1,
0.5670503, 0.3958254, 2.123718, 1, 0, 0, 1, 1,
0.5699842, 0.581798, 0.755062, 1, 0, 0, 1, 1,
0.5707071, -2.55973, 3.485424, 1, 0, 0, 1, 1,
0.5710981, -3.35464, 1.247717, 1, 0, 0, 1, 1,
0.5758877, 0.755424, 1.801699, 1, 0, 0, 1, 1,
0.5767803, -1.256914, 4.074758, 0, 0, 0, 1, 1,
0.5772787, -0.7438014, 1.208397, 0, 0, 0, 1, 1,
0.5785649, -0.1670293, 0.5154136, 0, 0, 0, 1, 1,
0.5867494, 1.549932, 1.047546, 0, 0, 0, 1, 1,
0.587682, -0.1519961, 1.997398, 0, 0, 0, 1, 1,
0.5928852, 1.285135, -0.316366, 0, 0, 0, 1, 1,
0.5937583, -0.6827928, 2.107448, 0, 0, 0, 1, 1,
0.6085278, -0.6526316, 2.652128, 1, 1, 1, 1, 1,
0.6114563, 0.9513825, -0.5864576, 1, 1, 1, 1, 1,
0.6180962, -0.1197335, 1.883469, 1, 1, 1, 1, 1,
0.6196631, 0.8865864, 0.3346104, 1, 1, 1, 1, 1,
0.6220839, -0.7356573, 1.542297, 1, 1, 1, 1, 1,
0.6247588, -1.383864, 3.167915, 1, 1, 1, 1, 1,
0.632879, 0.1285837, 1.680348, 1, 1, 1, 1, 1,
0.6364021, -0.4684044, 2.472586, 1, 1, 1, 1, 1,
0.6473222, -0.4029364, 2.336598, 1, 1, 1, 1, 1,
0.6542829, -0.4530687, 3.533808, 1, 1, 1, 1, 1,
0.657433, 0.3532842, 0.6069804, 1, 1, 1, 1, 1,
0.661799, 0.01713425, 1.539377, 1, 1, 1, 1, 1,
0.6695025, 1.209874, -0.778857, 1, 1, 1, 1, 1,
0.6699795, 0.2961938, 1.74898, 1, 1, 1, 1, 1,
0.6819761, 1.135605, 0.4274371, 1, 1, 1, 1, 1,
0.682225, 0.6832016, -1.579367, 0, 0, 1, 1, 1,
0.6893706, 0.2752677, 1.139336, 1, 0, 0, 1, 1,
0.6920484, -1.306705, 4.034586, 1, 0, 0, 1, 1,
0.693948, 1.04948, 1.985174, 1, 0, 0, 1, 1,
0.7013513, -2.354381, 2.796036, 1, 0, 0, 1, 1,
0.7030583, 1.063032, 1.833557, 1, 0, 0, 1, 1,
0.7135102, -0.1797086, 1.252134, 0, 0, 0, 1, 1,
0.7148985, 1.047131, 0.05282972, 0, 0, 0, 1, 1,
0.7281958, -0.4983959, 0.6637515, 0, 0, 0, 1, 1,
0.7291911, 1.179944, 1.748119, 0, 0, 0, 1, 1,
0.7297377, -0.8469939, 2.061605, 0, 0, 0, 1, 1,
0.7315214, -0.6402547, 1.073508, 0, 0, 0, 1, 1,
0.7316827, -0.493306, 2.420558, 0, 0, 0, 1, 1,
0.7320292, -0.5754079, 3.231996, 1, 1, 1, 1, 1,
0.7321405, -0.1188506, 0.5995778, 1, 1, 1, 1, 1,
0.7334369, -1.561171, 3.553966, 1, 1, 1, 1, 1,
0.7366701, -1.504612, 2.700358, 1, 1, 1, 1, 1,
0.738004, -0.4707574, 1.506407, 1, 1, 1, 1, 1,
0.7419978, -2.335846, 0.9455125, 1, 1, 1, 1, 1,
0.7435573, 0.399088, 2.337327, 1, 1, 1, 1, 1,
0.7491421, -0.3206729, 0.8671146, 1, 1, 1, 1, 1,
0.7545425, 0.2185291, -0.4693611, 1, 1, 1, 1, 1,
0.7551564, 0.2559234, 0.9276227, 1, 1, 1, 1, 1,
0.7551858, -0.7391613, 2.373279, 1, 1, 1, 1, 1,
0.755307, 0.5941239, 1.697017, 1, 1, 1, 1, 1,
0.7567455, 1.499856, 1.528516, 1, 1, 1, 1, 1,
0.7603928, 0.07917938, 1.023864, 1, 1, 1, 1, 1,
0.7618647, 0.6179443, -0.01327043, 1, 1, 1, 1, 1,
0.7651743, 2.216234, -1.242282, 0, 0, 1, 1, 1,
0.7659327, 1.676108, 1.355614, 1, 0, 0, 1, 1,
0.7664901, 2.306803, 0.01556261, 1, 0, 0, 1, 1,
0.7673168, -0.2950497, 2.843134, 1, 0, 0, 1, 1,
0.7709351, -0.1029379, 3.25207, 1, 0, 0, 1, 1,
0.77198, -0.652867, 4.043228, 1, 0, 0, 1, 1,
0.7722728, -0.8211721, 3.039907, 0, 0, 0, 1, 1,
0.777867, -0.1295412, 2.325811, 0, 0, 0, 1, 1,
0.7788644, -0.1424435, -0.7360414, 0, 0, 0, 1, 1,
0.7850542, -1.044351, 2.344863, 0, 0, 0, 1, 1,
0.7855121, -1.369778, 3.98594, 0, 0, 0, 1, 1,
0.7910933, 0.5314822, 0.7436269, 0, 0, 0, 1, 1,
0.7952126, -0.5360608, 2.592348, 0, 0, 0, 1, 1,
0.7959434, 0.3977111, 1.884181, 1, 1, 1, 1, 1,
0.7987142, 1.252929, 3.130578, 1, 1, 1, 1, 1,
0.8007118, 1.756325, 0.04632429, 1, 1, 1, 1, 1,
0.8019614, 0.9369813, 0.7416694, 1, 1, 1, 1, 1,
0.8054252, 2.731313, 1.441025, 1, 1, 1, 1, 1,
0.8170908, 0.3666615, 0.1825454, 1, 1, 1, 1, 1,
0.8182198, 0.3094068, 1.189782, 1, 1, 1, 1, 1,
0.820343, 0.1686147, 0.5474951, 1, 1, 1, 1, 1,
0.8206384, 0.4867797, -0.04881723, 1, 1, 1, 1, 1,
0.8219137, 0.2159989, 1.940908, 1, 1, 1, 1, 1,
0.8294038, -2.296008, 3.934539, 1, 1, 1, 1, 1,
0.8355464, -1.248787, 3.147514, 1, 1, 1, 1, 1,
0.8574132, -1.33035, 3.117225, 1, 1, 1, 1, 1,
0.8599869, -1.242132, 3.777971, 1, 1, 1, 1, 1,
0.8614909, -1.13408, 2.772972, 1, 1, 1, 1, 1,
0.8649213, 1.833329, 0.5231691, 0, 0, 1, 1, 1,
0.8657972, -0.5777341, 2.92543, 1, 0, 0, 1, 1,
0.8671682, 0.1505386, 2.161271, 1, 0, 0, 1, 1,
0.8676666, -1.672199, 1.893183, 1, 0, 0, 1, 1,
0.8679402, 1.504975, 0.2590093, 1, 0, 0, 1, 1,
0.8685054, -0.2190154, 0.3009679, 1, 0, 0, 1, 1,
0.8691341, -1.448664, 3.175349, 0, 0, 0, 1, 1,
0.877957, -0.3624106, 2.759328, 0, 0, 0, 1, 1,
0.8805917, 2.456031, 0.6415439, 0, 0, 0, 1, 1,
0.8881756, -1.618147, 3.344544, 0, 0, 0, 1, 1,
0.8916603, 0.9132978, 2.278409, 0, 0, 0, 1, 1,
0.8967277, -1.60807, 3.580744, 0, 0, 0, 1, 1,
0.9102675, -1.626781, 2.399858, 0, 0, 0, 1, 1,
0.9249988, 1.243968, 0.9341835, 1, 1, 1, 1, 1,
0.9268851, 0.5836906, -1.715181, 1, 1, 1, 1, 1,
0.9278727, -0.7265546, 1.051798, 1, 1, 1, 1, 1,
0.9337533, 0.9440882, 1.093157, 1, 1, 1, 1, 1,
0.9377035, -1.363108, 2.900774, 1, 1, 1, 1, 1,
0.9394605, -0.6408249, 2.478548, 1, 1, 1, 1, 1,
0.9395996, -1.216882, 2.699174, 1, 1, 1, 1, 1,
0.9403324, 0.1940034, 0.3351848, 1, 1, 1, 1, 1,
0.9457154, -0.08156522, -0.3925838, 1, 1, 1, 1, 1,
0.9460558, -0.3961189, 3.345371, 1, 1, 1, 1, 1,
0.9494307, -2.562368, 4.716853, 1, 1, 1, 1, 1,
0.9541934, -2.18064, 1.830528, 1, 1, 1, 1, 1,
0.9573309, 1.199605, 0.1224069, 1, 1, 1, 1, 1,
0.9589, 2.142189, -0.4259523, 1, 1, 1, 1, 1,
0.9608417, 1.718942, 2.370821, 1, 1, 1, 1, 1,
0.9654063, 0.5375068, 2.109272, 0, 0, 1, 1, 1,
0.9718326, 1.542361, 2.019228, 1, 0, 0, 1, 1,
0.9739978, 1.596493, 0.9834062, 1, 0, 0, 1, 1,
0.9741088, 0.147834, 1.416005, 1, 0, 0, 1, 1,
0.9746386, -0.002763156, 1.439857, 1, 0, 0, 1, 1,
0.9804109, -1.432773, 3.06315, 1, 0, 0, 1, 1,
0.9847392, 0.2607885, 1.589023, 0, 0, 0, 1, 1,
0.9930885, -0.5195754, 1.790073, 0, 0, 0, 1, 1,
0.9980292, -0.5753221, 2.695208, 0, 0, 0, 1, 1,
0.9983706, -0.5793121, 1.295534, 0, 0, 0, 1, 1,
0.9993657, -1.014069, 1.46032, 0, 0, 0, 1, 1,
1.010351, -0.549434, 1.882658, 0, 0, 0, 1, 1,
1.01037, 1.691709, 1.437024, 0, 0, 0, 1, 1,
1.022398, -1.329203, 2.440482, 1, 1, 1, 1, 1,
1.025741, 1.028596, -0.2992827, 1, 1, 1, 1, 1,
1.035234, -0.1192976, 1.012128, 1, 1, 1, 1, 1,
1.042946, -1.089159, 4.292274, 1, 1, 1, 1, 1,
1.048709, 0.5169079, 0.0280193, 1, 1, 1, 1, 1,
1.051459, 1.9437, 1.512634, 1, 1, 1, 1, 1,
1.05241, 0.4724101, -0.2562464, 1, 1, 1, 1, 1,
1.055799, 0.7159216, 0.009901534, 1, 1, 1, 1, 1,
1.060229, 0.45726, 2.437442, 1, 1, 1, 1, 1,
1.060309, 2.727769, -1.436573, 1, 1, 1, 1, 1,
1.072775, -0.7533358, 1.451638, 1, 1, 1, 1, 1,
1.07291, -0.4586811, 2.684556, 1, 1, 1, 1, 1,
1.073295, 0.9603553, 0.3005152, 1, 1, 1, 1, 1,
1.073306, 0.3836495, 1.144683, 1, 1, 1, 1, 1,
1.076459, 0.5114822, 1.698013, 1, 1, 1, 1, 1,
1.088323, 2.276625, -0.3872524, 0, 0, 1, 1, 1,
1.089113, -0.1431289, 0.08753881, 1, 0, 0, 1, 1,
1.09225, 0.4013349, 4.0114, 1, 0, 0, 1, 1,
1.095361, -0.4339015, 1.930882, 1, 0, 0, 1, 1,
1.095405, 0.7566814, 1.431565, 1, 0, 0, 1, 1,
1.096715, -0.2854859, 2.343554, 1, 0, 0, 1, 1,
1.097343, 1.200635, 0.315985, 0, 0, 0, 1, 1,
1.099522, 0.8692114, 0.1336816, 0, 0, 0, 1, 1,
1.103585, -0.5545844, 3.239173, 0, 0, 0, 1, 1,
1.104005, -1.994659, 3.276199, 0, 0, 0, 1, 1,
1.109363, -0.9153475, 1.962236, 0, 0, 0, 1, 1,
1.109878, -0.4066057, 2.191888, 0, 0, 0, 1, 1,
1.111765, 1.436018, 1.269907, 0, 0, 0, 1, 1,
1.129179, -0.5644894, 2.046734, 1, 1, 1, 1, 1,
1.130406, 1.073934, 2.346865, 1, 1, 1, 1, 1,
1.136509, 1.050314, 0.7232489, 1, 1, 1, 1, 1,
1.143176, -1.295563, 3.07957, 1, 1, 1, 1, 1,
1.15149, 0.415131, 1.471168, 1, 1, 1, 1, 1,
1.153904, 0.7754374, -0.2340921, 1, 1, 1, 1, 1,
1.159032, 0.1273784, 2.583889, 1, 1, 1, 1, 1,
1.159563, 0.2240893, 0.8694609, 1, 1, 1, 1, 1,
1.16367, -1.178011, 2.74908, 1, 1, 1, 1, 1,
1.166003, 0.89428, -0.3735045, 1, 1, 1, 1, 1,
1.167187, -0.07042881, 1.37885, 1, 1, 1, 1, 1,
1.168486, 1.269854, 0.807619, 1, 1, 1, 1, 1,
1.178265, 0.9530618, -0.2937729, 1, 1, 1, 1, 1,
1.183812, 1.014329, -0.7181411, 1, 1, 1, 1, 1,
1.187458, -1.127024, 3.656936, 1, 1, 1, 1, 1,
1.198265, -1.139698, 1.251673, 0, 0, 1, 1, 1,
1.201668, -0.6893458, 0.2582549, 1, 0, 0, 1, 1,
1.204813, -2.386605, 4.090253, 1, 0, 0, 1, 1,
1.214498, 0.09085684, -1.003313, 1, 0, 0, 1, 1,
1.231627, -1.084113, 1.657412, 1, 0, 0, 1, 1,
1.234164, -1.664816, 2.854986, 1, 0, 0, 1, 1,
1.239002, 0.1359321, 1.951436, 0, 0, 0, 1, 1,
1.242389, -0.9214848, 2.801846, 0, 0, 0, 1, 1,
1.245889, -1.485279, 2.93128, 0, 0, 0, 1, 1,
1.246878, 1.166369, 0.7836787, 0, 0, 0, 1, 1,
1.25019, 1.533979, 1.847536, 0, 0, 0, 1, 1,
1.251281, 0.3806753, 0.821955, 0, 0, 0, 1, 1,
1.252235, -0.5009131, 1.088299, 0, 0, 0, 1, 1,
1.253993, -2.917735, 2.148437, 1, 1, 1, 1, 1,
1.25486, -0.0751435, 0.6994302, 1, 1, 1, 1, 1,
1.256907, 1.03568, 0.8031533, 1, 1, 1, 1, 1,
1.258356, -0.8305377, 1.817845, 1, 1, 1, 1, 1,
1.259764, -1.182588, 3.114132, 1, 1, 1, 1, 1,
1.259945, 0.4464184, 0.8156032, 1, 1, 1, 1, 1,
1.263922, -1.916238, 1.888917, 1, 1, 1, 1, 1,
1.271136, -0.6157677, 2.325334, 1, 1, 1, 1, 1,
1.28672, 1.791972, 0.6643128, 1, 1, 1, 1, 1,
1.28739, -0.330029, -0.4999297, 1, 1, 1, 1, 1,
1.288625, -0.7853901, 1.678399, 1, 1, 1, 1, 1,
1.296423, 0.5193558, 1.445531, 1, 1, 1, 1, 1,
1.296773, -1.919097, 0.05132809, 1, 1, 1, 1, 1,
1.297086, -0.9336516, 3.63287, 1, 1, 1, 1, 1,
1.307652, 1.303213, 0.8341877, 1, 1, 1, 1, 1,
1.315467, -0.5645765, 2.621446, 0, 0, 1, 1, 1,
1.321261, 1.785541, 0.8190033, 1, 0, 0, 1, 1,
1.328727, 1.176742, -1.48902, 1, 0, 0, 1, 1,
1.339285, -0.4224361, 1.119107, 1, 0, 0, 1, 1,
1.346133, 1.106599, 0.3642512, 1, 0, 0, 1, 1,
1.349401, -0.188561, 1.855554, 1, 0, 0, 1, 1,
1.352252, -0.343352, 2.895342, 0, 0, 0, 1, 1,
1.358675, 0.650286, 1.08315, 0, 0, 0, 1, 1,
1.36809, 1.066291, 0.6652886, 0, 0, 0, 1, 1,
1.368171, 0.6789849, 0.04026155, 0, 0, 0, 1, 1,
1.369665, 1.0528, 1.180825, 0, 0, 0, 1, 1,
1.387501, -0.04637435, 1.465999, 0, 0, 0, 1, 1,
1.388022, -0.5594095, 2.301741, 0, 0, 0, 1, 1,
1.390076, -1.037908, 2.837276, 1, 1, 1, 1, 1,
1.394383, 0.827393, 2.914437, 1, 1, 1, 1, 1,
1.396057, 0.4995048, 2.36051, 1, 1, 1, 1, 1,
1.396404, 0.1743035, 3.369985, 1, 1, 1, 1, 1,
1.406632, 0.9593784, 1.398739, 1, 1, 1, 1, 1,
1.407125, 0.03066595, 3.238738, 1, 1, 1, 1, 1,
1.407941, 0.4468882, -0.5446208, 1, 1, 1, 1, 1,
1.408584, 0.2653982, 1.858462, 1, 1, 1, 1, 1,
1.41531, -1.333816, 0.6285692, 1, 1, 1, 1, 1,
1.419253, -1.098205, 1.639019, 1, 1, 1, 1, 1,
1.424208, -0.7466815, 3.167165, 1, 1, 1, 1, 1,
1.431239, -0.8651093, 1.523211, 1, 1, 1, 1, 1,
1.453096, 0.2190292, 1.382656, 1, 1, 1, 1, 1,
1.465573, 0.009604747, 3.087717, 1, 1, 1, 1, 1,
1.480288, 0.06237058, 2.668992, 1, 1, 1, 1, 1,
1.483651, 0.2206968, 2.541162, 0, 0, 1, 1, 1,
1.485445, 0.88355, -0.2504209, 1, 0, 0, 1, 1,
1.495974, -0.5932478, 2.009195, 1, 0, 0, 1, 1,
1.499419, 0.7086318, 0.003062622, 1, 0, 0, 1, 1,
1.516752, 0.9415252, 0.1021497, 1, 0, 0, 1, 1,
1.52213, 0.890854, -0.3487573, 1, 0, 0, 1, 1,
1.536005, 0.6043893, -0.155498, 0, 0, 0, 1, 1,
1.536167, -0.4045545, 2.528298, 0, 0, 0, 1, 1,
1.538008, 1.424268, 1.979971, 0, 0, 0, 1, 1,
1.54104, -0.2140187, 2.281633, 0, 0, 0, 1, 1,
1.548808, -0.6927896, 1.049513, 0, 0, 0, 1, 1,
1.549263, -1.127554, 3.212371, 0, 0, 0, 1, 1,
1.556059, 2.147534, -0.2889088, 0, 0, 0, 1, 1,
1.575898, 1.084319, 1.281248, 1, 1, 1, 1, 1,
1.589878, -0.9533373, 2.645367, 1, 1, 1, 1, 1,
1.607404, -0.2363251, -0.8836496, 1, 1, 1, 1, 1,
1.612022, 0.5221945, 2.143523, 1, 1, 1, 1, 1,
1.613166, -1.194728, 3.705858, 1, 1, 1, 1, 1,
1.622767, 2.292306, 1.353988, 1, 1, 1, 1, 1,
1.629769, 1.359548, 0.08129734, 1, 1, 1, 1, 1,
1.630282, 1.849639, 0.2585394, 1, 1, 1, 1, 1,
1.64303, 0.01425067, 3.040496, 1, 1, 1, 1, 1,
1.643628, -2.540214, 3.629904, 1, 1, 1, 1, 1,
1.648812, -1.107462, 1.556046, 1, 1, 1, 1, 1,
1.649446, 0.8090972, 0.6913701, 1, 1, 1, 1, 1,
1.653472, 0.02961723, 3.091025, 1, 1, 1, 1, 1,
1.653476, 0.7335067, 1.097197, 1, 1, 1, 1, 1,
1.654014, -0.04176157, -0.6503403, 1, 1, 1, 1, 1,
1.65875, -2.340319, 3.004263, 0, 0, 1, 1, 1,
1.664158, 0.3459312, 1.768546, 1, 0, 0, 1, 1,
1.671312, 0.2774757, 1.710237, 1, 0, 0, 1, 1,
1.673189, -1.871338, 2.979661, 1, 0, 0, 1, 1,
1.676978, 0.01002713, 2.883293, 1, 0, 0, 1, 1,
1.682026, -0.3732356, 2.663778, 1, 0, 0, 1, 1,
1.694102, -1.439114, 0.6231341, 0, 0, 0, 1, 1,
1.697825, 0.9410876, 2.299217, 0, 0, 0, 1, 1,
1.703502, -0.001607549, -0.6150647, 0, 0, 0, 1, 1,
1.720985, -2.131215, 1.178066, 0, 0, 0, 1, 1,
1.730257, 0.4123541, 0.4021632, 0, 0, 0, 1, 1,
1.731078, 0.08981925, 1.727785, 0, 0, 0, 1, 1,
1.740167, -0.9812704, 2.228341, 0, 0, 0, 1, 1,
1.756166, -1.495088, 3.183158, 1, 1, 1, 1, 1,
1.773241, 0.667359, 1.640124, 1, 1, 1, 1, 1,
1.77621, 1.348802, 0.1743217, 1, 1, 1, 1, 1,
1.780737, -1.561422, 1.968631, 1, 1, 1, 1, 1,
1.784155, -0.01047477, 0.9843033, 1, 1, 1, 1, 1,
1.834564, 0.6291413, 2.690406, 1, 1, 1, 1, 1,
1.840245, -0.4068383, 0.9703541, 1, 1, 1, 1, 1,
1.865532, 0.05736109, 2.249227, 1, 1, 1, 1, 1,
1.871937, -1.49047, 1.683941, 1, 1, 1, 1, 1,
1.888836, 1.644745, 1.085316, 1, 1, 1, 1, 1,
1.910648, -1.281105, 3.082348, 1, 1, 1, 1, 1,
1.917718, 0.7621117, 0.1965125, 1, 1, 1, 1, 1,
1.919358, 0.6061731, 2.010216, 1, 1, 1, 1, 1,
1.922378, -0.6773708, 1.673242, 1, 1, 1, 1, 1,
1.930162, -1.289342, 0.8154612, 1, 1, 1, 1, 1,
1.936302, -1.007319, 1.276875, 0, 0, 1, 1, 1,
1.958325, -0.881054, 3.742703, 1, 0, 0, 1, 1,
1.963786, 0.6794542, -0.2357715, 1, 0, 0, 1, 1,
1.971625, -1.860046, 1.746743, 1, 0, 0, 1, 1,
1.98008, -0.67923, 1.912775, 1, 0, 0, 1, 1,
1.995232, -1.705459, 3.599203, 1, 0, 0, 1, 1,
2.022729, 2.133083, -0.4125523, 0, 0, 0, 1, 1,
2.084276, 0.4267259, 1.198128, 0, 0, 0, 1, 1,
2.156721, 1.567663, 1.414515, 0, 0, 0, 1, 1,
2.172041, -0.5630247, 0.7076222, 0, 0, 0, 1, 1,
2.201753, -1.024773, 3.153549, 0, 0, 0, 1, 1,
2.270733, -0.7862444, 1.069156, 0, 0, 0, 1, 1,
2.295132, -0.7766025, 1.152032, 0, 0, 0, 1, 1,
2.309847, -0.9177422, 2.184463, 1, 1, 1, 1, 1,
2.458886, -0.621287, 0.8021817, 1, 1, 1, 1, 1,
2.477422, 0.5276654, 1.939412, 1, 1, 1, 1, 1,
2.601395, 0.6080548, 2.679324, 1, 1, 1, 1, 1,
3.238683, -0.144459, 0.267598, 1, 1, 1, 1, 1,
3.263983, 0.3974278, 0.5526273, 1, 1, 1, 1, 1,
3.390365, 0.2325957, 2.034011, 1, 1, 1, 1, 1
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
var radius = 9.339227;
var distance = 32.80363;
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
mvMatrix.translate( -0.287711, 0.02190208, 0.05322862 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80363);
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
