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
-3.205384, 1.345774, -0.6227113, 1, 0, 0, 1,
-3.138019, -1.319531, -3.673586, 1, 0.007843138, 0, 1,
-2.877467, 1.545321, 0.1341544, 1, 0.01176471, 0, 1,
-2.710985, -0.1311618, -1.339824, 1, 0.01960784, 0, 1,
-2.547153, 0.1660017, -2.420814, 1, 0.02352941, 0, 1,
-2.515846, -0.5087491, -1.490075, 1, 0.03137255, 0, 1,
-2.506175, 0.9088694, -1.867709, 1, 0.03529412, 0, 1,
-2.414953, -0.4209662, -2.812851, 1, 0.04313726, 0, 1,
-2.404209, -0.1470288, -2.444955, 1, 0.04705882, 0, 1,
-2.35778, 0.1933181, -2.149451, 1, 0.05490196, 0, 1,
-2.322035, -1.216032, -1.769325, 1, 0.05882353, 0, 1,
-2.264988, 0.1949645, -2.384257, 1, 0.06666667, 0, 1,
-2.208251, 0.6296929, -1.717624, 1, 0.07058824, 0, 1,
-2.190114, 0.7620275, -0.9300634, 1, 0.07843138, 0, 1,
-2.054009, -0.6245425, -3.040138, 1, 0.08235294, 0, 1,
-2.007423, -0.03603049, -2.437736, 1, 0.09019608, 0, 1,
-2.005951, 0.6689099, -1.582495, 1, 0.09411765, 0, 1,
-1.973457, -1.419614, -3.653079, 1, 0.1019608, 0, 1,
-1.97339, 0.613017, -1.414339, 1, 0.1098039, 0, 1,
-1.938211, 0.2308504, -0.4636739, 1, 0.1137255, 0, 1,
-1.911168, -0.6180263, -0.4390735, 1, 0.1215686, 0, 1,
-1.89212, -0.1935047, -1.370813, 1, 0.1254902, 0, 1,
-1.886111, -0.1045476, -1.922517, 1, 0.1333333, 0, 1,
-1.846481, -2.167553, -2.078713, 1, 0.1372549, 0, 1,
-1.837012, 0.5669742, -0.6468785, 1, 0.145098, 0, 1,
-1.825811, -0.3728016, -2.374346, 1, 0.1490196, 0, 1,
-1.776565, -0.9780484, -1.211417, 1, 0.1568628, 0, 1,
-1.761629, -0.1014178, -2.401423, 1, 0.1607843, 0, 1,
-1.749819, -0.1122116, -3.347506, 1, 0.1686275, 0, 1,
-1.736682, -0.9499177, -3.072919, 1, 0.172549, 0, 1,
-1.728155, -1.35423, -1.874734, 1, 0.1803922, 0, 1,
-1.725903, 1.278945, -1.174428, 1, 0.1843137, 0, 1,
-1.714577, -1.612594, -3.383014, 1, 0.1921569, 0, 1,
-1.713546, -0.5029032, -0.709608, 1, 0.1960784, 0, 1,
-1.710566, -0.1786225, -2.262882, 1, 0.2039216, 0, 1,
-1.709504, -0.8106464, -1.081027, 1, 0.2117647, 0, 1,
-1.705081, -0.8397432, -3.212973, 1, 0.2156863, 0, 1,
-1.691322, -0.6318277, -0.729076, 1, 0.2235294, 0, 1,
-1.68951, -0.4085365, -3.259476, 1, 0.227451, 0, 1,
-1.688103, 0.3994232, -2.40403, 1, 0.2352941, 0, 1,
-1.683393, 0.9734216, -4.379014, 1, 0.2392157, 0, 1,
-1.668725, 1.254515, -0.5822574, 1, 0.2470588, 0, 1,
-1.658736, 0.7046598, -0.4136113, 1, 0.2509804, 0, 1,
-1.651182, -0.8315616, -4.473126, 1, 0.2588235, 0, 1,
-1.639089, 0.2059695, -1.043669, 1, 0.2627451, 0, 1,
-1.633694, -2.937172, -2.10664, 1, 0.2705882, 0, 1,
-1.619495, -1.132468, -3.026231, 1, 0.2745098, 0, 1,
-1.61613, -1.333069, -3.091671, 1, 0.282353, 0, 1,
-1.61042, -0.2979298, 0.147548, 1, 0.2862745, 0, 1,
-1.60442, -0.2841447, -1.909877, 1, 0.2941177, 0, 1,
-1.594464, 0.8319398, -0.5495553, 1, 0.3019608, 0, 1,
-1.589845, 0.04930759, -0.9416048, 1, 0.3058824, 0, 1,
-1.589501, 0.4148082, 0.02853268, 1, 0.3137255, 0, 1,
-1.581062, 1.714521, -2.004327, 1, 0.3176471, 0, 1,
-1.580619, 2.259465, -1.121137, 1, 0.3254902, 0, 1,
-1.564682, -0.5285023, -1.989437, 1, 0.3294118, 0, 1,
-1.561475, 0.8188877, -0.3578595, 1, 0.3372549, 0, 1,
-1.559214, 0.4987568, -1.655785, 1, 0.3411765, 0, 1,
-1.556266, 0.6841573, -0.3843631, 1, 0.3490196, 0, 1,
-1.548693, 0.3315395, -0.4881761, 1, 0.3529412, 0, 1,
-1.547457, -0.6404065, -1.008857, 1, 0.3607843, 0, 1,
-1.544435, 1.35592, -1.166846, 1, 0.3647059, 0, 1,
-1.539235, -0.2760773, 0.1293862, 1, 0.372549, 0, 1,
-1.536154, 1.299521, -0.7196316, 1, 0.3764706, 0, 1,
-1.535786, 0.01105937, -2.266185, 1, 0.3843137, 0, 1,
-1.533108, 0.1179867, -1.889643, 1, 0.3882353, 0, 1,
-1.526819, -1.6079, -1.862114, 1, 0.3960784, 0, 1,
-1.524349, -0.2254792, -2.653161, 1, 0.4039216, 0, 1,
-1.520623, -0.9069139, -2.123739, 1, 0.4078431, 0, 1,
-1.5172, 1.144262, -0.3773355, 1, 0.4156863, 0, 1,
-1.509752, 0.008055838, -0.09753115, 1, 0.4196078, 0, 1,
-1.509172, 0.2528684, -1.091423, 1, 0.427451, 0, 1,
-1.508501, -1.012531, -1.583864, 1, 0.4313726, 0, 1,
-1.503545, 0.6511857, -0.6777604, 1, 0.4392157, 0, 1,
-1.486271, -0.4378835, -4.449278, 1, 0.4431373, 0, 1,
-1.481394, -0.1235435, -1.324879, 1, 0.4509804, 0, 1,
-1.47801, -0.5554099, -1.792562, 1, 0.454902, 0, 1,
-1.473886, -1.392253, -2.985571, 1, 0.4627451, 0, 1,
-1.457117, -1.748515, -2.189592, 1, 0.4666667, 0, 1,
-1.445392, 0.6024107, -1.450984, 1, 0.4745098, 0, 1,
-1.437938, -0.5039383, -3.285717, 1, 0.4784314, 0, 1,
-1.437179, 0.8643161, -2.072263, 1, 0.4862745, 0, 1,
-1.419836, 1.313474, 0.6940602, 1, 0.4901961, 0, 1,
-1.415402, 0.8947932, -0.8508769, 1, 0.4980392, 0, 1,
-1.408909, -1.459563, -0.6045731, 1, 0.5058824, 0, 1,
-1.408371, -0.2645958, -1.73721, 1, 0.509804, 0, 1,
-1.408198, -0.239442, -1.176029, 1, 0.5176471, 0, 1,
-1.405644, 1.670943, -0.08932905, 1, 0.5215687, 0, 1,
-1.403644, 0.07898265, -0.9381195, 1, 0.5294118, 0, 1,
-1.386987, 0.7940932, -0.2937655, 1, 0.5333334, 0, 1,
-1.385936, -1.114735, -1.452397, 1, 0.5411765, 0, 1,
-1.384862, 0.03677255, -0.8038435, 1, 0.5450981, 0, 1,
-1.384335, -1.398168, -2.609369, 1, 0.5529412, 0, 1,
-1.368804, -0.3432558, -1.201913, 1, 0.5568628, 0, 1,
-1.366982, 0.55101, -0.5550863, 1, 0.5647059, 0, 1,
-1.360851, 0.09696107, -2.459597, 1, 0.5686275, 0, 1,
-1.351976, -0.5655122, -2.170073, 1, 0.5764706, 0, 1,
-1.345349, 0.4325417, -0.3763678, 1, 0.5803922, 0, 1,
-1.343369, -0.4486914, -0.6320936, 1, 0.5882353, 0, 1,
-1.334603, 0.2064163, -0.5434246, 1, 0.5921569, 0, 1,
-1.332915, -0.856673, -3.292112, 1, 0.6, 0, 1,
-1.327029, -1.107954, -2.784662, 1, 0.6078432, 0, 1,
-1.326677, 0.61327, -0.6615117, 1, 0.6117647, 0, 1,
-1.32367, -0.1859608, -1.129603, 1, 0.6196079, 0, 1,
-1.30468, 0.6645886, -1.894796, 1, 0.6235294, 0, 1,
-1.303322, 0.7126946, -1.95689, 1, 0.6313726, 0, 1,
-1.300337, 0.5784284, -1.270457, 1, 0.6352941, 0, 1,
-1.29166, -0.6565073, 0.05195479, 1, 0.6431373, 0, 1,
-1.273655, -0.7020416, -1.163118, 1, 0.6470588, 0, 1,
-1.273039, 0.2326176, -1.530065, 1, 0.654902, 0, 1,
-1.261754, -0.2290981, -1.642432, 1, 0.6588235, 0, 1,
-1.250442, 0.3992094, -1.769544, 1, 0.6666667, 0, 1,
-1.248834, 0.09996337, -1.625572, 1, 0.6705883, 0, 1,
-1.238237, 1.040223, 0.3967982, 1, 0.6784314, 0, 1,
-1.232061, -0.6861084, -1.796423, 1, 0.682353, 0, 1,
-1.225298, 1.762648, 0.5995452, 1, 0.6901961, 0, 1,
-1.224697, 0.9957351, -0.733235, 1, 0.6941177, 0, 1,
-1.22002, -1.000436, -2.774979, 1, 0.7019608, 0, 1,
-1.21973, -0.09155053, -0.9701437, 1, 0.7098039, 0, 1,
-1.189627, -0.135136, -0.9051169, 1, 0.7137255, 0, 1,
-1.174917, -0.6952992, -2.621777, 1, 0.7215686, 0, 1,
-1.17194, -0.4868226, -1.047092, 1, 0.7254902, 0, 1,
-1.171031, -0.2951822, -2.669789, 1, 0.7333333, 0, 1,
-1.170552, -0.6790013, -1.71432, 1, 0.7372549, 0, 1,
-1.169699, -0.5786922, -3.936291, 1, 0.7450981, 0, 1,
-1.169393, 0.4112326, -1.65494, 1, 0.7490196, 0, 1,
-1.166279, -0.3625495, -1.356165, 1, 0.7568628, 0, 1,
-1.163506, 1.011177, -0.03697113, 1, 0.7607843, 0, 1,
-1.153737, 0.2396521, -0.7034996, 1, 0.7686275, 0, 1,
-1.143754, 0.7262958, -2.490523, 1, 0.772549, 0, 1,
-1.139357, 0.06465235, -1.281773, 1, 0.7803922, 0, 1,
-1.138884, 0.2212231, -1.639818, 1, 0.7843137, 0, 1,
-1.137588, 0.5590327, -1.56341, 1, 0.7921569, 0, 1,
-1.132708, 1.638456, -0.434749, 1, 0.7960784, 0, 1,
-1.130236, 1.55122, -0.7673951, 1, 0.8039216, 0, 1,
-1.13015, -0.4973477, -3.779204, 1, 0.8117647, 0, 1,
-1.123111, 0.817089, -3.588191, 1, 0.8156863, 0, 1,
-1.116236, -2.553986, -2.683536, 1, 0.8235294, 0, 1,
-1.10835, -0.7000058, -1.102938, 1, 0.827451, 0, 1,
-1.105527, -0.9361495, -2.474335, 1, 0.8352941, 0, 1,
-1.102782, 0.5434884, -1.454363, 1, 0.8392157, 0, 1,
-1.102303, -1.330249, -3.821424, 1, 0.8470588, 0, 1,
-1.096269, 1.002262, 0.6825546, 1, 0.8509804, 0, 1,
-1.095864, 0.8551152, -0.5921863, 1, 0.8588235, 0, 1,
-1.089843, -0.5606741, -2.250109, 1, 0.8627451, 0, 1,
-1.089496, -0.4811198, -1.959999, 1, 0.8705882, 0, 1,
-1.086194, -0.5429767, -1.192076, 1, 0.8745098, 0, 1,
-1.0741, -2.110275, -2.406281, 1, 0.8823529, 0, 1,
-1.0655, -1.053459, -3.203935, 1, 0.8862745, 0, 1,
-1.059582, -2.034485, -3.491704, 1, 0.8941177, 0, 1,
-1.0492, 0.9783843, -2.424661, 1, 0.8980392, 0, 1,
-1.044303, 0.01266427, -1.92874, 1, 0.9058824, 0, 1,
-1.037901, 0.804653, -1.012, 1, 0.9137255, 0, 1,
-1.03101, 2.350548, -1.059261, 1, 0.9176471, 0, 1,
-1.030269, -0.8982773, -2.081538, 1, 0.9254902, 0, 1,
-1.024419, 0.7553773, -1.156067, 1, 0.9294118, 0, 1,
-1.023564, 1.618124, 0.4597329, 1, 0.9372549, 0, 1,
-1.020619, 1.284422, -0.3755019, 1, 0.9411765, 0, 1,
-1.020202, -0.1371775, -1.800119, 1, 0.9490196, 0, 1,
-1.013303, 1.2431, -1.293742, 1, 0.9529412, 0, 1,
-1.010033, -0.6041199, -1.51863, 1, 0.9607843, 0, 1,
-1.009989, -0.01985545, -3.77056, 1, 0.9647059, 0, 1,
-1.002812, -1.415167, -4.359204, 1, 0.972549, 0, 1,
-0.9994824, -0.2745115, -2.194325, 1, 0.9764706, 0, 1,
-0.9991874, -0.3463672, -1.999261, 1, 0.9843137, 0, 1,
-0.9941952, -0.1731921, -2.378242, 1, 0.9882353, 0, 1,
-0.9834158, -0.1428309, -2.130073, 1, 0.9960784, 0, 1,
-0.9821925, -1.2287, -2.01769, 0.9960784, 1, 0, 1,
-0.9815422, 1.028269, -1.456366, 0.9921569, 1, 0, 1,
-0.9788539, -0.9573609, -3.321541, 0.9843137, 1, 0, 1,
-0.9756361, 0.3761097, 0.1856985, 0.9803922, 1, 0, 1,
-0.9756174, 0.6834992, 0.2376412, 0.972549, 1, 0, 1,
-0.9752533, -0.1368271, -1.294634, 0.9686275, 1, 0, 1,
-0.974693, 0.1680146, -2.668521, 0.9607843, 1, 0, 1,
-0.9719657, -1.465433, -2.709674, 0.9568627, 1, 0, 1,
-0.9687788, 0.02470414, -1.568653, 0.9490196, 1, 0, 1,
-0.9617479, -1.3581, -2.143747, 0.945098, 1, 0, 1,
-0.9242538, 0.06938578, -1.834629, 0.9372549, 1, 0, 1,
-0.9183136, -0.8659739, -3.974703, 0.9333333, 1, 0, 1,
-0.9159723, -0.7228353, -2.97133, 0.9254902, 1, 0, 1,
-0.9129145, 0.1682904, -3.283307, 0.9215686, 1, 0, 1,
-0.9045787, 0.4155731, -0.7995685, 0.9137255, 1, 0, 1,
-0.8909355, 0.6409349, -0.6314316, 0.9098039, 1, 0, 1,
-0.8897449, 1.820069, -0.9124627, 0.9019608, 1, 0, 1,
-0.8866155, 0.5834159, -2.647412, 0.8941177, 1, 0, 1,
-0.8782064, 1.231394, 0.8125562, 0.8901961, 1, 0, 1,
-0.8753411, 0.5908014, 0.869971, 0.8823529, 1, 0, 1,
-0.8722628, -1.287548, -3.423882, 0.8784314, 1, 0, 1,
-0.8697389, -0.01427208, -2.137763, 0.8705882, 1, 0, 1,
-0.8679876, -0.5731186, -3.314399, 0.8666667, 1, 0, 1,
-0.8653458, 0.1855994, -0.7449358, 0.8588235, 1, 0, 1,
-0.8644318, -1.092744, -2.918522, 0.854902, 1, 0, 1,
-0.8567549, -2.951191, -4.348139, 0.8470588, 1, 0, 1,
-0.8518217, -1.128984, -2.408925, 0.8431373, 1, 0, 1,
-0.8374652, -1.012107, -2.551281, 0.8352941, 1, 0, 1,
-0.834973, -0.8137173, -3.335005, 0.8313726, 1, 0, 1,
-0.8345013, -2.005034, -3.621739, 0.8235294, 1, 0, 1,
-0.8263129, -0.01510962, -3.266176, 0.8196079, 1, 0, 1,
-0.8247374, 0.3903306, 0.9158024, 0.8117647, 1, 0, 1,
-0.8239782, -0.2144736, -2.332289, 0.8078431, 1, 0, 1,
-0.8223453, 0.1965909, 0.1970366, 0.8, 1, 0, 1,
-0.8165356, -0.1699363, -0.8890391, 0.7921569, 1, 0, 1,
-0.8158813, 0.003261892, -0.6490104, 0.7882353, 1, 0, 1,
-0.814395, 0.6161892, -0.8853886, 0.7803922, 1, 0, 1,
-0.8076879, 0.2146302, -2.212267, 0.7764706, 1, 0, 1,
-0.8072085, 0.6983837, -2.109653, 0.7686275, 1, 0, 1,
-0.805931, 0.05454014, -0.4069053, 0.7647059, 1, 0, 1,
-0.8021914, -0.4514509, -2.024463, 0.7568628, 1, 0, 1,
-0.7994828, -1.750874, -2.568605, 0.7529412, 1, 0, 1,
-0.7992116, -0.03222107, -0.09621884, 0.7450981, 1, 0, 1,
-0.7977443, 1.961966, 0.4074973, 0.7411765, 1, 0, 1,
-0.7966816, 0.648906, -0.8892937, 0.7333333, 1, 0, 1,
-0.7883017, 0.2573687, -0.5804955, 0.7294118, 1, 0, 1,
-0.7870716, -0.9817368, -1.682092, 0.7215686, 1, 0, 1,
-0.7862204, -0.1218371, -2.616324, 0.7176471, 1, 0, 1,
-0.7855503, 0.4624033, -0.7337451, 0.7098039, 1, 0, 1,
-0.7828793, 0.01821493, -2.104013, 0.7058824, 1, 0, 1,
-0.7778131, -0.654485, -2.317737, 0.6980392, 1, 0, 1,
-0.7755182, -0.05513618, -0.7923732, 0.6901961, 1, 0, 1,
-0.7737381, -0.2874772, -1.815201, 0.6862745, 1, 0, 1,
-0.7717379, -0.4087562, -1.483576, 0.6784314, 1, 0, 1,
-0.7703595, -0.3999989, -0.7849696, 0.6745098, 1, 0, 1,
-0.7680011, -0.6203676, -2.772652, 0.6666667, 1, 0, 1,
-0.7636675, -0.0124481, -3.017629, 0.6627451, 1, 0, 1,
-0.7628968, -1.016166, -3.180315, 0.654902, 1, 0, 1,
-0.7602963, -0.4463359, -1.611577, 0.6509804, 1, 0, 1,
-0.7571732, -0.6200204, -4.16898, 0.6431373, 1, 0, 1,
-0.7554441, 0.3316934, -0.299657, 0.6392157, 1, 0, 1,
-0.753775, 0.3033398, -1.914197, 0.6313726, 1, 0, 1,
-0.7523029, -0.297647, -1.250129, 0.627451, 1, 0, 1,
-0.7510632, -0.9467031, -1.438906, 0.6196079, 1, 0, 1,
-0.7472704, -1.591563, -3.345228, 0.6156863, 1, 0, 1,
-0.7453136, -0.1041323, -0.5476565, 0.6078432, 1, 0, 1,
-0.7451558, -0.9223112, -2.651672, 0.6039216, 1, 0, 1,
-0.7426807, -0.09252042, -1.451023, 0.5960785, 1, 0, 1,
-0.7393649, 0.2341911, -1.06015, 0.5882353, 1, 0, 1,
-0.7367157, -0.7822345, -2.819067, 0.5843138, 1, 0, 1,
-0.7359288, 1.290878, -0.390777, 0.5764706, 1, 0, 1,
-0.7341827, -1.511228, -2.712397, 0.572549, 1, 0, 1,
-0.7306382, -0.7093018, -3.006903, 0.5647059, 1, 0, 1,
-0.7288274, -0.4076828, -1.604277, 0.5607843, 1, 0, 1,
-0.7261638, -0.7029662, -3.177854, 0.5529412, 1, 0, 1,
-0.7172998, -1.040843, -2.837602, 0.5490196, 1, 0, 1,
-0.7094799, -0.2176354, -2.975048, 0.5411765, 1, 0, 1,
-0.7029501, 0.9109256, 0.8882944, 0.5372549, 1, 0, 1,
-0.6982398, -0.4348741, -3.434717, 0.5294118, 1, 0, 1,
-0.6942226, -0.9795748, -1.605344, 0.5254902, 1, 0, 1,
-0.6934932, -0.109558, -1.356205, 0.5176471, 1, 0, 1,
-0.6908067, -0.1757158, -2.30124, 0.5137255, 1, 0, 1,
-0.6907069, 0.7199756, -0.412277, 0.5058824, 1, 0, 1,
-0.6832618, -1.575013, -1.328262, 0.5019608, 1, 0, 1,
-0.6829485, -1.76686, -3.065542, 0.4941176, 1, 0, 1,
-0.6771547, -0.6130801, -2.27736, 0.4862745, 1, 0, 1,
-0.6683927, -1.5486, -2.039606, 0.4823529, 1, 0, 1,
-0.6506023, 0.6215671, -2.626661, 0.4745098, 1, 0, 1,
-0.6495237, -1.248988, -2.254106, 0.4705882, 1, 0, 1,
-0.6486459, 0.5464513, 0.002038998, 0.4627451, 1, 0, 1,
-0.6437697, -0.5278233, -0.7282511, 0.4588235, 1, 0, 1,
-0.6313699, -0.7613467, -1.482215, 0.4509804, 1, 0, 1,
-0.630353, 0.3120974, -0.3076721, 0.4470588, 1, 0, 1,
-0.6285072, -0.8585914, -0.4873672, 0.4392157, 1, 0, 1,
-0.6279088, 0.3502945, -0.3626228, 0.4352941, 1, 0, 1,
-0.6278043, 0.2414745, -2.289467, 0.427451, 1, 0, 1,
-0.6277426, -0.3476794, -1.759421, 0.4235294, 1, 0, 1,
-0.6204249, 0.8758093, -0.4256002, 0.4156863, 1, 0, 1,
-0.6176615, -2.036983, -3.163752, 0.4117647, 1, 0, 1,
-0.6169176, 0.8293832, -1.030441, 0.4039216, 1, 0, 1,
-0.6106415, -0.2408488, -2.326849, 0.3960784, 1, 0, 1,
-0.6090518, -0.1211236, -2.762153, 0.3921569, 1, 0, 1,
-0.6000203, -0.08039815, -1.07339, 0.3843137, 1, 0, 1,
-0.5987545, 0.2339555, -0.5702042, 0.3803922, 1, 0, 1,
-0.5921189, -1.254601, -1.979065, 0.372549, 1, 0, 1,
-0.5913287, 0.07363763, -2.308755, 0.3686275, 1, 0, 1,
-0.5879852, 1.631797, 1.251561, 0.3607843, 1, 0, 1,
-0.585251, 0.6070836, -0.2770747, 0.3568628, 1, 0, 1,
-0.5820436, 0.5438356, -2.699895, 0.3490196, 1, 0, 1,
-0.5803751, 0.7675765, 1.673472, 0.345098, 1, 0, 1,
-0.5759458, 0.1583344, 0.04635737, 0.3372549, 1, 0, 1,
-0.5737212, -0.1851385, -1.146224, 0.3333333, 1, 0, 1,
-0.5697924, -0.1915966, -2.318202, 0.3254902, 1, 0, 1,
-0.5665185, -1.589534, -4.88226, 0.3215686, 1, 0, 1,
-0.561344, 0.1224749, -3.704391, 0.3137255, 1, 0, 1,
-0.5581527, 0.8813241, -0.9593005, 0.3098039, 1, 0, 1,
-0.5580817, -0.06238635, -1.866948, 0.3019608, 1, 0, 1,
-0.5577665, -0.9577804, -3.245065, 0.2941177, 1, 0, 1,
-0.5572045, 1.114734, 0.1665626, 0.2901961, 1, 0, 1,
-0.5533036, 0.2313564, -1.047188, 0.282353, 1, 0, 1,
-0.5497516, -0.2333535, -2.465303, 0.2784314, 1, 0, 1,
-0.5416483, -1.685678, -1.988964, 0.2705882, 1, 0, 1,
-0.5374245, 0.9264431, -0.3599471, 0.2666667, 1, 0, 1,
-0.5371283, -0.08635866, -0.4341878, 0.2588235, 1, 0, 1,
-0.5340126, -0.7443802, -3.282279, 0.254902, 1, 0, 1,
-0.5326679, 0.1136567, -0.3586751, 0.2470588, 1, 0, 1,
-0.5230883, 0.772692, 0.03152568, 0.2431373, 1, 0, 1,
-0.5218189, 0.1439356, -1.304843, 0.2352941, 1, 0, 1,
-0.5213995, 0.07373733, -1.505961, 0.2313726, 1, 0, 1,
-0.51869, -1.514808, -2.601369, 0.2235294, 1, 0, 1,
-0.5186086, 0.09099071, -0.3136783, 0.2196078, 1, 0, 1,
-0.5132312, 0.6542612, -2.11349, 0.2117647, 1, 0, 1,
-0.5124705, -0.6855419, -0.997638, 0.2078431, 1, 0, 1,
-0.5113416, 1.271191, -1.716356, 0.2, 1, 0, 1,
-0.5107762, 0.6813216, -1.247834, 0.1921569, 1, 0, 1,
-0.5101624, -0.6563236, -1.164275, 0.1882353, 1, 0, 1,
-0.5065654, 0.8744096, -2.122517, 0.1803922, 1, 0, 1,
-0.4996538, -1.386188, -2.653153, 0.1764706, 1, 0, 1,
-0.4986867, -1.228094, -2.288242, 0.1686275, 1, 0, 1,
-0.4974248, 0.005322636, -1.738795, 0.1647059, 1, 0, 1,
-0.4927352, -0.2287066, -2.375859, 0.1568628, 1, 0, 1,
-0.4866889, -1.402598, -2.454985, 0.1529412, 1, 0, 1,
-0.4830582, -0.4242444, -1.537197, 0.145098, 1, 0, 1,
-0.4822757, 0.6341819, -2.477641, 0.1411765, 1, 0, 1,
-0.4808703, -0.2417414, -2.228644, 0.1333333, 1, 0, 1,
-0.480631, -0.299114, -2.310646, 0.1294118, 1, 0, 1,
-0.4794404, 3.23215, 0.2861146, 0.1215686, 1, 0, 1,
-0.4771363, -1.458425, -3.026647, 0.1176471, 1, 0, 1,
-0.4747624, -1.129916, -1.349305, 0.1098039, 1, 0, 1,
-0.4716076, 0.01635103, -1.192892, 0.1058824, 1, 0, 1,
-0.4704083, 0.6318321, -0.5871224, 0.09803922, 1, 0, 1,
-0.4696935, 0.1074285, -0.8532759, 0.09019608, 1, 0, 1,
-0.4690522, -0.0791755, -0.2143836, 0.08627451, 1, 0, 1,
-0.4660726, -0.08754401, -1.141972, 0.07843138, 1, 0, 1,
-0.4659571, -1.183315, -4.464777, 0.07450981, 1, 0, 1,
-0.465231, 0.8678069, 0.5888366, 0.06666667, 1, 0, 1,
-0.4649011, 0.2184065, -1.104966, 0.0627451, 1, 0, 1,
-0.4621754, -0.06386764, -1.228651, 0.05490196, 1, 0, 1,
-0.4620391, 0.2570813, -0.4910147, 0.05098039, 1, 0, 1,
-0.4599761, -1.442235, -3.117759, 0.04313726, 1, 0, 1,
-0.4572353, 1.581803, 0.01895208, 0.03921569, 1, 0, 1,
-0.4535649, 1.400208, -0.6275598, 0.03137255, 1, 0, 1,
-0.4535443, -1.097807, -2.370228, 0.02745098, 1, 0, 1,
-0.4466977, 0.1986506, -0.4662473, 0.01960784, 1, 0, 1,
-0.4464844, -1.933595, -3.009597, 0.01568628, 1, 0, 1,
-0.4444523, -2.015718, -2.490509, 0.007843138, 1, 0, 1,
-0.4320928, -1.343804, -3.704512, 0.003921569, 1, 0, 1,
-0.4295415, -0.8920397, -3.736415, 0, 1, 0.003921569, 1,
-0.4243404, -0.1285184, -0.2649496, 0, 1, 0.01176471, 1,
-0.4236041, 0.5843266, -1.818119, 0, 1, 0.01568628, 1,
-0.4220116, -1.184151, -3.594955, 0, 1, 0.02352941, 1,
-0.4213874, 0.5644898, -3.810923, 0, 1, 0.02745098, 1,
-0.4193277, -1.436627, -2.734527, 0, 1, 0.03529412, 1,
-0.4154408, -0.1937235, -2.278534, 0, 1, 0.03921569, 1,
-0.4148231, 1.135368, -1.519478, 0, 1, 0.04705882, 1,
-0.4130312, -0.9407481, -1.139361, 0, 1, 0.05098039, 1,
-0.4116906, -0.2501693, -3.417368, 0, 1, 0.05882353, 1,
-0.410819, 0.4455615, -0.3533408, 0, 1, 0.0627451, 1,
-0.4098259, 1.212507, -1.606705, 0, 1, 0.07058824, 1,
-0.3975661, 0.8863004, -0.796192, 0, 1, 0.07450981, 1,
-0.3926587, 2.151882, 0.4042716, 0, 1, 0.08235294, 1,
-0.3925976, -1.147747, -3.859672, 0, 1, 0.08627451, 1,
-0.3912437, 0.9244002, 0.8669145, 0, 1, 0.09411765, 1,
-0.3897742, -0.9643772, -1.9784, 0, 1, 0.1019608, 1,
-0.3889022, 0.5371921, -2.195939, 0, 1, 0.1058824, 1,
-0.3887264, -0.07854515, -2.399301, 0, 1, 0.1137255, 1,
-0.3884865, -0.3628622, -2.225176, 0, 1, 0.1176471, 1,
-0.3850479, 0.7241805, -0.8994758, 0, 1, 0.1254902, 1,
-0.3808839, 1.7763, -0.1867012, 0, 1, 0.1294118, 1,
-0.3796453, -0.9546229, -3.541726, 0, 1, 0.1372549, 1,
-0.3790916, 0.5797471, 0.04015723, 0, 1, 0.1411765, 1,
-0.3785324, -1.016823, -3.17012, 0, 1, 0.1490196, 1,
-0.376832, 0.2666005, -0.8220481, 0, 1, 0.1529412, 1,
-0.3768282, 0.1261389, -0.8760163, 0, 1, 0.1607843, 1,
-0.3642108, -0.04502605, -0.2147246, 0, 1, 0.1647059, 1,
-0.3567338, -0.8312541, -1.872398, 0, 1, 0.172549, 1,
-0.3507962, -1.179142, -1.766655, 0, 1, 0.1764706, 1,
-0.3492682, 0.7370815, 0.4924166, 0, 1, 0.1843137, 1,
-0.3440247, 0.6922579, 1.158725, 0, 1, 0.1882353, 1,
-0.3430519, 0.7321868, -1.32178, 0, 1, 0.1960784, 1,
-0.3320574, -1.197273, -5.523882, 0, 1, 0.2039216, 1,
-0.3307505, -0.428543, -1.54907, 0, 1, 0.2078431, 1,
-0.3304262, -0.8987968, -1.957727, 0, 1, 0.2156863, 1,
-0.3278133, -1.008281, -2.792341, 0, 1, 0.2196078, 1,
-0.3276755, 1.301927, -0.3097661, 0, 1, 0.227451, 1,
-0.3225671, -0.2118298, -0.06562768, 0, 1, 0.2313726, 1,
-0.3224286, 0.1899881, -0.6054482, 0, 1, 0.2392157, 1,
-0.3203104, 0.8996397, -0.7285835, 0, 1, 0.2431373, 1,
-0.3202983, -0.469478, -4.290075, 0, 1, 0.2509804, 1,
-0.3186828, 1.05838, -0.6989142, 0, 1, 0.254902, 1,
-0.3158057, -0.259903, -2.100205, 0, 1, 0.2627451, 1,
-0.3148203, -0.9111799, -2.785235, 0, 1, 0.2666667, 1,
-0.3115562, -2.419773, -2.415078, 0, 1, 0.2745098, 1,
-0.3076645, 0.6572909, 0.7620762, 0, 1, 0.2784314, 1,
-0.3075384, -0.6363565, -1.657337, 0, 1, 0.2862745, 1,
-0.3056753, 0.7553584, 1.105557, 0, 1, 0.2901961, 1,
-0.3053274, 0.9060504, 0.5401331, 0, 1, 0.2980392, 1,
-0.3044002, -0.5598963, -4.075278, 0, 1, 0.3058824, 1,
-0.3022397, -0.1358847, -0.8274723, 0, 1, 0.3098039, 1,
-0.3020485, -0.4115635, -2.910781, 0, 1, 0.3176471, 1,
-0.2958429, -1.50588, -1.092912, 0, 1, 0.3215686, 1,
-0.2876238, 0.7046119, -0.7845605, 0, 1, 0.3294118, 1,
-0.2830549, 0.571991, -0.2189319, 0, 1, 0.3333333, 1,
-0.2795446, -1.786312, -4.074917, 0, 1, 0.3411765, 1,
-0.2792675, -1.48177, -3.356586, 0, 1, 0.345098, 1,
-0.2690035, 0.264519, -0.8375336, 0, 1, 0.3529412, 1,
-0.2670093, 0.5346215, -1.449183, 0, 1, 0.3568628, 1,
-0.2642701, 0.218078, 0.4027131, 0, 1, 0.3647059, 1,
-0.260812, -0.7661265, -3.408677, 0, 1, 0.3686275, 1,
-0.2597041, 1.48976, 1.881295, 0, 1, 0.3764706, 1,
-0.253729, -0.3824809, -1.049857, 0, 1, 0.3803922, 1,
-0.2528779, -1.151205, -2.556643, 0, 1, 0.3882353, 1,
-0.2502962, 1.198615, -0.2128462, 0, 1, 0.3921569, 1,
-0.2479879, -2.794456, -4.480279, 0, 1, 0.4, 1,
-0.2452434, -0.6390338, -3.734654, 0, 1, 0.4078431, 1,
-0.2439735, 0.4471956, 0.6218929, 0, 1, 0.4117647, 1,
-0.2430771, 3.160197, 0.2081049, 0, 1, 0.4196078, 1,
-0.2371282, 0.0494406, -2.346898, 0, 1, 0.4235294, 1,
-0.2338503, -0.06104019, -2.561704, 0, 1, 0.4313726, 1,
-0.2333613, 0.001729887, -1.329567, 0, 1, 0.4352941, 1,
-0.2331608, -0.1570434, -2.068178, 0, 1, 0.4431373, 1,
-0.2320859, 0.6586379, 0.682215, 0, 1, 0.4470588, 1,
-0.2253378, 0.6461105, -2.312939, 0, 1, 0.454902, 1,
-0.2214317, 1.027867, 0.335912, 0, 1, 0.4588235, 1,
-0.2211463, 0.190041, -0.6318288, 0, 1, 0.4666667, 1,
-0.2183456, 0.1388175, -0.8991401, 0, 1, 0.4705882, 1,
-0.2111635, -1.01656, -2.755444, 0, 1, 0.4784314, 1,
-0.2091845, 1.095195, 0.5881958, 0, 1, 0.4823529, 1,
-0.2063274, -0.5539709, -2.302438, 0, 1, 0.4901961, 1,
-0.2027161, -1.344964, -3.317914, 0, 1, 0.4941176, 1,
-0.1997658, 1.28698, -0.4554289, 0, 1, 0.5019608, 1,
-0.1981119, 0.1854498, -0.1807166, 0, 1, 0.509804, 1,
-0.1952426, -2.30153, -4.982058, 0, 1, 0.5137255, 1,
-0.1926989, -0.6264272, -2.262493, 0, 1, 0.5215687, 1,
-0.1924273, -0.7591896, -3.058405, 0, 1, 0.5254902, 1,
-0.1870118, 1.286969, -1.782534, 0, 1, 0.5333334, 1,
-0.1861823, 0.8245481, -1.309293, 0, 1, 0.5372549, 1,
-0.181634, -0.6441535, -2.538684, 0, 1, 0.5450981, 1,
-0.1757773, -0.6507129, -2.690767, 0, 1, 0.5490196, 1,
-0.1685729, 0.5699004, 0.2744644, 0, 1, 0.5568628, 1,
-0.1650738, -2.74579, -2.479999, 0, 1, 0.5607843, 1,
-0.1640699, 1.45823, -0.5253917, 0, 1, 0.5686275, 1,
-0.1625564, -0.2075832, -2.494771, 0, 1, 0.572549, 1,
-0.1620276, 2.05543, -1.124818, 0, 1, 0.5803922, 1,
-0.1600721, 0.3415991, -1.386667, 0, 1, 0.5843138, 1,
-0.1553824, 0.455412, 1.248206, 0, 1, 0.5921569, 1,
-0.1534073, 2.008529, 1.076287, 0, 1, 0.5960785, 1,
-0.1486471, -1.813314, -3.731866, 0, 1, 0.6039216, 1,
-0.1445396, -0.7013355, -2.071208, 0, 1, 0.6117647, 1,
-0.1388039, -0.5518767, -5.01311, 0, 1, 0.6156863, 1,
-0.1372419, 0.8564161, 0.5708681, 0, 1, 0.6235294, 1,
-0.1366762, 1.345466, 1.146958, 0, 1, 0.627451, 1,
-0.1366271, 1.111849, -0.2899938, 0, 1, 0.6352941, 1,
-0.1366004, 0.2975509, 0.09830923, 0, 1, 0.6392157, 1,
-0.1363004, 1.227973, 0.5753593, 0, 1, 0.6470588, 1,
-0.1331094, -1.715753, -2.529324, 0, 1, 0.6509804, 1,
-0.1328033, 0.0619765, -2.450077, 0, 1, 0.6588235, 1,
-0.1303442, 0.2991542, -1.899564, 0, 1, 0.6627451, 1,
-0.1280673, 1.426221, -0.3483851, 0, 1, 0.6705883, 1,
-0.128011, 0.8907542, 0.3034549, 0, 1, 0.6745098, 1,
-0.1259683, -1.031649, -2.589187, 0, 1, 0.682353, 1,
-0.1255694, 1.409015, -0.3068231, 0, 1, 0.6862745, 1,
-0.125363, 0.1493783, 0.9657436, 0, 1, 0.6941177, 1,
-0.1240195, 1.023425, -0.4253617, 0, 1, 0.7019608, 1,
-0.1217089, 0.4122882, -2.629099, 0, 1, 0.7058824, 1,
-0.1213664, -0.1905973, -2.120672, 0, 1, 0.7137255, 1,
-0.1200403, 1.620798, -0.789328, 0, 1, 0.7176471, 1,
-0.1184177, 0.09021761, -1.230321, 0, 1, 0.7254902, 1,
-0.1106867, 0.1519543, -0.1891391, 0, 1, 0.7294118, 1,
-0.109563, -1.266151, -3.330099, 0, 1, 0.7372549, 1,
-0.1090974, -0.9462531, -1.684654, 0, 1, 0.7411765, 1,
-0.1030388, -1.433657, -3.062204, 0, 1, 0.7490196, 1,
-0.1018672, -0.7266234, -1.343102, 0, 1, 0.7529412, 1,
-0.09650053, 0.8980833, -0.2835565, 0, 1, 0.7607843, 1,
-0.09429388, -0.5357006, -2.020144, 0, 1, 0.7647059, 1,
-0.09426703, 0.006400291, -1.844718, 0, 1, 0.772549, 1,
-0.09239934, -0.2449625, -1.619668, 0, 1, 0.7764706, 1,
-0.09227562, -1.391045, -1.694784, 0, 1, 0.7843137, 1,
-0.08964679, -1.677889, -2.334314, 0, 1, 0.7882353, 1,
-0.08754838, 0.1239688, 0.4800866, 0, 1, 0.7960784, 1,
-0.08490752, -0.294667, -4.206551, 0, 1, 0.8039216, 1,
-0.08098222, 0.8237906, 0.2743834, 0, 1, 0.8078431, 1,
-0.07923497, 0.007912041, -0.8698657, 0, 1, 0.8156863, 1,
-0.07780407, 0.3045844, -1.97968, 0, 1, 0.8196079, 1,
-0.07539352, -0.5121137, -2.189567, 0, 1, 0.827451, 1,
-0.07489272, -0.1914442, -3.367744, 0, 1, 0.8313726, 1,
-0.07451082, 0.9856309, 0.4782239, 0, 1, 0.8392157, 1,
-0.0742167, 0.7455665, -0.4777229, 0, 1, 0.8431373, 1,
-0.06935587, 0.4094766, 1.106537, 0, 1, 0.8509804, 1,
-0.06848311, 0.09018519, -0.8815157, 0, 1, 0.854902, 1,
-0.06612846, 0.5554202, -0.5575756, 0, 1, 0.8627451, 1,
-0.06580472, 0.01134055, -3.375657, 0, 1, 0.8666667, 1,
-0.0626738, 1.685991, 0.6383987, 0, 1, 0.8745098, 1,
-0.06115925, -1.7352, -5.702056, 0, 1, 0.8784314, 1,
-0.05817088, 0.5403117, -0.7345057, 0, 1, 0.8862745, 1,
-0.05815718, 0.008680272, -0.8172598, 0, 1, 0.8901961, 1,
-0.05748655, 0.8176627, 0.774635, 0, 1, 0.8980392, 1,
-0.05665401, -0.7813178, -2.891107, 0, 1, 0.9058824, 1,
-0.05569267, 0.3147528, -1.360108, 0, 1, 0.9098039, 1,
-0.05479504, -1.10309, -5.29288, 0, 1, 0.9176471, 1,
-0.04876635, -0.6279688, -1.970884, 0, 1, 0.9215686, 1,
-0.04563678, -0.6290463, -2.859607, 0, 1, 0.9294118, 1,
-0.04486749, -1.688754, -4.655089, 0, 1, 0.9333333, 1,
-0.04212612, 0.9830661, -2.941021, 0, 1, 0.9411765, 1,
-0.04135187, 1.224114, -0.3108855, 0, 1, 0.945098, 1,
-0.04057248, 0.3669714, -0.2368478, 0, 1, 0.9529412, 1,
-0.04039917, 0.1898109, -0.8049319, 0, 1, 0.9568627, 1,
-0.03868333, -1.677809, -3.303533, 0, 1, 0.9647059, 1,
-0.02331149, 0.4007744, -0.5626678, 0, 1, 0.9686275, 1,
-0.02319826, -0.2142745, -2.335711, 0, 1, 0.9764706, 1,
-0.0207202, 0.1501704, 0.8545949, 0, 1, 0.9803922, 1,
-0.02017661, 0.07606863, -0.9225919, 0, 1, 0.9882353, 1,
-0.02012639, -0.9891863, -3.628072, 0, 1, 0.9921569, 1,
-0.01633926, -0.6109503, -1.83043, 0, 1, 1, 1,
-0.0157535, -0.3765672, -2.920203, 0, 0.9921569, 1, 1,
-0.01449188, -0.3162889, -3.798664, 0, 0.9882353, 1, 1,
-0.008364615, 0.08670548, -0.970735, 0, 0.9803922, 1, 1,
-0.006805263, -0.1885872, -5.628356, 0, 0.9764706, 1, 1,
-0.00576916, -2.13311, -1.850057, 0, 0.9686275, 1, 1,
-0.00408827, 1.052297, 0.9609216, 0, 0.9647059, 1, 1,
-0.002257449, -0.3141508, -1.142232, 0, 0.9568627, 1, 1,
-0.0008546447, 0.6400564, -0.5668799, 0, 0.9529412, 1, 1,
0.01362396, 1.919165, 0.2258705, 0, 0.945098, 1, 1,
0.0197438, -0.3992001, 1.772006, 0, 0.9411765, 1, 1,
0.02080986, -1.085666, 2.992258, 0, 0.9333333, 1, 1,
0.02628947, -1.17876, 2.373718, 0, 0.9294118, 1, 1,
0.02917198, -0.8383495, 1.878978, 0, 0.9215686, 1, 1,
0.02920855, 0.5301047, 0.3520861, 0, 0.9176471, 1, 1,
0.03098091, 0.341011, 1.714202, 0, 0.9098039, 1, 1,
0.03139146, -0.2163508, 3.820839, 0, 0.9058824, 1, 1,
0.03372263, 2.007761, -1.46582, 0, 0.8980392, 1, 1,
0.03621468, 0.01537058, 2.142937, 0, 0.8901961, 1, 1,
0.03793928, -0.2340645, 1.784424, 0, 0.8862745, 1, 1,
0.0394582, -1.409439, 2.9048, 0, 0.8784314, 1, 1,
0.04048044, -0.7755681, 1.914307, 0, 0.8745098, 1, 1,
0.04700191, -0.5250537, 4.065135, 0, 0.8666667, 1, 1,
0.04781833, 0.2472039, -1.830814, 0, 0.8627451, 1, 1,
0.04820656, -0.9618702, 4.533511, 0, 0.854902, 1, 1,
0.0483043, -0.2385842, 2.451817, 0, 0.8509804, 1, 1,
0.05397073, 2.043207, -0.7795395, 0, 0.8431373, 1, 1,
0.0566036, 1.306466, 1.305611, 0, 0.8392157, 1, 1,
0.05901258, 0.6825836, 1.002162, 0, 0.8313726, 1, 1,
0.05989499, 1.274548, 0.8926999, 0, 0.827451, 1, 1,
0.06130072, -0.1567431, 2.730416, 0, 0.8196079, 1, 1,
0.0625413, -0.2744036, 2.241047, 0, 0.8156863, 1, 1,
0.06405023, -0.2450392, 2.973457, 0, 0.8078431, 1, 1,
0.06890235, 1.014803, -1.169941, 0, 0.8039216, 1, 1,
0.07910855, -0.5830255, 1.477824, 0, 0.7960784, 1, 1,
0.08116549, -1.167123, 1.642439, 0, 0.7882353, 1, 1,
0.08128664, -1.31011, 1.798296, 0, 0.7843137, 1, 1,
0.08143128, -0.3081909, 2.152888, 0, 0.7764706, 1, 1,
0.08690612, 0.2812389, -1.213697, 0, 0.772549, 1, 1,
0.09058471, 0.8544745, 0.6313784, 0, 0.7647059, 1, 1,
0.09190899, -0.5737487, 2.444076, 0, 0.7607843, 1, 1,
0.09432993, -0.4577641, 2.118131, 0, 0.7529412, 1, 1,
0.09433428, -0.2643726, 3.310032, 0, 0.7490196, 1, 1,
0.09443025, -1.229706, 2.935205, 0, 0.7411765, 1, 1,
0.09635682, -0.04241797, 3.338822, 0, 0.7372549, 1, 1,
0.09725709, 1.091832, 1.70547, 0, 0.7294118, 1, 1,
0.09850306, -0.9142969, 2.563045, 0, 0.7254902, 1, 1,
0.1016805, -0.8322175, 3.831281, 0, 0.7176471, 1, 1,
0.1037196, 0.1423092, 1.410107, 0, 0.7137255, 1, 1,
0.1053113, 0.6508599, -0.4460386, 0, 0.7058824, 1, 1,
0.1085378, -1.201006, 4.123819, 0, 0.6980392, 1, 1,
0.1097062, 0.4849636, 1.956182, 0, 0.6941177, 1, 1,
0.1125305, 0.2978448, 0.5534408, 0, 0.6862745, 1, 1,
0.1171329, -0.137425, 3.199749, 0, 0.682353, 1, 1,
0.1188684, -0.4432976, 1.501855, 0, 0.6745098, 1, 1,
0.1209576, -1.105125, 4.551296, 0, 0.6705883, 1, 1,
0.1217647, 1.502627, 0.2723145, 0, 0.6627451, 1, 1,
0.1281133, -0.8582153, 2.79879, 0, 0.6588235, 1, 1,
0.1289812, -0.3924646, 3.074674, 0, 0.6509804, 1, 1,
0.1359238, 0.6559618, -0.3827319, 0, 0.6470588, 1, 1,
0.1386386, 0.3478187, 1.052771, 0, 0.6392157, 1, 1,
0.1417759, -0.1093932, 2.451728, 0, 0.6352941, 1, 1,
0.1418126, 1.711753, 0.6172558, 0, 0.627451, 1, 1,
0.1431827, -0.3103681, 2.475024, 0, 0.6235294, 1, 1,
0.1442046, 0.9345823, 0.4524145, 0, 0.6156863, 1, 1,
0.1454927, -0.6408788, 1.113571, 0, 0.6117647, 1, 1,
0.1528691, -0.6769857, 3.244078, 0, 0.6039216, 1, 1,
0.1539, 0.883303, 1.224439, 0, 0.5960785, 1, 1,
0.15985, -0.35385, 3.319601, 0, 0.5921569, 1, 1,
0.1615224, -1.091362, 2.80026, 0, 0.5843138, 1, 1,
0.1662131, 2.202778, 0.1218427, 0, 0.5803922, 1, 1,
0.1670138, 0.3270929, 0.9115398, 0, 0.572549, 1, 1,
0.1670257, 0.6748355, -0.3217663, 0, 0.5686275, 1, 1,
0.1695784, 0.06418331, 0.7804364, 0, 0.5607843, 1, 1,
0.171095, 0.8566324, -0.2057728, 0, 0.5568628, 1, 1,
0.1724253, 0.5676473, 0.8216358, 0, 0.5490196, 1, 1,
0.1831186, -0.5036508, 2.244029, 0, 0.5450981, 1, 1,
0.1862337, -0.243866, 1.987285, 0, 0.5372549, 1, 1,
0.1937012, 0.09191207, 1.364449, 0, 0.5333334, 1, 1,
0.1956408, -0.9707716, 3.227181, 0, 0.5254902, 1, 1,
0.2005657, -0.805969, 1.402664, 0, 0.5215687, 1, 1,
0.2032095, -0.2146465, 1.9134, 0, 0.5137255, 1, 1,
0.2038998, -1.9602, 5.007763, 0, 0.509804, 1, 1,
0.2075071, -1.397551, 1.984063, 0, 0.5019608, 1, 1,
0.2092198, 2.225437, 0.01305599, 0, 0.4941176, 1, 1,
0.211693, 0.4626307, 1.165349, 0, 0.4901961, 1, 1,
0.2138718, 0.2038827, 1.363359, 0, 0.4823529, 1, 1,
0.2184083, -0.05292513, -0.09572545, 0, 0.4784314, 1, 1,
0.2203797, -1.090349, 3.305767, 0, 0.4705882, 1, 1,
0.2213034, -1.99795, 3.016966, 0, 0.4666667, 1, 1,
0.2250427, 0.8243912, 1.332922, 0, 0.4588235, 1, 1,
0.231532, 0.6846991, -0.3605139, 0, 0.454902, 1, 1,
0.2318558, 0.07573897, -1.534249, 0, 0.4470588, 1, 1,
0.2320024, -0.111608, 3.345198, 0, 0.4431373, 1, 1,
0.2391604, -1.279342, 2.028293, 0, 0.4352941, 1, 1,
0.2391753, -1.316435, 5.003087, 0, 0.4313726, 1, 1,
0.2424332, -0.759554, 2.266202, 0, 0.4235294, 1, 1,
0.2482913, -1.216024, 3.06202, 0, 0.4196078, 1, 1,
0.2521214, 0.3876025, 1.218449, 0, 0.4117647, 1, 1,
0.2522838, -2.021477, 3.373244, 0, 0.4078431, 1, 1,
0.2566948, -1.315642, 3.353926, 0, 0.4, 1, 1,
0.258265, -0.8857018, 1.307065, 0, 0.3921569, 1, 1,
0.2585701, 1.736975, -0.4411767, 0, 0.3882353, 1, 1,
0.2593596, 1.409646, -0.6054376, 0, 0.3803922, 1, 1,
0.2605077, 0.3819565, 0.778626, 0, 0.3764706, 1, 1,
0.2634278, 0.8181339, -0.6231251, 0, 0.3686275, 1, 1,
0.2648032, 0.4256497, 3.003009, 0, 0.3647059, 1, 1,
0.2652609, -0.2094303, 2.950828, 0, 0.3568628, 1, 1,
0.2652628, -0.1008929, 1.274774, 0, 0.3529412, 1, 1,
0.2661213, 0.9526743, 0.1155772, 0, 0.345098, 1, 1,
0.2699378, 1.666198, 0.4552062, 0, 0.3411765, 1, 1,
0.2769633, 0.7353051, -0.1947376, 0, 0.3333333, 1, 1,
0.2779536, 0.05034473, 1.387871, 0, 0.3294118, 1, 1,
0.2790106, -1.723122, 3.685861, 0, 0.3215686, 1, 1,
0.2855319, -0.6209895, 3.60097, 0, 0.3176471, 1, 1,
0.287164, 0.8653083, 0.6764082, 0, 0.3098039, 1, 1,
0.2900861, -0.2991367, 1.70111, 0, 0.3058824, 1, 1,
0.2922257, -0.3285832, 3.642949, 0, 0.2980392, 1, 1,
0.2953479, 0.07010782, 1.249461, 0, 0.2901961, 1, 1,
0.2956519, 1.833503, -0.09544208, 0, 0.2862745, 1, 1,
0.2967224, -1.392013, 3.165615, 0, 0.2784314, 1, 1,
0.2990783, -0.05235135, 1.923826, 0, 0.2745098, 1, 1,
0.3094308, -2.484345, 1.962878, 0, 0.2666667, 1, 1,
0.3136272, 1.293323, -0.4447472, 0, 0.2627451, 1, 1,
0.3176294, 0.6209968, 1.502755, 0, 0.254902, 1, 1,
0.322376, 0.9212614, -0.161984, 0, 0.2509804, 1, 1,
0.3226991, 0.09148454, -0.3698176, 0, 0.2431373, 1, 1,
0.323825, 1.672237, -0.4083301, 0, 0.2392157, 1, 1,
0.3252758, -1.232956, 2.660748, 0, 0.2313726, 1, 1,
0.334246, -0.9299973, 1.725717, 0, 0.227451, 1, 1,
0.3346207, -0.6310782, 1.602089, 0, 0.2196078, 1, 1,
0.335751, -1.527602, 2.342122, 0, 0.2156863, 1, 1,
0.337348, 0.5272763, 1.018437, 0, 0.2078431, 1, 1,
0.3375963, -1.381625, 4.097023, 0, 0.2039216, 1, 1,
0.3422474, 0.1310879, 0.4232782, 0, 0.1960784, 1, 1,
0.3433565, 0.673256, 1.004366, 0, 0.1882353, 1, 1,
0.3448959, -0.2777932, 1.779383, 0, 0.1843137, 1, 1,
0.3450351, -0.2722306, 1.486253, 0, 0.1764706, 1, 1,
0.3453642, 2.183767, 0.03953687, 0, 0.172549, 1, 1,
0.3467173, -0.300161, 1.486988, 0, 0.1647059, 1, 1,
0.3469221, 0.1630249, -0.01168785, 0, 0.1607843, 1, 1,
0.3559507, 0.6348059, -1.379386, 0, 0.1529412, 1, 1,
0.3593092, -0.08045159, 2.94045, 0, 0.1490196, 1, 1,
0.360716, -0.3297759, 1.940415, 0, 0.1411765, 1, 1,
0.3609918, 0.5273895, 0.8940158, 0, 0.1372549, 1, 1,
0.3711653, 0.1297781, 2.26136, 0, 0.1294118, 1, 1,
0.3733097, 0.6383062, 0.2505159, 0, 0.1254902, 1, 1,
0.3800764, 0.4421683, 1.300406, 0, 0.1176471, 1, 1,
0.3811435, 0.5261353, 0.2924196, 0, 0.1137255, 1, 1,
0.3872719, 0.6569013, 0.9138939, 0, 0.1058824, 1, 1,
0.3880885, -0.6942469, 2.165651, 0, 0.09803922, 1, 1,
0.3881645, 0.8648487, 1.682003, 0, 0.09411765, 1, 1,
0.3905097, 0.4889815, 0.6790743, 0, 0.08627451, 1, 1,
0.3914991, -0.961816, 2.481072, 0, 0.08235294, 1, 1,
0.3920638, 1.058469, 1.622476, 0, 0.07450981, 1, 1,
0.3934408, 0.1432887, 1.464774, 0, 0.07058824, 1, 1,
0.3935837, 0.02824387, 0.9565943, 0, 0.0627451, 1, 1,
0.393943, 0.06548928, 1.470745, 0, 0.05882353, 1, 1,
0.3959058, 1.823798, 1.199234, 0, 0.05098039, 1, 1,
0.4023632, -1.274969, 3.205513, 0, 0.04705882, 1, 1,
0.4073195, 0.0920653, 3.370508, 0, 0.03921569, 1, 1,
0.4124743, -0.8378874, 3.190778, 0, 0.03529412, 1, 1,
0.4209413, -1.404737, 4.059078, 0, 0.02745098, 1, 1,
0.423635, -0.2200732, 1.987309, 0, 0.02352941, 1, 1,
0.424301, 0.6235803, -0.8659533, 0, 0.01568628, 1, 1,
0.4253246, 0.01536156, 2.793012, 0, 0.01176471, 1, 1,
0.4316266, 1.12849, -0.3253756, 0, 0.003921569, 1, 1,
0.4325234, -0.2421609, 2.371115, 0.003921569, 0, 1, 1,
0.4334587, -0.8566613, 1.579863, 0.007843138, 0, 1, 1,
0.4382011, -1.388147, 3.149754, 0.01568628, 0, 1, 1,
0.4408077, -1.016196, 3.523862, 0.01960784, 0, 1, 1,
0.4421946, -0.6862928, 3.7589, 0.02745098, 0, 1, 1,
0.4453061, 0.6731747, 0.1384679, 0.03137255, 0, 1, 1,
0.4566053, 0.1706864, 1.010114, 0.03921569, 0, 1, 1,
0.4619414, -0.1078941, 1.290356, 0.04313726, 0, 1, 1,
0.4632738, 0.7184718, 0.4328071, 0.05098039, 0, 1, 1,
0.4635244, 0.7416863, 1.447229, 0.05490196, 0, 1, 1,
0.4686207, 1.360987, -1.318998, 0.0627451, 0, 1, 1,
0.4689916, 1.074619, -0.2230691, 0.06666667, 0, 1, 1,
0.4719608, 1.591791, 2.087343, 0.07450981, 0, 1, 1,
0.4726141, 0.5501282, 2.002525, 0.07843138, 0, 1, 1,
0.4735858, -2.619522, 5.356308, 0.08627451, 0, 1, 1,
0.4788935, 0.7766749, -0.7186856, 0.09019608, 0, 1, 1,
0.4887857, 0.291977, 1.196196, 0.09803922, 0, 1, 1,
0.4937504, 0.4168393, -0.5857328, 0.1058824, 0, 1, 1,
0.5008566, 0.7613978, 0.6950127, 0.1098039, 0, 1, 1,
0.5019794, -1.269599, 1.060328, 0.1176471, 0, 1, 1,
0.502677, 0.09848434, 0.6720507, 0.1215686, 0, 1, 1,
0.5038542, 0.4007368, 0.05642779, 0.1294118, 0, 1, 1,
0.5131955, -0.6303408, 2.878644, 0.1333333, 0, 1, 1,
0.5140473, -1.539335, 2.578491, 0.1411765, 0, 1, 1,
0.5142707, 0.4262562, 1.484625, 0.145098, 0, 1, 1,
0.5153821, 0.9626351, -1.305859, 0.1529412, 0, 1, 1,
0.5163919, -1.293942, 2.138078, 0.1568628, 0, 1, 1,
0.5199125, -0.6324446, 2.015073, 0.1647059, 0, 1, 1,
0.5245368, -1.352488, 2.852575, 0.1686275, 0, 1, 1,
0.525143, -0.791868, 3.375909, 0.1764706, 0, 1, 1,
0.5315363, -1.283495, 3.260518, 0.1803922, 0, 1, 1,
0.5320293, 1.682328, -1.441182, 0.1882353, 0, 1, 1,
0.5334037, -0.2518024, 0.7080161, 0.1921569, 0, 1, 1,
0.5344895, -2.364085, 3.772029, 0.2, 0, 1, 1,
0.5363139, -0.8303205, 0.5470979, 0.2078431, 0, 1, 1,
0.5379006, -0.03968427, 0.2730479, 0.2117647, 0, 1, 1,
0.5426689, 1.114821, 0.7474276, 0.2196078, 0, 1, 1,
0.5444376, 0.955877, 1.274249, 0.2235294, 0, 1, 1,
0.5473967, 0.1845661, 0.4231946, 0.2313726, 0, 1, 1,
0.5496209, 1.280973, 0.2047246, 0.2352941, 0, 1, 1,
0.5514928, -0.6680201, 1.82537, 0.2431373, 0, 1, 1,
0.5518122, 1.040475, -0.2841172, 0.2470588, 0, 1, 1,
0.5570496, -0.5897449, 1.227758, 0.254902, 0, 1, 1,
0.5581893, -0.8500281, 3.845265, 0.2588235, 0, 1, 1,
0.5697202, -0.1186451, 1.862939, 0.2666667, 0, 1, 1,
0.5710608, 1.204295, 0.2764884, 0.2705882, 0, 1, 1,
0.5771095, -0.4307771, 2.084489, 0.2784314, 0, 1, 1,
0.5791532, 1.45602, -0.5414813, 0.282353, 0, 1, 1,
0.5815942, 0.08432612, 1.691625, 0.2901961, 0, 1, 1,
0.5818586, -0.9165334, 2.107153, 0.2941177, 0, 1, 1,
0.583268, -0.6651676, 2.849155, 0.3019608, 0, 1, 1,
0.5880306, 0.5341479, 0.6916943, 0.3098039, 0, 1, 1,
0.5918497, -2.032231, 2.514369, 0.3137255, 0, 1, 1,
0.5966831, 1.009656, 1.136453, 0.3215686, 0, 1, 1,
0.5997268, 0.1041858, 0.8299029, 0.3254902, 0, 1, 1,
0.6015996, -0.550078, 4.298078, 0.3333333, 0, 1, 1,
0.6162214, -1.29866, 4.148509, 0.3372549, 0, 1, 1,
0.6176481, 0.7796304, 1.328006, 0.345098, 0, 1, 1,
0.6213081, 0.3439494, 1.057178, 0.3490196, 0, 1, 1,
0.6218381, -0.7656766, 3.175814, 0.3568628, 0, 1, 1,
0.6244675, 2.09825, -1.552695, 0.3607843, 0, 1, 1,
0.6269483, 0.5122135, 0.4571805, 0.3686275, 0, 1, 1,
0.6270772, 0.8115327, 0.6780874, 0.372549, 0, 1, 1,
0.6323177, -1.959063, 3.16249, 0.3803922, 0, 1, 1,
0.6371226, -0.6991198, 4.778797, 0.3843137, 0, 1, 1,
0.6377504, 1.4536, 0.4184612, 0.3921569, 0, 1, 1,
0.6381506, -1.410119, 3.514318, 0.3960784, 0, 1, 1,
0.6481728, -0.9314368, 3.26977, 0.4039216, 0, 1, 1,
0.6531394, -0.9504662, 4.444881, 0.4117647, 0, 1, 1,
0.6540191, 0.9644077, -0.1283872, 0.4156863, 0, 1, 1,
0.6555457, 0.352675, 0.5404821, 0.4235294, 0, 1, 1,
0.6597909, 1.330853, -0.6228524, 0.427451, 0, 1, 1,
0.6598106, 2.268803, 1.015584, 0.4352941, 0, 1, 1,
0.6606551, 0.2102792, -0.167052, 0.4392157, 0, 1, 1,
0.6637087, -0.5210931, 3.942276, 0.4470588, 0, 1, 1,
0.6646262, -0.1692513, 0.7079241, 0.4509804, 0, 1, 1,
0.6651998, -0.9446953, 2.320925, 0.4588235, 0, 1, 1,
0.669833, 1.480986, 1.793988, 0.4627451, 0, 1, 1,
0.6721592, -1.038491, 1.761046, 0.4705882, 0, 1, 1,
0.6809813, 0.9167289, 0.6895169, 0.4745098, 0, 1, 1,
0.6891741, -0.8016129, 3.249327, 0.4823529, 0, 1, 1,
0.6924596, 0.8277428, 0.5941272, 0.4862745, 0, 1, 1,
0.694118, -1.837093, 2.750365, 0.4941176, 0, 1, 1,
0.7049182, -1.78533, 2.25827, 0.5019608, 0, 1, 1,
0.7198692, -2.299483, 1.877732, 0.5058824, 0, 1, 1,
0.720088, -0.07068722, 0.2802451, 0.5137255, 0, 1, 1,
0.7204121, -0.8458875, 4.43207, 0.5176471, 0, 1, 1,
0.7219096, -0.4529322, 1.561216, 0.5254902, 0, 1, 1,
0.7225658, 1.303301, 0.09545937, 0.5294118, 0, 1, 1,
0.7309473, 0.8935001, 1.428411, 0.5372549, 0, 1, 1,
0.7326536, -0.02549873, 3.028089, 0.5411765, 0, 1, 1,
0.7364633, 0.3110402, 1.609298, 0.5490196, 0, 1, 1,
0.7367293, -0.1920915, 1.806693, 0.5529412, 0, 1, 1,
0.7381446, -1.392936, 2.359148, 0.5607843, 0, 1, 1,
0.7443694, 0.03891318, 2.467461, 0.5647059, 0, 1, 1,
0.7516093, -0.1330273, 0.5404974, 0.572549, 0, 1, 1,
0.7521049, 0.6987644, -0.1781263, 0.5764706, 0, 1, 1,
0.7535613, -0.5000932, 3.692995, 0.5843138, 0, 1, 1,
0.7545398, -0.7551765, -0.3558919, 0.5882353, 0, 1, 1,
0.7552885, -0.7943954, 2.585458, 0.5960785, 0, 1, 1,
0.7585394, 2.23139, 0.8184102, 0.6039216, 0, 1, 1,
0.7620141, -0.9029421, 3.283808, 0.6078432, 0, 1, 1,
0.7693771, -0.0380168, 1.899095, 0.6156863, 0, 1, 1,
0.7714691, 0.2819295, 1.072155, 0.6196079, 0, 1, 1,
0.7849936, 0.8600117, 0.5775694, 0.627451, 0, 1, 1,
0.7858399, 0.131476, 1.224654, 0.6313726, 0, 1, 1,
0.7897235, -0.03292965, 1.583226, 0.6392157, 0, 1, 1,
0.7909036, -0.1147576, 1.3425, 0.6431373, 0, 1, 1,
0.7913134, -1.065607, 1.003798, 0.6509804, 0, 1, 1,
0.79774, 2.786837, 1.039154, 0.654902, 0, 1, 1,
0.7984557, -0.5751764, 2.516316, 0.6627451, 0, 1, 1,
0.8023673, -0.565526, -0.05613811, 0.6666667, 0, 1, 1,
0.8050546, 0.09460187, 2.032077, 0.6745098, 0, 1, 1,
0.8075841, -0.3622591, 3.282233, 0.6784314, 0, 1, 1,
0.8137076, -1.924762, 1.880717, 0.6862745, 0, 1, 1,
0.8142319, 0.491651, 1.806357, 0.6901961, 0, 1, 1,
0.8171095, -0.2834718, 1.888869, 0.6980392, 0, 1, 1,
0.8171121, 0.582032, 0.9827422, 0.7058824, 0, 1, 1,
0.8171437, -0.446685, 1.941436, 0.7098039, 0, 1, 1,
0.8177724, -0.4466576, 2.840445, 0.7176471, 0, 1, 1,
0.8195624, -0.3128481, 3.816446, 0.7215686, 0, 1, 1,
0.8255242, -0.2405434, 1.228302, 0.7294118, 0, 1, 1,
0.8263261, 1.344244, 0.7514747, 0.7333333, 0, 1, 1,
0.827117, 0.5129784, 1.022166, 0.7411765, 0, 1, 1,
0.8316295, -0.7628191, 2.070688, 0.7450981, 0, 1, 1,
0.8316616, 0.9066279, 1.116251, 0.7529412, 0, 1, 1,
0.839628, 0.5846685, 1.301078, 0.7568628, 0, 1, 1,
0.8429476, -0.001635742, 1.960551, 0.7647059, 0, 1, 1,
0.8439457, -2.532385, 3.775918, 0.7686275, 0, 1, 1,
0.8447281, -1.645898, 3.513772, 0.7764706, 0, 1, 1,
0.8476162, -0.6254996, 0.4041334, 0.7803922, 0, 1, 1,
0.8510023, -1.026886, 4.414616, 0.7882353, 0, 1, 1,
0.8511403, -0.9584998, 2.246688, 0.7921569, 0, 1, 1,
0.8625274, 0.8548478, 1.464556, 0.8, 0, 1, 1,
0.8698109, -2.473252, 2.810232, 0.8078431, 0, 1, 1,
0.8761115, 0.9441713, 0.5871883, 0.8117647, 0, 1, 1,
0.8792871, -0.6537148, 3.135581, 0.8196079, 0, 1, 1,
0.8867751, -0.2659541, 2.036958, 0.8235294, 0, 1, 1,
0.891034, -1.009702, 1.204835, 0.8313726, 0, 1, 1,
0.8956817, 1.434804, 0.05725835, 0.8352941, 0, 1, 1,
0.8966405, -1.828323, 2.951271, 0.8431373, 0, 1, 1,
0.8994408, 0.130538, 1.83925, 0.8470588, 0, 1, 1,
0.9013112, -0.389699, 2.020397, 0.854902, 0, 1, 1,
0.9066054, -1.097279, 2.27758, 0.8588235, 0, 1, 1,
0.919974, 2.859338, 2.463064, 0.8666667, 0, 1, 1,
0.9203064, -1.728754, 1.893471, 0.8705882, 0, 1, 1,
0.9242238, -0.1102299, -0.05591879, 0.8784314, 0, 1, 1,
0.9276394, -0.9758387, 2.562654, 0.8823529, 0, 1, 1,
0.9307501, 0.69068, 1.241282, 0.8901961, 0, 1, 1,
0.9312717, 1.150289, -0.4065157, 0.8941177, 0, 1, 1,
0.9337726, 0.1726074, 1.184817, 0.9019608, 0, 1, 1,
0.9400409, -0.2008503, 3.146036, 0.9098039, 0, 1, 1,
0.9471673, -0.03492945, 2.659639, 0.9137255, 0, 1, 1,
0.9490828, -0.5882171, 1.665936, 0.9215686, 0, 1, 1,
0.9525103, -1.553019, 3.628406, 0.9254902, 0, 1, 1,
0.9540328, 1.328214, 1.112089, 0.9333333, 0, 1, 1,
0.9576713, -1.887493, 2.978096, 0.9372549, 0, 1, 1,
0.9656991, 1.028206, 0.08864306, 0.945098, 0, 1, 1,
0.9684349, 1.348721, 0.5644984, 0.9490196, 0, 1, 1,
0.9715998, 1.418945, 0.7112736, 0.9568627, 0, 1, 1,
0.9723202, -0.850866, 2.580816, 0.9607843, 0, 1, 1,
0.9739425, 0.5484107, 0.5697243, 0.9686275, 0, 1, 1,
0.974158, 0.5006927, 1.11446, 0.972549, 0, 1, 1,
0.9759792, 1.106238, 0.2439736, 0.9803922, 0, 1, 1,
0.9769033, -0.9934229, 1.758151, 0.9843137, 0, 1, 1,
0.9788916, -0.2203556, 2.683685, 0.9921569, 0, 1, 1,
0.9904057, 0.4742528, 0.2303743, 0.9960784, 0, 1, 1,
0.9921839, -0.2470677, 2.519526, 1, 0, 0.9960784, 1,
0.9932485, 1.154465, 0.7394333, 1, 0, 0.9882353, 1,
1.004812, -0.6312956, 2.943181, 1, 0, 0.9843137, 1,
1.008761, -1.578509, 1.480659, 1, 0, 0.9764706, 1,
1.008886, 1.328655, 0.9720408, 1, 0, 0.972549, 1,
1.01517, 1.157805, 0.620882, 1, 0, 0.9647059, 1,
1.021509, 2.417235, 0.7289866, 1, 0, 0.9607843, 1,
1.026041, -0.47681, 1.995061, 1, 0, 0.9529412, 1,
1.029683, -0.06228395, 0.7354921, 1, 0, 0.9490196, 1,
1.036001, 1.616107, 1.761965, 1, 0, 0.9411765, 1,
1.038317, -0.3470584, 3.437789, 1, 0, 0.9372549, 1,
1.039916, 0.5477371, 0.6147101, 1, 0, 0.9294118, 1,
1.041689, -0.6449087, 1.744377, 1, 0, 0.9254902, 1,
1.045864, -0.2249163, 1.245559, 1, 0, 0.9176471, 1,
1.046433, 0.6090265, 0.01512609, 1, 0, 0.9137255, 1,
1.046882, -0.4155073, 2.452068, 1, 0, 0.9058824, 1,
1.054418, 1.186451, 3.073711, 1, 0, 0.9019608, 1,
1.057753, -0.08887554, 1.690114, 1, 0, 0.8941177, 1,
1.062593, -0.745523, 2.630291, 1, 0, 0.8862745, 1,
1.065334, 1.621779, 1.236234, 1, 0, 0.8823529, 1,
1.067145, -1.830583, 1.211578, 1, 0, 0.8745098, 1,
1.067917, -1.478436, 2.6359, 1, 0, 0.8705882, 1,
1.071453, -0.5769944, 2.435375, 1, 0, 0.8627451, 1,
1.077373, 0.1712623, 2.369391, 1, 0, 0.8588235, 1,
1.078802, -1.609709, 3.066794, 1, 0, 0.8509804, 1,
1.081136, -1.059279, 1.967791, 1, 0, 0.8470588, 1,
1.081613, -0.3247208, 2.15781, 1, 0, 0.8392157, 1,
1.08839, -0.8460212, 2.137236, 1, 0, 0.8352941, 1,
1.089593, 0.1407532, 0.7638507, 1, 0, 0.827451, 1,
1.091153, 0.6178553, 2.112016, 1, 0, 0.8235294, 1,
1.095206, -1.058667, 2.400175, 1, 0, 0.8156863, 1,
1.096073, -0.8370062, 2.191186, 1, 0, 0.8117647, 1,
1.100803, -0.4199513, 0.9865881, 1, 0, 0.8039216, 1,
1.101345, -0.07783627, 0.2362316, 1, 0, 0.7960784, 1,
1.106641, 0.4406131, -0.4460656, 1, 0, 0.7921569, 1,
1.113325, 0.1633763, 2.208991, 1, 0, 0.7843137, 1,
1.113482, -1.038131, 2.968646, 1, 0, 0.7803922, 1,
1.11617, -1.163222, 2.104251, 1, 0, 0.772549, 1,
1.11728, 0.5568246, 0.3288805, 1, 0, 0.7686275, 1,
1.1206, -1.111626, 2.042278, 1, 0, 0.7607843, 1,
1.127639, -1.625182, 2.937591, 1, 0, 0.7568628, 1,
1.128843, 0.09562688, 1.327359, 1, 0, 0.7490196, 1,
1.135142, 0.8073108, 1.112586, 1, 0, 0.7450981, 1,
1.135988, 1.098858, 0.558777, 1, 0, 0.7372549, 1,
1.147025, -1.163268, 2.141515, 1, 0, 0.7333333, 1,
1.147128, 0.193229, 1.932165, 1, 0, 0.7254902, 1,
1.150001, -1.245231, 2.010821, 1, 0, 0.7215686, 1,
1.150406, -1.712274, 4.723078, 1, 0, 0.7137255, 1,
1.150605, 1.10624, 0.1720306, 1, 0, 0.7098039, 1,
1.155211, -1.300085, 1.736117, 1, 0, 0.7019608, 1,
1.162285, 0.7070706, 0.210183, 1, 0, 0.6941177, 1,
1.163973, 0.4529729, 1.273415, 1, 0, 0.6901961, 1,
1.173419, -0.4236968, 2.768718, 1, 0, 0.682353, 1,
1.176519, -1.324941, 0.6817802, 1, 0, 0.6784314, 1,
1.176791, -0.3929616, 2.425611, 1, 0, 0.6705883, 1,
1.185599, 0.06850141, 3.140158, 1, 0, 0.6666667, 1,
1.187928, -0.5150288, 3.018337, 1, 0, 0.6588235, 1,
1.191914, -0.9685873, 3.175565, 1, 0, 0.654902, 1,
1.193733, -0.1785802, 0.7365385, 1, 0, 0.6470588, 1,
1.198268, 0.39858, 0.581075, 1, 0, 0.6431373, 1,
1.201633, 0.2196835, 0.4034127, 1, 0, 0.6352941, 1,
1.202334, -0.463483, 1.937071, 1, 0, 0.6313726, 1,
1.204019, -0.01787005, 3.724392, 1, 0, 0.6235294, 1,
1.209352, 0.517087, 0.0155203, 1, 0, 0.6196079, 1,
1.209411, -0.3017907, 1.894437, 1, 0, 0.6117647, 1,
1.211759, 0.9948872, 0.9222978, 1, 0, 0.6078432, 1,
1.217083, -0.700461, 2.792591, 1, 0, 0.6, 1,
1.217844, -0.1732716, 1.715805, 1, 0, 0.5921569, 1,
1.227044, -0.6815159, 1.787815, 1, 0, 0.5882353, 1,
1.242678, 0.8788288, -0.6054124, 1, 0, 0.5803922, 1,
1.248711, -0.02292017, 1.500388, 1, 0, 0.5764706, 1,
1.251473, -0.4112357, 1.893654, 1, 0, 0.5686275, 1,
1.257835, -0.8774499, 2.961381, 1, 0, 0.5647059, 1,
1.260195, 0.1484569, -0.1177645, 1, 0, 0.5568628, 1,
1.264994, -0.273631, 0.711831, 1, 0, 0.5529412, 1,
1.28488, -0.1059815, 0.7969521, 1, 0, 0.5450981, 1,
1.302182, -2.13782, 3.494486, 1, 0, 0.5411765, 1,
1.303045, -0.04532327, 0.604885, 1, 0, 0.5333334, 1,
1.34023, 1.094014, 3.211357, 1, 0, 0.5294118, 1,
1.344723, 0.7408435, 2.095521, 1, 0, 0.5215687, 1,
1.348027, -1.202414, 0.8728558, 1, 0, 0.5176471, 1,
1.359938, -0.03057898, 1.901269, 1, 0, 0.509804, 1,
1.361565, -0.5493287, 1.277315, 1, 0, 0.5058824, 1,
1.362569, 0.879793, 0.9852815, 1, 0, 0.4980392, 1,
1.378511, 0.4577112, 1.075087, 1, 0, 0.4901961, 1,
1.394575, -2.615144, 1.484881, 1, 0, 0.4862745, 1,
1.413082, -0.5812442, 1.80038, 1, 0, 0.4784314, 1,
1.418634, 0.9963982, 0.7951363, 1, 0, 0.4745098, 1,
1.425124, 0.6719959, 0.7302809, 1, 0, 0.4666667, 1,
1.425952, 0.01771847, 2.412552, 1, 0, 0.4627451, 1,
1.430354, 1.971915, 0.7772957, 1, 0, 0.454902, 1,
1.435787, -0.7185919, 1.874707, 1, 0, 0.4509804, 1,
1.440266, 1.09697, 1.814366, 1, 0, 0.4431373, 1,
1.44053, 1.392948, 1.438364, 1, 0, 0.4392157, 1,
1.45971, -0.7378703, 1.633695, 1, 0, 0.4313726, 1,
1.463897, 0.2874562, 1.456868, 1, 0, 0.427451, 1,
1.468694, -0.4876499, 1.704669, 1, 0, 0.4196078, 1,
1.473241, -0.4710178, 0.9555338, 1, 0, 0.4156863, 1,
1.476332, -1.037277, 2.754757, 1, 0, 0.4078431, 1,
1.481559, -0.2061716, 1.774944, 1, 0, 0.4039216, 1,
1.483637, 1.78461, 1.094112, 1, 0, 0.3960784, 1,
1.490003, 1.263895, 1.819417, 1, 0, 0.3882353, 1,
1.500834, -0.8582263, 0.1125379, 1, 0, 0.3843137, 1,
1.504987, -0.746821, 0.386173, 1, 0, 0.3764706, 1,
1.510522, -0.06606468, 0.8709025, 1, 0, 0.372549, 1,
1.527799, -0.6166281, 1.598455, 1, 0, 0.3647059, 1,
1.532104, 0.1273076, -0.3037415, 1, 0, 0.3607843, 1,
1.533224, -0.4468149, 2.488698, 1, 0, 0.3529412, 1,
1.543669, 0.4358825, 1.066363, 1, 0, 0.3490196, 1,
1.561042, -1.19667, 1.691255, 1, 0, 0.3411765, 1,
1.565122, 0.9279487, 1.59053, 1, 0, 0.3372549, 1,
1.577368, -0.1513335, 2.99734, 1, 0, 0.3294118, 1,
1.594496, 0.5507405, 1.936663, 1, 0, 0.3254902, 1,
1.603464, 0.5320895, 0.4406395, 1, 0, 0.3176471, 1,
1.6177, 0.406216, 2.665267, 1, 0, 0.3137255, 1,
1.621162, 0.09320553, 1.986133, 1, 0, 0.3058824, 1,
1.624853, -0.7276392, 1.294467, 1, 0, 0.2980392, 1,
1.637522, -0.1315052, -0.3521494, 1, 0, 0.2941177, 1,
1.641263, 0.50959, 0.4343915, 1, 0, 0.2862745, 1,
1.644999, 1.332127, 0.3806004, 1, 0, 0.282353, 1,
1.651253, 1.748887, 0.3749723, 1, 0, 0.2745098, 1,
1.652086, -1.394897, 1.83754, 1, 0, 0.2705882, 1,
1.681768, -0.6406307, 2.084442, 1, 0, 0.2627451, 1,
1.691482, 1.608532, 1.107985, 1, 0, 0.2588235, 1,
1.698099, -1.454366, 2.644984, 1, 0, 0.2509804, 1,
1.699211, -0.52503, 1.281772, 1, 0, 0.2470588, 1,
1.700685, -0.5977508, 2.280138, 1, 0, 0.2392157, 1,
1.700986, -1.150218, 2.238961, 1, 0, 0.2352941, 1,
1.725152, 1.579073, 1.234334, 1, 0, 0.227451, 1,
1.76095, 0.04357954, 3.319531, 1, 0, 0.2235294, 1,
1.766817, 1.238814, 1.044471, 1, 0, 0.2156863, 1,
1.824176, -1.066351, 1.992966, 1, 0, 0.2117647, 1,
1.828263, -3.086109, 3.527667, 1, 0, 0.2039216, 1,
1.838278, -2.278386, 3.848761, 1, 0, 0.1960784, 1,
1.861199, 0.9371831, 1.742945, 1, 0, 0.1921569, 1,
1.867014, -0.6430826, 2.71359, 1, 0, 0.1843137, 1,
1.871272, 0.5056771, 1.871047, 1, 0, 0.1803922, 1,
1.873973, 1.068612, 0.7527258, 1, 0, 0.172549, 1,
1.886542, 1.417543, 0.4864309, 1, 0, 0.1686275, 1,
1.95832, -0.4482687, 2.187992, 1, 0, 0.1607843, 1,
1.978936, 1.090076, 2.175711, 1, 0, 0.1568628, 1,
2.015157, -0.3658646, 1.801974, 1, 0, 0.1490196, 1,
2.016675, 0.1436516, 1.797238, 1, 0, 0.145098, 1,
2.0325, -0.2810757, 1.402471, 1, 0, 0.1372549, 1,
2.051999, -0.3867, 3.145089, 1, 0, 0.1333333, 1,
2.057027, -2.011323, 2.001353, 1, 0, 0.1254902, 1,
2.064536, 0.5105894, 1.348915, 1, 0, 0.1215686, 1,
2.138397, 1.690838, 1.144182, 1, 0, 0.1137255, 1,
2.144729, -0.692558, 0.8731939, 1, 0, 0.1098039, 1,
2.183304, -0.6141278, 2.337497, 1, 0, 0.1019608, 1,
2.199746, 0.6479809, 0.3638528, 1, 0, 0.09411765, 1,
2.218805, 1.21302, 1.074422, 1, 0, 0.09019608, 1,
2.220859, 0.2436187, 1.395478, 1, 0, 0.08235294, 1,
2.308702, 0.4978724, 0.8327667, 1, 0, 0.07843138, 1,
2.318951, 2.000343, 1.330302, 1, 0, 0.07058824, 1,
2.375844, 0.1707037, 1.660201, 1, 0, 0.06666667, 1,
2.508977, 0.05133021, 2.082583, 1, 0, 0.05882353, 1,
2.55328, 0.6981656, -0.676257, 1, 0, 0.05490196, 1,
2.568304, 1.711468, 1.335073, 1, 0, 0.04705882, 1,
2.60207, 0.5756308, 0.2962995, 1, 0, 0.04313726, 1,
2.638286, 0.3995319, 1.147846, 1, 0, 0.03529412, 1,
2.663137, 0.5606666, 1.83786, 1, 0, 0.03137255, 1,
3.000022, -1.341298, 1.521049, 1, 0, 0.02352941, 1,
3.015883, 1.054363, 2.081771, 1, 0, 0.01960784, 1,
3.048345, -0.6752198, 3.712549, 1, 0, 0.01176471, 1,
3.808864, 0.1331328, 1.558723, 1, 0, 0.007843138, 1
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
0.3017402, -4.157053, -7.576449, 0, -0.5, 0.5, 0.5,
0.3017402, -4.157053, -7.576449, 1, -0.5, 0.5, 0.5,
0.3017402, -4.157053, -7.576449, 1, 1.5, 0.5, 0.5,
0.3017402, -4.157053, -7.576449, 0, 1.5, 0.5, 0.5
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
-4.394299, 0.0730207, -7.576449, 0, -0.5, 0.5, 0.5,
-4.394299, 0.0730207, -7.576449, 1, -0.5, 0.5, 0.5,
-4.394299, 0.0730207, -7.576449, 1, 1.5, 0.5, 0.5,
-4.394299, 0.0730207, -7.576449, 0, 1.5, 0.5, 0.5
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
-4.394299, -4.157053, -0.172874, 0, -0.5, 0.5, 0.5,
-4.394299, -4.157053, -0.172874, 1, -0.5, 0.5, 0.5,
-4.394299, -4.157053, -0.172874, 1, 1.5, 0.5, 0.5,
-4.394299, -4.157053, -0.172874, 0, 1.5, 0.5, 0.5
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
-2, -3.180882, -5.867932,
2, -3.180882, -5.867932,
-2, -3.180882, -5.867932,
-2, -3.343578, -6.152685,
0, -3.180882, -5.867932,
0, -3.343578, -6.152685,
2, -3.180882, -5.867932,
2, -3.343578, -6.152685
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
"0",
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
-2, -3.668968, -6.72219, 0, -0.5, 0.5, 0.5,
-2, -3.668968, -6.72219, 1, -0.5, 0.5, 0.5,
-2, -3.668968, -6.72219, 1, 1.5, 0.5, 0.5,
-2, -3.668968, -6.72219, 0, 1.5, 0.5, 0.5,
0, -3.668968, -6.72219, 0, -0.5, 0.5, 0.5,
0, -3.668968, -6.72219, 1, -0.5, 0.5, 0.5,
0, -3.668968, -6.72219, 1, 1.5, 0.5, 0.5,
0, -3.668968, -6.72219, 0, 1.5, 0.5, 0.5,
2, -3.668968, -6.72219, 0, -0.5, 0.5, 0.5,
2, -3.668968, -6.72219, 1, -0.5, 0.5, 0.5,
2, -3.668968, -6.72219, 1, 1.5, 0.5, 0.5,
2, -3.668968, -6.72219, 0, 1.5, 0.5, 0.5
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
-3.310597, -3, -5.867932,
-3.310597, 3, -5.867932,
-3.310597, -3, -5.867932,
-3.491214, -3, -6.152685,
-3.310597, -2, -5.867932,
-3.491214, -2, -6.152685,
-3.310597, -1, -5.867932,
-3.491214, -1, -6.152685,
-3.310597, 0, -5.867932,
-3.491214, 0, -6.152685,
-3.310597, 1, -5.867932,
-3.491214, 1, -6.152685,
-3.310597, 2, -5.867932,
-3.491214, 2, -6.152685,
-3.310597, 3, -5.867932,
-3.491214, 3, -6.152685
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
-3.852448, -3, -6.72219, 0, -0.5, 0.5, 0.5,
-3.852448, -3, -6.72219, 1, -0.5, 0.5, 0.5,
-3.852448, -3, -6.72219, 1, 1.5, 0.5, 0.5,
-3.852448, -3, -6.72219, 0, 1.5, 0.5, 0.5,
-3.852448, -2, -6.72219, 0, -0.5, 0.5, 0.5,
-3.852448, -2, -6.72219, 1, -0.5, 0.5, 0.5,
-3.852448, -2, -6.72219, 1, 1.5, 0.5, 0.5,
-3.852448, -2, -6.72219, 0, 1.5, 0.5, 0.5,
-3.852448, -1, -6.72219, 0, -0.5, 0.5, 0.5,
-3.852448, -1, -6.72219, 1, -0.5, 0.5, 0.5,
-3.852448, -1, -6.72219, 1, 1.5, 0.5, 0.5,
-3.852448, -1, -6.72219, 0, 1.5, 0.5, 0.5,
-3.852448, 0, -6.72219, 0, -0.5, 0.5, 0.5,
-3.852448, 0, -6.72219, 1, -0.5, 0.5, 0.5,
-3.852448, 0, -6.72219, 1, 1.5, 0.5, 0.5,
-3.852448, 0, -6.72219, 0, 1.5, 0.5, 0.5,
-3.852448, 1, -6.72219, 0, -0.5, 0.5, 0.5,
-3.852448, 1, -6.72219, 1, -0.5, 0.5, 0.5,
-3.852448, 1, -6.72219, 1, 1.5, 0.5, 0.5,
-3.852448, 1, -6.72219, 0, 1.5, 0.5, 0.5,
-3.852448, 2, -6.72219, 0, -0.5, 0.5, 0.5,
-3.852448, 2, -6.72219, 1, -0.5, 0.5, 0.5,
-3.852448, 2, -6.72219, 1, 1.5, 0.5, 0.5,
-3.852448, 2, -6.72219, 0, 1.5, 0.5, 0.5,
-3.852448, 3, -6.72219, 0, -0.5, 0.5, 0.5,
-3.852448, 3, -6.72219, 1, -0.5, 0.5, 0.5,
-3.852448, 3, -6.72219, 1, 1.5, 0.5, 0.5,
-3.852448, 3, -6.72219, 0, 1.5, 0.5, 0.5
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
-3.310597, -3.180882, -4,
-3.310597, -3.180882, 4,
-3.310597, -3.180882, -4,
-3.491214, -3.343578, -4,
-3.310597, -3.180882, -2,
-3.491214, -3.343578, -2,
-3.310597, -3.180882, 0,
-3.491214, -3.343578, 0,
-3.310597, -3.180882, 2,
-3.491214, -3.343578, 2,
-3.310597, -3.180882, 4,
-3.491214, -3.343578, 4
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
-3.852448, -3.668968, -4, 0, -0.5, 0.5, 0.5,
-3.852448, -3.668968, -4, 1, -0.5, 0.5, 0.5,
-3.852448, -3.668968, -4, 1, 1.5, 0.5, 0.5,
-3.852448, -3.668968, -4, 0, 1.5, 0.5, 0.5,
-3.852448, -3.668968, -2, 0, -0.5, 0.5, 0.5,
-3.852448, -3.668968, -2, 1, -0.5, 0.5, 0.5,
-3.852448, -3.668968, -2, 1, 1.5, 0.5, 0.5,
-3.852448, -3.668968, -2, 0, 1.5, 0.5, 0.5,
-3.852448, -3.668968, 0, 0, -0.5, 0.5, 0.5,
-3.852448, -3.668968, 0, 1, -0.5, 0.5, 0.5,
-3.852448, -3.668968, 0, 1, 1.5, 0.5, 0.5,
-3.852448, -3.668968, 0, 0, 1.5, 0.5, 0.5,
-3.852448, -3.668968, 2, 0, -0.5, 0.5, 0.5,
-3.852448, -3.668968, 2, 1, -0.5, 0.5, 0.5,
-3.852448, -3.668968, 2, 1, 1.5, 0.5, 0.5,
-3.852448, -3.668968, 2, 0, 1.5, 0.5, 0.5,
-3.852448, -3.668968, 4, 0, -0.5, 0.5, 0.5,
-3.852448, -3.668968, 4, 1, -0.5, 0.5, 0.5,
-3.852448, -3.668968, 4, 1, 1.5, 0.5, 0.5,
-3.852448, -3.668968, 4, 0, 1.5, 0.5, 0.5
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
-3.310597, -3.180882, -5.867932,
-3.310597, 3.326924, -5.867932,
-3.310597, -3.180882, 5.522184,
-3.310597, 3.326924, 5.522184,
-3.310597, -3.180882, -5.867932,
-3.310597, -3.180882, 5.522184,
-3.310597, 3.326924, -5.867932,
-3.310597, 3.326924, 5.522184,
-3.310597, -3.180882, -5.867932,
3.914078, -3.180882, -5.867932,
-3.310597, -3.180882, 5.522184,
3.914078, -3.180882, 5.522184,
-3.310597, 3.326924, -5.867932,
3.914078, 3.326924, -5.867932,
-3.310597, 3.326924, 5.522184,
3.914078, 3.326924, 5.522184,
3.914078, -3.180882, -5.867932,
3.914078, 3.326924, -5.867932,
3.914078, -3.180882, 5.522184,
3.914078, 3.326924, 5.522184,
3.914078, -3.180882, -5.867932,
3.914078, -3.180882, 5.522184,
3.914078, 3.326924, -5.867932,
3.914078, 3.326924, 5.522184
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
var radius = 7.996923;
var distance = 35.57921;
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
mvMatrix.translate( -0.3017402, -0.0730207, 0.172874 );
mvMatrix.scale( 1.196791, 1.328624, 0.7591169 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.57921);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
quinol_sulfate<-read.table("quinol_sulfate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinol_sulfate$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinol_sulfate' not found
```

```r
y<-quinol_sulfate$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinol_sulfate' not found
```

```r
z<-quinol_sulfate$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinol_sulfate' not found
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
-3.205384, 1.345774, -0.6227113, 0, 0, 1, 1, 1,
-3.138019, -1.319531, -3.673586, 1, 0, 0, 1, 1,
-2.877467, 1.545321, 0.1341544, 1, 0, 0, 1, 1,
-2.710985, -0.1311618, -1.339824, 1, 0, 0, 1, 1,
-2.547153, 0.1660017, -2.420814, 1, 0, 0, 1, 1,
-2.515846, -0.5087491, -1.490075, 1, 0, 0, 1, 1,
-2.506175, 0.9088694, -1.867709, 0, 0, 0, 1, 1,
-2.414953, -0.4209662, -2.812851, 0, 0, 0, 1, 1,
-2.404209, -0.1470288, -2.444955, 0, 0, 0, 1, 1,
-2.35778, 0.1933181, -2.149451, 0, 0, 0, 1, 1,
-2.322035, -1.216032, -1.769325, 0, 0, 0, 1, 1,
-2.264988, 0.1949645, -2.384257, 0, 0, 0, 1, 1,
-2.208251, 0.6296929, -1.717624, 0, 0, 0, 1, 1,
-2.190114, 0.7620275, -0.9300634, 1, 1, 1, 1, 1,
-2.054009, -0.6245425, -3.040138, 1, 1, 1, 1, 1,
-2.007423, -0.03603049, -2.437736, 1, 1, 1, 1, 1,
-2.005951, 0.6689099, -1.582495, 1, 1, 1, 1, 1,
-1.973457, -1.419614, -3.653079, 1, 1, 1, 1, 1,
-1.97339, 0.613017, -1.414339, 1, 1, 1, 1, 1,
-1.938211, 0.2308504, -0.4636739, 1, 1, 1, 1, 1,
-1.911168, -0.6180263, -0.4390735, 1, 1, 1, 1, 1,
-1.89212, -0.1935047, -1.370813, 1, 1, 1, 1, 1,
-1.886111, -0.1045476, -1.922517, 1, 1, 1, 1, 1,
-1.846481, -2.167553, -2.078713, 1, 1, 1, 1, 1,
-1.837012, 0.5669742, -0.6468785, 1, 1, 1, 1, 1,
-1.825811, -0.3728016, -2.374346, 1, 1, 1, 1, 1,
-1.776565, -0.9780484, -1.211417, 1, 1, 1, 1, 1,
-1.761629, -0.1014178, -2.401423, 1, 1, 1, 1, 1,
-1.749819, -0.1122116, -3.347506, 0, 0, 1, 1, 1,
-1.736682, -0.9499177, -3.072919, 1, 0, 0, 1, 1,
-1.728155, -1.35423, -1.874734, 1, 0, 0, 1, 1,
-1.725903, 1.278945, -1.174428, 1, 0, 0, 1, 1,
-1.714577, -1.612594, -3.383014, 1, 0, 0, 1, 1,
-1.713546, -0.5029032, -0.709608, 1, 0, 0, 1, 1,
-1.710566, -0.1786225, -2.262882, 0, 0, 0, 1, 1,
-1.709504, -0.8106464, -1.081027, 0, 0, 0, 1, 1,
-1.705081, -0.8397432, -3.212973, 0, 0, 0, 1, 1,
-1.691322, -0.6318277, -0.729076, 0, 0, 0, 1, 1,
-1.68951, -0.4085365, -3.259476, 0, 0, 0, 1, 1,
-1.688103, 0.3994232, -2.40403, 0, 0, 0, 1, 1,
-1.683393, 0.9734216, -4.379014, 0, 0, 0, 1, 1,
-1.668725, 1.254515, -0.5822574, 1, 1, 1, 1, 1,
-1.658736, 0.7046598, -0.4136113, 1, 1, 1, 1, 1,
-1.651182, -0.8315616, -4.473126, 1, 1, 1, 1, 1,
-1.639089, 0.2059695, -1.043669, 1, 1, 1, 1, 1,
-1.633694, -2.937172, -2.10664, 1, 1, 1, 1, 1,
-1.619495, -1.132468, -3.026231, 1, 1, 1, 1, 1,
-1.61613, -1.333069, -3.091671, 1, 1, 1, 1, 1,
-1.61042, -0.2979298, 0.147548, 1, 1, 1, 1, 1,
-1.60442, -0.2841447, -1.909877, 1, 1, 1, 1, 1,
-1.594464, 0.8319398, -0.5495553, 1, 1, 1, 1, 1,
-1.589845, 0.04930759, -0.9416048, 1, 1, 1, 1, 1,
-1.589501, 0.4148082, 0.02853268, 1, 1, 1, 1, 1,
-1.581062, 1.714521, -2.004327, 1, 1, 1, 1, 1,
-1.580619, 2.259465, -1.121137, 1, 1, 1, 1, 1,
-1.564682, -0.5285023, -1.989437, 1, 1, 1, 1, 1,
-1.561475, 0.8188877, -0.3578595, 0, 0, 1, 1, 1,
-1.559214, 0.4987568, -1.655785, 1, 0, 0, 1, 1,
-1.556266, 0.6841573, -0.3843631, 1, 0, 0, 1, 1,
-1.548693, 0.3315395, -0.4881761, 1, 0, 0, 1, 1,
-1.547457, -0.6404065, -1.008857, 1, 0, 0, 1, 1,
-1.544435, 1.35592, -1.166846, 1, 0, 0, 1, 1,
-1.539235, -0.2760773, 0.1293862, 0, 0, 0, 1, 1,
-1.536154, 1.299521, -0.7196316, 0, 0, 0, 1, 1,
-1.535786, 0.01105937, -2.266185, 0, 0, 0, 1, 1,
-1.533108, 0.1179867, -1.889643, 0, 0, 0, 1, 1,
-1.526819, -1.6079, -1.862114, 0, 0, 0, 1, 1,
-1.524349, -0.2254792, -2.653161, 0, 0, 0, 1, 1,
-1.520623, -0.9069139, -2.123739, 0, 0, 0, 1, 1,
-1.5172, 1.144262, -0.3773355, 1, 1, 1, 1, 1,
-1.509752, 0.008055838, -0.09753115, 1, 1, 1, 1, 1,
-1.509172, 0.2528684, -1.091423, 1, 1, 1, 1, 1,
-1.508501, -1.012531, -1.583864, 1, 1, 1, 1, 1,
-1.503545, 0.6511857, -0.6777604, 1, 1, 1, 1, 1,
-1.486271, -0.4378835, -4.449278, 1, 1, 1, 1, 1,
-1.481394, -0.1235435, -1.324879, 1, 1, 1, 1, 1,
-1.47801, -0.5554099, -1.792562, 1, 1, 1, 1, 1,
-1.473886, -1.392253, -2.985571, 1, 1, 1, 1, 1,
-1.457117, -1.748515, -2.189592, 1, 1, 1, 1, 1,
-1.445392, 0.6024107, -1.450984, 1, 1, 1, 1, 1,
-1.437938, -0.5039383, -3.285717, 1, 1, 1, 1, 1,
-1.437179, 0.8643161, -2.072263, 1, 1, 1, 1, 1,
-1.419836, 1.313474, 0.6940602, 1, 1, 1, 1, 1,
-1.415402, 0.8947932, -0.8508769, 1, 1, 1, 1, 1,
-1.408909, -1.459563, -0.6045731, 0, 0, 1, 1, 1,
-1.408371, -0.2645958, -1.73721, 1, 0, 0, 1, 1,
-1.408198, -0.239442, -1.176029, 1, 0, 0, 1, 1,
-1.405644, 1.670943, -0.08932905, 1, 0, 0, 1, 1,
-1.403644, 0.07898265, -0.9381195, 1, 0, 0, 1, 1,
-1.386987, 0.7940932, -0.2937655, 1, 0, 0, 1, 1,
-1.385936, -1.114735, -1.452397, 0, 0, 0, 1, 1,
-1.384862, 0.03677255, -0.8038435, 0, 0, 0, 1, 1,
-1.384335, -1.398168, -2.609369, 0, 0, 0, 1, 1,
-1.368804, -0.3432558, -1.201913, 0, 0, 0, 1, 1,
-1.366982, 0.55101, -0.5550863, 0, 0, 0, 1, 1,
-1.360851, 0.09696107, -2.459597, 0, 0, 0, 1, 1,
-1.351976, -0.5655122, -2.170073, 0, 0, 0, 1, 1,
-1.345349, 0.4325417, -0.3763678, 1, 1, 1, 1, 1,
-1.343369, -0.4486914, -0.6320936, 1, 1, 1, 1, 1,
-1.334603, 0.2064163, -0.5434246, 1, 1, 1, 1, 1,
-1.332915, -0.856673, -3.292112, 1, 1, 1, 1, 1,
-1.327029, -1.107954, -2.784662, 1, 1, 1, 1, 1,
-1.326677, 0.61327, -0.6615117, 1, 1, 1, 1, 1,
-1.32367, -0.1859608, -1.129603, 1, 1, 1, 1, 1,
-1.30468, 0.6645886, -1.894796, 1, 1, 1, 1, 1,
-1.303322, 0.7126946, -1.95689, 1, 1, 1, 1, 1,
-1.300337, 0.5784284, -1.270457, 1, 1, 1, 1, 1,
-1.29166, -0.6565073, 0.05195479, 1, 1, 1, 1, 1,
-1.273655, -0.7020416, -1.163118, 1, 1, 1, 1, 1,
-1.273039, 0.2326176, -1.530065, 1, 1, 1, 1, 1,
-1.261754, -0.2290981, -1.642432, 1, 1, 1, 1, 1,
-1.250442, 0.3992094, -1.769544, 1, 1, 1, 1, 1,
-1.248834, 0.09996337, -1.625572, 0, 0, 1, 1, 1,
-1.238237, 1.040223, 0.3967982, 1, 0, 0, 1, 1,
-1.232061, -0.6861084, -1.796423, 1, 0, 0, 1, 1,
-1.225298, 1.762648, 0.5995452, 1, 0, 0, 1, 1,
-1.224697, 0.9957351, -0.733235, 1, 0, 0, 1, 1,
-1.22002, -1.000436, -2.774979, 1, 0, 0, 1, 1,
-1.21973, -0.09155053, -0.9701437, 0, 0, 0, 1, 1,
-1.189627, -0.135136, -0.9051169, 0, 0, 0, 1, 1,
-1.174917, -0.6952992, -2.621777, 0, 0, 0, 1, 1,
-1.17194, -0.4868226, -1.047092, 0, 0, 0, 1, 1,
-1.171031, -0.2951822, -2.669789, 0, 0, 0, 1, 1,
-1.170552, -0.6790013, -1.71432, 0, 0, 0, 1, 1,
-1.169699, -0.5786922, -3.936291, 0, 0, 0, 1, 1,
-1.169393, 0.4112326, -1.65494, 1, 1, 1, 1, 1,
-1.166279, -0.3625495, -1.356165, 1, 1, 1, 1, 1,
-1.163506, 1.011177, -0.03697113, 1, 1, 1, 1, 1,
-1.153737, 0.2396521, -0.7034996, 1, 1, 1, 1, 1,
-1.143754, 0.7262958, -2.490523, 1, 1, 1, 1, 1,
-1.139357, 0.06465235, -1.281773, 1, 1, 1, 1, 1,
-1.138884, 0.2212231, -1.639818, 1, 1, 1, 1, 1,
-1.137588, 0.5590327, -1.56341, 1, 1, 1, 1, 1,
-1.132708, 1.638456, -0.434749, 1, 1, 1, 1, 1,
-1.130236, 1.55122, -0.7673951, 1, 1, 1, 1, 1,
-1.13015, -0.4973477, -3.779204, 1, 1, 1, 1, 1,
-1.123111, 0.817089, -3.588191, 1, 1, 1, 1, 1,
-1.116236, -2.553986, -2.683536, 1, 1, 1, 1, 1,
-1.10835, -0.7000058, -1.102938, 1, 1, 1, 1, 1,
-1.105527, -0.9361495, -2.474335, 1, 1, 1, 1, 1,
-1.102782, 0.5434884, -1.454363, 0, 0, 1, 1, 1,
-1.102303, -1.330249, -3.821424, 1, 0, 0, 1, 1,
-1.096269, 1.002262, 0.6825546, 1, 0, 0, 1, 1,
-1.095864, 0.8551152, -0.5921863, 1, 0, 0, 1, 1,
-1.089843, -0.5606741, -2.250109, 1, 0, 0, 1, 1,
-1.089496, -0.4811198, -1.959999, 1, 0, 0, 1, 1,
-1.086194, -0.5429767, -1.192076, 0, 0, 0, 1, 1,
-1.0741, -2.110275, -2.406281, 0, 0, 0, 1, 1,
-1.0655, -1.053459, -3.203935, 0, 0, 0, 1, 1,
-1.059582, -2.034485, -3.491704, 0, 0, 0, 1, 1,
-1.0492, 0.9783843, -2.424661, 0, 0, 0, 1, 1,
-1.044303, 0.01266427, -1.92874, 0, 0, 0, 1, 1,
-1.037901, 0.804653, -1.012, 0, 0, 0, 1, 1,
-1.03101, 2.350548, -1.059261, 1, 1, 1, 1, 1,
-1.030269, -0.8982773, -2.081538, 1, 1, 1, 1, 1,
-1.024419, 0.7553773, -1.156067, 1, 1, 1, 1, 1,
-1.023564, 1.618124, 0.4597329, 1, 1, 1, 1, 1,
-1.020619, 1.284422, -0.3755019, 1, 1, 1, 1, 1,
-1.020202, -0.1371775, -1.800119, 1, 1, 1, 1, 1,
-1.013303, 1.2431, -1.293742, 1, 1, 1, 1, 1,
-1.010033, -0.6041199, -1.51863, 1, 1, 1, 1, 1,
-1.009989, -0.01985545, -3.77056, 1, 1, 1, 1, 1,
-1.002812, -1.415167, -4.359204, 1, 1, 1, 1, 1,
-0.9994824, -0.2745115, -2.194325, 1, 1, 1, 1, 1,
-0.9991874, -0.3463672, -1.999261, 1, 1, 1, 1, 1,
-0.9941952, -0.1731921, -2.378242, 1, 1, 1, 1, 1,
-0.9834158, -0.1428309, -2.130073, 1, 1, 1, 1, 1,
-0.9821925, -1.2287, -2.01769, 1, 1, 1, 1, 1,
-0.9815422, 1.028269, -1.456366, 0, 0, 1, 1, 1,
-0.9788539, -0.9573609, -3.321541, 1, 0, 0, 1, 1,
-0.9756361, 0.3761097, 0.1856985, 1, 0, 0, 1, 1,
-0.9756174, 0.6834992, 0.2376412, 1, 0, 0, 1, 1,
-0.9752533, -0.1368271, -1.294634, 1, 0, 0, 1, 1,
-0.974693, 0.1680146, -2.668521, 1, 0, 0, 1, 1,
-0.9719657, -1.465433, -2.709674, 0, 0, 0, 1, 1,
-0.9687788, 0.02470414, -1.568653, 0, 0, 0, 1, 1,
-0.9617479, -1.3581, -2.143747, 0, 0, 0, 1, 1,
-0.9242538, 0.06938578, -1.834629, 0, 0, 0, 1, 1,
-0.9183136, -0.8659739, -3.974703, 0, 0, 0, 1, 1,
-0.9159723, -0.7228353, -2.97133, 0, 0, 0, 1, 1,
-0.9129145, 0.1682904, -3.283307, 0, 0, 0, 1, 1,
-0.9045787, 0.4155731, -0.7995685, 1, 1, 1, 1, 1,
-0.8909355, 0.6409349, -0.6314316, 1, 1, 1, 1, 1,
-0.8897449, 1.820069, -0.9124627, 1, 1, 1, 1, 1,
-0.8866155, 0.5834159, -2.647412, 1, 1, 1, 1, 1,
-0.8782064, 1.231394, 0.8125562, 1, 1, 1, 1, 1,
-0.8753411, 0.5908014, 0.869971, 1, 1, 1, 1, 1,
-0.8722628, -1.287548, -3.423882, 1, 1, 1, 1, 1,
-0.8697389, -0.01427208, -2.137763, 1, 1, 1, 1, 1,
-0.8679876, -0.5731186, -3.314399, 1, 1, 1, 1, 1,
-0.8653458, 0.1855994, -0.7449358, 1, 1, 1, 1, 1,
-0.8644318, -1.092744, -2.918522, 1, 1, 1, 1, 1,
-0.8567549, -2.951191, -4.348139, 1, 1, 1, 1, 1,
-0.8518217, -1.128984, -2.408925, 1, 1, 1, 1, 1,
-0.8374652, -1.012107, -2.551281, 1, 1, 1, 1, 1,
-0.834973, -0.8137173, -3.335005, 1, 1, 1, 1, 1,
-0.8345013, -2.005034, -3.621739, 0, 0, 1, 1, 1,
-0.8263129, -0.01510962, -3.266176, 1, 0, 0, 1, 1,
-0.8247374, 0.3903306, 0.9158024, 1, 0, 0, 1, 1,
-0.8239782, -0.2144736, -2.332289, 1, 0, 0, 1, 1,
-0.8223453, 0.1965909, 0.1970366, 1, 0, 0, 1, 1,
-0.8165356, -0.1699363, -0.8890391, 1, 0, 0, 1, 1,
-0.8158813, 0.003261892, -0.6490104, 0, 0, 0, 1, 1,
-0.814395, 0.6161892, -0.8853886, 0, 0, 0, 1, 1,
-0.8076879, 0.2146302, -2.212267, 0, 0, 0, 1, 1,
-0.8072085, 0.6983837, -2.109653, 0, 0, 0, 1, 1,
-0.805931, 0.05454014, -0.4069053, 0, 0, 0, 1, 1,
-0.8021914, -0.4514509, -2.024463, 0, 0, 0, 1, 1,
-0.7994828, -1.750874, -2.568605, 0, 0, 0, 1, 1,
-0.7992116, -0.03222107, -0.09621884, 1, 1, 1, 1, 1,
-0.7977443, 1.961966, 0.4074973, 1, 1, 1, 1, 1,
-0.7966816, 0.648906, -0.8892937, 1, 1, 1, 1, 1,
-0.7883017, 0.2573687, -0.5804955, 1, 1, 1, 1, 1,
-0.7870716, -0.9817368, -1.682092, 1, 1, 1, 1, 1,
-0.7862204, -0.1218371, -2.616324, 1, 1, 1, 1, 1,
-0.7855503, 0.4624033, -0.7337451, 1, 1, 1, 1, 1,
-0.7828793, 0.01821493, -2.104013, 1, 1, 1, 1, 1,
-0.7778131, -0.654485, -2.317737, 1, 1, 1, 1, 1,
-0.7755182, -0.05513618, -0.7923732, 1, 1, 1, 1, 1,
-0.7737381, -0.2874772, -1.815201, 1, 1, 1, 1, 1,
-0.7717379, -0.4087562, -1.483576, 1, 1, 1, 1, 1,
-0.7703595, -0.3999989, -0.7849696, 1, 1, 1, 1, 1,
-0.7680011, -0.6203676, -2.772652, 1, 1, 1, 1, 1,
-0.7636675, -0.0124481, -3.017629, 1, 1, 1, 1, 1,
-0.7628968, -1.016166, -3.180315, 0, 0, 1, 1, 1,
-0.7602963, -0.4463359, -1.611577, 1, 0, 0, 1, 1,
-0.7571732, -0.6200204, -4.16898, 1, 0, 0, 1, 1,
-0.7554441, 0.3316934, -0.299657, 1, 0, 0, 1, 1,
-0.753775, 0.3033398, -1.914197, 1, 0, 0, 1, 1,
-0.7523029, -0.297647, -1.250129, 1, 0, 0, 1, 1,
-0.7510632, -0.9467031, -1.438906, 0, 0, 0, 1, 1,
-0.7472704, -1.591563, -3.345228, 0, 0, 0, 1, 1,
-0.7453136, -0.1041323, -0.5476565, 0, 0, 0, 1, 1,
-0.7451558, -0.9223112, -2.651672, 0, 0, 0, 1, 1,
-0.7426807, -0.09252042, -1.451023, 0, 0, 0, 1, 1,
-0.7393649, 0.2341911, -1.06015, 0, 0, 0, 1, 1,
-0.7367157, -0.7822345, -2.819067, 0, 0, 0, 1, 1,
-0.7359288, 1.290878, -0.390777, 1, 1, 1, 1, 1,
-0.7341827, -1.511228, -2.712397, 1, 1, 1, 1, 1,
-0.7306382, -0.7093018, -3.006903, 1, 1, 1, 1, 1,
-0.7288274, -0.4076828, -1.604277, 1, 1, 1, 1, 1,
-0.7261638, -0.7029662, -3.177854, 1, 1, 1, 1, 1,
-0.7172998, -1.040843, -2.837602, 1, 1, 1, 1, 1,
-0.7094799, -0.2176354, -2.975048, 1, 1, 1, 1, 1,
-0.7029501, 0.9109256, 0.8882944, 1, 1, 1, 1, 1,
-0.6982398, -0.4348741, -3.434717, 1, 1, 1, 1, 1,
-0.6942226, -0.9795748, -1.605344, 1, 1, 1, 1, 1,
-0.6934932, -0.109558, -1.356205, 1, 1, 1, 1, 1,
-0.6908067, -0.1757158, -2.30124, 1, 1, 1, 1, 1,
-0.6907069, 0.7199756, -0.412277, 1, 1, 1, 1, 1,
-0.6832618, -1.575013, -1.328262, 1, 1, 1, 1, 1,
-0.6829485, -1.76686, -3.065542, 1, 1, 1, 1, 1,
-0.6771547, -0.6130801, -2.27736, 0, 0, 1, 1, 1,
-0.6683927, -1.5486, -2.039606, 1, 0, 0, 1, 1,
-0.6506023, 0.6215671, -2.626661, 1, 0, 0, 1, 1,
-0.6495237, -1.248988, -2.254106, 1, 0, 0, 1, 1,
-0.6486459, 0.5464513, 0.002038998, 1, 0, 0, 1, 1,
-0.6437697, -0.5278233, -0.7282511, 1, 0, 0, 1, 1,
-0.6313699, -0.7613467, -1.482215, 0, 0, 0, 1, 1,
-0.630353, 0.3120974, -0.3076721, 0, 0, 0, 1, 1,
-0.6285072, -0.8585914, -0.4873672, 0, 0, 0, 1, 1,
-0.6279088, 0.3502945, -0.3626228, 0, 0, 0, 1, 1,
-0.6278043, 0.2414745, -2.289467, 0, 0, 0, 1, 1,
-0.6277426, -0.3476794, -1.759421, 0, 0, 0, 1, 1,
-0.6204249, 0.8758093, -0.4256002, 0, 0, 0, 1, 1,
-0.6176615, -2.036983, -3.163752, 1, 1, 1, 1, 1,
-0.6169176, 0.8293832, -1.030441, 1, 1, 1, 1, 1,
-0.6106415, -0.2408488, -2.326849, 1, 1, 1, 1, 1,
-0.6090518, -0.1211236, -2.762153, 1, 1, 1, 1, 1,
-0.6000203, -0.08039815, -1.07339, 1, 1, 1, 1, 1,
-0.5987545, 0.2339555, -0.5702042, 1, 1, 1, 1, 1,
-0.5921189, -1.254601, -1.979065, 1, 1, 1, 1, 1,
-0.5913287, 0.07363763, -2.308755, 1, 1, 1, 1, 1,
-0.5879852, 1.631797, 1.251561, 1, 1, 1, 1, 1,
-0.585251, 0.6070836, -0.2770747, 1, 1, 1, 1, 1,
-0.5820436, 0.5438356, -2.699895, 1, 1, 1, 1, 1,
-0.5803751, 0.7675765, 1.673472, 1, 1, 1, 1, 1,
-0.5759458, 0.1583344, 0.04635737, 1, 1, 1, 1, 1,
-0.5737212, -0.1851385, -1.146224, 1, 1, 1, 1, 1,
-0.5697924, -0.1915966, -2.318202, 1, 1, 1, 1, 1,
-0.5665185, -1.589534, -4.88226, 0, 0, 1, 1, 1,
-0.561344, 0.1224749, -3.704391, 1, 0, 0, 1, 1,
-0.5581527, 0.8813241, -0.9593005, 1, 0, 0, 1, 1,
-0.5580817, -0.06238635, -1.866948, 1, 0, 0, 1, 1,
-0.5577665, -0.9577804, -3.245065, 1, 0, 0, 1, 1,
-0.5572045, 1.114734, 0.1665626, 1, 0, 0, 1, 1,
-0.5533036, 0.2313564, -1.047188, 0, 0, 0, 1, 1,
-0.5497516, -0.2333535, -2.465303, 0, 0, 0, 1, 1,
-0.5416483, -1.685678, -1.988964, 0, 0, 0, 1, 1,
-0.5374245, 0.9264431, -0.3599471, 0, 0, 0, 1, 1,
-0.5371283, -0.08635866, -0.4341878, 0, 0, 0, 1, 1,
-0.5340126, -0.7443802, -3.282279, 0, 0, 0, 1, 1,
-0.5326679, 0.1136567, -0.3586751, 0, 0, 0, 1, 1,
-0.5230883, 0.772692, 0.03152568, 1, 1, 1, 1, 1,
-0.5218189, 0.1439356, -1.304843, 1, 1, 1, 1, 1,
-0.5213995, 0.07373733, -1.505961, 1, 1, 1, 1, 1,
-0.51869, -1.514808, -2.601369, 1, 1, 1, 1, 1,
-0.5186086, 0.09099071, -0.3136783, 1, 1, 1, 1, 1,
-0.5132312, 0.6542612, -2.11349, 1, 1, 1, 1, 1,
-0.5124705, -0.6855419, -0.997638, 1, 1, 1, 1, 1,
-0.5113416, 1.271191, -1.716356, 1, 1, 1, 1, 1,
-0.5107762, 0.6813216, -1.247834, 1, 1, 1, 1, 1,
-0.5101624, -0.6563236, -1.164275, 1, 1, 1, 1, 1,
-0.5065654, 0.8744096, -2.122517, 1, 1, 1, 1, 1,
-0.4996538, -1.386188, -2.653153, 1, 1, 1, 1, 1,
-0.4986867, -1.228094, -2.288242, 1, 1, 1, 1, 1,
-0.4974248, 0.005322636, -1.738795, 1, 1, 1, 1, 1,
-0.4927352, -0.2287066, -2.375859, 1, 1, 1, 1, 1,
-0.4866889, -1.402598, -2.454985, 0, 0, 1, 1, 1,
-0.4830582, -0.4242444, -1.537197, 1, 0, 0, 1, 1,
-0.4822757, 0.6341819, -2.477641, 1, 0, 0, 1, 1,
-0.4808703, -0.2417414, -2.228644, 1, 0, 0, 1, 1,
-0.480631, -0.299114, -2.310646, 1, 0, 0, 1, 1,
-0.4794404, 3.23215, 0.2861146, 1, 0, 0, 1, 1,
-0.4771363, -1.458425, -3.026647, 0, 0, 0, 1, 1,
-0.4747624, -1.129916, -1.349305, 0, 0, 0, 1, 1,
-0.4716076, 0.01635103, -1.192892, 0, 0, 0, 1, 1,
-0.4704083, 0.6318321, -0.5871224, 0, 0, 0, 1, 1,
-0.4696935, 0.1074285, -0.8532759, 0, 0, 0, 1, 1,
-0.4690522, -0.0791755, -0.2143836, 0, 0, 0, 1, 1,
-0.4660726, -0.08754401, -1.141972, 0, 0, 0, 1, 1,
-0.4659571, -1.183315, -4.464777, 1, 1, 1, 1, 1,
-0.465231, 0.8678069, 0.5888366, 1, 1, 1, 1, 1,
-0.4649011, 0.2184065, -1.104966, 1, 1, 1, 1, 1,
-0.4621754, -0.06386764, -1.228651, 1, 1, 1, 1, 1,
-0.4620391, 0.2570813, -0.4910147, 1, 1, 1, 1, 1,
-0.4599761, -1.442235, -3.117759, 1, 1, 1, 1, 1,
-0.4572353, 1.581803, 0.01895208, 1, 1, 1, 1, 1,
-0.4535649, 1.400208, -0.6275598, 1, 1, 1, 1, 1,
-0.4535443, -1.097807, -2.370228, 1, 1, 1, 1, 1,
-0.4466977, 0.1986506, -0.4662473, 1, 1, 1, 1, 1,
-0.4464844, -1.933595, -3.009597, 1, 1, 1, 1, 1,
-0.4444523, -2.015718, -2.490509, 1, 1, 1, 1, 1,
-0.4320928, -1.343804, -3.704512, 1, 1, 1, 1, 1,
-0.4295415, -0.8920397, -3.736415, 1, 1, 1, 1, 1,
-0.4243404, -0.1285184, -0.2649496, 1, 1, 1, 1, 1,
-0.4236041, 0.5843266, -1.818119, 0, 0, 1, 1, 1,
-0.4220116, -1.184151, -3.594955, 1, 0, 0, 1, 1,
-0.4213874, 0.5644898, -3.810923, 1, 0, 0, 1, 1,
-0.4193277, -1.436627, -2.734527, 1, 0, 0, 1, 1,
-0.4154408, -0.1937235, -2.278534, 1, 0, 0, 1, 1,
-0.4148231, 1.135368, -1.519478, 1, 0, 0, 1, 1,
-0.4130312, -0.9407481, -1.139361, 0, 0, 0, 1, 1,
-0.4116906, -0.2501693, -3.417368, 0, 0, 0, 1, 1,
-0.410819, 0.4455615, -0.3533408, 0, 0, 0, 1, 1,
-0.4098259, 1.212507, -1.606705, 0, 0, 0, 1, 1,
-0.3975661, 0.8863004, -0.796192, 0, 0, 0, 1, 1,
-0.3926587, 2.151882, 0.4042716, 0, 0, 0, 1, 1,
-0.3925976, -1.147747, -3.859672, 0, 0, 0, 1, 1,
-0.3912437, 0.9244002, 0.8669145, 1, 1, 1, 1, 1,
-0.3897742, -0.9643772, -1.9784, 1, 1, 1, 1, 1,
-0.3889022, 0.5371921, -2.195939, 1, 1, 1, 1, 1,
-0.3887264, -0.07854515, -2.399301, 1, 1, 1, 1, 1,
-0.3884865, -0.3628622, -2.225176, 1, 1, 1, 1, 1,
-0.3850479, 0.7241805, -0.8994758, 1, 1, 1, 1, 1,
-0.3808839, 1.7763, -0.1867012, 1, 1, 1, 1, 1,
-0.3796453, -0.9546229, -3.541726, 1, 1, 1, 1, 1,
-0.3790916, 0.5797471, 0.04015723, 1, 1, 1, 1, 1,
-0.3785324, -1.016823, -3.17012, 1, 1, 1, 1, 1,
-0.376832, 0.2666005, -0.8220481, 1, 1, 1, 1, 1,
-0.3768282, 0.1261389, -0.8760163, 1, 1, 1, 1, 1,
-0.3642108, -0.04502605, -0.2147246, 1, 1, 1, 1, 1,
-0.3567338, -0.8312541, -1.872398, 1, 1, 1, 1, 1,
-0.3507962, -1.179142, -1.766655, 1, 1, 1, 1, 1,
-0.3492682, 0.7370815, 0.4924166, 0, 0, 1, 1, 1,
-0.3440247, 0.6922579, 1.158725, 1, 0, 0, 1, 1,
-0.3430519, 0.7321868, -1.32178, 1, 0, 0, 1, 1,
-0.3320574, -1.197273, -5.523882, 1, 0, 0, 1, 1,
-0.3307505, -0.428543, -1.54907, 1, 0, 0, 1, 1,
-0.3304262, -0.8987968, -1.957727, 1, 0, 0, 1, 1,
-0.3278133, -1.008281, -2.792341, 0, 0, 0, 1, 1,
-0.3276755, 1.301927, -0.3097661, 0, 0, 0, 1, 1,
-0.3225671, -0.2118298, -0.06562768, 0, 0, 0, 1, 1,
-0.3224286, 0.1899881, -0.6054482, 0, 0, 0, 1, 1,
-0.3203104, 0.8996397, -0.7285835, 0, 0, 0, 1, 1,
-0.3202983, -0.469478, -4.290075, 0, 0, 0, 1, 1,
-0.3186828, 1.05838, -0.6989142, 0, 0, 0, 1, 1,
-0.3158057, -0.259903, -2.100205, 1, 1, 1, 1, 1,
-0.3148203, -0.9111799, -2.785235, 1, 1, 1, 1, 1,
-0.3115562, -2.419773, -2.415078, 1, 1, 1, 1, 1,
-0.3076645, 0.6572909, 0.7620762, 1, 1, 1, 1, 1,
-0.3075384, -0.6363565, -1.657337, 1, 1, 1, 1, 1,
-0.3056753, 0.7553584, 1.105557, 1, 1, 1, 1, 1,
-0.3053274, 0.9060504, 0.5401331, 1, 1, 1, 1, 1,
-0.3044002, -0.5598963, -4.075278, 1, 1, 1, 1, 1,
-0.3022397, -0.1358847, -0.8274723, 1, 1, 1, 1, 1,
-0.3020485, -0.4115635, -2.910781, 1, 1, 1, 1, 1,
-0.2958429, -1.50588, -1.092912, 1, 1, 1, 1, 1,
-0.2876238, 0.7046119, -0.7845605, 1, 1, 1, 1, 1,
-0.2830549, 0.571991, -0.2189319, 1, 1, 1, 1, 1,
-0.2795446, -1.786312, -4.074917, 1, 1, 1, 1, 1,
-0.2792675, -1.48177, -3.356586, 1, 1, 1, 1, 1,
-0.2690035, 0.264519, -0.8375336, 0, 0, 1, 1, 1,
-0.2670093, 0.5346215, -1.449183, 1, 0, 0, 1, 1,
-0.2642701, 0.218078, 0.4027131, 1, 0, 0, 1, 1,
-0.260812, -0.7661265, -3.408677, 1, 0, 0, 1, 1,
-0.2597041, 1.48976, 1.881295, 1, 0, 0, 1, 1,
-0.253729, -0.3824809, -1.049857, 1, 0, 0, 1, 1,
-0.2528779, -1.151205, -2.556643, 0, 0, 0, 1, 1,
-0.2502962, 1.198615, -0.2128462, 0, 0, 0, 1, 1,
-0.2479879, -2.794456, -4.480279, 0, 0, 0, 1, 1,
-0.2452434, -0.6390338, -3.734654, 0, 0, 0, 1, 1,
-0.2439735, 0.4471956, 0.6218929, 0, 0, 0, 1, 1,
-0.2430771, 3.160197, 0.2081049, 0, 0, 0, 1, 1,
-0.2371282, 0.0494406, -2.346898, 0, 0, 0, 1, 1,
-0.2338503, -0.06104019, -2.561704, 1, 1, 1, 1, 1,
-0.2333613, 0.001729887, -1.329567, 1, 1, 1, 1, 1,
-0.2331608, -0.1570434, -2.068178, 1, 1, 1, 1, 1,
-0.2320859, 0.6586379, 0.682215, 1, 1, 1, 1, 1,
-0.2253378, 0.6461105, -2.312939, 1, 1, 1, 1, 1,
-0.2214317, 1.027867, 0.335912, 1, 1, 1, 1, 1,
-0.2211463, 0.190041, -0.6318288, 1, 1, 1, 1, 1,
-0.2183456, 0.1388175, -0.8991401, 1, 1, 1, 1, 1,
-0.2111635, -1.01656, -2.755444, 1, 1, 1, 1, 1,
-0.2091845, 1.095195, 0.5881958, 1, 1, 1, 1, 1,
-0.2063274, -0.5539709, -2.302438, 1, 1, 1, 1, 1,
-0.2027161, -1.344964, -3.317914, 1, 1, 1, 1, 1,
-0.1997658, 1.28698, -0.4554289, 1, 1, 1, 1, 1,
-0.1981119, 0.1854498, -0.1807166, 1, 1, 1, 1, 1,
-0.1952426, -2.30153, -4.982058, 1, 1, 1, 1, 1,
-0.1926989, -0.6264272, -2.262493, 0, 0, 1, 1, 1,
-0.1924273, -0.7591896, -3.058405, 1, 0, 0, 1, 1,
-0.1870118, 1.286969, -1.782534, 1, 0, 0, 1, 1,
-0.1861823, 0.8245481, -1.309293, 1, 0, 0, 1, 1,
-0.181634, -0.6441535, -2.538684, 1, 0, 0, 1, 1,
-0.1757773, -0.6507129, -2.690767, 1, 0, 0, 1, 1,
-0.1685729, 0.5699004, 0.2744644, 0, 0, 0, 1, 1,
-0.1650738, -2.74579, -2.479999, 0, 0, 0, 1, 1,
-0.1640699, 1.45823, -0.5253917, 0, 0, 0, 1, 1,
-0.1625564, -0.2075832, -2.494771, 0, 0, 0, 1, 1,
-0.1620276, 2.05543, -1.124818, 0, 0, 0, 1, 1,
-0.1600721, 0.3415991, -1.386667, 0, 0, 0, 1, 1,
-0.1553824, 0.455412, 1.248206, 0, 0, 0, 1, 1,
-0.1534073, 2.008529, 1.076287, 1, 1, 1, 1, 1,
-0.1486471, -1.813314, -3.731866, 1, 1, 1, 1, 1,
-0.1445396, -0.7013355, -2.071208, 1, 1, 1, 1, 1,
-0.1388039, -0.5518767, -5.01311, 1, 1, 1, 1, 1,
-0.1372419, 0.8564161, 0.5708681, 1, 1, 1, 1, 1,
-0.1366762, 1.345466, 1.146958, 1, 1, 1, 1, 1,
-0.1366271, 1.111849, -0.2899938, 1, 1, 1, 1, 1,
-0.1366004, 0.2975509, 0.09830923, 1, 1, 1, 1, 1,
-0.1363004, 1.227973, 0.5753593, 1, 1, 1, 1, 1,
-0.1331094, -1.715753, -2.529324, 1, 1, 1, 1, 1,
-0.1328033, 0.0619765, -2.450077, 1, 1, 1, 1, 1,
-0.1303442, 0.2991542, -1.899564, 1, 1, 1, 1, 1,
-0.1280673, 1.426221, -0.3483851, 1, 1, 1, 1, 1,
-0.128011, 0.8907542, 0.3034549, 1, 1, 1, 1, 1,
-0.1259683, -1.031649, -2.589187, 1, 1, 1, 1, 1,
-0.1255694, 1.409015, -0.3068231, 0, 0, 1, 1, 1,
-0.125363, 0.1493783, 0.9657436, 1, 0, 0, 1, 1,
-0.1240195, 1.023425, -0.4253617, 1, 0, 0, 1, 1,
-0.1217089, 0.4122882, -2.629099, 1, 0, 0, 1, 1,
-0.1213664, -0.1905973, -2.120672, 1, 0, 0, 1, 1,
-0.1200403, 1.620798, -0.789328, 1, 0, 0, 1, 1,
-0.1184177, 0.09021761, -1.230321, 0, 0, 0, 1, 1,
-0.1106867, 0.1519543, -0.1891391, 0, 0, 0, 1, 1,
-0.109563, -1.266151, -3.330099, 0, 0, 0, 1, 1,
-0.1090974, -0.9462531, -1.684654, 0, 0, 0, 1, 1,
-0.1030388, -1.433657, -3.062204, 0, 0, 0, 1, 1,
-0.1018672, -0.7266234, -1.343102, 0, 0, 0, 1, 1,
-0.09650053, 0.8980833, -0.2835565, 0, 0, 0, 1, 1,
-0.09429388, -0.5357006, -2.020144, 1, 1, 1, 1, 1,
-0.09426703, 0.006400291, -1.844718, 1, 1, 1, 1, 1,
-0.09239934, -0.2449625, -1.619668, 1, 1, 1, 1, 1,
-0.09227562, -1.391045, -1.694784, 1, 1, 1, 1, 1,
-0.08964679, -1.677889, -2.334314, 1, 1, 1, 1, 1,
-0.08754838, 0.1239688, 0.4800866, 1, 1, 1, 1, 1,
-0.08490752, -0.294667, -4.206551, 1, 1, 1, 1, 1,
-0.08098222, 0.8237906, 0.2743834, 1, 1, 1, 1, 1,
-0.07923497, 0.007912041, -0.8698657, 1, 1, 1, 1, 1,
-0.07780407, 0.3045844, -1.97968, 1, 1, 1, 1, 1,
-0.07539352, -0.5121137, -2.189567, 1, 1, 1, 1, 1,
-0.07489272, -0.1914442, -3.367744, 1, 1, 1, 1, 1,
-0.07451082, 0.9856309, 0.4782239, 1, 1, 1, 1, 1,
-0.0742167, 0.7455665, -0.4777229, 1, 1, 1, 1, 1,
-0.06935587, 0.4094766, 1.106537, 1, 1, 1, 1, 1,
-0.06848311, 0.09018519, -0.8815157, 0, 0, 1, 1, 1,
-0.06612846, 0.5554202, -0.5575756, 1, 0, 0, 1, 1,
-0.06580472, 0.01134055, -3.375657, 1, 0, 0, 1, 1,
-0.0626738, 1.685991, 0.6383987, 1, 0, 0, 1, 1,
-0.06115925, -1.7352, -5.702056, 1, 0, 0, 1, 1,
-0.05817088, 0.5403117, -0.7345057, 1, 0, 0, 1, 1,
-0.05815718, 0.008680272, -0.8172598, 0, 0, 0, 1, 1,
-0.05748655, 0.8176627, 0.774635, 0, 0, 0, 1, 1,
-0.05665401, -0.7813178, -2.891107, 0, 0, 0, 1, 1,
-0.05569267, 0.3147528, -1.360108, 0, 0, 0, 1, 1,
-0.05479504, -1.10309, -5.29288, 0, 0, 0, 1, 1,
-0.04876635, -0.6279688, -1.970884, 0, 0, 0, 1, 1,
-0.04563678, -0.6290463, -2.859607, 0, 0, 0, 1, 1,
-0.04486749, -1.688754, -4.655089, 1, 1, 1, 1, 1,
-0.04212612, 0.9830661, -2.941021, 1, 1, 1, 1, 1,
-0.04135187, 1.224114, -0.3108855, 1, 1, 1, 1, 1,
-0.04057248, 0.3669714, -0.2368478, 1, 1, 1, 1, 1,
-0.04039917, 0.1898109, -0.8049319, 1, 1, 1, 1, 1,
-0.03868333, -1.677809, -3.303533, 1, 1, 1, 1, 1,
-0.02331149, 0.4007744, -0.5626678, 1, 1, 1, 1, 1,
-0.02319826, -0.2142745, -2.335711, 1, 1, 1, 1, 1,
-0.0207202, 0.1501704, 0.8545949, 1, 1, 1, 1, 1,
-0.02017661, 0.07606863, -0.9225919, 1, 1, 1, 1, 1,
-0.02012639, -0.9891863, -3.628072, 1, 1, 1, 1, 1,
-0.01633926, -0.6109503, -1.83043, 1, 1, 1, 1, 1,
-0.0157535, -0.3765672, -2.920203, 1, 1, 1, 1, 1,
-0.01449188, -0.3162889, -3.798664, 1, 1, 1, 1, 1,
-0.008364615, 0.08670548, -0.970735, 1, 1, 1, 1, 1,
-0.006805263, -0.1885872, -5.628356, 0, 0, 1, 1, 1,
-0.00576916, -2.13311, -1.850057, 1, 0, 0, 1, 1,
-0.00408827, 1.052297, 0.9609216, 1, 0, 0, 1, 1,
-0.002257449, -0.3141508, -1.142232, 1, 0, 0, 1, 1,
-0.0008546447, 0.6400564, -0.5668799, 1, 0, 0, 1, 1,
0.01362396, 1.919165, 0.2258705, 1, 0, 0, 1, 1,
0.0197438, -0.3992001, 1.772006, 0, 0, 0, 1, 1,
0.02080986, -1.085666, 2.992258, 0, 0, 0, 1, 1,
0.02628947, -1.17876, 2.373718, 0, 0, 0, 1, 1,
0.02917198, -0.8383495, 1.878978, 0, 0, 0, 1, 1,
0.02920855, 0.5301047, 0.3520861, 0, 0, 0, 1, 1,
0.03098091, 0.341011, 1.714202, 0, 0, 0, 1, 1,
0.03139146, -0.2163508, 3.820839, 0, 0, 0, 1, 1,
0.03372263, 2.007761, -1.46582, 1, 1, 1, 1, 1,
0.03621468, 0.01537058, 2.142937, 1, 1, 1, 1, 1,
0.03793928, -0.2340645, 1.784424, 1, 1, 1, 1, 1,
0.0394582, -1.409439, 2.9048, 1, 1, 1, 1, 1,
0.04048044, -0.7755681, 1.914307, 1, 1, 1, 1, 1,
0.04700191, -0.5250537, 4.065135, 1, 1, 1, 1, 1,
0.04781833, 0.2472039, -1.830814, 1, 1, 1, 1, 1,
0.04820656, -0.9618702, 4.533511, 1, 1, 1, 1, 1,
0.0483043, -0.2385842, 2.451817, 1, 1, 1, 1, 1,
0.05397073, 2.043207, -0.7795395, 1, 1, 1, 1, 1,
0.0566036, 1.306466, 1.305611, 1, 1, 1, 1, 1,
0.05901258, 0.6825836, 1.002162, 1, 1, 1, 1, 1,
0.05989499, 1.274548, 0.8926999, 1, 1, 1, 1, 1,
0.06130072, -0.1567431, 2.730416, 1, 1, 1, 1, 1,
0.0625413, -0.2744036, 2.241047, 1, 1, 1, 1, 1,
0.06405023, -0.2450392, 2.973457, 0, 0, 1, 1, 1,
0.06890235, 1.014803, -1.169941, 1, 0, 0, 1, 1,
0.07910855, -0.5830255, 1.477824, 1, 0, 0, 1, 1,
0.08116549, -1.167123, 1.642439, 1, 0, 0, 1, 1,
0.08128664, -1.31011, 1.798296, 1, 0, 0, 1, 1,
0.08143128, -0.3081909, 2.152888, 1, 0, 0, 1, 1,
0.08690612, 0.2812389, -1.213697, 0, 0, 0, 1, 1,
0.09058471, 0.8544745, 0.6313784, 0, 0, 0, 1, 1,
0.09190899, -0.5737487, 2.444076, 0, 0, 0, 1, 1,
0.09432993, -0.4577641, 2.118131, 0, 0, 0, 1, 1,
0.09433428, -0.2643726, 3.310032, 0, 0, 0, 1, 1,
0.09443025, -1.229706, 2.935205, 0, 0, 0, 1, 1,
0.09635682, -0.04241797, 3.338822, 0, 0, 0, 1, 1,
0.09725709, 1.091832, 1.70547, 1, 1, 1, 1, 1,
0.09850306, -0.9142969, 2.563045, 1, 1, 1, 1, 1,
0.1016805, -0.8322175, 3.831281, 1, 1, 1, 1, 1,
0.1037196, 0.1423092, 1.410107, 1, 1, 1, 1, 1,
0.1053113, 0.6508599, -0.4460386, 1, 1, 1, 1, 1,
0.1085378, -1.201006, 4.123819, 1, 1, 1, 1, 1,
0.1097062, 0.4849636, 1.956182, 1, 1, 1, 1, 1,
0.1125305, 0.2978448, 0.5534408, 1, 1, 1, 1, 1,
0.1171329, -0.137425, 3.199749, 1, 1, 1, 1, 1,
0.1188684, -0.4432976, 1.501855, 1, 1, 1, 1, 1,
0.1209576, -1.105125, 4.551296, 1, 1, 1, 1, 1,
0.1217647, 1.502627, 0.2723145, 1, 1, 1, 1, 1,
0.1281133, -0.8582153, 2.79879, 1, 1, 1, 1, 1,
0.1289812, -0.3924646, 3.074674, 1, 1, 1, 1, 1,
0.1359238, 0.6559618, -0.3827319, 1, 1, 1, 1, 1,
0.1386386, 0.3478187, 1.052771, 0, 0, 1, 1, 1,
0.1417759, -0.1093932, 2.451728, 1, 0, 0, 1, 1,
0.1418126, 1.711753, 0.6172558, 1, 0, 0, 1, 1,
0.1431827, -0.3103681, 2.475024, 1, 0, 0, 1, 1,
0.1442046, 0.9345823, 0.4524145, 1, 0, 0, 1, 1,
0.1454927, -0.6408788, 1.113571, 1, 0, 0, 1, 1,
0.1528691, -0.6769857, 3.244078, 0, 0, 0, 1, 1,
0.1539, 0.883303, 1.224439, 0, 0, 0, 1, 1,
0.15985, -0.35385, 3.319601, 0, 0, 0, 1, 1,
0.1615224, -1.091362, 2.80026, 0, 0, 0, 1, 1,
0.1662131, 2.202778, 0.1218427, 0, 0, 0, 1, 1,
0.1670138, 0.3270929, 0.9115398, 0, 0, 0, 1, 1,
0.1670257, 0.6748355, -0.3217663, 0, 0, 0, 1, 1,
0.1695784, 0.06418331, 0.7804364, 1, 1, 1, 1, 1,
0.171095, 0.8566324, -0.2057728, 1, 1, 1, 1, 1,
0.1724253, 0.5676473, 0.8216358, 1, 1, 1, 1, 1,
0.1831186, -0.5036508, 2.244029, 1, 1, 1, 1, 1,
0.1862337, -0.243866, 1.987285, 1, 1, 1, 1, 1,
0.1937012, 0.09191207, 1.364449, 1, 1, 1, 1, 1,
0.1956408, -0.9707716, 3.227181, 1, 1, 1, 1, 1,
0.2005657, -0.805969, 1.402664, 1, 1, 1, 1, 1,
0.2032095, -0.2146465, 1.9134, 1, 1, 1, 1, 1,
0.2038998, -1.9602, 5.007763, 1, 1, 1, 1, 1,
0.2075071, -1.397551, 1.984063, 1, 1, 1, 1, 1,
0.2092198, 2.225437, 0.01305599, 1, 1, 1, 1, 1,
0.211693, 0.4626307, 1.165349, 1, 1, 1, 1, 1,
0.2138718, 0.2038827, 1.363359, 1, 1, 1, 1, 1,
0.2184083, -0.05292513, -0.09572545, 1, 1, 1, 1, 1,
0.2203797, -1.090349, 3.305767, 0, 0, 1, 1, 1,
0.2213034, -1.99795, 3.016966, 1, 0, 0, 1, 1,
0.2250427, 0.8243912, 1.332922, 1, 0, 0, 1, 1,
0.231532, 0.6846991, -0.3605139, 1, 0, 0, 1, 1,
0.2318558, 0.07573897, -1.534249, 1, 0, 0, 1, 1,
0.2320024, -0.111608, 3.345198, 1, 0, 0, 1, 1,
0.2391604, -1.279342, 2.028293, 0, 0, 0, 1, 1,
0.2391753, -1.316435, 5.003087, 0, 0, 0, 1, 1,
0.2424332, -0.759554, 2.266202, 0, 0, 0, 1, 1,
0.2482913, -1.216024, 3.06202, 0, 0, 0, 1, 1,
0.2521214, 0.3876025, 1.218449, 0, 0, 0, 1, 1,
0.2522838, -2.021477, 3.373244, 0, 0, 0, 1, 1,
0.2566948, -1.315642, 3.353926, 0, 0, 0, 1, 1,
0.258265, -0.8857018, 1.307065, 1, 1, 1, 1, 1,
0.2585701, 1.736975, -0.4411767, 1, 1, 1, 1, 1,
0.2593596, 1.409646, -0.6054376, 1, 1, 1, 1, 1,
0.2605077, 0.3819565, 0.778626, 1, 1, 1, 1, 1,
0.2634278, 0.8181339, -0.6231251, 1, 1, 1, 1, 1,
0.2648032, 0.4256497, 3.003009, 1, 1, 1, 1, 1,
0.2652609, -0.2094303, 2.950828, 1, 1, 1, 1, 1,
0.2652628, -0.1008929, 1.274774, 1, 1, 1, 1, 1,
0.2661213, 0.9526743, 0.1155772, 1, 1, 1, 1, 1,
0.2699378, 1.666198, 0.4552062, 1, 1, 1, 1, 1,
0.2769633, 0.7353051, -0.1947376, 1, 1, 1, 1, 1,
0.2779536, 0.05034473, 1.387871, 1, 1, 1, 1, 1,
0.2790106, -1.723122, 3.685861, 1, 1, 1, 1, 1,
0.2855319, -0.6209895, 3.60097, 1, 1, 1, 1, 1,
0.287164, 0.8653083, 0.6764082, 1, 1, 1, 1, 1,
0.2900861, -0.2991367, 1.70111, 0, 0, 1, 1, 1,
0.2922257, -0.3285832, 3.642949, 1, 0, 0, 1, 1,
0.2953479, 0.07010782, 1.249461, 1, 0, 0, 1, 1,
0.2956519, 1.833503, -0.09544208, 1, 0, 0, 1, 1,
0.2967224, -1.392013, 3.165615, 1, 0, 0, 1, 1,
0.2990783, -0.05235135, 1.923826, 1, 0, 0, 1, 1,
0.3094308, -2.484345, 1.962878, 0, 0, 0, 1, 1,
0.3136272, 1.293323, -0.4447472, 0, 0, 0, 1, 1,
0.3176294, 0.6209968, 1.502755, 0, 0, 0, 1, 1,
0.322376, 0.9212614, -0.161984, 0, 0, 0, 1, 1,
0.3226991, 0.09148454, -0.3698176, 0, 0, 0, 1, 1,
0.323825, 1.672237, -0.4083301, 0, 0, 0, 1, 1,
0.3252758, -1.232956, 2.660748, 0, 0, 0, 1, 1,
0.334246, -0.9299973, 1.725717, 1, 1, 1, 1, 1,
0.3346207, -0.6310782, 1.602089, 1, 1, 1, 1, 1,
0.335751, -1.527602, 2.342122, 1, 1, 1, 1, 1,
0.337348, 0.5272763, 1.018437, 1, 1, 1, 1, 1,
0.3375963, -1.381625, 4.097023, 1, 1, 1, 1, 1,
0.3422474, 0.1310879, 0.4232782, 1, 1, 1, 1, 1,
0.3433565, 0.673256, 1.004366, 1, 1, 1, 1, 1,
0.3448959, -0.2777932, 1.779383, 1, 1, 1, 1, 1,
0.3450351, -0.2722306, 1.486253, 1, 1, 1, 1, 1,
0.3453642, 2.183767, 0.03953687, 1, 1, 1, 1, 1,
0.3467173, -0.300161, 1.486988, 1, 1, 1, 1, 1,
0.3469221, 0.1630249, -0.01168785, 1, 1, 1, 1, 1,
0.3559507, 0.6348059, -1.379386, 1, 1, 1, 1, 1,
0.3593092, -0.08045159, 2.94045, 1, 1, 1, 1, 1,
0.360716, -0.3297759, 1.940415, 1, 1, 1, 1, 1,
0.3609918, 0.5273895, 0.8940158, 0, 0, 1, 1, 1,
0.3711653, 0.1297781, 2.26136, 1, 0, 0, 1, 1,
0.3733097, 0.6383062, 0.2505159, 1, 0, 0, 1, 1,
0.3800764, 0.4421683, 1.300406, 1, 0, 0, 1, 1,
0.3811435, 0.5261353, 0.2924196, 1, 0, 0, 1, 1,
0.3872719, 0.6569013, 0.9138939, 1, 0, 0, 1, 1,
0.3880885, -0.6942469, 2.165651, 0, 0, 0, 1, 1,
0.3881645, 0.8648487, 1.682003, 0, 0, 0, 1, 1,
0.3905097, 0.4889815, 0.6790743, 0, 0, 0, 1, 1,
0.3914991, -0.961816, 2.481072, 0, 0, 0, 1, 1,
0.3920638, 1.058469, 1.622476, 0, 0, 0, 1, 1,
0.3934408, 0.1432887, 1.464774, 0, 0, 0, 1, 1,
0.3935837, 0.02824387, 0.9565943, 0, 0, 0, 1, 1,
0.393943, 0.06548928, 1.470745, 1, 1, 1, 1, 1,
0.3959058, 1.823798, 1.199234, 1, 1, 1, 1, 1,
0.4023632, -1.274969, 3.205513, 1, 1, 1, 1, 1,
0.4073195, 0.0920653, 3.370508, 1, 1, 1, 1, 1,
0.4124743, -0.8378874, 3.190778, 1, 1, 1, 1, 1,
0.4209413, -1.404737, 4.059078, 1, 1, 1, 1, 1,
0.423635, -0.2200732, 1.987309, 1, 1, 1, 1, 1,
0.424301, 0.6235803, -0.8659533, 1, 1, 1, 1, 1,
0.4253246, 0.01536156, 2.793012, 1, 1, 1, 1, 1,
0.4316266, 1.12849, -0.3253756, 1, 1, 1, 1, 1,
0.4325234, -0.2421609, 2.371115, 1, 1, 1, 1, 1,
0.4334587, -0.8566613, 1.579863, 1, 1, 1, 1, 1,
0.4382011, -1.388147, 3.149754, 1, 1, 1, 1, 1,
0.4408077, -1.016196, 3.523862, 1, 1, 1, 1, 1,
0.4421946, -0.6862928, 3.7589, 1, 1, 1, 1, 1,
0.4453061, 0.6731747, 0.1384679, 0, 0, 1, 1, 1,
0.4566053, 0.1706864, 1.010114, 1, 0, 0, 1, 1,
0.4619414, -0.1078941, 1.290356, 1, 0, 0, 1, 1,
0.4632738, 0.7184718, 0.4328071, 1, 0, 0, 1, 1,
0.4635244, 0.7416863, 1.447229, 1, 0, 0, 1, 1,
0.4686207, 1.360987, -1.318998, 1, 0, 0, 1, 1,
0.4689916, 1.074619, -0.2230691, 0, 0, 0, 1, 1,
0.4719608, 1.591791, 2.087343, 0, 0, 0, 1, 1,
0.4726141, 0.5501282, 2.002525, 0, 0, 0, 1, 1,
0.4735858, -2.619522, 5.356308, 0, 0, 0, 1, 1,
0.4788935, 0.7766749, -0.7186856, 0, 0, 0, 1, 1,
0.4887857, 0.291977, 1.196196, 0, 0, 0, 1, 1,
0.4937504, 0.4168393, -0.5857328, 0, 0, 0, 1, 1,
0.5008566, 0.7613978, 0.6950127, 1, 1, 1, 1, 1,
0.5019794, -1.269599, 1.060328, 1, 1, 1, 1, 1,
0.502677, 0.09848434, 0.6720507, 1, 1, 1, 1, 1,
0.5038542, 0.4007368, 0.05642779, 1, 1, 1, 1, 1,
0.5131955, -0.6303408, 2.878644, 1, 1, 1, 1, 1,
0.5140473, -1.539335, 2.578491, 1, 1, 1, 1, 1,
0.5142707, 0.4262562, 1.484625, 1, 1, 1, 1, 1,
0.5153821, 0.9626351, -1.305859, 1, 1, 1, 1, 1,
0.5163919, -1.293942, 2.138078, 1, 1, 1, 1, 1,
0.5199125, -0.6324446, 2.015073, 1, 1, 1, 1, 1,
0.5245368, -1.352488, 2.852575, 1, 1, 1, 1, 1,
0.525143, -0.791868, 3.375909, 1, 1, 1, 1, 1,
0.5315363, -1.283495, 3.260518, 1, 1, 1, 1, 1,
0.5320293, 1.682328, -1.441182, 1, 1, 1, 1, 1,
0.5334037, -0.2518024, 0.7080161, 1, 1, 1, 1, 1,
0.5344895, -2.364085, 3.772029, 0, 0, 1, 1, 1,
0.5363139, -0.8303205, 0.5470979, 1, 0, 0, 1, 1,
0.5379006, -0.03968427, 0.2730479, 1, 0, 0, 1, 1,
0.5426689, 1.114821, 0.7474276, 1, 0, 0, 1, 1,
0.5444376, 0.955877, 1.274249, 1, 0, 0, 1, 1,
0.5473967, 0.1845661, 0.4231946, 1, 0, 0, 1, 1,
0.5496209, 1.280973, 0.2047246, 0, 0, 0, 1, 1,
0.5514928, -0.6680201, 1.82537, 0, 0, 0, 1, 1,
0.5518122, 1.040475, -0.2841172, 0, 0, 0, 1, 1,
0.5570496, -0.5897449, 1.227758, 0, 0, 0, 1, 1,
0.5581893, -0.8500281, 3.845265, 0, 0, 0, 1, 1,
0.5697202, -0.1186451, 1.862939, 0, 0, 0, 1, 1,
0.5710608, 1.204295, 0.2764884, 0, 0, 0, 1, 1,
0.5771095, -0.4307771, 2.084489, 1, 1, 1, 1, 1,
0.5791532, 1.45602, -0.5414813, 1, 1, 1, 1, 1,
0.5815942, 0.08432612, 1.691625, 1, 1, 1, 1, 1,
0.5818586, -0.9165334, 2.107153, 1, 1, 1, 1, 1,
0.583268, -0.6651676, 2.849155, 1, 1, 1, 1, 1,
0.5880306, 0.5341479, 0.6916943, 1, 1, 1, 1, 1,
0.5918497, -2.032231, 2.514369, 1, 1, 1, 1, 1,
0.5966831, 1.009656, 1.136453, 1, 1, 1, 1, 1,
0.5997268, 0.1041858, 0.8299029, 1, 1, 1, 1, 1,
0.6015996, -0.550078, 4.298078, 1, 1, 1, 1, 1,
0.6162214, -1.29866, 4.148509, 1, 1, 1, 1, 1,
0.6176481, 0.7796304, 1.328006, 1, 1, 1, 1, 1,
0.6213081, 0.3439494, 1.057178, 1, 1, 1, 1, 1,
0.6218381, -0.7656766, 3.175814, 1, 1, 1, 1, 1,
0.6244675, 2.09825, -1.552695, 1, 1, 1, 1, 1,
0.6269483, 0.5122135, 0.4571805, 0, 0, 1, 1, 1,
0.6270772, 0.8115327, 0.6780874, 1, 0, 0, 1, 1,
0.6323177, -1.959063, 3.16249, 1, 0, 0, 1, 1,
0.6371226, -0.6991198, 4.778797, 1, 0, 0, 1, 1,
0.6377504, 1.4536, 0.4184612, 1, 0, 0, 1, 1,
0.6381506, -1.410119, 3.514318, 1, 0, 0, 1, 1,
0.6481728, -0.9314368, 3.26977, 0, 0, 0, 1, 1,
0.6531394, -0.9504662, 4.444881, 0, 0, 0, 1, 1,
0.6540191, 0.9644077, -0.1283872, 0, 0, 0, 1, 1,
0.6555457, 0.352675, 0.5404821, 0, 0, 0, 1, 1,
0.6597909, 1.330853, -0.6228524, 0, 0, 0, 1, 1,
0.6598106, 2.268803, 1.015584, 0, 0, 0, 1, 1,
0.6606551, 0.2102792, -0.167052, 0, 0, 0, 1, 1,
0.6637087, -0.5210931, 3.942276, 1, 1, 1, 1, 1,
0.6646262, -0.1692513, 0.7079241, 1, 1, 1, 1, 1,
0.6651998, -0.9446953, 2.320925, 1, 1, 1, 1, 1,
0.669833, 1.480986, 1.793988, 1, 1, 1, 1, 1,
0.6721592, -1.038491, 1.761046, 1, 1, 1, 1, 1,
0.6809813, 0.9167289, 0.6895169, 1, 1, 1, 1, 1,
0.6891741, -0.8016129, 3.249327, 1, 1, 1, 1, 1,
0.6924596, 0.8277428, 0.5941272, 1, 1, 1, 1, 1,
0.694118, -1.837093, 2.750365, 1, 1, 1, 1, 1,
0.7049182, -1.78533, 2.25827, 1, 1, 1, 1, 1,
0.7198692, -2.299483, 1.877732, 1, 1, 1, 1, 1,
0.720088, -0.07068722, 0.2802451, 1, 1, 1, 1, 1,
0.7204121, -0.8458875, 4.43207, 1, 1, 1, 1, 1,
0.7219096, -0.4529322, 1.561216, 1, 1, 1, 1, 1,
0.7225658, 1.303301, 0.09545937, 1, 1, 1, 1, 1,
0.7309473, 0.8935001, 1.428411, 0, 0, 1, 1, 1,
0.7326536, -0.02549873, 3.028089, 1, 0, 0, 1, 1,
0.7364633, 0.3110402, 1.609298, 1, 0, 0, 1, 1,
0.7367293, -0.1920915, 1.806693, 1, 0, 0, 1, 1,
0.7381446, -1.392936, 2.359148, 1, 0, 0, 1, 1,
0.7443694, 0.03891318, 2.467461, 1, 0, 0, 1, 1,
0.7516093, -0.1330273, 0.5404974, 0, 0, 0, 1, 1,
0.7521049, 0.6987644, -0.1781263, 0, 0, 0, 1, 1,
0.7535613, -0.5000932, 3.692995, 0, 0, 0, 1, 1,
0.7545398, -0.7551765, -0.3558919, 0, 0, 0, 1, 1,
0.7552885, -0.7943954, 2.585458, 0, 0, 0, 1, 1,
0.7585394, 2.23139, 0.8184102, 0, 0, 0, 1, 1,
0.7620141, -0.9029421, 3.283808, 0, 0, 0, 1, 1,
0.7693771, -0.0380168, 1.899095, 1, 1, 1, 1, 1,
0.7714691, 0.2819295, 1.072155, 1, 1, 1, 1, 1,
0.7849936, 0.8600117, 0.5775694, 1, 1, 1, 1, 1,
0.7858399, 0.131476, 1.224654, 1, 1, 1, 1, 1,
0.7897235, -0.03292965, 1.583226, 1, 1, 1, 1, 1,
0.7909036, -0.1147576, 1.3425, 1, 1, 1, 1, 1,
0.7913134, -1.065607, 1.003798, 1, 1, 1, 1, 1,
0.79774, 2.786837, 1.039154, 1, 1, 1, 1, 1,
0.7984557, -0.5751764, 2.516316, 1, 1, 1, 1, 1,
0.8023673, -0.565526, -0.05613811, 1, 1, 1, 1, 1,
0.8050546, 0.09460187, 2.032077, 1, 1, 1, 1, 1,
0.8075841, -0.3622591, 3.282233, 1, 1, 1, 1, 1,
0.8137076, -1.924762, 1.880717, 1, 1, 1, 1, 1,
0.8142319, 0.491651, 1.806357, 1, 1, 1, 1, 1,
0.8171095, -0.2834718, 1.888869, 1, 1, 1, 1, 1,
0.8171121, 0.582032, 0.9827422, 0, 0, 1, 1, 1,
0.8171437, -0.446685, 1.941436, 1, 0, 0, 1, 1,
0.8177724, -0.4466576, 2.840445, 1, 0, 0, 1, 1,
0.8195624, -0.3128481, 3.816446, 1, 0, 0, 1, 1,
0.8255242, -0.2405434, 1.228302, 1, 0, 0, 1, 1,
0.8263261, 1.344244, 0.7514747, 1, 0, 0, 1, 1,
0.827117, 0.5129784, 1.022166, 0, 0, 0, 1, 1,
0.8316295, -0.7628191, 2.070688, 0, 0, 0, 1, 1,
0.8316616, 0.9066279, 1.116251, 0, 0, 0, 1, 1,
0.839628, 0.5846685, 1.301078, 0, 0, 0, 1, 1,
0.8429476, -0.001635742, 1.960551, 0, 0, 0, 1, 1,
0.8439457, -2.532385, 3.775918, 0, 0, 0, 1, 1,
0.8447281, -1.645898, 3.513772, 0, 0, 0, 1, 1,
0.8476162, -0.6254996, 0.4041334, 1, 1, 1, 1, 1,
0.8510023, -1.026886, 4.414616, 1, 1, 1, 1, 1,
0.8511403, -0.9584998, 2.246688, 1, 1, 1, 1, 1,
0.8625274, 0.8548478, 1.464556, 1, 1, 1, 1, 1,
0.8698109, -2.473252, 2.810232, 1, 1, 1, 1, 1,
0.8761115, 0.9441713, 0.5871883, 1, 1, 1, 1, 1,
0.8792871, -0.6537148, 3.135581, 1, 1, 1, 1, 1,
0.8867751, -0.2659541, 2.036958, 1, 1, 1, 1, 1,
0.891034, -1.009702, 1.204835, 1, 1, 1, 1, 1,
0.8956817, 1.434804, 0.05725835, 1, 1, 1, 1, 1,
0.8966405, -1.828323, 2.951271, 1, 1, 1, 1, 1,
0.8994408, 0.130538, 1.83925, 1, 1, 1, 1, 1,
0.9013112, -0.389699, 2.020397, 1, 1, 1, 1, 1,
0.9066054, -1.097279, 2.27758, 1, 1, 1, 1, 1,
0.919974, 2.859338, 2.463064, 1, 1, 1, 1, 1,
0.9203064, -1.728754, 1.893471, 0, 0, 1, 1, 1,
0.9242238, -0.1102299, -0.05591879, 1, 0, 0, 1, 1,
0.9276394, -0.9758387, 2.562654, 1, 0, 0, 1, 1,
0.9307501, 0.69068, 1.241282, 1, 0, 0, 1, 1,
0.9312717, 1.150289, -0.4065157, 1, 0, 0, 1, 1,
0.9337726, 0.1726074, 1.184817, 1, 0, 0, 1, 1,
0.9400409, -0.2008503, 3.146036, 0, 0, 0, 1, 1,
0.9471673, -0.03492945, 2.659639, 0, 0, 0, 1, 1,
0.9490828, -0.5882171, 1.665936, 0, 0, 0, 1, 1,
0.9525103, -1.553019, 3.628406, 0, 0, 0, 1, 1,
0.9540328, 1.328214, 1.112089, 0, 0, 0, 1, 1,
0.9576713, -1.887493, 2.978096, 0, 0, 0, 1, 1,
0.9656991, 1.028206, 0.08864306, 0, 0, 0, 1, 1,
0.9684349, 1.348721, 0.5644984, 1, 1, 1, 1, 1,
0.9715998, 1.418945, 0.7112736, 1, 1, 1, 1, 1,
0.9723202, -0.850866, 2.580816, 1, 1, 1, 1, 1,
0.9739425, 0.5484107, 0.5697243, 1, 1, 1, 1, 1,
0.974158, 0.5006927, 1.11446, 1, 1, 1, 1, 1,
0.9759792, 1.106238, 0.2439736, 1, 1, 1, 1, 1,
0.9769033, -0.9934229, 1.758151, 1, 1, 1, 1, 1,
0.9788916, -0.2203556, 2.683685, 1, 1, 1, 1, 1,
0.9904057, 0.4742528, 0.2303743, 1, 1, 1, 1, 1,
0.9921839, -0.2470677, 2.519526, 1, 1, 1, 1, 1,
0.9932485, 1.154465, 0.7394333, 1, 1, 1, 1, 1,
1.004812, -0.6312956, 2.943181, 1, 1, 1, 1, 1,
1.008761, -1.578509, 1.480659, 1, 1, 1, 1, 1,
1.008886, 1.328655, 0.9720408, 1, 1, 1, 1, 1,
1.01517, 1.157805, 0.620882, 1, 1, 1, 1, 1,
1.021509, 2.417235, 0.7289866, 0, 0, 1, 1, 1,
1.026041, -0.47681, 1.995061, 1, 0, 0, 1, 1,
1.029683, -0.06228395, 0.7354921, 1, 0, 0, 1, 1,
1.036001, 1.616107, 1.761965, 1, 0, 0, 1, 1,
1.038317, -0.3470584, 3.437789, 1, 0, 0, 1, 1,
1.039916, 0.5477371, 0.6147101, 1, 0, 0, 1, 1,
1.041689, -0.6449087, 1.744377, 0, 0, 0, 1, 1,
1.045864, -0.2249163, 1.245559, 0, 0, 0, 1, 1,
1.046433, 0.6090265, 0.01512609, 0, 0, 0, 1, 1,
1.046882, -0.4155073, 2.452068, 0, 0, 0, 1, 1,
1.054418, 1.186451, 3.073711, 0, 0, 0, 1, 1,
1.057753, -0.08887554, 1.690114, 0, 0, 0, 1, 1,
1.062593, -0.745523, 2.630291, 0, 0, 0, 1, 1,
1.065334, 1.621779, 1.236234, 1, 1, 1, 1, 1,
1.067145, -1.830583, 1.211578, 1, 1, 1, 1, 1,
1.067917, -1.478436, 2.6359, 1, 1, 1, 1, 1,
1.071453, -0.5769944, 2.435375, 1, 1, 1, 1, 1,
1.077373, 0.1712623, 2.369391, 1, 1, 1, 1, 1,
1.078802, -1.609709, 3.066794, 1, 1, 1, 1, 1,
1.081136, -1.059279, 1.967791, 1, 1, 1, 1, 1,
1.081613, -0.3247208, 2.15781, 1, 1, 1, 1, 1,
1.08839, -0.8460212, 2.137236, 1, 1, 1, 1, 1,
1.089593, 0.1407532, 0.7638507, 1, 1, 1, 1, 1,
1.091153, 0.6178553, 2.112016, 1, 1, 1, 1, 1,
1.095206, -1.058667, 2.400175, 1, 1, 1, 1, 1,
1.096073, -0.8370062, 2.191186, 1, 1, 1, 1, 1,
1.100803, -0.4199513, 0.9865881, 1, 1, 1, 1, 1,
1.101345, -0.07783627, 0.2362316, 1, 1, 1, 1, 1,
1.106641, 0.4406131, -0.4460656, 0, 0, 1, 1, 1,
1.113325, 0.1633763, 2.208991, 1, 0, 0, 1, 1,
1.113482, -1.038131, 2.968646, 1, 0, 0, 1, 1,
1.11617, -1.163222, 2.104251, 1, 0, 0, 1, 1,
1.11728, 0.5568246, 0.3288805, 1, 0, 0, 1, 1,
1.1206, -1.111626, 2.042278, 1, 0, 0, 1, 1,
1.127639, -1.625182, 2.937591, 0, 0, 0, 1, 1,
1.128843, 0.09562688, 1.327359, 0, 0, 0, 1, 1,
1.135142, 0.8073108, 1.112586, 0, 0, 0, 1, 1,
1.135988, 1.098858, 0.558777, 0, 0, 0, 1, 1,
1.147025, -1.163268, 2.141515, 0, 0, 0, 1, 1,
1.147128, 0.193229, 1.932165, 0, 0, 0, 1, 1,
1.150001, -1.245231, 2.010821, 0, 0, 0, 1, 1,
1.150406, -1.712274, 4.723078, 1, 1, 1, 1, 1,
1.150605, 1.10624, 0.1720306, 1, 1, 1, 1, 1,
1.155211, -1.300085, 1.736117, 1, 1, 1, 1, 1,
1.162285, 0.7070706, 0.210183, 1, 1, 1, 1, 1,
1.163973, 0.4529729, 1.273415, 1, 1, 1, 1, 1,
1.173419, -0.4236968, 2.768718, 1, 1, 1, 1, 1,
1.176519, -1.324941, 0.6817802, 1, 1, 1, 1, 1,
1.176791, -0.3929616, 2.425611, 1, 1, 1, 1, 1,
1.185599, 0.06850141, 3.140158, 1, 1, 1, 1, 1,
1.187928, -0.5150288, 3.018337, 1, 1, 1, 1, 1,
1.191914, -0.9685873, 3.175565, 1, 1, 1, 1, 1,
1.193733, -0.1785802, 0.7365385, 1, 1, 1, 1, 1,
1.198268, 0.39858, 0.581075, 1, 1, 1, 1, 1,
1.201633, 0.2196835, 0.4034127, 1, 1, 1, 1, 1,
1.202334, -0.463483, 1.937071, 1, 1, 1, 1, 1,
1.204019, -0.01787005, 3.724392, 0, 0, 1, 1, 1,
1.209352, 0.517087, 0.0155203, 1, 0, 0, 1, 1,
1.209411, -0.3017907, 1.894437, 1, 0, 0, 1, 1,
1.211759, 0.9948872, 0.9222978, 1, 0, 0, 1, 1,
1.217083, -0.700461, 2.792591, 1, 0, 0, 1, 1,
1.217844, -0.1732716, 1.715805, 1, 0, 0, 1, 1,
1.227044, -0.6815159, 1.787815, 0, 0, 0, 1, 1,
1.242678, 0.8788288, -0.6054124, 0, 0, 0, 1, 1,
1.248711, -0.02292017, 1.500388, 0, 0, 0, 1, 1,
1.251473, -0.4112357, 1.893654, 0, 0, 0, 1, 1,
1.257835, -0.8774499, 2.961381, 0, 0, 0, 1, 1,
1.260195, 0.1484569, -0.1177645, 0, 0, 0, 1, 1,
1.264994, -0.273631, 0.711831, 0, 0, 0, 1, 1,
1.28488, -0.1059815, 0.7969521, 1, 1, 1, 1, 1,
1.302182, -2.13782, 3.494486, 1, 1, 1, 1, 1,
1.303045, -0.04532327, 0.604885, 1, 1, 1, 1, 1,
1.34023, 1.094014, 3.211357, 1, 1, 1, 1, 1,
1.344723, 0.7408435, 2.095521, 1, 1, 1, 1, 1,
1.348027, -1.202414, 0.8728558, 1, 1, 1, 1, 1,
1.359938, -0.03057898, 1.901269, 1, 1, 1, 1, 1,
1.361565, -0.5493287, 1.277315, 1, 1, 1, 1, 1,
1.362569, 0.879793, 0.9852815, 1, 1, 1, 1, 1,
1.378511, 0.4577112, 1.075087, 1, 1, 1, 1, 1,
1.394575, -2.615144, 1.484881, 1, 1, 1, 1, 1,
1.413082, -0.5812442, 1.80038, 1, 1, 1, 1, 1,
1.418634, 0.9963982, 0.7951363, 1, 1, 1, 1, 1,
1.425124, 0.6719959, 0.7302809, 1, 1, 1, 1, 1,
1.425952, 0.01771847, 2.412552, 1, 1, 1, 1, 1,
1.430354, 1.971915, 0.7772957, 0, 0, 1, 1, 1,
1.435787, -0.7185919, 1.874707, 1, 0, 0, 1, 1,
1.440266, 1.09697, 1.814366, 1, 0, 0, 1, 1,
1.44053, 1.392948, 1.438364, 1, 0, 0, 1, 1,
1.45971, -0.7378703, 1.633695, 1, 0, 0, 1, 1,
1.463897, 0.2874562, 1.456868, 1, 0, 0, 1, 1,
1.468694, -0.4876499, 1.704669, 0, 0, 0, 1, 1,
1.473241, -0.4710178, 0.9555338, 0, 0, 0, 1, 1,
1.476332, -1.037277, 2.754757, 0, 0, 0, 1, 1,
1.481559, -0.2061716, 1.774944, 0, 0, 0, 1, 1,
1.483637, 1.78461, 1.094112, 0, 0, 0, 1, 1,
1.490003, 1.263895, 1.819417, 0, 0, 0, 1, 1,
1.500834, -0.8582263, 0.1125379, 0, 0, 0, 1, 1,
1.504987, -0.746821, 0.386173, 1, 1, 1, 1, 1,
1.510522, -0.06606468, 0.8709025, 1, 1, 1, 1, 1,
1.527799, -0.6166281, 1.598455, 1, 1, 1, 1, 1,
1.532104, 0.1273076, -0.3037415, 1, 1, 1, 1, 1,
1.533224, -0.4468149, 2.488698, 1, 1, 1, 1, 1,
1.543669, 0.4358825, 1.066363, 1, 1, 1, 1, 1,
1.561042, -1.19667, 1.691255, 1, 1, 1, 1, 1,
1.565122, 0.9279487, 1.59053, 1, 1, 1, 1, 1,
1.577368, -0.1513335, 2.99734, 1, 1, 1, 1, 1,
1.594496, 0.5507405, 1.936663, 1, 1, 1, 1, 1,
1.603464, 0.5320895, 0.4406395, 1, 1, 1, 1, 1,
1.6177, 0.406216, 2.665267, 1, 1, 1, 1, 1,
1.621162, 0.09320553, 1.986133, 1, 1, 1, 1, 1,
1.624853, -0.7276392, 1.294467, 1, 1, 1, 1, 1,
1.637522, -0.1315052, -0.3521494, 1, 1, 1, 1, 1,
1.641263, 0.50959, 0.4343915, 0, 0, 1, 1, 1,
1.644999, 1.332127, 0.3806004, 1, 0, 0, 1, 1,
1.651253, 1.748887, 0.3749723, 1, 0, 0, 1, 1,
1.652086, -1.394897, 1.83754, 1, 0, 0, 1, 1,
1.681768, -0.6406307, 2.084442, 1, 0, 0, 1, 1,
1.691482, 1.608532, 1.107985, 1, 0, 0, 1, 1,
1.698099, -1.454366, 2.644984, 0, 0, 0, 1, 1,
1.699211, -0.52503, 1.281772, 0, 0, 0, 1, 1,
1.700685, -0.5977508, 2.280138, 0, 0, 0, 1, 1,
1.700986, -1.150218, 2.238961, 0, 0, 0, 1, 1,
1.725152, 1.579073, 1.234334, 0, 0, 0, 1, 1,
1.76095, 0.04357954, 3.319531, 0, 0, 0, 1, 1,
1.766817, 1.238814, 1.044471, 0, 0, 0, 1, 1,
1.824176, -1.066351, 1.992966, 1, 1, 1, 1, 1,
1.828263, -3.086109, 3.527667, 1, 1, 1, 1, 1,
1.838278, -2.278386, 3.848761, 1, 1, 1, 1, 1,
1.861199, 0.9371831, 1.742945, 1, 1, 1, 1, 1,
1.867014, -0.6430826, 2.71359, 1, 1, 1, 1, 1,
1.871272, 0.5056771, 1.871047, 1, 1, 1, 1, 1,
1.873973, 1.068612, 0.7527258, 1, 1, 1, 1, 1,
1.886542, 1.417543, 0.4864309, 1, 1, 1, 1, 1,
1.95832, -0.4482687, 2.187992, 1, 1, 1, 1, 1,
1.978936, 1.090076, 2.175711, 1, 1, 1, 1, 1,
2.015157, -0.3658646, 1.801974, 1, 1, 1, 1, 1,
2.016675, 0.1436516, 1.797238, 1, 1, 1, 1, 1,
2.0325, -0.2810757, 1.402471, 1, 1, 1, 1, 1,
2.051999, -0.3867, 3.145089, 1, 1, 1, 1, 1,
2.057027, -2.011323, 2.001353, 1, 1, 1, 1, 1,
2.064536, 0.5105894, 1.348915, 0, 0, 1, 1, 1,
2.138397, 1.690838, 1.144182, 1, 0, 0, 1, 1,
2.144729, -0.692558, 0.8731939, 1, 0, 0, 1, 1,
2.183304, -0.6141278, 2.337497, 1, 0, 0, 1, 1,
2.199746, 0.6479809, 0.3638528, 1, 0, 0, 1, 1,
2.218805, 1.21302, 1.074422, 1, 0, 0, 1, 1,
2.220859, 0.2436187, 1.395478, 0, 0, 0, 1, 1,
2.308702, 0.4978724, 0.8327667, 0, 0, 0, 1, 1,
2.318951, 2.000343, 1.330302, 0, 0, 0, 1, 1,
2.375844, 0.1707037, 1.660201, 0, 0, 0, 1, 1,
2.508977, 0.05133021, 2.082583, 0, 0, 0, 1, 1,
2.55328, 0.6981656, -0.676257, 0, 0, 0, 1, 1,
2.568304, 1.711468, 1.335073, 0, 0, 0, 1, 1,
2.60207, 0.5756308, 0.2962995, 1, 1, 1, 1, 1,
2.638286, 0.3995319, 1.147846, 1, 1, 1, 1, 1,
2.663137, 0.5606666, 1.83786, 1, 1, 1, 1, 1,
3.000022, -1.341298, 1.521049, 1, 1, 1, 1, 1,
3.015883, 1.054363, 2.081771, 1, 1, 1, 1, 1,
3.048345, -0.6752198, 3.712549, 1, 1, 1, 1, 1,
3.808864, 0.1331328, 1.558723, 1, 1, 1, 1, 1
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
var radius = 9.853615;
var distance = 34.6104;
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
mvMatrix.translate( -0.3017402, -0.0730207, 0.172874 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6104);
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
