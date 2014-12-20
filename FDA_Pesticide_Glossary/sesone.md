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
-3.865931, -1.645625, -0.8138607, 1, 0, 0, 1,
-3.077618, -1.151919, -1.431584, 1, 0.007843138, 0, 1,
-3.057968, 0.6287658, -0.2802856, 1, 0.01176471, 0, 1,
-2.971681, 0.8064606, -0.5262138, 1, 0.01960784, 0, 1,
-2.917513, -0.5193241, -2.092413, 1, 0.02352941, 0, 1,
-2.764482, 1.314361, -2.422899, 1, 0.03137255, 0, 1,
-2.734725, 0.6135152, -0.9084795, 1, 0.03529412, 0, 1,
-2.586909, 1.950781, -0.1935154, 1, 0.04313726, 0, 1,
-2.515675, -1.367039, -1.356843, 1, 0.04705882, 0, 1,
-2.496891, 0.7017097, -2.017079, 1, 0.05490196, 0, 1,
-2.39841, 2.330498, -0.3742092, 1, 0.05882353, 0, 1,
-2.339596, 1.124072, -1.094767, 1, 0.06666667, 0, 1,
-2.261746, 0.9645481, -2.367125, 1, 0.07058824, 0, 1,
-2.261286, -1.044925, -2.191246, 1, 0.07843138, 0, 1,
-2.226015, 0.3440239, -3.303386, 1, 0.08235294, 0, 1,
-2.18362, -0.3850137, -0.9792749, 1, 0.09019608, 0, 1,
-2.138659, -0.3311573, -1.11263, 1, 0.09411765, 0, 1,
-2.114122, -0.4109138, -1.169063, 1, 0.1019608, 0, 1,
-2.111826, 1.130547, -1.147088, 1, 0.1098039, 0, 1,
-1.983365, 2.038639, -0.7798076, 1, 0.1137255, 0, 1,
-1.950844, 0.2734749, -1.899401, 1, 0.1215686, 0, 1,
-1.950553, -0.865541, -3.504821, 1, 0.1254902, 0, 1,
-1.942347, 0.06209598, -2.000077, 1, 0.1333333, 0, 1,
-1.940648, 0.45524, -2.810249, 1, 0.1372549, 0, 1,
-1.933433, -0.5007138, -1.231981, 1, 0.145098, 0, 1,
-1.930832, 0.502796, -1.505442, 1, 0.1490196, 0, 1,
-1.924586, -1.316086, -1.465131, 1, 0.1568628, 0, 1,
-1.886566, -1.082154, -0.182138, 1, 0.1607843, 0, 1,
-1.879842, -0.2774363, -3.22763, 1, 0.1686275, 0, 1,
-1.877111, 0.113222, -2.583312, 1, 0.172549, 0, 1,
-1.866961, -1.585244, -2.964969, 1, 0.1803922, 0, 1,
-1.850364, 0.959488, -2.290428, 1, 0.1843137, 0, 1,
-1.848391, 0.7814076, -1.403822, 1, 0.1921569, 0, 1,
-1.841385, -1.565397, -1.49336, 1, 0.1960784, 0, 1,
-1.835989, 0.319989, 0.3469653, 1, 0.2039216, 0, 1,
-1.824112, 0.1220001, -0.6125021, 1, 0.2117647, 0, 1,
-1.794579, 0.3799028, -1.955604, 1, 0.2156863, 0, 1,
-1.781828, -0.6375033, -1.906243, 1, 0.2235294, 0, 1,
-1.77187, -0.3196537, -2.521899, 1, 0.227451, 0, 1,
-1.770314, 0.5076301, -2.065363, 1, 0.2352941, 0, 1,
-1.761106, -0.8924981, -2.796326, 1, 0.2392157, 0, 1,
-1.748736, 3.121382, -0.154869, 1, 0.2470588, 0, 1,
-1.744033, -0.197585, -2.235324, 1, 0.2509804, 0, 1,
-1.736499, 0.4319899, -0.9222209, 1, 0.2588235, 0, 1,
-1.691858, 0.9489867, -1.078854, 1, 0.2627451, 0, 1,
-1.690955, 0.2989315, -2.720097, 1, 0.2705882, 0, 1,
-1.687082, 0.1735756, -0.8257415, 1, 0.2745098, 0, 1,
-1.672747, -1.723489, -1.708155, 1, 0.282353, 0, 1,
-1.667213, -0.6794062, -1.136528, 1, 0.2862745, 0, 1,
-1.662929, 2.659973, -1.496994, 1, 0.2941177, 0, 1,
-1.624357, -0.3926125, -2.911533, 1, 0.3019608, 0, 1,
-1.617568, 1.016938, -2.10265, 1, 0.3058824, 0, 1,
-1.590977, 0.1860813, -0.723112, 1, 0.3137255, 0, 1,
-1.570618, 0.04540123, -0.1798608, 1, 0.3176471, 0, 1,
-1.567432, -1.925291, -1.329275, 1, 0.3254902, 0, 1,
-1.562584, -0.3048314, -1.39795, 1, 0.3294118, 0, 1,
-1.561363, 0.3069341, -0.7267147, 1, 0.3372549, 0, 1,
-1.555401, -0.3488059, -2.859763, 1, 0.3411765, 0, 1,
-1.552296, -1.315877, -1.799408, 1, 0.3490196, 0, 1,
-1.541841, -1.089161, -3.582751, 1, 0.3529412, 0, 1,
-1.540262, 0.9913416, -2.003824, 1, 0.3607843, 0, 1,
-1.521936, -2.217551, -3.16126, 1, 0.3647059, 0, 1,
-1.513798, -1.464953, -2.255738, 1, 0.372549, 0, 1,
-1.510971, 0.7377213, -1.552118, 1, 0.3764706, 0, 1,
-1.507777, -0.523617, -3.624272, 1, 0.3843137, 0, 1,
-1.50127, 0.8987754, -0.3383878, 1, 0.3882353, 0, 1,
-1.500412, 0.1921383, -0.5874425, 1, 0.3960784, 0, 1,
-1.498194, -0.6886646, -2.178009, 1, 0.4039216, 0, 1,
-1.496719, -0.6931757, -1.808977, 1, 0.4078431, 0, 1,
-1.495808, -0.3679766, -2.103235, 1, 0.4156863, 0, 1,
-1.495444, -0.8476425, -1.009521, 1, 0.4196078, 0, 1,
-1.482792, -0.2549873, -2.719674, 1, 0.427451, 0, 1,
-1.475652, -0.6318299, -2.775747, 1, 0.4313726, 0, 1,
-1.461394, 0.04808829, -2.378654, 1, 0.4392157, 0, 1,
-1.449095, -0.1821465, -1.732033, 1, 0.4431373, 0, 1,
-1.443218, 0.2273047, -0.06680814, 1, 0.4509804, 0, 1,
-1.434975, -0.5296177, -3.159768, 1, 0.454902, 0, 1,
-1.42883, 0.4204094, -3.983402, 1, 0.4627451, 0, 1,
-1.419626, 0.08141705, -3.556495, 1, 0.4666667, 0, 1,
-1.41058, 0.08340506, -1.793628, 1, 0.4745098, 0, 1,
-1.405664, -0.9190933, -2.145933, 1, 0.4784314, 0, 1,
-1.398721, -1.18369, -2.04272, 1, 0.4862745, 0, 1,
-1.397898, -0.5202702, -1.055726, 1, 0.4901961, 0, 1,
-1.396091, 0.4188046, 1.574088, 1, 0.4980392, 0, 1,
-1.391788, 1.479955, -1.424037, 1, 0.5058824, 0, 1,
-1.38816, 0.7353072, -1.851863, 1, 0.509804, 0, 1,
-1.379551, -0.7259814, -3.306355, 1, 0.5176471, 0, 1,
-1.377464, -2.642164, -1.773434, 1, 0.5215687, 0, 1,
-1.368728, 0.4336059, -2.794474, 1, 0.5294118, 0, 1,
-1.367695, -1.380287, -2.375249, 1, 0.5333334, 0, 1,
-1.366778, -0.9125359, -2.273047, 1, 0.5411765, 0, 1,
-1.362807, -1.149822, -4.309183, 1, 0.5450981, 0, 1,
-1.360665, 0.6457505, -0.8370122, 1, 0.5529412, 0, 1,
-1.356745, -0.4035071, -0.7802528, 1, 0.5568628, 0, 1,
-1.351301, -0.02559777, -2.451364, 1, 0.5647059, 0, 1,
-1.347942, 0.2214031, -0.6741844, 1, 0.5686275, 0, 1,
-1.338718, -0.1615744, -0.4240094, 1, 0.5764706, 0, 1,
-1.332438, 0.1549339, -1.854841, 1, 0.5803922, 0, 1,
-1.331841, 1.627516, -2.547926, 1, 0.5882353, 0, 1,
-1.327478, 0.486929, -1.167614, 1, 0.5921569, 0, 1,
-1.326656, 0.6427033, 1.08613, 1, 0.6, 0, 1,
-1.306019, -1.226551, -3.088521, 1, 0.6078432, 0, 1,
-1.298068, 1.335164, -0.007170999, 1, 0.6117647, 0, 1,
-1.283174, -2.061245, -4.737968, 1, 0.6196079, 0, 1,
-1.2819, 0.3886443, -3.022444, 1, 0.6235294, 0, 1,
-1.277562, -0.7271774, -2.179121, 1, 0.6313726, 0, 1,
-1.277296, 1.203152, -1.324816, 1, 0.6352941, 0, 1,
-1.274411, -0.3739482, -2.03559, 1, 0.6431373, 0, 1,
-1.272749, -0.650775, -2.547222, 1, 0.6470588, 0, 1,
-1.272643, -1.941132, -3.25761, 1, 0.654902, 0, 1,
-1.265841, -1.285627, -4.18236, 1, 0.6588235, 0, 1,
-1.264184, 0.3781158, -1.521732, 1, 0.6666667, 0, 1,
-1.264155, 2.215898, 0.4743757, 1, 0.6705883, 0, 1,
-1.263898, -1.024943, -2.211941, 1, 0.6784314, 0, 1,
-1.256633, 0.1383736, -3.296804, 1, 0.682353, 0, 1,
-1.250506, -0.6795703, -2.958338, 1, 0.6901961, 0, 1,
-1.244812, -0.4872374, -1.8259, 1, 0.6941177, 0, 1,
-1.237199, 0.4545745, -1.549368, 1, 0.7019608, 0, 1,
-1.223506, 0.03021698, -1.870341, 1, 0.7098039, 0, 1,
-1.218032, 0.1217658, -2.993373, 1, 0.7137255, 0, 1,
-1.216501, 1.661044, -0.2219934, 1, 0.7215686, 0, 1,
-1.209029, -0.8612246, -1.302226, 1, 0.7254902, 0, 1,
-1.20379, 1.511322, 0.3792247, 1, 0.7333333, 0, 1,
-1.199998, -2.014273, -4.081523, 1, 0.7372549, 0, 1,
-1.196325, 1.528496, -0.8608404, 1, 0.7450981, 0, 1,
-1.187433, 0.4964955, -2.409376, 1, 0.7490196, 0, 1,
-1.183632, -0.5856172, -0.7529119, 1, 0.7568628, 0, 1,
-1.182416, -0.1278415, -0.9833167, 1, 0.7607843, 0, 1,
-1.16852, -0.733201, -1.743095, 1, 0.7686275, 0, 1,
-1.156796, 0.2294067, -2.339032, 1, 0.772549, 0, 1,
-1.152791, -0.892476, -3.611671, 1, 0.7803922, 0, 1,
-1.146096, 0.07256091, -2.343142, 1, 0.7843137, 0, 1,
-1.142144, -0.7966187, -1.328895, 1, 0.7921569, 0, 1,
-1.141953, 1.05407, 0.8261585, 1, 0.7960784, 0, 1,
-1.139063, -0.009167299, -2.946032, 1, 0.8039216, 0, 1,
-1.138069, 0.8258159, -0.3315901, 1, 0.8117647, 0, 1,
-1.123798, 1.145137, -1.104831, 1, 0.8156863, 0, 1,
-1.100402, 0.276399, -0.6740649, 1, 0.8235294, 0, 1,
-1.095135, 1.143585, -1.861697, 1, 0.827451, 0, 1,
-1.094187, 0.6967122, -0.834112, 1, 0.8352941, 0, 1,
-1.091481, -1.221903, -2.343144, 1, 0.8392157, 0, 1,
-1.090834, -0.5830703, -1.995805, 1, 0.8470588, 0, 1,
-1.090801, 1.455834, -1.741562, 1, 0.8509804, 0, 1,
-1.086801, -1.773531, -1.086628, 1, 0.8588235, 0, 1,
-1.086312, 1.194357, -0.993179, 1, 0.8627451, 0, 1,
-1.085773, -0.3000138, -2.993731, 1, 0.8705882, 0, 1,
-1.084804, -0.4528486, -1.010473, 1, 0.8745098, 0, 1,
-1.084307, 0.03723008, -2.359682, 1, 0.8823529, 0, 1,
-1.072075, -0.8489089, -1.299249, 1, 0.8862745, 0, 1,
-1.070583, -0.09241022, -1.951108, 1, 0.8941177, 0, 1,
-1.066953, 1.586545, -2.028297, 1, 0.8980392, 0, 1,
-1.065929, 1.692434, -0.9726171, 1, 0.9058824, 0, 1,
-1.065869, 1.507211, 0.3176237, 1, 0.9137255, 0, 1,
-1.06083, -1.364031, -2.045877, 1, 0.9176471, 0, 1,
-1.056741, 0.8328817, -0.5636995, 1, 0.9254902, 0, 1,
-1.055016, -1.901225, -2.744971, 1, 0.9294118, 0, 1,
-1.049665, -0.3843613, -1.986015, 1, 0.9372549, 0, 1,
-1.042062, -0.6813775, -2.953102, 1, 0.9411765, 0, 1,
-1.0396, -2.068788, -3.420339, 1, 0.9490196, 0, 1,
-1.036897, 1.588925, -1.532874, 1, 0.9529412, 0, 1,
-1.035771, 0.6649141, -0.3936975, 1, 0.9607843, 0, 1,
-1.034931, -0.316573, -2.913213, 1, 0.9647059, 0, 1,
-1.0325, 0.3246089, -1.79304, 1, 0.972549, 0, 1,
-1.031528, 0.4438525, -0.4193898, 1, 0.9764706, 0, 1,
-1.029885, 1.270471, -1.682132, 1, 0.9843137, 0, 1,
-1.02169, 0.4644756, -1.505455, 1, 0.9882353, 0, 1,
-1.02129, 0.4930077, 0.07737191, 1, 0.9960784, 0, 1,
-1.007856, -0.1448532, -1.450788, 0.9960784, 1, 0, 1,
-1.007137, -0.2493343, -3.391275, 0.9921569, 1, 0, 1,
-1.002146, 0.9945504, 0.5510331, 0.9843137, 1, 0, 1,
-0.9971778, -0.134489, -2.577007, 0.9803922, 1, 0, 1,
-0.9960312, 0.8130431, -1.25511, 0.972549, 1, 0, 1,
-0.9896305, 0.04084276, -1.119415, 0.9686275, 1, 0, 1,
-0.9864759, -0.7264982, -3.379888, 0.9607843, 1, 0, 1,
-0.9853618, -1.274175, -2.421685, 0.9568627, 1, 0, 1,
-0.9841633, -1.290765, -2.184245, 0.9490196, 1, 0, 1,
-0.9819343, 0.4641584, -0.9550756, 0.945098, 1, 0, 1,
-0.9776447, 0.1743779, -0.944884, 0.9372549, 1, 0, 1,
-0.976924, 1.116509, 1.599517, 0.9333333, 1, 0, 1,
-0.9765874, -1.5518, -3.018261, 0.9254902, 1, 0, 1,
-0.9714119, 0.2663783, -0.5563332, 0.9215686, 1, 0, 1,
-0.9686304, -1.694764, -2.388783, 0.9137255, 1, 0, 1,
-0.9605479, -1.154598, -2.272506, 0.9098039, 1, 0, 1,
-0.9601204, 1.286199, -0.1794573, 0.9019608, 1, 0, 1,
-0.9527018, -0.9883238, -3.075784, 0.8941177, 1, 0, 1,
-0.9520753, -1.999525, -2.063777, 0.8901961, 1, 0, 1,
-0.9503157, 0.6893847, -1.053123, 0.8823529, 1, 0, 1,
-0.9400105, 0.3439281, -0.3156207, 0.8784314, 1, 0, 1,
-0.9220954, -0.4950994, -1.621331, 0.8705882, 1, 0, 1,
-0.9179407, 0.3844275, -1.5296, 0.8666667, 1, 0, 1,
-0.9170976, 1.568931, -1.369953, 0.8588235, 1, 0, 1,
-0.9125261, -0.1740234, -2.905396, 0.854902, 1, 0, 1,
-0.9124887, 0.7478065, -2.165051, 0.8470588, 1, 0, 1,
-0.9098129, -0.7185932, -1.83327, 0.8431373, 1, 0, 1,
-0.909435, -0.07958791, -2.32495, 0.8352941, 1, 0, 1,
-0.9080399, -0.5015266, -2.20783, 0.8313726, 1, 0, 1,
-0.9073883, 0.7718176, -1.984064, 0.8235294, 1, 0, 1,
-0.9048604, 1.047775, -0.3499728, 0.8196079, 1, 0, 1,
-0.8999535, 0.4979353, -0.399394, 0.8117647, 1, 0, 1,
-0.8981786, -0.6434457, -2.102797, 0.8078431, 1, 0, 1,
-0.8857055, 1.375823, -0.1860136, 0.8, 1, 0, 1,
-0.8812473, 0.09909886, -0.8406907, 0.7921569, 1, 0, 1,
-0.8795072, 0.7475965, -0.001798583, 0.7882353, 1, 0, 1,
-0.8778251, -0.09743838, -2.403385, 0.7803922, 1, 0, 1,
-0.8764012, 1.745838, -1.493995, 0.7764706, 1, 0, 1,
-0.8685982, -0.1649979, -2.534453, 0.7686275, 1, 0, 1,
-0.8650167, -0.8606598, -2.663624, 0.7647059, 1, 0, 1,
-0.8644163, -0.9439685, -4.058337, 0.7568628, 1, 0, 1,
-0.8572824, 0.6623059, -1.818602, 0.7529412, 1, 0, 1,
-0.8494732, -0.6662682, -1.136764, 0.7450981, 1, 0, 1,
-0.8454891, -2.544654, -1.049865, 0.7411765, 1, 0, 1,
-0.8384418, 0.877179, -0.7317973, 0.7333333, 1, 0, 1,
-0.8382174, -0.5004373, -1.224621, 0.7294118, 1, 0, 1,
-0.8335865, 0.8597859, -1.402639, 0.7215686, 1, 0, 1,
-0.8334699, 0.3605409, -0.7561308, 0.7176471, 1, 0, 1,
-0.8303222, -0.8391761, -3.829288, 0.7098039, 1, 0, 1,
-0.8294667, -0.3206254, -1.825303, 0.7058824, 1, 0, 1,
-0.8093289, -2.285004, -3.638211, 0.6980392, 1, 0, 1,
-0.805131, -1.046685, -2.977516, 0.6901961, 1, 0, 1,
-0.804323, 1.23861, -1.636026, 0.6862745, 1, 0, 1,
-0.801927, 0.08549557, -1.515419, 0.6784314, 1, 0, 1,
-0.8001778, 0.9985409, -2.575626, 0.6745098, 1, 0, 1,
-0.7998983, -1.405162, -1.971267, 0.6666667, 1, 0, 1,
-0.7876598, 1.275151, -1.252416, 0.6627451, 1, 0, 1,
-0.7871693, 0.5357652, -0.4826639, 0.654902, 1, 0, 1,
-0.7803998, -0.1228254, -0.4431114, 0.6509804, 1, 0, 1,
-0.7788735, 0.6397638, -1.698804, 0.6431373, 1, 0, 1,
-0.7667332, -0.9559292, -1.236506, 0.6392157, 1, 0, 1,
-0.7638468, -1.463493, -2.616043, 0.6313726, 1, 0, 1,
-0.7635743, 0.4225219, 0.9890547, 0.627451, 1, 0, 1,
-0.7624859, -0.04422055, -1.510772, 0.6196079, 1, 0, 1,
-0.7619401, 0.06611157, -1.327347, 0.6156863, 1, 0, 1,
-0.7598918, -0.9956776, -2.648195, 0.6078432, 1, 0, 1,
-0.7522237, -0.9419886, -3.45217, 0.6039216, 1, 0, 1,
-0.7425607, -1.236485, -2.4505, 0.5960785, 1, 0, 1,
-0.7317884, -0.6682484, -3.077771, 0.5882353, 1, 0, 1,
-0.7313668, -0.778081, -4.585333, 0.5843138, 1, 0, 1,
-0.7306495, -0.6627846, -1.642903, 0.5764706, 1, 0, 1,
-0.7230756, -1.052693, -3.062402, 0.572549, 1, 0, 1,
-0.713578, -0.88109, -1.764642, 0.5647059, 1, 0, 1,
-0.7077322, -1.903888, -4.370096, 0.5607843, 1, 0, 1,
-0.7076784, 1.421564, -0.2390826, 0.5529412, 1, 0, 1,
-0.7043641, 1.288407, -1.434267, 0.5490196, 1, 0, 1,
-0.7015195, -1.818085, -4.114932, 0.5411765, 1, 0, 1,
-0.6945761, -0.5229501, -0.5992045, 0.5372549, 1, 0, 1,
-0.691739, -0.6044276, -2.300576, 0.5294118, 1, 0, 1,
-0.6909065, 1.027308, 0.8043959, 0.5254902, 1, 0, 1,
-0.6903154, -0.5091339, -0.7412749, 0.5176471, 1, 0, 1,
-0.6891502, -0.1310859, -0.8621215, 0.5137255, 1, 0, 1,
-0.6883262, 0.4144858, -1.231771, 0.5058824, 1, 0, 1,
-0.6852908, -0.0188992, -3.567708, 0.5019608, 1, 0, 1,
-0.6841764, -0.440806, -1.941748, 0.4941176, 1, 0, 1,
-0.6826453, 1.763389, -1.223909, 0.4862745, 1, 0, 1,
-0.6796107, 1.93037, -0.5934798, 0.4823529, 1, 0, 1,
-0.6754619, 1.575215, 0.6638055, 0.4745098, 1, 0, 1,
-0.667361, -1.269518, -2.894452, 0.4705882, 1, 0, 1,
-0.6642724, -0.02776249, -3.144338, 0.4627451, 1, 0, 1,
-0.6542782, -1.280314, -2.216584, 0.4588235, 1, 0, 1,
-0.6536252, -0.03296794, -2.414397, 0.4509804, 1, 0, 1,
-0.6486606, 0.1655289, -2.198133, 0.4470588, 1, 0, 1,
-0.6482047, 0.04373153, -2.424381, 0.4392157, 1, 0, 1,
-0.6468984, 1.231583, 1.280896, 0.4352941, 1, 0, 1,
-0.6447663, 0.487215, -1.653211, 0.427451, 1, 0, 1,
-0.6437284, -0.5834712, -1.328294, 0.4235294, 1, 0, 1,
-0.6406996, 0.1089931, -1.403576, 0.4156863, 1, 0, 1,
-0.6403769, -1.99589, -5.939645, 0.4117647, 1, 0, 1,
-0.6394833, -0.0001615731, -1.55564, 0.4039216, 1, 0, 1,
-0.6366162, -2.249125, -3.154339, 0.3960784, 1, 0, 1,
-0.6353607, -0.09178647, -2.556527, 0.3921569, 1, 0, 1,
-0.6299726, -0.8746649, -6.338465, 0.3843137, 1, 0, 1,
-0.6171393, 0.6585999, 0.4297165, 0.3803922, 1, 0, 1,
-0.6168665, 1.438888, -1.063192, 0.372549, 1, 0, 1,
-0.6139299, 0.2874021, -0.9746214, 0.3686275, 1, 0, 1,
-0.6094672, 0.3325852, 0.1198014, 0.3607843, 1, 0, 1,
-0.6084578, 1.171237, -1.241088, 0.3568628, 1, 0, 1,
-0.6073657, -0.01440591, -1.069091, 0.3490196, 1, 0, 1,
-0.6032032, -0.6008382, -3.772186, 0.345098, 1, 0, 1,
-0.6030366, -1.21054, -2.469979, 0.3372549, 1, 0, 1,
-0.5969248, 1.659804, 0.1994789, 0.3333333, 1, 0, 1,
-0.5949536, 0.0644561, -0.5860568, 0.3254902, 1, 0, 1,
-0.5922892, 1.440692, -0.6915213, 0.3215686, 1, 0, 1,
-0.5829369, 0.9817244, -0.8787571, 0.3137255, 1, 0, 1,
-0.576537, -0.5905257, -0.680994, 0.3098039, 1, 0, 1,
-0.5677991, -0.8336104, -0.199631, 0.3019608, 1, 0, 1,
-0.5666193, 0.2394765, -0.862357, 0.2941177, 1, 0, 1,
-0.564515, 0.01966021, -0.6988515, 0.2901961, 1, 0, 1,
-0.5592834, -1.804999, -3.219205, 0.282353, 1, 0, 1,
-0.5561407, 1.700918, 0.3213437, 0.2784314, 1, 0, 1,
-0.5553685, 1.88712, 0.6407162, 0.2705882, 1, 0, 1,
-0.55441, 1.708089, -0.9891226, 0.2666667, 1, 0, 1,
-0.5464626, 0.7424131, -0.9556322, 0.2588235, 1, 0, 1,
-0.5448957, -0.8782853, -0.7119425, 0.254902, 1, 0, 1,
-0.535601, 0.1081555, -1.375522, 0.2470588, 1, 0, 1,
-0.5322916, -0.567127, -2.646163, 0.2431373, 1, 0, 1,
-0.5283324, -1.030661, -1.593829, 0.2352941, 1, 0, 1,
-0.5272012, 0.9659499, 1.066209, 0.2313726, 1, 0, 1,
-0.5236739, 1.56709, -0.5358332, 0.2235294, 1, 0, 1,
-0.5151028, 0.3350461, -0.1961038, 0.2196078, 1, 0, 1,
-0.5146515, -0.7718889, -1.762728, 0.2117647, 1, 0, 1,
-0.5124758, -0.8946677, -1.751105, 0.2078431, 1, 0, 1,
-0.5123979, 1.246302, -1.507731, 0.2, 1, 0, 1,
-0.5116637, 0.07910417, -2.285684, 0.1921569, 1, 0, 1,
-0.5083237, 0.06506895, -0.754414, 0.1882353, 1, 0, 1,
-0.5024988, 0.5813326, 0.573596, 0.1803922, 1, 0, 1,
-0.5017374, -0.8005636, -3.519496, 0.1764706, 1, 0, 1,
-0.4995289, 0.5405594, 1.097196, 0.1686275, 1, 0, 1,
-0.4992717, 0.3771686, -2.22496, 0.1647059, 1, 0, 1,
-0.4934775, 0.4825996, 0.004564283, 0.1568628, 1, 0, 1,
-0.4921184, -0.4243459, -0.8313721, 0.1529412, 1, 0, 1,
-0.4885487, 1.378855, 0.3357168, 0.145098, 1, 0, 1,
-0.4879903, -0.8155707, -0.6240132, 0.1411765, 1, 0, 1,
-0.4818797, -0.3842338, -1.764746, 0.1333333, 1, 0, 1,
-0.4812051, 0.0341772, -4.312143, 0.1294118, 1, 0, 1,
-0.4795432, 0.4193137, -1.932477, 0.1215686, 1, 0, 1,
-0.4789054, 1.078556, -0.2462289, 0.1176471, 1, 0, 1,
-0.4785961, -1.403973, -3.063256, 0.1098039, 1, 0, 1,
-0.4781393, -0.4756441, -1.398218, 0.1058824, 1, 0, 1,
-0.4758074, 1.386807, 0.9428299, 0.09803922, 1, 0, 1,
-0.4731336, 0.4127131, 0.08032572, 0.09019608, 1, 0, 1,
-0.4718726, 0.4492823, 0.5115548, 0.08627451, 1, 0, 1,
-0.468932, 0.7050341, -1.306493, 0.07843138, 1, 0, 1,
-0.4621663, -0.8401006, -1.228661, 0.07450981, 1, 0, 1,
-0.4615694, -0.1459698, -2.272901, 0.06666667, 1, 0, 1,
-0.4572046, -1.410722, -1.984202, 0.0627451, 1, 0, 1,
-0.4560399, 0.5778374, -0.5273417, 0.05490196, 1, 0, 1,
-0.455016, -1.269406, -2.494974, 0.05098039, 1, 0, 1,
-0.4546633, -1.1145, -2.744349, 0.04313726, 1, 0, 1,
-0.4523534, 0.1811936, -1.155015, 0.03921569, 1, 0, 1,
-0.4479293, -0.7504286, -1.58627, 0.03137255, 1, 0, 1,
-0.4437848, 0.948227, -0.4889508, 0.02745098, 1, 0, 1,
-0.4407873, 1.802688, -1.097224, 0.01960784, 1, 0, 1,
-0.4386195, -0.295164, -3.185848, 0.01568628, 1, 0, 1,
-0.4325152, 1.031979, -0.1513608, 0.007843138, 1, 0, 1,
-0.4320411, -2.270851, -3.347039, 0.003921569, 1, 0, 1,
-0.4318882, 1.180508, -0.3172558, 0, 1, 0.003921569, 1,
-0.4313963, 0.5113041, -2.274576, 0, 1, 0.01176471, 1,
-0.4288794, 0.479113, -1.645576, 0, 1, 0.01568628, 1,
-0.4229689, 0.3075231, -2.497505, 0, 1, 0.02352941, 1,
-0.4223309, 0.4441444, -2.153462, 0, 1, 0.02745098, 1,
-0.4200134, -0.421457, -0.8141128, 0, 1, 0.03529412, 1,
-0.4156762, 1.382453, -0.869928, 0, 1, 0.03921569, 1,
-0.4136965, 1.563461, -0.1376499, 0, 1, 0.04705882, 1,
-0.4104836, 1.27023, -0.06607835, 0, 1, 0.05098039, 1,
-0.4098152, 0.5360332, -0.2333079, 0, 1, 0.05882353, 1,
-0.4096744, -0.1061845, -1.331729, 0, 1, 0.0627451, 1,
-0.4084714, 1.085499, -0.1014526, 0, 1, 0.07058824, 1,
-0.4047979, -0.707077, -2.989126, 0, 1, 0.07450981, 1,
-0.4010442, -1.51787, -3.826953, 0, 1, 0.08235294, 1,
-0.4009807, -1.080463, -2.241284, 0, 1, 0.08627451, 1,
-0.3987167, 0.9579416, -0.06183506, 0, 1, 0.09411765, 1,
-0.386868, 0.8833658, -0.419203, 0, 1, 0.1019608, 1,
-0.3806157, 0.9405299, 0.6473079, 0, 1, 0.1058824, 1,
-0.3802128, 0.1708607, -1.166688, 0, 1, 0.1137255, 1,
-0.3794067, 0.3364528, -0.8550457, 0, 1, 0.1176471, 1,
-0.3785538, -0.2232813, -3.029743, 0, 1, 0.1254902, 1,
-0.3764524, 2.142879, 1.440299, 0, 1, 0.1294118, 1,
-0.3754205, 1.791662, -0.09448313, 0, 1, 0.1372549, 1,
-0.3748972, -0.1826742, -0.3277257, 0, 1, 0.1411765, 1,
-0.3652761, 1.264842, 0.1466487, 0, 1, 0.1490196, 1,
-0.3589008, -0.5923547, -2.478825, 0, 1, 0.1529412, 1,
-0.3579894, 0.02165343, -1.279924, 0, 1, 0.1607843, 1,
-0.3567018, -0.6232123, -3.377148, 0, 1, 0.1647059, 1,
-0.3545971, -1.280125, -4.807803, 0, 1, 0.172549, 1,
-0.3532471, 1.475855, 1.163294, 0, 1, 0.1764706, 1,
-0.3457793, 0.04471262, -2.380419, 0, 1, 0.1843137, 1,
-0.3406555, 0.9920275, 0.700699, 0, 1, 0.1882353, 1,
-0.3368466, 0.8449735, -0.8597556, 0, 1, 0.1960784, 1,
-0.3345201, 1.609367, -0.2516747, 0, 1, 0.2039216, 1,
-0.3332286, 0.6808462, -1.222067, 0, 1, 0.2078431, 1,
-0.3323606, -2.195265, -3.416719, 0, 1, 0.2156863, 1,
-0.3302301, 0.6886902, -0.1508346, 0, 1, 0.2196078, 1,
-0.3255402, -0.717598, -2.666507, 0, 1, 0.227451, 1,
-0.3248938, 0.1678725, -0.9885122, 0, 1, 0.2313726, 1,
-0.323792, -1.377421, -4.256654, 0, 1, 0.2392157, 1,
-0.3230922, 1.16993, -2.166486, 0, 1, 0.2431373, 1,
-0.317692, -1.266, -3.488837, 0, 1, 0.2509804, 1,
-0.3152177, 0.7946448, -0.04302066, 0, 1, 0.254902, 1,
-0.314654, -0.9059647, -1.536877, 0, 1, 0.2627451, 1,
-0.3087653, -0.4342346, -1.554019, 0, 1, 0.2666667, 1,
-0.3074635, -0.307634, -2.880679, 0, 1, 0.2745098, 1,
-0.304777, -0.3731908, -2.083559, 0, 1, 0.2784314, 1,
-0.2982833, 1.884963, 0.3123983, 0, 1, 0.2862745, 1,
-0.297154, -1.440855, -2.835262, 0, 1, 0.2901961, 1,
-0.2883039, -1.995343, -3.740778, 0, 1, 0.2980392, 1,
-0.2839969, -1.202303, -1.973316, 0, 1, 0.3058824, 1,
-0.2831281, -0.6099898, -1.463387, 0, 1, 0.3098039, 1,
-0.2810572, 0.5115991, 1.219563, 0, 1, 0.3176471, 1,
-0.2794093, -0.485775, -4.446762, 0, 1, 0.3215686, 1,
-0.2791682, -0.5591674, -1.991408, 0, 1, 0.3294118, 1,
-0.2779144, -0.4164617, -3.153893, 0, 1, 0.3333333, 1,
-0.2750368, -0.1224432, -1.264525, 0, 1, 0.3411765, 1,
-0.2699675, 0.2974855, -0.5896845, 0, 1, 0.345098, 1,
-0.2696926, -0.4401289, -3.886456, 0, 1, 0.3529412, 1,
-0.2658634, -1.662792, -3.848841, 0, 1, 0.3568628, 1,
-0.2643578, 0.4618019, -2.232083, 0, 1, 0.3647059, 1,
-0.2643492, -1.439481, -3.159124, 0, 1, 0.3686275, 1,
-0.257127, -0.6523746, -4.822948, 0, 1, 0.3764706, 1,
-0.2556393, 1.008041, -0.5313672, 0, 1, 0.3803922, 1,
-0.2546267, 0.5614897, -0.6554689, 0, 1, 0.3882353, 1,
-0.2515663, 0.221207, -2.652229, 0, 1, 0.3921569, 1,
-0.2509268, -1.06269, -2.522538, 0, 1, 0.4, 1,
-0.2489627, 0.855785, 0.01247671, 0, 1, 0.4078431, 1,
-0.2464099, -0.0261606, 0.2783616, 0, 1, 0.4117647, 1,
-0.2448032, -0.3491544, -2.164671, 0, 1, 0.4196078, 1,
-0.2409469, -0.1308283, -3.630244, 0, 1, 0.4235294, 1,
-0.2393153, -0.6354675, -3.774863, 0, 1, 0.4313726, 1,
-0.2384978, 0.4959824, -1.180287, 0, 1, 0.4352941, 1,
-0.2376393, -0.8671271, -2.855569, 0, 1, 0.4431373, 1,
-0.2342475, -0.701782, -2.73175, 0, 1, 0.4470588, 1,
-0.233954, 0.1915292, -0.3601727, 0, 1, 0.454902, 1,
-0.2324293, -0.9861743, -4.741303, 0, 1, 0.4588235, 1,
-0.2241513, 0.6690689, 0.235538, 0, 1, 0.4666667, 1,
-0.2227654, 0.3140067, 1.061092, 0, 1, 0.4705882, 1,
-0.2217697, -0.7369907, -3.465248, 0, 1, 0.4784314, 1,
-0.218462, 0.8293806, 1.040726, 0, 1, 0.4823529, 1,
-0.2168154, 0.05508589, 0.1182598, 0, 1, 0.4901961, 1,
-0.2166969, -0.506062, -1.532533, 0, 1, 0.4941176, 1,
-0.2109567, 0.8710729, -0.2620044, 0, 1, 0.5019608, 1,
-0.2109197, 0.545247, -1.119775, 0, 1, 0.509804, 1,
-0.210571, 1.436915, -0.3390962, 0, 1, 0.5137255, 1,
-0.2105117, -0.2549046, -3.54161, 0, 1, 0.5215687, 1,
-0.2086833, 0.5476507, -1.235888, 0, 1, 0.5254902, 1,
-0.2001376, -1.197132, -3.207957, 0, 1, 0.5333334, 1,
-0.196161, 0.57715, -0.7295494, 0, 1, 0.5372549, 1,
-0.1957505, 0.6116307, 0.3880382, 0, 1, 0.5450981, 1,
-0.195361, 0.5711211, 0.6379376, 0, 1, 0.5490196, 1,
-0.1899245, -0.9376368, -2.365088, 0, 1, 0.5568628, 1,
-0.1876386, -3.529626, -4.488911, 0, 1, 0.5607843, 1,
-0.184082, -0.1774413, -2.894158, 0, 1, 0.5686275, 1,
-0.1815961, 1.241362, 0.1421034, 0, 1, 0.572549, 1,
-0.1812909, 0.7905249, -0.3589601, 0, 1, 0.5803922, 1,
-0.1800224, 0.3365568, 0.7124082, 0, 1, 0.5843138, 1,
-0.1792588, -0.9741961, -5.044248, 0, 1, 0.5921569, 1,
-0.1749095, 0.499456, -2.389677, 0, 1, 0.5960785, 1,
-0.1740305, 0.9206325, 0.5169416, 0, 1, 0.6039216, 1,
-0.172236, -0.7628326, -2.146441, 0, 1, 0.6117647, 1,
-0.1665479, 1.024185, 0.7637142, 0, 1, 0.6156863, 1,
-0.1652628, -0.8655828, -3.293524, 0, 1, 0.6235294, 1,
-0.1627212, 0.4515515, 1.665941, 0, 1, 0.627451, 1,
-0.1626546, -0.5346483, -2.888408, 0, 1, 0.6352941, 1,
-0.1590719, 0.7032214, -1.696465, 0, 1, 0.6392157, 1,
-0.1583072, 1.573763, 0.325939, 0, 1, 0.6470588, 1,
-0.1578845, 0.1967016, -0.6119083, 0, 1, 0.6509804, 1,
-0.1526643, 1.538286, 0.7579499, 0, 1, 0.6588235, 1,
-0.1470342, -0.1905164, -1.751696, 0, 1, 0.6627451, 1,
-0.1464749, -1.086232, -1.066807, 0, 1, 0.6705883, 1,
-0.1452046, 1.178256, -0.4398886, 0, 1, 0.6745098, 1,
-0.1438595, -0.1243051, -1.898121, 0, 1, 0.682353, 1,
-0.1399081, -0.7526261, -2.956691, 0, 1, 0.6862745, 1,
-0.1379777, 0.1950265, -1.103074, 0, 1, 0.6941177, 1,
-0.135067, 0.8798209, 1.659484, 0, 1, 0.7019608, 1,
-0.1337764, -1.235065, -3.03758, 0, 1, 0.7058824, 1,
-0.1308499, 0.4813432, -1.571027, 0, 1, 0.7137255, 1,
-0.1277385, 0.09680042, -1.814718, 0, 1, 0.7176471, 1,
-0.1271714, -1.129631, -5.067976, 0, 1, 0.7254902, 1,
-0.1230787, -1.347573, -2.449564, 0, 1, 0.7294118, 1,
-0.1219837, -0.4464844, -2.320095, 0, 1, 0.7372549, 1,
-0.1215243, 0.4105559, -0.7389305, 0, 1, 0.7411765, 1,
-0.1214852, 0.2834719, 0.3233432, 0, 1, 0.7490196, 1,
-0.1170997, 1.053916, 0.1860081, 0, 1, 0.7529412, 1,
-0.115903, 1.016996, -0.2799389, 0, 1, 0.7607843, 1,
-0.1144249, -1.253421, -2.961901, 0, 1, 0.7647059, 1,
-0.1140193, 0.07818361, -1.937336, 0, 1, 0.772549, 1,
-0.1117672, 0.7523241, 0.9275624, 0, 1, 0.7764706, 1,
-0.1116844, 0.6108728, -1.635054, 0, 1, 0.7843137, 1,
-0.1114242, -0.5250291, -2.46038, 0, 1, 0.7882353, 1,
-0.1062867, 0.6321821, -0.03459388, 0, 1, 0.7960784, 1,
-0.1046855, -0.4559756, -3.183264, 0, 1, 0.8039216, 1,
-0.1046714, 1.691068, 0.2276511, 0, 1, 0.8078431, 1,
-0.1007957, -1.004883, -2.157016, 0, 1, 0.8156863, 1,
-0.09939669, -0.6938085, -1.698985, 0, 1, 0.8196079, 1,
-0.09273419, -0.01385618, -0.2396016, 0, 1, 0.827451, 1,
-0.09130571, 1.097637, 0.920436, 0, 1, 0.8313726, 1,
-0.09112377, -1.084952, -2.750414, 0, 1, 0.8392157, 1,
-0.08749946, -0.5168396, -3.012473, 0, 1, 0.8431373, 1,
-0.08635535, 0.7040367, -0.774918, 0, 1, 0.8509804, 1,
-0.08632262, -0.266418, -2.043559, 0, 1, 0.854902, 1,
-0.07802889, 0.2705848, -0.9111729, 0, 1, 0.8627451, 1,
-0.07350283, 1.769116, -1.007937, 0, 1, 0.8666667, 1,
-0.07201318, -0.8548887, -4.984146, 0, 1, 0.8745098, 1,
-0.06776317, 1.720517, 0.7532192, 0, 1, 0.8784314, 1,
-0.05119971, 1.629502, 1.068078, 0, 1, 0.8862745, 1,
-0.04912296, -0.9258505, -1.629327, 0, 1, 0.8901961, 1,
-0.04757028, -1.44293, -1.793015, 0, 1, 0.8980392, 1,
-0.04161961, -0.8752201, -2.248502, 0, 1, 0.9058824, 1,
-0.04100442, 0.02748851, -3.082848, 0, 1, 0.9098039, 1,
-0.0374718, 0.222733, -1.45237, 0, 1, 0.9176471, 1,
-0.03556681, 0.08078969, 0.3193291, 0, 1, 0.9215686, 1,
-0.03401975, -0.4681974, -3.234666, 0, 1, 0.9294118, 1,
-0.03361214, 0.6357063, 0.9924878, 0, 1, 0.9333333, 1,
-0.03348957, 0.1721335, 0.5395604, 0, 1, 0.9411765, 1,
-0.03327526, -0.7556242, -4.115555, 0, 1, 0.945098, 1,
-0.03256533, 0.709103, -1.233796, 0, 1, 0.9529412, 1,
-0.03079005, -2.483701, -3.091406, 0, 1, 0.9568627, 1,
-0.01236644, -0.8413956, -4.661893, 0, 1, 0.9647059, 1,
-0.009799851, -0.6520165, -2.602345, 0, 1, 0.9686275, 1,
-0.008456714, -0.5123674, -3.007495, 0, 1, 0.9764706, 1,
-0.008141907, 0.3651319, 1.085499, 0, 1, 0.9803922, 1,
-0.004264036, -1.618983, -3.285561, 0, 1, 0.9882353, 1,
-0.001911908, 0.2108338, 0.9672086, 0, 1, 0.9921569, 1,
-0.001243885, -0.8834133, -3.346794, 0, 1, 1, 1,
0.007441516, -0.4096689, 2.244896, 0, 0.9921569, 1, 1,
0.008830211, 0.2581857, 0.5878145, 0, 0.9882353, 1, 1,
0.009858926, 0.2403157, 0.8179163, 0, 0.9803922, 1, 1,
0.0129615, 0.4110152, 0.4428147, 0, 0.9764706, 1, 1,
0.02071577, -0.329206, 2.820957, 0, 0.9686275, 1, 1,
0.02341757, 0.4979918, -0.5528871, 0, 0.9647059, 1, 1,
0.03614704, -0.6602587, 3.564013, 0, 0.9568627, 1, 1,
0.03703471, -0.6101632, 4.612056, 0, 0.9529412, 1, 1,
0.04350924, 0.888924, -1.377742, 0, 0.945098, 1, 1,
0.04539761, 0.5416805, 1.042274, 0, 0.9411765, 1, 1,
0.04729357, 0.3872558, -0.1772518, 0, 0.9333333, 1, 1,
0.05512752, -1.196613, 2.612038, 0, 0.9294118, 1, 1,
0.06374321, 0.100791, -0.6752164, 0, 0.9215686, 1, 1,
0.06555991, -1.060464, 4.402582, 0, 0.9176471, 1, 1,
0.06891598, 0.5005456, -0.5359948, 0, 0.9098039, 1, 1,
0.06941759, -0.4352642, 4.124331, 0, 0.9058824, 1, 1,
0.07030508, -1.177725, 3.367186, 0, 0.8980392, 1, 1,
0.07037824, 1.540543, 1.701193, 0, 0.8901961, 1, 1,
0.07107633, 1.701193, 0.3577467, 0, 0.8862745, 1, 1,
0.07132647, 0.4279446, 0.1328865, 0, 0.8784314, 1, 1,
0.07234333, -0.6998563, 2.817685, 0, 0.8745098, 1, 1,
0.07661352, 1.846088, -0.05569166, 0, 0.8666667, 1, 1,
0.07955097, -0.4067874, 4.063518, 0, 0.8627451, 1, 1,
0.0842971, 0.4550212, 1.617608, 0, 0.854902, 1, 1,
0.08790922, 0.647121, 1.596154, 0, 0.8509804, 1, 1,
0.09049813, -0.4535416, 2.161854, 0, 0.8431373, 1, 1,
0.09456833, -0.3624356, 3.112104, 0, 0.8392157, 1, 1,
0.09869775, 0.2723411, 1.448716, 0, 0.8313726, 1, 1,
0.09878838, 1.257283, -1.249205, 0, 0.827451, 1, 1,
0.1008561, -1.077016, 3.614269, 0, 0.8196079, 1, 1,
0.1011372, -0.8937854, 2.180031, 0, 0.8156863, 1, 1,
0.1037444, 1.20329, 0.1110372, 0, 0.8078431, 1, 1,
0.1039942, 0.3359452, -0.2771183, 0, 0.8039216, 1, 1,
0.1045188, -2.816314, 2.877252, 0, 0.7960784, 1, 1,
0.1052593, 0.6741188, 1.52613, 0, 0.7882353, 1, 1,
0.1112453, 0.5240133, -1.187423, 0, 0.7843137, 1, 1,
0.1121431, -1.421711, 1.431658, 0, 0.7764706, 1, 1,
0.1123292, -0.810956, 2.782717, 0, 0.772549, 1, 1,
0.1172391, 0.7975293, 0.6959087, 0, 0.7647059, 1, 1,
0.1183602, 0.8536591, -0.6734172, 0, 0.7607843, 1, 1,
0.1203582, -1.677655, 3.234599, 0, 0.7529412, 1, 1,
0.1211146, -1.017138, 2.268455, 0, 0.7490196, 1, 1,
0.1237786, -0.10694, 3.277977, 0, 0.7411765, 1, 1,
0.1252182, 0.4828359, 0.5429211, 0, 0.7372549, 1, 1,
0.1313739, 0.5781587, -0.7588648, 0, 0.7294118, 1, 1,
0.139811, 1.342823, -0.1365832, 0, 0.7254902, 1, 1,
0.1441241, -0.1856593, 2.270835, 0, 0.7176471, 1, 1,
0.1474396, -0.5639347, 2.180088, 0, 0.7137255, 1, 1,
0.1491204, 1.707441, 0.2878036, 0, 0.7058824, 1, 1,
0.1526766, -0.5819027, 3.645816, 0, 0.6980392, 1, 1,
0.1532726, 0.3393548, -0.9874156, 0, 0.6941177, 1, 1,
0.1571015, 1.700313, -0.2140221, 0, 0.6862745, 1, 1,
0.1602782, 0.8225093, 0.3116527, 0, 0.682353, 1, 1,
0.1650798, -1.169046, 3.467232, 0, 0.6745098, 1, 1,
0.1664463, 1.45063, 0.005672096, 0, 0.6705883, 1, 1,
0.1665877, -1.182824, 3.88103, 0, 0.6627451, 1, 1,
0.1699588, 0.4463602, 2.456096, 0, 0.6588235, 1, 1,
0.1763954, 0.7365786, 1.55444, 0, 0.6509804, 1, 1,
0.179089, -0.004095047, 3.207186, 0, 0.6470588, 1, 1,
0.1811669, -0.4396574, 2.994853, 0, 0.6392157, 1, 1,
0.1823502, 0.1568293, 1.670644, 0, 0.6352941, 1, 1,
0.1840629, -0.2349161, 4.8722, 0, 0.627451, 1, 1,
0.1933369, 1.803158, -0.5402626, 0, 0.6235294, 1, 1,
0.1943465, -0.6775021, 1.946586, 0, 0.6156863, 1, 1,
0.1977831, 1.125274, 0.1725464, 0, 0.6117647, 1, 1,
0.1987879, -2.477848, 2.425899, 0, 0.6039216, 1, 1,
0.2003225, 0.2089491, 1.18779, 0, 0.5960785, 1, 1,
0.2036048, 3.276801, -0.4934777, 0, 0.5921569, 1, 1,
0.2111383, -1.171855, 3.547818, 0, 0.5843138, 1, 1,
0.2127832, 0.8223017, -0.6274475, 0, 0.5803922, 1, 1,
0.212815, -0.5019093, 3.303269, 0, 0.572549, 1, 1,
0.2139219, 0.4136091, 0.9357015, 0, 0.5686275, 1, 1,
0.2189983, -1.119329, 3.910262, 0, 0.5607843, 1, 1,
0.2199563, 1.094465, -0.4210595, 0, 0.5568628, 1, 1,
0.2214827, -0.9791051, 4.86396, 0, 0.5490196, 1, 1,
0.2231399, -0.885946, 3.047308, 0, 0.5450981, 1, 1,
0.2234547, -1.628932, 3.634789, 0, 0.5372549, 1, 1,
0.2247916, -2.089028, 2.319184, 0, 0.5333334, 1, 1,
0.2248774, -0.5341525, 4.266065, 0, 0.5254902, 1, 1,
0.225132, 0.002838632, 3.553175, 0, 0.5215687, 1, 1,
0.2262453, 0.09272601, 1.778823, 0, 0.5137255, 1, 1,
0.2355374, 0.6959665, 0.1358625, 0, 0.509804, 1, 1,
0.236387, -1.092386, 3.069751, 0, 0.5019608, 1, 1,
0.2370139, -0.1583913, 4.630054, 0, 0.4941176, 1, 1,
0.2386959, -0.5123489, 3.422496, 0, 0.4901961, 1, 1,
0.2425255, -1.044291, 0.3056738, 0, 0.4823529, 1, 1,
0.247562, -0.1399993, 2.835101, 0, 0.4784314, 1, 1,
0.2503931, 1.585197, -0.3141972, 0, 0.4705882, 1, 1,
0.2512041, -1.304856, 0.8996704, 0, 0.4666667, 1, 1,
0.2529469, 0.3194092, 1.273265, 0, 0.4588235, 1, 1,
0.2565221, 0.5836737, -0.4773798, 0, 0.454902, 1, 1,
0.2608833, 0.2069732, 0.5842232, 0, 0.4470588, 1, 1,
0.2625926, 0.3829187, 0.5926947, 0, 0.4431373, 1, 1,
0.2662906, -0.1077652, 1.100957, 0, 0.4352941, 1, 1,
0.2695707, 0.6018199, 1.311079, 0, 0.4313726, 1, 1,
0.2698574, 0.5118987, 1.772586, 0, 0.4235294, 1, 1,
0.2699421, -0.1839717, 0.9341353, 0, 0.4196078, 1, 1,
0.2710472, 0.001864084, 0.9885443, 0, 0.4117647, 1, 1,
0.2776013, 0.4547403, 1.936305, 0, 0.4078431, 1, 1,
0.2819537, -0.4366391, 2.761124, 0, 0.4, 1, 1,
0.2869195, -0.5354223, 2.424115, 0, 0.3921569, 1, 1,
0.2908333, 0.3751065, 1.019638, 0, 0.3882353, 1, 1,
0.2942421, 0.7258257, 2.055576, 0, 0.3803922, 1, 1,
0.2969045, -1.483508, 5.055613, 0, 0.3764706, 1, 1,
0.2981842, 0.177475, 0.529693, 0, 0.3686275, 1, 1,
0.2985051, -0.3160712, 5.437078, 0, 0.3647059, 1, 1,
0.3006646, -0.1157103, 2.183463, 0, 0.3568628, 1, 1,
0.3014729, -0.1468555, 1.841339, 0, 0.3529412, 1, 1,
0.3017752, 0.504078, 1.418996, 0, 0.345098, 1, 1,
0.3048814, 2.048993, 0.008986386, 0, 0.3411765, 1, 1,
0.3057426, 0.3268587, 0.3271593, 0, 0.3333333, 1, 1,
0.3066195, 1.318505, -1.230728, 0, 0.3294118, 1, 1,
0.310726, 0.4915192, 0.6697156, 0, 0.3215686, 1, 1,
0.3173152, -1.134018, 2.636637, 0, 0.3176471, 1, 1,
0.3181025, -0.1677532, 2.439301, 0, 0.3098039, 1, 1,
0.3211916, -0.3237018, 3.208377, 0, 0.3058824, 1, 1,
0.3218959, 0.04226165, 2.062658, 0, 0.2980392, 1, 1,
0.3228543, 0.8090695, 0.2165333, 0, 0.2901961, 1, 1,
0.3254548, -0.05350805, 1.087652, 0, 0.2862745, 1, 1,
0.3261268, -0.7840186, 3.695406, 0, 0.2784314, 1, 1,
0.3268504, 0.7413616, 1.076395, 0, 0.2745098, 1, 1,
0.331743, -1.076131, 3.001673, 0, 0.2666667, 1, 1,
0.3336981, -0.7673255, 0.8206533, 0, 0.2627451, 1, 1,
0.3342495, -2.944874, 3.361964, 0, 0.254902, 1, 1,
0.3353232, 1.793829, 1.103382, 0, 0.2509804, 1, 1,
0.3356397, -1.083408, 2.516158, 0, 0.2431373, 1, 1,
0.3358147, 1.245504, 1.096356, 0, 0.2392157, 1, 1,
0.3468516, 1.588155, -0.0415913, 0, 0.2313726, 1, 1,
0.3472614, 0.6720284, 0.2288102, 0, 0.227451, 1, 1,
0.3488714, -1.616399, 4.136534, 0, 0.2196078, 1, 1,
0.3545442, 0.04826207, -0.187092, 0, 0.2156863, 1, 1,
0.3555174, -0.2539015, 3.858966, 0, 0.2078431, 1, 1,
0.3560312, -0.6923793, 3.658487, 0, 0.2039216, 1, 1,
0.3640587, -1.331825, 1.933304, 0, 0.1960784, 1, 1,
0.3653179, 1.048366, -0.2209011, 0, 0.1882353, 1, 1,
0.3672573, -0.5185106, 2.542954, 0, 0.1843137, 1, 1,
0.3708454, 0.4108427, -0.9907483, 0, 0.1764706, 1, 1,
0.3723246, -1.208464, 3.754997, 0, 0.172549, 1, 1,
0.373565, 0.3178704, 2.496288, 0, 0.1647059, 1, 1,
0.3763387, 0.0292657, 1.460947, 0, 0.1607843, 1, 1,
0.3771066, -0.7067997, 2.261408, 0, 0.1529412, 1, 1,
0.3788999, -1.167198, 2.978079, 0, 0.1490196, 1, 1,
0.3793647, -0.04704107, 1.924193, 0, 0.1411765, 1, 1,
0.3798162, 1.315968, 1.262171, 0, 0.1372549, 1, 1,
0.3821859, 1.222123, -0.8424345, 0, 0.1294118, 1, 1,
0.3846967, -0.8781894, 1.380975, 0, 0.1254902, 1, 1,
0.3952455, -1.536169, 3.765024, 0, 0.1176471, 1, 1,
0.3993335, -0.5957646, 2.218214, 0, 0.1137255, 1, 1,
0.4007996, 0.8183257, 0.7472931, 0, 0.1058824, 1, 1,
0.4105055, -0.1086617, 0.803825, 0, 0.09803922, 1, 1,
0.415144, -1.046371, 3.609777, 0, 0.09411765, 1, 1,
0.4170904, -0.4245524, 3.214149, 0, 0.08627451, 1, 1,
0.4238097, -1.24132, 1.946605, 0, 0.08235294, 1, 1,
0.4283924, 0.5566005, 1.896485, 0, 0.07450981, 1, 1,
0.4301345, 0.6809571, 1.339191, 0, 0.07058824, 1, 1,
0.430308, 0.4556611, 1.448865, 0, 0.0627451, 1, 1,
0.4353566, -1.410778, 1.77903, 0, 0.05882353, 1, 1,
0.4353787, -0.2491324, 1.276965, 0, 0.05098039, 1, 1,
0.437503, 0.989102, -0.5068319, 0, 0.04705882, 1, 1,
0.4415837, -0.8903739, 3.499271, 0, 0.03921569, 1, 1,
0.4425551, 1.703934, 0.8031315, 0, 0.03529412, 1, 1,
0.4479839, -1.686836, 3.617877, 0, 0.02745098, 1, 1,
0.4503498, -0.6908503, 2.711593, 0, 0.02352941, 1, 1,
0.4561689, 0.2042483, 0.7264473, 0, 0.01568628, 1, 1,
0.4578644, 0.542937, 1.107713, 0, 0.01176471, 1, 1,
0.4579426, 2.930098, -0.266179, 0, 0.003921569, 1, 1,
0.4592777, -0.7065284, 4.369063, 0.003921569, 0, 1, 1,
0.4594753, 0.08980557, 1.718545, 0.007843138, 0, 1, 1,
0.4673295, -0.07809858, 2.569973, 0.01568628, 0, 1, 1,
0.4676179, -0.5213035, 2.187743, 0.01960784, 0, 1, 1,
0.4684622, 0.3630694, -0.4237943, 0.02745098, 0, 1, 1,
0.4690409, -1.418849, 2.552261, 0.03137255, 0, 1, 1,
0.4705654, -0.9638379, 2.84706, 0.03921569, 0, 1, 1,
0.4718934, -2.044109, 3.47474, 0.04313726, 0, 1, 1,
0.4742889, -0.5140193, 4.483247, 0.05098039, 0, 1, 1,
0.4766046, -0.02720696, 2.820876, 0.05490196, 0, 1, 1,
0.477703, -0.3458209, 3.911884, 0.0627451, 0, 1, 1,
0.4823062, -0.1139227, 1.113404, 0.06666667, 0, 1, 1,
0.4856683, 2.37316, 1.096345, 0.07450981, 0, 1, 1,
0.4859089, 1.751685, -0.3062262, 0.07843138, 0, 1, 1,
0.4879682, -1.20158, 2.650034, 0.08627451, 0, 1, 1,
0.4918894, 0.01664139, 0.4735358, 0.09019608, 0, 1, 1,
0.4941869, 1.426006, -0.284024, 0.09803922, 0, 1, 1,
0.4951755, 1.054658, -0.03923655, 0.1058824, 0, 1, 1,
0.4976378, 1.960624, 0.8430364, 0.1098039, 0, 1, 1,
0.505634, 2.496584, 0.5525315, 0.1176471, 0, 1, 1,
0.5158312, -0.5385841, 2.646128, 0.1215686, 0, 1, 1,
0.5167593, 0.483643, 2.788874, 0.1294118, 0, 1, 1,
0.5184713, 0.04745037, 1.742514, 0.1333333, 0, 1, 1,
0.5189924, 1.297286, -0.1031223, 0.1411765, 0, 1, 1,
0.5264182, -0.9068184, 0.790116, 0.145098, 0, 1, 1,
0.5266409, -0.3321097, 2.117981, 0.1529412, 0, 1, 1,
0.5267435, -0.8040248, 2.905387, 0.1568628, 0, 1, 1,
0.5280391, 0.8652382, 0.05416201, 0.1647059, 0, 1, 1,
0.5292823, 0.6297424, 0.06444225, 0.1686275, 0, 1, 1,
0.5312178, -1.359249, 3.834494, 0.1764706, 0, 1, 1,
0.5345312, 0.6595634, -0.6719283, 0.1803922, 0, 1, 1,
0.5351914, -0.6376151, 3.303976, 0.1882353, 0, 1, 1,
0.539139, -0.2668044, 0.7987213, 0.1921569, 0, 1, 1,
0.547927, -0.8442979, 3.426974, 0.2, 0, 1, 1,
0.5501547, 0.2979761, 2.170067, 0.2078431, 0, 1, 1,
0.5515968, -0.3201766, 1.901301, 0.2117647, 0, 1, 1,
0.5517719, -1.192576, 0.1955913, 0.2196078, 0, 1, 1,
0.5536033, 0.2374764, 0.5040379, 0.2235294, 0, 1, 1,
0.5580308, 0.8176731, 1.093211, 0.2313726, 0, 1, 1,
0.5583915, 1.102174, -0.1295422, 0.2352941, 0, 1, 1,
0.5585989, 1.781834, -0.7662055, 0.2431373, 0, 1, 1,
0.5589103, -0.01353369, 4.150242, 0.2470588, 0, 1, 1,
0.5616069, 2.153338, -0.1467083, 0.254902, 0, 1, 1,
0.5632831, 0.6547199, -0.08009912, 0.2588235, 0, 1, 1,
0.5637635, -0.1558241, 2.106396, 0.2666667, 0, 1, 1,
0.5645171, -1.424456, 2.880929, 0.2705882, 0, 1, 1,
0.5648154, 0.1516414, 1.102633, 0.2784314, 0, 1, 1,
0.5722756, 0.03129756, 1.971135, 0.282353, 0, 1, 1,
0.5734934, 0.4890465, 0.3582325, 0.2901961, 0, 1, 1,
0.5766262, 1.902062, 0.6434081, 0.2941177, 0, 1, 1,
0.5791267, -0.1221615, 1.782674, 0.3019608, 0, 1, 1,
0.5793355, 0.01728551, 1.015489, 0.3098039, 0, 1, 1,
0.5799393, 0.4399246, -0.4260897, 0.3137255, 0, 1, 1,
0.5818631, 1.83869, -0.4986196, 0.3215686, 0, 1, 1,
0.5832764, 2.274533, 1.484656, 0.3254902, 0, 1, 1,
0.5869153, 0.226275, 0.7918833, 0.3333333, 0, 1, 1,
0.5890492, 1.932142, 0.05071307, 0.3372549, 0, 1, 1,
0.5905077, -0.5327299, 1.718229, 0.345098, 0, 1, 1,
0.5934853, -0.5172873, 1.582682, 0.3490196, 0, 1, 1,
0.5973883, 0.06067544, 0.6737696, 0.3568628, 0, 1, 1,
0.598545, -0.9201453, 3.850925, 0.3607843, 0, 1, 1,
0.5991055, 0.4807791, 2.723665, 0.3686275, 0, 1, 1,
0.5996549, 0.04990325, 1.082164, 0.372549, 0, 1, 1,
0.606444, 0.07170238, 1.307479, 0.3803922, 0, 1, 1,
0.6112142, 0.2928518, -0.390381, 0.3843137, 0, 1, 1,
0.611914, -1.076833, 3.86082, 0.3921569, 0, 1, 1,
0.6142214, 1.110936, -0.3922846, 0.3960784, 0, 1, 1,
0.6163896, -1.066879, 3.16665, 0.4039216, 0, 1, 1,
0.6236876, 0.4721537, 1.642318, 0.4117647, 0, 1, 1,
0.6242756, 1.217588, -1.017548, 0.4156863, 0, 1, 1,
0.6258137, 0.667218, 0.4058609, 0.4235294, 0, 1, 1,
0.627632, -1.123992, 1.629064, 0.427451, 0, 1, 1,
0.6292343, -0.2869042, 1.575884, 0.4352941, 0, 1, 1,
0.6298092, -1.349931, 3.27548, 0.4392157, 0, 1, 1,
0.6311639, -2.210855, 3.853453, 0.4470588, 0, 1, 1,
0.6321835, 0.745342, -0.8982086, 0.4509804, 0, 1, 1,
0.6351401, 1.280039, 1.234874, 0.4588235, 0, 1, 1,
0.6354668, 1.618053, -1.120758, 0.4627451, 0, 1, 1,
0.6358404, 0.6452827, 1.1093, 0.4705882, 0, 1, 1,
0.6373453, -1.10191, 2.722356, 0.4745098, 0, 1, 1,
0.6374601, -0.4990506, 1.94396, 0.4823529, 0, 1, 1,
0.6390498, 1.166803, 0.9123612, 0.4862745, 0, 1, 1,
0.6392497, 0.7818303, 1.220433, 0.4941176, 0, 1, 1,
0.6418647, 0.970934, -0.6545114, 0.5019608, 0, 1, 1,
0.6442776, 0.0844412, 2.304629, 0.5058824, 0, 1, 1,
0.647453, -3.141653, 1.751904, 0.5137255, 0, 1, 1,
0.6503891, -0.3568486, 0.865326, 0.5176471, 0, 1, 1,
0.6505917, 0.3443584, -1.147019, 0.5254902, 0, 1, 1,
0.6542143, -0.3464752, 1.929515, 0.5294118, 0, 1, 1,
0.6556804, 1.461762, 1.241498, 0.5372549, 0, 1, 1,
0.6567985, -0.4656713, 3.897181, 0.5411765, 0, 1, 1,
0.6586779, -1.863852, 4.592408, 0.5490196, 0, 1, 1,
0.664238, 0.7479044, -0.5837044, 0.5529412, 0, 1, 1,
0.6650996, -1.941397, 3.359307, 0.5607843, 0, 1, 1,
0.6694937, 0.183151, 0.8554833, 0.5647059, 0, 1, 1,
0.6744012, 0.8611615, 1.85172, 0.572549, 0, 1, 1,
0.6767775, -0.9001583, 2.714556, 0.5764706, 0, 1, 1,
0.6796157, -0.2095005, 1.558423, 0.5843138, 0, 1, 1,
0.6809856, 0.4955821, 1.615166, 0.5882353, 0, 1, 1,
0.681442, -1.307692, 3.548254, 0.5960785, 0, 1, 1,
0.6829661, -0.2719765, 2.15668, 0.6039216, 0, 1, 1,
0.6862057, -1.003271, 3.08492, 0.6078432, 0, 1, 1,
0.6887804, -0.5501591, 1.255661, 0.6156863, 0, 1, 1,
0.6897101, 0.8504626, 1.082231, 0.6196079, 0, 1, 1,
0.6925384, -0.8260684, 2.628456, 0.627451, 0, 1, 1,
0.7002174, -1.771271, 2.399937, 0.6313726, 0, 1, 1,
0.7020127, 1.597311, 0.8747577, 0.6392157, 0, 1, 1,
0.7149506, 1.781479, -1.471646, 0.6431373, 0, 1, 1,
0.7170432, 0.4236766, 0.8655965, 0.6509804, 0, 1, 1,
0.7174619, 0.4287546, 1.452456, 0.654902, 0, 1, 1,
0.7175912, -0.3879954, 5.139893, 0.6627451, 0, 1, 1,
0.7260004, 0.5071617, 1.805371, 0.6666667, 0, 1, 1,
0.7309264, 0.1490347, -0.4287389, 0.6745098, 0, 1, 1,
0.7316679, -1.049339, 2.489572, 0.6784314, 0, 1, 1,
0.7326187, 0.149983, 0.8054825, 0.6862745, 0, 1, 1,
0.7354097, 0.2390178, 1.740019, 0.6901961, 0, 1, 1,
0.7378891, 1.041518, 0.7345582, 0.6980392, 0, 1, 1,
0.7450362, -0.9795923, 4.145415, 0.7058824, 0, 1, 1,
0.7488257, 0.2222534, 2.992165, 0.7098039, 0, 1, 1,
0.7510876, -0.2604251, 2.967253, 0.7176471, 0, 1, 1,
0.7645953, -0.06434098, 1.970651, 0.7215686, 0, 1, 1,
0.765725, -1.078431, 2.857723, 0.7294118, 0, 1, 1,
0.7691503, -0.5733298, 2.708228, 0.7333333, 0, 1, 1,
0.769297, -0.9203929, 1.132149, 0.7411765, 0, 1, 1,
0.7772984, -0.4635828, 2.176807, 0.7450981, 0, 1, 1,
0.7801202, 0.2266711, -0.1716217, 0.7529412, 0, 1, 1,
0.7807892, -2.178231, 1.928321, 0.7568628, 0, 1, 1,
0.7858862, 0.7859927, 0.6431264, 0.7647059, 0, 1, 1,
0.7961924, 0.660481, 2.340933, 0.7686275, 0, 1, 1,
0.8018957, -0.06293234, 1.485492, 0.7764706, 0, 1, 1,
0.8087915, -0.4941421, 1.412252, 0.7803922, 0, 1, 1,
0.8107316, -1.310292, 2.868165, 0.7882353, 0, 1, 1,
0.8161727, 0.4576046, 1.279724, 0.7921569, 0, 1, 1,
0.8207909, -0.4458679, 1.186918, 0.8, 0, 1, 1,
0.8211461, 1.320736, 1.879983, 0.8078431, 0, 1, 1,
0.8230248, -2.715452, 5.536583, 0.8117647, 0, 1, 1,
0.8240178, 1.28047, 0.0329867, 0.8196079, 0, 1, 1,
0.8347872, -0.7733319, 0.9936967, 0.8235294, 0, 1, 1,
0.8357258, -2.144638, 1.775744, 0.8313726, 0, 1, 1,
0.8365326, -0.09156802, 0.9295647, 0.8352941, 0, 1, 1,
0.8403377, -2.405175, 2.028586, 0.8431373, 0, 1, 1,
0.8432744, 0.8792091, 1.902441, 0.8470588, 0, 1, 1,
0.8469267, 1.016939, 1.456518, 0.854902, 0, 1, 1,
0.8482106, 0.4629984, 2.119583, 0.8588235, 0, 1, 1,
0.8527112, -0.8185312, 1.736303, 0.8666667, 0, 1, 1,
0.8550136, 0.3435282, 0.7236216, 0.8705882, 0, 1, 1,
0.8604518, -0.626329, 0.6550068, 0.8784314, 0, 1, 1,
0.8610225, 0.8040187, 2.637159, 0.8823529, 0, 1, 1,
0.8665932, 0.03465979, 2.4939, 0.8901961, 0, 1, 1,
0.8682612, -0.1265526, 0.4831555, 0.8941177, 0, 1, 1,
0.8689903, -0.5405325, 0.6062456, 0.9019608, 0, 1, 1,
0.8723005, -0.02531513, 2.38288, 0.9098039, 0, 1, 1,
0.872743, 0.02173089, 0.5146948, 0.9137255, 0, 1, 1,
0.872982, 0.7150212, -0.1002622, 0.9215686, 0, 1, 1,
0.8765556, 0.08827808, 3.334334, 0.9254902, 0, 1, 1,
0.8775886, 0.3562705, 2.176802, 0.9333333, 0, 1, 1,
0.8787995, -2.138172, 2.674629, 0.9372549, 0, 1, 1,
0.880207, -0.07228848, 2.265412, 0.945098, 0, 1, 1,
0.8855964, -0.3885374, 2.330639, 0.9490196, 0, 1, 1,
0.886978, -0.515386, 1.437356, 0.9568627, 0, 1, 1,
0.8917728, 1.288859, 0.5791838, 0.9607843, 0, 1, 1,
0.894356, 0.7370623, 1.44942, 0.9686275, 0, 1, 1,
0.9005427, -0.8468533, 2.058546, 0.972549, 0, 1, 1,
0.9158579, 0.01495054, 1.037208, 0.9803922, 0, 1, 1,
0.9224212, 0.5497517, 1.552706, 0.9843137, 0, 1, 1,
0.9305511, 1.061371, -0.1136295, 0.9921569, 0, 1, 1,
0.9312963, -0.9641474, 2.418432, 0.9960784, 0, 1, 1,
0.9416294, 1.001193, -0.8773262, 1, 0, 0.9960784, 1,
0.9447454, -0.6453794, 2.203268, 1, 0, 0.9882353, 1,
0.9481035, -1.062152, 1.338525, 1, 0, 0.9843137, 1,
0.9490162, -0.6098648, 2.038534, 1, 0, 0.9764706, 1,
0.95025, -0.5006818, 3.648338, 1, 0, 0.972549, 1,
0.9543777, 1.1766, 0.2467029, 1, 0, 0.9647059, 1,
0.9601993, 1.455643, 0.719318, 1, 0, 0.9607843, 1,
0.9714408, 0.7214054, 0.4188959, 1, 0, 0.9529412, 1,
0.9740811, 0.732483, -1.564191, 1, 0, 0.9490196, 1,
0.9756973, -1.312096, 2.065659, 1, 0, 0.9411765, 1,
0.9821441, 0.9892046, 0.05349315, 1, 0, 0.9372549, 1,
0.9851114, -0.4575495, 3.58651, 1, 0, 0.9294118, 1,
0.9852425, 0.9044452, 1.705975, 1, 0, 0.9254902, 1,
0.9874389, 1.609012, 1.679199, 1, 0, 0.9176471, 1,
0.9890258, 0.3579308, 2.66006, 1, 0, 0.9137255, 1,
0.9907844, 0.8495555, 1.365326, 1, 0, 0.9058824, 1,
0.9914403, 0.3862324, 0.671797, 1, 0, 0.9019608, 1,
0.9916799, -0.8930874, 3.531871, 1, 0, 0.8941177, 1,
0.9916807, -0.5526504, 2.075552, 1, 0, 0.8862745, 1,
0.9941501, 2.637351, 1.793088, 1, 0, 0.8823529, 1,
0.9985921, -1.608062, 0.9636803, 1, 0, 0.8745098, 1,
1.000568, 0.2498848, 1.566555, 1, 0, 0.8705882, 1,
1.000569, 0.305235, 0.7922821, 1, 0, 0.8627451, 1,
1.007766, 0.4055838, 0.7378384, 1, 0, 0.8588235, 1,
1.009908, 0.4704324, 2.137081, 1, 0, 0.8509804, 1,
1.017305, -2.11332, 2.566605, 1, 0, 0.8470588, 1,
1.021614, 1.255768, 1.746003, 1, 0, 0.8392157, 1,
1.022611, 0.2600802, -0.551955, 1, 0, 0.8352941, 1,
1.028301, 0.5410036, 1.154011, 1, 0, 0.827451, 1,
1.034526, 1.145238, 0.7481878, 1, 0, 0.8235294, 1,
1.037567, 2.029814, 0.534277, 1, 0, 0.8156863, 1,
1.050322, 0.5142625, 1.184294, 1, 0, 0.8117647, 1,
1.053317, -0.6866702, 2.280219, 1, 0, 0.8039216, 1,
1.071633, -0.1880071, 0.6710395, 1, 0, 0.7960784, 1,
1.07227, -1.514789, 2.290888, 1, 0, 0.7921569, 1,
1.072565, -0.7687743, 0.9080809, 1, 0, 0.7843137, 1,
1.072668, -1.184811, 2.215083, 1, 0, 0.7803922, 1,
1.078641, 0.7870864, 0.3818917, 1, 0, 0.772549, 1,
1.085074, 0.03421359, -0.2561928, 1, 0, 0.7686275, 1,
1.085522, 0.9883885, 2.937505, 1, 0, 0.7607843, 1,
1.089478, 0.1401316, 1.608726, 1, 0, 0.7568628, 1,
1.092089, -1.95963, 3.098637, 1, 0, 0.7490196, 1,
1.112297, -1.134395, 2.554675, 1, 0, 0.7450981, 1,
1.12287, 0.1527954, 0.88337, 1, 0, 0.7372549, 1,
1.123476, 2.125839, 0.05029382, 1, 0, 0.7333333, 1,
1.126275, 0.247566, 2.524211, 1, 0, 0.7254902, 1,
1.133759, -2.174799, 1.87545, 1, 0, 0.7215686, 1,
1.1342, 3.388402, -1.239519, 1, 0, 0.7137255, 1,
1.134697, -1.298099, 3.516152, 1, 0, 0.7098039, 1,
1.140452, 0.9393894, 1.285727, 1, 0, 0.7019608, 1,
1.146812, 0.01547984, 2.25856, 1, 0, 0.6941177, 1,
1.148815, 1.044635, 0.6920785, 1, 0, 0.6901961, 1,
1.150379, 0.3110241, 1.761371, 1, 0, 0.682353, 1,
1.155578, 1.974183, -1.973365, 1, 0, 0.6784314, 1,
1.15933, 1.799842, 0.3962363, 1, 0, 0.6705883, 1,
1.183724, -0.1669466, 0.345694, 1, 0, 0.6666667, 1,
1.187021, 0.842813, 1.874173, 1, 0, 0.6588235, 1,
1.196541, -0.446186, 1.082851, 1, 0, 0.654902, 1,
1.200205, -0.6935934, 2.789734, 1, 0, 0.6470588, 1,
1.216209, -0.9255855, -0.5326097, 1, 0, 0.6431373, 1,
1.221807, 0.4637992, 1.309541, 1, 0, 0.6352941, 1,
1.223848, 0.5632001, 1.386473, 1, 0, 0.6313726, 1,
1.23132, -2.429255, 2.2892, 1, 0, 0.6235294, 1,
1.235631, -1.327581, 1.627185, 1, 0, 0.6196079, 1,
1.242297, 2.506078, -1.205246, 1, 0, 0.6117647, 1,
1.255192, -0.4579308, 2.480004, 1, 0, 0.6078432, 1,
1.273329, 0.4685491, 1.439974, 1, 0, 0.6, 1,
1.280578, 0.0956026, 0.8886622, 1, 0, 0.5921569, 1,
1.281423, -0.4539017, 1.677022, 1, 0, 0.5882353, 1,
1.281877, -1.915293, 2.678129, 1, 0, 0.5803922, 1,
1.282664, -0.835642, 0.6965058, 1, 0, 0.5764706, 1,
1.287034, -2.102069, 1.260884, 1, 0, 0.5686275, 1,
1.288935, 0.3431118, 0.4933925, 1, 0, 0.5647059, 1,
1.28918, -1.611575, 3.145002, 1, 0, 0.5568628, 1,
1.296173, 0.2727792, 2.454519, 1, 0, 0.5529412, 1,
1.304244, -1.321404, 3.790179, 1, 0, 0.5450981, 1,
1.306021, -1.040082, 3.828899, 1, 0, 0.5411765, 1,
1.307313, 0.8229899, 0.2236588, 1, 0, 0.5333334, 1,
1.32158, 0.2344723, 2.445739, 1, 0, 0.5294118, 1,
1.322215, 0.7210624, 1.173293, 1, 0, 0.5215687, 1,
1.332853, -0.7316499, 5.050207, 1, 0, 0.5176471, 1,
1.336272, 0.4764512, 0.1937067, 1, 0, 0.509804, 1,
1.346199, 1.482555, 0.8696038, 1, 0, 0.5058824, 1,
1.350304, -0.8494326, 1.439663, 1, 0, 0.4980392, 1,
1.362285, 0.1869205, -0.1068611, 1, 0, 0.4901961, 1,
1.365503, -0.4654963, 0.5282766, 1, 0, 0.4862745, 1,
1.382849, -0.6028198, 3.506467, 1, 0, 0.4784314, 1,
1.383289, 1.705796, 0.06081574, 1, 0, 0.4745098, 1,
1.387674, 0.08303811, -0.5835721, 1, 0, 0.4666667, 1,
1.389864, 0.08633024, -0.7209969, 1, 0, 0.4627451, 1,
1.413531, -0.6430578, 2.393091, 1, 0, 0.454902, 1,
1.413883, -1.484203, 2.362385, 1, 0, 0.4509804, 1,
1.423702, 0.5931205, 0.9290469, 1, 0, 0.4431373, 1,
1.449266, -0.1109394, 0.6019283, 1, 0, 0.4392157, 1,
1.451633, 1.767231, 1.968946, 1, 0, 0.4313726, 1,
1.462016, -0.3979464, 1.949694, 1, 0, 0.427451, 1,
1.467791, -0.07695237, 3.775567, 1, 0, 0.4196078, 1,
1.485955, 0.4805329, 1.976006, 1, 0, 0.4156863, 1,
1.494705, 0.8694566, 1.260036, 1, 0, 0.4078431, 1,
1.494769, 1.364745, 1.238097, 1, 0, 0.4039216, 1,
1.495893, -0.05030281, 2.798123, 1, 0, 0.3960784, 1,
1.505411, 0.07520267, 2.539224, 1, 0, 0.3882353, 1,
1.506802, 3.029874, 0.8193179, 1, 0, 0.3843137, 1,
1.510358, -0.9558488, 1.882854, 1, 0, 0.3764706, 1,
1.51671, -0.8131517, 0.9444751, 1, 0, 0.372549, 1,
1.52229, 1.284765, -0.3020058, 1, 0, 0.3647059, 1,
1.542709, 0.03832245, 1.528844, 1, 0, 0.3607843, 1,
1.542856, -0.8665211, 1.259889, 1, 0, 0.3529412, 1,
1.54611, -2.132599, 2.084477, 1, 0, 0.3490196, 1,
1.548216, -0.2092739, 0.5926946, 1, 0, 0.3411765, 1,
1.571592, 0.7082346, -0.602053, 1, 0, 0.3372549, 1,
1.571708, 0.3923756, -0.275999, 1, 0, 0.3294118, 1,
1.632651, -1.134973, 0.5502387, 1, 0, 0.3254902, 1,
1.63315, 1.49978, 2.365782, 1, 0, 0.3176471, 1,
1.641894, 0.1271518, 1.11069, 1, 0, 0.3137255, 1,
1.644415, 0.7516793, 1.29397, 1, 0, 0.3058824, 1,
1.662049, -1.31212, 2.721434, 1, 0, 0.2980392, 1,
1.68117, 0.355326, 2.167961, 1, 0, 0.2941177, 1,
1.689699, -0.5922359, 0.3898769, 1, 0, 0.2862745, 1,
1.705611, 1.001932, 2.085864, 1, 0, 0.282353, 1,
1.723025, -0.8582988, 2.383226, 1, 0, 0.2745098, 1,
1.735563, 0.2690075, 0.1919938, 1, 0, 0.2705882, 1,
1.748784, -1.887265, 0.8103613, 1, 0, 0.2627451, 1,
1.7611, 1.224718, 3.034371, 1, 0, 0.2588235, 1,
1.77328, -1.062414, 2.802637, 1, 0, 0.2509804, 1,
1.80814, 1.120925, -0.9911194, 1, 0, 0.2470588, 1,
1.819198, -0.3810835, 1.973772, 1, 0, 0.2392157, 1,
1.838892, 1.417681, 0.9095216, 1, 0, 0.2352941, 1,
1.871799, 1.400295, 0.3218749, 1, 0, 0.227451, 1,
1.874247, -0.68215, 0.9356389, 1, 0, 0.2235294, 1,
1.911596, 0.6887829, 0.5914693, 1, 0, 0.2156863, 1,
1.939271, -0.5456238, 1.40645, 1, 0, 0.2117647, 1,
1.956779, -0.633195, 2.089761, 1, 0, 0.2039216, 1,
1.970468, 0.5838792, 2.022026, 1, 0, 0.1960784, 1,
2.000795, -0.03000292, 2.864625, 1, 0, 0.1921569, 1,
2.002563, 1.251223, -0.3011388, 1, 0, 0.1843137, 1,
2.003842, -0.2994152, 0.3694772, 1, 0, 0.1803922, 1,
2.012483, 0.725282, 2.838241, 1, 0, 0.172549, 1,
2.120378, 0.6433405, 1.413136, 1, 0, 0.1686275, 1,
2.124624, -0.3008415, 0.3470669, 1, 0, 0.1607843, 1,
2.12476, -0.2149743, 0.1717044, 1, 0, 0.1568628, 1,
2.155014, -1.617446, 2.76335, 1, 0, 0.1490196, 1,
2.163701, 0.04426504, 1.929807, 1, 0, 0.145098, 1,
2.174118, 0.04229476, -0.01375287, 1, 0, 0.1372549, 1,
2.185282, -0.8117056, 3.579564, 1, 0, 0.1333333, 1,
2.244829, -1.055431, 3.039437, 1, 0, 0.1254902, 1,
2.277356, -1.113698, 2.530638, 1, 0, 0.1215686, 1,
2.311385, 1.717722, 0.7058498, 1, 0, 0.1137255, 1,
2.359666, -0.8992979, 1.916512, 1, 0, 0.1098039, 1,
2.439553, -0.3894916, 1.78461, 1, 0, 0.1019608, 1,
2.454704, -1.275401, 4.908276, 1, 0, 0.09411765, 1,
2.471856, 0.7591732, 1.915693, 1, 0, 0.09019608, 1,
2.498692, 1.060087, -0.3493089, 1, 0, 0.08235294, 1,
2.499415, -1.563891, 0.8692851, 1, 0, 0.07843138, 1,
2.533342, 1.201553, -0.9291338, 1, 0, 0.07058824, 1,
2.556455, -0.7809706, 0.9686616, 1, 0, 0.06666667, 1,
2.566635, -1.701309, 3.88731, 1, 0, 0.05882353, 1,
2.576911, -1.841326, 2.654806, 1, 0, 0.05490196, 1,
2.62767, -0.9757841, 2.104435, 1, 0, 0.04705882, 1,
2.636547, -1.145454, 2.621651, 1, 0, 0.04313726, 1,
2.673153, -0.3430779, 1.877534, 1, 0, 0.03529412, 1,
2.807469, -0.8699739, 1.287752, 1, 0, 0.03137255, 1,
2.898623, 0.8504561, 2.415111, 1, 0, 0.02352941, 1,
2.953042, 0.8007964, 1.001319, 1, 0, 0.01960784, 1,
3.113098, 1.223492, 0.8839441, 1, 0, 0.01176471, 1,
3.148067, 1.508302, 3.02729, 1, 0, 0.007843138, 1
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
-0.3589321, -4.702231, -8.351286, 0, -0.5, 0.5, 0.5,
-0.3589321, -4.702231, -8.351286, 1, -0.5, 0.5, 0.5,
-0.3589321, -4.702231, -8.351286, 1, 1.5, 0.5, 0.5,
-0.3589321, -4.702231, -8.351286, 0, 1.5, 0.5, 0.5
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
-5.054804, -0.07061207, -8.351286, 0, -0.5, 0.5, 0.5,
-5.054804, -0.07061207, -8.351286, 1, -0.5, 0.5, 0.5,
-5.054804, -0.07061207, -8.351286, 1, 1.5, 0.5, 0.5,
-5.054804, -0.07061207, -8.351286, 0, 1.5, 0.5, 0.5
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
-5.054804, -4.702231, -0.4009411, 0, -0.5, 0.5, 0.5,
-5.054804, -4.702231, -0.4009411, 1, -0.5, 0.5, 0.5,
-5.054804, -4.702231, -0.4009411, 1, 1.5, 0.5, 0.5,
-5.054804, -4.702231, -0.4009411, 0, 1.5, 0.5, 0.5
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
-2, -3.633396, -6.516591,
2, -3.633396, -6.516591,
-2, -3.633396, -6.516591,
-2, -3.811535, -6.822373,
0, -3.633396, -6.516591,
0, -3.811535, -6.822373,
2, -3.633396, -6.516591,
2, -3.811535, -6.822373
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
-2, -4.167814, -7.433939, 0, -0.5, 0.5, 0.5,
-2, -4.167814, -7.433939, 1, -0.5, 0.5, 0.5,
-2, -4.167814, -7.433939, 1, 1.5, 0.5, 0.5,
-2, -4.167814, -7.433939, 0, 1.5, 0.5, 0.5,
0, -4.167814, -7.433939, 0, -0.5, 0.5, 0.5,
0, -4.167814, -7.433939, 1, -0.5, 0.5, 0.5,
0, -4.167814, -7.433939, 1, 1.5, 0.5, 0.5,
0, -4.167814, -7.433939, 0, 1.5, 0.5, 0.5,
2, -4.167814, -7.433939, 0, -0.5, 0.5, 0.5,
2, -4.167814, -7.433939, 1, -0.5, 0.5, 0.5,
2, -4.167814, -7.433939, 1, 1.5, 0.5, 0.5,
2, -4.167814, -7.433939, 0, 1.5, 0.5, 0.5
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
-3.971141, -3, -6.516591,
-3.971141, 3, -6.516591,
-3.971141, -3, -6.516591,
-4.151752, -3, -6.822373,
-3.971141, -2, -6.516591,
-4.151752, -2, -6.822373,
-3.971141, -1, -6.516591,
-4.151752, -1, -6.822373,
-3.971141, 0, -6.516591,
-4.151752, 0, -6.822373,
-3.971141, 1, -6.516591,
-4.151752, 1, -6.822373,
-3.971141, 2, -6.516591,
-4.151752, 2, -6.822373,
-3.971141, 3, -6.516591,
-4.151752, 3, -6.822373
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
-4.512972, -3, -7.433939, 0, -0.5, 0.5, 0.5,
-4.512972, -3, -7.433939, 1, -0.5, 0.5, 0.5,
-4.512972, -3, -7.433939, 1, 1.5, 0.5, 0.5,
-4.512972, -3, -7.433939, 0, 1.5, 0.5, 0.5,
-4.512972, -2, -7.433939, 0, -0.5, 0.5, 0.5,
-4.512972, -2, -7.433939, 1, -0.5, 0.5, 0.5,
-4.512972, -2, -7.433939, 1, 1.5, 0.5, 0.5,
-4.512972, -2, -7.433939, 0, 1.5, 0.5, 0.5,
-4.512972, -1, -7.433939, 0, -0.5, 0.5, 0.5,
-4.512972, -1, -7.433939, 1, -0.5, 0.5, 0.5,
-4.512972, -1, -7.433939, 1, 1.5, 0.5, 0.5,
-4.512972, -1, -7.433939, 0, 1.5, 0.5, 0.5,
-4.512972, 0, -7.433939, 0, -0.5, 0.5, 0.5,
-4.512972, 0, -7.433939, 1, -0.5, 0.5, 0.5,
-4.512972, 0, -7.433939, 1, 1.5, 0.5, 0.5,
-4.512972, 0, -7.433939, 0, 1.5, 0.5, 0.5,
-4.512972, 1, -7.433939, 0, -0.5, 0.5, 0.5,
-4.512972, 1, -7.433939, 1, -0.5, 0.5, 0.5,
-4.512972, 1, -7.433939, 1, 1.5, 0.5, 0.5,
-4.512972, 1, -7.433939, 0, 1.5, 0.5, 0.5,
-4.512972, 2, -7.433939, 0, -0.5, 0.5, 0.5,
-4.512972, 2, -7.433939, 1, -0.5, 0.5, 0.5,
-4.512972, 2, -7.433939, 1, 1.5, 0.5, 0.5,
-4.512972, 2, -7.433939, 0, 1.5, 0.5, 0.5,
-4.512972, 3, -7.433939, 0, -0.5, 0.5, 0.5,
-4.512972, 3, -7.433939, 1, -0.5, 0.5, 0.5,
-4.512972, 3, -7.433939, 1, 1.5, 0.5, 0.5,
-4.512972, 3, -7.433939, 0, 1.5, 0.5, 0.5
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
-3.971141, -3.633396, -6,
-3.971141, -3.633396, 4,
-3.971141, -3.633396, -6,
-4.151752, -3.811535, -6,
-3.971141, -3.633396, -4,
-4.151752, -3.811535, -4,
-3.971141, -3.633396, -2,
-4.151752, -3.811535, -2,
-3.971141, -3.633396, 0,
-4.151752, -3.811535, 0,
-3.971141, -3.633396, 2,
-4.151752, -3.811535, 2,
-3.971141, -3.633396, 4,
-4.151752, -3.811535, 4
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
-4.512972, -4.167814, -6, 0, -0.5, 0.5, 0.5,
-4.512972, -4.167814, -6, 1, -0.5, 0.5, 0.5,
-4.512972, -4.167814, -6, 1, 1.5, 0.5, 0.5,
-4.512972, -4.167814, -6, 0, 1.5, 0.5, 0.5,
-4.512972, -4.167814, -4, 0, -0.5, 0.5, 0.5,
-4.512972, -4.167814, -4, 1, -0.5, 0.5, 0.5,
-4.512972, -4.167814, -4, 1, 1.5, 0.5, 0.5,
-4.512972, -4.167814, -4, 0, 1.5, 0.5, 0.5,
-4.512972, -4.167814, -2, 0, -0.5, 0.5, 0.5,
-4.512972, -4.167814, -2, 1, -0.5, 0.5, 0.5,
-4.512972, -4.167814, -2, 1, 1.5, 0.5, 0.5,
-4.512972, -4.167814, -2, 0, 1.5, 0.5, 0.5,
-4.512972, -4.167814, 0, 0, -0.5, 0.5, 0.5,
-4.512972, -4.167814, 0, 1, -0.5, 0.5, 0.5,
-4.512972, -4.167814, 0, 1, 1.5, 0.5, 0.5,
-4.512972, -4.167814, 0, 0, 1.5, 0.5, 0.5,
-4.512972, -4.167814, 2, 0, -0.5, 0.5, 0.5,
-4.512972, -4.167814, 2, 1, -0.5, 0.5, 0.5,
-4.512972, -4.167814, 2, 1, 1.5, 0.5, 0.5,
-4.512972, -4.167814, 2, 0, 1.5, 0.5, 0.5,
-4.512972, -4.167814, 4, 0, -0.5, 0.5, 0.5,
-4.512972, -4.167814, 4, 1, -0.5, 0.5, 0.5,
-4.512972, -4.167814, 4, 1, 1.5, 0.5, 0.5,
-4.512972, -4.167814, 4, 0, 1.5, 0.5, 0.5
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
-3.971141, -3.633396, -6.516591,
-3.971141, 3.492172, -6.516591,
-3.971141, -3.633396, 5.714709,
-3.971141, 3.492172, 5.714709,
-3.971141, -3.633396, -6.516591,
-3.971141, -3.633396, 5.714709,
-3.971141, 3.492172, -6.516591,
-3.971141, 3.492172, 5.714709,
-3.971141, -3.633396, -6.516591,
3.253277, -3.633396, -6.516591,
-3.971141, -3.633396, 5.714709,
3.253277, -3.633396, 5.714709,
-3.971141, 3.492172, -6.516591,
3.253277, 3.492172, -6.516591,
-3.971141, 3.492172, 5.714709,
3.253277, 3.492172, 5.714709,
3.253277, -3.633396, -6.516591,
3.253277, 3.492172, -6.516591,
3.253277, -3.633396, 5.714709,
3.253277, 3.492172, 5.714709,
3.253277, -3.633396, -6.516591,
3.253277, -3.633396, 5.714709,
3.253277, 3.492172, -6.516591,
3.253277, 3.492172, 5.714709
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
var radius = 8.486271;
var distance = 37.75637;
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
mvMatrix.translate( 0.3589321, 0.07061207, 0.4009411 );
mvMatrix.scale( 1.270071, 1.28769, 0.7501674 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.75637);
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
sesone<-read.table("sesone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sesone$V2
```

```
## Error in eval(expr, envir, enclos): object 'sesone' not found
```

```r
y<-sesone$V3
```

```
## Error in eval(expr, envir, enclos): object 'sesone' not found
```

```r
z<-sesone$V4
```

```
## Error in eval(expr, envir, enclos): object 'sesone' not found
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
-3.865931, -1.645625, -0.8138607, 0, 0, 1, 1, 1,
-3.077618, -1.151919, -1.431584, 1, 0, 0, 1, 1,
-3.057968, 0.6287658, -0.2802856, 1, 0, 0, 1, 1,
-2.971681, 0.8064606, -0.5262138, 1, 0, 0, 1, 1,
-2.917513, -0.5193241, -2.092413, 1, 0, 0, 1, 1,
-2.764482, 1.314361, -2.422899, 1, 0, 0, 1, 1,
-2.734725, 0.6135152, -0.9084795, 0, 0, 0, 1, 1,
-2.586909, 1.950781, -0.1935154, 0, 0, 0, 1, 1,
-2.515675, -1.367039, -1.356843, 0, 0, 0, 1, 1,
-2.496891, 0.7017097, -2.017079, 0, 0, 0, 1, 1,
-2.39841, 2.330498, -0.3742092, 0, 0, 0, 1, 1,
-2.339596, 1.124072, -1.094767, 0, 0, 0, 1, 1,
-2.261746, 0.9645481, -2.367125, 0, 0, 0, 1, 1,
-2.261286, -1.044925, -2.191246, 1, 1, 1, 1, 1,
-2.226015, 0.3440239, -3.303386, 1, 1, 1, 1, 1,
-2.18362, -0.3850137, -0.9792749, 1, 1, 1, 1, 1,
-2.138659, -0.3311573, -1.11263, 1, 1, 1, 1, 1,
-2.114122, -0.4109138, -1.169063, 1, 1, 1, 1, 1,
-2.111826, 1.130547, -1.147088, 1, 1, 1, 1, 1,
-1.983365, 2.038639, -0.7798076, 1, 1, 1, 1, 1,
-1.950844, 0.2734749, -1.899401, 1, 1, 1, 1, 1,
-1.950553, -0.865541, -3.504821, 1, 1, 1, 1, 1,
-1.942347, 0.06209598, -2.000077, 1, 1, 1, 1, 1,
-1.940648, 0.45524, -2.810249, 1, 1, 1, 1, 1,
-1.933433, -0.5007138, -1.231981, 1, 1, 1, 1, 1,
-1.930832, 0.502796, -1.505442, 1, 1, 1, 1, 1,
-1.924586, -1.316086, -1.465131, 1, 1, 1, 1, 1,
-1.886566, -1.082154, -0.182138, 1, 1, 1, 1, 1,
-1.879842, -0.2774363, -3.22763, 0, 0, 1, 1, 1,
-1.877111, 0.113222, -2.583312, 1, 0, 0, 1, 1,
-1.866961, -1.585244, -2.964969, 1, 0, 0, 1, 1,
-1.850364, 0.959488, -2.290428, 1, 0, 0, 1, 1,
-1.848391, 0.7814076, -1.403822, 1, 0, 0, 1, 1,
-1.841385, -1.565397, -1.49336, 1, 0, 0, 1, 1,
-1.835989, 0.319989, 0.3469653, 0, 0, 0, 1, 1,
-1.824112, 0.1220001, -0.6125021, 0, 0, 0, 1, 1,
-1.794579, 0.3799028, -1.955604, 0, 0, 0, 1, 1,
-1.781828, -0.6375033, -1.906243, 0, 0, 0, 1, 1,
-1.77187, -0.3196537, -2.521899, 0, 0, 0, 1, 1,
-1.770314, 0.5076301, -2.065363, 0, 0, 0, 1, 1,
-1.761106, -0.8924981, -2.796326, 0, 0, 0, 1, 1,
-1.748736, 3.121382, -0.154869, 1, 1, 1, 1, 1,
-1.744033, -0.197585, -2.235324, 1, 1, 1, 1, 1,
-1.736499, 0.4319899, -0.9222209, 1, 1, 1, 1, 1,
-1.691858, 0.9489867, -1.078854, 1, 1, 1, 1, 1,
-1.690955, 0.2989315, -2.720097, 1, 1, 1, 1, 1,
-1.687082, 0.1735756, -0.8257415, 1, 1, 1, 1, 1,
-1.672747, -1.723489, -1.708155, 1, 1, 1, 1, 1,
-1.667213, -0.6794062, -1.136528, 1, 1, 1, 1, 1,
-1.662929, 2.659973, -1.496994, 1, 1, 1, 1, 1,
-1.624357, -0.3926125, -2.911533, 1, 1, 1, 1, 1,
-1.617568, 1.016938, -2.10265, 1, 1, 1, 1, 1,
-1.590977, 0.1860813, -0.723112, 1, 1, 1, 1, 1,
-1.570618, 0.04540123, -0.1798608, 1, 1, 1, 1, 1,
-1.567432, -1.925291, -1.329275, 1, 1, 1, 1, 1,
-1.562584, -0.3048314, -1.39795, 1, 1, 1, 1, 1,
-1.561363, 0.3069341, -0.7267147, 0, 0, 1, 1, 1,
-1.555401, -0.3488059, -2.859763, 1, 0, 0, 1, 1,
-1.552296, -1.315877, -1.799408, 1, 0, 0, 1, 1,
-1.541841, -1.089161, -3.582751, 1, 0, 0, 1, 1,
-1.540262, 0.9913416, -2.003824, 1, 0, 0, 1, 1,
-1.521936, -2.217551, -3.16126, 1, 0, 0, 1, 1,
-1.513798, -1.464953, -2.255738, 0, 0, 0, 1, 1,
-1.510971, 0.7377213, -1.552118, 0, 0, 0, 1, 1,
-1.507777, -0.523617, -3.624272, 0, 0, 0, 1, 1,
-1.50127, 0.8987754, -0.3383878, 0, 0, 0, 1, 1,
-1.500412, 0.1921383, -0.5874425, 0, 0, 0, 1, 1,
-1.498194, -0.6886646, -2.178009, 0, 0, 0, 1, 1,
-1.496719, -0.6931757, -1.808977, 0, 0, 0, 1, 1,
-1.495808, -0.3679766, -2.103235, 1, 1, 1, 1, 1,
-1.495444, -0.8476425, -1.009521, 1, 1, 1, 1, 1,
-1.482792, -0.2549873, -2.719674, 1, 1, 1, 1, 1,
-1.475652, -0.6318299, -2.775747, 1, 1, 1, 1, 1,
-1.461394, 0.04808829, -2.378654, 1, 1, 1, 1, 1,
-1.449095, -0.1821465, -1.732033, 1, 1, 1, 1, 1,
-1.443218, 0.2273047, -0.06680814, 1, 1, 1, 1, 1,
-1.434975, -0.5296177, -3.159768, 1, 1, 1, 1, 1,
-1.42883, 0.4204094, -3.983402, 1, 1, 1, 1, 1,
-1.419626, 0.08141705, -3.556495, 1, 1, 1, 1, 1,
-1.41058, 0.08340506, -1.793628, 1, 1, 1, 1, 1,
-1.405664, -0.9190933, -2.145933, 1, 1, 1, 1, 1,
-1.398721, -1.18369, -2.04272, 1, 1, 1, 1, 1,
-1.397898, -0.5202702, -1.055726, 1, 1, 1, 1, 1,
-1.396091, 0.4188046, 1.574088, 1, 1, 1, 1, 1,
-1.391788, 1.479955, -1.424037, 0, 0, 1, 1, 1,
-1.38816, 0.7353072, -1.851863, 1, 0, 0, 1, 1,
-1.379551, -0.7259814, -3.306355, 1, 0, 0, 1, 1,
-1.377464, -2.642164, -1.773434, 1, 0, 0, 1, 1,
-1.368728, 0.4336059, -2.794474, 1, 0, 0, 1, 1,
-1.367695, -1.380287, -2.375249, 1, 0, 0, 1, 1,
-1.366778, -0.9125359, -2.273047, 0, 0, 0, 1, 1,
-1.362807, -1.149822, -4.309183, 0, 0, 0, 1, 1,
-1.360665, 0.6457505, -0.8370122, 0, 0, 0, 1, 1,
-1.356745, -0.4035071, -0.7802528, 0, 0, 0, 1, 1,
-1.351301, -0.02559777, -2.451364, 0, 0, 0, 1, 1,
-1.347942, 0.2214031, -0.6741844, 0, 0, 0, 1, 1,
-1.338718, -0.1615744, -0.4240094, 0, 0, 0, 1, 1,
-1.332438, 0.1549339, -1.854841, 1, 1, 1, 1, 1,
-1.331841, 1.627516, -2.547926, 1, 1, 1, 1, 1,
-1.327478, 0.486929, -1.167614, 1, 1, 1, 1, 1,
-1.326656, 0.6427033, 1.08613, 1, 1, 1, 1, 1,
-1.306019, -1.226551, -3.088521, 1, 1, 1, 1, 1,
-1.298068, 1.335164, -0.007170999, 1, 1, 1, 1, 1,
-1.283174, -2.061245, -4.737968, 1, 1, 1, 1, 1,
-1.2819, 0.3886443, -3.022444, 1, 1, 1, 1, 1,
-1.277562, -0.7271774, -2.179121, 1, 1, 1, 1, 1,
-1.277296, 1.203152, -1.324816, 1, 1, 1, 1, 1,
-1.274411, -0.3739482, -2.03559, 1, 1, 1, 1, 1,
-1.272749, -0.650775, -2.547222, 1, 1, 1, 1, 1,
-1.272643, -1.941132, -3.25761, 1, 1, 1, 1, 1,
-1.265841, -1.285627, -4.18236, 1, 1, 1, 1, 1,
-1.264184, 0.3781158, -1.521732, 1, 1, 1, 1, 1,
-1.264155, 2.215898, 0.4743757, 0, 0, 1, 1, 1,
-1.263898, -1.024943, -2.211941, 1, 0, 0, 1, 1,
-1.256633, 0.1383736, -3.296804, 1, 0, 0, 1, 1,
-1.250506, -0.6795703, -2.958338, 1, 0, 0, 1, 1,
-1.244812, -0.4872374, -1.8259, 1, 0, 0, 1, 1,
-1.237199, 0.4545745, -1.549368, 1, 0, 0, 1, 1,
-1.223506, 0.03021698, -1.870341, 0, 0, 0, 1, 1,
-1.218032, 0.1217658, -2.993373, 0, 0, 0, 1, 1,
-1.216501, 1.661044, -0.2219934, 0, 0, 0, 1, 1,
-1.209029, -0.8612246, -1.302226, 0, 0, 0, 1, 1,
-1.20379, 1.511322, 0.3792247, 0, 0, 0, 1, 1,
-1.199998, -2.014273, -4.081523, 0, 0, 0, 1, 1,
-1.196325, 1.528496, -0.8608404, 0, 0, 0, 1, 1,
-1.187433, 0.4964955, -2.409376, 1, 1, 1, 1, 1,
-1.183632, -0.5856172, -0.7529119, 1, 1, 1, 1, 1,
-1.182416, -0.1278415, -0.9833167, 1, 1, 1, 1, 1,
-1.16852, -0.733201, -1.743095, 1, 1, 1, 1, 1,
-1.156796, 0.2294067, -2.339032, 1, 1, 1, 1, 1,
-1.152791, -0.892476, -3.611671, 1, 1, 1, 1, 1,
-1.146096, 0.07256091, -2.343142, 1, 1, 1, 1, 1,
-1.142144, -0.7966187, -1.328895, 1, 1, 1, 1, 1,
-1.141953, 1.05407, 0.8261585, 1, 1, 1, 1, 1,
-1.139063, -0.009167299, -2.946032, 1, 1, 1, 1, 1,
-1.138069, 0.8258159, -0.3315901, 1, 1, 1, 1, 1,
-1.123798, 1.145137, -1.104831, 1, 1, 1, 1, 1,
-1.100402, 0.276399, -0.6740649, 1, 1, 1, 1, 1,
-1.095135, 1.143585, -1.861697, 1, 1, 1, 1, 1,
-1.094187, 0.6967122, -0.834112, 1, 1, 1, 1, 1,
-1.091481, -1.221903, -2.343144, 0, 0, 1, 1, 1,
-1.090834, -0.5830703, -1.995805, 1, 0, 0, 1, 1,
-1.090801, 1.455834, -1.741562, 1, 0, 0, 1, 1,
-1.086801, -1.773531, -1.086628, 1, 0, 0, 1, 1,
-1.086312, 1.194357, -0.993179, 1, 0, 0, 1, 1,
-1.085773, -0.3000138, -2.993731, 1, 0, 0, 1, 1,
-1.084804, -0.4528486, -1.010473, 0, 0, 0, 1, 1,
-1.084307, 0.03723008, -2.359682, 0, 0, 0, 1, 1,
-1.072075, -0.8489089, -1.299249, 0, 0, 0, 1, 1,
-1.070583, -0.09241022, -1.951108, 0, 0, 0, 1, 1,
-1.066953, 1.586545, -2.028297, 0, 0, 0, 1, 1,
-1.065929, 1.692434, -0.9726171, 0, 0, 0, 1, 1,
-1.065869, 1.507211, 0.3176237, 0, 0, 0, 1, 1,
-1.06083, -1.364031, -2.045877, 1, 1, 1, 1, 1,
-1.056741, 0.8328817, -0.5636995, 1, 1, 1, 1, 1,
-1.055016, -1.901225, -2.744971, 1, 1, 1, 1, 1,
-1.049665, -0.3843613, -1.986015, 1, 1, 1, 1, 1,
-1.042062, -0.6813775, -2.953102, 1, 1, 1, 1, 1,
-1.0396, -2.068788, -3.420339, 1, 1, 1, 1, 1,
-1.036897, 1.588925, -1.532874, 1, 1, 1, 1, 1,
-1.035771, 0.6649141, -0.3936975, 1, 1, 1, 1, 1,
-1.034931, -0.316573, -2.913213, 1, 1, 1, 1, 1,
-1.0325, 0.3246089, -1.79304, 1, 1, 1, 1, 1,
-1.031528, 0.4438525, -0.4193898, 1, 1, 1, 1, 1,
-1.029885, 1.270471, -1.682132, 1, 1, 1, 1, 1,
-1.02169, 0.4644756, -1.505455, 1, 1, 1, 1, 1,
-1.02129, 0.4930077, 0.07737191, 1, 1, 1, 1, 1,
-1.007856, -0.1448532, -1.450788, 1, 1, 1, 1, 1,
-1.007137, -0.2493343, -3.391275, 0, 0, 1, 1, 1,
-1.002146, 0.9945504, 0.5510331, 1, 0, 0, 1, 1,
-0.9971778, -0.134489, -2.577007, 1, 0, 0, 1, 1,
-0.9960312, 0.8130431, -1.25511, 1, 0, 0, 1, 1,
-0.9896305, 0.04084276, -1.119415, 1, 0, 0, 1, 1,
-0.9864759, -0.7264982, -3.379888, 1, 0, 0, 1, 1,
-0.9853618, -1.274175, -2.421685, 0, 0, 0, 1, 1,
-0.9841633, -1.290765, -2.184245, 0, 0, 0, 1, 1,
-0.9819343, 0.4641584, -0.9550756, 0, 0, 0, 1, 1,
-0.9776447, 0.1743779, -0.944884, 0, 0, 0, 1, 1,
-0.976924, 1.116509, 1.599517, 0, 0, 0, 1, 1,
-0.9765874, -1.5518, -3.018261, 0, 0, 0, 1, 1,
-0.9714119, 0.2663783, -0.5563332, 0, 0, 0, 1, 1,
-0.9686304, -1.694764, -2.388783, 1, 1, 1, 1, 1,
-0.9605479, -1.154598, -2.272506, 1, 1, 1, 1, 1,
-0.9601204, 1.286199, -0.1794573, 1, 1, 1, 1, 1,
-0.9527018, -0.9883238, -3.075784, 1, 1, 1, 1, 1,
-0.9520753, -1.999525, -2.063777, 1, 1, 1, 1, 1,
-0.9503157, 0.6893847, -1.053123, 1, 1, 1, 1, 1,
-0.9400105, 0.3439281, -0.3156207, 1, 1, 1, 1, 1,
-0.9220954, -0.4950994, -1.621331, 1, 1, 1, 1, 1,
-0.9179407, 0.3844275, -1.5296, 1, 1, 1, 1, 1,
-0.9170976, 1.568931, -1.369953, 1, 1, 1, 1, 1,
-0.9125261, -0.1740234, -2.905396, 1, 1, 1, 1, 1,
-0.9124887, 0.7478065, -2.165051, 1, 1, 1, 1, 1,
-0.9098129, -0.7185932, -1.83327, 1, 1, 1, 1, 1,
-0.909435, -0.07958791, -2.32495, 1, 1, 1, 1, 1,
-0.9080399, -0.5015266, -2.20783, 1, 1, 1, 1, 1,
-0.9073883, 0.7718176, -1.984064, 0, 0, 1, 1, 1,
-0.9048604, 1.047775, -0.3499728, 1, 0, 0, 1, 1,
-0.8999535, 0.4979353, -0.399394, 1, 0, 0, 1, 1,
-0.8981786, -0.6434457, -2.102797, 1, 0, 0, 1, 1,
-0.8857055, 1.375823, -0.1860136, 1, 0, 0, 1, 1,
-0.8812473, 0.09909886, -0.8406907, 1, 0, 0, 1, 1,
-0.8795072, 0.7475965, -0.001798583, 0, 0, 0, 1, 1,
-0.8778251, -0.09743838, -2.403385, 0, 0, 0, 1, 1,
-0.8764012, 1.745838, -1.493995, 0, 0, 0, 1, 1,
-0.8685982, -0.1649979, -2.534453, 0, 0, 0, 1, 1,
-0.8650167, -0.8606598, -2.663624, 0, 0, 0, 1, 1,
-0.8644163, -0.9439685, -4.058337, 0, 0, 0, 1, 1,
-0.8572824, 0.6623059, -1.818602, 0, 0, 0, 1, 1,
-0.8494732, -0.6662682, -1.136764, 1, 1, 1, 1, 1,
-0.8454891, -2.544654, -1.049865, 1, 1, 1, 1, 1,
-0.8384418, 0.877179, -0.7317973, 1, 1, 1, 1, 1,
-0.8382174, -0.5004373, -1.224621, 1, 1, 1, 1, 1,
-0.8335865, 0.8597859, -1.402639, 1, 1, 1, 1, 1,
-0.8334699, 0.3605409, -0.7561308, 1, 1, 1, 1, 1,
-0.8303222, -0.8391761, -3.829288, 1, 1, 1, 1, 1,
-0.8294667, -0.3206254, -1.825303, 1, 1, 1, 1, 1,
-0.8093289, -2.285004, -3.638211, 1, 1, 1, 1, 1,
-0.805131, -1.046685, -2.977516, 1, 1, 1, 1, 1,
-0.804323, 1.23861, -1.636026, 1, 1, 1, 1, 1,
-0.801927, 0.08549557, -1.515419, 1, 1, 1, 1, 1,
-0.8001778, 0.9985409, -2.575626, 1, 1, 1, 1, 1,
-0.7998983, -1.405162, -1.971267, 1, 1, 1, 1, 1,
-0.7876598, 1.275151, -1.252416, 1, 1, 1, 1, 1,
-0.7871693, 0.5357652, -0.4826639, 0, 0, 1, 1, 1,
-0.7803998, -0.1228254, -0.4431114, 1, 0, 0, 1, 1,
-0.7788735, 0.6397638, -1.698804, 1, 0, 0, 1, 1,
-0.7667332, -0.9559292, -1.236506, 1, 0, 0, 1, 1,
-0.7638468, -1.463493, -2.616043, 1, 0, 0, 1, 1,
-0.7635743, 0.4225219, 0.9890547, 1, 0, 0, 1, 1,
-0.7624859, -0.04422055, -1.510772, 0, 0, 0, 1, 1,
-0.7619401, 0.06611157, -1.327347, 0, 0, 0, 1, 1,
-0.7598918, -0.9956776, -2.648195, 0, 0, 0, 1, 1,
-0.7522237, -0.9419886, -3.45217, 0, 0, 0, 1, 1,
-0.7425607, -1.236485, -2.4505, 0, 0, 0, 1, 1,
-0.7317884, -0.6682484, -3.077771, 0, 0, 0, 1, 1,
-0.7313668, -0.778081, -4.585333, 0, 0, 0, 1, 1,
-0.7306495, -0.6627846, -1.642903, 1, 1, 1, 1, 1,
-0.7230756, -1.052693, -3.062402, 1, 1, 1, 1, 1,
-0.713578, -0.88109, -1.764642, 1, 1, 1, 1, 1,
-0.7077322, -1.903888, -4.370096, 1, 1, 1, 1, 1,
-0.7076784, 1.421564, -0.2390826, 1, 1, 1, 1, 1,
-0.7043641, 1.288407, -1.434267, 1, 1, 1, 1, 1,
-0.7015195, -1.818085, -4.114932, 1, 1, 1, 1, 1,
-0.6945761, -0.5229501, -0.5992045, 1, 1, 1, 1, 1,
-0.691739, -0.6044276, -2.300576, 1, 1, 1, 1, 1,
-0.6909065, 1.027308, 0.8043959, 1, 1, 1, 1, 1,
-0.6903154, -0.5091339, -0.7412749, 1, 1, 1, 1, 1,
-0.6891502, -0.1310859, -0.8621215, 1, 1, 1, 1, 1,
-0.6883262, 0.4144858, -1.231771, 1, 1, 1, 1, 1,
-0.6852908, -0.0188992, -3.567708, 1, 1, 1, 1, 1,
-0.6841764, -0.440806, -1.941748, 1, 1, 1, 1, 1,
-0.6826453, 1.763389, -1.223909, 0, 0, 1, 1, 1,
-0.6796107, 1.93037, -0.5934798, 1, 0, 0, 1, 1,
-0.6754619, 1.575215, 0.6638055, 1, 0, 0, 1, 1,
-0.667361, -1.269518, -2.894452, 1, 0, 0, 1, 1,
-0.6642724, -0.02776249, -3.144338, 1, 0, 0, 1, 1,
-0.6542782, -1.280314, -2.216584, 1, 0, 0, 1, 1,
-0.6536252, -0.03296794, -2.414397, 0, 0, 0, 1, 1,
-0.6486606, 0.1655289, -2.198133, 0, 0, 0, 1, 1,
-0.6482047, 0.04373153, -2.424381, 0, 0, 0, 1, 1,
-0.6468984, 1.231583, 1.280896, 0, 0, 0, 1, 1,
-0.6447663, 0.487215, -1.653211, 0, 0, 0, 1, 1,
-0.6437284, -0.5834712, -1.328294, 0, 0, 0, 1, 1,
-0.6406996, 0.1089931, -1.403576, 0, 0, 0, 1, 1,
-0.6403769, -1.99589, -5.939645, 1, 1, 1, 1, 1,
-0.6394833, -0.0001615731, -1.55564, 1, 1, 1, 1, 1,
-0.6366162, -2.249125, -3.154339, 1, 1, 1, 1, 1,
-0.6353607, -0.09178647, -2.556527, 1, 1, 1, 1, 1,
-0.6299726, -0.8746649, -6.338465, 1, 1, 1, 1, 1,
-0.6171393, 0.6585999, 0.4297165, 1, 1, 1, 1, 1,
-0.6168665, 1.438888, -1.063192, 1, 1, 1, 1, 1,
-0.6139299, 0.2874021, -0.9746214, 1, 1, 1, 1, 1,
-0.6094672, 0.3325852, 0.1198014, 1, 1, 1, 1, 1,
-0.6084578, 1.171237, -1.241088, 1, 1, 1, 1, 1,
-0.6073657, -0.01440591, -1.069091, 1, 1, 1, 1, 1,
-0.6032032, -0.6008382, -3.772186, 1, 1, 1, 1, 1,
-0.6030366, -1.21054, -2.469979, 1, 1, 1, 1, 1,
-0.5969248, 1.659804, 0.1994789, 1, 1, 1, 1, 1,
-0.5949536, 0.0644561, -0.5860568, 1, 1, 1, 1, 1,
-0.5922892, 1.440692, -0.6915213, 0, 0, 1, 1, 1,
-0.5829369, 0.9817244, -0.8787571, 1, 0, 0, 1, 1,
-0.576537, -0.5905257, -0.680994, 1, 0, 0, 1, 1,
-0.5677991, -0.8336104, -0.199631, 1, 0, 0, 1, 1,
-0.5666193, 0.2394765, -0.862357, 1, 0, 0, 1, 1,
-0.564515, 0.01966021, -0.6988515, 1, 0, 0, 1, 1,
-0.5592834, -1.804999, -3.219205, 0, 0, 0, 1, 1,
-0.5561407, 1.700918, 0.3213437, 0, 0, 0, 1, 1,
-0.5553685, 1.88712, 0.6407162, 0, 0, 0, 1, 1,
-0.55441, 1.708089, -0.9891226, 0, 0, 0, 1, 1,
-0.5464626, 0.7424131, -0.9556322, 0, 0, 0, 1, 1,
-0.5448957, -0.8782853, -0.7119425, 0, 0, 0, 1, 1,
-0.535601, 0.1081555, -1.375522, 0, 0, 0, 1, 1,
-0.5322916, -0.567127, -2.646163, 1, 1, 1, 1, 1,
-0.5283324, -1.030661, -1.593829, 1, 1, 1, 1, 1,
-0.5272012, 0.9659499, 1.066209, 1, 1, 1, 1, 1,
-0.5236739, 1.56709, -0.5358332, 1, 1, 1, 1, 1,
-0.5151028, 0.3350461, -0.1961038, 1, 1, 1, 1, 1,
-0.5146515, -0.7718889, -1.762728, 1, 1, 1, 1, 1,
-0.5124758, -0.8946677, -1.751105, 1, 1, 1, 1, 1,
-0.5123979, 1.246302, -1.507731, 1, 1, 1, 1, 1,
-0.5116637, 0.07910417, -2.285684, 1, 1, 1, 1, 1,
-0.5083237, 0.06506895, -0.754414, 1, 1, 1, 1, 1,
-0.5024988, 0.5813326, 0.573596, 1, 1, 1, 1, 1,
-0.5017374, -0.8005636, -3.519496, 1, 1, 1, 1, 1,
-0.4995289, 0.5405594, 1.097196, 1, 1, 1, 1, 1,
-0.4992717, 0.3771686, -2.22496, 1, 1, 1, 1, 1,
-0.4934775, 0.4825996, 0.004564283, 1, 1, 1, 1, 1,
-0.4921184, -0.4243459, -0.8313721, 0, 0, 1, 1, 1,
-0.4885487, 1.378855, 0.3357168, 1, 0, 0, 1, 1,
-0.4879903, -0.8155707, -0.6240132, 1, 0, 0, 1, 1,
-0.4818797, -0.3842338, -1.764746, 1, 0, 0, 1, 1,
-0.4812051, 0.0341772, -4.312143, 1, 0, 0, 1, 1,
-0.4795432, 0.4193137, -1.932477, 1, 0, 0, 1, 1,
-0.4789054, 1.078556, -0.2462289, 0, 0, 0, 1, 1,
-0.4785961, -1.403973, -3.063256, 0, 0, 0, 1, 1,
-0.4781393, -0.4756441, -1.398218, 0, 0, 0, 1, 1,
-0.4758074, 1.386807, 0.9428299, 0, 0, 0, 1, 1,
-0.4731336, 0.4127131, 0.08032572, 0, 0, 0, 1, 1,
-0.4718726, 0.4492823, 0.5115548, 0, 0, 0, 1, 1,
-0.468932, 0.7050341, -1.306493, 0, 0, 0, 1, 1,
-0.4621663, -0.8401006, -1.228661, 1, 1, 1, 1, 1,
-0.4615694, -0.1459698, -2.272901, 1, 1, 1, 1, 1,
-0.4572046, -1.410722, -1.984202, 1, 1, 1, 1, 1,
-0.4560399, 0.5778374, -0.5273417, 1, 1, 1, 1, 1,
-0.455016, -1.269406, -2.494974, 1, 1, 1, 1, 1,
-0.4546633, -1.1145, -2.744349, 1, 1, 1, 1, 1,
-0.4523534, 0.1811936, -1.155015, 1, 1, 1, 1, 1,
-0.4479293, -0.7504286, -1.58627, 1, 1, 1, 1, 1,
-0.4437848, 0.948227, -0.4889508, 1, 1, 1, 1, 1,
-0.4407873, 1.802688, -1.097224, 1, 1, 1, 1, 1,
-0.4386195, -0.295164, -3.185848, 1, 1, 1, 1, 1,
-0.4325152, 1.031979, -0.1513608, 1, 1, 1, 1, 1,
-0.4320411, -2.270851, -3.347039, 1, 1, 1, 1, 1,
-0.4318882, 1.180508, -0.3172558, 1, 1, 1, 1, 1,
-0.4313963, 0.5113041, -2.274576, 1, 1, 1, 1, 1,
-0.4288794, 0.479113, -1.645576, 0, 0, 1, 1, 1,
-0.4229689, 0.3075231, -2.497505, 1, 0, 0, 1, 1,
-0.4223309, 0.4441444, -2.153462, 1, 0, 0, 1, 1,
-0.4200134, -0.421457, -0.8141128, 1, 0, 0, 1, 1,
-0.4156762, 1.382453, -0.869928, 1, 0, 0, 1, 1,
-0.4136965, 1.563461, -0.1376499, 1, 0, 0, 1, 1,
-0.4104836, 1.27023, -0.06607835, 0, 0, 0, 1, 1,
-0.4098152, 0.5360332, -0.2333079, 0, 0, 0, 1, 1,
-0.4096744, -0.1061845, -1.331729, 0, 0, 0, 1, 1,
-0.4084714, 1.085499, -0.1014526, 0, 0, 0, 1, 1,
-0.4047979, -0.707077, -2.989126, 0, 0, 0, 1, 1,
-0.4010442, -1.51787, -3.826953, 0, 0, 0, 1, 1,
-0.4009807, -1.080463, -2.241284, 0, 0, 0, 1, 1,
-0.3987167, 0.9579416, -0.06183506, 1, 1, 1, 1, 1,
-0.386868, 0.8833658, -0.419203, 1, 1, 1, 1, 1,
-0.3806157, 0.9405299, 0.6473079, 1, 1, 1, 1, 1,
-0.3802128, 0.1708607, -1.166688, 1, 1, 1, 1, 1,
-0.3794067, 0.3364528, -0.8550457, 1, 1, 1, 1, 1,
-0.3785538, -0.2232813, -3.029743, 1, 1, 1, 1, 1,
-0.3764524, 2.142879, 1.440299, 1, 1, 1, 1, 1,
-0.3754205, 1.791662, -0.09448313, 1, 1, 1, 1, 1,
-0.3748972, -0.1826742, -0.3277257, 1, 1, 1, 1, 1,
-0.3652761, 1.264842, 0.1466487, 1, 1, 1, 1, 1,
-0.3589008, -0.5923547, -2.478825, 1, 1, 1, 1, 1,
-0.3579894, 0.02165343, -1.279924, 1, 1, 1, 1, 1,
-0.3567018, -0.6232123, -3.377148, 1, 1, 1, 1, 1,
-0.3545971, -1.280125, -4.807803, 1, 1, 1, 1, 1,
-0.3532471, 1.475855, 1.163294, 1, 1, 1, 1, 1,
-0.3457793, 0.04471262, -2.380419, 0, 0, 1, 1, 1,
-0.3406555, 0.9920275, 0.700699, 1, 0, 0, 1, 1,
-0.3368466, 0.8449735, -0.8597556, 1, 0, 0, 1, 1,
-0.3345201, 1.609367, -0.2516747, 1, 0, 0, 1, 1,
-0.3332286, 0.6808462, -1.222067, 1, 0, 0, 1, 1,
-0.3323606, -2.195265, -3.416719, 1, 0, 0, 1, 1,
-0.3302301, 0.6886902, -0.1508346, 0, 0, 0, 1, 1,
-0.3255402, -0.717598, -2.666507, 0, 0, 0, 1, 1,
-0.3248938, 0.1678725, -0.9885122, 0, 0, 0, 1, 1,
-0.323792, -1.377421, -4.256654, 0, 0, 0, 1, 1,
-0.3230922, 1.16993, -2.166486, 0, 0, 0, 1, 1,
-0.317692, -1.266, -3.488837, 0, 0, 0, 1, 1,
-0.3152177, 0.7946448, -0.04302066, 0, 0, 0, 1, 1,
-0.314654, -0.9059647, -1.536877, 1, 1, 1, 1, 1,
-0.3087653, -0.4342346, -1.554019, 1, 1, 1, 1, 1,
-0.3074635, -0.307634, -2.880679, 1, 1, 1, 1, 1,
-0.304777, -0.3731908, -2.083559, 1, 1, 1, 1, 1,
-0.2982833, 1.884963, 0.3123983, 1, 1, 1, 1, 1,
-0.297154, -1.440855, -2.835262, 1, 1, 1, 1, 1,
-0.2883039, -1.995343, -3.740778, 1, 1, 1, 1, 1,
-0.2839969, -1.202303, -1.973316, 1, 1, 1, 1, 1,
-0.2831281, -0.6099898, -1.463387, 1, 1, 1, 1, 1,
-0.2810572, 0.5115991, 1.219563, 1, 1, 1, 1, 1,
-0.2794093, -0.485775, -4.446762, 1, 1, 1, 1, 1,
-0.2791682, -0.5591674, -1.991408, 1, 1, 1, 1, 1,
-0.2779144, -0.4164617, -3.153893, 1, 1, 1, 1, 1,
-0.2750368, -0.1224432, -1.264525, 1, 1, 1, 1, 1,
-0.2699675, 0.2974855, -0.5896845, 1, 1, 1, 1, 1,
-0.2696926, -0.4401289, -3.886456, 0, 0, 1, 1, 1,
-0.2658634, -1.662792, -3.848841, 1, 0, 0, 1, 1,
-0.2643578, 0.4618019, -2.232083, 1, 0, 0, 1, 1,
-0.2643492, -1.439481, -3.159124, 1, 0, 0, 1, 1,
-0.257127, -0.6523746, -4.822948, 1, 0, 0, 1, 1,
-0.2556393, 1.008041, -0.5313672, 1, 0, 0, 1, 1,
-0.2546267, 0.5614897, -0.6554689, 0, 0, 0, 1, 1,
-0.2515663, 0.221207, -2.652229, 0, 0, 0, 1, 1,
-0.2509268, -1.06269, -2.522538, 0, 0, 0, 1, 1,
-0.2489627, 0.855785, 0.01247671, 0, 0, 0, 1, 1,
-0.2464099, -0.0261606, 0.2783616, 0, 0, 0, 1, 1,
-0.2448032, -0.3491544, -2.164671, 0, 0, 0, 1, 1,
-0.2409469, -0.1308283, -3.630244, 0, 0, 0, 1, 1,
-0.2393153, -0.6354675, -3.774863, 1, 1, 1, 1, 1,
-0.2384978, 0.4959824, -1.180287, 1, 1, 1, 1, 1,
-0.2376393, -0.8671271, -2.855569, 1, 1, 1, 1, 1,
-0.2342475, -0.701782, -2.73175, 1, 1, 1, 1, 1,
-0.233954, 0.1915292, -0.3601727, 1, 1, 1, 1, 1,
-0.2324293, -0.9861743, -4.741303, 1, 1, 1, 1, 1,
-0.2241513, 0.6690689, 0.235538, 1, 1, 1, 1, 1,
-0.2227654, 0.3140067, 1.061092, 1, 1, 1, 1, 1,
-0.2217697, -0.7369907, -3.465248, 1, 1, 1, 1, 1,
-0.218462, 0.8293806, 1.040726, 1, 1, 1, 1, 1,
-0.2168154, 0.05508589, 0.1182598, 1, 1, 1, 1, 1,
-0.2166969, -0.506062, -1.532533, 1, 1, 1, 1, 1,
-0.2109567, 0.8710729, -0.2620044, 1, 1, 1, 1, 1,
-0.2109197, 0.545247, -1.119775, 1, 1, 1, 1, 1,
-0.210571, 1.436915, -0.3390962, 1, 1, 1, 1, 1,
-0.2105117, -0.2549046, -3.54161, 0, 0, 1, 1, 1,
-0.2086833, 0.5476507, -1.235888, 1, 0, 0, 1, 1,
-0.2001376, -1.197132, -3.207957, 1, 0, 0, 1, 1,
-0.196161, 0.57715, -0.7295494, 1, 0, 0, 1, 1,
-0.1957505, 0.6116307, 0.3880382, 1, 0, 0, 1, 1,
-0.195361, 0.5711211, 0.6379376, 1, 0, 0, 1, 1,
-0.1899245, -0.9376368, -2.365088, 0, 0, 0, 1, 1,
-0.1876386, -3.529626, -4.488911, 0, 0, 0, 1, 1,
-0.184082, -0.1774413, -2.894158, 0, 0, 0, 1, 1,
-0.1815961, 1.241362, 0.1421034, 0, 0, 0, 1, 1,
-0.1812909, 0.7905249, -0.3589601, 0, 0, 0, 1, 1,
-0.1800224, 0.3365568, 0.7124082, 0, 0, 0, 1, 1,
-0.1792588, -0.9741961, -5.044248, 0, 0, 0, 1, 1,
-0.1749095, 0.499456, -2.389677, 1, 1, 1, 1, 1,
-0.1740305, 0.9206325, 0.5169416, 1, 1, 1, 1, 1,
-0.172236, -0.7628326, -2.146441, 1, 1, 1, 1, 1,
-0.1665479, 1.024185, 0.7637142, 1, 1, 1, 1, 1,
-0.1652628, -0.8655828, -3.293524, 1, 1, 1, 1, 1,
-0.1627212, 0.4515515, 1.665941, 1, 1, 1, 1, 1,
-0.1626546, -0.5346483, -2.888408, 1, 1, 1, 1, 1,
-0.1590719, 0.7032214, -1.696465, 1, 1, 1, 1, 1,
-0.1583072, 1.573763, 0.325939, 1, 1, 1, 1, 1,
-0.1578845, 0.1967016, -0.6119083, 1, 1, 1, 1, 1,
-0.1526643, 1.538286, 0.7579499, 1, 1, 1, 1, 1,
-0.1470342, -0.1905164, -1.751696, 1, 1, 1, 1, 1,
-0.1464749, -1.086232, -1.066807, 1, 1, 1, 1, 1,
-0.1452046, 1.178256, -0.4398886, 1, 1, 1, 1, 1,
-0.1438595, -0.1243051, -1.898121, 1, 1, 1, 1, 1,
-0.1399081, -0.7526261, -2.956691, 0, 0, 1, 1, 1,
-0.1379777, 0.1950265, -1.103074, 1, 0, 0, 1, 1,
-0.135067, 0.8798209, 1.659484, 1, 0, 0, 1, 1,
-0.1337764, -1.235065, -3.03758, 1, 0, 0, 1, 1,
-0.1308499, 0.4813432, -1.571027, 1, 0, 0, 1, 1,
-0.1277385, 0.09680042, -1.814718, 1, 0, 0, 1, 1,
-0.1271714, -1.129631, -5.067976, 0, 0, 0, 1, 1,
-0.1230787, -1.347573, -2.449564, 0, 0, 0, 1, 1,
-0.1219837, -0.4464844, -2.320095, 0, 0, 0, 1, 1,
-0.1215243, 0.4105559, -0.7389305, 0, 0, 0, 1, 1,
-0.1214852, 0.2834719, 0.3233432, 0, 0, 0, 1, 1,
-0.1170997, 1.053916, 0.1860081, 0, 0, 0, 1, 1,
-0.115903, 1.016996, -0.2799389, 0, 0, 0, 1, 1,
-0.1144249, -1.253421, -2.961901, 1, 1, 1, 1, 1,
-0.1140193, 0.07818361, -1.937336, 1, 1, 1, 1, 1,
-0.1117672, 0.7523241, 0.9275624, 1, 1, 1, 1, 1,
-0.1116844, 0.6108728, -1.635054, 1, 1, 1, 1, 1,
-0.1114242, -0.5250291, -2.46038, 1, 1, 1, 1, 1,
-0.1062867, 0.6321821, -0.03459388, 1, 1, 1, 1, 1,
-0.1046855, -0.4559756, -3.183264, 1, 1, 1, 1, 1,
-0.1046714, 1.691068, 0.2276511, 1, 1, 1, 1, 1,
-0.1007957, -1.004883, -2.157016, 1, 1, 1, 1, 1,
-0.09939669, -0.6938085, -1.698985, 1, 1, 1, 1, 1,
-0.09273419, -0.01385618, -0.2396016, 1, 1, 1, 1, 1,
-0.09130571, 1.097637, 0.920436, 1, 1, 1, 1, 1,
-0.09112377, -1.084952, -2.750414, 1, 1, 1, 1, 1,
-0.08749946, -0.5168396, -3.012473, 1, 1, 1, 1, 1,
-0.08635535, 0.7040367, -0.774918, 1, 1, 1, 1, 1,
-0.08632262, -0.266418, -2.043559, 0, 0, 1, 1, 1,
-0.07802889, 0.2705848, -0.9111729, 1, 0, 0, 1, 1,
-0.07350283, 1.769116, -1.007937, 1, 0, 0, 1, 1,
-0.07201318, -0.8548887, -4.984146, 1, 0, 0, 1, 1,
-0.06776317, 1.720517, 0.7532192, 1, 0, 0, 1, 1,
-0.05119971, 1.629502, 1.068078, 1, 0, 0, 1, 1,
-0.04912296, -0.9258505, -1.629327, 0, 0, 0, 1, 1,
-0.04757028, -1.44293, -1.793015, 0, 0, 0, 1, 1,
-0.04161961, -0.8752201, -2.248502, 0, 0, 0, 1, 1,
-0.04100442, 0.02748851, -3.082848, 0, 0, 0, 1, 1,
-0.0374718, 0.222733, -1.45237, 0, 0, 0, 1, 1,
-0.03556681, 0.08078969, 0.3193291, 0, 0, 0, 1, 1,
-0.03401975, -0.4681974, -3.234666, 0, 0, 0, 1, 1,
-0.03361214, 0.6357063, 0.9924878, 1, 1, 1, 1, 1,
-0.03348957, 0.1721335, 0.5395604, 1, 1, 1, 1, 1,
-0.03327526, -0.7556242, -4.115555, 1, 1, 1, 1, 1,
-0.03256533, 0.709103, -1.233796, 1, 1, 1, 1, 1,
-0.03079005, -2.483701, -3.091406, 1, 1, 1, 1, 1,
-0.01236644, -0.8413956, -4.661893, 1, 1, 1, 1, 1,
-0.009799851, -0.6520165, -2.602345, 1, 1, 1, 1, 1,
-0.008456714, -0.5123674, -3.007495, 1, 1, 1, 1, 1,
-0.008141907, 0.3651319, 1.085499, 1, 1, 1, 1, 1,
-0.004264036, -1.618983, -3.285561, 1, 1, 1, 1, 1,
-0.001911908, 0.2108338, 0.9672086, 1, 1, 1, 1, 1,
-0.001243885, -0.8834133, -3.346794, 1, 1, 1, 1, 1,
0.007441516, -0.4096689, 2.244896, 1, 1, 1, 1, 1,
0.008830211, 0.2581857, 0.5878145, 1, 1, 1, 1, 1,
0.009858926, 0.2403157, 0.8179163, 1, 1, 1, 1, 1,
0.0129615, 0.4110152, 0.4428147, 0, 0, 1, 1, 1,
0.02071577, -0.329206, 2.820957, 1, 0, 0, 1, 1,
0.02341757, 0.4979918, -0.5528871, 1, 0, 0, 1, 1,
0.03614704, -0.6602587, 3.564013, 1, 0, 0, 1, 1,
0.03703471, -0.6101632, 4.612056, 1, 0, 0, 1, 1,
0.04350924, 0.888924, -1.377742, 1, 0, 0, 1, 1,
0.04539761, 0.5416805, 1.042274, 0, 0, 0, 1, 1,
0.04729357, 0.3872558, -0.1772518, 0, 0, 0, 1, 1,
0.05512752, -1.196613, 2.612038, 0, 0, 0, 1, 1,
0.06374321, 0.100791, -0.6752164, 0, 0, 0, 1, 1,
0.06555991, -1.060464, 4.402582, 0, 0, 0, 1, 1,
0.06891598, 0.5005456, -0.5359948, 0, 0, 0, 1, 1,
0.06941759, -0.4352642, 4.124331, 0, 0, 0, 1, 1,
0.07030508, -1.177725, 3.367186, 1, 1, 1, 1, 1,
0.07037824, 1.540543, 1.701193, 1, 1, 1, 1, 1,
0.07107633, 1.701193, 0.3577467, 1, 1, 1, 1, 1,
0.07132647, 0.4279446, 0.1328865, 1, 1, 1, 1, 1,
0.07234333, -0.6998563, 2.817685, 1, 1, 1, 1, 1,
0.07661352, 1.846088, -0.05569166, 1, 1, 1, 1, 1,
0.07955097, -0.4067874, 4.063518, 1, 1, 1, 1, 1,
0.0842971, 0.4550212, 1.617608, 1, 1, 1, 1, 1,
0.08790922, 0.647121, 1.596154, 1, 1, 1, 1, 1,
0.09049813, -0.4535416, 2.161854, 1, 1, 1, 1, 1,
0.09456833, -0.3624356, 3.112104, 1, 1, 1, 1, 1,
0.09869775, 0.2723411, 1.448716, 1, 1, 1, 1, 1,
0.09878838, 1.257283, -1.249205, 1, 1, 1, 1, 1,
0.1008561, -1.077016, 3.614269, 1, 1, 1, 1, 1,
0.1011372, -0.8937854, 2.180031, 1, 1, 1, 1, 1,
0.1037444, 1.20329, 0.1110372, 0, 0, 1, 1, 1,
0.1039942, 0.3359452, -0.2771183, 1, 0, 0, 1, 1,
0.1045188, -2.816314, 2.877252, 1, 0, 0, 1, 1,
0.1052593, 0.6741188, 1.52613, 1, 0, 0, 1, 1,
0.1112453, 0.5240133, -1.187423, 1, 0, 0, 1, 1,
0.1121431, -1.421711, 1.431658, 1, 0, 0, 1, 1,
0.1123292, -0.810956, 2.782717, 0, 0, 0, 1, 1,
0.1172391, 0.7975293, 0.6959087, 0, 0, 0, 1, 1,
0.1183602, 0.8536591, -0.6734172, 0, 0, 0, 1, 1,
0.1203582, -1.677655, 3.234599, 0, 0, 0, 1, 1,
0.1211146, -1.017138, 2.268455, 0, 0, 0, 1, 1,
0.1237786, -0.10694, 3.277977, 0, 0, 0, 1, 1,
0.1252182, 0.4828359, 0.5429211, 0, 0, 0, 1, 1,
0.1313739, 0.5781587, -0.7588648, 1, 1, 1, 1, 1,
0.139811, 1.342823, -0.1365832, 1, 1, 1, 1, 1,
0.1441241, -0.1856593, 2.270835, 1, 1, 1, 1, 1,
0.1474396, -0.5639347, 2.180088, 1, 1, 1, 1, 1,
0.1491204, 1.707441, 0.2878036, 1, 1, 1, 1, 1,
0.1526766, -0.5819027, 3.645816, 1, 1, 1, 1, 1,
0.1532726, 0.3393548, -0.9874156, 1, 1, 1, 1, 1,
0.1571015, 1.700313, -0.2140221, 1, 1, 1, 1, 1,
0.1602782, 0.8225093, 0.3116527, 1, 1, 1, 1, 1,
0.1650798, -1.169046, 3.467232, 1, 1, 1, 1, 1,
0.1664463, 1.45063, 0.005672096, 1, 1, 1, 1, 1,
0.1665877, -1.182824, 3.88103, 1, 1, 1, 1, 1,
0.1699588, 0.4463602, 2.456096, 1, 1, 1, 1, 1,
0.1763954, 0.7365786, 1.55444, 1, 1, 1, 1, 1,
0.179089, -0.004095047, 3.207186, 1, 1, 1, 1, 1,
0.1811669, -0.4396574, 2.994853, 0, 0, 1, 1, 1,
0.1823502, 0.1568293, 1.670644, 1, 0, 0, 1, 1,
0.1840629, -0.2349161, 4.8722, 1, 0, 0, 1, 1,
0.1933369, 1.803158, -0.5402626, 1, 0, 0, 1, 1,
0.1943465, -0.6775021, 1.946586, 1, 0, 0, 1, 1,
0.1977831, 1.125274, 0.1725464, 1, 0, 0, 1, 1,
0.1987879, -2.477848, 2.425899, 0, 0, 0, 1, 1,
0.2003225, 0.2089491, 1.18779, 0, 0, 0, 1, 1,
0.2036048, 3.276801, -0.4934777, 0, 0, 0, 1, 1,
0.2111383, -1.171855, 3.547818, 0, 0, 0, 1, 1,
0.2127832, 0.8223017, -0.6274475, 0, 0, 0, 1, 1,
0.212815, -0.5019093, 3.303269, 0, 0, 0, 1, 1,
0.2139219, 0.4136091, 0.9357015, 0, 0, 0, 1, 1,
0.2189983, -1.119329, 3.910262, 1, 1, 1, 1, 1,
0.2199563, 1.094465, -0.4210595, 1, 1, 1, 1, 1,
0.2214827, -0.9791051, 4.86396, 1, 1, 1, 1, 1,
0.2231399, -0.885946, 3.047308, 1, 1, 1, 1, 1,
0.2234547, -1.628932, 3.634789, 1, 1, 1, 1, 1,
0.2247916, -2.089028, 2.319184, 1, 1, 1, 1, 1,
0.2248774, -0.5341525, 4.266065, 1, 1, 1, 1, 1,
0.225132, 0.002838632, 3.553175, 1, 1, 1, 1, 1,
0.2262453, 0.09272601, 1.778823, 1, 1, 1, 1, 1,
0.2355374, 0.6959665, 0.1358625, 1, 1, 1, 1, 1,
0.236387, -1.092386, 3.069751, 1, 1, 1, 1, 1,
0.2370139, -0.1583913, 4.630054, 1, 1, 1, 1, 1,
0.2386959, -0.5123489, 3.422496, 1, 1, 1, 1, 1,
0.2425255, -1.044291, 0.3056738, 1, 1, 1, 1, 1,
0.247562, -0.1399993, 2.835101, 1, 1, 1, 1, 1,
0.2503931, 1.585197, -0.3141972, 0, 0, 1, 1, 1,
0.2512041, -1.304856, 0.8996704, 1, 0, 0, 1, 1,
0.2529469, 0.3194092, 1.273265, 1, 0, 0, 1, 1,
0.2565221, 0.5836737, -0.4773798, 1, 0, 0, 1, 1,
0.2608833, 0.2069732, 0.5842232, 1, 0, 0, 1, 1,
0.2625926, 0.3829187, 0.5926947, 1, 0, 0, 1, 1,
0.2662906, -0.1077652, 1.100957, 0, 0, 0, 1, 1,
0.2695707, 0.6018199, 1.311079, 0, 0, 0, 1, 1,
0.2698574, 0.5118987, 1.772586, 0, 0, 0, 1, 1,
0.2699421, -0.1839717, 0.9341353, 0, 0, 0, 1, 1,
0.2710472, 0.001864084, 0.9885443, 0, 0, 0, 1, 1,
0.2776013, 0.4547403, 1.936305, 0, 0, 0, 1, 1,
0.2819537, -0.4366391, 2.761124, 0, 0, 0, 1, 1,
0.2869195, -0.5354223, 2.424115, 1, 1, 1, 1, 1,
0.2908333, 0.3751065, 1.019638, 1, 1, 1, 1, 1,
0.2942421, 0.7258257, 2.055576, 1, 1, 1, 1, 1,
0.2969045, -1.483508, 5.055613, 1, 1, 1, 1, 1,
0.2981842, 0.177475, 0.529693, 1, 1, 1, 1, 1,
0.2985051, -0.3160712, 5.437078, 1, 1, 1, 1, 1,
0.3006646, -0.1157103, 2.183463, 1, 1, 1, 1, 1,
0.3014729, -0.1468555, 1.841339, 1, 1, 1, 1, 1,
0.3017752, 0.504078, 1.418996, 1, 1, 1, 1, 1,
0.3048814, 2.048993, 0.008986386, 1, 1, 1, 1, 1,
0.3057426, 0.3268587, 0.3271593, 1, 1, 1, 1, 1,
0.3066195, 1.318505, -1.230728, 1, 1, 1, 1, 1,
0.310726, 0.4915192, 0.6697156, 1, 1, 1, 1, 1,
0.3173152, -1.134018, 2.636637, 1, 1, 1, 1, 1,
0.3181025, -0.1677532, 2.439301, 1, 1, 1, 1, 1,
0.3211916, -0.3237018, 3.208377, 0, 0, 1, 1, 1,
0.3218959, 0.04226165, 2.062658, 1, 0, 0, 1, 1,
0.3228543, 0.8090695, 0.2165333, 1, 0, 0, 1, 1,
0.3254548, -0.05350805, 1.087652, 1, 0, 0, 1, 1,
0.3261268, -0.7840186, 3.695406, 1, 0, 0, 1, 1,
0.3268504, 0.7413616, 1.076395, 1, 0, 0, 1, 1,
0.331743, -1.076131, 3.001673, 0, 0, 0, 1, 1,
0.3336981, -0.7673255, 0.8206533, 0, 0, 0, 1, 1,
0.3342495, -2.944874, 3.361964, 0, 0, 0, 1, 1,
0.3353232, 1.793829, 1.103382, 0, 0, 0, 1, 1,
0.3356397, -1.083408, 2.516158, 0, 0, 0, 1, 1,
0.3358147, 1.245504, 1.096356, 0, 0, 0, 1, 1,
0.3468516, 1.588155, -0.0415913, 0, 0, 0, 1, 1,
0.3472614, 0.6720284, 0.2288102, 1, 1, 1, 1, 1,
0.3488714, -1.616399, 4.136534, 1, 1, 1, 1, 1,
0.3545442, 0.04826207, -0.187092, 1, 1, 1, 1, 1,
0.3555174, -0.2539015, 3.858966, 1, 1, 1, 1, 1,
0.3560312, -0.6923793, 3.658487, 1, 1, 1, 1, 1,
0.3640587, -1.331825, 1.933304, 1, 1, 1, 1, 1,
0.3653179, 1.048366, -0.2209011, 1, 1, 1, 1, 1,
0.3672573, -0.5185106, 2.542954, 1, 1, 1, 1, 1,
0.3708454, 0.4108427, -0.9907483, 1, 1, 1, 1, 1,
0.3723246, -1.208464, 3.754997, 1, 1, 1, 1, 1,
0.373565, 0.3178704, 2.496288, 1, 1, 1, 1, 1,
0.3763387, 0.0292657, 1.460947, 1, 1, 1, 1, 1,
0.3771066, -0.7067997, 2.261408, 1, 1, 1, 1, 1,
0.3788999, -1.167198, 2.978079, 1, 1, 1, 1, 1,
0.3793647, -0.04704107, 1.924193, 1, 1, 1, 1, 1,
0.3798162, 1.315968, 1.262171, 0, 0, 1, 1, 1,
0.3821859, 1.222123, -0.8424345, 1, 0, 0, 1, 1,
0.3846967, -0.8781894, 1.380975, 1, 0, 0, 1, 1,
0.3952455, -1.536169, 3.765024, 1, 0, 0, 1, 1,
0.3993335, -0.5957646, 2.218214, 1, 0, 0, 1, 1,
0.4007996, 0.8183257, 0.7472931, 1, 0, 0, 1, 1,
0.4105055, -0.1086617, 0.803825, 0, 0, 0, 1, 1,
0.415144, -1.046371, 3.609777, 0, 0, 0, 1, 1,
0.4170904, -0.4245524, 3.214149, 0, 0, 0, 1, 1,
0.4238097, -1.24132, 1.946605, 0, 0, 0, 1, 1,
0.4283924, 0.5566005, 1.896485, 0, 0, 0, 1, 1,
0.4301345, 0.6809571, 1.339191, 0, 0, 0, 1, 1,
0.430308, 0.4556611, 1.448865, 0, 0, 0, 1, 1,
0.4353566, -1.410778, 1.77903, 1, 1, 1, 1, 1,
0.4353787, -0.2491324, 1.276965, 1, 1, 1, 1, 1,
0.437503, 0.989102, -0.5068319, 1, 1, 1, 1, 1,
0.4415837, -0.8903739, 3.499271, 1, 1, 1, 1, 1,
0.4425551, 1.703934, 0.8031315, 1, 1, 1, 1, 1,
0.4479839, -1.686836, 3.617877, 1, 1, 1, 1, 1,
0.4503498, -0.6908503, 2.711593, 1, 1, 1, 1, 1,
0.4561689, 0.2042483, 0.7264473, 1, 1, 1, 1, 1,
0.4578644, 0.542937, 1.107713, 1, 1, 1, 1, 1,
0.4579426, 2.930098, -0.266179, 1, 1, 1, 1, 1,
0.4592777, -0.7065284, 4.369063, 1, 1, 1, 1, 1,
0.4594753, 0.08980557, 1.718545, 1, 1, 1, 1, 1,
0.4673295, -0.07809858, 2.569973, 1, 1, 1, 1, 1,
0.4676179, -0.5213035, 2.187743, 1, 1, 1, 1, 1,
0.4684622, 0.3630694, -0.4237943, 1, 1, 1, 1, 1,
0.4690409, -1.418849, 2.552261, 0, 0, 1, 1, 1,
0.4705654, -0.9638379, 2.84706, 1, 0, 0, 1, 1,
0.4718934, -2.044109, 3.47474, 1, 0, 0, 1, 1,
0.4742889, -0.5140193, 4.483247, 1, 0, 0, 1, 1,
0.4766046, -0.02720696, 2.820876, 1, 0, 0, 1, 1,
0.477703, -0.3458209, 3.911884, 1, 0, 0, 1, 1,
0.4823062, -0.1139227, 1.113404, 0, 0, 0, 1, 1,
0.4856683, 2.37316, 1.096345, 0, 0, 0, 1, 1,
0.4859089, 1.751685, -0.3062262, 0, 0, 0, 1, 1,
0.4879682, -1.20158, 2.650034, 0, 0, 0, 1, 1,
0.4918894, 0.01664139, 0.4735358, 0, 0, 0, 1, 1,
0.4941869, 1.426006, -0.284024, 0, 0, 0, 1, 1,
0.4951755, 1.054658, -0.03923655, 0, 0, 0, 1, 1,
0.4976378, 1.960624, 0.8430364, 1, 1, 1, 1, 1,
0.505634, 2.496584, 0.5525315, 1, 1, 1, 1, 1,
0.5158312, -0.5385841, 2.646128, 1, 1, 1, 1, 1,
0.5167593, 0.483643, 2.788874, 1, 1, 1, 1, 1,
0.5184713, 0.04745037, 1.742514, 1, 1, 1, 1, 1,
0.5189924, 1.297286, -0.1031223, 1, 1, 1, 1, 1,
0.5264182, -0.9068184, 0.790116, 1, 1, 1, 1, 1,
0.5266409, -0.3321097, 2.117981, 1, 1, 1, 1, 1,
0.5267435, -0.8040248, 2.905387, 1, 1, 1, 1, 1,
0.5280391, 0.8652382, 0.05416201, 1, 1, 1, 1, 1,
0.5292823, 0.6297424, 0.06444225, 1, 1, 1, 1, 1,
0.5312178, -1.359249, 3.834494, 1, 1, 1, 1, 1,
0.5345312, 0.6595634, -0.6719283, 1, 1, 1, 1, 1,
0.5351914, -0.6376151, 3.303976, 1, 1, 1, 1, 1,
0.539139, -0.2668044, 0.7987213, 1, 1, 1, 1, 1,
0.547927, -0.8442979, 3.426974, 0, 0, 1, 1, 1,
0.5501547, 0.2979761, 2.170067, 1, 0, 0, 1, 1,
0.5515968, -0.3201766, 1.901301, 1, 0, 0, 1, 1,
0.5517719, -1.192576, 0.1955913, 1, 0, 0, 1, 1,
0.5536033, 0.2374764, 0.5040379, 1, 0, 0, 1, 1,
0.5580308, 0.8176731, 1.093211, 1, 0, 0, 1, 1,
0.5583915, 1.102174, -0.1295422, 0, 0, 0, 1, 1,
0.5585989, 1.781834, -0.7662055, 0, 0, 0, 1, 1,
0.5589103, -0.01353369, 4.150242, 0, 0, 0, 1, 1,
0.5616069, 2.153338, -0.1467083, 0, 0, 0, 1, 1,
0.5632831, 0.6547199, -0.08009912, 0, 0, 0, 1, 1,
0.5637635, -0.1558241, 2.106396, 0, 0, 0, 1, 1,
0.5645171, -1.424456, 2.880929, 0, 0, 0, 1, 1,
0.5648154, 0.1516414, 1.102633, 1, 1, 1, 1, 1,
0.5722756, 0.03129756, 1.971135, 1, 1, 1, 1, 1,
0.5734934, 0.4890465, 0.3582325, 1, 1, 1, 1, 1,
0.5766262, 1.902062, 0.6434081, 1, 1, 1, 1, 1,
0.5791267, -0.1221615, 1.782674, 1, 1, 1, 1, 1,
0.5793355, 0.01728551, 1.015489, 1, 1, 1, 1, 1,
0.5799393, 0.4399246, -0.4260897, 1, 1, 1, 1, 1,
0.5818631, 1.83869, -0.4986196, 1, 1, 1, 1, 1,
0.5832764, 2.274533, 1.484656, 1, 1, 1, 1, 1,
0.5869153, 0.226275, 0.7918833, 1, 1, 1, 1, 1,
0.5890492, 1.932142, 0.05071307, 1, 1, 1, 1, 1,
0.5905077, -0.5327299, 1.718229, 1, 1, 1, 1, 1,
0.5934853, -0.5172873, 1.582682, 1, 1, 1, 1, 1,
0.5973883, 0.06067544, 0.6737696, 1, 1, 1, 1, 1,
0.598545, -0.9201453, 3.850925, 1, 1, 1, 1, 1,
0.5991055, 0.4807791, 2.723665, 0, 0, 1, 1, 1,
0.5996549, 0.04990325, 1.082164, 1, 0, 0, 1, 1,
0.606444, 0.07170238, 1.307479, 1, 0, 0, 1, 1,
0.6112142, 0.2928518, -0.390381, 1, 0, 0, 1, 1,
0.611914, -1.076833, 3.86082, 1, 0, 0, 1, 1,
0.6142214, 1.110936, -0.3922846, 1, 0, 0, 1, 1,
0.6163896, -1.066879, 3.16665, 0, 0, 0, 1, 1,
0.6236876, 0.4721537, 1.642318, 0, 0, 0, 1, 1,
0.6242756, 1.217588, -1.017548, 0, 0, 0, 1, 1,
0.6258137, 0.667218, 0.4058609, 0, 0, 0, 1, 1,
0.627632, -1.123992, 1.629064, 0, 0, 0, 1, 1,
0.6292343, -0.2869042, 1.575884, 0, 0, 0, 1, 1,
0.6298092, -1.349931, 3.27548, 0, 0, 0, 1, 1,
0.6311639, -2.210855, 3.853453, 1, 1, 1, 1, 1,
0.6321835, 0.745342, -0.8982086, 1, 1, 1, 1, 1,
0.6351401, 1.280039, 1.234874, 1, 1, 1, 1, 1,
0.6354668, 1.618053, -1.120758, 1, 1, 1, 1, 1,
0.6358404, 0.6452827, 1.1093, 1, 1, 1, 1, 1,
0.6373453, -1.10191, 2.722356, 1, 1, 1, 1, 1,
0.6374601, -0.4990506, 1.94396, 1, 1, 1, 1, 1,
0.6390498, 1.166803, 0.9123612, 1, 1, 1, 1, 1,
0.6392497, 0.7818303, 1.220433, 1, 1, 1, 1, 1,
0.6418647, 0.970934, -0.6545114, 1, 1, 1, 1, 1,
0.6442776, 0.0844412, 2.304629, 1, 1, 1, 1, 1,
0.647453, -3.141653, 1.751904, 1, 1, 1, 1, 1,
0.6503891, -0.3568486, 0.865326, 1, 1, 1, 1, 1,
0.6505917, 0.3443584, -1.147019, 1, 1, 1, 1, 1,
0.6542143, -0.3464752, 1.929515, 1, 1, 1, 1, 1,
0.6556804, 1.461762, 1.241498, 0, 0, 1, 1, 1,
0.6567985, -0.4656713, 3.897181, 1, 0, 0, 1, 1,
0.6586779, -1.863852, 4.592408, 1, 0, 0, 1, 1,
0.664238, 0.7479044, -0.5837044, 1, 0, 0, 1, 1,
0.6650996, -1.941397, 3.359307, 1, 0, 0, 1, 1,
0.6694937, 0.183151, 0.8554833, 1, 0, 0, 1, 1,
0.6744012, 0.8611615, 1.85172, 0, 0, 0, 1, 1,
0.6767775, -0.9001583, 2.714556, 0, 0, 0, 1, 1,
0.6796157, -0.2095005, 1.558423, 0, 0, 0, 1, 1,
0.6809856, 0.4955821, 1.615166, 0, 0, 0, 1, 1,
0.681442, -1.307692, 3.548254, 0, 0, 0, 1, 1,
0.6829661, -0.2719765, 2.15668, 0, 0, 0, 1, 1,
0.6862057, -1.003271, 3.08492, 0, 0, 0, 1, 1,
0.6887804, -0.5501591, 1.255661, 1, 1, 1, 1, 1,
0.6897101, 0.8504626, 1.082231, 1, 1, 1, 1, 1,
0.6925384, -0.8260684, 2.628456, 1, 1, 1, 1, 1,
0.7002174, -1.771271, 2.399937, 1, 1, 1, 1, 1,
0.7020127, 1.597311, 0.8747577, 1, 1, 1, 1, 1,
0.7149506, 1.781479, -1.471646, 1, 1, 1, 1, 1,
0.7170432, 0.4236766, 0.8655965, 1, 1, 1, 1, 1,
0.7174619, 0.4287546, 1.452456, 1, 1, 1, 1, 1,
0.7175912, -0.3879954, 5.139893, 1, 1, 1, 1, 1,
0.7260004, 0.5071617, 1.805371, 1, 1, 1, 1, 1,
0.7309264, 0.1490347, -0.4287389, 1, 1, 1, 1, 1,
0.7316679, -1.049339, 2.489572, 1, 1, 1, 1, 1,
0.7326187, 0.149983, 0.8054825, 1, 1, 1, 1, 1,
0.7354097, 0.2390178, 1.740019, 1, 1, 1, 1, 1,
0.7378891, 1.041518, 0.7345582, 1, 1, 1, 1, 1,
0.7450362, -0.9795923, 4.145415, 0, 0, 1, 1, 1,
0.7488257, 0.2222534, 2.992165, 1, 0, 0, 1, 1,
0.7510876, -0.2604251, 2.967253, 1, 0, 0, 1, 1,
0.7645953, -0.06434098, 1.970651, 1, 0, 0, 1, 1,
0.765725, -1.078431, 2.857723, 1, 0, 0, 1, 1,
0.7691503, -0.5733298, 2.708228, 1, 0, 0, 1, 1,
0.769297, -0.9203929, 1.132149, 0, 0, 0, 1, 1,
0.7772984, -0.4635828, 2.176807, 0, 0, 0, 1, 1,
0.7801202, 0.2266711, -0.1716217, 0, 0, 0, 1, 1,
0.7807892, -2.178231, 1.928321, 0, 0, 0, 1, 1,
0.7858862, 0.7859927, 0.6431264, 0, 0, 0, 1, 1,
0.7961924, 0.660481, 2.340933, 0, 0, 0, 1, 1,
0.8018957, -0.06293234, 1.485492, 0, 0, 0, 1, 1,
0.8087915, -0.4941421, 1.412252, 1, 1, 1, 1, 1,
0.8107316, -1.310292, 2.868165, 1, 1, 1, 1, 1,
0.8161727, 0.4576046, 1.279724, 1, 1, 1, 1, 1,
0.8207909, -0.4458679, 1.186918, 1, 1, 1, 1, 1,
0.8211461, 1.320736, 1.879983, 1, 1, 1, 1, 1,
0.8230248, -2.715452, 5.536583, 1, 1, 1, 1, 1,
0.8240178, 1.28047, 0.0329867, 1, 1, 1, 1, 1,
0.8347872, -0.7733319, 0.9936967, 1, 1, 1, 1, 1,
0.8357258, -2.144638, 1.775744, 1, 1, 1, 1, 1,
0.8365326, -0.09156802, 0.9295647, 1, 1, 1, 1, 1,
0.8403377, -2.405175, 2.028586, 1, 1, 1, 1, 1,
0.8432744, 0.8792091, 1.902441, 1, 1, 1, 1, 1,
0.8469267, 1.016939, 1.456518, 1, 1, 1, 1, 1,
0.8482106, 0.4629984, 2.119583, 1, 1, 1, 1, 1,
0.8527112, -0.8185312, 1.736303, 1, 1, 1, 1, 1,
0.8550136, 0.3435282, 0.7236216, 0, 0, 1, 1, 1,
0.8604518, -0.626329, 0.6550068, 1, 0, 0, 1, 1,
0.8610225, 0.8040187, 2.637159, 1, 0, 0, 1, 1,
0.8665932, 0.03465979, 2.4939, 1, 0, 0, 1, 1,
0.8682612, -0.1265526, 0.4831555, 1, 0, 0, 1, 1,
0.8689903, -0.5405325, 0.6062456, 1, 0, 0, 1, 1,
0.8723005, -0.02531513, 2.38288, 0, 0, 0, 1, 1,
0.872743, 0.02173089, 0.5146948, 0, 0, 0, 1, 1,
0.872982, 0.7150212, -0.1002622, 0, 0, 0, 1, 1,
0.8765556, 0.08827808, 3.334334, 0, 0, 0, 1, 1,
0.8775886, 0.3562705, 2.176802, 0, 0, 0, 1, 1,
0.8787995, -2.138172, 2.674629, 0, 0, 0, 1, 1,
0.880207, -0.07228848, 2.265412, 0, 0, 0, 1, 1,
0.8855964, -0.3885374, 2.330639, 1, 1, 1, 1, 1,
0.886978, -0.515386, 1.437356, 1, 1, 1, 1, 1,
0.8917728, 1.288859, 0.5791838, 1, 1, 1, 1, 1,
0.894356, 0.7370623, 1.44942, 1, 1, 1, 1, 1,
0.9005427, -0.8468533, 2.058546, 1, 1, 1, 1, 1,
0.9158579, 0.01495054, 1.037208, 1, 1, 1, 1, 1,
0.9224212, 0.5497517, 1.552706, 1, 1, 1, 1, 1,
0.9305511, 1.061371, -0.1136295, 1, 1, 1, 1, 1,
0.9312963, -0.9641474, 2.418432, 1, 1, 1, 1, 1,
0.9416294, 1.001193, -0.8773262, 1, 1, 1, 1, 1,
0.9447454, -0.6453794, 2.203268, 1, 1, 1, 1, 1,
0.9481035, -1.062152, 1.338525, 1, 1, 1, 1, 1,
0.9490162, -0.6098648, 2.038534, 1, 1, 1, 1, 1,
0.95025, -0.5006818, 3.648338, 1, 1, 1, 1, 1,
0.9543777, 1.1766, 0.2467029, 1, 1, 1, 1, 1,
0.9601993, 1.455643, 0.719318, 0, 0, 1, 1, 1,
0.9714408, 0.7214054, 0.4188959, 1, 0, 0, 1, 1,
0.9740811, 0.732483, -1.564191, 1, 0, 0, 1, 1,
0.9756973, -1.312096, 2.065659, 1, 0, 0, 1, 1,
0.9821441, 0.9892046, 0.05349315, 1, 0, 0, 1, 1,
0.9851114, -0.4575495, 3.58651, 1, 0, 0, 1, 1,
0.9852425, 0.9044452, 1.705975, 0, 0, 0, 1, 1,
0.9874389, 1.609012, 1.679199, 0, 0, 0, 1, 1,
0.9890258, 0.3579308, 2.66006, 0, 0, 0, 1, 1,
0.9907844, 0.8495555, 1.365326, 0, 0, 0, 1, 1,
0.9914403, 0.3862324, 0.671797, 0, 0, 0, 1, 1,
0.9916799, -0.8930874, 3.531871, 0, 0, 0, 1, 1,
0.9916807, -0.5526504, 2.075552, 0, 0, 0, 1, 1,
0.9941501, 2.637351, 1.793088, 1, 1, 1, 1, 1,
0.9985921, -1.608062, 0.9636803, 1, 1, 1, 1, 1,
1.000568, 0.2498848, 1.566555, 1, 1, 1, 1, 1,
1.000569, 0.305235, 0.7922821, 1, 1, 1, 1, 1,
1.007766, 0.4055838, 0.7378384, 1, 1, 1, 1, 1,
1.009908, 0.4704324, 2.137081, 1, 1, 1, 1, 1,
1.017305, -2.11332, 2.566605, 1, 1, 1, 1, 1,
1.021614, 1.255768, 1.746003, 1, 1, 1, 1, 1,
1.022611, 0.2600802, -0.551955, 1, 1, 1, 1, 1,
1.028301, 0.5410036, 1.154011, 1, 1, 1, 1, 1,
1.034526, 1.145238, 0.7481878, 1, 1, 1, 1, 1,
1.037567, 2.029814, 0.534277, 1, 1, 1, 1, 1,
1.050322, 0.5142625, 1.184294, 1, 1, 1, 1, 1,
1.053317, -0.6866702, 2.280219, 1, 1, 1, 1, 1,
1.071633, -0.1880071, 0.6710395, 1, 1, 1, 1, 1,
1.07227, -1.514789, 2.290888, 0, 0, 1, 1, 1,
1.072565, -0.7687743, 0.9080809, 1, 0, 0, 1, 1,
1.072668, -1.184811, 2.215083, 1, 0, 0, 1, 1,
1.078641, 0.7870864, 0.3818917, 1, 0, 0, 1, 1,
1.085074, 0.03421359, -0.2561928, 1, 0, 0, 1, 1,
1.085522, 0.9883885, 2.937505, 1, 0, 0, 1, 1,
1.089478, 0.1401316, 1.608726, 0, 0, 0, 1, 1,
1.092089, -1.95963, 3.098637, 0, 0, 0, 1, 1,
1.112297, -1.134395, 2.554675, 0, 0, 0, 1, 1,
1.12287, 0.1527954, 0.88337, 0, 0, 0, 1, 1,
1.123476, 2.125839, 0.05029382, 0, 0, 0, 1, 1,
1.126275, 0.247566, 2.524211, 0, 0, 0, 1, 1,
1.133759, -2.174799, 1.87545, 0, 0, 0, 1, 1,
1.1342, 3.388402, -1.239519, 1, 1, 1, 1, 1,
1.134697, -1.298099, 3.516152, 1, 1, 1, 1, 1,
1.140452, 0.9393894, 1.285727, 1, 1, 1, 1, 1,
1.146812, 0.01547984, 2.25856, 1, 1, 1, 1, 1,
1.148815, 1.044635, 0.6920785, 1, 1, 1, 1, 1,
1.150379, 0.3110241, 1.761371, 1, 1, 1, 1, 1,
1.155578, 1.974183, -1.973365, 1, 1, 1, 1, 1,
1.15933, 1.799842, 0.3962363, 1, 1, 1, 1, 1,
1.183724, -0.1669466, 0.345694, 1, 1, 1, 1, 1,
1.187021, 0.842813, 1.874173, 1, 1, 1, 1, 1,
1.196541, -0.446186, 1.082851, 1, 1, 1, 1, 1,
1.200205, -0.6935934, 2.789734, 1, 1, 1, 1, 1,
1.216209, -0.9255855, -0.5326097, 1, 1, 1, 1, 1,
1.221807, 0.4637992, 1.309541, 1, 1, 1, 1, 1,
1.223848, 0.5632001, 1.386473, 1, 1, 1, 1, 1,
1.23132, -2.429255, 2.2892, 0, 0, 1, 1, 1,
1.235631, -1.327581, 1.627185, 1, 0, 0, 1, 1,
1.242297, 2.506078, -1.205246, 1, 0, 0, 1, 1,
1.255192, -0.4579308, 2.480004, 1, 0, 0, 1, 1,
1.273329, 0.4685491, 1.439974, 1, 0, 0, 1, 1,
1.280578, 0.0956026, 0.8886622, 1, 0, 0, 1, 1,
1.281423, -0.4539017, 1.677022, 0, 0, 0, 1, 1,
1.281877, -1.915293, 2.678129, 0, 0, 0, 1, 1,
1.282664, -0.835642, 0.6965058, 0, 0, 0, 1, 1,
1.287034, -2.102069, 1.260884, 0, 0, 0, 1, 1,
1.288935, 0.3431118, 0.4933925, 0, 0, 0, 1, 1,
1.28918, -1.611575, 3.145002, 0, 0, 0, 1, 1,
1.296173, 0.2727792, 2.454519, 0, 0, 0, 1, 1,
1.304244, -1.321404, 3.790179, 1, 1, 1, 1, 1,
1.306021, -1.040082, 3.828899, 1, 1, 1, 1, 1,
1.307313, 0.8229899, 0.2236588, 1, 1, 1, 1, 1,
1.32158, 0.2344723, 2.445739, 1, 1, 1, 1, 1,
1.322215, 0.7210624, 1.173293, 1, 1, 1, 1, 1,
1.332853, -0.7316499, 5.050207, 1, 1, 1, 1, 1,
1.336272, 0.4764512, 0.1937067, 1, 1, 1, 1, 1,
1.346199, 1.482555, 0.8696038, 1, 1, 1, 1, 1,
1.350304, -0.8494326, 1.439663, 1, 1, 1, 1, 1,
1.362285, 0.1869205, -0.1068611, 1, 1, 1, 1, 1,
1.365503, -0.4654963, 0.5282766, 1, 1, 1, 1, 1,
1.382849, -0.6028198, 3.506467, 1, 1, 1, 1, 1,
1.383289, 1.705796, 0.06081574, 1, 1, 1, 1, 1,
1.387674, 0.08303811, -0.5835721, 1, 1, 1, 1, 1,
1.389864, 0.08633024, -0.7209969, 1, 1, 1, 1, 1,
1.413531, -0.6430578, 2.393091, 0, 0, 1, 1, 1,
1.413883, -1.484203, 2.362385, 1, 0, 0, 1, 1,
1.423702, 0.5931205, 0.9290469, 1, 0, 0, 1, 1,
1.449266, -0.1109394, 0.6019283, 1, 0, 0, 1, 1,
1.451633, 1.767231, 1.968946, 1, 0, 0, 1, 1,
1.462016, -0.3979464, 1.949694, 1, 0, 0, 1, 1,
1.467791, -0.07695237, 3.775567, 0, 0, 0, 1, 1,
1.485955, 0.4805329, 1.976006, 0, 0, 0, 1, 1,
1.494705, 0.8694566, 1.260036, 0, 0, 0, 1, 1,
1.494769, 1.364745, 1.238097, 0, 0, 0, 1, 1,
1.495893, -0.05030281, 2.798123, 0, 0, 0, 1, 1,
1.505411, 0.07520267, 2.539224, 0, 0, 0, 1, 1,
1.506802, 3.029874, 0.8193179, 0, 0, 0, 1, 1,
1.510358, -0.9558488, 1.882854, 1, 1, 1, 1, 1,
1.51671, -0.8131517, 0.9444751, 1, 1, 1, 1, 1,
1.52229, 1.284765, -0.3020058, 1, 1, 1, 1, 1,
1.542709, 0.03832245, 1.528844, 1, 1, 1, 1, 1,
1.542856, -0.8665211, 1.259889, 1, 1, 1, 1, 1,
1.54611, -2.132599, 2.084477, 1, 1, 1, 1, 1,
1.548216, -0.2092739, 0.5926946, 1, 1, 1, 1, 1,
1.571592, 0.7082346, -0.602053, 1, 1, 1, 1, 1,
1.571708, 0.3923756, -0.275999, 1, 1, 1, 1, 1,
1.632651, -1.134973, 0.5502387, 1, 1, 1, 1, 1,
1.63315, 1.49978, 2.365782, 1, 1, 1, 1, 1,
1.641894, 0.1271518, 1.11069, 1, 1, 1, 1, 1,
1.644415, 0.7516793, 1.29397, 1, 1, 1, 1, 1,
1.662049, -1.31212, 2.721434, 1, 1, 1, 1, 1,
1.68117, 0.355326, 2.167961, 1, 1, 1, 1, 1,
1.689699, -0.5922359, 0.3898769, 0, 0, 1, 1, 1,
1.705611, 1.001932, 2.085864, 1, 0, 0, 1, 1,
1.723025, -0.8582988, 2.383226, 1, 0, 0, 1, 1,
1.735563, 0.2690075, 0.1919938, 1, 0, 0, 1, 1,
1.748784, -1.887265, 0.8103613, 1, 0, 0, 1, 1,
1.7611, 1.224718, 3.034371, 1, 0, 0, 1, 1,
1.77328, -1.062414, 2.802637, 0, 0, 0, 1, 1,
1.80814, 1.120925, -0.9911194, 0, 0, 0, 1, 1,
1.819198, -0.3810835, 1.973772, 0, 0, 0, 1, 1,
1.838892, 1.417681, 0.9095216, 0, 0, 0, 1, 1,
1.871799, 1.400295, 0.3218749, 0, 0, 0, 1, 1,
1.874247, -0.68215, 0.9356389, 0, 0, 0, 1, 1,
1.911596, 0.6887829, 0.5914693, 0, 0, 0, 1, 1,
1.939271, -0.5456238, 1.40645, 1, 1, 1, 1, 1,
1.956779, -0.633195, 2.089761, 1, 1, 1, 1, 1,
1.970468, 0.5838792, 2.022026, 1, 1, 1, 1, 1,
2.000795, -0.03000292, 2.864625, 1, 1, 1, 1, 1,
2.002563, 1.251223, -0.3011388, 1, 1, 1, 1, 1,
2.003842, -0.2994152, 0.3694772, 1, 1, 1, 1, 1,
2.012483, 0.725282, 2.838241, 1, 1, 1, 1, 1,
2.120378, 0.6433405, 1.413136, 1, 1, 1, 1, 1,
2.124624, -0.3008415, 0.3470669, 1, 1, 1, 1, 1,
2.12476, -0.2149743, 0.1717044, 1, 1, 1, 1, 1,
2.155014, -1.617446, 2.76335, 1, 1, 1, 1, 1,
2.163701, 0.04426504, 1.929807, 1, 1, 1, 1, 1,
2.174118, 0.04229476, -0.01375287, 1, 1, 1, 1, 1,
2.185282, -0.8117056, 3.579564, 1, 1, 1, 1, 1,
2.244829, -1.055431, 3.039437, 1, 1, 1, 1, 1,
2.277356, -1.113698, 2.530638, 0, 0, 1, 1, 1,
2.311385, 1.717722, 0.7058498, 1, 0, 0, 1, 1,
2.359666, -0.8992979, 1.916512, 1, 0, 0, 1, 1,
2.439553, -0.3894916, 1.78461, 1, 0, 0, 1, 1,
2.454704, -1.275401, 4.908276, 1, 0, 0, 1, 1,
2.471856, 0.7591732, 1.915693, 1, 0, 0, 1, 1,
2.498692, 1.060087, -0.3493089, 0, 0, 0, 1, 1,
2.499415, -1.563891, 0.8692851, 0, 0, 0, 1, 1,
2.533342, 1.201553, -0.9291338, 0, 0, 0, 1, 1,
2.556455, -0.7809706, 0.9686616, 0, 0, 0, 1, 1,
2.566635, -1.701309, 3.88731, 0, 0, 0, 1, 1,
2.576911, -1.841326, 2.654806, 0, 0, 0, 1, 1,
2.62767, -0.9757841, 2.104435, 0, 0, 0, 1, 1,
2.636547, -1.145454, 2.621651, 1, 1, 1, 1, 1,
2.673153, -0.3430779, 1.877534, 1, 1, 1, 1, 1,
2.807469, -0.8699739, 1.287752, 1, 1, 1, 1, 1,
2.898623, 0.8504561, 2.415111, 1, 1, 1, 1, 1,
2.953042, 0.8007964, 1.001319, 1, 1, 1, 1, 1,
3.113098, 1.223492, 0.8839441, 1, 1, 1, 1, 1,
3.148067, 1.508302, 3.02729, 1, 1, 1, 1, 1
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
var radius = 10.33796;
var distance = 36.31163;
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
mvMatrix.translate( 0.3589323, 0.07061219, 0.4009411 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.31163);
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
