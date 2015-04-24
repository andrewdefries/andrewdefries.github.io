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
-3.139238, -0.739258, -0.7449229, 1, 0, 0, 1,
-3.120414, 1.365853, -1.529987, 1, 0.007843138, 0, 1,
-2.990704, -1.451143, -2.390361, 1, 0.01176471, 0, 1,
-2.98748, -0.291857, -1.891732, 1, 0.01960784, 0, 1,
-2.958991, 1.790931, -2.704888, 1, 0.02352941, 0, 1,
-2.729545, -1.168191, -3.955173, 1, 0.03137255, 0, 1,
-2.638586, 0.7699637, -1.213525, 1, 0.03529412, 0, 1,
-2.546943, 0.9162046, -2.293032, 1, 0.04313726, 0, 1,
-2.516561, 1.038704, -2.118274, 1, 0.04705882, 0, 1,
-2.454382, -0.2779378, -1.544646, 1, 0.05490196, 0, 1,
-2.409467, 0.6322368, -2.422038, 1, 0.05882353, 0, 1,
-2.355125, 0.4478437, -0.7120132, 1, 0.06666667, 0, 1,
-2.298023, -0.5941731, -1.128322, 1, 0.07058824, 0, 1,
-2.253607, -0.1143136, -1.682833, 1, 0.07843138, 0, 1,
-2.209268, -0.3808487, -1.671497, 1, 0.08235294, 0, 1,
-2.180597, -0.04290648, -0.6616614, 1, 0.09019608, 0, 1,
-2.16123, -0.4902801, -1.286682, 1, 0.09411765, 0, 1,
-2.137768, 0.7703988, -1.730226, 1, 0.1019608, 0, 1,
-2.136523, 0.9898171, -3.223986, 1, 0.1098039, 0, 1,
-2.112216, 0.2856394, -2.573145, 1, 0.1137255, 0, 1,
-2.096372, -1.164265, -3.692969, 1, 0.1215686, 0, 1,
-2.071332, 0.02864608, -3.722932, 1, 0.1254902, 0, 1,
-2.032195, 0.9445187, -1.789649, 1, 0.1333333, 0, 1,
-2.018998, 0.5312172, -0.2924409, 1, 0.1372549, 0, 1,
-2.014334, -0.9839213, -2.661499, 1, 0.145098, 0, 1,
-2.01284, 1.866216, -1.019469, 1, 0.1490196, 0, 1,
-1.980805, -0.1459884, -1.208447, 1, 0.1568628, 0, 1,
-1.977202, -0.02605707, -1.291295, 1, 0.1607843, 0, 1,
-1.969023, -0.2211981, -1.986535, 1, 0.1686275, 0, 1,
-1.935579, 0.3950441, 0.4485996, 1, 0.172549, 0, 1,
-1.929996, -0.6619993, -0.7834024, 1, 0.1803922, 0, 1,
-1.926936, 0.01324317, -0.8747576, 1, 0.1843137, 0, 1,
-1.909072, 1.09445, -2.313151, 1, 0.1921569, 0, 1,
-1.896839, 0.6076795, -1.713931, 1, 0.1960784, 0, 1,
-1.865043, -1.302958, -2.209297, 1, 0.2039216, 0, 1,
-1.862475, 1.275959, -1.382508, 1, 0.2117647, 0, 1,
-1.856513, 0.6531022, -0.4248028, 1, 0.2156863, 0, 1,
-1.844143, -0.5372562, -0.9271401, 1, 0.2235294, 0, 1,
-1.841235, -0.09963815, -0.5983422, 1, 0.227451, 0, 1,
-1.840319, -1.069543, -1.892421, 1, 0.2352941, 0, 1,
-1.801829, -0.02873415, -1.087302, 1, 0.2392157, 0, 1,
-1.797719, 0.4164225, -0.6406866, 1, 0.2470588, 0, 1,
-1.791398, 0.3696843, -2.423136, 1, 0.2509804, 0, 1,
-1.78306, 0.6159878, -2.736167, 1, 0.2588235, 0, 1,
-1.773353, -0.1023494, -2.446562, 1, 0.2627451, 0, 1,
-1.728224, -0.6457999, -0.9280398, 1, 0.2705882, 0, 1,
-1.718852, 1.047193, -0.2382307, 1, 0.2745098, 0, 1,
-1.718061, -1.587737, -1.564486, 1, 0.282353, 0, 1,
-1.710137, -1.23076, -1.692269, 1, 0.2862745, 0, 1,
-1.707907, 0.6231095, -1.66618, 1, 0.2941177, 0, 1,
-1.687232, -0.688772, -1.525304, 1, 0.3019608, 0, 1,
-1.649105, 0.3758129, -1.184259, 1, 0.3058824, 0, 1,
-1.617426, -0.8085407, -2.195961, 1, 0.3137255, 0, 1,
-1.61175, 0.5182038, -1.620464, 1, 0.3176471, 0, 1,
-1.599626, -0.8766689, -1.686923, 1, 0.3254902, 0, 1,
-1.599542, 0.2308322, -0.2285777, 1, 0.3294118, 0, 1,
-1.580848, 0.6512584, -1.1667, 1, 0.3372549, 0, 1,
-1.580021, 0.8843967, -0.7563693, 1, 0.3411765, 0, 1,
-1.561828, -1.23934, -2.664781, 1, 0.3490196, 0, 1,
-1.56171, 0.6546947, -0.3171908, 1, 0.3529412, 0, 1,
-1.559836, 1.152896, -2.430519, 1, 0.3607843, 0, 1,
-1.5125, 0.5262367, 1.441702, 1, 0.3647059, 0, 1,
-1.511757, 1.583433, -3.338672, 1, 0.372549, 0, 1,
-1.501914, 1.045445, -1.11555, 1, 0.3764706, 0, 1,
-1.495973, 0.05164712, -1.53697, 1, 0.3843137, 0, 1,
-1.48711, 0.6397032, -1.188574, 1, 0.3882353, 0, 1,
-1.48408, -0.3340189, -3.392784, 1, 0.3960784, 0, 1,
-1.477197, 0.726526, 0.3472776, 1, 0.4039216, 0, 1,
-1.473447, -1.425944, -0.4563656, 1, 0.4078431, 0, 1,
-1.459516, 0.08605139, -1.469698, 1, 0.4156863, 0, 1,
-1.459394, 1.810725, 0.05881114, 1, 0.4196078, 0, 1,
-1.45769, -0.2285752, -1.241114, 1, 0.427451, 0, 1,
-1.452555, 0.119922, -2.403613, 1, 0.4313726, 0, 1,
-1.444007, -0.4208012, -2.431273, 1, 0.4392157, 0, 1,
-1.443995, -0.4990959, -2.854138, 1, 0.4431373, 0, 1,
-1.429317, -2.339625, -3.130478, 1, 0.4509804, 0, 1,
-1.415138, 1.028074, -1.829312, 1, 0.454902, 0, 1,
-1.410629, -1.224711, -2.369846, 1, 0.4627451, 0, 1,
-1.407928, -0.8739038, -1.392116, 1, 0.4666667, 0, 1,
-1.395451, 1.093529, -0.9040276, 1, 0.4745098, 0, 1,
-1.394653, -0.2024972, -1.153508, 1, 0.4784314, 0, 1,
-1.386352, -0.1730446, -0.7700754, 1, 0.4862745, 0, 1,
-1.365378, -1.166464, -1.368995, 1, 0.4901961, 0, 1,
-1.363008, 0.1336055, -1.878988, 1, 0.4980392, 0, 1,
-1.362199, -1.54896, -2.634878, 1, 0.5058824, 0, 1,
-1.351779, -0.2749359, -1.362007, 1, 0.509804, 0, 1,
-1.346805, 0.6629295, -0.6781369, 1, 0.5176471, 0, 1,
-1.345039, -0.01342082, -0.161833, 1, 0.5215687, 0, 1,
-1.339122, 0.04303576, -1.414673, 1, 0.5294118, 0, 1,
-1.337873, 0.8991243, -2.280777, 1, 0.5333334, 0, 1,
-1.320634, -0.3124773, -1.396446, 1, 0.5411765, 0, 1,
-1.307724, -0.3180358, -2.484348, 1, 0.5450981, 0, 1,
-1.301444, -0.1243294, -1.785084, 1, 0.5529412, 0, 1,
-1.299476, -0.4244723, -3.265975, 1, 0.5568628, 0, 1,
-1.296053, 0.3997637, -2.898767, 1, 0.5647059, 0, 1,
-1.285611, -1.326115, -3.552556, 1, 0.5686275, 0, 1,
-1.285315, -0.3631784, -3.514857, 1, 0.5764706, 0, 1,
-1.284602, 0.772741, -1.763775, 1, 0.5803922, 0, 1,
-1.283054, -1.342087, -2.173209, 1, 0.5882353, 0, 1,
-1.271574, 0.2646767, -3.513649, 1, 0.5921569, 0, 1,
-1.266644, -0.08281346, -2.320513, 1, 0.6, 0, 1,
-1.262364, 0.3403115, -0.9620668, 1, 0.6078432, 0, 1,
-1.257863, -0.774134, -4.392509, 1, 0.6117647, 0, 1,
-1.249473, 0.872323, -0.8309997, 1, 0.6196079, 0, 1,
-1.243042, 0.6484379, -1.104566, 1, 0.6235294, 0, 1,
-1.228736, -0.7153333, -2.951492, 1, 0.6313726, 0, 1,
-1.224831, 2.04595, -1.431181, 1, 0.6352941, 0, 1,
-1.224781, 0.6701496, -1.818797, 1, 0.6431373, 0, 1,
-1.220941, 0.08460771, -1.659987, 1, 0.6470588, 0, 1,
-1.217422, -0.6399193, -1.446862, 1, 0.654902, 0, 1,
-1.214863, 0.8343833, -0.3483561, 1, 0.6588235, 0, 1,
-1.204094, 1.507182, -0.1157725, 1, 0.6666667, 0, 1,
-1.201458, 2.316635, -3.191817, 1, 0.6705883, 0, 1,
-1.196655, -0.2351134, -2.245973, 1, 0.6784314, 0, 1,
-1.188719, -0.3040222, -4.33997, 1, 0.682353, 0, 1,
-1.176973, 0.0173284, -1.226762, 1, 0.6901961, 0, 1,
-1.172971, -0.3263128, -2.624838, 1, 0.6941177, 0, 1,
-1.167008, 0.3665897, -2.440742, 1, 0.7019608, 0, 1,
-1.153865, -0.7272425, -3.784298, 1, 0.7098039, 0, 1,
-1.152435, 0.9380376, -0.06001201, 1, 0.7137255, 0, 1,
-1.148886, 1.040839, -0.186719, 1, 0.7215686, 0, 1,
-1.143395, -0.08517466, 0.3870296, 1, 0.7254902, 0, 1,
-1.136011, 1.066287, 0.09923994, 1, 0.7333333, 0, 1,
-1.13227, -0.8566719, -2.413191, 1, 0.7372549, 0, 1,
-1.131952, -0.8288279, -2.262468, 1, 0.7450981, 0, 1,
-1.131436, -0.2752004, -2.429862, 1, 0.7490196, 0, 1,
-1.128377, 1.013754, 0.1011055, 1, 0.7568628, 0, 1,
-1.123099, 2.459624, -0.4792371, 1, 0.7607843, 0, 1,
-1.121623, -1.733078, -2.139226, 1, 0.7686275, 0, 1,
-1.115646, -1.055437, -2.271241, 1, 0.772549, 0, 1,
-1.104201, -1.130363, -2.385744, 1, 0.7803922, 0, 1,
-1.102912, 0.9999263, -1.63848, 1, 0.7843137, 0, 1,
-1.078455, 1.944462, -0.4222399, 1, 0.7921569, 0, 1,
-1.074252, -0.391111, -0.318117, 1, 0.7960784, 0, 1,
-1.07391, -1.091442, -1.821408, 1, 0.8039216, 0, 1,
-1.071102, 0.8178589, -0.4148954, 1, 0.8117647, 0, 1,
-1.068112, -0.8781742, -2.055003, 1, 0.8156863, 0, 1,
-1.063455, 0.9839443, -2.377943, 1, 0.8235294, 0, 1,
-1.062419, 0.1202081, -3.228044, 1, 0.827451, 0, 1,
-1.056958, 1.135505, -1.369799, 1, 0.8352941, 0, 1,
-1.053308, 0.1723799, 0.07360015, 1, 0.8392157, 0, 1,
-1.05271, 0.1607566, -2.421409, 1, 0.8470588, 0, 1,
-1.038071, 0.3108349, -1.00674, 1, 0.8509804, 0, 1,
-1.037567, 0.5960329, 0.2329623, 1, 0.8588235, 0, 1,
-1.034271, -1.498026, -2.675279, 1, 0.8627451, 0, 1,
-1.029044, -1.964509, -3.44816, 1, 0.8705882, 0, 1,
-1.02282, 1.411237, -0.1536463, 1, 0.8745098, 0, 1,
-1.01729, -0.1102447, -3.172026, 1, 0.8823529, 0, 1,
-1.013292, -1.382721, -1.634048, 1, 0.8862745, 0, 1,
-1.006982, 0.8891001, 1.156119, 1, 0.8941177, 0, 1,
-0.9995822, 0.08371179, -1.167821, 1, 0.8980392, 0, 1,
-0.9886272, 0.9125398, -0.9613594, 1, 0.9058824, 0, 1,
-0.9867566, 0.8354974, 0.006743191, 1, 0.9137255, 0, 1,
-0.9825388, -0.1970748, -2.263657, 1, 0.9176471, 0, 1,
-0.9822471, 0.9468345, -1.180802, 1, 0.9254902, 0, 1,
-0.9778005, 0.6864403, 0.9340334, 1, 0.9294118, 0, 1,
-0.9777036, -1.202313, -2.591018, 1, 0.9372549, 0, 1,
-0.9744169, -0.9588479, -3.699889, 1, 0.9411765, 0, 1,
-0.9694149, -0.06999907, -0.06173564, 1, 0.9490196, 0, 1,
-0.9611686, 0.6388067, -1.393662, 1, 0.9529412, 0, 1,
-0.9607489, 0.5393151, -1.605535, 1, 0.9607843, 0, 1,
-0.9606834, 0.6847842, 0.1268357, 1, 0.9647059, 0, 1,
-0.9535473, 1.712079, 1.443596, 1, 0.972549, 0, 1,
-0.9528657, 1.39718, -2.113357, 1, 0.9764706, 0, 1,
-0.952665, 0.2063552, 0.2119638, 1, 0.9843137, 0, 1,
-0.9512106, 1.293944, -1.275838, 1, 0.9882353, 0, 1,
-0.9457942, 0.4291767, 0.6112957, 1, 0.9960784, 0, 1,
-0.9411138, -0.4157339, -3.009382, 0.9960784, 1, 0, 1,
-0.9396043, 0.6497758, -2.067739, 0.9921569, 1, 0, 1,
-0.9359174, 0.08478755, 0.1161406, 0.9843137, 1, 0, 1,
-0.9353131, 0.4765489, -0.4665171, 0.9803922, 1, 0, 1,
-0.9328617, -0.07879802, -2.081417, 0.972549, 1, 0, 1,
-0.9307777, 1.201702, 0.1136448, 0.9686275, 1, 0, 1,
-0.929472, 1.151924, -1.015872, 0.9607843, 1, 0, 1,
-0.9254375, -0.06232703, -1.918331, 0.9568627, 1, 0, 1,
-0.9168876, -1.21855, -2.019635, 0.9490196, 1, 0, 1,
-0.9150665, 0.01400418, -1.550916, 0.945098, 1, 0, 1,
-0.9150196, -1.009492, -1.403648, 0.9372549, 1, 0, 1,
-0.9140121, 0.2633607, -1.239061, 0.9333333, 1, 0, 1,
-0.9137759, 1.417718, -0.476556, 0.9254902, 1, 0, 1,
-0.9127522, 0.1247248, -1.475833, 0.9215686, 1, 0, 1,
-0.9123275, -0.9437213, -3.314624, 0.9137255, 1, 0, 1,
-0.9058287, 0.2665304, -2.344333, 0.9098039, 1, 0, 1,
-0.903545, 0.8152145, -0.6869925, 0.9019608, 1, 0, 1,
-0.9007462, 0.5012197, -0.4608363, 0.8941177, 1, 0, 1,
-0.9004877, 0.7448499, -0.1469977, 0.8901961, 1, 0, 1,
-0.8951191, -0.5975726, -2.739303, 0.8823529, 1, 0, 1,
-0.8933557, 0.1573778, -0.3919327, 0.8784314, 1, 0, 1,
-0.8862185, -0.6129898, -2.008909, 0.8705882, 1, 0, 1,
-0.8843019, 1.027296, -1.564378, 0.8666667, 1, 0, 1,
-0.8835321, 0.3655896, -2.061666, 0.8588235, 1, 0, 1,
-0.8813946, 0.4389157, -1.112973, 0.854902, 1, 0, 1,
-0.8786146, -1.615535, -2.682871, 0.8470588, 1, 0, 1,
-0.8781675, 1.556911, 0.7754647, 0.8431373, 1, 0, 1,
-0.8766711, -0.9551179, -3.099369, 0.8352941, 1, 0, 1,
-0.875825, 2.380062, -1.877673, 0.8313726, 1, 0, 1,
-0.8753127, -0.1170024, -0.7302618, 0.8235294, 1, 0, 1,
-0.8745381, -1.418316, -3.239215, 0.8196079, 1, 0, 1,
-0.8730224, 1.297388, -0.1672048, 0.8117647, 1, 0, 1,
-0.8721396, 0.1693053, -0.717819, 0.8078431, 1, 0, 1,
-0.865244, 0.2414131, -2.708103, 0.8, 1, 0, 1,
-0.8632106, 0.7998244, -0.4030949, 0.7921569, 1, 0, 1,
-0.8611889, 0.6867601, -0.3220393, 0.7882353, 1, 0, 1,
-0.860381, -0.6213235, -1.284278, 0.7803922, 1, 0, 1,
-0.859055, -0.1364698, -2.428509, 0.7764706, 1, 0, 1,
-0.8588979, 1.627864, -1.485437, 0.7686275, 1, 0, 1,
-0.8576106, 1.109938, -1.044948, 0.7647059, 1, 0, 1,
-0.8467045, 0.3233824, -1.709567, 0.7568628, 1, 0, 1,
-0.8430623, 0.5948895, -1.285478, 0.7529412, 1, 0, 1,
-0.8415002, 0.2313436, 1.389942, 0.7450981, 1, 0, 1,
-0.8333765, 2.10464, -0.3501078, 0.7411765, 1, 0, 1,
-0.8313763, 0.6098081, -2.348665, 0.7333333, 1, 0, 1,
-0.8254002, -0.3930062, -1.901445, 0.7294118, 1, 0, 1,
-0.8247165, 1.053053, -2.102371, 0.7215686, 1, 0, 1,
-0.8242096, -0.6275922, -2.539848, 0.7176471, 1, 0, 1,
-0.7986727, -0.7241685, -1.118748, 0.7098039, 1, 0, 1,
-0.7921442, -0.01266675, -1.309097, 0.7058824, 1, 0, 1,
-0.7844857, 0.4950033, -2.517524, 0.6980392, 1, 0, 1,
-0.7840552, -0.8623716, -2.652034, 0.6901961, 1, 0, 1,
-0.783244, -0.7803103, -2.033731, 0.6862745, 1, 0, 1,
-0.7760621, 0.06282362, -1.68553, 0.6784314, 1, 0, 1,
-0.7757415, 0.7509238, -2.028662, 0.6745098, 1, 0, 1,
-0.7737309, -0.7925741, -2.211631, 0.6666667, 1, 0, 1,
-0.7726902, 0.3637337, 0.5270858, 0.6627451, 1, 0, 1,
-0.7680984, -0.5266901, -2.801774, 0.654902, 1, 0, 1,
-0.7674081, -1.762833, -2.423733, 0.6509804, 1, 0, 1,
-0.765195, 2.245414, -2.435022, 0.6431373, 1, 0, 1,
-0.7638164, -0.8250706, -3.726135, 0.6392157, 1, 0, 1,
-0.7616999, 1.010762, 0.8267732, 0.6313726, 1, 0, 1,
-0.7613652, 0.8383145, 2.509513, 0.627451, 1, 0, 1,
-0.7602694, 1.601103, -0.1951006, 0.6196079, 1, 0, 1,
-0.7592046, -0.1314247, -2.428346, 0.6156863, 1, 0, 1,
-0.7555309, -2.466776, -3.519072, 0.6078432, 1, 0, 1,
-0.7521563, -2.267862, -2.44703, 0.6039216, 1, 0, 1,
-0.7507903, 0.113597, -1.160492, 0.5960785, 1, 0, 1,
-0.747911, 1.249815, 0.1581451, 0.5882353, 1, 0, 1,
-0.7461966, -1.381651, -2.255704, 0.5843138, 1, 0, 1,
-0.7386845, -0.3559899, -2.596851, 0.5764706, 1, 0, 1,
-0.7364367, 1.396778, -1.056763, 0.572549, 1, 0, 1,
-0.7345075, -0.2294644, -1.249495, 0.5647059, 1, 0, 1,
-0.7337118, -0.0205937, -0.8722374, 0.5607843, 1, 0, 1,
-0.7317568, -0.3298692, -4.287694, 0.5529412, 1, 0, 1,
-0.7204822, -2.114166, -3.207705, 0.5490196, 1, 0, 1,
-0.7193009, -0.1404294, -0.3469786, 0.5411765, 1, 0, 1,
-0.7161415, -1.127575, -3.743422, 0.5372549, 1, 0, 1,
-0.7138175, -0.6541093, -2.27035, 0.5294118, 1, 0, 1,
-0.7135876, 1.043633, -1.959713, 0.5254902, 1, 0, 1,
-0.7120327, 0.05594128, -4.200602, 0.5176471, 1, 0, 1,
-0.7065375, -0.8950666, -2.470253, 0.5137255, 1, 0, 1,
-0.7020442, -1.640005, -2.580939, 0.5058824, 1, 0, 1,
-0.700582, 1.887236, -1.044249, 0.5019608, 1, 0, 1,
-0.6889735, -0.8143798, -1.518951, 0.4941176, 1, 0, 1,
-0.6887071, -0.6363091, -3.986032, 0.4862745, 1, 0, 1,
-0.6860179, 0.4100829, -0.8387058, 0.4823529, 1, 0, 1,
-0.6781613, -0.2013056, -1.309806, 0.4745098, 1, 0, 1,
-0.663299, -0.04114041, -3.082916, 0.4705882, 1, 0, 1,
-0.6618364, -0.7478992, -1.0466, 0.4627451, 1, 0, 1,
-0.660029, -1.340155, -2.413392, 0.4588235, 1, 0, 1,
-0.6597868, -0.7055586, -1.406485, 0.4509804, 1, 0, 1,
-0.6574252, 0.7984053, 1.162414, 0.4470588, 1, 0, 1,
-0.6427496, -0.472531, -1.845318, 0.4392157, 1, 0, 1,
-0.6369333, -0.7313064, -2.492228, 0.4352941, 1, 0, 1,
-0.6358528, -0.007257209, -1.58721, 0.427451, 1, 0, 1,
-0.6329699, 0.2990208, -1.404283, 0.4235294, 1, 0, 1,
-0.6326483, 0.8313782, 0.4838992, 0.4156863, 1, 0, 1,
-0.6313025, -1.34344, -1.625048, 0.4117647, 1, 0, 1,
-0.6284412, 0.9689959, 0.2122845, 0.4039216, 1, 0, 1,
-0.6272906, 1.857909, -0.566479, 0.3960784, 1, 0, 1,
-0.6270097, 1.172481, 0.2858017, 0.3921569, 1, 0, 1,
-0.6254101, 0.07492689, -0.3183491, 0.3843137, 1, 0, 1,
-0.6213424, -0.3795814, -2.023306, 0.3803922, 1, 0, 1,
-0.6203197, 0.02666561, -1.669542, 0.372549, 1, 0, 1,
-0.6184797, 2.648391, 0.5075979, 0.3686275, 1, 0, 1,
-0.6146512, -0.02483657, -2.947931, 0.3607843, 1, 0, 1,
-0.613517, 0.4871477, 0.03071528, 0.3568628, 1, 0, 1,
-0.6114255, 0.01649585, -3.096686, 0.3490196, 1, 0, 1,
-0.6107447, 1.134765, -0.2045497, 0.345098, 1, 0, 1,
-0.6100186, -1.562452, -4.304413, 0.3372549, 1, 0, 1,
-0.6099038, 1.500038, 0.1681642, 0.3333333, 1, 0, 1,
-0.5958435, 0.4877197, -0.8340389, 0.3254902, 1, 0, 1,
-0.5825174, 0.2113678, -0.2846158, 0.3215686, 1, 0, 1,
-0.5818079, -1.007522, -3.468459, 0.3137255, 1, 0, 1,
-0.5802996, -0.5003077, -1.249547, 0.3098039, 1, 0, 1,
-0.579317, 0.9261225, -1.432268, 0.3019608, 1, 0, 1,
-0.5791156, 1.398416, 0.6484691, 0.2941177, 1, 0, 1,
-0.578598, -0.755211, -1.85078, 0.2901961, 1, 0, 1,
-0.574872, 0.08127011, -0.03760628, 0.282353, 1, 0, 1,
-0.5746467, -0.751312, -3.401795, 0.2784314, 1, 0, 1,
-0.568546, -0.2376913, -1.856927, 0.2705882, 1, 0, 1,
-0.5680072, 1.205374, -0.7146773, 0.2666667, 1, 0, 1,
-0.5664091, -1.574493, -2.845895, 0.2588235, 1, 0, 1,
-0.5644499, 1.908727, -0.07653193, 0.254902, 1, 0, 1,
-0.5592543, -0.3871321, -2.535199, 0.2470588, 1, 0, 1,
-0.5545723, 0.5491875, -1.568597, 0.2431373, 1, 0, 1,
-0.542933, 0.03810733, -1.420213, 0.2352941, 1, 0, 1,
-0.5384132, -0.7630845, -1.333568, 0.2313726, 1, 0, 1,
-0.5375501, -2.946696, -4.684798, 0.2235294, 1, 0, 1,
-0.5339507, -0.7714181, -2.86395, 0.2196078, 1, 0, 1,
-0.5267056, 0.5291104, -2.498646, 0.2117647, 1, 0, 1,
-0.5215786, -0.9337717, -2.9983, 0.2078431, 1, 0, 1,
-0.5213266, -0.8501974, -3.524417, 0.2, 1, 0, 1,
-0.5145204, -0.2791187, -3.135084, 0.1921569, 1, 0, 1,
-0.5143906, -0.6078138, -1.886053, 0.1882353, 1, 0, 1,
-0.514219, -0.3929866, -3.130036, 0.1803922, 1, 0, 1,
-0.4948188, 0.9420974, -1.90482, 0.1764706, 1, 0, 1,
-0.4946203, -1.541045, -2.712767, 0.1686275, 1, 0, 1,
-0.4907075, 0.9956191, -2.295558, 0.1647059, 1, 0, 1,
-0.4891516, 0.8661823, -2.626868, 0.1568628, 1, 0, 1,
-0.4848933, -0.1923059, -0.3407547, 0.1529412, 1, 0, 1,
-0.4740031, -0.5588289, -3.242314, 0.145098, 1, 0, 1,
-0.4657755, 0.3774308, -0.692737, 0.1411765, 1, 0, 1,
-0.4611717, -0.175097, -1.703007, 0.1333333, 1, 0, 1,
-0.4591025, 0.308774, 0.3697304, 0.1294118, 1, 0, 1,
-0.4583702, -2.994131, -2.860236, 0.1215686, 1, 0, 1,
-0.4558039, -0.3873976, -1.025791, 0.1176471, 1, 0, 1,
-0.4459412, 1.001468, -0.2037078, 0.1098039, 1, 0, 1,
-0.4350239, -0.488167, -2.730044, 0.1058824, 1, 0, 1,
-0.4278391, -0.08185858, -3.313136, 0.09803922, 1, 0, 1,
-0.4275667, 2.679031, -0.1134325, 0.09019608, 1, 0, 1,
-0.426623, -0.4896433, -1.713755, 0.08627451, 1, 0, 1,
-0.4218051, 0.9366566, 0.6846454, 0.07843138, 1, 0, 1,
-0.4016168, -1.213454, -3.958776, 0.07450981, 1, 0, 1,
-0.3993313, -0.4149658, -2.922293, 0.06666667, 1, 0, 1,
-0.3987608, -0.8649656, -0.9825473, 0.0627451, 1, 0, 1,
-0.3940527, -0.1823122, -2.282568, 0.05490196, 1, 0, 1,
-0.3931298, 1.131257, 1.271826, 0.05098039, 1, 0, 1,
-0.390255, -1.87461, -4.073991, 0.04313726, 1, 0, 1,
-0.3852546, -0.7434608, -3.19821, 0.03921569, 1, 0, 1,
-0.3844845, -1.478403, -3.194752, 0.03137255, 1, 0, 1,
-0.3819962, 0.007285499, -2.223843, 0.02745098, 1, 0, 1,
-0.3790363, -0.6664881, -3.425732, 0.01960784, 1, 0, 1,
-0.3758693, -0.226658, -1.859244, 0.01568628, 1, 0, 1,
-0.3753732, -0.8816783, -1.120042, 0.007843138, 1, 0, 1,
-0.3582143, 0.4959395, -0.8117254, 0.003921569, 1, 0, 1,
-0.3571409, 0.6597143, 0.9304206, 0, 1, 0.003921569, 1,
-0.3566, 0.9317909, -1.653776, 0, 1, 0.01176471, 1,
-0.3515929, -0.6484662, -1.798201, 0, 1, 0.01568628, 1,
-0.3479734, 0.4095941, -1.550905, 0, 1, 0.02352941, 1,
-0.3372986, -0.530934, -1.485359, 0, 1, 0.02745098, 1,
-0.326324, -2.798913, -3.694602, 0, 1, 0.03529412, 1,
-0.3177783, 0.769413, 0.3918552, 0, 1, 0.03921569, 1,
-0.3167676, -0.2023652, -3.096742, 0, 1, 0.04705882, 1,
-0.3118233, -0.4480289, -2.297493, 0, 1, 0.05098039, 1,
-0.3094522, 0.6442198, -0.7976907, 0, 1, 0.05882353, 1,
-0.2998472, -0.8963575, -2.261619, 0, 1, 0.0627451, 1,
-0.2966021, 0.752576, -0.965182, 0, 1, 0.07058824, 1,
-0.2847515, -0.4129136, -3.665137, 0, 1, 0.07450981, 1,
-0.2783194, -0.8592389, -1.272316, 0, 1, 0.08235294, 1,
-0.2775474, 0.7189377, 0.8906608, 0, 1, 0.08627451, 1,
-0.2756055, 1.285738, -0.1131073, 0, 1, 0.09411765, 1,
-0.2715645, -0.676814, -1.348803, 0, 1, 0.1019608, 1,
-0.2708805, -0.6656303, -5.617059, 0, 1, 0.1058824, 1,
-0.2643347, -1.64713, -2.367418, 0, 1, 0.1137255, 1,
-0.2626693, -0.273447, -1.688634, 0, 1, 0.1176471, 1,
-0.2577773, 0.6920236, 1.234825, 0, 1, 0.1254902, 1,
-0.2574098, 0.03223386, -2.832227, 0, 1, 0.1294118, 1,
-0.2564576, -0.3786167, -2.560462, 0, 1, 0.1372549, 1,
-0.2552596, 0.7252403, -0.7824595, 0, 1, 0.1411765, 1,
-0.2535603, -0.6078444, -3.309176, 0, 1, 0.1490196, 1,
-0.2522052, 0.06545048, -1.015166, 0, 1, 0.1529412, 1,
-0.250328, -1.159969, -2.793723, 0, 1, 0.1607843, 1,
-0.2497551, -0.1225702, -2.065207, 0, 1, 0.1647059, 1,
-0.2448307, 1.522663, -0.9893345, 0, 1, 0.172549, 1,
-0.2427453, -0.2696307, -3.773599, 0, 1, 0.1764706, 1,
-0.2423532, 0.08463559, -3.488219, 0, 1, 0.1843137, 1,
-0.2365467, 1.017723, 0.03101156, 0, 1, 0.1882353, 1,
-0.2354833, 1.635576, -1.143834, 0, 1, 0.1960784, 1,
-0.2335313, 0.1819165, -0.1952046, 0, 1, 0.2039216, 1,
-0.2322764, 0.0746235, 0.3895751, 0, 1, 0.2078431, 1,
-0.2312451, -1.409164, -1.892792, 0, 1, 0.2156863, 1,
-0.2312125, -0.1473346, -1.451852, 0, 1, 0.2196078, 1,
-0.2290005, 0.7795725, -0.6330342, 0, 1, 0.227451, 1,
-0.2281735, -1.939645, -2.137331, 0, 1, 0.2313726, 1,
-0.226323, -0.6719741, -3.180013, 0, 1, 0.2392157, 1,
-0.2261785, -0.1737084, -1.64675, 0, 1, 0.2431373, 1,
-0.2251809, -0.5616989, -4.74194, 0, 1, 0.2509804, 1,
-0.2249111, -2.653407, -3.796354, 0, 1, 0.254902, 1,
-0.2247983, -0.2237527, -2.837419, 0, 1, 0.2627451, 1,
-0.2234752, 0.4905353, -0.5319805, 0, 1, 0.2666667, 1,
-0.2214578, 0.5813138, -1.497989, 0, 1, 0.2745098, 1,
-0.2169773, -1.55461, -2.793563, 0, 1, 0.2784314, 1,
-0.2146298, -0.07452179, -2.567767, 0, 1, 0.2862745, 1,
-0.2144493, -0.7176268, -3.872798, 0, 1, 0.2901961, 1,
-0.2134122, 0.8517466, -0.1588566, 0, 1, 0.2980392, 1,
-0.2107569, 1.405808, -0.209798, 0, 1, 0.3058824, 1,
-0.2011855, -1.753236, -3.342906, 0, 1, 0.3098039, 1,
-0.1976525, 1.476033, -1.029932, 0, 1, 0.3176471, 1,
-0.1974504, 0.3387813, -1.509359, 0, 1, 0.3215686, 1,
-0.1958129, 0.189761, -1.083445, 0, 1, 0.3294118, 1,
-0.1949062, -0.8375229, -1.17923, 0, 1, 0.3333333, 1,
-0.1928489, -0.2052789, -2.319106, 0, 1, 0.3411765, 1,
-0.1912654, -0.2022849, -4.338892, 0, 1, 0.345098, 1,
-0.1896921, 1.876421, 1.369682, 0, 1, 0.3529412, 1,
-0.1865666, 0.8371661, -0.7643267, 0, 1, 0.3568628, 1,
-0.1863879, -0.9990371, -2.603935, 0, 1, 0.3647059, 1,
-0.1836977, 1.217327, -0.8680298, 0, 1, 0.3686275, 1,
-0.1803993, 2.46496, 0.9761519, 0, 1, 0.3764706, 1,
-0.1792187, -0.2577895, -1.395561, 0, 1, 0.3803922, 1,
-0.1782361, 0.6744806, -1.155006, 0, 1, 0.3882353, 1,
-0.1758901, 0.1432488, -1.637078, 0, 1, 0.3921569, 1,
-0.1758605, -0.5684841, -4.515419, 0, 1, 0.4, 1,
-0.1757294, 0.2347132, -0.2929085, 0, 1, 0.4078431, 1,
-0.171262, -1.120924, -1.799413, 0, 1, 0.4117647, 1,
-0.1712405, 0.5123636, -2.774821, 0, 1, 0.4196078, 1,
-0.1672648, 1.26684, 1.743342, 0, 1, 0.4235294, 1,
-0.1654854, 0.08841974, -0.6410903, 0, 1, 0.4313726, 1,
-0.1649386, -0.04225408, -0.7474572, 0, 1, 0.4352941, 1,
-0.1647684, 0.3250796, 0.06993698, 0, 1, 0.4431373, 1,
-0.1641329, 0.7381628, 0.6386029, 0, 1, 0.4470588, 1,
-0.1621111, -0.01385245, -2.859135, 0, 1, 0.454902, 1,
-0.1604286, -0.691492, -1.765172, 0, 1, 0.4588235, 1,
-0.158638, -0.02578676, -1.58624, 0, 1, 0.4666667, 1,
-0.1575505, -2.400977, -3.563766, 0, 1, 0.4705882, 1,
-0.1514797, -0.3151306, -3.079722, 0, 1, 0.4784314, 1,
-0.1499579, -0.6559885, -4.38028, 0, 1, 0.4823529, 1,
-0.1493905, -0.3579639, -3.461675, 0, 1, 0.4901961, 1,
-0.1483808, 0.2317441, -0.9075641, 0, 1, 0.4941176, 1,
-0.1472366, -0.2683302, -3.866495, 0, 1, 0.5019608, 1,
-0.14373, -1.350338, -1.566759, 0, 1, 0.509804, 1,
-0.1385476, -0.7541076, -5.021665, 0, 1, 0.5137255, 1,
-0.1368186, 0.5805259, -1.333513, 0, 1, 0.5215687, 1,
-0.1354528, -0.3528635, -2.324817, 0, 1, 0.5254902, 1,
-0.1339244, 0.5547919, -1.176109, 0, 1, 0.5333334, 1,
-0.1307651, 0.9918253, -0.6658404, 0, 1, 0.5372549, 1,
-0.1301541, -0.1614606, -1.404178, 0, 1, 0.5450981, 1,
-0.1296521, 0.353626, -0.2866702, 0, 1, 0.5490196, 1,
-0.128073, 0.7656556, 0.5533353, 0, 1, 0.5568628, 1,
-0.1153636, -1.36068, -4.875058, 0, 1, 0.5607843, 1,
-0.1114535, -0.7502483, -3.969974, 0, 1, 0.5686275, 1,
-0.1045995, 0.2009047, -0.7000235, 0, 1, 0.572549, 1,
-0.1037252, -0.3766081, -3.404306, 0, 1, 0.5803922, 1,
-0.103097, -0.5882766, -3.947411, 0, 1, 0.5843138, 1,
-0.09188753, -0.917128, -4.761908, 0, 1, 0.5921569, 1,
-0.0888195, -0.3391823, -1.335698, 0, 1, 0.5960785, 1,
-0.08755039, -2.136123, -3.177566, 0, 1, 0.6039216, 1,
-0.08659547, -1.408339, -3.29312, 0, 1, 0.6117647, 1,
-0.08638592, 0.392263, -0.1550575, 0, 1, 0.6156863, 1,
-0.08603559, -0.7064074, -1.020635, 0, 1, 0.6235294, 1,
-0.08231913, -1.415703, -2.849091, 0, 1, 0.627451, 1,
-0.0801995, -0.07001267, -2.780178, 0, 1, 0.6352941, 1,
-0.08015496, -0.2198466, -3.994314, 0, 1, 0.6392157, 1,
-0.07867673, -0.7167868, -1.243194, 0, 1, 0.6470588, 1,
-0.07257642, 0.7199485, -0.08403122, 0, 1, 0.6509804, 1,
-0.07131935, -1.667009, -3.18529, 0, 1, 0.6588235, 1,
-0.06900717, -1.165844, -2.693231, 0, 1, 0.6627451, 1,
-0.0680457, -0.8131326, -3.765316, 0, 1, 0.6705883, 1,
-0.06692419, -1.204828, -1.74035, 0, 1, 0.6745098, 1,
-0.06376439, -0.4713266, -4.526382, 0, 1, 0.682353, 1,
-0.05963183, 0.7223745, 0.4526548, 0, 1, 0.6862745, 1,
-0.05550164, 0.2508084, 1.04943, 0, 1, 0.6941177, 1,
-0.05442571, -1.52631, -1.71737, 0, 1, 0.7019608, 1,
-0.05274453, 0.7139734, 0.3715293, 0, 1, 0.7058824, 1,
-0.05226877, 2.01107, 0.3823636, 0, 1, 0.7137255, 1,
-0.04685782, -0.6973711, -4.213359, 0, 1, 0.7176471, 1,
-0.04649435, 0.8385381, -1.481878, 0, 1, 0.7254902, 1,
-0.04560616, 0.9227841, -0.9113746, 0, 1, 0.7294118, 1,
-0.04513353, -0.1368218, -3.010891, 0, 1, 0.7372549, 1,
-0.04423428, -0.2884066, -0.7854318, 0, 1, 0.7411765, 1,
-0.04290393, -0.03270347, -2.597903, 0, 1, 0.7490196, 1,
-0.04206461, 0.5740504, -1.675414, 0, 1, 0.7529412, 1,
-0.04171022, -0.7564258, -2.575414, 0, 1, 0.7607843, 1,
-0.04158884, -1.208899, -3.15511, 0, 1, 0.7647059, 1,
-0.04057416, -0.7178608, -3.762314, 0, 1, 0.772549, 1,
-0.03859429, -0.5367035, -3.342008, 0, 1, 0.7764706, 1,
-0.03652598, 1.199021, -0.6842131, 0, 1, 0.7843137, 1,
-0.02657048, 0.09356815, -1.633632, 0, 1, 0.7882353, 1,
-0.02312034, 0.9311345, -2.290992, 0, 1, 0.7960784, 1,
-0.01755774, -0.293425, -4.53294, 0, 1, 0.8039216, 1,
-0.0164997, 0.2204856, 1.183081, 0, 1, 0.8078431, 1,
-0.01462354, 0.8648072, -1.962146, 0, 1, 0.8156863, 1,
-0.01385061, 1.312346, -0.6449837, 0, 1, 0.8196079, 1,
-0.01153237, -0.1693905, -4.484561, 0, 1, 0.827451, 1,
-0.01149911, -0.7282964, -3.093697, 0, 1, 0.8313726, 1,
-0.01019513, -0.2173687, -4.338719, 0, 1, 0.8392157, 1,
-0.007774989, 0.4063778, -0.4108682, 0, 1, 0.8431373, 1,
-0.003440178, -1.475039, -3.616321, 0, 1, 0.8509804, 1,
-0.0004780093, 0.7886446, 0.8785123, 0, 1, 0.854902, 1,
0.000645327, -2.055254, 2.069715, 0, 1, 0.8627451, 1,
0.001460406, -0.3061884, 2.922729, 0, 1, 0.8666667, 1,
0.001996614, -1.189506, 3.255069, 0, 1, 0.8745098, 1,
0.002609105, 1.766338, -1.195671, 0, 1, 0.8784314, 1,
0.004926321, -0.7947091, 3.829879, 0, 1, 0.8862745, 1,
0.004970282, 0.4839312, 0.2645479, 0, 1, 0.8901961, 1,
0.00844175, 0.531704, -0.0626479, 0, 1, 0.8980392, 1,
0.009060755, 0.2363799, -0.1737542, 0, 1, 0.9058824, 1,
0.0103373, -0.215025, 3.123642, 0, 1, 0.9098039, 1,
0.01187357, 0.7114096, -1.036996, 0, 1, 0.9176471, 1,
0.01552107, -0.5872089, 3.388074, 0, 1, 0.9215686, 1,
0.01845907, 0.4172992, -0.5736611, 0, 1, 0.9294118, 1,
0.02183107, 0.01163004, 1.488913, 0, 1, 0.9333333, 1,
0.02373946, 0.9344755, 0.3914669, 0, 1, 0.9411765, 1,
0.03099767, 2.118994, 0.2966375, 0, 1, 0.945098, 1,
0.03400537, -1.01484, 3.531359, 0, 1, 0.9529412, 1,
0.03560752, 0.8884488, -0.6330409, 0, 1, 0.9568627, 1,
0.04019197, -0.998534, 2.842791, 0, 1, 0.9647059, 1,
0.04025276, 0.8559428, -0.8191152, 0, 1, 0.9686275, 1,
0.04217522, -0.07655412, 2.027981, 0, 1, 0.9764706, 1,
0.04446001, -0.127375, 2.74175, 0, 1, 0.9803922, 1,
0.04490724, -0.1006833, 2.966158, 0, 1, 0.9882353, 1,
0.04942096, -1.54323, 1.964517, 0, 1, 0.9921569, 1,
0.05372187, 1.488902, -0.2030392, 0, 1, 1, 1,
0.05402702, -0.632514, 2.25743, 0, 0.9921569, 1, 1,
0.06240411, 0.3651665, 1.085686, 0, 0.9882353, 1, 1,
0.06424331, 2.146886, -0.1641091, 0, 0.9803922, 1, 1,
0.06598186, -1.621539, 2.781119, 0, 0.9764706, 1, 1,
0.07139502, -0.5077429, 2.437008, 0, 0.9686275, 1, 1,
0.07157847, 0.1490955, -0.5770886, 0, 0.9647059, 1, 1,
0.07199796, -2.291742, 3.602075, 0, 0.9568627, 1, 1,
0.07404047, 0.572731, 0.006408324, 0, 0.9529412, 1, 1,
0.074344, -0.3912287, 2.159233, 0, 0.945098, 1, 1,
0.07718839, 0.4247885, 1.422369, 0, 0.9411765, 1, 1,
0.08056925, 1.519725, 0.5910491, 0, 0.9333333, 1, 1,
0.08267582, -1.799011, 3.172656, 0, 0.9294118, 1, 1,
0.0833598, 1.308559, -0.6986503, 0, 0.9215686, 1, 1,
0.08710837, 0.308513, 2.915608, 0, 0.9176471, 1, 1,
0.09033686, 0.462361, -1.44945, 0, 0.9098039, 1, 1,
0.09327788, -1.870798, 2.662818, 0, 0.9058824, 1, 1,
0.09676034, -1.051491, 3.493209, 0, 0.8980392, 1, 1,
0.09882461, -0.3925505, 3.036937, 0, 0.8901961, 1, 1,
0.1020005, -0.8837065, 2.405429, 0, 0.8862745, 1, 1,
0.1041367, -1.426044, 2.379837, 0, 0.8784314, 1, 1,
0.1087768, 1.201906, -0.09144146, 0, 0.8745098, 1, 1,
0.1174974, 0.09838568, 0.4891347, 0, 0.8666667, 1, 1,
0.1186512, 0.4264474, 2.196362, 0, 0.8627451, 1, 1,
0.1216092, 0.09545653, -0.4971716, 0, 0.854902, 1, 1,
0.1260725, -1.222625, 3.090748, 0, 0.8509804, 1, 1,
0.126736, 0.2407366, -0.09424633, 0, 0.8431373, 1, 1,
0.1274982, 0.1414142, 0.8911938, 0, 0.8392157, 1, 1,
0.1283123, 0.4785649, 0.8459265, 0, 0.8313726, 1, 1,
0.1291573, 0.3099597, -1.797293, 0, 0.827451, 1, 1,
0.1333588, 0.7096402, -0.8840898, 0, 0.8196079, 1, 1,
0.1341631, 1.659701, -0.9041772, 0, 0.8156863, 1, 1,
0.1358721, 1.401918, -0.9538699, 0, 0.8078431, 1, 1,
0.1438646, 0.3813994, -0.1555251, 0, 0.8039216, 1, 1,
0.1461394, -0.9707178, 2.59609, 0, 0.7960784, 1, 1,
0.147991, -0.1251693, 2.514517, 0, 0.7882353, 1, 1,
0.1513396, -0.5582619, 3.450321, 0, 0.7843137, 1, 1,
0.1513841, 0.5654473, 1.181849, 0, 0.7764706, 1, 1,
0.1564008, -0.23132, 2.67553, 0, 0.772549, 1, 1,
0.1566463, 1.211102, -0.08823562, 0, 0.7647059, 1, 1,
0.160368, -0.1355523, 2.819702, 0, 0.7607843, 1, 1,
0.1655977, -0.6796213, 1.293533, 0, 0.7529412, 1, 1,
0.1672801, 0.1330662, 2.243207, 0, 0.7490196, 1, 1,
0.1691879, -0.4986229, 2.375862, 0, 0.7411765, 1, 1,
0.1708329, 1.093304, -0.899158, 0, 0.7372549, 1, 1,
0.1724055, 0.4664618, 1.039016, 0, 0.7294118, 1, 1,
0.1746125, -0.2639222, 3.086371, 0, 0.7254902, 1, 1,
0.1774847, 1.829806, -0.5744275, 0, 0.7176471, 1, 1,
0.1775955, -0.2311765, 4.735766, 0, 0.7137255, 1, 1,
0.1788796, 1.141692, -0.2368317, 0, 0.7058824, 1, 1,
0.1803064, 0.8296431, -1.774054, 0, 0.6980392, 1, 1,
0.1814092, 1.162504, -0.02445575, 0, 0.6941177, 1, 1,
0.1827191, -0.1479912, 3.397979, 0, 0.6862745, 1, 1,
0.1896766, -0.1945002, 1.230186, 0, 0.682353, 1, 1,
0.19231, -0.1074358, 3.529125, 0, 0.6745098, 1, 1,
0.1985632, -0.4909112, 2.787267, 0, 0.6705883, 1, 1,
0.1998849, 1.734465, -0.1306498, 0, 0.6627451, 1, 1,
0.2036321, 0.6948146, -0.4892171, 0, 0.6588235, 1, 1,
0.2046287, -0.9555427, 3.178117, 0, 0.6509804, 1, 1,
0.2069986, 0.3825695, 1.223751, 0, 0.6470588, 1, 1,
0.2071341, 0.5943747, -1.376416, 0, 0.6392157, 1, 1,
0.2078606, -0.7932838, 1.95925, 0, 0.6352941, 1, 1,
0.2101645, -1.069812, 3.81078, 0, 0.627451, 1, 1,
0.2162508, 1.559131, -0.008637444, 0, 0.6235294, 1, 1,
0.2194321, 1.134509, 0.5114385, 0, 0.6156863, 1, 1,
0.2208871, 0.7441545, 0.06430853, 0, 0.6117647, 1, 1,
0.2213588, -0.2545199, 4.386141, 0, 0.6039216, 1, 1,
0.2270595, 0.8719822, 1.340353, 0, 0.5960785, 1, 1,
0.2283779, 0.8974566, 0.2357257, 0, 0.5921569, 1, 1,
0.2311304, 1.225066, 0.08727007, 0, 0.5843138, 1, 1,
0.2320122, 0.6757836, 1.093974, 0, 0.5803922, 1, 1,
0.2339636, -0.5387596, 4.411664, 0, 0.572549, 1, 1,
0.2367476, 1.008811, 2.315471, 0, 0.5686275, 1, 1,
0.2493303, -0.7980934, 3.276415, 0, 0.5607843, 1, 1,
0.2516217, 2.082806, 0.1753144, 0, 0.5568628, 1, 1,
0.2534804, 0.9261182, 0.3314093, 0, 0.5490196, 1, 1,
0.253561, -0.3156004, 4.059825, 0, 0.5450981, 1, 1,
0.2539601, -0.3486826, 2.991814, 0, 0.5372549, 1, 1,
0.2616112, -2.035524, 3.670505, 0, 0.5333334, 1, 1,
0.2619912, 1.116347, -0.5922676, 0, 0.5254902, 1, 1,
0.2631021, -0.718268, 1.958564, 0, 0.5215687, 1, 1,
0.2635236, 0.6285931, -1.179181, 0, 0.5137255, 1, 1,
0.2643842, 0.01409153, 1.052749, 0, 0.509804, 1, 1,
0.2659222, -1.737796, 3.56982, 0, 0.5019608, 1, 1,
0.2695241, 0.7258776, 1.090743, 0, 0.4941176, 1, 1,
0.2741893, 1.153608, -0.6817527, 0, 0.4901961, 1, 1,
0.2754618, -1.078097, 2.303796, 0, 0.4823529, 1, 1,
0.2793114, -0.454591, 2.167103, 0, 0.4784314, 1, 1,
0.2836931, 3.142837, -0.2398864, 0, 0.4705882, 1, 1,
0.2841504, 0.9434121, -0.8220079, 0, 0.4666667, 1, 1,
0.2850573, 1.460736, 0.6926478, 0, 0.4588235, 1, 1,
0.2877768, 0.8634046, 1.517867, 0, 0.454902, 1, 1,
0.2886254, 1.158005, 1.2622, 0, 0.4470588, 1, 1,
0.289405, 0.8124385, -0.492936, 0, 0.4431373, 1, 1,
0.2895071, -1.201204, 3.232309, 0, 0.4352941, 1, 1,
0.2922207, 0.5837147, -0.9198788, 0, 0.4313726, 1, 1,
0.2934345, 0.367406, 0.06918857, 0, 0.4235294, 1, 1,
0.2959487, 0.9159989, 0.5256906, 0, 0.4196078, 1, 1,
0.2975749, -0.5843499, 2.331841, 0, 0.4117647, 1, 1,
0.2990315, -0.2187303, 1.786352, 0, 0.4078431, 1, 1,
0.3019102, -0.5840372, 1.850992, 0, 0.4, 1, 1,
0.3021842, -0.40358, 2.270945, 0, 0.3921569, 1, 1,
0.3022636, -0.6691169, 1.659417, 0, 0.3882353, 1, 1,
0.3026701, -1.019016, 3.219605, 0, 0.3803922, 1, 1,
0.3029787, -0.4375432, 3.223484, 0, 0.3764706, 1, 1,
0.3042668, 2.443025, -0.1526072, 0, 0.3686275, 1, 1,
0.3068408, 1.319272, 1.2538, 0, 0.3647059, 1, 1,
0.3073572, -1.547123, 3.294527, 0, 0.3568628, 1, 1,
0.3085833, -0.9439796, 1.082722, 0, 0.3529412, 1, 1,
0.3115231, -0.2737716, 1.879102, 0, 0.345098, 1, 1,
0.3122086, -0.3281575, -0.3196715, 0, 0.3411765, 1, 1,
0.3146198, -1.497995, 4.929408, 0, 0.3333333, 1, 1,
0.3178965, -0.6692209, 4.095019, 0, 0.3294118, 1, 1,
0.3210843, 0.4807704, 0.9375293, 0, 0.3215686, 1, 1,
0.3306988, -0.183489, 2.24729, 0, 0.3176471, 1, 1,
0.3309004, 0.3262607, -0.3444952, 0, 0.3098039, 1, 1,
0.3309145, -0.8313148, 2.599057, 0, 0.3058824, 1, 1,
0.3365519, 0.2216105, -0.744253, 0, 0.2980392, 1, 1,
0.3382244, 0.115413, 1.303143, 0, 0.2901961, 1, 1,
0.3417596, -0.7206119, 2.577609, 0, 0.2862745, 1, 1,
0.3418373, -0.4403507, 0.7172717, 0, 0.2784314, 1, 1,
0.3451834, 0.6034113, 0.04080955, 0, 0.2745098, 1, 1,
0.3491937, -0.8057395, 5.385599, 0, 0.2666667, 1, 1,
0.3535903, 1.426197, -0.5376049, 0, 0.2627451, 1, 1,
0.3549439, 0.5607225, 0.205262, 0, 0.254902, 1, 1,
0.3599594, 0.4216968, -0.4534116, 0, 0.2509804, 1, 1,
0.3630022, 0.5358033, 1.21382, 0, 0.2431373, 1, 1,
0.3658323, 0.4802899, 0.8592504, 0, 0.2392157, 1, 1,
0.3699546, -2.394818, 3.15368, 0, 0.2313726, 1, 1,
0.3723154, 0.636588, -0.571113, 0, 0.227451, 1, 1,
0.3734052, -1.487216, 2.423784, 0, 0.2196078, 1, 1,
0.3849367, -1.617979, 1.995283, 0, 0.2156863, 1, 1,
0.3880033, 1.19261, 0.4763849, 0, 0.2078431, 1, 1,
0.3881342, -0.003003545, 3.673393, 0, 0.2039216, 1, 1,
0.3892006, 0.7539281, -0.4786168, 0, 0.1960784, 1, 1,
0.3916008, -0.4714434, 1.526571, 0, 0.1882353, 1, 1,
0.3961721, 0.09081538, 2.426996, 0, 0.1843137, 1, 1,
0.3972743, 1.140019, 0.02537394, 0, 0.1764706, 1, 1,
0.3977103, -0.05751581, 2.870614, 0, 0.172549, 1, 1,
0.403276, 0.8185897, 0.1583779, 0, 0.1647059, 1, 1,
0.4074201, 0.7023029, 0.3186376, 0, 0.1607843, 1, 1,
0.4082276, 0.784136, 0.6444619, 0, 0.1529412, 1, 1,
0.4099606, 0.3486695, 0.4381966, 0, 0.1490196, 1, 1,
0.4111715, 0.03059636, 3.757627, 0, 0.1411765, 1, 1,
0.4114927, 1.243997, 0.5719015, 0, 0.1372549, 1, 1,
0.4141838, -0.1272508, 0.9038925, 0, 0.1294118, 1, 1,
0.4232468, 0.2115642, 1.778458, 0, 0.1254902, 1, 1,
0.4242311, 0.66078, 0.6452208, 0, 0.1176471, 1, 1,
0.4261818, 0.335238, 1.245917, 0, 0.1137255, 1, 1,
0.4293462, -0.2167235, 3.629247, 0, 0.1058824, 1, 1,
0.4307572, 1.019001, 1.885087, 0, 0.09803922, 1, 1,
0.4399151, -1.908632, 3.19637, 0, 0.09411765, 1, 1,
0.4452649, -0.4425901, 1.904041, 0, 0.08627451, 1, 1,
0.4497406, 0.2865449, 1.130177, 0, 0.08235294, 1, 1,
0.45162, 0.6090308, 1.506372, 0, 0.07450981, 1, 1,
0.455928, 1.902526, 0.2778813, 0, 0.07058824, 1, 1,
0.4560311, -0.1105588, 1.799663, 0, 0.0627451, 1, 1,
0.4634764, -1.656053, 4.169994, 0, 0.05882353, 1, 1,
0.4716388, -1.882737, 3.812383, 0, 0.05098039, 1, 1,
0.4820147, 0.03748354, 2.414546, 0, 0.04705882, 1, 1,
0.4850397, 0.8695368, -0.105491, 0, 0.03921569, 1, 1,
0.4895533, -0.8922963, 1.428537, 0, 0.03529412, 1, 1,
0.4910999, 0.3882257, 1.411323, 0, 0.02745098, 1, 1,
0.4928502, -0.8514889, 2.095046, 0, 0.02352941, 1, 1,
0.5017177, -0.9399486, 1.055263, 0, 0.01568628, 1, 1,
0.5031542, 0.5830994, 0.2469638, 0, 0.01176471, 1, 1,
0.5059643, 0.6642078, 0.8086609, 0, 0.003921569, 1, 1,
0.5060351, 0.98899, -0.8101618, 0.003921569, 0, 1, 1,
0.5093367, -0.01764913, 1.143977, 0.007843138, 0, 1, 1,
0.5115792, 1.358733, -0.02773681, 0.01568628, 0, 1, 1,
0.5123117, 0.1599403, 0.4821157, 0.01960784, 0, 1, 1,
0.5135658, 0.2263418, 1.20423, 0.02745098, 0, 1, 1,
0.5188903, 1.309186, 0.3672017, 0.03137255, 0, 1, 1,
0.5217813, -0.6357565, 1.931736, 0.03921569, 0, 1, 1,
0.5248331, 1.677448, 0.9804828, 0.04313726, 0, 1, 1,
0.5265431, 0.06163945, 1.504339, 0.05098039, 0, 1, 1,
0.5361827, -0.8534873, 1.971825, 0.05490196, 0, 1, 1,
0.5380218, -0.2891275, 2.441146, 0.0627451, 0, 1, 1,
0.5457359, -1.353646, 3.51247, 0.06666667, 0, 1, 1,
0.5466327, 0.9541285, -0.1843067, 0.07450981, 0, 1, 1,
0.5522034, -1.026698, 2.747577, 0.07843138, 0, 1, 1,
0.5524008, 0.5280803, -0.0518313, 0.08627451, 0, 1, 1,
0.5528651, 1.655794, 1.061961, 0.09019608, 0, 1, 1,
0.5548444, -0.9980574, 4.847661, 0.09803922, 0, 1, 1,
0.5597253, 1.278649, 0.8325385, 0.1058824, 0, 1, 1,
0.5605023, -0.4177399, 1.174021, 0.1098039, 0, 1, 1,
0.5606995, 1.70374, -0.7107944, 0.1176471, 0, 1, 1,
0.5611479, -0.9894522, 3.04423, 0.1215686, 0, 1, 1,
0.5646377, 0.6092132, -2.080711, 0.1294118, 0, 1, 1,
0.5663631, -1.305382, 3.164337, 0.1333333, 0, 1, 1,
0.5713141, 1.709007, 0.1369914, 0.1411765, 0, 1, 1,
0.5721714, 0.3220522, 1.284644, 0.145098, 0, 1, 1,
0.5732341, -1.003015, 3.90865, 0.1529412, 0, 1, 1,
0.5747459, -0.7139853, 2.428239, 0.1568628, 0, 1, 1,
0.5771525, -0.4111139, 2.507246, 0.1647059, 0, 1, 1,
0.5776557, -0.02150786, 3.197336, 0.1686275, 0, 1, 1,
0.5809317, 0.05161123, 1.299287, 0.1764706, 0, 1, 1,
0.5829446, 1.529554, 0.7477661, 0.1803922, 0, 1, 1,
0.585364, 0.241388, 1.090558, 0.1882353, 0, 1, 1,
0.5858479, 1.137999, 0.422878, 0.1921569, 0, 1, 1,
0.5889405, -0.521026, 1.995267, 0.2, 0, 1, 1,
0.5902357, 0.1112554, 0.9260787, 0.2078431, 0, 1, 1,
0.5922517, -0.07894029, 2.188116, 0.2117647, 0, 1, 1,
0.5984569, 0.03082866, 3.500888, 0.2196078, 0, 1, 1,
0.6045867, -1.029667, 2.022786, 0.2235294, 0, 1, 1,
0.6056785, 0.009697936, 1.90136, 0.2313726, 0, 1, 1,
0.6136886, 1.024044, 2.716205, 0.2352941, 0, 1, 1,
0.6153647, 2.628702, 0.05713004, 0.2431373, 0, 1, 1,
0.6164088, -0.5789818, 2.422729, 0.2470588, 0, 1, 1,
0.6168882, -1.147643, 0.9228713, 0.254902, 0, 1, 1,
0.6179803, 1.377731, -0.0147142, 0.2588235, 0, 1, 1,
0.6185052, 0.2784526, 0.2338558, 0.2666667, 0, 1, 1,
0.6195986, -0.4570733, 1.757965, 0.2705882, 0, 1, 1,
0.6307779, -0.7978758, 1.101916, 0.2784314, 0, 1, 1,
0.6337912, 0.9368068, -0.07934999, 0.282353, 0, 1, 1,
0.6370035, 0.498973, 0.1118055, 0.2901961, 0, 1, 1,
0.6375822, 1.024694, -1.005134, 0.2941177, 0, 1, 1,
0.6401809, 0.01735943, 2.999472, 0.3019608, 0, 1, 1,
0.6429607, -0.8659452, 2.962177, 0.3098039, 0, 1, 1,
0.6453302, -1.822528, 4.977617, 0.3137255, 0, 1, 1,
0.645485, 0.8939138, -0.7397095, 0.3215686, 0, 1, 1,
0.6509267, 0.212342, 0.8832076, 0.3254902, 0, 1, 1,
0.6550573, 0.7204379, 0.1160583, 0.3333333, 0, 1, 1,
0.6608587, 0.6961524, -0.5562478, 0.3372549, 0, 1, 1,
0.6648366, 0.1718533, 1.342298, 0.345098, 0, 1, 1,
0.6663516, 0.812885, -0.3607552, 0.3490196, 0, 1, 1,
0.6681936, -0.06551886, 1.570957, 0.3568628, 0, 1, 1,
0.6682996, -0.7733378, 2.990663, 0.3607843, 0, 1, 1,
0.6691198, -0.01392456, 1.477972, 0.3686275, 0, 1, 1,
0.67572, 0.5237256, 1.416039, 0.372549, 0, 1, 1,
0.6816899, -0.9111809, 2.685673, 0.3803922, 0, 1, 1,
0.6817827, 0.2731126, 1.909668, 0.3843137, 0, 1, 1,
0.6839696, -0.5986131, 1.347006, 0.3921569, 0, 1, 1,
0.6842545, -1.221976, 3.073337, 0.3960784, 0, 1, 1,
0.6860904, 0.3101451, -0.01821741, 0.4039216, 0, 1, 1,
0.69563, 2.34522, 1.136173, 0.4117647, 0, 1, 1,
0.6967179, -0.3406551, 2.39882, 0.4156863, 0, 1, 1,
0.7057607, -1.022419, 0.7102863, 0.4235294, 0, 1, 1,
0.7076277, 0.5559238, -1.561836, 0.427451, 0, 1, 1,
0.7087455, -0.128382, 1.720226, 0.4352941, 0, 1, 1,
0.7093478, -0.404714, 4.83677, 0.4392157, 0, 1, 1,
0.7120933, -0.3423901, 2.212372, 0.4470588, 0, 1, 1,
0.7123524, -2.186779, 1.544954, 0.4509804, 0, 1, 1,
0.7137908, -0.8657259, 0.7172804, 0.4588235, 0, 1, 1,
0.7199878, 0.4833685, 1.644066, 0.4627451, 0, 1, 1,
0.7264385, -0.1719286, 3.370423, 0.4705882, 0, 1, 1,
0.7264581, -0.994039, 1.685098, 0.4745098, 0, 1, 1,
0.7291895, 1.762068, 0.6076965, 0.4823529, 0, 1, 1,
0.7346621, -0.275255, 3.271923, 0.4862745, 0, 1, 1,
0.7363774, 0.2229855, 0.7339861, 0.4941176, 0, 1, 1,
0.7422762, 0.01370518, 2.461587, 0.5019608, 0, 1, 1,
0.7469328, 0.07495852, -0.1447613, 0.5058824, 0, 1, 1,
0.7483211, -1.398714, 1.706674, 0.5137255, 0, 1, 1,
0.7567763, 0.08132532, 1.187497, 0.5176471, 0, 1, 1,
0.7641761, -2.839529, 1.760183, 0.5254902, 0, 1, 1,
0.7668473, -0.3138745, -0.8166782, 0.5294118, 0, 1, 1,
0.7674406, 0.2303477, 1.254967, 0.5372549, 0, 1, 1,
0.7690244, 1.426418, 0.6402716, 0.5411765, 0, 1, 1,
0.7739889, -0.3938878, 2.228947, 0.5490196, 0, 1, 1,
0.776683, 1.880911, 0.853503, 0.5529412, 0, 1, 1,
0.7818462, -0.4447285, 2.393104, 0.5607843, 0, 1, 1,
0.7859277, -1.179403, 2.692504, 0.5647059, 0, 1, 1,
0.7893928, -0.3976347, 1.956777, 0.572549, 0, 1, 1,
0.7897136, -0.1814407, 1.95072, 0.5764706, 0, 1, 1,
0.7898787, -0.9876128, 1.919026, 0.5843138, 0, 1, 1,
0.7919453, 1.890769, -0.5832972, 0.5882353, 0, 1, 1,
0.7935851, 0.296616, -0.1902437, 0.5960785, 0, 1, 1,
0.7959929, -0.647684, 2.6987, 0.6039216, 0, 1, 1,
0.8046938, -0.4888142, 1.243013, 0.6078432, 0, 1, 1,
0.8056464, -0.8061715, 1.848797, 0.6156863, 0, 1, 1,
0.8063462, 0.05707794, 1.953703, 0.6196079, 0, 1, 1,
0.8132975, -1.347811, 1.970638, 0.627451, 0, 1, 1,
0.8162147, -0.724986, 1.260502, 0.6313726, 0, 1, 1,
0.8166115, -0.7002808, 2.269952, 0.6392157, 0, 1, 1,
0.8202651, 0.1623903, 0.9934812, 0.6431373, 0, 1, 1,
0.8257109, -0.9705749, 3.843213, 0.6509804, 0, 1, 1,
0.8270929, -1.756035, 4.350387, 0.654902, 0, 1, 1,
0.8279541, 1.956842, 0.7178568, 0.6627451, 0, 1, 1,
0.8308248, 0.3510804, 1.754141, 0.6666667, 0, 1, 1,
0.8328928, -1.247866, 3.584771, 0.6745098, 0, 1, 1,
0.8338003, 0.9042658, -1.305075, 0.6784314, 0, 1, 1,
0.8353515, -0.7179056, 3.939123, 0.6862745, 0, 1, 1,
0.8364666, 0.8470818, 0.830315, 0.6901961, 0, 1, 1,
0.8411367, -0.5313292, 2.355873, 0.6980392, 0, 1, 1,
0.8432742, -0.9939991, 2.115864, 0.7058824, 0, 1, 1,
0.8438177, -0.009971607, 1.997742, 0.7098039, 0, 1, 1,
0.8569088, -0.2064926, 2.087212, 0.7176471, 0, 1, 1,
0.8631333, 0.5928007, 1.164108, 0.7215686, 0, 1, 1,
0.8642549, 0.08398775, 2.289925, 0.7294118, 0, 1, 1,
0.8673384, 1.703223, 0.8611073, 0.7333333, 0, 1, 1,
0.8722519, -1.117169, 2.377173, 0.7411765, 0, 1, 1,
0.8726401, 0.5467907, 0.8843175, 0.7450981, 0, 1, 1,
0.8740356, -0.8594737, 1.160061, 0.7529412, 0, 1, 1,
0.8777168, 0.5701324, 1.189282, 0.7568628, 0, 1, 1,
0.8797337, 0.4416893, 1.988767, 0.7647059, 0, 1, 1,
0.8803815, 1.112094, 0.3383511, 0.7686275, 0, 1, 1,
0.8844957, 0.2908039, 0.4825359, 0.7764706, 0, 1, 1,
0.8858483, -1.251105, 3.358138, 0.7803922, 0, 1, 1,
0.8911304, -0.9932081, 1.748537, 0.7882353, 0, 1, 1,
0.8917301, 0.9282993, 0.3589269, 0.7921569, 0, 1, 1,
0.897936, -1.660864, 3.173319, 0.8, 0, 1, 1,
0.9026902, 0.1747967, 1.898534, 0.8078431, 0, 1, 1,
0.915886, -1.291604, 3.4198, 0.8117647, 0, 1, 1,
0.9212524, -2.681746, 2.498719, 0.8196079, 0, 1, 1,
0.9225961, -1.080234, 2.804491, 0.8235294, 0, 1, 1,
0.9280725, -1.009622, 1.683226, 0.8313726, 0, 1, 1,
0.9288788, -1.061014, 1.974836, 0.8352941, 0, 1, 1,
0.9291621, 1.043536, -0.6549224, 0.8431373, 0, 1, 1,
0.929941, 0.7717847, -1.108239, 0.8470588, 0, 1, 1,
0.9326321, -0.2156394, 3.20119, 0.854902, 0, 1, 1,
0.9331264, -1.226312, 2.653577, 0.8588235, 0, 1, 1,
0.9335041, -0.6381432, 1.606068, 0.8666667, 0, 1, 1,
0.9360365, 0.5170516, 1.68965, 0.8705882, 0, 1, 1,
0.9389898, -0.6724724, 1.432612, 0.8784314, 0, 1, 1,
0.9409439, -1.443694, 0.8259322, 0.8823529, 0, 1, 1,
0.9431093, 0.6672367, 0.2193383, 0.8901961, 0, 1, 1,
0.9497789, 0.6914323, 0.8380422, 0.8941177, 0, 1, 1,
0.9499374, -2.687838, 3.586794, 0.9019608, 0, 1, 1,
0.9524289, 1.565026, 0.2753616, 0.9098039, 0, 1, 1,
0.9550001, -0.1438438, 2.210521, 0.9137255, 0, 1, 1,
0.9559094, -1.277118, 2.341235, 0.9215686, 0, 1, 1,
0.9581454, 0.01839601, 2.90193, 0.9254902, 0, 1, 1,
0.958833, 0.1658065, 0.5525673, 0.9333333, 0, 1, 1,
0.9595682, 0.9581999, 1.981223, 0.9372549, 0, 1, 1,
0.9627598, -1.294525, 2.598571, 0.945098, 0, 1, 1,
0.9628568, 0.368074, 0.577315, 0.9490196, 0, 1, 1,
0.9697527, -0.6083208, 1.756942, 0.9568627, 0, 1, 1,
0.9721258, 0.5691314, -0.4132679, 0.9607843, 0, 1, 1,
0.9753686, -0.7622275, 0.3505852, 0.9686275, 0, 1, 1,
0.9757283, -1.09573, 2.657305, 0.972549, 0, 1, 1,
0.9759207, -0.5227768, 0.3121254, 0.9803922, 0, 1, 1,
0.9842991, -1.276144, 2.64056, 0.9843137, 0, 1, 1,
0.992484, 1.016258, 0.225888, 0.9921569, 0, 1, 1,
0.998563, 0.3411245, 1.357224, 0.9960784, 0, 1, 1,
1.000488, 0.2346695, 1.045051, 1, 0, 0.9960784, 1,
1.003983, 0.7599553, -0.8908166, 1, 0, 0.9882353, 1,
1.008874, 0.05047125, 0.8444224, 1, 0, 0.9843137, 1,
1.010296, -0.09658544, 3.422007, 1, 0, 0.9764706, 1,
1.015139, -0.1854133, 2.80185, 1, 0, 0.972549, 1,
1.017347, -1.274608, 2.01885, 1, 0, 0.9647059, 1,
1.045853, 1.096609, 1.033979, 1, 0, 0.9607843, 1,
1.060449, -1.232256, 2.626259, 1, 0, 0.9529412, 1,
1.061032, -0.6437542, 2.793718, 1, 0, 0.9490196, 1,
1.068049, -1.52359, 3.592942, 1, 0, 0.9411765, 1,
1.06889, 0.7800074, 2.102013, 1, 0, 0.9372549, 1,
1.079881, 0.450433, 1.219194, 1, 0, 0.9294118, 1,
1.086631, 1.819112, 0.7454382, 1, 0, 0.9254902, 1,
1.088644, -2.321264, 1.767692, 1, 0, 0.9176471, 1,
1.096485, -1.81236, 3.839173, 1, 0, 0.9137255, 1,
1.098677, -0.4067652, 0.6205935, 1, 0, 0.9058824, 1,
1.101419, -1.724757, 2.399827, 1, 0, 0.9019608, 1,
1.10853, -0.8061336, 0.2743756, 1, 0, 0.8941177, 1,
1.112532, -0.3329805, 1.470544, 1, 0, 0.8862745, 1,
1.118152, -0.9741004, 1.144779, 1, 0, 0.8823529, 1,
1.118739, 0.4603251, 1.089942, 1, 0, 0.8745098, 1,
1.125971, -0.7794711, 4.048366, 1, 0, 0.8705882, 1,
1.137688, 1.247904, 0.8969505, 1, 0, 0.8627451, 1,
1.141132, -0.1000448, 0.7542246, 1, 0, 0.8588235, 1,
1.146891, -0.6918649, 1.624125, 1, 0, 0.8509804, 1,
1.150602, -0.7653654, 1.683048, 1, 0, 0.8470588, 1,
1.151095, 0.1024997, 2.524561, 1, 0, 0.8392157, 1,
1.164349, 0.1607694, 3.322721, 1, 0, 0.8352941, 1,
1.166875, -1.747159, 1.895783, 1, 0, 0.827451, 1,
1.182453, -1.174458, 3.225006, 1, 0, 0.8235294, 1,
1.186124, 2.128453, 0.01293378, 1, 0, 0.8156863, 1,
1.200638, -0.4713207, 2.817285, 1, 0, 0.8117647, 1,
1.203029, -0.9900711, 2.735937, 1, 0, 0.8039216, 1,
1.20381, 0.4597368, 1.268277, 1, 0, 0.7960784, 1,
1.211596, -0.3540079, 1.989373, 1, 0, 0.7921569, 1,
1.212306, -1.278355, 1.717403, 1, 0, 0.7843137, 1,
1.230171, 1.790538, -0.5262235, 1, 0, 0.7803922, 1,
1.231916, 1.054175, -0.8330856, 1, 0, 0.772549, 1,
1.233036, -0.4287016, 0.3458996, 1, 0, 0.7686275, 1,
1.234877, 0.3761914, 2.316169, 1, 0, 0.7607843, 1,
1.236757, -0.2480365, 2.135012, 1, 0, 0.7568628, 1,
1.243777, -0.6611618, 1.325487, 1, 0, 0.7490196, 1,
1.243872, 1.364896, 1.283386, 1, 0, 0.7450981, 1,
1.244194, -0.2394649, 2.659488, 1, 0, 0.7372549, 1,
1.25427, -0.0816351, 2.131853, 1, 0, 0.7333333, 1,
1.254982, -1.968004, 2.566925, 1, 0, 0.7254902, 1,
1.259233, 0.1985354, 0.4041249, 1, 0, 0.7215686, 1,
1.263111, -0.8706293, 2.067864, 1, 0, 0.7137255, 1,
1.270485, 1.905345, 1.922901, 1, 0, 0.7098039, 1,
1.281739, -0.5009083, 1.148271, 1, 0, 0.7019608, 1,
1.283169, 1.030541, -0.1772827, 1, 0, 0.6941177, 1,
1.294186, 0.003063944, 3.171262, 1, 0, 0.6901961, 1,
1.294696, -1.052158, 1.040507, 1, 0, 0.682353, 1,
1.313876, -1.553156, 1.684707, 1, 0, 0.6784314, 1,
1.325372, 0.4161519, 2.902074, 1, 0, 0.6705883, 1,
1.333141, -1.248631, 2.824307, 1, 0, 0.6666667, 1,
1.333776, -1.018073, 2.042602, 1, 0, 0.6588235, 1,
1.335535, -1.760476, 4.591505, 1, 0, 0.654902, 1,
1.337407, -1.179602, 2.493608, 1, 0, 0.6470588, 1,
1.338645, 0.8313344, 0.3469542, 1, 0, 0.6431373, 1,
1.339534, 1.587897, 1.099549, 1, 0, 0.6352941, 1,
1.34083, -1.790049, 1.357644, 1, 0, 0.6313726, 1,
1.342653, 0.0312908, 1.837496, 1, 0, 0.6235294, 1,
1.344888, 0.598096, 0.4541891, 1, 0, 0.6196079, 1,
1.349279, 1.298709, 2.922738, 1, 0, 0.6117647, 1,
1.350002, -1.788732, 2.2, 1, 0, 0.6078432, 1,
1.357874, -0.2449134, 3.089565, 1, 0, 0.6, 1,
1.362703, 0.339105, 2.9167, 1, 0, 0.5921569, 1,
1.362847, -0.1083967, 2.319056, 1, 0, 0.5882353, 1,
1.365205, 0.07335752, 0.6493142, 1, 0, 0.5803922, 1,
1.36632, -0.1956825, 1.979539, 1, 0, 0.5764706, 1,
1.369281, -0.3719644, 3.938648, 1, 0, 0.5686275, 1,
1.369492, -0.9502886, 0.2322135, 1, 0, 0.5647059, 1,
1.370078, -0.5608414, 1.973943, 1, 0, 0.5568628, 1,
1.375527, 1.074089, 2.03575, 1, 0, 0.5529412, 1,
1.380126, 0.2489394, 1.037898, 1, 0, 0.5450981, 1,
1.38339, -0.8430008, 1.301882, 1, 0, 0.5411765, 1,
1.386088, 0.06690177, 1.354147, 1, 0, 0.5333334, 1,
1.392829, -1.3332, 2.560228, 1, 0, 0.5294118, 1,
1.396453, -1.343807, 2.894661, 1, 0, 0.5215687, 1,
1.396895, 0.07916559, 1.04296, 1, 0, 0.5176471, 1,
1.411191, -1.07493, 2.350941, 1, 0, 0.509804, 1,
1.418396, -2.368564, 3.583951, 1, 0, 0.5058824, 1,
1.424363, -0.6727946, 0.6202603, 1, 0, 0.4980392, 1,
1.427314, -1.098711, 1.424913, 1, 0, 0.4901961, 1,
1.429697, 0.9714587, 0.7035361, 1, 0, 0.4862745, 1,
1.434248, -1.163728, 3.226791, 1, 0, 0.4784314, 1,
1.435755, -0.4992338, 3.923413, 1, 0, 0.4745098, 1,
1.442265, 0.8495063, 2.097947, 1, 0, 0.4666667, 1,
1.446588, 1.185549, 0.4717528, 1, 0, 0.4627451, 1,
1.460811, -0.6261826, 0.7883914, 1, 0, 0.454902, 1,
1.471871, -0.2307764, 1.537324, 1, 0, 0.4509804, 1,
1.473086, 1.677553, 1.821802, 1, 0, 0.4431373, 1,
1.473311, 0.9820736, 1.097358, 1, 0, 0.4392157, 1,
1.497035, 0.6388301, 3.152566, 1, 0, 0.4313726, 1,
1.498568, -0.6867076, 2.265566, 1, 0, 0.427451, 1,
1.503162, -0.5606083, 3.443314, 1, 0, 0.4196078, 1,
1.505212, -2.134706, 3.255163, 1, 0, 0.4156863, 1,
1.510586, 0.1020441, 0.6678917, 1, 0, 0.4078431, 1,
1.512737, -1.316888, 1.364483, 1, 0, 0.4039216, 1,
1.513644, -1.123571, 1.670439, 1, 0, 0.3960784, 1,
1.515331, -0.5299389, 2.078171, 1, 0, 0.3882353, 1,
1.522823, -1.326371, 2.924428, 1, 0, 0.3843137, 1,
1.526642, 0.3935567, 1.459871, 1, 0, 0.3764706, 1,
1.534419, -1.433818, 4.453937, 1, 0, 0.372549, 1,
1.534807, 0.400012, 0.5314296, 1, 0, 0.3647059, 1,
1.538173, 0.776122, 1.01617, 1, 0, 0.3607843, 1,
1.540594, 0.5507569, -1.501963, 1, 0, 0.3529412, 1,
1.554406, 0.4842384, 1.191064, 1, 0, 0.3490196, 1,
1.563395, 0.3767445, 0.4702485, 1, 0, 0.3411765, 1,
1.584426, 0.6600968, 2.394006, 1, 0, 0.3372549, 1,
1.597076, 0.9346439, 2.193305, 1, 0, 0.3294118, 1,
1.616264, 1.052995, -1.042991, 1, 0, 0.3254902, 1,
1.617746, 0.226022, 1.99525, 1, 0, 0.3176471, 1,
1.620239, -2.582079, 3.69247, 1, 0, 0.3137255, 1,
1.662652, 0.1837056, 1.593087, 1, 0, 0.3058824, 1,
1.673944, 1.087634, 1.868485, 1, 0, 0.2980392, 1,
1.689656, 2.404409, 1.897343, 1, 0, 0.2941177, 1,
1.69629, -1.273253, 1.062727, 1, 0, 0.2862745, 1,
1.712725, -0.9766967, 2.226979, 1, 0, 0.282353, 1,
1.713967, 1.036969, 0.7386674, 1, 0, 0.2745098, 1,
1.743786, -0.2654258, -0.7071003, 1, 0, 0.2705882, 1,
1.756023, 0.9857771, 2.442008, 1, 0, 0.2627451, 1,
1.757088, 1.218879, 0.5810235, 1, 0, 0.2588235, 1,
1.765357, -0.02164736, 1.417993, 1, 0, 0.2509804, 1,
1.766905, -1.127676, 1.574173, 1, 0, 0.2470588, 1,
1.771125, 0.6241313, 1.498863, 1, 0, 0.2392157, 1,
1.793266, -0.3769535, 2.937321, 1, 0, 0.2352941, 1,
1.794305, 0.3789852, 0.9216482, 1, 0, 0.227451, 1,
1.795361, 0.9824839, 1.69407, 1, 0, 0.2235294, 1,
1.806455, -0.1751572, 1.902678, 1, 0, 0.2156863, 1,
1.837237, -0.1705897, 1.767721, 1, 0, 0.2117647, 1,
1.851602, -0.5342633, 1.087678, 1, 0, 0.2039216, 1,
1.857827, -1.44612, 2.842611, 1, 0, 0.1960784, 1,
1.871222, -0.3803256, 3.77526, 1, 0, 0.1921569, 1,
1.927367, -0.5962459, 2.069117, 1, 0, 0.1843137, 1,
1.929919, -0.5863051, 0.3248357, 1, 0, 0.1803922, 1,
1.982176, 2.098605, -0.8589278, 1, 0, 0.172549, 1,
2.00833, -0.2186648, 2.2738, 1, 0, 0.1686275, 1,
2.051642, 0.8330475, 1.711705, 1, 0, 0.1607843, 1,
2.056034, 0.1556163, 2.107, 1, 0, 0.1568628, 1,
2.06551, -0.1031247, 1.091492, 1, 0, 0.1490196, 1,
2.082847, 1.623805, 1.671344, 1, 0, 0.145098, 1,
2.088719, 1.243511, 0.8493993, 1, 0, 0.1372549, 1,
2.117134, -1.786689, 2.743855, 1, 0, 0.1333333, 1,
2.126688, -0.7495248, 1.259349, 1, 0, 0.1254902, 1,
2.129005, -2.503348, 1.790351, 1, 0, 0.1215686, 1,
2.13647, 1.247931, 0.04909735, 1, 0, 0.1137255, 1,
2.162856, -1.573217, 1.962266, 1, 0, 0.1098039, 1,
2.195405, 0.1977306, 0.6549315, 1, 0, 0.1019608, 1,
2.248225, 0.5011268, 1.583177, 1, 0, 0.09411765, 1,
2.282208, -2.517528, 2.422116, 1, 0, 0.09019608, 1,
2.352779, 0.7697588, 0.3023365, 1, 0, 0.08235294, 1,
2.354219, 1.079524, 1.048507, 1, 0, 0.07843138, 1,
2.355543, 1.825764, 0.263314, 1, 0, 0.07058824, 1,
2.450781, -0.5311011, 0.9037492, 1, 0, 0.06666667, 1,
2.455064, 0.243461, 2.049003, 1, 0, 0.05882353, 1,
2.467584, 1.198438, 1.533064, 1, 0, 0.05490196, 1,
2.482663, 1.712143, 1.329945, 1, 0, 0.04705882, 1,
2.530746, -1.953691, 3.329952, 1, 0, 0.04313726, 1,
2.555205, -0.3374726, 0.2988994, 1, 0, 0.03529412, 1,
2.570464, -1.479128, 2.464936, 1, 0, 0.03137255, 1,
2.695437, 2.792183, 2.960679, 1, 0, 0.02352941, 1,
2.758296, -1.625585, 3.054694, 1, 0, 0.01960784, 1,
3.045436, -0.8360073, 2.354836, 1, 0, 0.01176471, 1,
3.742747, -1.212704, 2.177287, 1, 0, 0.007843138, 1
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
0.3017545, -4.034348, -7.482009, 0, -0.5, 0.5, 0.5,
0.3017545, -4.034348, -7.482009, 1, -0.5, 0.5, 0.5,
0.3017545, -4.034348, -7.482009, 1, 1.5, 0.5, 0.5,
0.3017545, -4.034348, -7.482009, 0, 1.5, 0.5, 0.5
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
-4.305734, 0.07435298, -7.482009, 0, -0.5, 0.5, 0.5,
-4.305734, 0.07435298, -7.482009, 1, -0.5, 0.5, 0.5,
-4.305734, 0.07435298, -7.482009, 1, 1.5, 0.5, 0.5,
-4.305734, 0.07435298, -7.482009, 0, 1.5, 0.5, 0.5
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
-4.305734, -4.034348, -0.1157298, 0, -0.5, 0.5, 0.5,
-4.305734, -4.034348, -0.1157298, 1, -0.5, 0.5, 0.5,
-4.305734, -4.034348, -0.1157298, 1, 1.5, 0.5, 0.5,
-4.305734, -4.034348, -0.1157298, 0, 1.5, 0.5, 0.5
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
-3, -3.086186, -5.782099,
3, -3.086186, -5.782099,
-3, -3.086186, -5.782099,
-3, -3.244213, -6.065417,
-2, -3.086186, -5.782099,
-2, -3.244213, -6.065417,
-1, -3.086186, -5.782099,
-1, -3.244213, -6.065417,
0, -3.086186, -5.782099,
0, -3.244213, -6.065417,
1, -3.086186, -5.782099,
1, -3.244213, -6.065417,
2, -3.086186, -5.782099,
2, -3.244213, -6.065417,
3, -3.086186, -5.782099,
3, -3.244213, -6.065417
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
-3, -3.560267, -6.632054, 0, -0.5, 0.5, 0.5,
-3, -3.560267, -6.632054, 1, -0.5, 0.5, 0.5,
-3, -3.560267, -6.632054, 1, 1.5, 0.5, 0.5,
-3, -3.560267, -6.632054, 0, 1.5, 0.5, 0.5,
-2, -3.560267, -6.632054, 0, -0.5, 0.5, 0.5,
-2, -3.560267, -6.632054, 1, -0.5, 0.5, 0.5,
-2, -3.560267, -6.632054, 1, 1.5, 0.5, 0.5,
-2, -3.560267, -6.632054, 0, 1.5, 0.5, 0.5,
-1, -3.560267, -6.632054, 0, -0.5, 0.5, 0.5,
-1, -3.560267, -6.632054, 1, -0.5, 0.5, 0.5,
-1, -3.560267, -6.632054, 1, 1.5, 0.5, 0.5,
-1, -3.560267, -6.632054, 0, 1.5, 0.5, 0.5,
0, -3.560267, -6.632054, 0, -0.5, 0.5, 0.5,
0, -3.560267, -6.632054, 1, -0.5, 0.5, 0.5,
0, -3.560267, -6.632054, 1, 1.5, 0.5, 0.5,
0, -3.560267, -6.632054, 0, 1.5, 0.5, 0.5,
1, -3.560267, -6.632054, 0, -0.5, 0.5, 0.5,
1, -3.560267, -6.632054, 1, -0.5, 0.5, 0.5,
1, -3.560267, -6.632054, 1, 1.5, 0.5, 0.5,
1, -3.560267, -6.632054, 0, 1.5, 0.5, 0.5,
2, -3.560267, -6.632054, 0, -0.5, 0.5, 0.5,
2, -3.560267, -6.632054, 1, -0.5, 0.5, 0.5,
2, -3.560267, -6.632054, 1, 1.5, 0.5, 0.5,
2, -3.560267, -6.632054, 0, 1.5, 0.5, 0.5,
3, -3.560267, -6.632054, 0, -0.5, 0.5, 0.5,
3, -3.560267, -6.632054, 1, -0.5, 0.5, 0.5,
3, -3.560267, -6.632054, 1, 1.5, 0.5, 0.5,
3, -3.560267, -6.632054, 0, 1.5, 0.5, 0.5
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
-3.242467, -2, -5.782099,
-3.242467, 3, -5.782099,
-3.242467, -2, -5.782099,
-3.419678, -2, -6.065417,
-3.242467, -1, -5.782099,
-3.419678, -1, -6.065417,
-3.242467, 0, -5.782099,
-3.419678, 0, -6.065417,
-3.242467, 1, -5.782099,
-3.419678, 1, -6.065417,
-3.242467, 2, -5.782099,
-3.419678, 2, -6.065417,
-3.242467, 3, -5.782099,
-3.419678, 3, -6.065417
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
-3.774101, -2, -6.632054, 0, -0.5, 0.5, 0.5,
-3.774101, -2, -6.632054, 1, -0.5, 0.5, 0.5,
-3.774101, -2, -6.632054, 1, 1.5, 0.5, 0.5,
-3.774101, -2, -6.632054, 0, 1.5, 0.5, 0.5,
-3.774101, -1, -6.632054, 0, -0.5, 0.5, 0.5,
-3.774101, -1, -6.632054, 1, -0.5, 0.5, 0.5,
-3.774101, -1, -6.632054, 1, 1.5, 0.5, 0.5,
-3.774101, -1, -6.632054, 0, 1.5, 0.5, 0.5,
-3.774101, 0, -6.632054, 0, -0.5, 0.5, 0.5,
-3.774101, 0, -6.632054, 1, -0.5, 0.5, 0.5,
-3.774101, 0, -6.632054, 1, 1.5, 0.5, 0.5,
-3.774101, 0, -6.632054, 0, 1.5, 0.5, 0.5,
-3.774101, 1, -6.632054, 0, -0.5, 0.5, 0.5,
-3.774101, 1, -6.632054, 1, -0.5, 0.5, 0.5,
-3.774101, 1, -6.632054, 1, 1.5, 0.5, 0.5,
-3.774101, 1, -6.632054, 0, 1.5, 0.5, 0.5,
-3.774101, 2, -6.632054, 0, -0.5, 0.5, 0.5,
-3.774101, 2, -6.632054, 1, -0.5, 0.5, 0.5,
-3.774101, 2, -6.632054, 1, 1.5, 0.5, 0.5,
-3.774101, 2, -6.632054, 0, 1.5, 0.5, 0.5,
-3.774101, 3, -6.632054, 0, -0.5, 0.5, 0.5,
-3.774101, 3, -6.632054, 1, -0.5, 0.5, 0.5,
-3.774101, 3, -6.632054, 1, 1.5, 0.5, 0.5,
-3.774101, 3, -6.632054, 0, 1.5, 0.5, 0.5
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
-3.242467, -3.086186, -4,
-3.242467, -3.086186, 4,
-3.242467, -3.086186, -4,
-3.419678, -3.244213, -4,
-3.242467, -3.086186, -2,
-3.419678, -3.244213, -2,
-3.242467, -3.086186, 0,
-3.419678, -3.244213, 0,
-3.242467, -3.086186, 2,
-3.419678, -3.244213, 2,
-3.242467, -3.086186, 4,
-3.419678, -3.244213, 4
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
-3.774101, -3.560267, -4, 0, -0.5, 0.5, 0.5,
-3.774101, -3.560267, -4, 1, -0.5, 0.5, 0.5,
-3.774101, -3.560267, -4, 1, 1.5, 0.5, 0.5,
-3.774101, -3.560267, -4, 0, 1.5, 0.5, 0.5,
-3.774101, -3.560267, -2, 0, -0.5, 0.5, 0.5,
-3.774101, -3.560267, -2, 1, -0.5, 0.5, 0.5,
-3.774101, -3.560267, -2, 1, 1.5, 0.5, 0.5,
-3.774101, -3.560267, -2, 0, 1.5, 0.5, 0.5,
-3.774101, -3.560267, 0, 0, -0.5, 0.5, 0.5,
-3.774101, -3.560267, 0, 1, -0.5, 0.5, 0.5,
-3.774101, -3.560267, 0, 1, 1.5, 0.5, 0.5,
-3.774101, -3.560267, 0, 0, 1.5, 0.5, 0.5,
-3.774101, -3.560267, 2, 0, -0.5, 0.5, 0.5,
-3.774101, -3.560267, 2, 1, -0.5, 0.5, 0.5,
-3.774101, -3.560267, 2, 1, 1.5, 0.5, 0.5,
-3.774101, -3.560267, 2, 0, 1.5, 0.5, 0.5,
-3.774101, -3.560267, 4, 0, -0.5, 0.5, 0.5,
-3.774101, -3.560267, 4, 1, -0.5, 0.5, 0.5,
-3.774101, -3.560267, 4, 1, 1.5, 0.5, 0.5,
-3.774101, -3.560267, 4, 0, 1.5, 0.5, 0.5
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
-3.242467, -3.086186, -5.782099,
-3.242467, 3.234892, -5.782099,
-3.242467, -3.086186, 5.550639,
-3.242467, 3.234892, 5.550639,
-3.242467, -3.086186, -5.782099,
-3.242467, -3.086186, 5.550639,
-3.242467, 3.234892, -5.782099,
-3.242467, 3.234892, 5.550639,
-3.242467, -3.086186, -5.782099,
3.845976, -3.086186, -5.782099,
-3.242467, -3.086186, 5.550639,
3.845976, -3.086186, 5.550639,
-3.242467, 3.234892, -5.782099,
3.845976, 3.234892, -5.782099,
-3.242467, 3.234892, 5.550639,
3.845976, 3.234892, 5.550639,
3.845976, -3.086186, -5.782099,
3.845976, 3.234892, -5.782099,
3.845976, -3.086186, 5.550639,
3.845976, 3.234892, 5.550639,
3.845976, -3.086186, -5.782099,
3.845976, -3.086186, 5.550639,
3.845976, 3.234892, -5.782099,
3.845976, 3.234892, 5.550639
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
var radius = 7.895567;
var distance = 35.12827;
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
mvMatrix.translate( -0.3017545, -0.07435298, 0.1157298 );
mvMatrix.scale( 1.204332, 1.350536, 0.7532904 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12827);
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
pyracarbolid<-read.table("pyracarbolid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyracarbolid$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
```

```r
y<-pyracarbolid$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
```

```r
z<-pyracarbolid$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
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
-3.139238, -0.739258, -0.7449229, 0, 0, 1, 1, 1,
-3.120414, 1.365853, -1.529987, 1, 0, 0, 1, 1,
-2.990704, -1.451143, -2.390361, 1, 0, 0, 1, 1,
-2.98748, -0.291857, -1.891732, 1, 0, 0, 1, 1,
-2.958991, 1.790931, -2.704888, 1, 0, 0, 1, 1,
-2.729545, -1.168191, -3.955173, 1, 0, 0, 1, 1,
-2.638586, 0.7699637, -1.213525, 0, 0, 0, 1, 1,
-2.546943, 0.9162046, -2.293032, 0, 0, 0, 1, 1,
-2.516561, 1.038704, -2.118274, 0, 0, 0, 1, 1,
-2.454382, -0.2779378, -1.544646, 0, 0, 0, 1, 1,
-2.409467, 0.6322368, -2.422038, 0, 0, 0, 1, 1,
-2.355125, 0.4478437, -0.7120132, 0, 0, 0, 1, 1,
-2.298023, -0.5941731, -1.128322, 0, 0, 0, 1, 1,
-2.253607, -0.1143136, -1.682833, 1, 1, 1, 1, 1,
-2.209268, -0.3808487, -1.671497, 1, 1, 1, 1, 1,
-2.180597, -0.04290648, -0.6616614, 1, 1, 1, 1, 1,
-2.16123, -0.4902801, -1.286682, 1, 1, 1, 1, 1,
-2.137768, 0.7703988, -1.730226, 1, 1, 1, 1, 1,
-2.136523, 0.9898171, -3.223986, 1, 1, 1, 1, 1,
-2.112216, 0.2856394, -2.573145, 1, 1, 1, 1, 1,
-2.096372, -1.164265, -3.692969, 1, 1, 1, 1, 1,
-2.071332, 0.02864608, -3.722932, 1, 1, 1, 1, 1,
-2.032195, 0.9445187, -1.789649, 1, 1, 1, 1, 1,
-2.018998, 0.5312172, -0.2924409, 1, 1, 1, 1, 1,
-2.014334, -0.9839213, -2.661499, 1, 1, 1, 1, 1,
-2.01284, 1.866216, -1.019469, 1, 1, 1, 1, 1,
-1.980805, -0.1459884, -1.208447, 1, 1, 1, 1, 1,
-1.977202, -0.02605707, -1.291295, 1, 1, 1, 1, 1,
-1.969023, -0.2211981, -1.986535, 0, 0, 1, 1, 1,
-1.935579, 0.3950441, 0.4485996, 1, 0, 0, 1, 1,
-1.929996, -0.6619993, -0.7834024, 1, 0, 0, 1, 1,
-1.926936, 0.01324317, -0.8747576, 1, 0, 0, 1, 1,
-1.909072, 1.09445, -2.313151, 1, 0, 0, 1, 1,
-1.896839, 0.6076795, -1.713931, 1, 0, 0, 1, 1,
-1.865043, -1.302958, -2.209297, 0, 0, 0, 1, 1,
-1.862475, 1.275959, -1.382508, 0, 0, 0, 1, 1,
-1.856513, 0.6531022, -0.4248028, 0, 0, 0, 1, 1,
-1.844143, -0.5372562, -0.9271401, 0, 0, 0, 1, 1,
-1.841235, -0.09963815, -0.5983422, 0, 0, 0, 1, 1,
-1.840319, -1.069543, -1.892421, 0, 0, 0, 1, 1,
-1.801829, -0.02873415, -1.087302, 0, 0, 0, 1, 1,
-1.797719, 0.4164225, -0.6406866, 1, 1, 1, 1, 1,
-1.791398, 0.3696843, -2.423136, 1, 1, 1, 1, 1,
-1.78306, 0.6159878, -2.736167, 1, 1, 1, 1, 1,
-1.773353, -0.1023494, -2.446562, 1, 1, 1, 1, 1,
-1.728224, -0.6457999, -0.9280398, 1, 1, 1, 1, 1,
-1.718852, 1.047193, -0.2382307, 1, 1, 1, 1, 1,
-1.718061, -1.587737, -1.564486, 1, 1, 1, 1, 1,
-1.710137, -1.23076, -1.692269, 1, 1, 1, 1, 1,
-1.707907, 0.6231095, -1.66618, 1, 1, 1, 1, 1,
-1.687232, -0.688772, -1.525304, 1, 1, 1, 1, 1,
-1.649105, 0.3758129, -1.184259, 1, 1, 1, 1, 1,
-1.617426, -0.8085407, -2.195961, 1, 1, 1, 1, 1,
-1.61175, 0.5182038, -1.620464, 1, 1, 1, 1, 1,
-1.599626, -0.8766689, -1.686923, 1, 1, 1, 1, 1,
-1.599542, 0.2308322, -0.2285777, 1, 1, 1, 1, 1,
-1.580848, 0.6512584, -1.1667, 0, 0, 1, 1, 1,
-1.580021, 0.8843967, -0.7563693, 1, 0, 0, 1, 1,
-1.561828, -1.23934, -2.664781, 1, 0, 0, 1, 1,
-1.56171, 0.6546947, -0.3171908, 1, 0, 0, 1, 1,
-1.559836, 1.152896, -2.430519, 1, 0, 0, 1, 1,
-1.5125, 0.5262367, 1.441702, 1, 0, 0, 1, 1,
-1.511757, 1.583433, -3.338672, 0, 0, 0, 1, 1,
-1.501914, 1.045445, -1.11555, 0, 0, 0, 1, 1,
-1.495973, 0.05164712, -1.53697, 0, 0, 0, 1, 1,
-1.48711, 0.6397032, -1.188574, 0, 0, 0, 1, 1,
-1.48408, -0.3340189, -3.392784, 0, 0, 0, 1, 1,
-1.477197, 0.726526, 0.3472776, 0, 0, 0, 1, 1,
-1.473447, -1.425944, -0.4563656, 0, 0, 0, 1, 1,
-1.459516, 0.08605139, -1.469698, 1, 1, 1, 1, 1,
-1.459394, 1.810725, 0.05881114, 1, 1, 1, 1, 1,
-1.45769, -0.2285752, -1.241114, 1, 1, 1, 1, 1,
-1.452555, 0.119922, -2.403613, 1, 1, 1, 1, 1,
-1.444007, -0.4208012, -2.431273, 1, 1, 1, 1, 1,
-1.443995, -0.4990959, -2.854138, 1, 1, 1, 1, 1,
-1.429317, -2.339625, -3.130478, 1, 1, 1, 1, 1,
-1.415138, 1.028074, -1.829312, 1, 1, 1, 1, 1,
-1.410629, -1.224711, -2.369846, 1, 1, 1, 1, 1,
-1.407928, -0.8739038, -1.392116, 1, 1, 1, 1, 1,
-1.395451, 1.093529, -0.9040276, 1, 1, 1, 1, 1,
-1.394653, -0.2024972, -1.153508, 1, 1, 1, 1, 1,
-1.386352, -0.1730446, -0.7700754, 1, 1, 1, 1, 1,
-1.365378, -1.166464, -1.368995, 1, 1, 1, 1, 1,
-1.363008, 0.1336055, -1.878988, 1, 1, 1, 1, 1,
-1.362199, -1.54896, -2.634878, 0, 0, 1, 1, 1,
-1.351779, -0.2749359, -1.362007, 1, 0, 0, 1, 1,
-1.346805, 0.6629295, -0.6781369, 1, 0, 0, 1, 1,
-1.345039, -0.01342082, -0.161833, 1, 0, 0, 1, 1,
-1.339122, 0.04303576, -1.414673, 1, 0, 0, 1, 1,
-1.337873, 0.8991243, -2.280777, 1, 0, 0, 1, 1,
-1.320634, -0.3124773, -1.396446, 0, 0, 0, 1, 1,
-1.307724, -0.3180358, -2.484348, 0, 0, 0, 1, 1,
-1.301444, -0.1243294, -1.785084, 0, 0, 0, 1, 1,
-1.299476, -0.4244723, -3.265975, 0, 0, 0, 1, 1,
-1.296053, 0.3997637, -2.898767, 0, 0, 0, 1, 1,
-1.285611, -1.326115, -3.552556, 0, 0, 0, 1, 1,
-1.285315, -0.3631784, -3.514857, 0, 0, 0, 1, 1,
-1.284602, 0.772741, -1.763775, 1, 1, 1, 1, 1,
-1.283054, -1.342087, -2.173209, 1, 1, 1, 1, 1,
-1.271574, 0.2646767, -3.513649, 1, 1, 1, 1, 1,
-1.266644, -0.08281346, -2.320513, 1, 1, 1, 1, 1,
-1.262364, 0.3403115, -0.9620668, 1, 1, 1, 1, 1,
-1.257863, -0.774134, -4.392509, 1, 1, 1, 1, 1,
-1.249473, 0.872323, -0.8309997, 1, 1, 1, 1, 1,
-1.243042, 0.6484379, -1.104566, 1, 1, 1, 1, 1,
-1.228736, -0.7153333, -2.951492, 1, 1, 1, 1, 1,
-1.224831, 2.04595, -1.431181, 1, 1, 1, 1, 1,
-1.224781, 0.6701496, -1.818797, 1, 1, 1, 1, 1,
-1.220941, 0.08460771, -1.659987, 1, 1, 1, 1, 1,
-1.217422, -0.6399193, -1.446862, 1, 1, 1, 1, 1,
-1.214863, 0.8343833, -0.3483561, 1, 1, 1, 1, 1,
-1.204094, 1.507182, -0.1157725, 1, 1, 1, 1, 1,
-1.201458, 2.316635, -3.191817, 0, 0, 1, 1, 1,
-1.196655, -0.2351134, -2.245973, 1, 0, 0, 1, 1,
-1.188719, -0.3040222, -4.33997, 1, 0, 0, 1, 1,
-1.176973, 0.0173284, -1.226762, 1, 0, 0, 1, 1,
-1.172971, -0.3263128, -2.624838, 1, 0, 0, 1, 1,
-1.167008, 0.3665897, -2.440742, 1, 0, 0, 1, 1,
-1.153865, -0.7272425, -3.784298, 0, 0, 0, 1, 1,
-1.152435, 0.9380376, -0.06001201, 0, 0, 0, 1, 1,
-1.148886, 1.040839, -0.186719, 0, 0, 0, 1, 1,
-1.143395, -0.08517466, 0.3870296, 0, 0, 0, 1, 1,
-1.136011, 1.066287, 0.09923994, 0, 0, 0, 1, 1,
-1.13227, -0.8566719, -2.413191, 0, 0, 0, 1, 1,
-1.131952, -0.8288279, -2.262468, 0, 0, 0, 1, 1,
-1.131436, -0.2752004, -2.429862, 1, 1, 1, 1, 1,
-1.128377, 1.013754, 0.1011055, 1, 1, 1, 1, 1,
-1.123099, 2.459624, -0.4792371, 1, 1, 1, 1, 1,
-1.121623, -1.733078, -2.139226, 1, 1, 1, 1, 1,
-1.115646, -1.055437, -2.271241, 1, 1, 1, 1, 1,
-1.104201, -1.130363, -2.385744, 1, 1, 1, 1, 1,
-1.102912, 0.9999263, -1.63848, 1, 1, 1, 1, 1,
-1.078455, 1.944462, -0.4222399, 1, 1, 1, 1, 1,
-1.074252, -0.391111, -0.318117, 1, 1, 1, 1, 1,
-1.07391, -1.091442, -1.821408, 1, 1, 1, 1, 1,
-1.071102, 0.8178589, -0.4148954, 1, 1, 1, 1, 1,
-1.068112, -0.8781742, -2.055003, 1, 1, 1, 1, 1,
-1.063455, 0.9839443, -2.377943, 1, 1, 1, 1, 1,
-1.062419, 0.1202081, -3.228044, 1, 1, 1, 1, 1,
-1.056958, 1.135505, -1.369799, 1, 1, 1, 1, 1,
-1.053308, 0.1723799, 0.07360015, 0, 0, 1, 1, 1,
-1.05271, 0.1607566, -2.421409, 1, 0, 0, 1, 1,
-1.038071, 0.3108349, -1.00674, 1, 0, 0, 1, 1,
-1.037567, 0.5960329, 0.2329623, 1, 0, 0, 1, 1,
-1.034271, -1.498026, -2.675279, 1, 0, 0, 1, 1,
-1.029044, -1.964509, -3.44816, 1, 0, 0, 1, 1,
-1.02282, 1.411237, -0.1536463, 0, 0, 0, 1, 1,
-1.01729, -0.1102447, -3.172026, 0, 0, 0, 1, 1,
-1.013292, -1.382721, -1.634048, 0, 0, 0, 1, 1,
-1.006982, 0.8891001, 1.156119, 0, 0, 0, 1, 1,
-0.9995822, 0.08371179, -1.167821, 0, 0, 0, 1, 1,
-0.9886272, 0.9125398, -0.9613594, 0, 0, 0, 1, 1,
-0.9867566, 0.8354974, 0.006743191, 0, 0, 0, 1, 1,
-0.9825388, -0.1970748, -2.263657, 1, 1, 1, 1, 1,
-0.9822471, 0.9468345, -1.180802, 1, 1, 1, 1, 1,
-0.9778005, 0.6864403, 0.9340334, 1, 1, 1, 1, 1,
-0.9777036, -1.202313, -2.591018, 1, 1, 1, 1, 1,
-0.9744169, -0.9588479, -3.699889, 1, 1, 1, 1, 1,
-0.9694149, -0.06999907, -0.06173564, 1, 1, 1, 1, 1,
-0.9611686, 0.6388067, -1.393662, 1, 1, 1, 1, 1,
-0.9607489, 0.5393151, -1.605535, 1, 1, 1, 1, 1,
-0.9606834, 0.6847842, 0.1268357, 1, 1, 1, 1, 1,
-0.9535473, 1.712079, 1.443596, 1, 1, 1, 1, 1,
-0.9528657, 1.39718, -2.113357, 1, 1, 1, 1, 1,
-0.952665, 0.2063552, 0.2119638, 1, 1, 1, 1, 1,
-0.9512106, 1.293944, -1.275838, 1, 1, 1, 1, 1,
-0.9457942, 0.4291767, 0.6112957, 1, 1, 1, 1, 1,
-0.9411138, -0.4157339, -3.009382, 1, 1, 1, 1, 1,
-0.9396043, 0.6497758, -2.067739, 0, 0, 1, 1, 1,
-0.9359174, 0.08478755, 0.1161406, 1, 0, 0, 1, 1,
-0.9353131, 0.4765489, -0.4665171, 1, 0, 0, 1, 1,
-0.9328617, -0.07879802, -2.081417, 1, 0, 0, 1, 1,
-0.9307777, 1.201702, 0.1136448, 1, 0, 0, 1, 1,
-0.929472, 1.151924, -1.015872, 1, 0, 0, 1, 1,
-0.9254375, -0.06232703, -1.918331, 0, 0, 0, 1, 1,
-0.9168876, -1.21855, -2.019635, 0, 0, 0, 1, 1,
-0.9150665, 0.01400418, -1.550916, 0, 0, 0, 1, 1,
-0.9150196, -1.009492, -1.403648, 0, 0, 0, 1, 1,
-0.9140121, 0.2633607, -1.239061, 0, 0, 0, 1, 1,
-0.9137759, 1.417718, -0.476556, 0, 0, 0, 1, 1,
-0.9127522, 0.1247248, -1.475833, 0, 0, 0, 1, 1,
-0.9123275, -0.9437213, -3.314624, 1, 1, 1, 1, 1,
-0.9058287, 0.2665304, -2.344333, 1, 1, 1, 1, 1,
-0.903545, 0.8152145, -0.6869925, 1, 1, 1, 1, 1,
-0.9007462, 0.5012197, -0.4608363, 1, 1, 1, 1, 1,
-0.9004877, 0.7448499, -0.1469977, 1, 1, 1, 1, 1,
-0.8951191, -0.5975726, -2.739303, 1, 1, 1, 1, 1,
-0.8933557, 0.1573778, -0.3919327, 1, 1, 1, 1, 1,
-0.8862185, -0.6129898, -2.008909, 1, 1, 1, 1, 1,
-0.8843019, 1.027296, -1.564378, 1, 1, 1, 1, 1,
-0.8835321, 0.3655896, -2.061666, 1, 1, 1, 1, 1,
-0.8813946, 0.4389157, -1.112973, 1, 1, 1, 1, 1,
-0.8786146, -1.615535, -2.682871, 1, 1, 1, 1, 1,
-0.8781675, 1.556911, 0.7754647, 1, 1, 1, 1, 1,
-0.8766711, -0.9551179, -3.099369, 1, 1, 1, 1, 1,
-0.875825, 2.380062, -1.877673, 1, 1, 1, 1, 1,
-0.8753127, -0.1170024, -0.7302618, 0, 0, 1, 1, 1,
-0.8745381, -1.418316, -3.239215, 1, 0, 0, 1, 1,
-0.8730224, 1.297388, -0.1672048, 1, 0, 0, 1, 1,
-0.8721396, 0.1693053, -0.717819, 1, 0, 0, 1, 1,
-0.865244, 0.2414131, -2.708103, 1, 0, 0, 1, 1,
-0.8632106, 0.7998244, -0.4030949, 1, 0, 0, 1, 1,
-0.8611889, 0.6867601, -0.3220393, 0, 0, 0, 1, 1,
-0.860381, -0.6213235, -1.284278, 0, 0, 0, 1, 1,
-0.859055, -0.1364698, -2.428509, 0, 0, 0, 1, 1,
-0.8588979, 1.627864, -1.485437, 0, 0, 0, 1, 1,
-0.8576106, 1.109938, -1.044948, 0, 0, 0, 1, 1,
-0.8467045, 0.3233824, -1.709567, 0, 0, 0, 1, 1,
-0.8430623, 0.5948895, -1.285478, 0, 0, 0, 1, 1,
-0.8415002, 0.2313436, 1.389942, 1, 1, 1, 1, 1,
-0.8333765, 2.10464, -0.3501078, 1, 1, 1, 1, 1,
-0.8313763, 0.6098081, -2.348665, 1, 1, 1, 1, 1,
-0.8254002, -0.3930062, -1.901445, 1, 1, 1, 1, 1,
-0.8247165, 1.053053, -2.102371, 1, 1, 1, 1, 1,
-0.8242096, -0.6275922, -2.539848, 1, 1, 1, 1, 1,
-0.7986727, -0.7241685, -1.118748, 1, 1, 1, 1, 1,
-0.7921442, -0.01266675, -1.309097, 1, 1, 1, 1, 1,
-0.7844857, 0.4950033, -2.517524, 1, 1, 1, 1, 1,
-0.7840552, -0.8623716, -2.652034, 1, 1, 1, 1, 1,
-0.783244, -0.7803103, -2.033731, 1, 1, 1, 1, 1,
-0.7760621, 0.06282362, -1.68553, 1, 1, 1, 1, 1,
-0.7757415, 0.7509238, -2.028662, 1, 1, 1, 1, 1,
-0.7737309, -0.7925741, -2.211631, 1, 1, 1, 1, 1,
-0.7726902, 0.3637337, 0.5270858, 1, 1, 1, 1, 1,
-0.7680984, -0.5266901, -2.801774, 0, 0, 1, 1, 1,
-0.7674081, -1.762833, -2.423733, 1, 0, 0, 1, 1,
-0.765195, 2.245414, -2.435022, 1, 0, 0, 1, 1,
-0.7638164, -0.8250706, -3.726135, 1, 0, 0, 1, 1,
-0.7616999, 1.010762, 0.8267732, 1, 0, 0, 1, 1,
-0.7613652, 0.8383145, 2.509513, 1, 0, 0, 1, 1,
-0.7602694, 1.601103, -0.1951006, 0, 0, 0, 1, 1,
-0.7592046, -0.1314247, -2.428346, 0, 0, 0, 1, 1,
-0.7555309, -2.466776, -3.519072, 0, 0, 0, 1, 1,
-0.7521563, -2.267862, -2.44703, 0, 0, 0, 1, 1,
-0.7507903, 0.113597, -1.160492, 0, 0, 0, 1, 1,
-0.747911, 1.249815, 0.1581451, 0, 0, 0, 1, 1,
-0.7461966, -1.381651, -2.255704, 0, 0, 0, 1, 1,
-0.7386845, -0.3559899, -2.596851, 1, 1, 1, 1, 1,
-0.7364367, 1.396778, -1.056763, 1, 1, 1, 1, 1,
-0.7345075, -0.2294644, -1.249495, 1, 1, 1, 1, 1,
-0.7337118, -0.0205937, -0.8722374, 1, 1, 1, 1, 1,
-0.7317568, -0.3298692, -4.287694, 1, 1, 1, 1, 1,
-0.7204822, -2.114166, -3.207705, 1, 1, 1, 1, 1,
-0.7193009, -0.1404294, -0.3469786, 1, 1, 1, 1, 1,
-0.7161415, -1.127575, -3.743422, 1, 1, 1, 1, 1,
-0.7138175, -0.6541093, -2.27035, 1, 1, 1, 1, 1,
-0.7135876, 1.043633, -1.959713, 1, 1, 1, 1, 1,
-0.7120327, 0.05594128, -4.200602, 1, 1, 1, 1, 1,
-0.7065375, -0.8950666, -2.470253, 1, 1, 1, 1, 1,
-0.7020442, -1.640005, -2.580939, 1, 1, 1, 1, 1,
-0.700582, 1.887236, -1.044249, 1, 1, 1, 1, 1,
-0.6889735, -0.8143798, -1.518951, 1, 1, 1, 1, 1,
-0.6887071, -0.6363091, -3.986032, 0, 0, 1, 1, 1,
-0.6860179, 0.4100829, -0.8387058, 1, 0, 0, 1, 1,
-0.6781613, -0.2013056, -1.309806, 1, 0, 0, 1, 1,
-0.663299, -0.04114041, -3.082916, 1, 0, 0, 1, 1,
-0.6618364, -0.7478992, -1.0466, 1, 0, 0, 1, 1,
-0.660029, -1.340155, -2.413392, 1, 0, 0, 1, 1,
-0.6597868, -0.7055586, -1.406485, 0, 0, 0, 1, 1,
-0.6574252, 0.7984053, 1.162414, 0, 0, 0, 1, 1,
-0.6427496, -0.472531, -1.845318, 0, 0, 0, 1, 1,
-0.6369333, -0.7313064, -2.492228, 0, 0, 0, 1, 1,
-0.6358528, -0.007257209, -1.58721, 0, 0, 0, 1, 1,
-0.6329699, 0.2990208, -1.404283, 0, 0, 0, 1, 1,
-0.6326483, 0.8313782, 0.4838992, 0, 0, 0, 1, 1,
-0.6313025, -1.34344, -1.625048, 1, 1, 1, 1, 1,
-0.6284412, 0.9689959, 0.2122845, 1, 1, 1, 1, 1,
-0.6272906, 1.857909, -0.566479, 1, 1, 1, 1, 1,
-0.6270097, 1.172481, 0.2858017, 1, 1, 1, 1, 1,
-0.6254101, 0.07492689, -0.3183491, 1, 1, 1, 1, 1,
-0.6213424, -0.3795814, -2.023306, 1, 1, 1, 1, 1,
-0.6203197, 0.02666561, -1.669542, 1, 1, 1, 1, 1,
-0.6184797, 2.648391, 0.5075979, 1, 1, 1, 1, 1,
-0.6146512, -0.02483657, -2.947931, 1, 1, 1, 1, 1,
-0.613517, 0.4871477, 0.03071528, 1, 1, 1, 1, 1,
-0.6114255, 0.01649585, -3.096686, 1, 1, 1, 1, 1,
-0.6107447, 1.134765, -0.2045497, 1, 1, 1, 1, 1,
-0.6100186, -1.562452, -4.304413, 1, 1, 1, 1, 1,
-0.6099038, 1.500038, 0.1681642, 1, 1, 1, 1, 1,
-0.5958435, 0.4877197, -0.8340389, 1, 1, 1, 1, 1,
-0.5825174, 0.2113678, -0.2846158, 0, 0, 1, 1, 1,
-0.5818079, -1.007522, -3.468459, 1, 0, 0, 1, 1,
-0.5802996, -0.5003077, -1.249547, 1, 0, 0, 1, 1,
-0.579317, 0.9261225, -1.432268, 1, 0, 0, 1, 1,
-0.5791156, 1.398416, 0.6484691, 1, 0, 0, 1, 1,
-0.578598, -0.755211, -1.85078, 1, 0, 0, 1, 1,
-0.574872, 0.08127011, -0.03760628, 0, 0, 0, 1, 1,
-0.5746467, -0.751312, -3.401795, 0, 0, 0, 1, 1,
-0.568546, -0.2376913, -1.856927, 0, 0, 0, 1, 1,
-0.5680072, 1.205374, -0.7146773, 0, 0, 0, 1, 1,
-0.5664091, -1.574493, -2.845895, 0, 0, 0, 1, 1,
-0.5644499, 1.908727, -0.07653193, 0, 0, 0, 1, 1,
-0.5592543, -0.3871321, -2.535199, 0, 0, 0, 1, 1,
-0.5545723, 0.5491875, -1.568597, 1, 1, 1, 1, 1,
-0.542933, 0.03810733, -1.420213, 1, 1, 1, 1, 1,
-0.5384132, -0.7630845, -1.333568, 1, 1, 1, 1, 1,
-0.5375501, -2.946696, -4.684798, 1, 1, 1, 1, 1,
-0.5339507, -0.7714181, -2.86395, 1, 1, 1, 1, 1,
-0.5267056, 0.5291104, -2.498646, 1, 1, 1, 1, 1,
-0.5215786, -0.9337717, -2.9983, 1, 1, 1, 1, 1,
-0.5213266, -0.8501974, -3.524417, 1, 1, 1, 1, 1,
-0.5145204, -0.2791187, -3.135084, 1, 1, 1, 1, 1,
-0.5143906, -0.6078138, -1.886053, 1, 1, 1, 1, 1,
-0.514219, -0.3929866, -3.130036, 1, 1, 1, 1, 1,
-0.4948188, 0.9420974, -1.90482, 1, 1, 1, 1, 1,
-0.4946203, -1.541045, -2.712767, 1, 1, 1, 1, 1,
-0.4907075, 0.9956191, -2.295558, 1, 1, 1, 1, 1,
-0.4891516, 0.8661823, -2.626868, 1, 1, 1, 1, 1,
-0.4848933, -0.1923059, -0.3407547, 0, 0, 1, 1, 1,
-0.4740031, -0.5588289, -3.242314, 1, 0, 0, 1, 1,
-0.4657755, 0.3774308, -0.692737, 1, 0, 0, 1, 1,
-0.4611717, -0.175097, -1.703007, 1, 0, 0, 1, 1,
-0.4591025, 0.308774, 0.3697304, 1, 0, 0, 1, 1,
-0.4583702, -2.994131, -2.860236, 1, 0, 0, 1, 1,
-0.4558039, -0.3873976, -1.025791, 0, 0, 0, 1, 1,
-0.4459412, 1.001468, -0.2037078, 0, 0, 0, 1, 1,
-0.4350239, -0.488167, -2.730044, 0, 0, 0, 1, 1,
-0.4278391, -0.08185858, -3.313136, 0, 0, 0, 1, 1,
-0.4275667, 2.679031, -0.1134325, 0, 0, 0, 1, 1,
-0.426623, -0.4896433, -1.713755, 0, 0, 0, 1, 1,
-0.4218051, 0.9366566, 0.6846454, 0, 0, 0, 1, 1,
-0.4016168, -1.213454, -3.958776, 1, 1, 1, 1, 1,
-0.3993313, -0.4149658, -2.922293, 1, 1, 1, 1, 1,
-0.3987608, -0.8649656, -0.9825473, 1, 1, 1, 1, 1,
-0.3940527, -0.1823122, -2.282568, 1, 1, 1, 1, 1,
-0.3931298, 1.131257, 1.271826, 1, 1, 1, 1, 1,
-0.390255, -1.87461, -4.073991, 1, 1, 1, 1, 1,
-0.3852546, -0.7434608, -3.19821, 1, 1, 1, 1, 1,
-0.3844845, -1.478403, -3.194752, 1, 1, 1, 1, 1,
-0.3819962, 0.007285499, -2.223843, 1, 1, 1, 1, 1,
-0.3790363, -0.6664881, -3.425732, 1, 1, 1, 1, 1,
-0.3758693, -0.226658, -1.859244, 1, 1, 1, 1, 1,
-0.3753732, -0.8816783, -1.120042, 1, 1, 1, 1, 1,
-0.3582143, 0.4959395, -0.8117254, 1, 1, 1, 1, 1,
-0.3571409, 0.6597143, 0.9304206, 1, 1, 1, 1, 1,
-0.3566, 0.9317909, -1.653776, 1, 1, 1, 1, 1,
-0.3515929, -0.6484662, -1.798201, 0, 0, 1, 1, 1,
-0.3479734, 0.4095941, -1.550905, 1, 0, 0, 1, 1,
-0.3372986, -0.530934, -1.485359, 1, 0, 0, 1, 1,
-0.326324, -2.798913, -3.694602, 1, 0, 0, 1, 1,
-0.3177783, 0.769413, 0.3918552, 1, 0, 0, 1, 1,
-0.3167676, -0.2023652, -3.096742, 1, 0, 0, 1, 1,
-0.3118233, -0.4480289, -2.297493, 0, 0, 0, 1, 1,
-0.3094522, 0.6442198, -0.7976907, 0, 0, 0, 1, 1,
-0.2998472, -0.8963575, -2.261619, 0, 0, 0, 1, 1,
-0.2966021, 0.752576, -0.965182, 0, 0, 0, 1, 1,
-0.2847515, -0.4129136, -3.665137, 0, 0, 0, 1, 1,
-0.2783194, -0.8592389, -1.272316, 0, 0, 0, 1, 1,
-0.2775474, 0.7189377, 0.8906608, 0, 0, 0, 1, 1,
-0.2756055, 1.285738, -0.1131073, 1, 1, 1, 1, 1,
-0.2715645, -0.676814, -1.348803, 1, 1, 1, 1, 1,
-0.2708805, -0.6656303, -5.617059, 1, 1, 1, 1, 1,
-0.2643347, -1.64713, -2.367418, 1, 1, 1, 1, 1,
-0.2626693, -0.273447, -1.688634, 1, 1, 1, 1, 1,
-0.2577773, 0.6920236, 1.234825, 1, 1, 1, 1, 1,
-0.2574098, 0.03223386, -2.832227, 1, 1, 1, 1, 1,
-0.2564576, -0.3786167, -2.560462, 1, 1, 1, 1, 1,
-0.2552596, 0.7252403, -0.7824595, 1, 1, 1, 1, 1,
-0.2535603, -0.6078444, -3.309176, 1, 1, 1, 1, 1,
-0.2522052, 0.06545048, -1.015166, 1, 1, 1, 1, 1,
-0.250328, -1.159969, -2.793723, 1, 1, 1, 1, 1,
-0.2497551, -0.1225702, -2.065207, 1, 1, 1, 1, 1,
-0.2448307, 1.522663, -0.9893345, 1, 1, 1, 1, 1,
-0.2427453, -0.2696307, -3.773599, 1, 1, 1, 1, 1,
-0.2423532, 0.08463559, -3.488219, 0, 0, 1, 1, 1,
-0.2365467, 1.017723, 0.03101156, 1, 0, 0, 1, 1,
-0.2354833, 1.635576, -1.143834, 1, 0, 0, 1, 1,
-0.2335313, 0.1819165, -0.1952046, 1, 0, 0, 1, 1,
-0.2322764, 0.0746235, 0.3895751, 1, 0, 0, 1, 1,
-0.2312451, -1.409164, -1.892792, 1, 0, 0, 1, 1,
-0.2312125, -0.1473346, -1.451852, 0, 0, 0, 1, 1,
-0.2290005, 0.7795725, -0.6330342, 0, 0, 0, 1, 1,
-0.2281735, -1.939645, -2.137331, 0, 0, 0, 1, 1,
-0.226323, -0.6719741, -3.180013, 0, 0, 0, 1, 1,
-0.2261785, -0.1737084, -1.64675, 0, 0, 0, 1, 1,
-0.2251809, -0.5616989, -4.74194, 0, 0, 0, 1, 1,
-0.2249111, -2.653407, -3.796354, 0, 0, 0, 1, 1,
-0.2247983, -0.2237527, -2.837419, 1, 1, 1, 1, 1,
-0.2234752, 0.4905353, -0.5319805, 1, 1, 1, 1, 1,
-0.2214578, 0.5813138, -1.497989, 1, 1, 1, 1, 1,
-0.2169773, -1.55461, -2.793563, 1, 1, 1, 1, 1,
-0.2146298, -0.07452179, -2.567767, 1, 1, 1, 1, 1,
-0.2144493, -0.7176268, -3.872798, 1, 1, 1, 1, 1,
-0.2134122, 0.8517466, -0.1588566, 1, 1, 1, 1, 1,
-0.2107569, 1.405808, -0.209798, 1, 1, 1, 1, 1,
-0.2011855, -1.753236, -3.342906, 1, 1, 1, 1, 1,
-0.1976525, 1.476033, -1.029932, 1, 1, 1, 1, 1,
-0.1974504, 0.3387813, -1.509359, 1, 1, 1, 1, 1,
-0.1958129, 0.189761, -1.083445, 1, 1, 1, 1, 1,
-0.1949062, -0.8375229, -1.17923, 1, 1, 1, 1, 1,
-0.1928489, -0.2052789, -2.319106, 1, 1, 1, 1, 1,
-0.1912654, -0.2022849, -4.338892, 1, 1, 1, 1, 1,
-0.1896921, 1.876421, 1.369682, 0, 0, 1, 1, 1,
-0.1865666, 0.8371661, -0.7643267, 1, 0, 0, 1, 1,
-0.1863879, -0.9990371, -2.603935, 1, 0, 0, 1, 1,
-0.1836977, 1.217327, -0.8680298, 1, 0, 0, 1, 1,
-0.1803993, 2.46496, 0.9761519, 1, 0, 0, 1, 1,
-0.1792187, -0.2577895, -1.395561, 1, 0, 0, 1, 1,
-0.1782361, 0.6744806, -1.155006, 0, 0, 0, 1, 1,
-0.1758901, 0.1432488, -1.637078, 0, 0, 0, 1, 1,
-0.1758605, -0.5684841, -4.515419, 0, 0, 0, 1, 1,
-0.1757294, 0.2347132, -0.2929085, 0, 0, 0, 1, 1,
-0.171262, -1.120924, -1.799413, 0, 0, 0, 1, 1,
-0.1712405, 0.5123636, -2.774821, 0, 0, 0, 1, 1,
-0.1672648, 1.26684, 1.743342, 0, 0, 0, 1, 1,
-0.1654854, 0.08841974, -0.6410903, 1, 1, 1, 1, 1,
-0.1649386, -0.04225408, -0.7474572, 1, 1, 1, 1, 1,
-0.1647684, 0.3250796, 0.06993698, 1, 1, 1, 1, 1,
-0.1641329, 0.7381628, 0.6386029, 1, 1, 1, 1, 1,
-0.1621111, -0.01385245, -2.859135, 1, 1, 1, 1, 1,
-0.1604286, -0.691492, -1.765172, 1, 1, 1, 1, 1,
-0.158638, -0.02578676, -1.58624, 1, 1, 1, 1, 1,
-0.1575505, -2.400977, -3.563766, 1, 1, 1, 1, 1,
-0.1514797, -0.3151306, -3.079722, 1, 1, 1, 1, 1,
-0.1499579, -0.6559885, -4.38028, 1, 1, 1, 1, 1,
-0.1493905, -0.3579639, -3.461675, 1, 1, 1, 1, 1,
-0.1483808, 0.2317441, -0.9075641, 1, 1, 1, 1, 1,
-0.1472366, -0.2683302, -3.866495, 1, 1, 1, 1, 1,
-0.14373, -1.350338, -1.566759, 1, 1, 1, 1, 1,
-0.1385476, -0.7541076, -5.021665, 1, 1, 1, 1, 1,
-0.1368186, 0.5805259, -1.333513, 0, 0, 1, 1, 1,
-0.1354528, -0.3528635, -2.324817, 1, 0, 0, 1, 1,
-0.1339244, 0.5547919, -1.176109, 1, 0, 0, 1, 1,
-0.1307651, 0.9918253, -0.6658404, 1, 0, 0, 1, 1,
-0.1301541, -0.1614606, -1.404178, 1, 0, 0, 1, 1,
-0.1296521, 0.353626, -0.2866702, 1, 0, 0, 1, 1,
-0.128073, 0.7656556, 0.5533353, 0, 0, 0, 1, 1,
-0.1153636, -1.36068, -4.875058, 0, 0, 0, 1, 1,
-0.1114535, -0.7502483, -3.969974, 0, 0, 0, 1, 1,
-0.1045995, 0.2009047, -0.7000235, 0, 0, 0, 1, 1,
-0.1037252, -0.3766081, -3.404306, 0, 0, 0, 1, 1,
-0.103097, -0.5882766, -3.947411, 0, 0, 0, 1, 1,
-0.09188753, -0.917128, -4.761908, 0, 0, 0, 1, 1,
-0.0888195, -0.3391823, -1.335698, 1, 1, 1, 1, 1,
-0.08755039, -2.136123, -3.177566, 1, 1, 1, 1, 1,
-0.08659547, -1.408339, -3.29312, 1, 1, 1, 1, 1,
-0.08638592, 0.392263, -0.1550575, 1, 1, 1, 1, 1,
-0.08603559, -0.7064074, -1.020635, 1, 1, 1, 1, 1,
-0.08231913, -1.415703, -2.849091, 1, 1, 1, 1, 1,
-0.0801995, -0.07001267, -2.780178, 1, 1, 1, 1, 1,
-0.08015496, -0.2198466, -3.994314, 1, 1, 1, 1, 1,
-0.07867673, -0.7167868, -1.243194, 1, 1, 1, 1, 1,
-0.07257642, 0.7199485, -0.08403122, 1, 1, 1, 1, 1,
-0.07131935, -1.667009, -3.18529, 1, 1, 1, 1, 1,
-0.06900717, -1.165844, -2.693231, 1, 1, 1, 1, 1,
-0.0680457, -0.8131326, -3.765316, 1, 1, 1, 1, 1,
-0.06692419, -1.204828, -1.74035, 1, 1, 1, 1, 1,
-0.06376439, -0.4713266, -4.526382, 1, 1, 1, 1, 1,
-0.05963183, 0.7223745, 0.4526548, 0, 0, 1, 1, 1,
-0.05550164, 0.2508084, 1.04943, 1, 0, 0, 1, 1,
-0.05442571, -1.52631, -1.71737, 1, 0, 0, 1, 1,
-0.05274453, 0.7139734, 0.3715293, 1, 0, 0, 1, 1,
-0.05226877, 2.01107, 0.3823636, 1, 0, 0, 1, 1,
-0.04685782, -0.6973711, -4.213359, 1, 0, 0, 1, 1,
-0.04649435, 0.8385381, -1.481878, 0, 0, 0, 1, 1,
-0.04560616, 0.9227841, -0.9113746, 0, 0, 0, 1, 1,
-0.04513353, -0.1368218, -3.010891, 0, 0, 0, 1, 1,
-0.04423428, -0.2884066, -0.7854318, 0, 0, 0, 1, 1,
-0.04290393, -0.03270347, -2.597903, 0, 0, 0, 1, 1,
-0.04206461, 0.5740504, -1.675414, 0, 0, 0, 1, 1,
-0.04171022, -0.7564258, -2.575414, 0, 0, 0, 1, 1,
-0.04158884, -1.208899, -3.15511, 1, 1, 1, 1, 1,
-0.04057416, -0.7178608, -3.762314, 1, 1, 1, 1, 1,
-0.03859429, -0.5367035, -3.342008, 1, 1, 1, 1, 1,
-0.03652598, 1.199021, -0.6842131, 1, 1, 1, 1, 1,
-0.02657048, 0.09356815, -1.633632, 1, 1, 1, 1, 1,
-0.02312034, 0.9311345, -2.290992, 1, 1, 1, 1, 1,
-0.01755774, -0.293425, -4.53294, 1, 1, 1, 1, 1,
-0.0164997, 0.2204856, 1.183081, 1, 1, 1, 1, 1,
-0.01462354, 0.8648072, -1.962146, 1, 1, 1, 1, 1,
-0.01385061, 1.312346, -0.6449837, 1, 1, 1, 1, 1,
-0.01153237, -0.1693905, -4.484561, 1, 1, 1, 1, 1,
-0.01149911, -0.7282964, -3.093697, 1, 1, 1, 1, 1,
-0.01019513, -0.2173687, -4.338719, 1, 1, 1, 1, 1,
-0.007774989, 0.4063778, -0.4108682, 1, 1, 1, 1, 1,
-0.003440178, -1.475039, -3.616321, 1, 1, 1, 1, 1,
-0.0004780093, 0.7886446, 0.8785123, 0, 0, 1, 1, 1,
0.000645327, -2.055254, 2.069715, 1, 0, 0, 1, 1,
0.001460406, -0.3061884, 2.922729, 1, 0, 0, 1, 1,
0.001996614, -1.189506, 3.255069, 1, 0, 0, 1, 1,
0.002609105, 1.766338, -1.195671, 1, 0, 0, 1, 1,
0.004926321, -0.7947091, 3.829879, 1, 0, 0, 1, 1,
0.004970282, 0.4839312, 0.2645479, 0, 0, 0, 1, 1,
0.00844175, 0.531704, -0.0626479, 0, 0, 0, 1, 1,
0.009060755, 0.2363799, -0.1737542, 0, 0, 0, 1, 1,
0.0103373, -0.215025, 3.123642, 0, 0, 0, 1, 1,
0.01187357, 0.7114096, -1.036996, 0, 0, 0, 1, 1,
0.01552107, -0.5872089, 3.388074, 0, 0, 0, 1, 1,
0.01845907, 0.4172992, -0.5736611, 0, 0, 0, 1, 1,
0.02183107, 0.01163004, 1.488913, 1, 1, 1, 1, 1,
0.02373946, 0.9344755, 0.3914669, 1, 1, 1, 1, 1,
0.03099767, 2.118994, 0.2966375, 1, 1, 1, 1, 1,
0.03400537, -1.01484, 3.531359, 1, 1, 1, 1, 1,
0.03560752, 0.8884488, -0.6330409, 1, 1, 1, 1, 1,
0.04019197, -0.998534, 2.842791, 1, 1, 1, 1, 1,
0.04025276, 0.8559428, -0.8191152, 1, 1, 1, 1, 1,
0.04217522, -0.07655412, 2.027981, 1, 1, 1, 1, 1,
0.04446001, -0.127375, 2.74175, 1, 1, 1, 1, 1,
0.04490724, -0.1006833, 2.966158, 1, 1, 1, 1, 1,
0.04942096, -1.54323, 1.964517, 1, 1, 1, 1, 1,
0.05372187, 1.488902, -0.2030392, 1, 1, 1, 1, 1,
0.05402702, -0.632514, 2.25743, 1, 1, 1, 1, 1,
0.06240411, 0.3651665, 1.085686, 1, 1, 1, 1, 1,
0.06424331, 2.146886, -0.1641091, 1, 1, 1, 1, 1,
0.06598186, -1.621539, 2.781119, 0, 0, 1, 1, 1,
0.07139502, -0.5077429, 2.437008, 1, 0, 0, 1, 1,
0.07157847, 0.1490955, -0.5770886, 1, 0, 0, 1, 1,
0.07199796, -2.291742, 3.602075, 1, 0, 0, 1, 1,
0.07404047, 0.572731, 0.006408324, 1, 0, 0, 1, 1,
0.074344, -0.3912287, 2.159233, 1, 0, 0, 1, 1,
0.07718839, 0.4247885, 1.422369, 0, 0, 0, 1, 1,
0.08056925, 1.519725, 0.5910491, 0, 0, 0, 1, 1,
0.08267582, -1.799011, 3.172656, 0, 0, 0, 1, 1,
0.0833598, 1.308559, -0.6986503, 0, 0, 0, 1, 1,
0.08710837, 0.308513, 2.915608, 0, 0, 0, 1, 1,
0.09033686, 0.462361, -1.44945, 0, 0, 0, 1, 1,
0.09327788, -1.870798, 2.662818, 0, 0, 0, 1, 1,
0.09676034, -1.051491, 3.493209, 1, 1, 1, 1, 1,
0.09882461, -0.3925505, 3.036937, 1, 1, 1, 1, 1,
0.1020005, -0.8837065, 2.405429, 1, 1, 1, 1, 1,
0.1041367, -1.426044, 2.379837, 1, 1, 1, 1, 1,
0.1087768, 1.201906, -0.09144146, 1, 1, 1, 1, 1,
0.1174974, 0.09838568, 0.4891347, 1, 1, 1, 1, 1,
0.1186512, 0.4264474, 2.196362, 1, 1, 1, 1, 1,
0.1216092, 0.09545653, -0.4971716, 1, 1, 1, 1, 1,
0.1260725, -1.222625, 3.090748, 1, 1, 1, 1, 1,
0.126736, 0.2407366, -0.09424633, 1, 1, 1, 1, 1,
0.1274982, 0.1414142, 0.8911938, 1, 1, 1, 1, 1,
0.1283123, 0.4785649, 0.8459265, 1, 1, 1, 1, 1,
0.1291573, 0.3099597, -1.797293, 1, 1, 1, 1, 1,
0.1333588, 0.7096402, -0.8840898, 1, 1, 1, 1, 1,
0.1341631, 1.659701, -0.9041772, 1, 1, 1, 1, 1,
0.1358721, 1.401918, -0.9538699, 0, 0, 1, 1, 1,
0.1438646, 0.3813994, -0.1555251, 1, 0, 0, 1, 1,
0.1461394, -0.9707178, 2.59609, 1, 0, 0, 1, 1,
0.147991, -0.1251693, 2.514517, 1, 0, 0, 1, 1,
0.1513396, -0.5582619, 3.450321, 1, 0, 0, 1, 1,
0.1513841, 0.5654473, 1.181849, 1, 0, 0, 1, 1,
0.1564008, -0.23132, 2.67553, 0, 0, 0, 1, 1,
0.1566463, 1.211102, -0.08823562, 0, 0, 0, 1, 1,
0.160368, -0.1355523, 2.819702, 0, 0, 0, 1, 1,
0.1655977, -0.6796213, 1.293533, 0, 0, 0, 1, 1,
0.1672801, 0.1330662, 2.243207, 0, 0, 0, 1, 1,
0.1691879, -0.4986229, 2.375862, 0, 0, 0, 1, 1,
0.1708329, 1.093304, -0.899158, 0, 0, 0, 1, 1,
0.1724055, 0.4664618, 1.039016, 1, 1, 1, 1, 1,
0.1746125, -0.2639222, 3.086371, 1, 1, 1, 1, 1,
0.1774847, 1.829806, -0.5744275, 1, 1, 1, 1, 1,
0.1775955, -0.2311765, 4.735766, 1, 1, 1, 1, 1,
0.1788796, 1.141692, -0.2368317, 1, 1, 1, 1, 1,
0.1803064, 0.8296431, -1.774054, 1, 1, 1, 1, 1,
0.1814092, 1.162504, -0.02445575, 1, 1, 1, 1, 1,
0.1827191, -0.1479912, 3.397979, 1, 1, 1, 1, 1,
0.1896766, -0.1945002, 1.230186, 1, 1, 1, 1, 1,
0.19231, -0.1074358, 3.529125, 1, 1, 1, 1, 1,
0.1985632, -0.4909112, 2.787267, 1, 1, 1, 1, 1,
0.1998849, 1.734465, -0.1306498, 1, 1, 1, 1, 1,
0.2036321, 0.6948146, -0.4892171, 1, 1, 1, 1, 1,
0.2046287, -0.9555427, 3.178117, 1, 1, 1, 1, 1,
0.2069986, 0.3825695, 1.223751, 1, 1, 1, 1, 1,
0.2071341, 0.5943747, -1.376416, 0, 0, 1, 1, 1,
0.2078606, -0.7932838, 1.95925, 1, 0, 0, 1, 1,
0.2101645, -1.069812, 3.81078, 1, 0, 0, 1, 1,
0.2162508, 1.559131, -0.008637444, 1, 0, 0, 1, 1,
0.2194321, 1.134509, 0.5114385, 1, 0, 0, 1, 1,
0.2208871, 0.7441545, 0.06430853, 1, 0, 0, 1, 1,
0.2213588, -0.2545199, 4.386141, 0, 0, 0, 1, 1,
0.2270595, 0.8719822, 1.340353, 0, 0, 0, 1, 1,
0.2283779, 0.8974566, 0.2357257, 0, 0, 0, 1, 1,
0.2311304, 1.225066, 0.08727007, 0, 0, 0, 1, 1,
0.2320122, 0.6757836, 1.093974, 0, 0, 0, 1, 1,
0.2339636, -0.5387596, 4.411664, 0, 0, 0, 1, 1,
0.2367476, 1.008811, 2.315471, 0, 0, 0, 1, 1,
0.2493303, -0.7980934, 3.276415, 1, 1, 1, 1, 1,
0.2516217, 2.082806, 0.1753144, 1, 1, 1, 1, 1,
0.2534804, 0.9261182, 0.3314093, 1, 1, 1, 1, 1,
0.253561, -0.3156004, 4.059825, 1, 1, 1, 1, 1,
0.2539601, -0.3486826, 2.991814, 1, 1, 1, 1, 1,
0.2616112, -2.035524, 3.670505, 1, 1, 1, 1, 1,
0.2619912, 1.116347, -0.5922676, 1, 1, 1, 1, 1,
0.2631021, -0.718268, 1.958564, 1, 1, 1, 1, 1,
0.2635236, 0.6285931, -1.179181, 1, 1, 1, 1, 1,
0.2643842, 0.01409153, 1.052749, 1, 1, 1, 1, 1,
0.2659222, -1.737796, 3.56982, 1, 1, 1, 1, 1,
0.2695241, 0.7258776, 1.090743, 1, 1, 1, 1, 1,
0.2741893, 1.153608, -0.6817527, 1, 1, 1, 1, 1,
0.2754618, -1.078097, 2.303796, 1, 1, 1, 1, 1,
0.2793114, -0.454591, 2.167103, 1, 1, 1, 1, 1,
0.2836931, 3.142837, -0.2398864, 0, 0, 1, 1, 1,
0.2841504, 0.9434121, -0.8220079, 1, 0, 0, 1, 1,
0.2850573, 1.460736, 0.6926478, 1, 0, 0, 1, 1,
0.2877768, 0.8634046, 1.517867, 1, 0, 0, 1, 1,
0.2886254, 1.158005, 1.2622, 1, 0, 0, 1, 1,
0.289405, 0.8124385, -0.492936, 1, 0, 0, 1, 1,
0.2895071, -1.201204, 3.232309, 0, 0, 0, 1, 1,
0.2922207, 0.5837147, -0.9198788, 0, 0, 0, 1, 1,
0.2934345, 0.367406, 0.06918857, 0, 0, 0, 1, 1,
0.2959487, 0.9159989, 0.5256906, 0, 0, 0, 1, 1,
0.2975749, -0.5843499, 2.331841, 0, 0, 0, 1, 1,
0.2990315, -0.2187303, 1.786352, 0, 0, 0, 1, 1,
0.3019102, -0.5840372, 1.850992, 0, 0, 0, 1, 1,
0.3021842, -0.40358, 2.270945, 1, 1, 1, 1, 1,
0.3022636, -0.6691169, 1.659417, 1, 1, 1, 1, 1,
0.3026701, -1.019016, 3.219605, 1, 1, 1, 1, 1,
0.3029787, -0.4375432, 3.223484, 1, 1, 1, 1, 1,
0.3042668, 2.443025, -0.1526072, 1, 1, 1, 1, 1,
0.3068408, 1.319272, 1.2538, 1, 1, 1, 1, 1,
0.3073572, -1.547123, 3.294527, 1, 1, 1, 1, 1,
0.3085833, -0.9439796, 1.082722, 1, 1, 1, 1, 1,
0.3115231, -0.2737716, 1.879102, 1, 1, 1, 1, 1,
0.3122086, -0.3281575, -0.3196715, 1, 1, 1, 1, 1,
0.3146198, -1.497995, 4.929408, 1, 1, 1, 1, 1,
0.3178965, -0.6692209, 4.095019, 1, 1, 1, 1, 1,
0.3210843, 0.4807704, 0.9375293, 1, 1, 1, 1, 1,
0.3306988, -0.183489, 2.24729, 1, 1, 1, 1, 1,
0.3309004, 0.3262607, -0.3444952, 1, 1, 1, 1, 1,
0.3309145, -0.8313148, 2.599057, 0, 0, 1, 1, 1,
0.3365519, 0.2216105, -0.744253, 1, 0, 0, 1, 1,
0.3382244, 0.115413, 1.303143, 1, 0, 0, 1, 1,
0.3417596, -0.7206119, 2.577609, 1, 0, 0, 1, 1,
0.3418373, -0.4403507, 0.7172717, 1, 0, 0, 1, 1,
0.3451834, 0.6034113, 0.04080955, 1, 0, 0, 1, 1,
0.3491937, -0.8057395, 5.385599, 0, 0, 0, 1, 1,
0.3535903, 1.426197, -0.5376049, 0, 0, 0, 1, 1,
0.3549439, 0.5607225, 0.205262, 0, 0, 0, 1, 1,
0.3599594, 0.4216968, -0.4534116, 0, 0, 0, 1, 1,
0.3630022, 0.5358033, 1.21382, 0, 0, 0, 1, 1,
0.3658323, 0.4802899, 0.8592504, 0, 0, 0, 1, 1,
0.3699546, -2.394818, 3.15368, 0, 0, 0, 1, 1,
0.3723154, 0.636588, -0.571113, 1, 1, 1, 1, 1,
0.3734052, -1.487216, 2.423784, 1, 1, 1, 1, 1,
0.3849367, -1.617979, 1.995283, 1, 1, 1, 1, 1,
0.3880033, 1.19261, 0.4763849, 1, 1, 1, 1, 1,
0.3881342, -0.003003545, 3.673393, 1, 1, 1, 1, 1,
0.3892006, 0.7539281, -0.4786168, 1, 1, 1, 1, 1,
0.3916008, -0.4714434, 1.526571, 1, 1, 1, 1, 1,
0.3961721, 0.09081538, 2.426996, 1, 1, 1, 1, 1,
0.3972743, 1.140019, 0.02537394, 1, 1, 1, 1, 1,
0.3977103, -0.05751581, 2.870614, 1, 1, 1, 1, 1,
0.403276, 0.8185897, 0.1583779, 1, 1, 1, 1, 1,
0.4074201, 0.7023029, 0.3186376, 1, 1, 1, 1, 1,
0.4082276, 0.784136, 0.6444619, 1, 1, 1, 1, 1,
0.4099606, 0.3486695, 0.4381966, 1, 1, 1, 1, 1,
0.4111715, 0.03059636, 3.757627, 1, 1, 1, 1, 1,
0.4114927, 1.243997, 0.5719015, 0, 0, 1, 1, 1,
0.4141838, -0.1272508, 0.9038925, 1, 0, 0, 1, 1,
0.4232468, 0.2115642, 1.778458, 1, 0, 0, 1, 1,
0.4242311, 0.66078, 0.6452208, 1, 0, 0, 1, 1,
0.4261818, 0.335238, 1.245917, 1, 0, 0, 1, 1,
0.4293462, -0.2167235, 3.629247, 1, 0, 0, 1, 1,
0.4307572, 1.019001, 1.885087, 0, 0, 0, 1, 1,
0.4399151, -1.908632, 3.19637, 0, 0, 0, 1, 1,
0.4452649, -0.4425901, 1.904041, 0, 0, 0, 1, 1,
0.4497406, 0.2865449, 1.130177, 0, 0, 0, 1, 1,
0.45162, 0.6090308, 1.506372, 0, 0, 0, 1, 1,
0.455928, 1.902526, 0.2778813, 0, 0, 0, 1, 1,
0.4560311, -0.1105588, 1.799663, 0, 0, 0, 1, 1,
0.4634764, -1.656053, 4.169994, 1, 1, 1, 1, 1,
0.4716388, -1.882737, 3.812383, 1, 1, 1, 1, 1,
0.4820147, 0.03748354, 2.414546, 1, 1, 1, 1, 1,
0.4850397, 0.8695368, -0.105491, 1, 1, 1, 1, 1,
0.4895533, -0.8922963, 1.428537, 1, 1, 1, 1, 1,
0.4910999, 0.3882257, 1.411323, 1, 1, 1, 1, 1,
0.4928502, -0.8514889, 2.095046, 1, 1, 1, 1, 1,
0.5017177, -0.9399486, 1.055263, 1, 1, 1, 1, 1,
0.5031542, 0.5830994, 0.2469638, 1, 1, 1, 1, 1,
0.5059643, 0.6642078, 0.8086609, 1, 1, 1, 1, 1,
0.5060351, 0.98899, -0.8101618, 1, 1, 1, 1, 1,
0.5093367, -0.01764913, 1.143977, 1, 1, 1, 1, 1,
0.5115792, 1.358733, -0.02773681, 1, 1, 1, 1, 1,
0.5123117, 0.1599403, 0.4821157, 1, 1, 1, 1, 1,
0.5135658, 0.2263418, 1.20423, 1, 1, 1, 1, 1,
0.5188903, 1.309186, 0.3672017, 0, 0, 1, 1, 1,
0.5217813, -0.6357565, 1.931736, 1, 0, 0, 1, 1,
0.5248331, 1.677448, 0.9804828, 1, 0, 0, 1, 1,
0.5265431, 0.06163945, 1.504339, 1, 0, 0, 1, 1,
0.5361827, -0.8534873, 1.971825, 1, 0, 0, 1, 1,
0.5380218, -0.2891275, 2.441146, 1, 0, 0, 1, 1,
0.5457359, -1.353646, 3.51247, 0, 0, 0, 1, 1,
0.5466327, 0.9541285, -0.1843067, 0, 0, 0, 1, 1,
0.5522034, -1.026698, 2.747577, 0, 0, 0, 1, 1,
0.5524008, 0.5280803, -0.0518313, 0, 0, 0, 1, 1,
0.5528651, 1.655794, 1.061961, 0, 0, 0, 1, 1,
0.5548444, -0.9980574, 4.847661, 0, 0, 0, 1, 1,
0.5597253, 1.278649, 0.8325385, 0, 0, 0, 1, 1,
0.5605023, -0.4177399, 1.174021, 1, 1, 1, 1, 1,
0.5606995, 1.70374, -0.7107944, 1, 1, 1, 1, 1,
0.5611479, -0.9894522, 3.04423, 1, 1, 1, 1, 1,
0.5646377, 0.6092132, -2.080711, 1, 1, 1, 1, 1,
0.5663631, -1.305382, 3.164337, 1, 1, 1, 1, 1,
0.5713141, 1.709007, 0.1369914, 1, 1, 1, 1, 1,
0.5721714, 0.3220522, 1.284644, 1, 1, 1, 1, 1,
0.5732341, -1.003015, 3.90865, 1, 1, 1, 1, 1,
0.5747459, -0.7139853, 2.428239, 1, 1, 1, 1, 1,
0.5771525, -0.4111139, 2.507246, 1, 1, 1, 1, 1,
0.5776557, -0.02150786, 3.197336, 1, 1, 1, 1, 1,
0.5809317, 0.05161123, 1.299287, 1, 1, 1, 1, 1,
0.5829446, 1.529554, 0.7477661, 1, 1, 1, 1, 1,
0.585364, 0.241388, 1.090558, 1, 1, 1, 1, 1,
0.5858479, 1.137999, 0.422878, 1, 1, 1, 1, 1,
0.5889405, -0.521026, 1.995267, 0, 0, 1, 1, 1,
0.5902357, 0.1112554, 0.9260787, 1, 0, 0, 1, 1,
0.5922517, -0.07894029, 2.188116, 1, 0, 0, 1, 1,
0.5984569, 0.03082866, 3.500888, 1, 0, 0, 1, 1,
0.6045867, -1.029667, 2.022786, 1, 0, 0, 1, 1,
0.6056785, 0.009697936, 1.90136, 1, 0, 0, 1, 1,
0.6136886, 1.024044, 2.716205, 0, 0, 0, 1, 1,
0.6153647, 2.628702, 0.05713004, 0, 0, 0, 1, 1,
0.6164088, -0.5789818, 2.422729, 0, 0, 0, 1, 1,
0.6168882, -1.147643, 0.9228713, 0, 0, 0, 1, 1,
0.6179803, 1.377731, -0.0147142, 0, 0, 0, 1, 1,
0.6185052, 0.2784526, 0.2338558, 0, 0, 0, 1, 1,
0.6195986, -0.4570733, 1.757965, 0, 0, 0, 1, 1,
0.6307779, -0.7978758, 1.101916, 1, 1, 1, 1, 1,
0.6337912, 0.9368068, -0.07934999, 1, 1, 1, 1, 1,
0.6370035, 0.498973, 0.1118055, 1, 1, 1, 1, 1,
0.6375822, 1.024694, -1.005134, 1, 1, 1, 1, 1,
0.6401809, 0.01735943, 2.999472, 1, 1, 1, 1, 1,
0.6429607, -0.8659452, 2.962177, 1, 1, 1, 1, 1,
0.6453302, -1.822528, 4.977617, 1, 1, 1, 1, 1,
0.645485, 0.8939138, -0.7397095, 1, 1, 1, 1, 1,
0.6509267, 0.212342, 0.8832076, 1, 1, 1, 1, 1,
0.6550573, 0.7204379, 0.1160583, 1, 1, 1, 1, 1,
0.6608587, 0.6961524, -0.5562478, 1, 1, 1, 1, 1,
0.6648366, 0.1718533, 1.342298, 1, 1, 1, 1, 1,
0.6663516, 0.812885, -0.3607552, 1, 1, 1, 1, 1,
0.6681936, -0.06551886, 1.570957, 1, 1, 1, 1, 1,
0.6682996, -0.7733378, 2.990663, 1, 1, 1, 1, 1,
0.6691198, -0.01392456, 1.477972, 0, 0, 1, 1, 1,
0.67572, 0.5237256, 1.416039, 1, 0, 0, 1, 1,
0.6816899, -0.9111809, 2.685673, 1, 0, 0, 1, 1,
0.6817827, 0.2731126, 1.909668, 1, 0, 0, 1, 1,
0.6839696, -0.5986131, 1.347006, 1, 0, 0, 1, 1,
0.6842545, -1.221976, 3.073337, 1, 0, 0, 1, 1,
0.6860904, 0.3101451, -0.01821741, 0, 0, 0, 1, 1,
0.69563, 2.34522, 1.136173, 0, 0, 0, 1, 1,
0.6967179, -0.3406551, 2.39882, 0, 0, 0, 1, 1,
0.7057607, -1.022419, 0.7102863, 0, 0, 0, 1, 1,
0.7076277, 0.5559238, -1.561836, 0, 0, 0, 1, 1,
0.7087455, -0.128382, 1.720226, 0, 0, 0, 1, 1,
0.7093478, -0.404714, 4.83677, 0, 0, 0, 1, 1,
0.7120933, -0.3423901, 2.212372, 1, 1, 1, 1, 1,
0.7123524, -2.186779, 1.544954, 1, 1, 1, 1, 1,
0.7137908, -0.8657259, 0.7172804, 1, 1, 1, 1, 1,
0.7199878, 0.4833685, 1.644066, 1, 1, 1, 1, 1,
0.7264385, -0.1719286, 3.370423, 1, 1, 1, 1, 1,
0.7264581, -0.994039, 1.685098, 1, 1, 1, 1, 1,
0.7291895, 1.762068, 0.6076965, 1, 1, 1, 1, 1,
0.7346621, -0.275255, 3.271923, 1, 1, 1, 1, 1,
0.7363774, 0.2229855, 0.7339861, 1, 1, 1, 1, 1,
0.7422762, 0.01370518, 2.461587, 1, 1, 1, 1, 1,
0.7469328, 0.07495852, -0.1447613, 1, 1, 1, 1, 1,
0.7483211, -1.398714, 1.706674, 1, 1, 1, 1, 1,
0.7567763, 0.08132532, 1.187497, 1, 1, 1, 1, 1,
0.7641761, -2.839529, 1.760183, 1, 1, 1, 1, 1,
0.7668473, -0.3138745, -0.8166782, 1, 1, 1, 1, 1,
0.7674406, 0.2303477, 1.254967, 0, 0, 1, 1, 1,
0.7690244, 1.426418, 0.6402716, 1, 0, 0, 1, 1,
0.7739889, -0.3938878, 2.228947, 1, 0, 0, 1, 1,
0.776683, 1.880911, 0.853503, 1, 0, 0, 1, 1,
0.7818462, -0.4447285, 2.393104, 1, 0, 0, 1, 1,
0.7859277, -1.179403, 2.692504, 1, 0, 0, 1, 1,
0.7893928, -0.3976347, 1.956777, 0, 0, 0, 1, 1,
0.7897136, -0.1814407, 1.95072, 0, 0, 0, 1, 1,
0.7898787, -0.9876128, 1.919026, 0, 0, 0, 1, 1,
0.7919453, 1.890769, -0.5832972, 0, 0, 0, 1, 1,
0.7935851, 0.296616, -0.1902437, 0, 0, 0, 1, 1,
0.7959929, -0.647684, 2.6987, 0, 0, 0, 1, 1,
0.8046938, -0.4888142, 1.243013, 0, 0, 0, 1, 1,
0.8056464, -0.8061715, 1.848797, 1, 1, 1, 1, 1,
0.8063462, 0.05707794, 1.953703, 1, 1, 1, 1, 1,
0.8132975, -1.347811, 1.970638, 1, 1, 1, 1, 1,
0.8162147, -0.724986, 1.260502, 1, 1, 1, 1, 1,
0.8166115, -0.7002808, 2.269952, 1, 1, 1, 1, 1,
0.8202651, 0.1623903, 0.9934812, 1, 1, 1, 1, 1,
0.8257109, -0.9705749, 3.843213, 1, 1, 1, 1, 1,
0.8270929, -1.756035, 4.350387, 1, 1, 1, 1, 1,
0.8279541, 1.956842, 0.7178568, 1, 1, 1, 1, 1,
0.8308248, 0.3510804, 1.754141, 1, 1, 1, 1, 1,
0.8328928, -1.247866, 3.584771, 1, 1, 1, 1, 1,
0.8338003, 0.9042658, -1.305075, 1, 1, 1, 1, 1,
0.8353515, -0.7179056, 3.939123, 1, 1, 1, 1, 1,
0.8364666, 0.8470818, 0.830315, 1, 1, 1, 1, 1,
0.8411367, -0.5313292, 2.355873, 1, 1, 1, 1, 1,
0.8432742, -0.9939991, 2.115864, 0, 0, 1, 1, 1,
0.8438177, -0.009971607, 1.997742, 1, 0, 0, 1, 1,
0.8569088, -0.2064926, 2.087212, 1, 0, 0, 1, 1,
0.8631333, 0.5928007, 1.164108, 1, 0, 0, 1, 1,
0.8642549, 0.08398775, 2.289925, 1, 0, 0, 1, 1,
0.8673384, 1.703223, 0.8611073, 1, 0, 0, 1, 1,
0.8722519, -1.117169, 2.377173, 0, 0, 0, 1, 1,
0.8726401, 0.5467907, 0.8843175, 0, 0, 0, 1, 1,
0.8740356, -0.8594737, 1.160061, 0, 0, 0, 1, 1,
0.8777168, 0.5701324, 1.189282, 0, 0, 0, 1, 1,
0.8797337, 0.4416893, 1.988767, 0, 0, 0, 1, 1,
0.8803815, 1.112094, 0.3383511, 0, 0, 0, 1, 1,
0.8844957, 0.2908039, 0.4825359, 0, 0, 0, 1, 1,
0.8858483, -1.251105, 3.358138, 1, 1, 1, 1, 1,
0.8911304, -0.9932081, 1.748537, 1, 1, 1, 1, 1,
0.8917301, 0.9282993, 0.3589269, 1, 1, 1, 1, 1,
0.897936, -1.660864, 3.173319, 1, 1, 1, 1, 1,
0.9026902, 0.1747967, 1.898534, 1, 1, 1, 1, 1,
0.915886, -1.291604, 3.4198, 1, 1, 1, 1, 1,
0.9212524, -2.681746, 2.498719, 1, 1, 1, 1, 1,
0.9225961, -1.080234, 2.804491, 1, 1, 1, 1, 1,
0.9280725, -1.009622, 1.683226, 1, 1, 1, 1, 1,
0.9288788, -1.061014, 1.974836, 1, 1, 1, 1, 1,
0.9291621, 1.043536, -0.6549224, 1, 1, 1, 1, 1,
0.929941, 0.7717847, -1.108239, 1, 1, 1, 1, 1,
0.9326321, -0.2156394, 3.20119, 1, 1, 1, 1, 1,
0.9331264, -1.226312, 2.653577, 1, 1, 1, 1, 1,
0.9335041, -0.6381432, 1.606068, 1, 1, 1, 1, 1,
0.9360365, 0.5170516, 1.68965, 0, 0, 1, 1, 1,
0.9389898, -0.6724724, 1.432612, 1, 0, 0, 1, 1,
0.9409439, -1.443694, 0.8259322, 1, 0, 0, 1, 1,
0.9431093, 0.6672367, 0.2193383, 1, 0, 0, 1, 1,
0.9497789, 0.6914323, 0.8380422, 1, 0, 0, 1, 1,
0.9499374, -2.687838, 3.586794, 1, 0, 0, 1, 1,
0.9524289, 1.565026, 0.2753616, 0, 0, 0, 1, 1,
0.9550001, -0.1438438, 2.210521, 0, 0, 0, 1, 1,
0.9559094, -1.277118, 2.341235, 0, 0, 0, 1, 1,
0.9581454, 0.01839601, 2.90193, 0, 0, 0, 1, 1,
0.958833, 0.1658065, 0.5525673, 0, 0, 0, 1, 1,
0.9595682, 0.9581999, 1.981223, 0, 0, 0, 1, 1,
0.9627598, -1.294525, 2.598571, 0, 0, 0, 1, 1,
0.9628568, 0.368074, 0.577315, 1, 1, 1, 1, 1,
0.9697527, -0.6083208, 1.756942, 1, 1, 1, 1, 1,
0.9721258, 0.5691314, -0.4132679, 1, 1, 1, 1, 1,
0.9753686, -0.7622275, 0.3505852, 1, 1, 1, 1, 1,
0.9757283, -1.09573, 2.657305, 1, 1, 1, 1, 1,
0.9759207, -0.5227768, 0.3121254, 1, 1, 1, 1, 1,
0.9842991, -1.276144, 2.64056, 1, 1, 1, 1, 1,
0.992484, 1.016258, 0.225888, 1, 1, 1, 1, 1,
0.998563, 0.3411245, 1.357224, 1, 1, 1, 1, 1,
1.000488, 0.2346695, 1.045051, 1, 1, 1, 1, 1,
1.003983, 0.7599553, -0.8908166, 1, 1, 1, 1, 1,
1.008874, 0.05047125, 0.8444224, 1, 1, 1, 1, 1,
1.010296, -0.09658544, 3.422007, 1, 1, 1, 1, 1,
1.015139, -0.1854133, 2.80185, 1, 1, 1, 1, 1,
1.017347, -1.274608, 2.01885, 1, 1, 1, 1, 1,
1.045853, 1.096609, 1.033979, 0, 0, 1, 1, 1,
1.060449, -1.232256, 2.626259, 1, 0, 0, 1, 1,
1.061032, -0.6437542, 2.793718, 1, 0, 0, 1, 1,
1.068049, -1.52359, 3.592942, 1, 0, 0, 1, 1,
1.06889, 0.7800074, 2.102013, 1, 0, 0, 1, 1,
1.079881, 0.450433, 1.219194, 1, 0, 0, 1, 1,
1.086631, 1.819112, 0.7454382, 0, 0, 0, 1, 1,
1.088644, -2.321264, 1.767692, 0, 0, 0, 1, 1,
1.096485, -1.81236, 3.839173, 0, 0, 0, 1, 1,
1.098677, -0.4067652, 0.6205935, 0, 0, 0, 1, 1,
1.101419, -1.724757, 2.399827, 0, 0, 0, 1, 1,
1.10853, -0.8061336, 0.2743756, 0, 0, 0, 1, 1,
1.112532, -0.3329805, 1.470544, 0, 0, 0, 1, 1,
1.118152, -0.9741004, 1.144779, 1, 1, 1, 1, 1,
1.118739, 0.4603251, 1.089942, 1, 1, 1, 1, 1,
1.125971, -0.7794711, 4.048366, 1, 1, 1, 1, 1,
1.137688, 1.247904, 0.8969505, 1, 1, 1, 1, 1,
1.141132, -0.1000448, 0.7542246, 1, 1, 1, 1, 1,
1.146891, -0.6918649, 1.624125, 1, 1, 1, 1, 1,
1.150602, -0.7653654, 1.683048, 1, 1, 1, 1, 1,
1.151095, 0.1024997, 2.524561, 1, 1, 1, 1, 1,
1.164349, 0.1607694, 3.322721, 1, 1, 1, 1, 1,
1.166875, -1.747159, 1.895783, 1, 1, 1, 1, 1,
1.182453, -1.174458, 3.225006, 1, 1, 1, 1, 1,
1.186124, 2.128453, 0.01293378, 1, 1, 1, 1, 1,
1.200638, -0.4713207, 2.817285, 1, 1, 1, 1, 1,
1.203029, -0.9900711, 2.735937, 1, 1, 1, 1, 1,
1.20381, 0.4597368, 1.268277, 1, 1, 1, 1, 1,
1.211596, -0.3540079, 1.989373, 0, 0, 1, 1, 1,
1.212306, -1.278355, 1.717403, 1, 0, 0, 1, 1,
1.230171, 1.790538, -0.5262235, 1, 0, 0, 1, 1,
1.231916, 1.054175, -0.8330856, 1, 0, 0, 1, 1,
1.233036, -0.4287016, 0.3458996, 1, 0, 0, 1, 1,
1.234877, 0.3761914, 2.316169, 1, 0, 0, 1, 1,
1.236757, -0.2480365, 2.135012, 0, 0, 0, 1, 1,
1.243777, -0.6611618, 1.325487, 0, 0, 0, 1, 1,
1.243872, 1.364896, 1.283386, 0, 0, 0, 1, 1,
1.244194, -0.2394649, 2.659488, 0, 0, 0, 1, 1,
1.25427, -0.0816351, 2.131853, 0, 0, 0, 1, 1,
1.254982, -1.968004, 2.566925, 0, 0, 0, 1, 1,
1.259233, 0.1985354, 0.4041249, 0, 0, 0, 1, 1,
1.263111, -0.8706293, 2.067864, 1, 1, 1, 1, 1,
1.270485, 1.905345, 1.922901, 1, 1, 1, 1, 1,
1.281739, -0.5009083, 1.148271, 1, 1, 1, 1, 1,
1.283169, 1.030541, -0.1772827, 1, 1, 1, 1, 1,
1.294186, 0.003063944, 3.171262, 1, 1, 1, 1, 1,
1.294696, -1.052158, 1.040507, 1, 1, 1, 1, 1,
1.313876, -1.553156, 1.684707, 1, 1, 1, 1, 1,
1.325372, 0.4161519, 2.902074, 1, 1, 1, 1, 1,
1.333141, -1.248631, 2.824307, 1, 1, 1, 1, 1,
1.333776, -1.018073, 2.042602, 1, 1, 1, 1, 1,
1.335535, -1.760476, 4.591505, 1, 1, 1, 1, 1,
1.337407, -1.179602, 2.493608, 1, 1, 1, 1, 1,
1.338645, 0.8313344, 0.3469542, 1, 1, 1, 1, 1,
1.339534, 1.587897, 1.099549, 1, 1, 1, 1, 1,
1.34083, -1.790049, 1.357644, 1, 1, 1, 1, 1,
1.342653, 0.0312908, 1.837496, 0, 0, 1, 1, 1,
1.344888, 0.598096, 0.4541891, 1, 0, 0, 1, 1,
1.349279, 1.298709, 2.922738, 1, 0, 0, 1, 1,
1.350002, -1.788732, 2.2, 1, 0, 0, 1, 1,
1.357874, -0.2449134, 3.089565, 1, 0, 0, 1, 1,
1.362703, 0.339105, 2.9167, 1, 0, 0, 1, 1,
1.362847, -0.1083967, 2.319056, 0, 0, 0, 1, 1,
1.365205, 0.07335752, 0.6493142, 0, 0, 0, 1, 1,
1.36632, -0.1956825, 1.979539, 0, 0, 0, 1, 1,
1.369281, -0.3719644, 3.938648, 0, 0, 0, 1, 1,
1.369492, -0.9502886, 0.2322135, 0, 0, 0, 1, 1,
1.370078, -0.5608414, 1.973943, 0, 0, 0, 1, 1,
1.375527, 1.074089, 2.03575, 0, 0, 0, 1, 1,
1.380126, 0.2489394, 1.037898, 1, 1, 1, 1, 1,
1.38339, -0.8430008, 1.301882, 1, 1, 1, 1, 1,
1.386088, 0.06690177, 1.354147, 1, 1, 1, 1, 1,
1.392829, -1.3332, 2.560228, 1, 1, 1, 1, 1,
1.396453, -1.343807, 2.894661, 1, 1, 1, 1, 1,
1.396895, 0.07916559, 1.04296, 1, 1, 1, 1, 1,
1.411191, -1.07493, 2.350941, 1, 1, 1, 1, 1,
1.418396, -2.368564, 3.583951, 1, 1, 1, 1, 1,
1.424363, -0.6727946, 0.6202603, 1, 1, 1, 1, 1,
1.427314, -1.098711, 1.424913, 1, 1, 1, 1, 1,
1.429697, 0.9714587, 0.7035361, 1, 1, 1, 1, 1,
1.434248, -1.163728, 3.226791, 1, 1, 1, 1, 1,
1.435755, -0.4992338, 3.923413, 1, 1, 1, 1, 1,
1.442265, 0.8495063, 2.097947, 1, 1, 1, 1, 1,
1.446588, 1.185549, 0.4717528, 1, 1, 1, 1, 1,
1.460811, -0.6261826, 0.7883914, 0, 0, 1, 1, 1,
1.471871, -0.2307764, 1.537324, 1, 0, 0, 1, 1,
1.473086, 1.677553, 1.821802, 1, 0, 0, 1, 1,
1.473311, 0.9820736, 1.097358, 1, 0, 0, 1, 1,
1.497035, 0.6388301, 3.152566, 1, 0, 0, 1, 1,
1.498568, -0.6867076, 2.265566, 1, 0, 0, 1, 1,
1.503162, -0.5606083, 3.443314, 0, 0, 0, 1, 1,
1.505212, -2.134706, 3.255163, 0, 0, 0, 1, 1,
1.510586, 0.1020441, 0.6678917, 0, 0, 0, 1, 1,
1.512737, -1.316888, 1.364483, 0, 0, 0, 1, 1,
1.513644, -1.123571, 1.670439, 0, 0, 0, 1, 1,
1.515331, -0.5299389, 2.078171, 0, 0, 0, 1, 1,
1.522823, -1.326371, 2.924428, 0, 0, 0, 1, 1,
1.526642, 0.3935567, 1.459871, 1, 1, 1, 1, 1,
1.534419, -1.433818, 4.453937, 1, 1, 1, 1, 1,
1.534807, 0.400012, 0.5314296, 1, 1, 1, 1, 1,
1.538173, 0.776122, 1.01617, 1, 1, 1, 1, 1,
1.540594, 0.5507569, -1.501963, 1, 1, 1, 1, 1,
1.554406, 0.4842384, 1.191064, 1, 1, 1, 1, 1,
1.563395, 0.3767445, 0.4702485, 1, 1, 1, 1, 1,
1.584426, 0.6600968, 2.394006, 1, 1, 1, 1, 1,
1.597076, 0.9346439, 2.193305, 1, 1, 1, 1, 1,
1.616264, 1.052995, -1.042991, 1, 1, 1, 1, 1,
1.617746, 0.226022, 1.99525, 1, 1, 1, 1, 1,
1.620239, -2.582079, 3.69247, 1, 1, 1, 1, 1,
1.662652, 0.1837056, 1.593087, 1, 1, 1, 1, 1,
1.673944, 1.087634, 1.868485, 1, 1, 1, 1, 1,
1.689656, 2.404409, 1.897343, 1, 1, 1, 1, 1,
1.69629, -1.273253, 1.062727, 0, 0, 1, 1, 1,
1.712725, -0.9766967, 2.226979, 1, 0, 0, 1, 1,
1.713967, 1.036969, 0.7386674, 1, 0, 0, 1, 1,
1.743786, -0.2654258, -0.7071003, 1, 0, 0, 1, 1,
1.756023, 0.9857771, 2.442008, 1, 0, 0, 1, 1,
1.757088, 1.218879, 0.5810235, 1, 0, 0, 1, 1,
1.765357, -0.02164736, 1.417993, 0, 0, 0, 1, 1,
1.766905, -1.127676, 1.574173, 0, 0, 0, 1, 1,
1.771125, 0.6241313, 1.498863, 0, 0, 0, 1, 1,
1.793266, -0.3769535, 2.937321, 0, 0, 0, 1, 1,
1.794305, 0.3789852, 0.9216482, 0, 0, 0, 1, 1,
1.795361, 0.9824839, 1.69407, 0, 0, 0, 1, 1,
1.806455, -0.1751572, 1.902678, 0, 0, 0, 1, 1,
1.837237, -0.1705897, 1.767721, 1, 1, 1, 1, 1,
1.851602, -0.5342633, 1.087678, 1, 1, 1, 1, 1,
1.857827, -1.44612, 2.842611, 1, 1, 1, 1, 1,
1.871222, -0.3803256, 3.77526, 1, 1, 1, 1, 1,
1.927367, -0.5962459, 2.069117, 1, 1, 1, 1, 1,
1.929919, -0.5863051, 0.3248357, 1, 1, 1, 1, 1,
1.982176, 2.098605, -0.8589278, 1, 1, 1, 1, 1,
2.00833, -0.2186648, 2.2738, 1, 1, 1, 1, 1,
2.051642, 0.8330475, 1.711705, 1, 1, 1, 1, 1,
2.056034, 0.1556163, 2.107, 1, 1, 1, 1, 1,
2.06551, -0.1031247, 1.091492, 1, 1, 1, 1, 1,
2.082847, 1.623805, 1.671344, 1, 1, 1, 1, 1,
2.088719, 1.243511, 0.8493993, 1, 1, 1, 1, 1,
2.117134, -1.786689, 2.743855, 1, 1, 1, 1, 1,
2.126688, -0.7495248, 1.259349, 1, 1, 1, 1, 1,
2.129005, -2.503348, 1.790351, 0, 0, 1, 1, 1,
2.13647, 1.247931, 0.04909735, 1, 0, 0, 1, 1,
2.162856, -1.573217, 1.962266, 1, 0, 0, 1, 1,
2.195405, 0.1977306, 0.6549315, 1, 0, 0, 1, 1,
2.248225, 0.5011268, 1.583177, 1, 0, 0, 1, 1,
2.282208, -2.517528, 2.422116, 1, 0, 0, 1, 1,
2.352779, 0.7697588, 0.3023365, 0, 0, 0, 1, 1,
2.354219, 1.079524, 1.048507, 0, 0, 0, 1, 1,
2.355543, 1.825764, 0.263314, 0, 0, 0, 1, 1,
2.450781, -0.5311011, 0.9037492, 0, 0, 0, 1, 1,
2.455064, 0.243461, 2.049003, 0, 0, 0, 1, 1,
2.467584, 1.198438, 1.533064, 0, 0, 0, 1, 1,
2.482663, 1.712143, 1.329945, 0, 0, 0, 1, 1,
2.530746, -1.953691, 3.329952, 1, 1, 1, 1, 1,
2.555205, -0.3374726, 0.2988994, 1, 1, 1, 1, 1,
2.570464, -1.479128, 2.464936, 1, 1, 1, 1, 1,
2.695437, 2.792183, 2.960679, 1, 1, 1, 1, 1,
2.758296, -1.625585, 3.054694, 1, 1, 1, 1, 1,
3.045436, -0.8360073, 2.354836, 1, 1, 1, 1, 1,
3.742747, -1.212704, 2.177287, 1, 1, 1, 1, 1
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
var radius = 9.748647;
var distance = 34.24171;
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
mvMatrix.translate( -0.3017545, -0.0743531, 0.1157298 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24171);
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