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
-3.397673, 0.700456, -0.1341053, 1, 0, 0, 1,
-3.298298, -1.300924, -1.415084, 1, 0.007843138, 0, 1,
-3.231284, 0.1155599, -1.436453, 1, 0.01176471, 0, 1,
-3.039815, -0.5167038, -1.89651, 1, 0.01960784, 0, 1,
-2.907558, -1.369976, -1.382434, 1, 0.02352941, 0, 1,
-2.859601, 0.2081897, -0.7532988, 1, 0.03137255, 0, 1,
-2.826956, 3.058018, -0.5285983, 1, 0.03529412, 0, 1,
-2.797884, 1.71555, -0.9076179, 1, 0.04313726, 0, 1,
-2.738659, 0.2060989, -1.515603, 1, 0.04705882, 0, 1,
-2.614084, -0.5406006, -2.122764, 1, 0.05490196, 0, 1,
-2.430348, -1.041058, -3.744176, 1, 0.05882353, 0, 1,
-2.312291, -0.913348, -1.892848, 1, 0.06666667, 0, 1,
-2.255924, -0.6978582, -2.710393, 1, 0.07058824, 0, 1,
-2.253755, -0.6668734, -1.248578, 1, 0.07843138, 0, 1,
-2.238201, 1.064899, 0.2057596, 1, 0.08235294, 0, 1,
-2.209481, -0.7804472, -1.929119, 1, 0.09019608, 0, 1,
-2.179179, 1.163686, -1.387866, 1, 0.09411765, 0, 1,
-2.088509, 0.1051587, -1.216277, 1, 0.1019608, 0, 1,
-2.088049, 0.8538575, -0.4301163, 1, 0.1098039, 0, 1,
-2.085041, 1.106971, -0.7874739, 1, 0.1137255, 0, 1,
-2.028642, -0.2279321, -2.112957, 1, 0.1215686, 0, 1,
-2.026823, -0.6692262, -0.3141316, 1, 0.1254902, 0, 1,
-1.98017, 0.3404292, -3.300302, 1, 0.1333333, 0, 1,
-1.969205, 1.861591, -1.333045, 1, 0.1372549, 0, 1,
-1.964508, -0.3355097, -1.556357, 1, 0.145098, 0, 1,
-1.957892, 0.499424, -1.179975, 1, 0.1490196, 0, 1,
-1.957745, -0.02159427, -0.4091065, 1, 0.1568628, 0, 1,
-1.955119, 0.7698461, -1.515504, 1, 0.1607843, 0, 1,
-1.944537, -0.9978017, -0.5333227, 1, 0.1686275, 0, 1,
-1.916529, -0.3841939, -1.382613, 1, 0.172549, 0, 1,
-1.882288, 0.2630733, -0.3650874, 1, 0.1803922, 0, 1,
-1.880096, 0.5172931, -1.830366, 1, 0.1843137, 0, 1,
-1.863486, 1.011373, -1.191112, 1, 0.1921569, 0, 1,
-1.859702, 0.6738679, -0.9912502, 1, 0.1960784, 0, 1,
-1.834778, -0.7346098, -2.168988, 1, 0.2039216, 0, 1,
-1.795128, -0.8504248, -1.810483, 1, 0.2117647, 0, 1,
-1.773492, 0.1596547, -0.9647378, 1, 0.2156863, 0, 1,
-1.771292, -0.1173119, -2.081211, 1, 0.2235294, 0, 1,
-1.755107, 0.85896, -2.066569, 1, 0.227451, 0, 1,
-1.73935, 0.9497021, -0.2796739, 1, 0.2352941, 0, 1,
-1.72734, -0.7987095, -1.737381, 1, 0.2392157, 0, 1,
-1.715647, 0.2010294, -1.839673, 1, 0.2470588, 0, 1,
-1.714294, -0.1812635, 0.9931653, 1, 0.2509804, 0, 1,
-1.704156, -0.2228962, -3.312513, 1, 0.2588235, 0, 1,
-1.682769, -1.680593, -4.09707, 1, 0.2627451, 0, 1,
-1.673965, 1.056025, -2.068768, 1, 0.2705882, 0, 1,
-1.668409, 0.7669127, -1.995713, 1, 0.2745098, 0, 1,
-1.662781, -1.146105, -1.799168, 1, 0.282353, 0, 1,
-1.661477, -0.2280277, -2.735948, 1, 0.2862745, 0, 1,
-1.656424, -0.45514, -3.055223, 1, 0.2941177, 0, 1,
-1.65147, -0.471059, -3.476807, 1, 0.3019608, 0, 1,
-1.622756, 1.6925, -0.1046825, 1, 0.3058824, 0, 1,
-1.612814, -0.6276647, -1.299545, 1, 0.3137255, 0, 1,
-1.573717, -0.6531018, -2.602713, 1, 0.3176471, 0, 1,
-1.565045, 1.222805, -2.114418, 1, 0.3254902, 0, 1,
-1.543535, 0.178873, -1.860304, 1, 0.3294118, 0, 1,
-1.542471, 0.00943918, -0.5083462, 1, 0.3372549, 0, 1,
-1.540511, 0.2417714, -0.6391553, 1, 0.3411765, 0, 1,
-1.517561, -0.5676357, 0.2949557, 1, 0.3490196, 0, 1,
-1.497415, 0.1943633, -0.3133005, 1, 0.3529412, 0, 1,
-1.493001, 0.5197628, -1.74034, 1, 0.3607843, 0, 1,
-1.484088, -0.1725348, -1.879247, 1, 0.3647059, 0, 1,
-1.474998, 1.736036, -2.661859, 1, 0.372549, 0, 1,
-1.470556, -0.706443, -2.062542, 1, 0.3764706, 0, 1,
-1.470046, 2.389399, -1.097151, 1, 0.3843137, 0, 1,
-1.447265, 1.651718, -0.5090142, 1, 0.3882353, 0, 1,
-1.434517, 0.3398448, -0.04995852, 1, 0.3960784, 0, 1,
-1.426109, -0.09797211, -2.235104, 1, 0.4039216, 0, 1,
-1.404022, -0.08830231, -1.418838, 1, 0.4078431, 0, 1,
-1.393706, 0.3377401, -0.6788873, 1, 0.4156863, 0, 1,
-1.391458, 0.6765491, 0.5943038, 1, 0.4196078, 0, 1,
-1.390708, -1.010663, -2.80904, 1, 0.427451, 0, 1,
-1.388824, -0.6653306, -0.4721988, 1, 0.4313726, 0, 1,
-1.381237, 0.8088923, -1.364996, 1, 0.4392157, 0, 1,
-1.374746, 0.04539369, -1.378688, 1, 0.4431373, 0, 1,
-1.374384, -0.7655993, -1.644705, 1, 0.4509804, 0, 1,
-1.37094, -0.7409784, -2.539344, 1, 0.454902, 0, 1,
-1.370509, 0.640544, -0.9091343, 1, 0.4627451, 0, 1,
-1.365169, 0.2191006, -2.564386, 1, 0.4666667, 0, 1,
-1.361318, -0.9703339, -1.640652, 1, 0.4745098, 0, 1,
-1.356446, 0.2174497, -0.9016047, 1, 0.4784314, 0, 1,
-1.352879, 1.177181, -0.5630211, 1, 0.4862745, 0, 1,
-1.346822, 0.1113836, -0.8054118, 1, 0.4901961, 0, 1,
-1.339283, 0.6169435, -1.082569, 1, 0.4980392, 0, 1,
-1.334226, -1.265725, -0.8316383, 1, 0.5058824, 0, 1,
-1.329923, -1.125634, -0.8085738, 1, 0.509804, 0, 1,
-1.320686, -0.4155756, -2.170185, 1, 0.5176471, 0, 1,
-1.30829, 0.5635422, -0.235464, 1, 0.5215687, 0, 1,
-1.307966, -0.9546787, -1.914411, 1, 0.5294118, 0, 1,
-1.294065, -1.718942, -1.152232, 1, 0.5333334, 0, 1,
-1.293945, 0.2651561, -2.11893, 1, 0.5411765, 0, 1,
-1.283198, 0.003641238, -1.042264, 1, 0.5450981, 0, 1,
-1.278754, -1.924908, -2.81068, 1, 0.5529412, 0, 1,
-1.252243, -0.2356809, -1.850201, 1, 0.5568628, 0, 1,
-1.243583, -0.8437778, -1.12148, 1, 0.5647059, 0, 1,
-1.238581, 0.2981801, -1.54256, 1, 0.5686275, 0, 1,
-1.237882, 0.3681091, -0.2673939, 1, 0.5764706, 0, 1,
-1.225453, -0.09392564, -0.6725869, 1, 0.5803922, 0, 1,
-1.220969, 1.428763, -0.6349871, 1, 0.5882353, 0, 1,
-1.209378, -0.7520651, -1.871122, 1, 0.5921569, 0, 1,
-1.204546, 1.364806, -0.8624623, 1, 0.6, 0, 1,
-1.200179, 1.116812, -2.336862, 1, 0.6078432, 0, 1,
-1.193155, 0.2049789, -3.022038, 1, 0.6117647, 0, 1,
-1.1927, -2.281774, -2.573335, 1, 0.6196079, 0, 1,
-1.183496, 0.1804192, -1.6133, 1, 0.6235294, 0, 1,
-1.178619, 0.8810041, -0.2406362, 1, 0.6313726, 0, 1,
-1.178173, 0.8403998, 0.4652539, 1, 0.6352941, 0, 1,
-1.160166, -1.859253, -2.203709, 1, 0.6431373, 0, 1,
-1.156594, 0.4155349, -0.8866225, 1, 0.6470588, 0, 1,
-1.154044, -0.1762132, -0.7809392, 1, 0.654902, 0, 1,
-1.135614, -0.5464394, -2.485117, 1, 0.6588235, 0, 1,
-1.134297, 0.3370129, -1.374022, 1, 0.6666667, 0, 1,
-1.134174, 1.1418, 0.7079815, 1, 0.6705883, 0, 1,
-1.133806, 1.256871, 0.1525225, 1, 0.6784314, 0, 1,
-1.129085, -1.20433, -2.779451, 1, 0.682353, 0, 1,
-1.127526, 0.2998651, -1.963871, 1, 0.6901961, 0, 1,
-1.125098, 0.6389833, -0.8246711, 1, 0.6941177, 0, 1,
-1.123673, -0.7170667, -3.704227, 1, 0.7019608, 0, 1,
-1.113848, -0.8286348, -1.698234, 1, 0.7098039, 0, 1,
-1.112086, 1.912041, -1.236731, 1, 0.7137255, 0, 1,
-1.103689, -1.972627, -1.274453, 1, 0.7215686, 0, 1,
-1.102259, 0.5379021, 0.4420981, 1, 0.7254902, 0, 1,
-1.101688, -1.800965, -1.792863, 1, 0.7333333, 0, 1,
-1.099681, 0.3323099, -0.09910347, 1, 0.7372549, 0, 1,
-1.098222, 1.120874, -0.5841405, 1, 0.7450981, 0, 1,
-1.09808, 2.467342, -0.3085674, 1, 0.7490196, 0, 1,
-1.085625, -0.2308464, -2.886219, 1, 0.7568628, 0, 1,
-1.080342, -2.860796, -0.558189, 1, 0.7607843, 0, 1,
-1.078887, -0.6270385, -1.114003, 1, 0.7686275, 0, 1,
-1.077659, -1.376277, -3.569371, 1, 0.772549, 0, 1,
-1.076615, -0.842225, -1.673551, 1, 0.7803922, 0, 1,
-1.075157, -0.6325599, -2.492427, 1, 0.7843137, 0, 1,
-1.073329, 0.532913, -0.6803555, 1, 0.7921569, 0, 1,
-1.068768, -0.6587556, -0.3284718, 1, 0.7960784, 0, 1,
-1.067587, 0.5140194, -0.7169964, 1, 0.8039216, 0, 1,
-1.067192, 0.03733724, -2.166137, 1, 0.8117647, 0, 1,
-1.065158, 0.4871586, -1.710402, 1, 0.8156863, 0, 1,
-1.060356, 1.973532, -1.082432, 1, 0.8235294, 0, 1,
-1.051785, 0.902706, 0.2268823, 1, 0.827451, 0, 1,
-1.028629, -0.7169514, -1.271017, 1, 0.8352941, 0, 1,
-1.028107, -2.330725, -2.228832, 1, 0.8392157, 0, 1,
-1.025771, -1.701426, -1.12048, 1, 0.8470588, 0, 1,
-1.020686, 0.04715562, -0.8171695, 1, 0.8509804, 0, 1,
-1.02043, 0.7500434, -1.319946, 1, 0.8588235, 0, 1,
-1.017678, -0.8003334, -2.810168, 1, 0.8627451, 0, 1,
-1.015023, 0.1774408, -1.363719, 1, 0.8705882, 0, 1,
-1.008616, 1.404672, -1.162513, 1, 0.8745098, 0, 1,
-0.9950203, -1.080321, -4.384871, 1, 0.8823529, 0, 1,
-0.991717, 0.8764022, -2.006424, 1, 0.8862745, 0, 1,
-0.9897765, -0.6657139, -1.726444, 1, 0.8941177, 0, 1,
-0.9858777, -1.428923, -0.7457318, 1, 0.8980392, 0, 1,
-0.9758184, 0.1961827, -0.2768391, 1, 0.9058824, 0, 1,
-0.9727322, 0.02357394, -1.833028, 1, 0.9137255, 0, 1,
-0.9679461, -1.439345, -0.6804291, 1, 0.9176471, 0, 1,
-0.9667912, 0.3943139, -0.5887608, 1, 0.9254902, 0, 1,
-0.9619777, -0.3736284, -1.797996, 1, 0.9294118, 0, 1,
-0.9608438, 0.6160613, -1.522013, 1, 0.9372549, 0, 1,
-0.9602921, -0.883403, -2.43528, 1, 0.9411765, 0, 1,
-0.9551402, -1.488513, -2.352798, 1, 0.9490196, 0, 1,
-0.9445879, 0.7494185, -1.822974, 1, 0.9529412, 0, 1,
-0.9439558, 1.075846, -2.145235, 1, 0.9607843, 0, 1,
-0.9362606, -0.6468747, -3.179085, 1, 0.9647059, 0, 1,
-0.9326354, 0.5023823, -2.609884, 1, 0.972549, 0, 1,
-0.9243443, -0.3397231, -1.476911, 1, 0.9764706, 0, 1,
-0.9226314, -0.01978693, -1.526037, 1, 0.9843137, 0, 1,
-0.9224459, 0.4804435, -0.6374911, 1, 0.9882353, 0, 1,
-0.915148, 0.1975334, -1.746472, 1, 0.9960784, 0, 1,
-0.9116534, 1.521302, -1.179854, 0.9960784, 1, 0, 1,
-0.9017942, -0.7751931, -2.084611, 0.9921569, 1, 0, 1,
-0.9016383, -0.3868468, -3.39105, 0.9843137, 1, 0, 1,
-0.8931925, 1.682403, -3.51439, 0.9803922, 1, 0, 1,
-0.8931866, 0.1668873, -1.35552, 0.972549, 1, 0, 1,
-0.8841066, -0.7173797, -3.029073, 0.9686275, 1, 0, 1,
-0.882891, -0.1194681, -1.097101, 0.9607843, 1, 0, 1,
-0.8825243, 1.606029, -1.672187, 0.9568627, 1, 0, 1,
-0.8820425, 0.7825865, 0.2567775, 0.9490196, 1, 0, 1,
-0.8814776, -1.777029, -2.602182, 0.945098, 1, 0, 1,
-0.8695003, -0.3140674, -1.202191, 0.9372549, 1, 0, 1,
-0.8648602, 0.3105837, -1.145502, 0.9333333, 1, 0, 1,
-0.8644517, -1.094489, -3.880075, 0.9254902, 1, 0, 1,
-0.8628986, -0.5331873, -1.579643, 0.9215686, 1, 0, 1,
-0.8585638, 0.4903567, -1.221519, 0.9137255, 1, 0, 1,
-0.857675, -1.19702, -2.810719, 0.9098039, 1, 0, 1,
-0.8561041, -0.1872135, -2.01144, 0.9019608, 1, 0, 1,
-0.8547441, -0.4567053, -1.729076, 0.8941177, 1, 0, 1,
-0.8494782, -1.054158, -1.647029, 0.8901961, 1, 0, 1,
-0.8487595, -0.1241617, -1.594763, 0.8823529, 1, 0, 1,
-0.8473063, 0.5695156, 0.9436638, 0.8784314, 1, 0, 1,
-0.8464023, 0.5668788, -0.9876527, 0.8705882, 1, 0, 1,
-0.8440713, 0.2173626, -0.6540492, 0.8666667, 1, 0, 1,
-0.8434842, -0.6684486, -2.176575, 0.8588235, 1, 0, 1,
-0.8391426, -0.1423209, -1.504389, 0.854902, 1, 0, 1,
-0.832119, -0.2454965, -2.444997, 0.8470588, 1, 0, 1,
-0.8305473, -0.1727566, -2.543874, 0.8431373, 1, 0, 1,
-0.8260896, 0.7308812, -1.217886, 0.8352941, 1, 0, 1,
-0.8257911, -0.275698, -1.955665, 0.8313726, 1, 0, 1,
-0.8218973, 0.8612732, 0.9252358, 0.8235294, 1, 0, 1,
-0.8218958, -0.0199867, -2.587876, 0.8196079, 1, 0, 1,
-0.8210802, 2.974936, -1.052522, 0.8117647, 1, 0, 1,
-0.8134977, -0.8085592, -2.421038, 0.8078431, 1, 0, 1,
-0.8109677, -0.9907095, -1.596864, 0.8, 1, 0, 1,
-0.8088791, -0.3929563, -2.920852, 0.7921569, 1, 0, 1,
-0.8050379, -1.264469, -1.767457, 0.7882353, 1, 0, 1,
-0.8040299, -1.05917, -2.42619, 0.7803922, 1, 0, 1,
-0.8037239, -1.30991, -2.210821, 0.7764706, 1, 0, 1,
-0.8037071, -2.009399, -1.883968, 0.7686275, 1, 0, 1,
-0.7972715, -0.6472885, -2.2371, 0.7647059, 1, 0, 1,
-0.7966488, -0.1915586, -2.208026, 0.7568628, 1, 0, 1,
-0.7944738, -0.4255986, -1.144002, 0.7529412, 1, 0, 1,
-0.7872539, -0.4791744, -4.174034, 0.7450981, 1, 0, 1,
-0.7863467, -0.5336599, -1.458494, 0.7411765, 1, 0, 1,
-0.7823531, -1.175072, -2.759162, 0.7333333, 1, 0, 1,
-0.7797964, -0.496936, -1.731501, 0.7294118, 1, 0, 1,
-0.7786072, -0.8447332, -1.71322, 0.7215686, 1, 0, 1,
-0.7749897, -0.2237612, -2.00566, 0.7176471, 1, 0, 1,
-0.7729743, -1.756908, -3.533013, 0.7098039, 1, 0, 1,
-0.7726409, -0.1553446, -2.838008, 0.7058824, 1, 0, 1,
-0.7638376, 0.3723882, -1.181111, 0.6980392, 1, 0, 1,
-0.7624568, 0.4319149, -1.646536, 0.6901961, 1, 0, 1,
-0.75641, 2.976687, 0.6500387, 0.6862745, 1, 0, 1,
-0.7509482, -1.38492, -1.685, 0.6784314, 1, 0, 1,
-0.7475767, -0.5730551, -1.508793, 0.6745098, 1, 0, 1,
-0.7470449, 0.2095511, -1.616794, 0.6666667, 1, 0, 1,
-0.7441217, -0.3311159, -0.6133837, 0.6627451, 1, 0, 1,
-0.7437291, -0.04922216, -2.371188, 0.654902, 1, 0, 1,
-0.7393804, 0.324347, -1.326355, 0.6509804, 1, 0, 1,
-0.7387887, 0.3423538, -0.07408039, 0.6431373, 1, 0, 1,
-0.7267609, -0.3554887, -1.262425, 0.6392157, 1, 0, 1,
-0.7220323, 0.5071636, -2.605194, 0.6313726, 1, 0, 1,
-0.715964, -0.7393336, -3.87057, 0.627451, 1, 0, 1,
-0.7077334, 1.356003, 0.5154253, 0.6196079, 1, 0, 1,
-0.7073341, 0.2521367, -2.579287, 0.6156863, 1, 0, 1,
-0.705946, -0.6222259, -0.9037698, 0.6078432, 1, 0, 1,
-0.7025006, 2.668108, 0.7667846, 0.6039216, 1, 0, 1,
-0.7015764, -1.165225, -1.065521, 0.5960785, 1, 0, 1,
-0.7000626, -0.282054, -1.344781, 0.5882353, 1, 0, 1,
-0.6957557, -1.373627, -1.867033, 0.5843138, 1, 0, 1,
-0.6901875, -0.4214659, -2.414428, 0.5764706, 1, 0, 1,
-0.6900821, 0.973695, -0.03718248, 0.572549, 1, 0, 1,
-0.6828986, 0.2919027, -1.701203, 0.5647059, 1, 0, 1,
-0.6828017, -1.666011, -3.382958, 0.5607843, 1, 0, 1,
-0.6808015, -0.1937724, -2.291467, 0.5529412, 1, 0, 1,
-0.6792783, -0.8420254, -4.305267, 0.5490196, 1, 0, 1,
-0.6760469, 0.736712, -0.5710534, 0.5411765, 1, 0, 1,
-0.6732076, -0.2736983, -3.198633, 0.5372549, 1, 0, 1,
-0.6655148, 0.662026, -0.3688549, 0.5294118, 1, 0, 1,
-0.6566334, 0.3110897, -0.8717264, 0.5254902, 1, 0, 1,
-0.6538103, 1.04703, -0.727682, 0.5176471, 1, 0, 1,
-0.6531498, -0.7760724, -2.962199, 0.5137255, 1, 0, 1,
-0.6476908, 0.5483406, -0.393907, 0.5058824, 1, 0, 1,
-0.6378965, -0.2175934, -0.5027719, 0.5019608, 1, 0, 1,
-0.6366152, 0.3731469, -0.9138868, 0.4941176, 1, 0, 1,
-0.6275558, -1.164001, -2.682681, 0.4862745, 1, 0, 1,
-0.6269668, -0.361198, -3.03202, 0.4823529, 1, 0, 1,
-0.6269432, -0.4539071, -2.335493, 0.4745098, 1, 0, 1,
-0.6199468, -0.9206868, -3.250974, 0.4705882, 1, 0, 1,
-0.6190091, -1.29644, -2.939524, 0.4627451, 1, 0, 1,
-0.616015, -0.805804, -3.800606, 0.4588235, 1, 0, 1,
-0.6150338, -1.88756, -2.218538, 0.4509804, 1, 0, 1,
-0.6125568, 1.332452, 0.7236124, 0.4470588, 1, 0, 1,
-0.6105869, -1.47616, -3.477554, 0.4392157, 1, 0, 1,
-0.5979939, -0.3440053, -2.404892, 0.4352941, 1, 0, 1,
-0.5966045, -0.09755994, -0.7707603, 0.427451, 1, 0, 1,
-0.5941553, -0.4908335, -1.056819, 0.4235294, 1, 0, 1,
-0.593668, -1.392008, -2.488309, 0.4156863, 1, 0, 1,
-0.5892959, -0.2219829, -3.374743, 0.4117647, 1, 0, 1,
-0.5861727, 0.9938006, -0.3945008, 0.4039216, 1, 0, 1,
-0.5848905, 0.5702242, -0.6791623, 0.3960784, 1, 0, 1,
-0.5847595, -0.1665671, -2.938359, 0.3921569, 1, 0, 1,
-0.5821239, 1.002718, -0.5785372, 0.3843137, 1, 0, 1,
-0.5813992, -0.3931894, -3.734981, 0.3803922, 1, 0, 1,
-0.5811931, -1.169138, -4.347823, 0.372549, 1, 0, 1,
-0.5767392, 0.1340215, -0.3639778, 0.3686275, 1, 0, 1,
-0.5764985, 0.4870689, 0.5765231, 0.3607843, 1, 0, 1,
-0.5729852, 0.7541956, -1.580145, 0.3568628, 1, 0, 1,
-0.5715718, -1.420741, -5.490106, 0.3490196, 1, 0, 1,
-0.5698699, 1.435045, 0.7467487, 0.345098, 1, 0, 1,
-0.5695032, -2.155328, -1.726095, 0.3372549, 1, 0, 1,
-0.5677847, 0.3312753, -0.884252, 0.3333333, 1, 0, 1,
-0.5664963, -0.7235312, -4.444563, 0.3254902, 1, 0, 1,
-0.5626307, -0.01430364, -1.432338, 0.3215686, 1, 0, 1,
-0.5571706, 1.296278, 0.1648077, 0.3137255, 1, 0, 1,
-0.5571568, -0.932466, -2.562692, 0.3098039, 1, 0, 1,
-0.5525953, 0.1129194, -2.256947, 0.3019608, 1, 0, 1,
-0.549805, -1.137333, -1.810679, 0.2941177, 1, 0, 1,
-0.5480945, -1.506755, -3.73413, 0.2901961, 1, 0, 1,
-0.5470773, 0.2794917, 0.6085657, 0.282353, 1, 0, 1,
-0.5465575, 0.2866075, -1.8842, 0.2784314, 1, 0, 1,
-0.5340902, -0.3415332, -2.841804, 0.2705882, 1, 0, 1,
-0.5323364, 0.152482, -2.298755, 0.2666667, 1, 0, 1,
-0.5322618, 0.143028, -1.014873, 0.2588235, 1, 0, 1,
-0.5291029, -1.942679, -4.590895, 0.254902, 1, 0, 1,
-0.5267423, -0.6357243, -0.5401516, 0.2470588, 1, 0, 1,
-0.5251835, 0.6861976, 0.006446546, 0.2431373, 1, 0, 1,
-0.5242093, -0.2848057, -1.459264, 0.2352941, 1, 0, 1,
-0.5229061, 2.345406, -1.004804, 0.2313726, 1, 0, 1,
-0.5226963, 0.4748012, -0.920118, 0.2235294, 1, 0, 1,
-0.5206647, 0.06530232, -1.333649, 0.2196078, 1, 0, 1,
-0.5202855, 1.906262, 0.6698472, 0.2117647, 1, 0, 1,
-0.5126021, -2.251871, -3.887762, 0.2078431, 1, 0, 1,
-0.5072085, 1.888304, -2.389757, 0.2, 1, 0, 1,
-0.5051986, -1.17733, -2.778648, 0.1921569, 1, 0, 1,
-0.5037928, -1.153821, -2.68764, 0.1882353, 1, 0, 1,
-0.4991683, -0.1177056, -1.62333, 0.1803922, 1, 0, 1,
-0.4975934, -0.6293692, -0.9010452, 0.1764706, 1, 0, 1,
-0.4933022, -0.8117796, -2.24004, 0.1686275, 1, 0, 1,
-0.4887666, 0.6294696, -0.243718, 0.1647059, 1, 0, 1,
-0.4885727, 0.3911684, -1.804815, 0.1568628, 1, 0, 1,
-0.4804493, -0.05299754, -1.177372, 0.1529412, 1, 0, 1,
-0.4787943, 0.3355584, -0.8888514, 0.145098, 1, 0, 1,
-0.4738172, -1.266577, -1.39304, 0.1411765, 1, 0, 1,
-0.4702511, -0.03026883, -0.9288599, 0.1333333, 1, 0, 1,
-0.4683909, 1.594715, -0.3915847, 0.1294118, 1, 0, 1,
-0.4665906, -1.118292, -2.942449, 0.1215686, 1, 0, 1,
-0.4660528, 0.5781161, -0.3288309, 0.1176471, 1, 0, 1,
-0.4655675, -0.4042732, -1.609596, 0.1098039, 1, 0, 1,
-0.464273, 0.9143251, -1.322947, 0.1058824, 1, 0, 1,
-0.4640521, 0.4867593, -1.700027, 0.09803922, 1, 0, 1,
-0.4605404, 0.1176776, -1.913339, 0.09019608, 1, 0, 1,
-0.4571592, -1.723783, -2.322893, 0.08627451, 1, 0, 1,
-0.4550759, -0.6298075, -3.419499, 0.07843138, 1, 0, 1,
-0.4538286, -0.5695841, -2.243154, 0.07450981, 1, 0, 1,
-0.4498122, -0.6648922, -3.727738, 0.06666667, 1, 0, 1,
-0.448432, -0.7155781, -1.857159, 0.0627451, 1, 0, 1,
-0.4450205, 0.5041315, -1.447996, 0.05490196, 1, 0, 1,
-0.4440936, -0.002228691, -1.435321, 0.05098039, 1, 0, 1,
-0.4440262, 0.470993, 0.6270916, 0.04313726, 1, 0, 1,
-0.4440036, 1.532382, -0.6780636, 0.03921569, 1, 0, 1,
-0.4418488, -0.6125113, -3.348579, 0.03137255, 1, 0, 1,
-0.4396056, -0.2296768, -2.237371, 0.02745098, 1, 0, 1,
-0.4378681, -1.108962, -2.532071, 0.01960784, 1, 0, 1,
-0.4286839, -1.442275, -2.575276, 0.01568628, 1, 0, 1,
-0.4254035, -0.5144342, -1.993998, 0.007843138, 1, 0, 1,
-0.4209453, -0.3101387, -1.559788, 0.003921569, 1, 0, 1,
-0.4186348, -0.5724252, -2.958694, 0, 1, 0.003921569, 1,
-0.4185858, -0.7055855, -2.880728, 0, 1, 0.01176471, 1,
-0.4176052, 1.143543, -1.183775, 0, 1, 0.01568628, 1,
-0.4130434, -0.3960269, -1.499862, 0, 1, 0.02352941, 1,
-0.4127311, -1.52729, -2.908006, 0, 1, 0.02745098, 1,
-0.4102465, -0.8248394, -5.270662, 0, 1, 0.03529412, 1,
-0.4089962, -1.143634, -3.456634, 0, 1, 0.03921569, 1,
-0.4083968, -1.360788, -1.986135, 0, 1, 0.04705882, 1,
-0.3989062, -0.325882, -1.597726, 0, 1, 0.05098039, 1,
-0.3975982, -0.1853576, -1.809081, 0, 1, 0.05882353, 1,
-0.3925631, 0.2499828, -0.1621366, 0, 1, 0.0627451, 1,
-0.3873329, 0.9137115, 0.1687482, 0, 1, 0.07058824, 1,
-0.3872893, -0.7257429, 0.002876397, 0, 1, 0.07450981, 1,
-0.3799897, 0.7603386, -0.6419776, 0, 1, 0.08235294, 1,
-0.3782061, 0.3950648, -0.3248315, 0, 1, 0.08627451, 1,
-0.3752038, -1.379184, -2.010593, 0, 1, 0.09411765, 1,
-0.3731176, 2.296964, 0.9131314, 0, 1, 0.1019608, 1,
-0.3704243, -1.112385, -2.548694, 0, 1, 0.1058824, 1,
-0.3690055, -0.9818915, -1.99662, 0, 1, 0.1137255, 1,
-0.3673403, 2.193543, 2.058825, 0, 1, 0.1176471, 1,
-0.3661443, 0.5824843, 0.4300035, 0, 1, 0.1254902, 1,
-0.3657482, 1.725148, 0.4119286, 0, 1, 0.1294118, 1,
-0.364477, -1.327299, -3.403215, 0, 1, 0.1372549, 1,
-0.3624444, 1.160168, -0.9059933, 0, 1, 0.1411765, 1,
-0.3612378, -0.8259721, -2.812407, 0, 1, 0.1490196, 1,
-0.3603843, -1.026536, -0.9680106, 0, 1, 0.1529412, 1,
-0.3592393, -0.8877425, -2.926462, 0, 1, 0.1607843, 1,
-0.354339, -0.02979722, -1.128772, 0, 1, 0.1647059, 1,
-0.3427381, 0.2574092, -0.8877568, 0, 1, 0.172549, 1,
-0.3410952, 1.272448, 0.3274982, 0, 1, 0.1764706, 1,
-0.3341323, 0.3085445, -0.573836, 0, 1, 0.1843137, 1,
-0.3317316, -0.3071466, -1.498241, 0, 1, 0.1882353, 1,
-0.331493, 0.4024678, -1.127727, 0, 1, 0.1960784, 1,
-0.3287959, 0.6043166, -0.8061044, 0, 1, 0.2039216, 1,
-0.328731, -0.1456937, -2.778644, 0, 1, 0.2078431, 1,
-0.3286786, 1.229617, 1.139043, 0, 1, 0.2156863, 1,
-0.3267199, -0.1972229, -2.849186, 0, 1, 0.2196078, 1,
-0.3249704, 1.306655, -1.821623, 0, 1, 0.227451, 1,
-0.3240101, 1.248101, -0.8374087, 0, 1, 0.2313726, 1,
-0.3235811, 0.3259692, -1.806735, 0, 1, 0.2392157, 1,
-0.3127967, 0.154166, -0.8822128, 0, 1, 0.2431373, 1,
-0.3124524, -1.308521, -2.888892, 0, 1, 0.2509804, 1,
-0.3115987, 1.469762, 0.9529634, 0, 1, 0.254902, 1,
-0.3112119, 0.8744295, -1.36474, 0, 1, 0.2627451, 1,
-0.3069778, -0.07848544, -3.232995, 0, 1, 0.2666667, 1,
-0.3067195, -1.736021, -2.924237, 0, 1, 0.2745098, 1,
-0.3043663, 0.3739341, 1.18292, 0, 1, 0.2784314, 1,
-0.3043086, -0.6874944, -1.7669, 0, 1, 0.2862745, 1,
-0.3036092, -0.03695398, -2.351051, 0, 1, 0.2901961, 1,
-0.3013479, -0.04973735, -2.377718, 0, 1, 0.2980392, 1,
-0.2967017, 1.966004, -1.210933, 0, 1, 0.3058824, 1,
-0.2952631, 0.8775063, 0.3897852, 0, 1, 0.3098039, 1,
-0.294884, -0.7426946, -1.167581, 0, 1, 0.3176471, 1,
-0.2944893, -1.927361, -2.960742, 0, 1, 0.3215686, 1,
-0.29224, 0.4235876, 0.4756234, 0, 1, 0.3294118, 1,
-0.290935, -0.8057218, -3.457859, 0, 1, 0.3333333, 1,
-0.2893349, 0.4243196, -1.846889, 0, 1, 0.3411765, 1,
-0.2782372, -0.4240373, -3.364416, 0, 1, 0.345098, 1,
-0.2742603, -1.116149, -0.9123839, 0, 1, 0.3529412, 1,
-0.272586, -0.9987732, -4.719188, 0, 1, 0.3568628, 1,
-0.2720098, -1.277237, -1.40931, 0, 1, 0.3647059, 1,
-0.2698477, -0.26416, -3.706961, 0, 1, 0.3686275, 1,
-0.267024, -0.9021059, -1.941078, 0, 1, 0.3764706, 1,
-0.2596477, 0.3146894, -0.4933696, 0, 1, 0.3803922, 1,
-0.257866, 2.380596, -0.53986, 0, 1, 0.3882353, 1,
-0.2576029, -0.9338524, -3.447681, 0, 1, 0.3921569, 1,
-0.2560889, -0.9012954, -2.54635, 0, 1, 0.4, 1,
-0.2555876, 0.1685235, -0.3141124, 0, 1, 0.4078431, 1,
-0.2513489, 0.1719492, -0.3235447, 0, 1, 0.4117647, 1,
-0.2509553, 0.1048908, -1.06472, 0, 1, 0.4196078, 1,
-0.2483427, -1.53057, -1.395679, 0, 1, 0.4235294, 1,
-0.248251, 0.1067787, -2.481387, 0, 1, 0.4313726, 1,
-0.2455593, 0.8208258, 0.01798028, 0, 1, 0.4352941, 1,
-0.2435579, -0.2923471, -2.83198, 0, 1, 0.4431373, 1,
-0.2427036, -0.6119137, -4.217938, 0, 1, 0.4470588, 1,
-0.2416491, -0.5586702, -5.308306, 0, 1, 0.454902, 1,
-0.2409962, -0.332266, -4.245124, 0, 1, 0.4588235, 1,
-0.2409454, 0.6437578, -0.9610716, 0, 1, 0.4666667, 1,
-0.2404184, -0.3685284, -1.157917, 0, 1, 0.4705882, 1,
-0.2290616, -0.283974, -1.820161, 0, 1, 0.4784314, 1,
-0.228916, -0.463313, -3.63424, 0, 1, 0.4823529, 1,
-0.225806, -1.18371, -3.731928, 0, 1, 0.4901961, 1,
-0.2256525, 2.324489, 2.055872, 0, 1, 0.4941176, 1,
-0.2252712, 2.015629, -0.9165526, 0, 1, 0.5019608, 1,
-0.222963, -0.9426818, -4.987238, 0, 1, 0.509804, 1,
-0.2218619, 0.4333984, -0.1615312, 0, 1, 0.5137255, 1,
-0.2197652, 0.5392324, -0.3416936, 0, 1, 0.5215687, 1,
-0.2194091, 0.6634502, 0.7230333, 0, 1, 0.5254902, 1,
-0.2184257, 0.1668056, 0.6271421, 0, 1, 0.5333334, 1,
-0.2104793, -1.034159, -2.58033, 0, 1, 0.5372549, 1,
-0.2069416, -1.105796, -4.414167, 0, 1, 0.5450981, 1,
-0.205774, 0.09938941, -2.091136, 0, 1, 0.5490196, 1,
-0.2014717, 0.8675429, -0.211149, 0, 1, 0.5568628, 1,
-0.2006808, -1.54644, -2.315172, 0, 1, 0.5607843, 1,
-0.1941111, -0.8456956, -4.7391, 0, 1, 0.5686275, 1,
-0.1909696, -0.2145997, -2.77632, 0, 1, 0.572549, 1,
-0.1909439, -0.4754333, -1.979688, 0, 1, 0.5803922, 1,
-0.1863165, 1.802877, 0.3646384, 0, 1, 0.5843138, 1,
-0.1856553, 0.7908, 1.61124, 0, 1, 0.5921569, 1,
-0.1844735, 1.392788, -1.248746, 0, 1, 0.5960785, 1,
-0.1840443, 0.4789407, -1.201338, 0, 1, 0.6039216, 1,
-0.1837706, 2.409707, 0.9300712, 0, 1, 0.6117647, 1,
-0.1835321, 0.5130036, -0.6210699, 0, 1, 0.6156863, 1,
-0.1793516, -0.7675742, -3.39132, 0, 1, 0.6235294, 1,
-0.1764699, -0.417634, -3.134776, 0, 1, 0.627451, 1,
-0.1702855, 0.2223504, -0.7243946, 0, 1, 0.6352941, 1,
-0.1687287, -0.07459537, -2.128081, 0, 1, 0.6392157, 1,
-0.1666885, -0.7911684, -5.177081, 0, 1, 0.6470588, 1,
-0.1644626, -0.332325, -0.7698521, 0, 1, 0.6509804, 1,
-0.1635614, -1.205811, -3.240521, 0, 1, 0.6588235, 1,
-0.1628564, -1.022588, -3.577955, 0, 1, 0.6627451, 1,
-0.1573278, -0.7214802, -5.001587, 0, 1, 0.6705883, 1,
-0.1567016, 1.720175, 1.398884, 0, 1, 0.6745098, 1,
-0.1556617, 0.6365875, 0.01888886, 0, 1, 0.682353, 1,
-0.1552731, -0.9628661, -3.211018, 0, 1, 0.6862745, 1,
-0.1534045, 0.0590127, -3.493314, 0, 1, 0.6941177, 1,
-0.1518508, 2.175461, -2.02031, 0, 1, 0.7019608, 1,
-0.1501022, -0.2642362, -1.879555, 0, 1, 0.7058824, 1,
-0.1489232, 1.701341, -1.433938, 0, 1, 0.7137255, 1,
-0.1474329, -0.5226248, -4.26151, 0, 1, 0.7176471, 1,
-0.1466602, -0.1367072, -2.240521, 0, 1, 0.7254902, 1,
-0.1460334, 0.6095885, -0.1949215, 0, 1, 0.7294118, 1,
-0.1447161, -1.424014, -1.575389, 0, 1, 0.7372549, 1,
-0.1354931, -0.8592602, -1.899253, 0, 1, 0.7411765, 1,
-0.135308, 2.933251, -0.5827823, 0, 1, 0.7490196, 1,
-0.1329777, 0.9596338, 0.2782371, 0, 1, 0.7529412, 1,
-0.132725, -0.2141961, -1.925797, 0, 1, 0.7607843, 1,
-0.1320536, 0.4007103, 0.01376097, 0, 1, 0.7647059, 1,
-0.1302119, -0.4144808, -3.737607, 0, 1, 0.772549, 1,
-0.1260953, 0.9931411, 0.8294955, 0, 1, 0.7764706, 1,
-0.1253417, -0.3922743, -2.12795, 0, 1, 0.7843137, 1,
-0.1185617, 1.846063, 0.1349701, 0, 1, 0.7882353, 1,
-0.1174166, -0.6273569, -3.505123, 0, 1, 0.7960784, 1,
-0.1173114, 1.651333, 0.344409, 0, 1, 0.8039216, 1,
-0.1136625, -1.023257, -3.214761, 0, 1, 0.8078431, 1,
-0.1122226, 1.575055, -1.48209, 0, 1, 0.8156863, 1,
-0.1102299, -1.478162, -2.440738, 0, 1, 0.8196079, 1,
-0.1079735, -0.3783301, -3.069872, 0, 1, 0.827451, 1,
-0.107126, 1.238793, -0.9273445, 0, 1, 0.8313726, 1,
-0.1032102, 0.1785041, -0.4105838, 0, 1, 0.8392157, 1,
-0.09825102, 0.8033905, -1.335854, 0, 1, 0.8431373, 1,
-0.0961297, 0.5089771, 0.2839111, 0, 1, 0.8509804, 1,
-0.09040996, -0.2612524, -2.691603, 0, 1, 0.854902, 1,
-0.08638208, 0.1355395, -0.8308343, 0, 1, 0.8627451, 1,
-0.08325163, 0.826444, -1.945152, 0, 1, 0.8666667, 1,
-0.08322039, -0.552054, -3.601171, 0, 1, 0.8745098, 1,
-0.08130673, 0.167682, -0.9061847, 0, 1, 0.8784314, 1,
-0.07999972, 0.7332494, 0.3716091, 0, 1, 0.8862745, 1,
-0.07897948, 0.4943464, 0.8303191, 0, 1, 0.8901961, 1,
-0.06722077, -0.8175498, -4.049929, 0, 1, 0.8980392, 1,
-0.06614085, 1.037393, 0.6928333, 0, 1, 0.9058824, 1,
-0.06530435, -1.223898, -2.590551, 0, 1, 0.9098039, 1,
-0.06410209, -0.3147812, -2.027478, 0, 1, 0.9176471, 1,
-0.06279771, -0.853483, -2.052628, 0, 1, 0.9215686, 1,
-0.06098394, 1.383034, -1.515028, 0, 1, 0.9294118, 1,
-0.06095061, 0.4020837, 0.3028904, 0, 1, 0.9333333, 1,
-0.05964829, -1.573054, -3.260257, 0, 1, 0.9411765, 1,
-0.05800214, 0.3411603, -1.025464, 0, 1, 0.945098, 1,
-0.05742259, -0.7640446, -2.327784, 0, 1, 0.9529412, 1,
-0.05348037, 0.4617402, -0.6497533, 0, 1, 0.9568627, 1,
-0.05338081, -0.8203232, -3.143115, 0, 1, 0.9647059, 1,
-0.04745136, 0.4962568, 0.04701325, 0, 1, 0.9686275, 1,
-0.04444559, -1.87961, -2.4801, 0, 1, 0.9764706, 1,
-0.04330216, -0.4317103, -2.993314, 0, 1, 0.9803922, 1,
-0.0390675, 0.435954, 1.163939, 0, 1, 0.9882353, 1,
-0.02976127, -1.772518, -3.417982, 0, 1, 0.9921569, 1,
-0.028393, -0.6925548, -2.371942, 0, 1, 1, 1,
-0.02808333, -1.437403, -4.247069, 0, 0.9921569, 1, 1,
-0.02793778, -1.797323, -3.870312, 0, 0.9882353, 1, 1,
-0.01537766, -1.113679, -2.073546, 0, 0.9803922, 1, 1,
-0.01150253, 1.123158, 1.628192, 0, 0.9764706, 1, 1,
-0.009914959, 0.289892, 0.4953452, 0, 0.9686275, 1, 1,
-0.009737176, -0.882832, -2.943821, 0, 0.9647059, 1, 1,
-0.008219263, -0.7086347, -1.828893, 0, 0.9568627, 1, 1,
-0.002845067, 0.4005963, 0.5106786, 0, 0.9529412, 1, 1,
-0.0003441343, 1.321153, 0.2631699, 0, 0.945098, 1, 1,
0.0008903194, -1.685677, 2.25625, 0, 0.9411765, 1, 1,
0.004519948, -0.4888791, 3.248185, 0, 0.9333333, 1, 1,
0.007245687, 1.165223, 0.9727185, 0, 0.9294118, 1, 1,
0.007267836, 0.5269192, 0.1584288, 0, 0.9215686, 1, 1,
0.008021984, 0.216911, -0.7974943, 0, 0.9176471, 1, 1,
0.009345766, -0.5725161, 3.709374, 0, 0.9098039, 1, 1,
0.01272437, -0.3749222, 3.501688, 0, 0.9058824, 1, 1,
0.01569931, -2.31206, 4.238083, 0, 0.8980392, 1, 1,
0.01758266, 0.4668627, 1.34478, 0, 0.8901961, 1, 1,
0.02270149, -1.477391, 3.691724, 0, 0.8862745, 1, 1,
0.02489019, -0.6070652, 3.32569, 0, 0.8784314, 1, 1,
0.02687558, 0.05878665, -0.7305045, 0, 0.8745098, 1, 1,
0.02767625, 0.6229348, -1.32467, 0, 0.8666667, 1, 1,
0.02791917, -1.322956, 3.082225, 0, 0.8627451, 1, 1,
0.0314201, -0.003077359, 0.7196832, 0, 0.854902, 1, 1,
0.03438433, 0.08272029, 0.729084, 0, 0.8509804, 1, 1,
0.03709939, 1.64165, -1.644722, 0, 0.8431373, 1, 1,
0.03796053, 0.2575282, 1.234779, 0, 0.8392157, 1, 1,
0.04543503, -1.152539, 4.441252, 0, 0.8313726, 1, 1,
0.04668675, 0.7933977, 0.3839725, 0, 0.827451, 1, 1,
0.04679801, -1.668542, 1.224259, 0, 0.8196079, 1, 1,
0.04720036, -0.2248251, 4.712406, 0, 0.8156863, 1, 1,
0.05196678, 0.189598, 0.09096359, 0, 0.8078431, 1, 1,
0.05252394, 0.500794, 1.135337, 0, 0.8039216, 1, 1,
0.05620907, 0.3393757, -0.3866765, 0, 0.7960784, 1, 1,
0.05786653, 0.7571263, 0.3176927, 0, 0.7882353, 1, 1,
0.05919244, 1.166486, 0.7453772, 0, 0.7843137, 1, 1,
0.0635676, 0.2074417, 1.146033, 0, 0.7764706, 1, 1,
0.06572019, -1.19969, 3.400124, 0, 0.772549, 1, 1,
0.06614878, 0.6863907, -0.7022265, 0, 0.7647059, 1, 1,
0.06905279, 0.3806851, 0.3450166, 0, 0.7607843, 1, 1,
0.0748961, 2.73375, -1.008874, 0, 0.7529412, 1, 1,
0.079183, 1.089249, 0.5186399, 0, 0.7490196, 1, 1,
0.08187713, -0.2963817, 3.182903, 0, 0.7411765, 1, 1,
0.09025511, -0.8144709, 3.523079, 0, 0.7372549, 1, 1,
0.09390316, -0.01713702, 2.423849, 0, 0.7294118, 1, 1,
0.09769052, 0.2787212, -0.9951566, 0, 0.7254902, 1, 1,
0.09830324, -0.2621544, 1.768363, 0, 0.7176471, 1, 1,
0.09884918, 0.3885049, 0.4731855, 0, 0.7137255, 1, 1,
0.0993496, -0.056998, 1.442745, 0, 0.7058824, 1, 1,
0.1045237, -1.657391, 4.419691, 0, 0.6980392, 1, 1,
0.1081886, -0.872196, 3.270088, 0, 0.6941177, 1, 1,
0.1104195, -1.149572, 2.193645, 0, 0.6862745, 1, 1,
0.1121962, -1.033294, 2.919815, 0, 0.682353, 1, 1,
0.1124409, 1.490548, 0.9786094, 0, 0.6745098, 1, 1,
0.1159965, -0.1558476, 2.343616, 0, 0.6705883, 1, 1,
0.1199278, 0.0470677, -0.04932762, 0, 0.6627451, 1, 1,
0.1221829, -0.8086099, 3.54262, 0, 0.6588235, 1, 1,
0.12426, -1.641459, 3.56397, 0, 0.6509804, 1, 1,
0.1265111, -0.08058649, 1.537566, 0, 0.6470588, 1, 1,
0.1286404, 1.261522, 0.2412137, 0, 0.6392157, 1, 1,
0.1299836, 0.6791882, -0.2289848, 0, 0.6352941, 1, 1,
0.1318012, -0.09789757, 3.770716, 0, 0.627451, 1, 1,
0.1335989, -0.05136503, 1.843672, 0, 0.6235294, 1, 1,
0.1353538, -0.1248687, 2.221345, 0, 0.6156863, 1, 1,
0.1400503, 1.685591, -0.009239127, 0, 0.6117647, 1, 1,
0.1408436, -1.778849, 4.102194, 0, 0.6039216, 1, 1,
0.1435222, 0.1706989, 0.9461741, 0, 0.5960785, 1, 1,
0.1451121, -1.399128, 3.50872, 0, 0.5921569, 1, 1,
0.1481395, 0.1961275, 1.704558, 0, 0.5843138, 1, 1,
0.1498117, -0.1550151, 3.714434, 0, 0.5803922, 1, 1,
0.1509069, -1.614972, 4.265512, 0, 0.572549, 1, 1,
0.1553424, 0.09293293, 1.017058, 0, 0.5686275, 1, 1,
0.1569828, -0.5565701, 3.095231, 0, 0.5607843, 1, 1,
0.1575191, 0.2476472, 1.113371, 0, 0.5568628, 1, 1,
0.1600529, 0.3592283, -1.314436, 0, 0.5490196, 1, 1,
0.1665573, 0.5652069, 1.458154, 0, 0.5450981, 1, 1,
0.1693327, -1.641667, 4.203933, 0, 0.5372549, 1, 1,
0.1717352, 0.5069088, 0.6283479, 0, 0.5333334, 1, 1,
0.1724055, -0.283583, -0.7546031, 0, 0.5254902, 1, 1,
0.1738067, 0.6380817, 1.30406, 0, 0.5215687, 1, 1,
0.1739922, -0.9115209, 1.115602, 0, 0.5137255, 1, 1,
0.1817755, 1.766565, 0.3268771, 0, 0.509804, 1, 1,
0.1817809, 0.4678832, 0.02502957, 0, 0.5019608, 1, 1,
0.1857878, 0.4823076, 0.5090722, 0, 0.4941176, 1, 1,
0.1861401, 0.6953911, 1.686792, 0, 0.4901961, 1, 1,
0.1873748, -0.4072994, 2.148985, 0, 0.4823529, 1, 1,
0.1948168, 0.5200498, 1.895547, 0, 0.4784314, 1, 1,
0.2028948, 1.360366, 1.823299, 0, 0.4705882, 1, 1,
0.2030564, -0.7773379, 2.550067, 0, 0.4666667, 1, 1,
0.2099505, -2.168234, 1.85304, 0, 0.4588235, 1, 1,
0.2101309, -1.126647, 2.440434, 0, 0.454902, 1, 1,
0.2170153, 0.3920496, 2.414219, 0, 0.4470588, 1, 1,
0.2190305, 0.8945562, 1.302666, 0, 0.4431373, 1, 1,
0.2192285, 0.01258304, 1.574915, 0, 0.4352941, 1, 1,
0.2204954, 0.312202, 0.1776811, 0, 0.4313726, 1, 1,
0.2221737, 1.213606, 0.2766701, 0, 0.4235294, 1, 1,
0.2230317, 1.462098, -1.025058, 0, 0.4196078, 1, 1,
0.2266118, 0.1205079, 0.2865566, 0, 0.4117647, 1, 1,
0.2285626, 0.1747096, -1.594743, 0, 0.4078431, 1, 1,
0.2287181, -0.5527046, 4.265584, 0, 0.4, 1, 1,
0.2310546, -0.8424616, 1.223685, 0, 0.3921569, 1, 1,
0.234542, 0.0003147697, 1.315725, 0, 0.3882353, 1, 1,
0.2363928, -1.194019, 3.36053, 0, 0.3803922, 1, 1,
0.2378689, -2.328408, 1.55558, 0, 0.3764706, 1, 1,
0.2397197, 0.1424597, 0.9849999, 0, 0.3686275, 1, 1,
0.2397619, -0.0586242, 1.682754, 0, 0.3647059, 1, 1,
0.2405619, 0.1336304, -0.1621978, 0, 0.3568628, 1, 1,
0.2408749, 0.4177268, 2.018921, 0, 0.3529412, 1, 1,
0.2423534, 1.107165, 1.028506, 0, 0.345098, 1, 1,
0.2430993, 0.2537892, -0.9609264, 0, 0.3411765, 1, 1,
0.24353, 2.468295, -0.4720166, 0, 0.3333333, 1, 1,
0.247619, 0.5268448, 2.080244, 0, 0.3294118, 1, 1,
0.2487155, -0.02658912, 3.707191, 0, 0.3215686, 1, 1,
0.2498289, 0.03730691, 1.183675, 0, 0.3176471, 1, 1,
0.2501839, 0.4363456, -0.06844096, 0, 0.3098039, 1, 1,
0.2502736, -0.650206, 2.099913, 0, 0.3058824, 1, 1,
0.2516918, -0.05438225, 1.949692, 0, 0.2980392, 1, 1,
0.2533208, -1.828209, 3.420983, 0, 0.2901961, 1, 1,
0.2552448, 0.9326441, -0.4927468, 0, 0.2862745, 1, 1,
0.2558915, 0.4867523, 0.4270977, 0, 0.2784314, 1, 1,
0.2559972, 0.4025565, 1.765056, 0, 0.2745098, 1, 1,
0.256069, 1.009513, 0.8882452, 0, 0.2666667, 1, 1,
0.2571931, 2.349642, 0.3376887, 0, 0.2627451, 1, 1,
0.2629847, 0.4101902, 1.560884, 0, 0.254902, 1, 1,
0.2634975, 1.641417, 0.8009707, 0, 0.2509804, 1, 1,
0.2667812, 0.6403082, 2.235207, 0, 0.2431373, 1, 1,
0.2671149, 1.060976, -1.265712, 0, 0.2392157, 1, 1,
0.2683913, -0.2878428, 2.528588, 0, 0.2313726, 1, 1,
0.2736996, -1.629793, 3.637614, 0, 0.227451, 1, 1,
0.2765175, -0.7034398, 4.197257, 0, 0.2196078, 1, 1,
0.2777894, -1.989013, 3.725657, 0, 0.2156863, 1, 1,
0.2783709, -0.4657037, 4.134741, 0, 0.2078431, 1, 1,
0.2794573, 0.6393373, -0.7129055, 0, 0.2039216, 1, 1,
0.2842714, 1.124579, 0.02933816, 0, 0.1960784, 1, 1,
0.2866365, -0.6569403, 3.111141, 0, 0.1882353, 1, 1,
0.2935902, -0.2229917, 0.9258632, 0, 0.1843137, 1, 1,
0.2941528, -0.7848353, 1.892124, 0, 0.1764706, 1, 1,
0.2947986, -1.52649, 3.716036, 0, 0.172549, 1, 1,
0.3010006, -0.4796939, 2.137564, 0, 0.1647059, 1, 1,
0.3045112, -0.182631, 2.037781, 0, 0.1607843, 1, 1,
0.3071736, -1.285527, 3.525039, 0, 0.1529412, 1, 1,
0.3127456, 0.8678763, 1.521681, 0, 0.1490196, 1, 1,
0.3129419, -1.607107, 3.360744, 0, 0.1411765, 1, 1,
0.3144669, -0.7921713, 2.069044, 0, 0.1372549, 1, 1,
0.3144996, -1.265265, 5.324857, 0, 0.1294118, 1, 1,
0.3228621, 0.9905131, 1.763151, 0, 0.1254902, 1, 1,
0.3250682, -0.8008503, 2.527436, 0, 0.1176471, 1, 1,
0.3369323, 0.6801522, -1.364435, 0, 0.1137255, 1, 1,
0.3394339, -0.2610842, 2.379722, 0, 0.1058824, 1, 1,
0.3421507, -1.798955, 3.4008, 0, 0.09803922, 1, 1,
0.3430984, 0.170717, 1.145764, 0, 0.09411765, 1, 1,
0.344835, -1.086766, 2.570529, 0, 0.08627451, 1, 1,
0.3471445, 1.0337, 1.812292, 0, 0.08235294, 1, 1,
0.3585434, -0.9930321, 3.552864, 0, 0.07450981, 1, 1,
0.3646831, 0.01141977, 1.076194, 0, 0.07058824, 1, 1,
0.3677731, -0.621208, 1.829338, 0, 0.0627451, 1, 1,
0.3681646, 0.3799383, -0.01945349, 0, 0.05882353, 1, 1,
0.3695924, 0.7261937, 0.4616169, 0, 0.05098039, 1, 1,
0.3769314, -0.9452679, 2.671645, 0, 0.04705882, 1, 1,
0.3772486, 0.5576931, -0.2183365, 0, 0.03921569, 1, 1,
0.3839006, 1.115036, 0.119082, 0, 0.03529412, 1, 1,
0.3842348, -0.1751781, 1.619605, 0, 0.02745098, 1, 1,
0.3881621, 0.08996087, 0.4688016, 0, 0.02352941, 1, 1,
0.388816, 0.1117907, 0.722146, 0, 0.01568628, 1, 1,
0.3934387, 0.4362835, -0.2489975, 0, 0.01176471, 1, 1,
0.3945063, 1.113391, 0.530983, 0, 0.003921569, 1, 1,
0.3969308, -2.3221, 3.573163, 0.003921569, 0, 1, 1,
0.3970189, 0.9111559, -2.569591, 0.007843138, 0, 1, 1,
0.3980643, -1.51874, 4.891996, 0.01568628, 0, 1, 1,
0.3994538, -0.6633065, 2.909604, 0.01960784, 0, 1, 1,
0.4050917, 1.792035, -0.4681305, 0.02745098, 0, 1, 1,
0.4088523, -0.1864089, 1.102358, 0.03137255, 0, 1, 1,
0.4106096, -1.569094, 1.328389, 0.03921569, 0, 1, 1,
0.4113818, -0.6573638, 2.386448, 0.04313726, 0, 1, 1,
0.4128211, -0.8367541, 1.718176, 0.05098039, 0, 1, 1,
0.4135816, 1.02366, 0.1886504, 0.05490196, 0, 1, 1,
0.4167997, 0.9214371, 2.515669, 0.0627451, 0, 1, 1,
0.4191702, -0.02144098, 2.582489, 0.06666667, 0, 1, 1,
0.4196073, -0.5770475, 2.416136, 0.07450981, 0, 1, 1,
0.4240757, -0.04168822, 1.548472, 0.07843138, 0, 1, 1,
0.4265985, -0.1091986, 1.063112, 0.08627451, 0, 1, 1,
0.4310841, -0.4257497, 2.892637, 0.09019608, 0, 1, 1,
0.4371385, 0.2630191, 0.6697093, 0.09803922, 0, 1, 1,
0.4382672, -2.689129, 4.302003, 0.1058824, 0, 1, 1,
0.4388838, -1.25367, 3.60387, 0.1098039, 0, 1, 1,
0.4400388, -0.1676279, 3.493666, 0.1176471, 0, 1, 1,
0.4473749, 0.7348562, -0.2330091, 0.1215686, 0, 1, 1,
0.4496347, 0.03347677, 1.911423, 0.1294118, 0, 1, 1,
0.4544849, 1.160634, -0.1371319, 0.1333333, 0, 1, 1,
0.4611036, 0.3960938, 0.6108814, 0.1411765, 0, 1, 1,
0.4666199, -0.2254426, 3.733095, 0.145098, 0, 1, 1,
0.4666546, 1.686299, 2.220677, 0.1529412, 0, 1, 1,
0.4689575, -1.816816, 2.559865, 0.1568628, 0, 1, 1,
0.4694636, 0.5435817, -0.4089313, 0.1647059, 0, 1, 1,
0.4737194, 0.1716058, 0.979156, 0.1686275, 0, 1, 1,
0.47389, -0.2092711, 2.064434, 0.1764706, 0, 1, 1,
0.4751635, 1.482392, -0.8354436, 0.1803922, 0, 1, 1,
0.475261, -2.508059, 4.265598, 0.1882353, 0, 1, 1,
0.4817913, 0.1055165, 1.705904, 0.1921569, 0, 1, 1,
0.4867923, 0.6324446, 1.720147, 0.2, 0, 1, 1,
0.4923331, 1.058974, 0.7935831, 0.2078431, 0, 1, 1,
0.4959296, 0.7134233, 1.703347, 0.2117647, 0, 1, 1,
0.5021976, -1.062616, 3.077379, 0.2196078, 0, 1, 1,
0.5030084, 0.3485557, 0.8326424, 0.2235294, 0, 1, 1,
0.5031163, -0.2301014, 2.565976, 0.2313726, 0, 1, 1,
0.5031237, -0.07571077, 1.63694, 0.2352941, 0, 1, 1,
0.5059017, -2.248051, 3.557549, 0.2431373, 0, 1, 1,
0.507323, -0.5629808, 2.982645, 0.2470588, 0, 1, 1,
0.5118141, 1.151068, -0.2140251, 0.254902, 0, 1, 1,
0.5132136, -0.6749866, 2.450938, 0.2588235, 0, 1, 1,
0.5187055, -0.4391701, 4.09308, 0.2666667, 0, 1, 1,
0.5207334, -0.9047007, 1.099411, 0.2705882, 0, 1, 1,
0.523106, -0.6102079, 1.992673, 0.2784314, 0, 1, 1,
0.5249786, 1.778718, 1.088638, 0.282353, 0, 1, 1,
0.526738, -1.726457, 4.474545, 0.2901961, 0, 1, 1,
0.5269235, -0.7704549, 3.154164, 0.2941177, 0, 1, 1,
0.5409124, -0.4828001, 1.997021, 0.3019608, 0, 1, 1,
0.5417719, -1.197151, 2.846373, 0.3098039, 0, 1, 1,
0.5432537, -0.8994721, 1.548294, 0.3137255, 0, 1, 1,
0.5471532, 0.09804634, 0.7056859, 0.3215686, 0, 1, 1,
0.5554555, -0.4192415, 2.47565, 0.3254902, 0, 1, 1,
0.5606046, 0.5908201, -0.06413639, 0.3333333, 0, 1, 1,
0.5702989, -0.8834856, 3.189135, 0.3372549, 0, 1, 1,
0.5717412, -0.9100783, 1.84418, 0.345098, 0, 1, 1,
0.5725202, 0.4979413, 1.731525, 0.3490196, 0, 1, 1,
0.5736386, 1.084445, 0.5192032, 0.3568628, 0, 1, 1,
0.5777532, -0.5442138, 2.46988, 0.3607843, 0, 1, 1,
0.5803946, -0.7231026, 2.71665, 0.3686275, 0, 1, 1,
0.5847847, -0.1642354, 0.9789928, 0.372549, 0, 1, 1,
0.5876078, 1.754205, -0.6943393, 0.3803922, 0, 1, 1,
0.5917438, 0.8866012, -0.3216361, 0.3843137, 0, 1, 1,
0.6017144, 0.05976979, 1.542018, 0.3921569, 0, 1, 1,
0.6034501, -1.475376, 2.499169, 0.3960784, 0, 1, 1,
0.6049159, 0.1386158, 0.3227317, 0.4039216, 0, 1, 1,
0.6049849, -0.7597411, 1.649484, 0.4117647, 0, 1, 1,
0.6242519, -0.1042116, 3.059875, 0.4156863, 0, 1, 1,
0.6252499, -0.4995213, 2.922997, 0.4235294, 0, 1, 1,
0.6292037, -1.592414, 3.288838, 0.427451, 0, 1, 1,
0.6408406, 0.4170169, 1.786239, 0.4352941, 0, 1, 1,
0.6421253, 1.136799, 1.112987, 0.4392157, 0, 1, 1,
0.6478614, -1.338645, 3.052407, 0.4470588, 0, 1, 1,
0.6482838, 0.05703939, 3.19676, 0.4509804, 0, 1, 1,
0.6491448, 0.2099241, 0.1335606, 0.4588235, 0, 1, 1,
0.6494972, -0.4508771, 3.655035, 0.4627451, 0, 1, 1,
0.6541148, -1.080312, 3.258763, 0.4705882, 0, 1, 1,
0.6594581, -0.613649, 2.831216, 0.4745098, 0, 1, 1,
0.6623141, -1.137053, 3.523685, 0.4823529, 0, 1, 1,
0.667905, 0.272988, 1.891345, 0.4862745, 0, 1, 1,
0.6727356, 1.425157, -0.4177429, 0.4941176, 0, 1, 1,
0.6740893, 0.9094087, 0.7754142, 0.5019608, 0, 1, 1,
0.676856, -1.880274, 4.789968, 0.5058824, 0, 1, 1,
0.6919097, 0.9565009, -0.4169109, 0.5137255, 0, 1, 1,
0.7033576, -0.13369, 1.078178, 0.5176471, 0, 1, 1,
0.7051023, -0.7763795, 2.365853, 0.5254902, 0, 1, 1,
0.7094687, 0.8472146, 1.269586, 0.5294118, 0, 1, 1,
0.7116645, -0.8192872, 1.4684, 0.5372549, 0, 1, 1,
0.7150579, -0.07957234, 1.077654, 0.5411765, 0, 1, 1,
0.7223899, -0.02724631, 0.4171174, 0.5490196, 0, 1, 1,
0.7280025, 0.1746845, 2.295306, 0.5529412, 0, 1, 1,
0.731939, 0.7716698, 0.2792679, 0.5607843, 0, 1, 1,
0.7322513, 0.09160624, 2.160444, 0.5647059, 0, 1, 1,
0.7331557, 0.2081467, 1.997567, 0.572549, 0, 1, 1,
0.7381479, -1.148984, 2.53026, 0.5764706, 0, 1, 1,
0.7464482, 0.192454, -0.007865919, 0.5843138, 0, 1, 1,
0.7524415, -0.1952084, 1.670022, 0.5882353, 0, 1, 1,
0.7544462, 1.244843, 1.464415, 0.5960785, 0, 1, 1,
0.7549976, -2.543778, 3.155102, 0.6039216, 0, 1, 1,
0.7573453, -0.2309781, 2.427397, 0.6078432, 0, 1, 1,
0.7586941, -0.8010523, 0.8699049, 0.6156863, 0, 1, 1,
0.7657136, 0.2427106, 1.07023, 0.6196079, 0, 1, 1,
0.7792343, -0.3946561, 3.050661, 0.627451, 0, 1, 1,
0.7917466, 2.435799, -0.02746447, 0.6313726, 0, 1, 1,
0.8017548, -2.277408, 1.309581, 0.6392157, 0, 1, 1,
0.8048736, 0.3093152, 1.309547, 0.6431373, 0, 1, 1,
0.806184, 0.1257707, 0.3711027, 0.6509804, 0, 1, 1,
0.8069044, 0.5793748, 1.344345, 0.654902, 0, 1, 1,
0.8100504, -1.500156, 2.264293, 0.6627451, 0, 1, 1,
0.8130362, -0.4596753, 1.215032, 0.6666667, 0, 1, 1,
0.8141596, 1.210764, 0.9403801, 0.6745098, 0, 1, 1,
0.8216216, -0.95671, 4.102901, 0.6784314, 0, 1, 1,
0.8303658, 0.8403941, 1.301493, 0.6862745, 0, 1, 1,
0.8371941, 1.323293, -0.2473577, 0.6901961, 0, 1, 1,
0.8463503, -0.006542781, 1.826914, 0.6980392, 0, 1, 1,
0.8495964, -0.354652, 0.6909496, 0.7058824, 0, 1, 1,
0.8535869, 0.5506585, 2.00154, 0.7098039, 0, 1, 1,
0.8540587, -0.7167352, 1.689295, 0.7176471, 0, 1, 1,
0.854318, 0.2809772, 1.985863, 0.7215686, 0, 1, 1,
0.8602509, 0.9157109, 0.1685427, 0.7294118, 0, 1, 1,
0.8638278, 1.517516, 1.03234, 0.7333333, 0, 1, 1,
0.8688022, 1.487254, 0.37909, 0.7411765, 0, 1, 1,
0.8766633, 1.754916, 0.1239983, 0.7450981, 0, 1, 1,
0.8783211, 1.141227, 2.451539, 0.7529412, 0, 1, 1,
0.8857451, -2.649356, 1.941803, 0.7568628, 0, 1, 1,
0.8863354, 0.9050347, 1.256505, 0.7647059, 0, 1, 1,
0.8902515, 0.9060898, 1.758357, 0.7686275, 0, 1, 1,
0.8930716, 0.745177, 1.195157, 0.7764706, 0, 1, 1,
0.9043784, 0.582829, 2.129438, 0.7803922, 0, 1, 1,
0.9053963, -0.09516367, 2.830724, 0.7882353, 0, 1, 1,
0.91488, -0.8493388, 2.18985, 0.7921569, 0, 1, 1,
0.9152291, -1.178245, 3.525669, 0.8, 0, 1, 1,
0.917192, -1.360928, 4.601759, 0.8078431, 0, 1, 1,
0.9222019, 0.5313872, -0.002845137, 0.8117647, 0, 1, 1,
0.9231165, -0.7198723, 1.580302, 0.8196079, 0, 1, 1,
0.92751, -1.494009, 2.195982, 0.8235294, 0, 1, 1,
0.9286578, 1.469692, 0.4169334, 0.8313726, 0, 1, 1,
0.9310563, 1.439569, 0.8172598, 0.8352941, 0, 1, 1,
0.9350021, -1.302527, 0.4640807, 0.8431373, 0, 1, 1,
0.9447783, -1.242446, 1.82795, 0.8470588, 0, 1, 1,
0.9449136, 0.01021744, 0.6899527, 0.854902, 0, 1, 1,
0.9535203, 2.422846, 0.819591, 0.8588235, 0, 1, 1,
0.9550756, 2.203805, -0.01724703, 0.8666667, 0, 1, 1,
0.9582124, 0.03416669, 2.73294, 0.8705882, 0, 1, 1,
0.9641907, 1.225754, -0.6905093, 0.8784314, 0, 1, 1,
0.9717863, 0.9754234, -1.456216, 0.8823529, 0, 1, 1,
0.9750528, 1.53545, -0.8558857, 0.8901961, 0, 1, 1,
0.9788836, -0.5771788, 2.67913, 0.8941177, 0, 1, 1,
0.9790266, -0.9653066, 2.160287, 0.9019608, 0, 1, 1,
0.9801043, -0.07048412, 1.949909, 0.9098039, 0, 1, 1,
0.9803948, 0.8775563, 0.3577044, 0.9137255, 0, 1, 1,
0.9806969, -1.38291, 1.389019, 0.9215686, 0, 1, 1,
0.98338, -0.1514387, 2.207124, 0.9254902, 0, 1, 1,
0.9861538, 1.037219, -0.5356917, 0.9333333, 0, 1, 1,
0.9900131, 1.246027, 0.2103646, 0.9372549, 0, 1, 1,
1.001817, -2.233849, 2.562111, 0.945098, 0, 1, 1,
1.004636, 0.2066557, 2.027358, 0.9490196, 0, 1, 1,
1.004656, -1.154615, 1.585184, 0.9568627, 0, 1, 1,
1.009784, -1.107198, 2.289841, 0.9607843, 0, 1, 1,
1.010104, 0.1197439, 1.300302, 0.9686275, 0, 1, 1,
1.02458, -2.103439, 2.859169, 0.972549, 0, 1, 1,
1.028802, -0.3354706, 1.786159, 0.9803922, 0, 1, 1,
1.028902, 0.2185299, 2.862957, 0.9843137, 0, 1, 1,
1.029241, 0.2355516, -0.02784262, 0.9921569, 0, 1, 1,
1.030561, -0.398026, 2.055938, 0.9960784, 0, 1, 1,
1.039047, -1.558807, 3.674317, 1, 0, 0.9960784, 1,
1.04456, -0.6885476, 3.054095, 1, 0, 0.9882353, 1,
1.045761, 0.9286863, 0.8198863, 1, 0, 0.9843137, 1,
1.050277, 0.4816918, 1.723127, 1, 0, 0.9764706, 1,
1.052474, 0.04839939, 2.508808, 1, 0, 0.972549, 1,
1.055992, -0.0141214, 2.369906, 1, 0, 0.9647059, 1,
1.061569, 1.770305, 1.627076, 1, 0, 0.9607843, 1,
1.065669, 0.2840764, 1.042573, 1, 0, 0.9529412, 1,
1.066978, 1.108732, 0.2663326, 1, 0, 0.9490196, 1,
1.067393, -0.6056817, 3.030461, 1, 0, 0.9411765, 1,
1.067791, -0.64485, 1.658728, 1, 0, 0.9372549, 1,
1.067971, -0.4210339, 2.96062, 1, 0, 0.9294118, 1,
1.071434, -1.470774, 3.315092, 1, 0, 0.9254902, 1,
1.071455, 0.5260775, 1.025865, 1, 0, 0.9176471, 1,
1.074354, -0.2471385, 1.657067, 1, 0, 0.9137255, 1,
1.07548, 0.454396, 2.516525, 1, 0, 0.9058824, 1,
1.076389, -0.312039, 3.293628, 1, 0, 0.9019608, 1,
1.079733, 1.039804, 0.458289, 1, 0, 0.8941177, 1,
1.084993, 1.187519, 1.528479, 1, 0, 0.8862745, 1,
1.086953, 1.218274, 1.115945, 1, 0, 0.8823529, 1,
1.088889, -0.4303072, 2.396346, 1, 0, 0.8745098, 1,
1.093226, 1.925932, -0.9536844, 1, 0, 0.8705882, 1,
1.093691, -0.568835, 2.17366, 1, 0, 0.8627451, 1,
1.09734, 0.1703429, 1.39845, 1, 0, 0.8588235, 1,
1.101063, 0.3773929, 3.064561, 1, 0, 0.8509804, 1,
1.103389, 1.280384, 1.154241, 1, 0, 0.8470588, 1,
1.105995, 0.1748814, 1.794308, 1, 0, 0.8392157, 1,
1.107878, 1.090632, 0.3984872, 1, 0, 0.8352941, 1,
1.112338, -1.233282, 2.502555, 1, 0, 0.827451, 1,
1.116513, -0.9857934, 3.134103, 1, 0, 0.8235294, 1,
1.116855, 0.679561, 2.164123, 1, 0, 0.8156863, 1,
1.122257, -0.2086758, 1.558583, 1, 0, 0.8117647, 1,
1.133032, -1.570814, 3.489119, 1, 0, 0.8039216, 1,
1.134608, 1.226563, 2.435695, 1, 0, 0.7960784, 1,
1.13471, 0.1431364, 2.097122, 1, 0, 0.7921569, 1,
1.138606, -0.9102962, 0.579551, 1, 0, 0.7843137, 1,
1.149995, 0.5404889, 2.546599, 1, 0, 0.7803922, 1,
1.158679, -0.4298562, 1.860748, 1, 0, 0.772549, 1,
1.165731, -0.6147205, 1.580027, 1, 0, 0.7686275, 1,
1.168569, 0.6416861, 1.675555, 1, 0, 0.7607843, 1,
1.180254, 2.357851, 0.8968041, 1, 0, 0.7568628, 1,
1.180635, 2.443166, -0.6319737, 1, 0, 0.7490196, 1,
1.196717, 0.3853004, 1.449829, 1, 0, 0.7450981, 1,
1.200168, 0.05170357, 1.31722, 1, 0, 0.7372549, 1,
1.203012, 1.172715, 0.01076946, 1, 0, 0.7333333, 1,
1.208809, -0.4588161, 1.655892, 1, 0, 0.7254902, 1,
1.21806, 0.9763745, -0.4165259, 1, 0, 0.7215686, 1,
1.226483, 1.345362, 0.5578872, 1, 0, 0.7137255, 1,
1.237144, -0.1058092, 1.828642, 1, 0, 0.7098039, 1,
1.240565, 0.3316219, 0.1407234, 1, 0, 0.7019608, 1,
1.248929, 0.8702128, 2.274416, 1, 0, 0.6941177, 1,
1.25005, -0.7223918, 0.8771856, 1, 0, 0.6901961, 1,
1.258894, 0.3554886, -0.06156792, 1, 0, 0.682353, 1,
1.265172, -0.5354326, 2.843201, 1, 0, 0.6784314, 1,
1.266668, -2.33911, 1.52829, 1, 0, 0.6705883, 1,
1.274058, -0.3419683, 0.799251, 1, 0, 0.6666667, 1,
1.275193, 1.140886, 2.92542, 1, 0, 0.6588235, 1,
1.278362, -0.243333, 2.255266, 1, 0, 0.654902, 1,
1.304154, 0.8822342, 0.2100403, 1, 0, 0.6470588, 1,
1.30511, -0.03270745, 2.649984, 1, 0, 0.6431373, 1,
1.317912, 0.6735409, 2.141395, 1, 0, 0.6352941, 1,
1.325919, -0.9553223, 1.695358, 1, 0, 0.6313726, 1,
1.327471, 1.130801, -0.4542699, 1, 0, 0.6235294, 1,
1.33224, 0.3446909, 0.9141312, 1, 0, 0.6196079, 1,
1.33667, 0.4634469, 1.538805, 1, 0, 0.6117647, 1,
1.339897, -1.056101, 2.596643, 1, 0, 0.6078432, 1,
1.343512, -0.5303251, 1.400396, 1, 0, 0.6, 1,
1.344468, -0.4877761, 1.771648, 1, 0, 0.5921569, 1,
1.352157, 0.4728853, 0.7829943, 1, 0, 0.5882353, 1,
1.352562, -0.2689961, 1.700003, 1, 0, 0.5803922, 1,
1.353323, 0.144802, 1.393265, 1, 0, 0.5764706, 1,
1.355846, 1.116861, 1.207174, 1, 0, 0.5686275, 1,
1.365042, -0.1943102, 0.760576, 1, 0, 0.5647059, 1,
1.367949, 1.822141, -1.17173, 1, 0, 0.5568628, 1,
1.368847, -0.7386486, 1.864632, 1, 0, 0.5529412, 1,
1.372055, 1.431297, 0.6992854, 1, 0, 0.5450981, 1,
1.384567, -0.9251753, 1.564548, 1, 0, 0.5411765, 1,
1.39645, 0.7171745, 0.6269897, 1, 0, 0.5333334, 1,
1.412934, 0.4277822, 3.801458, 1, 0, 0.5294118, 1,
1.419358, 1.31001, 0.06975669, 1, 0, 0.5215687, 1,
1.427116, 0.3451123, 2.984419, 1, 0, 0.5176471, 1,
1.428142, 0.286516, 1.975444, 1, 0, 0.509804, 1,
1.428343, -0.3384251, -0.1805969, 1, 0, 0.5058824, 1,
1.428591, -0.7612262, 2.401631, 1, 0, 0.4980392, 1,
1.432143, 2.032236, -0.09428895, 1, 0, 0.4901961, 1,
1.432592, -0.4021985, 2.606049, 1, 0, 0.4862745, 1,
1.437483, 0.8598378, 1.514621, 1, 0, 0.4784314, 1,
1.449657, -0.1019029, 0.7513394, 1, 0, 0.4745098, 1,
1.450414, 1.79088, 0.8326095, 1, 0, 0.4666667, 1,
1.458411, 0.2761167, 0.4051337, 1, 0, 0.4627451, 1,
1.459829, 1.894085, 0.1244456, 1, 0, 0.454902, 1,
1.462125, -1.396731, 1.152558, 1, 0, 0.4509804, 1,
1.473806, -0.593125, 1.733118, 1, 0, 0.4431373, 1,
1.477821, 0.7115672, 3.574193, 1, 0, 0.4392157, 1,
1.494068, -0.4272596, 0.781245, 1, 0, 0.4313726, 1,
1.512142, -0.3400433, 3.219372, 1, 0, 0.427451, 1,
1.52827, -0.1714868, 1.663383, 1, 0, 0.4196078, 1,
1.532564, -0.689903, 2.735356, 1, 0, 0.4156863, 1,
1.547392, 0.5640349, 1.174625, 1, 0, 0.4078431, 1,
1.555862, 0.08981621, 1.378787, 1, 0, 0.4039216, 1,
1.561436, -0.4739366, -0.04784748, 1, 0, 0.3960784, 1,
1.574815, -0.2635005, 1.300186, 1, 0, 0.3882353, 1,
1.586916, 0.1605408, 2.196658, 1, 0, 0.3843137, 1,
1.589542, -1.141454, 1.616553, 1, 0, 0.3764706, 1,
1.590828, 0.05438245, 1.127287, 1, 0, 0.372549, 1,
1.602862, 0.390194, 1.0355, 1, 0, 0.3647059, 1,
1.606132, -0.3527362, 3.510448, 1, 0, 0.3607843, 1,
1.614715, 0.4106172, 1.091096, 1, 0, 0.3529412, 1,
1.627094, -2.028558, 1.330945, 1, 0, 0.3490196, 1,
1.629822, 0.990393, 2.379054, 1, 0, 0.3411765, 1,
1.63231, -0.3230125, 1.127888, 1, 0, 0.3372549, 1,
1.635669, -0.06787632, -0.2573423, 1, 0, 0.3294118, 1,
1.636481, -0.1162164, 1.69781, 1, 0, 0.3254902, 1,
1.638257, -0.2253274, 0.8720451, 1, 0, 0.3176471, 1,
1.640928, 0.4642883, 1.338325, 1, 0, 0.3137255, 1,
1.643558, -0.2051836, 1.469465, 1, 0, 0.3058824, 1,
1.669764, -0.6639148, 0.8495858, 1, 0, 0.2980392, 1,
1.688165, -1.493608, 0.8379818, 1, 0, 0.2941177, 1,
1.700903, -1.085478, 2.403368, 1, 0, 0.2862745, 1,
1.708014, 0.6169107, 1.204684, 1, 0, 0.282353, 1,
1.718722, -1.132683, 2.701429, 1, 0, 0.2745098, 1,
1.730961, 0.4070346, 0.06141632, 1, 0, 0.2705882, 1,
1.742566, 0.9668089, 1.721231, 1, 0, 0.2627451, 1,
1.745585, 0.5401208, 0.4040832, 1, 0, 0.2588235, 1,
1.755632, 1.32166, 0.5611836, 1, 0, 0.2509804, 1,
1.763253, -0.4994137, 2.401106, 1, 0, 0.2470588, 1,
1.784764, 0.6061572, -0.5331461, 1, 0, 0.2392157, 1,
1.79432, 0.3697812, 2.240228, 1, 0, 0.2352941, 1,
1.798444, 0.3685704, 0.4912658, 1, 0, 0.227451, 1,
1.807013, -0.2083348, 2.182722, 1, 0, 0.2235294, 1,
1.815024, 0.7708904, 0.7394681, 1, 0, 0.2156863, 1,
1.831537, -1.304986, 2.050015, 1, 0, 0.2117647, 1,
1.85893, 0.5394091, -0.2259082, 1, 0, 0.2039216, 1,
1.86382, -0.08391283, 2.862771, 1, 0, 0.1960784, 1,
1.907269, 0.6036887, 0.4474338, 1, 0, 0.1921569, 1,
1.93638, 2.455631, 0.5125906, 1, 0, 0.1843137, 1,
1.939184, 0.8098323, 2.297935, 1, 0, 0.1803922, 1,
1.984451, -1.697171, 1.201512, 1, 0, 0.172549, 1,
1.993502, -1.139059, 1.140961, 1, 0, 0.1686275, 1,
2.00762, 0.790304, 2.940589, 1, 0, 0.1607843, 1,
2.026935, 1.085419, 2.558578, 1, 0, 0.1568628, 1,
2.034017, -1.487219, 4.424278, 1, 0, 0.1490196, 1,
2.051143, -0.4474621, 1.035029, 1, 0, 0.145098, 1,
2.068184, 0.1803307, 1.949677, 1, 0, 0.1372549, 1,
2.071546, 0.1411084, 2.035574, 1, 0, 0.1333333, 1,
2.073836, 0.9416087, 1.433502, 1, 0, 0.1254902, 1,
2.117141, 0.9069093, 1.022178, 1, 0, 0.1215686, 1,
2.126048, -0.1862643, 3.140659, 1, 0, 0.1137255, 1,
2.147201, 0.07071859, 0.02143285, 1, 0, 0.1098039, 1,
2.163538, -0.3228266, 2.650959, 1, 0, 0.1019608, 1,
2.194427, -0.1758353, 2.158155, 1, 0, 0.09411765, 1,
2.206621, 0.812694, 1.001028, 1, 0, 0.09019608, 1,
2.243121, 0.7002244, 1.049566, 1, 0, 0.08235294, 1,
2.250464, 0.2061881, 0.7709141, 1, 0, 0.07843138, 1,
2.322854, -0.6011264, 0.9591463, 1, 0, 0.07058824, 1,
2.337309, -0.6485066, 2.588358, 1, 0, 0.06666667, 1,
2.387566, -0.03481112, 3.666166, 1, 0, 0.05882353, 1,
2.445944, 0.1132367, 0.4222322, 1, 0, 0.05490196, 1,
2.586039, 0.9314023, 0.2550699, 1, 0, 0.04705882, 1,
2.656205, 0.4070687, 1.245969, 1, 0, 0.04313726, 1,
2.658558, -1.196144, 3.061099, 1, 0, 0.03529412, 1,
2.871159, 0.05628986, 2.891854, 1, 0, 0.03137255, 1,
3.098806, 0.7547923, 3.005957, 1, 0, 0.02352941, 1,
3.400552, -0.6054808, 1.314366, 1, 0, 0.01960784, 1,
3.417104, -1.194569, 1.839156, 1, 0, 0.01176471, 1,
3.717648, 0.7763361, 0.3784817, 1, 0, 0.007843138, 1
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
0.1599872, -3.864035, -7.323242, 0, -0.5, 0.5, 0.5,
0.1599872, -3.864035, -7.323242, 1, -0.5, 0.5, 0.5,
0.1599872, -3.864035, -7.323242, 1, 1.5, 0.5, 0.5,
0.1599872, -3.864035, -7.323242, 0, 1.5, 0.5, 0.5
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
-4.60372, 0.098611, -7.323242, 0, -0.5, 0.5, 0.5,
-4.60372, 0.098611, -7.323242, 1, -0.5, 0.5, 0.5,
-4.60372, 0.098611, -7.323242, 1, 1.5, 0.5, 0.5,
-4.60372, 0.098611, -7.323242, 0, 1.5, 0.5, 0.5
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
-4.60372, -3.864035, -0.0826242, 0, -0.5, 0.5, 0.5,
-4.60372, -3.864035, -0.0826242, 1, -0.5, 0.5, 0.5,
-4.60372, -3.864035, -0.0826242, 1, 1.5, 0.5, 0.5,
-4.60372, -3.864035, -0.0826242, 0, 1.5, 0.5, 0.5
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
-2, -2.949578, -5.65233,
2, -2.949578, -5.65233,
-2, -2.949578, -5.65233,
-2, -3.101987, -5.930815,
0, -2.949578, -5.65233,
0, -3.101987, -5.930815,
2, -2.949578, -5.65233,
2, -3.101987, -5.930815
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
-2, -3.406806, -6.487786, 0, -0.5, 0.5, 0.5,
-2, -3.406806, -6.487786, 1, -0.5, 0.5, 0.5,
-2, -3.406806, -6.487786, 1, 1.5, 0.5, 0.5,
-2, -3.406806, -6.487786, 0, 1.5, 0.5, 0.5,
0, -3.406806, -6.487786, 0, -0.5, 0.5, 0.5,
0, -3.406806, -6.487786, 1, -0.5, 0.5, 0.5,
0, -3.406806, -6.487786, 1, 1.5, 0.5, 0.5,
0, -3.406806, -6.487786, 0, 1.5, 0.5, 0.5,
2, -3.406806, -6.487786, 0, -0.5, 0.5, 0.5,
2, -3.406806, -6.487786, 1, -0.5, 0.5, 0.5,
2, -3.406806, -6.487786, 1, 1.5, 0.5, 0.5,
2, -3.406806, -6.487786, 0, 1.5, 0.5, 0.5
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
-3.504403, -2, -5.65233,
-3.504403, 3, -5.65233,
-3.504403, -2, -5.65233,
-3.687623, -2, -5.930815,
-3.504403, -1, -5.65233,
-3.687623, -1, -5.930815,
-3.504403, 0, -5.65233,
-3.687623, 0, -5.930815,
-3.504403, 1, -5.65233,
-3.687623, 1, -5.930815,
-3.504403, 2, -5.65233,
-3.687623, 2, -5.930815,
-3.504403, 3, -5.65233,
-3.687623, 3, -5.930815
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
-4.054062, -2, -6.487786, 0, -0.5, 0.5, 0.5,
-4.054062, -2, -6.487786, 1, -0.5, 0.5, 0.5,
-4.054062, -2, -6.487786, 1, 1.5, 0.5, 0.5,
-4.054062, -2, -6.487786, 0, 1.5, 0.5, 0.5,
-4.054062, -1, -6.487786, 0, -0.5, 0.5, 0.5,
-4.054062, -1, -6.487786, 1, -0.5, 0.5, 0.5,
-4.054062, -1, -6.487786, 1, 1.5, 0.5, 0.5,
-4.054062, -1, -6.487786, 0, 1.5, 0.5, 0.5,
-4.054062, 0, -6.487786, 0, -0.5, 0.5, 0.5,
-4.054062, 0, -6.487786, 1, -0.5, 0.5, 0.5,
-4.054062, 0, -6.487786, 1, 1.5, 0.5, 0.5,
-4.054062, 0, -6.487786, 0, 1.5, 0.5, 0.5,
-4.054062, 1, -6.487786, 0, -0.5, 0.5, 0.5,
-4.054062, 1, -6.487786, 1, -0.5, 0.5, 0.5,
-4.054062, 1, -6.487786, 1, 1.5, 0.5, 0.5,
-4.054062, 1, -6.487786, 0, 1.5, 0.5, 0.5,
-4.054062, 2, -6.487786, 0, -0.5, 0.5, 0.5,
-4.054062, 2, -6.487786, 1, -0.5, 0.5, 0.5,
-4.054062, 2, -6.487786, 1, 1.5, 0.5, 0.5,
-4.054062, 2, -6.487786, 0, 1.5, 0.5, 0.5,
-4.054062, 3, -6.487786, 0, -0.5, 0.5, 0.5,
-4.054062, 3, -6.487786, 1, -0.5, 0.5, 0.5,
-4.054062, 3, -6.487786, 1, 1.5, 0.5, 0.5,
-4.054062, 3, -6.487786, 0, 1.5, 0.5, 0.5
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
-3.504403, -2.949578, -4,
-3.504403, -2.949578, 4,
-3.504403, -2.949578, -4,
-3.687623, -3.101987, -4,
-3.504403, -2.949578, -2,
-3.687623, -3.101987, -2,
-3.504403, -2.949578, 0,
-3.687623, -3.101987, 0,
-3.504403, -2.949578, 2,
-3.687623, -3.101987, 2,
-3.504403, -2.949578, 4,
-3.687623, -3.101987, 4
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
-4.054062, -3.406806, -4, 0, -0.5, 0.5, 0.5,
-4.054062, -3.406806, -4, 1, -0.5, 0.5, 0.5,
-4.054062, -3.406806, -4, 1, 1.5, 0.5, 0.5,
-4.054062, -3.406806, -4, 0, 1.5, 0.5, 0.5,
-4.054062, -3.406806, -2, 0, -0.5, 0.5, 0.5,
-4.054062, -3.406806, -2, 1, -0.5, 0.5, 0.5,
-4.054062, -3.406806, -2, 1, 1.5, 0.5, 0.5,
-4.054062, -3.406806, -2, 0, 1.5, 0.5, 0.5,
-4.054062, -3.406806, 0, 0, -0.5, 0.5, 0.5,
-4.054062, -3.406806, 0, 1, -0.5, 0.5, 0.5,
-4.054062, -3.406806, 0, 1, 1.5, 0.5, 0.5,
-4.054062, -3.406806, 0, 0, 1.5, 0.5, 0.5,
-4.054062, -3.406806, 2, 0, -0.5, 0.5, 0.5,
-4.054062, -3.406806, 2, 1, -0.5, 0.5, 0.5,
-4.054062, -3.406806, 2, 1, 1.5, 0.5, 0.5,
-4.054062, -3.406806, 2, 0, 1.5, 0.5, 0.5,
-4.054062, -3.406806, 4, 0, -0.5, 0.5, 0.5,
-4.054062, -3.406806, 4, 1, -0.5, 0.5, 0.5,
-4.054062, -3.406806, 4, 1, 1.5, 0.5, 0.5,
-4.054062, -3.406806, 4, 0, 1.5, 0.5, 0.5
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
-3.504403, -2.949578, -5.65233,
-3.504403, 3.1468, -5.65233,
-3.504403, -2.949578, 5.487082,
-3.504403, 3.1468, 5.487082,
-3.504403, -2.949578, -5.65233,
-3.504403, -2.949578, 5.487082,
-3.504403, 3.1468, -5.65233,
-3.504403, 3.1468, 5.487082,
-3.504403, -2.949578, -5.65233,
3.824378, -2.949578, -5.65233,
-3.504403, -2.949578, 5.487082,
3.824378, -2.949578, 5.487082,
-3.504403, 3.1468, -5.65233,
3.824378, 3.1468, -5.65233,
-3.504403, 3.1468, 5.487082,
3.824378, 3.1468, 5.487082,
3.824378, -2.949578, -5.65233,
3.824378, 3.1468, -5.65233,
3.824378, -2.949578, 5.487082,
3.824378, 3.1468, 5.487082,
3.824378, -2.949578, -5.65233,
3.824378, -2.949578, 5.487082,
3.824378, 3.1468, -5.65233,
3.824378, 3.1468, 5.487082
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
var radius = 7.829025;
var distance = 34.83222;
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
mvMatrix.translate( -0.1599872, -0.098611, 0.0826242 );
mvMatrix.scale( 1.155021, 1.388512, 0.759905 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.83222);
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
thiodicarbamate<-read.table("thiodicarbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiodicarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
```

```r
y<-thiodicarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
```

```r
z<-thiodicarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
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
-3.397673, 0.700456, -0.1341053, 0, 0, 1, 1, 1,
-3.298298, -1.300924, -1.415084, 1, 0, 0, 1, 1,
-3.231284, 0.1155599, -1.436453, 1, 0, 0, 1, 1,
-3.039815, -0.5167038, -1.89651, 1, 0, 0, 1, 1,
-2.907558, -1.369976, -1.382434, 1, 0, 0, 1, 1,
-2.859601, 0.2081897, -0.7532988, 1, 0, 0, 1, 1,
-2.826956, 3.058018, -0.5285983, 0, 0, 0, 1, 1,
-2.797884, 1.71555, -0.9076179, 0, 0, 0, 1, 1,
-2.738659, 0.2060989, -1.515603, 0, 0, 0, 1, 1,
-2.614084, -0.5406006, -2.122764, 0, 0, 0, 1, 1,
-2.430348, -1.041058, -3.744176, 0, 0, 0, 1, 1,
-2.312291, -0.913348, -1.892848, 0, 0, 0, 1, 1,
-2.255924, -0.6978582, -2.710393, 0, 0, 0, 1, 1,
-2.253755, -0.6668734, -1.248578, 1, 1, 1, 1, 1,
-2.238201, 1.064899, 0.2057596, 1, 1, 1, 1, 1,
-2.209481, -0.7804472, -1.929119, 1, 1, 1, 1, 1,
-2.179179, 1.163686, -1.387866, 1, 1, 1, 1, 1,
-2.088509, 0.1051587, -1.216277, 1, 1, 1, 1, 1,
-2.088049, 0.8538575, -0.4301163, 1, 1, 1, 1, 1,
-2.085041, 1.106971, -0.7874739, 1, 1, 1, 1, 1,
-2.028642, -0.2279321, -2.112957, 1, 1, 1, 1, 1,
-2.026823, -0.6692262, -0.3141316, 1, 1, 1, 1, 1,
-1.98017, 0.3404292, -3.300302, 1, 1, 1, 1, 1,
-1.969205, 1.861591, -1.333045, 1, 1, 1, 1, 1,
-1.964508, -0.3355097, -1.556357, 1, 1, 1, 1, 1,
-1.957892, 0.499424, -1.179975, 1, 1, 1, 1, 1,
-1.957745, -0.02159427, -0.4091065, 1, 1, 1, 1, 1,
-1.955119, 0.7698461, -1.515504, 1, 1, 1, 1, 1,
-1.944537, -0.9978017, -0.5333227, 0, 0, 1, 1, 1,
-1.916529, -0.3841939, -1.382613, 1, 0, 0, 1, 1,
-1.882288, 0.2630733, -0.3650874, 1, 0, 0, 1, 1,
-1.880096, 0.5172931, -1.830366, 1, 0, 0, 1, 1,
-1.863486, 1.011373, -1.191112, 1, 0, 0, 1, 1,
-1.859702, 0.6738679, -0.9912502, 1, 0, 0, 1, 1,
-1.834778, -0.7346098, -2.168988, 0, 0, 0, 1, 1,
-1.795128, -0.8504248, -1.810483, 0, 0, 0, 1, 1,
-1.773492, 0.1596547, -0.9647378, 0, 0, 0, 1, 1,
-1.771292, -0.1173119, -2.081211, 0, 0, 0, 1, 1,
-1.755107, 0.85896, -2.066569, 0, 0, 0, 1, 1,
-1.73935, 0.9497021, -0.2796739, 0, 0, 0, 1, 1,
-1.72734, -0.7987095, -1.737381, 0, 0, 0, 1, 1,
-1.715647, 0.2010294, -1.839673, 1, 1, 1, 1, 1,
-1.714294, -0.1812635, 0.9931653, 1, 1, 1, 1, 1,
-1.704156, -0.2228962, -3.312513, 1, 1, 1, 1, 1,
-1.682769, -1.680593, -4.09707, 1, 1, 1, 1, 1,
-1.673965, 1.056025, -2.068768, 1, 1, 1, 1, 1,
-1.668409, 0.7669127, -1.995713, 1, 1, 1, 1, 1,
-1.662781, -1.146105, -1.799168, 1, 1, 1, 1, 1,
-1.661477, -0.2280277, -2.735948, 1, 1, 1, 1, 1,
-1.656424, -0.45514, -3.055223, 1, 1, 1, 1, 1,
-1.65147, -0.471059, -3.476807, 1, 1, 1, 1, 1,
-1.622756, 1.6925, -0.1046825, 1, 1, 1, 1, 1,
-1.612814, -0.6276647, -1.299545, 1, 1, 1, 1, 1,
-1.573717, -0.6531018, -2.602713, 1, 1, 1, 1, 1,
-1.565045, 1.222805, -2.114418, 1, 1, 1, 1, 1,
-1.543535, 0.178873, -1.860304, 1, 1, 1, 1, 1,
-1.542471, 0.00943918, -0.5083462, 0, 0, 1, 1, 1,
-1.540511, 0.2417714, -0.6391553, 1, 0, 0, 1, 1,
-1.517561, -0.5676357, 0.2949557, 1, 0, 0, 1, 1,
-1.497415, 0.1943633, -0.3133005, 1, 0, 0, 1, 1,
-1.493001, 0.5197628, -1.74034, 1, 0, 0, 1, 1,
-1.484088, -0.1725348, -1.879247, 1, 0, 0, 1, 1,
-1.474998, 1.736036, -2.661859, 0, 0, 0, 1, 1,
-1.470556, -0.706443, -2.062542, 0, 0, 0, 1, 1,
-1.470046, 2.389399, -1.097151, 0, 0, 0, 1, 1,
-1.447265, 1.651718, -0.5090142, 0, 0, 0, 1, 1,
-1.434517, 0.3398448, -0.04995852, 0, 0, 0, 1, 1,
-1.426109, -0.09797211, -2.235104, 0, 0, 0, 1, 1,
-1.404022, -0.08830231, -1.418838, 0, 0, 0, 1, 1,
-1.393706, 0.3377401, -0.6788873, 1, 1, 1, 1, 1,
-1.391458, 0.6765491, 0.5943038, 1, 1, 1, 1, 1,
-1.390708, -1.010663, -2.80904, 1, 1, 1, 1, 1,
-1.388824, -0.6653306, -0.4721988, 1, 1, 1, 1, 1,
-1.381237, 0.8088923, -1.364996, 1, 1, 1, 1, 1,
-1.374746, 0.04539369, -1.378688, 1, 1, 1, 1, 1,
-1.374384, -0.7655993, -1.644705, 1, 1, 1, 1, 1,
-1.37094, -0.7409784, -2.539344, 1, 1, 1, 1, 1,
-1.370509, 0.640544, -0.9091343, 1, 1, 1, 1, 1,
-1.365169, 0.2191006, -2.564386, 1, 1, 1, 1, 1,
-1.361318, -0.9703339, -1.640652, 1, 1, 1, 1, 1,
-1.356446, 0.2174497, -0.9016047, 1, 1, 1, 1, 1,
-1.352879, 1.177181, -0.5630211, 1, 1, 1, 1, 1,
-1.346822, 0.1113836, -0.8054118, 1, 1, 1, 1, 1,
-1.339283, 0.6169435, -1.082569, 1, 1, 1, 1, 1,
-1.334226, -1.265725, -0.8316383, 0, 0, 1, 1, 1,
-1.329923, -1.125634, -0.8085738, 1, 0, 0, 1, 1,
-1.320686, -0.4155756, -2.170185, 1, 0, 0, 1, 1,
-1.30829, 0.5635422, -0.235464, 1, 0, 0, 1, 1,
-1.307966, -0.9546787, -1.914411, 1, 0, 0, 1, 1,
-1.294065, -1.718942, -1.152232, 1, 0, 0, 1, 1,
-1.293945, 0.2651561, -2.11893, 0, 0, 0, 1, 1,
-1.283198, 0.003641238, -1.042264, 0, 0, 0, 1, 1,
-1.278754, -1.924908, -2.81068, 0, 0, 0, 1, 1,
-1.252243, -0.2356809, -1.850201, 0, 0, 0, 1, 1,
-1.243583, -0.8437778, -1.12148, 0, 0, 0, 1, 1,
-1.238581, 0.2981801, -1.54256, 0, 0, 0, 1, 1,
-1.237882, 0.3681091, -0.2673939, 0, 0, 0, 1, 1,
-1.225453, -0.09392564, -0.6725869, 1, 1, 1, 1, 1,
-1.220969, 1.428763, -0.6349871, 1, 1, 1, 1, 1,
-1.209378, -0.7520651, -1.871122, 1, 1, 1, 1, 1,
-1.204546, 1.364806, -0.8624623, 1, 1, 1, 1, 1,
-1.200179, 1.116812, -2.336862, 1, 1, 1, 1, 1,
-1.193155, 0.2049789, -3.022038, 1, 1, 1, 1, 1,
-1.1927, -2.281774, -2.573335, 1, 1, 1, 1, 1,
-1.183496, 0.1804192, -1.6133, 1, 1, 1, 1, 1,
-1.178619, 0.8810041, -0.2406362, 1, 1, 1, 1, 1,
-1.178173, 0.8403998, 0.4652539, 1, 1, 1, 1, 1,
-1.160166, -1.859253, -2.203709, 1, 1, 1, 1, 1,
-1.156594, 0.4155349, -0.8866225, 1, 1, 1, 1, 1,
-1.154044, -0.1762132, -0.7809392, 1, 1, 1, 1, 1,
-1.135614, -0.5464394, -2.485117, 1, 1, 1, 1, 1,
-1.134297, 0.3370129, -1.374022, 1, 1, 1, 1, 1,
-1.134174, 1.1418, 0.7079815, 0, 0, 1, 1, 1,
-1.133806, 1.256871, 0.1525225, 1, 0, 0, 1, 1,
-1.129085, -1.20433, -2.779451, 1, 0, 0, 1, 1,
-1.127526, 0.2998651, -1.963871, 1, 0, 0, 1, 1,
-1.125098, 0.6389833, -0.8246711, 1, 0, 0, 1, 1,
-1.123673, -0.7170667, -3.704227, 1, 0, 0, 1, 1,
-1.113848, -0.8286348, -1.698234, 0, 0, 0, 1, 1,
-1.112086, 1.912041, -1.236731, 0, 0, 0, 1, 1,
-1.103689, -1.972627, -1.274453, 0, 0, 0, 1, 1,
-1.102259, 0.5379021, 0.4420981, 0, 0, 0, 1, 1,
-1.101688, -1.800965, -1.792863, 0, 0, 0, 1, 1,
-1.099681, 0.3323099, -0.09910347, 0, 0, 0, 1, 1,
-1.098222, 1.120874, -0.5841405, 0, 0, 0, 1, 1,
-1.09808, 2.467342, -0.3085674, 1, 1, 1, 1, 1,
-1.085625, -0.2308464, -2.886219, 1, 1, 1, 1, 1,
-1.080342, -2.860796, -0.558189, 1, 1, 1, 1, 1,
-1.078887, -0.6270385, -1.114003, 1, 1, 1, 1, 1,
-1.077659, -1.376277, -3.569371, 1, 1, 1, 1, 1,
-1.076615, -0.842225, -1.673551, 1, 1, 1, 1, 1,
-1.075157, -0.6325599, -2.492427, 1, 1, 1, 1, 1,
-1.073329, 0.532913, -0.6803555, 1, 1, 1, 1, 1,
-1.068768, -0.6587556, -0.3284718, 1, 1, 1, 1, 1,
-1.067587, 0.5140194, -0.7169964, 1, 1, 1, 1, 1,
-1.067192, 0.03733724, -2.166137, 1, 1, 1, 1, 1,
-1.065158, 0.4871586, -1.710402, 1, 1, 1, 1, 1,
-1.060356, 1.973532, -1.082432, 1, 1, 1, 1, 1,
-1.051785, 0.902706, 0.2268823, 1, 1, 1, 1, 1,
-1.028629, -0.7169514, -1.271017, 1, 1, 1, 1, 1,
-1.028107, -2.330725, -2.228832, 0, 0, 1, 1, 1,
-1.025771, -1.701426, -1.12048, 1, 0, 0, 1, 1,
-1.020686, 0.04715562, -0.8171695, 1, 0, 0, 1, 1,
-1.02043, 0.7500434, -1.319946, 1, 0, 0, 1, 1,
-1.017678, -0.8003334, -2.810168, 1, 0, 0, 1, 1,
-1.015023, 0.1774408, -1.363719, 1, 0, 0, 1, 1,
-1.008616, 1.404672, -1.162513, 0, 0, 0, 1, 1,
-0.9950203, -1.080321, -4.384871, 0, 0, 0, 1, 1,
-0.991717, 0.8764022, -2.006424, 0, 0, 0, 1, 1,
-0.9897765, -0.6657139, -1.726444, 0, 0, 0, 1, 1,
-0.9858777, -1.428923, -0.7457318, 0, 0, 0, 1, 1,
-0.9758184, 0.1961827, -0.2768391, 0, 0, 0, 1, 1,
-0.9727322, 0.02357394, -1.833028, 0, 0, 0, 1, 1,
-0.9679461, -1.439345, -0.6804291, 1, 1, 1, 1, 1,
-0.9667912, 0.3943139, -0.5887608, 1, 1, 1, 1, 1,
-0.9619777, -0.3736284, -1.797996, 1, 1, 1, 1, 1,
-0.9608438, 0.6160613, -1.522013, 1, 1, 1, 1, 1,
-0.9602921, -0.883403, -2.43528, 1, 1, 1, 1, 1,
-0.9551402, -1.488513, -2.352798, 1, 1, 1, 1, 1,
-0.9445879, 0.7494185, -1.822974, 1, 1, 1, 1, 1,
-0.9439558, 1.075846, -2.145235, 1, 1, 1, 1, 1,
-0.9362606, -0.6468747, -3.179085, 1, 1, 1, 1, 1,
-0.9326354, 0.5023823, -2.609884, 1, 1, 1, 1, 1,
-0.9243443, -0.3397231, -1.476911, 1, 1, 1, 1, 1,
-0.9226314, -0.01978693, -1.526037, 1, 1, 1, 1, 1,
-0.9224459, 0.4804435, -0.6374911, 1, 1, 1, 1, 1,
-0.915148, 0.1975334, -1.746472, 1, 1, 1, 1, 1,
-0.9116534, 1.521302, -1.179854, 1, 1, 1, 1, 1,
-0.9017942, -0.7751931, -2.084611, 0, 0, 1, 1, 1,
-0.9016383, -0.3868468, -3.39105, 1, 0, 0, 1, 1,
-0.8931925, 1.682403, -3.51439, 1, 0, 0, 1, 1,
-0.8931866, 0.1668873, -1.35552, 1, 0, 0, 1, 1,
-0.8841066, -0.7173797, -3.029073, 1, 0, 0, 1, 1,
-0.882891, -0.1194681, -1.097101, 1, 0, 0, 1, 1,
-0.8825243, 1.606029, -1.672187, 0, 0, 0, 1, 1,
-0.8820425, 0.7825865, 0.2567775, 0, 0, 0, 1, 1,
-0.8814776, -1.777029, -2.602182, 0, 0, 0, 1, 1,
-0.8695003, -0.3140674, -1.202191, 0, 0, 0, 1, 1,
-0.8648602, 0.3105837, -1.145502, 0, 0, 0, 1, 1,
-0.8644517, -1.094489, -3.880075, 0, 0, 0, 1, 1,
-0.8628986, -0.5331873, -1.579643, 0, 0, 0, 1, 1,
-0.8585638, 0.4903567, -1.221519, 1, 1, 1, 1, 1,
-0.857675, -1.19702, -2.810719, 1, 1, 1, 1, 1,
-0.8561041, -0.1872135, -2.01144, 1, 1, 1, 1, 1,
-0.8547441, -0.4567053, -1.729076, 1, 1, 1, 1, 1,
-0.8494782, -1.054158, -1.647029, 1, 1, 1, 1, 1,
-0.8487595, -0.1241617, -1.594763, 1, 1, 1, 1, 1,
-0.8473063, 0.5695156, 0.9436638, 1, 1, 1, 1, 1,
-0.8464023, 0.5668788, -0.9876527, 1, 1, 1, 1, 1,
-0.8440713, 0.2173626, -0.6540492, 1, 1, 1, 1, 1,
-0.8434842, -0.6684486, -2.176575, 1, 1, 1, 1, 1,
-0.8391426, -0.1423209, -1.504389, 1, 1, 1, 1, 1,
-0.832119, -0.2454965, -2.444997, 1, 1, 1, 1, 1,
-0.8305473, -0.1727566, -2.543874, 1, 1, 1, 1, 1,
-0.8260896, 0.7308812, -1.217886, 1, 1, 1, 1, 1,
-0.8257911, -0.275698, -1.955665, 1, 1, 1, 1, 1,
-0.8218973, 0.8612732, 0.9252358, 0, 0, 1, 1, 1,
-0.8218958, -0.0199867, -2.587876, 1, 0, 0, 1, 1,
-0.8210802, 2.974936, -1.052522, 1, 0, 0, 1, 1,
-0.8134977, -0.8085592, -2.421038, 1, 0, 0, 1, 1,
-0.8109677, -0.9907095, -1.596864, 1, 0, 0, 1, 1,
-0.8088791, -0.3929563, -2.920852, 1, 0, 0, 1, 1,
-0.8050379, -1.264469, -1.767457, 0, 0, 0, 1, 1,
-0.8040299, -1.05917, -2.42619, 0, 0, 0, 1, 1,
-0.8037239, -1.30991, -2.210821, 0, 0, 0, 1, 1,
-0.8037071, -2.009399, -1.883968, 0, 0, 0, 1, 1,
-0.7972715, -0.6472885, -2.2371, 0, 0, 0, 1, 1,
-0.7966488, -0.1915586, -2.208026, 0, 0, 0, 1, 1,
-0.7944738, -0.4255986, -1.144002, 0, 0, 0, 1, 1,
-0.7872539, -0.4791744, -4.174034, 1, 1, 1, 1, 1,
-0.7863467, -0.5336599, -1.458494, 1, 1, 1, 1, 1,
-0.7823531, -1.175072, -2.759162, 1, 1, 1, 1, 1,
-0.7797964, -0.496936, -1.731501, 1, 1, 1, 1, 1,
-0.7786072, -0.8447332, -1.71322, 1, 1, 1, 1, 1,
-0.7749897, -0.2237612, -2.00566, 1, 1, 1, 1, 1,
-0.7729743, -1.756908, -3.533013, 1, 1, 1, 1, 1,
-0.7726409, -0.1553446, -2.838008, 1, 1, 1, 1, 1,
-0.7638376, 0.3723882, -1.181111, 1, 1, 1, 1, 1,
-0.7624568, 0.4319149, -1.646536, 1, 1, 1, 1, 1,
-0.75641, 2.976687, 0.6500387, 1, 1, 1, 1, 1,
-0.7509482, -1.38492, -1.685, 1, 1, 1, 1, 1,
-0.7475767, -0.5730551, -1.508793, 1, 1, 1, 1, 1,
-0.7470449, 0.2095511, -1.616794, 1, 1, 1, 1, 1,
-0.7441217, -0.3311159, -0.6133837, 1, 1, 1, 1, 1,
-0.7437291, -0.04922216, -2.371188, 0, 0, 1, 1, 1,
-0.7393804, 0.324347, -1.326355, 1, 0, 0, 1, 1,
-0.7387887, 0.3423538, -0.07408039, 1, 0, 0, 1, 1,
-0.7267609, -0.3554887, -1.262425, 1, 0, 0, 1, 1,
-0.7220323, 0.5071636, -2.605194, 1, 0, 0, 1, 1,
-0.715964, -0.7393336, -3.87057, 1, 0, 0, 1, 1,
-0.7077334, 1.356003, 0.5154253, 0, 0, 0, 1, 1,
-0.7073341, 0.2521367, -2.579287, 0, 0, 0, 1, 1,
-0.705946, -0.6222259, -0.9037698, 0, 0, 0, 1, 1,
-0.7025006, 2.668108, 0.7667846, 0, 0, 0, 1, 1,
-0.7015764, -1.165225, -1.065521, 0, 0, 0, 1, 1,
-0.7000626, -0.282054, -1.344781, 0, 0, 0, 1, 1,
-0.6957557, -1.373627, -1.867033, 0, 0, 0, 1, 1,
-0.6901875, -0.4214659, -2.414428, 1, 1, 1, 1, 1,
-0.6900821, 0.973695, -0.03718248, 1, 1, 1, 1, 1,
-0.6828986, 0.2919027, -1.701203, 1, 1, 1, 1, 1,
-0.6828017, -1.666011, -3.382958, 1, 1, 1, 1, 1,
-0.6808015, -0.1937724, -2.291467, 1, 1, 1, 1, 1,
-0.6792783, -0.8420254, -4.305267, 1, 1, 1, 1, 1,
-0.6760469, 0.736712, -0.5710534, 1, 1, 1, 1, 1,
-0.6732076, -0.2736983, -3.198633, 1, 1, 1, 1, 1,
-0.6655148, 0.662026, -0.3688549, 1, 1, 1, 1, 1,
-0.6566334, 0.3110897, -0.8717264, 1, 1, 1, 1, 1,
-0.6538103, 1.04703, -0.727682, 1, 1, 1, 1, 1,
-0.6531498, -0.7760724, -2.962199, 1, 1, 1, 1, 1,
-0.6476908, 0.5483406, -0.393907, 1, 1, 1, 1, 1,
-0.6378965, -0.2175934, -0.5027719, 1, 1, 1, 1, 1,
-0.6366152, 0.3731469, -0.9138868, 1, 1, 1, 1, 1,
-0.6275558, -1.164001, -2.682681, 0, 0, 1, 1, 1,
-0.6269668, -0.361198, -3.03202, 1, 0, 0, 1, 1,
-0.6269432, -0.4539071, -2.335493, 1, 0, 0, 1, 1,
-0.6199468, -0.9206868, -3.250974, 1, 0, 0, 1, 1,
-0.6190091, -1.29644, -2.939524, 1, 0, 0, 1, 1,
-0.616015, -0.805804, -3.800606, 1, 0, 0, 1, 1,
-0.6150338, -1.88756, -2.218538, 0, 0, 0, 1, 1,
-0.6125568, 1.332452, 0.7236124, 0, 0, 0, 1, 1,
-0.6105869, -1.47616, -3.477554, 0, 0, 0, 1, 1,
-0.5979939, -0.3440053, -2.404892, 0, 0, 0, 1, 1,
-0.5966045, -0.09755994, -0.7707603, 0, 0, 0, 1, 1,
-0.5941553, -0.4908335, -1.056819, 0, 0, 0, 1, 1,
-0.593668, -1.392008, -2.488309, 0, 0, 0, 1, 1,
-0.5892959, -0.2219829, -3.374743, 1, 1, 1, 1, 1,
-0.5861727, 0.9938006, -0.3945008, 1, 1, 1, 1, 1,
-0.5848905, 0.5702242, -0.6791623, 1, 1, 1, 1, 1,
-0.5847595, -0.1665671, -2.938359, 1, 1, 1, 1, 1,
-0.5821239, 1.002718, -0.5785372, 1, 1, 1, 1, 1,
-0.5813992, -0.3931894, -3.734981, 1, 1, 1, 1, 1,
-0.5811931, -1.169138, -4.347823, 1, 1, 1, 1, 1,
-0.5767392, 0.1340215, -0.3639778, 1, 1, 1, 1, 1,
-0.5764985, 0.4870689, 0.5765231, 1, 1, 1, 1, 1,
-0.5729852, 0.7541956, -1.580145, 1, 1, 1, 1, 1,
-0.5715718, -1.420741, -5.490106, 1, 1, 1, 1, 1,
-0.5698699, 1.435045, 0.7467487, 1, 1, 1, 1, 1,
-0.5695032, -2.155328, -1.726095, 1, 1, 1, 1, 1,
-0.5677847, 0.3312753, -0.884252, 1, 1, 1, 1, 1,
-0.5664963, -0.7235312, -4.444563, 1, 1, 1, 1, 1,
-0.5626307, -0.01430364, -1.432338, 0, 0, 1, 1, 1,
-0.5571706, 1.296278, 0.1648077, 1, 0, 0, 1, 1,
-0.5571568, -0.932466, -2.562692, 1, 0, 0, 1, 1,
-0.5525953, 0.1129194, -2.256947, 1, 0, 0, 1, 1,
-0.549805, -1.137333, -1.810679, 1, 0, 0, 1, 1,
-0.5480945, -1.506755, -3.73413, 1, 0, 0, 1, 1,
-0.5470773, 0.2794917, 0.6085657, 0, 0, 0, 1, 1,
-0.5465575, 0.2866075, -1.8842, 0, 0, 0, 1, 1,
-0.5340902, -0.3415332, -2.841804, 0, 0, 0, 1, 1,
-0.5323364, 0.152482, -2.298755, 0, 0, 0, 1, 1,
-0.5322618, 0.143028, -1.014873, 0, 0, 0, 1, 1,
-0.5291029, -1.942679, -4.590895, 0, 0, 0, 1, 1,
-0.5267423, -0.6357243, -0.5401516, 0, 0, 0, 1, 1,
-0.5251835, 0.6861976, 0.006446546, 1, 1, 1, 1, 1,
-0.5242093, -0.2848057, -1.459264, 1, 1, 1, 1, 1,
-0.5229061, 2.345406, -1.004804, 1, 1, 1, 1, 1,
-0.5226963, 0.4748012, -0.920118, 1, 1, 1, 1, 1,
-0.5206647, 0.06530232, -1.333649, 1, 1, 1, 1, 1,
-0.5202855, 1.906262, 0.6698472, 1, 1, 1, 1, 1,
-0.5126021, -2.251871, -3.887762, 1, 1, 1, 1, 1,
-0.5072085, 1.888304, -2.389757, 1, 1, 1, 1, 1,
-0.5051986, -1.17733, -2.778648, 1, 1, 1, 1, 1,
-0.5037928, -1.153821, -2.68764, 1, 1, 1, 1, 1,
-0.4991683, -0.1177056, -1.62333, 1, 1, 1, 1, 1,
-0.4975934, -0.6293692, -0.9010452, 1, 1, 1, 1, 1,
-0.4933022, -0.8117796, -2.24004, 1, 1, 1, 1, 1,
-0.4887666, 0.6294696, -0.243718, 1, 1, 1, 1, 1,
-0.4885727, 0.3911684, -1.804815, 1, 1, 1, 1, 1,
-0.4804493, -0.05299754, -1.177372, 0, 0, 1, 1, 1,
-0.4787943, 0.3355584, -0.8888514, 1, 0, 0, 1, 1,
-0.4738172, -1.266577, -1.39304, 1, 0, 0, 1, 1,
-0.4702511, -0.03026883, -0.9288599, 1, 0, 0, 1, 1,
-0.4683909, 1.594715, -0.3915847, 1, 0, 0, 1, 1,
-0.4665906, -1.118292, -2.942449, 1, 0, 0, 1, 1,
-0.4660528, 0.5781161, -0.3288309, 0, 0, 0, 1, 1,
-0.4655675, -0.4042732, -1.609596, 0, 0, 0, 1, 1,
-0.464273, 0.9143251, -1.322947, 0, 0, 0, 1, 1,
-0.4640521, 0.4867593, -1.700027, 0, 0, 0, 1, 1,
-0.4605404, 0.1176776, -1.913339, 0, 0, 0, 1, 1,
-0.4571592, -1.723783, -2.322893, 0, 0, 0, 1, 1,
-0.4550759, -0.6298075, -3.419499, 0, 0, 0, 1, 1,
-0.4538286, -0.5695841, -2.243154, 1, 1, 1, 1, 1,
-0.4498122, -0.6648922, -3.727738, 1, 1, 1, 1, 1,
-0.448432, -0.7155781, -1.857159, 1, 1, 1, 1, 1,
-0.4450205, 0.5041315, -1.447996, 1, 1, 1, 1, 1,
-0.4440936, -0.002228691, -1.435321, 1, 1, 1, 1, 1,
-0.4440262, 0.470993, 0.6270916, 1, 1, 1, 1, 1,
-0.4440036, 1.532382, -0.6780636, 1, 1, 1, 1, 1,
-0.4418488, -0.6125113, -3.348579, 1, 1, 1, 1, 1,
-0.4396056, -0.2296768, -2.237371, 1, 1, 1, 1, 1,
-0.4378681, -1.108962, -2.532071, 1, 1, 1, 1, 1,
-0.4286839, -1.442275, -2.575276, 1, 1, 1, 1, 1,
-0.4254035, -0.5144342, -1.993998, 1, 1, 1, 1, 1,
-0.4209453, -0.3101387, -1.559788, 1, 1, 1, 1, 1,
-0.4186348, -0.5724252, -2.958694, 1, 1, 1, 1, 1,
-0.4185858, -0.7055855, -2.880728, 1, 1, 1, 1, 1,
-0.4176052, 1.143543, -1.183775, 0, 0, 1, 1, 1,
-0.4130434, -0.3960269, -1.499862, 1, 0, 0, 1, 1,
-0.4127311, -1.52729, -2.908006, 1, 0, 0, 1, 1,
-0.4102465, -0.8248394, -5.270662, 1, 0, 0, 1, 1,
-0.4089962, -1.143634, -3.456634, 1, 0, 0, 1, 1,
-0.4083968, -1.360788, -1.986135, 1, 0, 0, 1, 1,
-0.3989062, -0.325882, -1.597726, 0, 0, 0, 1, 1,
-0.3975982, -0.1853576, -1.809081, 0, 0, 0, 1, 1,
-0.3925631, 0.2499828, -0.1621366, 0, 0, 0, 1, 1,
-0.3873329, 0.9137115, 0.1687482, 0, 0, 0, 1, 1,
-0.3872893, -0.7257429, 0.002876397, 0, 0, 0, 1, 1,
-0.3799897, 0.7603386, -0.6419776, 0, 0, 0, 1, 1,
-0.3782061, 0.3950648, -0.3248315, 0, 0, 0, 1, 1,
-0.3752038, -1.379184, -2.010593, 1, 1, 1, 1, 1,
-0.3731176, 2.296964, 0.9131314, 1, 1, 1, 1, 1,
-0.3704243, -1.112385, -2.548694, 1, 1, 1, 1, 1,
-0.3690055, -0.9818915, -1.99662, 1, 1, 1, 1, 1,
-0.3673403, 2.193543, 2.058825, 1, 1, 1, 1, 1,
-0.3661443, 0.5824843, 0.4300035, 1, 1, 1, 1, 1,
-0.3657482, 1.725148, 0.4119286, 1, 1, 1, 1, 1,
-0.364477, -1.327299, -3.403215, 1, 1, 1, 1, 1,
-0.3624444, 1.160168, -0.9059933, 1, 1, 1, 1, 1,
-0.3612378, -0.8259721, -2.812407, 1, 1, 1, 1, 1,
-0.3603843, -1.026536, -0.9680106, 1, 1, 1, 1, 1,
-0.3592393, -0.8877425, -2.926462, 1, 1, 1, 1, 1,
-0.354339, -0.02979722, -1.128772, 1, 1, 1, 1, 1,
-0.3427381, 0.2574092, -0.8877568, 1, 1, 1, 1, 1,
-0.3410952, 1.272448, 0.3274982, 1, 1, 1, 1, 1,
-0.3341323, 0.3085445, -0.573836, 0, 0, 1, 1, 1,
-0.3317316, -0.3071466, -1.498241, 1, 0, 0, 1, 1,
-0.331493, 0.4024678, -1.127727, 1, 0, 0, 1, 1,
-0.3287959, 0.6043166, -0.8061044, 1, 0, 0, 1, 1,
-0.328731, -0.1456937, -2.778644, 1, 0, 0, 1, 1,
-0.3286786, 1.229617, 1.139043, 1, 0, 0, 1, 1,
-0.3267199, -0.1972229, -2.849186, 0, 0, 0, 1, 1,
-0.3249704, 1.306655, -1.821623, 0, 0, 0, 1, 1,
-0.3240101, 1.248101, -0.8374087, 0, 0, 0, 1, 1,
-0.3235811, 0.3259692, -1.806735, 0, 0, 0, 1, 1,
-0.3127967, 0.154166, -0.8822128, 0, 0, 0, 1, 1,
-0.3124524, -1.308521, -2.888892, 0, 0, 0, 1, 1,
-0.3115987, 1.469762, 0.9529634, 0, 0, 0, 1, 1,
-0.3112119, 0.8744295, -1.36474, 1, 1, 1, 1, 1,
-0.3069778, -0.07848544, -3.232995, 1, 1, 1, 1, 1,
-0.3067195, -1.736021, -2.924237, 1, 1, 1, 1, 1,
-0.3043663, 0.3739341, 1.18292, 1, 1, 1, 1, 1,
-0.3043086, -0.6874944, -1.7669, 1, 1, 1, 1, 1,
-0.3036092, -0.03695398, -2.351051, 1, 1, 1, 1, 1,
-0.3013479, -0.04973735, -2.377718, 1, 1, 1, 1, 1,
-0.2967017, 1.966004, -1.210933, 1, 1, 1, 1, 1,
-0.2952631, 0.8775063, 0.3897852, 1, 1, 1, 1, 1,
-0.294884, -0.7426946, -1.167581, 1, 1, 1, 1, 1,
-0.2944893, -1.927361, -2.960742, 1, 1, 1, 1, 1,
-0.29224, 0.4235876, 0.4756234, 1, 1, 1, 1, 1,
-0.290935, -0.8057218, -3.457859, 1, 1, 1, 1, 1,
-0.2893349, 0.4243196, -1.846889, 1, 1, 1, 1, 1,
-0.2782372, -0.4240373, -3.364416, 1, 1, 1, 1, 1,
-0.2742603, -1.116149, -0.9123839, 0, 0, 1, 1, 1,
-0.272586, -0.9987732, -4.719188, 1, 0, 0, 1, 1,
-0.2720098, -1.277237, -1.40931, 1, 0, 0, 1, 1,
-0.2698477, -0.26416, -3.706961, 1, 0, 0, 1, 1,
-0.267024, -0.9021059, -1.941078, 1, 0, 0, 1, 1,
-0.2596477, 0.3146894, -0.4933696, 1, 0, 0, 1, 1,
-0.257866, 2.380596, -0.53986, 0, 0, 0, 1, 1,
-0.2576029, -0.9338524, -3.447681, 0, 0, 0, 1, 1,
-0.2560889, -0.9012954, -2.54635, 0, 0, 0, 1, 1,
-0.2555876, 0.1685235, -0.3141124, 0, 0, 0, 1, 1,
-0.2513489, 0.1719492, -0.3235447, 0, 0, 0, 1, 1,
-0.2509553, 0.1048908, -1.06472, 0, 0, 0, 1, 1,
-0.2483427, -1.53057, -1.395679, 0, 0, 0, 1, 1,
-0.248251, 0.1067787, -2.481387, 1, 1, 1, 1, 1,
-0.2455593, 0.8208258, 0.01798028, 1, 1, 1, 1, 1,
-0.2435579, -0.2923471, -2.83198, 1, 1, 1, 1, 1,
-0.2427036, -0.6119137, -4.217938, 1, 1, 1, 1, 1,
-0.2416491, -0.5586702, -5.308306, 1, 1, 1, 1, 1,
-0.2409962, -0.332266, -4.245124, 1, 1, 1, 1, 1,
-0.2409454, 0.6437578, -0.9610716, 1, 1, 1, 1, 1,
-0.2404184, -0.3685284, -1.157917, 1, 1, 1, 1, 1,
-0.2290616, -0.283974, -1.820161, 1, 1, 1, 1, 1,
-0.228916, -0.463313, -3.63424, 1, 1, 1, 1, 1,
-0.225806, -1.18371, -3.731928, 1, 1, 1, 1, 1,
-0.2256525, 2.324489, 2.055872, 1, 1, 1, 1, 1,
-0.2252712, 2.015629, -0.9165526, 1, 1, 1, 1, 1,
-0.222963, -0.9426818, -4.987238, 1, 1, 1, 1, 1,
-0.2218619, 0.4333984, -0.1615312, 1, 1, 1, 1, 1,
-0.2197652, 0.5392324, -0.3416936, 0, 0, 1, 1, 1,
-0.2194091, 0.6634502, 0.7230333, 1, 0, 0, 1, 1,
-0.2184257, 0.1668056, 0.6271421, 1, 0, 0, 1, 1,
-0.2104793, -1.034159, -2.58033, 1, 0, 0, 1, 1,
-0.2069416, -1.105796, -4.414167, 1, 0, 0, 1, 1,
-0.205774, 0.09938941, -2.091136, 1, 0, 0, 1, 1,
-0.2014717, 0.8675429, -0.211149, 0, 0, 0, 1, 1,
-0.2006808, -1.54644, -2.315172, 0, 0, 0, 1, 1,
-0.1941111, -0.8456956, -4.7391, 0, 0, 0, 1, 1,
-0.1909696, -0.2145997, -2.77632, 0, 0, 0, 1, 1,
-0.1909439, -0.4754333, -1.979688, 0, 0, 0, 1, 1,
-0.1863165, 1.802877, 0.3646384, 0, 0, 0, 1, 1,
-0.1856553, 0.7908, 1.61124, 0, 0, 0, 1, 1,
-0.1844735, 1.392788, -1.248746, 1, 1, 1, 1, 1,
-0.1840443, 0.4789407, -1.201338, 1, 1, 1, 1, 1,
-0.1837706, 2.409707, 0.9300712, 1, 1, 1, 1, 1,
-0.1835321, 0.5130036, -0.6210699, 1, 1, 1, 1, 1,
-0.1793516, -0.7675742, -3.39132, 1, 1, 1, 1, 1,
-0.1764699, -0.417634, -3.134776, 1, 1, 1, 1, 1,
-0.1702855, 0.2223504, -0.7243946, 1, 1, 1, 1, 1,
-0.1687287, -0.07459537, -2.128081, 1, 1, 1, 1, 1,
-0.1666885, -0.7911684, -5.177081, 1, 1, 1, 1, 1,
-0.1644626, -0.332325, -0.7698521, 1, 1, 1, 1, 1,
-0.1635614, -1.205811, -3.240521, 1, 1, 1, 1, 1,
-0.1628564, -1.022588, -3.577955, 1, 1, 1, 1, 1,
-0.1573278, -0.7214802, -5.001587, 1, 1, 1, 1, 1,
-0.1567016, 1.720175, 1.398884, 1, 1, 1, 1, 1,
-0.1556617, 0.6365875, 0.01888886, 1, 1, 1, 1, 1,
-0.1552731, -0.9628661, -3.211018, 0, 0, 1, 1, 1,
-0.1534045, 0.0590127, -3.493314, 1, 0, 0, 1, 1,
-0.1518508, 2.175461, -2.02031, 1, 0, 0, 1, 1,
-0.1501022, -0.2642362, -1.879555, 1, 0, 0, 1, 1,
-0.1489232, 1.701341, -1.433938, 1, 0, 0, 1, 1,
-0.1474329, -0.5226248, -4.26151, 1, 0, 0, 1, 1,
-0.1466602, -0.1367072, -2.240521, 0, 0, 0, 1, 1,
-0.1460334, 0.6095885, -0.1949215, 0, 0, 0, 1, 1,
-0.1447161, -1.424014, -1.575389, 0, 0, 0, 1, 1,
-0.1354931, -0.8592602, -1.899253, 0, 0, 0, 1, 1,
-0.135308, 2.933251, -0.5827823, 0, 0, 0, 1, 1,
-0.1329777, 0.9596338, 0.2782371, 0, 0, 0, 1, 1,
-0.132725, -0.2141961, -1.925797, 0, 0, 0, 1, 1,
-0.1320536, 0.4007103, 0.01376097, 1, 1, 1, 1, 1,
-0.1302119, -0.4144808, -3.737607, 1, 1, 1, 1, 1,
-0.1260953, 0.9931411, 0.8294955, 1, 1, 1, 1, 1,
-0.1253417, -0.3922743, -2.12795, 1, 1, 1, 1, 1,
-0.1185617, 1.846063, 0.1349701, 1, 1, 1, 1, 1,
-0.1174166, -0.6273569, -3.505123, 1, 1, 1, 1, 1,
-0.1173114, 1.651333, 0.344409, 1, 1, 1, 1, 1,
-0.1136625, -1.023257, -3.214761, 1, 1, 1, 1, 1,
-0.1122226, 1.575055, -1.48209, 1, 1, 1, 1, 1,
-0.1102299, -1.478162, -2.440738, 1, 1, 1, 1, 1,
-0.1079735, -0.3783301, -3.069872, 1, 1, 1, 1, 1,
-0.107126, 1.238793, -0.9273445, 1, 1, 1, 1, 1,
-0.1032102, 0.1785041, -0.4105838, 1, 1, 1, 1, 1,
-0.09825102, 0.8033905, -1.335854, 1, 1, 1, 1, 1,
-0.0961297, 0.5089771, 0.2839111, 1, 1, 1, 1, 1,
-0.09040996, -0.2612524, -2.691603, 0, 0, 1, 1, 1,
-0.08638208, 0.1355395, -0.8308343, 1, 0, 0, 1, 1,
-0.08325163, 0.826444, -1.945152, 1, 0, 0, 1, 1,
-0.08322039, -0.552054, -3.601171, 1, 0, 0, 1, 1,
-0.08130673, 0.167682, -0.9061847, 1, 0, 0, 1, 1,
-0.07999972, 0.7332494, 0.3716091, 1, 0, 0, 1, 1,
-0.07897948, 0.4943464, 0.8303191, 0, 0, 0, 1, 1,
-0.06722077, -0.8175498, -4.049929, 0, 0, 0, 1, 1,
-0.06614085, 1.037393, 0.6928333, 0, 0, 0, 1, 1,
-0.06530435, -1.223898, -2.590551, 0, 0, 0, 1, 1,
-0.06410209, -0.3147812, -2.027478, 0, 0, 0, 1, 1,
-0.06279771, -0.853483, -2.052628, 0, 0, 0, 1, 1,
-0.06098394, 1.383034, -1.515028, 0, 0, 0, 1, 1,
-0.06095061, 0.4020837, 0.3028904, 1, 1, 1, 1, 1,
-0.05964829, -1.573054, -3.260257, 1, 1, 1, 1, 1,
-0.05800214, 0.3411603, -1.025464, 1, 1, 1, 1, 1,
-0.05742259, -0.7640446, -2.327784, 1, 1, 1, 1, 1,
-0.05348037, 0.4617402, -0.6497533, 1, 1, 1, 1, 1,
-0.05338081, -0.8203232, -3.143115, 1, 1, 1, 1, 1,
-0.04745136, 0.4962568, 0.04701325, 1, 1, 1, 1, 1,
-0.04444559, -1.87961, -2.4801, 1, 1, 1, 1, 1,
-0.04330216, -0.4317103, -2.993314, 1, 1, 1, 1, 1,
-0.0390675, 0.435954, 1.163939, 1, 1, 1, 1, 1,
-0.02976127, -1.772518, -3.417982, 1, 1, 1, 1, 1,
-0.028393, -0.6925548, -2.371942, 1, 1, 1, 1, 1,
-0.02808333, -1.437403, -4.247069, 1, 1, 1, 1, 1,
-0.02793778, -1.797323, -3.870312, 1, 1, 1, 1, 1,
-0.01537766, -1.113679, -2.073546, 1, 1, 1, 1, 1,
-0.01150253, 1.123158, 1.628192, 0, 0, 1, 1, 1,
-0.009914959, 0.289892, 0.4953452, 1, 0, 0, 1, 1,
-0.009737176, -0.882832, -2.943821, 1, 0, 0, 1, 1,
-0.008219263, -0.7086347, -1.828893, 1, 0, 0, 1, 1,
-0.002845067, 0.4005963, 0.5106786, 1, 0, 0, 1, 1,
-0.0003441343, 1.321153, 0.2631699, 1, 0, 0, 1, 1,
0.0008903194, -1.685677, 2.25625, 0, 0, 0, 1, 1,
0.004519948, -0.4888791, 3.248185, 0, 0, 0, 1, 1,
0.007245687, 1.165223, 0.9727185, 0, 0, 0, 1, 1,
0.007267836, 0.5269192, 0.1584288, 0, 0, 0, 1, 1,
0.008021984, 0.216911, -0.7974943, 0, 0, 0, 1, 1,
0.009345766, -0.5725161, 3.709374, 0, 0, 0, 1, 1,
0.01272437, -0.3749222, 3.501688, 0, 0, 0, 1, 1,
0.01569931, -2.31206, 4.238083, 1, 1, 1, 1, 1,
0.01758266, 0.4668627, 1.34478, 1, 1, 1, 1, 1,
0.02270149, -1.477391, 3.691724, 1, 1, 1, 1, 1,
0.02489019, -0.6070652, 3.32569, 1, 1, 1, 1, 1,
0.02687558, 0.05878665, -0.7305045, 1, 1, 1, 1, 1,
0.02767625, 0.6229348, -1.32467, 1, 1, 1, 1, 1,
0.02791917, -1.322956, 3.082225, 1, 1, 1, 1, 1,
0.0314201, -0.003077359, 0.7196832, 1, 1, 1, 1, 1,
0.03438433, 0.08272029, 0.729084, 1, 1, 1, 1, 1,
0.03709939, 1.64165, -1.644722, 1, 1, 1, 1, 1,
0.03796053, 0.2575282, 1.234779, 1, 1, 1, 1, 1,
0.04543503, -1.152539, 4.441252, 1, 1, 1, 1, 1,
0.04668675, 0.7933977, 0.3839725, 1, 1, 1, 1, 1,
0.04679801, -1.668542, 1.224259, 1, 1, 1, 1, 1,
0.04720036, -0.2248251, 4.712406, 1, 1, 1, 1, 1,
0.05196678, 0.189598, 0.09096359, 0, 0, 1, 1, 1,
0.05252394, 0.500794, 1.135337, 1, 0, 0, 1, 1,
0.05620907, 0.3393757, -0.3866765, 1, 0, 0, 1, 1,
0.05786653, 0.7571263, 0.3176927, 1, 0, 0, 1, 1,
0.05919244, 1.166486, 0.7453772, 1, 0, 0, 1, 1,
0.0635676, 0.2074417, 1.146033, 1, 0, 0, 1, 1,
0.06572019, -1.19969, 3.400124, 0, 0, 0, 1, 1,
0.06614878, 0.6863907, -0.7022265, 0, 0, 0, 1, 1,
0.06905279, 0.3806851, 0.3450166, 0, 0, 0, 1, 1,
0.0748961, 2.73375, -1.008874, 0, 0, 0, 1, 1,
0.079183, 1.089249, 0.5186399, 0, 0, 0, 1, 1,
0.08187713, -0.2963817, 3.182903, 0, 0, 0, 1, 1,
0.09025511, -0.8144709, 3.523079, 0, 0, 0, 1, 1,
0.09390316, -0.01713702, 2.423849, 1, 1, 1, 1, 1,
0.09769052, 0.2787212, -0.9951566, 1, 1, 1, 1, 1,
0.09830324, -0.2621544, 1.768363, 1, 1, 1, 1, 1,
0.09884918, 0.3885049, 0.4731855, 1, 1, 1, 1, 1,
0.0993496, -0.056998, 1.442745, 1, 1, 1, 1, 1,
0.1045237, -1.657391, 4.419691, 1, 1, 1, 1, 1,
0.1081886, -0.872196, 3.270088, 1, 1, 1, 1, 1,
0.1104195, -1.149572, 2.193645, 1, 1, 1, 1, 1,
0.1121962, -1.033294, 2.919815, 1, 1, 1, 1, 1,
0.1124409, 1.490548, 0.9786094, 1, 1, 1, 1, 1,
0.1159965, -0.1558476, 2.343616, 1, 1, 1, 1, 1,
0.1199278, 0.0470677, -0.04932762, 1, 1, 1, 1, 1,
0.1221829, -0.8086099, 3.54262, 1, 1, 1, 1, 1,
0.12426, -1.641459, 3.56397, 1, 1, 1, 1, 1,
0.1265111, -0.08058649, 1.537566, 1, 1, 1, 1, 1,
0.1286404, 1.261522, 0.2412137, 0, 0, 1, 1, 1,
0.1299836, 0.6791882, -0.2289848, 1, 0, 0, 1, 1,
0.1318012, -0.09789757, 3.770716, 1, 0, 0, 1, 1,
0.1335989, -0.05136503, 1.843672, 1, 0, 0, 1, 1,
0.1353538, -0.1248687, 2.221345, 1, 0, 0, 1, 1,
0.1400503, 1.685591, -0.009239127, 1, 0, 0, 1, 1,
0.1408436, -1.778849, 4.102194, 0, 0, 0, 1, 1,
0.1435222, 0.1706989, 0.9461741, 0, 0, 0, 1, 1,
0.1451121, -1.399128, 3.50872, 0, 0, 0, 1, 1,
0.1481395, 0.1961275, 1.704558, 0, 0, 0, 1, 1,
0.1498117, -0.1550151, 3.714434, 0, 0, 0, 1, 1,
0.1509069, -1.614972, 4.265512, 0, 0, 0, 1, 1,
0.1553424, 0.09293293, 1.017058, 0, 0, 0, 1, 1,
0.1569828, -0.5565701, 3.095231, 1, 1, 1, 1, 1,
0.1575191, 0.2476472, 1.113371, 1, 1, 1, 1, 1,
0.1600529, 0.3592283, -1.314436, 1, 1, 1, 1, 1,
0.1665573, 0.5652069, 1.458154, 1, 1, 1, 1, 1,
0.1693327, -1.641667, 4.203933, 1, 1, 1, 1, 1,
0.1717352, 0.5069088, 0.6283479, 1, 1, 1, 1, 1,
0.1724055, -0.283583, -0.7546031, 1, 1, 1, 1, 1,
0.1738067, 0.6380817, 1.30406, 1, 1, 1, 1, 1,
0.1739922, -0.9115209, 1.115602, 1, 1, 1, 1, 1,
0.1817755, 1.766565, 0.3268771, 1, 1, 1, 1, 1,
0.1817809, 0.4678832, 0.02502957, 1, 1, 1, 1, 1,
0.1857878, 0.4823076, 0.5090722, 1, 1, 1, 1, 1,
0.1861401, 0.6953911, 1.686792, 1, 1, 1, 1, 1,
0.1873748, -0.4072994, 2.148985, 1, 1, 1, 1, 1,
0.1948168, 0.5200498, 1.895547, 1, 1, 1, 1, 1,
0.2028948, 1.360366, 1.823299, 0, 0, 1, 1, 1,
0.2030564, -0.7773379, 2.550067, 1, 0, 0, 1, 1,
0.2099505, -2.168234, 1.85304, 1, 0, 0, 1, 1,
0.2101309, -1.126647, 2.440434, 1, 0, 0, 1, 1,
0.2170153, 0.3920496, 2.414219, 1, 0, 0, 1, 1,
0.2190305, 0.8945562, 1.302666, 1, 0, 0, 1, 1,
0.2192285, 0.01258304, 1.574915, 0, 0, 0, 1, 1,
0.2204954, 0.312202, 0.1776811, 0, 0, 0, 1, 1,
0.2221737, 1.213606, 0.2766701, 0, 0, 0, 1, 1,
0.2230317, 1.462098, -1.025058, 0, 0, 0, 1, 1,
0.2266118, 0.1205079, 0.2865566, 0, 0, 0, 1, 1,
0.2285626, 0.1747096, -1.594743, 0, 0, 0, 1, 1,
0.2287181, -0.5527046, 4.265584, 0, 0, 0, 1, 1,
0.2310546, -0.8424616, 1.223685, 1, 1, 1, 1, 1,
0.234542, 0.0003147697, 1.315725, 1, 1, 1, 1, 1,
0.2363928, -1.194019, 3.36053, 1, 1, 1, 1, 1,
0.2378689, -2.328408, 1.55558, 1, 1, 1, 1, 1,
0.2397197, 0.1424597, 0.9849999, 1, 1, 1, 1, 1,
0.2397619, -0.0586242, 1.682754, 1, 1, 1, 1, 1,
0.2405619, 0.1336304, -0.1621978, 1, 1, 1, 1, 1,
0.2408749, 0.4177268, 2.018921, 1, 1, 1, 1, 1,
0.2423534, 1.107165, 1.028506, 1, 1, 1, 1, 1,
0.2430993, 0.2537892, -0.9609264, 1, 1, 1, 1, 1,
0.24353, 2.468295, -0.4720166, 1, 1, 1, 1, 1,
0.247619, 0.5268448, 2.080244, 1, 1, 1, 1, 1,
0.2487155, -0.02658912, 3.707191, 1, 1, 1, 1, 1,
0.2498289, 0.03730691, 1.183675, 1, 1, 1, 1, 1,
0.2501839, 0.4363456, -0.06844096, 1, 1, 1, 1, 1,
0.2502736, -0.650206, 2.099913, 0, 0, 1, 1, 1,
0.2516918, -0.05438225, 1.949692, 1, 0, 0, 1, 1,
0.2533208, -1.828209, 3.420983, 1, 0, 0, 1, 1,
0.2552448, 0.9326441, -0.4927468, 1, 0, 0, 1, 1,
0.2558915, 0.4867523, 0.4270977, 1, 0, 0, 1, 1,
0.2559972, 0.4025565, 1.765056, 1, 0, 0, 1, 1,
0.256069, 1.009513, 0.8882452, 0, 0, 0, 1, 1,
0.2571931, 2.349642, 0.3376887, 0, 0, 0, 1, 1,
0.2629847, 0.4101902, 1.560884, 0, 0, 0, 1, 1,
0.2634975, 1.641417, 0.8009707, 0, 0, 0, 1, 1,
0.2667812, 0.6403082, 2.235207, 0, 0, 0, 1, 1,
0.2671149, 1.060976, -1.265712, 0, 0, 0, 1, 1,
0.2683913, -0.2878428, 2.528588, 0, 0, 0, 1, 1,
0.2736996, -1.629793, 3.637614, 1, 1, 1, 1, 1,
0.2765175, -0.7034398, 4.197257, 1, 1, 1, 1, 1,
0.2777894, -1.989013, 3.725657, 1, 1, 1, 1, 1,
0.2783709, -0.4657037, 4.134741, 1, 1, 1, 1, 1,
0.2794573, 0.6393373, -0.7129055, 1, 1, 1, 1, 1,
0.2842714, 1.124579, 0.02933816, 1, 1, 1, 1, 1,
0.2866365, -0.6569403, 3.111141, 1, 1, 1, 1, 1,
0.2935902, -0.2229917, 0.9258632, 1, 1, 1, 1, 1,
0.2941528, -0.7848353, 1.892124, 1, 1, 1, 1, 1,
0.2947986, -1.52649, 3.716036, 1, 1, 1, 1, 1,
0.3010006, -0.4796939, 2.137564, 1, 1, 1, 1, 1,
0.3045112, -0.182631, 2.037781, 1, 1, 1, 1, 1,
0.3071736, -1.285527, 3.525039, 1, 1, 1, 1, 1,
0.3127456, 0.8678763, 1.521681, 1, 1, 1, 1, 1,
0.3129419, -1.607107, 3.360744, 1, 1, 1, 1, 1,
0.3144669, -0.7921713, 2.069044, 0, 0, 1, 1, 1,
0.3144996, -1.265265, 5.324857, 1, 0, 0, 1, 1,
0.3228621, 0.9905131, 1.763151, 1, 0, 0, 1, 1,
0.3250682, -0.8008503, 2.527436, 1, 0, 0, 1, 1,
0.3369323, 0.6801522, -1.364435, 1, 0, 0, 1, 1,
0.3394339, -0.2610842, 2.379722, 1, 0, 0, 1, 1,
0.3421507, -1.798955, 3.4008, 0, 0, 0, 1, 1,
0.3430984, 0.170717, 1.145764, 0, 0, 0, 1, 1,
0.344835, -1.086766, 2.570529, 0, 0, 0, 1, 1,
0.3471445, 1.0337, 1.812292, 0, 0, 0, 1, 1,
0.3585434, -0.9930321, 3.552864, 0, 0, 0, 1, 1,
0.3646831, 0.01141977, 1.076194, 0, 0, 0, 1, 1,
0.3677731, -0.621208, 1.829338, 0, 0, 0, 1, 1,
0.3681646, 0.3799383, -0.01945349, 1, 1, 1, 1, 1,
0.3695924, 0.7261937, 0.4616169, 1, 1, 1, 1, 1,
0.3769314, -0.9452679, 2.671645, 1, 1, 1, 1, 1,
0.3772486, 0.5576931, -0.2183365, 1, 1, 1, 1, 1,
0.3839006, 1.115036, 0.119082, 1, 1, 1, 1, 1,
0.3842348, -0.1751781, 1.619605, 1, 1, 1, 1, 1,
0.3881621, 0.08996087, 0.4688016, 1, 1, 1, 1, 1,
0.388816, 0.1117907, 0.722146, 1, 1, 1, 1, 1,
0.3934387, 0.4362835, -0.2489975, 1, 1, 1, 1, 1,
0.3945063, 1.113391, 0.530983, 1, 1, 1, 1, 1,
0.3969308, -2.3221, 3.573163, 1, 1, 1, 1, 1,
0.3970189, 0.9111559, -2.569591, 1, 1, 1, 1, 1,
0.3980643, -1.51874, 4.891996, 1, 1, 1, 1, 1,
0.3994538, -0.6633065, 2.909604, 1, 1, 1, 1, 1,
0.4050917, 1.792035, -0.4681305, 1, 1, 1, 1, 1,
0.4088523, -0.1864089, 1.102358, 0, 0, 1, 1, 1,
0.4106096, -1.569094, 1.328389, 1, 0, 0, 1, 1,
0.4113818, -0.6573638, 2.386448, 1, 0, 0, 1, 1,
0.4128211, -0.8367541, 1.718176, 1, 0, 0, 1, 1,
0.4135816, 1.02366, 0.1886504, 1, 0, 0, 1, 1,
0.4167997, 0.9214371, 2.515669, 1, 0, 0, 1, 1,
0.4191702, -0.02144098, 2.582489, 0, 0, 0, 1, 1,
0.4196073, -0.5770475, 2.416136, 0, 0, 0, 1, 1,
0.4240757, -0.04168822, 1.548472, 0, 0, 0, 1, 1,
0.4265985, -0.1091986, 1.063112, 0, 0, 0, 1, 1,
0.4310841, -0.4257497, 2.892637, 0, 0, 0, 1, 1,
0.4371385, 0.2630191, 0.6697093, 0, 0, 0, 1, 1,
0.4382672, -2.689129, 4.302003, 0, 0, 0, 1, 1,
0.4388838, -1.25367, 3.60387, 1, 1, 1, 1, 1,
0.4400388, -0.1676279, 3.493666, 1, 1, 1, 1, 1,
0.4473749, 0.7348562, -0.2330091, 1, 1, 1, 1, 1,
0.4496347, 0.03347677, 1.911423, 1, 1, 1, 1, 1,
0.4544849, 1.160634, -0.1371319, 1, 1, 1, 1, 1,
0.4611036, 0.3960938, 0.6108814, 1, 1, 1, 1, 1,
0.4666199, -0.2254426, 3.733095, 1, 1, 1, 1, 1,
0.4666546, 1.686299, 2.220677, 1, 1, 1, 1, 1,
0.4689575, -1.816816, 2.559865, 1, 1, 1, 1, 1,
0.4694636, 0.5435817, -0.4089313, 1, 1, 1, 1, 1,
0.4737194, 0.1716058, 0.979156, 1, 1, 1, 1, 1,
0.47389, -0.2092711, 2.064434, 1, 1, 1, 1, 1,
0.4751635, 1.482392, -0.8354436, 1, 1, 1, 1, 1,
0.475261, -2.508059, 4.265598, 1, 1, 1, 1, 1,
0.4817913, 0.1055165, 1.705904, 1, 1, 1, 1, 1,
0.4867923, 0.6324446, 1.720147, 0, 0, 1, 1, 1,
0.4923331, 1.058974, 0.7935831, 1, 0, 0, 1, 1,
0.4959296, 0.7134233, 1.703347, 1, 0, 0, 1, 1,
0.5021976, -1.062616, 3.077379, 1, 0, 0, 1, 1,
0.5030084, 0.3485557, 0.8326424, 1, 0, 0, 1, 1,
0.5031163, -0.2301014, 2.565976, 1, 0, 0, 1, 1,
0.5031237, -0.07571077, 1.63694, 0, 0, 0, 1, 1,
0.5059017, -2.248051, 3.557549, 0, 0, 0, 1, 1,
0.507323, -0.5629808, 2.982645, 0, 0, 0, 1, 1,
0.5118141, 1.151068, -0.2140251, 0, 0, 0, 1, 1,
0.5132136, -0.6749866, 2.450938, 0, 0, 0, 1, 1,
0.5187055, -0.4391701, 4.09308, 0, 0, 0, 1, 1,
0.5207334, -0.9047007, 1.099411, 0, 0, 0, 1, 1,
0.523106, -0.6102079, 1.992673, 1, 1, 1, 1, 1,
0.5249786, 1.778718, 1.088638, 1, 1, 1, 1, 1,
0.526738, -1.726457, 4.474545, 1, 1, 1, 1, 1,
0.5269235, -0.7704549, 3.154164, 1, 1, 1, 1, 1,
0.5409124, -0.4828001, 1.997021, 1, 1, 1, 1, 1,
0.5417719, -1.197151, 2.846373, 1, 1, 1, 1, 1,
0.5432537, -0.8994721, 1.548294, 1, 1, 1, 1, 1,
0.5471532, 0.09804634, 0.7056859, 1, 1, 1, 1, 1,
0.5554555, -0.4192415, 2.47565, 1, 1, 1, 1, 1,
0.5606046, 0.5908201, -0.06413639, 1, 1, 1, 1, 1,
0.5702989, -0.8834856, 3.189135, 1, 1, 1, 1, 1,
0.5717412, -0.9100783, 1.84418, 1, 1, 1, 1, 1,
0.5725202, 0.4979413, 1.731525, 1, 1, 1, 1, 1,
0.5736386, 1.084445, 0.5192032, 1, 1, 1, 1, 1,
0.5777532, -0.5442138, 2.46988, 1, 1, 1, 1, 1,
0.5803946, -0.7231026, 2.71665, 0, 0, 1, 1, 1,
0.5847847, -0.1642354, 0.9789928, 1, 0, 0, 1, 1,
0.5876078, 1.754205, -0.6943393, 1, 0, 0, 1, 1,
0.5917438, 0.8866012, -0.3216361, 1, 0, 0, 1, 1,
0.6017144, 0.05976979, 1.542018, 1, 0, 0, 1, 1,
0.6034501, -1.475376, 2.499169, 1, 0, 0, 1, 1,
0.6049159, 0.1386158, 0.3227317, 0, 0, 0, 1, 1,
0.6049849, -0.7597411, 1.649484, 0, 0, 0, 1, 1,
0.6242519, -0.1042116, 3.059875, 0, 0, 0, 1, 1,
0.6252499, -0.4995213, 2.922997, 0, 0, 0, 1, 1,
0.6292037, -1.592414, 3.288838, 0, 0, 0, 1, 1,
0.6408406, 0.4170169, 1.786239, 0, 0, 0, 1, 1,
0.6421253, 1.136799, 1.112987, 0, 0, 0, 1, 1,
0.6478614, -1.338645, 3.052407, 1, 1, 1, 1, 1,
0.6482838, 0.05703939, 3.19676, 1, 1, 1, 1, 1,
0.6491448, 0.2099241, 0.1335606, 1, 1, 1, 1, 1,
0.6494972, -0.4508771, 3.655035, 1, 1, 1, 1, 1,
0.6541148, -1.080312, 3.258763, 1, 1, 1, 1, 1,
0.6594581, -0.613649, 2.831216, 1, 1, 1, 1, 1,
0.6623141, -1.137053, 3.523685, 1, 1, 1, 1, 1,
0.667905, 0.272988, 1.891345, 1, 1, 1, 1, 1,
0.6727356, 1.425157, -0.4177429, 1, 1, 1, 1, 1,
0.6740893, 0.9094087, 0.7754142, 1, 1, 1, 1, 1,
0.676856, -1.880274, 4.789968, 1, 1, 1, 1, 1,
0.6919097, 0.9565009, -0.4169109, 1, 1, 1, 1, 1,
0.7033576, -0.13369, 1.078178, 1, 1, 1, 1, 1,
0.7051023, -0.7763795, 2.365853, 1, 1, 1, 1, 1,
0.7094687, 0.8472146, 1.269586, 1, 1, 1, 1, 1,
0.7116645, -0.8192872, 1.4684, 0, 0, 1, 1, 1,
0.7150579, -0.07957234, 1.077654, 1, 0, 0, 1, 1,
0.7223899, -0.02724631, 0.4171174, 1, 0, 0, 1, 1,
0.7280025, 0.1746845, 2.295306, 1, 0, 0, 1, 1,
0.731939, 0.7716698, 0.2792679, 1, 0, 0, 1, 1,
0.7322513, 0.09160624, 2.160444, 1, 0, 0, 1, 1,
0.7331557, 0.2081467, 1.997567, 0, 0, 0, 1, 1,
0.7381479, -1.148984, 2.53026, 0, 0, 0, 1, 1,
0.7464482, 0.192454, -0.007865919, 0, 0, 0, 1, 1,
0.7524415, -0.1952084, 1.670022, 0, 0, 0, 1, 1,
0.7544462, 1.244843, 1.464415, 0, 0, 0, 1, 1,
0.7549976, -2.543778, 3.155102, 0, 0, 0, 1, 1,
0.7573453, -0.2309781, 2.427397, 0, 0, 0, 1, 1,
0.7586941, -0.8010523, 0.8699049, 1, 1, 1, 1, 1,
0.7657136, 0.2427106, 1.07023, 1, 1, 1, 1, 1,
0.7792343, -0.3946561, 3.050661, 1, 1, 1, 1, 1,
0.7917466, 2.435799, -0.02746447, 1, 1, 1, 1, 1,
0.8017548, -2.277408, 1.309581, 1, 1, 1, 1, 1,
0.8048736, 0.3093152, 1.309547, 1, 1, 1, 1, 1,
0.806184, 0.1257707, 0.3711027, 1, 1, 1, 1, 1,
0.8069044, 0.5793748, 1.344345, 1, 1, 1, 1, 1,
0.8100504, -1.500156, 2.264293, 1, 1, 1, 1, 1,
0.8130362, -0.4596753, 1.215032, 1, 1, 1, 1, 1,
0.8141596, 1.210764, 0.9403801, 1, 1, 1, 1, 1,
0.8216216, -0.95671, 4.102901, 1, 1, 1, 1, 1,
0.8303658, 0.8403941, 1.301493, 1, 1, 1, 1, 1,
0.8371941, 1.323293, -0.2473577, 1, 1, 1, 1, 1,
0.8463503, -0.006542781, 1.826914, 1, 1, 1, 1, 1,
0.8495964, -0.354652, 0.6909496, 0, 0, 1, 1, 1,
0.8535869, 0.5506585, 2.00154, 1, 0, 0, 1, 1,
0.8540587, -0.7167352, 1.689295, 1, 0, 0, 1, 1,
0.854318, 0.2809772, 1.985863, 1, 0, 0, 1, 1,
0.8602509, 0.9157109, 0.1685427, 1, 0, 0, 1, 1,
0.8638278, 1.517516, 1.03234, 1, 0, 0, 1, 1,
0.8688022, 1.487254, 0.37909, 0, 0, 0, 1, 1,
0.8766633, 1.754916, 0.1239983, 0, 0, 0, 1, 1,
0.8783211, 1.141227, 2.451539, 0, 0, 0, 1, 1,
0.8857451, -2.649356, 1.941803, 0, 0, 0, 1, 1,
0.8863354, 0.9050347, 1.256505, 0, 0, 0, 1, 1,
0.8902515, 0.9060898, 1.758357, 0, 0, 0, 1, 1,
0.8930716, 0.745177, 1.195157, 0, 0, 0, 1, 1,
0.9043784, 0.582829, 2.129438, 1, 1, 1, 1, 1,
0.9053963, -0.09516367, 2.830724, 1, 1, 1, 1, 1,
0.91488, -0.8493388, 2.18985, 1, 1, 1, 1, 1,
0.9152291, -1.178245, 3.525669, 1, 1, 1, 1, 1,
0.917192, -1.360928, 4.601759, 1, 1, 1, 1, 1,
0.9222019, 0.5313872, -0.002845137, 1, 1, 1, 1, 1,
0.9231165, -0.7198723, 1.580302, 1, 1, 1, 1, 1,
0.92751, -1.494009, 2.195982, 1, 1, 1, 1, 1,
0.9286578, 1.469692, 0.4169334, 1, 1, 1, 1, 1,
0.9310563, 1.439569, 0.8172598, 1, 1, 1, 1, 1,
0.9350021, -1.302527, 0.4640807, 1, 1, 1, 1, 1,
0.9447783, -1.242446, 1.82795, 1, 1, 1, 1, 1,
0.9449136, 0.01021744, 0.6899527, 1, 1, 1, 1, 1,
0.9535203, 2.422846, 0.819591, 1, 1, 1, 1, 1,
0.9550756, 2.203805, -0.01724703, 1, 1, 1, 1, 1,
0.9582124, 0.03416669, 2.73294, 0, 0, 1, 1, 1,
0.9641907, 1.225754, -0.6905093, 1, 0, 0, 1, 1,
0.9717863, 0.9754234, -1.456216, 1, 0, 0, 1, 1,
0.9750528, 1.53545, -0.8558857, 1, 0, 0, 1, 1,
0.9788836, -0.5771788, 2.67913, 1, 0, 0, 1, 1,
0.9790266, -0.9653066, 2.160287, 1, 0, 0, 1, 1,
0.9801043, -0.07048412, 1.949909, 0, 0, 0, 1, 1,
0.9803948, 0.8775563, 0.3577044, 0, 0, 0, 1, 1,
0.9806969, -1.38291, 1.389019, 0, 0, 0, 1, 1,
0.98338, -0.1514387, 2.207124, 0, 0, 0, 1, 1,
0.9861538, 1.037219, -0.5356917, 0, 0, 0, 1, 1,
0.9900131, 1.246027, 0.2103646, 0, 0, 0, 1, 1,
1.001817, -2.233849, 2.562111, 0, 0, 0, 1, 1,
1.004636, 0.2066557, 2.027358, 1, 1, 1, 1, 1,
1.004656, -1.154615, 1.585184, 1, 1, 1, 1, 1,
1.009784, -1.107198, 2.289841, 1, 1, 1, 1, 1,
1.010104, 0.1197439, 1.300302, 1, 1, 1, 1, 1,
1.02458, -2.103439, 2.859169, 1, 1, 1, 1, 1,
1.028802, -0.3354706, 1.786159, 1, 1, 1, 1, 1,
1.028902, 0.2185299, 2.862957, 1, 1, 1, 1, 1,
1.029241, 0.2355516, -0.02784262, 1, 1, 1, 1, 1,
1.030561, -0.398026, 2.055938, 1, 1, 1, 1, 1,
1.039047, -1.558807, 3.674317, 1, 1, 1, 1, 1,
1.04456, -0.6885476, 3.054095, 1, 1, 1, 1, 1,
1.045761, 0.9286863, 0.8198863, 1, 1, 1, 1, 1,
1.050277, 0.4816918, 1.723127, 1, 1, 1, 1, 1,
1.052474, 0.04839939, 2.508808, 1, 1, 1, 1, 1,
1.055992, -0.0141214, 2.369906, 1, 1, 1, 1, 1,
1.061569, 1.770305, 1.627076, 0, 0, 1, 1, 1,
1.065669, 0.2840764, 1.042573, 1, 0, 0, 1, 1,
1.066978, 1.108732, 0.2663326, 1, 0, 0, 1, 1,
1.067393, -0.6056817, 3.030461, 1, 0, 0, 1, 1,
1.067791, -0.64485, 1.658728, 1, 0, 0, 1, 1,
1.067971, -0.4210339, 2.96062, 1, 0, 0, 1, 1,
1.071434, -1.470774, 3.315092, 0, 0, 0, 1, 1,
1.071455, 0.5260775, 1.025865, 0, 0, 0, 1, 1,
1.074354, -0.2471385, 1.657067, 0, 0, 0, 1, 1,
1.07548, 0.454396, 2.516525, 0, 0, 0, 1, 1,
1.076389, -0.312039, 3.293628, 0, 0, 0, 1, 1,
1.079733, 1.039804, 0.458289, 0, 0, 0, 1, 1,
1.084993, 1.187519, 1.528479, 0, 0, 0, 1, 1,
1.086953, 1.218274, 1.115945, 1, 1, 1, 1, 1,
1.088889, -0.4303072, 2.396346, 1, 1, 1, 1, 1,
1.093226, 1.925932, -0.9536844, 1, 1, 1, 1, 1,
1.093691, -0.568835, 2.17366, 1, 1, 1, 1, 1,
1.09734, 0.1703429, 1.39845, 1, 1, 1, 1, 1,
1.101063, 0.3773929, 3.064561, 1, 1, 1, 1, 1,
1.103389, 1.280384, 1.154241, 1, 1, 1, 1, 1,
1.105995, 0.1748814, 1.794308, 1, 1, 1, 1, 1,
1.107878, 1.090632, 0.3984872, 1, 1, 1, 1, 1,
1.112338, -1.233282, 2.502555, 1, 1, 1, 1, 1,
1.116513, -0.9857934, 3.134103, 1, 1, 1, 1, 1,
1.116855, 0.679561, 2.164123, 1, 1, 1, 1, 1,
1.122257, -0.2086758, 1.558583, 1, 1, 1, 1, 1,
1.133032, -1.570814, 3.489119, 1, 1, 1, 1, 1,
1.134608, 1.226563, 2.435695, 1, 1, 1, 1, 1,
1.13471, 0.1431364, 2.097122, 0, 0, 1, 1, 1,
1.138606, -0.9102962, 0.579551, 1, 0, 0, 1, 1,
1.149995, 0.5404889, 2.546599, 1, 0, 0, 1, 1,
1.158679, -0.4298562, 1.860748, 1, 0, 0, 1, 1,
1.165731, -0.6147205, 1.580027, 1, 0, 0, 1, 1,
1.168569, 0.6416861, 1.675555, 1, 0, 0, 1, 1,
1.180254, 2.357851, 0.8968041, 0, 0, 0, 1, 1,
1.180635, 2.443166, -0.6319737, 0, 0, 0, 1, 1,
1.196717, 0.3853004, 1.449829, 0, 0, 0, 1, 1,
1.200168, 0.05170357, 1.31722, 0, 0, 0, 1, 1,
1.203012, 1.172715, 0.01076946, 0, 0, 0, 1, 1,
1.208809, -0.4588161, 1.655892, 0, 0, 0, 1, 1,
1.21806, 0.9763745, -0.4165259, 0, 0, 0, 1, 1,
1.226483, 1.345362, 0.5578872, 1, 1, 1, 1, 1,
1.237144, -0.1058092, 1.828642, 1, 1, 1, 1, 1,
1.240565, 0.3316219, 0.1407234, 1, 1, 1, 1, 1,
1.248929, 0.8702128, 2.274416, 1, 1, 1, 1, 1,
1.25005, -0.7223918, 0.8771856, 1, 1, 1, 1, 1,
1.258894, 0.3554886, -0.06156792, 1, 1, 1, 1, 1,
1.265172, -0.5354326, 2.843201, 1, 1, 1, 1, 1,
1.266668, -2.33911, 1.52829, 1, 1, 1, 1, 1,
1.274058, -0.3419683, 0.799251, 1, 1, 1, 1, 1,
1.275193, 1.140886, 2.92542, 1, 1, 1, 1, 1,
1.278362, -0.243333, 2.255266, 1, 1, 1, 1, 1,
1.304154, 0.8822342, 0.2100403, 1, 1, 1, 1, 1,
1.30511, -0.03270745, 2.649984, 1, 1, 1, 1, 1,
1.317912, 0.6735409, 2.141395, 1, 1, 1, 1, 1,
1.325919, -0.9553223, 1.695358, 1, 1, 1, 1, 1,
1.327471, 1.130801, -0.4542699, 0, 0, 1, 1, 1,
1.33224, 0.3446909, 0.9141312, 1, 0, 0, 1, 1,
1.33667, 0.4634469, 1.538805, 1, 0, 0, 1, 1,
1.339897, -1.056101, 2.596643, 1, 0, 0, 1, 1,
1.343512, -0.5303251, 1.400396, 1, 0, 0, 1, 1,
1.344468, -0.4877761, 1.771648, 1, 0, 0, 1, 1,
1.352157, 0.4728853, 0.7829943, 0, 0, 0, 1, 1,
1.352562, -0.2689961, 1.700003, 0, 0, 0, 1, 1,
1.353323, 0.144802, 1.393265, 0, 0, 0, 1, 1,
1.355846, 1.116861, 1.207174, 0, 0, 0, 1, 1,
1.365042, -0.1943102, 0.760576, 0, 0, 0, 1, 1,
1.367949, 1.822141, -1.17173, 0, 0, 0, 1, 1,
1.368847, -0.7386486, 1.864632, 0, 0, 0, 1, 1,
1.372055, 1.431297, 0.6992854, 1, 1, 1, 1, 1,
1.384567, -0.9251753, 1.564548, 1, 1, 1, 1, 1,
1.39645, 0.7171745, 0.6269897, 1, 1, 1, 1, 1,
1.412934, 0.4277822, 3.801458, 1, 1, 1, 1, 1,
1.419358, 1.31001, 0.06975669, 1, 1, 1, 1, 1,
1.427116, 0.3451123, 2.984419, 1, 1, 1, 1, 1,
1.428142, 0.286516, 1.975444, 1, 1, 1, 1, 1,
1.428343, -0.3384251, -0.1805969, 1, 1, 1, 1, 1,
1.428591, -0.7612262, 2.401631, 1, 1, 1, 1, 1,
1.432143, 2.032236, -0.09428895, 1, 1, 1, 1, 1,
1.432592, -0.4021985, 2.606049, 1, 1, 1, 1, 1,
1.437483, 0.8598378, 1.514621, 1, 1, 1, 1, 1,
1.449657, -0.1019029, 0.7513394, 1, 1, 1, 1, 1,
1.450414, 1.79088, 0.8326095, 1, 1, 1, 1, 1,
1.458411, 0.2761167, 0.4051337, 1, 1, 1, 1, 1,
1.459829, 1.894085, 0.1244456, 0, 0, 1, 1, 1,
1.462125, -1.396731, 1.152558, 1, 0, 0, 1, 1,
1.473806, -0.593125, 1.733118, 1, 0, 0, 1, 1,
1.477821, 0.7115672, 3.574193, 1, 0, 0, 1, 1,
1.494068, -0.4272596, 0.781245, 1, 0, 0, 1, 1,
1.512142, -0.3400433, 3.219372, 1, 0, 0, 1, 1,
1.52827, -0.1714868, 1.663383, 0, 0, 0, 1, 1,
1.532564, -0.689903, 2.735356, 0, 0, 0, 1, 1,
1.547392, 0.5640349, 1.174625, 0, 0, 0, 1, 1,
1.555862, 0.08981621, 1.378787, 0, 0, 0, 1, 1,
1.561436, -0.4739366, -0.04784748, 0, 0, 0, 1, 1,
1.574815, -0.2635005, 1.300186, 0, 0, 0, 1, 1,
1.586916, 0.1605408, 2.196658, 0, 0, 0, 1, 1,
1.589542, -1.141454, 1.616553, 1, 1, 1, 1, 1,
1.590828, 0.05438245, 1.127287, 1, 1, 1, 1, 1,
1.602862, 0.390194, 1.0355, 1, 1, 1, 1, 1,
1.606132, -0.3527362, 3.510448, 1, 1, 1, 1, 1,
1.614715, 0.4106172, 1.091096, 1, 1, 1, 1, 1,
1.627094, -2.028558, 1.330945, 1, 1, 1, 1, 1,
1.629822, 0.990393, 2.379054, 1, 1, 1, 1, 1,
1.63231, -0.3230125, 1.127888, 1, 1, 1, 1, 1,
1.635669, -0.06787632, -0.2573423, 1, 1, 1, 1, 1,
1.636481, -0.1162164, 1.69781, 1, 1, 1, 1, 1,
1.638257, -0.2253274, 0.8720451, 1, 1, 1, 1, 1,
1.640928, 0.4642883, 1.338325, 1, 1, 1, 1, 1,
1.643558, -0.2051836, 1.469465, 1, 1, 1, 1, 1,
1.669764, -0.6639148, 0.8495858, 1, 1, 1, 1, 1,
1.688165, -1.493608, 0.8379818, 1, 1, 1, 1, 1,
1.700903, -1.085478, 2.403368, 0, 0, 1, 1, 1,
1.708014, 0.6169107, 1.204684, 1, 0, 0, 1, 1,
1.718722, -1.132683, 2.701429, 1, 0, 0, 1, 1,
1.730961, 0.4070346, 0.06141632, 1, 0, 0, 1, 1,
1.742566, 0.9668089, 1.721231, 1, 0, 0, 1, 1,
1.745585, 0.5401208, 0.4040832, 1, 0, 0, 1, 1,
1.755632, 1.32166, 0.5611836, 0, 0, 0, 1, 1,
1.763253, -0.4994137, 2.401106, 0, 0, 0, 1, 1,
1.784764, 0.6061572, -0.5331461, 0, 0, 0, 1, 1,
1.79432, 0.3697812, 2.240228, 0, 0, 0, 1, 1,
1.798444, 0.3685704, 0.4912658, 0, 0, 0, 1, 1,
1.807013, -0.2083348, 2.182722, 0, 0, 0, 1, 1,
1.815024, 0.7708904, 0.7394681, 0, 0, 0, 1, 1,
1.831537, -1.304986, 2.050015, 1, 1, 1, 1, 1,
1.85893, 0.5394091, -0.2259082, 1, 1, 1, 1, 1,
1.86382, -0.08391283, 2.862771, 1, 1, 1, 1, 1,
1.907269, 0.6036887, 0.4474338, 1, 1, 1, 1, 1,
1.93638, 2.455631, 0.5125906, 1, 1, 1, 1, 1,
1.939184, 0.8098323, 2.297935, 1, 1, 1, 1, 1,
1.984451, -1.697171, 1.201512, 1, 1, 1, 1, 1,
1.993502, -1.139059, 1.140961, 1, 1, 1, 1, 1,
2.00762, 0.790304, 2.940589, 1, 1, 1, 1, 1,
2.026935, 1.085419, 2.558578, 1, 1, 1, 1, 1,
2.034017, -1.487219, 4.424278, 1, 1, 1, 1, 1,
2.051143, -0.4474621, 1.035029, 1, 1, 1, 1, 1,
2.068184, 0.1803307, 1.949677, 1, 1, 1, 1, 1,
2.071546, 0.1411084, 2.035574, 1, 1, 1, 1, 1,
2.073836, 0.9416087, 1.433502, 1, 1, 1, 1, 1,
2.117141, 0.9069093, 1.022178, 0, 0, 1, 1, 1,
2.126048, -0.1862643, 3.140659, 1, 0, 0, 1, 1,
2.147201, 0.07071859, 0.02143285, 1, 0, 0, 1, 1,
2.163538, -0.3228266, 2.650959, 1, 0, 0, 1, 1,
2.194427, -0.1758353, 2.158155, 1, 0, 0, 1, 1,
2.206621, 0.812694, 1.001028, 1, 0, 0, 1, 1,
2.243121, 0.7002244, 1.049566, 0, 0, 0, 1, 1,
2.250464, 0.2061881, 0.7709141, 0, 0, 0, 1, 1,
2.322854, -0.6011264, 0.9591463, 0, 0, 0, 1, 1,
2.337309, -0.6485066, 2.588358, 0, 0, 0, 1, 1,
2.387566, -0.03481112, 3.666166, 0, 0, 0, 1, 1,
2.445944, 0.1132367, 0.4222322, 0, 0, 0, 1, 1,
2.586039, 0.9314023, 0.2550699, 0, 0, 0, 1, 1,
2.656205, 0.4070687, 1.245969, 1, 1, 1, 1, 1,
2.658558, -1.196144, 3.061099, 1, 1, 1, 1, 1,
2.871159, 0.05628986, 2.891854, 1, 1, 1, 1, 1,
3.098806, 0.7547923, 3.005957, 1, 1, 1, 1, 1,
3.400552, -0.6054808, 1.314366, 1, 1, 1, 1, 1,
3.417104, -1.194569, 1.839156, 1, 1, 1, 1, 1,
3.717648, 0.7763361, 0.3784817, 1, 1, 1, 1, 1
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
var radius = 9.684061;
var distance = 34.01485;
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
mvMatrix.translate( -0.159987, -0.098611, 0.0826242 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.01485);
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