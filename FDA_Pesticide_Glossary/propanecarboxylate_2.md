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
-3.004249, -0.8789396, -1.764875, 1, 0, 0, 1,
-2.647757, -0.8946912, -1.460813, 1, 0.007843138, 0, 1,
-2.642809, -0.5440691, -1.579198, 1, 0.01176471, 0, 1,
-2.625715, -0.5641094, -1.499687, 1, 0.01960784, 0, 1,
-2.608709, 0.765888, -2.325908, 1, 0.02352941, 0, 1,
-2.561925, -1.036158, -1.289594, 1, 0.03137255, 0, 1,
-2.54207, 0.2002581, 0.04812649, 1, 0.03529412, 0, 1,
-2.513216, -0.1933484, -1.476779, 1, 0.04313726, 0, 1,
-2.502759, 0.2804457, -3.912982, 1, 0.04705882, 0, 1,
-2.428337, -0.03371416, -3.781488, 1, 0.05490196, 0, 1,
-2.328865, 0.507979, -1.1923, 1, 0.05882353, 0, 1,
-2.321983, 0.4701521, -1.937295, 1, 0.06666667, 0, 1,
-2.309394, 0.4806728, -1.427156, 1, 0.07058824, 0, 1,
-2.253678, -1.143634, -1.292418, 1, 0.07843138, 0, 1,
-2.249538, -1.318238, -3.351597, 1, 0.08235294, 0, 1,
-2.246782, -1.051069, -0.6938146, 1, 0.09019608, 0, 1,
-2.196404, -0.09635352, -2.082458, 1, 0.09411765, 0, 1,
-2.183302, 0.8658222, -0.0827757, 1, 0.1019608, 0, 1,
-2.169966, 0.4002022, -1.626315, 1, 0.1098039, 0, 1,
-2.16485, -1.977687, -2.698507, 1, 0.1137255, 0, 1,
-2.15492, 0.8141634, 0.3418366, 1, 0.1215686, 0, 1,
-2.149123, -1.658158, -1.863734, 1, 0.1254902, 0, 1,
-2.110507, 1.696835, -0.3540766, 1, 0.1333333, 0, 1,
-2.09181, 1.131918, 0.4261715, 1, 0.1372549, 0, 1,
-2.078109, -0.8120827, -1.506251, 1, 0.145098, 0, 1,
-2.076984, 0.1822656, -1.872582, 1, 0.1490196, 0, 1,
-2.068054, 0.1437871, -1.048496, 1, 0.1568628, 0, 1,
-2.055659, -0.2129576, -3.292071, 1, 0.1607843, 0, 1,
-2.044791, -1.072238, -1.652687, 1, 0.1686275, 0, 1,
-2.029093, 0.9370142, -1.698381, 1, 0.172549, 0, 1,
-2.020881, -2.79685, -1.11913, 1, 0.1803922, 0, 1,
-2.014582, 0.6614757, 1.527097, 1, 0.1843137, 0, 1,
-1.992136, 0.1058533, -0.4419025, 1, 0.1921569, 0, 1,
-1.983681, 0.2487015, -1.563141, 1, 0.1960784, 0, 1,
-1.980926, 0.2558883, -1.908996, 1, 0.2039216, 0, 1,
-1.9747, -1.183035, -2.499633, 1, 0.2117647, 0, 1,
-1.96434, 0.5257694, -1.15932, 1, 0.2156863, 0, 1,
-1.96172, 0.3682525, -0.675056, 1, 0.2235294, 0, 1,
-1.958196, -0.3225052, -2.51303, 1, 0.227451, 0, 1,
-1.950773, -1.396992, -2.750989, 1, 0.2352941, 0, 1,
-1.893747, -0.5981869, -2.410609, 1, 0.2392157, 0, 1,
-1.866329, 0.0744909, -1.028761, 1, 0.2470588, 0, 1,
-1.860663, -0.2302396, -2.600407, 1, 0.2509804, 0, 1,
-1.812099, 0.1326962, -1.049024, 1, 0.2588235, 0, 1,
-1.784176, 0.8290899, -1.656592, 1, 0.2627451, 0, 1,
-1.777393, -0.6465812, -1.54625, 1, 0.2705882, 0, 1,
-1.772038, -0.1860566, -0.5791201, 1, 0.2745098, 0, 1,
-1.769451, 0.6227446, -1.473114, 1, 0.282353, 0, 1,
-1.747975, 1.292255, -2.072048, 1, 0.2862745, 0, 1,
-1.740175, 1.382786, 1.684055, 1, 0.2941177, 0, 1,
-1.732044, -0.4272055, -1.566519, 1, 0.3019608, 0, 1,
-1.719043, 0.7796866, -0.9647682, 1, 0.3058824, 0, 1,
-1.687847, -0.5033885, -3.038506, 1, 0.3137255, 0, 1,
-1.687099, -2.840674, -4.082013, 1, 0.3176471, 0, 1,
-1.675758, 0.4390269, -1.466254, 1, 0.3254902, 0, 1,
-1.664979, -0.3119723, -2.527303, 1, 0.3294118, 0, 1,
-1.662611, -0.05150205, -2.686267, 1, 0.3372549, 0, 1,
-1.659662, -0.002882465, -0.5424483, 1, 0.3411765, 0, 1,
-1.648355, -0.3957672, -1.197738, 1, 0.3490196, 0, 1,
-1.643282, 0.5018754, 0.1853207, 1, 0.3529412, 0, 1,
-1.63761, -0.7222362, -0.5696577, 1, 0.3607843, 0, 1,
-1.627709, 0.1991737, -3.535398, 1, 0.3647059, 0, 1,
-1.621673, 0.593918, -2.033985, 1, 0.372549, 0, 1,
-1.608083, -1.244617, -1.696321, 1, 0.3764706, 0, 1,
-1.604855, 0.007346383, -2.057077, 1, 0.3843137, 0, 1,
-1.59936, 2.728489, -0.5527701, 1, 0.3882353, 0, 1,
-1.592586, 0.04791661, -1.483612, 1, 0.3960784, 0, 1,
-1.574675, -0.7621178, -2.696494, 1, 0.4039216, 0, 1,
-1.573847, -0.6142079, -2.437923, 1, 0.4078431, 0, 1,
-1.569118, -1.248337, -2.73406, 1, 0.4156863, 0, 1,
-1.562505, -1.452135, -1.28538, 1, 0.4196078, 0, 1,
-1.560426, 0.3904135, -1.531043, 1, 0.427451, 0, 1,
-1.559372, 1.462839, -1.422168, 1, 0.4313726, 0, 1,
-1.553594, -2.391378, -4.804303, 1, 0.4392157, 0, 1,
-1.550443, 0.6142862, -4.238214, 1, 0.4431373, 0, 1,
-1.542933, 1.37926, -1.176602, 1, 0.4509804, 0, 1,
-1.542767, 0.9987271, -1.924828, 1, 0.454902, 0, 1,
-1.531024, -2.821311, -2.289397, 1, 0.4627451, 0, 1,
-1.525335, -1.322257, -2.93622, 1, 0.4666667, 0, 1,
-1.519513, -1.133416, -2.156763, 1, 0.4745098, 0, 1,
-1.517228, 0.399735, -2.040056, 1, 0.4784314, 0, 1,
-1.513973, -0.9964703, -2.238301, 1, 0.4862745, 0, 1,
-1.513005, -0.3894995, -3.020597, 1, 0.4901961, 0, 1,
-1.496501, -0.9146196, -1.883094, 1, 0.4980392, 0, 1,
-1.480176, -1.166944, -1.353815, 1, 0.5058824, 0, 1,
-1.47976, 0.9153971, -0.6386356, 1, 0.509804, 0, 1,
-1.477451, 0.4084948, -1.300995, 1, 0.5176471, 0, 1,
-1.471262, -1.227901, -2.918419, 1, 0.5215687, 0, 1,
-1.468703, 1.536237, -1.490272, 1, 0.5294118, 0, 1,
-1.447577, -0.8925733, -1.076627, 1, 0.5333334, 0, 1,
-1.442971, -1.045739, -1.372896, 1, 0.5411765, 0, 1,
-1.440522, 0.02956306, -2.801923, 1, 0.5450981, 0, 1,
-1.427415, -0.1719778, -1.213199, 1, 0.5529412, 0, 1,
-1.422621, 0.05715566, -2.708929, 1, 0.5568628, 0, 1,
-1.41864, 0.719409, -0.4882363, 1, 0.5647059, 0, 1,
-1.417865, 1.137834, -0.3881422, 1, 0.5686275, 0, 1,
-1.411492, 0.6880776, -0.1519299, 1, 0.5764706, 0, 1,
-1.408685, -1.089533, -2.237648, 1, 0.5803922, 0, 1,
-1.407026, -0.7822543, -2.739719, 1, 0.5882353, 0, 1,
-1.407019, -0.8591507, -0.2405501, 1, 0.5921569, 0, 1,
-1.378986, -2.059589, -3.311686, 1, 0.6, 0, 1,
-1.369588, 1.540159, -1.076708, 1, 0.6078432, 0, 1,
-1.364522, -0.6492514, -1.9547, 1, 0.6117647, 0, 1,
-1.363376, 0.1454738, -0.6237539, 1, 0.6196079, 0, 1,
-1.342559, 0.3615837, -2.0393, 1, 0.6235294, 0, 1,
-1.338398, -0.5979733, -1.220277, 1, 0.6313726, 0, 1,
-1.336602, 0.07413521, -0.3954301, 1, 0.6352941, 0, 1,
-1.32496, -0.6579659, -3.419141, 1, 0.6431373, 0, 1,
-1.321528, -0.9424316, -2.856077, 1, 0.6470588, 0, 1,
-1.321255, -0.6396105, -1.216221, 1, 0.654902, 0, 1,
-1.30817, 0.08001231, 0.3013189, 1, 0.6588235, 0, 1,
-1.303003, 0.201203, -2.712416, 1, 0.6666667, 0, 1,
-1.300746, -1.115015, -2.828815, 1, 0.6705883, 0, 1,
-1.297524, 2.084809, -0.9962385, 1, 0.6784314, 0, 1,
-1.293006, -1.430503, -3.445688, 1, 0.682353, 0, 1,
-1.288923, 0.2937998, -1.139824, 1, 0.6901961, 0, 1,
-1.287329, -1.064954, -1.905848, 1, 0.6941177, 0, 1,
-1.280575, 0.1376395, -2.363847, 1, 0.7019608, 0, 1,
-1.278084, -1.553862, -2.738207, 1, 0.7098039, 0, 1,
-1.274998, -1.767479, -2.732544, 1, 0.7137255, 0, 1,
-1.2582, 1.623142, -1.344424, 1, 0.7215686, 0, 1,
-1.254053, -0.6348501, -2.814779, 1, 0.7254902, 0, 1,
-1.252029, 0.07522903, -1.147225, 1, 0.7333333, 0, 1,
-1.251673, 0.9135943, -0.9676298, 1, 0.7372549, 0, 1,
-1.247175, -0.4244275, -1.741583, 1, 0.7450981, 0, 1,
-1.24393, -0.9249427, -2.138211, 1, 0.7490196, 0, 1,
-1.236002, -0.6145736, -1.899574, 1, 0.7568628, 0, 1,
-1.224309, 1.76412, -0.7118667, 1, 0.7607843, 0, 1,
-1.22276, -0.6570178, -2.613664, 1, 0.7686275, 0, 1,
-1.221933, 0.6515076, 0.390909, 1, 0.772549, 0, 1,
-1.215733, 0.2063525, -1.443042, 1, 0.7803922, 0, 1,
-1.212812, -0.4638791, -2.631212, 1, 0.7843137, 0, 1,
-1.209848, 0.877997, -2.242481, 1, 0.7921569, 0, 1,
-1.199677, -0.02217652, 0.07729546, 1, 0.7960784, 0, 1,
-1.198257, -1.298936, -3.136059, 1, 0.8039216, 0, 1,
-1.194566, 1.054265, -0.8734456, 1, 0.8117647, 0, 1,
-1.182438, -1.687984, -0.7609559, 1, 0.8156863, 0, 1,
-1.181588, 0.460023, -0.8297002, 1, 0.8235294, 0, 1,
-1.174766, -0.8822557, -2.406432, 1, 0.827451, 0, 1,
-1.170138, 1.29336, -1.763587, 1, 0.8352941, 0, 1,
-1.167821, -0.09960079, -3.261032, 1, 0.8392157, 0, 1,
-1.167573, -0.5877627, -3.874381, 1, 0.8470588, 0, 1,
-1.161437, -1.11688, -2.203933, 1, 0.8509804, 0, 1,
-1.159243, -1.496597, -2.096984, 1, 0.8588235, 0, 1,
-1.151509, -1.754837, -0.3338284, 1, 0.8627451, 0, 1,
-1.143058, 1.492396, -0.5223496, 1, 0.8705882, 0, 1,
-1.139491, 0.0781491, -2.552785, 1, 0.8745098, 0, 1,
-1.123244, 1.559491, 0.1155483, 1, 0.8823529, 0, 1,
-1.115125, 0.6180918, -0.3973012, 1, 0.8862745, 0, 1,
-1.110284, -0.1050371, -1.357776, 1, 0.8941177, 0, 1,
-1.08606, 1.223813, -2.298529, 1, 0.8980392, 0, 1,
-1.085041, -0.2624753, -1.621869, 1, 0.9058824, 0, 1,
-1.076323, -0.6363468, -3.019902, 1, 0.9137255, 0, 1,
-1.066391, 0.2681544, -1.691634, 1, 0.9176471, 0, 1,
-1.06008, 1.311487, -0.8938522, 1, 0.9254902, 0, 1,
-1.056847, 0.08931475, -0.7969139, 1, 0.9294118, 0, 1,
-1.046122, 0.5692335, -1.189963, 1, 0.9372549, 0, 1,
-1.044982, 1.969069, -0.7796422, 1, 0.9411765, 0, 1,
-1.036184, 2.698222, 0.1945854, 1, 0.9490196, 0, 1,
-1.029552, 1.165323, 0.3318921, 1, 0.9529412, 0, 1,
-1.017516, -0.25298, -2.639622, 1, 0.9607843, 0, 1,
-1.010082, 0.7500821, -2.264986, 1, 0.9647059, 0, 1,
-1.00606, 0.4985949, -0.413887, 1, 0.972549, 0, 1,
-1.003423, -2.328565, -3.04197, 1, 0.9764706, 0, 1,
-0.9950722, 2.674741, -1.732523, 1, 0.9843137, 0, 1,
-0.9797259, -0.3614145, -0.9710127, 1, 0.9882353, 0, 1,
-0.9770685, -1.576528, -2.386545, 1, 0.9960784, 0, 1,
-0.9768602, -0.7883022, -2.423119, 0.9960784, 1, 0, 1,
-0.9686788, 0.5893301, -1.785736, 0.9921569, 1, 0, 1,
-0.958836, 0.3003952, -1.295249, 0.9843137, 1, 0, 1,
-0.9560979, -2.046936, -3.482554, 0.9803922, 1, 0, 1,
-0.9550323, -0.2685717, -1.696983, 0.972549, 1, 0, 1,
-0.9538339, -0.4138367, -1.795508, 0.9686275, 1, 0, 1,
-0.9517817, 0.9755787, 0.6830491, 0.9607843, 1, 0, 1,
-0.9484872, -2.162583, -2.197186, 0.9568627, 1, 0, 1,
-0.9483159, 0.8469447, -1.93045, 0.9490196, 1, 0, 1,
-0.9370591, 1.301556, -0.5645902, 0.945098, 1, 0, 1,
-0.9313773, 0.1139487, -1.046589, 0.9372549, 1, 0, 1,
-0.9309535, -0.7541863, -1.684208, 0.9333333, 1, 0, 1,
-0.9197773, 0.4646836, -1.357401, 0.9254902, 1, 0, 1,
-0.9139248, -2.411326, -0.6941161, 0.9215686, 1, 0, 1,
-0.9085807, -0.5242915, -2.382694, 0.9137255, 1, 0, 1,
-0.9036158, 0.01180653, -2.092622, 0.9098039, 1, 0, 1,
-0.9032111, -0.04419733, -1.071677, 0.9019608, 1, 0, 1,
-0.9014562, -1.10311, -2.221253, 0.8941177, 1, 0, 1,
-0.8857071, -0.5865313, -2.043964, 0.8901961, 1, 0, 1,
-0.885551, 0.3109711, -1.135993, 0.8823529, 1, 0, 1,
-0.8850537, -0.1706268, -1.867302, 0.8784314, 1, 0, 1,
-0.8836387, 0.321894, -0.807461, 0.8705882, 1, 0, 1,
-0.8782328, 0.9784266, -0.7369358, 0.8666667, 1, 0, 1,
-0.8781217, -0.3517225, -1.750209, 0.8588235, 1, 0, 1,
-0.8731072, 0.8993605, -0.5629027, 0.854902, 1, 0, 1,
-0.871062, -0.7650005, -3.1417, 0.8470588, 1, 0, 1,
-0.8691203, 0.6447744, -0.7045622, 0.8431373, 1, 0, 1,
-0.8623852, -0.9121672, -1.094964, 0.8352941, 1, 0, 1,
-0.8623746, -0.4535299, -1.087775, 0.8313726, 1, 0, 1,
-0.8619127, -0.1002382, -1.966595, 0.8235294, 1, 0, 1,
-0.8585725, 1.544733, -1.020005, 0.8196079, 1, 0, 1,
-0.8552358, 0.3156635, -1.564226, 0.8117647, 1, 0, 1,
-0.8536267, -0.007150545, -1.701722, 0.8078431, 1, 0, 1,
-0.8485807, 1.076311, -1.811722, 0.8, 1, 0, 1,
-0.8449063, 1.947841, -1.61807, 0.7921569, 1, 0, 1,
-0.8445126, 1.57312, 1.056026, 0.7882353, 1, 0, 1,
-0.844434, -0.6808234, -1.40793, 0.7803922, 1, 0, 1,
-0.8439648, 0.1046477, -1.678286, 0.7764706, 1, 0, 1,
-0.8433885, -0.1882517, -1.476649, 0.7686275, 1, 0, 1,
-0.8416687, -0.7312816, -2.306014, 0.7647059, 1, 0, 1,
-0.8392404, 0.06833571, -2.45613, 0.7568628, 1, 0, 1,
-0.8369651, -0.7167049, -3.234912, 0.7529412, 1, 0, 1,
-0.83122, 0.1559599, -1.870151, 0.7450981, 1, 0, 1,
-0.8305597, -0.3079139, -3.003849, 0.7411765, 1, 0, 1,
-0.8283235, -0.4418156, -2.124769, 0.7333333, 1, 0, 1,
-0.8278389, 0.4714441, -0.6576447, 0.7294118, 1, 0, 1,
-0.8274863, 1.078387, -0.8663836, 0.7215686, 1, 0, 1,
-0.8269524, 0.8394603, -1.633849, 0.7176471, 1, 0, 1,
-0.8070672, 0.8953872, -1.435622, 0.7098039, 1, 0, 1,
-0.8043892, 0.2974933, -2.449239, 0.7058824, 1, 0, 1,
-0.7971298, -1.145095, -2.112194, 0.6980392, 1, 0, 1,
-0.7964226, -0.5965819, -1.617543, 0.6901961, 1, 0, 1,
-0.7956755, 0.3650794, -1.478366, 0.6862745, 1, 0, 1,
-0.7956524, -0.04527135, -2.933108, 0.6784314, 1, 0, 1,
-0.7948778, -0.6554002, -1.498111, 0.6745098, 1, 0, 1,
-0.7935999, 0.4751652, -2.47612, 0.6666667, 1, 0, 1,
-0.7922499, -0.6050962, -2.517683, 0.6627451, 1, 0, 1,
-0.7889107, -0.668002, -1.167934, 0.654902, 1, 0, 1,
-0.7874013, 1.921811, 1.106952, 0.6509804, 1, 0, 1,
-0.7848686, -0.06074153, -0.4838444, 0.6431373, 1, 0, 1,
-0.7833149, -0.5094546, -1.845066, 0.6392157, 1, 0, 1,
-0.7811726, 1.057904, 0.6781342, 0.6313726, 1, 0, 1,
-0.7760302, -1.200044, -2.550962, 0.627451, 1, 0, 1,
-0.7728001, 0.5694642, -1.385642, 0.6196079, 1, 0, 1,
-0.7722396, 0.4832092, -1.317209, 0.6156863, 1, 0, 1,
-0.769963, -1.127384, -4.005864, 0.6078432, 1, 0, 1,
-0.7606262, -1.796614, -3.233773, 0.6039216, 1, 0, 1,
-0.7584602, -2.164551, -1.29423, 0.5960785, 1, 0, 1,
-0.7520698, -1.501095, -1.845087, 0.5882353, 1, 0, 1,
-0.7495783, -0.8946805, -1.075428, 0.5843138, 1, 0, 1,
-0.748431, -0.1153397, -1.081114, 0.5764706, 1, 0, 1,
-0.7442217, 1.030372, -0.8420479, 0.572549, 1, 0, 1,
-0.7433081, 0.4520623, -0.5865018, 0.5647059, 1, 0, 1,
-0.7394652, 0.6387904, -0.2665211, 0.5607843, 1, 0, 1,
-0.7295869, -0.4542393, -0.2794783, 0.5529412, 1, 0, 1,
-0.7255935, -0.7358294, -2.830928, 0.5490196, 1, 0, 1,
-0.7243971, 1.324573, -2.560973, 0.5411765, 1, 0, 1,
-0.7190137, 0.71863, -1.662625, 0.5372549, 1, 0, 1,
-0.718933, 0.5986386, -0.8959218, 0.5294118, 1, 0, 1,
-0.716037, -1.249969, -2.828732, 0.5254902, 1, 0, 1,
-0.7140593, -0.4766458, -1.216998, 0.5176471, 1, 0, 1,
-0.7120487, 0.5467248, -1.848182, 0.5137255, 1, 0, 1,
-0.7100844, -0.2300885, -2.531541, 0.5058824, 1, 0, 1,
-0.7069575, 0.7571957, -0.1542579, 0.5019608, 1, 0, 1,
-0.7065035, 0.207679, -0.1364496, 0.4941176, 1, 0, 1,
-0.7034575, 0.1102986, -1.454027, 0.4862745, 1, 0, 1,
-0.7015989, 1.045976, -0.8904148, 0.4823529, 1, 0, 1,
-0.6977832, 0.1961937, -0.8207198, 0.4745098, 1, 0, 1,
-0.6967002, 0.3686329, -0.539466, 0.4705882, 1, 0, 1,
-0.6941918, 0.01043584, 0.4025152, 0.4627451, 1, 0, 1,
-0.6863834, -0.4519911, -3.743549, 0.4588235, 1, 0, 1,
-0.6859482, 1.170901, 0.3083865, 0.4509804, 1, 0, 1,
-0.6858858, -0.5936862, -1.464348, 0.4470588, 1, 0, 1,
-0.6852043, 0.04658977, -2.170532, 0.4392157, 1, 0, 1,
-0.6780973, -1.664234, -2.383087, 0.4352941, 1, 0, 1,
-0.6768326, 0.07122953, -1.476646, 0.427451, 1, 0, 1,
-0.6681873, -0.5143194, 0.1207507, 0.4235294, 1, 0, 1,
-0.6576256, 0.8924892, -2.385774, 0.4156863, 1, 0, 1,
-0.6535661, -1.668377, -2.107474, 0.4117647, 1, 0, 1,
-0.6535463, -0.2473229, -2.853943, 0.4039216, 1, 0, 1,
-0.6487448, 1.253232, -0.6012818, 0.3960784, 1, 0, 1,
-0.6482851, 0.3513157, -1.996301, 0.3921569, 1, 0, 1,
-0.6468009, -0.1533505, -0.5717812, 0.3843137, 1, 0, 1,
-0.6442086, -1.386712, -2.97609, 0.3803922, 1, 0, 1,
-0.6417426, 1.102229, 0.1405532, 0.372549, 1, 0, 1,
-0.6375801, 0.8282281, 0.05364659, 0.3686275, 1, 0, 1,
-0.6343256, 0.6751499, -1.082554, 0.3607843, 1, 0, 1,
-0.6321884, -0.380428, -1.982722, 0.3568628, 1, 0, 1,
-0.6189845, -1.303017, -2.910615, 0.3490196, 1, 0, 1,
-0.616347, 1.10113, -0.6264142, 0.345098, 1, 0, 1,
-0.6156248, -0.4985995, -2.616074, 0.3372549, 1, 0, 1,
-0.6107848, -0.4952251, -1.879956, 0.3333333, 1, 0, 1,
-0.6068613, 0.849677, -2.129651, 0.3254902, 1, 0, 1,
-0.603908, 0.6119662, -1.409531, 0.3215686, 1, 0, 1,
-0.6003438, -1.388695, -2.717358, 0.3137255, 1, 0, 1,
-0.596568, 0.723451, 0.7384869, 0.3098039, 1, 0, 1,
-0.595509, 0.4526687, -0.3710209, 0.3019608, 1, 0, 1,
-0.5884456, -0.5198277, -2.422242, 0.2941177, 1, 0, 1,
-0.5859659, -0.195619, -2.412142, 0.2901961, 1, 0, 1,
-0.5838233, 0.3589615, 0.5318125, 0.282353, 1, 0, 1,
-0.5793853, 0.1192906, -2.703284, 0.2784314, 1, 0, 1,
-0.5741177, -1.622538, -2.151326, 0.2705882, 1, 0, 1,
-0.5732604, 1.106564, -0.8540187, 0.2666667, 1, 0, 1,
-0.5706202, 1.370152, -0.2114526, 0.2588235, 1, 0, 1,
-0.5676646, -0.8003249, -3.050851, 0.254902, 1, 0, 1,
-0.5664758, -0.9778707, -3.045225, 0.2470588, 1, 0, 1,
-0.5581945, 0.8017529, 0.9027108, 0.2431373, 1, 0, 1,
-0.5562876, -1.533518, -3.892029, 0.2352941, 1, 0, 1,
-0.555611, 0.4517115, 0.2640678, 0.2313726, 1, 0, 1,
-0.5510846, -1.067614, -3.310004, 0.2235294, 1, 0, 1,
-0.5508482, -0.6636375, -1.986398, 0.2196078, 1, 0, 1,
-0.5505072, -0.1615506, -3.297815, 0.2117647, 1, 0, 1,
-0.5464678, -1.485711, -1.148706, 0.2078431, 1, 0, 1,
-0.5415225, -0.1349224, -2.15988, 0.2, 1, 0, 1,
-0.5277436, -0.5771666, -1.648568, 0.1921569, 1, 0, 1,
-0.5183482, 0.6545198, -0.5337134, 0.1882353, 1, 0, 1,
-0.499946, 0.2213998, -1.760576, 0.1803922, 1, 0, 1,
-0.4983078, 1.82099, 0.04247539, 0.1764706, 1, 0, 1,
-0.4971428, -0.5974878, -2.199979, 0.1686275, 1, 0, 1,
-0.4954337, -0.6894187, -2.240143, 0.1647059, 1, 0, 1,
-0.489292, 0.1833462, -3.217691, 0.1568628, 1, 0, 1,
-0.4825613, 1.105841, -0.6921426, 0.1529412, 1, 0, 1,
-0.481005, 0.5775388, -1.988423, 0.145098, 1, 0, 1,
-0.4764922, -0.441283, -4.066541, 0.1411765, 1, 0, 1,
-0.472614, -1.633, -2.177392, 0.1333333, 1, 0, 1,
-0.4722447, -0.5051147, -3.672999, 0.1294118, 1, 0, 1,
-0.4715145, -0.2216339, -3.085053, 0.1215686, 1, 0, 1,
-0.4682476, 0.1766844, -1.210972, 0.1176471, 1, 0, 1,
-0.4633175, 0.3128097, -1.799152, 0.1098039, 1, 0, 1,
-0.4525352, -2.123592, -4.176748, 0.1058824, 1, 0, 1,
-0.4484869, 1.115216, 0.6280291, 0.09803922, 1, 0, 1,
-0.4476453, 1.742063, -1.087175, 0.09019608, 1, 0, 1,
-0.447304, -0.7696233, -0.2158168, 0.08627451, 1, 0, 1,
-0.4470794, 1.659111, -0.6078799, 0.07843138, 1, 0, 1,
-0.4373696, 0.7226607, -1.587743, 0.07450981, 1, 0, 1,
-0.4363859, -0.7678722, -2.941857, 0.06666667, 1, 0, 1,
-0.4357116, 1.840011, -1.617064, 0.0627451, 1, 0, 1,
-0.4329284, 1.215397, -0.56045, 0.05490196, 1, 0, 1,
-0.4318762, -0.2003965, -1.592345, 0.05098039, 1, 0, 1,
-0.4283357, -1.854542, -3.647021, 0.04313726, 1, 0, 1,
-0.4224597, -0.09096383, 0.1164888, 0.03921569, 1, 0, 1,
-0.4174353, 0.4614519, -1.415177, 0.03137255, 1, 0, 1,
-0.4153798, -0.7975624, -1.155211, 0.02745098, 1, 0, 1,
-0.4131868, 1.882816, -0.09439643, 0.01960784, 1, 0, 1,
-0.4058433, -1.876593, -3.055028, 0.01568628, 1, 0, 1,
-0.4026226, 0.09598229, -1.307717, 0.007843138, 1, 0, 1,
-0.3998166, 0.1708904, -1.172558, 0.003921569, 1, 0, 1,
-0.3983509, 1.580482, -1.702224, 0, 1, 0.003921569, 1,
-0.3934816, -0.0474667, -2.271172, 0, 1, 0.01176471, 1,
-0.3919776, 0.9633888, -0.3816929, 0, 1, 0.01568628, 1,
-0.3808555, 2.374648, 0.85542, 0, 1, 0.02352941, 1,
-0.3788366, 1.146802, -0.2032877, 0, 1, 0.02745098, 1,
-0.3775204, 0.3750837, 0.04157891, 0, 1, 0.03529412, 1,
-0.373873, 0.7051875, -0.326671, 0, 1, 0.03921569, 1,
-0.3712724, -1.063648, -4.006018, 0, 1, 0.04705882, 1,
-0.370399, -1.658284, -2.788212, 0, 1, 0.05098039, 1,
-0.3702892, -0.09066737, -3.876412, 0, 1, 0.05882353, 1,
-0.3691591, -2.167047, -4.639221, 0, 1, 0.0627451, 1,
-0.3689426, -0.7858725, -2.769211, 0, 1, 0.07058824, 1,
-0.3676482, 0.09506233, 0.3999725, 0, 1, 0.07450981, 1,
-0.3657555, 0.9014285, 0.3232249, 0, 1, 0.08235294, 1,
-0.3641148, -0.369059, -1.870329, 0, 1, 0.08627451, 1,
-0.3631225, -0.0495253, -2.133962, 0, 1, 0.09411765, 1,
-0.3628119, -1.000733, -1.38674, 0, 1, 0.1019608, 1,
-0.3627603, -0.4904296, -2.16246, 0, 1, 0.1058824, 1,
-0.3609821, -0.4640687, 0.2508836, 0, 1, 0.1137255, 1,
-0.3547995, 0.5719736, -1.626222, 0, 1, 0.1176471, 1,
-0.3488156, 0.2327666, -0.3056984, 0, 1, 0.1254902, 1,
-0.3486307, 0.1765132, -0.8351688, 0, 1, 0.1294118, 1,
-0.3449398, 0.821643, -2.143259, 0, 1, 0.1372549, 1,
-0.3395528, 1.175821, -0.7361283, 0, 1, 0.1411765, 1,
-0.337002, 0.2243307, 0.09463363, 0, 1, 0.1490196, 1,
-0.3359461, 0.07670319, -0.2038719, 0, 1, 0.1529412, 1,
-0.3357194, 0.6393021, 0.5291977, 0, 1, 0.1607843, 1,
-0.3315595, 0.1313395, -0.1960927, 0, 1, 0.1647059, 1,
-0.3136877, 0.9447901, -0.3163125, 0, 1, 0.172549, 1,
-0.3108265, 0.4717195, -0.1677587, 0, 1, 0.1764706, 1,
-0.3077388, 1.040558, -0.2433672, 0, 1, 0.1843137, 1,
-0.3053347, -0.1359575, -2.961806, 0, 1, 0.1882353, 1,
-0.3041298, -0.9852216, -3.679169, 0, 1, 0.1960784, 1,
-0.3028359, -1.358593, -3.574704, 0, 1, 0.2039216, 1,
-0.2978023, 0.4493161, 0.1543804, 0, 1, 0.2078431, 1,
-0.2961991, -0.02517403, -0.6755875, 0, 1, 0.2156863, 1,
-0.2950402, -0.1166593, -1.243625, 0, 1, 0.2196078, 1,
-0.2947571, 1.362301, -0.5360748, 0, 1, 0.227451, 1,
-0.2917645, -0.5605418, -0.9342746, 0, 1, 0.2313726, 1,
-0.2881339, -0.168771, -0.9689905, 0, 1, 0.2392157, 1,
-0.2870429, -0.3251761, -1.635185, 0, 1, 0.2431373, 1,
-0.2847772, 2.786959, 0.8346923, 0, 1, 0.2509804, 1,
-0.2805421, 0.3090815, -0.3283237, 0, 1, 0.254902, 1,
-0.2752535, -0.3734775, -2.677999, 0, 1, 0.2627451, 1,
-0.2737475, 0.6028522, -0.8663073, 0, 1, 0.2666667, 1,
-0.2735012, -1.21744, -2.501485, 0, 1, 0.2745098, 1,
-0.273416, -3.218865, -1.86044, 0, 1, 0.2784314, 1,
-0.2700855, 0.2286053, -0.1024626, 0, 1, 0.2862745, 1,
-0.2671365, -0.009151022, 0.6077355, 0, 1, 0.2901961, 1,
-0.2630474, 0.6902055, -0.6758174, 0, 1, 0.2980392, 1,
-0.2627892, -1.511518, -4.126013, 0, 1, 0.3058824, 1,
-0.2555588, 0.2936728, -0.09388592, 0, 1, 0.3098039, 1,
-0.2474357, 0.1745819, -0.4156749, 0, 1, 0.3176471, 1,
-0.2450263, 0.2451917, -0.811673, 0, 1, 0.3215686, 1,
-0.2408242, 0.6680675, 1.23485, 0, 1, 0.3294118, 1,
-0.2376992, 1.438566, 0.6960931, 0, 1, 0.3333333, 1,
-0.2373019, 2.206283, -0.7785419, 0, 1, 0.3411765, 1,
-0.2354818, 0.9320149, 1.01867, 0, 1, 0.345098, 1,
-0.2302861, -0.005552672, -1.982665, 0, 1, 0.3529412, 1,
-0.2270939, -0.2302264, -1.419291, 0, 1, 0.3568628, 1,
-0.2270554, -0.9944744, -1.767212, 0, 1, 0.3647059, 1,
-0.226547, -0.285653, -2.20393, 0, 1, 0.3686275, 1,
-0.2236805, 2.086564, 0.2124175, 0, 1, 0.3764706, 1,
-0.2213942, -0.6795707, -1.782259, 0, 1, 0.3803922, 1,
-0.2171135, -1.164744, -2.893674, 0, 1, 0.3882353, 1,
-0.2157147, -0.07019348, -0.5413994, 0, 1, 0.3921569, 1,
-0.212358, 0.2306094, -0.8933211, 0, 1, 0.4, 1,
-0.2123095, -0.08128351, -1.482171, 0, 1, 0.4078431, 1,
-0.2062212, -1.416319, -2.720102, 0, 1, 0.4117647, 1,
-0.2024582, 0.154385, -4.421767, 0, 1, 0.4196078, 1,
-0.2010014, 1.461638, 0.03385439, 0, 1, 0.4235294, 1,
-0.1981009, 0.1588842, 0.8956186, 0, 1, 0.4313726, 1,
-0.1978527, -0.102364, -0.9386023, 0, 1, 0.4352941, 1,
-0.1974757, 1.838236, -0.3393556, 0, 1, 0.4431373, 1,
-0.1946217, -0.4196818, -1.925705, 0, 1, 0.4470588, 1,
-0.1868377, -1.766017, -3.404999, 0, 1, 0.454902, 1,
-0.1856729, -0.2666477, -2.386454, 0, 1, 0.4588235, 1,
-0.1853818, -1.053827, -3.536917, 0, 1, 0.4666667, 1,
-0.1826174, 0.005343549, -1.794895, 0, 1, 0.4705882, 1,
-0.1814717, -1.523795, -3.74268, 0, 1, 0.4784314, 1,
-0.17749, 0.1393306, -0.3124376, 0, 1, 0.4823529, 1,
-0.1759571, -0.2089487, -2.129725, 0, 1, 0.4901961, 1,
-0.1731606, 0.4313096, -0.4454578, 0, 1, 0.4941176, 1,
-0.1700579, 1.914463, 0.900181, 0, 1, 0.5019608, 1,
-0.1690864, 1.759171, -1.300543, 0, 1, 0.509804, 1,
-0.1685992, 0.4189387, -0.646349, 0, 1, 0.5137255, 1,
-0.1632175, -0.881272, -3.228698, 0, 1, 0.5215687, 1,
-0.1616184, 0.7433715, -1.052113, 0, 1, 0.5254902, 1,
-0.1593096, -1.13296, -2.917211, 0, 1, 0.5333334, 1,
-0.1590197, 2.187938, -0.1341398, 0, 1, 0.5372549, 1,
-0.1578238, 0.8157138, -0.4055385, 0, 1, 0.5450981, 1,
-0.156965, 0.3327895, -2.663057, 0, 1, 0.5490196, 1,
-0.1473414, 0.6089256, 0.680801, 0, 1, 0.5568628, 1,
-0.1419961, 0.9036283, -0.4319842, 0, 1, 0.5607843, 1,
-0.1330525, 0.6662834, -0.9067751, 0, 1, 0.5686275, 1,
-0.1328668, -0.5819362, -2.947645, 0, 1, 0.572549, 1,
-0.1314238, -0.3707805, -0.9840541, 0, 1, 0.5803922, 1,
-0.1283096, 0.0533737, -2.158401, 0, 1, 0.5843138, 1,
-0.1260885, 0.04738481, -2.012117, 0, 1, 0.5921569, 1,
-0.1237161, -0.9752086, -2.730209, 0, 1, 0.5960785, 1,
-0.1223987, 0.3427962, 0.4378007, 0, 1, 0.6039216, 1,
-0.121855, 0.589054, -0.5390947, 0, 1, 0.6117647, 1,
-0.1189122, 0.06295353, -1.179805, 0, 1, 0.6156863, 1,
-0.1186809, -1.345972, -1.867711, 0, 1, 0.6235294, 1,
-0.1183736, 1.495937, 0.9302124, 0, 1, 0.627451, 1,
-0.1161296, -0.4921979, -2.898797, 0, 1, 0.6352941, 1,
-0.1134261, -1.105481, -2.162148, 0, 1, 0.6392157, 1,
-0.1111801, -0.5910383, -1.457435, 0, 1, 0.6470588, 1,
-0.1110132, 0.1822501, -1.761259, 0, 1, 0.6509804, 1,
-0.109637, -0.8220212, -2.421773, 0, 1, 0.6588235, 1,
-0.1064875, 0.4782529, -0.2606451, 0, 1, 0.6627451, 1,
-0.103399, -0.5292063, -3.084663, 0, 1, 0.6705883, 1,
-0.1033761, 0.4879355, -2.503774, 0, 1, 0.6745098, 1,
-0.1023893, 0.3558351, 0.637494, 0, 1, 0.682353, 1,
-0.1019909, -1.775795, -3.525288, 0, 1, 0.6862745, 1,
-0.1005851, -1.12123, -1.442541, 0, 1, 0.6941177, 1,
-0.1005559, 0.8094795, -0.4424308, 0, 1, 0.7019608, 1,
-0.09977045, 0.00847037, -0.4571561, 0, 1, 0.7058824, 1,
-0.09789445, -0.1260198, -1.416952, 0, 1, 0.7137255, 1,
-0.09479318, 1.929723, 0.195827, 0, 1, 0.7176471, 1,
-0.09257592, 0.2740748, -0.2112688, 0, 1, 0.7254902, 1,
-0.09229168, -0.2329945, -1.614053, 0, 1, 0.7294118, 1,
-0.09180408, 1.908876, -0.6137515, 0, 1, 0.7372549, 1,
-0.0876172, -0.2249194, -3.633796, 0, 1, 0.7411765, 1,
-0.08758757, 0.1211146, -0.440538, 0, 1, 0.7490196, 1,
-0.0862018, -0.09308653, -3.019665, 0, 1, 0.7529412, 1,
-0.08546383, -0.348232, -4.094742, 0, 1, 0.7607843, 1,
-0.08511692, 2.547644, 0.2209595, 0, 1, 0.7647059, 1,
-0.07870085, 1.19122, 0.5795278, 0, 1, 0.772549, 1,
-0.076905, -1.381388, -4.54068, 0, 1, 0.7764706, 1,
-0.07493392, 0.8827441, 0.124056, 0, 1, 0.7843137, 1,
-0.07466738, 0.01625583, -1.060616, 0, 1, 0.7882353, 1,
-0.07452635, 0.4523679, -0.05299692, 0, 1, 0.7960784, 1,
-0.07375327, 0.3831553, 1.22953, 0, 1, 0.8039216, 1,
-0.07312528, 1.295935, 0.837813, 0, 1, 0.8078431, 1,
-0.06710499, -0.128557, -2.629164, 0, 1, 0.8156863, 1,
-0.06625113, -0.2672288, -1.97317, 0, 1, 0.8196079, 1,
-0.06558529, -1.956089, -3.12056, 0, 1, 0.827451, 1,
-0.06198868, 0.7338417, 0.783631, 0, 1, 0.8313726, 1,
-0.05627435, -0.7552259, -3.173509, 0, 1, 0.8392157, 1,
-0.05146364, 0.5729915, -1.016405, 0, 1, 0.8431373, 1,
-0.04808668, 0.2674769, -0.5852851, 0, 1, 0.8509804, 1,
-0.04443043, 0.7296802, 1.888494, 0, 1, 0.854902, 1,
-0.04428596, -0.471918, -2.19375, 0, 1, 0.8627451, 1,
-0.04300044, 0.4716503, -0.4381475, 0, 1, 0.8666667, 1,
-0.03936057, -1.080349, -2.722403, 0, 1, 0.8745098, 1,
-0.03904948, -1.753765, -4.182786, 0, 1, 0.8784314, 1,
-0.03792069, -0.2308554, -2.088895, 0, 1, 0.8862745, 1,
-0.03773857, 0.2401477, -1.106688, 0, 1, 0.8901961, 1,
-0.03153041, 0.4307644, 0.2385619, 0, 1, 0.8980392, 1,
-0.03009993, -0.9899848, -4.088054, 0, 1, 0.9058824, 1,
-0.02813892, 0.5014992, -1.84296, 0, 1, 0.9098039, 1,
-0.02775363, -0.6772203, -3.422705, 0, 1, 0.9176471, 1,
-0.0250008, -0.4494629, -3.937721, 0, 1, 0.9215686, 1,
-0.02284549, 0.643399, 0.4775323, 0, 1, 0.9294118, 1,
-0.02003708, 1.693632, -0.3357096, 0, 1, 0.9333333, 1,
-0.01943075, -0.4838868, -3.1933, 0, 1, 0.9411765, 1,
-0.0189695, 1.760738, -0.7798514, 0, 1, 0.945098, 1,
-0.01153121, -0.6685712, -2.479917, 0, 1, 0.9529412, 1,
-0.0102177, -3.111348, -2.220689, 0, 1, 0.9568627, 1,
-0.009753715, -0.7603493, -0.4548782, 0, 1, 0.9647059, 1,
-0.006315088, -0.5166364, -3.257746, 0, 1, 0.9686275, 1,
-0.002516555, -1.008205, -3.286657, 0, 1, 0.9764706, 1,
-0.001988897, 1.992226, -1.873177, 0, 1, 0.9803922, 1,
-0.0003030829, 0.2444823, -0.9715597, 0, 1, 0.9882353, 1,
0.00850602, 0.05892972, 0.2584051, 0, 1, 0.9921569, 1,
0.01153987, 1.291794, 0.181641, 0, 1, 1, 1,
0.0123436, 0.7491791, -1.597932, 0, 0.9921569, 1, 1,
0.01275513, -0.2368251, 1.868464, 0, 0.9882353, 1, 1,
0.01694035, -0.4738725, 3.44862, 0, 0.9803922, 1, 1,
0.02176384, 1.510451, 1.027107, 0, 0.9764706, 1, 1,
0.02269498, -2.084486, 1.932275, 0, 0.9686275, 1, 1,
0.0229523, -1.825644, 2.460817, 0, 0.9647059, 1, 1,
0.02983734, -2.482203, 3.891071, 0, 0.9568627, 1, 1,
0.03111703, 1.33469, 0.01060857, 0, 0.9529412, 1, 1,
0.04091391, 0.4510224, -0.2873011, 0, 0.945098, 1, 1,
0.04123275, -1.588734, 2.449601, 0, 0.9411765, 1, 1,
0.04258804, 0.7736218, -2.96525, 0, 0.9333333, 1, 1,
0.04339263, 0.8599374, -0.5438485, 0, 0.9294118, 1, 1,
0.04434993, -0.2336418, 2.530516, 0, 0.9215686, 1, 1,
0.04946287, -0.6456726, 3.467968, 0, 0.9176471, 1, 1,
0.05422683, -1.14905, 4.086066, 0, 0.9098039, 1, 1,
0.06039935, 0.3864917, 0.02813437, 0, 0.9058824, 1, 1,
0.06112735, 1.00554, 0.4338425, 0, 0.8980392, 1, 1,
0.06239515, 0.04240833, 3.523609, 0, 0.8901961, 1, 1,
0.06402164, 0.3292865, 0.06087695, 0, 0.8862745, 1, 1,
0.06545917, -0.1927718, 4.983693, 0, 0.8784314, 1, 1,
0.06547223, 0.8831191, -0.1139346, 0, 0.8745098, 1, 1,
0.06764525, -0.8256583, 2.618172, 0, 0.8666667, 1, 1,
0.07725228, -0.329113, 2.076091, 0, 0.8627451, 1, 1,
0.08514193, 0.1609946, -1.451374, 0, 0.854902, 1, 1,
0.08535556, 1.140887, -1.191126, 0, 0.8509804, 1, 1,
0.08715094, -3.042414, 2.603754, 0, 0.8431373, 1, 1,
0.0894553, 0.3596296, -0.1026125, 0, 0.8392157, 1, 1,
0.09003171, 0.4834739, -1.885956, 0, 0.8313726, 1, 1,
0.1085272, -0.1651491, 1.67614, 0, 0.827451, 1, 1,
0.1089364, 1.846173, 0.7426889, 0, 0.8196079, 1, 1,
0.1137323, 0.0477959, 1.155017, 0, 0.8156863, 1, 1,
0.1142458, 0.6894585, -1.422206, 0, 0.8078431, 1, 1,
0.1147996, 0.8318692, -1.819144, 0, 0.8039216, 1, 1,
0.1152455, 0.7665693, 0.3126369, 0, 0.7960784, 1, 1,
0.1207542, -0.331894, 4.835061, 0, 0.7882353, 1, 1,
0.12523, 0.3337857, -0.2141176, 0, 0.7843137, 1, 1,
0.1259779, 0.8430789, 1.197137, 0, 0.7764706, 1, 1,
0.1272567, 0.7405348, -0.6886135, 0, 0.772549, 1, 1,
0.1282288, -1.076066, 2.072534, 0, 0.7647059, 1, 1,
0.1296616, -1.226526, 3.115626, 0, 0.7607843, 1, 1,
0.1312748, 1.119501, 0.5113798, 0, 0.7529412, 1, 1,
0.1322339, -0.1553349, 3.844787, 0, 0.7490196, 1, 1,
0.1322757, -1.521438, 2.521879, 0, 0.7411765, 1, 1,
0.1354464, 1.169845, 0.169334, 0, 0.7372549, 1, 1,
0.1437504, -0.2103868, 3.436783, 0, 0.7294118, 1, 1,
0.1451807, 0.5387022, -2.743362, 0, 0.7254902, 1, 1,
0.14646, 1.99046, -0.5014077, 0, 0.7176471, 1, 1,
0.1469963, 0.2543545, 1.286668, 0, 0.7137255, 1, 1,
0.1511456, 0.0004673443, 1.554424, 0, 0.7058824, 1, 1,
0.1565713, 1.21351, -0.4507308, 0, 0.6980392, 1, 1,
0.1613112, 0.5250414, -0.6094728, 0, 0.6941177, 1, 1,
0.1633004, 1.375298, -1.253708, 0, 0.6862745, 1, 1,
0.1655505, 0.6903242, 0.2272163, 0, 0.682353, 1, 1,
0.1704112, -1.442469, 2.873392, 0, 0.6745098, 1, 1,
0.1732619, 1.430417, -0.4048269, 0, 0.6705883, 1, 1,
0.1777731, 1.581953, 0.2869155, 0, 0.6627451, 1, 1,
0.1816667, -0.453339, 1.954526, 0, 0.6588235, 1, 1,
0.1838855, 1.023929, 1.657185, 0, 0.6509804, 1, 1,
0.1919205, 0.7309545, -0.3603637, 0, 0.6470588, 1, 1,
0.1933964, -0.2607408, 5.086673, 0, 0.6392157, 1, 1,
0.1953799, 0.7056201, -0.9777097, 0, 0.6352941, 1, 1,
0.1992296, 0.331271, 0.1493231, 0, 0.627451, 1, 1,
0.2033767, 0.6051093, -1.018577, 0, 0.6235294, 1, 1,
0.2053207, -1.207079, 3.2795, 0, 0.6156863, 1, 1,
0.2078941, 1.145226, -0.1967776, 0, 0.6117647, 1, 1,
0.2115846, -0.5447282, 3.079861, 0, 0.6039216, 1, 1,
0.2159707, -0.762962, 3.341869, 0, 0.5960785, 1, 1,
0.2162537, 1.645179, -0.2964322, 0, 0.5921569, 1, 1,
0.2185603, 1.862072, -1.923956, 0, 0.5843138, 1, 1,
0.2266819, -0.738946, 1.639058, 0, 0.5803922, 1, 1,
0.2369796, 0.3368045, -0.2571958, 0, 0.572549, 1, 1,
0.2384676, -0.823632, 2.971438, 0, 0.5686275, 1, 1,
0.2388995, 0.3567446, 1.667294, 0, 0.5607843, 1, 1,
0.240305, 0.64449, -0.2187647, 0, 0.5568628, 1, 1,
0.2427252, -1.166573, 2.528918, 0, 0.5490196, 1, 1,
0.2442381, -1.27766, 2.130892, 0, 0.5450981, 1, 1,
0.2599811, 0.1177861, 0.0791331, 0, 0.5372549, 1, 1,
0.2601454, -0.4685127, 3.219155, 0, 0.5333334, 1, 1,
0.2618526, 0.1697129, -0.2992801, 0, 0.5254902, 1, 1,
0.2630501, 0.6238835, -1.062946, 0, 0.5215687, 1, 1,
0.2661309, -0.3814442, 1.541205, 0, 0.5137255, 1, 1,
0.2699571, -1.833388, 2.383454, 0, 0.509804, 1, 1,
0.2701924, -0.07928166, 3.608654, 0, 0.5019608, 1, 1,
0.2710179, 0.3706237, -0.2656783, 0, 0.4941176, 1, 1,
0.2715194, -0.5016977, 3.095257, 0, 0.4901961, 1, 1,
0.2734251, 0.1206338, 1.033234, 0, 0.4823529, 1, 1,
0.2755785, 0.3655144, 0.5554169, 0, 0.4784314, 1, 1,
0.2779147, 1.485209, 0.79807, 0, 0.4705882, 1, 1,
0.2845061, -0.8025926, 3.358959, 0, 0.4666667, 1, 1,
0.2846431, -0.3140184, 2.639022, 0, 0.4588235, 1, 1,
0.2979308, 1.278154, -1.932365, 0, 0.454902, 1, 1,
0.2979609, -0.7897552, 1.98394, 0, 0.4470588, 1, 1,
0.2997178, -1.650251, 2.786284, 0, 0.4431373, 1, 1,
0.3006904, -0.2426222, 0.3402521, 0, 0.4352941, 1, 1,
0.3046647, 0.1386571, 0.3156444, 0, 0.4313726, 1, 1,
0.3059939, 1.731104, 0.6735188, 0, 0.4235294, 1, 1,
0.3063165, 1.90277, -0.2101126, 0, 0.4196078, 1, 1,
0.3082694, -1.635293, 3.784289, 0, 0.4117647, 1, 1,
0.3122334, -0.7449554, 1.740824, 0, 0.4078431, 1, 1,
0.3158349, -0.149014, 4.277414, 0, 0.4, 1, 1,
0.3189453, 0.5950344, 0.7085338, 0, 0.3921569, 1, 1,
0.3206114, -0.106818, 1.841148, 0, 0.3882353, 1, 1,
0.320743, 1.218223, -0.4989176, 0, 0.3803922, 1, 1,
0.3222087, -0.8444985, 2.963451, 0, 0.3764706, 1, 1,
0.3259973, 0.1907664, 2.206962, 0, 0.3686275, 1, 1,
0.3319247, -0.1281077, 2.745296, 0, 0.3647059, 1, 1,
0.3326145, -1.682829, 2.298569, 0, 0.3568628, 1, 1,
0.3328438, 0.1427202, 0.9267728, 0, 0.3529412, 1, 1,
0.3343504, 1.094755, 0.8862962, 0, 0.345098, 1, 1,
0.3351173, -0.4360318, 2.1206, 0, 0.3411765, 1, 1,
0.3386292, 0.3434167, 0.7193065, 0, 0.3333333, 1, 1,
0.3408459, -0.5335637, 2.031768, 0, 0.3294118, 1, 1,
0.3439091, -0.7170944, 2.285516, 0, 0.3215686, 1, 1,
0.346244, 1.247607, -0.6167984, 0, 0.3176471, 1, 1,
0.3479156, -0.7614849, 1.379362, 0, 0.3098039, 1, 1,
0.3523192, -1.243243, 4.623901, 0, 0.3058824, 1, 1,
0.3538133, -0.9754333, 1.586788, 0, 0.2980392, 1, 1,
0.3540113, 0.298807, 0.7796132, 0, 0.2901961, 1, 1,
0.3584805, -1.13447, 4.254773, 0, 0.2862745, 1, 1,
0.3606794, 0.9278016, -0.6300324, 0, 0.2784314, 1, 1,
0.3678029, -1.117841, 3.298717, 0, 0.2745098, 1, 1,
0.3715425, 0.4275677, 0.6439222, 0, 0.2666667, 1, 1,
0.3725675, -0.2114493, 1.980396, 0, 0.2627451, 1, 1,
0.3881102, 0.4769771, 1.338113, 0, 0.254902, 1, 1,
0.3911789, 1.112511, 1.445628, 0, 0.2509804, 1, 1,
0.3978414, 0.6269626, -0.02206471, 0, 0.2431373, 1, 1,
0.4029283, -0.3415839, 1.777724, 0, 0.2392157, 1, 1,
0.4048347, 1.133856, 1.142765, 0, 0.2313726, 1, 1,
0.4075308, 0.6037882, 1.736617, 0, 0.227451, 1, 1,
0.4099487, 0.4186206, 0.08776715, 0, 0.2196078, 1, 1,
0.4117481, -0.71986, 1.044731, 0, 0.2156863, 1, 1,
0.4146391, 0.4966814, 0.8286747, 0, 0.2078431, 1, 1,
0.4156037, 0.5068063, 2.183741, 0, 0.2039216, 1, 1,
0.4167791, 0.4022551, 0.3032021, 0, 0.1960784, 1, 1,
0.4192828, 0.520989, -0.06485171, 0, 0.1882353, 1, 1,
0.4194921, -0.7601735, -0.1193694, 0, 0.1843137, 1, 1,
0.4201165, 1.523284, -2.53969, 0, 0.1764706, 1, 1,
0.4272763, -1.006412, 2.060219, 0, 0.172549, 1, 1,
0.4320433, -0.2842591, 2.572245, 0, 0.1647059, 1, 1,
0.4355638, -0.3036165, 1.489747, 0, 0.1607843, 1, 1,
0.4428372, 0.5043474, 2.678882, 0, 0.1529412, 1, 1,
0.443092, 1.267581, -0.8711181, 0, 0.1490196, 1, 1,
0.4447572, 0.6856873, 1.949842, 0, 0.1411765, 1, 1,
0.4462988, -1.214346, 2.352222, 0, 0.1372549, 1, 1,
0.4490846, -0.6302803, 2.356987, 0, 0.1294118, 1, 1,
0.4502607, 0.09389019, 2.936972, 0, 0.1254902, 1, 1,
0.4533766, -0.2004592, 1.927748, 0, 0.1176471, 1, 1,
0.4537328, -1.226411, 1.758068, 0, 0.1137255, 1, 1,
0.4554859, -0.1374668, 2.605165, 0, 0.1058824, 1, 1,
0.4561674, 0.783846, 0.1494174, 0, 0.09803922, 1, 1,
0.4581318, 0.2573854, -1.101578, 0, 0.09411765, 1, 1,
0.4581566, 0.08844004, 1.103407, 0, 0.08627451, 1, 1,
0.4636335, 0.2165568, 1.598854, 0, 0.08235294, 1, 1,
0.4701079, -1.134952, 2.917133, 0, 0.07450981, 1, 1,
0.4711572, 0.922336, 0.8597447, 0, 0.07058824, 1, 1,
0.4718224, 0.1985145, 1.292676, 0, 0.0627451, 1, 1,
0.4735688, 0.5364925, 0.4030112, 0, 0.05882353, 1, 1,
0.4802585, -0.8073519, 3.194368, 0, 0.05098039, 1, 1,
0.4806739, 0.2683766, -0.1641396, 0, 0.04705882, 1, 1,
0.4812167, -1.751547, 3.683173, 0, 0.03921569, 1, 1,
0.4880131, -1.060725, 1.954118, 0, 0.03529412, 1, 1,
0.4909917, 1.081658, -0.3808295, 0, 0.02745098, 1, 1,
0.4939537, -0.1024, 0.9056243, 0, 0.02352941, 1, 1,
0.4965017, -0.3480411, 2.739741, 0, 0.01568628, 1, 1,
0.4979227, 0.9381432, 0.3250819, 0, 0.01176471, 1, 1,
0.5064829, -0.6215484, 3.008166, 0, 0.003921569, 1, 1,
0.5073954, -0.4620624, 1.577497, 0.003921569, 0, 1, 1,
0.5112433, 0.7951421, -1.264029, 0.007843138, 0, 1, 1,
0.513926, -0.4122191, 2.626256, 0.01568628, 0, 1, 1,
0.5156369, 1.076856, 0.1444336, 0.01960784, 0, 1, 1,
0.5181885, -0.08428766, 0.9603325, 0.02745098, 0, 1, 1,
0.5188355, 0.9145041, 0.2391661, 0.03137255, 0, 1, 1,
0.5217701, 0.4953667, 0.4288914, 0.03921569, 0, 1, 1,
0.5238466, -0.653271, 1.162202, 0.04313726, 0, 1, 1,
0.5240736, 0.3471862, 0.5565506, 0.05098039, 0, 1, 1,
0.5329773, 2.351731, 1.232268, 0.05490196, 0, 1, 1,
0.5351934, -0.824195, 1.574621, 0.0627451, 0, 1, 1,
0.5381754, -0.3642042, 0.8067423, 0.06666667, 0, 1, 1,
0.5475973, -0.9124655, 1.991256, 0.07450981, 0, 1, 1,
0.5486438, -1.469283, 4.50995, 0.07843138, 0, 1, 1,
0.5492215, -0.5555486, 1.509346, 0.08627451, 0, 1, 1,
0.5515701, -0.05548311, 3.345518, 0.09019608, 0, 1, 1,
0.5545123, -0.2060217, 0.5198532, 0.09803922, 0, 1, 1,
0.5610367, -0.7738294, 2.043729, 0.1058824, 0, 1, 1,
0.5644801, 0.4913257, 0.3770856, 0.1098039, 0, 1, 1,
0.5716148, 1.328348, -0.6788788, 0.1176471, 0, 1, 1,
0.5735597, 2.305092, 0.1875729, 0.1215686, 0, 1, 1,
0.5770442, -1.93869, 4.055488, 0.1294118, 0, 1, 1,
0.5842854, 0.08964636, 1.34975, 0.1333333, 0, 1, 1,
0.5867057, 0.1391164, 0.1239445, 0.1411765, 0, 1, 1,
0.5916101, 0.7077504, 0.6094311, 0.145098, 0, 1, 1,
0.5931964, -1.256384, 3.443959, 0.1529412, 0, 1, 1,
0.5983943, -1.007428, 2.950523, 0.1568628, 0, 1, 1,
0.6012923, -0.8390672, 2.426462, 0.1647059, 0, 1, 1,
0.6015524, -0.3651382, 3.566307, 0.1686275, 0, 1, 1,
0.6025938, -0.1987229, 1.065533, 0.1764706, 0, 1, 1,
0.6046922, -0.101124, 0.647419, 0.1803922, 0, 1, 1,
0.6049151, 0.09151078, 3.453466, 0.1882353, 0, 1, 1,
0.6049919, 0.6291112, 1.734551, 0.1921569, 0, 1, 1,
0.6112249, -0.1372734, 0.9542578, 0.2, 0, 1, 1,
0.6119764, -1.210974, 3.757351, 0.2078431, 0, 1, 1,
0.6136841, -0.1068133, 1.461848, 0.2117647, 0, 1, 1,
0.6156484, -2.561898, 2.862018, 0.2196078, 0, 1, 1,
0.6212143, 0.5190117, 0.7614466, 0.2235294, 0, 1, 1,
0.6245138, 0.1799626, 1.336904, 0.2313726, 0, 1, 1,
0.6254938, 0.1849136, 1.501016, 0.2352941, 0, 1, 1,
0.6256688, 2.725134, 0.4441423, 0.2431373, 0, 1, 1,
0.6319748, 2.52982, 1.169301, 0.2470588, 0, 1, 1,
0.63256, -0.3683481, 1.715311, 0.254902, 0, 1, 1,
0.6400715, -0.8276258, 1.048958, 0.2588235, 0, 1, 1,
0.6416136, 1.096052, 0.6205155, 0.2666667, 0, 1, 1,
0.6423879, -0.08021274, 1.394527, 0.2705882, 0, 1, 1,
0.6430041, -0.3828092, 2.595515, 0.2784314, 0, 1, 1,
0.6437172, 2.303395, -0.1240967, 0.282353, 0, 1, 1,
0.6451976, -1.56123, 1.234524, 0.2901961, 0, 1, 1,
0.6459633, -1.194653, 2.514983, 0.2941177, 0, 1, 1,
0.6507316, 1.603305, -0.2041095, 0.3019608, 0, 1, 1,
0.6532093, 2.180459, 0.8787879, 0.3098039, 0, 1, 1,
0.653472, -0.2371871, 1.812935, 0.3137255, 0, 1, 1,
0.6537821, -0.6436681, 1.705043, 0.3215686, 0, 1, 1,
0.6594229, -0.3897954, 1.912918, 0.3254902, 0, 1, 1,
0.6608739, -1.736527, 2.869937, 0.3333333, 0, 1, 1,
0.661005, -1.403977, 2.876308, 0.3372549, 0, 1, 1,
0.6624228, 0.1132965, 1.513432, 0.345098, 0, 1, 1,
0.6717872, -0.2224428, 3.106155, 0.3490196, 0, 1, 1,
0.6741111, -0.4991305, 1.77407, 0.3568628, 0, 1, 1,
0.6756244, -1.160452, 1.597364, 0.3607843, 0, 1, 1,
0.6777965, 1.057848, -0.5010007, 0.3686275, 0, 1, 1,
0.6848037, -0.1190557, 1.946953, 0.372549, 0, 1, 1,
0.6848436, -1.519632, 2.924974, 0.3803922, 0, 1, 1,
0.6867313, 1.080511, -0.04664657, 0.3843137, 0, 1, 1,
0.688831, -0.1702667, 1.108197, 0.3921569, 0, 1, 1,
0.6918592, 0.178881, 1.121214, 0.3960784, 0, 1, 1,
0.6924912, 0.1613581, 1.996797, 0.4039216, 0, 1, 1,
0.692701, -0.06843924, 3.075767, 0.4117647, 0, 1, 1,
0.7011271, -0.1460719, 0.9561044, 0.4156863, 0, 1, 1,
0.7072943, 0.6052022, 1.046692, 0.4235294, 0, 1, 1,
0.7079315, -1.03625, 0.7515755, 0.427451, 0, 1, 1,
0.708103, -1.5531, 1.664386, 0.4352941, 0, 1, 1,
0.7086228, -0.8387678, 1.146346, 0.4392157, 0, 1, 1,
0.7087886, -0.4251465, 4.124149, 0.4470588, 0, 1, 1,
0.7098994, 1.242175, -1.431353, 0.4509804, 0, 1, 1,
0.7101154, 0.7019957, 0.6881768, 0.4588235, 0, 1, 1,
0.7107679, 0.4551468, 0.9726526, 0.4627451, 0, 1, 1,
0.7119693, 0.2015069, 2.186986, 0.4705882, 0, 1, 1,
0.7149554, -0.03116753, 2.559167, 0.4745098, 0, 1, 1,
0.7155656, 0.4880134, 0.5365619, 0.4823529, 0, 1, 1,
0.7166165, 1.887371, -1.264549, 0.4862745, 0, 1, 1,
0.7207943, 1.685092, 2.169128, 0.4941176, 0, 1, 1,
0.7291489, -0.5444842, 2.66565, 0.5019608, 0, 1, 1,
0.7351381, -1.828883, 3.839452, 0.5058824, 0, 1, 1,
0.739723, 0.9582088, 0.9674152, 0.5137255, 0, 1, 1,
0.742151, 0.6350273, 0.2434853, 0.5176471, 0, 1, 1,
0.7431102, 0.001911315, 1.261059, 0.5254902, 0, 1, 1,
0.7471975, -1.102167, 1.380023, 0.5294118, 0, 1, 1,
0.7474869, -1.386652, 2.064164, 0.5372549, 0, 1, 1,
0.747976, -0.1782804, 1.881467, 0.5411765, 0, 1, 1,
0.750304, 0.2860723, 0.5987106, 0.5490196, 0, 1, 1,
0.7531404, -0.3740361, 1.347752, 0.5529412, 0, 1, 1,
0.7565416, -1.224267, 2.612842, 0.5607843, 0, 1, 1,
0.7574971, -2.364044, 3.467728, 0.5647059, 0, 1, 1,
0.7588927, 0.1879134, 2.65889, 0.572549, 0, 1, 1,
0.7594125, -1.322536, 3.269345, 0.5764706, 0, 1, 1,
0.7597974, -0.08878372, 2.56977, 0.5843138, 0, 1, 1,
0.7653334, 1.309296, 0.846565, 0.5882353, 0, 1, 1,
0.7687149, -1.453284, 2.454184, 0.5960785, 0, 1, 1,
0.7727051, 0.6622737, -0.1646147, 0.6039216, 0, 1, 1,
0.7760315, -1.19304, 0.1763266, 0.6078432, 0, 1, 1,
0.7787802, -0.3582489, 3.635952, 0.6156863, 0, 1, 1,
0.7794135, -0.2488714, 2.062793, 0.6196079, 0, 1, 1,
0.7795321, -0.1562313, 1.90746, 0.627451, 0, 1, 1,
0.7816216, 0.4180269, -0.2619488, 0.6313726, 0, 1, 1,
0.7850195, -0.04414846, 0.8528446, 0.6392157, 0, 1, 1,
0.7855173, 1.10838, -0.8715587, 0.6431373, 0, 1, 1,
0.7878164, 0.3167307, -1.145238, 0.6509804, 0, 1, 1,
0.7890879, -1.227484, 1.566747, 0.654902, 0, 1, 1,
0.7980168, 0.2745914, 1.472143, 0.6627451, 0, 1, 1,
0.8122064, -1.646988, 2.589328, 0.6666667, 0, 1, 1,
0.8146523, -1.771748, 1.787488, 0.6745098, 0, 1, 1,
0.8147626, -0.09599695, 2.796714, 0.6784314, 0, 1, 1,
0.8148, 0.7075869, 1.527249, 0.6862745, 0, 1, 1,
0.8152605, -0.6441474, 3.156238, 0.6901961, 0, 1, 1,
0.8256129, 1.445072, -0.1613148, 0.6980392, 0, 1, 1,
0.8264429, 0.6069272, -0.1118681, 0.7058824, 0, 1, 1,
0.8307413, -0.1816507, 1.509802, 0.7098039, 0, 1, 1,
0.8343236, -0.09437072, 1.655836, 0.7176471, 0, 1, 1,
0.8369039, -1.467053, 3.655716, 0.7215686, 0, 1, 1,
0.83829, 0.9921169, 0.8445858, 0.7294118, 0, 1, 1,
0.8402889, -0.8017478, 2.715389, 0.7333333, 0, 1, 1,
0.8424545, 0.03059326, 1.783868, 0.7411765, 0, 1, 1,
0.8454807, 0.9202618, 1.032959, 0.7450981, 0, 1, 1,
0.8499558, 1.135279, 1.741106, 0.7529412, 0, 1, 1,
0.8520901, -0.235763, 1.597611, 0.7568628, 0, 1, 1,
0.8546429, -0.2545936, 3.512398, 0.7647059, 0, 1, 1,
0.855152, 0.2958339, 0.7112963, 0.7686275, 0, 1, 1,
0.8571144, -1.541887, 3.470604, 0.7764706, 0, 1, 1,
0.8659947, -1.501212, 2.008197, 0.7803922, 0, 1, 1,
0.8660331, 0.8128777, 1.656366, 0.7882353, 0, 1, 1,
0.8796013, 0.3132851, 3.850112, 0.7921569, 0, 1, 1,
0.8806903, -1.331447, 3.743331, 0.8, 0, 1, 1,
0.8814681, -0.6795927, 0.6993355, 0.8078431, 0, 1, 1,
0.8863897, 0.8720928, -2.188233, 0.8117647, 0, 1, 1,
0.8866467, -1.041972, 0.3020194, 0.8196079, 0, 1, 1,
0.891579, -0.05709681, 3.351646, 0.8235294, 0, 1, 1,
0.8947042, -0.5504053, 2.718826, 0.8313726, 0, 1, 1,
0.8963044, -1.662592, 3.643817, 0.8352941, 0, 1, 1,
0.8977472, 1.907241, 1.24744, 0.8431373, 0, 1, 1,
0.8980454, -0.4421895, 0.8642212, 0.8470588, 0, 1, 1,
0.9001271, -1.071673, 1.816539, 0.854902, 0, 1, 1,
0.910786, 0.8237998, 0.3332697, 0.8588235, 0, 1, 1,
0.9129949, 1.058061, 0.881353, 0.8666667, 0, 1, 1,
0.9158026, -0.4049007, 4.009241, 0.8705882, 0, 1, 1,
0.9187276, -1.445893, 2.889568, 0.8784314, 0, 1, 1,
0.9197922, 0.1899718, 0.8007261, 0.8823529, 0, 1, 1,
0.9238192, -0.7961671, 3.54429, 0.8901961, 0, 1, 1,
0.9297216, 0.4819894, 0.263802, 0.8941177, 0, 1, 1,
0.9363545, 0.1935977, 1.425612, 0.9019608, 0, 1, 1,
0.9412915, 0.7769272, 0.008655225, 0.9098039, 0, 1, 1,
0.9431741, 1.112587, -0.7981946, 0.9137255, 0, 1, 1,
0.9448766, 0.1535642, 1.405305, 0.9215686, 0, 1, 1,
0.9453601, -0.588109, 1.015362, 0.9254902, 0, 1, 1,
0.9493421, 0.7919791, 1.485914, 0.9333333, 0, 1, 1,
0.9636324, -0.7544453, 1.313041, 0.9372549, 0, 1, 1,
0.9641055, 1.041119, 0.2031814, 0.945098, 0, 1, 1,
0.9645506, 0.4813563, 0.7355394, 0.9490196, 0, 1, 1,
0.9667644, -0.8041278, 3.340996, 0.9568627, 0, 1, 1,
0.9672821, -0.6785781, 0.6127734, 0.9607843, 0, 1, 1,
0.9726969, -0.2592094, 1.341237, 0.9686275, 0, 1, 1,
0.9743813, 0.4060645, 0.6091633, 0.972549, 0, 1, 1,
0.9775076, -1.418137, 3.477716, 0.9803922, 0, 1, 1,
0.9781705, -0.4351658, 1.210863, 0.9843137, 0, 1, 1,
0.9790823, -0.3073831, 2.764704, 0.9921569, 0, 1, 1,
0.9796476, 0.8389159, 1.822235, 0.9960784, 0, 1, 1,
0.9815428, 1.028336, 2.129627, 1, 0, 0.9960784, 1,
0.9830819, -0.8688433, 1.758239, 1, 0, 0.9882353, 1,
0.9889378, -2.410194, 3.663296, 1, 0, 0.9843137, 1,
0.9901693, -0.6706148, 3.356739, 1, 0, 0.9764706, 1,
0.9918331, 0.8129368, 1.807579, 1, 0, 0.972549, 1,
0.9994873, 0.8653054, 0.7949474, 1, 0, 0.9647059, 1,
1.00126, -1.915246, 5.793404, 1, 0, 0.9607843, 1,
1.008049, 0.4004983, 2.603798, 1, 0, 0.9529412, 1,
1.00876, 0.9285812, 1.847625, 1, 0, 0.9490196, 1,
1.012623, 0.8361311, 0.3422639, 1, 0, 0.9411765, 1,
1.026025, 0.9832379, 1.787002, 1, 0, 0.9372549, 1,
1.032539, 1.021123, 1.551329, 1, 0, 0.9294118, 1,
1.035249, 0.4912831, 0.3724242, 1, 0, 0.9254902, 1,
1.035718, 0.5254532, 1.359472, 1, 0, 0.9176471, 1,
1.037998, -0.7908779, 1.906969, 1, 0, 0.9137255, 1,
1.038315, 0.2539313, 0.9121839, 1, 0, 0.9058824, 1,
1.048923, -0.4447185, 0.6904121, 1, 0, 0.9019608, 1,
1.065942, 0.4201137, 1.84474, 1, 0, 0.8941177, 1,
1.070096, 0.7218861, 0.9582145, 1, 0, 0.8862745, 1,
1.071104, 1.516188, 2.526408, 1, 0, 0.8823529, 1,
1.071525, 0.3851762, 2.174118, 1, 0, 0.8745098, 1,
1.073817, -0.1964874, 1.988776, 1, 0, 0.8705882, 1,
1.079175, -1.023776, 2.177957, 1, 0, 0.8627451, 1,
1.080646, 0.6061025, -0.2184572, 1, 0, 0.8588235, 1,
1.081421, 0.3669557, 2.813602, 1, 0, 0.8509804, 1,
1.082088, -0.02018212, 2.321977, 1, 0, 0.8470588, 1,
1.084455, 0.8960238, 0.6517599, 1, 0, 0.8392157, 1,
1.085893, -1.035574, 1.816031, 1, 0, 0.8352941, 1,
1.09549, -0.5233281, 1.529768, 1, 0, 0.827451, 1,
1.101183, 0.4809139, 0.4609845, 1, 0, 0.8235294, 1,
1.104173, -0.1630858, 0.6010713, 1, 0, 0.8156863, 1,
1.111783, -0.03668557, 0.8379842, 1, 0, 0.8117647, 1,
1.119725, -0.7774537, 1.520194, 1, 0, 0.8039216, 1,
1.119752, -0.5659668, 1.018965, 1, 0, 0.7960784, 1,
1.125324, 2.52584, 0.8887213, 1, 0, 0.7921569, 1,
1.128611, -2.410197, 2.340172, 1, 0, 0.7843137, 1,
1.131953, 0.05648824, 1.210211, 1, 0, 0.7803922, 1,
1.137206, 1.666689, 1.688907, 1, 0, 0.772549, 1,
1.144509, 0.6719722, 2.040854, 1, 0, 0.7686275, 1,
1.145522, -1.337346, 3.68889, 1, 0, 0.7607843, 1,
1.14696, 0.9236804, 0.6195453, 1, 0, 0.7568628, 1,
1.151078, 0.7462037, 0.01144605, 1, 0, 0.7490196, 1,
1.153326, -0.2124053, 2.236224, 1, 0, 0.7450981, 1,
1.154033, -0.1991796, 2.802508, 1, 0, 0.7372549, 1,
1.16434, -2.587323, 2.850116, 1, 0, 0.7333333, 1,
1.183724, -0.116718, 2.863322, 1, 0, 0.7254902, 1,
1.183897, 1.321231, 0.8826224, 1, 0, 0.7215686, 1,
1.187062, 1.177809, 0.6366497, 1, 0, 0.7137255, 1,
1.203276, 1.197007, 2.062362, 1, 0, 0.7098039, 1,
1.209183, -0.5915121, 1.815877, 1, 0, 0.7019608, 1,
1.213084, -1.233552, 1.363193, 1, 0, 0.6941177, 1,
1.224037, -0.4335439, 2.187437, 1, 0, 0.6901961, 1,
1.252441, -0.1785765, 3.933726, 1, 0, 0.682353, 1,
1.260707, 0.723271, 0.9434237, 1, 0, 0.6784314, 1,
1.262645, 0.9559491, 0.521391, 1, 0, 0.6705883, 1,
1.272981, 0.09344758, 1.541656, 1, 0, 0.6666667, 1,
1.27318, 0.7972299, -0.1929162, 1, 0, 0.6588235, 1,
1.280301, -1.060154, 2.584762, 1, 0, 0.654902, 1,
1.281333, 0.277034, 1.7189, 1, 0, 0.6470588, 1,
1.283229, 2.850597, 0.1979626, 1, 0, 0.6431373, 1,
1.285136, 0.7620007, 1.949139, 1, 0, 0.6352941, 1,
1.295813, -0.01088495, 1.992445, 1, 0, 0.6313726, 1,
1.306758, 0.7324721, 1.247684, 1, 0, 0.6235294, 1,
1.315428, -0.5690749, 2.972651, 1, 0, 0.6196079, 1,
1.325121, -1.902688, 5.065881, 1, 0, 0.6117647, 1,
1.343589, -1.435816, 3.063344, 1, 0, 0.6078432, 1,
1.348744, 0.2215375, 2.168456, 1, 0, 0.6, 1,
1.359794, -0.1292786, 0.6502275, 1, 0, 0.5921569, 1,
1.371296, 0.7859202, 2.971825, 1, 0, 0.5882353, 1,
1.380334, 0.04025048, 1.637413, 1, 0, 0.5803922, 1,
1.384272, 0.2476662, 0.2642037, 1, 0, 0.5764706, 1,
1.38529, -0.6728883, 4.029162, 1, 0, 0.5686275, 1,
1.387432, -1.087885, 1.862034, 1, 0, 0.5647059, 1,
1.399169, 0.1697791, -0.1095257, 1, 0, 0.5568628, 1,
1.400118, 2.580988, 1.556315, 1, 0, 0.5529412, 1,
1.403671, -1.354443, 3.959007, 1, 0, 0.5450981, 1,
1.404112, 0.5326326, 1.791153, 1, 0, 0.5411765, 1,
1.404239, 0.07948809, 2.076946, 1, 0, 0.5333334, 1,
1.405182, -0.285851, 0.7459593, 1, 0, 0.5294118, 1,
1.408356, 0.2303445, 2.040352, 1, 0, 0.5215687, 1,
1.40873, -0.1577827, 1.966764, 1, 0, 0.5176471, 1,
1.40896, -0.1077765, 1.741886, 1, 0, 0.509804, 1,
1.436825, 0.0570759, -0.05228008, 1, 0, 0.5058824, 1,
1.451972, 0.7178415, 0.4630775, 1, 0, 0.4980392, 1,
1.468813, 0.5033469, 0.7231026, 1, 0, 0.4901961, 1,
1.469187, 0.214551, 0.7359982, 1, 0, 0.4862745, 1,
1.469527, 1.104919, 2.166106, 1, 0, 0.4784314, 1,
1.469788, 1.766987, 0.6103169, 1, 0, 0.4745098, 1,
1.472321, -1.460812, 2.003737, 1, 0, 0.4666667, 1,
1.48514, -0.4755389, 1.427117, 1, 0, 0.4627451, 1,
1.487076, 0.9199772, 1.765329, 1, 0, 0.454902, 1,
1.513955, 0.7209997, 0.9816319, 1, 0, 0.4509804, 1,
1.517702, 0.5558513, -0.4947072, 1, 0, 0.4431373, 1,
1.523547, -0.8176003, 1.685185, 1, 0, 0.4392157, 1,
1.524022, -0.9330298, 4.115501, 1, 0, 0.4313726, 1,
1.525254, -0.9666954, 0.9881923, 1, 0, 0.427451, 1,
1.527176, -0.6189305, 1.950125, 1, 0, 0.4196078, 1,
1.545995, 0.6402314, 0.5804099, 1, 0, 0.4156863, 1,
1.557636, 0.8209767, 1.234054, 1, 0, 0.4078431, 1,
1.566201, 0.2039561, 3.001729, 1, 0, 0.4039216, 1,
1.566236, 0.653132, 0.6363617, 1, 0, 0.3960784, 1,
1.574509, 1.42471, 1.50638, 1, 0, 0.3882353, 1,
1.577757, -1.016269, 1.103271, 1, 0, 0.3843137, 1,
1.579677, -0.1170256, -0.1560032, 1, 0, 0.3764706, 1,
1.587985, -0.9334462, 2.212447, 1, 0, 0.372549, 1,
1.593469, -0.5629686, 3.12588, 1, 0, 0.3647059, 1,
1.600947, 0.2226575, 1.299455, 1, 0, 0.3607843, 1,
1.610159, -0.6213938, 3.103844, 1, 0, 0.3529412, 1,
1.618013, -0.680785, 0.6529279, 1, 0, 0.3490196, 1,
1.622317, -0.2104558, 0.5756785, 1, 0, 0.3411765, 1,
1.642955, -1.001733, 2.0849, 1, 0, 0.3372549, 1,
1.660975, 0.9187593, -0.3806078, 1, 0, 0.3294118, 1,
1.690068, 0.7123212, 1.646239, 1, 0, 0.3254902, 1,
1.690929, 0.6149388, 1.348722, 1, 0, 0.3176471, 1,
1.697561, -0.4014883, 2.261227, 1, 0, 0.3137255, 1,
1.757653, -0.03377374, 2.478022, 1, 0, 0.3058824, 1,
1.772139, -1.737013, 1.972219, 1, 0, 0.2980392, 1,
1.777308, 0.237928, 2.72446, 1, 0, 0.2941177, 1,
1.77973, -1.012475, 2.413098, 1, 0, 0.2862745, 1,
1.784054, 1.45255, -0.001698702, 1, 0, 0.282353, 1,
1.813319, 0.8163888, 2.02938, 1, 0, 0.2745098, 1,
1.821899, 0.182554, 2.380435, 1, 0, 0.2705882, 1,
1.828093, -0.1681316, 2.22187, 1, 0, 0.2627451, 1,
1.844553, -1.113072, 1.625989, 1, 0, 0.2588235, 1,
1.849556, -0.840108, 3.175674, 1, 0, 0.2509804, 1,
1.853006, -0.8967528, 3.439363, 1, 0, 0.2470588, 1,
1.874491, 0.3071329, 2.4315, 1, 0, 0.2392157, 1,
1.879987, 1.560185, 1.464609, 1, 0, 0.2352941, 1,
1.898042, 0.1935196, 2.065603, 1, 0, 0.227451, 1,
1.904414, -0.7964142, 1.935946, 1, 0, 0.2235294, 1,
1.90939, 0.5955363, 0.8649794, 1, 0, 0.2156863, 1,
1.931469, 0.2149361, 1.73779, 1, 0, 0.2117647, 1,
1.935012, 0.9723114, 0.171266, 1, 0, 0.2039216, 1,
1.948022, 0.5000401, 1.485504, 1, 0, 0.1960784, 1,
1.94878, 0.04809468, 2.080377, 1, 0, 0.1921569, 1,
1.955635, 0.4579149, 2.549246, 1, 0, 0.1843137, 1,
1.961653, -0.6799356, 1.860009, 1, 0, 0.1803922, 1,
1.983289, -0.0870297, 2.396238, 1, 0, 0.172549, 1,
1.994838, 0.1002965, 1.933764, 1, 0, 0.1686275, 1,
2.021221, -0.489617, 0.7354138, 1, 0, 0.1607843, 1,
2.025166, 2.018613, 2.610019, 1, 0, 0.1568628, 1,
2.028639, -0.1425588, 0.998842, 1, 0, 0.1490196, 1,
2.047627, -0.4750102, 0.9337218, 1, 0, 0.145098, 1,
2.057369, 0.4171069, 2.174119, 1, 0, 0.1372549, 1,
2.094679, -0.6146287, 3.264204, 1, 0, 0.1333333, 1,
2.095438, -0.6039319, 2.631478, 1, 0, 0.1254902, 1,
2.105774, -0.140408, 2.913245, 1, 0, 0.1215686, 1,
2.12912, 0.2056836, 0.3879325, 1, 0, 0.1137255, 1,
2.132643, -1.048342, 0.2414139, 1, 0, 0.1098039, 1,
2.191324, 0.2823832, 1.528195, 1, 0, 0.1019608, 1,
2.197293, 2.077679, 1.922676, 1, 0, 0.09411765, 1,
2.219625, 0.2446118, 2.376327, 1, 0, 0.09019608, 1,
2.262802, 0.7029413, 1.727362, 1, 0, 0.08235294, 1,
2.38263, -1.456428, 2.25023, 1, 0, 0.07843138, 1,
2.390813, 0.3549495, 3.018235, 1, 0, 0.07058824, 1,
2.399318, 0.9206282, 0.2820533, 1, 0, 0.06666667, 1,
2.459736, -1.169713, 2.20676, 1, 0, 0.05882353, 1,
2.470289, -0.903684, 2.755074, 1, 0, 0.05490196, 1,
2.542937, 1.568013, 1.46376, 1, 0, 0.04705882, 1,
2.570082, 0.09784842, 0.4092448, 1, 0, 0.04313726, 1,
2.571618, 1.013748, 1.538044, 1, 0, 0.03529412, 1,
2.668745, -0.04011813, 1.104744, 1, 0, 0.03137255, 1,
2.674319, 0.4314435, 1.030465, 1, 0, 0.02352941, 1,
2.701657, -0.4425968, 3.185438, 1, 0, 0.01960784, 1,
3.382701, 0.9340822, 1.692904, 1, 0, 0.01176471, 1,
3.878993, 0.06776016, 2.367064, 1, 0, 0.007843138, 1
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
0.4373723, -4.247639, -6.600615, 0, -0.5, 0.5, 0.5,
0.4373723, -4.247639, -6.600615, 1, -0.5, 0.5, 0.5,
0.4373723, -4.247639, -6.600615, 1, 1.5, 0.5, 0.5,
0.4373723, -4.247639, -6.600615, 0, 1.5, 0.5, 0.5
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
-4.170958, -0.1841341, -6.600615, 0, -0.5, 0.5, 0.5,
-4.170958, -0.1841341, -6.600615, 1, -0.5, 0.5, 0.5,
-4.170958, -0.1841341, -6.600615, 1, 1.5, 0.5, 0.5,
-4.170958, -0.1841341, -6.600615, 0, 1.5, 0.5, 0.5
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
-4.170958, -4.247639, 0.4945502, 0, -0.5, 0.5, 0.5,
-4.170958, -4.247639, 0.4945502, 1, -0.5, 0.5, 0.5,
-4.170958, -4.247639, 0.4945502, 1, 1.5, 0.5, 0.5,
-4.170958, -4.247639, 0.4945502, 0, 1.5, 0.5, 0.5
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
-3, -3.309907, -4.963269,
3, -3.309907, -4.963269,
-3, -3.309907, -4.963269,
-3, -3.466196, -5.23616,
-2, -3.309907, -4.963269,
-2, -3.466196, -5.23616,
-1, -3.309907, -4.963269,
-1, -3.466196, -5.23616,
0, -3.309907, -4.963269,
0, -3.466196, -5.23616,
1, -3.309907, -4.963269,
1, -3.466196, -5.23616,
2, -3.309907, -4.963269,
2, -3.466196, -5.23616,
3, -3.309907, -4.963269,
3, -3.466196, -5.23616
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
-3, -3.778773, -5.781941, 0, -0.5, 0.5, 0.5,
-3, -3.778773, -5.781941, 1, -0.5, 0.5, 0.5,
-3, -3.778773, -5.781941, 1, 1.5, 0.5, 0.5,
-3, -3.778773, -5.781941, 0, 1.5, 0.5, 0.5,
-2, -3.778773, -5.781941, 0, -0.5, 0.5, 0.5,
-2, -3.778773, -5.781941, 1, -0.5, 0.5, 0.5,
-2, -3.778773, -5.781941, 1, 1.5, 0.5, 0.5,
-2, -3.778773, -5.781941, 0, 1.5, 0.5, 0.5,
-1, -3.778773, -5.781941, 0, -0.5, 0.5, 0.5,
-1, -3.778773, -5.781941, 1, -0.5, 0.5, 0.5,
-1, -3.778773, -5.781941, 1, 1.5, 0.5, 0.5,
-1, -3.778773, -5.781941, 0, 1.5, 0.5, 0.5,
0, -3.778773, -5.781941, 0, -0.5, 0.5, 0.5,
0, -3.778773, -5.781941, 1, -0.5, 0.5, 0.5,
0, -3.778773, -5.781941, 1, 1.5, 0.5, 0.5,
0, -3.778773, -5.781941, 0, 1.5, 0.5, 0.5,
1, -3.778773, -5.781941, 0, -0.5, 0.5, 0.5,
1, -3.778773, -5.781941, 1, -0.5, 0.5, 0.5,
1, -3.778773, -5.781941, 1, 1.5, 0.5, 0.5,
1, -3.778773, -5.781941, 0, 1.5, 0.5, 0.5,
2, -3.778773, -5.781941, 0, -0.5, 0.5, 0.5,
2, -3.778773, -5.781941, 1, -0.5, 0.5, 0.5,
2, -3.778773, -5.781941, 1, 1.5, 0.5, 0.5,
2, -3.778773, -5.781941, 0, 1.5, 0.5, 0.5,
3, -3.778773, -5.781941, 0, -0.5, 0.5, 0.5,
3, -3.778773, -5.781941, 1, -0.5, 0.5, 0.5,
3, -3.778773, -5.781941, 1, 1.5, 0.5, 0.5,
3, -3.778773, -5.781941, 0, 1.5, 0.5, 0.5
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
-3.107497, -3, -4.963269,
-3.107497, 2, -4.963269,
-3.107497, -3, -4.963269,
-3.284741, -3, -5.23616,
-3.107497, -2, -4.963269,
-3.284741, -2, -5.23616,
-3.107497, -1, -4.963269,
-3.284741, -1, -5.23616,
-3.107497, 0, -4.963269,
-3.284741, 0, -5.23616,
-3.107497, 1, -4.963269,
-3.284741, 1, -5.23616,
-3.107497, 2, -4.963269,
-3.284741, 2, -5.23616
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
-3.639228, -3, -5.781941, 0, -0.5, 0.5, 0.5,
-3.639228, -3, -5.781941, 1, -0.5, 0.5, 0.5,
-3.639228, -3, -5.781941, 1, 1.5, 0.5, 0.5,
-3.639228, -3, -5.781941, 0, 1.5, 0.5, 0.5,
-3.639228, -2, -5.781941, 0, -0.5, 0.5, 0.5,
-3.639228, -2, -5.781941, 1, -0.5, 0.5, 0.5,
-3.639228, -2, -5.781941, 1, 1.5, 0.5, 0.5,
-3.639228, -2, -5.781941, 0, 1.5, 0.5, 0.5,
-3.639228, -1, -5.781941, 0, -0.5, 0.5, 0.5,
-3.639228, -1, -5.781941, 1, -0.5, 0.5, 0.5,
-3.639228, -1, -5.781941, 1, 1.5, 0.5, 0.5,
-3.639228, -1, -5.781941, 0, 1.5, 0.5, 0.5,
-3.639228, 0, -5.781941, 0, -0.5, 0.5, 0.5,
-3.639228, 0, -5.781941, 1, -0.5, 0.5, 0.5,
-3.639228, 0, -5.781941, 1, 1.5, 0.5, 0.5,
-3.639228, 0, -5.781941, 0, 1.5, 0.5, 0.5,
-3.639228, 1, -5.781941, 0, -0.5, 0.5, 0.5,
-3.639228, 1, -5.781941, 1, -0.5, 0.5, 0.5,
-3.639228, 1, -5.781941, 1, 1.5, 0.5, 0.5,
-3.639228, 1, -5.781941, 0, 1.5, 0.5, 0.5,
-3.639228, 2, -5.781941, 0, -0.5, 0.5, 0.5,
-3.639228, 2, -5.781941, 1, -0.5, 0.5, 0.5,
-3.639228, 2, -5.781941, 1, 1.5, 0.5, 0.5,
-3.639228, 2, -5.781941, 0, 1.5, 0.5, 0.5
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
-3.107497, -3.309907, -4,
-3.107497, -3.309907, 4,
-3.107497, -3.309907, -4,
-3.284741, -3.466196, -4,
-3.107497, -3.309907, -2,
-3.284741, -3.466196, -2,
-3.107497, -3.309907, 0,
-3.284741, -3.466196, 0,
-3.107497, -3.309907, 2,
-3.284741, -3.466196, 2,
-3.107497, -3.309907, 4,
-3.284741, -3.466196, 4
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
-3.639228, -3.778773, -4, 0, -0.5, 0.5, 0.5,
-3.639228, -3.778773, -4, 1, -0.5, 0.5, 0.5,
-3.639228, -3.778773, -4, 1, 1.5, 0.5, 0.5,
-3.639228, -3.778773, -4, 0, 1.5, 0.5, 0.5,
-3.639228, -3.778773, -2, 0, -0.5, 0.5, 0.5,
-3.639228, -3.778773, -2, 1, -0.5, 0.5, 0.5,
-3.639228, -3.778773, -2, 1, 1.5, 0.5, 0.5,
-3.639228, -3.778773, -2, 0, 1.5, 0.5, 0.5,
-3.639228, -3.778773, 0, 0, -0.5, 0.5, 0.5,
-3.639228, -3.778773, 0, 1, -0.5, 0.5, 0.5,
-3.639228, -3.778773, 0, 1, 1.5, 0.5, 0.5,
-3.639228, -3.778773, 0, 0, 1.5, 0.5, 0.5,
-3.639228, -3.778773, 2, 0, -0.5, 0.5, 0.5,
-3.639228, -3.778773, 2, 1, -0.5, 0.5, 0.5,
-3.639228, -3.778773, 2, 1, 1.5, 0.5, 0.5,
-3.639228, -3.778773, 2, 0, 1.5, 0.5, 0.5,
-3.639228, -3.778773, 4, 0, -0.5, 0.5, 0.5,
-3.639228, -3.778773, 4, 1, -0.5, 0.5, 0.5,
-3.639228, -3.778773, 4, 1, 1.5, 0.5, 0.5,
-3.639228, -3.778773, 4, 0, 1.5, 0.5, 0.5
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
-3.107497, -3.309907, -4.963269,
-3.107497, 2.941639, -4.963269,
-3.107497, -3.309907, 5.952369,
-3.107497, 2.941639, 5.952369,
-3.107497, -3.309907, -4.963269,
-3.107497, -3.309907, 5.952369,
-3.107497, 2.941639, -4.963269,
-3.107497, 2.941639, 5.952369,
-3.107497, -3.309907, -4.963269,
3.982242, -3.309907, -4.963269,
-3.107497, -3.309907, 5.952369,
3.982242, -3.309907, 5.952369,
-3.107497, 2.941639, -4.963269,
3.982242, 2.941639, -4.963269,
-3.107497, 2.941639, 5.952369,
3.982242, 2.941639, 5.952369,
3.982242, -3.309907, -4.963269,
3.982242, 2.941639, -4.963269,
3.982242, -3.309907, 5.952369,
3.982242, 2.941639, 5.952369,
3.982242, -3.309907, -4.963269,
3.982242, -3.309907, 5.952369,
3.982242, 2.941639, -4.963269,
3.982242, 2.941639, 5.952369
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
var radius = 7.71038;
var distance = 34.30435;
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
mvMatrix.translate( -0.4373723, 0.1841341, -0.4945502 );
mvMatrix.scale( 1.17587, 1.333528, 0.7637312 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.30435);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
propanecarboxylate_2<-read.table("propanecarboxylate_2.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propanecarboxylate_2$V2
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
```

```r
y<-propanecarboxylate_2$V3
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
```

```r
z<-propanecarboxylate_2$V4
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
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
-3.004249, -0.8789396, -1.764875, 0, 0, 1, 1, 1,
-2.647757, -0.8946912, -1.460813, 1, 0, 0, 1, 1,
-2.642809, -0.5440691, -1.579198, 1, 0, 0, 1, 1,
-2.625715, -0.5641094, -1.499687, 1, 0, 0, 1, 1,
-2.608709, 0.765888, -2.325908, 1, 0, 0, 1, 1,
-2.561925, -1.036158, -1.289594, 1, 0, 0, 1, 1,
-2.54207, 0.2002581, 0.04812649, 0, 0, 0, 1, 1,
-2.513216, -0.1933484, -1.476779, 0, 0, 0, 1, 1,
-2.502759, 0.2804457, -3.912982, 0, 0, 0, 1, 1,
-2.428337, -0.03371416, -3.781488, 0, 0, 0, 1, 1,
-2.328865, 0.507979, -1.1923, 0, 0, 0, 1, 1,
-2.321983, 0.4701521, -1.937295, 0, 0, 0, 1, 1,
-2.309394, 0.4806728, -1.427156, 0, 0, 0, 1, 1,
-2.253678, -1.143634, -1.292418, 1, 1, 1, 1, 1,
-2.249538, -1.318238, -3.351597, 1, 1, 1, 1, 1,
-2.246782, -1.051069, -0.6938146, 1, 1, 1, 1, 1,
-2.196404, -0.09635352, -2.082458, 1, 1, 1, 1, 1,
-2.183302, 0.8658222, -0.0827757, 1, 1, 1, 1, 1,
-2.169966, 0.4002022, -1.626315, 1, 1, 1, 1, 1,
-2.16485, -1.977687, -2.698507, 1, 1, 1, 1, 1,
-2.15492, 0.8141634, 0.3418366, 1, 1, 1, 1, 1,
-2.149123, -1.658158, -1.863734, 1, 1, 1, 1, 1,
-2.110507, 1.696835, -0.3540766, 1, 1, 1, 1, 1,
-2.09181, 1.131918, 0.4261715, 1, 1, 1, 1, 1,
-2.078109, -0.8120827, -1.506251, 1, 1, 1, 1, 1,
-2.076984, 0.1822656, -1.872582, 1, 1, 1, 1, 1,
-2.068054, 0.1437871, -1.048496, 1, 1, 1, 1, 1,
-2.055659, -0.2129576, -3.292071, 1, 1, 1, 1, 1,
-2.044791, -1.072238, -1.652687, 0, 0, 1, 1, 1,
-2.029093, 0.9370142, -1.698381, 1, 0, 0, 1, 1,
-2.020881, -2.79685, -1.11913, 1, 0, 0, 1, 1,
-2.014582, 0.6614757, 1.527097, 1, 0, 0, 1, 1,
-1.992136, 0.1058533, -0.4419025, 1, 0, 0, 1, 1,
-1.983681, 0.2487015, -1.563141, 1, 0, 0, 1, 1,
-1.980926, 0.2558883, -1.908996, 0, 0, 0, 1, 1,
-1.9747, -1.183035, -2.499633, 0, 0, 0, 1, 1,
-1.96434, 0.5257694, -1.15932, 0, 0, 0, 1, 1,
-1.96172, 0.3682525, -0.675056, 0, 0, 0, 1, 1,
-1.958196, -0.3225052, -2.51303, 0, 0, 0, 1, 1,
-1.950773, -1.396992, -2.750989, 0, 0, 0, 1, 1,
-1.893747, -0.5981869, -2.410609, 0, 0, 0, 1, 1,
-1.866329, 0.0744909, -1.028761, 1, 1, 1, 1, 1,
-1.860663, -0.2302396, -2.600407, 1, 1, 1, 1, 1,
-1.812099, 0.1326962, -1.049024, 1, 1, 1, 1, 1,
-1.784176, 0.8290899, -1.656592, 1, 1, 1, 1, 1,
-1.777393, -0.6465812, -1.54625, 1, 1, 1, 1, 1,
-1.772038, -0.1860566, -0.5791201, 1, 1, 1, 1, 1,
-1.769451, 0.6227446, -1.473114, 1, 1, 1, 1, 1,
-1.747975, 1.292255, -2.072048, 1, 1, 1, 1, 1,
-1.740175, 1.382786, 1.684055, 1, 1, 1, 1, 1,
-1.732044, -0.4272055, -1.566519, 1, 1, 1, 1, 1,
-1.719043, 0.7796866, -0.9647682, 1, 1, 1, 1, 1,
-1.687847, -0.5033885, -3.038506, 1, 1, 1, 1, 1,
-1.687099, -2.840674, -4.082013, 1, 1, 1, 1, 1,
-1.675758, 0.4390269, -1.466254, 1, 1, 1, 1, 1,
-1.664979, -0.3119723, -2.527303, 1, 1, 1, 1, 1,
-1.662611, -0.05150205, -2.686267, 0, 0, 1, 1, 1,
-1.659662, -0.002882465, -0.5424483, 1, 0, 0, 1, 1,
-1.648355, -0.3957672, -1.197738, 1, 0, 0, 1, 1,
-1.643282, 0.5018754, 0.1853207, 1, 0, 0, 1, 1,
-1.63761, -0.7222362, -0.5696577, 1, 0, 0, 1, 1,
-1.627709, 0.1991737, -3.535398, 1, 0, 0, 1, 1,
-1.621673, 0.593918, -2.033985, 0, 0, 0, 1, 1,
-1.608083, -1.244617, -1.696321, 0, 0, 0, 1, 1,
-1.604855, 0.007346383, -2.057077, 0, 0, 0, 1, 1,
-1.59936, 2.728489, -0.5527701, 0, 0, 0, 1, 1,
-1.592586, 0.04791661, -1.483612, 0, 0, 0, 1, 1,
-1.574675, -0.7621178, -2.696494, 0, 0, 0, 1, 1,
-1.573847, -0.6142079, -2.437923, 0, 0, 0, 1, 1,
-1.569118, -1.248337, -2.73406, 1, 1, 1, 1, 1,
-1.562505, -1.452135, -1.28538, 1, 1, 1, 1, 1,
-1.560426, 0.3904135, -1.531043, 1, 1, 1, 1, 1,
-1.559372, 1.462839, -1.422168, 1, 1, 1, 1, 1,
-1.553594, -2.391378, -4.804303, 1, 1, 1, 1, 1,
-1.550443, 0.6142862, -4.238214, 1, 1, 1, 1, 1,
-1.542933, 1.37926, -1.176602, 1, 1, 1, 1, 1,
-1.542767, 0.9987271, -1.924828, 1, 1, 1, 1, 1,
-1.531024, -2.821311, -2.289397, 1, 1, 1, 1, 1,
-1.525335, -1.322257, -2.93622, 1, 1, 1, 1, 1,
-1.519513, -1.133416, -2.156763, 1, 1, 1, 1, 1,
-1.517228, 0.399735, -2.040056, 1, 1, 1, 1, 1,
-1.513973, -0.9964703, -2.238301, 1, 1, 1, 1, 1,
-1.513005, -0.3894995, -3.020597, 1, 1, 1, 1, 1,
-1.496501, -0.9146196, -1.883094, 1, 1, 1, 1, 1,
-1.480176, -1.166944, -1.353815, 0, 0, 1, 1, 1,
-1.47976, 0.9153971, -0.6386356, 1, 0, 0, 1, 1,
-1.477451, 0.4084948, -1.300995, 1, 0, 0, 1, 1,
-1.471262, -1.227901, -2.918419, 1, 0, 0, 1, 1,
-1.468703, 1.536237, -1.490272, 1, 0, 0, 1, 1,
-1.447577, -0.8925733, -1.076627, 1, 0, 0, 1, 1,
-1.442971, -1.045739, -1.372896, 0, 0, 0, 1, 1,
-1.440522, 0.02956306, -2.801923, 0, 0, 0, 1, 1,
-1.427415, -0.1719778, -1.213199, 0, 0, 0, 1, 1,
-1.422621, 0.05715566, -2.708929, 0, 0, 0, 1, 1,
-1.41864, 0.719409, -0.4882363, 0, 0, 0, 1, 1,
-1.417865, 1.137834, -0.3881422, 0, 0, 0, 1, 1,
-1.411492, 0.6880776, -0.1519299, 0, 0, 0, 1, 1,
-1.408685, -1.089533, -2.237648, 1, 1, 1, 1, 1,
-1.407026, -0.7822543, -2.739719, 1, 1, 1, 1, 1,
-1.407019, -0.8591507, -0.2405501, 1, 1, 1, 1, 1,
-1.378986, -2.059589, -3.311686, 1, 1, 1, 1, 1,
-1.369588, 1.540159, -1.076708, 1, 1, 1, 1, 1,
-1.364522, -0.6492514, -1.9547, 1, 1, 1, 1, 1,
-1.363376, 0.1454738, -0.6237539, 1, 1, 1, 1, 1,
-1.342559, 0.3615837, -2.0393, 1, 1, 1, 1, 1,
-1.338398, -0.5979733, -1.220277, 1, 1, 1, 1, 1,
-1.336602, 0.07413521, -0.3954301, 1, 1, 1, 1, 1,
-1.32496, -0.6579659, -3.419141, 1, 1, 1, 1, 1,
-1.321528, -0.9424316, -2.856077, 1, 1, 1, 1, 1,
-1.321255, -0.6396105, -1.216221, 1, 1, 1, 1, 1,
-1.30817, 0.08001231, 0.3013189, 1, 1, 1, 1, 1,
-1.303003, 0.201203, -2.712416, 1, 1, 1, 1, 1,
-1.300746, -1.115015, -2.828815, 0, 0, 1, 1, 1,
-1.297524, 2.084809, -0.9962385, 1, 0, 0, 1, 1,
-1.293006, -1.430503, -3.445688, 1, 0, 0, 1, 1,
-1.288923, 0.2937998, -1.139824, 1, 0, 0, 1, 1,
-1.287329, -1.064954, -1.905848, 1, 0, 0, 1, 1,
-1.280575, 0.1376395, -2.363847, 1, 0, 0, 1, 1,
-1.278084, -1.553862, -2.738207, 0, 0, 0, 1, 1,
-1.274998, -1.767479, -2.732544, 0, 0, 0, 1, 1,
-1.2582, 1.623142, -1.344424, 0, 0, 0, 1, 1,
-1.254053, -0.6348501, -2.814779, 0, 0, 0, 1, 1,
-1.252029, 0.07522903, -1.147225, 0, 0, 0, 1, 1,
-1.251673, 0.9135943, -0.9676298, 0, 0, 0, 1, 1,
-1.247175, -0.4244275, -1.741583, 0, 0, 0, 1, 1,
-1.24393, -0.9249427, -2.138211, 1, 1, 1, 1, 1,
-1.236002, -0.6145736, -1.899574, 1, 1, 1, 1, 1,
-1.224309, 1.76412, -0.7118667, 1, 1, 1, 1, 1,
-1.22276, -0.6570178, -2.613664, 1, 1, 1, 1, 1,
-1.221933, 0.6515076, 0.390909, 1, 1, 1, 1, 1,
-1.215733, 0.2063525, -1.443042, 1, 1, 1, 1, 1,
-1.212812, -0.4638791, -2.631212, 1, 1, 1, 1, 1,
-1.209848, 0.877997, -2.242481, 1, 1, 1, 1, 1,
-1.199677, -0.02217652, 0.07729546, 1, 1, 1, 1, 1,
-1.198257, -1.298936, -3.136059, 1, 1, 1, 1, 1,
-1.194566, 1.054265, -0.8734456, 1, 1, 1, 1, 1,
-1.182438, -1.687984, -0.7609559, 1, 1, 1, 1, 1,
-1.181588, 0.460023, -0.8297002, 1, 1, 1, 1, 1,
-1.174766, -0.8822557, -2.406432, 1, 1, 1, 1, 1,
-1.170138, 1.29336, -1.763587, 1, 1, 1, 1, 1,
-1.167821, -0.09960079, -3.261032, 0, 0, 1, 1, 1,
-1.167573, -0.5877627, -3.874381, 1, 0, 0, 1, 1,
-1.161437, -1.11688, -2.203933, 1, 0, 0, 1, 1,
-1.159243, -1.496597, -2.096984, 1, 0, 0, 1, 1,
-1.151509, -1.754837, -0.3338284, 1, 0, 0, 1, 1,
-1.143058, 1.492396, -0.5223496, 1, 0, 0, 1, 1,
-1.139491, 0.0781491, -2.552785, 0, 0, 0, 1, 1,
-1.123244, 1.559491, 0.1155483, 0, 0, 0, 1, 1,
-1.115125, 0.6180918, -0.3973012, 0, 0, 0, 1, 1,
-1.110284, -0.1050371, -1.357776, 0, 0, 0, 1, 1,
-1.08606, 1.223813, -2.298529, 0, 0, 0, 1, 1,
-1.085041, -0.2624753, -1.621869, 0, 0, 0, 1, 1,
-1.076323, -0.6363468, -3.019902, 0, 0, 0, 1, 1,
-1.066391, 0.2681544, -1.691634, 1, 1, 1, 1, 1,
-1.06008, 1.311487, -0.8938522, 1, 1, 1, 1, 1,
-1.056847, 0.08931475, -0.7969139, 1, 1, 1, 1, 1,
-1.046122, 0.5692335, -1.189963, 1, 1, 1, 1, 1,
-1.044982, 1.969069, -0.7796422, 1, 1, 1, 1, 1,
-1.036184, 2.698222, 0.1945854, 1, 1, 1, 1, 1,
-1.029552, 1.165323, 0.3318921, 1, 1, 1, 1, 1,
-1.017516, -0.25298, -2.639622, 1, 1, 1, 1, 1,
-1.010082, 0.7500821, -2.264986, 1, 1, 1, 1, 1,
-1.00606, 0.4985949, -0.413887, 1, 1, 1, 1, 1,
-1.003423, -2.328565, -3.04197, 1, 1, 1, 1, 1,
-0.9950722, 2.674741, -1.732523, 1, 1, 1, 1, 1,
-0.9797259, -0.3614145, -0.9710127, 1, 1, 1, 1, 1,
-0.9770685, -1.576528, -2.386545, 1, 1, 1, 1, 1,
-0.9768602, -0.7883022, -2.423119, 1, 1, 1, 1, 1,
-0.9686788, 0.5893301, -1.785736, 0, 0, 1, 1, 1,
-0.958836, 0.3003952, -1.295249, 1, 0, 0, 1, 1,
-0.9560979, -2.046936, -3.482554, 1, 0, 0, 1, 1,
-0.9550323, -0.2685717, -1.696983, 1, 0, 0, 1, 1,
-0.9538339, -0.4138367, -1.795508, 1, 0, 0, 1, 1,
-0.9517817, 0.9755787, 0.6830491, 1, 0, 0, 1, 1,
-0.9484872, -2.162583, -2.197186, 0, 0, 0, 1, 1,
-0.9483159, 0.8469447, -1.93045, 0, 0, 0, 1, 1,
-0.9370591, 1.301556, -0.5645902, 0, 0, 0, 1, 1,
-0.9313773, 0.1139487, -1.046589, 0, 0, 0, 1, 1,
-0.9309535, -0.7541863, -1.684208, 0, 0, 0, 1, 1,
-0.9197773, 0.4646836, -1.357401, 0, 0, 0, 1, 1,
-0.9139248, -2.411326, -0.6941161, 0, 0, 0, 1, 1,
-0.9085807, -0.5242915, -2.382694, 1, 1, 1, 1, 1,
-0.9036158, 0.01180653, -2.092622, 1, 1, 1, 1, 1,
-0.9032111, -0.04419733, -1.071677, 1, 1, 1, 1, 1,
-0.9014562, -1.10311, -2.221253, 1, 1, 1, 1, 1,
-0.8857071, -0.5865313, -2.043964, 1, 1, 1, 1, 1,
-0.885551, 0.3109711, -1.135993, 1, 1, 1, 1, 1,
-0.8850537, -0.1706268, -1.867302, 1, 1, 1, 1, 1,
-0.8836387, 0.321894, -0.807461, 1, 1, 1, 1, 1,
-0.8782328, 0.9784266, -0.7369358, 1, 1, 1, 1, 1,
-0.8781217, -0.3517225, -1.750209, 1, 1, 1, 1, 1,
-0.8731072, 0.8993605, -0.5629027, 1, 1, 1, 1, 1,
-0.871062, -0.7650005, -3.1417, 1, 1, 1, 1, 1,
-0.8691203, 0.6447744, -0.7045622, 1, 1, 1, 1, 1,
-0.8623852, -0.9121672, -1.094964, 1, 1, 1, 1, 1,
-0.8623746, -0.4535299, -1.087775, 1, 1, 1, 1, 1,
-0.8619127, -0.1002382, -1.966595, 0, 0, 1, 1, 1,
-0.8585725, 1.544733, -1.020005, 1, 0, 0, 1, 1,
-0.8552358, 0.3156635, -1.564226, 1, 0, 0, 1, 1,
-0.8536267, -0.007150545, -1.701722, 1, 0, 0, 1, 1,
-0.8485807, 1.076311, -1.811722, 1, 0, 0, 1, 1,
-0.8449063, 1.947841, -1.61807, 1, 0, 0, 1, 1,
-0.8445126, 1.57312, 1.056026, 0, 0, 0, 1, 1,
-0.844434, -0.6808234, -1.40793, 0, 0, 0, 1, 1,
-0.8439648, 0.1046477, -1.678286, 0, 0, 0, 1, 1,
-0.8433885, -0.1882517, -1.476649, 0, 0, 0, 1, 1,
-0.8416687, -0.7312816, -2.306014, 0, 0, 0, 1, 1,
-0.8392404, 0.06833571, -2.45613, 0, 0, 0, 1, 1,
-0.8369651, -0.7167049, -3.234912, 0, 0, 0, 1, 1,
-0.83122, 0.1559599, -1.870151, 1, 1, 1, 1, 1,
-0.8305597, -0.3079139, -3.003849, 1, 1, 1, 1, 1,
-0.8283235, -0.4418156, -2.124769, 1, 1, 1, 1, 1,
-0.8278389, 0.4714441, -0.6576447, 1, 1, 1, 1, 1,
-0.8274863, 1.078387, -0.8663836, 1, 1, 1, 1, 1,
-0.8269524, 0.8394603, -1.633849, 1, 1, 1, 1, 1,
-0.8070672, 0.8953872, -1.435622, 1, 1, 1, 1, 1,
-0.8043892, 0.2974933, -2.449239, 1, 1, 1, 1, 1,
-0.7971298, -1.145095, -2.112194, 1, 1, 1, 1, 1,
-0.7964226, -0.5965819, -1.617543, 1, 1, 1, 1, 1,
-0.7956755, 0.3650794, -1.478366, 1, 1, 1, 1, 1,
-0.7956524, -0.04527135, -2.933108, 1, 1, 1, 1, 1,
-0.7948778, -0.6554002, -1.498111, 1, 1, 1, 1, 1,
-0.7935999, 0.4751652, -2.47612, 1, 1, 1, 1, 1,
-0.7922499, -0.6050962, -2.517683, 1, 1, 1, 1, 1,
-0.7889107, -0.668002, -1.167934, 0, 0, 1, 1, 1,
-0.7874013, 1.921811, 1.106952, 1, 0, 0, 1, 1,
-0.7848686, -0.06074153, -0.4838444, 1, 0, 0, 1, 1,
-0.7833149, -0.5094546, -1.845066, 1, 0, 0, 1, 1,
-0.7811726, 1.057904, 0.6781342, 1, 0, 0, 1, 1,
-0.7760302, -1.200044, -2.550962, 1, 0, 0, 1, 1,
-0.7728001, 0.5694642, -1.385642, 0, 0, 0, 1, 1,
-0.7722396, 0.4832092, -1.317209, 0, 0, 0, 1, 1,
-0.769963, -1.127384, -4.005864, 0, 0, 0, 1, 1,
-0.7606262, -1.796614, -3.233773, 0, 0, 0, 1, 1,
-0.7584602, -2.164551, -1.29423, 0, 0, 0, 1, 1,
-0.7520698, -1.501095, -1.845087, 0, 0, 0, 1, 1,
-0.7495783, -0.8946805, -1.075428, 0, 0, 0, 1, 1,
-0.748431, -0.1153397, -1.081114, 1, 1, 1, 1, 1,
-0.7442217, 1.030372, -0.8420479, 1, 1, 1, 1, 1,
-0.7433081, 0.4520623, -0.5865018, 1, 1, 1, 1, 1,
-0.7394652, 0.6387904, -0.2665211, 1, 1, 1, 1, 1,
-0.7295869, -0.4542393, -0.2794783, 1, 1, 1, 1, 1,
-0.7255935, -0.7358294, -2.830928, 1, 1, 1, 1, 1,
-0.7243971, 1.324573, -2.560973, 1, 1, 1, 1, 1,
-0.7190137, 0.71863, -1.662625, 1, 1, 1, 1, 1,
-0.718933, 0.5986386, -0.8959218, 1, 1, 1, 1, 1,
-0.716037, -1.249969, -2.828732, 1, 1, 1, 1, 1,
-0.7140593, -0.4766458, -1.216998, 1, 1, 1, 1, 1,
-0.7120487, 0.5467248, -1.848182, 1, 1, 1, 1, 1,
-0.7100844, -0.2300885, -2.531541, 1, 1, 1, 1, 1,
-0.7069575, 0.7571957, -0.1542579, 1, 1, 1, 1, 1,
-0.7065035, 0.207679, -0.1364496, 1, 1, 1, 1, 1,
-0.7034575, 0.1102986, -1.454027, 0, 0, 1, 1, 1,
-0.7015989, 1.045976, -0.8904148, 1, 0, 0, 1, 1,
-0.6977832, 0.1961937, -0.8207198, 1, 0, 0, 1, 1,
-0.6967002, 0.3686329, -0.539466, 1, 0, 0, 1, 1,
-0.6941918, 0.01043584, 0.4025152, 1, 0, 0, 1, 1,
-0.6863834, -0.4519911, -3.743549, 1, 0, 0, 1, 1,
-0.6859482, 1.170901, 0.3083865, 0, 0, 0, 1, 1,
-0.6858858, -0.5936862, -1.464348, 0, 0, 0, 1, 1,
-0.6852043, 0.04658977, -2.170532, 0, 0, 0, 1, 1,
-0.6780973, -1.664234, -2.383087, 0, 0, 0, 1, 1,
-0.6768326, 0.07122953, -1.476646, 0, 0, 0, 1, 1,
-0.6681873, -0.5143194, 0.1207507, 0, 0, 0, 1, 1,
-0.6576256, 0.8924892, -2.385774, 0, 0, 0, 1, 1,
-0.6535661, -1.668377, -2.107474, 1, 1, 1, 1, 1,
-0.6535463, -0.2473229, -2.853943, 1, 1, 1, 1, 1,
-0.6487448, 1.253232, -0.6012818, 1, 1, 1, 1, 1,
-0.6482851, 0.3513157, -1.996301, 1, 1, 1, 1, 1,
-0.6468009, -0.1533505, -0.5717812, 1, 1, 1, 1, 1,
-0.6442086, -1.386712, -2.97609, 1, 1, 1, 1, 1,
-0.6417426, 1.102229, 0.1405532, 1, 1, 1, 1, 1,
-0.6375801, 0.8282281, 0.05364659, 1, 1, 1, 1, 1,
-0.6343256, 0.6751499, -1.082554, 1, 1, 1, 1, 1,
-0.6321884, -0.380428, -1.982722, 1, 1, 1, 1, 1,
-0.6189845, -1.303017, -2.910615, 1, 1, 1, 1, 1,
-0.616347, 1.10113, -0.6264142, 1, 1, 1, 1, 1,
-0.6156248, -0.4985995, -2.616074, 1, 1, 1, 1, 1,
-0.6107848, -0.4952251, -1.879956, 1, 1, 1, 1, 1,
-0.6068613, 0.849677, -2.129651, 1, 1, 1, 1, 1,
-0.603908, 0.6119662, -1.409531, 0, 0, 1, 1, 1,
-0.6003438, -1.388695, -2.717358, 1, 0, 0, 1, 1,
-0.596568, 0.723451, 0.7384869, 1, 0, 0, 1, 1,
-0.595509, 0.4526687, -0.3710209, 1, 0, 0, 1, 1,
-0.5884456, -0.5198277, -2.422242, 1, 0, 0, 1, 1,
-0.5859659, -0.195619, -2.412142, 1, 0, 0, 1, 1,
-0.5838233, 0.3589615, 0.5318125, 0, 0, 0, 1, 1,
-0.5793853, 0.1192906, -2.703284, 0, 0, 0, 1, 1,
-0.5741177, -1.622538, -2.151326, 0, 0, 0, 1, 1,
-0.5732604, 1.106564, -0.8540187, 0, 0, 0, 1, 1,
-0.5706202, 1.370152, -0.2114526, 0, 0, 0, 1, 1,
-0.5676646, -0.8003249, -3.050851, 0, 0, 0, 1, 1,
-0.5664758, -0.9778707, -3.045225, 0, 0, 0, 1, 1,
-0.5581945, 0.8017529, 0.9027108, 1, 1, 1, 1, 1,
-0.5562876, -1.533518, -3.892029, 1, 1, 1, 1, 1,
-0.555611, 0.4517115, 0.2640678, 1, 1, 1, 1, 1,
-0.5510846, -1.067614, -3.310004, 1, 1, 1, 1, 1,
-0.5508482, -0.6636375, -1.986398, 1, 1, 1, 1, 1,
-0.5505072, -0.1615506, -3.297815, 1, 1, 1, 1, 1,
-0.5464678, -1.485711, -1.148706, 1, 1, 1, 1, 1,
-0.5415225, -0.1349224, -2.15988, 1, 1, 1, 1, 1,
-0.5277436, -0.5771666, -1.648568, 1, 1, 1, 1, 1,
-0.5183482, 0.6545198, -0.5337134, 1, 1, 1, 1, 1,
-0.499946, 0.2213998, -1.760576, 1, 1, 1, 1, 1,
-0.4983078, 1.82099, 0.04247539, 1, 1, 1, 1, 1,
-0.4971428, -0.5974878, -2.199979, 1, 1, 1, 1, 1,
-0.4954337, -0.6894187, -2.240143, 1, 1, 1, 1, 1,
-0.489292, 0.1833462, -3.217691, 1, 1, 1, 1, 1,
-0.4825613, 1.105841, -0.6921426, 0, 0, 1, 1, 1,
-0.481005, 0.5775388, -1.988423, 1, 0, 0, 1, 1,
-0.4764922, -0.441283, -4.066541, 1, 0, 0, 1, 1,
-0.472614, -1.633, -2.177392, 1, 0, 0, 1, 1,
-0.4722447, -0.5051147, -3.672999, 1, 0, 0, 1, 1,
-0.4715145, -0.2216339, -3.085053, 1, 0, 0, 1, 1,
-0.4682476, 0.1766844, -1.210972, 0, 0, 0, 1, 1,
-0.4633175, 0.3128097, -1.799152, 0, 0, 0, 1, 1,
-0.4525352, -2.123592, -4.176748, 0, 0, 0, 1, 1,
-0.4484869, 1.115216, 0.6280291, 0, 0, 0, 1, 1,
-0.4476453, 1.742063, -1.087175, 0, 0, 0, 1, 1,
-0.447304, -0.7696233, -0.2158168, 0, 0, 0, 1, 1,
-0.4470794, 1.659111, -0.6078799, 0, 0, 0, 1, 1,
-0.4373696, 0.7226607, -1.587743, 1, 1, 1, 1, 1,
-0.4363859, -0.7678722, -2.941857, 1, 1, 1, 1, 1,
-0.4357116, 1.840011, -1.617064, 1, 1, 1, 1, 1,
-0.4329284, 1.215397, -0.56045, 1, 1, 1, 1, 1,
-0.4318762, -0.2003965, -1.592345, 1, 1, 1, 1, 1,
-0.4283357, -1.854542, -3.647021, 1, 1, 1, 1, 1,
-0.4224597, -0.09096383, 0.1164888, 1, 1, 1, 1, 1,
-0.4174353, 0.4614519, -1.415177, 1, 1, 1, 1, 1,
-0.4153798, -0.7975624, -1.155211, 1, 1, 1, 1, 1,
-0.4131868, 1.882816, -0.09439643, 1, 1, 1, 1, 1,
-0.4058433, -1.876593, -3.055028, 1, 1, 1, 1, 1,
-0.4026226, 0.09598229, -1.307717, 1, 1, 1, 1, 1,
-0.3998166, 0.1708904, -1.172558, 1, 1, 1, 1, 1,
-0.3983509, 1.580482, -1.702224, 1, 1, 1, 1, 1,
-0.3934816, -0.0474667, -2.271172, 1, 1, 1, 1, 1,
-0.3919776, 0.9633888, -0.3816929, 0, 0, 1, 1, 1,
-0.3808555, 2.374648, 0.85542, 1, 0, 0, 1, 1,
-0.3788366, 1.146802, -0.2032877, 1, 0, 0, 1, 1,
-0.3775204, 0.3750837, 0.04157891, 1, 0, 0, 1, 1,
-0.373873, 0.7051875, -0.326671, 1, 0, 0, 1, 1,
-0.3712724, -1.063648, -4.006018, 1, 0, 0, 1, 1,
-0.370399, -1.658284, -2.788212, 0, 0, 0, 1, 1,
-0.3702892, -0.09066737, -3.876412, 0, 0, 0, 1, 1,
-0.3691591, -2.167047, -4.639221, 0, 0, 0, 1, 1,
-0.3689426, -0.7858725, -2.769211, 0, 0, 0, 1, 1,
-0.3676482, 0.09506233, 0.3999725, 0, 0, 0, 1, 1,
-0.3657555, 0.9014285, 0.3232249, 0, 0, 0, 1, 1,
-0.3641148, -0.369059, -1.870329, 0, 0, 0, 1, 1,
-0.3631225, -0.0495253, -2.133962, 1, 1, 1, 1, 1,
-0.3628119, -1.000733, -1.38674, 1, 1, 1, 1, 1,
-0.3627603, -0.4904296, -2.16246, 1, 1, 1, 1, 1,
-0.3609821, -0.4640687, 0.2508836, 1, 1, 1, 1, 1,
-0.3547995, 0.5719736, -1.626222, 1, 1, 1, 1, 1,
-0.3488156, 0.2327666, -0.3056984, 1, 1, 1, 1, 1,
-0.3486307, 0.1765132, -0.8351688, 1, 1, 1, 1, 1,
-0.3449398, 0.821643, -2.143259, 1, 1, 1, 1, 1,
-0.3395528, 1.175821, -0.7361283, 1, 1, 1, 1, 1,
-0.337002, 0.2243307, 0.09463363, 1, 1, 1, 1, 1,
-0.3359461, 0.07670319, -0.2038719, 1, 1, 1, 1, 1,
-0.3357194, 0.6393021, 0.5291977, 1, 1, 1, 1, 1,
-0.3315595, 0.1313395, -0.1960927, 1, 1, 1, 1, 1,
-0.3136877, 0.9447901, -0.3163125, 1, 1, 1, 1, 1,
-0.3108265, 0.4717195, -0.1677587, 1, 1, 1, 1, 1,
-0.3077388, 1.040558, -0.2433672, 0, 0, 1, 1, 1,
-0.3053347, -0.1359575, -2.961806, 1, 0, 0, 1, 1,
-0.3041298, -0.9852216, -3.679169, 1, 0, 0, 1, 1,
-0.3028359, -1.358593, -3.574704, 1, 0, 0, 1, 1,
-0.2978023, 0.4493161, 0.1543804, 1, 0, 0, 1, 1,
-0.2961991, -0.02517403, -0.6755875, 1, 0, 0, 1, 1,
-0.2950402, -0.1166593, -1.243625, 0, 0, 0, 1, 1,
-0.2947571, 1.362301, -0.5360748, 0, 0, 0, 1, 1,
-0.2917645, -0.5605418, -0.9342746, 0, 0, 0, 1, 1,
-0.2881339, -0.168771, -0.9689905, 0, 0, 0, 1, 1,
-0.2870429, -0.3251761, -1.635185, 0, 0, 0, 1, 1,
-0.2847772, 2.786959, 0.8346923, 0, 0, 0, 1, 1,
-0.2805421, 0.3090815, -0.3283237, 0, 0, 0, 1, 1,
-0.2752535, -0.3734775, -2.677999, 1, 1, 1, 1, 1,
-0.2737475, 0.6028522, -0.8663073, 1, 1, 1, 1, 1,
-0.2735012, -1.21744, -2.501485, 1, 1, 1, 1, 1,
-0.273416, -3.218865, -1.86044, 1, 1, 1, 1, 1,
-0.2700855, 0.2286053, -0.1024626, 1, 1, 1, 1, 1,
-0.2671365, -0.009151022, 0.6077355, 1, 1, 1, 1, 1,
-0.2630474, 0.6902055, -0.6758174, 1, 1, 1, 1, 1,
-0.2627892, -1.511518, -4.126013, 1, 1, 1, 1, 1,
-0.2555588, 0.2936728, -0.09388592, 1, 1, 1, 1, 1,
-0.2474357, 0.1745819, -0.4156749, 1, 1, 1, 1, 1,
-0.2450263, 0.2451917, -0.811673, 1, 1, 1, 1, 1,
-0.2408242, 0.6680675, 1.23485, 1, 1, 1, 1, 1,
-0.2376992, 1.438566, 0.6960931, 1, 1, 1, 1, 1,
-0.2373019, 2.206283, -0.7785419, 1, 1, 1, 1, 1,
-0.2354818, 0.9320149, 1.01867, 1, 1, 1, 1, 1,
-0.2302861, -0.005552672, -1.982665, 0, 0, 1, 1, 1,
-0.2270939, -0.2302264, -1.419291, 1, 0, 0, 1, 1,
-0.2270554, -0.9944744, -1.767212, 1, 0, 0, 1, 1,
-0.226547, -0.285653, -2.20393, 1, 0, 0, 1, 1,
-0.2236805, 2.086564, 0.2124175, 1, 0, 0, 1, 1,
-0.2213942, -0.6795707, -1.782259, 1, 0, 0, 1, 1,
-0.2171135, -1.164744, -2.893674, 0, 0, 0, 1, 1,
-0.2157147, -0.07019348, -0.5413994, 0, 0, 0, 1, 1,
-0.212358, 0.2306094, -0.8933211, 0, 0, 0, 1, 1,
-0.2123095, -0.08128351, -1.482171, 0, 0, 0, 1, 1,
-0.2062212, -1.416319, -2.720102, 0, 0, 0, 1, 1,
-0.2024582, 0.154385, -4.421767, 0, 0, 0, 1, 1,
-0.2010014, 1.461638, 0.03385439, 0, 0, 0, 1, 1,
-0.1981009, 0.1588842, 0.8956186, 1, 1, 1, 1, 1,
-0.1978527, -0.102364, -0.9386023, 1, 1, 1, 1, 1,
-0.1974757, 1.838236, -0.3393556, 1, 1, 1, 1, 1,
-0.1946217, -0.4196818, -1.925705, 1, 1, 1, 1, 1,
-0.1868377, -1.766017, -3.404999, 1, 1, 1, 1, 1,
-0.1856729, -0.2666477, -2.386454, 1, 1, 1, 1, 1,
-0.1853818, -1.053827, -3.536917, 1, 1, 1, 1, 1,
-0.1826174, 0.005343549, -1.794895, 1, 1, 1, 1, 1,
-0.1814717, -1.523795, -3.74268, 1, 1, 1, 1, 1,
-0.17749, 0.1393306, -0.3124376, 1, 1, 1, 1, 1,
-0.1759571, -0.2089487, -2.129725, 1, 1, 1, 1, 1,
-0.1731606, 0.4313096, -0.4454578, 1, 1, 1, 1, 1,
-0.1700579, 1.914463, 0.900181, 1, 1, 1, 1, 1,
-0.1690864, 1.759171, -1.300543, 1, 1, 1, 1, 1,
-0.1685992, 0.4189387, -0.646349, 1, 1, 1, 1, 1,
-0.1632175, -0.881272, -3.228698, 0, 0, 1, 1, 1,
-0.1616184, 0.7433715, -1.052113, 1, 0, 0, 1, 1,
-0.1593096, -1.13296, -2.917211, 1, 0, 0, 1, 1,
-0.1590197, 2.187938, -0.1341398, 1, 0, 0, 1, 1,
-0.1578238, 0.8157138, -0.4055385, 1, 0, 0, 1, 1,
-0.156965, 0.3327895, -2.663057, 1, 0, 0, 1, 1,
-0.1473414, 0.6089256, 0.680801, 0, 0, 0, 1, 1,
-0.1419961, 0.9036283, -0.4319842, 0, 0, 0, 1, 1,
-0.1330525, 0.6662834, -0.9067751, 0, 0, 0, 1, 1,
-0.1328668, -0.5819362, -2.947645, 0, 0, 0, 1, 1,
-0.1314238, -0.3707805, -0.9840541, 0, 0, 0, 1, 1,
-0.1283096, 0.0533737, -2.158401, 0, 0, 0, 1, 1,
-0.1260885, 0.04738481, -2.012117, 0, 0, 0, 1, 1,
-0.1237161, -0.9752086, -2.730209, 1, 1, 1, 1, 1,
-0.1223987, 0.3427962, 0.4378007, 1, 1, 1, 1, 1,
-0.121855, 0.589054, -0.5390947, 1, 1, 1, 1, 1,
-0.1189122, 0.06295353, -1.179805, 1, 1, 1, 1, 1,
-0.1186809, -1.345972, -1.867711, 1, 1, 1, 1, 1,
-0.1183736, 1.495937, 0.9302124, 1, 1, 1, 1, 1,
-0.1161296, -0.4921979, -2.898797, 1, 1, 1, 1, 1,
-0.1134261, -1.105481, -2.162148, 1, 1, 1, 1, 1,
-0.1111801, -0.5910383, -1.457435, 1, 1, 1, 1, 1,
-0.1110132, 0.1822501, -1.761259, 1, 1, 1, 1, 1,
-0.109637, -0.8220212, -2.421773, 1, 1, 1, 1, 1,
-0.1064875, 0.4782529, -0.2606451, 1, 1, 1, 1, 1,
-0.103399, -0.5292063, -3.084663, 1, 1, 1, 1, 1,
-0.1033761, 0.4879355, -2.503774, 1, 1, 1, 1, 1,
-0.1023893, 0.3558351, 0.637494, 1, 1, 1, 1, 1,
-0.1019909, -1.775795, -3.525288, 0, 0, 1, 1, 1,
-0.1005851, -1.12123, -1.442541, 1, 0, 0, 1, 1,
-0.1005559, 0.8094795, -0.4424308, 1, 0, 0, 1, 1,
-0.09977045, 0.00847037, -0.4571561, 1, 0, 0, 1, 1,
-0.09789445, -0.1260198, -1.416952, 1, 0, 0, 1, 1,
-0.09479318, 1.929723, 0.195827, 1, 0, 0, 1, 1,
-0.09257592, 0.2740748, -0.2112688, 0, 0, 0, 1, 1,
-0.09229168, -0.2329945, -1.614053, 0, 0, 0, 1, 1,
-0.09180408, 1.908876, -0.6137515, 0, 0, 0, 1, 1,
-0.0876172, -0.2249194, -3.633796, 0, 0, 0, 1, 1,
-0.08758757, 0.1211146, -0.440538, 0, 0, 0, 1, 1,
-0.0862018, -0.09308653, -3.019665, 0, 0, 0, 1, 1,
-0.08546383, -0.348232, -4.094742, 0, 0, 0, 1, 1,
-0.08511692, 2.547644, 0.2209595, 1, 1, 1, 1, 1,
-0.07870085, 1.19122, 0.5795278, 1, 1, 1, 1, 1,
-0.076905, -1.381388, -4.54068, 1, 1, 1, 1, 1,
-0.07493392, 0.8827441, 0.124056, 1, 1, 1, 1, 1,
-0.07466738, 0.01625583, -1.060616, 1, 1, 1, 1, 1,
-0.07452635, 0.4523679, -0.05299692, 1, 1, 1, 1, 1,
-0.07375327, 0.3831553, 1.22953, 1, 1, 1, 1, 1,
-0.07312528, 1.295935, 0.837813, 1, 1, 1, 1, 1,
-0.06710499, -0.128557, -2.629164, 1, 1, 1, 1, 1,
-0.06625113, -0.2672288, -1.97317, 1, 1, 1, 1, 1,
-0.06558529, -1.956089, -3.12056, 1, 1, 1, 1, 1,
-0.06198868, 0.7338417, 0.783631, 1, 1, 1, 1, 1,
-0.05627435, -0.7552259, -3.173509, 1, 1, 1, 1, 1,
-0.05146364, 0.5729915, -1.016405, 1, 1, 1, 1, 1,
-0.04808668, 0.2674769, -0.5852851, 1, 1, 1, 1, 1,
-0.04443043, 0.7296802, 1.888494, 0, 0, 1, 1, 1,
-0.04428596, -0.471918, -2.19375, 1, 0, 0, 1, 1,
-0.04300044, 0.4716503, -0.4381475, 1, 0, 0, 1, 1,
-0.03936057, -1.080349, -2.722403, 1, 0, 0, 1, 1,
-0.03904948, -1.753765, -4.182786, 1, 0, 0, 1, 1,
-0.03792069, -0.2308554, -2.088895, 1, 0, 0, 1, 1,
-0.03773857, 0.2401477, -1.106688, 0, 0, 0, 1, 1,
-0.03153041, 0.4307644, 0.2385619, 0, 0, 0, 1, 1,
-0.03009993, -0.9899848, -4.088054, 0, 0, 0, 1, 1,
-0.02813892, 0.5014992, -1.84296, 0, 0, 0, 1, 1,
-0.02775363, -0.6772203, -3.422705, 0, 0, 0, 1, 1,
-0.0250008, -0.4494629, -3.937721, 0, 0, 0, 1, 1,
-0.02284549, 0.643399, 0.4775323, 0, 0, 0, 1, 1,
-0.02003708, 1.693632, -0.3357096, 1, 1, 1, 1, 1,
-0.01943075, -0.4838868, -3.1933, 1, 1, 1, 1, 1,
-0.0189695, 1.760738, -0.7798514, 1, 1, 1, 1, 1,
-0.01153121, -0.6685712, -2.479917, 1, 1, 1, 1, 1,
-0.0102177, -3.111348, -2.220689, 1, 1, 1, 1, 1,
-0.009753715, -0.7603493, -0.4548782, 1, 1, 1, 1, 1,
-0.006315088, -0.5166364, -3.257746, 1, 1, 1, 1, 1,
-0.002516555, -1.008205, -3.286657, 1, 1, 1, 1, 1,
-0.001988897, 1.992226, -1.873177, 1, 1, 1, 1, 1,
-0.0003030829, 0.2444823, -0.9715597, 1, 1, 1, 1, 1,
0.00850602, 0.05892972, 0.2584051, 1, 1, 1, 1, 1,
0.01153987, 1.291794, 0.181641, 1, 1, 1, 1, 1,
0.0123436, 0.7491791, -1.597932, 1, 1, 1, 1, 1,
0.01275513, -0.2368251, 1.868464, 1, 1, 1, 1, 1,
0.01694035, -0.4738725, 3.44862, 1, 1, 1, 1, 1,
0.02176384, 1.510451, 1.027107, 0, 0, 1, 1, 1,
0.02269498, -2.084486, 1.932275, 1, 0, 0, 1, 1,
0.0229523, -1.825644, 2.460817, 1, 0, 0, 1, 1,
0.02983734, -2.482203, 3.891071, 1, 0, 0, 1, 1,
0.03111703, 1.33469, 0.01060857, 1, 0, 0, 1, 1,
0.04091391, 0.4510224, -0.2873011, 1, 0, 0, 1, 1,
0.04123275, -1.588734, 2.449601, 0, 0, 0, 1, 1,
0.04258804, 0.7736218, -2.96525, 0, 0, 0, 1, 1,
0.04339263, 0.8599374, -0.5438485, 0, 0, 0, 1, 1,
0.04434993, -0.2336418, 2.530516, 0, 0, 0, 1, 1,
0.04946287, -0.6456726, 3.467968, 0, 0, 0, 1, 1,
0.05422683, -1.14905, 4.086066, 0, 0, 0, 1, 1,
0.06039935, 0.3864917, 0.02813437, 0, 0, 0, 1, 1,
0.06112735, 1.00554, 0.4338425, 1, 1, 1, 1, 1,
0.06239515, 0.04240833, 3.523609, 1, 1, 1, 1, 1,
0.06402164, 0.3292865, 0.06087695, 1, 1, 1, 1, 1,
0.06545917, -0.1927718, 4.983693, 1, 1, 1, 1, 1,
0.06547223, 0.8831191, -0.1139346, 1, 1, 1, 1, 1,
0.06764525, -0.8256583, 2.618172, 1, 1, 1, 1, 1,
0.07725228, -0.329113, 2.076091, 1, 1, 1, 1, 1,
0.08514193, 0.1609946, -1.451374, 1, 1, 1, 1, 1,
0.08535556, 1.140887, -1.191126, 1, 1, 1, 1, 1,
0.08715094, -3.042414, 2.603754, 1, 1, 1, 1, 1,
0.0894553, 0.3596296, -0.1026125, 1, 1, 1, 1, 1,
0.09003171, 0.4834739, -1.885956, 1, 1, 1, 1, 1,
0.1085272, -0.1651491, 1.67614, 1, 1, 1, 1, 1,
0.1089364, 1.846173, 0.7426889, 1, 1, 1, 1, 1,
0.1137323, 0.0477959, 1.155017, 1, 1, 1, 1, 1,
0.1142458, 0.6894585, -1.422206, 0, 0, 1, 1, 1,
0.1147996, 0.8318692, -1.819144, 1, 0, 0, 1, 1,
0.1152455, 0.7665693, 0.3126369, 1, 0, 0, 1, 1,
0.1207542, -0.331894, 4.835061, 1, 0, 0, 1, 1,
0.12523, 0.3337857, -0.2141176, 1, 0, 0, 1, 1,
0.1259779, 0.8430789, 1.197137, 1, 0, 0, 1, 1,
0.1272567, 0.7405348, -0.6886135, 0, 0, 0, 1, 1,
0.1282288, -1.076066, 2.072534, 0, 0, 0, 1, 1,
0.1296616, -1.226526, 3.115626, 0, 0, 0, 1, 1,
0.1312748, 1.119501, 0.5113798, 0, 0, 0, 1, 1,
0.1322339, -0.1553349, 3.844787, 0, 0, 0, 1, 1,
0.1322757, -1.521438, 2.521879, 0, 0, 0, 1, 1,
0.1354464, 1.169845, 0.169334, 0, 0, 0, 1, 1,
0.1437504, -0.2103868, 3.436783, 1, 1, 1, 1, 1,
0.1451807, 0.5387022, -2.743362, 1, 1, 1, 1, 1,
0.14646, 1.99046, -0.5014077, 1, 1, 1, 1, 1,
0.1469963, 0.2543545, 1.286668, 1, 1, 1, 1, 1,
0.1511456, 0.0004673443, 1.554424, 1, 1, 1, 1, 1,
0.1565713, 1.21351, -0.4507308, 1, 1, 1, 1, 1,
0.1613112, 0.5250414, -0.6094728, 1, 1, 1, 1, 1,
0.1633004, 1.375298, -1.253708, 1, 1, 1, 1, 1,
0.1655505, 0.6903242, 0.2272163, 1, 1, 1, 1, 1,
0.1704112, -1.442469, 2.873392, 1, 1, 1, 1, 1,
0.1732619, 1.430417, -0.4048269, 1, 1, 1, 1, 1,
0.1777731, 1.581953, 0.2869155, 1, 1, 1, 1, 1,
0.1816667, -0.453339, 1.954526, 1, 1, 1, 1, 1,
0.1838855, 1.023929, 1.657185, 1, 1, 1, 1, 1,
0.1919205, 0.7309545, -0.3603637, 1, 1, 1, 1, 1,
0.1933964, -0.2607408, 5.086673, 0, 0, 1, 1, 1,
0.1953799, 0.7056201, -0.9777097, 1, 0, 0, 1, 1,
0.1992296, 0.331271, 0.1493231, 1, 0, 0, 1, 1,
0.2033767, 0.6051093, -1.018577, 1, 0, 0, 1, 1,
0.2053207, -1.207079, 3.2795, 1, 0, 0, 1, 1,
0.2078941, 1.145226, -0.1967776, 1, 0, 0, 1, 1,
0.2115846, -0.5447282, 3.079861, 0, 0, 0, 1, 1,
0.2159707, -0.762962, 3.341869, 0, 0, 0, 1, 1,
0.2162537, 1.645179, -0.2964322, 0, 0, 0, 1, 1,
0.2185603, 1.862072, -1.923956, 0, 0, 0, 1, 1,
0.2266819, -0.738946, 1.639058, 0, 0, 0, 1, 1,
0.2369796, 0.3368045, -0.2571958, 0, 0, 0, 1, 1,
0.2384676, -0.823632, 2.971438, 0, 0, 0, 1, 1,
0.2388995, 0.3567446, 1.667294, 1, 1, 1, 1, 1,
0.240305, 0.64449, -0.2187647, 1, 1, 1, 1, 1,
0.2427252, -1.166573, 2.528918, 1, 1, 1, 1, 1,
0.2442381, -1.27766, 2.130892, 1, 1, 1, 1, 1,
0.2599811, 0.1177861, 0.0791331, 1, 1, 1, 1, 1,
0.2601454, -0.4685127, 3.219155, 1, 1, 1, 1, 1,
0.2618526, 0.1697129, -0.2992801, 1, 1, 1, 1, 1,
0.2630501, 0.6238835, -1.062946, 1, 1, 1, 1, 1,
0.2661309, -0.3814442, 1.541205, 1, 1, 1, 1, 1,
0.2699571, -1.833388, 2.383454, 1, 1, 1, 1, 1,
0.2701924, -0.07928166, 3.608654, 1, 1, 1, 1, 1,
0.2710179, 0.3706237, -0.2656783, 1, 1, 1, 1, 1,
0.2715194, -0.5016977, 3.095257, 1, 1, 1, 1, 1,
0.2734251, 0.1206338, 1.033234, 1, 1, 1, 1, 1,
0.2755785, 0.3655144, 0.5554169, 1, 1, 1, 1, 1,
0.2779147, 1.485209, 0.79807, 0, 0, 1, 1, 1,
0.2845061, -0.8025926, 3.358959, 1, 0, 0, 1, 1,
0.2846431, -0.3140184, 2.639022, 1, 0, 0, 1, 1,
0.2979308, 1.278154, -1.932365, 1, 0, 0, 1, 1,
0.2979609, -0.7897552, 1.98394, 1, 0, 0, 1, 1,
0.2997178, -1.650251, 2.786284, 1, 0, 0, 1, 1,
0.3006904, -0.2426222, 0.3402521, 0, 0, 0, 1, 1,
0.3046647, 0.1386571, 0.3156444, 0, 0, 0, 1, 1,
0.3059939, 1.731104, 0.6735188, 0, 0, 0, 1, 1,
0.3063165, 1.90277, -0.2101126, 0, 0, 0, 1, 1,
0.3082694, -1.635293, 3.784289, 0, 0, 0, 1, 1,
0.3122334, -0.7449554, 1.740824, 0, 0, 0, 1, 1,
0.3158349, -0.149014, 4.277414, 0, 0, 0, 1, 1,
0.3189453, 0.5950344, 0.7085338, 1, 1, 1, 1, 1,
0.3206114, -0.106818, 1.841148, 1, 1, 1, 1, 1,
0.320743, 1.218223, -0.4989176, 1, 1, 1, 1, 1,
0.3222087, -0.8444985, 2.963451, 1, 1, 1, 1, 1,
0.3259973, 0.1907664, 2.206962, 1, 1, 1, 1, 1,
0.3319247, -0.1281077, 2.745296, 1, 1, 1, 1, 1,
0.3326145, -1.682829, 2.298569, 1, 1, 1, 1, 1,
0.3328438, 0.1427202, 0.9267728, 1, 1, 1, 1, 1,
0.3343504, 1.094755, 0.8862962, 1, 1, 1, 1, 1,
0.3351173, -0.4360318, 2.1206, 1, 1, 1, 1, 1,
0.3386292, 0.3434167, 0.7193065, 1, 1, 1, 1, 1,
0.3408459, -0.5335637, 2.031768, 1, 1, 1, 1, 1,
0.3439091, -0.7170944, 2.285516, 1, 1, 1, 1, 1,
0.346244, 1.247607, -0.6167984, 1, 1, 1, 1, 1,
0.3479156, -0.7614849, 1.379362, 1, 1, 1, 1, 1,
0.3523192, -1.243243, 4.623901, 0, 0, 1, 1, 1,
0.3538133, -0.9754333, 1.586788, 1, 0, 0, 1, 1,
0.3540113, 0.298807, 0.7796132, 1, 0, 0, 1, 1,
0.3584805, -1.13447, 4.254773, 1, 0, 0, 1, 1,
0.3606794, 0.9278016, -0.6300324, 1, 0, 0, 1, 1,
0.3678029, -1.117841, 3.298717, 1, 0, 0, 1, 1,
0.3715425, 0.4275677, 0.6439222, 0, 0, 0, 1, 1,
0.3725675, -0.2114493, 1.980396, 0, 0, 0, 1, 1,
0.3881102, 0.4769771, 1.338113, 0, 0, 0, 1, 1,
0.3911789, 1.112511, 1.445628, 0, 0, 0, 1, 1,
0.3978414, 0.6269626, -0.02206471, 0, 0, 0, 1, 1,
0.4029283, -0.3415839, 1.777724, 0, 0, 0, 1, 1,
0.4048347, 1.133856, 1.142765, 0, 0, 0, 1, 1,
0.4075308, 0.6037882, 1.736617, 1, 1, 1, 1, 1,
0.4099487, 0.4186206, 0.08776715, 1, 1, 1, 1, 1,
0.4117481, -0.71986, 1.044731, 1, 1, 1, 1, 1,
0.4146391, 0.4966814, 0.8286747, 1, 1, 1, 1, 1,
0.4156037, 0.5068063, 2.183741, 1, 1, 1, 1, 1,
0.4167791, 0.4022551, 0.3032021, 1, 1, 1, 1, 1,
0.4192828, 0.520989, -0.06485171, 1, 1, 1, 1, 1,
0.4194921, -0.7601735, -0.1193694, 1, 1, 1, 1, 1,
0.4201165, 1.523284, -2.53969, 1, 1, 1, 1, 1,
0.4272763, -1.006412, 2.060219, 1, 1, 1, 1, 1,
0.4320433, -0.2842591, 2.572245, 1, 1, 1, 1, 1,
0.4355638, -0.3036165, 1.489747, 1, 1, 1, 1, 1,
0.4428372, 0.5043474, 2.678882, 1, 1, 1, 1, 1,
0.443092, 1.267581, -0.8711181, 1, 1, 1, 1, 1,
0.4447572, 0.6856873, 1.949842, 1, 1, 1, 1, 1,
0.4462988, -1.214346, 2.352222, 0, 0, 1, 1, 1,
0.4490846, -0.6302803, 2.356987, 1, 0, 0, 1, 1,
0.4502607, 0.09389019, 2.936972, 1, 0, 0, 1, 1,
0.4533766, -0.2004592, 1.927748, 1, 0, 0, 1, 1,
0.4537328, -1.226411, 1.758068, 1, 0, 0, 1, 1,
0.4554859, -0.1374668, 2.605165, 1, 0, 0, 1, 1,
0.4561674, 0.783846, 0.1494174, 0, 0, 0, 1, 1,
0.4581318, 0.2573854, -1.101578, 0, 0, 0, 1, 1,
0.4581566, 0.08844004, 1.103407, 0, 0, 0, 1, 1,
0.4636335, 0.2165568, 1.598854, 0, 0, 0, 1, 1,
0.4701079, -1.134952, 2.917133, 0, 0, 0, 1, 1,
0.4711572, 0.922336, 0.8597447, 0, 0, 0, 1, 1,
0.4718224, 0.1985145, 1.292676, 0, 0, 0, 1, 1,
0.4735688, 0.5364925, 0.4030112, 1, 1, 1, 1, 1,
0.4802585, -0.8073519, 3.194368, 1, 1, 1, 1, 1,
0.4806739, 0.2683766, -0.1641396, 1, 1, 1, 1, 1,
0.4812167, -1.751547, 3.683173, 1, 1, 1, 1, 1,
0.4880131, -1.060725, 1.954118, 1, 1, 1, 1, 1,
0.4909917, 1.081658, -0.3808295, 1, 1, 1, 1, 1,
0.4939537, -0.1024, 0.9056243, 1, 1, 1, 1, 1,
0.4965017, -0.3480411, 2.739741, 1, 1, 1, 1, 1,
0.4979227, 0.9381432, 0.3250819, 1, 1, 1, 1, 1,
0.5064829, -0.6215484, 3.008166, 1, 1, 1, 1, 1,
0.5073954, -0.4620624, 1.577497, 1, 1, 1, 1, 1,
0.5112433, 0.7951421, -1.264029, 1, 1, 1, 1, 1,
0.513926, -0.4122191, 2.626256, 1, 1, 1, 1, 1,
0.5156369, 1.076856, 0.1444336, 1, 1, 1, 1, 1,
0.5181885, -0.08428766, 0.9603325, 1, 1, 1, 1, 1,
0.5188355, 0.9145041, 0.2391661, 0, 0, 1, 1, 1,
0.5217701, 0.4953667, 0.4288914, 1, 0, 0, 1, 1,
0.5238466, -0.653271, 1.162202, 1, 0, 0, 1, 1,
0.5240736, 0.3471862, 0.5565506, 1, 0, 0, 1, 1,
0.5329773, 2.351731, 1.232268, 1, 0, 0, 1, 1,
0.5351934, -0.824195, 1.574621, 1, 0, 0, 1, 1,
0.5381754, -0.3642042, 0.8067423, 0, 0, 0, 1, 1,
0.5475973, -0.9124655, 1.991256, 0, 0, 0, 1, 1,
0.5486438, -1.469283, 4.50995, 0, 0, 0, 1, 1,
0.5492215, -0.5555486, 1.509346, 0, 0, 0, 1, 1,
0.5515701, -0.05548311, 3.345518, 0, 0, 0, 1, 1,
0.5545123, -0.2060217, 0.5198532, 0, 0, 0, 1, 1,
0.5610367, -0.7738294, 2.043729, 0, 0, 0, 1, 1,
0.5644801, 0.4913257, 0.3770856, 1, 1, 1, 1, 1,
0.5716148, 1.328348, -0.6788788, 1, 1, 1, 1, 1,
0.5735597, 2.305092, 0.1875729, 1, 1, 1, 1, 1,
0.5770442, -1.93869, 4.055488, 1, 1, 1, 1, 1,
0.5842854, 0.08964636, 1.34975, 1, 1, 1, 1, 1,
0.5867057, 0.1391164, 0.1239445, 1, 1, 1, 1, 1,
0.5916101, 0.7077504, 0.6094311, 1, 1, 1, 1, 1,
0.5931964, -1.256384, 3.443959, 1, 1, 1, 1, 1,
0.5983943, -1.007428, 2.950523, 1, 1, 1, 1, 1,
0.6012923, -0.8390672, 2.426462, 1, 1, 1, 1, 1,
0.6015524, -0.3651382, 3.566307, 1, 1, 1, 1, 1,
0.6025938, -0.1987229, 1.065533, 1, 1, 1, 1, 1,
0.6046922, -0.101124, 0.647419, 1, 1, 1, 1, 1,
0.6049151, 0.09151078, 3.453466, 1, 1, 1, 1, 1,
0.6049919, 0.6291112, 1.734551, 1, 1, 1, 1, 1,
0.6112249, -0.1372734, 0.9542578, 0, 0, 1, 1, 1,
0.6119764, -1.210974, 3.757351, 1, 0, 0, 1, 1,
0.6136841, -0.1068133, 1.461848, 1, 0, 0, 1, 1,
0.6156484, -2.561898, 2.862018, 1, 0, 0, 1, 1,
0.6212143, 0.5190117, 0.7614466, 1, 0, 0, 1, 1,
0.6245138, 0.1799626, 1.336904, 1, 0, 0, 1, 1,
0.6254938, 0.1849136, 1.501016, 0, 0, 0, 1, 1,
0.6256688, 2.725134, 0.4441423, 0, 0, 0, 1, 1,
0.6319748, 2.52982, 1.169301, 0, 0, 0, 1, 1,
0.63256, -0.3683481, 1.715311, 0, 0, 0, 1, 1,
0.6400715, -0.8276258, 1.048958, 0, 0, 0, 1, 1,
0.6416136, 1.096052, 0.6205155, 0, 0, 0, 1, 1,
0.6423879, -0.08021274, 1.394527, 0, 0, 0, 1, 1,
0.6430041, -0.3828092, 2.595515, 1, 1, 1, 1, 1,
0.6437172, 2.303395, -0.1240967, 1, 1, 1, 1, 1,
0.6451976, -1.56123, 1.234524, 1, 1, 1, 1, 1,
0.6459633, -1.194653, 2.514983, 1, 1, 1, 1, 1,
0.6507316, 1.603305, -0.2041095, 1, 1, 1, 1, 1,
0.6532093, 2.180459, 0.8787879, 1, 1, 1, 1, 1,
0.653472, -0.2371871, 1.812935, 1, 1, 1, 1, 1,
0.6537821, -0.6436681, 1.705043, 1, 1, 1, 1, 1,
0.6594229, -0.3897954, 1.912918, 1, 1, 1, 1, 1,
0.6608739, -1.736527, 2.869937, 1, 1, 1, 1, 1,
0.661005, -1.403977, 2.876308, 1, 1, 1, 1, 1,
0.6624228, 0.1132965, 1.513432, 1, 1, 1, 1, 1,
0.6717872, -0.2224428, 3.106155, 1, 1, 1, 1, 1,
0.6741111, -0.4991305, 1.77407, 1, 1, 1, 1, 1,
0.6756244, -1.160452, 1.597364, 1, 1, 1, 1, 1,
0.6777965, 1.057848, -0.5010007, 0, 0, 1, 1, 1,
0.6848037, -0.1190557, 1.946953, 1, 0, 0, 1, 1,
0.6848436, -1.519632, 2.924974, 1, 0, 0, 1, 1,
0.6867313, 1.080511, -0.04664657, 1, 0, 0, 1, 1,
0.688831, -0.1702667, 1.108197, 1, 0, 0, 1, 1,
0.6918592, 0.178881, 1.121214, 1, 0, 0, 1, 1,
0.6924912, 0.1613581, 1.996797, 0, 0, 0, 1, 1,
0.692701, -0.06843924, 3.075767, 0, 0, 0, 1, 1,
0.7011271, -0.1460719, 0.9561044, 0, 0, 0, 1, 1,
0.7072943, 0.6052022, 1.046692, 0, 0, 0, 1, 1,
0.7079315, -1.03625, 0.7515755, 0, 0, 0, 1, 1,
0.708103, -1.5531, 1.664386, 0, 0, 0, 1, 1,
0.7086228, -0.8387678, 1.146346, 0, 0, 0, 1, 1,
0.7087886, -0.4251465, 4.124149, 1, 1, 1, 1, 1,
0.7098994, 1.242175, -1.431353, 1, 1, 1, 1, 1,
0.7101154, 0.7019957, 0.6881768, 1, 1, 1, 1, 1,
0.7107679, 0.4551468, 0.9726526, 1, 1, 1, 1, 1,
0.7119693, 0.2015069, 2.186986, 1, 1, 1, 1, 1,
0.7149554, -0.03116753, 2.559167, 1, 1, 1, 1, 1,
0.7155656, 0.4880134, 0.5365619, 1, 1, 1, 1, 1,
0.7166165, 1.887371, -1.264549, 1, 1, 1, 1, 1,
0.7207943, 1.685092, 2.169128, 1, 1, 1, 1, 1,
0.7291489, -0.5444842, 2.66565, 1, 1, 1, 1, 1,
0.7351381, -1.828883, 3.839452, 1, 1, 1, 1, 1,
0.739723, 0.9582088, 0.9674152, 1, 1, 1, 1, 1,
0.742151, 0.6350273, 0.2434853, 1, 1, 1, 1, 1,
0.7431102, 0.001911315, 1.261059, 1, 1, 1, 1, 1,
0.7471975, -1.102167, 1.380023, 1, 1, 1, 1, 1,
0.7474869, -1.386652, 2.064164, 0, 0, 1, 1, 1,
0.747976, -0.1782804, 1.881467, 1, 0, 0, 1, 1,
0.750304, 0.2860723, 0.5987106, 1, 0, 0, 1, 1,
0.7531404, -0.3740361, 1.347752, 1, 0, 0, 1, 1,
0.7565416, -1.224267, 2.612842, 1, 0, 0, 1, 1,
0.7574971, -2.364044, 3.467728, 1, 0, 0, 1, 1,
0.7588927, 0.1879134, 2.65889, 0, 0, 0, 1, 1,
0.7594125, -1.322536, 3.269345, 0, 0, 0, 1, 1,
0.7597974, -0.08878372, 2.56977, 0, 0, 0, 1, 1,
0.7653334, 1.309296, 0.846565, 0, 0, 0, 1, 1,
0.7687149, -1.453284, 2.454184, 0, 0, 0, 1, 1,
0.7727051, 0.6622737, -0.1646147, 0, 0, 0, 1, 1,
0.7760315, -1.19304, 0.1763266, 0, 0, 0, 1, 1,
0.7787802, -0.3582489, 3.635952, 1, 1, 1, 1, 1,
0.7794135, -0.2488714, 2.062793, 1, 1, 1, 1, 1,
0.7795321, -0.1562313, 1.90746, 1, 1, 1, 1, 1,
0.7816216, 0.4180269, -0.2619488, 1, 1, 1, 1, 1,
0.7850195, -0.04414846, 0.8528446, 1, 1, 1, 1, 1,
0.7855173, 1.10838, -0.8715587, 1, 1, 1, 1, 1,
0.7878164, 0.3167307, -1.145238, 1, 1, 1, 1, 1,
0.7890879, -1.227484, 1.566747, 1, 1, 1, 1, 1,
0.7980168, 0.2745914, 1.472143, 1, 1, 1, 1, 1,
0.8122064, -1.646988, 2.589328, 1, 1, 1, 1, 1,
0.8146523, -1.771748, 1.787488, 1, 1, 1, 1, 1,
0.8147626, -0.09599695, 2.796714, 1, 1, 1, 1, 1,
0.8148, 0.7075869, 1.527249, 1, 1, 1, 1, 1,
0.8152605, -0.6441474, 3.156238, 1, 1, 1, 1, 1,
0.8256129, 1.445072, -0.1613148, 1, 1, 1, 1, 1,
0.8264429, 0.6069272, -0.1118681, 0, 0, 1, 1, 1,
0.8307413, -0.1816507, 1.509802, 1, 0, 0, 1, 1,
0.8343236, -0.09437072, 1.655836, 1, 0, 0, 1, 1,
0.8369039, -1.467053, 3.655716, 1, 0, 0, 1, 1,
0.83829, 0.9921169, 0.8445858, 1, 0, 0, 1, 1,
0.8402889, -0.8017478, 2.715389, 1, 0, 0, 1, 1,
0.8424545, 0.03059326, 1.783868, 0, 0, 0, 1, 1,
0.8454807, 0.9202618, 1.032959, 0, 0, 0, 1, 1,
0.8499558, 1.135279, 1.741106, 0, 0, 0, 1, 1,
0.8520901, -0.235763, 1.597611, 0, 0, 0, 1, 1,
0.8546429, -0.2545936, 3.512398, 0, 0, 0, 1, 1,
0.855152, 0.2958339, 0.7112963, 0, 0, 0, 1, 1,
0.8571144, -1.541887, 3.470604, 0, 0, 0, 1, 1,
0.8659947, -1.501212, 2.008197, 1, 1, 1, 1, 1,
0.8660331, 0.8128777, 1.656366, 1, 1, 1, 1, 1,
0.8796013, 0.3132851, 3.850112, 1, 1, 1, 1, 1,
0.8806903, -1.331447, 3.743331, 1, 1, 1, 1, 1,
0.8814681, -0.6795927, 0.6993355, 1, 1, 1, 1, 1,
0.8863897, 0.8720928, -2.188233, 1, 1, 1, 1, 1,
0.8866467, -1.041972, 0.3020194, 1, 1, 1, 1, 1,
0.891579, -0.05709681, 3.351646, 1, 1, 1, 1, 1,
0.8947042, -0.5504053, 2.718826, 1, 1, 1, 1, 1,
0.8963044, -1.662592, 3.643817, 1, 1, 1, 1, 1,
0.8977472, 1.907241, 1.24744, 1, 1, 1, 1, 1,
0.8980454, -0.4421895, 0.8642212, 1, 1, 1, 1, 1,
0.9001271, -1.071673, 1.816539, 1, 1, 1, 1, 1,
0.910786, 0.8237998, 0.3332697, 1, 1, 1, 1, 1,
0.9129949, 1.058061, 0.881353, 1, 1, 1, 1, 1,
0.9158026, -0.4049007, 4.009241, 0, 0, 1, 1, 1,
0.9187276, -1.445893, 2.889568, 1, 0, 0, 1, 1,
0.9197922, 0.1899718, 0.8007261, 1, 0, 0, 1, 1,
0.9238192, -0.7961671, 3.54429, 1, 0, 0, 1, 1,
0.9297216, 0.4819894, 0.263802, 1, 0, 0, 1, 1,
0.9363545, 0.1935977, 1.425612, 1, 0, 0, 1, 1,
0.9412915, 0.7769272, 0.008655225, 0, 0, 0, 1, 1,
0.9431741, 1.112587, -0.7981946, 0, 0, 0, 1, 1,
0.9448766, 0.1535642, 1.405305, 0, 0, 0, 1, 1,
0.9453601, -0.588109, 1.015362, 0, 0, 0, 1, 1,
0.9493421, 0.7919791, 1.485914, 0, 0, 0, 1, 1,
0.9636324, -0.7544453, 1.313041, 0, 0, 0, 1, 1,
0.9641055, 1.041119, 0.2031814, 0, 0, 0, 1, 1,
0.9645506, 0.4813563, 0.7355394, 1, 1, 1, 1, 1,
0.9667644, -0.8041278, 3.340996, 1, 1, 1, 1, 1,
0.9672821, -0.6785781, 0.6127734, 1, 1, 1, 1, 1,
0.9726969, -0.2592094, 1.341237, 1, 1, 1, 1, 1,
0.9743813, 0.4060645, 0.6091633, 1, 1, 1, 1, 1,
0.9775076, -1.418137, 3.477716, 1, 1, 1, 1, 1,
0.9781705, -0.4351658, 1.210863, 1, 1, 1, 1, 1,
0.9790823, -0.3073831, 2.764704, 1, 1, 1, 1, 1,
0.9796476, 0.8389159, 1.822235, 1, 1, 1, 1, 1,
0.9815428, 1.028336, 2.129627, 1, 1, 1, 1, 1,
0.9830819, -0.8688433, 1.758239, 1, 1, 1, 1, 1,
0.9889378, -2.410194, 3.663296, 1, 1, 1, 1, 1,
0.9901693, -0.6706148, 3.356739, 1, 1, 1, 1, 1,
0.9918331, 0.8129368, 1.807579, 1, 1, 1, 1, 1,
0.9994873, 0.8653054, 0.7949474, 1, 1, 1, 1, 1,
1.00126, -1.915246, 5.793404, 0, 0, 1, 1, 1,
1.008049, 0.4004983, 2.603798, 1, 0, 0, 1, 1,
1.00876, 0.9285812, 1.847625, 1, 0, 0, 1, 1,
1.012623, 0.8361311, 0.3422639, 1, 0, 0, 1, 1,
1.026025, 0.9832379, 1.787002, 1, 0, 0, 1, 1,
1.032539, 1.021123, 1.551329, 1, 0, 0, 1, 1,
1.035249, 0.4912831, 0.3724242, 0, 0, 0, 1, 1,
1.035718, 0.5254532, 1.359472, 0, 0, 0, 1, 1,
1.037998, -0.7908779, 1.906969, 0, 0, 0, 1, 1,
1.038315, 0.2539313, 0.9121839, 0, 0, 0, 1, 1,
1.048923, -0.4447185, 0.6904121, 0, 0, 0, 1, 1,
1.065942, 0.4201137, 1.84474, 0, 0, 0, 1, 1,
1.070096, 0.7218861, 0.9582145, 0, 0, 0, 1, 1,
1.071104, 1.516188, 2.526408, 1, 1, 1, 1, 1,
1.071525, 0.3851762, 2.174118, 1, 1, 1, 1, 1,
1.073817, -0.1964874, 1.988776, 1, 1, 1, 1, 1,
1.079175, -1.023776, 2.177957, 1, 1, 1, 1, 1,
1.080646, 0.6061025, -0.2184572, 1, 1, 1, 1, 1,
1.081421, 0.3669557, 2.813602, 1, 1, 1, 1, 1,
1.082088, -0.02018212, 2.321977, 1, 1, 1, 1, 1,
1.084455, 0.8960238, 0.6517599, 1, 1, 1, 1, 1,
1.085893, -1.035574, 1.816031, 1, 1, 1, 1, 1,
1.09549, -0.5233281, 1.529768, 1, 1, 1, 1, 1,
1.101183, 0.4809139, 0.4609845, 1, 1, 1, 1, 1,
1.104173, -0.1630858, 0.6010713, 1, 1, 1, 1, 1,
1.111783, -0.03668557, 0.8379842, 1, 1, 1, 1, 1,
1.119725, -0.7774537, 1.520194, 1, 1, 1, 1, 1,
1.119752, -0.5659668, 1.018965, 1, 1, 1, 1, 1,
1.125324, 2.52584, 0.8887213, 0, 0, 1, 1, 1,
1.128611, -2.410197, 2.340172, 1, 0, 0, 1, 1,
1.131953, 0.05648824, 1.210211, 1, 0, 0, 1, 1,
1.137206, 1.666689, 1.688907, 1, 0, 0, 1, 1,
1.144509, 0.6719722, 2.040854, 1, 0, 0, 1, 1,
1.145522, -1.337346, 3.68889, 1, 0, 0, 1, 1,
1.14696, 0.9236804, 0.6195453, 0, 0, 0, 1, 1,
1.151078, 0.7462037, 0.01144605, 0, 0, 0, 1, 1,
1.153326, -0.2124053, 2.236224, 0, 0, 0, 1, 1,
1.154033, -0.1991796, 2.802508, 0, 0, 0, 1, 1,
1.16434, -2.587323, 2.850116, 0, 0, 0, 1, 1,
1.183724, -0.116718, 2.863322, 0, 0, 0, 1, 1,
1.183897, 1.321231, 0.8826224, 0, 0, 0, 1, 1,
1.187062, 1.177809, 0.6366497, 1, 1, 1, 1, 1,
1.203276, 1.197007, 2.062362, 1, 1, 1, 1, 1,
1.209183, -0.5915121, 1.815877, 1, 1, 1, 1, 1,
1.213084, -1.233552, 1.363193, 1, 1, 1, 1, 1,
1.224037, -0.4335439, 2.187437, 1, 1, 1, 1, 1,
1.252441, -0.1785765, 3.933726, 1, 1, 1, 1, 1,
1.260707, 0.723271, 0.9434237, 1, 1, 1, 1, 1,
1.262645, 0.9559491, 0.521391, 1, 1, 1, 1, 1,
1.272981, 0.09344758, 1.541656, 1, 1, 1, 1, 1,
1.27318, 0.7972299, -0.1929162, 1, 1, 1, 1, 1,
1.280301, -1.060154, 2.584762, 1, 1, 1, 1, 1,
1.281333, 0.277034, 1.7189, 1, 1, 1, 1, 1,
1.283229, 2.850597, 0.1979626, 1, 1, 1, 1, 1,
1.285136, 0.7620007, 1.949139, 1, 1, 1, 1, 1,
1.295813, -0.01088495, 1.992445, 1, 1, 1, 1, 1,
1.306758, 0.7324721, 1.247684, 0, 0, 1, 1, 1,
1.315428, -0.5690749, 2.972651, 1, 0, 0, 1, 1,
1.325121, -1.902688, 5.065881, 1, 0, 0, 1, 1,
1.343589, -1.435816, 3.063344, 1, 0, 0, 1, 1,
1.348744, 0.2215375, 2.168456, 1, 0, 0, 1, 1,
1.359794, -0.1292786, 0.6502275, 1, 0, 0, 1, 1,
1.371296, 0.7859202, 2.971825, 0, 0, 0, 1, 1,
1.380334, 0.04025048, 1.637413, 0, 0, 0, 1, 1,
1.384272, 0.2476662, 0.2642037, 0, 0, 0, 1, 1,
1.38529, -0.6728883, 4.029162, 0, 0, 0, 1, 1,
1.387432, -1.087885, 1.862034, 0, 0, 0, 1, 1,
1.399169, 0.1697791, -0.1095257, 0, 0, 0, 1, 1,
1.400118, 2.580988, 1.556315, 0, 0, 0, 1, 1,
1.403671, -1.354443, 3.959007, 1, 1, 1, 1, 1,
1.404112, 0.5326326, 1.791153, 1, 1, 1, 1, 1,
1.404239, 0.07948809, 2.076946, 1, 1, 1, 1, 1,
1.405182, -0.285851, 0.7459593, 1, 1, 1, 1, 1,
1.408356, 0.2303445, 2.040352, 1, 1, 1, 1, 1,
1.40873, -0.1577827, 1.966764, 1, 1, 1, 1, 1,
1.40896, -0.1077765, 1.741886, 1, 1, 1, 1, 1,
1.436825, 0.0570759, -0.05228008, 1, 1, 1, 1, 1,
1.451972, 0.7178415, 0.4630775, 1, 1, 1, 1, 1,
1.468813, 0.5033469, 0.7231026, 1, 1, 1, 1, 1,
1.469187, 0.214551, 0.7359982, 1, 1, 1, 1, 1,
1.469527, 1.104919, 2.166106, 1, 1, 1, 1, 1,
1.469788, 1.766987, 0.6103169, 1, 1, 1, 1, 1,
1.472321, -1.460812, 2.003737, 1, 1, 1, 1, 1,
1.48514, -0.4755389, 1.427117, 1, 1, 1, 1, 1,
1.487076, 0.9199772, 1.765329, 0, 0, 1, 1, 1,
1.513955, 0.7209997, 0.9816319, 1, 0, 0, 1, 1,
1.517702, 0.5558513, -0.4947072, 1, 0, 0, 1, 1,
1.523547, -0.8176003, 1.685185, 1, 0, 0, 1, 1,
1.524022, -0.9330298, 4.115501, 1, 0, 0, 1, 1,
1.525254, -0.9666954, 0.9881923, 1, 0, 0, 1, 1,
1.527176, -0.6189305, 1.950125, 0, 0, 0, 1, 1,
1.545995, 0.6402314, 0.5804099, 0, 0, 0, 1, 1,
1.557636, 0.8209767, 1.234054, 0, 0, 0, 1, 1,
1.566201, 0.2039561, 3.001729, 0, 0, 0, 1, 1,
1.566236, 0.653132, 0.6363617, 0, 0, 0, 1, 1,
1.574509, 1.42471, 1.50638, 0, 0, 0, 1, 1,
1.577757, -1.016269, 1.103271, 0, 0, 0, 1, 1,
1.579677, -0.1170256, -0.1560032, 1, 1, 1, 1, 1,
1.587985, -0.9334462, 2.212447, 1, 1, 1, 1, 1,
1.593469, -0.5629686, 3.12588, 1, 1, 1, 1, 1,
1.600947, 0.2226575, 1.299455, 1, 1, 1, 1, 1,
1.610159, -0.6213938, 3.103844, 1, 1, 1, 1, 1,
1.618013, -0.680785, 0.6529279, 1, 1, 1, 1, 1,
1.622317, -0.2104558, 0.5756785, 1, 1, 1, 1, 1,
1.642955, -1.001733, 2.0849, 1, 1, 1, 1, 1,
1.660975, 0.9187593, -0.3806078, 1, 1, 1, 1, 1,
1.690068, 0.7123212, 1.646239, 1, 1, 1, 1, 1,
1.690929, 0.6149388, 1.348722, 1, 1, 1, 1, 1,
1.697561, -0.4014883, 2.261227, 1, 1, 1, 1, 1,
1.757653, -0.03377374, 2.478022, 1, 1, 1, 1, 1,
1.772139, -1.737013, 1.972219, 1, 1, 1, 1, 1,
1.777308, 0.237928, 2.72446, 1, 1, 1, 1, 1,
1.77973, -1.012475, 2.413098, 0, 0, 1, 1, 1,
1.784054, 1.45255, -0.001698702, 1, 0, 0, 1, 1,
1.813319, 0.8163888, 2.02938, 1, 0, 0, 1, 1,
1.821899, 0.182554, 2.380435, 1, 0, 0, 1, 1,
1.828093, -0.1681316, 2.22187, 1, 0, 0, 1, 1,
1.844553, -1.113072, 1.625989, 1, 0, 0, 1, 1,
1.849556, -0.840108, 3.175674, 0, 0, 0, 1, 1,
1.853006, -0.8967528, 3.439363, 0, 0, 0, 1, 1,
1.874491, 0.3071329, 2.4315, 0, 0, 0, 1, 1,
1.879987, 1.560185, 1.464609, 0, 0, 0, 1, 1,
1.898042, 0.1935196, 2.065603, 0, 0, 0, 1, 1,
1.904414, -0.7964142, 1.935946, 0, 0, 0, 1, 1,
1.90939, 0.5955363, 0.8649794, 0, 0, 0, 1, 1,
1.931469, 0.2149361, 1.73779, 1, 1, 1, 1, 1,
1.935012, 0.9723114, 0.171266, 1, 1, 1, 1, 1,
1.948022, 0.5000401, 1.485504, 1, 1, 1, 1, 1,
1.94878, 0.04809468, 2.080377, 1, 1, 1, 1, 1,
1.955635, 0.4579149, 2.549246, 1, 1, 1, 1, 1,
1.961653, -0.6799356, 1.860009, 1, 1, 1, 1, 1,
1.983289, -0.0870297, 2.396238, 1, 1, 1, 1, 1,
1.994838, 0.1002965, 1.933764, 1, 1, 1, 1, 1,
2.021221, -0.489617, 0.7354138, 1, 1, 1, 1, 1,
2.025166, 2.018613, 2.610019, 1, 1, 1, 1, 1,
2.028639, -0.1425588, 0.998842, 1, 1, 1, 1, 1,
2.047627, -0.4750102, 0.9337218, 1, 1, 1, 1, 1,
2.057369, 0.4171069, 2.174119, 1, 1, 1, 1, 1,
2.094679, -0.6146287, 3.264204, 1, 1, 1, 1, 1,
2.095438, -0.6039319, 2.631478, 1, 1, 1, 1, 1,
2.105774, -0.140408, 2.913245, 0, 0, 1, 1, 1,
2.12912, 0.2056836, 0.3879325, 1, 0, 0, 1, 1,
2.132643, -1.048342, 0.2414139, 1, 0, 0, 1, 1,
2.191324, 0.2823832, 1.528195, 1, 0, 0, 1, 1,
2.197293, 2.077679, 1.922676, 1, 0, 0, 1, 1,
2.219625, 0.2446118, 2.376327, 1, 0, 0, 1, 1,
2.262802, 0.7029413, 1.727362, 0, 0, 0, 1, 1,
2.38263, -1.456428, 2.25023, 0, 0, 0, 1, 1,
2.390813, 0.3549495, 3.018235, 0, 0, 0, 1, 1,
2.399318, 0.9206282, 0.2820533, 0, 0, 0, 1, 1,
2.459736, -1.169713, 2.20676, 0, 0, 0, 1, 1,
2.470289, -0.903684, 2.755074, 0, 0, 0, 1, 1,
2.542937, 1.568013, 1.46376, 0, 0, 0, 1, 1,
2.570082, 0.09784842, 0.4092448, 1, 1, 1, 1, 1,
2.571618, 1.013748, 1.538044, 1, 1, 1, 1, 1,
2.668745, -0.04011813, 1.104744, 1, 1, 1, 1, 1,
2.674319, 0.4314435, 1.030465, 1, 1, 1, 1, 1,
2.701657, -0.4425968, 3.185438, 1, 1, 1, 1, 1,
3.382701, 0.9340822, 1.692904, 1, 1, 1, 1, 1,
3.878993, 0.06776016, 2.367064, 1, 1, 1, 1, 1
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
var radius = 9.569533;
var distance = 33.61258;
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
mvMatrix.translate( -0.4373722, 0.1841341, -0.4945502 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.61258);
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
