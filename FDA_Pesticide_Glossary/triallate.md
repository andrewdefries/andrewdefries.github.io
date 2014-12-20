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
-3.475859, -1.114732, -3.685809, 1, 0, 0, 1,
-3.370538, 0.6160371, -1.858453, 1, 0.007843138, 0, 1,
-3.177755, -0.8929303, -2.585082, 1, 0.01176471, 0, 1,
-3.10205, -0.4195612, -1.23194, 1, 0.01960784, 0, 1,
-2.986032, 0.3340279, -1.326777, 1, 0.02352941, 0, 1,
-2.830704, 1.539107, -2.723585, 1, 0.03137255, 0, 1,
-2.568151, 0.3467723, -1.897306, 1, 0.03529412, 0, 1,
-2.520119, 0.9316131, -2.530011, 1, 0.04313726, 0, 1,
-2.428195, 0.6515935, -1.255918, 1, 0.04705882, 0, 1,
-2.339706, -1.29162, -2.157576, 1, 0.05490196, 0, 1,
-2.280905, -0.5688549, -2.984112, 1, 0.05882353, 0, 1,
-2.260701, -0.5072732, -1.8087, 1, 0.06666667, 0, 1,
-2.251876, 2.539805, -2.12613, 1, 0.07058824, 0, 1,
-2.245591, 0.5893061, -0.3553406, 1, 0.07843138, 0, 1,
-2.223683, 2.294878, -1.756301, 1, 0.08235294, 0, 1,
-2.193923, -0.06636647, -0.8111985, 1, 0.09019608, 0, 1,
-2.152049, 0.5360059, 0.6424697, 1, 0.09411765, 0, 1,
-2.144186, -0.7546568, -1.15076, 1, 0.1019608, 0, 1,
-2.141123, -1.965632, -3.017035, 1, 0.1098039, 0, 1,
-2.098399, -0.6762438, -2.019439, 1, 0.1137255, 0, 1,
-2.069192, 1.080659, -0.07375827, 1, 0.1215686, 0, 1,
-2.067213, -0.4788991, -1.858181, 1, 0.1254902, 0, 1,
-2.005475, -0.03023436, -1.452002, 1, 0.1333333, 0, 1,
-1.994094, 0.6986254, 0.3082826, 1, 0.1372549, 0, 1,
-1.986355, 0.2598647, -1.00001, 1, 0.145098, 0, 1,
-1.984893, -2.172606, -2.030442, 1, 0.1490196, 0, 1,
-1.968632, -0.8095193, -1.856481, 1, 0.1568628, 0, 1,
-1.957684, 0.1856149, -0.901663, 1, 0.1607843, 0, 1,
-1.947964, -0.1467705, -2.746088, 1, 0.1686275, 0, 1,
-1.941667, 0.2455088, -0.50073, 1, 0.172549, 0, 1,
-1.929241, 0.6289739, -2.099249, 1, 0.1803922, 0, 1,
-1.924166, -0.6693767, -1.471932, 1, 0.1843137, 0, 1,
-1.897087, -0.5421804, -1.891323, 1, 0.1921569, 0, 1,
-1.890782, -1.099325, -2.659493, 1, 0.1960784, 0, 1,
-1.888825, 1.056177, -0.8914297, 1, 0.2039216, 0, 1,
-1.878877, 0.3188425, -1.089137, 1, 0.2117647, 0, 1,
-1.868601, -0.1432324, -1.273214, 1, 0.2156863, 0, 1,
-1.865426, 1.517443, -0.3045316, 1, 0.2235294, 0, 1,
-1.862805, 0.9092523, -1.286067, 1, 0.227451, 0, 1,
-1.849439, 0.1386393, -2.531462, 1, 0.2352941, 0, 1,
-1.822312, 2.959809, 1.483102, 1, 0.2392157, 0, 1,
-1.811336, -0.8001106, -1.873809, 1, 0.2470588, 0, 1,
-1.81032, -1.753837, -2.396428, 1, 0.2509804, 0, 1,
-1.794292, 0.4550292, -2.418925, 1, 0.2588235, 0, 1,
-1.783805, 1.182961, -2.178354, 1, 0.2627451, 0, 1,
-1.775471, 0.4922028, -1.793262, 1, 0.2705882, 0, 1,
-1.771427, 1.919, -1.534154, 1, 0.2745098, 0, 1,
-1.765137, 0.1380586, 1.108404, 1, 0.282353, 0, 1,
-1.702443, -0.3295898, -1.815293, 1, 0.2862745, 0, 1,
-1.699235, -0.5634971, -2.279981, 1, 0.2941177, 0, 1,
-1.698997, 0.292957, -0.7853996, 1, 0.3019608, 0, 1,
-1.694161, 0.0580756, -2.738866, 1, 0.3058824, 0, 1,
-1.693045, -0.458599, -1.58972, 1, 0.3137255, 0, 1,
-1.690826, -0.7510574, -0.6978028, 1, 0.3176471, 0, 1,
-1.676066, -1.530165, -1.478386, 1, 0.3254902, 0, 1,
-1.670499, -0.4154665, -1.927702, 1, 0.3294118, 0, 1,
-1.668273, 0.9720954, -0.08162455, 1, 0.3372549, 0, 1,
-1.662293, -1.237343, -1.703189, 1, 0.3411765, 0, 1,
-1.65986, -0.5331886, -1.535306, 1, 0.3490196, 0, 1,
-1.641382, -2.608701, -2.994878, 1, 0.3529412, 0, 1,
-1.632882, -0.7777659, -3.415863, 1, 0.3607843, 0, 1,
-1.629209, -0.3024755, -2.326176, 1, 0.3647059, 0, 1,
-1.62246, -0.04975833, -1.145454, 1, 0.372549, 0, 1,
-1.61306, -0.6199133, -1.428985, 1, 0.3764706, 0, 1,
-1.608915, -0.1145449, -0.8042544, 1, 0.3843137, 0, 1,
-1.602814, -0.5840414, -2.073021, 1, 0.3882353, 0, 1,
-1.599918, 0.0174859, -0.6232294, 1, 0.3960784, 0, 1,
-1.59802, 0.4964209, 0.7920413, 1, 0.4039216, 0, 1,
-1.593524, -0.1373693, -1.109755, 1, 0.4078431, 0, 1,
-1.590782, -0.8833791, -2.163466, 1, 0.4156863, 0, 1,
-1.586714, -0.5326015, -1.655461, 1, 0.4196078, 0, 1,
-1.57349, 1.385035, -1.346033, 1, 0.427451, 0, 1,
-1.556006, -0.7017733, -3.134807, 1, 0.4313726, 0, 1,
-1.549163, 1.742123, -1.398635, 1, 0.4392157, 0, 1,
-1.544734, -0.3171937, -1.141979, 1, 0.4431373, 0, 1,
-1.542305, -0.6945174, -2.31853, 1, 0.4509804, 0, 1,
-1.540469, 0.5108681, -1.663788, 1, 0.454902, 0, 1,
-1.535884, -0.4137011, -3.873562, 1, 0.4627451, 0, 1,
-1.528616, 0.3457516, -1.919448, 1, 0.4666667, 0, 1,
-1.511123, -1.598452, -0.9466563, 1, 0.4745098, 0, 1,
-1.497421, 0.9015889, 0.2392048, 1, 0.4784314, 0, 1,
-1.496194, -0.2701398, -2.667952, 1, 0.4862745, 0, 1,
-1.490741, -1.172714, -0.9602358, 1, 0.4901961, 0, 1,
-1.47885, 1.292806, -0.7926024, 1, 0.4980392, 0, 1,
-1.46791, 2.108738, 0.4105619, 1, 0.5058824, 0, 1,
-1.466461, 0.6734755, -2.757396, 1, 0.509804, 0, 1,
-1.452892, 0.413025, -2.188211, 1, 0.5176471, 0, 1,
-1.440406, -0.8653086, -1.61341, 1, 0.5215687, 0, 1,
-1.438335, -1.863944, -3.224544, 1, 0.5294118, 0, 1,
-1.43196, -0.5022756, -1.32143, 1, 0.5333334, 0, 1,
-1.422172, -0.6814528, -3.701703, 1, 0.5411765, 0, 1,
-1.419152, 1.029272, -2.145532, 1, 0.5450981, 0, 1,
-1.415131, -0.1225559, -2.485539, 1, 0.5529412, 0, 1,
-1.38953, -0.3868382, -0.8945032, 1, 0.5568628, 0, 1,
-1.388529, -0.2307925, -2.114207, 1, 0.5647059, 0, 1,
-1.383944, 0.7959203, -0.04685879, 1, 0.5686275, 0, 1,
-1.379149, -0.9342543, -1.105585, 1, 0.5764706, 0, 1,
-1.376738, -0.2452883, -0.5239499, 1, 0.5803922, 0, 1,
-1.371441, 0.2049636, -1.573385, 1, 0.5882353, 0, 1,
-1.365478, 1.170338, 0.1560456, 1, 0.5921569, 0, 1,
-1.347177, 0.1854138, -1.003508, 1, 0.6, 0, 1,
-1.33399, -0.5394043, -3.562428, 1, 0.6078432, 0, 1,
-1.326791, -0.9006949, -3.171063, 1, 0.6117647, 0, 1,
-1.322673, 1.195638, -0.5557038, 1, 0.6196079, 0, 1,
-1.315592, -0.4452023, -2.471531, 1, 0.6235294, 0, 1,
-1.309783, 1.562735, -0.6302908, 1, 0.6313726, 0, 1,
-1.303871, -1.410024, -2.7472, 1, 0.6352941, 0, 1,
-1.30379, -1.305858, -2.460201, 1, 0.6431373, 0, 1,
-1.296916, 0.6712858, -1.779796, 1, 0.6470588, 0, 1,
-1.296427, -0.9566446, -1.471514, 1, 0.654902, 0, 1,
-1.293508, -0.7777905, -3.054366, 1, 0.6588235, 0, 1,
-1.290209, -0.4180149, -1.448, 1, 0.6666667, 0, 1,
-1.281509, 1.410916, -1.612377, 1, 0.6705883, 0, 1,
-1.269196, -1.458154, -1.219797, 1, 0.6784314, 0, 1,
-1.262285, -0.6447421, -2.264517, 1, 0.682353, 0, 1,
-1.259925, 0.7863712, -1.443621, 1, 0.6901961, 0, 1,
-1.250496, 0.1334396, -2.315153, 1, 0.6941177, 0, 1,
-1.244226, 0.3944859, -0.8991621, 1, 0.7019608, 0, 1,
-1.244177, -0.5634702, -1.106298, 1, 0.7098039, 0, 1,
-1.240556, -1.011301, -1.971134, 1, 0.7137255, 0, 1,
-1.239305, 0.5343263, -1.759591, 1, 0.7215686, 0, 1,
-1.233787, -0.8927423, -0.5205789, 1, 0.7254902, 0, 1,
-1.232113, 0.7669497, -1.536802, 1, 0.7333333, 0, 1,
-1.225099, 0.2136234, -0.7257866, 1, 0.7372549, 0, 1,
-1.223081, 0.3218068, -1.519085, 1, 0.7450981, 0, 1,
-1.220105, -0.1196159, -1.95057, 1, 0.7490196, 0, 1,
-1.216177, 0.02946917, -1.205147, 1, 0.7568628, 0, 1,
-1.213061, -0.9427248, -3.560631, 1, 0.7607843, 0, 1,
-1.212211, -0.1229409, -1.191976, 1, 0.7686275, 0, 1,
-1.210822, -0.4609514, -1.267344, 1, 0.772549, 0, 1,
-1.200868, 0.9596123, -1.914896, 1, 0.7803922, 0, 1,
-1.200867, -1.335848, -3.636454, 1, 0.7843137, 0, 1,
-1.198375, 1.705792, -0.2814249, 1, 0.7921569, 0, 1,
-1.190608, -0.719417, -2.510597, 1, 0.7960784, 0, 1,
-1.189301, 1.66802, 0.7507254, 1, 0.8039216, 0, 1,
-1.188552, -0.2290972, -2.445274, 1, 0.8117647, 0, 1,
-1.183115, 1.387485, -1.884213, 1, 0.8156863, 0, 1,
-1.174511, 1.292606, -0.6424362, 1, 0.8235294, 0, 1,
-1.172728, 0.1094934, -1.745672, 1, 0.827451, 0, 1,
-1.166796, 0.4176963, -1.767936, 1, 0.8352941, 0, 1,
-1.165945, -0.01947723, -1.897996, 1, 0.8392157, 0, 1,
-1.136762, -2.309047, -2.588284, 1, 0.8470588, 0, 1,
-1.135427, -0.3920042, -1.992656, 1, 0.8509804, 0, 1,
-1.126325, -1.38674, -2.802497, 1, 0.8588235, 0, 1,
-1.117952, 0.4101587, -1.244363, 1, 0.8627451, 0, 1,
-1.117725, -0.6531927, -0.7202939, 1, 0.8705882, 0, 1,
-1.102188, -0.3142815, -3.044876, 1, 0.8745098, 0, 1,
-1.099006, 0.23684, -0.7906576, 1, 0.8823529, 0, 1,
-1.096579, 1.381013, -0.7785846, 1, 0.8862745, 0, 1,
-1.08547, 0.02825098, -1.057932, 1, 0.8941177, 0, 1,
-1.083707, 0.1005592, -1.880147, 1, 0.8980392, 0, 1,
-1.077681, 0.1810432, -2.185518, 1, 0.9058824, 0, 1,
-1.075682, -0.05838832, -1.461167, 1, 0.9137255, 0, 1,
-1.065625, -0.9700193, -2.66765, 1, 0.9176471, 0, 1,
-1.060413, 0.7284309, 1.217729, 1, 0.9254902, 0, 1,
-1.056805, -0.2816523, -3.211105, 1, 0.9294118, 0, 1,
-1.054972, 0.332621, -2.3029, 1, 0.9372549, 0, 1,
-1.054709, 0.825727, -0.8746079, 1, 0.9411765, 0, 1,
-1.052456, 1.099846, -1.695081, 1, 0.9490196, 0, 1,
-1.047303, 1.35087, -1.878496, 1, 0.9529412, 0, 1,
-1.04015, 0.1035868, 0.1364941, 1, 0.9607843, 0, 1,
-1.031055, 0.04449337, 0.2008761, 1, 0.9647059, 0, 1,
-1.015633, -0.2217346, -2.327886, 1, 0.972549, 0, 1,
-1.014927, 0.9354529, -0.3816535, 1, 0.9764706, 0, 1,
-1.004741, 0.5830103, -0.8972754, 1, 0.9843137, 0, 1,
-0.9993421, -0.6186258, -4.528714, 1, 0.9882353, 0, 1,
-0.9872292, -0.4483785, -2.878687, 1, 0.9960784, 0, 1,
-0.986228, -0.838887, -1.1043, 0.9960784, 1, 0, 1,
-0.9815364, -0.1765815, -0.8719972, 0.9921569, 1, 0, 1,
-0.9802066, -0.2927279, -3.899552, 0.9843137, 1, 0, 1,
-0.9690993, 0.2494963, -0.6093605, 0.9803922, 1, 0, 1,
-0.9617779, 0.4902127, -2.531576, 0.972549, 1, 0, 1,
-0.9584417, -1.64831, -3.308507, 0.9686275, 1, 0, 1,
-0.9553155, 0.1925674, -0.3752942, 0.9607843, 1, 0, 1,
-0.9547383, -0.2652902, -2.580599, 0.9568627, 1, 0, 1,
-0.9541231, 0.5801923, 1.25386, 0.9490196, 1, 0, 1,
-0.9421617, 0.5351591, -0.3781501, 0.945098, 1, 0, 1,
-0.9404265, 1.943787, 0.1870805, 0.9372549, 1, 0, 1,
-0.9325716, -1.577809, -1.58474, 0.9333333, 1, 0, 1,
-0.9320512, 0.5537859, -3.379977, 0.9254902, 1, 0, 1,
-0.9205538, -0.682098, -1.766735, 0.9215686, 1, 0, 1,
-0.916464, -0.6435478, -1.692168, 0.9137255, 1, 0, 1,
-0.9141083, -0.9505264, -1.293931, 0.9098039, 1, 0, 1,
-0.9094132, -1.047533, -1.698017, 0.9019608, 1, 0, 1,
-0.9091753, 1.391269, -0.4817529, 0.8941177, 1, 0, 1,
-0.9039116, 0.9070975, -0.7731047, 0.8901961, 1, 0, 1,
-0.9017806, 0.7528167, -1.827584, 0.8823529, 1, 0, 1,
-0.9013652, 0.3577626, -0.410542, 0.8784314, 1, 0, 1,
-0.8987932, -0.01240915, -0.4235603, 0.8705882, 1, 0, 1,
-0.8889123, 1.020346, -1.45027, 0.8666667, 1, 0, 1,
-0.8885549, 0.2366916, -3.053915, 0.8588235, 1, 0, 1,
-0.8876218, 0.1902801, -1.818388, 0.854902, 1, 0, 1,
-0.8839094, 1.446709, -0.989419, 0.8470588, 1, 0, 1,
-0.8833866, -3.032422, -2.643974, 0.8431373, 1, 0, 1,
-0.883144, 0.975777, -0.5492166, 0.8352941, 1, 0, 1,
-0.8772402, 0.3392262, 0.3587638, 0.8313726, 1, 0, 1,
-0.8741871, 0.452643, -1.338227, 0.8235294, 1, 0, 1,
-0.871598, 1.02766, 0.8272167, 0.8196079, 1, 0, 1,
-0.8693411, 0.564742, -0.1503117, 0.8117647, 1, 0, 1,
-0.8604802, -1.000099, -2.800711, 0.8078431, 1, 0, 1,
-0.8597627, 2.177368, -0.6290421, 0.8, 1, 0, 1,
-0.8566694, 0.6129855, -0.8422878, 0.7921569, 1, 0, 1,
-0.8529733, -0.8658481, -1.165105, 0.7882353, 1, 0, 1,
-0.8504282, -0.1472654, -4.024815, 0.7803922, 1, 0, 1,
-0.8499079, 0.6945784, -0.5603437, 0.7764706, 1, 0, 1,
-0.8426003, -0.722622, -2.411998, 0.7686275, 1, 0, 1,
-0.8407344, 0.5894686, -1.576702, 0.7647059, 1, 0, 1,
-0.8395809, -0.2628359, -2.069406, 0.7568628, 1, 0, 1,
-0.8372644, 0.6356887, -0.05734931, 0.7529412, 1, 0, 1,
-0.8355475, -2.103886, -3.432094, 0.7450981, 1, 0, 1,
-0.8340045, -0.5131623, -1.873716, 0.7411765, 1, 0, 1,
-0.8272572, -0.8275352, -0.4533886, 0.7333333, 1, 0, 1,
-0.8231856, -1.595343, -3.660101, 0.7294118, 1, 0, 1,
-0.8212951, -0.2967734, -2.869825, 0.7215686, 1, 0, 1,
-0.8205145, -1.314352, -1.326331, 0.7176471, 1, 0, 1,
-0.8200012, 1.921129, -0.05381008, 0.7098039, 1, 0, 1,
-0.8163731, 0.5173928, -2.851573, 0.7058824, 1, 0, 1,
-0.8074294, -0.5503455, -3.833002, 0.6980392, 1, 0, 1,
-0.805232, 1.474482, -1.297816, 0.6901961, 1, 0, 1,
-0.8003005, -0.8619106, -2.970754, 0.6862745, 1, 0, 1,
-0.7993548, 1.00899, -0.4780759, 0.6784314, 1, 0, 1,
-0.7969038, 0.1815316, -0.5596418, 0.6745098, 1, 0, 1,
-0.793433, 1.669975, -0.6929533, 0.6666667, 1, 0, 1,
-0.7913618, -1.610926, -3.101019, 0.6627451, 1, 0, 1,
-0.7887645, -0.5640899, -4.585409, 0.654902, 1, 0, 1,
-0.7873368, -1.93473, -2.572128, 0.6509804, 1, 0, 1,
-0.7864292, 0.1261025, -1.389868, 0.6431373, 1, 0, 1,
-0.7843611, 0.1506089, -0.7414292, 0.6392157, 1, 0, 1,
-0.7792321, -0.03860314, -1.441119, 0.6313726, 1, 0, 1,
-0.7776983, 0.03269674, -2.011523, 0.627451, 1, 0, 1,
-0.7747567, -0.7176173, -2.449106, 0.6196079, 1, 0, 1,
-0.7745311, 0.7339646, -0.6661707, 0.6156863, 1, 0, 1,
-0.7667766, 0.3181621, -1.998873, 0.6078432, 1, 0, 1,
-0.765466, 0.1574755, -1.03915, 0.6039216, 1, 0, 1,
-0.7606198, 1.580751, -0.7684063, 0.5960785, 1, 0, 1,
-0.7466728, -0.346678, -2.18037, 0.5882353, 1, 0, 1,
-0.7440771, 0.2022407, -0.9824334, 0.5843138, 1, 0, 1,
-0.7418577, -0.4668545, -3.348912, 0.5764706, 1, 0, 1,
-0.7401338, -2.441491, -3.127804, 0.572549, 1, 0, 1,
-0.7320371, 0.5126503, -1.611884, 0.5647059, 1, 0, 1,
-0.7264491, -0.08413479, -0.1949196, 0.5607843, 1, 0, 1,
-0.7166663, 1.062478, -0.6291657, 0.5529412, 1, 0, 1,
-0.7129886, 0.2599897, -2.975393, 0.5490196, 1, 0, 1,
-0.7129431, -0.4082393, -3.653931, 0.5411765, 1, 0, 1,
-0.7121171, 0.2452326, -1.912629, 0.5372549, 1, 0, 1,
-0.7116286, 0.5826382, 0.0392823, 0.5294118, 1, 0, 1,
-0.7086861, 0.1091546, -1.523187, 0.5254902, 1, 0, 1,
-0.7003146, 0.3571132, -1.809039, 0.5176471, 1, 0, 1,
-0.6990806, 0.09489418, -2.890719, 0.5137255, 1, 0, 1,
-0.6986533, 0.6000717, -1.808287, 0.5058824, 1, 0, 1,
-0.6858639, 1.674212, -1.78379, 0.5019608, 1, 0, 1,
-0.6857098, -0.1051319, -1.903529, 0.4941176, 1, 0, 1,
-0.6853737, 0.1139923, -1.109635, 0.4862745, 1, 0, 1,
-0.6847211, 1.036541, -1.214832, 0.4823529, 1, 0, 1,
-0.6761406, -0.3201193, -1.418954, 0.4745098, 1, 0, 1,
-0.6751845, -0.1527391, -2.383024, 0.4705882, 1, 0, 1,
-0.6637362, 0.0904719, -2.362871, 0.4627451, 1, 0, 1,
-0.661305, 1.264808, -0.001337197, 0.4588235, 1, 0, 1,
-0.6608045, 0.7067688, -0.9684207, 0.4509804, 1, 0, 1,
-0.6594526, 0.2960151, -0.9765555, 0.4470588, 1, 0, 1,
-0.6586726, -0.08428272, -3.352937, 0.4392157, 1, 0, 1,
-0.6503497, 1.182242, -0.4298728, 0.4352941, 1, 0, 1,
-0.6502018, -0.1736517, -1.337339, 0.427451, 1, 0, 1,
-0.6498446, -1.686305, -2.226597, 0.4235294, 1, 0, 1,
-0.6491503, 1.077736, -1.458712, 0.4156863, 1, 0, 1,
-0.649019, -0.8616688, -1.740067, 0.4117647, 1, 0, 1,
-0.6457006, -0.2510272, -0.930485, 0.4039216, 1, 0, 1,
-0.6379607, 0.7634104, -0.2782083, 0.3960784, 1, 0, 1,
-0.6359085, -1.02834, -3.529384, 0.3921569, 1, 0, 1,
-0.6351586, -0.106569, -4.236818, 0.3843137, 1, 0, 1,
-0.6278381, 2.861943, -1.260504, 0.3803922, 1, 0, 1,
-0.6244284, -0.7211404, -3.193829, 0.372549, 1, 0, 1,
-0.6212514, -0.04165121, -1.290346, 0.3686275, 1, 0, 1,
-0.6205432, 0.5889787, -0.801809, 0.3607843, 1, 0, 1,
-0.6204022, 0.4176691, -0.8680183, 0.3568628, 1, 0, 1,
-0.6173195, -0.5384523, -2.662605, 0.3490196, 1, 0, 1,
-0.6156845, 0.34331, -0.9483117, 0.345098, 1, 0, 1,
-0.6116773, 1.253609, -0.1501862, 0.3372549, 1, 0, 1,
-0.6109394, 0.9540251, -0.9777518, 0.3333333, 1, 0, 1,
-0.6080362, -1.222383, -4.350057, 0.3254902, 1, 0, 1,
-0.6075772, 2.254602, 0.5029348, 0.3215686, 1, 0, 1,
-0.6004522, -1.434051, -1.742908, 0.3137255, 1, 0, 1,
-0.6002669, 1.6291, 0.001666916, 0.3098039, 1, 0, 1,
-0.5980176, -0.4109897, -3.172324, 0.3019608, 1, 0, 1,
-0.597364, 0.4075261, -1.438027, 0.2941177, 1, 0, 1,
-0.5961668, -0.9211137, -2.566886, 0.2901961, 1, 0, 1,
-0.5935748, -0.2620205, -1.021367, 0.282353, 1, 0, 1,
-0.5914148, -0.7305471, -2.83907, 0.2784314, 1, 0, 1,
-0.5883043, 0.4212488, -1.724991, 0.2705882, 1, 0, 1,
-0.5882523, -0.1664945, -0.9598625, 0.2666667, 1, 0, 1,
-0.5875477, 1.371317, -0.2916419, 0.2588235, 1, 0, 1,
-0.5835302, 1.08775, 0.1375677, 0.254902, 1, 0, 1,
-0.5735104, -1.374416, -1.871647, 0.2470588, 1, 0, 1,
-0.5716491, 1.774995, 0.6571292, 0.2431373, 1, 0, 1,
-0.5677396, 0.4573627, -3.050399, 0.2352941, 1, 0, 1,
-0.5661803, 1.74984, -2.462565, 0.2313726, 1, 0, 1,
-0.5653297, 0.7776774, -2.021063, 0.2235294, 1, 0, 1,
-0.5636649, 0.1487789, -1.220263, 0.2196078, 1, 0, 1,
-0.5620962, -0.2992679, -2.039439, 0.2117647, 1, 0, 1,
-0.5617549, 0.3962309, -0.2384491, 0.2078431, 1, 0, 1,
-0.5609571, -0.2505512, -1.75688, 0.2, 1, 0, 1,
-0.5592147, 1.015591, 0.8766443, 0.1921569, 1, 0, 1,
-0.5551739, 1.264182, -3.348089, 0.1882353, 1, 0, 1,
-0.5505102, -1.462367, -2.329142, 0.1803922, 1, 0, 1,
-0.5497557, -1.193303, -2.563373, 0.1764706, 1, 0, 1,
-0.5445194, -0.3165101, -3.164246, 0.1686275, 1, 0, 1,
-0.5401826, 2.020653, 0.9300467, 0.1647059, 1, 0, 1,
-0.5343946, 0.2361206, -2.819161, 0.1568628, 1, 0, 1,
-0.5343481, -1.173452, -3.181795, 0.1529412, 1, 0, 1,
-0.5220883, -0.342195, -1.016991, 0.145098, 1, 0, 1,
-0.5210274, 0.7876409, -1.639718, 0.1411765, 1, 0, 1,
-0.5208695, 0.9973078, -1.439486, 0.1333333, 1, 0, 1,
-0.5200187, 1.515397, 0.6786854, 0.1294118, 1, 0, 1,
-0.5192035, 0.4792432, -2.059478, 0.1215686, 1, 0, 1,
-0.5106093, -0.3183478, -3.565679, 0.1176471, 1, 0, 1,
-0.5099965, 1.418934, -1.515624, 0.1098039, 1, 0, 1,
-0.5087973, 1.090897, -0.02268341, 0.1058824, 1, 0, 1,
-0.5052431, 0.6228551, -0.667802, 0.09803922, 1, 0, 1,
-0.5034311, 1.003123, -1.048471, 0.09019608, 1, 0, 1,
-0.5028155, 0.8197749, -1.548561, 0.08627451, 1, 0, 1,
-0.5015649, -0.5965988, -3.466348, 0.07843138, 1, 0, 1,
-0.4999832, -0.3272457, -3.826397, 0.07450981, 1, 0, 1,
-0.4989409, -0.3137955, -2.109171, 0.06666667, 1, 0, 1,
-0.4982408, -0.8175445, -2.025615, 0.0627451, 1, 0, 1,
-0.4978088, -0.7171937, -2.589105, 0.05490196, 1, 0, 1,
-0.49106, -0.1943123, -2.573086, 0.05098039, 1, 0, 1,
-0.4882891, -0.1654739, -2.956362, 0.04313726, 1, 0, 1,
-0.4865963, -0.1790272, -2.175689, 0.03921569, 1, 0, 1,
-0.4842505, 0.1420248, -0.9424291, 0.03137255, 1, 0, 1,
-0.4821832, -0.6876571, -3.37918, 0.02745098, 1, 0, 1,
-0.4802475, -1.65204, -4.068301, 0.01960784, 1, 0, 1,
-0.4638186, 0.2178904, -3.268979, 0.01568628, 1, 0, 1,
-0.4623435, -0.7563357, -2.797544, 0.007843138, 1, 0, 1,
-0.4597849, 1.070951, 0.6086026, 0.003921569, 1, 0, 1,
-0.4592117, -0.2875809, -2.165361, 0, 1, 0.003921569, 1,
-0.4590261, 0.06106541, -1.043233, 0, 1, 0.01176471, 1,
-0.4546484, -0.4602528, -3.81953, 0, 1, 0.01568628, 1,
-0.4492251, 0.1634937, -1.066049, 0, 1, 0.02352941, 1,
-0.441191, 0.4128631, -0.4476683, 0, 1, 0.02745098, 1,
-0.4402317, 0.2276805, 0.6290894, 0, 1, 0.03529412, 1,
-0.4379648, -0.3853691, -1.956079, 0, 1, 0.03921569, 1,
-0.43612, -0.3039744, -2.390285, 0, 1, 0.04705882, 1,
-0.4360738, 1.282941, -0.3137271, 0, 1, 0.05098039, 1,
-0.4338087, -0.6026685, -2.073464, 0, 1, 0.05882353, 1,
-0.4337644, 0.6519101, -2.408647, 0, 1, 0.0627451, 1,
-0.4335535, 2.368824, -1.322352, 0, 1, 0.07058824, 1,
-0.4278844, 0.5103849, -0.5169837, 0, 1, 0.07450981, 1,
-0.4264493, -0.4802535, -4.447315, 0, 1, 0.08235294, 1,
-0.4248825, -1.356798, -1.766308, 0, 1, 0.08627451, 1,
-0.4222918, -0.8019705, -2.640882, 0, 1, 0.09411765, 1,
-0.4199031, 1.626116, -0.1841865, 0, 1, 0.1019608, 1,
-0.4191141, -0.9842338, -2.592388, 0, 1, 0.1058824, 1,
-0.4141278, 1.001037, 0.1542518, 0, 1, 0.1137255, 1,
-0.4089922, 2.180618, 0.8603243, 0, 1, 0.1176471, 1,
-0.4032867, 2.341762, -2.263245, 0, 1, 0.1254902, 1,
-0.4029571, 1.630494, -0.124172, 0, 1, 0.1294118, 1,
-0.4008264, 0.6767975, -1.144632, 0, 1, 0.1372549, 1,
-0.3967957, -0.4901836, -2.760732, 0, 1, 0.1411765, 1,
-0.3958454, 1.039688, 0.5440414, 0, 1, 0.1490196, 1,
-0.3919282, -0.375068, -0.8765849, 0, 1, 0.1529412, 1,
-0.3916187, -0.6924714, -2.72865, 0, 1, 0.1607843, 1,
-0.3908834, -1.091066, -3.855662, 0, 1, 0.1647059, 1,
-0.3866487, 1.118175, -0.9302083, 0, 1, 0.172549, 1,
-0.3863566, 1.217358, -0.1668429, 0, 1, 0.1764706, 1,
-0.3854014, 1.685876, -0.8576795, 0, 1, 0.1843137, 1,
-0.3798259, -0.1232267, -1.621547, 0, 1, 0.1882353, 1,
-0.3779232, 0.4174609, -0.4984379, 0, 1, 0.1960784, 1,
-0.3758518, -0.05815537, -0.839116, 0, 1, 0.2039216, 1,
-0.3704715, 0.08528693, -3.042168, 0, 1, 0.2078431, 1,
-0.3591305, -0.9294537, -0.2069152, 0, 1, 0.2156863, 1,
-0.3585906, 0.4544286, 0.1476962, 0, 1, 0.2196078, 1,
-0.3575949, -0.6144574, -1.970378, 0, 1, 0.227451, 1,
-0.3540472, 0.5179967, -1.190516, 0, 1, 0.2313726, 1,
-0.3524828, 0.03459971, -1.888462, 0, 1, 0.2392157, 1,
-0.3485393, 0.1482435, -0.2799169, 0, 1, 0.2431373, 1,
-0.3464898, -0.9029781, -4.317695, 0, 1, 0.2509804, 1,
-0.345852, 0.6558618, -1.05149, 0, 1, 0.254902, 1,
-0.3451952, -1.300183, -2.749655, 0, 1, 0.2627451, 1,
-0.3409085, -1.381741, -3.05768, 0, 1, 0.2666667, 1,
-0.3380728, -0.5180741, -1.76245, 0, 1, 0.2745098, 1,
-0.3379733, 0.2760845, -0.604717, 0, 1, 0.2784314, 1,
-0.3356746, 2.271552, -0.7187182, 0, 1, 0.2862745, 1,
-0.3343912, -0.959815, -2.217073, 0, 1, 0.2901961, 1,
-0.3316633, -0.06869532, -2.102136, 0, 1, 0.2980392, 1,
-0.3314447, -2.661762, -3.710428, 0, 1, 0.3058824, 1,
-0.3249901, -0.9251959, -2.27109, 0, 1, 0.3098039, 1,
-0.322898, -1.38871, -1.603799, 0, 1, 0.3176471, 1,
-0.322002, 1.575252, -1.348283, 0, 1, 0.3215686, 1,
-0.3175944, -1.397756, -2.902784, 0, 1, 0.3294118, 1,
-0.3129995, 2.171329, 0.2058509, 0, 1, 0.3333333, 1,
-0.3107885, -0.469007, -2.174276, 0, 1, 0.3411765, 1,
-0.3093773, -1.38599, -1.867286, 0, 1, 0.345098, 1,
-0.3066388, 0.06268176, -0.7156991, 0, 1, 0.3529412, 1,
-0.3046942, -1.487249, -1.0729, 0, 1, 0.3568628, 1,
-0.303038, -0.2933899, -2.377739, 0, 1, 0.3647059, 1,
-0.3004566, -0.8957539, -1.753471, 0, 1, 0.3686275, 1,
-0.294115, -1.784996, -1.787068, 0, 1, 0.3764706, 1,
-0.2928749, 1.774676, 0.364816, 0, 1, 0.3803922, 1,
-0.2905904, 0.8679886, -0.393381, 0, 1, 0.3882353, 1,
-0.2886267, -0.3281453, -2.412541, 0, 1, 0.3921569, 1,
-0.287296, 0.2089145, -0.5733877, 0, 1, 0.4, 1,
-0.2858644, 0.07338128, -1.529691, 0, 1, 0.4078431, 1,
-0.284912, 0.6199822, -1.322855, 0, 1, 0.4117647, 1,
-0.2839207, -1.7294, -2.944356, 0, 1, 0.4196078, 1,
-0.2836446, 0.1300953, -0.7061276, 0, 1, 0.4235294, 1,
-0.279825, -0.9079555, -3.516333, 0, 1, 0.4313726, 1,
-0.2762029, 0.3769559, -1.641723, 0, 1, 0.4352941, 1,
-0.2711974, 0.8930633, -0.4038285, 0, 1, 0.4431373, 1,
-0.2706133, 0.6966109, 1.328503, 0, 1, 0.4470588, 1,
-0.2692189, -0.4038501, -2.144581, 0, 1, 0.454902, 1,
-0.2665745, 0.7412941, -0.6628408, 0, 1, 0.4588235, 1,
-0.2662552, 0.8364351, 0.3345811, 0, 1, 0.4666667, 1,
-0.2645729, 0.3383461, 0.8667436, 0, 1, 0.4705882, 1,
-0.2637827, 0.3465117, -0.4479156, 0, 1, 0.4784314, 1,
-0.2636841, 0.8399372, -0.4914243, 0, 1, 0.4823529, 1,
-0.2629489, -1.186929, -4.294037, 0, 1, 0.4901961, 1,
-0.2533299, 0.7845231, -0.6443656, 0, 1, 0.4941176, 1,
-0.2503553, -1.262432, -3.156427, 0, 1, 0.5019608, 1,
-0.2476949, -3.252694, -3.061826, 0, 1, 0.509804, 1,
-0.2465194, 0.6041383, -0.5915887, 0, 1, 0.5137255, 1,
-0.2433781, -1.019928, -4.686741, 0, 1, 0.5215687, 1,
-0.2401851, 1.619021, 1.943811, 0, 1, 0.5254902, 1,
-0.2394698, -0.5418994, -1.616366, 0, 1, 0.5333334, 1,
-0.2378289, 0.6801072, -0.2481594, 0, 1, 0.5372549, 1,
-0.2370049, 0.2045081, -1.707361, 0, 1, 0.5450981, 1,
-0.2353117, -0.2988841, -3.28165, 0, 1, 0.5490196, 1,
-0.2336914, -0.8351775, -5.082315, 0, 1, 0.5568628, 1,
-0.2294359, 0.1189116, -2.088972, 0, 1, 0.5607843, 1,
-0.2286903, -0.6321194, -4.604078, 0, 1, 0.5686275, 1,
-0.2276271, 0.2305713, 0.9476179, 0, 1, 0.572549, 1,
-0.2245771, -0.06531926, -2.845464, 0, 1, 0.5803922, 1,
-0.2089481, 0.6282621, -0.7948654, 0, 1, 0.5843138, 1,
-0.2068914, 0.9600399, -0.4333883, 0, 1, 0.5921569, 1,
-0.2068149, 0.5573382, -1.310414, 0, 1, 0.5960785, 1,
-0.2023243, 1.027499, 0.0646408, 0, 1, 0.6039216, 1,
-0.2006777, -1.044938, -3.248762, 0, 1, 0.6117647, 1,
-0.1987533, 0.2275139, -1.588491, 0, 1, 0.6156863, 1,
-0.1960358, -1.768267, -2.15561, 0, 1, 0.6235294, 1,
-0.1945701, 1.79189, 0.05957904, 0, 1, 0.627451, 1,
-0.1925087, -0.3469595, -2.288948, 0, 1, 0.6352941, 1,
-0.1910545, 1.07016, -0.002664343, 0, 1, 0.6392157, 1,
-0.1855808, 0.4413106, 0.2613131, 0, 1, 0.6470588, 1,
-0.1844674, 0.8974829, 0.1868635, 0, 1, 0.6509804, 1,
-0.1831526, 2.008034, 0.9080948, 0, 1, 0.6588235, 1,
-0.1807403, 1.223167, -0.3317612, 0, 1, 0.6627451, 1,
-0.1771794, -1.151597, -3.639587, 0, 1, 0.6705883, 1,
-0.1748415, 0.4606913, 0.008956362, 0, 1, 0.6745098, 1,
-0.1729261, -1.135907, -4.089461, 0, 1, 0.682353, 1,
-0.1712151, -1.829969, -2.985463, 0, 1, 0.6862745, 1,
-0.1708863, 0.07452212, -0.4444225, 0, 1, 0.6941177, 1,
-0.1707352, 0.9630666, -1.613033, 0, 1, 0.7019608, 1,
-0.1690501, 1.302553, -0.2533482, 0, 1, 0.7058824, 1,
-0.1687723, -0.1556309, -1.765535, 0, 1, 0.7137255, 1,
-0.1413726, 1.103719, 1.212516, 0, 1, 0.7176471, 1,
-0.1358644, 0.2687761, -1.60866, 0, 1, 0.7254902, 1,
-0.1326815, -1.337239, -3.533324, 0, 1, 0.7294118, 1,
-0.1323081, -0.4783052, -3.284353, 0, 1, 0.7372549, 1,
-0.1312412, 0.4797411, -0.7098929, 0, 1, 0.7411765, 1,
-0.127939, -0.2307125, -3.890832, 0, 1, 0.7490196, 1,
-0.127493, -0.7574808, -3.898303, 0, 1, 0.7529412, 1,
-0.1273095, 0.7362976, -0.5269944, 0, 1, 0.7607843, 1,
-0.1258414, 0.2056369, -0.9878623, 0, 1, 0.7647059, 1,
-0.1241987, 0.08871505, -1.602186, 0, 1, 0.772549, 1,
-0.120721, 2.962155, -1.420173, 0, 1, 0.7764706, 1,
-0.1106724, -1.799639, -3.121085, 0, 1, 0.7843137, 1,
-0.1059412, -0.04734715, -0.8864099, 0, 1, 0.7882353, 1,
-0.101283, -0.1758495, -4.207705, 0, 1, 0.7960784, 1,
-0.1007994, -0.3220724, -4.948244, 0, 1, 0.8039216, 1,
-0.09805033, 1.189177, -1.897888, 0, 1, 0.8078431, 1,
-0.07790703, 0.2809978, 0.5356318, 0, 1, 0.8156863, 1,
-0.07724858, -0.607639, -2.875117, 0, 1, 0.8196079, 1,
-0.07568868, 1.084761, 1.301611, 0, 1, 0.827451, 1,
-0.07565413, 0.7224587, 1.171947, 0, 1, 0.8313726, 1,
-0.07493324, 0.2173543, 0.4884119, 0, 1, 0.8392157, 1,
-0.0711576, 1.331959, -1.106161, 0, 1, 0.8431373, 1,
-0.06765769, 0.279053, -0.1557163, 0, 1, 0.8509804, 1,
-0.0648256, -0.01163165, -0.9650446, 0, 1, 0.854902, 1,
-0.06026936, 0.3419454, -0.603947, 0, 1, 0.8627451, 1,
-0.05995973, 0.5574426, 0.9109495, 0, 1, 0.8666667, 1,
-0.05393171, -0.8391934, -2.441383, 0, 1, 0.8745098, 1,
-0.05180112, -0.09539127, -2.308856, 0, 1, 0.8784314, 1,
-0.05010378, -1.430633, -2.367304, 0, 1, 0.8862745, 1,
-0.04966897, 0.03597699, -1.747207, 0, 1, 0.8901961, 1,
-0.04459755, -0.9277409, -2.133902, 0, 1, 0.8980392, 1,
-0.03946114, -0.009647522, -1.889141, 0, 1, 0.9058824, 1,
-0.03916552, -0.7774686, -2.202776, 0, 1, 0.9098039, 1,
-0.03391507, -1.446749, -3.137131, 0, 1, 0.9176471, 1,
-0.03284598, 0.236221, 2.000572, 0, 1, 0.9215686, 1,
-0.03224091, 1.070704, -0.2487047, 0, 1, 0.9294118, 1,
-0.02953423, -0.4006507, -4.35699, 0, 1, 0.9333333, 1,
-0.0268992, -0.7999382, -3.683945, 0, 1, 0.9411765, 1,
-0.02592551, -1.308716, -2.291221, 0, 1, 0.945098, 1,
-0.02435926, -0.5410705, -4.403183, 0, 1, 0.9529412, 1,
-0.0222345, -0.03513496, -1.712318, 0, 1, 0.9568627, 1,
-0.02069954, 1.734142, 0.6330698, 0, 1, 0.9647059, 1,
-0.02043656, 0.8723681, 1.092204, 0, 1, 0.9686275, 1,
-0.0203949, -0.7116181, -2.565621, 0, 1, 0.9764706, 1,
-0.01979619, 0.481411, -0.01142236, 0, 1, 0.9803922, 1,
-0.01963592, 0.9140651, 1.513012, 0, 1, 0.9882353, 1,
-0.01958565, 1.341552, -1.000743, 0, 1, 0.9921569, 1,
-0.01924603, -0.8945398, -4.121659, 0, 1, 1, 1,
-0.01805371, -0.7078601, -2.105304, 0, 0.9921569, 1, 1,
-0.01744659, 1.304871, -0.1829735, 0, 0.9882353, 1, 1,
-0.01484049, 1.399607, -0.9382874, 0, 0.9803922, 1, 1,
-0.014742, -2.182278, -3.078168, 0, 0.9764706, 1, 1,
-0.01288033, 0.3087514, -1.341351, 0, 0.9686275, 1, 1,
-0.01213431, -0.04038971, -2.332078, 0, 0.9647059, 1, 1,
-0.009336567, 0.2284408, -2.255917, 0, 0.9568627, 1, 1,
-0.008960154, 0.484795, -0.3772221, 0, 0.9529412, 1, 1,
-0.00879881, 0.455535, 0.3859721, 0, 0.945098, 1, 1,
-0.007577794, -1.191229, -3.66024, 0, 0.9411765, 1, 1,
-0.006426018, 0.05763282, -0.08336127, 0, 0.9333333, 1, 1,
-0.0001747054, 1.32245, -0.3110715, 0, 0.9294118, 1, 1,
0.001160763, -0.5505301, 3.56641, 0, 0.9215686, 1, 1,
0.004183707, -0.2280564, 2.462656, 0, 0.9176471, 1, 1,
0.005542598, 0.2281131, 1.703727, 0, 0.9098039, 1, 1,
0.006074119, 0.3522015, -0.1094525, 0, 0.9058824, 1, 1,
0.006822044, -0.7261132, 3.584619, 0, 0.8980392, 1, 1,
0.008041812, 0.6790177, -0.08044583, 0, 0.8901961, 1, 1,
0.00952408, -0.7890079, 4.12061, 0, 0.8862745, 1, 1,
0.009903503, -0.6935449, 4.63053, 0, 0.8784314, 1, 1,
0.01146123, 0.380617, 0.4921934, 0, 0.8745098, 1, 1,
0.01497599, 0.4472698, 0.4634621, 0, 0.8666667, 1, 1,
0.01890114, -1.090877, 3.615255, 0, 0.8627451, 1, 1,
0.01930497, 0.4711053, -1.656898, 0, 0.854902, 1, 1,
0.01963745, 0.5522012, -0.1095025, 0, 0.8509804, 1, 1,
0.02155012, -3.071526, 1.782932, 0, 0.8431373, 1, 1,
0.02157012, 1.185485, 0.4533905, 0, 0.8392157, 1, 1,
0.0230035, 0.4300324, 1.366967, 0, 0.8313726, 1, 1,
0.0248992, 0.4486643, -1.107363, 0, 0.827451, 1, 1,
0.03040505, 1.702668, -1.367477, 0, 0.8196079, 1, 1,
0.03217305, -1.671377, 3.471178, 0, 0.8156863, 1, 1,
0.03345008, 1.474273, -1.214666, 0, 0.8078431, 1, 1,
0.03854809, 0.4239179, 0.738007, 0, 0.8039216, 1, 1,
0.04093876, 1.278375, -0.5770135, 0, 0.7960784, 1, 1,
0.04106231, 1.295624, -0.7664748, 0, 0.7882353, 1, 1,
0.04226035, -1.653674, 3.009475, 0, 0.7843137, 1, 1,
0.04788678, 0.6709193, 2.557066, 0, 0.7764706, 1, 1,
0.04813228, 2.433124, -0.0657867, 0, 0.772549, 1, 1,
0.0486799, -1.164499, 3.519456, 0, 0.7647059, 1, 1,
0.05076007, 0.1430125, -0.8113077, 0, 0.7607843, 1, 1,
0.05197972, 1.00875, -2.318792, 0, 0.7529412, 1, 1,
0.05302736, 1.46912, 0.9348643, 0, 0.7490196, 1, 1,
0.0563988, 0.1297676, -1.335566, 0, 0.7411765, 1, 1,
0.05706027, 0.1044147, 1.003137, 0, 0.7372549, 1, 1,
0.06091902, 1.185389, 0.1646329, 0, 0.7294118, 1, 1,
0.06327534, 1.236331, 0.991872, 0, 0.7254902, 1, 1,
0.06878299, -0.2400439, 3.214695, 0, 0.7176471, 1, 1,
0.06961871, -0.8797435, 3.025687, 0, 0.7137255, 1, 1,
0.08429439, -0.4822818, 2.632949, 0, 0.7058824, 1, 1,
0.0854113, -0.5891199, 2.859285, 0, 0.6980392, 1, 1,
0.08543988, -1.719918, 4.065616, 0, 0.6941177, 1, 1,
0.08761077, 0.4734973, -0.7876296, 0, 0.6862745, 1, 1,
0.09157176, -2.316549, 2.178699, 0, 0.682353, 1, 1,
0.1014523, 1.007611, 1.507045, 0, 0.6745098, 1, 1,
0.104649, -0.6814084, 4.495541, 0, 0.6705883, 1, 1,
0.1047418, -0.9729242, 4.333436, 0, 0.6627451, 1, 1,
0.105075, -0.9133553, 0.4477264, 0, 0.6588235, 1, 1,
0.1055745, -1.81654, 1.536622, 0, 0.6509804, 1, 1,
0.1071653, 0.9780696, 0.5698758, 0, 0.6470588, 1, 1,
0.1075404, -1.019063, 3.701212, 0, 0.6392157, 1, 1,
0.1080175, -0.1766796, 4.139085, 0, 0.6352941, 1, 1,
0.1081078, -0.2378582, 2.389729, 0, 0.627451, 1, 1,
0.109251, 0.4868238, 0.6433274, 0, 0.6235294, 1, 1,
0.1118446, -1.91581, 2.983979, 0, 0.6156863, 1, 1,
0.1159643, -0.2052017, 1.955622, 0, 0.6117647, 1, 1,
0.1171763, 1.767031, -1.517184, 0, 0.6039216, 1, 1,
0.1173057, 0.4762369, 1.398107, 0, 0.5960785, 1, 1,
0.1204366, 1.253101, -0.105884, 0, 0.5921569, 1, 1,
0.1206241, 0.3699521, 0.7018324, 0, 0.5843138, 1, 1,
0.1218559, 0.3806831, 0.7110991, 0, 0.5803922, 1, 1,
0.1223162, -0.4945911, 3.588004, 0, 0.572549, 1, 1,
0.1244091, -0.1127463, 2.754968, 0, 0.5686275, 1, 1,
0.1246747, 0.7976098, -1.469389, 0, 0.5607843, 1, 1,
0.1280892, -0.804168, 2.287463, 0, 0.5568628, 1, 1,
0.1323068, 1.250086, 0.2252394, 0, 0.5490196, 1, 1,
0.1342221, 0.2828724, -1.439289, 0, 0.5450981, 1, 1,
0.135077, -1.053353, 3.314508, 0, 0.5372549, 1, 1,
0.1470476, -0.5432506, 1.550956, 0, 0.5333334, 1, 1,
0.148706, 0.4866721, 1.693447, 0, 0.5254902, 1, 1,
0.1494067, 0.9316047, 0.5131474, 0, 0.5215687, 1, 1,
0.1494136, 1.343296, -0.5747465, 0, 0.5137255, 1, 1,
0.14946, 1.397506, -0.7139374, 0, 0.509804, 1, 1,
0.1515143, -0.02814051, 1.129895, 0, 0.5019608, 1, 1,
0.1521101, 0.7773181, -0.6864556, 0, 0.4941176, 1, 1,
0.1541298, -0.4964536, 2.523086, 0, 0.4901961, 1, 1,
0.1559515, 0.757664, 0.968914, 0, 0.4823529, 1, 1,
0.1566326, 1.436041, 0.02281406, 0, 0.4784314, 1, 1,
0.1569484, 1.017014, -0.3925756, 0, 0.4705882, 1, 1,
0.1585066, -1.674108, 2.735159, 0, 0.4666667, 1, 1,
0.162056, -0.3464141, 1.665858, 0, 0.4588235, 1, 1,
0.1630027, -1.06817, 3.617518, 0, 0.454902, 1, 1,
0.163873, 0.06615548, 2.07203, 0, 0.4470588, 1, 1,
0.1689766, -1.566635, 4.769694, 0, 0.4431373, 1, 1,
0.1701708, -0.1090058, 2.805773, 0, 0.4352941, 1, 1,
0.1720714, -0.3363657, 2.838231, 0, 0.4313726, 1, 1,
0.1756055, -1.447538, 1.718795, 0, 0.4235294, 1, 1,
0.1798633, -0.7244196, 5.713838, 0, 0.4196078, 1, 1,
0.1889206, -0.9715642, 1.801768, 0, 0.4117647, 1, 1,
0.1890438, 0.4095553, -0.8625628, 0, 0.4078431, 1, 1,
0.1890682, -2.175591, 2.003826, 0, 0.4, 1, 1,
0.1902164, -2.309455, 3.551554, 0, 0.3921569, 1, 1,
0.1955823, 0.9233251, 0.3791209, 0, 0.3882353, 1, 1,
0.1975094, 0.6854013, -0.4570852, 0, 0.3803922, 1, 1,
0.1980296, -0.1988313, 2.782042, 0, 0.3764706, 1, 1,
0.2000592, -0.4892855, 2.876044, 0, 0.3686275, 1, 1,
0.2043042, -0.3186064, 4.212625, 0, 0.3647059, 1, 1,
0.2080592, -0.6356924, 4.488884, 0, 0.3568628, 1, 1,
0.2106458, -1.071323, 2.077801, 0, 0.3529412, 1, 1,
0.2107897, 1.41554, 0.3120317, 0, 0.345098, 1, 1,
0.2109492, 2.094272, 0.8656366, 0, 0.3411765, 1, 1,
0.2160839, -0.5017525, 2.88969, 0, 0.3333333, 1, 1,
0.2163005, 0.2637374, 0.581601, 0, 0.3294118, 1, 1,
0.217248, -0.1031567, 2.184451, 0, 0.3215686, 1, 1,
0.2185707, 0.2926985, 0.8325579, 0, 0.3176471, 1, 1,
0.219667, 0.4327575, 0.1128246, 0, 0.3098039, 1, 1,
0.2203837, -0.1755789, 2.314789, 0, 0.3058824, 1, 1,
0.2278133, 0.866435, -0.7648195, 0, 0.2980392, 1, 1,
0.2311088, -1.169327, 4.006006, 0, 0.2901961, 1, 1,
0.2323497, -2.142171, 4.465721, 0, 0.2862745, 1, 1,
0.2329184, -1.526604, 3.458888, 0, 0.2784314, 1, 1,
0.2367027, -1.02764, 1.59729, 0, 0.2745098, 1, 1,
0.2368665, 0.3152635, -1.553738, 0, 0.2666667, 1, 1,
0.238989, 0.5802078, 2.786491, 0, 0.2627451, 1, 1,
0.2467065, 1.88463, -0.241769, 0, 0.254902, 1, 1,
0.247545, 2.947254, -1.158385, 0, 0.2509804, 1, 1,
0.2516962, 1.20992, -0.3015062, 0, 0.2431373, 1, 1,
0.2545307, -1.56987, 2.903785, 0, 0.2392157, 1, 1,
0.2551607, -0.2021432, 1.763653, 0, 0.2313726, 1, 1,
0.2613277, -0.5856204, 3.321804, 0, 0.227451, 1, 1,
0.264663, 0.2470245, 4.081966, 0, 0.2196078, 1, 1,
0.2667367, -1.431853, 2.19761, 0, 0.2156863, 1, 1,
0.2670571, 0.2834534, -0.9374767, 0, 0.2078431, 1, 1,
0.2685353, 0.1042692, 0.1900946, 0, 0.2039216, 1, 1,
0.2709654, -1.346363, 1.07222, 0, 0.1960784, 1, 1,
0.2717884, -0.05629549, 2.035216, 0, 0.1882353, 1, 1,
0.276874, 0.2898702, 1.170217, 0, 0.1843137, 1, 1,
0.2795438, 0.5065836, -0.6756715, 0, 0.1764706, 1, 1,
0.2802632, -1.329348, 3.502307, 0, 0.172549, 1, 1,
0.2809176, -0.8073252, 4.945011, 0, 0.1647059, 1, 1,
0.2849462, -1.729362, 4.278306, 0, 0.1607843, 1, 1,
0.2859857, 1.095478, 1.08098, 0, 0.1529412, 1, 1,
0.2908401, 0.9975332, 0.3206194, 0, 0.1490196, 1, 1,
0.2937482, -0.8655435, 3.193476, 0, 0.1411765, 1, 1,
0.2952586, -0.7251965, 3.394262, 0, 0.1372549, 1, 1,
0.2983656, 0.3468229, 1.709124, 0, 0.1294118, 1, 1,
0.3025721, 0.8659004, 1.127334, 0, 0.1254902, 1, 1,
0.3026392, 0.2184046, -0.554976, 0, 0.1176471, 1, 1,
0.3096416, 0.9554091, 0.6677481, 0, 0.1137255, 1, 1,
0.3107282, 0.3441606, 0.2306596, 0, 0.1058824, 1, 1,
0.3140472, -0.5426376, 3.111258, 0, 0.09803922, 1, 1,
0.3156809, -0.8629183, 2.432751, 0, 0.09411765, 1, 1,
0.3166218, 0.1749222, 0.8316096, 0, 0.08627451, 1, 1,
0.3243774, 0.4469199, 1.959175, 0, 0.08235294, 1, 1,
0.3246069, -1.42651, 3.270985, 0, 0.07450981, 1, 1,
0.3269139, -0.02184607, 0.2107234, 0, 0.07058824, 1, 1,
0.3310932, -0.0211974, 1.578448, 0, 0.0627451, 1, 1,
0.3315126, -0.4034781, 1.407925, 0, 0.05882353, 1, 1,
0.3335703, -0.2076293, 2.593272, 0, 0.05098039, 1, 1,
0.336282, -1.643823, 3.947576, 0, 0.04705882, 1, 1,
0.3472129, 0.2289328, 0.545316, 0, 0.03921569, 1, 1,
0.3530213, 0.1323106, 0.8376672, 0, 0.03529412, 1, 1,
0.3538025, 0.297709, 0.4159171, 0, 0.02745098, 1, 1,
0.354252, 0.09587766, 3.02655, 0, 0.02352941, 1, 1,
0.3571157, 2.087861, -0.2378748, 0, 0.01568628, 1, 1,
0.3633569, 0.09306407, 2.835822, 0, 0.01176471, 1, 1,
0.3637167, -0.08396423, 0.794356, 0, 0.003921569, 1, 1,
0.3667498, -0.7630486, 3.749438, 0.003921569, 0, 1, 1,
0.3677441, -0.114835, 2.989519, 0.007843138, 0, 1, 1,
0.3749918, 1.008938, 0.6895839, 0.01568628, 0, 1, 1,
0.3781919, 1.180977, 0.8603804, 0.01960784, 0, 1, 1,
0.3785421, 0.4248644, 0.8883296, 0.02745098, 0, 1, 1,
0.3789487, -0.2181866, 1.995754, 0.03137255, 0, 1, 1,
0.381116, -0.7678368, 2.0189, 0.03921569, 0, 1, 1,
0.3819292, 0.3330648, -0.4993288, 0.04313726, 0, 1, 1,
0.3827293, 0.244748, 0.07696664, 0.05098039, 0, 1, 1,
0.3869515, 1.362401, 0.977023, 0.05490196, 0, 1, 1,
0.3870499, -0.02726023, 3.353596, 0.0627451, 0, 1, 1,
0.3903699, -0.989415, 2.091268, 0.06666667, 0, 1, 1,
0.3966044, 0.3420631, -0.4587229, 0.07450981, 0, 1, 1,
0.3979856, 0.7184983, -0.9376033, 0.07843138, 0, 1, 1,
0.3980372, -1.006425, 1.551124, 0.08627451, 0, 1, 1,
0.4002743, -0.7843173, 2.336652, 0.09019608, 0, 1, 1,
0.4018347, 0.5814821, 0.9911961, 0.09803922, 0, 1, 1,
0.4032922, -1.031763, 4.295942, 0.1058824, 0, 1, 1,
0.40353, -0.4930701, 2.249856, 0.1098039, 0, 1, 1,
0.4036324, 0.8384182, 1.254739, 0.1176471, 0, 1, 1,
0.4062451, -0.9402651, 2.603054, 0.1215686, 0, 1, 1,
0.4082586, 0.01946204, 2.273824, 0.1294118, 0, 1, 1,
0.4087854, 0.08751544, 1.881863, 0.1333333, 0, 1, 1,
0.4122051, 1.095581, 0.2670523, 0.1411765, 0, 1, 1,
0.4133631, 0.4402171, 0.9772146, 0.145098, 0, 1, 1,
0.4185503, -0.03961889, 2.15974, 0.1529412, 0, 1, 1,
0.4190022, 0.4005137, 0.6267474, 0.1568628, 0, 1, 1,
0.4194143, -0.7688336, 3.454293, 0.1647059, 0, 1, 1,
0.4210317, 0.7302023, -0.9244546, 0.1686275, 0, 1, 1,
0.4245485, -0.5483191, 2.513949, 0.1764706, 0, 1, 1,
0.4292693, 0.3820338, 1.457525, 0.1803922, 0, 1, 1,
0.4329958, 1.103736, -0.7477512, 0.1882353, 0, 1, 1,
0.439948, 2.809682, 0.4607136, 0.1921569, 0, 1, 1,
0.4411766, 0.2480339, -0.519464, 0.2, 0, 1, 1,
0.4423288, 0.08829267, 1.224307, 0.2078431, 0, 1, 1,
0.4438272, -1.87756, 2.402412, 0.2117647, 0, 1, 1,
0.4493994, -0.565789, 1.408726, 0.2196078, 0, 1, 1,
0.4556024, -1.213436, 0.963229, 0.2235294, 0, 1, 1,
0.4564294, 1.466506, -0.4498324, 0.2313726, 0, 1, 1,
0.4588372, -0.2101257, 2.639311, 0.2352941, 0, 1, 1,
0.4622674, -1.767246, 2.807108, 0.2431373, 0, 1, 1,
0.4628475, -1.131912, 2.357323, 0.2470588, 0, 1, 1,
0.4630157, 0.5190647, 0.2647223, 0.254902, 0, 1, 1,
0.4674444, 0.701095, 1.683025, 0.2588235, 0, 1, 1,
0.4676671, 0.3114509, -0.03480205, 0.2666667, 0, 1, 1,
0.4681421, -0.3655939, 1.864389, 0.2705882, 0, 1, 1,
0.4751528, -0.4195305, 1.415837, 0.2784314, 0, 1, 1,
0.4753639, 1.497854, 0.01979301, 0.282353, 0, 1, 1,
0.4785735, 3.167189, 1.071855, 0.2901961, 0, 1, 1,
0.4804259, -1.241885, 3.879713, 0.2941177, 0, 1, 1,
0.4804647, -2.093279, 3.110166, 0.3019608, 0, 1, 1,
0.4812707, -0.7094983, 1.682871, 0.3098039, 0, 1, 1,
0.493515, -0.9814722, 3.826916, 0.3137255, 0, 1, 1,
0.5064263, 1.191789, -0.1860912, 0.3215686, 0, 1, 1,
0.5126498, -0.2441701, 1.498861, 0.3254902, 0, 1, 1,
0.5162157, -0.04370853, 3.06988, 0.3333333, 0, 1, 1,
0.5172682, 0.3819578, 1.708113, 0.3372549, 0, 1, 1,
0.5203713, 0.2457415, 1.632622, 0.345098, 0, 1, 1,
0.5214559, -0.8874279, 3.656597, 0.3490196, 0, 1, 1,
0.5268915, -0.5588613, 4.434335, 0.3568628, 0, 1, 1,
0.5293816, -0.02601929, 2.437043, 0.3607843, 0, 1, 1,
0.5336311, -0.4174115, 1.086323, 0.3686275, 0, 1, 1,
0.5349658, -0.8437049, 3.570209, 0.372549, 0, 1, 1,
0.5430053, 1.022935, 0.8526672, 0.3803922, 0, 1, 1,
0.5482035, 0.2825279, 1.466196, 0.3843137, 0, 1, 1,
0.5488811, -1.038043, 2.758246, 0.3921569, 0, 1, 1,
0.5494706, -0.6005594, 2.288995, 0.3960784, 0, 1, 1,
0.5510479, -1.397557, 3.034117, 0.4039216, 0, 1, 1,
0.5583091, 0.4163593, 0.7724624, 0.4117647, 0, 1, 1,
0.5623279, 1.450471, -0.971141, 0.4156863, 0, 1, 1,
0.5661709, -0.5188912, 2.503486, 0.4235294, 0, 1, 1,
0.5715496, 0.07735012, 0.5253523, 0.427451, 0, 1, 1,
0.5727876, -0.1333762, 2.261777, 0.4352941, 0, 1, 1,
0.5840475, 0.9521834, -0.5792586, 0.4392157, 0, 1, 1,
0.58806, 1.007617, -0.1825479, 0.4470588, 0, 1, 1,
0.5892668, 0.1798491, 1.0296, 0.4509804, 0, 1, 1,
0.5943313, 1.614671, -1.380041, 0.4588235, 0, 1, 1,
0.5948662, 0.8381537, 1.001561, 0.4627451, 0, 1, 1,
0.596211, -0.06472835, 0.2673295, 0.4705882, 0, 1, 1,
0.5995181, -0.7995437, 3.023495, 0.4745098, 0, 1, 1,
0.6015737, -1.96517, 4.242509, 0.4823529, 0, 1, 1,
0.603828, 1.080926, 1.114986, 0.4862745, 0, 1, 1,
0.6084018, 0.8355671, 1.275045, 0.4941176, 0, 1, 1,
0.6116564, 0.3277948, 1.295405, 0.5019608, 0, 1, 1,
0.6155604, -0.2124757, 0.9436054, 0.5058824, 0, 1, 1,
0.6163908, 1.044785, 0.02053487, 0.5137255, 0, 1, 1,
0.6170859, -0.6406523, 2.207607, 0.5176471, 0, 1, 1,
0.6200302, 0.6387015, 0.123782, 0.5254902, 0, 1, 1,
0.6217595, 0.3275017, 0.5319815, 0.5294118, 0, 1, 1,
0.6232372, 0.8823868, -0.9920295, 0.5372549, 0, 1, 1,
0.6257662, 0.5956616, 1.005034, 0.5411765, 0, 1, 1,
0.6262622, 0.07177065, 1.576045, 0.5490196, 0, 1, 1,
0.62773, -0.03693494, 2.208808, 0.5529412, 0, 1, 1,
0.6291015, 0.8013968, 0.2364666, 0.5607843, 0, 1, 1,
0.6298093, 0.3973211, 0.7266906, 0.5647059, 0, 1, 1,
0.6306375, -2.831656, 2.35784, 0.572549, 0, 1, 1,
0.6389863, -1.060938, 3.662535, 0.5764706, 0, 1, 1,
0.6425848, -0.6257063, 2.814496, 0.5843138, 0, 1, 1,
0.6602964, 0.5524463, 0.3411953, 0.5882353, 0, 1, 1,
0.6630564, -1.640318, 5.040733, 0.5960785, 0, 1, 1,
0.6648573, 1.410939, 0.2726095, 0.6039216, 0, 1, 1,
0.6700309, 0.003753366, 0.6489535, 0.6078432, 0, 1, 1,
0.6726499, 0.7770286, 0.6729201, 0.6156863, 0, 1, 1,
0.67778, 0.1738773, 2.983388, 0.6196079, 0, 1, 1,
0.6813152, -1.381767, 3.692577, 0.627451, 0, 1, 1,
0.683593, -1.328625, 3.813339, 0.6313726, 0, 1, 1,
0.6841856, 1.468917, -0.5530214, 0.6392157, 0, 1, 1,
0.686091, -1.263772, 2.603705, 0.6431373, 0, 1, 1,
0.6894547, -0.1584492, 0.9873613, 0.6509804, 0, 1, 1,
0.6964056, -1.429603, 1.562311, 0.654902, 0, 1, 1,
0.7001571, -0.07515343, 3.227528, 0.6627451, 0, 1, 1,
0.7011726, -0.1520885, 2.811108, 0.6666667, 0, 1, 1,
0.7012137, 0.5502887, 1.871005, 0.6745098, 0, 1, 1,
0.7028457, 1.112183, 0.07268996, 0.6784314, 0, 1, 1,
0.7030378, -1.071231, 1.691458, 0.6862745, 0, 1, 1,
0.703711, 1.034826, 0.6712227, 0.6901961, 0, 1, 1,
0.7114216, 2.482412, 0.4022566, 0.6980392, 0, 1, 1,
0.7154208, 0.008572453, 2.725217, 0.7058824, 0, 1, 1,
0.7157865, -1.030905, 3.275273, 0.7098039, 0, 1, 1,
0.7200664, -0.3184445, 1.533729, 0.7176471, 0, 1, 1,
0.7273185, -0.5298476, -1.317738, 0.7215686, 0, 1, 1,
0.7276615, 0.7566713, 2.806852, 0.7294118, 0, 1, 1,
0.7293007, 0.06874647, 1.528205, 0.7333333, 0, 1, 1,
0.7296572, 0.1116575, 3.5346, 0.7411765, 0, 1, 1,
0.7346488, -1.444053, 2.762798, 0.7450981, 0, 1, 1,
0.7359865, 2.477043, -0.04784201, 0.7529412, 0, 1, 1,
0.7369676, -0.1030621, 0.6807222, 0.7568628, 0, 1, 1,
0.7401743, 1.065372, -0.2274341, 0.7647059, 0, 1, 1,
0.741726, -0.8974863, 2.821755, 0.7686275, 0, 1, 1,
0.7419667, -0.7082131, 2.524353, 0.7764706, 0, 1, 1,
0.7456716, 2.022963, -1.003791, 0.7803922, 0, 1, 1,
0.7457508, 0.8729903, 2.243198, 0.7882353, 0, 1, 1,
0.7490411, 0.8483374, 1.135448, 0.7921569, 0, 1, 1,
0.7583902, 0.8553396, 1.841608, 0.8, 0, 1, 1,
0.7620007, -0.4921172, 2.867539, 0.8078431, 0, 1, 1,
0.767633, 1.251, 0.3466966, 0.8117647, 0, 1, 1,
0.771107, 0.476065, 1.245537, 0.8196079, 0, 1, 1,
0.7719133, -0.361853, 0.8356902, 0.8235294, 0, 1, 1,
0.7774638, -0.09794519, 1.122263, 0.8313726, 0, 1, 1,
0.7799503, -0.3737271, 2.667366, 0.8352941, 0, 1, 1,
0.7854435, -0.3782665, 2.337722, 0.8431373, 0, 1, 1,
0.7989661, 0.4310856, 0.7235265, 0.8470588, 0, 1, 1,
0.8026209, 1.024207, -1.055121, 0.854902, 0, 1, 1,
0.8031576, -0.914902, 2.036, 0.8588235, 0, 1, 1,
0.8079816, 0.4295654, 1.060346, 0.8666667, 0, 1, 1,
0.8133884, 0.8605588, 0.2760207, 0.8705882, 0, 1, 1,
0.8212342, 1.716194, -0.8486214, 0.8784314, 0, 1, 1,
0.8241325, -0.9891341, 2.151327, 0.8823529, 0, 1, 1,
0.8267865, 0.2497431, 0.6701906, 0.8901961, 0, 1, 1,
0.8268404, 0.4602435, 1.674948, 0.8941177, 0, 1, 1,
0.8269064, 0.5296963, 0.7946631, 0.9019608, 0, 1, 1,
0.8278047, -0.7695611, 2.053235, 0.9098039, 0, 1, 1,
0.8294122, 1.186524, -0.07052634, 0.9137255, 0, 1, 1,
0.8337356, 1.38223, 0.6484042, 0.9215686, 0, 1, 1,
0.8400377, -0.7038801, 2.139617, 0.9254902, 0, 1, 1,
0.8472044, -0.8476624, 5.134299, 0.9333333, 0, 1, 1,
0.8476859, 0.6972739, 1.0202, 0.9372549, 0, 1, 1,
0.8497106, -1.088344, 3.619962, 0.945098, 0, 1, 1,
0.8576862, -0.1175107, 2.356, 0.9490196, 0, 1, 1,
0.8649166, -1.370893, 3.423493, 0.9568627, 0, 1, 1,
0.8700207, 0.3380553, 1.081077, 0.9607843, 0, 1, 1,
0.8717678, -0.9580742, 1.693281, 0.9686275, 0, 1, 1,
0.8764508, -1.713792, 1.875365, 0.972549, 0, 1, 1,
0.8768013, 0.8134059, 1.218116, 0.9803922, 0, 1, 1,
0.8787034, -0.8802625, 2.840429, 0.9843137, 0, 1, 1,
0.8802229, 0.6273628, -0.945599, 0.9921569, 0, 1, 1,
0.880602, -0.3680825, 1.301041, 0.9960784, 0, 1, 1,
0.8873399, -0.2099598, 1.559409, 1, 0, 0.9960784, 1,
0.8914954, -0.02889341, 1.801694, 1, 0, 0.9882353, 1,
0.8930899, 0.6125352, 1.899356, 1, 0, 0.9843137, 1,
0.8949407, -0.5449076, 3.39534, 1, 0, 0.9764706, 1,
0.8961279, 0.5327736, 1.137904, 1, 0, 0.972549, 1,
0.8994079, 0.444551, 1.585122, 1, 0, 0.9647059, 1,
0.9029353, 0.6104589, 1.879495, 1, 0, 0.9607843, 1,
0.9042165, 0.4290634, -0.654618, 1, 0, 0.9529412, 1,
0.9146428, -0.3621337, 3.048375, 1, 0, 0.9490196, 1,
0.9197164, 0.6115227, -0.7690353, 1, 0, 0.9411765, 1,
0.936103, -0.1842207, 1.781445, 1, 0, 0.9372549, 1,
0.936597, 0.3511889, 2.617726, 1, 0, 0.9294118, 1,
0.9400195, 1.361279, -0.1469647, 1, 0, 0.9254902, 1,
0.9531022, 1.921744, -0.1471847, 1, 0, 0.9176471, 1,
0.9572074, -1.018049, 1.302074, 1, 0, 0.9137255, 1,
0.9602356, -0.8225635, 1.785363, 1, 0, 0.9058824, 1,
0.9668109, -1.021566, 1.638336, 1, 0, 0.9019608, 1,
0.9700632, 0.364308, 0.0537756, 1, 0, 0.8941177, 1,
0.9702922, 0.6197386, 0.05649575, 1, 0, 0.8862745, 1,
0.9728677, -0.7678085, 1.915802, 1, 0, 0.8823529, 1,
0.9758461, 0.230483, 0.2948624, 1, 0, 0.8745098, 1,
0.9853745, 0.4667302, 1.630937, 1, 0, 0.8705882, 1,
0.9942569, 0.7305643, 1.950861, 1, 0, 0.8627451, 1,
0.9970853, 0.7101836, -0.8066292, 1, 0, 0.8588235, 1,
1.01551, 0.4344458, 0.6782814, 1, 0, 0.8509804, 1,
1.015834, -3.057569, 2.471597, 1, 0, 0.8470588, 1,
1.016025, -1.317783, 3.291337, 1, 0, 0.8392157, 1,
1.020812, -0.7878934, 3.865816, 1, 0, 0.8352941, 1,
1.023065, 0.6994363, 2.254734, 1, 0, 0.827451, 1,
1.024307, -0.7613459, 2.867365, 1, 0, 0.8235294, 1,
1.029194, -1.102126, 0.9480392, 1, 0, 0.8156863, 1,
1.041631, 1.703984, -0.8728775, 1, 0, 0.8117647, 1,
1.043189, -0.8994585, 1.925648, 1, 0, 0.8039216, 1,
1.046616, 1.092669, 0.6007945, 1, 0, 0.7960784, 1,
1.046896, -0.2012251, 2.642551, 1, 0, 0.7921569, 1,
1.056187, -0.9657824, 3.400229, 1, 0, 0.7843137, 1,
1.061204, 0.244073, 0.8923493, 1, 0, 0.7803922, 1,
1.06903, 0.08163146, 0.4688914, 1, 0, 0.772549, 1,
1.073277, -1.096939, 2.919805, 1, 0, 0.7686275, 1,
1.083134, -0.6452242, 1.050822, 1, 0, 0.7607843, 1,
1.083588, -0.4752294, 2.336772, 1, 0, 0.7568628, 1,
1.088081, -0.2211821, 1.964265, 1, 0, 0.7490196, 1,
1.090303, 0.07696789, -0.3932258, 1, 0, 0.7450981, 1,
1.090451, -0.4741849, 1.426637, 1, 0, 0.7372549, 1,
1.091792, 1.370447, -1.932858, 1, 0, 0.7333333, 1,
1.099577, 1.722664, -1.367931, 1, 0, 0.7254902, 1,
1.103765, -0.2010231, 1.765094, 1, 0, 0.7215686, 1,
1.106302, -0.8913773, 3.116131, 1, 0, 0.7137255, 1,
1.107625, -1.200678, 2.869744, 1, 0, 0.7098039, 1,
1.114366, -0.3745203, 1.720949, 1, 0, 0.7019608, 1,
1.115511, 0.4304604, 0.7410773, 1, 0, 0.6941177, 1,
1.116104, -0.1293175, 2.311988, 1, 0, 0.6901961, 1,
1.118786, -0.5479179, 1.704786, 1, 0, 0.682353, 1,
1.135434, -0.1851523, 1.054672, 1, 0, 0.6784314, 1,
1.13768, 0.1753704, 2.073953, 1, 0, 0.6705883, 1,
1.143766, -0.872947, 2.101665, 1, 0, 0.6666667, 1,
1.151974, -0.4349269, 1.075459, 1, 0, 0.6588235, 1,
1.154991, 1.175098, 0.2857544, 1, 0, 0.654902, 1,
1.155137, -0.5772845, 0.7670792, 1, 0, 0.6470588, 1,
1.165634, 1.206218, -1.294575, 1, 0, 0.6431373, 1,
1.167772, -1.625478, 3.472558, 1, 0, 0.6352941, 1,
1.168353, 1.173259, 0.05496652, 1, 0, 0.6313726, 1,
1.183047, 1.043667, 0.9211601, 1, 0, 0.6235294, 1,
1.185396, 0.5919968, 2.272605, 1, 0, 0.6196079, 1,
1.186829, -0.02480398, 1.174537, 1, 0, 0.6117647, 1,
1.201536, -1.446832, 1.730948, 1, 0, 0.6078432, 1,
1.220758, 0.008926537, 1.755934, 1, 0, 0.6, 1,
1.222819, 0.6124682, 2.155267, 1, 0, 0.5921569, 1,
1.224925, -0.5621174, 2.244345, 1, 0, 0.5882353, 1,
1.225149, 0.2564178, 1.597471, 1, 0, 0.5803922, 1,
1.2328, -1.175219, 2.10598, 1, 0, 0.5764706, 1,
1.242444, 1.249002, -0.7991353, 1, 0, 0.5686275, 1,
1.247345, 0.02618481, 1.50066, 1, 0, 0.5647059, 1,
1.256756, 0.07224765, 1.720955, 1, 0, 0.5568628, 1,
1.262313, -0.1071564, 1.211229, 1, 0, 0.5529412, 1,
1.273379, 0.1158604, 2.160945, 1, 0, 0.5450981, 1,
1.281143, 0.1708817, -0.05553677, 1, 0, 0.5411765, 1,
1.28306, -0.341594, 1.654645, 1, 0, 0.5333334, 1,
1.283278, -0.958031, 1.674379, 1, 0, 0.5294118, 1,
1.296136, 1.474087, 0.6000029, 1, 0, 0.5215687, 1,
1.296973, -0.5863925, 2.403679, 1, 0, 0.5176471, 1,
1.302402, 0.4628528, 2.328443, 1, 0, 0.509804, 1,
1.312683, 0.18744, 1.212432, 1, 0, 0.5058824, 1,
1.313251, -0.4717915, 0.5899872, 1, 0, 0.4980392, 1,
1.318078, 0.811353, 1.746558, 1, 0, 0.4901961, 1,
1.347489, -1.769124, 3.550684, 1, 0, 0.4862745, 1,
1.348673, -1.272564, 1.636549, 1, 0, 0.4784314, 1,
1.363095, -0.3899012, 1.864741, 1, 0, 0.4745098, 1,
1.372918, 1.265794, 2.684132, 1, 0, 0.4666667, 1,
1.382632, 1.493714, -1.485909, 1, 0, 0.4627451, 1,
1.403578, -0.09565678, 1.972937, 1, 0, 0.454902, 1,
1.410583, 1.047841, 0.2972766, 1, 0, 0.4509804, 1,
1.419054, -0.1699849, -0.09348914, 1, 0, 0.4431373, 1,
1.431986, 1.205106, 2.560852, 1, 0, 0.4392157, 1,
1.440791, -1.0259, 1.883524, 1, 0, 0.4313726, 1,
1.449796, -1.7579, 2.653614, 1, 0, 0.427451, 1,
1.474291, 0.9660538, 2.143497, 1, 0, 0.4196078, 1,
1.486918, 0.3210806, 0.8268418, 1, 0, 0.4156863, 1,
1.491405, 1.924291, -1.041303, 1, 0, 0.4078431, 1,
1.498477, 0.009899585, 2.090304, 1, 0, 0.4039216, 1,
1.500509, -2.846978, 1.498649, 1, 0, 0.3960784, 1,
1.502123, -1.958342, 1.243391, 1, 0, 0.3882353, 1,
1.502414, 0.7166619, 2.343633, 1, 0, 0.3843137, 1,
1.50714, -0.1005461, 0.4173264, 1, 0, 0.3764706, 1,
1.526848, 1.638352, 1.851299, 1, 0, 0.372549, 1,
1.530094, -0.9946176, 1.510239, 1, 0, 0.3647059, 1,
1.535718, 1.020568, -0.07894271, 1, 0, 0.3607843, 1,
1.539563, 0.3183291, 4.011529, 1, 0, 0.3529412, 1,
1.545738, 1.181214, 1.034682, 1, 0, 0.3490196, 1,
1.546684, -1.523989, 1.522597, 1, 0, 0.3411765, 1,
1.560243, -1.830267, 4.139752, 1, 0, 0.3372549, 1,
1.564523, -0.4122708, 1.8798, 1, 0, 0.3294118, 1,
1.581407, -1.63333, 2.729784, 1, 0, 0.3254902, 1,
1.595026, 1.308294, 0.6912501, 1, 0, 0.3176471, 1,
1.599424, -0.7831336, 2.25913, 1, 0, 0.3137255, 1,
1.627588, 0.1362365, 1.258673, 1, 0, 0.3058824, 1,
1.631862, -0.8927142, 1.666339, 1, 0, 0.2980392, 1,
1.637459, -1.268343, 2.740358, 1, 0, 0.2941177, 1,
1.659039, 0.6193143, 0.4793126, 1, 0, 0.2862745, 1,
1.661469, -1.861774, 4.212806, 1, 0, 0.282353, 1,
1.688176, 1.607031, -0.6328252, 1, 0, 0.2745098, 1,
1.695846, 1.205244, 2.098248, 1, 0, 0.2705882, 1,
1.701811, 0.7731862, 2.20723, 1, 0, 0.2627451, 1,
1.704355, -1.126207, 2.158286, 1, 0, 0.2588235, 1,
1.726364, 0.1385354, -0.4282351, 1, 0, 0.2509804, 1,
1.749704, -2.732738, 3.160591, 1, 0, 0.2470588, 1,
1.765816, 0.5647686, 1.874993, 1, 0, 0.2392157, 1,
1.772498, -0.822346, 1.608055, 1, 0, 0.2352941, 1,
1.799909, -0.1053785, 2.778037, 1, 0, 0.227451, 1,
1.811535, 1.869493, 1.133457, 1, 0, 0.2235294, 1,
1.829354, -1.008047, 2.921585, 1, 0, 0.2156863, 1,
1.83969, 0.294299, 1.13565, 1, 0, 0.2117647, 1,
1.867182, -0.1975197, 2.641676, 1, 0, 0.2039216, 1,
1.868525, 1.240492, -0.2012665, 1, 0, 0.1960784, 1,
1.882088, 0.3027901, 1.602863, 1, 0, 0.1921569, 1,
1.882553, -1.039727, 0.764222, 1, 0, 0.1843137, 1,
1.88537, -0.9670404, 1.094828, 1, 0, 0.1803922, 1,
1.885787, 0.824187, 0.9016275, 1, 0, 0.172549, 1,
1.911896, -1.143156, 0.9825171, 1, 0, 0.1686275, 1,
1.916283, 0.4951373, 0.7214841, 1, 0, 0.1607843, 1,
1.91642, 0.1395435, -0.9843262, 1, 0, 0.1568628, 1,
1.923606, -0.7717195, -0.1275669, 1, 0, 0.1490196, 1,
1.977181, -1.839414, 1.778911, 1, 0, 0.145098, 1,
1.990716, 0.2676554, 0.4651927, 1, 0, 0.1372549, 1,
1.999631, 1.714621, -1.702757, 1, 0, 0.1333333, 1,
2.004033, 1.718392, 0.5630821, 1, 0, 0.1254902, 1,
2.022385, 1.094733, 0.9117456, 1, 0, 0.1215686, 1,
2.098948, -0.3064, 0.9518446, 1, 0, 0.1137255, 1,
2.12221, 1.955932, 0.5089979, 1, 0, 0.1098039, 1,
2.136468, 1.220013, 1.92708, 1, 0, 0.1019608, 1,
2.152449, 0.03341343, 1.63416, 1, 0, 0.09411765, 1,
2.15646, -0.8205574, 2.256307, 1, 0, 0.09019608, 1,
2.160888, -0.1501758, 0.01219329, 1, 0, 0.08235294, 1,
2.200257, 0.4602469, -0.2662447, 1, 0, 0.07843138, 1,
2.212653, -0.2257444, 1.884976, 1, 0, 0.07058824, 1,
2.31339, -0.5477037, -0.4512843, 1, 0, 0.06666667, 1,
2.373798, 0.3693103, 3.491104, 1, 0, 0.05882353, 1,
2.402141, -0.2138799, 1.645721, 1, 0, 0.05490196, 1,
2.418936, -0.588335, 1.174956, 1, 0, 0.04705882, 1,
2.450438, 1.110185, 0.8598732, 1, 0, 0.04313726, 1,
2.670158, -0.269592, 2.044548, 1, 0, 0.03529412, 1,
2.723199, -1.115881, 2.253058, 1, 0, 0.03137255, 1,
2.72715, 0.711262, 2.977942, 1, 0, 0.02352941, 1,
2.782828, -0.2391037, 1.801816, 1, 0, 0.01960784, 1,
2.920183, -0.447957, 1.304414, 1, 0, 0.01176471, 1,
3.394146, 1.141808, 0.2582759, 1, 0, 0.007843138, 1
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
-0.04085624, -4.340864, -6.912263, 0, -0.5, 0.5, 0.5,
-0.04085624, -4.340864, -6.912263, 1, -0.5, 0.5, 0.5,
-0.04085624, -4.340864, -6.912263, 1, 1.5, 0.5, 0.5,
-0.04085624, -4.340864, -6.912263, 0, 1.5, 0.5, 0.5
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
-4.640325, -0.04275239, -6.912263, 0, -0.5, 0.5, 0.5,
-4.640325, -0.04275239, -6.912263, 1, -0.5, 0.5, 0.5,
-4.640325, -0.04275239, -6.912263, 1, 1.5, 0.5, 0.5,
-4.640325, -0.04275239, -6.912263, 0, 1.5, 0.5, 0.5
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
-4.640325, -4.340864, 0.3157613, 0, -0.5, 0.5, 0.5,
-4.640325, -4.340864, 0.3157613, 1, -0.5, 0.5, 0.5,
-4.640325, -4.340864, 0.3157613, 1, 1.5, 0.5, 0.5,
-4.640325, -4.340864, 0.3157613, 0, 1.5, 0.5, 0.5
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
-3, -3.348992, -5.244258,
3, -3.348992, -5.244258,
-3, -3.348992, -5.244258,
-3, -3.514304, -5.522259,
-2, -3.348992, -5.244258,
-2, -3.514304, -5.522259,
-1, -3.348992, -5.244258,
-1, -3.514304, -5.522259,
0, -3.348992, -5.244258,
0, -3.514304, -5.522259,
1, -3.348992, -5.244258,
1, -3.514304, -5.522259,
2, -3.348992, -5.244258,
2, -3.514304, -5.522259,
3, -3.348992, -5.244258,
3, -3.514304, -5.522259
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
-3, -3.844928, -6.07826, 0, -0.5, 0.5, 0.5,
-3, -3.844928, -6.07826, 1, -0.5, 0.5, 0.5,
-3, -3.844928, -6.07826, 1, 1.5, 0.5, 0.5,
-3, -3.844928, -6.07826, 0, 1.5, 0.5, 0.5,
-2, -3.844928, -6.07826, 0, -0.5, 0.5, 0.5,
-2, -3.844928, -6.07826, 1, -0.5, 0.5, 0.5,
-2, -3.844928, -6.07826, 1, 1.5, 0.5, 0.5,
-2, -3.844928, -6.07826, 0, 1.5, 0.5, 0.5,
-1, -3.844928, -6.07826, 0, -0.5, 0.5, 0.5,
-1, -3.844928, -6.07826, 1, -0.5, 0.5, 0.5,
-1, -3.844928, -6.07826, 1, 1.5, 0.5, 0.5,
-1, -3.844928, -6.07826, 0, 1.5, 0.5, 0.5,
0, -3.844928, -6.07826, 0, -0.5, 0.5, 0.5,
0, -3.844928, -6.07826, 1, -0.5, 0.5, 0.5,
0, -3.844928, -6.07826, 1, 1.5, 0.5, 0.5,
0, -3.844928, -6.07826, 0, 1.5, 0.5, 0.5,
1, -3.844928, -6.07826, 0, -0.5, 0.5, 0.5,
1, -3.844928, -6.07826, 1, -0.5, 0.5, 0.5,
1, -3.844928, -6.07826, 1, 1.5, 0.5, 0.5,
1, -3.844928, -6.07826, 0, 1.5, 0.5, 0.5,
2, -3.844928, -6.07826, 0, -0.5, 0.5, 0.5,
2, -3.844928, -6.07826, 1, -0.5, 0.5, 0.5,
2, -3.844928, -6.07826, 1, 1.5, 0.5, 0.5,
2, -3.844928, -6.07826, 0, 1.5, 0.5, 0.5,
3, -3.844928, -6.07826, 0, -0.5, 0.5, 0.5,
3, -3.844928, -6.07826, 1, -0.5, 0.5, 0.5,
3, -3.844928, -6.07826, 1, 1.5, 0.5, 0.5,
3, -3.844928, -6.07826, 0, 1.5, 0.5, 0.5
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
-3.578909, -3, -5.244258,
-3.578909, 3, -5.244258,
-3.578909, -3, -5.244258,
-3.755812, -3, -5.522259,
-3.578909, -2, -5.244258,
-3.755812, -2, -5.522259,
-3.578909, -1, -5.244258,
-3.755812, -1, -5.522259,
-3.578909, 0, -5.244258,
-3.755812, 0, -5.522259,
-3.578909, 1, -5.244258,
-3.755812, 1, -5.522259,
-3.578909, 2, -5.244258,
-3.755812, 2, -5.522259,
-3.578909, 3, -5.244258,
-3.755812, 3, -5.522259
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
-4.109617, -3, -6.07826, 0, -0.5, 0.5, 0.5,
-4.109617, -3, -6.07826, 1, -0.5, 0.5, 0.5,
-4.109617, -3, -6.07826, 1, 1.5, 0.5, 0.5,
-4.109617, -3, -6.07826, 0, 1.5, 0.5, 0.5,
-4.109617, -2, -6.07826, 0, -0.5, 0.5, 0.5,
-4.109617, -2, -6.07826, 1, -0.5, 0.5, 0.5,
-4.109617, -2, -6.07826, 1, 1.5, 0.5, 0.5,
-4.109617, -2, -6.07826, 0, 1.5, 0.5, 0.5,
-4.109617, -1, -6.07826, 0, -0.5, 0.5, 0.5,
-4.109617, -1, -6.07826, 1, -0.5, 0.5, 0.5,
-4.109617, -1, -6.07826, 1, 1.5, 0.5, 0.5,
-4.109617, -1, -6.07826, 0, 1.5, 0.5, 0.5,
-4.109617, 0, -6.07826, 0, -0.5, 0.5, 0.5,
-4.109617, 0, -6.07826, 1, -0.5, 0.5, 0.5,
-4.109617, 0, -6.07826, 1, 1.5, 0.5, 0.5,
-4.109617, 0, -6.07826, 0, 1.5, 0.5, 0.5,
-4.109617, 1, -6.07826, 0, -0.5, 0.5, 0.5,
-4.109617, 1, -6.07826, 1, -0.5, 0.5, 0.5,
-4.109617, 1, -6.07826, 1, 1.5, 0.5, 0.5,
-4.109617, 1, -6.07826, 0, 1.5, 0.5, 0.5,
-4.109617, 2, -6.07826, 0, -0.5, 0.5, 0.5,
-4.109617, 2, -6.07826, 1, -0.5, 0.5, 0.5,
-4.109617, 2, -6.07826, 1, 1.5, 0.5, 0.5,
-4.109617, 2, -6.07826, 0, 1.5, 0.5, 0.5,
-4.109617, 3, -6.07826, 0, -0.5, 0.5, 0.5,
-4.109617, 3, -6.07826, 1, -0.5, 0.5, 0.5,
-4.109617, 3, -6.07826, 1, 1.5, 0.5, 0.5,
-4.109617, 3, -6.07826, 0, 1.5, 0.5, 0.5
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
-3.578909, -3.348992, -4,
-3.578909, -3.348992, 4,
-3.578909, -3.348992, -4,
-3.755812, -3.514304, -4,
-3.578909, -3.348992, -2,
-3.755812, -3.514304, -2,
-3.578909, -3.348992, 0,
-3.755812, -3.514304, 0,
-3.578909, -3.348992, 2,
-3.755812, -3.514304, 2,
-3.578909, -3.348992, 4,
-3.755812, -3.514304, 4
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
-4.109617, -3.844928, -4, 0, -0.5, 0.5, 0.5,
-4.109617, -3.844928, -4, 1, -0.5, 0.5, 0.5,
-4.109617, -3.844928, -4, 1, 1.5, 0.5, 0.5,
-4.109617, -3.844928, -4, 0, 1.5, 0.5, 0.5,
-4.109617, -3.844928, -2, 0, -0.5, 0.5, 0.5,
-4.109617, -3.844928, -2, 1, -0.5, 0.5, 0.5,
-4.109617, -3.844928, -2, 1, 1.5, 0.5, 0.5,
-4.109617, -3.844928, -2, 0, 1.5, 0.5, 0.5,
-4.109617, -3.844928, 0, 0, -0.5, 0.5, 0.5,
-4.109617, -3.844928, 0, 1, -0.5, 0.5, 0.5,
-4.109617, -3.844928, 0, 1, 1.5, 0.5, 0.5,
-4.109617, -3.844928, 0, 0, 1.5, 0.5, 0.5,
-4.109617, -3.844928, 2, 0, -0.5, 0.5, 0.5,
-4.109617, -3.844928, 2, 1, -0.5, 0.5, 0.5,
-4.109617, -3.844928, 2, 1, 1.5, 0.5, 0.5,
-4.109617, -3.844928, 2, 0, 1.5, 0.5, 0.5,
-4.109617, -3.844928, 4, 0, -0.5, 0.5, 0.5,
-4.109617, -3.844928, 4, 1, -0.5, 0.5, 0.5,
-4.109617, -3.844928, 4, 1, 1.5, 0.5, 0.5,
-4.109617, -3.844928, 4, 0, 1.5, 0.5, 0.5
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
-3.578909, -3.348992, -5.244258,
-3.578909, 3.263487, -5.244258,
-3.578909, -3.348992, 5.875781,
-3.578909, 3.263487, 5.875781,
-3.578909, -3.348992, -5.244258,
-3.578909, -3.348992, 5.875781,
-3.578909, 3.263487, -5.244258,
-3.578909, 3.263487, 5.875781,
-3.578909, -3.348992, -5.244258,
3.497196, -3.348992, -5.244258,
-3.578909, -3.348992, 5.875781,
3.497196, -3.348992, 5.875781,
-3.578909, 3.263487, -5.244258,
3.497196, 3.263487, -5.244258,
-3.578909, 3.263487, 5.875781,
3.497196, 3.263487, 5.875781,
3.497196, -3.348992, -5.244258,
3.497196, 3.263487, -5.244258,
3.497196, -3.348992, 5.875781,
3.497196, 3.263487, 5.875781,
3.497196, -3.348992, -5.244258,
3.497196, -3.348992, 5.875781,
3.497196, 3.263487, -5.244258,
3.497196, 3.263487, 5.875781
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
var radius = 7.874202;
var distance = 35.03322;
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
mvMatrix.translate( 0.04085624, 0.04275239, -0.3157613 );
mvMatrix.scale( 1.203168, 1.287526, 0.7656217 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.03322);
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
triallate<-read.table("triallate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triallate$V2
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
```

```r
y<-triallate$V3
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
```

```r
z<-triallate$V4
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
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
-3.475859, -1.114732, -3.685809, 0, 0, 1, 1, 1,
-3.370538, 0.6160371, -1.858453, 1, 0, 0, 1, 1,
-3.177755, -0.8929303, -2.585082, 1, 0, 0, 1, 1,
-3.10205, -0.4195612, -1.23194, 1, 0, 0, 1, 1,
-2.986032, 0.3340279, -1.326777, 1, 0, 0, 1, 1,
-2.830704, 1.539107, -2.723585, 1, 0, 0, 1, 1,
-2.568151, 0.3467723, -1.897306, 0, 0, 0, 1, 1,
-2.520119, 0.9316131, -2.530011, 0, 0, 0, 1, 1,
-2.428195, 0.6515935, -1.255918, 0, 0, 0, 1, 1,
-2.339706, -1.29162, -2.157576, 0, 0, 0, 1, 1,
-2.280905, -0.5688549, -2.984112, 0, 0, 0, 1, 1,
-2.260701, -0.5072732, -1.8087, 0, 0, 0, 1, 1,
-2.251876, 2.539805, -2.12613, 0, 0, 0, 1, 1,
-2.245591, 0.5893061, -0.3553406, 1, 1, 1, 1, 1,
-2.223683, 2.294878, -1.756301, 1, 1, 1, 1, 1,
-2.193923, -0.06636647, -0.8111985, 1, 1, 1, 1, 1,
-2.152049, 0.5360059, 0.6424697, 1, 1, 1, 1, 1,
-2.144186, -0.7546568, -1.15076, 1, 1, 1, 1, 1,
-2.141123, -1.965632, -3.017035, 1, 1, 1, 1, 1,
-2.098399, -0.6762438, -2.019439, 1, 1, 1, 1, 1,
-2.069192, 1.080659, -0.07375827, 1, 1, 1, 1, 1,
-2.067213, -0.4788991, -1.858181, 1, 1, 1, 1, 1,
-2.005475, -0.03023436, -1.452002, 1, 1, 1, 1, 1,
-1.994094, 0.6986254, 0.3082826, 1, 1, 1, 1, 1,
-1.986355, 0.2598647, -1.00001, 1, 1, 1, 1, 1,
-1.984893, -2.172606, -2.030442, 1, 1, 1, 1, 1,
-1.968632, -0.8095193, -1.856481, 1, 1, 1, 1, 1,
-1.957684, 0.1856149, -0.901663, 1, 1, 1, 1, 1,
-1.947964, -0.1467705, -2.746088, 0, 0, 1, 1, 1,
-1.941667, 0.2455088, -0.50073, 1, 0, 0, 1, 1,
-1.929241, 0.6289739, -2.099249, 1, 0, 0, 1, 1,
-1.924166, -0.6693767, -1.471932, 1, 0, 0, 1, 1,
-1.897087, -0.5421804, -1.891323, 1, 0, 0, 1, 1,
-1.890782, -1.099325, -2.659493, 1, 0, 0, 1, 1,
-1.888825, 1.056177, -0.8914297, 0, 0, 0, 1, 1,
-1.878877, 0.3188425, -1.089137, 0, 0, 0, 1, 1,
-1.868601, -0.1432324, -1.273214, 0, 0, 0, 1, 1,
-1.865426, 1.517443, -0.3045316, 0, 0, 0, 1, 1,
-1.862805, 0.9092523, -1.286067, 0, 0, 0, 1, 1,
-1.849439, 0.1386393, -2.531462, 0, 0, 0, 1, 1,
-1.822312, 2.959809, 1.483102, 0, 0, 0, 1, 1,
-1.811336, -0.8001106, -1.873809, 1, 1, 1, 1, 1,
-1.81032, -1.753837, -2.396428, 1, 1, 1, 1, 1,
-1.794292, 0.4550292, -2.418925, 1, 1, 1, 1, 1,
-1.783805, 1.182961, -2.178354, 1, 1, 1, 1, 1,
-1.775471, 0.4922028, -1.793262, 1, 1, 1, 1, 1,
-1.771427, 1.919, -1.534154, 1, 1, 1, 1, 1,
-1.765137, 0.1380586, 1.108404, 1, 1, 1, 1, 1,
-1.702443, -0.3295898, -1.815293, 1, 1, 1, 1, 1,
-1.699235, -0.5634971, -2.279981, 1, 1, 1, 1, 1,
-1.698997, 0.292957, -0.7853996, 1, 1, 1, 1, 1,
-1.694161, 0.0580756, -2.738866, 1, 1, 1, 1, 1,
-1.693045, -0.458599, -1.58972, 1, 1, 1, 1, 1,
-1.690826, -0.7510574, -0.6978028, 1, 1, 1, 1, 1,
-1.676066, -1.530165, -1.478386, 1, 1, 1, 1, 1,
-1.670499, -0.4154665, -1.927702, 1, 1, 1, 1, 1,
-1.668273, 0.9720954, -0.08162455, 0, 0, 1, 1, 1,
-1.662293, -1.237343, -1.703189, 1, 0, 0, 1, 1,
-1.65986, -0.5331886, -1.535306, 1, 0, 0, 1, 1,
-1.641382, -2.608701, -2.994878, 1, 0, 0, 1, 1,
-1.632882, -0.7777659, -3.415863, 1, 0, 0, 1, 1,
-1.629209, -0.3024755, -2.326176, 1, 0, 0, 1, 1,
-1.62246, -0.04975833, -1.145454, 0, 0, 0, 1, 1,
-1.61306, -0.6199133, -1.428985, 0, 0, 0, 1, 1,
-1.608915, -0.1145449, -0.8042544, 0, 0, 0, 1, 1,
-1.602814, -0.5840414, -2.073021, 0, 0, 0, 1, 1,
-1.599918, 0.0174859, -0.6232294, 0, 0, 0, 1, 1,
-1.59802, 0.4964209, 0.7920413, 0, 0, 0, 1, 1,
-1.593524, -0.1373693, -1.109755, 0, 0, 0, 1, 1,
-1.590782, -0.8833791, -2.163466, 1, 1, 1, 1, 1,
-1.586714, -0.5326015, -1.655461, 1, 1, 1, 1, 1,
-1.57349, 1.385035, -1.346033, 1, 1, 1, 1, 1,
-1.556006, -0.7017733, -3.134807, 1, 1, 1, 1, 1,
-1.549163, 1.742123, -1.398635, 1, 1, 1, 1, 1,
-1.544734, -0.3171937, -1.141979, 1, 1, 1, 1, 1,
-1.542305, -0.6945174, -2.31853, 1, 1, 1, 1, 1,
-1.540469, 0.5108681, -1.663788, 1, 1, 1, 1, 1,
-1.535884, -0.4137011, -3.873562, 1, 1, 1, 1, 1,
-1.528616, 0.3457516, -1.919448, 1, 1, 1, 1, 1,
-1.511123, -1.598452, -0.9466563, 1, 1, 1, 1, 1,
-1.497421, 0.9015889, 0.2392048, 1, 1, 1, 1, 1,
-1.496194, -0.2701398, -2.667952, 1, 1, 1, 1, 1,
-1.490741, -1.172714, -0.9602358, 1, 1, 1, 1, 1,
-1.47885, 1.292806, -0.7926024, 1, 1, 1, 1, 1,
-1.46791, 2.108738, 0.4105619, 0, 0, 1, 1, 1,
-1.466461, 0.6734755, -2.757396, 1, 0, 0, 1, 1,
-1.452892, 0.413025, -2.188211, 1, 0, 0, 1, 1,
-1.440406, -0.8653086, -1.61341, 1, 0, 0, 1, 1,
-1.438335, -1.863944, -3.224544, 1, 0, 0, 1, 1,
-1.43196, -0.5022756, -1.32143, 1, 0, 0, 1, 1,
-1.422172, -0.6814528, -3.701703, 0, 0, 0, 1, 1,
-1.419152, 1.029272, -2.145532, 0, 0, 0, 1, 1,
-1.415131, -0.1225559, -2.485539, 0, 0, 0, 1, 1,
-1.38953, -0.3868382, -0.8945032, 0, 0, 0, 1, 1,
-1.388529, -0.2307925, -2.114207, 0, 0, 0, 1, 1,
-1.383944, 0.7959203, -0.04685879, 0, 0, 0, 1, 1,
-1.379149, -0.9342543, -1.105585, 0, 0, 0, 1, 1,
-1.376738, -0.2452883, -0.5239499, 1, 1, 1, 1, 1,
-1.371441, 0.2049636, -1.573385, 1, 1, 1, 1, 1,
-1.365478, 1.170338, 0.1560456, 1, 1, 1, 1, 1,
-1.347177, 0.1854138, -1.003508, 1, 1, 1, 1, 1,
-1.33399, -0.5394043, -3.562428, 1, 1, 1, 1, 1,
-1.326791, -0.9006949, -3.171063, 1, 1, 1, 1, 1,
-1.322673, 1.195638, -0.5557038, 1, 1, 1, 1, 1,
-1.315592, -0.4452023, -2.471531, 1, 1, 1, 1, 1,
-1.309783, 1.562735, -0.6302908, 1, 1, 1, 1, 1,
-1.303871, -1.410024, -2.7472, 1, 1, 1, 1, 1,
-1.30379, -1.305858, -2.460201, 1, 1, 1, 1, 1,
-1.296916, 0.6712858, -1.779796, 1, 1, 1, 1, 1,
-1.296427, -0.9566446, -1.471514, 1, 1, 1, 1, 1,
-1.293508, -0.7777905, -3.054366, 1, 1, 1, 1, 1,
-1.290209, -0.4180149, -1.448, 1, 1, 1, 1, 1,
-1.281509, 1.410916, -1.612377, 0, 0, 1, 1, 1,
-1.269196, -1.458154, -1.219797, 1, 0, 0, 1, 1,
-1.262285, -0.6447421, -2.264517, 1, 0, 0, 1, 1,
-1.259925, 0.7863712, -1.443621, 1, 0, 0, 1, 1,
-1.250496, 0.1334396, -2.315153, 1, 0, 0, 1, 1,
-1.244226, 0.3944859, -0.8991621, 1, 0, 0, 1, 1,
-1.244177, -0.5634702, -1.106298, 0, 0, 0, 1, 1,
-1.240556, -1.011301, -1.971134, 0, 0, 0, 1, 1,
-1.239305, 0.5343263, -1.759591, 0, 0, 0, 1, 1,
-1.233787, -0.8927423, -0.5205789, 0, 0, 0, 1, 1,
-1.232113, 0.7669497, -1.536802, 0, 0, 0, 1, 1,
-1.225099, 0.2136234, -0.7257866, 0, 0, 0, 1, 1,
-1.223081, 0.3218068, -1.519085, 0, 0, 0, 1, 1,
-1.220105, -0.1196159, -1.95057, 1, 1, 1, 1, 1,
-1.216177, 0.02946917, -1.205147, 1, 1, 1, 1, 1,
-1.213061, -0.9427248, -3.560631, 1, 1, 1, 1, 1,
-1.212211, -0.1229409, -1.191976, 1, 1, 1, 1, 1,
-1.210822, -0.4609514, -1.267344, 1, 1, 1, 1, 1,
-1.200868, 0.9596123, -1.914896, 1, 1, 1, 1, 1,
-1.200867, -1.335848, -3.636454, 1, 1, 1, 1, 1,
-1.198375, 1.705792, -0.2814249, 1, 1, 1, 1, 1,
-1.190608, -0.719417, -2.510597, 1, 1, 1, 1, 1,
-1.189301, 1.66802, 0.7507254, 1, 1, 1, 1, 1,
-1.188552, -0.2290972, -2.445274, 1, 1, 1, 1, 1,
-1.183115, 1.387485, -1.884213, 1, 1, 1, 1, 1,
-1.174511, 1.292606, -0.6424362, 1, 1, 1, 1, 1,
-1.172728, 0.1094934, -1.745672, 1, 1, 1, 1, 1,
-1.166796, 0.4176963, -1.767936, 1, 1, 1, 1, 1,
-1.165945, -0.01947723, -1.897996, 0, 0, 1, 1, 1,
-1.136762, -2.309047, -2.588284, 1, 0, 0, 1, 1,
-1.135427, -0.3920042, -1.992656, 1, 0, 0, 1, 1,
-1.126325, -1.38674, -2.802497, 1, 0, 0, 1, 1,
-1.117952, 0.4101587, -1.244363, 1, 0, 0, 1, 1,
-1.117725, -0.6531927, -0.7202939, 1, 0, 0, 1, 1,
-1.102188, -0.3142815, -3.044876, 0, 0, 0, 1, 1,
-1.099006, 0.23684, -0.7906576, 0, 0, 0, 1, 1,
-1.096579, 1.381013, -0.7785846, 0, 0, 0, 1, 1,
-1.08547, 0.02825098, -1.057932, 0, 0, 0, 1, 1,
-1.083707, 0.1005592, -1.880147, 0, 0, 0, 1, 1,
-1.077681, 0.1810432, -2.185518, 0, 0, 0, 1, 1,
-1.075682, -0.05838832, -1.461167, 0, 0, 0, 1, 1,
-1.065625, -0.9700193, -2.66765, 1, 1, 1, 1, 1,
-1.060413, 0.7284309, 1.217729, 1, 1, 1, 1, 1,
-1.056805, -0.2816523, -3.211105, 1, 1, 1, 1, 1,
-1.054972, 0.332621, -2.3029, 1, 1, 1, 1, 1,
-1.054709, 0.825727, -0.8746079, 1, 1, 1, 1, 1,
-1.052456, 1.099846, -1.695081, 1, 1, 1, 1, 1,
-1.047303, 1.35087, -1.878496, 1, 1, 1, 1, 1,
-1.04015, 0.1035868, 0.1364941, 1, 1, 1, 1, 1,
-1.031055, 0.04449337, 0.2008761, 1, 1, 1, 1, 1,
-1.015633, -0.2217346, -2.327886, 1, 1, 1, 1, 1,
-1.014927, 0.9354529, -0.3816535, 1, 1, 1, 1, 1,
-1.004741, 0.5830103, -0.8972754, 1, 1, 1, 1, 1,
-0.9993421, -0.6186258, -4.528714, 1, 1, 1, 1, 1,
-0.9872292, -0.4483785, -2.878687, 1, 1, 1, 1, 1,
-0.986228, -0.838887, -1.1043, 1, 1, 1, 1, 1,
-0.9815364, -0.1765815, -0.8719972, 0, 0, 1, 1, 1,
-0.9802066, -0.2927279, -3.899552, 1, 0, 0, 1, 1,
-0.9690993, 0.2494963, -0.6093605, 1, 0, 0, 1, 1,
-0.9617779, 0.4902127, -2.531576, 1, 0, 0, 1, 1,
-0.9584417, -1.64831, -3.308507, 1, 0, 0, 1, 1,
-0.9553155, 0.1925674, -0.3752942, 1, 0, 0, 1, 1,
-0.9547383, -0.2652902, -2.580599, 0, 0, 0, 1, 1,
-0.9541231, 0.5801923, 1.25386, 0, 0, 0, 1, 1,
-0.9421617, 0.5351591, -0.3781501, 0, 0, 0, 1, 1,
-0.9404265, 1.943787, 0.1870805, 0, 0, 0, 1, 1,
-0.9325716, -1.577809, -1.58474, 0, 0, 0, 1, 1,
-0.9320512, 0.5537859, -3.379977, 0, 0, 0, 1, 1,
-0.9205538, -0.682098, -1.766735, 0, 0, 0, 1, 1,
-0.916464, -0.6435478, -1.692168, 1, 1, 1, 1, 1,
-0.9141083, -0.9505264, -1.293931, 1, 1, 1, 1, 1,
-0.9094132, -1.047533, -1.698017, 1, 1, 1, 1, 1,
-0.9091753, 1.391269, -0.4817529, 1, 1, 1, 1, 1,
-0.9039116, 0.9070975, -0.7731047, 1, 1, 1, 1, 1,
-0.9017806, 0.7528167, -1.827584, 1, 1, 1, 1, 1,
-0.9013652, 0.3577626, -0.410542, 1, 1, 1, 1, 1,
-0.8987932, -0.01240915, -0.4235603, 1, 1, 1, 1, 1,
-0.8889123, 1.020346, -1.45027, 1, 1, 1, 1, 1,
-0.8885549, 0.2366916, -3.053915, 1, 1, 1, 1, 1,
-0.8876218, 0.1902801, -1.818388, 1, 1, 1, 1, 1,
-0.8839094, 1.446709, -0.989419, 1, 1, 1, 1, 1,
-0.8833866, -3.032422, -2.643974, 1, 1, 1, 1, 1,
-0.883144, 0.975777, -0.5492166, 1, 1, 1, 1, 1,
-0.8772402, 0.3392262, 0.3587638, 1, 1, 1, 1, 1,
-0.8741871, 0.452643, -1.338227, 0, 0, 1, 1, 1,
-0.871598, 1.02766, 0.8272167, 1, 0, 0, 1, 1,
-0.8693411, 0.564742, -0.1503117, 1, 0, 0, 1, 1,
-0.8604802, -1.000099, -2.800711, 1, 0, 0, 1, 1,
-0.8597627, 2.177368, -0.6290421, 1, 0, 0, 1, 1,
-0.8566694, 0.6129855, -0.8422878, 1, 0, 0, 1, 1,
-0.8529733, -0.8658481, -1.165105, 0, 0, 0, 1, 1,
-0.8504282, -0.1472654, -4.024815, 0, 0, 0, 1, 1,
-0.8499079, 0.6945784, -0.5603437, 0, 0, 0, 1, 1,
-0.8426003, -0.722622, -2.411998, 0, 0, 0, 1, 1,
-0.8407344, 0.5894686, -1.576702, 0, 0, 0, 1, 1,
-0.8395809, -0.2628359, -2.069406, 0, 0, 0, 1, 1,
-0.8372644, 0.6356887, -0.05734931, 0, 0, 0, 1, 1,
-0.8355475, -2.103886, -3.432094, 1, 1, 1, 1, 1,
-0.8340045, -0.5131623, -1.873716, 1, 1, 1, 1, 1,
-0.8272572, -0.8275352, -0.4533886, 1, 1, 1, 1, 1,
-0.8231856, -1.595343, -3.660101, 1, 1, 1, 1, 1,
-0.8212951, -0.2967734, -2.869825, 1, 1, 1, 1, 1,
-0.8205145, -1.314352, -1.326331, 1, 1, 1, 1, 1,
-0.8200012, 1.921129, -0.05381008, 1, 1, 1, 1, 1,
-0.8163731, 0.5173928, -2.851573, 1, 1, 1, 1, 1,
-0.8074294, -0.5503455, -3.833002, 1, 1, 1, 1, 1,
-0.805232, 1.474482, -1.297816, 1, 1, 1, 1, 1,
-0.8003005, -0.8619106, -2.970754, 1, 1, 1, 1, 1,
-0.7993548, 1.00899, -0.4780759, 1, 1, 1, 1, 1,
-0.7969038, 0.1815316, -0.5596418, 1, 1, 1, 1, 1,
-0.793433, 1.669975, -0.6929533, 1, 1, 1, 1, 1,
-0.7913618, -1.610926, -3.101019, 1, 1, 1, 1, 1,
-0.7887645, -0.5640899, -4.585409, 0, 0, 1, 1, 1,
-0.7873368, -1.93473, -2.572128, 1, 0, 0, 1, 1,
-0.7864292, 0.1261025, -1.389868, 1, 0, 0, 1, 1,
-0.7843611, 0.1506089, -0.7414292, 1, 0, 0, 1, 1,
-0.7792321, -0.03860314, -1.441119, 1, 0, 0, 1, 1,
-0.7776983, 0.03269674, -2.011523, 1, 0, 0, 1, 1,
-0.7747567, -0.7176173, -2.449106, 0, 0, 0, 1, 1,
-0.7745311, 0.7339646, -0.6661707, 0, 0, 0, 1, 1,
-0.7667766, 0.3181621, -1.998873, 0, 0, 0, 1, 1,
-0.765466, 0.1574755, -1.03915, 0, 0, 0, 1, 1,
-0.7606198, 1.580751, -0.7684063, 0, 0, 0, 1, 1,
-0.7466728, -0.346678, -2.18037, 0, 0, 0, 1, 1,
-0.7440771, 0.2022407, -0.9824334, 0, 0, 0, 1, 1,
-0.7418577, -0.4668545, -3.348912, 1, 1, 1, 1, 1,
-0.7401338, -2.441491, -3.127804, 1, 1, 1, 1, 1,
-0.7320371, 0.5126503, -1.611884, 1, 1, 1, 1, 1,
-0.7264491, -0.08413479, -0.1949196, 1, 1, 1, 1, 1,
-0.7166663, 1.062478, -0.6291657, 1, 1, 1, 1, 1,
-0.7129886, 0.2599897, -2.975393, 1, 1, 1, 1, 1,
-0.7129431, -0.4082393, -3.653931, 1, 1, 1, 1, 1,
-0.7121171, 0.2452326, -1.912629, 1, 1, 1, 1, 1,
-0.7116286, 0.5826382, 0.0392823, 1, 1, 1, 1, 1,
-0.7086861, 0.1091546, -1.523187, 1, 1, 1, 1, 1,
-0.7003146, 0.3571132, -1.809039, 1, 1, 1, 1, 1,
-0.6990806, 0.09489418, -2.890719, 1, 1, 1, 1, 1,
-0.6986533, 0.6000717, -1.808287, 1, 1, 1, 1, 1,
-0.6858639, 1.674212, -1.78379, 1, 1, 1, 1, 1,
-0.6857098, -0.1051319, -1.903529, 1, 1, 1, 1, 1,
-0.6853737, 0.1139923, -1.109635, 0, 0, 1, 1, 1,
-0.6847211, 1.036541, -1.214832, 1, 0, 0, 1, 1,
-0.6761406, -0.3201193, -1.418954, 1, 0, 0, 1, 1,
-0.6751845, -0.1527391, -2.383024, 1, 0, 0, 1, 1,
-0.6637362, 0.0904719, -2.362871, 1, 0, 0, 1, 1,
-0.661305, 1.264808, -0.001337197, 1, 0, 0, 1, 1,
-0.6608045, 0.7067688, -0.9684207, 0, 0, 0, 1, 1,
-0.6594526, 0.2960151, -0.9765555, 0, 0, 0, 1, 1,
-0.6586726, -0.08428272, -3.352937, 0, 0, 0, 1, 1,
-0.6503497, 1.182242, -0.4298728, 0, 0, 0, 1, 1,
-0.6502018, -0.1736517, -1.337339, 0, 0, 0, 1, 1,
-0.6498446, -1.686305, -2.226597, 0, 0, 0, 1, 1,
-0.6491503, 1.077736, -1.458712, 0, 0, 0, 1, 1,
-0.649019, -0.8616688, -1.740067, 1, 1, 1, 1, 1,
-0.6457006, -0.2510272, -0.930485, 1, 1, 1, 1, 1,
-0.6379607, 0.7634104, -0.2782083, 1, 1, 1, 1, 1,
-0.6359085, -1.02834, -3.529384, 1, 1, 1, 1, 1,
-0.6351586, -0.106569, -4.236818, 1, 1, 1, 1, 1,
-0.6278381, 2.861943, -1.260504, 1, 1, 1, 1, 1,
-0.6244284, -0.7211404, -3.193829, 1, 1, 1, 1, 1,
-0.6212514, -0.04165121, -1.290346, 1, 1, 1, 1, 1,
-0.6205432, 0.5889787, -0.801809, 1, 1, 1, 1, 1,
-0.6204022, 0.4176691, -0.8680183, 1, 1, 1, 1, 1,
-0.6173195, -0.5384523, -2.662605, 1, 1, 1, 1, 1,
-0.6156845, 0.34331, -0.9483117, 1, 1, 1, 1, 1,
-0.6116773, 1.253609, -0.1501862, 1, 1, 1, 1, 1,
-0.6109394, 0.9540251, -0.9777518, 1, 1, 1, 1, 1,
-0.6080362, -1.222383, -4.350057, 1, 1, 1, 1, 1,
-0.6075772, 2.254602, 0.5029348, 0, 0, 1, 1, 1,
-0.6004522, -1.434051, -1.742908, 1, 0, 0, 1, 1,
-0.6002669, 1.6291, 0.001666916, 1, 0, 0, 1, 1,
-0.5980176, -0.4109897, -3.172324, 1, 0, 0, 1, 1,
-0.597364, 0.4075261, -1.438027, 1, 0, 0, 1, 1,
-0.5961668, -0.9211137, -2.566886, 1, 0, 0, 1, 1,
-0.5935748, -0.2620205, -1.021367, 0, 0, 0, 1, 1,
-0.5914148, -0.7305471, -2.83907, 0, 0, 0, 1, 1,
-0.5883043, 0.4212488, -1.724991, 0, 0, 0, 1, 1,
-0.5882523, -0.1664945, -0.9598625, 0, 0, 0, 1, 1,
-0.5875477, 1.371317, -0.2916419, 0, 0, 0, 1, 1,
-0.5835302, 1.08775, 0.1375677, 0, 0, 0, 1, 1,
-0.5735104, -1.374416, -1.871647, 0, 0, 0, 1, 1,
-0.5716491, 1.774995, 0.6571292, 1, 1, 1, 1, 1,
-0.5677396, 0.4573627, -3.050399, 1, 1, 1, 1, 1,
-0.5661803, 1.74984, -2.462565, 1, 1, 1, 1, 1,
-0.5653297, 0.7776774, -2.021063, 1, 1, 1, 1, 1,
-0.5636649, 0.1487789, -1.220263, 1, 1, 1, 1, 1,
-0.5620962, -0.2992679, -2.039439, 1, 1, 1, 1, 1,
-0.5617549, 0.3962309, -0.2384491, 1, 1, 1, 1, 1,
-0.5609571, -0.2505512, -1.75688, 1, 1, 1, 1, 1,
-0.5592147, 1.015591, 0.8766443, 1, 1, 1, 1, 1,
-0.5551739, 1.264182, -3.348089, 1, 1, 1, 1, 1,
-0.5505102, -1.462367, -2.329142, 1, 1, 1, 1, 1,
-0.5497557, -1.193303, -2.563373, 1, 1, 1, 1, 1,
-0.5445194, -0.3165101, -3.164246, 1, 1, 1, 1, 1,
-0.5401826, 2.020653, 0.9300467, 1, 1, 1, 1, 1,
-0.5343946, 0.2361206, -2.819161, 1, 1, 1, 1, 1,
-0.5343481, -1.173452, -3.181795, 0, 0, 1, 1, 1,
-0.5220883, -0.342195, -1.016991, 1, 0, 0, 1, 1,
-0.5210274, 0.7876409, -1.639718, 1, 0, 0, 1, 1,
-0.5208695, 0.9973078, -1.439486, 1, 0, 0, 1, 1,
-0.5200187, 1.515397, 0.6786854, 1, 0, 0, 1, 1,
-0.5192035, 0.4792432, -2.059478, 1, 0, 0, 1, 1,
-0.5106093, -0.3183478, -3.565679, 0, 0, 0, 1, 1,
-0.5099965, 1.418934, -1.515624, 0, 0, 0, 1, 1,
-0.5087973, 1.090897, -0.02268341, 0, 0, 0, 1, 1,
-0.5052431, 0.6228551, -0.667802, 0, 0, 0, 1, 1,
-0.5034311, 1.003123, -1.048471, 0, 0, 0, 1, 1,
-0.5028155, 0.8197749, -1.548561, 0, 0, 0, 1, 1,
-0.5015649, -0.5965988, -3.466348, 0, 0, 0, 1, 1,
-0.4999832, -0.3272457, -3.826397, 1, 1, 1, 1, 1,
-0.4989409, -0.3137955, -2.109171, 1, 1, 1, 1, 1,
-0.4982408, -0.8175445, -2.025615, 1, 1, 1, 1, 1,
-0.4978088, -0.7171937, -2.589105, 1, 1, 1, 1, 1,
-0.49106, -0.1943123, -2.573086, 1, 1, 1, 1, 1,
-0.4882891, -0.1654739, -2.956362, 1, 1, 1, 1, 1,
-0.4865963, -0.1790272, -2.175689, 1, 1, 1, 1, 1,
-0.4842505, 0.1420248, -0.9424291, 1, 1, 1, 1, 1,
-0.4821832, -0.6876571, -3.37918, 1, 1, 1, 1, 1,
-0.4802475, -1.65204, -4.068301, 1, 1, 1, 1, 1,
-0.4638186, 0.2178904, -3.268979, 1, 1, 1, 1, 1,
-0.4623435, -0.7563357, -2.797544, 1, 1, 1, 1, 1,
-0.4597849, 1.070951, 0.6086026, 1, 1, 1, 1, 1,
-0.4592117, -0.2875809, -2.165361, 1, 1, 1, 1, 1,
-0.4590261, 0.06106541, -1.043233, 1, 1, 1, 1, 1,
-0.4546484, -0.4602528, -3.81953, 0, 0, 1, 1, 1,
-0.4492251, 0.1634937, -1.066049, 1, 0, 0, 1, 1,
-0.441191, 0.4128631, -0.4476683, 1, 0, 0, 1, 1,
-0.4402317, 0.2276805, 0.6290894, 1, 0, 0, 1, 1,
-0.4379648, -0.3853691, -1.956079, 1, 0, 0, 1, 1,
-0.43612, -0.3039744, -2.390285, 1, 0, 0, 1, 1,
-0.4360738, 1.282941, -0.3137271, 0, 0, 0, 1, 1,
-0.4338087, -0.6026685, -2.073464, 0, 0, 0, 1, 1,
-0.4337644, 0.6519101, -2.408647, 0, 0, 0, 1, 1,
-0.4335535, 2.368824, -1.322352, 0, 0, 0, 1, 1,
-0.4278844, 0.5103849, -0.5169837, 0, 0, 0, 1, 1,
-0.4264493, -0.4802535, -4.447315, 0, 0, 0, 1, 1,
-0.4248825, -1.356798, -1.766308, 0, 0, 0, 1, 1,
-0.4222918, -0.8019705, -2.640882, 1, 1, 1, 1, 1,
-0.4199031, 1.626116, -0.1841865, 1, 1, 1, 1, 1,
-0.4191141, -0.9842338, -2.592388, 1, 1, 1, 1, 1,
-0.4141278, 1.001037, 0.1542518, 1, 1, 1, 1, 1,
-0.4089922, 2.180618, 0.8603243, 1, 1, 1, 1, 1,
-0.4032867, 2.341762, -2.263245, 1, 1, 1, 1, 1,
-0.4029571, 1.630494, -0.124172, 1, 1, 1, 1, 1,
-0.4008264, 0.6767975, -1.144632, 1, 1, 1, 1, 1,
-0.3967957, -0.4901836, -2.760732, 1, 1, 1, 1, 1,
-0.3958454, 1.039688, 0.5440414, 1, 1, 1, 1, 1,
-0.3919282, -0.375068, -0.8765849, 1, 1, 1, 1, 1,
-0.3916187, -0.6924714, -2.72865, 1, 1, 1, 1, 1,
-0.3908834, -1.091066, -3.855662, 1, 1, 1, 1, 1,
-0.3866487, 1.118175, -0.9302083, 1, 1, 1, 1, 1,
-0.3863566, 1.217358, -0.1668429, 1, 1, 1, 1, 1,
-0.3854014, 1.685876, -0.8576795, 0, 0, 1, 1, 1,
-0.3798259, -0.1232267, -1.621547, 1, 0, 0, 1, 1,
-0.3779232, 0.4174609, -0.4984379, 1, 0, 0, 1, 1,
-0.3758518, -0.05815537, -0.839116, 1, 0, 0, 1, 1,
-0.3704715, 0.08528693, -3.042168, 1, 0, 0, 1, 1,
-0.3591305, -0.9294537, -0.2069152, 1, 0, 0, 1, 1,
-0.3585906, 0.4544286, 0.1476962, 0, 0, 0, 1, 1,
-0.3575949, -0.6144574, -1.970378, 0, 0, 0, 1, 1,
-0.3540472, 0.5179967, -1.190516, 0, 0, 0, 1, 1,
-0.3524828, 0.03459971, -1.888462, 0, 0, 0, 1, 1,
-0.3485393, 0.1482435, -0.2799169, 0, 0, 0, 1, 1,
-0.3464898, -0.9029781, -4.317695, 0, 0, 0, 1, 1,
-0.345852, 0.6558618, -1.05149, 0, 0, 0, 1, 1,
-0.3451952, -1.300183, -2.749655, 1, 1, 1, 1, 1,
-0.3409085, -1.381741, -3.05768, 1, 1, 1, 1, 1,
-0.3380728, -0.5180741, -1.76245, 1, 1, 1, 1, 1,
-0.3379733, 0.2760845, -0.604717, 1, 1, 1, 1, 1,
-0.3356746, 2.271552, -0.7187182, 1, 1, 1, 1, 1,
-0.3343912, -0.959815, -2.217073, 1, 1, 1, 1, 1,
-0.3316633, -0.06869532, -2.102136, 1, 1, 1, 1, 1,
-0.3314447, -2.661762, -3.710428, 1, 1, 1, 1, 1,
-0.3249901, -0.9251959, -2.27109, 1, 1, 1, 1, 1,
-0.322898, -1.38871, -1.603799, 1, 1, 1, 1, 1,
-0.322002, 1.575252, -1.348283, 1, 1, 1, 1, 1,
-0.3175944, -1.397756, -2.902784, 1, 1, 1, 1, 1,
-0.3129995, 2.171329, 0.2058509, 1, 1, 1, 1, 1,
-0.3107885, -0.469007, -2.174276, 1, 1, 1, 1, 1,
-0.3093773, -1.38599, -1.867286, 1, 1, 1, 1, 1,
-0.3066388, 0.06268176, -0.7156991, 0, 0, 1, 1, 1,
-0.3046942, -1.487249, -1.0729, 1, 0, 0, 1, 1,
-0.303038, -0.2933899, -2.377739, 1, 0, 0, 1, 1,
-0.3004566, -0.8957539, -1.753471, 1, 0, 0, 1, 1,
-0.294115, -1.784996, -1.787068, 1, 0, 0, 1, 1,
-0.2928749, 1.774676, 0.364816, 1, 0, 0, 1, 1,
-0.2905904, 0.8679886, -0.393381, 0, 0, 0, 1, 1,
-0.2886267, -0.3281453, -2.412541, 0, 0, 0, 1, 1,
-0.287296, 0.2089145, -0.5733877, 0, 0, 0, 1, 1,
-0.2858644, 0.07338128, -1.529691, 0, 0, 0, 1, 1,
-0.284912, 0.6199822, -1.322855, 0, 0, 0, 1, 1,
-0.2839207, -1.7294, -2.944356, 0, 0, 0, 1, 1,
-0.2836446, 0.1300953, -0.7061276, 0, 0, 0, 1, 1,
-0.279825, -0.9079555, -3.516333, 1, 1, 1, 1, 1,
-0.2762029, 0.3769559, -1.641723, 1, 1, 1, 1, 1,
-0.2711974, 0.8930633, -0.4038285, 1, 1, 1, 1, 1,
-0.2706133, 0.6966109, 1.328503, 1, 1, 1, 1, 1,
-0.2692189, -0.4038501, -2.144581, 1, 1, 1, 1, 1,
-0.2665745, 0.7412941, -0.6628408, 1, 1, 1, 1, 1,
-0.2662552, 0.8364351, 0.3345811, 1, 1, 1, 1, 1,
-0.2645729, 0.3383461, 0.8667436, 1, 1, 1, 1, 1,
-0.2637827, 0.3465117, -0.4479156, 1, 1, 1, 1, 1,
-0.2636841, 0.8399372, -0.4914243, 1, 1, 1, 1, 1,
-0.2629489, -1.186929, -4.294037, 1, 1, 1, 1, 1,
-0.2533299, 0.7845231, -0.6443656, 1, 1, 1, 1, 1,
-0.2503553, -1.262432, -3.156427, 1, 1, 1, 1, 1,
-0.2476949, -3.252694, -3.061826, 1, 1, 1, 1, 1,
-0.2465194, 0.6041383, -0.5915887, 1, 1, 1, 1, 1,
-0.2433781, -1.019928, -4.686741, 0, 0, 1, 1, 1,
-0.2401851, 1.619021, 1.943811, 1, 0, 0, 1, 1,
-0.2394698, -0.5418994, -1.616366, 1, 0, 0, 1, 1,
-0.2378289, 0.6801072, -0.2481594, 1, 0, 0, 1, 1,
-0.2370049, 0.2045081, -1.707361, 1, 0, 0, 1, 1,
-0.2353117, -0.2988841, -3.28165, 1, 0, 0, 1, 1,
-0.2336914, -0.8351775, -5.082315, 0, 0, 0, 1, 1,
-0.2294359, 0.1189116, -2.088972, 0, 0, 0, 1, 1,
-0.2286903, -0.6321194, -4.604078, 0, 0, 0, 1, 1,
-0.2276271, 0.2305713, 0.9476179, 0, 0, 0, 1, 1,
-0.2245771, -0.06531926, -2.845464, 0, 0, 0, 1, 1,
-0.2089481, 0.6282621, -0.7948654, 0, 0, 0, 1, 1,
-0.2068914, 0.9600399, -0.4333883, 0, 0, 0, 1, 1,
-0.2068149, 0.5573382, -1.310414, 1, 1, 1, 1, 1,
-0.2023243, 1.027499, 0.0646408, 1, 1, 1, 1, 1,
-0.2006777, -1.044938, -3.248762, 1, 1, 1, 1, 1,
-0.1987533, 0.2275139, -1.588491, 1, 1, 1, 1, 1,
-0.1960358, -1.768267, -2.15561, 1, 1, 1, 1, 1,
-0.1945701, 1.79189, 0.05957904, 1, 1, 1, 1, 1,
-0.1925087, -0.3469595, -2.288948, 1, 1, 1, 1, 1,
-0.1910545, 1.07016, -0.002664343, 1, 1, 1, 1, 1,
-0.1855808, 0.4413106, 0.2613131, 1, 1, 1, 1, 1,
-0.1844674, 0.8974829, 0.1868635, 1, 1, 1, 1, 1,
-0.1831526, 2.008034, 0.9080948, 1, 1, 1, 1, 1,
-0.1807403, 1.223167, -0.3317612, 1, 1, 1, 1, 1,
-0.1771794, -1.151597, -3.639587, 1, 1, 1, 1, 1,
-0.1748415, 0.4606913, 0.008956362, 1, 1, 1, 1, 1,
-0.1729261, -1.135907, -4.089461, 1, 1, 1, 1, 1,
-0.1712151, -1.829969, -2.985463, 0, 0, 1, 1, 1,
-0.1708863, 0.07452212, -0.4444225, 1, 0, 0, 1, 1,
-0.1707352, 0.9630666, -1.613033, 1, 0, 0, 1, 1,
-0.1690501, 1.302553, -0.2533482, 1, 0, 0, 1, 1,
-0.1687723, -0.1556309, -1.765535, 1, 0, 0, 1, 1,
-0.1413726, 1.103719, 1.212516, 1, 0, 0, 1, 1,
-0.1358644, 0.2687761, -1.60866, 0, 0, 0, 1, 1,
-0.1326815, -1.337239, -3.533324, 0, 0, 0, 1, 1,
-0.1323081, -0.4783052, -3.284353, 0, 0, 0, 1, 1,
-0.1312412, 0.4797411, -0.7098929, 0, 0, 0, 1, 1,
-0.127939, -0.2307125, -3.890832, 0, 0, 0, 1, 1,
-0.127493, -0.7574808, -3.898303, 0, 0, 0, 1, 1,
-0.1273095, 0.7362976, -0.5269944, 0, 0, 0, 1, 1,
-0.1258414, 0.2056369, -0.9878623, 1, 1, 1, 1, 1,
-0.1241987, 0.08871505, -1.602186, 1, 1, 1, 1, 1,
-0.120721, 2.962155, -1.420173, 1, 1, 1, 1, 1,
-0.1106724, -1.799639, -3.121085, 1, 1, 1, 1, 1,
-0.1059412, -0.04734715, -0.8864099, 1, 1, 1, 1, 1,
-0.101283, -0.1758495, -4.207705, 1, 1, 1, 1, 1,
-0.1007994, -0.3220724, -4.948244, 1, 1, 1, 1, 1,
-0.09805033, 1.189177, -1.897888, 1, 1, 1, 1, 1,
-0.07790703, 0.2809978, 0.5356318, 1, 1, 1, 1, 1,
-0.07724858, -0.607639, -2.875117, 1, 1, 1, 1, 1,
-0.07568868, 1.084761, 1.301611, 1, 1, 1, 1, 1,
-0.07565413, 0.7224587, 1.171947, 1, 1, 1, 1, 1,
-0.07493324, 0.2173543, 0.4884119, 1, 1, 1, 1, 1,
-0.0711576, 1.331959, -1.106161, 1, 1, 1, 1, 1,
-0.06765769, 0.279053, -0.1557163, 1, 1, 1, 1, 1,
-0.0648256, -0.01163165, -0.9650446, 0, 0, 1, 1, 1,
-0.06026936, 0.3419454, -0.603947, 1, 0, 0, 1, 1,
-0.05995973, 0.5574426, 0.9109495, 1, 0, 0, 1, 1,
-0.05393171, -0.8391934, -2.441383, 1, 0, 0, 1, 1,
-0.05180112, -0.09539127, -2.308856, 1, 0, 0, 1, 1,
-0.05010378, -1.430633, -2.367304, 1, 0, 0, 1, 1,
-0.04966897, 0.03597699, -1.747207, 0, 0, 0, 1, 1,
-0.04459755, -0.9277409, -2.133902, 0, 0, 0, 1, 1,
-0.03946114, -0.009647522, -1.889141, 0, 0, 0, 1, 1,
-0.03916552, -0.7774686, -2.202776, 0, 0, 0, 1, 1,
-0.03391507, -1.446749, -3.137131, 0, 0, 0, 1, 1,
-0.03284598, 0.236221, 2.000572, 0, 0, 0, 1, 1,
-0.03224091, 1.070704, -0.2487047, 0, 0, 0, 1, 1,
-0.02953423, -0.4006507, -4.35699, 1, 1, 1, 1, 1,
-0.0268992, -0.7999382, -3.683945, 1, 1, 1, 1, 1,
-0.02592551, -1.308716, -2.291221, 1, 1, 1, 1, 1,
-0.02435926, -0.5410705, -4.403183, 1, 1, 1, 1, 1,
-0.0222345, -0.03513496, -1.712318, 1, 1, 1, 1, 1,
-0.02069954, 1.734142, 0.6330698, 1, 1, 1, 1, 1,
-0.02043656, 0.8723681, 1.092204, 1, 1, 1, 1, 1,
-0.0203949, -0.7116181, -2.565621, 1, 1, 1, 1, 1,
-0.01979619, 0.481411, -0.01142236, 1, 1, 1, 1, 1,
-0.01963592, 0.9140651, 1.513012, 1, 1, 1, 1, 1,
-0.01958565, 1.341552, -1.000743, 1, 1, 1, 1, 1,
-0.01924603, -0.8945398, -4.121659, 1, 1, 1, 1, 1,
-0.01805371, -0.7078601, -2.105304, 1, 1, 1, 1, 1,
-0.01744659, 1.304871, -0.1829735, 1, 1, 1, 1, 1,
-0.01484049, 1.399607, -0.9382874, 1, 1, 1, 1, 1,
-0.014742, -2.182278, -3.078168, 0, 0, 1, 1, 1,
-0.01288033, 0.3087514, -1.341351, 1, 0, 0, 1, 1,
-0.01213431, -0.04038971, -2.332078, 1, 0, 0, 1, 1,
-0.009336567, 0.2284408, -2.255917, 1, 0, 0, 1, 1,
-0.008960154, 0.484795, -0.3772221, 1, 0, 0, 1, 1,
-0.00879881, 0.455535, 0.3859721, 1, 0, 0, 1, 1,
-0.007577794, -1.191229, -3.66024, 0, 0, 0, 1, 1,
-0.006426018, 0.05763282, -0.08336127, 0, 0, 0, 1, 1,
-0.0001747054, 1.32245, -0.3110715, 0, 0, 0, 1, 1,
0.001160763, -0.5505301, 3.56641, 0, 0, 0, 1, 1,
0.004183707, -0.2280564, 2.462656, 0, 0, 0, 1, 1,
0.005542598, 0.2281131, 1.703727, 0, 0, 0, 1, 1,
0.006074119, 0.3522015, -0.1094525, 0, 0, 0, 1, 1,
0.006822044, -0.7261132, 3.584619, 1, 1, 1, 1, 1,
0.008041812, 0.6790177, -0.08044583, 1, 1, 1, 1, 1,
0.00952408, -0.7890079, 4.12061, 1, 1, 1, 1, 1,
0.009903503, -0.6935449, 4.63053, 1, 1, 1, 1, 1,
0.01146123, 0.380617, 0.4921934, 1, 1, 1, 1, 1,
0.01497599, 0.4472698, 0.4634621, 1, 1, 1, 1, 1,
0.01890114, -1.090877, 3.615255, 1, 1, 1, 1, 1,
0.01930497, 0.4711053, -1.656898, 1, 1, 1, 1, 1,
0.01963745, 0.5522012, -0.1095025, 1, 1, 1, 1, 1,
0.02155012, -3.071526, 1.782932, 1, 1, 1, 1, 1,
0.02157012, 1.185485, 0.4533905, 1, 1, 1, 1, 1,
0.0230035, 0.4300324, 1.366967, 1, 1, 1, 1, 1,
0.0248992, 0.4486643, -1.107363, 1, 1, 1, 1, 1,
0.03040505, 1.702668, -1.367477, 1, 1, 1, 1, 1,
0.03217305, -1.671377, 3.471178, 1, 1, 1, 1, 1,
0.03345008, 1.474273, -1.214666, 0, 0, 1, 1, 1,
0.03854809, 0.4239179, 0.738007, 1, 0, 0, 1, 1,
0.04093876, 1.278375, -0.5770135, 1, 0, 0, 1, 1,
0.04106231, 1.295624, -0.7664748, 1, 0, 0, 1, 1,
0.04226035, -1.653674, 3.009475, 1, 0, 0, 1, 1,
0.04788678, 0.6709193, 2.557066, 1, 0, 0, 1, 1,
0.04813228, 2.433124, -0.0657867, 0, 0, 0, 1, 1,
0.0486799, -1.164499, 3.519456, 0, 0, 0, 1, 1,
0.05076007, 0.1430125, -0.8113077, 0, 0, 0, 1, 1,
0.05197972, 1.00875, -2.318792, 0, 0, 0, 1, 1,
0.05302736, 1.46912, 0.9348643, 0, 0, 0, 1, 1,
0.0563988, 0.1297676, -1.335566, 0, 0, 0, 1, 1,
0.05706027, 0.1044147, 1.003137, 0, 0, 0, 1, 1,
0.06091902, 1.185389, 0.1646329, 1, 1, 1, 1, 1,
0.06327534, 1.236331, 0.991872, 1, 1, 1, 1, 1,
0.06878299, -0.2400439, 3.214695, 1, 1, 1, 1, 1,
0.06961871, -0.8797435, 3.025687, 1, 1, 1, 1, 1,
0.08429439, -0.4822818, 2.632949, 1, 1, 1, 1, 1,
0.0854113, -0.5891199, 2.859285, 1, 1, 1, 1, 1,
0.08543988, -1.719918, 4.065616, 1, 1, 1, 1, 1,
0.08761077, 0.4734973, -0.7876296, 1, 1, 1, 1, 1,
0.09157176, -2.316549, 2.178699, 1, 1, 1, 1, 1,
0.1014523, 1.007611, 1.507045, 1, 1, 1, 1, 1,
0.104649, -0.6814084, 4.495541, 1, 1, 1, 1, 1,
0.1047418, -0.9729242, 4.333436, 1, 1, 1, 1, 1,
0.105075, -0.9133553, 0.4477264, 1, 1, 1, 1, 1,
0.1055745, -1.81654, 1.536622, 1, 1, 1, 1, 1,
0.1071653, 0.9780696, 0.5698758, 1, 1, 1, 1, 1,
0.1075404, -1.019063, 3.701212, 0, 0, 1, 1, 1,
0.1080175, -0.1766796, 4.139085, 1, 0, 0, 1, 1,
0.1081078, -0.2378582, 2.389729, 1, 0, 0, 1, 1,
0.109251, 0.4868238, 0.6433274, 1, 0, 0, 1, 1,
0.1118446, -1.91581, 2.983979, 1, 0, 0, 1, 1,
0.1159643, -0.2052017, 1.955622, 1, 0, 0, 1, 1,
0.1171763, 1.767031, -1.517184, 0, 0, 0, 1, 1,
0.1173057, 0.4762369, 1.398107, 0, 0, 0, 1, 1,
0.1204366, 1.253101, -0.105884, 0, 0, 0, 1, 1,
0.1206241, 0.3699521, 0.7018324, 0, 0, 0, 1, 1,
0.1218559, 0.3806831, 0.7110991, 0, 0, 0, 1, 1,
0.1223162, -0.4945911, 3.588004, 0, 0, 0, 1, 1,
0.1244091, -0.1127463, 2.754968, 0, 0, 0, 1, 1,
0.1246747, 0.7976098, -1.469389, 1, 1, 1, 1, 1,
0.1280892, -0.804168, 2.287463, 1, 1, 1, 1, 1,
0.1323068, 1.250086, 0.2252394, 1, 1, 1, 1, 1,
0.1342221, 0.2828724, -1.439289, 1, 1, 1, 1, 1,
0.135077, -1.053353, 3.314508, 1, 1, 1, 1, 1,
0.1470476, -0.5432506, 1.550956, 1, 1, 1, 1, 1,
0.148706, 0.4866721, 1.693447, 1, 1, 1, 1, 1,
0.1494067, 0.9316047, 0.5131474, 1, 1, 1, 1, 1,
0.1494136, 1.343296, -0.5747465, 1, 1, 1, 1, 1,
0.14946, 1.397506, -0.7139374, 1, 1, 1, 1, 1,
0.1515143, -0.02814051, 1.129895, 1, 1, 1, 1, 1,
0.1521101, 0.7773181, -0.6864556, 1, 1, 1, 1, 1,
0.1541298, -0.4964536, 2.523086, 1, 1, 1, 1, 1,
0.1559515, 0.757664, 0.968914, 1, 1, 1, 1, 1,
0.1566326, 1.436041, 0.02281406, 1, 1, 1, 1, 1,
0.1569484, 1.017014, -0.3925756, 0, 0, 1, 1, 1,
0.1585066, -1.674108, 2.735159, 1, 0, 0, 1, 1,
0.162056, -0.3464141, 1.665858, 1, 0, 0, 1, 1,
0.1630027, -1.06817, 3.617518, 1, 0, 0, 1, 1,
0.163873, 0.06615548, 2.07203, 1, 0, 0, 1, 1,
0.1689766, -1.566635, 4.769694, 1, 0, 0, 1, 1,
0.1701708, -0.1090058, 2.805773, 0, 0, 0, 1, 1,
0.1720714, -0.3363657, 2.838231, 0, 0, 0, 1, 1,
0.1756055, -1.447538, 1.718795, 0, 0, 0, 1, 1,
0.1798633, -0.7244196, 5.713838, 0, 0, 0, 1, 1,
0.1889206, -0.9715642, 1.801768, 0, 0, 0, 1, 1,
0.1890438, 0.4095553, -0.8625628, 0, 0, 0, 1, 1,
0.1890682, -2.175591, 2.003826, 0, 0, 0, 1, 1,
0.1902164, -2.309455, 3.551554, 1, 1, 1, 1, 1,
0.1955823, 0.9233251, 0.3791209, 1, 1, 1, 1, 1,
0.1975094, 0.6854013, -0.4570852, 1, 1, 1, 1, 1,
0.1980296, -0.1988313, 2.782042, 1, 1, 1, 1, 1,
0.2000592, -0.4892855, 2.876044, 1, 1, 1, 1, 1,
0.2043042, -0.3186064, 4.212625, 1, 1, 1, 1, 1,
0.2080592, -0.6356924, 4.488884, 1, 1, 1, 1, 1,
0.2106458, -1.071323, 2.077801, 1, 1, 1, 1, 1,
0.2107897, 1.41554, 0.3120317, 1, 1, 1, 1, 1,
0.2109492, 2.094272, 0.8656366, 1, 1, 1, 1, 1,
0.2160839, -0.5017525, 2.88969, 1, 1, 1, 1, 1,
0.2163005, 0.2637374, 0.581601, 1, 1, 1, 1, 1,
0.217248, -0.1031567, 2.184451, 1, 1, 1, 1, 1,
0.2185707, 0.2926985, 0.8325579, 1, 1, 1, 1, 1,
0.219667, 0.4327575, 0.1128246, 1, 1, 1, 1, 1,
0.2203837, -0.1755789, 2.314789, 0, 0, 1, 1, 1,
0.2278133, 0.866435, -0.7648195, 1, 0, 0, 1, 1,
0.2311088, -1.169327, 4.006006, 1, 0, 0, 1, 1,
0.2323497, -2.142171, 4.465721, 1, 0, 0, 1, 1,
0.2329184, -1.526604, 3.458888, 1, 0, 0, 1, 1,
0.2367027, -1.02764, 1.59729, 1, 0, 0, 1, 1,
0.2368665, 0.3152635, -1.553738, 0, 0, 0, 1, 1,
0.238989, 0.5802078, 2.786491, 0, 0, 0, 1, 1,
0.2467065, 1.88463, -0.241769, 0, 0, 0, 1, 1,
0.247545, 2.947254, -1.158385, 0, 0, 0, 1, 1,
0.2516962, 1.20992, -0.3015062, 0, 0, 0, 1, 1,
0.2545307, -1.56987, 2.903785, 0, 0, 0, 1, 1,
0.2551607, -0.2021432, 1.763653, 0, 0, 0, 1, 1,
0.2613277, -0.5856204, 3.321804, 1, 1, 1, 1, 1,
0.264663, 0.2470245, 4.081966, 1, 1, 1, 1, 1,
0.2667367, -1.431853, 2.19761, 1, 1, 1, 1, 1,
0.2670571, 0.2834534, -0.9374767, 1, 1, 1, 1, 1,
0.2685353, 0.1042692, 0.1900946, 1, 1, 1, 1, 1,
0.2709654, -1.346363, 1.07222, 1, 1, 1, 1, 1,
0.2717884, -0.05629549, 2.035216, 1, 1, 1, 1, 1,
0.276874, 0.2898702, 1.170217, 1, 1, 1, 1, 1,
0.2795438, 0.5065836, -0.6756715, 1, 1, 1, 1, 1,
0.2802632, -1.329348, 3.502307, 1, 1, 1, 1, 1,
0.2809176, -0.8073252, 4.945011, 1, 1, 1, 1, 1,
0.2849462, -1.729362, 4.278306, 1, 1, 1, 1, 1,
0.2859857, 1.095478, 1.08098, 1, 1, 1, 1, 1,
0.2908401, 0.9975332, 0.3206194, 1, 1, 1, 1, 1,
0.2937482, -0.8655435, 3.193476, 1, 1, 1, 1, 1,
0.2952586, -0.7251965, 3.394262, 0, 0, 1, 1, 1,
0.2983656, 0.3468229, 1.709124, 1, 0, 0, 1, 1,
0.3025721, 0.8659004, 1.127334, 1, 0, 0, 1, 1,
0.3026392, 0.2184046, -0.554976, 1, 0, 0, 1, 1,
0.3096416, 0.9554091, 0.6677481, 1, 0, 0, 1, 1,
0.3107282, 0.3441606, 0.2306596, 1, 0, 0, 1, 1,
0.3140472, -0.5426376, 3.111258, 0, 0, 0, 1, 1,
0.3156809, -0.8629183, 2.432751, 0, 0, 0, 1, 1,
0.3166218, 0.1749222, 0.8316096, 0, 0, 0, 1, 1,
0.3243774, 0.4469199, 1.959175, 0, 0, 0, 1, 1,
0.3246069, -1.42651, 3.270985, 0, 0, 0, 1, 1,
0.3269139, -0.02184607, 0.2107234, 0, 0, 0, 1, 1,
0.3310932, -0.0211974, 1.578448, 0, 0, 0, 1, 1,
0.3315126, -0.4034781, 1.407925, 1, 1, 1, 1, 1,
0.3335703, -0.2076293, 2.593272, 1, 1, 1, 1, 1,
0.336282, -1.643823, 3.947576, 1, 1, 1, 1, 1,
0.3472129, 0.2289328, 0.545316, 1, 1, 1, 1, 1,
0.3530213, 0.1323106, 0.8376672, 1, 1, 1, 1, 1,
0.3538025, 0.297709, 0.4159171, 1, 1, 1, 1, 1,
0.354252, 0.09587766, 3.02655, 1, 1, 1, 1, 1,
0.3571157, 2.087861, -0.2378748, 1, 1, 1, 1, 1,
0.3633569, 0.09306407, 2.835822, 1, 1, 1, 1, 1,
0.3637167, -0.08396423, 0.794356, 1, 1, 1, 1, 1,
0.3667498, -0.7630486, 3.749438, 1, 1, 1, 1, 1,
0.3677441, -0.114835, 2.989519, 1, 1, 1, 1, 1,
0.3749918, 1.008938, 0.6895839, 1, 1, 1, 1, 1,
0.3781919, 1.180977, 0.8603804, 1, 1, 1, 1, 1,
0.3785421, 0.4248644, 0.8883296, 1, 1, 1, 1, 1,
0.3789487, -0.2181866, 1.995754, 0, 0, 1, 1, 1,
0.381116, -0.7678368, 2.0189, 1, 0, 0, 1, 1,
0.3819292, 0.3330648, -0.4993288, 1, 0, 0, 1, 1,
0.3827293, 0.244748, 0.07696664, 1, 0, 0, 1, 1,
0.3869515, 1.362401, 0.977023, 1, 0, 0, 1, 1,
0.3870499, -0.02726023, 3.353596, 1, 0, 0, 1, 1,
0.3903699, -0.989415, 2.091268, 0, 0, 0, 1, 1,
0.3966044, 0.3420631, -0.4587229, 0, 0, 0, 1, 1,
0.3979856, 0.7184983, -0.9376033, 0, 0, 0, 1, 1,
0.3980372, -1.006425, 1.551124, 0, 0, 0, 1, 1,
0.4002743, -0.7843173, 2.336652, 0, 0, 0, 1, 1,
0.4018347, 0.5814821, 0.9911961, 0, 0, 0, 1, 1,
0.4032922, -1.031763, 4.295942, 0, 0, 0, 1, 1,
0.40353, -0.4930701, 2.249856, 1, 1, 1, 1, 1,
0.4036324, 0.8384182, 1.254739, 1, 1, 1, 1, 1,
0.4062451, -0.9402651, 2.603054, 1, 1, 1, 1, 1,
0.4082586, 0.01946204, 2.273824, 1, 1, 1, 1, 1,
0.4087854, 0.08751544, 1.881863, 1, 1, 1, 1, 1,
0.4122051, 1.095581, 0.2670523, 1, 1, 1, 1, 1,
0.4133631, 0.4402171, 0.9772146, 1, 1, 1, 1, 1,
0.4185503, -0.03961889, 2.15974, 1, 1, 1, 1, 1,
0.4190022, 0.4005137, 0.6267474, 1, 1, 1, 1, 1,
0.4194143, -0.7688336, 3.454293, 1, 1, 1, 1, 1,
0.4210317, 0.7302023, -0.9244546, 1, 1, 1, 1, 1,
0.4245485, -0.5483191, 2.513949, 1, 1, 1, 1, 1,
0.4292693, 0.3820338, 1.457525, 1, 1, 1, 1, 1,
0.4329958, 1.103736, -0.7477512, 1, 1, 1, 1, 1,
0.439948, 2.809682, 0.4607136, 1, 1, 1, 1, 1,
0.4411766, 0.2480339, -0.519464, 0, 0, 1, 1, 1,
0.4423288, 0.08829267, 1.224307, 1, 0, 0, 1, 1,
0.4438272, -1.87756, 2.402412, 1, 0, 0, 1, 1,
0.4493994, -0.565789, 1.408726, 1, 0, 0, 1, 1,
0.4556024, -1.213436, 0.963229, 1, 0, 0, 1, 1,
0.4564294, 1.466506, -0.4498324, 1, 0, 0, 1, 1,
0.4588372, -0.2101257, 2.639311, 0, 0, 0, 1, 1,
0.4622674, -1.767246, 2.807108, 0, 0, 0, 1, 1,
0.4628475, -1.131912, 2.357323, 0, 0, 0, 1, 1,
0.4630157, 0.5190647, 0.2647223, 0, 0, 0, 1, 1,
0.4674444, 0.701095, 1.683025, 0, 0, 0, 1, 1,
0.4676671, 0.3114509, -0.03480205, 0, 0, 0, 1, 1,
0.4681421, -0.3655939, 1.864389, 0, 0, 0, 1, 1,
0.4751528, -0.4195305, 1.415837, 1, 1, 1, 1, 1,
0.4753639, 1.497854, 0.01979301, 1, 1, 1, 1, 1,
0.4785735, 3.167189, 1.071855, 1, 1, 1, 1, 1,
0.4804259, -1.241885, 3.879713, 1, 1, 1, 1, 1,
0.4804647, -2.093279, 3.110166, 1, 1, 1, 1, 1,
0.4812707, -0.7094983, 1.682871, 1, 1, 1, 1, 1,
0.493515, -0.9814722, 3.826916, 1, 1, 1, 1, 1,
0.5064263, 1.191789, -0.1860912, 1, 1, 1, 1, 1,
0.5126498, -0.2441701, 1.498861, 1, 1, 1, 1, 1,
0.5162157, -0.04370853, 3.06988, 1, 1, 1, 1, 1,
0.5172682, 0.3819578, 1.708113, 1, 1, 1, 1, 1,
0.5203713, 0.2457415, 1.632622, 1, 1, 1, 1, 1,
0.5214559, -0.8874279, 3.656597, 1, 1, 1, 1, 1,
0.5268915, -0.5588613, 4.434335, 1, 1, 1, 1, 1,
0.5293816, -0.02601929, 2.437043, 1, 1, 1, 1, 1,
0.5336311, -0.4174115, 1.086323, 0, 0, 1, 1, 1,
0.5349658, -0.8437049, 3.570209, 1, 0, 0, 1, 1,
0.5430053, 1.022935, 0.8526672, 1, 0, 0, 1, 1,
0.5482035, 0.2825279, 1.466196, 1, 0, 0, 1, 1,
0.5488811, -1.038043, 2.758246, 1, 0, 0, 1, 1,
0.5494706, -0.6005594, 2.288995, 1, 0, 0, 1, 1,
0.5510479, -1.397557, 3.034117, 0, 0, 0, 1, 1,
0.5583091, 0.4163593, 0.7724624, 0, 0, 0, 1, 1,
0.5623279, 1.450471, -0.971141, 0, 0, 0, 1, 1,
0.5661709, -0.5188912, 2.503486, 0, 0, 0, 1, 1,
0.5715496, 0.07735012, 0.5253523, 0, 0, 0, 1, 1,
0.5727876, -0.1333762, 2.261777, 0, 0, 0, 1, 1,
0.5840475, 0.9521834, -0.5792586, 0, 0, 0, 1, 1,
0.58806, 1.007617, -0.1825479, 1, 1, 1, 1, 1,
0.5892668, 0.1798491, 1.0296, 1, 1, 1, 1, 1,
0.5943313, 1.614671, -1.380041, 1, 1, 1, 1, 1,
0.5948662, 0.8381537, 1.001561, 1, 1, 1, 1, 1,
0.596211, -0.06472835, 0.2673295, 1, 1, 1, 1, 1,
0.5995181, -0.7995437, 3.023495, 1, 1, 1, 1, 1,
0.6015737, -1.96517, 4.242509, 1, 1, 1, 1, 1,
0.603828, 1.080926, 1.114986, 1, 1, 1, 1, 1,
0.6084018, 0.8355671, 1.275045, 1, 1, 1, 1, 1,
0.6116564, 0.3277948, 1.295405, 1, 1, 1, 1, 1,
0.6155604, -0.2124757, 0.9436054, 1, 1, 1, 1, 1,
0.6163908, 1.044785, 0.02053487, 1, 1, 1, 1, 1,
0.6170859, -0.6406523, 2.207607, 1, 1, 1, 1, 1,
0.6200302, 0.6387015, 0.123782, 1, 1, 1, 1, 1,
0.6217595, 0.3275017, 0.5319815, 1, 1, 1, 1, 1,
0.6232372, 0.8823868, -0.9920295, 0, 0, 1, 1, 1,
0.6257662, 0.5956616, 1.005034, 1, 0, 0, 1, 1,
0.6262622, 0.07177065, 1.576045, 1, 0, 0, 1, 1,
0.62773, -0.03693494, 2.208808, 1, 0, 0, 1, 1,
0.6291015, 0.8013968, 0.2364666, 1, 0, 0, 1, 1,
0.6298093, 0.3973211, 0.7266906, 1, 0, 0, 1, 1,
0.6306375, -2.831656, 2.35784, 0, 0, 0, 1, 1,
0.6389863, -1.060938, 3.662535, 0, 0, 0, 1, 1,
0.6425848, -0.6257063, 2.814496, 0, 0, 0, 1, 1,
0.6602964, 0.5524463, 0.3411953, 0, 0, 0, 1, 1,
0.6630564, -1.640318, 5.040733, 0, 0, 0, 1, 1,
0.6648573, 1.410939, 0.2726095, 0, 0, 0, 1, 1,
0.6700309, 0.003753366, 0.6489535, 0, 0, 0, 1, 1,
0.6726499, 0.7770286, 0.6729201, 1, 1, 1, 1, 1,
0.67778, 0.1738773, 2.983388, 1, 1, 1, 1, 1,
0.6813152, -1.381767, 3.692577, 1, 1, 1, 1, 1,
0.683593, -1.328625, 3.813339, 1, 1, 1, 1, 1,
0.6841856, 1.468917, -0.5530214, 1, 1, 1, 1, 1,
0.686091, -1.263772, 2.603705, 1, 1, 1, 1, 1,
0.6894547, -0.1584492, 0.9873613, 1, 1, 1, 1, 1,
0.6964056, -1.429603, 1.562311, 1, 1, 1, 1, 1,
0.7001571, -0.07515343, 3.227528, 1, 1, 1, 1, 1,
0.7011726, -0.1520885, 2.811108, 1, 1, 1, 1, 1,
0.7012137, 0.5502887, 1.871005, 1, 1, 1, 1, 1,
0.7028457, 1.112183, 0.07268996, 1, 1, 1, 1, 1,
0.7030378, -1.071231, 1.691458, 1, 1, 1, 1, 1,
0.703711, 1.034826, 0.6712227, 1, 1, 1, 1, 1,
0.7114216, 2.482412, 0.4022566, 1, 1, 1, 1, 1,
0.7154208, 0.008572453, 2.725217, 0, 0, 1, 1, 1,
0.7157865, -1.030905, 3.275273, 1, 0, 0, 1, 1,
0.7200664, -0.3184445, 1.533729, 1, 0, 0, 1, 1,
0.7273185, -0.5298476, -1.317738, 1, 0, 0, 1, 1,
0.7276615, 0.7566713, 2.806852, 1, 0, 0, 1, 1,
0.7293007, 0.06874647, 1.528205, 1, 0, 0, 1, 1,
0.7296572, 0.1116575, 3.5346, 0, 0, 0, 1, 1,
0.7346488, -1.444053, 2.762798, 0, 0, 0, 1, 1,
0.7359865, 2.477043, -0.04784201, 0, 0, 0, 1, 1,
0.7369676, -0.1030621, 0.6807222, 0, 0, 0, 1, 1,
0.7401743, 1.065372, -0.2274341, 0, 0, 0, 1, 1,
0.741726, -0.8974863, 2.821755, 0, 0, 0, 1, 1,
0.7419667, -0.7082131, 2.524353, 0, 0, 0, 1, 1,
0.7456716, 2.022963, -1.003791, 1, 1, 1, 1, 1,
0.7457508, 0.8729903, 2.243198, 1, 1, 1, 1, 1,
0.7490411, 0.8483374, 1.135448, 1, 1, 1, 1, 1,
0.7583902, 0.8553396, 1.841608, 1, 1, 1, 1, 1,
0.7620007, -0.4921172, 2.867539, 1, 1, 1, 1, 1,
0.767633, 1.251, 0.3466966, 1, 1, 1, 1, 1,
0.771107, 0.476065, 1.245537, 1, 1, 1, 1, 1,
0.7719133, -0.361853, 0.8356902, 1, 1, 1, 1, 1,
0.7774638, -0.09794519, 1.122263, 1, 1, 1, 1, 1,
0.7799503, -0.3737271, 2.667366, 1, 1, 1, 1, 1,
0.7854435, -0.3782665, 2.337722, 1, 1, 1, 1, 1,
0.7989661, 0.4310856, 0.7235265, 1, 1, 1, 1, 1,
0.8026209, 1.024207, -1.055121, 1, 1, 1, 1, 1,
0.8031576, -0.914902, 2.036, 1, 1, 1, 1, 1,
0.8079816, 0.4295654, 1.060346, 1, 1, 1, 1, 1,
0.8133884, 0.8605588, 0.2760207, 0, 0, 1, 1, 1,
0.8212342, 1.716194, -0.8486214, 1, 0, 0, 1, 1,
0.8241325, -0.9891341, 2.151327, 1, 0, 0, 1, 1,
0.8267865, 0.2497431, 0.6701906, 1, 0, 0, 1, 1,
0.8268404, 0.4602435, 1.674948, 1, 0, 0, 1, 1,
0.8269064, 0.5296963, 0.7946631, 1, 0, 0, 1, 1,
0.8278047, -0.7695611, 2.053235, 0, 0, 0, 1, 1,
0.8294122, 1.186524, -0.07052634, 0, 0, 0, 1, 1,
0.8337356, 1.38223, 0.6484042, 0, 0, 0, 1, 1,
0.8400377, -0.7038801, 2.139617, 0, 0, 0, 1, 1,
0.8472044, -0.8476624, 5.134299, 0, 0, 0, 1, 1,
0.8476859, 0.6972739, 1.0202, 0, 0, 0, 1, 1,
0.8497106, -1.088344, 3.619962, 0, 0, 0, 1, 1,
0.8576862, -0.1175107, 2.356, 1, 1, 1, 1, 1,
0.8649166, -1.370893, 3.423493, 1, 1, 1, 1, 1,
0.8700207, 0.3380553, 1.081077, 1, 1, 1, 1, 1,
0.8717678, -0.9580742, 1.693281, 1, 1, 1, 1, 1,
0.8764508, -1.713792, 1.875365, 1, 1, 1, 1, 1,
0.8768013, 0.8134059, 1.218116, 1, 1, 1, 1, 1,
0.8787034, -0.8802625, 2.840429, 1, 1, 1, 1, 1,
0.8802229, 0.6273628, -0.945599, 1, 1, 1, 1, 1,
0.880602, -0.3680825, 1.301041, 1, 1, 1, 1, 1,
0.8873399, -0.2099598, 1.559409, 1, 1, 1, 1, 1,
0.8914954, -0.02889341, 1.801694, 1, 1, 1, 1, 1,
0.8930899, 0.6125352, 1.899356, 1, 1, 1, 1, 1,
0.8949407, -0.5449076, 3.39534, 1, 1, 1, 1, 1,
0.8961279, 0.5327736, 1.137904, 1, 1, 1, 1, 1,
0.8994079, 0.444551, 1.585122, 1, 1, 1, 1, 1,
0.9029353, 0.6104589, 1.879495, 0, 0, 1, 1, 1,
0.9042165, 0.4290634, -0.654618, 1, 0, 0, 1, 1,
0.9146428, -0.3621337, 3.048375, 1, 0, 0, 1, 1,
0.9197164, 0.6115227, -0.7690353, 1, 0, 0, 1, 1,
0.936103, -0.1842207, 1.781445, 1, 0, 0, 1, 1,
0.936597, 0.3511889, 2.617726, 1, 0, 0, 1, 1,
0.9400195, 1.361279, -0.1469647, 0, 0, 0, 1, 1,
0.9531022, 1.921744, -0.1471847, 0, 0, 0, 1, 1,
0.9572074, -1.018049, 1.302074, 0, 0, 0, 1, 1,
0.9602356, -0.8225635, 1.785363, 0, 0, 0, 1, 1,
0.9668109, -1.021566, 1.638336, 0, 0, 0, 1, 1,
0.9700632, 0.364308, 0.0537756, 0, 0, 0, 1, 1,
0.9702922, 0.6197386, 0.05649575, 0, 0, 0, 1, 1,
0.9728677, -0.7678085, 1.915802, 1, 1, 1, 1, 1,
0.9758461, 0.230483, 0.2948624, 1, 1, 1, 1, 1,
0.9853745, 0.4667302, 1.630937, 1, 1, 1, 1, 1,
0.9942569, 0.7305643, 1.950861, 1, 1, 1, 1, 1,
0.9970853, 0.7101836, -0.8066292, 1, 1, 1, 1, 1,
1.01551, 0.4344458, 0.6782814, 1, 1, 1, 1, 1,
1.015834, -3.057569, 2.471597, 1, 1, 1, 1, 1,
1.016025, -1.317783, 3.291337, 1, 1, 1, 1, 1,
1.020812, -0.7878934, 3.865816, 1, 1, 1, 1, 1,
1.023065, 0.6994363, 2.254734, 1, 1, 1, 1, 1,
1.024307, -0.7613459, 2.867365, 1, 1, 1, 1, 1,
1.029194, -1.102126, 0.9480392, 1, 1, 1, 1, 1,
1.041631, 1.703984, -0.8728775, 1, 1, 1, 1, 1,
1.043189, -0.8994585, 1.925648, 1, 1, 1, 1, 1,
1.046616, 1.092669, 0.6007945, 1, 1, 1, 1, 1,
1.046896, -0.2012251, 2.642551, 0, 0, 1, 1, 1,
1.056187, -0.9657824, 3.400229, 1, 0, 0, 1, 1,
1.061204, 0.244073, 0.8923493, 1, 0, 0, 1, 1,
1.06903, 0.08163146, 0.4688914, 1, 0, 0, 1, 1,
1.073277, -1.096939, 2.919805, 1, 0, 0, 1, 1,
1.083134, -0.6452242, 1.050822, 1, 0, 0, 1, 1,
1.083588, -0.4752294, 2.336772, 0, 0, 0, 1, 1,
1.088081, -0.2211821, 1.964265, 0, 0, 0, 1, 1,
1.090303, 0.07696789, -0.3932258, 0, 0, 0, 1, 1,
1.090451, -0.4741849, 1.426637, 0, 0, 0, 1, 1,
1.091792, 1.370447, -1.932858, 0, 0, 0, 1, 1,
1.099577, 1.722664, -1.367931, 0, 0, 0, 1, 1,
1.103765, -0.2010231, 1.765094, 0, 0, 0, 1, 1,
1.106302, -0.8913773, 3.116131, 1, 1, 1, 1, 1,
1.107625, -1.200678, 2.869744, 1, 1, 1, 1, 1,
1.114366, -0.3745203, 1.720949, 1, 1, 1, 1, 1,
1.115511, 0.4304604, 0.7410773, 1, 1, 1, 1, 1,
1.116104, -0.1293175, 2.311988, 1, 1, 1, 1, 1,
1.118786, -0.5479179, 1.704786, 1, 1, 1, 1, 1,
1.135434, -0.1851523, 1.054672, 1, 1, 1, 1, 1,
1.13768, 0.1753704, 2.073953, 1, 1, 1, 1, 1,
1.143766, -0.872947, 2.101665, 1, 1, 1, 1, 1,
1.151974, -0.4349269, 1.075459, 1, 1, 1, 1, 1,
1.154991, 1.175098, 0.2857544, 1, 1, 1, 1, 1,
1.155137, -0.5772845, 0.7670792, 1, 1, 1, 1, 1,
1.165634, 1.206218, -1.294575, 1, 1, 1, 1, 1,
1.167772, -1.625478, 3.472558, 1, 1, 1, 1, 1,
1.168353, 1.173259, 0.05496652, 1, 1, 1, 1, 1,
1.183047, 1.043667, 0.9211601, 0, 0, 1, 1, 1,
1.185396, 0.5919968, 2.272605, 1, 0, 0, 1, 1,
1.186829, -0.02480398, 1.174537, 1, 0, 0, 1, 1,
1.201536, -1.446832, 1.730948, 1, 0, 0, 1, 1,
1.220758, 0.008926537, 1.755934, 1, 0, 0, 1, 1,
1.222819, 0.6124682, 2.155267, 1, 0, 0, 1, 1,
1.224925, -0.5621174, 2.244345, 0, 0, 0, 1, 1,
1.225149, 0.2564178, 1.597471, 0, 0, 0, 1, 1,
1.2328, -1.175219, 2.10598, 0, 0, 0, 1, 1,
1.242444, 1.249002, -0.7991353, 0, 0, 0, 1, 1,
1.247345, 0.02618481, 1.50066, 0, 0, 0, 1, 1,
1.256756, 0.07224765, 1.720955, 0, 0, 0, 1, 1,
1.262313, -0.1071564, 1.211229, 0, 0, 0, 1, 1,
1.273379, 0.1158604, 2.160945, 1, 1, 1, 1, 1,
1.281143, 0.1708817, -0.05553677, 1, 1, 1, 1, 1,
1.28306, -0.341594, 1.654645, 1, 1, 1, 1, 1,
1.283278, -0.958031, 1.674379, 1, 1, 1, 1, 1,
1.296136, 1.474087, 0.6000029, 1, 1, 1, 1, 1,
1.296973, -0.5863925, 2.403679, 1, 1, 1, 1, 1,
1.302402, 0.4628528, 2.328443, 1, 1, 1, 1, 1,
1.312683, 0.18744, 1.212432, 1, 1, 1, 1, 1,
1.313251, -0.4717915, 0.5899872, 1, 1, 1, 1, 1,
1.318078, 0.811353, 1.746558, 1, 1, 1, 1, 1,
1.347489, -1.769124, 3.550684, 1, 1, 1, 1, 1,
1.348673, -1.272564, 1.636549, 1, 1, 1, 1, 1,
1.363095, -0.3899012, 1.864741, 1, 1, 1, 1, 1,
1.372918, 1.265794, 2.684132, 1, 1, 1, 1, 1,
1.382632, 1.493714, -1.485909, 1, 1, 1, 1, 1,
1.403578, -0.09565678, 1.972937, 0, 0, 1, 1, 1,
1.410583, 1.047841, 0.2972766, 1, 0, 0, 1, 1,
1.419054, -0.1699849, -0.09348914, 1, 0, 0, 1, 1,
1.431986, 1.205106, 2.560852, 1, 0, 0, 1, 1,
1.440791, -1.0259, 1.883524, 1, 0, 0, 1, 1,
1.449796, -1.7579, 2.653614, 1, 0, 0, 1, 1,
1.474291, 0.9660538, 2.143497, 0, 0, 0, 1, 1,
1.486918, 0.3210806, 0.8268418, 0, 0, 0, 1, 1,
1.491405, 1.924291, -1.041303, 0, 0, 0, 1, 1,
1.498477, 0.009899585, 2.090304, 0, 0, 0, 1, 1,
1.500509, -2.846978, 1.498649, 0, 0, 0, 1, 1,
1.502123, -1.958342, 1.243391, 0, 0, 0, 1, 1,
1.502414, 0.7166619, 2.343633, 0, 0, 0, 1, 1,
1.50714, -0.1005461, 0.4173264, 1, 1, 1, 1, 1,
1.526848, 1.638352, 1.851299, 1, 1, 1, 1, 1,
1.530094, -0.9946176, 1.510239, 1, 1, 1, 1, 1,
1.535718, 1.020568, -0.07894271, 1, 1, 1, 1, 1,
1.539563, 0.3183291, 4.011529, 1, 1, 1, 1, 1,
1.545738, 1.181214, 1.034682, 1, 1, 1, 1, 1,
1.546684, -1.523989, 1.522597, 1, 1, 1, 1, 1,
1.560243, -1.830267, 4.139752, 1, 1, 1, 1, 1,
1.564523, -0.4122708, 1.8798, 1, 1, 1, 1, 1,
1.581407, -1.63333, 2.729784, 1, 1, 1, 1, 1,
1.595026, 1.308294, 0.6912501, 1, 1, 1, 1, 1,
1.599424, -0.7831336, 2.25913, 1, 1, 1, 1, 1,
1.627588, 0.1362365, 1.258673, 1, 1, 1, 1, 1,
1.631862, -0.8927142, 1.666339, 1, 1, 1, 1, 1,
1.637459, -1.268343, 2.740358, 1, 1, 1, 1, 1,
1.659039, 0.6193143, 0.4793126, 0, 0, 1, 1, 1,
1.661469, -1.861774, 4.212806, 1, 0, 0, 1, 1,
1.688176, 1.607031, -0.6328252, 1, 0, 0, 1, 1,
1.695846, 1.205244, 2.098248, 1, 0, 0, 1, 1,
1.701811, 0.7731862, 2.20723, 1, 0, 0, 1, 1,
1.704355, -1.126207, 2.158286, 1, 0, 0, 1, 1,
1.726364, 0.1385354, -0.4282351, 0, 0, 0, 1, 1,
1.749704, -2.732738, 3.160591, 0, 0, 0, 1, 1,
1.765816, 0.5647686, 1.874993, 0, 0, 0, 1, 1,
1.772498, -0.822346, 1.608055, 0, 0, 0, 1, 1,
1.799909, -0.1053785, 2.778037, 0, 0, 0, 1, 1,
1.811535, 1.869493, 1.133457, 0, 0, 0, 1, 1,
1.829354, -1.008047, 2.921585, 0, 0, 0, 1, 1,
1.83969, 0.294299, 1.13565, 1, 1, 1, 1, 1,
1.867182, -0.1975197, 2.641676, 1, 1, 1, 1, 1,
1.868525, 1.240492, -0.2012665, 1, 1, 1, 1, 1,
1.882088, 0.3027901, 1.602863, 1, 1, 1, 1, 1,
1.882553, -1.039727, 0.764222, 1, 1, 1, 1, 1,
1.88537, -0.9670404, 1.094828, 1, 1, 1, 1, 1,
1.885787, 0.824187, 0.9016275, 1, 1, 1, 1, 1,
1.911896, -1.143156, 0.9825171, 1, 1, 1, 1, 1,
1.916283, 0.4951373, 0.7214841, 1, 1, 1, 1, 1,
1.91642, 0.1395435, -0.9843262, 1, 1, 1, 1, 1,
1.923606, -0.7717195, -0.1275669, 1, 1, 1, 1, 1,
1.977181, -1.839414, 1.778911, 1, 1, 1, 1, 1,
1.990716, 0.2676554, 0.4651927, 1, 1, 1, 1, 1,
1.999631, 1.714621, -1.702757, 1, 1, 1, 1, 1,
2.004033, 1.718392, 0.5630821, 1, 1, 1, 1, 1,
2.022385, 1.094733, 0.9117456, 0, 0, 1, 1, 1,
2.098948, -0.3064, 0.9518446, 1, 0, 0, 1, 1,
2.12221, 1.955932, 0.5089979, 1, 0, 0, 1, 1,
2.136468, 1.220013, 1.92708, 1, 0, 0, 1, 1,
2.152449, 0.03341343, 1.63416, 1, 0, 0, 1, 1,
2.15646, -0.8205574, 2.256307, 1, 0, 0, 1, 1,
2.160888, -0.1501758, 0.01219329, 0, 0, 0, 1, 1,
2.200257, 0.4602469, -0.2662447, 0, 0, 0, 1, 1,
2.212653, -0.2257444, 1.884976, 0, 0, 0, 1, 1,
2.31339, -0.5477037, -0.4512843, 0, 0, 0, 1, 1,
2.373798, 0.3693103, 3.491104, 0, 0, 0, 1, 1,
2.402141, -0.2138799, 1.645721, 0, 0, 0, 1, 1,
2.418936, -0.588335, 1.174956, 0, 0, 0, 1, 1,
2.450438, 1.110185, 0.8598732, 1, 1, 1, 1, 1,
2.670158, -0.269592, 2.044548, 1, 1, 1, 1, 1,
2.723199, -1.115881, 2.253058, 1, 1, 1, 1, 1,
2.72715, 0.711262, 2.977942, 1, 1, 1, 1, 1,
2.782828, -0.2391037, 1.801816, 1, 1, 1, 1, 1,
2.920183, -0.447957, 1.304414, 1, 1, 1, 1, 1,
3.394146, 1.141808, 0.2582759, 1, 1, 1, 1, 1
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
var radius = 9.735357;
var distance = 34.19503;
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
mvMatrix.translate( 0.04085612, 0.0427525, -0.3157613 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19503);
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
