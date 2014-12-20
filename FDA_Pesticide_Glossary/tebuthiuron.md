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
-2.884081, -0.5833833, -3.020135, 1, 0, 0, 1,
-2.882196, 0.4315286, -1.489769, 1, 0.007843138, 0, 1,
-2.831973, -1.1806, -3.580815, 1, 0.01176471, 0, 1,
-2.663184, 0.7441594, -0.2777251, 1, 0.01960784, 0, 1,
-2.603834, -1.816666, -1.269025, 1, 0.02352941, 0, 1,
-2.514746, -0.2327179, -0.8302039, 1, 0.03137255, 0, 1,
-2.501811, -0.2485408, -1.096881, 1, 0.03529412, 0, 1,
-2.314384, 1.330687, -1.249864, 1, 0.04313726, 0, 1,
-2.313554, -1.115483, -1.869292, 1, 0.04705882, 0, 1,
-2.300683, 0.2314042, -3.003429, 1, 0.05490196, 0, 1,
-2.297503, -0.5274121, -2.767023, 1, 0.05882353, 0, 1,
-2.295976, -0.3725572, -1.028845, 1, 0.06666667, 0, 1,
-2.224982, 1.29664, -1.724637, 1, 0.07058824, 0, 1,
-2.190564, 1.044943, -0.8592618, 1, 0.07843138, 0, 1,
-2.179351, 1.455108, 0.2484882, 1, 0.08235294, 0, 1,
-2.157548, -0.4777619, -1.258714, 1, 0.09019608, 0, 1,
-2.122715, -0.3375373, -1.341086, 1, 0.09411765, 0, 1,
-2.120885, -0.8499646, -1.566693, 1, 0.1019608, 0, 1,
-2.084765, -1.238198, -2.538306, 1, 0.1098039, 0, 1,
-2.053868, 0.743292, -2.302696, 1, 0.1137255, 0, 1,
-2.046537, 1.046054, -1.624013, 1, 0.1215686, 0, 1,
-2.045417, 0.6223486, -2.274352, 1, 0.1254902, 0, 1,
-2.032092, 1.477705, -0.6637186, 1, 0.1333333, 0, 1,
-2.024922, 1.491956, 1.158638, 1, 0.1372549, 0, 1,
-2.014484, -0.9999076, -2.042714, 1, 0.145098, 0, 1,
-2.014431, 1.235195, -1.285788, 1, 0.1490196, 0, 1,
-1.995888, -1.409585, -2.525305, 1, 0.1568628, 0, 1,
-1.973405, 1.25621, -1.098748, 1, 0.1607843, 0, 1,
-1.96981, 1.252854, -1.600534, 1, 0.1686275, 0, 1,
-1.953949, -0.2816455, -1.047807, 1, 0.172549, 0, 1,
-1.905919, 0.6152142, -1.208779, 1, 0.1803922, 0, 1,
-1.864052, -2.070363, -3.871966, 1, 0.1843137, 0, 1,
-1.857954, 1.507041, -1.175523, 1, 0.1921569, 0, 1,
-1.84978, -0.4119106, -2.125393, 1, 0.1960784, 0, 1,
-1.833586, -1.945124, -2.501951, 1, 0.2039216, 0, 1,
-1.81487, -0.2328804, -2.678574, 1, 0.2117647, 0, 1,
-1.812138, -0.566679, -3.348603, 1, 0.2156863, 0, 1,
-1.811761, -0.4795713, -3.224592, 1, 0.2235294, 0, 1,
-1.777553, 0.3343885, -0.2641124, 1, 0.227451, 0, 1,
-1.772228, 0.9427595, -0.231931, 1, 0.2352941, 0, 1,
-1.77008, 0.1845755, -0.004922006, 1, 0.2392157, 0, 1,
-1.765803, 0.7957, -2.044945, 1, 0.2470588, 0, 1,
-1.756586, -0.2092929, -1.882669, 1, 0.2509804, 0, 1,
-1.749023, 0.6057721, -2.7394, 1, 0.2588235, 0, 1,
-1.745603, -1.039103, -1.31771, 1, 0.2627451, 0, 1,
-1.738911, 0.8772794, -0.9275941, 1, 0.2705882, 0, 1,
-1.703609, -1.062, -2.89874, 1, 0.2745098, 0, 1,
-1.694116, 0.1948208, -1.105374, 1, 0.282353, 0, 1,
-1.68654, 0.4340658, -3.21277, 1, 0.2862745, 0, 1,
-1.678784, 0.6355203, -1.290885, 1, 0.2941177, 0, 1,
-1.670596, 0.4983024, -1.517677, 1, 0.3019608, 0, 1,
-1.661017, -0.6230487, -1.05563, 1, 0.3058824, 0, 1,
-1.657764, 0.6708698, -1.047036, 1, 0.3137255, 0, 1,
-1.657626, 0.3381713, -1.91664, 1, 0.3176471, 0, 1,
-1.65016, 2.121653, -1.520696, 1, 0.3254902, 0, 1,
-1.621256, -1.107517, -2.359909, 1, 0.3294118, 0, 1,
-1.61951, -0.4043559, -1.086496, 1, 0.3372549, 0, 1,
-1.61924, -0.2904896, -1.973396, 1, 0.3411765, 0, 1,
-1.615979, 0.5217637, 0.08586261, 1, 0.3490196, 0, 1,
-1.612111, -0.5641245, -1.342117, 1, 0.3529412, 0, 1,
-1.60618, 0.1590571, -2.015959, 1, 0.3607843, 0, 1,
-1.60521, -0.2655202, -1.603868, 1, 0.3647059, 0, 1,
-1.604853, 0.6072433, -1.891743, 1, 0.372549, 0, 1,
-1.601722, -0.3682605, -1.244052, 1, 0.3764706, 0, 1,
-1.593774, -0.5077662, -2.506557, 1, 0.3843137, 0, 1,
-1.589234, -0.1633056, -1.163159, 1, 0.3882353, 0, 1,
-1.569163, -1.155519, -2.355063, 1, 0.3960784, 0, 1,
-1.56812, 1.679436, -1.408094, 1, 0.4039216, 0, 1,
-1.567053, -0.8050707, -1.237086, 1, 0.4078431, 0, 1,
-1.547421, -0.5610483, -1.265792, 1, 0.4156863, 0, 1,
-1.545191, -0.2948688, -1.59095, 1, 0.4196078, 0, 1,
-1.537453, 1.034568, -1.015227, 1, 0.427451, 0, 1,
-1.532385, 0.7580405, -0.3562333, 1, 0.4313726, 0, 1,
-1.524299, 0.03222003, -2.005534, 1, 0.4392157, 0, 1,
-1.519569, -1.653389, -2.193608, 1, 0.4431373, 0, 1,
-1.519449, 1.139904, 1.536789, 1, 0.4509804, 0, 1,
-1.499243, 0.2020849, -2.281806, 1, 0.454902, 0, 1,
-1.495972, 0.8262424, 0.930533, 1, 0.4627451, 0, 1,
-1.489103, -0.7566568, -3.152663, 1, 0.4666667, 0, 1,
-1.468877, 0.4281845, -1.878171, 1, 0.4745098, 0, 1,
-1.462787, -0.614132, -3.708797, 1, 0.4784314, 0, 1,
-1.454126, 0.01281505, -1.576709, 1, 0.4862745, 0, 1,
-1.453367, -0.6700195, -2.412607, 1, 0.4901961, 0, 1,
-1.451525, -0.624521, -2.118453, 1, 0.4980392, 0, 1,
-1.444266, 0.005909709, -1.610226, 1, 0.5058824, 0, 1,
-1.430634, -0.9460315, -3.86583, 1, 0.509804, 0, 1,
-1.426345, 0.467065, -1.919116, 1, 0.5176471, 0, 1,
-1.42545, 0.3126082, -0.7399833, 1, 0.5215687, 0, 1,
-1.419908, -0.4068904, -1.428555, 1, 0.5294118, 0, 1,
-1.414595, -0.2670184, -2.424384, 1, 0.5333334, 0, 1,
-1.411597, -0.1168589, 0.05526676, 1, 0.5411765, 0, 1,
-1.383453, -1.236608, -2.822147, 1, 0.5450981, 0, 1,
-1.381704, -0.5125394, -2.353027, 1, 0.5529412, 0, 1,
-1.366937, 1.134772, -0.06028887, 1, 0.5568628, 0, 1,
-1.363741, -0.5091221, -2.110776, 1, 0.5647059, 0, 1,
-1.356857, 1.622597, 0.03588197, 1, 0.5686275, 0, 1,
-1.355291, 0.2032171, 0.3420746, 1, 0.5764706, 0, 1,
-1.343676, 0.5921427, 0.9832005, 1, 0.5803922, 0, 1,
-1.334019, 0.8561379, -1.966438, 1, 0.5882353, 0, 1,
-1.333785, -0.1288367, -0.8382469, 1, 0.5921569, 0, 1,
-1.333413, -0.6246017, -2.537007, 1, 0.6, 0, 1,
-1.329683, -2.058675, -2.380761, 1, 0.6078432, 0, 1,
-1.32749, 0.2520272, -2.094989, 1, 0.6117647, 0, 1,
-1.326271, 0.5692463, -0.5017887, 1, 0.6196079, 0, 1,
-1.325564, -1.888158, -1.847177, 1, 0.6235294, 0, 1,
-1.324614, 2.937909, -1.516994, 1, 0.6313726, 0, 1,
-1.322557, -0.3003376, -1.260072, 1, 0.6352941, 0, 1,
-1.315199, -1.071512, -0.6794497, 1, 0.6431373, 0, 1,
-1.315117, 0.4738062, -1.082507, 1, 0.6470588, 0, 1,
-1.312374, 1.386258, -0.6437617, 1, 0.654902, 0, 1,
-1.308782, -1.274845, -1.543407, 1, 0.6588235, 0, 1,
-1.303663, -0.1455891, -1.707596, 1, 0.6666667, 0, 1,
-1.289592, 0.6215214, -2.327729, 1, 0.6705883, 0, 1,
-1.285253, 0.426219, -0.955832, 1, 0.6784314, 0, 1,
-1.28216, -0.563497, -1.175113, 1, 0.682353, 0, 1,
-1.278975, 0.5771118, -0.5740958, 1, 0.6901961, 0, 1,
-1.273866, 0.4387608, 0.4195516, 1, 0.6941177, 0, 1,
-1.267492, -0.9510972, -1.448381, 1, 0.7019608, 0, 1,
-1.26636, -0.03828426, -1.138845, 1, 0.7098039, 0, 1,
-1.265098, -0.08804137, -1.932564, 1, 0.7137255, 0, 1,
-1.263925, -0.6453384, -1.139294, 1, 0.7215686, 0, 1,
-1.259618, 0.2259388, -1.019493, 1, 0.7254902, 0, 1,
-1.25857, 0.7269895, -1.416224, 1, 0.7333333, 0, 1,
-1.255594, -1.225312, -5.00949, 1, 0.7372549, 0, 1,
-1.232632, -0.0485002, -2.014012, 1, 0.7450981, 0, 1,
-1.21257, 1.322091, -0.2529417, 1, 0.7490196, 0, 1,
-1.204258, 0.9882425, 0.3349003, 1, 0.7568628, 0, 1,
-1.203353, -0.5691386, -2.7068, 1, 0.7607843, 0, 1,
-1.198607, 2.632698, -0.4336784, 1, 0.7686275, 0, 1,
-1.185462, -0.3827591, -2.893194, 1, 0.772549, 0, 1,
-1.179893, 0.03696967, -0.8257688, 1, 0.7803922, 0, 1,
-1.176559, -1.005895, -1.711321, 1, 0.7843137, 0, 1,
-1.174136, 0.174409, -1.061454, 1, 0.7921569, 0, 1,
-1.167444, -0.5289024, 0.3658135, 1, 0.7960784, 0, 1,
-1.165179, 0.05647301, -2.144657, 1, 0.8039216, 0, 1,
-1.159901, 1.104305, -0.9341618, 1, 0.8117647, 0, 1,
-1.152767, 0.6659062, -0.4001761, 1, 0.8156863, 0, 1,
-1.14965, -1.338415, -4.319609, 1, 0.8235294, 0, 1,
-1.145016, 0.1019812, -1.066555, 1, 0.827451, 0, 1,
-1.143502, 0.7003189, 0.6120881, 1, 0.8352941, 0, 1,
-1.139752, -0.2081088, -0.7430866, 1, 0.8392157, 0, 1,
-1.129535, -0.8595855, -2.76347, 1, 0.8470588, 0, 1,
-1.126931, -1.464865, -2.519367, 1, 0.8509804, 0, 1,
-1.12668, 1.064269, -2.420087, 1, 0.8588235, 0, 1,
-1.118269, 1.417301, -0.2643549, 1, 0.8627451, 0, 1,
-1.114494, -0.005114049, 0.3081709, 1, 0.8705882, 0, 1,
-1.113862, 0.1174106, 0.1246495, 1, 0.8745098, 0, 1,
-1.113623, -0.1318793, -3.608572, 1, 0.8823529, 0, 1,
-1.094054, -0.3337573, -2.697356, 1, 0.8862745, 0, 1,
-1.090935, 0.5513743, -2.204379, 1, 0.8941177, 0, 1,
-1.088739, -0.2359702, -1.805237, 1, 0.8980392, 0, 1,
-1.08517, -0.5888894, -3.268359, 1, 0.9058824, 0, 1,
-1.076069, -0.6637868, -2.560932, 1, 0.9137255, 0, 1,
-1.075206, 1.050255, -0.05306717, 1, 0.9176471, 0, 1,
-1.073394, -0.8260036, -3.134934, 1, 0.9254902, 0, 1,
-1.066345, -0.3725089, -2.420911, 1, 0.9294118, 0, 1,
-1.064454, 0.2705242, -2.590955, 1, 0.9372549, 0, 1,
-1.05716, 1.047667, -2.254252, 1, 0.9411765, 0, 1,
-1.056396, 0.4965218, -0.3796424, 1, 0.9490196, 0, 1,
-1.05418, 1.340884, -0.4493974, 1, 0.9529412, 0, 1,
-1.050711, 0.9864755, 0.6933136, 1, 0.9607843, 0, 1,
-1.037722, 0.3650867, -1.43222, 1, 0.9647059, 0, 1,
-1.035044, -0.6576325, -2.48115, 1, 0.972549, 0, 1,
-1.030904, 0.2584149, -1.271835, 1, 0.9764706, 0, 1,
-1.027314, -1.194073, -1.129017, 1, 0.9843137, 0, 1,
-1.02684, -0.03567133, -1.081544, 1, 0.9882353, 0, 1,
-1.024432, 0.6249763, -0.4635474, 1, 0.9960784, 0, 1,
-1.021838, -0.3548511, -3.683703, 0.9960784, 1, 0, 1,
-1.006144, 0.05181179, -0.9639578, 0.9921569, 1, 0, 1,
-1.005274, -0.4562875, -0.9391363, 0.9843137, 1, 0, 1,
-0.9909105, -0.950704, -3.170471, 0.9803922, 1, 0, 1,
-0.9815429, -0.5064252, -1.69393, 0.972549, 1, 0, 1,
-0.9800115, -2.108105, -2.897266, 0.9686275, 1, 0, 1,
-0.9671858, 0.04578293, -0.6730152, 0.9607843, 1, 0, 1,
-0.9639817, 1.917946, -0.5603805, 0.9568627, 1, 0, 1,
-0.9554054, 0.4716769, -2.793457, 0.9490196, 1, 0, 1,
-0.9505913, -1.311182, -2.557539, 0.945098, 1, 0, 1,
-0.9497154, 0.8948264, -1.608521, 0.9372549, 1, 0, 1,
-0.9490587, 0.7088062, -0.396935, 0.9333333, 1, 0, 1,
-0.9417694, 1.659017, 0.2959264, 0.9254902, 1, 0, 1,
-0.9408631, 0.6900163, -2.667553, 0.9215686, 1, 0, 1,
-0.9403276, -0.4695606, -2.274371, 0.9137255, 1, 0, 1,
-0.9350075, 0.4449683, -2.586565, 0.9098039, 1, 0, 1,
-0.9339717, 0.1966053, -2.399806, 0.9019608, 1, 0, 1,
-0.9287874, -0.2235716, -0.6396766, 0.8941177, 1, 0, 1,
-0.9256803, -1.973053, -1.052197, 0.8901961, 1, 0, 1,
-0.9244587, 0.03320385, -1.731037, 0.8823529, 1, 0, 1,
-0.9238145, -0.8722375, -1.885557, 0.8784314, 1, 0, 1,
-0.9237567, 0.8649851, -0.06786548, 0.8705882, 1, 0, 1,
-0.9212867, 0.03582674, 0.04553542, 0.8666667, 1, 0, 1,
-0.9165027, -0.3029763, -3.005424, 0.8588235, 1, 0, 1,
-0.9146252, 0.07243127, -2.594248, 0.854902, 1, 0, 1,
-0.9081601, -0.6292408, -4.106782, 0.8470588, 1, 0, 1,
-0.9060681, -0.7802235, -2.267183, 0.8431373, 1, 0, 1,
-0.9006978, -0.1283863, -0.8802624, 0.8352941, 1, 0, 1,
-0.8986287, -0.4565099, -3.159351, 0.8313726, 1, 0, 1,
-0.898615, -0.2120856, 0.2914459, 0.8235294, 1, 0, 1,
-0.8966298, -0.1878044, -2.112633, 0.8196079, 1, 0, 1,
-0.8916309, -1.135965, -2.136679, 0.8117647, 1, 0, 1,
-0.8797497, 0.5402879, -1.947167, 0.8078431, 1, 0, 1,
-0.8786378, 1.657896, 0.8771394, 0.8, 1, 0, 1,
-0.8657762, 0.2877292, -0.5475109, 0.7921569, 1, 0, 1,
-0.8652536, 0.6944707, -0.1882143, 0.7882353, 1, 0, 1,
-0.8642752, 0.8180836, -0.6551533, 0.7803922, 1, 0, 1,
-0.8585441, 0.2310837, -0.9177713, 0.7764706, 1, 0, 1,
-0.8491164, -0.08935374, -2.15626, 0.7686275, 1, 0, 1,
-0.8473186, -1.511657, -2.194082, 0.7647059, 1, 0, 1,
-0.8468165, 0.6211113, -0.7918345, 0.7568628, 1, 0, 1,
-0.8454648, 0.7320931, -0.893614, 0.7529412, 1, 0, 1,
-0.8332113, 0.8560913, 0.406867, 0.7450981, 1, 0, 1,
-0.8318692, 0.1834236, -2.172267, 0.7411765, 1, 0, 1,
-0.8259271, 0.2418517, -2.304145, 0.7333333, 1, 0, 1,
-0.8257693, 1.026303, -0.1659187, 0.7294118, 1, 0, 1,
-0.8213938, -1.620126, -2.732233, 0.7215686, 1, 0, 1,
-0.8190511, 1.098233, -1.307736, 0.7176471, 1, 0, 1,
-0.8155131, -0.261081, -2.0864, 0.7098039, 1, 0, 1,
-0.8111088, 0.584797, -1.159322, 0.7058824, 1, 0, 1,
-0.8070132, 1.355228, -0.5680827, 0.6980392, 1, 0, 1,
-0.8019549, -0.7636893, -1.26748, 0.6901961, 1, 0, 1,
-0.7999549, 0.2341685, -1.471765, 0.6862745, 1, 0, 1,
-0.7976895, -1.049263, -1.4884, 0.6784314, 1, 0, 1,
-0.7965683, -0.3031906, -2.699678, 0.6745098, 1, 0, 1,
-0.7930959, -0.9789132, -2.926123, 0.6666667, 1, 0, 1,
-0.7905301, -1.760854, -4.612544, 0.6627451, 1, 0, 1,
-0.7889494, -0.2316376, -1.97405, 0.654902, 1, 0, 1,
-0.7869465, 0.2990263, -0.0471402, 0.6509804, 1, 0, 1,
-0.7856291, -1.543529, -3.177572, 0.6431373, 1, 0, 1,
-0.7834564, -0.5605336, -1.999796, 0.6392157, 1, 0, 1,
-0.782046, 1.595858, -0.2775534, 0.6313726, 1, 0, 1,
-0.7783849, 1.737822, -1.133043, 0.627451, 1, 0, 1,
-0.7748734, -0.3251712, -0.3775292, 0.6196079, 1, 0, 1,
-0.7735828, 1.057248, -0.2381545, 0.6156863, 1, 0, 1,
-0.7732601, -0.02589864, -2.291693, 0.6078432, 1, 0, 1,
-0.7731304, 0.1678412, -0.9692199, 0.6039216, 1, 0, 1,
-0.7652407, -1.048251, 0.4841643, 0.5960785, 1, 0, 1,
-0.7614099, -0.3867293, -3.431472, 0.5882353, 1, 0, 1,
-0.7569654, -1.904547, -3.388622, 0.5843138, 1, 0, 1,
-0.7562598, -0.3682105, -2.703751, 0.5764706, 1, 0, 1,
-0.7552918, -0.7816532, -2.136847, 0.572549, 1, 0, 1,
-0.7535277, 0.1381984, -2.44257, 0.5647059, 1, 0, 1,
-0.7517301, -0.2319233, -0.5407097, 0.5607843, 1, 0, 1,
-0.7511277, -0.6966422, -1.775858, 0.5529412, 1, 0, 1,
-0.7507826, 0.3891781, -1.802215, 0.5490196, 1, 0, 1,
-0.738947, -0.2854343, -3.286708, 0.5411765, 1, 0, 1,
-0.7340726, -0.9607223, -2.107394, 0.5372549, 1, 0, 1,
-0.7340236, 0.4147735, -1.784848, 0.5294118, 1, 0, 1,
-0.7296671, -0.2182597, -2.709314, 0.5254902, 1, 0, 1,
-0.7278014, -0.9073145, -1.830067, 0.5176471, 1, 0, 1,
-0.7270191, -1.03694, -2.491576, 0.5137255, 1, 0, 1,
-0.7238905, 0.234113, -2.772096, 0.5058824, 1, 0, 1,
-0.7218394, 1.640477, -0.6929852, 0.5019608, 1, 0, 1,
-0.7160782, 0.3424774, -0.692494, 0.4941176, 1, 0, 1,
-0.7145581, -0.5353646, -1.778074, 0.4862745, 1, 0, 1,
-0.7124199, -1.348671, -2.547299, 0.4823529, 1, 0, 1,
-0.7117034, 0.2095752, -1.174402, 0.4745098, 1, 0, 1,
-0.7116278, -0.6313415, -3.581182, 0.4705882, 1, 0, 1,
-0.711614, 2.171259, -2.390714, 0.4627451, 1, 0, 1,
-0.7096806, -1.823125, -1.942408, 0.4588235, 1, 0, 1,
-0.7024745, 1.144839, 0.2057045, 0.4509804, 1, 0, 1,
-0.7003123, 0.9569818, -1.965762, 0.4470588, 1, 0, 1,
-0.6965141, -0.5207528, -2.496606, 0.4392157, 1, 0, 1,
-0.693238, 0.3336388, -1.321617, 0.4352941, 1, 0, 1,
-0.6926001, -0.2471404, 0.3013779, 0.427451, 1, 0, 1,
-0.6865305, -0.03513878, 1.537627, 0.4235294, 1, 0, 1,
-0.6793231, 1.515012, -0.8455271, 0.4156863, 1, 0, 1,
-0.6766087, -1.306951, -1.48647, 0.4117647, 1, 0, 1,
-0.6725222, 1.302114, 2.559234, 0.4039216, 1, 0, 1,
-0.6716286, 0.1952686, -2.249969, 0.3960784, 1, 0, 1,
-0.6683009, -0.5259185, -0.7280736, 0.3921569, 1, 0, 1,
-0.6586026, -1.1233, -2.035588, 0.3843137, 1, 0, 1,
-0.6557482, -1.491142, -2.337143, 0.3803922, 1, 0, 1,
-0.6529468, 0.4859009, -1.160937, 0.372549, 1, 0, 1,
-0.6518199, 0.5578697, -0.7754691, 0.3686275, 1, 0, 1,
-0.6512673, 0.9648043, -1.175545, 0.3607843, 1, 0, 1,
-0.6495076, -1.236796, -2.729519, 0.3568628, 1, 0, 1,
-0.6457834, -0.7097681, -2.192679, 0.3490196, 1, 0, 1,
-0.6455451, 0.152835, 0.4277706, 0.345098, 1, 0, 1,
-0.644127, -0.5545115, -2.580908, 0.3372549, 1, 0, 1,
-0.643698, -1.260271, -2.084703, 0.3333333, 1, 0, 1,
-0.6402298, 0.4930691, -2.511369, 0.3254902, 1, 0, 1,
-0.6402131, -0.8885517, -1.522318, 0.3215686, 1, 0, 1,
-0.638795, 0.4867616, -0.9313035, 0.3137255, 1, 0, 1,
-0.6336293, -1.824943, -3.585828, 0.3098039, 1, 0, 1,
-0.6324881, 0.9503978, 0.5959448, 0.3019608, 1, 0, 1,
-0.6322535, 1.664693, -0.7166335, 0.2941177, 1, 0, 1,
-0.6308471, 0.07990798, -0.7980309, 0.2901961, 1, 0, 1,
-0.6293114, -0.4140056, -3.242562, 0.282353, 1, 0, 1,
-0.6291473, -1.978512, -3.524151, 0.2784314, 1, 0, 1,
-0.6260564, 0.7269417, 1.911397, 0.2705882, 1, 0, 1,
-0.6138343, 0.3391623, -1.223176, 0.2666667, 1, 0, 1,
-0.6088249, 0.676953, 0.9240137, 0.2588235, 1, 0, 1,
-0.6088026, -1.776832, -3.922933, 0.254902, 1, 0, 1,
-0.6074847, -0.1537049, -1.0999, 0.2470588, 1, 0, 1,
-0.6001116, 0.1909164, -0.7829819, 0.2431373, 1, 0, 1,
-0.5980808, -1.116611, -3.188259, 0.2352941, 1, 0, 1,
-0.5918412, 0.2418842, -2.124988, 0.2313726, 1, 0, 1,
-0.5883971, 1.318527, -0.3139084, 0.2235294, 1, 0, 1,
-0.5880015, -0.2969302, -2.893122, 0.2196078, 1, 0, 1,
-0.5876446, -2.206132, -3.096603, 0.2117647, 1, 0, 1,
-0.5845537, -0.421494, -1.84919, 0.2078431, 1, 0, 1,
-0.5809662, 0.3262257, -2.44297, 0.2, 1, 0, 1,
-0.5807998, -1.54221, -3.920694, 0.1921569, 1, 0, 1,
-0.5696924, 0.3892847, -2.834388, 0.1882353, 1, 0, 1,
-0.5696557, 0.8394185, -0.7328546, 0.1803922, 1, 0, 1,
-0.5669047, 0.1310098, -2.696783, 0.1764706, 1, 0, 1,
-0.5633662, 0.05297104, -1.285234, 0.1686275, 1, 0, 1,
-0.559783, -0.7636104, -1.180368, 0.1647059, 1, 0, 1,
-0.5583697, 0.276829, -2.130376, 0.1568628, 1, 0, 1,
-0.5581359, 0.2529073, -0.5806221, 0.1529412, 1, 0, 1,
-0.5568081, 0.8842615, -1.178279, 0.145098, 1, 0, 1,
-0.5566725, 0.9859408, -0.7441434, 0.1411765, 1, 0, 1,
-0.5528077, 0.7638527, -0.7948297, 0.1333333, 1, 0, 1,
-0.5500898, 0.3649599, -0.8503953, 0.1294118, 1, 0, 1,
-0.5466225, -1.273881, -1.106974, 0.1215686, 1, 0, 1,
-0.5460905, 0.3716963, -1.884105, 0.1176471, 1, 0, 1,
-0.5458787, -0.9738002, -1.616585, 0.1098039, 1, 0, 1,
-0.5449271, -0.05749158, -1.02509, 0.1058824, 1, 0, 1,
-0.544308, -1.035526, -4.568738, 0.09803922, 1, 0, 1,
-0.5433767, -1.811116, -2.904199, 0.09019608, 1, 0, 1,
-0.5408316, -1.270988, -1.538107, 0.08627451, 1, 0, 1,
-0.5387203, -1.506847, -2.654362, 0.07843138, 1, 0, 1,
-0.5386574, -0.5195274, -2.204086, 0.07450981, 1, 0, 1,
-0.5341129, -0.6408252, -2.479796, 0.06666667, 1, 0, 1,
-0.5331475, -1.444009, -3.35145, 0.0627451, 1, 0, 1,
-0.5317525, 0.4169354, -1.481998, 0.05490196, 1, 0, 1,
-0.5311759, 0.758015, -0.2025816, 0.05098039, 1, 0, 1,
-0.528618, -0.324198, -1.613456, 0.04313726, 1, 0, 1,
-0.5267818, -0.3673781, -2.146332, 0.03921569, 1, 0, 1,
-0.5168237, -1.016933, -4.281254, 0.03137255, 1, 0, 1,
-0.5121676, -1.319745, -2.121428, 0.02745098, 1, 0, 1,
-0.5082034, -0.1858593, -1.341811, 0.01960784, 1, 0, 1,
-0.5031591, -1.594721, -3.63287, 0.01568628, 1, 0, 1,
-0.4995973, 0.5433431, -1.342924, 0.007843138, 1, 0, 1,
-0.4962965, 0.731308, -0.3369761, 0.003921569, 1, 0, 1,
-0.4956064, 0.3286911, 0.2016929, 0, 1, 0.003921569, 1,
-0.4929448, 0.9388426, 0.3419082, 0, 1, 0.01176471, 1,
-0.491989, 1.302672, 1.278521, 0, 1, 0.01568628, 1,
-0.4897777, -0.7928012, -1.963922, 0, 1, 0.02352941, 1,
-0.4873222, 0.5134374, -1.344567, 0, 1, 0.02745098, 1,
-0.484076, -0.4406858, -3.677294, 0, 1, 0.03529412, 1,
-0.4801363, -0.693531, -1.729284, 0, 1, 0.03921569, 1,
-0.4778753, 0.2388623, -4.182816, 0, 1, 0.04705882, 1,
-0.4747212, -0.8569093, -3.514119, 0, 1, 0.05098039, 1,
-0.4617538, -0.09874087, -3.318159, 0, 1, 0.05882353, 1,
-0.460951, 0.1521223, -0.6569905, 0, 1, 0.0627451, 1,
-0.4604791, 1.443351, 0.04594157, 0, 1, 0.07058824, 1,
-0.4581564, 0.9131076, 0.1730119, 0, 1, 0.07450981, 1,
-0.4577387, 0.6815118, 0.6571859, 0, 1, 0.08235294, 1,
-0.4570395, -0.7792642, -2.999615, 0, 1, 0.08627451, 1,
-0.4520378, 1.094315, -1.570873, 0, 1, 0.09411765, 1,
-0.4461736, -0.1516117, -1.088163, 0, 1, 0.1019608, 1,
-0.441946, -0.3611675, -3.959223, 0, 1, 0.1058824, 1,
-0.4403627, -1.530983, -1.586205, 0, 1, 0.1137255, 1,
-0.4375696, 2.0922, 0.3975293, 0, 1, 0.1176471, 1,
-0.4370169, 2.108602, 0.4542636, 0, 1, 0.1254902, 1,
-0.4333248, 0.68106, -0.560967, 0, 1, 0.1294118, 1,
-0.4326279, 0.7812811, -0.05800413, 0, 1, 0.1372549, 1,
-0.429294, -2.237291, -2.865299, 0, 1, 0.1411765, 1,
-0.4290797, 0.1797648, 0.7437173, 0, 1, 0.1490196, 1,
-0.4272658, -0.9451345, -3.934425, 0, 1, 0.1529412, 1,
-0.4203391, -0.9852728, -4.704136, 0, 1, 0.1607843, 1,
-0.4170887, -1.794134, -4.176512, 0, 1, 0.1647059, 1,
-0.4163637, -0.3425166, -2.848515, 0, 1, 0.172549, 1,
-0.4159059, -0.347039, -0.6681154, 0, 1, 0.1764706, 1,
-0.4157069, 2.027677, 0.01562858, 0, 1, 0.1843137, 1,
-0.4125726, -0.9371306, -2.692043, 0, 1, 0.1882353, 1,
-0.4120425, -1.776921, -1.801763, 0, 1, 0.1960784, 1,
-0.410378, -0.4077312, -1.424002, 0, 1, 0.2039216, 1,
-0.4087346, -0.1239987, -3.169212, 0, 1, 0.2078431, 1,
-0.4078182, -1.206274, -3.744935, 0, 1, 0.2156863, 1,
-0.4031039, 0.9208761, -2.626529, 0, 1, 0.2196078, 1,
-0.3992048, -0.3033073, 0.3290912, 0, 1, 0.227451, 1,
-0.3966063, -0.7880288, -2.304106, 0, 1, 0.2313726, 1,
-0.3965378, -0.07159963, -1.584816, 0, 1, 0.2392157, 1,
-0.3904489, 0.5988197, -0.5757924, 0, 1, 0.2431373, 1,
-0.3880867, -0.4798994, -2.063335, 0, 1, 0.2509804, 1,
-0.3825622, -0.3320319, -0.8694159, 0, 1, 0.254902, 1,
-0.3819118, 1.158018, -0.7149307, 0, 1, 0.2627451, 1,
-0.3768598, -1.69171, -1.403034, 0, 1, 0.2666667, 1,
-0.376575, -0.3448828, -1.144635, 0, 1, 0.2745098, 1,
-0.3739352, 0.4221946, -0.6840351, 0, 1, 0.2784314, 1,
-0.370905, -0.04023844, -3.294793, 0, 1, 0.2862745, 1,
-0.3613014, 0.03763616, -1.7896, 0, 1, 0.2901961, 1,
-0.3610718, 1.264744, -0.9042273, 0, 1, 0.2980392, 1,
-0.3582217, -1.613177, -1.328549, 0, 1, 0.3058824, 1,
-0.3581914, -0.234692, -2.633183, 0, 1, 0.3098039, 1,
-0.3577604, 0.07985933, -0.5275458, 0, 1, 0.3176471, 1,
-0.3565428, -0.2078698, -4.281712, 0, 1, 0.3215686, 1,
-0.351881, 0.3580907, -0.1145871, 0, 1, 0.3294118, 1,
-0.3502148, -1.110962, -3.12824, 0, 1, 0.3333333, 1,
-0.3480405, -1.321937, -3.087349, 0, 1, 0.3411765, 1,
-0.3469415, 0.8213994, -1.15414, 0, 1, 0.345098, 1,
-0.346691, 0.3384984, 1.391616, 0, 1, 0.3529412, 1,
-0.3444341, 1.393991, 0.9119237, 0, 1, 0.3568628, 1,
-0.3443737, 1.003527, -0.9854555, 0, 1, 0.3647059, 1,
-0.3436219, 0.777783, 1.978201, 0, 1, 0.3686275, 1,
-0.3429907, 0.009125597, -2.719034, 0, 1, 0.3764706, 1,
-0.3412271, 0.7821557, -0.7476054, 0, 1, 0.3803922, 1,
-0.3361082, 0.271582, -1.908122, 0, 1, 0.3882353, 1,
-0.3323161, 1.130798, -0.5020725, 0, 1, 0.3921569, 1,
-0.3296996, -0.1111513, -1.782942, 0, 1, 0.4, 1,
-0.3295521, 0.7159305, 1.164897, 0, 1, 0.4078431, 1,
-0.3247623, 0.2370238, -0.2861171, 0, 1, 0.4117647, 1,
-0.3244123, 0.2671258, -0.2568951, 0, 1, 0.4196078, 1,
-0.3210058, -0.7355202, -2.210232, 0, 1, 0.4235294, 1,
-0.3198829, -0.08638747, -2.78235, 0, 1, 0.4313726, 1,
-0.3195834, -1.129766, -1.886246, 0, 1, 0.4352941, 1,
-0.3186454, 1.245249, 1.198783, 0, 1, 0.4431373, 1,
-0.3145839, -0.6060415, -2.960981, 0, 1, 0.4470588, 1,
-0.3126304, -0.6203572, -4.252796, 0, 1, 0.454902, 1,
-0.311931, -0.1056447, -0.1815126, 0, 1, 0.4588235, 1,
-0.3118649, -0.8584087, -2.483701, 0, 1, 0.4666667, 1,
-0.3114498, 0.5626563, -0.9237211, 0, 1, 0.4705882, 1,
-0.3111333, 0.07560122, -3.408801, 0, 1, 0.4784314, 1,
-0.3055244, 0.5772566, -0.5972165, 0, 1, 0.4823529, 1,
-0.3046341, 0.9078516, -1.692636, 0, 1, 0.4901961, 1,
-0.3021301, 0.001201994, -3.333248, 0, 1, 0.4941176, 1,
-0.3006354, 0.7334471, -0.621218, 0, 1, 0.5019608, 1,
-0.2931868, 1.603029, -0.1752691, 0, 1, 0.509804, 1,
-0.2922574, -1.532428, -4.298795, 0, 1, 0.5137255, 1,
-0.286539, 0.7853485, 0.01857623, 0, 1, 0.5215687, 1,
-0.2858384, -0.3162209, -1.970796, 0, 1, 0.5254902, 1,
-0.2853585, -0.1832257, -2.187694, 0, 1, 0.5333334, 1,
-0.2839985, -0.679055, -2.284529, 0, 1, 0.5372549, 1,
-0.2785408, 1.536454, -1.06293, 0, 1, 0.5450981, 1,
-0.2761207, -0.518412, -1.645529, 0, 1, 0.5490196, 1,
-0.2744148, 1.322886, 0.8779457, 0, 1, 0.5568628, 1,
-0.2742945, -0.9651814, -2.770763, 0, 1, 0.5607843, 1,
-0.2739465, 0.9841172, 0.8073458, 0, 1, 0.5686275, 1,
-0.2708967, 0.1708302, -2.216628, 0, 1, 0.572549, 1,
-0.268547, 0.3853031, -0.5732966, 0, 1, 0.5803922, 1,
-0.2570996, 0.09347074, -1.614075, 0, 1, 0.5843138, 1,
-0.2570979, 1.185761, -2.038284, 0, 1, 0.5921569, 1,
-0.2550948, -0.0804153, -1.425968, 0, 1, 0.5960785, 1,
-0.254304, -0.03612728, -2.287914, 0, 1, 0.6039216, 1,
-0.2540858, -0.4460153, -4.234548, 0, 1, 0.6117647, 1,
-0.2537221, -1.29528, -2.763166, 0, 1, 0.6156863, 1,
-0.2493528, -2.004687, -3.412569, 0, 1, 0.6235294, 1,
-0.2489188, 0.7598074, -1.155298, 0, 1, 0.627451, 1,
-0.2483005, 0.3685158, -1.116665, 0, 1, 0.6352941, 1,
-0.2460765, -0.779672, -4.091043, 0, 1, 0.6392157, 1,
-0.2421178, -1.214572, -3.166009, 0, 1, 0.6470588, 1,
-0.2407462, -0.820986, -4.473591, 0, 1, 0.6509804, 1,
-0.2384218, -0.01254638, -1.466501, 0, 1, 0.6588235, 1,
-0.2345756, 0.6475735, -0.752912, 0, 1, 0.6627451, 1,
-0.2314482, -0.4120978, -2.928701, 0, 1, 0.6705883, 1,
-0.2294323, 0.3630728, 0.3653615, 0, 1, 0.6745098, 1,
-0.2280682, 0.6804174, 0.1149445, 0, 1, 0.682353, 1,
-0.2279696, -1.456298, -3.806702, 0, 1, 0.6862745, 1,
-0.2265435, -0.6253769, -3.308671, 0, 1, 0.6941177, 1,
-0.2245058, -0.5236034, -1.484212, 0, 1, 0.7019608, 1,
-0.2235997, -1.061028, -1.062406, 0, 1, 0.7058824, 1,
-0.2210682, -1.036555, -2.904186, 0, 1, 0.7137255, 1,
-0.2202038, 0.1207764, -1.80122, 0, 1, 0.7176471, 1,
-0.2191694, 0.6503782, -0.6291893, 0, 1, 0.7254902, 1,
-0.21508, -0.6263992, -2.858427, 0, 1, 0.7294118, 1,
-0.2106926, 1.274577, 0.8968204, 0, 1, 0.7372549, 1,
-0.2097798, -1.184697, -1.228976, 0, 1, 0.7411765, 1,
-0.208403, -0.376567, -1.229904, 0, 1, 0.7490196, 1,
-0.2052942, -0.06912488, -1.650531, 0, 1, 0.7529412, 1,
-0.1990368, 0.4170093, -0.07655979, 0, 1, 0.7607843, 1,
-0.1923643, 1.863232, -0.01325809, 0, 1, 0.7647059, 1,
-0.1877651, 0.5990563, -0.5463234, 0, 1, 0.772549, 1,
-0.1857287, -0.2791989, 0.05189583, 0, 1, 0.7764706, 1,
-0.1831995, 0.06979115, -1.565743, 0, 1, 0.7843137, 1,
-0.1776447, -0.7805665, -4.384309, 0, 1, 0.7882353, 1,
-0.1762829, -0.1114066, -2.591691, 0, 1, 0.7960784, 1,
-0.1713519, -1.622457, -2.299006, 0, 1, 0.8039216, 1,
-0.1697015, -2.95898, -4.198686, 0, 1, 0.8078431, 1,
-0.1683212, -0.2755551, -2.250195, 0, 1, 0.8156863, 1,
-0.1635519, 0.2570806, -1.209397, 0, 1, 0.8196079, 1,
-0.1602982, 2.59637, 1.280045, 0, 1, 0.827451, 1,
-0.1589925, -1.078866, -4.354854, 0, 1, 0.8313726, 1,
-0.1579284, 0.4910174, -0.7617847, 0, 1, 0.8392157, 1,
-0.1575154, -1.943401, -3.5798, 0, 1, 0.8431373, 1,
-0.1556998, -0.8564584, -3.075336, 0, 1, 0.8509804, 1,
-0.1545986, 0.1803965, -1.515241, 0, 1, 0.854902, 1,
-0.1516429, -0.4845345, -2.155508, 0, 1, 0.8627451, 1,
-0.1515187, 1.5147, -0.6727999, 0, 1, 0.8666667, 1,
-0.1504008, -0.7673227, -4.264632, 0, 1, 0.8745098, 1,
-0.1490628, 0.3925518, -1.807263, 0, 1, 0.8784314, 1,
-0.1485201, -1.38305, -2.592719, 0, 1, 0.8862745, 1,
-0.1473734, 1.442039, -1.802796, 0, 1, 0.8901961, 1,
-0.1467837, 1.096424, 0.6768183, 0, 1, 0.8980392, 1,
-0.1466218, -1.201968, -3.392842, 0, 1, 0.9058824, 1,
-0.144146, 0.7287377, 0.3858408, 0, 1, 0.9098039, 1,
-0.1373639, 0.1173853, -1.416175, 0, 1, 0.9176471, 1,
-0.1362226, 1.247731, 0.06804902, 0, 1, 0.9215686, 1,
-0.1353733, -1.397695, -2.990378, 0, 1, 0.9294118, 1,
-0.1339696, 0.0940282, -0.01412734, 0, 1, 0.9333333, 1,
-0.1334203, -0.2172766, -2.583547, 0, 1, 0.9411765, 1,
-0.1267188, 2.06403, -0.8245046, 0, 1, 0.945098, 1,
-0.1242157, -0.2878745, -2.164823, 0, 1, 0.9529412, 1,
-0.1235718, 1.299296, -1.710683, 0, 1, 0.9568627, 1,
-0.1223326, 1.862084, 1.774082, 0, 1, 0.9647059, 1,
-0.118323, -1.362379, -2.96621, 0, 1, 0.9686275, 1,
-0.1107078, 0.8072238, -0.3429444, 0, 1, 0.9764706, 1,
-0.1017793, 1.085233, -1.377611, 0, 1, 0.9803922, 1,
-0.09244947, 0.7539032, -0.3017884, 0, 1, 0.9882353, 1,
-0.08455461, 0.8186868, -0.4844274, 0, 1, 0.9921569, 1,
-0.08427826, -0.1663657, -3.723512, 0, 1, 1, 1,
-0.08217965, 0.6550695, -0.4981067, 0, 0.9921569, 1, 1,
-0.07910233, -0.7639235, -2.877518, 0, 0.9882353, 1, 1,
-0.07530135, -0.7061085, -3.039352, 0, 0.9803922, 1, 1,
-0.07181869, 1.005154, -0.08670894, 0, 0.9764706, 1, 1,
-0.0717466, -0.7304873, -4.221419, 0, 0.9686275, 1, 1,
-0.06876197, 1.076864, 1.01516, 0, 0.9647059, 1, 1,
-0.06722169, 0.1719784, -1.335727, 0, 0.9568627, 1, 1,
-0.06652428, -2.375921, -1.743141, 0, 0.9529412, 1, 1,
-0.06202811, 0.7023214, -1.068755, 0, 0.945098, 1, 1,
-0.05444482, 2.091856, -0.1174039, 0, 0.9411765, 1, 1,
-0.0537952, -1.788728, -1.684399, 0, 0.9333333, 1, 1,
-0.05357032, 1.878778, 2.60568, 0, 0.9294118, 1, 1,
-0.04590971, 0.6064435, -0.910243, 0, 0.9215686, 1, 1,
-0.04403258, -1.045436, -3.364917, 0, 0.9176471, 1, 1,
-0.04177465, -0.7631727, -4.087894, 0, 0.9098039, 1, 1,
-0.04084381, -0.2018191, -1.689862, 0, 0.9058824, 1, 1,
-0.03696995, -0.3819165, -3.622451, 0, 0.8980392, 1, 1,
-0.0315664, 0.4468754, -0.7221618, 0, 0.8901961, 1, 1,
-0.02509855, -0.8090566, -3.089666, 0, 0.8862745, 1, 1,
-0.02281133, 1.007127, -0.3789112, 0, 0.8784314, 1, 1,
-0.0188022, -0.5852703, -3.453334, 0, 0.8745098, 1, 1,
-0.01530259, 1.048615, 0.006265038, 0, 0.8666667, 1, 1,
-0.01320284, 1.142482, -1.853745, 0, 0.8627451, 1, 1,
-0.009574269, -0.372055, -3.249094, 0, 0.854902, 1, 1,
-0.005507585, -0.6806762, -2.398596, 0, 0.8509804, 1, 1,
0.003622832, -0.32252, 2.577665, 0, 0.8431373, 1, 1,
0.005848101, -0.4690576, 1.061784, 0, 0.8392157, 1, 1,
0.008811137, 0.07331901, -0.3919565, 0, 0.8313726, 1, 1,
0.008913895, -0.1945159, 2.476574, 0, 0.827451, 1, 1,
0.009010122, 1.023671, 0.02405735, 0, 0.8196079, 1, 1,
0.01356662, -0.5661138, 3.769659, 0, 0.8156863, 1, 1,
0.01507251, 0.3521033, 2.375702, 0, 0.8078431, 1, 1,
0.01688036, 1.24536, -0.1175028, 0, 0.8039216, 1, 1,
0.01774807, -1.95469, 4.122847, 0, 0.7960784, 1, 1,
0.01887396, 0.5868392, 0.4285379, 0, 0.7882353, 1, 1,
0.02106769, 0.981843, 0.7768505, 0, 0.7843137, 1, 1,
0.03570915, 1.06368, 0.6491123, 0, 0.7764706, 1, 1,
0.04024951, 0.6442907, -1.087709, 0, 0.772549, 1, 1,
0.04347411, -0.6090438, 3.823508, 0, 0.7647059, 1, 1,
0.04386279, 0.5831856, 0.4104311, 0, 0.7607843, 1, 1,
0.0518467, -0.7050114, 3.755459, 0, 0.7529412, 1, 1,
0.05625214, -0.948123, 3.447968, 0, 0.7490196, 1, 1,
0.0641684, 0.3539894, 1.245629, 0, 0.7411765, 1, 1,
0.06549097, 1.371818, -1.624881, 0, 0.7372549, 1, 1,
0.06594558, -0.7585332, 2.230289, 0, 0.7294118, 1, 1,
0.06601312, 0.04634355, 0.3922496, 0, 0.7254902, 1, 1,
0.06847432, -0.5467275, 3.129579, 0, 0.7176471, 1, 1,
0.07274368, -0.2670821, 2.925119, 0, 0.7137255, 1, 1,
0.07745254, 0.6602333, 0.5812759, 0, 0.7058824, 1, 1,
0.0808215, -1.001458, 2.818562, 0, 0.6980392, 1, 1,
0.08253512, -1.565462, 3.966371, 0, 0.6941177, 1, 1,
0.08448361, -0.07110904, 2.288325, 0, 0.6862745, 1, 1,
0.0880518, -0.1964255, 2.719604, 0, 0.682353, 1, 1,
0.09138524, -0.4215952, 3.581363, 0, 0.6745098, 1, 1,
0.09215271, 0.5612044, -1.438164, 0, 0.6705883, 1, 1,
0.09386793, -0.2516541, 0.9950905, 0, 0.6627451, 1, 1,
0.09633224, 1.798238, -0.7998408, 0, 0.6588235, 1, 1,
0.09645908, -0.473389, 4.711782, 0, 0.6509804, 1, 1,
0.097736, 0.06584151, 1.534113, 0, 0.6470588, 1, 1,
0.1033318, 0.4540898, 2.228396, 0, 0.6392157, 1, 1,
0.1168541, -2.037236, 3.360332, 0, 0.6352941, 1, 1,
0.1183948, -0.1804853, 2.481558, 0, 0.627451, 1, 1,
0.1215151, 1.225188, -1.4853, 0, 0.6235294, 1, 1,
0.1309805, -0.9095299, 2.740546, 0, 0.6156863, 1, 1,
0.1343449, -0.8867026, 2.034873, 0, 0.6117647, 1, 1,
0.1352975, 1.96992, -0.5623262, 0, 0.6039216, 1, 1,
0.1377379, -0.688076, 3.879097, 0, 0.5960785, 1, 1,
0.141084, -0.25944, 1.277916, 0, 0.5921569, 1, 1,
0.1470282, -0.6653264, 2.008479, 0, 0.5843138, 1, 1,
0.1488985, -1.393143, 3.344484, 0, 0.5803922, 1, 1,
0.1528349, 1.325443, 1.316109, 0, 0.572549, 1, 1,
0.154852, 0.1899886, 0.4910646, 0, 0.5686275, 1, 1,
0.1565844, -3.058986, 3.502295, 0, 0.5607843, 1, 1,
0.1603744, 0.8535205, 0.4688039, 0, 0.5568628, 1, 1,
0.1647017, 0.2337586, 2.335631, 0, 0.5490196, 1, 1,
0.1667404, -1.254063, 2.843093, 0, 0.5450981, 1, 1,
0.1670959, -1.106756, 2.793019, 0, 0.5372549, 1, 1,
0.168172, 0.1252819, 2.521278, 0, 0.5333334, 1, 1,
0.16862, -0.5840011, 2.144117, 0, 0.5254902, 1, 1,
0.1720994, 1.186995, 0.5739781, 0, 0.5215687, 1, 1,
0.1738204, 1.047496, -0.6964622, 0, 0.5137255, 1, 1,
0.174213, -0.4090243, 2.827992, 0, 0.509804, 1, 1,
0.1772891, 1.106539, -0.4840511, 0, 0.5019608, 1, 1,
0.1801351, -1.999453, 3.614992, 0, 0.4941176, 1, 1,
0.1807364, -0.3534288, 3.318883, 0, 0.4901961, 1, 1,
0.186165, 1.590181, 0.1919057, 0, 0.4823529, 1, 1,
0.1867757, -0.07277019, 2.478288, 0, 0.4784314, 1, 1,
0.18946, -0.07060345, 1.111564, 0, 0.4705882, 1, 1,
0.1921694, -0.7179781, 3.440693, 0, 0.4666667, 1, 1,
0.1970509, 1.376929, 0.3192641, 0, 0.4588235, 1, 1,
0.197376, 0.4265879, 1.778842, 0, 0.454902, 1, 1,
0.2011131, -0.3082787, 2.01705, 0, 0.4470588, 1, 1,
0.2019768, 1.104543, -0.3849939, 0, 0.4431373, 1, 1,
0.2048994, 0.7749591, 2.153059, 0, 0.4352941, 1, 1,
0.2060049, -0.4219493, 2.931687, 0, 0.4313726, 1, 1,
0.2069169, -0.3236095, 2.527181, 0, 0.4235294, 1, 1,
0.2070137, 0.9905953, 0.7431555, 0, 0.4196078, 1, 1,
0.2123898, 1.037878, 1.394042, 0, 0.4117647, 1, 1,
0.2151423, -0.172233, 1.611022, 0, 0.4078431, 1, 1,
0.2173525, 1.256799, 0.5729506, 0, 0.4, 1, 1,
0.2174459, -0.6244664, 4.297744, 0, 0.3921569, 1, 1,
0.2175888, -1.325935, 1.941901, 0, 0.3882353, 1, 1,
0.2191888, 1.249234, 0.9002898, 0, 0.3803922, 1, 1,
0.2218722, 0.9947746, 1.009209, 0, 0.3764706, 1, 1,
0.2233818, -0.8249728, 1.683224, 0, 0.3686275, 1, 1,
0.2288553, -1.888816, 4.050373, 0, 0.3647059, 1, 1,
0.2294212, 0.2429896, 0.8597775, 0, 0.3568628, 1, 1,
0.2301665, 1.42901, 1.147799, 0, 0.3529412, 1, 1,
0.2307858, 1.482696, 0.09340239, 0, 0.345098, 1, 1,
0.2341237, 0.4163857, -0.2765372, 0, 0.3411765, 1, 1,
0.2345992, -0.3167416, 3.405087, 0, 0.3333333, 1, 1,
0.2383058, 0.8616577, 0.347614, 0, 0.3294118, 1, 1,
0.2411762, 2.162425, 1.710991, 0, 0.3215686, 1, 1,
0.2426144, 0.7380337, -0.420567, 0, 0.3176471, 1, 1,
0.25298, 0.743384, 1.037891, 0, 0.3098039, 1, 1,
0.25361, 1.207308, 1.670665, 0, 0.3058824, 1, 1,
0.2618247, 0.3574856, 0.03568209, 0, 0.2980392, 1, 1,
0.2627871, 1.561277, -1.008912, 0, 0.2901961, 1, 1,
0.2651072, 1.107741, -0.05207171, 0, 0.2862745, 1, 1,
0.2695834, 0.5496119, -0.4376324, 0, 0.2784314, 1, 1,
0.2712668, 0.1729396, 1.561389, 0, 0.2745098, 1, 1,
0.2713722, 0.1364184, 1.677098, 0, 0.2666667, 1, 1,
0.2724865, 0.1334929, 1.980662, 0, 0.2627451, 1, 1,
0.2746797, -0.4611722, 1.49122, 0, 0.254902, 1, 1,
0.2779147, 0.4119747, 0.08280222, 0, 0.2509804, 1, 1,
0.278389, 0.2698006, -0.03983815, 0, 0.2431373, 1, 1,
0.2789814, 1.099297, 0.5102549, 0, 0.2392157, 1, 1,
0.2792052, 0.6618475, 2.072776, 0, 0.2313726, 1, 1,
0.2832732, -1.378331, 2.244826, 0, 0.227451, 1, 1,
0.2968251, -0.6930189, 2.59969, 0, 0.2196078, 1, 1,
0.2988423, -0.2977173, 1.767094, 0, 0.2156863, 1, 1,
0.2988724, 1.127753, -0.6950122, 0, 0.2078431, 1, 1,
0.3031933, 1.872152, 1.001284, 0, 0.2039216, 1, 1,
0.3046778, -0.2142015, 3.306643, 0, 0.1960784, 1, 1,
0.3073731, 0.1688183, 0.9300888, 0, 0.1882353, 1, 1,
0.3245041, 0.3548764, 2.12293, 0, 0.1843137, 1, 1,
0.3250704, -1.718234, 3.755339, 0, 0.1764706, 1, 1,
0.3252273, 0.3421668, 1.550044, 0, 0.172549, 1, 1,
0.3252791, 0.6929338, 0.0121765, 0, 0.1647059, 1, 1,
0.3261839, 0.1811567, 1.652701, 0, 0.1607843, 1, 1,
0.329193, -0.5010344, 3.000228, 0, 0.1529412, 1, 1,
0.3342446, 1.231108, -0.2048559, 0, 0.1490196, 1, 1,
0.3345782, -1.035037, 5.39106, 0, 0.1411765, 1, 1,
0.3346465, -0.1638007, 1.883225, 0, 0.1372549, 1, 1,
0.3366612, 0.6675303, 1.108856, 0, 0.1294118, 1, 1,
0.3368123, -0.3516552, 2.830745, 0, 0.1254902, 1, 1,
0.339626, -0.7234117, 2.053672, 0, 0.1176471, 1, 1,
0.3419398, -0.9665704, 1.863739, 0, 0.1137255, 1, 1,
0.3440037, 1.907318, 0.4642126, 0, 0.1058824, 1, 1,
0.3447981, -0.4325637, 2.82081, 0, 0.09803922, 1, 1,
0.3533756, 0.6666265, -1.327913, 0, 0.09411765, 1, 1,
0.3557609, -1.19351, 4.475195, 0, 0.08627451, 1, 1,
0.3566407, -0.1658986, 1.551406, 0, 0.08235294, 1, 1,
0.3569792, 2.018837, 0.01496239, 0, 0.07450981, 1, 1,
0.3570336, -0.4068082, 2.692997, 0, 0.07058824, 1, 1,
0.3582341, 1.221088, -1.097767, 0, 0.0627451, 1, 1,
0.362731, 0.254613, 2.042409, 0, 0.05882353, 1, 1,
0.3682265, 0.4176542, -0.6599775, 0, 0.05098039, 1, 1,
0.3690968, 1.173267, -0.3251976, 0, 0.04705882, 1, 1,
0.3702413, 0.7088473, 1.090421, 0, 0.03921569, 1, 1,
0.3709966, -0.4527982, 1.762739, 0, 0.03529412, 1, 1,
0.3721958, -1.444247, 2.565452, 0, 0.02745098, 1, 1,
0.3733902, 0.1374728, 0.2182921, 0, 0.02352941, 1, 1,
0.3741795, -2.507756, 3.587243, 0, 0.01568628, 1, 1,
0.3759311, 1.775725, -0.856307, 0, 0.01176471, 1, 1,
0.3813681, -1.7672, 2.900841, 0, 0.003921569, 1, 1,
0.384598, 1.828019, 0.8132809, 0.003921569, 0, 1, 1,
0.3884387, -1.061571, 2.565568, 0.007843138, 0, 1, 1,
0.3909686, -2.204962, 3.948943, 0.01568628, 0, 1, 1,
0.3943373, -0.8742363, 2.481241, 0.01960784, 0, 1, 1,
0.3953464, -0.9589438, 1.721811, 0.02745098, 0, 1, 1,
0.3990858, -0.4817452, 3.437358, 0.03137255, 0, 1, 1,
0.4040821, -0.1565593, 2.096184, 0.03921569, 0, 1, 1,
0.4066514, 0.384749, 2.248165, 0.04313726, 0, 1, 1,
0.4146037, -0.9128677, 4.350636, 0.05098039, 0, 1, 1,
0.415439, -1.574282, 2.659401, 0.05490196, 0, 1, 1,
0.4231143, -0.4550557, 3.137506, 0.0627451, 0, 1, 1,
0.4263327, 0.3617004, 1.092346, 0.06666667, 0, 1, 1,
0.4263856, 0.5326266, -0.6842922, 0.07450981, 0, 1, 1,
0.4360671, 1.145027, 0.5847865, 0.07843138, 0, 1, 1,
0.4369081, -1.08122, 2.142616, 0.08627451, 0, 1, 1,
0.4373351, 0.8521839, 1.91796, 0.09019608, 0, 1, 1,
0.4417236, -0.7369567, 3.191073, 0.09803922, 0, 1, 1,
0.4428044, 0.9334413, 1.50127, 0.1058824, 0, 1, 1,
0.4430366, -0.5070074, 4.781593, 0.1098039, 0, 1, 1,
0.449105, 1.786369, 0.6685173, 0.1176471, 0, 1, 1,
0.450457, -0.8499356, 3.592461, 0.1215686, 0, 1, 1,
0.4506392, 1.088403, 2.762486, 0.1294118, 0, 1, 1,
0.4524548, -0.8527834, 1.463988, 0.1333333, 0, 1, 1,
0.4532264, 0.147236, 1.735459, 0.1411765, 0, 1, 1,
0.4578674, 0.8352255, 0.1999093, 0.145098, 0, 1, 1,
0.4584619, -0.4609762, 3.185822, 0.1529412, 0, 1, 1,
0.4594393, 0.688183, 1.24691, 0.1568628, 0, 1, 1,
0.4660108, -1.462933, 3.000242, 0.1647059, 0, 1, 1,
0.4715618, -0.1675003, 2.662937, 0.1686275, 0, 1, 1,
0.4722733, -0.253702, 2.460114, 0.1764706, 0, 1, 1,
0.4763479, 2.385076, 1.33162, 0.1803922, 0, 1, 1,
0.4780882, 0.3765798, -0.3495504, 0.1882353, 0, 1, 1,
0.480848, -2.698778, 2.719887, 0.1921569, 0, 1, 1,
0.4810871, -0.5216091, 1.448967, 0.2, 0, 1, 1,
0.4835279, 2.168927, -1.54398, 0.2078431, 0, 1, 1,
0.4884057, 0.8784949, 0.0519998, 0.2117647, 0, 1, 1,
0.4911481, 0.5163668, 0.8602108, 0.2196078, 0, 1, 1,
0.4923613, -0.5510201, 4.543952, 0.2235294, 0, 1, 1,
0.4951757, 1.884196, -1.009963, 0.2313726, 0, 1, 1,
0.4965541, 1.331606, 1.120861, 0.2352941, 0, 1, 1,
0.4997911, 2.709737, 0.3817603, 0.2431373, 0, 1, 1,
0.5091551, 0.4098348, 0.668303, 0.2470588, 0, 1, 1,
0.5107579, 1.614831, 1.65258, 0.254902, 0, 1, 1,
0.5135187, -0.7185081, 3.632459, 0.2588235, 0, 1, 1,
0.5171507, -0.2493895, 3.748262, 0.2666667, 0, 1, 1,
0.520986, 0.2484567, -1.543722, 0.2705882, 0, 1, 1,
0.5225338, -0.3023202, 1.924838, 0.2784314, 0, 1, 1,
0.5226515, -1.463862, 1.461451, 0.282353, 0, 1, 1,
0.5239108, 0.2049384, 1.8607, 0.2901961, 0, 1, 1,
0.5262885, -1.095163, 3.443688, 0.2941177, 0, 1, 1,
0.5351887, -1.427461, 4.214653, 0.3019608, 0, 1, 1,
0.5404842, 0.9005612, 2.494076, 0.3098039, 0, 1, 1,
0.5408947, -1.577016, 1.831986, 0.3137255, 0, 1, 1,
0.5409092, 2.12686, 0.1755707, 0.3215686, 0, 1, 1,
0.5412645, -0.07332028, 1.816922, 0.3254902, 0, 1, 1,
0.5427863, -0.00832763, 1.269921, 0.3333333, 0, 1, 1,
0.5487226, -1.772334, 2.8483, 0.3372549, 0, 1, 1,
0.5540491, -0.6779593, 1.143704, 0.345098, 0, 1, 1,
0.555401, -0.06755687, 1.678526, 0.3490196, 0, 1, 1,
0.5671679, -0.5846061, 1.731078, 0.3568628, 0, 1, 1,
0.5728521, 0.04681946, 1.933895, 0.3607843, 0, 1, 1,
0.5729936, 1.508999, -0.831116, 0.3686275, 0, 1, 1,
0.5741808, 0.440217, 0.2760234, 0.372549, 0, 1, 1,
0.5764695, 1.931607, 0.3071175, 0.3803922, 0, 1, 1,
0.5814551, -1.122135, 2.911409, 0.3843137, 0, 1, 1,
0.5881146, -0.9322148, 2.022085, 0.3921569, 0, 1, 1,
0.58845, 0.3956708, 0.7813637, 0.3960784, 0, 1, 1,
0.5888315, -1.368002, 3.081774, 0.4039216, 0, 1, 1,
0.5890107, -1.23868, 1.654081, 0.4117647, 0, 1, 1,
0.5900351, 0.2949339, 0.5143085, 0.4156863, 0, 1, 1,
0.602882, 1.049377, 0.4463559, 0.4235294, 0, 1, 1,
0.6091858, -1.712734, 4.779606, 0.427451, 0, 1, 1,
0.6092098, 0.1788339, 1.029752, 0.4352941, 0, 1, 1,
0.6117732, 0.30212, 1.806458, 0.4392157, 0, 1, 1,
0.6159068, 2.516474, 1.470919, 0.4470588, 0, 1, 1,
0.6170338, 0.2300171, -0.7875755, 0.4509804, 0, 1, 1,
0.6178328, -0.8734478, 2.332026, 0.4588235, 0, 1, 1,
0.6182787, 0.3796342, 1.453939, 0.4627451, 0, 1, 1,
0.6230613, 0.1870068, 1.111304, 0.4705882, 0, 1, 1,
0.6232351, 1.237063, 0.8776253, 0.4745098, 0, 1, 1,
0.6233026, -0.5157863, 2.883166, 0.4823529, 0, 1, 1,
0.624317, 1.393435, 0.1103542, 0.4862745, 0, 1, 1,
0.6267512, 1.023795, 2.189464, 0.4941176, 0, 1, 1,
0.6288953, -0.5962975, 3.749569, 0.5019608, 0, 1, 1,
0.6300569, 1.236595, -0.4965701, 0.5058824, 0, 1, 1,
0.6343542, 0.4300345, 0.649635, 0.5137255, 0, 1, 1,
0.6346281, -0.3422065, 2.185901, 0.5176471, 0, 1, 1,
0.6368161, 0.399475, 1.093728, 0.5254902, 0, 1, 1,
0.6400421, 1.351427, 0.2617103, 0.5294118, 0, 1, 1,
0.6490746, -0.2318543, 1.837846, 0.5372549, 0, 1, 1,
0.6497384, -0.5653329, 1.300861, 0.5411765, 0, 1, 1,
0.6549693, -1.020387, 3.380538, 0.5490196, 0, 1, 1,
0.6591722, 0.296672, 1.316096, 0.5529412, 0, 1, 1,
0.6599146, 0.932581, 2.845223, 0.5607843, 0, 1, 1,
0.6621693, 0.8447549, 0.5245508, 0.5647059, 0, 1, 1,
0.6625799, 0.2526072, 2.514227, 0.572549, 0, 1, 1,
0.6637818, -0.5364985, 1.451459, 0.5764706, 0, 1, 1,
0.6649556, -0.07666977, 0.9232882, 0.5843138, 0, 1, 1,
0.6753844, -0.4911675, 0.3222608, 0.5882353, 0, 1, 1,
0.6765369, 1.080613, -0.2260727, 0.5960785, 0, 1, 1,
0.6767467, -2.227156, 4.471918, 0.6039216, 0, 1, 1,
0.6773002, 0.3620129, 2.186917, 0.6078432, 0, 1, 1,
0.6827686, -1.321262, 1.85252, 0.6156863, 0, 1, 1,
0.6867684, -0.0354223, 3.102803, 0.6196079, 0, 1, 1,
0.6886316, 0.2571586, 2.068752, 0.627451, 0, 1, 1,
0.6938049, 0.256606, 1.803465, 0.6313726, 0, 1, 1,
0.694812, 1.128332, 1.462266, 0.6392157, 0, 1, 1,
0.699931, -0.002514837, 1.921848, 0.6431373, 0, 1, 1,
0.7057495, -1.506052, 2.500888, 0.6509804, 0, 1, 1,
0.7074227, -0.8849353, 2.912792, 0.654902, 0, 1, 1,
0.7096658, 0.09878408, 2.733687, 0.6627451, 0, 1, 1,
0.7133009, -0.3426099, 3.426357, 0.6666667, 0, 1, 1,
0.7156117, -1.805372, 2.335228, 0.6745098, 0, 1, 1,
0.7160449, 1.340797, 2.372131, 0.6784314, 0, 1, 1,
0.7233579, -0.2293086, 2.287242, 0.6862745, 0, 1, 1,
0.7251989, -1.083799, 4.789473, 0.6901961, 0, 1, 1,
0.7257415, 0.8168266, 2.404071, 0.6980392, 0, 1, 1,
0.7300467, -0.02908134, 1.605192, 0.7058824, 0, 1, 1,
0.7309037, -1.108426, 2.228904, 0.7098039, 0, 1, 1,
0.7324774, 0.09239541, 2.115186, 0.7176471, 0, 1, 1,
0.7334179, 1.358597, 1.056138, 0.7215686, 0, 1, 1,
0.7367881, -1.230455, 2.033359, 0.7294118, 0, 1, 1,
0.737299, -0.2364998, 2.965988, 0.7333333, 0, 1, 1,
0.742152, -1.011808, 2.181807, 0.7411765, 0, 1, 1,
0.7450454, -0.7794966, 2.701802, 0.7450981, 0, 1, 1,
0.7517225, 0.8929899, -0.319321, 0.7529412, 0, 1, 1,
0.7537879, -2.024524, 1.088298, 0.7568628, 0, 1, 1,
0.7559134, 0.7228569, 2.18256, 0.7647059, 0, 1, 1,
0.7635758, 0.2851351, 2.570855, 0.7686275, 0, 1, 1,
0.7637342, 1.106424, 1.017997, 0.7764706, 0, 1, 1,
0.7644472, 0.473537, 0.6950346, 0.7803922, 0, 1, 1,
0.7755526, 1.231489, 0.9325226, 0.7882353, 0, 1, 1,
0.7755895, 0.98235, 0.8202215, 0.7921569, 0, 1, 1,
0.780525, -1.197714, 1.077248, 0.8, 0, 1, 1,
0.7812753, -1.840912, 3.349782, 0.8078431, 0, 1, 1,
0.7844533, 1.067426, -1.231198, 0.8117647, 0, 1, 1,
0.7888824, 0.06743474, 3.951186, 0.8196079, 0, 1, 1,
0.7892656, -0.9347514, 1.480177, 0.8235294, 0, 1, 1,
0.8014801, -0.4207026, 0.4977681, 0.8313726, 0, 1, 1,
0.804706, 1.3829, 0.1642326, 0.8352941, 0, 1, 1,
0.8112689, -0.7034982, 1.224276, 0.8431373, 0, 1, 1,
0.8128003, -0.1504418, 2.388762, 0.8470588, 0, 1, 1,
0.813239, 0.5612881, 2.402695, 0.854902, 0, 1, 1,
0.8137309, 1.069901, 2.172138, 0.8588235, 0, 1, 1,
0.8176611, -0.9835154, 1.251902, 0.8666667, 0, 1, 1,
0.8197658, -0.05341279, 2.392385, 0.8705882, 0, 1, 1,
0.8251866, 0.4922122, 1.401155, 0.8784314, 0, 1, 1,
0.8255345, 0.3969976, 2.058406, 0.8823529, 0, 1, 1,
0.8274727, 0.4465023, 1.309853, 0.8901961, 0, 1, 1,
0.832982, 0.18999, 0.7165555, 0.8941177, 0, 1, 1,
0.8337581, -0.5058201, 1.426277, 0.9019608, 0, 1, 1,
0.8344908, -0.1450462, 1.910429, 0.9098039, 0, 1, 1,
0.8353603, -1.363395, 1.390322, 0.9137255, 0, 1, 1,
0.8406738, 0.4905596, 1.066943, 0.9215686, 0, 1, 1,
0.8425933, -0.8711083, 3.1009, 0.9254902, 0, 1, 1,
0.8441769, -1.772914, 1.625685, 0.9333333, 0, 1, 1,
0.8455486, -1.200223, 4.710946, 0.9372549, 0, 1, 1,
0.8493505, -1.643436, 2.625608, 0.945098, 0, 1, 1,
0.8502015, 1.424779, -0.4249988, 0.9490196, 0, 1, 1,
0.8612532, 1.598298, 0.1633634, 0.9568627, 0, 1, 1,
0.8736578, -0.194758, 0.6539497, 0.9607843, 0, 1, 1,
0.8778015, -0.8696432, 2.937817, 0.9686275, 0, 1, 1,
0.8824962, -2.937747, 2.645916, 0.972549, 0, 1, 1,
0.8881316, 1.221377, -1.629881, 0.9803922, 0, 1, 1,
0.893198, 0.3959316, 1.595811, 0.9843137, 0, 1, 1,
0.8946534, 1.14752, 1.713397, 0.9921569, 0, 1, 1,
0.9008614, 2.412458, 1.467914, 0.9960784, 0, 1, 1,
0.9127674, -0.4350401, 1.055039, 1, 0, 0.9960784, 1,
0.9135129, 0.03045345, 2.056685, 1, 0, 0.9882353, 1,
0.9186393, 0.490522, 0.6702537, 1, 0, 0.9843137, 1,
0.9198865, 2.124403, 0.1153667, 1, 0, 0.9764706, 1,
0.9244826, 0.3162121, -0.8193914, 1, 0, 0.972549, 1,
0.927516, -1.054016, 1.833112, 1, 0, 0.9647059, 1,
0.9357458, -0.009251146, -0.01332718, 1, 0, 0.9607843, 1,
0.936252, -1.760329, 3.620602, 1, 0, 0.9529412, 1,
0.9383462, 0.5924118, 1.306473, 1, 0, 0.9490196, 1,
0.941251, 1.263798, -1.173188, 1, 0, 0.9411765, 1,
0.9460239, 0.154517, 1.878714, 1, 0, 0.9372549, 1,
0.9538236, 0.4437442, 0.7073364, 1, 0, 0.9294118, 1,
0.9569032, -0.426931, 2.385794, 1, 0, 0.9254902, 1,
0.9627569, 0.4412765, 0.2408098, 1, 0, 0.9176471, 1,
0.9717121, 0.2365858, 3.288338, 1, 0, 0.9137255, 1,
0.9751365, -1.27214, 3.986496, 1, 0, 0.9058824, 1,
0.9770198, -0.1935224, 2.011817, 1, 0, 0.9019608, 1,
0.9812365, -1.938178, 2.480245, 1, 0, 0.8941177, 1,
0.9950398, -1.532549, 2.858356, 1, 0, 0.8862745, 1,
0.9971933, 0.3499015, -0.2929789, 1, 0, 0.8823529, 1,
1.0034, -2.166276, 2.253806, 1, 0, 0.8745098, 1,
1.005834, -0.4250597, 2.406165, 1, 0, 0.8705882, 1,
1.0255, 0.8581129, -0.3671053, 1, 0, 0.8627451, 1,
1.025828, 1.454677, 0.4910391, 1, 0, 0.8588235, 1,
1.027452, -0.4971798, 2.052218, 1, 0, 0.8509804, 1,
1.028084, 1.859434, 0.8979244, 1, 0, 0.8470588, 1,
1.032901, 1.528049, 0.6026516, 1, 0, 0.8392157, 1,
1.035745, -0.9607089, 3.789674, 1, 0, 0.8352941, 1,
1.049838, 1.004614, -0.9192761, 1, 0, 0.827451, 1,
1.050011, 0.3882782, 0.5456601, 1, 0, 0.8235294, 1,
1.051625, 0.3286482, 1.06844, 1, 0, 0.8156863, 1,
1.065227, -1.655401, 1.382679, 1, 0, 0.8117647, 1,
1.075829, -0.1396843, 2.695724, 1, 0, 0.8039216, 1,
1.078634, -1.144107, 1.330924, 1, 0, 0.7960784, 1,
1.079208, 0.04701491, 0.761773, 1, 0, 0.7921569, 1,
1.082191, 0.2463342, 0.41908, 1, 0, 0.7843137, 1,
1.082865, -1.38713, 1.087231, 1, 0, 0.7803922, 1,
1.083069, -1.737918, 3.538324, 1, 0, 0.772549, 1,
1.084675, 1.373797, 1.322192, 1, 0, 0.7686275, 1,
1.088254, 0.1260423, 0.4625154, 1, 0, 0.7607843, 1,
1.101439, -1.071317, 2.639844, 1, 0, 0.7568628, 1,
1.101911, 0.1883746, 0.1975114, 1, 0, 0.7490196, 1,
1.103583, 1.578092, 0.6987929, 1, 0, 0.7450981, 1,
1.103955, 0.03839407, 0.4966682, 1, 0, 0.7372549, 1,
1.109465, 0.0270122, 1.645814, 1, 0, 0.7333333, 1,
1.11003, -0.5321981, 1.069625, 1, 0, 0.7254902, 1,
1.124121, -0.1058168, 1.464119, 1, 0, 0.7215686, 1,
1.13512, 1.227145, 2.344969, 1, 0, 0.7137255, 1,
1.153015, 0.249085, 2.201259, 1, 0, 0.7098039, 1,
1.155006, 0.7149113, 1.694851, 1, 0, 0.7019608, 1,
1.168098, 2.270529, 0.4872598, 1, 0, 0.6941177, 1,
1.16952, 0.0400615, 1.362961, 1, 0, 0.6901961, 1,
1.171245, -0.678136, 0.4829746, 1, 0, 0.682353, 1,
1.172659, 1.193349, 0.0656369, 1, 0, 0.6784314, 1,
1.178279, 0.9704481, 0.7021593, 1, 0, 0.6705883, 1,
1.178725, -0.7697707, 1.198764, 1, 0, 0.6666667, 1,
1.183456, 0.6270013, 0.517284, 1, 0, 0.6588235, 1,
1.192029, 1.278267, 0.7863009, 1, 0, 0.654902, 1,
1.196765, -0.6445989, 1.436433, 1, 0, 0.6470588, 1,
1.202614, -0.4102471, 0.9852327, 1, 0, 0.6431373, 1,
1.208334, 2.093455, 0.9063501, 1, 0, 0.6352941, 1,
1.209286, -1.645705, 1.865889, 1, 0, 0.6313726, 1,
1.213638, -0.381429, 1.16139, 1, 0, 0.6235294, 1,
1.215636, -0.06034028, 1.404477, 1, 0, 0.6196079, 1,
1.224611, -0.3390644, 0.2752028, 1, 0, 0.6117647, 1,
1.230603, 2.229566, 0.8619871, 1, 0, 0.6078432, 1,
1.239125, 0.2640147, 2.561644, 1, 0, 0.6, 1,
1.257956, 0.1504172, 1.850685, 1, 0, 0.5921569, 1,
1.259776, -1.605371, 2.186475, 1, 0, 0.5882353, 1,
1.270536, -0.9901166, 2.026158, 1, 0, 0.5803922, 1,
1.293064, 1.615488, -0.3680145, 1, 0, 0.5764706, 1,
1.293797, -0.1259822, 1.483577, 1, 0, 0.5686275, 1,
1.296208, -0.4488138, 4.356573, 1, 0, 0.5647059, 1,
1.297032, 0.4225708, 3.361475, 1, 0, 0.5568628, 1,
1.300031, -0.2912412, 2.245741, 1, 0, 0.5529412, 1,
1.309393, 1.278083, 0.6598901, 1, 0, 0.5450981, 1,
1.314728, -1.185485, 2.317326, 1, 0, 0.5411765, 1,
1.320018, 0.820289, 0.08258498, 1, 0, 0.5333334, 1,
1.322891, -1.079731, 1.749388, 1, 0, 0.5294118, 1,
1.340091, 0.4935358, 1.455459, 1, 0, 0.5215687, 1,
1.345308, 1.06702, -0.08574691, 1, 0, 0.5176471, 1,
1.356632, 0.4700511, 0.696289, 1, 0, 0.509804, 1,
1.367108, -0.1984815, 2.56473, 1, 0, 0.5058824, 1,
1.367891, 0.432158, -0.5737699, 1, 0, 0.4980392, 1,
1.370763, -0.734772, 1.412644, 1, 0, 0.4901961, 1,
1.397743, 1.640188, 0.7055696, 1, 0, 0.4862745, 1,
1.410242, 1.320048, 0.652092, 1, 0, 0.4784314, 1,
1.415485, -0.4614395, 2.309475, 1, 0, 0.4745098, 1,
1.425914, 0.9284744, 1.122705, 1, 0, 0.4666667, 1,
1.42904, -0.7184411, 3.858386, 1, 0, 0.4627451, 1,
1.429795, 1.151035, 0.6743134, 1, 0, 0.454902, 1,
1.434966, -0.7008924, 1.902032, 1, 0, 0.4509804, 1,
1.44523, -2.313131, 2.075668, 1, 0, 0.4431373, 1,
1.445506, 1.191036, 2.816802, 1, 0, 0.4392157, 1,
1.449344, -0.7831761, 2.738503, 1, 0, 0.4313726, 1,
1.452872, 1.325642, 0.3749064, 1, 0, 0.427451, 1,
1.453162, 1.030725, 0.5289552, 1, 0, 0.4196078, 1,
1.461576, -0.8845652, 1.408743, 1, 0, 0.4156863, 1,
1.483101, 0.6861251, -1.449018, 1, 0, 0.4078431, 1,
1.489873, -0.2633255, 1.626459, 1, 0, 0.4039216, 1,
1.49077, 0.1667648, 0.6150611, 1, 0, 0.3960784, 1,
1.492619, 0.07668784, 1.062561, 1, 0, 0.3882353, 1,
1.50549, 1.107853, 0.04369311, 1, 0, 0.3843137, 1,
1.505809, 1.82029, 0.2744609, 1, 0, 0.3764706, 1,
1.509011, 0.1329357, 0.4099201, 1, 0, 0.372549, 1,
1.509159, -0.9833177, 3.70783, 1, 0, 0.3647059, 1,
1.509371, -1.696863, 1.668282, 1, 0, 0.3607843, 1,
1.528687, -0.7032317, 1.935696, 1, 0, 0.3529412, 1,
1.536191, 0.09930015, 1.545967, 1, 0, 0.3490196, 1,
1.550244, -0.7472617, 0.3412274, 1, 0, 0.3411765, 1,
1.560491, 0.2631701, 0.6407916, 1, 0, 0.3372549, 1,
1.565943, 0.6885694, 3.283895, 1, 0, 0.3294118, 1,
1.56885, 0.5101507, 1.701907, 1, 0, 0.3254902, 1,
1.572583, -0.2318473, 2.375416, 1, 0, 0.3176471, 1,
1.583144, 2.120713, 0.547688, 1, 0, 0.3137255, 1,
1.593757, -0.4965855, 0.8197044, 1, 0, 0.3058824, 1,
1.59523, -1.191408, 2.583794, 1, 0, 0.2980392, 1,
1.596229, 2.110064, 0.7986796, 1, 0, 0.2941177, 1,
1.596988, 0.2122123, 0.07389081, 1, 0, 0.2862745, 1,
1.625906, 0.4793645, 0.8433432, 1, 0, 0.282353, 1,
1.626771, 1.479961, -0.01959576, 1, 0, 0.2745098, 1,
1.646136, 0.6400908, 2.138404, 1, 0, 0.2705882, 1,
1.65281, 1.101965, -1.168499, 1, 0, 0.2627451, 1,
1.663714, 0.1436155, 1.640454, 1, 0, 0.2588235, 1,
1.672075, 1.464525, 1.859123, 1, 0, 0.2509804, 1,
1.677085, 1.916651, 1.13601, 1, 0, 0.2470588, 1,
1.687957, 1.743272, 2.225091, 1, 0, 0.2392157, 1,
1.704786, 1.391845, 0.9820578, 1, 0, 0.2352941, 1,
1.71685, 0.1346412, 1.658335, 1, 0, 0.227451, 1,
1.751072, -0.6832176, 4.423426, 1, 0, 0.2235294, 1,
1.759646, -1.81004, 2.671798, 1, 0, 0.2156863, 1,
1.776964, 0.3886109, 1.714806, 1, 0, 0.2117647, 1,
1.777474, 0.5501183, 0.2768279, 1, 0, 0.2039216, 1,
1.818701, -0.08348192, 3.053808, 1, 0, 0.1960784, 1,
1.841517, 0.1868751, 1.485383, 1, 0, 0.1921569, 1,
1.868727, -0.3987095, -0.021526, 1, 0, 0.1843137, 1,
1.888065, 1.021217, -0.1139227, 1, 0, 0.1803922, 1,
1.899754, -1.528559, 1.534885, 1, 0, 0.172549, 1,
1.916105, -0.5120818, 2.170676, 1, 0, 0.1686275, 1,
1.947822, 0.4112997, 3.607409, 1, 0, 0.1607843, 1,
1.967201, -1.008784, 2.811616, 1, 0, 0.1568628, 1,
1.982174, -0.5028708, 1.956954, 1, 0, 0.1490196, 1,
1.984756, -0.5286548, 0.6866189, 1, 0, 0.145098, 1,
1.997919, -1.285585, 0.426714, 1, 0, 0.1372549, 1,
2.016555, -0.2565107, -1.015794, 1, 0, 0.1333333, 1,
2.043263, 0.1701454, 1.795092, 1, 0, 0.1254902, 1,
2.083771, 0.3081782, 1.326692, 1, 0, 0.1215686, 1,
2.11285, -0.5247746, 1.371457, 1, 0, 0.1137255, 1,
2.158143, -0.6182522, 1.347349, 1, 0, 0.1098039, 1,
2.18271, -0.7503294, 1.953424, 1, 0, 0.1019608, 1,
2.241912, 1.172704, -0.6029581, 1, 0, 0.09411765, 1,
2.258153, -1.263271, 3.103084, 1, 0, 0.09019608, 1,
2.276319, 0.560499, 1.081015, 1, 0, 0.08235294, 1,
2.293969, -0.4596373, 1.241903, 1, 0, 0.07843138, 1,
2.315419, 0.2837978, 2.012963, 1, 0, 0.07058824, 1,
2.380293, 1.887159, 1.756496, 1, 0, 0.06666667, 1,
2.387444, -1.960658, 0.9676936, 1, 0, 0.05882353, 1,
2.395236, -1.653133, 2.148628, 1, 0, 0.05490196, 1,
2.433557, -0.2602924, 2.056024, 1, 0, 0.04705882, 1,
2.499205, -0.4440273, 1.530978, 1, 0, 0.04313726, 1,
2.855837, 1.658349, 1.97537, 1, 0, 0.03529412, 1,
2.907869, -0.653528, 0.3719333, 1, 0, 0.03137255, 1,
2.923816, -1.108585, 1.275282, 1, 0, 0.02352941, 1,
2.96617, -0.33207, 2.144846, 1, 0, 0.01960784, 1,
3.150354, -0.05815472, -0.8439461, 1, 0, 0.01176471, 1,
3.747667, -0.3967881, -1.118614, 1, 0, 0.007843138, 1
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
0.4317929, -4.07546, -6.772383, 0, -0.5, 0.5, 0.5,
0.4317929, -4.07546, -6.772383, 1, -0.5, 0.5, 0.5,
0.4317929, -4.07546, -6.772383, 1, 1.5, 0.5, 0.5,
0.4317929, -4.07546, -6.772383, 0, 1.5, 0.5, 0.5
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
-4.008162, -0.06053853, -6.772383, 0, -0.5, 0.5, 0.5,
-4.008162, -0.06053853, -6.772383, 1, -0.5, 0.5, 0.5,
-4.008162, -0.06053853, -6.772383, 1, 1.5, 0.5, 0.5,
-4.008162, -0.06053853, -6.772383, 0, 1.5, 0.5, 0.5
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
-4.008162, -4.07546, 0.1907852, 0, -0.5, 0.5, 0.5,
-4.008162, -4.07546, 0.1907852, 1, -0.5, 0.5, 0.5,
-4.008162, -4.07546, 0.1907852, 1, 1.5, 0.5, 0.5,
-4.008162, -4.07546, 0.1907852, 0, 1.5, 0.5, 0.5
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
-2, -3.14894, -5.165498,
3, -3.14894, -5.165498,
-2, -3.14894, -5.165498,
-2, -3.30336, -5.433312,
-1, -3.14894, -5.165498,
-1, -3.30336, -5.433312,
0, -3.14894, -5.165498,
0, -3.30336, -5.433312,
1, -3.14894, -5.165498,
1, -3.30336, -5.433312,
2, -3.14894, -5.165498,
2, -3.30336, -5.433312,
3, -3.14894, -5.165498,
3, -3.30336, -5.433312
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
-2, -3.6122, -5.968941, 0, -0.5, 0.5, 0.5,
-2, -3.6122, -5.968941, 1, -0.5, 0.5, 0.5,
-2, -3.6122, -5.968941, 1, 1.5, 0.5, 0.5,
-2, -3.6122, -5.968941, 0, 1.5, 0.5, 0.5,
-1, -3.6122, -5.968941, 0, -0.5, 0.5, 0.5,
-1, -3.6122, -5.968941, 1, -0.5, 0.5, 0.5,
-1, -3.6122, -5.968941, 1, 1.5, 0.5, 0.5,
-1, -3.6122, -5.968941, 0, 1.5, 0.5, 0.5,
0, -3.6122, -5.968941, 0, -0.5, 0.5, 0.5,
0, -3.6122, -5.968941, 1, -0.5, 0.5, 0.5,
0, -3.6122, -5.968941, 1, 1.5, 0.5, 0.5,
0, -3.6122, -5.968941, 0, 1.5, 0.5, 0.5,
1, -3.6122, -5.968941, 0, -0.5, 0.5, 0.5,
1, -3.6122, -5.968941, 1, -0.5, 0.5, 0.5,
1, -3.6122, -5.968941, 1, 1.5, 0.5, 0.5,
1, -3.6122, -5.968941, 0, 1.5, 0.5, 0.5,
2, -3.6122, -5.968941, 0, -0.5, 0.5, 0.5,
2, -3.6122, -5.968941, 1, -0.5, 0.5, 0.5,
2, -3.6122, -5.968941, 1, 1.5, 0.5, 0.5,
2, -3.6122, -5.968941, 0, 1.5, 0.5, 0.5,
3, -3.6122, -5.968941, 0, -0.5, 0.5, 0.5,
3, -3.6122, -5.968941, 1, -0.5, 0.5, 0.5,
3, -3.6122, -5.968941, 1, 1.5, 0.5, 0.5,
3, -3.6122, -5.968941, 0, 1.5, 0.5, 0.5
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
-2.983557, -3, -5.165498,
-2.983557, 2, -5.165498,
-2.983557, -3, -5.165498,
-3.154325, -3, -5.433312,
-2.983557, -2, -5.165498,
-3.154325, -2, -5.433312,
-2.983557, -1, -5.165498,
-3.154325, -1, -5.433312,
-2.983557, 0, -5.165498,
-3.154325, 0, -5.433312,
-2.983557, 1, -5.165498,
-3.154325, 1, -5.433312,
-2.983557, 2, -5.165498,
-3.154325, 2, -5.433312
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
-3.49586, -3, -5.968941, 0, -0.5, 0.5, 0.5,
-3.49586, -3, -5.968941, 1, -0.5, 0.5, 0.5,
-3.49586, -3, -5.968941, 1, 1.5, 0.5, 0.5,
-3.49586, -3, -5.968941, 0, 1.5, 0.5, 0.5,
-3.49586, -2, -5.968941, 0, -0.5, 0.5, 0.5,
-3.49586, -2, -5.968941, 1, -0.5, 0.5, 0.5,
-3.49586, -2, -5.968941, 1, 1.5, 0.5, 0.5,
-3.49586, -2, -5.968941, 0, 1.5, 0.5, 0.5,
-3.49586, -1, -5.968941, 0, -0.5, 0.5, 0.5,
-3.49586, -1, -5.968941, 1, -0.5, 0.5, 0.5,
-3.49586, -1, -5.968941, 1, 1.5, 0.5, 0.5,
-3.49586, -1, -5.968941, 0, 1.5, 0.5, 0.5,
-3.49586, 0, -5.968941, 0, -0.5, 0.5, 0.5,
-3.49586, 0, -5.968941, 1, -0.5, 0.5, 0.5,
-3.49586, 0, -5.968941, 1, 1.5, 0.5, 0.5,
-3.49586, 0, -5.968941, 0, 1.5, 0.5, 0.5,
-3.49586, 1, -5.968941, 0, -0.5, 0.5, 0.5,
-3.49586, 1, -5.968941, 1, -0.5, 0.5, 0.5,
-3.49586, 1, -5.968941, 1, 1.5, 0.5, 0.5,
-3.49586, 1, -5.968941, 0, 1.5, 0.5, 0.5,
-3.49586, 2, -5.968941, 0, -0.5, 0.5, 0.5,
-3.49586, 2, -5.968941, 1, -0.5, 0.5, 0.5,
-3.49586, 2, -5.968941, 1, 1.5, 0.5, 0.5,
-3.49586, 2, -5.968941, 0, 1.5, 0.5, 0.5
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
-2.983557, -3.14894, -4,
-2.983557, -3.14894, 4,
-2.983557, -3.14894, -4,
-3.154325, -3.30336, -4,
-2.983557, -3.14894, -2,
-3.154325, -3.30336, -2,
-2.983557, -3.14894, 0,
-3.154325, -3.30336, 0,
-2.983557, -3.14894, 2,
-3.154325, -3.30336, 2,
-2.983557, -3.14894, 4,
-3.154325, -3.30336, 4
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
-3.49586, -3.6122, -4, 0, -0.5, 0.5, 0.5,
-3.49586, -3.6122, -4, 1, -0.5, 0.5, 0.5,
-3.49586, -3.6122, -4, 1, 1.5, 0.5, 0.5,
-3.49586, -3.6122, -4, 0, 1.5, 0.5, 0.5,
-3.49586, -3.6122, -2, 0, -0.5, 0.5, 0.5,
-3.49586, -3.6122, -2, 1, -0.5, 0.5, 0.5,
-3.49586, -3.6122, -2, 1, 1.5, 0.5, 0.5,
-3.49586, -3.6122, -2, 0, 1.5, 0.5, 0.5,
-3.49586, -3.6122, 0, 0, -0.5, 0.5, 0.5,
-3.49586, -3.6122, 0, 1, -0.5, 0.5, 0.5,
-3.49586, -3.6122, 0, 1, 1.5, 0.5, 0.5,
-3.49586, -3.6122, 0, 0, 1.5, 0.5, 0.5,
-3.49586, -3.6122, 2, 0, -0.5, 0.5, 0.5,
-3.49586, -3.6122, 2, 1, -0.5, 0.5, 0.5,
-3.49586, -3.6122, 2, 1, 1.5, 0.5, 0.5,
-3.49586, -3.6122, 2, 0, 1.5, 0.5, 0.5,
-3.49586, -3.6122, 4, 0, -0.5, 0.5, 0.5,
-3.49586, -3.6122, 4, 1, -0.5, 0.5, 0.5,
-3.49586, -3.6122, 4, 1, 1.5, 0.5, 0.5,
-3.49586, -3.6122, 4, 0, 1.5, 0.5, 0.5
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
-2.983557, -3.14894, -5.165498,
-2.983557, 3.027863, -5.165498,
-2.983557, -3.14894, 5.547069,
-2.983557, 3.027863, 5.547069,
-2.983557, -3.14894, -5.165498,
-2.983557, -3.14894, 5.547069,
-2.983557, 3.027863, -5.165498,
-2.983557, 3.027863, 5.547069,
-2.983557, -3.14894, -5.165498,
3.847143, -3.14894, -5.165498,
-2.983557, -3.14894, 5.547069,
3.847143, -3.14894, 5.547069,
-2.983557, 3.027863, -5.165498,
3.847143, 3.027863, -5.165498,
-2.983557, 3.027863, 5.547069,
3.847143, 3.027863, 5.547069,
3.847143, -3.14894, -5.165498,
3.847143, 3.027863, -5.165498,
3.847143, -3.14894, 5.547069,
3.847143, 3.027863, 5.547069,
3.847143, -3.14894, -5.165498,
3.847143, -3.14894, 5.547069,
3.847143, 3.027863, -5.165498,
3.847143, 3.027863, 5.547069
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
var radius = 7.543512;
var distance = 33.56194;
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
mvMatrix.translate( -0.4317929, 0.06053853, -0.1907852 );
mvMatrix.scale( 1.194049, 1.320456, 0.7613668 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.56194);
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
tebuthiuron<-read.table("tebuthiuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tebuthiuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'tebuthiuron' not found
```

```r
y<-tebuthiuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'tebuthiuron' not found
```

```r
z<-tebuthiuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'tebuthiuron' not found
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
-2.884081, -0.5833833, -3.020135, 0, 0, 1, 1, 1,
-2.882196, 0.4315286, -1.489769, 1, 0, 0, 1, 1,
-2.831973, -1.1806, -3.580815, 1, 0, 0, 1, 1,
-2.663184, 0.7441594, -0.2777251, 1, 0, 0, 1, 1,
-2.603834, -1.816666, -1.269025, 1, 0, 0, 1, 1,
-2.514746, -0.2327179, -0.8302039, 1, 0, 0, 1, 1,
-2.501811, -0.2485408, -1.096881, 0, 0, 0, 1, 1,
-2.314384, 1.330687, -1.249864, 0, 0, 0, 1, 1,
-2.313554, -1.115483, -1.869292, 0, 0, 0, 1, 1,
-2.300683, 0.2314042, -3.003429, 0, 0, 0, 1, 1,
-2.297503, -0.5274121, -2.767023, 0, 0, 0, 1, 1,
-2.295976, -0.3725572, -1.028845, 0, 0, 0, 1, 1,
-2.224982, 1.29664, -1.724637, 0, 0, 0, 1, 1,
-2.190564, 1.044943, -0.8592618, 1, 1, 1, 1, 1,
-2.179351, 1.455108, 0.2484882, 1, 1, 1, 1, 1,
-2.157548, -0.4777619, -1.258714, 1, 1, 1, 1, 1,
-2.122715, -0.3375373, -1.341086, 1, 1, 1, 1, 1,
-2.120885, -0.8499646, -1.566693, 1, 1, 1, 1, 1,
-2.084765, -1.238198, -2.538306, 1, 1, 1, 1, 1,
-2.053868, 0.743292, -2.302696, 1, 1, 1, 1, 1,
-2.046537, 1.046054, -1.624013, 1, 1, 1, 1, 1,
-2.045417, 0.6223486, -2.274352, 1, 1, 1, 1, 1,
-2.032092, 1.477705, -0.6637186, 1, 1, 1, 1, 1,
-2.024922, 1.491956, 1.158638, 1, 1, 1, 1, 1,
-2.014484, -0.9999076, -2.042714, 1, 1, 1, 1, 1,
-2.014431, 1.235195, -1.285788, 1, 1, 1, 1, 1,
-1.995888, -1.409585, -2.525305, 1, 1, 1, 1, 1,
-1.973405, 1.25621, -1.098748, 1, 1, 1, 1, 1,
-1.96981, 1.252854, -1.600534, 0, 0, 1, 1, 1,
-1.953949, -0.2816455, -1.047807, 1, 0, 0, 1, 1,
-1.905919, 0.6152142, -1.208779, 1, 0, 0, 1, 1,
-1.864052, -2.070363, -3.871966, 1, 0, 0, 1, 1,
-1.857954, 1.507041, -1.175523, 1, 0, 0, 1, 1,
-1.84978, -0.4119106, -2.125393, 1, 0, 0, 1, 1,
-1.833586, -1.945124, -2.501951, 0, 0, 0, 1, 1,
-1.81487, -0.2328804, -2.678574, 0, 0, 0, 1, 1,
-1.812138, -0.566679, -3.348603, 0, 0, 0, 1, 1,
-1.811761, -0.4795713, -3.224592, 0, 0, 0, 1, 1,
-1.777553, 0.3343885, -0.2641124, 0, 0, 0, 1, 1,
-1.772228, 0.9427595, -0.231931, 0, 0, 0, 1, 1,
-1.77008, 0.1845755, -0.004922006, 0, 0, 0, 1, 1,
-1.765803, 0.7957, -2.044945, 1, 1, 1, 1, 1,
-1.756586, -0.2092929, -1.882669, 1, 1, 1, 1, 1,
-1.749023, 0.6057721, -2.7394, 1, 1, 1, 1, 1,
-1.745603, -1.039103, -1.31771, 1, 1, 1, 1, 1,
-1.738911, 0.8772794, -0.9275941, 1, 1, 1, 1, 1,
-1.703609, -1.062, -2.89874, 1, 1, 1, 1, 1,
-1.694116, 0.1948208, -1.105374, 1, 1, 1, 1, 1,
-1.68654, 0.4340658, -3.21277, 1, 1, 1, 1, 1,
-1.678784, 0.6355203, -1.290885, 1, 1, 1, 1, 1,
-1.670596, 0.4983024, -1.517677, 1, 1, 1, 1, 1,
-1.661017, -0.6230487, -1.05563, 1, 1, 1, 1, 1,
-1.657764, 0.6708698, -1.047036, 1, 1, 1, 1, 1,
-1.657626, 0.3381713, -1.91664, 1, 1, 1, 1, 1,
-1.65016, 2.121653, -1.520696, 1, 1, 1, 1, 1,
-1.621256, -1.107517, -2.359909, 1, 1, 1, 1, 1,
-1.61951, -0.4043559, -1.086496, 0, 0, 1, 1, 1,
-1.61924, -0.2904896, -1.973396, 1, 0, 0, 1, 1,
-1.615979, 0.5217637, 0.08586261, 1, 0, 0, 1, 1,
-1.612111, -0.5641245, -1.342117, 1, 0, 0, 1, 1,
-1.60618, 0.1590571, -2.015959, 1, 0, 0, 1, 1,
-1.60521, -0.2655202, -1.603868, 1, 0, 0, 1, 1,
-1.604853, 0.6072433, -1.891743, 0, 0, 0, 1, 1,
-1.601722, -0.3682605, -1.244052, 0, 0, 0, 1, 1,
-1.593774, -0.5077662, -2.506557, 0, 0, 0, 1, 1,
-1.589234, -0.1633056, -1.163159, 0, 0, 0, 1, 1,
-1.569163, -1.155519, -2.355063, 0, 0, 0, 1, 1,
-1.56812, 1.679436, -1.408094, 0, 0, 0, 1, 1,
-1.567053, -0.8050707, -1.237086, 0, 0, 0, 1, 1,
-1.547421, -0.5610483, -1.265792, 1, 1, 1, 1, 1,
-1.545191, -0.2948688, -1.59095, 1, 1, 1, 1, 1,
-1.537453, 1.034568, -1.015227, 1, 1, 1, 1, 1,
-1.532385, 0.7580405, -0.3562333, 1, 1, 1, 1, 1,
-1.524299, 0.03222003, -2.005534, 1, 1, 1, 1, 1,
-1.519569, -1.653389, -2.193608, 1, 1, 1, 1, 1,
-1.519449, 1.139904, 1.536789, 1, 1, 1, 1, 1,
-1.499243, 0.2020849, -2.281806, 1, 1, 1, 1, 1,
-1.495972, 0.8262424, 0.930533, 1, 1, 1, 1, 1,
-1.489103, -0.7566568, -3.152663, 1, 1, 1, 1, 1,
-1.468877, 0.4281845, -1.878171, 1, 1, 1, 1, 1,
-1.462787, -0.614132, -3.708797, 1, 1, 1, 1, 1,
-1.454126, 0.01281505, -1.576709, 1, 1, 1, 1, 1,
-1.453367, -0.6700195, -2.412607, 1, 1, 1, 1, 1,
-1.451525, -0.624521, -2.118453, 1, 1, 1, 1, 1,
-1.444266, 0.005909709, -1.610226, 0, 0, 1, 1, 1,
-1.430634, -0.9460315, -3.86583, 1, 0, 0, 1, 1,
-1.426345, 0.467065, -1.919116, 1, 0, 0, 1, 1,
-1.42545, 0.3126082, -0.7399833, 1, 0, 0, 1, 1,
-1.419908, -0.4068904, -1.428555, 1, 0, 0, 1, 1,
-1.414595, -0.2670184, -2.424384, 1, 0, 0, 1, 1,
-1.411597, -0.1168589, 0.05526676, 0, 0, 0, 1, 1,
-1.383453, -1.236608, -2.822147, 0, 0, 0, 1, 1,
-1.381704, -0.5125394, -2.353027, 0, 0, 0, 1, 1,
-1.366937, 1.134772, -0.06028887, 0, 0, 0, 1, 1,
-1.363741, -0.5091221, -2.110776, 0, 0, 0, 1, 1,
-1.356857, 1.622597, 0.03588197, 0, 0, 0, 1, 1,
-1.355291, 0.2032171, 0.3420746, 0, 0, 0, 1, 1,
-1.343676, 0.5921427, 0.9832005, 1, 1, 1, 1, 1,
-1.334019, 0.8561379, -1.966438, 1, 1, 1, 1, 1,
-1.333785, -0.1288367, -0.8382469, 1, 1, 1, 1, 1,
-1.333413, -0.6246017, -2.537007, 1, 1, 1, 1, 1,
-1.329683, -2.058675, -2.380761, 1, 1, 1, 1, 1,
-1.32749, 0.2520272, -2.094989, 1, 1, 1, 1, 1,
-1.326271, 0.5692463, -0.5017887, 1, 1, 1, 1, 1,
-1.325564, -1.888158, -1.847177, 1, 1, 1, 1, 1,
-1.324614, 2.937909, -1.516994, 1, 1, 1, 1, 1,
-1.322557, -0.3003376, -1.260072, 1, 1, 1, 1, 1,
-1.315199, -1.071512, -0.6794497, 1, 1, 1, 1, 1,
-1.315117, 0.4738062, -1.082507, 1, 1, 1, 1, 1,
-1.312374, 1.386258, -0.6437617, 1, 1, 1, 1, 1,
-1.308782, -1.274845, -1.543407, 1, 1, 1, 1, 1,
-1.303663, -0.1455891, -1.707596, 1, 1, 1, 1, 1,
-1.289592, 0.6215214, -2.327729, 0, 0, 1, 1, 1,
-1.285253, 0.426219, -0.955832, 1, 0, 0, 1, 1,
-1.28216, -0.563497, -1.175113, 1, 0, 0, 1, 1,
-1.278975, 0.5771118, -0.5740958, 1, 0, 0, 1, 1,
-1.273866, 0.4387608, 0.4195516, 1, 0, 0, 1, 1,
-1.267492, -0.9510972, -1.448381, 1, 0, 0, 1, 1,
-1.26636, -0.03828426, -1.138845, 0, 0, 0, 1, 1,
-1.265098, -0.08804137, -1.932564, 0, 0, 0, 1, 1,
-1.263925, -0.6453384, -1.139294, 0, 0, 0, 1, 1,
-1.259618, 0.2259388, -1.019493, 0, 0, 0, 1, 1,
-1.25857, 0.7269895, -1.416224, 0, 0, 0, 1, 1,
-1.255594, -1.225312, -5.00949, 0, 0, 0, 1, 1,
-1.232632, -0.0485002, -2.014012, 0, 0, 0, 1, 1,
-1.21257, 1.322091, -0.2529417, 1, 1, 1, 1, 1,
-1.204258, 0.9882425, 0.3349003, 1, 1, 1, 1, 1,
-1.203353, -0.5691386, -2.7068, 1, 1, 1, 1, 1,
-1.198607, 2.632698, -0.4336784, 1, 1, 1, 1, 1,
-1.185462, -0.3827591, -2.893194, 1, 1, 1, 1, 1,
-1.179893, 0.03696967, -0.8257688, 1, 1, 1, 1, 1,
-1.176559, -1.005895, -1.711321, 1, 1, 1, 1, 1,
-1.174136, 0.174409, -1.061454, 1, 1, 1, 1, 1,
-1.167444, -0.5289024, 0.3658135, 1, 1, 1, 1, 1,
-1.165179, 0.05647301, -2.144657, 1, 1, 1, 1, 1,
-1.159901, 1.104305, -0.9341618, 1, 1, 1, 1, 1,
-1.152767, 0.6659062, -0.4001761, 1, 1, 1, 1, 1,
-1.14965, -1.338415, -4.319609, 1, 1, 1, 1, 1,
-1.145016, 0.1019812, -1.066555, 1, 1, 1, 1, 1,
-1.143502, 0.7003189, 0.6120881, 1, 1, 1, 1, 1,
-1.139752, -0.2081088, -0.7430866, 0, 0, 1, 1, 1,
-1.129535, -0.8595855, -2.76347, 1, 0, 0, 1, 1,
-1.126931, -1.464865, -2.519367, 1, 0, 0, 1, 1,
-1.12668, 1.064269, -2.420087, 1, 0, 0, 1, 1,
-1.118269, 1.417301, -0.2643549, 1, 0, 0, 1, 1,
-1.114494, -0.005114049, 0.3081709, 1, 0, 0, 1, 1,
-1.113862, 0.1174106, 0.1246495, 0, 0, 0, 1, 1,
-1.113623, -0.1318793, -3.608572, 0, 0, 0, 1, 1,
-1.094054, -0.3337573, -2.697356, 0, 0, 0, 1, 1,
-1.090935, 0.5513743, -2.204379, 0, 0, 0, 1, 1,
-1.088739, -0.2359702, -1.805237, 0, 0, 0, 1, 1,
-1.08517, -0.5888894, -3.268359, 0, 0, 0, 1, 1,
-1.076069, -0.6637868, -2.560932, 0, 0, 0, 1, 1,
-1.075206, 1.050255, -0.05306717, 1, 1, 1, 1, 1,
-1.073394, -0.8260036, -3.134934, 1, 1, 1, 1, 1,
-1.066345, -0.3725089, -2.420911, 1, 1, 1, 1, 1,
-1.064454, 0.2705242, -2.590955, 1, 1, 1, 1, 1,
-1.05716, 1.047667, -2.254252, 1, 1, 1, 1, 1,
-1.056396, 0.4965218, -0.3796424, 1, 1, 1, 1, 1,
-1.05418, 1.340884, -0.4493974, 1, 1, 1, 1, 1,
-1.050711, 0.9864755, 0.6933136, 1, 1, 1, 1, 1,
-1.037722, 0.3650867, -1.43222, 1, 1, 1, 1, 1,
-1.035044, -0.6576325, -2.48115, 1, 1, 1, 1, 1,
-1.030904, 0.2584149, -1.271835, 1, 1, 1, 1, 1,
-1.027314, -1.194073, -1.129017, 1, 1, 1, 1, 1,
-1.02684, -0.03567133, -1.081544, 1, 1, 1, 1, 1,
-1.024432, 0.6249763, -0.4635474, 1, 1, 1, 1, 1,
-1.021838, -0.3548511, -3.683703, 1, 1, 1, 1, 1,
-1.006144, 0.05181179, -0.9639578, 0, 0, 1, 1, 1,
-1.005274, -0.4562875, -0.9391363, 1, 0, 0, 1, 1,
-0.9909105, -0.950704, -3.170471, 1, 0, 0, 1, 1,
-0.9815429, -0.5064252, -1.69393, 1, 0, 0, 1, 1,
-0.9800115, -2.108105, -2.897266, 1, 0, 0, 1, 1,
-0.9671858, 0.04578293, -0.6730152, 1, 0, 0, 1, 1,
-0.9639817, 1.917946, -0.5603805, 0, 0, 0, 1, 1,
-0.9554054, 0.4716769, -2.793457, 0, 0, 0, 1, 1,
-0.9505913, -1.311182, -2.557539, 0, 0, 0, 1, 1,
-0.9497154, 0.8948264, -1.608521, 0, 0, 0, 1, 1,
-0.9490587, 0.7088062, -0.396935, 0, 0, 0, 1, 1,
-0.9417694, 1.659017, 0.2959264, 0, 0, 0, 1, 1,
-0.9408631, 0.6900163, -2.667553, 0, 0, 0, 1, 1,
-0.9403276, -0.4695606, -2.274371, 1, 1, 1, 1, 1,
-0.9350075, 0.4449683, -2.586565, 1, 1, 1, 1, 1,
-0.9339717, 0.1966053, -2.399806, 1, 1, 1, 1, 1,
-0.9287874, -0.2235716, -0.6396766, 1, 1, 1, 1, 1,
-0.9256803, -1.973053, -1.052197, 1, 1, 1, 1, 1,
-0.9244587, 0.03320385, -1.731037, 1, 1, 1, 1, 1,
-0.9238145, -0.8722375, -1.885557, 1, 1, 1, 1, 1,
-0.9237567, 0.8649851, -0.06786548, 1, 1, 1, 1, 1,
-0.9212867, 0.03582674, 0.04553542, 1, 1, 1, 1, 1,
-0.9165027, -0.3029763, -3.005424, 1, 1, 1, 1, 1,
-0.9146252, 0.07243127, -2.594248, 1, 1, 1, 1, 1,
-0.9081601, -0.6292408, -4.106782, 1, 1, 1, 1, 1,
-0.9060681, -0.7802235, -2.267183, 1, 1, 1, 1, 1,
-0.9006978, -0.1283863, -0.8802624, 1, 1, 1, 1, 1,
-0.8986287, -0.4565099, -3.159351, 1, 1, 1, 1, 1,
-0.898615, -0.2120856, 0.2914459, 0, 0, 1, 1, 1,
-0.8966298, -0.1878044, -2.112633, 1, 0, 0, 1, 1,
-0.8916309, -1.135965, -2.136679, 1, 0, 0, 1, 1,
-0.8797497, 0.5402879, -1.947167, 1, 0, 0, 1, 1,
-0.8786378, 1.657896, 0.8771394, 1, 0, 0, 1, 1,
-0.8657762, 0.2877292, -0.5475109, 1, 0, 0, 1, 1,
-0.8652536, 0.6944707, -0.1882143, 0, 0, 0, 1, 1,
-0.8642752, 0.8180836, -0.6551533, 0, 0, 0, 1, 1,
-0.8585441, 0.2310837, -0.9177713, 0, 0, 0, 1, 1,
-0.8491164, -0.08935374, -2.15626, 0, 0, 0, 1, 1,
-0.8473186, -1.511657, -2.194082, 0, 0, 0, 1, 1,
-0.8468165, 0.6211113, -0.7918345, 0, 0, 0, 1, 1,
-0.8454648, 0.7320931, -0.893614, 0, 0, 0, 1, 1,
-0.8332113, 0.8560913, 0.406867, 1, 1, 1, 1, 1,
-0.8318692, 0.1834236, -2.172267, 1, 1, 1, 1, 1,
-0.8259271, 0.2418517, -2.304145, 1, 1, 1, 1, 1,
-0.8257693, 1.026303, -0.1659187, 1, 1, 1, 1, 1,
-0.8213938, -1.620126, -2.732233, 1, 1, 1, 1, 1,
-0.8190511, 1.098233, -1.307736, 1, 1, 1, 1, 1,
-0.8155131, -0.261081, -2.0864, 1, 1, 1, 1, 1,
-0.8111088, 0.584797, -1.159322, 1, 1, 1, 1, 1,
-0.8070132, 1.355228, -0.5680827, 1, 1, 1, 1, 1,
-0.8019549, -0.7636893, -1.26748, 1, 1, 1, 1, 1,
-0.7999549, 0.2341685, -1.471765, 1, 1, 1, 1, 1,
-0.7976895, -1.049263, -1.4884, 1, 1, 1, 1, 1,
-0.7965683, -0.3031906, -2.699678, 1, 1, 1, 1, 1,
-0.7930959, -0.9789132, -2.926123, 1, 1, 1, 1, 1,
-0.7905301, -1.760854, -4.612544, 1, 1, 1, 1, 1,
-0.7889494, -0.2316376, -1.97405, 0, 0, 1, 1, 1,
-0.7869465, 0.2990263, -0.0471402, 1, 0, 0, 1, 1,
-0.7856291, -1.543529, -3.177572, 1, 0, 0, 1, 1,
-0.7834564, -0.5605336, -1.999796, 1, 0, 0, 1, 1,
-0.782046, 1.595858, -0.2775534, 1, 0, 0, 1, 1,
-0.7783849, 1.737822, -1.133043, 1, 0, 0, 1, 1,
-0.7748734, -0.3251712, -0.3775292, 0, 0, 0, 1, 1,
-0.7735828, 1.057248, -0.2381545, 0, 0, 0, 1, 1,
-0.7732601, -0.02589864, -2.291693, 0, 0, 0, 1, 1,
-0.7731304, 0.1678412, -0.9692199, 0, 0, 0, 1, 1,
-0.7652407, -1.048251, 0.4841643, 0, 0, 0, 1, 1,
-0.7614099, -0.3867293, -3.431472, 0, 0, 0, 1, 1,
-0.7569654, -1.904547, -3.388622, 0, 0, 0, 1, 1,
-0.7562598, -0.3682105, -2.703751, 1, 1, 1, 1, 1,
-0.7552918, -0.7816532, -2.136847, 1, 1, 1, 1, 1,
-0.7535277, 0.1381984, -2.44257, 1, 1, 1, 1, 1,
-0.7517301, -0.2319233, -0.5407097, 1, 1, 1, 1, 1,
-0.7511277, -0.6966422, -1.775858, 1, 1, 1, 1, 1,
-0.7507826, 0.3891781, -1.802215, 1, 1, 1, 1, 1,
-0.738947, -0.2854343, -3.286708, 1, 1, 1, 1, 1,
-0.7340726, -0.9607223, -2.107394, 1, 1, 1, 1, 1,
-0.7340236, 0.4147735, -1.784848, 1, 1, 1, 1, 1,
-0.7296671, -0.2182597, -2.709314, 1, 1, 1, 1, 1,
-0.7278014, -0.9073145, -1.830067, 1, 1, 1, 1, 1,
-0.7270191, -1.03694, -2.491576, 1, 1, 1, 1, 1,
-0.7238905, 0.234113, -2.772096, 1, 1, 1, 1, 1,
-0.7218394, 1.640477, -0.6929852, 1, 1, 1, 1, 1,
-0.7160782, 0.3424774, -0.692494, 1, 1, 1, 1, 1,
-0.7145581, -0.5353646, -1.778074, 0, 0, 1, 1, 1,
-0.7124199, -1.348671, -2.547299, 1, 0, 0, 1, 1,
-0.7117034, 0.2095752, -1.174402, 1, 0, 0, 1, 1,
-0.7116278, -0.6313415, -3.581182, 1, 0, 0, 1, 1,
-0.711614, 2.171259, -2.390714, 1, 0, 0, 1, 1,
-0.7096806, -1.823125, -1.942408, 1, 0, 0, 1, 1,
-0.7024745, 1.144839, 0.2057045, 0, 0, 0, 1, 1,
-0.7003123, 0.9569818, -1.965762, 0, 0, 0, 1, 1,
-0.6965141, -0.5207528, -2.496606, 0, 0, 0, 1, 1,
-0.693238, 0.3336388, -1.321617, 0, 0, 0, 1, 1,
-0.6926001, -0.2471404, 0.3013779, 0, 0, 0, 1, 1,
-0.6865305, -0.03513878, 1.537627, 0, 0, 0, 1, 1,
-0.6793231, 1.515012, -0.8455271, 0, 0, 0, 1, 1,
-0.6766087, -1.306951, -1.48647, 1, 1, 1, 1, 1,
-0.6725222, 1.302114, 2.559234, 1, 1, 1, 1, 1,
-0.6716286, 0.1952686, -2.249969, 1, 1, 1, 1, 1,
-0.6683009, -0.5259185, -0.7280736, 1, 1, 1, 1, 1,
-0.6586026, -1.1233, -2.035588, 1, 1, 1, 1, 1,
-0.6557482, -1.491142, -2.337143, 1, 1, 1, 1, 1,
-0.6529468, 0.4859009, -1.160937, 1, 1, 1, 1, 1,
-0.6518199, 0.5578697, -0.7754691, 1, 1, 1, 1, 1,
-0.6512673, 0.9648043, -1.175545, 1, 1, 1, 1, 1,
-0.6495076, -1.236796, -2.729519, 1, 1, 1, 1, 1,
-0.6457834, -0.7097681, -2.192679, 1, 1, 1, 1, 1,
-0.6455451, 0.152835, 0.4277706, 1, 1, 1, 1, 1,
-0.644127, -0.5545115, -2.580908, 1, 1, 1, 1, 1,
-0.643698, -1.260271, -2.084703, 1, 1, 1, 1, 1,
-0.6402298, 0.4930691, -2.511369, 1, 1, 1, 1, 1,
-0.6402131, -0.8885517, -1.522318, 0, 0, 1, 1, 1,
-0.638795, 0.4867616, -0.9313035, 1, 0, 0, 1, 1,
-0.6336293, -1.824943, -3.585828, 1, 0, 0, 1, 1,
-0.6324881, 0.9503978, 0.5959448, 1, 0, 0, 1, 1,
-0.6322535, 1.664693, -0.7166335, 1, 0, 0, 1, 1,
-0.6308471, 0.07990798, -0.7980309, 1, 0, 0, 1, 1,
-0.6293114, -0.4140056, -3.242562, 0, 0, 0, 1, 1,
-0.6291473, -1.978512, -3.524151, 0, 0, 0, 1, 1,
-0.6260564, 0.7269417, 1.911397, 0, 0, 0, 1, 1,
-0.6138343, 0.3391623, -1.223176, 0, 0, 0, 1, 1,
-0.6088249, 0.676953, 0.9240137, 0, 0, 0, 1, 1,
-0.6088026, -1.776832, -3.922933, 0, 0, 0, 1, 1,
-0.6074847, -0.1537049, -1.0999, 0, 0, 0, 1, 1,
-0.6001116, 0.1909164, -0.7829819, 1, 1, 1, 1, 1,
-0.5980808, -1.116611, -3.188259, 1, 1, 1, 1, 1,
-0.5918412, 0.2418842, -2.124988, 1, 1, 1, 1, 1,
-0.5883971, 1.318527, -0.3139084, 1, 1, 1, 1, 1,
-0.5880015, -0.2969302, -2.893122, 1, 1, 1, 1, 1,
-0.5876446, -2.206132, -3.096603, 1, 1, 1, 1, 1,
-0.5845537, -0.421494, -1.84919, 1, 1, 1, 1, 1,
-0.5809662, 0.3262257, -2.44297, 1, 1, 1, 1, 1,
-0.5807998, -1.54221, -3.920694, 1, 1, 1, 1, 1,
-0.5696924, 0.3892847, -2.834388, 1, 1, 1, 1, 1,
-0.5696557, 0.8394185, -0.7328546, 1, 1, 1, 1, 1,
-0.5669047, 0.1310098, -2.696783, 1, 1, 1, 1, 1,
-0.5633662, 0.05297104, -1.285234, 1, 1, 1, 1, 1,
-0.559783, -0.7636104, -1.180368, 1, 1, 1, 1, 1,
-0.5583697, 0.276829, -2.130376, 1, 1, 1, 1, 1,
-0.5581359, 0.2529073, -0.5806221, 0, 0, 1, 1, 1,
-0.5568081, 0.8842615, -1.178279, 1, 0, 0, 1, 1,
-0.5566725, 0.9859408, -0.7441434, 1, 0, 0, 1, 1,
-0.5528077, 0.7638527, -0.7948297, 1, 0, 0, 1, 1,
-0.5500898, 0.3649599, -0.8503953, 1, 0, 0, 1, 1,
-0.5466225, -1.273881, -1.106974, 1, 0, 0, 1, 1,
-0.5460905, 0.3716963, -1.884105, 0, 0, 0, 1, 1,
-0.5458787, -0.9738002, -1.616585, 0, 0, 0, 1, 1,
-0.5449271, -0.05749158, -1.02509, 0, 0, 0, 1, 1,
-0.544308, -1.035526, -4.568738, 0, 0, 0, 1, 1,
-0.5433767, -1.811116, -2.904199, 0, 0, 0, 1, 1,
-0.5408316, -1.270988, -1.538107, 0, 0, 0, 1, 1,
-0.5387203, -1.506847, -2.654362, 0, 0, 0, 1, 1,
-0.5386574, -0.5195274, -2.204086, 1, 1, 1, 1, 1,
-0.5341129, -0.6408252, -2.479796, 1, 1, 1, 1, 1,
-0.5331475, -1.444009, -3.35145, 1, 1, 1, 1, 1,
-0.5317525, 0.4169354, -1.481998, 1, 1, 1, 1, 1,
-0.5311759, 0.758015, -0.2025816, 1, 1, 1, 1, 1,
-0.528618, -0.324198, -1.613456, 1, 1, 1, 1, 1,
-0.5267818, -0.3673781, -2.146332, 1, 1, 1, 1, 1,
-0.5168237, -1.016933, -4.281254, 1, 1, 1, 1, 1,
-0.5121676, -1.319745, -2.121428, 1, 1, 1, 1, 1,
-0.5082034, -0.1858593, -1.341811, 1, 1, 1, 1, 1,
-0.5031591, -1.594721, -3.63287, 1, 1, 1, 1, 1,
-0.4995973, 0.5433431, -1.342924, 1, 1, 1, 1, 1,
-0.4962965, 0.731308, -0.3369761, 1, 1, 1, 1, 1,
-0.4956064, 0.3286911, 0.2016929, 1, 1, 1, 1, 1,
-0.4929448, 0.9388426, 0.3419082, 1, 1, 1, 1, 1,
-0.491989, 1.302672, 1.278521, 0, 0, 1, 1, 1,
-0.4897777, -0.7928012, -1.963922, 1, 0, 0, 1, 1,
-0.4873222, 0.5134374, -1.344567, 1, 0, 0, 1, 1,
-0.484076, -0.4406858, -3.677294, 1, 0, 0, 1, 1,
-0.4801363, -0.693531, -1.729284, 1, 0, 0, 1, 1,
-0.4778753, 0.2388623, -4.182816, 1, 0, 0, 1, 1,
-0.4747212, -0.8569093, -3.514119, 0, 0, 0, 1, 1,
-0.4617538, -0.09874087, -3.318159, 0, 0, 0, 1, 1,
-0.460951, 0.1521223, -0.6569905, 0, 0, 0, 1, 1,
-0.4604791, 1.443351, 0.04594157, 0, 0, 0, 1, 1,
-0.4581564, 0.9131076, 0.1730119, 0, 0, 0, 1, 1,
-0.4577387, 0.6815118, 0.6571859, 0, 0, 0, 1, 1,
-0.4570395, -0.7792642, -2.999615, 0, 0, 0, 1, 1,
-0.4520378, 1.094315, -1.570873, 1, 1, 1, 1, 1,
-0.4461736, -0.1516117, -1.088163, 1, 1, 1, 1, 1,
-0.441946, -0.3611675, -3.959223, 1, 1, 1, 1, 1,
-0.4403627, -1.530983, -1.586205, 1, 1, 1, 1, 1,
-0.4375696, 2.0922, 0.3975293, 1, 1, 1, 1, 1,
-0.4370169, 2.108602, 0.4542636, 1, 1, 1, 1, 1,
-0.4333248, 0.68106, -0.560967, 1, 1, 1, 1, 1,
-0.4326279, 0.7812811, -0.05800413, 1, 1, 1, 1, 1,
-0.429294, -2.237291, -2.865299, 1, 1, 1, 1, 1,
-0.4290797, 0.1797648, 0.7437173, 1, 1, 1, 1, 1,
-0.4272658, -0.9451345, -3.934425, 1, 1, 1, 1, 1,
-0.4203391, -0.9852728, -4.704136, 1, 1, 1, 1, 1,
-0.4170887, -1.794134, -4.176512, 1, 1, 1, 1, 1,
-0.4163637, -0.3425166, -2.848515, 1, 1, 1, 1, 1,
-0.4159059, -0.347039, -0.6681154, 1, 1, 1, 1, 1,
-0.4157069, 2.027677, 0.01562858, 0, 0, 1, 1, 1,
-0.4125726, -0.9371306, -2.692043, 1, 0, 0, 1, 1,
-0.4120425, -1.776921, -1.801763, 1, 0, 0, 1, 1,
-0.410378, -0.4077312, -1.424002, 1, 0, 0, 1, 1,
-0.4087346, -0.1239987, -3.169212, 1, 0, 0, 1, 1,
-0.4078182, -1.206274, -3.744935, 1, 0, 0, 1, 1,
-0.4031039, 0.9208761, -2.626529, 0, 0, 0, 1, 1,
-0.3992048, -0.3033073, 0.3290912, 0, 0, 0, 1, 1,
-0.3966063, -0.7880288, -2.304106, 0, 0, 0, 1, 1,
-0.3965378, -0.07159963, -1.584816, 0, 0, 0, 1, 1,
-0.3904489, 0.5988197, -0.5757924, 0, 0, 0, 1, 1,
-0.3880867, -0.4798994, -2.063335, 0, 0, 0, 1, 1,
-0.3825622, -0.3320319, -0.8694159, 0, 0, 0, 1, 1,
-0.3819118, 1.158018, -0.7149307, 1, 1, 1, 1, 1,
-0.3768598, -1.69171, -1.403034, 1, 1, 1, 1, 1,
-0.376575, -0.3448828, -1.144635, 1, 1, 1, 1, 1,
-0.3739352, 0.4221946, -0.6840351, 1, 1, 1, 1, 1,
-0.370905, -0.04023844, -3.294793, 1, 1, 1, 1, 1,
-0.3613014, 0.03763616, -1.7896, 1, 1, 1, 1, 1,
-0.3610718, 1.264744, -0.9042273, 1, 1, 1, 1, 1,
-0.3582217, -1.613177, -1.328549, 1, 1, 1, 1, 1,
-0.3581914, -0.234692, -2.633183, 1, 1, 1, 1, 1,
-0.3577604, 0.07985933, -0.5275458, 1, 1, 1, 1, 1,
-0.3565428, -0.2078698, -4.281712, 1, 1, 1, 1, 1,
-0.351881, 0.3580907, -0.1145871, 1, 1, 1, 1, 1,
-0.3502148, -1.110962, -3.12824, 1, 1, 1, 1, 1,
-0.3480405, -1.321937, -3.087349, 1, 1, 1, 1, 1,
-0.3469415, 0.8213994, -1.15414, 1, 1, 1, 1, 1,
-0.346691, 0.3384984, 1.391616, 0, 0, 1, 1, 1,
-0.3444341, 1.393991, 0.9119237, 1, 0, 0, 1, 1,
-0.3443737, 1.003527, -0.9854555, 1, 0, 0, 1, 1,
-0.3436219, 0.777783, 1.978201, 1, 0, 0, 1, 1,
-0.3429907, 0.009125597, -2.719034, 1, 0, 0, 1, 1,
-0.3412271, 0.7821557, -0.7476054, 1, 0, 0, 1, 1,
-0.3361082, 0.271582, -1.908122, 0, 0, 0, 1, 1,
-0.3323161, 1.130798, -0.5020725, 0, 0, 0, 1, 1,
-0.3296996, -0.1111513, -1.782942, 0, 0, 0, 1, 1,
-0.3295521, 0.7159305, 1.164897, 0, 0, 0, 1, 1,
-0.3247623, 0.2370238, -0.2861171, 0, 0, 0, 1, 1,
-0.3244123, 0.2671258, -0.2568951, 0, 0, 0, 1, 1,
-0.3210058, -0.7355202, -2.210232, 0, 0, 0, 1, 1,
-0.3198829, -0.08638747, -2.78235, 1, 1, 1, 1, 1,
-0.3195834, -1.129766, -1.886246, 1, 1, 1, 1, 1,
-0.3186454, 1.245249, 1.198783, 1, 1, 1, 1, 1,
-0.3145839, -0.6060415, -2.960981, 1, 1, 1, 1, 1,
-0.3126304, -0.6203572, -4.252796, 1, 1, 1, 1, 1,
-0.311931, -0.1056447, -0.1815126, 1, 1, 1, 1, 1,
-0.3118649, -0.8584087, -2.483701, 1, 1, 1, 1, 1,
-0.3114498, 0.5626563, -0.9237211, 1, 1, 1, 1, 1,
-0.3111333, 0.07560122, -3.408801, 1, 1, 1, 1, 1,
-0.3055244, 0.5772566, -0.5972165, 1, 1, 1, 1, 1,
-0.3046341, 0.9078516, -1.692636, 1, 1, 1, 1, 1,
-0.3021301, 0.001201994, -3.333248, 1, 1, 1, 1, 1,
-0.3006354, 0.7334471, -0.621218, 1, 1, 1, 1, 1,
-0.2931868, 1.603029, -0.1752691, 1, 1, 1, 1, 1,
-0.2922574, -1.532428, -4.298795, 1, 1, 1, 1, 1,
-0.286539, 0.7853485, 0.01857623, 0, 0, 1, 1, 1,
-0.2858384, -0.3162209, -1.970796, 1, 0, 0, 1, 1,
-0.2853585, -0.1832257, -2.187694, 1, 0, 0, 1, 1,
-0.2839985, -0.679055, -2.284529, 1, 0, 0, 1, 1,
-0.2785408, 1.536454, -1.06293, 1, 0, 0, 1, 1,
-0.2761207, -0.518412, -1.645529, 1, 0, 0, 1, 1,
-0.2744148, 1.322886, 0.8779457, 0, 0, 0, 1, 1,
-0.2742945, -0.9651814, -2.770763, 0, 0, 0, 1, 1,
-0.2739465, 0.9841172, 0.8073458, 0, 0, 0, 1, 1,
-0.2708967, 0.1708302, -2.216628, 0, 0, 0, 1, 1,
-0.268547, 0.3853031, -0.5732966, 0, 0, 0, 1, 1,
-0.2570996, 0.09347074, -1.614075, 0, 0, 0, 1, 1,
-0.2570979, 1.185761, -2.038284, 0, 0, 0, 1, 1,
-0.2550948, -0.0804153, -1.425968, 1, 1, 1, 1, 1,
-0.254304, -0.03612728, -2.287914, 1, 1, 1, 1, 1,
-0.2540858, -0.4460153, -4.234548, 1, 1, 1, 1, 1,
-0.2537221, -1.29528, -2.763166, 1, 1, 1, 1, 1,
-0.2493528, -2.004687, -3.412569, 1, 1, 1, 1, 1,
-0.2489188, 0.7598074, -1.155298, 1, 1, 1, 1, 1,
-0.2483005, 0.3685158, -1.116665, 1, 1, 1, 1, 1,
-0.2460765, -0.779672, -4.091043, 1, 1, 1, 1, 1,
-0.2421178, -1.214572, -3.166009, 1, 1, 1, 1, 1,
-0.2407462, -0.820986, -4.473591, 1, 1, 1, 1, 1,
-0.2384218, -0.01254638, -1.466501, 1, 1, 1, 1, 1,
-0.2345756, 0.6475735, -0.752912, 1, 1, 1, 1, 1,
-0.2314482, -0.4120978, -2.928701, 1, 1, 1, 1, 1,
-0.2294323, 0.3630728, 0.3653615, 1, 1, 1, 1, 1,
-0.2280682, 0.6804174, 0.1149445, 1, 1, 1, 1, 1,
-0.2279696, -1.456298, -3.806702, 0, 0, 1, 1, 1,
-0.2265435, -0.6253769, -3.308671, 1, 0, 0, 1, 1,
-0.2245058, -0.5236034, -1.484212, 1, 0, 0, 1, 1,
-0.2235997, -1.061028, -1.062406, 1, 0, 0, 1, 1,
-0.2210682, -1.036555, -2.904186, 1, 0, 0, 1, 1,
-0.2202038, 0.1207764, -1.80122, 1, 0, 0, 1, 1,
-0.2191694, 0.6503782, -0.6291893, 0, 0, 0, 1, 1,
-0.21508, -0.6263992, -2.858427, 0, 0, 0, 1, 1,
-0.2106926, 1.274577, 0.8968204, 0, 0, 0, 1, 1,
-0.2097798, -1.184697, -1.228976, 0, 0, 0, 1, 1,
-0.208403, -0.376567, -1.229904, 0, 0, 0, 1, 1,
-0.2052942, -0.06912488, -1.650531, 0, 0, 0, 1, 1,
-0.1990368, 0.4170093, -0.07655979, 0, 0, 0, 1, 1,
-0.1923643, 1.863232, -0.01325809, 1, 1, 1, 1, 1,
-0.1877651, 0.5990563, -0.5463234, 1, 1, 1, 1, 1,
-0.1857287, -0.2791989, 0.05189583, 1, 1, 1, 1, 1,
-0.1831995, 0.06979115, -1.565743, 1, 1, 1, 1, 1,
-0.1776447, -0.7805665, -4.384309, 1, 1, 1, 1, 1,
-0.1762829, -0.1114066, -2.591691, 1, 1, 1, 1, 1,
-0.1713519, -1.622457, -2.299006, 1, 1, 1, 1, 1,
-0.1697015, -2.95898, -4.198686, 1, 1, 1, 1, 1,
-0.1683212, -0.2755551, -2.250195, 1, 1, 1, 1, 1,
-0.1635519, 0.2570806, -1.209397, 1, 1, 1, 1, 1,
-0.1602982, 2.59637, 1.280045, 1, 1, 1, 1, 1,
-0.1589925, -1.078866, -4.354854, 1, 1, 1, 1, 1,
-0.1579284, 0.4910174, -0.7617847, 1, 1, 1, 1, 1,
-0.1575154, -1.943401, -3.5798, 1, 1, 1, 1, 1,
-0.1556998, -0.8564584, -3.075336, 1, 1, 1, 1, 1,
-0.1545986, 0.1803965, -1.515241, 0, 0, 1, 1, 1,
-0.1516429, -0.4845345, -2.155508, 1, 0, 0, 1, 1,
-0.1515187, 1.5147, -0.6727999, 1, 0, 0, 1, 1,
-0.1504008, -0.7673227, -4.264632, 1, 0, 0, 1, 1,
-0.1490628, 0.3925518, -1.807263, 1, 0, 0, 1, 1,
-0.1485201, -1.38305, -2.592719, 1, 0, 0, 1, 1,
-0.1473734, 1.442039, -1.802796, 0, 0, 0, 1, 1,
-0.1467837, 1.096424, 0.6768183, 0, 0, 0, 1, 1,
-0.1466218, -1.201968, -3.392842, 0, 0, 0, 1, 1,
-0.144146, 0.7287377, 0.3858408, 0, 0, 0, 1, 1,
-0.1373639, 0.1173853, -1.416175, 0, 0, 0, 1, 1,
-0.1362226, 1.247731, 0.06804902, 0, 0, 0, 1, 1,
-0.1353733, -1.397695, -2.990378, 0, 0, 0, 1, 1,
-0.1339696, 0.0940282, -0.01412734, 1, 1, 1, 1, 1,
-0.1334203, -0.2172766, -2.583547, 1, 1, 1, 1, 1,
-0.1267188, 2.06403, -0.8245046, 1, 1, 1, 1, 1,
-0.1242157, -0.2878745, -2.164823, 1, 1, 1, 1, 1,
-0.1235718, 1.299296, -1.710683, 1, 1, 1, 1, 1,
-0.1223326, 1.862084, 1.774082, 1, 1, 1, 1, 1,
-0.118323, -1.362379, -2.96621, 1, 1, 1, 1, 1,
-0.1107078, 0.8072238, -0.3429444, 1, 1, 1, 1, 1,
-0.1017793, 1.085233, -1.377611, 1, 1, 1, 1, 1,
-0.09244947, 0.7539032, -0.3017884, 1, 1, 1, 1, 1,
-0.08455461, 0.8186868, -0.4844274, 1, 1, 1, 1, 1,
-0.08427826, -0.1663657, -3.723512, 1, 1, 1, 1, 1,
-0.08217965, 0.6550695, -0.4981067, 1, 1, 1, 1, 1,
-0.07910233, -0.7639235, -2.877518, 1, 1, 1, 1, 1,
-0.07530135, -0.7061085, -3.039352, 1, 1, 1, 1, 1,
-0.07181869, 1.005154, -0.08670894, 0, 0, 1, 1, 1,
-0.0717466, -0.7304873, -4.221419, 1, 0, 0, 1, 1,
-0.06876197, 1.076864, 1.01516, 1, 0, 0, 1, 1,
-0.06722169, 0.1719784, -1.335727, 1, 0, 0, 1, 1,
-0.06652428, -2.375921, -1.743141, 1, 0, 0, 1, 1,
-0.06202811, 0.7023214, -1.068755, 1, 0, 0, 1, 1,
-0.05444482, 2.091856, -0.1174039, 0, 0, 0, 1, 1,
-0.0537952, -1.788728, -1.684399, 0, 0, 0, 1, 1,
-0.05357032, 1.878778, 2.60568, 0, 0, 0, 1, 1,
-0.04590971, 0.6064435, -0.910243, 0, 0, 0, 1, 1,
-0.04403258, -1.045436, -3.364917, 0, 0, 0, 1, 1,
-0.04177465, -0.7631727, -4.087894, 0, 0, 0, 1, 1,
-0.04084381, -0.2018191, -1.689862, 0, 0, 0, 1, 1,
-0.03696995, -0.3819165, -3.622451, 1, 1, 1, 1, 1,
-0.0315664, 0.4468754, -0.7221618, 1, 1, 1, 1, 1,
-0.02509855, -0.8090566, -3.089666, 1, 1, 1, 1, 1,
-0.02281133, 1.007127, -0.3789112, 1, 1, 1, 1, 1,
-0.0188022, -0.5852703, -3.453334, 1, 1, 1, 1, 1,
-0.01530259, 1.048615, 0.006265038, 1, 1, 1, 1, 1,
-0.01320284, 1.142482, -1.853745, 1, 1, 1, 1, 1,
-0.009574269, -0.372055, -3.249094, 1, 1, 1, 1, 1,
-0.005507585, -0.6806762, -2.398596, 1, 1, 1, 1, 1,
0.003622832, -0.32252, 2.577665, 1, 1, 1, 1, 1,
0.005848101, -0.4690576, 1.061784, 1, 1, 1, 1, 1,
0.008811137, 0.07331901, -0.3919565, 1, 1, 1, 1, 1,
0.008913895, -0.1945159, 2.476574, 1, 1, 1, 1, 1,
0.009010122, 1.023671, 0.02405735, 1, 1, 1, 1, 1,
0.01356662, -0.5661138, 3.769659, 1, 1, 1, 1, 1,
0.01507251, 0.3521033, 2.375702, 0, 0, 1, 1, 1,
0.01688036, 1.24536, -0.1175028, 1, 0, 0, 1, 1,
0.01774807, -1.95469, 4.122847, 1, 0, 0, 1, 1,
0.01887396, 0.5868392, 0.4285379, 1, 0, 0, 1, 1,
0.02106769, 0.981843, 0.7768505, 1, 0, 0, 1, 1,
0.03570915, 1.06368, 0.6491123, 1, 0, 0, 1, 1,
0.04024951, 0.6442907, -1.087709, 0, 0, 0, 1, 1,
0.04347411, -0.6090438, 3.823508, 0, 0, 0, 1, 1,
0.04386279, 0.5831856, 0.4104311, 0, 0, 0, 1, 1,
0.0518467, -0.7050114, 3.755459, 0, 0, 0, 1, 1,
0.05625214, -0.948123, 3.447968, 0, 0, 0, 1, 1,
0.0641684, 0.3539894, 1.245629, 0, 0, 0, 1, 1,
0.06549097, 1.371818, -1.624881, 0, 0, 0, 1, 1,
0.06594558, -0.7585332, 2.230289, 1, 1, 1, 1, 1,
0.06601312, 0.04634355, 0.3922496, 1, 1, 1, 1, 1,
0.06847432, -0.5467275, 3.129579, 1, 1, 1, 1, 1,
0.07274368, -0.2670821, 2.925119, 1, 1, 1, 1, 1,
0.07745254, 0.6602333, 0.5812759, 1, 1, 1, 1, 1,
0.0808215, -1.001458, 2.818562, 1, 1, 1, 1, 1,
0.08253512, -1.565462, 3.966371, 1, 1, 1, 1, 1,
0.08448361, -0.07110904, 2.288325, 1, 1, 1, 1, 1,
0.0880518, -0.1964255, 2.719604, 1, 1, 1, 1, 1,
0.09138524, -0.4215952, 3.581363, 1, 1, 1, 1, 1,
0.09215271, 0.5612044, -1.438164, 1, 1, 1, 1, 1,
0.09386793, -0.2516541, 0.9950905, 1, 1, 1, 1, 1,
0.09633224, 1.798238, -0.7998408, 1, 1, 1, 1, 1,
0.09645908, -0.473389, 4.711782, 1, 1, 1, 1, 1,
0.097736, 0.06584151, 1.534113, 1, 1, 1, 1, 1,
0.1033318, 0.4540898, 2.228396, 0, 0, 1, 1, 1,
0.1168541, -2.037236, 3.360332, 1, 0, 0, 1, 1,
0.1183948, -0.1804853, 2.481558, 1, 0, 0, 1, 1,
0.1215151, 1.225188, -1.4853, 1, 0, 0, 1, 1,
0.1309805, -0.9095299, 2.740546, 1, 0, 0, 1, 1,
0.1343449, -0.8867026, 2.034873, 1, 0, 0, 1, 1,
0.1352975, 1.96992, -0.5623262, 0, 0, 0, 1, 1,
0.1377379, -0.688076, 3.879097, 0, 0, 0, 1, 1,
0.141084, -0.25944, 1.277916, 0, 0, 0, 1, 1,
0.1470282, -0.6653264, 2.008479, 0, 0, 0, 1, 1,
0.1488985, -1.393143, 3.344484, 0, 0, 0, 1, 1,
0.1528349, 1.325443, 1.316109, 0, 0, 0, 1, 1,
0.154852, 0.1899886, 0.4910646, 0, 0, 0, 1, 1,
0.1565844, -3.058986, 3.502295, 1, 1, 1, 1, 1,
0.1603744, 0.8535205, 0.4688039, 1, 1, 1, 1, 1,
0.1647017, 0.2337586, 2.335631, 1, 1, 1, 1, 1,
0.1667404, -1.254063, 2.843093, 1, 1, 1, 1, 1,
0.1670959, -1.106756, 2.793019, 1, 1, 1, 1, 1,
0.168172, 0.1252819, 2.521278, 1, 1, 1, 1, 1,
0.16862, -0.5840011, 2.144117, 1, 1, 1, 1, 1,
0.1720994, 1.186995, 0.5739781, 1, 1, 1, 1, 1,
0.1738204, 1.047496, -0.6964622, 1, 1, 1, 1, 1,
0.174213, -0.4090243, 2.827992, 1, 1, 1, 1, 1,
0.1772891, 1.106539, -0.4840511, 1, 1, 1, 1, 1,
0.1801351, -1.999453, 3.614992, 1, 1, 1, 1, 1,
0.1807364, -0.3534288, 3.318883, 1, 1, 1, 1, 1,
0.186165, 1.590181, 0.1919057, 1, 1, 1, 1, 1,
0.1867757, -0.07277019, 2.478288, 1, 1, 1, 1, 1,
0.18946, -0.07060345, 1.111564, 0, 0, 1, 1, 1,
0.1921694, -0.7179781, 3.440693, 1, 0, 0, 1, 1,
0.1970509, 1.376929, 0.3192641, 1, 0, 0, 1, 1,
0.197376, 0.4265879, 1.778842, 1, 0, 0, 1, 1,
0.2011131, -0.3082787, 2.01705, 1, 0, 0, 1, 1,
0.2019768, 1.104543, -0.3849939, 1, 0, 0, 1, 1,
0.2048994, 0.7749591, 2.153059, 0, 0, 0, 1, 1,
0.2060049, -0.4219493, 2.931687, 0, 0, 0, 1, 1,
0.2069169, -0.3236095, 2.527181, 0, 0, 0, 1, 1,
0.2070137, 0.9905953, 0.7431555, 0, 0, 0, 1, 1,
0.2123898, 1.037878, 1.394042, 0, 0, 0, 1, 1,
0.2151423, -0.172233, 1.611022, 0, 0, 0, 1, 1,
0.2173525, 1.256799, 0.5729506, 0, 0, 0, 1, 1,
0.2174459, -0.6244664, 4.297744, 1, 1, 1, 1, 1,
0.2175888, -1.325935, 1.941901, 1, 1, 1, 1, 1,
0.2191888, 1.249234, 0.9002898, 1, 1, 1, 1, 1,
0.2218722, 0.9947746, 1.009209, 1, 1, 1, 1, 1,
0.2233818, -0.8249728, 1.683224, 1, 1, 1, 1, 1,
0.2288553, -1.888816, 4.050373, 1, 1, 1, 1, 1,
0.2294212, 0.2429896, 0.8597775, 1, 1, 1, 1, 1,
0.2301665, 1.42901, 1.147799, 1, 1, 1, 1, 1,
0.2307858, 1.482696, 0.09340239, 1, 1, 1, 1, 1,
0.2341237, 0.4163857, -0.2765372, 1, 1, 1, 1, 1,
0.2345992, -0.3167416, 3.405087, 1, 1, 1, 1, 1,
0.2383058, 0.8616577, 0.347614, 1, 1, 1, 1, 1,
0.2411762, 2.162425, 1.710991, 1, 1, 1, 1, 1,
0.2426144, 0.7380337, -0.420567, 1, 1, 1, 1, 1,
0.25298, 0.743384, 1.037891, 1, 1, 1, 1, 1,
0.25361, 1.207308, 1.670665, 0, 0, 1, 1, 1,
0.2618247, 0.3574856, 0.03568209, 1, 0, 0, 1, 1,
0.2627871, 1.561277, -1.008912, 1, 0, 0, 1, 1,
0.2651072, 1.107741, -0.05207171, 1, 0, 0, 1, 1,
0.2695834, 0.5496119, -0.4376324, 1, 0, 0, 1, 1,
0.2712668, 0.1729396, 1.561389, 1, 0, 0, 1, 1,
0.2713722, 0.1364184, 1.677098, 0, 0, 0, 1, 1,
0.2724865, 0.1334929, 1.980662, 0, 0, 0, 1, 1,
0.2746797, -0.4611722, 1.49122, 0, 0, 0, 1, 1,
0.2779147, 0.4119747, 0.08280222, 0, 0, 0, 1, 1,
0.278389, 0.2698006, -0.03983815, 0, 0, 0, 1, 1,
0.2789814, 1.099297, 0.5102549, 0, 0, 0, 1, 1,
0.2792052, 0.6618475, 2.072776, 0, 0, 0, 1, 1,
0.2832732, -1.378331, 2.244826, 1, 1, 1, 1, 1,
0.2968251, -0.6930189, 2.59969, 1, 1, 1, 1, 1,
0.2988423, -0.2977173, 1.767094, 1, 1, 1, 1, 1,
0.2988724, 1.127753, -0.6950122, 1, 1, 1, 1, 1,
0.3031933, 1.872152, 1.001284, 1, 1, 1, 1, 1,
0.3046778, -0.2142015, 3.306643, 1, 1, 1, 1, 1,
0.3073731, 0.1688183, 0.9300888, 1, 1, 1, 1, 1,
0.3245041, 0.3548764, 2.12293, 1, 1, 1, 1, 1,
0.3250704, -1.718234, 3.755339, 1, 1, 1, 1, 1,
0.3252273, 0.3421668, 1.550044, 1, 1, 1, 1, 1,
0.3252791, 0.6929338, 0.0121765, 1, 1, 1, 1, 1,
0.3261839, 0.1811567, 1.652701, 1, 1, 1, 1, 1,
0.329193, -0.5010344, 3.000228, 1, 1, 1, 1, 1,
0.3342446, 1.231108, -0.2048559, 1, 1, 1, 1, 1,
0.3345782, -1.035037, 5.39106, 1, 1, 1, 1, 1,
0.3346465, -0.1638007, 1.883225, 0, 0, 1, 1, 1,
0.3366612, 0.6675303, 1.108856, 1, 0, 0, 1, 1,
0.3368123, -0.3516552, 2.830745, 1, 0, 0, 1, 1,
0.339626, -0.7234117, 2.053672, 1, 0, 0, 1, 1,
0.3419398, -0.9665704, 1.863739, 1, 0, 0, 1, 1,
0.3440037, 1.907318, 0.4642126, 1, 0, 0, 1, 1,
0.3447981, -0.4325637, 2.82081, 0, 0, 0, 1, 1,
0.3533756, 0.6666265, -1.327913, 0, 0, 0, 1, 1,
0.3557609, -1.19351, 4.475195, 0, 0, 0, 1, 1,
0.3566407, -0.1658986, 1.551406, 0, 0, 0, 1, 1,
0.3569792, 2.018837, 0.01496239, 0, 0, 0, 1, 1,
0.3570336, -0.4068082, 2.692997, 0, 0, 0, 1, 1,
0.3582341, 1.221088, -1.097767, 0, 0, 0, 1, 1,
0.362731, 0.254613, 2.042409, 1, 1, 1, 1, 1,
0.3682265, 0.4176542, -0.6599775, 1, 1, 1, 1, 1,
0.3690968, 1.173267, -0.3251976, 1, 1, 1, 1, 1,
0.3702413, 0.7088473, 1.090421, 1, 1, 1, 1, 1,
0.3709966, -0.4527982, 1.762739, 1, 1, 1, 1, 1,
0.3721958, -1.444247, 2.565452, 1, 1, 1, 1, 1,
0.3733902, 0.1374728, 0.2182921, 1, 1, 1, 1, 1,
0.3741795, -2.507756, 3.587243, 1, 1, 1, 1, 1,
0.3759311, 1.775725, -0.856307, 1, 1, 1, 1, 1,
0.3813681, -1.7672, 2.900841, 1, 1, 1, 1, 1,
0.384598, 1.828019, 0.8132809, 1, 1, 1, 1, 1,
0.3884387, -1.061571, 2.565568, 1, 1, 1, 1, 1,
0.3909686, -2.204962, 3.948943, 1, 1, 1, 1, 1,
0.3943373, -0.8742363, 2.481241, 1, 1, 1, 1, 1,
0.3953464, -0.9589438, 1.721811, 1, 1, 1, 1, 1,
0.3990858, -0.4817452, 3.437358, 0, 0, 1, 1, 1,
0.4040821, -0.1565593, 2.096184, 1, 0, 0, 1, 1,
0.4066514, 0.384749, 2.248165, 1, 0, 0, 1, 1,
0.4146037, -0.9128677, 4.350636, 1, 0, 0, 1, 1,
0.415439, -1.574282, 2.659401, 1, 0, 0, 1, 1,
0.4231143, -0.4550557, 3.137506, 1, 0, 0, 1, 1,
0.4263327, 0.3617004, 1.092346, 0, 0, 0, 1, 1,
0.4263856, 0.5326266, -0.6842922, 0, 0, 0, 1, 1,
0.4360671, 1.145027, 0.5847865, 0, 0, 0, 1, 1,
0.4369081, -1.08122, 2.142616, 0, 0, 0, 1, 1,
0.4373351, 0.8521839, 1.91796, 0, 0, 0, 1, 1,
0.4417236, -0.7369567, 3.191073, 0, 0, 0, 1, 1,
0.4428044, 0.9334413, 1.50127, 0, 0, 0, 1, 1,
0.4430366, -0.5070074, 4.781593, 1, 1, 1, 1, 1,
0.449105, 1.786369, 0.6685173, 1, 1, 1, 1, 1,
0.450457, -0.8499356, 3.592461, 1, 1, 1, 1, 1,
0.4506392, 1.088403, 2.762486, 1, 1, 1, 1, 1,
0.4524548, -0.8527834, 1.463988, 1, 1, 1, 1, 1,
0.4532264, 0.147236, 1.735459, 1, 1, 1, 1, 1,
0.4578674, 0.8352255, 0.1999093, 1, 1, 1, 1, 1,
0.4584619, -0.4609762, 3.185822, 1, 1, 1, 1, 1,
0.4594393, 0.688183, 1.24691, 1, 1, 1, 1, 1,
0.4660108, -1.462933, 3.000242, 1, 1, 1, 1, 1,
0.4715618, -0.1675003, 2.662937, 1, 1, 1, 1, 1,
0.4722733, -0.253702, 2.460114, 1, 1, 1, 1, 1,
0.4763479, 2.385076, 1.33162, 1, 1, 1, 1, 1,
0.4780882, 0.3765798, -0.3495504, 1, 1, 1, 1, 1,
0.480848, -2.698778, 2.719887, 1, 1, 1, 1, 1,
0.4810871, -0.5216091, 1.448967, 0, 0, 1, 1, 1,
0.4835279, 2.168927, -1.54398, 1, 0, 0, 1, 1,
0.4884057, 0.8784949, 0.0519998, 1, 0, 0, 1, 1,
0.4911481, 0.5163668, 0.8602108, 1, 0, 0, 1, 1,
0.4923613, -0.5510201, 4.543952, 1, 0, 0, 1, 1,
0.4951757, 1.884196, -1.009963, 1, 0, 0, 1, 1,
0.4965541, 1.331606, 1.120861, 0, 0, 0, 1, 1,
0.4997911, 2.709737, 0.3817603, 0, 0, 0, 1, 1,
0.5091551, 0.4098348, 0.668303, 0, 0, 0, 1, 1,
0.5107579, 1.614831, 1.65258, 0, 0, 0, 1, 1,
0.5135187, -0.7185081, 3.632459, 0, 0, 0, 1, 1,
0.5171507, -0.2493895, 3.748262, 0, 0, 0, 1, 1,
0.520986, 0.2484567, -1.543722, 0, 0, 0, 1, 1,
0.5225338, -0.3023202, 1.924838, 1, 1, 1, 1, 1,
0.5226515, -1.463862, 1.461451, 1, 1, 1, 1, 1,
0.5239108, 0.2049384, 1.8607, 1, 1, 1, 1, 1,
0.5262885, -1.095163, 3.443688, 1, 1, 1, 1, 1,
0.5351887, -1.427461, 4.214653, 1, 1, 1, 1, 1,
0.5404842, 0.9005612, 2.494076, 1, 1, 1, 1, 1,
0.5408947, -1.577016, 1.831986, 1, 1, 1, 1, 1,
0.5409092, 2.12686, 0.1755707, 1, 1, 1, 1, 1,
0.5412645, -0.07332028, 1.816922, 1, 1, 1, 1, 1,
0.5427863, -0.00832763, 1.269921, 1, 1, 1, 1, 1,
0.5487226, -1.772334, 2.8483, 1, 1, 1, 1, 1,
0.5540491, -0.6779593, 1.143704, 1, 1, 1, 1, 1,
0.555401, -0.06755687, 1.678526, 1, 1, 1, 1, 1,
0.5671679, -0.5846061, 1.731078, 1, 1, 1, 1, 1,
0.5728521, 0.04681946, 1.933895, 1, 1, 1, 1, 1,
0.5729936, 1.508999, -0.831116, 0, 0, 1, 1, 1,
0.5741808, 0.440217, 0.2760234, 1, 0, 0, 1, 1,
0.5764695, 1.931607, 0.3071175, 1, 0, 0, 1, 1,
0.5814551, -1.122135, 2.911409, 1, 0, 0, 1, 1,
0.5881146, -0.9322148, 2.022085, 1, 0, 0, 1, 1,
0.58845, 0.3956708, 0.7813637, 1, 0, 0, 1, 1,
0.5888315, -1.368002, 3.081774, 0, 0, 0, 1, 1,
0.5890107, -1.23868, 1.654081, 0, 0, 0, 1, 1,
0.5900351, 0.2949339, 0.5143085, 0, 0, 0, 1, 1,
0.602882, 1.049377, 0.4463559, 0, 0, 0, 1, 1,
0.6091858, -1.712734, 4.779606, 0, 0, 0, 1, 1,
0.6092098, 0.1788339, 1.029752, 0, 0, 0, 1, 1,
0.6117732, 0.30212, 1.806458, 0, 0, 0, 1, 1,
0.6159068, 2.516474, 1.470919, 1, 1, 1, 1, 1,
0.6170338, 0.2300171, -0.7875755, 1, 1, 1, 1, 1,
0.6178328, -0.8734478, 2.332026, 1, 1, 1, 1, 1,
0.6182787, 0.3796342, 1.453939, 1, 1, 1, 1, 1,
0.6230613, 0.1870068, 1.111304, 1, 1, 1, 1, 1,
0.6232351, 1.237063, 0.8776253, 1, 1, 1, 1, 1,
0.6233026, -0.5157863, 2.883166, 1, 1, 1, 1, 1,
0.624317, 1.393435, 0.1103542, 1, 1, 1, 1, 1,
0.6267512, 1.023795, 2.189464, 1, 1, 1, 1, 1,
0.6288953, -0.5962975, 3.749569, 1, 1, 1, 1, 1,
0.6300569, 1.236595, -0.4965701, 1, 1, 1, 1, 1,
0.6343542, 0.4300345, 0.649635, 1, 1, 1, 1, 1,
0.6346281, -0.3422065, 2.185901, 1, 1, 1, 1, 1,
0.6368161, 0.399475, 1.093728, 1, 1, 1, 1, 1,
0.6400421, 1.351427, 0.2617103, 1, 1, 1, 1, 1,
0.6490746, -0.2318543, 1.837846, 0, 0, 1, 1, 1,
0.6497384, -0.5653329, 1.300861, 1, 0, 0, 1, 1,
0.6549693, -1.020387, 3.380538, 1, 0, 0, 1, 1,
0.6591722, 0.296672, 1.316096, 1, 0, 0, 1, 1,
0.6599146, 0.932581, 2.845223, 1, 0, 0, 1, 1,
0.6621693, 0.8447549, 0.5245508, 1, 0, 0, 1, 1,
0.6625799, 0.2526072, 2.514227, 0, 0, 0, 1, 1,
0.6637818, -0.5364985, 1.451459, 0, 0, 0, 1, 1,
0.6649556, -0.07666977, 0.9232882, 0, 0, 0, 1, 1,
0.6753844, -0.4911675, 0.3222608, 0, 0, 0, 1, 1,
0.6765369, 1.080613, -0.2260727, 0, 0, 0, 1, 1,
0.6767467, -2.227156, 4.471918, 0, 0, 0, 1, 1,
0.6773002, 0.3620129, 2.186917, 0, 0, 0, 1, 1,
0.6827686, -1.321262, 1.85252, 1, 1, 1, 1, 1,
0.6867684, -0.0354223, 3.102803, 1, 1, 1, 1, 1,
0.6886316, 0.2571586, 2.068752, 1, 1, 1, 1, 1,
0.6938049, 0.256606, 1.803465, 1, 1, 1, 1, 1,
0.694812, 1.128332, 1.462266, 1, 1, 1, 1, 1,
0.699931, -0.002514837, 1.921848, 1, 1, 1, 1, 1,
0.7057495, -1.506052, 2.500888, 1, 1, 1, 1, 1,
0.7074227, -0.8849353, 2.912792, 1, 1, 1, 1, 1,
0.7096658, 0.09878408, 2.733687, 1, 1, 1, 1, 1,
0.7133009, -0.3426099, 3.426357, 1, 1, 1, 1, 1,
0.7156117, -1.805372, 2.335228, 1, 1, 1, 1, 1,
0.7160449, 1.340797, 2.372131, 1, 1, 1, 1, 1,
0.7233579, -0.2293086, 2.287242, 1, 1, 1, 1, 1,
0.7251989, -1.083799, 4.789473, 1, 1, 1, 1, 1,
0.7257415, 0.8168266, 2.404071, 1, 1, 1, 1, 1,
0.7300467, -0.02908134, 1.605192, 0, 0, 1, 1, 1,
0.7309037, -1.108426, 2.228904, 1, 0, 0, 1, 1,
0.7324774, 0.09239541, 2.115186, 1, 0, 0, 1, 1,
0.7334179, 1.358597, 1.056138, 1, 0, 0, 1, 1,
0.7367881, -1.230455, 2.033359, 1, 0, 0, 1, 1,
0.737299, -0.2364998, 2.965988, 1, 0, 0, 1, 1,
0.742152, -1.011808, 2.181807, 0, 0, 0, 1, 1,
0.7450454, -0.7794966, 2.701802, 0, 0, 0, 1, 1,
0.7517225, 0.8929899, -0.319321, 0, 0, 0, 1, 1,
0.7537879, -2.024524, 1.088298, 0, 0, 0, 1, 1,
0.7559134, 0.7228569, 2.18256, 0, 0, 0, 1, 1,
0.7635758, 0.2851351, 2.570855, 0, 0, 0, 1, 1,
0.7637342, 1.106424, 1.017997, 0, 0, 0, 1, 1,
0.7644472, 0.473537, 0.6950346, 1, 1, 1, 1, 1,
0.7755526, 1.231489, 0.9325226, 1, 1, 1, 1, 1,
0.7755895, 0.98235, 0.8202215, 1, 1, 1, 1, 1,
0.780525, -1.197714, 1.077248, 1, 1, 1, 1, 1,
0.7812753, -1.840912, 3.349782, 1, 1, 1, 1, 1,
0.7844533, 1.067426, -1.231198, 1, 1, 1, 1, 1,
0.7888824, 0.06743474, 3.951186, 1, 1, 1, 1, 1,
0.7892656, -0.9347514, 1.480177, 1, 1, 1, 1, 1,
0.8014801, -0.4207026, 0.4977681, 1, 1, 1, 1, 1,
0.804706, 1.3829, 0.1642326, 1, 1, 1, 1, 1,
0.8112689, -0.7034982, 1.224276, 1, 1, 1, 1, 1,
0.8128003, -0.1504418, 2.388762, 1, 1, 1, 1, 1,
0.813239, 0.5612881, 2.402695, 1, 1, 1, 1, 1,
0.8137309, 1.069901, 2.172138, 1, 1, 1, 1, 1,
0.8176611, -0.9835154, 1.251902, 1, 1, 1, 1, 1,
0.8197658, -0.05341279, 2.392385, 0, 0, 1, 1, 1,
0.8251866, 0.4922122, 1.401155, 1, 0, 0, 1, 1,
0.8255345, 0.3969976, 2.058406, 1, 0, 0, 1, 1,
0.8274727, 0.4465023, 1.309853, 1, 0, 0, 1, 1,
0.832982, 0.18999, 0.7165555, 1, 0, 0, 1, 1,
0.8337581, -0.5058201, 1.426277, 1, 0, 0, 1, 1,
0.8344908, -0.1450462, 1.910429, 0, 0, 0, 1, 1,
0.8353603, -1.363395, 1.390322, 0, 0, 0, 1, 1,
0.8406738, 0.4905596, 1.066943, 0, 0, 0, 1, 1,
0.8425933, -0.8711083, 3.1009, 0, 0, 0, 1, 1,
0.8441769, -1.772914, 1.625685, 0, 0, 0, 1, 1,
0.8455486, -1.200223, 4.710946, 0, 0, 0, 1, 1,
0.8493505, -1.643436, 2.625608, 0, 0, 0, 1, 1,
0.8502015, 1.424779, -0.4249988, 1, 1, 1, 1, 1,
0.8612532, 1.598298, 0.1633634, 1, 1, 1, 1, 1,
0.8736578, -0.194758, 0.6539497, 1, 1, 1, 1, 1,
0.8778015, -0.8696432, 2.937817, 1, 1, 1, 1, 1,
0.8824962, -2.937747, 2.645916, 1, 1, 1, 1, 1,
0.8881316, 1.221377, -1.629881, 1, 1, 1, 1, 1,
0.893198, 0.3959316, 1.595811, 1, 1, 1, 1, 1,
0.8946534, 1.14752, 1.713397, 1, 1, 1, 1, 1,
0.9008614, 2.412458, 1.467914, 1, 1, 1, 1, 1,
0.9127674, -0.4350401, 1.055039, 1, 1, 1, 1, 1,
0.9135129, 0.03045345, 2.056685, 1, 1, 1, 1, 1,
0.9186393, 0.490522, 0.6702537, 1, 1, 1, 1, 1,
0.9198865, 2.124403, 0.1153667, 1, 1, 1, 1, 1,
0.9244826, 0.3162121, -0.8193914, 1, 1, 1, 1, 1,
0.927516, -1.054016, 1.833112, 1, 1, 1, 1, 1,
0.9357458, -0.009251146, -0.01332718, 0, 0, 1, 1, 1,
0.936252, -1.760329, 3.620602, 1, 0, 0, 1, 1,
0.9383462, 0.5924118, 1.306473, 1, 0, 0, 1, 1,
0.941251, 1.263798, -1.173188, 1, 0, 0, 1, 1,
0.9460239, 0.154517, 1.878714, 1, 0, 0, 1, 1,
0.9538236, 0.4437442, 0.7073364, 1, 0, 0, 1, 1,
0.9569032, -0.426931, 2.385794, 0, 0, 0, 1, 1,
0.9627569, 0.4412765, 0.2408098, 0, 0, 0, 1, 1,
0.9717121, 0.2365858, 3.288338, 0, 0, 0, 1, 1,
0.9751365, -1.27214, 3.986496, 0, 0, 0, 1, 1,
0.9770198, -0.1935224, 2.011817, 0, 0, 0, 1, 1,
0.9812365, -1.938178, 2.480245, 0, 0, 0, 1, 1,
0.9950398, -1.532549, 2.858356, 0, 0, 0, 1, 1,
0.9971933, 0.3499015, -0.2929789, 1, 1, 1, 1, 1,
1.0034, -2.166276, 2.253806, 1, 1, 1, 1, 1,
1.005834, -0.4250597, 2.406165, 1, 1, 1, 1, 1,
1.0255, 0.8581129, -0.3671053, 1, 1, 1, 1, 1,
1.025828, 1.454677, 0.4910391, 1, 1, 1, 1, 1,
1.027452, -0.4971798, 2.052218, 1, 1, 1, 1, 1,
1.028084, 1.859434, 0.8979244, 1, 1, 1, 1, 1,
1.032901, 1.528049, 0.6026516, 1, 1, 1, 1, 1,
1.035745, -0.9607089, 3.789674, 1, 1, 1, 1, 1,
1.049838, 1.004614, -0.9192761, 1, 1, 1, 1, 1,
1.050011, 0.3882782, 0.5456601, 1, 1, 1, 1, 1,
1.051625, 0.3286482, 1.06844, 1, 1, 1, 1, 1,
1.065227, -1.655401, 1.382679, 1, 1, 1, 1, 1,
1.075829, -0.1396843, 2.695724, 1, 1, 1, 1, 1,
1.078634, -1.144107, 1.330924, 1, 1, 1, 1, 1,
1.079208, 0.04701491, 0.761773, 0, 0, 1, 1, 1,
1.082191, 0.2463342, 0.41908, 1, 0, 0, 1, 1,
1.082865, -1.38713, 1.087231, 1, 0, 0, 1, 1,
1.083069, -1.737918, 3.538324, 1, 0, 0, 1, 1,
1.084675, 1.373797, 1.322192, 1, 0, 0, 1, 1,
1.088254, 0.1260423, 0.4625154, 1, 0, 0, 1, 1,
1.101439, -1.071317, 2.639844, 0, 0, 0, 1, 1,
1.101911, 0.1883746, 0.1975114, 0, 0, 0, 1, 1,
1.103583, 1.578092, 0.6987929, 0, 0, 0, 1, 1,
1.103955, 0.03839407, 0.4966682, 0, 0, 0, 1, 1,
1.109465, 0.0270122, 1.645814, 0, 0, 0, 1, 1,
1.11003, -0.5321981, 1.069625, 0, 0, 0, 1, 1,
1.124121, -0.1058168, 1.464119, 0, 0, 0, 1, 1,
1.13512, 1.227145, 2.344969, 1, 1, 1, 1, 1,
1.153015, 0.249085, 2.201259, 1, 1, 1, 1, 1,
1.155006, 0.7149113, 1.694851, 1, 1, 1, 1, 1,
1.168098, 2.270529, 0.4872598, 1, 1, 1, 1, 1,
1.16952, 0.0400615, 1.362961, 1, 1, 1, 1, 1,
1.171245, -0.678136, 0.4829746, 1, 1, 1, 1, 1,
1.172659, 1.193349, 0.0656369, 1, 1, 1, 1, 1,
1.178279, 0.9704481, 0.7021593, 1, 1, 1, 1, 1,
1.178725, -0.7697707, 1.198764, 1, 1, 1, 1, 1,
1.183456, 0.6270013, 0.517284, 1, 1, 1, 1, 1,
1.192029, 1.278267, 0.7863009, 1, 1, 1, 1, 1,
1.196765, -0.6445989, 1.436433, 1, 1, 1, 1, 1,
1.202614, -0.4102471, 0.9852327, 1, 1, 1, 1, 1,
1.208334, 2.093455, 0.9063501, 1, 1, 1, 1, 1,
1.209286, -1.645705, 1.865889, 1, 1, 1, 1, 1,
1.213638, -0.381429, 1.16139, 0, 0, 1, 1, 1,
1.215636, -0.06034028, 1.404477, 1, 0, 0, 1, 1,
1.224611, -0.3390644, 0.2752028, 1, 0, 0, 1, 1,
1.230603, 2.229566, 0.8619871, 1, 0, 0, 1, 1,
1.239125, 0.2640147, 2.561644, 1, 0, 0, 1, 1,
1.257956, 0.1504172, 1.850685, 1, 0, 0, 1, 1,
1.259776, -1.605371, 2.186475, 0, 0, 0, 1, 1,
1.270536, -0.9901166, 2.026158, 0, 0, 0, 1, 1,
1.293064, 1.615488, -0.3680145, 0, 0, 0, 1, 1,
1.293797, -0.1259822, 1.483577, 0, 0, 0, 1, 1,
1.296208, -0.4488138, 4.356573, 0, 0, 0, 1, 1,
1.297032, 0.4225708, 3.361475, 0, 0, 0, 1, 1,
1.300031, -0.2912412, 2.245741, 0, 0, 0, 1, 1,
1.309393, 1.278083, 0.6598901, 1, 1, 1, 1, 1,
1.314728, -1.185485, 2.317326, 1, 1, 1, 1, 1,
1.320018, 0.820289, 0.08258498, 1, 1, 1, 1, 1,
1.322891, -1.079731, 1.749388, 1, 1, 1, 1, 1,
1.340091, 0.4935358, 1.455459, 1, 1, 1, 1, 1,
1.345308, 1.06702, -0.08574691, 1, 1, 1, 1, 1,
1.356632, 0.4700511, 0.696289, 1, 1, 1, 1, 1,
1.367108, -0.1984815, 2.56473, 1, 1, 1, 1, 1,
1.367891, 0.432158, -0.5737699, 1, 1, 1, 1, 1,
1.370763, -0.734772, 1.412644, 1, 1, 1, 1, 1,
1.397743, 1.640188, 0.7055696, 1, 1, 1, 1, 1,
1.410242, 1.320048, 0.652092, 1, 1, 1, 1, 1,
1.415485, -0.4614395, 2.309475, 1, 1, 1, 1, 1,
1.425914, 0.9284744, 1.122705, 1, 1, 1, 1, 1,
1.42904, -0.7184411, 3.858386, 1, 1, 1, 1, 1,
1.429795, 1.151035, 0.6743134, 0, 0, 1, 1, 1,
1.434966, -0.7008924, 1.902032, 1, 0, 0, 1, 1,
1.44523, -2.313131, 2.075668, 1, 0, 0, 1, 1,
1.445506, 1.191036, 2.816802, 1, 0, 0, 1, 1,
1.449344, -0.7831761, 2.738503, 1, 0, 0, 1, 1,
1.452872, 1.325642, 0.3749064, 1, 0, 0, 1, 1,
1.453162, 1.030725, 0.5289552, 0, 0, 0, 1, 1,
1.461576, -0.8845652, 1.408743, 0, 0, 0, 1, 1,
1.483101, 0.6861251, -1.449018, 0, 0, 0, 1, 1,
1.489873, -0.2633255, 1.626459, 0, 0, 0, 1, 1,
1.49077, 0.1667648, 0.6150611, 0, 0, 0, 1, 1,
1.492619, 0.07668784, 1.062561, 0, 0, 0, 1, 1,
1.50549, 1.107853, 0.04369311, 0, 0, 0, 1, 1,
1.505809, 1.82029, 0.2744609, 1, 1, 1, 1, 1,
1.509011, 0.1329357, 0.4099201, 1, 1, 1, 1, 1,
1.509159, -0.9833177, 3.70783, 1, 1, 1, 1, 1,
1.509371, -1.696863, 1.668282, 1, 1, 1, 1, 1,
1.528687, -0.7032317, 1.935696, 1, 1, 1, 1, 1,
1.536191, 0.09930015, 1.545967, 1, 1, 1, 1, 1,
1.550244, -0.7472617, 0.3412274, 1, 1, 1, 1, 1,
1.560491, 0.2631701, 0.6407916, 1, 1, 1, 1, 1,
1.565943, 0.6885694, 3.283895, 1, 1, 1, 1, 1,
1.56885, 0.5101507, 1.701907, 1, 1, 1, 1, 1,
1.572583, -0.2318473, 2.375416, 1, 1, 1, 1, 1,
1.583144, 2.120713, 0.547688, 1, 1, 1, 1, 1,
1.593757, -0.4965855, 0.8197044, 1, 1, 1, 1, 1,
1.59523, -1.191408, 2.583794, 1, 1, 1, 1, 1,
1.596229, 2.110064, 0.7986796, 1, 1, 1, 1, 1,
1.596988, 0.2122123, 0.07389081, 0, 0, 1, 1, 1,
1.625906, 0.4793645, 0.8433432, 1, 0, 0, 1, 1,
1.626771, 1.479961, -0.01959576, 1, 0, 0, 1, 1,
1.646136, 0.6400908, 2.138404, 1, 0, 0, 1, 1,
1.65281, 1.101965, -1.168499, 1, 0, 0, 1, 1,
1.663714, 0.1436155, 1.640454, 1, 0, 0, 1, 1,
1.672075, 1.464525, 1.859123, 0, 0, 0, 1, 1,
1.677085, 1.916651, 1.13601, 0, 0, 0, 1, 1,
1.687957, 1.743272, 2.225091, 0, 0, 0, 1, 1,
1.704786, 1.391845, 0.9820578, 0, 0, 0, 1, 1,
1.71685, 0.1346412, 1.658335, 0, 0, 0, 1, 1,
1.751072, -0.6832176, 4.423426, 0, 0, 0, 1, 1,
1.759646, -1.81004, 2.671798, 0, 0, 0, 1, 1,
1.776964, 0.3886109, 1.714806, 1, 1, 1, 1, 1,
1.777474, 0.5501183, 0.2768279, 1, 1, 1, 1, 1,
1.818701, -0.08348192, 3.053808, 1, 1, 1, 1, 1,
1.841517, 0.1868751, 1.485383, 1, 1, 1, 1, 1,
1.868727, -0.3987095, -0.021526, 1, 1, 1, 1, 1,
1.888065, 1.021217, -0.1139227, 1, 1, 1, 1, 1,
1.899754, -1.528559, 1.534885, 1, 1, 1, 1, 1,
1.916105, -0.5120818, 2.170676, 1, 1, 1, 1, 1,
1.947822, 0.4112997, 3.607409, 1, 1, 1, 1, 1,
1.967201, -1.008784, 2.811616, 1, 1, 1, 1, 1,
1.982174, -0.5028708, 1.956954, 1, 1, 1, 1, 1,
1.984756, -0.5286548, 0.6866189, 1, 1, 1, 1, 1,
1.997919, -1.285585, 0.426714, 1, 1, 1, 1, 1,
2.016555, -0.2565107, -1.015794, 1, 1, 1, 1, 1,
2.043263, 0.1701454, 1.795092, 1, 1, 1, 1, 1,
2.083771, 0.3081782, 1.326692, 0, 0, 1, 1, 1,
2.11285, -0.5247746, 1.371457, 1, 0, 0, 1, 1,
2.158143, -0.6182522, 1.347349, 1, 0, 0, 1, 1,
2.18271, -0.7503294, 1.953424, 1, 0, 0, 1, 1,
2.241912, 1.172704, -0.6029581, 1, 0, 0, 1, 1,
2.258153, -1.263271, 3.103084, 1, 0, 0, 1, 1,
2.276319, 0.560499, 1.081015, 0, 0, 0, 1, 1,
2.293969, -0.4596373, 1.241903, 0, 0, 0, 1, 1,
2.315419, 0.2837978, 2.012963, 0, 0, 0, 1, 1,
2.380293, 1.887159, 1.756496, 0, 0, 0, 1, 1,
2.387444, -1.960658, 0.9676936, 0, 0, 0, 1, 1,
2.395236, -1.653133, 2.148628, 0, 0, 0, 1, 1,
2.433557, -0.2602924, 2.056024, 0, 0, 0, 1, 1,
2.499205, -0.4440273, 1.530978, 1, 1, 1, 1, 1,
2.855837, 1.658349, 1.97537, 1, 1, 1, 1, 1,
2.907869, -0.653528, 0.3719333, 1, 1, 1, 1, 1,
2.923816, -1.108585, 1.275282, 1, 1, 1, 1, 1,
2.96617, -0.33207, 2.144846, 1, 1, 1, 1, 1,
3.150354, -0.05815472, -0.8439461, 1, 1, 1, 1, 1,
3.747667, -0.3967881, -1.118614, 1, 1, 1, 1, 1
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
var radius = 9.402122;
var distance = 33.02456;
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
mvMatrix.translate( -0.4317929, 0.06053853, -0.1907852 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.02456);
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
