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
-2.989625, 0.7558054, -1.937564, 1, 0, 0, 1,
-2.882348, 0.4106936, 0.4889244, 1, 0.007843138, 0, 1,
-2.808576, 0.6240131, -1.479179, 1, 0.01176471, 0, 1,
-2.672843, 0.5138059, -1.732926, 1, 0.01960784, 0, 1,
-2.45752, 0.3244523, -1.824991, 1, 0.02352941, 0, 1,
-2.412825, 0.1504473, -1.508068, 1, 0.03137255, 0, 1,
-2.406935, 0.333757, -1.336191, 1, 0.03529412, 0, 1,
-2.37412, -2.135394, -2.871309, 1, 0.04313726, 0, 1,
-2.357026, 0.5522262, -2.049192, 1, 0.04705882, 0, 1,
-2.240196, -1.612798, -3.105816, 1, 0.05490196, 0, 1,
-2.201267, 0.6233457, -1.055878, 1, 0.05882353, 0, 1,
-2.140199, -0.6517098, -2.905705, 1, 0.06666667, 0, 1,
-2.073117, 0.02534888, -0.6897675, 1, 0.07058824, 0, 1,
-2.071227, 0.1269469, -0.9197133, 1, 0.07843138, 0, 1,
-2.070073, 1.426237, -0.3915178, 1, 0.08235294, 0, 1,
-2.051969, 1.081829, -0.8356681, 1, 0.09019608, 0, 1,
-2.044533, -1.10667, -1.537779, 1, 0.09411765, 0, 1,
-2.035006, 0.3438033, -0.7109634, 1, 0.1019608, 0, 1,
-2.010968, -1.307666, -2.67225, 1, 0.1098039, 0, 1,
-1.987203, 0.9444892, -1.120444, 1, 0.1137255, 0, 1,
-1.981941, -0.7110424, -2.169936, 1, 0.1215686, 0, 1,
-1.944532, -1.068715, -3.130429, 1, 0.1254902, 0, 1,
-1.943787, 0.07709315, -1.760491, 1, 0.1333333, 0, 1,
-1.938003, -0.5710365, -2.295327, 1, 0.1372549, 0, 1,
-1.890398, 0.4979141, -1.615118, 1, 0.145098, 0, 1,
-1.870587, -1.037124, -0.4002075, 1, 0.1490196, 0, 1,
-1.856248, 1.151646, 0.4541748, 1, 0.1568628, 0, 1,
-1.83555, 1.054996, 0.2153563, 1, 0.1607843, 0, 1,
-1.829009, 0.2052667, -1.022219, 1, 0.1686275, 0, 1,
-1.825533, 0.872578, -2.894093, 1, 0.172549, 0, 1,
-1.787498, -0.329592, -2.572479, 1, 0.1803922, 0, 1,
-1.779122, -1.16221, -1.259347, 1, 0.1843137, 0, 1,
-1.757936, -0.1657249, -1.04458, 1, 0.1921569, 0, 1,
-1.75296, 0.08667858, -2.587628, 1, 0.1960784, 0, 1,
-1.750415, 0.06467645, 1.035832, 1, 0.2039216, 0, 1,
-1.729412, 0.2653571, -0.3466097, 1, 0.2117647, 0, 1,
-1.728938, -0.7116165, -2.705642, 1, 0.2156863, 0, 1,
-1.726622, 0.9833208, -0.1365352, 1, 0.2235294, 0, 1,
-1.717072, -0.2671931, -1.079249, 1, 0.227451, 0, 1,
-1.712149, 0.7991794, 0.6438958, 1, 0.2352941, 0, 1,
-1.712041, -0.3118103, -1.179127, 1, 0.2392157, 0, 1,
-1.71022, 0.913438, 0.1785224, 1, 0.2470588, 0, 1,
-1.709996, -0.2792161, -1.965836, 1, 0.2509804, 0, 1,
-1.703567, -0.9933109, -3.379134, 1, 0.2588235, 0, 1,
-1.698886, -0.05679819, -1.92768, 1, 0.2627451, 0, 1,
-1.695465, 0.9756959, -0.4019473, 1, 0.2705882, 0, 1,
-1.691285, 0.8882351, -0.5900048, 1, 0.2745098, 0, 1,
-1.683789, 0.9238102, -0.04914029, 1, 0.282353, 0, 1,
-1.683127, -0.2963918, -2.805716, 1, 0.2862745, 0, 1,
-1.681024, 1.679262, 1.02731, 1, 0.2941177, 0, 1,
-1.680723, 0.2144624, -0.3088352, 1, 0.3019608, 0, 1,
-1.6638, -1.423137, -2.610739, 1, 0.3058824, 0, 1,
-1.659158, -0.8143934, -1.804502, 1, 0.3137255, 0, 1,
-1.625357, 0.5970353, -0.2490836, 1, 0.3176471, 0, 1,
-1.620241, -0.166036, -4.026198, 1, 0.3254902, 0, 1,
-1.61546, -1.137249, -1.497876, 1, 0.3294118, 0, 1,
-1.611766, -0.7001797, -2.863263, 1, 0.3372549, 0, 1,
-1.603386, -1.494007, -2.885533, 1, 0.3411765, 0, 1,
-1.595601, -0.6730821, -2.723947, 1, 0.3490196, 0, 1,
-1.570074, -0.1534978, -0.4346351, 1, 0.3529412, 0, 1,
-1.547554, 2.336091, -0.8284501, 1, 0.3607843, 0, 1,
-1.543938, -1.40638, -0.4912404, 1, 0.3647059, 0, 1,
-1.534333, -2.365852, -2.379987, 1, 0.372549, 0, 1,
-1.532413, 0.9898919, -0.07522704, 1, 0.3764706, 0, 1,
-1.530867, 0.4604464, 0.2279626, 1, 0.3843137, 0, 1,
-1.518842, -0.1286748, -0.5186881, 1, 0.3882353, 0, 1,
-1.515848, -1.244414, -1.767542, 1, 0.3960784, 0, 1,
-1.505101, -0.895571, -1.406744, 1, 0.4039216, 0, 1,
-1.502719, 1.173645, -1.655636, 1, 0.4078431, 0, 1,
-1.501821, -0.4338573, -2.091221, 1, 0.4156863, 0, 1,
-1.495686, 0.8144866, -1.786507, 1, 0.4196078, 0, 1,
-1.494622, 0.9661505, -1.605434, 1, 0.427451, 0, 1,
-1.491799, 0.642875, -1.967507, 1, 0.4313726, 0, 1,
-1.484178, -0.07626842, -1.086907, 1, 0.4392157, 0, 1,
-1.480867, -0.04200112, -1.676972, 1, 0.4431373, 0, 1,
-1.474897, -1.543299, -2.093499, 1, 0.4509804, 0, 1,
-1.46897, 0.796082, -1.475016, 1, 0.454902, 0, 1,
-1.466045, -0.3069744, -1.910264, 1, 0.4627451, 0, 1,
-1.459925, 0.493975, -1.124483, 1, 0.4666667, 0, 1,
-1.432574, -0.232478, -1.489898, 1, 0.4745098, 0, 1,
-1.431464, 0.1558887, -1.660584, 1, 0.4784314, 0, 1,
-1.425304, -1.194009, -1.406059, 1, 0.4862745, 0, 1,
-1.422228, 1.366469, -0.8664765, 1, 0.4901961, 0, 1,
-1.418762, 1.130491, -1.767773, 1, 0.4980392, 0, 1,
-1.418645, -0.9015661, -3.769245, 1, 0.5058824, 0, 1,
-1.39282, 1.274714, 1.025932, 1, 0.509804, 0, 1,
-1.387353, 1.149443, 0.4963646, 1, 0.5176471, 0, 1,
-1.386901, -1.549988, -1.026418, 1, 0.5215687, 0, 1,
-1.385424, -0.3361725, -1.135321, 1, 0.5294118, 0, 1,
-1.384292, -0.3246246, -1.311392, 1, 0.5333334, 0, 1,
-1.384139, -1.506222, -2.907403, 1, 0.5411765, 0, 1,
-1.378293, -1.005523, -3.33571, 1, 0.5450981, 0, 1,
-1.371174, -0.9722492, -2.90421, 1, 0.5529412, 0, 1,
-1.357849, 1.316285, 0.02894219, 1, 0.5568628, 0, 1,
-1.353524, -0.217011, -2.956661, 1, 0.5647059, 0, 1,
-1.348408, -0.2872625, -0.3556934, 1, 0.5686275, 0, 1,
-1.3448, -0.2655573, -0.8824643, 1, 0.5764706, 0, 1,
-1.344741, 0.9359925, -0.602239, 1, 0.5803922, 0, 1,
-1.341303, 0.1452411, -0.5550507, 1, 0.5882353, 0, 1,
-1.34128, -0.01846656, -1.548298, 1, 0.5921569, 0, 1,
-1.341118, 0.1348066, -1.306645, 1, 0.6, 0, 1,
-1.337411, -0.05952499, -2.71517, 1, 0.6078432, 0, 1,
-1.325877, 0.4617456, -1.706757, 1, 0.6117647, 0, 1,
-1.324864, -0.1964285, -1.825998, 1, 0.6196079, 0, 1,
-1.323149, 0.5465106, -3.502656, 1, 0.6235294, 0, 1,
-1.312758, 1.249999, 0.01680788, 1, 0.6313726, 0, 1,
-1.305257, -0.1129446, -2.047263, 1, 0.6352941, 0, 1,
-1.301572, 0.6991446, 0.40435, 1, 0.6431373, 0, 1,
-1.29893, -0.3166293, -0.4955576, 1, 0.6470588, 0, 1,
-1.289174, 0.9735773, -0.3593343, 1, 0.654902, 0, 1,
-1.285124, -1.236553, -1.15945, 1, 0.6588235, 0, 1,
-1.28275, 0.1688723, -1.685452, 1, 0.6666667, 0, 1,
-1.280913, 0.3249844, -0.23068, 1, 0.6705883, 0, 1,
-1.277008, -0.6959647, -2.686962, 1, 0.6784314, 0, 1,
-1.270884, 0.4327353, -2.882496, 1, 0.682353, 0, 1,
-1.269276, 0.3505781, -2.495108, 1, 0.6901961, 0, 1,
-1.257669, -0.5531047, -3.646891, 1, 0.6941177, 0, 1,
-1.247066, 0.1201634, -1.785782, 1, 0.7019608, 0, 1,
-1.234244, 0.2604497, -2.611104, 1, 0.7098039, 0, 1,
-1.21208, 0.1240738, -0.4947806, 1, 0.7137255, 0, 1,
-1.211374, -0.6855192, -1.232442, 1, 0.7215686, 0, 1,
-1.211096, -1.226241, -3.028994, 1, 0.7254902, 0, 1,
-1.206927, -1.388771, -1.84509, 1, 0.7333333, 0, 1,
-1.200261, -0.2242189, -2.389985, 1, 0.7372549, 0, 1,
-1.199369, -0.001578249, -1.903784, 1, 0.7450981, 0, 1,
-1.198234, 0.4182208, -1.968852, 1, 0.7490196, 0, 1,
-1.196123, -0.2431211, 0.1539865, 1, 0.7568628, 0, 1,
-1.19265, 0.800712, -1.481071, 1, 0.7607843, 0, 1,
-1.192592, -0.3657988, 0.1395221, 1, 0.7686275, 0, 1,
-1.189448, 0.8023258, 0.6801006, 1, 0.772549, 0, 1,
-1.188977, -1.274266, -2.321184, 1, 0.7803922, 0, 1,
-1.188439, 0.8308068, -0.3108582, 1, 0.7843137, 0, 1,
-1.187076, -0.3509866, -2.494038, 1, 0.7921569, 0, 1,
-1.183269, -0.4760919, -3.016554, 1, 0.7960784, 0, 1,
-1.173726, -0.5550497, -0.06210796, 1, 0.8039216, 0, 1,
-1.158946, 0.9114851, -0.3581899, 1, 0.8117647, 0, 1,
-1.152263, -0.7114, -2.394879, 1, 0.8156863, 0, 1,
-1.146394, -0.1648683, -2.690979, 1, 0.8235294, 0, 1,
-1.117703, -0.6590056, -4.042156, 1, 0.827451, 0, 1,
-1.116462, 0.7723073, 0.4648654, 1, 0.8352941, 0, 1,
-1.107316, 2.516176, 0.1947062, 1, 0.8392157, 0, 1,
-1.106737, 0.7840403, 0.4046696, 1, 0.8470588, 0, 1,
-1.105834, 1.133925, -1.985496, 1, 0.8509804, 0, 1,
-1.099464, 0.3617537, 0.904348, 1, 0.8588235, 0, 1,
-1.097276, 0.2643181, -1.202579, 1, 0.8627451, 0, 1,
-1.076388, -0.148658, -3.639292, 1, 0.8705882, 0, 1,
-1.069597, -2.37122, -1.7428, 1, 0.8745098, 0, 1,
-1.068595, 0.3384, -0.2822938, 1, 0.8823529, 0, 1,
-1.045964, -1.179245, -1.71387, 1, 0.8862745, 0, 1,
-1.045551, -0.1218884, -4.342265, 1, 0.8941177, 0, 1,
-1.040653, -0.1539943, -1.146681, 1, 0.8980392, 0, 1,
-1.037355, 0.1650267, -1.693328, 1, 0.9058824, 0, 1,
-1.035087, 2.223391, -0.128349, 1, 0.9137255, 0, 1,
-1.032581, 0.8171278, -0.2957186, 1, 0.9176471, 0, 1,
-1.031331, 0.06635897, -2.871491, 1, 0.9254902, 0, 1,
-1.030671, -0.4039364, -1.113549, 1, 0.9294118, 0, 1,
-1.030425, 3.178554, -0.9645119, 1, 0.9372549, 0, 1,
-1.027888, -0.7408641, -3.754597, 1, 0.9411765, 0, 1,
-1.02085, 0.1874909, 0.3802594, 1, 0.9490196, 0, 1,
-1.020068, 2.524543, -0.4691756, 1, 0.9529412, 0, 1,
-1.015297, -0.04631712, -0.5420107, 1, 0.9607843, 0, 1,
-1.012765, 0.724628, -0.560919, 1, 0.9647059, 0, 1,
-1.005885, 0.406109, -2.806038, 1, 0.972549, 0, 1,
-1.004127, -0.946156, -2.18963, 1, 0.9764706, 0, 1,
-1.000772, -1.533867, -2.026011, 1, 0.9843137, 0, 1,
-0.9973685, -0.663806, -2.575293, 1, 0.9882353, 0, 1,
-0.9912504, 1.223912, 0.3060781, 1, 0.9960784, 0, 1,
-0.9861344, 0.7659494, -0.9066325, 0.9960784, 1, 0, 1,
-0.9791058, 0.4619007, -1.589021, 0.9921569, 1, 0, 1,
-0.9736074, 0.4817785, -1.552244, 0.9843137, 1, 0, 1,
-0.9724661, 0.6279491, -2.734571, 0.9803922, 1, 0, 1,
-0.9687924, 1.86495, 0.6392294, 0.972549, 1, 0, 1,
-0.9678976, 1.40566, 0.4861479, 0.9686275, 1, 0, 1,
-0.9636937, -0.9766844, -4.512668, 0.9607843, 1, 0, 1,
-0.9524906, 1.807898, -1.548561, 0.9568627, 1, 0, 1,
-0.9465554, -0.3871149, -1.903472, 0.9490196, 1, 0, 1,
-0.9459939, -1.87158, -3.754879, 0.945098, 1, 0, 1,
-0.9364596, -0.5147424, -1.375125, 0.9372549, 1, 0, 1,
-0.9336556, -1.122191, -1.225307, 0.9333333, 1, 0, 1,
-0.9235322, 0.5063081, -1.480301, 0.9254902, 1, 0, 1,
-0.9224729, 0.1015851, -2.772727, 0.9215686, 1, 0, 1,
-0.9198407, 1.084565, -1.824285, 0.9137255, 1, 0, 1,
-0.9159606, -0.3029746, -2.657138, 0.9098039, 1, 0, 1,
-0.9141988, 0.5935819, -1.772221, 0.9019608, 1, 0, 1,
-0.9120824, 0.5675185, -1.855497, 0.8941177, 1, 0, 1,
-0.9111575, -1.671838, -4.146464, 0.8901961, 1, 0, 1,
-0.9090787, 1.115205, -0.1569076, 0.8823529, 1, 0, 1,
-0.8968241, -1.357445, -3.405358, 0.8784314, 1, 0, 1,
-0.8958057, 1.745139, 0.3099067, 0.8705882, 1, 0, 1,
-0.8937694, 0.8141966, -2.049818, 0.8666667, 1, 0, 1,
-0.8925892, -0.268454, -1.913567, 0.8588235, 1, 0, 1,
-0.8917966, -0.4035619, -0.9611857, 0.854902, 1, 0, 1,
-0.8864169, 0.7205895, -0.7750648, 0.8470588, 1, 0, 1,
-0.8818601, 1.755195, 0.806085, 0.8431373, 1, 0, 1,
-0.8778264, 1.201719, 0.1462008, 0.8352941, 1, 0, 1,
-0.8718963, -0.4464877, -2.334915, 0.8313726, 1, 0, 1,
-0.8611953, 0.3907278, -1.394707, 0.8235294, 1, 0, 1,
-0.855161, 0.3968107, -1.529534, 0.8196079, 1, 0, 1,
-0.8502288, -0.6450645, -1.877622, 0.8117647, 1, 0, 1,
-0.8497317, -1.179529, -0.04639973, 0.8078431, 1, 0, 1,
-0.8486515, 1.453094, -2.576756, 0.8, 1, 0, 1,
-0.8402973, 0.7185395, -1.204916, 0.7921569, 1, 0, 1,
-0.8393782, -1.228528, -3.072815, 0.7882353, 1, 0, 1,
-0.8387358, -0.4018389, -2.000355, 0.7803922, 1, 0, 1,
-0.8263628, -0.3968028, -1.962791, 0.7764706, 1, 0, 1,
-0.8243792, 0.4343082, 0.738954, 0.7686275, 1, 0, 1,
-0.8179255, 0.3314193, -2.697484, 0.7647059, 1, 0, 1,
-0.8169907, -0.8598608, -3.131962, 0.7568628, 1, 0, 1,
-0.8124227, -0.6799953, -2.472755, 0.7529412, 1, 0, 1,
-0.8119065, 1.560017, 0.8670009, 0.7450981, 1, 0, 1,
-0.8086423, 0.223117, -0.85743, 0.7411765, 1, 0, 1,
-0.8071094, 0.3430252, -1.900861, 0.7333333, 1, 0, 1,
-0.8055907, -0.7440529, -2.356101, 0.7294118, 1, 0, 1,
-0.8041866, -0.6932892, -2.83315, 0.7215686, 1, 0, 1,
-0.796914, -0.03330981, -1.550796, 0.7176471, 1, 0, 1,
-0.7897153, 1.171949, 0.4829696, 0.7098039, 1, 0, 1,
-0.7872658, 0.387063, -1.292441, 0.7058824, 1, 0, 1,
-0.786088, 1.953358, -0.1299183, 0.6980392, 1, 0, 1,
-0.785758, -0.5346258, -1.527652, 0.6901961, 1, 0, 1,
-0.7837913, -0.8851955, -3.429184, 0.6862745, 1, 0, 1,
-0.7782105, 0.09902506, -0.8965957, 0.6784314, 1, 0, 1,
-0.7708785, 1.590158, 0.5549304, 0.6745098, 1, 0, 1,
-0.7702348, 0.2976061, -1.020551, 0.6666667, 1, 0, 1,
-0.766474, -1.054739, -3.023361, 0.6627451, 1, 0, 1,
-0.7643304, -0.0332891, -1.088361, 0.654902, 1, 0, 1,
-0.7614914, 0.8910431, -0.3810812, 0.6509804, 1, 0, 1,
-0.7578987, -1.203987, -1.852535, 0.6431373, 1, 0, 1,
-0.7561239, 1.48721, -1.095956, 0.6392157, 1, 0, 1,
-0.7556982, -1.17847, -1.147452, 0.6313726, 1, 0, 1,
-0.7486778, 1.147072, -0.812233, 0.627451, 1, 0, 1,
-0.746102, -1.615594, -2.993315, 0.6196079, 1, 0, 1,
-0.743576, 0.0143688, -3.303496, 0.6156863, 1, 0, 1,
-0.7413969, 2.34975, -1.995404, 0.6078432, 1, 0, 1,
-0.7399025, -0.1742077, -1.261421, 0.6039216, 1, 0, 1,
-0.7334734, -0.6141729, -1.516742, 0.5960785, 1, 0, 1,
-0.7318476, -2.022737, -2.415047, 0.5882353, 1, 0, 1,
-0.725697, 1.497513, -0.7211765, 0.5843138, 1, 0, 1,
-0.7200204, -0.1722113, -1.43965, 0.5764706, 1, 0, 1,
-0.7189269, 0.3451795, -1.435658, 0.572549, 1, 0, 1,
-0.7175135, 1.906935, 1.070702, 0.5647059, 1, 0, 1,
-0.7155733, 0.5440739, -2.14951, 0.5607843, 1, 0, 1,
-0.7151963, 0.5394093, -1.982213, 0.5529412, 1, 0, 1,
-0.7122331, 0.1210904, -2.380072, 0.5490196, 1, 0, 1,
-0.7121208, 0.005488316, -1.378857, 0.5411765, 1, 0, 1,
-0.7113234, -0.1737378, -2.318329, 0.5372549, 1, 0, 1,
-0.7027079, -0.6725051, -3.749093, 0.5294118, 1, 0, 1,
-0.7012774, -0.3430874, -2.066422, 0.5254902, 1, 0, 1,
-0.6983752, 0.09064711, -2.05771, 0.5176471, 1, 0, 1,
-0.6949592, 0.8006991, -0.866058, 0.5137255, 1, 0, 1,
-0.6914979, -0.09830786, -1.903406, 0.5058824, 1, 0, 1,
-0.6877924, 0.6940196, -0.5847216, 0.5019608, 1, 0, 1,
-0.687602, 0.5650574, -2.130153, 0.4941176, 1, 0, 1,
-0.6816474, -0.5432117, -2.916264, 0.4862745, 1, 0, 1,
-0.6793591, 0.05024046, -1.867061, 0.4823529, 1, 0, 1,
-0.6702995, 1.274321, 0.8688751, 0.4745098, 1, 0, 1,
-0.6687152, -0.9908342, -3.142024, 0.4705882, 1, 0, 1,
-0.666233, 0.5542399, 0.7244979, 0.4627451, 1, 0, 1,
-0.6642917, 1.562989, 0.01073941, 0.4588235, 1, 0, 1,
-0.6604515, 0.5059903, -0.8986819, 0.4509804, 1, 0, 1,
-0.660096, 2.437923, 0.002863652, 0.4470588, 1, 0, 1,
-0.6539509, 0.6597348, -0.5156739, 0.4392157, 1, 0, 1,
-0.6492569, -1.939397, -3.708735, 0.4352941, 1, 0, 1,
-0.648525, 0.4097005, -0.6670865, 0.427451, 1, 0, 1,
-0.647918, -1.259247, -2.65416, 0.4235294, 1, 0, 1,
-0.6469579, 0.8688582, 0.4532942, 0.4156863, 1, 0, 1,
-0.645446, -0.3657077, -2.955593, 0.4117647, 1, 0, 1,
-0.6443974, 0.8934948, -1.346941, 0.4039216, 1, 0, 1,
-0.6431245, -0.344712, -2.844846, 0.3960784, 1, 0, 1,
-0.6387104, -1.346969, -1.996558, 0.3921569, 1, 0, 1,
-0.6366693, -1.041979, -1.248371, 0.3843137, 1, 0, 1,
-0.6360235, -1.235087, -2.835663, 0.3803922, 1, 0, 1,
-0.6335301, 0.7769932, -0.04366327, 0.372549, 1, 0, 1,
-0.6328511, 0.2717755, -0.1485441, 0.3686275, 1, 0, 1,
-0.6314253, -0.7943428, 0.7798159, 0.3607843, 1, 0, 1,
-0.6240913, -1.207716, -3.966598, 0.3568628, 1, 0, 1,
-0.6228163, -2.38434, -1.210229, 0.3490196, 1, 0, 1,
-0.619929, 0.7228721, 0.7969624, 0.345098, 1, 0, 1,
-0.6121979, 1.637575, -0.928866, 0.3372549, 1, 0, 1,
-0.6099123, 0.3246149, -1.306496, 0.3333333, 1, 0, 1,
-0.6083794, -0.4564619, -1.17556, 0.3254902, 1, 0, 1,
-0.6082699, 0.4803824, -2.013365, 0.3215686, 1, 0, 1,
-0.6030856, -1.252198, -2.117007, 0.3137255, 1, 0, 1,
-0.5988431, -2.020394, -2.534078, 0.3098039, 1, 0, 1,
-0.5955542, -0.6823196, -2.099836, 0.3019608, 1, 0, 1,
-0.5911132, 0.5971538, -1.272531, 0.2941177, 1, 0, 1,
-0.5819709, 0.3046659, -1.687469, 0.2901961, 1, 0, 1,
-0.5792965, 0.2503601, 0.333986, 0.282353, 1, 0, 1,
-0.5781344, 1.241731, -0.3694382, 0.2784314, 1, 0, 1,
-0.5760295, -0.7148209, -2.553424, 0.2705882, 1, 0, 1,
-0.5752236, 1.280933, 0.5939229, 0.2666667, 1, 0, 1,
-0.5750204, 0.7592408, -2.411928, 0.2588235, 1, 0, 1,
-0.5742483, 0.5703216, 0.2325398, 0.254902, 1, 0, 1,
-0.5731148, -1.46138, -3.437427, 0.2470588, 1, 0, 1,
-0.5703581, 0.729148, 0.8878196, 0.2431373, 1, 0, 1,
-0.5692099, -0.3321387, -2.886536, 0.2352941, 1, 0, 1,
-0.5644426, 0.6150895, -1.360937, 0.2313726, 1, 0, 1,
-0.5641999, -0.4468687, -1.045426, 0.2235294, 1, 0, 1,
-0.5638749, -0.1656433, -2.068778, 0.2196078, 1, 0, 1,
-0.5594616, -1.395776, -2.575643, 0.2117647, 1, 0, 1,
-0.5585769, 0.9661756, -0.4608881, 0.2078431, 1, 0, 1,
-0.5578952, -0.5838795, -1.737516, 0.2, 1, 0, 1,
-0.5577207, 0.9934481, 0.8366504, 0.1921569, 1, 0, 1,
-0.5571136, -0.1663232, -2.871698, 0.1882353, 1, 0, 1,
-0.5497898, -0.4780264, -3.132326, 0.1803922, 1, 0, 1,
-0.5487106, 1.088243, 0.4550145, 0.1764706, 1, 0, 1,
-0.5486864, -0.4511746, -2.876673, 0.1686275, 1, 0, 1,
-0.5428787, -0.5928281, -1.786463, 0.1647059, 1, 0, 1,
-0.5418687, 1.546158, -0.6193622, 0.1568628, 1, 0, 1,
-0.540831, 2.196687, 0.1290848, 0.1529412, 1, 0, 1,
-0.5385677, -2.027004, -3.484812, 0.145098, 1, 0, 1,
-0.5376058, 0.4079332, -0.8521104, 0.1411765, 1, 0, 1,
-0.5342646, -0.8697999, -2.823426, 0.1333333, 1, 0, 1,
-0.5319132, 1.212267, -1.557095, 0.1294118, 1, 0, 1,
-0.5273952, -0.1718699, -2.220673, 0.1215686, 1, 0, 1,
-0.5263038, 1.397572, 0.8628291, 0.1176471, 1, 0, 1,
-0.5259008, -0.958307, -2.797714, 0.1098039, 1, 0, 1,
-0.5178919, -0.5655165, -3.205688, 0.1058824, 1, 0, 1,
-0.5172206, -0.1572843, -2.558507, 0.09803922, 1, 0, 1,
-0.5171363, 0.9172409, 0.5603475, 0.09019608, 1, 0, 1,
-0.5142888, 0.7114794, -0.5821207, 0.08627451, 1, 0, 1,
-0.5102293, -2.845662, -3.62516, 0.07843138, 1, 0, 1,
-0.5065114, -0.9154785, -3.348017, 0.07450981, 1, 0, 1,
-0.5034934, -1.24557, -2.8007, 0.06666667, 1, 0, 1,
-0.4959415, -0.4535861, -1.912708, 0.0627451, 1, 0, 1,
-0.4956017, 0.408718, -1.233406, 0.05490196, 1, 0, 1,
-0.4915645, 0.2624571, 0.4268256, 0.05098039, 1, 0, 1,
-0.489563, 0.5132446, -1.146399, 0.04313726, 1, 0, 1,
-0.4829262, 1.933817, 0.3623826, 0.03921569, 1, 0, 1,
-0.4827235, 0.09394668, -2.330204, 0.03137255, 1, 0, 1,
-0.4801284, 0.7306548, -0.5327191, 0.02745098, 1, 0, 1,
-0.4783829, -0.7939054, -2.811875, 0.01960784, 1, 0, 1,
-0.4726241, 0.9256409, 1.574683, 0.01568628, 1, 0, 1,
-0.4706347, -1.430172, -4.280836, 0.007843138, 1, 0, 1,
-0.4695249, -0.3001195, -1.293456, 0.003921569, 1, 0, 1,
-0.4685932, -1.662914, -3.302095, 0, 1, 0.003921569, 1,
-0.4640813, 0.4838749, 0.9788119, 0, 1, 0.01176471, 1,
-0.4619794, 0.3646674, -0.7153071, 0, 1, 0.01568628, 1,
-0.4615471, -0.7849564, -1.574785, 0, 1, 0.02352941, 1,
-0.4598824, -0.8504788, -2.325412, 0, 1, 0.02745098, 1,
-0.4580972, 2.032234, 0.7429242, 0, 1, 0.03529412, 1,
-0.4569599, 0.3102164, -0.02862547, 0, 1, 0.03921569, 1,
-0.4526968, 1.987429, 0.9785712, 0, 1, 0.04705882, 1,
-0.4525851, -0.5694408, -1.687942, 0, 1, 0.05098039, 1,
-0.4523045, -0.3443026, -1.522905, 0, 1, 0.05882353, 1,
-0.4497463, -0.4078377, -2.499016, 0, 1, 0.0627451, 1,
-0.4465674, 1.520787, -0.533738, 0, 1, 0.07058824, 1,
-0.4435472, 1.105839, -0.8770105, 0, 1, 0.07450981, 1,
-0.4424336, 1.703826, 0.08692037, 0, 1, 0.08235294, 1,
-0.4399005, -0.8866031, -4.251638, 0, 1, 0.08627451, 1,
-0.4339074, 0.4370416, -3.251195, 0, 1, 0.09411765, 1,
-0.4319457, 0.5159194, -0.2704163, 0, 1, 0.1019608, 1,
-0.4299935, 0.1690427, -1.01927, 0, 1, 0.1058824, 1,
-0.4295079, 1.051377, 0.1695436, 0, 1, 0.1137255, 1,
-0.4230931, 0.8870932, -0.3023154, 0, 1, 0.1176471, 1,
-0.4166548, -1.243025, -2.267231, 0, 1, 0.1254902, 1,
-0.4086886, 1.700007, 0.002524962, 0, 1, 0.1294118, 1,
-0.4054132, 0.3850274, -2.787072, 0, 1, 0.1372549, 1,
-0.4003653, -0.07713566, -2.459903, 0, 1, 0.1411765, 1,
-0.4000127, 1.391187, 0.3830286, 0, 1, 0.1490196, 1,
-0.3991399, -1.210907, -1.495268, 0, 1, 0.1529412, 1,
-0.3981004, 0.2388404, 0.5648305, 0, 1, 0.1607843, 1,
-0.3962767, 0.5608594, -0.803071, 0, 1, 0.1647059, 1,
-0.3960883, 0.1999454, -0.3277198, 0, 1, 0.172549, 1,
-0.394021, 0.4640369, -2.465766, 0, 1, 0.1764706, 1,
-0.3938223, 0.18583, -0.1237931, 0, 1, 0.1843137, 1,
-0.3912404, 0.5586544, 0.1978068, 0, 1, 0.1882353, 1,
-0.3898177, 0.05497527, -0.9844414, 0, 1, 0.1960784, 1,
-0.380333, -0.989075, -4.392885, 0, 1, 0.2039216, 1,
-0.3758635, 0.5686957, 0.2708786, 0, 1, 0.2078431, 1,
-0.375379, 0.06891076, -1.678878, 0, 1, 0.2156863, 1,
-0.3740594, 1.099192, -0.8303458, 0, 1, 0.2196078, 1,
-0.3735329, -0.01941858, -2.311278, 0, 1, 0.227451, 1,
-0.3724701, 1.470387, -0.3169069, 0, 1, 0.2313726, 1,
-0.3702913, -0.3117646, -3.582235, 0, 1, 0.2392157, 1,
-0.3701756, -0.03098864, -2.274019, 0, 1, 0.2431373, 1,
-0.3691207, -0.8340879, -2.016682, 0, 1, 0.2509804, 1,
-0.3687761, 0.165498, -1.512966, 0, 1, 0.254902, 1,
-0.3662758, 0.1263226, -1.408145, 0, 1, 0.2627451, 1,
-0.3659641, -0.3482495, -1.032407, 0, 1, 0.2666667, 1,
-0.3655235, -0.4991725, -3.922964, 0, 1, 0.2745098, 1,
-0.3604198, 1.592455, 0.4774633, 0, 1, 0.2784314, 1,
-0.3584289, -0.9472264, -3.208184, 0, 1, 0.2862745, 1,
-0.3569217, 0.003642996, -1.286725, 0, 1, 0.2901961, 1,
-0.3564658, 0.3911753, -1.285376, 0, 1, 0.2980392, 1,
-0.3562571, 1.250833, 1.920254, 0, 1, 0.3058824, 1,
-0.3556225, 1.015294, -0.3706628, 0, 1, 0.3098039, 1,
-0.3554797, -2.446831, -2.922979, 0, 1, 0.3176471, 1,
-0.350993, 0.02956071, 0.3911844, 0, 1, 0.3215686, 1,
-0.3465296, 0.9914326, 0.8064626, 0, 1, 0.3294118, 1,
-0.3462086, -0.4600996, -2.649574, 0, 1, 0.3333333, 1,
-0.3454458, -0.398922, -2.058763, 0, 1, 0.3411765, 1,
-0.3407866, -0.1658296, -1.363768, 0, 1, 0.345098, 1,
-0.3402648, -0.8217725, -2.560775, 0, 1, 0.3529412, 1,
-0.3402572, -0.05874936, -2.132023, 0, 1, 0.3568628, 1,
-0.3401993, 0.01860425, -1.233028, 0, 1, 0.3647059, 1,
-0.3392542, 0.2241086, -1.183095, 0, 1, 0.3686275, 1,
-0.3377125, -1.297547, -4.733408, 0, 1, 0.3764706, 1,
-0.3369755, -0.05857548, -2.166888, 0, 1, 0.3803922, 1,
-0.3355012, -1.218657, -1.507763, 0, 1, 0.3882353, 1,
-0.332265, 2.111941, -0.6047814, 0, 1, 0.3921569, 1,
-0.330563, -0.1011073, -2.261374, 0, 1, 0.4, 1,
-0.3200589, 0.8609433, 0.5533937, 0, 1, 0.4078431, 1,
-0.3161887, 0.4842235, -3.19499, 0, 1, 0.4117647, 1,
-0.312114, -0.987575, -1.92291, 0, 1, 0.4196078, 1,
-0.3069285, 0.7937488, 0.7413033, 0, 1, 0.4235294, 1,
-0.3068096, 0.8054145, -0.417822, 0, 1, 0.4313726, 1,
-0.304528, -0.6216319, -2.033442, 0, 1, 0.4352941, 1,
-0.2990421, -1.282296, -2.322757, 0, 1, 0.4431373, 1,
-0.298618, 1.203104, 1.27459, 0, 1, 0.4470588, 1,
-0.2962703, -0.4942481, -1.229054, 0, 1, 0.454902, 1,
-0.2924881, -0.4056972, -3.912707, 0, 1, 0.4588235, 1,
-0.2922729, 0.3246856, -2.178486, 0, 1, 0.4666667, 1,
-0.2877501, 0.6500117, 1.405454, 0, 1, 0.4705882, 1,
-0.2864404, -2.288448, -1.823687, 0, 1, 0.4784314, 1,
-0.2849845, -1.027312, -2.201906, 0, 1, 0.4823529, 1,
-0.2811323, -1.423797, -4.261714, 0, 1, 0.4901961, 1,
-0.2804061, 0.3953165, -1.911707, 0, 1, 0.4941176, 1,
-0.2772211, 1.532061, -0.5457438, 0, 1, 0.5019608, 1,
-0.2754782, -0.7717788, -3.08698, 0, 1, 0.509804, 1,
-0.2739123, 1.709593, -0.3857386, 0, 1, 0.5137255, 1,
-0.2736328, 0.579015, -1.677895, 0, 1, 0.5215687, 1,
-0.2729492, 0.7013404, 0.3951572, 0, 1, 0.5254902, 1,
-0.2683102, -0.1785762, -0.7713988, 0, 1, 0.5333334, 1,
-0.2663175, 0.6385789, -1.71381, 0, 1, 0.5372549, 1,
-0.2621234, 0.9742513, 0.3017567, 0, 1, 0.5450981, 1,
-0.2599763, 1.686567, -1.498503, 0, 1, 0.5490196, 1,
-0.2567445, 0.4333338, -0.7532318, 0, 1, 0.5568628, 1,
-0.2534557, 1.210769, 0.8042234, 0, 1, 0.5607843, 1,
-0.2493469, -1.417093, -3.160141, 0, 1, 0.5686275, 1,
-0.2465713, -1.017483, -0.7555382, 0, 1, 0.572549, 1,
-0.2463798, 1.272841, -0.4195563, 0, 1, 0.5803922, 1,
-0.2401233, 0.1350205, -0.764376, 0, 1, 0.5843138, 1,
-0.2386077, 1.049497, -0.9212364, 0, 1, 0.5921569, 1,
-0.2378164, -0.9648488, -1.835772, 0, 1, 0.5960785, 1,
-0.2345933, -0.6759798, -4.641448, 0, 1, 0.6039216, 1,
-0.2337314, 0.3209644, -1.877416, 0, 1, 0.6117647, 1,
-0.2318318, -0.05330954, -0.8005967, 0, 1, 0.6156863, 1,
-0.2293544, 0.6657367, -0.7744294, 0, 1, 0.6235294, 1,
-0.2278195, -0.2764837, -2.69578, 0, 1, 0.627451, 1,
-0.2223172, -0.6387064, -3.481964, 0, 1, 0.6352941, 1,
-0.2153107, 0.3653363, -0.2663086, 0, 1, 0.6392157, 1,
-0.2100948, -0.1090281, -3.367922, 0, 1, 0.6470588, 1,
-0.2093616, 0.3343408, 0.9171017, 0, 1, 0.6509804, 1,
-0.1994388, -0.5574262, -3.262549, 0, 1, 0.6588235, 1,
-0.1990338, 0.9332156, 0.1551269, 0, 1, 0.6627451, 1,
-0.1977931, 0.7664067, -0.4213446, 0, 1, 0.6705883, 1,
-0.1914143, 0.3060873, -1.070513, 0, 1, 0.6745098, 1,
-0.1898111, -0.06462938, -0.9999034, 0, 1, 0.682353, 1,
-0.1866248, 0.6403714, -0.6031951, 0, 1, 0.6862745, 1,
-0.1746299, -1.474267, -1.3961, 0, 1, 0.6941177, 1,
-0.1744297, -1.008236, -3.461313, 0, 1, 0.7019608, 1,
-0.1733389, 0.2214931, 0.6295387, 0, 1, 0.7058824, 1,
-0.169337, 0.2798172, -2.225252, 0, 1, 0.7137255, 1,
-0.1603423, 0.3452843, 0.3277261, 0, 1, 0.7176471, 1,
-0.1601189, -0.1884039, -2.60573, 0, 1, 0.7254902, 1,
-0.1584036, -1.305233, -5.471087, 0, 1, 0.7294118, 1,
-0.1574695, -1.558971, -2.738413, 0, 1, 0.7372549, 1,
-0.1529294, -0.1924285, -3.112466, 0, 1, 0.7411765, 1,
-0.1526002, -0.2547659, -3.137049, 0, 1, 0.7490196, 1,
-0.1518244, -0.2899497, -3.328781, 0, 1, 0.7529412, 1,
-0.1431903, 1.247809, -1.699525, 0, 1, 0.7607843, 1,
-0.1419186, 0.7680141, 0.6260155, 0, 1, 0.7647059, 1,
-0.1389122, -0.004897828, -1.663678, 0, 1, 0.772549, 1,
-0.1311446, -1.339008, -2.959713, 0, 1, 0.7764706, 1,
-0.1303229, 1.526037, 2.227706, 0, 1, 0.7843137, 1,
-0.1300491, 0.8239257, 1.263757, 0, 1, 0.7882353, 1,
-0.1292447, -0.3156717, -0.4548189, 0, 1, 0.7960784, 1,
-0.1281536, -0.2916916, -4.785267, 0, 1, 0.8039216, 1,
-0.120941, 1.230509, 1.268769, 0, 1, 0.8078431, 1,
-0.1201461, -0.8595462, -3.287971, 0, 1, 0.8156863, 1,
-0.1195193, -0.09786753, -1.616481, 0, 1, 0.8196079, 1,
-0.1194583, -1.400704, -3.167408, 0, 1, 0.827451, 1,
-0.1188269, 0.1680139, -2.948474, 0, 1, 0.8313726, 1,
-0.1184638, 0.8546827, -0.7116321, 0, 1, 0.8392157, 1,
-0.1177837, -2.316137, -2.643586, 0, 1, 0.8431373, 1,
-0.1164976, 0.13037, -0.6146602, 0, 1, 0.8509804, 1,
-0.1154372, 1.128155, -0.2698856, 0, 1, 0.854902, 1,
-0.1141984, -0.8901418, -2.724114, 0, 1, 0.8627451, 1,
-0.1131874, 0.9334641, 1.509915, 0, 1, 0.8666667, 1,
-0.1119634, -0.5849739, -3.122458, 0, 1, 0.8745098, 1,
-0.11191, 0.1542101, -2.372562, 0, 1, 0.8784314, 1,
-0.1095165, -1.038077, -4.556906, 0, 1, 0.8862745, 1,
-0.1085316, -0.07368633, -2.716032, 0, 1, 0.8901961, 1,
-0.10783, 0.9280202, -0.5382217, 0, 1, 0.8980392, 1,
-0.1029776, 1.61613, 0.7385802, 0, 1, 0.9058824, 1,
-0.1020361, -0.06884491, -2.413855, 0, 1, 0.9098039, 1,
-0.09965318, 0.3205476, -0.2950655, 0, 1, 0.9176471, 1,
-0.09950892, 0.3792681, -0.08183856, 0, 1, 0.9215686, 1,
-0.0985217, -1.254469, -3.387327, 0, 1, 0.9294118, 1,
-0.09589318, -1.951741, -1.654087, 0, 1, 0.9333333, 1,
-0.08793095, -0.3130766, -3.119888, 0, 1, 0.9411765, 1,
-0.08538406, 1.696606, -0.705283, 0, 1, 0.945098, 1,
-0.08247291, -0.1761115, -3.723027, 0, 1, 0.9529412, 1,
-0.08009835, 0.409312, 0.8789027, 0, 1, 0.9568627, 1,
-0.07486194, -0.9539244, -3.460167, 0, 1, 0.9647059, 1,
-0.07359656, 0.982998, 1.498627, 0, 1, 0.9686275, 1,
-0.07284911, -0.05591043, -3.051271, 0, 1, 0.9764706, 1,
-0.07059488, 1.955152, 0.1881559, 0, 1, 0.9803922, 1,
-0.06541134, -1.295131, -3.33938, 0, 1, 0.9882353, 1,
-0.06419954, -0.03011244, -1.763677, 0, 1, 0.9921569, 1,
-0.06350422, 0.3815241, -2.222893, 0, 1, 1, 1,
-0.05141008, -0.8029249, -3.650221, 0, 0.9921569, 1, 1,
-0.04937731, 0.5009675, -0.8816483, 0, 0.9882353, 1, 1,
-0.04551734, -0.4695302, -4.077936, 0, 0.9803922, 1, 1,
-0.0415458, 0.1645076, -0.6385895, 0, 0.9764706, 1, 1,
-0.03452436, 2.542133, 1.04919, 0, 0.9686275, 1, 1,
-0.02915778, -0.1992561, -3.982914, 0, 0.9647059, 1, 1,
-0.0222978, 0.9683258, -0.9583881, 0, 0.9568627, 1, 1,
-0.02214253, -1.075978, -2.456391, 0, 0.9529412, 1, 1,
-0.02050116, -0.3514093, -2.093164, 0, 0.945098, 1, 1,
-0.01970816, -1.111202, -3.675772, 0, 0.9411765, 1, 1,
-0.01932815, 0.1108674, -0.03767627, 0, 0.9333333, 1, 1,
-0.01804052, 0.1938965, 0.1940694, 0, 0.9294118, 1, 1,
-0.01780267, 0.9441175, 0.8657224, 0, 0.9215686, 1, 1,
-0.01692281, 1.256336, 0.9825942, 0, 0.9176471, 1, 1,
-0.01576136, -1.230394, -0.8605453, 0, 0.9098039, 1, 1,
-0.01355542, -1.091082, -2.834261, 0, 0.9058824, 1, 1,
0.004568043, -0.4961935, 4.054487, 0, 0.8980392, 1, 1,
0.005169469, -0.7642215, 2.170738, 0, 0.8901961, 1, 1,
0.007570407, 0.9793221, -0.181684, 0, 0.8862745, 1, 1,
0.00816639, 1.63752, -1.20236, 0, 0.8784314, 1, 1,
0.008320131, 0.5686111, -0.4409789, 0, 0.8745098, 1, 1,
0.00946714, -0.2532673, 3.577843, 0, 0.8666667, 1, 1,
0.01104197, -0.4228657, 3.439368, 0, 0.8627451, 1, 1,
0.01132789, 0.0007462338, 0.7224339, 0, 0.854902, 1, 1,
0.01786457, 0.6008451, 0.6875755, 0, 0.8509804, 1, 1,
0.01932362, -0.7209681, 1.85112, 0, 0.8431373, 1, 1,
0.01957978, 0.3978532, -0.4910658, 0, 0.8392157, 1, 1,
0.0198205, -0.3729221, 3.409684, 0, 0.8313726, 1, 1,
0.02113178, 0.234769, -0.2673987, 0, 0.827451, 1, 1,
0.02418127, 0.2753906, -2.471255, 0, 0.8196079, 1, 1,
0.03138, 0.4548977, 0.0283788, 0, 0.8156863, 1, 1,
0.03335464, -2.645222, 4.017182, 0, 0.8078431, 1, 1,
0.03494074, 0.6798995, 0.6485589, 0, 0.8039216, 1, 1,
0.03827316, -0.6792642, 4.287098, 0, 0.7960784, 1, 1,
0.04158584, -1.315099, 4.331789, 0, 0.7882353, 1, 1,
0.04206481, -1.141565, 4.625529, 0, 0.7843137, 1, 1,
0.04425946, 0.05608772, 0.7720826, 0, 0.7764706, 1, 1,
0.04437798, -1.43692, 3.499543, 0, 0.772549, 1, 1,
0.04877808, 0.9173017, -1.225183, 0, 0.7647059, 1, 1,
0.05018156, 0.8980185, -0.1819284, 0, 0.7607843, 1, 1,
0.05100249, -1.691431, 3.054822, 0, 0.7529412, 1, 1,
0.05422015, -1.680917, 2.1855, 0, 0.7490196, 1, 1,
0.0557547, -0.3032533, 2.949935, 0, 0.7411765, 1, 1,
0.05800319, 0.3227698, 0.452073, 0, 0.7372549, 1, 1,
0.06039554, 0.5870156, -1.637329, 0, 0.7294118, 1, 1,
0.0614505, -0.04215, 1.44136, 0, 0.7254902, 1, 1,
0.06592216, -0.5561835, 2.643682, 0, 0.7176471, 1, 1,
0.06885714, -0.2209347, 3.085373, 0, 0.7137255, 1, 1,
0.07221849, 0.7681967, 1.168497, 0, 0.7058824, 1, 1,
0.07887885, 0.5483345, -0.1823447, 0, 0.6980392, 1, 1,
0.08084945, 0.2197106, -0.1990167, 0, 0.6941177, 1, 1,
0.08377875, 0.5184723, -0.3418002, 0, 0.6862745, 1, 1,
0.08565234, 1.319989, 0.1466518, 0, 0.682353, 1, 1,
0.08833928, 0.01189999, 0.447065, 0, 0.6745098, 1, 1,
0.08892643, -0.3692423, 2.897955, 0, 0.6705883, 1, 1,
0.08924752, 0.4621546, -0.4972245, 0, 0.6627451, 1, 1,
0.09061605, 0.2500318, -0.86, 0, 0.6588235, 1, 1,
0.0926628, 0.1205536, 1.135445, 0, 0.6509804, 1, 1,
0.09310822, -0.06282219, 3.314119, 0, 0.6470588, 1, 1,
0.0992813, -0.1029222, 0.6880854, 0, 0.6392157, 1, 1,
0.1025141, -0.2060137, 2.571402, 0, 0.6352941, 1, 1,
0.1099641, 0.8497221, -1.03647, 0, 0.627451, 1, 1,
0.1104849, -0.9776538, 3.235447, 0, 0.6235294, 1, 1,
0.1110587, -0.35035, 2.994985, 0, 0.6156863, 1, 1,
0.1132447, 2.196015, -0.7814981, 0, 0.6117647, 1, 1,
0.1175791, 1.634193, -1.24883, 0, 0.6039216, 1, 1,
0.1200993, 1.948423, -0.3205619, 0, 0.5960785, 1, 1,
0.1216036, 1.435324, -0.4737908, 0, 0.5921569, 1, 1,
0.1242394, 0.4476685, -1.33904, 0, 0.5843138, 1, 1,
0.1295947, -0.7034224, 4.556011, 0, 0.5803922, 1, 1,
0.1297004, -1.674223, 3.879353, 0, 0.572549, 1, 1,
0.1308707, -0.2754334, 2.824479, 0, 0.5686275, 1, 1,
0.1374025, -0.08821239, 2.265071, 0, 0.5607843, 1, 1,
0.1472637, -1.005817, 1.90016, 0, 0.5568628, 1, 1,
0.1478643, 0.6396995, 0.253344, 0, 0.5490196, 1, 1,
0.1534307, -0.2235293, 1.857893, 0, 0.5450981, 1, 1,
0.1556428, 0.8513518, 0.6112226, 0, 0.5372549, 1, 1,
0.1564992, -0.3936046, 1.950015, 0, 0.5333334, 1, 1,
0.1565614, 0.2880763, -1.565502, 0, 0.5254902, 1, 1,
0.1587027, 0.6419717, -0.01345992, 0, 0.5215687, 1, 1,
0.1590775, -0.2010442, 2.319579, 0, 0.5137255, 1, 1,
0.1608038, 0.2555474, 0.7114545, 0, 0.509804, 1, 1,
0.1617172, 0.8107523, 2.35011, 0, 0.5019608, 1, 1,
0.1661678, 1.506421, 0.6348461, 0, 0.4941176, 1, 1,
0.1701092, -0.4689378, 2.485085, 0, 0.4901961, 1, 1,
0.1707427, 0.3883828, 0.04236658, 0, 0.4823529, 1, 1,
0.1718695, 1.64679, -0.9692554, 0, 0.4784314, 1, 1,
0.1740604, 0.6576664, 0.4925227, 0, 0.4705882, 1, 1,
0.1776181, 0.5132322, 0.1005682, 0, 0.4666667, 1, 1,
0.1835163, -0.6605083, 2.404562, 0, 0.4588235, 1, 1,
0.1852413, 0.09960109, 2.905061, 0, 0.454902, 1, 1,
0.1908675, -2.002176, 4.00232, 0, 0.4470588, 1, 1,
0.1916333, -1.104937, 3.329559, 0, 0.4431373, 1, 1,
0.1930509, -0.5678359, 1.842316, 0, 0.4352941, 1, 1,
0.1935662, 0.7152421, -0.4296355, 0, 0.4313726, 1, 1,
0.1976322, 1.459719, 0.7284486, 0, 0.4235294, 1, 1,
0.1983524, 2.713563, 0.4403513, 0, 0.4196078, 1, 1,
0.1993589, 0.9200003, -0.407598, 0, 0.4117647, 1, 1,
0.2008676, -1.079628, 3.597948, 0, 0.4078431, 1, 1,
0.2012655, 0.0678942, 0.4588985, 0, 0.4, 1, 1,
0.2032828, 0.9429962, 0.3767811, 0, 0.3921569, 1, 1,
0.2060319, -0.3931177, 2.556516, 0, 0.3882353, 1, 1,
0.2063818, -0.8021461, 4.239291, 0, 0.3803922, 1, 1,
0.2126248, -0.1004088, 1.718709, 0, 0.3764706, 1, 1,
0.2138564, 0.09560366, 1.54986, 0, 0.3686275, 1, 1,
0.2140662, -1.016312, 3.689749, 0, 0.3647059, 1, 1,
0.2189392, 0.2953558, 2.60968, 0, 0.3568628, 1, 1,
0.2236047, 0.1104645, -0.4890789, 0, 0.3529412, 1, 1,
0.2238912, 1.725672, 0.406884, 0, 0.345098, 1, 1,
0.232033, 0.12634, 1.683972, 0, 0.3411765, 1, 1,
0.2326987, -0.2841509, 2.680475, 0, 0.3333333, 1, 1,
0.2333734, 0.7384518, 0.7767514, 0, 0.3294118, 1, 1,
0.2338617, 0.8133031, -1.197298, 0, 0.3215686, 1, 1,
0.2347945, -0.1019837, 3.026705, 0, 0.3176471, 1, 1,
0.2360428, -0.4160481, 3.678908, 0, 0.3098039, 1, 1,
0.2387408, 0.1935852, 1.055138, 0, 0.3058824, 1, 1,
0.2392756, 0.7143604, 0.3676296, 0, 0.2980392, 1, 1,
0.2431372, -0.7747347, 3.195838, 0, 0.2901961, 1, 1,
0.2540447, -0.5197765, 2.376106, 0, 0.2862745, 1, 1,
0.2560764, -0.6622403, 4.294341, 0, 0.2784314, 1, 1,
0.2580694, -1.5443, 4.174036, 0, 0.2745098, 1, 1,
0.2677415, 0.2443817, 1.163096, 0, 0.2666667, 1, 1,
0.2683092, -0.3479943, 2.571086, 0, 0.2627451, 1, 1,
0.2689856, 1.177498, -0.7575296, 0, 0.254902, 1, 1,
0.2700791, -1.017652, 4.185447, 0, 0.2509804, 1, 1,
0.2822322, 0.6646858, 0.2177314, 0, 0.2431373, 1, 1,
0.2891806, 0.8246114, 0.2643613, 0, 0.2392157, 1, 1,
0.2903104, -0.7097766, 1.159859, 0, 0.2313726, 1, 1,
0.2936543, 0.08260676, 0.4221307, 0, 0.227451, 1, 1,
0.2944292, -0.06935167, 3.338872, 0, 0.2196078, 1, 1,
0.2974764, -1.326506, 3.673977, 0, 0.2156863, 1, 1,
0.3008288, 0.383622, 0.1636205, 0, 0.2078431, 1, 1,
0.3024748, -0.3874753, 1.906435, 0, 0.2039216, 1, 1,
0.3044679, -0.4665364, 2.511514, 0, 0.1960784, 1, 1,
0.3045014, 0.5896376, 0.4868863, 0, 0.1882353, 1, 1,
0.3084902, -0.8051419, 2.24778, 0, 0.1843137, 1, 1,
0.3110117, -0.7465002, 3.389216, 0, 0.1764706, 1, 1,
0.3150112, 0.4668949, -0.130577, 0, 0.172549, 1, 1,
0.3163371, -1.668742, 1.841537, 0, 0.1647059, 1, 1,
0.3181925, -0.02850232, 0.315271, 0, 0.1607843, 1, 1,
0.3204745, 1.18085, 0.4396574, 0, 0.1529412, 1, 1,
0.321117, 0.02825965, 1.740687, 0, 0.1490196, 1, 1,
0.323991, -0.7393446, 2.958368, 0, 0.1411765, 1, 1,
0.3288244, 0.8637078, 0.9707076, 0, 0.1372549, 1, 1,
0.3310997, -0.3893306, 3.584296, 0, 0.1294118, 1, 1,
0.331497, 0.7581457, -0.08037544, 0, 0.1254902, 1, 1,
0.3363374, 0.9706279, 0.3322887, 0, 0.1176471, 1, 1,
0.336525, 0.498226, 0.2749847, 0, 0.1137255, 1, 1,
0.3386957, 1.558128, 0.6577469, 0, 0.1058824, 1, 1,
0.3467146, 0.3036956, 1.027591, 0, 0.09803922, 1, 1,
0.3475204, -1.194714, 2.797031, 0, 0.09411765, 1, 1,
0.3531876, -1.708487, 5.275187, 0, 0.08627451, 1, 1,
0.3591578, -0.2502829, 1.364667, 0, 0.08235294, 1, 1,
0.3617989, 1.808002, -1.3188, 0, 0.07450981, 1, 1,
0.3618276, -0.8883087, 4.292768, 0, 0.07058824, 1, 1,
0.362817, -1.155286, 3.215142, 0, 0.0627451, 1, 1,
0.3658009, 0.8719738, 0.1163138, 0, 0.05882353, 1, 1,
0.3663586, 0.4313909, 1.140857, 0, 0.05098039, 1, 1,
0.368163, 0.06800897, 2.496465, 0, 0.04705882, 1, 1,
0.374855, -0.4531275, 3.061226, 0, 0.03921569, 1, 1,
0.3756352, -0.1801434, 2.692871, 0, 0.03529412, 1, 1,
0.3756385, -0.4525328, 0.3672333, 0, 0.02745098, 1, 1,
0.3773396, -0.245757, 1.476596, 0, 0.02352941, 1, 1,
0.3831147, 0.857006, 0.0313294, 0, 0.01568628, 1, 1,
0.3920984, 0.2101613, 1.039841, 0, 0.01176471, 1, 1,
0.3963395, -0.4013754, 2.066616, 0, 0.003921569, 1, 1,
0.3966644, -0.7106237, 2.961827, 0.003921569, 0, 1, 1,
0.3997488, -0.3773444, 3.210562, 0.007843138, 0, 1, 1,
0.4026652, 1.30132, 1.347733, 0.01568628, 0, 1, 1,
0.4031723, 1.02908, -2.149598, 0.01960784, 0, 1, 1,
0.4065194, -0.2596095, 0.9037021, 0.02745098, 0, 1, 1,
0.4118415, -0.9603127, 3.109039, 0.03137255, 0, 1, 1,
0.4136539, -0.5163643, 2.454708, 0.03921569, 0, 1, 1,
0.4159185, -0.7898739, 3.063729, 0.04313726, 0, 1, 1,
0.4166497, -0.6959313, 1.951986, 0.05098039, 0, 1, 1,
0.4172498, -0.4772007, 3.492235, 0.05490196, 0, 1, 1,
0.4183006, -0.104658, 1.926869, 0.0627451, 0, 1, 1,
0.4205527, -2.256061, 2.714153, 0.06666667, 0, 1, 1,
0.4241858, -0.398937, 3.634365, 0.07450981, 0, 1, 1,
0.4280432, -0.9174886, 1.4225, 0.07843138, 0, 1, 1,
0.4292533, -0.5184788, 2.909179, 0.08627451, 0, 1, 1,
0.4326747, -0.1172193, 2.389332, 0.09019608, 0, 1, 1,
0.4328434, -0.3757864, 0.3417111, 0.09803922, 0, 1, 1,
0.4329134, 2.60529, 0.5639306, 0.1058824, 0, 1, 1,
0.4331781, -0.6246043, 2.396822, 0.1098039, 0, 1, 1,
0.4388272, 0.7808166, -0.9291267, 0.1176471, 0, 1, 1,
0.4388356, 0.2492687, 0.006387047, 0.1215686, 0, 1, 1,
0.4419377, 0.4486591, 0.6059096, 0.1294118, 0, 1, 1,
0.4486608, 0.02503228, 0.02236712, 0.1333333, 0, 1, 1,
0.4598977, 0.6259643, 0.3345045, 0.1411765, 0, 1, 1,
0.4622812, 0.60444, 0.255231, 0.145098, 0, 1, 1,
0.4624765, -1.654105, 1.510719, 0.1529412, 0, 1, 1,
0.465233, 0.1749536, 0.6880057, 0.1568628, 0, 1, 1,
0.4658054, 1.081038, -0.7869249, 0.1647059, 0, 1, 1,
0.472408, -0.3222558, 3.499206, 0.1686275, 0, 1, 1,
0.4724188, 0.5333225, 1.681118, 0.1764706, 0, 1, 1,
0.4730559, 2.239113, -0.9876407, 0.1803922, 0, 1, 1,
0.4743178, -0.513838, 0.3700423, 0.1882353, 0, 1, 1,
0.4763795, 1.669841, 0.02440505, 0.1921569, 0, 1, 1,
0.4798313, -0.3392281, 1.679948, 0.2, 0, 1, 1,
0.4874165, -0.7662922, 2.666468, 0.2078431, 0, 1, 1,
0.4890394, -0.8683805, 1.942056, 0.2117647, 0, 1, 1,
0.4957511, -0.5664208, 1.46804, 0.2196078, 0, 1, 1,
0.5056804, 0.5206383, 0.4856395, 0.2235294, 0, 1, 1,
0.5141428, -0.3353686, 2.162287, 0.2313726, 0, 1, 1,
0.5170241, 0.3035013, 1.706935, 0.2352941, 0, 1, 1,
0.5222383, -0.07021916, 1.410575, 0.2431373, 0, 1, 1,
0.530442, -0.3224227, 2.827189, 0.2470588, 0, 1, 1,
0.530957, -1.057342, 0.5227802, 0.254902, 0, 1, 1,
0.5326669, -0.8441699, 2.984643, 0.2588235, 0, 1, 1,
0.5466061, -0.2444961, 2.479627, 0.2666667, 0, 1, 1,
0.5469528, 0.1447779, 0.7151228, 0.2705882, 0, 1, 1,
0.5506128, -0.735765, 1.951164, 0.2784314, 0, 1, 1,
0.5576987, 0.4704586, 1.575387, 0.282353, 0, 1, 1,
0.5592361, -1.460601, 3.017303, 0.2901961, 0, 1, 1,
0.5612109, 1.922139, 0.1536443, 0.2941177, 0, 1, 1,
0.5615783, 0.2587135, -0.08909668, 0.3019608, 0, 1, 1,
0.5619923, 0.5957716, 1.187343, 0.3098039, 0, 1, 1,
0.5658075, -2.376147, 3.417645, 0.3137255, 0, 1, 1,
0.5664793, 1.477601, 1.0947, 0.3215686, 0, 1, 1,
0.5668315, -0.5132529, 3.952215, 0.3254902, 0, 1, 1,
0.5674955, -0.2060163, 2.611647, 0.3333333, 0, 1, 1,
0.5684295, -1.005111, 2.025492, 0.3372549, 0, 1, 1,
0.5688695, 1.648902, 0.9283691, 0.345098, 0, 1, 1,
0.575962, -0.2920307, 2.426651, 0.3490196, 0, 1, 1,
0.5778618, 0.814271, 0.5477155, 0.3568628, 0, 1, 1,
0.5789986, -0.9254077, 2.679597, 0.3607843, 0, 1, 1,
0.5821025, 2.142548, 0.528613, 0.3686275, 0, 1, 1,
0.5865353, -1.763216, 3.313144, 0.372549, 0, 1, 1,
0.5865988, 1.440836, -0.6992234, 0.3803922, 0, 1, 1,
0.5880644, 0.7474703, -0.1499061, 0.3843137, 0, 1, 1,
0.5894266, -0.05642174, 0.1566124, 0.3921569, 0, 1, 1,
0.6005576, 0.2844459, 0.2867169, 0.3960784, 0, 1, 1,
0.6068769, 1.077257, 0.9709758, 0.4039216, 0, 1, 1,
0.608883, 0.6166715, 0.1503753, 0.4117647, 0, 1, 1,
0.6143804, -1.316704, 2.819847, 0.4156863, 0, 1, 1,
0.6185408, -0.6179959, 3.179157, 0.4235294, 0, 1, 1,
0.6189522, -1.040649, 0.7548298, 0.427451, 0, 1, 1,
0.618963, 1.20286, 0.9885931, 0.4352941, 0, 1, 1,
0.621703, 0.988981, 0.1673026, 0.4392157, 0, 1, 1,
0.623237, -0.1855972, 2.741827, 0.4470588, 0, 1, 1,
0.6330224, -0.4450313, 1.457834, 0.4509804, 0, 1, 1,
0.6365938, 0.05071967, 2.077494, 0.4588235, 0, 1, 1,
0.6412135, 1.566762, -0.5216632, 0.4627451, 0, 1, 1,
0.6464115, 1.071066, 0.3415786, 0.4705882, 0, 1, 1,
0.6471348, -0.08407088, 1.52679, 0.4745098, 0, 1, 1,
0.6480467, 0.9796084, 0.3720519, 0.4823529, 0, 1, 1,
0.652442, -0.1589805, 1.66485, 0.4862745, 0, 1, 1,
0.6574497, -1.098123, 2.541401, 0.4941176, 0, 1, 1,
0.658236, 1.077912, 1.135394, 0.5019608, 0, 1, 1,
0.6587611, 1.470703, -0.8007463, 0.5058824, 0, 1, 1,
0.6660568, 0.8013718, 0.6564754, 0.5137255, 0, 1, 1,
0.6717764, -1.084374, 3.362693, 0.5176471, 0, 1, 1,
0.6818408, -0.1355817, 0.1731198, 0.5254902, 0, 1, 1,
0.6831368, 1.360991, 1.140946, 0.5294118, 0, 1, 1,
0.6844707, 0.6345884, 1.567577, 0.5372549, 0, 1, 1,
0.687838, -0.0475277, 1.756994, 0.5411765, 0, 1, 1,
0.6889339, -0.6072795, 3.255, 0.5490196, 0, 1, 1,
0.6898552, 0.656167, 1.230813, 0.5529412, 0, 1, 1,
0.693373, 0.9494987, 1.069977, 0.5607843, 0, 1, 1,
0.7007355, -1.126784, 2.699081, 0.5647059, 0, 1, 1,
0.7036135, -0.9349017, 2.0353, 0.572549, 0, 1, 1,
0.7101355, 2.806709, 2.013547, 0.5764706, 0, 1, 1,
0.7119192, 1.22452, 0.8864104, 0.5843138, 0, 1, 1,
0.7123576, 0.6482892, 0.0137828, 0.5882353, 0, 1, 1,
0.7137693, -0.4453908, 3.659978, 0.5960785, 0, 1, 1,
0.7173953, 0.9950027, 1.571289, 0.6039216, 0, 1, 1,
0.7184268, 0.7498751, 2.178042, 0.6078432, 0, 1, 1,
0.7198253, -2.302307, 0.9231443, 0.6156863, 0, 1, 1,
0.7220169, -0.604809, 4.210579, 0.6196079, 0, 1, 1,
0.7337102, 0.6403987, 1.536647, 0.627451, 0, 1, 1,
0.7347395, 0.4887215, 1.898731, 0.6313726, 0, 1, 1,
0.7348579, -1.049942, 1.012741, 0.6392157, 0, 1, 1,
0.7385474, 0.9686127, -0.1272832, 0.6431373, 0, 1, 1,
0.7393485, -0.9446476, 4.049795, 0.6509804, 0, 1, 1,
0.7472945, -1.096845, 3.543252, 0.654902, 0, 1, 1,
0.7494634, -1.046062, 0.3788861, 0.6627451, 0, 1, 1,
0.7555187, 0.05689469, 0.9131109, 0.6666667, 0, 1, 1,
0.7586809, -0.5400326, 2.066418, 0.6745098, 0, 1, 1,
0.760372, -0.9657671, 2.922047, 0.6784314, 0, 1, 1,
0.760893, 0.7096667, 0.6521527, 0.6862745, 0, 1, 1,
0.7619652, 3.079214, 0.7007601, 0.6901961, 0, 1, 1,
0.7692171, -1.404689, 4.928662, 0.6980392, 0, 1, 1,
0.7751299, 0.882494, 0.1413669, 0.7058824, 0, 1, 1,
0.7758144, -0.713698, 1.300996, 0.7098039, 0, 1, 1,
0.7768548, -0.7566627, 1.610201, 0.7176471, 0, 1, 1,
0.7788378, -1.145519, 2.622751, 0.7215686, 0, 1, 1,
0.7795704, 0.01283029, 2.233219, 0.7294118, 0, 1, 1,
0.7851174, 0.1472936, 1.97999, 0.7333333, 0, 1, 1,
0.7912316, 0.6705934, 1.819011, 0.7411765, 0, 1, 1,
0.7914794, 0.6718029, 1.285195, 0.7450981, 0, 1, 1,
0.7950221, -0.2301762, 3.800343, 0.7529412, 0, 1, 1,
0.7998875, -0.1642733, 0.3659671, 0.7568628, 0, 1, 1,
0.8021178, -0.5976164, 3.715734, 0.7647059, 0, 1, 1,
0.8048993, 0.3511377, 0.6010654, 0.7686275, 0, 1, 1,
0.8166534, -0.4441869, 2.131152, 0.7764706, 0, 1, 1,
0.8210815, -0.5863495, 2.476037, 0.7803922, 0, 1, 1,
0.8343182, -0.4659043, 2.495937, 0.7882353, 0, 1, 1,
0.836308, 0.9108399, 0.1789823, 0.7921569, 0, 1, 1,
0.8413791, 0.2046919, 0.7165782, 0.8, 0, 1, 1,
0.8515804, -0.06045312, 0.5621434, 0.8078431, 0, 1, 1,
0.8528441, 0.5987999, 1.659798, 0.8117647, 0, 1, 1,
0.8556482, 0.8212553, 1.492632, 0.8196079, 0, 1, 1,
0.864924, 0.9342353, 1.190486, 0.8235294, 0, 1, 1,
0.8699245, -0.008257712, 3.49449, 0.8313726, 0, 1, 1,
0.8706847, 0.1051805, 0.6956425, 0.8352941, 0, 1, 1,
0.8708903, -1.123302, 1.212924, 0.8431373, 0, 1, 1,
0.8733811, 1.024202, 0.8931177, 0.8470588, 0, 1, 1,
0.877471, -0.07630512, 0.6072367, 0.854902, 0, 1, 1,
0.8777449, 0.6370233, 1.836624, 0.8588235, 0, 1, 1,
0.8809246, -0.3465309, 0.8235249, 0.8666667, 0, 1, 1,
0.881883, -0.6961674, 0.8277416, 0.8705882, 0, 1, 1,
0.8859497, 0.7332461, 0.9138197, 0.8784314, 0, 1, 1,
0.8860236, 0.06514867, 0.7208872, 0.8823529, 0, 1, 1,
0.8870641, 0.3564112, 1.746902, 0.8901961, 0, 1, 1,
0.8916516, -0.2610236, 3.433975, 0.8941177, 0, 1, 1,
0.8925275, 0.2553028, 1.248506, 0.9019608, 0, 1, 1,
0.893694, -0.9618601, 2.031244, 0.9098039, 0, 1, 1,
0.8988073, -1.114226, 2.24684, 0.9137255, 0, 1, 1,
0.9000787, 0.3641893, 0.6614644, 0.9215686, 0, 1, 1,
0.9038074, -0.4433074, 1.67131, 0.9254902, 0, 1, 1,
0.9046316, 0.2634185, 3.039062, 0.9333333, 0, 1, 1,
0.9074427, -0.9624586, 3.859488, 0.9372549, 0, 1, 1,
0.9094511, -1.0916, 2.82916, 0.945098, 0, 1, 1,
0.9143885, 0.5674795, 1.121628, 0.9490196, 0, 1, 1,
0.9149843, 0.2622102, 0.8586245, 0.9568627, 0, 1, 1,
0.9159192, -0.2175525, 2.875467, 0.9607843, 0, 1, 1,
0.9168317, 1.185933, -0.2328188, 0.9686275, 0, 1, 1,
0.9171572, 1.193197, 1.475573, 0.972549, 0, 1, 1,
0.9193252, 0.7842669, -0.006542995, 0.9803922, 0, 1, 1,
0.9229768, -0.6371176, 0.9183272, 0.9843137, 0, 1, 1,
0.9231312, -0.6892188, 2.758393, 0.9921569, 0, 1, 1,
0.9263974, 0.3818827, 1.901028, 0.9960784, 0, 1, 1,
0.9265883, -0.2790083, 2.412461, 1, 0, 0.9960784, 1,
0.9313474, -0.3499564, 2.337898, 1, 0, 0.9882353, 1,
0.931699, -0.2226041, 2.027425, 1, 0, 0.9843137, 1,
0.9350961, 0.7902821, 1.047086, 1, 0, 0.9764706, 1,
0.9410584, -1.969074, 2.139104, 1, 0, 0.972549, 1,
0.9445533, 1.298009, -1.542515, 1, 0, 0.9647059, 1,
0.9456208, 0.1968873, 1.431433, 1, 0, 0.9607843, 1,
0.9465213, -0.4565639, 2.579866, 1, 0, 0.9529412, 1,
0.9521174, 2.954417, -1.597101, 1, 0, 0.9490196, 1,
0.9642223, 0.3052173, -0.2694114, 1, 0, 0.9411765, 1,
0.9734923, -1.958346, 2.470223, 1, 0, 0.9372549, 1,
0.9799364, -0.8329236, 3.278172, 1, 0, 0.9294118, 1,
0.9801261, 1.154297, 0.2535537, 1, 0, 0.9254902, 1,
0.9866952, 0.5172799, 3.354523, 1, 0, 0.9176471, 1,
0.9921298, -0.4549297, 1.400147, 1, 0, 0.9137255, 1,
0.9947495, 2.051507, 1.878175, 1, 0, 0.9058824, 1,
0.9956886, -2.368473, 2.419073, 1, 0, 0.9019608, 1,
0.9982848, 2.27872, 0.4012394, 1, 0, 0.8941177, 1,
1.00158, -0.5422239, 1.918502, 1, 0, 0.8862745, 1,
1.00533, 1.56343, -0.09413145, 1, 0, 0.8823529, 1,
1.01208, 0.2594109, 1.806251, 1, 0, 0.8745098, 1,
1.014485, 0.8777214, 0.8254997, 1, 0, 0.8705882, 1,
1.021933, -1.491028, 3.279594, 1, 0, 0.8627451, 1,
1.024416, 0.5587879, 0.2071214, 1, 0, 0.8588235, 1,
1.02613, -1.556076, 3.517376, 1, 0, 0.8509804, 1,
1.035184, -0.3419499, 1.950992, 1, 0, 0.8470588, 1,
1.037032, 0.3438349, 0.714472, 1, 0, 0.8392157, 1,
1.040311, -0.02531638, 3.095155, 1, 0, 0.8352941, 1,
1.046412, 0.1042035, 1.348616, 1, 0, 0.827451, 1,
1.058109, 0.02328732, 1.450847, 1, 0, 0.8235294, 1,
1.058602, 1.440843, 1.04795, 1, 0, 0.8156863, 1,
1.063016, 0.3546049, 0.5749504, 1, 0, 0.8117647, 1,
1.066591, -2.717282, 1.9663, 1, 0, 0.8039216, 1,
1.073242, -0.0969528, 1.743432, 1, 0, 0.7960784, 1,
1.077233, 0.8767813, -0.9408906, 1, 0, 0.7921569, 1,
1.08375, -0.838595, 1.661326, 1, 0, 0.7843137, 1,
1.091643, 0.2162901, 3.416233, 1, 0, 0.7803922, 1,
1.102915, 0.1976273, 3.338071, 1, 0, 0.772549, 1,
1.103662, 0.2460928, 0.6210225, 1, 0, 0.7686275, 1,
1.108261, -0.3234562, 1.995007, 1, 0, 0.7607843, 1,
1.119758, 1.141381, -0.4168129, 1, 0, 0.7568628, 1,
1.121263, 0.0009723268, 1.073911, 1, 0, 0.7490196, 1,
1.122955, -0.735002, 2.183811, 1, 0, 0.7450981, 1,
1.125726, 0.3191097, 1.615506, 1, 0, 0.7372549, 1,
1.130124, -1.464063, 3.32312, 1, 0, 0.7333333, 1,
1.148399, 0.1203762, -0.7806937, 1, 0, 0.7254902, 1,
1.151533, -0.2903575, 0.6164616, 1, 0, 0.7215686, 1,
1.157463, -0.09400291, 1.75516, 1, 0, 0.7137255, 1,
1.16587, -0.2582156, 1.0174, 1, 0, 0.7098039, 1,
1.171491, 0.2740015, 1.059273, 1, 0, 0.7019608, 1,
1.180543, 0.5158175, 0.001550331, 1, 0, 0.6941177, 1,
1.184038, -0.175373, 1.528768, 1, 0, 0.6901961, 1,
1.187265, -0.0007297507, -0.08647326, 1, 0, 0.682353, 1,
1.196138, 0.1751373, 0.5850465, 1, 0, 0.6784314, 1,
1.200299, -0.6418516, 2.004657, 1, 0, 0.6705883, 1,
1.202801, -0.2630695, 2.323082, 1, 0, 0.6666667, 1,
1.215626, -0.111085, 1.916349, 1, 0, 0.6588235, 1,
1.221823, 1.027057, 0.0619584, 1, 0, 0.654902, 1,
1.226769, 1.623082, 0.4938056, 1, 0, 0.6470588, 1,
1.227239, -0.4907483, 1.847551, 1, 0, 0.6431373, 1,
1.242768, -0.02817603, 1.861291, 1, 0, 0.6352941, 1,
1.256797, 1.958436, 0.7905543, 1, 0, 0.6313726, 1,
1.257317, -0.7017663, 4.103128, 1, 0, 0.6235294, 1,
1.260917, 0.8220141, 0.7960824, 1, 0, 0.6196079, 1,
1.277831, -1.757154, 1.768136, 1, 0, 0.6117647, 1,
1.278708, 0.06903265, 1.866702, 1, 0, 0.6078432, 1,
1.282416, -0.4393217, 2.385412, 1, 0, 0.6, 1,
1.289987, 0.02703776, 0.3419745, 1, 0, 0.5921569, 1,
1.290343, 1.28051, 2.857441, 1, 0, 0.5882353, 1,
1.292386, -1.41898, 2.030562, 1, 0, 0.5803922, 1,
1.298914, -0.4116477, 1.718982, 1, 0, 0.5764706, 1,
1.306462, -0.3224638, 3.234445, 1, 0, 0.5686275, 1,
1.30694, -1.238017, 2.205279, 1, 0, 0.5647059, 1,
1.327685, -0.0162098, 0.438858, 1, 0, 0.5568628, 1,
1.337464, -0.2135132, 2.250747, 1, 0, 0.5529412, 1,
1.338035, -0.4061962, 2.954176, 1, 0, 0.5450981, 1,
1.341642, -0.3083038, 0.3766243, 1, 0, 0.5411765, 1,
1.34391, -0.5884658, 1.30591, 1, 0, 0.5333334, 1,
1.353391, -0.5021104, 2.771693, 1, 0, 0.5294118, 1,
1.358016, 2.103931, 0.9338157, 1, 0, 0.5215687, 1,
1.359838, -0.9540761, 2.605296, 1, 0, 0.5176471, 1,
1.370047, 1.177181, 0.697665, 1, 0, 0.509804, 1,
1.3714, 1.805038, -0.2525435, 1, 0, 0.5058824, 1,
1.374368, -0.3577136, 3.120036, 1, 0, 0.4980392, 1,
1.375729, -0.379791, 2.483151, 1, 0, 0.4901961, 1,
1.392483, -2.447641, 3.50399, 1, 0, 0.4862745, 1,
1.419011, 0.4107589, 1.933863, 1, 0, 0.4784314, 1,
1.420221, -0.6094638, 1.042826, 1, 0, 0.4745098, 1,
1.421627, 1.463505, 1.427857, 1, 0, 0.4666667, 1,
1.421724, 0.1806315, 1.747081, 1, 0, 0.4627451, 1,
1.424525, 0.572889, 2.01125, 1, 0, 0.454902, 1,
1.437601, -0.2996057, 1.01064, 1, 0, 0.4509804, 1,
1.440049, -0.4198512, 1.162034, 1, 0, 0.4431373, 1,
1.457051, 0.2473994, 1.377508, 1, 0, 0.4392157, 1,
1.462081, -0.3456002, 1.730035, 1, 0, 0.4313726, 1,
1.472886, -0.4395045, 1.851717, 1, 0, 0.427451, 1,
1.485762, 0.4094017, 1.723155, 1, 0, 0.4196078, 1,
1.489884, 1.407569, 1.563906, 1, 0, 0.4156863, 1,
1.506044, -0.4820195, 1.831492, 1, 0, 0.4078431, 1,
1.510147, -1.785989, 2.832421, 1, 0, 0.4039216, 1,
1.511803, 0.2428506, 2.332975, 1, 0, 0.3960784, 1,
1.524365, 0.5055258, 2.264005, 1, 0, 0.3882353, 1,
1.527255, -0.2830389, 3.191633, 1, 0, 0.3843137, 1,
1.545859, -0.3414763, 1.599941, 1, 0, 0.3764706, 1,
1.554715, -0.1181634, -0.2132507, 1, 0, 0.372549, 1,
1.559957, -0.000536675, 1.456023, 1, 0, 0.3647059, 1,
1.571509, -1.331038, 1.507008, 1, 0, 0.3607843, 1,
1.575759, 0.5973857, 1.025238, 1, 0, 0.3529412, 1,
1.582755, 0.4575257, 1.600467, 1, 0, 0.3490196, 1,
1.605053, 0.9872799, 1.208953, 1, 0, 0.3411765, 1,
1.611885, 1.217396, 0.8970174, 1, 0, 0.3372549, 1,
1.613627, -0.9064047, 3.643629, 1, 0, 0.3294118, 1,
1.616332, -0.473916, -0.9734345, 1, 0, 0.3254902, 1,
1.625192, 0.9529832, 0.2452594, 1, 0, 0.3176471, 1,
1.630775, 0.9793667, 0.4442984, 1, 0, 0.3137255, 1,
1.632567, 1.409217, 0.7617795, 1, 0, 0.3058824, 1,
1.652206, -0.03183181, 1.184035, 1, 0, 0.2980392, 1,
1.652573, -0.00536495, 2.271307, 1, 0, 0.2941177, 1,
1.657263, -0.05730998, 2.134706, 1, 0, 0.2862745, 1,
1.672257, 0.04725896, 2.000764, 1, 0, 0.282353, 1,
1.678256, 1.046005, 1.918973, 1, 0, 0.2745098, 1,
1.708008, -0.0971689, 0.689847, 1, 0, 0.2705882, 1,
1.716299, -1.109043, 1.23577, 1, 0, 0.2627451, 1,
1.717232, -0.7088673, 1.884812, 1, 0, 0.2588235, 1,
1.720314, -1.035061, 2.184249, 1, 0, 0.2509804, 1,
1.746504, 0.1743443, 2.178993, 1, 0, 0.2470588, 1,
1.76479, -1.160366, 2.230747, 1, 0, 0.2392157, 1,
1.769628, 0.36773, 0.2867011, 1, 0, 0.2352941, 1,
1.772219, -0.3688921, 0.6751004, 1, 0, 0.227451, 1,
1.778113, -0.4332043, 2.455201, 1, 0, 0.2235294, 1,
1.783449, -0.3546648, 0.6667799, 1, 0, 0.2156863, 1,
1.798448, -0.001615011, 1.785514, 1, 0, 0.2117647, 1,
1.804493, 1.197022, 2.630435, 1, 0, 0.2039216, 1,
1.810557, 0.3444005, 2.353765, 1, 0, 0.1960784, 1,
1.816128, -0.6792368, 1.426691, 1, 0, 0.1921569, 1,
1.834793, 0.6825901, -0.3549697, 1, 0, 0.1843137, 1,
1.835313, 0.601598, 2.361365, 1, 0, 0.1803922, 1,
1.854438, 0.04838017, 2.132818, 1, 0, 0.172549, 1,
1.857713, 1.233775, -0.4289201, 1, 0, 0.1686275, 1,
1.86573, -0.6717809, 1.507876, 1, 0, 0.1607843, 1,
1.872375, -1.456854, 2.350843, 1, 0, 0.1568628, 1,
1.877179, 0.2751177, 1.360289, 1, 0, 0.1490196, 1,
1.888732, 1.303487, 0.6056269, 1, 0, 0.145098, 1,
1.901655, 0.02291752, 0.3275755, 1, 0, 0.1372549, 1,
1.906642, -0.1862335, 1.575968, 1, 0, 0.1333333, 1,
1.91498, -0.6432451, 2.324652, 1, 0, 0.1254902, 1,
1.931942, 1.259145, -1.463888, 1, 0, 0.1215686, 1,
1.965243, 0.7893274, 0.1930552, 1, 0, 0.1137255, 1,
1.999267, 1.531044, 1.915903, 1, 0, 0.1098039, 1,
2.008397, -0.3920735, 1.941778, 1, 0, 0.1019608, 1,
2.04088, -0.6764052, 2.696081, 1, 0, 0.09411765, 1,
2.089922, -0.5869426, 0.2437919, 1, 0, 0.09019608, 1,
2.129571, 0.5829203, 1.45843, 1, 0, 0.08235294, 1,
2.150973, 1.257389, 2.107538, 1, 0, 0.07843138, 1,
2.182419, 0.6341403, 0.3999785, 1, 0, 0.07058824, 1,
2.226221, -0.3034264, 0.6790698, 1, 0, 0.06666667, 1,
2.227856, 0.3009275, 1.905112, 1, 0, 0.05882353, 1,
2.270387, -0.3369916, 2.926957, 1, 0, 0.05490196, 1,
2.311004, 0.2364383, 1.896363, 1, 0, 0.04705882, 1,
2.399412, 1.308518, 0.6842197, 1, 0, 0.04313726, 1,
2.582014, 1.873618, 1.213083, 1, 0, 0.03529412, 1,
2.733237, -0.6284937, 3.630461, 1, 0, 0.03137255, 1,
3.009431, 0.578385, 0.5937173, 1, 0, 0.02352941, 1,
3.015372, -1.031109, 2.190295, 1, 0, 0.01960784, 1,
3.079476, -1.375701, 1.635024, 1, 0, 0.01176471, 1,
3.318334, -0.5196137, 1.708915, 1, 0, 0.007843138, 1
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
0.1643542, -3.866766, -7.292581, 0, -0.5, 0.5, 0.5,
0.1643542, -3.866766, -7.292581, 1, -0.5, 0.5, 0.5,
0.1643542, -3.866766, -7.292581, 1, 1.5, 0.5, 0.5,
0.1643542, -3.866766, -7.292581, 0, 1.5, 0.5, 0.5
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
-4.058825, 0.1664463, -7.292581, 0, -0.5, 0.5, 0.5,
-4.058825, 0.1664463, -7.292581, 1, -0.5, 0.5, 0.5,
-4.058825, 0.1664463, -7.292581, 1, 1.5, 0.5, 0.5,
-4.058825, 0.1664463, -7.292581, 0, 1.5, 0.5, 0.5
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
-4.058825, -3.866766, -0.09795022, 0, -0.5, 0.5, 0.5,
-4.058825, -3.866766, -0.09795022, 1, -0.5, 0.5, 0.5,
-4.058825, -3.866766, -0.09795022, 1, 1.5, 0.5, 0.5,
-4.058825, -3.866766, -0.09795022, 0, 1.5, 0.5, 0.5
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
-2, -2.936025, -5.632282,
3, -2.936025, -5.632282,
-2, -2.936025, -5.632282,
-2, -3.091148, -5.908998,
-1, -2.936025, -5.632282,
-1, -3.091148, -5.908998,
0, -2.936025, -5.632282,
0, -3.091148, -5.908998,
1, -2.936025, -5.632282,
1, -3.091148, -5.908998,
2, -2.936025, -5.632282,
2, -3.091148, -5.908998,
3, -2.936025, -5.632282,
3, -3.091148, -5.908998
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
-2, -3.401396, -6.462431, 0, -0.5, 0.5, 0.5,
-2, -3.401396, -6.462431, 1, -0.5, 0.5, 0.5,
-2, -3.401396, -6.462431, 1, 1.5, 0.5, 0.5,
-2, -3.401396, -6.462431, 0, 1.5, 0.5, 0.5,
-1, -3.401396, -6.462431, 0, -0.5, 0.5, 0.5,
-1, -3.401396, -6.462431, 1, -0.5, 0.5, 0.5,
-1, -3.401396, -6.462431, 1, 1.5, 0.5, 0.5,
-1, -3.401396, -6.462431, 0, 1.5, 0.5, 0.5,
0, -3.401396, -6.462431, 0, -0.5, 0.5, 0.5,
0, -3.401396, -6.462431, 1, -0.5, 0.5, 0.5,
0, -3.401396, -6.462431, 1, 1.5, 0.5, 0.5,
0, -3.401396, -6.462431, 0, 1.5, 0.5, 0.5,
1, -3.401396, -6.462431, 0, -0.5, 0.5, 0.5,
1, -3.401396, -6.462431, 1, -0.5, 0.5, 0.5,
1, -3.401396, -6.462431, 1, 1.5, 0.5, 0.5,
1, -3.401396, -6.462431, 0, 1.5, 0.5, 0.5,
2, -3.401396, -6.462431, 0, -0.5, 0.5, 0.5,
2, -3.401396, -6.462431, 1, -0.5, 0.5, 0.5,
2, -3.401396, -6.462431, 1, 1.5, 0.5, 0.5,
2, -3.401396, -6.462431, 0, 1.5, 0.5, 0.5,
3, -3.401396, -6.462431, 0, -0.5, 0.5, 0.5,
3, -3.401396, -6.462431, 1, -0.5, 0.5, 0.5,
3, -3.401396, -6.462431, 1, 1.5, 0.5, 0.5,
3, -3.401396, -6.462431, 0, 1.5, 0.5, 0.5
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
-3.084245, -2, -5.632282,
-3.084245, 3, -5.632282,
-3.084245, -2, -5.632282,
-3.246675, -2, -5.908998,
-3.084245, -1, -5.632282,
-3.246675, -1, -5.908998,
-3.084245, 0, -5.632282,
-3.246675, 0, -5.908998,
-3.084245, 1, -5.632282,
-3.246675, 1, -5.908998,
-3.084245, 2, -5.632282,
-3.246675, 2, -5.908998,
-3.084245, 3, -5.632282,
-3.246675, 3, -5.908998
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
-3.571535, -2, -6.462431, 0, -0.5, 0.5, 0.5,
-3.571535, -2, -6.462431, 1, -0.5, 0.5, 0.5,
-3.571535, -2, -6.462431, 1, 1.5, 0.5, 0.5,
-3.571535, -2, -6.462431, 0, 1.5, 0.5, 0.5,
-3.571535, -1, -6.462431, 0, -0.5, 0.5, 0.5,
-3.571535, -1, -6.462431, 1, -0.5, 0.5, 0.5,
-3.571535, -1, -6.462431, 1, 1.5, 0.5, 0.5,
-3.571535, -1, -6.462431, 0, 1.5, 0.5, 0.5,
-3.571535, 0, -6.462431, 0, -0.5, 0.5, 0.5,
-3.571535, 0, -6.462431, 1, -0.5, 0.5, 0.5,
-3.571535, 0, -6.462431, 1, 1.5, 0.5, 0.5,
-3.571535, 0, -6.462431, 0, 1.5, 0.5, 0.5,
-3.571535, 1, -6.462431, 0, -0.5, 0.5, 0.5,
-3.571535, 1, -6.462431, 1, -0.5, 0.5, 0.5,
-3.571535, 1, -6.462431, 1, 1.5, 0.5, 0.5,
-3.571535, 1, -6.462431, 0, 1.5, 0.5, 0.5,
-3.571535, 2, -6.462431, 0, -0.5, 0.5, 0.5,
-3.571535, 2, -6.462431, 1, -0.5, 0.5, 0.5,
-3.571535, 2, -6.462431, 1, 1.5, 0.5, 0.5,
-3.571535, 2, -6.462431, 0, 1.5, 0.5, 0.5,
-3.571535, 3, -6.462431, 0, -0.5, 0.5, 0.5,
-3.571535, 3, -6.462431, 1, -0.5, 0.5, 0.5,
-3.571535, 3, -6.462431, 1, 1.5, 0.5, 0.5,
-3.571535, 3, -6.462431, 0, 1.5, 0.5, 0.5
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
-3.084245, -2.936025, -4,
-3.084245, -2.936025, 4,
-3.084245, -2.936025, -4,
-3.246675, -3.091148, -4,
-3.084245, -2.936025, -2,
-3.246675, -3.091148, -2,
-3.084245, -2.936025, 0,
-3.246675, -3.091148, 0,
-3.084245, -2.936025, 2,
-3.246675, -3.091148, 2,
-3.084245, -2.936025, 4,
-3.246675, -3.091148, 4
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
-3.571535, -3.401396, -4, 0, -0.5, 0.5, 0.5,
-3.571535, -3.401396, -4, 1, -0.5, 0.5, 0.5,
-3.571535, -3.401396, -4, 1, 1.5, 0.5, 0.5,
-3.571535, -3.401396, -4, 0, 1.5, 0.5, 0.5,
-3.571535, -3.401396, -2, 0, -0.5, 0.5, 0.5,
-3.571535, -3.401396, -2, 1, -0.5, 0.5, 0.5,
-3.571535, -3.401396, -2, 1, 1.5, 0.5, 0.5,
-3.571535, -3.401396, -2, 0, 1.5, 0.5, 0.5,
-3.571535, -3.401396, 0, 0, -0.5, 0.5, 0.5,
-3.571535, -3.401396, 0, 1, -0.5, 0.5, 0.5,
-3.571535, -3.401396, 0, 1, 1.5, 0.5, 0.5,
-3.571535, -3.401396, 0, 0, 1.5, 0.5, 0.5,
-3.571535, -3.401396, 2, 0, -0.5, 0.5, 0.5,
-3.571535, -3.401396, 2, 1, -0.5, 0.5, 0.5,
-3.571535, -3.401396, 2, 1, 1.5, 0.5, 0.5,
-3.571535, -3.401396, 2, 0, 1.5, 0.5, 0.5,
-3.571535, -3.401396, 4, 0, -0.5, 0.5, 0.5,
-3.571535, -3.401396, 4, 1, -0.5, 0.5, 0.5,
-3.571535, -3.401396, 4, 1, 1.5, 0.5, 0.5,
-3.571535, -3.401396, 4, 0, 1.5, 0.5, 0.5
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
-3.084245, -2.936025, -5.632282,
-3.084245, 3.268918, -5.632282,
-3.084245, -2.936025, 5.436381,
-3.084245, 3.268918, 5.436381,
-3.084245, -2.936025, -5.632282,
-3.084245, -2.936025, 5.436381,
-3.084245, 3.268918, -5.632282,
-3.084245, 3.268918, 5.436381,
-3.084245, -2.936025, -5.632282,
3.412953, -2.936025, -5.632282,
-3.084245, -2.936025, 5.436381,
3.412953, -2.936025, 5.436381,
-3.084245, 3.268918, -5.632282,
3.412953, 3.268918, -5.632282,
-3.084245, 3.268918, 5.436381,
3.412953, 3.268918, 5.436381,
3.412953, -2.936025, -5.632282,
3.412953, 3.268918, -5.632282,
3.412953, -2.936025, 5.436381,
3.412953, 3.268918, 5.436381,
3.412953, -2.936025, -5.632282,
3.412953, -2.936025, 5.436381,
3.412953, 3.268918, -5.632282,
3.412953, 3.268918, 5.436381
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
var radius = 7.612365;
var distance = 33.86827;
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
mvMatrix.translate( -0.1643542, -0.1664463, 0.09795022 );
mvMatrix.scale( 1.266798, 1.326465, 0.7435982 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.86827);
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
sodium_trichloroacet<-read.table("sodium_trichloroacet.xyz")
```

```
## Error in read.table("sodium_trichloroacet.xyz"): no lines available in input
```

```r
x<-sodium_trichloroacet$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_trichloroacet' not found
```

```r
y<-sodium_trichloroacet$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_trichloroacet' not found
```

```r
z<-sodium_trichloroacet$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_trichloroacet' not found
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
-2.989625, 0.7558054, -1.937564, 0, 0, 1, 1, 1,
-2.882348, 0.4106936, 0.4889244, 1, 0, 0, 1, 1,
-2.808576, 0.6240131, -1.479179, 1, 0, 0, 1, 1,
-2.672843, 0.5138059, -1.732926, 1, 0, 0, 1, 1,
-2.45752, 0.3244523, -1.824991, 1, 0, 0, 1, 1,
-2.412825, 0.1504473, -1.508068, 1, 0, 0, 1, 1,
-2.406935, 0.333757, -1.336191, 0, 0, 0, 1, 1,
-2.37412, -2.135394, -2.871309, 0, 0, 0, 1, 1,
-2.357026, 0.5522262, -2.049192, 0, 0, 0, 1, 1,
-2.240196, -1.612798, -3.105816, 0, 0, 0, 1, 1,
-2.201267, 0.6233457, -1.055878, 0, 0, 0, 1, 1,
-2.140199, -0.6517098, -2.905705, 0, 0, 0, 1, 1,
-2.073117, 0.02534888, -0.6897675, 0, 0, 0, 1, 1,
-2.071227, 0.1269469, -0.9197133, 1, 1, 1, 1, 1,
-2.070073, 1.426237, -0.3915178, 1, 1, 1, 1, 1,
-2.051969, 1.081829, -0.8356681, 1, 1, 1, 1, 1,
-2.044533, -1.10667, -1.537779, 1, 1, 1, 1, 1,
-2.035006, 0.3438033, -0.7109634, 1, 1, 1, 1, 1,
-2.010968, -1.307666, -2.67225, 1, 1, 1, 1, 1,
-1.987203, 0.9444892, -1.120444, 1, 1, 1, 1, 1,
-1.981941, -0.7110424, -2.169936, 1, 1, 1, 1, 1,
-1.944532, -1.068715, -3.130429, 1, 1, 1, 1, 1,
-1.943787, 0.07709315, -1.760491, 1, 1, 1, 1, 1,
-1.938003, -0.5710365, -2.295327, 1, 1, 1, 1, 1,
-1.890398, 0.4979141, -1.615118, 1, 1, 1, 1, 1,
-1.870587, -1.037124, -0.4002075, 1, 1, 1, 1, 1,
-1.856248, 1.151646, 0.4541748, 1, 1, 1, 1, 1,
-1.83555, 1.054996, 0.2153563, 1, 1, 1, 1, 1,
-1.829009, 0.2052667, -1.022219, 0, 0, 1, 1, 1,
-1.825533, 0.872578, -2.894093, 1, 0, 0, 1, 1,
-1.787498, -0.329592, -2.572479, 1, 0, 0, 1, 1,
-1.779122, -1.16221, -1.259347, 1, 0, 0, 1, 1,
-1.757936, -0.1657249, -1.04458, 1, 0, 0, 1, 1,
-1.75296, 0.08667858, -2.587628, 1, 0, 0, 1, 1,
-1.750415, 0.06467645, 1.035832, 0, 0, 0, 1, 1,
-1.729412, 0.2653571, -0.3466097, 0, 0, 0, 1, 1,
-1.728938, -0.7116165, -2.705642, 0, 0, 0, 1, 1,
-1.726622, 0.9833208, -0.1365352, 0, 0, 0, 1, 1,
-1.717072, -0.2671931, -1.079249, 0, 0, 0, 1, 1,
-1.712149, 0.7991794, 0.6438958, 0, 0, 0, 1, 1,
-1.712041, -0.3118103, -1.179127, 0, 0, 0, 1, 1,
-1.71022, 0.913438, 0.1785224, 1, 1, 1, 1, 1,
-1.709996, -0.2792161, -1.965836, 1, 1, 1, 1, 1,
-1.703567, -0.9933109, -3.379134, 1, 1, 1, 1, 1,
-1.698886, -0.05679819, -1.92768, 1, 1, 1, 1, 1,
-1.695465, 0.9756959, -0.4019473, 1, 1, 1, 1, 1,
-1.691285, 0.8882351, -0.5900048, 1, 1, 1, 1, 1,
-1.683789, 0.9238102, -0.04914029, 1, 1, 1, 1, 1,
-1.683127, -0.2963918, -2.805716, 1, 1, 1, 1, 1,
-1.681024, 1.679262, 1.02731, 1, 1, 1, 1, 1,
-1.680723, 0.2144624, -0.3088352, 1, 1, 1, 1, 1,
-1.6638, -1.423137, -2.610739, 1, 1, 1, 1, 1,
-1.659158, -0.8143934, -1.804502, 1, 1, 1, 1, 1,
-1.625357, 0.5970353, -0.2490836, 1, 1, 1, 1, 1,
-1.620241, -0.166036, -4.026198, 1, 1, 1, 1, 1,
-1.61546, -1.137249, -1.497876, 1, 1, 1, 1, 1,
-1.611766, -0.7001797, -2.863263, 0, 0, 1, 1, 1,
-1.603386, -1.494007, -2.885533, 1, 0, 0, 1, 1,
-1.595601, -0.6730821, -2.723947, 1, 0, 0, 1, 1,
-1.570074, -0.1534978, -0.4346351, 1, 0, 0, 1, 1,
-1.547554, 2.336091, -0.8284501, 1, 0, 0, 1, 1,
-1.543938, -1.40638, -0.4912404, 1, 0, 0, 1, 1,
-1.534333, -2.365852, -2.379987, 0, 0, 0, 1, 1,
-1.532413, 0.9898919, -0.07522704, 0, 0, 0, 1, 1,
-1.530867, 0.4604464, 0.2279626, 0, 0, 0, 1, 1,
-1.518842, -0.1286748, -0.5186881, 0, 0, 0, 1, 1,
-1.515848, -1.244414, -1.767542, 0, 0, 0, 1, 1,
-1.505101, -0.895571, -1.406744, 0, 0, 0, 1, 1,
-1.502719, 1.173645, -1.655636, 0, 0, 0, 1, 1,
-1.501821, -0.4338573, -2.091221, 1, 1, 1, 1, 1,
-1.495686, 0.8144866, -1.786507, 1, 1, 1, 1, 1,
-1.494622, 0.9661505, -1.605434, 1, 1, 1, 1, 1,
-1.491799, 0.642875, -1.967507, 1, 1, 1, 1, 1,
-1.484178, -0.07626842, -1.086907, 1, 1, 1, 1, 1,
-1.480867, -0.04200112, -1.676972, 1, 1, 1, 1, 1,
-1.474897, -1.543299, -2.093499, 1, 1, 1, 1, 1,
-1.46897, 0.796082, -1.475016, 1, 1, 1, 1, 1,
-1.466045, -0.3069744, -1.910264, 1, 1, 1, 1, 1,
-1.459925, 0.493975, -1.124483, 1, 1, 1, 1, 1,
-1.432574, -0.232478, -1.489898, 1, 1, 1, 1, 1,
-1.431464, 0.1558887, -1.660584, 1, 1, 1, 1, 1,
-1.425304, -1.194009, -1.406059, 1, 1, 1, 1, 1,
-1.422228, 1.366469, -0.8664765, 1, 1, 1, 1, 1,
-1.418762, 1.130491, -1.767773, 1, 1, 1, 1, 1,
-1.418645, -0.9015661, -3.769245, 0, 0, 1, 1, 1,
-1.39282, 1.274714, 1.025932, 1, 0, 0, 1, 1,
-1.387353, 1.149443, 0.4963646, 1, 0, 0, 1, 1,
-1.386901, -1.549988, -1.026418, 1, 0, 0, 1, 1,
-1.385424, -0.3361725, -1.135321, 1, 0, 0, 1, 1,
-1.384292, -0.3246246, -1.311392, 1, 0, 0, 1, 1,
-1.384139, -1.506222, -2.907403, 0, 0, 0, 1, 1,
-1.378293, -1.005523, -3.33571, 0, 0, 0, 1, 1,
-1.371174, -0.9722492, -2.90421, 0, 0, 0, 1, 1,
-1.357849, 1.316285, 0.02894219, 0, 0, 0, 1, 1,
-1.353524, -0.217011, -2.956661, 0, 0, 0, 1, 1,
-1.348408, -0.2872625, -0.3556934, 0, 0, 0, 1, 1,
-1.3448, -0.2655573, -0.8824643, 0, 0, 0, 1, 1,
-1.344741, 0.9359925, -0.602239, 1, 1, 1, 1, 1,
-1.341303, 0.1452411, -0.5550507, 1, 1, 1, 1, 1,
-1.34128, -0.01846656, -1.548298, 1, 1, 1, 1, 1,
-1.341118, 0.1348066, -1.306645, 1, 1, 1, 1, 1,
-1.337411, -0.05952499, -2.71517, 1, 1, 1, 1, 1,
-1.325877, 0.4617456, -1.706757, 1, 1, 1, 1, 1,
-1.324864, -0.1964285, -1.825998, 1, 1, 1, 1, 1,
-1.323149, 0.5465106, -3.502656, 1, 1, 1, 1, 1,
-1.312758, 1.249999, 0.01680788, 1, 1, 1, 1, 1,
-1.305257, -0.1129446, -2.047263, 1, 1, 1, 1, 1,
-1.301572, 0.6991446, 0.40435, 1, 1, 1, 1, 1,
-1.29893, -0.3166293, -0.4955576, 1, 1, 1, 1, 1,
-1.289174, 0.9735773, -0.3593343, 1, 1, 1, 1, 1,
-1.285124, -1.236553, -1.15945, 1, 1, 1, 1, 1,
-1.28275, 0.1688723, -1.685452, 1, 1, 1, 1, 1,
-1.280913, 0.3249844, -0.23068, 0, 0, 1, 1, 1,
-1.277008, -0.6959647, -2.686962, 1, 0, 0, 1, 1,
-1.270884, 0.4327353, -2.882496, 1, 0, 0, 1, 1,
-1.269276, 0.3505781, -2.495108, 1, 0, 0, 1, 1,
-1.257669, -0.5531047, -3.646891, 1, 0, 0, 1, 1,
-1.247066, 0.1201634, -1.785782, 1, 0, 0, 1, 1,
-1.234244, 0.2604497, -2.611104, 0, 0, 0, 1, 1,
-1.21208, 0.1240738, -0.4947806, 0, 0, 0, 1, 1,
-1.211374, -0.6855192, -1.232442, 0, 0, 0, 1, 1,
-1.211096, -1.226241, -3.028994, 0, 0, 0, 1, 1,
-1.206927, -1.388771, -1.84509, 0, 0, 0, 1, 1,
-1.200261, -0.2242189, -2.389985, 0, 0, 0, 1, 1,
-1.199369, -0.001578249, -1.903784, 0, 0, 0, 1, 1,
-1.198234, 0.4182208, -1.968852, 1, 1, 1, 1, 1,
-1.196123, -0.2431211, 0.1539865, 1, 1, 1, 1, 1,
-1.19265, 0.800712, -1.481071, 1, 1, 1, 1, 1,
-1.192592, -0.3657988, 0.1395221, 1, 1, 1, 1, 1,
-1.189448, 0.8023258, 0.6801006, 1, 1, 1, 1, 1,
-1.188977, -1.274266, -2.321184, 1, 1, 1, 1, 1,
-1.188439, 0.8308068, -0.3108582, 1, 1, 1, 1, 1,
-1.187076, -0.3509866, -2.494038, 1, 1, 1, 1, 1,
-1.183269, -0.4760919, -3.016554, 1, 1, 1, 1, 1,
-1.173726, -0.5550497, -0.06210796, 1, 1, 1, 1, 1,
-1.158946, 0.9114851, -0.3581899, 1, 1, 1, 1, 1,
-1.152263, -0.7114, -2.394879, 1, 1, 1, 1, 1,
-1.146394, -0.1648683, -2.690979, 1, 1, 1, 1, 1,
-1.117703, -0.6590056, -4.042156, 1, 1, 1, 1, 1,
-1.116462, 0.7723073, 0.4648654, 1, 1, 1, 1, 1,
-1.107316, 2.516176, 0.1947062, 0, 0, 1, 1, 1,
-1.106737, 0.7840403, 0.4046696, 1, 0, 0, 1, 1,
-1.105834, 1.133925, -1.985496, 1, 0, 0, 1, 1,
-1.099464, 0.3617537, 0.904348, 1, 0, 0, 1, 1,
-1.097276, 0.2643181, -1.202579, 1, 0, 0, 1, 1,
-1.076388, -0.148658, -3.639292, 1, 0, 0, 1, 1,
-1.069597, -2.37122, -1.7428, 0, 0, 0, 1, 1,
-1.068595, 0.3384, -0.2822938, 0, 0, 0, 1, 1,
-1.045964, -1.179245, -1.71387, 0, 0, 0, 1, 1,
-1.045551, -0.1218884, -4.342265, 0, 0, 0, 1, 1,
-1.040653, -0.1539943, -1.146681, 0, 0, 0, 1, 1,
-1.037355, 0.1650267, -1.693328, 0, 0, 0, 1, 1,
-1.035087, 2.223391, -0.128349, 0, 0, 0, 1, 1,
-1.032581, 0.8171278, -0.2957186, 1, 1, 1, 1, 1,
-1.031331, 0.06635897, -2.871491, 1, 1, 1, 1, 1,
-1.030671, -0.4039364, -1.113549, 1, 1, 1, 1, 1,
-1.030425, 3.178554, -0.9645119, 1, 1, 1, 1, 1,
-1.027888, -0.7408641, -3.754597, 1, 1, 1, 1, 1,
-1.02085, 0.1874909, 0.3802594, 1, 1, 1, 1, 1,
-1.020068, 2.524543, -0.4691756, 1, 1, 1, 1, 1,
-1.015297, -0.04631712, -0.5420107, 1, 1, 1, 1, 1,
-1.012765, 0.724628, -0.560919, 1, 1, 1, 1, 1,
-1.005885, 0.406109, -2.806038, 1, 1, 1, 1, 1,
-1.004127, -0.946156, -2.18963, 1, 1, 1, 1, 1,
-1.000772, -1.533867, -2.026011, 1, 1, 1, 1, 1,
-0.9973685, -0.663806, -2.575293, 1, 1, 1, 1, 1,
-0.9912504, 1.223912, 0.3060781, 1, 1, 1, 1, 1,
-0.9861344, 0.7659494, -0.9066325, 1, 1, 1, 1, 1,
-0.9791058, 0.4619007, -1.589021, 0, 0, 1, 1, 1,
-0.9736074, 0.4817785, -1.552244, 1, 0, 0, 1, 1,
-0.9724661, 0.6279491, -2.734571, 1, 0, 0, 1, 1,
-0.9687924, 1.86495, 0.6392294, 1, 0, 0, 1, 1,
-0.9678976, 1.40566, 0.4861479, 1, 0, 0, 1, 1,
-0.9636937, -0.9766844, -4.512668, 1, 0, 0, 1, 1,
-0.9524906, 1.807898, -1.548561, 0, 0, 0, 1, 1,
-0.9465554, -0.3871149, -1.903472, 0, 0, 0, 1, 1,
-0.9459939, -1.87158, -3.754879, 0, 0, 0, 1, 1,
-0.9364596, -0.5147424, -1.375125, 0, 0, 0, 1, 1,
-0.9336556, -1.122191, -1.225307, 0, 0, 0, 1, 1,
-0.9235322, 0.5063081, -1.480301, 0, 0, 0, 1, 1,
-0.9224729, 0.1015851, -2.772727, 0, 0, 0, 1, 1,
-0.9198407, 1.084565, -1.824285, 1, 1, 1, 1, 1,
-0.9159606, -0.3029746, -2.657138, 1, 1, 1, 1, 1,
-0.9141988, 0.5935819, -1.772221, 1, 1, 1, 1, 1,
-0.9120824, 0.5675185, -1.855497, 1, 1, 1, 1, 1,
-0.9111575, -1.671838, -4.146464, 1, 1, 1, 1, 1,
-0.9090787, 1.115205, -0.1569076, 1, 1, 1, 1, 1,
-0.8968241, -1.357445, -3.405358, 1, 1, 1, 1, 1,
-0.8958057, 1.745139, 0.3099067, 1, 1, 1, 1, 1,
-0.8937694, 0.8141966, -2.049818, 1, 1, 1, 1, 1,
-0.8925892, -0.268454, -1.913567, 1, 1, 1, 1, 1,
-0.8917966, -0.4035619, -0.9611857, 1, 1, 1, 1, 1,
-0.8864169, 0.7205895, -0.7750648, 1, 1, 1, 1, 1,
-0.8818601, 1.755195, 0.806085, 1, 1, 1, 1, 1,
-0.8778264, 1.201719, 0.1462008, 1, 1, 1, 1, 1,
-0.8718963, -0.4464877, -2.334915, 1, 1, 1, 1, 1,
-0.8611953, 0.3907278, -1.394707, 0, 0, 1, 1, 1,
-0.855161, 0.3968107, -1.529534, 1, 0, 0, 1, 1,
-0.8502288, -0.6450645, -1.877622, 1, 0, 0, 1, 1,
-0.8497317, -1.179529, -0.04639973, 1, 0, 0, 1, 1,
-0.8486515, 1.453094, -2.576756, 1, 0, 0, 1, 1,
-0.8402973, 0.7185395, -1.204916, 1, 0, 0, 1, 1,
-0.8393782, -1.228528, -3.072815, 0, 0, 0, 1, 1,
-0.8387358, -0.4018389, -2.000355, 0, 0, 0, 1, 1,
-0.8263628, -0.3968028, -1.962791, 0, 0, 0, 1, 1,
-0.8243792, 0.4343082, 0.738954, 0, 0, 0, 1, 1,
-0.8179255, 0.3314193, -2.697484, 0, 0, 0, 1, 1,
-0.8169907, -0.8598608, -3.131962, 0, 0, 0, 1, 1,
-0.8124227, -0.6799953, -2.472755, 0, 0, 0, 1, 1,
-0.8119065, 1.560017, 0.8670009, 1, 1, 1, 1, 1,
-0.8086423, 0.223117, -0.85743, 1, 1, 1, 1, 1,
-0.8071094, 0.3430252, -1.900861, 1, 1, 1, 1, 1,
-0.8055907, -0.7440529, -2.356101, 1, 1, 1, 1, 1,
-0.8041866, -0.6932892, -2.83315, 1, 1, 1, 1, 1,
-0.796914, -0.03330981, -1.550796, 1, 1, 1, 1, 1,
-0.7897153, 1.171949, 0.4829696, 1, 1, 1, 1, 1,
-0.7872658, 0.387063, -1.292441, 1, 1, 1, 1, 1,
-0.786088, 1.953358, -0.1299183, 1, 1, 1, 1, 1,
-0.785758, -0.5346258, -1.527652, 1, 1, 1, 1, 1,
-0.7837913, -0.8851955, -3.429184, 1, 1, 1, 1, 1,
-0.7782105, 0.09902506, -0.8965957, 1, 1, 1, 1, 1,
-0.7708785, 1.590158, 0.5549304, 1, 1, 1, 1, 1,
-0.7702348, 0.2976061, -1.020551, 1, 1, 1, 1, 1,
-0.766474, -1.054739, -3.023361, 1, 1, 1, 1, 1,
-0.7643304, -0.0332891, -1.088361, 0, 0, 1, 1, 1,
-0.7614914, 0.8910431, -0.3810812, 1, 0, 0, 1, 1,
-0.7578987, -1.203987, -1.852535, 1, 0, 0, 1, 1,
-0.7561239, 1.48721, -1.095956, 1, 0, 0, 1, 1,
-0.7556982, -1.17847, -1.147452, 1, 0, 0, 1, 1,
-0.7486778, 1.147072, -0.812233, 1, 0, 0, 1, 1,
-0.746102, -1.615594, -2.993315, 0, 0, 0, 1, 1,
-0.743576, 0.0143688, -3.303496, 0, 0, 0, 1, 1,
-0.7413969, 2.34975, -1.995404, 0, 0, 0, 1, 1,
-0.7399025, -0.1742077, -1.261421, 0, 0, 0, 1, 1,
-0.7334734, -0.6141729, -1.516742, 0, 0, 0, 1, 1,
-0.7318476, -2.022737, -2.415047, 0, 0, 0, 1, 1,
-0.725697, 1.497513, -0.7211765, 0, 0, 0, 1, 1,
-0.7200204, -0.1722113, -1.43965, 1, 1, 1, 1, 1,
-0.7189269, 0.3451795, -1.435658, 1, 1, 1, 1, 1,
-0.7175135, 1.906935, 1.070702, 1, 1, 1, 1, 1,
-0.7155733, 0.5440739, -2.14951, 1, 1, 1, 1, 1,
-0.7151963, 0.5394093, -1.982213, 1, 1, 1, 1, 1,
-0.7122331, 0.1210904, -2.380072, 1, 1, 1, 1, 1,
-0.7121208, 0.005488316, -1.378857, 1, 1, 1, 1, 1,
-0.7113234, -0.1737378, -2.318329, 1, 1, 1, 1, 1,
-0.7027079, -0.6725051, -3.749093, 1, 1, 1, 1, 1,
-0.7012774, -0.3430874, -2.066422, 1, 1, 1, 1, 1,
-0.6983752, 0.09064711, -2.05771, 1, 1, 1, 1, 1,
-0.6949592, 0.8006991, -0.866058, 1, 1, 1, 1, 1,
-0.6914979, -0.09830786, -1.903406, 1, 1, 1, 1, 1,
-0.6877924, 0.6940196, -0.5847216, 1, 1, 1, 1, 1,
-0.687602, 0.5650574, -2.130153, 1, 1, 1, 1, 1,
-0.6816474, -0.5432117, -2.916264, 0, 0, 1, 1, 1,
-0.6793591, 0.05024046, -1.867061, 1, 0, 0, 1, 1,
-0.6702995, 1.274321, 0.8688751, 1, 0, 0, 1, 1,
-0.6687152, -0.9908342, -3.142024, 1, 0, 0, 1, 1,
-0.666233, 0.5542399, 0.7244979, 1, 0, 0, 1, 1,
-0.6642917, 1.562989, 0.01073941, 1, 0, 0, 1, 1,
-0.6604515, 0.5059903, -0.8986819, 0, 0, 0, 1, 1,
-0.660096, 2.437923, 0.002863652, 0, 0, 0, 1, 1,
-0.6539509, 0.6597348, -0.5156739, 0, 0, 0, 1, 1,
-0.6492569, -1.939397, -3.708735, 0, 0, 0, 1, 1,
-0.648525, 0.4097005, -0.6670865, 0, 0, 0, 1, 1,
-0.647918, -1.259247, -2.65416, 0, 0, 0, 1, 1,
-0.6469579, 0.8688582, 0.4532942, 0, 0, 0, 1, 1,
-0.645446, -0.3657077, -2.955593, 1, 1, 1, 1, 1,
-0.6443974, 0.8934948, -1.346941, 1, 1, 1, 1, 1,
-0.6431245, -0.344712, -2.844846, 1, 1, 1, 1, 1,
-0.6387104, -1.346969, -1.996558, 1, 1, 1, 1, 1,
-0.6366693, -1.041979, -1.248371, 1, 1, 1, 1, 1,
-0.6360235, -1.235087, -2.835663, 1, 1, 1, 1, 1,
-0.6335301, 0.7769932, -0.04366327, 1, 1, 1, 1, 1,
-0.6328511, 0.2717755, -0.1485441, 1, 1, 1, 1, 1,
-0.6314253, -0.7943428, 0.7798159, 1, 1, 1, 1, 1,
-0.6240913, -1.207716, -3.966598, 1, 1, 1, 1, 1,
-0.6228163, -2.38434, -1.210229, 1, 1, 1, 1, 1,
-0.619929, 0.7228721, 0.7969624, 1, 1, 1, 1, 1,
-0.6121979, 1.637575, -0.928866, 1, 1, 1, 1, 1,
-0.6099123, 0.3246149, -1.306496, 1, 1, 1, 1, 1,
-0.6083794, -0.4564619, -1.17556, 1, 1, 1, 1, 1,
-0.6082699, 0.4803824, -2.013365, 0, 0, 1, 1, 1,
-0.6030856, -1.252198, -2.117007, 1, 0, 0, 1, 1,
-0.5988431, -2.020394, -2.534078, 1, 0, 0, 1, 1,
-0.5955542, -0.6823196, -2.099836, 1, 0, 0, 1, 1,
-0.5911132, 0.5971538, -1.272531, 1, 0, 0, 1, 1,
-0.5819709, 0.3046659, -1.687469, 1, 0, 0, 1, 1,
-0.5792965, 0.2503601, 0.333986, 0, 0, 0, 1, 1,
-0.5781344, 1.241731, -0.3694382, 0, 0, 0, 1, 1,
-0.5760295, -0.7148209, -2.553424, 0, 0, 0, 1, 1,
-0.5752236, 1.280933, 0.5939229, 0, 0, 0, 1, 1,
-0.5750204, 0.7592408, -2.411928, 0, 0, 0, 1, 1,
-0.5742483, 0.5703216, 0.2325398, 0, 0, 0, 1, 1,
-0.5731148, -1.46138, -3.437427, 0, 0, 0, 1, 1,
-0.5703581, 0.729148, 0.8878196, 1, 1, 1, 1, 1,
-0.5692099, -0.3321387, -2.886536, 1, 1, 1, 1, 1,
-0.5644426, 0.6150895, -1.360937, 1, 1, 1, 1, 1,
-0.5641999, -0.4468687, -1.045426, 1, 1, 1, 1, 1,
-0.5638749, -0.1656433, -2.068778, 1, 1, 1, 1, 1,
-0.5594616, -1.395776, -2.575643, 1, 1, 1, 1, 1,
-0.5585769, 0.9661756, -0.4608881, 1, 1, 1, 1, 1,
-0.5578952, -0.5838795, -1.737516, 1, 1, 1, 1, 1,
-0.5577207, 0.9934481, 0.8366504, 1, 1, 1, 1, 1,
-0.5571136, -0.1663232, -2.871698, 1, 1, 1, 1, 1,
-0.5497898, -0.4780264, -3.132326, 1, 1, 1, 1, 1,
-0.5487106, 1.088243, 0.4550145, 1, 1, 1, 1, 1,
-0.5486864, -0.4511746, -2.876673, 1, 1, 1, 1, 1,
-0.5428787, -0.5928281, -1.786463, 1, 1, 1, 1, 1,
-0.5418687, 1.546158, -0.6193622, 1, 1, 1, 1, 1,
-0.540831, 2.196687, 0.1290848, 0, 0, 1, 1, 1,
-0.5385677, -2.027004, -3.484812, 1, 0, 0, 1, 1,
-0.5376058, 0.4079332, -0.8521104, 1, 0, 0, 1, 1,
-0.5342646, -0.8697999, -2.823426, 1, 0, 0, 1, 1,
-0.5319132, 1.212267, -1.557095, 1, 0, 0, 1, 1,
-0.5273952, -0.1718699, -2.220673, 1, 0, 0, 1, 1,
-0.5263038, 1.397572, 0.8628291, 0, 0, 0, 1, 1,
-0.5259008, -0.958307, -2.797714, 0, 0, 0, 1, 1,
-0.5178919, -0.5655165, -3.205688, 0, 0, 0, 1, 1,
-0.5172206, -0.1572843, -2.558507, 0, 0, 0, 1, 1,
-0.5171363, 0.9172409, 0.5603475, 0, 0, 0, 1, 1,
-0.5142888, 0.7114794, -0.5821207, 0, 0, 0, 1, 1,
-0.5102293, -2.845662, -3.62516, 0, 0, 0, 1, 1,
-0.5065114, -0.9154785, -3.348017, 1, 1, 1, 1, 1,
-0.5034934, -1.24557, -2.8007, 1, 1, 1, 1, 1,
-0.4959415, -0.4535861, -1.912708, 1, 1, 1, 1, 1,
-0.4956017, 0.408718, -1.233406, 1, 1, 1, 1, 1,
-0.4915645, 0.2624571, 0.4268256, 1, 1, 1, 1, 1,
-0.489563, 0.5132446, -1.146399, 1, 1, 1, 1, 1,
-0.4829262, 1.933817, 0.3623826, 1, 1, 1, 1, 1,
-0.4827235, 0.09394668, -2.330204, 1, 1, 1, 1, 1,
-0.4801284, 0.7306548, -0.5327191, 1, 1, 1, 1, 1,
-0.4783829, -0.7939054, -2.811875, 1, 1, 1, 1, 1,
-0.4726241, 0.9256409, 1.574683, 1, 1, 1, 1, 1,
-0.4706347, -1.430172, -4.280836, 1, 1, 1, 1, 1,
-0.4695249, -0.3001195, -1.293456, 1, 1, 1, 1, 1,
-0.4685932, -1.662914, -3.302095, 1, 1, 1, 1, 1,
-0.4640813, 0.4838749, 0.9788119, 1, 1, 1, 1, 1,
-0.4619794, 0.3646674, -0.7153071, 0, 0, 1, 1, 1,
-0.4615471, -0.7849564, -1.574785, 1, 0, 0, 1, 1,
-0.4598824, -0.8504788, -2.325412, 1, 0, 0, 1, 1,
-0.4580972, 2.032234, 0.7429242, 1, 0, 0, 1, 1,
-0.4569599, 0.3102164, -0.02862547, 1, 0, 0, 1, 1,
-0.4526968, 1.987429, 0.9785712, 1, 0, 0, 1, 1,
-0.4525851, -0.5694408, -1.687942, 0, 0, 0, 1, 1,
-0.4523045, -0.3443026, -1.522905, 0, 0, 0, 1, 1,
-0.4497463, -0.4078377, -2.499016, 0, 0, 0, 1, 1,
-0.4465674, 1.520787, -0.533738, 0, 0, 0, 1, 1,
-0.4435472, 1.105839, -0.8770105, 0, 0, 0, 1, 1,
-0.4424336, 1.703826, 0.08692037, 0, 0, 0, 1, 1,
-0.4399005, -0.8866031, -4.251638, 0, 0, 0, 1, 1,
-0.4339074, 0.4370416, -3.251195, 1, 1, 1, 1, 1,
-0.4319457, 0.5159194, -0.2704163, 1, 1, 1, 1, 1,
-0.4299935, 0.1690427, -1.01927, 1, 1, 1, 1, 1,
-0.4295079, 1.051377, 0.1695436, 1, 1, 1, 1, 1,
-0.4230931, 0.8870932, -0.3023154, 1, 1, 1, 1, 1,
-0.4166548, -1.243025, -2.267231, 1, 1, 1, 1, 1,
-0.4086886, 1.700007, 0.002524962, 1, 1, 1, 1, 1,
-0.4054132, 0.3850274, -2.787072, 1, 1, 1, 1, 1,
-0.4003653, -0.07713566, -2.459903, 1, 1, 1, 1, 1,
-0.4000127, 1.391187, 0.3830286, 1, 1, 1, 1, 1,
-0.3991399, -1.210907, -1.495268, 1, 1, 1, 1, 1,
-0.3981004, 0.2388404, 0.5648305, 1, 1, 1, 1, 1,
-0.3962767, 0.5608594, -0.803071, 1, 1, 1, 1, 1,
-0.3960883, 0.1999454, -0.3277198, 1, 1, 1, 1, 1,
-0.394021, 0.4640369, -2.465766, 1, 1, 1, 1, 1,
-0.3938223, 0.18583, -0.1237931, 0, 0, 1, 1, 1,
-0.3912404, 0.5586544, 0.1978068, 1, 0, 0, 1, 1,
-0.3898177, 0.05497527, -0.9844414, 1, 0, 0, 1, 1,
-0.380333, -0.989075, -4.392885, 1, 0, 0, 1, 1,
-0.3758635, 0.5686957, 0.2708786, 1, 0, 0, 1, 1,
-0.375379, 0.06891076, -1.678878, 1, 0, 0, 1, 1,
-0.3740594, 1.099192, -0.8303458, 0, 0, 0, 1, 1,
-0.3735329, -0.01941858, -2.311278, 0, 0, 0, 1, 1,
-0.3724701, 1.470387, -0.3169069, 0, 0, 0, 1, 1,
-0.3702913, -0.3117646, -3.582235, 0, 0, 0, 1, 1,
-0.3701756, -0.03098864, -2.274019, 0, 0, 0, 1, 1,
-0.3691207, -0.8340879, -2.016682, 0, 0, 0, 1, 1,
-0.3687761, 0.165498, -1.512966, 0, 0, 0, 1, 1,
-0.3662758, 0.1263226, -1.408145, 1, 1, 1, 1, 1,
-0.3659641, -0.3482495, -1.032407, 1, 1, 1, 1, 1,
-0.3655235, -0.4991725, -3.922964, 1, 1, 1, 1, 1,
-0.3604198, 1.592455, 0.4774633, 1, 1, 1, 1, 1,
-0.3584289, -0.9472264, -3.208184, 1, 1, 1, 1, 1,
-0.3569217, 0.003642996, -1.286725, 1, 1, 1, 1, 1,
-0.3564658, 0.3911753, -1.285376, 1, 1, 1, 1, 1,
-0.3562571, 1.250833, 1.920254, 1, 1, 1, 1, 1,
-0.3556225, 1.015294, -0.3706628, 1, 1, 1, 1, 1,
-0.3554797, -2.446831, -2.922979, 1, 1, 1, 1, 1,
-0.350993, 0.02956071, 0.3911844, 1, 1, 1, 1, 1,
-0.3465296, 0.9914326, 0.8064626, 1, 1, 1, 1, 1,
-0.3462086, -0.4600996, -2.649574, 1, 1, 1, 1, 1,
-0.3454458, -0.398922, -2.058763, 1, 1, 1, 1, 1,
-0.3407866, -0.1658296, -1.363768, 1, 1, 1, 1, 1,
-0.3402648, -0.8217725, -2.560775, 0, 0, 1, 1, 1,
-0.3402572, -0.05874936, -2.132023, 1, 0, 0, 1, 1,
-0.3401993, 0.01860425, -1.233028, 1, 0, 0, 1, 1,
-0.3392542, 0.2241086, -1.183095, 1, 0, 0, 1, 1,
-0.3377125, -1.297547, -4.733408, 1, 0, 0, 1, 1,
-0.3369755, -0.05857548, -2.166888, 1, 0, 0, 1, 1,
-0.3355012, -1.218657, -1.507763, 0, 0, 0, 1, 1,
-0.332265, 2.111941, -0.6047814, 0, 0, 0, 1, 1,
-0.330563, -0.1011073, -2.261374, 0, 0, 0, 1, 1,
-0.3200589, 0.8609433, 0.5533937, 0, 0, 0, 1, 1,
-0.3161887, 0.4842235, -3.19499, 0, 0, 0, 1, 1,
-0.312114, -0.987575, -1.92291, 0, 0, 0, 1, 1,
-0.3069285, 0.7937488, 0.7413033, 0, 0, 0, 1, 1,
-0.3068096, 0.8054145, -0.417822, 1, 1, 1, 1, 1,
-0.304528, -0.6216319, -2.033442, 1, 1, 1, 1, 1,
-0.2990421, -1.282296, -2.322757, 1, 1, 1, 1, 1,
-0.298618, 1.203104, 1.27459, 1, 1, 1, 1, 1,
-0.2962703, -0.4942481, -1.229054, 1, 1, 1, 1, 1,
-0.2924881, -0.4056972, -3.912707, 1, 1, 1, 1, 1,
-0.2922729, 0.3246856, -2.178486, 1, 1, 1, 1, 1,
-0.2877501, 0.6500117, 1.405454, 1, 1, 1, 1, 1,
-0.2864404, -2.288448, -1.823687, 1, 1, 1, 1, 1,
-0.2849845, -1.027312, -2.201906, 1, 1, 1, 1, 1,
-0.2811323, -1.423797, -4.261714, 1, 1, 1, 1, 1,
-0.2804061, 0.3953165, -1.911707, 1, 1, 1, 1, 1,
-0.2772211, 1.532061, -0.5457438, 1, 1, 1, 1, 1,
-0.2754782, -0.7717788, -3.08698, 1, 1, 1, 1, 1,
-0.2739123, 1.709593, -0.3857386, 1, 1, 1, 1, 1,
-0.2736328, 0.579015, -1.677895, 0, 0, 1, 1, 1,
-0.2729492, 0.7013404, 0.3951572, 1, 0, 0, 1, 1,
-0.2683102, -0.1785762, -0.7713988, 1, 0, 0, 1, 1,
-0.2663175, 0.6385789, -1.71381, 1, 0, 0, 1, 1,
-0.2621234, 0.9742513, 0.3017567, 1, 0, 0, 1, 1,
-0.2599763, 1.686567, -1.498503, 1, 0, 0, 1, 1,
-0.2567445, 0.4333338, -0.7532318, 0, 0, 0, 1, 1,
-0.2534557, 1.210769, 0.8042234, 0, 0, 0, 1, 1,
-0.2493469, -1.417093, -3.160141, 0, 0, 0, 1, 1,
-0.2465713, -1.017483, -0.7555382, 0, 0, 0, 1, 1,
-0.2463798, 1.272841, -0.4195563, 0, 0, 0, 1, 1,
-0.2401233, 0.1350205, -0.764376, 0, 0, 0, 1, 1,
-0.2386077, 1.049497, -0.9212364, 0, 0, 0, 1, 1,
-0.2378164, -0.9648488, -1.835772, 1, 1, 1, 1, 1,
-0.2345933, -0.6759798, -4.641448, 1, 1, 1, 1, 1,
-0.2337314, 0.3209644, -1.877416, 1, 1, 1, 1, 1,
-0.2318318, -0.05330954, -0.8005967, 1, 1, 1, 1, 1,
-0.2293544, 0.6657367, -0.7744294, 1, 1, 1, 1, 1,
-0.2278195, -0.2764837, -2.69578, 1, 1, 1, 1, 1,
-0.2223172, -0.6387064, -3.481964, 1, 1, 1, 1, 1,
-0.2153107, 0.3653363, -0.2663086, 1, 1, 1, 1, 1,
-0.2100948, -0.1090281, -3.367922, 1, 1, 1, 1, 1,
-0.2093616, 0.3343408, 0.9171017, 1, 1, 1, 1, 1,
-0.1994388, -0.5574262, -3.262549, 1, 1, 1, 1, 1,
-0.1990338, 0.9332156, 0.1551269, 1, 1, 1, 1, 1,
-0.1977931, 0.7664067, -0.4213446, 1, 1, 1, 1, 1,
-0.1914143, 0.3060873, -1.070513, 1, 1, 1, 1, 1,
-0.1898111, -0.06462938, -0.9999034, 1, 1, 1, 1, 1,
-0.1866248, 0.6403714, -0.6031951, 0, 0, 1, 1, 1,
-0.1746299, -1.474267, -1.3961, 1, 0, 0, 1, 1,
-0.1744297, -1.008236, -3.461313, 1, 0, 0, 1, 1,
-0.1733389, 0.2214931, 0.6295387, 1, 0, 0, 1, 1,
-0.169337, 0.2798172, -2.225252, 1, 0, 0, 1, 1,
-0.1603423, 0.3452843, 0.3277261, 1, 0, 0, 1, 1,
-0.1601189, -0.1884039, -2.60573, 0, 0, 0, 1, 1,
-0.1584036, -1.305233, -5.471087, 0, 0, 0, 1, 1,
-0.1574695, -1.558971, -2.738413, 0, 0, 0, 1, 1,
-0.1529294, -0.1924285, -3.112466, 0, 0, 0, 1, 1,
-0.1526002, -0.2547659, -3.137049, 0, 0, 0, 1, 1,
-0.1518244, -0.2899497, -3.328781, 0, 0, 0, 1, 1,
-0.1431903, 1.247809, -1.699525, 0, 0, 0, 1, 1,
-0.1419186, 0.7680141, 0.6260155, 1, 1, 1, 1, 1,
-0.1389122, -0.004897828, -1.663678, 1, 1, 1, 1, 1,
-0.1311446, -1.339008, -2.959713, 1, 1, 1, 1, 1,
-0.1303229, 1.526037, 2.227706, 1, 1, 1, 1, 1,
-0.1300491, 0.8239257, 1.263757, 1, 1, 1, 1, 1,
-0.1292447, -0.3156717, -0.4548189, 1, 1, 1, 1, 1,
-0.1281536, -0.2916916, -4.785267, 1, 1, 1, 1, 1,
-0.120941, 1.230509, 1.268769, 1, 1, 1, 1, 1,
-0.1201461, -0.8595462, -3.287971, 1, 1, 1, 1, 1,
-0.1195193, -0.09786753, -1.616481, 1, 1, 1, 1, 1,
-0.1194583, -1.400704, -3.167408, 1, 1, 1, 1, 1,
-0.1188269, 0.1680139, -2.948474, 1, 1, 1, 1, 1,
-0.1184638, 0.8546827, -0.7116321, 1, 1, 1, 1, 1,
-0.1177837, -2.316137, -2.643586, 1, 1, 1, 1, 1,
-0.1164976, 0.13037, -0.6146602, 1, 1, 1, 1, 1,
-0.1154372, 1.128155, -0.2698856, 0, 0, 1, 1, 1,
-0.1141984, -0.8901418, -2.724114, 1, 0, 0, 1, 1,
-0.1131874, 0.9334641, 1.509915, 1, 0, 0, 1, 1,
-0.1119634, -0.5849739, -3.122458, 1, 0, 0, 1, 1,
-0.11191, 0.1542101, -2.372562, 1, 0, 0, 1, 1,
-0.1095165, -1.038077, -4.556906, 1, 0, 0, 1, 1,
-0.1085316, -0.07368633, -2.716032, 0, 0, 0, 1, 1,
-0.10783, 0.9280202, -0.5382217, 0, 0, 0, 1, 1,
-0.1029776, 1.61613, 0.7385802, 0, 0, 0, 1, 1,
-0.1020361, -0.06884491, -2.413855, 0, 0, 0, 1, 1,
-0.09965318, 0.3205476, -0.2950655, 0, 0, 0, 1, 1,
-0.09950892, 0.3792681, -0.08183856, 0, 0, 0, 1, 1,
-0.0985217, -1.254469, -3.387327, 0, 0, 0, 1, 1,
-0.09589318, -1.951741, -1.654087, 1, 1, 1, 1, 1,
-0.08793095, -0.3130766, -3.119888, 1, 1, 1, 1, 1,
-0.08538406, 1.696606, -0.705283, 1, 1, 1, 1, 1,
-0.08247291, -0.1761115, -3.723027, 1, 1, 1, 1, 1,
-0.08009835, 0.409312, 0.8789027, 1, 1, 1, 1, 1,
-0.07486194, -0.9539244, -3.460167, 1, 1, 1, 1, 1,
-0.07359656, 0.982998, 1.498627, 1, 1, 1, 1, 1,
-0.07284911, -0.05591043, -3.051271, 1, 1, 1, 1, 1,
-0.07059488, 1.955152, 0.1881559, 1, 1, 1, 1, 1,
-0.06541134, -1.295131, -3.33938, 1, 1, 1, 1, 1,
-0.06419954, -0.03011244, -1.763677, 1, 1, 1, 1, 1,
-0.06350422, 0.3815241, -2.222893, 1, 1, 1, 1, 1,
-0.05141008, -0.8029249, -3.650221, 1, 1, 1, 1, 1,
-0.04937731, 0.5009675, -0.8816483, 1, 1, 1, 1, 1,
-0.04551734, -0.4695302, -4.077936, 1, 1, 1, 1, 1,
-0.0415458, 0.1645076, -0.6385895, 0, 0, 1, 1, 1,
-0.03452436, 2.542133, 1.04919, 1, 0, 0, 1, 1,
-0.02915778, -0.1992561, -3.982914, 1, 0, 0, 1, 1,
-0.0222978, 0.9683258, -0.9583881, 1, 0, 0, 1, 1,
-0.02214253, -1.075978, -2.456391, 1, 0, 0, 1, 1,
-0.02050116, -0.3514093, -2.093164, 1, 0, 0, 1, 1,
-0.01970816, -1.111202, -3.675772, 0, 0, 0, 1, 1,
-0.01932815, 0.1108674, -0.03767627, 0, 0, 0, 1, 1,
-0.01804052, 0.1938965, 0.1940694, 0, 0, 0, 1, 1,
-0.01780267, 0.9441175, 0.8657224, 0, 0, 0, 1, 1,
-0.01692281, 1.256336, 0.9825942, 0, 0, 0, 1, 1,
-0.01576136, -1.230394, -0.8605453, 0, 0, 0, 1, 1,
-0.01355542, -1.091082, -2.834261, 0, 0, 0, 1, 1,
0.004568043, -0.4961935, 4.054487, 1, 1, 1, 1, 1,
0.005169469, -0.7642215, 2.170738, 1, 1, 1, 1, 1,
0.007570407, 0.9793221, -0.181684, 1, 1, 1, 1, 1,
0.00816639, 1.63752, -1.20236, 1, 1, 1, 1, 1,
0.008320131, 0.5686111, -0.4409789, 1, 1, 1, 1, 1,
0.00946714, -0.2532673, 3.577843, 1, 1, 1, 1, 1,
0.01104197, -0.4228657, 3.439368, 1, 1, 1, 1, 1,
0.01132789, 0.0007462338, 0.7224339, 1, 1, 1, 1, 1,
0.01786457, 0.6008451, 0.6875755, 1, 1, 1, 1, 1,
0.01932362, -0.7209681, 1.85112, 1, 1, 1, 1, 1,
0.01957978, 0.3978532, -0.4910658, 1, 1, 1, 1, 1,
0.0198205, -0.3729221, 3.409684, 1, 1, 1, 1, 1,
0.02113178, 0.234769, -0.2673987, 1, 1, 1, 1, 1,
0.02418127, 0.2753906, -2.471255, 1, 1, 1, 1, 1,
0.03138, 0.4548977, 0.0283788, 1, 1, 1, 1, 1,
0.03335464, -2.645222, 4.017182, 0, 0, 1, 1, 1,
0.03494074, 0.6798995, 0.6485589, 1, 0, 0, 1, 1,
0.03827316, -0.6792642, 4.287098, 1, 0, 0, 1, 1,
0.04158584, -1.315099, 4.331789, 1, 0, 0, 1, 1,
0.04206481, -1.141565, 4.625529, 1, 0, 0, 1, 1,
0.04425946, 0.05608772, 0.7720826, 1, 0, 0, 1, 1,
0.04437798, -1.43692, 3.499543, 0, 0, 0, 1, 1,
0.04877808, 0.9173017, -1.225183, 0, 0, 0, 1, 1,
0.05018156, 0.8980185, -0.1819284, 0, 0, 0, 1, 1,
0.05100249, -1.691431, 3.054822, 0, 0, 0, 1, 1,
0.05422015, -1.680917, 2.1855, 0, 0, 0, 1, 1,
0.0557547, -0.3032533, 2.949935, 0, 0, 0, 1, 1,
0.05800319, 0.3227698, 0.452073, 0, 0, 0, 1, 1,
0.06039554, 0.5870156, -1.637329, 1, 1, 1, 1, 1,
0.0614505, -0.04215, 1.44136, 1, 1, 1, 1, 1,
0.06592216, -0.5561835, 2.643682, 1, 1, 1, 1, 1,
0.06885714, -0.2209347, 3.085373, 1, 1, 1, 1, 1,
0.07221849, 0.7681967, 1.168497, 1, 1, 1, 1, 1,
0.07887885, 0.5483345, -0.1823447, 1, 1, 1, 1, 1,
0.08084945, 0.2197106, -0.1990167, 1, 1, 1, 1, 1,
0.08377875, 0.5184723, -0.3418002, 1, 1, 1, 1, 1,
0.08565234, 1.319989, 0.1466518, 1, 1, 1, 1, 1,
0.08833928, 0.01189999, 0.447065, 1, 1, 1, 1, 1,
0.08892643, -0.3692423, 2.897955, 1, 1, 1, 1, 1,
0.08924752, 0.4621546, -0.4972245, 1, 1, 1, 1, 1,
0.09061605, 0.2500318, -0.86, 1, 1, 1, 1, 1,
0.0926628, 0.1205536, 1.135445, 1, 1, 1, 1, 1,
0.09310822, -0.06282219, 3.314119, 1, 1, 1, 1, 1,
0.0992813, -0.1029222, 0.6880854, 0, 0, 1, 1, 1,
0.1025141, -0.2060137, 2.571402, 1, 0, 0, 1, 1,
0.1099641, 0.8497221, -1.03647, 1, 0, 0, 1, 1,
0.1104849, -0.9776538, 3.235447, 1, 0, 0, 1, 1,
0.1110587, -0.35035, 2.994985, 1, 0, 0, 1, 1,
0.1132447, 2.196015, -0.7814981, 1, 0, 0, 1, 1,
0.1175791, 1.634193, -1.24883, 0, 0, 0, 1, 1,
0.1200993, 1.948423, -0.3205619, 0, 0, 0, 1, 1,
0.1216036, 1.435324, -0.4737908, 0, 0, 0, 1, 1,
0.1242394, 0.4476685, -1.33904, 0, 0, 0, 1, 1,
0.1295947, -0.7034224, 4.556011, 0, 0, 0, 1, 1,
0.1297004, -1.674223, 3.879353, 0, 0, 0, 1, 1,
0.1308707, -0.2754334, 2.824479, 0, 0, 0, 1, 1,
0.1374025, -0.08821239, 2.265071, 1, 1, 1, 1, 1,
0.1472637, -1.005817, 1.90016, 1, 1, 1, 1, 1,
0.1478643, 0.6396995, 0.253344, 1, 1, 1, 1, 1,
0.1534307, -0.2235293, 1.857893, 1, 1, 1, 1, 1,
0.1556428, 0.8513518, 0.6112226, 1, 1, 1, 1, 1,
0.1564992, -0.3936046, 1.950015, 1, 1, 1, 1, 1,
0.1565614, 0.2880763, -1.565502, 1, 1, 1, 1, 1,
0.1587027, 0.6419717, -0.01345992, 1, 1, 1, 1, 1,
0.1590775, -0.2010442, 2.319579, 1, 1, 1, 1, 1,
0.1608038, 0.2555474, 0.7114545, 1, 1, 1, 1, 1,
0.1617172, 0.8107523, 2.35011, 1, 1, 1, 1, 1,
0.1661678, 1.506421, 0.6348461, 1, 1, 1, 1, 1,
0.1701092, -0.4689378, 2.485085, 1, 1, 1, 1, 1,
0.1707427, 0.3883828, 0.04236658, 1, 1, 1, 1, 1,
0.1718695, 1.64679, -0.9692554, 1, 1, 1, 1, 1,
0.1740604, 0.6576664, 0.4925227, 0, 0, 1, 1, 1,
0.1776181, 0.5132322, 0.1005682, 1, 0, 0, 1, 1,
0.1835163, -0.6605083, 2.404562, 1, 0, 0, 1, 1,
0.1852413, 0.09960109, 2.905061, 1, 0, 0, 1, 1,
0.1908675, -2.002176, 4.00232, 1, 0, 0, 1, 1,
0.1916333, -1.104937, 3.329559, 1, 0, 0, 1, 1,
0.1930509, -0.5678359, 1.842316, 0, 0, 0, 1, 1,
0.1935662, 0.7152421, -0.4296355, 0, 0, 0, 1, 1,
0.1976322, 1.459719, 0.7284486, 0, 0, 0, 1, 1,
0.1983524, 2.713563, 0.4403513, 0, 0, 0, 1, 1,
0.1993589, 0.9200003, -0.407598, 0, 0, 0, 1, 1,
0.2008676, -1.079628, 3.597948, 0, 0, 0, 1, 1,
0.2012655, 0.0678942, 0.4588985, 0, 0, 0, 1, 1,
0.2032828, 0.9429962, 0.3767811, 1, 1, 1, 1, 1,
0.2060319, -0.3931177, 2.556516, 1, 1, 1, 1, 1,
0.2063818, -0.8021461, 4.239291, 1, 1, 1, 1, 1,
0.2126248, -0.1004088, 1.718709, 1, 1, 1, 1, 1,
0.2138564, 0.09560366, 1.54986, 1, 1, 1, 1, 1,
0.2140662, -1.016312, 3.689749, 1, 1, 1, 1, 1,
0.2189392, 0.2953558, 2.60968, 1, 1, 1, 1, 1,
0.2236047, 0.1104645, -0.4890789, 1, 1, 1, 1, 1,
0.2238912, 1.725672, 0.406884, 1, 1, 1, 1, 1,
0.232033, 0.12634, 1.683972, 1, 1, 1, 1, 1,
0.2326987, -0.2841509, 2.680475, 1, 1, 1, 1, 1,
0.2333734, 0.7384518, 0.7767514, 1, 1, 1, 1, 1,
0.2338617, 0.8133031, -1.197298, 1, 1, 1, 1, 1,
0.2347945, -0.1019837, 3.026705, 1, 1, 1, 1, 1,
0.2360428, -0.4160481, 3.678908, 1, 1, 1, 1, 1,
0.2387408, 0.1935852, 1.055138, 0, 0, 1, 1, 1,
0.2392756, 0.7143604, 0.3676296, 1, 0, 0, 1, 1,
0.2431372, -0.7747347, 3.195838, 1, 0, 0, 1, 1,
0.2540447, -0.5197765, 2.376106, 1, 0, 0, 1, 1,
0.2560764, -0.6622403, 4.294341, 1, 0, 0, 1, 1,
0.2580694, -1.5443, 4.174036, 1, 0, 0, 1, 1,
0.2677415, 0.2443817, 1.163096, 0, 0, 0, 1, 1,
0.2683092, -0.3479943, 2.571086, 0, 0, 0, 1, 1,
0.2689856, 1.177498, -0.7575296, 0, 0, 0, 1, 1,
0.2700791, -1.017652, 4.185447, 0, 0, 0, 1, 1,
0.2822322, 0.6646858, 0.2177314, 0, 0, 0, 1, 1,
0.2891806, 0.8246114, 0.2643613, 0, 0, 0, 1, 1,
0.2903104, -0.7097766, 1.159859, 0, 0, 0, 1, 1,
0.2936543, 0.08260676, 0.4221307, 1, 1, 1, 1, 1,
0.2944292, -0.06935167, 3.338872, 1, 1, 1, 1, 1,
0.2974764, -1.326506, 3.673977, 1, 1, 1, 1, 1,
0.3008288, 0.383622, 0.1636205, 1, 1, 1, 1, 1,
0.3024748, -0.3874753, 1.906435, 1, 1, 1, 1, 1,
0.3044679, -0.4665364, 2.511514, 1, 1, 1, 1, 1,
0.3045014, 0.5896376, 0.4868863, 1, 1, 1, 1, 1,
0.3084902, -0.8051419, 2.24778, 1, 1, 1, 1, 1,
0.3110117, -0.7465002, 3.389216, 1, 1, 1, 1, 1,
0.3150112, 0.4668949, -0.130577, 1, 1, 1, 1, 1,
0.3163371, -1.668742, 1.841537, 1, 1, 1, 1, 1,
0.3181925, -0.02850232, 0.315271, 1, 1, 1, 1, 1,
0.3204745, 1.18085, 0.4396574, 1, 1, 1, 1, 1,
0.321117, 0.02825965, 1.740687, 1, 1, 1, 1, 1,
0.323991, -0.7393446, 2.958368, 1, 1, 1, 1, 1,
0.3288244, 0.8637078, 0.9707076, 0, 0, 1, 1, 1,
0.3310997, -0.3893306, 3.584296, 1, 0, 0, 1, 1,
0.331497, 0.7581457, -0.08037544, 1, 0, 0, 1, 1,
0.3363374, 0.9706279, 0.3322887, 1, 0, 0, 1, 1,
0.336525, 0.498226, 0.2749847, 1, 0, 0, 1, 1,
0.3386957, 1.558128, 0.6577469, 1, 0, 0, 1, 1,
0.3467146, 0.3036956, 1.027591, 0, 0, 0, 1, 1,
0.3475204, -1.194714, 2.797031, 0, 0, 0, 1, 1,
0.3531876, -1.708487, 5.275187, 0, 0, 0, 1, 1,
0.3591578, -0.2502829, 1.364667, 0, 0, 0, 1, 1,
0.3617989, 1.808002, -1.3188, 0, 0, 0, 1, 1,
0.3618276, -0.8883087, 4.292768, 0, 0, 0, 1, 1,
0.362817, -1.155286, 3.215142, 0, 0, 0, 1, 1,
0.3658009, 0.8719738, 0.1163138, 1, 1, 1, 1, 1,
0.3663586, 0.4313909, 1.140857, 1, 1, 1, 1, 1,
0.368163, 0.06800897, 2.496465, 1, 1, 1, 1, 1,
0.374855, -0.4531275, 3.061226, 1, 1, 1, 1, 1,
0.3756352, -0.1801434, 2.692871, 1, 1, 1, 1, 1,
0.3756385, -0.4525328, 0.3672333, 1, 1, 1, 1, 1,
0.3773396, -0.245757, 1.476596, 1, 1, 1, 1, 1,
0.3831147, 0.857006, 0.0313294, 1, 1, 1, 1, 1,
0.3920984, 0.2101613, 1.039841, 1, 1, 1, 1, 1,
0.3963395, -0.4013754, 2.066616, 1, 1, 1, 1, 1,
0.3966644, -0.7106237, 2.961827, 1, 1, 1, 1, 1,
0.3997488, -0.3773444, 3.210562, 1, 1, 1, 1, 1,
0.4026652, 1.30132, 1.347733, 1, 1, 1, 1, 1,
0.4031723, 1.02908, -2.149598, 1, 1, 1, 1, 1,
0.4065194, -0.2596095, 0.9037021, 1, 1, 1, 1, 1,
0.4118415, -0.9603127, 3.109039, 0, 0, 1, 1, 1,
0.4136539, -0.5163643, 2.454708, 1, 0, 0, 1, 1,
0.4159185, -0.7898739, 3.063729, 1, 0, 0, 1, 1,
0.4166497, -0.6959313, 1.951986, 1, 0, 0, 1, 1,
0.4172498, -0.4772007, 3.492235, 1, 0, 0, 1, 1,
0.4183006, -0.104658, 1.926869, 1, 0, 0, 1, 1,
0.4205527, -2.256061, 2.714153, 0, 0, 0, 1, 1,
0.4241858, -0.398937, 3.634365, 0, 0, 0, 1, 1,
0.4280432, -0.9174886, 1.4225, 0, 0, 0, 1, 1,
0.4292533, -0.5184788, 2.909179, 0, 0, 0, 1, 1,
0.4326747, -0.1172193, 2.389332, 0, 0, 0, 1, 1,
0.4328434, -0.3757864, 0.3417111, 0, 0, 0, 1, 1,
0.4329134, 2.60529, 0.5639306, 0, 0, 0, 1, 1,
0.4331781, -0.6246043, 2.396822, 1, 1, 1, 1, 1,
0.4388272, 0.7808166, -0.9291267, 1, 1, 1, 1, 1,
0.4388356, 0.2492687, 0.006387047, 1, 1, 1, 1, 1,
0.4419377, 0.4486591, 0.6059096, 1, 1, 1, 1, 1,
0.4486608, 0.02503228, 0.02236712, 1, 1, 1, 1, 1,
0.4598977, 0.6259643, 0.3345045, 1, 1, 1, 1, 1,
0.4622812, 0.60444, 0.255231, 1, 1, 1, 1, 1,
0.4624765, -1.654105, 1.510719, 1, 1, 1, 1, 1,
0.465233, 0.1749536, 0.6880057, 1, 1, 1, 1, 1,
0.4658054, 1.081038, -0.7869249, 1, 1, 1, 1, 1,
0.472408, -0.3222558, 3.499206, 1, 1, 1, 1, 1,
0.4724188, 0.5333225, 1.681118, 1, 1, 1, 1, 1,
0.4730559, 2.239113, -0.9876407, 1, 1, 1, 1, 1,
0.4743178, -0.513838, 0.3700423, 1, 1, 1, 1, 1,
0.4763795, 1.669841, 0.02440505, 1, 1, 1, 1, 1,
0.4798313, -0.3392281, 1.679948, 0, 0, 1, 1, 1,
0.4874165, -0.7662922, 2.666468, 1, 0, 0, 1, 1,
0.4890394, -0.8683805, 1.942056, 1, 0, 0, 1, 1,
0.4957511, -0.5664208, 1.46804, 1, 0, 0, 1, 1,
0.5056804, 0.5206383, 0.4856395, 1, 0, 0, 1, 1,
0.5141428, -0.3353686, 2.162287, 1, 0, 0, 1, 1,
0.5170241, 0.3035013, 1.706935, 0, 0, 0, 1, 1,
0.5222383, -0.07021916, 1.410575, 0, 0, 0, 1, 1,
0.530442, -0.3224227, 2.827189, 0, 0, 0, 1, 1,
0.530957, -1.057342, 0.5227802, 0, 0, 0, 1, 1,
0.5326669, -0.8441699, 2.984643, 0, 0, 0, 1, 1,
0.5466061, -0.2444961, 2.479627, 0, 0, 0, 1, 1,
0.5469528, 0.1447779, 0.7151228, 0, 0, 0, 1, 1,
0.5506128, -0.735765, 1.951164, 1, 1, 1, 1, 1,
0.5576987, 0.4704586, 1.575387, 1, 1, 1, 1, 1,
0.5592361, -1.460601, 3.017303, 1, 1, 1, 1, 1,
0.5612109, 1.922139, 0.1536443, 1, 1, 1, 1, 1,
0.5615783, 0.2587135, -0.08909668, 1, 1, 1, 1, 1,
0.5619923, 0.5957716, 1.187343, 1, 1, 1, 1, 1,
0.5658075, -2.376147, 3.417645, 1, 1, 1, 1, 1,
0.5664793, 1.477601, 1.0947, 1, 1, 1, 1, 1,
0.5668315, -0.5132529, 3.952215, 1, 1, 1, 1, 1,
0.5674955, -0.2060163, 2.611647, 1, 1, 1, 1, 1,
0.5684295, -1.005111, 2.025492, 1, 1, 1, 1, 1,
0.5688695, 1.648902, 0.9283691, 1, 1, 1, 1, 1,
0.575962, -0.2920307, 2.426651, 1, 1, 1, 1, 1,
0.5778618, 0.814271, 0.5477155, 1, 1, 1, 1, 1,
0.5789986, -0.9254077, 2.679597, 1, 1, 1, 1, 1,
0.5821025, 2.142548, 0.528613, 0, 0, 1, 1, 1,
0.5865353, -1.763216, 3.313144, 1, 0, 0, 1, 1,
0.5865988, 1.440836, -0.6992234, 1, 0, 0, 1, 1,
0.5880644, 0.7474703, -0.1499061, 1, 0, 0, 1, 1,
0.5894266, -0.05642174, 0.1566124, 1, 0, 0, 1, 1,
0.6005576, 0.2844459, 0.2867169, 1, 0, 0, 1, 1,
0.6068769, 1.077257, 0.9709758, 0, 0, 0, 1, 1,
0.608883, 0.6166715, 0.1503753, 0, 0, 0, 1, 1,
0.6143804, -1.316704, 2.819847, 0, 0, 0, 1, 1,
0.6185408, -0.6179959, 3.179157, 0, 0, 0, 1, 1,
0.6189522, -1.040649, 0.7548298, 0, 0, 0, 1, 1,
0.618963, 1.20286, 0.9885931, 0, 0, 0, 1, 1,
0.621703, 0.988981, 0.1673026, 0, 0, 0, 1, 1,
0.623237, -0.1855972, 2.741827, 1, 1, 1, 1, 1,
0.6330224, -0.4450313, 1.457834, 1, 1, 1, 1, 1,
0.6365938, 0.05071967, 2.077494, 1, 1, 1, 1, 1,
0.6412135, 1.566762, -0.5216632, 1, 1, 1, 1, 1,
0.6464115, 1.071066, 0.3415786, 1, 1, 1, 1, 1,
0.6471348, -0.08407088, 1.52679, 1, 1, 1, 1, 1,
0.6480467, 0.9796084, 0.3720519, 1, 1, 1, 1, 1,
0.652442, -0.1589805, 1.66485, 1, 1, 1, 1, 1,
0.6574497, -1.098123, 2.541401, 1, 1, 1, 1, 1,
0.658236, 1.077912, 1.135394, 1, 1, 1, 1, 1,
0.6587611, 1.470703, -0.8007463, 1, 1, 1, 1, 1,
0.6660568, 0.8013718, 0.6564754, 1, 1, 1, 1, 1,
0.6717764, -1.084374, 3.362693, 1, 1, 1, 1, 1,
0.6818408, -0.1355817, 0.1731198, 1, 1, 1, 1, 1,
0.6831368, 1.360991, 1.140946, 1, 1, 1, 1, 1,
0.6844707, 0.6345884, 1.567577, 0, 0, 1, 1, 1,
0.687838, -0.0475277, 1.756994, 1, 0, 0, 1, 1,
0.6889339, -0.6072795, 3.255, 1, 0, 0, 1, 1,
0.6898552, 0.656167, 1.230813, 1, 0, 0, 1, 1,
0.693373, 0.9494987, 1.069977, 1, 0, 0, 1, 1,
0.7007355, -1.126784, 2.699081, 1, 0, 0, 1, 1,
0.7036135, -0.9349017, 2.0353, 0, 0, 0, 1, 1,
0.7101355, 2.806709, 2.013547, 0, 0, 0, 1, 1,
0.7119192, 1.22452, 0.8864104, 0, 0, 0, 1, 1,
0.7123576, 0.6482892, 0.0137828, 0, 0, 0, 1, 1,
0.7137693, -0.4453908, 3.659978, 0, 0, 0, 1, 1,
0.7173953, 0.9950027, 1.571289, 0, 0, 0, 1, 1,
0.7184268, 0.7498751, 2.178042, 0, 0, 0, 1, 1,
0.7198253, -2.302307, 0.9231443, 1, 1, 1, 1, 1,
0.7220169, -0.604809, 4.210579, 1, 1, 1, 1, 1,
0.7337102, 0.6403987, 1.536647, 1, 1, 1, 1, 1,
0.7347395, 0.4887215, 1.898731, 1, 1, 1, 1, 1,
0.7348579, -1.049942, 1.012741, 1, 1, 1, 1, 1,
0.7385474, 0.9686127, -0.1272832, 1, 1, 1, 1, 1,
0.7393485, -0.9446476, 4.049795, 1, 1, 1, 1, 1,
0.7472945, -1.096845, 3.543252, 1, 1, 1, 1, 1,
0.7494634, -1.046062, 0.3788861, 1, 1, 1, 1, 1,
0.7555187, 0.05689469, 0.9131109, 1, 1, 1, 1, 1,
0.7586809, -0.5400326, 2.066418, 1, 1, 1, 1, 1,
0.760372, -0.9657671, 2.922047, 1, 1, 1, 1, 1,
0.760893, 0.7096667, 0.6521527, 1, 1, 1, 1, 1,
0.7619652, 3.079214, 0.7007601, 1, 1, 1, 1, 1,
0.7692171, -1.404689, 4.928662, 1, 1, 1, 1, 1,
0.7751299, 0.882494, 0.1413669, 0, 0, 1, 1, 1,
0.7758144, -0.713698, 1.300996, 1, 0, 0, 1, 1,
0.7768548, -0.7566627, 1.610201, 1, 0, 0, 1, 1,
0.7788378, -1.145519, 2.622751, 1, 0, 0, 1, 1,
0.7795704, 0.01283029, 2.233219, 1, 0, 0, 1, 1,
0.7851174, 0.1472936, 1.97999, 1, 0, 0, 1, 1,
0.7912316, 0.6705934, 1.819011, 0, 0, 0, 1, 1,
0.7914794, 0.6718029, 1.285195, 0, 0, 0, 1, 1,
0.7950221, -0.2301762, 3.800343, 0, 0, 0, 1, 1,
0.7998875, -0.1642733, 0.3659671, 0, 0, 0, 1, 1,
0.8021178, -0.5976164, 3.715734, 0, 0, 0, 1, 1,
0.8048993, 0.3511377, 0.6010654, 0, 0, 0, 1, 1,
0.8166534, -0.4441869, 2.131152, 0, 0, 0, 1, 1,
0.8210815, -0.5863495, 2.476037, 1, 1, 1, 1, 1,
0.8343182, -0.4659043, 2.495937, 1, 1, 1, 1, 1,
0.836308, 0.9108399, 0.1789823, 1, 1, 1, 1, 1,
0.8413791, 0.2046919, 0.7165782, 1, 1, 1, 1, 1,
0.8515804, -0.06045312, 0.5621434, 1, 1, 1, 1, 1,
0.8528441, 0.5987999, 1.659798, 1, 1, 1, 1, 1,
0.8556482, 0.8212553, 1.492632, 1, 1, 1, 1, 1,
0.864924, 0.9342353, 1.190486, 1, 1, 1, 1, 1,
0.8699245, -0.008257712, 3.49449, 1, 1, 1, 1, 1,
0.8706847, 0.1051805, 0.6956425, 1, 1, 1, 1, 1,
0.8708903, -1.123302, 1.212924, 1, 1, 1, 1, 1,
0.8733811, 1.024202, 0.8931177, 1, 1, 1, 1, 1,
0.877471, -0.07630512, 0.6072367, 1, 1, 1, 1, 1,
0.8777449, 0.6370233, 1.836624, 1, 1, 1, 1, 1,
0.8809246, -0.3465309, 0.8235249, 1, 1, 1, 1, 1,
0.881883, -0.6961674, 0.8277416, 0, 0, 1, 1, 1,
0.8859497, 0.7332461, 0.9138197, 1, 0, 0, 1, 1,
0.8860236, 0.06514867, 0.7208872, 1, 0, 0, 1, 1,
0.8870641, 0.3564112, 1.746902, 1, 0, 0, 1, 1,
0.8916516, -0.2610236, 3.433975, 1, 0, 0, 1, 1,
0.8925275, 0.2553028, 1.248506, 1, 0, 0, 1, 1,
0.893694, -0.9618601, 2.031244, 0, 0, 0, 1, 1,
0.8988073, -1.114226, 2.24684, 0, 0, 0, 1, 1,
0.9000787, 0.3641893, 0.6614644, 0, 0, 0, 1, 1,
0.9038074, -0.4433074, 1.67131, 0, 0, 0, 1, 1,
0.9046316, 0.2634185, 3.039062, 0, 0, 0, 1, 1,
0.9074427, -0.9624586, 3.859488, 0, 0, 0, 1, 1,
0.9094511, -1.0916, 2.82916, 0, 0, 0, 1, 1,
0.9143885, 0.5674795, 1.121628, 1, 1, 1, 1, 1,
0.9149843, 0.2622102, 0.8586245, 1, 1, 1, 1, 1,
0.9159192, -0.2175525, 2.875467, 1, 1, 1, 1, 1,
0.9168317, 1.185933, -0.2328188, 1, 1, 1, 1, 1,
0.9171572, 1.193197, 1.475573, 1, 1, 1, 1, 1,
0.9193252, 0.7842669, -0.006542995, 1, 1, 1, 1, 1,
0.9229768, -0.6371176, 0.9183272, 1, 1, 1, 1, 1,
0.9231312, -0.6892188, 2.758393, 1, 1, 1, 1, 1,
0.9263974, 0.3818827, 1.901028, 1, 1, 1, 1, 1,
0.9265883, -0.2790083, 2.412461, 1, 1, 1, 1, 1,
0.9313474, -0.3499564, 2.337898, 1, 1, 1, 1, 1,
0.931699, -0.2226041, 2.027425, 1, 1, 1, 1, 1,
0.9350961, 0.7902821, 1.047086, 1, 1, 1, 1, 1,
0.9410584, -1.969074, 2.139104, 1, 1, 1, 1, 1,
0.9445533, 1.298009, -1.542515, 1, 1, 1, 1, 1,
0.9456208, 0.1968873, 1.431433, 0, 0, 1, 1, 1,
0.9465213, -0.4565639, 2.579866, 1, 0, 0, 1, 1,
0.9521174, 2.954417, -1.597101, 1, 0, 0, 1, 1,
0.9642223, 0.3052173, -0.2694114, 1, 0, 0, 1, 1,
0.9734923, -1.958346, 2.470223, 1, 0, 0, 1, 1,
0.9799364, -0.8329236, 3.278172, 1, 0, 0, 1, 1,
0.9801261, 1.154297, 0.2535537, 0, 0, 0, 1, 1,
0.9866952, 0.5172799, 3.354523, 0, 0, 0, 1, 1,
0.9921298, -0.4549297, 1.400147, 0, 0, 0, 1, 1,
0.9947495, 2.051507, 1.878175, 0, 0, 0, 1, 1,
0.9956886, -2.368473, 2.419073, 0, 0, 0, 1, 1,
0.9982848, 2.27872, 0.4012394, 0, 0, 0, 1, 1,
1.00158, -0.5422239, 1.918502, 0, 0, 0, 1, 1,
1.00533, 1.56343, -0.09413145, 1, 1, 1, 1, 1,
1.01208, 0.2594109, 1.806251, 1, 1, 1, 1, 1,
1.014485, 0.8777214, 0.8254997, 1, 1, 1, 1, 1,
1.021933, -1.491028, 3.279594, 1, 1, 1, 1, 1,
1.024416, 0.5587879, 0.2071214, 1, 1, 1, 1, 1,
1.02613, -1.556076, 3.517376, 1, 1, 1, 1, 1,
1.035184, -0.3419499, 1.950992, 1, 1, 1, 1, 1,
1.037032, 0.3438349, 0.714472, 1, 1, 1, 1, 1,
1.040311, -0.02531638, 3.095155, 1, 1, 1, 1, 1,
1.046412, 0.1042035, 1.348616, 1, 1, 1, 1, 1,
1.058109, 0.02328732, 1.450847, 1, 1, 1, 1, 1,
1.058602, 1.440843, 1.04795, 1, 1, 1, 1, 1,
1.063016, 0.3546049, 0.5749504, 1, 1, 1, 1, 1,
1.066591, -2.717282, 1.9663, 1, 1, 1, 1, 1,
1.073242, -0.0969528, 1.743432, 1, 1, 1, 1, 1,
1.077233, 0.8767813, -0.9408906, 0, 0, 1, 1, 1,
1.08375, -0.838595, 1.661326, 1, 0, 0, 1, 1,
1.091643, 0.2162901, 3.416233, 1, 0, 0, 1, 1,
1.102915, 0.1976273, 3.338071, 1, 0, 0, 1, 1,
1.103662, 0.2460928, 0.6210225, 1, 0, 0, 1, 1,
1.108261, -0.3234562, 1.995007, 1, 0, 0, 1, 1,
1.119758, 1.141381, -0.4168129, 0, 0, 0, 1, 1,
1.121263, 0.0009723268, 1.073911, 0, 0, 0, 1, 1,
1.122955, -0.735002, 2.183811, 0, 0, 0, 1, 1,
1.125726, 0.3191097, 1.615506, 0, 0, 0, 1, 1,
1.130124, -1.464063, 3.32312, 0, 0, 0, 1, 1,
1.148399, 0.1203762, -0.7806937, 0, 0, 0, 1, 1,
1.151533, -0.2903575, 0.6164616, 0, 0, 0, 1, 1,
1.157463, -0.09400291, 1.75516, 1, 1, 1, 1, 1,
1.16587, -0.2582156, 1.0174, 1, 1, 1, 1, 1,
1.171491, 0.2740015, 1.059273, 1, 1, 1, 1, 1,
1.180543, 0.5158175, 0.001550331, 1, 1, 1, 1, 1,
1.184038, -0.175373, 1.528768, 1, 1, 1, 1, 1,
1.187265, -0.0007297507, -0.08647326, 1, 1, 1, 1, 1,
1.196138, 0.1751373, 0.5850465, 1, 1, 1, 1, 1,
1.200299, -0.6418516, 2.004657, 1, 1, 1, 1, 1,
1.202801, -0.2630695, 2.323082, 1, 1, 1, 1, 1,
1.215626, -0.111085, 1.916349, 1, 1, 1, 1, 1,
1.221823, 1.027057, 0.0619584, 1, 1, 1, 1, 1,
1.226769, 1.623082, 0.4938056, 1, 1, 1, 1, 1,
1.227239, -0.4907483, 1.847551, 1, 1, 1, 1, 1,
1.242768, -0.02817603, 1.861291, 1, 1, 1, 1, 1,
1.256797, 1.958436, 0.7905543, 1, 1, 1, 1, 1,
1.257317, -0.7017663, 4.103128, 0, 0, 1, 1, 1,
1.260917, 0.8220141, 0.7960824, 1, 0, 0, 1, 1,
1.277831, -1.757154, 1.768136, 1, 0, 0, 1, 1,
1.278708, 0.06903265, 1.866702, 1, 0, 0, 1, 1,
1.282416, -0.4393217, 2.385412, 1, 0, 0, 1, 1,
1.289987, 0.02703776, 0.3419745, 1, 0, 0, 1, 1,
1.290343, 1.28051, 2.857441, 0, 0, 0, 1, 1,
1.292386, -1.41898, 2.030562, 0, 0, 0, 1, 1,
1.298914, -0.4116477, 1.718982, 0, 0, 0, 1, 1,
1.306462, -0.3224638, 3.234445, 0, 0, 0, 1, 1,
1.30694, -1.238017, 2.205279, 0, 0, 0, 1, 1,
1.327685, -0.0162098, 0.438858, 0, 0, 0, 1, 1,
1.337464, -0.2135132, 2.250747, 0, 0, 0, 1, 1,
1.338035, -0.4061962, 2.954176, 1, 1, 1, 1, 1,
1.341642, -0.3083038, 0.3766243, 1, 1, 1, 1, 1,
1.34391, -0.5884658, 1.30591, 1, 1, 1, 1, 1,
1.353391, -0.5021104, 2.771693, 1, 1, 1, 1, 1,
1.358016, 2.103931, 0.9338157, 1, 1, 1, 1, 1,
1.359838, -0.9540761, 2.605296, 1, 1, 1, 1, 1,
1.370047, 1.177181, 0.697665, 1, 1, 1, 1, 1,
1.3714, 1.805038, -0.2525435, 1, 1, 1, 1, 1,
1.374368, -0.3577136, 3.120036, 1, 1, 1, 1, 1,
1.375729, -0.379791, 2.483151, 1, 1, 1, 1, 1,
1.392483, -2.447641, 3.50399, 1, 1, 1, 1, 1,
1.419011, 0.4107589, 1.933863, 1, 1, 1, 1, 1,
1.420221, -0.6094638, 1.042826, 1, 1, 1, 1, 1,
1.421627, 1.463505, 1.427857, 1, 1, 1, 1, 1,
1.421724, 0.1806315, 1.747081, 1, 1, 1, 1, 1,
1.424525, 0.572889, 2.01125, 0, 0, 1, 1, 1,
1.437601, -0.2996057, 1.01064, 1, 0, 0, 1, 1,
1.440049, -0.4198512, 1.162034, 1, 0, 0, 1, 1,
1.457051, 0.2473994, 1.377508, 1, 0, 0, 1, 1,
1.462081, -0.3456002, 1.730035, 1, 0, 0, 1, 1,
1.472886, -0.4395045, 1.851717, 1, 0, 0, 1, 1,
1.485762, 0.4094017, 1.723155, 0, 0, 0, 1, 1,
1.489884, 1.407569, 1.563906, 0, 0, 0, 1, 1,
1.506044, -0.4820195, 1.831492, 0, 0, 0, 1, 1,
1.510147, -1.785989, 2.832421, 0, 0, 0, 1, 1,
1.511803, 0.2428506, 2.332975, 0, 0, 0, 1, 1,
1.524365, 0.5055258, 2.264005, 0, 0, 0, 1, 1,
1.527255, -0.2830389, 3.191633, 0, 0, 0, 1, 1,
1.545859, -0.3414763, 1.599941, 1, 1, 1, 1, 1,
1.554715, -0.1181634, -0.2132507, 1, 1, 1, 1, 1,
1.559957, -0.000536675, 1.456023, 1, 1, 1, 1, 1,
1.571509, -1.331038, 1.507008, 1, 1, 1, 1, 1,
1.575759, 0.5973857, 1.025238, 1, 1, 1, 1, 1,
1.582755, 0.4575257, 1.600467, 1, 1, 1, 1, 1,
1.605053, 0.9872799, 1.208953, 1, 1, 1, 1, 1,
1.611885, 1.217396, 0.8970174, 1, 1, 1, 1, 1,
1.613627, -0.9064047, 3.643629, 1, 1, 1, 1, 1,
1.616332, -0.473916, -0.9734345, 1, 1, 1, 1, 1,
1.625192, 0.9529832, 0.2452594, 1, 1, 1, 1, 1,
1.630775, 0.9793667, 0.4442984, 1, 1, 1, 1, 1,
1.632567, 1.409217, 0.7617795, 1, 1, 1, 1, 1,
1.652206, -0.03183181, 1.184035, 1, 1, 1, 1, 1,
1.652573, -0.00536495, 2.271307, 1, 1, 1, 1, 1,
1.657263, -0.05730998, 2.134706, 0, 0, 1, 1, 1,
1.672257, 0.04725896, 2.000764, 1, 0, 0, 1, 1,
1.678256, 1.046005, 1.918973, 1, 0, 0, 1, 1,
1.708008, -0.0971689, 0.689847, 1, 0, 0, 1, 1,
1.716299, -1.109043, 1.23577, 1, 0, 0, 1, 1,
1.717232, -0.7088673, 1.884812, 1, 0, 0, 1, 1,
1.720314, -1.035061, 2.184249, 0, 0, 0, 1, 1,
1.746504, 0.1743443, 2.178993, 0, 0, 0, 1, 1,
1.76479, -1.160366, 2.230747, 0, 0, 0, 1, 1,
1.769628, 0.36773, 0.2867011, 0, 0, 0, 1, 1,
1.772219, -0.3688921, 0.6751004, 0, 0, 0, 1, 1,
1.778113, -0.4332043, 2.455201, 0, 0, 0, 1, 1,
1.783449, -0.3546648, 0.6667799, 0, 0, 0, 1, 1,
1.798448, -0.001615011, 1.785514, 1, 1, 1, 1, 1,
1.804493, 1.197022, 2.630435, 1, 1, 1, 1, 1,
1.810557, 0.3444005, 2.353765, 1, 1, 1, 1, 1,
1.816128, -0.6792368, 1.426691, 1, 1, 1, 1, 1,
1.834793, 0.6825901, -0.3549697, 1, 1, 1, 1, 1,
1.835313, 0.601598, 2.361365, 1, 1, 1, 1, 1,
1.854438, 0.04838017, 2.132818, 1, 1, 1, 1, 1,
1.857713, 1.233775, -0.4289201, 1, 1, 1, 1, 1,
1.86573, -0.6717809, 1.507876, 1, 1, 1, 1, 1,
1.872375, -1.456854, 2.350843, 1, 1, 1, 1, 1,
1.877179, 0.2751177, 1.360289, 1, 1, 1, 1, 1,
1.888732, 1.303487, 0.6056269, 1, 1, 1, 1, 1,
1.901655, 0.02291752, 0.3275755, 1, 1, 1, 1, 1,
1.906642, -0.1862335, 1.575968, 1, 1, 1, 1, 1,
1.91498, -0.6432451, 2.324652, 1, 1, 1, 1, 1,
1.931942, 1.259145, -1.463888, 0, 0, 1, 1, 1,
1.965243, 0.7893274, 0.1930552, 1, 0, 0, 1, 1,
1.999267, 1.531044, 1.915903, 1, 0, 0, 1, 1,
2.008397, -0.3920735, 1.941778, 1, 0, 0, 1, 1,
2.04088, -0.6764052, 2.696081, 1, 0, 0, 1, 1,
2.089922, -0.5869426, 0.2437919, 1, 0, 0, 1, 1,
2.129571, 0.5829203, 1.45843, 0, 0, 0, 1, 1,
2.150973, 1.257389, 2.107538, 0, 0, 0, 1, 1,
2.182419, 0.6341403, 0.3999785, 0, 0, 0, 1, 1,
2.226221, -0.3034264, 0.6790698, 0, 0, 0, 1, 1,
2.227856, 0.3009275, 1.905112, 0, 0, 0, 1, 1,
2.270387, -0.3369916, 2.926957, 0, 0, 0, 1, 1,
2.311004, 0.2364383, 1.896363, 0, 0, 0, 1, 1,
2.399412, 1.308518, 0.6842197, 1, 1, 1, 1, 1,
2.582014, 1.873618, 1.213083, 1, 1, 1, 1, 1,
2.733237, -0.6284937, 3.630461, 1, 1, 1, 1, 1,
3.009431, 0.578385, 0.5937173, 1, 1, 1, 1, 1,
3.015372, -1.031109, 2.190295, 1, 1, 1, 1, 1,
3.079476, -1.375701, 1.635024, 1, 1, 1, 1, 1,
3.318334, -0.5196137, 1.708915, 1, 1, 1, 1, 1
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
var radius = 9.460603;
var distance = 33.22997;
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
mvMatrix.translate( -0.1643541, -0.1664464, 0.09795022 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22997);
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
