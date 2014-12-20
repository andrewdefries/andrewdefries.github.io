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
-3.432628, 0.5371626, -0.9351839, 1, 0, 0, 1,
-3.40639, -0.3879672, -2.715344, 1, 0.007843138, 0, 1,
-3.383833, 0.2577302, 0.01145552, 1, 0.01176471, 0, 1,
-3.251348, -1.375783, -3.592209, 1, 0.01960784, 0, 1,
-3.127633, -0.7687556, -0.5304312, 1, 0.02352941, 0, 1,
-3.07695, -0.2437696, -1.823599, 1, 0.03137255, 0, 1,
-2.852661, -0.1220298, -1.804874, 1, 0.03529412, 0, 1,
-2.816257, 0.9802245, 0.2432507, 1, 0.04313726, 0, 1,
-2.637433, 0.3479065, -1.343932, 1, 0.04705882, 0, 1,
-2.539193, 0.3800026, -2.167055, 1, 0.05490196, 0, 1,
-2.411615, 0.1305433, -2.393188, 1, 0.05882353, 0, 1,
-2.322392, -1.023505, -0.7090966, 1, 0.06666667, 0, 1,
-2.320709, 0.4122024, -0.8432332, 1, 0.07058824, 0, 1,
-2.296443, 1.035196, -0.6188266, 1, 0.07843138, 0, 1,
-2.285998, 2.725745, -0.2116927, 1, 0.08235294, 0, 1,
-2.283698, -0.1039621, -3.809279, 1, 0.09019608, 0, 1,
-2.215272, 0.2756674, -2.508008, 1, 0.09411765, 0, 1,
-2.201258, 0.1713111, -1.71332, 1, 0.1019608, 0, 1,
-2.190963, 1.085714, -1.022982, 1, 0.1098039, 0, 1,
-2.118409, -0.009238873, -1.679623, 1, 0.1137255, 0, 1,
-2.098602, -0.5097915, -0.8000774, 1, 0.1215686, 0, 1,
-2.057129, -0.2627797, -1.546028, 1, 0.1254902, 0, 1,
-2.053005, -0.3250321, -1.035464, 1, 0.1333333, 0, 1,
-2.025743, -0.08706791, -1.013204, 1, 0.1372549, 0, 1,
-2.019657, -0.03431866, -1.305971, 1, 0.145098, 0, 1,
-2.017535, -1.058267, -2.363933, 1, 0.1490196, 0, 1,
-1.998836, -0.5149177, -1.947725, 1, 0.1568628, 0, 1,
-1.995351, 1.36918, 0.3702779, 1, 0.1607843, 0, 1,
-1.988782, -1.119626, -2.20521, 1, 0.1686275, 0, 1,
-1.977851, -0.1288615, -2.964857, 1, 0.172549, 0, 1,
-1.971094, -0.7464, -3.208034, 1, 0.1803922, 0, 1,
-1.937608, 0.05059779, -3.196808, 1, 0.1843137, 0, 1,
-1.908708, -0.4941778, -0.2278664, 1, 0.1921569, 0, 1,
-1.905225, -0.4801117, -1.112973, 1, 0.1960784, 0, 1,
-1.878555, 1.450682, -1.040229, 1, 0.2039216, 0, 1,
-1.874122, 0.16286, -0.1992064, 1, 0.2117647, 0, 1,
-1.87229, -0.3395576, -2.4182, 1, 0.2156863, 0, 1,
-1.849975, -1.646246, -1.275307, 1, 0.2235294, 0, 1,
-1.838229, 1.565748, 0.5386846, 1, 0.227451, 0, 1,
-1.834156, 1.834898, -1.040428, 1, 0.2352941, 0, 1,
-1.833409, 0.3805428, -2.228668, 1, 0.2392157, 0, 1,
-1.805745, 0.01895715, -1.149871, 1, 0.2470588, 0, 1,
-1.799543, 0.3727038, -1.461433, 1, 0.2509804, 0, 1,
-1.775539, 0.1676964, -2.455218, 1, 0.2588235, 0, 1,
-1.7652, 0.9452925, -1.126842, 1, 0.2627451, 0, 1,
-1.765021, 0.04566927, -0.3473708, 1, 0.2705882, 0, 1,
-1.755464, -0.9115675, -1.103092, 1, 0.2745098, 0, 1,
-1.750815, -1.04618, -2.678804, 1, 0.282353, 0, 1,
-1.750552, 1.046698, -0.6277308, 1, 0.2862745, 0, 1,
-1.74895, -0.4699751, -1.685449, 1, 0.2941177, 0, 1,
-1.734794, -0.6006611, -2.049262, 1, 0.3019608, 0, 1,
-1.728524, -2.706635, -4.908676, 1, 0.3058824, 0, 1,
-1.723909, -1.323161, -1.48493, 1, 0.3137255, 0, 1,
-1.721945, -0.7934981, -3.511798, 1, 0.3176471, 0, 1,
-1.720285, 0.5224788, -0.5659093, 1, 0.3254902, 0, 1,
-1.717914, 0.0657134, -2.005175, 1, 0.3294118, 0, 1,
-1.714031, -1.117195, -0.7469062, 1, 0.3372549, 0, 1,
-1.699357, 0.2096422, -1.770694, 1, 0.3411765, 0, 1,
-1.689895, 1.85532, -0.3898987, 1, 0.3490196, 0, 1,
-1.676518, -0.9509298, -3.307718, 1, 0.3529412, 0, 1,
-1.674349, -0.02049686, -0.5934035, 1, 0.3607843, 0, 1,
-1.666191, 1.040331, -1.30935, 1, 0.3647059, 0, 1,
-1.660334, 2.662894, 1.48852, 1, 0.372549, 0, 1,
-1.658357, -1.835859, -4.767723, 1, 0.3764706, 0, 1,
-1.648366, -1.176691, -3.478462, 1, 0.3843137, 0, 1,
-1.645282, -1.481441, -1.970972, 1, 0.3882353, 0, 1,
-1.640195, 1.228853, -0.6906985, 1, 0.3960784, 0, 1,
-1.638714, 0.03638885, -2.089687, 1, 0.4039216, 0, 1,
-1.633873, -0.706863, -2.042558, 1, 0.4078431, 0, 1,
-1.633407, -0.4078595, -2.338243, 1, 0.4156863, 0, 1,
-1.611324, -0.5044172, -2.364439, 1, 0.4196078, 0, 1,
-1.599128, 0.239669, -2.263696, 1, 0.427451, 0, 1,
-1.594611, -0.6743391, 0.673502, 1, 0.4313726, 0, 1,
-1.591934, 1.981947, -0.7372864, 1, 0.4392157, 0, 1,
-1.578463, -0.4592682, -2.424108, 1, 0.4431373, 0, 1,
-1.570302, 0.5944635, -0.3956093, 1, 0.4509804, 0, 1,
-1.568, -0.3741514, -0.2743106, 1, 0.454902, 0, 1,
-1.564621, -0.867844, -1.548939, 1, 0.4627451, 0, 1,
-1.552073, 3.001132, 0.124228, 1, 0.4666667, 0, 1,
-1.545207, 1.472052, 0.1887588, 1, 0.4745098, 0, 1,
-1.540618, -0.2309177, -1.820563, 1, 0.4784314, 0, 1,
-1.53578, 0.8464865, -0.6736012, 1, 0.4862745, 0, 1,
-1.532041, 2.798155, -0.1104454, 1, 0.4901961, 0, 1,
-1.523547, -0.5845861, -2.170307, 1, 0.4980392, 0, 1,
-1.518112, -0.6721875, -3.1336, 1, 0.5058824, 0, 1,
-1.500152, 0.35767, -1.018874, 1, 0.509804, 0, 1,
-1.497042, -0.4558376, -1.136621, 1, 0.5176471, 0, 1,
-1.488115, -0.1318791, -1.786996, 1, 0.5215687, 0, 1,
-1.473602, -0.6682937, -1.960372, 1, 0.5294118, 0, 1,
-1.461995, -1.087394, -3.563801, 1, 0.5333334, 0, 1,
-1.448825, -0.7005816, -2.344934, 1, 0.5411765, 0, 1,
-1.446317, -0.9141808, -3.387176, 1, 0.5450981, 0, 1,
-1.442038, 0.2570096, -2.674942, 1, 0.5529412, 0, 1,
-1.440079, 0.2422935, -2.849803, 1, 0.5568628, 0, 1,
-1.438217, 0.183258, -2.496264, 1, 0.5647059, 0, 1,
-1.419972, 0.56378, -2.128444, 1, 0.5686275, 0, 1,
-1.414949, -1.840116, -3.232337, 1, 0.5764706, 0, 1,
-1.401526, 0.9204314, -0.7074775, 1, 0.5803922, 0, 1,
-1.393426, -1.239644, -2.980166, 1, 0.5882353, 0, 1,
-1.385387, -0.134166, -2.276493, 1, 0.5921569, 0, 1,
-1.376252, 0.5986441, -1.203925, 1, 0.6, 0, 1,
-1.372806, -0.9580292, -3.096475, 1, 0.6078432, 0, 1,
-1.357094, 0.6466518, -0.5518878, 1, 0.6117647, 0, 1,
-1.352464, -0.1695605, -0.641612, 1, 0.6196079, 0, 1,
-1.342839, -0.5439718, -0.5677513, 1, 0.6235294, 0, 1,
-1.334355, -1.571664, -1.558428, 1, 0.6313726, 0, 1,
-1.332644, 1.198861, -0.2239929, 1, 0.6352941, 0, 1,
-1.324284, 0.9170452, -1.384256, 1, 0.6431373, 0, 1,
-1.322619, 0.2697318, -2.71577, 1, 0.6470588, 0, 1,
-1.321991, -0.5303084, -1.651663, 1, 0.654902, 0, 1,
-1.321087, -0.1645068, -3.527334, 1, 0.6588235, 0, 1,
-1.318558, -1.051248, -1.620299, 1, 0.6666667, 0, 1,
-1.313833, 1.505766, -0.3619766, 1, 0.6705883, 0, 1,
-1.307873, 1.470406, 0.03269907, 1, 0.6784314, 0, 1,
-1.307862, -1.361153, -2.842903, 1, 0.682353, 0, 1,
-1.303734, -1.024295, -3.146168, 1, 0.6901961, 0, 1,
-1.303447, 0.5251879, -0.2205077, 1, 0.6941177, 0, 1,
-1.296632, 0.1524082, -1.374676, 1, 0.7019608, 0, 1,
-1.289304, 0.8005356, -2.135721, 1, 0.7098039, 0, 1,
-1.271545, -1.068987, -1.338443, 1, 0.7137255, 0, 1,
-1.260092, 0.1184975, -1.473851, 1, 0.7215686, 0, 1,
-1.255584, -0.5910363, 0.7663884, 1, 0.7254902, 0, 1,
-1.247751, -0.2329521, -1.000916, 1, 0.7333333, 0, 1,
-1.237478, -0.7819282, -3.61678, 1, 0.7372549, 0, 1,
-1.237057, -0.8950907, -0.9918309, 1, 0.7450981, 0, 1,
-1.225611, 1.568683, -1.050122, 1, 0.7490196, 0, 1,
-1.224907, -0.5314389, -3.060074, 1, 0.7568628, 0, 1,
-1.221418, 0.1773861, 0.4935651, 1, 0.7607843, 0, 1,
-1.213851, -2.01211, -1.353126, 1, 0.7686275, 0, 1,
-1.212028, 1.198035, -1.550314, 1, 0.772549, 0, 1,
-1.210172, -0.2214034, -2.987451, 1, 0.7803922, 0, 1,
-1.209552, -0.742682, -1.313301, 1, 0.7843137, 0, 1,
-1.209259, -0.6806091, -2.083204, 1, 0.7921569, 0, 1,
-1.195557, 1.2836, 0.7356465, 1, 0.7960784, 0, 1,
-1.184885, 0.4035197, -2.259301, 1, 0.8039216, 0, 1,
-1.179374, 1.376225, 0.2828157, 1, 0.8117647, 0, 1,
-1.178994, 0.6105497, -0.751739, 1, 0.8156863, 0, 1,
-1.178041, 0.6959313, -0.5577327, 1, 0.8235294, 0, 1,
-1.177999, 0.7969481, -0.422375, 1, 0.827451, 0, 1,
-1.169878, -1.549435, -1.186496, 1, 0.8352941, 0, 1,
-1.16881, 0.9118729, -1.025021, 1, 0.8392157, 0, 1,
-1.168653, -1.499408, -2.974787, 1, 0.8470588, 0, 1,
-1.16815, -0.1184879, -0.8940736, 1, 0.8509804, 0, 1,
-1.167326, 1.331759, -1.666997, 1, 0.8588235, 0, 1,
-1.149475, -0.7219527, -1.477916, 1, 0.8627451, 0, 1,
-1.147226, -0.1039198, -1.043296, 1, 0.8705882, 0, 1,
-1.145682, -0.7264906, -2.920526, 1, 0.8745098, 0, 1,
-1.134653, 0.5379262, -0.600152, 1, 0.8823529, 0, 1,
-1.132275, -0.6723104, -1.835787, 1, 0.8862745, 0, 1,
-1.123731, -1.043049, -2.674716, 1, 0.8941177, 0, 1,
-1.122885, -0.3970656, -0.1207753, 1, 0.8980392, 0, 1,
-1.117266, -2.723807, -2.51008, 1, 0.9058824, 0, 1,
-1.116383, -0.01896061, -1.007865, 1, 0.9137255, 0, 1,
-1.088218, -0.8322652, -1.592711, 1, 0.9176471, 0, 1,
-1.081298, -0.4459225, -3.486001, 1, 0.9254902, 0, 1,
-1.08021, -0.5449419, -1.999563, 1, 0.9294118, 0, 1,
-1.075796, -0.1007062, -0.5472146, 1, 0.9372549, 0, 1,
-1.069777, 0.04962622, -1.977314, 1, 0.9411765, 0, 1,
-1.069454, -1.394805, -2.685493, 1, 0.9490196, 0, 1,
-1.053804, 1.088105, -0.7591035, 1, 0.9529412, 0, 1,
-1.050927, 0.8818374, 1.680379, 1, 0.9607843, 0, 1,
-1.050689, 1.925372, -1.216109, 1, 0.9647059, 0, 1,
-1.045373, 0.07571855, -1.337257, 1, 0.972549, 0, 1,
-1.040982, -2.224999, -3.465693, 1, 0.9764706, 0, 1,
-1.040766, 2.363251, 1.353139, 1, 0.9843137, 0, 1,
-1.039397, 2.041101, -1.319096, 1, 0.9882353, 0, 1,
-1.033486, 1.542681, -0.7085907, 1, 0.9960784, 0, 1,
-1.033424, 0.3339539, -1.763921, 0.9960784, 1, 0, 1,
-1.028624, -0.1199882, -0.4138357, 0.9921569, 1, 0, 1,
-1.027868, 0.8659458, 0.6871417, 0.9843137, 1, 0, 1,
-1.025127, 1.399338, 0.3697937, 0.9803922, 1, 0, 1,
-1.022236, -0.4919882, -1.704145, 0.972549, 1, 0, 1,
-1.020813, -1.124563, -3.520219, 0.9686275, 1, 0, 1,
-1.015552, 1.267488, 0.519316, 0.9607843, 1, 0, 1,
-1.011868, 0.6459796, -0.5074691, 0.9568627, 1, 0, 1,
-1.006036, 0.2065712, -1.454141, 0.9490196, 1, 0, 1,
-1.005413, 0.2523212, -1.412954, 0.945098, 1, 0, 1,
-1.001351, -0.949253, -2.586271, 0.9372549, 1, 0, 1,
-0.9996647, 0.5477492, -0.4151632, 0.9333333, 1, 0, 1,
-0.9956306, 0.2685207, -2.972846, 0.9254902, 1, 0, 1,
-0.9932915, 0.2802303, -2.119203, 0.9215686, 1, 0, 1,
-0.9897, 0.789235, -1.738641, 0.9137255, 1, 0, 1,
-0.9892066, -0.9782034, -2.367555, 0.9098039, 1, 0, 1,
-0.9871309, -0.3983101, -1.388713, 0.9019608, 1, 0, 1,
-0.9846569, -0.9367648, -2.030141, 0.8941177, 1, 0, 1,
-0.9827084, 0.08638753, 0.1044395, 0.8901961, 1, 0, 1,
-0.9751598, 0.2266137, -1.733025, 0.8823529, 1, 0, 1,
-0.9692321, 0.8714288, 0.03130747, 0.8784314, 1, 0, 1,
-0.9668033, -0.3103826, -2.352342, 0.8705882, 1, 0, 1,
-0.9664361, -0.4472027, -2.349165, 0.8666667, 1, 0, 1,
-0.9640624, -1.071211, -2.118539, 0.8588235, 1, 0, 1,
-0.9633384, 0.8375326, -1.028401, 0.854902, 1, 0, 1,
-0.959268, -0.6379863, -1.656277, 0.8470588, 1, 0, 1,
-0.9550024, 0.5279812, -1.824528, 0.8431373, 1, 0, 1,
-0.952041, 0.3384681, -0.4960797, 0.8352941, 1, 0, 1,
-0.9518402, 0.5502967, -3.001858, 0.8313726, 1, 0, 1,
-0.9516959, 0.2907176, -0.2183279, 0.8235294, 1, 0, 1,
-0.9469814, 0.4673513, -2.561261, 0.8196079, 1, 0, 1,
-0.9398272, -0.801187, -1.593808, 0.8117647, 1, 0, 1,
-0.9384649, 0.07057441, -1.576306, 0.8078431, 1, 0, 1,
-0.9331778, 0.8749734, -0.4968044, 0.8, 1, 0, 1,
-0.9302896, 0.5358579, -0.2329622, 0.7921569, 1, 0, 1,
-0.925384, -0.3295212, -2.471954, 0.7882353, 1, 0, 1,
-0.921129, -0.3495943, -1.383091, 0.7803922, 1, 0, 1,
-0.9182008, 0.4183249, -0.1495236, 0.7764706, 1, 0, 1,
-0.9165245, -0.9026496, -3.486845, 0.7686275, 1, 0, 1,
-0.9137683, -1.229402, -0.499543, 0.7647059, 1, 0, 1,
-0.9135854, 0.3691477, 0.3328848, 0.7568628, 1, 0, 1,
-0.9068964, -0.471411, 0.5926299, 0.7529412, 1, 0, 1,
-0.9042979, -1.25148, -2.810452, 0.7450981, 1, 0, 1,
-0.9018924, -0.4225483, -1.223599, 0.7411765, 1, 0, 1,
-0.8947034, -0.6910589, -2.026549, 0.7333333, 1, 0, 1,
-0.8935592, -1.45011, -0.2851845, 0.7294118, 1, 0, 1,
-0.8905011, 0.05075812, -1.505188, 0.7215686, 1, 0, 1,
-0.8849973, -0.2654669, -3.229941, 0.7176471, 1, 0, 1,
-0.8824393, 0.4606266, -0.7778789, 0.7098039, 1, 0, 1,
-0.8821362, -2.828309, -3.868542, 0.7058824, 1, 0, 1,
-0.875588, 0.2720708, -3.115546, 0.6980392, 1, 0, 1,
-0.8739471, 1.101961, -0.6140918, 0.6901961, 1, 0, 1,
-0.8736636, -1.153997, -2.958199, 0.6862745, 1, 0, 1,
-0.8709275, -0.8558629, -2.849513, 0.6784314, 1, 0, 1,
-0.8680884, 1.089198, -0.3197455, 0.6745098, 1, 0, 1,
-0.8606243, 0.8773552, -0.6821923, 0.6666667, 1, 0, 1,
-0.850337, -0.8256789, -2.500764, 0.6627451, 1, 0, 1,
-0.8387923, 0.351916, -1.916564, 0.654902, 1, 0, 1,
-0.8382172, -0.4326611, -1.237578, 0.6509804, 1, 0, 1,
-0.8337425, 0.5015126, -1.118333, 0.6431373, 1, 0, 1,
-0.8324604, -0.9000197, -1.546044, 0.6392157, 1, 0, 1,
-0.8310188, 1.361069, 0.5629114, 0.6313726, 1, 0, 1,
-0.8266439, 0.4577626, -2.232192, 0.627451, 1, 0, 1,
-0.8241377, -2.290281, -3.190967, 0.6196079, 1, 0, 1,
-0.8209155, -0.363115, -2.374234, 0.6156863, 1, 0, 1,
-0.813672, -1.125823, -3.355716, 0.6078432, 1, 0, 1,
-0.8054761, 0.3539943, -0.07294487, 0.6039216, 1, 0, 1,
-0.7904139, -0.5432059, -1.477651, 0.5960785, 1, 0, 1,
-0.7900484, -0.2414627, -3.81724, 0.5882353, 1, 0, 1,
-0.788514, 1.681635, -0.1267324, 0.5843138, 1, 0, 1,
-0.7874399, -1.014806, -2.894214, 0.5764706, 1, 0, 1,
-0.785304, -0.2772917, -2.077425, 0.572549, 1, 0, 1,
-0.7834983, 1.499769, -1.221565, 0.5647059, 1, 0, 1,
-0.77969, -1.25221, -2.853749, 0.5607843, 1, 0, 1,
-0.7792845, 0.8242795, 1.123417, 0.5529412, 1, 0, 1,
-0.7724606, 1.262361, 0.06821686, 0.5490196, 1, 0, 1,
-0.7605025, -1.659598, -2.839997, 0.5411765, 1, 0, 1,
-0.7474181, -0.3625364, -2.07621, 0.5372549, 1, 0, 1,
-0.7469904, 0.3280102, -0.3232725, 0.5294118, 1, 0, 1,
-0.7468993, 0.4186896, 0.4383106, 0.5254902, 1, 0, 1,
-0.7434396, 1.260203, -0.005103552, 0.5176471, 1, 0, 1,
-0.7395025, -0.3644698, -2.454023, 0.5137255, 1, 0, 1,
-0.7356431, -1.008881, -3.724768, 0.5058824, 1, 0, 1,
-0.7275574, -0.2245724, -3.561936, 0.5019608, 1, 0, 1,
-0.7192883, -1.137357, -4.3062, 0.4941176, 1, 0, 1,
-0.7120334, -0.3261579, 0.2256484, 0.4862745, 1, 0, 1,
-0.7117926, -0.4074216, -2.608908, 0.4823529, 1, 0, 1,
-0.710872, 0.4981457, 0.1364239, 0.4745098, 1, 0, 1,
-0.7105628, 1.079897, -0.6428378, 0.4705882, 1, 0, 1,
-0.7101611, -1.344234, -4.302845, 0.4627451, 1, 0, 1,
-0.7095451, -0.6640185, -2.344543, 0.4588235, 1, 0, 1,
-0.7095308, -0.03873821, -1.951563, 0.4509804, 1, 0, 1,
-0.7025957, 0.2727289, -0.7969639, 0.4470588, 1, 0, 1,
-0.7007944, 0.3493671, -3.43802, 0.4392157, 1, 0, 1,
-0.6999065, 0.445498, -0.7369333, 0.4352941, 1, 0, 1,
-0.6985589, -2.068988, -2.15011, 0.427451, 1, 0, 1,
-0.6950981, -0.739978, -1.551602, 0.4235294, 1, 0, 1,
-0.6910959, -0.8324605, -2.951454, 0.4156863, 1, 0, 1,
-0.6894678, -0.06738291, -1.532241, 0.4117647, 1, 0, 1,
-0.6886186, 0.1249608, -1.209468, 0.4039216, 1, 0, 1,
-0.6858237, -0.3449712, -2.647051, 0.3960784, 1, 0, 1,
-0.6798536, 1.018119, -2.103619, 0.3921569, 1, 0, 1,
-0.677845, 0.005304768, -2.454604, 0.3843137, 1, 0, 1,
-0.6769736, -0.1665216, -0.9190508, 0.3803922, 1, 0, 1,
-0.6761487, -1.319007, -1.838995, 0.372549, 1, 0, 1,
-0.6713879, -1.425778, -3.180598, 0.3686275, 1, 0, 1,
-0.6693704, 0.03250493, -1.562304, 0.3607843, 1, 0, 1,
-0.6655967, 1.333015, 0.09965146, 0.3568628, 1, 0, 1,
-0.6622043, -0.5999923, -0.3265733, 0.3490196, 1, 0, 1,
-0.6616562, -0.8272808, -1.154882, 0.345098, 1, 0, 1,
-0.6603871, 0.9165285, -1.582922, 0.3372549, 1, 0, 1,
-0.6554551, -0.321722, -2.552961, 0.3333333, 1, 0, 1,
-0.6545383, -0.6862119, -2.756439, 0.3254902, 1, 0, 1,
-0.652881, 1.250992, -0.2852963, 0.3215686, 1, 0, 1,
-0.6520836, 0.06563133, -0.7045396, 0.3137255, 1, 0, 1,
-0.6487601, -0.1295781, -2.174728, 0.3098039, 1, 0, 1,
-0.6486205, -0.7313034, -2.024529, 0.3019608, 1, 0, 1,
-0.6473416, -0.6005212, 0.07123107, 0.2941177, 1, 0, 1,
-0.6440257, -1.574025, -4.304887, 0.2901961, 1, 0, 1,
-0.6425309, -1.583474, -2.878404, 0.282353, 1, 0, 1,
-0.6407617, -0.5989218, -1.694745, 0.2784314, 1, 0, 1,
-0.6403316, 1.011838, -1.284456, 0.2705882, 1, 0, 1,
-0.6401835, -1.558461, -2.538763, 0.2666667, 1, 0, 1,
-0.627582, -2.784586, -3.650969, 0.2588235, 1, 0, 1,
-0.6250747, 0.6643857, -2.176028, 0.254902, 1, 0, 1,
-0.6221439, -0.3265016, -2.797849, 0.2470588, 1, 0, 1,
-0.6199661, 3.224206, 0.04651884, 0.2431373, 1, 0, 1,
-0.6169367, 0.4679279, 0.649868, 0.2352941, 1, 0, 1,
-0.6152542, 0.9704689, -0.6581075, 0.2313726, 1, 0, 1,
-0.6148052, -0.1005051, -2.24129, 0.2235294, 1, 0, 1,
-0.6126892, -0.8682494, -2.40016, 0.2196078, 1, 0, 1,
-0.6108945, -0.9772211, -2.416898, 0.2117647, 1, 0, 1,
-0.6107694, 1.090809, 0.8663815, 0.2078431, 1, 0, 1,
-0.6107227, 0.9617872, 0.8903431, 0.2, 1, 0, 1,
-0.6043395, -0.7340332, -2.62654, 0.1921569, 1, 0, 1,
-0.6031386, -0.1402946, -1.010633, 0.1882353, 1, 0, 1,
-0.6025189, -1.78762, -1.65921, 0.1803922, 1, 0, 1,
-0.6017483, 0.9349667, -0.1237518, 0.1764706, 1, 0, 1,
-0.6001723, 1.000044, -1.762115, 0.1686275, 1, 0, 1,
-0.5909815, -0.3247956, -0.1295938, 0.1647059, 1, 0, 1,
-0.5905317, 0.3539209, -1.994757, 0.1568628, 1, 0, 1,
-0.5864763, -1.328838, -2.24435, 0.1529412, 1, 0, 1,
-0.5855417, 0.3216886, -0.7523949, 0.145098, 1, 0, 1,
-0.585201, -0.215817, -1.050685, 0.1411765, 1, 0, 1,
-0.5814481, 0.9531296, -0.9863511, 0.1333333, 1, 0, 1,
-0.5807095, 1.226634, -0.814665, 0.1294118, 1, 0, 1,
-0.5800489, 0.5998821, -2.039789, 0.1215686, 1, 0, 1,
-0.5790337, 0.4263384, -1.059762, 0.1176471, 1, 0, 1,
-0.5769552, -1.007707, -2.734255, 0.1098039, 1, 0, 1,
-0.5745789, -0.3347962, -0.5307385, 0.1058824, 1, 0, 1,
-0.5665613, 0.9122453, 0.4555381, 0.09803922, 1, 0, 1,
-0.5664418, -0.8774442, -3.412076, 0.09019608, 1, 0, 1,
-0.5637671, 0.4750518, -0.4975021, 0.08627451, 1, 0, 1,
-0.5614566, 0.4528767, -2.203384, 0.07843138, 1, 0, 1,
-0.5595074, 0.3448977, 0.3303312, 0.07450981, 1, 0, 1,
-0.5565537, 0.7290009, -1.456582, 0.06666667, 1, 0, 1,
-0.5537892, -0.06140225, -1.365319, 0.0627451, 1, 0, 1,
-0.5510989, 2.108794, -0.5740356, 0.05490196, 1, 0, 1,
-0.548737, -0.4967651, -2.561719, 0.05098039, 1, 0, 1,
-0.5475563, -0.7646253, -3.191662, 0.04313726, 1, 0, 1,
-0.5434846, -1.75086, -1.823984, 0.03921569, 1, 0, 1,
-0.5403564, -0.4844615, -3.346651, 0.03137255, 1, 0, 1,
-0.5371606, 1.2503, 0.3898482, 0.02745098, 1, 0, 1,
-0.5365366, -0.6724394, -4.874225, 0.01960784, 1, 0, 1,
-0.5355006, -0.7197949, -2.901817, 0.01568628, 1, 0, 1,
-0.5353805, -0.2487755, -1.895834, 0.007843138, 1, 0, 1,
-0.5346515, -0.1500022, -1.725626, 0.003921569, 1, 0, 1,
-0.5288925, 1.044434, -0.7411755, 0, 1, 0.003921569, 1,
-0.5282317, -0.1088296, -1.764934, 0, 1, 0.01176471, 1,
-0.5273305, -0.716197, -2.545832, 0, 1, 0.01568628, 1,
-0.5261559, -0.9544711, -3.629918, 0, 1, 0.02352941, 1,
-0.5168568, -0.09024896, -0.4939219, 0, 1, 0.02745098, 1,
-0.5152651, -1.106348, -3.142051, 0, 1, 0.03529412, 1,
-0.5146884, -0.7730072, -2.730519, 0, 1, 0.03921569, 1,
-0.5117317, 0.04440454, -2.067614, 0, 1, 0.04705882, 1,
-0.5063933, 1.839693, -2.139948, 0, 1, 0.05098039, 1,
-0.5061378, -0.3356512, -1.865741, 0, 1, 0.05882353, 1,
-0.5042258, -0.6885685, -2.795919, 0, 1, 0.0627451, 1,
-0.5033534, 1.611629, 0.1631114, 0, 1, 0.07058824, 1,
-0.5009861, 0.9344637, 0.2461647, 0, 1, 0.07450981, 1,
-0.4987529, -1.355938, -4.364084, 0, 1, 0.08235294, 1,
-0.4912686, -0.9158259, -3.510534, 0, 1, 0.08627451, 1,
-0.4880997, -1.768283, -2.063495, 0, 1, 0.09411765, 1,
-0.486546, 0.05495026, -1.347303, 0, 1, 0.1019608, 1,
-0.486455, -0.06579995, -0.9989809, 0, 1, 0.1058824, 1,
-0.4808141, 1.3246, -0.9763217, 0, 1, 0.1137255, 1,
-0.4749801, 1.263554, 0.3673384, 0, 1, 0.1176471, 1,
-0.4749565, -0.1949381, -4.403907, 0, 1, 0.1254902, 1,
-0.4743928, 0.4645683, -0.6871194, 0, 1, 0.1294118, 1,
-0.4716321, -0.04382056, -1.296438, 0, 1, 0.1372549, 1,
-0.4707027, -2.811887, -2.274858, 0, 1, 0.1411765, 1,
-0.4678177, -0.4744366, -0.9610685, 0, 1, 0.1490196, 1,
-0.4632595, 1.001419, -2.485924, 0, 1, 0.1529412, 1,
-0.4624323, 1.577511, -0.772756, 0, 1, 0.1607843, 1,
-0.4604134, -1.004998, -1.275841, 0, 1, 0.1647059, 1,
-0.4561681, -0.1061029, 1.226331, 0, 1, 0.172549, 1,
-0.4530116, -0.7364934, -2.70677, 0, 1, 0.1764706, 1,
-0.4516482, 0.669416, -0.8417528, 0, 1, 0.1843137, 1,
-0.4509002, -0.2810857, -2.012845, 0, 1, 0.1882353, 1,
-0.4500312, -0.02827636, -1.204498, 0, 1, 0.1960784, 1,
-0.4487014, -0.2335684, -3.757956, 0, 1, 0.2039216, 1,
-0.4469002, -0.5972279, -1.69868, 0, 1, 0.2078431, 1,
-0.4421856, 0.2658873, -1.729844, 0, 1, 0.2156863, 1,
-0.4408367, 0.5838614, 1.549066, 0, 1, 0.2196078, 1,
-0.4389294, -0.4337784, -2.371342, 0, 1, 0.227451, 1,
-0.4306312, -0.05013796, -0.7775391, 0, 1, 0.2313726, 1,
-0.430082, -0.5900925, -2.522385, 0, 1, 0.2392157, 1,
-0.4275143, 1.34286, 0.2134694, 0, 1, 0.2431373, 1,
-0.4240371, -1.639127, -2.243091, 0, 1, 0.2509804, 1,
-0.4210715, -0.797868, -2.566676, 0, 1, 0.254902, 1,
-0.4157086, 1.432248, -2.311844, 0, 1, 0.2627451, 1,
-0.4153264, 1.351635, 0.6764409, 0, 1, 0.2666667, 1,
-0.4138491, 0.1506761, -1.407807, 0, 1, 0.2745098, 1,
-0.4087448, -0.4813025, -2.832168, 0, 1, 0.2784314, 1,
-0.4056596, -0.5408019, -2.224857, 0, 1, 0.2862745, 1,
-0.4036534, -0.7368693, -2.958859, 0, 1, 0.2901961, 1,
-0.3941465, 1.168862, -2.133782, 0, 1, 0.2980392, 1,
-0.3918961, 0.3946441, -1.055169, 0, 1, 0.3058824, 1,
-0.382935, 0.0280703, -1.368644, 0, 1, 0.3098039, 1,
-0.3803631, 0.4524697, 0.9320011, 0, 1, 0.3176471, 1,
-0.379543, -1.423989, -1.10447, 0, 1, 0.3215686, 1,
-0.3782513, 1.485104, 1.25728, 0, 1, 0.3294118, 1,
-0.3768586, -1.884205, -3.620698, 0, 1, 0.3333333, 1,
-0.3746161, -0.211722, 0.4097579, 0, 1, 0.3411765, 1,
-0.3667682, -0.8977553, -1.157636, 0, 1, 0.345098, 1,
-0.3658167, -0.5688222, -1.463681, 0, 1, 0.3529412, 1,
-0.3654785, 0.4835229, -1.24019, 0, 1, 0.3568628, 1,
-0.3572805, -0.3091949, -2.654917, 0, 1, 0.3647059, 1,
-0.353383, 2.283489, -0.6390838, 0, 1, 0.3686275, 1,
-0.3469922, 1.492678, 1.226018, 0, 1, 0.3764706, 1,
-0.3464986, 0.6398453, -1.640295, 0, 1, 0.3803922, 1,
-0.3452499, -0.2103519, -1.963708, 0, 1, 0.3882353, 1,
-0.3445124, 0.3294746, -0.2543302, 0, 1, 0.3921569, 1,
-0.3429269, -0.3865021, -1.855151, 0, 1, 0.4, 1,
-0.3422828, 1.324018, 1.21736, 0, 1, 0.4078431, 1,
-0.3399625, 1.123962, 0.3110862, 0, 1, 0.4117647, 1,
-0.3286418, 0.001279378, -2.378295, 0, 1, 0.4196078, 1,
-0.3273782, 0.8700132, 0.5560942, 0, 1, 0.4235294, 1,
-0.3239114, 0.4362994, -1.855787, 0, 1, 0.4313726, 1,
-0.314626, 0.1793312, -0.531759, 0, 1, 0.4352941, 1,
-0.3102381, -0.3125486, -2.996323, 0, 1, 0.4431373, 1,
-0.3047428, 0.5318294, -1.372158, 0, 1, 0.4470588, 1,
-0.3039168, -1.09981, -1.278657, 0, 1, 0.454902, 1,
-0.3001421, -0.621801, -1.729223, 0, 1, 0.4588235, 1,
-0.2996572, 0.3145719, -0.2835217, 0, 1, 0.4666667, 1,
-0.2972872, 0.1969525, -1.564771, 0, 1, 0.4705882, 1,
-0.297232, 0.5980749, -0.6492186, 0, 1, 0.4784314, 1,
-0.29452, -0.4335747, -1.965842, 0, 1, 0.4823529, 1,
-0.2884636, -1.209488, -3.367525, 0, 1, 0.4901961, 1,
-0.2855135, -0.3695519, -2.06795, 0, 1, 0.4941176, 1,
-0.2851657, -2.333547, -3.991458, 0, 1, 0.5019608, 1,
-0.278532, -0.4436022, -3.428644, 0, 1, 0.509804, 1,
-0.2754998, 1.262374, 1.921078, 0, 1, 0.5137255, 1,
-0.2749594, 0.1699318, -1.197771, 0, 1, 0.5215687, 1,
-0.274829, 1.866691, 1.803478, 0, 1, 0.5254902, 1,
-0.2702108, 0.4412522, -0.5919287, 0, 1, 0.5333334, 1,
-0.2668214, 2.049318, 0.9747167, 0, 1, 0.5372549, 1,
-0.2664018, 0.1690272, -2.00078, 0, 1, 0.5450981, 1,
-0.2650788, 1.189812, -0.3994624, 0, 1, 0.5490196, 1,
-0.2616645, -1.162167, -1.873187, 0, 1, 0.5568628, 1,
-0.2612578, 0.1218228, -0.6483011, 0, 1, 0.5607843, 1,
-0.2610203, 2.491535, 1.073916, 0, 1, 0.5686275, 1,
-0.2608472, 1.184293, 0.5764418, 0, 1, 0.572549, 1,
-0.2603974, -1.842618, -3.305981, 0, 1, 0.5803922, 1,
-0.2584884, -0.2864213, -2.740072, 0, 1, 0.5843138, 1,
-0.2581631, -0.6326643, -2.080407, 0, 1, 0.5921569, 1,
-0.2548005, 1.352224, -0.5217216, 0, 1, 0.5960785, 1,
-0.2522035, 0.2267332, 0.1725192, 0, 1, 0.6039216, 1,
-0.2473109, 1.16847, -1.170186, 0, 1, 0.6117647, 1,
-0.2453766, -2.411322, -2.839918, 0, 1, 0.6156863, 1,
-0.2449711, 0.3972161, -1.583099, 0, 1, 0.6235294, 1,
-0.2436806, 0.3897196, -0.3051969, 0, 1, 0.627451, 1,
-0.242798, 1.010502, -1.578284, 0, 1, 0.6352941, 1,
-0.2425348, -1.491422, -1.923454, 0, 1, 0.6392157, 1,
-0.2370507, 0.3214635, -1.011755, 0, 1, 0.6470588, 1,
-0.2351802, 0.6089752, -0.9208487, 0, 1, 0.6509804, 1,
-0.2324148, 1.141852, 1.036121, 0, 1, 0.6588235, 1,
-0.2320847, 0.9633054, -0.6641366, 0, 1, 0.6627451, 1,
-0.2250183, -0.6739685, -3.783698, 0, 1, 0.6705883, 1,
-0.222062, -1.183742, -2.949927, 0, 1, 0.6745098, 1,
-0.2208947, -0.4633915, -2.036498, 0, 1, 0.682353, 1,
-0.2199632, 1.014498, 0.4949984, 0, 1, 0.6862745, 1,
-0.2166012, -0.5094609, -2.343737, 0, 1, 0.6941177, 1,
-0.2126623, 0.04350511, -2.322564, 0, 1, 0.7019608, 1,
-0.2112961, 1.009185, 1.743354, 0, 1, 0.7058824, 1,
-0.2099337, -0.796629, -4.866433, 0, 1, 0.7137255, 1,
-0.2079027, 0.05427378, -1.487699, 0, 1, 0.7176471, 1,
-0.2052972, -0.01884967, -3.173082, 0, 1, 0.7254902, 1,
-0.2031853, 1.461895, 0.2945603, 0, 1, 0.7294118, 1,
-0.2015137, -1.268157, -3.763624, 0, 1, 0.7372549, 1,
-0.1975731, 0.4386955, -0.256363, 0, 1, 0.7411765, 1,
-0.1906561, -0.3143035, -3.973722, 0, 1, 0.7490196, 1,
-0.1890858, 0.5667937, 1.240121, 0, 1, 0.7529412, 1,
-0.1872629, -0.2567866, -3.413323, 0, 1, 0.7607843, 1,
-0.178969, 0.6246245, 0.04046051, 0, 1, 0.7647059, 1,
-0.1695625, 0.3109866, -2.869611, 0, 1, 0.772549, 1,
-0.1692187, -0.1578124, -0.7947719, 0, 1, 0.7764706, 1,
-0.1659088, 1.601635, -0.5755179, 0, 1, 0.7843137, 1,
-0.1658519, 0.08216193, -2.019189, 0, 1, 0.7882353, 1,
-0.1647989, -0.01612217, -2.49543, 0, 1, 0.7960784, 1,
-0.1617616, -0.6561203, -2.632448, 0, 1, 0.8039216, 1,
-0.1611528, 1.545502, -0.6872825, 0, 1, 0.8078431, 1,
-0.1609413, -0.1359152, -3.255118, 0, 1, 0.8156863, 1,
-0.1573822, -2.250032, -2.847342, 0, 1, 0.8196079, 1,
-0.1492614, -1.544949, -2.395648, 0, 1, 0.827451, 1,
-0.1467824, 0.09087463, -1.659703, 0, 1, 0.8313726, 1,
-0.1452152, -0.1967458, -1.555118, 0, 1, 0.8392157, 1,
-0.1429708, -0.1728299, -1.215322, 0, 1, 0.8431373, 1,
-0.1411673, -0.9689398, -3.628272, 0, 1, 0.8509804, 1,
-0.1406594, 0.5397959, 0.3363744, 0, 1, 0.854902, 1,
-0.1396906, 0.3142292, -0.9885874, 0, 1, 0.8627451, 1,
-0.1379716, -0.949216, -3.71212, 0, 1, 0.8666667, 1,
-0.1377409, -0.3438618, -2.588649, 0, 1, 0.8745098, 1,
-0.1288877, -0.3318464, -2.050726, 0, 1, 0.8784314, 1,
-0.1284987, 1.150253, 0.447855, 0, 1, 0.8862745, 1,
-0.1251262, 1.762861, 0.1561203, 0, 1, 0.8901961, 1,
-0.1238221, -0.09601595, -1.553883, 0, 1, 0.8980392, 1,
-0.1196954, -1.652807, -2.683694, 0, 1, 0.9058824, 1,
-0.1147155, 0.4870144, 0.1915777, 0, 1, 0.9098039, 1,
-0.1138723, 0.7721035, -0.3191423, 0, 1, 0.9176471, 1,
-0.1102423, -0.4846948, -2.298522, 0, 1, 0.9215686, 1,
-0.1090599, -1.003538, -1.532237, 0, 1, 0.9294118, 1,
-0.1081699, 1.047609, -1.683493, 0, 1, 0.9333333, 1,
-0.1068764, 0.6162481, 0.5244925, 0, 1, 0.9411765, 1,
-0.1042444, 0.007154989, 0.4236326, 0, 1, 0.945098, 1,
-0.1031244, 0.3557773, 0.1000914, 0, 1, 0.9529412, 1,
-0.09664142, 1.226865, 1.653224, 0, 1, 0.9568627, 1,
-0.09549116, 2.071556, 0.1246795, 0, 1, 0.9647059, 1,
-0.08827025, 1.553762, 1.044537, 0, 1, 0.9686275, 1,
-0.08644865, -0.1275031, -1.033025, 0, 1, 0.9764706, 1,
-0.08460917, -0.1891022, -3.159806, 0, 1, 0.9803922, 1,
-0.07893031, 1.597922, -0.2376398, 0, 1, 0.9882353, 1,
-0.07854801, 0.4910915, -0.3603993, 0, 1, 0.9921569, 1,
-0.07630707, -0.1528011, -3.821667, 0, 1, 1, 1,
-0.0758437, 0.3528758, 1.121443, 0, 0.9921569, 1, 1,
-0.06896023, -0.6979703, -1.146069, 0, 0.9882353, 1, 1,
-0.06816025, -1.69738, -2.433018, 0, 0.9803922, 1, 1,
-0.05913327, -0.7119732, -2.773628, 0, 0.9764706, 1, 1,
-0.05858228, 0.2524202, -2.808124, 0, 0.9686275, 1, 1,
-0.0578329, -0.4249647, -1.684379, 0, 0.9647059, 1, 1,
-0.05473494, 0.5488721, -0.8574385, 0, 0.9568627, 1, 1,
-0.05445521, -1.453586, -1.647212, 0, 0.9529412, 1, 1,
-0.04477278, -1.19274, -6.663904, 0, 0.945098, 1, 1,
-0.03489876, -0.3447204, -2.906075, 0, 0.9411765, 1, 1,
-0.03301647, 0.4948445, 1.032337, 0, 0.9333333, 1, 1,
-0.03280826, 0.7011979, 1.110611, 0, 0.9294118, 1, 1,
-0.03255127, 0.3851434, -0.8709347, 0, 0.9215686, 1, 1,
-0.03251979, 0.1225255, -0.3739537, 0, 0.9176471, 1, 1,
-0.02678825, 0.4626021, -1.476884, 0, 0.9098039, 1, 1,
-0.02617823, -0.5125155, -2.817303, 0, 0.9058824, 1, 1,
-0.01868221, -0.1630162, -2.054033, 0, 0.8980392, 1, 1,
-0.01685578, 0.7338904, 0.5484055, 0, 0.8901961, 1, 1,
-0.01623653, 2.454344, 2.118575, 0, 0.8862745, 1, 1,
-0.01436127, -0.04105403, -3.123913, 0, 0.8784314, 1, 1,
-0.0136497, 0.8882806, -0.3836379, 0, 0.8745098, 1, 1,
-0.01060309, -1.788699, -3.482338, 0, 0.8666667, 1, 1,
-0.009311068, -1.902601, -1.534737, 0, 0.8627451, 1, 1,
-0.008361415, -0.2596025, -2.227449, 0, 0.854902, 1, 1,
-0.007590865, 0.320521, -0.2433417, 0, 0.8509804, 1, 1,
-0.003528615, 0.2074797, -1.336933, 0, 0.8431373, 1, 1,
-0.003262425, 0.2165935, 1.047604, 0, 0.8392157, 1, 1,
0.006053274, 0.9187815, 1.00071, 0, 0.8313726, 1, 1,
0.006297271, -0.1885716, 3.74685, 0, 0.827451, 1, 1,
0.007085259, -1.15705, 3.391425, 0, 0.8196079, 1, 1,
0.007994466, 1.211205, 0.8984016, 0, 0.8156863, 1, 1,
0.009546279, 1.146221, -1.39053, 0, 0.8078431, 1, 1,
0.009700775, -1.04297, 3.517083, 0, 0.8039216, 1, 1,
0.01119235, 0.3583894, 0.9157873, 0, 0.7960784, 1, 1,
0.01175182, -0.01764428, 3.269, 0, 0.7882353, 1, 1,
0.01789748, -1.172085, 3.429927, 0, 0.7843137, 1, 1,
0.01830998, 0.4125411, 0.8678132, 0, 0.7764706, 1, 1,
0.02217226, 0.6083597, -0.8212972, 0, 0.772549, 1, 1,
0.0224774, -0.5036941, 3.481816, 0, 0.7647059, 1, 1,
0.02415423, 1.652441, 0.6171002, 0, 0.7607843, 1, 1,
0.02922028, -0.2587218, 3.311861, 0, 0.7529412, 1, 1,
0.03102666, 0.9936972, -1.000871, 0, 0.7490196, 1, 1,
0.03312248, -1.160232, 2.949248, 0, 0.7411765, 1, 1,
0.03396007, 1.977685, 0.02424326, 0, 0.7372549, 1, 1,
0.03715303, 1.797444, 0.1422075, 0, 0.7294118, 1, 1,
0.03830195, -0.01056734, 2.137651, 0, 0.7254902, 1, 1,
0.04008157, -1.423239, 2.562331, 0, 0.7176471, 1, 1,
0.04240051, -0.1741605, 4.397404, 0, 0.7137255, 1, 1,
0.04442459, 2.211744, 0.1011213, 0, 0.7058824, 1, 1,
0.04922527, -1.850901, 2.251311, 0, 0.6980392, 1, 1,
0.04934129, -0.2500547, 3.753224, 0, 0.6941177, 1, 1,
0.0525636, 2.053345, 0.3421628, 0, 0.6862745, 1, 1,
0.05370588, 1.515042, 1.39777, 0, 0.682353, 1, 1,
0.0557977, -0.05613156, 2.679177, 0, 0.6745098, 1, 1,
0.05736, -0.5213528, 2.228413, 0, 0.6705883, 1, 1,
0.06451263, -0.6864876, 3.302216, 0, 0.6627451, 1, 1,
0.06616829, -2.080978, 3.324009, 0, 0.6588235, 1, 1,
0.07025333, -0.1145422, 2.701493, 0, 0.6509804, 1, 1,
0.07332793, 0.01211339, 1.037986, 0, 0.6470588, 1, 1,
0.07426303, -0.05484487, 2.568648, 0, 0.6392157, 1, 1,
0.07503398, 0.384221, -0.5950025, 0, 0.6352941, 1, 1,
0.07646272, -1.24233, 3.149807, 0, 0.627451, 1, 1,
0.07783671, 0.08556285, -0.2926381, 0, 0.6235294, 1, 1,
0.08110504, -0.5508041, 3.49313, 0, 0.6156863, 1, 1,
0.08297651, -0.7778652, 0.8394765, 0, 0.6117647, 1, 1,
0.08365181, -0.2168946, 2.779362, 0, 0.6039216, 1, 1,
0.08501971, -1.158952, 4.050691, 0, 0.5960785, 1, 1,
0.0864182, 1.313923, -0.4433669, 0, 0.5921569, 1, 1,
0.08782649, -1.432184, 0.649571, 0, 0.5843138, 1, 1,
0.09167002, 0.5091419, 0.5962834, 0, 0.5803922, 1, 1,
0.09462715, -0.8730529, 3.724974, 0, 0.572549, 1, 1,
0.1055553, 0.218497, 0.9614928, 0, 0.5686275, 1, 1,
0.1080064, 0.2125267, 0.7226623, 0, 0.5607843, 1, 1,
0.1108474, 2.322767, -0.02568432, 0, 0.5568628, 1, 1,
0.1145518, 0.2683223, -0.2899845, 0, 0.5490196, 1, 1,
0.1164138, -0.5493164, 3.759912, 0, 0.5450981, 1, 1,
0.1183706, 0.06326337, 0.8056363, 0, 0.5372549, 1, 1,
0.1229453, -1.151604, 1.695179, 0, 0.5333334, 1, 1,
0.123653, -0.06509695, 0.8419059, 0, 0.5254902, 1, 1,
0.1307591, 0.7231688, -0.5768224, 0, 0.5215687, 1, 1,
0.1317935, 0.05555029, 2.629664, 0, 0.5137255, 1, 1,
0.1318461, -0.1316886, 2.619631, 0, 0.509804, 1, 1,
0.1327953, -1.188447, 3.071739, 0, 0.5019608, 1, 1,
0.1369537, 0.1389656, -0.09732545, 0, 0.4941176, 1, 1,
0.1409929, 0.1916909, 2.301353, 0, 0.4901961, 1, 1,
0.1416737, 1.110582, 0.4978743, 0, 0.4823529, 1, 1,
0.142116, 0.6459848, -0.8753857, 0, 0.4784314, 1, 1,
0.1431243, -0.4762788, 2.76238, 0, 0.4705882, 1, 1,
0.1461003, -1.641893, 3.479921, 0, 0.4666667, 1, 1,
0.1481788, -0.2317326, 1.287996, 0, 0.4588235, 1, 1,
0.149528, -1.725145, 3.476575, 0, 0.454902, 1, 1,
0.1513734, 0.7806295, 0.9753077, 0, 0.4470588, 1, 1,
0.155277, 0.9212381, -0.653647, 0, 0.4431373, 1, 1,
0.1555342, 0.01949732, 1.890824, 0, 0.4352941, 1, 1,
0.1599695, 0.8239394, -2.07415, 0, 0.4313726, 1, 1,
0.1631427, -0.7397643, 3.083761, 0, 0.4235294, 1, 1,
0.1677068, 0.03302719, -0.8185641, 0, 0.4196078, 1, 1,
0.1679294, 0.96617, -1.651442, 0, 0.4117647, 1, 1,
0.1733563, -1.279342, 4.278619, 0, 0.4078431, 1, 1,
0.1771391, -0.8117964, 4.896046, 0, 0.4, 1, 1,
0.1795105, -1.04862, 2.328985, 0, 0.3921569, 1, 1,
0.1817653, -0.5310936, 2.652361, 0, 0.3882353, 1, 1,
0.1991781, -0.6370326, 0.5590159, 0, 0.3803922, 1, 1,
0.2003024, 0.2994842, -0.1660299, 0, 0.3764706, 1, 1,
0.2005108, 1.023187, 1.198241, 0, 0.3686275, 1, 1,
0.205129, -1.33463, 3.178218, 0, 0.3647059, 1, 1,
0.2053219, 0.1298039, 0.682357, 0, 0.3568628, 1, 1,
0.2070083, 0.728654, -1.346857, 0, 0.3529412, 1, 1,
0.2071651, 1.203433, 0.5159967, 0, 0.345098, 1, 1,
0.2084541, -1.483633, 2.613147, 0, 0.3411765, 1, 1,
0.2087715, -1.571574, 3.458145, 0, 0.3333333, 1, 1,
0.2099619, -0.2252731, 2.513289, 0, 0.3294118, 1, 1,
0.2163645, 0.6313403, 2.51987, 0, 0.3215686, 1, 1,
0.2170649, -0.09985488, 2.665397, 0, 0.3176471, 1, 1,
0.2180182, -0.909413, 3.707899, 0, 0.3098039, 1, 1,
0.2200553, -0.4927027, 2.484035, 0, 0.3058824, 1, 1,
0.2220322, -0.7694719, 1.575363, 0, 0.2980392, 1, 1,
0.2227295, -0.1827619, 3.013999, 0, 0.2901961, 1, 1,
0.2246447, 0.9620183, 0.4401935, 0, 0.2862745, 1, 1,
0.2248745, 1.015202, 1.440641, 0, 0.2784314, 1, 1,
0.2262371, -0.2115586, 3.469792, 0, 0.2745098, 1, 1,
0.2267038, 0.1506784, 0.4958753, 0, 0.2666667, 1, 1,
0.232639, -1.139793, 2.070553, 0, 0.2627451, 1, 1,
0.2343432, -0.2616836, 4.175458, 0, 0.254902, 1, 1,
0.2346161, -0.1217992, -0.1303034, 0, 0.2509804, 1, 1,
0.2378729, 0.8794357, 0.6334699, 0, 0.2431373, 1, 1,
0.2446467, -0.3599665, 0.8536047, 0, 0.2392157, 1, 1,
0.2457182, 0.6662598, -0.4006481, 0, 0.2313726, 1, 1,
0.2460761, -1.216329, 3.073328, 0, 0.227451, 1, 1,
0.2476803, 0.1699686, 0.1086967, 0, 0.2196078, 1, 1,
0.2479816, -1.394418, 2.295229, 0, 0.2156863, 1, 1,
0.2481261, 0.08181019, 0.5313287, 0, 0.2078431, 1, 1,
0.2491051, 1.091625, 0.4908003, 0, 0.2039216, 1, 1,
0.2510524, -2.128949, 3.354398, 0, 0.1960784, 1, 1,
0.2519469, 1.289703, 0.5143466, 0, 0.1882353, 1, 1,
0.25372, -0.175674, 2.163441, 0, 0.1843137, 1, 1,
0.2558899, 0.1407539, 0.9074224, 0, 0.1764706, 1, 1,
0.2631318, 1.500734, -0.3699554, 0, 0.172549, 1, 1,
0.2705695, 0.3209032, 1.54465, 0, 0.1647059, 1, 1,
0.2713781, -1.148607, 1.739631, 0, 0.1607843, 1, 1,
0.2747061, 1.162058, -0.9268104, 0, 0.1529412, 1, 1,
0.2776028, 1.012771, 0.3662556, 0, 0.1490196, 1, 1,
0.2793454, -1.160305, 3.476531, 0, 0.1411765, 1, 1,
0.2812551, 0.1670639, -0.01736725, 0, 0.1372549, 1, 1,
0.2855631, 1.004057, -0.4415972, 0, 0.1294118, 1, 1,
0.2865202, 1.170927, 0.5921638, 0, 0.1254902, 1, 1,
0.2951396, 0.1542092, 3.592487, 0, 0.1176471, 1, 1,
0.2963579, 0.001032799, 3.120165, 0, 0.1137255, 1, 1,
0.3006357, 1.105155, 1.146621, 0, 0.1058824, 1, 1,
0.3033473, 0.03784604, 1.565607, 0, 0.09803922, 1, 1,
0.3106816, 0.4978212, 0.9564391, 0, 0.09411765, 1, 1,
0.3134849, -0.3963704, 3.410173, 0, 0.08627451, 1, 1,
0.3136978, 0.02580515, 0.2042618, 0, 0.08235294, 1, 1,
0.3140958, 0.65481, -0.2312729, 0, 0.07450981, 1, 1,
0.314293, -1.487862, 2.71823, 0, 0.07058824, 1, 1,
0.3189871, -1.897045, 4.928455, 0, 0.0627451, 1, 1,
0.3244692, -0.143064, 2.271236, 0, 0.05882353, 1, 1,
0.3254278, -0.3588858, 1.613687, 0, 0.05098039, 1, 1,
0.3254807, 0.93512, 0.0500525, 0, 0.04705882, 1, 1,
0.3278717, 0.8645077, 1.207792, 0, 0.03921569, 1, 1,
0.3299115, -0.3920069, 1.462426, 0, 0.03529412, 1, 1,
0.3301113, 0.821279, -0.4637499, 0, 0.02745098, 1, 1,
0.3346221, 1.228588, -0.6754043, 0, 0.02352941, 1, 1,
0.3362579, 0.6823916, -1.104482, 0, 0.01568628, 1, 1,
0.354886, -0.3695438, 1.141533, 0, 0.01176471, 1, 1,
0.3556812, -0.5854943, 4.906457, 0, 0.003921569, 1, 1,
0.3562494, -0.2076574, -0.09274548, 0.003921569, 0, 1, 1,
0.3596198, 0.7698265, 0.1437544, 0.007843138, 0, 1, 1,
0.3610575, 0.941361, 0.3932858, 0.01568628, 0, 1, 1,
0.3610936, 0.4661693, -0.2990504, 0.01960784, 0, 1, 1,
0.3616498, 0.2641791, -0.1482248, 0.02745098, 0, 1, 1,
0.3617711, -0.8773893, 1.587997, 0.03137255, 0, 1, 1,
0.3634511, 0.005855171, 0.8590925, 0.03921569, 0, 1, 1,
0.366013, -0.7053774, 2.89681, 0.04313726, 0, 1, 1,
0.3717757, -0.9896835, 3.085854, 0.05098039, 0, 1, 1,
0.3722574, -0.06049773, 2.130525, 0.05490196, 0, 1, 1,
0.3740473, -0.2134978, 0.1085218, 0.0627451, 0, 1, 1,
0.3766401, 1.186237, 0.7852014, 0.06666667, 0, 1, 1,
0.3795779, 0.333179, 0.06601617, 0.07450981, 0, 1, 1,
0.380894, 0.7057101, -1.245047, 0.07843138, 0, 1, 1,
0.3859401, -0.779876, 2.866764, 0.08627451, 0, 1, 1,
0.3876948, 0.8341115, 1.007386, 0.09019608, 0, 1, 1,
0.3972932, 0.2893589, -0.5069606, 0.09803922, 0, 1, 1,
0.3995489, 1.01447, 2.12196, 0.1058824, 0, 1, 1,
0.4009953, 1.056172, -1.297012, 0.1098039, 0, 1, 1,
0.4011774, -0.3588935, 3.359254, 0.1176471, 0, 1, 1,
0.4046859, -0.521314, 3.995741, 0.1215686, 0, 1, 1,
0.4049963, 0.8856744, 0.2523693, 0.1294118, 0, 1, 1,
0.4080628, -0.724672, 3.181008, 0.1333333, 0, 1, 1,
0.41616, 0.9211766, 1.33848, 0.1411765, 0, 1, 1,
0.4192238, -0.1169519, 1.614251, 0.145098, 0, 1, 1,
0.4198352, -0.01331355, 1.317968, 0.1529412, 0, 1, 1,
0.4312315, -1.265255, 3.380005, 0.1568628, 0, 1, 1,
0.4319014, 0.6378409, 0.5426618, 0.1647059, 0, 1, 1,
0.4320813, 0.4794439, 1.205073, 0.1686275, 0, 1, 1,
0.4330385, 0.6848193, 1.361964, 0.1764706, 0, 1, 1,
0.4340633, 0.2148626, 4.127672, 0.1803922, 0, 1, 1,
0.4492097, 0.2456524, 0.6310706, 0.1882353, 0, 1, 1,
0.4498506, 0.8806704, 1.406443, 0.1921569, 0, 1, 1,
0.4524269, -0.2101971, 1.783804, 0.2, 0, 1, 1,
0.461436, 0.2200816, 1.87723, 0.2078431, 0, 1, 1,
0.4635509, 0.432111, -0.5055113, 0.2117647, 0, 1, 1,
0.4691063, 1.37149, 0.3676194, 0.2196078, 0, 1, 1,
0.473424, -0.9586826, 1.784673, 0.2235294, 0, 1, 1,
0.4792127, -0.9200348, 2.368671, 0.2313726, 0, 1, 1,
0.4795555, 0.6459576, 1.382889, 0.2352941, 0, 1, 1,
0.4817619, -0.3552749, 4.290837, 0.2431373, 0, 1, 1,
0.4857449, -3.130376, 1.5879, 0.2470588, 0, 1, 1,
0.4861326, -0.6200321, 4.007908, 0.254902, 0, 1, 1,
0.4909289, -1.346633, 4.303711, 0.2588235, 0, 1, 1,
0.4910542, -1.157896, 0.9403914, 0.2666667, 0, 1, 1,
0.4921228, 1.421714, 0.2168865, 0.2705882, 0, 1, 1,
0.4931561, -0.04773512, 1.799298, 0.2784314, 0, 1, 1,
0.4935666, 0.5419868, 0.3820719, 0.282353, 0, 1, 1,
0.5025849, 0.2369954, -0.4061415, 0.2901961, 0, 1, 1,
0.5029771, -0.1393496, 2.567422, 0.2941177, 0, 1, 1,
0.5050403, 0.5797003, -0.6982301, 0.3019608, 0, 1, 1,
0.517063, 0.2980962, 0.05056432, 0.3098039, 0, 1, 1,
0.5173661, -0.8055767, 2.462167, 0.3137255, 0, 1, 1,
0.5186553, -0.6594392, 2.199449, 0.3215686, 0, 1, 1,
0.5306225, -1.798778, 2.798293, 0.3254902, 0, 1, 1,
0.5311975, 0.09153304, 0.3779365, 0.3333333, 0, 1, 1,
0.533545, 0.9777257, -0.9367854, 0.3372549, 0, 1, 1,
0.5346516, 0.2504533, 1.276341, 0.345098, 0, 1, 1,
0.5348245, 0.4684115, 0.3627053, 0.3490196, 0, 1, 1,
0.5355874, 0.2271674, 1.166255, 0.3568628, 0, 1, 1,
0.5393773, 1.169124, -0.7920455, 0.3607843, 0, 1, 1,
0.5476573, -1.576324, 2.201175, 0.3686275, 0, 1, 1,
0.5479798, -0.01942207, 0.3946501, 0.372549, 0, 1, 1,
0.548051, 0.8230785, 1.592595, 0.3803922, 0, 1, 1,
0.5512312, 0.5950598, 1.594809, 0.3843137, 0, 1, 1,
0.5514296, -0.1403795, 1.513464, 0.3921569, 0, 1, 1,
0.5571393, -1.368752, 2.762089, 0.3960784, 0, 1, 1,
0.5587841, 0.002670845, -0.02817306, 0.4039216, 0, 1, 1,
0.5627378, -1.023394, 3.130855, 0.4117647, 0, 1, 1,
0.5629814, 0.9674645, 1.118889, 0.4156863, 0, 1, 1,
0.5647355, -0.446423, 4.108416, 0.4235294, 0, 1, 1,
0.5657687, -0.5024793, 1.604594, 0.427451, 0, 1, 1,
0.5681492, -0.6535524, 2.279375, 0.4352941, 0, 1, 1,
0.5693222, -0.8507855, 3.048499, 0.4392157, 0, 1, 1,
0.5702577, 0.3464279, 0.2513388, 0.4470588, 0, 1, 1,
0.5724704, -0.2376349, 1.31208, 0.4509804, 0, 1, 1,
0.5767626, -1.717797, 4.04348, 0.4588235, 0, 1, 1,
0.5776386, -1.069292, 1.13572, 0.4627451, 0, 1, 1,
0.5796143, 0.2647524, 0.7484714, 0.4705882, 0, 1, 1,
0.5802185, -0.7163772, 3.423318, 0.4745098, 0, 1, 1,
0.5822962, 0.539067, -1.310132, 0.4823529, 0, 1, 1,
0.5854455, -0.2225318, 1.660484, 0.4862745, 0, 1, 1,
0.5919567, 1.412335, 2.382629, 0.4941176, 0, 1, 1,
0.5930368, 0.5016944, 0.3596253, 0.5019608, 0, 1, 1,
0.6056888, -0.7667866, 3.576385, 0.5058824, 0, 1, 1,
0.6080247, 0.1536647, 1.467017, 0.5137255, 0, 1, 1,
0.609607, -0.2464661, 0.7445096, 0.5176471, 0, 1, 1,
0.6169003, 0.5085235, 1.06682, 0.5254902, 0, 1, 1,
0.6180625, 1.862684, -0.7034277, 0.5294118, 0, 1, 1,
0.6186293, -0.5812621, 2.125437, 0.5372549, 0, 1, 1,
0.6191837, 0.3734521, 0.8837913, 0.5411765, 0, 1, 1,
0.6241925, -0.5354262, 2.390547, 0.5490196, 0, 1, 1,
0.6274472, 0.1737679, -0.0001768876, 0.5529412, 0, 1, 1,
0.6337407, 0.3868982, 1.180224, 0.5607843, 0, 1, 1,
0.6353341, 0.2601694, 1.39641, 0.5647059, 0, 1, 1,
0.6358366, 1.038499, 0.4157471, 0.572549, 0, 1, 1,
0.642314, -0.09065994, 0.4097998, 0.5764706, 0, 1, 1,
0.6585485, -0.481838, 1.633144, 0.5843138, 0, 1, 1,
0.6613356, -0.2851774, 3.566975, 0.5882353, 0, 1, 1,
0.6619411, -2.385977, 3.147176, 0.5960785, 0, 1, 1,
0.664702, 0.6175148, -0.440704, 0.6039216, 0, 1, 1,
0.6724989, 0.5533878, 1.962796, 0.6078432, 0, 1, 1,
0.6745096, 0.4229594, 0.2120082, 0.6156863, 0, 1, 1,
0.6770613, 1.232329, -0.440201, 0.6196079, 0, 1, 1,
0.6795245, 0.1434759, -0.01956955, 0.627451, 0, 1, 1,
0.6808277, 0.312827, 1.079163, 0.6313726, 0, 1, 1,
0.6954637, -0.8940622, 2.247197, 0.6392157, 0, 1, 1,
0.6971449, -1.094275, 3.478476, 0.6431373, 0, 1, 1,
0.7069978, 0.4135576, 0.435775, 0.6509804, 0, 1, 1,
0.7083283, 1.215541, 0.7285661, 0.654902, 0, 1, 1,
0.7126467, -0.4368142, 1.799272, 0.6627451, 0, 1, 1,
0.7132078, 0.7451637, -0.4368606, 0.6666667, 0, 1, 1,
0.7154238, -0.2153725, 1.993663, 0.6745098, 0, 1, 1,
0.7329503, 0.3062913, 1.34134, 0.6784314, 0, 1, 1,
0.7332451, -1.009572, 3.198642, 0.6862745, 0, 1, 1,
0.7388835, 0.19975, 0.4656402, 0.6901961, 0, 1, 1,
0.7421302, 1.655212, -1.760297, 0.6980392, 0, 1, 1,
0.746678, -0.4250695, 2.911891, 0.7058824, 0, 1, 1,
0.749852, -0.3249846, 4.129181, 0.7098039, 0, 1, 1,
0.7512189, 0.4478062, 0.7599338, 0.7176471, 0, 1, 1,
0.7674151, 1.719403, -0.5477993, 0.7215686, 0, 1, 1,
0.7699608, 0.334932, 2.05304, 0.7294118, 0, 1, 1,
0.7770333, 1.055413, 0.250343, 0.7333333, 0, 1, 1,
0.7783265, -0.8658732, 2.449495, 0.7411765, 0, 1, 1,
0.7784116, 0.1540745, 1.920947, 0.7450981, 0, 1, 1,
0.7801933, -1.078959, 3.439698, 0.7529412, 0, 1, 1,
0.7818084, -0.2825364, 0.9755434, 0.7568628, 0, 1, 1,
0.7873036, -0.7415689, 1.193077, 0.7647059, 0, 1, 1,
0.7887821, 2.17318, 0.9876713, 0.7686275, 0, 1, 1,
0.7897155, -1.407454, 3.497949, 0.7764706, 0, 1, 1,
0.7915315, 0.3905647, -0.3027651, 0.7803922, 0, 1, 1,
0.7941794, -0.5688229, 2.939372, 0.7882353, 0, 1, 1,
0.7956764, 0.01964503, 1.999622, 0.7921569, 0, 1, 1,
0.7960903, 0.1083299, 1.623227, 0.8, 0, 1, 1,
0.8040867, -0.6498297, 2.441823, 0.8078431, 0, 1, 1,
0.8044041, 0.1946562, 0.1162616, 0.8117647, 0, 1, 1,
0.8052592, 1.052999, 2.664845, 0.8196079, 0, 1, 1,
0.8062492, 0.1107579, -0.3052163, 0.8235294, 0, 1, 1,
0.8155338, 1.146939, 3.190923, 0.8313726, 0, 1, 1,
0.8182581, -0.6780729, 1.67833, 0.8352941, 0, 1, 1,
0.8197104, 0.5429463, 2.824531, 0.8431373, 0, 1, 1,
0.823375, 0.09009725, 3.210879, 0.8470588, 0, 1, 1,
0.8307506, 0.2129436, 0.6650697, 0.854902, 0, 1, 1,
0.8375291, -1.557598, 1.20198, 0.8588235, 0, 1, 1,
0.8405229, 0.3843701, 2.148438, 0.8666667, 0, 1, 1,
0.8452988, 0.419926, 0.8577158, 0.8705882, 0, 1, 1,
0.846925, 0.2403339, 2.367221, 0.8784314, 0, 1, 1,
0.849089, -0.7530198, 1.89442, 0.8823529, 0, 1, 1,
0.8591933, 0.5251434, 1.314822, 0.8901961, 0, 1, 1,
0.8609263, -1.248785, 3.590433, 0.8941177, 0, 1, 1,
0.8695236, 2.453315, -0.254487, 0.9019608, 0, 1, 1,
0.870455, 0.5895336, 0.8908837, 0.9098039, 0, 1, 1,
0.8758792, -1.184725, 2.744834, 0.9137255, 0, 1, 1,
0.8767405, -0.5800014, 4.424582, 0.9215686, 0, 1, 1,
0.8781844, -0.4761651, 4.360799, 0.9254902, 0, 1, 1,
0.8844653, 0.08502534, 0.08326776, 0.9333333, 0, 1, 1,
0.8875328, -0.07678692, 1.291685, 0.9372549, 0, 1, 1,
0.8888054, -0.2724613, 4.758021, 0.945098, 0, 1, 1,
0.8908522, -0.5214455, 2.485839, 0.9490196, 0, 1, 1,
0.8956582, 0.3523888, 0.001758632, 0.9568627, 0, 1, 1,
0.9057474, -0.6573476, 2.75255, 0.9607843, 0, 1, 1,
0.9157358, -0.1241233, -0.05210759, 0.9686275, 0, 1, 1,
0.9168769, -0.0627142, 2.198156, 0.972549, 0, 1, 1,
0.9258301, -1.182143, 2.166096, 0.9803922, 0, 1, 1,
0.9268895, 1.344939, 0.6288046, 0.9843137, 0, 1, 1,
0.9338896, -0.1539547, 2.2903, 0.9921569, 0, 1, 1,
0.9351776, 0.222504, 0.9395875, 0.9960784, 0, 1, 1,
0.9367074, 1.459412, -0.3403461, 1, 0, 0.9960784, 1,
0.9406412, 0.6927525, -0.01451947, 1, 0, 0.9882353, 1,
0.9487405, -1.674932, 1.323907, 1, 0, 0.9843137, 1,
0.949795, -0.4714818, 2.197076, 1, 0, 0.9764706, 1,
0.958029, 1.283415, 0.5005338, 1, 0, 0.972549, 1,
0.9611799, 0.01793143, 1.573085, 1, 0, 0.9647059, 1,
0.9702036, 1.486391, 0.5719748, 1, 0, 0.9607843, 1,
0.9835347, 0.4565308, 0.171939, 1, 0, 0.9529412, 1,
0.9909039, 0.700056, 2.927895, 1, 0, 0.9490196, 1,
0.9953935, 0.8213125, 1.604886, 1, 0, 0.9411765, 1,
0.996313, 1.685362, 0.5366463, 1, 0, 0.9372549, 1,
1.002491, -1.491073, 3.492485, 1, 0, 0.9294118, 1,
1.002537, -1.197667, 2.444776, 1, 0, 0.9254902, 1,
1.004008, -0.4753951, -0.08272898, 1, 0, 0.9176471, 1,
1.005775, 1.776981, 0.4460129, 1, 0, 0.9137255, 1,
1.007591, -0.9950749, 2.464225, 1, 0, 0.9058824, 1,
1.009069, -0.5051728, 1.163661, 1, 0, 0.9019608, 1,
1.012945, 0.1088091, 2.155648, 1, 0, 0.8941177, 1,
1.014703, -0.3081268, 1.251343, 1, 0, 0.8862745, 1,
1.031469, 1.055015, -0.9325262, 1, 0, 0.8823529, 1,
1.032486, -0.1351146, 1.686678, 1, 0, 0.8745098, 1,
1.038776, -0.7728895, 3.541509, 1, 0, 0.8705882, 1,
1.0596, -1.857628, 2.19515, 1, 0, 0.8627451, 1,
1.063314, -1.228037, 1.180557, 1, 0, 0.8588235, 1,
1.06657, 1.852794, -0.3829538, 1, 0, 0.8509804, 1,
1.070194, 0.9231026, 0.9308392, 1, 0, 0.8470588, 1,
1.073085, -0.3280494, 1.379415, 1, 0, 0.8392157, 1,
1.077995, -0.796468, 0.3764129, 1, 0, 0.8352941, 1,
1.082114, -0.2463142, 2.15564, 1, 0, 0.827451, 1,
1.08379, -0.5894949, 2.391983, 1, 0, 0.8235294, 1,
1.084201, -1.18278, 3.596803, 1, 0, 0.8156863, 1,
1.094583, -0.07006416, 3.777439, 1, 0, 0.8117647, 1,
1.105278, -0.1475869, 1.122348, 1, 0, 0.8039216, 1,
1.123971, 1.54848, 1.244179, 1, 0, 0.7960784, 1,
1.124413, 0.005423889, 0.9107696, 1, 0, 0.7921569, 1,
1.131284, -0.3181996, 1.100136, 1, 0, 0.7843137, 1,
1.13525, 0.7131894, 1.731444, 1, 0, 0.7803922, 1,
1.15937, -0.4781083, 2.775614, 1, 0, 0.772549, 1,
1.160744, 2.074537, 2.880697, 1, 0, 0.7686275, 1,
1.167991, 0.7026637, 0.9504578, 1, 0, 0.7607843, 1,
1.170036, -0.8529741, 3.438388, 1, 0, 0.7568628, 1,
1.190483, 0.003120144, 2.046706, 1, 0, 0.7490196, 1,
1.196174, -0.03507866, 1.612586, 1, 0, 0.7450981, 1,
1.199421, 1.563331, 1.599419, 1, 0, 0.7372549, 1,
1.20086, 0.8972875, -0.2848634, 1, 0, 0.7333333, 1,
1.202038, 1.388381, 0.4873225, 1, 0, 0.7254902, 1,
1.206761, -1.458014, 1.708801, 1, 0, 0.7215686, 1,
1.211711, -1.209976, 3.74705, 1, 0, 0.7137255, 1,
1.215249, -0.962807, 4.11306, 1, 0, 0.7098039, 1,
1.221161, -0.5614897, 2.046943, 1, 0, 0.7019608, 1,
1.224247, 0.959105, -0.3315417, 1, 0, 0.6941177, 1,
1.230434, -1.249593, 1.858757, 1, 0, 0.6901961, 1,
1.231022, 2.458268, 0.2382986, 1, 0, 0.682353, 1,
1.242149, -0.1246303, 1.77338, 1, 0, 0.6784314, 1,
1.247212, -0.4102583, 1.849754, 1, 0, 0.6705883, 1,
1.251746, -1.131545, 1.78873, 1, 0, 0.6666667, 1,
1.254138, -0.04721204, 0.9255872, 1, 0, 0.6588235, 1,
1.259063, 1.011605, 1.015805, 1, 0, 0.654902, 1,
1.260903, 1.528708, -0.3383794, 1, 0, 0.6470588, 1,
1.26647, -0.8795608, 2.906161, 1, 0, 0.6431373, 1,
1.267307, 2.540451, 1.168651, 1, 0, 0.6352941, 1,
1.268224, 0.5073741, 1.281034, 1, 0, 0.6313726, 1,
1.270138, 0.07598621, 1.604614, 1, 0, 0.6235294, 1,
1.27281, -0.3599312, 1.176957, 1, 0, 0.6196079, 1,
1.275163, -1.527808, 2.224025, 1, 0, 0.6117647, 1,
1.281978, -0.003224406, 3.258082, 1, 0, 0.6078432, 1,
1.285498, -2.419991, 2.464728, 1, 0, 0.6, 1,
1.290677, -0.6128049, 1.940185, 1, 0, 0.5921569, 1,
1.293654, 0.2039523, 0.9760368, 1, 0, 0.5882353, 1,
1.298479, -0.1428531, 3.456652, 1, 0, 0.5803922, 1,
1.302503, -0.6466332, 1.796066, 1, 0, 0.5764706, 1,
1.331913, 0.7026336, 0.6163346, 1, 0, 0.5686275, 1,
1.340519, -2.133927, 2.22979, 1, 0, 0.5647059, 1,
1.343302, 0.5509918, 1.968079, 1, 0, 0.5568628, 1,
1.358957, 0.8694392, 1.559856, 1, 0, 0.5529412, 1,
1.392165, -0.3849786, 1.451878, 1, 0, 0.5450981, 1,
1.41508, 1.268804, 0.5569211, 1, 0, 0.5411765, 1,
1.416242, 0.5202954, 1.110501, 1, 0, 0.5333334, 1,
1.416811, 1.445506, 1.573964, 1, 0, 0.5294118, 1,
1.421078, -0.01355246, 2.072248, 1, 0, 0.5215687, 1,
1.426124, 0.5527573, 2.123944, 1, 0, 0.5176471, 1,
1.438027, 0.6624589, -0.417298, 1, 0, 0.509804, 1,
1.438332, -0.2791055, 3.683631, 1, 0, 0.5058824, 1,
1.440071, -0.07687063, 1.696431, 1, 0, 0.4980392, 1,
1.442102, 0.2579987, 1.380863, 1, 0, 0.4901961, 1,
1.463788, 0.2852889, 0.2555185, 1, 0, 0.4862745, 1,
1.497094, -0.492727, 3.728439, 1, 0, 0.4784314, 1,
1.509623, -0.7885279, 3.352305, 1, 0, 0.4745098, 1,
1.520199, 0.6705642, 1.351727, 1, 0, 0.4666667, 1,
1.526111, -0.03265899, -0.3173466, 1, 0, 0.4627451, 1,
1.53193, 0.3939264, 2.402689, 1, 0, 0.454902, 1,
1.537657, 0.3637511, 2.407099, 1, 0, 0.4509804, 1,
1.549439, -0.7271314, 1.371471, 1, 0, 0.4431373, 1,
1.562716, -1.571251, 1.964449, 1, 0, 0.4392157, 1,
1.567388, 1.038368, 1.339124, 1, 0, 0.4313726, 1,
1.572407, 0.1033162, 2.901314, 1, 0, 0.427451, 1,
1.580329, -0.7770202, 2.706435, 1, 0, 0.4196078, 1,
1.583554, 0.622423, 1.052454, 1, 0, 0.4156863, 1,
1.590909, 0.5166526, 0.9847372, 1, 0, 0.4078431, 1,
1.601818, 0.06662612, 3.09264, 1, 0, 0.4039216, 1,
1.604527, -3.207344, 2.479961, 1, 0, 0.3960784, 1,
1.612974, 0.7248285, 1.378661, 1, 0, 0.3882353, 1,
1.617238, -0.2180061, 0.9045966, 1, 0, 0.3843137, 1,
1.62204, 0.2317446, 3.153987, 1, 0, 0.3764706, 1,
1.622238, 0.1082301, 3.87892, 1, 0, 0.372549, 1,
1.629794, -0.121496, 3.015178, 1, 0, 0.3647059, 1,
1.632375, 1.014746, -0.7834244, 1, 0, 0.3607843, 1,
1.632474, 0.01659632, 0.8208807, 1, 0, 0.3529412, 1,
1.64571, -1.434356, 1.305163, 1, 0, 0.3490196, 1,
1.654369, -0.6140198, 1.838164, 1, 0, 0.3411765, 1,
1.65507, -1.355431, 2.691281, 1, 0, 0.3372549, 1,
1.66032, 1.874316, 1.856092, 1, 0, 0.3294118, 1,
1.667861, -0.8334306, 1.37816, 1, 0, 0.3254902, 1,
1.682614, 1.400604, 2.501555, 1, 0, 0.3176471, 1,
1.684401, 0.5213873, -0.2598912, 1, 0, 0.3137255, 1,
1.686862, -0.05712046, 0.9910895, 1, 0, 0.3058824, 1,
1.710226, 0.9657944, 1.91543, 1, 0, 0.2980392, 1,
1.719035, -1.740763, 1.931715, 1, 0, 0.2941177, 1,
1.721448, -0.3627435, 1.478003, 1, 0, 0.2862745, 1,
1.739418, 0.6854271, 1.167513, 1, 0, 0.282353, 1,
1.747566, -1.048685, 2.495877, 1, 0, 0.2745098, 1,
1.749277, -0.3049308, 0.9070063, 1, 0, 0.2705882, 1,
1.76875, -0.528191, 1.645553, 1, 0, 0.2627451, 1,
1.777786, 0.5224692, 1.887163, 1, 0, 0.2588235, 1,
1.778396, 0.5835153, 0.8248779, 1, 0, 0.2509804, 1,
1.778835, -0.2221646, 0.5787215, 1, 0, 0.2470588, 1,
1.786198, -0.210499, 2.264362, 1, 0, 0.2392157, 1,
1.796343, -0.4714339, 0.7356963, 1, 0, 0.2352941, 1,
1.801086, 0.4755202, 0.1057755, 1, 0, 0.227451, 1,
1.836886, -0.6313773, 4.141222, 1, 0, 0.2235294, 1,
1.84659, 0.3865429, 1.639371, 1, 0, 0.2156863, 1,
1.847768, -0.3550855, 1.266479, 1, 0, 0.2117647, 1,
1.863309, -0.03126056, 2.064555, 1, 0, 0.2039216, 1,
1.865065, -0.3152721, -0.4507641, 1, 0, 0.1960784, 1,
1.868889, -0.8157763, 0.9534602, 1, 0, 0.1921569, 1,
1.878446, 0.7530532, 0.3375199, 1, 0, 0.1843137, 1,
1.889399, 0.8006632, 2.675934, 1, 0, 0.1803922, 1,
1.891439, -1.497829, 3.591847, 1, 0, 0.172549, 1,
1.896722, -0.2861997, 1.350461, 1, 0, 0.1686275, 1,
1.902251, -0.5838899, 2.960672, 1, 0, 0.1607843, 1,
1.918084, 1.089583, 1.181119, 1, 0, 0.1568628, 1,
1.925416, -1.922564, 0.4301747, 1, 0, 0.1490196, 1,
1.938331, 0.5813437, 1.23634, 1, 0, 0.145098, 1,
1.950662, 1.557948, -0.185794, 1, 0, 0.1372549, 1,
1.967359, -0.5743178, 1.411107, 1, 0, 0.1333333, 1,
1.980706, 1.723018, 2.595987, 1, 0, 0.1254902, 1,
2.05067, 0.2449857, 1.945264, 1, 0, 0.1215686, 1,
2.053489, -0.6601187, 1.87032, 1, 0, 0.1137255, 1,
2.058503, 0.1595143, 0.4440088, 1, 0, 0.1098039, 1,
2.068765, 1.220143, 2.406337, 1, 0, 0.1019608, 1,
2.145149, -1.043411, 3.249034, 1, 0, 0.09411765, 1,
2.161667, 0.4335084, 1.701074, 1, 0, 0.09019608, 1,
2.189657, -0.1784122, 4.289807, 1, 0, 0.08235294, 1,
2.236246, 0.009455073, 0.4889552, 1, 0, 0.07843138, 1,
2.313649, -2.372469, 3.67996, 1, 0, 0.07058824, 1,
2.344724, 0.2844139, 1.871333, 1, 0, 0.06666667, 1,
2.387121, -1.035217, 1.471594, 1, 0, 0.05882353, 1,
2.398509, -0.1921866, 1.592951, 1, 0, 0.05490196, 1,
2.422617, -0.8775519, 2.167192, 1, 0, 0.04705882, 1,
2.450721, 1.294408, 0.8016906, 1, 0, 0.04313726, 1,
2.481715, 0.06724264, 2.499407, 1, 0, 0.03529412, 1,
2.508525, -1.49936, 2.191626, 1, 0, 0.03137255, 1,
2.535491, 1.27043, 1.109119, 1, 0, 0.02352941, 1,
2.646205, 0.2021449, 0.7262944, 1, 0, 0.01960784, 1,
2.670432, 0.226474, 0.4452069, 1, 0, 0.01176471, 1,
2.790538, 0.6853153, 1.369804, 1, 0, 0.007843138, 1
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
-0.321045, -4.297492, -8.628809, 0, -0.5, 0.5, 0.5,
-0.321045, -4.297492, -8.628809, 1, -0.5, 0.5, 0.5,
-0.321045, -4.297492, -8.628809, 1, 1.5, 0.5, 0.5,
-0.321045, -4.297492, -8.628809, 0, 1.5, 0.5, 0.5
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
-4.487455, 0.008431077, -8.628809, 0, -0.5, 0.5, 0.5,
-4.487455, 0.008431077, -8.628809, 1, -0.5, 0.5, 0.5,
-4.487455, 0.008431077, -8.628809, 1, 1.5, 0.5, 0.5,
-4.487455, 0.008431077, -8.628809, 0, 1.5, 0.5, 0.5
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
-4.487455, -4.297492, -0.8677247, 0, -0.5, 0.5, 0.5,
-4.487455, -4.297492, -0.8677247, 1, -0.5, 0.5, 0.5,
-4.487455, -4.297492, -0.8677247, 1, 1.5, 0.5, 0.5,
-4.487455, -4.297492, -0.8677247, 0, 1.5, 0.5, 0.5
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
-3, -3.303817, -6.83779,
2, -3.303817, -6.83779,
-3, -3.303817, -6.83779,
-3, -3.469429, -7.136293,
-2, -3.303817, -6.83779,
-2, -3.469429, -7.136293,
-1, -3.303817, -6.83779,
-1, -3.469429, -7.136293,
0, -3.303817, -6.83779,
0, -3.469429, -7.136293,
1, -3.303817, -6.83779,
1, -3.469429, -7.136293,
2, -3.303817, -6.83779,
2, -3.469429, -7.136293
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
-3, -3.800654, -7.733299, 0, -0.5, 0.5, 0.5,
-3, -3.800654, -7.733299, 1, -0.5, 0.5, 0.5,
-3, -3.800654, -7.733299, 1, 1.5, 0.5, 0.5,
-3, -3.800654, -7.733299, 0, 1.5, 0.5, 0.5,
-2, -3.800654, -7.733299, 0, -0.5, 0.5, 0.5,
-2, -3.800654, -7.733299, 1, -0.5, 0.5, 0.5,
-2, -3.800654, -7.733299, 1, 1.5, 0.5, 0.5,
-2, -3.800654, -7.733299, 0, 1.5, 0.5, 0.5,
-1, -3.800654, -7.733299, 0, -0.5, 0.5, 0.5,
-1, -3.800654, -7.733299, 1, -0.5, 0.5, 0.5,
-1, -3.800654, -7.733299, 1, 1.5, 0.5, 0.5,
-1, -3.800654, -7.733299, 0, 1.5, 0.5, 0.5,
0, -3.800654, -7.733299, 0, -0.5, 0.5, 0.5,
0, -3.800654, -7.733299, 1, -0.5, 0.5, 0.5,
0, -3.800654, -7.733299, 1, 1.5, 0.5, 0.5,
0, -3.800654, -7.733299, 0, 1.5, 0.5, 0.5,
1, -3.800654, -7.733299, 0, -0.5, 0.5, 0.5,
1, -3.800654, -7.733299, 1, -0.5, 0.5, 0.5,
1, -3.800654, -7.733299, 1, 1.5, 0.5, 0.5,
1, -3.800654, -7.733299, 0, 1.5, 0.5, 0.5,
2, -3.800654, -7.733299, 0, -0.5, 0.5, 0.5,
2, -3.800654, -7.733299, 1, -0.5, 0.5, 0.5,
2, -3.800654, -7.733299, 1, 1.5, 0.5, 0.5,
2, -3.800654, -7.733299, 0, 1.5, 0.5, 0.5
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
-3.525976, -3, -6.83779,
-3.525976, 3, -6.83779,
-3.525976, -3, -6.83779,
-3.686223, -3, -7.136293,
-3.525976, -2, -6.83779,
-3.686223, -2, -7.136293,
-3.525976, -1, -6.83779,
-3.686223, -1, -7.136293,
-3.525976, 0, -6.83779,
-3.686223, 0, -7.136293,
-3.525976, 1, -6.83779,
-3.686223, 1, -7.136293,
-3.525976, 2, -6.83779,
-3.686223, 2, -7.136293,
-3.525976, 3, -6.83779,
-3.686223, 3, -7.136293
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
-4.006715, -3, -7.733299, 0, -0.5, 0.5, 0.5,
-4.006715, -3, -7.733299, 1, -0.5, 0.5, 0.5,
-4.006715, -3, -7.733299, 1, 1.5, 0.5, 0.5,
-4.006715, -3, -7.733299, 0, 1.5, 0.5, 0.5,
-4.006715, -2, -7.733299, 0, -0.5, 0.5, 0.5,
-4.006715, -2, -7.733299, 1, -0.5, 0.5, 0.5,
-4.006715, -2, -7.733299, 1, 1.5, 0.5, 0.5,
-4.006715, -2, -7.733299, 0, 1.5, 0.5, 0.5,
-4.006715, -1, -7.733299, 0, -0.5, 0.5, 0.5,
-4.006715, -1, -7.733299, 1, -0.5, 0.5, 0.5,
-4.006715, -1, -7.733299, 1, 1.5, 0.5, 0.5,
-4.006715, -1, -7.733299, 0, 1.5, 0.5, 0.5,
-4.006715, 0, -7.733299, 0, -0.5, 0.5, 0.5,
-4.006715, 0, -7.733299, 1, -0.5, 0.5, 0.5,
-4.006715, 0, -7.733299, 1, 1.5, 0.5, 0.5,
-4.006715, 0, -7.733299, 0, 1.5, 0.5, 0.5,
-4.006715, 1, -7.733299, 0, -0.5, 0.5, 0.5,
-4.006715, 1, -7.733299, 1, -0.5, 0.5, 0.5,
-4.006715, 1, -7.733299, 1, 1.5, 0.5, 0.5,
-4.006715, 1, -7.733299, 0, 1.5, 0.5, 0.5,
-4.006715, 2, -7.733299, 0, -0.5, 0.5, 0.5,
-4.006715, 2, -7.733299, 1, -0.5, 0.5, 0.5,
-4.006715, 2, -7.733299, 1, 1.5, 0.5, 0.5,
-4.006715, 2, -7.733299, 0, 1.5, 0.5, 0.5,
-4.006715, 3, -7.733299, 0, -0.5, 0.5, 0.5,
-4.006715, 3, -7.733299, 1, -0.5, 0.5, 0.5,
-4.006715, 3, -7.733299, 1, 1.5, 0.5, 0.5,
-4.006715, 3, -7.733299, 0, 1.5, 0.5, 0.5
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
-3.525976, -3.303817, -6,
-3.525976, -3.303817, 4,
-3.525976, -3.303817, -6,
-3.686223, -3.469429, -6,
-3.525976, -3.303817, -4,
-3.686223, -3.469429, -4,
-3.525976, -3.303817, -2,
-3.686223, -3.469429, -2,
-3.525976, -3.303817, 0,
-3.686223, -3.469429, 0,
-3.525976, -3.303817, 2,
-3.686223, -3.469429, 2,
-3.525976, -3.303817, 4,
-3.686223, -3.469429, 4
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
-4.006715, -3.800654, -6, 0, -0.5, 0.5, 0.5,
-4.006715, -3.800654, -6, 1, -0.5, 0.5, 0.5,
-4.006715, -3.800654, -6, 1, 1.5, 0.5, 0.5,
-4.006715, -3.800654, -6, 0, 1.5, 0.5, 0.5,
-4.006715, -3.800654, -4, 0, -0.5, 0.5, 0.5,
-4.006715, -3.800654, -4, 1, -0.5, 0.5, 0.5,
-4.006715, -3.800654, -4, 1, 1.5, 0.5, 0.5,
-4.006715, -3.800654, -4, 0, 1.5, 0.5, 0.5,
-4.006715, -3.800654, -2, 0, -0.5, 0.5, 0.5,
-4.006715, -3.800654, -2, 1, -0.5, 0.5, 0.5,
-4.006715, -3.800654, -2, 1, 1.5, 0.5, 0.5,
-4.006715, -3.800654, -2, 0, 1.5, 0.5, 0.5,
-4.006715, -3.800654, 0, 0, -0.5, 0.5, 0.5,
-4.006715, -3.800654, 0, 1, -0.5, 0.5, 0.5,
-4.006715, -3.800654, 0, 1, 1.5, 0.5, 0.5,
-4.006715, -3.800654, 0, 0, 1.5, 0.5, 0.5,
-4.006715, -3.800654, 2, 0, -0.5, 0.5, 0.5,
-4.006715, -3.800654, 2, 1, -0.5, 0.5, 0.5,
-4.006715, -3.800654, 2, 1, 1.5, 0.5, 0.5,
-4.006715, -3.800654, 2, 0, 1.5, 0.5, 0.5,
-4.006715, -3.800654, 4, 0, -0.5, 0.5, 0.5,
-4.006715, -3.800654, 4, 1, -0.5, 0.5, 0.5,
-4.006715, -3.800654, 4, 1, 1.5, 0.5, 0.5,
-4.006715, -3.800654, 4, 0, 1.5, 0.5, 0.5
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
-3.525976, -3.303817, -6.83779,
-3.525976, 3.320679, -6.83779,
-3.525976, -3.303817, 5.10234,
-3.525976, 3.320679, 5.10234,
-3.525976, -3.303817, -6.83779,
-3.525976, -3.303817, 5.10234,
-3.525976, 3.320679, -6.83779,
-3.525976, 3.320679, 5.10234,
-3.525976, -3.303817, -6.83779,
2.883886, -3.303817, -6.83779,
-3.525976, -3.303817, 5.10234,
2.883886, -3.303817, 5.10234,
-3.525976, 3.320679, -6.83779,
2.883886, 3.320679, -6.83779,
-3.525976, 3.320679, 5.10234,
2.883886, 3.320679, 5.10234,
2.883886, -3.303817, -6.83779,
2.883886, 3.320679, -6.83779,
2.883886, -3.303817, 5.10234,
2.883886, 3.320679, 5.10234,
2.883886, -3.303817, -6.83779,
2.883886, -3.303817, 5.10234,
2.883886, 3.320679, -6.83779,
2.883886, 3.320679, 5.10234
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
var radius = 8.054738;
var distance = 35.83644;
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
mvMatrix.translate( 0.321045, -0.008431077, 0.8677247 );
mvMatrix.scale( 1.358678, 1.314657, 0.7293841 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.83644);
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
vinyl_phosphoric_aci<-read.table("vinyl_phosphoric_aci.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-vinyl_phosphoric_aci$V2
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
```

```r
y<-vinyl_phosphoric_aci$V3
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
```

```r
z<-vinyl_phosphoric_aci$V4
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
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
-3.432628, 0.5371626, -0.9351839, 0, 0, 1, 1, 1,
-3.40639, -0.3879672, -2.715344, 1, 0, 0, 1, 1,
-3.383833, 0.2577302, 0.01145552, 1, 0, 0, 1, 1,
-3.251348, -1.375783, -3.592209, 1, 0, 0, 1, 1,
-3.127633, -0.7687556, -0.5304312, 1, 0, 0, 1, 1,
-3.07695, -0.2437696, -1.823599, 1, 0, 0, 1, 1,
-2.852661, -0.1220298, -1.804874, 0, 0, 0, 1, 1,
-2.816257, 0.9802245, 0.2432507, 0, 0, 0, 1, 1,
-2.637433, 0.3479065, -1.343932, 0, 0, 0, 1, 1,
-2.539193, 0.3800026, -2.167055, 0, 0, 0, 1, 1,
-2.411615, 0.1305433, -2.393188, 0, 0, 0, 1, 1,
-2.322392, -1.023505, -0.7090966, 0, 0, 0, 1, 1,
-2.320709, 0.4122024, -0.8432332, 0, 0, 0, 1, 1,
-2.296443, 1.035196, -0.6188266, 1, 1, 1, 1, 1,
-2.285998, 2.725745, -0.2116927, 1, 1, 1, 1, 1,
-2.283698, -0.1039621, -3.809279, 1, 1, 1, 1, 1,
-2.215272, 0.2756674, -2.508008, 1, 1, 1, 1, 1,
-2.201258, 0.1713111, -1.71332, 1, 1, 1, 1, 1,
-2.190963, 1.085714, -1.022982, 1, 1, 1, 1, 1,
-2.118409, -0.009238873, -1.679623, 1, 1, 1, 1, 1,
-2.098602, -0.5097915, -0.8000774, 1, 1, 1, 1, 1,
-2.057129, -0.2627797, -1.546028, 1, 1, 1, 1, 1,
-2.053005, -0.3250321, -1.035464, 1, 1, 1, 1, 1,
-2.025743, -0.08706791, -1.013204, 1, 1, 1, 1, 1,
-2.019657, -0.03431866, -1.305971, 1, 1, 1, 1, 1,
-2.017535, -1.058267, -2.363933, 1, 1, 1, 1, 1,
-1.998836, -0.5149177, -1.947725, 1, 1, 1, 1, 1,
-1.995351, 1.36918, 0.3702779, 1, 1, 1, 1, 1,
-1.988782, -1.119626, -2.20521, 0, 0, 1, 1, 1,
-1.977851, -0.1288615, -2.964857, 1, 0, 0, 1, 1,
-1.971094, -0.7464, -3.208034, 1, 0, 0, 1, 1,
-1.937608, 0.05059779, -3.196808, 1, 0, 0, 1, 1,
-1.908708, -0.4941778, -0.2278664, 1, 0, 0, 1, 1,
-1.905225, -0.4801117, -1.112973, 1, 0, 0, 1, 1,
-1.878555, 1.450682, -1.040229, 0, 0, 0, 1, 1,
-1.874122, 0.16286, -0.1992064, 0, 0, 0, 1, 1,
-1.87229, -0.3395576, -2.4182, 0, 0, 0, 1, 1,
-1.849975, -1.646246, -1.275307, 0, 0, 0, 1, 1,
-1.838229, 1.565748, 0.5386846, 0, 0, 0, 1, 1,
-1.834156, 1.834898, -1.040428, 0, 0, 0, 1, 1,
-1.833409, 0.3805428, -2.228668, 0, 0, 0, 1, 1,
-1.805745, 0.01895715, -1.149871, 1, 1, 1, 1, 1,
-1.799543, 0.3727038, -1.461433, 1, 1, 1, 1, 1,
-1.775539, 0.1676964, -2.455218, 1, 1, 1, 1, 1,
-1.7652, 0.9452925, -1.126842, 1, 1, 1, 1, 1,
-1.765021, 0.04566927, -0.3473708, 1, 1, 1, 1, 1,
-1.755464, -0.9115675, -1.103092, 1, 1, 1, 1, 1,
-1.750815, -1.04618, -2.678804, 1, 1, 1, 1, 1,
-1.750552, 1.046698, -0.6277308, 1, 1, 1, 1, 1,
-1.74895, -0.4699751, -1.685449, 1, 1, 1, 1, 1,
-1.734794, -0.6006611, -2.049262, 1, 1, 1, 1, 1,
-1.728524, -2.706635, -4.908676, 1, 1, 1, 1, 1,
-1.723909, -1.323161, -1.48493, 1, 1, 1, 1, 1,
-1.721945, -0.7934981, -3.511798, 1, 1, 1, 1, 1,
-1.720285, 0.5224788, -0.5659093, 1, 1, 1, 1, 1,
-1.717914, 0.0657134, -2.005175, 1, 1, 1, 1, 1,
-1.714031, -1.117195, -0.7469062, 0, 0, 1, 1, 1,
-1.699357, 0.2096422, -1.770694, 1, 0, 0, 1, 1,
-1.689895, 1.85532, -0.3898987, 1, 0, 0, 1, 1,
-1.676518, -0.9509298, -3.307718, 1, 0, 0, 1, 1,
-1.674349, -0.02049686, -0.5934035, 1, 0, 0, 1, 1,
-1.666191, 1.040331, -1.30935, 1, 0, 0, 1, 1,
-1.660334, 2.662894, 1.48852, 0, 0, 0, 1, 1,
-1.658357, -1.835859, -4.767723, 0, 0, 0, 1, 1,
-1.648366, -1.176691, -3.478462, 0, 0, 0, 1, 1,
-1.645282, -1.481441, -1.970972, 0, 0, 0, 1, 1,
-1.640195, 1.228853, -0.6906985, 0, 0, 0, 1, 1,
-1.638714, 0.03638885, -2.089687, 0, 0, 0, 1, 1,
-1.633873, -0.706863, -2.042558, 0, 0, 0, 1, 1,
-1.633407, -0.4078595, -2.338243, 1, 1, 1, 1, 1,
-1.611324, -0.5044172, -2.364439, 1, 1, 1, 1, 1,
-1.599128, 0.239669, -2.263696, 1, 1, 1, 1, 1,
-1.594611, -0.6743391, 0.673502, 1, 1, 1, 1, 1,
-1.591934, 1.981947, -0.7372864, 1, 1, 1, 1, 1,
-1.578463, -0.4592682, -2.424108, 1, 1, 1, 1, 1,
-1.570302, 0.5944635, -0.3956093, 1, 1, 1, 1, 1,
-1.568, -0.3741514, -0.2743106, 1, 1, 1, 1, 1,
-1.564621, -0.867844, -1.548939, 1, 1, 1, 1, 1,
-1.552073, 3.001132, 0.124228, 1, 1, 1, 1, 1,
-1.545207, 1.472052, 0.1887588, 1, 1, 1, 1, 1,
-1.540618, -0.2309177, -1.820563, 1, 1, 1, 1, 1,
-1.53578, 0.8464865, -0.6736012, 1, 1, 1, 1, 1,
-1.532041, 2.798155, -0.1104454, 1, 1, 1, 1, 1,
-1.523547, -0.5845861, -2.170307, 1, 1, 1, 1, 1,
-1.518112, -0.6721875, -3.1336, 0, 0, 1, 1, 1,
-1.500152, 0.35767, -1.018874, 1, 0, 0, 1, 1,
-1.497042, -0.4558376, -1.136621, 1, 0, 0, 1, 1,
-1.488115, -0.1318791, -1.786996, 1, 0, 0, 1, 1,
-1.473602, -0.6682937, -1.960372, 1, 0, 0, 1, 1,
-1.461995, -1.087394, -3.563801, 1, 0, 0, 1, 1,
-1.448825, -0.7005816, -2.344934, 0, 0, 0, 1, 1,
-1.446317, -0.9141808, -3.387176, 0, 0, 0, 1, 1,
-1.442038, 0.2570096, -2.674942, 0, 0, 0, 1, 1,
-1.440079, 0.2422935, -2.849803, 0, 0, 0, 1, 1,
-1.438217, 0.183258, -2.496264, 0, 0, 0, 1, 1,
-1.419972, 0.56378, -2.128444, 0, 0, 0, 1, 1,
-1.414949, -1.840116, -3.232337, 0, 0, 0, 1, 1,
-1.401526, 0.9204314, -0.7074775, 1, 1, 1, 1, 1,
-1.393426, -1.239644, -2.980166, 1, 1, 1, 1, 1,
-1.385387, -0.134166, -2.276493, 1, 1, 1, 1, 1,
-1.376252, 0.5986441, -1.203925, 1, 1, 1, 1, 1,
-1.372806, -0.9580292, -3.096475, 1, 1, 1, 1, 1,
-1.357094, 0.6466518, -0.5518878, 1, 1, 1, 1, 1,
-1.352464, -0.1695605, -0.641612, 1, 1, 1, 1, 1,
-1.342839, -0.5439718, -0.5677513, 1, 1, 1, 1, 1,
-1.334355, -1.571664, -1.558428, 1, 1, 1, 1, 1,
-1.332644, 1.198861, -0.2239929, 1, 1, 1, 1, 1,
-1.324284, 0.9170452, -1.384256, 1, 1, 1, 1, 1,
-1.322619, 0.2697318, -2.71577, 1, 1, 1, 1, 1,
-1.321991, -0.5303084, -1.651663, 1, 1, 1, 1, 1,
-1.321087, -0.1645068, -3.527334, 1, 1, 1, 1, 1,
-1.318558, -1.051248, -1.620299, 1, 1, 1, 1, 1,
-1.313833, 1.505766, -0.3619766, 0, 0, 1, 1, 1,
-1.307873, 1.470406, 0.03269907, 1, 0, 0, 1, 1,
-1.307862, -1.361153, -2.842903, 1, 0, 0, 1, 1,
-1.303734, -1.024295, -3.146168, 1, 0, 0, 1, 1,
-1.303447, 0.5251879, -0.2205077, 1, 0, 0, 1, 1,
-1.296632, 0.1524082, -1.374676, 1, 0, 0, 1, 1,
-1.289304, 0.8005356, -2.135721, 0, 0, 0, 1, 1,
-1.271545, -1.068987, -1.338443, 0, 0, 0, 1, 1,
-1.260092, 0.1184975, -1.473851, 0, 0, 0, 1, 1,
-1.255584, -0.5910363, 0.7663884, 0, 0, 0, 1, 1,
-1.247751, -0.2329521, -1.000916, 0, 0, 0, 1, 1,
-1.237478, -0.7819282, -3.61678, 0, 0, 0, 1, 1,
-1.237057, -0.8950907, -0.9918309, 0, 0, 0, 1, 1,
-1.225611, 1.568683, -1.050122, 1, 1, 1, 1, 1,
-1.224907, -0.5314389, -3.060074, 1, 1, 1, 1, 1,
-1.221418, 0.1773861, 0.4935651, 1, 1, 1, 1, 1,
-1.213851, -2.01211, -1.353126, 1, 1, 1, 1, 1,
-1.212028, 1.198035, -1.550314, 1, 1, 1, 1, 1,
-1.210172, -0.2214034, -2.987451, 1, 1, 1, 1, 1,
-1.209552, -0.742682, -1.313301, 1, 1, 1, 1, 1,
-1.209259, -0.6806091, -2.083204, 1, 1, 1, 1, 1,
-1.195557, 1.2836, 0.7356465, 1, 1, 1, 1, 1,
-1.184885, 0.4035197, -2.259301, 1, 1, 1, 1, 1,
-1.179374, 1.376225, 0.2828157, 1, 1, 1, 1, 1,
-1.178994, 0.6105497, -0.751739, 1, 1, 1, 1, 1,
-1.178041, 0.6959313, -0.5577327, 1, 1, 1, 1, 1,
-1.177999, 0.7969481, -0.422375, 1, 1, 1, 1, 1,
-1.169878, -1.549435, -1.186496, 1, 1, 1, 1, 1,
-1.16881, 0.9118729, -1.025021, 0, 0, 1, 1, 1,
-1.168653, -1.499408, -2.974787, 1, 0, 0, 1, 1,
-1.16815, -0.1184879, -0.8940736, 1, 0, 0, 1, 1,
-1.167326, 1.331759, -1.666997, 1, 0, 0, 1, 1,
-1.149475, -0.7219527, -1.477916, 1, 0, 0, 1, 1,
-1.147226, -0.1039198, -1.043296, 1, 0, 0, 1, 1,
-1.145682, -0.7264906, -2.920526, 0, 0, 0, 1, 1,
-1.134653, 0.5379262, -0.600152, 0, 0, 0, 1, 1,
-1.132275, -0.6723104, -1.835787, 0, 0, 0, 1, 1,
-1.123731, -1.043049, -2.674716, 0, 0, 0, 1, 1,
-1.122885, -0.3970656, -0.1207753, 0, 0, 0, 1, 1,
-1.117266, -2.723807, -2.51008, 0, 0, 0, 1, 1,
-1.116383, -0.01896061, -1.007865, 0, 0, 0, 1, 1,
-1.088218, -0.8322652, -1.592711, 1, 1, 1, 1, 1,
-1.081298, -0.4459225, -3.486001, 1, 1, 1, 1, 1,
-1.08021, -0.5449419, -1.999563, 1, 1, 1, 1, 1,
-1.075796, -0.1007062, -0.5472146, 1, 1, 1, 1, 1,
-1.069777, 0.04962622, -1.977314, 1, 1, 1, 1, 1,
-1.069454, -1.394805, -2.685493, 1, 1, 1, 1, 1,
-1.053804, 1.088105, -0.7591035, 1, 1, 1, 1, 1,
-1.050927, 0.8818374, 1.680379, 1, 1, 1, 1, 1,
-1.050689, 1.925372, -1.216109, 1, 1, 1, 1, 1,
-1.045373, 0.07571855, -1.337257, 1, 1, 1, 1, 1,
-1.040982, -2.224999, -3.465693, 1, 1, 1, 1, 1,
-1.040766, 2.363251, 1.353139, 1, 1, 1, 1, 1,
-1.039397, 2.041101, -1.319096, 1, 1, 1, 1, 1,
-1.033486, 1.542681, -0.7085907, 1, 1, 1, 1, 1,
-1.033424, 0.3339539, -1.763921, 1, 1, 1, 1, 1,
-1.028624, -0.1199882, -0.4138357, 0, 0, 1, 1, 1,
-1.027868, 0.8659458, 0.6871417, 1, 0, 0, 1, 1,
-1.025127, 1.399338, 0.3697937, 1, 0, 0, 1, 1,
-1.022236, -0.4919882, -1.704145, 1, 0, 0, 1, 1,
-1.020813, -1.124563, -3.520219, 1, 0, 0, 1, 1,
-1.015552, 1.267488, 0.519316, 1, 0, 0, 1, 1,
-1.011868, 0.6459796, -0.5074691, 0, 0, 0, 1, 1,
-1.006036, 0.2065712, -1.454141, 0, 0, 0, 1, 1,
-1.005413, 0.2523212, -1.412954, 0, 0, 0, 1, 1,
-1.001351, -0.949253, -2.586271, 0, 0, 0, 1, 1,
-0.9996647, 0.5477492, -0.4151632, 0, 0, 0, 1, 1,
-0.9956306, 0.2685207, -2.972846, 0, 0, 0, 1, 1,
-0.9932915, 0.2802303, -2.119203, 0, 0, 0, 1, 1,
-0.9897, 0.789235, -1.738641, 1, 1, 1, 1, 1,
-0.9892066, -0.9782034, -2.367555, 1, 1, 1, 1, 1,
-0.9871309, -0.3983101, -1.388713, 1, 1, 1, 1, 1,
-0.9846569, -0.9367648, -2.030141, 1, 1, 1, 1, 1,
-0.9827084, 0.08638753, 0.1044395, 1, 1, 1, 1, 1,
-0.9751598, 0.2266137, -1.733025, 1, 1, 1, 1, 1,
-0.9692321, 0.8714288, 0.03130747, 1, 1, 1, 1, 1,
-0.9668033, -0.3103826, -2.352342, 1, 1, 1, 1, 1,
-0.9664361, -0.4472027, -2.349165, 1, 1, 1, 1, 1,
-0.9640624, -1.071211, -2.118539, 1, 1, 1, 1, 1,
-0.9633384, 0.8375326, -1.028401, 1, 1, 1, 1, 1,
-0.959268, -0.6379863, -1.656277, 1, 1, 1, 1, 1,
-0.9550024, 0.5279812, -1.824528, 1, 1, 1, 1, 1,
-0.952041, 0.3384681, -0.4960797, 1, 1, 1, 1, 1,
-0.9518402, 0.5502967, -3.001858, 1, 1, 1, 1, 1,
-0.9516959, 0.2907176, -0.2183279, 0, 0, 1, 1, 1,
-0.9469814, 0.4673513, -2.561261, 1, 0, 0, 1, 1,
-0.9398272, -0.801187, -1.593808, 1, 0, 0, 1, 1,
-0.9384649, 0.07057441, -1.576306, 1, 0, 0, 1, 1,
-0.9331778, 0.8749734, -0.4968044, 1, 0, 0, 1, 1,
-0.9302896, 0.5358579, -0.2329622, 1, 0, 0, 1, 1,
-0.925384, -0.3295212, -2.471954, 0, 0, 0, 1, 1,
-0.921129, -0.3495943, -1.383091, 0, 0, 0, 1, 1,
-0.9182008, 0.4183249, -0.1495236, 0, 0, 0, 1, 1,
-0.9165245, -0.9026496, -3.486845, 0, 0, 0, 1, 1,
-0.9137683, -1.229402, -0.499543, 0, 0, 0, 1, 1,
-0.9135854, 0.3691477, 0.3328848, 0, 0, 0, 1, 1,
-0.9068964, -0.471411, 0.5926299, 0, 0, 0, 1, 1,
-0.9042979, -1.25148, -2.810452, 1, 1, 1, 1, 1,
-0.9018924, -0.4225483, -1.223599, 1, 1, 1, 1, 1,
-0.8947034, -0.6910589, -2.026549, 1, 1, 1, 1, 1,
-0.8935592, -1.45011, -0.2851845, 1, 1, 1, 1, 1,
-0.8905011, 0.05075812, -1.505188, 1, 1, 1, 1, 1,
-0.8849973, -0.2654669, -3.229941, 1, 1, 1, 1, 1,
-0.8824393, 0.4606266, -0.7778789, 1, 1, 1, 1, 1,
-0.8821362, -2.828309, -3.868542, 1, 1, 1, 1, 1,
-0.875588, 0.2720708, -3.115546, 1, 1, 1, 1, 1,
-0.8739471, 1.101961, -0.6140918, 1, 1, 1, 1, 1,
-0.8736636, -1.153997, -2.958199, 1, 1, 1, 1, 1,
-0.8709275, -0.8558629, -2.849513, 1, 1, 1, 1, 1,
-0.8680884, 1.089198, -0.3197455, 1, 1, 1, 1, 1,
-0.8606243, 0.8773552, -0.6821923, 1, 1, 1, 1, 1,
-0.850337, -0.8256789, -2.500764, 1, 1, 1, 1, 1,
-0.8387923, 0.351916, -1.916564, 0, 0, 1, 1, 1,
-0.8382172, -0.4326611, -1.237578, 1, 0, 0, 1, 1,
-0.8337425, 0.5015126, -1.118333, 1, 0, 0, 1, 1,
-0.8324604, -0.9000197, -1.546044, 1, 0, 0, 1, 1,
-0.8310188, 1.361069, 0.5629114, 1, 0, 0, 1, 1,
-0.8266439, 0.4577626, -2.232192, 1, 0, 0, 1, 1,
-0.8241377, -2.290281, -3.190967, 0, 0, 0, 1, 1,
-0.8209155, -0.363115, -2.374234, 0, 0, 0, 1, 1,
-0.813672, -1.125823, -3.355716, 0, 0, 0, 1, 1,
-0.8054761, 0.3539943, -0.07294487, 0, 0, 0, 1, 1,
-0.7904139, -0.5432059, -1.477651, 0, 0, 0, 1, 1,
-0.7900484, -0.2414627, -3.81724, 0, 0, 0, 1, 1,
-0.788514, 1.681635, -0.1267324, 0, 0, 0, 1, 1,
-0.7874399, -1.014806, -2.894214, 1, 1, 1, 1, 1,
-0.785304, -0.2772917, -2.077425, 1, 1, 1, 1, 1,
-0.7834983, 1.499769, -1.221565, 1, 1, 1, 1, 1,
-0.77969, -1.25221, -2.853749, 1, 1, 1, 1, 1,
-0.7792845, 0.8242795, 1.123417, 1, 1, 1, 1, 1,
-0.7724606, 1.262361, 0.06821686, 1, 1, 1, 1, 1,
-0.7605025, -1.659598, -2.839997, 1, 1, 1, 1, 1,
-0.7474181, -0.3625364, -2.07621, 1, 1, 1, 1, 1,
-0.7469904, 0.3280102, -0.3232725, 1, 1, 1, 1, 1,
-0.7468993, 0.4186896, 0.4383106, 1, 1, 1, 1, 1,
-0.7434396, 1.260203, -0.005103552, 1, 1, 1, 1, 1,
-0.7395025, -0.3644698, -2.454023, 1, 1, 1, 1, 1,
-0.7356431, -1.008881, -3.724768, 1, 1, 1, 1, 1,
-0.7275574, -0.2245724, -3.561936, 1, 1, 1, 1, 1,
-0.7192883, -1.137357, -4.3062, 1, 1, 1, 1, 1,
-0.7120334, -0.3261579, 0.2256484, 0, 0, 1, 1, 1,
-0.7117926, -0.4074216, -2.608908, 1, 0, 0, 1, 1,
-0.710872, 0.4981457, 0.1364239, 1, 0, 0, 1, 1,
-0.7105628, 1.079897, -0.6428378, 1, 0, 0, 1, 1,
-0.7101611, -1.344234, -4.302845, 1, 0, 0, 1, 1,
-0.7095451, -0.6640185, -2.344543, 1, 0, 0, 1, 1,
-0.7095308, -0.03873821, -1.951563, 0, 0, 0, 1, 1,
-0.7025957, 0.2727289, -0.7969639, 0, 0, 0, 1, 1,
-0.7007944, 0.3493671, -3.43802, 0, 0, 0, 1, 1,
-0.6999065, 0.445498, -0.7369333, 0, 0, 0, 1, 1,
-0.6985589, -2.068988, -2.15011, 0, 0, 0, 1, 1,
-0.6950981, -0.739978, -1.551602, 0, 0, 0, 1, 1,
-0.6910959, -0.8324605, -2.951454, 0, 0, 0, 1, 1,
-0.6894678, -0.06738291, -1.532241, 1, 1, 1, 1, 1,
-0.6886186, 0.1249608, -1.209468, 1, 1, 1, 1, 1,
-0.6858237, -0.3449712, -2.647051, 1, 1, 1, 1, 1,
-0.6798536, 1.018119, -2.103619, 1, 1, 1, 1, 1,
-0.677845, 0.005304768, -2.454604, 1, 1, 1, 1, 1,
-0.6769736, -0.1665216, -0.9190508, 1, 1, 1, 1, 1,
-0.6761487, -1.319007, -1.838995, 1, 1, 1, 1, 1,
-0.6713879, -1.425778, -3.180598, 1, 1, 1, 1, 1,
-0.6693704, 0.03250493, -1.562304, 1, 1, 1, 1, 1,
-0.6655967, 1.333015, 0.09965146, 1, 1, 1, 1, 1,
-0.6622043, -0.5999923, -0.3265733, 1, 1, 1, 1, 1,
-0.6616562, -0.8272808, -1.154882, 1, 1, 1, 1, 1,
-0.6603871, 0.9165285, -1.582922, 1, 1, 1, 1, 1,
-0.6554551, -0.321722, -2.552961, 1, 1, 1, 1, 1,
-0.6545383, -0.6862119, -2.756439, 1, 1, 1, 1, 1,
-0.652881, 1.250992, -0.2852963, 0, 0, 1, 1, 1,
-0.6520836, 0.06563133, -0.7045396, 1, 0, 0, 1, 1,
-0.6487601, -0.1295781, -2.174728, 1, 0, 0, 1, 1,
-0.6486205, -0.7313034, -2.024529, 1, 0, 0, 1, 1,
-0.6473416, -0.6005212, 0.07123107, 1, 0, 0, 1, 1,
-0.6440257, -1.574025, -4.304887, 1, 0, 0, 1, 1,
-0.6425309, -1.583474, -2.878404, 0, 0, 0, 1, 1,
-0.6407617, -0.5989218, -1.694745, 0, 0, 0, 1, 1,
-0.6403316, 1.011838, -1.284456, 0, 0, 0, 1, 1,
-0.6401835, -1.558461, -2.538763, 0, 0, 0, 1, 1,
-0.627582, -2.784586, -3.650969, 0, 0, 0, 1, 1,
-0.6250747, 0.6643857, -2.176028, 0, 0, 0, 1, 1,
-0.6221439, -0.3265016, -2.797849, 0, 0, 0, 1, 1,
-0.6199661, 3.224206, 0.04651884, 1, 1, 1, 1, 1,
-0.6169367, 0.4679279, 0.649868, 1, 1, 1, 1, 1,
-0.6152542, 0.9704689, -0.6581075, 1, 1, 1, 1, 1,
-0.6148052, -0.1005051, -2.24129, 1, 1, 1, 1, 1,
-0.6126892, -0.8682494, -2.40016, 1, 1, 1, 1, 1,
-0.6108945, -0.9772211, -2.416898, 1, 1, 1, 1, 1,
-0.6107694, 1.090809, 0.8663815, 1, 1, 1, 1, 1,
-0.6107227, 0.9617872, 0.8903431, 1, 1, 1, 1, 1,
-0.6043395, -0.7340332, -2.62654, 1, 1, 1, 1, 1,
-0.6031386, -0.1402946, -1.010633, 1, 1, 1, 1, 1,
-0.6025189, -1.78762, -1.65921, 1, 1, 1, 1, 1,
-0.6017483, 0.9349667, -0.1237518, 1, 1, 1, 1, 1,
-0.6001723, 1.000044, -1.762115, 1, 1, 1, 1, 1,
-0.5909815, -0.3247956, -0.1295938, 1, 1, 1, 1, 1,
-0.5905317, 0.3539209, -1.994757, 1, 1, 1, 1, 1,
-0.5864763, -1.328838, -2.24435, 0, 0, 1, 1, 1,
-0.5855417, 0.3216886, -0.7523949, 1, 0, 0, 1, 1,
-0.585201, -0.215817, -1.050685, 1, 0, 0, 1, 1,
-0.5814481, 0.9531296, -0.9863511, 1, 0, 0, 1, 1,
-0.5807095, 1.226634, -0.814665, 1, 0, 0, 1, 1,
-0.5800489, 0.5998821, -2.039789, 1, 0, 0, 1, 1,
-0.5790337, 0.4263384, -1.059762, 0, 0, 0, 1, 1,
-0.5769552, -1.007707, -2.734255, 0, 0, 0, 1, 1,
-0.5745789, -0.3347962, -0.5307385, 0, 0, 0, 1, 1,
-0.5665613, 0.9122453, 0.4555381, 0, 0, 0, 1, 1,
-0.5664418, -0.8774442, -3.412076, 0, 0, 0, 1, 1,
-0.5637671, 0.4750518, -0.4975021, 0, 0, 0, 1, 1,
-0.5614566, 0.4528767, -2.203384, 0, 0, 0, 1, 1,
-0.5595074, 0.3448977, 0.3303312, 1, 1, 1, 1, 1,
-0.5565537, 0.7290009, -1.456582, 1, 1, 1, 1, 1,
-0.5537892, -0.06140225, -1.365319, 1, 1, 1, 1, 1,
-0.5510989, 2.108794, -0.5740356, 1, 1, 1, 1, 1,
-0.548737, -0.4967651, -2.561719, 1, 1, 1, 1, 1,
-0.5475563, -0.7646253, -3.191662, 1, 1, 1, 1, 1,
-0.5434846, -1.75086, -1.823984, 1, 1, 1, 1, 1,
-0.5403564, -0.4844615, -3.346651, 1, 1, 1, 1, 1,
-0.5371606, 1.2503, 0.3898482, 1, 1, 1, 1, 1,
-0.5365366, -0.6724394, -4.874225, 1, 1, 1, 1, 1,
-0.5355006, -0.7197949, -2.901817, 1, 1, 1, 1, 1,
-0.5353805, -0.2487755, -1.895834, 1, 1, 1, 1, 1,
-0.5346515, -0.1500022, -1.725626, 1, 1, 1, 1, 1,
-0.5288925, 1.044434, -0.7411755, 1, 1, 1, 1, 1,
-0.5282317, -0.1088296, -1.764934, 1, 1, 1, 1, 1,
-0.5273305, -0.716197, -2.545832, 0, 0, 1, 1, 1,
-0.5261559, -0.9544711, -3.629918, 1, 0, 0, 1, 1,
-0.5168568, -0.09024896, -0.4939219, 1, 0, 0, 1, 1,
-0.5152651, -1.106348, -3.142051, 1, 0, 0, 1, 1,
-0.5146884, -0.7730072, -2.730519, 1, 0, 0, 1, 1,
-0.5117317, 0.04440454, -2.067614, 1, 0, 0, 1, 1,
-0.5063933, 1.839693, -2.139948, 0, 0, 0, 1, 1,
-0.5061378, -0.3356512, -1.865741, 0, 0, 0, 1, 1,
-0.5042258, -0.6885685, -2.795919, 0, 0, 0, 1, 1,
-0.5033534, 1.611629, 0.1631114, 0, 0, 0, 1, 1,
-0.5009861, 0.9344637, 0.2461647, 0, 0, 0, 1, 1,
-0.4987529, -1.355938, -4.364084, 0, 0, 0, 1, 1,
-0.4912686, -0.9158259, -3.510534, 0, 0, 0, 1, 1,
-0.4880997, -1.768283, -2.063495, 1, 1, 1, 1, 1,
-0.486546, 0.05495026, -1.347303, 1, 1, 1, 1, 1,
-0.486455, -0.06579995, -0.9989809, 1, 1, 1, 1, 1,
-0.4808141, 1.3246, -0.9763217, 1, 1, 1, 1, 1,
-0.4749801, 1.263554, 0.3673384, 1, 1, 1, 1, 1,
-0.4749565, -0.1949381, -4.403907, 1, 1, 1, 1, 1,
-0.4743928, 0.4645683, -0.6871194, 1, 1, 1, 1, 1,
-0.4716321, -0.04382056, -1.296438, 1, 1, 1, 1, 1,
-0.4707027, -2.811887, -2.274858, 1, 1, 1, 1, 1,
-0.4678177, -0.4744366, -0.9610685, 1, 1, 1, 1, 1,
-0.4632595, 1.001419, -2.485924, 1, 1, 1, 1, 1,
-0.4624323, 1.577511, -0.772756, 1, 1, 1, 1, 1,
-0.4604134, -1.004998, -1.275841, 1, 1, 1, 1, 1,
-0.4561681, -0.1061029, 1.226331, 1, 1, 1, 1, 1,
-0.4530116, -0.7364934, -2.70677, 1, 1, 1, 1, 1,
-0.4516482, 0.669416, -0.8417528, 0, 0, 1, 1, 1,
-0.4509002, -0.2810857, -2.012845, 1, 0, 0, 1, 1,
-0.4500312, -0.02827636, -1.204498, 1, 0, 0, 1, 1,
-0.4487014, -0.2335684, -3.757956, 1, 0, 0, 1, 1,
-0.4469002, -0.5972279, -1.69868, 1, 0, 0, 1, 1,
-0.4421856, 0.2658873, -1.729844, 1, 0, 0, 1, 1,
-0.4408367, 0.5838614, 1.549066, 0, 0, 0, 1, 1,
-0.4389294, -0.4337784, -2.371342, 0, 0, 0, 1, 1,
-0.4306312, -0.05013796, -0.7775391, 0, 0, 0, 1, 1,
-0.430082, -0.5900925, -2.522385, 0, 0, 0, 1, 1,
-0.4275143, 1.34286, 0.2134694, 0, 0, 0, 1, 1,
-0.4240371, -1.639127, -2.243091, 0, 0, 0, 1, 1,
-0.4210715, -0.797868, -2.566676, 0, 0, 0, 1, 1,
-0.4157086, 1.432248, -2.311844, 1, 1, 1, 1, 1,
-0.4153264, 1.351635, 0.6764409, 1, 1, 1, 1, 1,
-0.4138491, 0.1506761, -1.407807, 1, 1, 1, 1, 1,
-0.4087448, -0.4813025, -2.832168, 1, 1, 1, 1, 1,
-0.4056596, -0.5408019, -2.224857, 1, 1, 1, 1, 1,
-0.4036534, -0.7368693, -2.958859, 1, 1, 1, 1, 1,
-0.3941465, 1.168862, -2.133782, 1, 1, 1, 1, 1,
-0.3918961, 0.3946441, -1.055169, 1, 1, 1, 1, 1,
-0.382935, 0.0280703, -1.368644, 1, 1, 1, 1, 1,
-0.3803631, 0.4524697, 0.9320011, 1, 1, 1, 1, 1,
-0.379543, -1.423989, -1.10447, 1, 1, 1, 1, 1,
-0.3782513, 1.485104, 1.25728, 1, 1, 1, 1, 1,
-0.3768586, -1.884205, -3.620698, 1, 1, 1, 1, 1,
-0.3746161, -0.211722, 0.4097579, 1, 1, 1, 1, 1,
-0.3667682, -0.8977553, -1.157636, 1, 1, 1, 1, 1,
-0.3658167, -0.5688222, -1.463681, 0, 0, 1, 1, 1,
-0.3654785, 0.4835229, -1.24019, 1, 0, 0, 1, 1,
-0.3572805, -0.3091949, -2.654917, 1, 0, 0, 1, 1,
-0.353383, 2.283489, -0.6390838, 1, 0, 0, 1, 1,
-0.3469922, 1.492678, 1.226018, 1, 0, 0, 1, 1,
-0.3464986, 0.6398453, -1.640295, 1, 0, 0, 1, 1,
-0.3452499, -0.2103519, -1.963708, 0, 0, 0, 1, 1,
-0.3445124, 0.3294746, -0.2543302, 0, 0, 0, 1, 1,
-0.3429269, -0.3865021, -1.855151, 0, 0, 0, 1, 1,
-0.3422828, 1.324018, 1.21736, 0, 0, 0, 1, 1,
-0.3399625, 1.123962, 0.3110862, 0, 0, 0, 1, 1,
-0.3286418, 0.001279378, -2.378295, 0, 0, 0, 1, 1,
-0.3273782, 0.8700132, 0.5560942, 0, 0, 0, 1, 1,
-0.3239114, 0.4362994, -1.855787, 1, 1, 1, 1, 1,
-0.314626, 0.1793312, -0.531759, 1, 1, 1, 1, 1,
-0.3102381, -0.3125486, -2.996323, 1, 1, 1, 1, 1,
-0.3047428, 0.5318294, -1.372158, 1, 1, 1, 1, 1,
-0.3039168, -1.09981, -1.278657, 1, 1, 1, 1, 1,
-0.3001421, -0.621801, -1.729223, 1, 1, 1, 1, 1,
-0.2996572, 0.3145719, -0.2835217, 1, 1, 1, 1, 1,
-0.2972872, 0.1969525, -1.564771, 1, 1, 1, 1, 1,
-0.297232, 0.5980749, -0.6492186, 1, 1, 1, 1, 1,
-0.29452, -0.4335747, -1.965842, 1, 1, 1, 1, 1,
-0.2884636, -1.209488, -3.367525, 1, 1, 1, 1, 1,
-0.2855135, -0.3695519, -2.06795, 1, 1, 1, 1, 1,
-0.2851657, -2.333547, -3.991458, 1, 1, 1, 1, 1,
-0.278532, -0.4436022, -3.428644, 1, 1, 1, 1, 1,
-0.2754998, 1.262374, 1.921078, 1, 1, 1, 1, 1,
-0.2749594, 0.1699318, -1.197771, 0, 0, 1, 1, 1,
-0.274829, 1.866691, 1.803478, 1, 0, 0, 1, 1,
-0.2702108, 0.4412522, -0.5919287, 1, 0, 0, 1, 1,
-0.2668214, 2.049318, 0.9747167, 1, 0, 0, 1, 1,
-0.2664018, 0.1690272, -2.00078, 1, 0, 0, 1, 1,
-0.2650788, 1.189812, -0.3994624, 1, 0, 0, 1, 1,
-0.2616645, -1.162167, -1.873187, 0, 0, 0, 1, 1,
-0.2612578, 0.1218228, -0.6483011, 0, 0, 0, 1, 1,
-0.2610203, 2.491535, 1.073916, 0, 0, 0, 1, 1,
-0.2608472, 1.184293, 0.5764418, 0, 0, 0, 1, 1,
-0.2603974, -1.842618, -3.305981, 0, 0, 0, 1, 1,
-0.2584884, -0.2864213, -2.740072, 0, 0, 0, 1, 1,
-0.2581631, -0.6326643, -2.080407, 0, 0, 0, 1, 1,
-0.2548005, 1.352224, -0.5217216, 1, 1, 1, 1, 1,
-0.2522035, 0.2267332, 0.1725192, 1, 1, 1, 1, 1,
-0.2473109, 1.16847, -1.170186, 1, 1, 1, 1, 1,
-0.2453766, -2.411322, -2.839918, 1, 1, 1, 1, 1,
-0.2449711, 0.3972161, -1.583099, 1, 1, 1, 1, 1,
-0.2436806, 0.3897196, -0.3051969, 1, 1, 1, 1, 1,
-0.242798, 1.010502, -1.578284, 1, 1, 1, 1, 1,
-0.2425348, -1.491422, -1.923454, 1, 1, 1, 1, 1,
-0.2370507, 0.3214635, -1.011755, 1, 1, 1, 1, 1,
-0.2351802, 0.6089752, -0.9208487, 1, 1, 1, 1, 1,
-0.2324148, 1.141852, 1.036121, 1, 1, 1, 1, 1,
-0.2320847, 0.9633054, -0.6641366, 1, 1, 1, 1, 1,
-0.2250183, -0.6739685, -3.783698, 1, 1, 1, 1, 1,
-0.222062, -1.183742, -2.949927, 1, 1, 1, 1, 1,
-0.2208947, -0.4633915, -2.036498, 1, 1, 1, 1, 1,
-0.2199632, 1.014498, 0.4949984, 0, 0, 1, 1, 1,
-0.2166012, -0.5094609, -2.343737, 1, 0, 0, 1, 1,
-0.2126623, 0.04350511, -2.322564, 1, 0, 0, 1, 1,
-0.2112961, 1.009185, 1.743354, 1, 0, 0, 1, 1,
-0.2099337, -0.796629, -4.866433, 1, 0, 0, 1, 1,
-0.2079027, 0.05427378, -1.487699, 1, 0, 0, 1, 1,
-0.2052972, -0.01884967, -3.173082, 0, 0, 0, 1, 1,
-0.2031853, 1.461895, 0.2945603, 0, 0, 0, 1, 1,
-0.2015137, -1.268157, -3.763624, 0, 0, 0, 1, 1,
-0.1975731, 0.4386955, -0.256363, 0, 0, 0, 1, 1,
-0.1906561, -0.3143035, -3.973722, 0, 0, 0, 1, 1,
-0.1890858, 0.5667937, 1.240121, 0, 0, 0, 1, 1,
-0.1872629, -0.2567866, -3.413323, 0, 0, 0, 1, 1,
-0.178969, 0.6246245, 0.04046051, 1, 1, 1, 1, 1,
-0.1695625, 0.3109866, -2.869611, 1, 1, 1, 1, 1,
-0.1692187, -0.1578124, -0.7947719, 1, 1, 1, 1, 1,
-0.1659088, 1.601635, -0.5755179, 1, 1, 1, 1, 1,
-0.1658519, 0.08216193, -2.019189, 1, 1, 1, 1, 1,
-0.1647989, -0.01612217, -2.49543, 1, 1, 1, 1, 1,
-0.1617616, -0.6561203, -2.632448, 1, 1, 1, 1, 1,
-0.1611528, 1.545502, -0.6872825, 1, 1, 1, 1, 1,
-0.1609413, -0.1359152, -3.255118, 1, 1, 1, 1, 1,
-0.1573822, -2.250032, -2.847342, 1, 1, 1, 1, 1,
-0.1492614, -1.544949, -2.395648, 1, 1, 1, 1, 1,
-0.1467824, 0.09087463, -1.659703, 1, 1, 1, 1, 1,
-0.1452152, -0.1967458, -1.555118, 1, 1, 1, 1, 1,
-0.1429708, -0.1728299, -1.215322, 1, 1, 1, 1, 1,
-0.1411673, -0.9689398, -3.628272, 1, 1, 1, 1, 1,
-0.1406594, 0.5397959, 0.3363744, 0, 0, 1, 1, 1,
-0.1396906, 0.3142292, -0.9885874, 1, 0, 0, 1, 1,
-0.1379716, -0.949216, -3.71212, 1, 0, 0, 1, 1,
-0.1377409, -0.3438618, -2.588649, 1, 0, 0, 1, 1,
-0.1288877, -0.3318464, -2.050726, 1, 0, 0, 1, 1,
-0.1284987, 1.150253, 0.447855, 1, 0, 0, 1, 1,
-0.1251262, 1.762861, 0.1561203, 0, 0, 0, 1, 1,
-0.1238221, -0.09601595, -1.553883, 0, 0, 0, 1, 1,
-0.1196954, -1.652807, -2.683694, 0, 0, 0, 1, 1,
-0.1147155, 0.4870144, 0.1915777, 0, 0, 0, 1, 1,
-0.1138723, 0.7721035, -0.3191423, 0, 0, 0, 1, 1,
-0.1102423, -0.4846948, -2.298522, 0, 0, 0, 1, 1,
-0.1090599, -1.003538, -1.532237, 0, 0, 0, 1, 1,
-0.1081699, 1.047609, -1.683493, 1, 1, 1, 1, 1,
-0.1068764, 0.6162481, 0.5244925, 1, 1, 1, 1, 1,
-0.1042444, 0.007154989, 0.4236326, 1, 1, 1, 1, 1,
-0.1031244, 0.3557773, 0.1000914, 1, 1, 1, 1, 1,
-0.09664142, 1.226865, 1.653224, 1, 1, 1, 1, 1,
-0.09549116, 2.071556, 0.1246795, 1, 1, 1, 1, 1,
-0.08827025, 1.553762, 1.044537, 1, 1, 1, 1, 1,
-0.08644865, -0.1275031, -1.033025, 1, 1, 1, 1, 1,
-0.08460917, -0.1891022, -3.159806, 1, 1, 1, 1, 1,
-0.07893031, 1.597922, -0.2376398, 1, 1, 1, 1, 1,
-0.07854801, 0.4910915, -0.3603993, 1, 1, 1, 1, 1,
-0.07630707, -0.1528011, -3.821667, 1, 1, 1, 1, 1,
-0.0758437, 0.3528758, 1.121443, 1, 1, 1, 1, 1,
-0.06896023, -0.6979703, -1.146069, 1, 1, 1, 1, 1,
-0.06816025, -1.69738, -2.433018, 1, 1, 1, 1, 1,
-0.05913327, -0.7119732, -2.773628, 0, 0, 1, 1, 1,
-0.05858228, 0.2524202, -2.808124, 1, 0, 0, 1, 1,
-0.0578329, -0.4249647, -1.684379, 1, 0, 0, 1, 1,
-0.05473494, 0.5488721, -0.8574385, 1, 0, 0, 1, 1,
-0.05445521, -1.453586, -1.647212, 1, 0, 0, 1, 1,
-0.04477278, -1.19274, -6.663904, 1, 0, 0, 1, 1,
-0.03489876, -0.3447204, -2.906075, 0, 0, 0, 1, 1,
-0.03301647, 0.4948445, 1.032337, 0, 0, 0, 1, 1,
-0.03280826, 0.7011979, 1.110611, 0, 0, 0, 1, 1,
-0.03255127, 0.3851434, -0.8709347, 0, 0, 0, 1, 1,
-0.03251979, 0.1225255, -0.3739537, 0, 0, 0, 1, 1,
-0.02678825, 0.4626021, -1.476884, 0, 0, 0, 1, 1,
-0.02617823, -0.5125155, -2.817303, 0, 0, 0, 1, 1,
-0.01868221, -0.1630162, -2.054033, 1, 1, 1, 1, 1,
-0.01685578, 0.7338904, 0.5484055, 1, 1, 1, 1, 1,
-0.01623653, 2.454344, 2.118575, 1, 1, 1, 1, 1,
-0.01436127, -0.04105403, -3.123913, 1, 1, 1, 1, 1,
-0.0136497, 0.8882806, -0.3836379, 1, 1, 1, 1, 1,
-0.01060309, -1.788699, -3.482338, 1, 1, 1, 1, 1,
-0.009311068, -1.902601, -1.534737, 1, 1, 1, 1, 1,
-0.008361415, -0.2596025, -2.227449, 1, 1, 1, 1, 1,
-0.007590865, 0.320521, -0.2433417, 1, 1, 1, 1, 1,
-0.003528615, 0.2074797, -1.336933, 1, 1, 1, 1, 1,
-0.003262425, 0.2165935, 1.047604, 1, 1, 1, 1, 1,
0.006053274, 0.9187815, 1.00071, 1, 1, 1, 1, 1,
0.006297271, -0.1885716, 3.74685, 1, 1, 1, 1, 1,
0.007085259, -1.15705, 3.391425, 1, 1, 1, 1, 1,
0.007994466, 1.211205, 0.8984016, 1, 1, 1, 1, 1,
0.009546279, 1.146221, -1.39053, 0, 0, 1, 1, 1,
0.009700775, -1.04297, 3.517083, 1, 0, 0, 1, 1,
0.01119235, 0.3583894, 0.9157873, 1, 0, 0, 1, 1,
0.01175182, -0.01764428, 3.269, 1, 0, 0, 1, 1,
0.01789748, -1.172085, 3.429927, 1, 0, 0, 1, 1,
0.01830998, 0.4125411, 0.8678132, 1, 0, 0, 1, 1,
0.02217226, 0.6083597, -0.8212972, 0, 0, 0, 1, 1,
0.0224774, -0.5036941, 3.481816, 0, 0, 0, 1, 1,
0.02415423, 1.652441, 0.6171002, 0, 0, 0, 1, 1,
0.02922028, -0.2587218, 3.311861, 0, 0, 0, 1, 1,
0.03102666, 0.9936972, -1.000871, 0, 0, 0, 1, 1,
0.03312248, -1.160232, 2.949248, 0, 0, 0, 1, 1,
0.03396007, 1.977685, 0.02424326, 0, 0, 0, 1, 1,
0.03715303, 1.797444, 0.1422075, 1, 1, 1, 1, 1,
0.03830195, -0.01056734, 2.137651, 1, 1, 1, 1, 1,
0.04008157, -1.423239, 2.562331, 1, 1, 1, 1, 1,
0.04240051, -0.1741605, 4.397404, 1, 1, 1, 1, 1,
0.04442459, 2.211744, 0.1011213, 1, 1, 1, 1, 1,
0.04922527, -1.850901, 2.251311, 1, 1, 1, 1, 1,
0.04934129, -0.2500547, 3.753224, 1, 1, 1, 1, 1,
0.0525636, 2.053345, 0.3421628, 1, 1, 1, 1, 1,
0.05370588, 1.515042, 1.39777, 1, 1, 1, 1, 1,
0.0557977, -0.05613156, 2.679177, 1, 1, 1, 1, 1,
0.05736, -0.5213528, 2.228413, 1, 1, 1, 1, 1,
0.06451263, -0.6864876, 3.302216, 1, 1, 1, 1, 1,
0.06616829, -2.080978, 3.324009, 1, 1, 1, 1, 1,
0.07025333, -0.1145422, 2.701493, 1, 1, 1, 1, 1,
0.07332793, 0.01211339, 1.037986, 1, 1, 1, 1, 1,
0.07426303, -0.05484487, 2.568648, 0, 0, 1, 1, 1,
0.07503398, 0.384221, -0.5950025, 1, 0, 0, 1, 1,
0.07646272, -1.24233, 3.149807, 1, 0, 0, 1, 1,
0.07783671, 0.08556285, -0.2926381, 1, 0, 0, 1, 1,
0.08110504, -0.5508041, 3.49313, 1, 0, 0, 1, 1,
0.08297651, -0.7778652, 0.8394765, 1, 0, 0, 1, 1,
0.08365181, -0.2168946, 2.779362, 0, 0, 0, 1, 1,
0.08501971, -1.158952, 4.050691, 0, 0, 0, 1, 1,
0.0864182, 1.313923, -0.4433669, 0, 0, 0, 1, 1,
0.08782649, -1.432184, 0.649571, 0, 0, 0, 1, 1,
0.09167002, 0.5091419, 0.5962834, 0, 0, 0, 1, 1,
0.09462715, -0.8730529, 3.724974, 0, 0, 0, 1, 1,
0.1055553, 0.218497, 0.9614928, 0, 0, 0, 1, 1,
0.1080064, 0.2125267, 0.7226623, 1, 1, 1, 1, 1,
0.1108474, 2.322767, -0.02568432, 1, 1, 1, 1, 1,
0.1145518, 0.2683223, -0.2899845, 1, 1, 1, 1, 1,
0.1164138, -0.5493164, 3.759912, 1, 1, 1, 1, 1,
0.1183706, 0.06326337, 0.8056363, 1, 1, 1, 1, 1,
0.1229453, -1.151604, 1.695179, 1, 1, 1, 1, 1,
0.123653, -0.06509695, 0.8419059, 1, 1, 1, 1, 1,
0.1307591, 0.7231688, -0.5768224, 1, 1, 1, 1, 1,
0.1317935, 0.05555029, 2.629664, 1, 1, 1, 1, 1,
0.1318461, -0.1316886, 2.619631, 1, 1, 1, 1, 1,
0.1327953, -1.188447, 3.071739, 1, 1, 1, 1, 1,
0.1369537, 0.1389656, -0.09732545, 1, 1, 1, 1, 1,
0.1409929, 0.1916909, 2.301353, 1, 1, 1, 1, 1,
0.1416737, 1.110582, 0.4978743, 1, 1, 1, 1, 1,
0.142116, 0.6459848, -0.8753857, 1, 1, 1, 1, 1,
0.1431243, -0.4762788, 2.76238, 0, 0, 1, 1, 1,
0.1461003, -1.641893, 3.479921, 1, 0, 0, 1, 1,
0.1481788, -0.2317326, 1.287996, 1, 0, 0, 1, 1,
0.149528, -1.725145, 3.476575, 1, 0, 0, 1, 1,
0.1513734, 0.7806295, 0.9753077, 1, 0, 0, 1, 1,
0.155277, 0.9212381, -0.653647, 1, 0, 0, 1, 1,
0.1555342, 0.01949732, 1.890824, 0, 0, 0, 1, 1,
0.1599695, 0.8239394, -2.07415, 0, 0, 0, 1, 1,
0.1631427, -0.7397643, 3.083761, 0, 0, 0, 1, 1,
0.1677068, 0.03302719, -0.8185641, 0, 0, 0, 1, 1,
0.1679294, 0.96617, -1.651442, 0, 0, 0, 1, 1,
0.1733563, -1.279342, 4.278619, 0, 0, 0, 1, 1,
0.1771391, -0.8117964, 4.896046, 0, 0, 0, 1, 1,
0.1795105, -1.04862, 2.328985, 1, 1, 1, 1, 1,
0.1817653, -0.5310936, 2.652361, 1, 1, 1, 1, 1,
0.1991781, -0.6370326, 0.5590159, 1, 1, 1, 1, 1,
0.2003024, 0.2994842, -0.1660299, 1, 1, 1, 1, 1,
0.2005108, 1.023187, 1.198241, 1, 1, 1, 1, 1,
0.205129, -1.33463, 3.178218, 1, 1, 1, 1, 1,
0.2053219, 0.1298039, 0.682357, 1, 1, 1, 1, 1,
0.2070083, 0.728654, -1.346857, 1, 1, 1, 1, 1,
0.2071651, 1.203433, 0.5159967, 1, 1, 1, 1, 1,
0.2084541, -1.483633, 2.613147, 1, 1, 1, 1, 1,
0.2087715, -1.571574, 3.458145, 1, 1, 1, 1, 1,
0.2099619, -0.2252731, 2.513289, 1, 1, 1, 1, 1,
0.2163645, 0.6313403, 2.51987, 1, 1, 1, 1, 1,
0.2170649, -0.09985488, 2.665397, 1, 1, 1, 1, 1,
0.2180182, -0.909413, 3.707899, 1, 1, 1, 1, 1,
0.2200553, -0.4927027, 2.484035, 0, 0, 1, 1, 1,
0.2220322, -0.7694719, 1.575363, 1, 0, 0, 1, 1,
0.2227295, -0.1827619, 3.013999, 1, 0, 0, 1, 1,
0.2246447, 0.9620183, 0.4401935, 1, 0, 0, 1, 1,
0.2248745, 1.015202, 1.440641, 1, 0, 0, 1, 1,
0.2262371, -0.2115586, 3.469792, 1, 0, 0, 1, 1,
0.2267038, 0.1506784, 0.4958753, 0, 0, 0, 1, 1,
0.232639, -1.139793, 2.070553, 0, 0, 0, 1, 1,
0.2343432, -0.2616836, 4.175458, 0, 0, 0, 1, 1,
0.2346161, -0.1217992, -0.1303034, 0, 0, 0, 1, 1,
0.2378729, 0.8794357, 0.6334699, 0, 0, 0, 1, 1,
0.2446467, -0.3599665, 0.8536047, 0, 0, 0, 1, 1,
0.2457182, 0.6662598, -0.4006481, 0, 0, 0, 1, 1,
0.2460761, -1.216329, 3.073328, 1, 1, 1, 1, 1,
0.2476803, 0.1699686, 0.1086967, 1, 1, 1, 1, 1,
0.2479816, -1.394418, 2.295229, 1, 1, 1, 1, 1,
0.2481261, 0.08181019, 0.5313287, 1, 1, 1, 1, 1,
0.2491051, 1.091625, 0.4908003, 1, 1, 1, 1, 1,
0.2510524, -2.128949, 3.354398, 1, 1, 1, 1, 1,
0.2519469, 1.289703, 0.5143466, 1, 1, 1, 1, 1,
0.25372, -0.175674, 2.163441, 1, 1, 1, 1, 1,
0.2558899, 0.1407539, 0.9074224, 1, 1, 1, 1, 1,
0.2631318, 1.500734, -0.3699554, 1, 1, 1, 1, 1,
0.2705695, 0.3209032, 1.54465, 1, 1, 1, 1, 1,
0.2713781, -1.148607, 1.739631, 1, 1, 1, 1, 1,
0.2747061, 1.162058, -0.9268104, 1, 1, 1, 1, 1,
0.2776028, 1.012771, 0.3662556, 1, 1, 1, 1, 1,
0.2793454, -1.160305, 3.476531, 1, 1, 1, 1, 1,
0.2812551, 0.1670639, -0.01736725, 0, 0, 1, 1, 1,
0.2855631, 1.004057, -0.4415972, 1, 0, 0, 1, 1,
0.2865202, 1.170927, 0.5921638, 1, 0, 0, 1, 1,
0.2951396, 0.1542092, 3.592487, 1, 0, 0, 1, 1,
0.2963579, 0.001032799, 3.120165, 1, 0, 0, 1, 1,
0.3006357, 1.105155, 1.146621, 1, 0, 0, 1, 1,
0.3033473, 0.03784604, 1.565607, 0, 0, 0, 1, 1,
0.3106816, 0.4978212, 0.9564391, 0, 0, 0, 1, 1,
0.3134849, -0.3963704, 3.410173, 0, 0, 0, 1, 1,
0.3136978, 0.02580515, 0.2042618, 0, 0, 0, 1, 1,
0.3140958, 0.65481, -0.2312729, 0, 0, 0, 1, 1,
0.314293, -1.487862, 2.71823, 0, 0, 0, 1, 1,
0.3189871, -1.897045, 4.928455, 0, 0, 0, 1, 1,
0.3244692, -0.143064, 2.271236, 1, 1, 1, 1, 1,
0.3254278, -0.3588858, 1.613687, 1, 1, 1, 1, 1,
0.3254807, 0.93512, 0.0500525, 1, 1, 1, 1, 1,
0.3278717, 0.8645077, 1.207792, 1, 1, 1, 1, 1,
0.3299115, -0.3920069, 1.462426, 1, 1, 1, 1, 1,
0.3301113, 0.821279, -0.4637499, 1, 1, 1, 1, 1,
0.3346221, 1.228588, -0.6754043, 1, 1, 1, 1, 1,
0.3362579, 0.6823916, -1.104482, 1, 1, 1, 1, 1,
0.354886, -0.3695438, 1.141533, 1, 1, 1, 1, 1,
0.3556812, -0.5854943, 4.906457, 1, 1, 1, 1, 1,
0.3562494, -0.2076574, -0.09274548, 1, 1, 1, 1, 1,
0.3596198, 0.7698265, 0.1437544, 1, 1, 1, 1, 1,
0.3610575, 0.941361, 0.3932858, 1, 1, 1, 1, 1,
0.3610936, 0.4661693, -0.2990504, 1, 1, 1, 1, 1,
0.3616498, 0.2641791, -0.1482248, 1, 1, 1, 1, 1,
0.3617711, -0.8773893, 1.587997, 0, 0, 1, 1, 1,
0.3634511, 0.005855171, 0.8590925, 1, 0, 0, 1, 1,
0.366013, -0.7053774, 2.89681, 1, 0, 0, 1, 1,
0.3717757, -0.9896835, 3.085854, 1, 0, 0, 1, 1,
0.3722574, -0.06049773, 2.130525, 1, 0, 0, 1, 1,
0.3740473, -0.2134978, 0.1085218, 1, 0, 0, 1, 1,
0.3766401, 1.186237, 0.7852014, 0, 0, 0, 1, 1,
0.3795779, 0.333179, 0.06601617, 0, 0, 0, 1, 1,
0.380894, 0.7057101, -1.245047, 0, 0, 0, 1, 1,
0.3859401, -0.779876, 2.866764, 0, 0, 0, 1, 1,
0.3876948, 0.8341115, 1.007386, 0, 0, 0, 1, 1,
0.3972932, 0.2893589, -0.5069606, 0, 0, 0, 1, 1,
0.3995489, 1.01447, 2.12196, 0, 0, 0, 1, 1,
0.4009953, 1.056172, -1.297012, 1, 1, 1, 1, 1,
0.4011774, -0.3588935, 3.359254, 1, 1, 1, 1, 1,
0.4046859, -0.521314, 3.995741, 1, 1, 1, 1, 1,
0.4049963, 0.8856744, 0.2523693, 1, 1, 1, 1, 1,
0.4080628, -0.724672, 3.181008, 1, 1, 1, 1, 1,
0.41616, 0.9211766, 1.33848, 1, 1, 1, 1, 1,
0.4192238, -0.1169519, 1.614251, 1, 1, 1, 1, 1,
0.4198352, -0.01331355, 1.317968, 1, 1, 1, 1, 1,
0.4312315, -1.265255, 3.380005, 1, 1, 1, 1, 1,
0.4319014, 0.6378409, 0.5426618, 1, 1, 1, 1, 1,
0.4320813, 0.4794439, 1.205073, 1, 1, 1, 1, 1,
0.4330385, 0.6848193, 1.361964, 1, 1, 1, 1, 1,
0.4340633, 0.2148626, 4.127672, 1, 1, 1, 1, 1,
0.4492097, 0.2456524, 0.6310706, 1, 1, 1, 1, 1,
0.4498506, 0.8806704, 1.406443, 1, 1, 1, 1, 1,
0.4524269, -0.2101971, 1.783804, 0, 0, 1, 1, 1,
0.461436, 0.2200816, 1.87723, 1, 0, 0, 1, 1,
0.4635509, 0.432111, -0.5055113, 1, 0, 0, 1, 1,
0.4691063, 1.37149, 0.3676194, 1, 0, 0, 1, 1,
0.473424, -0.9586826, 1.784673, 1, 0, 0, 1, 1,
0.4792127, -0.9200348, 2.368671, 1, 0, 0, 1, 1,
0.4795555, 0.6459576, 1.382889, 0, 0, 0, 1, 1,
0.4817619, -0.3552749, 4.290837, 0, 0, 0, 1, 1,
0.4857449, -3.130376, 1.5879, 0, 0, 0, 1, 1,
0.4861326, -0.6200321, 4.007908, 0, 0, 0, 1, 1,
0.4909289, -1.346633, 4.303711, 0, 0, 0, 1, 1,
0.4910542, -1.157896, 0.9403914, 0, 0, 0, 1, 1,
0.4921228, 1.421714, 0.2168865, 0, 0, 0, 1, 1,
0.4931561, -0.04773512, 1.799298, 1, 1, 1, 1, 1,
0.4935666, 0.5419868, 0.3820719, 1, 1, 1, 1, 1,
0.5025849, 0.2369954, -0.4061415, 1, 1, 1, 1, 1,
0.5029771, -0.1393496, 2.567422, 1, 1, 1, 1, 1,
0.5050403, 0.5797003, -0.6982301, 1, 1, 1, 1, 1,
0.517063, 0.2980962, 0.05056432, 1, 1, 1, 1, 1,
0.5173661, -0.8055767, 2.462167, 1, 1, 1, 1, 1,
0.5186553, -0.6594392, 2.199449, 1, 1, 1, 1, 1,
0.5306225, -1.798778, 2.798293, 1, 1, 1, 1, 1,
0.5311975, 0.09153304, 0.3779365, 1, 1, 1, 1, 1,
0.533545, 0.9777257, -0.9367854, 1, 1, 1, 1, 1,
0.5346516, 0.2504533, 1.276341, 1, 1, 1, 1, 1,
0.5348245, 0.4684115, 0.3627053, 1, 1, 1, 1, 1,
0.5355874, 0.2271674, 1.166255, 1, 1, 1, 1, 1,
0.5393773, 1.169124, -0.7920455, 1, 1, 1, 1, 1,
0.5476573, -1.576324, 2.201175, 0, 0, 1, 1, 1,
0.5479798, -0.01942207, 0.3946501, 1, 0, 0, 1, 1,
0.548051, 0.8230785, 1.592595, 1, 0, 0, 1, 1,
0.5512312, 0.5950598, 1.594809, 1, 0, 0, 1, 1,
0.5514296, -0.1403795, 1.513464, 1, 0, 0, 1, 1,
0.5571393, -1.368752, 2.762089, 1, 0, 0, 1, 1,
0.5587841, 0.002670845, -0.02817306, 0, 0, 0, 1, 1,
0.5627378, -1.023394, 3.130855, 0, 0, 0, 1, 1,
0.5629814, 0.9674645, 1.118889, 0, 0, 0, 1, 1,
0.5647355, -0.446423, 4.108416, 0, 0, 0, 1, 1,
0.5657687, -0.5024793, 1.604594, 0, 0, 0, 1, 1,
0.5681492, -0.6535524, 2.279375, 0, 0, 0, 1, 1,
0.5693222, -0.8507855, 3.048499, 0, 0, 0, 1, 1,
0.5702577, 0.3464279, 0.2513388, 1, 1, 1, 1, 1,
0.5724704, -0.2376349, 1.31208, 1, 1, 1, 1, 1,
0.5767626, -1.717797, 4.04348, 1, 1, 1, 1, 1,
0.5776386, -1.069292, 1.13572, 1, 1, 1, 1, 1,
0.5796143, 0.2647524, 0.7484714, 1, 1, 1, 1, 1,
0.5802185, -0.7163772, 3.423318, 1, 1, 1, 1, 1,
0.5822962, 0.539067, -1.310132, 1, 1, 1, 1, 1,
0.5854455, -0.2225318, 1.660484, 1, 1, 1, 1, 1,
0.5919567, 1.412335, 2.382629, 1, 1, 1, 1, 1,
0.5930368, 0.5016944, 0.3596253, 1, 1, 1, 1, 1,
0.6056888, -0.7667866, 3.576385, 1, 1, 1, 1, 1,
0.6080247, 0.1536647, 1.467017, 1, 1, 1, 1, 1,
0.609607, -0.2464661, 0.7445096, 1, 1, 1, 1, 1,
0.6169003, 0.5085235, 1.06682, 1, 1, 1, 1, 1,
0.6180625, 1.862684, -0.7034277, 1, 1, 1, 1, 1,
0.6186293, -0.5812621, 2.125437, 0, 0, 1, 1, 1,
0.6191837, 0.3734521, 0.8837913, 1, 0, 0, 1, 1,
0.6241925, -0.5354262, 2.390547, 1, 0, 0, 1, 1,
0.6274472, 0.1737679, -0.0001768876, 1, 0, 0, 1, 1,
0.6337407, 0.3868982, 1.180224, 1, 0, 0, 1, 1,
0.6353341, 0.2601694, 1.39641, 1, 0, 0, 1, 1,
0.6358366, 1.038499, 0.4157471, 0, 0, 0, 1, 1,
0.642314, -0.09065994, 0.4097998, 0, 0, 0, 1, 1,
0.6585485, -0.481838, 1.633144, 0, 0, 0, 1, 1,
0.6613356, -0.2851774, 3.566975, 0, 0, 0, 1, 1,
0.6619411, -2.385977, 3.147176, 0, 0, 0, 1, 1,
0.664702, 0.6175148, -0.440704, 0, 0, 0, 1, 1,
0.6724989, 0.5533878, 1.962796, 0, 0, 0, 1, 1,
0.6745096, 0.4229594, 0.2120082, 1, 1, 1, 1, 1,
0.6770613, 1.232329, -0.440201, 1, 1, 1, 1, 1,
0.6795245, 0.1434759, -0.01956955, 1, 1, 1, 1, 1,
0.6808277, 0.312827, 1.079163, 1, 1, 1, 1, 1,
0.6954637, -0.8940622, 2.247197, 1, 1, 1, 1, 1,
0.6971449, -1.094275, 3.478476, 1, 1, 1, 1, 1,
0.7069978, 0.4135576, 0.435775, 1, 1, 1, 1, 1,
0.7083283, 1.215541, 0.7285661, 1, 1, 1, 1, 1,
0.7126467, -0.4368142, 1.799272, 1, 1, 1, 1, 1,
0.7132078, 0.7451637, -0.4368606, 1, 1, 1, 1, 1,
0.7154238, -0.2153725, 1.993663, 1, 1, 1, 1, 1,
0.7329503, 0.3062913, 1.34134, 1, 1, 1, 1, 1,
0.7332451, -1.009572, 3.198642, 1, 1, 1, 1, 1,
0.7388835, 0.19975, 0.4656402, 1, 1, 1, 1, 1,
0.7421302, 1.655212, -1.760297, 1, 1, 1, 1, 1,
0.746678, -0.4250695, 2.911891, 0, 0, 1, 1, 1,
0.749852, -0.3249846, 4.129181, 1, 0, 0, 1, 1,
0.7512189, 0.4478062, 0.7599338, 1, 0, 0, 1, 1,
0.7674151, 1.719403, -0.5477993, 1, 0, 0, 1, 1,
0.7699608, 0.334932, 2.05304, 1, 0, 0, 1, 1,
0.7770333, 1.055413, 0.250343, 1, 0, 0, 1, 1,
0.7783265, -0.8658732, 2.449495, 0, 0, 0, 1, 1,
0.7784116, 0.1540745, 1.920947, 0, 0, 0, 1, 1,
0.7801933, -1.078959, 3.439698, 0, 0, 0, 1, 1,
0.7818084, -0.2825364, 0.9755434, 0, 0, 0, 1, 1,
0.7873036, -0.7415689, 1.193077, 0, 0, 0, 1, 1,
0.7887821, 2.17318, 0.9876713, 0, 0, 0, 1, 1,
0.7897155, -1.407454, 3.497949, 0, 0, 0, 1, 1,
0.7915315, 0.3905647, -0.3027651, 1, 1, 1, 1, 1,
0.7941794, -0.5688229, 2.939372, 1, 1, 1, 1, 1,
0.7956764, 0.01964503, 1.999622, 1, 1, 1, 1, 1,
0.7960903, 0.1083299, 1.623227, 1, 1, 1, 1, 1,
0.8040867, -0.6498297, 2.441823, 1, 1, 1, 1, 1,
0.8044041, 0.1946562, 0.1162616, 1, 1, 1, 1, 1,
0.8052592, 1.052999, 2.664845, 1, 1, 1, 1, 1,
0.8062492, 0.1107579, -0.3052163, 1, 1, 1, 1, 1,
0.8155338, 1.146939, 3.190923, 1, 1, 1, 1, 1,
0.8182581, -0.6780729, 1.67833, 1, 1, 1, 1, 1,
0.8197104, 0.5429463, 2.824531, 1, 1, 1, 1, 1,
0.823375, 0.09009725, 3.210879, 1, 1, 1, 1, 1,
0.8307506, 0.2129436, 0.6650697, 1, 1, 1, 1, 1,
0.8375291, -1.557598, 1.20198, 1, 1, 1, 1, 1,
0.8405229, 0.3843701, 2.148438, 1, 1, 1, 1, 1,
0.8452988, 0.419926, 0.8577158, 0, 0, 1, 1, 1,
0.846925, 0.2403339, 2.367221, 1, 0, 0, 1, 1,
0.849089, -0.7530198, 1.89442, 1, 0, 0, 1, 1,
0.8591933, 0.5251434, 1.314822, 1, 0, 0, 1, 1,
0.8609263, -1.248785, 3.590433, 1, 0, 0, 1, 1,
0.8695236, 2.453315, -0.254487, 1, 0, 0, 1, 1,
0.870455, 0.5895336, 0.8908837, 0, 0, 0, 1, 1,
0.8758792, -1.184725, 2.744834, 0, 0, 0, 1, 1,
0.8767405, -0.5800014, 4.424582, 0, 0, 0, 1, 1,
0.8781844, -0.4761651, 4.360799, 0, 0, 0, 1, 1,
0.8844653, 0.08502534, 0.08326776, 0, 0, 0, 1, 1,
0.8875328, -0.07678692, 1.291685, 0, 0, 0, 1, 1,
0.8888054, -0.2724613, 4.758021, 0, 0, 0, 1, 1,
0.8908522, -0.5214455, 2.485839, 1, 1, 1, 1, 1,
0.8956582, 0.3523888, 0.001758632, 1, 1, 1, 1, 1,
0.9057474, -0.6573476, 2.75255, 1, 1, 1, 1, 1,
0.9157358, -0.1241233, -0.05210759, 1, 1, 1, 1, 1,
0.9168769, -0.0627142, 2.198156, 1, 1, 1, 1, 1,
0.9258301, -1.182143, 2.166096, 1, 1, 1, 1, 1,
0.9268895, 1.344939, 0.6288046, 1, 1, 1, 1, 1,
0.9338896, -0.1539547, 2.2903, 1, 1, 1, 1, 1,
0.9351776, 0.222504, 0.9395875, 1, 1, 1, 1, 1,
0.9367074, 1.459412, -0.3403461, 1, 1, 1, 1, 1,
0.9406412, 0.6927525, -0.01451947, 1, 1, 1, 1, 1,
0.9487405, -1.674932, 1.323907, 1, 1, 1, 1, 1,
0.949795, -0.4714818, 2.197076, 1, 1, 1, 1, 1,
0.958029, 1.283415, 0.5005338, 1, 1, 1, 1, 1,
0.9611799, 0.01793143, 1.573085, 1, 1, 1, 1, 1,
0.9702036, 1.486391, 0.5719748, 0, 0, 1, 1, 1,
0.9835347, 0.4565308, 0.171939, 1, 0, 0, 1, 1,
0.9909039, 0.700056, 2.927895, 1, 0, 0, 1, 1,
0.9953935, 0.8213125, 1.604886, 1, 0, 0, 1, 1,
0.996313, 1.685362, 0.5366463, 1, 0, 0, 1, 1,
1.002491, -1.491073, 3.492485, 1, 0, 0, 1, 1,
1.002537, -1.197667, 2.444776, 0, 0, 0, 1, 1,
1.004008, -0.4753951, -0.08272898, 0, 0, 0, 1, 1,
1.005775, 1.776981, 0.4460129, 0, 0, 0, 1, 1,
1.007591, -0.9950749, 2.464225, 0, 0, 0, 1, 1,
1.009069, -0.5051728, 1.163661, 0, 0, 0, 1, 1,
1.012945, 0.1088091, 2.155648, 0, 0, 0, 1, 1,
1.014703, -0.3081268, 1.251343, 0, 0, 0, 1, 1,
1.031469, 1.055015, -0.9325262, 1, 1, 1, 1, 1,
1.032486, -0.1351146, 1.686678, 1, 1, 1, 1, 1,
1.038776, -0.7728895, 3.541509, 1, 1, 1, 1, 1,
1.0596, -1.857628, 2.19515, 1, 1, 1, 1, 1,
1.063314, -1.228037, 1.180557, 1, 1, 1, 1, 1,
1.06657, 1.852794, -0.3829538, 1, 1, 1, 1, 1,
1.070194, 0.9231026, 0.9308392, 1, 1, 1, 1, 1,
1.073085, -0.3280494, 1.379415, 1, 1, 1, 1, 1,
1.077995, -0.796468, 0.3764129, 1, 1, 1, 1, 1,
1.082114, -0.2463142, 2.15564, 1, 1, 1, 1, 1,
1.08379, -0.5894949, 2.391983, 1, 1, 1, 1, 1,
1.084201, -1.18278, 3.596803, 1, 1, 1, 1, 1,
1.094583, -0.07006416, 3.777439, 1, 1, 1, 1, 1,
1.105278, -0.1475869, 1.122348, 1, 1, 1, 1, 1,
1.123971, 1.54848, 1.244179, 1, 1, 1, 1, 1,
1.124413, 0.005423889, 0.9107696, 0, 0, 1, 1, 1,
1.131284, -0.3181996, 1.100136, 1, 0, 0, 1, 1,
1.13525, 0.7131894, 1.731444, 1, 0, 0, 1, 1,
1.15937, -0.4781083, 2.775614, 1, 0, 0, 1, 1,
1.160744, 2.074537, 2.880697, 1, 0, 0, 1, 1,
1.167991, 0.7026637, 0.9504578, 1, 0, 0, 1, 1,
1.170036, -0.8529741, 3.438388, 0, 0, 0, 1, 1,
1.190483, 0.003120144, 2.046706, 0, 0, 0, 1, 1,
1.196174, -0.03507866, 1.612586, 0, 0, 0, 1, 1,
1.199421, 1.563331, 1.599419, 0, 0, 0, 1, 1,
1.20086, 0.8972875, -0.2848634, 0, 0, 0, 1, 1,
1.202038, 1.388381, 0.4873225, 0, 0, 0, 1, 1,
1.206761, -1.458014, 1.708801, 0, 0, 0, 1, 1,
1.211711, -1.209976, 3.74705, 1, 1, 1, 1, 1,
1.215249, -0.962807, 4.11306, 1, 1, 1, 1, 1,
1.221161, -0.5614897, 2.046943, 1, 1, 1, 1, 1,
1.224247, 0.959105, -0.3315417, 1, 1, 1, 1, 1,
1.230434, -1.249593, 1.858757, 1, 1, 1, 1, 1,
1.231022, 2.458268, 0.2382986, 1, 1, 1, 1, 1,
1.242149, -0.1246303, 1.77338, 1, 1, 1, 1, 1,
1.247212, -0.4102583, 1.849754, 1, 1, 1, 1, 1,
1.251746, -1.131545, 1.78873, 1, 1, 1, 1, 1,
1.254138, -0.04721204, 0.9255872, 1, 1, 1, 1, 1,
1.259063, 1.011605, 1.015805, 1, 1, 1, 1, 1,
1.260903, 1.528708, -0.3383794, 1, 1, 1, 1, 1,
1.26647, -0.8795608, 2.906161, 1, 1, 1, 1, 1,
1.267307, 2.540451, 1.168651, 1, 1, 1, 1, 1,
1.268224, 0.5073741, 1.281034, 1, 1, 1, 1, 1,
1.270138, 0.07598621, 1.604614, 0, 0, 1, 1, 1,
1.27281, -0.3599312, 1.176957, 1, 0, 0, 1, 1,
1.275163, -1.527808, 2.224025, 1, 0, 0, 1, 1,
1.281978, -0.003224406, 3.258082, 1, 0, 0, 1, 1,
1.285498, -2.419991, 2.464728, 1, 0, 0, 1, 1,
1.290677, -0.6128049, 1.940185, 1, 0, 0, 1, 1,
1.293654, 0.2039523, 0.9760368, 0, 0, 0, 1, 1,
1.298479, -0.1428531, 3.456652, 0, 0, 0, 1, 1,
1.302503, -0.6466332, 1.796066, 0, 0, 0, 1, 1,
1.331913, 0.7026336, 0.6163346, 0, 0, 0, 1, 1,
1.340519, -2.133927, 2.22979, 0, 0, 0, 1, 1,
1.343302, 0.5509918, 1.968079, 0, 0, 0, 1, 1,
1.358957, 0.8694392, 1.559856, 0, 0, 0, 1, 1,
1.392165, -0.3849786, 1.451878, 1, 1, 1, 1, 1,
1.41508, 1.268804, 0.5569211, 1, 1, 1, 1, 1,
1.416242, 0.5202954, 1.110501, 1, 1, 1, 1, 1,
1.416811, 1.445506, 1.573964, 1, 1, 1, 1, 1,
1.421078, -0.01355246, 2.072248, 1, 1, 1, 1, 1,
1.426124, 0.5527573, 2.123944, 1, 1, 1, 1, 1,
1.438027, 0.6624589, -0.417298, 1, 1, 1, 1, 1,
1.438332, -0.2791055, 3.683631, 1, 1, 1, 1, 1,
1.440071, -0.07687063, 1.696431, 1, 1, 1, 1, 1,
1.442102, 0.2579987, 1.380863, 1, 1, 1, 1, 1,
1.463788, 0.2852889, 0.2555185, 1, 1, 1, 1, 1,
1.497094, -0.492727, 3.728439, 1, 1, 1, 1, 1,
1.509623, -0.7885279, 3.352305, 1, 1, 1, 1, 1,
1.520199, 0.6705642, 1.351727, 1, 1, 1, 1, 1,
1.526111, -0.03265899, -0.3173466, 1, 1, 1, 1, 1,
1.53193, 0.3939264, 2.402689, 0, 0, 1, 1, 1,
1.537657, 0.3637511, 2.407099, 1, 0, 0, 1, 1,
1.549439, -0.7271314, 1.371471, 1, 0, 0, 1, 1,
1.562716, -1.571251, 1.964449, 1, 0, 0, 1, 1,
1.567388, 1.038368, 1.339124, 1, 0, 0, 1, 1,
1.572407, 0.1033162, 2.901314, 1, 0, 0, 1, 1,
1.580329, -0.7770202, 2.706435, 0, 0, 0, 1, 1,
1.583554, 0.622423, 1.052454, 0, 0, 0, 1, 1,
1.590909, 0.5166526, 0.9847372, 0, 0, 0, 1, 1,
1.601818, 0.06662612, 3.09264, 0, 0, 0, 1, 1,
1.604527, -3.207344, 2.479961, 0, 0, 0, 1, 1,
1.612974, 0.7248285, 1.378661, 0, 0, 0, 1, 1,
1.617238, -0.2180061, 0.9045966, 0, 0, 0, 1, 1,
1.62204, 0.2317446, 3.153987, 1, 1, 1, 1, 1,
1.622238, 0.1082301, 3.87892, 1, 1, 1, 1, 1,
1.629794, -0.121496, 3.015178, 1, 1, 1, 1, 1,
1.632375, 1.014746, -0.7834244, 1, 1, 1, 1, 1,
1.632474, 0.01659632, 0.8208807, 1, 1, 1, 1, 1,
1.64571, -1.434356, 1.305163, 1, 1, 1, 1, 1,
1.654369, -0.6140198, 1.838164, 1, 1, 1, 1, 1,
1.65507, -1.355431, 2.691281, 1, 1, 1, 1, 1,
1.66032, 1.874316, 1.856092, 1, 1, 1, 1, 1,
1.667861, -0.8334306, 1.37816, 1, 1, 1, 1, 1,
1.682614, 1.400604, 2.501555, 1, 1, 1, 1, 1,
1.684401, 0.5213873, -0.2598912, 1, 1, 1, 1, 1,
1.686862, -0.05712046, 0.9910895, 1, 1, 1, 1, 1,
1.710226, 0.9657944, 1.91543, 1, 1, 1, 1, 1,
1.719035, -1.740763, 1.931715, 1, 1, 1, 1, 1,
1.721448, -0.3627435, 1.478003, 0, 0, 1, 1, 1,
1.739418, 0.6854271, 1.167513, 1, 0, 0, 1, 1,
1.747566, -1.048685, 2.495877, 1, 0, 0, 1, 1,
1.749277, -0.3049308, 0.9070063, 1, 0, 0, 1, 1,
1.76875, -0.528191, 1.645553, 1, 0, 0, 1, 1,
1.777786, 0.5224692, 1.887163, 1, 0, 0, 1, 1,
1.778396, 0.5835153, 0.8248779, 0, 0, 0, 1, 1,
1.778835, -0.2221646, 0.5787215, 0, 0, 0, 1, 1,
1.786198, -0.210499, 2.264362, 0, 0, 0, 1, 1,
1.796343, -0.4714339, 0.7356963, 0, 0, 0, 1, 1,
1.801086, 0.4755202, 0.1057755, 0, 0, 0, 1, 1,
1.836886, -0.6313773, 4.141222, 0, 0, 0, 1, 1,
1.84659, 0.3865429, 1.639371, 0, 0, 0, 1, 1,
1.847768, -0.3550855, 1.266479, 1, 1, 1, 1, 1,
1.863309, -0.03126056, 2.064555, 1, 1, 1, 1, 1,
1.865065, -0.3152721, -0.4507641, 1, 1, 1, 1, 1,
1.868889, -0.8157763, 0.9534602, 1, 1, 1, 1, 1,
1.878446, 0.7530532, 0.3375199, 1, 1, 1, 1, 1,
1.889399, 0.8006632, 2.675934, 1, 1, 1, 1, 1,
1.891439, -1.497829, 3.591847, 1, 1, 1, 1, 1,
1.896722, -0.2861997, 1.350461, 1, 1, 1, 1, 1,
1.902251, -0.5838899, 2.960672, 1, 1, 1, 1, 1,
1.918084, 1.089583, 1.181119, 1, 1, 1, 1, 1,
1.925416, -1.922564, 0.4301747, 1, 1, 1, 1, 1,
1.938331, 0.5813437, 1.23634, 1, 1, 1, 1, 1,
1.950662, 1.557948, -0.185794, 1, 1, 1, 1, 1,
1.967359, -0.5743178, 1.411107, 1, 1, 1, 1, 1,
1.980706, 1.723018, 2.595987, 1, 1, 1, 1, 1,
2.05067, 0.2449857, 1.945264, 0, 0, 1, 1, 1,
2.053489, -0.6601187, 1.87032, 1, 0, 0, 1, 1,
2.058503, 0.1595143, 0.4440088, 1, 0, 0, 1, 1,
2.068765, 1.220143, 2.406337, 1, 0, 0, 1, 1,
2.145149, -1.043411, 3.249034, 1, 0, 0, 1, 1,
2.161667, 0.4335084, 1.701074, 1, 0, 0, 1, 1,
2.189657, -0.1784122, 4.289807, 0, 0, 0, 1, 1,
2.236246, 0.009455073, 0.4889552, 0, 0, 0, 1, 1,
2.313649, -2.372469, 3.67996, 0, 0, 0, 1, 1,
2.344724, 0.2844139, 1.871333, 0, 0, 0, 1, 1,
2.387121, -1.035217, 1.471594, 0, 0, 0, 1, 1,
2.398509, -0.1921866, 1.592951, 0, 0, 0, 1, 1,
2.422617, -0.8775519, 2.167192, 0, 0, 0, 1, 1,
2.450721, 1.294408, 0.8016906, 1, 1, 1, 1, 1,
2.481715, 0.06724264, 2.499407, 1, 1, 1, 1, 1,
2.508525, -1.49936, 2.191626, 1, 1, 1, 1, 1,
2.535491, 1.27043, 1.109119, 1, 1, 1, 1, 1,
2.646205, 0.2021449, 0.7262944, 1, 1, 1, 1, 1,
2.670432, 0.226474, 0.4452069, 1, 1, 1, 1, 1,
2.790538, 0.6853153, 1.369804, 1, 1, 1, 1, 1
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
var radius = 9.891804;
var distance = 34.74454;
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
mvMatrix.translate( 0.3210452, -0.008430958, 0.8677247 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74454);
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
