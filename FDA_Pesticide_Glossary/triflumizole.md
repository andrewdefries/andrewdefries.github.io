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
-3.375525, -0.3235203, -1.948499, 1, 0, 0, 1,
-2.773924, 0.9944988, -0.8550845, 1, 0.007843138, 0, 1,
-2.462367, -0.8376564, -3.651537, 1, 0.01176471, 0, 1,
-2.458394, 1.023227, -3.050623, 1, 0.01960784, 0, 1,
-2.376069, -0.5214694, -2.224449, 1, 0.02352941, 0, 1,
-2.332998, -0.464853, -1.460988, 1, 0.03137255, 0, 1,
-2.32079, 0.8536856, -0.8607508, 1, 0.03529412, 0, 1,
-2.237941, 0.4178202, -0.5748587, 1, 0.04313726, 0, 1,
-2.157779, 2.036857, -1.427525, 1, 0.04705882, 0, 1,
-2.138193, 0.3715309, -2.697797, 1, 0.05490196, 0, 1,
-2.137136, 1.725256, -0.2813194, 1, 0.05882353, 0, 1,
-2.124383, 2.359091, -0.2686667, 1, 0.06666667, 0, 1,
-2.098318, 1.167737, -0.2083697, 1, 0.07058824, 0, 1,
-2.074519, -1.174523, -3.545951, 1, 0.07843138, 0, 1,
-2.069116, 0.08997255, -2.123206, 1, 0.08235294, 0, 1,
-2.007019, -0.8893443, -2.389785, 1, 0.09019608, 0, 1,
-1.971848, 0.08749559, 0.634819, 1, 0.09411765, 0, 1,
-1.952781, 0.6553633, -0.9221818, 1, 0.1019608, 0, 1,
-1.943269, -0.2574271, -3.294341, 1, 0.1098039, 0, 1,
-1.917958, -0.991859, -2.851064, 1, 0.1137255, 0, 1,
-1.904739, 0.6778588, -0.6616004, 1, 0.1215686, 0, 1,
-1.88811, 0.8538012, -1.010569, 1, 0.1254902, 0, 1,
-1.869191, 0.2423389, -1.731626, 1, 0.1333333, 0, 1,
-1.863607, -0.05353895, -1.564821, 1, 0.1372549, 0, 1,
-1.856453, -0.4855406, -2.111213, 1, 0.145098, 0, 1,
-1.853828, 0.07819869, -2.887684, 1, 0.1490196, 0, 1,
-1.837035, -1.399688, -1.222546, 1, 0.1568628, 0, 1,
-1.835317, 0.1288835, -0.8351717, 1, 0.1607843, 0, 1,
-1.813409, 0.2444354, -2.066634, 1, 0.1686275, 0, 1,
-1.809725, 0.6104817, -1.058207, 1, 0.172549, 0, 1,
-1.800665, -1.883263, -3.578953, 1, 0.1803922, 0, 1,
-1.797986, 0.5902033, -0.729987, 1, 0.1843137, 0, 1,
-1.792876, 0.9606915, -1.656137, 1, 0.1921569, 0, 1,
-1.78993, 1.430285, 0.5665786, 1, 0.1960784, 0, 1,
-1.789672, 0.9626297, -1.753054, 1, 0.2039216, 0, 1,
-1.725992, -1.040253, -0.8752721, 1, 0.2117647, 0, 1,
-1.721542, -0.01287512, -1.397273, 1, 0.2156863, 0, 1,
-1.71931, 0.5454919, -2.562989, 1, 0.2235294, 0, 1,
-1.718709, -0.913541, -1.237337, 1, 0.227451, 0, 1,
-1.713282, 0.511378, -2.063087, 1, 0.2352941, 0, 1,
-1.709858, 0.5245509, -0.4329184, 1, 0.2392157, 0, 1,
-1.686795, 0.7003665, -0.8352719, 1, 0.2470588, 0, 1,
-1.686056, 0.7447425, 0.6537701, 1, 0.2509804, 0, 1,
-1.673362, -0.8799306, -2.536767, 1, 0.2588235, 0, 1,
-1.654625, -1.412726, -2.44411, 1, 0.2627451, 0, 1,
-1.63946, -1.161297, -1.260876, 1, 0.2705882, 0, 1,
-1.639008, 0.2029032, -2.661035, 1, 0.2745098, 0, 1,
-1.624444, 1.766187, -0.7886384, 1, 0.282353, 0, 1,
-1.613697, -1.576169, -0.1716582, 1, 0.2862745, 0, 1,
-1.586375, 0.7628261, -1.873892, 1, 0.2941177, 0, 1,
-1.575783, 1.309262, -0.781388, 1, 0.3019608, 0, 1,
-1.575517, -1.373403, -2.213013, 1, 0.3058824, 0, 1,
-1.574006, -1.054392, -2.407341, 1, 0.3137255, 0, 1,
-1.559629, -1.017416, -1.405809, 1, 0.3176471, 0, 1,
-1.554885, 1.908375, -1.453817, 1, 0.3254902, 0, 1,
-1.53877, -1.053136, -2.137946, 1, 0.3294118, 0, 1,
-1.537214, -1.291287, -3.833187, 1, 0.3372549, 0, 1,
-1.523162, -0.9121031, -3.546589, 1, 0.3411765, 0, 1,
-1.514974, 0.6718793, -1.23846, 1, 0.3490196, 0, 1,
-1.507048, -0.1877387, -1.480199, 1, 0.3529412, 0, 1,
-1.500578, 0.6760024, -0.7073095, 1, 0.3607843, 0, 1,
-1.491803, 0.2529439, -1.098427, 1, 0.3647059, 0, 1,
-1.488769, 0.2230284, -1.991787, 1, 0.372549, 0, 1,
-1.483615, -0.9114139, -0.7832274, 1, 0.3764706, 0, 1,
-1.472506, 0.910403, -1.412909, 1, 0.3843137, 0, 1,
-1.462872, 0.3002169, -2.276927, 1, 0.3882353, 0, 1,
-1.449826, 1.439394, -2.87173, 1, 0.3960784, 0, 1,
-1.445889, -1.114204, -4.09471, 1, 0.4039216, 0, 1,
-1.442754, -1.364882, -2.452291, 1, 0.4078431, 0, 1,
-1.433385, -0.7442769, -2.061496, 1, 0.4156863, 0, 1,
-1.432738, 0.5815127, -1.039669, 1, 0.4196078, 0, 1,
-1.429686, 0.3417583, -1.902756, 1, 0.427451, 0, 1,
-1.425578, -1.481413, -2.29214, 1, 0.4313726, 0, 1,
-1.424052, -0.5569921, 0.2354228, 1, 0.4392157, 0, 1,
-1.419752, -0.6639658, -0.8322525, 1, 0.4431373, 0, 1,
-1.414721, -0.332639, -3.073929, 1, 0.4509804, 0, 1,
-1.410403, -1.000846, -1.856177, 1, 0.454902, 0, 1,
-1.409069, 1.491989, -2.104411, 1, 0.4627451, 0, 1,
-1.394819, 0.3658025, -1.441609, 1, 0.4666667, 0, 1,
-1.363848, 0.794074, -1.978715, 1, 0.4745098, 0, 1,
-1.35841, 1.099712, -1.072235, 1, 0.4784314, 0, 1,
-1.352892, 0.9826227, 1.134541, 1, 0.4862745, 0, 1,
-1.351421, 0.3033501, -1.478059, 1, 0.4901961, 0, 1,
-1.338781, 0.356796, 1.231275, 1, 0.4980392, 0, 1,
-1.331406, 2.868302, -0.352887, 1, 0.5058824, 0, 1,
-1.325049, 1.345672, -1.125453, 1, 0.509804, 0, 1,
-1.321912, 0.5781402, -1.577272, 1, 0.5176471, 0, 1,
-1.314753, -0.3814398, -1.459873, 1, 0.5215687, 0, 1,
-1.302243, -0.1705077, -2.572545, 1, 0.5294118, 0, 1,
-1.2866, -0.3989757, -1.716258, 1, 0.5333334, 0, 1,
-1.285045, -0.8982576, -2.203, 1, 0.5411765, 0, 1,
-1.274589, 0.7470835, -0.4698395, 1, 0.5450981, 0, 1,
-1.273572, 0.2463597, -1.30794, 1, 0.5529412, 0, 1,
-1.27228, -0.4050511, -1.092831, 1, 0.5568628, 0, 1,
-1.267119, -0.9683313, -1.934654, 1, 0.5647059, 0, 1,
-1.255848, -0.7160337, -2.164072, 1, 0.5686275, 0, 1,
-1.253502, -0.2929648, -2.487567, 1, 0.5764706, 0, 1,
-1.244429, -1.755694, -2.324228, 1, 0.5803922, 0, 1,
-1.242712, -0.4379252, -1.189604, 1, 0.5882353, 0, 1,
-1.239496, -1.823014, -2.803298, 1, 0.5921569, 0, 1,
-1.239042, -0.1284839, -2.170485, 1, 0.6, 0, 1,
-1.237923, -0.26785, -2.633341, 1, 0.6078432, 0, 1,
-1.227158, -0.06159848, 0.06310125, 1, 0.6117647, 0, 1,
-1.219341, -4.02915, -2.908345, 1, 0.6196079, 0, 1,
-1.211649, -0.1601838, -2.135909, 1, 0.6235294, 0, 1,
-1.200297, -1.191509, -1.478437, 1, 0.6313726, 0, 1,
-1.197006, 0.5037211, -0.01004525, 1, 0.6352941, 0, 1,
-1.186388, -0.4121192, -1.723418, 1, 0.6431373, 0, 1,
-1.184009, -0.6965476, -1.776049, 1, 0.6470588, 0, 1,
-1.174387, -1.673403, -2.198654, 1, 0.654902, 0, 1,
-1.173226, -0.3775764, -0.63561, 1, 0.6588235, 0, 1,
-1.171034, -1.079869, -3.759743, 1, 0.6666667, 0, 1,
-1.163068, -0.03797209, -1.36176, 1, 0.6705883, 0, 1,
-1.160165, -1.992331, -3.18923, 1, 0.6784314, 0, 1,
-1.157747, -0.2855792, -1.25948, 1, 0.682353, 0, 1,
-1.156075, -0.6982329, -2.231404, 1, 0.6901961, 0, 1,
-1.15293, -0.84721, -2.773491, 1, 0.6941177, 0, 1,
-1.151952, -0.6686062, -1.579815, 1, 0.7019608, 0, 1,
-1.138103, 0.288848, -0.6645834, 1, 0.7098039, 0, 1,
-1.135065, -0.1302859, -3.424993, 1, 0.7137255, 0, 1,
-1.133795, -0.9864793, -5.02824, 1, 0.7215686, 0, 1,
-1.131405, -1.483435, -2.324419, 1, 0.7254902, 0, 1,
-1.125254, -1.518332, -2.562005, 1, 0.7333333, 0, 1,
-1.123691, -1.089197, -1.642472, 1, 0.7372549, 0, 1,
-1.123319, -1.658, -2.179946, 1, 0.7450981, 0, 1,
-1.113866, -0.3709861, -0.2911687, 1, 0.7490196, 0, 1,
-1.107909, -1.471466, -3.262696, 1, 0.7568628, 0, 1,
-1.101666, -0.241115, -1.753507, 1, 0.7607843, 0, 1,
-1.100341, 0.6650621, 0.2538125, 1, 0.7686275, 0, 1,
-1.093099, 0.8845512, -1.294689, 1, 0.772549, 0, 1,
-1.09024, -0.7591248, -3.793923, 1, 0.7803922, 0, 1,
-1.086356, -1.04132, -3.187004, 1, 0.7843137, 0, 1,
-1.072659, -1.743147, -2.288029, 1, 0.7921569, 0, 1,
-1.068416, 0.2110221, -2.858387, 1, 0.7960784, 0, 1,
-1.066451, -0.6464944, -1.820493, 1, 0.8039216, 0, 1,
-1.064402, -0.5898386, -3.211855, 1, 0.8117647, 0, 1,
-1.061128, 0.316564, -2.426926, 1, 0.8156863, 0, 1,
-1.059835, -0.06762262, -2.296742, 1, 0.8235294, 0, 1,
-1.055093, -0.1278169, -1.210786, 1, 0.827451, 0, 1,
-1.047298, 2.080176, 0.1931239, 1, 0.8352941, 0, 1,
-1.034282, -0.1513813, -2.436409, 1, 0.8392157, 0, 1,
-1.034217, 0.7551561, -2.528919, 1, 0.8470588, 0, 1,
-1.023252, -1.109841, -3.831041, 1, 0.8509804, 0, 1,
-1.016531, 0.2392104, -1.948377, 1, 0.8588235, 0, 1,
-1.009378, 0.04008327, 0.156625, 1, 0.8627451, 0, 1,
-1.004236, 1.498741, -1.610108, 1, 0.8705882, 0, 1,
-1.000566, 0.7324107, -2.257844, 1, 0.8745098, 0, 1,
-0.9957227, 0.3364202, -2.1529, 1, 0.8823529, 0, 1,
-0.9915611, -0.9844549, -3.72499, 1, 0.8862745, 0, 1,
-0.9843978, 0.1234986, -2.04225, 1, 0.8941177, 0, 1,
-0.9772927, -0.4035027, -2.235203, 1, 0.8980392, 0, 1,
-0.9703062, -0.3320307, -1.315522, 1, 0.9058824, 0, 1,
-0.9679286, -0.5956298, -3.875248, 1, 0.9137255, 0, 1,
-0.9631042, 1.535467, -1.766721, 1, 0.9176471, 0, 1,
-0.9621714, -0.6744109, -0.6701186, 1, 0.9254902, 0, 1,
-0.9592369, -0.4327547, -2.663477, 1, 0.9294118, 0, 1,
-0.9568942, -0.9865634, -0.9820955, 1, 0.9372549, 0, 1,
-0.9531033, 0.00484933, -1.711514, 1, 0.9411765, 0, 1,
-0.9505402, -0.8840345, -2.293551, 1, 0.9490196, 0, 1,
-0.9462395, -0.5640032, -1.060444, 1, 0.9529412, 0, 1,
-0.938024, -1.303877, -2.225834, 1, 0.9607843, 0, 1,
-0.936758, 0.9062867, -0.03698457, 1, 0.9647059, 0, 1,
-0.935229, 0.5859918, -1.188969, 1, 0.972549, 0, 1,
-0.9304531, -0.5691631, -1.147866, 1, 0.9764706, 0, 1,
-0.9226653, 1.065828, -1.134551, 1, 0.9843137, 0, 1,
-0.9206231, 0.2032243, 0.3699337, 1, 0.9882353, 0, 1,
-0.9147602, 1.232895, 0.570708, 1, 0.9960784, 0, 1,
-0.9136642, 0.7297454, -3.282018, 0.9960784, 1, 0, 1,
-0.9103585, 1.137984, 0.3433833, 0.9921569, 1, 0, 1,
-0.9098807, 0.5025675, -0.8042663, 0.9843137, 1, 0, 1,
-0.9083626, 0.2960825, 0.316637, 0.9803922, 1, 0, 1,
-0.9076378, 2.328467, 1.194456, 0.972549, 1, 0, 1,
-0.9065011, -0.6942502, -3.63903, 0.9686275, 1, 0, 1,
-0.9064004, 0.5626979, -1.211655, 0.9607843, 1, 0, 1,
-0.8913692, -0.2801697, -2.612166, 0.9568627, 1, 0, 1,
-0.891013, 1.673938, -3.266253, 0.9490196, 1, 0, 1,
-0.8905321, 0.02991288, -2.746969, 0.945098, 1, 0, 1,
-0.8885382, -0.6279532, -2.695835, 0.9372549, 1, 0, 1,
-0.8783115, -0.4692833, -1.613807, 0.9333333, 1, 0, 1,
-0.8766843, 0.4132095, -1.448681, 0.9254902, 1, 0, 1,
-0.8752075, -1.179071, -3.394173, 0.9215686, 1, 0, 1,
-0.8746403, 0.6182462, -1.001759, 0.9137255, 1, 0, 1,
-0.8674731, -1.143889, -3.567824, 0.9098039, 1, 0, 1,
-0.839716, -0.0733242, -1.120695, 0.9019608, 1, 0, 1,
-0.8390788, -1.624836, -1.843656, 0.8941177, 1, 0, 1,
-0.8385134, -0.8364387, -2.65194, 0.8901961, 1, 0, 1,
-0.8345804, 0.7109427, -0.5150546, 0.8823529, 1, 0, 1,
-0.8242661, -1.202812, -1.935309, 0.8784314, 1, 0, 1,
-0.8236285, -2.04397, -1.25233, 0.8705882, 1, 0, 1,
-0.8202538, 0.1698525, -0.3302356, 0.8666667, 1, 0, 1,
-0.8178378, 1.570057, -0.05931307, 0.8588235, 1, 0, 1,
-0.8172735, 0.2356529, -1.59637, 0.854902, 1, 0, 1,
-0.8171934, -0.4937084, -3.332506, 0.8470588, 1, 0, 1,
-0.8130158, -2.236745, -3.544661, 0.8431373, 1, 0, 1,
-0.8041732, 0.7902983, -1.080311, 0.8352941, 1, 0, 1,
-0.8020331, 1.990462, -1.459733, 0.8313726, 1, 0, 1,
-0.7973143, 0.6926622, -2.857418, 0.8235294, 1, 0, 1,
-0.7969514, 0.1220443, -1.762925, 0.8196079, 1, 0, 1,
-0.7954726, -1.588265, -2.466668, 0.8117647, 1, 0, 1,
-0.791829, -0.01335019, -2.689842, 0.8078431, 1, 0, 1,
-0.7902678, -0.8645618, -2.449137, 0.8, 1, 0, 1,
-0.7894939, 0.9030176, 1.406835, 0.7921569, 1, 0, 1,
-0.7892371, -0.7381284, -3.024363, 0.7882353, 1, 0, 1,
-0.7774363, 0.7651756, -0.6064366, 0.7803922, 1, 0, 1,
-0.7754435, 0.5320423, -2.157498, 0.7764706, 1, 0, 1,
-0.7721248, 0.7218791, -1.041228, 0.7686275, 1, 0, 1,
-0.7697624, 0.8871238, -0.03446771, 0.7647059, 1, 0, 1,
-0.7697364, -0.9476193, -2.692412, 0.7568628, 1, 0, 1,
-0.768266, -0.8565199, -1.065007, 0.7529412, 1, 0, 1,
-0.7653366, 0.5354097, 0.4465384, 0.7450981, 1, 0, 1,
-0.763965, -1.19169, -1.350274, 0.7411765, 1, 0, 1,
-0.7569482, -0.1716342, -1.519653, 0.7333333, 1, 0, 1,
-0.7564859, -0.9930302, -1.183859, 0.7294118, 1, 0, 1,
-0.7512631, 0.4759663, -0.3664514, 0.7215686, 1, 0, 1,
-0.7498257, 3.183725, 1.306919, 0.7176471, 1, 0, 1,
-0.7457052, 0.1985024, 1.34162, 0.7098039, 1, 0, 1,
-0.7442251, -1.532316, -1.00078, 0.7058824, 1, 0, 1,
-0.7296692, -2.556374, -3.492996, 0.6980392, 1, 0, 1,
-0.7292815, 0.1095934, -2.023642, 0.6901961, 1, 0, 1,
-0.7258583, 0.08535925, -0.4145867, 0.6862745, 1, 0, 1,
-0.725367, 1.950063, -1.246057, 0.6784314, 1, 0, 1,
-0.7239336, -1.081011, -2.468356, 0.6745098, 1, 0, 1,
-0.7203182, 0.9601902, -2.720749, 0.6666667, 1, 0, 1,
-0.7129318, 1.144638, 0.1553822, 0.6627451, 1, 0, 1,
-0.7111107, -0.8216442, -4.241646, 0.654902, 1, 0, 1,
-0.7075121, 0.4626176, 1.283709, 0.6509804, 1, 0, 1,
-0.7003748, 1.178321, -2.315671, 0.6431373, 1, 0, 1,
-0.698571, -3.213962, -4.854774, 0.6392157, 1, 0, 1,
-0.6977515, -0.2930428, -2.61484, 0.6313726, 1, 0, 1,
-0.697018, 0.9697645, 0.7333582, 0.627451, 1, 0, 1,
-0.6954333, -0.3468879, -0.8915222, 0.6196079, 1, 0, 1,
-0.6899528, 1.147373, -0.08190225, 0.6156863, 1, 0, 1,
-0.6874675, 1.053476, -0.4768283, 0.6078432, 1, 0, 1,
-0.6863343, 2.344444, 1.48416, 0.6039216, 1, 0, 1,
-0.681284, -1.043466, -2.322331, 0.5960785, 1, 0, 1,
-0.6788476, -0.3825234, -2.08033, 0.5882353, 1, 0, 1,
-0.6774715, -0.5263673, -3.145512, 0.5843138, 1, 0, 1,
-0.6751063, -0.7412326, -2.026369, 0.5764706, 1, 0, 1,
-0.6651341, -0.2522149, -2.02621, 0.572549, 1, 0, 1,
-0.6621055, -0.6599594, -1.218062, 0.5647059, 1, 0, 1,
-0.6531774, 0.532572, -1.794727, 0.5607843, 1, 0, 1,
-0.6513186, 0.7588725, -1.593701, 0.5529412, 1, 0, 1,
-0.6509236, -0.00613441, -1.814338, 0.5490196, 1, 0, 1,
-0.6504887, -0.5421305, -2.252971, 0.5411765, 1, 0, 1,
-0.6483036, 0.6785326, -0.317468, 0.5372549, 1, 0, 1,
-0.6437765, 0.805758, -1.071341, 0.5294118, 1, 0, 1,
-0.6408556, -0.8781649, -2.856824, 0.5254902, 1, 0, 1,
-0.6398005, 1.213295, 0.2605038, 0.5176471, 1, 0, 1,
-0.63631, 0.3157406, -1.167603, 0.5137255, 1, 0, 1,
-0.6350452, 0.1805706, -2.046594, 0.5058824, 1, 0, 1,
-0.6317762, 1.739058, -0.8460522, 0.5019608, 1, 0, 1,
-0.6315119, -0.104312, -2.9529, 0.4941176, 1, 0, 1,
-0.6270469, -1.774451, -2.667884, 0.4862745, 1, 0, 1,
-0.6155751, 0.4445028, -1.648897, 0.4823529, 1, 0, 1,
-0.6135537, 0.0379184, -1.333789, 0.4745098, 1, 0, 1,
-0.6123307, 1.124704, -0.4640531, 0.4705882, 1, 0, 1,
-0.609244, 0.9303387, -2.717356, 0.4627451, 1, 0, 1,
-0.6071202, -0.1961204, -2.490197, 0.4588235, 1, 0, 1,
-0.6010657, -0.3701027, -1.262913, 0.4509804, 1, 0, 1,
-0.6008005, 1.1429, 0.8100763, 0.4470588, 1, 0, 1,
-0.5905007, -0.05759385, -0.8810156, 0.4392157, 1, 0, 1,
-0.5893291, -0.1821038, -1.794337, 0.4352941, 1, 0, 1,
-0.588811, -0.4730856, -0.7193837, 0.427451, 1, 0, 1,
-0.5838156, -0.964581, -3.646053, 0.4235294, 1, 0, 1,
-0.5807337, -0.8283725, -2.327168, 0.4156863, 1, 0, 1,
-0.579084, 0.3303652, -2.74909, 0.4117647, 1, 0, 1,
-0.5734132, 0.4763831, -1.853601, 0.4039216, 1, 0, 1,
-0.5695425, -0.4878414, -2.06436, 0.3960784, 1, 0, 1,
-0.5686445, -0.3540106, -2.196466, 0.3921569, 1, 0, 1,
-0.5626625, -0.3108883, -4.070385, 0.3843137, 1, 0, 1,
-0.5625414, 0.5321793, -0.536856, 0.3803922, 1, 0, 1,
-0.5603598, -0.8988449, -1.781476, 0.372549, 1, 0, 1,
-0.5588579, 0.06866024, -0.3058724, 0.3686275, 1, 0, 1,
-0.5560876, -0.2107166, -3.337014, 0.3607843, 1, 0, 1,
-0.5505764, -1.045228, -2.826324, 0.3568628, 1, 0, 1,
-0.5486493, -0.9768807, -3.834487, 0.3490196, 1, 0, 1,
-0.5482574, -2.570378, -3.519466, 0.345098, 1, 0, 1,
-0.5430259, -0.8732318, -2.748404, 0.3372549, 1, 0, 1,
-0.536283, 0.5909086, -1.84611, 0.3333333, 1, 0, 1,
-0.5360672, 1.007842, -0.4903706, 0.3254902, 1, 0, 1,
-0.5345333, -0.4327316, -0.6410558, 0.3215686, 1, 0, 1,
-0.5343587, -0.3077728, -1.699784, 0.3137255, 1, 0, 1,
-0.5308882, -0.7117856, -2.018035, 0.3098039, 1, 0, 1,
-0.5297682, -0.5003198, -2.399001, 0.3019608, 1, 0, 1,
-0.5273025, -0.4965479, -4.877848, 0.2941177, 1, 0, 1,
-0.5271001, 0.5982047, 0.6351539, 0.2901961, 1, 0, 1,
-0.5250991, 0.7655681, 0.5970303, 0.282353, 1, 0, 1,
-0.5232279, 0.3404342, -0.839304, 0.2784314, 1, 0, 1,
-0.5218858, 1.650829, 0.1874779, 0.2705882, 1, 0, 1,
-0.5200995, -0.7466829, -1.893303, 0.2666667, 1, 0, 1,
-0.5154017, -0.6758394, -0.935846, 0.2588235, 1, 0, 1,
-0.5136836, 0.1904675, -1.427144, 0.254902, 1, 0, 1,
-0.51097, 0.8008226, -0.6669445, 0.2470588, 1, 0, 1,
-0.5094953, 0.6441052, 0.264083, 0.2431373, 1, 0, 1,
-0.5079634, -0.9390044, -0.9021112, 0.2352941, 1, 0, 1,
-0.5055737, 1.480294, -0.2194976, 0.2313726, 1, 0, 1,
-0.5038934, 1.272372, -0.7395734, 0.2235294, 1, 0, 1,
-0.5035574, -0.7119747, -1.628767, 0.2196078, 1, 0, 1,
-0.4995257, 0.01848254, -1.02599, 0.2117647, 1, 0, 1,
-0.4969203, 1.434255, -2.464987, 0.2078431, 1, 0, 1,
-0.4862419, 0.301369, -0.542365, 0.2, 1, 0, 1,
-0.4797681, -0.3012545, -3.332379, 0.1921569, 1, 0, 1,
-0.4794701, -2.370145, -2.828055, 0.1882353, 1, 0, 1,
-0.4790255, -0.142092, -0.3635747, 0.1803922, 1, 0, 1,
-0.4769592, -0.3468949, -2.353899, 0.1764706, 1, 0, 1,
-0.4678874, 1.96105, -1.107934, 0.1686275, 1, 0, 1,
-0.4658797, 1.412249, 0.5410323, 0.1647059, 1, 0, 1,
-0.4656343, 2.062196, -0.1407157, 0.1568628, 1, 0, 1,
-0.4647168, -0.4673784, -1.773853, 0.1529412, 1, 0, 1,
-0.4607679, -0.2311856, -2.229854, 0.145098, 1, 0, 1,
-0.4580971, -0.1321863, -2.960126, 0.1411765, 1, 0, 1,
-0.4549667, -0.4319057, -1.473138, 0.1333333, 1, 0, 1,
-0.4527379, -0.2239291, -1.905487, 0.1294118, 1, 0, 1,
-0.451699, 0.2791775, 1.863223, 0.1215686, 1, 0, 1,
-0.4487717, 0.6305623, -0.7626719, 0.1176471, 1, 0, 1,
-0.4389703, -1.038641, -3.481645, 0.1098039, 1, 0, 1,
-0.4383866, -0.7711127, -2.496672, 0.1058824, 1, 0, 1,
-0.4357645, -1.896189, -1.117869, 0.09803922, 1, 0, 1,
-0.4346961, 0.2279118, -1.129989, 0.09019608, 1, 0, 1,
-0.4305427, 0.3301722, -0.6544463, 0.08627451, 1, 0, 1,
-0.429519, 0.2856505, -0.479454, 0.07843138, 1, 0, 1,
-0.4291326, -0.187734, -2.564651, 0.07450981, 1, 0, 1,
-0.4235928, 1.323441, -0.3958202, 0.06666667, 1, 0, 1,
-0.4217784, 2.103801, -0.5059091, 0.0627451, 1, 0, 1,
-0.4210924, -0.01879532, -2.835395, 0.05490196, 1, 0, 1,
-0.4205074, -0.05377232, -2.156441, 0.05098039, 1, 0, 1,
-0.4175211, 1.327008, 0.2108782, 0.04313726, 1, 0, 1,
-0.4147606, 0.4514562, -3.289867, 0.03921569, 1, 0, 1,
-0.4100546, -0.8960424, -4.034693, 0.03137255, 1, 0, 1,
-0.4097634, 0.9742182, 0.1194397, 0.02745098, 1, 0, 1,
-0.408386, -1.058893, -3.276524, 0.01960784, 1, 0, 1,
-0.4005249, -1.084365, -3.468268, 0.01568628, 1, 0, 1,
-0.3951394, -0.3116421, -3.024218, 0.007843138, 1, 0, 1,
-0.3920126, 1.557427, -1.236759, 0.003921569, 1, 0, 1,
-0.3919519, -0.1209772, -1.39781, 0, 1, 0.003921569, 1,
-0.38969, -1.075025, -2.280981, 0, 1, 0.01176471, 1,
-0.3861116, 1.421654, 0.04891059, 0, 1, 0.01568628, 1,
-0.3820736, 1.587784, -0.1531445, 0, 1, 0.02352941, 1,
-0.381237, 0.4741183, -1.44221, 0, 1, 0.02745098, 1,
-0.3804853, -0.9314818, -2.702954, 0, 1, 0.03529412, 1,
-0.3756553, -1.530573, -3.510152, 0, 1, 0.03921569, 1,
-0.3732485, -1.035597, -4.412055, 0, 1, 0.04705882, 1,
-0.3719803, 1.545281, -0.8807486, 0, 1, 0.05098039, 1,
-0.3693317, -0.1525754, -2.342486, 0, 1, 0.05882353, 1,
-0.3689915, -0.7543582, -1.709435, 0, 1, 0.0627451, 1,
-0.36552, 0.7952148, 0.3959009, 0, 1, 0.07058824, 1,
-0.3616764, -1.173189, -2.926738, 0, 1, 0.07450981, 1,
-0.3604939, -0.4051822, -3.143073, 0, 1, 0.08235294, 1,
-0.3564695, -0.550822, -2.065209, 0, 1, 0.08627451, 1,
-0.3559976, 0.8375562, 1.229048, 0, 1, 0.09411765, 1,
-0.3514715, 1.430617, -0.5022954, 0, 1, 0.1019608, 1,
-0.3511791, 0.01091462, -1.076977, 0, 1, 0.1058824, 1,
-0.3495352, -0.2995627, -2.477766, 0, 1, 0.1137255, 1,
-0.3476967, 0.1687336, 0.2144067, 0, 1, 0.1176471, 1,
-0.3467845, 0.05725438, -2.6521, 0, 1, 0.1254902, 1,
-0.344232, 0.3121301, -0.8657782, 0, 1, 0.1294118, 1,
-0.3431412, -0.5843281, -3.638611, 0, 1, 0.1372549, 1,
-0.3417677, -0.090872, -2.71714, 0, 1, 0.1411765, 1,
-0.3415917, -1.803884, -3.856023, 0, 1, 0.1490196, 1,
-0.3407668, 1.385698, 1.029135, 0, 1, 0.1529412, 1,
-0.3394713, -0.2439429, -0.6833934, 0, 1, 0.1607843, 1,
-0.3393387, 1.845437, -0.2862464, 0, 1, 0.1647059, 1,
-0.3393339, -1.239262, -3.864765, 0, 1, 0.172549, 1,
-0.3357237, -1.075728, -4.140291, 0, 1, 0.1764706, 1,
-0.3351456, 1.921083, 0.1864204, 0, 1, 0.1843137, 1,
-0.330041, 0.3598494, 0.2964138, 0, 1, 0.1882353, 1,
-0.3260134, -1.203961, -1.599188, 0, 1, 0.1960784, 1,
-0.3255932, 0.246412, 0.1833899, 0, 1, 0.2039216, 1,
-0.3240231, -1.330335, -1.54116, 0, 1, 0.2078431, 1,
-0.3220817, 2.174295, -0.3692275, 0, 1, 0.2156863, 1,
-0.3220569, 1.979627, -0.03573401, 0, 1, 0.2196078, 1,
-0.320761, -2.415634, -3.606224, 0, 1, 0.227451, 1,
-0.3205174, -0.2386849, -3.062184, 0, 1, 0.2313726, 1,
-0.3130248, 0.1245077, -1.940596, 0, 1, 0.2392157, 1,
-0.3075215, -0.2145048, -4.069323, 0, 1, 0.2431373, 1,
-0.2942746, -1.169038, -3.151707, 0, 1, 0.2509804, 1,
-0.293127, 0.6210405, 0.4081148, 0, 1, 0.254902, 1,
-0.2901624, 0.6346266, 0.5704697, 0, 1, 0.2627451, 1,
-0.2892874, -0.8376095, -1.552146, 0, 1, 0.2666667, 1,
-0.2807057, -1.449314, -0.8670974, 0, 1, 0.2745098, 1,
-0.2785995, -0.5365296, -2.195366, 0, 1, 0.2784314, 1,
-0.2772214, 0.5601721, -0.6830367, 0, 1, 0.2862745, 1,
-0.2625161, 0.8392147, -2.707642, 0, 1, 0.2901961, 1,
-0.2576416, 0.8801921, 1.440137, 0, 1, 0.2980392, 1,
-0.2568103, -0.003203511, -1.19132, 0, 1, 0.3058824, 1,
-0.2565016, -0.1358373, -2.236604, 0, 1, 0.3098039, 1,
-0.2538828, -1.10163, -2.721731, 0, 1, 0.3176471, 1,
-0.2531074, 2.056967, -0.8471977, 0, 1, 0.3215686, 1,
-0.252305, -1.160505, -2.787856, 0, 1, 0.3294118, 1,
-0.2470769, 0.8915266, -0.5000203, 0, 1, 0.3333333, 1,
-0.2457294, 0.4969667, 0.3935535, 0, 1, 0.3411765, 1,
-0.2349254, -0.2968751, -3.264053, 0, 1, 0.345098, 1,
-0.2343736, -1.917052, -3.992819, 0, 1, 0.3529412, 1,
-0.2338736, -0.2861087, -2.786889, 0, 1, 0.3568628, 1,
-0.2324739, 0.04208235, 0.4712207, 0, 1, 0.3647059, 1,
-0.2271718, -0.05308027, -0.9029513, 0, 1, 0.3686275, 1,
-0.2259558, 1.078663, 0.4615729, 0, 1, 0.3764706, 1,
-0.2231201, -0.00787726, -1.401029, 0, 1, 0.3803922, 1,
-0.2229011, -1.650973, -2.543122, 0, 1, 0.3882353, 1,
-0.222172, 0.4260928, 0.07562951, 0, 1, 0.3921569, 1,
-0.2190775, 0.474463, -0.8523922, 0, 1, 0.4, 1,
-0.2172486, -1.112014, -3.099089, 0, 1, 0.4078431, 1,
-0.214637, -0.8737919, -2.990157, 0, 1, 0.4117647, 1,
-0.2078918, 0.2693112, 0.6275957, 0, 1, 0.4196078, 1,
-0.2075987, 2.380228, -0.7301082, 0, 1, 0.4235294, 1,
-0.2052531, -0.3649446, -2.342834, 0, 1, 0.4313726, 1,
-0.2027498, -1.086147, -1.732577, 0, 1, 0.4352941, 1,
-0.2022453, -0.1548074, -2.920351, 0, 1, 0.4431373, 1,
-0.2012186, -0.01589871, -1.430232, 0, 1, 0.4470588, 1,
-0.1974589, -0.8640755, -3.74849, 0, 1, 0.454902, 1,
-0.1956086, 0.08415995, -0.3517278, 0, 1, 0.4588235, 1,
-0.1944566, 0.3961638, 0.4152633, 0, 1, 0.4666667, 1,
-0.193632, -0.517199, -2.115883, 0, 1, 0.4705882, 1,
-0.1935001, 0.6597267, -0.003948858, 0, 1, 0.4784314, 1,
-0.1901048, -1.014056, -1.901319, 0, 1, 0.4823529, 1,
-0.1896499, -0.2990493, -2.813232, 0, 1, 0.4901961, 1,
-0.187426, 0.851311, -0.01408783, 0, 1, 0.4941176, 1,
-0.1834994, -1.281883, -4.046859, 0, 1, 0.5019608, 1,
-0.1823269, -0.1408136, -1.573523, 0, 1, 0.509804, 1,
-0.1815303, 1.084993, -0.08289552, 0, 1, 0.5137255, 1,
-0.1814167, -0.6873469, -3.067047, 0, 1, 0.5215687, 1,
-0.1781784, 0.0313712, -1.773855, 0, 1, 0.5254902, 1,
-0.1767019, -0.0974137, -1.145372, 0, 1, 0.5333334, 1,
-0.175412, 1.421007, -1.094946, 0, 1, 0.5372549, 1,
-0.1747462, -0.8053777, -2.74954, 0, 1, 0.5450981, 1,
-0.1737321, -0.4787207, -2.333314, 0, 1, 0.5490196, 1,
-0.1718641, -0.2199406, -2.334003, 0, 1, 0.5568628, 1,
-0.1686372, -0.8922178, -2.76342, 0, 1, 0.5607843, 1,
-0.1649887, -0.09117824, -2.991203, 0, 1, 0.5686275, 1,
-0.1598013, -1.313206, -3.533769, 0, 1, 0.572549, 1,
-0.156366, -0.7169517, -2.45366, 0, 1, 0.5803922, 1,
-0.1548764, 0.2270723, -0.0299098, 0, 1, 0.5843138, 1,
-0.1516764, -0.8316597, -3.286954, 0, 1, 0.5921569, 1,
-0.1493945, -0.1908701, -1.613027, 0, 1, 0.5960785, 1,
-0.1492852, 0.2924089, -1.186418, 0, 1, 0.6039216, 1,
-0.1490708, -1.344904, -3.320396, 0, 1, 0.6117647, 1,
-0.1483339, 1.298409, 0.4737526, 0, 1, 0.6156863, 1,
-0.1448603, 0.7866952, -0.7275556, 0, 1, 0.6235294, 1,
-0.1430847, -0.3513074, -3.711599, 0, 1, 0.627451, 1,
-0.1371264, 0.04248413, -1.634439, 0, 1, 0.6352941, 1,
-0.1361799, -0.8496779, -1.870313, 0, 1, 0.6392157, 1,
-0.1322522, 0.5397416, -0.5673245, 0, 1, 0.6470588, 1,
-0.1271841, -0.9324699, -2.439131, 0, 1, 0.6509804, 1,
-0.1192972, 0.3929007, 1.089262, 0, 1, 0.6588235, 1,
-0.1192134, 0.2319021, -0.2917423, 0, 1, 0.6627451, 1,
-0.1187639, -0.5015414, -1.471786, 0, 1, 0.6705883, 1,
-0.1181311, 0.5347851, -0.04474616, 0, 1, 0.6745098, 1,
-0.1106934, 1.370685, -2.639629, 0, 1, 0.682353, 1,
-0.1091951, -0.1199095, -2.594825, 0, 1, 0.6862745, 1,
-0.1086107, 0.4407478, -1.375158, 0, 1, 0.6941177, 1,
-0.1023112, -0.7429153, -3.061666, 0, 1, 0.7019608, 1,
-0.09847027, 0.936048, 1.456603, 0, 1, 0.7058824, 1,
-0.09679655, 2.108102, -0.3701432, 0, 1, 0.7137255, 1,
-0.0943269, -2.63518, -3.192142, 0, 1, 0.7176471, 1,
-0.0885246, 0.05012394, -0.9587685, 0, 1, 0.7254902, 1,
-0.08841978, 0.3496683, -1.333786, 0, 1, 0.7294118, 1,
-0.08459323, -0.1423901, -2.266449, 0, 1, 0.7372549, 1,
-0.08407737, 1.391851, 0.2564675, 0, 1, 0.7411765, 1,
-0.08389345, 0.4650441, -0.03984779, 0, 1, 0.7490196, 1,
-0.08317795, -1.444281, -1.281704, 0, 1, 0.7529412, 1,
-0.08257172, -1.080843, -3.602152, 0, 1, 0.7607843, 1,
-0.07928644, -0.260729, -4.710963, 0, 1, 0.7647059, 1,
-0.06897704, 0.3910249, -0.6946239, 0, 1, 0.772549, 1,
-0.0687338, 1.325937, -0.2953981, 0, 1, 0.7764706, 1,
-0.0671896, -0.6182957, -5.089667, 0, 1, 0.7843137, 1,
-0.06717806, 0.6535822, -0.6378977, 0, 1, 0.7882353, 1,
-0.06646471, -0.2588508, -4.207278, 0, 1, 0.7960784, 1,
-0.06471512, 0.05816376, -0.2086432, 0, 1, 0.8039216, 1,
-0.06423671, -0.6237351, -2.612177, 0, 1, 0.8078431, 1,
-0.06210666, 1.161637, -1.507285, 0, 1, 0.8156863, 1,
-0.06169811, -0.3324541, -4.000535, 0, 1, 0.8196079, 1,
-0.06099193, -0.536305, -1.562633, 0, 1, 0.827451, 1,
-0.05676216, -0.8027413, -2.396319, 0, 1, 0.8313726, 1,
-0.05292106, 0.0157021, -1.185745, 0, 1, 0.8392157, 1,
-0.05176204, 0.07660779, 0.67633, 0, 1, 0.8431373, 1,
-0.0510348, -1.624964, -1.92718, 0, 1, 0.8509804, 1,
-0.05017377, 0.6029521, 0.7442917, 0, 1, 0.854902, 1,
-0.04999366, 0.4402696, 2.012082, 0, 1, 0.8627451, 1,
-0.04718237, -0.2232576, -1.521843, 0, 1, 0.8666667, 1,
-0.0426756, -1.281845, -3.875361, 0, 1, 0.8745098, 1,
-0.02895333, 0.2126429, -1.590826, 0, 1, 0.8784314, 1,
-0.02882962, -0.5153396, -3.255033, 0, 1, 0.8862745, 1,
-0.0246366, 0.500076, -0.842336, 0, 1, 0.8901961, 1,
-0.02122728, -0.9482821, -0.7976038, 0, 1, 0.8980392, 1,
-0.02122295, 0.1486212, 1.783618, 0, 1, 0.9058824, 1,
-0.02016109, 0.1316355, 0.4957052, 0, 1, 0.9098039, 1,
-0.01980168, 0.1372311, 0.5999693, 0, 1, 0.9176471, 1,
-0.01957288, 0.7201359, -0.2559177, 0, 1, 0.9215686, 1,
-0.01919817, 2.445718, -0.08007193, 0, 1, 0.9294118, 1,
-0.01655641, 0.145311, -1.762735, 0, 1, 0.9333333, 1,
-0.0155824, 0.1331427, 0.274466, 0, 1, 0.9411765, 1,
-0.01103892, 0.3514006, -0.2783128, 0, 1, 0.945098, 1,
-0.01091445, -1.466348, -3.738478, 0, 1, 0.9529412, 1,
-5.854417e-06, 0.1702657, -0.2027666, 0, 1, 0.9568627, 1,
0.001769228, 0.3578687, -1.733142, 0, 1, 0.9647059, 1,
0.002242045, -0.07052161, 0.7750571, 0, 1, 0.9686275, 1,
0.003601882, -0.7873713, 3.117917, 0, 1, 0.9764706, 1,
0.003939406, -0.05448419, 5.636976, 0, 1, 0.9803922, 1,
0.004437672, -0.1059952, 4.023408, 0, 1, 0.9882353, 1,
0.005811865, -1.149402, 4.470015, 0, 1, 0.9921569, 1,
0.009548005, -1.013223, 2.527376, 0, 1, 1, 1,
0.009825754, -0.4220861, 4.683693, 0, 0.9921569, 1, 1,
0.0105858, -0.3467871, 1.901505, 0, 0.9882353, 1, 1,
0.01258413, 1.868901, -0.1892383, 0, 0.9803922, 1, 1,
0.01589984, 0.2216473, -0.9717072, 0, 0.9764706, 1, 1,
0.01748177, -0.9200315, 3.446599, 0, 0.9686275, 1, 1,
0.02251872, -0.3974267, 3.371615, 0, 0.9647059, 1, 1,
0.02378911, -0.3048509, 3.292916, 0, 0.9568627, 1, 1,
0.02540714, 0.3710836, 0.897348, 0, 0.9529412, 1, 1,
0.0317473, 0.1307262, 0.5310059, 0, 0.945098, 1, 1,
0.03592843, 0.352075, 1.313257, 0, 0.9411765, 1, 1,
0.03759918, -1.198337, 3.438217, 0, 0.9333333, 1, 1,
0.04101796, -0.6085047, 1.837596, 0, 0.9294118, 1, 1,
0.04548063, 2.139709, 0.2985173, 0, 0.9215686, 1, 1,
0.04947765, -0.9632801, 0.9097968, 0, 0.9176471, 1, 1,
0.05238115, -0.8807832, 3.92002, 0, 0.9098039, 1, 1,
0.05325739, -0.6283689, 3.176157, 0, 0.9058824, 1, 1,
0.05414309, -0.4955834, 5.044259, 0, 0.8980392, 1, 1,
0.05833633, 0.1824218, -0.7993991, 0, 0.8901961, 1, 1,
0.0650901, 0.04682879, 0.5655566, 0, 0.8862745, 1, 1,
0.06547951, -1.20463, 3.662405, 0, 0.8784314, 1, 1,
0.0655748, 0.8655214, -0.5767617, 0, 0.8745098, 1, 1,
0.0671012, -0.8340014, 3.974122, 0, 0.8666667, 1, 1,
0.072979, 0.0458008, 1.473863, 0, 0.8627451, 1, 1,
0.07363626, -0.8706461, 4.234309, 0, 0.854902, 1, 1,
0.07468654, -0.1728155, 2.688958, 0, 0.8509804, 1, 1,
0.07736073, -1.370805, 3.100622, 0, 0.8431373, 1, 1,
0.07789472, 0.2825544, -0.1609215, 0, 0.8392157, 1, 1,
0.08084559, 0.4051249, 0.1145507, 0, 0.8313726, 1, 1,
0.09174552, 0.2587417, -2.23074, 0, 0.827451, 1, 1,
0.09277781, -0.08819521, 3.532981, 0, 0.8196079, 1, 1,
0.09347129, 0.4651676, -0.09093706, 0, 0.8156863, 1, 1,
0.09441993, -1.292208, 2.576753, 0, 0.8078431, 1, 1,
0.09657999, -0.5355605, 4.118204, 0, 0.8039216, 1, 1,
0.0969203, 1.050926, -0.05665213, 0, 0.7960784, 1, 1,
0.09736153, 0.01649441, 1.452289, 0, 0.7882353, 1, 1,
0.09782753, -0.9238533, 1.913547, 0, 0.7843137, 1, 1,
0.09918708, 1.314752, 0.2380806, 0, 0.7764706, 1, 1,
0.0998343, 1.365647, 2.229796, 0, 0.772549, 1, 1,
0.1029587, -0.1169817, 2.149206, 0, 0.7647059, 1, 1,
0.1032589, 0.8124611, -0.5514188, 0, 0.7607843, 1, 1,
0.1110464, 0.6691622, 1.825628, 0, 0.7529412, 1, 1,
0.1111477, 0.7724484, -0.8821366, 0, 0.7490196, 1, 1,
0.1120321, -0.1889753, 3.322681, 0, 0.7411765, 1, 1,
0.1142971, -0.7223176, 3.353805, 0, 0.7372549, 1, 1,
0.1186188, 0.9151039, -0.5994925, 0, 0.7294118, 1, 1,
0.1202625, -0.3744887, 3.628778, 0, 0.7254902, 1, 1,
0.1272933, 0.5606421, 0.1455118, 0, 0.7176471, 1, 1,
0.1307562, 0.8847677, 1.926102, 0, 0.7137255, 1, 1,
0.1342127, 0.4738576, 0.3723246, 0, 0.7058824, 1, 1,
0.1347715, -0.9707009, 3.541255, 0, 0.6980392, 1, 1,
0.1372245, 0.2135226, -0.3866754, 0, 0.6941177, 1, 1,
0.1500386, 0.2254162, 1.043457, 0, 0.6862745, 1, 1,
0.1514939, 0.9933721, -0.4828084, 0, 0.682353, 1, 1,
0.1559717, -0.4740696, 1.723655, 0, 0.6745098, 1, 1,
0.157073, -0.6593387, 2.013937, 0, 0.6705883, 1, 1,
0.1578841, -0.4869493, 2.728457, 0, 0.6627451, 1, 1,
0.1584307, 0.4316669, -1.228202, 0, 0.6588235, 1, 1,
0.1693298, 1.670795, 0.136281, 0, 0.6509804, 1, 1,
0.1694453, 1.676404, -0.9923171, 0, 0.6470588, 1, 1,
0.1709897, -1.228936, 3.846155, 0, 0.6392157, 1, 1,
0.1760651, 0.6010936, 1.490717, 0, 0.6352941, 1, 1,
0.1760738, 0.210162, 1.706636, 0, 0.627451, 1, 1,
0.1768654, -0.6505846, 3.331362, 0, 0.6235294, 1, 1,
0.1773959, -0.4829305, 2.500427, 0, 0.6156863, 1, 1,
0.1778312, 1.865313, 0.9194937, 0, 0.6117647, 1, 1,
0.1811001, 0.8162586, 0.8261636, 0, 0.6039216, 1, 1,
0.1862264, -0.1751391, 3.324018, 0, 0.5960785, 1, 1,
0.1871456, -1.235053, 1.434909, 0, 0.5921569, 1, 1,
0.1880533, 0.6852953, -1.108904, 0, 0.5843138, 1, 1,
0.188625, 0.9957942, 0.38187, 0, 0.5803922, 1, 1,
0.1910472, -0.1237094, 1.428977, 0, 0.572549, 1, 1,
0.1931626, -0.9102147, 5.545125, 0, 0.5686275, 1, 1,
0.2036238, -0.5368002, 2.51643, 0, 0.5607843, 1, 1,
0.2043833, 0.7581264, 2.240573, 0, 0.5568628, 1, 1,
0.20455, -0.5891216, 3.130321, 0, 0.5490196, 1, 1,
0.206185, -0.1441144, 2.418721, 0, 0.5450981, 1, 1,
0.207137, 0.9858786, -0.439054, 0, 0.5372549, 1, 1,
0.2073427, 0.08498688, 1.715519, 0, 0.5333334, 1, 1,
0.210734, 0.4512371, -0.8876063, 0, 0.5254902, 1, 1,
0.2116512, 0.05073659, 1.41739, 0, 0.5215687, 1, 1,
0.2128464, 0.07870416, 2.469517, 0, 0.5137255, 1, 1,
0.2182017, 2.779209, -0.487956, 0, 0.509804, 1, 1,
0.2198362, 0.6241742, 0.6696793, 0, 0.5019608, 1, 1,
0.2205007, 1.116691, 0.9841204, 0, 0.4941176, 1, 1,
0.2298781, 0.006444784, 2.305004, 0, 0.4901961, 1, 1,
0.2424991, 0.8936116, 1.666775, 0, 0.4823529, 1, 1,
0.2493435, -0.7350112, 3.678115, 0, 0.4784314, 1, 1,
0.2518073, -1.963959, 4.511501, 0, 0.4705882, 1, 1,
0.2532806, 0.2328378, 0.2555763, 0, 0.4666667, 1, 1,
0.2546318, -1.288169, 3.15717, 0, 0.4588235, 1, 1,
0.2562729, 0.4043233, -1.231843, 0, 0.454902, 1, 1,
0.2577769, -1.315368, 1.660635, 0, 0.4470588, 1, 1,
0.2598639, -1.693455, 2.91924, 0, 0.4431373, 1, 1,
0.262293, -0.914515, 2.158976, 0, 0.4352941, 1, 1,
0.2668856, -0.2007149, 1.53935, 0, 0.4313726, 1, 1,
0.2675132, -0.2804985, 0.8484259, 0, 0.4235294, 1, 1,
0.2705195, -1.039599, 3.874166, 0, 0.4196078, 1, 1,
0.2713223, 0.5463359, 1.242585, 0, 0.4117647, 1, 1,
0.273772, -0.01996876, 2.878575, 0, 0.4078431, 1, 1,
0.2750459, -0.6881402, 3.696964, 0, 0.4, 1, 1,
0.2761143, 2.029581, -1.421506, 0, 0.3921569, 1, 1,
0.2785634, 0.003183869, 0.2553267, 0, 0.3882353, 1, 1,
0.2788813, 0.6303923, 0.9911924, 0, 0.3803922, 1, 1,
0.2855822, -1.714301, 4.168859, 0, 0.3764706, 1, 1,
0.2991866, -0.1155132, 2.70478, 0, 0.3686275, 1, 1,
0.299455, 0.05983176, 2.94082, 0, 0.3647059, 1, 1,
0.300791, -1.084693, 1.593709, 0, 0.3568628, 1, 1,
0.3023566, -0.09371355, 2.37582, 0, 0.3529412, 1, 1,
0.3034793, -1.254822, 2.956139, 0, 0.345098, 1, 1,
0.3039213, -1.625303, 4.280774, 0, 0.3411765, 1, 1,
0.3066629, 1.094508, 0.8500067, 0, 0.3333333, 1, 1,
0.3066865, -0.4389916, 1.215341, 0, 0.3294118, 1, 1,
0.3081131, 1.876076, 1.067304, 0, 0.3215686, 1, 1,
0.3117307, 1.462086, -0.7025142, 0, 0.3176471, 1, 1,
0.31269, -0.2348497, 1.335174, 0, 0.3098039, 1, 1,
0.3135271, 0.3484974, 1.94063, 0, 0.3058824, 1, 1,
0.3135791, -1.11901, 2.417737, 0, 0.2980392, 1, 1,
0.3140118, -0.3038556, 1.734201, 0, 0.2901961, 1, 1,
0.3149012, -0.6643959, 2.858633, 0, 0.2862745, 1, 1,
0.3164301, -1.371548, 3.36421, 0, 0.2784314, 1, 1,
0.3184676, -0.5398202, 2.810658, 0, 0.2745098, 1, 1,
0.3188998, -0.0757769, 1.306594, 0, 0.2666667, 1, 1,
0.3246428, -0.729794, 3.994495, 0, 0.2627451, 1, 1,
0.3272268, 0.6314949, -0.4548494, 0, 0.254902, 1, 1,
0.3312454, -1.491203, 1.822811, 0, 0.2509804, 1, 1,
0.333663, 0.1028515, 0.5828751, 0, 0.2431373, 1, 1,
0.3342516, -3.093724, 3.582815, 0, 0.2392157, 1, 1,
0.334432, -1.360693, 1.852804, 0, 0.2313726, 1, 1,
0.3397406, -0.167689, 2.172292, 0, 0.227451, 1, 1,
0.3411162, 0.02004959, -0.09820874, 0, 0.2196078, 1, 1,
0.3455197, 0.5364963, 1.703922, 0, 0.2156863, 1, 1,
0.3546781, 1.292868, 1.788445, 0, 0.2078431, 1, 1,
0.3552787, -1.29419, 1.952962, 0, 0.2039216, 1, 1,
0.3584765, 1.65428, -1.55187, 0, 0.1960784, 1, 1,
0.3586142, -0.6483762, 2.20698, 0, 0.1882353, 1, 1,
0.3590974, -0.5526885, 0.5149001, 0, 0.1843137, 1, 1,
0.3612269, -2.440082, 2.794466, 0, 0.1764706, 1, 1,
0.3619535, 0.6583523, -0.2532479, 0, 0.172549, 1, 1,
0.3619606, 1.147845, 0.2091392, 0, 0.1647059, 1, 1,
0.3619786, 0.2008445, 0.2901589, 0, 0.1607843, 1, 1,
0.3620559, -1.921806, 3.939387, 0, 0.1529412, 1, 1,
0.3625472, 2.195323, 1.00257, 0, 0.1490196, 1, 1,
0.3663299, 0.1935042, 2.248692, 0, 0.1411765, 1, 1,
0.3669876, -0.5074493, 1.868229, 0, 0.1372549, 1, 1,
0.3681968, -1.693044, 2.502878, 0, 0.1294118, 1, 1,
0.3724431, 0.3282722, 0.5267597, 0, 0.1254902, 1, 1,
0.3733667, 0.1518281, 0.9743125, 0, 0.1176471, 1, 1,
0.3742541, -0.7243814, 3.067873, 0, 0.1137255, 1, 1,
0.3763609, -1.561961, 2.739326, 0, 0.1058824, 1, 1,
0.3849741, -0.09275933, 2.344317, 0, 0.09803922, 1, 1,
0.3900713, 0.9997619, 0.6716762, 0, 0.09411765, 1, 1,
0.3918628, 1.530398, -0.6730629, 0, 0.08627451, 1, 1,
0.4038651, -1.238407, 0.4666111, 0, 0.08235294, 1, 1,
0.407843, -0.4323258, 3.702251, 0, 0.07450981, 1, 1,
0.4165179, 2.533703, 1.950454, 0, 0.07058824, 1, 1,
0.4173884, 1.814638, -0.3815246, 0, 0.0627451, 1, 1,
0.4175964, 1.805967, -1.171619, 0, 0.05882353, 1, 1,
0.4179661, 0.933862, -0.8366873, 0, 0.05098039, 1, 1,
0.4205296, 0.5474965, 2.27841, 0, 0.04705882, 1, 1,
0.4215207, -1.245116, 2.58316, 0, 0.03921569, 1, 1,
0.4217117, -0.6520192, 1.846277, 0, 0.03529412, 1, 1,
0.4270756, 0.7428119, 1.427865, 0, 0.02745098, 1, 1,
0.4272498, -0.4737825, 2.254358, 0, 0.02352941, 1, 1,
0.4305052, -0.07430448, 2.394709, 0, 0.01568628, 1, 1,
0.4328436, -0.2873749, 1.423259, 0, 0.01176471, 1, 1,
0.4364205, 1.580519, 0.88155, 0, 0.003921569, 1, 1,
0.4403827, -0.1977305, 1.996268, 0.003921569, 0, 1, 1,
0.441278, 0.7393696, 1.940216, 0.007843138, 0, 1, 1,
0.4427405, -0.8319827, 2.736187, 0.01568628, 0, 1, 1,
0.4461106, 0.5548233, 1.07633, 0.01960784, 0, 1, 1,
0.4467536, 0.4928138, 1.060494, 0.02745098, 0, 1, 1,
0.4485371, -0.8529593, 3.913298, 0.03137255, 0, 1, 1,
0.450602, 1.080901, -1.880384, 0.03921569, 0, 1, 1,
0.4512285, 0.3545198, -0.01661884, 0.04313726, 0, 1, 1,
0.4580988, -0.801863, 3.665215, 0.05098039, 0, 1, 1,
0.4593694, -0.08977526, 0.61375, 0.05490196, 0, 1, 1,
0.466129, 0.05261116, 1.555255, 0.0627451, 0, 1, 1,
0.46865, 0.1550403, 1.380251, 0.06666667, 0, 1, 1,
0.4711067, 1.425513, -0.6415044, 0.07450981, 0, 1, 1,
0.4718508, 0.5830045, 0.1877793, 0.07843138, 0, 1, 1,
0.4731885, 0.3029686, -0.4068123, 0.08627451, 0, 1, 1,
0.4733594, 1.031673, -0.04332775, 0.09019608, 0, 1, 1,
0.473552, 0.63437, 0.4563379, 0.09803922, 0, 1, 1,
0.4744115, -1.196495, 3.489224, 0.1058824, 0, 1, 1,
0.4811471, 0.1555837, 1.792975, 0.1098039, 0, 1, 1,
0.4811802, 0.1215491, 2.129128, 0.1176471, 0, 1, 1,
0.4831559, -1.217298, 1.006987, 0.1215686, 0, 1, 1,
0.4840196, -0.04576955, 2.825086, 0.1294118, 0, 1, 1,
0.489641, 0.4327705, 0.6842688, 0.1333333, 0, 1, 1,
0.4931419, 2.240607, 0.3248726, 0.1411765, 0, 1, 1,
0.4986466, -1.097191, 4.466275, 0.145098, 0, 1, 1,
0.4994811, 0.7823458, 0.04478982, 0.1529412, 0, 1, 1,
0.5023659, -0.6600221, 3.540619, 0.1568628, 0, 1, 1,
0.5076876, 0.2765609, 1.569658, 0.1647059, 0, 1, 1,
0.5200357, 0.1305719, 0.532963, 0.1686275, 0, 1, 1,
0.5204882, -1.130392, 1.348917, 0.1764706, 0, 1, 1,
0.5218427, 0.287981, 1.685317, 0.1803922, 0, 1, 1,
0.5353979, 0.290253, -0.4473954, 0.1882353, 0, 1, 1,
0.5355693, -0.2182331, 2.107807, 0.1921569, 0, 1, 1,
0.5372823, -0.6744351, 4.647472, 0.2, 0, 1, 1,
0.5375395, -0.8478678, 2.28074, 0.2078431, 0, 1, 1,
0.5399296, 0.1005148, 2.468335, 0.2117647, 0, 1, 1,
0.5439948, 1.548521, -0.7751975, 0.2196078, 0, 1, 1,
0.5440695, 1.045651, 1.504891, 0.2235294, 0, 1, 1,
0.5442858, -0.7033274, 1.483065, 0.2313726, 0, 1, 1,
0.5461138, 0.3020565, 0.4789487, 0.2352941, 0, 1, 1,
0.5478268, 0.1595603, 1.542946, 0.2431373, 0, 1, 1,
0.5485029, -0.2688302, 1.618582, 0.2470588, 0, 1, 1,
0.5507717, -0.3468937, 2.73444, 0.254902, 0, 1, 1,
0.5508853, -1.253502, 2.510125, 0.2588235, 0, 1, 1,
0.5582579, 0.9593561, -0.7669759, 0.2666667, 0, 1, 1,
0.5599388, -1.464402, 2.352417, 0.2705882, 0, 1, 1,
0.5747789, 0.2730075, 0.6716555, 0.2784314, 0, 1, 1,
0.5759321, -0.4394561, 1.888971, 0.282353, 0, 1, 1,
0.5802146, -0.376734, 2.466455, 0.2901961, 0, 1, 1,
0.5850551, -0.7244331, 2.350497, 0.2941177, 0, 1, 1,
0.585114, -0.6091878, 2.537923, 0.3019608, 0, 1, 1,
0.585385, 0.5824875, 0.9145332, 0.3098039, 0, 1, 1,
0.5879909, 1.575524, 0.252288, 0.3137255, 0, 1, 1,
0.5904133, 1.301908, 0.1601484, 0.3215686, 0, 1, 1,
0.5909066, 1.197409, 1.454217, 0.3254902, 0, 1, 1,
0.5922811, -1.260593, 2.789514, 0.3333333, 0, 1, 1,
0.6049836, 0.01917418, 1.965443, 0.3372549, 0, 1, 1,
0.6063944, 1.302554, 0.5733835, 0.345098, 0, 1, 1,
0.6133141, -0.6287864, 3.233927, 0.3490196, 0, 1, 1,
0.6150532, 0.9374111, -0.2930964, 0.3568628, 0, 1, 1,
0.6154256, -0.8822019, 1.681607, 0.3607843, 0, 1, 1,
0.6161162, -1.866829, 0.2559676, 0.3686275, 0, 1, 1,
0.6192196, -0.6436957, 2.21109, 0.372549, 0, 1, 1,
0.6221778, -1.273149, 3.445483, 0.3803922, 0, 1, 1,
0.6262507, 0.9688815, 1.349001, 0.3843137, 0, 1, 1,
0.6284344, 0.1828465, 0.9739936, 0.3921569, 0, 1, 1,
0.628477, 1.40664, -1.483859, 0.3960784, 0, 1, 1,
0.6338972, 0.6891478, 3.122889, 0.4039216, 0, 1, 1,
0.6353929, 0.9182639, 0.6206384, 0.4117647, 0, 1, 1,
0.6386046, 0.7412567, 1.240676, 0.4156863, 0, 1, 1,
0.6408333, 0.1238539, 0.1846686, 0.4235294, 0, 1, 1,
0.6495099, -0.6809322, 3.520879, 0.427451, 0, 1, 1,
0.65007, -0.6904167, 2.082511, 0.4352941, 0, 1, 1,
0.6582354, -0.9335057, 0.4276524, 0.4392157, 0, 1, 1,
0.6606295, 0.05980473, 1.589426, 0.4470588, 0, 1, 1,
0.6774719, 0.6032057, 1.950511, 0.4509804, 0, 1, 1,
0.6819239, 0.8586583, 1.137286, 0.4588235, 0, 1, 1,
0.6902149, 1.113924, 2.634727, 0.4627451, 0, 1, 1,
0.6938113, -1.067823, 3.91597, 0.4705882, 0, 1, 1,
0.6958024, 0.7465294, 1.486235, 0.4745098, 0, 1, 1,
0.6961036, 0.03468728, 3.939045, 0.4823529, 0, 1, 1,
0.6972451, 0.4648335, 2.045895, 0.4862745, 0, 1, 1,
0.7069323, 0.7515296, 0.7978638, 0.4941176, 0, 1, 1,
0.7087886, 0.9732304, -0.7182375, 0.5019608, 0, 1, 1,
0.7102174, 0.03739671, 3.562231, 0.5058824, 0, 1, 1,
0.7112802, 0.5226023, 1.925969, 0.5137255, 0, 1, 1,
0.7137379, -0.473341, 1.830103, 0.5176471, 0, 1, 1,
0.7178217, 0.9758467, 0.05996064, 0.5254902, 0, 1, 1,
0.7187717, 0.5089084, -0.2818034, 0.5294118, 0, 1, 1,
0.7228253, 0.1666363, 2.094806, 0.5372549, 0, 1, 1,
0.7251351, -1.325789, 2.501399, 0.5411765, 0, 1, 1,
0.7257762, 1.383728, -0.702025, 0.5490196, 0, 1, 1,
0.7299692, -1.249128, 3.433599, 0.5529412, 0, 1, 1,
0.7311945, 2.103307, 0.2041791, 0.5607843, 0, 1, 1,
0.7315185, 0.7765743, 1.490558, 0.5647059, 0, 1, 1,
0.7389411, 0.4080467, 1.312753, 0.572549, 0, 1, 1,
0.7402934, 0.06515126, 1.698182, 0.5764706, 0, 1, 1,
0.7410507, -0.1858398, 0.382993, 0.5843138, 0, 1, 1,
0.7437844, 0.7866669, -1.801715, 0.5882353, 0, 1, 1,
0.7444907, 1.363728, 0.6388294, 0.5960785, 0, 1, 1,
0.7448286, -0.07683239, 2.480814, 0.6039216, 0, 1, 1,
0.7500799, 0.07323804, 0.01754683, 0.6078432, 0, 1, 1,
0.7509922, 0.02801124, 1.024166, 0.6156863, 0, 1, 1,
0.7563497, 1.604525, 0.5718001, 0.6196079, 0, 1, 1,
0.757603, 0.4098423, 0.07110056, 0.627451, 0, 1, 1,
0.7581115, 1.403919, -0.5689428, 0.6313726, 0, 1, 1,
0.7581236, 1.029179, 0.7812108, 0.6392157, 0, 1, 1,
0.7670959, -1.27082, 0.1218288, 0.6431373, 0, 1, 1,
0.7702449, 0.9115326, 0.829002, 0.6509804, 0, 1, 1,
0.7744477, -0.8600562, 3.796498, 0.654902, 0, 1, 1,
0.7776636, 1.741152, 1.882724, 0.6627451, 0, 1, 1,
0.7793764, 0.3003885, 2.768552, 0.6666667, 0, 1, 1,
0.7797332, 0.6111696, 1.824767, 0.6745098, 0, 1, 1,
0.7803507, 0.7724394, -0.3377779, 0.6784314, 0, 1, 1,
0.7817998, 0.5381624, 1.943058, 0.6862745, 0, 1, 1,
0.7848639, 0.9835514, 1.740246, 0.6901961, 0, 1, 1,
0.7849761, -1.088483, 1.523103, 0.6980392, 0, 1, 1,
0.7868388, -0.5459388, 3.048276, 0.7058824, 0, 1, 1,
0.7927918, 0.2531171, 1.256498, 0.7098039, 0, 1, 1,
0.7954034, 0.2098345, 1.492359, 0.7176471, 0, 1, 1,
0.8036903, 1.644871, 0.4751951, 0.7215686, 0, 1, 1,
0.8048633, -0.2293426, 2.557402, 0.7294118, 0, 1, 1,
0.8098496, -2.763928, 1.972022, 0.7333333, 0, 1, 1,
0.8118338, -1.511421, 1.747145, 0.7411765, 0, 1, 1,
0.812871, -0.8908421, 1.656061, 0.7450981, 0, 1, 1,
0.8129875, 1.322744, 0.7728154, 0.7529412, 0, 1, 1,
0.8144443, -0.6584681, 1.28311, 0.7568628, 0, 1, 1,
0.8147775, 0.7304386, 0.2235398, 0.7647059, 0, 1, 1,
0.8157472, -1.811045, 2.597312, 0.7686275, 0, 1, 1,
0.8180695, -0.1645402, 1.047177, 0.7764706, 0, 1, 1,
0.8203034, 1.155191, 1.277038, 0.7803922, 0, 1, 1,
0.8276601, 0.2628629, 0.2634712, 0.7882353, 0, 1, 1,
0.8278242, 1.96501, 1.395121, 0.7921569, 0, 1, 1,
0.8435893, 0.04551305, 1.227173, 0.8, 0, 1, 1,
0.8486558, 0.1019038, 0.7588297, 0.8078431, 0, 1, 1,
0.8538983, -0.3309314, 0.9434626, 0.8117647, 0, 1, 1,
0.8564598, -2.303746, 3.875077, 0.8196079, 0, 1, 1,
0.8564608, -0.6489704, 2.582156, 0.8235294, 0, 1, 1,
0.8593155, 0.2619739, 1.56963, 0.8313726, 0, 1, 1,
0.8627651, 1.660764, -0.976202, 0.8352941, 0, 1, 1,
0.8638402, 0.6676145, 1.077734, 0.8431373, 0, 1, 1,
0.8649338, -1.187132, 0.7253174, 0.8470588, 0, 1, 1,
0.8657852, -0.6851454, 2.057319, 0.854902, 0, 1, 1,
0.8672783, -0.6408955, 1.762238, 0.8588235, 0, 1, 1,
0.8692867, -0.4817639, 2.676635, 0.8666667, 0, 1, 1,
0.8724756, 0.2709632, 0.5670555, 0.8705882, 0, 1, 1,
0.8725841, -0.3484221, 1.635193, 0.8784314, 0, 1, 1,
0.8734849, -1.175887, 4.350354, 0.8823529, 0, 1, 1,
0.8751787, 0.4348996, 0.485976, 0.8901961, 0, 1, 1,
0.8789887, -0.4482574, 1.671687, 0.8941177, 0, 1, 1,
0.8796823, -0.1529004, 1.723976, 0.9019608, 0, 1, 1,
0.8826118, 0.4280269, 2.066259, 0.9098039, 0, 1, 1,
0.8911803, 0.6602101, 0.5235583, 0.9137255, 0, 1, 1,
0.8960932, -0.118847, 2.403953, 0.9215686, 0, 1, 1,
0.9038493, -0.6059023, 1.718617, 0.9254902, 0, 1, 1,
0.9047148, 0.1498264, 0.2061442, 0.9333333, 0, 1, 1,
0.9059638, 1.692692, 1.314346, 0.9372549, 0, 1, 1,
0.9075726, -1.814787, 4.006685, 0.945098, 0, 1, 1,
0.9082449, -0.7986519, 2.091134, 0.9490196, 0, 1, 1,
0.9120168, 1.396714, 0.2472516, 0.9568627, 0, 1, 1,
0.9162296, -1.805649, 2.069742, 0.9607843, 0, 1, 1,
0.9265214, -0.4329287, 1.068281, 0.9686275, 0, 1, 1,
0.9305601, -1.493386, 2.243483, 0.972549, 0, 1, 1,
0.9313198, 1.6454, 0.4027296, 0.9803922, 0, 1, 1,
0.9333628, 1.069266, 1.507809, 0.9843137, 0, 1, 1,
0.9344186, 0.2964729, 2.782441, 0.9921569, 0, 1, 1,
0.9413062, 1.704018, 1.018044, 0.9960784, 0, 1, 1,
0.9455311, 1.592477, 1.20151, 1, 0, 0.9960784, 1,
0.9484196, -1.179888, 0.9186419, 1, 0, 0.9882353, 1,
0.9531705, 0.459144, 2.440459, 1, 0, 0.9843137, 1,
0.9580835, 0.09249846, 1.187097, 1, 0, 0.9764706, 1,
0.9588231, 1.88316, 1.75466, 1, 0, 0.972549, 1,
0.9588251, 0.5951787, 0.4421248, 1, 0, 0.9647059, 1,
0.9593503, 0.6778768, 1.875285, 1, 0, 0.9607843, 1,
0.9621306, -0.9193412, 3.424235, 1, 0, 0.9529412, 1,
0.9868128, -0.6394731, 1.560024, 1, 0, 0.9490196, 1,
0.9897562, 0.9446651, 1.082165, 1, 0, 0.9411765, 1,
0.9899752, -0.607063, 2.522975, 1, 0, 0.9372549, 1,
0.9926336, -0.3336909, 2.18171, 1, 0, 0.9294118, 1,
0.9941186, -1.001518, 0.1465638, 1, 0, 0.9254902, 1,
0.9950033, -1.493079, 2.740657, 1, 0, 0.9176471, 1,
0.996502, 0.5421582, 1.15816, 1, 0, 0.9137255, 1,
0.998901, 0.1259206, 1.97943, 1, 0, 0.9058824, 1,
1.00376, 0.4858606, 1.240269, 1, 0, 0.9019608, 1,
1.0041, -0.6366339, 2.839615, 1, 0, 0.8941177, 1,
1.007284, -2.093162, 3.44686, 1, 0, 0.8862745, 1,
1.008227, 0.1001022, 1.498076, 1, 0, 0.8823529, 1,
1.019005, -0.6021628, 0.9781049, 1, 0, 0.8745098, 1,
1.039818, 0.09963278, 1.668055, 1, 0, 0.8705882, 1,
1.043485, 0.4810062, 2.507479, 1, 0, 0.8627451, 1,
1.043956, 2.257577, 0.1368326, 1, 0, 0.8588235, 1,
1.044627, 0.3803768, 0.9945316, 1, 0, 0.8509804, 1,
1.052059, 1.430503, 1.435833, 1, 0, 0.8470588, 1,
1.056883, -1.108497, 2.279418, 1, 0, 0.8392157, 1,
1.060231, -0.2852491, 0.9310336, 1, 0, 0.8352941, 1,
1.067844, 1.165435, 1.588756, 1, 0, 0.827451, 1,
1.068471, 0.9304282, 0.3964761, 1, 0, 0.8235294, 1,
1.073163, 0.4812826, 1.528924, 1, 0, 0.8156863, 1,
1.074943, 2.041814, -0.6320294, 1, 0, 0.8117647, 1,
1.079455, -0.6916245, 2.108536, 1, 0, 0.8039216, 1,
1.097116, -0.3449111, 2.203476, 1, 0, 0.7960784, 1,
1.119578, 0.6430127, 1.339523, 1, 0, 0.7921569, 1,
1.12604, -0.2506774, 2.877372, 1, 0, 0.7843137, 1,
1.126341, 3.177813, -1.026987, 1, 0, 0.7803922, 1,
1.14309, 0.5395202, 1.942758, 1, 0, 0.772549, 1,
1.14345, 0.2051906, 0.5568507, 1, 0, 0.7686275, 1,
1.148111, 0.6075493, 1.545207, 1, 0, 0.7607843, 1,
1.148282, -1.363217, 2.949136, 1, 0, 0.7568628, 1,
1.149519, 0.509439, 1.326212, 1, 0, 0.7490196, 1,
1.166952, -1.103863, 2.788068, 1, 0, 0.7450981, 1,
1.172591, 0.73631, 0.9454045, 1, 0, 0.7372549, 1,
1.183204, 0.6925416, 2.193786, 1, 0, 0.7333333, 1,
1.184067, -1.560578, 1.278464, 1, 0, 0.7254902, 1,
1.19239, -0.7760017, 1.579008, 1, 0, 0.7215686, 1,
1.193245, -1.304985, 1.760786, 1, 0, 0.7137255, 1,
1.197313, 1.203375, 2.893041, 1, 0, 0.7098039, 1,
1.201287, 1.319523, 1.59277, 1, 0, 0.7019608, 1,
1.204349, 1.226824, -0.8842995, 1, 0, 0.6941177, 1,
1.204395, 0.5815147, 2.827126, 1, 0, 0.6901961, 1,
1.205554, -0.514272, 2.861376, 1, 0, 0.682353, 1,
1.213538, -0.8543512, 1.735795, 1, 0, 0.6784314, 1,
1.225581, 1.476076, 0.5138764, 1, 0, 0.6705883, 1,
1.226016, 0.7175395, 1.575791, 1, 0, 0.6666667, 1,
1.226374, 0.3810189, -1.687429, 1, 0, 0.6588235, 1,
1.237868, -0.9016777, 0.704181, 1, 0, 0.654902, 1,
1.238195, 0.9543929, 1.122288, 1, 0, 0.6470588, 1,
1.247257, -1.252589, 2.364761, 1, 0, 0.6431373, 1,
1.248283, 1.810062, 1.000239, 1, 0, 0.6352941, 1,
1.249784, -0.8297134, 2.021761, 1, 0, 0.6313726, 1,
1.249884, 0.9614748, 1.582349, 1, 0, 0.6235294, 1,
1.250216, -0.2756019, 0.2539037, 1, 0, 0.6196079, 1,
1.251774, 0.6110876, 0.9413575, 1, 0, 0.6117647, 1,
1.262104, 0.1850618, 0.6062596, 1, 0, 0.6078432, 1,
1.262134, 1.432004, 2.880526, 1, 0, 0.6, 1,
1.264667, 1.529444, 0.9503548, 1, 0, 0.5921569, 1,
1.273685, 0.2753132, -0.6899492, 1, 0, 0.5882353, 1,
1.292007, -0.3313701, 3.616541, 1, 0, 0.5803922, 1,
1.298789, 0.7976843, 1.365898, 1, 0, 0.5764706, 1,
1.300592, 0.1603247, 1.341779, 1, 0, 0.5686275, 1,
1.302433, 0.8674377, -0.5475516, 1, 0, 0.5647059, 1,
1.306721, -0.128669, 1.244725, 1, 0, 0.5568628, 1,
1.30709, -1.113521, 1.787217, 1, 0, 0.5529412, 1,
1.31466, -0.6541826, 2.13588, 1, 0, 0.5450981, 1,
1.322939, 1.807535, -0.5257049, 1, 0, 0.5411765, 1,
1.329407, 1.290767, -0.8707444, 1, 0, 0.5333334, 1,
1.33951, -0.780385, 2.539612, 1, 0, 0.5294118, 1,
1.347242, 0.2122408, 1.269302, 1, 0, 0.5215687, 1,
1.352324, -1.322636, 1.108125, 1, 0, 0.5176471, 1,
1.358213, -1.184381, 2.957998, 1, 0, 0.509804, 1,
1.361241, -0.1806245, 0.3121458, 1, 0, 0.5058824, 1,
1.370498, -1.403779, 1.212966, 1, 0, 0.4980392, 1,
1.375264, -0.8734214, 1.278562, 1, 0, 0.4901961, 1,
1.376626, -0.5133425, 1.254528, 1, 0, 0.4862745, 1,
1.377407, -0.587872, 0.9593961, 1, 0, 0.4784314, 1,
1.378553, -0.118022, 1.781594, 1, 0, 0.4745098, 1,
1.379793, -1.429659, 2.724886, 1, 0, 0.4666667, 1,
1.381541, -0.4401223, 1.95079, 1, 0, 0.4627451, 1,
1.383767, 0.7617252, 2.684561, 1, 0, 0.454902, 1,
1.384337, -2.643179, 2.821676, 1, 0, 0.4509804, 1,
1.391376, -0.7811533, 1.955331, 1, 0, 0.4431373, 1,
1.410606, -0.3173424, 2.899224, 1, 0, 0.4392157, 1,
1.417052, -0.04997136, 2.524774, 1, 0, 0.4313726, 1,
1.454926, 0.4575956, 1.550848, 1, 0, 0.427451, 1,
1.457395, -0.1977191, 1.503289, 1, 0, 0.4196078, 1,
1.459179, 1.425526, 0.06898737, 1, 0, 0.4156863, 1,
1.485187, 0.1542782, 1.959985, 1, 0, 0.4078431, 1,
1.496039, 1.15019, 0.7103492, 1, 0, 0.4039216, 1,
1.498583, 0.727502, 2.881896, 1, 0, 0.3960784, 1,
1.498828, 0.1665316, 3.014186, 1, 0, 0.3882353, 1,
1.506645, -0.2091538, 1.776123, 1, 0, 0.3843137, 1,
1.509464, -1.075047, 2.481566, 1, 0, 0.3764706, 1,
1.510243, 0.9863212, 1.696894, 1, 0, 0.372549, 1,
1.512071, 0.4336948, 0.8498251, 1, 0, 0.3647059, 1,
1.537531, -2.377033, 1.715173, 1, 0, 0.3607843, 1,
1.538988, -0.5803731, 1.669061, 1, 0, 0.3529412, 1,
1.547835, -0.2073552, 1.328447, 1, 0, 0.3490196, 1,
1.547871, -0.8203881, 3.484444, 1, 0, 0.3411765, 1,
1.554053, 0.1429386, 1.891335, 1, 0, 0.3372549, 1,
1.565655, 0.2108487, 1.430784, 1, 0, 0.3294118, 1,
1.570332, 1.056575, 0.03970257, 1, 0, 0.3254902, 1,
1.57084, -1.395506, 2.581303, 1, 0, 0.3176471, 1,
1.574867, -0.5230486, 2.626991, 1, 0, 0.3137255, 1,
1.581853, -0.4190308, 1.837538, 1, 0, 0.3058824, 1,
1.589188, 0.6523884, 2.308783, 1, 0, 0.2980392, 1,
1.591367, -1.017332, 2.597257, 1, 0, 0.2941177, 1,
1.592164, -0.7652498, 1.274217, 1, 0, 0.2862745, 1,
1.598921, -0.01923416, 2.668708, 1, 0, 0.282353, 1,
1.632719, -0.4962944, 1.50059, 1, 0, 0.2745098, 1,
1.642668, -1.13026, 1.229746, 1, 0, 0.2705882, 1,
1.655859, -0.9891039, 1.486812, 1, 0, 0.2627451, 1,
1.672108, 0.5792043, 1.96936, 1, 0, 0.2588235, 1,
1.675323, -0.6130996, 2.07986, 1, 0, 0.2509804, 1,
1.711714, -0.9623854, 2.610728, 1, 0, 0.2470588, 1,
1.720566, -0.08261906, 2.82046, 1, 0, 0.2392157, 1,
1.723309, -0.5657309, 1.738296, 1, 0, 0.2352941, 1,
1.7235, -1.013266, 1.281819, 1, 0, 0.227451, 1,
1.743385, 0.3669788, 0.1786407, 1, 0, 0.2235294, 1,
1.749809, 0.01194953, 0.7648932, 1, 0, 0.2156863, 1,
1.754969, -0.345557, 3.254112, 1, 0, 0.2117647, 1,
1.756254, -0.1537161, 2.302345, 1, 0, 0.2039216, 1,
1.756472, -1.097848, 3.474252, 1, 0, 0.1960784, 1,
1.761521, -0.2626576, 1.355508, 1, 0, 0.1921569, 1,
1.777894, 0.1360011, 1.001062, 1, 0, 0.1843137, 1,
1.800772, 2.267539, 1.333313, 1, 0, 0.1803922, 1,
1.802017, 0.5573487, 1.559303, 1, 0, 0.172549, 1,
1.821986, 0.3840474, -0.09763225, 1, 0, 0.1686275, 1,
1.826025, -0.8527792, 0.5660706, 1, 0, 0.1607843, 1,
1.833248, 1.042428, 0.7049338, 1, 0, 0.1568628, 1,
1.839713, 0.7050002, 0.9449661, 1, 0, 0.1490196, 1,
1.859925, 1.524181, 1.198071, 1, 0, 0.145098, 1,
1.888119, 0.6657823, 0.7529631, 1, 0, 0.1372549, 1,
1.894269, 1.435255, 1.689647, 1, 0, 0.1333333, 1,
1.946194, 0.4286605, 1.097136, 1, 0, 0.1254902, 1,
1.988777, -0.8841885, 0.9403738, 1, 0, 0.1215686, 1,
2.007379, 1.181566, 0.5627162, 1, 0, 0.1137255, 1,
2.022385, -0.3320279, 1.546019, 1, 0, 0.1098039, 1,
2.05371, 0.2202032, 3.539393, 1, 0, 0.1019608, 1,
2.064922, -1.771569, 0.9918268, 1, 0, 0.09411765, 1,
2.215505, -0.3852656, 1.555028, 1, 0, 0.09019608, 1,
2.279341, -0.8380754, 2.281958, 1, 0, 0.08235294, 1,
2.286654, -0.6907384, 1.836878, 1, 0, 0.07843138, 1,
2.289332, -1.619743, 1.594284, 1, 0, 0.07058824, 1,
2.297771, 0.7195699, -0.1732981, 1, 0, 0.06666667, 1,
2.319996, 0.7551939, 1.423881, 1, 0, 0.05882353, 1,
2.335923, 0.4265622, 1.324534, 1, 0, 0.05490196, 1,
2.347196, -1.384879, 2.144774, 1, 0, 0.04705882, 1,
2.352936, -0.06004854, 1.480648, 1, 0, 0.04313726, 1,
2.374376, 1.650985, 2.878741, 1, 0, 0.03529412, 1,
2.402136, 0.1125859, 2.541162, 1, 0, 0.03137255, 1,
2.619465, -0.05133057, 1.328252, 1, 0, 0.02352941, 1,
2.674787, -0.2784019, 1.200029, 1, 0, 0.01960784, 1,
3.003402, 0.9879698, 0.2702333, 1, 0, 0.01176471, 1,
3.558295, -0.1635061, 1.521568, 1, 0, 0.007843138, 1
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
0.09138489, -5.251732, -6.907833, 0, -0.5, 0.5, 0.5,
0.09138489, -5.251732, -6.907833, 1, -0.5, 0.5, 0.5,
0.09138489, -5.251732, -6.907833, 1, 1.5, 0.5, 0.5,
0.09138489, -5.251732, -6.907833, 0, 1.5, 0.5, 0.5
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
-4.550808, -0.4227124, -6.907833, 0, -0.5, 0.5, 0.5,
-4.550808, -0.4227124, -6.907833, 1, -0.5, 0.5, 0.5,
-4.550808, -0.4227124, -6.907833, 1, 1.5, 0.5, 0.5,
-4.550808, -0.4227124, -6.907833, 0, 1.5, 0.5, 0.5
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
-4.550808, -5.251732, 0.2736547, 0, -0.5, 0.5, 0.5,
-4.550808, -5.251732, 0.2736547, 1, -0.5, 0.5, 0.5,
-4.550808, -5.251732, 0.2736547, 1, 1.5, 0.5, 0.5,
-4.550808, -5.251732, 0.2736547, 0, 1.5, 0.5, 0.5
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
-3, -4.137343, -5.250566,
3, -4.137343, -5.250566,
-3, -4.137343, -5.250566,
-3, -4.323075, -5.526778,
-2, -4.137343, -5.250566,
-2, -4.323075, -5.526778,
-1, -4.137343, -5.250566,
-1, -4.323075, -5.526778,
0, -4.137343, -5.250566,
0, -4.323075, -5.526778,
1, -4.137343, -5.250566,
1, -4.323075, -5.526778,
2, -4.137343, -5.250566,
2, -4.323075, -5.526778,
3, -4.137343, -5.250566,
3, -4.323075, -5.526778
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
-3, -4.694538, -6.0792, 0, -0.5, 0.5, 0.5,
-3, -4.694538, -6.0792, 1, -0.5, 0.5, 0.5,
-3, -4.694538, -6.0792, 1, 1.5, 0.5, 0.5,
-3, -4.694538, -6.0792, 0, 1.5, 0.5, 0.5,
-2, -4.694538, -6.0792, 0, -0.5, 0.5, 0.5,
-2, -4.694538, -6.0792, 1, -0.5, 0.5, 0.5,
-2, -4.694538, -6.0792, 1, 1.5, 0.5, 0.5,
-2, -4.694538, -6.0792, 0, 1.5, 0.5, 0.5,
-1, -4.694538, -6.0792, 0, -0.5, 0.5, 0.5,
-1, -4.694538, -6.0792, 1, -0.5, 0.5, 0.5,
-1, -4.694538, -6.0792, 1, 1.5, 0.5, 0.5,
-1, -4.694538, -6.0792, 0, 1.5, 0.5, 0.5,
0, -4.694538, -6.0792, 0, -0.5, 0.5, 0.5,
0, -4.694538, -6.0792, 1, -0.5, 0.5, 0.5,
0, -4.694538, -6.0792, 1, 1.5, 0.5, 0.5,
0, -4.694538, -6.0792, 0, 1.5, 0.5, 0.5,
1, -4.694538, -6.0792, 0, -0.5, 0.5, 0.5,
1, -4.694538, -6.0792, 1, -0.5, 0.5, 0.5,
1, -4.694538, -6.0792, 1, 1.5, 0.5, 0.5,
1, -4.694538, -6.0792, 0, 1.5, 0.5, 0.5,
2, -4.694538, -6.0792, 0, -0.5, 0.5, 0.5,
2, -4.694538, -6.0792, 1, -0.5, 0.5, 0.5,
2, -4.694538, -6.0792, 1, 1.5, 0.5, 0.5,
2, -4.694538, -6.0792, 0, 1.5, 0.5, 0.5,
3, -4.694538, -6.0792, 0, -0.5, 0.5, 0.5,
3, -4.694538, -6.0792, 1, -0.5, 0.5, 0.5,
3, -4.694538, -6.0792, 1, 1.5, 0.5, 0.5,
3, -4.694538, -6.0792, 0, 1.5, 0.5, 0.5
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
-3.479533, -4, -5.250566,
-3.479533, 2, -5.250566,
-3.479533, -4, -5.250566,
-3.658079, -4, -5.526778,
-3.479533, -2, -5.250566,
-3.658079, -2, -5.526778,
-3.479533, 0, -5.250566,
-3.658079, 0, -5.526778,
-3.479533, 2, -5.250566,
-3.658079, 2, -5.526778
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
"-4",
"-2",
"0",
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
-4.015171, -4, -6.0792, 0, -0.5, 0.5, 0.5,
-4.015171, -4, -6.0792, 1, -0.5, 0.5, 0.5,
-4.015171, -4, -6.0792, 1, 1.5, 0.5, 0.5,
-4.015171, -4, -6.0792, 0, 1.5, 0.5, 0.5,
-4.015171, -2, -6.0792, 0, -0.5, 0.5, 0.5,
-4.015171, -2, -6.0792, 1, -0.5, 0.5, 0.5,
-4.015171, -2, -6.0792, 1, 1.5, 0.5, 0.5,
-4.015171, -2, -6.0792, 0, 1.5, 0.5, 0.5,
-4.015171, 0, -6.0792, 0, -0.5, 0.5, 0.5,
-4.015171, 0, -6.0792, 1, -0.5, 0.5, 0.5,
-4.015171, 0, -6.0792, 1, 1.5, 0.5, 0.5,
-4.015171, 0, -6.0792, 0, 1.5, 0.5, 0.5,
-4.015171, 2, -6.0792, 0, -0.5, 0.5, 0.5,
-4.015171, 2, -6.0792, 1, -0.5, 0.5, 0.5,
-4.015171, 2, -6.0792, 1, 1.5, 0.5, 0.5,
-4.015171, 2, -6.0792, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.479533, -4.137343, -4,
-3.479533, -4.137343, 4,
-3.479533, -4.137343, -4,
-3.658079, -4.323075, -4,
-3.479533, -4.137343, -2,
-3.658079, -4.323075, -2,
-3.479533, -4.137343, 0,
-3.658079, -4.323075, 0,
-3.479533, -4.137343, 2,
-3.658079, -4.323075, 2,
-3.479533, -4.137343, 4,
-3.658079, -4.323075, 4
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
-4.015171, -4.694538, -4, 0, -0.5, 0.5, 0.5,
-4.015171, -4.694538, -4, 1, -0.5, 0.5, 0.5,
-4.015171, -4.694538, -4, 1, 1.5, 0.5, 0.5,
-4.015171, -4.694538, -4, 0, 1.5, 0.5, 0.5,
-4.015171, -4.694538, -2, 0, -0.5, 0.5, 0.5,
-4.015171, -4.694538, -2, 1, -0.5, 0.5, 0.5,
-4.015171, -4.694538, -2, 1, 1.5, 0.5, 0.5,
-4.015171, -4.694538, -2, 0, 1.5, 0.5, 0.5,
-4.015171, -4.694538, 0, 0, -0.5, 0.5, 0.5,
-4.015171, -4.694538, 0, 1, -0.5, 0.5, 0.5,
-4.015171, -4.694538, 0, 1, 1.5, 0.5, 0.5,
-4.015171, -4.694538, 0, 0, 1.5, 0.5, 0.5,
-4.015171, -4.694538, 2, 0, -0.5, 0.5, 0.5,
-4.015171, -4.694538, 2, 1, -0.5, 0.5, 0.5,
-4.015171, -4.694538, 2, 1, 1.5, 0.5, 0.5,
-4.015171, -4.694538, 2, 0, 1.5, 0.5, 0.5,
-4.015171, -4.694538, 4, 0, -0.5, 0.5, 0.5,
-4.015171, -4.694538, 4, 1, -0.5, 0.5, 0.5,
-4.015171, -4.694538, 4, 1, 1.5, 0.5, 0.5,
-4.015171, -4.694538, 4, 0, 1.5, 0.5, 0.5
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
-3.479533, -4.137343, -5.250566,
-3.479533, 3.291918, -5.250566,
-3.479533, -4.137343, 5.797876,
-3.479533, 3.291918, 5.797876,
-3.479533, -4.137343, -5.250566,
-3.479533, -4.137343, 5.797876,
-3.479533, 3.291918, -5.250566,
-3.479533, 3.291918, 5.797876,
-3.479533, -4.137343, -5.250566,
3.662302, -4.137343, -5.250566,
-3.479533, -4.137343, 5.797876,
3.662302, -4.137343, 5.797876,
-3.479533, 3.291918, -5.250566,
3.662302, 3.291918, -5.250566,
-3.479533, 3.291918, 5.797876,
3.662302, 3.291918, 5.797876,
3.662302, -4.137343, -5.250566,
3.662302, 3.291918, -5.250566,
3.662302, -4.137343, 5.797876,
3.662302, 3.291918, 5.797876,
3.662302, -4.137343, -5.250566,
3.662302, -4.137343, 5.797876,
3.662302, 3.291918, -5.250566,
3.662302, 3.291918, 5.797876
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
var radius = 8.067664;
var distance = 35.89395;
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
mvMatrix.translate( -0.09138489, 0.4227124, -0.2736547 );
mvMatrix.scale( 1.221383, 1.17413, 0.7895155 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.89395);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
triflumizole<-read.table("triflumizole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triflumizole$V2
```

```
## Error in eval(expr, envir, enclos): object 'triflumizole' not found
```

```r
y<-triflumizole$V3
```

```
## Error in eval(expr, envir, enclos): object 'triflumizole' not found
```

```r
z<-triflumizole$V4
```

```
## Error in eval(expr, envir, enclos): object 'triflumizole' not found
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
-3.375525, -0.3235203, -1.948499, 0, 0, 1, 1, 1,
-2.773924, 0.9944988, -0.8550845, 1, 0, 0, 1, 1,
-2.462367, -0.8376564, -3.651537, 1, 0, 0, 1, 1,
-2.458394, 1.023227, -3.050623, 1, 0, 0, 1, 1,
-2.376069, -0.5214694, -2.224449, 1, 0, 0, 1, 1,
-2.332998, -0.464853, -1.460988, 1, 0, 0, 1, 1,
-2.32079, 0.8536856, -0.8607508, 0, 0, 0, 1, 1,
-2.237941, 0.4178202, -0.5748587, 0, 0, 0, 1, 1,
-2.157779, 2.036857, -1.427525, 0, 0, 0, 1, 1,
-2.138193, 0.3715309, -2.697797, 0, 0, 0, 1, 1,
-2.137136, 1.725256, -0.2813194, 0, 0, 0, 1, 1,
-2.124383, 2.359091, -0.2686667, 0, 0, 0, 1, 1,
-2.098318, 1.167737, -0.2083697, 0, 0, 0, 1, 1,
-2.074519, -1.174523, -3.545951, 1, 1, 1, 1, 1,
-2.069116, 0.08997255, -2.123206, 1, 1, 1, 1, 1,
-2.007019, -0.8893443, -2.389785, 1, 1, 1, 1, 1,
-1.971848, 0.08749559, 0.634819, 1, 1, 1, 1, 1,
-1.952781, 0.6553633, -0.9221818, 1, 1, 1, 1, 1,
-1.943269, -0.2574271, -3.294341, 1, 1, 1, 1, 1,
-1.917958, -0.991859, -2.851064, 1, 1, 1, 1, 1,
-1.904739, 0.6778588, -0.6616004, 1, 1, 1, 1, 1,
-1.88811, 0.8538012, -1.010569, 1, 1, 1, 1, 1,
-1.869191, 0.2423389, -1.731626, 1, 1, 1, 1, 1,
-1.863607, -0.05353895, -1.564821, 1, 1, 1, 1, 1,
-1.856453, -0.4855406, -2.111213, 1, 1, 1, 1, 1,
-1.853828, 0.07819869, -2.887684, 1, 1, 1, 1, 1,
-1.837035, -1.399688, -1.222546, 1, 1, 1, 1, 1,
-1.835317, 0.1288835, -0.8351717, 1, 1, 1, 1, 1,
-1.813409, 0.2444354, -2.066634, 0, 0, 1, 1, 1,
-1.809725, 0.6104817, -1.058207, 1, 0, 0, 1, 1,
-1.800665, -1.883263, -3.578953, 1, 0, 0, 1, 1,
-1.797986, 0.5902033, -0.729987, 1, 0, 0, 1, 1,
-1.792876, 0.9606915, -1.656137, 1, 0, 0, 1, 1,
-1.78993, 1.430285, 0.5665786, 1, 0, 0, 1, 1,
-1.789672, 0.9626297, -1.753054, 0, 0, 0, 1, 1,
-1.725992, -1.040253, -0.8752721, 0, 0, 0, 1, 1,
-1.721542, -0.01287512, -1.397273, 0, 0, 0, 1, 1,
-1.71931, 0.5454919, -2.562989, 0, 0, 0, 1, 1,
-1.718709, -0.913541, -1.237337, 0, 0, 0, 1, 1,
-1.713282, 0.511378, -2.063087, 0, 0, 0, 1, 1,
-1.709858, 0.5245509, -0.4329184, 0, 0, 0, 1, 1,
-1.686795, 0.7003665, -0.8352719, 1, 1, 1, 1, 1,
-1.686056, 0.7447425, 0.6537701, 1, 1, 1, 1, 1,
-1.673362, -0.8799306, -2.536767, 1, 1, 1, 1, 1,
-1.654625, -1.412726, -2.44411, 1, 1, 1, 1, 1,
-1.63946, -1.161297, -1.260876, 1, 1, 1, 1, 1,
-1.639008, 0.2029032, -2.661035, 1, 1, 1, 1, 1,
-1.624444, 1.766187, -0.7886384, 1, 1, 1, 1, 1,
-1.613697, -1.576169, -0.1716582, 1, 1, 1, 1, 1,
-1.586375, 0.7628261, -1.873892, 1, 1, 1, 1, 1,
-1.575783, 1.309262, -0.781388, 1, 1, 1, 1, 1,
-1.575517, -1.373403, -2.213013, 1, 1, 1, 1, 1,
-1.574006, -1.054392, -2.407341, 1, 1, 1, 1, 1,
-1.559629, -1.017416, -1.405809, 1, 1, 1, 1, 1,
-1.554885, 1.908375, -1.453817, 1, 1, 1, 1, 1,
-1.53877, -1.053136, -2.137946, 1, 1, 1, 1, 1,
-1.537214, -1.291287, -3.833187, 0, 0, 1, 1, 1,
-1.523162, -0.9121031, -3.546589, 1, 0, 0, 1, 1,
-1.514974, 0.6718793, -1.23846, 1, 0, 0, 1, 1,
-1.507048, -0.1877387, -1.480199, 1, 0, 0, 1, 1,
-1.500578, 0.6760024, -0.7073095, 1, 0, 0, 1, 1,
-1.491803, 0.2529439, -1.098427, 1, 0, 0, 1, 1,
-1.488769, 0.2230284, -1.991787, 0, 0, 0, 1, 1,
-1.483615, -0.9114139, -0.7832274, 0, 0, 0, 1, 1,
-1.472506, 0.910403, -1.412909, 0, 0, 0, 1, 1,
-1.462872, 0.3002169, -2.276927, 0, 0, 0, 1, 1,
-1.449826, 1.439394, -2.87173, 0, 0, 0, 1, 1,
-1.445889, -1.114204, -4.09471, 0, 0, 0, 1, 1,
-1.442754, -1.364882, -2.452291, 0, 0, 0, 1, 1,
-1.433385, -0.7442769, -2.061496, 1, 1, 1, 1, 1,
-1.432738, 0.5815127, -1.039669, 1, 1, 1, 1, 1,
-1.429686, 0.3417583, -1.902756, 1, 1, 1, 1, 1,
-1.425578, -1.481413, -2.29214, 1, 1, 1, 1, 1,
-1.424052, -0.5569921, 0.2354228, 1, 1, 1, 1, 1,
-1.419752, -0.6639658, -0.8322525, 1, 1, 1, 1, 1,
-1.414721, -0.332639, -3.073929, 1, 1, 1, 1, 1,
-1.410403, -1.000846, -1.856177, 1, 1, 1, 1, 1,
-1.409069, 1.491989, -2.104411, 1, 1, 1, 1, 1,
-1.394819, 0.3658025, -1.441609, 1, 1, 1, 1, 1,
-1.363848, 0.794074, -1.978715, 1, 1, 1, 1, 1,
-1.35841, 1.099712, -1.072235, 1, 1, 1, 1, 1,
-1.352892, 0.9826227, 1.134541, 1, 1, 1, 1, 1,
-1.351421, 0.3033501, -1.478059, 1, 1, 1, 1, 1,
-1.338781, 0.356796, 1.231275, 1, 1, 1, 1, 1,
-1.331406, 2.868302, -0.352887, 0, 0, 1, 1, 1,
-1.325049, 1.345672, -1.125453, 1, 0, 0, 1, 1,
-1.321912, 0.5781402, -1.577272, 1, 0, 0, 1, 1,
-1.314753, -0.3814398, -1.459873, 1, 0, 0, 1, 1,
-1.302243, -0.1705077, -2.572545, 1, 0, 0, 1, 1,
-1.2866, -0.3989757, -1.716258, 1, 0, 0, 1, 1,
-1.285045, -0.8982576, -2.203, 0, 0, 0, 1, 1,
-1.274589, 0.7470835, -0.4698395, 0, 0, 0, 1, 1,
-1.273572, 0.2463597, -1.30794, 0, 0, 0, 1, 1,
-1.27228, -0.4050511, -1.092831, 0, 0, 0, 1, 1,
-1.267119, -0.9683313, -1.934654, 0, 0, 0, 1, 1,
-1.255848, -0.7160337, -2.164072, 0, 0, 0, 1, 1,
-1.253502, -0.2929648, -2.487567, 0, 0, 0, 1, 1,
-1.244429, -1.755694, -2.324228, 1, 1, 1, 1, 1,
-1.242712, -0.4379252, -1.189604, 1, 1, 1, 1, 1,
-1.239496, -1.823014, -2.803298, 1, 1, 1, 1, 1,
-1.239042, -0.1284839, -2.170485, 1, 1, 1, 1, 1,
-1.237923, -0.26785, -2.633341, 1, 1, 1, 1, 1,
-1.227158, -0.06159848, 0.06310125, 1, 1, 1, 1, 1,
-1.219341, -4.02915, -2.908345, 1, 1, 1, 1, 1,
-1.211649, -0.1601838, -2.135909, 1, 1, 1, 1, 1,
-1.200297, -1.191509, -1.478437, 1, 1, 1, 1, 1,
-1.197006, 0.5037211, -0.01004525, 1, 1, 1, 1, 1,
-1.186388, -0.4121192, -1.723418, 1, 1, 1, 1, 1,
-1.184009, -0.6965476, -1.776049, 1, 1, 1, 1, 1,
-1.174387, -1.673403, -2.198654, 1, 1, 1, 1, 1,
-1.173226, -0.3775764, -0.63561, 1, 1, 1, 1, 1,
-1.171034, -1.079869, -3.759743, 1, 1, 1, 1, 1,
-1.163068, -0.03797209, -1.36176, 0, 0, 1, 1, 1,
-1.160165, -1.992331, -3.18923, 1, 0, 0, 1, 1,
-1.157747, -0.2855792, -1.25948, 1, 0, 0, 1, 1,
-1.156075, -0.6982329, -2.231404, 1, 0, 0, 1, 1,
-1.15293, -0.84721, -2.773491, 1, 0, 0, 1, 1,
-1.151952, -0.6686062, -1.579815, 1, 0, 0, 1, 1,
-1.138103, 0.288848, -0.6645834, 0, 0, 0, 1, 1,
-1.135065, -0.1302859, -3.424993, 0, 0, 0, 1, 1,
-1.133795, -0.9864793, -5.02824, 0, 0, 0, 1, 1,
-1.131405, -1.483435, -2.324419, 0, 0, 0, 1, 1,
-1.125254, -1.518332, -2.562005, 0, 0, 0, 1, 1,
-1.123691, -1.089197, -1.642472, 0, 0, 0, 1, 1,
-1.123319, -1.658, -2.179946, 0, 0, 0, 1, 1,
-1.113866, -0.3709861, -0.2911687, 1, 1, 1, 1, 1,
-1.107909, -1.471466, -3.262696, 1, 1, 1, 1, 1,
-1.101666, -0.241115, -1.753507, 1, 1, 1, 1, 1,
-1.100341, 0.6650621, 0.2538125, 1, 1, 1, 1, 1,
-1.093099, 0.8845512, -1.294689, 1, 1, 1, 1, 1,
-1.09024, -0.7591248, -3.793923, 1, 1, 1, 1, 1,
-1.086356, -1.04132, -3.187004, 1, 1, 1, 1, 1,
-1.072659, -1.743147, -2.288029, 1, 1, 1, 1, 1,
-1.068416, 0.2110221, -2.858387, 1, 1, 1, 1, 1,
-1.066451, -0.6464944, -1.820493, 1, 1, 1, 1, 1,
-1.064402, -0.5898386, -3.211855, 1, 1, 1, 1, 1,
-1.061128, 0.316564, -2.426926, 1, 1, 1, 1, 1,
-1.059835, -0.06762262, -2.296742, 1, 1, 1, 1, 1,
-1.055093, -0.1278169, -1.210786, 1, 1, 1, 1, 1,
-1.047298, 2.080176, 0.1931239, 1, 1, 1, 1, 1,
-1.034282, -0.1513813, -2.436409, 0, 0, 1, 1, 1,
-1.034217, 0.7551561, -2.528919, 1, 0, 0, 1, 1,
-1.023252, -1.109841, -3.831041, 1, 0, 0, 1, 1,
-1.016531, 0.2392104, -1.948377, 1, 0, 0, 1, 1,
-1.009378, 0.04008327, 0.156625, 1, 0, 0, 1, 1,
-1.004236, 1.498741, -1.610108, 1, 0, 0, 1, 1,
-1.000566, 0.7324107, -2.257844, 0, 0, 0, 1, 1,
-0.9957227, 0.3364202, -2.1529, 0, 0, 0, 1, 1,
-0.9915611, -0.9844549, -3.72499, 0, 0, 0, 1, 1,
-0.9843978, 0.1234986, -2.04225, 0, 0, 0, 1, 1,
-0.9772927, -0.4035027, -2.235203, 0, 0, 0, 1, 1,
-0.9703062, -0.3320307, -1.315522, 0, 0, 0, 1, 1,
-0.9679286, -0.5956298, -3.875248, 0, 0, 0, 1, 1,
-0.9631042, 1.535467, -1.766721, 1, 1, 1, 1, 1,
-0.9621714, -0.6744109, -0.6701186, 1, 1, 1, 1, 1,
-0.9592369, -0.4327547, -2.663477, 1, 1, 1, 1, 1,
-0.9568942, -0.9865634, -0.9820955, 1, 1, 1, 1, 1,
-0.9531033, 0.00484933, -1.711514, 1, 1, 1, 1, 1,
-0.9505402, -0.8840345, -2.293551, 1, 1, 1, 1, 1,
-0.9462395, -0.5640032, -1.060444, 1, 1, 1, 1, 1,
-0.938024, -1.303877, -2.225834, 1, 1, 1, 1, 1,
-0.936758, 0.9062867, -0.03698457, 1, 1, 1, 1, 1,
-0.935229, 0.5859918, -1.188969, 1, 1, 1, 1, 1,
-0.9304531, -0.5691631, -1.147866, 1, 1, 1, 1, 1,
-0.9226653, 1.065828, -1.134551, 1, 1, 1, 1, 1,
-0.9206231, 0.2032243, 0.3699337, 1, 1, 1, 1, 1,
-0.9147602, 1.232895, 0.570708, 1, 1, 1, 1, 1,
-0.9136642, 0.7297454, -3.282018, 1, 1, 1, 1, 1,
-0.9103585, 1.137984, 0.3433833, 0, 0, 1, 1, 1,
-0.9098807, 0.5025675, -0.8042663, 1, 0, 0, 1, 1,
-0.9083626, 0.2960825, 0.316637, 1, 0, 0, 1, 1,
-0.9076378, 2.328467, 1.194456, 1, 0, 0, 1, 1,
-0.9065011, -0.6942502, -3.63903, 1, 0, 0, 1, 1,
-0.9064004, 0.5626979, -1.211655, 1, 0, 0, 1, 1,
-0.8913692, -0.2801697, -2.612166, 0, 0, 0, 1, 1,
-0.891013, 1.673938, -3.266253, 0, 0, 0, 1, 1,
-0.8905321, 0.02991288, -2.746969, 0, 0, 0, 1, 1,
-0.8885382, -0.6279532, -2.695835, 0, 0, 0, 1, 1,
-0.8783115, -0.4692833, -1.613807, 0, 0, 0, 1, 1,
-0.8766843, 0.4132095, -1.448681, 0, 0, 0, 1, 1,
-0.8752075, -1.179071, -3.394173, 0, 0, 0, 1, 1,
-0.8746403, 0.6182462, -1.001759, 1, 1, 1, 1, 1,
-0.8674731, -1.143889, -3.567824, 1, 1, 1, 1, 1,
-0.839716, -0.0733242, -1.120695, 1, 1, 1, 1, 1,
-0.8390788, -1.624836, -1.843656, 1, 1, 1, 1, 1,
-0.8385134, -0.8364387, -2.65194, 1, 1, 1, 1, 1,
-0.8345804, 0.7109427, -0.5150546, 1, 1, 1, 1, 1,
-0.8242661, -1.202812, -1.935309, 1, 1, 1, 1, 1,
-0.8236285, -2.04397, -1.25233, 1, 1, 1, 1, 1,
-0.8202538, 0.1698525, -0.3302356, 1, 1, 1, 1, 1,
-0.8178378, 1.570057, -0.05931307, 1, 1, 1, 1, 1,
-0.8172735, 0.2356529, -1.59637, 1, 1, 1, 1, 1,
-0.8171934, -0.4937084, -3.332506, 1, 1, 1, 1, 1,
-0.8130158, -2.236745, -3.544661, 1, 1, 1, 1, 1,
-0.8041732, 0.7902983, -1.080311, 1, 1, 1, 1, 1,
-0.8020331, 1.990462, -1.459733, 1, 1, 1, 1, 1,
-0.7973143, 0.6926622, -2.857418, 0, 0, 1, 1, 1,
-0.7969514, 0.1220443, -1.762925, 1, 0, 0, 1, 1,
-0.7954726, -1.588265, -2.466668, 1, 0, 0, 1, 1,
-0.791829, -0.01335019, -2.689842, 1, 0, 0, 1, 1,
-0.7902678, -0.8645618, -2.449137, 1, 0, 0, 1, 1,
-0.7894939, 0.9030176, 1.406835, 1, 0, 0, 1, 1,
-0.7892371, -0.7381284, -3.024363, 0, 0, 0, 1, 1,
-0.7774363, 0.7651756, -0.6064366, 0, 0, 0, 1, 1,
-0.7754435, 0.5320423, -2.157498, 0, 0, 0, 1, 1,
-0.7721248, 0.7218791, -1.041228, 0, 0, 0, 1, 1,
-0.7697624, 0.8871238, -0.03446771, 0, 0, 0, 1, 1,
-0.7697364, -0.9476193, -2.692412, 0, 0, 0, 1, 1,
-0.768266, -0.8565199, -1.065007, 0, 0, 0, 1, 1,
-0.7653366, 0.5354097, 0.4465384, 1, 1, 1, 1, 1,
-0.763965, -1.19169, -1.350274, 1, 1, 1, 1, 1,
-0.7569482, -0.1716342, -1.519653, 1, 1, 1, 1, 1,
-0.7564859, -0.9930302, -1.183859, 1, 1, 1, 1, 1,
-0.7512631, 0.4759663, -0.3664514, 1, 1, 1, 1, 1,
-0.7498257, 3.183725, 1.306919, 1, 1, 1, 1, 1,
-0.7457052, 0.1985024, 1.34162, 1, 1, 1, 1, 1,
-0.7442251, -1.532316, -1.00078, 1, 1, 1, 1, 1,
-0.7296692, -2.556374, -3.492996, 1, 1, 1, 1, 1,
-0.7292815, 0.1095934, -2.023642, 1, 1, 1, 1, 1,
-0.7258583, 0.08535925, -0.4145867, 1, 1, 1, 1, 1,
-0.725367, 1.950063, -1.246057, 1, 1, 1, 1, 1,
-0.7239336, -1.081011, -2.468356, 1, 1, 1, 1, 1,
-0.7203182, 0.9601902, -2.720749, 1, 1, 1, 1, 1,
-0.7129318, 1.144638, 0.1553822, 1, 1, 1, 1, 1,
-0.7111107, -0.8216442, -4.241646, 0, 0, 1, 1, 1,
-0.7075121, 0.4626176, 1.283709, 1, 0, 0, 1, 1,
-0.7003748, 1.178321, -2.315671, 1, 0, 0, 1, 1,
-0.698571, -3.213962, -4.854774, 1, 0, 0, 1, 1,
-0.6977515, -0.2930428, -2.61484, 1, 0, 0, 1, 1,
-0.697018, 0.9697645, 0.7333582, 1, 0, 0, 1, 1,
-0.6954333, -0.3468879, -0.8915222, 0, 0, 0, 1, 1,
-0.6899528, 1.147373, -0.08190225, 0, 0, 0, 1, 1,
-0.6874675, 1.053476, -0.4768283, 0, 0, 0, 1, 1,
-0.6863343, 2.344444, 1.48416, 0, 0, 0, 1, 1,
-0.681284, -1.043466, -2.322331, 0, 0, 0, 1, 1,
-0.6788476, -0.3825234, -2.08033, 0, 0, 0, 1, 1,
-0.6774715, -0.5263673, -3.145512, 0, 0, 0, 1, 1,
-0.6751063, -0.7412326, -2.026369, 1, 1, 1, 1, 1,
-0.6651341, -0.2522149, -2.02621, 1, 1, 1, 1, 1,
-0.6621055, -0.6599594, -1.218062, 1, 1, 1, 1, 1,
-0.6531774, 0.532572, -1.794727, 1, 1, 1, 1, 1,
-0.6513186, 0.7588725, -1.593701, 1, 1, 1, 1, 1,
-0.6509236, -0.00613441, -1.814338, 1, 1, 1, 1, 1,
-0.6504887, -0.5421305, -2.252971, 1, 1, 1, 1, 1,
-0.6483036, 0.6785326, -0.317468, 1, 1, 1, 1, 1,
-0.6437765, 0.805758, -1.071341, 1, 1, 1, 1, 1,
-0.6408556, -0.8781649, -2.856824, 1, 1, 1, 1, 1,
-0.6398005, 1.213295, 0.2605038, 1, 1, 1, 1, 1,
-0.63631, 0.3157406, -1.167603, 1, 1, 1, 1, 1,
-0.6350452, 0.1805706, -2.046594, 1, 1, 1, 1, 1,
-0.6317762, 1.739058, -0.8460522, 1, 1, 1, 1, 1,
-0.6315119, -0.104312, -2.9529, 1, 1, 1, 1, 1,
-0.6270469, -1.774451, -2.667884, 0, 0, 1, 1, 1,
-0.6155751, 0.4445028, -1.648897, 1, 0, 0, 1, 1,
-0.6135537, 0.0379184, -1.333789, 1, 0, 0, 1, 1,
-0.6123307, 1.124704, -0.4640531, 1, 0, 0, 1, 1,
-0.609244, 0.9303387, -2.717356, 1, 0, 0, 1, 1,
-0.6071202, -0.1961204, -2.490197, 1, 0, 0, 1, 1,
-0.6010657, -0.3701027, -1.262913, 0, 0, 0, 1, 1,
-0.6008005, 1.1429, 0.8100763, 0, 0, 0, 1, 1,
-0.5905007, -0.05759385, -0.8810156, 0, 0, 0, 1, 1,
-0.5893291, -0.1821038, -1.794337, 0, 0, 0, 1, 1,
-0.588811, -0.4730856, -0.7193837, 0, 0, 0, 1, 1,
-0.5838156, -0.964581, -3.646053, 0, 0, 0, 1, 1,
-0.5807337, -0.8283725, -2.327168, 0, 0, 0, 1, 1,
-0.579084, 0.3303652, -2.74909, 1, 1, 1, 1, 1,
-0.5734132, 0.4763831, -1.853601, 1, 1, 1, 1, 1,
-0.5695425, -0.4878414, -2.06436, 1, 1, 1, 1, 1,
-0.5686445, -0.3540106, -2.196466, 1, 1, 1, 1, 1,
-0.5626625, -0.3108883, -4.070385, 1, 1, 1, 1, 1,
-0.5625414, 0.5321793, -0.536856, 1, 1, 1, 1, 1,
-0.5603598, -0.8988449, -1.781476, 1, 1, 1, 1, 1,
-0.5588579, 0.06866024, -0.3058724, 1, 1, 1, 1, 1,
-0.5560876, -0.2107166, -3.337014, 1, 1, 1, 1, 1,
-0.5505764, -1.045228, -2.826324, 1, 1, 1, 1, 1,
-0.5486493, -0.9768807, -3.834487, 1, 1, 1, 1, 1,
-0.5482574, -2.570378, -3.519466, 1, 1, 1, 1, 1,
-0.5430259, -0.8732318, -2.748404, 1, 1, 1, 1, 1,
-0.536283, 0.5909086, -1.84611, 1, 1, 1, 1, 1,
-0.5360672, 1.007842, -0.4903706, 1, 1, 1, 1, 1,
-0.5345333, -0.4327316, -0.6410558, 0, 0, 1, 1, 1,
-0.5343587, -0.3077728, -1.699784, 1, 0, 0, 1, 1,
-0.5308882, -0.7117856, -2.018035, 1, 0, 0, 1, 1,
-0.5297682, -0.5003198, -2.399001, 1, 0, 0, 1, 1,
-0.5273025, -0.4965479, -4.877848, 1, 0, 0, 1, 1,
-0.5271001, 0.5982047, 0.6351539, 1, 0, 0, 1, 1,
-0.5250991, 0.7655681, 0.5970303, 0, 0, 0, 1, 1,
-0.5232279, 0.3404342, -0.839304, 0, 0, 0, 1, 1,
-0.5218858, 1.650829, 0.1874779, 0, 0, 0, 1, 1,
-0.5200995, -0.7466829, -1.893303, 0, 0, 0, 1, 1,
-0.5154017, -0.6758394, -0.935846, 0, 0, 0, 1, 1,
-0.5136836, 0.1904675, -1.427144, 0, 0, 0, 1, 1,
-0.51097, 0.8008226, -0.6669445, 0, 0, 0, 1, 1,
-0.5094953, 0.6441052, 0.264083, 1, 1, 1, 1, 1,
-0.5079634, -0.9390044, -0.9021112, 1, 1, 1, 1, 1,
-0.5055737, 1.480294, -0.2194976, 1, 1, 1, 1, 1,
-0.5038934, 1.272372, -0.7395734, 1, 1, 1, 1, 1,
-0.5035574, -0.7119747, -1.628767, 1, 1, 1, 1, 1,
-0.4995257, 0.01848254, -1.02599, 1, 1, 1, 1, 1,
-0.4969203, 1.434255, -2.464987, 1, 1, 1, 1, 1,
-0.4862419, 0.301369, -0.542365, 1, 1, 1, 1, 1,
-0.4797681, -0.3012545, -3.332379, 1, 1, 1, 1, 1,
-0.4794701, -2.370145, -2.828055, 1, 1, 1, 1, 1,
-0.4790255, -0.142092, -0.3635747, 1, 1, 1, 1, 1,
-0.4769592, -0.3468949, -2.353899, 1, 1, 1, 1, 1,
-0.4678874, 1.96105, -1.107934, 1, 1, 1, 1, 1,
-0.4658797, 1.412249, 0.5410323, 1, 1, 1, 1, 1,
-0.4656343, 2.062196, -0.1407157, 1, 1, 1, 1, 1,
-0.4647168, -0.4673784, -1.773853, 0, 0, 1, 1, 1,
-0.4607679, -0.2311856, -2.229854, 1, 0, 0, 1, 1,
-0.4580971, -0.1321863, -2.960126, 1, 0, 0, 1, 1,
-0.4549667, -0.4319057, -1.473138, 1, 0, 0, 1, 1,
-0.4527379, -0.2239291, -1.905487, 1, 0, 0, 1, 1,
-0.451699, 0.2791775, 1.863223, 1, 0, 0, 1, 1,
-0.4487717, 0.6305623, -0.7626719, 0, 0, 0, 1, 1,
-0.4389703, -1.038641, -3.481645, 0, 0, 0, 1, 1,
-0.4383866, -0.7711127, -2.496672, 0, 0, 0, 1, 1,
-0.4357645, -1.896189, -1.117869, 0, 0, 0, 1, 1,
-0.4346961, 0.2279118, -1.129989, 0, 0, 0, 1, 1,
-0.4305427, 0.3301722, -0.6544463, 0, 0, 0, 1, 1,
-0.429519, 0.2856505, -0.479454, 0, 0, 0, 1, 1,
-0.4291326, -0.187734, -2.564651, 1, 1, 1, 1, 1,
-0.4235928, 1.323441, -0.3958202, 1, 1, 1, 1, 1,
-0.4217784, 2.103801, -0.5059091, 1, 1, 1, 1, 1,
-0.4210924, -0.01879532, -2.835395, 1, 1, 1, 1, 1,
-0.4205074, -0.05377232, -2.156441, 1, 1, 1, 1, 1,
-0.4175211, 1.327008, 0.2108782, 1, 1, 1, 1, 1,
-0.4147606, 0.4514562, -3.289867, 1, 1, 1, 1, 1,
-0.4100546, -0.8960424, -4.034693, 1, 1, 1, 1, 1,
-0.4097634, 0.9742182, 0.1194397, 1, 1, 1, 1, 1,
-0.408386, -1.058893, -3.276524, 1, 1, 1, 1, 1,
-0.4005249, -1.084365, -3.468268, 1, 1, 1, 1, 1,
-0.3951394, -0.3116421, -3.024218, 1, 1, 1, 1, 1,
-0.3920126, 1.557427, -1.236759, 1, 1, 1, 1, 1,
-0.3919519, -0.1209772, -1.39781, 1, 1, 1, 1, 1,
-0.38969, -1.075025, -2.280981, 1, 1, 1, 1, 1,
-0.3861116, 1.421654, 0.04891059, 0, 0, 1, 1, 1,
-0.3820736, 1.587784, -0.1531445, 1, 0, 0, 1, 1,
-0.381237, 0.4741183, -1.44221, 1, 0, 0, 1, 1,
-0.3804853, -0.9314818, -2.702954, 1, 0, 0, 1, 1,
-0.3756553, -1.530573, -3.510152, 1, 0, 0, 1, 1,
-0.3732485, -1.035597, -4.412055, 1, 0, 0, 1, 1,
-0.3719803, 1.545281, -0.8807486, 0, 0, 0, 1, 1,
-0.3693317, -0.1525754, -2.342486, 0, 0, 0, 1, 1,
-0.3689915, -0.7543582, -1.709435, 0, 0, 0, 1, 1,
-0.36552, 0.7952148, 0.3959009, 0, 0, 0, 1, 1,
-0.3616764, -1.173189, -2.926738, 0, 0, 0, 1, 1,
-0.3604939, -0.4051822, -3.143073, 0, 0, 0, 1, 1,
-0.3564695, -0.550822, -2.065209, 0, 0, 0, 1, 1,
-0.3559976, 0.8375562, 1.229048, 1, 1, 1, 1, 1,
-0.3514715, 1.430617, -0.5022954, 1, 1, 1, 1, 1,
-0.3511791, 0.01091462, -1.076977, 1, 1, 1, 1, 1,
-0.3495352, -0.2995627, -2.477766, 1, 1, 1, 1, 1,
-0.3476967, 0.1687336, 0.2144067, 1, 1, 1, 1, 1,
-0.3467845, 0.05725438, -2.6521, 1, 1, 1, 1, 1,
-0.344232, 0.3121301, -0.8657782, 1, 1, 1, 1, 1,
-0.3431412, -0.5843281, -3.638611, 1, 1, 1, 1, 1,
-0.3417677, -0.090872, -2.71714, 1, 1, 1, 1, 1,
-0.3415917, -1.803884, -3.856023, 1, 1, 1, 1, 1,
-0.3407668, 1.385698, 1.029135, 1, 1, 1, 1, 1,
-0.3394713, -0.2439429, -0.6833934, 1, 1, 1, 1, 1,
-0.3393387, 1.845437, -0.2862464, 1, 1, 1, 1, 1,
-0.3393339, -1.239262, -3.864765, 1, 1, 1, 1, 1,
-0.3357237, -1.075728, -4.140291, 1, 1, 1, 1, 1,
-0.3351456, 1.921083, 0.1864204, 0, 0, 1, 1, 1,
-0.330041, 0.3598494, 0.2964138, 1, 0, 0, 1, 1,
-0.3260134, -1.203961, -1.599188, 1, 0, 0, 1, 1,
-0.3255932, 0.246412, 0.1833899, 1, 0, 0, 1, 1,
-0.3240231, -1.330335, -1.54116, 1, 0, 0, 1, 1,
-0.3220817, 2.174295, -0.3692275, 1, 0, 0, 1, 1,
-0.3220569, 1.979627, -0.03573401, 0, 0, 0, 1, 1,
-0.320761, -2.415634, -3.606224, 0, 0, 0, 1, 1,
-0.3205174, -0.2386849, -3.062184, 0, 0, 0, 1, 1,
-0.3130248, 0.1245077, -1.940596, 0, 0, 0, 1, 1,
-0.3075215, -0.2145048, -4.069323, 0, 0, 0, 1, 1,
-0.2942746, -1.169038, -3.151707, 0, 0, 0, 1, 1,
-0.293127, 0.6210405, 0.4081148, 0, 0, 0, 1, 1,
-0.2901624, 0.6346266, 0.5704697, 1, 1, 1, 1, 1,
-0.2892874, -0.8376095, -1.552146, 1, 1, 1, 1, 1,
-0.2807057, -1.449314, -0.8670974, 1, 1, 1, 1, 1,
-0.2785995, -0.5365296, -2.195366, 1, 1, 1, 1, 1,
-0.2772214, 0.5601721, -0.6830367, 1, 1, 1, 1, 1,
-0.2625161, 0.8392147, -2.707642, 1, 1, 1, 1, 1,
-0.2576416, 0.8801921, 1.440137, 1, 1, 1, 1, 1,
-0.2568103, -0.003203511, -1.19132, 1, 1, 1, 1, 1,
-0.2565016, -0.1358373, -2.236604, 1, 1, 1, 1, 1,
-0.2538828, -1.10163, -2.721731, 1, 1, 1, 1, 1,
-0.2531074, 2.056967, -0.8471977, 1, 1, 1, 1, 1,
-0.252305, -1.160505, -2.787856, 1, 1, 1, 1, 1,
-0.2470769, 0.8915266, -0.5000203, 1, 1, 1, 1, 1,
-0.2457294, 0.4969667, 0.3935535, 1, 1, 1, 1, 1,
-0.2349254, -0.2968751, -3.264053, 1, 1, 1, 1, 1,
-0.2343736, -1.917052, -3.992819, 0, 0, 1, 1, 1,
-0.2338736, -0.2861087, -2.786889, 1, 0, 0, 1, 1,
-0.2324739, 0.04208235, 0.4712207, 1, 0, 0, 1, 1,
-0.2271718, -0.05308027, -0.9029513, 1, 0, 0, 1, 1,
-0.2259558, 1.078663, 0.4615729, 1, 0, 0, 1, 1,
-0.2231201, -0.00787726, -1.401029, 1, 0, 0, 1, 1,
-0.2229011, -1.650973, -2.543122, 0, 0, 0, 1, 1,
-0.222172, 0.4260928, 0.07562951, 0, 0, 0, 1, 1,
-0.2190775, 0.474463, -0.8523922, 0, 0, 0, 1, 1,
-0.2172486, -1.112014, -3.099089, 0, 0, 0, 1, 1,
-0.214637, -0.8737919, -2.990157, 0, 0, 0, 1, 1,
-0.2078918, 0.2693112, 0.6275957, 0, 0, 0, 1, 1,
-0.2075987, 2.380228, -0.7301082, 0, 0, 0, 1, 1,
-0.2052531, -0.3649446, -2.342834, 1, 1, 1, 1, 1,
-0.2027498, -1.086147, -1.732577, 1, 1, 1, 1, 1,
-0.2022453, -0.1548074, -2.920351, 1, 1, 1, 1, 1,
-0.2012186, -0.01589871, -1.430232, 1, 1, 1, 1, 1,
-0.1974589, -0.8640755, -3.74849, 1, 1, 1, 1, 1,
-0.1956086, 0.08415995, -0.3517278, 1, 1, 1, 1, 1,
-0.1944566, 0.3961638, 0.4152633, 1, 1, 1, 1, 1,
-0.193632, -0.517199, -2.115883, 1, 1, 1, 1, 1,
-0.1935001, 0.6597267, -0.003948858, 1, 1, 1, 1, 1,
-0.1901048, -1.014056, -1.901319, 1, 1, 1, 1, 1,
-0.1896499, -0.2990493, -2.813232, 1, 1, 1, 1, 1,
-0.187426, 0.851311, -0.01408783, 1, 1, 1, 1, 1,
-0.1834994, -1.281883, -4.046859, 1, 1, 1, 1, 1,
-0.1823269, -0.1408136, -1.573523, 1, 1, 1, 1, 1,
-0.1815303, 1.084993, -0.08289552, 1, 1, 1, 1, 1,
-0.1814167, -0.6873469, -3.067047, 0, 0, 1, 1, 1,
-0.1781784, 0.0313712, -1.773855, 1, 0, 0, 1, 1,
-0.1767019, -0.0974137, -1.145372, 1, 0, 0, 1, 1,
-0.175412, 1.421007, -1.094946, 1, 0, 0, 1, 1,
-0.1747462, -0.8053777, -2.74954, 1, 0, 0, 1, 1,
-0.1737321, -0.4787207, -2.333314, 1, 0, 0, 1, 1,
-0.1718641, -0.2199406, -2.334003, 0, 0, 0, 1, 1,
-0.1686372, -0.8922178, -2.76342, 0, 0, 0, 1, 1,
-0.1649887, -0.09117824, -2.991203, 0, 0, 0, 1, 1,
-0.1598013, -1.313206, -3.533769, 0, 0, 0, 1, 1,
-0.156366, -0.7169517, -2.45366, 0, 0, 0, 1, 1,
-0.1548764, 0.2270723, -0.0299098, 0, 0, 0, 1, 1,
-0.1516764, -0.8316597, -3.286954, 0, 0, 0, 1, 1,
-0.1493945, -0.1908701, -1.613027, 1, 1, 1, 1, 1,
-0.1492852, 0.2924089, -1.186418, 1, 1, 1, 1, 1,
-0.1490708, -1.344904, -3.320396, 1, 1, 1, 1, 1,
-0.1483339, 1.298409, 0.4737526, 1, 1, 1, 1, 1,
-0.1448603, 0.7866952, -0.7275556, 1, 1, 1, 1, 1,
-0.1430847, -0.3513074, -3.711599, 1, 1, 1, 1, 1,
-0.1371264, 0.04248413, -1.634439, 1, 1, 1, 1, 1,
-0.1361799, -0.8496779, -1.870313, 1, 1, 1, 1, 1,
-0.1322522, 0.5397416, -0.5673245, 1, 1, 1, 1, 1,
-0.1271841, -0.9324699, -2.439131, 1, 1, 1, 1, 1,
-0.1192972, 0.3929007, 1.089262, 1, 1, 1, 1, 1,
-0.1192134, 0.2319021, -0.2917423, 1, 1, 1, 1, 1,
-0.1187639, -0.5015414, -1.471786, 1, 1, 1, 1, 1,
-0.1181311, 0.5347851, -0.04474616, 1, 1, 1, 1, 1,
-0.1106934, 1.370685, -2.639629, 1, 1, 1, 1, 1,
-0.1091951, -0.1199095, -2.594825, 0, 0, 1, 1, 1,
-0.1086107, 0.4407478, -1.375158, 1, 0, 0, 1, 1,
-0.1023112, -0.7429153, -3.061666, 1, 0, 0, 1, 1,
-0.09847027, 0.936048, 1.456603, 1, 0, 0, 1, 1,
-0.09679655, 2.108102, -0.3701432, 1, 0, 0, 1, 1,
-0.0943269, -2.63518, -3.192142, 1, 0, 0, 1, 1,
-0.0885246, 0.05012394, -0.9587685, 0, 0, 0, 1, 1,
-0.08841978, 0.3496683, -1.333786, 0, 0, 0, 1, 1,
-0.08459323, -0.1423901, -2.266449, 0, 0, 0, 1, 1,
-0.08407737, 1.391851, 0.2564675, 0, 0, 0, 1, 1,
-0.08389345, 0.4650441, -0.03984779, 0, 0, 0, 1, 1,
-0.08317795, -1.444281, -1.281704, 0, 0, 0, 1, 1,
-0.08257172, -1.080843, -3.602152, 0, 0, 0, 1, 1,
-0.07928644, -0.260729, -4.710963, 1, 1, 1, 1, 1,
-0.06897704, 0.3910249, -0.6946239, 1, 1, 1, 1, 1,
-0.0687338, 1.325937, -0.2953981, 1, 1, 1, 1, 1,
-0.0671896, -0.6182957, -5.089667, 1, 1, 1, 1, 1,
-0.06717806, 0.6535822, -0.6378977, 1, 1, 1, 1, 1,
-0.06646471, -0.2588508, -4.207278, 1, 1, 1, 1, 1,
-0.06471512, 0.05816376, -0.2086432, 1, 1, 1, 1, 1,
-0.06423671, -0.6237351, -2.612177, 1, 1, 1, 1, 1,
-0.06210666, 1.161637, -1.507285, 1, 1, 1, 1, 1,
-0.06169811, -0.3324541, -4.000535, 1, 1, 1, 1, 1,
-0.06099193, -0.536305, -1.562633, 1, 1, 1, 1, 1,
-0.05676216, -0.8027413, -2.396319, 1, 1, 1, 1, 1,
-0.05292106, 0.0157021, -1.185745, 1, 1, 1, 1, 1,
-0.05176204, 0.07660779, 0.67633, 1, 1, 1, 1, 1,
-0.0510348, -1.624964, -1.92718, 1, 1, 1, 1, 1,
-0.05017377, 0.6029521, 0.7442917, 0, 0, 1, 1, 1,
-0.04999366, 0.4402696, 2.012082, 1, 0, 0, 1, 1,
-0.04718237, -0.2232576, -1.521843, 1, 0, 0, 1, 1,
-0.0426756, -1.281845, -3.875361, 1, 0, 0, 1, 1,
-0.02895333, 0.2126429, -1.590826, 1, 0, 0, 1, 1,
-0.02882962, -0.5153396, -3.255033, 1, 0, 0, 1, 1,
-0.0246366, 0.500076, -0.842336, 0, 0, 0, 1, 1,
-0.02122728, -0.9482821, -0.7976038, 0, 0, 0, 1, 1,
-0.02122295, 0.1486212, 1.783618, 0, 0, 0, 1, 1,
-0.02016109, 0.1316355, 0.4957052, 0, 0, 0, 1, 1,
-0.01980168, 0.1372311, 0.5999693, 0, 0, 0, 1, 1,
-0.01957288, 0.7201359, -0.2559177, 0, 0, 0, 1, 1,
-0.01919817, 2.445718, -0.08007193, 0, 0, 0, 1, 1,
-0.01655641, 0.145311, -1.762735, 1, 1, 1, 1, 1,
-0.0155824, 0.1331427, 0.274466, 1, 1, 1, 1, 1,
-0.01103892, 0.3514006, -0.2783128, 1, 1, 1, 1, 1,
-0.01091445, -1.466348, -3.738478, 1, 1, 1, 1, 1,
-5.854417e-06, 0.1702657, -0.2027666, 1, 1, 1, 1, 1,
0.001769228, 0.3578687, -1.733142, 1, 1, 1, 1, 1,
0.002242045, -0.07052161, 0.7750571, 1, 1, 1, 1, 1,
0.003601882, -0.7873713, 3.117917, 1, 1, 1, 1, 1,
0.003939406, -0.05448419, 5.636976, 1, 1, 1, 1, 1,
0.004437672, -0.1059952, 4.023408, 1, 1, 1, 1, 1,
0.005811865, -1.149402, 4.470015, 1, 1, 1, 1, 1,
0.009548005, -1.013223, 2.527376, 1, 1, 1, 1, 1,
0.009825754, -0.4220861, 4.683693, 1, 1, 1, 1, 1,
0.0105858, -0.3467871, 1.901505, 1, 1, 1, 1, 1,
0.01258413, 1.868901, -0.1892383, 1, 1, 1, 1, 1,
0.01589984, 0.2216473, -0.9717072, 0, 0, 1, 1, 1,
0.01748177, -0.9200315, 3.446599, 1, 0, 0, 1, 1,
0.02251872, -0.3974267, 3.371615, 1, 0, 0, 1, 1,
0.02378911, -0.3048509, 3.292916, 1, 0, 0, 1, 1,
0.02540714, 0.3710836, 0.897348, 1, 0, 0, 1, 1,
0.0317473, 0.1307262, 0.5310059, 1, 0, 0, 1, 1,
0.03592843, 0.352075, 1.313257, 0, 0, 0, 1, 1,
0.03759918, -1.198337, 3.438217, 0, 0, 0, 1, 1,
0.04101796, -0.6085047, 1.837596, 0, 0, 0, 1, 1,
0.04548063, 2.139709, 0.2985173, 0, 0, 0, 1, 1,
0.04947765, -0.9632801, 0.9097968, 0, 0, 0, 1, 1,
0.05238115, -0.8807832, 3.92002, 0, 0, 0, 1, 1,
0.05325739, -0.6283689, 3.176157, 0, 0, 0, 1, 1,
0.05414309, -0.4955834, 5.044259, 1, 1, 1, 1, 1,
0.05833633, 0.1824218, -0.7993991, 1, 1, 1, 1, 1,
0.0650901, 0.04682879, 0.5655566, 1, 1, 1, 1, 1,
0.06547951, -1.20463, 3.662405, 1, 1, 1, 1, 1,
0.0655748, 0.8655214, -0.5767617, 1, 1, 1, 1, 1,
0.0671012, -0.8340014, 3.974122, 1, 1, 1, 1, 1,
0.072979, 0.0458008, 1.473863, 1, 1, 1, 1, 1,
0.07363626, -0.8706461, 4.234309, 1, 1, 1, 1, 1,
0.07468654, -0.1728155, 2.688958, 1, 1, 1, 1, 1,
0.07736073, -1.370805, 3.100622, 1, 1, 1, 1, 1,
0.07789472, 0.2825544, -0.1609215, 1, 1, 1, 1, 1,
0.08084559, 0.4051249, 0.1145507, 1, 1, 1, 1, 1,
0.09174552, 0.2587417, -2.23074, 1, 1, 1, 1, 1,
0.09277781, -0.08819521, 3.532981, 1, 1, 1, 1, 1,
0.09347129, 0.4651676, -0.09093706, 1, 1, 1, 1, 1,
0.09441993, -1.292208, 2.576753, 0, 0, 1, 1, 1,
0.09657999, -0.5355605, 4.118204, 1, 0, 0, 1, 1,
0.0969203, 1.050926, -0.05665213, 1, 0, 0, 1, 1,
0.09736153, 0.01649441, 1.452289, 1, 0, 0, 1, 1,
0.09782753, -0.9238533, 1.913547, 1, 0, 0, 1, 1,
0.09918708, 1.314752, 0.2380806, 1, 0, 0, 1, 1,
0.0998343, 1.365647, 2.229796, 0, 0, 0, 1, 1,
0.1029587, -0.1169817, 2.149206, 0, 0, 0, 1, 1,
0.1032589, 0.8124611, -0.5514188, 0, 0, 0, 1, 1,
0.1110464, 0.6691622, 1.825628, 0, 0, 0, 1, 1,
0.1111477, 0.7724484, -0.8821366, 0, 0, 0, 1, 1,
0.1120321, -0.1889753, 3.322681, 0, 0, 0, 1, 1,
0.1142971, -0.7223176, 3.353805, 0, 0, 0, 1, 1,
0.1186188, 0.9151039, -0.5994925, 1, 1, 1, 1, 1,
0.1202625, -0.3744887, 3.628778, 1, 1, 1, 1, 1,
0.1272933, 0.5606421, 0.1455118, 1, 1, 1, 1, 1,
0.1307562, 0.8847677, 1.926102, 1, 1, 1, 1, 1,
0.1342127, 0.4738576, 0.3723246, 1, 1, 1, 1, 1,
0.1347715, -0.9707009, 3.541255, 1, 1, 1, 1, 1,
0.1372245, 0.2135226, -0.3866754, 1, 1, 1, 1, 1,
0.1500386, 0.2254162, 1.043457, 1, 1, 1, 1, 1,
0.1514939, 0.9933721, -0.4828084, 1, 1, 1, 1, 1,
0.1559717, -0.4740696, 1.723655, 1, 1, 1, 1, 1,
0.157073, -0.6593387, 2.013937, 1, 1, 1, 1, 1,
0.1578841, -0.4869493, 2.728457, 1, 1, 1, 1, 1,
0.1584307, 0.4316669, -1.228202, 1, 1, 1, 1, 1,
0.1693298, 1.670795, 0.136281, 1, 1, 1, 1, 1,
0.1694453, 1.676404, -0.9923171, 1, 1, 1, 1, 1,
0.1709897, -1.228936, 3.846155, 0, 0, 1, 1, 1,
0.1760651, 0.6010936, 1.490717, 1, 0, 0, 1, 1,
0.1760738, 0.210162, 1.706636, 1, 0, 0, 1, 1,
0.1768654, -0.6505846, 3.331362, 1, 0, 0, 1, 1,
0.1773959, -0.4829305, 2.500427, 1, 0, 0, 1, 1,
0.1778312, 1.865313, 0.9194937, 1, 0, 0, 1, 1,
0.1811001, 0.8162586, 0.8261636, 0, 0, 0, 1, 1,
0.1862264, -0.1751391, 3.324018, 0, 0, 0, 1, 1,
0.1871456, -1.235053, 1.434909, 0, 0, 0, 1, 1,
0.1880533, 0.6852953, -1.108904, 0, 0, 0, 1, 1,
0.188625, 0.9957942, 0.38187, 0, 0, 0, 1, 1,
0.1910472, -0.1237094, 1.428977, 0, 0, 0, 1, 1,
0.1931626, -0.9102147, 5.545125, 0, 0, 0, 1, 1,
0.2036238, -0.5368002, 2.51643, 1, 1, 1, 1, 1,
0.2043833, 0.7581264, 2.240573, 1, 1, 1, 1, 1,
0.20455, -0.5891216, 3.130321, 1, 1, 1, 1, 1,
0.206185, -0.1441144, 2.418721, 1, 1, 1, 1, 1,
0.207137, 0.9858786, -0.439054, 1, 1, 1, 1, 1,
0.2073427, 0.08498688, 1.715519, 1, 1, 1, 1, 1,
0.210734, 0.4512371, -0.8876063, 1, 1, 1, 1, 1,
0.2116512, 0.05073659, 1.41739, 1, 1, 1, 1, 1,
0.2128464, 0.07870416, 2.469517, 1, 1, 1, 1, 1,
0.2182017, 2.779209, -0.487956, 1, 1, 1, 1, 1,
0.2198362, 0.6241742, 0.6696793, 1, 1, 1, 1, 1,
0.2205007, 1.116691, 0.9841204, 1, 1, 1, 1, 1,
0.2298781, 0.006444784, 2.305004, 1, 1, 1, 1, 1,
0.2424991, 0.8936116, 1.666775, 1, 1, 1, 1, 1,
0.2493435, -0.7350112, 3.678115, 1, 1, 1, 1, 1,
0.2518073, -1.963959, 4.511501, 0, 0, 1, 1, 1,
0.2532806, 0.2328378, 0.2555763, 1, 0, 0, 1, 1,
0.2546318, -1.288169, 3.15717, 1, 0, 0, 1, 1,
0.2562729, 0.4043233, -1.231843, 1, 0, 0, 1, 1,
0.2577769, -1.315368, 1.660635, 1, 0, 0, 1, 1,
0.2598639, -1.693455, 2.91924, 1, 0, 0, 1, 1,
0.262293, -0.914515, 2.158976, 0, 0, 0, 1, 1,
0.2668856, -0.2007149, 1.53935, 0, 0, 0, 1, 1,
0.2675132, -0.2804985, 0.8484259, 0, 0, 0, 1, 1,
0.2705195, -1.039599, 3.874166, 0, 0, 0, 1, 1,
0.2713223, 0.5463359, 1.242585, 0, 0, 0, 1, 1,
0.273772, -0.01996876, 2.878575, 0, 0, 0, 1, 1,
0.2750459, -0.6881402, 3.696964, 0, 0, 0, 1, 1,
0.2761143, 2.029581, -1.421506, 1, 1, 1, 1, 1,
0.2785634, 0.003183869, 0.2553267, 1, 1, 1, 1, 1,
0.2788813, 0.6303923, 0.9911924, 1, 1, 1, 1, 1,
0.2855822, -1.714301, 4.168859, 1, 1, 1, 1, 1,
0.2991866, -0.1155132, 2.70478, 1, 1, 1, 1, 1,
0.299455, 0.05983176, 2.94082, 1, 1, 1, 1, 1,
0.300791, -1.084693, 1.593709, 1, 1, 1, 1, 1,
0.3023566, -0.09371355, 2.37582, 1, 1, 1, 1, 1,
0.3034793, -1.254822, 2.956139, 1, 1, 1, 1, 1,
0.3039213, -1.625303, 4.280774, 1, 1, 1, 1, 1,
0.3066629, 1.094508, 0.8500067, 1, 1, 1, 1, 1,
0.3066865, -0.4389916, 1.215341, 1, 1, 1, 1, 1,
0.3081131, 1.876076, 1.067304, 1, 1, 1, 1, 1,
0.3117307, 1.462086, -0.7025142, 1, 1, 1, 1, 1,
0.31269, -0.2348497, 1.335174, 1, 1, 1, 1, 1,
0.3135271, 0.3484974, 1.94063, 0, 0, 1, 1, 1,
0.3135791, -1.11901, 2.417737, 1, 0, 0, 1, 1,
0.3140118, -0.3038556, 1.734201, 1, 0, 0, 1, 1,
0.3149012, -0.6643959, 2.858633, 1, 0, 0, 1, 1,
0.3164301, -1.371548, 3.36421, 1, 0, 0, 1, 1,
0.3184676, -0.5398202, 2.810658, 1, 0, 0, 1, 1,
0.3188998, -0.0757769, 1.306594, 0, 0, 0, 1, 1,
0.3246428, -0.729794, 3.994495, 0, 0, 0, 1, 1,
0.3272268, 0.6314949, -0.4548494, 0, 0, 0, 1, 1,
0.3312454, -1.491203, 1.822811, 0, 0, 0, 1, 1,
0.333663, 0.1028515, 0.5828751, 0, 0, 0, 1, 1,
0.3342516, -3.093724, 3.582815, 0, 0, 0, 1, 1,
0.334432, -1.360693, 1.852804, 0, 0, 0, 1, 1,
0.3397406, -0.167689, 2.172292, 1, 1, 1, 1, 1,
0.3411162, 0.02004959, -0.09820874, 1, 1, 1, 1, 1,
0.3455197, 0.5364963, 1.703922, 1, 1, 1, 1, 1,
0.3546781, 1.292868, 1.788445, 1, 1, 1, 1, 1,
0.3552787, -1.29419, 1.952962, 1, 1, 1, 1, 1,
0.3584765, 1.65428, -1.55187, 1, 1, 1, 1, 1,
0.3586142, -0.6483762, 2.20698, 1, 1, 1, 1, 1,
0.3590974, -0.5526885, 0.5149001, 1, 1, 1, 1, 1,
0.3612269, -2.440082, 2.794466, 1, 1, 1, 1, 1,
0.3619535, 0.6583523, -0.2532479, 1, 1, 1, 1, 1,
0.3619606, 1.147845, 0.2091392, 1, 1, 1, 1, 1,
0.3619786, 0.2008445, 0.2901589, 1, 1, 1, 1, 1,
0.3620559, -1.921806, 3.939387, 1, 1, 1, 1, 1,
0.3625472, 2.195323, 1.00257, 1, 1, 1, 1, 1,
0.3663299, 0.1935042, 2.248692, 1, 1, 1, 1, 1,
0.3669876, -0.5074493, 1.868229, 0, 0, 1, 1, 1,
0.3681968, -1.693044, 2.502878, 1, 0, 0, 1, 1,
0.3724431, 0.3282722, 0.5267597, 1, 0, 0, 1, 1,
0.3733667, 0.1518281, 0.9743125, 1, 0, 0, 1, 1,
0.3742541, -0.7243814, 3.067873, 1, 0, 0, 1, 1,
0.3763609, -1.561961, 2.739326, 1, 0, 0, 1, 1,
0.3849741, -0.09275933, 2.344317, 0, 0, 0, 1, 1,
0.3900713, 0.9997619, 0.6716762, 0, 0, 0, 1, 1,
0.3918628, 1.530398, -0.6730629, 0, 0, 0, 1, 1,
0.4038651, -1.238407, 0.4666111, 0, 0, 0, 1, 1,
0.407843, -0.4323258, 3.702251, 0, 0, 0, 1, 1,
0.4165179, 2.533703, 1.950454, 0, 0, 0, 1, 1,
0.4173884, 1.814638, -0.3815246, 0, 0, 0, 1, 1,
0.4175964, 1.805967, -1.171619, 1, 1, 1, 1, 1,
0.4179661, 0.933862, -0.8366873, 1, 1, 1, 1, 1,
0.4205296, 0.5474965, 2.27841, 1, 1, 1, 1, 1,
0.4215207, -1.245116, 2.58316, 1, 1, 1, 1, 1,
0.4217117, -0.6520192, 1.846277, 1, 1, 1, 1, 1,
0.4270756, 0.7428119, 1.427865, 1, 1, 1, 1, 1,
0.4272498, -0.4737825, 2.254358, 1, 1, 1, 1, 1,
0.4305052, -0.07430448, 2.394709, 1, 1, 1, 1, 1,
0.4328436, -0.2873749, 1.423259, 1, 1, 1, 1, 1,
0.4364205, 1.580519, 0.88155, 1, 1, 1, 1, 1,
0.4403827, -0.1977305, 1.996268, 1, 1, 1, 1, 1,
0.441278, 0.7393696, 1.940216, 1, 1, 1, 1, 1,
0.4427405, -0.8319827, 2.736187, 1, 1, 1, 1, 1,
0.4461106, 0.5548233, 1.07633, 1, 1, 1, 1, 1,
0.4467536, 0.4928138, 1.060494, 1, 1, 1, 1, 1,
0.4485371, -0.8529593, 3.913298, 0, 0, 1, 1, 1,
0.450602, 1.080901, -1.880384, 1, 0, 0, 1, 1,
0.4512285, 0.3545198, -0.01661884, 1, 0, 0, 1, 1,
0.4580988, -0.801863, 3.665215, 1, 0, 0, 1, 1,
0.4593694, -0.08977526, 0.61375, 1, 0, 0, 1, 1,
0.466129, 0.05261116, 1.555255, 1, 0, 0, 1, 1,
0.46865, 0.1550403, 1.380251, 0, 0, 0, 1, 1,
0.4711067, 1.425513, -0.6415044, 0, 0, 0, 1, 1,
0.4718508, 0.5830045, 0.1877793, 0, 0, 0, 1, 1,
0.4731885, 0.3029686, -0.4068123, 0, 0, 0, 1, 1,
0.4733594, 1.031673, -0.04332775, 0, 0, 0, 1, 1,
0.473552, 0.63437, 0.4563379, 0, 0, 0, 1, 1,
0.4744115, -1.196495, 3.489224, 0, 0, 0, 1, 1,
0.4811471, 0.1555837, 1.792975, 1, 1, 1, 1, 1,
0.4811802, 0.1215491, 2.129128, 1, 1, 1, 1, 1,
0.4831559, -1.217298, 1.006987, 1, 1, 1, 1, 1,
0.4840196, -0.04576955, 2.825086, 1, 1, 1, 1, 1,
0.489641, 0.4327705, 0.6842688, 1, 1, 1, 1, 1,
0.4931419, 2.240607, 0.3248726, 1, 1, 1, 1, 1,
0.4986466, -1.097191, 4.466275, 1, 1, 1, 1, 1,
0.4994811, 0.7823458, 0.04478982, 1, 1, 1, 1, 1,
0.5023659, -0.6600221, 3.540619, 1, 1, 1, 1, 1,
0.5076876, 0.2765609, 1.569658, 1, 1, 1, 1, 1,
0.5200357, 0.1305719, 0.532963, 1, 1, 1, 1, 1,
0.5204882, -1.130392, 1.348917, 1, 1, 1, 1, 1,
0.5218427, 0.287981, 1.685317, 1, 1, 1, 1, 1,
0.5353979, 0.290253, -0.4473954, 1, 1, 1, 1, 1,
0.5355693, -0.2182331, 2.107807, 1, 1, 1, 1, 1,
0.5372823, -0.6744351, 4.647472, 0, 0, 1, 1, 1,
0.5375395, -0.8478678, 2.28074, 1, 0, 0, 1, 1,
0.5399296, 0.1005148, 2.468335, 1, 0, 0, 1, 1,
0.5439948, 1.548521, -0.7751975, 1, 0, 0, 1, 1,
0.5440695, 1.045651, 1.504891, 1, 0, 0, 1, 1,
0.5442858, -0.7033274, 1.483065, 1, 0, 0, 1, 1,
0.5461138, 0.3020565, 0.4789487, 0, 0, 0, 1, 1,
0.5478268, 0.1595603, 1.542946, 0, 0, 0, 1, 1,
0.5485029, -0.2688302, 1.618582, 0, 0, 0, 1, 1,
0.5507717, -0.3468937, 2.73444, 0, 0, 0, 1, 1,
0.5508853, -1.253502, 2.510125, 0, 0, 0, 1, 1,
0.5582579, 0.9593561, -0.7669759, 0, 0, 0, 1, 1,
0.5599388, -1.464402, 2.352417, 0, 0, 0, 1, 1,
0.5747789, 0.2730075, 0.6716555, 1, 1, 1, 1, 1,
0.5759321, -0.4394561, 1.888971, 1, 1, 1, 1, 1,
0.5802146, -0.376734, 2.466455, 1, 1, 1, 1, 1,
0.5850551, -0.7244331, 2.350497, 1, 1, 1, 1, 1,
0.585114, -0.6091878, 2.537923, 1, 1, 1, 1, 1,
0.585385, 0.5824875, 0.9145332, 1, 1, 1, 1, 1,
0.5879909, 1.575524, 0.252288, 1, 1, 1, 1, 1,
0.5904133, 1.301908, 0.1601484, 1, 1, 1, 1, 1,
0.5909066, 1.197409, 1.454217, 1, 1, 1, 1, 1,
0.5922811, -1.260593, 2.789514, 1, 1, 1, 1, 1,
0.6049836, 0.01917418, 1.965443, 1, 1, 1, 1, 1,
0.6063944, 1.302554, 0.5733835, 1, 1, 1, 1, 1,
0.6133141, -0.6287864, 3.233927, 1, 1, 1, 1, 1,
0.6150532, 0.9374111, -0.2930964, 1, 1, 1, 1, 1,
0.6154256, -0.8822019, 1.681607, 1, 1, 1, 1, 1,
0.6161162, -1.866829, 0.2559676, 0, 0, 1, 1, 1,
0.6192196, -0.6436957, 2.21109, 1, 0, 0, 1, 1,
0.6221778, -1.273149, 3.445483, 1, 0, 0, 1, 1,
0.6262507, 0.9688815, 1.349001, 1, 0, 0, 1, 1,
0.6284344, 0.1828465, 0.9739936, 1, 0, 0, 1, 1,
0.628477, 1.40664, -1.483859, 1, 0, 0, 1, 1,
0.6338972, 0.6891478, 3.122889, 0, 0, 0, 1, 1,
0.6353929, 0.9182639, 0.6206384, 0, 0, 0, 1, 1,
0.6386046, 0.7412567, 1.240676, 0, 0, 0, 1, 1,
0.6408333, 0.1238539, 0.1846686, 0, 0, 0, 1, 1,
0.6495099, -0.6809322, 3.520879, 0, 0, 0, 1, 1,
0.65007, -0.6904167, 2.082511, 0, 0, 0, 1, 1,
0.6582354, -0.9335057, 0.4276524, 0, 0, 0, 1, 1,
0.6606295, 0.05980473, 1.589426, 1, 1, 1, 1, 1,
0.6774719, 0.6032057, 1.950511, 1, 1, 1, 1, 1,
0.6819239, 0.8586583, 1.137286, 1, 1, 1, 1, 1,
0.6902149, 1.113924, 2.634727, 1, 1, 1, 1, 1,
0.6938113, -1.067823, 3.91597, 1, 1, 1, 1, 1,
0.6958024, 0.7465294, 1.486235, 1, 1, 1, 1, 1,
0.6961036, 0.03468728, 3.939045, 1, 1, 1, 1, 1,
0.6972451, 0.4648335, 2.045895, 1, 1, 1, 1, 1,
0.7069323, 0.7515296, 0.7978638, 1, 1, 1, 1, 1,
0.7087886, 0.9732304, -0.7182375, 1, 1, 1, 1, 1,
0.7102174, 0.03739671, 3.562231, 1, 1, 1, 1, 1,
0.7112802, 0.5226023, 1.925969, 1, 1, 1, 1, 1,
0.7137379, -0.473341, 1.830103, 1, 1, 1, 1, 1,
0.7178217, 0.9758467, 0.05996064, 1, 1, 1, 1, 1,
0.7187717, 0.5089084, -0.2818034, 1, 1, 1, 1, 1,
0.7228253, 0.1666363, 2.094806, 0, 0, 1, 1, 1,
0.7251351, -1.325789, 2.501399, 1, 0, 0, 1, 1,
0.7257762, 1.383728, -0.702025, 1, 0, 0, 1, 1,
0.7299692, -1.249128, 3.433599, 1, 0, 0, 1, 1,
0.7311945, 2.103307, 0.2041791, 1, 0, 0, 1, 1,
0.7315185, 0.7765743, 1.490558, 1, 0, 0, 1, 1,
0.7389411, 0.4080467, 1.312753, 0, 0, 0, 1, 1,
0.7402934, 0.06515126, 1.698182, 0, 0, 0, 1, 1,
0.7410507, -0.1858398, 0.382993, 0, 0, 0, 1, 1,
0.7437844, 0.7866669, -1.801715, 0, 0, 0, 1, 1,
0.7444907, 1.363728, 0.6388294, 0, 0, 0, 1, 1,
0.7448286, -0.07683239, 2.480814, 0, 0, 0, 1, 1,
0.7500799, 0.07323804, 0.01754683, 0, 0, 0, 1, 1,
0.7509922, 0.02801124, 1.024166, 1, 1, 1, 1, 1,
0.7563497, 1.604525, 0.5718001, 1, 1, 1, 1, 1,
0.757603, 0.4098423, 0.07110056, 1, 1, 1, 1, 1,
0.7581115, 1.403919, -0.5689428, 1, 1, 1, 1, 1,
0.7581236, 1.029179, 0.7812108, 1, 1, 1, 1, 1,
0.7670959, -1.27082, 0.1218288, 1, 1, 1, 1, 1,
0.7702449, 0.9115326, 0.829002, 1, 1, 1, 1, 1,
0.7744477, -0.8600562, 3.796498, 1, 1, 1, 1, 1,
0.7776636, 1.741152, 1.882724, 1, 1, 1, 1, 1,
0.7793764, 0.3003885, 2.768552, 1, 1, 1, 1, 1,
0.7797332, 0.6111696, 1.824767, 1, 1, 1, 1, 1,
0.7803507, 0.7724394, -0.3377779, 1, 1, 1, 1, 1,
0.7817998, 0.5381624, 1.943058, 1, 1, 1, 1, 1,
0.7848639, 0.9835514, 1.740246, 1, 1, 1, 1, 1,
0.7849761, -1.088483, 1.523103, 1, 1, 1, 1, 1,
0.7868388, -0.5459388, 3.048276, 0, 0, 1, 1, 1,
0.7927918, 0.2531171, 1.256498, 1, 0, 0, 1, 1,
0.7954034, 0.2098345, 1.492359, 1, 0, 0, 1, 1,
0.8036903, 1.644871, 0.4751951, 1, 0, 0, 1, 1,
0.8048633, -0.2293426, 2.557402, 1, 0, 0, 1, 1,
0.8098496, -2.763928, 1.972022, 1, 0, 0, 1, 1,
0.8118338, -1.511421, 1.747145, 0, 0, 0, 1, 1,
0.812871, -0.8908421, 1.656061, 0, 0, 0, 1, 1,
0.8129875, 1.322744, 0.7728154, 0, 0, 0, 1, 1,
0.8144443, -0.6584681, 1.28311, 0, 0, 0, 1, 1,
0.8147775, 0.7304386, 0.2235398, 0, 0, 0, 1, 1,
0.8157472, -1.811045, 2.597312, 0, 0, 0, 1, 1,
0.8180695, -0.1645402, 1.047177, 0, 0, 0, 1, 1,
0.8203034, 1.155191, 1.277038, 1, 1, 1, 1, 1,
0.8276601, 0.2628629, 0.2634712, 1, 1, 1, 1, 1,
0.8278242, 1.96501, 1.395121, 1, 1, 1, 1, 1,
0.8435893, 0.04551305, 1.227173, 1, 1, 1, 1, 1,
0.8486558, 0.1019038, 0.7588297, 1, 1, 1, 1, 1,
0.8538983, -0.3309314, 0.9434626, 1, 1, 1, 1, 1,
0.8564598, -2.303746, 3.875077, 1, 1, 1, 1, 1,
0.8564608, -0.6489704, 2.582156, 1, 1, 1, 1, 1,
0.8593155, 0.2619739, 1.56963, 1, 1, 1, 1, 1,
0.8627651, 1.660764, -0.976202, 1, 1, 1, 1, 1,
0.8638402, 0.6676145, 1.077734, 1, 1, 1, 1, 1,
0.8649338, -1.187132, 0.7253174, 1, 1, 1, 1, 1,
0.8657852, -0.6851454, 2.057319, 1, 1, 1, 1, 1,
0.8672783, -0.6408955, 1.762238, 1, 1, 1, 1, 1,
0.8692867, -0.4817639, 2.676635, 1, 1, 1, 1, 1,
0.8724756, 0.2709632, 0.5670555, 0, 0, 1, 1, 1,
0.8725841, -0.3484221, 1.635193, 1, 0, 0, 1, 1,
0.8734849, -1.175887, 4.350354, 1, 0, 0, 1, 1,
0.8751787, 0.4348996, 0.485976, 1, 0, 0, 1, 1,
0.8789887, -0.4482574, 1.671687, 1, 0, 0, 1, 1,
0.8796823, -0.1529004, 1.723976, 1, 0, 0, 1, 1,
0.8826118, 0.4280269, 2.066259, 0, 0, 0, 1, 1,
0.8911803, 0.6602101, 0.5235583, 0, 0, 0, 1, 1,
0.8960932, -0.118847, 2.403953, 0, 0, 0, 1, 1,
0.9038493, -0.6059023, 1.718617, 0, 0, 0, 1, 1,
0.9047148, 0.1498264, 0.2061442, 0, 0, 0, 1, 1,
0.9059638, 1.692692, 1.314346, 0, 0, 0, 1, 1,
0.9075726, -1.814787, 4.006685, 0, 0, 0, 1, 1,
0.9082449, -0.7986519, 2.091134, 1, 1, 1, 1, 1,
0.9120168, 1.396714, 0.2472516, 1, 1, 1, 1, 1,
0.9162296, -1.805649, 2.069742, 1, 1, 1, 1, 1,
0.9265214, -0.4329287, 1.068281, 1, 1, 1, 1, 1,
0.9305601, -1.493386, 2.243483, 1, 1, 1, 1, 1,
0.9313198, 1.6454, 0.4027296, 1, 1, 1, 1, 1,
0.9333628, 1.069266, 1.507809, 1, 1, 1, 1, 1,
0.9344186, 0.2964729, 2.782441, 1, 1, 1, 1, 1,
0.9413062, 1.704018, 1.018044, 1, 1, 1, 1, 1,
0.9455311, 1.592477, 1.20151, 1, 1, 1, 1, 1,
0.9484196, -1.179888, 0.9186419, 1, 1, 1, 1, 1,
0.9531705, 0.459144, 2.440459, 1, 1, 1, 1, 1,
0.9580835, 0.09249846, 1.187097, 1, 1, 1, 1, 1,
0.9588231, 1.88316, 1.75466, 1, 1, 1, 1, 1,
0.9588251, 0.5951787, 0.4421248, 1, 1, 1, 1, 1,
0.9593503, 0.6778768, 1.875285, 0, 0, 1, 1, 1,
0.9621306, -0.9193412, 3.424235, 1, 0, 0, 1, 1,
0.9868128, -0.6394731, 1.560024, 1, 0, 0, 1, 1,
0.9897562, 0.9446651, 1.082165, 1, 0, 0, 1, 1,
0.9899752, -0.607063, 2.522975, 1, 0, 0, 1, 1,
0.9926336, -0.3336909, 2.18171, 1, 0, 0, 1, 1,
0.9941186, -1.001518, 0.1465638, 0, 0, 0, 1, 1,
0.9950033, -1.493079, 2.740657, 0, 0, 0, 1, 1,
0.996502, 0.5421582, 1.15816, 0, 0, 0, 1, 1,
0.998901, 0.1259206, 1.97943, 0, 0, 0, 1, 1,
1.00376, 0.4858606, 1.240269, 0, 0, 0, 1, 1,
1.0041, -0.6366339, 2.839615, 0, 0, 0, 1, 1,
1.007284, -2.093162, 3.44686, 0, 0, 0, 1, 1,
1.008227, 0.1001022, 1.498076, 1, 1, 1, 1, 1,
1.019005, -0.6021628, 0.9781049, 1, 1, 1, 1, 1,
1.039818, 0.09963278, 1.668055, 1, 1, 1, 1, 1,
1.043485, 0.4810062, 2.507479, 1, 1, 1, 1, 1,
1.043956, 2.257577, 0.1368326, 1, 1, 1, 1, 1,
1.044627, 0.3803768, 0.9945316, 1, 1, 1, 1, 1,
1.052059, 1.430503, 1.435833, 1, 1, 1, 1, 1,
1.056883, -1.108497, 2.279418, 1, 1, 1, 1, 1,
1.060231, -0.2852491, 0.9310336, 1, 1, 1, 1, 1,
1.067844, 1.165435, 1.588756, 1, 1, 1, 1, 1,
1.068471, 0.9304282, 0.3964761, 1, 1, 1, 1, 1,
1.073163, 0.4812826, 1.528924, 1, 1, 1, 1, 1,
1.074943, 2.041814, -0.6320294, 1, 1, 1, 1, 1,
1.079455, -0.6916245, 2.108536, 1, 1, 1, 1, 1,
1.097116, -0.3449111, 2.203476, 1, 1, 1, 1, 1,
1.119578, 0.6430127, 1.339523, 0, 0, 1, 1, 1,
1.12604, -0.2506774, 2.877372, 1, 0, 0, 1, 1,
1.126341, 3.177813, -1.026987, 1, 0, 0, 1, 1,
1.14309, 0.5395202, 1.942758, 1, 0, 0, 1, 1,
1.14345, 0.2051906, 0.5568507, 1, 0, 0, 1, 1,
1.148111, 0.6075493, 1.545207, 1, 0, 0, 1, 1,
1.148282, -1.363217, 2.949136, 0, 0, 0, 1, 1,
1.149519, 0.509439, 1.326212, 0, 0, 0, 1, 1,
1.166952, -1.103863, 2.788068, 0, 0, 0, 1, 1,
1.172591, 0.73631, 0.9454045, 0, 0, 0, 1, 1,
1.183204, 0.6925416, 2.193786, 0, 0, 0, 1, 1,
1.184067, -1.560578, 1.278464, 0, 0, 0, 1, 1,
1.19239, -0.7760017, 1.579008, 0, 0, 0, 1, 1,
1.193245, -1.304985, 1.760786, 1, 1, 1, 1, 1,
1.197313, 1.203375, 2.893041, 1, 1, 1, 1, 1,
1.201287, 1.319523, 1.59277, 1, 1, 1, 1, 1,
1.204349, 1.226824, -0.8842995, 1, 1, 1, 1, 1,
1.204395, 0.5815147, 2.827126, 1, 1, 1, 1, 1,
1.205554, -0.514272, 2.861376, 1, 1, 1, 1, 1,
1.213538, -0.8543512, 1.735795, 1, 1, 1, 1, 1,
1.225581, 1.476076, 0.5138764, 1, 1, 1, 1, 1,
1.226016, 0.7175395, 1.575791, 1, 1, 1, 1, 1,
1.226374, 0.3810189, -1.687429, 1, 1, 1, 1, 1,
1.237868, -0.9016777, 0.704181, 1, 1, 1, 1, 1,
1.238195, 0.9543929, 1.122288, 1, 1, 1, 1, 1,
1.247257, -1.252589, 2.364761, 1, 1, 1, 1, 1,
1.248283, 1.810062, 1.000239, 1, 1, 1, 1, 1,
1.249784, -0.8297134, 2.021761, 1, 1, 1, 1, 1,
1.249884, 0.9614748, 1.582349, 0, 0, 1, 1, 1,
1.250216, -0.2756019, 0.2539037, 1, 0, 0, 1, 1,
1.251774, 0.6110876, 0.9413575, 1, 0, 0, 1, 1,
1.262104, 0.1850618, 0.6062596, 1, 0, 0, 1, 1,
1.262134, 1.432004, 2.880526, 1, 0, 0, 1, 1,
1.264667, 1.529444, 0.9503548, 1, 0, 0, 1, 1,
1.273685, 0.2753132, -0.6899492, 0, 0, 0, 1, 1,
1.292007, -0.3313701, 3.616541, 0, 0, 0, 1, 1,
1.298789, 0.7976843, 1.365898, 0, 0, 0, 1, 1,
1.300592, 0.1603247, 1.341779, 0, 0, 0, 1, 1,
1.302433, 0.8674377, -0.5475516, 0, 0, 0, 1, 1,
1.306721, -0.128669, 1.244725, 0, 0, 0, 1, 1,
1.30709, -1.113521, 1.787217, 0, 0, 0, 1, 1,
1.31466, -0.6541826, 2.13588, 1, 1, 1, 1, 1,
1.322939, 1.807535, -0.5257049, 1, 1, 1, 1, 1,
1.329407, 1.290767, -0.8707444, 1, 1, 1, 1, 1,
1.33951, -0.780385, 2.539612, 1, 1, 1, 1, 1,
1.347242, 0.2122408, 1.269302, 1, 1, 1, 1, 1,
1.352324, -1.322636, 1.108125, 1, 1, 1, 1, 1,
1.358213, -1.184381, 2.957998, 1, 1, 1, 1, 1,
1.361241, -0.1806245, 0.3121458, 1, 1, 1, 1, 1,
1.370498, -1.403779, 1.212966, 1, 1, 1, 1, 1,
1.375264, -0.8734214, 1.278562, 1, 1, 1, 1, 1,
1.376626, -0.5133425, 1.254528, 1, 1, 1, 1, 1,
1.377407, -0.587872, 0.9593961, 1, 1, 1, 1, 1,
1.378553, -0.118022, 1.781594, 1, 1, 1, 1, 1,
1.379793, -1.429659, 2.724886, 1, 1, 1, 1, 1,
1.381541, -0.4401223, 1.95079, 1, 1, 1, 1, 1,
1.383767, 0.7617252, 2.684561, 0, 0, 1, 1, 1,
1.384337, -2.643179, 2.821676, 1, 0, 0, 1, 1,
1.391376, -0.7811533, 1.955331, 1, 0, 0, 1, 1,
1.410606, -0.3173424, 2.899224, 1, 0, 0, 1, 1,
1.417052, -0.04997136, 2.524774, 1, 0, 0, 1, 1,
1.454926, 0.4575956, 1.550848, 1, 0, 0, 1, 1,
1.457395, -0.1977191, 1.503289, 0, 0, 0, 1, 1,
1.459179, 1.425526, 0.06898737, 0, 0, 0, 1, 1,
1.485187, 0.1542782, 1.959985, 0, 0, 0, 1, 1,
1.496039, 1.15019, 0.7103492, 0, 0, 0, 1, 1,
1.498583, 0.727502, 2.881896, 0, 0, 0, 1, 1,
1.498828, 0.1665316, 3.014186, 0, 0, 0, 1, 1,
1.506645, -0.2091538, 1.776123, 0, 0, 0, 1, 1,
1.509464, -1.075047, 2.481566, 1, 1, 1, 1, 1,
1.510243, 0.9863212, 1.696894, 1, 1, 1, 1, 1,
1.512071, 0.4336948, 0.8498251, 1, 1, 1, 1, 1,
1.537531, -2.377033, 1.715173, 1, 1, 1, 1, 1,
1.538988, -0.5803731, 1.669061, 1, 1, 1, 1, 1,
1.547835, -0.2073552, 1.328447, 1, 1, 1, 1, 1,
1.547871, -0.8203881, 3.484444, 1, 1, 1, 1, 1,
1.554053, 0.1429386, 1.891335, 1, 1, 1, 1, 1,
1.565655, 0.2108487, 1.430784, 1, 1, 1, 1, 1,
1.570332, 1.056575, 0.03970257, 1, 1, 1, 1, 1,
1.57084, -1.395506, 2.581303, 1, 1, 1, 1, 1,
1.574867, -0.5230486, 2.626991, 1, 1, 1, 1, 1,
1.581853, -0.4190308, 1.837538, 1, 1, 1, 1, 1,
1.589188, 0.6523884, 2.308783, 1, 1, 1, 1, 1,
1.591367, -1.017332, 2.597257, 1, 1, 1, 1, 1,
1.592164, -0.7652498, 1.274217, 0, 0, 1, 1, 1,
1.598921, -0.01923416, 2.668708, 1, 0, 0, 1, 1,
1.632719, -0.4962944, 1.50059, 1, 0, 0, 1, 1,
1.642668, -1.13026, 1.229746, 1, 0, 0, 1, 1,
1.655859, -0.9891039, 1.486812, 1, 0, 0, 1, 1,
1.672108, 0.5792043, 1.96936, 1, 0, 0, 1, 1,
1.675323, -0.6130996, 2.07986, 0, 0, 0, 1, 1,
1.711714, -0.9623854, 2.610728, 0, 0, 0, 1, 1,
1.720566, -0.08261906, 2.82046, 0, 0, 0, 1, 1,
1.723309, -0.5657309, 1.738296, 0, 0, 0, 1, 1,
1.7235, -1.013266, 1.281819, 0, 0, 0, 1, 1,
1.743385, 0.3669788, 0.1786407, 0, 0, 0, 1, 1,
1.749809, 0.01194953, 0.7648932, 0, 0, 0, 1, 1,
1.754969, -0.345557, 3.254112, 1, 1, 1, 1, 1,
1.756254, -0.1537161, 2.302345, 1, 1, 1, 1, 1,
1.756472, -1.097848, 3.474252, 1, 1, 1, 1, 1,
1.761521, -0.2626576, 1.355508, 1, 1, 1, 1, 1,
1.777894, 0.1360011, 1.001062, 1, 1, 1, 1, 1,
1.800772, 2.267539, 1.333313, 1, 1, 1, 1, 1,
1.802017, 0.5573487, 1.559303, 1, 1, 1, 1, 1,
1.821986, 0.3840474, -0.09763225, 1, 1, 1, 1, 1,
1.826025, -0.8527792, 0.5660706, 1, 1, 1, 1, 1,
1.833248, 1.042428, 0.7049338, 1, 1, 1, 1, 1,
1.839713, 0.7050002, 0.9449661, 1, 1, 1, 1, 1,
1.859925, 1.524181, 1.198071, 1, 1, 1, 1, 1,
1.888119, 0.6657823, 0.7529631, 1, 1, 1, 1, 1,
1.894269, 1.435255, 1.689647, 1, 1, 1, 1, 1,
1.946194, 0.4286605, 1.097136, 1, 1, 1, 1, 1,
1.988777, -0.8841885, 0.9403738, 0, 0, 1, 1, 1,
2.007379, 1.181566, 0.5627162, 1, 0, 0, 1, 1,
2.022385, -0.3320279, 1.546019, 1, 0, 0, 1, 1,
2.05371, 0.2202032, 3.539393, 1, 0, 0, 1, 1,
2.064922, -1.771569, 0.9918268, 1, 0, 0, 1, 1,
2.215505, -0.3852656, 1.555028, 1, 0, 0, 1, 1,
2.279341, -0.8380754, 2.281958, 0, 0, 0, 1, 1,
2.286654, -0.6907384, 1.836878, 0, 0, 0, 1, 1,
2.289332, -1.619743, 1.594284, 0, 0, 0, 1, 1,
2.297771, 0.7195699, -0.1732981, 0, 0, 0, 1, 1,
2.319996, 0.7551939, 1.423881, 0, 0, 0, 1, 1,
2.335923, 0.4265622, 1.324534, 0, 0, 0, 1, 1,
2.347196, -1.384879, 2.144774, 0, 0, 0, 1, 1,
2.352936, -0.06004854, 1.480648, 1, 1, 1, 1, 1,
2.374376, 1.650985, 2.878741, 1, 1, 1, 1, 1,
2.402136, 0.1125859, 2.541162, 1, 1, 1, 1, 1,
2.619465, -0.05133057, 1.328252, 1, 1, 1, 1, 1,
2.674787, -0.2784019, 1.200029, 1, 1, 1, 1, 1,
3.003402, 0.9879698, 0.2702333, 1, 1, 1, 1, 1,
3.558295, -0.1635061, 1.521568, 1, 1, 1, 1, 1
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
var radius = 9.94052;
var distance = 34.91566;
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
mvMatrix.translate( -0.09138489, 0.4227123, -0.2736547 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.91566);
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
