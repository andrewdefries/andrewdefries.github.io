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
-2.983824, -0.8870969, -2.992846, 1, 0, 0, 1,
-2.843998, -1.006611, -4.231771, 1, 0.007843138, 0, 1,
-2.694992, -1.2468, -3.094035, 1, 0.01176471, 0, 1,
-2.55112, -0.974718, -2.557284, 1, 0.01960784, 0, 1,
-2.432149, -1.352386, -2.442065, 1, 0.02352941, 0, 1,
-2.415755, -1.903218, -3.530101, 1, 0.03137255, 0, 1,
-2.308662, 1.749457, 1.403132, 1, 0.03529412, 0, 1,
-2.236551, 0.1386501, -2.57134, 1, 0.04313726, 0, 1,
-2.235534, -0.219078, -2.19272, 1, 0.04705882, 0, 1,
-2.19811, 1.69205, -0.3457124, 1, 0.05490196, 0, 1,
-2.195862, -1.043904, -1.350672, 1, 0.05882353, 0, 1,
-2.194423, 0.679202, -1.164661, 1, 0.06666667, 0, 1,
-2.164867, -0.372443, -1.184095, 1, 0.07058824, 0, 1,
-2.112994, 0.2840556, -3.032425, 1, 0.07843138, 0, 1,
-2.105579, 0.02819156, -2.85188, 1, 0.08235294, 0, 1,
-2.09386, -0.7803189, -2.617603, 1, 0.09019608, 0, 1,
-2.062263, 1.057314, -0.4437478, 1, 0.09411765, 0, 1,
-2.058242, 0.556966, -1.872265, 1, 0.1019608, 0, 1,
-2.036637, 0.1467961, -1.08069, 1, 0.1098039, 0, 1,
-2.024339, 0.2115916, -2.290063, 1, 0.1137255, 0, 1,
-1.99435, 0.1644996, -1.794322, 1, 0.1215686, 0, 1,
-1.978297, -0.8423436, -2.749384, 1, 0.1254902, 0, 1,
-1.969807, -1.006389, -2.797433, 1, 0.1333333, 0, 1,
-1.952097, -0.01513656, -1.585309, 1, 0.1372549, 0, 1,
-1.94333, -1.233693, -3.138247, 1, 0.145098, 0, 1,
-1.926008, 0.8892134, -0.7530102, 1, 0.1490196, 0, 1,
-1.925738, 1.182376, -2.287755, 1, 0.1568628, 0, 1,
-1.911371, -0.5070709, -2.355209, 1, 0.1607843, 0, 1,
-1.895862, 1.308671, -0.7699478, 1, 0.1686275, 0, 1,
-1.873411, 1.442307, -2.883005, 1, 0.172549, 0, 1,
-1.857217, -0.1664442, -0.595403, 1, 0.1803922, 0, 1,
-1.827459, -1.47567, -2.909016, 1, 0.1843137, 0, 1,
-1.820545, -0.6621514, -1.178966, 1, 0.1921569, 0, 1,
-1.808386, -1.886356, -3.653699, 1, 0.1960784, 0, 1,
-1.78987, -0.4925655, -2.912618, 1, 0.2039216, 0, 1,
-1.785423, 1.621034, -2.0894, 1, 0.2117647, 0, 1,
-1.778204, 1.389187, 0.08554287, 1, 0.2156863, 0, 1,
-1.753746, 1.093465, 0.05600066, 1, 0.2235294, 0, 1,
-1.732382, -0.2077813, -1.146194, 1, 0.227451, 0, 1,
-1.717839, -0.3270285, -1.799471, 1, 0.2352941, 0, 1,
-1.693151, -0.2241048, -1.518209, 1, 0.2392157, 0, 1,
-1.690493, -0.5006636, -3.175548, 1, 0.2470588, 0, 1,
-1.689797, 2.828242, -1.450203, 1, 0.2509804, 0, 1,
-1.686406, -0.2578837, -1.982691, 1, 0.2588235, 0, 1,
-1.675604, -0.5920272, -3.342972, 1, 0.2627451, 0, 1,
-1.657908, -2.313468, -2.004696, 1, 0.2705882, 0, 1,
-1.648496, -1.319062, -2.196735, 1, 0.2745098, 0, 1,
-1.642475, -0.3280648, -2.239601, 1, 0.282353, 0, 1,
-1.640909, 2.807328, 0.6914685, 1, 0.2862745, 0, 1,
-1.639083, 0.007282116, -1.297498, 1, 0.2941177, 0, 1,
-1.63376, -1.513013, -2.164988, 1, 0.3019608, 0, 1,
-1.631661, 0.2733554, -1.938749, 1, 0.3058824, 0, 1,
-1.626777, 0.216414, -2.056864, 1, 0.3137255, 0, 1,
-1.619603, 0.8137206, -0.9784346, 1, 0.3176471, 0, 1,
-1.615764, -0.5932663, -2.634513, 1, 0.3254902, 0, 1,
-1.607141, -1.225706, -1.952656, 1, 0.3294118, 0, 1,
-1.563905, 0.8047078, 0.3494583, 1, 0.3372549, 0, 1,
-1.537675, -0.6976178, -3.101137, 1, 0.3411765, 0, 1,
-1.530104, -0.9790605, -1.252144, 1, 0.3490196, 0, 1,
-1.52315, -0.1052988, -0.5555064, 1, 0.3529412, 0, 1,
-1.517266, -0.234459, -2.602542, 1, 0.3607843, 0, 1,
-1.495969, 0.198948, -1.466636, 1, 0.3647059, 0, 1,
-1.492634, 0.2332619, 0.0890819, 1, 0.372549, 0, 1,
-1.489914, 1.551745, -0.1584583, 1, 0.3764706, 0, 1,
-1.485113, 0.7001635, -1.348737, 1, 0.3843137, 0, 1,
-1.459502, 0.6007993, -1.408333, 1, 0.3882353, 0, 1,
-1.447109, -0.9846519, -3.403829, 1, 0.3960784, 0, 1,
-1.437689, 1.969759, -0.6170956, 1, 0.4039216, 0, 1,
-1.436072, 0.04032857, -1.049554, 1, 0.4078431, 0, 1,
-1.432208, -0.679157, -2.269758, 1, 0.4156863, 0, 1,
-1.420944, 1.112053, -1.175496, 1, 0.4196078, 0, 1,
-1.399719, -0.7206981, -2.221073, 1, 0.427451, 0, 1,
-1.398615, 1.271087, 0.193479, 1, 0.4313726, 0, 1,
-1.388309, 0.4935374, -0.01173206, 1, 0.4392157, 0, 1,
-1.385826, -0.05149781, -2.756868, 1, 0.4431373, 0, 1,
-1.3789, 0.9922479, 0.1877545, 1, 0.4509804, 0, 1,
-1.367907, 0.483934, -0.3306096, 1, 0.454902, 0, 1,
-1.363346, -0.4983717, -1.887513, 1, 0.4627451, 0, 1,
-1.356884, -0.670788, -2.289467, 1, 0.4666667, 0, 1,
-1.34851, 0.2753122, -1.174733, 1, 0.4745098, 0, 1,
-1.341959, -0.1814154, -2.888996, 1, 0.4784314, 0, 1,
-1.332641, 0.9066389, -0.5269627, 1, 0.4862745, 0, 1,
-1.319808, -0.3836212, -2.730893, 1, 0.4901961, 0, 1,
-1.317204, -0.15306, -2.190872, 1, 0.4980392, 0, 1,
-1.308681, 0.9657223, -0.3520187, 1, 0.5058824, 0, 1,
-1.301139, -0.1840946, -0.2520294, 1, 0.509804, 0, 1,
-1.294366, -0.2268411, -2.099375, 1, 0.5176471, 0, 1,
-1.289174, -0.2136525, -2.784432, 1, 0.5215687, 0, 1,
-1.288228, 0.6015585, -0.6350506, 1, 0.5294118, 0, 1,
-1.285043, 0.2679097, -2.325383, 1, 0.5333334, 0, 1,
-1.264238, 0.9568897, -1.806736, 1, 0.5411765, 0, 1,
-1.261197, 1.826541, -1.938164, 1, 0.5450981, 0, 1,
-1.258223, -0.8952665, -2.145252, 1, 0.5529412, 0, 1,
-1.256442, 0.05215753, -0.08725753, 1, 0.5568628, 0, 1,
-1.250053, 0.1488053, -0.7955706, 1, 0.5647059, 0, 1,
-1.2389, 1.344198, -0.9911273, 1, 0.5686275, 0, 1,
-1.219492, -0.8888748, -3.207802, 1, 0.5764706, 0, 1,
-1.217523, -1.079072, -1.988523, 1, 0.5803922, 0, 1,
-1.198445, 0.0564684, -1.540798, 1, 0.5882353, 0, 1,
-1.196772, -0.08918879, -0.1654832, 1, 0.5921569, 0, 1,
-1.192716, 0.3894458, -0.6638607, 1, 0.6, 0, 1,
-1.178608, -0.5417143, -1.489374, 1, 0.6078432, 0, 1,
-1.177058, 0.7025124, -0.8682212, 1, 0.6117647, 0, 1,
-1.168669, 1.262587, -1.59207, 1, 0.6196079, 0, 1,
-1.162287, 0.01458385, -0.4081781, 1, 0.6235294, 0, 1,
-1.149587, 2.840619, 0.5566318, 1, 0.6313726, 0, 1,
-1.147226, 1.603838, 2.237561, 1, 0.6352941, 0, 1,
-1.14455, -0.4133946, -2.962121, 1, 0.6431373, 0, 1,
-1.142578, 0.1253684, -1.62801, 1, 0.6470588, 0, 1,
-1.140907, 0.2085335, -0.8694268, 1, 0.654902, 0, 1,
-1.137488, -0.2987991, -1.355608, 1, 0.6588235, 0, 1,
-1.130053, 0.1009112, -1.725554, 1, 0.6666667, 0, 1,
-1.11339, -0.524193, -3.605321, 1, 0.6705883, 0, 1,
-1.11157, -0.9597293, -0.8666922, 1, 0.6784314, 0, 1,
-1.109173, 0.7548175, 0.7906738, 1, 0.682353, 0, 1,
-1.105913, 1.508705, -1.163921, 1, 0.6901961, 0, 1,
-1.104208, 0.2423522, -0.5407031, 1, 0.6941177, 0, 1,
-1.077511, -0.9159108, -1.162724, 1, 0.7019608, 0, 1,
-1.061507, 0.2953992, -1.802806, 1, 0.7098039, 0, 1,
-1.060668, -0.2914051, -2.378499, 1, 0.7137255, 0, 1,
-1.05598, -0.6434489, -2.627841, 1, 0.7215686, 0, 1,
-1.052728, -1.327808, -2.766019, 1, 0.7254902, 0, 1,
-1.05233, -0.6729988, -2.053203, 1, 0.7333333, 0, 1,
-1.048948, 1.670574, 1.582655, 1, 0.7372549, 0, 1,
-1.045556, -1.360596, -3.175228, 1, 0.7450981, 0, 1,
-1.038266, 0.1606696, -0.5557387, 1, 0.7490196, 0, 1,
-1.038069, 0.09810787, -2.822154, 1, 0.7568628, 0, 1,
-1.037432, 2.684415, -0.8575755, 1, 0.7607843, 0, 1,
-1.01796, 2.953854, -0.2812956, 1, 0.7686275, 0, 1,
-1.016007, 1.756207, -0.4644048, 1, 0.772549, 0, 1,
-1.004822, -1.375448, -2.985763, 1, 0.7803922, 0, 1,
-1.004134, -0.6880038, -3.132854, 1, 0.7843137, 0, 1,
-1.003792, 0.7861952, 0.7904903, 1, 0.7921569, 0, 1,
-1.002761, 1.081482, -1.014935, 1, 0.7960784, 0, 1,
-0.9996223, -0.6462623, -2.63147, 1, 0.8039216, 0, 1,
-0.9977819, -0.7021437, -2.599937, 1, 0.8117647, 0, 1,
-0.99607, 0.6688803, -0.3472168, 1, 0.8156863, 0, 1,
-0.9909319, -0.5395955, -1.377452, 1, 0.8235294, 0, 1,
-0.9880813, 0.8605133, 0.1645998, 1, 0.827451, 0, 1,
-0.9823949, 0.3800032, -1.04391, 1, 0.8352941, 0, 1,
-0.9777049, -1.78246, -1.972756, 1, 0.8392157, 0, 1,
-0.9760836, 0.03832794, -2.487279, 1, 0.8470588, 0, 1,
-0.9652077, -0.01619617, -0.9558771, 1, 0.8509804, 0, 1,
-0.9620072, -1.438609, -2.255412, 1, 0.8588235, 0, 1,
-0.9576914, 0.9306801, -1.751671, 1, 0.8627451, 0, 1,
-0.9574251, -0.3799269, -3.250163, 1, 0.8705882, 0, 1,
-0.954039, 0.840994, -0.1370522, 1, 0.8745098, 0, 1,
-0.9535742, -0.6017814, -2.223418, 1, 0.8823529, 0, 1,
-0.9491577, -1.821399, -1.845263, 1, 0.8862745, 0, 1,
-0.941914, 0.1561806, -1.878438, 1, 0.8941177, 0, 1,
-0.9418836, -0.8444223, -1.923654, 1, 0.8980392, 0, 1,
-0.9405614, 0.352889, -0.6585451, 1, 0.9058824, 0, 1,
-0.9402305, 0.1467917, -2.103072, 1, 0.9137255, 0, 1,
-0.9397785, 0.1515048, -3.741153, 1, 0.9176471, 0, 1,
-0.9393452, -0.6364443, -2.913547, 1, 0.9254902, 0, 1,
-0.9376311, -0.9843242, -2.088578, 1, 0.9294118, 0, 1,
-0.9327624, -0.3248114, -3.626955, 1, 0.9372549, 0, 1,
-0.9278466, 1.923598, 1.230791, 1, 0.9411765, 0, 1,
-0.9274341, -0.08170653, -1.608773, 1, 0.9490196, 0, 1,
-0.9273969, 0.4928914, -1.045659, 1, 0.9529412, 0, 1,
-0.9273065, 1.713327, -0.5756149, 1, 0.9607843, 0, 1,
-0.9252654, -0.8500941, -0.5095875, 1, 0.9647059, 0, 1,
-0.9186489, 0.1074802, -0.8262674, 1, 0.972549, 0, 1,
-0.910442, 0.2087157, -1.451087, 1, 0.9764706, 0, 1,
-0.9014829, 1.467261, -0.9049206, 1, 0.9843137, 0, 1,
-0.8975524, -0.02094865, -2.296425, 1, 0.9882353, 0, 1,
-0.8963006, -1.231521, -1.244053, 1, 0.9960784, 0, 1,
-0.8948548, -0.1556471, -1.068104, 0.9960784, 1, 0, 1,
-0.8919833, 0.6752045, -0.8809447, 0.9921569, 1, 0, 1,
-0.8831396, 0.8969488, 0.00137862, 0.9843137, 1, 0, 1,
-0.880677, 1.174299, -1.681601, 0.9803922, 1, 0, 1,
-0.873863, -0.04411063, -3.016225, 0.972549, 1, 0, 1,
-0.870969, -0.6398493, -2.85812, 0.9686275, 1, 0, 1,
-0.8642226, 1.798783, -0.8447487, 0.9607843, 1, 0, 1,
-0.863079, -1.127248, -3.154607, 0.9568627, 1, 0, 1,
-0.8626961, 1.382173, 0.3990885, 0.9490196, 1, 0, 1,
-0.8598539, 1.11139, -0.8034204, 0.945098, 1, 0, 1,
-0.8568701, -0.3886503, -1.059303, 0.9372549, 1, 0, 1,
-0.8562989, 1.448242, -0.7843479, 0.9333333, 1, 0, 1,
-0.8462635, -1.06117, -2.047634, 0.9254902, 1, 0, 1,
-0.8458794, -0.7680266, -2.590008, 0.9215686, 1, 0, 1,
-0.841848, -2.358142, -2.035991, 0.9137255, 1, 0, 1,
-0.8383247, 1.52914, -0.9533068, 0.9098039, 1, 0, 1,
-0.8364255, 1.290934, 0.3773059, 0.9019608, 1, 0, 1,
-0.8356345, -1.970494, -2.228033, 0.8941177, 1, 0, 1,
-0.8270513, -0.3669689, -1.871583, 0.8901961, 1, 0, 1,
-0.8230773, -1.718268, -1.732008, 0.8823529, 1, 0, 1,
-0.8226163, -0.342928, -3.629729, 0.8784314, 1, 0, 1,
-0.8221416, -0.8556383, -2.363715, 0.8705882, 1, 0, 1,
-0.8182756, -0.0745826, -1.431963, 0.8666667, 1, 0, 1,
-0.8178118, 0.1916969, -1.747802, 0.8588235, 1, 0, 1,
-0.8164492, -0.5312193, -3.550303, 0.854902, 1, 0, 1,
-0.8138512, 1.00031, -0.9258979, 0.8470588, 1, 0, 1,
-0.812079, 0.6314042, -2.498031, 0.8431373, 1, 0, 1,
-0.8115155, -0.9749157, -3.877776, 0.8352941, 1, 0, 1,
-0.811044, -2.308914, -1.951401, 0.8313726, 1, 0, 1,
-0.8105411, -0.4221899, -2.416009, 0.8235294, 1, 0, 1,
-0.8082315, -0.5400176, -3.84688, 0.8196079, 1, 0, 1,
-0.8067136, -2.115543, -3.332327, 0.8117647, 1, 0, 1,
-0.8055469, 0.4362929, -1.563858, 0.8078431, 1, 0, 1,
-0.8007507, 0.2501506, -0.4189638, 0.8, 1, 0, 1,
-0.8006142, 1.190002, 0.3597797, 0.7921569, 1, 0, 1,
-0.7983166, 0.2249103, -2.404707, 0.7882353, 1, 0, 1,
-0.7940049, -0.8127777, -3.582592, 0.7803922, 1, 0, 1,
-0.7917425, -0.6722445, -1.63508, 0.7764706, 1, 0, 1,
-0.7916518, 0.724127, -2.610355, 0.7686275, 1, 0, 1,
-0.777658, 0.9673687, -1.68527, 0.7647059, 1, 0, 1,
-0.7769834, 1.564281, 1.113152, 0.7568628, 1, 0, 1,
-0.7766479, 0.557201, 0.6040969, 0.7529412, 1, 0, 1,
-0.7738302, 0.01550769, -0.4873932, 0.7450981, 1, 0, 1,
-0.7685997, -0.1039033, -1.590174, 0.7411765, 1, 0, 1,
-0.767737, 1.579747, 1.541255, 0.7333333, 1, 0, 1,
-0.7665941, 0.4703833, 0.2383742, 0.7294118, 1, 0, 1,
-0.7654016, 1.35632, -0.2852018, 0.7215686, 1, 0, 1,
-0.7642644, 0.3054047, -1.134001, 0.7176471, 1, 0, 1,
-0.7636115, -2.101307, -4.600154, 0.7098039, 1, 0, 1,
-0.7589002, -0.8065048, -1.152686, 0.7058824, 1, 0, 1,
-0.7537596, -0.2596672, -2.5654, 0.6980392, 1, 0, 1,
-0.749238, -0.397769, -2.038287, 0.6901961, 1, 0, 1,
-0.748848, 0.6851814, -1.67108, 0.6862745, 1, 0, 1,
-0.7473879, 0.6703618, -1.102908, 0.6784314, 1, 0, 1,
-0.7441951, 0.7072031, -0.8894776, 0.6745098, 1, 0, 1,
-0.7436944, -0.1189558, -1.901202, 0.6666667, 1, 0, 1,
-0.7388992, 0.1341156, -0.8238699, 0.6627451, 1, 0, 1,
-0.7385668, -0.2371444, -0.6867492, 0.654902, 1, 0, 1,
-0.7323358, -0.422804, -1.303005, 0.6509804, 1, 0, 1,
-0.7269388, 0.9213789, 0.4005769, 0.6431373, 1, 0, 1,
-0.7214698, -1.257088, -1.567233, 0.6392157, 1, 0, 1,
-0.721297, 0.8570684, -1.065151, 0.6313726, 1, 0, 1,
-0.7205995, 0.3333125, -2.294135, 0.627451, 1, 0, 1,
-0.7196168, 0.006616163, -0.03441347, 0.6196079, 1, 0, 1,
-0.7189861, 0.7885876, -1.117412, 0.6156863, 1, 0, 1,
-0.7189192, 1.365433, 0.9104589, 0.6078432, 1, 0, 1,
-0.7145608, -2.291032, -1.853997, 0.6039216, 1, 0, 1,
-0.7137199, 0.8412586, -1.872164, 0.5960785, 1, 0, 1,
-0.7110646, 0.2229618, -2.879946, 0.5882353, 1, 0, 1,
-0.7014499, -0.04219894, -2.077498, 0.5843138, 1, 0, 1,
-0.700268, 1.331156, -0.9380406, 0.5764706, 1, 0, 1,
-0.692591, -0.5408283, -0.2073977, 0.572549, 1, 0, 1,
-0.6911559, -1.569086, -2.776487, 0.5647059, 1, 0, 1,
-0.6893539, -1.836746, -2.364332, 0.5607843, 1, 0, 1,
-0.6876885, -0.9221804, -2.390238, 0.5529412, 1, 0, 1,
-0.6857955, -0.1248968, -2.052907, 0.5490196, 1, 0, 1,
-0.6785825, 0.05550963, -0.2374137, 0.5411765, 1, 0, 1,
-0.6762791, -0.5097814, -4.119276, 0.5372549, 1, 0, 1,
-0.6724764, -0.9220949, -2.080357, 0.5294118, 1, 0, 1,
-0.6720812, -1.742431, -2.354008, 0.5254902, 1, 0, 1,
-0.6696503, -1.076761, -3.145306, 0.5176471, 1, 0, 1,
-0.6692188, -2.534154, -4.671809, 0.5137255, 1, 0, 1,
-0.6687021, -0.8618212, -2.465883, 0.5058824, 1, 0, 1,
-0.6677069, 0.2511865, -1.750686, 0.5019608, 1, 0, 1,
-0.6629457, -2.507811, -1.404257, 0.4941176, 1, 0, 1,
-0.6600289, -0.2326788, -1.230719, 0.4862745, 1, 0, 1,
-0.6523641, -0.02210838, 0.2728911, 0.4823529, 1, 0, 1,
-0.6520259, -0.5083126, -3.898589, 0.4745098, 1, 0, 1,
-0.6514553, 0.7432698, -1.102788, 0.4705882, 1, 0, 1,
-0.6512957, 1.465336, -0.6082826, 0.4627451, 1, 0, 1,
-0.647975, 0.02888031, 0.9412249, 0.4588235, 1, 0, 1,
-0.6429439, -0.140909, -2.801109, 0.4509804, 1, 0, 1,
-0.6408229, -1.32627, -3.055482, 0.4470588, 1, 0, 1,
-0.6400508, -0.6902808, -2.669124, 0.4392157, 1, 0, 1,
-0.6387971, -0.01652426, -2.142156, 0.4352941, 1, 0, 1,
-0.6346187, -0.219741, -2.353182, 0.427451, 1, 0, 1,
-0.6295311, 2.136202, 0.0535486, 0.4235294, 1, 0, 1,
-0.6234536, -0.5486206, -2.3453, 0.4156863, 1, 0, 1,
-0.6218491, 0.2248289, -2.525771, 0.4117647, 1, 0, 1,
-0.6162306, 0.05581572, -3.297204, 0.4039216, 1, 0, 1,
-0.6154534, -1.034192, -2.130626, 0.3960784, 1, 0, 1,
-0.6138214, 1.037253, 0.1242355, 0.3921569, 1, 0, 1,
-0.6067147, -0.7114251, -0.7753049, 0.3843137, 1, 0, 1,
-0.604105, 0.2320163, -0.3518138, 0.3803922, 1, 0, 1,
-0.6019058, -0.7783259, -2.91854, 0.372549, 1, 0, 1,
-0.5988964, 0.3398583, -0.5204363, 0.3686275, 1, 0, 1,
-0.5970933, -1.06062, -1.086563, 0.3607843, 1, 0, 1,
-0.5969755, -1.481689, -0.361052, 0.3568628, 1, 0, 1,
-0.593035, -0.04503641, -2.172116, 0.3490196, 1, 0, 1,
-0.582791, 1.667037, 0.1765229, 0.345098, 1, 0, 1,
-0.5826227, -0.9698513, 0.1581244, 0.3372549, 1, 0, 1,
-0.5781879, -0.7348732, -1.707309, 0.3333333, 1, 0, 1,
-0.5768342, 0.01570247, -2.177619, 0.3254902, 1, 0, 1,
-0.5758508, -0.5214102, -2.918554, 0.3215686, 1, 0, 1,
-0.5717805, 0.1977485, -0.06790087, 0.3137255, 1, 0, 1,
-0.5717686, -2.141954, -3.240268, 0.3098039, 1, 0, 1,
-0.5713283, 0.5811438, -1.294965, 0.3019608, 1, 0, 1,
-0.5712824, 0.3147399, -1.260206, 0.2941177, 1, 0, 1,
-0.5696768, 0.6654884, -1.418726, 0.2901961, 1, 0, 1,
-0.5662943, 0.3144583, 0.5266566, 0.282353, 1, 0, 1,
-0.5579155, -1.016407, -2.843853, 0.2784314, 1, 0, 1,
-0.5571812, 1.474185, -0.534202, 0.2705882, 1, 0, 1,
-0.5544831, 0.4331971, -0.5793051, 0.2666667, 1, 0, 1,
-0.5512519, -0.9651045, -3.601699, 0.2588235, 1, 0, 1,
-0.5473926, 1.088494, -0.792383, 0.254902, 1, 0, 1,
-0.5446079, -2.212474, -4.024546, 0.2470588, 1, 0, 1,
-0.539416, -0.01121666, -1.022721, 0.2431373, 1, 0, 1,
-0.538124, -0.2319263, -0.7261203, 0.2352941, 1, 0, 1,
-0.5375573, -1.033764, -2.239395, 0.2313726, 1, 0, 1,
-0.5371356, 1.359862, -1.45926, 0.2235294, 1, 0, 1,
-0.5326642, 0.8626556, 0.1569125, 0.2196078, 1, 0, 1,
-0.5319958, 0.300588, -0.7070922, 0.2117647, 1, 0, 1,
-0.530558, 1.47675, -0.4359339, 0.2078431, 1, 0, 1,
-0.5222661, 1.315591, -0.1395473, 0.2, 1, 0, 1,
-0.5182702, 0.3599766, 0.1704433, 0.1921569, 1, 0, 1,
-0.5150644, 1.737701, 0.01742971, 0.1882353, 1, 0, 1,
-0.508123, 0.9455858, -0.351025, 0.1803922, 1, 0, 1,
-0.4988784, 0.4693842, -1.868239, 0.1764706, 1, 0, 1,
-0.4957114, 0.1131295, -0.7829885, 0.1686275, 1, 0, 1,
-0.4955124, 0.02736198, -1.183795, 0.1647059, 1, 0, 1,
-0.4908846, 1.504636, -0.3393548, 0.1568628, 1, 0, 1,
-0.4901438, 0.1324802, -2.32204, 0.1529412, 1, 0, 1,
-0.4898362, -1.155461, -5.324655, 0.145098, 1, 0, 1,
-0.4895015, 0.3439206, -0.7865052, 0.1411765, 1, 0, 1,
-0.487265, 0.1802563, -2.793496, 0.1333333, 1, 0, 1,
-0.4819576, 0.8550814, -1.963853, 0.1294118, 1, 0, 1,
-0.4809476, -1.426329, -1.21372, 0.1215686, 1, 0, 1,
-0.4780824, 0.9768821, -1.75711, 0.1176471, 1, 0, 1,
-0.474862, -0.2167549, -2.88787, 0.1098039, 1, 0, 1,
-0.4727663, 0.7123222, 0.8263479, 0.1058824, 1, 0, 1,
-0.4696096, 0.1345269, -1.923832, 0.09803922, 1, 0, 1,
-0.4676934, -0.02360769, -1.283189, 0.09019608, 1, 0, 1,
-0.4659075, -1.781442, -2.737941, 0.08627451, 1, 0, 1,
-0.4621851, 1.082715, -1.741169, 0.07843138, 1, 0, 1,
-0.4563178, 0.1916032, -0.2317141, 0.07450981, 1, 0, 1,
-0.4553891, -0.8169064, -2.821892, 0.06666667, 1, 0, 1,
-0.4543183, -0.5612683, -2.359928, 0.0627451, 1, 0, 1,
-0.4476581, -1.152745, -1.429935, 0.05490196, 1, 0, 1,
-0.4434521, -0.2615934, -3.030283, 0.05098039, 1, 0, 1,
-0.4378017, -1.184359, -4.321465, 0.04313726, 1, 0, 1,
-0.4370272, 0.04455479, -3.031605, 0.03921569, 1, 0, 1,
-0.4369301, -0.01656955, -1.836134, 0.03137255, 1, 0, 1,
-0.4318714, -0.8791705, -1.931116, 0.02745098, 1, 0, 1,
-0.428993, -1.097413, -2.695839, 0.01960784, 1, 0, 1,
-0.4275688, 0.503307, 0.5129328, 0.01568628, 1, 0, 1,
-0.4272847, -0.9099756, -4.305113, 0.007843138, 1, 0, 1,
-0.4257606, 1.040945, 0.05844961, 0.003921569, 1, 0, 1,
-0.4228299, -2.916046, -2.013339, 0, 1, 0.003921569, 1,
-0.420974, 0.6365379, -0.8963675, 0, 1, 0.01176471, 1,
-0.4171403, 0.634166, 0.9981276, 0, 1, 0.01568628, 1,
-0.4163349, -1.180856, -4.97497, 0, 1, 0.02352941, 1,
-0.4153595, 0.03359859, 0.07239169, 0, 1, 0.02745098, 1,
-0.413353, 1.069338, 0.03654974, 0, 1, 0.03529412, 1,
-0.4124462, -0.02512537, -0.8519443, 0, 1, 0.03921569, 1,
-0.4122435, 0.412601, -0.3806571, 0, 1, 0.04705882, 1,
-0.4116176, -0.8601879, -1.826, 0, 1, 0.05098039, 1,
-0.4107974, -0.2455079, -1.84961, 0, 1, 0.05882353, 1,
-0.4082944, -0.5560942, -2.83546, 0, 1, 0.0627451, 1,
-0.4015294, 1.161256, -0.7854939, 0, 1, 0.07058824, 1,
-0.3985479, -0.06321909, -2.223424, 0, 1, 0.07450981, 1,
-0.3931759, 1.293828, -1.184477, 0, 1, 0.08235294, 1,
-0.3929779, 0.04679904, -1.973305, 0, 1, 0.08627451, 1,
-0.39188, -0.4053908, -2.212512, 0, 1, 0.09411765, 1,
-0.3891672, -2.164053, -2.021143, 0, 1, 0.1019608, 1,
-0.388364, 0.7658597, 0.6294354, 0, 1, 0.1058824, 1,
-0.3845049, -0.401665, -2.018543, 0, 1, 0.1137255, 1,
-0.3791909, -1.987565, -2.969544, 0, 1, 0.1176471, 1,
-0.3732579, -0.8725045, -2.241271, 0, 1, 0.1254902, 1,
-0.37018, -0.1670899, -1.560142, 0, 1, 0.1294118, 1,
-0.3694508, -1.059412, -3.205401, 0, 1, 0.1372549, 1,
-0.3683779, 1.584125, -0.09079163, 0, 1, 0.1411765, 1,
-0.3560336, -0.2164297, -3.631205, 0, 1, 0.1490196, 1,
-0.3518397, 0.9913682, -0.9190419, 0, 1, 0.1529412, 1,
-0.3493019, 0.7011818, 0.528199, 0, 1, 0.1607843, 1,
-0.3459886, 0.9933553, 2.725683, 0, 1, 0.1647059, 1,
-0.3447402, 1.283889, -0.221491, 0, 1, 0.172549, 1,
-0.3423492, 0.4987697, -0.7469696, 0, 1, 0.1764706, 1,
-0.3410647, 0.008898592, -0.5534266, 0, 1, 0.1843137, 1,
-0.3384866, -0.5344201, -1.727412, 0, 1, 0.1882353, 1,
-0.3354334, -0.627178, -0.8988225, 0, 1, 0.1960784, 1,
-0.3323152, -0.0992126, -3.10065, 0, 1, 0.2039216, 1,
-0.3323043, 0.6618544, 0.3494372, 0, 1, 0.2078431, 1,
-0.318474, -0.5213001, -0.1872536, 0, 1, 0.2156863, 1,
-0.3180546, -0.4466702, -1.845065, 0, 1, 0.2196078, 1,
-0.3160635, -0.1065204, -2.748917, 0, 1, 0.227451, 1,
-0.3157021, -0.7452325, -1.689443, 0, 1, 0.2313726, 1,
-0.3143962, -0.7863941, -1.387616, 0, 1, 0.2392157, 1,
-0.3107086, 1.108661, 0.7581401, 0, 1, 0.2431373, 1,
-0.3087844, 1.146877, 0.2378578, 0, 1, 0.2509804, 1,
-0.3044662, -0.004973748, -1.577259, 0, 1, 0.254902, 1,
-0.3009787, -0.1734029, -2.895161, 0, 1, 0.2627451, 1,
-0.2986908, -0.7008442, -1.592595, 0, 1, 0.2666667, 1,
-0.2951672, -1.587129, -3.422759, 0, 1, 0.2745098, 1,
-0.2902488, 0.1492755, -2.528388, 0, 1, 0.2784314, 1,
-0.2884884, -0.3109869, -1.235005, 0, 1, 0.2862745, 1,
-0.2881042, -1.489043, -4.69227, 0, 1, 0.2901961, 1,
-0.2878608, 0.3735941, -1.498492, 0, 1, 0.2980392, 1,
-0.2861397, 0.2379831, 0.5231559, 0, 1, 0.3058824, 1,
-0.2825582, -0.4955364, -2.093143, 0, 1, 0.3098039, 1,
-0.28209, 1.4378, -0.4186033, 0, 1, 0.3176471, 1,
-0.2777402, -0.2777816, -2.812475, 0, 1, 0.3215686, 1,
-0.2771901, 1.257981, 0.964879, 0, 1, 0.3294118, 1,
-0.2759076, -0.2090096, -1.638498, 0, 1, 0.3333333, 1,
-0.2754482, -0.5858296, -3.989896, 0, 1, 0.3411765, 1,
-0.2745597, -1.276891, -2.28392, 0, 1, 0.345098, 1,
-0.2741317, 0.8406171, 1.287259, 0, 1, 0.3529412, 1,
-0.2711161, -1.726627, -2.63927, 0, 1, 0.3568628, 1,
-0.2686225, -0.7836051, -3.269323, 0, 1, 0.3647059, 1,
-0.2685129, 0.6952426, -0.921532, 0, 1, 0.3686275, 1,
-0.2666323, -0.8273355, -1.914783, 0, 1, 0.3764706, 1,
-0.2634152, -0.2866136, -0.5021327, 0, 1, 0.3803922, 1,
-0.2634064, 1.341831, 0.1480921, 0, 1, 0.3882353, 1,
-0.262973, -1.157096, -2.340113, 0, 1, 0.3921569, 1,
-0.2604294, -0.6929377, -2.776721, 0, 1, 0.4, 1,
-0.2594167, 2.113173, 1.949358, 0, 1, 0.4078431, 1,
-0.2508072, -0.1196871, -1.897379, 0, 1, 0.4117647, 1,
-0.2486483, 0.02329525, -2.584999, 0, 1, 0.4196078, 1,
-0.2484002, -1.09174, -2.742815, 0, 1, 0.4235294, 1,
-0.2467725, 0.2065979, -0.5465606, 0, 1, 0.4313726, 1,
-0.2459019, 0.04026346, -2.820302, 0, 1, 0.4352941, 1,
-0.2449379, 1.282447, -0.6429609, 0, 1, 0.4431373, 1,
-0.2411734, -0.2512114, -2.457594, 0, 1, 0.4470588, 1,
-0.2350215, -0.2828136, -2.018497, 0, 1, 0.454902, 1,
-0.230186, -0.0309216, -1.895218, 0, 1, 0.4588235, 1,
-0.2293221, -0.8152405, -1.380832, 0, 1, 0.4666667, 1,
-0.2286162, 0.324654, -0.297543, 0, 1, 0.4705882, 1,
-0.2232477, -0.1158935, -3.283176, 0, 1, 0.4784314, 1,
-0.2231448, -0.9828217, -2.234694, 0, 1, 0.4823529, 1,
-0.2228558, 1.470808, 0.6813656, 0, 1, 0.4901961, 1,
-0.2180219, -0.1903857, -2.976718, 0, 1, 0.4941176, 1,
-0.2175408, 0.8426116, 1.295571, 0, 1, 0.5019608, 1,
-0.2163545, 0.8989753, -1.512136, 0, 1, 0.509804, 1,
-0.2154417, -1.884672, -2.785061, 0, 1, 0.5137255, 1,
-0.2138677, -0.1662694, -1.110948, 0, 1, 0.5215687, 1,
-0.205026, -0.07907928, -2.6359, 0, 1, 0.5254902, 1,
-0.2049973, 0.2441203, 0.1703281, 0, 1, 0.5333334, 1,
-0.2019807, 2.368698, -0.6111276, 0, 1, 0.5372549, 1,
-0.2006917, 0.2075729, -0.7953774, 0, 1, 0.5450981, 1,
-0.2000534, -1.212145, -1.510641, 0, 1, 0.5490196, 1,
-0.1961024, -0.4491513, -1.727146, 0, 1, 0.5568628, 1,
-0.1938431, 0.2966865, 0.6314358, 0, 1, 0.5607843, 1,
-0.1925271, -0.6947691, -2.917266, 0, 1, 0.5686275, 1,
-0.1924269, -1.219802, -4.010205, 0, 1, 0.572549, 1,
-0.1911283, 1.578189, -0.7539384, 0, 1, 0.5803922, 1,
-0.1909098, 1.015615, 0.3846261, 0, 1, 0.5843138, 1,
-0.1874034, -1.129539, -2.472652, 0, 1, 0.5921569, 1,
-0.1809692, -1.901331, -1.193114, 0, 1, 0.5960785, 1,
-0.1792556, 1.716654, 0.5759663, 0, 1, 0.6039216, 1,
-0.1770098, 0.9900739, 0.4932714, 0, 1, 0.6117647, 1,
-0.177009, 0.8783078, 0.2821849, 0, 1, 0.6156863, 1,
-0.1770047, 1.29203, 1.139932, 0, 1, 0.6235294, 1,
-0.1767942, 0.5206445, 0.9995177, 0, 1, 0.627451, 1,
-0.1767815, 0.356566, -2.05486, 0, 1, 0.6352941, 1,
-0.1736528, -0.8715638, -3.177573, 0, 1, 0.6392157, 1,
-0.16966, -0.04606692, -2.260758, 0, 1, 0.6470588, 1,
-0.1600311, -0.1386425, -0.8356355, 0, 1, 0.6509804, 1,
-0.1539651, 0.03757257, -1.045239, 0, 1, 0.6588235, 1,
-0.1511123, -1.146498, -2.256974, 0, 1, 0.6627451, 1,
-0.1493783, 1.060544, 1.268995, 0, 1, 0.6705883, 1,
-0.1463135, 0.8124757, -0.2225572, 0, 1, 0.6745098, 1,
-0.1455622, 1.438423, -0.148734, 0, 1, 0.682353, 1,
-0.1417204, -0.2340444, -3.316633, 0, 1, 0.6862745, 1,
-0.1397933, 1.67106, -0.2835096, 0, 1, 0.6941177, 1,
-0.1359595, 0.1967749, -0.4098585, 0, 1, 0.7019608, 1,
-0.1353862, -1.221284, -3.33483, 0, 1, 0.7058824, 1,
-0.1347686, -0.8789647, -1.553742, 0, 1, 0.7137255, 1,
-0.1322843, 0.2307799, -1.722721, 0, 1, 0.7176471, 1,
-0.1292634, 1.382699, -1.003401, 0, 1, 0.7254902, 1,
-0.1270452, 0.6842713, 0.9435598, 0, 1, 0.7294118, 1,
-0.1259278, -2.264335, -2.277704, 0, 1, 0.7372549, 1,
-0.1253122, -0.2922238, -4.355793, 0, 1, 0.7411765, 1,
-0.1247912, -0.1157583, -3.597154, 0, 1, 0.7490196, 1,
-0.1233231, 0.4940937, 0.1998391, 0, 1, 0.7529412, 1,
-0.1227865, 2.80861, -0.9339924, 0, 1, 0.7607843, 1,
-0.1206257, -0.3329018, -1.473033, 0, 1, 0.7647059, 1,
-0.1175507, -1.148055, -2.238062, 0, 1, 0.772549, 1,
-0.1150689, 1.875784, -1.333624, 0, 1, 0.7764706, 1,
-0.1127892, -0.8851004, -3.624992, 0, 1, 0.7843137, 1,
-0.1059364, 0.5051696, 1.075047, 0, 1, 0.7882353, 1,
-0.102488, -0.5240021, -3.304513, 0, 1, 0.7960784, 1,
-0.09889816, -1.435097, -3.122133, 0, 1, 0.8039216, 1,
-0.09604672, 0.05788842, -3.214949, 0, 1, 0.8078431, 1,
-0.09546155, -0.3406993, -2.850755, 0, 1, 0.8156863, 1,
-0.0939327, 0.7416419, -1.439916, 0, 1, 0.8196079, 1,
-0.08928508, 1.746563, 0.7299171, 0, 1, 0.827451, 1,
-0.0878469, 0.07424518, -2.138397, 0, 1, 0.8313726, 1,
-0.0866442, 0.3011622, -1.011386, 0, 1, 0.8392157, 1,
-0.08468275, 0.4477962, 0.01568944, 0, 1, 0.8431373, 1,
-0.08440283, -2.2644, -2.039299, 0, 1, 0.8509804, 1,
-0.08408871, -1.340368, -2.851282, 0, 1, 0.854902, 1,
-0.0825913, 1.330414, -0.05600791, 0, 1, 0.8627451, 1,
-0.08194504, 1.77781, -0.7079663, 0, 1, 0.8666667, 1,
-0.08010902, 0.834537, -0.7261379, 0, 1, 0.8745098, 1,
-0.07986938, -1.328312, -1.671471, 0, 1, 0.8784314, 1,
-0.07673117, -0.51336, -2.372035, 0, 1, 0.8862745, 1,
-0.07612365, 1.458762, 2.120438, 0, 1, 0.8901961, 1,
-0.07346822, 0.7188833, 1.090881, 0, 1, 0.8980392, 1,
-0.07169845, 0.5906041, 0.6002061, 0, 1, 0.9058824, 1,
-0.0697973, -1.020998, -2.773909, 0, 1, 0.9098039, 1,
-0.06973774, -0.131809, -1.086388, 0, 1, 0.9176471, 1,
-0.06680645, -0.1493894, -1.715736, 0, 1, 0.9215686, 1,
-0.06119616, 0.4698385, 0.9486279, 0, 1, 0.9294118, 1,
-0.05816475, 0.5739235, -0.3189481, 0, 1, 0.9333333, 1,
-0.05793246, 1.325189, -0.02578106, 0, 1, 0.9411765, 1,
-0.05565079, -0.7255717, -2.590721, 0, 1, 0.945098, 1,
-0.05559797, 1.372762, -0.4950374, 0, 1, 0.9529412, 1,
-0.05329068, -1.013193, -3.639769, 0, 1, 0.9568627, 1,
-0.05055183, -0.7300336, -2.456634, 0, 1, 0.9647059, 1,
-0.04956754, -0.5585422, -3.629076, 0, 1, 0.9686275, 1,
-0.04913255, -0.8935052, -3.336444, 0, 1, 0.9764706, 1,
-0.04715769, 0.5026215, -1.086189, 0, 1, 0.9803922, 1,
-0.04586146, -0.6837621, -3.114919, 0, 1, 0.9882353, 1,
-0.04418043, -0.3887536, -2.945493, 0, 1, 0.9921569, 1,
-0.04143694, -1.212467, -3.297721, 0, 1, 1, 1,
-0.04095057, -0.7565059, -3.059285, 0, 0.9921569, 1, 1,
-0.03317388, -0.8632709, -6.185151, 0, 0.9882353, 1, 1,
-0.03154729, 1.591003, -0.8491039, 0, 0.9803922, 1, 1,
-0.02953814, -2.429028, -2.36315, 0, 0.9764706, 1, 1,
-0.02711877, 0.7488346, 1.140154, 0, 0.9686275, 1, 1,
-0.02283345, -3.273495, -2.072624, 0, 0.9647059, 1, 1,
-0.02084751, -1.017502, -4.071273, 0, 0.9568627, 1, 1,
-0.01719326, -0.4072623, -2.828854, 0, 0.9529412, 1, 1,
-0.01685162, 0.5353677, -1.741352, 0, 0.945098, 1, 1,
-0.01409786, -2.354186, -3.651857, 0, 0.9411765, 1, 1,
-0.01302586, 0.01070857, -0.3535097, 0, 0.9333333, 1, 1,
-0.00906379, 0.752004, 0.5278329, 0, 0.9294118, 1, 1,
-0.002732036, 0.2479438, 1.63462, 0, 0.9215686, 1, 1,
0.004159138, 0.892698, 0.8626361, 0, 0.9176471, 1, 1,
0.006357172, 0.5318097, 0.666513, 0, 0.9098039, 1, 1,
0.008187616, -0.4682342, 3.270132, 0, 0.9058824, 1, 1,
0.009156125, -0.3353513, 4.915904, 0, 0.8980392, 1, 1,
0.0118969, 2.088687, -0.1611606, 0, 0.8901961, 1, 1,
0.01538656, -0.9459212, 3.149752, 0, 0.8862745, 1, 1,
0.01567657, -0.01103719, 1.555113, 0, 0.8784314, 1, 1,
0.01735245, 1.606262, 0.1687536, 0, 0.8745098, 1, 1,
0.02578962, -0.232274, 2.776917, 0, 0.8666667, 1, 1,
0.02826273, -0.6123312, 3.162147, 0, 0.8627451, 1, 1,
0.02986736, -0.9642308, 2.251514, 0, 0.854902, 1, 1,
0.03179227, 0.788174, -1.576968, 0, 0.8509804, 1, 1,
0.03457257, 0.9347973, 0.09891168, 0, 0.8431373, 1, 1,
0.03877303, -0.9713395, 3.192968, 0, 0.8392157, 1, 1,
0.03893675, -0.1637143, 2.585464, 0, 0.8313726, 1, 1,
0.04040619, 0.3271222, -1.223565, 0, 0.827451, 1, 1,
0.04375191, 1.001491, -0.851465, 0, 0.8196079, 1, 1,
0.0437868, 0.7577871, -0.7351408, 0, 0.8156863, 1, 1,
0.04442206, -0.8801179, 1.792828, 0, 0.8078431, 1, 1,
0.04841021, 1.774044, -0.1995841, 0, 0.8039216, 1, 1,
0.05381151, -0.8529408, 2.431479, 0, 0.7960784, 1, 1,
0.06280074, -1.341694, 2.757748, 0, 0.7882353, 1, 1,
0.06427869, 0.1995972, -0.3290561, 0, 0.7843137, 1, 1,
0.06624991, 0.5603139, 1.098739, 0, 0.7764706, 1, 1,
0.06677952, -0.3206767, 4.270912, 0, 0.772549, 1, 1,
0.07040291, -0.7450707, 2.700363, 0, 0.7647059, 1, 1,
0.07133552, -0.4411182, 2.553707, 0, 0.7607843, 1, 1,
0.07341588, -0.06333494, 2.113815, 0, 0.7529412, 1, 1,
0.07407759, 0.4309559, -0.1364869, 0, 0.7490196, 1, 1,
0.07652292, -1.12384, 1.226622, 0, 0.7411765, 1, 1,
0.07761048, -0.1658837, 3.545961, 0, 0.7372549, 1, 1,
0.0793893, -0.5428773, 2.597366, 0, 0.7294118, 1, 1,
0.07947015, 0.1909322, 1.351689, 0, 0.7254902, 1, 1,
0.08090442, 1.141416, 0.0423407, 0, 0.7176471, 1, 1,
0.08114454, -1.243731, 1.470253, 0, 0.7137255, 1, 1,
0.08410047, 0.03703849, 2.38212, 0, 0.7058824, 1, 1,
0.08443549, -0.01772964, 1.835887, 0, 0.6980392, 1, 1,
0.08495267, 1.437435, -0.1517132, 0, 0.6941177, 1, 1,
0.08823598, -0.03573871, 0.848987, 0, 0.6862745, 1, 1,
0.08843008, -0.2392219, 2.227333, 0, 0.682353, 1, 1,
0.09025488, 1.478183, -0.2157366, 0, 0.6745098, 1, 1,
0.09074288, 0.243192, 0.5446779, 0, 0.6705883, 1, 1,
0.09444748, -0.8822415, 4.207795, 0, 0.6627451, 1, 1,
0.09903239, 0.224627, -0.7842141, 0, 0.6588235, 1, 1,
0.1001357, 0.1099829, 2.075373, 0, 0.6509804, 1, 1,
0.1002415, 0.3573143, 0.2913499, 0, 0.6470588, 1, 1,
0.1050115, 0.9759669, 1.34367, 0, 0.6392157, 1, 1,
0.1056077, -1.108825, 1.540921, 0, 0.6352941, 1, 1,
0.1070857, -0.1643336, 1.648541, 0, 0.627451, 1, 1,
0.1105829, 0.5388739, -0.3144859, 0, 0.6235294, 1, 1,
0.1119339, -1.245764, 4.40393, 0, 0.6156863, 1, 1,
0.1122422, -0.623659, 2.74671, 0, 0.6117647, 1, 1,
0.1143124, 0.2500689, 0.2899785, 0, 0.6039216, 1, 1,
0.1171829, 0.7145171, -0.6568046, 0, 0.5960785, 1, 1,
0.1267059, -0.3323399, 1.706896, 0, 0.5921569, 1, 1,
0.1297094, -0.2562718, 3.462445, 0, 0.5843138, 1, 1,
0.1307957, -0.06811908, 3.164374, 0, 0.5803922, 1, 1,
0.1340305, 3.496603, -1.859128, 0, 0.572549, 1, 1,
0.1346481, 1.375409, 0.01750649, 0, 0.5686275, 1, 1,
0.1349188, 0.7514573, -0.2348964, 0, 0.5607843, 1, 1,
0.1394944, -1.52212, 2.543079, 0, 0.5568628, 1, 1,
0.1407045, -0.9274715, 3.034985, 0, 0.5490196, 1, 1,
0.1414663, -0.78319, 4.187318, 0, 0.5450981, 1, 1,
0.1417056, 1.019023, 0.5750026, 0, 0.5372549, 1, 1,
0.1430789, -1.110181, 3.184118, 0, 0.5333334, 1, 1,
0.1442937, -0.6305542, 4.644608, 0, 0.5254902, 1, 1,
0.1443236, 0.2975481, 0.9893856, 0, 0.5215687, 1, 1,
0.1472656, 0.347262, -0.2763874, 0, 0.5137255, 1, 1,
0.1483516, -1.197591, 1.795774, 0, 0.509804, 1, 1,
0.150664, -1.067882, 2.39968, 0, 0.5019608, 1, 1,
0.1515294, -1.085817, 3.488537, 0, 0.4941176, 1, 1,
0.1550746, 0.9587345, 1.821509, 0, 0.4901961, 1, 1,
0.1560579, 2.41922, 2.205526, 0, 0.4823529, 1, 1,
0.1575684, 0.392715, 0.428588, 0, 0.4784314, 1, 1,
0.1586377, -0.7911811, 2.750437, 0, 0.4705882, 1, 1,
0.1613568, -0.6668452, 3.166306, 0, 0.4666667, 1, 1,
0.1638478, -1.054549, 2.252681, 0, 0.4588235, 1, 1,
0.165981, -0.3898296, 3.538924, 0, 0.454902, 1, 1,
0.1687559, -0.8762062, 4.406738, 0, 0.4470588, 1, 1,
0.1806362, -0.3385167, 1.951266, 0, 0.4431373, 1, 1,
0.1810949, 0.7359695, -0.6377501, 0, 0.4352941, 1, 1,
0.1811213, 1.535766, 0.2007842, 0, 0.4313726, 1, 1,
0.1826356, -0.2897198, 1.552722, 0, 0.4235294, 1, 1,
0.1862646, -1.073004, 4.082244, 0, 0.4196078, 1, 1,
0.1930577, -0.7794344, 1.318311, 0, 0.4117647, 1, 1,
0.1935596, 0.547262, 0.6930161, 0, 0.4078431, 1, 1,
0.1967569, -1.421339, 3.735978, 0, 0.4, 1, 1,
0.1980633, 0.2366206, 0.01570114, 0, 0.3921569, 1, 1,
0.1998826, -0.002656385, 2.656865, 0, 0.3882353, 1, 1,
0.2013241, -1.503844, 3.681499, 0, 0.3803922, 1, 1,
0.2069247, 0.2208291, 0.8901905, 0, 0.3764706, 1, 1,
0.2138712, -0.0721639, 1.034306, 0, 0.3686275, 1, 1,
0.2168427, -0.08355405, 2.295433, 0, 0.3647059, 1, 1,
0.2203494, -0.8313434, 2.06002, 0, 0.3568628, 1, 1,
0.2237462, -1.909825, 4.539422, 0, 0.3529412, 1, 1,
0.2313917, -0.3933969, 4.260966, 0, 0.345098, 1, 1,
0.2349468, -1.56513, 2.203875, 0, 0.3411765, 1, 1,
0.2349811, 1.011228, -0.2453192, 0, 0.3333333, 1, 1,
0.2357051, -1.097461, 4.56632, 0, 0.3294118, 1, 1,
0.2415727, 1.372532, -0.636936, 0, 0.3215686, 1, 1,
0.2449881, 0.8249261, 1.488324, 0, 0.3176471, 1, 1,
0.245089, 0.7039747, -0.1106399, 0, 0.3098039, 1, 1,
0.2476554, 0.2480763, 0.7270112, 0, 0.3058824, 1, 1,
0.247948, 0.3350939, 1.088822, 0, 0.2980392, 1, 1,
0.2495525, -1.650225, 2.595233, 0, 0.2901961, 1, 1,
0.2514856, -0.750645, 3.304719, 0, 0.2862745, 1, 1,
0.2564767, -0.20888, 2.002378, 0, 0.2784314, 1, 1,
0.2622974, 1.902483, -0.4256302, 0, 0.2745098, 1, 1,
0.2651515, 0.6795702, 1.541567, 0, 0.2666667, 1, 1,
0.2666234, -0.512432, 4.115621, 0, 0.2627451, 1, 1,
0.2690772, -0.6696235, 1.647435, 0, 0.254902, 1, 1,
0.2785308, 1.025022, -2.137004, 0, 0.2509804, 1, 1,
0.2843792, -2.540107, 1.104412, 0, 0.2431373, 1, 1,
0.2862466, -0.005852112, 1.660319, 0, 0.2392157, 1, 1,
0.2877473, -0.472131, 0.8651686, 0, 0.2313726, 1, 1,
0.2878439, -0.3128368, 2.217077, 0, 0.227451, 1, 1,
0.2896001, 0.3719508, 1.287807, 0, 0.2196078, 1, 1,
0.290545, 1.666929, 0.418581, 0, 0.2156863, 1, 1,
0.293506, -0.6450621, 3.209574, 0, 0.2078431, 1, 1,
0.2944266, 0.7736872, -1.063195, 0, 0.2039216, 1, 1,
0.2944955, 1.035714, 0.8920985, 0, 0.1960784, 1, 1,
0.2971101, -0.8558301, 4.247418, 0, 0.1882353, 1, 1,
0.2977828, 0.6231334, 0.6584619, 0, 0.1843137, 1, 1,
0.3005343, 0.4626253, 0.9376498, 0, 0.1764706, 1, 1,
0.3090044, 0.9437834, 0.9029409, 0, 0.172549, 1, 1,
0.3093638, -0.1642777, 1.705564, 0, 0.1647059, 1, 1,
0.3101082, 0.8301417, -1.790619, 0, 0.1607843, 1, 1,
0.3123362, -1.017797, 4.058957, 0, 0.1529412, 1, 1,
0.3129186, 0.1414416, 0.9459883, 0, 0.1490196, 1, 1,
0.3183484, 0.1932429, 1.092924, 0, 0.1411765, 1, 1,
0.3231775, -0.5332813, 2.69306, 0, 0.1372549, 1, 1,
0.3233864, -0.03520278, 3.258346, 0, 0.1294118, 1, 1,
0.3240968, 1.890463, -0.3443987, 0, 0.1254902, 1, 1,
0.3269567, -1.332476, 0.509338, 0, 0.1176471, 1, 1,
0.3285723, -0.1028862, 3.61465, 0, 0.1137255, 1, 1,
0.3291497, -0.5058717, 3.835155, 0, 0.1058824, 1, 1,
0.3365274, 0.6512291, -0.304634, 0, 0.09803922, 1, 1,
0.3391146, 0.5718747, 1.749346, 0, 0.09411765, 1, 1,
0.3486733, -0.665504, 4.044878, 0, 0.08627451, 1, 1,
0.3530442, -0.1968511, 2.885599, 0, 0.08235294, 1, 1,
0.3538548, -1.502329, 2.746691, 0, 0.07450981, 1, 1,
0.3648948, -0.8549345, 2.517527, 0, 0.07058824, 1, 1,
0.3678432, -0.09290624, 1.495728, 0, 0.0627451, 1, 1,
0.3742613, 0.2257635, -1.327722, 0, 0.05882353, 1, 1,
0.3780217, 1.312019, 0.8390961, 0, 0.05098039, 1, 1,
0.3800315, 1.512853, 1.835113, 0, 0.04705882, 1, 1,
0.3879202, 0.2353795, 2.857809, 0, 0.03921569, 1, 1,
0.3908073, -1.621155, 3.579501, 0, 0.03529412, 1, 1,
0.391713, -1.911579, 4.992638, 0, 0.02745098, 1, 1,
0.3929735, 0.7619325, -1.043622, 0, 0.02352941, 1, 1,
0.3931789, 0.1490024, 0.6903225, 0, 0.01568628, 1, 1,
0.4019099, -1.562869, 0.631337, 0, 0.01176471, 1, 1,
0.4030421, 0.6504785, 0.7859943, 0, 0.003921569, 1, 1,
0.4043614, 1.224447, 0.6935787, 0.003921569, 0, 1, 1,
0.4138518, -0.3863223, 1.943583, 0.007843138, 0, 1, 1,
0.4151049, 1.182014, 1.837779, 0.01568628, 0, 1, 1,
0.4162218, 0.5685053, 0.5440042, 0.01960784, 0, 1, 1,
0.4248313, -1.017711, 2.731458, 0.02745098, 0, 1, 1,
0.4248552, -0.1452384, 3.441962, 0.03137255, 0, 1, 1,
0.4259641, 1.482038, 0.08357837, 0.03921569, 0, 1, 1,
0.4271977, 1.899976, -0.01510526, 0.04313726, 0, 1, 1,
0.4331199, -0.0725329, 2.100524, 0.05098039, 0, 1, 1,
0.4411803, -0.5210564, 2.482465, 0.05490196, 0, 1, 1,
0.4445562, -0.6549363, 3.092216, 0.0627451, 0, 1, 1,
0.4455248, -0.4039375, 3.04116, 0.06666667, 0, 1, 1,
0.4505056, -0.1562738, 4.042902, 0.07450981, 0, 1, 1,
0.4510171, 0.1802532, 1.568631, 0.07843138, 0, 1, 1,
0.4577664, -1.362732, 1.306274, 0.08627451, 0, 1, 1,
0.4594175, 1.124845, 0.8212323, 0.09019608, 0, 1, 1,
0.4645034, -0.5203188, 3.532431, 0.09803922, 0, 1, 1,
0.4719815, 0.3076655, -0.2846717, 0.1058824, 0, 1, 1,
0.4782635, -1.167069, 1.947287, 0.1098039, 0, 1, 1,
0.4803184, -0.2134344, 2.947181, 0.1176471, 0, 1, 1,
0.4823152, 2.229047, 0.5969096, 0.1215686, 0, 1, 1,
0.483802, 1.096243, 0.1838071, 0.1294118, 0, 1, 1,
0.4864007, 0.3803095, 0.02692625, 0.1333333, 0, 1, 1,
0.4872744, -0.6069075, 1.947802, 0.1411765, 0, 1, 1,
0.4908864, -0.6679863, 1.577351, 0.145098, 0, 1, 1,
0.4943683, -0.2988212, 3.285391, 0.1529412, 0, 1, 1,
0.4955897, -1.943495, 0.8873236, 0.1568628, 0, 1, 1,
0.4987738, 0.5606694, 1.051614, 0.1647059, 0, 1, 1,
0.5005462, -0.8917329, 2.570993, 0.1686275, 0, 1, 1,
0.5014923, -1.637314, 3.086712, 0.1764706, 0, 1, 1,
0.5025977, 1.172482, 0.1299733, 0.1803922, 0, 1, 1,
0.5075541, 1.714187, 0.2767621, 0.1882353, 0, 1, 1,
0.5131132, -0.13692, 2.068259, 0.1921569, 0, 1, 1,
0.5189907, -0.934463, 4.074624, 0.2, 0, 1, 1,
0.5223842, 1.580695, 1.085244, 0.2078431, 0, 1, 1,
0.524991, 1.204674, 0.3088298, 0.2117647, 0, 1, 1,
0.5260444, 0.09347522, 2.61962, 0.2196078, 0, 1, 1,
0.5328496, 0.7049406, -1.372147, 0.2235294, 0, 1, 1,
0.5357581, -0.01662057, 1.588455, 0.2313726, 0, 1, 1,
0.536501, -0.9097273, 4.414608, 0.2352941, 0, 1, 1,
0.5391298, -0.6301616, 2.254338, 0.2431373, 0, 1, 1,
0.54097, 1.027506, 0.6676304, 0.2470588, 0, 1, 1,
0.5430709, 0.2769366, 0.06414134, 0.254902, 0, 1, 1,
0.5471904, -0.8857732, 2.781001, 0.2588235, 0, 1, 1,
0.5523757, -0.5345412, 1.638626, 0.2666667, 0, 1, 1,
0.5532283, -1.255914, 1.456216, 0.2705882, 0, 1, 1,
0.5564788, -0.9877692, 0.2660896, 0.2784314, 0, 1, 1,
0.5564836, -1.075453, 2.19543, 0.282353, 0, 1, 1,
0.5577309, 0.1960121, 2.162089, 0.2901961, 0, 1, 1,
0.5673813, 0.7604636, -0.1081387, 0.2941177, 0, 1, 1,
0.5703238, 0.05978926, 1.655179, 0.3019608, 0, 1, 1,
0.5716474, 0.03677715, 0.3088838, 0.3098039, 0, 1, 1,
0.5719357, -1.667527, 2.860825, 0.3137255, 0, 1, 1,
0.5785658, -0.9635991, 2.833474, 0.3215686, 0, 1, 1,
0.5792138, -1.08563, 2.689454, 0.3254902, 0, 1, 1,
0.5825651, -0.6875388, 3.422538, 0.3333333, 0, 1, 1,
0.5825778, -1.033702, 3.120918, 0.3372549, 0, 1, 1,
0.5869126, 0.1676583, 0.8846117, 0.345098, 0, 1, 1,
0.5869177, -0.2275129, 0.6962098, 0.3490196, 0, 1, 1,
0.5876734, -0.8832017, 3.403006, 0.3568628, 0, 1, 1,
0.5930881, -1.42622, 1.582837, 0.3607843, 0, 1, 1,
0.5941081, -0.590084, 1.816148, 0.3686275, 0, 1, 1,
0.5957347, 0.8887483, -0.0733669, 0.372549, 0, 1, 1,
0.5963664, -0.8465475, 3.081718, 0.3803922, 0, 1, 1,
0.5997458, -1.178543, 3.133142, 0.3843137, 0, 1, 1,
0.6000758, 0.3462196, 2.100253, 0.3921569, 0, 1, 1,
0.6006046, -0.7799442, 1.261677, 0.3960784, 0, 1, 1,
0.6222062, 0.9489108, 1.802717, 0.4039216, 0, 1, 1,
0.6226825, -0.1122264, 2.466621, 0.4117647, 0, 1, 1,
0.6229047, -1.988664, 4.049987, 0.4156863, 0, 1, 1,
0.6312234, 0.6825123, 1.037533, 0.4235294, 0, 1, 1,
0.6385475, -0.6298568, 1.5349, 0.427451, 0, 1, 1,
0.640107, -0.8773099, 2.066843, 0.4352941, 0, 1, 1,
0.6403859, -0.6401196, 1.403909, 0.4392157, 0, 1, 1,
0.6451626, -0.8755238, 1.907659, 0.4470588, 0, 1, 1,
0.6456934, 0.3555365, 2.580342, 0.4509804, 0, 1, 1,
0.6478118, 0.8106685, 2.723162, 0.4588235, 0, 1, 1,
0.6503384, -0.4051015, 2.621397, 0.4627451, 0, 1, 1,
0.6507456, -1.127394, 2.643226, 0.4705882, 0, 1, 1,
0.6622751, -0.1871759, 1.936355, 0.4745098, 0, 1, 1,
0.6667315, -1.724202, 3.593831, 0.4823529, 0, 1, 1,
0.6668339, 1.3741, 2.495698, 0.4862745, 0, 1, 1,
0.6721215, 0.1150176, 1.296641, 0.4941176, 0, 1, 1,
0.6723663, 0.001173176, 3.03408, 0.5019608, 0, 1, 1,
0.6827252, 0.2944, -0.6520928, 0.5058824, 0, 1, 1,
0.688208, 2.309694, 0.4848639, 0.5137255, 0, 1, 1,
0.6888041, -2.098644, 2.31969, 0.5176471, 0, 1, 1,
0.6893359, 0.2975282, -0.1186938, 0.5254902, 0, 1, 1,
0.6951004, 1.652544, -0.6582609, 0.5294118, 0, 1, 1,
0.6952459, -1.171507, 2.563215, 0.5372549, 0, 1, 1,
0.6973348, 1.704407, 0.2459363, 0.5411765, 0, 1, 1,
0.7015306, 1.440736, 0.3563055, 0.5490196, 0, 1, 1,
0.7088006, -1.132801, -0.2362733, 0.5529412, 0, 1, 1,
0.7101136, 1.268219, -1.120132, 0.5607843, 0, 1, 1,
0.7165028, 1.539989, -0.07401053, 0.5647059, 0, 1, 1,
0.7230519, 0.08391226, 1.047868, 0.572549, 0, 1, 1,
0.723272, -0.07480201, 0.5100448, 0.5764706, 0, 1, 1,
0.7233295, -0.1375256, 0.3034947, 0.5843138, 0, 1, 1,
0.7248186, 0.1214248, 0.8065432, 0.5882353, 0, 1, 1,
0.7341386, 1.010032, 0.8064166, 0.5960785, 0, 1, 1,
0.735406, 1.531047, 0.02220543, 0.6039216, 0, 1, 1,
0.7360539, 0.6054396, 0.9145505, 0.6078432, 0, 1, 1,
0.7364133, -0.07905976, 0.09266628, 0.6156863, 0, 1, 1,
0.7417656, 0.60237, 2.920953, 0.6196079, 0, 1, 1,
0.7434517, 0.03502009, 0.1946156, 0.627451, 0, 1, 1,
0.7447976, -0.2872164, 1.601042, 0.6313726, 0, 1, 1,
0.7478185, 0.07796649, 1.668419, 0.6392157, 0, 1, 1,
0.7559292, -1.735659, 4.067523, 0.6431373, 0, 1, 1,
0.7575095, 2.127342, 0.3872433, 0.6509804, 0, 1, 1,
0.7616878, -0.7378411, 3.188926, 0.654902, 0, 1, 1,
0.7682544, -0.2133793, 0.6959554, 0.6627451, 0, 1, 1,
0.7698449, -1.467357, 4.115204, 0.6666667, 0, 1, 1,
0.7702428, 0.007910782, 0.3160881, 0.6745098, 0, 1, 1,
0.7708876, 1.464446, 1.388998, 0.6784314, 0, 1, 1,
0.7720628, -1.461199, 1.412509, 0.6862745, 0, 1, 1,
0.7736272, -1.63154, 2.475197, 0.6901961, 0, 1, 1,
0.7738302, 0.5566481, 2.668687, 0.6980392, 0, 1, 1,
0.7747498, 1.265045, 0.3615744, 0.7058824, 0, 1, 1,
0.7757995, 0.3130156, 0.6222044, 0.7098039, 0, 1, 1,
0.7856321, -0.5134847, 2.162323, 0.7176471, 0, 1, 1,
0.7930597, 0.6161968, 0.2519893, 0.7215686, 0, 1, 1,
0.8036922, 0.157774, 1.742139, 0.7294118, 0, 1, 1,
0.8042504, 1.282642, 0.4199771, 0.7333333, 0, 1, 1,
0.8045879, 0.09871662, 0.4920059, 0.7411765, 0, 1, 1,
0.8047864, -2.186682, 3.297929, 0.7450981, 0, 1, 1,
0.8086327, 0.2931608, 1.10269, 0.7529412, 0, 1, 1,
0.8115681, 1.596749, -0.04531389, 0.7568628, 0, 1, 1,
0.8129072, 0.5521766, 0.7631446, 0.7647059, 0, 1, 1,
0.8144741, 2.170532, -1.265088, 0.7686275, 0, 1, 1,
0.8149834, 0.4572892, 1.971013, 0.7764706, 0, 1, 1,
0.8161631, 0.6622119, 1.423798, 0.7803922, 0, 1, 1,
0.8163858, -1.003851, 3.480449, 0.7882353, 0, 1, 1,
0.816955, 0.3103089, 1.382956, 0.7921569, 0, 1, 1,
0.8223812, -2.068325, 4.089365, 0.8, 0, 1, 1,
0.8336482, -0.1133783, 2.87486, 0.8078431, 0, 1, 1,
0.8372469, -0.1543306, 2.548955, 0.8117647, 0, 1, 1,
0.838785, -1.458312, -0.02160842, 0.8196079, 0, 1, 1,
0.8449901, -1.228749, 3.064178, 0.8235294, 0, 1, 1,
0.8483015, -2.449418, 2.713671, 0.8313726, 0, 1, 1,
0.8522624, -1.106656, 3.617749, 0.8352941, 0, 1, 1,
0.8558558, -1.697149, 2.910119, 0.8431373, 0, 1, 1,
0.8578583, 0.8228178, 0.8981795, 0.8470588, 0, 1, 1,
0.8590894, -1.522285, 2.960695, 0.854902, 0, 1, 1,
0.8596604, -0.2197758, 1.177096, 0.8588235, 0, 1, 1,
0.8599677, 0.1437922, -0.1583462, 0.8666667, 0, 1, 1,
0.8691577, -1.269033, 4.675753, 0.8705882, 0, 1, 1,
0.8712212, -1.33305, 2.768713, 0.8784314, 0, 1, 1,
0.8844779, -1.45706, 3.78375, 0.8823529, 0, 1, 1,
0.8875331, 0.60218, -0.4553112, 0.8901961, 0, 1, 1,
0.8923022, 0.1164071, 0.9043822, 0.8941177, 0, 1, 1,
0.8926338, -1.243919, 2.908423, 0.9019608, 0, 1, 1,
0.8939617, -2.322141, 3.622841, 0.9098039, 0, 1, 1,
0.8942088, 0.03332121, 0.5276276, 0.9137255, 0, 1, 1,
0.9001272, 1.987061, -1.260301, 0.9215686, 0, 1, 1,
0.9036301, -1.110895, 3.574147, 0.9254902, 0, 1, 1,
0.9071326, -1.991416, 2.333133, 0.9333333, 0, 1, 1,
0.9146869, 1.195936, -0.4241627, 0.9372549, 0, 1, 1,
0.9235576, -2.086403, 3.061886, 0.945098, 0, 1, 1,
0.9249526, -1.219876, 4.012874, 0.9490196, 0, 1, 1,
0.9270052, -0.268639, 2.04577, 0.9568627, 0, 1, 1,
0.927251, 0.394049, 2.41021, 0.9607843, 0, 1, 1,
0.9282034, 1.426175, 0.648461, 0.9686275, 0, 1, 1,
0.9312196, 1.35357, 1.187957, 0.972549, 0, 1, 1,
0.9411061, 0.6999037, 1.200968, 0.9803922, 0, 1, 1,
0.9413719, -0.7778216, 3.181397, 0.9843137, 0, 1, 1,
0.9462093, -1.03687, 2.433859, 0.9921569, 0, 1, 1,
0.9555716, -1.400776, 2.588376, 0.9960784, 0, 1, 1,
0.9576918, 1.703055, 0.9757308, 1, 0, 0.9960784, 1,
0.9613038, 0.4709201, 1.437776, 1, 0, 0.9882353, 1,
0.961489, -0.1502781, 1.589158, 1, 0, 0.9843137, 1,
0.9626625, 0.04363866, 1.194335, 1, 0, 0.9764706, 1,
0.963449, -0.1176492, 2.571813, 1, 0, 0.972549, 1,
0.9762303, 0.02119204, 1.370249, 1, 0, 0.9647059, 1,
0.9800824, 0.8058546, 1.970703, 1, 0, 0.9607843, 1,
0.9813866, -1.547186, 3.716315, 1, 0, 0.9529412, 1,
0.9890297, -0.05717796, 1.125418, 1, 0, 0.9490196, 1,
1.001081, 0.01584242, 1.653028, 1, 0, 0.9411765, 1,
1.004903, 0.09008007, 0.8929524, 1, 0, 0.9372549, 1,
1.012545, 1.987021, 0.09034128, 1, 0, 0.9294118, 1,
1.015568, 1.298291, -0.1961261, 1, 0, 0.9254902, 1,
1.02918, -0.9968878, 0.7095779, 1, 0, 0.9176471, 1,
1.029242, 0.2572347, -0.01667046, 1, 0, 0.9137255, 1,
1.036899, 0.5520983, 2.011411, 1, 0, 0.9058824, 1,
1.046699, 0.1496181, 2.546932, 1, 0, 0.9019608, 1,
1.048792, 0.6435821, 0.6442662, 1, 0, 0.8941177, 1,
1.060474, 1.067726, 0.07563457, 1, 0, 0.8862745, 1,
1.075389, 0.5634715, 2.502774, 1, 0, 0.8823529, 1,
1.080494, 0.5837784, 1.837393, 1, 0, 0.8745098, 1,
1.083206, 1.221967, -0.3909447, 1, 0, 0.8705882, 1,
1.084267, 1.600025, 0.7480227, 1, 0, 0.8627451, 1,
1.100714, 0.5523583, 1.977093, 1, 0, 0.8588235, 1,
1.101393, -0.02503518, 1.234098, 1, 0, 0.8509804, 1,
1.102281, -1.865294, 3.037738, 1, 0, 0.8470588, 1,
1.110337, -2.567097, 3.054874, 1, 0, 0.8392157, 1,
1.11151, 0.8808046, 0.247324, 1, 0, 0.8352941, 1,
1.120103, 0.1489421, 1.967655, 1, 0, 0.827451, 1,
1.121003, -0.28167, 1.517406, 1, 0, 0.8235294, 1,
1.124534, 0.299713, 2.608588, 1, 0, 0.8156863, 1,
1.124978, -0.3923201, 2.521914, 1, 0, 0.8117647, 1,
1.130385, 0.5342807, 1.24047, 1, 0, 0.8039216, 1,
1.140578, 0.2175355, 3.487909, 1, 0, 0.7960784, 1,
1.144006, -0.245197, 0.2030917, 1, 0, 0.7921569, 1,
1.14773, -1.770615, 2.981501, 1, 0, 0.7843137, 1,
1.149238, 1.042304, 1.434859, 1, 0, 0.7803922, 1,
1.15211, -0.6730543, 4.318203, 1, 0, 0.772549, 1,
1.154117, -0.9746245, 1.928976, 1, 0, 0.7686275, 1,
1.158337, -0.1344844, 2.354479, 1, 0, 0.7607843, 1,
1.162507, -1.034442, 3.069243, 1, 0, 0.7568628, 1,
1.16321, 1.518696, 1.459368, 1, 0, 0.7490196, 1,
1.169369, 0.4668767, -0.3664238, 1, 0, 0.7450981, 1,
1.172617, -0.2337881, 0.2592549, 1, 0, 0.7372549, 1,
1.173076, -0.2041142, 2.073251, 1, 0, 0.7333333, 1,
1.177625, -2.052002, 2.572353, 1, 0, 0.7254902, 1,
1.180803, 0.3648812, 0.9711455, 1, 0, 0.7215686, 1,
1.18114, -0.6336984, 2.417815, 1, 0, 0.7137255, 1,
1.182219, 0.2929195, 1.201073, 1, 0, 0.7098039, 1,
1.186162, -0.01315633, 1.180773, 1, 0, 0.7019608, 1,
1.192016, -1.529514, 3.441343, 1, 0, 0.6941177, 1,
1.195668, 1.200011, -0.3900585, 1, 0, 0.6901961, 1,
1.197695, -0.391201, 1.954936, 1, 0, 0.682353, 1,
1.200371, -0.8727897, 0.5472695, 1, 0, 0.6784314, 1,
1.212696, -1.029551, 1.849944, 1, 0, 0.6705883, 1,
1.219787, 2.415385, -0.6407091, 1, 0, 0.6666667, 1,
1.225116, -0.493744, 1.914402, 1, 0, 0.6588235, 1,
1.227693, 1.742651, 0.1001983, 1, 0, 0.654902, 1,
1.237136, 0.331016, 0.4782527, 1, 0, 0.6470588, 1,
1.238551, -0.339207, 2.338444, 1, 0, 0.6431373, 1,
1.244352, -0.3526314, 2.568733, 1, 0, 0.6352941, 1,
1.245254, -1.099017, 2.922263, 1, 0, 0.6313726, 1,
1.245528, 0.3263228, 1.514414, 1, 0, 0.6235294, 1,
1.246496, 0.1380723, 1.261192, 1, 0, 0.6196079, 1,
1.252214, 2.046427, 1.183337, 1, 0, 0.6117647, 1,
1.254941, 0.8370324, 0.01355483, 1, 0, 0.6078432, 1,
1.270065, -1.693465, 2.091678, 1, 0, 0.6, 1,
1.270671, 0.9007627, -0.3445276, 1, 0, 0.5921569, 1,
1.273305, -2.540561, 3.076459, 1, 0, 0.5882353, 1,
1.29789, 0.01628532, -0.2801351, 1, 0, 0.5803922, 1,
1.299796, -1.08289, 2.585764, 1, 0, 0.5764706, 1,
1.303561, -0.7101414, 3.040696, 1, 0, 0.5686275, 1,
1.304666, -0.5581006, 3.226727, 1, 0, 0.5647059, 1,
1.305528, -0.444464, -0.4290253, 1, 0, 0.5568628, 1,
1.306312, -0.1633365, 3.43635, 1, 0, 0.5529412, 1,
1.314309, -1.311638, 2.661746, 1, 0, 0.5450981, 1,
1.317262, -0.7028645, 2.55185, 1, 0, 0.5411765, 1,
1.319884, 0.02835567, 3.50128, 1, 0, 0.5333334, 1,
1.321765, -0.4607311, 1.814279, 1, 0, 0.5294118, 1,
1.322605, -1.087278, 2.650547, 1, 0, 0.5215687, 1,
1.322607, 0.2940272, 1.581013, 1, 0, 0.5176471, 1,
1.346334, 0.2045634, 3.054352, 1, 0, 0.509804, 1,
1.346758, 2.007774, -0.07424159, 1, 0, 0.5058824, 1,
1.349863, 0.934022, 1.903256, 1, 0, 0.4980392, 1,
1.352347, 0.9165161, 1.407367, 1, 0, 0.4901961, 1,
1.368294, -0.08725388, 1.734635, 1, 0, 0.4862745, 1,
1.373351, -0.3334014, 0.552282, 1, 0, 0.4784314, 1,
1.384503, 1.140325, 0.6956394, 1, 0, 0.4745098, 1,
1.390435, -0.9455318, 3.381636, 1, 0, 0.4666667, 1,
1.397407, -0.9242634, 1.543845, 1, 0, 0.4627451, 1,
1.409296, 0.9444803, -0.3347888, 1, 0, 0.454902, 1,
1.416306, -1.581615, 2.393838, 1, 0, 0.4509804, 1,
1.435019, 0.4595831, 2.533022, 1, 0, 0.4431373, 1,
1.468046, -0.3328838, 0.6571779, 1, 0, 0.4392157, 1,
1.469849, -0.8010961, 2.742689, 1, 0, 0.4313726, 1,
1.474086, -1.14535, 2.34164, 1, 0, 0.427451, 1,
1.477351, 0.6588171, 0.3784354, 1, 0, 0.4196078, 1,
1.495422, -2.585053, 2.752242, 1, 0, 0.4156863, 1,
1.498309, 0.8537701, 1.846541, 1, 0, 0.4078431, 1,
1.511793, -0.509371, 0.05692824, 1, 0, 0.4039216, 1,
1.518799, -0.9766318, 1.518592, 1, 0, 0.3960784, 1,
1.525484, -1.016111, 2.30238, 1, 0, 0.3882353, 1,
1.536534, 1.405391, 1.283136, 1, 0, 0.3843137, 1,
1.578796, -0.4714547, 1.856361, 1, 0, 0.3764706, 1,
1.58305, 0.03694766, 0.8205147, 1, 0, 0.372549, 1,
1.59786, 0.2439584, 0.3261594, 1, 0, 0.3647059, 1,
1.603068, 0.8069176, 1.469371, 1, 0, 0.3607843, 1,
1.605147, -0.3944717, 0.6440821, 1, 0, 0.3529412, 1,
1.606446, 0.268205, 0.0694778, 1, 0, 0.3490196, 1,
1.610733, 0.8721959, 0.400236, 1, 0, 0.3411765, 1,
1.613193, 0.181937, 0.5970211, 1, 0, 0.3372549, 1,
1.617133, 0.2577614, 1.723732, 1, 0, 0.3294118, 1,
1.634518, -0.1322727, 1.802717, 1, 0, 0.3254902, 1,
1.659218, -0.1327372, 2.898781, 1, 0, 0.3176471, 1,
1.664298, -0.1367074, 4.18537, 1, 0, 0.3137255, 1,
1.672131, -0.9433655, 1.734725, 1, 0, 0.3058824, 1,
1.680368, -0.26026, 2.432673, 1, 0, 0.2980392, 1,
1.703259, -1.199062, 3.056692, 1, 0, 0.2941177, 1,
1.706788, 2.133387, 1.880777, 1, 0, 0.2862745, 1,
1.711736, 0.2664296, 0.6193064, 1, 0, 0.282353, 1,
1.711841, -0.2832767, 1.689437, 1, 0, 0.2745098, 1,
1.72765, 0.342732, 0.9182969, 1, 0, 0.2705882, 1,
1.748818, -0.2575371, 1.14034, 1, 0, 0.2627451, 1,
1.750026, -0.5164842, 2.161875, 1, 0, 0.2588235, 1,
1.755052, -0.2877258, 2.35087, 1, 0, 0.2509804, 1,
1.761467, 0.4119695, 1.711551, 1, 0, 0.2470588, 1,
1.797745, -0.2973417, 1.946643, 1, 0, 0.2392157, 1,
1.804716, 1.46517, -0.09053899, 1, 0, 0.2352941, 1,
1.804754, -0.2596464, 0.8851779, 1, 0, 0.227451, 1,
1.815314, -1.298857, 4.454593, 1, 0, 0.2235294, 1,
1.848469, 0.9715967, 1.781353, 1, 0, 0.2156863, 1,
1.857376, 0.6099254, -1.265803, 1, 0, 0.2117647, 1,
1.869263, 0.1920663, 2.434121, 1, 0, 0.2039216, 1,
1.878284, -0.1414626, 1.229774, 1, 0, 0.1960784, 1,
1.904094, 0.1488219, 1.096681, 1, 0, 0.1921569, 1,
1.907389, -0.6371419, 3.341719, 1, 0, 0.1843137, 1,
1.919883, -0.8317543, 2.559104, 1, 0, 0.1803922, 1,
1.942903, -1.13235, 3.000625, 1, 0, 0.172549, 1,
1.946484, 0.4550927, 0.4623723, 1, 0, 0.1686275, 1,
1.977107, 0.5654274, 2.380058, 1, 0, 0.1607843, 1,
1.984155, 0.04162928, 0.4421895, 1, 0, 0.1568628, 1,
1.984514, 0.03190666, 2.67407, 1, 0, 0.1490196, 1,
2.011466, -0.2860948, 0.2739883, 1, 0, 0.145098, 1,
2.023394, 0.1112681, 1.761205, 1, 0, 0.1372549, 1,
2.041303, -0.1274113, -0.6614832, 1, 0, 0.1333333, 1,
2.065925, 1.604768, 1.795966, 1, 0, 0.1254902, 1,
2.07551, -0.8425839, 0.7400973, 1, 0, 0.1215686, 1,
2.090441, 0.4811815, 1.518541, 1, 0, 0.1137255, 1,
2.12607, -1.004283, 0.9855377, 1, 0, 0.1098039, 1,
2.12881, -0.44807, 1.980975, 1, 0, 0.1019608, 1,
2.149416, 0.9850033, 1.417837, 1, 0, 0.09411765, 1,
2.186098, -0.03543209, 3.103722, 1, 0, 0.09019608, 1,
2.226955, 0.4064526, 2.213599, 1, 0, 0.08235294, 1,
2.233001, 1.238284, 1.747987, 1, 0, 0.07843138, 1,
2.273901, -0.6287311, 0.4677799, 1, 0, 0.07058824, 1,
2.326957, -0.615788, 1.979771, 1, 0, 0.06666667, 1,
2.337016, 0.8732678, 1.672028, 1, 0, 0.05882353, 1,
2.337678, -0.8235508, 3.930113, 1, 0, 0.05490196, 1,
2.342677, -0.1409936, 2.317792, 1, 0, 0.04705882, 1,
2.458148, -1.429441, 2.133727, 1, 0, 0.04313726, 1,
2.473293, 0.02251666, 1.706177, 1, 0, 0.03529412, 1,
2.614795, -0.0739161, 3.829786, 1, 0, 0.03137255, 1,
2.635174, 1.556777, 1.136655, 1, 0, 0.02352941, 1,
2.674699, 1.677903, -0.8923773, 1, 0, 0.01960784, 1,
3.043483, -0.7797458, 1.434373, 1, 0, 0.01176471, 1,
3.290693, -1.120004, 3.604079, 1, 0, 0.007843138, 1
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
0.1534342, -4.421026, -8.079785, 0, -0.5, 0.5, 0.5,
0.1534342, -4.421026, -8.079785, 1, -0.5, 0.5, 0.5,
0.1534342, -4.421026, -8.079785, 1, 1.5, 0.5, 0.5,
0.1534342, -4.421026, -8.079785, 0, 1.5, 0.5, 0.5
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
-4.047355, 0.1115539, -8.079785, 0, -0.5, 0.5, 0.5,
-4.047355, 0.1115539, -8.079785, 1, -0.5, 0.5, 0.5,
-4.047355, 0.1115539, -8.079785, 1, 1.5, 0.5, 0.5,
-4.047355, 0.1115539, -8.079785, 0, 1.5, 0.5, 0.5
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
-4.047355, -4.421026, -0.5962565, 0, -0.5, 0.5, 0.5,
-4.047355, -4.421026, -0.5962565, 1, -0.5, 0.5, 0.5,
-4.047355, -4.421026, -0.5962565, 1, 1.5, 0.5, 0.5,
-4.047355, -4.421026, -0.5962565, 0, 1.5, 0.5, 0.5
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
-2, -3.375046, -6.352818,
3, -3.375046, -6.352818,
-2, -3.375046, -6.352818,
-2, -3.549376, -6.640646,
-1, -3.375046, -6.352818,
-1, -3.549376, -6.640646,
0, -3.375046, -6.352818,
0, -3.549376, -6.640646,
1, -3.375046, -6.352818,
1, -3.549376, -6.640646,
2, -3.375046, -6.352818,
2, -3.549376, -6.640646,
3, -3.375046, -6.352818,
3, -3.549376, -6.640646
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
-2, -3.898036, -7.216301, 0, -0.5, 0.5, 0.5,
-2, -3.898036, -7.216301, 1, -0.5, 0.5, 0.5,
-2, -3.898036, -7.216301, 1, 1.5, 0.5, 0.5,
-2, -3.898036, -7.216301, 0, 1.5, 0.5, 0.5,
-1, -3.898036, -7.216301, 0, -0.5, 0.5, 0.5,
-1, -3.898036, -7.216301, 1, -0.5, 0.5, 0.5,
-1, -3.898036, -7.216301, 1, 1.5, 0.5, 0.5,
-1, -3.898036, -7.216301, 0, 1.5, 0.5, 0.5,
0, -3.898036, -7.216301, 0, -0.5, 0.5, 0.5,
0, -3.898036, -7.216301, 1, -0.5, 0.5, 0.5,
0, -3.898036, -7.216301, 1, 1.5, 0.5, 0.5,
0, -3.898036, -7.216301, 0, 1.5, 0.5, 0.5,
1, -3.898036, -7.216301, 0, -0.5, 0.5, 0.5,
1, -3.898036, -7.216301, 1, -0.5, 0.5, 0.5,
1, -3.898036, -7.216301, 1, 1.5, 0.5, 0.5,
1, -3.898036, -7.216301, 0, 1.5, 0.5, 0.5,
2, -3.898036, -7.216301, 0, -0.5, 0.5, 0.5,
2, -3.898036, -7.216301, 1, -0.5, 0.5, 0.5,
2, -3.898036, -7.216301, 1, 1.5, 0.5, 0.5,
2, -3.898036, -7.216301, 0, 1.5, 0.5, 0.5,
3, -3.898036, -7.216301, 0, -0.5, 0.5, 0.5,
3, -3.898036, -7.216301, 1, -0.5, 0.5, 0.5,
3, -3.898036, -7.216301, 1, 1.5, 0.5, 0.5,
3, -3.898036, -7.216301, 0, 1.5, 0.5, 0.5
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
-3.077942, -3, -6.352818,
-3.077942, 3, -6.352818,
-3.077942, -3, -6.352818,
-3.239511, -3, -6.640646,
-3.077942, -2, -6.352818,
-3.239511, -2, -6.640646,
-3.077942, -1, -6.352818,
-3.239511, -1, -6.640646,
-3.077942, 0, -6.352818,
-3.239511, 0, -6.640646,
-3.077942, 1, -6.352818,
-3.239511, 1, -6.640646,
-3.077942, 2, -6.352818,
-3.239511, 2, -6.640646,
-3.077942, 3, -6.352818,
-3.239511, 3, -6.640646
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
-3.562649, -3, -7.216301, 0, -0.5, 0.5, 0.5,
-3.562649, -3, -7.216301, 1, -0.5, 0.5, 0.5,
-3.562649, -3, -7.216301, 1, 1.5, 0.5, 0.5,
-3.562649, -3, -7.216301, 0, 1.5, 0.5, 0.5,
-3.562649, -2, -7.216301, 0, -0.5, 0.5, 0.5,
-3.562649, -2, -7.216301, 1, -0.5, 0.5, 0.5,
-3.562649, -2, -7.216301, 1, 1.5, 0.5, 0.5,
-3.562649, -2, -7.216301, 0, 1.5, 0.5, 0.5,
-3.562649, -1, -7.216301, 0, -0.5, 0.5, 0.5,
-3.562649, -1, -7.216301, 1, -0.5, 0.5, 0.5,
-3.562649, -1, -7.216301, 1, 1.5, 0.5, 0.5,
-3.562649, -1, -7.216301, 0, 1.5, 0.5, 0.5,
-3.562649, 0, -7.216301, 0, -0.5, 0.5, 0.5,
-3.562649, 0, -7.216301, 1, -0.5, 0.5, 0.5,
-3.562649, 0, -7.216301, 1, 1.5, 0.5, 0.5,
-3.562649, 0, -7.216301, 0, 1.5, 0.5, 0.5,
-3.562649, 1, -7.216301, 0, -0.5, 0.5, 0.5,
-3.562649, 1, -7.216301, 1, -0.5, 0.5, 0.5,
-3.562649, 1, -7.216301, 1, 1.5, 0.5, 0.5,
-3.562649, 1, -7.216301, 0, 1.5, 0.5, 0.5,
-3.562649, 2, -7.216301, 0, -0.5, 0.5, 0.5,
-3.562649, 2, -7.216301, 1, -0.5, 0.5, 0.5,
-3.562649, 2, -7.216301, 1, 1.5, 0.5, 0.5,
-3.562649, 2, -7.216301, 0, 1.5, 0.5, 0.5,
-3.562649, 3, -7.216301, 0, -0.5, 0.5, 0.5,
-3.562649, 3, -7.216301, 1, -0.5, 0.5, 0.5,
-3.562649, 3, -7.216301, 1, 1.5, 0.5, 0.5,
-3.562649, 3, -7.216301, 0, 1.5, 0.5, 0.5
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
-3.077942, -3.375046, -6,
-3.077942, -3.375046, 4,
-3.077942, -3.375046, -6,
-3.239511, -3.549376, -6,
-3.077942, -3.375046, -4,
-3.239511, -3.549376, -4,
-3.077942, -3.375046, -2,
-3.239511, -3.549376, -2,
-3.077942, -3.375046, 0,
-3.239511, -3.549376, 0,
-3.077942, -3.375046, 2,
-3.239511, -3.549376, 2,
-3.077942, -3.375046, 4,
-3.239511, -3.549376, 4
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
-3.562649, -3.898036, -6, 0, -0.5, 0.5, 0.5,
-3.562649, -3.898036, -6, 1, -0.5, 0.5, 0.5,
-3.562649, -3.898036, -6, 1, 1.5, 0.5, 0.5,
-3.562649, -3.898036, -6, 0, 1.5, 0.5, 0.5,
-3.562649, -3.898036, -4, 0, -0.5, 0.5, 0.5,
-3.562649, -3.898036, -4, 1, -0.5, 0.5, 0.5,
-3.562649, -3.898036, -4, 1, 1.5, 0.5, 0.5,
-3.562649, -3.898036, -4, 0, 1.5, 0.5, 0.5,
-3.562649, -3.898036, -2, 0, -0.5, 0.5, 0.5,
-3.562649, -3.898036, -2, 1, -0.5, 0.5, 0.5,
-3.562649, -3.898036, -2, 1, 1.5, 0.5, 0.5,
-3.562649, -3.898036, -2, 0, 1.5, 0.5, 0.5,
-3.562649, -3.898036, 0, 0, -0.5, 0.5, 0.5,
-3.562649, -3.898036, 0, 1, -0.5, 0.5, 0.5,
-3.562649, -3.898036, 0, 1, 1.5, 0.5, 0.5,
-3.562649, -3.898036, 0, 0, 1.5, 0.5, 0.5,
-3.562649, -3.898036, 2, 0, -0.5, 0.5, 0.5,
-3.562649, -3.898036, 2, 1, -0.5, 0.5, 0.5,
-3.562649, -3.898036, 2, 1, 1.5, 0.5, 0.5,
-3.562649, -3.898036, 2, 0, 1.5, 0.5, 0.5,
-3.562649, -3.898036, 4, 0, -0.5, 0.5, 0.5,
-3.562649, -3.898036, 4, 1, -0.5, 0.5, 0.5,
-3.562649, -3.898036, 4, 1, 1.5, 0.5, 0.5,
-3.562649, -3.898036, 4, 0, 1.5, 0.5, 0.5
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
-3.077942, -3.375046, -6.352818,
-3.077942, 3.598154, -6.352818,
-3.077942, -3.375046, 5.160305,
-3.077942, 3.598154, 5.160305,
-3.077942, -3.375046, -6.352818,
-3.077942, -3.375046, 5.160305,
-3.077942, 3.598154, -6.352818,
-3.077942, 3.598154, 5.160305,
-3.077942, -3.375046, -6.352818,
3.38481, -3.375046, -6.352818,
-3.077942, -3.375046, 5.160305,
3.38481, -3.375046, 5.160305,
-3.077942, 3.598154, -6.352818,
3.38481, 3.598154, -6.352818,
-3.077942, 3.598154, 5.160305,
3.38481, 3.598154, 5.160305,
3.38481, -3.375046, -6.352818,
3.38481, 3.598154, -6.352818,
3.38481, -3.375046, 5.160305,
3.38481, 3.598154, 5.160305,
3.38481, -3.375046, -6.352818,
3.38481, -3.375046, 5.160305,
3.38481, 3.598154, -6.352818,
3.38481, 3.598154, 5.160305
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
var radius = 7.973041;
var distance = 35.47296;
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
mvMatrix.translate( -0.1534342, -0.1115539, 0.5962565 );
mvMatrix.scale( 1.333891, 1.236248, 0.7487637 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.47296);
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
tetrathiin<-read.table("tetrathiin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetrathiin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetrathiin' not found
```

```r
y<-tetrathiin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetrathiin' not found
```

```r
z<-tetrathiin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetrathiin' not found
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
-2.983824, -0.8870969, -2.992846, 0, 0, 1, 1, 1,
-2.843998, -1.006611, -4.231771, 1, 0, 0, 1, 1,
-2.694992, -1.2468, -3.094035, 1, 0, 0, 1, 1,
-2.55112, -0.974718, -2.557284, 1, 0, 0, 1, 1,
-2.432149, -1.352386, -2.442065, 1, 0, 0, 1, 1,
-2.415755, -1.903218, -3.530101, 1, 0, 0, 1, 1,
-2.308662, 1.749457, 1.403132, 0, 0, 0, 1, 1,
-2.236551, 0.1386501, -2.57134, 0, 0, 0, 1, 1,
-2.235534, -0.219078, -2.19272, 0, 0, 0, 1, 1,
-2.19811, 1.69205, -0.3457124, 0, 0, 0, 1, 1,
-2.195862, -1.043904, -1.350672, 0, 0, 0, 1, 1,
-2.194423, 0.679202, -1.164661, 0, 0, 0, 1, 1,
-2.164867, -0.372443, -1.184095, 0, 0, 0, 1, 1,
-2.112994, 0.2840556, -3.032425, 1, 1, 1, 1, 1,
-2.105579, 0.02819156, -2.85188, 1, 1, 1, 1, 1,
-2.09386, -0.7803189, -2.617603, 1, 1, 1, 1, 1,
-2.062263, 1.057314, -0.4437478, 1, 1, 1, 1, 1,
-2.058242, 0.556966, -1.872265, 1, 1, 1, 1, 1,
-2.036637, 0.1467961, -1.08069, 1, 1, 1, 1, 1,
-2.024339, 0.2115916, -2.290063, 1, 1, 1, 1, 1,
-1.99435, 0.1644996, -1.794322, 1, 1, 1, 1, 1,
-1.978297, -0.8423436, -2.749384, 1, 1, 1, 1, 1,
-1.969807, -1.006389, -2.797433, 1, 1, 1, 1, 1,
-1.952097, -0.01513656, -1.585309, 1, 1, 1, 1, 1,
-1.94333, -1.233693, -3.138247, 1, 1, 1, 1, 1,
-1.926008, 0.8892134, -0.7530102, 1, 1, 1, 1, 1,
-1.925738, 1.182376, -2.287755, 1, 1, 1, 1, 1,
-1.911371, -0.5070709, -2.355209, 1, 1, 1, 1, 1,
-1.895862, 1.308671, -0.7699478, 0, 0, 1, 1, 1,
-1.873411, 1.442307, -2.883005, 1, 0, 0, 1, 1,
-1.857217, -0.1664442, -0.595403, 1, 0, 0, 1, 1,
-1.827459, -1.47567, -2.909016, 1, 0, 0, 1, 1,
-1.820545, -0.6621514, -1.178966, 1, 0, 0, 1, 1,
-1.808386, -1.886356, -3.653699, 1, 0, 0, 1, 1,
-1.78987, -0.4925655, -2.912618, 0, 0, 0, 1, 1,
-1.785423, 1.621034, -2.0894, 0, 0, 0, 1, 1,
-1.778204, 1.389187, 0.08554287, 0, 0, 0, 1, 1,
-1.753746, 1.093465, 0.05600066, 0, 0, 0, 1, 1,
-1.732382, -0.2077813, -1.146194, 0, 0, 0, 1, 1,
-1.717839, -0.3270285, -1.799471, 0, 0, 0, 1, 1,
-1.693151, -0.2241048, -1.518209, 0, 0, 0, 1, 1,
-1.690493, -0.5006636, -3.175548, 1, 1, 1, 1, 1,
-1.689797, 2.828242, -1.450203, 1, 1, 1, 1, 1,
-1.686406, -0.2578837, -1.982691, 1, 1, 1, 1, 1,
-1.675604, -0.5920272, -3.342972, 1, 1, 1, 1, 1,
-1.657908, -2.313468, -2.004696, 1, 1, 1, 1, 1,
-1.648496, -1.319062, -2.196735, 1, 1, 1, 1, 1,
-1.642475, -0.3280648, -2.239601, 1, 1, 1, 1, 1,
-1.640909, 2.807328, 0.6914685, 1, 1, 1, 1, 1,
-1.639083, 0.007282116, -1.297498, 1, 1, 1, 1, 1,
-1.63376, -1.513013, -2.164988, 1, 1, 1, 1, 1,
-1.631661, 0.2733554, -1.938749, 1, 1, 1, 1, 1,
-1.626777, 0.216414, -2.056864, 1, 1, 1, 1, 1,
-1.619603, 0.8137206, -0.9784346, 1, 1, 1, 1, 1,
-1.615764, -0.5932663, -2.634513, 1, 1, 1, 1, 1,
-1.607141, -1.225706, -1.952656, 1, 1, 1, 1, 1,
-1.563905, 0.8047078, 0.3494583, 0, 0, 1, 1, 1,
-1.537675, -0.6976178, -3.101137, 1, 0, 0, 1, 1,
-1.530104, -0.9790605, -1.252144, 1, 0, 0, 1, 1,
-1.52315, -0.1052988, -0.5555064, 1, 0, 0, 1, 1,
-1.517266, -0.234459, -2.602542, 1, 0, 0, 1, 1,
-1.495969, 0.198948, -1.466636, 1, 0, 0, 1, 1,
-1.492634, 0.2332619, 0.0890819, 0, 0, 0, 1, 1,
-1.489914, 1.551745, -0.1584583, 0, 0, 0, 1, 1,
-1.485113, 0.7001635, -1.348737, 0, 0, 0, 1, 1,
-1.459502, 0.6007993, -1.408333, 0, 0, 0, 1, 1,
-1.447109, -0.9846519, -3.403829, 0, 0, 0, 1, 1,
-1.437689, 1.969759, -0.6170956, 0, 0, 0, 1, 1,
-1.436072, 0.04032857, -1.049554, 0, 0, 0, 1, 1,
-1.432208, -0.679157, -2.269758, 1, 1, 1, 1, 1,
-1.420944, 1.112053, -1.175496, 1, 1, 1, 1, 1,
-1.399719, -0.7206981, -2.221073, 1, 1, 1, 1, 1,
-1.398615, 1.271087, 0.193479, 1, 1, 1, 1, 1,
-1.388309, 0.4935374, -0.01173206, 1, 1, 1, 1, 1,
-1.385826, -0.05149781, -2.756868, 1, 1, 1, 1, 1,
-1.3789, 0.9922479, 0.1877545, 1, 1, 1, 1, 1,
-1.367907, 0.483934, -0.3306096, 1, 1, 1, 1, 1,
-1.363346, -0.4983717, -1.887513, 1, 1, 1, 1, 1,
-1.356884, -0.670788, -2.289467, 1, 1, 1, 1, 1,
-1.34851, 0.2753122, -1.174733, 1, 1, 1, 1, 1,
-1.341959, -0.1814154, -2.888996, 1, 1, 1, 1, 1,
-1.332641, 0.9066389, -0.5269627, 1, 1, 1, 1, 1,
-1.319808, -0.3836212, -2.730893, 1, 1, 1, 1, 1,
-1.317204, -0.15306, -2.190872, 1, 1, 1, 1, 1,
-1.308681, 0.9657223, -0.3520187, 0, 0, 1, 1, 1,
-1.301139, -0.1840946, -0.2520294, 1, 0, 0, 1, 1,
-1.294366, -0.2268411, -2.099375, 1, 0, 0, 1, 1,
-1.289174, -0.2136525, -2.784432, 1, 0, 0, 1, 1,
-1.288228, 0.6015585, -0.6350506, 1, 0, 0, 1, 1,
-1.285043, 0.2679097, -2.325383, 1, 0, 0, 1, 1,
-1.264238, 0.9568897, -1.806736, 0, 0, 0, 1, 1,
-1.261197, 1.826541, -1.938164, 0, 0, 0, 1, 1,
-1.258223, -0.8952665, -2.145252, 0, 0, 0, 1, 1,
-1.256442, 0.05215753, -0.08725753, 0, 0, 0, 1, 1,
-1.250053, 0.1488053, -0.7955706, 0, 0, 0, 1, 1,
-1.2389, 1.344198, -0.9911273, 0, 0, 0, 1, 1,
-1.219492, -0.8888748, -3.207802, 0, 0, 0, 1, 1,
-1.217523, -1.079072, -1.988523, 1, 1, 1, 1, 1,
-1.198445, 0.0564684, -1.540798, 1, 1, 1, 1, 1,
-1.196772, -0.08918879, -0.1654832, 1, 1, 1, 1, 1,
-1.192716, 0.3894458, -0.6638607, 1, 1, 1, 1, 1,
-1.178608, -0.5417143, -1.489374, 1, 1, 1, 1, 1,
-1.177058, 0.7025124, -0.8682212, 1, 1, 1, 1, 1,
-1.168669, 1.262587, -1.59207, 1, 1, 1, 1, 1,
-1.162287, 0.01458385, -0.4081781, 1, 1, 1, 1, 1,
-1.149587, 2.840619, 0.5566318, 1, 1, 1, 1, 1,
-1.147226, 1.603838, 2.237561, 1, 1, 1, 1, 1,
-1.14455, -0.4133946, -2.962121, 1, 1, 1, 1, 1,
-1.142578, 0.1253684, -1.62801, 1, 1, 1, 1, 1,
-1.140907, 0.2085335, -0.8694268, 1, 1, 1, 1, 1,
-1.137488, -0.2987991, -1.355608, 1, 1, 1, 1, 1,
-1.130053, 0.1009112, -1.725554, 1, 1, 1, 1, 1,
-1.11339, -0.524193, -3.605321, 0, 0, 1, 1, 1,
-1.11157, -0.9597293, -0.8666922, 1, 0, 0, 1, 1,
-1.109173, 0.7548175, 0.7906738, 1, 0, 0, 1, 1,
-1.105913, 1.508705, -1.163921, 1, 0, 0, 1, 1,
-1.104208, 0.2423522, -0.5407031, 1, 0, 0, 1, 1,
-1.077511, -0.9159108, -1.162724, 1, 0, 0, 1, 1,
-1.061507, 0.2953992, -1.802806, 0, 0, 0, 1, 1,
-1.060668, -0.2914051, -2.378499, 0, 0, 0, 1, 1,
-1.05598, -0.6434489, -2.627841, 0, 0, 0, 1, 1,
-1.052728, -1.327808, -2.766019, 0, 0, 0, 1, 1,
-1.05233, -0.6729988, -2.053203, 0, 0, 0, 1, 1,
-1.048948, 1.670574, 1.582655, 0, 0, 0, 1, 1,
-1.045556, -1.360596, -3.175228, 0, 0, 0, 1, 1,
-1.038266, 0.1606696, -0.5557387, 1, 1, 1, 1, 1,
-1.038069, 0.09810787, -2.822154, 1, 1, 1, 1, 1,
-1.037432, 2.684415, -0.8575755, 1, 1, 1, 1, 1,
-1.01796, 2.953854, -0.2812956, 1, 1, 1, 1, 1,
-1.016007, 1.756207, -0.4644048, 1, 1, 1, 1, 1,
-1.004822, -1.375448, -2.985763, 1, 1, 1, 1, 1,
-1.004134, -0.6880038, -3.132854, 1, 1, 1, 1, 1,
-1.003792, 0.7861952, 0.7904903, 1, 1, 1, 1, 1,
-1.002761, 1.081482, -1.014935, 1, 1, 1, 1, 1,
-0.9996223, -0.6462623, -2.63147, 1, 1, 1, 1, 1,
-0.9977819, -0.7021437, -2.599937, 1, 1, 1, 1, 1,
-0.99607, 0.6688803, -0.3472168, 1, 1, 1, 1, 1,
-0.9909319, -0.5395955, -1.377452, 1, 1, 1, 1, 1,
-0.9880813, 0.8605133, 0.1645998, 1, 1, 1, 1, 1,
-0.9823949, 0.3800032, -1.04391, 1, 1, 1, 1, 1,
-0.9777049, -1.78246, -1.972756, 0, 0, 1, 1, 1,
-0.9760836, 0.03832794, -2.487279, 1, 0, 0, 1, 1,
-0.9652077, -0.01619617, -0.9558771, 1, 0, 0, 1, 1,
-0.9620072, -1.438609, -2.255412, 1, 0, 0, 1, 1,
-0.9576914, 0.9306801, -1.751671, 1, 0, 0, 1, 1,
-0.9574251, -0.3799269, -3.250163, 1, 0, 0, 1, 1,
-0.954039, 0.840994, -0.1370522, 0, 0, 0, 1, 1,
-0.9535742, -0.6017814, -2.223418, 0, 0, 0, 1, 1,
-0.9491577, -1.821399, -1.845263, 0, 0, 0, 1, 1,
-0.941914, 0.1561806, -1.878438, 0, 0, 0, 1, 1,
-0.9418836, -0.8444223, -1.923654, 0, 0, 0, 1, 1,
-0.9405614, 0.352889, -0.6585451, 0, 0, 0, 1, 1,
-0.9402305, 0.1467917, -2.103072, 0, 0, 0, 1, 1,
-0.9397785, 0.1515048, -3.741153, 1, 1, 1, 1, 1,
-0.9393452, -0.6364443, -2.913547, 1, 1, 1, 1, 1,
-0.9376311, -0.9843242, -2.088578, 1, 1, 1, 1, 1,
-0.9327624, -0.3248114, -3.626955, 1, 1, 1, 1, 1,
-0.9278466, 1.923598, 1.230791, 1, 1, 1, 1, 1,
-0.9274341, -0.08170653, -1.608773, 1, 1, 1, 1, 1,
-0.9273969, 0.4928914, -1.045659, 1, 1, 1, 1, 1,
-0.9273065, 1.713327, -0.5756149, 1, 1, 1, 1, 1,
-0.9252654, -0.8500941, -0.5095875, 1, 1, 1, 1, 1,
-0.9186489, 0.1074802, -0.8262674, 1, 1, 1, 1, 1,
-0.910442, 0.2087157, -1.451087, 1, 1, 1, 1, 1,
-0.9014829, 1.467261, -0.9049206, 1, 1, 1, 1, 1,
-0.8975524, -0.02094865, -2.296425, 1, 1, 1, 1, 1,
-0.8963006, -1.231521, -1.244053, 1, 1, 1, 1, 1,
-0.8948548, -0.1556471, -1.068104, 1, 1, 1, 1, 1,
-0.8919833, 0.6752045, -0.8809447, 0, 0, 1, 1, 1,
-0.8831396, 0.8969488, 0.00137862, 1, 0, 0, 1, 1,
-0.880677, 1.174299, -1.681601, 1, 0, 0, 1, 1,
-0.873863, -0.04411063, -3.016225, 1, 0, 0, 1, 1,
-0.870969, -0.6398493, -2.85812, 1, 0, 0, 1, 1,
-0.8642226, 1.798783, -0.8447487, 1, 0, 0, 1, 1,
-0.863079, -1.127248, -3.154607, 0, 0, 0, 1, 1,
-0.8626961, 1.382173, 0.3990885, 0, 0, 0, 1, 1,
-0.8598539, 1.11139, -0.8034204, 0, 0, 0, 1, 1,
-0.8568701, -0.3886503, -1.059303, 0, 0, 0, 1, 1,
-0.8562989, 1.448242, -0.7843479, 0, 0, 0, 1, 1,
-0.8462635, -1.06117, -2.047634, 0, 0, 0, 1, 1,
-0.8458794, -0.7680266, -2.590008, 0, 0, 0, 1, 1,
-0.841848, -2.358142, -2.035991, 1, 1, 1, 1, 1,
-0.8383247, 1.52914, -0.9533068, 1, 1, 1, 1, 1,
-0.8364255, 1.290934, 0.3773059, 1, 1, 1, 1, 1,
-0.8356345, -1.970494, -2.228033, 1, 1, 1, 1, 1,
-0.8270513, -0.3669689, -1.871583, 1, 1, 1, 1, 1,
-0.8230773, -1.718268, -1.732008, 1, 1, 1, 1, 1,
-0.8226163, -0.342928, -3.629729, 1, 1, 1, 1, 1,
-0.8221416, -0.8556383, -2.363715, 1, 1, 1, 1, 1,
-0.8182756, -0.0745826, -1.431963, 1, 1, 1, 1, 1,
-0.8178118, 0.1916969, -1.747802, 1, 1, 1, 1, 1,
-0.8164492, -0.5312193, -3.550303, 1, 1, 1, 1, 1,
-0.8138512, 1.00031, -0.9258979, 1, 1, 1, 1, 1,
-0.812079, 0.6314042, -2.498031, 1, 1, 1, 1, 1,
-0.8115155, -0.9749157, -3.877776, 1, 1, 1, 1, 1,
-0.811044, -2.308914, -1.951401, 1, 1, 1, 1, 1,
-0.8105411, -0.4221899, -2.416009, 0, 0, 1, 1, 1,
-0.8082315, -0.5400176, -3.84688, 1, 0, 0, 1, 1,
-0.8067136, -2.115543, -3.332327, 1, 0, 0, 1, 1,
-0.8055469, 0.4362929, -1.563858, 1, 0, 0, 1, 1,
-0.8007507, 0.2501506, -0.4189638, 1, 0, 0, 1, 1,
-0.8006142, 1.190002, 0.3597797, 1, 0, 0, 1, 1,
-0.7983166, 0.2249103, -2.404707, 0, 0, 0, 1, 1,
-0.7940049, -0.8127777, -3.582592, 0, 0, 0, 1, 1,
-0.7917425, -0.6722445, -1.63508, 0, 0, 0, 1, 1,
-0.7916518, 0.724127, -2.610355, 0, 0, 0, 1, 1,
-0.777658, 0.9673687, -1.68527, 0, 0, 0, 1, 1,
-0.7769834, 1.564281, 1.113152, 0, 0, 0, 1, 1,
-0.7766479, 0.557201, 0.6040969, 0, 0, 0, 1, 1,
-0.7738302, 0.01550769, -0.4873932, 1, 1, 1, 1, 1,
-0.7685997, -0.1039033, -1.590174, 1, 1, 1, 1, 1,
-0.767737, 1.579747, 1.541255, 1, 1, 1, 1, 1,
-0.7665941, 0.4703833, 0.2383742, 1, 1, 1, 1, 1,
-0.7654016, 1.35632, -0.2852018, 1, 1, 1, 1, 1,
-0.7642644, 0.3054047, -1.134001, 1, 1, 1, 1, 1,
-0.7636115, -2.101307, -4.600154, 1, 1, 1, 1, 1,
-0.7589002, -0.8065048, -1.152686, 1, 1, 1, 1, 1,
-0.7537596, -0.2596672, -2.5654, 1, 1, 1, 1, 1,
-0.749238, -0.397769, -2.038287, 1, 1, 1, 1, 1,
-0.748848, 0.6851814, -1.67108, 1, 1, 1, 1, 1,
-0.7473879, 0.6703618, -1.102908, 1, 1, 1, 1, 1,
-0.7441951, 0.7072031, -0.8894776, 1, 1, 1, 1, 1,
-0.7436944, -0.1189558, -1.901202, 1, 1, 1, 1, 1,
-0.7388992, 0.1341156, -0.8238699, 1, 1, 1, 1, 1,
-0.7385668, -0.2371444, -0.6867492, 0, 0, 1, 1, 1,
-0.7323358, -0.422804, -1.303005, 1, 0, 0, 1, 1,
-0.7269388, 0.9213789, 0.4005769, 1, 0, 0, 1, 1,
-0.7214698, -1.257088, -1.567233, 1, 0, 0, 1, 1,
-0.721297, 0.8570684, -1.065151, 1, 0, 0, 1, 1,
-0.7205995, 0.3333125, -2.294135, 1, 0, 0, 1, 1,
-0.7196168, 0.006616163, -0.03441347, 0, 0, 0, 1, 1,
-0.7189861, 0.7885876, -1.117412, 0, 0, 0, 1, 1,
-0.7189192, 1.365433, 0.9104589, 0, 0, 0, 1, 1,
-0.7145608, -2.291032, -1.853997, 0, 0, 0, 1, 1,
-0.7137199, 0.8412586, -1.872164, 0, 0, 0, 1, 1,
-0.7110646, 0.2229618, -2.879946, 0, 0, 0, 1, 1,
-0.7014499, -0.04219894, -2.077498, 0, 0, 0, 1, 1,
-0.700268, 1.331156, -0.9380406, 1, 1, 1, 1, 1,
-0.692591, -0.5408283, -0.2073977, 1, 1, 1, 1, 1,
-0.6911559, -1.569086, -2.776487, 1, 1, 1, 1, 1,
-0.6893539, -1.836746, -2.364332, 1, 1, 1, 1, 1,
-0.6876885, -0.9221804, -2.390238, 1, 1, 1, 1, 1,
-0.6857955, -0.1248968, -2.052907, 1, 1, 1, 1, 1,
-0.6785825, 0.05550963, -0.2374137, 1, 1, 1, 1, 1,
-0.6762791, -0.5097814, -4.119276, 1, 1, 1, 1, 1,
-0.6724764, -0.9220949, -2.080357, 1, 1, 1, 1, 1,
-0.6720812, -1.742431, -2.354008, 1, 1, 1, 1, 1,
-0.6696503, -1.076761, -3.145306, 1, 1, 1, 1, 1,
-0.6692188, -2.534154, -4.671809, 1, 1, 1, 1, 1,
-0.6687021, -0.8618212, -2.465883, 1, 1, 1, 1, 1,
-0.6677069, 0.2511865, -1.750686, 1, 1, 1, 1, 1,
-0.6629457, -2.507811, -1.404257, 1, 1, 1, 1, 1,
-0.6600289, -0.2326788, -1.230719, 0, 0, 1, 1, 1,
-0.6523641, -0.02210838, 0.2728911, 1, 0, 0, 1, 1,
-0.6520259, -0.5083126, -3.898589, 1, 0, 0, 1, 1,
-0.6514553, 0.7432698, -1.102788, 1, 0, 0, 1, 1,
-0.6512957, 1.465336, -0.6082826, 1, 0, 0, 1, 1,
-0.647975, 0.02888031, 0.9412249, 1, 0, 0, 1, 1,
-0.6429439, -0.140909, -2.801109, 0, 0, 0, 1, 1,
-0.6408229, -1.32627, -3.055482, 0, 0, 0, 1, 1,
-0.6400508, -0.6902808, -2.669124, 0, 0, 0, 1, 1,
-0.6387971, -0.01652426, -2.142156, 0, 0, 0, 1, 1,
-0.6346187, -0.219741, -2.353182, 0, 0, 0, 1, 1,
-0.6295311, 2.136202, 0.0535486, 0, 0, 0, 1, 1,
-0.6234536, -0.5486206, -2.3453, 0, 0, 0, 1, 1,
-0.6218491, 0.2248289, -2.525771, 1, 1, 1, 1, 1,
-0.6162306, 0.05581572, -3.297204, 1, 1, 1, 1, 1,
-0.6154534, -1.034192, -2.130626, 1, 1, 1, 1, 1,
-0.6138214, 1.037253, 0.1242355, 1, 1, 1, 1, 1,
-0.6067147, -0.7114251, -0.7753049, 1, 1, 1, 1, 1,
-0.604105, 0.2320163, -0.3518138, 1, 1, 1, 1, 1,
-0.6019058, -0.7783259, -2.91854, 1, 1, 1, 1, 1,
-0.5988964, 0.3398583, -0.5204363, 1, 1, 1, 1, 1,
-0.5970933, -1.06062, -1.086563, 1, 1, 1, 1, 1,
-0.5969755, -1.481689, -0.361052, 1, 1, 1, 1, 1,
-0.593035, -0.04503641, -2.172116, 1, 1, 1, 1, 1,
-0.582791, 1.667037, 0.1765229, 1, 1, 1, 1, 1,
-0.5826227, -0.9698513, 0.1581244, 1, 1, 1, 1, 1,
-0.5781879, -0.7348732, -1.707309, 1, 1, 1, 1, 1,
-0.5768342, 0.01570247, -2.177619, 1, 1, 1, 1, 1,
-0.5758508, -0.5214102, -2.918554, 0, 0, 1, 1, 1,
-0.5717805, 0.1977485, -0.06790087, 1, 0, 0, 1, 1,
-0.5717686, -2.141954, -3.240268, 1, 0, 0, 1, 1,
-0.5713283, 0.5811438, -1.294965, 1, 0, 0, 1, 1,
-0.5712824, 0.3147399, -1.260206, 1, 0, 0, 1, 1,
-0.5696768, 0.6654884, -1.418726, 1, 0, 0, 1, 1,
-0.5662943, 0.3144583, 0.5266566, 0, 0, 0, 1, 1,
-0.5579155, -1.016407, -2.843853, 0, 0, 0, 1, 1,
-0.5571812, 1.474185, -0.534202, 0, 0, 0, 1, 1,
-0.5544831, 0.4331971, -0.5793051, 0, 0, 0, 1, 1,
-0.5512519, -0.9651045, -3.601699, 0, 0, 0, 1, 1,
-0.5473926, 1.088494, -0.792383, 0, 0, 0, 1, 1,
-0.5446079, -2.212474, -4.024546, 0, 0, 0, 1, 1,
-0.539416, -0.01121666, -1.022721, 1, 1, 1, 1, 1,
-0.538124, -0.2319263, -0.7261203, 1, 1, 1, 1, 1,
-0.5375573, -1.033764, -2.239395, 1, 1, 1, 1, 1,
-0.5371356, 1.359862, -1.45926, 1, 1, 1, 1, 1,
-0.5326642, 0.8626556, 0.1569125, 1, 1, 1, 1, 1,
-0.5319958, 0.300588, -0.7070922, 1, 1, 1, 1, 1,
-0.530558, 1.47675, -0.4359339, 1, 1, 1, 1, 1,
-0.5222661, 1.315591, -0.1395473, 1, 1, 1, 1, 1,
-0.5182702, 0.3599766, 0.1704433, 1, 1, 1, 1, 1,
-0.5150644, 1.737701, 0.01742971, 1, 1, 1, 1, 1,
-0.508123, 0.9455858, -0.351025, 1, 1, 1, 1, 1,
-0.4988784, 0.4693842, -1.868239, 1, 1, 1, 1, 1,
-0.4957114, 0.1131295, -0.7829885, 1, 1, 1, 1, 1,
-0.4955124, 0.02736198, -1.183795, 1, 1, 1, 1, 1,
-0.4908846, 1.504636, -0.3393548, 1, 1, 1, 1, 1,
-0.4901438, 0.1324802, -2.32204, 0, 0, 1, 1, 1,
-0.4898362, -1.155461, -5.324655, 1, 0, 0, 1, 1,
-0.4895015, 0.3439206, -0.7865052, 1, 0, 0, 1, 1,
-0.487265, 0.1802563, -2.793496, 1, 0, 0, 1, 1,
-0.4819576, 0.8550814, -1.963853, 1, 0, 0, 1, 1,
-0.4809476, -1.426329, -1.21372, 1, 0, 0, 1, 1,
-0.4780824, 0.9768821, -1.75711, 0, 0, 0, 1, 1,
-0.474862, -0.2167549, -2.88787, 0, 0, 0, 1, 1,
-0.4727663, 0.7123222, 0.8263479, 0, 0, 0, 1, 1,
-0.4696096, 0.1345269, -1.923832, 0, 0, 0, 1, 1,
-0.4676934, -0.02360769, -1.283189, 0, 0, 0, 1, 1,
-0.4659075, -1.781442, -2.737941, 0, 0, 0, 1, 1,
-0.4621851, 1.082715, -1.741169, 0, 0, 0, 1, 1,
-0.4563178, 0.1916032, -0.2317141, 1, 1, 1, 1, 1,
-0.4553891, -0.8169064, -2.821892, 1, 1, 1, 1, 1,
-0.4543183, -0.5612683, -2.359928, 1, 1, 1, 1, 1,
-0.4476581, -1.152745, -1.429935, 1, 1, 1, 1, 1,
-0.4434521, -0.2615934, -3.030283, 1, 1, 1, 1, 1,
-0.4378017, -1.184359, -4.321465, 1, 1, 1, 1, 1,
-0.4370272, 0.04455479, -3.031605, 1, 1, 1, 1, 1,
-0.4369301, -0.01656955, -1.836134, 1, 1, 1, 1, 1,
-0.4318714, -0.8791705, -1.931116, 1, 1, 1, 1, 1,
-0.428993, -1.097413, -2.695839, 1, 1, 1, 1, 1,
-0.4275688, 0.503307, 0.5129328, 1, 1, 1, 1, 1,
-0.4272847, -0.9099756, -4.305113, 1, 1, 1, 1, 1,
-0.4257606, 1.040945, 0.05844961, 1, 1, 1, 1, 1,
-0.4228299, -2.916046, -2.013339, 1, 1, 1, 1, 1,
-0.420974, 0.6365379, -0.8963675, 1, 1, 1, 1, 1,
-0.4171403, 0.634166, 0.9981276, 0, 0, 1, 1, 1,
-0.4163349, -1.180856, -4.97497, 1, 0, 0, 1, 1,
-0.4153595, 0.03359859, 0.07239169, 1, 0, 0, 1, 1,
-0.413353, 1.069338, 0.03654974, 1, 0, 0, 1, 1,
-0.4124462, -0.02512537, -0.8519443, 1, 0, 0, 1, 1,
-0.4122435, 0.412601, -0.3806571, 1, 0, 0, 1, 1,
-0.4116176, -0.8601879, -1.826, 0, 0, 0, 1, 1,
-0.4107974, -0.2455079, -1.84961, 0, 0, 0, 1, 1,
-0.4082944, -0.5560942, -2.83546, 0, 0, 0, 1, 1,
-0.4015294, 1.161256, -0.7854939, 0, 0, 0, 1, 1,
-0.3985479, -0.06321909, -2.223424, 0, 0, 0, 1, 1,
-0.3931759, 1.293828, -1.184477, 0, 0, 0, 1, 1,
-0.3929779, 0.04679904, -1.973305, 0, 0, 0, 1, 1,
-0.39188, -0.4053908, -2.212512, 1, 1, 1, 1, 1,
-0.3891672, -2.164053, -2.021143, 1, 1, 1, 1, 1,
-0.388364, 0.7658597, 0.6294354, 1, 1, 1, 1, 1,
-0.3845049, -0.401665, -2.018543, 1, 1, 1, 1, 1,
-0.3791909, -1.987565, -2.969544, 1, 1, 1, 1, 1,
-0.3732579, -0.8725045, -2.241271, 1, 1, 1, 1, 1,
-0.37018, -0.1670899, -1.560142, 1, 1, 1, 1, 1,
-0.3694508, -1.059412, -3.205401, 1, 1, 1, 1, 1,
-0.3683779, 1.584125, -0.09079163, 1, 1, 1, 1, 1,
-0.3560336, -0.2164297, -3.631205, 1, 1, 1, 1, 1,
-0.3518397, 0.9913682, -0.9190419, 1, 1, 1, 1, 1,
-0.3493019, 0.7011818, 0.528199, 1, 1, 1, 1, 1,
-0.3459886, 0.9933553, 2.725683, 1, 1, 1, 1, 1,
-0.3447402, 1.283889, -0.221491, 1, 1, 1, 1, 1,
-0.3423492, 0.4987697, -0.7469696, 1, 1, 1, 1, 1,
-0.3410647, 0.008898592, -0.5534266, 0, 0, 1, 1, 1,
-0.3384866, -0.5344201, -1.727412, 1, 0, 0, 1, 1,
-0.3354334, -0.627178, -0.8988225, 1, 0, 0, 1, 1,
-0.3323152, -0.0992126, -3.10065, 1, 0, 0, 1, 1,
-0.3323043, 0.6618544, 0.3494372, 1, 0, 0, 1, 1,
-0.318474, -0.5213001, -0.1872536, 1, 0, 0, 1, 1,
-0.3180546, -0.4466702, -1.845065, 0, 0, 0, 1, 1,
-0.3160635, -0.1065204, -2.748917, 0, 0, 0, 1, 1,
-0.3157021, -0.7452325, -1.689443, 0, 0, 0, 1, 1,
-0.3143962, -0.7863941, -1.387616, 0, 0, 0, 1, 1,
-0.3107086, 1.108661, 0.7581401, 0, 0, 0, 1, 1,
-0.3087844, 1.146877, 0.2378578, 0, 0, 0, 1, 1,
-0.3044662, -0.004973748, -1.577259, 0, 0, 0, 1, 1,
-0.3009787, -0.1734029, -2.895161, 1, 1, 1, 1, 1,
-0.2986908, -0.7008442, -1.592595, 1, 1, 1, 1, 1,
-0.2951672, -1.587129, -3.422759, 1, 1, 1, 1, 1,
-0.2902488, 0.1492755, -2.528388, 1, 1, 1, 1, 1,
-0.2884884, -0.3109869, -1.235005, 1, 1, 1, 1, 1,
-0.2881042, -1.489043, -4.69227, 1, 1, 1, 1, 1,
-0.2878608, 0.3735941, -1.498492, 1, 1, 1, 1, 1,
-0.2861397, 0.2379831, 0.5231559, 1, 1, 1, 1, 1,
-0.2825582, -0.4955364, -2.093143, 1, 1, 1, 1, 1,
-0.28209, 1.4378, -0.4186033, 1, 1, 1, 1, 1,
-0.2777402, -0.2777816, -2.812475, 1, 1, 1, 1, 1,
-0.2771901, 1.257981, 0.964879, 1, 1, 1, 1, 1,
-0.2759076, -0.2090096, -1.638498, 1, 1, 1, 1, 1,
-0.2754482, -0.5858296, -3.989896, 1, 1, 1, 1, 1,
-0.2745597, -1.276891, -2.28392, 1, 1, 1, 1, 1,
-0.2741317, 0.8406171, 1.287259, 0, 0, 1, 1, 1,
-0.2711161, -1.726627, -2.63927, 1, 0, 0, 1, 1,
-0.2686225, -0.7836051, -3.269323, 1, 0, 0, 1, 1,
-0.2685129, 0.6952426, -0.921532, 1, 0, 0, 1, 1,
-0.2666323, -0.8273355, -1.914783, 1, 0, 0, 1, 1,
-0.2634152, -0.2866136, -0.5021327, 1, 0, 0, 1, 1,
-0.2634064, 1.341831, 0.1480921, 0, 0, 0, 1, 1,
-0.262973, -1.157096, -2.340113, 0, 0, 0, 1, 1,
-0.2604294, -0.6929377, -2.776721, 0, 0, 0, 1, 1,
-0.2594167, 2.113173, 1.949358, 0, 0, 0, 1, 1,
-0.2508072, -0.1196871, -1.897379, 0, 0, 0, 1, 1,
-0.2486483, 0.02329525, -2.584999, 0, 0, 0, 1, 1,
-0.2484002, -1.09174, -2.742815, 0, 0, 0, 1, 1,
-0.2467725, 0.2065979, -0.5465606, 1, 1, 1, 1, 1,
-0.2459019, 0.04026346, -2.820302, 1, 1, 1, 1, 1,
-0.2449379, 1.282447, -0.6429609, 1, 1, 1, 1, 1,
-0.2411734, -0.2512114, -2.457594, 1, 1, 1, 1, 1,
-0.2350215, -0.2828136, -2.018497, 1, 1, 1, 1, 1,
-0.230186, -0.0309216, -1.895218, 1, 1, 1, 1, 1,
-0.2293221, -0.8152405, -1.380832, 1, 1, 1, 1, 1,
-0.2286162, 0.324654, -0.297543, 1, 1, 1, 1, 1,
-0.2232477, -0.1158935, -3.283176, 1, 1, 1, 1, 1,
-0.2231448, -0.9828217, -2.234694, 1, 1, 1, 1, 1,
-0.2228558, 1.470808, 0.6813656, 1, 1, 1, 1, 1,
-0.2180219, -0.1903857, -2.976718, 1, 1, 1, 1, 1,
-0.2175408, 0.8426116, 1.295571, 1, 1, 1, 1, 1,
-0.2163545, 0.8989753, -1.512136, 1, 1, 1, 1, 1,
-0.2154417, -1.884672, -2.785061, 1, 1, 1, 1, 1,
-0.2138677, -0.1662694, -1.110948, 0, 0, 1, 1, 1,
-0.205026, -0.07907928, -2.6359, 1, 0, 0, 1, 1,
-0.2049973, 0.2441203, 0.1703281, 1, 0, 0, 1, 1,
-0.2019807, 2.368698, -0.6111276, 1, 0, 0, 1, 1,
-0.2006917, 0.2075729, -0.7953774, 1, 0, 0, 1, 1,
-0.2000534, -1.212145, -1.510641, 1, 0, 0, 1, 1,
-0.1961024, -0.4491513, -1.727146, 0, 0, 0, 1, 1,
-0.1938431, 0.2966865, 0.6314358, 0, 0, 0, 1, 1,
-0.1925271, -0.6947691, -2.917266, 0, 0, 0, 1, 1,
-0.1924269, -1.219802, -4.010205, 0, 0, 0, 1, 1,
-0.1911283, 1.578189, -0.7539384, 0, 0, 0, 1, 1,
-0.1909098, 1.015615, 0.3846261, 0, 0, 0, 1, 1,
-0.1874034, -1.129539, -2.472652, 0, 0, 0, 1, 1,
-0.1809692, -1.901331, -1.193114, 1, 1, 1, 1, 1,
-0.1792556, 1.716654, 0.5759663, 1, 1, 1, 1, 1,
-0.1770098, 0.9900739, 0.4932714, 1, 1, 1, 1, 1,
-0.177009, 0.8783078, 0.2821849, 1, 1, 1, 1, 1,
-0.1770047, 1.29203, 1.139932, 1, 1, 1, 1, 1,
-0.1767942, 0.5206445, 0.9995177, 1, 1, 1, 1, 1,
-0.1767815, 0.356566, -2.05486, 1, 1, 1, 1, 1,
-0.1736528, -0.8715638, -3.177573, 1, 1, 1, 1, 1,
-0.16966, -0.04606692, -2.260758, 1, 1, 1, 1, 1,
-0.1600311, -0.1386425, -0.8356355, 1, 1, 1, 1, 1,
-0.1539651, 0.03757257, -1.045239, 1, 1, 1, 1, 1,
-0.1511123, -1.146498, -2.256974, 1, 1, 1, 1, 1,
-0.1493783, 1.060544, 1.268995, 1, 1, 1, 1, 1,
-0.1463135, 0.8124757, -0.2225572, 1, 1, 1, 1, 1,
-0.1455622, 1.438423, -0.148734, 1, 1, 1, 1, 1,
-0.1417204, -0.2340444, -3.316633, 0, 0, 1, 1, 1,
-0.1397933, 1.67106, -0.2835096, 1, 0, 0, 1, 1,
-0.1359595, 0.1967749, -0.4098585, 1, 0, 0, 1, 1,
-0.1353862, -1.221284, -3.33483, 1, 0, 0, 1, 1,
-0.1347686, -0.8789647, -1.553742, 1, 0, 0, 1, 1,
-0.1322843, 0.2307799, -1.722721, 1, 0, 0, 1, 1,
-0.1292634, 1.382699, -1.003401, 0, 0, 0, 1, 1,
-0.1270452, 0.6842713, 0.9435598, 0, 0, 0, 1, 1,
-0.1259278, -2.264335, -2.277704, 0, 0, 0, 1, 1,
-0.1253122, -0.2922238, -4.355793, 0, 0, 0, 1, 1,
-0.1247912, -0.1157583, -3.597154, 0, 0, 0, 1, 1,
-0.1233231, 0.4940937, 0.1998391, 0, 0, 0, 1, 1,
-0.1227865, 2.80861, -0.9339924, 0, 0, 0, 1, 1,
-0.1206257, -0.3329018, -1.473033, 1, 1, 1, 1, 1,
-0.1175507, -1.148055, -2.238062, 1, 1, 1, 1, 1,
-0.1150689, 1.875784, -1.333624, 1, 1, 1, 1, 1,
-0.1127892, -0.8851004, -3.624992, 1, 1, 1, 1, 1,
-0.1059364, 0.5051696, 1.075047, 1, 1, 1, 1, 1,
-0.102488, -0.5240021, -3.304513, 1, 1, 1, 1, 1,
-0.09889816, -1.435097, -3.122133, 1, 1, 1, 1, 1,
-0.09604672, 0.05788842, -3.214949, 1, 1, 1, 1, 1,
-0.09546155, -0.3406993, -2.850755, 1, 1, 1, 1, 1,
-0.0939327, 0.7416419, -1.439916, 1, 1, 1, 1, 1,
-0.08928508, 1.746563, 0.7299171, 1, 1, 1, 1, 1,
-0.0878469, 0.07424518, -2.138397, 1, 1, 1, 1, 1,
-0.0866442, 0.3011622, -1.011386, 1, 1, 1, 1, 1,
-0.08468275, 0.4477962, 0.01568944, 1, 1, 1, 1, 1,
-0.08440283, -2.2644, -2.039299, 1, 1, 1, 1, 1,
-0.08408871, -1.340368, -2.851282, 0, 0, 1, 1, 1,
-0.0825913, 1.330414, -0.05600791, 1, 0, 0, 1, 1,
-0.08194504, 1.77781, -0.7079663, 1, 0, 0, 1, 1,
-0.08010902, 0.834537, -0.7261379, 1, 0, 0, 1, 1,
-0.07986938, -1.328312, -1.671471, 1, 0, 0, 1, 1,
-0.07673117, -0.51336, -2.372035, 1, 0, 0, 1, 1,
-0.07612365, 1.458762, 2.120438, 0, 0, 0, 1, 1,
-0.07346822, 0.7188833, 1.090881, 0, 0, 0, 1, 1,
-0.07169845, 0.5906041, 0.6002061, 0, 0, 0, 1, 1,
-0.0697973, -1.020998, -2.773909, 0, 0, 0, 1, 1,
-0.06973774, -0.131809, -1.086388, 0, 0, 0, 1, 1,
-0.06680645, -0.1493894, -1.715736, 0, 0, 0, 1, 1,
-0.06119616, 0.4698385, 0.9486279, 0, 0, 0, 1, 1,
-0.05816475, 0.5739235, -0.3189481, 1, 1, 1, 1, 1,
-0.05793246, 1.325189, -0.02578106, 1, 1, 1, 1, 1,
-0.05565079, -0.7255717, -2.590721, 1, 1, 1, 1, 1,
-0.05559797, 1.372762, -0.4950374, 1, 1, 1, 1, 1,
-0.05329068, -1.013193, -3.639769, 1, 1, 1, 1, 1,
-0.05055183, -0.7300336, -2.456634, 1, 1, 1, 1, 1,
-0.04956754, -0.5585422, -3.629076, 1, 1, 1, 1, 1,
-0.04913255, -0.8935052, -3.336444, 1, 1, 1, 1, 1,
-0.04715769, 0.5026215, -1.086189, 1, 1, 1, 1, 1,
-0.04586146, -0.6837621, -3.114919, 1, 1, 1, 1, 1,
-0.04418043, -0.3887536, -2.945493, 1, 1, 1, 1, 1,
-0.04143694, -1.212467, -3.297721, 1, 1, 1, 1, 1,
-0.04095057, -0.7565059, -3.059285, 1, 1, 1, 1, 1,
-0.03317388, -0.8632709, -6.185151, 1, 1, 1, 1, 1,
-0.03154729, 1.591003, -0.8491039, 1, 1, 1, 1, 1,
-0.02953814, -2.429028, -2.36315, 0, 0, 1, 1, 1,
-0.02711877, 0.7488346, 1.140154, 1, 0, 0, 1, 1,
-0.02283345, -3.273495, -2.072624, 1, 0, 0, 1, 1,
-0.02084751, -1.017502, -4.071273, 1, 0, 0, 1, 1,
-0.01719326, -0.4072623, -2.828854, 1, 0, 0, 1, 1,
-0.01685162, 0.5353677, -1.741352, 1, 0, 0, 1, 1,
-0.01409786, -2.354186, -3.651857, 0, 0, 0, 1, 1,
-0.01302586, 0.01070857, -0.3535097, 0, 0, 0, 1, 1,
-0.00906379, 0.752004, 0.5278329, 0, 0, 0, 1, 1,
-0.002732036, 0.2479438, 1.63462, 0, 0, 0, 1, 1,
0.004159138, 0.892698, 0.8626361, 0, 0, 0, 1, 1,
0.006357172, 0.5318097, 0.666513, 0, 0, 0, 1, 1,
0.008187616, -0.4682342, 3.270132, 0, 0, 0, 1, 1,
0.009156125, -0.3353513, 4.915904, 1, 1, 1, 1, 1,
0.0118969, 2.088687, -0.1611606, 1, 1, 1, 1, 1,
0.01538656, -0.9459212, 3.149752, 1, 1, 1, 1, 1,
0.01567657, -0.01103719, 1.555113, 1, 1, 1, 1, 1,
0.01735245, 1.606262, 0.1687536, 1, 1, 1, 1, 1,
0.02578962, -0.232274, 2.776917, 1, 1, 1, 1, 1,
0.02826273, -0.6123312, 3.162147, 1, 1, 1, 1, 1,
0.02986736, -0.9642308, 2.251514, 1, 1, 1, 1, 1,
0.03179227, 0.788174, -1.576968, 1, 1, 1, 1, 1,
0.03457257, 0.9347973, 0.09891168, 1, 1, 1, 1, 1,
0.03877303, -0.9713395, 3.192968, 1, 1, 1, 1, 1,
0.03893675, -0.1637143, 2.585464, 1, 1, 1, 1, 1,
0.04040619, 0.3271222, -1.223565, 1, 1, 1, 1, 1,
0.04375191, 1.001491, -0.851465, 1, 1, 1, 1, 1,
0.0437868, 0.7577871, -0.7351408, 1, 1, 1, 1, 1,
0.04442206, -0.8801179, 1.792828, 0, 0, 1, 1, 1,
0.04841021, 1.774044, -0.1995841, 1, 0, 0, 1, 1,
0.05381151, -0.8529408, 2.431479, 1, 0, 0, 1, 1,
0.06280074, -1.341694, 2.757748, 1, 0, 0, 1, 1,
0.06427869, 0.1995972, -0.3290561, 1, 0, 0, 1, 1,
0.06624991, 0.5603139, 1.098739, 1, 0, 0, 1, 1,
0.06677952, -0.3206767, 4.270912, 0, 0, 0, 1, 1,
0.07040291, -0.7450707, 2.700363, 0, 0, 0, 1, 1,
0.07133552, -0.4411182, 2.553707, 0, 0, 0, 1, 1,
0.07341588, -0.06333494, 2.113815, 0, 0, 0, 1, 1,
0.07407759, 0.4309559, -0.1364869, 0, 0, 0, 1, 1,
0.07652292, -1.12384, 1.226622, 0, 0, 0, 1, 1,
0.07761048, -0.1658837, 3.545961, 0, 0, 0, 1, 1,
0.0793893, -0.5428773, 2.597366, 1, 1, 1, 1, 1,
0.07947015, 0.1909322, 1.351689, 1, 1, 1, 1, 1,
0.08090442, 1.141416, 0.0423407, 1, 1, 1, 1, 1,
0.08114454, -1.243731, 1.470253, 1, 1, 1, 1, 1,
0.08410047, 0.03703849, 2.38212, 1, 1, 1, 1, 1,
0.08443549, -0.01772964, 1.835887, 1, 1, 1, 1, 1,
0.08495267, 1.437435, -0.1517132, 1, 1, 1, 1, 1,
0.08823598, -0.03573871, 0.848987, 1, 1, 1, 1, 1,
0.08843008, -0.2392219, 2.227333, 1, 1, 1, 1, 1,
0.09025488, 1.478183, -0.2157366, 1, 1, 1, 1, 1,
0.09074288, 0.243192, 0.5446779, 1, 1, 1, 1, 1,
0.09444748, -0.8822415, 4.207795, 1, 1, 1, 1, 1,
0.09903239, 0.224627, -0.7842141, 1, 1, 1, 1, 1,
0.1001357, 0.1099829, 2.075373, 1, 1, 1, 1, 1,
0.1002415, 0.3573143, 0.2913499, 1, 1, 1, 1, 1,
0.1050115, 0.9759669, 1.34367, 0, 0, 1, 1, 1,
0.1056077, -1.108825, 1.540921, 1, 0, 0, 1, 1,
0.1070857, -0.1643336, 1.648541, 1, 0, 0, 1, 1,
0.1105829, 0.5388739, -0.3144859, 1, 0, 0, 1, 1,
0.1119339, -1.245764, 4.40393, 1, 0, 0, 1, 1,
0.1122422, -0.623659, 2.74671, 1, 0, 0, 1, 1,
0.1143124, 0.2500689, 0.2899785, 0, 0, 0, 1, 1,
0.1171829, 0.7145171, -0.6568046, 0, 0, 0, 1, 1,
0.1267059, -0.3323399, 1.706896, 0, 0, 0, 1, 1,
0.1297094, -0.2562718, 3.462445, 0, 0, 0, 1, 1,
0.1307957, -0.06811908, 3.164374, 0, 0, 0, 1, 1,
0.1340305, 3.496603, -1.859128, 0, 0, 0, 1, 1,
0.1346481, 1.375409, 0.01750649, 0, 0, 0, 1, 1,
0.1349188, 0.7514573, -0.2348964, 1, 1, 1, 1, 1,
0.1394944, -1.52212, 2.543079, 1, 1, 1, 1, 1,
0.1407045, -0.9274715, 3.034985, 1, 1, 1, 1, 1,
0.1414663, -0.78319, 4.187318, 1, 1, 1, 1, 1,
0.1417056, 1.019023, 0.5750026, 1, 1, 1, 1, 1,
0.1430789, -1.110181, 3.184118, 1, 1, 1, 1, 1,
0.1442937, -0.6305542, 4.644608, 1, 1, 1, 1, 1,
0.1443236, 0.2975481, 0.9893856, 1, 1, 1, 1, 1,
0.1472656, 0.347262, -0.2763874, 1, 1, 1, 1, 1,
0.1483516, -1.197591, 1.795774, 1, 1, 1, 1, 1,
0.150664, -1.067882, 2.39968, 1, 1, 1, 1, 1,
0.1515294, -1.085817, 3.488537, 1, 1, 1, 1, 1,
0.1550746, 0.9587345, 1.821509, 1, 1, 1, 1, 1,
0.1560579, 2.41922, 2.205526, 1, 1, 1, 1, 1,
0.1575684, 0.392715, 0.428588, 1, 1, 1, 1, 1,
0.1586377, -0.7911811, 2.750437, 0, 0, 1, 1, 1,
0.1613568, -0.6668452, 3.166306, 1, 0, 0, 1, 1,
0.1638478, -1.054549, 2.252681, 1, 0, 0, 1, 1,
0.165981, -0.3898296, 3.538924, 1, 0, 0, 1, 1,
0.1687559, -0.8762062, 4.406738, 1, 0, 0, 1, 1,
0.1806362, -0.3385167, 1.951266, 1, 0, 0, 1, 1,
0.1810949, 0.7359695, -0.6377501, 0, 0, 0, 1, 1,
0.1811213, 1.535766, 0.2007842, 0, 0, 0, 1, 1,
0.1826356, -0.2897198, 1.552722, 0, 0, 0, 1, 1,
0.1862646, -1.073004, 4.082244, 0, 0, 0, 1, 1,
0.1930577, -0.7794344, 1.318311, 0, 0, 0, 1, 1,
0.1935596, 0.547262, 0.6930161, 0, 0, 0, 1, 1,
0.1967569, -1.421339, 3.735978, 0, 0, 0, 1, 1,
0.1980633, 0.2366206, 0.01570114, 1, 1, 1, 1, 1,
0.1998826, -0.002656385, 2.656865, 1, 1, 1, 1, 1,
0.2013241, -1.503844, 3.681499, 1, 1, 1, 1, 1,
0.2069247, 0.2208291, 0.8901905, 1, 1, 1, 1, 1,
0.2138712, -0.0721639, 1.034306, 1, 1, 1, 1, 1,
0.2168427, -0.08355405, 2.295433, 1, 1, 1, 1, 1,
0.2203494, -0.8313434, 2.06002, 1, 1, 1, 1, 1,
0.2237462, -1.909825, 4.539422, 1, 1, 1, 1, 1,
0.2313917, -0.3933969, 4.260966, 1, 1, 1, 1, 1,
0.2349468, -1.56513, 2.203875, 1, 1, 1, 1, 1,
0.2349811, 1.011228, -0.2453192, 1, 1, 1, 1, 1,
0.2357051, -1.097461, 4.56632, 1, 1, 1, 1, 1,
0.2415727, 1.372532, -0.636936, 1, 1, 1, 1, 1,
0.2449881, 0.8249261, 1.488324, 1, 1, 1, 1, 1,
0.245089, 0.7039747, -0.1106399, 1, 1, 1, 1, 1,
0.2476554, 0.2480763, 0.7270112, 0, 0, 1, 1, 1,
0.247948, 0.3350939, 1.088822, 1, 0, 0, 1, 1,
0.2495525, -1.650225, 2.595233, 1, 0, 0, 1, 1,
0.2514856, -0.750645, 3.304719, 1, 0, 0, 1, 1,
0.2564767, -0.20888, 2.002378, 1, 0, 0, 1, 1,
0.2622974, 1.902483, -0.4256302, 1, 0, 0, 1, 1,
0.2651515, 0.6795702, 1.541567, 0, 0, 0, 1, 1,
0.2666234, -0.512432, 4.115621, 0, 0, 0, 1, 1,
0.2690772, -0.6696235, 1.647435, 0, 0, 0, 1, 1,
0.2785308, 1.025022, -2.137004, 0, 0, 0, 1, 1,
0.2843792, -2.540107, 1.104412, 0, 0, 0, 1, 1,
0.2862466, -0.005852112, 1.660319, 0, 0, 0, 1, 1,
0.2877473, -0.472131, 0.8651686, 0, 0, 0, 1, 1,
0.2878439, -0.3128368, 2.217077, 1, 1, 1, 1, 1,
0.2896001, 0.3719508, 1.287807, 1, 1, 1, 1, 1,
0.290545, 1.666929, 0.418581, 1, 1, 1, 1, 1,
0.293506, -0.6450621, 3.209574, 1, 1, 1, 1, 1,
0.2944266, 0.7736872, -1.063195, 1, 1, 1, 1, 1,
0.2944955, 1.035714, 0.8920985, 1, 1, 1, 1, 1,
0.2971101, -0.8558301, 4.247418, 1, 1, 1, 1, 1,
0.2977828, 0.6231334, 0.6584619, 1, 1, 1, 1, 1,
0.3005343, 0.4626253, 0.9376498, 1, 1, 1, 1, 1,
0.3090044, 0.9437834, 0.9029409, 1, 1, 1, 1, 1,
0.3093638, -0.1642777, 1.705564, 1, 1, 1, 1, 1,
0.3101082, 0.8301417, -1.790619, 1, 1, 1, 1, 1,
0.3123362, -1.017797, 4.058957, 1, 1, 1, 1, 1,
0.3129186, 0.1414416, 0.9459883, 1, 1, 1, 1, 1,
0.3183484, 0.1932429, 1.092924, 1, 1, 1, 1, 1,
0.3231775, -0.5332813, 2.69306, 0, 0, 1, 1, 1,
0.3233864, -0.03520278, 3.258346, 1, 0, 0, 1, 1,
0.3240968, 1.890463, -0.3443987, 1, 0, 0, 1, 1,
0.3269567, -1.332476, 0.509338, 1, 0, 0, 1, 1,
0.3285723, -0.1028862, 3.61465, 1, 0, 0, 1, 1,
0.3291497, -0.5058717, 3.835155, 1, 0, 0, 1, 1,
0.3365274, 0.6512291, -0.304634, 0, 0, 0, 1, 1,
0.3391146, 0.5718747, 1.749346, 0, 0, 0, 1, 1,
0.3486733, -0.665504, 4.044878, 0, 0, 0, 1, 1,
0.3530442, -0.1968511, 2.885599, 0, 0, 0, 1, 1,
0.3538548, -1.502329, 2.746691, 0, 0, 0, 1, 1,
0.3648948, -0.8549345, 2.517527, 0, 0, 0, 1, 1,
0.3678432, -0.09290624, 1.495728, 0, 0, 0, 1, 1,
0.3742613, 0.2257635, -1.327722, 1, 1, 1, 1, 1,
0.3780217, 1.312019, 0.8390961, 1, 1, 1, 1, 1,
0.3800315, 1.512853, 1.835113, 1, 1, 1, 1, 1,
0.3879202, 0.2353795, 2.857809, 1, 1, 1, 1, 1,
0.3908073, -1.621155, 3.579501, 1, 1, 1, 1, 1,
0.391713, -1.911579, 4.992638, 1, 1, 1, 1, 1,
0.3929735, 0.7619325, -1.043622, 1, 1, 1, 1, 1,
0.3931789, 0.1490024, 0.6903225, 1, 1, 1, 1, 1,
0.4019099, -1.562869, 0.631337, 1, 1, 1, 1, 1,
0.4030421, 0.6504785, 0.7859943, 1, 1, 1, 1, 1,
0.4043614, 1.224447, 0.6935787, 1, 1, 1, 1, 1,
0.4138518, -0.3863223, 1.943583, 1, 1, 1, 1, 1,
0.4151049, 1.182014, 1.837779, 1, 1, 1, 1, 1,
0.4162218, 0.5685053, 0.5440042, 1, 1, 1, 1, 1,
0.4248313, -1.017711, 2.731458, 1, 1, 1, 1, 1,
0.4248552, -0.1452384, 3.441962, 0, 0, 1, 1, 1,
0.4259641, 1.482038, 0.08357837, 1, 0, 0, 1, 1,
0.4271977, 1.899976, -0.01510526, 1, 0, 0, 1, 1,
0.4331199, -0.0725329, 2.100524, 1, 0, 0, 1, 1,
0.4411803, -0.5210564, 2.482465, 1, 0, 0, 1, 1,
0.4445562, -0.6549363, 3.092216, 1, 0, 0, 1, 1,
0.4455248, -0.4039375, 3.04116, 0, 0, 0, 1, 1,
0.4505056, -0.1562738, 4.042902, 0, 0, 0, 1, 1,
0.4510171, 0.1802532, 1.568631, 0, 0, 0, 1, 1,
0.4577664, -1.362732, 1.306274, 0, 0, 0, 1, 1,
0.4594175, 1.124845, 0.8212323, 0, 0, 0, 1, 1,
0.4645034, -0.5203188, 3.532431, 0, 0, 0, 1, 1,
0.4719815, 0.3076655, -0.2846717, 0, 0, 0, 1, 1,
0.4782635, -1.167069, 1.947287, 1, 1, 1, 1, 1,
0.4803184, -0.2134344, 2.947181, 1, 1, 1, 1, 1,
0.4823152, 2.229047, 0.5969096, 1, 1, 1, 1, 1,
0.483802, 1.096243, 0.1838071, 1, 1, 1, 1, 1,
0.4864007, 0.3803095, 0.02692625, 1, 1, 1, 1, 1,
0.4872744, -0.6069075, 1.947802, 1, 1, 1, 1, 1,
0.4908864, -0.6679863, 1.577351, 1, 1, 1, 1, 1,
0.4943683, -0.2988212, 3.285391, 1, 1, 1, 1, 1,
0.4955897, -1.943495, 0.8873236, 1, 1, 1, 1, 1,
0.4987738, 0.5606694, 1.051614, 1, 1, 1, 1, 1,
0.5005462, -0.8917329, 2.570993, 1, 1, 1, 1, 1,
0.5014923, -1.637314, 3.086712, 1, 1, 1, 1, 1,
0.5025977, 1.172482, 0.1299733, 1, 1, 1, 1, 1,
0.5075541, 1.714187, 0.2767621, 1, 1, 1, 1, 1,
0.5131132, -0.13692, 2.068259, 1, 1, 1, 1, 1,
0.5189907, -0.934463, 4.074624, 0, 0, 1, 1, 1,
0.5223842, 1.580695, 1.085244, 1, 0, 0, 1, 1,
0.524991, 1.204674, 0.3088298, 1, 0, 0, 1, 1,
0.5260444, 0.09347522, 2.61962, 1, 0, 0, 1, 1,
0.5328496, 0.7049406, -1.372147, 1, 0, 0, 1, 1,
0.5357581, -0.01662057, 1.588455, 1, 0, 0, 1, 1,
0.536501, -0.9097273, 4.414608, 0, 0, 0, 1, 1,
0.5391298, -0.6301616, 2.254338, 0, 0, 0, 1, 1,
0.54097, 1.027506, 0.6676304, 0, 0, 0, 1, 1,
0.5430709, 0.2769366, 0.06414134, 0, 0, 0, 1, 1,
0.5471904, -0.8857732, 2.781001, 0, 0, 0, 1, 1,
0.5523757, -0.5345412, 1.638626, 0, 0, 0, 1, 1,
0.5532283, -1.255914, 1.456216, 0, 0, 0, 1, 1,
0.5564788, -0.9877692, 0.2660896, 1, 1, 1, 1, 1,
0.5564836, -1.075453, 2.19543, 1, 1, 1, 1, 1,
0.5577309, 0.1960121, 2.162089, 1, 1, 1, 1, 1,
0.5673813, 0.7604636, -0.1081387, 1, 1, 1, 1, 1,
0.5703238, 0.05978926, 1.655179, 1, 1, 1, 1, 1,
0.5716474, 0.03677715, 0.3088838, 1, 1, 1, 1, 1,
0.5719357, -1.667527, 2.860825, 1, 1, 1, 1, 1,
0.5785658, -0.9635991, 2.833474, 1, 1, 1, 1, 1,
0.5792138, -1.08563, 2.689454, 1, 1, 1, 1, 1,
0.5825651, -0.6875388, 3.422538, 1, 1, 1, 1, 1,
0.5825778, -1.033702, 3.120918, 1, 1, 1, 1, 1,
0.5869126, 0.1676583, 0.8846117, 1, 1, 1, 1, 1,
0.5869177, -0.2275129, 0.6962098, 1, 1, 1, 1, 1,
0.5876734, -0.8832017, 3.403006, 1, 1, 1, 1, 1,
0.5930881, -1.42622, 1.582837, 1, 1, 1, 1, 1,
0.5941081, -0.590084, 1.816148, 0, 0, 1, 1, 1,
0.5957347, 0.8887483, -0.0733669, 1, 0, 0, 1, 1,
0.5963664, -0.8465475, 3.081718, 1, 0, 0, 1, 1,
0.5997458, -1.178543, 3.133142, 1, 0, 0, 1, 1,
0.6000758, 0.3462196, 2.100253, 1, 0, 0, 1, 1,
0.6006046, -0.7799442, 1.261677, 1, 0, 0, 1, 1,
0.6222062, 0.9489108, 1.802717, 0, 0, 0, 1, 1,
0.6226825, -0.1122264, 2.466621, 0, 0, 0, 1, 1,
0.6229047, -1.988664, 4.049987, 0, 0, 0, 1, 1,
0.6312234, 0.6825123, 1.037533, 0, 0, 0, 1, 1,
0.6385475, -0.6298568, 1.5349, 0, 0, 0, 1, 1,
0.640107, -0.8773099, 2.066843, 0, 0, 0, 1, 1,
0.6403859, -0.6401196, 1.403909, 0, 0, 0, 1, 1,
0.6451626, -0.8755238, 1.907659, 1, 1, 1, 1, 1,
0.6456934, 0.3555365, 2.580342, 1, 1, 1, 1, 1,
0.6478118, 0.8106685, 2.723162, 1, 1, 1, 1, 1,
0.6503384, -0.4051015, 2.621397, 1, 1, 1, 1, 1,
0.6507456, -1.127394, 2.643226, 1, 1, 1, 1, 1,
0.6622751, -0.1871759, 1.936355, 1, 1, 1, 1, 1,
0.6667315, -1.724202, 3.593831, 1, 1, 1, 1, 1,
0.6668339, 1.3741, 2.495698, 1, 1, 1, 1, 1,
0.6721215, 0.1150176, 1.296641, 1, 1, 1, 1, 1,
0.6723663, 0.001173176, 3.03408, 1, 1, 1, 1, 1,
0.6827252, 0.2944, -0.6520928, 1, 1, 1, 1, 1,
0.688208, 2.309694, 0.4848639, 1, 1, 1, 1, 1,
0.6888041, -2.098644, 2.31969, 1, 1, 1, 1, 1,
0.6893359, 0.2975282, -0.1186938, 1, 1, 1, 1, 1,
0.6951004, 1.652544, -0.6582609, 1, 1, 1, 1, 1,
0.6952459, -1.171507, 2.563215, 0, 0, 1, 1, 1,
0.6973348, 1.704407, 0.2459363, 1, 0, 0, 1, 1,
0.7015306, 1.440736, 0.3563055, 1, 0, 0, 1, 1,
0.7088006, -1.132801, -0.2362733, 1, 0, 0, 1, 1,
0.7101136, 1.268219, -1.120132, 1, 0, 0, 1, 1,
0.7165028, 1.539989, -0.07401053, 1, 0, 0, 1, 1,
0.7230519, 0.08391226, 1.047868, 0, 0, 0, 1, 1,
0.723272, -0.07480201, 0.5100448, 0, 0, 0, 1, 1,
0.7233295, -0.1375256, 0.3034947, 0, 0, 0, 1, 1,
0.7248186, 0.1214248, 0.8065432, 0, 0, 0, 1, 1,
0.7341386, 1.010032, 0.8064166, 0, 0, 0, 1, 1,
0.735406, 1.531047, 0.02220543, 0, 0, 0, 1, 1,
0.7360539, 0.6054396, 0.9145505, 0, 0, 0, 1, 1,
0.7364133, -0.07905976, 0.09266628, 1, 1, 1, 1, 1,
0.7417656, 0.60237, 2.920953, 1, 1, 1, 1, 1,
0.7434517, 0.03502009, 0.1946156, 1, 1, 1, 1, 1,
0.7447976, -0.2872164, 1.601042, 1, 1, 1, 1, 1,
0.7478185, 0.07796649, 1.668419, 1, 1, 1, 1, 1,
0.7559292, -1.735659, 4.067523, 1, 1, 1, 1, 1,
0.7575095, 2.127342, 0.3872433, 1, 1, 1, 1, 1,
0.7616878, -0.7378411, 3.188926, 1, 1, 1, 1, 1,
0.7682544, -0.2133793, 0.6959554, 1, 1, 1, 1, 1,
0.7698449, -1.467357, 4.115204, 1, 1, 1, 1, 1,
0.7702428, 0.007910782, 0.3160881, 1, 1, 1, 1, 1,
0.7708876, 1.464446, 1.388998, 1, 1, 1, 1, 1,
0.7720628, -1.461199, 1.412509, 1, 1, 1, 1, 1,
0.7736272, -1.63154, 2.475197, 1, 1, 1, 1, 1,
0.7738302, 0.5566481, 2.668687, 1, 1, 1, 1, 1,
0.7747498, 1.265045, 0.3615744, 0, 0, 1, 1, 1,
0.7757995, 0.3130156, 0.6222044, 1, 0, 0, 1, 1,
0.7856321, -0.5134847, 2.162323, 1, 0, 0, 1, 1,
0.7930597, 0.6161968, 0.2519893, 1, 0, 0, 1, 1,
0.8036922, 0.157774, 1.742139, 1, 0, 0, 1, 1,
0.8042504, 1.282642, 0.4199771, 1, 0, 0, 1, 1,
0.8045879, 0.09871662, 0.4920059, 0, 0, 0, 1, 1,
0.8047864, -2.186682, 3.297929, 0, 0, 0, 1, 1,
0.8086327, 0.2931608, 1.10269, 0, 0, 0, 1, 1,
0.8115681, 1.596749, -0.04531389, 0, 0, 0, 1, 1,
0.8129072, 0.5521766, 0.7631446, 0, 0, 0, 1, 1,
0.8144741, 2.170532, -1.265088, 0, 0, 0, 1, 1,
0.8149834, 0.4572892, 1.971013, 0, 0, 0, 1, 1,
0.8161631, 0.6622119, 1.423798, 1, 1, 1, 1, 1,
0.8163858, -1.003851, 3.480449, 1, 1, 1, 1, 1,
0.816955, 0.3103089, 1.382956, 1, 1, 1, 1, 1,
0.8223812, -2.068325, 4.089365, 1, 1, 1, 1, 1,
0.8336482, -0.1133783, 2.87486, 1, 1, 1, 1, 1,
0.8372469, -0.1543306, 2.548955, 1, 1, 1, 1, 1,
0.838785, -1.458312, -0.02160842, 1, 1, 1, 1, 1,
0.8449901, -1.228749, 3.064178, 1, 1, 1, 1, 1,
0.8483015, -2.449418, 2.713671, 1, 1, 1, 1, 1,
0.8522624, -1.106656, 3.617749, 1, 1, 1, 1, 1,
0.8558558, -1.697149, 2.910119, 1, 1, 1, 1, 1,
0.8578583, 0.8228178, 0.8981795, 1, 1, 1, 1, 1,
0.8590894, -1.522285, 2.960695, 1, 1, 1, 1, 1,
0.8596604, -0.2197758, 1.177096, 1, 1, 1, 1, 1,
0.8599677, 0.1437922, -0.1583462, 1, 1, 1, 1, 1,
0.8691577, -1.269033, 4.675753, 0, 0, 1, 1, 1,
0.8712212, -1.33305, 2.768713, 1, 0, 0, 1, 1,
0.8844779, -1.45706, 3.78375, 1, 0, 0, 1, 1,
0.8875331, 0.60218, -0.4553112, 1, 0, 0, 1, 1,
0.8923022, 0.1164071, 0.9043822, 1, 0, 0, 1, 1,
0.8926338, -1.243919, 2.908423, 1, 0, 0, 1, 1,
0.8939617, -2.322141, 3.622841, 0, 0, 0, 1, 1,
0.8942088, 0.03332121, 0.5276276, 0, 0, 0, 1, 1,
0.9001272, 1.987061, -1.260301, 0, 0, 0, 1, 1,
0.9036301, -1.110895, 3.574147, 0, 0, 0, 1, 1,
0.9071326, -1.991416, 2.333133, 0, 0, 0, 1, 1,
0.9146869, 1.195936, -0.4241627, 0, 0, 0, 1, 1,
0.9235576, -2.086403, 3.061886, 0, 0, 0, 1, 1,
0.9249526, -1.219876, 4.012874, 1, 1, 1, 1, 1,
0.9270052, -0.268639, 2.04577, 1, 1, 1, 1, 1,
0.927251, 0.394049, 2.41021, 1, 1, 1, 1, 1,
0.9282034, 1.426175, 0.648461, 1, 1, 1, 1, 1,
0.9312196, 1.35357, 1.187957, 1, 1, 1, 1, 1,
0.9411061, 0.6999037, 1.200968, 1, 1, 1, 1, 1,
0.9413719, -0.7778216, 3.181397, 1, 1, 1, 1, 1,
0.9462093, -1.03687, 2.433859, 1, 1, 1, 1, 1,
0.9555716, -1.400776, 2.588376, 1, 1, 1, 1, 1,
0.9576918, 1.703055, 0.9757308, 1, 1, 1, 1, 1,
0.9613038, 0.4709201, 1.437776, 1, 1, 1, 1, 1,
0.961489, -0.1502781, 1.589158, 1, 1, 1, 1, 1,
0.9626625, 0.04363866, 1.194335, 1, 1, 1, 1, 1,
0.963449, -0.1176492, 2.571813, 1, 1, 1, 1, 1,
0.9762303, 0.02119204, 1.370249, 1, 1, 1, 1, 1,
0.9800824, 0.8058546, 1.970703, 0, 0, 1, 1, 1,
0.9813866, -1.547186, 3.716315, 1, 0, 0, 1, 1,
0.9890297, -0.05717796, 1.125418, 1, 0, 0, 1, 1,
1.001081, 0.01584242, 1.653028, 1, 0, 0, 1, 1,
1.004903, 0.09008007, 0.8929524, 1, 0, 0, 1, 1,
1.012545, 1.987021, 0.09034128, 1, 0, 0, 1, 1,
1.015568, 1.298291, -0.1961261, 0, 0, 0, 1, 1,
1.02918, -0.9968878, 0.7095779, 0, 0, 0, 1, 1,
1.029242, 0.2572347, -0.01667046, 0, 0, 0, 1, 1,
1.036899, 0.5520983, 2.011411, 0, 0, 0, 1, 1,
1.046699, 0.1496181, 2.546932, 0, 0, 0, 1, 1,
1.048792, 0.6435821, 0.6442662, 0, 0, 0, 1, 1,
1.060474, 1.067726, 0.07563457, 0, 0, 0, 1, 1,
1.075389, 0.5634715, 2.502774, 1, 1, 1, 1, 1,
1.080494, 0.5837784, 1.837393, 1, 1, 1, 1, 1,
1.083206, 1.221967, -0.3909447, 1, 1, 1, 1, 1,
1.084267, 1.600025, 0.7480227, 1, 1, 1, 1, 1,
1.100714, 0.5523583, 1.977093, 1, 1, 1, 1, 1,
1.101393, -0.02503518, 1.234098, 1, 1, 1, 1, 1,
1.102281, -1.865294, 3.037738, 1, 1, 1, 1, 1,
1.110337, -2.567097, 3.054874, 1, 1, 1, 1, 1,
1.11151, 0.8808046, 0.247324, 1, 1, 1, 1, 1,
1.120103, 0.1489421, 1.967655, 1, 1, 1, 1, 1,
1.121003, -0.28167, 1.517406, 1, 1, 1, 1, 1,
1.124534, 0.299713, 2.608588, 1, 1, 1, 1, 1,
1.124978, -0.3923201, 2.521914, 1, 1, 1, 1, 1,
1.130385, 0.5342807, 1.24047, 1, 1, 1, 1, 1,
1.140578, 0.2175355, 3.487909, 1, 1, 1, 1, 1,
1.144006, -0.245197, 0.2030917, 0, 0, 1, 1, 1,
1.14773, -1.770615, 2.981501, 1, 0, 0, 1, 1,
1.149238, 1.042304, 1.434859, 1, 0, 0, 1, 1,
1.15211, -0.6730543, 4.318203, 1, 0, 0, 1, 1,
1.154117, -0.9746245, 1.928976, 1, 0, 0, 1, 1,
1.158337, -0.1344844, 2.354479, 1, 0, 0, 1, 1,
1.162507, -1.034442, 3.069243, 0, 0, 0, 1, 1,
1.16321, 1.518696, 1.459368, 0, 0, 0, 1, 1,
1.169369, 0.4668767, -0.3664238, 0, 0, 0, 1, 1,
1.172617, -0.2337881, 0.2592549, 0, 0, 0, 1, 1,
1.173076, -0.2041142, 2.073251, 0, 0, 0, 1, 1,
1.177625, -2.052002, 2.572353, 0, 0, 0, 1, 1,
1.180803, 0.3648812, 0.9711455, 0, 0, 0, 1, 1,
1.18114, -0.6336984, 2.417815, 1, 1, 1, 1, 1,
1.182219, 0.2929195, 1.201073, 1, 1, 1, 1, 1,
1.186162, -0.01315633, 1.180773, 1, 1, 1, 1, 1,
1.192016, -1.529514, 3.441343, 1, 1, 1, 1, 1,
1.195668, 1.200011, -0.3900585, 1, 1, 1, 1, 1,
1.197695, -0.391201, 1.954936, 1, 1, 1, 1, 1,
1.200371, -0.8727897, 0.5472695, 1, 1, 1, 1, 1,
1.212696, -1.029551, 1.849944, 1, 1, 1, 1, 1,
1.219787, 2.415385, -0.6407091, 1, 1, 1, 1, 1,
1.225116, -0.493744, 1.914402, 1, 1, 1, 1, 1,
1.227693, 1.742651, 0.1001983, 1, 1, 1, 1, 1,
1.237136, 0.331016, 0.4782527, 1, 1, 1, 1, 1,
1.238551, -0.339207, 2.338444, 1, 1, 1, 1, 1,
1.244352, -0.3526314, 2.568733, 1, 1, 1, 1, 1,
1.245254, -1.099017, 2.922263, 1, 1, 1, 1, 1,
1.245528, 0.3263228, 1.514414, 0, 0, 1, 1, 1,
1.246496, 0.1380723, 1.261192, 1, 0, 0, 1, 1,
1.252214, 2.046427, 1.183337, 1, 0, 0, 1, 1,
1.254941, 0.8370324, 0.01355483, 1, 0, 0, 1, 1,
1.270065, -1.693465, 2.091678, 1, 0, 0, 1, 1,
1.270671, 0.9007627, -0.3445276, 1, 0, 0, 1, 1,
1.273305, -2.540561, 3.076459, 0, 0, 0, 1, 1,
1.29789, 0.01628532, -0.2801351, 0, 0, 0, 1, 1,
1.299796, -1.08289, 2.585764, 0, 0, 0, 1, 1,
1.303561, -0.7101414, 3.040696, 0, 0, 0, 1, 1,
1.304666, -0.5581006, 3.226727, 0, 0, 0, 1, 1,
1.305528, -0.444464, -0.4290253, 0, 0, 0, 1, 1,
1.306312, -0.1633365, 3.43635, 0, 0, 0, 1, 1,
1.314309, -1.311638, 2.661746, 1, 1, 1, 1, 1,
1.317262, -0.7028645, 2.55185, 1, 1, 1, 1, 1,
1.319884, 0.02835567, 3.50128, 1, 1, 1, 1, 1,
1.321765, -0.4607311, 1.814279, 1, 1, 1, 1, 1,
1.322605, -1.087278, 2.650547, 1, 1, 1, 1, 1,
1.322607, 0.2940272, 1.581013, 1, 1, 1, 1, 1,
1.346334, 0.2045634, 3.054352, 1, 1, 1, 1, 1,
1.346758, 2.007774, -0.07424159, 1, 1, 1, 1, 1,
1.349863, 0.934022, 1.903256, 1, 1, 1, 1, 1,
1.352347, 0.9165161, 1.407367, 1, 1, 1, 1, 1,
1.368294, -0.08725388, 1.734635, 1, 1, 1, 1, 1,
1.373351, -0.3334014, 0.552282, 1, 1, 1, 1, 1,
1.384503, 1.140325, 0.6956394, 1, 1, 1, 1, 1,
1.390435, -0.9455318, 3.381636, 1, 1, 1, 1, 1,
1.397407, -0.9242634, 1.543845, 1, 1, 1, 1, 1,
1.409296, 0.9444803, -0.3347888, 0, 0, 1, 1, 1,
1.416306, -1.581615, 2.393838, 1, 0, 0, 1, 1,
1.435019, 0.4595831, 2.533022, 1, 0, 0, 1, 1,
1.468046, -0.3328838, 0.6571779, 1, 0, 0, 1, 1,
1.469849, -0.8010961, 2.742689, 1, 0, 0, 1, 1,
1.474086, -1.14535, 2.34164, 1, 0, 0, 1, 1,
1.477351, 0.6588171, 0.3784354, 0, 0, 0, 1, 1,
1.495422, -2.585053, 2.752242, 0, 0, 0, 1, 1,
1.498309, 0.8537701, 1.846541, 0, 0, 0, 1, 1,
1.511793, -0.509371, 0.05692824, 0, 0, 0, 1, 1,
1.518799, -0.9766318, 1.518592, 0, 0, 0, 1, 1,
1.525484, -1.016111, 2.30238, 0, 0, 0, 1, 1,
1.536534, 1.405391, 1.283136, 0, 0, 0, 1, 1,
1.578796, -0.4714547, 1.856361, 1, 1, 1, 1, 1,
1.58305, 0.03694766, 0.8205147, 1, 1, 1, 1, 1,
1.59786, 0.2439584, 0.3261594, 1, 1, 1, 1, 1,
1.603068, 0.8069176, 1.469371, 1, 1, 1, 1, 1,
1.605147, -0.3944717, 0.6440821, 1, 1, 1, 1, 1,
1.606446, 0.268205, 0.0694778, 1, 1, 1, 1, 1,
1.610733, 0.8721959, 0.400236, 1, 1, 1, 1, 1,
1.613193, 0.181937, 0.5970211, 1, 1, 1, 1, 1,
1.617133, 0.2577614, 1.723732, 1, 1, 1, 1, 1,
1.634518, -0.1322727, 1.802717, 1, 1, 1, 1, 1,
1.659218, -0.1327372, 2.898781, 1, 1, 1, 1, 1,
1.664298, -0.1367074, 4.18537, 1, 1, 1, 1, 1,
1.672131, -0.9433655, 1.734725, 1, 1, 1, 1, 1,
1.680368, -0.26026, 2.432673, 1, 1, 1, 1, 1,
1.703259, -1.199062, 3.056692, 1, 1, 1, 1, 1,
1.706788, 2.133387, 1.880777, 0, 0, 1, 1, 1,
1.711736, 0.2664296, 0.6193064, 1, 0, 0, 1, 1,
1.711841, -0.2832767, 1.689437, 1, 0, 0, 1, 1,
1.72765, 0.342732, 0.9182969, 1, 0, 0, 1, 1,
1.748818, -0.2575371, 1.14034, 1, 0, 0, 1, 1,
1.750026, -0.5164842, 2.161875, 1, 0, 0, 1, 1,
1.755052, -0.2877258, 2.35087, 0, 0, 0, 1, 1,
1.761467, 0.4119695, 1.711551, 0, 0, 0, 1, 1,
1.797745, -0.2973417, 1.946643, 0, 0, 0, 1, 1,
1.804716, 1.46517, -0.09053899, 0, 0, 0, 1, 1,
1.804754, -0.2596464, 0.8851779, 0, 0, 0, 1, 1,
1.815314, -1.298857, 4.454593, 0, 0, 0, 1, 1,
1.848469, 0.9715967, 1.781353, 0, 0, 0, 1, 1,
1.857376, 0.6099254, -1.265803, 1, 1, 1, 1, 1,
1.869263, 0.1920663, 2.434121, 1, 1, 1, 1, 1,
1.878284, -0.1414626, 1.229774, 1, 1, 1, 1, 1,
1.904094, 0.1488219, 1.096681, 1, 1, 1, 1, 1,
1.907389, -0.6371419, 3.341719, 1, 1, 1, 1, 1,
1.919883, -0.8317543, 2.559104, 1, 1, 1, 1, 1,
1.942903, -1.13235, 3.000625, 1, 1, 1, 1, 1,
1.946484, 0.4550927, 0.4623723, 1, 1, 1, 1, 1,
1.977107, 0.5654274, 2.380058, 1, 1, 1, 1, 1,
1.984155, 0.04162928, 0.4421895, 1, 1, 1, 1, 1,
1.984514, 0.03190666, 2.67407, 1, 1, 1, 1, 1,
2.011466, -0.2860948, 0.2739883, 1, 1, 1, 1, 1,
2.023394, 0.1112681, 1.761205, 1, 1, 1, 1, 1,
2.041303, -0.1274113, -0.6614832, 1, 1, 1, 1, 1,
2.065925, 1.604768, 1.795966, 1, 1, 1, 1, 1,
2.07551, -0.8425839, 0.7400973, 0, 0, 1, 1, 1,
2.090441, 0.4811815, 1.518541, 1, 0, 0, 1, 1,
2.12607, -1.004283, 0.9855377, 1, 0, 0, 1, 1,
2.12881, -0.44807, 1.980975, 1, 0, 0, 1, 1,
2.149416, 0.9850033, 1.417837, 1, 0, 0, 1, 1,
2.186098, -0.03543209, 3.103722, 1, 0, 0, 1, 1,
2.226955, 0.4064526, 2.213599, 0, 0, 0, 1, 1,
2.233001, 1.238284, 1.747987, 0, 0, 0, 1, 1,
2.273901, -0.6287311, 0.4677799, 0, 0, 0, 1, 1,
2.326957, -0.615788, 1.979771, 0, 0, 0, 1, 1,
2.337016, 0.8732678, 1.672028, 0, 0, 0, 1, 1,
2.337678, -0.8235508, 3.930113, 0, 0, 0, 1, 1,
2.342677, -0.1409936, 2.317792, 0, 0, 0, 1, 1,
2.458148, -1.429441, 2.133727, 1, 1, 1, 1, 1,
2.473293, 0.02251666, 1.706177, 1, 1, 1, 1, 1,
2.614795, -0.0739161, 3.829786, 1, 1, 1, 1, 1,
2.635174, 1.556777, 1.136655, 1, 1, 1, 1, 1,
2.674699, 1.677903, -0.8923773, 1, 1, 1, 1, 1,
3.043483, -0.7797458, 1.434373, 1, 1, 1, 1, 1,
3.290693, -1.120004, 3.604079, 1, 1, 1, 1, 1
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
var radius = 9.823874;
var distance = 34.50594;
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
mvMatrix.translate( -0.153434, -0.1115539, 0.5962565 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50594);
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
