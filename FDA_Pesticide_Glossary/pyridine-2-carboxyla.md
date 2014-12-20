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
-3.339715, 0.3091637, -3.154572, 1, 0, 0, 1,
-2.959419, 0.9239929, -2.910215, 1, 0.007843138, 0, 1,
-2.947628, 0.8185472, -0.9912369, 1, 0.01176471, 0, 1,
-2.70094, -0.6459724, -0.9137889, 1, 0.01960784, 0, 1,
-2.695845, -0.0149373, -2.325235, 1, 0.02352941, 0, 1,
-2.599996, 0.5101714, -1.451224, 1, 0.03137255, 0, 1,
-2.544353, 0.07017135, -1.391583, 1, 0.03529412, 0, 1,
-2.542626, 1.680217, -1.76544, 1, 0.04313726, 0, 1,
-2.409564, -0.8056872, -1.540426, 1, 0.04705882, 0, 1,
-2.303069, -0.1633411, -2.629229, 1, 0.05490196, 0, 1,
-2.283973, -1.007375, -1.007637, 1, 0.05882353, 0, 1,
-2.268472, 0.03323118, -0.3269969, 1, 0.06666667, 0, 1,
-2.254159, 0.3456027, -1.705102, 1, 0.07058824, 0, 1,
-2.203395, 0.1373859, -1.986208, 1, 0.07843138, 0, 1,
-2.184563, -1.041476, -2.703993, 1, 0.08235294, 0, 1,
-2.119118, 0.351823, -2.392758, 1, 0.09019608, 0, 1,
-2.091115, -0.5698768, -2.48786, 1, 0.09411765, 0, 1,
-2.077406, -1.073554, -3.688179, 1, 0.1019608, 0, 1,
-2.076635, -0.02532556, -1.954612, 1, 0.1098039, 0, 1,
-2.075733, -1.141959, -3.019352, 1, 0.1137255, 0, 1,
-2.06344, 0.3556024, -3.070393, 1, 0.1215686, 0, 1,
-2.059436, 0.2632226, -0.8986709, 1, 0.1254902, 0, 1,
-2.045909, -0.5253011, -1.999139, 1, 0.1333333, 0, 1,
-2.011221, -0.6489462, -2.239243, 1, 0.1372549, 0, 1,
-1.968113, -0.3573306, -2.310948, 1, 0.145098, 0, 1,
-1.962764, -1.046234, -1.329666, 1, 0.1490196, 0, 1,
-1.960975, -1.724502, -2.305009, 1, 0.1568628, 0, 1,
-1.957484, 0.05292815, 0.4502308, 1, 0.1607843, 0, 1,
-1.940868, 0.7479238, -2.039851, 1, 0.1686275, 0, 1,
-1.882068, 0.03822691, -3.114961, 1, 0.172549, 0, 1,
-1.873393, 1.267574, -1.827873, 1, 0.1803922, 0, 1,
-1.872684, -0.8499566, -2.280645, 1, 0.1843137, 0, 1,
-1.870005, -0.7257736, -1.130252, 1, 0.1921569, 0, 1,
-1.866011, -0.3815969, -2.555247, 1, 0.1960784, 0, 1,
-1.848477, -1.664085, -2.539451, 1, 0.2039216, 0, 1,
-1.812309, 0.4937182, -2.349559, 1, 0.2117647, 0, 1,
-1.79525, 1.161933, -0.8665732, 1, 0.2156863, 0, 1,
-1.792346, 0.1378799, -1.884342, 1, 0.2235294, 0, 1,
-1.789216, 2.69129, -0.5296709, 1, 0.227451, 0, 1,
-1.788419, -0.2203377, -0.8850268, 1, 0.2352941, 0, 1,
-1.78755, -0.2186919, -0.4269013, 1, 0.2392157, 0, 1,
-1.768938, 0.18255, -2.472375, 1, 0.2470588, 0, 1,
-1.758183, -0.2903906, -2.864511, 1, 0.2509804, 0, 1,
-1.747859, -0.8266841, -0.7290979, 1, 0.2588235, 0, 1,
-1.745111, -0.7637104, -2.799576, 1, 0.2627451, 0, 1,
-1.742988, 2.306046, 0.9663444, 1, 0.2705882, 0, 1,
-1.738573, 0.866402, -1.609814, 1, 0.2745098, 0, 1,
-1.720518, 0.5285054, -0.4916328, 1, 0.282353, 0, 1,
-1.687972, -0.2379702, -2.536265, 1, 0.2862745, 0, 1,
-1.68589, 1.790557, -0.648521, 1, 0.2941177, 0, 1,
-1.679903, -1.866187, -1.712913, 1, 0.3019608, 0, 1,
-1.643472, 1.588708, -1.707803, 1, 0.3058824, 0, 1,
-1.618242, 0.08669571, -3.495275, 1, 0.3137255, 0, 1,
-1.604531, -1.402466, -1.765656, 1, 0.3176471, 0, 1,
-1.579102, -1.775401, -0.4441576, 1, 0.3254902, 0, 1,
-1.575232, -1.112346, -1.768385, 1, 0.3294118, 0, 1,
-1.570455, 0.0169884, -2.435062, 1, 0.3372549, 0, 1,
-1.569497, -1.211379, -0.4790493, 1, 0.3411765, 0, 1,
-1.542046, 0.02841097, -1.809397, 1, 0.3490196, 0, 1,
-1.539053, 0.4282427, -2.604378, 1, 0.3529412, 0, 1,
-1.535502, -0.3487694, 0.8509545, 1, 0.3607843, 0, 1,
-1.513347, -1.362948, -2.607268, 1, 0.3647059, 0, 1,
-1.502418, -0.7653114, -1.418033, 1, 0.372549, 0, 1,
-1.501676, 0.1281648, 0.1666484, 1, 0.3764706, 0, 1,
-1.493712, -1.559253, -4.000132, 1, 0.3843137, 0, 1,
-1.488167, -0.01941263, -1.435209, 1, 0.3882353, 0, 1,
-1.473847, -0.09077302, -2.51201, 1, 0.3960784, 0, 1,
-1.473407, -1.512999, -0.8355383, 1, 0.4039216, 0, 1,
-1.471386, -0.8233564, -1.671358, 1, 0.4078431, 0, 1,
-1.467983, -0.4500037, -1.490954, 1, 0.4156863, 0, 1,
-1.452303, -0.6999188, -3.356477, 1, 0.4196078, 0, 1,
-1.447438, -1.314109, -1.534599, 1, 0.427451, 0, 1,
-1.446895, 2.088171, -1.469854, 1, 0.4313726, 0, 1,
-1.44098, -1.133989, -2.748307, 1, 0.4392157, 0, 1,
-1.436576, -0.3160834, -1.668865, 1, 0.4431373, 0, 1,
-1.429169, -0.7030765, -1.792118, 1, 0.4509804, 0, 1,
-1.4202, -1.022379, -2.549828, 1, 0.454902, 0, 1,
-1.418446, 0.9452739, -1.963857, 1, 0.4627451, 0, 1,
-1.416361, -0.1968399, -2.741196, 1, 0.4666667, 0, 1,
-1.412204, -0.6134318, -1.684949, 1, 0.4745098, 0, 1,
-1.411935, 2.207851, -0.8392549, 1, 0.4784314, 0, 1,
-1.408988, 0.925231, -2.530453, 1, 0.4862745, 0, 1,
-1.404042, 0.6189235, -2.452131, 1, 0.4901961, 0, 1,
-1.366653, -1.583968, -1.602504, 1, 0.4980392, 0, 1,
-1.362131, -0.8568483, -1.653998, 1, 0.5058824, 0, 1,
-1.349611, 1.291868, -0.7914008, 1, 0.509804, 0, 1,
-1.339124, 0.8154091, -0.8841026, 1, 0.5176471, 0, 1,
-1.331026, 1.912491, -0.04780244, 1, 0.5215687, 0, 1,
-1.330797, 0.2718982, -1.336351, 1, 0.5294118, 0, 1,
-1.329862, -0.5821634, -0.5839558, 1, 0.5333334, 0, 1,
-1.32743, 0.4143193, -0.7677267, 1, 0.5411765, 0, 1,
-1.321114, 0.5119066, -2.557048, 1, 0.5450981, 0, 1,
-1.312562, 0.0982025, -0.1196988, 1, 0.5529412, 0, 1,
-1.306604, -0.3819004, -1.271955, 1, 0.5568628, 0, 1,
-1.3049, -1.497534, -2.777331, 1, 0.5647059, 0, 1,
-1.302845, -0.2132748, -3.060945, 1, 0.5686275, 0, 1,
-1.301286, -0.9428478, -1.620034, 1, 0.5764706, 0, 1,
-1.298593, -0.7923031, -2.979245, 1, 0.5803922, 0, 1,
-1.286716, 1.541797, -1.637854, 1, 0.5882353, 0, 1,
-1.284941, 0.5902854, -0.06296677, 1, 0.5921569, 0, 1,
-1.266501, 0.09221545, -1.047772, 1, 0.6, 0, 1,
-1.261154, 0.4460776, -1.653064, 1, 0.6078432, 0, 1,
-1.254558, -1.448241, -1.089193, 1, 0.6117647, 0, 1,
-1.24983, 0.263145, 0.8822848, 1, 0.6196079, 0, 1,
-1.247978, -0.492798, -1.547753, 1, 0.6235294, 0, 1,
-1.247767, 1.005651, -0.2612652, 1, 0.6313726, 0, 1,
-1.245887, -0.314562, -1.804627, 1, 0.6352941, 0, 1,
-1.241288, 0.9316844, -1.558944, 1, 0.6431373, 0, 1,
-1.232925, 0.9537368, 1.181133, 1, 0.6470588, 0, 1,
-1.230542, 1.892143, -1.38539, 1, 0.654902, 0, 1,
-1.223369, -0.5090547, -2.863194, 1, 0.6588235, 0, 1,
-1.221591, 0.1548292, -1.097367, 1, 0.6666667, 0, 1,
-1.21666, 0.5759734, -0.9060309, 1, 0.6705883, 0, 1,
-1.216098, 1.321851, -0.1597015, 1, 0.6784314, 0, 1,
-1.204406, -0.8344333, -3.106975, 1, 0.682353, 0, 1,
-1.198366, -0.1954996, -3.305313, 1, 0.6901961, 0, 1,
-1.197461, -0.7972329, -1.809746, 1, 0.6941177, 0, 1,
-1.197459, -0.2510675, -1.118108, 1, 0.7019608, 0, 1,
-1.18086, -1.392047, -2.137867, 1, 0.7098039, 0, 1,
-1.169647, 0.4006404, -1.37469, 1, 0.7137255, 0, 1,
-1.16362, -0.7722389, -2.505927, 1, 0.7215686, 0, 1,
-1.159319, 0.2415358, -2.452626, 1, 0.7254902, 0, 1,
-1.14232, 0.3785165, -2.019028, 1, 0.7333333, 0, 1,
-1.138643, 0.3613551, -1.213423, 1, 0.7372549, 0, 1,
-1.133482, 1.372783, -0.455708, 1, 0.7450981, 0, 1,
-1.130101, 0.4440875, -2.168732, 1, 0.7490196, 0, 1,
-1.124615, -0.06676591, -0.9201291, 1, 0.7568628, 0, 1,
-1.103499, 0.1767292, -0.7336366, 1, 0.7607843, 0, 1,
-1.100779, 1.535678, -0.8061257, 1, 0.7686275, 0, 1,
-1.098221, -0.6548548, -2.174058, 1, 0.772549, 0, 1,
-1.095226, 1.071135, -0.01083365, 1, 0.7803922, 0, 1,
-1.094614, -0.912153, -1.776185, 1, 0.7843137, 0, 1,
-1.063366, -0.7765032, -0.9997377, 1, 0.7921569, 0, 1,
-1.06316, -0.7891818, -2.79669, 1, 0.7960784, 0, 1,
-1.060711, -1.513232, -2.869013, 1, 0.8039216, 0, 1,
-1.059736, 0.5677149, -2.465744, 1, 0.8117647, 0, 1,
-1.055783, 0.2280566, -0.7621859, 1, 0.8156863, 0, 1,
-1.053972, -0.2337776, -3.385462, 1, 0.8235294, 0, 1,
-1.047808, 0.3951366, -1.302729, 1, 0.827451, 0, 1,
-1.046367, -1.663562, -2.776246, 1, 0.8352941, 0, 1,
-1.038814, -0.3673881, -1.19398, 1, 0.8392157, 0, 1,
-1.037227, -0.5438548, -1.631832, 1, 0.8470588, 0, 1,
-1.029812, 1.896354, -0.007018107, 1, 0.8509804, 0, 1,
-1.029345, -0.01630251, -0.6360675, 1, 0.8588235, 0, 1,
-1.0252, -0.0362693, -2.005824, 1, 0.8627451, 0, 1,
-1.023757, -0.8175801, -1.419102, 1, 0.8705882, 0, 1,
-1.019618, 1.872101, 0.760048, 1, 0.8745098, 0, 1,
-1.011612, 1.087954, -2.167262, 1, 0.8823529, 0, 1,
-1.001175, 0.4752385, -1.341859, 1, 0.8862745, 0, 1,
-0.9984484, -2.47727, -3.442407, 1, 0.8941177, 0, 1,
-0.9944307, 0.4008339, -0.7926325, 1, 0.8980392, 0, 1,
-0.9906704, -1.861493, -1.001659, 1, 0.9058824, 0, 1,
-0.9887361, 0.04571899, 0.2264181, 1, 0.9137255, 0, 1,
-0.9855969, 0.4026784, -1.72954, 1, 0.9176471, 0, 1,
-0.9849385, -0.5277112, -0.5109847, 1, 0.9254902, 0, 1,
-0.9848559, 1.970947, 0.3337227, 1, 0.9294118, 0, 1,
-0.9810773, 0.5732011, -1.428169, 1, 0.9372549, 0, 1,
-0.9806529, -0.5108591, -2.583707, 1, 0.9411765, 0, 1,
-0.9747652, 0.5836579, -0.8930538, 1, 0.9490196, 0, 1,
-0.9713302, -1.166955, -3.828631, 1, 0.9529412, 0, 1,
-0.9708534, -0.434536, -2.501068, 1, 0.9607843, 0, 1,
-0.9642383, 1.38289, -0.6161264, 1, 0.9647059, 0, 1,
-0.9631478, 2.274648, -2.029231, 1, 0.972549, 0, 1,
-0.9598901, -0.6235878, -3.829671, 1, 0.9764706, 0, 1,
-0.959647, 0.5976721, -1.175322, 1, 0.9843137, 0, 1,
-0.9584284, 0.04371672, -0.07351337, 1, 0.9882353, 0, 1,
-0.9481022, -0.1451108, -2.709233, 1, 0.9960784, 0, 1,
-0.9456351, 0.6560366, -1.549199, 0.9960784, 1, 0, 1,
-0.9428776, 0.004791346, -2.103198, 0.9921569, 1, 0, 1,
-0.9425308, -0.1561693, -1.173161, 0.9843137, 1, 0, 1,
-0.9261335, 0.9400089, -1.074709, 0.9803922, 1, 0, 1,
-0.9238189, 0.6332449, -0.9083512, 0.972549, 1, 0, 1,
-0.9230879, 0.1342273, -1.780194, 0.9686275, 1, 0, 1,
-0.9198921, -0.41448, -1.748677, 0.9607843, 1, 0, 1,
-0.9186263, -0.630943, -1.842373, 0.9568627, 1, 0, 1,
-0.9144556, 0.3932351, -0.4834419, 0.9490196, 1, 0, 1,
-0.9017112, -0.3515614, -2.125156, 0.945098, 1, 0, 1,
-0.8989839, 0.6181949, -1.888928, 0.9372549, 1, 0, 1,
-0.8978457, 1.004947, 0.04064421, 0.9333333, 1, 0, 1,
-0.895823, 1.263557, -1.373589, 0.9254902, 1, 0, 1,
-0.8923618, -2.485353, -2.914788, 0.9215686, 1, 0, 1,
-0.8911695, -0.5074303, -1.796682, 0.9137255, 1, 0, 1,
-0.8896495, 0.6448015, -0.7134693, 0.9098039, 1, 0, 1,
-0.8852618, -0.9948381, -3.209837, 0.9019608, 1, 0, 1,
-0.8754516, -1.309635, -1.576422, 0.8941177, 1, 0, 1,
-0.8719038, -0.4840294, -1.941884, 0.8901961, 1, 0, 1,
-0.8680764, -0.7011412, 0.8857209, 0.8823529, 1, 0, 1,
-0.8608968, 1.168916, 1.044245, 0.8784314, 1, 0, 1,
-0.8596444, -0.007607073, -2.961149, 0.8705882, 1, 0, 1,
-0.8510446, -0.02321545, -1.617514, 0.8666667, 1, 0, 1,
-0.8501006, 0.3617394, -0.6308856, 0.8588235, 1, 0, 1,
-0.8456356, 0.1170044, -0.6504794, 0.854902, 1, 0, 1,
-0.8438485, 0.5004418, -2.837759, 0.8470588, 1, 0, 1,
-0.8370588, 0.3963554, -2.346551, 0.8431373, 1, 0, 1,
-0.8322697, -1.949398, -3.06358, 0.8352941, 1, 0, 1,
-0.8285185, -0.1553045, -2.181118, 0.8313726, 1, 0, 1,
-0.8262923, -0.5810145, -1.886806, 0.8235294, 1, 0, 1,
-0.815258, -2.184576, -0.7695831, 0.8196079, 1, 0, 1,
-0.8149503, 1.058167, -0.4089044, 0.8117647, 1, 0, 1,
-0.8109215, 1.758499, 0.1694661, 0.8078431, 1, 0, 1,
-0.8083562, -0.4409164, -2.537103, 0.8, 1, 0, 1,
-0.8012243, 2.191493, 1.169535, 0.7921569, 1, 0, 1,
-0.7994627, 1.878533, -2.305724, 0.7882353, 1, 0, 1,
-0.7952739, -0.1719338, -2.391322, 0.7803922, 1, 0, 1,
-0.7946691, 0.9298849, -1.227523, 0.7764706, 1, 0, 1,
-0.7942346, 0.9689773, 1.044083, 0.7686275, 1, 0, 1,
-0.7925879, 2.218207, 1.687942, 0.7647059, 1, 0, 1,
-0.791603, -0.04362949, 1.263698, 0.7568628, 1, 0, 1,
-0.7887801, -1.356462, -2.05436, 0.7529412, 1, 0, 1,
-0.7869775, 1.039773, -0.4121414, 0.7450981, 1, 0, 1,
-0.7864859, 1.705679, -0.6120871, 0.7411765, 1, 0, 1,
-0.7857674, 0.9995407, -2.074849, 0.7333333, 1, 0, 1,
-0.7841204, 0.9771092, -0.750857, 0.7294118, 1, 0, 1,
-0.7763273, 0.8381535, -2.139049, 0.7215686, 1, 0, 1,
-0.7742437, 0.4912811, -1.204682, 0.7176471, 1, 0, 1,
-0.7727208, -2.110104, -2.750004, 0.7098039, 1, 0, 1,
-0.7705388, -0.9528936, -1.892428, 0.7058824, 1, 0, 1,
-0.7690007, -0.9136244, -3.003371, 0.6980392, 1, 0, 1,
-0.7644645, 1.88661, -1.02709, 0.6901961, 1, 0, 1,
-0.7618232, -0.6908402, -0.9855758, 0.6862745, 1, 0, 1,
-0.760957, 1.202186, 0.1878027, 0.6784314, 1, 0, 1,
-0.7584442, -0.6622682, -2.12539, 0.6745098, 1, 0, 1,
-0.7575339, 0.1414294, -2.438469, 0.6666667, 1, 0, 1,
-0.7567894, 1.352406, -0.9822038, 0.6627451, 1, 0, 1,
-0.756512, 0.09521966, -0.301119, 0.654902, 1, 0, 1,
-0.7550847, 0.2985231, -1.1555, 0.6509804, 1, 0, 1,
-0.7530383, -0.4303717, -2.301974, 0.6431373, 1, 0, 1,
-0.7480607, 0.7491686, -1.052063, 0.6392157, 1, 0, 1,
-0.741694, 0.4623665, -1.76489, 0.6313726, 1, 0, 1,
-0.7415391, -0.6102846, -2.380337, 0.627451, 1, 0, 1,
-0.741206, 1.07474, 1.600415, 0.6196079, 1, 0, 1,
-0.7411534, 1.472857, -0.2146116, 0.6156863, 1, 0, 1,
-0.7393405, -1.449125, -2.085588, 0.6078432, 1, 0, 1,
-0.7355511, 0.9615925, -1.215078, 0.6039216, 1, 0, 1,
-0.7282264, -2.026318, -3.246981, 0.5960785, 1, 0, 1,
-0.7264335, -2.472007, -1.893725, 0.5882353, 1, 0, 1,
-0.7213392, 0.3782102, -2.658655, 0.5843138, 1, 0, 1,
-0.7180645, -0.5885899, -2.526927, 0.5764706, 1, 0, 1,
-0.7145967, 1.270243, 0.5301505, 0.572549, 1, 0, 1,
-0.7062895, -1.653188, -2.604077, 0.5647059, 1, 0, 1,
-0.7034932, 0.04344663, -2.239652, 0.5607843, 1, 0, 1,
-0.7031419, 1.288869, 0.3940013, 0.5529412, 1, 0, 1,
-0.6985403, 0.8165752, -0.5200502, 0.5490196, 1, 0, 1,
-0.6976712, -1.139626, -3.082577, 0.5411765, 1, 0, 1,
-0.6952768, 1.271675, -3.262045, 0.5372549, 1, 0, 1,
-0.6917763, 1.038139, -0.5050375, 0.5294118, 1, 0, 1,
-0.6790635, -0.09962375, -1.113109, 0.5254902, 1, 0, 1,
-0.66965, -0.7409058, -2.035775, 0.5176471, 1, 0, 1,
-0.6625556, -0.2582182, -1.658943, 0.5137255, 1, 0, 1,
-0.6623479, 0.6268637, -0.8463125, 0.5058824, 1, 0, 1,
-0.6557587, 1.282578, -1.817716, 0.5019608, 1, 0, 1,
-0.6528458, 1.300632, 0.1246706, 0.4941176, 1, 0, 1,
-0.6435537, -0.3052585, -2.691622, 0.4862745, 1, 0, 1,
-0.6408528, -0.03107147, -2.685383, 0.4823529, 1, 0, 1,
-0.627296, -1.650159, -3.855378, 0.4745098, 1, 0, 1,
-0.6162552, -1.923259, -3.406772, 0.4705882, 1, 0, 1,
-0.6156257, 0.4870012, -1.125975, 0.4627451, 1, 0, 1,
-0.6151243, -0.09721563, -1.712508, 0.4588235, 1, 0, 1,
-0.6132905, 2.049208, 1.131122, 0.4509804, 1, 0, 1,
-0.6124815, 2.306132, 0.2245499, 0.4470588, 1, 0, 1,
-0.6111363, 0.1130878, -0.3329608, 0.4392157, 1, 0, 1,
-0.6048661, 1.529796, -0.4149747, 0.4352941, 1, 0, 1,
-0.6003487, -1.307335, -1.876439, 0.427451, 1, 0, 1,
-0.5986899, -0.1424336, -2.112739, 0.4235294, 1, 0, 1,
-0.5979974, -0.2206847, -2.572398, 0.4156863, 1, 0, 1,
-0.5956753, 0.1052983, -2.402729, 0.4117647, 1, 0, 1,
-0.5924137, -1.022662, -2.081419, 0.4039216, 1, 0, 1,
-0.5908763, 0.2838507, -0.5249532, 0.3960784, 1, 0, 1,
-0.5899238, 1.415203, -0.5591694, 0.3921569, 1, 0, 1,
-0.589784, 0.7495254, 0.4315572, 0.3843137, 1, 0, 1,
-0.5879642, -0.6797938, -2.000806, 0.3803922, 1, 0, 1,
-0.5847088, 1.666073, -1.170197, 0.372549, 1, 0, 1,
-0.5815108, -0.3589101, -2.594841, 0.3686275, 1, 0, 1,
-0.5802412, -0.3787985, -2.763727, 0.3607843, 1, 0, 1,
-0.5801561, -0.6753266, -3.258073, 0.3568628, 1, 0, 1,
-0.5771938, -0.1309024, -2.894921, 0.3490196, 1, 0, 1,
-0.5765263, 0.4421211, -2.545283, 0.345098, 1, 0, 1,
-0.56735, -0.4147196, -2.984826, 0.3372549, 1, 0, 1,
-0.5672555, 0.315253, -1.793886, 0.3333333, 1, 0, 1,
-0.565801, 0.03983723, -1.583581, 0.3254902, 1, 0, 1,
-0.5645437, -0.4602048, -2.557027, 0.3215686, 1, 0, 1,
-0.5496966, -0.7977714, -2.359903, 0.3137255, 1, 0, 1,
-0.5495047, 2.411189, -2.536961, 0.3098039, 1, 0, 1,
-0.5478893, 0.05046193, -0.580588, 0.3019608, 1, 0, 1,
-0.5452926, -1.325104, -3.27528, 0.2941177, 1, 0, 1,
-0.5396518, -0.2879766, -2.26215, 0.2901961, 1, 0, 1,
-0.5366184, -1.093622, -2.804546, 0.282353, 1, 0, 1,
-0.5357315, -0.3087096, -1.289962, 0.2784314, 1, 0, 1,
-0.5356313, -0.02819718, -3.635349, 0.2705882, 1, 0, 1,
-0.5329357, 0.2720384, -2.247276, 0.2666667, 1, 0, 1,
-0.5326067, -0.9419192, -3.221313, 0.2588235, 1, 0, 1,
-0.5304826, -0.400833, -1.013274, 0.254902, 1, 0, 1,
-0.52926, -0.6853787, -2.945811, 0.2470588, 1, 0, 1,
-0.5278709, -0.2808965, -0.5022383, 0.2431373, 1, 0, 1,
-0.5236717, -1.053701, -3.971264, 0.2352941, 1, 0, 1,
-0.5229259, 0.9255438, 0.569459, 0.2313726, 1, 0, 1,
-0.5227189, -0.01141348, -0.4252261, 0.2235294, 1, 0, 1,
-0.5171188, -0.4571315, -0.2632141, 0.2196078, 1, 0, 1,
-0.5150372, -0.802292, -1.749216, 0.2117647, 1, 0, 1,
-0.5091547, -2.180474, -4.354071, 0.2078431, 1, 0, 1,
-0.5045187, -0.2511633, -1.180371, 0.2, 1, 0, 1,
-0.5044256, 1.034471, -0.4535868, 0.1921569, 1, 0, 1,
-0.5016088, 0.4527998, -0.4602885, 0.1882353, 1, 0, 1,
-0.4940352, -1.967782, -5.732602, 0.1803922, 1, 0, 1,
-0.4931405, -0.8596802, -3.924114, 0.1764706, 1, 0, 1,
-0.4926387, -0.7001078, -1.547866, 0.1686275, 1, 0, 1,
-0.4918189, 1.168599, -0.06222587, 0.1647059, 1, 0, 1,
-0.4847729, 1.290397, -1.554757, 0.1568628, 1, 0, 1,
-0.4840144, -1.606235, -5.060627, 0.1529412, 1, 0, 1,
-0.4753374, -0.237664, -1.367899, 0.145098, 1, 0, 1,
-0.4744033, -0.02607749, -1.516514, 0.1411765, 1, 0, 1,
-0.469973, -1.171579, -1.108355, 0.1333333, 1, 0, 1,
-0.4687898, -0.1823959, -2.560425, 0.1294118, 1, 0, 1,
-0.4579304, -2.081861, -3.01964, 0.1215686, 1, 0, 1,
-0.4553178, 0.4068373, -1.319019, 0.1176471, 1, 0, 1,
-0.4551531, -2.060775, -3.983918, 0.1098039, 1, 0, 1,
-0.4487416, 0.304922, -1.019313, 0.1058824, 1, 0, 1,
-0.4461361, -1.003261, -3.032339, 0.09803922, 1, 0, 1,
-0.4449961, 0.3664578, -1.189075, 0.09019608, 1, 0, 1,
-0.4413891, -1.079654, -2.381592, 0.08627451, 1, 0, 1,
-0.4406591, -0.5160275, -2.66999, 0.07843138, 1, 0, 1,
-0.4364296, -0.7365371, -4.21135, 0.07450981, 1, 0, 1,
-0.4346465, -2.163605, -5.023076, 0.06666667, 1, 0, 1,
-0.4304229, -0.2648751, -0.7129301, 0.0627451, 1, 0, 1,
-0.42899, -1.272511, -2.652656, 0.05490196, 1, 0, 1,
-0.4280104, -1.464075, -2.653917, 0.05098039, 1, 0, 1,
-0.4272621, -0.2768584, -3.11442, 0.04313726, 1, 0, 1,
-0.4218991, 0.4410043, 0.9825371, 0.03921569, 1, 0, 1,
-0.4204111, -1.318134, -4.595925, 0.03137255, 1, 0, 1,
-0.41965, -0.9278042, -3.731406, 0.02745098, 1, 0, 1,
-0.4143838, 1.306695, 0.5187123, 0.01960784, 1, 0, 1,
-0.4104197, 1.925981, -0.6622277, 0.01568628, 1, 0, 1,
-0.4041237, 1.451719, -0.3404019, 0.007843138, 1, 0, 1,
-0.4030449, -0.1945149, -3.054452, 0.003921569, 1, 0, 1,
-0.4008348, 1.604834, -1.96341, 0, 1, 0.003921569, 1,
-0.4007231, 0.7434125, -0.4220398, 0, 1, 0.01176471, 1,
-0.3997794, -0.0571095, -2.414593, 0, 1, 0.01568628, 1,
-0.3990761, -0.5303742, -0.5421333, 0, 1, 0.02352941, 1,
-0.3976665, -1.210615, -3.283367, 0, 1, 0.02745098, 1,
-0.3967061, -0.2484677, -2.277353, 0, 1, 0.03529412, 1,
-0.3892338, -0.9944286, -1.085916, 0, 1, 0.03921569, 1,
-0.3878532, -0.04284624, -0.9726631, 0, 1, 0.04705882, 1,
-0.3806639, -0.327889, -0.6436027, 0, 1, 0.05098039, 1,
-0.3758196, 0.591421, -0.7496927, 0, 1, 0.05882353, 1,
-0.3755051, 1.257607, -0.6837469, 0, 1, 0.0627451, 1,
-0.3729614, 0.9090427, 0.0535493, 0, 1, 0.07058824, 1,
-0.3727242, -0.8685023, -1.295487, 0, 1, 0.07450981, 1,
-0.3725479, -0.1108844, -1.96529, 0, 1, 0.08235294, 1,
-0.3711512, -0.7026724, -4.005327, 0, 1, 0.08627451, 1,
-0.3697372, -0.1659465, -1.021375, 0, 1, 0.09411765, 1,
-0.3670512, 1.619957, -0.6179332, 0, 1, 0.1019608, 1,
-0.3654509, 2.055583, -0.260643, 0, 1, 0.1058824, 1,
-0.3646377, 1.08858, 0.5644721, 0, 1, 0.1137255, 1,
-0.3643157, 0.4119745, 1.132901, 0, 1, 0.1176471, 1,
-0.3628385, -0.4150465, -2.436065, 0, 1, 0.1254902, 1,
-0.3616017, -0.6473839, -2.544416, 0, 1, 0.1294118, 1,
-0.3530698, 0.8659291, -1.366574, 0, 1, 0.1372549, 1,
-0.3523021, -1.396201, -4.361705, 0, 1, 0.1411765, 1,
-0.3472618, 1.014007, -0.3254157, 0, 1, 0.1490196, 1,
-0.3460096, -1.069662, -3.449287, 0, 1, 0.1529412, 1,
-0.3435862, 0.3340676, -1.655147, 0, 1, 0.1607843, 1,
-0.3433719, 1.422532, -1.165765, 0, 1, 0.1647059, 1,
-0.3428592, -0.6233783, -1.977819, 0, 1, 0.172549, 1,
-0.3425395, -0.6761734, -3.319361, 0, 1, 0.1764706, 1,
-0.3405591, -1.09037, -2.529205, 0, 1, 0.1843137, 1,
-0.339531, -0.4680849, -3.322352, 0, 1, 0.1882353, 1,
-0.3393886, 0.6614054, -1.980033, 0, 1, 0.1960784, 1,
-0.3360344, -0.04150073, -2.586861, 0, 1, 0.2039216, 1,
-0.3356916, 0.3788136, -0.007142572, 0, 1, 0.2078431, 1,
-0.3329639, -0.2037918, -2.011632, 0, 1, 0.2156863, 1,
-0.3319839, 2.063733, -1.203871, 0, 1, 0.2196078, 1,
-0.3317582, -0.9748905, -2.382407, 0, 1, 0.227451, 1,
-0.3308492, 0.5283849, -0.4791679, 0, 1, 0.2313726, 1,
-0.3195272, 0.6174199, -1.294187, 0, 1, 0.2392157, 1,
-0.3175063, -0.8426788, -3.60785, 0, 1, 0.2431373, 1,
-0.3149146, 1.584041, 0.438032, 0, 1, 0.2509804, 1,
-0.3141049, 0.3060445, -0.05704308, 0, 1, 0.254902, 1,
-0.3102358, -0.8155697, -3.981328, 0, 1, 0.2627451, 1,
-0.3094352, 0.6637858, -1.650087, 0, 1, 0.2666667, 1,
-0.3023625, 0.2949958, -2.177562, 0, 1, 0.2745098, 1,
-0.2997704, -0.547549, -3.215805, 0, 1, 0.2784314, 1,
-0.2988002, 0.4897032, 0.04385116, 0, 1, 0.2862745, 1,
-0.2907703, 1.972069, 0.4673767, 0, 1, 0.2901961, 1,
-0.2878923, -1.536788, -1.649381, 0, 1, 0.2980392, 1,
-0.2844639, -0.6627458, -3.170797, 0, 1, 0.3058824, 1,
-0.282853, 0.5276531, -0.01957162, 0, 1, 0.3098039, 1,
-0.2825615, -1.839731, -3.555463, 0, 1, 0.3176471, 1,
-0.2798054, -0.9093164, -3.906733, 0, 1, 0.3215686, 1,
-0.2771323, 0.9149661, -0.5518916, 0, 1, 0.3294118, 1,
-0.273403, -1.28915, -3.168746, 0, 1, 0.3333333, 1,
-0.2701717, 0.5982049, -2.700859, 0, 1, 0.3411765, 1,
-0.2669395, -0.2468771, -2.750441, 0, 1, 0.345098, 1,
-0.2602947, 0.4866437, 0.5367453, 0, 1, 0.3529412, 1,
-0.2591889, -1.680038, -3.901667, 0, 1, 0.3568628, 1,
-0.2584624, 0.5571069, -1.928028, 0, 1, 0.3647059, 1,
-0.2518383, -0.48998, -3.455471, 0, 1, 0.3686275, 1,
-0.2516338, 0.6174225, -0.7119575, 0, 1, 0.3764706, 1,
-0.2495644, -0.7742917, -0.6721686, 0, 1, 0.3803922, 1,
-0.2486249, 0.7113137, 0.8410973, 0, 1, 0.3882353, 1,
-0.2442239, 1.877521, -0.2091666, 0, 1, 0.3921569, 1,
-0.2404715, 0.2653817, 0.0488283, 0, 1, 0.4, 1,
-0.2381891, -0.1736445, -1.62347, 0, 1, 0.4078431, 1,
-0.2335003, 0.6810714, -1.960494, 0, 1, 0.4117647, 1,
-0.2288322, -0.03907504, -0.496235, 0, 1, 0.4196078, 1,
-0.2252876, 0.4702345, 0.4265989, 0, 1, 0.4235294, 1,
-0.2252855, 1.181392, -0.2358198, 0, 1, 0.4313726, 1,
-0.2215973, 0.1122865, -1.585699, 0, 1, 0.4352941, 1,
-0.2204891, -1.117634, -3.609758, 0, 1, 0.4431373, 1,
-0.2204619, -1.228118, -2.332968, 0, 1, 0.4470588, 1,
-0.2200386, -0.1962455, -3.213449, 0, 1, 0.454902, 1,
-0.2198204, 0.5000895, -0.5042919, 0, 1, 0.4588235, 1,
-0.218898, 1.074672, 0.6083883, 0, 1, 0.4666667, 1,
-0.2179575, -1.347609, -3.950366, 0, 1, 0.4705882, 1,
-0.2174571, 2.295285, 0.04145793, 0, 1, 0.4784314, 1,
-0.2111115, -0.1751232, -2.886348, 0, 1, 0.4823529, 1,
-0.2098514, -1.522809, -3.184323, 0, 1, 0.4901961, 1,
-0.2066496, 0.5865542, -0.705065, 0, 1, 0.4941176, 1,
-0.2046476, -0.3167674, -3.025986, 0, 1, 0.5019608, 1,
-0.1915224, 0.6987665, 1.02025, 0, 1, 0.509804, 1,
-0.189087, -1.484552, -2.745732, 0, 1, 0.5137255, 1,
-0.1875205, -1.890442, -3.176063, 0, 1, 0.5215687, 1,
-0.1875136, -1.126473, -3.220806, 0, 1, 0.5254902, 1,
-0.1852892, -0.7855222, -3.51542, 0, 1, 0.5333334, 1,
-0.1841654, -0.7265035, -2.609273, 0, 1, 0.5372549, 1,
-0.1808439, -0.02554951, -3.505046, 0, 1, 0.5450981, 1,
-0.1802873, -2.709319, -2.397777, 0, 1, 0.5490196, 1,
-0.1770807, 0.797509, 0.02320209, 0, 1, 0.5568628, 1,
-0.1750343, 0.8236249, 0.6181534, 0, 1, 0.5607843, 1,
-0.1728479, -0.1109285, -2.057456, 0, 1, 0.5686275, 1,
-0.1691066, 0.2762493, -2.098482, 0, 1, 0.572549, 1,
-0.1665158, -0.118089, -1.778916, 0, 1, 0.5803922, 1,
-0.1650128, -0.2137711, -2.548978, 0, 1, 0.5843138, 1,
-0.1592555, 0.667164, 0.6799127, 0, 1, 0.5921569, 1,
-0.1543537, 0.7699429, -0.7702965, 0, 1, 0.5960785, 1,
-0.1531908, -0.5214331, -4.189732, 0, 1, 0.6039216, 1,
-0.1513417, 0.3307488, -0.04729908, 0, 1, 0.6117647, 1,
-0.1483423, 0.1722936, -1.743167, 0, 1, 0.6156863, 1,
-0.1442988, 0.09418664, -0.889024, 0, 1, 0.6235294, 1,
-0.1397729, 0.5566098, -0.4653165, 0, 1, 0.627451, 1,
-0.1374115, 0.4083967, 2.203821, 0, 1, 0.6352941, 1,
-0.1348019, 1.001786, -0.7041329, 0, 1, 0.6392157, 1,
-0.1338225, -1.784043, -1.199362, 0, 1, 0.6470588, 1,
-0.1308679, -0.4877705, -2.64422, 0, 1, 0.6509804, 1,
-0.1300485, 0.7112548, -0.5226258, 0, 1, 0.6588235, 1,
-0.1299029, -0.1472815, -2.479566, 0, 1, 0.6627451, 1,
-0.1295929, 0.8877028, -1.815933, 0, 1, 0.6705883, 1,
-0.1278934, -0.2879579, -2.363979, 0, 1, 0.6745098, 1,
-0.1223491, -0.1460579, -2.206091, 0, 1, 0.682353, 1,
-0.1172073, 3.315823, 0.3807784, 0, 1, 0.6862745, 1,
-0.1170868, -0.1926996, -3.387394, 0, 1, 0.6941177, 1,
-0.1134122, -1.297385, -1.635635, 0, 1, 0.7019608, 1,
-0.1102682, 1.801141, 0.9185169, 0, 1, 0.7058824, 1,
-0.1100442, 2.390406, 0.8029156, 0, 1, 0.7137255, 1,
-0.1094602, -1.287736, -4.529316, 0, 1, 0.7176471, 1,
-0.1026906, 0.2714151, -0.2898559, 0, 1, 0.7254902, 1,
-0.09504054, -1.520882, -3.467007, 0, 1, 0.7294118, 1,
-0.09196388, -1.233455, -2.877634, 0, 1, 0.7372549, 1,
-0.08584689, 0.7135397, 1.469758, 0, 1, 0.7411765, 1,
-0.07951427, 0.28731, 0.3971463, 0, 1, 0.7490196, 1,
-0.07933296, 0.9086933, 1.538584, 0, 1, 0.7529412, 1,
-0.07858643, 0.5789386, 0.2550115, 0, 1, 0.7607843, 1,
-0.07606626, -1.075421, -4.516975, 0, 1, 0.7647059, 1,
-0.0754875, 0.4950266, 0.9826459, 0, 1, 0.772549, 1,
-0.07290851, -1.024647, -1.915551, 0, 1, 0.7764706, 1,
-0.0711947, -0.5156425, -4.361712, 0, 1, 0.7843137, 1,
-0.07042981, 0.2634095, -0.4112447, 0, 1, 0.7882353, 1,
-0.06997433, -1.305454, -3.663281, 0, 1, 0.7960784, 1,
-0.06988552, -0.4771369, -2.962988, 0, 1, 0.8039216, 1,
-0.06951749, -0.6414218, -2.624017, 0, 1, 0.8078431, 1,
-0.06856252, 0.04533963, -0.02288327, 0, 1, 0.8156863, 1,
-0.06202334, 1.662256, 0.2192758, 0, 1, 0.8196079, 1,
-0.06001395, -1.238103, -2.626055, 0, 1, 0.827451, 1,
-0.05900092, 0.3039385, 0.654475, 0, 1, 0.8313726, 1,
-0.05722454, 0.5550137, 0.3426515, 0, 1, 0.8392157, 1,
-0.0569724, 1.148056, -0.942076, 0, 1, 0.8431373, 1,
-0.05487377, 0.2927808, -0.8053406, 0, 1, 0.8509804, 1,
-0.05177851, -0.5635141, -2.330125, 0, 1, 0.854902, 1,
-0.0506813, -0.619655, -4.07484, 0, 1, 0.8627451, 1,
-0.04590083, -2.127551, -5.276998, 0, 1, 0.8666667, 1,
-0.04400056, 0.2184075, 0.2802361, 0, 1, 0.8745098, 1,
-0.04370481, -1.619929, -4.043119, 0, 1, 0.8784314, 1,
-0.0435871, 1.707439, 0.08451702, 0, 1, 0.8862745, 1,
-0.04339083, 0.7025859, 1.574725, 0, 1, 0.8901961, 1,
-0.043138, 0.7269052, 1.141064, 0, 1, 0.8980392, 1,
-0.03534047, 1.022575, -1.358002, 0, 1, 0.9058824, 1,
-0.02891922, 0.5023502, -0.9254979, 0, 1, 0.9098039, 1,
-0.02145192, 0.7682027, 1.251706, 0, 1, 0.9176471, 1,
-0.0192001, -0.6752914, -2.865474, 0, 1, 0.9215686, 1,
-0.01640103, 0.2449956, -0.2029259, 0, 1, 0.9294118, 1,
-0.01459247, -0.6999723, -3.559496, 0, 1, 0.9333333, 1,
-0.01318043, 0.6842023, 0.05390476, 0, 1, 0.9411765, 1,
-0.007972466, -0.8418801, -3.875117, 0, 1, 0.945098, 1,
-0.005217094, 1.592741, -2.056308, 0, 1, 0.9529412, 1,
0.002432115, -0.3365235, 3.420568, 0, 1, 0.9568627, 1,
0.006387054, 0.005836072, 1.47014, 0, 1, 0.9647059, 1,
0.006502203, -0.3036329, 2.726127, 0, 1, 0.9686275, 1,
0.008825757, 1.070768, 1.791851, 0, 1, 0.9764706, 1,
0.008993082, 0.5470448, 0.01140502, 0, 1, 0.9803922, 1,
0.0109866, -1.283826, 3.281434, 0, 1, 0.9882353, 1,
0.02133579, 0.9609414, -0.5612157, 0, 1, 0.9921569, 1,
0.0235273, 0.04671825, 3.169152, 0, 1, 1, 1,
0.02820061, 0.7366279, -0.09085814, 0, 0.9921569, 1, 1,
0.0286973, -1.622836, 3.16584, 0, 0.9882353, 1, 1,
0.03135988, 1.228898, -1.43239, 0, 0.9803922, 1, 1,
0.03732046, -0.4364049, 3.924216, 0, 0.9764706, 1, 1,
0.04625615, -0.3321117, 2.612144, 0, 0.9686275, 1, 1,
0.0517689, -0.3309436, 3.791338, 0, 0.9647059, 1, 1,
0.05462531, -0.5329835, 4.887966, 0, 0.9568627, 1, 1,
0.05527526, -1.507611, 3.218257, 0, 0.9529412, 1, 1,
0.05739771, 0.369106, 0.4314533, 0, 0.945098, 1, 1,
0.05827846, -0.5440875, 2.803282, 0, 0.9411765, 1, 1,
0.06602293, 2.115452, 0.2650675, 0, 0.9333333, 1, 1,
0.0770671, 0.7926991, -0.7538424, 0, 0.9294118, 1, 1,
0.0775403, 0.0140977, 0.2007251, 0, 0.9215686, 1, 1,
0.07834104, -0.5592425, 5.049343, 0, 0.9176471, 1, 1,
0.07929403, 0.6457102, -0.8355285, 0, 0.9098039, 1, 1,
0.07935321, -0.2419331, 3.120879, 0, 0.9058824, 1, 1,
0.0834915, -1.205315, 2.698193, 0, 0.8980392, 1, 1,
0.08442402, 0.3933091, 1.06122, 0, 0.8901961, 1, 1,
0.08619832, 1.325087, -0.2730724, 0, 0.8862745, 1, 1,
0.08628581, -1.696923, 3.366042, 0, 0.8784314, 1, 1,
0.08798377, 1.056261, -1.468561, 0, 0.8745098, 1, 1,
0.08819604, -2.505247, 3.50638, 0, 0.8666667, 1, 1,
0.09180072, -0.4032492, 5.200837, 0, 0.8627451, 1, 1,
0.09633681, 0.5702343, 1.330349, 0, 0.854902, 1, 1,
0.09808901, 0.2566344, 0.3227113, 0, 0.8509804, 1, 1,
0.1023852, -0.6272919, 2.109904, 0, 0.8431373, 1, 1,
0.110231, 1.216394, 1.045814, 0, 0.8392157, 1, 1,
0.1118623, -1.397353, 3.056225, 0, 0.8313726, 1, 1,
0.1141305, -1.224215, 3.725397, 0, 0.827451, 1, 1,
0.1149244, 0.3245772, -0.5763416, 0, 0.8196079, 1, 1,
0.1153662, -0.707071, 2.854733, 0, 0.8156863, 1, 1,
0.117508, -1.390234, 2.250386, 0, 0.8078431, 1, 1,
0.1289831, 0.1276009, 0.8552791, 0, 0.8039216, 1, 1,
0.1296048, -1.920229, 3.021986, 0, 0.7960784, 1, 1,
0.1305583, -1.197227, 3.816631, 0, 0.7882353, 1, 1,
0.1307337, 0.8116697, -0.5662008, 0, 0.7843137, 1, 1,
0.1324581, -0.5786465, 4.489734, 0, 0.7764706, 1, 1,
0.1333651, -2.244681, 2.415677, 0, 0.772549, 1, 1,
0.1337398, 0.02001234, 0.7430985, 0, 0.7647059, 1, 1,
0.1346546, 0.09150494, 0.8259533, 0, 0.7607843, 1, 1,
0.1358072, 1.536571, 0.3825646, 0, 0.7529412, 1, 1,
0.1378872, -1.092392, 2.498053, 0, 0.7490196, 1, 1,
0.1394666, 0.3367847, -1.589304, 0, 0.7411765, 1, 1,
0.1461149, -1.503573, 3.188115, 0, 0.7372549, 1, 1,
0.1476909, -0.6025587, 4.838241, 0, 0.7294118, 1, 1,
0.1519673, 1.59341, -0.1862432, 0, 0.7254902, 1, 1,
0.1541972, 0.9717199, 0.5872575, 0, 0.7176471, 1, 1,
0.155677, -0.2398582, 2.322001, 0, 0.7137255, 1, 1,
0.1599886, -1.023778, 2.661671, 0, 0.7058824, 1, 1,
0.1645879, 0.2423958, 1.245443, 0, 0.6980392, 1, 1,
0.1646442, -0.4467908, 2.233685, 0, 0.6941177, 1, 1,
0.1733799, 0.8793839, -0.8885035, 0, 0.6862745, 1, 1,
0.1778955, 0.5937118, 1.237199, 0, 0.682353, 1, 1,
0.1792287, -0.8940726, 3.00637, 0, 0.6745098, 1, 1,
0.1849272, 0.4897438, 0.1526218, 0, 0.6705883, 1, 1,
0.1849626, -0.7696363, 3.23262, 0, 0.6627451, 1, 1,
0.1855981, -2.160752, 4.600105, 0, 0.6588235, 1, 1,
0.186972, -1.526455, 1.65678, 0, 0.6509804, 1, 1,
0.1871818, 0.8519621, -1.01101, 0, 0.6470588, 1, 1,
0.187332, -1.595137, 3.426742, 0, 0.6392157, 1, 1,
0.1874074, -0.2815562, 2.527345, 0, 0.6352941, 1, 1,
0.1875393, -1.431716, 2.795775, 0, 0.627451, 1, 1,
0.1892627, -0.188162, 2.947414, 0, 0.6235294, 1, 1,
0.1905172, 0.1679295, 2.739399, 0, 0.6156863, 1, 1,
0.1936736, 0.6047389, 0.1089052, 0, 0.6117647, 1, 1,
0.1942817, 0.9645776, 0.04436774, 0, 0.6039216, 1, 1,
0.1950862, 1.090821, 0.4850225, 0, 0.5960785, 1, 1,
0.1974275, -1.000617, 1.99594, 0, 0.5921569, 1, 1,
0.1980376, 0.7169677, -0.2549891, 0, 0.5843138, 1, 1,
0.2002376, 0.259086, 2.226254, 0, 0.5803922, 1, 1,
0.2012011, 0.5394256, -1.398785, 0, 0.572549, 1, 1,
0.2040569, -0.9647927, 3.514767, 0, 0.5686275, 1, 1,
0.2044594, -1.42667, 4.353108, 0, 0.5607843, 1, 1,
0.2130531, 0.5790747, -0.01064987, 0, 0.5568628, 1, 1,
0.2148247, 0.920046, -0.1092678, 0, 0.5490196, 1, 1,
0.2184833, -0.1384384, 3.083351, 0, 0.5450981, 1, 1,
0.2257934, -0.378785, 2.655019, 0, 0.5372549, 1, 1,
0.2286386, 0.4791448, 1.143625, 0, 0.5333334, 1, 1,
0.2329461, -0.6451681, 3.139574, 0, 0.5254902, 1, 1,
0.2376845, 1.38619, 0.2139101, 0, 0.5215687, 1, 1,
0.2383547, 1.289611, -0.6170633, 0, 0.5137255, 1, 1,
0.2389123, -2.259475, 4.872144, 0, 0.509804, 1, 1,
0.2435202, -0.7243752, 2.151266, 0, 0.5019608, 1, 1,
0.2484134, -0.8723758, 1.759644, 0, 0.4941176, 1, 1,
0.2492501, 1.035479, 0.4110344, 0, 0.4901961, 1, 1,
0.2494331, -0.2238092, 1.085504, 0, 0.4823529, 1, 1,
0.2511793, 0.674364, 0.4743113, 0, 0.4784314, 1, 1,
0.2512105, -0.1135601, 3.251798, 0, 0.4705882, 1, 1,
0.2515998, 0.6678431, -0.7639301, 0, 0.4666667, 1, 1,
0.2549907, 1.08052, 0.7844425, 0, 0.4588235, 1, 1,
0.2572439, -0.7052625, 2.694558, 0, 0.454902, 1, 1,
0.258296, -0.7728475, 3.453358, 0, 0.4470588, 1, 1,
0.2591085, -0.05004312, 0.7293228, 0, 0.4431373, 1, 1,
0.2595217, 1.244856, 1.725438, 0, 0.4352941, 1, 1,
0.2659363, 0.2888524, 2.449667, 0, 0.4313726, 1, 1,
0.2681144, -0.9176628, 1.96618, 0, 0.4235294, 1, 1,
0.2715227, 0.1297437, -0.9514486, 0, 0.4196078, 1, 1,
0.2732589, -0.2218378, 2.594335, 0, 0.4117647, 1, 1,
0.2743609, -1.74928, 3.348819, 0, 0.4078431, 1, 1,
0.2761831, -0.5534876, 1.280966, 0, 0.4, 1, 1,
0.2789757, -0.2447285, 1.622866, 0, 0.3921569, 1, 1,
0.2852466, 0.2288333, 1.534146, 0, 0.3882353, 1, 1,
0.2938398, -1.224768, 2.625337, 0, 0.3803922, 1, 1,
0.2964153, -1.208772, 1.37368, 0, 0.3764706, 1, 1,
0.2991435, 1.281651, 1.27959, 0, 0.3686275, 1, 1,
0.2997169, 1.987636, 0.7979976, 0, 0.3647059, 1, 1,
0.3004524, -0.05649161, 1.436467, 0, 0.3568628, 1, 1,
0.3013245, 0.6658147, 0.4981151, 0, 0.3529412, 1, 1,
0.309268, 0.5096611, 2.208265, 0, 0.345098, 1, 1,
0.3159239, -0.9246657, 3.935114, 0, 0.3411765, 1, 1,
0.3191929, -0.1885293, 1.5612, 0, 0.3333333, 1, 1,
0.3207233, -0.4656534, 2.777559, 0, 0.3294118, 1, 1,
0.320779, 0.008886542, 1.207993, 0, 0.3215686, 1, 1,
0.3267175, -1.577323, 4.052389, 0, 0.3176471, 1, 1,
0.3327212, 1.306481, 2.423068, 0, 0.3098039, 1, 1,
0.3344876, -0.6323166, 2.733618, 0, 0.3058824, 1, 1,
0.3347746, -0.0912885, 1.441672, 0, 0.2980392, 1, 1,
0.3365902, 2.69186, -1.083185, 0, 0.2901961, 1, 1,
0.3427698, 0.9848155, -0.3478503, 0, 0.2862745, 1, 1,
0.3446054, 0.09470831, 0.5945305, 0, 0.2784314, 1, 1,
0.3516918, 0.8131128, 0.05369532, 0, 0.2745098, 1, 1,
0.352625, 0.5696267, 0.2307556, 0, 0.2666667, 1, 1,
0.355489, -0.6733893, 2.44133, 0, 0.2627451, 1, 1,
0.3565239, 0.5617946, 1.200939, 0, 0.254902, 1, 1,
0.3586865, 0.7932198, 0.224683, 0, 0.2509804, 1, 1,
0.3601412, 1.242185, 1.639647, 0, 0.2431373, 1, 1,
0.3627284, 0.526713, 1.457466, 0, 0.2392157, 1, 1,
0.3655119, 0.3949736, 1.468779, 0, 0.2313726, 1, 1,
0.3662466, -0.3003444, 2.853745, 0, 0.227451, 1, 1,
0.3697564, 1.391045, 2.037964, 0, 0.2196078, 1, 1,
0.3710482, 0.7750153, -0.3363885, 0, 0.2156863, 1, 1,
0.3721967, -1.995291, 3.594981, 0, 0.2078431, 1, 1,
0.3769393, 0.3823326, 1.683724, 0, 0.2039216, 1, 1,
0.378794, -0.9533725, 3.72598, 0, 0.1960784, 1, 1,
0.383437, 2.566446, -0.09259708, 0, 0.1882353, 1, 1,
0.385081, 1.190324, 0.2873735, 0, 0.1843137, 1, 1,
0.3853112, 0.03632721, 2.018316, 0, 0.1764706, 1, 1,
0.3894666, -0.06804846, 2.024221, 0, 0.172549, 1, 1,
0.3898434, -0.08576251, 2.337628, 0, 0.1647059, 1, 1,
0.397177, 0.6607699, 1.368007, 0, 0.1607843, 1, 1,
0.4045092, -0.9069452, 2.672856, 0, 0.1529412, 1, 1,
0.4077018, 1.811346, -0.4034179, 0, 0.1490196, 1, 1,
0.4098924, 0.4471986, 0.1625656, 0, 0.1411765, 1, 1,
0.4137023, -1.479374, 1.924551, 0, 0.1372549, 1, 1,
0.4138841, -1.102576, 2.447449, 0, 0.1294118, 1, 1,
0.4149655, -0.6444272, 1.826359, 0, 0.1254902, 1, 1,
0.4156911, -1.387609, 2.212898, 0, 0.1176471, 1, 1,
0.417221, -0.9386685, 3.371602, 0, 0.1137255, 1, 1,
0.4204416, -1.840399, 5.150842, 0, 0.1058824, 1, 1,
0.42763, -1.110703, 4.860242, 0, 0.09803922, 1, 1,
0.4280855, -1.604291, 3.205524, 0, 0.09411765, 1, 1,
0.429256, -0.8482214, 1.570639, 0, 0.08627451, 1, 1,
0.4360245, 0.4414183, -0.2375231, 0, 0.08235294, 1, 1,
0.4373591, -0.1431199, 3.301253, 0, 0.07450981, 1, 1,
0.4387573, 0.3774435, 2.327446, 0, 0.07058824, 1, 1,
0.4459217, -1.54717, 1.957044, 0, 0.0627451, 1, 1,
0.4475307, 1.113258, -2.022531, 0, 0.05882353, 1, 1,
0.4479667, 0.8152701, -1.662991, 0, 0.05098039, 1, 1,
0.4508315, -0.1394289, 1.322224, 0, 0.04705882, 1, 1,
0.4533904, 1.287324, -1.272742, 0, 0.03921569, 1, 1,
0.4556851, 1.541816, 1.216734, 0, 0.03529412, 1, 1,
0.4571717, -0.419632, 1.705052, 0, 0.02745098, 1, 1,
0.4632659, -1.116097, 2.926085, 0, 0.02352941, 1, 1,
0.4656091, 0.6469296, 1.313859, 0, 0.01568628, 1, 1,
0.4688496, 1.587247, -0.5747541, 0, 0.01176471, 1, 1,
0.4701996, 0.3758038, -0.06252938, 0, 0.003921569, 1, 1,
0.4708408, -0.8131214, 2.202706, 0.003921569, 0, 1, 1,
0.4712769, -0.7714859, 2.743278, 0.007843138, 0, 1, 1,
0.4748904, 2.11805, 0.0645849, 0.01568628, 0, 1, 1,
0.4772222, -0.0135196, 2.434896, 0.01960784, 0, 1, 1,
0.4777839, -0.2116126, 2.795641, 0.02745098, 0, 1, 1,
0.4779247, 0.01704036, 0.148813, 0.03137255, 0, 1, 1,
0.4802544, -0.567535, 1.534399, 0.03921569, 0, 1, 1,
0.480391, 0.5811359, 1.504803, 0.04313726, 0, 1, 1,
0.4842626, 0.8535969, -0.08270666, 0.05098039, 0, 1, 1,
0.4864512, 0.7327279, 0.5296168, 0.05490196, 0, 1, 1,
0.4878269, -0.7211044, 2.496307, 0.0627451, 0, 1, 1,
0.4881389, 1.107617, -0.02803686, 0.06666667, 0, 1, 1,
0.4928662, 0.4246974, 0.5383916, 0.07450981, 0, 1, 1,
0.4981915, -0.794525, 2.226944, 0.07843138, 0, 1, 1,
0.502069, -1.72012, 2.108756, 0.08627451, 0, 1, 1,
0.5021674, -0.6370674, 1.590977, 0.09019608, 0, 1, 1,
0.5029554, 0.001687971, 0.5246023, 0.09803922, 0, 1, 1,
0.5045171, 0.9703687, -1.437756, 0.1058824, 0, 1, 1,
0.5088121, -0.4235791, 1.683201, 0.1098039, 0, 1, 1,
0.5090776, 2.078552, 1.007878, 0.1176471, 0, 1, 1,
0.5099702, -0.3913628, 2.169117, 0.1215686, 0, 1, 1,
0.5114384, 0.4750231, 0.8523164, 0.1294118, 0, 1, 1,
0.5158969, -1.072346, 3.750757, 0.1333333, 0, 1, 1,
0.5170745, -0.8435099, 2.771527, 0.1411765, 0, 1, 1,
0.5200182, -0.1704062, 1.178372, 0.145098, 0, 1, 1,
0.5291416, 1.249404, 0.7164473, 0.1529412, 0, 1, 1,
0.5336105, -0.09881094, 3.442174, 0.1568628, 0, 1, 1,
0.5348443, 0.7753022, 0.09258054, 0.1647059, 0, 1, 1,
0.5376601, -0.2350811, 2.759249, 0.1686275, 0, 1, 1,
0.5387911, -0.1840407, 3.793209, 0.1764706, 0, 1, 1,
0.5421574, -1.78871, 3.512784, 0.1803922, 0, 1, 1,
0.5421653, -0.2691736, 2.059709, 0.1882353, 0, 1, 1,
0.5455308, 1.470302, 0.5620843, 0.1921569, 0, 1, 1,
0.5527521, 0.7992808, -2.680353, 0.2, 0, 1, 1,
0.554251, 1.524415, -0.151332, 0.2078431, 0, 1, 1,
0.5551645, 0.1246017, 1.977367, 0.2117647, 0, 1, 1,
0.5615258, 1.127654, 0.4666051, 0.2196078, 0, 1, 1,
0.561931, -1.740365, 0.6210666, 0.2235294, 0, 1, 1,
0.5654392, 0.6532441, 2.439447, 0.2313726, 0, 1, 1,
0.568264, -0.8812456, 3.913477, 0.2352941, 0, 1, 1,
0.5683478, -0.9558818, 1.247249, 0.2431373, 0, 1, 1,
0.5700251, -1.540379, 1.339543, 0.2470588, 0, 1, 1,
0.570165, 1.925538, 0.835181, 0.254902, 0, 1, 1,
0.5733238, -0.4785444, 2.058345, 0.2588235, 0, 1, 1,
0.5786626, -1.171062, 3.488451, 0.2666667, 0, 1, 1,
0.5797603, -2.089328, 4.010882, 0.2705882, 0, 1, 1,
0.5805202, 0.08268283, 1.122647, 0.2784314, 0, 1, 1,
0.5816061, 0.6855882, -1.616802, 0.282353, 0, 1, 1,
0.5845096, -0.1931489, 1.773189, 0.2901961, 0, 1, 1,
0.5939385, -0.549638, 1.120257, 0.2941177, 0, 1, 1,
0.5945289, -0.9449444, 2.000931, 0.3019608, 0, 1, 1,
0.601253, 0.5943493, 0.8806525, 0.3098039, 0, 1, 1,
0.6050441, 0.9233155, 0.7155867, 0.3137255, 0, 1, 1,
0.6102527, -1.262373, 2.459132, 0.3215686, 0, 1, 1,
0.6110892, 1.987069, 1.538827, 0.3254902, 0, 1, 1,
0.6111804, -0.6887026, 4.892725, 0.3333333, 0, 1, 1,
0.6128705, -0.8667575, 2.605247, 0.3372549, 0, 1, 1,
0.6153046, 1.484349, 1.40404, 0.345098, 0, 1, 1,
0.6156942, -0.7876844, 3.48585, 0.3490196, 0, 1, 1,
0.6161164, -0.01971656, 0.7685494, 0.3568628, 0, 1, 1,
0.6177793, -0.3851458, 3.123145, 0.3607843, 0, 1, 1,
0.6213862, -1.816074, 1.854657, 0.3686275, 0, 1, 1,
0.6218603, -1.941786, 1.624901, 0.372549, 0, 1, 1,
0.6237748, 0.5342033, -0.07158913, 0.3803922, 0, 1, 1,
0.6246078, -0.4499766, 1.32416, 0.3843137, 0, 1, 1,
0.6304379, 0.3494552, 0.727605, 0.3921569, 0, 1, 1,
0.6391899, 0.8646424, 1.685909, 0.3960784, 0, 1, 1,
0.6405978, -0.8729626, 3.419631, 0.4039216, 0, 1, 1,
0.6418967, 1.560092, -0.02811224, 0.4117647, 0, 1, 1,
0.6503972, -0.1519447, 1.429991, 0.4156863, 0, 1, 1,
0.6549744, 1.563257, 0.290307, 0.4235294, 0, 1, 1,
0.6567246, -0.5972562, 0.9708516, 0.427451, 0, 1, 1,
0.6579375, 0.6115656, 1.797351, 0.4352941, 0, 1, 1,
0.6626693, -2.310306, 3.055565, 0.4392157, 0, 1, 1,
0.6644779, -1.476179, 2.621729, 0.4470588, 0, 1, 1,
0.6653134, -0.1961343, 3.062579, 0.4509804, 0, 1, 1,
0.6700398, -0.4863606, 1.032772, 0.4588235, 0, 1, 1,
0.6740821, 0.2656339, 0.5546759, 0.4627451, 0, 1, 1,
0.6828527, -0.005833713, 1.740752, 0.4705882, 0, 1, 1,
0.6861672, 1.552027, 0.3464487, 0.4745098, 0, 1, 1,
0.69069, -0.224397, 2.341356, 0.4823529, 0, 1, 1,
0.6907204, -0.6078686, 1.670261, 0.4862745, 0, 1, 1,
0.6959972, -0.8297756, 1.837385, 0.4941176, 0, 1, 1,
0.696638, -0.2530259, 0.9064307, 0.5019608, 0, 1, 1,
0.6986982, -0.8009678, 2.734313, 0.5058824, 0, 1, 1,
0.6994382, 0.3006794, 1.348203, 0.5137255, 0, 1, 1,
0.7020882, 0.4061825, 1.092588, 0.5176471, 0, 1, 1,
0.7032071, 0.1885456, 1.323266, 0.5254902, 0, 1, 1,
0.704402, 0.7922168, -0.7257985, 0.5294118, 0, 1, 1,
0.7118281, 1.712481, -0.3214121, 0.5372549, 0, 1, 1,
0.7123203, -1.74315, 2.047431, 0.5411765, 0, 1, 1,
0.7133361, 0.7135292, 0.9601595, 0.5490196, 0, 1, 1,
0.7178509, -0.1974136, 0.5607109, 0.5529412, 0, 1, 1,
0.7236637, -0.2943073, 0.9320995, 0.5607843, 0, 1, 1,
0.7248033, -0.2549858, 2.41323, 0.5647059, 0, 1, 1,
0.7252457, -1.098775, 2.878297, 0.572549, 0, 1, 1,
0.7283828, -2.842452, 1.808529, 0.5764706, 0, 1, 1,
0.7332833, -0.004292066, 1.976404, 0.5843138, 0, 1, 1,
0.7374899, 1.107306, 1.392469, 0.5882353, 0, 1, 1,
0.738885, -2.158214, 2.233733, 0.5960785, 0, 1, 1,
0.7476993, -2.364212, 1.772018, 0.6039216, 0, 1, 1,
0.7491493, 1.358853, 1.132087, 0.6078432, 0, 1, 1,
0.7491782, -1.16173, 2.434505, 0.6156863, 0, 1, 1,
0.7497163, 0.2942331, 0.4980134, 0.6196079, 0, 1, 1,
0.7523855, -1.035857, 1.171124, 0.627451, 0, 1, 1,
0.7591054, 0.07290254, 2.735857, 0.6313726, 0, 1, 1,
0.7618943, 0.9895582, 1.552059, 0.6392157, 0, 1, 1,
0.7621746, 0.536165, 0.5135395, 0.6431373, 0, 1, 1,
0.7632303, -1.31452, 3.482364, 0.6509804, 0, 1, 1,
0.7651566, 1.504134, 1.125838, 0.654902, 0, 1, 1,
0.7717609, -0.04860039, 2.436593, 0.6627451, 0, 1, 1,
0.7771786, 0.4609941, 1.053849, 0.6666667, 0, 1, 1,
0.7824864, 0.763083, 1.240117, 0.6745098, 0, 1, 1,
0.7842118, 0.2869316, 0.6955566, 0.6784314, 0, 1, 1,
0.7863595, 1.451093, 1.889852, 0.6862745, 0, 1, 1,
0.7879869, -1.832575, 1.201773, 0.6901961, 0, 1, 1,
0.7956426, -0.1239955, 1.77224, 0.6980392, 0, 1, 1,
0.8004199, -0.6175687, 2.661597, 0.7058824, 0, 1, 1,
0.8033569, -0.5449312, 2.813615, 0.7098039, 0, 1, 1,
0.8096763, -0.7127975, 1.696231, 0.7176471, 0, 1, 1,
0.8131475, 0.4786731, 1.57561, 0.7215686, 0, 1, 1,
0.8160183, 2.339067, 0.2272067, 0.7294118, 0, 1, 1,
0.8255054, -1.07512, 2.846928, 0.7333333, 0, 1, 1,
0.8271272, -0.3016692, 1.762251, 0.7411765, 0, 1, 1,
0.8287717, -0.8919281, 2.195734, 0.7450981, 0, 1, 1,
0.8294691, -0.3276541, 1.74885, 0.7529412, 0, 1, 1,
0.8370762, -0.4149143, 1.582796, 0.7568628, 0, 1, 1,
0.8402254, 0.4612143, 0.8976582, 0.7647059, 0, 1, 1,
0.841844, -0.3983049, 2.192477, 0.7686275, 0, 1, 1,
0.8488766, -0.3241151, 1.260043, 0.7764706, 0, 1, 1,
0.8501644, 0.04603062, 0.9419606, 0.7803922, 0, 1, 1,
0.8546799, -1.860672, 2.311939, 0.7882353, 0, 1, 1,
0.8551037, -0.584792, 1.904048, 0.7921569, 0, 1, 1,
0.8585813, -0.6832588, 0.00356353, 0.8, 0, 1, 1,
0.859848, -0.1068019, 2.01158, 0.8078431, 0, 1, 1,
0.8702727, -0.4706048, 0.7745895, 0.8117647, 0, 1, 1,
0.8716905, -0.2534671, 2.181973, 0.8196079, 0, 1, 1,
0.8719288, 0.9225017, 0.9914294, 0.8235294, 0, 1, 1,
0.8774129, -1.482606, 1.646601, 0.8313726, 0, 1, 1,
0.8829858, -0.9217305, 3.447782, 0.8352941, 0, 1, 1,
0.8832404, 0.07843999, 2.926004, 0.8431373, 0, 1, 1,
0.883742, -2.188841, 3.245783, 0.8470588, 0, 1, 1,
0.884802, 0.6132485, 0.9840444, 0.854902, 0, 1, 1,
0.8872449, 0.1587172, 0.3142165, 0.8588235, 0, 1, 1,
0.8879793, -0.6629925, 3.350842, 0.8666667, 0, 1, 1,
0.8930771, -0.04312225, 1.328201, 0.8705882, 0, 1, 1,
0.8985312, -0.7370178, 0.9504545, 0.8784314, 0, 1, 1,
0.898548, -0.1700814, 2.281796, 0.8823529, 0, 1, 1,
0.9009452, 0.7922014, 2.589682, 0.8901961, 0, 1, 1,
0.9076287, -1.673598, 3.034021, 0.8941177, 0, 1, 1,
0.9083996, 0.2524793, 1.02552, 0.9019608, 0, 1, 1,
0.9127256, -0.3107324, 2.613238, 0.9098039, 0, 1, 1,
0.9150472, 1.102882, 0.1595621, 0.9137255, 0, 1, 1,
0.9177263, -0.1007911, 1.163772, 0.9215686, 0, 1, 1,
0.9222226, -0.4357687, 2.566209, 0.9254902, 0, 1, 1,
0.9222826, -0.8925329, 3.552881, 0.9333333, 0, 1, 1,
0.9326727, 1.007315, 1.771249, 0.9372549, 0, 1, 1,
0.9373146, -1.311365, 1.633198, 0.945098, 0, 1, 1,
0.9423649, -1.340389, 2.026311, 0.9490196, 0, 1, 1,
0.9472457, 0.7063056, -0.1314559, 0.9568627, 0, 1, 1,
0.9506608, 0.4989083, 2.328763, 0.9607843, 0, 1, 1,
0.9535832, 1.296132, 1.55223, 0.9686275, 0, 1, 1,
0.9546318, 0.4942158, 1.421613, 0.972549, 0, 1, 1,
0.9560898, -0.1668044, 0.553753, 0.9803922, 0, 1, 1,
0.9635504, -0.9046686, 3.262313, 0.9843137, 0, 1, 1,
0.9640796, -0.7683389, 0.8613867, 0.9921569, 0, 1, 1,
0.9652786, -1.100885, 1.588677, 0.9960784, 0, 1, 1,
0.969465, 0.001621176, 2.135731, 1, 0, 0.9960784, 1,
0.9806258, -0.3888302, 3.113168, 1, 0, 0.9882353, 1,
0.9824906, 0.7958436, 0.6267874, 1, 0, 0.9843137, 1,
0.9857239, 0.38076, 2.143569, 1, 0, 0.9764706, 1,
0.9864888, 1.952675, -0.7261158, 1, 0, 0.972549, 1,
0.9931808, -0.4772482, 3.464891, 1, 0, 0.9647059, 1,
0.9952784, -1.42945, 1.193476, 1, 0, 0.9607843, 1,
0.9968904, 1.910009, 1.956603, 1, 0, 0.9529412, 1,
0.9999648, 0.3492384, 3.332442, 1, 0, 0.9490196, 1,
1.000333, 0.181354, -0.05713683, 1, 0, 0.9411765, 1,
1.003313, 1.336216, -0.2360914, 1, 0, 0.9372549, 1,
1.003741, -0.3667075, 2.76764, 1, 0, 0.9294118, 1,
1.003801, -0.1095704, 3.62308, 1, 0, 0.9254902, 1,
1.006791, -0.04998619, 2.132463, 1, 0, 0.9176471, 1,
1.006942, 0.1013411, 0.1533038, 1, 0, 0.9137255, 1,
1.008812, 0.6120613, 1.102951, 1, 0, 0.9058824, 1,
1.009564, 1.961994, 1.043248, 1, 0, 0.9019608, 1,
1.010206, 1.768492, 0.7361404, 1, 0, 0.8941177, 1,
1.012194, 0.2601804, 3.2834, 1, 0, 0.8862745, 1,
1.012992, -1.178522, 3.79633, 1, 0, 0.8823529, 1,
1.015878, -0.561311, 1.46456, 1, 0, 0.8745098, 1,
1.018239, -0.368669, 1.770645, 1, 0, 0.8705882, 1,
1.02098, 0.9147616, -0.8121396, 1, 0, 0.8627451, 1,
1.02931, 0.09051487, 1.681225, 1, 0, 0.8588235, 1,
1.035516, 0.7107012, 2.199375, 1, 0, 0.8509804, 1,
1.036348, 0.4766665, 1.064592, 1, 0, 0.8470588, 1,
1.037812, -0.9157166, 2.59412, 1, 0, 0.8392157, 1,
1.039897, 0.2145798, 0.1874045, 1, 0, 0.8352941, 1,
1.046471, -0.6580569, 2.640651, 1, 0, 0.827451, 1,
1.046499, 0.3958745, 0.3196557, 1, 0, 0.8235294, 1,
1.047379, -0.8650889, 3.74244, 1, 0, 0.8156863, 1,
1.047725, -0.5928843, 2.539584, 1, 0, 0.8117647, 1,
1.048531, 1.093174, -0.3870912, 1, 0, 0.8039216, 1,
1.050146, -1.334243, 1.361927, 1, 0, 0.7960784, 1,
1.057181, 1.23723, -0.4752026, 1, 0, 0.7921569, 1,
1.057701, 0.93294, 1.164886, 1, 0, 0.7843137, 1,
1.066889, 0.1453477, 1.694805, 1, 0, 0.7803922, 1,
1.067613, 1.345503, 0.9969627, 1, 0, 0.772549, 1,
1.068905, 0.6887577, 1.415124, 1, 0, 0.7686275, 1,
1.06941, -1.712193, 1.851511, 1, 0, 0.7607843, 1,
1.069824, -0.7369245, 2.199216, 1, 0, 0.7568628, 1,
1.079242, 0.6467019, 2.505095, 1, 0, 0.7490196, 1,
1.097254, -0.1172838, 0.09397817, 1, 0, 0.7450981, 1,
1.106176, -0.1299834, 2.322729, 1, 0, 0.7372549, 1,
1.109403, 1.221254, -0.9024408, 1, 0, 0.7333333, 1,
1.114252, 0.1922219, 1.425894, 1, 0, 0.7254902, 1,
1.115137, 0.9094063, 0.1397856, 1, 0, 0.7215686, 1,
1.121478, 1.327723, 0.3440582, 1, 0, 0.7137255, 1,
1.125836, -1.348394, 0.8906122, 1, 0, 0.7098039, 1,
1.128926, 0.4365272, 0.8007939, 1, 0, 0.7019608, 1,
1.13161, -1.358888, 2.687836, 1, 0, 0.6941177, 1,
1.132638, -1.35492, 2.766842, 1, 0, 0.6901961, 1,
1.151106, 0.1581431, 2.508751, 1, 0, 0.682353, 1,
1.156249, 1.226867, 0.7371739, 1, 0, 0.6784314, 1,
1.158346, 0.694192, 1.154589, 1, 0, 0.6705883, 1,
1.162077, 0.1370392, -0.725301, 1, 0, 0.6666667, 1,
1.177403, 1.439816, 1.353202, 1, 0, 0.6588235, 1,
1.184583, -0.4629539, 2.075984, 1, 0, 0.654902, 1,
1.201563, 0.4641733, 1.999921, 1, 0, 0.6470588, 1,
1.212387, -0.07262342, 0.4919156, 1, 0, 0.6431373, 1,
1.212434, -1.626488, 0.7851211, 1, 0, 0.6352941, 1,
1.216846, 1.905466, 1.408307, 1, 0, 0.6313726, 1,
1.236132, -0.2241134, 1.056856, 1, 0, 0.6235294, 1,
1.236998, -0.5355529, 3.286298, 1, 0, 0.6196079, 1,
1.25117, 1.361681, -1.465953, 1, 0, 0.6117647, 1,
1.25447, 0.2787922, 1.81495, 1, 0, 0.6078432, 1,
1.255236, 2.146529, 0.2760125, 1, 0, 0.6, 1,
1.264068, -0.5019649, 1.452939, 1, 0, 0.5921569, 1,
1.264578, 0.632252, 1.441351, 1, 0, 0.5882353, 1,
1.267167, 0.3131, 2.807479, 1, 0, 0.5803922, 1,
1.281306, -0.3905291, 1.670273, 1, 0, 0.5764706, 1,
1.281438, -1.892695, 3.282676, 1, 0, 0.5686275, 1,
1.301124, -1.248872, 2.566582, 1, 0, 0.5647059, 1,
1.308509, 1.535581, 0.710211, 1, 0, 0.5568628, 1,
1.310502, -0.06306098, 2.029305, 1, 0, 0.5529412, 1,
1.318229, 1.409816, 0.6617956, 1, 0, 0.5450981, 1,
1.321814, 0.1486591, 1.239907, 1, 0, 0.5411765, 1,
1.327766, -1.208761, 3.793895, 1, 0, 0.5333334, 1,
1.340587, -1.649946, 1.940238, 1, 0, 0.5294118, 1,
1.341419, -0.04568524, 1.122424, 1, 0, 0.5215687, 1,
1.352664, -1.445096, 2.838017, 1, 0, 0.5176471, 1,
1.394104, -0.5716107, 1.669163, 1, 0, 0.509804, 1,
1.404745, -1.894245, 3.406744, 1, 0, 0.5058824, 1,
1.407965, -1.441563, 3.290395, 1, 0, 0.4980392, 1,
1.413568, 0.5053939, 1.118513, 1, 0, 0.4901961, 1,
1.420644, 0.2005165, 0.903017, 1, 0, 0.4862745, 1,
1.427887, 1.207702, 0.3719642, 1, 0, 0.4784314, 1,
1.450585, 0.2605178, 2.524387, 1, 0, 0.4745098, 1,
1.457597, -0.1436896, 2.68797, 1, 0, 0.4666667, 1,
1.458963, -0.3386276, 1.283716, 1, 0, 0.4627451, 1,
1.47503, 0.6908659, 1.636646, 1, 0, 0.454902, 1,
1.482929, 0.796379, 0.7611343, 1, 0, 0.4509804, 1,
1.487671, 0.5304043, 2.188166, 1, 0, 0.4431373, 1,
1.492143, -0.7146516, 0.7496813, 1, 0, 0.4392157, 1,
1.49477, -1.69075, 1.964641, 1, 0, 0.4313726, 1,
1.50218, 0.5791659, 2.918536, 1, 0, 0.427451, 1,
1.503047, 0.5777147, 2.601928, 1, 0, 0.4196078, 1,
1.503215, 1.070331, 1.263025, 1, 0, 0.4156863, 1,
1.517483, -0.3307304, 0.09934085, 1, 0, 0.4078431, 1,
1.518108, -1.141881, 2.218174, 1, 0, 0.4039216, 1,
1.520434, -1.439159, 2.923582, 1, 0, 0.3960784, 1,
1.528186, -0.274725, 1.70822, 1, 0, 0.3882353, 1,
1.529573, 0.2989274, 1.453948, 1, 0, 0.3843137, 1,
1.534482, 1.69048, 1.501773, 1, 0, 0.3764706, 1,
1.534989, 0.04968354, 2.918414, 1, 0, 0.372549, 1,
1.541333, 0.4160047, 1.728502, 1, 0, 0.3647059, 1,
1.542423, -0.6739892, 2.093509, 1, 0, 0.3607843, 1,
1.542448, -0.01779189, 0.3167475, 1, 0, 0.3529412, 1,
1.549814, 1.806229, 1.151336, 1, 0, 0.3490196, 1,
1.554257, -0.6346238, 1.703235, 1, 0, 0.3411765, 1,
1.562912, 0.8260432, 0.3135722, 1, 0, 0.3372549, 1,
1.564391, 1.404774, -0.5632504, 1, 0, 0.3294118, 1,
1.584878, -0.1861852, 0.7613643, 1, 0, 0.3254902, 1,
1.585658, 0.773895, 0.06020527, 1, 0, 0.3176471, 1,
1.599468, 1.180202, 1.291861, 1, 0, 0.3137255, 1,
1.605667, 1.516453, 2.081442, 1, 0, 0.3058824, 1,
1.611032, -1.418326, 1.601915, 1, 0, 0.2980392, 1,
1.625054, -1.427628, 0.4532024, 1, 0, 0.2941177, 1,
1.629538, 0.81522, 0.6151657, 1, 0, 0.2862745, 1,
1.635255, 0.7389027, 0.9360808, 1, 0, 0.282353, 1,
1.641197, -1.383148, 2.843861, 1, 0, 0.2745098, 1,
1.642642, 0.4531274, 1.742871, 1, 0, 0.2705882, 1,
1.683716, -1.042, 1.424291, 1, 0, 0.2627451, 1,
1.689009, -0.6142124, 1.08278, 1, 0, 0.2588235, 1,
1.70342, -0.6346797, 1.853509, 1, 0, 0.2509804, 1,
1.729491, -1.943434, 1.765074, 1, 0, 0.2470588, 1,
1.737844, -1.250819, 2.928411, 1, 0, 0.2392157, 1,
1.758049, 1.027246, 1.363263, 1, 0, 0.2352941, 1,
1.763205, -0.7304287, 1.052274, 1, 0, 0.227451, 1,
1.771011, -2.037112, 2.077134, 1, 0, 0.2235294, 1,
1.774351, 0.4399052, 0.6236549, 1, 0, 0.2156863, 1,
1.779649, -0.7763198, 2.372269, 1, 0, 0.2117647, 1,
1.808399, -0.2965145, 2.058701, 1, 0, 0.2039216, 1,
1.808868, -0.0379179, 2.060616, 1, 0, 0.1960784, 1,
1.825115, -0.6374335, 2.090453, 1, 0, 0.1921569, 1,
1.834607, 0.7335153, -0.7167369, 1, 0, 0.1843137, 1,
1.840035, 0.9304731, 2.721261, 1, 0, 0.1803922, 1,
1.874988, 0.4550442, 0.6651132, 1, 0, 0.172549, 1,
1.884752, -0.3304758, 3.100562, 1, 0, 0.1686275, 1,
1.908805, -0.2880656, 1.336428, 1, 0, 0.1607843, 1,
2.004096, 1.228032, 1.700694, 1, 0, 0.1568628, 1,
2.02648, -0.08908307, -0.08562527, 1, 0, 0.1490196, 1,
2.032389, 0.7095498, 1.150218, 1, 0, 0.145098, 1,
2.041982, 0.3057283, 3.099733, 1, 0, 0.1372549, 1,
2.087465, -1.157761, 0.97271, 1, 0, 0.1333333, 1,
2.117848, -0.2131621, 1.569121, 1, 0, 0.1254902, 1,
2.161172, -1.866655, 3.546344, 1, 0, 0.1215686, 1,
2.208578, 0.8196664, 1.622108, 1, 0, 0.1137255, 1,
2.229312, 0.1587968, 0.002273832, 1, 0, 0.1098039, 1,
2.267445, -1.111749, 0.9352764, 1, 0, 0.1019608, 1,
2.270154, 0.7122445, 3.031558, 1, 0, 0.09411765, 1,
2.277735, -0.09514411, 2.239126, 1, 0, 0.09019608, 1,
2.286091, -0.3639434, 1.23683, 1, 0, 0.08235294, 1,
2.316352, 1.559625, 2.4307, 1, 0, 0.07843138, 1,
2.317943, -0.3969198, 3.146395, 1, 0, 0.07058824, 1,
2.378615, 1.305105, 1.365361, 1, 0, 0.06666667, 1,
2.384346, 0.3291805, 1.094, 1, 0, 0.05882353, 1,
2.435418, 0.1924281, 1.102559, 1, 0, 0.05490196, 1,
2.469899, 1.681168, -1.18492, 1, 0, 0.04705882, 1,
2.497473, -0.2049309, 2.233487, 1, 0, 0.04313726, 1,
2.648856, 0.4799932, 1.061194, 1, 0, 0.03529412, 1,
2.702256, 2.034024, 0.4395323, 1, 0, 0.03137255, 1,
2.724418, -0.4434063, 1.568525, 1, 0, 0.02352941, 1,
2.770841, 0.5515379, 0.671394, 1, 0, 0.01960784, 1,
3.104565, -0.5271257, 0.6684853, 1, 0, 0.01176471, 1,
3.625435, 0.6755711, 1.647855, 1, 0, 0.007843138, 1
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
0.1428603, -3.88628, -7.585819, 0, -0.5, 0.5, 0.5,
0.1428603, -3.88628, -7.585819, 1, -0.5, 0.5, 0.5,
0.1428603, -3.88628, -7.585819, 1, 1.5, 0.5, 0.5,
0.1428603, -3.88628, -7.585819, 0, 1.5, 0.5, 0.5
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
-4.520308, 0.2366854, -7.585819, 0, -0.5, 0.5, 0.5,
-4.520308, 0.2366854, -7.585819, 1, -0.5, 0.5, 0.5,
-4.520308, 0.2366854, -7.585819, 1, 1.5, 0.5, 0.5,
-4.520308, 0.2366854, -7.585819, 0, 1.5, 0.5, 0.5
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
-4.520308, -3.88628, -0.2658825, 0, -0.5, 0.5, 0.5,
-4.520308, -3.88628, -0.2658825, 1, -0.5, 0.5, 0.5,
-4.520308, -3.88628, -0.2658825, 1, 1.5, 0.5, 0.5,
-4.520308, -3.88628, -0.2658825, 0, 1.5, 0.5, 0.5
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
-3, -2.934826, -5.896603,
3, -2.934826, -5.896603,
-3, -2.934826, -5.896603,
-3, -3.093402, -6.178139,
-2, -2.934826, -5.896603,
-2, -3.093402, -6.178139,
-1, -2.934826, -5.896603,
-1, -3.093402, -6.178139,
0, -2.934826, -5.896603,
0, -3.093402, -6.178139,
1, -2.934826, -5.896603,
1, -3.093402, -6.178139,
2, -2.934826, -5.896603,
2, -3.093402, -6.178139,
3, -2.934826, -5.896603,
3, -3.093402, -6.178139
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
-3, -3.410553, -6.741211, 0, -0.5, 0.5, 0.5,
-3, -3.410553, -6.741211, 1, -0.5, 0.5, 0.5,
-3, -3.410553, -6.741211, 1, 1.5, 0.5, 0.5,
-3, -3.410553, -6.741211, 0, 1.5, 0.5, 0.5,
-2, -3.410553, -6.741211, 0, -0.5, 0.5, 0.5,
-2, -3.410553, -6.741211, 1, -0.5, 0.5, 0.5,
-2, -3.410553, -6.741211, 1, 1.5, 0.5, 0.5,
-2, -3.410553, -6.741211, 0, 1.5, 0.5, 0.5,
-1, -3.410553, -6.741211, 0, -0.5, 0.5, 0.5,
-1, -3.410553, -6.741211, 1, -0.5, 0.5, 0.5,
-1, -3.410553, -6.741211, 1, 1.5, 0.5, 0.5,
-1, -3.410553, -6.741211, 0, 1.5, 0.5, 0.5,
0, -3.410553, -6.741211, 0, -0.5, 0.5, 0.5,
0, -3.410553, -6.741211, 1, -0.5, 0.5, 0.5,
0, -3.410553, -6.741211, 1, 1.5, 0.5, 0.5,
0, -3.410553, -6.741211, 0, 1.5, 0.5, 0.5,
1, -3.410553, -6.741211, 0, -0.5, 0.5, 0.5,
1, -3.410553, -6.741211, 1, -0.5, 0.5, 0.5,
1, -3.410553, -6.741211, 1, 1.5, 0.5, 0.5,
1, -3.410553, -6.741211, 0, 1.5, 0.5, 0.5,
2, -3.410553, -6.741211, 0, -0.5, 0.5, 0.5,
2, -3.410553, -6.741211, 1, -0.5, 0.5, 0.5,
2, -3.410553, -6.741211, 1, 1.5, 0.5, 0.5,
2, -3.410553, -6.741211, 0, 1.5, 0.5, 0.5,
3, -3.410553, -6.741211, 0, -0.5, 0.5, 0.5,
3, -3.410553, -6.741211, 1, -0.5, 0.5, 0.5,
3, -3.410553, -6.741211, 1, 1.5, 0.5, 0.5,
3, -3.410553, -6.741211, 0, 1.5, 0.5, 0.5
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
-3.444192, -2, -5.896603,
-3.444192, 3, -5.896603,
-3.444192, -2, -5.896603,
-3.623544, -2, -6.178139,
-3.444192, -1, -5.896603,
-3.623544, -1, -6.178139,
-3.444192, 0, -5.896603,
-3.623544, 0, -6.178139,
-3.444192, 1, -5.896603,
-3.623544, 1, -6.178139,
-3.444192, 2, -5.896603,
-3.623544, 2, -6.178139,
-3.444192, 3, -5.896603,
-3.623544, 3, -6.178139
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
-3.982249, -2, -6.741211, 0, -0.5, 0.5, 0.5,
-3.982249, -2, -6.741211, 1, -0.5, 0.5, 0.5,
-3.982249, -2, -6.741211, 1, 1.5, 0.5, 0.5,
-3.982249, -2, -6.741211, 0, 1.5, 0.5, 0.5,
-3.982249, -1, -6.741211, 0, -0.5, 0.5, 0.5,
-3.982249, -1, -6.741211, 1, -0.5, 0.5, 0.5,
-3.982249, -1, -6.741211, 1, 1.5, 0.5, 0.5,
-3.982249, -1, -6.741211, 0, 1.5, 0.5, 0.5,
-3.982249, 0, -6.741211, 0, -0.5, 0.5, 0.5,
-3.982249, 0, -6.741211, 1, -0.5, 0.5, 0.5,
-3.982249, 0, -6.741211, 1, 1.5, 0.5, 0.5,
-3.982249, 0, -6.741211, 0, 1.5, 0.5, 0.5,
-3.982249, 1, -6.741211, 0, -0.5, 0.5, 0.5,
-3.982249, 1, -6.741211, 1, -0.5, 0.5, 0.5,
-3.982249, 1, -6.741211, 1, 1.5, 0.5, 0.5,
-3.982249, 1, -6.741211, 0, 1.5, 0.5, 0.5,
-3.982249, 2, -6.741211, 0, -0.5, 0.5, 0.5,
-3.982249, 2, -6.741211, 1, -0.5, 0.5, 0.5,
-3.982249, 2, -6.741211, 1, 1.5, 0.5, 0.5,
-3.982249, 2, -6.741211, 0, 1.5, 0.5, 0.5,
-3.982249, 3, -6.741211, 0, -0.5, 0.5, 0.5,
-3.982249, 3, -6.741211, 1, -0.5, 0.5, 0.5,
-3.982249, 3, -6.741211, 1, 1.5, 0.5, 0.5,
-3.982249, 3, -6.741211, 0, 1.5, 0.5, 0.5
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
-3.444192, -2.934826, -4,
-3.444192, -2.934826, 4,
-3.444192, -2.934826, -4,
-3.623544, -3.093402, -4,
-3.444192, -2.934826, -2,
-3.623544, -3.093402, -2,
-3.444192, -2.934826, 0,
-3.623544, -3.093402, 0,
-3.444192, -2.934826, 2,
-3.623544, -3.093402, 2,
-3.444192, -2.934826, 4,
-3.623544, -3.093402, 4
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
-3.982249, -3.410553, -4, 0, -0.5, 0.5, 0.5,
-3.982249, -3.410553, -4, 1, -0.5, 0.5, 0.5,
-3.982249, -3.410553, -4, 1, 1.5, 0.5, 0.5,
-3.982249, -3.410553, -4, 0, 1.5, 0.5, 0.5,
-3.982249, -3.410553, -2, 0, -0.5, 0.5, 0.5,
-3.982249, -3.410553, -2, 1, -0.5, 0.5, 0.5,
-3.982249, -3.410553, -2, 1, 1.5, 0.5, 0.5,
-3.982249, -3.410553, -2, 0, 1.5, 0.5, 0.5,
-3.982249, -3.410553, 0, 0, -0.5, 0.5, 0.5,
-3.982249, -3.410553, 0, 1, -0.5, 0.5, 0.5,
-3.982249, -3.410553, 0, 1, 1.5, 0.5, 0.5,
-3.982249, -3.410553, 0, 0, 1.5, 0.5, 0.5,
-3.982249, -3.410553, 2, 0, -0.5, 0.5, 0.5,
-3.982249, -3.410553, 2, 1, -0.5, 0.5, 0.5,
-3.982249, -3.410553, 2, 1, 1.5, 0.5, 0.5,
-3.982249, -3.410553, 2, 0, 1.5, 0.5, 0.5,
-3.982249, -3.410553, 4, 0, -0.5, 0.5, 0.5,
-3.982249, -3.410553, 4, 1, -0.5, 0.5, 0.5,
-3.982249, -3.410553, 4, 1, 1.5, 0.5, 0.5,
-3.982249, -3.410553, 4, 0, 1.5, 0.5, 0.5
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
-3.444192, -2.934826, -5.896603,
-3.444192, 3.408197, -5.896603,
-3.444192, -2.934826, 5.364838,
-3.444192, 3.408197, 5.364838,
-3.444192, -2.934826, -5.896603,
-3.444192, -2.934826, 5.364838,
-3.444192, 3.408197, -5.896603,
-3.444192, 3.408197, 5.364838,
-3.444192, -2.934826, -5.896603,
3.729912, -2.934826, -5.896603,
-3.444192, -2.934826, 5.364838,
3.729912, -2.934826, 5.364838,
-3.444192, 3.408197, -5.896603,
3.729912, 3.408197, -5.896603,
-3.444192, 3.408197, 5.364838,
3.729912, 3.408197, 5.364838,
3.729912, -2.934826, -5.896603,
3.729912, 3.408197, -5.896603,
3.729912, -2.934826, 5.364838,
3.729912, 3.408197, 5.364838,
3.729912, -2.934826, -5.896603,
3.729912, -2.934826, 5.364838,
3.729912, 3.408197, -5.896603,
3.729912, 3.408197, 5.364838
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
var radius = 7.893558;
var distance = 35.11934;
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
mvMatrix.translate( -0.1428603, -0.2366854, 0.2658825 );
mvMatrix.scale( 1.18965, 1.345521, 0.7578666 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.11934);
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
pyridine-2-carboxyla<-read.table("pyridine-2-carboxyla.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridine-2-carboxyla$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
y<-pyridine-2-carboxyla$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
z<-pyridine-2-carboxyla$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
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
-3.339715, 0.3091637, -3.154572, 0, 0, 1, 1, 1,
-2.959419, 0.9239929, -2.910215, 1, 0, 0, 1, 1,
-2.947628, 0.8185472, -0.9912369, 1, 0, 0, 1, 1,
-2.70094, -0.6459724, -0.9137889, 1, 0, 0, 1, 1,
-2.695845, -0.0149373, -2.325235, 1, 0, 0, 1, 1,
-2.599996, 0.5101714, -1.451224, 1, 0, 0, 1, 1,
-2.544353, 0.07017135, -1.391583, 0, 0, 0, 1, 1,
-2.542626, 1.680217, -1.76544, 0, 0, 0, 1, 1,
-2.409564, -0.8056872, -1.540426, 0, 0, 0, 1, 1,
-2.303069, -0.1633411, -2.629229, 0, 0, 0, 1, 1,
-2.283973, -1.007375, -1.007637, 0, 0, 0, 1, 1,
-2.268472, 0.03323118, -0.3269969, 0, 0, 0, 1, 1,
-2.254159, 0.3456027, -1.705102, 0, 0, 0, 1, 1,
-2.203395, 0.1373859, -1.986208, 1, 1, 1, 1, 1,
-2.184563, -1.041476, -2.703993, 1, 1, 1, 1, 1,
-2.119118, 0.351823, -2.392758, 1, 1, 1, 1, 1,
-2.091115, -0.5698768, -2.48786, 1, 1, 1, 1, 1,
-2.077406, -1.073554, -3.688179, 1, 1, 1, 1, 1,
-2.076635, -0.02532556, -1.954612, 1, 1, 1, 1, 1,
-2.075733, -1.141959, -3.019352, 1, 1, 1, 1, 1,
-2.06344, 0.3556024, -3.070393, 1, 1, 1, 1, 1,
-2.059436, 0.2632226, -0.8986709, 1, 1, 1, 1, 1,
-2.045909, -0.5253011, -1.999139, 1, 1, 1, 1, 1,
-2.011221, -0.6489462, -2.239243, 1, 1, 1, 1, 1,
-1.968113, -0.3573306, -2.310948, 1, 1, 1, 1, 1,
-1.962764, -1.046234, -1.329666, 1, 1, 1, 1, 1,
-1.960975, -1.724502, -2.305009, 1, 1, 1, 1, 1,
-1.957484, 0.05292815, 0.4502308, 1, 1, 1, 1, 1,
-1.940868, 0.7479238, -2.039851, 0, 0, 1, 1, 1,
-1.882068, 0.03822691, -3.114961, 1, 0, 0, 1, 1,
-1.873393, 1.267574, -1.827873, 1, 0, 0, 1, 1,
-1.872684, -0.8499566, -2.280645, 1, 0, 0, 1, 1,
-1.870005, -0.7257736, -1.130252, 1, 0, 0, 1, 1,
-1.866011, -0.3815969, -2.555247, 1, 0, 0, 1, 1,
-1.848477, -1.664085, -2.539451, 0, 0, 0, 1, 1,
-1.812309, 0.4937182, -2.349559, 0, 0, 0, 1, 1,
-1.79525, 1.161933, -0.8665732, 0, 0, 0, 1, 1,
-1.792346, 0.1378799, -1.884342, 0, 0, 0, 1, 1,
-1.789216, 2.69129, -0.5296709, 0, 0, 0, 1, 1,
-1.788419, -0.2203377, -0.8850268, 0, 0, 0, 1, 1,
-1.78755, -0.2186919, -0.4269013, 0, 0, 0, 1, 1,
-1.768938, 0.18255, -2.472375, 1, 1, 1, 1, 1,
-1.758183, -0.2903906, -2.864511, 1, 1, 1, 1, 1,
-1.747859, -0.8266841, -0.7290979, 1, 1, 1, 1, 1,
-1.745111, -0.7637104, -2.799576, 1, 1, 1, 1, 1,
-1.742988, 2.306046, 0.9663444, 1, 1, 1, 1, 1,
-1.738573, 0.866402, -1.609814, 1, 1, 1, 1, 1,
-1.720518, 0.5285054, -0.4916328, 1, 1, 1, 1, 1,
-1.687972, -0.2379702, -2.536265, 1, 1, 1, 1, 1,
-1.68589, 1.790557, -0.648521, 1, 1, 1, 1, 1,
-1.679903, -1.866187, -1.712913, 1, 1, 1, 1, 1,
-1.643472, 1.588708, -1.707803, 1, 1, 1, 1, 1,
-1.618242, 0.08669571, -3.495275, 1, 1, 1, 1, 1,
-1.604531, -1.402466, -1.765656, 1, 1, 1, 1, 1,
-1.579102, -1.775401, -0.4441576, 1, 1, 1, 1, 1,
-1.575232, -1.112346, -1.768385, 1, 1, 1, 1, 1,
-1.570455, 0.0169884, -2.435062, 0, 0, 1, 1, 1,
-1.569497, -1.211379, -0.4790493, 1, 0, 0, 1, 1,
-1.542046, 0.02841097, -1.809397, 1, 0, 0, 1, 1,
-1.539053, 0.4282427, -2.604378, 1, 0, 0, 1, 1,
-1.535502, -0.3487694, 0.8509545, 1, 0, 0, 1, 1,
-1.513347, -1.362948, -2.607268, 1, 0, 0, 1, 1,
-1.502418, -0.7653114, -1.418033, 0, 0, 0, 1, 1,
-1.501676, 0.1281648, 0.1666484, 0, 0, 0, 1, 1,
-1.493712, -1.559253, -4.000132, 0, 0, 0, 1, 1,
-1.488167, -0.01941263, -1.435209, 0, 0, 0, 1, 1,
-1.473847, -0.09077302, -2.51201, 0, 0, 0, 1, 1,
-1.473407, -1.512999, -0.8355383, 0, 0, 0, 1, 1,
-1.471386, -0.8233564, -1.671358, 0, 0, 0, 1, 1,
-1.467983, -0.4500037, -1.490954, 1, 1, 1, 1, 1,
-1.452303, -0.6999188, -3.356477, 1, 1, 1, 1, 1,
-1.447438, -1.314109, -1.534599, 1, 1, 1, 1, 1,
-1.446895, 2.088171, -1.469854, 1, 1, 1, 1, 1,
-1.44098, -1.133989, -2.748307, 1, 1, 1, 1, 1,
-1.436576, -0.3160834, -1.668865, 1, 1, 1, 1, 1,
-1.429169, -0.7030765, -1.792118, 1, 1, 1, 1, 1,
-1.4202, -1.022379, -2.549828, 1, 1, 1, 1, 1,
-1.418446, 0.9452739, -1.963857, 1, 1, 1, 1, 1,
-1.416361, -0.1968399, -2.741196, 1, 1, 1, 1, 1,
-1.412204, -0.6134318, -1.684949, 1, 1, 1, 1, 1,
-1.411935, 2.207851, -0.8392549, 1, 1, 1, 1, 1,
-1.408988, 0.925231, -2.530453, 1, 1, 1, 1, 1,
-1.404042, 0.6189235, -2.452131, 1, 1, 1, 1, 1,
-1.366653, -1.583968, -1.602504, 1, 1, 1, 1, 1,
-1.362131, -0.8568483, -1.653998, 0, 0, 1, 1, 1,
-1.349611, 1.291868, -0.7914008, 1, 0, 0, 1, 1,
-1.339124, 0.8154091, -0.8841026, 1, 0, 0, 1, 1,
-1.331026, 1.912491, -0.04780244, 1, 0, 0, 1, 1,
-1.330797, 0.2718982, -1.336351, 1, 0, 0, 1, 1,
-1.329862, -0.5821634, -0.5839558, 1, 0, 0, 1, 1,
-1.32743, 0.4143193, -0.7677267, 0, 0, 0, 1, 1,
-1.321114, 0.5119066, -2.557048, 0, 0, 0, 1, 1,
-1.312562, 0.0982025, -0.1196988, 0, 0, 0, 1, 1,
-1.306604, -0.3819004, -1.271955, 0, 0, 0, 1, 1,
-1.3049, -1.497534, -2.777331, 0, 0, 0, 1, 1,
-1.302845, -0.2132748, -3.060945, 0, 0, 0, 1, 1,
-1.301286, -0.9428478, -1.620034, 0, 0, 0, 1, 1,
-1.298593, -0.7923031, -2.979245, 1, 1, 1, 1, 1,
-1.286716, 1.541797, -1.637854, 1, 1, 1, 1, 1,
-1.284941, 0.5902854, -0.06296677, 1, 1, 1, 1, 1,
-1.266501, 0.09221545, -1.047772, 1, 1, 1, 1, 1,
-1.261154, 0.4460776, -1.653064, 1, 1, 1, 1, 1,
-1.254558, -1.448241, -1.089193, 1, 1, 1, 1, 1,
-1.24983, 0.263145, 0.8822848, 1, 1, 1, 1, 1,
-1.247978, -0.492798, -1.547753, 1, 1, 1, 1, 1,
-1.247767, 1.005651, -0.2612652, 1, 1, 1, 1, 1,
-1.245887, -0.314562, -1.804627, 1, 1, 1, 1, 1,
-1.241288, 0.9316844, -1.558944, 1, 1, 1, 1, 1,
-1.232925, 0.9537368, 1.181133, 1, 1, 1, 1, 1,
-1.230542, 1.892143, -1.38539, 1, 1, 1, 1, 1,
-1.223369, -0.5090547, -2.863194, 1, 1, 1, 1, 1,
-1.221591, 0.1548292, -1.097367, 1, 1, 1, 1, 1,
-1.21666, 0.5759734, -0.9060309, 0, 0, 1, 1, 1,
-1.216098, 1.321851, -0.1597015, 1, 0, 0, 1, 1,
-1.204406, -0.8344333, -3.106975, 1, 0, 0, 1, 1,
-1.198366, -0.1954996, -3.305313, 1, 0, 0, 1, 1,
-1.197461, -0.7972329, -1.809746, 1, 0, 0, 1, 1,
-1.197459, -0.2510675, -1.118108, 1, 0, 0, 1, 1,
-1.18086, -1.392047, -2.137867, 0, 0, 0, 1, 1,
-1.169647, 0.4006404, -1.37469, 0, 0, 0, 1, 1,
-1.16362, -0.7722389, -2.505927, 0, 0, 0, 1, 1,
-1.159319, 0.2415358, -2.452626, 0, 0, 0, 1, 1,
-1.14232, 0.3785165, -2.019028, 0, 0, 0, 1, 1,
-1.138643, 0.3613551, -1.213423, 0, 0, 0, 1, 1,
-1.133482, 1.372783, -0.455708, 0, 0, 0, 1, 1,
-1.130101, 0.4440875, -2.168732, 1, 1, 1, 1, 1,
-1.124615, -0.06676591, -0.9201291, 1, 1, 1, 1, 1,
-1.103499, 0.1767292, -0.7336366, 1, 1, 1, 1, 1,
-1.100779, 1.535678, -0.8061257, 1, 1, 1, 1, 1,
-1.098221, -0.6548548, -2.174058, 1, 1, 1, 1, 1,
-1.095226, 1.071135, -0.01083365, 1, 1, 1, 1, 1,
-1.094614, -0.912153, -1.776185, 1, 1, 1, 1, 1,
-1.063366, -0.7765032, -0.9997377, 1, 1, 1, 1, 1,
-1.06316, -0.7891818, -2.79669, 1, 1, 1, 1, 1,
-1.060711, -1.513232, -2.869013, 1, 1, 1, 1, 1,
-1.059736, 0.5677149, -2.465744, 1, 1, 1, 1, 1,
-1.055783, 0.2280566, -0.7621859, 1, 1, 1, 1, 1,
-1.053972, -0.2337776, -3.385462, 1, 1, 1, 1, 1,
-1.047808, 0.3951366, -1.302729, 1, 1, 1, 1, 1,
-1.046367, -1.663562, -2.776246, 1, 1, 1, 1, 1,
-1.038814, -0.3673881, -1.19398, 0, 0, 1, 1, 1,
-1.037227, -0.5438548, -1.631832, 1, 0, 0, 1, 1,
-1.029812, 1.896354, -0.007018107, 1, 0, 0, 1, 1,
-1.029345, -0.01630251, -0.6360675, 1, 0, 0, 1, 1,
-1.0252, -0.0362693, -2.005824, 1, 0, 0, 1, 1,
-1.023757, -0.8175801, -1.419102, 1, 0, 0, 1, 1,
-1.019618, 1.872101, 0.760048, 0, 0, 0, 1, 1,
-1.011612, 1.087954, -2.167262, 0, 0, 0, 1, 1,
-1.001175, 0.4752385, -1.341859, 0, 0, 0, 1, 1,
-0.9984484, -2.47727, -3.442407, 0, 0, 0, 1, 1,
-0.9944307, 0.4008339, -0.7926325, 0, 0, 0, 1, 1,
-0.9906704, -1.861493, -1.001659, 0, 0, 0, 1, 1,
-0.9887361, 0.04571899, 0.2264181, 0, 0, 0, 1, 1,
-0.9855969, 0.4026784, -1.72954, 1, 1, 1, 1, 1,
-0.9849385, -0.5277112, -0.5109847, 1, 1, 1, 1, 1,
-0.9848559, 1.970947, 0.3337227, 1, 1, 1, 1, 1,
-0.9810773, 0.5732011, -1.428169, 1, 1, 1, 1, 1,
-0.9806529, -0.5108591, -2.583707, 1, 1, 1, 1, 1,
-0.9747652, 0.5836579, -0.8930538, 1, 1, 1, 1, 1,
-0.9713302, -1.166955, -3.828631, 1, 1, 1, 1, 1,
-0.9708534, -0.434536, -2.501068, 1, 1, 1, 1, 1,
-0.9642383, 1.38289, -0.6161264, 1, 1, 1, 1, 1,
-0.9631478, 2.274648, -2.029231, 1, 1, 1, 1, 1,
-0.9598901, -0.6235878, -3.829671, 1, 1, 1, 1, 1,
-0.959647, 0.5976721, -1.175322, 1, 1, 1, 1, 1,
-0.9584284, 0.04371672, -0.07351337, 1, 1, 1, 1, 1,
-0.9481022, -0.1451108, -2.709233, 1, 1, 1, 1, 1,
-0.9456351, 0.6560366, -1.549199, 1, 1, 1, 1, 1,
-0.9428776, 0.004791346, -2.103198, 0, 0, 1, 1, 1,
-0.9425308, -0.1561693, -1.173161, 1, 0, 0, 1, 1,
-0.9261335, 0.9400089, -1.074709, 1, 0, 0, 1, 1,
-0.9238189, 0.6332449, -0.9083512, 1, 0, 0, 1, 1,
-0.9230879, 0.1342273, -1.780194, 1, 0, 0, 1, 1,
-0.9198921, -0.41448, -1.748677, 1, 0, 0, 1, 1,
-0.9186263, -0.630943, -1.842373, 0, 0, 0, 1, 1,
-0.9144556, 0.3932351, -0.4834419, 0, 0, 0, 1, 1,
-0.9017112, -0.3515614, -2.125156, 0, 0, 0, 1, 1,
-0.8989839, 0.6181949, -1.888928, 0, 0, 0, 1, 1,
-0.8978457, 1.004947, 0.04064421, 0, 0, 0, 1, 1,
-0.895823, 1.263557, -1.373589, 0, 0, 0, 1, 1,
-0.8923618, -2.485353, -2.914788, 0, 0, 0, 1, 1,
-0.8911695, -0.5074303, -1.796682, 1, 1, 1, 1, 1,
-0.8896495, 0.6448015, -0.7134693, 1, 1, 1, 1, 1,
-0.8852618, -0.9948381, -3.209837, 1, 1, 1, 1, 1,
-0.8754516, -1.309635, -1.576422, 1, 1, 1, 1, 1,
-0.8719038, -0.4840294, -1.941884, 1, 1, 1, 1, 1,
-0.8680764, -0.7011412, 0.8857209, 1, 1, 1, 1, 1,
-0.8608968, 1.168916, 1.044245, 1, 1, 1, 1, 1,
-0.8596444, -0.007607073, -2.961149, 1, 1, 1, 1, 1,
-0.8510446, -0.02321545, -1.617514, 1, 1, 1, 1, 1,
-0.8501006, 0.3617394, -0.6308856, 1, 1, 1, 1, 1,
-0.8456356, 0.1170044, -0.6504794, 1, 1, 1, 1, 1,
-0.8438485, 0.5004418, -2.837759, 1, 1, 1, 1, 1,
-0.8370588, 0.3963554, -2.346551, 1, 1, 1, 1, 1,
-0.8322697, -1.949398, -3.06358, 1, 1, 1, 1, 1,
-0.8285185, -0.1553045, -2.181118, 1, 1, 1, 1, 1,
-0.8262923, -0.5810145, -1.886806, 0, 0, 1, 1, 1,
-0.815258, -2.184576, -0.7695831, 1, 0, 0, 1, 1,
-0.8149503, 1.058167, -0.4089044, 1, 0, 0, 1, 1,
-0.8109215, 1.758499, 0.1694661, 1, 0, 0, 1, 1,
-0.8083562, -0.4409164, -2.537103, 1, 0, 0, 1, 1,
-0.8012243, 2.191493, 1.169535, 1, 0, 0, 1, 1,
-0.7994627, 1.878533, -2.305724, 0, 0, 0, 1, 1,
-0.7952739, -0.1719338, -2.391322, 0, 0, 0, 1, 1,
-0.7946691, 0.9298849, -1.227523, 0, 0, 0, 1, 1,
-0.7942346, 0.9689773, 1.044083, 0, 0, 0, 1, 1,
-0.7925879, 2.218207, 1.687942, 0, 0, 0, 1, 1,
-0.791603, -0.04362949, 1.263698, 0, 0, 0, 1, 1,
-0.7887801, -1.356462, -2.05436, 0, 0, 0, 1, 1,
-0.7869775, 1.039773, -0.4121414, 1, 1, 1, 1, 1,
-0.7864859, 1.705679, -0.6120871, 1, 1, 1, 1, 1,
-0.7857674, 0.9995407, -2.074849, 1, 1, 1, 1, 1,
-0.7841204, 0.9771092, -0.750857, 1, 1, 1, 1, 1,
-0.7763273, 0.8381535, -2.139049, 1, 1, 1, 1, 1,
-0.7742437, 0.4912811, -1.204682, 1, 1, 1, 1, 1,
-0.7727208, -2.110104, -2.750004, 1, 1, 1, 1, 1,
-0.7705388, -0.9528936, -1.892428, 1, 1, 1, 1, 1,
-0.7690007, -0.9136244, -3.003371, 1, 1, 1, 1, 1,
-0.7644645, 1.88661, -1.02709, 1, 1, 1, 1, 1,
-0.7618232, -0.6908402, -0.9855758, 1, 1, 1, 1, 1,
-0.760957, 1.202186, 0.1878027, 1, 1, 1, 1, 1,
-0.7584442, -0.6622682, -2.12539, 1, 1, 1, 1, 1,
-0.7575339, 0.1414294, -2.438469, 1, 1, 1, 1, 1,
-0.7567894, 1.352406, -0.9822038, 1, 1, 1, 1, 1,
-0.756512, 0.09521966, -0.301119, 0, 0, 1, 1, 1,
-0.7550847, 0.2985231, -1.1555, 1, 0, 0, 1, 1,
-0.7530383, -0.4303717, -2.301974, 1, 0, 0, 1, 1,
-0.7480607, 0.7491686, -1.052063, 1, 0, 0, 1, 1,
-0.741694, 0.4623665, -1.76489, 1, 0, 0, 1, 1,
-0.7415391, -0.6102846, -2.380337, 1, 0, 0, 1, 1,
-0.741206, 1.07474, 1.600415, 0, 0, 0, 1, 1,
-0.7411534, 1.472857, -0.2146116, 0, 0, 0, 1, 1,
-0.7393405, -1.449125, -2.085588, 0, 0, 0, 1, 1,
-0.7355511, 0.9615925, -1.215078, 0, 0, 0, 1, 1,
-0.7282264, -2.026318, -3.246981, 0, 0, 0, 1, 1,
-0.7264335, -2.472007, -1.893725, 0, 0, 0, 1, 1,
-0.7213392, 0.3782102, -2.658655, 0, 0, 0, 1, 1,
-0.7180645, -0.5885899, -2.526927, 1, 1, 1, 1, 1,
-0.7145967, 1.270243, 0.5301505, 1, 1, 1, 1, 1,
-0.7062895, -1.653188, -2.604077, 1, 1, 1, 1, 1,
-0.7034932, 0.04344663, -2.239652, 1, 1, 1, 1, 1,
-0.7031419, 1.288869, 0.3940013, 1, 1, 1, 1, 1,
-0.6985403, 0.8165752, -0.5200502, 1, 1, 1, 1, 1,
-0.6976712, -1.139626, -3.082577, 1, 1, 1, 1, 1,
-0.6952768, 1.271675, -3.262045, 1, 1, 1, 1, 1,
-0.6917763, 1.038139, -0.5050375, 1, 1, 1, 1, 1,
-0.6790635, -0.09962375, -1.113109, 1, 1, 1, 1, 1,
-0.66965, -0.7409058, -2.035775, 1, 1, 1, 1, 1,
-0.6625556, -0.2582182, -1.658943, 1, 1, 1, 1, 1,
-0.6623479, 0.6268637, -0.8463125, 1, 1, 1, 1, 1,
-0.6557587, 1.282578, -1.817716, 1, 1, 1, 1, 1,
-0.6528458, 1.300632, 0.1246706, 1, 1, 1, 1, 1,
-0.6435537, -0.3052585, -2.691622, 0, 0, 1, 1, 1,
-0.6408528, -0.03107147, -2.685383, 1, 0, 0, 1, 1,
-0.627296, -1.650159, -3.855378, 1, 0, 0, 1, 1,
-0.6162552, -1.923259, -3.406772, 1, 0, 0, 1, 1,
-0.6156257, 0.4870012, -1.125975, 1, 0, 0, 1, 1,
-0.6151243, -0.09721563, -1.712508, 1, 0, 0, 1, 1,
-0.6132905, 2.049208, 1.131122, 0, 0, 0, 1, 1,
-0.6124815, 2.306132, 0.2245499, 0, 0, 0, 1, 1,
-0.6111363, 0.1130878, -0.3329608, 0, 0, 0, 1, 1,
-0.6048661, 1.529796, -0.4149747, 0, 0, 0, 1, 1,
-0.6003487, -1.307335, -1.876439, 0, 0, 0, 1, 1,
-0.5986899, -0.1424336, -2.112739, 0, 0, 0, 1, 1,
-0.5979974, -0.2206847, -2.572398, 0, 0, 0, 1, 1,
-0.5956753, 0.1052983, -2.402729, 1, 1, 1, 1, 1,
-0.5924137, -1.022662, -2.081419, 1, 1, 1, 1, 1,
-0.5908763, 0.2838507, -0.5249532, 1, 1, 1, 1, 1,
-0.5899238, 1.415203, -0.5591694, 1, 1, 1, 1, 1,
-0.589784, 0.7495254, 0.4315572, 1, 1, 1, 1, 1,
-0.5879642, -0.6797938, -2.000806, 1, 1, 1, 1, 1,
-0.5847088, 1.666073, -1.170197, 1, 1, 1, 1, 1,
-0.5815108, -0.3589101, -2.594841, 1, 1, 1, 1, 1,
-0.5802412, -0.3787985, -2.763727, 1, 1, 1, 1, 1,
-0.5801561, -0.6753266, -3.258073, 1, 1, 1, 1, 1,
-0.5771938, -0.1309024, -2.894921, 1, 1, 1, 1, 1,
-0.5765263, 0.4421211, -2.545283, 1, 1, 1, 1, 1,
-0.56735, -0.4147196, -2.984826, 1, 1, 1, 1, 1,
-0.5672555, 0.315253, -1.793886, 1, 1, 1, 1, 1,
-0.565801, 0.03983723, -1.583581, 1, 1, 1, 1, 1,
-0.5645437, -0.4602048, -2.557027, 0, 0, 1, 1, 1,
-0.5496966, -0.7977714, -2.359903, 1, 0, 0, 1, 1,
-0.5495047, 2.411189, -2.536961, 1, 0, 0, 1, 1,
-0.5478893, 0.05046193, -0.580588, 1, 0, 0, 1, 1,
-0.5452926, -1.325104, -3.27528, 1, 0, 0, 1, 1,
-0.5396518, -0.2879766, -2.26215, 1, 0, 0, 1, 1,
-0.5366184, -1.093622, -2.804546, 0, 0, 0, 1, 1,
-0.5357315, -0.3087096, -1.289962, 0, 0, 0, 1, 1,
-0.5356313, -0.02819718, -3.635349, 0, 0, 0, 1, 1,
-0.5329357, 0.2720384, -2.247276, 0, 0, 0, 1, 1,
-0.5326067, -0.9419192, -3.221313, 0, 0, 0, 1, 1,
-0.5304826, -0.400833, -1.013274, 0, 0, 0, 1, 1,
-0.52926, -0.6853787, -2.945811, 0, 0, 0, 1, 1,
-0.5278709, -0.2808965, -0.5022383, 1, 1, 1, 1, 1,
-0.5236717, -1.053701, -3.971264, 1, 1, 1, 1, 1,
-0.5229259, 0.9255438, 0.569459, 1, 1, 1, 1, 1,
-0.5227189, -0.01141348, -0.4252261, 1, 1, 1, 1, 1,
-0.5171188, -0.4571315, -0.2632141, 1, 1, 1, 1, 1,
-0.5150372, -0.802292, -1.749216, 1, 1, 1, 1, 1,
-0.5091547, -2.180474, -4.354071, 1, 1, 1, 1, 1,
-0.5045187, -0.2511633, -1.180371, 1, 1, 1, 1, 1,
-0.5044256, 1.034471, -0.4535868, 1, 1, 1, 1, 1,
-0.5016088, 0.4527998, -0.4602885, 1, 1, 1, 1, 1,
-0.4940352, -1.967782, -5.732602, 1, 1, 1, 1, 1,
-0.4931405, -0.8596802, -3.924114, 1, 1, 1, 1, 1,
-0.4926387, -0.7001078, -1.547866, 1, 1, 1, 1, 1,
-0.4918189, 1.168599, -0.06222587, 1, 1, 1, 1, 1,
-0.4847729, 1.290397, -1.554757, 1, 1, 1, 1, 1,
-0.4840144, -1.606235, -5.060627, 0, 0, 1, 1, 1,
-0.4753374, -0.237664, -1.367899, 1, 0, 0, 1, 1,
-0.4744033, -0.02607749, -1.516514, 1, 0, 0, 1, 1,
-0.469973, -1.171579, -1.108355, 1, 0, 0, 1, 1,
-0.4687898, -0.1823959, -2.560425, 1, 0, 0, 1, 1,
-0.4579304, -2.081861, -3.01964, 1, 0, 0, 1, 1,
-0.4553178, 0.4068373, -1.319019, 0, 0, 0, 1, 1,
-0.4551531, -2.060775, -3.983918, 0, 0, 0, 1, 1,
-0.4487416, 0.304922, -1.019313, 0, 0, 0, 1, 1,
-0.4461361, -1.003261, -3.032339, 0, 0, 0, 1, 1,
-0.4449961, 0.3664578, -1.189075, 0, 0, 0, 1, 1,
-0.4413891, -1.079654, -2.381592, 0, 0, 0, 1, 1,
-0.4406591, -0.5160275, -2.66999, 0, 0, 0, 1, 1,
-0.4364296, -0.7365371, -4.21135, 1, 1, 1, 1, 1,
-0.4346465, -2.163605, -5.023076, 1, 1, 1, 1, 1,
-0.4304229, -0.2648751, -0.7129301, 1, 1, 1, 1, 1,
-0.42899, -1.272511, -2.652656, 1, 1, 1, 1, 1,
-0.4280104, -1.464075, -2.653917, 1, 1, 1, 1, 1,
-0.4272621, -0.2768584, -3.11442, 1, 1, 1, 1, 1,
-0.4218991, 0.4410043, 0.9825371, 1, 1, 1, 1, 1,
-0.4204111, -1.318134, -4.595925, 1, 1, 1, 1, 1,
-0.41965, -0.9278042, -3.731406, 1, 1, 1, 1, 1,
-0.4143838, 1.306695, 0.5187123, 1, 1, 1, 1, 1,
-0.4104197, 1.925981, -0.6622277, 1, 1, 1, 1, 1,
-0.4041237, 1.451719, -0.3404019, 1, 1, 1, 1, 1,
-0.4030449, -0.1945149, -3.054452, 1, 1, 1, 1, 1,
-0.4008348, 1.604834, -1.96341, 1, 1, 1, 1, 1,
-0.4007231, 0.7434125, -0.4220398, 1, 1, 1, 1, 1,
-0.3997794, -0.0571095, -2.414593, 0, 0, 1, 1, 1,
-0.3990761, -0.5303742, -0.5421333, 1, 0, 0, 1, 1,
-0.3976665, -1.210615, -3.283367, 1, 0, 0, 1, 1,
-0.3967061, -0.2484677, -2.277353, 1, 0, 0, 1, 1,
-0.3892338, -0.9944286, -1.085916, 1, 0, 0, 1, 1,
-0.3878532, -0.04284624, -0.9726631, 1, 0, 0, 1, 1,
-0.3806639, -0.327889, -0.6436027, 0, 0, 0, 1, 1,
-0.3758196, 0.591421, -0.7496927, 0, 0, 0, 1, 1,
-0.3755051, 1.257607, -0.6837469, 0, 0, 0, 1, 1,
-0.3729614, 0.9090427, 0.0535493, 0, 0, 0, 1, 1,
-0.3727242, -0.8685023, -1.295487, 0, 0, 0, 1, 1,
-0.3725479, -0.1108844, -1.96529, 0, 0, 0, 1, 1,
-0.3711512, -0.7026724, -4.005327, 0, 0, 0, 1, 1,
-0.3697372, -0.1659465, -1.021375, 1, 1, 1, 1, 1,
-0.3670512, 1.619957, -0.6179332, 1, 1, 1, 1, 1,
-0.3654509, 2.055583, -0.260643, 1, 1, 1, 1, 1,
-0.3646377, 1.08858, 0.5644721, 1, 1, 1, 1, 1,
-0.3643157, 0.4119745, 1.132901, 1, 1, 1, 1, 1,
-0.3628385, -0.4150465, -2.436065, 1, 1, 1, 1, 1,
-0.3616017, -0.6473839, -2.544416, 1, 1, 1, 1, 1,
-0.3530698, 0.8659291, -1.366574, 1, 1, 1, 1, 1,
-0.3523021, -1.396201, -4.361705, 1, 1, 1, 1, 1,
-0.3472618, 1.014007, -0.3254157, 1, 1, 1, 1, 1,
-0.3460096, -1.069662, -3.449287, 1, 1, 1, 1, 1,
-0.3435862, 0.3340676, -1.655147, 1, 1, 1, 1, 1,
-0.3433719, 1.422532, -1.165765, 1, 1, 1, 1, 1,
-0.3428592, -0.6233783, -1.977819, 1, 1, 1, 1, 1,
-0.3425395, -0.6761734, -3.319361, 1, 1, 1, 1, 1,
-0.3405591, -1.09037, -2.529205, 0, 0, 1, 1, 1,
-0.339531, -0.4680849, -3.322352, 1, 0, 0, 1, 1,
-0.3393886, 0.6614054, -1.980033, 1, 0, 0, 1, 1,
-0.3360344, -0.04150073, -2.586861, 1, 0, 0, 1, 1,
-0.3356916, 0.3788136, -0.007142572, 1, 0, 0, 1, 1,
-0.3329639, -0.2037918, -2.011632, 1, 0, 0, 1, 1,
-0.3319839, 2.063733, -1.203871, 0, 0, 0, 1, 1,
-0.3317582, -0.9748905, -2.382407, 0, 0, 0, 1, 1,
-0.3308492, 0.5283849, -0.4791679, 0, 0, 0, 1, 1,
-0.3195272, 0.6174199, -1.294187, 0, 0, 0, 1, 1,
-0.3175063, -0.8426788, -3.60785, 0, 0, 0, 1, 1,
-0.3149146, 1.584041, 0.438032, 0, 0, 0, 1, 1,
-0.3141049, 0.3060445, -0.05704308, 0, 0, 0, 1, 1,
-0.3102358, -0.8155697, -3.981328, 1, 1, 1, 1, 1,
-0.3094352, 0.6637858, -1.650087, 1, 1, 1, 1, 1,
-0.3023625, 0.2949958, -2.177562, 1, 1, 1, 1, 1,
-0.2997704, -0.547549, -3.215805, 1, 1, 1, 1, 1,
-0.2988002, 0.4897032, 0.04385116, 1, 1, 1, 1, 1,
-0.2907703, 1.972069, 0.4673767, 1, 1, 1, 1, 1,
-0.2878923, -1.536788, -1.649381, 1, 1, 1, 1, 1,
-0.2844639, -0.6627458, -3.170797, 1, 1, 1, 1, 1,
-0.282853, 0.5276531, -0.01957162, 1, 1, 1, 1, 1,
-0.2825615, -1.839731, -3.555463, 1, 1, 1, 1, 1,
-0.2798054, -0.9093164, -3.906733, 1, 1, 1, 1, 1,
-0.2771323, 0.9149661, -0.5518916, 1, 1, 1, 1, 1,
-0.273403, -1.28915, -3.168746, 1, 1, 1, 1, 1,
-0.2701717, 0.5982049, -2.700859, 1, 1, 1, 1, 1,
-0.2669395, -0.2468771, -2.750441, 1, 1, 1, 1, 1,
-0.2602947, 0.4866437, 0.5367453, 0, 0, 1, 1, 1,
-0.2591889, -1.680038, -3.901667, 1, 0, 0, 1, 1,
-0.2584624, 0.5571069, -1.928028, 1, 0, 0, 1, 1,
-0.2518383, -0.48998, -3.455471, 1, 0, 0, 1, 1,
-0.2516338, 0.6174225, -0.7119575, 1, 0, 0, 1, 1,
-0.2495644, -0.7742917, -0.6721686, 1, 0, 0, 1, 1,
-0.2486249, 0.7113137, 0.8410973, 0, 0, 0, 1, 1,
-0.2442239, 1.877521, -0.2091666, 0, 0, 0, 1, 1,
-0.2404715, 0.2653817, 0.0488283, 0, 0, 0, 1, 1,
-0.2381891, -0.1736445, -1.62347, 0, 0, 0, 1, 1,
-0.2335003, 0.6810714, -1.960494, 0, 0, 0, 1, 1,
-0.2288322, -0.03907504, -0.496235, 0, 0, 0, 1, 1,
-0.2252876, 0.4702345, 0.4265989, 0, 0, 0, 1, 1,
-0.2252855, 1.181392, -0.2358198, 1, 1, 1, 1, 1,
-0.2215973, 0.1122865, -1.585699, 1, 1, 1, 1, 1,
-0.2204891, -1.117634, -3.609758, 1, 1, 1, 1, 1,
-0.2204619, -1.228118, -2.332968, 1, 1, 1, 1, 1,
-0.2200386, -0.1962455, -3.213449, 1, 1, 1, 1, 1,
-0.2198204, 0.5000895, -0.5042919, 1, 1, 1, 1, 1,
-0.218898, 1.074672, 0.6083883, 1, 1, 1, 1, 1,
-0.2179575, -1.347609, -3.950366, 1, 1, 1, 1, 1,
-0.2174571, 2.295285, 0.04145793, 1, 1, 1, 1, 1,
-0.2111115, -0.1751232, -2.886348, 1, 1, 1, 1, 1,
-0.2098514, -1.522809, -3.184323, 1, 1, 1, 1, 1,
-0.2066496, 0.5865542, -0.705065, 1, 1, 1, 1, 1,
-0.2046476, -0.3167674, -3.025986, 1, 1, 1, 1, 1,
-0.1915224, 0.6987665, 1.02025, 1, 1, 1, 1, 1,
-0.189087, -1.484552, -2.745732, 1, 1, 1, 1, 1,
-0.1875205, -1.890442, -3.176063, 0, 0, 1, 1, 1,
-0.1875136, -1.126473, -3.220806, 1, 0, 0, 1, 1,
-0.1852892, -0.7855222, -3.51542, 1, 0, 0, 1, 1,
-0.1841654, -0.7265035, -2.609273, 1, 0, 0, 1, 1,
-0.1808439, -0.02554951, -3.505046, 1, 0, 0, 1, 1,
-0.1802873, -2.709319, -2.397777, 1, 0, 0, 1, 1,
-0.1770807, 0.797509, 0.02320209, 0, 0, 0, 1, 1,
-0.1750343, 0.8236249, 0.6181534, 0, 0, 0, 1, 1,
-0.1728479, -0.1109285, -2.057456, 0, 0, 0, 1, 1,
-0.1691066, 0.2762493, -2.098482, 0, 0, 0, 1, 1,
-0.1665158, -0.118089, -1.778916, 0, 0, 0, 1, 1,
-0.1650128, -0.2137711, -2.548978, 0, 0, 0, 1, 1,
-0.1592555, 0.667164, 0.6799127, 0, 0, 0, 1, 1,
-0.1543537, 0.7699429, -0.7702965, 1, 1, 1, 1, 1,
-0.1531908, -0.5214331, -4.189732, 1, 1, 1, 1, 1,
-0.1513417, 0.3307488, -0.04729908, 1, 1, 1, 1, 1,
-0.1483423, 0.1722936, -1.743167, 1, 1, 1, 1, 1,
-0.1442988, 0.09418664, -0.889024, 1, 1, 1, 1, 1,
-0.1397729, 0.5566098, -0.4653165, 1, 1, 1, 1, 1,
-0.1374115, 0.4083967, 2.203821, 1, 1, 1, 1, 1,
-0.1348019, 1.001786, -0.7041329, 1, 1, 1, 1, 1,
-0.1338225, -1.784043, -1.199362, 1, 1, 1, 1, 1,
-0.1308679, -0.4877705, -2.64422, 1, 1, 1, 1, 1,
-0.1300485, 0.7112548, -0.5226258, 1, 1, 1, 1, 1,
-0.1299029, -0.1472815, -2.479566, 1, 1, 1, 1, 1,
-0.1295929, 0.8877028, -1.815933, 1, 1, 1, 1, 1,
-0.1278934, -0.2879579, -2.363979, 1, 1, 1, 1, 1,
-0.1223491, -0.1460579, -2.206091, 1, 1, 1, 1, 1,
-0.1172073, 3.315823, 0.3807784, 0, 0, 1, 1, 1,
-0.1170868, -0.1926996, -3.387394, 1, 0, 0, 1, 1,
-0.1134122, -1.297385, -1.635635, 1, 0, 0, 1, 1,
-0.1102682, 1.801141, 0.9185169, 1, 0, 0, 1, 1,
-0.1100442, 2.390406, 0.8029156, 1, 0, 0, 1, 1,
-0.1094602, -1.287736, -4.529316, 1, 0, 0, 1, 1,
-0.1026906, 0.2714151, -0.2898559, 0, 0, 0, 1, 1,
-0.09504054, -1.520882, -3.467007, 0, 0, 0, 1, 1,
-0.09196388, -1.233455, -2.877634, 0, 0, 0, 1, 1,
-0.08584689, 0.7135397, 1.469758, 0, 0, 0, 1, 1,
-0.07951427, 0.28731, 0.3971463, 0, 0, 0, 1, 1,
-0.07933296, 0.9086933, 1.538584, 0, 0, 0, 1, 1,
-0.07858643, 0.5789386, 0.2550115, 0, 0, 0, 1, 1,
-0.07606626, -1.075421, -4.516975, 1, 1, 1, 1, 1,
-0.0754875, 0.4950266, 0.9826459, 1, 1, 1, 1, 1,
-0.07290851, -1.024647, -1.915551, 1, 1, 1, 1, 1,
-0.0711947, -0.5156425, -4.361712, 1, 1, 1, 1, 1,
-0.07042981, 0.2634095, -0.4112447, 1, 1, 1, 1, 1,
-0.06997433, -1.305454, -3.663281, 1, 1, 1, 1, 1,
-0.06988552, -0.4771369, -2.962988, 1, 1, 1, 1, 1,
-0.06951749, -0.6414218, -2.624017, 1, 1, 1, 1, 1,
-0.06856252, 0.04533963, -0.02288327, 1, 1, 1, 1, 1,
-0.06202334, 1.662256, 0.2192758, 1, 1, 1, 1, 1,
-0.06001395, -1.238103, -2.626055, 1, 1, 1, 1, 1,
-0.05900092, 0.3039385, 0.654475, 1, 1, 1, 1, 1,
-0.05722454, 0.5550137, 0.3426515, 1, 1, 1, 1, 1,
-0.0569724, 1.148056, -0.942076, 1, 1, 1, 1, 1,
-0.05487377, 0.2927808, -0.8053406, 1, 1, 1, 1, 1,
-0.05177851, -0.5635141, -2.330125, 0, 0, 1, 1, 1,
-0.0506813, -0.619655, -4.07484, 1, 0, 0, 1, 1,
-0.04590083, -2.127551, -5.276998, 1, 0, 0, 1, 1,
-0.04400056, 0.2184075, 0.2802361, 1, 0, 0, 1, 1,
-0.04370481, -1.619929, -4.043119, 1, 0, 0, 1, 1,
-0.0435871, 1.707439, 0.08451702, 1, 0, 0, 1, 1,
-0.04339083, 0.7025859, 1.574725, 0, 0, 0, 1, 1,
-0.043138, 0.7269052, 1.141064, 0, 0, 0, 1, 1,
-0.03534047, 1.022575, -1.358002, 0, 0, 0, 1, 1,
-0.02891922, 0.5023502, -0.9254979, 0, 0, 0, 1, 1,
-0.02145192, 0.7682027, 1.251706, 0, 0, 0, 1, 1,
-0.0192001, -0.6752914, -2.865474, 0, 0, 0, 1, 1,
-0.01640103, 0.2449956, -0.2029259, 0, 0, 0, 1, 1,
-0.01459247, -0.6999723, -3.559496, 1, 1, 1, 1, 1,
-0.01318043, 0.6842023, 0.05390476, 1, 1, 1, 1, 1,
-0.007972466, -0.8418801, -3.875117, 1, 1, 1, 1, 1,
-0.005217094, 1.592741, -2.056308, 1, 1, 1, 1, 1,
0.002432115, -0.3365235, 3.420568, 1, 1, 1, 1, 1,
0.006387054, 0.005836072, 1.47014, 1, 1, 1, 1, 1,
0.006502203, -0.3036329, 2.726127, 1, 1, 1, 1, 1,
0.008825757, 1.070768, 1.791851, 1, 1, 1, 1, 1,
0.008993082, 0.5470448, 0.01140502, 1, 1, 1, 1, 1,
0.0109866, -1.283826, 3.281434, 1, 1, 1, 1, 1,
0.02133579, 0.9609414, -0.5612157, 1, 1, 1, 1, 1,
0.0235273, 0.04671825, 3.169152, 1, 1, 1, 1, 1,
0.02820061, 0.7366279, -0.09085814, 1, 1, 1, 1, 1,
0.0286973, -1.622836, 3.16584, 1, 1, 1, 1, 1,
0.03135988, 1.228898, -1.43239, 1, 1, 1, 1, 1,
0.03732046, -0.4364049, 3.924216, 0, 0, 1, 1, 1,
0.04625615, -0.3321117, 2.612144, 1, 0, 0, 1, 1,
0.0517689, -0.3309436, 3.791338, 1, 0, 0, 1, 1,
0.05462531, -0.5329835, 4.887966, 1, 0, 0, 1, 1,
0.05527526, -1.507611, 3.218257, 1, 0, 0, 1, 1,
0.05739771, 0.369106, 0.4314533, 1, 0, 0, 1, 1,
0.05827846, -0.5440875, 2.803282, 0, 0, 0, 1, 1,
0.06602293, 2.115452, 0.2650675, 0, 0, 0, 1, 1,
0.0770671, 0.7926991, -0.7538424, 0, 0, 0, 1, 1,
0.0775403, 0.0140977, 0.2007251, 0, 0, 0, 1, 1,
0.07834104, -0.5592425, 5.049343, 0, 0, 0, 1, 1,
0.07929403, 0.6457102, -0.8355285, 0, 0, 0, 1, 1,
0.07935321, -0.2419331, 3.120879, 0, 0, 0, 1, 1,
0.0834915, -1.205315, 2.698193, 1, 1, 1, 1, 1,
0.08442402, 0.3933091, 1.06122, 1, 1, 1, 1, 1,
0.08619832, 1.325087, -0.2730724, 1, 1, 1, 1, 1,
0.08628581, -1.696923, 3.366042, 1, 1, 1, 1, 1,
0.08798377, 1.056261, -1.468561, 1, 1, 1, 1, 1,
0.08819604, -2.505247, 3.50638, 1, 1, 1, 1, 1,
0.09180072, -0.4032492, 5.200837, 1, 1, 1, 1, 1,
0.09633681, 0.5702343, 1.330349, 1, 1, 1, 1, 1,
0.09808901, 0.2566344, 0.3227113, 1, 1, 1, 1, 1,
0.1023852, -0.6272919, 2.109904, 1, 1, 1, 1, 1,
0.110231, 1.216394, 1.045814, 1, 1, 1, 1, 1,
0.1118623, -1.397353, 3.056225, 1, 1, 1, 1, 1,
0.1141305, -1.224215, 3.725397, 1, 1, 1, 1, 1,
0.1149244, 0.3245772, -0.5763416, 1, 1, 1, 1, 1,
0.1153662, -0.707071, 2.854733, 1, 1, 1, 1, 1,
0.117508, -1.390234, 2.250386, 0, 0, 1, 1, 1,
0.1289831, 0.1276009, 0.8552791, 1, 0, 0, 1, 1,
0.1296048, -1.920229, 3.021986, 1, 0, 0, 1, 1,
0.1305583, -1.197227, 3.816631, 1, 0, 0, 1, 1,
0.1307337, 0.8116697, -0.5662008, 1, 0, 0, 1, 1,
0.1324581, -0.5786465, 4.489734, 1, 0, 0, 1, 1,
0.1333651, -2.244681, 2.415677, 0, 0, 0, 1, 1,
0.1337398, 0.02001234, 0.7430985, 0, 0, 0, 1, 1,
0.1346546, 0.09150494, 0.8259533, 0, 0, 0, 1, 1,
0.1358072, 1.536571, 0.3825646, 0, 0, 0, 1, 1,
0.1378872, -1.092392, 2.498053, 0, 0, 0, 1, 1,
0.1394666, 0.3367847, -1.589304, 0, 0, 0, 1, 1,
0.1461149, -1.503573, 3.188115, 0, 0, 0, 1, 1,
0.1476909, -0.6025587, 4.838241, 1, 1, 1, 1, 1,
0.1519673, 1.59341, -0.1862432, 1, 1, 1, 1, 1,
0.1541972, 0.9717199, 0.5872575, 1, 1, 1, 1, 1,
0.155677, -0.2398582, 2.322001, 1, 1, 1, 1, 1,
0.1599886, -1.023778, 2.661671, 1, 1, 1, 1, 1,
0.1645879, 0.2423958, 1.245443, 1, 1, 1, 1, 1,
0.1646442, -0.4467908, 2.233685, 1, 1, 1, 1, 1,
0.1733799, 0.8793839, -0.8885035, 1, 1, 1, 1, 1,
0.1778955, 0.5937118, 1.237199, 1, 1, 1, 1, 1,
0.1792287, -0.8940726, 3.00637, 1, 1, 1, 1, 1,
0.1849272, 0.4897438, 0.1526218, 1, 1, 1, 1, 1,
0.1849626, -0.7696363, 3.23262, 1, 1, 1, 1, 1,
0.1855981, -2.160752, 4.600105, 1, 1, 1, 1, 1,
0.186972, -1.526455, 1.65678, 1, 1, 1, 1, 1,
0.1871818, 0.8519621, -1.01101, 1, 1, 1, 1, 1,
0.187332, -1.595137, 3.426742, 0, 0, 1, 1, 1,
0.1874074, -0.2815562, 2.527345, 1, 0, 0, 1, 1,
0.1875393, -1.431716, 2.795775, 1, 0, 0, 1, 1,
0.1892627, -0.188162, 2.947414, 1, 0, 0, 1, 1,
0.1905172, 0.1679295, 2.739399, 1, 0, 0, 1, 1,
0.1936736, 0.6047389, 0.1089052, 1, 0, 0, 1, 1,
0.1942817, 0.9645776, 0.04436774, 0, 0, 0, 1, 1,
0.1950862, 1.090821, 0.4850225, 0, 0, 0, 1, 1,
0.1974275, -1.000617, 1.99594, 0, 0, 0, 1, 1,
0.1980376, 0.7169677, -0.2549891, 0, 0, 0, 1, 1,
0.2002376, 0.259086, 2.226254, 0, 0, 0, 1, 1,
0.2012011, 0.5394256, -1.398785, 0, 0, 0, 1, 1,
0.2040569, -0.9647927, 3.514767, 0, 0, 0, 1, 1,
0.2044594, -1.42667, 4.353108, 1, 1, 1, 1, 1,
0.2130531, 0.5790747, -0.01064987, 1, 1, 1, 1, 1,
0.2148247, 0.920046, -0.1092678, 1, 1, 1, 1, 1,
0.2184833, -0.1384384, 3.083351, 1, 1, 1, 1, 1,
0.2257934, -0.378785, 2.655019, 1, 1, 1, 1, 1,
0.2286386, 0.4791448, 1.143625, 1, 1, 1, 1, 1,
0.2329461, -0.6451681, 3.139574, 1, 1, 1, 1, 1,
0.2376845, 1.38619, 0.2139101, 1, 1, 1, 1, 1,
0.2383547, 1.289611, -0.6170633, 1, 1, 1, 1, 1,
0.2389123, -2.259475, 4.872144, 1, 1, 1, 1, 1,
0.2435202, -0.7243752, 2.151266, 1, 1, 1, 1, 1,
0.2484134, -0.8723758, 1.759644, 1, 1, 1, 1, 1,
0.2492501, 1.035479, 0.4110344, 1, 1, 1, 1, 1,
0.2494331, -0.2238092, 1.085504, 1, 1, 1, 1, 1,
0.2511793, 0.674364, 0.4743113, 1, 1, 1, 1, 1,
0.2512105, -0.1135601, 3.251798, 0, 0, 1, 1, 1,
0.2515998, 0.6678431, -0.7639301, 1, 0, 0, 1, 1,
0.2549907, 1.08052, 0.7844425, 1, 0, 0, 1, 1,
0.2572439, -0.7052625, 2.694558, 1, 0, 0, 1, 1,
0.258296, -0.7728475, 3.453358, 1, 0, 0, 1, 1,
0.2591085, -0.05004312, 0.7293228, 1, 0, 0, 1, 1,
0.2595217, 1.244856, 1.725438, 0, 0, 0, 1, 1,
0.2659363, 0.2888524, 2.449667, 0, 0, 0, 1, 1,
0.2681144, -0.9176628, 1.96618, 0, 0, 0, 1, 1,
0.2715227, 0.1297437, -0.9514486, 0, 0, 0, 1, 1,
0.2732589, -0.2218378, 2.594335, 0, 0, 0, 1, 1,
0.2743609, -1.74928, 3.348819, 0, 0, 0, 1, 1,
0.2761831, -0.5534876, 1.280966, 0, 0, 0, 1, 1,
0.2789757, -0.2447285, 1.622866, 1, 1, 1, 1, 1,
0.2852466, 0.2288333, 1.534146, 1, 1, 1, 1, 1,
0.2938398, -1.224768, 2.625337, 1, 1, 1, 1, 1,
0.2964153, -1.208772, 1.37368, 1, 1, 1, 1, 1,
0.2991435, 1.281651, 1.27959, 1, 1, 1, 1, 1,
0.2997169, 1.987636, 0.7979976, 1, 1, 1, 1, 1,
0.3004524, -0.05649161, 1.436467, 1, 1, 1, 1, 1,
0.3013245, 0.6658147, 0.4981151, 1, 1, 1, 1, 1,
0.309268, 0.5096611, 2.208265, 1, 1, 1, 1, 1,
0.3159239, -0.9246657, 3.935114, 1, 1, 1, 1, 1,
0.3191929, -0.1885293, 1.5612, 1, 1, 1, 1, 1,
0.3207233, -0.4656534, 2.777559, 1, 1, 1, 1, 1,
0.320779, 0.008886542, 1.207993, 1, 1, 1, 1, 1,
0.3267175, -1.577323, 4.052389, 1, 1, 1, 1, 1,
0.3327212, 1.306481, 2.423068, 1, 1, 1, 1, 1,
0.3344876, -0.6323166, 2.733618, 0, 0, 1, 1, 1,
0.3347746, -0.0912885, 1.441672, 1, 0, 0, 1, 1,
0.3365902, 2.69186, -1.083185, 1, 0, 0, 1, 1,
0.3427698, 0.9848155, -0.3478503, 1, 0, 0, 1, 1,
0.3446054, 0.09470831, 0.5945305, 1, 0, 0, 1, 1,
0.3516918, 0.8131128, 0.05369532, 1, 0, 0, 1, 1,
0.352625, 0.5696267, 0.2307556, 0, 0, 0, 1, 1,
0.355489, -0.6733893, 2.44133, 0, 0, 0, 1, 1,
0.3565239, 0.5617946, 1.200939, 0, 0, 0, 1, 1,
0.3586865, 0.7932198, 0.224683, 0, 0, 0, 1, 1,
0.3601412, 1.242185, 1.639647, 0, 0, 0, 1, 1,
0.3627284, 0.526713, 1.457466, 0, 0, 0, 1, 1,
0.3655119, 0.3949736, 1.468779, 0, 0, 0, 1, 1,
0.3662466, -0.3003444, 2.853745, 1, 1, 1, 1, 1,
0.3697564, 1.391045, 2.037964, 1, 1, 1, 1, 1,
0.3710482, 0.7750153, -0.3363885, 1, 1, 1, 1, 1,
0.3721967, -1.995291, 3.594981, 1, 1, 1, 1, 1,
0.3769393, 0.3823326, 1.683724, 1, 1, 1, 1, 1,
0.378794, -0.9533725, 3.72598, 1, 1, 1, 1, 1,
0.383437, 2.566446, -0.09259708, 1, 1, 1, 1, 1,
0.385081, 1.190324, 0.2873735, 1, 1, 1, 1, 1,
0.3853112, 0.03632721, 2.018316, 1, 1, 1, 1, 1,
0.3894666, -0.06804846, 2.024221, 1, 1, 1, 1, 1,
0.3898434, -0.08576251, 2.337628, 1, 1, 1, 1, 1,
0.397177, 0.6607699, 1.368007, 1, 1, 1, 1, 1,
0.4045092, -0.9069452, 2.672856, 1, 1, 1, 1, 1,
0.4077018, 1.811346, -0.4034179, 1, 1, 1, 1, 1,
0.4098924, 0.4471986, 0.1625656, 1, 1, 1, 1, 1,
0.4137023, -1.479374, 1.924551, 0, 0, 1, 1, 1,
0.4138841, -1.102576, 2.447449, 1, 0, 0, 1, 1,
0.4149655, -0.6444272, 1.826359, 1, 0, 0, 1, 1,
0.4156911, -1.387609, 2.212898, 1, 0, 0, 1, 1,
0.417221, -0.9386685, 3.371602, 1, 0, 0, 1, 1,
0.4204416, -1.840399, 5.150842, 1, 0, 0, 1, 1,
0.42763, -1.110703, 4.860242, 0, 0, 0, 1, 1,
0.4280855, -1.604291, 3.205524, 0, 0, 0, 1, 1,
0.429256, -0.8482214, 1.570639, 0, 0, 0, 1, 1,
0.4360245, 0.4414183, -0.2375231, 0, 0, 0, 1, 1,
0.4373591, -0.1431199, 3.301253, 0, 0, 0, 1, 1,
0.4387573, 0.3774435, 2.327446, 0, 0, 0, 1, 1,
0.4459217, -1.54717, 1.957044, 0, 0, 0, 1, 1,
0.4475307, 1.113258, -2.022531, 1, 1, 1, 1, 1,
0.4479667, 0.8152701, -1.662991, 1, 1, 1, 1, 1,
0.4508315, -0.1394289, 1.322224, 1, 1, 1, 1, 1,
0.4533904, 1.287324, -1.272742, 1, 1, 1, 1, 1,
0.4556851, 1.541816, 1.216734, 1, 1, 1, 1, 1,
0.4571717, -0.419632, 1.705052, 1, 1, 1, 1, 1,
0.4632659, -1.116097, 2.926085, 1, 1, 1, 1, 1,
0.4656091, 0.6469296, 1.313859, 1, 1, 1, 1, 1,
0.4688496, 1.587247, -0.5747541, 1, 1, 1, 1, 1,
0.4701996, 0.3758038, -0.06252938, 1, 1, 1, 1, 1,
0.4708408, -0.8131214, 2.202706, 1, 1, 1, 1, 1,
0.4712769, -0.7714859, 2.743278, 1, 1, 1, 1, 1,
0.4748904, 2.11805, 0.0645849, 1, 1, 1, 1, 1,
0.4772222, -0.0135196, 2.434896, 1, 1, 1, 1, 1,
0.4777839, -0.2116126, 2.795641, 1, 1, 1, 1, 1,
0.4779247, 0.01704036, 0.148813, 0, 0, 1, 1, 1,
0.4802544, -0.567535, 1.534399, 1, 0, 0, 1, 1,
0.480391, 0.5811359, 1.504803, 1, 0, 0, 1, 1,
0.4842626, 0.8535969, -0.08270666, 1, 0, 0, 1, 1,
0.4864512, 0.7327279, 0.5296168, 1, 0, 0, 1, 1,
0.4878269, -0.7211044, 2.496307, 1, 0, 0, 1, 1,
0.4881389, 1.107617, -0.02803686, 0, 0, 0, 1, 1,
0.4928662, 0.4246974, 0.5383916, 0, 0, 0, 1, 1,
0.4981915, -0.794525, 2.226944, 0, 0, 0, 1, 1,
0.502069, -1.72012, 2.108756, 0, 0, 0, 1, 1,
0.5021674, -0.6370674, 1.590977, 0, 0, 0, 1, 1,
0.5029554, 0.001687971, 0.5246023, 0, 0, 0, 1, 1,
0.5045171, 0.9703687, -1.437756, 0, 0, 0, 1, 1,
0.5088121, -0.4235791, 1.683201, 1, 1, 1, 1, 1,
0.5090776, 2.078552, 1.007878, 1, 1, 1, 1, 1,
0.5099702, -0.3913628, 2.169117, 1, 1, 1, 1, 1,
0.5114384, 0.4750231, 0.8523164, 1, 1, 1, 1, 1,
0.5158969, -1.072346, 3.750757, 1, 1, 1, 1, 1,
0.5170745, -0.8435099, 2.771527, 1, 1, 1, 1, 1,
0.5200182, -0.1704062, 1.178372, 1, 1, 1, 1, 1,
0.5291416, 1.249404, 0.7164473, 1, 1, 1, 1, 1,
0.5336105, -0.09881094, 3.442174, 1, 1, 1, 1, 1,
0.5348443, 0.7753022, 0.09258054, 1, 1, 1, 1, 1,
0.5376601, -0.2350811, 2.759249, 1, 1, 1, 1, 1,
0.5387911, -0.1840407, 3.793209, 1, 1, 1, 1, 1,
0.5421574, -1.78871, 3.512784, 1, 1, 1, 1, 1,
0.5421653, -0.2691736, 2.059709, 1, 1, 1, 1, 1,
0.5455308, 1.470302, 0.5620843, 1, 1, 1, 1, 1,
0.5527521, 0.7992808, -2.680353, 0, 0, 1, 1, 1,
0.554251, 1.524415, -0.151332, 1, 0, 0, 1, 1,
0.5551645, 0.1246017, 1.977367, 1, 0, 0, 1, 1,
0.5615258, 1.127654, 0.4666051, 1, 0, 0, 1, 1,
0.561931, -1.740365, 0.6210666, 1, 0, 0, 1, 1,
0.5654392, 0.6532441, 2.439447, 1, 0, 0, 1, 1,
0.568264, -0.8812456, 3.913477, 0, 0, 0, 1, 1,
0.5683478, -0.9558818, 1.247249, 0, 0, 0, 1, 1,
0.5700251, -1.540379, 1.339543, 0, 0, 0, 1, 1,
0.570165, 1.925538, 0.835181, 0, 0, 0, 1, 1,
0.5733238, -0.4785444, 2.058345, 0, 0, 0, 1, 1,
0.5786626, -1.171062, 3.488451, 0, 0, 0, 1, 1,
0.5797603, -2.089328, 4.010882, 0, 0, 0, 1, 1,
0.5805202, 0.08268283, 1.122647, 1, 1, 1, 1, 1,
0.5816061, 0.6855882, -1.616802, 1, 1, 1, 1, 1,
0.5845096, -0.1931489, 1.773189, 1, 1, 1, 1, 1,
0.5939385, -0.549638, 1.120257, 1, 1, 1, 1, 1,
0.5945289, -0.9449444, 2.000931, 1, 1, 1, 1, 1,
0.601253, 0.5943493, 0.8806525, 1, 1, 1, 1, 1,
0.6050441, 0.9233155, 0.7155867, 1, 1, 1, 1, 1,
0.6102527, -1.262373, 2.459132, 1, 1, 1, 1, 1,
0.6110892, 1.987069, 1.538827, 1, 1, 1, 1, 1,
0.6111804, -0.6887026, 4.892725, 1, 1, 1, 1, 1,
0.6128705, -0.8667575, 2.605247, 1, 1, 1, 1, 1,
0.6153046, 1.484349, 1.40404, 1, 1, 1, 1, 1,
0.6156942, -0.7876844, 3.48585, 1, 1, 1, 1, 1,
0.6161164, -0.01971656, 0.7685494, 1, 1, 1, 1, 1,
0.6177793, -0.3851458, 3.123145, 1, 1, 1, 1, 1,
0.6213862, -1.816074, 1.854657, 0, 0, 1, 1, 1,
0.6218603, -1.941786, 1.624901, 1, 0, 0, 1, 1,
0.6237748, 0.5342033, -0.07158913, 1, 0, 0, 1, 1,
0.6246078, -0.4499766, 1.32416, 1, 0, 0, 1, 1,
0.6304379, 0.3494552, 0.727605, 1, 0, 0, 1, 1,
0.6391899, 0.8646424, 1.685909, 1, 0, 0, 1, 1,
0.6405978, -0.8729626, 3.419631, 0, 0, 0, 1, 1,
0.6418967, 1.560092, -0.02811224, 0, 0, 0, 1, 1,
0.6503972, -0.1519447, 1.429991, 0, 0, 0, 1, 1,
0.6549744, 1.563257, 0.290307, 0, 0, 0, 1, 1,
0.6567246, -0.5972562, 0.9708516, 0, 0, 0, 1, 1,
0.6579375, 0.6115656, 1.797351, 0, 0, 0, 1, 1,
0.6626693, -2.310306, 3.055565, 0, 0, 0, 1, 1,
0.6644779, -1.476179, 2.621729, 1, 1, 1, 1, 1,
0.6653134, -0.1961343, 3.062579, 1, 1, 1, 1, 1,
0.6700398, -0.4863606, 1.032772, 1, 1, 1, 1, 1,
0.6740821, 0.2656339, 0.5546759, 1, 1, 1, 1, 1,
0.6828527, -0.005833713, 1.740752, 1, 1, 1, 1, 1,
0.6861672, 1.552027, 0.3464487, 1, 1, 1, 1, 1,
0.69069, -0.224397, 2.341356, 1, 1, 1, 1, 1,
0.6907204, -0.6078686, 1.670261, 1, 1, 1, 1, 1,
0.6959972, -0.8297756, 1.837385, 1, 1, 1, 1, 1,
0.696638, -0.2530259, 0.9064307, 1, 1, 1, 1, 1,
0.6986982, -0.8009678, 2.734313, 1, 1, 1, 1, 1,
0.6994382, 0.3006794, 1.348203, 1, 1, 1, 1, 1,
0.7020882, 0.4061825, 1.092588, 1, 1, 1, 1, 1,
0.7032071, 0.1885456, 1.323266, 1, 1, 1, 1, 1,
0.704402, 0.7922168, -0.7257985, 1, 1, 1, 1, 1,
0.7118281, 1.712481, -0.3214121, 0, 0, 1, 1, 1,
0.7123203, -1.74315, 2.047431, 1, 0, 0, 1, 1,
0.7133361, 0.7135292, 0.9601595, 1, 0, 0, 1, 1,
0.7178509, -0.1974136, 0.5607109, 1, 0, 0, 1, 1,
0.7236637, -0.2943073, 0.9320995, 1, 0, 0, 1, 1,
0.7248033, -0.2549858, 2.41323, 1, 0, 0, 1, 1,
0.7252457, -1.098775, 2.878297, 0, 0, 0, 1, 1,
0.7283828, -2.842452, 1.808529, 0, 0, 0, 1, 1,
0.7332833, -0.004292066, 1.976404, 0, 0, 0, 1, 1,
0.7374899, 1.107306, 1.392469, 0, 0, 0, 1, 1,
0.738885, -2.158214, 2.233733, 0, 0, 0, 1, 1,
0.7476993, -2.364212, 1.772018, 0, 0, 0, 1, 1,
0.7491493, 1.358853, 1.132087, 0, 0, 0, 1, 1,
0.7491782, -1.16173, 2.434505, 1, 1, 1, 1, 1,
0.7497163, 0.2942331, 0.4980134, 1, 1, 1, 1, 1,
0.7523855, -1.035857, 1.171124, 1, 1, 1, 1, 1,
0.7591054, 0.07290254, 2.735857, 1, 1, 1, 1, 1,
0.7618943, 0.9895582, 1.552059, 1, 1, 1, 1, 1,
0.7621746, 0.536165, 0.5135395, 1, 1, 1, 1, 1,
0.7632303, -1.31452, 3.482364, 1, 1, 1, 1, 1,
0.7651566, 1.504134, 1.125838, 1, 1, 1, 1, 1,
0.7717609, -0.04860039, 2.436593, 1, 1, 1, 1, 1,
0.7771786, 0.4609941, 1.053849, 1, 1, 1, 1, 1,
0.7824864, 0.763083, 1.240117, 1, 1, 1, 1, 1,
0.7842118, 0.2869316, 0.6955566, 1, 1, 1, 1, 1,
0.7863595, 1.451093, 1.889852, 1, 1, 1, 1, 1,
0.7879869, -1.832575, 1.201773, 1, 1, 1, 1, 1,
0.7956426, -0.1239955, 1.77224, 1, 1, 1, 1, 1,
0.8004199, -0.6175687, 2.661597, 0, 0, 1, 1, 1,
0.8033569, -0.5449312, 2.813615, 1, 0, 0, 1, 1,
0.8096763, -0.7127975, 1.696231, 1, 0, 0, 1, 1,
0.8131475, 0.4786731, 1.57561, 1, 0, 0, 1, 1,
0.8160183, 2.339067, 0.2272067, 1, 0, 0, 1, 1,
0.8255054, -1.07512, 2.846928, 1, 0, 0, 1, 1,
0.8271272, -0.3016692, 1.762251, 0, 0, 0, 1, 1,
0.8287717, -0.8919281, 2.195734, 0, 0, 0, 1, 1,
0.8294691, -0.3276541, 1.74885, 0, 0, 0, 1, 1,
0.8370762, -0.4149143, 1.582796, 0, 0, 0, 1, 1,
0.8402254, 0.4612143, 0.8976582, 0, 0, 0, 1, 1,
0.841844, -0.3983049, 2.192477, 0, 0, 0, 1, 1,
0.8488766, -0.3241151, 1.260043, 0, 0, 0, 1, 1,
0.8501644, 0.04603062, 0.9419606, 1, 1, 1, 1, 1,
0.8546799, -1.860672, 2.311939, 1, 1, 1, 1, 1,
0.8551037, -0.584792, 1.904048, 1, 1, 1, 1, 1,
0.8585813, -0.6832588, 0.00356353, 1, 1, 1, 1, 1,
0.859848, -0.1068019, 2.01158, 1, 1, 1, 1, 1,
0.8702727, -0.4706048, 0.7745895, 1, 1, 1, 1, 1,
0.8716905, -0.2534671, 2.181973, 1, 1, 1, 1, 1,
0.8719288, 0.9225017, 0.9914294, 1, 1, 1, 1, 1,
0.8774129, -1.482606, 1.646601, 1, 1, 1, 1, 1,
0.8829858, -0.9217305, 3.447782, 1, 1, 1, 1, 1,
0.8832404, 0.07843999, 2.926004, 1, 1, 1, 1, 1,
0.883742, -2.188841, 3.245783, 1, 1, 1, 1, 1,
0.884802, 0.6132485, 0.9840444, 1, 1, 1, 1, 1,
0.8872449, 0.1587172, 0.3142165, 1, 1, 1, 1, 1,
0.8879793, -0.6629925, 3.350842, 1, 1, 1, 1, 1,
0.8930771, -0.04312225, 1.328201, 0, 0, 1, 1, 1,
0.8985312, -0.7370178, 0.9504545, 1, 0, 0, 1, 1,
0.898548, -0.1700814, 2.281796, 1, 0, 0, 1, 1,
0.9009452, 0.7922014, 2.589682, 1, 0, 0, 1, 1,
0.9076287, -1.673598, 3.034021, 1, 0, 0, 1, 1,
0.9083996, 0.2524793, 1.02552, 1, 0, 0, 1, 1,
0.9127256, -0.3107324, 2.613238, 0, 0, 0, 1, 1,
0.9150472, 1.102882, 0.1595621, 0, 0, 0, 1, 1,
0.9177263, -0.1007911, 1.163772, 0, 0, 0, 1, 1,
0.9222226, -0.4357687, 2.566209, 0, 0, 0, 1, 1,
0.9222826, -0.8925329, 3.552881, 0, 0, 0, 1, 1,
0.9326727, 1.007315, 1.771249, 0, 0, 0, 1, 1,
0.9373146, -1.311365, 1.633198, 0, 0, 0, 1, 1,
0.9423649, -1.340389, 2.026311, 1, 1, 1, 1, 1,
0.9472457, 0.7063056, -0.1314559, 1, 1, 1, 1, 1,
0.9506608, 0.4989083, 2.328763, 1, 1, 1, 1, 1,
0.9535832, 1.296132, 1.55223, 1, 1, 1, 1, 1,
0.9546318, 0.4942158, 1.421613, 1, 1, 1, 1, 1,
0.9560898, -0.1668044, 0.553753, 1, 1, 1, 1, 1,
0.9635504, -0.9046686, 3.262313, 1, 1, 1, 1, 1,
0.9640796, -0.7683389, 0.8613867, 1, 1, 1, 1, 1,
0.9652786, -1.100885, 1.588677, 1, 1, 1, 1, 1,
0.969465, 0.001621176, 2.135731, 1, 1, 1, 1, 1,
0.9806258, -0.3888302, 3.113168, 1, 1, 1, 1, 1,
0.9824906, 0.7958436, 0.6267874, 1, 1, 1, 1, 1,
0.9857239, 0.38076, 2.143569, 1, 1, 1, 1, 1,
0.9864888, 1.952675, -0.7261158, 1, 1, 1, 1, 1,
0.9931808, -0.4772482, 3.464891, 1, 1, 1, 1, 1,
0.9952784, -1.42945, 1.193476, 0, 0, 1, 1, 1,
0.9968904, 1.910009, 1.956603, 1, 0, 0, 1, 1,
0.9999648, 0.3492384, 3.332442, 1, 0, 0, 1, 1,
1.000333, 0.181354, -0.05713683, 1, 0, 0, 1, 1,
1.003313, 1.336216, -0.2360914, 1, 0, 0, 1, 1,
1.003741, -0.3667075, 2.76764, 1, 0, 0, 1, 1,
1.003801, -0.1095704, 3.62308, 0, 0, 0, 1, 1,
1.006791, -0.04998619, 2.132463, 0, 0, 0, 1, 1,
1.006942, 0.1013411, 0.1533038, 0, 0, 0, 1, 1,
1.008812, 0.6120613, 1.102951, 0, 0, 0, 1, 1,
1.009564, 1.961994, 1.043248, 0, 0, 0, 1, 1,
1.010206, 1.768492, 0.7361404, 0, 0, 0, 1, 1,
1.012194, 0.2601804, 3.2834, 0, 0, 0, 1, 1,
1.012992, -1.178522, 3.79633, 1, 1, 1, 1, 1,
1.015878, -0.561311, 1.46456, 1, 1, 1, 1, 1,
1.018239, -0.368669, 1.770645, 1, 1, 1, 1, 1,
1.02098, 0.9147616, -0.8121396, 1, 1, 1, 1, 1,
1.02931, 0.09051487, 1.681225, 1, 1, 1, 1, 1,
1.035516, 0.7107012, 2.199375, 1, 1, 1, 1, 1,
1.036348, 0.4766665, 1.064592, 1, 1, 1, 1, 1,
1.037812, -0.9157166, 2.59412, 1, 1, 1, 1, 1,
1.039897, 0.2145798, 0.1874045, 1, 1, 1, 1, 1,
1.046471, -0.6580569, 2.640651, 1, 1, 1, 1, 1,
1.046499, 0.3958745, 0.3196557, 1, 1, 1, 1, 1,
1.047379, -0.8650889, 3.74244, 1, 1, 1, 1, 1,
1.047725, -0.5928843, 2.539584, 1, 1, 1, 1, 1,
1.048531, 1.093174, -0.3870912, 1, 1, 1, 1, 1,
1.050146, -1.334243, 1.361927, 1, 1, 1, 1, 1,
1.057181, 1.23723, -0.4752026, 0, 0, 1, 1, 1,
1.057701, 0.93294, 1.164886, 1, 0, 0, 1, 1,
1.066889, 0.1453477, 1.694805, 1, 0, 0, 1, 1,
1.067613, 1.345503, 0.9969627, 1, 0, 0, 1, 1,
1.068905, 0.6887577, 1.415124, 1, 0, 0, 1, 1,
1.06941, -1.712193, 1.851511, 1, 0, 0, 1, 1,
1.069824, -0.7369245, 2.199216, 0, 0, 0, 1, 1,
1.079242, 0.6467019, 2.505095, 0, 0, 0, 1, 1,
1.097254, -0.1172838, 0.09397817, 0, 0, 0, 1, 1,
1.106176, -0.1299834, 2.322729, 0, 0, 0, 1, 1,
1.109403, 1.221254, -0.9024408, 0, 0, 0, 1, 1,
1.114252, 0.1922219, 1.425894, 0, 0, 0, 1, 1,
1.115137, 0.9094063, 0.1397856, 0, 0, 0, 1, 1,
1.121478, 1.327723, 0.3440582, 1, 1, 1, 1, 1,
1.125836, -1.348394, 0.8906122, 1, 1, 1, 1, 1,
1.128926, 0.4365272, 0.8007939, 1, 1, 1, 1, 1,
1.13161, -1.358888, 2.687836, 1, 1, 1, 1, 1,
1.132638, -1.35492, 2.766842, 1, 1, 1, 1, 1,
1.151106, 0.1581431, 2.508751, 1, 1, 1, 1, 1,
1.156249, 1.226867, 0.7371739, 1, 1, 1, 1, 1,
1.158346, 0.694192, 1.154589, 1, 1, 1, 1, 1,
1.162077, 0.1370392, -0.725301, 1, 1, 1, 1, 1,
1.177403, 1.439816, 1.353202, 1, 1, 1, 1, 1,
1.184583, -0.4629539, 2.075984, 1, 1, 1, 1, 1,
1.201563, 0.4641733, 1.999921, 1, 1, 1, 1, 1,
1.212387, -0.07262342, 0.4919156, 1, 1, 1, 1, 1,
1.212434, -1.626488, 0.7851211, 1, 1, 1, 1, 1,
1.216846, 1.905466, 1.408307, 1, 1, 1, 1, 1,
1.236132, -0.2241134, 1.056856, 0, 0, 1, 1, 1,
1.236998, -0.5355529, 3.286298, 1, 0, 0, 1, 1,
1.25117, 1.361681, -1.465953, 1, 0, 0, 1, 1,
1.25447, 0.2787922, 1.81495, 1, 0, 0, 1, 1,
1.255236, 2.146529, 0.2760125, 1, 0, 0, 1, 1,
1.264068, -0.5019649, 1.452939, 1, 0, 0, 1, 1,
1.264578, 0.632252, 1.441351, 0, 0, 0, 1, 1,
1.267167, 0.3131, 2.807479, 0, 0, 0, 1, 1,
1.281306, -0.3905291, 1.670273, 0, 0, 0, 1, 1,
1.281438, -1.892695, 3.282676, 0, 0, 0, 1, 1,
1.301124, -1.248872, 2.566582, 0, 0, 0, 1, 1,
1.308509, 1.535581, 0.710211, 0, 0, 0, 1, 1,
1.310502, -0.06306098, 2.029305, 0, 0, 0, 1, 1,
1.318229, 1.409816, 0.6617956, 1, 1, 1, 1, 1,
1.321814, 0.1486591, 1.239907, 1, 1, 1, 1, 1,
1.327766, -1.208761, 3.793895, 1, 1, 1, 1, 1,
1.340587, -1.649946, 1.940238, 1, 1, 1, 1, 1,
1.341419, -0.04568524, 1.122424, 1, 1, 1, 1, 1,
1.352664, -1.445096, 2.838017, 1, 1, 1, 1, 1,
1.394104, -0.5716107, 1.669163, 1, 1, 1, 1, 1,
1.404745, -1.894245, 3.406744, 1, 1, 1, 1, 1,
1.407965, -1.441563, 3.290395, 1, 1, 1, 1, 1,
1.413568, 0.5053939, 1.118513, 1, 1, 1, 1, 1,
1.420644, 0.2005165, 0.903017, 1, 1, 1, 1, 1,
1.427887, 1.207702, 0.3719642, 1, 1, 1, 1, 1,
1.450585, 0.2605178, 2.524387, 1, 1, 1, 1, 1,
1.457597, -0.1436896, 2.68797, 1, 1, 1, 1, 1,
1.458963, -0.3386276, 1.283716, 1, 1, 1, 1, 1,
1.47503, 0.6908659, 1.636646, 0, 0, 1, 1, 1,
1.482929, 0.796379, 0.7611343, 1, 0, 0, 1, 1,
1.487671, 0.5304043, 2.188166, 1, 0, 0, 1, 1,
1.492143, -0.7146516, 0.7496813, 1, 0, 0, 1, 1,
1.49477, -1.69075, 1.964641, 1, 0, 0, 1, 1,
1.50218, 0.5791659, 2.918536, 1, 0, 0, 1, 1,
1.503047, 0.5777147, 2.601928, 0, 0, 0, 1, 1,
1.503215, 1.070331, 1.263025, 0, 0, 0, 1, 1,
1.517483, -0.3307304, 0.09934085, 0, 0, 0, 1, 1,
1.518108, -1.141881, 2.218174, 0, 0, 0, 1, 1,
1.520434, -1.439159, 2.923582, 0, 0, 0, 1, 1,
1.528186, -0.274725, 1.70822, 0, 0, 0, 1, 1,
1.529573, 0.2989274, 1.453948, 0, 0, 0, 1, 1,
1.534482, 1.69048, 1.501773, 1, 1, 1, 1, 1,
1.534989, 0.04968354, 2.918414, 1, 1, 1, 1, 1,
1.541333, 0.4160047, 1.728502, 1, 1, 1, 1, 1,
1.542423, -0.6739892, 2.093509, 1, 1, 1, 1, 1,
1.542448, -0.01779189, 0.3167475, 1, 1, 1, 1, 1,
1.549814, 1.806229, 1.151336, 1, 1, 1, 1, 1,
1.554257, -0.6346238, 1.703235, 1, 1, 1, 1, 1,
1.562912, 0.8260432, 0.3135722, 1, 1, 1, 1, 1,
1.564391, 1.404774, -0.5632504, 1, 1, 1, 1, 1,
1.584878, -0.1861852, 0.7613643, 1, 1, 1, 1, 1,
1.585658, 0.773895, 0.06020527, 1, 1, 1, 1, 1,
1.599468, 1.180202, 1.291861, 1, 1, 1, 1, 1,
1.605667, 1.516453, 2.081442, 1, 1, 1, 1, 1,
1.611032, -1.418326, 1.601915, 1, 1, 1, 1, 1,
1.625054, -1.427628, 0.4532024, 1, 1, 1, 1, 1,
1.629538, 0.81522, 0.6151657, 0, 0, 1, 1, 1,
1.635255, 0.7389027, 0.9360808, 1, 0, 0, 1, 1,
1.641197, -1.383148, 2.843861, 1, 0, 0, 1, 1,
1.642642, 0.4531274, 1.742871, 1, 0, 0, 1, 1,
1.683716, -1.042, 1.424291, 1, 0, 0, 1, 1,
1.689009, -0.6142124, 1.08278, 1, 0, 0, 1, 1,
1.70342, -0.6346797, 1.853509, 0, 0, 0, 1, 1,
1.729491, -1.943434, 1.765074, 0, 0, 0, 1, 1,
1.737844, -1.250819, 2.928411, 0, 0, 0, 1, 1,
1.758049, 1.027246, 1.363263, 0, 0, 0, 1, 1,
1.763205, -0.7304287, 1.052274, 0, 0, 0, 1, 1,
1.771011, -2.037112, 2.077134, 0, 0, 0, 1, 1,
1.774351, 0.4399052, 0.6236549, 0, 0, 0, 1, 1,
1.779649, -0.7763198, 2.372269, 1, 1, 1, 1, 1,
1.808399, -0.2965145, 2.058701, 1, 1, 1, 1, 1,
1.808868, -0.0379179, 2.060616, 1, 1, 1, 1, 1,
1.825115, -0.6374335, 2.090453, 1, 1, 1, 1, 1,
1.834607, 0.7335153, -0.7167369, 1, 1, 1, 1, 1,
1.840035, 0.9304731, 2.721261, 1, 1, 1, 1, 1,
1.874988, 0.4550442, 0.6651132, 1, 1, 1, 1, 1,
1.884752, -0.3304758, 3.100562, 1, 1, 1, 1, 1,
1.908805, -0.2880656, 1.336428, 1, 1, 1, 1, 1,
2.004096, 1.228032, 1.700694, 1, 1, 1, 1, 1,
2.02648, -0.08908307, -0.08562527, 1, 1, 1, 1, 1,
2.032389, 0.7095498, 1.150218, 1, 1, 1, 1, 1,
2.041982, 0.3057283, 3.099733, 1, 1, 1, 1, 1,
2.087465, -1.157761, 0.97271, 1, 1, 1, 1, 1,
2.117848, -0.2131621, 1.569121, 1, 1, 1, 1, 1,
2.161172, -1.866655, 3.546344, 0, 0, 1, 1, 1,
2.208578, 0.8196664, 1.622108, 1, 0, 0, 1, 1,
2.229312, 0.1587968, 0.002273832, 1, 0, 0, 1, 1,
2.267445, -1.111749, 0.9352764, 1, 0, 0, 1, 1,
2.270154, 0.7122445, 3.031558, 1, 0, 0, 1, 1,
2.277735, -0.09514411, 2.239126, 1, 0, 0, 1, 1,
2.286091, -0.3639434, 1.23683, 0, 0, 0, 1, 1,
2.316352, 1.559625, 2.4307, 0, 0, 0, 1, 1,
2.317943, -0.3969198, 3.146395, 0, 0, 0, 1, 1,
2.378615, 1.305105, 1.365361, 0, 0, 0, 1, 1,
2.384346, 0.3291805, 1.094, 0, 0, 0, 1, 1,
2.435418, 0.1924281, 1.102559, 0, 0, 0, 1, 1,
2.469899, 1.681168, -1.18492, 0, 0, 0, 1, 1,
2.497473, -0.2049309, 2.233487, 1, 1, 1, 1, 1,
2.648856, 0.4799932, 1.061194, 1, 1, 1, 1, 1,
2.702256, 2.034024, 0.4395323, 1, 1, 1, 1, 1,
2.724418, -0.4434063, 1.568525, 1, 1, 1, 1, 1,
2.770841, 0.5515379, 0.671394, 1, 1, 1, 1, 1,
3.104565, -0.5271257, 0.6684853, 1, 1, 1, 1, 1,
3.625435, 0.6755711, 1.647855, 1, 1, 1, 1, 1
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
var radius = 9.749208;
var distance = 34.24368;
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
mvMatrix.translate( -0.1428602, -0.2366853, 0.2658825 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24368);
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
